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
-2.59144, 0.9530907, -1.544502, 1, 0, 0, 1,
-2.554568, -0.7911776, -1.653719, 1, 0.007843138, 0, 1,
-2.481652, -2.369527, -1.905901, 1, 0.01176471, 0, 1,
-2.412442, 0.2960256, -0.8011329, 1, 0.01960784, 0, 1,
-2.265109, 0.01757177, -2.040603, 1, 0.02352941, 0, 1,
-2.261967, -0.011129, -0.9794828, 1, 0.03137255, 0, 1,
-2.198625, -1.47079, -2.248117, 1, 0.03529412, 0, 1,
-2.175337, -0.2899964, -0.415521, 1, 0.04313726, 0, 1,
-2.168138, 0.006148725, -1.904428, 1, 0.04705882, 0, 1,
-2.166613, -0.9784884, -0.9361513, 1, 0.05490196, 0, 1,
-2.162002, 0.2962498, 1.014604, 1, 0.05882353, 0, 1,
-2.09652, -1.031102, -2.750686, 1, 0.06666667, 0, 1,
-2.065855, -1.104228, -1.582489, 1, 0.07058824, 0, 1,
-2.063259, 0.107631, -1.572056, 1, 0.07843138, 0, 1,
-2.047156, 0.9544575, -1.477194, 1, 0.08235294, 0, 1,
-2.037144, -0.1986867, -1.312088, 1, 0.09019608, 0, 1,
-2.02611, -0.01902377, -1.322115, 1, 0.09411765, 0, 1,
-2.018935, 0.2082324, -1.541127, 1, 0.1019608, 0, 1,
-1.983092, -1.161614, -3.438072, 1, 0.1098039, 0, 1,
-1.982696, -0.2302694, -2.30973, 1, 0.1137255, 0, 1,
-1.973027, 0.4457468, -0.4399626, 1, 0.1215686, 0, 1,
-1.963299, 0.6837117, -1.882468, 1, 0.1254902, 0, 1,
-1.931725, -1.81168, -2.634024, 1, 0.1333333, 0, 1,
-1.92666, -0.8545812, -1.359054, 1, 0.1372549, 0, 1,
-1.887332, -0.6597984, -0.9963216, 1, 0.145098, 0, 1,
-1.887244, 0.9885332, 0.846934, 1, 0.1490196, 0, 1,
-1.882749, -0.7531601, -1.173101, 1, 0.1568628, 0, 1,
-1.880692, 0.4940048, -2.029273, 1, 0.1607843, 0, 1,
-1.849626, -0.007802549, -1.645293, 1, 0.1686275, 0, 1,
-1.849337, -0.9085552, -2.937636, 1, 0.172549, 0, 1,
-1.8405, -1.025199, -1.611025, 1, 0.1803922, 0, 1,
-1.828488, 0.4541945, -0.8723871, 1, 0.1843137, 0, 1,
-1.825912, -2.046708, -1.818636, 1, 0.1921569, 0, 1,
-1.776978, 1.903645, -1.613708, 1, 0.1960784, 0, 1,
-1.76498, 1.378945, -1.584696, 1, 0.2039216, 0, 1,
-1.76054, 0.7603934, -2.729247, 1, 0.2117647, 0, 1,
-1.737423, 1.616279, -1.504905, 1, 0.2156863, 0, 1,
-1.70638, 1.43717, -1.186314, 1, 0.2235294, 0, 1,
-1.704279, 0.2087298, -0.6126853, 1, 0.227451, 0, 1,
-1.700689, 0.2410307, -2.267003, 1, 0.2352941, 0, 1,
-1.698356, 0.07992499, 0.5207503, 1, 0.2392157, 0, 1,
-1.696452, -0.8624304, -0.4512942, 1, 0.2470588, 0, 1,
-1.686623, 0.4568556, -0.4589552, 1, 0.2509804, 0, 1,
-1.68629, -0.7462493, -1.745277, 1, 0.2588235, 0, 1,
-1.676513, -1.005422, -1.760721, 1, 0.2627451, 0, 1,
-1.64254, -2.489356, -3.077469, 1, 0.2705882, 0, 1,
-1.637197, 1.360569, -1.447188, 1, 0.2745098, 0, 1,
-1.636936, 0.1466665, 0.0105666, 1, 0.282353, 0, 1,
-1.622756, -0.0560751, -1.368452, 1, 0.2862745, 0, 1,
-1.615617, 0.7981138, 0.01152507, 1, 0.2941177, 0, 1,
-1.613064, 0.6519704, -2.247899, 1, 0.3019608, 0, 1,
-1.603682, 0.346175, -3.703352, 1, 0.3058824, 0, 1,
-1.60062, 0.4612933, -1.687386, 1, 0.3137255, 0, 1,
-1.598758, -0.6559451, 0.3909874, 1, 0.3176471, 0, 1,
-1.582851, 0.5271882, -1.446653, 1, 0.3254902, 0, 1,
-1.572231, -0.3490135, -2.707647, 1, 0.3294118, 0, 1,
-1.532518, -0.2952491, -1.358183, 1, 0.3372549, 0, 1,
-1.532057, -0.00408485, -2.84102, 1, 0.3411765, 0, 1,
-1.52646, 1.265059, -1.888424, 1, 0.3490196, 0, 1,
-1.517882, -0.4561148, -1.425191, 1, 0.3529412, 0, 1,
-1.506352, -0.5129452, -2.161973, 1, 0.3607843, 0, 1,
-1.480035, -0.1521992, -1.626214, 1, 0.3647059, 0, 1,
-1.47442, -1.21145, -1.237886, 1, 0.372549, 0, 1,
-1.472006, -1.424698, -3.897452, 1, 0.3764706, 0, 1,
-1.463401, -0.0938797, -0.6263394, 1, 0.3843137, 0, 1,
-1.448775, 0.2503478, -0.7952747, 1, 0.3882353, 0, 1,
-1.445261, 0.1668467, 0.04143352, 1, 0.3960784, 0, 1,
-1.425207, 0.7822247, -1.289701, 1, 0.4039216, 0, 1,
-1.422921, -0.2975976, -4.152555, 1, 0.4078431, 0, 1,
-1.412395, -0.7073505, -2.215352, 1, 0.4156863, 0, 1,
-1.411419, 0.1412676, -4.18379, 1, 0.4196078, 0, 1,
-1.410617, -1.034238, -1.131207, 1, 0.427451, 0, 1,
-1.40827, 0.2514983, -1.953619, 1, 0.4313726, 0, 1,
-1.380433, 0.6508847, -0.1263597, 1, 0.4392157, 0, 1,
-1.367447, 0.06813395, -1.260569, 1, 0.4431373, 0, 1,
-1.352315, -0.3942701, -0.9958918, 1, 0.4509804, 0, 1,
-1.346344, 0.6941032, -0.8680613, 1, 0.454902, 0, 1,
-1.339468, -1.102006, -2.617015, 1, 0.4627451, 0, 1,
-1.339229, -0.3301665, -1.484589, 1, 0.4666667, 0, 1,
-1.338196, 0.4877411, 0.8684396, 1, 0.4745098, 0, 1,
-1.337577, -0.502479, -1.999745, 1, 0.4784314, 0, 1,
-1.331409, 1.786038, 0.3583706, 1, 0.4862745, 0, 1,
-1.327147, 0.1137471, -1.003144, 1, 0.4901961, 0, 1,
-1.324592, -0.4637454, -1.932005, 1, 0.4980392, 0, 1,
-1.322381, -1.400057, -3.217288, 1, 0.5058824, 0, 1,
-1.32129, -2.567997, -1.60379, 1, 0.509804, 0, 1,
-1.312174, -0.1045705, -2.312951, 1, 0.5176471, 0, 1,
-1.280266, 0.05298817, -1.087976, 1, 0.5215687, 0, 1,
-1.273514, -1.459425, -1.873499, 1, 0.5294118, 0, 1,
-1.272017, -0.2158973, -2.421481, 1, 0.5333334, 0, 1,
-1.268626, 0.489445, -1.296502, 1, 0.5411765, 0, 1,
-1.263468, 1.310643, -1.554822, 1, 0.5450981, 0, 1,
-1.262596, 0.9966964, -0.7034907, 1, 0.5529412, 0, 1,
-1.26138, 1.16428, -0.5161155, 1, 0.5568628, 0, 1,
-1.248643, 1.248623, 0.4142931, 1, 0.5647059, 0, 1,
-1.242691, 0.189687, -1.770109, 1, 0.5686275, 0, 1,
-1.238306, 2.402775, -0.5602867, 1, 0.5764706, 0, 1,
-1.236328, -2.642353, -4.823528, 1, 0.5803922, 0, 1,
-1.235186, -0.1612887, -1.06767, 1, 0.5882353, 0, 1,
-1.234474, 0.1493719, 0.3055362, 1, 0.5921569, 0, 1,
-1.233513, 0.1262487, -2.455144, 1, 0.6, 0, 1,
-1.22631, 0.7445326, -1.675956, 1, 0.6078432, 0, 1,
-1.225398, -0.1326517, -2.510217, 1, 0.6117647, 0, 1,
-1.221634, 1.116757, -0.178452, 1, 0.6196079, 0, 1,
-1.215811, 0.4043329, -2.062302, 1, 0.6235294, 0, 1,
-1.213396, 1.532672, -0.3254961, 1, 0.6313726, 0, 1,
-1.211364, -0.831416, -1.219605, 1, 0.6352941, 0, 1,
-1.210668, -0.08488026, -2.764636, 1, 0.6431373, 0, 1,
-1.210174, -0.04329706, -2.844007, 1, 0.6470588, 0, 1,
-1.197311, -1.763479, -3.400145, 1, 0.654902, 0, 1,
-1.196929, 0.1646149, -1.636982, 1, 0.6588235, 0, 1,
-1.194134, 0.9070979, -0.6922334, 1, 0.6666667, 0, 1,
-1.189852, -0.1087775, -1.394176, 1, 0.6705883, 0, 1,
-1.185584, -0.08445934, -1.640051, 1, 0.6784314, 0, 1,
-1.180758, -0.03865135, -1.755852, 1, 0.682353, 0, 1,
-1.172581, 1.395581, -0.9671783, 1, 0.6901961, 0, 1,
-1.154003, 0.07140415, -3.417675, 1, 0.6941177, 0, 1,
-1.149709, -0.647499, -2.769304, 1, 0.7019608, 0, 1,
-1.145576, -0.5699341, -1.132643, 1, 0.7098039, 0, 1,
-1.134407, 0.3062744, -1.431036, 1, 0.7137255, 0, 1,
-1.132656, 0.9841585, -0.7334837, 1, 0.7215686, 0, 1,
-1.123307, -0.0813791, 0.7960557, 1, 0.7254902, 0, 1,
-1.120677, 1.39253, -0.9708174, 1, 0.7333333, 0, 1,
-1.119344, 0.224597, -1.794915, 1, 0.7372549, 0, 1,
-1.117676, 0.8631854, 0.1586833, 1, 0.7450981, 0, 1,
-1.117278, 0.8465434, -0.2660827, 1, 0.7490196, 0, 1,
-1.112036, -1.050406, -2.834135, 1, 0.7568628, 0, 1,
-1.094569, -1.303331, -2.617993, 1, 0.7607843, 0, 1,
-1.092983, 1.863203, -0.1033469, 1, 0.7686275, 0, 1,
-1.080587, -0.07948112, -2.999884, 1, 0.772549, 0, 1,
-1.080307, -0.2794461, -0.4886952, 1, 0.7803922, 0, 1,
-1.076496, -0.0185061, -0.7956723, 1, 0.7843137, 0, 1,
-1.072944, -0.4276734, -3.296797, 1, 0.7921569, 0, 1,
-1.071762, 1.285745, -0.9476778, 1, 0.7960784, 0, 1,
-1.064066, -0.2671082, -1.942194, 1, 0.8039216, 0, 1,
-1.052531, -0.4837008, -2.078144, 1, 0.8117647, 0, 1,
-1.05032, -1.024432, -2.364782, 1, 0.8156863, 0, 1,
-1.049189, -1.516458, -1.802223, 1, 0.8235294, 0, 1,
-1.045676, -2.172101, -3.020873, 1, 0.827451, 0, 1,
-1.042669, -0.771212, -1.338927, 1, 0.8352941, 0, 1,
-1.032172, -0.3021063, -3.922174, 1, 0.8392157, 0, 1,
-1.027065, 0.8102417, -1.98547, 1, 0.8470588, 0, 1,
-1.025809, -0.5780664, -2.187307, 1, 0.8509804, 0, 1,
-1.020542, 0.1988977, -0.01626872, 1, 0.8588235, 0, 1,
-1.017324, -1.362296, -3.20657, 1, 0.8627451, 0, 1,
-1.015993, -0.3866048, -2.544907, 1, 0.8705882, 0, 1,
-1.009252, -1.070173, -2.47277, 1, 0.8745098, 0, 1,
-0.9985753, -0.9829625, -2.615354, 1, 0.8823529, 0, 1,
-0.9967976, -0.5097074, -2.001734, 1, 0.8862745, 0, 1,
-0.9931732, -0.8140883, -2.807576, 1, 0.8941177, 0, 1,
-0.9890781, -0.9622884, -3.097833, 1, 0.8980392, 0, 1,
-0.9875687, -0.01206463, -1.754994, 1, 0.9058824, 0, 1,
-0.9832752, 1.432982, -1.71802, 1, 0.9137255, 0, 1,
-0.9778318, 0.2534429, -1.456086, 1, 0.9176471, 0, 1,
-0.9658049, -0.5182883, -2.449728, 1, 0.9254902, 0, 1,
-0.9568923, 1.418613, -1.156009, 1, 0.9294118, 0, 1,
-0.9568261, 0.1244484, -3.298556, 1, 0.9372549, 0, 1,
-0.9552892, -1.303269, -1.359664, 1, 0.9411765, 0, 1,
-0.9538299, -0.2308245, -1.24649, 1, 0.9490196, 0, 1,
-0.9530782, 1.7042, -0.2646862, 1, 0.9529412, 0, 1,
-0.9435424, 0.1722777, 0.1177869, 1, 0.9607843, 0, 1,
-0.9426301, 1.686888, -1.366927, 1, 0.9647059, 0, 1,
-0.9396106, 0.4041119, 0.1588231, 1, 0.972549, 0, 1,
-0.938808, -1.414614, -4.31822, 1, 0.9764706, 0, 1,
-0.9366485, -0.7992175, -3.085709, 1, 0.9843137, 0, 1,
-0.9217657, 0.5266421, 0.7332948, 1, 0.9882353, 0, 1,
-0.9105202, 1.568864, -0.840234, 1, 0.9960784, 0, 1,
-0.9095651, -0.723627, -2.853909, 0.9960784, 1, 0, 1,
-0.9029382, 1.130015, 0.08899252, 0.9921569, 1, 0, 1,
-0.8972582, 0.7062311, -1.291491, 0.9843137, 1, 0, 1,
-0.8943952, 1.030405, -1.68599, 0.9803922, 1, 0, 1,
-0.8900606, -0.05666643, -2.164307, 0.972549, 1, 0, 1,
-0.8891227, -1.814319, -3.500442, 0.9686275, 1, 0, 1,
-0.8875096, -0.4453491, -2.770315, 0.9607843, 1, 0, 1,
-0.8802854, 0.2379005, -0.3887898, 0.9568627, 1, 0, 1,
-0.8801302, -1.91709, -2.024867, 0.9490196, 1, 0, 1,
-0.8787017, 0.4071499, 0.3323426, 0.945098, 1, 0, 1,
-0.8780857, -1.048593, -2.001171, 0.9372549, 1, 0, 1,
-0.8775918, 0.09853657, -1.275597, 0.9333333, 1, 0, 1,
-0.8774987, 0.08057155, -1.686435, 0.9254902, 1, 0, 1,
-0.8751497, 0.5597861, -1.051673, 0.9215686, 1, 0, 1,
-0.868905, 0.6332033, -1.617639, 0.9137255, 1, 0, 1,
-0.8658506, 0.3656611, -1.737068, 0.9098039, 1, 0, 1,
-0.8643229, -1.058815, -0.7549672, 0.9019608, 1, 0, 1,
-0.8616905, 0.4750706, -1.99566, 0.8941177, 1, 0, 1,
-0.8585105, 0.2689341, -3.001933, 0.8901961, 1, 0, 1,
-0.8415084, 0.414155, -2.278877, 0.8823529, 1, 0, 1,
-0.8382332, -0.9949789, -3.719663, 0.8784314, 1, 0, 1,
-0.8333824, 2.194773, -0.2399292, 0.8705882, 1, 0, 1,
-0.8305055, 0.06064415, -3.367161, 0.8666667, 1, 0, 1,
-0.8283794, 0.7190687, -1.448501, 0.8588235, 1, 0, 1,
-0.8153458, 1.47043, -1.192583, 0.854902, 1, 0, 1,
-0.8080723, -0.1037691, -1.038691, 0.8470588, 1, 0, 1,
-0.8012937, 0.02529463, -1.642501, 0.8431373, 1, 0, 1,
-0.7970046, 0.1721251, -1.383092, 0.8352941, 1, 0, 1,
-0.7893213, 0.622439, 1.279355, 0.8313726, 1, 0, 1,
-0.7872587, 0.6251208, -1.185163, 0.8235294, 1, 0, 1,
-0.7851898, -0.2221338, -3.22632, 0.8196079, 1, 0, 1,
-0.7770302, -0.9072107, -1.542506, 0.8117647, 1, 0, 1,
-0.7765221, 1.5243, -1.054075, 0.8078431, 1, 0, 1,
-0.77613, 0.7902469, 0.5764935, 0.8, 1, 0, 1,
-0.7657214, -0.8574392, -3.811174, 0.7921569, 1, 0, 1,
-0.7639947, -0.6031162, -0.5910549, 0.7882353, 1, 0, 1,
-0.7628725, -0.9929862, -3.377186, 0.7803922, 1, 0, 1,
-0.7625685, -1.628841, -2.856794, 0.7764706, 1, 0, 1,
-0.7614627, 0.2262418, -2.294622, 0.7686275, 1, 0, 1,
-0.7525057, 1.429145, -1.188111, 0.7647059, 1, 0, 1,
-0.7419423, 0.02886309, 0.1334891, 0.7568628, 1, 0, 1,
-0.7369038, 2.052751, 0.6532009, 0.7529412, 1, 0, 1,
-0.7351863, 0.2322171, -3.357087, 0.7450981, 1, 0, 1,
-0.7343109, -0.03021701, -2.009178, 0.7411765, 1, 0, 1,
-0.7315586, -1.658898, -1.053075, 0.7333333, 1, 0, 1,
-0.7232077, 0.8301139, -0.5290439, 0.7294118, 1, 0, 1,
-0.7193393, -0.4763663, -0.4899791, 0.7215686, 1, 0, 1,
-0.7138975, 0.1543388, -1.481615, 0.7176471, 1, 0, 1,
-0.7096925, 0.9002873, 0.7796906, 0.7098039, 1, 0, 1,
-0.7056057, 1.043395, -0.8087021, 0.7058824, 1, 0, 1,
-0.703603, -1.224968, -2.103987, 0.6980392, 1, 0, 1,
-0.7020667, -0.7140679, -1.476861, 0.6901961, 1, 0, 1,
-0.6960464, 0.437372, -1.524012, 0.6862745, 1, 0, 1,
-0.6852114, -0.5298433, -1.909891, 0.6784314, 1, 0, 1,
-0.6823439, 1.290579, 0.1138716, 0.6745098, 1, 0, 1,
-0.6792786, -0.1976376, -3.258912, 0.6666667, 1, 0, 1,
-0.6781704, -1.105855, -2.599739, 0.6627451, 1, 0, 1,
-0.6773449, 0.3130208, -1.247505, 0.654902, 1, 0, 1,
-0.6768065, 0.1867065, -1.482765, 0.6509804, 1, 0, 1,
-0.674634, -0.9682363, -2.308771, 0.6431373, 1, 0, 1,
-0.6625995, -0.04957246, -1.467574, 0.6392157, 1, 0, 1,
-0.6614069, -0.3358725, 0.1033974, 0.6313726, 1, 0, 1,
-0.6594145, -0.8683436, -3.226115, 0.627451, 1, 0, 1,
-0.6550202, -0.8372631, -2.887973, 0.6196079, 1, 0, 1,
-0.651538, 0.3456147, -0.9882376, 0.6156863, 1, 0, 1,
-0.6482437, -0.9292217, -1.560011, 0.6078432, 1, 0, 1,
-0.6462175, -0.7031205, -1.780894, 0.6039216, 1, 0, 1,
-0.6460435, 2.526903, -0.4548962, 0.5960785, 1, 0, 1,
-0.6458946, -0.4215134, -2.119311, 0.5882353, 1, 0, 1,
-0.6411235, 0.6374892, -0.07494335, 0.5843138, 1, 0, 1,
-0.6295868, -0.3919876, -3.006976, 0.5764706, 1, 0, 1,
-0.6201801, -0.4123996, -2.437699, 0.572549, 1, 0, 1,
-0.6162351, -1.048607, -0.2573895, 0.5647059, 1, 0, 1,
-0.6161928, 0.7623459, -2.773853, 0.5607843, 1, 0, 1,
-0.6161292, -0.206756, -1.114778, 0.5529412, 1, 0, 1,
-0.6156992, 0.7150362, -1.297416, 0.5490196, 1, 0, 1,
-0.6043838, -0.4829218, -2.919482, 0.5411765, 1, 0, 1,
-0.6035373, -0.2324435, -2.706268, 0.5372549, 1, 0, 1,
-0.5972825, -1.388333, -2.874445, 0.5294118, 1, 0, 1,
-0.5962155, -0.811565, -2.139622, 0.5254902, 1, 0, 1,
-0.5936531, 1.455471, 0.5419029, 0.5176471, 1, 0, 1,
-0.5913842, 0.8762427, -0.1943253, 0.5137255, 1, 0, 1,
-0.59011, -0.3861699, -1.585888, 0.5058824, 1, 0, 1,
-0.5812985, -0.4387667, -1.760999, 0.5019608, 1, 0, 1,
-0.5770034, -0.6814607, -2.408738, 0.4941176, 1, 0, 1,
-0.5707318, -0.6544739, -3.080608, 0.4862745, 1, 0, 1,
-0.566528, -0.2180303, -2.75777, 0.4823529, 1, 0, 1,
-0.5608053, -0.6201679, -1.515926, 0.4745098, 1, 0, 1,
-0.5598859, -2.548306, -2.83808, 0.4705882, 1, 0, 1,
-0.5489737, -0.1349559, 0.5583389, 0.4627451, 1, 0, 1,
-0.5489115, -0.9432911, -3.954507, 0.4588235, 1, 0, 1,
-0.5475775, 0.1884689, -0.1444767, 0.4509804, 1, 0, 1,
-0.5421552, 0.525963, -3.802486, 0.4470588, 1, 0, 1,
-0.5297217, -2.667587, -3.724627, 0.4392157, 1, 0, 1,
-0.521964, 0.1144387, -1.870906, 0.4352941, 1, 0, 1,
-0.5202675, -1.75329, -3.549963, 0.427451, 1, 0, 1,
-0.514179, 1.108714, -1.827132, 0.4235294, 1, 0, 1,
-0.5125535, 0.8993472, -0.7175428, 0.4156863, 1, 0, 1,
-0.5093699, 1.504858, -1.474384, 0.4117647, 1, 0, 1,
-0.5077716, 1.796682, -0.9771169, 0.4039216, 1, 0, 1,
-0.5044948, 0.9053292, 0.2656566, 0.3960784, 1, 0, 1,
-0.5011213, 0.8775418, -0.65356, 0.3921569, 1, 0, 1,
-0.4977542, 0.169574, 0.2369564, 0.3843137, 1, 0, 1,
-0.4926504, 0.6890676, -1.295835, 0.3803922, 1, 0, 1,
-0.4900372, 0.2433969, -1.480131, 0.372549, 1, 0, 1,
-0.4872956, -0.5551184, -3.085948, 0.3686275, 1, 0, 1,
-0.4860187, -0.1162354, -1.815619, 0.3607843, 1, 0, 1,
-0.4847693, -0.2130563, -2.279128, 0.3568628, 1, 0, 1,
-0.4771691, 0.6961521, -0.2501538, 0.3490196, 1, 0, 1,
-0.476289, -0.05212026, -0.1119912, 0.345098, 1, 0, 1,
-0.4707401, 0.06871594, -1.722071, 0.3372549, 1, 0, 1,
-0.4699821, -1.618143, -2.483552, 0.3333333, 1, 0, 1,
-0.4694479, -1.020489, -2.759905, 0.3254902, 1, 0, 1,
-0.4646674, 0.4677771, 0.04261329, 0.3215686, 1, 0, 1,
-0.4621359, 0.6386196, 0.9592665, 0.3137255, 1, 0, 1,
-0.4616057, -1.066884, -3.383787, 0.3098039, 1, 0, 1,
-0.4572573, -0.2070627, -2.296499, 0.3019608, 1, 0, 1,
-0.4563518, -0.3996496, -2.571785, 0.2941177, 1, 0, 1,
-0.4548175, 0.8241693, -0.9924514, 0.2901961, 1, 0, 1,
-0.4544539, -1.670886, -3.758806, 0.282353, 1, 0, 1,
-0.4522977, 1.346133, -0.3038398, 0.2784314, 1, 0, 1,
-0.4522187, 1.610335, -0.6220192, 0.2705882, 1, 0, 1,
-0.4471992, -1.058829, -3.011929, 0.2666667, 1, 0, 1,
-0.4435397, -1.587058, -2.48239, 0.2588235, 1, 0, 1,
-0.4411158, -0.2375049, -3.426817, 0.254902, 1, 0, 1,
-0.4382251, 2.473255, 0.776669, 0.2470588, 1, 0, 1,
-0.4371919, 2.235026, 0.6706556, 0.2431373, 1, 0, 1,
-0.4357964, -0.5316811, -2.613782, 0.2352941, 1, 0, 1,
-0.428354, -0.5234551, -0.9116578, 0.2313726, 1, 0, 1,
-0.4281419, 1.129155, 0.6564344, 0.2235294, 1, 0, 1,
-0.4266129, 0.8397405, -0.01557828, 0.2196078, 1, 0, 1,
-0.4249623, -0.1046302, -0.6573624, 0.2117647, 1, 0, 1,
-0.424926, 0.4892402, 0.2511454, 0.2078431, 1, 0, 1,
-0.4180102, 0.6209022, 0.1663199, 0.2, 1, 0, 1,
-0.4162794, 1.176758, -1.182135, 0.1921569, 1, 0, 1,
-0.4127798, 2.961404, 0.2122754, 0.1882353, 1, 0, 1,
-0.4123482, -0.569329, -1.131451, 0.1803922, 1, 0, 1,
-0.4099193, 0.3521695, 0.2876543, 0.1764706, 1, 0, 1,
-0.4024957, -0.5799203, -1.580073, 0.1686275, 1, 0, 1,
-0.4018998, -0.5246212, -3.215481, 0.1647059, 1, 0, 1,
-0.4013404, -0.5261999, -2.473784, 0.1568628, 1, 0, 1,
-0.4004942, -1.29558, -3.667386, 0.1529412, 1, 0, 1,
-0.3992148, -0.1360316, -1.890435, 0.145098, 1, 0, 1,
-0.3982592, 1.299805, -0.4742621, 0.1411765, 1, 0, 1,
-0.3933418, -0.385926, -2.970842, 0.1333333, 1, 0, 1,
-0.3899909, 0.5022537, 0.09724255, 0.1294118, 1, 0, 1,
-0.3890873, -0.4058526, -3.466335, 0.1215686, 1, 0, 1,
-0.3870436, 0.4705726, -2.337829, 0.1176471, 1, 0, 1,
-0.3867859, 0.1103224, -2.762931, 0.1098039, 1, 0, 1,
-0.3829198, -0.4218269, -3.726697, 0.1058824, 1, 0, 1,
-0.380057, -0.4556704, -3.561743, 0.09803922, 1, 0, 1,
-0.3766026, -0.4947289, -2.425693, 0.09019608, 1, 0, 1,
-0.3713665, 0.03141049, -0.767415, 0.08627451, 1, 0, 1,
-0.3681486, -0.1047541, -1.574464, 0.07843138, 1, 0, 1,
-0.364338, 0.5878314, -2.513484, 0.07450981, 1, 0, 1,
-0.3635692, -1.259353, -1.442988, 0.06666667, 1, 0, 1,
-0.362508, -0.5898967, -4.45088, 0.0627451, 1, 0, 1,
-0.3596802, -0.02830096, -1.006405, 0.05490196, 1, 0, 1,
-0.3590586, -0.1021248, -2.055169, 0.05098039, 1, 0, 1,
-0.3555404, -0.3914101, -3.852985, 0.04313726, 1, 0, 1,
-0.355534, 0.01326994, -2.533018, 0.03921569, 1, 0, 1,
-0.3491728, 1.442364, 0.8851294, 0.03137255, 1, 0, 1,
-0.3445264, 1.660648, -0.2386071, 0.02745098, 1, 0, 1,
-0.3441534, -0.5265113, -4.918339, 0.01960784, 1, 0, 1,
-0.3436619, -0.4104265, -3.407823, 0.01568628, 1, 0, 1,
-0.336942, 0.01228837, -1.288724, 0.007843138, 1, 0, 1,
-0.3356555, 0.391599, -0.6749251, 0.003921569, 1, 0, 1,
-0.334458, 0.3018123, -2.310547, 0, 1, 0.003921569, 1,
-0.3304657, -1.374219, -1.601017, 0, 1, 0.01176471, 1,
-0.3287062, -0.2450911, -0.9892796, 0, 1, 0.01568628, 1,
-0.3241455, -0.2201016, -2.210306, 0, 1, 0.02352941, 1,
-0.3210687, -1.500603, -2.440754, 0, 1, 0.02745098, 1,
-0.3180127, -1.155094, -2.643992, 0, 1, 0.03529412, 1,
-0.3169722, 2.422586, -0.1860394, 0, 1, 0.03921569, 1,
-0.3143537, -0.02045482, -2.432983, 0, 1, 0.04705882, 1,
-0.3119745, -0.2823026, -1.254843, 0, 1, 0.05098039, 1,
-0.3071615, 0.7424265, -0.04097915, 0, 1, 0.05882353, 1,
-0.3065005, -1.245681, -2.964959, 0, 1, 0.0627451, 1,
-0.3010881, 1.266117, -0.8991973, 0, 1, 0.07058824, 1,
-0.2953476, 1.206348, -2.213814, 0, 1, 0.07450981, 1,
-0.2918694, -0.5687592, -2.582621, 0, 1, 0.08235294, 1,
-0.2912685, -0.2888217, -1.514687, 0, 1, 0.08627451, 1,
-0.2908315, -1.287599, -2.957611, 0, 1, 0.09411765, 1,
-0.290369, 0.2466451, -0.492243, 0, 1, 0.1019608, 1,
-0.2898613, -1.628105, -2.721563, 0, 1, 0.1058824, 1,
-0.2896747, -0.2682183, -2.650356, 0, 1, 0.1137255, 1,
-0.2834854, 0.9738795, -2.000734, 0, 1, 0.1176471, 1,
-0.2830371, 0.4773858, -0.7398976, 0, 1, 0.1254902, 1,
-0.2811084, 1.467002, -1.408482, 0, 1, 0.1294118, 1,
-0.280843, -2.07696, -3.700067, 0, 1, 0.1372549, 1,
-0.2803224, 1.265346, -0.0204798, 0, 1, 0.1411765, 1,
-0.2797838, -1.051761, -2.754077, 0, 1, 0.1490196, 1,
-0.2765114, 1.128382, 0.8616537, 0, 1, 0.1529412, 1,
-0.2760472, -1.058271, -2.691914, 0, 1, 0.1607843, 1,
-0.2751286, 0.209847, -0.9026535, 0, 1, 0.1647059, 1,
-0.2730446, -0.3015903, -2.955948, 0, 1, 0.172549, 1,
-0.272572, -2.11067, -3.628838, 0, 1, 0.1764706, 1,
-0.2708277, 0.4832698, -1.601031, 0, 1, 0.1843137, 1,
-0.2704324, 0.6618778, -0.7724777, 0, 1, 0.1882353, 1,
-0.2697626, -0.09731414, -2.892348, 0, 1, 0.1960784, 1,
-0.2614104, -1.169683, -3.99959, 0, 1, 0.2039216, 1,
-0.2557968, -0.3134252, -2.869394, 0, 1, 0.2078431, 1,
-0.2549907, -0.7780012, -2.608175, 0, 1, 0.2156863, 1,
-0.2530533, 0.6673339, -1.517228, 0, 1, 0.2196078, 1,
-0.2529915, -0.8985915, -3.093818, 0, 1, 0.227451, 1,
-0.2487359, -0.8353642, -3.582111, 0, 1, 0.2313726, 1,
-0.2482581, 0.09938848, -0.6195599, 0, 1, 0.2392157, 1,
-0.2471453, 0.470793, -0.5010383, 0, 1, 0.2431373, 1,
-0.2385872, -1.049516, -2.739384, 0, 1, 0.2509804, 1,
-0.2385764, 1.025022, -1.165507, 0, 1, 0.254902, 1,
-0.2349389, -1.028602, -1.719189, 0, 1, 0.2627451, 1,
-0.2327672, 0.04531953, -3.419681, 0, 1, 0.2666667, 1,
-0.2311736, 1.380383, 0.9623994, 0, 1, 0.2745098, 1,
-0.229351, 0.1477113, -0.8096827, 0, 1, 0.2784314, 1,
-0.2272896, 1.376738, -0.00646143, 0, 1, 0.2862745, 1,
-0.2215507, -0.5384842, -3.703754, 0, 1, 0.2901961, 1,
-0.2195117, -0.09839317, -3.293537, 0, 1, 0.2980392, 1,
-0.2146449, -1.233302, -2.718909, 0, 1, 0.3058824, 1,
-0.2143429, -2.004618, -1.847093, 0, 1, 0.3098039, 1,
-0.2142316, -0.6797951, -2.066048, 0, 1, 0.3176471, 1,
-0.2140741, 1.289499, -1.234025, 0, 1, 0.3215686, 1,
-0.2139113, 0.4964134, -0.7083241, 0, 1, 0.3294118, 1,
-0.213195, -1.052767, -1.527798, 0, 1, 0.3333333, 1,
-0.2129031, 0.6682224, 1.073132, 0, 1, 0.3411765, 1,
-0.2127102, 0.6805691, 0.4983386, 0, 1, 0.345098, 1,
-0.2106858, 0.6646858, 1.825119, 0, 1, 0.3529412, 1,
-0.2085788, -0.4209166, -0.7389002, 0, 1, 0.3568628, 1,
-0.2085773, 1.511534, -1.43475, 0, 1, 0.3647059, 1,
-0.205828, -0.4023776, -2.079616, 0, 1, 0.3686275, 1,
-0.2024155, 0.5808082, -0.4965951, 0, 1, 0.3764706, 1,
-0.2015998, -0.1799952, -3.339031, 0, 1, 0.3803922, 1,
-0.1983373, -0.7333183, -4.652722, 0, 1, 0.3882353, 1,
-0.1971398, 0.4505843, -0.6963978, 0, 1, 0.3921569, 1,
-0.1942814, -0.8504174, -2.393564, 0, 1, 0.4, 1,
-0.1908544, 0.5305412, 1.756887, 0, 1, 0.4078431, 1,
-0.1900422, -1.987221, -0.4008963, 0, 1, 0.4117647, 1,
-0.1840027, -0.1382969, -3.470435, 0, 1, 0.4196078, 1,
-0.1831616, -0.2027317, -2.087112, 0, 1, 0.4235294, 1,
-0.1801769, 0.0901335, -1.520921, 0, 1, 0.4313726, 1,
-0.1790158, 0.4719538, -1.348217, 0, 1, 0.4352941, 1,
-0.1777002, 1.451184, 1.377914, 0, 1, 0.4431373, 1,
-0.1751162, 1.30235, 0.1741722, 0, 1, 0.4470588, 1,
-0.1748992, 0.3900089, -1.006515, 0, 1, 0.454902, 1,
-0.1696807, -1.813858, -1.661945, 0, 1, 0.4588235, 1,
-0.1691194, 0.3006362, -0.3690431, 0, 1, 0.4666667, 1,
-0.1620698, -1.015934, -2.16125, 0, 1, 0.4705882, 1,
-0.1616576, -0.1888369, -4.943578, 0, 1, 0.4784314, 1,
-0.1585299, -1.885363, -4.211948, 0, 1, 0.4823529, 1,
-0.1583815, -1.250597, -1.503228, 0, 1, 0.4901961, 1,
-0.1579435, 1.671398, 0.5537943, 0, 1, 0.4941176, 1,
-0.1540052, 0.4291358, 0.5886842, 0, 1, 0.5019608, 1,
-0.1538387, 1.871471, 0.2731752, 0, 1, 0.509804, 1,
-0.1504969, 2.525959, -0.9708001, 0, 1, 0.5137255, 1,
-0.1496585, -1.409603, -2.222708, 0, 1, 0.5215687, 1,
-0.1466323, -0.102709, -1.57956, 0, 1, 0.5254902, 1,
-0.1463468, 0.2784538, -2.65029, 0, 1, 0.5333334, 1,
-0.1441201, -0.480251, -4.508471, 0, 1, 0.5372549, 1,
-0.1397327, 0.5700705, 0.5232933, 0, 1, 0.5450981, 1,
-0.1388732, -0.02842627, -2.348493, 0, 1, 0.5490196, 1,
-0.1372614, 0.5267274, -0.2648316, 0, 1, 0.5568628, 1,
-0.1364099, 2.352107, -0.4799499, 0, 1, 0.5607843, 1,
-0.1360458, 1.113695, -1.254252, 0, 1, 0.5686275, 1,
-0.1335106, -0.1339694, -0.5818717, 0, 1, 0.572549, 1,
-0.1333066, -0.3012039, -3.792277, 0, 1, 0.5803922, 1,
-0.1312864, 1.36757, -2.221929, 0, 1, 0.5843138, 1,
-0.1304286, 0.2827278, -0.2443151, 0, 1, 0.5921569, 1,
-0.1208279, 0.07008096, -1.994289, 0, 1, 0.5960785, 1,
-0.1165659, -0.03558958, -0.3420189, 0, 1, 0.6039216, 1,
-0.1154756, -0.5493502, -0.03914318, 0, 1, 0.6117647, 1,
-0.1135071, -1.360236, -2.828954, 0, 1, 0.6156863, 1,
-0.1129144, 0.01201096, -1.834042, 0, 1, 0.6235294, 1,
-0.1077168, -0.5456972, -3.600322, 0, 1, 0.627451, 1,
-0.1024407, 1.65659, 0.1672117, 0, 1, 0.6352941, 1,
-0.1024176, 1.244872, 0.8758867, 0, 1, 0.6392157, 1,
-0.1006292, 2.075439, 1.889028, 0, 1, 0.6470588, 1,
-0.09897334, -1.125581, -3.405601, 0, 1, 0.6509804, 1,
-0.09838338, 3.026422, -3.550685, 0, 1, 0.6588235, 1,
-0.09771959, -0.6316491, -1.986476, 0, 1, 0.6627451, 1,
-0.0940881, -0.2111471, -3.402866, 0, 1, 0.6705883, 1,
-0.09188884, 1.02897, 1.135889, 0, 1, 0.6745098, 1,
-0.08949798, 0.8834835, -0.1182323, 0, 1, 0.682353, 1,
-0.08628734, -0.9633555, -3.806442, 0, 1, 0.6862745, 1,
-0.08470342, 0.2042513, -0.6163201, 0, 1, 0.6941177, 1,
-0.08321865, 0.3547428, 0.09191159, 0, 1, 0.7019608, 1,
-0.07206568, 1.874916, 1.065603, 0, 1, 0.7058824, 1,
-0.06539033, 1.019008, 0.7280798, 0, 1, 0.7137255, 1,
-0.06105625, 0.2445636, -0.464774, 0, 1, 0.7176471, 1,
-0.05883113, -0.565425, -3.345096, 0, 1, 0.7254902, 1,
-0.05472305, -0.3028992, -2.505377, 0, 1, 0.7294118, 1,
-0.05325501, -0.9966916, -4.289721, 0, 1, 0.7372549, 1,
-0.05282518, 0.6079419, 2.007371, 0, 1, 0.7411765, 1,
-0.05050182, -0.9195597, -1.363847, 0, 1, 0.7490196, 1,
-0.04957357, 0.9466792, 0.3537888, 0, 1, 0.7529412, 1,
-0.04273346, -2.423385, -3.851203, 0, 1, 0.7607843, 1,
-0.04154066, -0.2808214, -2.904776, 0, 1, 0.7647059, 1,
-0.04141043, 0.8033602, 0.7409148, 0, 1, 0.772549, 1,
-0.03980901, 0.6631924, -0.363773, 0, 1, 0.7764706, 1,
-0.03902318, -0.7664875, -2.717835, 0, 1, 0.7843137, 1,
-0.03834008, 0.5161569, -0.07714322, 0, 1, 0.7882353, 1,
-0.03581987, 1.731558, 1.936495, 0, 1, 0.7960784, 1,
-0.03450866, 1.316952, 0.6037287, 0, 1, 0.8039216, 1,
-0.03333376, -0.4792957, -1.185499, 0, 1, 0.8078431, 1,
-0.03191398, -0.6122046, -1.610469, 0, 1, 0.8156863, 1,
-0.03165023, 0.5276762, 1.678411, 0, 1, 0.8196079, 1,
-0.03077927, -0.06291024, -3.264686, 0, 1, 0.827451, 1,
-0.02993281, 0.1750539, -0.9679523, 0, 1, 0.8313726, 1,
-0.0228123, -0.1691347, -2.480673, 0, 1, 0.8392157, 1,
-0.01750154, -0.08566672, -3.79215, 0, 1, 0.8431373, 1,
-0.0173416, -0.1803382, -3.752635, 0, 1, 0.8509804, 1,
-0.01541143, 0.1284869, -1.220182, 0, 1, 0.854902, 1,
-0.01313954, -1.231159, -2.09952, 0, 1, 0.8627451, 1,
-0.01309101, -0.5291511, -3.753332, 0, 1, 0.8666667, 1,
-0.00938829, -0.5758279, -4.020087, 0, 1, 0.8745098, 1,
-0.008879473, -0.9788473, -2.562559, 0, 1, 0.8784314, 1,
-0.008494649, -0.2380883, -3.297899, 0, 1, 0.8862745, 1,
-0.004328907, -0.2342202, -1.500237, 0, 1, 0.8901961, 1,
-0.002295684, -1.980854, -2.54172, 0, 1, 0.8980392, 1,
0.0002164022, 0.7054734, -1.115867, 0, 1, 0.9058824, 1,
0.003049248, 0.9189397, -0.002904447, 0, 1, 0.9098039, 1,
0.004165689, -0.02591008, 1.991998, 0, 1, 0.9176471, 1,
0.00438257, -1.018523, 3.295071, 0, 1, 0.9215686, 1,
0.01049175, 1.075907, 0.2311175, 0, 1, 0.9294118, 1,
0.01182762, -1.966962, 1.981004, 0, 1, 0.9333333, 1,
0.01574507, -1.692847, 2.386596, 0, 1, 0.9411765, 1,
0.02170989, 1.164929, 0.9663619, 0, 1, 0.945098, 1,
0.02240958, -0.7428805, 4.044086, 0, 1, 0.9529412, 1,
0.02269882, 0.8235443, -1.529262, 0, 1, 0.9568627, 1,
0.02597259, 0.3273922, -0.2556076, 0, 1, 0.9647059, 1,
0.02600834, 0.5858527, 0.8114039, 0, 1, 0.9686275, 1,
0.02755851, -0.05045324, 3.475805, 0, 1, 0.9764706, 1,
0.03036349, -1.17066, 3.560535, 0, 1, 0.9803922, 1,
0.03483469, -0.4165649, 2.561391, 0, 1, 0.9882353, 1,
0.03504424, -1.268592, 3.91334, 0, 1, 0.9921569, 1,
0.03810776, 0.346977, 0.4308748, 0, 1, 1, 1,
0.04024614, -0.9113582, 2.790719, 0, 0.9921569, 1, 1,
0.04276227, 0.6996112, -1.582398, 0, 0.9882353, 1, 1,
0.04520764, 0.7451001, -0.06128028, 0, 0.9803922, 1, 1,
0.04558728, -0.5626415, 3.492682, 0, 0.9764706, 1, 1,
0.04696865, 0.6144114, -0.4420727, 0, 0.9686275, 1, 1,
0.04769921, -0.2729173, 3.255919, 0, 0.9647059, 1, 1,
0.04965471, -1.604965, 4.087427, 0, 0.9568627, 1, 1,
0.05094337, 0.5002768, -0.80489, 0, 0.9529412, 1, 1,
0.05555582, 0.4178785, -0.3646226, 0, 0.945098, 1, 1,
0.05751064, 0.86247, 0.5318586, 0, 0.9411765, 1, 1,
0.05796752, 0.2079783, 0.7819797, 0, 0.9333333, 1, 1,
0.06011508, 0.05119671, 1.612854, 0, 0.9294118, 1, 1,
0.06120627, -1.769587, 1.87791, 0, 0.9215686, 1, 1,
0.06340471, 1.371578, -0.007735933, 0, 0.9176471, 1, 1,
0.06522183, -0.6393692, 2.007287, 0, 0.9098039, 1, 1,
0.06618459, -0.5245738, 0.7481133, 0, 0.9058824, 1, 1,
0.06978884, -1.177874, 4.332809, 0, 0.8980392, 1, 1,
0.07147144, 0.9905769, -0.04739385, 0, 0.8901961, 1, 1,
0.07263348, -0.08126984, 4.2659, 0, 0.8862745, 1, 1,
0.0753187, 0.7825319, 1.54601, 0, 0.8784314, 1, 1,
0.07967387, -0.01424116, 2.368558, 0, 0.8745098, 1, 1,
0.08301039, 1.803591, -0.4063827, 0, 0.8666667, 1, 1,
0.08302245, 1.253085, 0.5414857, 0, 0.8627451, 1, 1,
0.08604582, 1.302879, 1.598869, 0, 0.854902, 1, 1,
0.08824392, 1.636484, -0.4219121, 0, 0.8509804, 1, 1,
0.08897474, 1.342831, 0.2576551, 0, 0.8431373, 1, 1,
0.09108585, -1.420174, 3.430154, 0, 0.8392157, 1, 1,
0.09118897, -0.1780289, 2.346071, 0, 0.8313726, 1, 1,
0.09297486, 0.3338389, 2.085288, 0, 0.827451, 1, 1,
0.1004252, 0.3401517, -0.1554356, 0, 0.8196079, 1, 1,
0.1106798, 2.694931, 1.269252, 0, 0.8156863, 1, 1,
0.1107819, 0.5463418, -0.2353309, 0, 0.8078431, 1, 1,
0.1109229, -1.191651, 2.0486, 0, 0.8039216, 1, 1,
0.1121978, 0.2908767, -0.2217391, 0, 0.7960784, 1, 1,
0.118349, 0.2413422, 0.9493461, 0, 0.7882353, 1, 1,
0.1204633, 0.4066243, 1.199868, 0, 0.7843137, 1, 1,
0.1265844, 0.5526093, -0.8945573, 0, 0.7764706, 1, 1,
0.1291225, 1.31917, 0.2650479, 0, 0.772549, 1, 1,
0.1301404, 0.671379, -1.233509, 0, 0.7647059, 1, 1,
0.1317032, -1.711194, 1.801781, 0, 0.7607843, 1, 1,
0.1363369, -0.24698, 2.537149, 0, 0.7529412, 1, 1,
0.1390257, -1.303501, 2.262502, 0, 0.7490196, 1, 1,
0.1430403, -0.2541471, 0.9849867, 0, 0.7411765, 1, 1,
0.1452576, -0.9647029, 1.160976, 0, 0.7372549, 1, 1,
0.1498871, 2.045335, -0.3119783, 0, 0.7294118, 1, 1,
0.1501669, 0.05835617, -0.4903402, 0, 0.7254902, 1, 1,
0.1505868, 0.6614176, 0.2433115, 0, 0.7176471, 1, 1,
0.1547653, 1.165705, 0.6380365, 0, 0.7137255, 1, 1,
0.15512, -0.4333363, 3.121538, 0, 0.7058824, 1, 1,
0.1555587, 0.3982421, 0.5075502, 0, 0.6980392, 1, 1,
0.1588694, 0.7291737, 1.423668, 0, 0.6941177, 1, 1,
0.1621058, 0.1945151, 0.9358255, 0, 0.6862745, 1, 1,
0.1632333, 0.9392915, -0.7492716, 0, 0.682353, 1, 1,
0.1666737, 0.2430061, 1.298513, 0, 0.6745098, 1, 1,
0.1672619, 0.3179727, 0.4234688, 0, 0.6705883, 1, 1,
0.1681681, 0.8477477, -0.1882497, 0, 0.6627451, 1, 1,
0.1727777, -1.181378, 3.240183, 0, 0.6588235, 1, 1,
0.1765709, -2.559163, 2.796173, 0, 0.6509804, 1, 1,
0.1776323, -1.281959, 2.485347, 0, 0.6470588, 1, 1,
0.1777792, -1.605557, 4.209855, 0, 0.6392157, 1, 1,
0.1802497, -3.143483, 3.308117, 0, 0.6352941, 1, 1,
0.1860201, -1.36078, 1.024527, 0, 0.627451, 1, 1,
0.1868912, 0.08959027, -0.3820324, 0, 0.6235294, 1, 1,
0.1882937, 2.128734, -2.076826, 0, 0.6156863, 1, 1,
0.1905465, 0.3028391, 2.467564, 0, 0.6117647, 1, 1,
0.1922031, -0.01616167, 2.130654, 0, 0.6039216, 1, 1,
0.1969435, 0.5054098, -0.05421027, 0, 0.5960785, 1, 1,
0.1975283, -1.888981, 4.481744, 0, 0.5921569, 1, 1,
0.1978675, 0.2058734, 1.413166, 0, 0.5843138, 1, 1,
0.1983732, 0.1250876, 0.1567304, 0, 0.5803922, 1, 1,
0.202874, -2.039558, 4.513706, 0, 0.572549, 1, 1,
0.2033908, -0.6716855, 3.778346, 0, 0.5686275, 1, 1,
0.2063607, -1.706848, 3.033196, 0, 0.5607843, 1, 1,
0.209984, 0.7014433, 2.287737, 0, 0.5568628, 1, 1,
0.2107389, -0.5029109, 3.318917, 0, 0.5490196, 1, 1,
0.2143288, -0.1934587, 1.752524, 0, 0.5450981, 1, 1,
0.2149309, 0.3927938, -0.01798638, 0, 0.5372549, 1, 1,
0.215742, -0.8852604, 1.892805, 0, 0.5333334, 1, 1,
0.2177016, -0.392006, 2.406123, 0, 0.5254902, 1, 1,
0.218092, -0.8493269, 2.593953, 0, 0.5215687, 1, 1,
0.2240319, 0.7778747, 0.3099507, 0, 0.5137255, 1, 1,
0.2240727, 0.2491393, 0.294308, 0, 0.509804, 1, 1,
0.2383404, 0.3261917, -1.125908, 0, 0.5019608, 1, 1,
0.2384079, -0.3580984, 2.658609, 0, 0.4941176, 1, 1,
0.2387982, 0.776042, 2.448896, 0, 0.4901961, 1, 1,
0.2415931, -0.7689731, 2.086746, 0, 0.4823529, 1, 1,
0.242446, -0.887438, 3.371984, 0, 0.4784314, 1, 1,
0.2439822, -1.718834, 4.097267, 0, 0.4705882, 1, 1,
0.2444052, -0.2533647, 3.371289, 0, 0.4666667, 1, 1,
0.2466995, -1.306327, 1.699694, 0, 0.4588235, 1, 1,
0.250351, 0.3539001, 1.258882, 0, 0.454902, 1, 1,
0.2516863, -0.4113065, 1.209189, 0, 0.4470588, 1, 1,
0.2533255, -1.590967, 3.993454, 0, 0.4431373, 1, 1,
0.2566351, 0.5011759, 0.3294568, 0, 0.4352941, 1, 1,
0.258164, 0.03132782, 1.216856, 0, 0.4313726, 1, 1,
0.2609885, -1.928293, 3.205138, 0, 0.4235294, 1, 1,
0.2610528, 0.3611567, 0.6855909, 0, 0.4196078, 1, 1,
0.2675443, 1.783199, 0.4449975, 0, 0.4117647, 1, 1,
0.2698931, 0.9546959, 0.2425223, 0, 0.4078431, 1, 1,
0.2699062, -0.6973823, 2.46362, 0, 0.4, 1, 1,
0.2702182, 0.9932985, -1.291878, 0, 0.3921569, 1, 1,
0.2707126, -1.069335, 2.887045, 0, 0.3882353, 1, 1,
0.2710606, -0.9658756, 3.148375, 0, 0.3803922, 1, 1,
0.2718822, 0.1887537, 0.04646067, 0, 0.3764706, 1, 1,
0.2730549, 0.3705899, 2.958686, 0, 0.3686275, 1, 1,
0.2752125, 2.748641, -0.6502095, 0, 0.3647059, 1, 1,
0.2769583, 0.7862561, -1.387729, 0, 0.3568628, 1, 1,
0.2855575, 0.6331006, -0.00612314, 0, 0.3529412, 1, 1,
0.2859146, -0.6421924, 1.546271, 0, 0.345098, 1, 1,
0.2938258, -0.7318727, 3.955894, 0, 0.3411765, 1, 1,
0.2940303, -0.04174716, 1.747744, 0, 0.3333333, 1, 1,
0.297017, 0.4377342, 0.1238745, 0, 0.3294118, 1, 1,
0.3014963, 0.9349979, 0.8624738, 0, 0.3215686, 1, 1,
0.3025184, -0.2354779, 3.130271, 0, 0.3176471, 1, 1,
0.3044701, -1.067524, 3.235303, 0, 0.3098039, 1, 1,
0.308915, 1.70086, 1.232533, 0, 0.3058824, 1, 1,
0.3132358, 1.233451, -0.7125791, 0, 0.2980392, 1, 1,
0.3186573, 0.0548856, 0.3821374, 0, 0.2901961, 1, 1,
0.3195734, -0.4915021, 4.126936, 0, 0.2862745, 1, 1,
0.3196873, -1.420562, 3.207902, 0, 0.2784314, 1, 1,
0.3206092, -0.4681934, 4.675918, 0, 0.2745098, 1, 1,
0.3245326, -0.9642827, 1.493498, 0, 0.2666667, 1, 1,
0.3270322, 0.5809547, 1.471919, 0, 0.2627451, 1, 1,
0.333005, -0.6395862, 3.432578, 0, 0.254902, 1, 1,
0.3365405, -0.2143709, 4.480097, 0, 0.2509804, 1, 1,
0.3395929, -0.6247636, 3.063739, 0, 0.2431373, 1, 1,
0.3397841, -1.577356, 3.758442, 0, 0.2392157, 1, 1,
0.3404121, -0.4653821, 2.912023, 0, 0.2313726, 1, 1,
0.344837, 1.313457, -0.6220152, 0, 0.227451, 1, 1,
0.3455127, 1.183536, 0.2953473, 0, 0.2196078, 1, 1,
0.3457747, -0.1405033, 1.66885, 0, 0.2156863, 1, 1,
0.3487353, 1.749836, 0.1024339, 0, 0.2078431, 1, 1,
0.3510381, 1.718714, 2.315903, 0, 0.2039216, 1, 1,
0.3532943, -0.8348072, 3.457848, 0, 0.1960784, 1, 1,
0.3544542, -0.7522742, 2.350891, 0, 0.1882353, 1, 1,
0.3585224, 1.428741, 2.829831, 0, 0.1843137, 1, 1,
0.3609712, -0.9126772, 2.604255, 0, 0.1764706, 1, 1,
0.361726, -0.4576999, 3.555707, 0, 0.172549, 1, 1,
0.362686, 2.30281, -0.4630271, 0, 0.1647059, 1, 1,
0.3636381, -0.3904267, 4.056216, 0, 0.1607843, 1, 1,
0.3670374, -0.8607664, 2.69703, 0, 0.1529412, 1, 1,
0.3684961, 1.042357, 0.9366856, 0, 0.1490196, 1, 1,
0.3831653, 0.4254056, 0.3386744, 0, 0.1411765, 1, 1,
0.383615, 0.3076295, -1.121329, 0, 0.1372549, 1, 1,
0.3838667, -2.066028, 3.785464, 0, 0.1294118, 1, 1,
0.3879576, 0.114029, 0.8218697, 0, 0.1254902, 1, 1,
0.3884114, 0.2861543, 1.877389, 0, 0.1176471, 1, 1,
0.3906393, 0.3419189, -0.6299762, 0, 0.1137255, 1, 1,
0.3907081, 0.4697849, 1.092586, 0, 0.1058824, 1, 1,
0.3907366, -0.005727734, 2.097733, 0, 0.09803922, 1, 1,
0.3947116, -1.074782, 4.143831, 0, 0.09411765, 1, 1,
0.3966289, -0.4548066, 1.838196, 0, 0.08627451, 1, 1,
0.396851, 0.6354305, 0.5123028, 0, 0.08235294, 1, 1,
0.3984725, 0.4004834, 1.608526, 0, 0.07450981, 1, 1,
0.399832, -0.2884101, 0.2118618, 0, 0.07058824, 1, 1,
0.4073044, 0.6885576, 0.4283995, 0, 0.0627451, 1, 1,
0.4101533, -2.189024, 1.156913, 0, 0.05882353, 1, 1,
0.4118683, -1.499833, 1.999602, 0, 0.05098039, 1, 1,
0.4162783, 0.7831293, 1.052002, 0, 0.04705882, 1, 1,
0.4232187, -1.154782, 2.853744, 0, 0.03921569, 1, 1,
0.4256921, -0.2214619, 2.294705, 0, 0.03529412, 1, 1,
0.4272736, 1.472647, 0.8259234, 0, 0.02745098, 1, 1,
0.4287298, -0.2169105, 0.4003352, 0, 0.02352941, 1, 1,
0.429425, -0.6346357, 1.755504, 0, 0.01568628, 1, 1,
0.4315486, -0.1589099, 0.9361571, 0, 0.01176471, 1, 1,
0.4360358, -0.2982845, 3.533243, 0, 0.003921569, 1, 1,
0.4370344, 0.4168787, 1.933557, 0.003921569, 0, 1, 1,
0.4373484, -1.901412, 4.781565, 0.007843138, 0, 1, 1,
0.4425405, -0.4885925, 0.1669442, 0.01568628, 0, 1, 1,
0.4433627, -0.399051, 2.529277, 0.01960784, 0, 1, 1,
0.4459743, 1.862055, -0.06051014, 0.02745098, 0, 1, 1,
0.4481307, -0.8098003, 3.303069, 0.03137255, 0, 1, 1,
0.4523305, -0.9021587, 1.997918, 0.03921569, 0, 1, 1,
0.4530664, 0.5488205, -0.3439046, 0.04313726, 0, 1, 1,
0.4538618, 0.6606184, 3.398904, 0.05098039, 0, 1, 1,
0.4603026, -0.5756836, 4.604994, 0.05490196, 0, 1, 1,
0.4632908, 0.5100716, 0.3910928, 0.0627451, 0, 1, 1,
0.4693044, -0.2237478, 1.79395, 0.06666667, 0, 1, 1,
0.4708989, -1.49899, 3.379737, 0.07450981, 0, 1, 1,
0.4709629, -1.56116, 3.422563, 0.07843138, 0, 1, 1,
0.4718658, -0.2191027, 3.06287, 0.08627451, 0, 1, 1,
0.4778243, 1.063626, -1.117835, 0.09019608, 0, 1, 1,
0.4778277, 0.1776636, 0.4447044, 0.09803922, 0, 1, 1,
0.4805401, 1.449959, 1.555206, 0.1058824, 0, 1, 1,
0.4817903, 0.3123301, 0.162267, 0.1098039, 0, 1, 1,
0.4903252, -1.000913, 3.138795, 0.1176471, 0, 1, 1,
0.4905496, -1.58572, 0.1695013, 0.1215686, 0, 1, 1,
0.4912022, 3.464487, 0.7888634, 0.1294118, 0, 1, 1,
0.4912702, 0.342822, 1.164465, 0.1333333, 0, 1, 1,
0.4923644, -0.4594877, 3.377232, 0.1411765, 0, 1, 1,
0.4972617, -0.3295111, 2.039221, 0.145098, 0, 1, 1,
0.4987003, -0.07756387, -0.4199583, 0.1529412, 0, 1, 1,
0.5004972, -0.80715, 1.415653, 0.1568628, 0, 1, 1,
0.5043258, 0.8744934, 0.9870545, 0.1647059, 0, 1, 1,
0.504346, 0.9422489, -0.5914023, 0.1686275, 0, 1, 1,
0.513765, -1.155069, 1.738739, 0.1764706, 0, 1, 1,
0.5147168, -1.297783, 2.327938, 0.1803922, 0, 1, 1,
0.5154917, -0.4316164, 1.750686, 0.1882353, 0, 1, 1,
0.5215105, 0.6539932, 0.5884386, 0.1921569, 0, 1, 1,
0.5215868, -0.2776838, 1.288161, 0.2, 0, 1, 1,
0.5219674, -0.6141635, 1.257724, 0.2078431, 0, 1, 1,
0.5231573, 0.7142042, -0.3378966, 0.2117647, 0, 1, 1,
0.5241246, 0.0777411, 0.7742618, 0.2196078, 0, 1, 1,
0.5302179, -0.1783128, 2.156755, 0.2235294, 0, 1, 1,
0.5354972, -1.339827, 1.283341, 0.2313726, 0, 1, 1,
0.5401472, -1.12577, 3.248401, 0.2352941, 0, 1, 1,
0.5427536, -1.451498, 2.543124, 0.2431373, 0, 1, 1,
0.5438401, 2.796669, 2.588414, 0.2470588, 0, 1, 1,
0.5480031, 0.6139249, -0.6043281, 0.254902, 0, 1, 1,
0.5497118, -0.2665206, 4.906096, 0.2588235, 0, 1, 1,
0.550519, 0.6002102, 0.8669968, 0.2666667, 0, 1, 1,
0.5548147, 1.242038, 0.7005137, 0.2705882, 0, 1, 1,
0.5564935, -0.26386, 2.184233, 0.2784314, 0, 1, 1,
0.5601529, -0.02860452, 0.4136436, 0.282353, 0, 1, 1,
0.5671715, -0.08633926, 2.562319, 0.2901961, 0, 1, 1,
0.5679315, 1.218622, 1.24852, 0.2941177, 0, 1, 1,
0.5682751, -1.855392, 0.2820978, 0.3019608, 0, 1, 1,
0.5690485, -0.2821515, 3.067568, 0.3098039, 0, 1, 1,
0.5694493, 0.185296, 1.403201, 0.3137255, 0, 1, 1,
0.5781374, -0.8913586, 1.835968, 0.3215686, 0, 1, 1,
0.5867308, -0.8865163, 3.002393, 0.3254902, 0, 1, 1,
0.5885074, 0.1824722, 2.400118, 0.3333333, 0, 1, 1,
0.5900047, -2.354275, 3.109564, 0.3372549, 0, 1, 1,
0.5954654, -1.326416, 3.35397, 0.345098, 0, 1, 1,
0.5972742, 0.8158453, 0.4383845, 0.3490196, 0, 1, 1,
0.5974446, -0.1476506, 2.68826, 0.3568628, 0, 1, 1,
0.5981032, 1.672093, 1.050048, 0.3607843, 0, 1, 1,
0.6114129, -1.269904, 1.748116, 0.3686275, 0, 1, 1,
0.6131818, 0.1781873, 1.761457, 0.372549, 0, 1, 1,
0.613732, 0.4219583, 2.155612, 0.3803922, 0, 1, 1,
0.6166155, 1.088343, 0.08097278, 0.3843137, 0, 1, 1,
0.6182157, 1.704439, 0.8949551, 0.3921569, 0, 1, 1,
0.618646, 0.5162675, -1.467424, 0.3960784, 0, 1, 1,
0.622672, -1.981671, 3.81948, 0.4039216, 0, 1, 1,
0.6247104, 0.1608989, 1.190936, 0.4117647, 0, 1, 1,
0.6269817, -0.1538909, 1.633402, 0.4156863, 0, 1, 1,
0.6305602, -2.686026, 2.421347, 0.4235294, 0, 1, 1,
0.6400162, 0.7186683, 1.465868, 0.427451, 0, 1, 1,
0.6445799, 0.8050573, 2.226842, 0.4352941, 0, 1, 1,
0.646641, -0.5155308, 0.8228896, 0.4392157, 0, 1, 1,
0.6521751, -3.536457, 2.670286, 0.4470588, 0, 1, 1,
0.6534572, 0.5539305, 0.6383501, 0.4509804, 0, 1, 1,
0.6541663, 0.6492481, -1.53644, 0.4588235, 0, 1, 1,
0.6629155, 0.1680963, 2.943433, 0.4627451, 0, 1, 1,
0.6637195, -0.7387378, 2.096207, 0.4705882, 0, 1, 1,
0.6722384, 0.7467183, 0.17554, 0.4745098, 0, 1, 1,
0.6751282, -1.114642, 3.127151, 0.4823529, 0, 1, 1,
0.6761476, 0.1817744, 1.187054, 0.4862745, 0, 1, 1,
0.6786371, -0.3167205, 2.710808, 0.4941176, 0, 1, 1,
0.6891218, 0.6758361, -0.01945233, 0.5019608, 0, 1, 1,
0.6934017, -0.6124325, 2.69921, 0.5058824, 0, 1, 1,
0.6942303, -0.3632638, 2.851994, 0.5137255, 0, 1, 1,
0.6949021, 0.1938009, 1.443317, 0.5176471, 0, 1, 1,
0.7073871, 0.02789555, 1.260474, 0.5254902, 0, 1, 1,
0.7192313, -0.1536724, 1.266196, 0.5294118, 0, 1, 1,
0.7220354, -0.4816483, 1.424759, 0.5372549, 0, 1, 1,
0.7321258, 1.46842, -1.273595, 0.5411765, 0, 1, 1,
0.7346427, 0.145873, 2.353903, 0.5490196, 0, 1, 1,
0.7365265, 0.7785133, 1.827159, 0.5529412, 0, 1, 1,
0.7573383, 0.1176464, 1.875019, 0.5607843, 0, 1, 1,
0.7574201, -0.8018425, 2.529997, 0.5647059, 0, 1, 1,
0.759152, -0.6050686, 2.626464, 0.572549, 0, 1, 1,
0.7598465, 1.751362, -0.6722959, 0.5764706, 0, 1, 1,
0.7600003, -1.669469, 3.557934, 0.5843138, 0, 1, 1,
0.7602919, -0.9156715, 3.357534, 0.5882353, 0, 1, 1,
0.7617097, -1.310361, 4.573933, 0.5960785, 0, 1, 1,
0.7625563, -0.3246483, 3.150015, 0.6039216, 0, 1, 1,
0.76349, 1.830871, -0.2044075, 0.6078432, 0, 1, 1,
0.7647735, 0.9488148, 0.9925509, 0.6156863, 0, 1, 1,
0.7670315, -0.331992, 0.6683505, 0.6196079, 0, 1, 1,
0.7708876, -0.1198765, 1.058702, 0.627451, 0, 1, 1,
0.7739239, 0.6122482, 1.965883, 0.6313726, 0, 1, 1,
0.7742921, 0.3484104, 1.083752, 0.6392157, 0, 1, 1,
0.7753336, 0.8366261, -0.04734118, 0.6431373, 0, 1, 1,
0.7756605, -0.6923708, 1.238848, 0.6509804, 0, 1, 1,
0.7820044, 1.069305, -0.9925163, 0.654902, 0, 1, 1,
0.7827754, -0.199421, 1.909037, 0.6627451, 0, 1, 1,
0.7885957, 1.525156, 2.285498, 0.6666667, 0, 1, 1,
0.7921914, -0.84678, 2.024522, 0.6745098, 0, 1, 1,
0.7929711, 1.842496, -1.929495, 0.6784314, 0, 1, 1,
0.7978361, 2.237937, 0.2252492, 0.6862745, 0, 1, 1,
0.8062617, -0.1358486, -0.7053615, 0.6901961, 0, 1, 1,
0.8068334, 1.278349, 1.647465, 0.6980392, 0, 1, 1,
0.809721, -0.5932256, 1.618823, 0.7058824, 0, 1, 1,
0.8156219, 0.7925435, 0.634876, 0.7098039, 0, 1, 1,
0.8279998, -1.158481, 1.630014, 0.7176471, 0, 1, 1,
0.8310428, -0.1033634, 0.8037289, 0.7215686, 0, 1, 1,
0.8384676, -0.3575906, 1.442432, 0.7294118, 0, 1, 1,
0.8399993, 0.6394829, 1.559165, 0.7333333, 0, 1, 1,
0.8419744, 0.02230349, 0.5143352, 0.7411765, 0, 1, 1,
0.8426561, 0.2108862, 0.1966742, 0.7450981, 0, 1, 1,
0.8513674, -1.182639, 1.924083, 0.7529412, 0, 1, 1,
0.8549234, 1.04661, 2.030928, 0.7568628, 0, 1, 1,
0.855651, -2.493775, 2.709742, 0.7647059, 0, 1, 1,
0.8565685, -0.7586461, 3.029188, 0.7686275, 0, 1, 1,
0.8642336, -0.2785076, 1.462189, 0.7764706, 0, 1, 1,
0.8676621, -0.1148366, -0.3551187, 0.7803922, 0, 1, 1,
0.8677297, 0.9455824, 0.1996491, 0.7882353, 0, 1, 1,
0.868053, -0.2988736, 0.5696564, 0.7921569, 0, 1, 1,
0.8688877, 0.558825, 1.681559, 0.8, 0, 1, 1,
0.8714164, -0.2572153, 1.496623, 0.8078431, 0, 1, 1,
0.8715394, -0.8009475, 1.509646, 0.8117647, 0, 1, 1,
0.8729021, -0.6261335, 1.267321, 0.8196079, 0, 1, 1,
0.8733486, 0.09302187, 1.409426, 0.8235294, 0, 1, 1,
0.8892215, 0.7273706, -0.9852049, 0.8313726, 0, 1, 1,
0.8986836, -1.518696, 2.4463, 0.8352941, 0, 1, 1,
0.9068947, 1.105008, 0.3065455, 0.8431373, 0, 1, 1,
0.9070623, 0.7411035, 1.605959, 0.8470588, 0, 1, 1,
0.9156609, -0.4622714, 1.196032, 0.854902, 0, 1, 1,
0.9210501, -0.1935873, 1.7137, 0.8588235, 0, 1, 1,
0.9259751, 1.65426, 0.22602, 0.8666667, 0, 1, 1,
0.9310948, 2.363645, 0.1440042, 0.8705882, 0, 1, 1,
0.93978, -0.9526721, 2.421804, 0.8784314, 0, 1, 1,
0.9436318, -0.2029994, 1.381964, 0.8823529, 0, 1, 1,
0.9465564, -0.1317108, 2.78972, 0.8901961, 0, 1, 1,
0.9508386, -0.38671, 0.05421469, 0.8941177, 0, 1, 1,
0.9654867, -0.5788531, 2.626421, 0.9019608, 0, 1, 1,
0.9665318, 1.819646, 1.819941, 0.9098039, 0, 1, 1,
0.9675437, -0.02421428, -0.621582, 0.9137255, 0, 1, 1,
0.9712779, -0.90914, 2.315819, 0.9215686, 0, 1, 1,
0.9728084, -0.5820072, 2.346933, 0.9254902, 0, 1, 1,
0.9745018, 0.5280883, 0.4725591, 0.9333333, 0, 1, 1,
0.9753351, 0.1545736, 2.036055, 0.9372549, 0, 1, 1,
0.9765199, 0.8797178, 1.303506, 0.945098, 0, 1, 1,
0.9801096, -0.06313675, 1.319608, 0.9490196, 0, 1, 1,
0.9921538, -0.623504, 1.177136, 0.9568627, 0, 1, 1,
0.9924949, -0.55, 1.647053, 0.9607843, 0, 1, 1,
1.006678, 0.6015884, 0.3167277, 0.9686275, 0, 1, 1,
1.010404, 2.051211, 0.09155255, 0.972549, 0, 1, 1,
1.015798, -0.1069439, 0.6713969, 0.9803922, 0, 1, 1,
1.021121, -1.162036, 1.674505, 0.9843137, 0, 1, 1,
1.02669, -0.6192886, 2.757647, 0.9921569, 0, 1, 1,
1.031917, -0.5658948, 2.606559, 0.9960784, 0, 1, 1,
1.033398, 0.5383258, -0.01327561, 1, 0, 0.9960784, 1,
1.037516, -0.8195776, 0.8350595, 1, 0, 0.9882353, 1,
1.039214, -0.5873136, 1.193987, 1, 0, 0.9843137, 1,
1.041266, -1.261505, 3.573684, 1, 0, 0.9764706, 1,
1.041381, -0.4458, 1.987231, 1, 0, 0.972549, 1,
1.041502, -1.232743, 2.062672, 1, 0, 0.9647059, 1,
1.044855, -0.6220334, 1.16564, 1, 0, 0.9607843, 1,
1.045352, -1.036744, 2.036747, 1, 0, 0.9529412, 1,
1.047556, -1.23355, 2.171116, 1, 0, 0.9490196, 1,
1.050429, 2.783088, -0.7018337, 1, 0, 0.9411765, 1,
1.055319, -0.4508165, 2.026347, 1, 0, 0.9372549, 1,
1.060186, -0.354946, 1.080881, 1, 0, 0.9294118, 1,
1.061232, -0.2772182, 3.695215, 1, 0, 0.9254902, 1,
1.062208, 0.6120238, 0.2853288, 1, 0, 0.9176471, 1,
1.064052, 1.481416, -0.6556794, 1, 0, 0.9137255, 1,
1.06493, 0.7964898, -0.02060363, 1, 0, 0.9058824, 1,
1.073685, -0.5504897, 1.324805, 1, 0, 0.9019608, 1,
1.079562, 0.09867032, 3.792355, 1, 0, 0.8941177, 1,
1.085237, -1.575494, 3.389018, 1, 0, 0.8862745, 1,
1.089711, 1.952185, -0.9160607, 1, 0, 0.8823529, 1,
1.096913, -0.4297691, 1.014546, 1, 0, 0.8745098, 1,
1.100103, -0.169629, 1.910676, 1, 0, 0.8705882, 1,
1.101624, 0.521599, 0.1407415, 1, 0, 0.8627451, 1,
1.106664, 2.681753, 0.8299761, 1, 0, 0.8588235, 1,
1.106848, 0.746445, 0.9179586, 1, 0, 0.8509804, 1,
1.114421, -0.4087869, 2.082172, 1, 0, 0.8470588, 1,
1.12073, 0.5435811, 1.019571, 1, 0, 0.8392157, 1,
1.123421, 0.8451136, 0.4276175, 1, 0, 0.8352941, 1,
1.126572, 0.6849786, 3.08553, 1, 0, 0.827451, 1,
1.126921, 0.4642101, 0.8339117, 1, 0, 0.8235294, 1,
1.128165, -0.4423471, 0.8906083, 1, 0, 0.8156863, 1,
1.130758, -0.005753325, 1.202963, 1, 0, 0.8117647, 1,
1.142166, -0.8571574, 3.661412, 1, 0, 0.8039216, 1,
1.14349, 0.4835858, 2.353293, 1, 0, 0.7960784, 1,
1.147135, 1.351832, -1.378264, 1, 0, 0.7921569, 1,
1.149422, -2.47744, 4.464486, 1, 0, 0.7843137, 1,
1.161198, -1.350668, 2.658633, 1, 0, 0.7803922, 1,
1.169499, -0.9814261, 1.746301, 1, 0, 0.772549, 1,
1.179297, 0.09128863, 1.958952, 1, 0, 0.7686275, 1,
1.179571, -0.1688335, 1.021358, 1, 0, 0.7607843, 1,
1.19929, 0.9594711, 0.3681802, 1, 0, 0.7568628, 1,
1.202509, 0.02343722, 1.929509, 1, 0, 0.7490196, 1,
1.208202, -0.4108942, 0.3977052, 1, 0, 0.7450981, 1,
1.20983, -1.861092, 2.077477, 1, 0, 0.7372549, 1,
1.218197, 0.2074382, 2.012055, 1, 0, 0.7333333, 1,
1.220946, -0.187183, 0.9423839, 1, 0, 0.7254902, 1,
1.225911, 1.426803, 0.1256705, 1, 0, 0.7215686, 1,
1.228683, 0.4576118, -0.02806079, 1, 0, 0.7137255, 1,
1.23065, 0.6082262, 1.511797, 1, 0, 0.7098039, 1,
1.237891, 0.1975325, 1.053583, 1, 0, 0.7019608, 1,
1.244701, 0.7554299, 0.7353077, 1, 0, 0.6941177, 1,
1.246418, -0.1022889, 1.653847, 1, 0, 0.6901961, 1,
1.248785, 0.2970034, 1.511054, 1, 0, 0.682353, 1,
1.250009, -0.6447351, 2.796104, 1, 0, 0.6784314, 1,
1.251066, 0.3386736, 0.8878384, 1, 0, 0.6705883, 1,
1.252619, -1.325127, 2.805514, 1, 0, 0.6666667, 1,
1.271982, -0.9734331, 3.968677, 1, 0, 0.6588235, 1,
1.273493, -0.2622343, 1.134168, 1, 0, 0.654902, 1,
1.274638, -0.2289426, 0.06527437, 1, 0, 0.6470588, 1,
1.276144, -0.7757779, 0.9725931, 1, 0, 0.6431373, 1,
1.286065, 0.5519536, 1.65697, 1, 0, 0.6352941, 1,
1.29001, -0.7145982, 0.7282234, 1, 0, 0.6313726, 1,
1.296151, 0.183101, 2.246417, 1, 0, 0.6235294, 1,
1.300558, -1.243065, 3.708896, 1, 0, 0.6196079, 1,
1.305652, -0.04866248, 1.794515, 1, 0, 0.6117647, 1,
1.308932, -0.05246237, 2.64056, 1, 0, 0.6078432, 1,
1.310292, 0.1385796, 3.697322, 1, 0, 0.6, 1,
1.314324, -0.3406014, 2.37858, 1, 0, 0.5921569, 1,
1.317221, 0.4563093, 1.827303, 1, 0, 0.5882353, 1,
1.32247, 0.5523209, 0.9455075, 1, 0, 0.5803922, 1,
1.326812, 0.0535889, 0.9934757, 1, 0, 0.5764706, 1,
1.341745, 0.4104399, 1.782958, 1, 0, 0.5686275, 1,
1.343145, 0.797264, 0.4528825, 1, 0, 0.5647059, 1,
1.345589, 1.148353, 0.6872618, 1, 0, 0.5568628, 1,
1.362422, 0.4865676, 1.197144, 1, 0, 0.5529412, 1,
1.367383, 0.09176781, -0.5426795, 1, 0, 0.5450981, 1,
1.382956, 0.39009, 0.742495, 1, 0, 0.5411765, 1,
1.391523, 0.4790289, 0.7156125, 1, 0, 0.5333334, 1,
1.405038, 0.6169478, 2.09962, 1, 0, 0.5294118, 1,
1.420648, -1.364633, 2.718217, 1, 0, 0.5215687, 1,
1.422097, -0.1264189, 1.63893, 1, 0, 0.5176471, 1,
1.426786, -1.559953, 1.272054, 1, 0, 0.509804, 1,
1.435193, -0.05419906, -0.04260679, 1, 0, 0.5058824, 1,
1.435449, -0.1443301, 1.450546, 1, 0, 0.4980392, 1,
1.43638, -0.1409971, 2.906739, 1, 0, 0.4901961, 1,
1.464895, -0.3460856, 1.18837, 1, 0, 0.4862745, 1,
1.465314, 0.5925342, 0.781914, 1, 0, 0.4784314, 1,
1.469959, 0.289647, 1.742854, 1, 0, 0.4745098, 1,
1.476182, 0.9507614, 1.353157, 1, 0, 0.4666667, 1,
1.490718, 0.1836512, 3.399796, 1, 0, 0.4627451, 1,
1.49141, -0.2274317, 1.887299, 1, 0, 0.454902, 1,
1.517381, -1.19811, 1.636098, 1, 0, 0.4509804, 1,
1.531747, 0.3356041, 0.7146403, 1, 0, 0.4431373, 1,
1.532023, -1.651351, 1.717418, 1, 0, 0.4392157, 1,
1.534127, -1.647253, 2.327802, 1, 0, 0.4313726, 1,
1.538359, -0.7521827, 2.677394, 1, 0, 0.427451, 1,
1.575667, -0.4729854, 1.312341, 1, 0, 0.4196078, 1,
1.600734, 0.06942225, 2.438904, 1, 0, 0.4156863, 1,
1.602564, 0.2710175, 0.1345928, 1, 0, 0.4078431, 1,
1.604806, 1.597487, -0.1149799, 1, 0, 0.4039216, 1,
1.617121, 0.1839217, -0.05637368, 1, 0, 0.3960784, 1,
1.624066, -0.4819123, 0.3950065, 1, 0, 0.3882353, 1,
1.631405, -2.042304, 4.212667, 1, 0, 0.3843137, 1,
1.638616, -0.4011195, 3.687554, 1, 0, 0.3764706, 1,
1.644914, -0.6910694, 1.34846, 1, 0, 0.372549, 1,
1.647286, 1.664174, 0.9805765, 1, 0, 0.3647059, 1,
1.651488, 0.04377473, 2.864769, 1, 0, 0.3607843, 1,
1.654607, -1.506409, 1.459295, 1, 0, 0.3529412, 1,
1.656306, -0.251264, 2.584602, 1, 0, 0.3490196, 1,
1.699485, -2.548461, 3.622382, 1, 0, 0.3411765, 1,
1.70241, -0.8648518, 1.268224, 1, 0, 0.3372549, 1,
1.712644, -0.6825219, 2.038298, 1, 0, 0.3294118, 1,
1.715727, -0.8906843, 2.968763, 1, 0, 0.3254902, 1,
1.717262, -0.8841138, 2.937506, 1, 0, 0.3176471, 1,
1.717265, -3.343067, 1.013518, 1, 0, 0.3137255, 1,
1.743926, 0.002756918, 2.073982, 1, 0, 0.3058824, 1,
1.75293, -1.406412, 3.891959, 1, 0, 0.2980392, 1,
1.755605, 0.9014632, -0.9527321, 1, 0, 0.2941177, 1,
1.765906, 1.332738, -0.1297139, 1, 0, 0.2862745, 1,
1.769544, 0.05943394, 2.431048, 1, 0, 0.282353, 1,
1.777041, -1.521032, 0.7906176, 1, 0, 0.2745098, 1,
1.779559, -1.366689, 3.513796, 1, 0, 0.2705882, 1,
1.791827, 1.905393, 0.06775966, 1, 0, 0.2627451, 1,
1.809556, -1.858461, 1.8184, 1, 0, 0.2588235, 1,
1.83103, -1.601142, 0.8619455, 1, 0, 0.2509804, 1,
1.838562, -0.1283474, 0.7897453, 1, 0, 0.2470588, 1,
1.849411, -1.070607, 2.093826, 1, 0, 0.2392157, 1,
1.866881, 1.916092, -0.2403868, 1, 0, 0.2352941, 1,
1.873258, -1.379466, 0.7417981, 1, 0, 0.227451, 1,
1.874986, -0.870636, 1.810802, 1, 0, 0.2235294, 1,
1.895402, 0.3249373, 3.092421, 1, 0, 0.2156863, 1,
1.912821, -0.1966688, 0.9394848, 1, 0, 0.2117647, 1,
1.938678, 0.7788938, 0.865173, 1, 0, 0.2039216, 1,
1.938732, -0.192183, 2.526834, 1, 0, 0.1960784, 1,
1.946156, -0.2791079, 3.919013, 1, 0, 0.1921569, 1,
1.94749, -0.324845, 0.6883221, 1, 0, 0.1843137, 1,
1.950656, 0.9313649, 1.278954, 1, 0, 0.1803922, 1,
1.954157, -1.74539, 3.535062, 1, 0, 0.172549, 1,
1.965333, -0.2255776, 2.512505, 1, 0, 0.1686275, 1,
1.967766, 0.9719358, 2.379239, 1, 0, 0.1607843, 1,
1.968584, -1.535763, 3.040085, 1, 0, 0.1568628, 1,
1.983545, -1.326172, 3.034631, 1, 0, 0.1490196, 1,
2.004228, -0.8074804, 1.205842, 1, 0, 0.145098, 1,
2.036323, -1.187573, 1.197387, 1, 0, 0.1372549, 1,
2.039125, 1.755066, 0.1197972, 1, 0, 0.1333333, 1,
2.040774, -1.476905, 0.2903399, 1, 0, 0.1254902, 1,
2.08103, -2.473823, 3.816469, 1, 0, 0.1215686, 1,
2.086629, 0.1925258, 3.891498, 1, 0, 0.1137255, 1,
2.101991, -0.7648089, 2.00737, 1, 0, 0.1098039, 1,
2.103157, -0.3165605, 2.629514, 1, 0, 0.1019608, 1,
2.126219, 2.390598, -0.3479044, 1, 0, 0.09411765, 1,
2.128195, -0.3467578, 1.566635, 1, 0, 0.09019608, 1,
2.129938, -1.914112, 1.937842, 1, 0, 0.08235294, 1,
2.153594, 0.4390133, 2.057956, 1, 0, 0.07843138, 1,
2.16014, -0.1065712, 1.033454, 1, 0, 0.07058824, 1,
2.186496, -1.275193, 2.206704, 1, 0, 0.06666667, 1,
2.188574, -2.793889, 1.275996, 1, 0, 0.05882353, 1,
2.192064, -2.071811, 2.47696, 1, 0, 0.05490196, 1,
2.225499, 1.881443, 0.784405, 1, 0, 0.04705882, 1,
2.255723, 1.095851, 0.9740292, 1, 0, 0.04313726, 1,
2.302789, 0.4790579, 1.023291, 1, 0, 0.03529412, 1,
2.33498, -2.134763, 2.498216, 1, 0, 0.03137255, 1,
2.464515, -1.278734, 1.977661, 1, 0, 0.02352941, 1,
2.778146, 0.8087004, 3.118264, 1, 0, 0.01960784, 1,
2.858865, 0.1379313, 2.252542, 1, 0, 0.01176471, 1,
3.07256, -1.151245, 2.194839, 1, 0, 0.007843138, 1
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
0.2405596, -4.723116, -6.613098, 0, -0.5, 0.5, 0.5,
0.2405596, -4.723116, -6.613098, 1, -0.5, 0.5, 0.5,
0.2405596, -4.723116, -6.613098, 1, 1.5, 0.5, 0.5,
0.2405596, -4.723116, -6.613098, 0, 1.5, 0.5, 0.5
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
-3.551488, -0.03598499, -6.613098, 0, -0.5, 0.5, 0.5,
-3.551488, -0.03598499, -6.613098, 1, -0.5, 0.5, 0.5,
-3.551488, -0.03598499, -6.613098, 1, 1.5, 0.5, 0.5,
-3.551488, -0.03598499, -6.613098, 0, 1.5, 0.5, 0.5
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
-3.551488, -4.723116, -0.01874089, 0, -0.5, 0.5, 0.5,
-3.551488, -4.723116, -0.01874089, 1, -0.5, 0.5, 0.5,
-3.551488, -4.723116, -0.01874089, 1, 1.5, 0.5, 0.5,
-3.551488, -4.723116, -0.01874089, 0, 1.5, 0.5, 0.5
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
-2, -3.641471, -5.091323,
3, -3.641471, -5.091323,
-2, -3.641471, -5.091323,
-2, -3.821745, -5.344953,
-1, -3.641471, -5.091323,
-1, -3.821745, -5.344953,
0, -3.641471, -5.091323,
0, -3.821745, -5.344953,
1, -3.641471, -5.091323,
1, -3.821745, -5.344953,
2, -3.641471, -5.091323,
2, -3.821745, -5.344953,
3, -3.641471, -5.091323,
3, -3.821745, -5.344953
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
-2, -4.182293, -5.852211, 0, -0.5, 0.5, 0.5,
-2, -4.182293, -5.852211, 1, -0.5, 0.5, 0.5,
-2, -4.182293, -5.852211, 1, 1.5, 0.5, 0.5,
-2, -4.182293, -5.852211, 0, 1.5, 0.5, 0.5,
-1, -4.182293, -5.852211, 0, -0.5, 0.5, 0.5,
-1, -4.182293, -5.852211, 1, -0.5, 0.5, 0.5,
-1, -4.182293, -5.852211, 1, 1.5, 0.5, 0.5,
-1, -4.182293, -5.852211, 0, 1.5, 0.5, 0.5,
0, -4.182293, -5.852211, 0, -0.5, 0.5, 0.5,
0, -4.182293, -5.852211, 1, -0.5, 0.5, 0.5,
0, -4.182293, -5.852211, 1, 1.5, 0.5, 0.5,
0, -4.182293, -5.852211, 0, 1.5, 0.5, 0.5,
1, -4.182293, -5.852211, 0, -0.5, 0.5, 0.5,
1, -4.182293, -5.852211, 1, -0.5, 0.5, 0.5,
1, -4.182293, -5.852211, 1, 1.5, 0.5, 0.5,
1, -4.182293, -5.852211, 0, 1.5, 0.5, 0.5,
2, -4.182293, -5.852211, 0, -0.5, 0.5, 0.5,
2, -4.182293, -5.852211, 1, -0.5, 0.5, 0.5,
2, -4.182293, -5.852211, 1, 1.5, 0.5, 0.5,
2, -4.182293, -5.852211, 0, 1.5, 0.5, 0.5,
3, -4.182293, -5.852211, 0, -0.5, 0.5, 0.5,
3, -4.182293, -5.852211, 1, -0.5, 0.5, 0.5,
3, -4.182293, -5.852211, 1, 1.5, 0.5, 0.5,
3, -4.182293, -5.852211, 0, 1.5, 0.5, 0.5
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
-2.6764, -2, -5.091323,
-2.6764, 2, -5.091323,
-2.6764, -2, -5.091323,
-2.822248, -2, -5.344953,
-2.6764, 0, -5.091323,
-2.822248, 0, -5.344953,
-2.6764, 2, -5.091323,
-2.822248, 2, -5.344953
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
-3.113945, -2, -5.852211, 0, -0.5, 0.5, 0.5,
-3.113945, -2, -5.852211, 1, -0.5, 0.5, 0.5,
-3.113945, -2, -5.852211, 1, 1.5, 0.5, 0.5,
-3.113945, -2, -5.852211, 0, 1.5, 0.5, 0.5,
-3.113945, 0, -5.852211, 0, -0.5, 0.5, 0.5,
-3.113945, 0, -5.852211, 1, -0.5, 0.5, 0.5,
-3.113945, 0, -5.852211, 1, 1.5, 0.5, 0.5,
-3.113945, 0, -5.852211, 0, 1.5, 0.5, 0.5,
-3.113945, 2, -5.852211, 0, -0.5, 0.5, 0.5,
-3.113945, 2, -5.852211, 1, -0.5, 0.5, 0.5,
-3.113945, 2, -5.852211, 1, 1.5, 0.5, 0.5,
-3.113945, 2, -5.852211, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-2.6764, -3.641471, -4,
-2.6764, -3.641471, 4,
-2.6764, -3.641471, -4,
-2.822248, -3.821745, -4,
-2.6764, -3.641471, -2,
-2.822248, -3.821745, -2,
-2.6764, -3.641471, 0,
-2.822248, -3.821745, 0,
-2.6764, -3.641471, 2,
-2.822248, -3.821745, 2,
-2.6764, -3.641471, 4,
-2.822248, -3.821745, 4
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
-3.113945, -4.182293, -4, 0, -0.5, 0.5, 0.5,
-3.113945, -4.182293, -4, 1, -0.5, 0.5, 0.5,
-3.113945, -4.182293, -4, 1, 1.5, 0.5, 0.5,
-3.113945, -4.182293, -4, 0, 1.5, 0.5, 0.5,
-3.113945, -4.182293, -2, 0, -0.5, 0.5, 0.5,
-3.113945, -4.182293, -2, 1, -0.5, 0.5, 0.5,
-3.113945, -4.182293, -2, 1, 1.5, 0.5, 0.5,
-3.113945, -4.182293, -2, 0, 1.5, 0.5, 0.5,
-3.113945, -4.182293, 0, 0, -0.5, 0.5, 0.5,
-3.113945, -4.182293, 0, 1, -0.5, 0.5, 0.5,
-3.113945, -4.182293, 0, 1, 1.5, 0.5, 0.5,
-3.113945, -4.182293, 0, 0, 1.5, 0.5, 0.5,
-3.113945, -4.182293, 2, 0, -0.5, 0.5, 0.5,
-3.113945, -4.182293, 2, 1, -0.5, 0.5, 0.5,
-3.113945, -4.182293, 2, 1, 1.5, 0.5, 0.5,
-3.113945, -4.182293, 2, 0, 1.5, 0.5, 0.5,
-3.113945, -4.182293, 4, 0, -0.5, 0.5, 0.5,
-3.113945, -4.182293, 4, 1, -0.5, 0.5, 0.5,
-3.113945, -4.182293, 4, 1, 1.5, 0.5, 0.5,
-3.113945, -4.182293, 4, 0, 1.5, 0.5, 0.5
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
-2.6764, -3.641471, -5.091323,
-2.6764, 3.569501, -5.091323,
-2.6764, -3.641471, 5.053842,
-2.6764, 3.569501, 5.053842,
-2.6764, -3.641471, -5.091323,
-2.6764, -3.641471, 5.053842,
-2.6764, 3.569501, -5.091323,
-2.6764, 3.569501, 5.053842,
-2.6764, -3.641471, -5.091323,
3.15752, -3.641471, -5.091323,
-2.6764, -3.641471, 5.053842,
3.15752, -3.641471, 5.053842,
-2.6764, 3.569501, -5.091323,
3.15752, 3.569501, -5.091323,
-2.6764, 3.569501, 5.053842,
3.15752, 3.569501, 5.053842,
3.15752, -3.641471, -5.091323,
3.15752, 3.569501, -5.091323,
3.15752, -3.641471, 5.053842,
3.15752, 3.569501, 5.053842,
3.15752, -3.641471, -5.091323,
3.15752, -3.641471, 5.053842,
3.15752, 3.569501, -5.091323,
3.15752, 3.569501, 5.053842
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
var radius = 7.340186;
var distance = 32.65732;
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
mvMatrix.translate( -0.2405596, 0.03598499, 0.01874089 );
mvMatrix.scale( 1.360381, 1.100594, 0.7822794 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.65732);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
O-ethyl_S-propyl_pho<-read.table("O-ethyl_S-propyl_pho.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-O-ethyl_S-propyl_pho$V2
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
y<-O-ethyl_S-propyl_pho$V3
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
z<-O-ethyl_S-propyl_pho$V4
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
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
-2.59144, 0.9530907, -1.544502, 0, 0, 1, 1, 1,
-2.554568, -0.7911776, -1.653719, 1, 0, 0, 1, 1,
-2.481652, -2.369527, -1.905901, 1, 0, 0, 1, 1,
-2.412442, 0.2960256, -0.8011329, 1, 0, 0, 1, 1,
-2.265109, 0.01757177, -2.040603, 1, 0, 0, 1, 1,
-2.261967, -0.011129, -0.9794828, 1, 0, 0, 1, 1,
-2.198625, -1.47079, -2.248117, 0, 0, 0, 1, 1,
-2.175337, -0.2899964, -0.415521, 0, 0, 0, 1, 1,
-2.168138, 0.006148725, -1.904428, 0, 0, 0, 1, 1,
-2.166613, -0.9784884, -0.9361513, 0, 0, 0, 1, 1,
-2.162002, 0.2962498, 1.014604, 0, 0, 0, 1, 1,
-2.09652, -1.031102, -2.750686, 0, 0, 0, 1, 1,
-2.065855, -1.104228, -1.582489, 0, 0, 0, 1, 1,
-2.063259, 0.107631, -1.572056, 1, 1, 1, 1, 1,
-2.047156, 0.9544575, -1.477194, 1, 1, 1, 1, 1,
-2.037144, -0.1986867, -1.312088, 1, 1, 1, 1, 1,
-2.02611, -0.01902377, -1.322115, 1, 1, 1, 1, 1,
-2.018935, 0.2082324, -1.541127, 1, 1, 1, 1, 1,
-1.983092, -1.161614, -3.438072, 1, 1, 1, 1, 1,
-1.982696, -0.2302694, -2.30973, 1, 1, 1, 1, 1,
-1.973027, 0.4457468, -0.4399626, 1, 1, 1, 1, 1,
-1.963299, 0.6837117, -1.882468, 1, 1, 1, 1, 1,
-1.931725, -1.81168, -2.634024, 1, 1, 1, 1, 1,
-1.92666, -0.8545812, -1.359054, 1, 1, 1, 1, 1,
-1.887332, -0.6597984, -0.9963216, 1, 1, 1, 1, 1,
-1.887244, 0.9885332, 0.846934, 1, 1, 1, 1, 1,
-1.882749, -0.7531601, -1.173101, 1, 1, 1, 1, 1,
-1.880692, 0.4940048, -2.029273, 1, 1, 1, 1, 1,
-1.849626, -0.007802549, -1.645293, 0, 0, 1, 1, 1,
-1.849337, -0.9085552, -2.937636, 1, 0, 0, 1, 1,
-1.8405, -1.025199, -1.611025, 1, 0, 0, 1, 1,
-1.828488, 0.4541945, -0.8723871, 1, 0, 0, 1, 1,
-1.825912, -2.046708, -1.818636, 1, 0, 0, 1, 1,
-1.776978, 1.903645, -1.613708, 1, 0, 0, 1, 1,
-1.76498, 1.378945, -1.584696, 0, 0, 0, 1, 1,
-1.76054, 0.7603934, -2.729247, 0, 0, 0, 1, 1,
-1.737423, 1.616279, -1.504905, 0, 0, 0, 1, 1,
-1.70638, 1.43717, -1.186314, 0, 0, 0, 1, 1,
-1.704279, 0.2087298, -0.6126853, 0, 0, 0, 1, 1,
-1.700689, 0.2410307, -2.267003, 0, 0, 0, 1, 1,
-1.698356, 0.07992499, 0.5207503, 0, 0, 0, 1, 1,
-1.696452, -0.8624304, -0.4512942, 1, 1, 1, 1, 1,
-1.686623, 0.4568556, -0.4589552, 1, 1, 1, 1, 1,
-1.68629, -0.7462493, -1.745277, 1, 1, 1, 1, 1,
-1.676513, -1.005422, -1.760721, 1, 1, 1, 1, 1,
-1.64254, -2.489356, -3.077469, 1, 1, 1, 1, 1,
-1.637197, 1.360569, -1.447188, 1, 1, 1, 1, 1,
-1.636936, 0.1466665, 0.0105666, 1, 1, 1, 1, 1,
-1.622756, -0.0560751, -1.368452, 1, 1, 1, 1, 1,
-1.615617, 0.7981138, 0.01152507, 1, 1, 1, 1, 1,
-1.613064, 0.6519704, -2.247899, 1, 1, 1, 1, 1,
-1.603682, 0.346175, -3.703352, 1, 1, 1, 1, 1,
-1.60062, 0.4612933, -1.687386, 1, 1, 1, 1, 1,
-1.598758, -0.6559451, 0.3909874, 1, 1, 1, 1, 1,
-1.582851, 0.5271882, -1.446653, 1, 1, 1, 1, 1,
-1.572231, -0.3490135, -2.707647, 1, 1, 1, 1, 1,
-1.532518, -0.2952491, -1.358183, 0, 0, 1, 1, 1,
-1.532057, -0.00408485, -2.84102, 1, 0, 0, 1, 1,
-1.52646, 1.265059, -1.888424, 1, 0, 0, 1, 1,
-1.517882, -0.4561148, -1.425191, 1, 0, 0, 1, 1,
-1.506352, -0.5129452, -2.161973, 1, 0, 0, 1, 1,
-1.480035, -0.1521992, -1.626214, 1, 0, 0, 1, 1,
-1.47442, -1.21145, -1.237886, 0, 0, 0, 1, 1,
-1.472006, -1.424698, -3.897452, 0, 0, 0, 1, 1,
-1.463401, -0.0938797, -0.6263394, 0, 0, 0, 1, 1,
-1.448775, 0.2503478, -0.7952747, 0, 0, 0, 1, 1,
-1.445261, 0.1668467, 0.04143352, 0, 0, 0, 1, 1,
-1.425207, 0.7822247, -1.289701, 0, 0, 0, 1, 1,
-1.422921, -0.2975976, -4.152555, 0, 0, 0, 1, 1,
-1.412395, -0.7073505, -2.215352, 1, 1, 1, 1, 1,
-1.411419, 0.1412676, -4.18379, 1, 1, 1, 1, 1,
-1.410617, -1.034238, -1.131207, 1, 1, 1, 1, 1,
-1.40827, 0.2514983, -1.953619, 1, 1, 1, 1, 1,
-1.380433, 0.6508847, -0.1263597, 1, 1, 1, 1, 1,
-1.367447, 0.06813395, -1.260569, 1, 1, 1, 1, 1,
-1.352315, -0.3942701, -0.9958918, 1, 1, 1, 1, 1,
-1.346344, 0.6941032, -0.8680613, 1, 1, 1, 1, 1,
-1.339468, -1.102006, -2.617015, 1, 1, 1, 1, 1,
-1.339229, -0.3301665, -1.484589, 1, 1, 1, 1, 1,
-1.338196, 0.4877411, 0.8684396, 1, 1, 1, 1, 1,
-1.337577, -0.502479, -1.999745, 1, 1, 1, 1, 1,
-1.331409, 1.786038, 0.3583706, 1, 1, 1, 1, 1,
-1.327147, 0.1137471, -1.003144, 1, 1, 1, 1, 1,
-1.324592, -0.4637454, -1.932005, 1, 1, 1, 1, 1,
-1.322381, -1.400057, -3.217288, 0, 0, 1, 1, 1,
-1.32129, -2.567997, -1.60379, 1, 0, 0, 1, 1,
-1.312174, -0.1045705, -2.312951, 1, 0, 0, 1, 1,
-1.280266, 0.05298817, -1.087976, 1, 0, 0, 1, 1,
-1.273514, -1.459425, -1.873499, 1, 0, 0, 1, 1,
-1.272017, -0.2158973, -2.421481, 1, 0, 0, 1, 1,
-1.268626, 0.489445, -1.296502, 0, 0, 0, 1, 1,
-1.263468, 1.310643, -1.554822, 0, 0, 0, 1, 1,
-1.262596, 0.9966964, -0.7034907, 0, 0, 0, 1, 1,
-1.26138, 1.16428, -0.5161155, 0, 0, 0, 1, 1,
-1.248643, 1.248623, 0.4142931, 0, 0, 0, 1, 1,
-1.242691, 0.189687, -1.770109, 0, 0, 0, 1, 1,
-1.238306, 2.402775, -0.5602867, 0, 0, 0, 1, 1,
-1.236328, -2.642353, -4.823528, 1, 1, 1, 1, 1,
-1.235186, -0.1612887, -1.06767, 1, 1, 1, 1, 1,
-1.234474, 0.1493719, 0.3055362, 1, 1, 1, 1, 1,
-1.233513, 0.1262487, -2.455144, 1, 1, 1, 1, 1,
-1.22631, 0.7445326, -1.675956, 1, 1, 1, 1, 1,
-1.225398, -0.1326517, -2.510217, 1, 1, 1, 1, 1,
-1.221634, 1.116757, -0.178452, 1, 1, 1, 1, 1,
-1.215811, 0.4043329, -2.062302, 1, 1, 1, 1, 1,
-1.213396, 1.532672, -0.3254961, 1, 1, 1, 1, 1,
-1.211364, -0.831416, -1.219605, 1, 1, 1, 1, 1,
-1.210668, -0.08488026, -2.764636, 1, 1, 1, 1, 1,
-1.210174, -0.04329706, -2.844007, 1, 1, 1, 1, 1,
-1.197311, -1.763479, -3.400145, 1, 1, 1, 1, 1,
-1.196929, 0.1646149, -1.636982, 1, 1, 1, 1, 1,
-1.194134, 0.9070979, -0.6922334, 1, 1, 1, 1, 1,
-1.189852, -0.1087775, -1.394176, 0, 0, 1, 1, 1,
-1.185584, -0.08445934, -1.640051, 1, 0, 0, 1, 1,
-1.180758, -0.03865135, -1.755852, 1, 0, 0, 1, 1,
-1.172581, 1.395581, -0.9671783, 1, 0, 0, 1, 1,
-1.154003, 0.07140415, -3.417675, 1, 0, 0, 1, 1,
-1.149709, -0.647499, -2.769304, 1, 0, 0, 1, 1,
-1.145576, -0.5699341, -1.132643, 0, 0, 0, 1, 1,
-1.134407, 0.3062744, -1.431036, 0, 0, 0, 1, 1,
-1.132656, 0.9841585, -0.7334837, 0, 0, 0, 1, 1,
-1.123307, -0.0813791, 0.7960557, 0, 0, 0, 1, 1,
-1.120677, 1.39253, -0.9708174, 0, 0, 0, 1, 1,
-1.119344, 0.224597, -1.794915, 0, 0, 0, 1, 1,
-1.117676, 0.8631854, 0.1586833, 0, 0, 0, 1, 1,
-1.117278, 0.8465434, -0.2660827, 1, 1, 1, 1, 1,
-1.112036, -1.050406, -2.834135, 1, 1, 1, 1, 1,
-1.094569, -1.303331, -2.617993, 1, 1, 1, 1, 1,
-1.092983, 1.863203, -0.1033469, 1, 1, 1, 1, 1,
-1.080587, -0.07948112, -2.999884, 1, 1, 1, 1, 1,
-1.080307, -0.2794461, -0.4886952, 1, 1, 1, 1, 1,
-1.076496, -0.0185061, -0.7956723, 1, 1, 1, 1, 1,
-1.072944, -0.4276734, -3.296797, 1, 1, 1, 1, 1,
-1.071762, 1.285745, -0.9476778, 1, 1, 1, 1, 1,
-1.064066, -0.2671082, -1.942194, 1, 1, 1, 1, 1,
-1.052531, -0.4837008, -2.078144, 1, 1, 1, 1, 1,
-1.05032, -1.024432, -2.364782, 1, 1, 1, 1, 1,
-1.049189, -1.516458, -1.802223, 1, 1, 1, 1, 1,
-1.045676, -2.172101, -3.020873, 1, 1, 1, 1, 1,
-1.042669, -0.771212, -1.338927, 1, 1, 1, 1, 1,
-1.032172, -0.3021063, -3.922174, 0, 0, 1, 1, 1,
-1.027065, 0.8102417, -1.98547, 1, 0, 0, 1, 1,
-1.025809, -0.5780664, -2.187307, 1, 0, 0, 1, 1,
-1.020542, 0.1988977, -0.01626872, 1, 0, 0, 1, 1,
-1.017324, -1.362296, -3.20657, 1, 0, 0, 1, 1,
-1.015993, -0.3866048, -2.544907, 1, 0, 0, 1, 1,
-1.009252, -1.070173, -2.47277, 0, 0, 0, 1, 1,
-0.9985753, -0.9829625, -2.615354, 0, 0, 0, 1, 1,
-0.9967976, -0.5097074, -2.001734, 0, 0, 0, 1, 1,
-0.9931732, -0.8140883, -2.807576, 0, 0, 0, 1, 1,
-0.9890781, -0.9622884, -3.097833, 0, 0, 0, 1, 1,
-0.9875687, -0.01206463, -1.754994, 0, 0, 0, 1, 1,
-0.9832752, 1.432982, -1.71802, 0, 0, 0, 1, 1,
-0.9778318, 0.2534429, -1.456086, 1, 1, 1, 1, 1,
-0.9658049, -0.5182883, -2.449728, 1, 1, 1, 1, 1,
-0.9568923, 1.418613, -1.156009, 1, 1, 1, 1, 1,
-0.9568261, 0.1244484, -3.298556, 1, 1, 1, 1, 1,
-0.9552892, -1.303269, -1.359664, 1, 1, 1, 1, 1,
-0.9538299, -0.2308245, -1.24649, 1, 1, 1, 1, 1,
-0.9530782, 1.7042, -0.2646862, 1, 1, 1, 1, 1,
-0.9435424, 0.1722777, 0.1177869, 1, 1, 1, 1, 1,
-0.9426301, 1.686888, -1.366927, 1, 1, 1, 1, 1,
-0.9396106, 0.4041119, 0.1588231, 1, 1, 1, 1, 1,
-0.938808, -1.414614, -4.31822, 1, 1, 1, 1, 1,
-0.9366485, -0.7992175, -3.085709, 1, 1, 1, 1, 1,
-0.9217657, 0.5266421, 0.7332948, 1, 1, 1, 1, 1,
-0.9105202, 1.568864, -0.840234, 1, 1, 1, 1, 1,
-0.9095651, -0.723627, -2.853909, 1, 1, 1, 1, 1,
-0.9029382, 1.130015, 0.08899252, 0, 0, 1, 1, 1,
-0.8972582, 0.7062311, -1.291491, 1, 0, 0, 1, 1,
-0.8943952, 1.030405, -1.68599, 1, 0, 0, 1, 1,
-0.8900606, -0.05666643, -2.164307, 1, 0, 0, 1, 1,
-0.8891227, -1.814319, -3.500442, 1, 0, 0, 1, 1,
-0.8875096, -0.4453491, -2.770315, 1, 0, 0, 1, 1,
-0.8802854, 0.2379005, -0.3887898, 0, 0, 0, 1, 1,
-0.8801302, -1.91709, -2.024867, 0, 0, 0, 1, 1,
-0.8787017, 0.4071499, 0.3323426, 0, 0, 0, 1, 1,
-0.8780857, -1.048593, -2.001171, 0, 0, 0, 1, 1,
-0.8775918, 0.09853657, -1.275597, 0, 0, 0, 1, 1,
-0.8774987, 0.08057155, -1.686435, 0, 0, 0, 1, 1,
-0.8751497, 0.5597861, -1.051673, 0, 0, 0, 1, 1,
-0.868905, 0.6332033, -1.617639, 1, 1, 1, 1, 1,
-0.8658506, 0.3656611, -1.737068, 1, 1, 1, 1, 1,
-0.8643229, -1.058815, -0.7549672, 1, 1, 1, 1, 1,
-0.8616905, 0.4750706, -1.99566, 1, 1, 1, 1, 1,
-0.8585105, 0.2689341, -3.001933, 1, 1, 1, 1, 1,
-0.8415084, 0.414155, -2.278877, 1, 1, 1, 1, 1,
-0.8382332, -0.9949789, -3.719663, 1, 1, 1, 1, 1,
-0.8333824, 2.194773, -0.2399292, 1, 1, 1, 1, 1,
-0.8305055, 0.06064415, -3.367161, 1, 1, 1, 1, 1,
-0.8283794, 0.7190687, -1.448501, 1, 1, 1, 1, 1,
-0.8153458, 1.47043, -1.192583, 1, 1, 1, 1, 1,
-0.8080723, -0.1037691, -1.038691, 1, 1, 1, 1, 1,
-0.8012937, 0.02529463, -1.642501, 1, 1, 1, 1, 1,
-0.7970046, 0.1721251, -1.383092, 1, 1, 1, 1, 1,
-0.7893213, 0.622439, 1.279355, 1, 1, 1, 1, 1,
-0.7872587, 0.6251208, -1.185163, 0, 0, 1, 1, 1,
-0.7851898, -0.2221338, -3.22632, 1, 0, 0, 1, 1,
-0.7770302, -0.9072107, -1.542506, 1, 0, 0, 1, 1,
-0.7765221, 1.5243, -1.054075, 1, 0, 0, 1, 1,
-0.77613, 0.7902469, 0.5764935, 1, 0, 0, 1, 1,
-0.7657214, -0.8574392, -3.811174, 1, 0, 0, 1, 1,
-0.7639947, -0.6031162, -0.5910549, 0, 0, 0, 1, 1,
-0.7628725, -0.9929862, -3.377186, 0, 0, 0, 1, 1,
-0.7625685, -1.628841, -2.856794, 0, 0, 0, 1, 1,
-0.7614627, 0.2262418, -2.294622, 0, 0, 0, 1, 1,
-0.7525057, 1.429145, -1.188111, 0, 0, 0, 1, 1,
-0.7419423, 0.02886309, 0.1334891, 0, 0, 0, 1, 1,
-0.7369038, 2.052751, 0.6532009, 0, 0, 0, 1, 1,
-0.7351863, 0.2322171, -3.357087, 1, 1, 1, 1, 1,
-0.7343109, -0.03021701, -2.009178, 1, 1, 1, 1, 1,
-0.7315586, -1.658898, -1.053075, 1, 1, 1, 1, 1,
-0.7232077, 0.8301139, -0.5290439, 1, 1, 1, 1, 1,
-0.7193393, -0.4763663, -0.4899791, 1, 1, 1, 1, 1,
-0.7138975, 0.1543388, -1.481615, 1, 1, 1, 1, 1,
-0.7096925, 0.9002873, 0.7796906, 1, 1, 1, 1, 1,
-0.7056057, 1.043395, -0.8087021, 1, 1, 1, 1, 1,
-0.703603, -1.224968, -2.103987, 1, 1, 1, 1, 1,
-0.7020667, -0.7140679, -1.476861, 1, 1, 1, 1, 1,
-0.6960464, 0.437372, -1.524012, 1, 1, 1, 1, 1,
-0.6852114, -0.5298433, -1.909891, 1, 1, 1, 1, 1,
-0.6823439, 1.290579, 0.1138716, 1, 1, 1, 1, 1,
-0.6792786, -0.1976376, -3.258912, 1, 1, 1, 1, 1,
-0.6781704, -1.105855, -2.599739, 1, 1, 1, 1, 1,
-0.6773449, 0.3130208, -1.247505, 0, 0, 1, 1, 1,
-0.6768065, 0.1867065, -1.482765, 1, 0, 0, 1, 1,
-0.674634, -0.9682363, -2.308771, 1, 0, 0, 1, 1,
-0.6625995, -0.04957246, -1.467574, 1, 0, 0, 1, 1,
-0.6614069, -0.3358725, 0.1033974, 1, 0, 0, 1, 1,
-0.6594145, -0.8683436, -3.226115, 1, 0, 0, 1, 1,
-0.6550202, -0.8372631, -2.887973, 0, 0, 0, 1, 1,
-0.651538, 0.3456147, -0.9882376, 0, 0, 0, 1, 1,
-0.6482437, -0.9292217, -1.560011, 0, 0, 0, 1, 1,
-0.6462175, -0.7031205, -1.780894, 0, 0, 0, 1, 1,
-0.6460435, 2.526903, -0.4548962, 0, 0, 0, 1, 1,
-0.6458946, -0.4215134, -2.119311, 0, 0, 0, 1, 1,
-0.6411235, 0.6374892, -0.07494335, 0, 0, 0, 1, 1,
-0.6295868, -0.3919876, -3.006976, 1, 1, 1, 1, 1,
-0.6201801, -0.4123996, -2.437699, 1, 1, 1, 1, 1,
-0.6162351, -1.048607, -0.2573895, 1, 1, 1, 1, 1,
-0.6161928, 0.7623459, -2.773853, 1, 1, 1, 1, 1,
-0.6161292, -0.206756, -1.114778, 1, 1, 1, 1, 1,
-0.6156992, 0.7150362, -1.297416, 1, 1, 1, 1, 1,
-0.6043838, -0.4829218, -2.919482, 1, 1, 1, 1, 1,
-0.6035373, -0.2324435, -2.706268, 1, 1, 1, 1, 1,
-0.5972825, -1.388333, -2.874445, 1, 1, 1, 1, 1,
-0.5962155, -0.811565, -2.139622, 1, 1, 1, 1, 1,
-0.5936531, 1.455471, 0.5419029, 1, 1, 1, 1, 1,
-0.5913842, 0.8762427, -0.1943253, 1, 1, 1, 1, 1,
-0.59011, -0.3861699, -1.585888, 1, 1, 1, 1, 1,
-0.5812985, -0.4387667, -1.760999, 1, 1, 1, 1, 1,
-0.5770034, -0.6814607, -2.408738, 1, 1, 1, 1, 1,
-0.5707318, -0.6544739, -3.080608, 0, 0, 1, 1, 1,
-0.566528, -0.2180303, -2.75777, 1, 0, 0, 1, 1,
-0.5608053, -0.6201679, -1.515926, 1, 0, 0, 1, 1,
-0.5598859, -2.548306, -2.83808, 1, 0, 0, 1, 1,
-0.5489737, -0.1349559, 0.5583389, 1, 0, 0, 1, 1,
-0.5489115, -0.9432911, -3.954507, 1, 0, 0, 1, 1,
-0.5475775, 0.1884689, -0.1444767, 0, 0, 0, 1, 1,
-0.5421552, 0.525963, -3.802486, 0, 0, 0, 1, 1,
-0.5297217, -2.667587, -3.724627, 0, 0, 0, 1, 1,
-0.521964, 0.1144387, -1.870906, 0, 0, 0, 1, 1,
-0.5202675, -1.75329, -3.549963, 0, 0, 0, 1, 1,
-0.514179, 1.108714, -1.827132, 0, 0, 0, 1, 1,
-0.5125535, 0.8993472, -0.7175428, 0, 0, 0, 1, 1,
-0.5093699, 1.504858, -1.474384, 1, 1, 1, 1, 1,
-0.5077716, 1.796682, -0.9771169, 1, 1, 1, 1, 1,
-0.5044948, 0.9053292, 0.2656566, 1, 1, 1, 1, 1,
-0.5011213, 0.8775418, -0.65356, 1, 1, 1, 1, 1,
-0.4977542, 0.169574, 0.2369564, 1, 1, 1, 1, 1,
-0.4926504, 0.6890676, -1.295835, 1, 1, 1, 1, 1,
-0.4900372, 0.2433969, -1.480131, 1, 1, 1, 1, 1,
-0.4872956, -0.5551184, -3.085948, 1, 1, 1, 1, 1,
-0.4860187, -0.1162354, -1.815619, 1, 1, 1, 1, 1,
-0.4847693, -0.2130563, -2.279128, 1, 1, 1, 1, 1,
-0.4771691, 0.6961521, -0.2501538, 1, 1, 1, 1, 1,
-0.476289, -0.05212026, -0.1119912, 1, 1, 1, 1, 1,
-0.4707401, 0.06871594, -1.722071, 1, 1, 1, 1, 1,
-0.4699821, -1.618143, -2.483552, 1, 1, 1, 1, 1,
-0.4694479, -1.020489, -2.759905, 1, 1, 1, 1, 1,
-0.4646674, 0.4677771, 0.04261329, 0, 0, 1, 1, 1,
-0.4621359, 0.6386196, 0.9592665, 1, 0, 0, 1, 1,
-0.4616057, -1.066884, -3.383787, 1, 0, 0, 1, 1,
-0.4572573, -0.2070627, -2.296499, 1, 0, 0, 1, 1,
-0.4563518, -0.3996496, -2.571785, 1, 0, 0, 1, 1,
-0.4548175, 0.8241693, -0.9924514, 1, 0, 0, 1, 1,
-0.4544539, -1.670886, -3.758806, 0, 0, 0, 1, 1,
-0.4522977, 1.346133, -0.3038398, 0, 0, 0, 1, 1,
-0.4522187, 1.610335, -0.6220192, 0, 0, 0, 1, 1,
-0.4471992, -1.058829, -3.011929, 0, 0, 0, 1, 1,
-0.4435397, -1.587058, -2.48239, 0, 0, 0, 1, 1,
-0.4411158, -0.2375049, -3.426817, 0, 0, 0, 1, 1,
-0.4382251, 2.473255, 0.776669, 0, 0, 0, 1, 1,
-0.4371919, 2.235026, 0.6706556, 1, 1, 1, 1, 1,
-0.4357964, -0.5316811, -2.613782, 1, 1, 1, 1, 1,
-0.428354, -0.5234551, -0.9116578, 1, 1, 1, 1, 1,
-0.4281419, 1.129155, 0.6564344, 1, 1, 1, 1, 1,
-0.4266129, 0.8397405, -0.01557828, 1, 1, 1, 1, 1,
-0.4249623, -0.1046302, -0.6573624, 1, 1, 1, 1, 1,
-0.424926, 0.4892402, 0.2511454, 1, 1, 1, 1, 1,
-0.4180102, 0.6209022, 0.1663199, 1, 1, 1, 1, 1,
-0.4162794, 1.176758, -1.182135, 1, 1, 1, 1, 1,
-0.4127798, 2.961404, 0.2122754, 1, 1, 1, 1, 1,
-0.4123482, -0.569329, -1.131451, 1, 1, 1, 1, 1,
-0.4099193, 0.3521695, 0.2876543, 1, 1, 1, 1, 1,
-0.4024957, -0.5799203, -1.580073, 1, 1, 1, 1, 1,
-0.4018998, -0.5246212, -3.215481, 1, 1, 1, 1, 1,
-0.4013404, -0.5261999, -2.473784, 1, 1, 1, 1, 1,
-0.4004942, -1.29558, -3.667386, 0, 0, 1, 1, 1,
-0.3992148, -0.1360316, -1.890435, 1, 0, 0, 1, 1,
-0.3982592, 1.299805, -0.4742621, 1, 0, 0, 1, 1,
-0.3933418, -0.385926, -2.970842, 1, 0, 0, 1, 1,
-0.3899909, 0.5022537, 0.09724255, 1, 0, 0, 1, 1,
-0.3890873, -0.4058526, -3.466335, 1, 0, 0, 1, 1,
-0.3870436, 0.4705726, -2.337829, 0, 0, 0, 1, 1,
-0.3867859, 0.1103224, -2.762931, 0, 0, 0, 1, 1,
-0.3829198, -0.4218269, -3.726697, 0, 0, 0, 1, 1,
-0.380057, -0.4556704, -3.561743, 0, 0, 0, 1, 1,
-0.3766026, -0.4947289, -2.425693, 0, 0, 0, 1, 1,
-0.3713665, 0.03141049, -0.767415, 0, 0, 0, 1, 1,
-0.3681486, -0.1047541, -1.574464, 0, 0, 0, 1, 1,
-0.364338, 0.5878314, -2.513484, 1, 1, 1, 1, 1,
-0.3635692, -1.259353, -1.442988, 1, 1, 1, 1, 1,
-0.362508, -0.5898967, -4.45088, 1, 1, 1, 1, 1,
-0.3596802, -0.02830096, -1.006405, 1, 1, 1, 1, 1,
-0.3590586, -0.1021248, -2.055169, 1, 1, 1, 1, 1,
-0.3555404, -0.3914101, -3.852985, 1, 1, 1, 1, 1,
-0.355534, 0.01326994, -2.533018, 1, 1, 1, 1, 1,
-0.3491728, 1.442364, 0.8851294, 1, 1, 1, 1, 1,
-0.3445264, 1.660648, -0.2386071, 1, 1, 1, 1, 1,
-0.3441534, -0.5265113, -4.918339, 1, 1, 1, 1, 1,
-0.3436619, -0.4104265, -3.407823, 1, 1, 1, 1, 1,
-0.336942, 0.01228837, -1.288724, 1, 1, 1, 1, 1,
-0.3356555, 0.391599, -0.6749251, 1, 1, 1, 1, 1,
-0.334458, 0.3018123, -2.310547, 1, 1, 1, 1, 1,
-0.3304657, -1.374219, -1.601017, 1, 1, 1, 1, 1,
-0.3287062, -0.2450911, -0.9892796, 0, 0, 1, 1, 1,
-0.3241455, -0.2201016, -2.210306, 1, 0, 0, 1, 1,
-0.3210687, -1.500603, -2.440754, 1, 0, 0, 1, 1,
-0.3180127, -1.155094, -2.643992, 1, 0, 0, 1, 1,
-0.3169722, 2.422586, -0.1860394, 1, 0, 0, 1, 1,
-0.3143537, -0.02045482, -2.432983, 1, 0, 0, 1, 1,
-0.3119745, -0.2823026, -1.254843, 0, 0, 0, 1, 1,
-0.3071615, 0.7424265, -0.04097915, 0, 0, 0, 1, 1,
-0.3065005, -1.245681, -2.964959, 0, 0, 0, 1, 1,
-0.3010881, 1.266117, -0.8991973, 0, 0, 0, 1, 1,
-0.2953476, 1.206348, -2.213814, 0, 0, 0, 1, 1,
-0.2918694, -0.5687592, -2.582621, 0, 0, 0, 1, 1,
-0.2912685, -0.2888217, -1.514687, 0, 0, 0, 1, 1,
-0.2908315, -1.287599, -2.957611, 1, 1, 1, 1, 1,
-0.290369, 0.2466451, -0.492243, 1, 1, 1, 1, 1,
-0.2898613, -1.628105, -2.721563, 1, 1, 1, 1, 1,
-0.2896747, -0.2682183, -2.650356, 1, 1, 1, 1, 1,
-0.2834854, 0.9738795, -2.000734, 1, 1, 1, 1, 1,
-0.2830371, 0.4773858, -0.7398976, 1, 1, 1, 1, 1,
-0.2811084, 1.467002, -1.408482, 1, 1, 1, 1, 1,
-0.280843, -2.07696, -3.700067, 1, 1, 1, 1, 1,
-0.2803224, 1.265346, -0.0204798, 1, 1, 1, 1, 1,
-0.2797838, -1.051761, -2.754077, 1, 1, 1, 1, 1,
-0.2765114, 1.128382, 0.8616537, 1, 1, 1, 1, 1,
-0.2760472, -1.058271, -2.691914, 1, 1, 1, 1, 1,
-0.2751286, 0.209847, -0.9026535, 1, 1, 1, 1, 1,
-0.2730446, -0.3015903, -2.955948, 1, 1, 1, 1, 1,
-0.272572, -2.11067, -3.628838, 1, 1, 1, 1, 1,
-0.2708277, 0.4832698, -1.601031, 0, 0, 1, 1, 1,
-0.2704324, 0.6618778, -0.7724777, 1, 0, 0, 1, 1,
-0.2697626, -0.09731414, -2.892348, 1, 0, 0, 1, 1,
-0.2614104, -1.169683, -3.99959, 1, 0, 0, 1, 1,
-0.2557968, -0.3134252, -2.869394, 1, 0, 0, 1, 1,
-0.2549907, -0.7780012, -2.608175, 1, 0, 0, 1, 1,
-0.2530533, 0.6673339, -1.517228, 0, 0, 0, 1, 1,
-0.2529915, -0.8985915, -3.093818, 0, 0, 0, 1, 1,
-0.2487359, -0.8353642, -3.582111, 0, 0, 0, 1, 1,
-0.2482581, 0.09938848, -0.6195599, 0, 0, 0, 1, 1,
-0.2471453, 0.470793, -0.5010383, 0, 0, 0, 1, 1,
-0.2385872, -1.049516, -2.739384, 0, 0, 0, 1, 1,
-0.2385764, 1.025022, -1.165507, 0, 0, 0, 1, 1,
-0.2349389, -1.028602, -1.719189, 1, 1, 1, 1, 1,
-0.2327672, 0.04531953, -3.419681, 1, 1, 1, 1, 1,
-0.2311736, 1.380383, 0.9623994, 1, 1, 1, 1, 1,
-0.229351, 0.1477113, -0.8096827, 1, 1, 1, 1, 1,
-0.2272896, 1.376738, -0.00646143, 1, 1, 1, 1, 1,
-0.2215507, -0.5384842, -3.703754, 1, 1, 1, 1, 1,
-0.2195117, -0.09839317, -3.293537, 1, 1, 1, 1, 1,
-0.2146449, -1.233302, -2.718909, 1, 1, 1, 1, 1,
-0.2143429, -2.004618, -1.847093, 1, 1, 1, 1, 1,
-0.2142316, -0.6797951, -2.066048, 1, 1, 1, 1, 1,
-0.2140741, 1.289499, -1.234025, 1, 1, 1, 1, 1,
-0.2139113, 0.4964134, -0.7083241, 1, 1, 1, 1, 1,
-0.213195, -1.052767, -1.527798, 1, 1, 1, 1, 1,
-0.2129031, 0.6682224, 1.073132, 1, 1, 1, 1, 1,
-0.2127102, 0.6805691, 0.4983386, 1, 1, 1, 1, 1,
-0.2106858, 0.6646858, 1.825119, 0, 0, 1, 1, 1,
-0.2085788, -0.4209166, -0.7389002, 1, 0, 0, 1, 1,
-0.2085773, 1.511534, -1.43475, 1, 0, 0, 1, 1,
-0.205828, -0.4023776, -2.079616, 1, 0, 0, 1, 1,
-0.2024155, 0.5808082, -0.4965951, 1, 0, 0, 1, 1,
-0.2015998, -0.1799952, -3.339031, 1, 0, 0, 1, 1,
-0.1983373, -0.7333183, -4.652722, 0, 0, 0, 1, 1,
-0.1971398, 0.4505843, -0.6963978, 0, 0, 0, 1, 1,
-0.1942814, -0.8504174, -2.393564, 0, 0, 0, 1, 1,
-0.1908544, 0.5305412, 1.756887, 0, 0, 0, 1, 1,
-0.1900422, -1.987221, -0.4008963, 0, 0, 0, 1, 1,
-0.1840027, -0.1382969, -3.470435, 0, 0, 0, 1, 1,
-0.1831616, -0.2027317, -2.087112, 0, 0, 0, 1, 1,
-0.1801769, 0.0901335, -1.520921, 1, 1, 1, 1, 1,
-0.1790158, 0.4719538, -1.348217, 1, 1, 1, 1, 1,
-0.1777002, 1.451184, 1.377914, 1, 1, 1, 1, 1,
-0.1751162, 1.30235, 0.1741722, 1, 1, 1, 1, 1,
-0.1748992, 0.3900089, -1.006515, 1, 1, 1, 1, 1,
-0.1696807, -1.813858, -1.661945, 1, 1, 1, 1, 1,
-0.1691194, 0.3006362, -0.3690431, 1, 1, 1, 1, 1,
-0.1620698, -1.015934, -2.16125, 1, 1, 1, 1, 1,
-0.1616576, -0.1888369, -4.943578, 1, 1, 1, 1, 1,
-0.1585299, -1.885363, -4.211948, 1, 1, 1, 1, 1,
-0.1583815, -1.250597, -1.503228, 1, 1, 1, 1, 1,
-0.1579435, 1.671398, 0.5537943, 1, 1, 1, 1, 1,
-0.1540052, 0.4291358, 0.5886842, 1, 1, 1, 1, 1,
-0.1538387, 1.871471, 0.2731752, 1, 1, 1, 1, 1,
-0.1504969, 2.525959, -0.9708001, 1, 1, 1, 1, 1,
-0.1496585, -1.409603, -2.222708, 0, 0, 1, 1, 1,
-0.1466323, -0.102709, -1.57956, 1, 0, 0, 1, 1,
-0.1463468, 0.2784538, -2.65029, 1, 0, 0, 1, 1,
-0.1441201, -0.480251, -4.508471, 1, 0, 0, 1, 1,
-0.1397327, 0.5700705, 0.5232933, 1, 0, 0, 1, 1,
-0.1388732, -0.02842627, -2.348493, 1, 0, 0, 1, 1,
-0.1372614, 0.5267274, -0.2648316, 0, 0, 0, 1, 1,
-0.1364099, 2.352107, -0.4799499, 0, 0, 0, 1, 1,
-0.1360458, 1.113695, -1.254252, 0, 0, 0, 1, 1,
-0.1335106, -0.1339694, -0.5818717, 0, 0, 0, 1, 1,
-0.1333066, -0.3012039, -3.792277, 0, 0, 0, 1, 1,
-0.1312864, 1.36757, -2.221929, 0, 0, 0, 1, 1,
-0.1304286, 0.2827278, -0.2443151, 0, 0, 0, 1, 1,
-0.1208279, 0.07008096, -1.994289, 1, 1, 1, 1, 1,
-0.1165659, -0.03558958, -0.3420189, 1, 1, 1, 1, 1,
-0.1154756, -0.5493502, -0.03914318, 1, 1, 1, 1, 1,
-0.1135071, -1.360236, -2.828954, 1, 1, 1, 1, 1,
-0.1129144, 0.01201096, -1.834042, 1, 1, 1, 1, 1,
-0.1077168, -0.5456972, -3.600322, 1, 1, 1, 1, 1,
-0.1024407, 1.65659, 0.1672117, 1, 1, 1, 1, 1,
-0.1024176, 1.244872, 0.8758867, 1, 1, 1, 1, 1,
-0.1006292, 2.075439, 1.889028, 1, 1, 1, 1, 1,
-0.09897334, -1.125581, -3.405601, 1, 1, 1, 1, 1,
-0.09838338, 3.026422, -3.550685, 1, 1, 1, 1, 1,
-0.09771959, -0.6316491, -1.986476, 1, 1, 1, 1, 1,
-0.0940881, -0.2111471, -3.402866, 1, 1, 1, 1, 1,
-0.09188884, 1.02897, 1.135889, 1, 1, 1, 1, 1,
-0.08949798, 0.8834835, -0.1182323, 1, 1, 1, 1, 1,
-0.08628734, -0.9633555, -3.806442, 0, 0, 1, 1, 1,
-0.08470342, 0.2042513, -0.6163201, 1, 0, 0, 1, 1,
-0.08321865, 0.3547428, 0.09191159, 1, 0, 0, 1, 1,
-0.07206568, 1.874916, 1.065603, 1, 0, 0, 1, 1,
-0.06539033, 1.019008, 0.7280798, 1, 0, 0, 1, 1,
-0.06105625, 0.2445636, -0.464774, 1, 0, 0, 1, 1,
-0.05883113, -0.565425, -3.345096, 0, 0, 0, 1, 1,
-0.05472305, -0.3028992, -2.505377, 0, 0, 0, 1, 1,
-0.05325501, -0.9966916, -4.289721, 0, 0, 0, 1, 1,
-0.05282518, 0.6079419, 2.007371, 0, 0, 0, 1, 1,
-0.05050182, -0.9195597, -1.363847, 0, 0, 0, 1, 1,
-0.04957357, 0.9466792, 0.3537888, 0, 0, 0, 1, 1,
-0.04273346, -2.423385, -3.851203, 0, 0, 0, 1, 1,
-0.04154066, -0.2808214, -2.904776, 1, 1, 1, 1, 1,
-0.04141043, 0.8033602, 0.7409148, 1, 1, 1, 1, 1,
-0.03980901, 0.6631924, -0.363773, 1, 1, 1, 1, 1,
-0.03902318, -0.7664875, -2.717835, 1, 1, 1, 1, 1,
-0.03834008, 0.5161569, -0.07714322, 1, 1, 1, 1, 1,
-0.03581987, 1.731558, 1.936495, 1, 1, 1, 1, 1,
-0.03450866, 1.316952, 0.6037287, 1, 1, 1, 1, 1,
-0.03333376, -0.4792957, -1.185499, 1, 1, 1, 1, 1,
-0.03191398, -0.6122046, -1.610469, 1, 1, 1, 1, 1,
-0.03165023, 0.5276762, 1.678411, 1, 1, 1, 1, 1,
-0.03077927, -0.06291024, -3.264686, 1, 1, 1, 1, 1,
-0.02993281, 0.1750539, -0.9679523, 1, 1, 1, 1, 1,
-0.0228123, -0.1691347, -2.480673, 1, 1, 1, 1, 1,
-0.01750154, -0.08566672, -3.79215, 1, 1, 1, 1, 1,
-0.0173416, -0.1803382, -3.752635, 1, 1, 1, 1, 1,
-0.01541143, 0.1284869, -1.220182, 0, 0, 1, 1, 1,
-0.01313954, -1.231159, -2.09952, 1, 0, 0, 1, 1,
-0.01309101, -0.5291511, -3.753332, 1, 0, 0, 1, 1,
-0.00938829, -0.5758279, -4.020087, 1, 0, 0, 1, 1,
-0.008879473, -0.9788473, -2.562559, 1, 0, 0, 1, 1,
-0.008494649, -0.2380883, -3.297899, 1, 0, 0, 1, 1,
-0.004328907, -0.2342202, -1.500237, 0, 0, 0, 1, 1,
-0.002295684, -1.980854, -2.54172, 0, 0, 0, 1, 1,
0.0002164022, 0.7054734, -1.115867, 0, 0, 0, 1, 1,
0.003049248, 0.9189397, -0.002904447, 0, 0, 0, 1, 1,
0.004165689, -0.02591008, 1.991998, 0, 0, 0, 1, 1,
0.00438257, -1.018523, 3.295071, 0, 0, 0, 1, 1,
0.01049175, 1.075907, 0.2311175, 0, 0, 0, 1, 1,
0.01182762, -1.966962, 1.981004, 1, 1, 1, 1, 1,
0.01574507, -1.692847, 2.386596, 1, 1, 1, 1, 1,
0.02170989, 1.164929, 0.9663619, 1, 1, 1, 1, 1,
0.02240958, -0.7428805, 4.044086, 1, 1, 1, 1, 1,
0.02269882, 0.8235443, -1.529262, 1, 1, 1, 1, 1,
0.02597259, 0.3273922, -0.2556076, 1, 1, 1, 1, 1,
0.02600834, 0.5858527, 0.8114039, 1, 1, 1, 1, 1,
0.02755851, -0.05045324, 3.475805, 1, 1, 1, 1, 1,
0.03036349, -1.17066, 3.560535, 1, 1, 1, 1, 1,
0.03483469, -0.4165649, 2.561391, 1, 1, 1, 1, 1,
0.03504424, -1.268592, 3.91334, 1, 1, 1, 1, 1,
0.03810776, 0.346977, 0.4308748, 1, 1, 1, 1, 1,
0.04024614, -0.9113582, 2.790719, 1, 1, 1, 1, 1,
0.04276227, 0.6996112, -1.582398, 1, 1, 1, 1, 1,
0.04520764, 0.7451001, -0.06128028, 1, 1, 1, 1, 1,
0.04558728, -0.5626415, 3.492682, 0, 0, 1, 1, 1,
0.04696865, 0.6144114, -0.4420727, 1, 0, 0, 1, 1,
0.04769921, -0.2729173, 3.255919, 1, 0, 0, 1, 1,
0.04965471, -1.604965, 4.087427, 1, 0, 0, 1, 1,
0.05094337, 0.5002768, -0.80489, 1, 0, 0, 1, 1,
0.05555582, 0.4178785, -0.3646226, 1, 0, 0, 1, 1,
0.05751064, 0.86247, 0.5318586, 0, 0, 0, 1, 1,
0.05796752, 0.2079783, 0.7819797, 0, 0, 0, 1, 1,
0.06011508, 0.05119671, 1.612854, 0, 0, 0, 1, 1,
0.06120627, -1.769587, 1.87791, 0, 0, 0, 1, 1,
0.06340471, 1.371578, -0.007735933, 0, 0, 0, 1, 1,
0.06522183, -0.6393692, 2.007287, 0, 0, 0, 1, 1,
0.06618459, -0.5245738, 0.7481133, 0, 0, 0, 1, 1,
0.06978884, -1.177874, 4.332809, 1, 1, 1, 1, 1,
0.07147144, 0.9905769, -0.04739385, 1, 1, 1, 1, 1,
0.07263348, -0.08126984, 4.2659, 1, 1, 1, 1, 1,
0.0753187, 0.7825319, 1.54601, 1, 1, 1, 1, 1,
0.07967387, -0.01424116, 2.368558, 1, 1, 1, 1, 1,
0.08301039, 1.803591, -0.4063827, 1, 1, 1, 1, 1,
0.08302245, 1.253085, 0.5414857, 1, 1, 1, 1, 1,
0.08604582, 1.302879, 1.598869, 1, 1, 1, 1, 1,
0.08824392, 1.636484, -0.4219121, 1, 1, 1, 1, 1,
0.08897474, 1.342831, 0.2576551, 1, 1, 1, 1, 1,
0.09108585, -1.420174, 3.430154, 1, 1, 1, 1, 1,
0.09118897, -0.1780289, 2.346071, 1, 1, 1, 1, 1,
0.09297486, 0.3338389, 2.085288, 1, 1, 1, 1, 1,
0.1004252, 0.3401517, -0.1554356, 1, 1, 1, 1, 1,
0.1106798, 2.694931, 1.269252, 1, 1, 1, 1, 1,
0.1107819, 0.5463418, -0.2353309, 0, 0, 1, 1, 1,
0.1109229, -1.191651, 2.0486, 1, 0, 0, 1, 1,
0.1121978, 0.2908767, -0.2217391, 1, 0, 0, 1, 1,
0.118349, 0.2413422, 0.9493461, 1, 0, 0, 1, 1,
0.1204633, 0.4066243, 1.199868, 1, 0, 0, 1, 1,
0.1265844, 0.5526093, -0.8945573, 1, 0, 0, 1, 1,
0.1291225, 1.31917, 0.2650479, 0, 0, 0, 1, 1,
0.1301404, 0.671379, -1.233509, 0, 0, 0, 1, 1,
0.1317032, -1.711194, 1.801781, 0, 0, 0, 1, 1,
0.1363369, -0.24698, 2.537149, 0, 0, 0, 1, 1,
0.1390257, -1.303501, 2.262502, 0, 0, 0, 1, 1,
0.1430403, -0.2541471, 0.9849867, 0, 0, 0, 1, 1,
0.1452576, -0.9647029, 1.160976, 0, 0, 0, 1, 1,
0.1498871, 2.045335, -0.3119783, 1, 1, 1, 1, 1,
0.1501669, 0.05835617, -0.4903402, 1, 1, 1, 1, 1,
0.1505868, 0.6614176, 0.2433115, 1, 1, 1, 1, 1,
0.1547653, 1.165705, 0.6380365, 1, 1, 1, 1, 1,
0.15512, -0.4333363, 3.121538, 1, 1, 1, 1, 1,
0.1555587, 0.3982421, 0.5075502, 1, 1, 1, 1, 1,
0.1588694, 0.7291737, 1.423668, 1, 1, 1, 1, 1,
0.1621058, 0.1945151, 0.9358255, 1, 1, 1, 1, 1,
0.1632333, 0.9392915, -0.7492716, 1, 1, 1, 1, 1,
0.1666737, 0.2430061, 1.298513, 1, 1, 1, 1, 1,
0.1672619, 0.3179727, 0.4234688, 1, 1, 1, 1, 1,
0.1681681, 0.8477477, -0.1882497, 1, 1, 1, 1, 1,
0.1727777, -1.181378, 3.240183, 1, 1, 1, 1, 1,
0.1765709, -2.559163, 2.796173, 1, 1, 1, 1, 1,
0.1776323, -1.281959, 2.485347, 1, 1, 1, 1, 1,
0.1777792, -1.605557, 4.209855, 0, 0, 1, 1, 1,
0.1802497, -3.143483, 3.308117, 1, 0, 0, 1, 1,
0.1860201, -1.36078, 1.024527, 1, 0, 0, 1, 1,
0.1868912, 0.08959027, -0.3820324, 1, 0, 0, 1, 1,
0.1882937, 2.128734, -2.076826, 1, 0, 0, 1, 1,
0.1905465, 0.3028391, 2.467564, 1, 0, 0, 1, 1,
0.1922031, -0.01616167, 2.130654, 0, 0, 0, 1, 1,
0.1969435, 0.5054098, -0.05421027, 0, 0, 0, 1, 1,
0.1975283, -1.888981, 4.481744, 0, 0, 0, 1, 1,
0.1978675, 0.2058734, 1.413166, 0, 0, 0, 1, 1,
0.1983732, 0.1250876, 0.1567304, 0, 0, 0, 1, 1,
0.202874, -2.039558, 4.513706, 0, 0, 0, 1, 1,
0.2033908, -0.6716855, 3.778346, 0, 0, 0, 1, 1,
0.2063607, -1.706848, 3.033196, 1, 1, 1, 1, 1,
0.209984, 0.7014433, 2.287737, 1, 1, 1, 1, 1,
0.2107389, -0.5029109, 3.318917, 1, 1, 1, 1, 1,
0.2143288, -0.1934587, 1.752524, 1, 1, 1, 1, 1,
0.2149309, 0.3927938, -0.01798638, 1, 1, 1, 1, 1,
0.215742, -0.8852604, 1.892805, 1, 1, 1, 1, 1,
0.2177016, -0.392006, 2.406123, 1, 1, 1, 1, 1,
0.218092, -0.8493269, 2.593953, 1, 1, 1, 1, 1,
0.2240319, 0.7778747, 0.3099507, 1, 1, 1, 1, 1,
0.2240727, 0.2491393, 0.294308, 1, 1, 1, 1, 1,
0.2383404, 0.3261917, -1.125908, 1, 1, 1, 1, 1,
0.2384079, -0.3580984, 2.658609, 1, 1, 1, 1, 1,
0.2387982, 0.776042, 2.448896, 1, 1, 1, 1, 1,
0.2415931, -0.7689731, 2.086746, 1, 1, 1, 1, 1,
0.242446, -0.887438, 3.371984, 1, 1, 1, 1, 1,
0.2439822, -1.718834, 4.097267, 0, 0, 1, 1, 1,
0.2444052, -0.2533647, 3.371289, 1, 0, 0, 1, 1,
0.2466995, -1.306327, 1.699694, 1, 0, 0, 1, 1,
0.250351, 0.3539001, 1.258882, 1, 0, 0, 1, 1,
0.2516863, -0.4113065, 1.209189, 1, 0, 0, 1, 1,
0.2533255, -1.590967, 3.993454, 1, 0, 0, 1, 1,
0.2566351, 0.5011759, 0.3294568, 0, 0, 0, 1, 1,
0.258164, 0.03132782, 1.216856, 0, 0, 0, 1, 1,
0.2609885, -1.928293, 3.205138, 0, 0, 0, 1, 1,
0.2610528, 0.3611567, 0.6855909, 0, 0, 0, 1, 1,
0.2675443, 1.783199, 0.4449975, 0, 0, 0, 1, 1,
0.2698931, 0.9546959, 0.2425223, 0, 0, 0, 1, 1,
0.2699062, -0.6973823, 2.46362, 0, 0, 0, 1, 1,
0.2702182, 0.9932985, -1.291878, 1, 1, 1, 1, 1,
0.2707126, -1.069335, 2.887045, 1, 1, 1, 1, 1,
0.2710606, -0.9658756, 3.148375, 1, 1, 1, 1, 1,
0.2718822, 0.1887537, 0.04646067, 1, 1, 1, 1, 1,
0.2730549, 0.3705899, 2.958686, 1, 1, 1, 1, 1,
0.2752125, 2.748641, -0.6502095, 1, 1, 1, 1, 1,
0.2769583, 0.7862561, -1.387729, 1, 1, 1, 1, 1,
0.2855575, 0.6331006, -0.00612314, 1, 1, 1, 1, 1,
0.2859146, -0.6421924, 1.546271, 1, 1, 1, 1, 1,
0.2938258, -0.7318727, 3.955894, 1, 1, 1, 1, 1,
0.2940303, -0.04174716, 1.747744, 1, 1, 1, 1, 1,
0.297017, 0.4377342, 0.1238745, 1, 1, 1, 1, 1,
0.3014963, 0.9349979, 0.8624738, 1, 1, 1, 1, 1,
0.3025184, -0.2354779, 3.130271, 1, 1, 1, 1, 1,
0.3044701, -1.067524, 3.235303, 1, 1, 1, 1, 1,
0.308915, 1.70086, 1.232533, 0, 0, 1, 1, 1,
0.3132358, 1.233451, -0.7125791, 1, 0, 0, 1, 1,
0.3186573, 0.0548856, 0.3821374, 1, 0, 0, 1, 1,
0.3195734, -0.4915021, 4.126936, 1, 0, 0, 1, 1,
0.3196873, -1.420562, 3.207902, 1, 0, 0, 1, 1,
0.3206092, -0.4681934, 4.675918, 1, 0, 0, 1, 1,
0.3245326, -0.9642827, 1.493498, 0, 0, 0, 1, 1,
0.3270322, 0.5809547, 1.471919, 0, 0, 0, 1, 1,
0.333005, -0.6395862, 3.432578, 0, 0, 0, 1, 1,
0.3365405, -0.2143709, 4.480097, 0, 0, 0, 1, 1,
0.3395929, -0.6247636, 3.063739, 0, 0, 0, 1, 1,
0.3397841, -1.577356, 3.758442, 0, 0, 0, 1, 1,
0.3404121, -0.4653821, 2.912023, 0, 0, 0, 1, 1,
0.344837, 1.313457, -0.6220152, 1, 1, 1, 1, 1,
0.3455127, 1.183536, 0.2953473, 1, 1, 1, 1, 1,
0.3457747, -0.1405033, 1.66885, 1, 1, 1, 1, 1,
0.3487353, 1.749836, 0.1024339, 1, 1, 1, 1, 1,
0.3510381, 1.718714, 2.315903, 1, 1, 1, 1, 1,
0.3532943, -0.8348072, 3.457848, 1, 1, 1, 1, 1,
0.3544542, -0.7522742, 2.350891, 1, 1, 1, 1, 1,
0.3585224, 1.428741, 2.829831, 1, 1, 1, 1, 1,
0.3609712, -0.9126772, 2.604255, 1, 1, 1, 1, 1,
0.361726, -0.4576999, 3.555707, 1, 1, 1, 1, 1,
0.362686, 2.30281, -0.4630271, 1, 1, 1, 1, 1,
0.3636381, -0.3904267, 4.056216, 1, 1, 1, 1, 1,
0.3670374, -0.8607664, 2.69703, 1, 1, 1, 1, 1,
0.3684961, 1.042357, 0.9366856, 1, 1, 1, 1, 1,
0.3831653, 0.4254056, 0.3386744, 1, 1, 1, 1, 1,
0.383615, 0.3076295, -1.121329, 0, 0, 1, 1, 1,
0.3838667, -2.066028, 3.785464, 1, 0, 0, 1, 1,
0.3879576, 0.114029, 0.8218697, 1, 0, 0, 1, 1,
0.3884114, 0.2861543, 1.877389, 1, 0, 0, 1, 1,
0.3906393, 0.3419189, -0.6299762, 1, 0, 0, 1, 1,
0.3907081, 0.4697849, 1.092586, 1, 0, 0, 1, 1,
0.3907366, -0.005727734, 2.097733, 0, 0, 0, 1, 1,
0.3947116, -1.074782, 4.143831, 0, 0, 0, 1, 1,
0.3966289, -0.4548066, 1.838196, 0, 0, 0, 1, 1,
0.396851, 0.6354305, 0.5123028, 0, 0, 0, 1, 1,
0.3984725, 0.4004834, 1.608526, 0, 0, 0, 1, 1,
0.399832, -0.2884101, 0.2118618, 0, 0, 0, 1, 1,
0.4073044, 0.6885576, 0.4283995, 0, 0, 0, 1, 1,
0.4101533, -2.189024, 1.156913, 1, 1, 1, 1, 1,
0.4118683, -1.499833, 1.999602, 1, 1, 1, 1, 1,
0.4162783, 0.7831293, 1.052002, 1, 1, 1, 1, 1,
0.4232187, -1.154782, 2.853744, 1, 1, 1, 1, 1,
0.4256921, -0.2214619, 2.294705, 1, 1, 1, 1, 1,
0.4272736, 1.472647, 0.8259234, 1, 1, 1, 1, 1,
0.4287298, -0.2169105, 0.4003352, 1, 1, 1, 1, 1,
0.429425, -0.6346357, 1.755504, 1, 1, 1, 1, 1,
0.4315486, -0.1589099, 0.9361571, 1, 1, 1, 1, 1,
0.4360358, -0.2982845, 3.533243, 1, 1, 1, 1, 1,
0.4370344, 0.4168787, 1.933557, 1, 1, 1, 1, 1,
0.4373484, -1.901412, 4.781565, 1, 1, 1, 1, 1,
0.4425405, -0.4885925, 0.1669442, 1, 1, 1, 1, 1,
0.4433627, -0.399051, 2.529277, 1, 1, 1, 1, 1,
0.4459743, 1.862055, -0.06051014, 1, 1, 1, 1, 1,
0.4481307, -0.8098003, 3.303069, 0, 0, 1, 1, 1,
0.4523305, -0.9021587, 1.997918, 1, 0, 0, 1, 1,
0.4530664, 0.5488205, -0.3439046, 1, 0, 0, 1, 1,
0.4538618, 0.6606184, 3.398904, 1, 0, 0, 1, 1,
0.4603026, -0.5756836, 4.604994, 1, 0, 0, 1, 1,
0.4632908, 0.5100716, 0.3910928, 1, 0, 0, 1, 1,
0.4693044, -0.2237478, 1.79395, 0, 0, 0, 1, 1,
0.4708989, -1.49899, 3.379737, 0, 0, 0, 1, 1,
0.4709629, -1.56116, 3.422563, 0, 0, 0, 1, 1,
0.4718658, -0.2191027, 3.06287, 0, 0, 0, 1, 1,
0.4778243, 1.063626, -1.117835, 0, 0, 0, 1, 1,
0.4778277, 0.1776636, 0.4447044, 0, 0, 0, 1, 1,
0.4805401, 1.449959, 1.555206, 0, 0, 0, 1, 1,
0.4817903, 0.3123301, 0.162267, 1, 1, 1, 1, 1,
0.4903252, -1.000913, 3.138795, 1, 1, 1, 1, 1,
0.4905496, -1.58572, 0.1695013, 1, 1, 1, 1, 1,
0.4912022, 3.464487, 0.7888634, 1, 1, 1, 1, 1,
0.4912702, 0.342822, 1.164465, 1, 1, 1, 1, 1,
0.4923644, -0.4594877, 3.377232, 1, 1, 1, 1, 1,
0.4972617, -0.3295111, 2.039221, 1, 1, 1, 1, 1,
0.4987003, -0.07756387, -0.4199583, 1, 1, 1, 1, 1,
0.5004972, -0.80715, 1.415653, 1, 1, 1, 1, 1,
0.5043258, 0.8744934, 0.9870545, 1, 1, 1, 1, 1,
0.504346, 0.9422489, -0.5914023, 1, 1, 1, 1, 1,
0.513765, -1.155069, 1.738739, 1, 1, 1, 1, 1,
0.5147168, -1.297783, 2.327938, 1, 1, 1, 1, 1,
0.5154917, -0.4316164, 1.750686, 1, 1, 1, 1, 1,
0.5215105, 0.6539932, 0.5884386, 1, 1, 1, 1, 1,
0.5215868, -0.2776838, 1.288161, 0, 0, 1, 1, 1,
0.5219674, -0.6141635, 1.257724, 1, 0, 0, 1, 1,
0.5231573, 0.7142042, -0.3378966, 1, 0, 0, 1, 1,
0.5241246, 0.0777411, 0.7742618, 1, 0, 0, 1, 1,
0.5302179, -0.1783128, 2.156755, 1, 0, 0, 1, 1,
0.5354972, -1.339827, 1.283341, 1, 0, 0, 1, 1,
0.5401472, -1.12577, 3.248401, 0, 0, 0, 1, 1,
0.5427536, -1.451498, 2.543124, 0, 0, 0, 1, 1,
0.5438401, 2.796669, 2.588414, 0, 0, 0, 1, 1,
0.5480031, 0.6139249, -0.6043281, 0, 0, 0, 1, 1,
0.5497118, -0.2665206, 4.906096, 0, 0, 0, 1, 1,
0.550519, 0.6002102, 0.8669968, 0, 0, 0, 1, 1,
0.5548147, 1.242038, 0.7005137, 0, 0, 0, 1, 1,
0.5564935, -0.26386, 2.184233, 1, 1, 1, 1, 1,
0.5601529, -0.02860452, 0.4136436, 1, 1, 1, 1, 1,
0.5671715, -0.08633926, 2.562319, 1, 1, 1, 1, 1,
0.5679315, 1.218622, 1.24852, 1, 1, 1, 1, 1,
0.5682751, -1.855392, 0.2820978, 1, 1, 1, 1, 1,
0.5690485, -0.2821515, 3.067568, 1, 1, 1, 1, 1,
0.5694493, 0.185296, 1.403201, 1, 1, 1, 1, 1,
0.5781374, -0.8913586, 1.835968, 1, 1, 1, 1, 1,
0.5867308, -0.8865163, 3.002393, 1, 1, 1, 1, 1,
0.5885074, 0.1824722, 2.400118, 1, 1, 1, 1, 1,
0.5900047, -2.354275, 3.109564, 1, 1, 1, 1, 1,
0.5954654, -1.326416, 3.35397, 1, 1, 1, 1, 1,
0.5972742, 0.8158453, 0.4383845, 1, 1, 1, 1, 1,
0.5974446, -0.1476506, 2.68826, 1, 1, 1, 1, 1,
0.5981032, 1.672093, 1.050048, 1, 1, 1, 1, 1,
0.6114129, -1.269904, 1.748116, 0, 0, 1, 1, 1,
0.6131818, 0.1781873, 1.761457, 1, 0, 0, 1, 1,
0.613732, 0.4219583, 2.155612, 1, 0, 0, 1, 1,
0.6166155, 1.088343, 0.08097278, 1, 0, 0, 1, 1,
0.6182157, 1.704439, 0.8949551, 1, 0, 0, 1, 1,
0.618646, 0.5162675, -1.467424, 1, 0, 0, 1, 1,
0.622672, -1.981671, 3.81948, 0, 0, 0, 1, 1,
0.6247104, 0.1608989, 1.190936, 0, 0, 0, 1, 1,
0.6269817, -0.1538909, 1.633402, 0, 0, 0, 1, 1,
0.6305602, -2.686026, 2.421347, 0, 0, 0, 1, 1,
0.6400162, 0.7186683, 1.465868, 0, 0, 0, 1, 1,
0.6445799, 0.8050573, 2.226842, 0, 0, 0, 1, 1,
0.646641, -0.5155308, 0.8228896, 0, 0, 0, 1, 1,
0.6521751, -3.536457, 2.670286, 1, 1, 1, 1, 1,
0.6534572, 0.5539305, 0.6383501, 1, 1, 1, 1, 1,
0.6541663, 0.6492481, -1.53644, 1, 1, 1, 1, 1,
0.6629155, 0.1680963, 2.943433, 1, 1, 1, 1, 1,
0.6637195, -0.7387378, 2.096207, 1, 1, 1, 1, 1,
0.6722384, 0.7467183, 0.17554, 1, 1, 1, 1, 1,
0.6751282, -1.114642, 3.127151, 1, 1, 1, 1, 1,
0.6761476, 0.1817744, 1.187054, 1, 1, 1, 1, 1,
0.6786371, -0.3167205, 2.710808, 1, 1, 1, 1, 1,
0.6891218, 0.6758361, -0.01945233, 1, 1, 1, 1, 1,
0.6934017, -0.6124325, 2.69921, 1, 1, 1, 1, 1,
0.6942303, -0.3632638, 2.851994, 1, 1, 1, 1, 1,
0.6949021, 0.1938009, 1.443317, 1, 1, 1, 1, 1,
0.7073871, 0.02789555, 1.260474, 1, 1, 1, 1, 1,
0.7192313, -0.1536724, 1.266196, 1, 1, 1, 1, 1,
0.7220354, -0.4816483, 1.424759, 0, 0, 1, 1, 1,
0.7321258, 1.46842, -1.273595, 1, 0, 0, 1, 1,
0.7346427, 0.145873, 2.353903, 1, 0, 0, 1, 1,
0.7365265, 0.7785133, 1.827159, 1, 0, 0, 1, 1,
0.7573383, 0.1176464, 1.875019, 1, 0, 0, 1, 1,
0.7574201, -0.8018425, 2.529997, 1, 0, 0, 1, 1,
0.759152, -0.6050686, 2.626464, 0, 0, 0, 1, 1,
0.7598465, 1.751362, -0.6722959, 0, 0, 0, 1, 1,
0.7600003, -1.669469, 3.557934, 0, 0, 0, 1, 1,
0.7602919, -0.9156715, 3.357534, 0, 0, 0, 1, 1,
0.7617097, -1.310361, 4.573933, 0, 0, 0, 1, 1,
0.7625563, -0.3246483, 3.150015, 0, 0, 0, 1, 1,
0.76349, 1.830871, -0.2044075, 0, 0, 0, 1, 1,
0.7647735, 0.9488148, 0.9925509, 1, 1, 1, 1, 1,
0.7670315, -0.331992, 0.6683505, 1, 1, 1, 1, 1,
0.7708876, -0.1198765, 1.058702, 1, 1, 1, 1, 1,
0.7739239, 0.6122482, 1.965883, 1, 1, 1, 1, 1,
0.7742921, 0.3484104, 1.083752, 1, 1, 1, 1, 1,
0.7753336, 0.8366261, -0.04734118, 1, 1, 1, 1, 1,
0.7756605, -0.6923708, 1.238848, 1, 1, 1, 1, 1,
0.7820044, 1.069305, -0.9925163, 1, 1, 1, 1, 1,
0.7827754, -0.199421, 1.909037, 1, 1, 1, 1, 1,
0.7885957, 1.525156, 2.285498, 1, 1, 1, 1, 1,
0.7921914, -0.84678, 2.024522, 1, 1, 1, 1, 1,
0.7929711, 1.842496, -1.929495, 1, 1, 1, 1, 1,
0.7978361, 2.237937, 0.2252492, 1, 1, 1, 1, 1,
0.8062617, -0.1358486, -0.7053615, 1, 1, 1, 1, 1,
0.8068334, 1.278349, 1.647465, 1, 1, 1, 1, 1,
0.809721, -0.5932256, 1.618823, 0, 0, 1, 1, 1,
0.8156219, 0.7925435, 0.634876, 1, 0, 0, 1, 1,
0.8279998, -1.158481, 1.630014, 1, 0, 0, 1, 1,
0.8310428, -0.1033634, 0.8037289, 1, 0, 0, 1, 1,
0.8384676, -0.3575906, 1.442432, 1, 0, 0, 1, 1,
0.8399993, 0.6394829, 1.559165, 1, 0, 0, 1, 1,
0.8419744, 0.02230349, 0.5143352, 0, 0, 0, 1, 1,
0.8426561, 0.2108862, 0.1966742, 0, 0, 0, 1, 1,
0.8513674, -1.182639, 1.924083, 0, 0, 0, 1, 1,
0.8549234, 1.04661, 2.030928, 0, 0, 0, 1, 1,
0.855651, -2.493775, 2.709742, 0, 0, 0, 1, 1,
0.8565685, -0.7586461, 3.029188, 0, 0, 0, 1, 1,
0.8642336, -0.2785076, 1.462189, 0, 0, 0, 1, 1,
0.8676621, -0.1148366, -0.3551187, 1, 1, 1, 1, 1,
0.8677297, 0.9455824, 0.1996491, 1, 1, 1, 1, 1,
0.868053, -0.2988736, 0.5696564, 1, 1, 1, 1, 1,
0.8688877, 0.558825, 1.681559, 1, 1, 1, 1, 1,
0.8714164, -0.2572153, 1.496623, 1, 1, 1, 1, 1,
0.8715394, -0.8009475, 1.509646, 1, 1, 1, 1, 1,
0.8729021, -0.6261335, 1.267321, 1, 1, 1, 1, 1,
0.8733486, 0.09302187, 1.409426, 1, 1, 1, 1, 1,
0.8892215, 0.7273706, -0.9852049, 1, 1, 1, 1, 1,
0.8986836, -1.518696, 2.4463, 1, 1, 1, 1, 1,
0.9068947, 1.105008, 0.3065455, 1, 1, 1, 1, 1,
0.9070623, 0.7411035, 1.605959, 1, 1, 1, 1, 1,
0.9156609, -0.4622714, 1.196032, 1, 1, 1, 1, 1,
0.9210501, -0.1935873, 1.7137, 1, 1, 1, 1, 1,
0.9259751, 1.65426, 0.22602, 1, 1, 1, 1, 1,
0.9310948, 2.363645, 0.1440042, 0, 0, 1, 1, 1,
0.93978, -0.9526721, 2.421804, 1, 0, 0, 1, 1,
0.9436318, -0.2029994, 1.381964, 1, 0, 0, 1, 1,
0.9465564, -0.1317108, 2.78972, 1, 0, 0, 1, 1,
0.9508386, -0.38671, 0.05421469, 1, 0, 0, 1, 1,
0.9654867, -0.5788531, 2.626421, 1, 0, 0, 1, 1,
0.9665318, 1.819646, 1.819941, 0, 0, 0, 1, 1,
0.9675437, -0.02421428, -0.621582, 0, 0, 0, 1, 1,
0.9712779, -0.90914, 2.315819, 0, 0, 0, 1, 1,
0.9728084, -0.5820072, 2.346933, 0, 0, 0, 1, 1,
0.9745018, 0.5280883, 0.4725591, 0, 0, 0, 1, 1,
0.9753351, 0.1545736, 2.036055, 0, 0, 0, 1, 1,
0.9765199, 0.8797178, 1.303506, 0, 0, 0, 1, 1,
0.9801096, -0.06313675, 1.319608, 1, 1, 1, 1, 1,
0.9921538, -0.623504, 1.177136, 1, 1, 1, 1, 1,
0.9924949, -0.55, 1.647053, 1, 1, 1, 1, 1,
1.006678, 0.6015884, 0.3167277, 1, 1, 1, 1, 1,
1.010404, 2.051211, 0.09155255, 1, 1, 1, 1, 1,
1.015798, -0.1069439, 0.6713969, 1, 1, 1, 1, 1,
1.021121, -1.162036, 1.674505, 1, 1, 1, 1, 1,
1.02669, -0.6192886, 2.757647, 1, 1, 1, 1, 1,
1.031917, -0.5658948, 2.606559, 1, 1, 1, 1, 1,
1.033398, 0.5383258, -0.01327561, 1, 1, 1, 1, 1,
1.037516, -0.8195776, 0.8350595, 1, 1, 1, 1, 1,
1.039214, -0.5873136, 1.193987, 1, 1, 1, 1, 1,
1.041266, -1.261505, 3.573684, 1, 1, 1, 1, 1,
1.041381, -0.4458, 1.987231, 1, 1, 1, 1, 1,
1.041502, -1.232743, 2.062672, 1, 1, 1, 1, 1,
1.044855, -0.6220334, 1.16564, 0, 0, 1, 1, 1,
1.045352, -1.036744, 2.036747, 1, 0, 0, 1, 1,
1.047556, -1.23355, 2.171116, 1, 0, 0, 1, 1,
1.050429, 2.783088, -0.7018337, 1, 0, 0, 1, 1,
1.055319, -0.4508165, 2.026347, 1, 0, 0, 1, 1,
1.060186, -0.354946, 1.080881, 1, 0, 0, 1, 1,
1.061232, -0.2772182, 3.695215, 0, 0, 0, 1, 1,
1.062208, 0.6120238, 0.2853288, 0, 0, 0, 1, 1,
1.064052, 1.481416, -0.6556794, 0, 0, 0, 1, 1,
1.06493, 0.7964898, -0.02060363, 0, 0, 0, 1, 1,
1.073685, -0.5504897, 1.324805, 0, 0, 0, 1, 1,
1.079562, 0.09867032, 3.792355, 0, 0, 0, 1, 1,
1.085237, -1.575494, 3.389018, 0, 0, 0, 1, 1,
1.089711, 1.952185, -0.9160607, 1, 1, 1, 1, 1,
1.096913, -0.4297691, 1.014546, 1, 1, 1, 1, 1,
1.100103, -0.169629, 1.910676, 1, 1, 1, 1, 1,
1.101624, 0.521599, 0.1407415, 1, 1, 1, 1, 1,
1.106664, 2.681753, 0.8299761, 1, 1, 1, 1, 1,
1.106848, 0.746445, 0.9179586, 1, 1, 1, 1, 1,
1.114421, -0.4087869, 2.082172, 1, 1, 1, 1, 1,
1.12073, 0.5435811, 1.019571, 1, 1, 1, 1, 1,
1.123421, 0.8451136, 0.4276175, 1, 1, 1, 1, 1,
1.126572, 0.6849786, 3.08553, 1, 1, 1, 1, 1,
1.126921, 0.4642101, 0.8339117, 1, 1, 1, 1, 1,
1.128165, -0.4423471, 0.8906083, 1, 1, 1, 1, 1,
1.130758, -0.005753325, 1.202963, 1, 1, 1, 1, 1,
1.142166, -0.8571574, 3.661412, 1, 1, 1, 1, 1,
1.14349, 0.4835858, 2.353293, 1, 1, 1, 1, 1,
1.147135, 1.351832, -1.378264, 0, 0, 1, 1, 1,
1.149422, -2.47744, 4.464486, 1, 0, 0, 1, 1,
1.161198, -1.350668, 2.658633, 1, 0, 0, 1, 1,
1.169499, -0.9814261, 1.746301, 1, 0, 0, 1, 1,
1.179297, 0.09128863, 1.958952, 1, 0, 0, 1, 1,
1.179571, -0.1688335, 1.021358, 1, 0, 0, 1, 1,
1.19929, 0.9594711, 0.3681802, 0, 0, 0, 1, 1,
1.202509, 0.02343722, 1.929509, 0, 0, 0, 1, 1,
1.208202, -0.4108942, 0.3977052, 0, 0, 0, 1, 1,
1.20983, -1.861092, 2.077477, 0, 0, 0, 1, 1,
1.218197, 0.2074382, 2.012055, 0, 0, 0, 1, 1,
1.220946, -0.187183, 0.9423839, 0, 0, 0, 1, 1,
1.225911, 1.426803, 0.1256705, 0, 0, 0, 1, 1,
1.228683, 0.4576118, -0.02806079, 1, 1, 1, 1, 1,
1.23065, 0.6082262, 1.511797, 1, 1, 1, 1, 1,
1.237891, 0.1975325, 1.053583, 1, 1, 1, 1, 1,
1.244701, 0.7554299, 0.7353077, 1, 1, 1, 1, 1,
1.246418, -0.1022889, 1.653847, 1, 1, 1, 1, 1,
1.248785, 0.2970034, 1.511054, 1, 1, 1, 1, 1,
1.250009, -0.6447351, 2.796104, 1, 1, 1, 1, 1,
1.251066, 0.3386736, 0.8878384, 1, 1, 1, 1, 1,
1.252619, -1.325127, 2.805514, 1, 1, 1, 1, 1,
1.271982, -0.9734331, 3.968677, 1, 1, 1, 1, 1,
1.273493, -0.2622343, 1.134168, 1, 1, 1, 1, 1,
1.274638, -0.2289426, 0.06527437, 1, 1, 1, 1, 1,
1.276144, -0.7757779, 0.9725931, 1, 1, 1, 1, 1,
1.286065, 0.5519536, 1.65697, 1, 1, 1, 1, 1,
1.29001, -0.7145982, 0.7282234, 1, 1, 1, 1, 1,
1.296151, 0.183101, 2.246417, 0, 0, 1, 1, 1,
1.300558, -1.243065, 3.708896, 1, 0, 0, 1, 1,
1.305652, -0.04866248, 1.794515, 1, 0, 0, 1, 1,
1.308932, -0.05246237, 2.64056, 1, 0, 0, 1, 1,
1.310292, 0.1385796, 3.697322, 1, 0, 0, 1, 1,
1.314324, -0.3406014, 2.37858, 1, 0, 0, 1, 1,
1.317221, 0.4563093, 1.827303, 0, 0, 0, 1, 1,
1.32247, 0.5523209, 0.9455075, 0, 0, 0, 1, 1,
1.326812, 0.0535889, 0.9934757, 0, 0, 0, 1, 1,
1.341745, 0.4104399, 1.782958, 0, 0, 0, 1, 1,
1.343145, 0.797264, 0.4528825, 0, 0, 0, 1, 1,
1.345589, 1.148353, 0.6872618, 0, 0, 0, 1, 1,
1.362422, 0.4865676, 1.197144, 0, 0, 0, 1, 1,
1.367383, 0.09176781, -0.5426795, 1, 1, 1, 1, 1,
1.382956, 0.39009, 0.742495, 1, 1, 1, 1, 1,
1.391523, 0.4790289, 0.7156125, 1, 1, 1, 1, 1,
1.405038, 0.6169478, 2.09962, 1, 1, 1, 1, 1,
1.420648, -1.364633, 2.718217, 1, 1, 1, 1, 1,
1.422097, -0.1264189, 1.63893, 1, 1, 1, 1, 1,
1.426786, -1.559953, 1.272054, 1, 1, 1, 1, 1,
1.435193, -0.05419906, -0.04260679, 1, 1, 1, 1, 1,
1.435449, -0.1443301, 1.450546, 1, 1, 1, 1, 1,
1.43638, -0.1409971, 2.906739, 1, 1, 1, 1, 1,
1.464895, -0.3460856, 1.18837, 1, 1, 1, 1, 1,
1.465314, 0.5925342, 0.781914, 1, 1, 1, 1, 1,
1.469959, 0.289647, 1.742854, 1, 1, 1, 1, 1,
1.476182, 0.9507614, 1.353157, 1, 1, 1, 1, 1,
1.490718, 0.1836512, 3.399796, 1, 1, 1, 1, 1,
1.49141, -0.2274317, 1.887299, 0, 0, 1, 1, 1,
1.517381, -1.19811, 1.636098, 1, 0, 0, 1, 1,
1.531747, 0.3356041, 0.7146403, 1, 0, 0, 1, 1,
1.532023, -1.651351, 1.717418, 1, 0, 0, 1, 1,
1.534127, -1.647253, 2.327802, 1, 0, 0, 1, 1,
1.538359, -0.7521827, 2.677394, 1, 0, 0, 1, 1,
1.575667, -0.4729854, 1.312341, 0, 0, 0, 1, 1,
1.600734, 0.06942225, 2.438904, 0, 0, 0, 1, 1,
1.602564, 0.2710175, 0.1345928, 0, 0, 0, 1, 1,
1.604806, 1.597487, -0.1149799, 0, 0, 0, 1, 1,
1.617121, 0.1839217, -0.05637368, 0, 0, 0, 1, 1,
1.624066, -0.4819123, 0.3950065, 0, 0, 0, 1, 1,
1.631405, -2.042304, 4.212667, 0, 0, 0, 1, 1,
1.638616, -0.4011195, 3.687554, 1, 1, 1, 1, 1,
1.644914, -0.6910694, 1.34846, 1, 1, 1, 1, 1,
1.647286, 1.664174, 0.9805765, 1, 1, 1, 1, 1,
1.651488, 0.04377473, 2.864769, 1, 1, 1, 1, 1,
1.654607, -1.506409, 1.459295, 1, 1, 1, 1, 1,
1.656306, -0.251264, 2.584602, 1, 1, 1, 1, 1,
1.699485, -2.548461, 3.622382, 1, 1, 1, 1, 1,
1.70241, -0.8648518, 1.268224, 1, 1, 1, 1, 1,
1.712644, -0.6825219, 2.038298, 1, 1, 1, 1, 1,
1.715727, -0.8906843, 2.968763, 1, 1, 1, 1, 1,
1.717262, -0.8841138, 2.937506, 1, 1, 1, 1, 1,
1.717265, -3.343067, 1.013518, 1, 1, 1, 1, 1,
1.743926, 0.002756918, 2.073982, 1, 1, 1, 1, 1,
1.75293, -1.406412, 3.891959, 1, 1, 1, 1, 1,
1.755605, 0.9014632, -0.9527321, 1, 1, 1, 1, 1,
1.765906, 1.332738, -0.1297139, 0, 0, 1, 1, 1,
1.769544, 0.05943394, 2.431048, 1, 0, 0, 1, 1,
1.777041, -1.521032, 0.7906176, 1, 0, 0, 1, 1,
1.779559, -1.366689, 3.513796, 1, 0, 0, 1, 1,
1.791827, 1.905393, 0.06775966, 1, 0, 0, 1, 1,
1.809556, -1.858461, 1.8184, 1, 0, 0, 1, 1,
1.83103, -1.601142, 0.8619455, 0, 0, 0, 1, 1,
1.838562, -0.1283474, 0.7897453, 0, 0, 0, 1, 1,
1.849411, -1.070607, 2.093826, 0, 0, 0, 1, 1,
1.866881, 1.916092, -0.2403868, 0, 0, 0, 1, 1,
1.873258, -1.379466, 0.7417981, 0, 0, 0, 1, 1,
1.874986, -0.870636, 1.810802, 0, 0, 0, 1, 1,
1.895402, 0.3249373, 3.092421, 0, 0, 0, 1, 1,
1.912821, -0.1966688, 0.9394848, 1, 1, 1, 1, 1,
1.938678, 0.7788938, 0.865173, 1, 1, 1, 1, 1,
1.938732, -0.192183, 2.526834, 1, 1, 1, 1, 1,
1.946156, -0.2791079, 3.919013, 1, 1, 1, 1, 1,
1.94749, -0.324845, 0.6883221, 1, 1, 1, 1, 1,
1.950656, 0.9313649, 1.278954, 1, 1, 1, 1, 1,
1.954157, -1.74539, 3.535062, 1, 1, 1, 1, 1,
1.965333, -0.2255776, 2.512505, 1, 1, 1, 1, 1,
1.967766, 0.9719358, 2.379239, 1, 1, 1, 1, 1,
1.968584, -1.535763, 3.040085, 1, 1, 1, 1, 1,
1.983545, -1.326172, 3.034631, 1, 1, 1, 1, 1,
2.004228, -0.8074804, 1.205842, 1, 1, 1, 1, 1,
2.036323, -1.187573, 1.197387, 1, 1, 1, 1, 1,
2.039125, 1.755066, 0.1197972, 1, 1, 1, 1, 1,
2.040774, -1.476905, 0.2903399, 1, 1, 1, 1, 1,
2.08103, -2.473823, 3.816469, 0, 0, 1, 1, 1,
2.086629, 0.1925258, 3.891498, 1, 0, 0, 1, 1,
2.101991, -0.7648089, 2.00737, 1, 0, 0, 1, 1,
2.103157, -0.3165605, 2.629514, 1, 0, 0, 1, 1,
2.126219, 2.390598, -0.3479044, 1, 0, 0, 1, 1,
2.128195, -0.3467578, 1.566635, 1, 0, 0, 1, 1,
2.129938, -1.914112, 1.937842, 0, 0, 0, 1, 1,
2.153594, 0.4390133, 2.057956, 0, 0, 0, 1, 1,
2.16014, -0.1065712, 1.033454, 0, 0, 0, 1, 1,
2.186496, -1.275193, 2.206704, 0, 0, 0, 1, 1,
2.188574, -2.793889, 1.275996, 0, 0, 0, 1, 1,
2.192064, -2.071811, 2.47696, 0, 0, 0, 1, 1,
2.225499, 1.881443, 0.784405, 0, 0, 0, 1, 1,
2.255723, 1.095851, 0.9740292, 1, 1, 1, 1, 1,
2.302789, 0.4790579, 1.023291, 1, 1, 1, 1, 1,
2.33498, -2.134763, 2.498216, 1, 1, 1, 1, 1,
2.464515, -1.278734, 1.977661, 1, 1, 1, 1, 1,
2.778146, 0.8087004, 3.118264, 1, 1, 1, 1, 1,
2.858865, 0.1379313, 2.252542, 1, 1, 1, 1, 1,
3.07256, -1.151245, 2.194839, 1, 1, 1, 1, 1
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
var radius = 9.206032;
var distance = 32.3358;
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
mvMatrix.translate( -0.2405595, 0.03598499, 0.01874089 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.3358);
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
