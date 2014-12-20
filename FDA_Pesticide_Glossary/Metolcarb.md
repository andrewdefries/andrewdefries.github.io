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
-3.03616, 0.3722287, -2.093896, 1, 0, 0, 1,
-2.659274, 0.8457515, -3.337547, 1, 0.007843138, 0, 1,
-2.52595, -0.5410175, 0.9115914, 1, 0.01176471, 0, 1,
-2.525726, -1.263397, -1.258609, 1, 0.01960784, 0, 1,
-2.506134, 0.1367997, 0.4101701, 1, 0.02352941, 0, 1,
-2.476641, -0.5824515, -2.126212, 1, 0.03137255, 0, 1,
-2.415939, 0.1985423, -2.982794, 1, 0.03529412, 0, 1,
-2.318135, 1.778102, -0.02637233, 1, 0.04313726, 0, 1,
-2.307545, -1.487743, -2.687571, 1, 0.04705882, 0, 1,
-2.197052, 0.8865343, -1.412903, 1, 0.05490196, 0, 1,
-2.192672, 0.2155743, -3.693112, 1, 0.05882353, 0, 1,
-2.147579, -0.8349764, -0.7844008, 1, 0.06666667, 0, 1,
-2.086204, -0.7649494, -2.272686, 1, 0.07058824, 0, 1,
-2.085351, 1.058071, -0.7848017, 1, 0.07843138, 0, 1,
-2.074619, 0.6033273, -2.102329, 1, 0.08235294, 0, 1,
-2.060227, 0.7343798, 0.1732379, 1, 0.09019608, 0, 1,
-2.039991, 1.381982, -2.716076, 1, 0.09411765, 0, 1,
-2.026239, 1.301094, -1.766762, 1, 0.1019608, 0, 1,
-2.017344, -0.2151809, -1.411805, 1, 0.1098039, 0, 1,
-2.013025, -1.164232, -2.041086, 1, 0.1137255, 0, 1,
-1.984001, -0.9756086, -1.989597, 1, 0.1215686, 0, 1,
-1.978965, 0.6121771, 0.4436444, 1, 0.1254902, 0, 1,
-1.956191, -0.5094928, -1.796209, 1, 0.1333333, 0, 1,
-1.955118, -0.1181723, -3.690371, 1, 0.1372549, 0, 1,
-1.942978, 2.654873, -1.578914, 1, 0.145098, 0, 1,
-1.934079, -1.453711, -1.536441, 1, 0.1490196, 0, 1,
-1.915253, 0.4485713, -2.30368, 1, 0.1568628, 0, 1,
-1.906447, 0.06514972, -1.227886, 1, 0.1607843, 0, 1,
-1.900191, 0.08392555, -2.339927, 1, 0.1686275, 0, 1,
-1.895237, -0.7853475, -4.747514, 1, 0.172549, 0, 1,
-1.887057, -0.6138068, -2.353481, 1, 0.1803922, 0, 1,
-1.874449, 0.1752396, -2.10575, 1, 0.1843137, 0, 1,
-1.861189, 1.067134, -0.812212, 1, 0.1921569, 0, 1,
-1.855993, -2.20796, -1.59336, 1, 0.1960784, 0, 1,
-1.844806, 0.2217726, -2.816004, 1, 0.2039216, 0, 1,
-1.814118, -0.1347343, -0.2517478, 1, 0.2117647, 0, 1,
-1.811378, 0.9629944, -0.7439829, 1, 0.2156863, 0, 1,
-1.803174, 0.3376232, -2.390995, 1, 0.2235294, 0, 1,
-1.795667, 1.069357, -1.317133, 1, 0.227451, 0, 1,
-1.770524, -1.960667, -2.988453, 1, 0.2352941, 0, 1,
-1.770183, -0.3770638, -3.630605, 1, 0.2392157, 0, 1,
-1.762051, -0.2545896, -0.1917076, 1, 0.2470588, 0, 1,
-1.725617, -0.5593973, -1.31793, 1, 0.2509804, 0, 1,
-1.71806, 0.4552826, -1.229908, 1, 0.2588235, 0, 1,
-1.714463, -0.3735584, -1.619627, 1, 0.2627451, 0, 1,
-1.705769, -0.3235303, 0.4282158, 1, 0.2705882, 0, 1,
-1.672603, -0.1233904, -2.135643, 1, 0.2745098, 0, 1,
-1.671955, 1.28685, -0.9380136, 1, 0.282353, 0, 1,
-1.629365, -0.4664669, -0.9868417, 1, 0.2862745, 0, 1,
-1.606354, 0.19049, -1.996656, 1, 0.2941177, 0, 1,
-1.602615, -0.02029551, -2.701559, 1, 0.3019608, 0, 1,
-1.599863, -0.9491158, -2.580484, 1, 0.3058824, 0, 1,
-1.586873, -0.9590539, -1.175958, 1, 0.3137255, 0, 1,
-1.582987, -0.4648697, -0.7033991, 1, 0.3176471, 0, 1,
-1.562532, 1.335554, 0.2588972, 1, 0.3254902, 0, 1,
-1.561026, -0.006822526, -2.41069, 1, 0.3294118, 0, 1,
-1.555271, 0.713358, -2.804114, 1, 0.3372549, 0, 1,
-1.550168, -1.07954, -2.076563, 1, 0.3411765, 0, 1,
-1.538191, -1.24157, -2.956124, 1, 0.3490196, 0, 1,
-1.525501, -0.03300838, -2.082864, 1, 0.3529412, 0, 1,
-1.497082, -0.9625069, -2.266961, 1, 0.3607843, 0, 1,
-1.48751, -1.362699, -2.687429, 1, 0.3647059, 0, 1,
-1.479338, -2.659237, -3.080533, 1, 0.372549, 0, 1,
-1.47651, 0.3028733, -1.79169, 1, 0.3764706, 0, 1,
-1.461585, 0.8761196, 0.5881256, 1, 0.3843137, 0, 1,
-1.448266, 1.151085, 0.06948616, 1, 0.3882353, 0, 1,
-1.445303, -0.7403455, -0.6673697, 1, 0.3960784, 0, 1,
-1.438385, -0.8686669, -2.018066, 1, 0.4039216, 0, 1,
-1.431335, -0.9034143, -2.248163, 1, 0.4078431, 0, 1,
-1.423321, 0.9728948, -1.497021, 1, 0.4156863, 0, 1,
-1.422267, -0.728453, -1.518597, 1, 0.4196078, 0, 1,
-1.412765, 0.6364976, -0.9850579, 1, 0.427451, 0, 1,
-1.410519, 0.2338601, -0.5018143, 1, 0.4313726, 0, 1,
-1.409422, 0.3727226, -1.390859, 1, 0.4392157, 0, 1,
-1.3967, -0.7599787, -2.693302, 1, 0.4431373, 0, 1,
-1.396551, -0.5180898, -2.668763, 1, 0.4509804, 0, 1,
-1.394328, -0.6955349, -1.866201, 1, 0.454902, 0, 1,
-1.38485, 1.001901, -1.092784, 1, 0.4627451, 0, 1,
-1.383626, 0.8797101, -0.138804, 1, 0.4666667, 0, 1,
-1.382859, -1.670711, -4.556532, 1, 0.4745098, 0, 1,
-1.379449, -0.6344864, -4.063813, 1, 0.4784314, 0, 1,
-1.369557, -0.8599322, -2.45346, 1, 0.4862745, 0, 1,
-1.345969, -1.478035, -2.155215, 1, 0.4901961, 0, 1,
-1.34403, -0.6079916, -3.523017, 1, 0.4980392, 0, 1,
-1.341774, -0.9350607, -2.826328, 1, 0.5058824, 0, 1,
-1.341292, 0.2216441, -2.663629, 1, 0.509804, 0, 1,
-1.335027, -0.6630964, -1.751538, 1, 0.5176471, 0, 1,
-1.334927, -1.000021, -2.014766, 1, 0.5215687, 0, 1,
-1.334733, -0.01188146, -1.680185, 1, 0.5294118, 0, 1,
-1.331129, 0.5502719, 0.6025934, 1, 0.5333334, 0, 1,
-1.326801, -1.176034, -1.116016, 1, 0.5411765, 0, 1,
-1.323578, -0.06744418, -0.7295886, 1, 0.5450981, 0, 1,
-1.310134, 0.7844222, -0.5109341, 1, 0.5529412, 0, 1,
-1.30866, -1.226507, -1.809268, 1, 0.5568628, 0, 1,
-1.308538, -1.697136, -1.893511, 1, 0.5647059, 0, 1,
-1.304954, -1.34454, -4.025942, 1, 0.5686275, 0, 1,
-1.281739, 0.04521805, 0.8411549, 1, 0.5764706, 0, 1,
-1.275305, 0.17476, -1.041217, 1, 0.5803922, 0, 1,
-1.268314, 0.1779572, -2.326178, 1, 0.5882353, 0, 1,
-1.267922, -1.021755, -1.321398, 1, 0.5921569, 0, 1,
-1.265147, 0.004871498, -0.3399768, 1, 0.6, 0, 1,
-1.256459, -0.2897044, -1.45157, 1, 0.6078432, 0, 1,
-1.253534, -0.9893492, -3.114335, 1, 0.6117647, 0, 1,
-1.25326, -0.7291371, -0.8250378, 1, 0.6196079, 0, 1,
-1.231165, -0.1467984, -1.381273, 1, 0.6235294, 0, 1,
-1.226403, 2.370932, 1.809683, 1, 0.6313726, 0, 1,
-1.22589, -0.3563921, -1.457207, 1, 0.6352941, 0, 1,
-1.216363, -0.9098761, -1.698386, 1, 0.6431373, 0, 1,
-1.204071, -1.252447, -3.016575, 1, 0.6470588, 0, 1,
-1.202281, 1.227964, -1.923403, 1, 0.654902, 0, 1,
-1.197309, 0.4140931, -0.1898003, 1, 0.6588235, 0, 1,
-1.194892, 0.2110372, -1.662655, 1, 0.6666667, 0, 1,
-1.180457, 0.3207654, -2.944581, 1, 0.6705883, 0, 1,
-1.172278, 0.2690493, -1.959997, 1, 0.6784314, 0, 1,
-1.164736, -2.028933, -2.113623, 1, 0.682353, 0, 1,
-1.158301, 0.02551448, -1.776904, 1, 0.6901961, 0, 1,
-1.157654, -0.5236731, -2.221807, 1, 0.6941177, 0, 1,
-1.156084, 1.209475, -1.770869, 1, 0.7019608, 0, 1,
-1.154593, -0.8207112, -2.103502, 1, 0.7098039, 0, 1,
-1.134421, -1.885556, -4.167877, 1, 0.7137255, 0, 1,
-1.126158, 0.8849891, -2.0646, 1, 0.7215686, 0, 1,
-1.12473, 0.1739103, -1.33544, 1, 0.7254902, 0, 1,
-1.122195, -1.579303, -3.639978, 1, 0.7333333, 0, 1,
-1.116531, 2.009939, 0.2227345, 1, 0.7372549, 0, 1,
-1.107075, -1.054762, -2.7464, 1, 0.7450981, 0, 1,
-1.097596, 1.06048, -0.4490283, 1, 0.7490196, 0, 1,
-1.083118, -0.3280205, -0.9538441, 1, 0.7568628, 0, 1,
-1.080117, -0.2442094, -2.769264, 1, 0.7607843, 0, 1,
-1.06429, -2.426121, -3.888215, 1, 0.7686275, 0, 1,
-1.061875, -0.67008, -0.7606619, 1, 0.772549, 0, 1,
-1.05426, 0.4130818, -2.098788, 1, 0.7803922, 0, 1,
-1.053922, 0.6679759, 0.1095193, 1, 0.7843137, 0, 1,
-1.036232, 1.756075, -0.2194145, 1, 0.7921569, 0, 1,
-1.033041, 1.074486, 0.260644, 1, 0.7960784, 0, 1,
-1.027205, 0.1066617, -2.053133, 1, 0.8039216, 0, 1,
-1.020766, 2.170543, -2.150312, 1, 0.8117647, 0, 1,
-1.013693, -1.399215, -1.917729, 1, 0.8156863, 0, 1,
-1.00785, -0.3481402, -2.003639, 1, 0.8235294, 0, 1,
-1.007654, -0.113269, -2.246454, 1, 0.827451, 0, 1,
-1.006753, 0.2587371, -0.3097709, 1, 0.8352941, 0, 1,
-1.005439, 1.154402, -0.7552531, 1, 0.8392157, 0, 1,
-1.00127, -0.9344222, -2.327678, 1, 0.8470588, 0, 1,
-1.001239, 0.002682108, -3.484069, 1, 0.8509804, 0, 1,
-0.990463, 1.584517, 0.2357738, 1, 0.8588235, 0, 1,
-0.9887159, 1.376635, -1.138314, 1, 0.8627451, 0, 1,
-0.9871975, 0.06882983, -2.624391, 1, 0.8705882, 0, 1,
-0.9841768, 1.134675, -1.186857, 1, 0.8745098, 0, 1,
-0.9784784, 0.6473495, -1.852433, 1, 0.8823529, 0, 1,
-0.9721532, -0.699761, -0.9511178, 1, 0.8862745, 0, 1,
-0.9694738, -0.304768, -0.3254779, 1, 0.8941177, 0, 1,
-0.9508861, 0.3368812, -0.9026461, 1, 0.8980392, 0, 1,
-0.9504556, -0.3443857, -3.90407, 1, 0.9058824, 0, 1,
-0.944199, -1.730421, -1.408339, 1, 0.9137255, 0, 1,
-0.9412597, -0.6119571, -2.720746, 1, 0.9176471, 0, 1,
-0.9403683, 0.0942155, -1.530237, 1, 0.9254902, 0, 1,
-0.9310107, 1.427463, 1.846596, 1, 0.9294118, 0, 1,
-0.9129191, 2.537727, -0.04295069, 1, 0.9372549, 0, 1,
-0.9106625, -0.01505726, -0.3578887, 1, 0.9411765, 0, 1,
-0.9087971, -1.660932, -0.4981528, 1, 0.9490196, 0, 1,
-0.9056574, -0.4719223, -2.340314, 1, 0.9529412, 0, 1,
-0.9034992, -1.491032, -2.516043, 1, 0.9607843, 0, 1,
-0.8975588, -1.028258, -2.86509, 1, 0.9647059, 0, 1,
-0.8954811, -0.3583106, -1.464778, 1, 0.972549, 0, 1,
-0.8925887, -1.390965, -2.054179, 1, 0.9764706, 0, 1,
-0.8883232, 0.1602007, -0.5201932, 1, 0.9843137, 0, 1,
-0.8853932, -1.97841, -1.293341, 1, 0.9882353, 0, 1,
-0.8828956, 0.245663, -0.6459453, 1, 0.9960784, 0, 1,
-0.8824502, -0.7538731, -4.540025, 0.9960784, 1, 0, 1,
-0.8773496, -1.001606, -3.021101, 0.9921569, 1, 0, 1,
-0.872948, 0.6332035, -0.1248791, 0.9843137, 1, 0, 1,
-0.8706498, -0.5877551, -2.310882, 0.9803922, 1, 0, 1,
-0.8683243, -0.189002, -3.645884, 0.972549, 1, 0, 1,
-0.867278, -1.106595, -2.715096, 0.9686275, 1, 0, 1,
-0.8636603, 0.8829052, -1.539393, 0.9607843, 1, 0, 1,
-0.8621131, -0.6500299, -1.936305, 0.9568627, 1, 0, 1,
-0.8620531, -0.9147619, -2.792361, 0.9490196, 1, 0, 1,
-0.8598843, -0.5368872, -3.07071, 0.945098, 1, 0, 1,
-0.8578749, 1.492429, -2.019201, 0.9372549, 1, 0, 1,
-0.8556653, -0.4521706, -0.2493106, 0.9333333, 1, 0, 1,
-0.8519564, -0.4737331, -2.082348, 0.9254902, 1, 0, 1,
-0.849038, -1.918047, -2.963177, 0.9215686, 1, 0, 1,
-0.8396598, -0.8033826, -2.721079, 0.9137255, 1, 0, 1,
-0.8368716, -0.2021775, -3.242905, 0.9098039, 1, 0, 1,
-0.8367981, -0.8364281, -2.305893, 0.9019608, 1, 0, 1,
-0.835602, 0.4613061, 0.3142059, 0.8941177, 1, 0, 1,
-0.8315485, 0.7543417, -2.28631, 0.8901961, 1, 0, 1,
-0.8153885, -0.1020265, -2.697619, 0.8823529, 1, 0, 1,
-0.8142312, 1.696948, -2.138885, 0.8784314, 1, 0, 1,
-0.8129388, -0.7627499, -3.728983, 0.8705882, 1, 0, 1,
-0.8124552, 0.09650683, -1.983226, 0.8666667, 1, 0, 1,
-0.8073943, 0.429633, -0.3255433, 0.8588235, 1, 0, 1,
-0.8071612, -1.365386, -3.224705, 0.854902, 1, 0, 1,
-0.8043891, -0.6100584, -1.824189, 0.8470588, 1, 0, 1,
-0.797144, 0.4063773, -0.6057777, 0.8431373, 1, 0, 1,
-0.7914988, 0.4514033, -0.621951, 0.8352941, 1, 0, 1,
-0.7882114, 0.1267124, -1.980853, 0.8313726, 1, 0, 1,
-0.7881567, -0.4281119, -2.159277, 0.8235294, 1, 0, 1,
-0.7878225, 0.6868578, -1.480803, 0.8196079, 1, 0, 1,
-0.7838194, -1.454278, -1.611006, 0.8117647, 1, 0, 1,
-0.7754399, -0.4220481, -2.772813, 0.8078431, 1, 0, 1,
-0.7720506, -1.671554, -2.384471, 0.8, 1, 0, 1,
-0.7711825, -1.086771, -4.419473, 0.7921569, 1, 0, 1,
-0.7553815, -0.8844001, -1.265986, 0.7882353, 1, 0, 1,
-0.7412173, 0.8574333, -0.861924, 0.7803922, 1, 0, 1,
-0.7390328, -0.1102449, -1.14326, 0.7764706, 1, 0, 1,
-0.7366288, -1.539345, -2.949761, 0.7686275, 1, 0, 1,
-0.7324563, -0.9889668, -0.9787707, 0.7647059, 1, 0, 1,
-0.7322518, -0.8449399, -0.2271281, 0.7568628, 1, 0, 1,
-0.7310143, -1.370228, -3.29307, 0.7529412, 1, 0, 1,
-0.7223362, 0.1624645, -0.8081697, 0.7450981, 1, 0, 1,
-0.7193187, -0.495659, -1.211879, 0.7411765, 1, 0, 1,
-0.7060056, -0.9021946, -2.148663, 0.7333333, 1, 0, 1,
-0.7046786, -0.6387699, -4.803251, 0.7294118, 1, 0, 1,
-0.7046562, 0.4485147, 0.2037476, 0.7215686, 1, 0, 1,
-0.7028726, -3.460123, -3.461116, 0.7176471, 1, 0, 1,
-0.7024525, -1.386726, -4.779181, 0.7098039, 1, 0, 1,
-0.7014804, -0.6176207, -1.421523, 0.7058824, 1, 0, 1,
-0.6994609, 2.17116, -1.619488, 0.6980392, 1, 0, 1,
-0.6977487, 0.9704074, -0.4669087, 0.6901961, 1, 0, 1,
-0.696817, -0.8574474, -3.89189, 0.6862745, 1, 0, 1,
-0.6847533, -0.8094894, -1.487102, 0.6784314, 1, 0, 1,
-0.6845278, -0.8634812, -3.991624, 0.6745098, 1, 0, 1,
-0.6823737, -0.9122767, -2.911192, 0.6666667, 1, 0, 1,
-0.6817191, 1.051209, -0.1640789, 0.6627451, 1, 0, 1,
-0.6798242, -0.3877108, -3.085, 0.654902, 1, 0, 1,
-0.6684195, 0.4301123, -1.081892, 0.6509804, 1, 0, 1,
-0.6679397, -0.7434019, -2.617225, 0.6431373, 1, 0, 1,
-0.6679038, 0.1361411, -0.4965905, 0.6392157, 1, 0, 1,
-0.6674573, 0.9766073, -1.101112, 0.6313726, 1, 0, 1,
-0.6635167, -0.4925272, -2.154207, 0.627451, 1, 0, 1,
-0.6610695, -1.111466, -1.774518, 0.6196079, 1, 0, 1,
-0.6609411, -1.767389, -2.547525, 0.6156863, 1, 0, 1,
-0.6558273, 1.031855, -1.743224, 0.6078432, 1, 0, 1,
-0.6551461, 0.794545, 1.290887, 0.6039216, 1, 0, 1,
-0.6543712, -0.8681288, -2.872215, 0.5960785, 1, 0, 1,
-0.6517458, -0.09959603, -2.263623, 0.5882353, 1, 0, 1,
-0.6401561, 0.703316, 0.2833171, 0.5843138, 1, 0, 1,
-0.6336243, 0.1652347, -1.471393, 0.5764706, 1, 0, 1,
-0.631523, 0.2558539, -1.899781, 0.572549, 1, 0, 1,
-0.6306804, 3.344592, 0.7680691, 0.5647059, 1, 0, 1,
-0.6304303, -0.1064186, -2.962935, 0.5607843, 1, 0, 1,
-0.6257079, -0.2124639, -1.793441, 0.5529412, 1, 0, 1,
-0.6246321, 0.3127045, -2.631041, 0.5490196, 1, 0, 1,
-0.6226863, -0.8327718, -2.579819, 0.5411765, 1, 0, 1,
-0.6225227, -2.434875, -1.12492, 0.5372549, 1, 0, 1,
-0.6221886, -0.1537521, -1.9226, 0.5294118, 1, 0, 1,
-0.6166293, -0.1539849, -0.9202378, 0.5254902, 1, 0, 1,
-0.6161698, 0.6765476, -1.02177, 0.5176471, 1, 0, 1,
-0.6160749, 0.6275291, -1.005469, 0.5137255, 1, 0, 1,
-0.6151192, 0.4874574, 0.03029827, 0.5058824, 1, 0, 1,
-0.6146498, -0.03026512, -1.642926, 0.5019608, 1, 0, 1,
-0.6140653, -0.1535303, -2.490033, 0.4941176, 1, 0, 1,
-0.6133978, 0.7832837, -1.523283, 0.4862745, 1, 0, 1,
-0.6108914, 0.1380996, -1.454147, 0.4823529, 1, 0, 1,
-0.6073179, -0.2998853, -1.326334, 0.4745098, 1, 0, 1,
-0.5907744, -1.137496, -3.028367, 0.4705882, 1, 0, 1,
-0.5846167, -0.7381405, -2.723719, 0.4627451, 1, 0, 1,
-0.5800745, -0.54717, -2.059168, 0.4588235, 1, 0, 1,
-0.5797343, -0.5053409, -2.579222, 0.4509804, 1, 0, 1,
-0.5751913, 0.1633706, 0.01715165, 0.4470588, 1, 0, 1,
-0.5742323, 1.462108, 2.381767, 0.4392157, 1, 0, 1,
-0.5734703, 1.58512, 0.02168767, 0.4352941, 1, 0, 1,
-0.5720793, 0.4185078, -1.173044, 0.427451, 1, 0, 1,
-0.5707283, -0.6551481, -2.563297, 0.4235294, 1, 0, 1,
-0.569771, -1.558877, -2.187255, 0.4156863, 1, 0, 1,
-0.5641418, -0.05511234, -1.23219, 0.4117647, 1, 0, 1,
-0.5634036, 0.04467079, -0.2588175, 0.4039216, 1, 0, 1,
-0.5561083, -0.2633646, -0.02024034, 0.3960784, 1, 0, 1,
-0.5524707, -1.332851, -4.123227, 0.3921569, 1, 0, 1,
-0.5524301, -0.1995293, -2.319814, 0.3843137, 1, 0, 1,
-0.5493692, -1.736623, -3.322146, 0.3803922, 1, 0, 1,
-0.5434673, -0.3205096, -1.290691, 0.372549, 1, 0, 1,
-0.542821, 0.5354083, -0.2551443, 0.3686275, 1, 0, 1,
-0.5404895, -0.3299667, -2.765357, 0.3607843, 1, 0, 1,
-0.5390142, 0.7626161, -1.758249, 0.3568628, 1, 0, 1,
-0.5367182, 0.2945825, -1.836412, 0.3490196, 1, 0, 1,
-0.5343727, -0.4149305, -0.6343871, 0.345098, 1, 0, 1,
-0.5319532, 0.179877, -1.804858, 0.3372549, 1, 0, 1,
-0.5303804, -0.7610865, -2.277162, 0.3333333, 1, 0, 1,
-0.5302659, -0.8986301, -3.816135, 0.3254902, 1, 0, 1,
-0.5286276, 0.01778709, -0.4646826, 0.3215686, 1, 0, 1,
-0.5251243, 1.391274, -0.3708724, 0.3137255, 1, 0, 1,
-0.5131158, -0.5098683, -1.988178, 0.3098039, 1, 0, 1,
-0.5089797, -0.00300055, -2.965455, 0.3019608, 1, 0, 1,
-0.5068912, -0.5972674, -1.28201, 0.2941177, 1, 0, 1,
-0.5042642, -0.6229604, -2.328584, 0.2901961, 1, 0, 1,
-0.5038618, 1.000722, -0.1839933, 0.282353, 1, 0, 1,
-0.5023972, -2.649023, -4.388234, 0.2784314, 1, 0, 1,
-0.4993816, -0.2871739, -1.356862, 0.2705882, 1, 0, 1,
-0.4972169, -0.4694202, -2.366608, 0.2666667, 1, 0, 1,
-0.4965509, 0.2145356, -1.215582, 0.2588235, 1, 0, 1,
-0.4949062, -0.9443197, -1.964732, 0.254902, 1, 0, 1,
-0.4944077, 1.990218, 0.2915507, 0.2470588, 1, 0, 1,
-0.485096, 1.506504, 0.2750316, 0.2431373, 1, 0, 1,
-0.4799441, 1.438624, -1.640252, 0.2352941, 1, 0, 1,
-0.4752818, -0.2801246, -1.964946, 0.2313726, 1, 0, 1,
-0.472387, -1.691894, -3.504395, 0.2235294, 1, 0, 1,
-0.4689363, 0.9188685, 0.05288418, 0.2196078, 1, 0, 1,
-0.464873, 0.947899, -1.928037, 0.2117647, 1, 0, 1,
-0.460563, -0.7241201, -3.325413, 0.2078431, 1, 0, 1,
-0.4599783, -0.2567585, -2.433753, 0.2, 1, 0, 1,
-0.4585763, 1.027816, 0.415083, 0.1921569, 1, 0, 1,
-0.458083, 0.6472081, -0.5549916, 0.1882353, 1, 0, 1,
-0.4566894, 0.1483445, -0.2524564, 0.1803922, 1, 0, 1,
-0.4565498, -1.253267, -3.688748, 0.1764706, 1, 0, 1,
-0.4465952, 0.2297277, 0.1971078, 0.1686275, 1, 0, 1,
-0.445292, -0.4646273, -1.087745, 0.1647059, 1, 0, 1,
-0.4414304, 0.7053152, -3.290508, 0.1568628, 1, 0, 1,
-0.4401711, -0.6028259, -1.528031, 0.1529412, 1, 0, 1,
-0.4397163, 2.001509, -0.230692, 0.145098, 1, 0, 1,
-0.4378719, 0.3026695, -1.007174, 0.1411765, 1, 0, 1,
-0.4363964, -0.6015238, -2.100691, 0.1333333, 1, 0, 1,
-0.4315138, 0.703467, -0.7523976, 0.1294118, 1, 0, 1,
-0.4288118, -0.4920143, -2.630445, 0.1215686, 1, 0, 1,
-0.4196104, 1.595698, -0.2139635, 0.1176471, 1, 0, 1,
-0.416847, -1.725316, -0.787622, 0.1098039, 1, 0, 1,
-0.416291, -0.4314359, -3.076774, 0.1058824, 1, 0, 1,
-0.4158255, 0.8763818, -1.081189, 0.09803922, 1, 0, 1,
-0.413177, 0.3333505, 0.188978, 0.09019608, 1, 0, 1,
-0.4104032, -0.3995924, -1.934925, 0.08627451, 1, 0, 1,
-0.4100439, 1.627369, -0.9685863, 0.07843138, 1, 0, 1,
-0.4065236, -0.09887792, -1.642656, 0.07450981, 1, 0, 1,
-0.4058674, -1.808615, -1.527424, 0.06666667, 1, 0, 1,
-0.4024239, -0.6840204, -5.458968, 0.0627451, 1, 0, 1,
-0.4020668, 1.737055, -1.22011, 0.05490196, 1, 0, 1,
-0.3977433, 0.8421932, 0.1087228, 0.05098039, 1, 0, 1,
-0.3945148, -0.1947406, -1.918355, 0.04313726, 1, 0, 1,
-0.3941793, -0.03682784, -2.847747, 0.03921569, 1, 0, 1,
-0.3937298, -0.1801368, -1.501079, 0.03137255, 1, 0, 1,
-0.3899265, -0.6100771, -2.425902, 0.02745098, 1, 0, 1,
-0.3886744, -1.049014, -3.034993, 0.01960784, 1, 0, 1,
-0.3864317, 1.494042, 0.0667851, 0.01568628, 1, 0, 1,
-0.3806182, 1.86079, -0.2996447, 0.007843138, 1, 0, 1,
-0.3783474, 0.4770024, -0.04079527, 0.003921569, 1, 0, 1,
-0.3732019, 0.1912697, -2.769024, 0, 1, 0.003921569, 1,
-0.3668325, 0.8522182, -2.49352, 0, 1, 0.01176471, 1,
-0.3658846, 0.1094382, -1.649347, 0, 1, 0.01568628, 1,
-0.3649796, 0.08100954, -0.7542543, 0, 1, 0.02352941, 1,
-0.3618166, -0.08162134, -1.972164, 0, 1, 0.02745098, 1,
-0.3566977, -0.1166907, -0.5638465, 0, 1, 0.03529412, 1,
-0.356549, -1.177454, -4.677376, 0, 1, 0.03921569, 1,
-0.3534395, -0.6449245, -3.150357, 0, 1, 0.04705882, 1,
-0.3533792, -0.02611458, -2.618422, 0, 1, 0.05098039, 1,
-0.3516335, 2.455589, -0.5878059, 0, 1, 0.05882353, 1,
-0.3472881, 1.684046, -0.2872401, 0, 1, 0.0627451, 1,
-0.3417052, -0.591216, -3.247175, 0, 1, 0.07058824, 1,
-0.3380944, -0.7742517, -1.659483, 0, 1, 0.07450981, 1,
-0.3371612, -0.8174284, -3.688726, 0, 1, 0.08235294, 1,
-0.3358189, 0.35559, -2.419738, 0, 1, 0.08627451, 1,
-0.3341467, 1.247436, 1.017697, 0, 1, 0.09411765, 1,
-0.333505, -0.5542644, -3.125108, 0, 1, 0.1019608, 1,
-0.3328128, -0.8152317, -1.90618, 0, 1, 0.1058824, 1,
-0.3222092, 0.4399479, -1.062765, 0, 1, 0.1137255, 1,
-0.3218266, -2.266905, -3.397494, 0, 1, 0.1176471, 1,
-0.321064, -0.6659328, -3.432423, 0, 1, 0.1254902, 1,
-0.3155052, -0.489012, -2.972534, 0, 1, 0.1294118, 1,
-0.3143796, 0.937569, -1.227295, 0, 1, 0.1372549, 1,
-0.3117157, -0.5846799, -0.6714442, 0, 1, 0.1411765, 1,
-0.3115286, 0.8519511, 0.8039035, 0, 1, 0.1490196, 1,
-0.30734, 1.729061, 0.04915797, 0, 1, 0.1529412, 1,
-0.305639, -0.1916358, -2.92577, 0, 1, 0.1607843, 1,
-0.302093, -0.7746817, -0.1369028, 0, 1, 0.1647059, 1,
-0.2982531, 0.2367765, 0.01198628, 0, 1, 0.172549, 1,
-0.2982052, 2.644236, -2.538581, 0, 1, 0.1764706, 1,
-0.284427, -1.702869, -1.734413, 0, 1, 0.1843137, 1,
-0.283238, -1.389744, -2.143549, 0, 1, 0.1882353, 1,
-0.2830307, -0.6884429, -4.118928, 0, 1, 0.1960784, 1,
-0.2820531, 0.3613052, -0.5927147, 0, 1, 0.2039216, 1,
-0.2779137, 0.2286633, -1.634532, 0, 1, 0.2078431, 1,
-0.2698655, -0.7450503, -3.084549, 0, 1, 0.2156863, 1,
-0.2674759, 1.646844, 0.8223684, 0, 1, 0.2196078, 1,
-0.2672651, 0.4723833, -1.848516, 0, 1, 0.227451, 1,
-0.2669067, 0.9242265, 0.5310737, 0, 1, 0.2313726, 1,
-0.262585, -0.5004126, -2.094069, 0, 1, 0.2392157, 1,
-0.258894, -1.111161, -1.533822, 0, 1, 0.2431373, 1,
-0.2555022, -0.6925082, -3.862397, 0, 1, 0.2509804, 1,
-0.2529523, 0.5559379, 1.460694, 0, 1, 0.254902, 1,
-0.2481085, -0.0945896, -1.776447, 0, 1, 0.2627451, 1,
-0.2367761, -1.199958, -2.895934, 0, 1, 0.2666667, 1,
-0.2339703, 0.8042659, 0.03564109, 0, 1, 0.2745098, 1,
-0.2319078, -1.726481, -4.72231, 0, 1, 0.2784314, 1,
-0.2307776, 0.5700753, -0.09911069, 0, 1, 0.2862745, 1,
-0.2262024, 0.6076794, -0.8363233, 0, 1, 0.2901961, 1,
-0.2244821, -1.567804, -3.253134, 0, 1, 0.2980392, 1,
-0.2222987, 1.263295, 0.2630827, 0, 1, 0.3058824, 1,
-0.2203525, 0.8779477, -0.9241607, 0, 1, 0.3098039, 1,
-0.2159928, 1.539175, -0.3405674, 0, 1, 0.3176471, 1,
-0.2054577, -0.1861901, -1.536751, 0, 1, 0.3215686, 1,
-0.2012119, 0.7534754, -0.3588274, 0, 1, 0.3294118, 1,
-0.1984815, -0.4942477, -2.655217, 0, 1, 0.3333333, 1,
-0.1961352, -0.224677, -2.720552, 0, 1, 0.3411765, 1,
-0.1928833, 0.220426, 0.5420247, 0, 1, 0.345098, 1,
-0.1914245, 0.5728403, -1.091585, 0, 1, 0.3529412, 1,
-0.1904875, -0.004952256, -2.871584, 0, 1, 0.3568628, 1,
-0.1872387, 1.04169, 0.3196922, 0, 1, 0.3647059, 1,
-0.1855759, 1.373627, -0.257896, 0, 1, 0.3686275, 1,
-0.1842186, -1.591945, -1.288466, 0, 1, 0.3764706, 1,
-0.183954, -2.215666, -2.537587, 0, 1, 0.3803922, 1,
-0.1802665, 0.5552175, 0.3000789, 0, 1, 0.3882353, 1,
-0.1800202, 0.0735808, -0.4048173, 0, 1, 0.3921569, 1,
-0.1780104, -1.753886, -4.29269, 0, 1, 0.4, 1,
-0.1773397, -1.295598, -3.163693, 0, 1, 0.4078431, 1,
-0.1745623, -0.7398894, -4.187934, 0, 1, 0.4117647, 1,
-0.1704625, 0.6962555, -0.4029799, 0, 1, 0.4196078, 1,
-0.1671649, 0.03423779, -3.475408, 0, 1, 0.4235294, 1,
-0.1632771, -2.240339, -3.721302, 0, 1, 0.4313726, 1,
-0.1571379, -0.6630957, -3.445733, 0, 1, 0.4352941, 1,
-0.1570092, -0.6175807, -4.512988, 0, 1, 0.4431373, 1,
-0.1549973, 0.9899462, 0.302996, 0, 1, 0.4470588, 1,
-0.1546365, 1.707561, 1.440889, 0, 1, 0.454902, 1,
-0.1542469, 0.39474, 0.8237681, 0, 1, 0.4588235, 1,
-0.1495186, -0.9957273, -3.490793, 0, 1, 0.4666667, 1,
-0.1490485, -0.1687076, -2.044873, 0, 1, 0.4705882, 1,
-0.147931, 0.939673, 0.1657534, 0, 1, 0.4784314, 1,
-0.1476683, 0.1513444, 0.4992789, 0, 1, 0.4823529, 1,
-0.1423322, 0.9011448, 0.4899904, 0, 1, 0.4901961, 1,
-0.1417868, 0.315974, -1.089239, 0, 1, 0.4941176, 1,
-0.141141, 0.7271594, 0.4031869, 0, 1, 0.5019608, 1,
-0.1397699, -0.1668573, -3.416341, 0, 1, 0.509804, 1,
-0.1379024, 1.439338, -1.662108, 0, 1, 0.5137255, 1,
-0.1362977, -0.3123961, -2.236661, 0, 1, 0.5215687, 1,
-0.1355872, -0.02786786, -3.116878, 0, 1, 0.5254902, 1,
-0.1350631, 0.9350347, -0.07610826, 0, 1, 0.5333334, 1,
-0.1318133, -0.8664492, -2.0475, 0, 1, 0.5372549, 1,
-0.1275745, 0.4737914, 1.1309, 0, 1, 0.5450981, 1,
-0.1275615, 0.1698979, -0.2420944, 0, 1, 0.5490196, 1,
-0.1260701, -0.2169681, -1.943415, 0, 1, 0.5568628, 1,
-0.125005, -0.5388172, -4.837759, 0, 1, 0.5607843, 1,
-0.1246779, -0.09425212, -2.610957, 0, 1, 0.5686275, 1,
-0.1245431, 0.3912505, -0.372129, 0, 1, 0.572549, 1,
-0.1236884, -0.5492989, -1.832256, 0, 1, 0.5803922, 1,
-0.1217746, -0.5187245, -1.065504, 0, 1, 0.5843138, 1,
-0.1211537, -0.1321362, -2.167517, 0, 1, 0.5921569, 1,
-0.1200572, 0.7537658, -0.7690411, 0, 1, 0.5960785, 1,
-0.1183509, 0.4456344, -2.134708, 0, 1, 0.6039216, 1,
-0.1145356, -0.3229675, -3.591202, 0, 1, 0.6117647, 1,
-0.1057294, -0.6533446, -2.543789, 0, 1, 0.6156863, 1,
-0.1031911, 0.8621329, -0.0362005, 0, 1, 0.6235294, 1,
-0.1029447, 1.17547, 1.155062, 0, 1, 0.627451, 1,
-0.09993924, 1.519652, -0.7406242, 0, 1, 0.6352941, 1,
-0.08945765, -0.2072248, -1.853756, 0, 1, 0.6392157, 1,
-0.08496656, -1.402168, -3.628752, 0, 1, 0.6470588, 1,
-0.0808513, -1.117256, -2.493287, 0, 1, 0.6509804, 1,
-0.07739858, -0.7635961, -2.09871, 0, 1, 0.6588235, 1,
-0.07733883, -1.028616, -4.027221, 0, 1, 0.6627451, 1,
-0.07647682, 0.4951614, -0.410861, 0, 1, 0.6705883, 1,
-0.07532348, -0.7537339, -2.086416, 0, 1, 0.6745098, 1,
-0.06643353, 0.07467581, 0.2486745, 0, 1, 0.682353, 1,
-0.06435271, 0.9670234, 0.02410398, 0, 1, 0.6862745, 1,
-0.06331294, -0.3282917, -3.430801, 0, 1, 0.6941177, 1,
-0.06241486, -0.0327139, -2.498924, 0, 1, 0.7019608, 1,
-0.06019722, -0.752358, -4.75451, 0, 1, 0.7058824, 1,
-0.06006189, 1.421147, -0.4340917, 0, 1, 0.7137255, 1,
-0.05776476, 0.4965469, 1.319071, 0, 1, 0.7176471, 1,
-0.05771, 0.06404319, -0.7992847, 0, 1, 0.7254902, 1,
-0.05493741, 1.383087, -1.288872, 0, 1, 0.7294118, 1,
-0.05352916, 1.058012, -0.2602397, 0, 1, 0.7372549, 1,
-0.05239035, -0.9441961, -2.515091, 0, 1, 0.7411765, 1,
-0.05191703, 1.032224, 0.6942843, 0, 1, 0.7490196, 1,
-0.05148781, 1.475011, 0.1978419, 0, 1, 0.7529412, 1,
-0.04733711, 0.698549, -0.8000559, 0, 1, 0.7607843, 1,
-0.04246334, -0.4303863, -2.32713, 0, 1, 0.7647059, 1,
-0.03684672, 0.03315497, -0.8620172, 0, 1, 0.772549, 1,
-0.03578279, -0.3390151, -2.989304, 0, 1, 0.7764706, 1,
-0.03492311, -0.3679578, -1.363432, 0, 1, 0.7843137, 1,
-0.03029764, 0.05265062, -1.05907, 0, 1, 0.7882353, 1,
-0.02989925, -2.169949, -2.016961, 0, 1, 0.7960784, 1,
-0.02983825, -0.9809831, -4.745235, 0, 1, 0.8039216, 1,
-0.02724401, -0.09115417, -1.640997, 0, 1, 0.8078431, 1,
-0.02693737, 0.06968673, -0.5100087, 0, 1, 0.8156863, 1,
-0.02012077, 2.564501, 0.1997227, 0, 1, 0.8196079, 1,
-0.01758705, 1.110924, 1.270532, 0, 1, 0.827451, 1,
-0.0153666, -3.199508, -3.420551, 0, 1, 0.8313726, 1,
-0.01167268, 1.255048, -0.3403808, 0, 1, 0.8392157, 1,
-0.01091101, 0.340983, -0.4076572, 0, 1, 0.8431373, 1,
-0.009545373, -0.263541, -4.870224, 0, 1, 0.8509804, 1,
-0.005749356, 0.6591959, 0.7749137, 0, 1, 0.854902, 1,
-0.004764967, 0.1528432, 0.4568469, 0, 1, 0.8627451, 1,
0.006467678, -0.8455334, 2.864672, 0, 1, 0.8666667, 1,
0.008945811, -0.4527202, 2.833416, 0, 1, 0.8745098, 1,
0.009550997, -0.1766702, 2.73967, 0, 1, 0.8784314, 1,
0.01452574, -1.726801, 3.979157, 0, 1, 0.8862745, 1,
0.01839356, 1.268498, -1.593448, 0, 1, 0.8901961, 1,
0.02053561, 0.6268393, 0.3217409, 0, 1, 0.8980392, 1,
0.0222173, -0.5442275, 3.515339, 0, 1, 0.9058824, 1,
0.02434632, 0.6008186, 0.4030026, 0, 1, 0.9098039, 1,
0.02940355, 1.292757, 1.074528, 0, 1, 0.9176471, 1,
0.04016054, 0.3894191, 1.239674, 0, 1, 0.9215686, 1,
0.04250798, 0.3031425, -0.5681504, 0, 1, 0.9294118, 1,
0.04686429, 1.2032, -0.6997991, 0, 1, 0.9333333, 1,
0.04896075, -0.02146763, 2.338063, 0, 1, 0.9411765, 1,
0.04921833, -0.2939306, 2.837123, 0, 1, 0.945098, 1,
0.05215891, 0.6391612, 2.328392, 0, 1, 0.9529412, 1,
0.0530994, 0.2395388, 1.609137, 0, 1, 0.9568627, 1,
0.05345495, -0.6621367, 5.239394, 0, 1, 0.9647059, 1,
0.0557954, 1.031881, -0.444464, 0, 1, 0.9686275, 1,
0.06002928, -0.2472713, 1.72955, 0, 1, 0.9764706, 1,
0.06049084, 0.4738328, -0.2638506, 0, 1, 0.9803922, 1,
0.06204678, -0.5391302, 3.261096, 0, 1, 0.9882353, 1,
0.06322963, -0.8515302, 3.189776, 0, 1, 0.9921569, 1,
0.06346892, -0.1993788, 1.424863, 0, 1, 1, 1,
0.06794611, -1.759383, 3.428192, 0, 0.9921569, 1, 1,
0.06829883, -0.4502694, 1.55462, 0, 0.9882353, 1, 1,
0.075192, 1.233566, -0.9437239, 0, 0.9803922, 1, 1,
0.08250633, -0.272661, 1.253713, 0, 0.9764706, 1, 1,
0.08611852, -0.1639308, 0.3141621, 0, 0.9686275, 1, 1,
0.08618405, -0.1436968, 2.309824, 0, 0.9647059, 1, 1,
0.08693686, -0.02163854, 0.3825451, 0, 0.9568627, 1, 1,
0.09625039, 2.57581, 0.1403879, 0, 0.9529412, 1, 1,
0.09640929, 0.8557522, 0.7908565, 0, 0.945098, 1, 1,
0.09646676, 1.306474, -2.417058, 0, 0.9411765, 1, 1,
0.09930953, 0.2223614, 2.074339, 0, 0.9333333, 1, 1,
0.1016511, -0.2209224, 3.746947, 0, 0.9294118, 1, 1,
0.1061937, 0.4728757, 1.435895, 0, 0.9215686, 1, 1,
0.114751, -0.01823993, 0.743261, 0, 0.9176471, 1, 1,
0.1156244, -0.347138, 0.9302948, 0, 0.9098039, 1, 1,
0.1169998, -0.704993, 3.259822, 0, 0.9058824, 1, 1,
0.1190017, -1.400076, 2.119296, 0, 0.8980392, 1, 1,
0.128154, 1.31143, 0.7330821, 0, 0.8901961, 1, 1,
0.1312467, -1.391386, 3.634807, 0, 0.8862745, 1, 1,
0.1335973, -1.607393, 3.054729, 0, 0.8784314, 1, 1,
0.1387439, 0.4540668, 0.7792337, 0, 0.8745098, 1, 1,
0.1390119, -1.849507, 2.512949, 0, 0.8666667, 1, 1,
0.1415921, 0.01647614, 1.012196, 0, 0.8627451, 1, 1,
0.1429991, -0.2069196, 3.326399, 0, 0.854902, 1, 1,
0.1432784, -0.5593368, 3.183562, 0, 0.8509804, 1, 1,
0.1436477, 0.3799023, 1.614947, 0, 0.8431373, 1, 1,
0.1439039, -0.2442738, 4.023931, 0, 0.8392157, 1, 1,
0.1462441, 0.1255818, 2.748867, 0, 0.8313726, 1, 1,
0.1645596, -1.456581, 3.400497, 0, 0.827451, 1, 1,
0.1687669, 0.3515316, 0.4798269, 0, 0.8196079, 1, 1,
0.1696972, 0.5565382, 1.480345, 0, 0.8156863, 1, 1,
0.1701155, 0.6649962, -0.5906751, 0, 0.8078431, 1, 1,
0.1731558, 1.170461, 0.454743, 0, 0.8039216, 1, 1,
0.1795667, -0.1741616, -0.08991977, 0, 0.7960784, 1, 1,
0.1806327, -0.936781, 1.282014, 0, 0.7882353, 1, 1,
0.1833196, 0.4900612, 1.276571, 0, 0.7843137, 1, 1,
0.1838046, -0.3921516, 1.541381, 0, 0.7764706, 1, 1,
0.1866478, -0.1995015, 1.834802, 0, 0.772549, 1, 1,
0.1890515, -0.347097, 2.834835, 0, 0.7647059, 1, 1,
0.1915435, 0.1171391, 0.697716, 0, 0.7607843, 1, 1,
0.1933777, 0.6368223, -0.7873205, 0, 0.7529412, 1, 1,
0.1955748, 0.7751692, 0.02660125, 0, 0.7490196, 1, 1,
0.1955912, -0.4230849, 5.231326, 0, 0.7411765, 1, 1,
0.1966569, 0.06304662, 0.8847058, 0, 0.7372549, 1, 1,
0.2024408, 1.112923, 1.08374, 0, 0.7294118, 1, 1,
0.207578, 0.01773826, 1.208471, 0, 0.7254902, 1, 1,
0.2121694, 1.625798, 0.1619485, 0, 0.7176471, 1, 1,
0.2127299, -1.0044, 4.587435, 0, 0.7137255, 1, 1,
0.2151642, -0.4335006, 1.977138, 0, 0.7058824, 1, 1,
0.2164508, 0.4898221, -0.1983182, 0, 0.6980392, 1, 1,
0.2182968, 0.9075083, 0.2703288, 0, 0.6941177, 1, 1,
0.2188173, 1.261202, 0.5980439, 0, 0.6862745, 1, 1,
0.2207596, 0.1378542, 0.2238417, 0, 0.682353, 1, 1,
0.2246658, -1.065488, 4.126856, 0, 0.6745098, 1, 1,
0.2259144, -1.607633, 1.348856, 0, 0.6705883, 1, 1,
0.2265531, 1.180574, -0.01954308, 0, 0.6627451, 1, 1,
0.226972, 1.167596, -0.07782901, 0, 0.6588235, 1, 1,
0.2320266, -0.1375448, 2.402417, 0, 0.6509804, 1, 1,
0.2329471, 0.1212856, -0.3219483, 0, 0.6470588, 1, 1,
0.2440868, -2.11439, 3.759686, 0, 0.6392157, 1, 1,
0.245842, 1.341392, 0.7114012, 0, 0.6352941, 1, 1,
0.2501814, -0.4536004, 2.397397, 0, 0.627451, 1, 1,
0.2506951, 1.784122, 1.553592, 0, 0.6235294, 1, 1,
0.2513506, -0.5272628, 4.313467, 0, 0.6156863, 1, 1,
0.2514805, 1.344961, -0.7807677, 0, 0.6117647, 1, 1,
0.2515908, -0.6067315, 2.528296, 0, 0.6039216, 1, 1,
0.2526156, -1.340747, 5.089318, 0, 0.5960785, 1, 1,
0.2547241, 1.026202, -0.6775278, 0, 0.5921569, 1, 1,
0.2559521, -0.3264416, 2.019531, 0, 0.5843138, 1, 1,
0.2571561, 2.038734, -1.600261, 0, 0.5803922, 1, 1,
0.259892, -0.4645617, 2.745008, 0, 0.572549, 1, 1,
0.2612735, 0.1520589, 1.508682, 0, 0.5686275, 1, 1,
0.2634624, -0.3293286, 0.4017924, 0, 0.5607843, 1, 1,
0.2636185, 0.2928615, -1.281747, 0, 0.5568628, 1, 1,
0.2647254, 1.193882, 0.7624326, 0, 0.5490196, 1, 1,
0.2652006, 0.3794865, 1.096613, 0, 0.5450981, 1, 1,
0.2658365, 0.6270894, 0.2318866, 0, 0.5372549, 1, 1,
0.2666673, 0.8081468, 1.277597, 0, 0.5333334, 1, 1,
0.2667033, -0.5125349, 4.785822, 0, 0.5254902, 1, 1,
0.2686853, 0.4488876, -0.4510185, 0, 0.5215687, 1, 1,
0.2734702, -2.043895, 4.070454, 0, 0.5137255, 1, 1,
0.2737984, -0.04487738, 1.33564, 0, 0.509804, 1, 1,
0.2755575, 0.6843615, -0.2401711, 0, 0.5019608, 1, 1,
0.2789147, -0.13055, 1.404598, 0, 0.4941176, 1, 1,
0.2837991, -1.41675, 2.948777, 0, 0.4901961, 1, 1,
0.2879836, -1.300015, 2.639085, 0, 0.4823529, 1, 1,
0.2893746, -2.244602, 3.542881, 0, 0.4784314, 1, 1,
0.2931326, -1.42137, 4.617355, 0, 0.4705882, 1, 1,
0.2979824, -0.3307824, 3.837569, 0, 0.4666667, 1, 1,
0.2988398, 0.3967971, -0.5426313, 0, 0.4588235, 1, 1,
0.3023569, -0.4436712, 0.9890481, 0, 0.454902, 1, 1,
0.3034795, 0.03319066, 1.649948, 0, 0.4470588, 1, 1,
0.3054724, -0.3145728, 2.919492, 0, 0.4431373, 1, 1,
0.3062721, 0.5922097, 0.8494323, 0, 0.4352941, 1, 1,
0.3080279, -0.5588289, 2.623098, 0, 0.4313726, 1, 1,
0.3102069, -0.8995437, 2.789685, 0, 0.4235294, 1, 1,
0.3145839, -0.4484651, 1.986893, 0, 0.4196078, 1, 1,
0.3175069, -0.3247671, 2.723377, 0, 0.4117647, 1, 1,
0.3254086, -1.438004, 4.499221, 0, 0.4078431, 1, 1,
0.3267135, -0.5665006, 2.949354, 0, 0.4, 1, 1,
0.3269053, -1.257734, 3.46527, 0, 0.3921569, 1, 1,
0.330179, 0.9350295, -1.358174, 0, 0.3882353, 1, 1,
0.3312111, -1.413378, 2.96621, 0, 0.3803922, 1, 1,
0.3360271, -0.08409096, 2.534583, 0, 0.3764706, 1, 1,
0.3397214, -1.081022, 1.458441, 0, 0.3686275, 1, 1,
0.3403702, -1.521065, 3.538687, 0, 0.3647059, 1, 1,
0.3405344, 0.4749565, 0.4643846, 0, 0.3568628, 1, 1,
0.3419833, -1.393419, 2.667598, 0, 0.3529412, 1, 1,
0.3438673, 0.8286811, 2.043232, 0, 0.345098, 1, 1,
0.3440278, -0.9044741, 3.242796, 0, 0.3411765, 1, 1,
0.3444194, 0.9734837, -0.3236241, 0, 0.3333333, 1, 1,
0.3457204, 2.050508, -0.5346997, 0, 0.3294118, 1, 1,
0.3475856, 0.4429595, -0.7198091, 0, 0.3215686, 1, 1,
0.347654, 0.04655508, 0.4699194, 0, 0.3176471, 1, 1,
0.3491603, -0.1389687, 2.679955, 0, 0.3098039, 1, 1,
0.3515256, -1.164262, 1.265628, 0, 0.3058824, 1, 1,
0.3534988, -0.3074216, 1.470445, 0, 0.2980392, 1, 1,
0.360724, 0.4499307, 1.697442, 0, 0.2901961, 1, 1,
0.3608871, 0.6691377, -0.8304953, 0, 0.2862745, 1, 1,
0.3655665, 0.2387388, 0.4074209, 0, 0.2784314, 1, 1,
0.3658628, -0.2109233, 3.355708, 0, 0.2745098, 1, 1,
0.3669315, -0.4273538, 3.110906, 0, 0.2666667, 1, 1,
0.3730763, 0.9211999, 1.290201, 0, 0.2627451, 1, 1,
0.3746419, 0.5015671, 0.1148715, 0, 0.254902, 1, 1,
0.3759607, -0.8672987, 1.393779, 0, 0.2509804, 1, 1,
0.3768738, 0.2384309, 1.294014, 0, 0.2431373, 1, 1,
0.3779429, 1.35159, -0.7944056, 0, 0.2392157, 1, 1,
0.3894521, -0.599173, 4.629397, 0, 0.2313726, 1, 1,
0.3911905, 0.2453627, 1.110435, 0, 0.227451, 1, 1,
0.3979448, 3.115718, -1.768422, 0, 0.2196078, 1, 1,
0.4031675, 0.6338142, 0.5783695, 0, 0.2156863, 1, 1,
0.4049114, -1.617748, 2.528965, 0, 0.2078431, 1, 1,
0.4057666, 1.658019, 2.022215, 0, 0.2039216, 1, 1,
0.4058995, -0.6680661, 2.253063, 0, 0.1960784, 1, 1,
0.4071699, 0.670019, 1.309394, 0, 0.1882353, 1, 1,
0.4079584, -0.1372372, 2.053362, 0, 0.1843137, 1, 1,
0.4127975, 1.832572, -0.197479, 0, 0.1764706, 1, 1,
0.4133506, -0.6850474, 0.6210296, 0, 0.172549, 1, 1,
0.4142608, 0.08734004, 1.883201, 0, 0.1647059, 1, 1,
0.4153074, -1.565476, 3.572549, 0, 0.1607843, 1, 1,
0.4159648, -1.4807, 2.894455, 0, 0.1529412, 1, 1,
0.4223948, -0.09857024, 1.591208, 0, 0.1490196, 1, 1,
0.4251918, 1.08704, 0.4676409, 0, 0.1411765, 1, 1,
0.4275789, 0.6868439, 0.3170672, 0, 0.1372549, 1, 1,
0.4279899, -0.8505349, 2.740494, 0, 0.1294118, 1, 1,
0.429116, -0.07243597, 0.981443, 0, 0.1254902, 1, 1,
0.4319654, -0.6434748, 4.482059, 0, 0.1176471, 1, 1,
0.4337231, -0.2946006, 2.833834, 0, 0.1137255, 1, 1,
0.4368432, -0.3032101, 1.66896, 0, 0.1058824, 1, 1,
0.439139, 1.152169, 0.01953982, 0, 0.09803922, 1, 1,
0.4425237, 1.997716, 1.023499, 0, 0.09411765, 1, 1,
0.4431218, 1.134666, -0.4987556, 0, 0.08627451, 1, 1,
0.4440139, 0.2845618, 0.6071569, 0, 0.08235294, 1, 1,
0.4451557, -1.557296, 2.715377, 0, 0.07450981, 1, 1,
0.4478014, -0.06051917, 2.397593, 0, 0.07058824, 1, 1,
0.4479806, 1.27989, 0.04898655, 0, 0.0627451, 1, 1,
0.4479811, -1.563697, 2.909353, 0, 0.05882353, 1, 1,
0.4526201, 0.5097046, 1.324344, 0, 0.05098039, 1, 1,
0.4569952, 2.619077, 1.844054, 0, 0.04705882, 1, 1,
0.4570682, 2.199388, 0.3314774, 0, 0.03921569, 1, 1,
0.4591249, -1.183551, 1.740731, 0, 0.03529412, 1, 1,
0.4595297, 0.6933903, 1.69174, 0, 0.02745098, 1, 1,
0.462151, -1.591439, 2.571032, 0, 0.02352941, 1, 1,
0.4635071, 0.7877083, -0.4974584, 0, 0.01568628, 1, 1,
0.464356, 1.029822, -1.007442, 0, 0.01176471, 1, 1,
0.4650339, 0.1225618, 1.831742, 0, 0.003921569, 1, 1,
0.4689998, -0.001722941, 1.397867, 0.003921569, 0, 1, 1,
0.4721807, -0.2168874, 2.383179, 0.007843138, 0, 1, 1,
0.4739688, -1.266365, 2.106164, 0.01568628, 0, 1, 1,
0.4783463, -0.6471652, 1.431072, 0.01960784, 0, 1, 1,
0.4860605, 0.05329275, 2.451753, 0.02745098, 0, 1, 1,
0.4870927, -0.7630695, 3.169001, 0.03137255, 0, 1, 1,
0.4878684, 0.02760349, 0.8190448, 0.03921569, 0, 1, 1,
0.4885665, 1.168024, -1.002413, 0.04313726, 0, 1, 1,
0.4902805, 0.9619256, 1.827661, 0.05098039, 0, 1, 1,
0.4917502, 0.4984768, 1.003584, 0.05490196, 0, 1, 1,
0.4937007, 0.5595955, 0.7607951, 0.0627451, 0, 1, 1,
0.4942382, -1.102813, 4.062056, 0.06666667, 0, 1, 1,
0.4965842, 0.4749152, 1.504358, 0.07450981, 0, 1, 1,
0.4981481, 0.2750252, 2.144939, 0.07843138, 0, 1, 1,
0.5003609, -2.218871, 4.1953, 0.08627451, 0, 1, 1,
0.5018373, 0.4690137, 0.6254662, 0.09019608, 0, 1, 1,
0.5059733, 0.9730792, -0.3086053, 0.09803922, 0, 1, 1,
0.509664, -2.251204, 2.770793, 0.1058824, 0, 1, 1,
0.5138686, -1.734752, 3.639993, 0.1098039, 0, 1, 1,
0.5182636, -0.4660281, 3.315121, 0.1176471, 0, 1, 1,
0.5219021, -2.502627, 1.526046, 0.1215686, 0, 1, 1,
0.5307081, 1.735459, 0.457444, 0.1294118, 0, 1, 1,
0.5337494, 0.1906737, -0.04806652, 0.1333333, 0, 1, 1,
0.5347193, -0.4311742, 2.51512, 0.1411765, 0, 1, 1,
0.535231, 0.9430023, 1.598059, 0.145098, 0, 1, 1,
0.5423457, 0.1144245, 1.133083, 0.1529412, 0, 1, 1,
0.5479774, 1.032111, 0.6207746, 0.1568628, 0, 1, 1,
0.549225, -0.06615452, 2.589185, 0.1647059, 0, 1, 1,
0.5538122, -0.858727, 2.414056, 0.1686275, 0, 1, 1,
0.5607195, -1.377796, 4.773693, 0.1764706, 0, 1, 1,
0.5608068, 0.3895078, -0.6557971, 0.1803922, 0, 1, 1,
0.5614462, -0.3586475, 2.218741, 0.1882353, 0, 1, 1,
0.5624619, -1.014571, 3.7615, 0.1921569, 0, 1, 1,
0.5637667, 0.3403782, 2.317131, 0.2, 0, 1, 1,
0.5658125, -0.3568057, 1.907622, 0.2078431, 0, 1, 1,
0.5666577, 1.434047, -0.2341475, 0.2117647, 0, 1, 1,
0.567741, 0.1298267, 0.3386612, 0.2196078, 0, 1, 1,
0.5721112, 0.03939343, 1.362865, 0.2235294, 0, 1, 1,
0.5730062, -0.4719608, 2.369484, 0.2313726, 0, 1, 1,
0.578131, -0.1786947, 1.109637, 0.2352941, 0, 1, 1,
0.5824358, -0.9586764, 1.802312, 0.2431373, 0, 1, 1,
0.5828121, 0.4464861, 2.511414, 0.2470588, 0, 1, 1,
0.5847145, -0.2459297, 2.93231, 0.254902, 0, 1, 1,
0.5855025, -0.5074594, 3.035388, 0.2588235, 0, 1, 1,
0.5864615, -0.09680618, 1.399832, 0.2666667, 0, 1, 1,
0.5871152, 2.382837, -1.633995, 0.2705882, 0, 1, 1,
0.5910774, 0.1997217, 2.085069, 0.2784314, 0, 1, 1,
0.5910969, -0.5161488, 1.91859, 0.282353, 0, 1, 1,
0.5978719, 1.013558, -0.1425131, 0.2901961, 0, 1, 1,
0.6018683, 0.2998599, -0.09623104, 0.2941177, 0, 1, 1,
0.6019488, -0.7213226, 1.406505, 0.3019608, 0, 1, 1,
0.6022906, -0.4418202, 2.558692, 0.3098039, 0, 1, 1,
0.603123, 0.8473821, 3.183587, 0.3137255, 0, 1, 1,
0.6039371, -0.02352617, 3.332219, 0.3215686, 0, 1, 1,
0.604771, -0.8549212, 3.119959, 0.3254902, 0, 1, 1,
0.6078542, 0.4865662, 0.8832866, 0.3333333, 0, 1, 1,
0.6128737, -1.309977, 3.085489, 0.3372549, 0, 1, 1,
0.6134399, 0.9585747, -0.1884728, 0.345098, 0, 1, 1,
0.6160488, -0.467384, 0.42803, 0.3490196, 0, 1, 1,
0.6181955, 0.6320112, 1.292017, 0.3568628, 0, 1, 1,
0.6225052, 0.9985305, 1.832253, 0.3607843, 0, 1, 1,
0.6228926, 0.3988686, 2.734128, 0.3686275, 0, 1, 1,
0.6230106, 1.036427, 0.03742515, 0.372549, 0, 1, 1,
0.624123, -0.0414986, 0.8185024, 0.3803922, 0, 1, 1,
0.6281729, 0.3247931, 2.275532, 0.3843137, 0, 1, 1,
0.6313599, -0.8767155, 1.852638, 0.3921569, 0, 1, 1,
0.6395797, 0.3867211, -0.0216402, 0.3960784, 0, 1, 1,
0.6444247, 0.7609707, 1.975888, 0.4039216, 0, 1, 1,
0.6472808, 1.540248, 1.465328, 0.4117647, 0, 1, 1,
0.6479137, 1.650331, 0.9244946, 0.4156863, 0, 1, 1,
0.6505342, 1.768155, -0.1147104, 0.4235294, 0, 1, 1,
0.6537524, -0.0753166, -0.2100283, 0.427451, 0, 1, 1,
0.6549865, -0.7185438, 2.097774, 0.4352941, 0, 1, 1,
0.6551816, -1.486509, 2.0288, 0.4392157, 0, 1, 1,
0.6576724, 0.6721897, 0.8813551, 0.4470588, 0, 1, 1,
0.6655556, -1.150246, 2.341135, 0.4509804, 0, 1, 1,
0.6673403, 0.7051826, 2.760634, 0.4588235, 0, 1, 1,
0.6675246, -0.1951028, 2.967789, 0.4627451, 0, 1, 1,
0.6743174, -0.2451371, 2.31156, 0.4705882, 0, 1, 1,
0.6786997, -0.5870578, 3.731104, 0.4745098, 0, 1, 1,
0.6788731, -0.7210077, 2.150284, 0.4823529, 0, 1, 1,
0.6792557, -0.8630766, 1.956906, 0.4862745, 0, 1, 1,
0.6857859, -0.5780469, 1.490067, 0.4941176, 0, 1, 1,
0.6860621, 1.146284, -0.2888496, 0.5019608, 0, 1, 1,
0.6861762, -0.4922942, 2.346171, 0.5058824, 0, 1, 1,
0.6869239, 0.2251697, 2.067426, 0.5137255, 0, 1, 1,
0.6880889, 1.508165, 1.070532, 0.5176471, 0, 1, 1,
0.6910278, -1.190854, 3.108243, 0.5254902, 0, 1, 1,
0.6914648, -0.1507804, 1.990444, 0.5294118, 0, 1, 1,
0.6942461, -0.6476933, 0.538652, 0.5372549, 0, 1, 1,
0.6961725, -0.4112735, 0.8940635, 0.5411765, 0, 1, 1,
0.6994019, -1.005236, 1.90491, 0.5490196, 0, 1, 1,
0.7090454, -0.2359595, 3.052598, 0.5529412, 0, 1, 1,
0.7115095, -0.5578421, 3.406956, 0.5607843, 0, 1, 1,
0.7116125, 0.819408, 0.2007715, 0.5647059, 0, 1, 1,
0.7195271, 0.5546781, 3.202523, 0.572549, 0, 1, 1,
0.7221909, -1.543927, 2.621879, 0.5764706, 0, 1, 1,
0.7275728, -0.5743877, 3.009342, 0.5843138, 0, 1, 1,
0.7294048, 0.3664262, 2.889827, 0.5882353, 0, 1, 1,
0.7380564, 0.7925156, -0.2436456, 0.5960785, 0, 1, 1,
0.7381458, 0.7552443, 0.3267971, 0.6039216, 0, 1, 1,
0.7394369, 2.074735, 0.464702, 0.6078432, 0, 1, 1,
0.7510511, -0.05522789, 1.444683, 0.6156863, 0, 1, 1,
0.7516055, -2.242073, 4.30509, 0.6196079, 0, 1, 1,
0.7518896, 0.02936133, -0.07724363, 0.627451, 0, 1, 1,
0.7531207, 0.7968382, 0.6561462, 0.6313726, 0, 1, 1,
0.7629332, -0.1330754, 1.772607, 0.6392157, 0, 1, 1,
0.7765735, -0.2367088, 1.599188, 0.6431373, 0, 1, 1,
0.7777307, -0.1760764, 1.794949, 0.6509804, 0, 1, 1,
0.779294, 0.1054713, 0.7513347, 0.654902, 0, 1, 1,
0.7809342, 0.2334037, 0.09280603, 0.6627451, 0, 1, 1,
0.7818187, 0.08634163, 2.849072, 0.6666667, 0, 1, 1,
0.7927522, 0.8078202, 0.4426294, 0.6745098, 0, 1, 1,
0.7980186, -0.5690905, 1.309443, 0.6784314, 0, 1, 1,
0.8119639, -0.05371978, 1.595135, 0.6862745, 0, 1, 1,
0.8168172, 1.21242, 0.2903305, 0.6901961, 0, 1, 1,
0.8181557, -1.370798, 4.103129, 0.6980392, 0, 1, 1,
0.8197193, 0.9574939, 0.5668644, 0.7058824, 0, 1, 1,
0.8255606, 0.2794492, 1.800264, 0.7098039, 0, 1, 1,
0.8257765, -0.4099219, 1.960509, 0.7176471, 0, 1, 1,
0.8311878, 0.1505817, 1.190423, 0.7215686, 0, 1, 1,
0.8331997, 1.843933, -0.624222, 0.7294118, 0, 1, 1,
0.8335364, -0.5558063, 3.305829, 0.7333333, 0, 1, 1,
0.8340523, -0.1334809, 1.523544, 0.7411765, 0, 1, 1,
0.8398364, 0.4070138, 1.073026, 0.7450981, 0, 1, 1,
0.8421103, -0.7962469, 2.557832, 0.7529412, 0, 1, 1,
0.8427982, 0.4990473, 0.4807306, 0.7568628, 0, 1, 1,
0.8438694, -0.9557114, 2.091105, 0.7647059, 0, 1, 1,
0.8454899, -1.285458, 1.986814, 0.7686275, 0, 1, 1,
0.8557052, -0.4177866, 2.49753, 0.7764706, 0, 1, 1,
0.8558968, -1.352522, 1.784177, 0.7803922, 0, 1, 1,
0.8600065, -0.2381216, 2.748739, 0.7882353, 0, 1, 1,
0.8619063, -0.7189003, 2.797793, 0.7921569, 0, 1, 1,
0.8654003, 0.5010642, 2.03509, 0.8, 0, 1, 1,
0.8758954, -0.4975209, 2.345423, 0.8078431, 0, 1, 1,
0.8774562, -0.02999731, 1.540905, 0.8117647, 0, 1, 1,
0.8791226, -1.293873, 3.05594, 0.8196079, 0, 1, 1,
0.8824484, 0.3600591, 1.343293, 0.8235294, 0, 1, 1,
0.8848427, 0.3428258, 0.8941426, 0.8313726, 0, 1, 1,
0.886022, -0.9599497, 2.749968, 0.8352941, 0, 1, 1,
0.8870758, 1.425171, 2.45805, 0.8431373, 0, 1, 1,
0.8880887, -1.120791, 1.315425, 0.8470588, 0, 1, 1,
0.8921531, 1.529326, 1.195893, 0.854902, 0, 1, 1,
0.8936649, 0.918362, -0.007458282, 0.8588235, 0, 1, 1,
0.8937663, -0.63645, 0.2419232, 0.8666667, 0, 1, 1,
0.8993851, 0.265731, 2.24132, 0.8705882, 0, 1, 1,
0.9014633, 0.22126, 2.623817, 0.8784314, 0, 1, 1,
0.9062964, -0.4460409, 2.812388, 0.8823529, 0, 1, 1,
0.9096174, 1.061144, 0.7061806, 0.8901961, 0, 1, 1,
0.9141577, -0.04229515, 1.07897, 0.8941177, 0, 1, 1,
0.9154353, -0.7923872, 0.708185, 0.9019608, 0, 1, 1,
0.9204019, -1.882717, 1.752642, 0.9098039, 0, 1, 1,
0.9255109, 1.816454, -1.479176, 0.9137255, 0, 1, 1,
0.9316207, -0.3184664, 2.760908, 0.9215686, 0, 1, 1,
0.9359086, -0.3517527, 2.578412, 0.9254902, 0, 1, 1,
0.9426082, 0.9621319, -0.1482412, 0.9333333, 0, 1, 1,
0.9438162, 1.010461, 1.026894, 0.9372549, 0, 1, 1,
0.9453328, -1.27869, 2.733135, 0.945098, 0, 1, 1,
0.9480377, -0.1383752, 0.4422989, 0.9490196, 0, 1, 1,
0.9510887, -0.4691935, 2.764521, 0.9568627, 0, 1, 1,
0.9539774, -0.1304676, 2.171366, 0.9607843, 0, 1, 1,
0.9649869, -0.3686965, 1.512955, 0.9686275, 0, 1, 1,
0.9682799, 0.8763036, 0.4607477, 0.972549, 0, 1, 1,
0.9703999, -1.125543, 3.085824, 0.9803922, 0, 1, 1,
0.9727407, 0.8909371, 0.7022384, 0.9843137, 0, 1, 1,
0.9740707, 0.7427969, 0.7915208, 0.9921569, 0, 1, 1,
0.9748883, 0.05649405, 2.771821, 0.9960784, 0, 1, 1,
0.9755383, -0.4147695, -0.1230346, 1, 0, 0.9960784, 1,
0.9787085, 1.088397, 0.7800192, 1, 0, 0.9882353, 1,
0.9797395, 0.2959436, 1.948618, 1, 0, 0.9843137, 1,
0.9820136, -0.4662352, 2.019808, 1, 0, 0.9764706, 1,
0.9829537, -0.524685, 2.379225, 1, 0, 0.972549, 1,
0.9837182, 2.042, 1.571299, 1, 0, 0.9647059, 1,
0.9868159, -0.4818245, 1.195662, 1, 0, 0.9607843, 1,
0.9916488, 0.3790155, 0.9966733, 1, 0, 0.9529412, 1,
0.9919616, 1.110134, 2.031394, 1, 0, 0.9490196, 1,
1.0001, 1.517341, -1.076275, 1, 0, 0.9411765, 1,
1.002267, 0.1532174, 3.047751, 1, 0, 0.9372549, 1,
1.005336, 0.3338874, 1.351774, 1, 0, 0.9294118, 1,
1.010902, 0.02606538, 0.7460031, 1, 0, 0.9254902, 1,
1.025094, -0.5049584, 3.934996, 1, 0, 0.9176471, 1,
1.027882, 0.9443739, 1.37664, 1, 0, 0.9137255, 1,
1.043166, -0.8070211, 3.986509, 1, 0, 0.9058824, 1,
1.049305, 0.4638978, 0.06327938, 1, 0, 0.9019608, 1,
1.054479, 0.2521613, 2.554063, 1, 0, 0.8941177, 1,
1.064859, -2.309021, 2.090508, 1, 0, 0.8862745, 1,
1.073443, -1.271728, 3.365506, 1, 0, 0.8823529, 1,
1.076843, -1.96439, 3.013139, 1, 0, 0.8745098, 1,
1.081621, 1.850966, -0.937691, 1, 0, 0.8705882, 1,
1.08755, -2.154163, 3.678815, 1, 0, 0.8627451, 1,
1.088175, 0.8200967, 1.224026, 1, 0, 0.8588235, 1,
1.095404, -0.5071182, 1.983988, 1, 0, 0.8509804, 1,
1.096269, 1.53137, -1.024537, 1, 0, 0.8470588, 1,
1.09772, -0.3725017, 1.627439, 1, 0, 0.8392157, 1,
1.103137, -0.4336864, 2.514861, 1, 0, 0.8352941, 1,
1.104943, 0.3229755, 1.480219, 1, 0, 0.827451, 1,
1.110095, -1.783934, 3.494022, 1, 0, 0.8235294, 1,
1.123565, -1.306949, 2.271398, 1, 0, 0.8156863, 1,
1.128246, 0.4416686, 0.9189178, 1, 0, 0.8117647, 1,
1.128527, 1.746769, -0.2720391, 1, 0, 0.8039216, 1,
1.129293, 0.6880559, 1.457119, 1, 0, 0.7960784, 1,
1.14255, 1.482042, 0.5404029, 1, 0, 0.7921569, 1,
1.145694, -0.915351, 1.806678, 1, 0, 0.7843137, 1,
1.14743, 0.6954105, 0.5787961, 1, 0, 0.7803922, 1,
1.150812, 1.073311, -0.4153927, 1, 0, 0.772549, 1,
1.151279, -0.5171067, 3.55301, 1, 0, 0.7686275, 1,
1.153032, 0.00203873, 0.08603792, 1, 0, 0.7607843, 1,
1.154086, -1.506911, 1.857006, 1, 0, 0.7568628, 1,
1.15418, -1.030809, 2.176775, 1, 0, 0.7490196, 1,
1.161057, -0.8388115, 1.265419, 1, 0, 0.7450981, 1,
1.161985, -0.2052122, 0.7616856, 1, 0, 0.7372549, 1,
1.164152, 0.3120581, 2.145458, 1, 0, 0.7333333, 1,
1.170915, 0.4274121, 0.8731644, 1, 0, 0.7254902, 1,
1.184418, 0.1854969, 0.70054, 1, 0, 0.7215686, 1,
1.194036, 0.5061834, 0.8542718, 1, 0, 0.7137255, 1,
1.199544, -0.9298089, 3.150877, 1, 0, 0.7098039, 1,
1.200861, -1.950684, 2.110268, 1, 0, 0.7019608, 1,
1.213642, -1.024657, 4.08605, 1, 0, 0.6941177, 1,
1.220416, 1.189024, -0.005829088, 1, 0, 0.6901961, 1,
1.225622, -0.5129827, 1.563139, 1, 0, 0.682353, 1,
1.245183, -0.2055065, 1.390537, 1, 0, 0.6784314, 1,
1.249694, -0.7960913, 2.260297, 1, 0, 0.6705883, 1,
1.250761, 0.8912748, 1.035783, 1, 0, 0.6666667, 1,
1.259621, 0.03321564, 0.8388506, 1, 0, 0.6588235, 1,
1.274766, 1.506569, 0.3631549, 1, 0, 0.654902, 1,
1.281681, 0.8260687, 1.339313, 1, 0, 0.6470588, 1,
1.285528, 1.920531, 1.592547, 1, 0, 0.6431373, 1,
1.288395, -0.2479832, 0.3915841, 1, 0, 0.6352941, 1,
1.290651, -2.021336, 1.889233, 1, 0, 0.6313726, 1,
1.29716, 0.686666, 0.289087, 1, 0, 0.6235294, 1,
1.306013, 1.699635, 2.493269, 1, 0, 0.6196079, 1,
1.314062, -1.043571, 0.7847822, 1, 0, 0.6117647, 1,
1.319718, 0.7016848, -0.5952463, 1, 0, 0.6078432, 1,
1.322745, 0.03034433, 0.7333494, 1, 0, 0.6, 1,
1.336202, -0.1290638, 1.470604, 1, 0, 0.5921569, 1,
1.336512, 0.0383445, 1.67289, 1, 0, 0.5882353, 1,
1.3507, 2.127601, 0.3608598, 1, 0, 0.5803922, 1,
1.351638, 2.714472, -0.01839912, 1, 0, 0.5764706, 1,
1.356726, -0.1031956, 0.7746774, 1, 0, 0.5686275, 1,
1.363195, 1.099773, 1.358308, 1, 0, 0.5647059, 1,
1.366297, -0.5185055, 0.3575059, 1, 0, 0.5568628, 1,
1.382905, 0.1447632, 1.431838, 1, 0, 0.5529412, 1,
1.411956, 0.6050063, 0.7645878, 1, 0, 0.5450981, 1,
1.419877, 0.2345128, 0.7098525, 1, 0, 0.5411765, 1,
1.423882, -0.6021952, 1.602423, 1, 0, 0.5333334, 1,
1.424641, -0.4608531, 4.140338, 1, 0, 0.5294118, 1,
1.440552, 1.328268, 2.258557, 1, 0, 0.5215687, 1,
1.453547, 0.9826162, 0.9815065, 1, 0, 0.5176471, 1,
1.456758, 0.1168262, 1.734991, 1, 0, 0.509804, 1,
1.462414, 1.390993, -0.1707788, 1, 0, 0.5058824, 1,
1.463737, -1.118846, 0.5101898, 1, 0, 0.4980392, 1,
1.46467, -0.04401459, 2.332366, 1, 0, 0.4901961, 1,
1.482077, 1.489132, 2.214232, 1, 0, 0.4862745, 1,
1.482706, -1.00273, 1.09953, 1, 0, 0.4784314, 1,
1.484158, -0.9036894, 3.212041, 1, 0, 0.4745098, 1,
1.489952, 1.112648, -0.6620185, 1, 0, 0.4666667, 1,
1.49243, -0.1366258, 0.9440506, 1, 0, 0.4627451, 1,
1.511017, 0.2936454, 0.6015404, 1, 0, 0.454902, 1,
1.51325, -1.369036, 2.180386, 1, 0, 0.4509804, 1,
1.524959, 1.627293, 0.9438132, 1, 0, 0.4431373, 1,
1.541435, 1.392232, 1.410833, 1, 0, 0.4392157, 1,
1.553868, 0.3202797, 2.335695, 1, 0, 0.4313726, 1,
1.560888, -0.2878556, 3.140925, 1, 0, 0.427451, 1,
1.564064, -1.365916, 3.258656, 1, 0, 0.4196078, 1,
1.570835, 1.042638, 1.53908, 1, 0, 0.4156863, 1,
1.588644, 0.950294, 0.6806163, 1, 0, 0.4078431, 1,
1.592829, 0.6170501, 2.50898, 1, 0, 0.4039216, 1,
1.605774, -1.505986, 1.86962, 1, 0, 0.3960784, 1,
1.61069, -0.1654528, 1.027175, 1, 0, 0.3882353, 1,
1.612739, -1.128896, 2.948745, 1, 0, 0.3843137, 1,
1.626186, 0.4770741, 0.5811448, 1, 0, 0.3764706, 1,
1.629135, -0.03560449, 3.476836, 1, 0, 0.372549, 1,
1.6364, -0.6642143, 1.812223, 1, 0, 0.3647059, 1,
1.638425, -0.3069693, 1.04064, 1, 0, 0.3607843, 1,
1.640684, -0.5226209, 1.923114, 1, 0, 0.3529412, 1,
1.64748, -0.3883325, 2.72533, 1, 0, 0.3490196, 1,
1.666523, 0.8637466, 0.4910249, 1, 0, 0.3411765, 1,
1.671401, 0.3203453, 0.03937773, 1, 0, 0.3372549, 1,
1.673837, -1.194438, 1.996043, 1, 0, 0.3294118, 1,
1.682934, 0.5878459, 1.151016, 1, 0, 0.3254902, 1,
1.685868, 0.9013622, 1.704173, 1, 0, 0.3176471, 1,
1.69053, -0.07031821, 0.3654029, 1, 0, 0.3137255, 1,
1.700643, -0.2596459, 1.977837, 1, 0, 0.3058824, 1,
1.703472, -0.9201216, 1.956185, 1, 0, 0.2980392, 1,
1.73236, -0.3857243, 2.852184, 1, 0, 0.2941177, 1,
1.738585, -0.1082337, 1.947229, 1, 0, 0.2862745, 1,
1.739588, 0.4481954, 1.777038, 1, 0, 0.282353, 1,
1.753701, 0.7690104, 1.799806, 1, 0, 0.2745098, 1,
1.760923, -1.777448, 3.729903, 1, 0, 0.2705882, 1,
1.768962, 0.5007349, 2.470415, 1, 0, 0.2627451, 1,
1.774357, -1.010144, 2.592319, 1, 0, 0.2588235, 1,
1.797155, -0.2192913, 2.374782, 1, 0, 0.2509804, 1,
1.806099, -0.6628914, 1.517996, 1, 0, 0.2470588, 1,
1.832796, -0.672755, 2.03206, 1, 0, 0.2392157, 1,
1.860443, 1.137603, 1.651647, 1, 0, 0.2352941, 1,
1.861528, 0.02617212, 2.435902, 1, 0, 0.227451, 1,
1.873594, -0.05261698, 1.167061, 1, 0, 0.2235294, 1,
1.875991, 1.196824, 1.508265, 1, 0, 0.2156863, 1,
1.878345, 0.9976522, 1.336422, 1, 0, 0.2117647, 1,
1.881665, -0.1768201, 2.650186, 1, 0, 0.2039216, 1,
1.892804, -0.5024747, 1.00863, 1, 0, 0.1960784, 1,
1.922767, 0.4246722, 0.3837705, 1, 0, 0.1921569, 1,
1.92487, -1.814343, 3.837229, 1, 0, 0.1843137, 1,
1.933285, 0.811065, 1.507176, 1, 0, 0.1803922, 1,
1.959357, -0.5499036, -0.471746, 1, 0, 0.172549, 1,
1.968421, 0.8835135, 2.009394, 1, 0, 0.1686275, 1,
1.980071, 0.4092994, 0.2948869, 1, 0, 0.1607843, 1,
1.99641, -0.4609171, 0.9997012, 1, 0, 0.1568628, 1,
2.033358, 0.8259051, 2.168781, 1, 0, 0.1490196, 1,
2.039246, 0.5056493, 1.552514, 1, 0, 0.145098, 1,
2.051971, -0.2245889, 2.010983, 1, 0, 0.1372549, 1,
2.053507, 0.5837398, 2.606712, 1, 0, 0.1333333, 1,
2.069681, -1.24911, 1.905094, 1, 0, 0.1254902, 1,
2.073465, 0.3340279, -1.154235, 1, 0, 0.1215686, 1,
2.079288, 0.8466935, 2.666987, 1, 0, 0.1137255, 1,
2.091295, -0.927395, 1.321823, 1, 0, 0.1098039, 1,
2.117851, -0.8197801, 1.136026, 1, 0, 0.1019608, 1,
2.121651, 0.2474656, 1.131298, 1, 0, 0.09411765, 1,
2.18033, -0.5554305, 2.042663, 1, 0, 0.09019608, 1,
2.217364, -0.2846185, 0.8851271, 1, 0, 0.08235294, 1,
2.224729, -0.5171609, 2.150671, 1, 0, 0.07843138, 1,
2.228094, -0.2698098, -0.09636874, 1, 0, 0.07058824, 1,
2.246436, -0.07609833, 2.171985, 1, 0, 0.06666667, 1,
2.360297, -0.1867386, 0.5936428, 1, 0, 0.05882353, 1,
2.381497, 0.3300921, 1.395496, 1, 0, 0.05490196, 1,
2.445109, -0.08155253, 1.090335, 1, 0, 0.04705882, 1,
2.483228, 0.2040835, 1.120964, 1, 0, 0.04313726, 1,
2.533264, 0.1977961, -0.2358553, 1, 0, 0.03529412, 1,
2.654473, -0.9739191, 1.248172, 1, 0, 0.03137255, 1,
2.733781, 0.2495165, 1.939426, 1, 0, 0.02352941, 1,
2.880076, -0.2348945, -0.006893057, 1, 0, 0.01960784, 1,
2.938513, 0.8095949, 3.427186, 1, 0, 0.01176471, 1,
3.119504, 1.295027, -0.0579605, 1, 0, 0.007843138, 1
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
0.04167163, -4.613522, -7.27234, 0, -0.5, 0.5, 0.5,
0.04167163, -4.613522, -7.27234, 1, -0.5, 0.5, 0.5,
0.04167163, -4.613522, -7.27234, 1, 1.5, 0.5, 0.5,
0.04167163, -4.613522, -7.27234, 0, 1.5, 0.5, 0.5
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
-4.079545, -0.05776536, -7.27234, 0, -0.5, 0.5, 0.5,
-4.079545, -0.05776536, -7.27234, 1, -0.5, 0.5, 0.5,
-4.079545, -0.05776536, -7.27234, 1, 1.5, 0.5, 0.5,
-4.079545, -0.05776536, -7.27234, 0, 1.5, 0.5, 0.5
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
-4.079545, -4.613522, -0.109787, 0, -0.5, 0.5, 0.5,
-4.079545, -4.613522, -0.109787, 1, -0.5, 0.5, 0.5,
-4.079545, -4.613522, -0.109787, 1, 1.5, 0.5, 0.5,
-4.079545, -4.613522, -0.109787, 0, 1.5, 0.5, 0.5
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
-3, -3.562194, -5.619443,
3, -3.562194, -5.619443,
-3, -3.562194, -5.619443,
-3, -3.737415, -5.894926,
-2, -3.562194, -5.619443,
-2, -3.737415, -5.894926,
-1, -3.562194, -5.619443,
-1, -3.737415, -5.894926,
0, -3.562194, -5.619443,
0, -3.737415, -5.894926,
1, -3.562194, -5.619443,
1, -3.737415, -5.894926,
2, -3.562194, -5.619443,
2, -3.737415, -5.894926,
3, -3.562194, -5.619443,
3, -3.737415, -5.894926
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
-3, -4.087858, -6.445891, 0, -0.5, 0.5, 0.5,
-3, -4.087858, -6.445891, 1, -0.5, 0.5, 0.5,
-3, -4.087858, -6.445891, 1, 1.5, 0.5, 0.5,
-3, -4.087858, -6.445891, 0, 1.5, 0.5, 0.5,
-2, -4.087858, -6.445891, 0, -0.5, 0.5, 0.5,
-2, -4.087858, -6.445891, 1, -0.5, 0.5, 0.5,
-2, -4.087858, -6.445891, 1, 1.5, 0.5, 0.5,
-2, -4.087858, -6.445891, 0, 1.5, 0.5, 0.5,
-1, -4.087858, -6.445891, 0, -0.5, 0.5, 0.5,
-1, -4.087858, -6.445891, 1, -0.5, 0.5, 0.5,
-1, -4.087858, -6.445891, 1, 1.5, 0.5, 0.5,
-1, -4.087858, -6.445891, 0, 1.5, 0.5, 0.5,
0, -4.087858, -6.445891, 0, -0.5, 0.5, 0.5,
0, -4.087858, -6.445891, 1, -0.5, 0.5, 0.5,
0, -4.087858, -6.445891, 1, 1.5, 0.5, 0.5,
0, -4.087858, -6.445891, 0, 1.5, 0.5, 0.5,
1, -4.087858, -6.445891, 0, -0.5, 0.5, 0.5,
1, -4.087858, -6.445891, 1, -0.5, 0.5, 0.5,
1, -4.087858, -6.445891, 1, 1.5, 0.5, 0.5,
1, -4.087858, -6.445891, 0, 1.5, 0.5, 0.5,
2, -4.087858, -6.445891, 0, -0.5, 0.5, 0.5,
2, -4.087858, -6.445891, 1, -0.5, 0.5, 0.5,
2, -4.087858, -6.445891, 1, 1.5, 0.5, 0.5,
2, -4.087858, -6.445891, 0, 1.5, 0.5, 0.5,
3, -4.087858, -6.445891, 0, -0.5, 0.5, 0.5,
3, -4.087858, -6.445891, 1, -0.5, 0.5, 0.5,
3, -4.087858, -6.445891, 1, 1.5, 0.5, 0.5,
3, -4.087858, -6.445891, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.128495, -3, -5.619443,
-3.128495, 3, -5.619443,
-3.128495, -3, -5.619443,
-3.287004, -3, -5.894926,
-3.128495, -2, -5.619443,
-3.287004, -2, -5.894926,
-3.128495, -1, -5.619443,
-3.287004, -1, -5.894926,
-3.128495, 0, -5.619443,
-3.287004, 0, -5.894926,
-3.128495, 1, -5.619443,
-3.287004, 1, -5.894926,
-3.128495, 2, -5.619443,
-3.287004, 2, -5.894926,
-3.128495, 3, -5.619443,
-3.287004, 3, -5.894926
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
"2",
"3"
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
-3.604021, -3, -6.445891, 0, -0.5, 0.5, 0.5,
-3.604021, -3, -6.445891, 1, -0.5, 0.5, 0.5,
-3.604021, -3, -6.445891, 1, 1.5, 0.5, 0.5,
-3.604021, -3, -6.445891, 0, 1.5, 0.5, 0.5,
-3.604021, -2, -6.445891, 0, -0.5, 0.5, 0.5,
-3.604021, -2, -6.445891, 1, -0.5, 0.5, 0.5,
-3.604021, -2, -6.445891, 1, 1.5, 0.5, 0.5,
-3.604021, -2, -6.445891, 0, 1.5, 0.5, 0.5,
-3.604021, -1, -6.445891, 0, -0.5, 0.5, 0.5,
-3.604021, -1, -6.445891, 1, -0.5, 0.5, 0.5,
-3.604021, -1, -6.445891, 1, 1.5, 0.5, 0.5,
-3.604021, -1, -6.445891, 0, 1.5, 0.5, 0.5,
-3.604021, 0, -6.445891, 0, -0.5, 0.5, 0.5,
-3.604021, 0, -6.445891, 1, -0.5, 0.5, 0.5,
-3.604021, 0, -6.445891, 1, 1.5, 0.5, 0.5,
-3.604021, 0, -6.445891, 0, 1.5, 0.5, 0.5,
-3.604021, 1, -6.445891, 0, -0.5, 0.5, 0.5,
-3.604021, 1, -6.445891, 1, -0.5, 0.5, 0.5,
-3.604021, 1, -6.445891, 1, 1.5, 0.5, 0.5,
-3.604021, 1, -6.445891, 0, 1.5, 0.5, 0.5,
-3.604021, 2, -6.445891, 0, -0.5, 0.5, 0.5,
-3.604021, 2, -6.445891, 1, -0.5, 0.5, 0.5,
-3.604021, 2, -6.445891, 1, 1.5, 0.5, 0.5,
-3.604021, 2, -6.445891, 0, 1.5, 0.5, 0.5,
-3.604021, 3, -6.445891, 0, -0.5, 0.5, 0.5,
-3.604021, 3, -6.445891, 1, -0.5, 0.5, 0.5,
-3.604021, 3, -6.445891, 1, 1.5, 0.5, 0.5,
-3.604021, 3, -6.445891, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.128495, -3.562194, -4,
-3.128495, -3.562194, 4,
-3.128495, -3.562194, -4,
-3.287004, -3.737415, -4,
-3.128495, -3.562194, -2,
-3.287004, -3.737415, -2,
-3.128495, -3.562194, 0,
-3.287004, -3.737415, 0,
-3.128495, -3.562194, 2,
-3.287004, -3.737415, 2,
-3.128495, -3.562194, 4,
-3.287004, -3.737415, 4
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
-3.604021, -4.087858, -4, 0, -0.5, 0.5, 0.5,
-3.604021, -4.087858, -4, 1, -0.5, 0.5, 0.5,
-3.604021, -4.087858, -4, 1, 1.5, 0.5, 0.5,
-3.604021, -4.087858, -4, 0, 1.5, 0.5, 0.5,
-3.604021, -4.087858, -2, 0, -0.5, 0.5, 0.5,
-3.604021, -4.087858, -2, 1, -0.5, 0.5, 0.5,
-3.604021, -4.087858, -2, 1, 1.5, 0.5, 0.5,
-3.604021, -4.087858, -2, 0, 1.5, 0.5, 0.5,
-3.604021, -4.087858, 0, 0, -0.5, 0.5, 0.5,
-3.604021, -4.087858, 0, 1, -0.5, 0.5, 0.5,
-3.604021, -4.087858, 0, 1, 1.5, 0.5, 0.5,
-3.604021, -4.087858, 0, 0, 1.5, 0.5, 0.5,
-3.604021, -4.087858, 2, 0, -0.5, 0.5, 0.5,
-3.604021, -4.087858, 2, 1, -0.5, 0.5, 0.5,
-3.604021, -4.087858, 2, 1, 1.5, 0.5, 0.5,
-3.604021, -4.087858, 2, 0, 1.5, 0.5, 0.5,
-3.604021, -4.087858, 4, 0, -0.5, 0.5, 0.5,
-3.604021, -4.087858, 4, 1, -0.5, 0.5, 0.5,
-3.604021, -4.087858, 4, 1, 1.5, 0.5, 0.5,
-3.604021, -4.087858, 4, 0, 1.5, 0.5, 0.5
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
-3.128495, -3.562194, -5.619443,
-3.128495, 3.446663, -5.619443,
-3.128495, -3.562194, 5.399869,
-3.128495, 3.446663, 5.399869,
-3.128495, -3.562194, -5.619443,
-3.128495, -3.562194, 5.399869,
-3.128495, 3.446663, -5.619443,
-3.128495, 3.446663, 5.399869,
-3.128495, -3.562194, -5.619443,
3.211839, -3.562194, -5.619443,
-3.128495, -3.562194, 5.399869,
3.211839, -3.562194, 5.399869,
-3.128495, 3.446663, -5.619443,
3.211839, 3.446663, -5.619443,
-3.128495, 3.446663, 5.399869,
3.211839, 3.446663, 5.399869,
3.211839, -3.562194, -5.619443,
3.211839, 3.446663, -5.619443,
3.211839, -3.562194, 5.399869,
3.211839, 3.446663, 5.399869,
3.211839, -3.562194, -5.619443,
3.211839, -3.562194, 5.399869,
3.211839, 3.446663, -5.619443,
3.211839, 3.446663, 5.399869
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
var radius = 7.751904;
var distance = 34.48909;
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
mvMatrix.translate( -0.04167163, 0.05776536, 0.109787 );
mvMatrix.scale( 1.321935, 1.195846, 0.7606201 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.48909);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Metolcarb<-read.table("Metolcarb.xyz")
```

```
## Error in read.table("Metolcarb.xyz"): no lines available in input
```

```r
x<-Metolcarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Metolcarb' not found
```

```r
y<-Metolcarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Metolcarb' not found
```

```r
z<-Metolcarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Metolcarb' not found
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
-3.03616, 0.3722287, -2.093896, 0, 0, 1, 1, 1,
-2.659274, 0.8457515, -3.337547, 1, 0, 0, 1, 1,
-2.52595, -0.5410175, 0.9115914, 1, 0, 0, 1, 1,
-2.525726, -1.263397, -1.258609, 1, 0, 0, 1, 1,
-2.506134, 0.1367997, 0.4101701, 1, 0, 0, 1, 1,
-2.476641, -0.5824515, -2.126212, 1, 0, 0, 1, 1,
-2.415939, 0.1985423, -2.982794, 0, 0, 0, 1, 1,
-2.318135, 1.778102, -0.02637233, 0, 0, 0, 1, 1,
-2.307545, -1.487743, -2.687571, 0, 0, 0, 1, 1,
-2.197052, 0.8865343, -1.412903, 0, 0, 0, 1, 1,
-2.192672, 0.2155743, -3.693112, 0, 0, 0, 1, 1,
-2.147579, -0.8349764, -0.7844008, 0, 0, 0, 1, 1,
-2.086204, -0.7649494, -2.272686, 0, 0, 0, 1, 1,
-2.085351, 1.058071, -0.7848017, 1, 1, 1, 1, 1,
-2.074619, 0.6033273, -2.102329, 1, 1, 1, 1, 1,
-2.060227, 0.7343798, 0.1732379, 1, 1, 1, 1, 1,
-2.039991, 1.381982, -2.716076, 1, 1, 1, 1, 1,
-2.026239, 1.301094, -1.766762, 1, 1, 1, 1, 1,
-2.017344, -0.2151809, -1.411805, 1, 1, 1, 1, 1,
-2.013025, -1.164232, -2.041086, 1, 1, 1, 1, 1,
-1.984001, -0.9756086, -1.989597, 1, 1, 1, 1, 1,
-1.978965, 0.6121771, 0.4436444, 1, 1, 1, 1, 1,
-1.956191, -0.5094928, -1.796209, 1, 1, 1, 1, 1,
-1.955118, -0.1181723, -3.690371, 1, 1, 1, 1, 1,
-1.942978, 2.654873, -1.578914, 1, 1, 1, 1, 1,
-1.934079, -1.453711, -1.536441, 1, 1, 1, 1, 1,
-1.915253, 0.4485713, -2.30368, 1, 1, 1, 1, 1,
-1.906447, 0.06514972, -1.227886, 1, 1, 1, 1, 1,
-1.900191, 0.08392555, -2.339927, 0, 0, 1, 1, 1,
-1.895237, -0.7853475, -4.747514, 1, 0, 0, 1, 1,
-1.887057, -0.6138068, -2.353481, 1, 0, 0, 1, 1,
-1.874449, 0.1752396, -2.10575, 1, 0, 0, 1, 1,
-1.861189, 1.067134, -0.812212, 1, 0, 0, 1, 1,
-1.855993, -2.20796, -1.59336, 1, 0, 0, 1, 1,
-1.844806, 0.2217726, -2.816004, 0, 0, 0, 1, 1,
-1.814118, -0.1347343, -0.2517478, 0, 0, 0, 1, 1,
-1.811378, 0.9629944, -0.7439829, 0, 0, 0, 1, 1,
-1.803174, 0.3376232, -2.390995, 0, 0, 0, 1, 1,
-1.795667, 1.069357, -1.317133, 0, 0, 0, 1, 1,
-1.770524, -1.960667, -2.988453, 0, 0, 0, 1, 1,
-1.770183, -0.3770638, -3.630605, 0, 0, 0, 1, 1,
-1.762051, -0.2545896, -0.1917076, 1, 1, 1, 1, 1,
-1.725617, -0.5593973, -1.31793, 1, 1, 1, 1, 1,
-1.71806, 0.4552826, -1.229908, 1, 1, 1, 1, 1,
-1.714463, -0.3735584, -1.619627, 1, 1, 1, 1, 1,
-1.705769, -0.3235303, 0.4282158, 1, 1, 1, 1, 1,
-1.672603, -0.1233904, -2.135643, 1, 1, 1, 1, 1,
-1.671955, 1.28685, -0.9380136, 1, 1, 1, 1, 1,
-1.629365, -0.4664669, -0.9868417, 1, 1, 1, 1, 1,
-1.606354, 0.19049, -1.996656, 1, 1, 1, 1, 1,
-1.602615, -0.02029551, -2.701559, 1, 1, 1, 1, 1,
-1.599863, -0.9491158, -2.580484, 1, 1, 1, 1, 1,
-1.586873, -0.9590539, -1.175958, 1, 1, 1, 1, 1,
-1.582987, -0.4648697, -0.7033991, 1, 1, 1, 1, 1,
-1.562532, 1.335554, 0.2588972, 1, 1, 1, 1, 1,
-1.561026, -0.006822526, -2.41069, 1, 1, 1, 1, 1,
-1.555271, 0.713358, -2.804114, 0, 0, 1, 1, 1,
-1.550168, -1.07954, -2.076563, 1, 0, 0, 1, 1,
-1.538191, -1.24157, -2.956124, 1, 0, 0, 1, 1,
-1.525501, -0.03300838, -2.082864, 1, 0, 0, 1, 1,
-1.497082, -0.9625069, -2.266961, 1, 0, 0, 1, 1,
-1.48751, -1.362699, -2.687429, 1, 0, 0, 1, 1,
-1.479338, -2.659237, -3.080533, 0, 0, 0, 1, 1,
-1.47651, 0.3028733, -1.79169, 0, 0, 0, 1, 1,
-1.461585, 0.8761196, 0.5881256, 0, 0, 0, 1, 1,
-1.448266, 1.151085, 0.06948616, 0, 0, 0, 1, 1,
-1.445303, -0.7403455, -0.6673697, 0, 0, 0, 1, 1,
-1.438385, -0.8686669, -2.018066, 0, 0, 0, 1, 1,
-1.431335, -0.9034143, -2.248163, 0, 0, 0, 1, 1,
-1.423321, 0.9728948, -1.497021, 1, 1, 1, 1, 1,
-1.422267, -0.728453, -1.518597, 1, 1, 1, 1, 1,
-1.412765, 0.6364976, -0.9850579, 1, 1, 1, 1, 1,
-1.410519, 0.2338601, -0.5018143, 1, 1, 1, 1, 1,
-1.409422, 0.3727226, -1.390859, 1, 1, 1, 1, 1,
-1.3967, -0.7599787, -2.693302, 1, 1, 1, 1, 1,
-1.396551, -0.5180898, -2.668763, 1, 1, 1, 1, 1,
-1.394328, -0.6955349, -1.866201, 1, 1, 1, 1, 1,
-1.38485, 1.001901, -1.092784, 1, 1, 1, 1, 1,
-1.383626, 0.8797101, -0.138804, 1, 1, 1, 1, 1,
-1.382859, -1.670711, -4.556532, 1, 1, 1, 1, 1,
-1.379449, -0.6344864, -4.063813, 1, 1, 1, 1, 1,
-1.369557, -0.8599322, -2.45346, 1, 1, 1, 1, 1,
-1.345969, -1.478035, -2.155215, 1, 1, 1, 1, 1,
-1.34403, -0.6079916, -3.523017, 1, 1, 1, 1, 1,
-1.341774, -0.9350607, -2.826328, 0, 0, 1, 1, 1,
-1.341292, 0.2216441, -2.663629, 1, 0, 0, 1, 1,
-1.335027, -0.6630964, -1.751538, 1, 0, 0, 1, 1,
-1.334927, -1.000021, -2.014766, 1, 0, 0, 1, 1,
-1.334733, -0.01188146, -1.680185, 1, 0, 0, 1, 1,
-1.331129, 0.5502719, 0.6025934, 1, 0, 0, 1, 1,
-1.326801, -1.176034, -1.116016, 0, 0, 0, 1, 1,
-1.323578, -0.06744418, -0.7295886, 0, 0, 0, 1, 1,
-1.310134, 0.7844222, -0.5109341, 0, 0, 0, 1, 1,
-1.30866, -1.226507, -1.809268, 0, 0, 0, 1, 1,
-1.308538, -1.697136, -1.893511, 0, 0, 0, 1, 1,
-1.304954, -1.34454, -4.025942, 0, 0, 0, 1, 1,
-1.281739, 0.04521805, 0.8411549, 0, 0, 0, 1, 1,
-1.275305, 0.17476, -1.041217, 1, 1, 1, 1, 1,
-1.268314, 0.1779572, -2.326178, 1, 1, 1, 1, 1,
-1.267922, -1.021755, -1.321398, 1, 1, 1, 1, 1,
-1.265147, 0.004871498, -0.3399768, 1, 1, 1, 1, 1,
-1.256459, -0.2897044, -1.45157, 1, 1, 1, 1, 1,
-1.253534, -0.9893492, -3.114335, 1, 1, 1, 1, 1,
-1.25326, -0.7291371, -0.8250378, 1, 1, 1, 1, 1,
-1.231165, -0.1467984, -1.381273, 1, 1, 1, 1, 1,
-1.226403, 2.370932, 1.809683, 1, 1, 1, 1, 1,
-1.22589, -0.3563921, -1.457207, 1, 1, 1, 1, 1,
-1.216363, -0.9098761, -1.698386, 1, 1, 1, 1, 1,
-1.204071, -1.252447, -3.016575, 1, 1, 1, 1, 1,
-1.202281, 1.227964, -1.923403, 1, 1, 1, 1, 1,
-1.197309, 0.4140931, -0.1898003, 1, 1, 1, 1, 1,
-1.194892, 0.2110372, -1.662655, 1, 1, 1, 1, 1,
-1.180457, 0.3207654, -2.944581, 0, 0, 1, 1, 1,
-1.172278, 0.2690493, -1.959997, 1, 0, 0, 1, 1,
-1.164736, -2.028933, -2.113623, 1, 0, 0, 1, 1,
-1.158301, 0.02551448, -1.776904, 1, 0, 0, 1, 1,
-1.157654, -0.5236731, -2.221807, 1, 0, 0, 1, 1,
-1.156084, 1.209475, -1.770869, 1, 0, 0, 1, 1,
-1.154593, -0.8207112, -2.103502, 0, 0, 0, 1, 1,
-1.134421, -1.885556, -4.167877, 0, 0, 0, 1, 1,
-1.126158, 0.8849891, -2.0646, 0, 0, 0, 1, 1,
-1.12473, 0.1739103, -1.33544, 0, 0, 0, 1, 1,
-1.122195, -1.579303, -3.639978, 0, 0, 0, 1, 1,
-1.116531, 2.009939, 0.2227345, 0, 0, 0, 1, 1,
-1.107075, -1.054762, -2.7464, 0, 0, 0, 1, 1,
-1.097596, 1.06048, -0.4490283, 1, 1, 1, 1, 1,
-1.083118, -0.3280205, -0.9538441, 1, 1, 1, 1, 1,
-1.080117, -0.2442094, -2.769264, 1, 1, 1, 1, 1,
-1.06429, -2.426121, -3.888215, 1, 1, 1, 1, 1,
-1.061875, -0.67008, -0.7606619, 1, 1, 1, 1, 1,
-1.05426, 0.4130818, -2.098788, 1, 1, 1, 1, 1,
-1.053922, 0.6679759, 0.1095193, 1, 1, 1, 1, 1,
-1.036232, 1.756075, -0.2194145, 1, 1, 1, 1, 1,
-1.033041, 1.074486, 0.260644, 1, 1, 1, 1, 1,
-1.027205, 0.1066617, -2.053133, 1, 1, 1, 1, 1,
-1.020766, 2.170543, -2.150312, 1, 1, 1, 1, 1,
-1.013693, -1.399215, -1.917729, 1, 1, 1, 1, 1,
-1.00785, -0.3481402, -2.003639, 1, 1, 1, 1, 1,
-1.007654, -0.113269, -2.246454, 1, 1, 1, 1, 1,
-1.006753, 0.2587371, -0.3097709, 1, 1, 1, 1, 1,
-1.005439, 1.154402, -0.7552531, 0, 0, 1, 1, 1,
-1.00127, -0.9344222, -2.327678, 1, 0, 0, 1, 1,
-1.001239, 0.002682108, -3.484069, 1, 0, 0, 1, 1,
-0.990463, 1.584517, 0.2357738, 1, 0, 0, 1, 1,
-0.9887159, 1.376635, -1.138314, 1, 0, 0, 1, 1,
-0.9871975, 0.06882983, -2.624391, 1, 0, 0, 1, 1,
-0.9841768, 1.134675, -1.186857, 0, 0, 0, 1, 1,
-0.9784784, 0.6473495, -1.852433, 0, 0, 0, 1, 1,
-0.9721532, -0.699761, -0.9511178, 0, 0, 0, 1, 1,
-0.9694738, -0.304768, -0.3254779, 0, 0, 0, 1, 1,
-0.9508861, 0.3368812, -0.9026461, 0, 0, 0, 1, 1,
-0.9504556, -0.3443857, -3.90407, 0, 0, 0, 1, 1,
-0.944199, -1.730421, -1.408339, 0, 0, 0, 1, 1,
-0.9412597, -0.6119571, -2.720746, 1, 1, 1, 1, 1,
-0.9403683, 0.0942155, -1.530237, 1, 1, 1, 1, 1,
-0.9310107, 1.427463, 1.846596, 1, 1, 1, 1, 1,
-0.9129191, 2.537727, -0.04295069, 1, 1, 1, 1, 1,
-0.9106625, -0.01505726, -0.3578887, 1, 1, 1, 1, 1,
-0.9087971, -1.660932, -0.4981528, 1, 1, 1, 1, 1,
-0.9056574, -0.4719223, -2.340314, 1, 1, 1, 1, 1,
-0.9034992, -1.491032, -2.516043, 1, 1, 1, 1, 1,
-0.8975588, -1.028258, -2.86509, 1, 1, 1, 1, 1,
-0.8954811, -0.3583106, -1.464778, 1, 1, 1, 1, 1,
-0.8925887, -1.390965, -2.054179, 1, 1, 1, 1, 1,
-0.8883232, 0.1602007, -0.5201932, 1, 1, 1, 1, 1,
-0.8853932, -1.97841, -1.293341, 1, 1, 1, 1, 1,
-0.8828956, 0.245663, -0.6459453, 1, 1, 1, 1, 1,
-0.8824502, -0.7538731, -4.540025, 1, 1, 1, 1, 1,
-0.8773496, -1.001606, -3.021101, 0, 0, 1, 1, 1,
-0.872948, 0.6332035, -0.1248791, 1, 0, 0, 1, 1,
-0.8706498, -0.5877551, -2.310882, 1, 0, 0, 1, 1,
-0.8683243, -0.189002, -3.645884, 1, 0, 0, 1, 1,
-0.867278, -1.106595, -2.715096, 1, 0, 0, 1, 1,
-0.8636603, 0.8829052, -1.539393, 1, 0, 0, 1, 1,
-0.8621131, -0.6500299, -1.936305, 0, 0, 0, 1, 1,
-0.8620531, -0.9147619, -2.792361, 0, 0, 0, 1, 1,
-0.8598843, -0.5368872, -3.07071, 0, 0, 0, 1, 1,
-0.8578749, 1.492429, -2.019201, 0, 0, 0, 1, 1,
-0.8556653, -0.4521706, -0.2493106, 0, 0, 0, 1, 1,
-0.8519564, -0.4737331, -2.082348, 0, 0, 0, 1, 1,
-0.849038, -1.918047, -2.963177, 0, 0, 0, 1, 1,
-0.8396598, -0.8033826, -2.721079, 1, 1, 1, 1, 1,
-0.8368716, -0.2021775, -3.242905, 1, 1, 1, 1, 1,
-0.8367981, -0.8364281, -2.305893, 1, 1, 1, 1, 1,
-0.835602, 0.4613061, 0.3142059, 1, 1, 1, 1, 1,
-0.8315485, 0.7543417, -2.28631, 1, 1, 1, 1, 1,
-0.8153885, -0.1020265, -2.697619, 1, 1, 1, 1, 1,
-0.8142312, 1.696948, -2.138885, 1, 1, 1, 1, 1,
-0.8129388, -0.7627499, -3.728983, 1, 1, 1, 1, 1,
-0.8124552, 0.09650683, -1.983226, 1, 1, 1, 1, 1,
-0.8073943, 0.429633, -0.3255433, 1, 1, 1, 1, 1,
-0.8071612, -1.365386, -3.224705, 1, 1, 1, 1, 1,
-0.8043891, -0.6100584, -1.824189, 1, 1, 1, 1, 1,
-0.797144, 0.4063773, -0.6057777, 1, 1, 1, 1, 1,
-0.7914988, 0.4514033, -0.621951, 1, 1, 1, 1, 1,
-0.7882114, 0.1267124, -1.980853, 1, 1, 1, 1, 1,
-0.7881567, -0.4281119, -2.159277, 0, 0, 1, 1, 1,
-0.7878225, 0.6868578, -1.480803, 1, 0, 0, 1, 1,
-0.7838194, -1.454278, -1.611006, 1, 0, 0, 1, 1,
-0.7754399, -0.4220481, -2.772813, 1, 0, 0, 1, 1,
-0.7720506, -1.671554, -2.384471, 1, 0, 0, 1, 1,
-0.7711825, -1.086771, -4.419473, 1, 0, 0, 1, 1,
-0.7553815, -0.8844001, -1.265986, 0, 0, 0, 1, 1,
-0.7412173, 0.8574333, -0.861924, 0, 0, 0, 1, 1,
-0.7390328, -0.1102449, -1.14326, 0, 0, 0, 1, 1,
-0.7366288, -1.539345, -2.949761, 0, 0, 0, 1, 1,
-0.7324563, -0.9889668, -0.9787707, 0, 0, 0, 1, 1,
-0.7322518, -0.8449399, -0.2271281, 0, 0, 0, 1, 1,
-0.7310143, -1.370228, -3.29307, 0, 0, 0, 1, 1,
-0.7223362, 0.1624645, -0.8081697, 1, 1, 1, 1, 1,
-0.7193187, -0.495659, -1.211879, 1, 1, 1, 1, 1,
-0.7060056, -0.9021946, -2.148663, 1, 1, 1, 1, 1,
-0.7046786, -0.6387699, -4.803251, 1, 1, 1, 1, 1,
-0.7046562, 0.4485147, 0.2037476, 1, 1, 1, 1, 1,
-0.7028726, -3.460123, -3.461116, 1, 1, 1, 1, 1,
-0.7024525, -1.386726, -4.779181, 1, 1, 1, 1, 1,
-0.7014804, -0.6176207, -1.421523, 1, 1, 1, 1, 1,
-0.6994609, 2.17116, -1.619488, 1, 1, 1, 1, 1,
-0.6977487, 0.9704074, -0.4669087, 1, 1, 1, 1, 1,
-0.696817, -0.8574474, -3.89189, 1, 1, 1, 1, 1,
-0.6847533, -0.8094894, -1.487102, 1, 1, 1, 1, 1,
-0.6845278, -0.8634812, -3.991624, 1, 1, 1, 1, 1,
-0.6823737, -0.9122767, -2.911192, 1, 1, 1, 1, 1,
-0.6817191, 1.051209, -0.1640789, 1, 1, 1, 1, 1,
-0.6798242, -0.3877108, -3.085, 0, 0, 1, 1, 1,
-0.6684195, 0.4301123, -1.081892, 1, 0, 0, 1, 1,
-0.6679397, -0.7434019, -2.617225, 1, 0, 0, 1, 1,
-0.6679038, 0.1361411, -0.4965905, 1, 0, 0, 1, 1,
-0.6674573, 0.9766073, -1.101112, 1, 0, 0, 1, 1,
-0.6635167, -0.4925272, -2.154207, 1, 0, 0, 1, 1,
-0.6610695, -1.111466, -1.774518, 0, 0, 0, 1, 1,
-0.6609411, -1.767389, -2.547525, 0, 0, 0, 1, 1,
-0.6558273, 1.031855, -1.743224, 0, 0, 0, 1, 1,
-0.6551461, 0.794545, 1.290887, 0, 0, 0, 1, 1,
-0.6543712, -0.8681288, -2.872215, 0, 0, 0, 1, 1,
-0.6517458, -0.09959603, -2.263623, 0, 0, 0, 1, 1,
-0.6401561, 0.703316, 0.2833171, 0, 0, 0, 1, 1,
-0.6336243, 0.1652347, -1.471393, 1, 1, 1, 1, 1,
-0.631523, 0.2558539, -1.899781, 1, 1, 1, 1, 1,
-0.6306804, 3.344592, 0.7680691, 1, 1, 1, 1, 1,
-0.6304303, -0.1064186, -2.962935, 1, 1, 1, 1, 1,
-0.6257079, -0.2124639, -1.793441, 1, 1, 1, 1, 1,
-0.6246321, 0.3127045, -2.631041, 1, 1, 1, 1, 1,
-0.6226863, -0.8327718, -2.579819, 1, 1, 1, 1, 1,
-0.6225227, -2.434875, -1.12492, 1, 1, 1, 1, 1,
-0.6221886, -0.1537521, -1.9226, 1, 1, 1, 1, 1,
-0.6166293, -0.1539849, -0.9202378, 1, 1, 1, 1, 1,
-0.6161698, 0.6765476, -1.02177, 1, 1, 1, 1, 1,
-0.6160749, 0.6275291, -1.005469, 1, 1, 1, 1, 1,
-0.6151192, 0.4874574, 0.03029827, 1, 1, 1, 1, 1,
-0.6146498, -0.03026512, -1.642926, 1, 1, 1, 1, 1,
-0.6140653, -0.1535303, -2.490033, 1, 1, 1, 1, 1,
-0.6133978, 0.7832837, -1.523283, 0, 0, 1, 1, 1,
-0.6108914, 0.1380996, -1.454147, 1, 0, 0, 1, 1,
-0.6073179, -0.2998853, -1.326334, 1, 0, 0, 1, 1,
-0.5907744, -1.137496, -3.028367, 1, 0, 0, 1, 1,
-0.5846167, -0.7381405, -2.723719, 1, 0, 0, 1, 1,
-0.5800745, -0.54717, -2.059168, 1, 0, 0, 1, 1,
-0.5797343, -0.5053409, -2.579222, 0, 0, 0, 1, 1,
-0.5751913, 0.1633706, 0.01715165, 0, 0, 0, 1, 1,
-0.5742323, 1.462108, 2.381767, 0, 0, 0, 1, 1,
-0.5734703, 1.58512, 0.02168767, 0, 0, 0, 1, 1,
-0.5720793, 0.4185078, -1.173044, 0, 0, 0, 1, 1,
-0.5707283, -0.6551481, -2.563297, 0, 0, 0, 1, 1,
-0.569771, -1.558877, -2.187255, 0, 0, 0, 1, 1,
-0.5641418, -0.05511234, -1.23219, 1, 1, 1, 1, 1,
-0.5634036, 0.04467079, -0.2588175, 1, 1, 1, 1, 1,
-0.5561083, -0.2633646, -0.02024034, 1, 1, 1, 1, 1,
-0.5524707, -1.332851, -4.123227, 1, 1, 1, 1, 1,
-0.5524301, -0.1995293, -2.319814, 1, 1, 1, 1, 1,
-0.5493692, -1.736623, -3.322146, 1, 1, 1, 1, 1,
-0.5434673, -0.3205096, -1.290691, 1, 1, 1, 1, 1,
-0.542821, 0.5354083, -0.2551443, 1, 1, 1, 1, 1,
-0.5404895, -0.3299667, -2.765357, 1, 1, 1, 1, 1,
-0.5390142, 0.7626161, -1.758249, 1, 1, 1, 1, 1,
-0.5367182, 0.2945825, -1.836412, 1, 1, 1, 1, 1,
-0.5343727, -0.4149305, -0.6343871, 1, 1, 1, 1, 1,
-0.5319532, 0.179877, -1.804858, 1, 1, 1, 1, 1,
-0.5303804, -0.7610865, -2.277162, 1, 1, 1, 1, 1,
-0.5302659, -0.8986301, -3.816135, 1, 1, 1, 1, 1,
-0.5286276, 0.01778709, -0.4646826, 0, 0, 1, 1, 1,
-0.5251243, 1.391274, -0.3708724, 1, 0, 0, 1, 1,
-0.5131158, -0.5098683, -1.988178, 1, 0, 0, 1, 1,
-0.5089797, -0.00300055, -2.965455, 1, 0, 0, 1, 1,
-0.5068912, -0.5972674, -1.28201, 1, 0, 0, 1, 1,
-0.5042642, -0.6229604, -2.328584, 1, 0, 0, 1, 1,
-0.5038618, 1.000722, -0.1839933, 0, 0, 0, 1, 1,
-0.5023972, -2.649023, -4.388234, 0, 0, 0, 1, 1,
-0.4993816, -0.2871739, -1.356862, 0, 0, 0, 1, 1,
-0.4972169, -0.4694202, -2.366608, 0, 0, 0, 1, 1,
-0.4965509, 0.2145356, -1.215582, 0, 0, 0, 1, 1,
-0.4949062, -0.9443197, -1.964732, 0, 0, 0, 1, 1,
-0.4944077, 1.990218, 0.2915507, 0, 0, 0, 1, 1,
-0.485096, 1.506504, 0.2750316, 1, 1, 1, 1, 1,
-0.4799441, 1.438624, -1.640252, 1, 1, 1, 1, 1,
-0.4752818, -0.2801246, -1.964946, 1, 1, 1, 1, 1,
-0.472387, -1.691894, -3.504395, 1, 1, 1, 1, 1,
-0.4689363, 0.9188685, 0.05288418, 1, 1, 1, 1, 1,
-0.464873, 0.947899, -1.928037, 1, 1, 1, 1, 1,
-0.460563, -0.7241201, -3.325413, 1, 1, 1, 1, 1,
-0.4599783, -0.2567585, -2.433753, 1, 1, 1, 1, 1,
-0.4585763, 1.027816, 0.415083, 1, 1, 1, 1, 1,
-0.458083, 0.6472081, -0.5549916, 1, 1, 1, 1, 1,
-0.4566894, 0.1483445, -0.2524564, 1, 1, 1, 1, 1,
-0.4565498, -1.253267, -3.688748, 1, 1, 1, 1, 1,
-0.4465952, 0.2297277, 0.1971078, 1, 1, 1, 1, 1,
-0.445292, -0.4646273, -1.087745, 1, 1, 1, 1, 1,
-0.4414304, 0.7053152, -3.290508, 1, 1, 1, 1, 1,
-0.4401711, -0.6028259, -1.528031, 0, 0, 1, 1, 1,
-0.4397163, 2.001509, -0.230692, 1, 0, 0, 1, 1,
-0.4378719, 0.3026695, -1.007174, 1, 0, 0, 1, 1,
-0.4363964, -0.6015238, -2.100691, 1, 0, 0, 1, 1,
-0.4315138, 0.703467, -0.7523976, 1, 0, 0, 1, 1,
-0.4288118, -0.4920143, -2.630445, 1, 0, 0, 1, 1,
-0.4196104, 1.595698, -0.2139635, 0, 0, 0, 1, 1,
-0.416847, -1.725316, -0.787622, 0, 0, 0, 1, 1,
-0.416291, -0.4314359, -3.076774, 0, 0, 0, 1, 1,
-0.4158255, 0.8763818, -1.081189, 0, 0, 0, 1, 1,
-0.413177, 0.3333505, 0.188978, 0, 0, 0, 1, 1,
-0.4104032, -0.3995924, -1.934925, 0, 0, 0, 1, 1,
-0.4100439, 1.627369, -0.9685863, 0, 0, 0, 1, 1,
-0.4065236, -0.09887792, -1.642656, 1, 1, 1, 1, 1,
-0.4058674, -1.808615, -1.527424, 1, 1, 1, 1, 1,
-0.4024239, -0.6840204, -5.458968, 1, 1, 1, 1, 1,
-0.4020668, 1.737055, -1.22011, 1, 1, 1, 1, 1,
-0.3977433, 0.8421932, 0.1087228, 1, 1, 1, 1, 1,
-0.3945148, -0.1947406, -1.918355, 1, 1, 1, 1, 1,
-0.3941793, -0.03682784, -2.847747, 1, 1, 1, 1, 1,
-0.3937298, -0.1801368, -1.501079, 1, 1, 1, 1, 1,
-0.3899265, -0.6100771, -2.425902, 1, 1, 1, 1, 1,
-0.3886744, -1.049014, -3.034993, 1, 1, 1, 1, 1,
-0.3864317, 1.494042, 0.0667851, 1, 1, 1, 1, 1,
-0.3806182, 1.86079, -0.2996447, 1, 1, 1, 1, 1,
-0.3783474, 0.4770024, -0.04079527, 1, 1, 1, 1, 1,
-0.3732019, 0.1912697, -2.769024, 1, 1, 1, 1, 1,
-0.3668325, 0.8522182, -2.49352, 1, 1, 1, 1, 1,
-0.3658846, 0.1094382, -1.649347, 0, 0, 1, 1, 1,
-0.3649796, 0.08100954, -0.7542543, 1, 0, 0, 1, 1,
-0.3618166, -0.08162134, -1.972164, 1, 0, 0, 1, 1,
-0.3566977, -0.1166907, -0.5638465, 1, 0, 0, 1, 1,
-0.356549, -1.177454, -4.677376, 1, 0, 0, 1, 1,
-0.3534395, -0.6449245, -3.150357, 1, 0, 0, 1, 1,
-0.3533792, -0.02611458, -2.618422, 0, 0, 0, 1, 1,
-0.3516335, 2.455589, -0.5878059, 0, 0, 0, 1, 1,
-0.3472881, 1.684046, -0.2872401, 0, 0, 0, 1, 1,
-0.3417052, -0.591216, -3.247175, 0, 0, 0, 1, 1,
-0.3380944, -0.7742517, -1.659483, 0, 0, 0, 1, 1,
-0.3371612, -0.8174284, -3.688726, 0, 0, 0, 1, 1,
-0.3358189, 0.35559, -2.419738, 0, 0, 0, 1, 1,
-0.3341467, 1.247436, 1.017697, 1, 1, 1, 1, 1,
-0.333505, -0.5542644, -3.125108, 1, 1, 1, 1, 1,
-0.3328128, -0.8152317, -1.90618, 1, 1, 1, 1, 1,
-0.3222092, 0.4399479, -1.062765, 1, 1, 1, 1, 1,
-0.3218266, -2.266905, -3.397494, 1, 1, 1, 1, 1,
-0.321064, -0.6659328, -3.432423, 1, 1, 1, 1, 1,
-0.3155052, -0.489012, -2.972534, 1, 1, 1, 1, 1,
-0.3143796, 0.937569, -1.227295, 1, 1, 1, 1, 1,
-0.3117157, -0.5846799, -0.6714442, 1, 1, 1, 1, 1,
-0.3115286, 0.8519511, 0.8039035, 1, 1, 1, 1, 1,
-0.30734, 1.729061, 0.04915797, 1, 1, 1, 1, 1,
-0.305639, -0.1916358, -2.92577, 1, 1, 1, 1, 1,
-0.302093, -0.7746817, -0.1369028, 1, 1, 1, 1, 1,
-0.2982531, 0.2367765, 0.01198628, 1, 1, 1, 1, 1,
-0.2982052, 2.644236, -2.538581, 1, 1, 1, 1, 1,
-0.284427, -1.702869, -1.734413, 0, 0, 1, 1, 1,
-0.283238, -1.389744, -2.143549, 1, 0, 0, 1, 1,
-0.2830307, -0.6884429, -4.118928, 1, 0, 0, 1, 1,
-0.2820531, 0.3613052, -0.5927147, 1, 0, 0, 1, 1,
-0.2779137, 0.2286633, -1.634532, 1, 0, 0, 1, 1,
-0.2698655, -0.7450503, -3.084549, 1, 0, 0, 1, 1,
-0.2674759, 1.646844, 0.8223684, 0, 0, 0, 1, 1,
-0.2672651, 0.4723833, -1.848516, 0, 0, 0, 1, 1,
-0.2669067, 0.9242265, 0.5310737, 0, 0, 0, 1, 1,
-0.262585, -0.5004126, -2.094069, 0, 0, 0, 1, 1,
-0.258894, -1.111161, -1.533822, 0, 0, 0, 1, 1,
-0.2555022, -0.6925082, -3.862397, 0, 0, 0, 1, 1,
-0.2529523, 0.5559379, 1.460694, 0, 0, 0, 1, 1,
-0.2481085, -0.0945896, -1.776447, 1, 1, 1, 1, 1,
-0.2367761, -1.199958, -2.895934, 1, 1, 1, 1, 1,
-0.2339703, 0.8042659, 0.03564109, 1, 1, 1, 1, 1,
-0.2319078, -1.726481, -4.72231, 1, 1, 1, 1, 1,
-0.2307776, 0.5700753, -0.09911069, 1, 1, 1, 1, 1,
-0.2262024, 0.6076794, -0.8363233, 1, 1, 1, 1, 1,
-0.2244821, -1.567804, -3.253134, 1, 1, 1, 1, 1,
-0.2222987, 1.263295, 0.2630827, 1, 1, 1, 1, 1,
-0.2203525, 0.8779477, -0.9241607, 1, 1, 1, 1, 1,
-0.2159928, 1.539175, -0.3405674, 1, 1, 1, 1, 1,
-0.2054577, -0.1861901, -1.536751, 1, 1, 1, 1, 1,
-0.2012119, 0.7534754, -0.3588274, 1, 1, 1, 1, 1,
-0.1984815, -0.4942477, -2.655217, 1, 1, 1, 1, 1,
-0.1961352, -0.224677, -2.720552, 1, 1, 1, 1, 1,
-0.1928833, 0.220426, 0.5420247, 1, 1, 1, 1, 1,
-0.1914245, 0.5728403, -1.091585, 0, 0, 1, 1, 1,
-0.1904875, -0.004952256, -2.871584, 1, 0, 0, 1, 1,
-0.1872387, 1.04169, 0.3196922, 1, 0, 0, 1, 1,
-0.1855759, 1.373627, -0.257896, 1, 0, 0, 1, 1,
-0.1842186, -1.591945, -1.288466, 1, 0, 0, 1, 1,
-0.183954, -2.215666, -2.537587, 1, 0, 0, 1, 1,
-0.1802665, 0.5552175, 0.3000789, 0, 0, 0, 1, 1,
-0.1800202, 0.0735808, -0.4048173, 0, 0, 0, 1, 1,
-0.1780104, -1.753886, -4.29269, 0, 0, 0, 1, 1,
-0.1773397, -1.295598, -3.163693, 0, 0, 0, 1, 1,
-0.1745623, -0.7398894, -4.187934, 0, 0, 0, 1, 1,
-0.1704625, 0.6962555, -0.4029799, 0, 0, 0, 1, 1,
-0.1671649, 0.03423779, -3.475408, 0, 0, 0, 1, 1,
-0.1632771, -2.240339, -3.721302, 1, 1, 1, 1, 1,
-0.1571379, -0.6630957, -3.445733, 1, 1, 1, 1, 1,
-0.1570092, -0.6175807, -4.512988, 1, 1, 1, 1, 1,
-0.1549973, 0.9899462, 0.302996, 1, 1, 1, 1, 1,
-0.1546365, 1.707561, 1.440889, 1, 1, 1, 1, 1,
-0.1542469, 0.39474, 0.8237681, 1, 1, 1, 1, 1,
-0.1495186, -0.9957273, -3.490793, 1, 1, 1, 1, 1,
-0.1490485, -0.1687076, -2.044873, 1, 1, 1, 1, 1,
-0.147931, 0.939673, 0.1657534, 1, 1, 1, 1, 1,
-0.1476683, 0.1513444, 0.4992789, 1, 1, 1, 1, 1,
-0.1423322, 0.9011448, 0.4899904, 1, 1, 1, 1, 1,
-0.1417868, 0.315974, -1.089239, 1, 1, 1, 1, 1,
-0.141141, 0.7271594, 0.4031869, 1, 1, 1, 1, 1,
-0.1397699, -0.1668573, -3.416341, 1, 1, 1, 1, 1,
-0.1379024, 1.439338, -1.662108, 1, 1, 1, 1, 1,
-0.1362977, -0.3123961, -2.236661, 0, 0, 1, 1, 1,
-0.1355872, -0.02786786, -3.116878, 1, 0, 0, 1, 1,
-0.1350631, 0.9350347, -0.07610826, 1, 0, 0, 1, 1,
-0.1318133, -0.8664492, -2.0475, 1, 0, 0, 1, 1,
-0.1275745, 0.4737914, 1.1309, 1, 0, 0, 1, 1,
-0.1275615, 0.1698979, -0.2420944, 1, 0, 0, 1, 1,
-0.1260701, -0.2169681, -1.943415, 0, 0, 0, 1, 1,
-0.125005, -0.5388172, -4.837759, 0, 0, 0, 1, 1,
-0.1246779, -0.09425212, -2.610957, 0, 0, 0, 1, 1,
-0.1245431, 0.3912505, -0.372129, 0, 0, 0, 1, 1,
-0.1236884, -0.5492989, -1.832256, 0, 0, 0, 1, 1,
-0.1217746, -0.5187245, -1.065504, 0, 0, 0, 1, 1,
-0.1211537, -0.1321362, -2.167517, 0, 0, 0, 1, 1,
-0.1200572, 0.7537658, -0.7690411, 1, 1, 1, 1, 1,
-0.1183509, 0.4456344, -2.134708, 1, 1, 1, 1, 1,
-0.1145356, -0.3229675, -3.591202, 1, 1, 1, 1, 1,
-0.1057294, -0.6533446, -2.543789, 1, 1, 1, 1, 1,
-0.1031911, 0.8621329, -0.0362005, 1, 1, 1, 1, 1,
-0.1029447, 1.17547, 1.155062, 1, 1, 1, 1, 1,
-0.09993924, 1.519652, -0.7406242, 1, 1, 1, 1, 1,
-0.08945765, -0.2072248, -1.853756, 1, 1, 1, 1, 1,
-0.08496656, -1.402168, -3.628752, 1, 1, 1, 1, 1,
-0.0808513, -1.117256, -2.493287, 1, 1, 1, 1, 1,
-0.07739858, -0.7635961, -2.09871, 1, 1, 1, 1, 1,
-0.07733883, -1.028616, -4.027221, 1, 1, 1, 1, 1,
-0.07647682, 0.4951614, -0.410861, 1, 1, 1, 1, 1,
-0.07532348, -0.7537339, -2.086416, 1, 1, 1, 1, 1,
-0.06643353, 0.07467581, 0.2486745, 1, 1, 1, 1, 1,
-0.06435271, 0.9670234, 0.02410398, 0, 0, 1, 1, 1,
-0.06331294, -0.3282917, -3.430801, 1, 0, 0, 1, 1,
-0.06241486, -0.0327139, -2.498924, 1, 0, 0, 1, 1,
-0.06019722, -0.752358, -4.75451, 1, 0, 0, 1, 1,
-0.06006189, 1.421147, -0.4340917, 1, 0, 0, 1, 1,
-0.05776476, 0.4965469, 1.319071, 1, 0, 0, 1, 1,
-0.05771, 0.06404319, -0.7992847, 0, 0, 0, 1, 1,
-0.05493741, 1.383087, -1.288872, 0, 0, 0, 1, 1,
-0.05352916, 1.058012, -0.2602397, 0, 0, 0, 1, 1,
-0.05239035, -0.9441961, -2.515091, 0, 0, 0, 1, 1,
-0.05191703, 1.032224, 0.6942843, 0, 0, 0, 1, 1,
-0.05148781, 1.475011, 0.1978419, 0, 0, 0, 1, 1,
-0.04733711, 0.698549, -0.8000559, 0, 0, 0, 1, 1,
-0.04246334, -0.4303863, -2.32713, 1, 1, 1, 1, 1,
-0.03684672, 0.03315497, -0.8620172, 1, 1, 1, 1, 1,
-0.03578279, -0.3390151, -2.989304, 1, 1, 1, 1, 1,
-0.03492311, -0.3679578, -1.363432, 1, 1, 1, 1, 1,
-0.03029764, 0.05265062, -1.05907, 1, 1, 1, 1, 1,
-0.02989925, -2.169949, -2.016961, 1, 1, 1, 1, 1,
-0.02983825, -0.9809831, -4.745235, 1, 1, 1, 1, 1,
-0.02724401, -0.09115417, -1.640997, 1, 1, 1, 1, 1,
-0.02693737, 0.06968673, -0.5100087, 1, 1, 1, 1, 1,
-0.02012077, 2.564501, 0.1997227, 1, 1, 1, 1, 1,
-0.01758705, 1.110924, 1.270532, 1, 1, 1, 1, 1,
-0.0153666, -3.199508, -3.420551, 1, 1, 1, 1, 1,
-0.01167268, 1.255048, -0.3403808, 1, 1, 1, 1, 1,
-0.01091101, 0.340983, -0.4076572, 1, 1, 1, 1, 1,
-0.009545373, -0.263541, -4.870224, 1, 1, 1, 1, 1,
-0.005749356, 0.6591959, 0.7749137, 0, 0, 1, 1, 1,
-0.004764967, 0.1528432, 0.4568469, 1, 0, 0, 1, 1,
0.006467678, -0.8455334, 2.864672, 1, 0, 0, 1, 1,
0.008945811, -0.4527202, 2.833416, 1, 0, 0, 1, 1,
0.009550997, -0.1766702, 2.73967, 1, 0, 0, 1, 1,
0.01452574, -1.726801, 3.979157, 1, 0, 0, 1, 1,
0.01839356, 1.268498, -1.593448, 0, 0, 0, 1, 1,
0.02053561, 0.6268393, 0.3217409, 0, 0, 0, 1, 1,
0.0222173, -0.5442275, 3.515339, 0, 0, 0, 1, 1,
0.02434632, 0.6008186, 0.4030026, 0, 0, 0, 1, 1,
0.02940355, 1.292757, 1.074528, 0, 0, 0, 1, 1,
0.04016054, 0.3894191, 1.239674, 0, 0, 0, 1, 1,
0.04250798, 0.3031425, -0.5681504, 0, 0, 0, 1, 1,
0.04686429, 1.2032, -0.6997991, 1, 1, 1, 1, 1,
0.04896075, -0.02146763, 2.338063, 1, 1, 1, 1, 1,
0.04921833, -0.2939306, 2.837123, 1, 1, 1, 1, 1,
0.05215891, 0.6391612, 2.328392, 1, 1, 1, 1, 1,
0.0530994, 0.2395388, 1.609137, 1, 1, 1, 1, 1,
0.05345495, -0.6621367, 5.239394, 1, 1, 1, 1, 1,
0.0557954, 1.031881, -0.444464, 1, 1, 1, 1, 1,
0.06002928, -0.2472713, 1.72955, 1, 1, 1, 1, 1,
0.06049084, 0.4738328, -0.2638506, 1, 1, 1, 1, 1,
0.06204678, -0.5391302, 3.261096, 1, 1, 1, 1, 1,
0.06322963, -0.8515302, 3.189776, 1, 1, 1, 1, 1,
0.06346892, -0.1993788, 1.424863, 1, 1, 1, 1, 1,
0.06794611, -1.759383, 3.428192, 1, 1, 1, 1, 1,
0.06829883, -0.4502694, 1.55462, 1, 1, 1, 1, 1,
0.075192, 1.233566, -0.9437239, 1, 1, 1, 1, 1,
0.08250633, -0.272661, 1.253713, 0, 0, 1, 1, 1,
0.08611852, -0.1639308, 0.3141621, 1, 0, 0, 1, 1,
0.08618405, -0.1436968, 2.309824, 1, 0, 0, 1, 1,
0.08693686, -0.02163854, 0.3825451, 1, 0, 0, 1, 1,
0.09625039, 2.57581, 0.1403879, 1, 0, 0, 1, 1,
0.09640929, 0.8557522, 0.7908565, 1, 0, 0, 1, 1,
0.09646676, 1.306474, -2.417058, 0, 0, 0, 1, 1,
0.09930953, 0.2223614, 2.074339, 0, 0, 0, 1, 1,
0.1016511, -0.2209224, 3.746947, 0, 0, 0, 1, 1,
0.1061937, 0.4728757, 1.435895, 0, 0, 0, 1, 1,
0.114751, -0.01823993, 0.743261, 0, 0, 0, 1, 1,
0.1156244, -0.347138, 0.9302948, 0, 0, 0, 1, 1,
0.1169998, -0.704993, 3.259822, 0, 0, 0, 1, 1,
0.1190017, -1.400076, 2.119296, 1, 1, 1, 1, 1,
0.128154, 1.31143, 0.7330821, 1, 1, 1, 1, 1,
0.1312467, -1.391386, 3.634807, 1, 1, 1, 1, 1,
0.1335973, -1.607393, 3.054729, 1, 1, 1, 1, 1,
0.1387439, 0.4540668, 0.7792337, 1, 1, 1, 1, 1,
0.1390119, -1.849507, 2.512949, 1, 1, 1, 1, 1,
0.1415921, 0.01647614, 1.012196, 1, 1, 1, 1, 1,
0.1429991, -0.2069196, 3.326399, 1, 1, 1, 1, 1,
0.1432784, -0.5593368, 3.183562, 1, 1, 1, 1, 1,
0.1436477, 0.3799023, 1.614947, 1, 1, 1, 1, 1,
0.1439039, -0.2442738, 4.023931, 1, 1, 1, 1, 1,
0.1462441, 0.1255818, 2.748867, 1, 1, 1, 1, 1,
0.1645596, -1.456581, 3.400497, 1, 1, 1, 1, 1,
0.1687669, 0.3515316, 0.4798269, 1, 1, 1, 1, 1,
0.1696972, 0.5565382, 1.480345, 1, 1, 1, 1, 1,
0.1701155, 0.6649962, -0.5906751, 0, 0, 1, 1, 1,
0.1731558, 1.170461, 0.454743, 1, 0, 0, 1, 1,
0.1795667, -0.1741616, -0.08991977, 1, 0, 0, 1, 1,
0.1806327, -0.936781, 1.282014, 1, 0, 0, 1, 1,
0.1833196, 0.4900612, 1.276571, 1, 0, 0, 1, 1,
0.1838046, -0.3921516, 1.541381, 1, 0, 0, 1, 1,
0.1866478, -0.1995015, 1.834802, 0, 0, 0, 1, 1,
0.1890515, -0.347097, 2.834835, 0, 0, 0, 1, 1,
0.1915435, 0.1171391, 0.697716, 0, 0, 0, 1, 1,
0.1933777, 0.6368223, -0.7873205, 0, 0, 0, 1, 1,
0.1955748, 0.7751692, 0.02660125, 0, 0, 0, 1, 1,
0.1955912, -0.4230849, 5.231326, 0, 0, 0, 1, 1,
0.1966569, 0.06304662, 0.8847058, 0, 0, 0, 1, 1,
0.2024408, 1.112923, 1.08374, 1, 1, 1, 1, 1,
0.207578, 0.01773826, 1.208471, 1, 1, 1, 1, 1,
0.2121694, 1.625798, 0.1619485, 1, 1, 1, 1, 1,
0.2127299, -1.0044, 4.587435, 1, 1, 1, 1, 1,
0.2151642, -0.4335006, 1.977138, 1, 1, 1, 1, 1,
0.2164508, 0.4898221, -0.1983182, 1, 1, 1, 1, 1,
0.2182968, 0.9075083, 0.2703288, 1, 1, 1, 1, 1,
0.2188173, 1.261202, 0.5980439, 1, 1, 1, 1, 1,
0.2207596, 0.1378542, 0.2238417, 1, 1, 1, 1, 1,
0.2246658, -1.065488, 4.126856, 1, 1, 1, 1, 1,
0.2259144, -1.607633, 1.348856, 1, 1, 1, 1, 1,
0.2265531, 1.180574, -0.01954308, 1, 1, 1, 1, 1,
0.226972, 1.167596, -0.07782901, 1, 1, 1, 1, 1,
0.2320266, -0.1375448, 2.402417, 1, 1, 1, 1, 1,
0.2329471, 0.1212856, -0.3219483, 1, 1, 1, 1, 1,
0.2440868, -2.11439, 3.759686, 0, 0, 1, 1, 1,
0.245842, 1.341392, 0.7114012, 1, 0, 0, 1, 1,
0.2501814, -0.4536004, 2.397397, 1, 0, 0, 1, 1,
0.2506951, 1.784122, 1.553592, 1, 0, 0, 1, 1,
0.2513506, -0.5272628, 4.313467, 1, 0, 0, 1, 1,
0.2514805, 1.344961, -0.7807677, 1, 0, 0, 1, 1,
0.2515908, -0.6067315, 2.528296, 0, 0, 0, 1, 1,
0.2526156, -1.340747, 5.089318, 0, 0, 0, 1, 1,
0.2547241, 1.026202, -0.6775278, 0, 0, 0, 1, 1,
0.2559521, -0.3264416, 2.019531, 0, 0, 0, 1, 1,
0.2571561, 2.038734, -1.600261, 0, 0, 0, 1, 1,
0.259892, -0.4645617, 2.745008, 0, 0, 0, 1, 1,
0.2612735, 0.1520589, 1.508682, 0, 0, 0, 1, 1,
0.2634624, -0.3293286, 0.4017924, 1, 1, 1, 1, 1,
0.2636185, 0.2928615, -1.281747, 1, 1, 1, 1, 1,
0.2647254, 1.193882, 0.7624326, 1, 1, 1, 1, 1,
0.2652006, 0.3794865, 1.096613, 1, 1, 1, 1, 1,
0.2658365, 0.6270894, 0.2318866, 1, 1, 1, 1, 1,
0.2666673, 0.8081468, 1.277597, 1, 1, 1, 1, 1,
0.2667033, -0.5125349, 4.785822, 1, 1, 1, 1, 1,
0.2686853, 0.4488876, -0.4510185, 1, 1, 1, 1, 1,
0.2734702, -2.043895, 4.070454, 1, 1, 1, 1, 1,
0.2737984, -0.04487738, 1.33564, 1, 1, 1, 1, 1,
0.2755575, 0.6843615, -0.2401711, 1, 1, 1, 1, 1,
0.2789147, -0.13055, 1.404598, 1, 1, 1, 1, 1,
0.2837991, -1.41675, 2.948777, 1, 1, 1, 1, 1,
0.2879836, -1.300015, 2.639085, 1, 1, 1, 1, 1,
0.2893746, -2.244602, 3.542881, 1, 1, 1, 1, 1,
0.2931326, -1.42137, 4.617355, 0, 0, 1, 1, 1,
0.2979824, -0.3307824, 3.837569, 1, 0, 0, 1, 1,
0.2988398, 0.3967971, -0.5426313, 1, 0, 0, 1, 1,
0.3023569, -0.4436712, 0.9890481, 1, 0, 0, 1, 1,
0.3034795, 0.03319066, 1.649948, 1, 0, 0, 1, 1,
0.3054724, -0.3145728, 2.919492, 1, 0, 0, 1, 1,
0.3062721, 0.5922097, 0.8494323, 0, 0, 0, 1, 1,
0.3080279, -0.5588289, 2.623098, 0, 0, 0, 1, 1,
0.3102069, -0.8995437, 2.789685, 0, 0, 0, 1, 1,
0.3145839, -0.4484651, 1.986893, 0, 0, 0, 1, 1,
0.3175069, -0.3247671, 2.723377, 0, 0, 0, 1, 1,
0.3254086, -1.438004, 4.499221, 0, 0, 0, 1, 1,
0.3267135, -0.5665006, 2.949354, 0, 0, 0, 1, 1,
0.3269053, -1.257734, 3.46527, 1, 1, 1, 1, 1,
0.330179, 0.9350295, -1.358174, 1, 1, 1, 1, 1,
0.3312111, -1.413378, 2.96621, 1, 1, 1, 1, 1,
0.3360271, -0.08409096, 2.534583, 1, 1, 1, 1, 1,
0.3397214, -1.081022, 1.458441, 1, 1, 1, 1, 1,
0.3403702, -1.521065, 3.538687, 1, 1, 1, 1, 1,
0.3405344, 0.4749565, 0.4643846, 1, 1, 1, 1, 1,
0.3419833, -1.393419, 2.667598, 1, 1, 1, 1, 1,
0.3438673, 0.8286811, 2.043232, 1, 1, 1, 1, 1,
0.3440278, -0.9044741, 3.242796, 1, 1, 1, 1, 1,
0.3444194, 0.9734837, -0.3236241, 1, 1, 1, 1, 1,
0.3457204, 2.050508, -0.5346997, 1, 1, 1, 1, 1,
0.3475856, 0.4429595, -0.7198091, 1, 1, 1, 1, 1,
0.347654, 0.04655508, 0.4699194, 1, 1, 1, 1, 1,
0.3491603, -0.1389687, 2.679955, 1, 1, 1, 1, 1,
0.3515256, -1.164262, 1.265628, 0, 0, 1, 1, 1,
0.3534988, -0.3074216, 1.470445, 1, 0, 0, 1, 1,
0.360724, 0.4499307, 1.697442, 1, 0, 0, 1, 1,
0.3608871, 0.6691377, -0.8304953, 1, 0, 0, 1, 1,
0.3655665, 0.2387388, 0.4074209, 1, 0, 0, 1, 1,
0.3658628, -0.2109233, 3.355708, 1, 0, 0, 1, 1,
0.3669315, -0.4273538, 3.110906, 0, 0, 0, 1, 1,
0.3730763, 0.9211999, 1.290201, 0, 0, 0, 1, 1,
0.3746419, 0.5015671, 0.1148715, 0, 0, 0, 1, 1,
0.3759607, -0.8672987, 1.393779, 0, 0, 0, 1, 1,
0.3768738, 0.2384309, 1.294014, 0, 0, 0, 1, 1,
0.3779429, 1.35159, -0.7944056, 0, 0, 0, 1, 1,
0.3894521, -0.599173, 4.629397, 0, 0, 0, 1, 1,
0.3911905, 0.2453627, 1.110435, 1, 1, 1, 1, 1,
0.3979448, 3.115718, -1.768422, 1, 1, 1, 1, 1,
0.4031675, 0.6338142, 0.5783695, 1, 1, 1, 1, 1,
0.4049114, -1.617748, 2.528965, 1, 1, 1, 1, 1,
0.4057666, 1.658019, 2.022215, 1, 1, 1, 1, 1,
0.4058995, -0.6680661, 2.253063, 1, 1, 1, 1, 1,
0.4071699, 0.670019, 1.309394, 1, 1, 1, 1, 1,
0.4079584, -0.1372372, 2.053362, 1, 1, 1, 1, 1,
0.4127975, 1.832572, -0.197479, 1, 1, 1, 1, 1,
0.4133506, -0.6850474, 0.6210296, 1, 1, 1, 1, 1,
0.4142608, 0.08734004, 1.883201, 1, 1, 1, 1, 1,
0.4153074, -1.565476, 3.572549, 1, 1, 1, 1, 1,
0.4159648, -1.4807, 2.894455, 1, 1, 1, 1, 1,
0.4223948, -0.09857024, 1.591208, 1, 1, 1, 1, 1,
0.4251918, 1.08704, 0.4676409, 1, 1, 1, 1, 1,
0.4275789, 0.6868439, 0.3170672, 0, 0, 1, 1, 1,
0.4279899, -0.8505349, 2.740494, 1, 0, 0, 1, 1,
0.429116, -0.07243597, 0.981443, 1, 0, 0, 1, 1,
0.4319654, -0.6434748, 4.482059, 1, 0, 0, 1, 1,
0.4337231, -0.2946006, 2.833834, 1, 0, 0, 1, 1,
0.4368432, -0.3032101, 1.66896, 1, 0, 0, 1, 1,
0.439139, 1.152169, 0.01953982, 0, 0, 0, 1, 1,
0.4425237, 1.997716, 1.023499, 0, 0, 0, 1, 1,
0.4431218, 1.134666, -0.4987556, 0, 0, 0, 1, 1,
0.4440139, 0.2845618, 0.6071569, 0, 0, 0, 1, 1,
0.4451557, -1.557296, 2.715377, 0, 0, 0, 1, 1,
0.4478014, -0.06051917, 2.397593, 0, 0, 0, 1, 1,
0.4479806, 1.27989, 0.04898655, 0, 0, 0, 1, 1,
0.4479811, -1.563697, 2.909353, 1, 1, 1, 1, 1,
0.4526201, 0.5097046, 1.324344, 1, 1, 1, 1, 1,
0.4569952, 2.619077, 1.844054, 1, 1, 1, 1, 1,
0.4570682, 2.199388, 0.3314774, 1, 1, 1, 1, 1,
0.4591249, -1.183551, 1.740731, 1, 1, 1, 1, 1,
0.4595297, 0.6933903, 1.69174, 1, 1, 1, 1, 1,
0.462151, -1.591439, 2.571032, 1, 1, 1, 1, 1,
0.4635071, 0.7877083, -0.4974584, 1, 1, 1, 1, 1,
0.464356, 1.029822, -1.007442, 1, 1, 1, 1, 1,
0.4650339, 0.1225618, 1.831742, 1, 1, 1, 1, 1,
0.4689998, -0.001722941, 1.397867, 1, 1, 1, 1, 1,
0.4721807, -0.2168874, 2.383179, 1, 1, 1, 1, 1,
0.4739688, -1.266365, 2.106164, 1, 1, 1, 1, 1,
0.4783463, -0.6471652, 1.431072, 1, 1, 1, 1, 1,
0.4860605, 0.05329275, 2.451753, 1, 1, 1, 1, 1,
0.4870927, -0.7630695, 3.169001, 0, 0, 1, 1, 1,
0.4878684, 0.02760349, 0.8190448, 1, 0, 0, 1, 1,
0.4885665, 1.168024, -1.002413, 1, 0, 0, 1, 1,
0.4902805, 0.9619256, 1.827661, 1, 0, 0, 1, 1,
0.4917502, 0.4984768, 1.003584, 1, 0, 0, 1, 1,
0.4937007, 0.5595955, 0.7607951, 1, 0, 0, 1, 1,
0.4942382, -1.102813, 4.062056, 0, 0, 0, 1, 1,
0.4965842, 0.4749152, 1.504358, 0, 0, 0, 1, 1,
0.4981481, 0.2750252, 2.144939, 0, 0, 0, 1, 1,
0.5003609, -2.218871, 4.1953, 0, 0, 0, 1, 1,
0.5018373, 0.4690137, 0.6254662, 0, 0, 0, 1, 1,
0.5059733, 0.9730792, -0.3086053, 0, 0, 0, 1, 1,
0.509664, -2.251204, 2.770793, 0, 0, 0, 1, 1,
0.5138686, -1.734752, 3.639993, 1, 1, 1, 1, 1,
0.5182636, -0.4660281, 3.315121, 1, 1, 1, 1, 1,
0.5219021, -2.502627, 1.526046, 1, 1, 1, 1, 1,
0.5307081, 1.735459, 0.457444, 1, 1, 1, 1, 1,
0.5337494, 0.1906737, -0.04806652, 1, 1, 1, 1, 1,
0.5347193, -0.4311742, 2.51512, 1, 1, 1, 1, 1,
0.535231, 0.9430023, 1.598059, 1, 1, 1, 1, 1,
0.5423457, 0.1144245, 1.133083, 1, 1, 1, 1, 1,
0.5479774, 1.032111, 0.6207746, 1, 1, 1, 1, 1,
0.549225, -0.06615452, 2.589185, 1, 1, 1, 1, 1,
0.5538122, -0.858727, 2.414056, 1, 1, 1, 1, 1,
0.5607195, -1.377796, 4.773693, 1, 1, 1, 1, 1,
0.5608068, 0.3895078, -0.6557971, 1, 1, 1, 1, 1,
0.5614462, -0.3586475, 2.218741, 1, 1, 1, 1, 1,
0.5624619, -1.014571, 3.7615, 1, 1, 1, 1, 1,
0.5637667, 0.3403782, 2.317131, 0, 0, 1, 1, 1,
0.5658125, -0.3568057, 1.907622, 1, 0, 0, 1, 1,
0.5666577, 1.434047, -0.2341475, 1, 0, 0, 1, 1,
0.567741, 0.1298267, 0.3386612, 1, 0, 0, 1, 1,
0.5721112, 0.03939343, 1.362865, 1, 0, 0, 1, 1,
0.5730062, -0.4719608, 2.369484, 1, 0, 0, 1, 1,
0.578131, -0.1786947, 1.109637, 0, 0, 0, 1, 1,
0.5824358, -0.9586764, 1.802312, 0, 0, 0, 1, 1,
0.5828121, 0.4464861, 2.511414, 0, 0, 0, 1, 1,
0.5847145, -0.2459297, 2.93231, 0, 0, 0, 1, 1,
0.5855025, -0.5074594, 3.035388, 0, 0, 0, 1, 1,
0.5864615, -0.09680618, 1.399832, 0, 0, 0, 1, 1,
0.5871152, 2.382837, -1.633995, 0, 0, 0, 1, 1,
0.5910774, 0.1997217, 2.085069, 1, 1, 1, 1, 1,
0.5910969, -0.5161488, 1.91859, 1, 1, 1, 1, 1,
0.5978719, 1.013558, -0.1425131, 1, 1, 1, 1, 1,
0.6018683, 0.2998599, -0.09623104, 1, 1, 1, 1, 1,
0.6019488, -0.7213226, 1.406505, 1, 1, 1, 1, 1,
0.6022906, -0.4418202, 2.558692, 1, 1, 1, 1, 1,
0.603123, 0.8473821, 3.183587, 1, 1, 1, 1, 1,
0.6039371, -0.02352617, 3.332219, 1, 1, 1, 1, 1,
0.604771, -0.8549212, 3.119959, 1, 1, 1, 1, 1,
0.6078542, 0.4865662, 0.8832866, 1, 1, 1, 1, 1,
0.6128737, -1.309977, 3.085489, 1, 1, 1, 1, 1,
0.6134399, 0.9585747, -0.1884728, 1, 1, 1, 1, 1,
0.6160488, -0.467384, 0.42803, 1, 1, 1, 1, 1,
0.6181955, 0.6320112, 1.292017, 1, 1, 1, 1, 1,
0.6225052, 0.9985305, 1.832253, 1, 1, 1, 1, 1,
0.6228926, 0.3988686, 2.734128, 0, 0, 1, 1, 1,
0.6230106, 1.036427, 0.03742515, 1, 0, 0, 1, 1,
0.624123, -0.0414986, 0.8185024, 1, 0, 0, 1, 1,
0.6281729, 0.3247931, 2.275532, 1, 0, 0, 1, 1,
0.6313599, -0.8767155, 1.852638, 1, 0, 0, 1, 1,
0.6395797, 0.3867211, -0.0216402, 1, 0, 0, 1, 1,
0.6444247, 0.7609707, 1.975888, 0, 0, 0, 1, 1,
0.6472808, 1.540248, 1.465328, 0, 0, 0, 1, 1,
0.6479137, 1.650331, 0.9244946, 0, 0, 0, 1, 1,
0.6505342, 1.768155, -0.1147104, 0, 0, 0, 1, 1,
0.6537524, -0.0753166, -0.2100283, 0, 0, 0, 1, 1,
0.6549865, -0.7185438, 2.097774, 0, 0, 0, 1, 1,
0.6551816, -1.486509, 2.0288, 0, 0, 0, 1, 1,
0.6576724, 0.6721897, 0.8813551, 1, 1, 1, 1, 1,
0.6655556, -1.150246, 2.341135, 1, 1, 1, 1, 1,
0.6673403, 0.7051826, 2.760634, 1, 1, 1, 1, 1,
0.6675246, -0.1951028, 2.967789, 1, 1, 1, 1, 1,
0.6743174, -0.2451371, 2.31156, 1, 1, 1, 1, 1,
0.6786997, -0.5870578, 3.731104, 1, 1, 1, 1, 1,
0.6788731, -0.7210077, 2.150284, 1, 1, 1, 1, 1,
0.6792557, -0.8630766, 1.956906, 1, 1, 1, 1, 1,
0.6857859, -0.5780469, 1.490067, 1, 1, 1, 1, 1,
0.6860621, 1.146284, -0.2888496, 1, 1, 1, 1, 1,
0.6861762, -0.4922942, 2.346171, 1, 1, 1, 1, 1,
0.6869239, 0.2251697, 2.067426, 1, 1, 1, 1, 1,
0.6880889, 1.508165, 1.070532, 1, 1, 1, 1, 1,
0.6910278, -1.190854, 3.108243, 1, 1, 1, 1, 1,
0.6914648, -0.1507804, 1.990444, 1, 1, 1, 1, 1,
0.6942461, -0.6476933, 0.538652, 0, 0, 1, 1, 1,
0.6961725, -0.4112735, 0.8940635, 1, 0, 0, 1, 1,
0.6994019, -1.005236, 1.90491, 1, 0, 0, 1, 1,
0.7090454, -0.2359595, 3.052598, 1, 0, 0, 1, 1,
0.7115095, -0.5578421, 3.406956, 1, 0, 0, 1, 1,
0.7116125, 0.819408, 0.2007715, 1, 0, 0, 1, 1,
0.7195271, 0.5546781, 3.202523, 0, 0, 0, 1, 1,
0.7221909, -1.543927, 2.621879, 0, 0, 0, 1, 1,
0.7275728, -0.5743877, 3.009342, 0, 0, 0, 1, 1,
0.7294048, 0.3664262, 2.889827, 0, 0, 0, 1, 1,
0.7380564, 0.7925156, -0.2436456, 0, 0, 0, 1, 1,
0.7381458, 0.7552443, 0.3267971, 0, 0, 0, 1, 1,
0.7394369, 2.074735, 0.464702, 0, 0, 0, 1, 1,
0.7510511, -0.05522789, 1.444683, 1, 1, 1, 1, 1,
0.7516055, -2.242073, 4.30509, 1, 1, 1, 1, 1,
0.7518896, 0.02936133, -0.07724363, 1, 1, 1, 1, 1,
0.7531207, 0.7968382, 0.6561462, 1, 1, 1, 1, 1,
0.7629332, -0.1330754, 1.772607, 1, 1, 1, 1, 1,
0.7765735, -0.2367088, 1.599188, 1, 1, 1, 1, 1,
0.7777307, -0.1760764, 1.794949, 1, 1, 1, 1, 1,
0.779294, 0.1054713, 0.7513347, 1, 1, 1, 1, 1,
0.7809342, 0.2334037, 0.09280603, 1, 1, 1, 1, 1,
0.7818187, 0.08634163, 2.849072, 1, 1, 1, 1, 1,
0.7927522, 0.8078202, 0.4426294, 1, 1, 1, 1, 1,
0.7980186, -0.5690905, 1.309443, 1, 1, 1, 1, 1,
0.8119639, -0.05371978, 1.595135, 1, 1, 1, 1, 1,
0.8168172, 1.21242, 0.2903305, 1, 1, 1, 1, 1,
0.8181557, -1.370798, 4.103129, 1, 1, 1, 1, 1,
0.8197193, 0.9574939, 0.5668644, 0, 0, 1, 1, 1,
0.8255606, 0.2794492, 1.800264, 1, 0, 0, 1, 1,
0.8257765, -0.4099219, 1.960509, 1, 0, 0, 1, 1,
0.8311878, 0.1505817, 1.190423, 1, 0, 0, 1, 1,
0.8331997, 1.843933, -0.624222, 1, 0, 0, 1, 1,
0.8335364, -0.5558063, 3.305829, 1, 0, 0, 1, 1,
0.8340523, -0.1334809, 1.523544, 0, 0, 0, 1, 1,
0.8398364, 0.4070138, 1.073026, 0, 0, 0, 1, 1,
0.8421103, -0.7962469, 2.557832, 0, 0, 0, 1, 1,
0.8427982, 0.4990473, 0.4807306, 0, 0, 0, 1, 1,
0.8438694, -0.9557114, 2.091105, 0, 0, 0, 1, 1,
0.8454899, -1.285458, 1.986814, 0, 0, 0, 1, 1,
0.8557052, -0.4177866, 2.49753, 0, 0, 0, 1, 1,
0.8558968, -1.352522, 1.784177, 1, 1, 1, 1, 1,
0.8600065, -0.2381216, 2.748739, 1, 1, 1, 1, 1,
0.8619063, -0.7189003, 2.797793, 1, 1, 1, 1, 1,
0.8654003, 0.5010642, 2.03509, 1, 1, 1, 1, 1,
0.8758954, -0.4975209, 2.345423, 1, 1, 1, 1, 1,
0.8774562, -0.02999731, 1.540905, 1, 1, 1, 1, 1,
0.8791226, -1.293873, 3.05594, 1, 1, 1, 1, 1,
0.8824484, 0.3600591, 1.343293, 1, 1, 1, 1, 1,
0.8848427, 0.3428258, 0.8941426, 1, 1, 1, 1, 1,
0.886022, -0.9599497, 2.749968, 1, 1, 1, 1, 1,
0.8870758, 1.425171, 2.45805, 1, 1, 1, 1, 1,
0.8880887, -1.120791, 1.315425, 1, 1, 1, 1, 1,
0.8921531, 1.529326, 1.195893, 1, 1, 1, 1, 1,
0.8936649, 0.918362, -0.007458282, 1, 1, 1, 1, 1,
0.8937663, -0.63645, 0.2419232, 1, 1, 1, 1, 1,
0.8993851, 0.265731, 2.24132, 0, 0, 1, 1, 1,
0.9014633, 0.22126, 2.623817, 1, 0, 0, 1, 1,
0.9062964, -0.4460409, 2.812388, 1, 0, 0, 1, 1,
0.9096174, 1.061144, 0.7061806, 1, 0, 0, 1, 1,
0.9141577, -0.04229515, 1.07897, 1, 0, 0, 1, 1,
0.9154353, -0.7923872, 0.708185, 1, 0, 0, 1, 1,
0.9204019, -1.882717, 1.752642, 0, 0, 0, 1, 1,
0.9255109, 1.816454, -1.479176, 0, 0, 0, 1, 1,
0.9316207, -0.3184664, 2.760908, 0, 0, 0, 1, 1,
0.9359086, -0.3517527, 2.578412, 0, 0, 0, 1, 1,
0.9426082, 0.9621319, -0.1482412, 0, 0, 0, 1, 1,
0.9438162, 1.010461, 1.026894, 0, 0, 0, 1, 1,
0.9453328, -1.27869, 2.733135, 0, 0, 0, 1, 1,
0.9480377, -0.1383752, 0.4422989, 1, 1, 1, 1, 1,
0.9510887, -0.4691935, 2.764521, 1, 1, 1, 1, 1,
0.9539774, -0.1304676, 2.171366, 1, 1, 1, 1, 1,
0.9649869, -0.3686965, 1.512955, 1, 1, 1, 1, 1,
0.9682799, 0.8763036, 0.4607477, 1, 1, 1, 1, 1,
0.9703999, -1.125543, 3.085824, 1, 1, 1, 1, 1,
0.9727407, 0.8909371, 0.7022384, 1, 1, 1, 1, 1,
0.9740707, 0.7427969, 0.7915208, 1, 1, 1, 1, 1,
0.9748883, 0.05649405, 2.771821, 1, 1, 1, 1, 1,
0.9755383, -0.4147695, -0.1230346, 1, 1, 1, 1, 1,
0.9787085, 1.088397, 0.7800192, 1, 1, 1, 1, 1,
0.9797395, 0.2959436, 1.948618, 1, 1, 1, 1, 1,
0.9820136, -0.4662352, 2.019808, 1, 1, 1, 1, 1,
0.9829537, -0.524685, 2.379225, 1, 1, 1, 1, 1,
0.9837182, 2.042, 1.571299, 1, 1, 1, 1, 1,
0.9868159, -0.4818245, 1.195662, 0, 0, 1, 1, 1,
0.9916488, 0.3790155, 0.9966733, 1, 0, 0, 1, 1,
0.9919616, 1.110134, 2.031394, 1, 0, 0, 1, 1,
1.0001, 1.517341, -1.076275, 1, 0, 0, 1, 1,
1.002267, 0.1532174, 3.047751, 1, 0, 0, 1, 1,
1.005336, 0.3338874, 1.351774, 1, 0, 0, 1, 1,
1.010902, 0.02606538, 0.7460031, 0, 0, 0, 1, 1,
1.025094, -0.5049584, 3.934996, 0, 0, 0, 1, 1,
1.027882, 0.9443739, 1.37664, 0, 0, 0, 1, 1,
1.043166, -0.8070211, 3.986509, 0, 0, 0, 1, 1,
1.049305, 0.4638978, 0.06327938, 0, 0, 0, 1, 1,
1.054479, 0.2521613, 2.554063, 0, 0, 0, 1, 1,
1.064859, -2.309021, 2.090508, 0, 0, 0, 1, 1,
1.073443, -1.271728, 3.365506, 1, 1, 1, 1, 1,
1.076843, -1.96439, 3.013139, 1, 1, 1, 1, 1,
1.081621, 1.850966, -0.937691, 1, 1, 1, 1, 1,
1.08755, -2.154163, 3.678815, 1, 1, 1, 1, 1,
1.088175, 0.8200967, 1.224026, 1, 1, 1, 1, 1,
1.095404, -0.5071182, 1.983988, 1, 1, 1, 1, 1,
1.096269, 1.53137, -1.024537, 1, 1, 1, 1, 1,
1.09772, -0.3725017, 1.627439, 1, 1, 1, 1, 1,
1.103137, -0.4336864, 2.514861, 1, 1, 1, 1, 1,
1.104943, 0.3229755, 1.480219, 1, 1, 1, 1, 1,
1.110095, -1.783934, 3.494022, 1, 1, 1, 1, 1,
1.123565, -1.306949, 2.271398, 1, 1, 1, 1, 1,
1.128246, 0.4416686, 0.9189178, 1, 1, 1, 1, 1,
1.128527, 1.746769, -0.2720391, 1, 1, 1, 1, 1,
1.129293, 0.6880559, 1.457119, 1, 1, 1, 1, 1,
1.14255, 1.482042, 0.5404029, 0, 0, 1, 1, 1,
1.145694, -0.915351, 1.806678, 1, 0, 0, 1, 1,
1.14743, 0.6954105, 0.5787961, 1, 0, 0, 1, 1,
1.150812, 1.073311, -0.4153927, 1, 0, 0, 1, 1,
1.151279, -0.5171067, 3.55301, 1, 0, 0, 1, 1,
1.153032, 0.00203873, 0.08603792, 1, 0, 0, 1, 1,
1.154086, -1.506911, 1.857006, 0, 0, 0, 1, 1,
1.15418, -1.030809, 2.176775, 0, 0, 0, 1, 1,
1.161057, -0.8388115, 1.265419, 0, 0, 0, 1, 1,
1.161985, -0.2052122, 0.7616856, 0, 0, 0, 1, 1,
1.164152, 0.3120581, 2.145458, 0, 0, 0, 1, 1,
1.170915, 0.4274121, 0.8731644, 0, 0, 0, 1, 1,
1.184418, 0.1854969, 0.70054, 0, 0, 0, 1, 1,
1.194036, 0.5061834, 0.8542718, 1, 1, 1, 1, 1,
1.199544, -0.9298089, 3.150877, 1, 1, 1, 1, 1,
1.200861, -1.950684, 2.110268, 1, 1, 1, 1, 1,
1.213642, -1.024657, 4.08605, 1, 1, 1, 1, 1,
1.220416, 1.189024, -0.005829088, 1, 1, 1, 1, 1,
1.225622, -0.5129827, 1.563139, 1, 1, 1, 1, 1,
1.245183, -0.2055065, 1.390537, 1, 1, 1, 1, 1,
1.249694, -0.7960913, 2.260297, 1, 1, 1, 1, 1,
1.250761, 0.8912748, 1.035783, 1, 1, 1, 1, 1,
1.259621, 0.03321564, 0.8388506, 1, 1, 1, 1, 1,
1.274766, 1.506569, 0.3631549, 1, 1, 1, 1, 1,
1.281681, 0.8260687, 1.339313, 1, 1, 1, 1, 1,
1.285528, 1.920531, 1.592547, 1, 1, 1, 1, 1,
1.288395, -0.2479832, 0.3915841, 1, 1, 1, 1, 1,
1.290651, -2.021336, 1.889233, 1, 1, 1, 1, 1,
1.29716, 0.686666, 0.289087, 0, 0, 1, 1, 1,
1.306013, 1.699635, 2.493269, 1, 0, 0, 1, 1,
1.314062, -1.043571, 0.7847822, 1, 0, 0, 1, 1,
1.319718, 0.7016848, -0.5952463, 1, 0, 0, 1, 1,
1.322745, 0.03034433, 0.7333494, 1, 0, 0, 1, 1,
1.336202, -0.1290638, 1.470604, 1, 0, 0, 1, 1,
1.336512, 0.0383445, 1.67289, 0, 0, 0, 1, 1,
1.3507, 2.127601, 0.3608598, 0, 0, 0, 1, 1,
1.351638, 2.714472, -0.01839912, 0, 0, 0, 1, 1,
1.356726, -0.1031956, 0.7746774, 0, 0, 0, 1, 1,
1.363195, 1.099773, 1.358308, 0, 0, 0, 1, 1,
1.366297, -0.5185055, 0.3575059, 0, 0, 0, 1, 1,
1.382905, 0.1447632, 1.431838, 0, 0, 0, 1, 1,
1.411956, 0.6050063, 0.7645878, 1, 1, 1, 1, 1,
1.419877, 0.2345128, 0.7098525, 1, 1, 1, 1, 1,
1.423882, -0.6021952, 1.602423, 1, 1, 1, 1, 1,
1.424641, -0.4608531, 4.140338, 1, 1, 1, 1, 1,
1.440552, 1.328268, 2.258557, 1, 1, 1, 1, 1,
1.453547, 0.9826162, 0.9815065, 1, 1, 1, 1, 1,
1.456758, 0.1168262, 1.734991, 1, 1, 1, 1, 1,
1.462414, 1.390993, -0.1707788, 1, 1, 1, 1, 1,
1.463737, -1.118846, 0.5101898, 1, 1, 1, 1, 1,
1.46467, -0.04401459, 2.332366, 1, 1, 1, 1, 1,
1.482077, 1.489132, 2.214232, 1, 1, 1, 1, 1,
1.482706, -1.00273, 1.09953, 1, 1, 1, 1, 1,
1.484158, -0.9036894, 3.212041, 1, 1, 1, 1, 1,
1.489952, 1.112648, -0.6620185, 1, 1, 1, 1, 1,
1.49243, -0.1366258, 0.9440506, 1, 1, 1, 1, 1,
1.511017, 0.2936454, 0.6015404, 0, 0, 1, 1, 1,
1.51325, -1.369036, 2.180386, 1, 0, 0, 1, 1,
1.524959, 1.627293, 0.9438132, 1, 0, 0, 1, 1,
1.541435, 1.392232, 1.410833, 1, 0, 0, 1, 1,
1.553868, 0.3202797, 2.335695, 1, 0, 0, 1, 1,
1.560888, -0.2878556, 3.140925, 1, 0, 0, 1, 1,
1.564064, -1.365916, 3.258656, 0, 0, 0, 1, 1,
1.570835, 1.042638, 1.53908, 0, 0, 0, 1, 1,
1.588644, 0.950294, 0.6806163, 0, 0, 0, 1, 1,
1.592829, 0.6170501, 2.50898, 0, 0, 0, 1, 1,
1.605774, -1.505986, 1.86962, 0, 0, 0, 1, 1,
1.61069, -0.1654528, 1.027175, 0, 0, 0, 1, 1,
1.612739, -1.128896, 2.948745, 0, 0, 0, 1, 1,
1.626186, 0.4770741, 0.5811448, 1, 1, 1, 1, 1,
1.629135, -0.03560449, 3.476836, 1, 1, 1, 1, 1,
1.6364, -0.6642143, 1.812223, 1, 1, 1, 1, 1,
1.638425, -0.3069693, 1.04064, 1, 1, 1, 1, 1,
1.640684, -0.5226209, 1.923114, 1, 1, 1, 1, 1,
1.64748, -0.3883325, 2.72533, 1, 1, 1, 1, 1,
1.666523, 0.8637466, 0.4910249, 1, 1, 1, 1, 1,
1.671401, 0.3203453, 0.03937773, 1, 1, 1, 1, 1,
1.673837, -1.194438, 1.996043, 1, 1, 1, 1, 1,
1.682934, 0.5878459, 1.151016, 1, 1, 1, 1, 1,
1.685868, 0.9013622, 1.704173, 1, 1, 1, 1, 1,
1.69053, -0.07031821, 0.3654029, 1, 1, 1, 1, 1,
1.700643, -0.2596459, 1.977837, 1, 1, 1, 1, 1,
1.703472, -0.9201216, 1.956185, 1, 1, 1, 1, 1,
1.73236, -0.3857243, 2.852184, 1, 1, 1, 1, 1,
1.738585, -0.1082337, 1.947229, 0, 0, 1, 1, 1,
1.739588, 0.4481954, 1.777038, 1, 0, 0, 1, 1,
1.753701, 0.7690104, 1.799806, 1, 0, 0, 1, 1,
1.760923, -1.777448, 3.729903, 1, 0, 0, 1, 1,
1.768962, 0.5007349, 2.470415, 1, 0, 0, 1, 1,
1.774357, -1.010144, 2.592319, 1, 0, 0, 1, 1,
1.797155, -0.2192913, 2.374782, 0, 0, 0, 1, 1,
1.806099, -0.6628914, 1.517996, 0, 0, 0, 1, 1,
1.832796, -0.672755, 2.03206, 0, 0, 0, 1, 1,
1.860443, 1.137603, 1.651647, 0, 0, 0, 1, 1,
1.861528, 0.02617212, 2.435902, 0, 0, 0, 1, 1,
1.873594, -0.05261698, 1.167061, 0, 0, 0, 1, 1,
1.875991, 1.196824, 1.508265, 0, 0, 0, 1, 1,
1.878345, 0.9976522, 1.336422, 1, 1, 1, 1, 1,
1.881665, -0.1768201, 2.650186, 1, 1, 1, 1, 1,
1.892804, -0.5024747, 1.00863, 1, 1, 1, 1, 1,
1.922767, 0.4246722, 0.3837705, 1, 1, 1, 1, 1,
1.92487, -1.814343, 3.837229, 1, 1, 1, 1, 1,
1.933285, 0.811065, 1.507176, 1, 1, 1, 1, 1,
1.959357, -0.5499036, -0.471746, 1, 1, 1, 1, 1,
1.968421, 0.8835135, 2.009394, 1, 1, 1, 1, 1,
1.980071, 0.4092994, 0.2948869, 1, 1, 1, 1, 1,
1.99641, -0.4609171, 0.9997012, 1, 1, 1, 1, 1,
2.033358, 0.8259051, 2.168781, 1, 1, 1, 1, 1,
2.039246, 0.5056493, 1.552514, 1, 1, 1, 1, 1,
2.051971, -0.2245889, 2.010983, 1, 1, 1, 1, 1,
2.053507, 0.5837398, 2.606712, 1, 1, 1, 1, 1,
2.069681, -1.24911, 1.905094, 1, 1, 1, 1, 1,
2.073465, 0.3340279, -1.154235, 0, 0, 1, 1, 1,
2.079288, 0.8466935, 2.666987, 1, 0, 0, 1, 1,
2.091295, -0.927395, 1.321823, 1, 0, 0, 1, 1,
2.117851, -0.8197801, 1.136026, 1, 0, 0, 1, 1,
2.121651, 0.2474656, 1.131298, 1, 0, 0, 1, 1,
2.18033, -0.5554305, 2.042663, 1, 0, 0, 1, 1,
2.217364, -0.2846185, 0.8851271, 0, 0, 0, 1, 1,
2.224729, -0.5171609, 2.150671, 0, 0, 0, 1, 1,
2.228094, -0.2698098, -0.09636874, 0, 0, 0, 1, 1,
2.246436, -0.07609833, 2.171985, 0, 0, 0, 1, 1,
2.360297, -0.1867386, 0.5936428, 0, 0, 0, 1, 1,
2.381497, 0.3300921, 1.395496, 0, 0, 0, 1, 1,
2.445109, -0.08155253, 1.090335, 0, 0, 0, 1, 1,
2.483228, 0.2040835, 1.120964, 1, 1, 1, 1, 1,
2.533264, 0.1977961, -0.2358553, 1, 1, 1, 1, 1,
2.654473, -0.9739191, 1.248172, 1, 1, 1, 1, 1,
2.733781, 0.2495165, 1.939426, 1, 1, 1, 1, 1,
2.880076, -0.2348945, -0.006893057, 1, 1, 1, 1, 1,
2.938513, 0.8095949, 3.427186, 1, 1, 1, 1, 1,
3.119504, 1.295027, -0.0579605, 1, 1, 1, 1, 1
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
var radius = 9.609843;
var distance = 33.75417;
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
mvMatrix.translate( -0.04167175, 0.05776548, 0.109787 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.75417);
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
