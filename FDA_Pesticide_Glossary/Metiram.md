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
-3.311083, 2.430251, -0.4453272, 1, 0, 0, 1,
-3.30415, -2.043163, -2.504807, 1, 0.007843138, 0, 1,
-3.108869, -0.9611395, -1.007916, 1, 0.01176471, 0, 1,
-2.863404, 0.2369437, -2.120832, 1, 0.01960784, 0, 1,
-2.809947, 0.1471064, -0.4825906, 1, 0.02352941, 0, 1,
-2.594663, -1.118016, -2.821437, 1, 0.03137255, 0, 1,
-2.584414, 0.2901576, 0.007820066, 1, 0.03529412, 0, 1,
-2.528841, -0.3502192, -1.23128, 1, 0.04313726, 0, 1,
-2.48235, -0.7938247, -3.520633, 1, 0.04705882, 0, 1,
-2.451521, -1.470403, -3.881831, 1, 0.05490196, 0, 1,
-2.397713, -0.5438609, -2.86752, 1, 0.05882353, 0, 1,
-2.368693, 0.2487344, -1.416546, 1, 0.06666667, 0, 1,
-2.308421, 0.4563107, -1.825525, 1, 0.07058824, 0, 1,
-2.284867, -1.052762, -3.477828, 1, 0.07843138, 0, 1,
-2.275996, 0.8288835, -1.997992, 1, 0.08235294, 0, 1,
-2.210269, 0.4011538, -1.881541, 1, 0.09019608, 0, 1,
-2.180095, 0.08592962, -2.408391, 1, 0.09411765, 0, 1,
-2.095785, -0.2033622, -1.861847, 1, 0.1019608, 0, 1,
-2.094932, 1.530918, -2.636644, 1, 0.1098039, 0, 1,
-2.076981, 0.1787576, -1.875612, 1, 0.1137255, 0, 1,
-2.041259, -0.6750527, -3.264446, 1, 0.1215686, 0, 1,
-1.974983, -0.4628494, -1.62901, 1, 0.1254902, 0, 1,
-1.935841, 0.2996613, -1.936703, 1, 0.1333333, 0, 1,
-1.935285, 0.1889078, -0.8673595, 1, 0.1372549, 0, 1,
-1.930778, -0.428275, -1.667561, 1, 0.145098, 0, 1,
-1.914818, 0.4395485, -1.446926, 1, 0.1490196, 0, 1,
-1.905886, -1.217522, -4.127138, 1, 0.1568628, 0, 1,
-1.887326, 1.030584, -0.4994115, 1, 0.1607843, 0, 1,
-1.870863, -0.07464796, -1.260621, 1, 0.1686275, 0, 1,
-1.839778, 1.206459, 1.646775, 1, 0.172549, 0, 1,
-1.836489, -0.2610545, -2.721388, 1, 0.1803922, 0, 1,
-1.820895, -2.320821, -3.118546, 1, 0.1843137, 0, 1,
-1.801625, -0.1109041, -1.49176, 1, 0.1921569, 0, 1,
-1.787838, 1.562777, -0.3990951, 1, 0.1960784, 0, 1,
-1.780194, 0.01584063, -2.06585, 1, 0.2039216, 0, 1,
-1.760065, -0.1045014, -3.097888, 1, 0.2117647, 0, 1,
-1.75538, -1.126318, -2.363516, 1, 0.2156863, 0, 1,
-1.754182, -0.9525306, -0.438035, 1, 0.2235294, 0, 1,
-1.746725, 1.028153, -2.646267, 1, 0.227451, 0, 1,
-1.675114, 0.3650967, -1.827057, 1, 0.2352941, 0, 1,
-1.660721, 0.9510295, -0.5275797, 1, 0.2392157, 0, 1,
-1.660522, -0.9674005, -1.807344, 1, 0.2470588, 0, 1,
-1.659785, 0.2566277, -2.675122, 1, 0.2509804, 0, 1,
-1.650893, -0.7062982, -1.098702, 1, 0.2588235, 0, 1,
-1.649554, -0.9495254, -1.550531, 1, 0.2627451, 0, 1,
-1.647833, -0.07682402, -1.048025, 1, 0.2705882, 0, 1,
-1.646758, -2.311699, -3.553374, 1, 0.2745098, 0, 1,
-1.641971, -0.8178724, -0.485725, 1, 0.282353, 0, 1,
-1.629056, -0.644582, -2.613426, 1, 0.2862745, 0, 1,
-1.620927, -0.2263667, -2.495958, 1, 0.2941177, 0, 1,
-1.615871, -0.09336995, -2.121341, 1, 0.3019608, 0, 1,
-1.607412, 0.4939177, -2.135839, 1, 0.3058824, 0, 1,
-1.606377, 1.10472, 1.09597, 1, 0.3137255, 0, 1,
-1.602737, -1.233948, -3.818383, 1, 0.3176471, 0, 1,
-1.600369, -0.6177177, -2.823752, 1, 0.3254902, 0, 1,
-1.597379, 2.058295, -0.5106897, 1, 0.3294118, 0, 1,
-1.590257, 0.462763, -1.354704, 1, 0.3372549, 0, 1,
-1.585833, -0.1974279, -1.992668, 1, 0.3411765, 0, 1,
-1.581573, -0.65441, -0.752011, 1, 0.3490196, 0, 1,
-1.570277, -0.3943348, -2.286789, 1, 0.3529412, 0, 1,
-1.562099, 0.1777298, -0.1092576, 1, 0.3607843, 0, 1,
-1.547812, -0.02902626, -2.212267, 1, 0.3647059, 0, 1,
-1.538513, -1.167592, -1.365462, 1, 0.372549, 0, 1,
-1.529456, -0.7884967, -2.288883, 1, 0.3764706, 0, 1,
-1.519668, 0.2100141, -1.442345, 1, 0.3843137, 0, 1,
-1.515738, 0.65965, -2.207539, 1, 0.3882353, 0, 1,
-1.50607, 2.044865, 0.5277591, 1, 0.3960784, 0, 1,
-1.503527, 0.4756546, -1.533217, 1, 0.4039216, 0, 1,
-1.487559, -1.84202, -2.804719, 1, 0.4078431, 0, 1,
-1.484898, -0.1035346, -0.8793039, 1, 0.4156863, 0, 1,
-1.478795, 0.9536182, -2.227865, 1, 0.4196078, 0, 1,
-1.469332, -0.3126245, -1.727283, 1, 0.427451, 0, 1,
-1.469048, -0.9997774, -1.96891, 1, 0.4313726, 0, 1,
-1.464376, -1.290316, -2.686716, 1, 0.4392157, 0, 1,
-1.462138, -1.236812, -1.022852, 1, 0.4431373, 0, 1,
-1.462017, 2.004508, -2.116643, 1, 0.4509804, 0, 1,
-1.458277, -1.65986, -4.365767, 1, 0.454902, 0, 1,
-1.452393, -2.33673, -4.209398, 1, 0.4627451, 0, 1,
-1.44388, -1.737664, -0.9705601, 1, 0.4666667, 0, 1,
-1.430939, 0.6289354, -0.8197477, 1, 0.4745098, 0, 1,
-1.423469, -1.594456, -1.959657, 1, 0.4784314, 0, 1,
-1.420842, 0.6996216, -1.276162, 1, 0.4862745, 0, 1,
-1.38147, 1.164459, -2.108187, 1, 0.4901961, 0, 1,
-1.380037, -0.6264198, -1.306156, 1, 0.4980392, 0, 1,
-1.374715, 0.4149245, 1.148389, 1, 0.5058824, 0, 1,
-1.373102, 1.146366, -1.531812, 1, 0.509804, 0, 1,
-1.371628, 0.126403, -1.474903, 1, 0.5176471, 0, 1,
-1.35818, 0.1487404, -0.5421457, 1, 0.5215687, 0, 1,
-1.355162, -1.847168, -1.870485, 1, 0.5294118, 0, 1,
-1.346784, 2.913094, -1.437205, 1, 0.5333334, 0, 1,
-1.346388, -0.5516006, -1.561921, 1, 0.5411765, 0, 1,
-1.330261, 1.352381, 1.20935, 1, 0.5450981, 0, 1,
-1.31071, -1.718557, -3.996118, 1, 0.5529412, 0, 1,
-1.30778, 0.3485607, -3.255119, 1, 0.5568628, 0, 1,
-1.305848, 0.6951235, -0.3918977, 1, 0.5647059, 0, 1,
-1.289946, 0.01657079, -1.388441, 1, 0.5686275, 0, 1,
-1.279567, -0.3710995, -1.249852, 1, 0.5764706, 0, 1,
-1.279092, 0.1667349, -1.29467, 1, 0.5803922, 0, 1,
-1.271331, 1.549965, -1.47947, 1, 0.5882353, 0, 1,
-1.268187, 0.0448122, -0.431544, 1, 0.5921569, 0, 1,
-1.257926, 0.4063658, -1.962889, 1, 0.6, 0, 1,
-1.25356, -1.567696, -3.570063, 1, 0.6078432, 0, 1,
-1.253075, -0.9733986, -2.568628, 1, 0.6117647, 0, 1,
-1.251822, -0.2995691, -3.061196, 1, 0.6196079, 0, 1,
-1.25019, 1.188762, -2.507776, 1, 0.6235294, 0, 1,
-1.24362, 0.4030788, -2.381618, 1, 0.6313726, 0, 1,
-1.243546, -1.563133, -0.1364873, 1, 0.6352941, 0, 1,
-1.242591, -1.970644, -3.849915, 1, 0.6431373, 0, 1,
-1.226105, 2.154949, -0.5750092, 1, 0.6470588, 0, 1,
-1.216752, -0.6626155, -4.03757, 1, 0.654902, 0, 1,
-1.206362, 0.3107447, -2.567684, 1, 0.6588235, 0, 1,
-1.203285, 0.755827, -2.931493, 1, 0.6666667, 0, 1,
-1.20217, 1.014359, -0.2206777, 1, 0.6705883, 0, 1,
-1.200249, 0.8080615, -0.1374365, 1, 0.6784314, 0, 1,
-1.197618, 0.03495203, 0.165099, 1, 0.682353, 0, 1,
-1.188548, 1.527157, -1.406079, 1, 0.6901961, 0, 1,
-1.183569, 0.1277434, -1.720843, 1, 0.6941177, 0, 1,
-1.174197, 0.4618762, -1.188989, 1, 0.7019608, 0, 1,
-1.172143, -2.845095, -3.39081, 1, 0.7098039, 0, 1,
-1.171171, -0.5571216, -1.696508, 1, 0.7137255, 0, 1,
-1.160248, -0.2550956, -1.528667, 1, 0.7215686, 0, 1,
-1.157226, 2.335649, 0.4069574, 1, 0.7254902, 0, 1,
-1.156125, -0.3511804, -1.336047, 1, 0.7333333, 0, 1,
-1.154147, 1.650004, 0.5692615, 1, 0.7372549, 0, 1,
-1.140935, -0.8428646, -0.7144721, 1, 0.7450981, 0, 1,
-1.14003, 0.1009541, -1.658298, 1, 0.7490196, 0, 1,
-1.128961, -1.683985, 0.1840146, 1, 0.7568628, 0, 1,
-1.127364, 0.8558621, 0.3316468, 1, 0.7607843, 0, 1,
-1.123506, -0.6212526, -1.577993, 1, 0.7686275, 0, 1,
-1.122238, -2.69255, -4.438995, 1, 0.772549, 0, 1,
-1.116244, 0.2171101, -1.226962, 1, 0.7803922, 0, 1,
-1.106777, 2.143016, -1.308286, 1, 0.7843137, 0, 1,
-1.106704, -1.130004, -3.544863, 1, 0.7921569, 0, 1,
-1.098551, 0.759812, -2.027393, 1, 0.7960784, 0, 1,
-1.096886, -1.204018, -1.94271, 1, 0.8039216, 0, 1,
-1.091065, -1.291745, -1.971971, 1, 0.8117647, 0, 1,
-1.084856, 0.6756489, -1.537796, 1, 0.8156863, 0, 1,
-1.079286, 0.09420968, 0.6640747, 1, 0.8235294, 0, 1,
-1.078216, -0.3168493, -1.657821, 1, 0.827451, 0, 1,
-1.072475, 0.6522672, -0.3769157, 1, 0.8352941, 0, 1,
-1.069654, -0.04776495, -1.816726, 1, 0.8392157, 0, 1,
-1.067386, -1.984657, -1.885543, 1, 0.8470588, 0, 1,
-1.065027, -0.3067676, 0.3913134, 1, 0.8509804, 0, 1,
-1.064567, 0.4883628, -0.4459778, 1, 0.8588235, 0, 1,
-1.060427, -0.6719511, -1.003013, 1, 0.8627451, 0, 1,
-1.054363, 0.0009732108, -1.980198, 1, 0.8705882, 0, 1,
-1.051387, 0.3050907, -1.503554, 1, 0.8745098, 0, 1,
-1.04768, -1.915017, -2.982559, 1, 0.8823529, 0, 1,
-1.04589, 1.30943, -0.9945657, 1, 0.8862745, 0, 1,
-1.044244, 0.8964207, -1.291397, 1, 0.8941177, 0, 1,
-1.042281, -0.5351917, -2.192308, 1, 0.8980392, 0, 1,
-1.035187, -0.4864247, -1.844385, 1, 0.9058824, 0, 1,
-1.033912, 0.07220966, -2.215275, 1, 0.9137255, 0, 1,
-1.030648, 0.9916557, -1.377749, 1, 0.9176471, 0, 1,
-1.027843, -1.042561, -2.692239, 1, 0.9254902, 0, 1,
-1.013557, -0.8300548, -2.196219, 1, 0.9294118, 0, 1,
-1.006822, 1.123497, 0.06330143, 1, 0.9372549, 0, 1,
-1.006184, -1.291216, -2.741003, 1, 0.9411765, 0, 1,
-0.9995536, -0.4160192, -2.396013, 1, 0.9490196, 0, 1,
-0.9992529, -0.1423489, -3.14049, 1, 0.9529412, 0, 1,
-0.9987499, -1.787658, -3.109933, 1, 0.9607843, 0, 1,
-0.9911581, 1.394788, 0.690833, 1, 0.9647059, 0, 1,
-0.9897797, -0.05336421, -1.624513, 1, 0.972549, 0, 1,
-0.9841425, 0.4400051, -0.4025396, 1, 0.9764706, 0, 1,
-0.9792094, 0.9338684, -1.573645, 1, 0.9843137, 0, 1,
-0.9755842, -0.3321023, -0.8697604, 1, 0.9882353, 0, 1,
-0.9743003, -0.3976463, -2.574069, 1, 0.9960784, 0, 1,
-0.9702104, 1.620179, -1.265735, 0.9960784, 1, 0, 1,
-0.9655629, -0.4652934, -2.849921, 0.9921569, 1, 0, 1,
-0.9640232, -2.206507, -1.683631, 0.9843137, 1, 0, 1,
-0.9612842, 0.106838, -1.527512, 0.9803922, 1, 0, 1,
-0.9515964, 0.459273, 0.6788356, 0.972549, 1, 0, 1,
-0.9512777, 1.162352, -0.5727612, 0.9686275, 1, 0, 1,
-0.9502842, -0.6180193, -1.906748, 0.9607843, 1, 0, 1,
-0.9495995, -0.3639988, -3.084774, 0.9568627, 1, 0, 1,
-0.9429468, -0.5746765, -1.877595, 0.9490196, 1, 0, 1,
-0.9425324, -2.660643, -2.829368, 0.945098, 1, 0, 1,
-0.9373176, -0.5690841, -2.820474, 0.9372549, 1, 0, 1,
-0.9326541, -2.070246, -3.078381, 0.9333333, 1, 0, 1,
-0.9304706, -0.2928064, -0.5523195, 0.9254902, 1, 0, 1,
-0.9282464, 0.3051956, -1.167494, 0.9215686, 1, 0, 1,
-0.9267545, 0.5877128, -0.515492, 0.9137255, 1, 0, 1,
-0.9263635, -1.013324, -2.747901, 0.9098039, 1, 0, 1,
-0.9199947, 0.3716146, 1.200288, 0.9019608, 1, 0, 1,
-0.919895, -0.1051673, -2.159856, 0.8941177, 1, 0, 1,
-0.9186066, 0.04778767, -2.664661, 0.8901961, 1, 0, 1,
-0.9151345, 1.653532, 0.05623322, 0.8823529, 1, 0, 1,
-0.9084991, 0.9840282, -3.246958, 0.8784314, 1, 0, 1,
-0.9036852, -0.06958038, -2.832748, 0.8705882, 1, 0, 1,
-0.8942901, -0.8659837, -1.786216, 0.8666667, 1, 0, 1,
-0.8903238, -0.3556911, -1.614018, 0.8588235, 1, 0, 1,
-0.890169, -0.6823207, -2.186537, 0.854902, 1, 0, 1,
-0.8869334, 0.1983875, -1.26162, 0.8470588, 1, 0, 1,
-0.8764481, -0.7518266, -2.695673, 0.8431373, 1, 0, 1,
-0.8627782, 1.255445, 0.4052234, 0.8352941, 1, 0, 1,
-0.8585292, 0.7130677, -0.7316024, 0.8313726, 1, 0, 1,
-0.8514172, -0.5299457, -1.491395, 0.8235294, 1, 0, 1,
-0.8485671, 1.146025, -0.7488568, 0.8196079, 1, 0, 1,
-0.8443041, -0.3951072, -3.322106, 0.8117647, 1, 0, 1,
-0.8352965, -0.6313142, -2.493834, 0.8078431, 1, 0, 1,
-0.8335703, 0.2703338, -1.124615, 0.8, 1, 0, 1,
-0.8293934, 1.124568, -1.400981, 0.7921569, 1, 0, 1,
-0.8287349, -0.726723, -1.817572, 0.7882353, 1, 0, 1,
-0.8171619, 1.220501, 0.4336997, 0.7803922, 1, 0, 1,
-0.812726, 1.231374, -0.8751991, 0.7764706, 1, 0, 1,
-0.8123112, -0.2980469, -1.70768, 0.7686275, 1, 0, 1,
-0.8118804, 2.113938, -0.496842, 0.7647059, 1, 0, 1,
-0.8063083, 1.496765, -2.302387, 0.7568628, 1, 0, 1,
-0.8006632, 0.445318, 1.598239, 0.7529412, 1, 0, 1,
-0.8000371, 0.3831695, -0.8463627, 0.7450981, 1, 0, 1,
-0.7999395, 1.11674, -0.5373201, 0.7411765, 1, 0, 1,
-0.7990662, 0.9357601, 0.02847269, 0.7333333, 1, 0, 1,
-0.798266, -1.776422, -1.813026, 0.7294118, 1, 0, 1,
-0.7936333, -1.318361, -2.643486, 0.7215686, 1, 0, 1,
-0.7934, 0.006336762, -1.140171, 0.7176471, 1, 0, 1,
-0.7917277, 0.9659538, -0.2462765, 0.7098039, 1, 0, 1,
-0.7895248, -2.092981, -2.530649, 0.7058824, 1, 0, 1,
-0.7887741, -0.357274, -0.8594432, 0.6980392, 1, 0, 1,
-0.7871744, -0.8469965, -1.93126, 0.6901961, 1, 0, 1,
-0.7855635, 0.6943673, 0.8878567, 0.6862745, 1, 0, 1,
-0.7830985, -0.2814124, -1.31521, 0.6784314, 1, 0, 1,
-0.7810802, -0.9582471, -1.006652, 0.6745098, 1, 0, 1,
-0.7802728, -0.8118173, -4.175633, 0.6666667, 1, 0, 1,
-0.7801056, -0.6238028, -2.180483, 0.6627451, 1, 0, 1,
-0.778118, -0.7765413, -3.294869, 0.654902, 1, 0, 1,
-0.7751771, -0.3509552, -1.695057, 0.6509804, 1, 0, 1,
-0.7750768, -1.119491, -2.655853, 0.6431373, 1, 0, 1,
-0.774953, 0.7057299, -1.576243, 0.6392157, 1, 0, 1,
-0.7639341, -1.393883, -3.421516, 0.6313726, 1, 0, 1,
-0.7628061, 1.094886, -1.848243, 0.627451, 1, 0, 1,
-0.7626178, 0.7033986, -0.2225382, 0.6196079, 1, 0, 1,
-0.7551331, -0.1852236, -1.536588, 0.6156863, 1, 0, 1,
-0.7527742, 0.7590613, -1.510488, 0.6078432, 1, 0, 1,
-0.7512569, 0.9797375, -2.057243, 0.6039216, 1, 0, 1,
-0.7469991, -1.415702, -1.156549, 0.5960785, 1, 0, 1,
-0.7420671, 0.178307, -2.749288, 0.5882353, 1, 0, 1,
-0.7393394, -1.795173, -1.16236, 0.5843138, 1, 0, 1,
-0.7377148, -0.5069389, -1.269845, 0.5764706, 1, 0, 1,
-0.7356596, 0.1763848, -0.1363156, 0.572549, 1, 0, 1,
-0.7328058, -1.499228, -2.672842, 0.5647059, 1, 0, 1,
-0.729928, -0.6131944, -1.882188, 0.5607843, 1, 0, 1,
-0.7295058, 0.2365739, -1.572592, 0.5529412, 1, 0, 1,
-0.7293364, 0.8831899, -2.534551, 0.5490196, 1, 0, 1,
-0.7287245, 0.05405163, -2.474726, 0.5411765, 1, 0, 1,
-0.7242736, -1.80473, -3.974821, 0.5372549, 1, 0, 1,
-0.7155184, -0.3163767, -3.35921, 0.5294118, 1, 0, 1,
-0.7021922, -1.455427, -2.70181, 0.5254902, 1, 0, 1,
-0.6980355, 2.02398, -1.181461, 0.5176471, 1, 0, 1,
-0.6967005, -0.1253967, -2.284924, 0.5137255, 1, 0, 1,
-0.6918777, 0.1762553, -1.792343, 0.5058824, 1, 0, 1,
-0.683669, 0.5990796, -0.2058487, 0.5019608, 1, 0, 1,
-0.6828716, 0.3568108, -2.078069, 0.4941176, 1, 0, 1,
-0.6806248, 0.06395816, -2.666061, 0.4862745, 1, 0, 1,
-0.6798264, 1.125469, -1.480275, 0.4823529, 1, 0, 1,
-0.6787495, 0.5104891, -0.6422073, 0.4745098, 1, 0, 1,
-0.67664, 1.273003, -0.8627933, 0.4705882, 1, 0, 1,
-0.6738734, -2.737175, -1.991968, 0.4627451, 1, 0, 1,
-0.6725525, -2.054592, -2.218854, 0.4588235, 1, 0, 1,
-0.6712244, -0.2724064, -0.5202191, 0.4509804, 1, 0, 1,
-0.6616011, -0.3814885, -0.575448, 0.4470588, 1, 0, 1,
-0.6605634, -0.4985872, -3.78369, 0.4392157, 1, 0, 1,
-0.6577733, -0.23755, -1.596595, 0.4352941, 1, 0, 1,
-0.6516618, 1.091286, 0.8772945, 0.427451, 1, 0, 1,
-0.6475651, -0.202374, -2.302031, 0.4235294, 1, 0, 1,
-0.6433073, 0.8819328, -1.170681, 0.4156863, 1, 0, 1,
-0.6415434, 1.845976, -0.414727, 0.4117647, 1, 0, 1,
-0.6404694, -0.5398164, -3.6076, 0.4039216, 1, 0, 1,
-0.637031, -0.4655204, -1.640494, 0.3960784, 1, 0, 1,
-0.6350991, 0.3102941, -0.9324861, 0.3921569, 1, 0, 1,
-0.6331621, 0.1551308, -0.546994, 0.3843137, 1, 0, 1,
-0.628347, -0.5833942, -4.42524, 0.3803922, 1, 0, 1,
-0.6271503, 0.4783072, -0.165134, 0.372549, 1, 0, 1,
-0.6214345, -0.6905088, -2.302343, 0.3686275, 1, 0, 1,
-0.6211874, -0.03681222, -1.770919, 0.3607843, 1, 0, 1,
-0.6189244, -1.404933, -2.361018, 0.3568628, 1, 0, 1,
-0.6181774, -0.9427478, -2.322444, 0.3490196, 1, 0, 1,
-0.6164164, -0.1745028, -1.579442, 0.345098, 1, 0, 1,
-0.6162076, 0.931735, -1.136774, 0.3372549, 1, 0, 1,
-0.6151251, 0.02644827, -2.264393, 0.3333333, 1, 0, 1,
-0.6124884, -0.31376, -2.029871, 0.3254902, 1, 0, 1,
-0.611292, 0.6939403, -0.5105695, 0.3215686, 1, 0, 1,
-0.606733, 0.499559, -3.663929, 0.3137255, 1, 0, 1,
-0.6000757, -0.2838836, -1.445721, 0.3098039, 1, 0, 1,
-0.597369, -2.083501, -1.499579, 0.3019608, 1, 0, 1,
-0.5966034, 1.077702, 0.325004, 0.2941177, 1, 0, 1,
-0.595243, -1.968285, -1.822409, 0.2901961, 1, 0, 1,
-0.5937112, 0.222108, 0.1491614, 0.282353, 1, 0, 1,
-0.5922947, 0.7027529, -0.06875665, 0.2784314, 1, 0, 1,
-0.587361, -0.6803556, -3.420069, 0.2705882, 1, 0, 1,
-0.5684665, -0.6199696, -1.715917, 0.2666667, 1, 0, 1,
-0.5672267, -0.281777, -2.057357, 0.2588235, 1, 0, 1,
-0.5666384, 0.8105651, 1.257286, 0.254902, 1, 0, 1,
-0.5607229, 0.05445083, -1.679305, 0.2470588, 1, 0, 1,
-0.557377, 0.4026834, -1.485163, 0.2431373, 1, 0, 1,
-0.5553181, 1.224364, -0.9695459, 0.2352941, 1, 0, 1,
-0.5538599, -0.4754812, -1.15256, 0.2313726, 1, 0, 1,
-0.5518159, 1.504854, -0.6160926, 0.2235294, 1, 0, 1,
-0.5460077, 1.699679, 1.172337, 0.2196078, 1, 0, 1,
-0.5428467, 0.2159431, -0.5676003, 0.2117647, 1, 0, 1,
-0.5409385, -0.2805974, -0.6865634, 0.2078431, 1, 0, 1,
-0.5393288, -0.5503666, -3.068341, 0.2, 1, 0, 1,
-0.5352277, -1.71566, -2.29996, 0.1921569, 1, 0, 1,
-0.5325342, -0.2345423, -1.487962, 0.1882353, 1, 0, 1,
-0.5323204, -1.496426, -2.502294, 0.1803922, 1, 0, 1,
-0.5308482, 1.047259, 0.9261509, 0.1764706, 1, 0, 1,
-0.5298414, -0.6343936, -2.383781, 0.1686275, 1, 0, 1,
-0.5297999, 1.121778, 0.2222447, 0.1647059, 1, 0, 1,
-0.5284604, -1.121508, -2.399808, 0.1568628, 1, 0, 1,
-0.5262656, -0.929887, -1.489455, 0.1529412, 1, 0, 1,
-0.5244154, -0.0554807, -0.1188782, 0.145098, 1, 0, 1,
-0.5242823, 0.8890998, -0.4978236, 0.1411765, 1, 0, 1,
-0.5235516, -0.8385301, -3.202883, 0.1333333, 1, 0, 1,
-0.5208182, 0.678112, 0.7858725, 0.1294118, 1, 0, 1,
-0.5170036, 0.4897626, -2.429409, 0.1215686, 1, 0, 1,
-0.5169768, 1.256768, -0.9012163, 0.1176471, 1, 0, 1,
-0.5130805, -0.9553701, -2.765138, 0.1098039, 1, 0, 1,
-0.5108447, -0.8256746, -4.127623, 0.1058824, 1, 0, 1,
-0.5089137, 1.54875, 0.2038464, 0.09803922, 1, 0, 1,
-0.5073541, -0.6160138, -3.147484, 0.09019608, 1, 0, 1,
-0.5046542, 0.9736675, -0.01290761, 0.08627451, 1, 0, 1,
-0.5030971, -0.07102115, -1.24523, 0.07843138, 1, 0, 1,
-0.5029103, 0.5699537, 0.3229539, 0.07450981, 1, 0, 1,
-0.4986586, -0.006964232, -1.756426, 0.06666667, 1, 0, 1,
-0.4983368, -0.5063015, -5.627929, 0.0627451, 1, 0, 1,
-0.4941073, 2.065226, 0.5059492, 0.05490196, 1, 0, 1,
-0.4922246, 1.291263, -2.384783, 0.05098039, 1, 0, 1,
-0.4898569, 0.6922874, -2.091161, 0.04313726, 1, 0, 1,
-0.4894593, 1.383235, -1.178091, 0.03921569, 1, 0, 1,
-0.4857853, 0.4148229, -1.897696, 0.03137255, 1, 0, 1,
-0.4835678, -1.190698, -3.330489, 0.02745098, 1, 0, 1,
-0.4830594, -0.797376, -2.235546, 0.01960784, 1, 0, 1,
-0.4800757, 1.107937, -0.6250432, 0.01568628, 1, 0, 1,
-0.4781025, 0.3977169, -0.6389998, 0.007843138, 1, 0, 1,
-0.4733267, -1.011236, -3.25829, 0.003921569, 1, 0, 1,
-0.4730602, -0.1444631, -1.184548, 0, 1, 0.003921569, 1,
-0.4718001, 0.7566239, -1.393613, 0, 1, 0.01176471, 1,
-0.4710833, 0.841621, 0.4661815, 0, 1, 0.01568628, 1,
-0.4702042, 0.9367728, 0.5053793, 0, 1, 0.02352941, 1,
-0.4685996, 0.8237365, 1.311648, 0, 1, 0.02745098, 1,
-0.4636758, 1.453155, 0.294429, 0, 1, 0.03529412, 1,
-0.4599033, 0.1195922, -1.782776, 0, 1, 0.03921569, 1,
-0.4575205, -0.1095908, -4.343679, 0, 1, 0.04705882, 1,
-0.4477856, 1.457382, 1.772912, 0, 1, 0.05098039, 1,
-0.4457704, 1.11456, -0.8482566, 0, 1, 0.05882353, 1,
-0.4439764, 0.8413764, -1.20168, 0, 1, 0.0627451, 1,
-0.4410427, 1.533076, -0.7304621, 0, 1, 0.07058824, 1,
-0.4408258, 1.311013, -0.622924, 0, 1, 0.07450981, 1,
-0.4405371, 0.4673071, -0.7885959, 0, 1, 0.08235294, 1,
-0.4344142, 0.82609, -0.2129507, 0, 1, 0.08627451, 1,
-0.4315597, -0.992565, -5.462199, 0, 1, 0.09411765, 1,
-0.4312761, 0.5080829, -0.510798, 0, 1, 0.1019608, 1,
-0.4249143, -0.4119582, -2.181048, 0, 1, 0.1058824, 1,
-0.4192612, 0.9242483, -0.6987833, 0, 1, 0.1137255, 1,
-0.416395, 0.8966368, 0.417784, 0, 1, 0.1176471, 1,
-0.412056, -0.07247242, -0.8801306, 0, 1, 0.1254902, 1,
-0.4029222, -0.3243205, -3.250053, 0, 1, 0.1294118, 1,
-0.4009548, 0.175658, -0.5321507, 0, 1, 0.1372549, 1,
-0.3992243, -0.1673449, -1.823064, 0, 1, 0.1411765, 1,
-0.3963566, 0.1353278, -0.9303026, 0, 1, 0.1490196, 1,
-0.3832645, -1.451807, -1.845904, 0, 1, 0.1529412, 1,
-0.3789332, -1.038586, -0.621803, 0, 1, 0.1607843, 1,
-0.3767219, -1.26311, -2.260726, 0, 1, 0.1647059, 1,
-0.3759618, -1.641245, -2.003649, 0, 1, 0.172549, 1,
-0.3736102, -0.07483802, -1.121502, 0, 1, 0.1764706, 1,
-0.3727809, -0.1171799, -1.532178, 0, 1, 0.1843137, 1,
-0.3699688, 0.389255, -1.5605, 0, 1, 0.1882353, 1,
-0.366525, -1.422444, -3.300457, 0, 1, 0.1960784, 1,
-0.3635289, -0.2860695, -0.8260444, 0, 1, 0.2039216, 1,
-0.3615221, -0.9217494, -2.643764, 0, 1, 0.2078431, 1,
-0.3572243, 1.689399, 0.2473753, 0, 1, 0.2156863, 1,
-0.3563405, -0.159508, -2.025974, 0, 1, 0.2196078, 1,
-0.3535912, 0.0837404, -2.105358, 0, 1, 0.227451, 1,
-0.3535308, 2.015357, 0.1928051, 0, 1, 0.2313726, 1,
-0.3523453, -0.9457092, -2.403633, 0, 1, 0.2392157, 1,
-0.3480866, -3.074585, -2.361206, 0, 1, 0.2431373, 1,
-0.3408346, -0.7050883, -2.437336, 0, 1, 0.2509804, 1,
-0.3360771, 1.114717, -0.4403657, 0, 1, 0.254902, 1,
-0.3338882, -1.233131, -4.868638, 0, 1, 0.2627451, 1,
-0.3299637, -0.8960836, -2.091546, 0, 1, 0.2666667, 1,
-0.3289229, -0.08154302, -1.450763, 0, 1, 0.2745098, 1,
-0.3285791, 1.152519, -0.6420053, 0, 1, 0.2784314, 1,
-0.3244355, -0.8149734, -4.262315, 0, 1, 0.2862745, 1,
-0.3219764, -0.07044335, -1.617664, 0, 1, 0.2901961, 1,
-0.319332, 0.7138508, 0.3523292, 0, 1, 0.2980392, 1,
-0.3133712, -1.158887, -2.644974, 0, 1, 0.3058824, 1,
-0.3111714, -0.1909059, -2.445252, 0, 1, 0.3098039, 1,
-0.3063622, 0.7271036, -1.652804, 0, 1, 0.3176471, 1,
-0.3028007, -0.8729581, -3.417768, 0, 1, 0.3215686, 1,
-0.3004693, -0.562457, -3.580341, 0, 1, 0.3294118, 1,
-0.2998924, 0.007223497, -3.476824, 0, 1, 0.3333333, 1,
-0.2983291, -0.6299049, -1.635745, 0, 1, 0.3411765, 1,
-0.295833, -2.508979, -3.302357, 0, 1, 0.345098, 1,
-0.2951828, 0.7970367, 0.1576625, 0, 1, 0.3529412, 1,
-0.2926826, -0.5235813, -3.100117, 0, 1, 0.3568628, 1,
-0.2867759, -0.8836309, -2.46095, 0, 1, 0.3647059, 1,
-0.2834376, -0.2621595, -3.749701, 0, 1, 0.3686275, 1,
-0.2800422, 0.9886805, 0.3126511, 0, 1, 0.3764706, 1,
-0.276788, 2.164592, -0.2183236, 0, 1, 0.3803922, 1,
-0.2754512, -0.4569329, -3.242473, 0, 1, 0.3882353, 1,
-0.264135, -1.116239, -2.735937, 0, 1, 0.3921569, 1,
-0.2595461, -0.2809194, -1.806868, 0, 1, 0.4, 1,
-0.2565899, 0.8998135, 0.1732942, 0, 1, 0.4078431, 1,
-0.2556289, 0.7334564, 0.4812199, 0, 1, 0.4117647, 1,
-0.2522826, 1.616915, 0.4912466, 0, 1, 0.4196078, 1,
-0.2502406, 1.773645, 0.5210103, 0, 1, 0.4235294, 1,
-0.2470224, 0.3500203, -0.8080848, 0, 1, 0.4313726, 1,
-0.2413893, -0.04251423, -1.117719, 0, 1, 0.4352941, 1,
-0.2401684, -0.9940477, -3.910266, 0, 1, 0.4431373, 1,
-0.2367507, 0.2368684, -0.8807987, 0, 1, 0.4470588, 1,
-0.2347067, -0.6875859, -3.894307, 0, 1, 0.454902, 1,
-0.2340329, 0.6663959, -0.3480289, 0, 1, 0.4588235, 1,
-0.2297037, 0.2234975, -1.181357, 0, 1, 0.4666667, 1,
-0.2249986, -0.1584377, -1.827245, 0, 1, 0.4705882, 1,
-0.2244866, -1.445256, -4.257754, 0, 1, 0.4784314, 1,
-0.2242415, 0.09878013, -1.595689, 0, 1, 0.4823529, 1,
-0.223593, -1.168149, -0.4187546, 0, 1, 0.4901961, 1,
-0.2162925, -0.7097641, -3.129253, 0, 1, 0.4941176, 1,
-0.2135562, 0.7770677, 0.5921649, 0, 1, 0.5019608, 1,
-0.2067042, 0.6899598, -1.974324, 0, 1, 0.509804, 1,
-0.2034788, 0.1550167, -0.3276785, 0, 1, 0.5137255, 1,
-0.2027611, -1.9216, -3.369006, 0, 1, 0.5215687, 1,
-0.2026937, -1.635085, -2.106846, 0, 1, 0.5254902, 1,
-0.2024646, -1.41671, -0.8947462, 0, 1, 0.5333334, 1,
-0.2023327, -0.5542314, -2.554276, 0, 1, 0.5372549, 1,
-0.2001456, -0.4444038, -2.469113, 0, 1, 0.5450981, 1,
-0.1971978, -0.6573623, -3.401342, 0, 1, 0.5490196, 1,
-0.1947848, 0.5262447, -1.251955, 0, 1, 0.5568628, 1,
-0.1902625, 0.0749568, -1.357421, 0, 1, 0.5607843, 1,
-0.1878341, 1.30393, 0.2433058, 0, 1, 0.5686275, 1,
-0.1865391, -0.965355, -4.309939, 0, 1, 0.572549, 1,
-0.1860055, 1.05011, -0.8804228, 0, 1, 0.5803922, 1,
-0.1789399, -0.4675145, -2.543149, 0, 1, 0.5843138, 1,
-0.1770479, -0.4069259, -1.91558, 0, 1, 0.5921569, 1,
-0.1686785, -0.3431668, -1.056696, 0, 1, 0.5960785, 1,
-0.165083, -1.328502, -2.595221, 0, 1, 0.6039216, 1,
-0.1611876, -0.1094204, -1.371683, 0, 1, 0.6117647, 1,
-0.1594437, 1.055767, -1.435675, 0, 1, 0.6156863, 1,
-0.1571275, -1.698602, -3.13417, 0, 1, 0.6235294, 1,
-0.1570696, 0.1856568, 0.5071523, 0, 1, 0.627451, 1,
-0.1548148, -2.553696, -3.53901, 0, 1, 0.6352941, 1,
-0.1534491, -0.3561741, -2.054178, 0, 1, 0.6392157, 1,
-0.1506673, -1.142813, -2.340703, 0, 1, 0.6470588, 1,
-0.1473136, 0.6583969, -0.5402844, 0, 1, 0.6509804, 1,
-0.1416979, 0.1726765, 0.3075201, 0, 1, 0.6588235, 1,
-0.140623, -1.553113, -1.714888, 0, 1, 0.6627451, 1,
-0.1365945, 2.030998, -2.44341, 0, 1, 0.6705883, 1,
-0.1356012, 0.1557843, -0.5165476, 0, 1, 0.6745098, 1,
-0.1354607, -0.8142319, -3.20633, 0, 1, 0.682353, 1,
-0.1332248, -1.523588, -2.240556, 0, 1, 0.6862745, 1,
-0.1295677, 0.4680758, -2.277474, 0, 1, 0.6941177, 1,
-0.1261323, 0.975444, -1.286555, 0, 1, 0.7019608, 1,
-0.1221039, -0.09786768, -1.616081, 0, 1, 0.7058824, 1,
-0.1216701, -0.3382063, -0.9050866, 0, 1, 0.7137255, 1,
-0.1200646, 0.2211339, -0.1902028, 0, 1, 0.7176471, 1,
-0.1189408, -0.02270086, -0.3988681, 0, 1, 0.7254902, 1,
-0.115606, 1.828067, -0.3983718, 0, 1, 0.7294118, 1,
-0.1103474, 0.5697827, -0.3117226, 0, 1, 0.7372549, 1,
-0.1032858, 0.4336273, -2.342352, 0, 1, 0.7411765, 1,
-0.1026978, 0.1220038, 0.7390112, 0, 1, 0.7490196, 1,
-0.1025046, -1.57312, -2.61252, 0, 1, 0.7529412, 1,
-0.1002704, -0.521475, -3.333568, 0, 1, 0.7607843, 1,
-0.08912041, 1.026607, 1.632976, 0, 1, 0.7647059, 1,
-0.08831545, -1.223337, -1.876318, 0, 1, 0.772549, 1,
-0.0870111, 0.7628754, -0.5196248, 0, 1, 0.7764706, 1,
-0.08583482, -1.426743, -2.932144, 0, 1, 0.7843137, 1,
-0.08568238, 2.232393, -0.639044, 0, 1, 0.7882353, 1,
-0.08495224, 0.8946725, 1.305148, 0, 1, 0.7960784, 1,
-0.07985876, -0.6182059, -2.552399, 0, 1, 0.8039216, 1,
-0.07424135, -0.4101575, -2.42332, 0, 1, 0.8078431, 1,
-0.06785762, -0.9859418, -4.598019, 0, 1, 0.8156863, 1,
-0.06771673, 0.4244969, 0.2159614, 0, 1, 0.8196079, 1,
-0.06670418, -0.2417223, -1.811581, 0, 1, 0.827451, 1,
-0.06359922, -0.8288744, -3.054337, 0, 1, 0.8313726, 1,
-0.06345434, -0.6569558, -2.856308, 0, 1, 0.8392157, 1,
-0.06015344, 0.6827816, -0.04179092, 0, 1, 0.8431373, 1,
-0.05852942, 0.9529402, -1.055934, 0, 1, 0.8509804, 1,
-0.05796807, 0.8380775, 0.6268317, 0, 1, 0.854902, 1,
-0.05521585, 0.9416125, 0.01071911, 0, 1, 0.8627451, 1,
-0.05405923, 1.290871, 1.259591, 0, 1, 0.8666667, 1,
-0.04613522, -1.145435, -3.346397, 0, 1, 0.8745098, 1,
-0.04579371, -0.7221383, -1.4359, 0, 1, 0.8784314, 1,
-0.03919357, 0.8246236, 0.5865376, 0, 1, 0.8862745, 1,
-0.03788873, -1.063534, -2.114807, 0, 1, 0.8901961, 1,
-0.03669745, -0.1715491, -3.91307, 0, 1, 0.8980392, 1,
-0.03328289, 0.7486835, -0.4013691, 0, 1, 0.9058824, 1,
-0.02556357, -0.9769652, -3.305571, 0, 1, 0.9098039, 1,
-0.02541042, -0.9214865, -1.397638, 0, 1, 0.9176471, 1,
-0.02461722, 0.3111527, -0.7793295, 0, 1, 0.9215686, 1,
-0.02296946, 0.3324788, 0.1999422, 0, 1, 0.9294118, 1,
-0.01798833, 0.1047255, -0.7449847, 0, 1, 0.9333333, 1,
-0.01764408, -0.5545354, -4.576632, 0, 1, 0.9411765, 1,
-0.01395296, 0.9946164, -0.5360116, 0, 1, 0.945098, 1,
-0.01184055, -1.603339, -4.663494, 0, 1, 0.9529412, 1,
-0.01086784, 1.959939, -0.3287403, 0, 1, 0.9568627, 1,
-0.01008962, -1.010262, -3.110721, 0, 1, 0.9647059, 1,
-0.009279778, -1.89244, -3.76398, 0, 1, 0.9686275, 1,
-0.008693046, 1.627004, 0.8445887, 0, 1, 0.9764706, 1,
-0.00822212, 0.8046641, 0.3711983, 0, 1, 0.9803922, 1,
-0.003009313, 1.316174, -0.3545988, 0, 1, 0.9882353, 1,
0.001184049, 0.02729408, -1.047571, 0, 1, 0.9921569, 1,
0.002577272, -0.6450308, 4.154488, 0, 1, 1, 1,
0.006191546, 0.3014512, 0.9949036, 0, 0.9921569, 1, 1,
0.007449758, -0.9620489, 2.907493, 0, 0.9882353, 1, 1,
0.01133758, 0.191314, 0.2712664, 0, 0.9803922, 1, 1,
0.01367975, 0.01607624, 0.9765592, 0, 0.9764706, 1, 1,
0.01529509, -1.360314, 4.183516, 0, 0.9686275, 1, 1,
0.02192101, -0.3611137, 2.863694, 0, 0.9647059, 1, 1,
0.02626033, 1.299521, 0.3855872, 0, 0.9568627, 1, 1,
0.03106384, -1.915935, 2.3662, 0, 0.9529412, 1, 1,
0.03249851, 1.260073, -0.5917569, 0, 0.945098, 1, 1,
0.0335405, -0.2586815, 3.428465, 0, 0.9411765, 1, 1,
0.0343573, 0.01308272, 2.447044, 0, 0.9333333, 1, 1,
0.03563562, -1.832804, 1.016268, 0, 0.9294118, 1, 1,
0.03943305, 0.3878182, 1.461634, 0, 0.9215686, 1, 1,
0.04371119, 0.5516416, -1.099068, 0, 0.9176471, 1, 1,
0.04656531, -0.2752203, 3.02888, 0, 0.9098039, 1, 1,
0.05095021, 0.2770122, -0.6857187, 0, 0.9058824, 1, 1,
0.0532828, -0.08368423, 1.263934, 0, 0.8980392, 1, 1,
0.05570931, -1.232569, 2.500224, 0, 0.8901961, 1, 1,
0.05893754, 1.221818, -0.552831, 0, 0.8862745, 1, 1,
0.06201905, -1.650742, 2.573201, 0, 0.8784314, 1, 1,
0.06798571, 0.1610803, -0.4519424, 0, 0.8745098, 1, 1,
0.06897629, 1.597667, -0.1754706, 0, 0.8666667, 1, 1,
0.07126205, 0.1724216, 0.1955092, 0, 0.8627451, 1, 1,
0.07186982, -0.521135, 3.720281, 0, 0.854902, 1, 1,
0.07515232, -1.331251, 3.614763, 0, 0.8509804, 1, 1,
0.08015092, -0.5424243, 1.263965, 0, 0.8431373, 1, 1,
0.082091, -2.197478, 4.886357, 0, 0.8392157, 1, 1,
0.08438232, 0.5863584, 2.573544, 0, 0.8313726, 1, 1,
0.09002136, -1.17098, 4.686662, 0, 0.827451, 1, 1,
0.09050152, 0.807286, -0.4021149, 0, 0.8196079, 1, 1,
0.09668276, 0.4212849, -1.40605, 0, 0.8156863, 1, 1,
0.09852561, 0.6734399, -1.798066, 0, 0.8078431, 1, 1,
0.1011528, -0.1999819, 1.832604, 0, 0.8039216, 1, 1,
0.105628, 0.492691, -0.2130118, 0, 0.7960784, 1, 1,
0.1121382, -1.731076, 1.803311, 0, 0.7882353, 1, 1,
0.1142369, 0.9789322, 0.2146421, 0, 0.7843137, 1, 1,
0.1229446, -0.05913219, 2.472518, 0, 0.7764706, 1, 1,
0.1248452, 0.9011825, 1.063439, 0, 0.772549, 1, 1,
0.1336705, 0.02167682, 1.680586, 0, 0.7647059, 1, 1,
0.1391001, 0.1137621, 2.216087, 0, 0.7607843, 1, 1,
0.1394628, -1.574536, 4.217957, 0, 0.7529412, 1, 1,
0.1402644, -0.3521527, 3.02582, 0, 0.7490196, 1, 1,
0.1414592, -0.5133274, 2.756471, 0, 0.7411765, 1, 1,
0.1455284, -0.5808238, 3.460841, 0, 0.7372549, 1, 1,
0.1472051, -1.404732, 2.591497, 0, 0.7294118, 1, 1,
0.1504729, -2.269161, 2.628195, 0, 0.7254902, 1, 1,
0.1505056, -1.093748, 3.764996, 0, 0.7176471, 1, 1,
0.1530003, 1.075262, 1.401397, 0, 0.7137255, 1, 1,
0.1550239, 0.2039611, -0.02155326, 0, 0.7058824, 1, 1,
0.1576071, 1.312254, 0.8887492, 0, 0.6980392, 1, 1,
0.1633741, 1.410716, 1.21503, 0, 0.6941177, 1, 1,
0.1661513, 2.181144, 1.021867, 0, 0.6862745, 1, 1,
0.1751157, 1.739198, 0.8765606, 0, 0.682353, 1, 1,
0.1761321, -0.09500334, 1.872716, 0, 0.6745098, 1, 1,
0.1777109, -1.5323, 3.322243, 0, 0.6705883, 1, 1,
0.1787569, -0.2110554, 2.395517, 0, 0.6627451, 1, 1,
0.1795084, 0.1589853, 0.02609129, 0, 0.6588235, 1, 1,
0.1820502, -1.355363, 3.760371, 0, 0.6509804, 1, 1,
0.1849286, 0.3961356, -0.2076668, 0, 0.6470588, 1, 1,
0.1858706, 0.230342, 0.9899871, 0, 0.6392157, 1, 1,
0.1868925, -2.549897, 1.637506, 0, 0.6352941, 1, 1,
0.1888151, -0.4783847, 4.129637, 0, 0.627451, 1, 1,
0.1891101, 0.2353593, 3.76513, 0, 0.6235294, 1, 1,
0.1920426, -1.329831, 5.971838, 0, 0.6156863, 1, 1,
0.1937529, -0.1210988, 0.6302613, 0, 0.6117647, 1, 1,
0.1961232, 0.7887657, 0.2316798, 0, 0.6039216, 1, 1,
0.1996213, -1.402976, 3.544399, 0, 0.5960785, 1, 1,
0.2013154, -2.161014, 2.291803, 0, 0.5921569, 1, 1,
0.2089301, 1.286257, -0.7471692, 0, 0.5843138, 1, 1,
0.209223, 0.8973678, -2.352624, 0, 0.5803922, 1, 1,
0.2103826, 0.2564467, 0.3779238, 0, 0.572549, 1, 1,
0.2112281, -2.177541, 3.758006, 0, 0.5686275, 1, 1,
0.2125417, 0.2556983, -0.7014579, 0, 0.5607843, 1, 1,
0.2141529, -0.7003364, 3.010629, 0, 0.5568628, 1, 1,
0.2203654, 0.8899886, -0.7744406, 0, 0.5490196, 1, 1,
0.2209844, -0.7025976, 3.071637, 0, 0.5450981, 1, 1,
0.2245717, 0.2553434, 1.807987, 0, 0.5372549, 1, 1,
0.2275263, -0.6118734, -0.3925993, 0, 0.5333334, 1, 1,
0.2283713, 0.2487672, 1.167816, 0, 0.5254902, 1, 1,
0.2291423, -1.391218, 1.892356, 0, 0.5215687, 1, 1,
0.230405, 1.098949, -0.3943042, 0, 0.5137255, 1, 1,
0.2314085, 0.7148002, -0.4051723, 0, 0.509804, 1, 1,
0.2319084, 0.3070049, 0.5764806, 0, 0.5019608, 1, 1,
0.234111, 0.1621231, 1.613328, 0, 0.4941176, 1, 1,
0.2396566, 1.88286, 0.3330978, 0, 0.4901961, 1, 1,
0.2402384, 1.111469, 1.120374, 0, 0.4823529, 1, 1,
0.243276, 1.000525, 0.3425896, 0, 0.4784314, 1, 1,
0.2450347, 0.9479379, 0.7334098, 0, 0.4705882, 1, 1,
0.2470562, 0.4514496, -0.0816942, 0, 0.4666667, 1, 1,
0.2472027, -0.820533, 2.648927, 0, 0.4588235, 1, 1,
0.2498712, -1.739223, 2.918064, 0, 0.454902, 1, 1,
0.2513399, 0.7147228, -0.2214099, 0, 0.4470588, 1, 1,
0.2515037, 0.6255037, 0.1506322, 0, 0.4431373, 1, 1,
0.2564435, -1.186088, 3.582269, 0, 0.4352941, 1, 1,
0.2633648, 0.09388472, 1.987344, 0, 0.4313726, 1, 1,
0.2643345, -1.041191, 1.940006, 0, 0.4235294, 1, 1,
0.2795272, -0.2993992, 1.70458, 0, 0.4196078, 1, 1,
0.2918042, -1.523061, 3.77011, 0, 0.4117647, 1, 1,
0.2920314, -1.232731, 2.09476, 0, 0.4078431, 1, 1,
0.2922475, -0.9948999, 3.552948, 0, 0.4, 1, 1,
0.2957968, 1.971806, 0.3831931, 0, 0.3921569, 1, 1,
0.296596, -1.951713, 4.214359, 0, 0.3882353, 1, 1,
0.3010871, -1.149047, 2.369333, 0, 0.3803922, 1, 1,
0.303377, -0.2641412, 2.470463, 0, 0.3764706, 1, 1,
0.304526, -0.4869573, 2.169703, 0, 0.3686275, 1, 1,
0.3062295, -1.700044, 4.545172, 0, 0.3647059, 1, 1,
0.3080109, -1.098723, 1.618566, 0, 0.3568628, 1, 1,
0.3119144, -1.934492, 2.359688, 0, 0.3529412, 1, 1,
0.3138331, 2.073677, 1.623619, 0, 0.345098, 1, 1,
0.3173781, -0.1057477, 3.693115, 0, 0.3411765, 1, 1,
0.3184585, 1.425311, 0.3203424, 0, 0.3333333, 1, 1,
0.3233103, 0.491607, 1.110807, 0, 0.3294118, 1, 1,
0.3273719, 1.401503, 0.6128441, 0, 0.3215686, 1, 1,
0.3286333, 0.1939212, 1.829395, 0, 0.3176471, 1, 1,
0.3300232, -1.05423, 3.593286, 0, 0.3098039, 1, 1,
0.3331876, -0.6801403, 3.29662, 0, 0.3058824, 1, 1,
0.3354883, 0.9231568, 0.8294056, 0, 0.2980392, 1, 1,
0.3384193, -0.5880814, 2.32904, 0, 0.2901961, 1, 1,
0.3400248, -0.4261042, 2.245066, 0, 0.2862745, 1, 1,
0.3413945, -1.031192, 1.166992, 0, 0.2784314, 1, 1,
0.3425615, 1.903142, 0.6303314, 0, 0.2745098, 1, 1,
0.3441628, -1.460697, 5.037667, 0, 0.2666667, 1, 1,
0.3478241, 0.3366948, 0.401077, 0, 0.2627451, 1, 1,
0.3507542, 1.004739, 1.090654, 0, 0.254902, 1, 1,
0.3517096, -2.530703, 2.840996, 0, 0.2509804, 1, 1,
0.3539123, 0.3888102, -0.06033017, 0, 0.2431373, 1, 1,
0.3542323, -0.6239449, 3.331064, 0, 0.2392157, 1, 1,
0.3601037, -0.2428869, 1.313589, 0, 0.2313726, 1, 1,
0.3628918, 1.127352, 0.7001145, 0, 0.227451, 1, 1,
0.3631937, -1.565506, 2.667807, 0, 0.2196078, 1, 1,
0.3670287, -0.2152713, 2.661334, 0, 0.2156863, 1, 1,
0.3725773, 1.572143, 0.4066554, 0, 0.2078431, 1, 1,
0.377343, 0.04126567, 1.745167, 0, 0.2039216, 1, 1,
0.379595, -0.7591026, 4.3086, 0, 0.1960784, 1, 1,
0.3804396, -0.8232499, 1.592806, 0, 0.1882353, 1, 1,
0.3823652, 3.411433, 1.496025, 0, 0.1843137, 1, 1,
0.3859675, -0.5096068, 3.853993, 0, 0.1764706, 1, 1,
0.3880297, 1.061167, 0.2163534, 0, 0.172549, 1, 1,
0.3905241, 0.008375048, 2.380957, 0, 0.1647059, 1, 1,
0.3910132, 0.264885, -0.634097, 0, 0.1607843, 1, 1,
0.3934948, -0.02759834, 0.7991465, 0, 0.1529412, 1, 1,
0.3968137, -0.0613128, 2.50773, 0, 0.1490196, 1, 1,
0.3973353, 0.3777601, 1.185555, 0, 0.1411765, 1, 1,
0.4011613, 0.12534, 0.9107733, 0, 0.1372549, 1, 1,
0.4121323, -0.9474886, 3.860486, 0, 0.1294118, 1, 1,
0.4145128, 0.8479524, 1.316839, 0, 0.1254902, 1, 1,
0.4148237, -0.9054348, 2.693769, 0, 0.1176471, 1, 1,
0.4166249, 0.2250922, 1.937717, 0, 0.1137255, 1, 1,
0.4171526, 0.7508078, 2.451716, 0, 0.1058824, 1, 1,
0.4175465, 0.5758218, 0.954186, 0, 0.09803922, 1, 1,
0.4181089, 0.2911939, -0.1631371, 0, 0.09411765, 1, 1,
0.4220224, -1.396261, 2.229838, 0, 0.08627451, 1, 1,
0.4238805, 0.4288823, 1.43079, 0, 0.08235294, 1, 1,
0.4271511, 2.071028, 0.04030582, 0, 0.07450981, 1, 1,
0.4287009, 0.5855, 2.391249, 0, 0.07058824, 1, 1,
0.4306712, 0.9227359, 0.7706532, 0, 0.0627451, 1, 1,
0.4320817, -1.877688, 2.411791, 0, 0.05882353, 1, 1,
0.4365282, 1.300669, 0.65909, 0, 0.05098039, 1, 1,
0.4393216, -0.2344609, 1.124809, 0, 0.04705882, 1, 1,
0.4416103, 1.420994, -1.597651, 0, 0.03921569, 1, 1,
0.4464101, 0.6315717, 1.7043, 0, 0.03529412, 1, 1,
0.4467643, 0.4153046, 0.8374942, 0, 0.02745098, 1, 1,
0.4481433, 0.634823, 0.7149335, 0, 0.02352941, 1, 1,
0.4520396, -0.8658456, 3.134611, 0, 0.01568628, 1, 1,
0.4550132, -1.506947, 4.531593, 0, 0.01176471, 1, 1,
0.4562351, -0.08207142, 0.6214204, 0, 0.003921569, 1, 1,
0.4588966, 0.5097478, -0.96917, 0.003921569, 0, 1, 1,
0.4623857, 0.8783082, 0.8536496, 0.007843138, 0, 1, 1,
0.4654471, -0.1957083, 2.70767, 0.01568628, 0, 1, 1,
0.4794046, 1.591848, 0.1121528, 0.01960784, 0, 1, 1,
0.4810788, 0.4654731, 0.5603406, 0.02745098, 0, 1, 1,
0.4814714, -1.009199, 4.267962, 0.03137255, 0, 1, 1,
0.4818312, 0.4588894, -1.801636, 0.03921569, 0, 1, 1,
0.4838527, 0.6673748, 2.374339, 0.04313726, 0, 1, 1,
0.4856453, -2.206886, 3.508165, 0.05098039, 0, 1, 1,
0.486968, 0.4202718, 0.5893854, 0.05490196, 0, 1, 1,
0.4882702, 1.302611, 0.8989957, 0.0627451, 0, 1, 1,
0.4962034, -0.7164131, 1.976842, 0.06666667, 0, 1, 1,
0.4976377, -0.4293812, 2.350809, 0.07450981, 0, 1, 1,
0.498057, 0.1277696, 2.027072, 0.07843138, 0, 1, 1,
0.4988885, 0.4090759, 2.95369, 0.08627451, 0, 1, 1,
0.5006046, 0.9201867, -1.466528, 0.09019608, 0, 1, 1,
0.5059061, 0.02034463, 0.2014196, 0.09803922, 0, 1, 1,
0.506535, 0.01038959, 0.3910772, 0.1058824, 0, 1, 1,
0.5122606, 0.6878886, 0.008896238, 0.1098039, 0, 1, 1,
0.5122807, -1.086146, 1.020458, 0.1176471, 0, 1, 1,
0.514389, 0.9291635, 1.912128, 0.1215686, 0, 1, 1,
0.5195459, -0.009033938, 1.962127, 0.1294118, 0, 1, 1,
0.5209246, -0.2296191, 1.636132, 0.1333333, 0, 1, 1,
0.5252486, 0.5980284, -0.9581503, 0.1411765, 0, 1, 1,
0.5326748, -0.4759829, 3.050889, 0.145098, 0, 1, 1,
0.532961, 0.4266869, 1.525577, 0.1529412, 0, 1, 1,
0.534556, -0.4419619, 2.826706, 0.1568628, 0, 1, 1,
0.5389165, -0.7673543, 2.716607, 0.1647059, 0, 1, 1,
0.5455332, -0.3926198, 0.9948439, 0.1686275, 0, 1, 1,
0.5482429, 0.75582, -0.02976782, 0.1764706, 0, 1, 1,
0.5524936, -0.1752473, -0.249028, 0.1803922, 0, 1, 1,
0.5542705, 0.1915109, 1.590386, 0.1882353, 0, 1, 1,
0.5568393, -0.4345472, 2.117696, 0.1921569, 0, 1, 1,
0.5578875, -2.703503, 3.401091, 0.2, 0, 1, 1,
0.5605178, 0.3619906, 0.193036, 0.2078431, 0, 1, 1,
0.5615082, -0.6578361, 2.168479, 0.2117647, 0, 1, 1,
0.5619104, 0.929558, 0.9765704, 0.2196078, 0, 1, 1,
0.5641507, 0.463875, 1.43774, 0.2235294, 0, 1, 1,
0.5642694, 0.04164851, 2.053386, 0.2313726, 0, 1, 1,
0.5704545, 0.1088512, 0.6440822, 0.2352941, 0, 1, 1,
0.5724613, -1.227386, 3.355316, 0.2431373, 0, 1, 1,
0.5746272, 0.863493, 0.6630731, 0.2470588, 0, 1, 1,
0.5784493, -2.021919, 2.559252, 0.254902, 0, 1, 1,
0.580044, 1.276316, 0.5294992, 0.2588235, 0, 1, 1,
0.580117, -1.214378, 2.769451, 0.2666667, 0, 1, 1,
0.5805, 1.378028, 1.55287, 0.2705882, 0, 1, 1,
0.5823973, -0.6325798, 4.909964, 0.2784314, 0, 1, 1,
0.5854918, -2.002068, 3.755345, 0.282353, 0, 1, 1,
0.5876348, 0.2450949, 0.6619932, 0.2901961, 0, 1, 1,
0.5878873, 1.232769, -0.5215525, 0.2941177, 0, 1, 1,
0.5881184, 0.8990241, 0.6265779, 0.3019608, 0, 1, 1,
0.5919974, 0.2409722, 2.150267, 0.3098039, 0, 1, 1,
0.5933755, 1.255087, 1.020091, 0.3137255, 0, 1, 1,
0.5970765, 1.653166, 0.2087784, 0.3215686, 0, 1, 1,
0.6041142, -0.6680627, 1.704345, 0.3254902, 0, 1, 1,
0.6091735, -0.6757177, 2.555058, 0.3333333, 0, 1, 1,
0.6122618, 0.3591861, 1.267566, 0.3372549, 0, 1, 1,
0.616746, 1.440652, -0.6524331, 0.345098, 0, 1, 1,
0.6194553, -1.669361, 3.584181, 0.3490196, 0, 1, 1,
0.6227437, -0.6237746, 2.177713, 0.3568628, 0, 1, 1,
0.6304969, -0.06067998, 1.565898, 0.3607843, 0, 1, 1,
0.6307176, 0.08961245, 0.6746992, 0.3686275, 0, 1, 1,
0.6309107, 0.2403274, 1.904524, 0.372549, 0, 1, 1,
0.6487574, 0.1422442, -0.2718767, 0.3803922, 0, 1, 1,
0.6561115, 1.266502, 0.6605651, 0.3843137, 0, 1, 1,
0.658136, 0.1979852, 1.166314, 0.3921569, 0, 1, 1,
0.6593617, 1.127248, -0.6964562, 0.3960784, 0, 1, 1,
0.6626741, -0.09684765, 3.508298, 0.4039216, 0, 1, 1,
0.6706449, 1.74413, 1.517891, 0.4117647, 0, 1, 1,
0.6735824, 0.02262355, 1.566536, 0.4156863, 0, 1, 1,
0.6749942, 2.911674, 1.485353, 0.4235294, 0, 1, 1,
0.6817253, 0.8371983, -0.2679802, 0.427451, 0, 1, 1,
0.6940461, -0.3480843, 2.19406, 0.4352941, 0, 1, 1,
0.6993791, 0.08106688, 0.6782082, 0.4392157, 0, 1, 1,
0.7000856, -0.2613973, 1.151634, 0.4470588, 0, 1, 1,
0.7048531, 0.5285624, 2.467945, 0.4509804, 0, 1, 1,
0.7077468, 0.3256564, -2.283985, 0.4588235, 0, 1, 1,
0.7084585, 1.958184, 1.678962, 0.4627451, 0, 1, 1,
0.7121763, -0.3497738, 3.181256, 0.4705882, 0, 1, 1,
0.7163922, -0.1660061, 0.7598661, 0.4745098, 0, 1, 1,
0.7172191, 0.1567023, 3.445637, 0.4823529, 0, 1, 1,
0.7197618, -0.006143778, 2.805346, 0.4862745, 0, 1, 1,
0.7209637, -0.4678598, 3.350059, 0.4941176, 0, 1, 1,
0.7220387, -0.4840098, 4.053384, 0.5019608, 0, 1, 1,
0.7251148, -1.046536, 3.591654, 0.5058824, 0, 1, 1,
0.7266387, 0.1780109, -0.7983039, 0.5137255, 0, 1, 1,
0.7299988, -0.8460268, 2.864288, 0.5176471, 0, 1, 1,
0.7309041, 0.4735341, 0.1869597, 0.5254902, 0, 1, 1,
0.7353396, 0.0684813, -0.286529, 0.5294118, 0, 1, 1,
0.7359244, -1.442602, 3.897336, 0.5372549, 0, 1, 1,
0.7408335, -0.8729244, 1.692141, 0.5411765, 0, 1, 1,
0.7434147, -1.737926, 2.83763, 0.5490196, 0, 1, 1,
0.7443824, -1.082017, 1.058247, 0.5529412, 0, 1, 1,
0.7465214, 1.480378, 0.13319, 0.5607843, 0, 1, 1,
0.7467949, 1.41635, -0.9860189, 0.5647059, 0, 1, 1,
0.7530016, 0.512747, 0.1090801, 0.572549, 0, 1, 1,
0.7532886, -0.1560123, 1.81063, 0.5764706, 0, 1, 1,
0.7561394, -4.336769, 4.924036, 0.5843138, 0, 1, 1,
0.7571523, 0.8491204, 1.063826, 0.5882353, 0, 1, 1,
0.7577569, -0.04299937, 0.8320049, 0.5960785, 0, 1, 1,
0.7589427, -0.1319753, 2.891553, 0.6039216, 0, 1, 1,
0.7628301, -1.73244, 4.0035, 0.6078432, 0, 1, 1,
0.7708888, -1.185739, 2.25802, 0.6156863, 0, 1, 1,
0.7754472, 0.1301309, 0.6048088, 0.6196079, 0, 1, 1,
0.7765594, 0.08320455, 0.1109686, 0.627451, 0, 1, 1,
0.7901217, 1.367319, 0.01477491, 0.6313726, 0, 1, 1,
0.7991546, -0.9033878, 1.836081, 0.6392157, 0, 1, 1,
0.8007733, -0.2957257, 1.649699, 0.6431373, 0, 1, 1,
0.8024259, 0.1420313, 3.377731, 0.6509804, 0, 1, 1,
0.8038017, 0.2000569, 1.266055, 0.654902, 0, 1, 1,
0.8128312, -2.156643, 2.896905, 0.6627451, 0, 1, 1,
0.8132291, 1.261768, -0.3160852, 0.6666667, 0, 1, 1,
0.8149516, -2.398698, 2.566513, 0.6745098, 0, 1, 1,
0.8181449, -1.097037, 4.073342, 0.6784314, 0, 1, 1,
0.8205823, 1.320236, 0.7389799, 0.6862745, 0, 1, 1,
0.8207713, 2.55662, 0.1397686, 0.6901961, 0, 1, 1,
0.822984, 1.026371, -0.1037101, 0.6980392, 0, 1, 1,
0.8262825, 1.541507, 0.8970518, 0.7058824, 0, 1, 1,
0.8312007, 0.6841317, 1.09482, 0.7098039, 0, 1, 1,
0.8317581, 0.6145508, 2.450274, 0.7176471, 0, 1, 1,
0.8325979, -0.5019717, 3.164729, 0.7215686, 0, 1, 1,
0.8329672, -1.509015, 2.925822, 0.7294118, 0, 1, 1,
0.8378282, -0.6043082, 3.44591, 0.7333333, 0, 1, 1,
0.8466853, 0.5001082, 0.6536742, 0.7411765, 0, 1, 1,
0.8568887, -1.425046, 2.880511, 0.7450981, 0, 1, 1,
0.8591987, 0.5337062, 1.948447, 0.7529412, 0, 1, 1,
0.8597801, 0.08006016, 2.084211, 0.7568628, 0, 1, 1,
0.8679384, 2.322314, 1.252516, 0.7647059, 0, 1, 1,
0.8712427, 1.124665, 1.13804, 0.7686275, 0, 1, 1,
0.8783087, -1.31795, 1.109282, 0.7764706, 0, 1, 1,
0.8838866, -1.749332, 3.236804, 0.7803922, 0, 1, 1,
0.8911132, 0.571514, 0.4846863, 0.7882353, 0, 1, 1,
0.8912361, 0.9316052, 1.001202, 0.7921569, 0, 1, 1,
0.8969669, 0.4475744, 1.094486, 0.8, 0, 1, 1,
0.9133392, 0.724058, 1.178807, 0.8078431, 0, 1, 1,
0.9134787, -0.8601549, 3.487564, 0.8117647, 0, 1, 1,
0.934414, 0.41364, 0.6358676, 0.8196079, 0, 1, 1,
0.9364049, -1.873283, 2.522336, 0.8235294, 0, 1, 1,
0.9426396, -0.8633605, 2.361151, 0.8313726, 0, 1, 1,
0.9438653, -1.45787, 3.400743, 0.8352941, 0, 1, 1,
0.9477293, -0.7832823, 2.611759, 0.8431373, 0, 1, 1,
0.9515123, -2.24662, 2.893885, 0.8470588, 0, 1, 1,
0.9539094, 0.3278761, 1.854518, 0.854902, 0, 1, 1,
0.9545385, -0.2571966, 1.305174, 0.8588235, 0, 1, 1,
0.9552258, -1.606145, 5.54921, 0.8666667, 0, 1, 1,
0.9581199, 0.9387823, 0.246207, 0.8705882, 0, 1, 1,
0.959331, 0.2869695, -0.3202987, 0.8784314, 0, 1, 1,
0.9660094, -0.1565359, 1.050373, 0.8823529, 0, 1, 1,
0.973533, -0.224361, 2.055423, 0.8901961, 0, 1, 1,
0.9743163, -0.7560929, 1.971522, 0.8941177, 0, 1, 1,
0.9783623, -0.5814129, 2.972198, 0.9019608, 0, 1, 1,
0.9791229, -0.2633201, 0.8550854, 0.9098039, 0, 1, 1,
0.9811435, 1.814594, 0.4593229, 0.9137255, 0, 1, 1,
0.9857292, -0.1702619, 2.402207, 0.9215686, 0, 1, 1,
0.9922211, 1.071538, 2.483844, 0.9254902, 0, 1, 1,
0.9936602, -0.622897, 3.088933, 0.9333333, 0, 1, 1,
0.994553, -2.047615, 1.133732, 0.9372549, 0, 1, 1,
1.007086, 2.533238, -0.3489093, 0.945098, 0, 1, 1,
1.007435, -0.9622533, 2.419497, 0.9490196, 0, 1, 1,
1.013629, 0.4362435, 2.070413, 0.9568627, 0, 1, 1,
1.018883, 1.155719, 0.5166457, 0.9607843, 0, 1, 1,
1.021303, 0.1025268, 0.184894, 0.9686275, 0, 1, 1,
1.021822, 1.266968, 0.8205672, 0.972549, 0, 1, 1,
1.032098, -1.064298, 1.784939, 0.9803922, 0, 1, 1,
1.035114, -0.7325857, 1.912967, 0.9843137, 0, 1, 1,
1.039647, -0.07673438, 1.256032, 0.9921569, 0, 1, 1,
1.043514, -2.344401, 2.961463, 0.9960784, 0, 1, 1,
1.044898, 0.5905848, 2.041308, 1, 0, 0.9960784, 1,
1.045424, 0.574056, 1.996105, 1, 0, 0.9882353, 1,
1.049503, -1.044591, 1.891981, 1, 0, 0.9843137, 1,
1.049585, -0.06573287, 1.017973, 1, 0, 0.9764706, 1,
1.053055, 0.5079284, 2.143789, 1, 0, 0.972549, 1,
1.057307, -0.2522641, 2.264315, 1, 0, 0.9647059, 1,
1.059014, 1.029403, -0.6682475, 1, 0, 0.9607843, 1,
1.074016, -0.03007024, -0.3143372, 1, 0, 0.9529412, 1,
1.075795, 0.08254884, 3.773134, 1, 0, 0.9490196, 1,
1.081154, 1.409821, 1.312462, 1, 0, 0.9411765, 1,
1.081401, -0.6919988, 1.439162, 1, 0, 0.9372549, 1,
1.082773, 0.5594975, 1.299801, 1, 0, 0.9294118, 1,
1.085868, -0.5738911, 2.425986, 1, 0, 0.9254902, 1,
1.086273, 0.5871752, -0.05059107, 1, 0, 0.9176471, 1,
1.08997, -1.048947, 1.452987, 1, 0, 0.9137255, 1,
1.094217, -0.009900914, 1.866809, 1, 0, 0.9058824, 1,
1.094625, -1.552302, 2.567065, 1, 0, 0.9019608, 1,
1.099973, 0.6529486, 0.7169105, 1, 0, 0.8941177, 1,
1.101201, -0.1267309, 1.856776, 1, 0, 0.8862745, 1,
1.106331, 0.01780544, 1.472645, 1, 0, 0.8823529, 1,
1.107648, -0.1084753, -0.5510978, 1, 0, 0.8745098, 1,
1.109793, 0.9530438, 0.2140513, 1, 0, 0.8705882, 1,
1.112092, 0.02392141, 2.416844, 1, 0, 0.8627451, 1,
1.112633, -0.04635956, 1.903417, 1, 0, 0.8588235, 1,
1.118125, -0.3021143, 3.194902, 1, 0, 0.8509804, 1,
1.119173, -1.63831, 1.936431, 1, 0, 0.8470588, 1,
1.122023, 2.526291, 1.112109, 1, 0, 0.8392157, 1,
1.123103, -0.2890335, 2.541376, 1, 0, 0.8352941, 1,
1.125153, -0.828721, 1.214568, 1, 0, 0.827451, 1,
1.134223, 1.709804, -0.2661819, 1, 0, 0.8235294, 1,
1.139241, -1.719615, 3.526829, 1, 0, 0.8156863, 1,
1.141201, -1.231445, 2.255157, 1, 0, 0.8117647, 1,
1.14757, -0.1767394, 1.55517, 1, 0, 0.8039216, 1,
1.149866, 0.6066298, 0.3645762, 1, 0, 0.7960784, 1,
1.160021, 0.3160523, 2.017507, 1, 0, 0.7921569, 1,
1.164249, -0.1675555, 2.299539, 1, 0, 0.7843137, 1,
1.164446, 0.01042794, 1.120641, 1, 0, 0.7803922, 1,
1.164894, -0.04538564, 1.91425, 1, 0, 0.772549, 1,
1.165886, 0.8895193, 1.119251, 1, 0, 0.7686275, 1,
1.166587, 0.674907, 2.258363, 1, 0, 0.7607843, 1,
1.174579, -1.256658, 2.485548, 1, 0, 0.7568628, 1,
1.183402, -1.416803, 2.094962, 1, 0, 0.7490196, 1,
1.183565, 1.196925, -0.4518181, 1, 0, 0.7450981, 1,
1.187449, -0.2023256, 2.472798, 1, 0, 0.7372549, 1,
1.190099, 1.007296, 2.162525, 1, 0, 0.7333333, 1,
1.20053, -0.8260197, 3.208002, 1, 0, 0.7254902, 1,
1.200591, 1.307816, 2.334743, 1, 0, 0.7215686, 1,
1.20212, -0.03181586, 1.250886, 1, 0, 0.7137255, 1,
1.215721, -0.01073681, 3.529926, 1, 0, 0.7098039, 1,
1.216869, -0.7751665, 3.56326, 1, 0, 0.7019608, 1,
1.226718, -0.2535848, 2.174778, 1, 0, 0.6941177, 1,
1.226735, -1.618813, 1.73903, 1, 0, 0.6901961, 1,
1.229695, 0.2521187, 1.705376, 1, 0, 0.682353, 1,
1.231604, -1.128426, 1.056342, 1, 0, 0.6784314, 1,
1.249144, 0.307139, 1.203717, 1, 0, 0.6705883, 1,
1.254931, -0.3268819, 1.323347, 1, 0, 0.6666667, 1,
1.256142, 1.559116, 0.6936638, 1, 0, 0.6588235, 1,
1.261467, -0.303671, 3.779727, 1, 0, 0.654902, 1,
1.265516, -0.214279, 1.544964, 1, 0, 0.6470588, 1,
1.267901, 0.2926869, 0.6216089, 1, 0, 0.6431373, 1,
1.271935, -0.7915748, 2.124771, 1, 0, 0.6352941, 1,
1.274124, 0.134702, 1.811223, 1, 0, 0.6313726, 1,
1.283806, 0.8949209, -0.2868755, 1, 0, 0.6235294, 1,
1.30144, 2.253946, 0.5363044, 1, 0, 0.6196079, 1,
1.309314, 0.2938787, 1.334621, 1, 0, 0.6117647, 1,
1.310566, -0.05694069, 2.080882, 1, 0, 0.6078432, 1,
1.31492, 0.1353672, 1.485829, 1, 0, 0.6, 1,
1.320334, 0.1585358, 2.002557, 1, 0, 0.5921569, 1,
1.320602, -0.6618874, 2.708356, 1, 0, 0.5882353, 1,
1.322071, 2.113798, 0.1976274, 1, 0, 0.5803922, 1,
1.326063, 0.398322, 1.298123, 1, 0, 0.5764706, 1,
1.327843, -0.5266004, 1.953156, 1, 0, 0.5686275, 1,
1.329573, -0.8236516, 1.898018, 1, 0, 0.5647059, 1,
1.333166, 0.345449, 1.204518, 1, 0, 0.5568628, 1,
1.337137, 0.7053593, 0.3133625, 1, 0, 0.5529412, 1,
1.343388, 2.044373, 4.189291, 1, 0, 0.5450981, 1,
1.352373, 0.1302432, 1.646759, 1, 0, 0.5411765, 1,
1.363286, 0.4399265, 2.941503, 1, 0, 0.5333334, 1,
1.377058, -0.7610617, 1.925638, 1, 0, 0.5294118, 1,
1.39028, 0.7147603, 0.5801164, 1, 0, 0.5215687, 1,
1.391662, 0.06113573, 2.578938, 1, 0, 0.5176471, 1,
1.392137, 0.6242661, -0.9456918, 1, 0, 0.509804, 1,
1.397639, 0.4948888, 1.107131, 1, 0, 0.5058824, 1,
1.400024, 0.7100912, 1.216966, 1, 0, 0.4980392, 1,
1.412884, -0.7202239, 1.762539, 1, 0, 0.4901961, 1,
1.413329, -1.165467, 2.093449, 1, 0, 0.4862745, 1,
1.418364, -0.3440407, 0.3308407, 1, 0, 0.4784314, 1,
1.419167, -0.5986719, 2.552417, 1, 0, 0.4745098, 1,
1.421287, -0.6995882, 0.5282945, 1, 0, 0.4666667, 1,
1.423913, -0.533906, 3.345178, 1, 0, 0.4627451, 1,
1.445883, -0.02325761, 3.419397, 1, 0, 0.454902, 1,
1.456722, 0.415265, 0.3189145, 1, 0, 0.4509804, 1,
1.463083, -0.5825716, 1.716626, 1, 0, 0.4431373, 1,
1.468872, 0.4990905, 2.807727, 1, 0, 0.4392157, 1,
1.472489, -0.05300906, 2.596917, 1, 0, 0.4313726, 1,
1.47883, -0.1501084, 1.091659, 1, 0, 0.427451, 1,
1.485023, 0.4109402, 1.382419, 1, 0, 0.4196078, 1,
1.486088, 0.92531, 1.527732, 1, 0, 0.4156863, 1,
1.49021, -0.601259, 2.640862, 1, 0, 0.4078431, 1,
1.499647, -0.04191743, 1.693504, 1, 0, 0.4039216, 1,
1.507126, -0.8172972, 0.3687516, 1, 0, 0.3960784, 1,
1.507648, -1.347568, 3.226387, 1, 0, 0.3882353, 1,
1.517426, 1.176408, 0.9892181, 1, 0, 0.3843137, 1,
1.525054, 0.9950883, 1.459349, 1, 0, 0.3764706, 1,
1.526745, -0.5855615, 0.2964918, 1, 0, 0.372549, 1,
1.53378, -0.4724407, 2.953758, 1, 0, 0.3647059, 1,
1.54942, -1.190395, 2.252739, 1, 0, 0.3607843, 1,
1.54951, 0.7669325, -0.4968441, 1, 0, 0.3529412, 1,
1.554538, 0.4133465, 2.977429, 1, 0, 0.3490196, 1,
1.566866, 1.245266, 1.587239, 1, 0, 0.3411765, 1,
1.57471, -0.7310952, 1.247387, 1, 0, 0.3372549, 1,
1.581771, -0.6626481, 2.082388, 1, 0, 0.3294118, 1,
1.597206, -1.612631, 1.169873, 1, 0, 0.3254902, 1,
1.609983, 1.100109, 0.01003251, 1, 0, 0.3176471, 1,
1.610411, 1.587589, 0.3782534, 1, 0, 0.3137255, 1,
1.623741, -0.9291962, 3.317921, 1, 0, 0.3058824, 1,
1.631059, 1.058127, -0.296561, 1, 0, 0.2980392, 1,
1.66285, -1.258809, 2.254374, 1, 0, 0.2941177, 1,
1.6938, -0.4384702, -0.1178929, 1, 0, 0.2862745, 1,
1.696479, 1.112574, 0.5013807, 1, 0, 0.282353, 1,
1.716141, 0.2706681, 0.5212176, 1, 0, 0.2745098, 1,
1.717998, 0.8097208, 1.113588, 1, 0, 0.2705882, 1,
1.726158, -1.364785, 1.368652, 1, 0, 0.2627451, 1,
1.734737, -0.5687434, 2.213816, 1, 0, 0.2588235, 1,
1.73707, 0.2854773, 1.959167, 1, 0, 0.2509804, 1,
1.746314, -0.7482547, 2.872619, 1, 0, 0.2470588, 1,
1.755266, -0.7420033, 2.571251, 1, 0, 0.2392157, 1,
1.794886, -2.045118, 2.842835, 1, 0, 0.2352941, 1,
1.807313, 1.008473, 2.619078, 1, 0, 0.227451, 1,
1.858078, -0.6886365, 2.446352, 1, 0, 0.2235294, 1,
1.86386, -1.030192, 2.034839, 1, 0, 0.2156863, 1,
1.880096, 0.6282639, 2.704526, 1, 0, 0.2117647, 1,
1.884256, 0.7195203, 1.279305, 1, 0, 0.2039216, 1,
1.916529, 0.005704444, 2.135908, 1, 0, 0.1960784, 1,
1.937009, -0.283482, 1.261131, 1, 0, 0.1921569, 1,
1.940556, 0.5565087, 2.847578, 1, 0, 0.1843137, 1,
1.943029, 1.345745, 2.538017, 1, 0, 0.1803922, 1,
1.953708, 0.08408782, 1.559763, 1, 0, 0.172549, 1,
1.973221, -0.1367568, 0.7093146, 1, 0, 0.1686275, 1,
2.009454, -1.503343, -0.4755321, 1, 0, 0.1607843, 1,
2.042702, -0.6269717, 0.6653301, 1, 0, 0.1568628, 1,
2.07666, 0.2113855, 1.086927, 1, 0, 0.1490196, 1,
2.093869, -0.9373475, 3.948901, 1, 0, 0.145098, 1,
2.166411, 1.604699, 0.3389296, 1, 0, 0.1372549, 1,
2.180929, 1.502338, 2.265826, 1, 0, 0.1333333, 1,
2.184734, -0.4823963, 1.782033, 1, 0, 0.1254902, 1,
2.191708, 0.2511666, 3.205697, 1, 0, 0.1215686, 1,
2.211533, -1.623823, 2.88145, 1, 0, 0.1137255, 1,
2.225744, -0.501047, 1.656001, 1, 0, 0.1098039, 1,
2.233997, -0.1530265, 0.9872769, 1, 0, 0.1019608, 1,
2.24013, -0.7097385, 2.539001, 1, 0, 0.09411765, 1,
2.283487, 0.09001388, 1.695237, 1, 0, 0.09019608, 1,
2.294712, 0.2062906, 1.233359, 1, 0, 0.08235294, 1,
2.301903, -1.617301, 2.567338, 1, 0, 0.07843138, 1,
2.306887, 0.8361738, 2.564163, 1, 0, 0.07058824, 1,
2.325225, -0.07107668, 2.958851, 1, 0, 0.06666667, 1,
2.333004, -0.06835303, 1.082696, 1, 0, 0.05882353, 1,
2.335449, -0.3353351, 1.760809, 1, 0, 0.05490196, 1,
2.351016, -1.293739, 2.093042, 1, 0, 0.04705882, 1,
2.365788, -0.2757605, 2.064261, 1, 0, 0.04313726, 1,
2.399461, -0.8508918, 1.323, 1, 0, 0.03529412, 1,
2.472484, 0.4486877, 0.9552724, 1, 0, 0.03137255, 1,
2.53259, -1.624571, 2.726018, 1, 0, 0.02352941, 1,
2.557924, -0.4565148, 3.259871, 1, 0, 0.01960784, 1,
2.641344, 0.6222285, 1.245237, 1, 0, 0.01176471, 1,
2.980477, 2.144497, 2.644476, 1, 0, 0.007843138, 1
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
-0.1653029, -5.650089, -7.59409, 0, -0.5, 0.5, 0.5,
-0.1653029, -5.650089, -7.59409, 1, -0.5, 0.5, 0.5,
-0.1653029, -5.650089, -7.59409, 1, 1.5, 0.5, 0.5,
-0.1653029, -5.650089, -7.59409, 0, 1.5, 0.5, 0.5
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
-4.377502, -0.4626678, -7.59409, 0, -0.5, 0.5, 0.5,
-4.377502, -0.4626678, -7.59409, 1, -0.5, 0.5, 0.5,
-4.377502, -0.4626678, -7.59409, 1, 1.5, 0.5, 0.5,
-4.377502, -0.4626678, -7.59409, 0, 1.5, 0.5, 0.5
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
-4.377502, -5.650089, 0.1719546, 0, -0.5, 0.5, 0.5,
-4.377502, -5.650089, 0.1719546, 1, -0.5, 0.5, 0.5,
-4.377502, -5.650089, 0.1719546, 1, 1.5, 0.5, 0.5,
-4.377502, -5.650089, 0.1719546, 0, 1.5, 0.5, 0.5
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
-3, -4.452992, -5.801926,
2, -4.452992, -5.801926,
-3, -4.452992, -5.801926,
-3, -4.652508, -6.10062,
-2, -4.452992, -5.801926,
-2, -4.652508, -6.10062,
-1, -4.452992, -5.801926,
-1, -4.652508, -6.10062,
0, -4.452992, -5.801926,
0, -4.652508, -6.10062,
1, -4.452992, -5.801926,
1, -4.652508, -6.10062,
2, -4.452992, -5.801926,
2, -4.652508, -6.10062
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
"-3",
"-2",
"-1",
"0",
"1",
"2"
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
-3, -5.051541, -6.698008, 0, -0.5, 0.5, 0.5,
-3, -5.051541, -6.698008, 1, -0.5, 0.5, 0.5,
-3, -5.051541, -6.698008, 1, 1.5, 0.5, 0.5,
-3, -5.051541, -6.698008, 0, 1.5, 0.5, 0.5,
-2, -5.051541, -6.698008, 0, -0.5, 0.5, 0.5,
-2, -5.051541, -6.698008, 1, -0.5, 0.5, 0.5,
-2, -5.051541, -6.698008, 1, 1.5, 0.5, 0.5,
-2, -5.051541, -6.698008, 0, 1.5, 0.5, 0.5,
-1, -5.051541, -6.698008, 0, -0.5, 0.5, 0.5,
-1, -5.051541, -6.698008, 1, -0.5, 0.5, 0.5,
-1, -5.051541, -6.698008, 1, 1.5, 0.5, 0.5,
-1, -5.051541, -6.698008, 0, 1.5, 0.5, 0.5,
0, -5.051541, -6.698008, 0, -0.5, 0.5, 0.5,
0, -5.051541, -6.698008, 1, -0.5, 0.5, 0.5,
0, -5.051541, -6.698008, 1, 1.5, 0.5, 0.5,
0, -5.051541, -6.698008, 0, 1.5, 0.5, 0.5,
1, -5.051541, -6.698008, 0, -0.5, 0.5, 0.5,
1, -5.051541, -6.698008, 1, -0.5, 0.5, 0.5,
1, -5.051541, -6.698008, 1, 1.5, 0.5, 0.5,
1, -5.051541, -6.698008, 0, 1.5, 0.5, 0.5,
2, -5.051541, -6.698008, 0, -0.5, 0.5, 0.5,
2, -5.051541, -6.698008, 1, -0.5, 0.5, 0.5,
2, -5.051541, -6.698008, 1, 1.5, 0.5, 0.5,
2, -5.051541, -6.698008, 0, 1.5, 0.5, 0.5
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
-3.405456, -4, -5.801926,
-3.405456, 2, -5.801926,
-3.405456, -4, -5.801926,
-3.567464, -4, -6.10062,
-3.405456, -2, -5.801926,
-3.567464, -2, -6.10062,
-3.405456, 0, -5.801926,
-3.567464, 0, -6.10062,
-3.405456, 2, -5.801926,
-3.567464, 2, -6.10062
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
"-4",
"-2",
"0",
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
-3.891479, -4, -6.698008, 0, -0.5, 0.5, 0.5,
-3.891479, -4, -6.698008, 1, -0.5, 0.5, 0.5,
-3.891479, -4, -6.698008, 1, 1.5, 0.5, 0.5,
-3.891479, -4, -6.698008, 0, 1.5, 0.5, 0.5,
-3.891479, -2, -6.698008, 0, -0.5, 0.5, 0.5,
-3.891479, -2, -6.698008, 1, -0.5, 0.5, 0.5,
-3.891479, -2, -6.698008, 1, 1.5, 0.5, 0.5,
-3.891479, -2, -6.698008, 0, 1.5, 0.5, 0.5,
-3.891479, 0, -6.698008, 0, -0.5, 0.5, 0.5,
-3.891479, 0, -6.698008, 1, -0.5, 0.5, 0.5,
-3.891479, 0, -6.698008, 1, 1.5, 0.5, 0.5,
-3.891479, 0, -6.698008, 0, 1.5, 0.5, 0.5,
-3.891479, 2, -6.698008, 0, -0.5, 0.5, 0.5,
-3.891479, 2, -6.698008, 1, -0.5, 0.5, 0.5,
-3.891479, 2, -6.698008, 1, 1.5, 0.5, 0.5,
-3.891479, 2, -6.698008, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.405456, -4.452992, -4,
-3.405456, -4.452992, 4,
-3.405456, -4.452992, -4,
-3.567464, -4.652508, -4,
-3.405456, -4.452992, -2,
-3.567464, -4.652508, -2,
-3.405456, -4.452992, 0,
-3.567464, -4.652508, 0,
-3.405456, -4.452992, 2,
-3.567464, -4.652508, 2,
-3.405456, -4.452992, 4,
-3.567464, -4.652508, 4
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
-3.891479, -5.051541, -4, 0, -0.5, 0.5, 0.5,
-3.891479, -5.051541, -4, 1, -0.5, 0.5, 0.5,
-3.891479, -5.051541, -4, 1, 1.5, 0.5, 0.5,
-3.891479, -5.051541, -4, 0, 1.5, 0.5, 0.5,
-3.891479, -5.051541, -2, 0, -0.5, 0.5, 0.5,
-3.891479, -5.051541, -2, 1, -0.5, 0.5, 0.5,
-3.891479, -5.051541, -2, 1, 1.5, 0.5, 0.5,
-3.891479, -5.051541, -2, 0, 1.5, 0.5, 0.5,
-3.891479, -5.051541, 0, 0, -0.5, 0.5, 0.5,
-3.891479, -5.051541, 0, 1, -0.5, 0.5, 0.5,
-3.891479, -5.051541, 0, 1, 1.5, 0.5, 0.5,
-3.891479, -5.051541, 0, 0, 1.5, 0.5, 0.5,
-3.891479, -5.051541, 2, 0, -0.5, 0.5, 0.5,
-3.891479, -5.051541, 2, 1, -0.5, 0.5, 0.5,
-3.891479, -5.051541, 2, 1, 1.5, 0.5, 0.5,
-3.891479, -5.051541, 2, 0, 1.5, 0.5, 0.5,
-3.891479, -5.051541, 4, 0, -0.5, 0.5, 0.5,
-3.891479, -5.051541, 4, 1, -0.5, 0.5, 0.5,
-3.891479, -5.051541, 4, 1, 1.5, 0.5, 0.5,
-3.891479, -5.051541, 4, 0, 1.5, 0.5, 0.5
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
-3.405456, -4.452992, -5.801926,
-3.405456, 3.527657, -5.801926,
-3.405456, -4.452992, 6.145835,
-3.405456, 3.527657, 6.145835,
-3.405456, -4.452992, -5.801926,
-3.405456, -4.452992, 6.145835,
-3.405456, 3.527657, -5.801926,
-3.405456, 3.527657, 6.145835,
-3.405456, -4.452992, -5.801926,
3.074851, -4.452992, -5.801926,
-3.405456, -4.452992, 6.145835,
3.074851, -4.452992, 6.145835,
-3.405456, 3.527657, -5.801926,
3.074851, 3.527657, -5.801926,
-3.405456, 3.527657, 6.145835,
3.074851, 3.527657, 6.145835,
3.074851, -4.452992, -5.801926,
3.074851, 3.527657, -5.801926,
3.074851, -4.452992, 6.145835,
3.074851, 3.527657, 6.145835,
3.074851, -4.452992, -5.801926,
3.074851, -4.452992, 6.145835,
3.074851, 3.527657, -5.801926,
3.074851, 3.527657, 6.145835
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
var radius = 8.416491;
var distance = 37.44592;
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
mvMatrix.translate( 0.1653029, 0.4626678, -0.1719546 );
mvMatrix.scale( 1.404266, 1.140268, 0.7616553 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.44592);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Metiram<-read.table("Metiram.xyz")
```

```
## Error in read.table("Metiram.xyz"): no lines available in input
```

```r
x<-Metiram$V2
```

```
## Error in eval(expr, envir, enclos): object 'Metiram' not found
```

```r
y<-Metiram$V3
```

```
## Error in eval(expr, envir, enclos): object 'Metiram' not found
```

```r
z<-Metiram$V4
```

```
## Error in eval(expr, envir, enclos): object 'Metiram' not found
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
-3.311083, 2.430251, -0.4453272, 0, 0, 1, 1, 1,
-3.30415, -2.043163, -2.504807, 1, 0, 0, 1, 1,
-3.108869, -0.9611395, -1.007916, 1, 0, 0, 1, 1,
-2.863404, 0.2369437, -2.120832, 1, 0, 0, 1, 1,
-2.809947, 0.1471064, -0.4825906, 1, 0, 0, 1, 1,
-2.594663, -1.118016, -2.821437, 1, 0, 0, 1, 1,
-2.584414, 0.2901576, 0.007820066, 0, 0, 0, 1, 1,
-2.528841, -0.3502192, -1.23128, 0, 0, 0, 1, 1,
-2.48235, -0.7938247, -3.520633, 0, 0, 0, 1, 1,
-2.451521, -1.470403, -3.881831, 0, 0, 0, 1, 1,
-2.397713, -0.5438609, -2.86752, 0, 0, 0, 1, 1,
-2.368693, 0.2487344, -1.416546, 0, 0, 0, 1, 1,
-2.308421, 0.4563107, -1.825525, 0, 0, 0, 1, 1,
-2.284867, -1.052762, -3.477828, 1, 1, 1, 1, 1,
-2.275996, 0.8288835, -1.997992, 1, 1, 1, 1, 1,
-2.210269, 0.4011538, -1.881541, 1, 1, 1, 1, 1,
-2.180095, 0.08592962, -2.408391, 1, 1, 1, 1, 1,
-2.095785, -0.2033622, -1.861847, 1, 1, 1, 1, 1,
-2.094932, 1.530918, -2.636644, 1, 1, 1, 1, 1,
-2.076981, 0.1787576, -1.875612, 1, 1, 1, 1, 1,
-2.041259, -0.6750527, -3.264446, 1, 1, 1, 1, 1,
-1.974983, -0.4628494, -1.62901, 1, 1, 1, 1, 1,
-1.935841, 0.2996613, -1.936703, 1, 1, 1, 1, 1,
-1.935285, 0.1889078, -0.8673595, 1, 1, 1, 1, 1,
-1.930778, -0.428275, -1.667561, 1, 1, 1, 1, 1,
-1.914818, 0.4395485, -1.446926, 1, 1, 1, 1, 1,
-1.905886, -1.217522, -4.127138, 1, 1, 1, 1, 1,
-1.887326, 1.030584, -0.4994115, 1, 1, 1, 1, 1,
-1.870863, -0.07464796, -1.260621, 0, 0, 1, 1, 1,
-1.839778, 1.206459, 1.646775, 1, 0, 0, 1, 1,
-1.836489, -0.2610545, -2.721388, 1, 0, 0, 1, 1,
-1.820895, -2.320821, -3.118546, 1, 0, 0, 1, 1,
-1.801625, -0.1109041, -1.49176, 1, 0, 0, 1, 1,
-1.787838, 1.562777, -0.3990951, 1, 0, 0, 1, 1,
-1.780194, 0.01584063, -2.06585, 0, 0, 0, 1, 1,
-1.760065, -0.1045014, -3.097888, 0, 0, 0, 1, 1,
-1.75538, -1.126318, -2.363516, 0, 0, 0, 1, 1,
-1.754182, -0.9525306, -0.438035, 0, 0, 0, 1, 1,
-1.746725, 1.028153, -2.646267, 0, 0, 0, 1, 1,
-1.675114, 0.3650967, -1.827057, 0, 0, 0, 1, 1,
-1.660721, 0.9510295, -0.5275797, 0, 0, 0, 1, 1,
-1.660522, -0.9674005, -1.807344, 1, 1, 1, 1, 1,
-1.659785, 0.2566277, -2.675122, 1, 1, 1, 1, 1,
-1.650893, -0.7062982, -1.098702, 1, 1, 1, 1, 1,
-1.649554, -0.9495254, -1.550531, 1, 1, 1, 1, 1,
-1.647833, -0.07682402, -1.048025, 1, 1, 1, 1, 1,
-1.646758, -2.311699, -3.553374, 1, 1, 1, 1, 1,
-1.641971, -0.8178724, -0.485725, 1, 1, 1, 1, 1,
-1.629056, -0.644582, -2.613426, 1, 1, 1, 1, 1,
-1.620927, -0.2263667, -2.495958, 1, 1, 1, 1, 1,
-1.615871, -0.09336995, -2.121341, 1, 1, 1, 1, 1,
-1.607412, 0.4939177, -2.135839, 1, 1, 1, 1, 1,
-1.606377, 1.10472, 1.09597, 1, 1, 1, 1, 1,
-1.602737, -1.233948, -3.818383, 1, 1, 1, 1, 1,
-1.600369, -0.6177177, -2.823752, 1, 1, 1, 1, 1,
-1.597379, 2.058295, -0.5106897, 1, 1, 1, 1, 1,
-1.590257, 0.462763, -1.354704, 0, 0, 1, 1, 1,
-1.585833, -0.1974279, -1.992668, 1, 0, 0, 1, 1,
-1.581573, -0.65441, -0.752011, 1, 0, 0, 1, 1,
-1.570277, -0.3943348, -2.286789, 1, 0, 0, 1, 1,
-1.562099, 0.1777298, -0.1092576, 1, 0, 0, 1, 1,
-1.547812, -0.02902626, -2.212267, 1, 0, 0, 1, 1,
-1.538513, -1.167592, -1.365462, 0, 0, 0, 1, 1,
-1.529456, -0.7884967, -2.288883, 0, 0, 0, 1, 1,
-1.519668, 0.2100141, -1.442345, 0, 0, 0, 1, 1,
-1.515738, 0.65965, -2.207539, 0, 0, 0, 1, 1,
-1.50607, 2.044865, 0.5277591, 0, 0, 0, 1, 1,
-1.503527, 0.4756546, -1.533217, 0, 0, 0, 1, 1,
-1.487559, -1.84202, -2.804719, 0, 0, 0, 1, 1,
-1.484898, -0.1035346, -0.8793039, 1, 1, 1, 1, 1,
-1.478795, 0.9536182, -2.227865, 1, 1, 1, 1, 1,
-1.469332, -0.3126245, -1.727283, 1, 1, 1, 1, 1,
-1.469048, -0.9997774, -1.96891, 1, 1, 1, 1, 1,
-1.464376, -1.290316, -2.686716, 1, 1, 1, 1, 1,
-1.462138, -1.236812, -1.022852, 1, 1, 1, 1, 1,
-1.462017, 2.004508, -2.116643, 1, 1, 1, 1, 1,
-1.458277, -1.65986, -4.365767, 1, 1, 1, 1, 1,
-1.452393, -2.33673, -4.209398, 1, 1, 1, 1, 1,
-1.44388, -1.737664, -0.9705601, 1, 1, 1, 1, 1,
-1.430939, 0.6289354, -0.8197477, 1, 1, 1, 1, 1,
-1.423469, -1.594456, -1.959657, 1, 1, 1, 1, 1,
-1.420842, 0.6996216, -1.276162, 1, 1, 1, 1, 1,
-1.38147, 1.164459, -2.108187, 1, 1, 1, 1, 1,
-1.380037, -0.6264198, -1.306156, 1, 1, 1, 1, 1,
-1.374715, 0.4149245, 1.148389, 0, 0, 1, 1, 1,
-1.373102, 1.146366, -1.531812, 1, 0, 0, 1, 1,
-1.371628, 0.126403, -1.474903, 1, 0, 0, 1, 1,
-1.35818, 0.1487404, -0.5421457, 1, 0, 0, 1, 1,
-1.355162, -1.847168, -1.870485, 1, 0, 0, 1, 1,
-1.346784, 2.913094, -1.437205, 1, 0, 0, 1, 1,
-1.346388, -0.5516006, -1.561921, 0, 0, 0, 1, 1,
-1.330261, 1.352381, 1.20935, 0, 0, 0, 1, 1,
-1.31071, -1.718557, -3.996118, 0, 0, 0, 1, 1,
-1.30778, 0.3485607, -3.255119, 0, 0, 0, 1, 1,
-1.305848, 0.6951235, -0.3918977, 0, 0, 0, 1, 1,
-1.289946, 0.01657079, -1.388441, 0, 0, 0, 1, 1,
-1.279567, -0.3710995, -1.249852, 0, 0, 0, 1, 1,
-1.279092, 0.1667349, -1.29467, 1, 1, 1, 1, 1,
-1.271331, 1.549965, -1.47947, 1, 1, 1, 1, 1,
-1.268187, 0.0448122, -0.431544, 1, 1, 1, 1, 1,
-1.257926, 0.4063658, -1.962889, 1, 1, 1, 1, 1,
-1.25356, -1.567696, -3.570063, 1, 1, 1, 1, 1,
-1.253075, -0.9733986, -2.568628, 1, 1, 1, 1, 1,
-1.251822, -0.2995691, -3.061196, 1, 1, 1, 1, 1,
-1.25019, 1.188762, -2.507776, 1, 1, 1, 1, 1,
-1.24362, 0.4030788, -2.381618, 1, 1, 1, 1, 1,
-1.243546, -1.563133, -0.1364873, 1, 1, 1, 1, 1,
-1.242591, -1.970644, -3.849915, 1, 1, 1, 1, 1,
-1.226105, 2.154949, -0.5750092, 1, 1, 1, 1, 1,
-1.216752, -0.6626155, -4.03757, 1, 1, 1, 1, 1,
-1.206362, 0.3107447, -2.567684, 1, 1, 1, 1, 1,
-1.203285, 0.755827, -2.931493, 1, 1, 1, 1, 1,
-1.20217, 1.014359, -0.2206777, 0, 0, 1, 1, 1,
-1.200249, 0.8080615, -0.1374365, 1, 0, 0, 1, 1,
-1.197618, 0.03495203, 0.165099, 1, 0, 0, 1, 1,
-1.188548, 1.527157, -1.406079, 1, 0, 0, 1, 1,
-1.183569, 0.1277434, -1.720843, 1, 0, 0, 1, 1,
-1.174197, 0.4618762, -1.188989, 1, 0, 0, 1, 1,
-1.172143, -2.845095, -3.39081, 0, 0, 0, 1, 1,
-1.171171, -0.5571216, -1.696508, 0, 0, 0, 1, 1,
-1.160248, -0.2550956, -1.528667, 0, 0, 0, 1, 1,
-1.157226, 2.335649, 0.4069574, 0, 0, 0, 1, 1,
-1.156125, -0.3511804, -1.336047, 0, 0, 0, 1, 1,
-1.154147, 1.650004, 0.5692615, 0, 0, 0, 1, 1,
-1.140935, -0.8428646, -0.7144721, 0, 0, 0, 1, 1,
-1.14003, 0.1009541, -1.658298, 1, 1, 1, 1, 1,
-1.128961, -1.683985, 0.1840146, 1, 1, 1, 1, 1,
-1.127364, 0.8558621, 0.3316468, 1, 1, 1, 1, 1,
-1.123506, -0.6212526, -1.577993, 1, 1, 1, 1, 1,
-1.122238, -2.69255, -4.438995, 1, 1, 1, 1, 1,
-1.116244, 0.2171101, -1.226962, 1, 1, 1, 1, 1,
-1.106777, 2.143016, -1.308286, 1, 1, 1, 1, 1,
-1.106704, -1.130004, -3.544863, 1, 1, 1, 1, 1,
-1.098551, 0.759812, -2.027393, 1, 1, 1, 1, 1,
-1.096886, -1.204018, -1.94271, 1, 1, 1, 1, 1,
-1.091065, -1.291745, -1.971971, 1, 1, 1, 1, 1,
-1.084856, 0.6756489, -1.537796, 1, 1, 1, 1, 1,
-1.079286, 0.09420968, 0.6640747, 1, 1, 1, 1, 1,
-1.078216, -0.3168493, -1.657821, 1, 1, 1, 1, 1,
-1.072475, 0.6522672, -0.3769157, 1, 1, 1, 1, 1,
-1.069654, -0.04776495, -1.816726, 0, 0, 1, 1, 1,
-1.067386, -1.984657, -1.885543, 1, 0, 0, 1, 1,
-1.065027, -0.3067676, 0.3913134, 1, 0, 0, 1, 1,
-1.064567, 0.4883628, -0.4459778, 1, 0, 0, 1, 1,
-1.060427, -0.6719511, -1.003013, 1, 0, 0, 1, 1,
-1.054363, 0.0009732108, -1.980198, 1, 0, 0, 1, 1,
-1.051387, 0.3050907, -1.503554, 0, 0, 0, 1, 1,
-1.04768, -1.915017, -2.982559, 0, 0, 0, 1, 1,
-1.04589, 1.30943, -0.9945657, 0, 0, 0, 1, 1,
-1.044244, 0.8964207, -1.291397, 0, 0, 0, 1, 1,
-1.042281, -0.5351917, -2.192308, 0, 0, 0, 1, 1,
-1.035187, -0.4864247, -1.844385, 0, 0, 0, 1, 1,
-1.033912, 0.07220966, -2.215275, 0, 0, 0, 1, 1,
-1.030648, 0.9916557, -1.377749, 1, 1, 1, 1, 1,
-1.027843, -1.042561, -2.692239, 1, 1, 1, 1, 1,
-1.013557, -0.8300548, -2.196219, 1, 1, 1, 1, 1,
-1.006822, 1.123497, 0.06330143, 1, 1, 1, 1, 1,
-1.006184, -1.291216, -2.741003, 1, 1, 1, 1, 1,
-0.9995536, -0.4160192, -2.396013, 1, 1, 1, 1, 1,
-0.9992529, -0.1423489, -3.14049, 1, 1, 1, 1, 1,
-0.9987499, -1.787658, -3.109933, 1, 1, 1, 1, 1,
-0.9911581, 1.394788, 0.690833, 1, 1, 1, 1, 1,
-0.9897797, -0.05336421, -1.624513, 1, 1, 1, 1, 1,
-0.9841425, 0.4400051, -0.4025396, 1, 1, 1, 1, 1,
-0.9792094, 0.9338684, -1.573645, 1, 1, 1, 1, 1,
-0.9755842, -0.3321023, -0.8697604, 1, 1, 1, 1, 1,
-0.9743003, -0.3976463, -2.574069, 1, 1, 1, 1, 1,
-0.9702104, 1.620179, -1.265735, 1, 1, 1, 1, 1,
-0.9655629, -0.4652934, -2.849921, 0, 0, 1, 1, 1,
-0.9640232, -2.206507, -1.683631, 1, 0, 0, 1, 1,
-0.9612842, 0.106838, -1.527512, 1, 0, 0, 1, 1,
-0.9515964, 0.459273, 0.6788356, 1, 0, 0, 1, 1,
-0.9512777, 1.162352, -0.5727612, 1, 0, 0, 1, 1,
-0.9502842, -0.6180193, -1.906748, 1, 0, 0, 1, 1,
-0.9495995, -0.3639988, -3.084774, 0, 0, 0, 1, 1,
-0.9429468, -0.5746765, -1.877595, 0, 0, 0, 1, 1,
-0.9425324, -2.660643, -2.829368, 0, 0, 0, 1, 1,
-0.9373176, -0.5690841, -2.820474, 0, 0, 0, 1, 1,
-0.9326541, -2.070246, -3.078381, 0, 0, 0, 1, 1,
-0.9304706, -0.2928064, -0.5523195, 0, 0, 0, 1, 1,
-0.9282464, 0.3051956, -1.167494, 0, 0, 0, 1, 1,
-0.9267545, 0.5877128, -0.515492, 1, 1, 1, 1, 1,
-0.9263635, -1.013324, -2.747901, 1, 1, 1, 1, 1,
-0.9199947, 0.3716146, 1.200288, 1, 1, 1, 1, 1,
-0.919895, -0.1051673, -2.159856, 1, 1, 1, 1, 1,
-0.9186066, 0.04778767, -2.664661, 1, 1, 1, 1, 1,
-0.9151345, 1.653532, 0.05623322, 1, 1, 1, 1, 1,
-0.9084991, 0.9840282, -3.246958, 1, 1, 1, 1, 1,
-0.9036852, -0.06958038, -2.832748, 1, 1, 1, 1, 1,
-0.8942901, -0.8659837, -1.786216, 1, 1, 1, 1, 1,
-0.8903238, -0.3556911, -1.614018, 1, 1, 1, 1, 1,
-0.890169, -0.6823207, -2.186537, 1, 1, 1, 1, 1,
-0.8869334, 0.1983875, -1.26162, 1, 1, 1, 1, 1,
-0.8764481, -0.7518266, -2.695673, 1, 1, 1, 1, 1,
-0.8627782, 1.255445, 0.4052234, 1, 1, 1, 1, 1,
-0.8585292, 0.7130677, -0.7316024, 1, 1, 1, 1, 1,
-0.8514172, -0.5299457, -1.491395, 0, 0, 1, 1, 1,
-0.8485671, 1.146025, -0.7488568, 1, 0, 0, 1, 1,
-0.8443041, -0.3951072, -3.322106, 1, 0, 0, 1, 1,
-0.8352965, -0.6313142, -2.493834, 1, 0, 0, 1, 1,
-0.8335703, 0.2703338, -1.124615, 1, 0, 0, 1, 1,
-0.8293934, 1.124568, -1.400981, 1, 0, 0, 1, 1,
-0.8287349, -0.726723, -1.817572, 0, 0, 0, 1, 1,
-0.8171619, 1.220501, 0.4336997, 0, 0, 0, 1, 1,
-0.812726, 1.231374, -0.8751991, 0, 0, 0, 1, 1,
-0.8123112, -0.2980469, -1.70768, 0, 0, 0, 1, 1,
-0.8118804, 2.113938, -0.496842, 0, 0, 0, 1, 1,
-0.8063083, 1.496765, -2.302387, 0, 0, 0, 1, 1,
-0.8006632, 0.445318, 1.598239, 0, 0, 0, 1, 1,
-0.8000371, 0.3831695, -0.8463627, 1, 1, 1, 1, 1,
-0.7999395, 1.11674, -0.5373201, 1, 1, 1, 1, 1,
-0.7990662, 0.9357601, 0.02847269, 1, 1, 1, 1, 1,
-0.798266, -1.776422, -1.813026, 1, 1, 1, 1, 1,
-0.7936333, -1.318361, -2.643486, 1, 1, 1, 1, 1,
-0.7934, 0.006336762, -1.140171, 1, 1, 1, 1, 1,
-0.7917277, 0.9659538, -0.2462765, 1, 1, 1, 1, 1,
-0.7895248, -2.092981, -2.530649, 1, 1, 1, 1, 1,
-0.7887741, -0.357274, -0.8594432, 1, 1, 1, 1, 1,
-0.7871744, -0.8469965, -1.93126, 1, 1, 1, 1, 1,
-0.7855635, 0.6943673, 0.8878567, 1, 1, 1, 1, 1,
-0.7830985, -0.2814124, -1.31521, 1, 1, 1, 1, 1,
-0.7810802, -0.9582471, -1.006652, 1, 1, 1, 1, 1,
-0.7802728, -0.8118173, -4.175633, 1, 1, 1, 1, 1,
-0.7801056, -0.6238028, -2.180483, 1, 1, 1, 1, 1,
-0.778118, -0.7765413, -3.294869, 0, 0, 1, 1, 1,
-0.7751771, -0.3509552, -1.695057, 1, 0, 0, 1, 1,
-0.7750768, -1.119491, -2.655853, 1, 0, 0, 1, 1,
-0.774953, 0.7057299, -1.576243, 1, 0, 0, 1, 1,
-0.7639341, -1.393883, -3.421516, 1, 0, 0, 1, 1,
-0.7628061, 1.094886, -1.848243, 1, 0, 0, 1, 1,
-0.7626178, 0.7033986, -0.2225382, 0, 0, 0, 1, 1,
-0.7551331, -0.1852236, -1.536588, 0, 0, 0, 1, 1,
-0.7527742, 0.7590613, -1.510488, 0, 0, 0, 1, 1,
-0.7512569, 0.9797375, -2.057243, 0, 0, 0, 1, 1,
-0.7469991, -1.415702, -1.156549, 0, 0, 0, 1, 1,
-0.7420671, 0.178307, -2.749288, 0, 0, 0, 1, 1,
-0.7393394, -1.795173, -1.16236, 0, 0, 0, 1, 1,
-0.7377148, -0.5069389, -1.269845, 1, 1, 1, 1, 1,
-0.7356596, 0.1763848, -0.1363156, 1, 1, 1, 1, 1,
-0.7328058, -1.499228, -2.672842, 1, 1, 1, 1, 1,
-0.729928, -0.6131944, -1.882188, 1, 1, 1, 1, 1,
-0.7295058, 0.2365739, -1.572592, 1, 1, 1, 1, 1,
-0.7293364, 0.8831899, -2.534551, 1, 1, 1, 1, 1,
-0.7287245, 0.05405163, -2.474726, 1, 1, 1, 1, 1,
-0.7242736, -1.80473, -3.974821, 1, 1, 1, 1, 1,
-0.7155184, -0.3163767, -3.35921, 1, 1, 1, 1, 1,
-0.7021922, -1.455427, -2.70181, 1, 1, 1, 1, 1,
-0.6980355, 2.02398, -1.181461, 1, 1, 1, 1, 1,
-0.6967005, -0.1253967, -2.284924, 1, 1, 1, 1, 1,
-0.6918777, 0.1762553, -1.792343, 1, 1, 1, 1, 1,
-0.683669, 0.5990796, -0.2058487, 1, 1, 1, 1, 1,
-0.6828716, 0.3568108, -2.078069, 1, 1, 1, 1, 1,
-0.6806248, 0.06395816, -2.666061, 0, 0, 1, 1, 1,
-0.6798264, 1.125469, -1.480275, 1, 0, 0, 1, 1,
-0.6787495, 0.5104891, -0.6422073, 1, 0, 0, 1, 1,
-0.67664, 1.273003, -0.8627933, 1, 0, 0, 1, 1,
-0.6738734, -2.737175, -1.991968, 1, 0, 0, 1, 1,
-0.6725525, -2.054592, -2.218854, 1, 0, 0, 1, 1,
-0.6712244, -0.2724064, -0.5202191, 0, 0, 0, 1, 1,
-0.6616011, -0.3814885, -0.575448, 0, 0, 0, 1, 1,
-0.6605634, -0.4985872, -3.78369, 0, 0, 0, 1, 1,
-0.6577733, -0.23755, -1.596595, 0, 0, 0, 1, 1,
-0.6516618, 1.091286, 0.8772945, 0, 0, 0, 1, 1,
-0.6475651, -0.202374, -2.302031, 0, 0, 0, 1, 1,
-0.6433073, 0.8819328, -1.170681, 0, 0, 0, 1, 1,
-0.6415434, 1.845976, -0.414727, 1, 1, 1, 1, 1,
-0.6404694, -0.5398164, -3.6076, 1, 1, 1, 1, 1,
-0.637031, -0.4655204, -1.640494, 1, 1, 1, 1, 1,
-0.6350991, 0.3102941, -0.9324861, 1, 1, 1, 1, 1,
-0.6331621, 0.1551308, -0.546994, 1, 1, 1, 1, 1,
-0.628347, -0.5833942, -4.42524, 1, 1, 1, 1, 1,
-0.6271503, 0.4783072, -0.165134, 1, 1, 1, 1, 1,
-0.6214345, -0.6905088, -2.302343, 1, 1, 1, 1, 1,
-0.6211874, -0.03681222, -1.770919, 1, 1, 1, 1, 1,
-0.6189244, -1.404933, -2.361018, 1, 1, 1, 1, 1,
-0.6181774, -0.9427478, -2.322444, 1, 1, 1, 1, 1,
-0.6164164, -0.1745028, -1.579442, 1, 1, 1, 1, 1,
-0.6162076, 0.931735, -1.136774, 1, 1, 1, 1, 1,
-0.6151251, 0.02644827, -2.264393, 1, 1, 1, 1, 1,
-0.6124884, -0.31376, -2.029871, 1, 1, 1, 1, 1,
-0.611292, 0.6939403, -0.5105695, 0, 0, 1, 1, 1,
-0.606733, 0.499559, -3.663929, 1, 0, 0, 1, 1,
-0.6000757, -0.2838836, -1.445721, 1, 0, 0, 1, 1,
-0.597369, -2.083501, -1.499579, 1, 0, 0, 1, 1,
-0.5966034, 1.077702, 0.325004, 1, 0, 0, 1, 1,
-0.595243, -1.968285, -1.822409, 1, 0, 0, 1, 1,
-0.5937112, 0.222108, 0.1491614, 0, 0, 0, 1, 1,
-0.5922947, 0.7027529, -0.06875665, 0, 0, 0, 1, 1,
-0.587361, -0.6803556, -3.420069, 0, 0, 0, 1, 1,
-0.5684665, -0.6199696, -1.715917, 0, 0, 0, 1, 1,
-0.5672267, -0.281777, -2.057357, 0, 0, 0, 1, 1,
-0.5666384, 0.8105651, 1.257286, 0, 0, 0, 1, 1,
-0.5607229, 0.05445083, -1.679305, 0, 0, 0, 1, 1,
-0.557377, 0.4026834, -1.485163, 1, 1, 1, 1, 1,
-0.5553181, 1.224364, -0.9695459, 1, 1, 1, 1, 1,
-0.5538599, -0.4754812, -1.15256, 1, 1, 1, 1, 1,
-0.5518159, 1.504854, -0.6160926, 1, 1, 1, 1, 1,
-0.5460077, 1.699679, 1.172337, 1, 1, 1, 1, 1,
-0.5428467, 0.2159431, -0.5676003, 1, 1, 1, 1, 1,
-0.5409385, -0.2805974, -0.6865634, 1, 1, 1, 1, 1,
-0.5393288, -0.5503666, -3.068341, 1, 1, 1, 1, 1,
-0.5352277, -1.71566, -2.29996, 1, 1, 1, 1, 1,
-0.5325342, -0.2345423, -1.487962, 1, 1, 1, 1, 1,
-0.5323204, -1.496426, -2.502294, 1, 1, 1, 1, 1,
-0.5308482, 1.047259, 0.9261509, 1, 1, 1, 1, 1,
-0.5298414, -0.6343936, -2.383781, 1, 1, 1, 1, 1,
-0.5297999, 1.121778, 0.2222447, 1, 1, 1, 1, 1,
-0.5284604, -1.121508, -2.399808, 1, 1, 1, 1, 1,
-0.5262656, -0.929887, -1.489455, 0, 0, 1, 1, 1,
-0.5244154, -0.0554807, -0.1188782, 1, 0, 0, 1, 1,
-0.5242823, 0.8890998, -0.4978236, 1, 0, 0, 1, 1,
-0.5235516, -0.8385301, -3.202883, 1, 0, 0, 1, 1,
-0.5208182, 0.678112, 0.7858725, 1, 0, 0, 1, 1,
-0.5170036, 0.4897626, -2.429409, 1, 0, 0, 1, 1,
-0.5169768, 1.256768, -0.9012163, 0, 0, 0, 1, 1,
-0.5130805, -0.9553701, -2.765138, 0, 0, 0, 1, 1,
-0.5108447, -0.8256746, -4.127623, 0, 0, 0, 1, 1,
-0.5089137, 1.54875, 0.2038464, 0, 0, 0, 1, 1,
-0.5073541, -0.6160138, -3.147484, 0, 0, 0, 1, 1,
-0.5046542, 0.9736675, -0.01290761, 0, 0, 0, 1, 1,
-0.5030971, -0.07102115, -1.24523, 0, 0, 0, 1, 1,
-0.5029103, 0.5699537, 0.3229539, 1, 1, 1, 1, 1,
-0.4986586, -0.006964232, -1.756426, 1, 1, 1, 1, 1,
-0.4983368, -0.5063015, -5.627929, 1, 1, 1, 1, 1,
-0.4941073, 2.065226, 0.5059492, 1, 1, 1, 1, 1,
-0.4922246, 1.291263, -2.384783, 1, 1, 1, 1, 1,
-0.4898569, 0.6922874, -2.091161, 1, 1, 1, 1, 1,
-0.4894593, 1.383235, -1.178091, 1, 1, 1, 1, 1,
-0.4857853, 0.4148229, -1.897696, 1, 1, 1, 1, 1,
-0.4835678, -1.190698, -3.330489, 1, 1, 1, 1, 1,
-0.4830594, -0.797376, -2.235546, 1, 1, 1, 1, 1,
-0.4800757, 1.107937, -0.6250432, 1, 1, 1, 1, 1,
-0.4781025, 0.3977169, -0.6389998, 1, 1, 1, 1, 1,
-0.4733267, -1.011236, -3.25829, 1, 1, 1, 1, 1,
-0.4730602, -0.1444631, -1.184548, 1, 1, 1, 1, 1,
-0.4718001, 0.7566239, -1.393613, 1, 1, 1, 1, 1,
-0.4710833, 0.841621, 0.4661815, 0, 0, 1, 1, 1,
-0.4702042, 0.9367728, 0.5053793, 1, 0, 0, 1, 1,
-0.4685996, 0.8237365, 1.311648, 1, 0, 0, 1, 1,
-0.4636758, 1.453155, 0.294429, 1, 0, 0, 1, 1,
-0.4599033, 0.1195922, -1.782776, 1, 0, 0, 1, 1,
-0.4575205, -0.1095908, -4.343679, 1, 0, 0, 1, 1,
-0.4477856, 1.457382, 1.772912, 0, 0, 0, 1, 1,
-0.4457704, 1.11456, -0.8482566, 0, 0, 0, 1, 1,
-0.4439764, 0.8413764, -1.20168, 0, 0, 0, 1, 1,
-0.4410427, 1.533076, -0.7304621, 0, 0, 0, 1, 1,
-0.4408258, 1.311013, -0.622924, 0, 0, 0, 1, 1,
-0.4405371, 0.4673071, -0.7885959, 0, 0, 0, 1, 1,
-0.4344142, 0.82609, -0.2129507, 0, 0, 0, 1, 1,
-0.4315597, -0.992565, -5.462199, 1, 1, 1, 1, 1,
-0.4312761, 0.5080829, -0.510798, 1, 1, 1, 1, 1,
-0.4249143, -0.4119582, -2.181048, 1, 1, 1, 1, 1,
-0.4192612, 0.9242483, -0.6987833, 1, 1, 1, 1, 1,
-0.416395, 0.8966368, 0.417784, 1, 1, 1, 1, 1,
-0.412056, -0.07247242, -0.8801306, 1, 1, 1, 1, 1,
-0.4029222, -0.3243205, -3.250053, 1, 1, 1, 1, 1,
-0.4009548, 0.175658, -0.5321507, 1, 1, 1, 1, 1,
-0.3992243, -0.1673449, -1.823064, 1, 1, 1, 1, 1,
-0.3963566, 0.1353278, -0.9303026, 1, 1, 1, 1, 1,
-0.3832645, -1.451807, -1.845904, 1, 1, 1, 1, 1,
-0.3789332, -1.038586, -0.621803, 1, 1, 1, 1, 1,
-0.3767219, -1.26311, -2.260726, 1, 1, 1, 1, 1,
-0.3759618, -1.641245, -2.003649, 1, 1, 1, 1, 1,
-0.3736102, -0.07483802, -1.121502, 1, 1, 1, 1, 1,
-0.3727809, -0.1171799, -1.532178, 0, 0, 1, 1, 1,
-0.3699688, 0.389255, -1.5605, 1, 0, 0, 1, 1,
-0.366525, -1.422444, -3.300457, 1, 0, 0, 1, 1,
-0.3635289, -0.2860695, -0.8260444, 1, 0, 0, 1, 1,
-0.3615221, -0.9217494, -2.643764, 1, 0, 0, 1, 1,
-0.3572243, 1.689399, 0.2473753, 1, 0, 0, 1, 1,
-0.3563405, -0.159508, -2.025974, 0, 0, 0, 1, 1,
-0.3535912, 0.0837404, -2.105358, 0, 0, 0, 1, 1,
-0.3535308, 2.015357, 0.1928051, 0, 0, 0, 1, 1,
-0.3523453, -0.9457092, -2.403633, 0, 0, 0, 1, 1,
-0.3480866, -3.074585, -2.361206, 0, 0, 0, 1, 1,
-0.3408346, -0.7050883, -2.437336, 0, 0, 0, 1, 1,
-0.3360771, 1.114717, -0.4403657, 0, 0, 0, 1, 1,
-0.3338882, -1.233131, -4.868638, 1, 1, 1, 1, 1,
-0.3299637, -0.8960836, -2.091546, 1, 1, 1, 1, 1,
-0.3289229, -0.08154302, -1.450763, 1, 1, 1, 1, 1,
-0.3285791, 1.152519, -0.6420053, 1, 1, 1, 1, 1,
-0.3244355, -0.8149734, -4.262315, 1, 1, 1, 1, 1,
-0.3219764, -0.07044335, -1.617664, 1, 1, 1, 1, 1,
-0.319332, 0.7138508, 0.3523292, 1, 1, 1, 1, 1,
-0.3133712, -1.158887, -2.644974, 1, 1, 1, 1, 1,
-0.3111714, -0.1909059, -2.445252, 1, 1, 1, 1, 1,
-0.3063622, 0.7271036, -1.652804, 1, 1, 1, 1, 1,
-0.3028007, -0.8729581, -3.417768, 1, 1, 1, 1, 1,
-0.3004693, -0.562457, -3.580341, 1, 1, 1, 1, 1,
-0.2998924, 0.007223497, -3.476824, 1, 1, 1, 1, 1,
-0.2983291, -0.6299049, -1.635745, 1, 1, 1, 1, 1,
-0.295833, -2.508979, -3.302357, 1, 1, 1, 1, 1,
-0.2951828, 0.7970367, 0.1576625, 0, 0, 1, 1, 1,
-0.2926826, -0.5235813, -3.100117, 1, 0, 0, 1, 1,
-0.2867759, -0.8836309, -2.46095, 1, 0, 0, 1, 1,
-0.2834376, -0.2621595, -3.749701, 1, 0, 0, 1, 1,
-0.2800422, 0.9886805, 0.3126511, 1, 0, 0, 1, 1,
-0.276788, 2.164592, -0.2183236, 1, 0, 0, 1, 1,
-0.2754512, -0.4569329, -3.242473, 0, 0, 0, 1, 1,
-0.264135, -1.116239, -2.735937, 0, 0, 0, 1, 1,
-0.2595461, -0.2809194, -1.806868, 0, 0, 0, 1, 1,
-0.2565899, 0.8998135, 0.1732942, 0, 0, 0, 1, 1,
-0.2556289, 0.7334564, 0.4812199, 0, 0, 0, 1, 1,
-0.2522826, 1.616915, 0.4912466, 0, 0, 0, 1, 1,
-0.2502406, 1.773645, 0.5210103, 0, 0, 0, 1, 1,
-0.2470224, 0.3500203, -0.8080848, 1, 1, 1, 1, 1,
-0.2413893, -0.04251423, -1.117719, 1, 1, 1, 1, 1,
-0.2401684, -0.9940477, -3.910266, 1, 1, 1, 1, 1,
-0.2367507, 0.2368684, -0.8807987, 1, 1, 1, 1, 1,
-0.2347067, -0.6875859, -3.894307, 1, 1, 1, 1, 1,
-0.2340329, 0.6663959, -0.3480289, 1, 1, 1, 1, 1,
-0.2297037, 0.2234975, -1.181357, 1, 1, 1, 1, 1,
-0.2249986, -0.1584377, -1.827245, 1, 1, 1, 1, 1,
-0.2244866, -1.445256, -4.257754, 1, 1, 1, 1, 1,
-0.2242415, 0.09878013, -1.595689, 1, 1, 1, 1, 1,
-0.223593, -1.168149, -0.4187546, 1, 1, 1, 1, 1,
-0.2162925, -0.7097641, -3.129253, 1, 1, 1, 1, 1,
-0.2135562, 0.7770677, 0.5921649, 1, 1, 1, 1, 1,
-0.2067042, 0.6899598, -1.974324, 1, 1, 1, 1, 1,
-0.2034788, 0.1550167, -0.3276785, 1, 1, 1, 1, 1,
-0.2027611, -1.9216, -3.369006, 0, 0, 1, 1, 1,
-0.2026937, -1.635085, -2.106846, 1, 0, 0, 1, 1,
-0.2024646, -1.41671, -0.8947462, 1, 0, 0, 1, 1,
-0.2023327, -0.5542314, -2.554276, 1, 0, 0, 1, 1,
-0.2001456, -0.4444038, -2.469113, 1, 0, 0, 1, 1,
-0.1971978, -0.6573623, -3.401342, 1, 0, 0, 1, 1,
-0.1947848, 0.5262447, -1.251955, 0, 0, 0, 1, 1,
-0.1902625, 0.0749568, -1.357421, 0, 0, 0, 1, 1,
-0.1878341, 1.30393, 0.2433058, 0, 0, 0, 1, 1,
-0.1865391, -0.965355, -4.309939, 0, 0, 0, 1, 1,
-0.1860055, 1.05011, -0.8804228, 0, 0, 0, 1, 1,
-0.1789399, -0.4675145, -2.543149, 0, 0, 0, 1, 1,
-0.1770479, -0.4069259, -1.91558, 0, 0, 0, 1, 1,
-0.1686785, -0.3431668, -1.056696, 1, 1, 1, 1, 1,
-0.165083, -1.328502, -2.595221, 1, 1, 1, 1, 1,
-0.1611876, -0.1094204, -1.371683, 1, 1, 1, 1, 1,
-0.1594437, 1.055767, -1.435675, 1, 1, 1, 1, 1,
-0.1571275, -1.698602, -3.13417, 1, 1, 1, 1, 1,
-0.1570696, 0.1856568, 0.5071523, 1, 1, 1, 1, 1,
-0.1548148, -2.553696, -3.53901, 1, 1, 1, 1, 1,
-0.1534491, -0.3561741, -2.054178, 1, 1, 1, 1, 1,
-0.1506673, -1.142813, -2.340703, 1, 1, 1, 1, 1,
-0.1473136, 0.6583969, -0.5402844, 1, 1, 1, 1, 1,
-0.1416979, 0.1726765, 0.3075201, 1, 1, 1, 1, 1,
-0.140623, -1.553113, -1.714888, 1, 1, 1, 1, 1,
-0.1365945, 2.030998, -2.44341, 1, 1, 1, 1, 1,
-0.1356012, 0.1557843, -0.5165476, 1, 1, 1, 1, 1,
-0.1354607, -0.8142319, -3.20633, 1, 1, 1, 1, 1,
-0.1332248, -1.523588, -2.240556, 0, 0, 1, 1, 1,
-0.1295677, 0.4680758, -2.277474, 1, 0, 0, 1, 1,
-0.1261323, 0.975444, -1.286555, 1, 0, 0, 1, 1,
-0.1221039, -0.09786768, -1.616081, 1, 0, 0, 1, 1,
-0.1216701, -0.3382063, -0.9050866, 1, 0, 0, 1, 1,
-0.1200646, 0.2211339, -0.1902028, 1, 0, 0, 1, 1,
-0.1189408, -0.02270086, -0.3988681, 0, 0, 0, 1, 1,
-0.115606, 1.828067, -0.3983718, 0, 0, 0, 1, 1,
-0.1103474, 0.5697827, -0.3117226, 0, 0, 0, 1, 1,
-0.1032858, 0.4336273, -2.342352, 0, 0, 0, 1, 1,
-0.1026978, 0.1220038, 0.7390112, 0, 0, 0, 1, 1,
-0.1025046, -1.57312, -2.61252, 0, 0, 0, 1, 1,
-0.1002704, -0.521475, -3.333568, 0, 0, 0, 1, 1,
-0.08912041, 1.026607, 1.632976, 1, 1, 1, 1, 1,
-0.08831545, -1.223337, -1.876318, 1, 1, 1, 1, 1,
-0.0870111, 0.7628754, -0.5196248, 1, 1, 1, 1, 1,
-0.08583482, -1.426743, -2.932144, 1, 1, 1, 1, 1,
-0.08568238, 2.232393, -0.639044, 1, 1, 1, 1, 1,
-0.08495224, 0.8946725, 1.305148, 1, 1, 1, 1, 1,
-0.07985876, -0.6182059, -2.552399, 1, 1, 1, 1, 1,
-0.07424135, -0.4101575, -2.42332, 1, 1, 1, 1, 1,
-0.06785762, -0.9859418, -4.598019, 1, 1, 1, 1, 1,
-0.06771673, 0.4244969, 0.2159614, 1, 1, 1, 1, 1,
-0.06670418, -0.2417223, -1.811581, 1, 1, 1, 1, 1,
-0.06359922, -0.8288744, -3.054337, 1, 1, 1, 1, 1,
-0.06345434, -0.6569558, -2.856308, 1, 1, 1, 1, 1,
-0.06015344, 0.6827816, -0.04179092, 1, 1, 1, 1, 1,
-0.05852942, 0.9529402, -1.055934, 1, 1, 1, 1, 1,
-0.05796807, 0.8380775, 0.6268317, 0, 0, 1, 1, 1,
-0.05521585, 0.9416125, 0.01071911, 1, 0, 0, 1, 1,
-0.05405923, 1.290871, 1.259591, 1, 0, 0, 1, 1,
-0.04613522, -1.145435, -3.346397, 1, 0, 0, 1, 1,
-0.04579371, -0.7221383, -1.4359, 1, 0, 0, 1, 1,
-0.03919357, 0.8246236, 0.5865376, 1, 0, 0, 1, 1,
-0.03788873, -1.063534, -2.114807, 0, 0, 0, 1, 1,
-0.03669745, -0.1715491, -3.91307, 0, 0, 0, 1, 1,
-0.03328289, 0.7486835, -0.4013691, 0, 0, 0, 1, 1,
-0.02556357, -0.9769652, -3.305571, 0, 0, 0, 1, 1,
-0.02541042, -0.9214865, -1.397638, 0, 0, 0, 1, 1,
-0.02461722, 0.3111527, -0.7793295, 0, 0, 0, 1, 1,
-0.02296946, 0.3324788, 0.1999422, 0, 0, 0, 1, 1,
-0.01798833, 0.1047255, -0.7449847, 1, 1, 1, 1, 1,
-0.01764408, -0.5545354, -4.576632, 1, 1, 1, 1, 1,
-0.01395296, 0.9946164, -0.5360116, 1, 1, 1, 1, 1,
-0.01184055, -1.603339, -4.663494, 1, 1, 1, 1, 1,
-0.01086784, 1.959939, -0.3287403, 1, 1, 1, 1, 1,
-0.01008962, -1.010262, -3.110721, 1, 1, 1, 1, 1,
-0.009279778, -1.89244, -3.76398, 1, 1, 1, 1, 1,
-0.008693046, 1.627004, 0.8445887, 1, 1, 1, 1, 1,
-0.00822212, 0.8046641, 0.3711983, 1, 1, 1, 1, 1,
-0.003009313, 1.316174, -0.3545988, 1, 1, 1, 1, 1,
0.001184049, 0.02729408, -1.047571, 1, 1, 1, 1, 1,
0.002577272, -0.6450308, 4.154488, 1, 1, 1, 1, 1,
0.006191546, 0.3014512, 0.9949036, 1, 1, 1, 1, 1,
0.007449758, -0.9620489, 2.907493, 1, 1, 1, 1, 1,
0.01133758, 0.191314, 0.2712664, 1, 1, 1, 1, 1,
0.01367975, 0.01607624, 0.9765592, 0, 0, 1, 1, 1,
0.01529509, -1.360314, 4.183516, 1, 0, 0, 1, 1,
0.02192101, -0.3611137, 2.863694, 1, 0, 0, 1, 1,
0.02626033, 1.299521, 0.3855872, 1, 0, 0, 1, 1,
0.03106384, -1.915935, 2.3662, 1, 0, 0, 1, 1,
0.03249851, 1.260073, -0.5917569, 1, 0, 0, 1, 1,
0.0335405, -0.2586815, 3.428465, 0, 0, 0, 1, 1,
0.0343573, 0.01308272, 2.447044, 0, 0, 0, 1, 1,
0.03563562, -1.832804, 1.016268, 0, 0, 0, 1, 1,
0.03943305, 0.3878182, 1.461634, 0, 0, 0, 1, 1,
0.04371119, 0.5516416, -1.099068, 0, 0, 0, 1, 1,
0.04656531, -0.2752203, 3.02888, 0, 0, 0, 1, 1,
0.05095021, 0.2770122, -0.6857187, 0, 0, 0, 1, 1,
0.0532828, -0.08368423, 1.263934, 1, 1, 1, 1, 1,
0.05570931, -1.232569, 2.500224, 1, 1, 1, 1, 1,
0.05893754, 1.221818, -0.552831, 1, 1, 1, 1, 1,
0.06201905, -1.650742, 2.573201, 1, 1, 1, 1, 1,
0.06798571, 0.1610803, -0.4519424, 1, 1, 1, 1, 1,
0.06897629, 1.597667, -0.1754706, 1, 1, 1, 1, 1,
0.07126205, 0.1724216, 0.1955092, 1, 1, 1, 1, 1,
0.07186982, -0.521135, 3.720281, 1, 1, 1, 1, 1,
0.07515232, -1.331251, 3.614763, 1, 1, 1, 1, 1,
0.08015092, -0.5424243, 1.263965, 1, 1, 1, 1, 1,
0.082091, -2.197478, 4.886357, 1, 1, 1, 1, 1,
0.08438232, 0.5863584, 2.573544, 1, 1, 1, 1, 1,
0.09002136, -1.17098, 4.686662, 1, 1, 1, 1, 1,
0.09050152, 0.807286, -0.4021149, 1, 1, 1, 1, 1,
0.09668276, 0.4212849, -1.40605, 1, 1, 1, 1, 1,
0.09852561, 0.6734399, -1.798066, 0, 0, 1, 1, 1,
0.1011528, -0.1999819, 1.832604, 1, 0, 0, 1, 1,
0.105628, 0.492691, -0.2130118, 1, 0, 0, 1, 1,
0.1121382, -1.731076, 1.803311, 1, 0, 0, 1, 1,
0.1142369, 0.9789322, 0.2146421, 1, 0, 0, 1, 1,
0.1229446, -0.05913219, 2.472518, 1, 0, 0, 1, 1,
0.1248452, 0.9011825, 1.063439, 0, 0, 0, 1, 1,
0.1336705, 0.02167682, 1.680586, 0, 0, 0, 1, 1,
0.1391001, 0.1137621, 2.216087, 0, 0, 0, 1, 1,
0.1394628, -1.574536, 4.217957, 0, 0, 0, 1, 1,
0.1402644, -0.3521527, 3.02582, 0, 0, 0, 1, 1,
0.1414592, -0.5133274, 2.756471, 0, 0, 0, 1, 1,
0.1455284, -0.5808238, 3.460841, 0, 0, 0, 1, 1,
0.1472051, -1.404732, 2.591497, 1, 1, 1, 1, 1,
0.1504729, -2.269161, 2.628195, 1, 1, 1, 1, 1,
0.1505056, -1.093748, 3.764996, 1, 1, 1, 1, 1,
0.1530003, 1.075262, 1.401397, 1, 1, 1, 1, 1,
0.1550239, 0.2039611, -0.02155326, 1, 1, 1, 1, 1,
0.1576071, 1.312254, 0.8887492, 1, 1, 1, 1, 1,
0.1633741, 1.410716, 1.21503, 1, 1, 1, 1, 1,
0.1661513, 2.181144, 1.021867, 1, 1, 1, 1, 1,
0.1751157, 1.739198, 0.8765606, 1, 1, 1, 1, 1,
0.1761321, -0.09500334, 1.872716, 1, 1, 1, 1, 1,
0.1777109, -1.5323, 3.322243, 1, 1, 1, 1, 1,
0.1787569, -0.2110554, 2.395517, 1, 1, 1, 1, 1,
0.1795084, 0.1589853, 0.02609129, 1, 1, 1, 1, 1,
0.1820502, -1.355363, 3.760371, 1, 1, 1, 1, 1,
0.1849286, 0.3961356, -0.2076668, 1, 1, 1, 1, 1,
0.1858706, 0.230342, 0.9899871, 0, 0, 1, 1, 1,
0.1868925, -2.549897, 1.637506, 1, 0, 0, 1, 1,
0.1888151, -0.4783847, 4.129637, 1, 0, 0, 1, 1,
0.1891101, 0.2353593, 3.76513, 1, 0, 0, 1, 1,
0.1920426, -1.329831, 5.971838, 1, 0, 0, 1, 1,
0.1937529, -0.1210988, 0.6302613, 1, 0, 0, 1, 1,
0.1961232, 0.7887657, 0.2316798, 0, 0, 0, 1, 1,
0.1996213, -1.402976, 3.544399, 0, 0, 0, 1, 1,
0.2013154, -2.161014, 2.291803, 0, 0, 0, 1, 1,
0.2089301, 1.286257, -0.7471692, 0, 0, 0, 1, 1,
0.209223, 0.8973678, -2.352624, 0, 0, 0, 1, 1,
0.2103826, 0.2564467, 0.3779238, 0, 0, 0, 1, 1,
0.2112281, -2.177541, 3.758006, 0, 0, 0, 1, 1,
0.2125417, 0.2556983, -0.7014579, 1, 1, 1, 1, 1,
0.2141529, -0.7003364, 3.010629, 1, 1, 1, 1, 1,
0.2203654, 0.8899886, -0.7744406, 1, 1, 1, 1, 1,
0.2209844, -0.7025976, 3.071637, 1, 1, 1, 1, 1,
0.2245717, 0.2553434, 1.807987, 1, 1, 1, 1, 1,
0.2275263, -0.6118734, -0.3925993, 1, 1, 1, 1, 1,
0.2283713, 0.2487672, 1.167816, 1, 1, 1, 1, 1,
0.2291423, -1.391218, 1.892356, 1, 1, 1, 1, 1,
0.230405, 1.098949, -0.3943042, 1, 1, 1, 1, 1,
0.2314085, 0.7148002, -0.4051723, 1, 1, 1, 1, 1,
0.2319084, 0.3070049, 0.5764806, 1, 1, 1, 1, 1,
0.234111, 0.1621231, 1.613328, 1, 1, 1, 1, 1,
0.2396566, 1.88286, 0.3330978, 1, 1, 1, 1, 1,
0.2402384, 1.111469, 1.120374, 1, 1, 1, 1, 1,
0.243276, 1.000525, 0.3425896, 1, 1, 1, 1, 1,
0.2450347, 0.9479379, 0.7334098, 0, 0, 1, 1, 1,
0.2470562, 0.4514496, -0.0816942, 1, 0, 0, 1, 1,
0.2472027, -0.820533, 2.648927, 1, 0, 0, 1, 1,
0.2498712, -1.739223, 2.918064, 1, 0, 0, 1, 1,
0.2513399, 0.7147228, -0.2214099, 1, 0, 0, 1, 1,
0.2515037, 0.6255037, 0.1506322, 1, 0, 0, 1, 1,
0.2564435, -1.186088, 3.582269, 0, 0, 0, 1, 1,
0.2633648, 0.09388472, 1.987344, 0, 0, 0, 1, 1,
0.2643345, -1.041191, 1.940006, 0, 0, 0, 1, 1,
0.2795272, -0.2993992, 1.70458, 0, 0, 0, 1, 1,
0.2918042, -1.523061, 3.77011, 0, 0, 0, 1, 1,
0.2920314, -1.232731, 2.09476, 0, 0, 0, 1, 1,
0.2922475, -0.9948999, 3.552948, 0, 0, 0, 1, 1,
0.2957968, 1.971806, 0.3831931, 1, 1, 1, 1, 1,
0.296596, -1.951713, 4.214359, 1, 1, 1, 1, 1,
0.3010871, -1.149047, 2.369333, 1, 1, 1, 1, 1,
0.303377, -0.2641412, 2.470463, 1, 1, 1, 1, 1,
0.304526, -0.4869573, 2.169703, 1, 1, 1, 1, 1,
0.3062295, -1.700044, 4.545172, 1, 1, 1, 1, 1,
0.3080109, -1.098723, 1.618566, 1, 1, 1, 1, 1,
0.3119144, -1.934492, 2.359688, 1, 1, 1, 1, 1,
0.3138331, 2.073677, 1.623619, 1, 1, 1, 1, 1,
0.3173781, -0.1057477, 3.693115, 1, 1, 1, 1, 1,
0.3184585, 1.425311, 0.3203424, 1, 1, 1, 1, 1,
0.3233103, 0.491607, 1.110807, 1, 1, 1, 1, 1,
0.3273719, 1.401503, 0.6128441, 1, 1, 1, 1, 1,
0.3286333, 0.1939212, 1.829395, 1, 1, 1, 1, 1,
0.3300232, -1.05423, 3.593286, 1, 1, 1, 1, 1,
0.3331876, -0.6801403, 3.29662, 0, 0, 1, 1, 1,
0.3354883, 0.9231568, 0.8294056, 1, 0, 0, 1, 1,
0.3384193, -0.5880814, 2.32904, 1, 0, 0, 1, 1,
0.3400248, -0.4261042, 2.245066, 1, 0, 0, 1, 1,
0.3413945, -1.031192, 1.166992, 1, 0, 0, 1, 1,
0.3425615, 1.903142, 0.6303314, 1, 0, 0, 1, 1,
0.3441628, -1.460697, 5.037667, 0, 0, 0, 1, 1,
0.3478241, 0.3366948, 0.401077, 0, 0, 0, 1, 1,
0.3507542, 1.004739, 1.090654, 0, 0, 0, 1, 1,
0.3517096, -2.530703, 2.840996, 0, 0, 0, 1, 1,
0.3539123, 0.3888102, -0.06033017, 0, 0, 0, 1, 1,
0.3542323, -0.6239449, 3.331064, 0, 0, 0, 1, 1,
0.3601037, -0.2428869, 1.313589, 0, 0, 0, 1, 1,
0.3628918, 1.127352, 0.7001145, 1, 1, 1, 1, 1,
0.3631937, -1.565506, 2.667807, 1, 1, 1, 1, 1,
0.3670287, -0.2152713, 2.661334, 1, 1, 1, 1, 1,
0.3725773, 1.572143, 0.4066554, 1, 1, 1, 1, 1,
0.377343, 0.04126567, 1.745167, 1, 1, 1, 1, 1,
0.379595, -0.7591026, 4.3086, 1, 1, 1, 1, 1,
0.3804396, -0.8232499, 1.592806, 1, 1, 1, 1, 1,
0.3823652, 3.411433, 1.496025, 1, 1, 1, 1, 1,
0.3859675, -0.5096068, 3.853993, 1, 1, 1, 1, 1,
0.3880297, 1.061167, 0.2163534, 1, 1, 1, 1, 1,
0.3905241, 0.008375048, 2.380957, 1, 1, 1, 1, 1,
0.3910132, 0.264885, -0.634097, 1, 1, 1, 1, 1,
0.3934948, -0.02759834, 0.7991465, 1, 1, 1, 1, 1,
0.3968137, -0.0613128, 2.50773, 1, 1, 1, 1, 1,
0.3973353, 0.3777601, 1.185555, 1, 1, 1, 1, 1,
0.4011613, 0.12534, 0.9107733, 0, 0, 1, 1, 1,
0.4121323, -0.9474886, 3.860486, 1, 0, 0, 1, 1,
0.4145128, 0.8479524, 1.316839, 1, 0, 0, 1, 1,
0.4148237, -0.9054348, 2.693769, 1, 0, 0, 1, 1,
0.4166249, 0.2250922, 1.937717, 1, 0, 0, 1, 1,
0.4171526, 0.7508078, 2.451716, 1, 0, 0, 1, 1,
0.4175465, 0.5758218, 0.954186, 0, 0, 0, 1, 1,
0.4181089, 0.2911939, -0.1631371, 0, 0, 0, 1, 1,
0.4220224, -1.396261, 2.229838, 0, 0, 0, 1, 1,
0.4238805, 0.4288823, 1.43079, 0, 0, 0, 1, 1,
0.4271511, 2.071028, 0.04030582, 0, 0, 0, 1, 1,
0.4287009, 0.5855, 2.391249, 0, 0, 0, 1, 1,
0.4306712, 0.9227359, 0.7706532, 0, 0, 0, 1, 1,
0.4320817, -1.877688, 2.411791, 1, 1, 1, 1, 1,
0.4365282, 1.300669, 0.65909, 1, 1, 1, 1, 1,
0.4393216, -0.2344609, 1.124809, 1, 1, 1, 1, 1,
0.4416103, 1.420994, -1.597651, 1, 1, 1, 1, 1,
0.4464101, 0.6315717, 1.7043, 1, 1, 1, 1, 1,
0.4467643, 0.4153046, 0.8374942, 1, 1, 1, 1, 1,
0.4481433, 0.634823, 0.7149335, 1, 1, 1, 1, 1,
0.4520396, -0.8658456, 3.134611, 1, 1, 1, 1, 1,
0.4550132, -1.506947, 4.531593, 1, 1, 1, 1, 1,
0.4562351, -0.08207142, 0.6214204, 1, 1, 1, 1, 1,
0.4588966, 0.5097478, -0.96917, 1, 1, 1, 1, 1,
0.4623857, 0.8783082, 0.8536496, 1, 1, 1, 1, 1,
0.4654471, -0.1957083, 2.70767, 1, 1, 1, 1, 1,
0.4794046, 1.591848, 0.1121528, 1, 1, 1, 1, 1,
0.4810788, 0.4654731, 0.5603406, 1, 1, 1, 1, 1,
0.4814714, -1.009199, 4.267962, 0, 0, 1, 1, 1,
0.4818312, 0.4588894, -1.801636, 1, 0, 0, 1, 1,
0.4838527, 0.6673748, 2.374339, 1, 0, 0, 1, 1,
0.4856453, -2.206886, 3.508165, 1, 0, 0, 1, 1,
0.486968, 0.4202718, 0.5893854, 1, 0, 0, 1, 1,
0.4882702, 1.302611, 0.8989957, 1, 0, 0, 1, 1,
0.4962034, -0.7164131, 1.976842, 0, 0, 0, 1, 1,
0.4976377, -0.4293812, 2.350809, 0, 0, 0, 1, 1,
0.498057, 0.1277696, 2.027072, 0, 0, 0, 1, 1,
0.4988885, 0.4090759, 2.95369, 0, 0, 0, 1, 1,
0.5006046, 0.9201867, -1.466528, 0, 0, 0, 1, 1,
0.5059061, 0.02034463, 0.2014196, 0, 0, 0, 1, 1,
0.506535, 0.01038959, 0.3910772, 0, 0, 0, 1, 1,
0.5122606, 0.6878886, 0.008896238, 1, 1, 1, 1, 1,
0.5122807, -1.086146, 1.020458, 1, 1, 1, 1, 1,
0.514389, 0.9291635, 1.912128, 1, 1, 1, 1, 1,
0.5195459, -0.009033938, 1.962127, 1, 1, 1, 1, 1,
0.5209246, -0.2296191, 1.636132, 1, 1, 1, 1, 1,
0.5252486, 0.5980284, -0.9581503, 1, 1, 1, 1, 1,
0.5326748, -0.4759829, 3.050889, 1, 1, 1, 1, 1,
0.532961, 0.4266869, 1.525577, 1, 1, 1, 1, 1,
0.534556, -0.4419619, 2.826706, 1, 1, 1, 1, 1,
0.5389165, -0.7673543, 2.716607, 1, 1, 1, 1, 1,
0.5455332, -0.3926198, 0.9948439, 1, 1, 1, 1, 1,
0.5482429, 0.75582, -0.02976782, 1, 1, 1, 1, 1,
0.5524936, -0.1752473, -0.249028, 1, 1, 1, 1, 1,
0.5542705, 0.1915109, 1.590386, 1, 1, 1, 1, 1,
0.5568393, -0.4345472, 2.117696, 1, 1, 1, 1, 1,
0.5578875, -2.703503, 3.401091, 0, 0, 1, 1, 1,
0.5605178, 0.3619906, 0.193036, 1, 0, 0, 1, 1,
0.5615082, -0.6578361, 2.168479, 1, 0, 0, 1, 1,
0.5619104, 0.929558, 0.9765704, 1, 0, 0, 1, 1,
0.5641507, 0.463875, 1.43774, 1, 0, 0, 1, 1,
0.5642694, 0.04164851, 2.053386, 1, 0, 0, 1, 1,
0.5704545, 0.1088512, 0.6440822, 0, 0, 0, 1, 1,
0.5724613, -1.227386, 3.355316, 0, 0, 0, 1, 1,
0.5746272, 0.863493, 0.6630731, 0, 0, 0, 1, 1,
0.5784493, -2.021919, 2.559252, 0, 0, 0, 1, 1,
0.580044, 1.276316, 0.5294992, 0, 0, 0, 1, 1,
0.580117, -1.214378, 2.769451, 0, 0, 0, 1, 1,
0.5805, 1.378028, 1.55287, 0, 0, 0, 1, 1,
0.5823973, -0.6325798, 4.909964, 1, 1, 1, 1, 1,
0.5854918, -2.002068, 3.755345, 1, 1, 1, 1, 1,
0.5876348, 0.2450949, 0.6619932, 1, 1, 1, 1, 1,
0.5878873, 1.232769, -0.5215525, 1, 1, 1, 1, 1,
0.5881184, 0.8990241, 0.6265779, 1, 1, 1, 1, 1,
0.5919974, 0.2409722, 2.150267, 1, 1, 1, 1, 1,
0.5933755, 1.255087, 1.020091, 1, 1, 1, 1, 1,
0.5970765, 1.653166, 0.2087784, 1, 1, 1, 1, 1,
0.6041142, -0.6680627, 1.704345, 1, 1, 1, 1, 1,
0.6091735, -0.6757177, 2.555058, 1, 1, 1, 1, 1,
0.6122618, 0.3591861, 1.267566, 1, 1, 1, 1, 1,
0.616746, 1.440652, -0.6524331, 1, 1, 1, 1, 1,
0.6194553, -1.669361, 3.584181, 1, 1, 1, 1, 1,
0.6227437, -0.6237746, 2.177713, 1, 1, 1, 1, 1,
0.6304969, -0.06067998, 1.565898, 1, 1, 1, 1, 1,
0.6307176, 0.08961245, 0.6746992, 0, 0, 1, 1, 1,
0.6309107, 0.2403274, 1.904524, 1, 0, 0, 1, 1,
0.6487574, 0.1422442, -0.2718767, 1, 0, 0, 1, 1,
0.6561115, 1.266502, 0.6605651, 1, 0, 0, 1, 1,
0.658136, 0.1979852, 1.166314, 1, 0, 0, 1, 1,
0.6593617, 1.127248, -0.6964562, 1, 0, 0, 1, 1,
0.6626741, -0.09684765, 3.508298, 0, 0, 0, 1, 1,
0.6706449, 1.74413, 1.517891, 0, 0, 0, 1, 1,
0.6735824, 0.02262355, 1.566536, 0, 0, 0, 1, 1,
0.6749942, 2.911674, 1.485353, 0, 0, 0, 1, 1,
0.6817253, 0.8371983, -0.2679802, 0, 0, 0, 1, 1,
0.6940461, -0.3480843, 2.19406, 0, 0, 0, 1, 1,
0.6993791, 0.08106688, 0.6782082, 0, 0, 0, 1, 1,
0.7000856, -0.2613973, 1.151634, 1, 1, 1, 1, 1,
0.7048531, 0.5285624, 2.467945, 1, 1, 1, 1, 1,
0.7077468, 0.3256564, -2.283985, 1, 1, 1, 1, 1,
0.7084585, 1.958184, 1.678962, 1, 1, 1, 1, 1,
0.7121763, -0.3497738, 3.181256, 1, 1, 1, 1, 1,
0.7163922, -0.1660061, 0.7598661, 1, 1, 1, 1, 1,
0.7172191, 0.1567023, 3.445637, 1, 1, 1, 1, 1,
0.7197618, -0.006143778, 2.805346, 1, 1, 1, 1, 1,
0.7209637, -0.4678598, 3.350059, 1, 1, 1, 1, 1,
0.7220387, -0.4840098, 4.053384, 1, 1, 1, 1, 1,
0.7251148, -1.046536, 3.591654, 1, 1, 1, 1, 1,
0.7266387, 0.1780109, -0.7983039, 1, 1, 1, 1, 1,
0.7299988, -0.8460268, 2.864288, 1, 1, 1, 1, 1,
0.7309041, 0.4735341, 0.1869597, 1, 1, 1, 1, 1,
0.7353396, 0.0684813, -0.286529, 1, 1, 1, 1, 1,
0.7359244, -1.442602, 3.897336, 0, 0, 1, 1, 1,
0.7408335, -0.8729244, 1.692141, 1, 0, 0, 1, 1,
0.7434147, -1.737926, 2.83763, 1, 0, 0, 1, 1,
0.7443824, -1.082017, 1.058247, 1, 0, 0, 1, 1,
0.7465214, 1.480378, 0.13319, 1, 0, 0, 1, 1,
0.7467949, 1.41635, -0.9860189, 1, 0, 0, 1, 1,
0.7530016, 0.512747, 0.1090801, 0, 0, 0, 1, 1,
0.7532886, -0.1560123, 1.81063, 0, 0, 0, 1, 1,
0.7561394, -4.336769, 4.924036, 0, 0, 0, 1, 1,
0.7571523, 0.8491204, 1.063826, 0, 0, 0, 1, 1,
0.7577569, -0.04299937, 0.8320049, 0, 0, 0, 1, 1,
0.7589427, -0.1319753, 2.891553, 0, 0, 0, 1, 1,
0.7628301, -1.73244, 4.0035, 0, 0, 0, 1, 1,
0.7708888, -1.185739, 2.25802, 1, 1, 1, 1, 1,
0.7754472, 0.1301309, 0.6048088, 1, 1, 1, 1, 1,
0.7765594, 0.08320455, 0.1109686, 1, 1, 1, 1, 1,
0.7901217, 1.367319, 0.01477491, 1, 1, 1, 1, 1,
0.7991546, -0.9033878, 1.836081, 1, 1, 1, 1, 1,
0.8007733, -0.2957257, 1.649699, 1, 1, 1, 1, 1,
0.8024259, 0.1420313, 3.377731, 1, 1, 1, 1, 1,
0.8038017, 0.2000569, 1.266055, 1, 1, 1, 1, 1,
0.8128312, -2.156643, 2.896905, 1, 1, 1, 1, 1,
0.8132291, 1.261768, -0.3160852, 1, 1, 1, 1, 1,
0.8149516, -2.398698, 2.566513, 1, 1, 1, 1, 1,
0.8181449, -1.097037, 4.073342, 1, 1, 1, 1, 1,
0.8205823, 1.320236, 0.7389799, 1, 1, 1, 1, 1,
0.8207713, 2.55662, 0.1397686, 1, 1, 1, 1, 1,
0.822984, 1.026371, -0.1037101, 1, 1, 1, 1, 1,
0.8262825, 1.541507, 0.8970518, 0, 0, 1, 1, 1,
0.8312007, 0.6841317, 1.09482, 1, 0, 0, 1, 1,
0.8317581, 0.6145508, 2.450274, 1, 0, 0, 1, 1,
0.8325979, -0.5019717, 3.164729, 1, 0, 0, 1, 1,
0.8329672, -1.509015, 2.925822, 1, 0, 0, 1, 1,
0.8378282, -0.6043082, 3.44591, 1, 0, 0, 1, 1,
0.8466853, 0.5001082, 0.6536742, 0, 0, 0, 1, 1,
0.8568887, -1.425046, 2.880511, 0, 0, 0, 1, 1,
0.8591987, 0.5337062, 1.948447, 0, 0, 0, 1, 1,
0.8597801, 0.08006016, 2.084211, 0, 0, 0, 1, 1,
0.8679384, 2.322314, 1.252516, 0, 0, 0, 1, 1,
0.8712427, 1.124665, 1.13804, 0, 0, 0, 1, 1,
0.8783087, -1.31795, 1.109282, 0, 0, 0, 1, 1,
0.8838866, -1.749332, 3.236804, 1, 1, 1, 1, 1,
0.8911132, 0.571514, 0.4846863, 1, 1, 1, 1, 1,
0.8912361, 0.9316052, 1.001202, 1, 1, 1, 1, 1,
0.8969669, 0.4475744, 1.094486, 1, 1, 1, 1, 1,
0.9133392, 0.724058, 1.178807, 1, 1, 1, 1, 1,
0.9134787, -0.8601549, 3.487564, 1, 1, 1, 1, 1,
0.934414, 0.41364, 0.6358676, 1, 1, 1, 1, 1,
0.9364049, -1.873283, 2.522336, 1, 1, 1, 1, 1,
0.9426396, -0.8633605, 2.361151, 1, 1, 1, 1, 1,
0.9438653, -1.45787, 3.400743, 1, 1, 1, 1, 1,
0.9477293, -0.7832823, 2.611759, 1, 1, 1, 1, 1,
0.9515123, -2.24662, 2.893885, 1, 1, 1, 1, 1,
0.9539094, 0.3278761, 1.854518, 1, 1, 1, 1, 1,
0.9545385, -0.2571966, 1.305174, 1, 1, 1, 1, 1,
0.9552258, -1.606145, 5.54921, 1, 1, 1, 1, 1,
0.9581199, 0.9387823, 0.246207, 0, 0, 1, 1, 1,
0.959331, 0.2869695, -0.3202987, 1, 0, 0, 1, 1,
0.9660094, -0.1565359, 1.050373, 1, 0, 0, 1, 1,
0.973533, -0.224361, 2.055423, 1, 0, 0, 1, 1,
0.9743163, -0.7560929, 1.971522, 1, 0, 0, 1, 1,
0.9783623, -0.5814129, 2.972198, 1, 0, 0, 1, 1,
0.9791229, -0.2633201, 0.8550854, 0, 0, 0, 1, 1,
0.9811435, 1.814594, 0.4593229, 0, 0, 0, 1, 1,
0.9857292, -0.1702619, 2.402207, 0, 0, 0, 1, 1,
0.9922211, 1.071538, 2.483844, 0, 0, 0, 1, 1,
0.9936602, -0.622897, 3.088933, 0, 0, 0, 1, 1,
0.994553, -2.047615, 1.133732, 0, 0, 0, 1, 1,
1.007086, 2.533238, -0.3489093, 0, 0, 0, 1, 1,
1.007435, -0.9622533, 2.419497, 1, 1, 1, 1, 1,
1.013629, 0.4362435, 2.070413, 1, 1, 1, 1, 1,
1.018883, 1.155719, 0.5166457, 1, 1, 1, 1, 1,
1.021303, 0.1025268, 0.184894, 1, 1, 1, 1, 1,
1.021822, 1.266968, 0.8205672, 1, 1, 1, 1, 1,
1.032098, -1.064298, 1.784939, 1, 1, 1, 1, 1,
1.035114, -0.7325857, 1.912967, 1, 1, 1, 1, 1,
1.039647, -0.07673438, 1.256032, 1, 1, 1, 1, 1,
1.043514, -2.344401, 2.961463, 1, 1, 1, 1, 1,
1.044898, 0.5905848, 2.041308, 1, 1, 1, 1, 1,
1.045424, 0.574056, 1.996105, 1, 1, 1, 1, 1,
1.049503, -1.044591, 1.891981, 1, 1, 1, 1, 1,
1.049585, -0.06573287, 1.017973, 1, 1, 1, 1, 1,
1.053055, 0.5079284, 2.143789, 1, 1, 1, 1, 1,
1.057307, -0.2522641, 2.264315, 1, 1, 1, 1, 1,
1.059014, 1.029403, -0.6682475, 0, 0, 1, 1, 1,
1.074016, -0.03007024, -0.3143372, 1, 0, 0, 1, 1,
1.075795, 0.08254884, 3.773134, 1, 0, 0, 1, 1,
1.081154, 1.409821, 1.312462, 1, 0, 0, 1, 1,
1.081401, -0.6919988, 1.439162, 1, 0, 0, 1, 1,
1.082773, 0.5594975, 1.299801, 1, 0, 0, 1, 1,
1.085868, -0.5738911, 2.425986, 0, 0, 0, 1, 1,
1.086273, 0.5871752, -0.05059107, 0, 0, 0, 1, 1,
1.08997, -1.048947, 1.452987, 0, 0, 0, 1, 1,
1.094217, -0.009900914, 1.866809, 0, 0, 0, 1, 1,
1.094625, -1.552302, 2.567065, 0, 0, 0, 1, 1,
1.099973, 0.6529486, 0.7169105, 0, 0, 0, 1, 1,
1.101201, -0.1267309, 1.856776, 0, 0, 0, 1, 1,
1.106331, 0.01780544, 1.472645, 1, 1, 1, 1, 1,
1.107648, -0.1084753, -0.5510978, 1, 1, 1, 1, 1,
1.109793, 0.9530438, 0.2140513, 1, 1, 1, 1, 1,
1.112092, 0.02392141, 2.416844, 1, 1, 1, 1, 1,
1.112633, -0.04635956, 1.903417, 1, 1, 1, 1, 1,
1.118125, -0.3021143, 3.194902, 1, 1, 1, 1, 1,
1.119173, -1.63831, 1.936431, 1, 1, 1, 1, 1,
1.122023, 2.526291, 1.112109, 1, 1, 1, 1, 1,
1.123103, -0.2890335, 2.541376, 1, 1, 1, 1, 1,
1.125153, -0.828721, 1.214568, 1, 1, 1, 1, 1,
1.134223, 1.709804, -0.2661819, 1, 1, 1, 1, 1,
1.139241, -1.719615, 3.526829, 1, 1, 1, 1, 1,
1.141201, -1.231445, 2.255157, 1, 1, 1, 1, 1,
1.14757, -0.1767394, 1.55517, 1, 1, 1, 1, 1,
1.149866, 0.6066298, 0.3645762, 1, 1, 1, 1, 1,
1.160021, 0.3160523, 2.017507, 0, 0, 1, 1, 1,
1.164249, -0.1675555, 2.299539, 1, 0, 0, 1, 1,
1.164446, 0.01042794, 1.120641, 1, 0, 0, 1, 1,
1.164894, -0.04538564, 1.91425, 1, 0, 0, 1, 1,
1.165886, 0.8895193, 1.119251, 1, 0, 0, 1, 1,
1.166587, 0.674907, 2.258363, 1, 0, 0, 1, 1,
1.174579, -1.256658, 2.485548, 0, 0, 0, 1, 1,
1.183402, -1.416803, 2.094962, 0, 0, 0, 1, 1,
1.183565, 1.196925, -0.4518181, 0, 0, 0, 1, 1,
1.187449, -0.2023256, 2.472798, 0, 0, 0, 1, 1,
1.190099, 1.007296, 2.162525, 0, 0, 0, 1, 1,
1.20053, -0.8260197, 3.208002, 0, 0, 0, 1, 1,
1.200591, 1.307816, 2.334743, 0, 0, 0, 1, 1,
1.20212, -0.03181586, 1.250886, 1, 1, 1, 1, 1,
1.215721, -0.01073681, 3.529926, 1, 1, 1, 1, 1,
1.216869, -0.7751665, 3.56326, 1, 1, 1, 1, 1,
1.226718, -0.2535848, 2.174778, 1, 1, 1, 1, 1,
1.226735, -1.618813, 1.73903, 1, 1, 1, 1, 1,
1.229695, 0.2521187, 1.705376, 1, 1, 1, 1, 1,
1.231604, -1.128426, 1.056342, 1, 1, 1, 1, 1,
1.249144, 0.307139, 1.203717, 1, 1, 1, 1, 1,
1.254931, -0.3268819, 1.323347, 1, 1, 1, 1, 1,
1.256142, 1.559116, 0.6936638, 1, 1, 1, 1, 1,
1.261467, -0.303671, 3.779727, 1, 1, 1, 1, 1,
1.265516, -0.214279, 1.544964, 1, 1, 1, 1, 1,
1.267901, 0.2926869, 0.6216089, 1, 1, 1, 1, 1,
1.271935, -0.7915748, 2.124771, 1, 1, 1, 1, 1,
1.274124, 0.134702, 1.811223, 1, 1, 1, 1, 1,
1.283806, 0.8949209, -0.2868755, 0, 0, 1, 1, 1,
1.30144, 2.253946, 0.5363044, 1, 0, 0, 1, 1,
1.309314, 0.2938787, 1.334621, 1, 0, 0, 1, 1,
1.310566, -0.05694069, 2.080882, 1, 0, 0, 1, 1,
1.31492, 0.1353672, 1.485829, 1, 0, 0, 1, 1,
1.320334, 0.1585358, 2.002557, 1, 0, 0, 1, 1,
1.320602, -0.6618874, 2.708356, 0, 0, 0, 1, 1,
1.322071, 2.113798, 0.1976274, 0, 0, 0, 1, 1,
1.326063, 0.398322, 1.298123, 0, 0, 0, 1, 1,
1.327843, -0.5266004, 1.953156, 0, 0, 0, 1, 1,
1.329573, -0.8236516, 1.898018, 0, 0, 0, 1, 1,
1.333166, 0.345449, 1.204518, 0, 0, 0, 1, 1,
1.337137, 0.7053593, 0.3133625, 0, 0, 0, 1, 1,
1.343388, 2.044373, 4.189291, 1, 1, 1, 1, 1,
1.352373, 0.1302432, 1.646759, 1, 1, 1, 1, 1,
1.363286, 0.4399265, 2.941503, 1, 1, 1, 1, 1,
1.377058, -0.7610617, 1.925638, 1, 1, 1, 1, 1,
1.39028, 0.7147603, 0.5801164, 1, 1, 1, 1, 1,
1.391662, 0.06113573, 2.578938, 1, 1, 1, 1, 1,
1.392137, 0.6242661, -0.9456918, 1, 1, 1, 1, 1,
1.397639, 0.4948888, 1.107131, 1, 1, 1, 1, 1,
1.400024, 0.7100912, 1.216966, 1, 1, 1, 1, 1,
1.412884, -0.7202239, 1.762539, 1, 1, 1, 1, 1,
1.413329, -1.165467, 2.093449, 1, 1, 1, 1, 1,
1.418364, -0.3440407, 0.3308407, 1, 1, 1, 1, 1,
1.419167, -0.5986719, 2.552417, 1, 1, 1, 1, 1,
1.421287, -0.6995882, 0.5282945, 1, 1, 1, 1, 1,
1.423913, -0.533906, 3.345178, 1, 1, 1, 1, 1,
1.445883, -0.02325761, 3.419397, 0, 0, 1, 1, 1,
1.456722, 0.415265, 0.3189145, 1, 0, 0, 1, 1,
1.463083, -0.5825716, 1.716626, 1, 0, 0, 1, 1,
1.468872, 0.4990905, 2.807727, 1, 0, 0, 1, 1,
1.472489, -0.05300906, 2.596917, 1, 0, 0, 1, 1,
1.47883, -0.1501084, 1.091659, 1, 0, 0, 1, 1,
1.485023, 0.4109402, 1.382419, 0, 0, 0, 1, 1,
1.486088, 0.92531, 1.527732, 0, 0, 0, 1, 1,
1.49021, -0.601259, 2.640862, 0, 0, 0, 1, 1,
1.499647, -0.04191743, 1.693504, 0, 0, 0, 1, 1,
1.507126, -0.8172972, 0.3687516, 0, 0, 0, 1, 1,
1.507648, -1.347568, 3.226387, 0, 0, 0, 1, 1,
1.517426, 1.176408, 0.9892181, 0, 0, 0, 1, 1,
1.525054, 0.9950883, 1.459349, 1, 1, 1, 1, 1,
1.526745, -0.5855615, 0.2964918, 1, 1, 1, 1, 1,
1.53378, -0.4724407, 2.953758, 1, 1, 1, 1, 1,
1.54942, -1.190395, 2.252739, 1, 1, 1, 1, 1,
1.54951, 0.7669325, -0.4968441, 1, 1, 1, 1, 1,
1.554538, 0.4133465, 2.977429, 1, 1, 1, 1, 1,
1.566866, 1.245266, 1.587239, 1, 1, 1, 1, 1,
1.57471, -0.7310952, 1.247387, 1, 1, 1, 1, 1,
1.581771, -0.6626481, 2.082388, 1, 1, 1, 1, 1,
1.597206, -1.612631, 1.169873, 1, 1, 1, 1, 1,
1.609983, 1.100109, 0.01003251, 1, 1, 1, 1, 1,
1.610411, 1.587589, 0.3782534, 1, 1, 1, 1, 1,
1.623741, -0.9291962, 3.317921, 1, 1, 1, 1, 1,
1.631059, 1.058127, -0.296561, 1, 1, 1, 1, 1,
1.66285, -1.258809, 2.254374, 1, 1, 1, 1, 1,
1.6938, -0.4384702, -0.1178929, 0, 0, 1, 1, 1,
1.696479, 1.112574, 0.5013807, 1, 0, 0, 1, 1,
1.716141, 0.2706681, 0.5212176, 1, 0, 0, 1, 1,
1.717998, 0.8097208, 1.113588, 1, 0, 0, 1, 1,
1.726158, -1.364785, 1.368652, 1, 0, 0, 1, 1,
1.734737, -0.5687434, 2.213816, 1, 0, 0, 1, 1,
1.73707, 0.2854773, 1.959167, 0, 0, 0, 1, 1,
1.746314, -0.7482547, 2.872619, 0, 0, 0, 1, 1,
1.755266, -0.7420033, 2.571251, 0, 0, 0, 1, 1,
1.794886, -2.045118, 2.842835, 0, 0, 0, 1, 1,
1.807313, 1.008473, 2.619078, 0, 0, 0, 1, 1,
1.858078, -0.6886365, 2.446352, 0, 0, 0, 1, 1,
1.86386, -1.030192, 2.034839, 0, 0, 0, 1, 1,
1.880096, 0.6282639, 2.704526, 1, 1, 1, 1, 1,
1.884256, 0.7195203, 1.279305, 1, 1, 1, 1, 1,
1.916529, 0.005704444, 2.135908, 1, 1, 1, 1, 1,
1.937009, -0.283482, 1.261131, 1, 1, 1, 1, 1,
1.940556, 0.5565087, 2.847578, 1, 1, 1, 1, 1,
1.943029, 1.345745, 2.538017, 1, 1, 1, 1, 1,
1.953708, 0.08408782, 1.559763, 1, 1, 1, 1, 1,
1.973221, -0.1367568, 0.7093146, 1, 1, 1, 1, 1,
2.009454, -1.503343, -0.4755321, 1, 1, 1, 1, 1,
2.042702, -0.6269717, 0.6653301, 1, 1, 1, 1, 1,
2.07666, 0.2113855, 1.086927, 1, 1, 1, 1, 1,
2.093869, -0.9373475, 3.948901, 1, 1, 1, 1, 1,
2.166411, 1.604699, 0.3389296, 1, 1, 1, 1, 1,
2.180929, 1.502338, 2.265826, 1, 1, 1, 1, 1,
2.184734, -0.4823963, 1.782033, 1, 1, 1, 1, 1,
2.191708, 0.2511666, 3.205697, 0, 0, 1, 1, 1,
2.211533, -1.623823, 2.88145, 1, 0, 0, 1, 1,
2.225744, -0.501047, 1.656001, 1, 0, 0, 1, 1,
2.233997, -0.1530265, 0.9872769, 1, 0, 0, 1, 1,
2.24013, -0.7097385, 2.539001, 1, 0, 0, 1, 1,
2.283487, 0.09001388, 1.695237, 1, 0, 0, 1, 1,
2.294712, 0.2062906, 1.233359, 0, 0, 0, 1, 1,
2.301903, -1.617301, 2.567338, 0, 0, 0, 1, 1,
2.306887, 0.8361738, 2.564163, 0, 0, 0, 1, 1,
2.325225, -0.07107668, 2.958851, 0, 0, 0, 1, 1,
2.333004, -0.06835303, 1.082696, 0, 0, 0, 1, 1,
2.335449, -0.3353351, 1.760809, 0, 0, 0, 1, 1,
2.351016, -1.293739, 2.093042, 0, 0, 0, 1, 1,
2.365788, -0.2757605, 2.064261, 1, 1, 1, 1, 1,
2.399461, -0.8508918, 1.323, 1, 1, 1, 1, 1,
2.472484, 0.4486877, 0.9552724, 1, 1, 1, 1, 1,
2.53259, -1.624571, 2.726018, 1, 1, 1, 1, 1,
2.557924, -0.4565148, 3.259871, 1, 1, 1, 1, 1,
2.641344, 0.6222285, 1.245237, 1, 1, 1, 1, 1,
2.980477, 2.144497, 2.644476, 1, 1, 1, 1, 1
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
var radius = 10.27089;
var distance = 36.07606;
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
mvMatrix.translate( 0.1653029, 0.4626679, -0.1719546 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.07606);
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
