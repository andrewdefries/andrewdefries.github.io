---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.886513, 0.3962431, -1.079241, 1, 0, 0, 1,
-2.815952, 1.002608, -1.634986, 1, 0.007843138, 0, 1,
-2.692065, 0.1944272, -1.683338, 1, 0.01176471, 0, 1,
-2.672222, 0.4851863, -3.024997, 1, 0.01960784, 0, 1,
-2.493103, -0.4636557, -1.315418, 1, 0.02352941, 0, 1,
-2.451628, 0.7770885, 0.6207469, 1, 0.03137255, 0, 1,
-2.393188, 1.879491, -1.222224, 1, 0.03529412, 0, 1,
-2.294705, -1.38874, -1.866571, 1, 0.04313726, 0, 1,
-2.291286, -0.9089727, -2.83131, 1, 0.04705882, 0, 1,
-2.279013, 0.034336, -2.760929, 1, 0.05490196, 0, 1,
-2.274602, 1.038817, -0.838686, 1, 0.05882353, 0, 1,
-2.252739, -0.3841436, -1.00808, 1, 0.06666667, 0, 1,
-2.210078, 1.183161, -1.903032, 1, 0.07058824, 0, 1,
-2.170379, -1.035668, -0.3008971, 1, 0.07843138, 0, 1,
-2.154556, 0.5546934, -0.4344738, 1, 0.08235294, 0, 1,
-2.113713, 1.728139, -2.168228, 1, 0.09019608, 0, 1,
-2.09351, 1.389205, -0.5688158, 1, 0.09411765, 0, 1,
-2.067472, 2.476851, 0.09489769, 1, 0.1019608, 0, 1,
-2.061781, 0.5068243, -1.605985, 1, 0.1098039, 0, 1,
-2.043296, -0.4620138, -1.521641, 1, 0.1137255, 0, 1,
-2.038892, -1.451431, -2.614179, 1, 0.1215686, 0, 1,
-2.026634, 0.591447, -2.070264, 1, 0.1254902, 0, 1,
-2.001209, 0.1040577, -1.109071, 1, 0.1333333, 0, 1,
-1.999523, 1.42128, 1.165316, 1, 0.1372549, 0, 1,
-1.986391, 0.9928225, -1.128865, 1, 0.145098, 0, 1,
-1.867904, 1.160896, -2.362181, 1, 0.1490196, 0, 1,
-1.866726, -0.6709326, -2.261872, 1, 0.1568628, 0, 1,
-1.845517, -0.3614694, -1.301859, 1, 0.1607843, 0, 1,
-1.818832, -0.1666986, -2.456703, 1, 0.1686275, 0, 1,
-1.804123, -0.191161, -1.149186, 1, 0.172549, 0, 1,
-1.800663, 0.1639707, 0.1569361, 1, 0.1803922, 0, 1,
-1.797941, 1.857255, -2.45757, 1, 0.1843137, 0, 1,
-1.796723, -1.105627, -2.549711, 1, 0.1921569, 0, 1,
-1.785749, -0.5241514, -1.603628, 1, 0.1960784, 0, 1,
-1.78524, 0.174176, -2.361023, 1, 0.2039216, 0, 1,
-1.77591, 0.282058, -2.235072, 1, 0.2117647, 0, 1,
-1.77075, 0.506922, -0.5673729, 1, 0.2156863, 0, 1,
-1.765977, 0.3992934, -0.9982891, 1, 0.2235294, 0, 1,
-1.762091, 0.6758317, -2.135079, 1, 0.227451, 0, 1,
-1.752898, 1.547445, 0.392013, 1, 0.2352941, 0, 1,
-1.751715, 1.694398, -0.4282993, 1, 0.2392157, 0, 1,
-1.747514, 0.00223755, -1.083588, 1, 0.2470588, 0, 1,
-1.730527, -1.562312, -2.888173, 1, 0.2509804, 0, 1,
-1.693605, -0.1402656, -2.864486, 1, 0.2588235, 0, 1,
-1.649534, -0.4764667, -0.9818269, 1, 0.2627451, 0, 1,
-1.64828, 0.7704315, -1.385159, 1, 0.2705882, 0, 1,
-1.63895, -0.3113973, -1.290148, 1, 0.2745098, 0, 1,
-1.634705, -0.8231436, -3.609341, 1, 0.282353, 0, 1,
-1.623321, 0.2844566, -2.857087, 1, 0.2862745, 0, 1,
-1.620811, 1.633228, 0.2650968, 1, 0.2941177, 0, 1,
-1.615381, -0.7290394, -2.381678, 1, 0.3019608, 0, 1,
-1.614347, -0.2372738, -1.272337, 1, 0.3058824, 0, 1,
-1.598776, 1.398977, 0.1141888, 1, 0.3137255, 0, 1,
-1.595352, -0.4681028, -1.85477, 1, 0.3176471, 0, 1,
-1.593784, 0.5011044, -1.632227, 1, 0.3254902, 0, 1,
-1.584107, -0.9039586, -1.35941, 1, 0.3294118, 0, 1,
-1.58074, 0.758513, -1.361888, 1, 0.3372549, 0, 1,
-1.57155, -0.3101009, -1.51491, 1, 0.3411765, 0, 1,
-1.571156, 0.7508509, -0.6015636, 1, 0.3490196, 0, 1,
-1.568628, -0.4624787, -1.475445, 1, 0.3529412, 0, 1,
-1.568377, -0.1820572, -0.7915922, 1, 0.3607843, 0, 1,
-1.567252, 0.6803036, -1.081796, 1, 0.3647059, 0, 1,
-1.565066, -0.4976299, -1.295491, 1, 0.372549, 0, 1,
-1.556123, 0.9465386, -1.433222, 1, 0.3764706, 0, 1,
-1.545719, -0.6937876, -1.963786, 1, 0.3843137, 0, 1,
-1.514448, 1.210359, -0.2896225, 1, 0.3882353, 0, 1,
-1.51151, 2.195823, 0.6606036, 1, 0.3960784, 0, 1,
-1.508466, -2.298594, -0.6982942, 1, 0.4039216, 0, 1,
-1.505707, -0.05160674, -1.993181, 1, 0.4078431, 0, 1,
-1.505131, 0.5335768, -0.5874785, 1, 0.4156863, 0, 1,
-1.497646, 0.2642491, -2.212256, 1, 0.4196078, 0, 1,
-1.471968, -1.314516, -2.928666, 1, 0.427451, 0, 1,
-1.467893, -0.426843, 0.1585933, 1, 0.4313726, 0, 1,
-1.435017, -0.8137344, -2.116083, 1, 0.4392157, 0, 1,
-1.432322, 1.141109, -0.4200203, 1, 0.4431373, 0, 1,
-1.431364, -0.04765883, -0.6663582, 1, 0.4509804, 0, 1,
-1.418561, 0.4594902, -0.727307, 1, 0.454902, 0, 1,
-1.386985, 0.3838138, -0.1829818, 1, 0.4627451, 0, 1,
-1.386463, 1.836251, -0.6201421, 1, 0.4666667, 0, 1,
-1.384683, 0.3061031, -3.731714, 1, 0.4745098, 0, 1,
-1.380443, -0.5468211, -0.4707363, 1, 0.4784314, 0, 1,
-1.368091, 2.096887, -0.8317536, 1, 0.4862745, 0, 1,
-1.355304, -0.689986, -3.212207, 1, 0.4901961, 0, 1,
-1.350434, -1.341242, -1.751252, 1, 0.4980392, 0, 1,
-1.347886, 1.089789, -0.1749267, 1, 0.5058824, 0, 1,
-1.347689, 1.372588, -0.7847113, 1, 0.509804, 0, 1,
-1.342471, -0.1773378, -1.089269, 1, 0.5176471, 0, 1,
-1.340979, -1.033812, -2.831923, 1, 0.5215687, 0, 1,
-1.331747, -1.037326, -1.889531, 1, 0.5294118, 0, 1,
-1.326226, 0.9912931, -1.797562, 1, 0.5333334, 0, 1,
-1.320149, -1.691084, -2.60304, 1, 0.5411765, 0, 1,
-1.319455, 2.665752, 0.9567046, 1, 0.5450981, 0, 1,
-1.315725, 0.2981193, -1.991553, 1, 0.5529412, 0, 1,
-1.308382, -1.577868, -3.712565, 1, 0.5568628, 0, 1,
-1.300966, 0.03279584, -3.830484, 1, 0.5647059, 0, 1,
-1.296817, -0.01880626, -1.066326, 1, 0.5686275, 0, 1,
-1.283953, 0.08449219, -3.525453, 1, 0.5764706, 0, 1,
-1.263298, 0.2427206, 0.6093091, 1, 0.5803922, 0, 1,
-1.261408, -0.5006601, -0.2773474, 1, 0.5882353, 0, 1,
-1.227257, -0.4553583, -3.938542, 1, 0.5921569, 0, 1,
-1.223604, -0.1821479, -1.638357, 1, 0.6, 0, 1,
-1.22212, 0.597791, 0.4600264, 1, 0.6078432, 0, 1,
-1.219397, -0.8436716, -1.813952, 1, 0.6117647, 0, 1,
-1.208036, -0.4131965, -3.469006, 1, 0.6196079, 0, 1,
-1.207319, -0.2007878, -1.591477, 1, 0.6235294, 0, 1,
-1.202519, 0.7456257, -0.8686904, 1, 0.6313726, 0, 1,
-1.195238, 0.4354986, -2.918602, 1, 0.6352941, 0, 1,
-1.191337, -0.7530715, -2.193455, 1, 0.6431373, 0, 1,
-1.189984, 0.6918042, -1.06006, 1, 0.6470588, 0, 1,
-1.187998, 0.7026946, -0.8307792, 1, 0.654902, 0, 1,
-1.173962, -0.8586159, -3.406315, 1, 0.6588235, 0, 1,
-1.170861, 0.5413301, -3.286723, 1, 0.6666667, 0, 1,
-1.164935, -0.8495228, -1.076585, 1, 0.6705883, 0, 1,
-1.163905, -1.128125, -2.283039, 1, 0.6784314, 0, 1,
-1.16094, 0.8409426, -0.6348531, 1, 0.682353, 0, 1,
-1.160227, -0.3864331, -3.234814, 1, 0.6901961, 0, 1,
-1.151248, -1.314053, -1.91087, 1, 0.6941177, 0, 1,
-1.148029, 0.8349754, -0.9653785, 1, 0.7019608, 0, 1,
-1.147913, -0.6291615, -1.825147, 1, 0.7098039, 0, 1,
-1.142079, 1.403544, -1.085998, 1, 0.7137255, 0, 1,
-1.131572, -0.001629733, -1.376761, 1, 0.7215686, 0, 1,
-1.130191, 1.124475, -1.260794, 1, 0.7254902, 0, 1,
-1.125332, -0.1780339, -2.108725, 1, 0.7333333, 0, 1,
-1.112492, 0.7737605, -1.560117, 1, 0.7372549, 0, 1,
-1.109701, 0.5767148, 0.4492787, 1, 0.7450981, 0, 1,
-1.105101, -1.367851, -2.947647, 1, 0.7490196, 0, 1,
-1.096846, 0.5982607, -1.681805, 1, 0.7568628, 0, 1,
-1.094458, -0.205362, -1.190785, 1, 0.7607843, 0, 1,
-1.087784, -0.6484355, -1.317469, 1, 0.7686275, 0, 1,
-1.087402, 0.1540457, -0.6871437, 1, 0.772549, 0, 1,
-1.077783, -0.8654487, -1.897047, 1, 0.7803922, 0, 1,
-1.052896, 1.454424, 0.1182042, 1, 0.7843137, 0, 1,
-1.046409, 0.2577322, -1.113186, 1, 0.7921569, 0, 1,
-1.042876, -0.4934043, -2.043757, 1, 0.7960784, 0, 1,
-1.03194, -1.09495, -1.640208, 1, 0.8039216, 0, 1,
-1.031233, 0.2615232, -1.064617, 1, 0.8117647, 0, 1,
-1.012395, -0.6849769, -1.540278, 1, 0.8156863, 0, 1,
-1.012281, -1.426819, -3.595056, 1, 0.8235294, 0, 1,
-1.009415, 1.094846, -1.524188, 1, 0.827451, 0, 1,
-1.008505, -0.09655951, -0.6739038, 1, 0.8352941, 0, 1,
-1.007777, 0.2787081, 0.5078075, 1, 0.8392157, 0, 1,
-1.001668, 0.12137, -1.034807, 1, 0.8470588, 0, 1,
-0.9990432, -0.300369, -2.635055, 1, 0.8509804, 0, 1,
-0.993025, 2.14046, -1.087819, 1, 0.8588235, 0, 1,
-0.9827113, 0.01958713, 1.048459, 1, 0.8627451, 0, 1,
-0.9795002, -0.4262011, -0.9037787, 1, 0.8705882, 0, 1,
-0.979439, -0.08138406, -2.814452, 1, 0.8745098, 0, 1,
-0.9793469, -1.425719, -0.0866872, 1, 0.8823529, 0, 1,
-0.9754467, 0.6566645, -0.9872974, 1, 0.8862745, 0, 1,
-0.9740922, -0.5666317, -1.776445, 1, 0.8941177, 0, 1,
-0.9711943, 0.6852008, -1.007219, 1, 0.8980392, 0, 1,
-0.9704171, 0.6973117, -1.915494, 1, 0.9058824, 0, 1,
-0.9703587, -0.9098172, -2.532347, 1, 0.9137255, 0, 1,
-0.9684671, -0.4619411, -2.082539, 1, 0.9176471, 0, 1,
-0.9684412, 1.567291, -1.344619, 1, 0.9254902, 0, 1,
-0.9635242, 0.3367729, -1.65647, 1, 0.9294118, 0, 1,
-0.9615409, -0.379825, -2.384337, 1, 0.9372549, 0, 1,
-0.9605988, -1.390849, -1.194135, 1, 0.9411765, 0, 1,
-0.9478847, -0.1997176, -2.213449, 1, 0.9490196, 0, 1,
-0.9478154, 0.1859616, -1.819477, 1, 0.9529412, 0, 1,
-0.9438434, 0.468699, -0.5540951, 1, 0.9607843, 0, 1,
-0.9413133, -0.01336224, -0.562474, 1, 0.9647059, 0, 1,
-0.9353012, -0.09795793, -0.8342354, 1, 0.972549, 0, 1,
-0.9330602, -0.6568264, -2.816591, 1, 0.9764706, 0, 1,
-0.9290972, 0.8395566, -1.860069, 1, 0.9843137, 0, 1,
-0.9268349, 0.6165938, 0.4826738, 1, 0.9882353, 0, 1,
-0.9261755, 0.2074895, -2.443338, 1, 0.9960784, 0, 1,
-0.9232213, -1.592185, -2.463382, 0.9960784, 1, 0, 1,
-0.9211408, -0.5410784, -2.087468, 0.9921569, 1, 0, 1,
-0.9168977, -1.814623, -1.113058, 0.9843137, 1, 0, 1,
-0.9161345, 0.6755164, -2.320223, 0.9803922, 1, 0, 1,
-0.9150723, 2.067746, -1.069791, 0.972549, 1, 0, 1,
-0.914509, -0.07645277, -0.384115, 0.9686275, 1, 0, 1,
-0.9074922, -0.792488, -1.749949, 0.9607843, 1, 0, 1,
-0.9074666, 0.6176491, -1.190813, 0.9568627, 1, 0, 1,
-0.9051074, 1.483865, -0.7997419, 0.9490196, 1, 0, 1,
-0.904314, -0.1164866, -2.610749, 0.945098, 1, 0, 1,
-0.9030125, 0.3836114, -3.751512, 0.9372549, 1, 0, 1,
-0.9021873, 0.7092736, -1.216508, 0.9333333, 1, 0, 1,
-0.901873, 1.308029, -2.320657, 0.9254902, 1, 0, 1,
-0.8969669, -1.441084, -2.630834, 0.9215686, 1, 0, 1,
-0.8946401, -0.2256896, -2.962281, 0.9137255, 1, 0, 1,
-0.8944035, -0.2780019, -1.608099, 0.9098039, 1, 0, 1,
-0.8898079, 0.6169965, -1.423312, 0.9019608, 1, 0, 1,
-0.8886231, -1.436202, -2.515811, 0.8941177, 1, 0, 1,
-0.8851938, -0.5952351, -3.901962, 0.8901961, 1, 0, 1,
-0.878329, 2.895613, -0.4313399, 0.8823529, 1, 0, 1,
-0.8766573, -2.587179, -0.3037301, 0.8784314, 1, 0, 1,
-0.8741585, 0.2479949, -1.374021, 0.8705882, 1, 0, 1,
-0.870157, -0.2809638, -2.576535, 0.8666667, 1, 0, 1,
-0.8656871, 0.3990762, -1.915992, 0.8588235, 1, 0, 1,
-0.8541225, -0.2872759, -1.549976, 0.854902, 1, 0, 1,
-0.8515369, 0.6746171, -0.9272035, 0.8470588, 1, 0, 1,
-0.8492248, 1.679638, -0.9775196, 0.8431373, 1, 0, 1,
-0.8395899, 0.4544435, -1.359072, 0.8352941, 1, 0, 1,
-0.8351488, -1.592026, -1.235736, 0.8313726, 1, 0, 1,
-0.8319062, -0.4773697, -2.202431, 0.8235294, 1, 0, 1,
-0.8296706, 0.227542, -1.406151, 0.8196079, 1, 0, 1,
-0.8189771, -0.8558347, -2.553991, 0.8117647, 1, 0, 1,
-0.8172758, 0.2469001, -3.473763, 0.8078431, 1, 0, 1,
-0.8066628, 0.5361293, 0.5206193, 0.8, 1, 0, 1,
-0.8013555, -1.158419, -3.120066, 0.7921569, 1, 0, 1,
-0.7985777, -0.5847821, -0.7958139, 0.7882353, 1, 0, 1,
-0.7965848, 1.249392, -1.592822, 0.7803922, 1, 0, 1,
-0.7908689, -1.930408, -0.5590144, 0.7764706, 1, 0, 1,
-0.784033, -0.09734704, -1.427389, 0.7686275, 1, 0, 1,
-0.7839738, -0.6458992, -3.990055, 0.7647059, 1, 0, 1,
-0.7804662, 1.602707, 0.5043186, 0.7568628, 1, 0, 1,
-0.7753783, -0.3366725, -0.3637841, 0.7529412, 1, 0, 1,
-0.7724646, 0.2472871, -2.36236, 0.7450981, 1, 0, 1,
-0.7710487, 0.3166288, -2.226951, 0.7411765, 1, 0, 1,
-0.766179, 0.3964334, -0.4970909, 0.7333333, 1, 0, 1,
-0.762989, 1.898414, 0.05657118, 0.7294118, 1, 0, 1,
-0.7581763, -0.5494599, -2.474275, 0.7215686, 1, 0, 1,
-0.7546799, 0.366446, -0.7777546, 0.7176471, 1, 0, 1,
-0.7515659, -1.581582, -3.130884, 0.7098039, 1, 0, 1,
-0.7497268, 1.347901, -0.5896161, 0.7058824, 1, 0, 1,
-0.7471475, -0.702238, -3.072214, 0.6980392, 1, 0, 1,
-0.7467682, 0.192872, -1.701288, 0.6901961, 1, 0, 1,
-0.7425994, -0.03687241, -1.849551, 0.6862745, 1, 0, 1,
-0.7301423, 0.5369797, -0.283608, 0.6784314, 1, 0, 1,
-0.7261469, -1.83041, -3.326055, 0.6745098, 1, 0, 1,
-0.7256393, 0.4389821, -1.843942, 0.6666667, 1, 0, 1,
-0.7239965, -0.2764544, -2.463699, 0.6627451, 1, 0, 1,
-0.7238351, 0.4948271, -1.207668, 0.654902, 1, 0, 1,
-0.7220874, -0.3201546, -3.63177, 0.6509804, 1, 0, 1,
-0.7193253, -0.3941734, -1.334869, 0.6431373, 1, 0, 1,
-0.7157106, 0.07233685, 0.3702595, 0.6392157, 1, 0, 1,
-0.7071417, 0.6842611, -2.154205, 0.6313726, 1, 0, 1,
-0.7068444, 1.934287, -0.1959197, 0.627451, 1, 0, 1,
-0.7054191, 0.477396, -0.6975302, 0.6196079, 1, 0, 1,
-0.7004886, 1.545823, -0.5835574, 0.6156863, 1, 0, 1,
-0.698363, 0.607063, -1.065943, 0.6078432, 1, 0, 1,
-0.6980263, 1.009837, -1.115356, 0.6039216, 1, 0, 1,
-0.6923653, -1.100715, -3.010815, 0.5960785, 1, 0, 1,
-0.6920242, -2.054662, -1.154029, 0.5882353, 1, 0, 1,
-0.6913894, 0.5991192, -1.148302, 0.5843138, 1, 0, 1,
-0.6893554, -0.08199362, -1.985487, 0.5764706, 1, 0, 1,
-0.6866841, 0.6053718, -0.177733, 0.572549, 1, 0, 1,
-0.6803561, 0.3703197, 0.01147146, 0.5647059, 1, 0, 1,
-0.6785942, 0.53421, -1.31283, 0.5607843, 1, 0, 1,
-0.6773257, -0.3224172, -1.910589, 0.5529412, 1, 0, 1,
-0.6758562, -1.236222, -3.879648, 0.5490196, 1, 0, 1,
-0.6650399, -0.2466561, -1.771281, 0.5411765, 1, 0, 1,
-0.661132, 0.04422376, -2.471568, 0.5372549, 1, 0, 1,
-0.6576332, 0.9634989, -1.314074, 0.5294118, 1, 0, 1,
-0.6575988, 0.4350203, -3.69526, 0.5254902, 1, 0, 1,
-0.6531771, -1.264414, -3.309763, 0.5176471, 1, 0, 1,
-0.6482549, 1.874165, 0.1137008, 0.5137255, 1, 0, 1,
-0.6428674, -0.4656887, -0.9324818, 0.5058824, 1, 0, 1,
-0.6371962, -0.6589093, -1.767715, 0.5019608, 1, 0, 1,
-0.6355855, 0.04570733, -1.807776, 0.4941176, 1, 0, 1,
-0.6346088, 0.7773328, 0.1249112, 0.4862745, 1, 0, 1,
-0.6336567, 0.5776015, -1.009891, 0.4823529, 1, 0, 1,
-0.6328634, -0.3497221, -2.237428, 0.4745098, 1, 0, 1,
-0.6325137, 1.444218, -0.244139, 0.4705882, 1, 0, 1,
-0.6313083, 0.3938986, -1.68534, 0.4627451, 1, 0, 1,
-0.6266523, 0.5663366, -1.12544, 0.4588235, 1, 0, 1,
-0.6248593, -1.15299, -4.528039, 0.4509804, 1, 0, 1,
-0.6198823, -0.7263758, -2.36153, 0.4470588, 1, 0, 1,
-0.6194163, 0.8149005, 0.192747, 0.4392157, 1, 0, 1,
-0.6181464, -1.516213, -3.544883, 0.4352941, 1, 0, 1,
-0.616318, -1.283327, -4.495233, 0.427451, 1, 0, 1,
-0.6136217, -0.2995974, -2.62857, 0.4235294, 1, 0, 1,
-0.6123527, -1.233573, -2.561092, 0.4156863, 1, 0, 1,
-0.6098215, 0.1431428, -0.5896313, 0.4117647, 1, 0, 1,
-0.6070363, 0.1968447, 1.288854, 0.4039216, 1, 0, 1,
-0.6040808, 0.3501715, -0.5847699, 0.3960784, 1, 0, 1,
-0.6022942, 1.109846, -1.127731, 0.3921569, 1, 0, 1,
-0.601487, -0.4468994, -1.181875, 0.3843137, 1, 0, 1,
-0.6008207, -1.155338, -2.376066, 0.3803922, 1, 0, 1,
-0.5987581, -0.106004, -1.819987, 0.372549, 1, 0, 1,
-0.5939081, -0.7607237, -1.381829, 0.3686275, 1, 0, 1,
-0.58895, 0.5417391, -1.407461, 0.3607843, 1, 0, 1,
-0.5865638, -0.295505, -0.3264056, 0.3568628, 1, 0, 1,
-0.5861475, -1.372376, -0.435461, 0.3490196, 1, 0, 1,
-0.5847167, 0.6353618, -1.597249, 0.345098, 1, 0, 1,
-0.5801468, -0.1345435, -1.517586, 0.3372549, 1, 0, 1,
-0.5788757, 1.500915, -0.1176406, 0.3333333, 1, 0, 1,
-0.5772645, 0.6491189, 2.296437, 0.3254902, 1, 0, 1,
-0.5738222, 0.5948821, -1.677387, 0.3215686, 1, 0, 1,
-0.5674164, -0.848397, -4.55297, 0.3137255, 1, 0, 1,
-0.5672822, 2.334655, -0.1252263, 0.3098039, 1, 0, 1,
-0.566863, -0.2626131, -2.99252, 0.3019608, 1, 0, 1,
-0.5554262, -0.7189812, -3.020547, 0.2941177, 1, 0, 1,
-0.5545751, -0.226623, -2.388783, 0.2901961, 1, 0, 1,
-0.5543361, -0.9534216, -3.28844, 0.282353, 1, 0, 1,
-0.5535433, 0.6618159, -2.095464, 0.2784314, 1, 0, 1,
-0.5499963, -0.2372389, -0.4218899, 0.2705882, 1, 0, 1,
-0.548902, -0.1082742, -2.289244, 0.2666667, 1, 0, 1,
-0.5459812, -1.309911, -3.506165, 0.2588235, 1, 0, 1,
-0.5456974, 0.5483404, 1.520289, 0.254902, 1, 0, 1,
-0.5380601, -1.220595, -1.640969, 0.2470588, 1, 0, 1,
-0.5288236, 1.327984, -0.8475797, 0.2431373, 1, 0, 1,
-0.527863, 0.7984819, -0.05084489, 0.2352941, 1, 0, 1,
-0.5209337, -0.5915736, -1.556812, 0.2313726, 1, 0, 1,
-0.5207512, -0.5100727, -3.035806, 0.2235294, 1, 0, 1,
-0.5190527, 0.1484206, -0.09925631, 0.2196078, 1, 0, 1,
-0.516566, 0.5548189, -0.9257545, 0.2117647, 1, 0, 1,
-0.5137045, 1.128598, 0.04172977, 0.2078431, 1, 0, 1,
-0.5117701, -0.1916279, -0.9898816, 0.2, 1, 0, 1,
-0.5101231, -1.320119, -1.979821, 0.1921569, 1, 0, 1,
-0.5076501, -1.936767, -3.345495, 0.1882353, 1, 0, 1,
-0.5049545, -0.329899, -2.270419, 0.1803922, 1, 0, 1,
-0.5027273, 0.5775781, 0.8267113, 0.1764706, 1, 0, 1,
-0.5003321, 1.272974, -1.938944, 0.1686275, 1, 0, 1,
-0.4982984, 0.8362002, -1.691093, 0.1647059, 1, 0, 1,
-0.4862669, -2.041286, -2.63384, 0.1568628, 1, 0, 1,
-0.4860026, -1.476985, -3.984137, 0.1529412, 1, 0, 1,
-0.4798907, -0.06298176, -1.511625, 0.145098, 1, 0, 1,
-0.4782608, -0.9450567, -2.888239, 0.1411765, 1, 0, 1,
-0.4752188, 0.6161892, -1.584989, 0.1333333, 1, 0, 1,
-0.4720212, 0.5015977, -0.4872224, 0.1294118, 1, 0, 1,
-0.4687822, -1.550345, -3.023246, 0.1215686, 1, 0, 1,
-0.4673708, -0.3307192, -2.43304, 0.1176471, 1, 0, 1,
-0.4612093, 1.403518, -0.1796823, 0.1098039, 1, 0, 1,
-0.45724, -1.470432, -1.497036, 0.1058824, 1, 0, 1,
-0.4563057, -0.6387444, -2.217728, 0.09803922, 1, 0, 1,
-0.4541234, -0.568731, -2.681572, 0.09019608, 1, 0, 1,
-0.4533172, -0.04961598, -2.302537, 0.08627451, 1, 0, 1,
-0.4517743, 0.4491319, -0.9661692, 0.07843138, 1, 0, 1,
-0.4501247, 2.385592, -0.9572654, 0.07450981, 1, 0, 1,
-0.4484164, 0.8874226, -1.751773, 0.06666667, 1, 0, 1,
-0.4460371, 0.05876434, -1.263529, 0.0627451, 1, 0, 1,
-0.4429041, -0.5351214, -1.496618, 0.05490196, 1, 0, 1,
-0.4400581, 1.000141, -1.256065, 0.05098039, 1, 0, 1,
-0.4368771, 0.4385617, -0.9451374, 0.04313726, 1, 0, 1,
-0.4359931, 1.679303, 0.1093644, 0.03921569, 1, 0, 1,
-0.4349666, 0.3343992, -1.284606, 0.03137255, 1, 0, 1,
-0.4342744, 0.6130801, -0.009902013, 0.02745098, 1, 0, 1,
-0.4322663, 0.2407208, -1.897335, 0.01960784, 1, 0, 1,
-0.4305022, -0.5827764, -2.147646, 0.01568628, 1, 0, 1,
-0.4279399, 0.9732452, -0.529625, 0.007843138, 1, 0, 1,
-0.4212553, -0.06627169, 0.01581009, 0.003921569, 1, 0, 1,
-0.4167029, -0.9576933, -2.749844, 0, 1, 0.003921569, 1,
-0.4158397, -1.286602, -3.799158, 0, 1, 0.01176471, 1,
-0.4096649, 0.8316565, 0.6721855, 0, 1, 0.01568628, 1,
-0.4061866, -0.3058314, -2.448303, 0, 1, 0.02352941, 1,
-0.4052953, 0.6517314, 1.18359, 0, 1, 0.02745098, 1,
-0.4034054, -1.343045, -3.288216, 0, 1, 0.03529412, 1,
-0.4030778, -1.77425, -3.400175, 0, 1, 0.03921569, 1,
-0.3949997, 0.4863996, -1.026025, 0, 1, 0.04705882, 1,
-0.3949036, 0.1353827, -2.346526, 0, 1, 0.05098039, 1,
-0.3768541, 1.243907, -0.9434556, 0, 1, 0.05882353, 1,
-0.3706179, -0.4831192, -2.365186, 0, 1, 0.0627451, 1,
-0.3696015, -0.1743806, -3.877037, 0, 1, 0.07058824, 1,
-0.3683524, -1.597947, -2.157332, 0, 1, 0.07450981, 1,
-0.3654838, -0.3245206, -2.761731, 0, 1, 0.08235294, 1,
-0.3635996, 0.3015216, 0.3405659, 0, 1, 0.08627451, 1,
-0.3608024, 1.702801, 0.003323046, 0, 1, 0.09411765, 1,
-0.3601382, -1.329593, -3.855586, 0, 1, 0.1019608, 1,
-0.3494004, -0.2495824, -0.8396881, 0, 1, 0.1058824, 1,
-0.3394715, 0.9989198, -0.279677, 0, 1, 0.1137255, 1,
-0.3382472, 0.9612638, -0.5409853, 0, 1, 0.1176471, 1,
-0.3372684, -0.1313613, -3.559917, 0, 1, 0.1254902, 1,
-0.3366765, 1.075065, -0.1893521, 0, 1, 0.1294118, 1,
-0.3353634, -1.211045, -3.771415, 0, 1, 0.1372549, 1,
-0.3349656, -0.5553416, -2.025283, 0, 1, 0.1411765, 1,
-0.3342427, 0.5496367, 0.3188914, 0, 1, 0.1490196, 1,
-0.3289085, -0.272949, -1.874352, 0, 1, 0.1529412, 1,
-0.3159207, 1.336862, -0.5308851, 0, 1, 0.1607843, 1,
-0.3150822, 1.786102, 0.3450685, 0, 1, 0.1647059, 1,
-0.313227, -1.111579, -3.556634, 0, 1, 0.172549, 1,
-0.3128549, 2.294271, 0.1105965, 0, 1, 0.1764706, 1,
-0.3057414, 1.321561, -1.014081, 0, 1, 0.1843137, 1,
-0.2985947, -1.245818, -3.085109, 0, 1, 0.1882353, 1,
-0.2983568, -0.09663075, -2.034839, 0, 1, 0.1960784, 1,
-0.2964132, -0.3648756, -3.595963, 0, 1, 0.2039216, 1,
-0.29353, 0.95652, -0.4632555, 0, 1, 0.2078431, 1,
-0.2933993, 0.03292268, -1.650431, 0, 1, 0.2156863, 1,
-0.2928032, -0.09523941, 0.4002864, 0, 1, 0.2196078, 1,
-0.2917961, -1.615438, -3.19042, 0, 1, 0.227451, 1,
-0.2892236, -0.9629438, -3.543117, 0, 1, 0.2313726, 1,
-0.2813793, -0.4453097, -2.923317, 0, 1, 0.2392157, 1,
-0.2776855, -0.825754, -2.253428, 0, 1, 0.2431373, 1,
-0.2772589, -0.5258512, -1.892957, 0, 1, 0.2509804, 1,
-0.2762848, -0.589823, -2.099397, 0, 1, 0.254902, 1,
-0.270775, -0.5818054, -1.08842, 0, 1, 0.2627451, 1,
-0.2705751, -0.3244689, -1.960715, 0, 1, 0.2666667, 1,
-0.2701632, -0.2953284, -2.279308, 0, 1, 0.2745098, 1,
-0.2640105, -0.2375365, -2.338324, 0, 1, 0.2784314, 1,
-0.2623708, 0.7155396, 0.8946313, 0, 1, 0.2862745, 1,
-0.2623364, -0.07884037, -1.870028, 0, 1, 0.2901961, 1,
-0.2622918, -0.06141862, -4.351375, 0, 1, 0.2980392, 1,
-0.2595768, 0.6566246, 0.3404113, 0, 1, 0.3058824, 1,
-0.2536221, 0.6316491, 0.1905084, 0, 1, 0.3098039, 1,
-0.253464, -0.007404618, -1.457106, 0, 1, 0.3176471, 1,
-0.2528637, -2.567406, -1.398159, 0, 1, 0.3215686, 1,
-0.252225, 0.1241924, 0.4658793, 0, 1, 0.3294118, 1,
-0.2485399, 1.538417, 1.962844, 0, 1, 0.3333333, 1,
-0.2468197, -1.328449, -3.431661, 0, 1, 0.3411765, 1,
-0.2443183, -1.869634, -3.442562, 0, 1, 0.345098, 1,
-0.2439139, 0.5316873, -1.431249, 0, 1, 0.3529412, 1,
-0.2407411, -1.113733, -1.949365, 0, 1, 0.3568628, 1,
-0.2386587, 1.175044, 0.9051544, 0, 1, 0.3647059, 1,
-0.2381302, -1.129985, -4.360769, 0, 1, 0.3686275, 1,
-0.2367566, 1.835272, -1.276658, 0, 1, 0.3764706, 1,
-0.2302706, 2.414319, -2.080996, 0, 1, 0.3803922, 1,
-0.2260003, 0.4398564, -0.3088546, 0, 1, 0.3882353, 1,
-0.221412, 0.1023413, -0.2616936, 0, 1, 0.3921569, 1,
-0.221096, 0.8201934, 0.03692035, 0, 1, 0.4, 1,
-0.2193115, 0.2772678, -2.633902, 0, 1, 0.4078431, 1,
-0.2129436, -0.6492317, -3.520336, 0, 1, 0.4117647, 1,
-0.208229, 0.7594083, -0.2063369, 0, 1, 0.4196078, 1,
-0.1992127, -0.02892334, -0.900955, 0, 1, 0.4235294, 1,
-0.1986628, -0.6075602, -2.942924, 0, 1, 0.4313726, 1,
-0.1965513, -0.05513742, -1.825808, 0, 1, 0.4352941, 1,
-0.1945741, 0.3800774, 0.09018394, 0, 1, 0.4431373, 1,
-0.1944574, -0.2571234, -4.265989, 0, 1, 0.4470588, 1,
-0.192754, 0.6644055, -0.1954298, 0, 1, 0.454902, 1,
-0.1907069, 1.612098, -0.3721668, 0, 1, 0.4588235, 1,
-0.1895144, -0.2277569, -1.697492, 0, 1, 0.4666667, 1,
-0.1807337, -1.81941, -4.095356, 0, 1, 0.4705882, 1,
-0.1793924, -0.6440945, -2.893633, 0, 1, 0.4784314, 1,
-0.1779971, 1.715183, 0.3836991, 0, 1, 0.4823529, 1,
-0.1777688, -0.3046282, -1.430187, 0, 1, 0.4901961, 1,
-0.175977, -2.209004, -3.742463, 0, 1, 0.4941176, 1,
-0.175556, 0.148434, -0.569852, 0, 1, 0.5019608, 1,
-0.1746559, 1.462903, 0.4493561, 0, 1, 0.509804, 1,
-0.1743229, -1.01245, -1.889945, 0, 1, 0.5137255, 1,
-0.1740804, 0.9357395, -0.8099681, 0, 1, 0.5215687, 1,
-0.1732171, -2.145046, -3.722046, 0, 1, 0.5254902, 1,
-0.1712897, -0.2784465, -2.134888, 0, 1, 0.5333334, 1,
-0.1706189, -1.191807, -2.619865, 0, 1, 0.5372549, 1,
-0.1669731, -0.165141, -2.934831, 0, 1, 0.5450981, 1,
-0.1643598, -1.162382, -3.472271, 0, 1, 0.5490196, 1,
-0.1624216, 0.1203129, -0.8558068, 0, 1, 0.5568628, 1,
-0.1621493, -0.04720763, -3.600219, 0, 1, 0.5607843, 1,
-0.1609592, 0.4030104, -3.060596, 0, 1, 0.5686275, 1,
-0.1556597, 1.400305, -2.121209, 0, 1, 0.572549, 1,
-0.1554113, 2.094609, -0.2625961, 0, 1, 0.5803922, 1,
-0.1538472, 0.6970131, -0.7223268, 0, 1, 0.5843138, 1,
-0.1532207, 0.05439052, -0.1037015, 0, 1, 0.5921569, 1,
-0.1464809, -0.8332688, -2.343549, 0, 1, 0.5960785, 1,
-0.1442516, 0.2034563, -0.4163937, 0, 1, 0.6039216, 1,
-0.143906, 0.3027982, -1.939708, 0, 1, 0.6117647, 1,
-0.1432841, 0.5528014, 0.7873673, 0, 1, 0.6156863, 1,
-0.1418824, -0.3217393, -3.971998, 0, 1, 0.6235294, 1,
-0.1379127, -0.5683482, -2.990647, 0, 1, 0.627451, 1,
-0.1370827, 2.16435, -1.386372, 0, 1, 0.6352941, 1,
-0.1350309, 0.4811682, -1.275373, 0, 1, 0.6392157, 1,
-0.1321244, -0.1692267, -1.477894, 0, 1, 0.6470588, 1,
-0.1269681, 0.6496221, -0.2501727, 0, 1, 0.6509804, 1,
-0.1214083, -1.619702, -1.906987, 0, 1, 0.6588235, 1,
-0.1208631, 1.565769, -0.06395999, 0, 1, 0.6627451, 1,
-0.1149736, 0.1830118, 0.4184603, 0, 1, 0.6705883, 1,
-0.108891, -0.08801966, -3.269902, 0, 1, 0.6745098, 1,
-0.102217, -0.4965561, -1.406202, 0, 1, 0.682353, 1,
-0.09771919, 1.151575, -0.5067003, 0, 1, 0.6862745, 1,
-0.09664737, -2.00929, -3.238986, 0, 1, 0.6941177, 1,
-0.09115602, -2.25034, -2.328585, 0, 1, 0.7019608, 1,
-0.08993681, 2.200428, 0.7647195, 0, 1, 0.7058824, 1,
-0.08849402, 0.5201489, -0.1633794, 0, 1, 0.7137255, 1,
-0.08837931, 0.7422788, -1.934198, 0, 1, 0.7176471, 1,
-0.08735783, 2.839678, -0.6561261, 0, 1, 0.7254902, 1,
-0.0859613, 1.675338, 0.2649905, 0, 1, 0.7294118, 1,
-0.0856439, 1.589668, -0.2793385, 0, 1, 0.7372549, 1,
-0.08329811, 0.8780481, 0.2743324, 0, 1, 0.7411765, 1,
-0.08188476, -1.083011, -2.527004, 0, 1, 0.7490196, 1,
-0.07827539, -0.7065043, -4.002931, 0, 1, 0.7529412, 1,
-0.07785356, 0.4973903, 0.1040507, 0, 1, 0.7607843, 1,
-0.07781909, 0.6729361, -1.703758, 0, 1, 0.7647059, 1,
-0.07718994, 0.4498814, -0.4300817, 0, 1, 0.772549, 1,
-0.07561909, -1.023364, -3.724634, 0, 1, 0.7764706, 1,
-0.07354953, 0.7488266, -0.8589197, 0, 1, 0.7843137, 1,
-0.07123071, 0.8217927, -2.210252, 0, 1, 0.7882353, 1,
-0.06286441, 1.001212, 1.497498, 0, 1, 0.7960784, 1,
-0.058832, 0.723411, 0.7585573, 0, 1, 0.8039216, 1,
-0.05882355, -0.847378, -3.114597, 0, 1, 0.8078431, 1,
-0.05755345, -0.1711888, -1.248674, 0, 1, 0.8156863, 1,
-0.05190198, -0.1942061, -1.98578, 0, 1, 0.8196079, 1,
-0.04944703, -1.069019, -2.242988, 0, 1, 0.827451, 1,
-0.04459474, -0.7947156, -2.925387, 0, 1, 0.8313726, 1,
-0.04398471, 0.7357246, -2.325687, 0, 1, 0.8392157, 1,
-0.04167605, -1.277169, -3.159611, 0, 1, 0.8431373, 1,
-0.04117639, -1.316346, -4.019692, 0, 1, 0.8509804, 1,
-0.04072185, 1.490269, -0.5906869, 0, 1, 0.854902, 1,
-0.03975344, 0.6252707, -0.552331, 0, 1, 0.8627451, 1,
-0.03758061, 1.008586, 0.7044917, 0, 1, 0.8666667, 1,
-0.03619599, 1.672372, 0.01324286, 0, 1, 0.8745098, 1,
-0.03490012, 0.3260468, 0.3381878, 0, 1, 0.8784314, 1,
-0.0331192, 0.6382252, -0.8302498, 0, 1, 0.8862745, 1,
-0.03277737, -0.3660749, -1.832568, 0, 1, 0.8901961, 1,
-0.0270286, 0.9660636, -0.7339537, 0, 1, 0.8980392, 1,
-0.02308557, -0.4678831, -3.650369, 0, 1, 0.9058824, 1,
-0.02223834, 0.6026021, 0.6981068, 0, 1, 0.9098039, 1,
-0.021541, 0.009806527, -0.5646261, 0, 1, 0.9176471, 1,
-0.02151229, 1.950858, -1.299988, 0, 1, 0.9215686, 1,
-0.01370015, 1.001961, 1.684726, 0, 1, 0.9294118, 1,
-0.01151795, 0.3317321, -0.8548642, 0, 1, 0.9333333, 1,
-0.01128393, -1.055205, -3.858485, 0, 1, 0.9411765, 1,
-0.01083491, 0.5810299, -0.9956465, 0, 1, 0.945098, 1,
-0.006988265, 0.6693301, 0.8153228, 0, 1, 0.9529412, 1,
-0.004644716, 1.281053, -1.010447, 0, 1, 0.9568627, 1,
-0.002181519, -0.7067985, -3.549572, 0, 1, 0.9647059, 1,
-0.001980733, -2.348772, -2.932609, 0, 1, 0.9686275, 1,
0.004908899, 1.557379, -0.00976689, 0, 1, 0.9764706, 1,
0.005677441, -0.3635852, 0.6402119, 0, 1, 0.9803922, 1,
0.00574904, 1.246773, 0.09490106, 0, 1, 0.9882353, 1,
0.006969617, -0.205917, 3.367087, 0, 1, 0.9921569, 1,
0.007319789, -0.7424964, 3.340016, 0, 1, 1, 1,
0.00748193, -1.085871, 0.8778934, 0, 0.9921569, 1, 1,
0.009698425, -0.02323336, 1.943937, 0, 0.9882353, 1, 1,
0.01247599, -1.522778, 3.548416, 0, 0.9803922, 1, 1,
0.01464228, 0.6618041, 0.2972386, 0, 0.9764706, 1, 1,
0.02000452, -0.1323846, 2.619756, 0, 0.9686275, 1, 1,
0.02344565, -0.957185, 1.684943, 0, 0.9647059, 1, 1,
0.02567926, 0.1422799, -0.5425496, 0, 0.9568627, 1, 1,
0.02651683, 0.4647094, 0.1288452, 0, 0.9529412, 1, 1,
0.03032528, 0.7038351, -1.785484, 0, 0.945098, 1, 1,
0.03086234, -0.4833399, 4.630436, 0, 0.9411765, 1, 1,
0.03155119, -2.434489, 3.387602, 0, 0.9333333, 1, 1,
0.03233282, 1.526564, -0.2019565, 0, 0.9294118, 1, 1,
0.03505598, -0.6173947, 4.353576, 0, 0.9215686, 1, 1,
0.03623918, 1.034746, 0.6142163, 0, 0.9176471, 1, 1,
0.03751417, -1.118018, 2.603057, 0, 0.9098039, 1, 1,
0.04278702, -0.108293, 2.366065, 0, 0.9058824, 1, 1,
0.04933518, -1.811496, 2.753688, 0, 0.8980392, 1, 1,
0.05076076, 0.1700162, 1.025435, 0, 0.8901961, 1, 1,
0.0562364, 2.488431, 1.823126, 0, 0.8862745, 1, 1,
0.06297234, 0.3634496, 0.4693709, 0, 0.8784314, 1, 1,
0.06832296, 1.23875, 1.607791, 0, 0.8745098, 1, 1,
0.06923985, -0.7898303, 3.649068, 0, 0.8666667, 1, 1,
0.07228797, 0.5810996, -0.4631857, 0, 0.8627451, 1, 1,
0.07506191, -1.701992, 5.114637, 0, 0.854902, 1, 1,
0.07624275, 1.176749, -0.1277454, 0, 0.8509804, 1, 1,
0.07717653, 0.3365478, -0.146595, 0, 0.8431373, 1, 1,
0.07755385, 1.805214, -0.6934564, 0, 0.8392157, 1, 1,
0.07952231, -0.6338434, 3.97177, 0, 0.8313726, 1, 1,
0.08344774, -0.792877, 3.456761, 0, 0.827451, 1, 1,
0.08511042, -0.2262288, 2.538558, 0, 0.8196079, 1, 1,
0.08947425, -1.410033, 3.125046, 0, 0.8156863, 1, 1,
0.09022937, 0.4525609, -0.5907614, 0, 0.8078431, 1, 1,
0.092071, 2.09598, -2.034856, 0, 0.8039216, 1, 1,
0.09348607, -0.280809, 2.397389, 0, 0.7960784, 1, 1,
0.09389041, -0.5817812, 2.654888, 0, 0.7882353, 1, 1,
0.09717136, 0.3561064, -1.593699, 0, 0.7843137, 1, 1,
0.09752283, 0.908519, -1.131768, 0, 0.7764706, 1, 1,
0.101704, 0.4919071, -0.6365578, 0, 0.772549, 1, 1,
0.1018402, 0.3203513, 2.105989, 0, 0.7647059, 1, 1,
0.1097555, 0.3795305, -1.192636, 0, 0.7607843, 1, 1,
0.1114084, -0.3458627, 3.40188, 0, 0.7529412, 1, 1,
0.1123268, 1.40774, 1.420137, 0, 0.7490196, 1, 1,
0.1144471, 1.18089, -0.4631425, 0, 0.7411765, 1, 1,
0.1157994, -0.1537007, 3.329329, 0, 0.7372549, 1, 1,
0.1160934, -0.5625088, 1.983656, 0, 0.7294118, 1, 1,
0.1172, -0.5125159, 2.382805, 0, 0.7254902, 1, 1,
0.1182731, 0.5966381, -0.09517199, 0, 0.7176471, 1, 1,
0.1186961, 0.05656352, 2.683422, 0, 0.7137255, 1, 1,
0.1215761, -0.4416724, 3.408426, 0, 0.7058824, 1, 1,
0.1218536, -0.03661772, 0.9726937, 0, 0.6980392, 1, 1,
0.1245478, -0.6642917, 2.71363, 0, 0.6941177, 1, 1,
0.1321434, -0.04029832, 1.951782, 0, 0.6862745, 1, 1,
0.1330178, 2.028027, -0.343078, 0, 0.682353, 1, 1,
0.1356518, -0.6745604, 3.053152, 0, 0.6745098, 1, 1,
0.1368655, 0.3647647, -0.6387948, 0, 0.6705883, 1, 1,
0.13833, -0.2148402, 2.91627, 0, 0.6627451, 1, 1,
0.1390737, 0.550359, -0.909484, 0, 0.6588235, 1, 1,
0.1416397, -2.38407, 3.364138, 0, 0.6509804, 1, 1,
0.1422316, 1.327435, 1.841842, 0, 0.6470588, 1, 1,
0.1425041, 0.8537958, 1.891927, 0, 0.6392157, 1, 1,
0.1427162, -1.972743, 2.699744, 0, 0.6352941, 1, 1,
0.1434621, 1.03846, 0.7356699, 0, 0.627451, 1, 1,
0.1446545, 1.800315, -2.18046, 0, 0.6235294, 1, 1,
0.1533714, -1.317725, 3.250143, 0, 0.6156863, 1, 1,
0.1586783, 0.666689, 1.442041, 0, 0.6117647, 1, 1,
0.1627691, -0.3493866, 4.454114, 0, 0.6039216, 1, 1,
0.1677299, 0.4333135, -0.6304812, 0, 0.5960785, 1, 1,
0.1708992, -0.8503793, 3.122959, 0, 0.5921569, 1, 1,
0.1742521, -0.3026441, 2.118546, 0, 0.5843138, 1, 1,
0.1747508, -0.9764304, 1.872413, 0, 0.5803922, 1, 1,
0.1793086, 0.9731312, 0.0590894, 0, 0.572549, 1, 1,
0.1797839, 0.7350438, -1.478881, 0, 0.5686275, 1, 1,
0.1812976, 0.6154479, 0.7641157, 0, 0.5607843, 1, 1,
0.1822174, 1.647263, 0.2789953, 0, 0.5568628, 1, 1,
0.1845506, -0.7405198, 2.364394, 0, 0.5490196, 1, 1,
0.1846163, 0.4459157, -0.7611089, 0, 0.5450981, 1, 1,
0.1850556, -0.7889081, 2.909784, 0, 0.5372549, 1, 1,
0.1889742, -1.793162, 2.689341, 0, 0.5333334, 1, 1,
0.1976824, 0.9331097, 0.2653923, 0, 0.5254902, 1, 1,
0.200024, -0.874825, 2.367919, 0, 0.5215687, 1, 1,
0.2019696, -2.313398, 2.647391, 0, 0.5137255, 1, 1,
0.2091914, -1.463322, 3.753804, 0, 0.509804, 1, 1,
0.211946, 0.4238899, 0.8826911, 0, 0.5019608, 1, 1,
0.2158425, 1.291234, 0.631479, 0, 0.4941176, 1, 1,
0.2226669, -0.822762, 2.024423, 0, 0.4901961, 1, 1,
0.2228432, -0.5807529, 0.6362317, 0, 0.4823529, 1, 1,
0.2234415, 0.2100421, 0.962269, 0, 0.4784314, 1, 1,
0.2308816, 0.1204728, 0.1207386, 0, 0.4705882, 1, 1,
0.2314606, 0.9728364, 0.5213316, 0, 0.4666667, 1, 1,
0.2316789, -1.77058, 1.670354, 0, 0.4588235, 1, 1,
0.2342207, -1.390599, 2.336807, 0, 0.454902, 1, 1,
0.234302, 0.5090579, 0.7291208, 0, 0.4470588, 1, 1,
0.2411025, 0.1583808, 0.2802453, 0, 0.4431373, 1, 1,
0.2433238, -0.7089099, 2.296504, 0, 0.4352941, 1, 1,
0.2456974, -0.5496652, 2.736066, 0, 0.4313726, 1, 1,
0.2460161, 0.9280479, -0.2877891, 0, 0.4235294, 1, 1,
0.2463318, 0.834969, 1.877214, 0, 0.4196078, 1, 1,
0.2476887, 1.684989, -0.03325757, 0, 0.4117647, 1, 1,
0.2483936, -1.859109, 2.244305, 0, 0.4078431, 1, 1,
0.2489813, -0.8505023, 3.505402, 0, 0.4, 1, 1,
0.2520132, -1.716434, 1.425, 0, 0.3921569, 1, 1,
0.254108, 0.7443168, 2.842913, 0, 0.3882353, 1, 1,
0.2552453, 0.5190234, 0.8094028, 0, 0.3803922, 1, 1,
0.2593378, 1.847004, -0.3031484, 0, 0.3764706, 1, 1,
0.259903, -0.03680928, 2.45294, 0, 0.3686275, 1, 1,
0.2637408, 0.7944199, -0.3489056, 0, 0.3647059, 1, 1,
0.2684248, 1.294881, -0.4922347, 0, 0.3568628, 1, 1,
0.273178, 0.4612255, 0.376996, 0, 0.3529412, 1, 1,
0.273925, 0.2164551, 0.6289884, 0, 0.345098, 1, 1,
0.2750809, -0.1442266, 1.949409, 0, 0.3411765, 1, 1,
0.2757697, -0.2875291, 1.328963, 0, 0.3333333, 1, 1,
0.2762692, -1.355802, 1.244445, 0, 0.3294118, 1, 1,
0.2774282, 0.8000772, -1.825105, 0, 0.3215686, 1, 1,
0.2780872, 1.606694, 1.036074, 0, 0.3176471, 1, 1,
0.2830756, -0.7447141, 2.634067, 0, 0.3098039, 1, 1,
0.2924739, 0.6054766, 1.235871, 0, 0.3058824, 1, 1,
0.2927562, -1.784009, 1.542539, 0, 0.2980392, 1, 1,
0.2949562, -0.3222248, 1.589121, 0, 0.2901961, 1, 1,
0.2950182, 1.152482, -0.03580368, 0, 0.2862745, 1, 1,
0.2972315, -0.9613141, 3.577898, 0, 0.2784314, 1, 1,
0.2990857, 0.2078861, 0.09469929, 0, 0.2745098, 1, 1,
0.3055007, -0.5584879, 2.652557, 0, 0.2666667, 1, 1,
0.309503, -0.6651552, 3.94396, 0, 0.2627451, 1, 1,
0.3097729, -1.2415, 1.643166, 0, 0.254902, 1, 1,
0.3145085, 0.1693374, 0.280926, 0, 0.2509804, 1, 1,
0.3186118, 0.3180416, -0.04227946, 0, 0.2431373, 1, 1,
0.3195563, 0.64478, 0.03342309, 0, 0.2392157, 1, 1,
0.3204905, -1.890714, 2.740887, 0, 0.2313726, 1, 1,
0.3217006, -0.5863277, 3.996288, 0, 0.227451, 1, 1,
0.3230931, 2.977964, 0.1644084, 0, 0.2196078, 1, 1,
0.3279777, 1.394229, -0.1960711, 0, 0.2156863, 1, 1,
0.3289427, 1.113453, 0.4871834, 0, 0.2078431, 1, 1,
0.3311259, -0.08689015, 1.597576, 0, 0.2039216, 1, 1,
0.3322634, 0.2273456, 1.42788, 0, 0.1960784, 1, 1,
0.3326769, -0.6518598, 0.820621, 0, 0.1882353, 1, 1,
0.3338832, -1.205443, 4.394413, 0, 0.1843137, 1, 1,
0.3355656, -0.3338343, 2.640044, 0, 0.1764706, 1, 1,
0.3376985, 1.908809, -0.6149706, 0, 0.172549, 1, 1,
0.339129, 0.4082012, 0.4790413, 0, 0.1647059, 1, 1,
0.3402548, -0.4648907, 2.118923, 0, 0.1607843, 1, 1,
0.3410412, -0.4271056, 3.12106, 0, 0.1529412, 1, 1,
0.3423825, 0.8942075, 0.7839575, 0, 0.1490196, 1, 1,
0.3439155, -0.1536496, 2.106633, 0, 0.1411765, 1, 1,
0.3457273, -0.7192681, 2.600071, 0, 0.1372549, 1, 1,
0.3467911, -0.3768362, 3.637566, 0, 0.1294118, 1, 1,
0.3505352, -1.829134, 3.19868, 0, 0.1254902, 1, 1,
0.3528842, -0.05648477, 1.848948, 0, 0.1176471, 1, 1,
0.3542061, 0.02332536, 1.827479, 0, 0.1137255, 1, 1,
0.3563094, 0.4445738, -0.6218601, 0, 0.1058824, 1, 1,
0.3571185, 1.473245, -0.03837703, 0, 0.09803922, 1, 1,
0.3608504, -0.8817978, 4.411204, 0, 0.09411765, 1, 1,
0.362065, 0.9655497, 0.25713, 0, 0.08627451, 1, 1,
0.3638018, -0.3123759, 3.602229, 0, 0.08235294, 1, 1,
0.3666227, -1.38464, 4.169337, 0, 0.07450981, 1, 1,
0.3723213, -0.1417581, 2.805962, 0, 0.07058824, 1, 1,
0.3789716, -0.9135667, 2.919349, 0, 0.0627451, 1, 1,
0.3795261, 0.1935698, 2.84183, 0, 0.05882353, 1, 1,
0.3797795, 0.4910326, 1.153267, 0, 0.05098039, 1, 1,
0.3864986, -0.76259, 3.42144, 0, 0.04705882, 1, 1,
0.3866822, -0.7563354, 2.693362, 0, 0.03921569, 1, 1,
0.3883091, 0.718848, 1.023431, 0, 0.03529412, 1, 1,
0.3896626, 0.4303968, 1.098669, 0, 0.02745098, 1, 1,
0.3986355, -1.222144, 2.610609, 0, 0.02352941, 1, 1,
0.4053133, -0.2210545, 1.481708, 0, 0.01568628, 1, 1,
0.4068226, 0.3008911, 1.171144, 0, 0.01176471, 1, 1,
0.4076378, 1.14825, 1.365061, 0, 0.003921569, 1, 1,
0.4105167, 0.8053346, 0.9373369, 0.003921569, 0, 1, 1,
0.4108774, -1.549604, 4.212244, 0.007843138, 0, 1, 1,
0.4115224, -0.1128745, 2.069727, 0.01568628, 0, 1, 1,
0.4120583, -1.450117, 4.336366, 0.01960784, 0, 1, 1,
0.4212807, 1.134789, 1.388933, 0.02745098, 0, 1, 1,
0.4224506, 0.4010748, 0.7053315, 0.03137255, 0, 1, 1,
0.42304, 0.4049396, 1.485258, 0.03921569, 0, 1, 1,
0.4236398, -0.268227, 2.411917, 0.04313726, 0, 1, 1,
0.4261597, 0.1998052, 1.117292, 0.05098039, 0, 1, 1,
0.4299006, 0.7064004, 1.655404, 0.05490196, 0, 1, 1,
0.4318849, 0.921329, 1.621772, 0.0627451, 0, 1, 1,
0.4368668, -0.003381975, 1.407815, 0.06666667, 0, 1, 1,
0.439315, 0.5347099, -0.5109705, 0.07450981, 0, 1, 1,
0.441945, -0.2782961, -0.311738, 0.07843138, 0, 1, 1,
0.4471634, -0.1853702, 3.620082, 0.08627451, 0, 1, 1,
0.4550529, -0.03497275, 2.877778, 0.09019608, 0, 1, 1,
0.4707137, -0.04604684, 3.1287, 0.09803922, 0, 1, 1,
0.4876285, 0.1004797, 0.6500813, 0.1058824, 0, 1, 1,
0.4912954, -0.9493124, 2.921961, 0.1098039, 0, 1, 1,
0.4947191, 0.1684371, 1.078245, 0.1176471, 0, 1, 1,
0.4950485, -0.03036613, 3.488097, 0.1215686, 0, 1, 1,
0.4970289, 0.4306892, -1.066162, 0.1294118, 0, 1, 1,
0.4991871, -0.6193995, 3.393707, 0.1333333, 0, 1, 1,
0.5015218, -0.9685516, 2.775122, 0.1411765, 0, 1, 1,
0.5018197, 0.002269248, 1.122326, 0.145098, 0, 1, 1,
0.5029377, 0.7707628, -0.5661803, 0.1529412, 0, 1, 1,
0.5045747, -0.7484441, 2.860718, 0.1568628, 0, 1, 1,
0.5051819, 1.096876, -0.2068532, 0.1647059, 0, 1, 1,
0.5081794, -0.439153, 3.265479, 0.1686275, 0, 1, 1,
0.5185311, -0.4614294, 1.710022, 0.1764706, 0, 1, 1,
0.5186672, -0.4251231, 1.46575, 0.1803922, 0, 1, 1,
0.5241867, 0.7124222, 0.7258165, 0.1882353, 0, 1, 1,
0.5302968, -0.0757532, 0.3199815, 0.1921569, 0, 1, 1,
0.5312383, 0.2486836, 1.513184, 0.2, 0, 1, 1,
0.5393479, -0.5256188, 0.6498123, 0.2078431, 0, 1, 1,
0.5411971, -0.8947701, 2.125388, 0.2117647, 0, 1, 1,
0.5602255, -0.8284593, 3.087356, 0.2196078, 0, 1, 1,
0.5603609, 0.3883017, 1.971957, 0.2235294, 0, 1, 1,
0.5623732, -0.861064, 2.851191, 0.2313726, 0, 1, 1,
0.5634323, -0.1544685, 1.24438, 0.2352941, 0, 1, 1,
0.5639957, 1.536672, 0.7530206, 0.2431373, 0, 1, 1,
0.5642319, -0.09254076, 1.894901, 0.2470588, 0, 1, 1,
0.5667367, -0.9043086, 1.186613, 0.254902, 0, 1, 1,
0.567433, -0.09804046, 1.974217, 0.2588235, 0, 1, 1,
0.5694185, 0.7271104, 0.6610989, 0.2666667, 0, 1, 1,
0.5698186, 1.193048, -0.08118917, 0.2705882, 0, 1, 1,
0.5748975, -1.117431, 4.454128, 0.2784314, 0, 1, 1,
0.5780625, -1.296519, 3.557788, 0.282353, 0, 1, 1,
0.5811463, 0.09776137, 2.061659, 0.2901961, 0, 1, 1,
0.5824462, -0.7043473, 3.933315, 0.2941177, 0, 1, 1,
0.584805, -0.3384053, 2.845513, 0.3019608, 0, 1, 1,
0.5874552, -0.2396469, 2.389637, 0.3098039, 0, 1, 1,
0.5877928, 0.4275777, 0.4854779, 0.3137255, 0, 1, 1,
0.5912433, -0.1861102, 1.676251, 0.3215686, 0, 1, 1,
0.5930671, 0.6473305, 0.2228223, 0.3254902, 0, 1, 1,
0.6065252, 0.6269209, -1.36364, 0.3333333, 0, 1, 1,
0.6116737, -7.979906e-05, 1.449227, 0.3372549, 0, 1, 1,
0.6163711, 0.4904709, 1.021868, 0.345098, 0, 1, 1,
0.6173042, -0.631147, 2.44711, 0.3490196, 0, 1, 1,
0.6173044, -0.2045952, 2.483874, 0.3568628, 0, 1, 1,
0.6201305, 1.376107, 0.2756764, 0.3607843, 0, 1, 1,
0.6213017, -0.4985176, 3.155603, 0.3686275, 0, 1, 1,
0.6268142, 0.968177, 1.086391, 0.372549, 0, 1, 1,
0.6271844, 0.4409373, 1.879952, 0.3803922, 0, 1, 1,
0.6296809, -0.4813733, 2.867762, 0.3843137, 0, 1, 1,
0.6301379, 0.5590501, 0.9298655, 0.3921569, 0, 1, 1,
0.6322322, -1.300199, 2.710897, 0.3960784, 0, 1, 1,
0.6355387, -1.766732, 4.744175, 0.4039216, 0, 1, 1,
0.6360322, -0.03241618, 1.596262, 0.4117647, 0, 1, 1,
0.6435733, 0.2480203, 2.461091, 0.4156863, 0, 1, 1,
0.6446806, -1.415993, 0.009277874, 0.4235294, 0, 1, 1,
0.6454721, -0.6554636, 4.293259, 0.427451, 0, 1, 1,
0.6498954, -1.269273, 2.816947, 0.4352941, 0, 1, 1,
0.6510201, 0.39423, 0.9245796, 0.4392157, 0, 1, 1,
0.6542313, -0.8439248, 0.6597264, 0.4470588, 0, 1, 1,
0.6547601, 0.7993197, 0.678082, 0.4509804, 0, 1, 1,
0.6630051, -1.393988, 3.160908, 0.4588235, 0, 1, 1,
0.6631035, 0.172597, 3.023121, 0.4627451, 0, 1, 1,
0.6669002, 0.6654013, 0.2132601, 0.4705882, 0, 1, 1,
0.6670025, -1.150542, 2.348651, 0.4745098, 0, 1, 1,
0.6699197, -0.6377836, 0.8575947, 0.4823529, 0, 1, 1,
0.6779884, -0.2547089, 0.4037865, 0.4862745, 0, 1, 1,
0.6828582, -0.4598457, 1.930909, 0.4941176, 0, 1, 1,
0.682979, 1.692033, 1.537347, 0.5019608, 0, 1, 1,
0.6939425, -0.2967453, 3.072441, 0.5058824, 0, 1, 1,
0.696059, 1.136849, -0.4680145, 0.5137255, 0, 1, 1,
0.6966654, 0.2289781, 1.732663, 0.5176471, 0, 1, 1,
0.6991133, -0.463299, 2.372056, 0.5254902, 0, 1, 1,
0.7008055, -0.1980697, 2.679864, 0.5294118, 0, 1, 1,
0.7010387, -0.28022, 0.8060232, 0.5372549, 0, 1, 1,
0.7141942, 0.1205624, 2.085962, 0.5411765, 0, 1, 1,
0.7222929, -0.4248258, 1.368077, 0.5490196, 0, 1, 1,
0.7228151, -0.2053807, 2.153656, 0.5529412, 0, 1, 1,
0.723956, 1.439646, 0.7841644, 0.5607843, 0, 1, 1,
0.7248043, -1.12752, 1.499801, 0.5647059, 0, 1, 1,
0.7288545, 0.215601, 0.8245391, 0.572549, 0, 1, 1,
0.7301537, 0.2067888, 3.423345, 0.5764706, 0, 1, 1,
0.7375277, -1.467115, 1.044752, 0.5843138, 0, 1, 1,
0.7401703, -1.622539, 3.607951, 0.5882353, 0, 1, 1,
0.742779, 0.4053981, 1.216016, 0.5960785, 0, 1, 1,
0.7473495, -1.978792, 5.733147, 0.6039216, 0, 1, 1,
0.7473871, 0.4789524, 3.448345, 0.6078432, 0, 1, 1,
0.7488854, 0.8959612, 0.3605133, 0.6156863, 0, 1, 1,
0.752243, 0.6644587, -0.3785845, 0.6196079, 0, 1, 1,
0.7686535, 0.3735765, 2.896781, 0.627451, 0, 1, 1,
0.7709768, 1.346767, 0.8793371, 0.6313726, 0, 1, 1,
0.7715514, -0.6135744, 2.30582, 0.6392157, 0, 1, 1,
0.7715889, -0.4372946, 1.746713, 0.6431373, 0, 1, 1,
0.7751784, 0.7190064, 1.257131, 0.6509804, 0, 1, 1,
0.7772223, 0.8786846, 0.09771006, 0.654902, 0, 1, 1,
0.778217, -0.6745391, 2.025166, 0.6627451, 0, 1, 1,
0.7787417, -0.2336398, 3.003668, 0.6666667, 0, 1, 1,
0.7855693, 0.6084235, 1.807184, 0.6745098, 0, 1, 1,
0.7870919, 0.1528421, 0.7034417, 0.6784314, 0, 1, 1,
0.7897345, -0.0789344, 1.946309, 0.6862745, 0, 1, 1,
0.7923625, -0.3544819, 0.9959892, 0.6901961, 0, 1, 1,
0.7930908, -0.2638708, 3.565312, 0.6980392, 0, 1, 1,
0.7944552, -0.02341322, 1.434364, 0.7058824, 0, 1, 1,
0.7992249, 1.057207, 1.557594, 0.7098039, 0, 1, 1,
0.8017527, -0.923198, 1.731441, 0.7176471, 0, 1, 1,
0.8043105, -0.2944357, 1.653455, 0.7215686, 0, 1, 1,
0.8093353, -1.407445, 3.731119, 0.7294118, 0, 1, 1,
0.8119251, -0.5058525, 3.104229, 0.7333333, 0, 1, 1,
0.8188973, -0.8496236, 3.81863, 0.7411765, 0, 1, 1,
0.8193182, 0.7887384, -0.689064, 0.7450981, 0, 1, 1,
0.8217102, 0.8525066, -0.3908862, 0.7529412, 0, 1, 1,
0.8236695, -0.2216513, 1.440985, 0.7568628, 0, 1, 1,
0.82415, -0.9416619, 2.914889, 0.7647059, 0, 1, 1,
0.8249969, -0.07597163, 0.9910672, 0.7686275, 0, 1, 1,
0.8353549, -1.039233, 1.528425, 0.7764706, 0, 1, 1,
0.8356351, 1.364632, 1.4266, 0.7803922, 0, 1, 1,
0.8404562, 0.8370099, -0.4725975, 0.7882353, 0, 1, 1,
0.8493573, -0.6707074, -0.4221437, 0.7921569, 0, 1, 1,
0.8494911, 0.2910604, 0.7432262, 0.8, 0, 1, 1,
0.8529288, 0.08792191, 1.818939, 0.8078431, 0, 1, 1,
0.8575655, -1.580142, 4.509098, 0.8117647, 0, 1, 1,
0.8680063, -1.125852, 2.855327, 0.8196079, 0, 1, 1,
0.8697486, -0.8416332, 1.69982, 0.8235294, 0, 1, 1,
0.8765186, 1.021071, 3.281148, 0.8313726, 0, 1, 1,
0.8771439, -0.5198667, 0.967891, 0.8352941, 0, 1, 1,
0.880601, -0.8716462, 4.460151, 0.8431373, 0, 1, 1,
0.8858386, 0.1235148, 0.9237257, 0.8470588, 0, 1, 1,
0.8864474, -0.5292848, 2.649345, 0.854902, 0, 1, 1,
0.8865793, -0.3810933, 2.355071, 0.8588235, 0, 1, 1,
0.8911728, -0.3704718, 1.87306, 0.8666667, 0, 1, 1,
0.8914052, 0.1437965, 1.186663, 0.8705882, 0, 1, 1,
0.8928302, 0.8298129, 2.104601, 0.8784314, 0, 1, 1,
0.8980735, -0.2291116, 0.7812757, 0.8823529, 0, 1, 1,
0.9017156, 1.244456, 1.196463, 0.8901961, 0, 1, 1,
0.9037086, 1.540791, -1.011768, 0.8941177, 0, 1, 1,
0.9059438, -0.2619438, 0.7340722, 0.9019608, 0, 1, 1,
0.9104028, -1.968521, 4.430271, 0.9098039, 0, 1, 1,
0.9164972, 1.175899, 0.4242516, 0.9137255, 0, 1, 1,
0.9227846, -0.1771003, 0.5288848, 0.9215686, 0, 1, 1,
0.928165, 0.6702825, 0.4167437, 0.9254902, 0, 1, 1,
0.9361888, -1.779563, 2.814288, 0.9333333, 0, 1, 1,
0.9376193, 1.333387, -0.05829882, 0.9372549, 0, 1, 1,
0.939511, 0.8211004, 0.5887538, 0.945098, 0, 1, 1,
0.9431858, 1.063118, 0.2186669, 0.9490196, 0, 1, 1,
0.9450397, 0.9989429, 1.55839, 0.9568627, 0, 1, 1,
0.9450744, -0.1882766, 1.883826, 0.9607843, 0, 1, 1,
0.9465818, -1.015215, 4.111684, 0.9686275, 0, 1, 1,
0.9476858, -1.394426, 3.719847, 0.972549, 0, 1, 1,
0.9512412, -0.6121342, 2.32244, 0.9803922, 0, 1, 1,
0.9557938, -0.02917432, 3.358165, 0.9843137, 0, 1, 1,
0.9593431, -0.3013204, 1.626718, 0.9921569, 0, 1, 1,
0.9602599, 0.3227335, 0.7245766, 0.9960784, 0, 1, 1,
0.9618285, 0.2088632, -0.02894987, 1, 0, 0.9960784, 1,
0.9640634, 1.715855, 0.2645849, 1, 0, 0.9882353, 1,
0.9655406, -0.3601456, 1.390092, 1, 0, 0.9843137, 1,
0.9655632, -0.2497266, 3.375588, 1, 0, 0.9764706, 1,
0.967353, -0.1615985, 0.6226528, 1, 0, 0.972549, 1,
0.9775426, -0.7868889, 2.233545, 1, 0, 0.9647059, 1,
0.9781476, 0.5422559, 1.645115, 1, 0, 0.9607843, 1,
0.979089, -0.2840245, 2.020152, 1, 0, 0.9529412, 1,
0.9856892, 0.4803109, 0.9973632, 1, 0, 0.9490196, 1,
0.9933272, -0.3475691, 1.868798, 1, 0, 0.9411765, 1,
0.9972578, 0.01327747, 1.148294, 1, 0, 0.9372549, 1,
0.9973703, -1.1901, 1.841489, 1, 0, 0.9294118, 1,
1.005413, 0.9174839, 0.7053035, 1, 0, 0.9254902, 1,
1.014102, -1.225515, 1.998017, 1, 0, 0.9176471, 1,
1.01696, 1.801655, -0.1327051, 1, 0, 0.9137255, 1,
1.018644, 0.2344358, 2.389722, 1, 0, 0.9058824, 1,
1.02489, 0.5282916, 0.555917, 1, 0, 0.9019608, 1,
1.026055, -1.335508, 3.106373, 1, 0, 0.8941177, 1,
1.042783, 1.520882, 1.11236, 1, 0, 0.8862745, 1,
1.050286, -0.3664918, 2.085202, 1, 0, 0.8823529, 1,
1.050605, -0.4458178, 1.65752, 1, 0, 0.8745098, 1,
1.051638, -1.27231, 2.081651, 1, 0, 0.8705882, 1,
1.052984, 0.3180934, 2.618564, 1, 0, 0.8627451, 1,
1.054208, 0.4652622, 1.256922, 1, 0, 0.8588235, 1,
1.057605, 0.2047337, 0.07337089, 1, 0, 0.8509804, 1,
1.059051, -0.5368074, 2.138115, 1, 0, 0.8470588, 1,
1.059801, 0.2891679, 1.707111, 1, 0, 0.8392157, 1,
1.070365, -0.9178138, 2.266438, 1, 0, 0.8352941, 1,
1.071019, -0.9981617, 2.970552, 1, 0, 0.827451, 1,
1.071912, -0.08711811, 3.056846, 1, 0, 0.8235294, 1,
1.073179, -1.84855, 1.01876, 1, 0, 0.8156863, 1,
1.08235, 0.6074933, 0.5333499, 1, 0, 0.8117647, 1,
1.0872, 2.299304, 1.541571, 1, 0, 0.8039216, 1,
1.090327, 0.4208077, 1.067208, 1, 0, 0.7960784, 1,
1.092816, -0.2176121, 0.9374956, 1, 0, 0.7921569, 1,
1.096047, 1.325663, 0.3273205, 1, 0, 0.7843137, 1,
1.104077, 0.8465922, 3.295629, 1, 0, 0.7803922, 1,
1.104649, 0.4986077, 2.017032, 1, 0, 0.772549, 1,
1.105009, 0.6431722, -0.760117, 1, 0, 0.7686275, 1,
1.107267, 0.3399024, 2.986717, 1, 0, 0.7607843, 1,
1.107291, 0.00632577, 1.203113, 1, 0, 0.7568628, 1,
1.114195, 0.7252477, 0.5415306, 1, 0, 0.7490196, 1,
1.115159, -1.450227, 2.806064, 1, 0, 0.7450981, 1,
1.129184, 1.230567, 2.998482, 1, 0, 0.7372549, 1,
1.129265, 0.688551, -0.5969362, 1, 0, 0.7333333, 1,
1.132245, -1.202132, 3.656189, 1, 0, 0.7254902, 1,
1.133555, -0.01501149, 3.320012, 1, 0, 0.7215686, 1,
1.133603, -1.207848, 3.496212, 1, 0, 0.7137255, 1,
1.13751, 0.3216704, 0.4715803, 1, 0, 0.7098039, 1,
1.147371, 0.6857367, 0.9465832, 1, 0, 0.7019608, 1,
1.160073, 0.6179513, 3.831432, 1, 0, 0.6941177, 1,
1.16013, 0.5214546, 2.596125, 1, 0, 0.6901961, 1,
1.163926, -1.276377, 1.816402, 1, 0, 0.682353, 1,
1.163961, -0.09205436, 1.517947, 1, 0, 0.6784314, 1,
1.165294, 0.4570539, 1.810842, 1, 0, 0.6705883, 1,
1.186298, -0.7630798, 2.505872, 1, 0, 0.6666667, 1,
1.18654, 1.09744, 1.145609, 1, 0, 0.6588235, 1,
1.189206, 0.1322402, 0.6200886, 1, 0, 0.654902, 1,
1.192415, 0.5656547, 1.409967, 1, 0, 0.6470588, 1,
1.192729, -0.2080624, 1.523338, 1, 0, 0.6431373, 1,
1.19745, 0.6425408, 1.364473, 1, 0, 0.6352941, 1,
1.20202, -2.033448, 2.013368, 1, 0, 0.6313726, 1,
1.208915, -0.1989239, 2.321712, 1, 0, 0.6235294, 1,
1.213754, 0.6497369, -0.122997, 1, 0, 0.6196079, 1,
1.219634, 0.2435906, 1.119075, 1, 0, 0.6117647, 1,
1.227022, -0.007064627, 0.8972116, 1, 0, 0.6078432, 1,
1.231663, -0.9433098, 4.011577, 1, 0, 0.6, 1,
1.236794, 1.085062, 0.1436184, 1, 0, 0.5921569, 1,
1.254978, -3.417421, 4.250515, 1, 0, 0.5882353, 1,
1.256667, 0.08925369, 1.814095, 1, 0, 0.5803922, 1,
1.266914, -0.4477919, 3.056767, 1, 0, 0.5764706, 1,
1.281005, 0.2657045, 0.1395014, 1, 0, 0.5686275, 1,
1.284387, -1.601179, 2.635499, 1, 0, 0.5647059, 1,
1.28712, 0.1036728, 0.5322643, 1, 0, 0.5568628, 1,
1.28893, -0.5706365, 1.750976, 1, 0, 0.5529412, 1,
1.289777, -0.385272, 2.969203, 1, 0, 0.5450981, 1,
1.299933, -0.9489469, 0.8118079, 1, 0, 0.5411765, 1,
1.30288, -0.6486154, 2.01511, 1, 0, 0.5333334, 1,
1.318913, 1.127815, 0.9923087, 1, 0, 0.5294118, 1,
1.324349, -0.8307201, 2.332246, 1, 0, 0.5215687, 1,
1.330731, 0.08320996, 3.065412, 1, 0, 0.5176471, 1,
1.338299, -0.4914736, 2.821847, 1, 0, 0.509804, 1,
1.339006, 0.4708632, -1.077878, 1, 0, 0.5058824, 1,
1.343979, 1.580451, -0.206135, 1, 0, 0.4980392, 1,
1.354181, 0.1229099, 1.297294, 1, 0, 0.4901961, 1,
1.366118, -1.134085, 1.374126, 1, 0, 0.4862745, 1,
1.367755, 0.1643828, 1.593102, 1, 0, 0.4784314, 1,
1.370543, -0.9250705, 3.619629, 1, 0, 0.4745098, 1,
1.388473, -0.1938517, 1.958284, 1, 0, 0.4666667, 1,
1.399806, 0.8383134, 1.941979, 1, 0, 0.4627451, 1,
1.4063, 0.2853946, 0.2790207, 1, 0, 0.454902, 1,
1.407039, -0.4870895, 2.146131, 1, 0, 0.4509804, 1,
1.408103, -0.6055144, 1.300705, 1, 0, 0.4431373, 1,
1.416658, -0.2936891, 1.944571, 1, 0, 0.4392157, 1,
1.416759, 0.7871017, 2.250842, 1, 0, 0.4313726, 1,
1.422957, -0.6092085, 0.8670102, 1, 0, 0.427451, 1,
1.424981, 0.5549791, 0.5340749, 1, 0, 0.4196078, 1,
1.435751, 1.070179, 2.01695, 1, 0, 0.4156863, 1,
1.443957, 0.9002338, 1.468131, 1, 0, 0.4078431, 1,
1.460533, 1.35189, 0.7489257, 1, 0, 0.4039216, 1,
1.477089, 0.2699512, 0.2092033, 1, 0, 0.3960784, 1,
1.478498, 0.4779507, 1.838119, 1, 0, 0.3882353, 1,
1.485312, -0.1468829, 1.320472, 1, 0, 0.3843137, 1,
1.490456, 0.2362271, 2.080851, 1, 0, 0.3764706, 1,
1.499366, -0.3693104, 2.720917, 1, 0, 0.372549, 1,
1.50965, -1.071965, 0.489057, 1, 0, 0.3647059, 1,
1.514845, 0.6572162, 0.912269, 1, 0, 0.3607843, 1,
1.518357, -1.531997, 0.2182541, 1, 0, 0.3529412, 1,
1.533176, 1.421772, 2.94968, 1, 0, 0.3490196, 1,
1.54618, -0.475477, 2.075929, 1, 0, 0.3411765, 1,
1.559788, -1.5047, 2.784591, 1, 0, 0.3372549, 1,
1.561368, -0.7089379, -0.4374615, 1, 0, 0.3294118, 1,
1.582571, -0.9960051, 2.469165, 1, 0, 0.3254902, 1,
1.583148, 1.298696, 1.833499, 1, 0, 0.3176471, 1,
1.585, -0.4823994, -0.08347399, 1, 0, 0.3137255, 1,
1.604215, 0.3535933, 1.222918, 1, 0, 0.3058824, 1,
1.60917, 1.646298, -0.2502522, 1, 0, 0.2980392, 1,
1.626842, 0.7130942, 1.091693, 1, 0, 0.2941177, 1,
1.639233, -0.4612697, 1.014777, 1, 0, 0.2862745, 1,
1.648466, -2.332957, 2.049412, 1, 0, 0.282353, 1,
1.65251, -1.312092, 1.117852, 1, 0, 0.2745098, 1,
1.660883, 0.6498191, 2.246996, 1, 0, 0.2705882, 1,
1.698438, 0.8980026, 1.625535, 1, 0, 0.2627451, 1,
1.700753, -0.3152543, 2.649056, 1, 0, 0.2588235, 1,
1.709479, -0.1710542, -1.192725, 1, 0, 0.2509804, 1,
1.71041, -1.131267, 2.369387, 1, 0, 0.2470588, 1,
1.721774, 0.2992102, 3.714887, 1, 0, 0.2392157, 1,
1.764407, 1.461697, 1.139741, 1, 0, 0.2352941, 1,
1.768622, -2.609426, 0.3902027, 1, 0, 0.227451, 1,
1.770362, 1.128761, 2.522669, 1, 0, 0.2235294, 1,
1.779138, 0.7753934, 1.324086, 1, 0, 0.2156863, 1,
1.783391, -0.2163858, 1.55295, 1, 0, 0.2117647, 1,
1.797048, 2.295711, 0.6384408, 1, 0, 0.2039216, 1,
1.801499, -0.8452527, 3.322217, 1, 0, 0.1960784, 1,
1.820605, 0.4491735, 1.108511, 1, 0, 0.1921569, 1,
1.836694, -0.6376204, 3.619506, 1, 0, 0.1843137, 1,
1.840002, 0.7860984, 1.35249, 1, 0, 0.1803922, 1,
1.879704, 1.532647, 1.363534, 1, 0, 0.172549, 1,
1.89188, 0.4594108, 1.273968, 1, 0, 0.1686275, 1,
1.908861, 1.443902, 1.00081, 1, 0, 0.1607843, 1,
1.922531, 0.2333408, -0.0754734, 1, 0, 0.1568628, 1,
1.95541, -0.08075315, 2.978679, 1, 0, 0.1490196, 1,
1.956729, 0.4098034, 3.296478, 1, 0, 0.145098, 1,
1.964759, 0.2667231, 2.472605, 1, 0, 0.1372549, 1,
1.983072, 0.5294474, 2.695862, 1, 0, 0.1333333, 1,
2.022699, 0.2106894, -0.08972015, 1, 0, 0.1254902, 1,
2.051528, 0.4528009, 1.695484, 1, 0, 0.1215686, 1,
2.051724, -0.5352872, 2.379955, 1, 0, 0.1137255, 1,
2.090937, 1.240436, 1.116666, 1, 0, 0.1098039, 1,
2.112094, -0.6321289, 2.264456, 1, 0, 0.1019608, 1,
2.121726, 0.2327258, 0.5263509, 1, 0, 0.09411765, 1,
2.168347, -1.590181, 2.649127, 1, 0, 0.09019608, 1,
2.18801, -1.480608, 3.110113, 1, 0, 0.08235294, 1,
2.240242, 0.4706655, 0.9774113, 1, 0, 0.07843138, 1,
2.274116, -0.05117653, 2.340239, 1, 0, 0.07058824, 1,
2.284174, -1.042792, 2.502889, 1, 0, 0.06666667, 1,
2.286226, 0.2820805, 0.6344717, 1, 0, 0.05882353, 1,
2.412619, 1.094018, 0.8119019, 1, 0, 0.05490196, 1,
2.414571, -0.6699306, 2.838208, 1, 0, 0.04705882, 1,
2.436304, 0.451458, 2.277771, 1, 0, 0.04313726, 1,
2.514927, -1.265949, 2.739154, 1, 0, 0.03529412, 1,
2.617186, 2.282654, 0.3732901, 1, 0, 0.03137255, 1,
2.739306, -1.148059, 1.047269, 1, 0, 0.02352941, 1,
2.826335, 1.614827, -0.009414468, 1, 0, 0.01960784, 1,
3.175851, -0.6180378, 1.063867, 1, 0, 0.01176471, 1,
3.305168, 1.101875, 1.095113, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.2093275, -4.501439, -6.296467, 0, -0.5, 0.5, 0.5,
0.2093275, -4.501439, -6.296467, 1, -0.5, 0.5, 0.5,
0.2093275, -4.501439, -6.296467, 1, 1.5, 0.5, 0.5,
0.2093275, -4.501439, -6.296467, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.936003, -0.2197286, -6.296467, 0, -0.5, 0.5, 0.5,
-3.936003, -0.2197286, -6.296467, 1, -0.5, 0.5, 0.5,
-3.936003, -0.2197286, -6.296467, 1, 1.5, 0.5, 0.5,
-3.936003, -0.2197286, -6.296467, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.936003, -4.501439, 0.5900884, 0, -0.5, 0.5, 0.5,
-3.936003, -4.501439, 0.5900884, 1, -0.5, 0.5, 0.5,
-3.936003, -4.501439, 0.5900884, 1, 1.5, 0.5, 0.5,
-3.936003, -4.501439, 0.5900884, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.513352, -4.707262,
3, -3.513352, -4.707262,
-2, -3.513352, -4.707262,
-2, -3.678033, -4.972129,
-1, -3.513352, -4.707262,
-1, -3.678033, -4.972129,
0, -3.513352, -4.707262,
0, -3.678033, -4.972129,
1, -3.513352, -4.707262,
1, -3.678033, -4.972129,
2, -3.513352, -4.707262,
2, -3.678033, -4.972129,
3, -3.513352, -4.707262,
3, -3.678033, -4.972129
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -4.007395, -5.501864, 0, -0.5, 0.5, 0.5,
-2, -4.007395, -5.501864, 1, -0.5, 0.5, 0.5,
-2, -4.007395, -5.501864, 1, 1.5, 0.5, 0.5,
-2, -4.007395, -5.501864, 0, 1.5, 0.5, 0.5,
-1, -4.007395, -5.501864, 0, -0.5, 0.5, 0.5,
-1, -4.007395, -5.501864, 1, -0.5, 0.5, 0.5,
-1, -4.007395, -5.501864, 1, 1.5, 0.5, 0.5,
-1, -4.007395, -5.501864, 0, 1.5, 0.5, 0.5,
0, -4.007395, -5.501864, 0, -0.5, 0.5, 0.5,
0, -4.007395, -5.501864, 1, -0.5, 0.5, 0.5,
0, -4.007395, -5.501864, 1, 1.5, 0.5, 0.5,
0, -4.007395, -5.501864, 0, 1.5, 0.5, 0.5,
1, -4.007395, -5.501864, 0, -0.5, 0.5, 0.5,
1, -4.007395, -5.501864, 1, -0.5, 0.5, 0.5,
1, -4.007395, -5.501864, 1, 1.5, 0.5, 0.5,
1, -4.007395, -5.501864, 0, 1.5, 0.5, 0.5,
2, -4.007395, -5.501864, 0, -0.5, 0.5, 0.5,
2, -4.007395, -5.501864, 1, -0.5, 0.5, 0.5,
2, -4.007395, -5.501864, 1, 1.5, 0.5, 0.5,
2, -4.007395, -5.501864, 0, 1.5, 0.5, 0.5,
3, -4.007395, -5.501864, 0, -0.5, 0.5, 0.5,
3, -4.007395, -5.501864, 1, -0.5, 0.5, 0.5,
3, -4.007395, -5.501864, 1, 1.5, 0.5, 0.5,
3, -4.007395, -5.501864, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-2.979388, -3, -4.707262,
-2.979388, 2, -4.707262,
-2.979388, -3, -4.707262,
-3.138824, -3, -4.972129,
-2.979388, -2, -4.707262,
-3.138824, -2, -4.972129,
-2.979388, -1, -4.707262,
-3.138824, -1, -4.972129,
-2.979388, 0, -4.707262,
-3.138824, 0, -4.972129,
-2.979388, 1, -4.707262,
-3.138824, 1, -4.972129,
-2.979388, 2, -4.707262,
-3.138824, 2, -4.972129
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.457696, -3, -5.501864, 0, -0.5, 0.5, 0.5,
-3.457696, -3, -5.501864, 1, -0.5, 0.5, 0.5,
-3.457696, -3, -5.501864, 1, 1.5, 0.5, 0.5,
-3.457696, -3, -5.501864, 0, 1.5, 0.5, 0.5,
-3.457696, -2, -5.501864, 0, -0.5, 0.5, 0.5,
-3.457696, -2, -5.501864, 1, -0.5, 0.5, 0.5,
-3.457696, -2, -5.501864, 1, 1.5, 0.5, 0.5,
-3.457696, -2, -5.501864, 0, 1.5, 0.5, 0.5,
-3.457696, -1, -5.501864, 0, -0.5, 0.5, 0.5,
-3.457696, -1, -5.501864, 1, -0.5, 0.5, 0.5,
-3.457696, -1, -5.501864, 1, 1.5, 0.5, 0.5,
-3.457696, -1, -5.501864, 0, 1.5, 0.5, 0.5,
-3.457696, 0, -5.501864, 0, -0.5, 0.5, 0.5,
-3.457696, 0, -5.501864, 1, -0.5, 0.5, 0.5,
-3.457696, 0, -5.501864, 1, 1.5, 0.5, 0.5,
-3.457696, 0, -5.501864, 0, 1.5, 0.5, 0.5,
-3.457696, 1, -5.501864, 0, -0.5, 0.5, 0.5,
-3.457696, 1, -5.501864, 1, -0.5, 0.5, 0.5,
-3.457696, 1, -5.501864, 1, 1.5, 0.5, 0.5,
-3.457696, 1, -5.501864, 0, 1.5, 0.5, 0.5,
-3.457696, 2, -5.501864, 0, -0.5, 0.5, 0.5,
-3.457696, 2, -5.501864, 1, -0.5, 0.5, 0.5,
-3.457696, 2, -5.501864, 1, 1.5, 0.5, 0.5,
-3.457696, 2, -5.501864, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-2.979388, -3.513352, -4,
-2.979388, -3.513352, 4,
-2.979388, -3.513352, -4,
-3.138824, -3.678033, -4,
-2.979388, -3.513352, -2,
-3.138824, -3.678033, -2,
-2.979388, -3.513352, 0,
-3.138824, -3.678033, 0,
-2.979388, -3.513352, 2,
-3.138824, -3.678033, 2,
-2.979388, -3.513352, 4,
-3.138824, -3.678033, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.457696, -4.007395, -4, 0, -0.5, 0.5, 0.5,
-3.457696, -4.007395, -4, 1, -0.5, 0.5, 0.5,
-3.457696, -4.007395, -4, 1, 1.5, 0.5, 0.5,
-3.457696, -4.007395, -4, 0, 1.5, 0.5, 0.5,
-3.457696, -4.007395, -2, 0, -0.5, 0.5, 0.5,
-3.457696, -4.007395, -2, 1, -0.5, 0.5, 0.5,
-3.457696, -4.007395, -2, 1, 1.5, 0.5, 0.5,
-3.457696, -4.007395, -2, 0, 1.5, 0.5, 0.5,
-3.457696, -4.007395, 0, 0, -0.5, 0.5, 0.5,
-3.457696, -4.007395, 0, 1, -0.5, 0.5, 0.5,
-3.457696, -4.007395, 0, 1, 1.5, 0.5, 0.5,
-3.457696, -4.007395, 0, 0, 1.5, 0.5, 0.5,
-3.457696, -4.007395, 2, 0, -0.5, 0.5, 0.5,
-3.457696, -4.007395, 2, 1, -0.5, 0.5, 0.5,
-3.457696, -4.007395, 2, 1, 1.5, 0.5, 0.5,
-3.457696, -4.007395, 2, 0, 1.5, 0.5, 0.5,
-3.457696, -4.007395, 4, 0, -0.5, 0.5, 0.5,
-3.457696, -4.007395, 4, 1, -0.5, 0.5, 0.5,
-3.457696, -4.007395, 4, 1, 1.5, 0.5, 0.5,
-3.457696, -4.007395, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-2.979388, -3.513352, -4.707262,
-2.979388, 3.073895, -4.707262,
-2.979388, -3.513352, 5.887438,
-2.979388, 3.073895, 5.887438,
-2.979388, -3.513352, -4.707262,
-2.979388, -3.513352, 5.887438,
-2.979388, 3.073895, -4.707262,
-2.979388, 3.073895, 5.887438,
-2.979388, -3.513352, -4.707262,
3.398043, -3.513352, -4.707262,
-2.979388, -3.513352, 5.887438,
3.398043, -3.513352, 5.887438,
-2.979388, 3.073895, -4.707262,
3.398043, 3.073895, -4.707262,
-2.979388, 3.073895, 5.887438,
3.398043, 3.073895, 5.887438,
3.398043, -3.513352, -4.707262,
3.398043, 3.073895, -4.707262,
3.398043, -3.513352, 5.887438,
3.398043, 3.073895, 5.887438,
3.398043, -3.513352, -4.707262,
3.398043, -3.513352, 5.887438,
3.398043, 3.073895, -4.707262,
3.398043, 3.073895, 5.887438
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.481659;
var distance = 33.28675;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.2093275, 0.2197286, -0.5900884 );
mvMatrix.scale( 1.268429, 1.228027, 0.7635248 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.28675);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
valine<-read.table("valine.xyz")
```

```
## Error in read.table("valine.xyz"): no lines available in input
```

```r
x<-valine$V2
```

```
## Error in eval(expr, envir, enclos): object 'valine' not found
```

```r
y<-valine$V3
```

```
## Error in eval(expr, envir, enclos): object 'valine' not found
```

```r
z<-valine$V4
```

```
## Error in eval(expr, envir, enclos): object 'valine' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-2.886513, 0.3962431, -1.079241, 0, 0, 1, 1, 1,
-2.815952, 1.002608, -1.634986, 1, 0, 0, 1, 1,
-2.692065, 0.1944272, -1.683338, 1, 0, 0, 1, 1,
-2.672222, 0.4851863, -3.024997, 1, 0, 0, 1, 1,
-2.493103, -0.4636557, -1.315418, 1, 0, 0, 1, 1,
-2.451628, 0.7770885, 0.6207469, 1, 0, 0, 1, 1,
-2.393188, 1.879491, -1.222224, 0, 0, 0, 1, 1,
-2.294705, -1.38874, -1.866571, 0, 0, 0, 1, 1,
-2.291286, -0.9089727, -2.83131, 0, 0, 0, 1, 1,
-2.279013, 0.034336, -2.760929, 0, 0, 0, 1, 1,
-2.274602, 1.038817, -0.838686, 0, 0, 0, 1, 1,
-2.252739, -0.3841436, -1.00808, 0, 0, 0, 1, 1,
-2.210078, 1.183161, -1.903032, 0, 0, 0, 1, 1,
-2.170379, -1.035668, -0.3008971, 1, 1, 1, 1, 1,
-2.154556, 0.5546934, -0.4344738, 1, 1, 1, 1, 1,
-2.113713, 1.728139, -2.168228, 1, 1, 1, 1, 1,
-2.09351, 1.389205, -0.5688158, 1, 1, 1, 1, 1,
-2.067472, 2.476851, 0.09489769, 1, 1, 1, 1, 1,
-2.061781, 0.5068243, -1.605985, 1, 1, 1, 1, 1,
-2.043296, -0.4620138, -1.521641, 1, 1, 1, 1, 1,
-2.038892, -1.451431, -2.614179, 1, 1, 1, 1, 1,
-2.026634, 0.591447, -2.070264, 1, 1, 1, 1, 1,
-2.001209, 0.1040577, -1.109071, 1, 1, 1, 1, 1,
-1.999523, 1.42128, 1.165316, 1, 1, 1, 1, 1,
-1.986391, 0.9928225, -1.128865, 1, 1, 1, 1, 1,
-1.867904, 1.160896, -2.362181, 1, 1, 1, 1, 1,
-1.866726, -0.6709326, -2.261872, 1, 1, 1, 1, 1,
-1.845517, -0.3614694, -1.301859, 1, 1, 1, 1, 1,
-1.818832, -0.1666986, -2.456703, 0, 0, 1, 1, 1,
-1.804123, -0.191161, -1.149186, 1, 0, 0, 1, 1,
-1.800663, 0.1639707, 0.1569361, 1, 0, 0, 1, 1,
-1.797941, 1.857255, -2.45757, 1, 0, 0, 1, 1,
-1.796723, -1.105627, -2.549711, 1, 0, 0, 1, 1,
-1.785749, -0.5241514, -1.603628, 1, 0, 0, 1, 1,
-1.78524, 0.174176, -2.361023, 0, 0, 0, 1, 1,
-1.77591, 0.282058, -2.235072, 0, 0, 0, 1, 1,
-1.77075, 0.506922, -0.5673729, 0, 0, 0, 1, 1,
-1.765977, 0.3992934, -0.9982891, 0, 0, 0, 1, 1,
-1.762091, 0.6758317, -2.135079, 0, 0, 0, 1, 1,
-1.752898, 1.547445, 0.392013, 0, 0, 0, 1, 1,
-1.751715, 1.694398, -0.4282993, 0, 0, 0, 1, 1,
-1.747514, 0.00223755, -1.083588, 1, 1, 1, 1, 1,
-1.730527, -1.562312, -2.888173, 1, 1, 1, 1, 1,
-1.693605, -0.1402656, -2.864486, 1, 1, 1, 1, 1,
-1.649534, -0.4764667, -0.9818269, 1, 1, 1, 1, 1,
-1.64828, 0.7704315, -1.385159, 1, 1, 1, 1, 1,
-1.63895, -0.3113973, -1.290148, 1, 1, 1, 1, 1,
-1.634705, -0.8231436, -3.609341, 1, 1, 1, 1, 1,
-1.623321, 0.2844566, -2.857087, 1, 1, 1, 1, 1,
-1.620811, 1.633228, 0.2650968, 1, 1, 1, 1, 1,
-1.615381, -0.7290394, -2.381678, 1, 1, 1, 1, 1,
-1.614347, -0.2372738, -1.272337, 1, 1, 1, 1, 1,
-1.598776, 1.398977, 0.1141888, 1, 1, 1, 1, 1,
-1.595352, -0.4681028, -1.85477, 1, 1, 1, 1, 1,
-1.593784, 0.5011044, -1.632227, 1, 1, 1, 1, 1,
-1.584107, -0.9039586, -1.35941, 1, 1, 1, 1, 1,
-1.58074, 0.758513, -1.361888, 0, 0, 1, 1, 1,
-1.57155, -0.3101009, -1.51491, 1, 0, 0, 1, 1,
-1.571156, 0.7508509, -0.6015636, 1, 0, 0, 1, 1,
-1.568628, -0.4624787, -1.475445, 1, 0, 0, 1, 1,
-1.568377, -0.1820572, -0.7915922, 1, 0, 0, 1, 1,
-1.567252, 0.6803036, -1.081796, 1, 0, 0, 1, 1,
-1.565066, -0.4976299, -1.295491, 0, 0, 0, 1, 1,
-1.556123, 0.9465386, -1.433222, 0, 0, 0, 1, 1,
-1.545719, -0.6937876, -1.963786, 0, 0, 0, 1, 1,
-1.514448, 1.210359, -0.2896225, 0, 0, 0, 1, 1,
-1.51151, 2.195823, 0.6606036, 0, 0, 0, 1, 1,
-1.508466, -2.298594, -0.6982942, 0, 0, 0, 1, 1,
-1.505707, -0.05160674, -1.993181, 0, 0, 0, 1, 1,
-1.505131, 0.5335768, -0.5874785, 1, 1, 1, 1, 1,
-1.497646, 0.2642491, -2.212256, 1, 1, 1, 1, 1,
-1.471968, -1.314516, -2.928666, 1, 1, 1, 1, 1,
-1.467893, -0.426843, 0.1585933, 1, 1, 1, 1, 1,
-1.435017, -0.8137344, -2.116083, 1, 1, 1, 1, 1,
-1.432322, 1.141109, -0.4200203, 1, 1, 1, 1, 1,
-1.431364, -0.04765883, -0.6663582, 1, 1, 1, 1, 1,
-1.418561, 0.4594902, -0.727307, 1, 1, 1, 1, 1,
-1.386985, 0.3838138, -0.1829818, 1, 1, 1, 1, 1,
-1.386463, 1.836251, -0.6201421, 1, 1, 1, 1, 1,
-1.384683, 0.3061031, -3.731714, 1, 1, 1, 1, 1,
-1.380443, -0.5468211, -0.4707363, 1, 1, 1, 1, 1,
-1.368091, 2.096887, -0.8317536, 1, 1, 1, 1, 1,
-1.355304, -0.689986, -3.212207, 1, 1, 1, 1, 1,
-1.350434, -1.341242, -1.751252, 1, 1, 1, 1, 1,
-1.347886, 1.089789, -0.1749267, 0, 0, 1, 1, 1,
-1.347689, 1.372588, -0.7847113, 1, 0, 0, 1, 1,
-1.342471, -0.1773378, -1.089269, 1, 0, 0, 1, 1,
-1.340979, -1.033812, -2.831923, 1, 0, 0, 1, 1,
-1.331747, -1.037326, -1.889531, 1, 0, 0, 1, 1,
-1.326226, 0.9912931, -1.797562, 1, 0, 0, 1, 1,
-1.320149, -1.691084, -2.60304, 0, 0, 0, 1, 1,
-1.319455, 2.665752, 0.9567046, 0, 0, 0, 1, 1,
-1.315725, 0.2981193, -1.991553, 0, 0, 0, 1, 1,
-1.308382, -1.577868, -3.712565, 0, 0, 0, 1, 1,
-1.300966, 0.03279584, -3.830484, 0, 0, 0, 1, 1,
-1.296817, -0.01880626, -1.066326, 0, 0, 0, 1, 1,
-1.283953, 0.08449219, -3.525453, 0, 0, 0, 1, 1,
-1.263298, 0.2427206, 0.6093091, 1, 1, 1, 1, 1,
-1.261408, -0.5006601, -0.2773474, 1, 1, 1, 1, 1,
-1.227257, -0.4553583, -3.938542, 1, 1, 1, 1, 1,
-1.223604, -0.1821479, -1.638357, 1, 1, 1, 1, 1,
-1.22212, 0.597791, 0.4600264, 1, 1, 1, 1, 1,
-1.219397, -0.8436716, -1.813952, 1, 1, 1, 1, 1,
-1.208036, -0.4131965, -3.469006, 1, 1, 1, 1, 1,
-1.207319, -0.2007878, -1.591477, 1, 1, 1, 1, 1,
-1.202519, 0.7456257, -0.8686904, 1, 1, 1, 1, 1,
-1.195238, 0.4354986, -2.918602, 1, 1, 1, 1, 1,
-1.191337, -0.7530715, -2.193455, 1, 1, 1, 1, 1,
-1.189984, 0.6918042, -1.06006, 1, 1, 1, 1, 1,
-1.187998, 0.7026946, -0.8307792, 1, 1, 1, 1, 1,
-1.173962, -0.8586159, -3.406315, 1, 1, 1, 1, 1,
-1.170861, 0.5413301, -3.286723, 1, 1, 1, 1, 1,
-1.164935, -0.8495228, -1.076585, 0, 0, 1, 1, 1,
-1.163905, -1.128125, -2.283039, 1, 0, 0, 1, 1,
-1.16094, 0.8409426, -0.6348531, 1, 0, 0, 1, 1,
-1.160227, -0.3864331, -3.234814, 1, 0, 0, 1, 1,
-1.151248, -1.314053, -1.91087, 1, 0, 0, 1, 1,
-1.148029, 0.8349754, -0.9653785, 1, 0, 0, 1, 1,
-1.147913, -0.6291615, -1.825147, 0, 0, 0, 1, 1,
-1.142079, 1.403544, -1.085998, 0, 0, 0, 1, 1,
-1.131572, -0.001629733, -1.376761, 0, 0, 0, 1, 1,
-1.130191, 1.124475, -1.260794, 0, 0, 0, 1, 1,
-1.125332, -0.1780339, -2.108725, 0, 0, 0, 1, 1,
-1.112492, 0.7737605, -1.560117, 0, 0, 0, 1, 1,
-1.109701, 0.5767148, 0.4492787, 0, 0, 0, 1, 1,
-1.105101, -1.367851, -2.947647, 1, 1, 1, 1, 1,
-1.096846, 0.5982607, -1.681805, 1, 1, 1, 1, 1,
-1.094458, -0.205362, -1.190785, 1, 1, 1, 1, 1,
-1.087784, -0.6484355, -1.317469, 1, 1, 1, 1, 1,
-1.087402, 0.1540457, -0.6871437, 1, 1, 1, 1, 1,
-1.077783, -0.8654487, -1.897047, 1, 1, 1, 1, 1,
-1.052896, 1.454424, 0.1182042, 1, 1, 1, 1, 1,
-1.046409, 0.2577322, -1.113186, 1, 1, 1, 1, 1,
-1.042876, -0.4934043, -2.043757, 1, 1, 1, 1, 1,
-1.03194, -1.09495, -1.640208, 1, 1, 1, 1, 1,
-1.031233, 0.2615232, -1.064617, 1, 1, 1, 1, 1,
-1.012395, -0.6849769, -1.540278, 1, 1, 1, 1, 1,
-1.012281, -1.426819, -3.595056, 1, 1, 1, 1, 1,
-1.009415, 1.094846, -1.524188, 1, 1, 1, 1, 1,
-1.008505, -0.09655951, -0.6739038, 1, 1, 1, 1, 1,
-1.007777, 0.2787081, 0.5078075, 0, 0, 1, 1, 1,
-1.001668, 0.12137, -1.034807, 1, 0, 0, 1, 1,
-0.9990432, -0.300369, -2.635055, 1, 0, 0, 1, 1,
-0.993025, 2.14046, -1.087819, 1, 0, 0, 1, 1,
-0.9827113, 0.01958713, 1.048459, 1, 0, 0, 1, 1,
-0.9795002, -0.4262011, -0.9037787, 1, 0, 0, 1, 1,
-0.979439, -0.08138406, -2.814452, 0, 0, 0, 1, 1,
-0.9793469, -1.425719, -0.0866872, 0, 0, 0, 1, 1,
-0.9754467, 0.6566645, -0.9872974, 0, 0, 0, 1, 1,
-0.9740922, -0.5666317, -1.776445, 0, 0, 0, 1, 1,
-0.9711943, 0.6852008, -1.007219, 0, 0, 0, 1, 1,
-0.9704171, 0.6973117, -1.915494, 0, 0, 0, 1, 1,
-0.9703587, -0.9098172, -2.532347, 0, 0, 0, 1, 1,
-0.9684671, -0.4619411, -2.082539, 1, 1, 1, 1, 1,
-0.9684412, 1.567291, -1.344619, 1, 1, 1, 1, 1,
-0.9635242, 0.3367729, -1.65647, 1, 1, 1, 1, 1,
-0.9615409, -0.379825, -2.384337, 1, 1, 1, 1, 1,
-0.9605988, -1.390849, -1.194135, 1, 1, 1, 1, 1,
-0.9478847, -0.1997176, -2.213449, 1, 1, 1, 1, 1,
-0.9478154, 0.1859616, -1.819477, 1, 1, 1, 1, 1,
-0.9438434, 0.468699, -0.5540951, 1, 1, 1, 1, 1,
-0.9413133, -0.01336224, -0.562474, 1, 1, 1, 1, 1,
-0.9353012, -0.09795793, -0.8342354, 1, 1, 1, 1, 1,
-0.9330602, -0.6568264, -2.816591, 1, 1, 1, 1, 1,
-0.9290972, 0.8395566, -1.860069, 1, 1, 1, 1, 1,
-0.9268349, 0.6165938, 0.4826738, 1, 1, 1, 1, 1,
-0.9261755, 0.2074895, -2.443338, 1, 1, 1, 1, 1,
-0.9232213, -1.592185, -2.463382, 1, 1, 1, 1, 1,
-0.9211408, -0.5410784, -2.087468, 0, 0, 1, 1, 1,
-0.9168977, -1.814623, -1.113058, 1, 0, 0, 1, 1,
-0.9161345, 0.6755164, -2.320223, 1, 0, 0, 1, 1,
-0.9150723, 2.067746, -1.069791, 1, 0, 0, 1, 1,
-0.914509, -0.07645277, -0.384115, 1, 0, 0, 1, 1,
-0.9074922, -0.792488, -1.749949, 1, 0, 0, 1, 1,
-0.9074666, 0.6176491, -1.190813, 0, 0, 0, 1, 1,
-0.9051074, 1.483865, -0.7997419, 0, 0, 0, 1, 1,
-0.904314, -0.1164866, -2.610749, 0, 0, 0, 1, 1,
-0.9030125, 0.3836114, -3.751512, 0, 0, 0, 1, 1,
-0.9021873, 0.7092736, -1.216508, 0, 0, 0, 1, 1,
-0.901873, 1.308029, -2.320657, 0, 0, 0, 1, 1,
-0.8969669, -1.441084, -2.630834, 0, 0, 0, 1, 1,
-0.8946401, -0.2256896, -2.962281, 1, 1, 1, 1, 1,
-0.8944035, -0.2780019, -1.608099, 1, 1, 1, 1, 1,
-0.8898079, 0.6169965, -1.423312, 1, 1, 1, 1, 1,
-0.8886231, -1.436202, -2.515811, 1, 1, 1, 1, 1,
-0.8851938, -0.5952351, -3.901962, 1, 1, 1, 1, 1,
-0.878329, 2.895613, -0.4313399, 1, 1, 1, 1, 1,
-0.8766573, -2.587179, -0.3037301, 1, 1, 1, 1, 1,
-0.8741585, 0.2479949, -1.374021, 1, 1, 1, 1, 1,
-0.870157, -0.2809638, -2.576535, 1, 1, 1, 1, 1,
-0.8656871, 0.3990762, -1.915992, 1, 1, 1, 1, 1,
-0.8541225, -0.2872759, -1.549976, 1, 1, 1, 1, 1,
-0.8515369, 0.6746171, -0.9272035, 1, 1, 1, 1, 1,
-0.8492248, 1.679638, -0.9775196, 1, 1, 1, 1, 1,
-0.8395899, 0.4544435, -1.359072, 1, 1, 1, 1, 1,
-0.8351488, -1.592026, -1.235736, 1, 1, 1, 1, 1,
-0.8319062, -0.4773697, -2.202431, 0, 0, 1, 1, 1,
-0.8296706, 0.227542, -1.406151, 1, 0, 0, 1, 1,
-0.8189771, -0.8558347, -2.553991, 1, 0, 0, 1, 1,
-0.8172758, 0.2469001, -3.473763, 1, 0, 0, 1, 1,
-0.8066628, 0.5361293, 0.5206193, 1, 0, 0, 1, 1,
-0.8013555, -1.158419, -3.120066, 1, 0, 0, 1, 1,
-0.7985777, -0.5847821, -0.7958139, 0, 0, 0, 1, 1,
-0.7965848, 1.249392, -1.592822, 0, 0, 0, 1, 1,
-0.7908689, -1.930408, -0.5590144, 0, 0, 0, 1, 1,
-0.784033, -0.09734704, -1.427389, 0, 0, 0, 1, 1,
-0.7839738, -0.6458992, -3.990055, 0, 0, 0, 1, 1,
-0.7804662, 1.602707, 0.5043186, 0, 0, 0, 1, 1,
-0.7753783, -0.3366725, -0.3637841, 0, 0, 0, 1, 1,
-0.7724646, 0.2472871, -2.36236, 1, 1, 1, 1, 1,
-0.7710487, 0.3166288, -2.226951, 1, 1, 1, 1, 1,
-0.766179, 0.3964334, -0.4970909, 1, 1, 1, 1, 1,
-0.762989, 1.898414, 0.05657118, 1, 1, 1, 1, 1,
-0.7581763, -0.5494599, -2.474275, 1, 1, 1, 1, 1,
-0.7546799, 0.366446, -0.7777546, 1, 1, 1, 1, 1,
-0.7515659, -1.581582, -3.130884, 1, 1, 1, 1, 1,
-0.7497268, 1.347901, -0.5896161, 1, 1, 1, 1, 1,
-0.7471475, -0.702238, -3.072214, 1, 1, 1, 1, 1,
-0.7467682, 0.192872, -1.701288, 1, 1, 1, 1, 1,
-0.7425994, -0.03687241, -1.849551, 1, 1, 1, 1, 1,
-0.7301423, 0.5369797, -0.283608, 1, 1, 1, 1, 1,
-0.7261469, -1.83041, -3.326055, 1, 1, 1, 1, 1,
-0.7256393, 0.4389821, -1.843942, 1, 1, 1, 1, 1,
-0.7239965, -0.2764544, -2.463699, 1, 1, 1, 1, 1,
-0.7238351, 0.4948271, -1.207668, 0, 0, 1, 1, 1,
-0.7220874, -0.3201546, -3.63177, 1, 0, 0, 1, 1,
-0.7193253, -0.3941734, -1.334869, 1, 0, 0, 1, 1,
-0.7157106, 0.07233685, 0.3702595, 1, 0, 0, 1, 1,
-0.7071417, 0.6842611, -2.154205, 1, 0, 0, 1, 1,
-0.7068444, 1.934287, -0.1959197, 1, 0, 0, 1, 1,
-0.7054191, 0.477396, -0.6975302, 0, 0, 0, 1, 1,
-0.7004886, 1.545823, -0.5835574, 0, 0, 0, 1, 1,
-0.698363, 0.607063, -1.065943, 0, 0, 0, 1, 1,
-0.6980263, 1.009837, -1.115356, 0, 0, 0, 1, 1,
-0.6923653, -1.100715, -3.010815, 0, 0, 0, 1, 1,
-0.6920242, -2.054662, -1.154029, 0, 0, 0, 1, 1,
-0.6913894, 0.5991192, -1.148302, 0, 0, 0, 1, 1,
-0.6893554, -0.08199362, -1.985487, 1, 1, 1, 1, 1,
-0.6866841, 0.6053718, -0.177733, 1, 1, 1, 1, 1,
-0.6803561, 0.3703197, 0.01147146, 1, 1, 1, 1, 1,
-0.6785942, 0.53421, -1.31283, 1, 1, 1, 1, 1,
-0.6773257, -0.3224172, -1.910589, 1, 1, 1, 1, 1,
-0.6758562, -1.236222, -3.879648, 1, 1, 1, 1, 1,
-0.6650399, -0.2466561, -1.771281, 1, 1, 1, 1, 1,
-0.661132, 0.04422376, -2.471568, 1, 1, 1, 1, 1,
-0.6576332, 0.9634989, -1.314074, 1, 1, 1, 1, 1,
-0.6575988, 0.4350203, -3.69526, 1, 1, 1, 1, 1,
-0.6531771, -1.264414, -3.309763, 1, 1, 1, 1, 1,
-0.6482549, 1.874165, 0.1137008, 1, 1, 1, 1, 1,
-0.6428674, -0.4656887, -0.9324818, 1, 1, 1, 1, 1,
-0.6371962, -0.6589093, -1.767715, 1, 1, 1, 1, 1,
-0.6355855, 0.04570733, -1.807776, 1, 1, 1, 1, 1,
-0.6346088, 0.7773328, 0.1249112, 0, 0, 1, 1, 1,
-0.6336567, 0.5776015, -1.009891, 1, 0, 0, 1, 1,
-0.6328634, -0.3497221, -2.237428, 1, 0, 0, 1, 1,
-0.6325137, 1.444218, -0.244139, 1, 0, 0, 1, 1,
-0.6313083, 0.3938986, -1.68534, 1, 0, 0, 1, 1,
-0.6266523, 0.5663366, -1.12544, 1, 0, 0, 1, 1,
-0.6248593, -1.15299, -4.528039, 0, 0, 0, 1, 1,
-0.6198823, -0.7263758, -2.36153, 0, 0, 0, 1, 1,
-0.6194163, 0.8149005, 0.192747, 0, 0, 0, 1, 1,
-0.6181464, -1.516213, -3.544883, 0, 0, 0, 1, 1,
-0.616318, -1.283327, -4.495233, 0, 0, 0, 1, 1,
-0.6136217, -0.2995974, -2.62857, 0, 0, 0, 1, 1,
-0.6123527, -1.233573, -2.561092, 0, 0, 0, 1, 1,
-0.6098215, 0.1431428, -0.5896313, 1, 1, 1, 1, 1,
-0.6070363, 0.1968447, 1.288854, 1, 1, 1, 1, 1,
-0.6040808, 0.3501715, -0.5847699, 1, 1, 1, 1, 1,
-0.6022942, 1.109846, -1.127731, 1, 1, 1, 1, 1,
-0.601487, -0.4468994, -1.181875, 1, 1, 1, 1, 1,
-0.6008207, -1.155338, -2.376066, 1, 1, 1, 1, 1,
-0.5987581, -0.106004, -1.819987, 1, 1, 1, 1, 1,
-0.5939081, -0.7607237, -1.381829, 1, 1, 1, 1, 1,
-0.58895, 0.5417391, -1.407461, 1, 1, 1, 1, 1,
-0.5865638, -0.295505, -0.3264056, 1, 1, 1, 1, 1,
-0.5861475, -1.372376, -0.435461, 1, 1, 1, 1, 1,
-0.5847167, 0.6353618, -1.597249, 1, 1, 1, 1, 1,
-0.5801468, -0.1345435, -1.517586, 1, 1, 1, 1, 1,
-0.5788757, 1.500915, -0.1176406, 1, 1, 1, 1, 1,
-0.5772645, 0.6491189, 2.296437, 1, 1, 1, 1, 1,
-0.5738222, 0.5948821, -1.677387, 0, 0, 1, 1, 1,
-0.5674164, -0.848397, -4.55297, 1, 0, 0, 1, 1,
-0.5672822, 2.334655, -0.1252263, 1, 0, 0, 1, 1,
-0.566863, -0.2626131, -2.99252, 1, 0, 0, 1, 1,
-0.5554262, -0.7189812, -3.020547, 1, 0, 0, 1, 1,
-0.5545751, -0.226623, -2.388783, 1, 0, 0, 1, 1,
-0.5543361, -0.9534216, -3.28844, 0, 0, 0, 1, 1,
-0.5535433, 0.6618159, -2.095464, 0, 0, 0, 1, 1,
-0.5499963, -0.2372389, -0.4218899, 0, 0, 0, 1, 1,
-0.548902, -0.1082742, -2.289244, 0, 0, 0, 1, 1,
-0.5459812, -1.309911, -3.506165, 0, 0, 0, 1, 1,
-0.5456974, 0.5483404, 1.520289, 0, 0, 0, 1, 1,
-0.5380601, -1.220595, -1.640969, 0, 0, 0, 1, 1,
-0.5288236, 1.327984, -0.8475797, 1, 1, 1, 1, 1,
-0.527863, 0.7984819, -0.05084489, 1, 1, 1, 1, 1,
-0.5209337, -0.5915736, -1.556812, 1, 1, 1, 1, 1,
-0.5207512, -0.5100727, -3.035806, 1, 1, 1, 1, 1,
-0.5190527, 0.1484206, -0.09925631, 1, 1, 1, 1, 1,
-0.516566, 0.5548189, -0.9257545, 1, 1, 1, 1, 1,
-0.5137045, 1.128598, 0.04172977, 1, 1, 1, 1, 1,
-0.5117701, -0.1916279, -0.9898816, 1, 1, 1, 1, 1,
-0.5101231, -1.320119, -1.979821, 1, 1, 1, 1, 1,
-0.5076501, -1.936767, -3.345495, 1, 1, 1, 1, 1,
-0.5049545, -0.329899, -2.270419, 1, 1, 1, 1, 1,
-0.5027273, 0.5775781, 0.8267113, 1, 1, 1, 1, 1,
-0.5003321, 1.272974, -1.938944, 1, 1, 1, 1, 1,
-0.4982984, 0.8362002, -1.691093, 1, 1, 1, 1, 1,
-0.4862669, -2.041286, -2.63384, 1, 1, 1, 1, 1,
-0.4860026, -1.476985, -3.984137, 0, 0, 1, 1, 1,
-0.4798907, -0.06298176, -1.511625, 1, 0, 0, 1, 1,
-0.4782608, -0.9450567, -2.888239, 1, 0, 0, 1, 1,
-0.4752188, 0.6161892, -1.584989, 1, 0, 0, 1, 1,
-0.4720212, 0.5015977, -0.4872224, 1, 0, 0, 1, 1,
-0.4687822, -1.550345, -3.023246, 1, 0, 0, 1, 1,
-0.4673708, -0.3307192, -2.43304, 0, 0, 0, 1, 1,
-0.4612093, 1.403518, -0.1796823, 0, 0, 0, 1, 1,
-0.45724, -1.470432, -1.497036, 0, 0, 0, 1, 1,
-0.4563057, -0.6387444, -2.217728, 0, 0, 0, 1, 1,
-0.4541234, -0.568731, -2.681572, 0, 0, 0, 1, 1,
-0.4533172, -0.04961598, -2.302537, 0, 0, 0, 1, 1,
-0.4517743, 0.4491319, -0.9661692, 0, 0, 0, 1, 1,
-0.4501247, 2.385592, -0.9572654, 1, 1, 1, 1, 1,
-0.4484164, 0.8874226, -1.751773, 1, 1, 1, 1, 1,
-0.4460371, 0.05876434, -1.263529, 1, 1, 1, 1, 1,
-0.4429041, -0.5351214, -1.496618, 1, 1, 1, 1, 1,
-0.4400581, 1.000141, -1.256065, 1, 1, 1, 1, 1,
-0.4368771, 0.4385617, -0.9451374, 1, 1, 1, 1, 1,
-0.4359931, 1.679303, 0.1093644, 1, 1, 1, 1, 1,
-0.4349666, 0.3343992, -1.284606, 1, 1, 1, 1, 1,
-0.4342744, 0.6130801, -0.009902013, 1, 1, 1, 1, 1,
-0.4322663, 0.2407208, -1.897335, 1, 1, 1, 1, 1,
-0.4305022, -0.5827764, -2.147646, 1, 1, 1, 1, 1,
-0.4279399, 0.9732452, -0.529625, 1, 1, 1, 1, 1,
-0.4212553, -0.06627169, 0.01581009, 1, 1, 1, 1, 1,
-0.4167029, -0.9576933, -2.749844, 1, 1, 1, 1, 1,
-0.4158397, -1.286602, -3.799158, 1, 1, 1, 1, 1,
-0.4096649, 0.8316565, 0.6721855, 0, 0, 1, 1, 1,
-0.4061866, -0.3058314, -2.448303, 1, 0, 0, 1, 1,
-0.4052953, 0.6517314, 1.18359, 1, 0, 0, 1, 1,
-0.4034054, -1.343045, -3.288216, 1, 0, 0, 1, 1,
-0.4030778, -1.77425, -3.400175, 1, 0, 0, 1, 1,
-0.3949997, 0.4863996, -1.026025, 1, 0, 0, 1, 1,
-0.3949036, 0.1353827, -2.346526, 0, 0, 0, 1, 1,
-0.3768541, 1.243907, -0.9434556, 0, 0, 0, 1, 1,
-0.3706179, -0.4831192, -2.365186, 0, 0, 0, 1, 1,
-0.3696015, -0.1743806, -3.877037, 0, 0, 0, 1, 1,
-0.3683524, -1.597947, -2.157332, 0, 0, 0, 1, 1,
-0.3654838, -0.3245206, -2.761731, 0, 0, 0, 1, 1,
-0.3635996, 0.3015216, 0.3405659, 0, 0, 0, 1, 1,
-0.3608024, 1.702801, 0.003323046, 1, 1, 1, 1, 1,
-0.3601382, -1.329593, -3.855586, 1, 1, 1, 1, 1,
-0.3494004, -0.2495824, -0.8396881, 1, 1, 1, 1, 1,
-0.3394715, 0.9989198, -0.279677, 1, 1, 1, 1, 1,
-0.3382472, 0.9612638, -0.5409853, 1, 1, 1, 1, 1,
-0.3372684, -0.1313613, -3.559917, 1, 1, 1, 1, 1,
-0.3366765, 1.075065, -0.1893521, 1, 1, 1, 1, 1,
-0.3353634, -1.211045, -3.771415, 1, 1, 1, 1, 1,
-0.3349656, -0.5553416, -2.025283, 1, 1, 1, 1, 1,
-0.3342427, 0.5496367, 0.3188914, 1, 1, 1, 1, 1,
-0.3289085, -0.272949, -1.874352, 1, 1, 1, 1, 1,
-0.3159207, 1.336862, -0.5308851, 1, 1, 1, 1, 1,
-0.3150822, 1.786102, 0.3450685, 1, 1, 1, 1, 1,
-0.313227, -1.111579, -3.556634, 1, 1, 1, 1, 1,
-0.3128549, 2.294271, 0.1105965, 1, 1, 1, 1, 1,
-0.3057414, 1.321561, -1.014081, 0, 0, 1, 1, 1,
-0.2985947, -1.245818, -3.085109, 1, 0, 0, 1, 1,
-0.2983568, -0.09663075, -2.034839, 1, 0, 0, 1, 1,
-0.2964132, -0.3648756, -3.595963, 1, 0, 0, 1, 1,
-0.29353, 0.95652, -0.4632555, 1, 0, 0, 1, 1,
-0.2933993, 0.03292268, -1.650431, 1, 0, 0, 1, 1,
-0.2928032, -0.09523941, 0.4002864, 0, 0, 0, 1, 1,
-0.2917961, -1.615438, -3.19042, 0, 0, 0, 1, 1,
-0.2892236, -0.9629438, -3.543117, 0, 0, 0, 1, 1,
-0.2813793, -0.4453097, -2.923317, 0, 0, 0, 1, 1,
-0.2776855, -0.825754, -2.253428, 0, 0, 0, 1, 1,
-0.2772589, -0.5258512, -1.892957, 0, 0, 0, 1, 1,
-0.2762848, -0.589823, -2.099397, 0, 0, 0, 1, 1,
-0.270775, -0.5818054, -1.08842, 1, 1, 1, 1, 1,
-0.2705751, -0.3244689, -1.960715, 1, 1, 1, 1, 1,
-0.2701632, -0.2953284, -2.279308, 1, 1, 1, 1, 1,
-0.2640105, -0.2375365, -2.338324, 1, 1, 1, 1, 1,
-0.2623708, 0.7155396, 0.8946313, 1, 1, 1, 1, 1,
-0.2623364, -0.07884037, -1.870028, 1, 1, 1, 1, 1,
-0.2622918, -0.06141862, -4.351375, 1, 1, 1, 1, 1,
-0.2595768, 0.6566246, 0.3404113, 1, 1, 1, 1, 1,
-0.2536221, 0.6316491, 0.1905084, 1, 1, 1, 1, 1,
-0.253464, -0.007404618, -1.457106, 1, 1, 1, 1, 1,
-0.2528637, -2.567406, -1.398159, 1, 1, 1, 1, 1,
-0.252225, 0.1241924, 0.4658793, 1, 1, 1, 1, 1,
-0.2485399, 1.538417, 1.962844, 1, 1, 1, 1, 1,
-0.2468197, -1.328449, -3.431661, 1, 1, 1, 1, 1,
-0.2443183, -1.869634, -3.442562, 1, 1, 1, 1, 1,
-0.2439139, 0.5316873, -1.431249, 0, 0, 1, 1, 1,
-0.2407411, -1.113733, -1.949365, 1, 0, 0, 1, 1,
-0.2386587, 1.175044, 0.9051544, 1, 0, 0, 1, 1,
-0.2381302, -1.129985, -4.360769, 1, 0, 0, 1, 1,
-0.2367566, 1.835272, -1.276658, 1, 0, 0, 1, 1,
-0.2302706, 2.414319, -2.080996, 1, 0, 0, 1, 1,
-0.2260003, 0.4398564, -0.3088546, 0, 0, 0, 1, 1,
-0.221412, 0.1023413, -0.2616936, 0, 0, 0, 1, 1,
-0.221096, 0.8201934, 0.03692035, 0, 0, 0, 1, 1,
-0.2193115, 0.2772678, -2.633902, 0, 0, 0, 1, 1,
-0.2129436, -0.6492317, -3.520336, 0, 0, 0, 1, 1,
-0.208229, 0.7594083, -0.2063369, 0, 0, 0, 1, 1,
-0.1992127, -0.02892334, -0.900955, 0, 0, 0, 1, 1,
-0.1986628, -0.6075602, -2.942924, 1, 1, 1, 1, 1,
-0.1965513, -0.05513742, -1.825808, 1, 1, 1, 1, 1,
-0.1945741, 0.3800774, 0.09018394, 1, 1, 1, 1, 1,
-0.1944574, -0.2571234, -4.265989, 1, 1, 1, 1, 1,
-0.192754, 0.6644055, -0.1954298, 1, 1, 1, 1, 1,
-0.1907069, 1.612098, -0.3721668, 1, 1, 1, 1, 1,
-0.1895144, -0.2277569, -1.697492, 1, 1, 1, 1, 1,
-0.1807337, -1.81941, -4.095356, 1, 1, 1, 1, 1,
-0.1793924, -0.6440945, -2.893633, 1, 1, 1, 1, 1,
-0.1779971, 1.715183, 0.3836991, 1, 1, 1, 1, 1,
-0.1777688, -0.3046282, -1.430187, 1, 1, 1, 1, 1,
-0.175977, -2.209004, -3.742463, 1, 1, 1, 1, 1,
-0.175556, 0.148434, -0.569852, 1, 1, 1, 1, 1,
-0.1746559, 1.462903, 0.4493561, 1, 1, 1, 1, 1,
-0.1743229, -1.01245, -1.889945, 1, 1, 1, 1, 1,
-0.1740804, 0.9357395, -0.8099681, 0, 0, 1, 1, 1,
-0.1732171, -2.145046, -3.722046, 1, 0, 0, 1, 1,
-0.1712897, -0.2784465, -2.134888, 1, 0, 0, 1, 1,
-0.1706189, -1.191807, -2.619865, 1, 0, 0, 1, 1,
-0.1669731, -0.165141, -2.934831, 1, 0, 0, 1, 1,
-0.1643598, -1.162382, -3.472271, 1, 0, 0, 1, 1,
-0.1624216, 0.1203129, -0.8558068, 0, 0, 0, 1, 1,
-0.1621493, -0.04720763, -3.600219, 0, 0, 0, 1, 1,
-0.1609592, 0.4030104, -3.060596, 0, 0, 0, 1, 1,
-0.1556597, 1.400305, -2.121209, 0, 0, 0, 1, 1,
-0.1554113, 2.094609, -0.2625961, 0, 0, 0, 1, 1,
-0.1538472, 0.6970131, -0.7223268, 0, 0, 0, 1, 1,
-0.1532207, 0.05439052, -0.1037015, 0, 0, 0, 1, 1,
-0.1464809, -0.8332688, -2.343549, 1, 1, 1, 1, 1,
-0.1442516, 0.2034563, -0.4163937, 1, 1, 1, 1, 1,
-0.143906, 0.3027982, -1.939708, 1, 1, 1, 1, 1,
-0.1432841, 0.5528014, 0.7873673, 1, 1, 1, 1, 1,
-0.1418824, -0.3217393, -3.971998, 1, 1, 1, 1, 1,
-0.1379127, -0.5683482, -2.990647, 1, 1, 1, 1, 1,
-0.1370827, 2.16435, -1.386372, 1, 1, 1, 1, 1,
-0.1350309, 0.4811682, -1.275373, 1, 1, 1, 1, 1,
-0.1321244, -0.1692267, -1.477894, 1, 1, 1, 1, 1,
-0.1269681, 0.6496221, -0.2501727, 1, 1, 1, 1, 1,
-0.1214083, -1.619702, -1.906987, 1, 1, 1, 1, 1,
-0.1208631, 1.565769, -0.06395999, 1, 1, 1, 1, 1,
-0.1149736, 0.1830118, 0.4184603, 1, 1, 1, 1, 1,
-0.108891, -0.08801966, -3.269902, 1, 1, 1, 1, 1,
-0.102217, -0.4965561, -1.406202, 1, 1, 1, 1, 1,
-0.09771919, 1.151575, -0.5067003, 0, 0, 1, 1, 1,
-0.09664737, -2.00929, -3.238986, 1, 0, 0, 1, 1,
-0.09115602, -2.25034, -2.328585, 1, 0, 0, 1, 1,
-0.08993681, 2.200428, 0.7647195, 1, 0, 0, 1, 1,
-0.08849402, 0.5201489, -0.1633794, 1, 0, 0, 1, 1,
-0.08837931, 0.7422788, -1.934198, 1, 0, 0, 1, 1,
-0.08735783, 2.839678, -0.6561261, 0, 0, 0, 1, 1,
-0.0859613, 1.675338, 0.2649905, 0, 0, 0, 1, 1,
-0.0856439, 1.589668, -0.2793385, 0, 0, 0, 1, 1,
-0.08329811, 0.8780481, 0.2743324, 0, 0, 0, 1, 1,
-0.08188476, -1.083011, -2.527004, 0, 0, 0, 1, 1,
-0.07827539, -0.7065043, -4.002931, 0, 0, 0, 1, 1,
-0.07785356, 0.4973903, 0.1040507, 0, 0, 0, 1, 1,
-0.07781909, 0.6729361, -1.703758, 1, 1, 1, 1, 1,
-0.07718994, 0.4498814, -0.4300817, 1, 1, 1, 1, 1,
-0.07561909, -1.023364, -3.724634, 1, 1, 1, 1, 1,
-0.07354953, 0.7488266, -0.8589197, 1, 1, 1, 1, 1,
-0.07123071, 0.8217927, -2.210252, 1, 1, 1, 1, 1,
-0.06286441, 1.001212, 1.497498, 1, 1, 1, 1, 1,
-0.058832, 0.723411, 0.7585573, 1, 1, 1, 1, 1,
-0.05882355, -0.847378, -3.114597, 1, 1, 1, 1, 1,
-0.05755345, -0.1711888, -1.248674, 1, 1, 1, 1, 1,
-0.05190198, -0.1942061, -1.98578, 1, 1, 1, 1, 1,
-0.04944703, -1.069019, -2.242988, 1, 1, 1, 1, 1,
-0.04459474, -0.7947156, -2.925387, 1, 1, 1, 1, 1,
-0.04398471, 0.7357246, -2.325687, 1, 1, 1, 1, 1,
-0.04167605, -1.277169, -3.159611, 1, 1, 1, 1, 1,
-0.04117639, -1.316346, -4.019692, 1, 1, 1, 1, 1,
-0.04072185, 1.490269, -0.5906869, 0, 0, 1, 1, 1,
-0.03975344, 0.6252707, -0.552331, 1, 0, 0, 1, 1,
-0.03758061, 1.008586, 0.7044917, 1, 0, 0, 1, 1,
-0.03619599, 1.672372, 0.01324286, 1, 0, 0, 1, 1,
-0.03490012, 0.3260468, 0.3381878, 1, 0, 0, 1, 1,
-0.0331192, 0.6382252, -0.8302498, 1, 0, 0, 1, 1,
-0.03277737, -0.3660749, -1.832568, 0, 0, 0, 1, 1,
-0.0270286, 0.9660636, -0.7339537, 0, 0, 0, 1, 1,
-0.02308557, -0.4678831, -3.650369, 0, 0, 0, 1, 1,
-0.02223834, 0.6026021, 0.6981068, 0, 0, 0, 1, 1,
-0.021541, 0.009806527, -0.5646261, 0, 0, 0, 1, 1,
-0.02151229, 1.950858, -1.299988, 0, 0, 0, 1, 1,
-0.01370015, 1.001961, 1.684726, 0, 0, 0, 1, 1,
-0.01151795, 0.3317321, -0.8548642, 1, 1, 1, 1, 1,
-0.01128393, -1.055205, -3.858485, 1, 1, 1, 1, 1,
-0.01083491, 0.5810299, -0.9956465, 1, 1, 1, 1, 1,
-0.006988265, 0.6693301, 0.8153228, 1, 1, 1, 1, 1,
-0.004644716, 1.281053, -1.010447, 1, 1, 1, 1, 1,
-0.002181519, -0.7067985, -3.549572, 1, 1, 1, 1, 1,
-0.001980733, -2.348772, -2.932609, 1, 1, 1, 1, 1,
0.004908899, 1.557379, -0.00976689, 1, 1, 1, 1, 1,
0.005677441, -0.3635852, 0.6402119, 1, 1, 1, 1, 1,
0.00574904, 1.246773, 0.09490106, 1, 1, 1, 1, 1,
0.006969617, -0.205917, 3.367087, 1, 1, 1, 1, 1,
0.007319789, -0.7424964, 3.340016, 1, 1, 1, 1, 1,
0.00748193, -1.085871, 0.8778934, 1, 1, 1, 1, 1,
0.009698425, -0.02323336, 1.943937, 1, 1, 1, 1, 1,
0.01247599, -1.522778, 3.548416, 1, 1, 1, 1, 1,
0.01464228, 0.6618041, 0.2972386, 0, 0, 1, 1, 1,
0.02000452, -0.1323846, 2.619756, 1, 0, 0, 1, 1,
0.02344565, -0.957185, 1.684943, 1, 0, 0, 1, 1,
0.02567926, 0.1422799, -0.5425496, 1, 0, 0, 1, 1,
0.02651683, 0.4647094, 0.1288452, 1, 0, 0, 1, 1,
0.03032528, 0.7038351, -1.785484, 1, 0, 0, 1, 1,
0.03086234, -0.4833399, 4.630436, 0, 0, 0, 1, 1,
0.03155119, -2.434489, 3.387602, 0, 0, 0, 1, 1,
0.03233282, 1.526564, -0.2019565, 0, 0, 0, 1, 1,
0.03505598, -0.6173947, 4.353576, 0, 0, 0, 1, 1,
0.03623918, 1.034746, 0.6142163, 0, 0, 0, 1, 1,
0.03751417, -1.118018, 2.603057, 0, 0, 0, 1, 1,
0.04278702, -0.108293, 2.366065, 0, 0, 0, 1, 1,
0.04933518, -1.811496, 2.753688, 1, 1, 1, 1, 1,
0.05076076, 0.1700162, 1.025435, 1, 1, 1, 1, 1,
0.0562364, 2.488431, 1.823126, 1, 1, 1, 1, 1,
0.06297234, 0.3634496, 0.4693709, 1, 1, 1, 1, 1,
0.06832296, 1.23875, 1.607791, 1, 1, 1, 1, 1,
0.06923985, -0.7898303, 3.649068, 1, 1, 1, 1, 1,
0.07228797, 0.5810996, -0.4631857, 1, 1, 1, 1, 1,
0.07506191, -1.701992, 5.114637, 1, 1, 1, 1, 1,
0.07624275, 1.176749, -0.1277454, 1, 1, 1, 1, 1,
0.07717653, 0.3365478, -0.146595, 1, 1, 1, 1, 1,
0.07755385, 1.805214, -0.6934564, 1, 1, 1, 1, 1,
0.07952231, -0.6338434, 3.97177, 1, 1, 1, 1, 1,
0.08344774, -0.792877, 3.456761, 1, 1, 1, 1, 1,
0.08511042, -0.2262288, 2.538558, 1, 1, 1, 1, 1,
0.08947425, -1.410033, 3.125046, 1, 1, 1, 1, 1,
0.09022937, 0.4525609, -0.5907614, 0, 0, 1, 1, 1,
0.092071, 2.09598, -2.034856, 1, 0, 0, 1, 1,
0.09348607, -0.280809, 2.397389, 1, 0, 0, 1, 1,
0.09389041, -0.5817812, 2.654888, 1, 0, 0, 1, 1,
0.09717136, 0.3561064, -1.593699, 1, 0, 0, 1, 1,
0.09752283, 0.908519, -1.131768, 1, 0, 0, 1, 1,
0.101704, 0.4919071, -0.6365578, 0, 0, 0, 1, 1,
0.1018402, 0.3203513, 2.105989, 0, 0, 0, 1, 1,
0.1097555, 0.3795305, -1.192636, 0, 0, 0, 1, 1,
0.1114084, -0.3458627, 3.40188, 0, 0, 0, 1, 1,
0.1123268, 1.40774, 1.420137, 0, 0, 0, 1, 1,
0.1144471, 1.18089, -0.4631425, 0, 0, 0, 1, 1,
0.1157994, -0.1537007, 3.329329, 0, 0, 0, 1, 1,
0.1160934, -0.5625088, 1.983656, 1, 1, 1, 1, 1,
0.1172, -0.5125159, 2.382805, 1, 1, 1, 1, 1,
0.1182731, 0.5966381, -0.09517199, 1, 1, 1, 1, 1,
0.1186961, 0.05656352, 2.683422, 1, 1, 1, 1, 1,
0.1215761, -0.4416724, 3.408426, 1, 1, 1, 1, 1,
0.1218536, -0.03661772, 0.9726937, 1, 1, 1, 1, 1,
0.1245478, -0.6642917, 2.71363, 1, 1, 1, 1, 1,
0.1321434, -0.04029832, 1.951782, 1, 1, 1, 1, 1,
0.1330178, 2.028027, -0.343078, 1, 1, 1, 1, 1,
0.1356518, -0.6745604, 3.053152, 1, 1, 1, 1, 1,
0.1368655, 0.3647647, -0.6387948, 1, 1, 1, 1, 1,
0.13833, -0.2148402, 2.91627, 1, 1, 1, 1, 1,
0.1390737, 0.550359, -0.909484, 1, 1, 1, 1, 1,
0.1416397, -2.38407, 3.364138, 1, 1, 1, 1, 1,
0.1422316, 1.327435, 1.841842, 1, 1, 1, 1, 1,
0.1425041, 0.8537958, 1.891927, 0, 0, 1, 1, 1,
0.1427162, -1.972743, 2.699744, 1, 0, 0, 1, 1,
0.1434621, 1.03846, 0.7356699, 1, 0, 0, 1, 1,
0.1446545, 1.800315, -2.18046, 1, 0, 0, 1, 1,
0.1533714, -1.317725, 3.250143, 1, 0, 0, 1, 1,
0.1586783, 0.666689, 1.442041, 1, 0, 0, 1, 1,
0.1627691, -0.3493866, 4.454114, 0, 0, 0, 1, 1,
0.1677299, 0.4333135, -0.6304812, 0, 0, 0, 1, 1,
0.1708992, -0.8503793, 3.122959, 0, 0, 0, 1, 1,
0.1742521, -0.3026441, 2.118546, 0, 0, 0, 1, 1,
0.1747508, -0.9764304, 1.872413, 0, 0, 0, 1, 1,
0.1793086, 0.9731312, 0.0590894, 0, 0, 0, 1, 1,
0.1797839, 0.7350438, -1.478881, 0, 0, 0, 1, 1,
0.1812976, 0.6154479, 0.7641157, 1, 1, 1, 1, 1,
0.1822174, 1.647263, 0.2789953, 1, 1, 1, 1, 1,
0.1845506, -0.7405198, 2.364394, 1, 1, 1, 1, 1,
0.1846163, 0.4459157, -0.7611089, 1, 1, 1, 1, 1,
0.1850556, -0.7889081, 2.909784, 1, 1, 1, 1, 1,
0.1889742, -1.793162, 2.689341, 1, 1, 1, 1, 1,
0.1976824, 0.9331097, 0.2653923, 1, 1, 1, 1, 1,
0.200024, -0.874825, 2.367919, 1, 1, 1, 1, 1,
0.2019696, -2.313398, 2.647391, 1, 1, 1, 1, 1,
0.2091914, -1.463322, 3.753804, 1, 1, 1, 1, 1,
0.211946, 0.4238899, 0.8826911, 1, 1, 1, 1, 1,
0.2158425, 1.291234, 0.631479, 1, 1, 1, 1, 1,
0.2226669, -0.822762, 2.024423, 1, 1, 1, 1, 1,
0.2228432, -0.5807529, 0.6362317, 1, 1, 1, 1, 1,
0.2234415, 0.2100421, 0.962269, 1, 1, 1, 1, 1,
0.2308816, 0.1204728, 0.1207386, 0, 0, 1, 1, 1,
0.2314606, 0.9728364, 0.5213316, 1, 0, 0, 1, 1,
0.2316789, -1.77058, 1.670354, 1, 0, 0, 1, 1,
0.2342207, -1.390599, 2.336807, 1, 0, 0, 1, 1,
0.234302, 0.5090579, 0.7291208, 1, 0, 0, 1, 1,
0.2411025, 0.1583808, 0.2802453, 1, 0, 0, 1, 1,
0.2433238, -0.7089099, 2.296504, 0, 0, 0, 1, 1,
0.2456974, -0.5496652, 2.736066, 0, 0, 0, 1, 1,
0.2460161, 0.9280479, -0.2877891, 0, 0, 0, 1, 1,
0.2463318, 0.834969, 1.877214, 0, 0, 0, 1, 1,
0.2476887, 1.684989, -0.03325757, 0, 0, 0, 1, 1,
0.2483936, -1.859109, 2.244305, 0, 0, 0, 1, 1,
0.2489813, -0.8505023, 3.505402, 0, 0, 0, 1, 1,
0.2520132, -1.716434, 1.425, 1, 1, 1, 1, 1,
0.254108, 0.7443168, 2.842913, 1, 1, 1, 1, 1,
0.2552453, 0.5190234, 0.8094028, 1, 1, 1, 1, 1,
0.2593378, 1.847004, -0.3031484, 1, 1, 1, 1, 1,
0.259903, -0.03680928, 2.45294, 1, 1, 1, 1, 1,
0.2637408, 0.7944199, -0.3489056, 1, 1, 1, 1, 1,
0.2684248, 1.294881, -0.4922347, 1, 1, 1, 1, 1,
0.273178, 0.4612255, 0.376996, 1, 1, 1, 1, 1,
0.273925, 0.2164551, 0.6289884, 1, 1, 1, 1, 1,
0.2750809, -0.1442266, 1.949409, 1, 1, 1, 1, 1,
0.2757697, -0.2875291, 1.328963, 1, 1, 1, 1, 1,
0.2762692, -1.355802, 1.244445, 1, 1, 1, 1, 1,
0.2774282, 0.8000772, -1.825105, 1, 1, 1, 1, 1,
0.2780872, 1.606694, 1.036074, 1, 1, 1, 1, 1,
0.2830756, -0.7447141, 2.634067, 1, 1, 1, 1, 1,
0.2924739, 0.6054766, 1.235871, 0, 0, 1, 1, 1,
0.2927562, -1.784009, 1.542539, 1, 0, 0, 1, 1,
0.2949562, -0.3222248, 1.589121, 1, 0, 0, 1, 1,
0.2950182, 1.152482, -0.03580368, 1, 0, 0, 1, 1,
0.2972315, -0.9613141, 3.577898, 1, 0, 0, 1, 1,
0.2990857, 0.2078861, 0.09469929, 1, 0, 0, 1, 1,
0.3055007, -0.5584879, 2.652557, 0, 0, 0, 1, 1,
0.309503, -0.6651552, 3.94396, 0, 0, 0, 1, 1,
0.3097729, -1.2415, 1.643166, 0, 0, 0, 1, 1,
0.3145085, 0.1693374, 0.280926, 0, 0, 0, 1, 1,
0.3186118, 0.3180416, -0.04227946, 0, 0, 0, 1, 1,
0.3195563, 0.64478, 0.03342309, 0, 0, 0, 1, 1,
0.3204905, -1.890714, 2.740887, 0, 0, 0, 1, 1,
0.3217006, -0.5863277, 3.996288, 1, 1, 1, 1, 1,
0.3230931, 2.977964, 0.1644084, 1, 1, 1, 1, 1,
0.3279777, 1.394229, -0.1960711, 1, 1, 1, 1, 1,
0.3289427, 1.113453, 0.4871834, 1, 1, 1, 1, 1,
0.3311259, -0.08689015, 1.597576, 1, 1, 1, 1, 1,
0.3322634, 0.2273456, 1.42788, 1, 1, 1, 1, 1,
0.3326769, -0.6518598, 0.820621, 1, 1, 1, 1, 1,
0.3338832, -1.205443, 4.394413, 1, 1, 1, 1, 1,
0.3355656, -0.3338343, 2.640044, 1, 1, 1, 1, 1,
0.3376985, 1.908809, -0.6149706, 1, 1, 1, 1, 1,
0.339129, 0.4082012, 0.4790413, 1, 1, 1, 1, 1,
0.3402548, -0.4648907, 2.118923, 1, 1, 1, 1, 1,
0.3410412, -0.4271056, 3.12106, 1, 1, 1, 1, 1,
0.3423825, 0.8942075, 0.7839575, 1, 1, 1, 1, 1,
0.3439155, -0.1536496, 2.106633, 1, 1, 1, 1, 1,
0.3457273, -0.7192681, 2.600071, 0, 0, 1, 1, 1,
0.3467911, -0.3768362, 3.637566, 1, 0, 0, 1, 1,
0.3505352, -1.829134, 3.19868, 1, 0, 0, 1, 1,
0.3528842, -0.05648477, 1.848948, 1, 0, 0, 1, 1,
0.3542061, 0.02332536, 1.827479, 1, 0, 0, 1, 1,
0.3563094, 0.4445738, -0.6218601, 1, 0, 0, 1, 1,
0.3571185, 1.473245, -0.03837703, 0, 0, 0, 1, 1,
0.3608504, -0.8817978, 4.411204, 0, 0, 0, 1, 1,
0.362065, 0.9655497, 0.25713, 0, 0, 0, 1, 1,
0.3638018, -0.3123759, 3.602229, 0, 0, 0, 1, 1,
0.3666227, -1.38464, 4.169337, 0, 0, 0, 1, 1,
0.3723213, -0.1417581, 2.805962, 0, 0, 0, 1, 1,
0.3789716, -0.9135667, 2.919349, 0, 0, 0, 1, 1,
0.3795261, 0.1935698, 2.84183, 1, 1, 1, 1, 1,
0.3797795, 0.4910326, 1.153267, 1, 1, 1, 1, 1,
0.3864986, -0.76259, 3.42144, 1, 1, 1, 1, 1,
0.3866822, -0.7563354, 2.693362, 1, 1, 1, 1, 1,
0.3883091, 0.718848, 1.023431, 1, 1, 1, 1, 1,
0.3896626, 0.4303968, 1.098669, 1, 1, 1, 1, 1,
0.3986355, -1.222144, 2.610609, 1, 1, 1, 1, 1,
0.4053133, -0.2210545, 1.481708, 1, 1, 1, 1, 1,
0.4068226, 0.3008911, 1.171144, 1, 1, 1, 1, 1,
0.4076378, 1.14825, 1.365061, 1, 1, 1, 1, 1,
0.4105167, 0.8053346, 0.9373369, 1, 1, 1, 1, 1,
0.4108774, -1.549604, 4.212244, 1, 1, 1, 1, 1,
0.4115224, -0.1128745, 2.069727, 1, 1, 1, 1, 1,
0.4120583, -1.450117, 4.336366, 1, 1, 1, 1, 1,
0.4212807, 1.134789, 1.388933, 1, 1, 1, 1, 1,
0.4224506, 0.4010748, 0.7053315, 0, 0, 1, 1, 1,
0.42304, 0.4049396, 1.485258, 1, 0, 0, 1, 1,
0.4236398, -0.268227, 2.411917, 1, 0, 0, 1, 1,
0.4261597, 0.1998052, 1.117292, 1, 0, 0, 1, 1,
0.4299006, 0.7064004, 1.655404, 1, 0, 0, 1, 1,
0.4318849, 0.921329, 1.621772, 1, 0, 0, 1, 1,
0.4368668, -0.003381975, 1.407815, 0, 0, 0, 1, 1,
0.439315, 0.5347099, -0.5109705, 0, 0, 0, 1, 1,
0.441945, -0.2782961, -0.311738, 0, 0, 0, 1, 1,
0.4471634, -0.1853702, 3.620082, 0, 0, 0, 1, 1,
0.4550529, -0.03497275, 2.877778, 0, 0, 0, 1, 1,
0.4707137, -0.04604684, 3.1287, 0, 0, 0, 1, 1,
0.4876285, 0.1004797, 0.6500813, 0, 0, 0, 1, 1,
0.4912954, -0.9493124, 2.921961, 1, 1, 1, 1, 1,
0.4947191, 0.1684371, 1.078245, 1, 1, 1, 1, 1,
0.4950485, -0.03036613, 3.488097, 1, 1, 1, 1, 1,
0.4970289, 0.4306892, -1.066162, 1, 1, 1, 1, 1,
0.4991871, -0.6193995, 3.393707, 1, 1, 1, 1, 1,
0.5015218, -0.9685516, 2.775122, 1, 1, 1, 1, 1,
0.5018197, 0.002269248, 1.122326, 1, 1, 1, 1, 1,
0.5029377, 0.7707628, -0.5661803, 1, 1, 1, 1, 1,
0.5045747, -0.7484441, 2.860718, 1, 1, 1, 1, 1,
0.5051819, 1.096876, -0.2068532, 1, 1, 1, 1, 1,
0.5081794, -0.439153, 3.265479, 1, 1, 1, 1, 1,
0.5185311, -0.4614294, 1.710022, 1, 1, 1, 1, 1,
0.5186672, -0.4251231, 1.46575, 1, 1, 1, 1, 1,
0.5241867, 0.7124222, 0.7258165, 1, 1, 1, 1, 1,
0.5302968, -0.0757532, 0.3199815, 1, 1, 1, 1, 1,
0.5312383, 0.2486836, 1.513184, 0, 0, 1, 1, 1,
0.5393479, -0.5256188, 0.6498123, 1, 0, 0, 1, 1,
0.5411971, -0.8947701, 2.125388, 1, 0, 0, 1, 1,
0.5602255, -0.8284593, 3.087356, 1, 0, 0, 1, 1,
0.5603609, 0.3883017, 1.971957, 1, 0, 0, 1, 1,
0.5623732, -0.861064, 2.851191, 1, 0, 0, 1, 1,
0.5634323, -0.1544685, 1.24438, 0, 0, 0, 1, 1,
0.5639957, 1.536672, 0.7530206, 0, 0, 0, 1, 1,
0.5642319, -0.09254076, 1.894901, 0, 0, 0, 1, 1,
0.5667367, -0.9043086, 1.186613, 0, 0, 0, 1, 1,
0.567433, -0.09804046, 1.974217, 0, 0, 0, 1, 1,
0.5694185, 0.7271104, 0.6610989, 0, 0, 0, 1, 1,
0.5698186, 1.193048, -0.08118917, 0, 0, 0, 1, 1,
0.5748975, -1.117431, 4.454128, 1, 1, 1, 1, 1,
0.5780625, -1.296519, 3.557788, 1, 1, 1, 1, 1,
0.5811463, 0.09776137, 2.061659, 1, 1, 1, 1, 1,
0.5824462, -0.7043473, 3.933315, 1, 1, 1, 1, 1,
0.584805, -0.3384053, 2.845513, 1, 1, 1, 1, 1,
0.5874552, -0.2396469, 2.389637, 1, 1, 1, 1, 1,
0.5877928, 0.4275777, 0.4854779, 1, 1, 1, 1, 1,
0.5912433, -0.1861102, 1.676251, 1, 1, 1, 1, 1,
0.5930671, 0.6473305, 0.2228223, 1, 1, 1, 1, 1,
0.6065252, 0.6269209, -1.36364, 1, 1, 1, 1, 1,
0.6116737, -7.979906e-05, 1.449227, 1, 1, 1, 1, 1,
0.6163711, 0.4904709, 1.021868, 1, 1, 1, 1, 1,
0.6173042, -0.631147, 2.44711, 1, 1, 1, 1, 1,
0.6173044, -0.2045952, 2.483874, 1, 1, 1, 1, 1,
0.6201305, 1.376107, 0.2756764, 1, 1, 1, 1, 1,
0.6213017, -0.4985176, 3.155603, 0, 0, 1, 1, 1,
0.6268142, 0.968177, 1.086391, 1, 0, 0, 1, 1,
0.6271844, 0.4409373, 1.879952, 1, 0, 0, 1, 1,
0.6296809, -0.4813733, 2.867762, 1, 0, 0, 1, 1,
0.6301379, 0.5590501, 0.9298655, 1, 0, 0, 1, 1,
0.6322322, -1.300199, 2.710897, 1, 0, 0, 1, 1,
0.6355387, -1.766732, 4.744175, 0, 0, 0, 1, 1,
0.6360322, -0.03241618, 1.596262, 0, 0, 0, 1, 1,
0.6435733, 0.2480203, 2.461091, 0, 0, 0, 1, 1,
0.6446806, -1.415993, 0.009277874, 0, 0, 0, 1, 1,
0.6454721, -0.6554636, 4.293259, 0, 0, 0, 1, 1,
0.6498954, -1.269273, 2.816947, 0, 0, 0, 1, 1,
0.6510201, 0.39423, 0.9245796, 0, 0, 0, 1, 1,
0.6542313, -0.8439248, 0.6597264, 1, 1, 1, 1, 1,
0.6547601, 0.7993197, 0.678082, 1, 1, 1, 1, 1,
0.6630051, -1.393988, 3.160908, 1, 1, 1, 1, 1,
0.6631035, 0.172597, 3.023121, 1, 1, 1, 1, 1,
0.6669002, 0.6654013, 0.2132601, 1, 1, 1, 1, 1,
0.6670025, -1.150542, 2.348651, 1, 1, 1, 1, 1,
0.6699197, -0.6377836, 0.8575947, 1, 1, 1, 1, 1,
0.6779884, -0.2547089, 0.4037865, 1, 1, 1, 1, 1,
0.6828582, -0.4598457, 1.930909, 1, 1, 1, 1, 1,
0.682979, 1.692033, 1.537347, 1, 1, 1, 1, 1,
0.6939425, -0.2967453, 3.072441, 1, 1, 1, 1, 1,
0.696059, 1.136849, -0.4680145, 1, 1, 1, 1, 1,
0.6966654, 0.2289781, 1.732663, 1, 1, 1, 1, 1,
0.6991133, -0.463299, 2.372056, 1, 1, 1, 1, 1,
0.7008055, -0.1980697, 2.679864, 1, 1, 1, 1, 1,
0.7010387, -0.28022, 0.8060232, 0, 0, 1, 1, 1,
0.7141942, 0.1205624, 2.085962, 1, 0, 0, 1, 1,
0.7222929, -0.4248258, 1.368077, 1, 0, 0, 1, 1,
0.7228151, -0.2053807, 2.153656, 1, 0, 0, 1, 1,
0.723956, 1.439646, 0.7841644, 1, 0, 0, 1, 1,
0.7248043, -1.12752, 1.499801, 1, 0, 0, 1, 1,
0.7288545, 0.215601, 0.8245391, 0, 0, 0, 1, 1,
0.7301537, 0.2067888, 3.423345, 0, 0, 0, 1, 1,
0.7375277, -1.467115, 1.044752, 0, 0, 0, 1, 1,
0.7401703, -1.622539, 3.607951, 0, 0, 0, 1, 1,
0.742779, 0.4053981, 1.216016, 0, 0, 0, 1, 1,
0.7473495, -1.978792, 5.733147, 0, 0, 0, 1, 1,
0.7473871, 0.4789524, 3.448345, 0, 0, 0, 1, 1,
0.7488854, 0.8959612, 0.3605133, 1, 1, 1, 1, 1,
0.752243, 0.6644587, -0.3785845, 1, 1, 1, 1, 1,
0.7686535, 0.3735765, 2.896781, 1, 1, 1, 1, 1,
0.7709768, 1.346767, 0.8793371, 1, 1, 1, 1, 1,
0.7715514, -0.6135744, 2.30582, 1, 1, 1, 1, 1,
0.7715889, -0.4372946, 1.746713, 1, 1, 1, 1, 1,
0.7751784, 0.7190064, 1.257131, 1, 1, 1, 1, 1,
0.7772223, 0.8786846, 0.09771006, 1, 1, 1, 1, 1,
0.778217, -0.6745391, 2.025166, 1, 1, 1, 1, 1,
0.7787417, -0.2336398, 3.003668, 1, 1, 1, 1, 1,
0.7855693, 0.6084235, 1.807184, 1, 1, 1, 1, 1,
0.7870919, 0.1528421, 0.7034417, 1, 1, 1, 1, 1,
0.7897345, -0.0789344, 1.946309, 1, 1, 1, 1, 1,
0.7923625, -0.3544819, 0.9959892, 1, 1, 1, 1, 1,
0.7930908, -0.2638708, 3.565312, 1, 1, 1, 1, 1,
0.7944552, -0.02341322, 1.434364, 0, 0, 1, 1, 1,
0.7992249, 1.057207, 1.557594, 1, 0, 0, 1, 1,
0.8017527, -0.923198, 1.731441, 1, 0, 0, 1, 1,
0.8043105, -0.2944357, 1.653455, 1, 0, 0, 1, 1,
0.8093353, -1.407445, 3.731119, 1, 0, 0, 1, 1,
0.8119251, -0.5058525, 3.104229, 1, 0, 0, 1, 1,
0.8188973, -0.8496236, 3.81863, 0, 0, 0, 1, 1,
0.8193182, 0.7887384, -0.689064, 0, 0, 0, 1, 1,
0.8217102, 0.8525066, -0.3908862, 0, 0, 0, 1, 1,
0.8236695, -0.2216513, 1.440985, 0, 0, 0, 1, 1,
0.82415, -0.9416619, 2.914889, 0, 0, 0, 1, 1,
0.8249969, -0.07597163, 0.9910672, 0, 0, 0, 1, 1,
0.8353549, -1.039233, 1.528425, 0, 0, 0, 1, 1,
0.8356351, 1.364632, 1.4266, 1, 1, 1, 1, 1,
0.8404562, 0.8370099, -0.4725975, 1, 1, 1, 1, 1,
0.8493573, -0.6707074, -0.4221437, 1, 1, 1, 1, 1,
0.8494911, 0.2910604, 0.7432262, 1, 1, 1, 1, 1,
0.8529288, 0.08792191, 1.818939, 1, 1, 1, 1, 1,
0.8575655, -1.580142, 4.509098, 1, 1, 1, 1, 1,
0.8680063, -1.125852, 2.855327, 1, 1, 1, 1, 1,
0.8697486, -0.8416332, 1.69982, 1, 1, 1, 1, 1,
0.8765186, 1.021071, 3.281148, 1, 1, 1, 1, 1,
0.8771439, -0.5198667, 0.967891, 1, 1, 1, 1, 1,
0.880601, -0.8716462, 4.460151, 1, 1, 1, 1, 1,
0.8858386, 0.1235148, 0.9237257, 1, 1, 1, 1, 1,
0.8864474, -0.5292848, 2.649345, 1, 1, 1, 1, 1,
0.8865793, -0.3810933, 2.355071, 1, 1, 1, 1, 1,
0.8911728, -0.3704718, 1.87306, 1, 1, 1, 1, 1,
0.8914052, 0.1437965, 1.186663, 0, 0, 1, 1, 1,
0.8928302, 0.8298129, 2.104601, 1, 0, 0, 1, 1,
0.8980735, -0.2291116, 0.7812757, 1, 0, 0, 1, 1,
0.9017156, 1.244456, 1.196463, 1, 0, 0, 1, 1,
0.9037086, 1.540791, -1.011768, 1, 0, 0, 1, 1,
0.9059438, -0.2619438, 0.7340722, 1, 0, 0, 1, 1,
0.9104028, -1.968521, 4.430271, 0, 0, 0, 1, 1,
0.9164972, 1.175899, 0.4242516, 0, 0, 0, 1, 1,
0.9227846, -0.1771003, 0.5288848, 0, 0, 0, 1, 1,
0.928165, 0.6702825, 0.4167437, 0, 0, 0, 1, 1,
0.9361888, -1.779563, 2.814288, 0, 0, 0, 1, 1,
0.9376193, 1.333387, -0.05829882, 0, 0, 0, 1, 1,
0.939511, 0.8211004, 0.5887538, 0, 0, 0, 1, 1,
0.9431858, 1.063118, 0.2186669, 1, 1, 1, 1, 1,
0.9450397, 0.9989429, 1.55839, 1, 1, 1, 1, 1,
0.9450744, -0.1882766, 1.883826, 1, 1, 1, 1, 1,
0.9465818, -1.015215, 4.111684, 1, 1, 1, 1, 1,
0.9476858, -1.394426, 3.719847, 1, 1, 1, 1, 1,
0.9512412, -0.6121342, 2.32244, 1, 1, 1, 1, 1,
0.9557938, -0.02917432, 3.358165, 1, 1, 1, 1, 1,
0.9593431, -0.3013204, 1.626718, 1, 1, 1, 1, 1,
0.9602599, 0.3227335, 0.7245766, 1, 1, 1, 1, 1,
0.9618285, 0.2088632, -0.02894987, 1, 1, 1, 1, 1,
0.9640634, 1.715855, 0.2645849, 1, 1, 1, 1, 1,
0.9655406, -0.3601456, 1.390092, 1, 1, 1, 1, 1,
0.9655632, -0.2497266, 3.375588, 1, 1, 1, 1, 1,
0.967353, -0.1615985, 0.6226528, 1, 1, 1, 1, 1,
0.9775426, -0.7868889, 2.233545, 1, 1, 1, 1, 1,
0.9781476, 0.5422559, 1.645115, 0, 0, 1, 1, 1,
0.979089, -0.2840245, 2.020152, 1, 0, 0, 1, 1,
0.9856892, 0.4803109, 0.9973632, 1, 0, 0, 1, 1,
0.9933272, -0.3475691, 1.868798, 1, 0, 0, 1, 1,
0.9972578, 0.01327747, 1.148294, 1, 0, 0, 1, 1,
0.9973703, -1.1901, 1.841489, 1, 0, 0, 1, 1,
1.005413, 0.9174839, 0.7053035, 0, 0, 0, 1, 1,
1.014102, -1.225515, 1.998017, 0, 0, 0, 1, 1,
1.01696, 1.801655, -0.1327051, 0, 0, 0, 1, 1,
1.018644, 0.2344358, 2.389722, 0, 0, 0, 1, 1,
1.02489, 0.5282916, 0.555917, 0, 0, 0, 1, 1,
1.026055, -1.335508, 3.106373, 0, 0, 0, 1, 1,
1.042783, 1.520882, 1.11236, 0, 0, 0, 1, 1,
1.050286, -0.3664918, 2.085202, 1, 1, 1, 1, 1,
1.050605, -0.4458178, 1.65752, 1, 1, 1, 1, 1,
1.051638, -1.27231, 2.081651, 1, 1, 1, 1, 1,
1.052984, 0.3180934, 2.618564, 1, 1, 1, 1, 1,
1.054208, 0.4652622, 1.256922, 1, 1, 1, 1, 1,
1.057605, 0.2047337, 0.07337089, 1, 1, 1, 1, 1,
1.059051, -0.5368074, 2.138115, 1, 1, 1, 1, 1,
1.059801, 0.2891679, 1.707111, 1, 1, 1, 1, 1,
1.070365, -0.9178138, 2.266438, 1, 1, 1, 1, 1,
1.071019, -0.9981617, 2.970552, 1, 1, 1, 1, 1,
1.071912, -0.08711811, 3.056846, 1, 1, 1, 1, 1,
1.073179, -1.84855, 1.01876, 1, 1, 1, 1, 1,
1.08235, 0.6074933, 0.5333499, 1, 1, 1, 1, 1,
1.0872, 2.299304, 1.541571, 1, 1, 1, 1, 1,
1.090327, 0.4208077, 1.067208, 1, 1, 1, 1, 1,
1.092816, -0.2176121, 0.9374956, 0, 0, 1, 1, 1,
1.096047, 1.325663, 0.3273205, 1, 0, 0, 1, 1,
1.104077, 0.8465922, 3.295629, 1, 0, 0, 1, 1,
1.104649, 0.4986077, 2.017032, 1, 0, 0, 1, 1,
1.105009, 0.6431722, -0.760117, 1, 0, 0, 1, 1,
1.107267, 0.3399024, 2.986717, 1, 0, 0, 1, 1,
1.107291, 0.00632577, 1.203113, 0, 0, 0, 1, 1,
1.114195, 0.7252477, 0.5415306, 0, 0, 0, 1, 1,
1.115159, -1.450227, 2.806064, 0, 0, 0, 1, 1,
1.129184, 1.230567, 2.998482, 0, 0, 0, 1, 1,
1.129265, 0.688551, -0.5969362, 0, 0, 0, 1, 1,
1.132245, -1.202132, 3.656189, 0, 0, 0, 1, 1,
1.133555, -0.01501149, 3.320012, 0, 0, 0, 1, 1,
1.133603, -1.207848, 3.496212, 1, 1, 1, 1, 1,
1.13751, 0.3216704, 0.4715803, 1, 1, 1, 1, 1,
1.147371, 0.6857367, 0.9465832, 1, 1, 1, 1, 1,
1.160073, 0.6179513, 3.831432, 1, 1, 1, 1, 1,
1.16013, 0.5214546, 2.596125, 1, 1, 1, 1, 1,
1.163926, -1.276377, 1.816402, 1, 1, 1, 1, 1,
1.163961, -0.09205436, 1.517947, 1, 1, 1, 1, 1,
1.165294, 0.4570539, 1.810842, 1, 1, 1, 1, 1,
1.186298, -0.7630798, 2.505872, 1, 1, 1, 1, 1,
1.18654, 1.09744, 1.145609, 1, 1, 1, 1, 1,
1.189206, 0.1322402, 0.6200886, 1, 1, 1, 1, 1,
1.192415, 0.5656547, 1.409967, 1, 1, 1, 1, 1,
1.192729, -0.2080624, 1.523338, 1, 1, 1, 1, 1,
1.19745, 0.6425408, 1.364473, 1, 1, 1, 1, 1,
1.20202, -2.033448, 2.013368, 1, 1, 1, 1, 1,
1.208915, -0.1989239, 2.321712, 0, 0, 1, 1, 1,
1.213754, 0.6497369, -0.122997, 1, 0, 0, 1, 1,
1.219634, 0.2435906, 1.119075, 1, 0, 0, 1, 1,
1.227022, -0.007064627, 0.8972116, 1, 0, 0, 1, 1,
1.231663, -0.9433098, 4.011577, 1, 0, 0, 1, 1,
1.236794, 1.085062, 0.1436184, 1, 0, 0, 1, 1,
1.254978, -3.417421, 4.250515, 0, 0, 0, 1, 1,
1.256667, 0.08925369, 1.814095, 0, 0, 0, 1, 1,
1.266914, -0.4477919, 3.056767, 0, 0, 0, 1, 1,
1.281005, 0.2657045, 0.1395014, 0, 0, 0, 1, 1,
1.284387, -1.601179, 2.635499, 0, 0, 0, 1, 1,
1.28712, 0.1036728, 0.5322643, 0, 0, 0, 1, 1,
1.28893, -0.5706365, 1.750976, 0, 0, 0, 1, 1,
1.289777, -0.385272, 2.969203, 1, 1, 1, 1, 1,
1.299933, -0.9489469, 0.8118079, 1, 1, 1, 1, 1,
1.30288, -0.6486154, 2.01511, 1, 1, 1, 1, 1,
1.318913, 1.127815, 0.9923087, 1, 1, 1, 1, 1,
1.324349, -0.8307201, 2.332246, 1, 1, 1, 1, 1,
1.330731, 0.08320996, 3.065412, 1, 1, 1, 1, 1,
1.338299, -0.4914736, 2.821847, 1, 1, 1, 1, 1,
1.339006, 0.4708632, -1.077878, 1, 1, 1, 1, 1,
1.343979, 1.580451, -0.206135, 1, 1, 1, 1, 1,
1.354181, 0.1229099, 1.297294, 1, 1, 1, 1, 1,
1.366118, -1.134085, 1.374126, 1, 1, 1, 1, 1,
1.367755, 0.1643828, 1.593102, 1, 1, 1, 1, 1,
1.370543, -0.9250705, 3.619629, 1, 1, 1, 1, 1,
1.388473, -0.1938517, 1.958284, 1, 1, 1, 1, 1,
1.399806, 0.8383134, 1.941979, 1, 1, 1, 1, 1,
1.4063, 0.2853946, 0.2790207, 0, 0, 1, 1, 1,
1.407039, -0.4870895, 2.146131, 1, 0, 0, 1, 1,
1.408103, -0.6055144, 1.300705, 1, 0, 0, 1, 1,
1.416658, -0.2936891, 1.944571, 1, 0, 0, 1, 1,
1.416759, 0.7871017, 2.250842, 1, 0, 0, 1, 1,
1.422957, -0.6092085, 0.8670102, 1, 0, 0, 1, 1,
1.424981, 0.5549791, 0.5340749, 0, 0, 0, 1, 1,
1.435751, 1.070179, 2.01695, 0, 0, 0, 1, 1,
1.443957, 0.9002338, 1.468131, 0, 0, 0, 1, 1,
1.460533, 1.35189, 0.7489257, 0, 0, 0, 1, 1,
1.477089, 0.2699512, 0.2092033, 0, 0, 0, 1, 1,
1.478498, 0.4779507, 1.838119, 0, 0, 0, 1, 1,
1.485312, -0.1468829, 1.320472, 0, 0, 0, 1, 1,
1.490456, 0.2362271, 2.080851, 1, 1, 1, 1, 1,
1.499366, -0.3693104, 2.720917, 1, 1, 1, 1, 1,
1.50965, -1.071965, 0.489057, 1, 1, 1, 1, 1,
1.514845, 0.6572162, 0.912269, 1, 1, 1, 1, 1,
1.518357, -1.531997, 0.2182541, 1, 1, 1, 1, 1,
1.533176, 1.421772, 2.94968, 1, 1, 1, 1, 1,
1.54618, -0.475477, 2.075929, 1, 1, 1, 1, 1,
1.559788, -1.5047, 2.784591, 1, 1, 1, 1, 1,
1.561368, -0.7089379, -0.4374615, 1, 1, 1, 1, 1,
1.582571, -0.9960051, 2.469165, 1, 1, 1, 1, 1,
1.583148, 1.298696, 1.833499, 1, 1, 1, 1, 1,
1.585, -0.4823994, -0.08347399, 1, 1, 1, 1, 1,
1.604215, 0.3535933, 1.222918, 1, 1, 1, 1, 1,
1.60917, 1.646298, -0.2502522, 1, 1, 1, 1, 1,
1.626842, 0.7130942, 1.091693, 1, 1, 1, 1, 1,
1.639233, -0.4612697, 1.014777, 0, 0, 1, 1, 1,
1.648466, -2.332957, 2.049412, 1, 0, 0, 1, 1,
1.65251, -1.312092, 1.117852, 1, 0, 0, 1, 1,
1.660883, 0.6498191, 2.246996, 1, 0, 0, 1, 1,
1.698438, 0.8980026, 1.625535, 1, 0, 0, 1, 1,
1.700753, -0.3152543, 2.649056, 1, 0, 0, 1, 1,
1.709479, -0.1710542, -1.192725, 0, 0, 0, 1, 1,
1.71041, -1.131267, 2.369387, 0, 0, 0, 1, 1,
1.721774, 0.2992102, 3.714887, 0, 0, 0, 1, 1,
1.764407, 1.461697, 1.139741, 0, 0, 0, 1, 1,
1.768622, -2.609426, 0.3902027, 0, 0, 0, 1, 1,
1.770362, 1.128761, 2.522669, 0, 0, 0, 1, 1,
1.779138, 0.7753934, 1.324086, 0, 0, 0, 1, 1,
1.783391, -0.2163858, 1.55295, 1, 1, 1, 1, 1,
1.797048, 2.295711, 0.6384408, 1, 1, 1, 1, 1,
1.801499, -0.8452527, 3.322217, 1, 1, 1, 1, 1,
1.820605, 0.4491735, 1.108511, 1, 1, 1, 1, 1,
1.836694, -0.6376204, 3.619506, 1, 1, 1, 1, 1,
1.840002, 0.7860984, 1.35249, 1, 1, 1, 1, 1,
1.879704, 1.532647, 1.363534, 1, 1, 1, 1, 1,
1.89188, 0.4594108, 1.273968, 1, 1, 1, 1, 1,
1.908861, 1.443902, 1.00081, 1, 1, 1, 1, 1,
1.922531, 0.2333408, -0.0754734, 1, 1, 1, 1, 1,
1.95541, -0.08075315, 2.978679, 1, 1, 1, 1, 1,
1.956729, 0.4098034, 3.296478, 1, 1, 1, 1, 1,
1.964759, 0.2667231, 2.472605, 1, 1, 1, 1, 1,
1.983072, 0.5294474, 2.695862, 1, 1, 1, 1, 1,
2.022699, 0.2106894, -0.08972015, 1, 1, 1, 1, 1,
2.051528, 0.4528009, 1.695484, 0, 0, 1, 1, 1,
2.051724, -0.5352872, 2.379955, 1, 0, 0, 1, 1,
2.090937, 1.240436, 1.116666, 1, 0, 0, 1, 1,
2.112094, -0.6321289, 2.264456, 1, 0, 0, 1, 1,
2.121726, 0.2327258, 0.5263509, 1, 0, 0, 1, 1,
2.168347, -1.590181, 2.649127, 1, 0, 0, 1, 1,
2.18801, -1.480608, 3.110113, 0, 0, 0, 1, 1,
2.240242, 0.4706655, 0.9774113, 0, 0, 0, 1, 1,
2.274116, -0.05117653, 2.340239, 0, 0, 0, 1, 1,
2.284174, -1.042792, 2.502889, 0, 0, 0, 1, 1,
2.286226, 0.2820805, 0.6344717, 0, 0, 0, 1, 1,
2.412619, 1.094018, 0.8119019, 0, 0, 0, 1, 1,
2.414571, -0.6699306, 2.838208, 0, 0, 0, 1, 1,
2.436304, 0.451458, 2.277771, 1, 1, 1, 1, 1,
2.514927, -1.265949, 2.739154, 1, 1, 1, 1, 1,
2.617186, 2.282654, 0.3732901, 1, 1, 1, 1, 1,
2.739306, -1.148059, 1.047269, 1, 1, 1, 1, 1,
2.826335, 1.614827, -0.009414468, 1, 1, 1, 1, 1,
3.175851, -0.6180378, 1.063867, 1, 1, 1, 1, 1,
3.305168, 1.101875, 1.095113, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.342471;
var distance = 32.81503;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.2093275, 0.2197286, -0.5900884 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.81503);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
