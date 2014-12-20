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
-3.050089, 0.5533895, -1.646496, 1, 0, 0, 1,
-2.900787, 0.7699273, -1.338585, 1, 0.007843138, 0, 1,
-2.594626, -0.3656465, -2.071591, 1, 0.01176471, 0, 1,
-2.365211, 2.351135, -2.315861, 1, 0.01960784, 0, 1,
-2.317865, 0.5956586, -0.5342709, 1, 0.02352941, 0, 1,
-2.286595, -1.608794, -2.358625, 1, 0.03137255, 0, 1,
-2.272179, -0.589281, -3.616343, 1, 0.03529412, 0, 1,
-2.249074, -0.2115448, -2.929831, 1, 0.04313726, 0, 1,
-2.242397, -1.252445, -1.104355, 1, 0.04705882, 0, 1,
-2.141077, -0.1216377, -1.561805, 1, 0.05490196, 0, 1,
-2.135058, -0.2682144, -4.104221, 1, 0.05882353, 0, 1,
-2.092853, 1.18769, -1.121528, 1, 0.06666667, 0, 1,
-2.084418, 2.250466, -0.03686807, 1, 0.07058824, 0, 1,
-2.074725, -0.1957802, -3.544538, 1, 0.07843138, 0, 1,
-2.043823, 0.05029094, 0.867228, 1, 0.08235294, 0, 1,
-2.036275, 0.1296156, -1.203564, 1, 0.09019608, 0, 1,
-2.03573, 1.532033, 0.6184493, 1, 0.09411765, 0, 1,
-2.022788, 0.3139936, -0.3432799, 1, 0.1019608, 0, 1,
-1.999021, -0.8328342, -1.976439, 1, 0.1098039, 0, 1,
-1.998432, -0.2855319, -2.128183, 1, 0.1137255, 0, 1,
-1.964974, 1.427549, -0.4121301, 1, 0.1215686, 0, 1,
-1.926696, 0.7045828, 0.1740302, 1, 0.1254902, 0, 1,
-1.923839, -0.4629216, -3.072209, 1, 0.1333333, 0, 1,
-1.883957, -1.253732, -2.656872, 1, 0.1372549, 0, 1,
-1.879577, 1.151539, -1.318228, 1, 0.145098, 0, 1,
-1.87857, -1.147405, -3.263674, 1, 0.1490196, 0, 1,
-1.861431, -0.2215036, -2.27387, 1, 0.1568628, 0, 1,
-1.857718, 0.5689753, 0.4832818, 1, 0.1607843, 0, 1,
-1.854937, -0.2167112, -0.422121, 1, 0.1686275, 0, 1,
-1.842916, 2.071532, -1.368231, 1, 0.172549, 0, 1,
-1.833269, -0.5296597, -2.116176, 1, 0.1803922, 0, 1,
-1.829696, -0.696993, -2.315119, 1, 0.1843137, 0, 1,
-1.820676, -0.782003, -0.595939, 1, 0.1921569, 0, 1,
-1.80987, -0.4955741, -1.802405, 1, 0.1960784, 0, 1,
-1.802518, -1.157286, -3.652835, 1, 0.2039216, 0, 1,
-1.784975, -1.348614, -3.303485, 1, 0.2117647, 0, 1,
-1.778006, -0.4603582, -1.991894, 1, 0.2156863, 0, 1,
-1.771029, 0.4222679, 0.01846799, 1, 0.2235294, 0, 1,
-1.768836, 0.9537882, 1.347267, 1, 0.227451, 0, 1,
-1.766314, 1.119414, -2.551343, 1, 0.2352941, 0, 1,
-1.739155, 1.620747, -2.037851, 1, 0.2392157, 0, 1,
-1.735672, -0.7378153, -0.2482935, 1, 0.2470588, 0, 1,
-1.731977, -0.2955007, -1.807395, 1, 0.2509804, 0, 1,
-1.726071, -0.5094594, -1.914855, 1, 0.2588235, 0, 1,
-1.707356, -0.7081948, -3.144839, 1, 0.2627451, 0, 1,
-1.697029, 0.1179866, -0.5438947, 1, 0.2705882, 0, 1,
-1.688415, 0.05977907, -1.496306, 1, 0.2745098, 0, 1,
-1.678757, 1.229577, -1.319358, 1, 0.282353, 0, 1,
-1.673072, -0.7727178, -1.552604, 1, 0.2862745, 0, 1,
-1.638993, -0.3936602, -1.762558, 1, 0.2941177, 0, 1,
-1.630728, 0.5519392, 0.2398056, 1, 0.3019608, 0, 1,
-1.630427, -0.9026746, -1.515066, 1, 0.3058824, 0, 1,
-1.612468, 0.1525379, -0.5642768, 1, 0.3137255, 0, 1,
-1.606688, -0.958142, -2.087696, 1, 0.3176471, 0, 1,
-1.582247, 0.04707662, -1.342412, 1, 0.3254902, 0, 1,
-1.576923, -0.8699193, -1.654577, 1, 0.3294118, 0, 1,
-1.574278, -0.5036246, 0.7005746, 1, 0.3372549, 0, 1,
-1.571717, 0.4207348, -1.141281, 1, 0.3411765, 0, 1,
-1.570467, -0.2215066, -2.515218, 1, 0.3490196, 0, 1,
-1.565763, -0.9399922, -1.320709, 1, 0.3529412, 0, 1,
-1.547831, 1.387102, -1.035767, 1, 0.3607843, 0, 1,
-1.546896, 0.3218374, -3.125009, 1, 0.3647059, 0, 1,
-1.542488, 0.8524646, -1.710914, 1, 0.372549, 0, 1,
-1.539472, 0.7610925, 0.5129033, 1, 0.3764706, 0, 1,
-1.538209, 1.464593, -2.221493, 1, 0.3843137, 0, 1,
-1.519006, 1.26259, -1.531015, 1, 0.3882353, 0, 1,
-1.504835, 0.2159357, -1.743236, 1, 0.3960784, 0, 1,
-1.493158, 0.3531133, -0.9647833, 1, 0.4039216, 0, 1,
-1.488516, 0.6417396, -1.172814, 1, 0.4078431, 0, 1,
-1.488402, -0.06576317, -1.069115, 1, 0.4156863, 0, 1,
-1.475122, -0.6220189, -2.187356, 1, 0.4196078, 0, 1,
-1.464137, 0.1525675, -1.383477, 1, 0.427451, 0, 1,
-1.46332, 0.3922986, -1.332951, 1, 0.4313726, 0, 1,
-1.45899, 0.2747144, -0.03366425, 1, 0.4392157, 0, 1,
-1.450586, 1.285528, -2.10449, 1, 0.4431373, 0, 1,
-1.447723, 0.2050988, -1.306822, 1, 0.4509804, 0, 1,
-1.439263, -0.4466562, -1.00783, 1, 0.454902, 0, 1,
-1.425886, 0.4046732, -1.169077, 1, 0.4627451, 0, 1,
-1.414003, 2.142668, -1.666712, 1, 0.4666667, 0, 1,
-1.412402, -0.288363, -3.094028, 1, 0.4745098, 0, 1,
-1.409464, 0.2468029, -0.3407817, 1, 0.4784314, 0, 1,
-1.408002, -0.6450861, -1.447201, 1, 0.4862745, 0, 1,
-1.385564, -0.695565, -1.691638, 1, 0.4901961, 0, 1,
-1.385508, 1.332877, -0.540773, 1, 0.4980392, 0, 1,
-1.38341, -0.5566707, -1.445507, 1, 0.5058824, 0, 1,
-1.381397, -0.4616626, -2.611895, 1, 0.509804, 0, 1,
-1.381201, 1.353228, -0.903169, 1, 0.5176471, 0, 1,
-1.381, -1.258621, -2.694632, 1, 0.5215687, 0, 1,
-1.377229, -0.5491477, -2.26594, 1, 0.5294118, 0, 1,
-1.365411, 1.23348, -0.1584579, 1, 0.5333334, 0, 1,
-1.363351, -0.6942394, -3.150682, 1, 0.5411765, 0, 1,
-1.354296, 0.4270794, -1.068902, 1, 0.5450981, 0, 1,
-1.351675, -0.913058, -2.899316, 1, 0.5529412, 0, 1,
-1.348286, 0.0792671, -0.6981706, 1, 0.5568628, 0, 1,
-1.342881, 1.074203, -1.427509, 1, 0.5647059, 0, 1,
-1.341155, -0.2052345, -1.563343, 1, 0.5686275, 0, 1,
-1.34065, -0.9368201, -1.206398, 1, 0.5764706, 0, 1,
-1.338758, 0.8412248, -0.9230709, 1, 0.5803922, 0, 1,
-1.332453, -0.5907765, -0.3346435, 1, 0.5882353, 0, 1,
-1.313203, -0.5021747, -1.465105, 1, 0.5921569, 0, 1,
-1.31228, 1.79469, -0.6687249, 1, 0.6, 0, 1,
-1.307942, -0.008099372, -0.756759, 1, 0.6078432, 0, 1,
-1.286105, -0.6431129, -2.657899, 1, 0.6117647, 0, 1,
-1.274176, 0.353037, -0.5112203, 1, 0.6196079, 0, 1,
-1.26926, -0.9727697, -0.7778716, 1, 0.6235294, 0, 1,
-1.264677, -0.1361782, -1.801903, 1, 0.6313726, 0, 1,
-1.255483, -0.1310956, -1.046662, 1, 0.6352941, 0, 1,
-1.249035, 0.7938201, 0.9763604, 1, 0.6431373, 0, 1,
-1.24166, 0.6553807, -1.12874, 1, 0.6470588, 0, 1,
-1.234396, -2.221351, -1.060794, 1, 0.654902, 0, 1,
-1.23101, 1.65773, -1.963549, 1, 0.6588235, 0, 1,
-1.227314, -2.522781, -2.822317, 1, 0.6666667, 0, 1,
-1.226701, 1.08532, -0.06173246, 1, 0.6705883, 0, 1,
-1.221238, 1.28018, -0.1541189, 1, 0.6784314, 0, 1,
-1.220333, 0.2003976, -2.031849, 1, 0.682353, 0, 1,
-1.218732, 1.190642, -0.7653577, 1, 0.6901961, 0, 1,
-1.218677, 0.3932576, -1.135536, 1, 0.6941177, 0, 1,
-1.214142, -0.3385459, -2.086145, 1, 0.7019608, 0, 1,
-1.200427, 1.695184, -0.1349269, 1, 0.7098039, 0, 1,
-1.198377, 1.979009, 0.5937969, 1, 0.7137255, 0, 1,
-1.196188, -0.184676, -1.970129, 1, 0.7215686, 0, 1,
-1.194602, 0.1161429, -2.104259, 1, 0.7254902, 0, 1,
-1.193482, 0.08815716, -1.235554, 1, 0.7333333, 0, 1,
-1.191881, -0.7604235, -2.104986, 1, 0.7372549, 0, 1,
-1.191128, -1.318455, -2.548795, 1, 0.7450981, 0, 1,
-1.189197, -0.3739543, -3.475218, 1, 0.7490196, 0, 1,
-1.184361, 0.5447878, -0.4481871, 1, 0.7568628, 0, 1,
-1.183593, 0.9118941, -0.449781, 1, 0.7607843, 0, 1,
-1.178817, -0.2896014, -1.842831, 1, 0.7686275, 0, 1,
-1.173537, 0.1746211, -1.963419, 1, 0.772549, 0, 1,
-1.173513, -0.06515575, -1.09851, 1, 0.7803922, 0, 1,
-1.172984, -2.059356, -3.92462, 1, 0.7843137, 0, 1,
-1.158859, -0.2015072, -3.03074, 1, 0.7921569, 0, 1,
-1.156122, 0.1914794, -0.02262273, 1, 0.7960784, 0, 1,
-1.150617, 0.4093332, -2.680855, 1, 0.8039216, 0, 1,
-1.150453, -0.2266513, -2.598049, 1, 0.8117647, 0, 1,
-1.141755, -0.04339526, -2.705884, 1, 0.8156863, 0, 1,
-1.141165, -0.1447872, -2.335894, 1, 0.8235294, 0, 1,
-1.118639, 0.9005669, -0.3056151, 1, 0.827451, 0, 1,
-1.117402, 1.417364, -0.2404677, 1, 0.8352941, 0, 1,
-1.115125, 2.112381, -0.5196234, 1, 0.8392157, 0, 1,
-1.113032, -0.2986154, -2.608359, 1, 0.8470588, 0, 1,
-1.110409, -1.577782, -3.803078, 1, 0.8509804, 0, 1,
-1.110369, 0.4740921, 0.2554388, 1, 0.8588235, 0, 1,
-1.107728, -0.8862404, -3.003125, 1, 0.8627451, 0, 1,
-1.107249, 0.08498668, -2.040496, 1, 0.8705882, 0, 1,
-1.094091, -1.855169, -2.263327, 1, 0.8745098, 0, 1,
-1.088531, -0.3851414, -2.72086, 1, 0.8823529, 0, 1,
-1.088335, -0.09857374, -2.407254, 1, 0.8862745, 0, 1,
-1.080953, -0.04340618, -1.79736, 1, 0.8941177, 0, 1,
-1.080371, -0.6812773, -1.960042, 1, 0.8980392, 0, 1,
-1.080098, -0.1898148, -2.511214, 1, 0.9058824, 0, 1,
-1.070393, 2.748668, 0.7676609, 1, 0.9137255, 0, 1,
-1.060732, 0.6507596, 1.055818, 1, 0.9176471, 0, 1,
-1.059111, 1.041597, -1.242227, 1, 0.9254902, 0, 1,
-1.053253, -0.5591499, -2.01037, 1, 0.9294118, 0, 1,
-1.053251, -0.6354325, -2.862899, 1, 0.9372549, 0, 1,
-1.050717, -1.127735, -1.982852, 1, 0.9411765, 0, 1,
-1.049326, 0.8507161, 0.8860543, 1, 0.9490196, 0, 1,
-1.048788, -0.1506981, -2.855552, 1, 0.9529412, 0, 1,
-1.048225, -0.4649014, -2.589983, 1, 0.9607843, 0, 1,
-1.046404, -0.5068858, -1.209564, 1, 0.9647059, 0, 1,
-1.040504, -0.2810109, -0.5257144, 1, 0.972549, 0, 1,
-1.039301, -0.1897617, -0.6726913, 1, 0.9764706, 0, 1,
-1.039059, 0.5878311, -0.2533832, 1, 0.9843137, 0, 1,
-1.038752, -1.217737, -3.491735, 1, 0.9882353, 0, 1,
-1.038494, 0.6371558, -1.499242, 1, 0.9960784, 0, 1,
-1.036634, -2.21677, -2.112039, 0.9960784, 1, 0, 1,
-1.029194, -0.8934367, -2.066015, 0.9921569, 1, 0, 1,
-1.028937, -1.365602, -2.016279, 0.9843137, 1, 0, 1,
-1.022055, 1.830198, -0.1504129, 0.9803922, 1, 0, 1,
-1.010797, -0.1848734, -2.947512, 0.972549, 1, 0, 1,
-1.001388, 1.518794, 0.03237317, 0.9686275, 1, 0, 1,
-1.000992, 0.3064125, -1.003943, 0.9607843, 1, 0, 1,
-0.9932284, -0.2621805, -2.653719, 0.9568627, 1, 0, 1,
-0.9900359, -0.6594337, -4.202699, 0.9490196, 1, 0, 1,
-0.9869461, -0.3755004, -2.600695, 0.945098, 1, 0, 1,
-0.9864408, -0.03768728, -2.578636, 0.9372549, 1, 0, 1,
-0.9858063, 1.163539, 0.3686199, 0.9333333, 1, 0, 1,
-0.9857865, 0.5892349, 0.847117, 0.9254902, 1, 0, 1,
-0.9857202, -0.06918774, -1.867007, 0.9215686, 1, 0, 1,
-0.9853425, 0.8145021, -1.974053, 0.9137255, 1, 0, 1,
-0.982655, 0.5138852, -2.670111, 0.9098039, 1, 0, 1,
-0.969537, -0.2319811, -2.515333, 0.9019608, 1, 0, 1,
-0.9667389, 0.9622464, 0.01831128, 0.8941177, 1, 0, 1,
-0.961477, -0.768967, -2.593691, 0.8901961, 1, 0, 1,
-0.9413183, -1.777657, -1.482301, 0.8823529, 1, 0, 1,
-0.9396647, 0.09646949, -0.0984328, 0.8784314, 1, 0, 1,
-0.9361398, -0.4210323, -1.507671, 0.8705882, 1, 0, 1,
-0.9348321, 1.034937, -0.9072377, 0.8666667, 1, 0, 1,
-0.9342256, 0.1244541, -0.719681, 0.8588235, 1, 0, 1,
-0.9321041, -0.2223888, -1.43628, 0.854902, 1, 0, 1,
-0.9308223, -0.4932575, -0.904983, 0.8470588, 1, 0, 1,
-0.9270098, -0.6817359, -2.249765, 0.8431373, 1, 0, 1,
-0.9263331, -0.7010154, -0.664588, 0.8352941, 1, 0, 1,
-0.9208307, 0.4159132, -3.239244, 0.8313726, 1, 0, 1,
-0.9195442, 1.157181, -1.684831, 0.8235294, 1, 0, 1,
-0.9120672, 0.4384341, -0.9289346, 0.8196079, 1, 0, 1,
-0.9033327, 0.1256811, -1.849459, 0.8117647, 1, 0, 1,
-0.9018549, -0.08671024, -3.094368, 0.8078431, 1, 0, 1,
-0.901679, -0.1829812, 0.387128, 0.8, 1, 0, 1,
-0.9003197, -0.3889186, -3.34222, 0.7921569, 1, 0, 1,
-0.8936496, 0.007894225, -1.297083, 0.7882353, 1, 0, 1,
-0.8892826, 1.336218, -1.192452, 0.7803922, 1, 0, 1,
-0.8860294, -1.192287, -1.618668, 0.7764706, 1, 0, 1,
-0.8741797, -0.5144888, -1.1484, 0.7686275, 1, 0, 1,
-0.8738827, -0.01111712, -1.021177, 0.7647059, 1, 0, 1,
-0.8697929, 1.029896, -0.1367476, 0.7568628, 1, 0, 1,
-0.8683549, 0.2704434, -2.490127, 0.7529412, 1, 0, 1,
-0.8628603, -0.741765, -3.230955, 0.7450981, 1, 0, 1,
-0.8627068, 1.46148, -1.920214, 0.7411765, 1, 0, 1,
-0.8616882, 0.5998705, -0.4846494, 0.7333333, 1, 0, 1,
-0.8602435, 0.1696374, -0.3819264, 0.7294118, 1, 0, 1,
-0.859016, 0.5313076, -0.5666299, 0.7215686, 1, 0, 1,
-0.8586, -1.389806, -2.825786, 0.7176471, 1, 0, 1,
-0.84661, -0.2687078, -2.128006, 0.7098039, 1, 0, 1,
-0.8444534, -0.04577648, -1.354887, 0.7058824, 1, 0, 1,
-0.8414917, 0.5444292, -0.9177738, 0.6980392, 1, 0, 1,
-0.8389906, 0.2696078, -2.966784, 0.6901961, 1, 0, 1,
-0.834363, -0.04593704, -3.955424, 0.6862745, 1, 0, 1,
-0.8336014, 0.09243529, -1.949595, 0.6784314, 1, 0, 1,
-0.8286235, -0.1122022, -1.431862, 0.6745098, 1, 0, 1,
-0.828167, 0.2091857, -2.198676, 0.6666667, 1, 0, 1,
-0.8235227, -0.6487138, -1.94224, 0.6627451, 1, 0, 1,
-0.8210346, -1.150581, -2.862442, 0.654902, 1, 0, 1,
-0.8199202, 0.337658, -0.9520171, 0.6509804, 1, 0, 1,
-0.813382, -0.003196853, -1.747842, 0.6431373, 1, 0, 1,
-0.8114741, 1.154491, -0.5723001, 0.6392157, 1, 0, 1,
-0.8055626, -0.1163277, -0.004127094, 0.6313726, 1, 0, 1,
-0.7997919, -0.04727519, -0.2791794, 0.627451, 1, 0, 1,
-0.7969518, 0.3194511, -0.7800874, 0.6196079, 1, 0, 1,
-0.7907362, -2.023446, -3.063998, 0.6156863, 1, 0, 1,
-0.790598, 0.9336402, -1.985561, 0.6078432, 1, 0, 1,
-0.7888114, 1.168643, -1.656399, 0.6039216, 1, 0, 1,
-0.7879044, 0.229623, -2.670628, 0.5960785, 1, 0, 1,
-0.7838542, -0.2200844, -2.698024, 0.5882353, 1, 0, 1,
-0.779727, -0.02197304, -2.594063, 0.5843138, 1, 0, 1,
-0.7764493, -2.372826, -4.639796, 0.5764706, 1, 0, 1,
-0.7665148, 0.7928593, -0.2791457, 0.572549, 1, 0, 1,
-0.7650828, 0.09311001, -3.094831, 0.5647059, 1, 0, 1,
-0.764922, -2.064616, -2.920171, 0.5607843, 1, 0, 1,
-0.7619256, 0.7497162, -1.77916, 0.5529412, 1, 0, 1,
-0.7613574, -0.5136908, -3.166791, 0.5490196, 1, 0, 1,
-0.7609321, -0.08166179, -1.994956, 0.5411765, 1, 0, 1,
-0.7555177, 0.9648806, -1.709649, 0.5372549, 1, 0, 1,
-0.7542459, -0.4031872, -2.835145, 0.5294118, 1, 0, 1,
-0.7536696, -1.175561, -0.515, 0.5254902, 1, 0, 1,
-0.7515084, -1.247304, -2.229049, 0.5176471, 1, 0, 1,
-0.7502003, -0.1176101, -3.73359, 0.5137255, 1, 0, 1,
-0.7492307, -0.1030493, -0.4213217, 0.5058824, 1, 0, 1,
-0.7434815, 1.244278, -0.9918855, 0.5019608, 1, 0, 1,
-0.7383318, -0.711542, -1.852715, 0.4941176, 1, 0, 1,
-0.7252149, 1.867137, 0.8693309, 0.4862745, 1, 0, 1,
-0.7214125, -1.355932, -1.734813, 0.4823529, 1, 0, 1,
-0.721198, -2.222953, -3.886101, 0.4745098, 1, 0, 1,
-0.7166013, 3.098917, -0.6527649, 0.4705882, 1, 0, 1,
-0.714285, -2.377372, -3.399826, 0.4627451, 1, 0, 1,
-0.7104525, 0.5827593, -1.913317, 0.4588235, 1, 0, 1,
-0.70967, 0.03761606, -1.367043, 0.4509804, 1, 0, 1,
-0.7095189, -2.07249, -0.3398957, 0.4470588, 1, 0, 1,
-0.7091247, -1.858418, -3.145812, 0.4392157, 1, 0, 1,
-0.708725, -0.211076, -3.015812, 0.4352941, 1, 0, 1,
-0.7052746, 1.251602, -0.00792997, 0.427451, 1, 0, 1,
-0.7012169, -0.006399991, -0.5343329, 0.4235294, 1, 0, 1,
-0.6964829, 0.9265563, 1.083645, 0.4156863, 1, 0, 1,
-0.6934131, -0.3502705, -0.7753382, 0.4117647, 1, 0, 1,
-0.6931086, 1.071263, -0.612423, 0.4039216, 1, 0, 1,
-0.6881468, 0.7300484, 0.4052206, 0.3960784, 1, 0, 1,
-0.6872039, 0.5116886, -1.015199, 0.3921569, 1, 0, 1,
-0.6795436, -0.3715157, -1.400584, 0.3843137, 1, 0, 1,
-0.6715037, 0.8888936, 1.222551, 0.3803922, 1, 0, 1,
-0.6708352, 0.1998419, -1.160696, 0.372549, 1, 0, 1,
-0.66598, -0.8626466, -3.274451, 0.3686275, 1, 0, 1,
-0.6589094, 0.5545259, -0.8273205, 0.3607843, 1, 0, 1,
-0.6584525, -0.6700162, -2.422261, 0.3568628, 1, 0, 1,
-0.6574105, -0.07038875, -2.737096, 0.3490196, 1, 0, 1,
-0.653029, 2.087491, -0.4644837, 0.345098, 1, 0, 1,
-0.6412936, -0.3360613, -1.373313, 0.3372549, 1, 0, 1,
-0.6370018, 0.1703121, -1.116346, 0.3333333, 1, 0, 1,
-0.6340092, 0.1380205, -1.486787, 0.3254902, 1, 0, 1,
-0.6321797, 0.8762755, 1.166749, 0.3215686, 1, 0, 1,
-0.6274444, 0.3991129, -1.013071, 0.3137255, 1, 0, 1,
-0.6240259, 0.7842627, 1.154244, 0.3098039, 1, 0, 1,
-0.6237921, 0.4762995, -1.385596, 0.3019608, 1, 0, 1,
-0.6235079, -1.435811, -4.013733, 0.2941177, 1, 0, 1,
-0.6229554, 1.138253, -0.5914288, 0.2901961, 1, 0, 1,
-0.6228752, 0.2115643, -1.030982, 0.282353, 1, 0, 1,
-0.6225386, 0.2413857, 0.04050274, 0.2784314, 1, 0, 1,
-0.6216652, -1.173672, -2.938109, 0.2705882, 1, 0, 1,
-0.620049, -2.351368, -4.168576, 0.2666667, 1, 0, 1,
-0.6182871, 0.6808481, -1.390972, 0.2588235, 1, 0, 1,
-0.6058618, -0.2039871, -3.320022, 0.254902, 1, 0, 1,
-0.6054285, -0.6622779, -3.318012, 0.2470588, 1, 0, 1,
-0.6023608, -1.127372, -3.694453, 0.2431373, 1, 0, 1,
-0.6005603, 0.746028, -1.191504, 0.2352941, 1, 0, 1,
-0.5997029, -0.4777196, -2.01347, 0.2313726, 1, 0, 1,
-0.5980384, -0.1192611, -0.910571, 0.2235294, 1, 0, 1,
-0.5969422, -1.033217, -2.677208, 0.2196078, 1, 0, 1,
-0.5960078, 1.054114, -1.634653, 0.2117647, 1, 0, 1,
-0.594919, -0.2258406, -1.735004, 0.2078431, 1, 0, 1,
-0.5932912, -0.9638387, -0.9726227, 0.2, 1, 0, 1,
-0.5909058, -1.405523, -1.743281, 0.1921569, 1, 0, 1,
-0.5875761, -0.6241502, -1.705633, 0.1882353, 1, 0, 1,
-0.586927, -0.3664973, -2.229769, 0.1803922, 1, 0, 1,
-0.5856502, -1.642562, -2.753582, 0.1764706, 1, 0, 1,
-0.5823188, -0.1182169, -1.391345, 0.1686275, 1, 0, 1,
-0.5797201, 0.1906033, -1.104824, 0.1647059, 1, 0, 1,
-0.576811, -0.334418, -4.707634, 0.1568628, 1, 0, 1,
-0.5724295, 0.02244919, -0.8507225, 0.1529412, 1, 0, 1,
-0.5672538, 0.4221458, -1.551104, 0.145098, 1, 0, 1,
-0.5655844, 2.425408, 1.784858, 0.1411765, 1, 0, 1,
-0.5625336, -0.9365087, -1.576591, 0.1333333, 1, 0, 1,
-0.5613153, -1.722661, -2.370331, 0.1294118, 1, 0, 1,
-0.559822, -1.584278, -2.022933, 0.1215686, 1, 0, 1,
-0.5595813, -1.284273, -3.463512, 0.1176471, 1, 0, 1,
-0.5578215, 0.5789461, -3.380435, 0.1098039, 1, 0, 1,
-0.552376, 0.8134691, -0.1826584, 0.1058824, 1, 0, 1,
-0.5517809, 0.1981276, -2.200328, 0.09803922, 1, 0, 1,
-0.5513633, -0.298464, -0.7506094, 0.09019608, 1, 0, 1,
-0.5502343, -2.15722, -2.725646, 0.08627451, 1, 0, 1,
-0.5469359, 0.06656056, 1.590829, 0.07843138, 1, 0, 1,
-0.5429927, 0.6777657, -2.10226, 0.07450981, 1, 0, 1,
-0.5367431, -1.098395, -2.397246, 0.06666667, 1, 0, 1,
-0.5301243, -0.7303538, -3.18129, 0.0627451, 1, 0, 1,
-0.5291067, 0.4580821, -0.7213042, 0.05490196, 1, 0, 1,
-0.5278364, -1.82863, -3.210282, 0.05098039, 1, 0, 1,
-0.5278101, -0.2286447, -1.749362, 0.04313726, 1, 0, 1,
-0.5228541, -2.191134, -3.297031, 0.03921569, 1, 0, 1,
-0.5215354, -0.3187126, -3.288398, 0.03137255, 1, 0, 1,
-0.5147297, -0.4315184, -0.7284939, 0.02745098, 1, 0, 1,
-0.5117471, 0.6454555, 0.3401573, 0.01960784, 1, 0, 1,
-0.5113197, -0.7116779, -0.9162067, 0.01568628, 1, 0, 1,
-0.500768, 2.052427, -1.496191, 0.007843138, 1, 0, 1,
-0.500186, -0.1979524, -0.7464145, 0.003921569, 1, 0, 1,
-0.4975421, -0.2305683, -2.66915, 0, 1, 0.003921569, 1,
-0.496363, 0.2284761, -1.465294, 0, 1, 0.01176471, 1,
-0.4948701, 0.9397789, -0.2779244, 0, 1, 0.01568628, 1,
-0.4882626, -0.06902698, -2.490131, 0, 1, 0.02352941, 1,
-0.4865321, 0.07493114, 0.01746632, 0, 1, 0.02745098, 1,
-0.4861568, -0.8392666, -0.5796817, 0, 1, 0.03529412, 1,
-0.4788128, 1.482567, 0.4634218, 0, 1, 0.03921569, 1,
-0.4782791, -0.3949237, -2.356225, 0, 1, 0.04705882, 1,
-0.4756783, 0.498122, -0.3677337, 0, 1, 0.05098039, 1,
-0.472932, -0.7922142, -3.412093, 0, 1, 0.05882353, 1,
-0.4696384, 1.374104, 0.3758543, 0, 1, 0.0627451, 1,
-0.4663641, 1.033354, -0.1502524, 0, 1, 0.07058824, 1,
-0.4613024, 0.5424625, -0.1425541, 0, 1, 0.07450981, 1,
-0.451019, -0.1376493, -3.331055, 0, 1, 0.08235294, 1,
-0.448522, 0.4201226, -1.046179, 0, 1, 0.08627451, 1,
-0.4476691, 1.405728, 0.4106343, 0, 1, 0.09411765, 1,
-0.4392521, 0.2121686, -2.444366, 0, 1, 0.1019608, 1,
-0.4374362, 2.243617, -0.3720102, 0, 1, 0.1058824, 1,
-0.4359684, -2.027138, -1.73793, 0, 1, 0.1137255, 1,
-0.4358865, 0.2252291, -2.248439, 0, 1, 0.1176471, 1,
-0.4318402, 0.3774906, -1.848285, 0, 1, 0.1254902, 1,
-0.4273472, -0.3456361, -1.927414, 0, 1, 0.1294118, 1,
-0.4225286, -0.459528, -1.826492, 0, 1, 0.1372549, 1,
-0.4170481, 0.7422787, -1.373714, 0, 1, 0.1411765, 1,
-0.4099409, 0.8792765, 1.29896, 0, 1, 0.1490196, 1,
-0.4072177, -2.279046, -3.81069, 0, 1, 0.1529412, 1,
-0.4055148, -0.3586363, -3.273684, 0, 1, 0.1607843, 1,
-0.4044558, -2.214176, -5.059553, 0, 1, 0.1647059, 1,
-0.4043376, 1.900594, -1.605729, 0, 1, 0.172549, 1,
-0.4018925, 1.024482, -2.529171, 0, 1, 0.1764706, 1,
-0.3918119, -0.2607656, -3.369608, 0, 1, 0.1843137, 1,
-0.3902024, -0.2213011, -2.335971, 0, 1, 0.1882353, 1,
-0.3900525, 0.3721907, -0.736248, 0, 1, 0.1960784, 1,
-0.3843067, -0.2963985, -2.283303, 0, 1, 0.2039216, 1,
-0.3763641, 2.155105, -0.9098898, 0, 1, 0.2078431, 1,
-0.3750134, 0.5977163, 0.4809804, 0, 1, 0.2156863, 1,
-0.374314, -0.7561359, -3.328252, 0, 1, 0.2196078, 1,
-0.3663912, 1.397703, 0.6756805, 0, 1, 0.227451, 1,
-0.3653073, 0.04039834, -2.146032, 0, 1, 0.2313726, 1,
-0.3517024, -1.29244, -3.834691, 0, 1, 0.2392157, 1,
-0.3480723, 0.9172187, 0.5817687, 0, 1, 0.2431373, 1,
-0.3454552, 2.044313, -0.2541412, 0, 1, 0.2509804, 1,
-0.3445526, -0.7580376, -3.381181, 0, 1, 0.254902, 1,
-0.3402486, -0.9049699, -2.197867, 0, 1, 0.2627451, 1,
-0.3389662, -0.7814984, -2.527733, 0, 1, 0.2666667, 1,
-0.3364807, -0.158931, -0.09735417, 0, 1, 0.2745098, 1,
-0.3293957, 1.392585, 0.2732534, 0, 1, 0.2784314, 1,
-0.3279484, -0.932023, -3.528544, 0, 1, 0.2862745, 1,
-0.3251186, -0.1091194, -2.797394, 0, 1, 0.2901961, 1,
-0.3185143, -0.7779657, -2.310941, 0, 1, 0.2980392, 1,
-0.3157995, 1.20625, 0.4604997, 0, 1, 0.3058824, 1,
-0.3152554, -0.7565558, -4.278491, 0, 1, 0.3098039, 1,
-0.3145539, 0.2136671, -1.951751, 0, 1, 0.3176471, 1,
-0.3143484, 1.383732, -1.005762, 0, 1, 0.3215686, 1,
-0.3130206, -1.440811, -2.082376, 0, 1, 0.3294118, 1,
-0.3095057, 0.00464278, -2.736112, 0, 1, 0.3333333, 1,
-0.3034812, 2.193268, -1.488922, 0, 1, 0.3411765, 1,
-0.3009824, 0.3683171, -0.4263265, 0, 1, 0.345098, 1,
-0.2999974, 1.044118, -0.8241693, 0, 1, 0.3529412, 1,
-0.2989745, 1.197686, -0.9121225, 0, 1, 0.3568628, 1,
-0.296249, -0.2835104, -3.241312, 0, 1, 0.3647059, 1,
-0.2929328, 0.7153113, 0.1800255, 0, 1, 0.3686275, 1,
-0.2852871, -1.548965, -2.413053, 0, 1, 0.3764706, 1,
-0.2838115, 1.248412, -0.2589036, 0, 1, 0.3803922, 1,
-0.2836519, -0.7063685, -1.955946, 0, 1, 0.3882353, 1,
-0.2810833, 1.469723, 1.341361, 0, 1, 0.3921569, 1,
-0.2801911, 0.5858983, -1.392487, 0, 1, 0.4, 1,
-0.277517, 1.05668, 0.09717587, 0, 1, 0.4078431, 1,
-0.2765239, -0.1425766, -0.7109473, 0, 1, 0.4117647, 1,
-0.2746851, -0.5584049, -2.514957, 0, 1, 0.4196078, 1,
-0.2708924, -0.514739, -2.854802, 0, 1, 0.4235294, 1,
-0.2695715, 2.011977, 0.9948969, 0, 1, 0.4313726, 1,
-0.2670107, 0.06357053, 0.1137612, 0, 1, 0.4352941, 1,
-0.265704, -0.002326761, 0.891188, 0, 1, 0.4431373, 1,
-0.2643073, -0.400745, -2.331398, 0, 1, 0.4470588, 1,
-0.2639981, 0.7723275, 0.8635629, 0, 1, 0.454902, 1,
-0.2604212, -0.5376973, -4.985417, 0, 1, 0.4588235, 1,
-0.2601714, -0.1234772, -1.193646, 0, 1, 0.4666667, 1,
-0.2560516, -0.8476008, -3.90981, 0, 1, 0.4705882, 1,
-0.2546312, -0.1412811, -2.828403, 0, 1, 0.4784314, 1,
-0.2540583, 0.9986222, -1.212918, 0, 1, 0.4823529, 1,
-0.2537949, 0.8276249, -0.4757257, 0, 1, 0.4901961, 1,
-0.2514206, -1.987874, -2.569218, 0, 1, 0.4941176, 1,
-0.2500342, 1.392552, -1.117005, 0, 1, 0.5019608, 1,
-0.2489874, 1.33959, -1.643392, 0, 1, 0.509804, 1,
-0.2462169, 0.1272109, -2.189154, 0, 1, 0.5137255, 1,
-0.2450183, -0.2264676, -3.187416, 0, 1, 0.5215687, 1,
-0.2383938, -1.989289, -2.898054, 0, 1, 0.5254902, 1,
-0.2383635, -1.034392, -2.747096, 0, 1, 0.5333334, 1,
-0.2375798, 0.4256793, -0.3772222, 0, 1, 0.5372549, 1,
-0.2373779, -2.002157, -2.575226, 0, 1, 0.5450981, 1,
-0.236555, 0.5729091, 0.1063016, 0, 1, 0.5490196, 1,
-0.2355727, -1.310111, -3.27872, 0, 1, 0.5568628, 1,
-0.2307066, 0.5397662, 0.3085271, 0, 1, 0.5607843, 1,
-0.2266096, 2.408321, -0.6766601, 0, 1, 0.5686275, 1,
-0.2246652, -1.783759, -1.201025, 0, 1, 0.572549, 1,
-0.2242496, -0.1461048, -1.466239, 0, 1, 0.5803922, 1,
-0.2237743, -0.2243412, -3.083159, 0, 1, 0.5843138, 1,
-0.2230989, -1.180719, -2.279742, 0, 1, 0.5921569, 1,
-0.2217862, 0.1753707, -1.008791, 0, 1, 0.5960785, 1,
-0.2086318, 0.5431357, -2.105199, 0, 1, 0.6039216, 1,
-0.2071081, 0.438142, 0.1480677, 0, 1, 0.6117647, 1,
-0.199052, -1.002438, -3.006629, 0, 1, 0.6156863, 1,
-0.1967006, 1.78404, -0.3158674, 0, 1, 0.6235294, 1,
-0.1964222, -0.2791784, -2.533797, 0, 1, 0.627451, 1,
-0.1935473, -1.280242, -3.284834, 0, 1, 0.6352941, 1,
-0.1918757, -1.443438, -3.972975, 0, 1, 0.6392157, 1,
-0.1871582, -0.7345001, -4.115618, 0, 1, 0.6470588, 1,
-0.1869676, 1.473515, 1.167811, 0, 1, 0.6509804, 1,
-0.1828867, -0.5538116, -3.305832, 0, 1, 0.6588235, 1,
-0.1821027, 2.64848, 1.38851, 0, 1, 0.6627451, 1,
-0.1814848, -1.494299, -4.112066, 0, 1, 0.6705883, 1,
-0.1809414, 0.1827606, -2.628067, 0, 1, 0.6745098, 1,
-0.1694518, 0.8408077, 0.3506285, 0, 1, 0.682353, 1,
-0.1688416, -0.3034254, -2.161437, 0, 1, 0.6862745, 1,
-0.1685578, 0.2267776, 0.2783987, 0, 1, 0.6941177, 1,
-0.1666274, 0.827094, 2.111634, 0, 1, 0.7019608, 1,
-0.1659724, 2.529993, 0.5883958, 0, 1, 0.7058824, 1,
-0.1625823, 0.6640685, -1.120765, 0, 1, 0.7137255, 1,
-0.1557031, 0.1155047, -0.6626878, 0, 1, 0.7176471, 1,
-0.1506878, 0.9896818, 0.6635776, 0, 1, 0.7254902, 1,
-0.1477425, -0.7061872, -1.804284, 0, 1, 0.7294118, 1,
-0.1444027, -1.101376, -1.132712, 0, 1, 0.7372549, 1,
-0.1428654, 1.285924, 1.797402, 0, 1, 0.7411765, 1,
-0.1423721, 0.7397446, 0.3125611, 0, 1, 0.7490196, 1,
-0.1375307, 1.101066, -0.2911581, 0, 1, 0.7529412, 1,
-0.1366925, 1.297258, 0.1719828, 0, 1, 0.7607843, 1,
-0.1363255, -0.6835403, -2.290165, 0, 1, 0.7647059, 1,
-0.1355117, -0.3670639, -2.805496, 0, 1, 0.772549, 1,
-0.1350626, -1.412799, -3.114684, 0, 1, 0.7764706, 1,
-0.1291882, 0.6008727, 0.6125308, 0, 1, 0.7843137, 1,
-0.1189472, -0.590891, -3.271457, 0, 1, 0.7882353, 1,
-0.1188291, -0.6345313, -1.805087, 0, 1, 0.7960784, 1,
-0.1175483, 1.774562, 1.314968, 0, 1, 0.8039216, 1,
-0.1169239, 0.1362747, -0.1115425, 0, 1, 0.8078431, 1,
-0.1036988, -1.434027, -3.610622, 0, 1, 0.8156863, 1,
-0.1035152, -0.7772225, -4.000013, 0, 1, 0.8196079, 1,
-0.102364, 0.8907632, -0.6540112, 0, 1, 0.827451, 1,
-0.1004843, 0.1108621, -0.796154, 0, 1, 0.8313726, 1,
-0.09926633, -1.589936, -2.830043, 0, 1, 0.8392157, 1,
-0.09523233, -1.976365, -1.44616, 0, 1, 0.8431373, 1,
-0.07864671, -0.3477474, -2.387173, 0, 1, 0.8509804, 1,
-0.07820836, -0.117984, -3.116528, 0, 1, 0.854902, 1,
-0.07698671, -1.212358, -0.8609387, 0, 1, 0.8627451, 1,
-0.07610247, 0.4558249, -0.1067857, 0, 1, 0.8666667, 1,
-0.07569657, 0.7860772, -0.07617923, 0, 1, 0.8745098, 1,
-0.07185053, 0.4589156, -1.493146, 0, 1, 0.8784314, 1,
-0.07132797, 0.3288492, -1.651657, 0, 1, 0.8862745, 1,
-0.0697775, 0.2306224, 0.5138031, 0, 1, 0.8901961, 1,
-0.06822865, -0.7195322, -3.161591, 0, 1, 0.8980392, 1,
-0.06395302, 0.7534488, 1.882451, 0, 1, 0.9058824, 1,
-0.06389715, -0.5889521, -3.244335, 0, 1, 0.9098039, 1,
-0.06306072, 0.1294915, -0.9574475, 0, 1, 0.9176471, 1,
-0.06102625, 0.141357, -0.2679178, 0, 1, 0.9215686, 1,
-0.05606636, -0.9400287, -2.076639, 0, 1, 0.9294118, 1,
-0.0485506, -1.088086, -2.030458, 0, 1, 0.9333333, 1,
-0.04692033, 0.06718876, -1.465927, 0, 1, 0.9411765, 1,
-0.04505688, -0.8899657, -2.664844, 0, 1, 0.945098, 1,
-0.04078306, 0.7511602, 2.107846, 0, 1, 0.9529412, 1,
-0.03584354, 0.5255818, -0.8413337, 0, 1, 0.9568627, 1,
-0.03424957, 1.32482, 0.6941722, 0, 1, 0.9647059, 1,
-0.02985796, 1.620144, -0.7288277, 0, 1, 0.9686275, 1,
-0.02385106, -0.4446584, -1.871637, 0, 1, 0.9764706, 1,
-0.02315636, 0.2071474, -0.3927672, 0, 1, 0.9803922, 1,
-0.02042298, -0.8028017, -3.768107, 0, 1, 0.9882353, 1,
-0.01739565, 0.2745252, -1.13364, 0, 1, 0.9921569, 1,
-0.01220689, 1.305456, -2.555956, 0, 1, 1, 1,
-0.007522887, -0.9406754, -3.53493, 0, 0.9921569, 1, 1,
-0.007228843, -0.221683, -1.875235, 0, 0.9882353, 1, 1,
-0.005611218, 0.7202424, -0.923466, 0, 0.9803922, 1, 1,
-0.002676577, -1.246818, -3.322536, 0, 0.9764706, 1, 1,
-0.0008774046, -0.05400477, -1.936138, 0, 0.9686275, 1, 1,
0.002759368, 0.7517796, 0.1138121, 0, 0.9647059, 1, 1,
0.007822827, 2.583302, -0.1034305, 0, 0.9568627, 1, 1,
0.009801585, -1.79373, 3.868046, 0, 0.9529412, 1, 1,
0.01283136, 0.2419469, -0.132376, 0, 0.945098, 1, 1,
0.01339311, 0.1252508, 1.328397, 0, 0.9411765, 1, 1,
0.01382627, -0.6547694, 0.7615342, 0, 0.9333333, 1, 1,
0.01384445, -0.1173821, 3.499129, 0, 0.9294118, 1, 1,
0.01455359, 0.6243904, 0.1808046, 0, 0.9215686, 1, 1,
0.01465982, 0.6672813, -1.954393, 0, 0.9176471, 1, 1,
0.01756475, -1.84336, 4.368494, 0, 0.9098039, 1, 1,
0.02256743, 0.3314251, 0.2540252, 0, 0.9058824, 1, 1,
0.02697431, 2.009422, 0.3641188, 0, 0.8980392, 1, 1,
0.02769115, -0.1740634, 5.01976, 0, 0.8901961, 1, 1,
0.0283764, -0.1721011, 2.887084, 0, 0.8862745, 1, 1,
0.03064453, -0.5159637, 4.004152, 0, 0.8784314, 1, 1,
0.03064955, 0.1221633, -0.1508309, 0, 0.8745098, 1, 1,
0.03758753, 0.4128052, 1.135047, 0, 0.8666667, 1, 1,
0.04020355, 0.2564989, -0.2752095, 0, 0.8627451, 1, 1,
0.04361287, -1.181686, 5.234134, 0, 0.854902, 1, 1,
0.04363339, 0.8071046, -0.05455304, 0, 0.8509804, 1, 1,
0.04898323, -0.571166, 2.914528, 0, 0.8431373, 1, 1,
0.05161398, 1.033473, -0.6638287, 0, 0.8392157, 1, 1,
0.05367408, -0.245887, 4.464993, 0, 0.8313726, 1, 1,
0.06387318, -1.619228, 3.399246, 0, 0.827451, 1, 1,
0.06565179, 0.2157384, 1.500026, 0, 0.8196079, 1, 1,
0.06630836, 1.733461, -0.2380215, 0, 0.8156863, 1, 1,
0.06848989, 1.350843, 0.3011417, 0, 0.8078431, 1, 1,
0.06990051, -0.1554356, 3.061884, 0, 0.8039216, 1, 1,
0.06998263, -0.7237347, 2.440303, 0, 0.7960784, 1, 1,
0.07854333, 0.974921, -0.4591539, 0, 0.7882353, 1, 1,
0.08150944, -1.080969, 1.590677, 0, 0.7843137, 1, 1,
0.08162425, 0.09510472, 0.9438961, 0, 0.7764706, 1, 1,
0.08215168, -1.119283, 4.165524, 0, 0.772549, 1, 1,
0.08433867, -1.905374, 0.6031044, 0, 0.7647059, 1, 1,
0.08654443, 0.7918907, -1.740229, 0, 0.7607843, 1, 1,
0.08709408, 0.5348037, -1.13484, 0, 0.7529412, 1, 1,
0.08749136, -0.7362013, 2.420353, 0, 0.7490196, 1, 1,
0.09266562, -0.9389138, 0.9141081, 0, 0.7411765, 1, 1,
0.09572056, -0.2639378, 2.81193, 0, 0.7372549, 1, 1,
0.09702169, -0.6904504, 2.640303, 0, 0.7294118, 1, 1,
0.1019733, -0.6675771, 2.636179, 0, 0.7254902, 1, 1,
0.1109815, 0.851318, 0.6244266, 0, 0.7176471, 1, 1,
0.111336, 0.808664, 1.39385, 0, 0.7137255, 1, 1,
0.1119739, -0.07226964, 1.21165, 0, 0.7058824, 1, 1,
0.1126485, 1.160139, 1.15746, 0, 0.6980392, 1, 1,
0.1179243, -0.2353436, 2.4006, 0, 0.6941177, 1, 1,
0.1190076, 0.697383, -0.3227077, 0, 0.6862745, 1, 1,
0.1196495, 1.734424, 1.755327, 0, 0.682353, 1, 1,
0.1198261, -0.4340931, 5.106836, 0, 0.6745098, 1, 1,
0.1226473, 1.142615, 1.894967, 0, 0.6705883, 1, 1,
0.1266016, -0.8843645, 3.0741, 0, 0.6627451, 1, 1,
0.1287398, 0.759316, 1.334535, 0, 0.6588235, 1, 1,
0.1374717, 0.202363, 0.08152023, 0, 0.6509804, 1, 1,
0.1419833, -0.2857296, 3.383838, 0, 0.6470588, 1, 1,
0.1421021, 0.74444, 1.646395, 0, 0.6392157, 1, 1,
0.1451068, -0.9558296, 3.239132, 0, 0.6352941, 1, 1,
0.1526017, -0.380364, 4.565553, 0, 0.627451, 1, 1,
0.156106, 0.1997784, 1.330564, 0, 0.6235294, 1, 1,
0.1584375, -1.372403, 3.832092, 0, 0.6156863, 1, 1,
0.1597392, 0.9767725, -0.07930336, 0, 0.6117647, 1, 1,
0.1672505, -0.2095043, 1.884181, 0, 0.6039216, 1, 1,
0.1676989, -0.4526425, 2.027823, 0, 0.5960785, 1, 1,
0.1681307, -0.4486237, 3.132378, 0, 0.5921569, 1, 1,
0.1706777, 1.673731, -0.7203525, 0, 0.5843138, 1, 1,
0.1735325, -0.06879006, 1.422995, 0, 0.5803922, 1, 1,
0.1757735, -1.862366, 2.630157, 0, 0.572549, 1, 1,
0.1758678, -0.4273875, 3.62849, 0, 0.5686275, 1, 1,
0.1771346, 1.073497, -0.7594146, 0, 0.5607843, 1, 1,
0.1805776, 1.365687, -0.2465919, 0, 0.5568628, 1, 1,
0.182307, -0.7618764, 1.950962, 0, 0.5490196, 1, 1,
0.1827033, 0.266596, -0.1884976, 0, 0.5450981, 1, 1,
0.1833901, -0.02621558, 1.791609, 0, 0.5372549, 1, 1,
0.1853855, 0.5881683, -0.7608131, 0, 0.5333334, 1, 1,
0.1864379, -1.258941, 2.956985, 0, 0.5254902, 1, 1,
0.1908316, -0.1752384, 0.5443151, 0, 0.5215687, 1, 1,
0.1937517, -1.094103, 2.659827, 0, 0.5137255, 1, 1,
0.1964339, -0.7285399, 2.52333, 0, 0.509804, 1, 1,
0.1967, 1.360464, -0.2258183, 0, 0.5019608, 1, 1,
0.1982916, -0.5518424, 0.6663107, 0, 0.4941176, 1, 1,
0.198416, -1.168816, 3.329039, 0, 0.4901961, 1, 1,
0.2056024, 0.7899194, 2.992509, 0, 0.4823529, 1, 1,
0.2095286, 0.04904197, 1.801537, 0, 0.4784314, 1, 1,
0.2103939, 0.4747685, 1.514341, 0, 0.4705882, 1, 1,
0.2157995, -0.0140779, -0.2613542, 0, 0.4666667, 1, 1,
0.2207742, -0.3204398, 2.003263, 0, 0.4588235, 1, 1,
0.2207844, -0.4980186, 2.308566, 0, 0.454902, 1, 1,
0.2253998, -0.6939889, 4.201214, 0, 0.4470588, 1, 1,
0.2287351, -0.6244594, 1.284167, 0, 0.4431373, 1, 1,
0.2303374, -1.14018, 4.65605, 0, 0.4352941, 1, 1,
0.2337693, 0.1959106, -0.5017992, 0, 0.4313726, 1, 1,
0.2377358, -1.024197, 1.427064, 0, 0.4235294, 1, 1,
0.2446144, 0.08817508, -0.9869292, 0, 0.4196078, 1, 1,
0.2535526, -0.04244709, 1.690273, 0, 0.4117647, 1, 1,
0.2537226, -1.219689, 2.229829, 0, 0.4078431, 1, 1,
0.2566484, 0.5758742, 0.7762455, 0, 0.4, 1, 1,
0.2610393, 0.4829519, 0.3708543, 0, 0.3921569, 1, 1,
0.2615948, -0.3452147, 2.621957, 0, 0.3882353, 1, 1,
0.2712143, 1.287747, 0.9359976, 0, 0.3803922, 1, 1,
0.2714876, 0.2833358, 0.5025228, 0, 0.3764706, 1, 1,
0.2726413, -0.7489712, -1.023927, 0, 0.3686275, 1, 1,
0.2806205, -0.2450972, 4.050978, 0, 0.3647059, 1, 1,
0.2832694, 1.08201, 1.124874, 0, 0.3568628, 1, 1,
0.2840083, 1.27587, -2.219804, 0, 0.3529412, 1, 1,
0.2849937, -0.7307302, 2.960108, 0, 0.345098, 1, 1,
0.2880718, 0.4447661, 2.609749, 0, 0.3411765, 1, 1,
0.290859, 0.4701058, -0.05818189, 0, 0.3333333, 1, 1,
0.2927699, -2.190742, 3.586861, 0, 0.3294118, 1, 1,
0.2940524, -1.944563, 2.994908, 0, 0.3215686, 1, 1,
0.294095, 0.5143878, 1.512793, 0, 0.3176471, 1, 1,
0.2973233, -0.8495462, 2.779765, 0, 0.3098039, 1, 1,
0.2984666, -1.205427, 2.461542, 0, 0.3058824, 1, 1,
0.2990304, 1.83476, 1.139602, 0, 0.2980392, 1, 1,
0.3016371, 0.3686458, 0.147376, 0, 0.2901961, 1, 1,
0.308157, 0.5925832, 0.2689439, 0, 0.2862745, 1, 1,
0.3109114, -0.6305338, 4.578091, 0, 0.2784314, 1, 1,
0.3111621, -1.893657, 2.076712, 0, 0.2745098, 1, 1,
0.3113454, 1.969922, 0.8274105, 0, 0.2666667, 1, 1,
0.3126881, 1.394385, 1.176912, 0, 0.2627451, 1, 1,
0.3152919, -1.525285, 3.089719, 0, 0.254902, 1, 1,
0.3227826, 1.452804, 0.1709506, 0, 0.2509804, 1, 1,
0.3283792, 0.463062, 0.7671309, 0, 0.2431373, 1, 1,
0.3284985, -0.8534078, 0.1370225, 0, 0.2392157, 1, 1,
0.3304037, 0.1978351, 1.560392, 0, 0.2313726, 1, 1,
0.3363405, -0.2256137, 3.335408, 0, 0.227451, 1, 1,
0.3422751, 0.3892145, -0.9475242, 0, 0.2196078, 1, 1,
0.3425227, 1.613551, 0.1296027, 0, 0.2156863, 1, 1,
0.3425699, 0.3196803, 0.8675343, 0, 0.2078431, 1, 1,
0.3440555, 0.1334045, 0.461684, 0, 0.2039216, 1, 1,
0.3487673, 0.8474637, 1.142347, 0, 0.1960784, 1, 1,
0.3507607, -1.671869, 3.791756, 0, 0.1882353, 1, 1,
0.3541601, -0.8177733, 2.016888, 0, 0.1843137, 1, 1,
0.3554268, -0.2365433, 3.229611, 0, 0.1764706, 1, 1,
0.3561409, -0.1533391, 3.248747, 0, 0.172549, 1, 1,
0.3620122, 0.5812132, 1.017664, 0, 0.1647059, 1, 1,
0.3649726, -0.1366003, 1.318518, 0, 0.1607843, 1, 1,
0.3662181, -0.08852051, 1.261574, 0, 0.1529412, 1, 1,
0.369534, 0.9863753, 0.9553429, 0, 0.1490196, 1, 1,
0.3702553, 1.414218, 0.7010266, 0, 0.1411765, 1, 1,
0.3745409, -0.4227756, 3.450202, 0, 0.1372549, 1, 1,
0.3754846, -0.4017522, 5.210316, 0, 0.1294118, 1, 1,
0.3758734, -0.2110858, 0.2735587, 0, 0.1254902, 1, 1,
0.3759749, -0.7919918, 1.029305, 0, 0.1176471, 1, 1,
0.380559, 0.8211423, 0.3562806, 0, 0.1137255, 1, 1,
0.3853058, -1.990291, 1.872499, 0, 0.1058824, 1, 1,
0.3863924, 0.8695851, -0.3087319, 0, 0.09803922, 1, 1,
0.3887559, 1.0755, -0.1828283, 0, 0.09411765, 1, 1,
0.3898883, -0.879183, 2.653682, 0, 0.08627451, 1, 1,
0.3972258, 0.5475845, 1.589807, 0, 0.08235294, 1, 1,
0.3976569, -0.9711072, 1.65141, 0, 0.07450981, 1, 1,
0.4024125, 0.7968669, 0.7762076, 0, 0.07058824, 1, 1,
0.4091386, -1.24445, 2.691036, 0, 0.0627451, 1, 1,
0.409888, 1.070315, 0.6820729, 0, 0.05882353, 1, 1,
0.4120627, -1.727439, 0.8930939, 0, 0.05098039, 1, 1,
0.4175625, 0.3993167, 0.6185566, 0, 0.04705882, 1, 1,
0.4227235, -0.2837203, 2.275553, 0, 0.03921569, 1, 1,
0.4232886, -0.8274941, 2.981821, 0, 0.03529412, 1, 1,
0.4293248, -1.486687, 2.725077, 0, 0.02745098, 1, 1,
0.429841, -0.5790056, 1.025424, 0, 0.02352941, 1, 1,
0.4331778, -0.8182634, 2.987024, 0, 0.01568628, 1, 1,
0.4342729, 1.596645, 1.004127, 0, 0.01176471, 1, 1,
0.4349238, -0.3936583, 2.544511, 0, 0.003921569, 1, 1,
0.4376987, 0.507775, -0.3220789, 0.003921569, 0, 1, 1,
0.437829, 0.4719059, 0.9508812, 0.007843138, 0, 1, 1,
0.4403415, 0.3399913, 1.874573, 0.01568628, 0, 1, 1,
0.4432387, 0.1808736, 1.861194, 0.01960784, 0, 1, 1,
0.4450395, 0.4616686, 1.087079, 0.02745098, 0, 1, 1,
0.4478124, 0.2623294, 1.656803, 0.03137255, 0, 1, 1,
0.4480098, 0.09743172, 1.559324, 0.03921569, 0, 1, 1,
0.4498647, 1.965114, 0.6979631, 0.04313726, 0, 1, 1,
0.45324, 0.003094959, -0.2905653, 0.05098039, 0, 1, 1,
0.4533756, 1.472505, -0.8040882, 0.05490196, 0, 1, 1,
0.4587518, -0.3900936, 1.645479, 0.0627451, 0, 1, 1,
0.4599842, -1.123775, 2.930058, 0.06666667, 0, 1, 1,
0.4640357, -0.7224708, 4.791, 0.07450981, 0, 1, 1,
0.4649919, 0.7911887, -2.082645, 0.07843138, 0, 1, 1,
0.4667772, 0.4498556, -0.5989455, 0.08627451, 0, 1, 1,
0.4674254, -1.060277, 4.27371, 0.09019608, 0, 1, 1,
0.4704424, -0.8307466, 2.503904, 0.09803922, 0, 1, 1,
0.4727099, -0.1851622, 2.018668, 0.1058824, 0, 1, 1,
0.4772061, 0.5007158, 1.199175, 0.1098039, 0, 1, 1,
0.4773886, -1.064081, 2.620637, 0.1176471, 0, 1, 1,
0.4801177, -0.1051151, 1.114434, 0.1215686, 0, 1, 1,
0.4815962, -0.2632814, 0.9875839, 0.1294118, 0, 1, 1,
0.4819637, 1.469118, 0.2487005, 0.1333333, 0, 1, 1,
0.4890197, 0.8855564, 1.813972, 0.1411765, 0, 1, 1,
0.4896809, 0.3928874, 1.683863, 0.145098, 0, 1, 1,
0.4905065, -1.810666, 3.404108, 0.1529412, 0, 1, 1,
0.5089238, -0.439668, 1.158362, 0.1568628, 0, 1, 1,
0.513822, -1.019612, 3.185771, 0.1647059, 0, 1, 1,
0.5183755, -0.4793514, 3.292177, 0.1686275, 0, 1, 1,
0.5210733, -1.202182, 3.388399, 0.1764706, 0, 1, 1,
0.5247183, -1.067786, 0.6844838, 0.1803922, 0, 1, 1,
0.5307956, -0.06961188, 1.819751, 0.1882353, 0, 1, 1,
0.531794, 0.6684659, -0.3016928, 0.1921569, 0, 1, 1,
0.5322459, -0.1717486, 0.5396636, 0.2, 0, 1, 1,
0.5323592, -0.595372, 1.67366, 0.2078431, 0, 1, 1,
0.5344599, -1.275267, 3.482757, 0.2117647, 0, 1, 1,
0.5364997, 0.4080813, 0.09802091, 0.2196078, 0, 1, 1,
0.5378318, -2.437876, 2.635985, 0.2235294, 0, 1, 1,
0.5413507, -0.651638, 4.637386, 0.2313726, 0, 1, 1,
0.5415007, 1.203113, 0.2834266, 0.2352941, 0, 1, 1,
0.5475961, -0.06345009, 3.074553, 0.2431373, 0, 1, 1,
0.5478875, -0.4306596, 2.697232, 0.2470588, 0, 1, 1,
0.5516802, 0.8892633, -0.6740166, 0.254902, 0, 1, 1,
0.5544277, 0.995692, -1.339346, 0.2588235, 0, 1, 1,
0.5557422, -0.656498, 1.623673, 0.2666667, 0, 1, 1,
0.5560095, -0.6426752, 2.37943, 0.2705882, 0, 1, 1,
0.5567631, -0.3509921, 1.697567, 0.2784314, 0, 1, 1,
0.5569583, -1.267357, 2.04768, 0.282353, 0, 1, 1,
0.5599132, -1.089279, 2.450568, 0.2901961, 0, 1, 1,
0.5701889, 0.947445, 3.151429, 0.2941177, 0, 1, 1,
0.5719286, 1.545195, 0.895332, 0.3019608, 0, 1, 1,
0.5785323, -0.7586696, 2.795739, 0.3098039, 0, 1, 1,
0.5786529, -0.7028134, 3.841032, 0.3137255, 0, 1, 1,
0.5800446, 0.1004329, 1.810414, 0.3215686, 0, 1, 1,
0.5858007, -0.1892792, 1.307285, 0.3254902, 0, 1, 1,
0.5861005, -0.423348, 2.126994, 0.3333333, 0, 1, 1,
0.5929356, 0.1429286, 2.113813, 0.3372549, 0, 1, 1,
0.5949379, -1.457037, 4.322511, 0.345098, 0, 1, 1,
0.5954323, -1.123735, 2.206421, 0.3490196, 0, 1, 1,
0.5976638, -0.7269223, 2.028977, 0.3568628, 0, 1, 1,
0.600972, 0.4853632, 1.068455, 0.3607843, 0, 1, 1,
0.6014249, -1.015393, 2.360669, 0.3686275, 0, 1, 1,
0.6016924, 1.675981, -0.597767, 0.372549, 0, 1, 1,
0.60716, 0.1421657, 1.675282, 0.3803922, 0, 1, 1,
0.6176153, -0.9814948, 3.47501, 0.3843137, 0, 1, 1,
0.6193722, 1.836803, -0.7445571, 0.3921569, 0, 1, 1,
0.6215308, -2.052122, 2.435022, 0.3960784, 0, 1, 1,
0.6218246, 0.4679098, 1.550679, 0.4039216, 0, 1, 1,
0.6220189, -0.3603451, 2.575193, 0.4117647, 0, 1, 1,
0.6226528, 0.2739314, 1.721516, 0.4156863, 0, 1, 1,
0.6284978, -0.6113956, 1.893111, 0.4235294, 0, 1, 1,
0.6315847, 1.787919, 0.1955059, 0.427451, 0, 1, 1,
0.633485, -1.592017, 2.660067, 0.4352941, 0, 1, 1,
0.6348978, -0.1422927, 0.7667012, 0.4392157, 0, 1, 1,
0.6360145, 0.4256544, 0.4798074, 0.4470588, 0, 1, 1,
0.6384153, -1.277816, 2.473902, 0.4509804, 0, 1, 1,
0.6390675, -2.482495, 3.516078, 0.4588235, 0, 1, 1,
0.6417205, -0.8416725, 1.001686, 0.4627451, 0, 1, 1,
0.6501143, 0.5105058, 1.847365, 0.4705882, 0, 1, 1,
0.6519914, 0.771737, 1.474438, 0.4745098, 0, 1, 1,
0.6530821, -1.357103, 3.994001, 0.4823529, 0, 1, 1,
0.6538822, -0.9804342, 4.540962, 0.4862745, 0, 1, 1,
0.6598165, 0.03300391, 0.4413623, 0.4941176, 0, 1, 1,
0.6608041, 0.3224607, 1.865673, 0.5019608, 0, 1, 1,
0.6654766, -2.4844, 3.537568, 0.5058824, 0, 1, 1,
0.671563, -1.382938, 2.176696, 0.5137255, 0, 1, 1,
0.6725472, -1.574641, 3.212486, 0.5176471, 0, 1, 1,
0.6758946, -0.4295267, 1.773986, 0.5254902, 0, 1, 1,
0.6766613, 0.3286757, 1.282424, 0.5294118, 0, 1, 1,
0.6832285, 0.7738868, 0.4761865, 0.5372549, 0, 1, 1,
0.6837655, 0.6328707, 1.378843, 0.5411765, 0, 1, 1,
0.6849611, 0.06289139, 1.152009, 0.5490196, 0, 1, 1,
0.6884856, 0.898701, 1.558745, 0.5529412, 0, 1, 1,
0.6886924, 0.1039993, 2.139928, 0.5607843, 0, 1, 1,
0.6907865, -0.1366963, 1.876808, 0.5647059, 0, 1, 1,
0.6996012, 0.6385986, 0.646778, 0.572549, 0, 1, 1,
0.6996092, -1.460224, 4.137604, 0.5764706, 0, 1, 1,
0.7005343, -0.4268036, 3.707733, 0.5843138, 0, 1, 1,
0.7040419, 0.2939592, 1.316451, 0.5882353, 0, 1, 1,
0.7048945, 0.4385304, 3.073323, 0.5960785, 0, 1, 1,
0.7115859, 1.824267, -0.4329962, 0.6039216, 0, 1, 1,
0.7138025, 0.3754594, -0.4349, 0.6078432, 0, 1, 1,
0.714928, 0.05420922, 1.115023, 0.6156863, 0, 1, 1,
0.7178825, -1.08489, 2.171178, 0.6196079, 0, 1, 1,
0.7231787, 0.5013626, 1.426817, 0.627451, 0, 1, 1,
0.7261305, 1.27749, 0.1533694, 0.6313726, 0, 1, 1,
0.7264545, -0.9589844, 2.689314, 0.6392157, 0, 1, 1,
0.7318798, 0.5388759, 1.470587, 0.6431373, 0, 1, 1,
0.7319548, 0.3134281, 0.0933845, 0.6509804, 0, 1, 1,
0.7321585, -0.1569407, 1.751532, 0.654902, 0, 1, 1,
0.7368122, 2.152443, -0.7325411, 0.6627451, 0, 1, 1,
0.7377319, 0.05860842, 1.985738, 0.6666667, 0, 1, 1,
0.7437804, 1.086919, -0.08292723, 0.6745098, 0, 1, 1,
0.7517564, -0.7436765, 1.593201, 0.6784314, 0, 1, 1,
0.7608049, 1.628696, -0.8905009, 0.6862745, 0, 1, 1,
0.7615582, -0.4811313, 3.523125, 0.6901961, 0, 1, 1,
0.7679512, -0.1552899, 2.866303, 0.6980392, 0, 1, 1,
0.771411, 0.6505694, 0.4829963, 0.7058824, 0, 1, 1,
0.7752686, -1.269205, 2.919082, 0.7098039, 0, 1, 1,
0.777122, -0.01528335, 2.918206, 0.7176471, 0, 1, 1,
0.7773486, 1.435324, 0.7915716, 0.7215686, 0, 1, 1,
0.7795135, -0.7319602, 2.64592, 0.7294118, 0, 1, 1,
0.7801348, 0.3992901, 2.542292, 0.7333333, 0, 1, 1,
0.7809755, 0.5124188, 1.073376, 0.7411765, 0, 1, 1,
0.7815789, -0.3416075, 1.557798, 0.7450981, 0, 1, 1,
0.7830408, -0.1572241, 2.757288, 0.7529412, 0, 1, 1,
0.7903706, -0.1223528, 0.8073477, 0.7568628, 0, 1, 1,
0.7914441, -0.5980795, 1.787915, 0.7647059, 0, 1, 1,
0.7936251, -0.5132986, 1.98209, 0.7686275, 0, 1, 1,
0.8000212, -0.1017963, 1.441096, 0.7764706, 0, 1, 1,
0.8071786, -0.2753655, 2.111107, 0.7803922, 0, 1, 1,
0.810364, 0.7728249, 1.682455, 0.7882353, 0, 1, 1,
0.812681, -0.1014363, 2.884643, 0.7921569, 0, 1, 1,
0.8169616, 1.390699, 0.9050813, 0.8, 0, 1, 1,
0.8178027, 1.557307, 2.637909, 0.8078431, 0, 1, 1,
0.8196012, -0.6612687, 2.020923, 0.8117647, 0, 1, 1,
0.8325766, -0.8507869, 0.7707599, 0.8196079, 0, 1, 1,
0.8383458, -0.1160654, 1.990643, 0.8235294, 0, 1, 1,
0.8408741, 0.5875065, 1.387971, 0.8313726, 0, 1, 1,
0.8458625, -0.9984449, 1.7042, 0.8352941, 0, 1, 1,
0.8665416, -0.1800176, 1.455512, 0.8431373, 0, 1, 1,
0.8686661, 0.2127621, 0.7614153, 0.8470588, 0, 1, 1,
0.8762754, 0.3250435, 0.8108339, 0.854902, 0, 1, 1,
0.8821736, 0.4201761, 0.2157841, 0.8588235, 0, 1, 1,
0.8899235, 0.735562, 1.598843, 0.8666667, 0, 1, 1,
0.8900974, 0.2566272, 1.616983, 0.8705882, 0, 1, 1,
0.8987013, 0.9832873, 1.691739, 0.8784314, 0, 1, 1,
0.9057912, 0.04611991, 1.245313, 0.8823529, 0, 1, 1,
0.9106246, -0.2111445, 1.152526, 0.8901961, 0, 1, 1,
0.9114046, -1.058027, 1.686836, 0.8941177, 0, 1, 1,
0.9223306, 0.6458023, 2.914151, 0.9019608, 0, 1, 1,
0.9282049, -1.162825, 1.911931, 0.9098039, 0, 1, 1,
0.9407014, -3.059278, 3.33637, 0.9137255, 0, 1, 1,
0.9442914, 0.2629617, 2.976371, 0.9215686, 0, 1, 1,
0.947206, -0.4301991, 2.325171, 0.9254902, 0, 1, 1,
0.9478139, -0.1450033, 1.83646, 0.9333333, 0, 1, 1,
0.955872, 0.3194063, 1.865853, 0.9372549, 0, 1, 1,
0.9621095, 0.2508111, 0.9062503, 0.945098, 0, 1, 1,
0.964377, 0.4994775, 0.6568186, 0.9490196, 0, 1, 1,
0.96731, -0.5556301, 1.883967, 0.9568627, 0, 1, 1,
0.9707775, 0.4505771, 1.573701, 0.9607843, 0, 1, 1,
0.9747981, -1.71288, 2.949502, 0.9686275, 0, 1, 1,
0.975022, 0.1087663, 0.9963952, 0.972549, 0, 1, 1,
0.9783354, 1.150818, 0.01036092, 0.9803922, 0, 1, 1,
0.9803064, 0.502337, 2.801342, 0.9843137, 0, 1, 1,
0.983578, 0.5455154, -0.3051459, 0.9921569, 0, 1, 1,
0.9841161, 0.457169, 1.734802, 0.9960784, 0, 1, 1,
0.9896714, -0.3240247, 0.3410725, 1, 0, 0.9960784, 1,
0.9916049, -1.667066, 1.571241, 1, 0, 0.9882353, 1,
0.9958264, 0.9686354, 0.9180393, 1, 0, 0.9843137, 1,
0.9973425, -1.454838, 1.817339, 1, 0, 0.9764706, 1,
0.9992874, -1.088173, 3.498849, 1, 0, 0.972549, 1,
1.006061, 0.4017824, -0.5451133, 1, 0, 0.9647059, 1,
1.006577, -0.3820568, 1.764076, 1, 0, 0.9607843, 1,
1.019566, 0.06009202, 0.6084548, 1, 0, 0.9529412, 1,
1.023112, 1.922487, 0.266095, 1, 0, 0.9490196, 1,
1.026607, -0.1771861, 1.640979, 1, 0, 0.9411765, 1,
1.037251, 0.8540918, -0.1947985, 1, 0, 0.9372549, 1,
1.03806, -0.2157225, 2.610561, 1, 0, 0.9294118, 1,
1.04082, -0.2628914, 1.575799, 1, 0, 0.9254902, 1,
1.041471, -0.9075562, 2.24246, 1, 0, 0.9176471, 1,
1.056656, -0.2062722, 2.568174, 1, 0, 0.9137255, 1,
1.058254, 0.6084024, -0.1548758, 1, 0, 0.9058824, 1,
1.059265, -0.1553198, 1.54474, 1, 0, 0.9019608, 1,
1.06437, -0.2252806, 3.247186, 1, 0, 0.8941177, 1,
1.069806, -0.747395, 0.3128023, 1, 0, 0.8862745, 1,
1.071812, 0.09771512, 0.9249399, 1, 0, 0.8823529, 1,
1.074429, 1.190975, 1.054108, 1, 0, 0.8745098, 1,
1.075517, 0.3088593, 3.185569, 1, 0, 0.8705882, 1,
1.078156, -0.1936409, 1.435584, 1, 0, 0.8627451, 1,
1.085711, 1.450368, 1.285493, 1, 0, 0.8588235, 1,
1.098711, 0.5705112, 1.29263, 1, 0, 0.8509804, 1,
1.098727, -0.2185025, 3.390859, 1, 0, 0.8470588, 1,
1.100109, 0.01107476, 2.031588, 1, 0, 0.8392157, 1,
1.104829, 0.4690228, -0.4712379, 1, 0, 0.8352941, 1,
1.107249, 1.25978, 0.03173553, 1, 0, 0.827451, 1,
1.109493, 1.880583, 0.6749519, 1, 0, 0.8235294, 1,
1.114794, 0.4827423, 2.317945, 1, 0, 0.8156863, 1,
1.119982, -0.7805655, 2.754287, 1, 0, 0.8117647, 1,
1.127744, -1.083904, 0.7861125, 1, 0, 0.8039216, 1,
1.132097, -0.7951168, 2.133861, 1, 0, 0.7960784, 1,
1.136906, -0.6001731, 0.7587529, 1, 0, 0.7921569, 1,
1.142962, 0.4511949, 1.282935, 1, 0, 0.7843137, 1,
1.147856, 0.8372506, 2.826501, 1, 0, 0.7803922, 1,
1.155265, -1.212114, 2.603503, 1, 0, 0.772549, 1,
1.157571, 0.2610359, 1.62757, 1, 0, 0.7686275, 1,
1.165123, -1.519082, 3.23901, 1, 0, 0.7607843, 1,
1.165275, -1.517597, 2.483855, 1, 0, 0.7568628, 1,
1.165575, -0.6598216, 2.616012, 1, 0, 0.7490196, 1,
1.170684, -0.3019746, 3.376759, 1, 0, 0.7450981, 1,
1.171014, 0.6194044, 2.121676, 1, 0, 0.7372549, 1,
1.173397, -0.8332638, 1.605059, 1, 0, 0.7333333, 1,
1.182824, 1.032639, 1.16421, 1, 0, 0.7254902, 1,
1.18423, -1.118195, 3.740003, 1, 0, 0.7215686, 1,
1.189685, 0.02156713, 4.365489, 1, 0, 0.7137255, 1,
1.194975, 1.815983, -0.2002821, 1, 0, 0.7098039, 1,
1.198082, -0.7611232, 2.045547, 1, 0, 0.7019608, 1,
1.20541, -1.474258, 2.702549, 1, 0, 0.6941177, 1,
1.206428, 1.867055, 0.7114387, 1, 0, 0.6901961, 1,
1.21984, -0.6184801, 3.243987, 1, 0, 0.682353, 1,
1.221905, 0.05060346, 2.02464, 1, 0, 0.6784314, 1,
1.222112, -0.2094901, 1.344245, 1, 0, 0.6705883, 1,
1.224215, -2.514699, 3.366415, 1, 0, 0.6666667, 1,
1.239444, 1.080435, -1.309838, 1, 0, 0.6588235, 1,
1.240593, 0.9892813, -0.4529973, 1, 0, 0.654902, 1,
1.247997, 1.160718, 2.237964, 1, 0, 0.6470588, 1,
1.251283, -1.456313, 1.045055, 1, 0, 0.6431373, 1,
1.251381, -1.345505, 2.670405, 1, 0, 0.6352941, 1,
1.253071, -0.09076472, -0.8144941, 1, 0, 0.6313726, 1,
1.262991, 0.488661, 0.1769919, 1, 0, 0.6235294, 1,
1.265106, 0.8170384, -0.798067, 1, 0, 0.6196079, 1,
1.265364, -2.141282, 1.512259, 1, 0, 0.6117647, 1,
1.265935, 0.2178986, 0.2553961, 1, 0, 0.6078432, 1,
1.266796, -2.632327, 1.231425, 1, 0, 0.6, 1,
1.277701, -0.1553913, 1.518932, 1, 0, 0.5921569, 1,
1.278108, 1.314887, 2.030533, 1, 0, 0.5882353, 1,
1.291769, -0.8318604, 3.317755, 1, 0, 0.5803922, 1,
1.296973, 1.927674, 1.028571, 1, 0, 0.5764706, 1,
1.303974, -1.746773, 0.8663545, 1, 0, 0.5686275, 1,
1.30718, 1.602789, 0.5975645, 1, 0, 0.5647059, 1,
1.311655, -0.2878662, 2.077029, 1, 0, 0.5568628, 1,
1.311759, 0.071305, 2.39455, 1, 0, 0.5529412, 1,
1.320668, -0.7917119, 2.400834, 1, 0, 0.5450981, 1,
1.321146, 0.4994442, 1.970621, 1, 0, 0.5411765, 1,
1.335298, 0.2035281, 2.166673, 1, 0, 0.5333334, 1,
1.339694, -1.649355, 1.447763, 1, 0, 0.5294118, 1,
1.344266, 0.2913051, 1.355789, 1, 0, 0.5215687, 1,
1.352362, -0.05213451, 1.680156, 1, 0, 0.5176471, 1,
1.362225, -0.6105404, 0.9269559, 1, 0, 0.509804, 1,
1.364149, -0.5824803, 3.564152, 1, 0, 0.5058824, 1,
1.366519, -0.5640516, 2.274013, 1, 0, 0.4980392, 1,
1.369208, -2.495639, 3.206594, 1, 0, 0.4901961, 1,
1.369464, 0.4782957, 1.162315, 1, 0, 0.4862745, 1,
1.370196, -0.5981315, 3.429357, 1, 0, 0.4784314, 1,
1.376305, 0.4542176, 2.513141, 1, 0, 0.4745098, 1,
1.385661, 0.06137111, 1.942186, 1, 0, 0.4666667, 1,
1.389489, 0.1916038, 3.54493, 1, 0, 0.4627451, 1,
1.397336, 0.7620084, 2.064604, 1, 0, 0.454902, 1,
1.398966, 0.266771, 0.4296147, 1, 0, 0.4509804, 1,
1.401975, 0.9659742, 1.027781, 1, 0, 0.4431373, 1,
1.423611, 0.2740725, 0.1756728, 1, 0, 0.4392157, 1,
1.425587, -0.744426, 1.967758, 1, 0, 0.4313726, 1,
1.430551, 1.095637, 1.227663, 1, 0, 0.427451, 1,
1.435469, 0.1033693, 0.5903297, 1, 0, 0.4196078, 1,
1.436649, 2.415491, -0.6569939, 1, 0, 0.4156863, 1,
1.437413, -0.06401427, 1.684462, 1, 0, 0.4078431, 1,
1.45454, -0.8700962, 4.603091, 1, 0, 0.4039216, 1,
1.459308, 0.1422961, -0.833313, 1, 0, 0.3960784, 1,
1.467036, -0.3390447, 2.707157, 1, 0, 0.3882353, 1,
1.467975, -0.2260749, 1.383437, 1, 0, 0.3843137, 1,
1.472157, -1.028534, 3.15352, 1, 0, 0.3764706, 1,
1.476465, -0.9119085, 1.938472, 1, 0, 0.372549, 1,
1.504652, 1.382653, 0.9613018, 1, 0, 0.3647059, 1,
1.504993, 1.145702, 1.210211, 1, 0, 0.3607843, 1,
1.522321, 0.2490505, 0.1285157, 1, 0, 0.3529412, 1,
1.533889, 0.7210414, -0.004497709, 1, 0, 0.3490196, 1,
1.53605, -2.489404, 2.37094, 1, 0, 0.3411765, 1,
1.538207, 0.4967368, 1.426117, 1, 0, 0.3372549, 1,
1.540789, 1.421747, 1.791898, 1, 0, 0.3294118, 1,
1.548164, 0.6187063, 2.027636, 1, 0, 0.3254902, 1,
1.554526, -0.2502479, 2.066046, 1, 0, 0.3176471, 1,
1.559745, 0.7419471, 1.915672, 1, 0, 0.3137255, 1,
1.560019, -1.363745, 3.214405, 1, 0, 0.3058824, 1,
1.591528, 0.8568703, 0.6560801, 1, 0, 0.2980392, 1,
1.601264, -0.3953849, 3.117724, 1, 0, 0.2941177, 1,
1.618847, 0.6906729, 1.337574, 1, 0, 0.2862745, 1,
1.620642, 1.147642, 1.812388, 1, 0, 0.282353, 1,
1.627959, 0.5332059, 1.742385, 1, 0, 0.2745098, 1,
1.636032, 0.5413889, 2.347487, 1, 0, 0.2705882, 1,
1.641186, -0.8089876, 2.058244, 1, 0, 0.2627451, 1,
1.646582, -0.700544, 1.774632, 1, 0, 0.2588235, 1,
1.649127, -0.6367824, 3.38756, 1, 0, 0.2509804, 1,
1.720819, 0.7572043, 0.7093074, 1, 0, 0.2470588, 1,
1.723849, -1.125694, 2.349806, 1, 0, 0.2392157, 1,
1.724161, 0.31874, 1.049559, 1, 0, 0.2352941, 1,
1.734248, -0.2355229, 3.789504, 1, 0, 0.227451, 1,
1.762653, -2.374274, 3.016867, 1, 0, 0.2235294, 1,
1.785078, 1.463283, 0.5668455, 1, 0, 0.2156863, 1,
1.787434, -0.8048637, -0.3964246, 1, 0, 0.2117647, 1,
1.802924, -1.121537, 2.361351, 1, 0, 0.2039216, 1,
1.807889, -1.111722, 2.257743, 1, 0, 0.1960784, 1,
1.808983, -1.590073, 1.571077, 1, 0, 0.1921569, 1,
1.837901, -0.2809671, 2.152306, 1, 0, 0.1843137, 1,
1.84795, -0.4142819, -0.4662913, 1, 0, 0.1803922, 1,
1.85816, 0.2658619, 0.5724889, 1, 0, 0.172549, 1,
1.887458, -0.7039828, 0.8908263, 1, 0, 0.1686275, 1,
1.889668, 2.265166, 0.1110794, 1, 0, 0.1607843, 1,
1.905613, 0.7300354, -0.425597, 1, 0, 0.1568628, 1,
1.922197, 1.2179, 1.256607, 1, 0, 0.1490196, 1,
1.926469, 0.4397049, 1.184765, 1, 0, 0.145098, 1,
1.940535, -0.1225854, 0.7346575, 1, 0, 0.1372549, 1,
1.978366, -0.9584674, 0.4508562, 1, 0, 0.1333333, 1,
1.979026, -0.467265, 0.8466074, 1, 0, 0.1254902, 1,
1.994829, -0.6430288, 2.00058, 1, 0, 0.1215686, 1,
2.023356, -1.470604, 1.900916, 1, 0, 0.1137255, 1,
2.026833, -0.6250841, 0.0618636, 1, 0, 0.1098039, 1,
2.036906, -0.05536568, -0.05308665, 1, 0, 0.1019608, 1,
2.03944, 0.1811175, 0.760134, 1, 0, 0.09411765, 1,
2.074963, -1.776718, 2.300689, 1, 0, 0.09019608, 1,
2.175919, 0.8813493, 1.766918, 1, 0, 0.08235294, 1,
2.214986, 0.5784104, 1.272573, 1, 0, 0.07843138, 1,
2.235879, 1.289946, 1.516767, 1, 0, 0.07058824, 1,
2.270531, 0.5478407, 0.9741107, 1, 0, 0.06666667, 1,
2.294794, 0.1747134, 1.624906, 1, 0, 0.05882353, 1,
2.318902, -0.1323803, 1.822335, 1, 0, 0.05490196, 1,
2.328834, 0.8887765, 0.9886968, 1, 0, 0.04705882, 1,
2.367228, 0.4150584, 1.294603, 1, 0, 0.04313726, 1,
2.407732, 1.175888, 0.7264458, 1, 0, 0.03529412, 1,
2.483353, -1.303397, 2.130962, 1, 0, 0.03137255, 1,
2.504328, -0.6575099, 1.989289, 1, 0, 0.02352941, 1,
2.580532, 0.8374646, 1.710547, 1, 0, 0.01960784, 1,
2.763985, -1.060893, 3.577931, 1, 0, 0.01176471, 1,
3.393466, -0.9189029, 0.5271494, 1, 0, 0.007843138, 1
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
0.1716883, -4.103092, -6.804333, 0, -0.5, 0.5, 0.5,
0.1716883, -4.103092, -6.804333, 1, -0.5, 0.5, 0.5,
0.1716883, -4.103092, -6.804333, 1, 1.5, 0.5, 0.5,
0.1716883, -4.103092, -6.804333, 0, 1.5, 0.5, 0.5
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
-4.142272, 0.01981938, -6.804333, 0, -0.5, 0.5, 0.5,
-4.142272, 0.01981938, -6.804333, 1, -0.5, 0.5, 0.5,
-4.142272, 0.01981938, -6.804333, 1, 1.5, 0.5, 0.5,
-4.142272, 0.01981938, -6.804333, 0, 1.5, 0.5, 0.5
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
-4.142272, -4.103092, 0.08729053, 0, -0.5, 0.5, 0.5,
-4.142272, -4.103092, 0.08729053, 1, -0.5, 0.5, 0.5,
-4.142272, -4.103092, 0.08729053, 1, 1.5, 0.5, 0.5,
-4.142272, -4.103092, 0.08729053, 0, 1.5, 0.5, 0.5
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
-3, -3.151651, -5.213958,
3, -3.151651, -5.213958,
-3, -3.151651, -5.213958,
-3, -3.310225, -5.479021,
-2, -3.151651, -5.213958,
-2, -3.310225, -5.479021,
-1, -3.151651, -5.213958,
-1, -3.310225, -5.479021,
0, -3.151651, -5.213958,
0, -3.310225, -5.479021,
1, -3.151651, -5.213958,
1, -3.310225, -5.479021,
2, -3.151651, -5.213958,
2, -3.310225, -5.479021,
3, -3.151651, -5.213958,
3, -3.310225, -5.479021
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
-3, -3.627372, -6.009146, 0, -0.5, 0.5, 0.5,
-3, -3.627372, -6.009146, 1, -0.5, 0.5, 0.5,
-3, -3.627372, -6.009146, 1, 1.5, 0.5, 0.5,
-3, -3.627372, -6.009146, 0, 1.5, 0.5, 0.5,
-2, -3.627372, -6.009146, 0, -0.5, 0.5, 0.5,
-2, -3.627372, -6.009146, 1, -0.5, 0.5, 0.5,
-2, -3.627372, -6.009146, 1, 1.5, 0.5, 0.5,
-2, -3.627372, -6.009146, 0, 1.5, 0.5, 0.5,
-1, -3.627372, -6.009146, 0, -0.5, 0.5, 0.5,
-1, -3.627372, -6.009146, 1, -0.5, 0.5, 0.5,
-1, -3.627372, -6.009146, 1, 1.5, 0.5, 0.5,
-1, -3.627372, -6.009146, 0, 1.5, 0.5, 0.5,
0, -3.627372, -6.009146, 0, -0.5, 0.5, 0.5,
0, -3.627372, -6.009146, 1, -0.5, 0.5, 0.5,
0, -3.627372, -6.009146, 1, 1.5, 0.5, 0.5,
0, -3.627372, -6.009146, 0, 1.5, 0.5, 0.5,
1, -3.627372, -6.009146, 0, -0.5, 0.5, 0.5,
1, -3.627372, -6.009146, 1, -0.5, 0.5, 0.5,
1, -3.627372, -6.009146, 1, 1.5, 0.5, 0.5,
1, -3.627372, -6.009146, 0, 1.5, 0.5, 0.5,
2, -3.627372, -6.009146, 0, -0.5, 0.5, 0.5,
2, -3.627372, -6.009146, 1, -0.5, 0.5, 0.5,
2, -3.627372, -6.009146, 1, 1.5, 0.5, 0.5,
2, -3.627372, -6.009146, 0, 1.5, 0.5, 0.5,
3, -3.627372, -6.009146, 0, -0.5, 0.5, 0.5,
3, -3.627372, -6.009146, 1, -0.5, 0.5, 0.5,
3, -3.627372, -6.009146, 1, 1.5, 0.5, 0.5,
3, -3.627372, -6.009146, 0, 1.5, 0.5, 0.5
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
-3.146742, -3, -5.213958,
-3.146742, 3, -5.213958,
-3.146742, -3, -5.213958,
-3.312664, -3, -5.479021,
-3.146742, -2, -5.213958,
-3.312664, -2, -5.479021,
-3.146742, -1, -5.213958,
-3.312664, -1, -5.479021,
-3.146742, 0, -5.213958,
-3.312664, 0, -5.479021,
-3.146742, 1, -5.213958,
-3.312664, 1, -5.479021,
-3.146742, 2, -5.213958,
-3.312664, 2, -5.479021,
-3.146742, 3, -5.213958,
-3.312664, 3, -5.479021
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
-3.644507, -3, -6.009146, 0, -0.5, 0.5, 0.5,
-3.644507, -3, -6.009146, 1, -0.5, 0.5, 0.5,
-3.644507, -3, -6.009146, 1, 1.5, 0.5, 0.5,
-3.644507, -3, -6.009146, 0, 1.5, 0.5, 0.5,
-3.644507, -2, -6.009146, 0, -0.5, 0.5, 0.5,
-3.644507, -2, -6.009146, 1, -0.5, 0.5, 0.5,
-3.644507, -2, -6.009146, 1, 1.5, 0.5, 0.5,
-3.644507, -2, -6.009146, 0, 1.5, 0.5, 0.5,
-3.644507, -1, -6.009146, 0, -0.5, 0.5, 0.5,
-3.644507, -1, -6.009146, 1, -0.5, 0.5, 0.5,
-3.644507, -1, -6.009146, 1, 1.5, 0.5, 0.5,
-3.644507, -1, -6.009146, 0, 1.5, 0.5, 0.5,
-3.644507, 0, -6.009146, 0, -0.5, 0.5, 0.5,
-3.644507, 0, -6.009146, 1, -0.5, 0.5, 0.5,
-3.644507, 0, -6.009146, 1, 1.5, 0.5, 0.5,
-3.644507, 0, -6.009146, 0, 1.5, 0.5, 0.5,
-3.644507, 1, -6.009146, 0, -0.5, 0.5, 0.5,
-3.644507, 1, -6.009146, 1, -0.5, 0.5, 0.5,
-3.644507, 1, -6.009146, 1, 1.5, 0.5, 0.5,
-3.644507, 1, -6.009146, 0, 1.5, 0.5, 0.5,
-3.644507, 2, -6.009146, 0, -0.5, 0.5, 0.5,
-3.644507, 2, -6.009146, 1, -0.5, 0.5, 0.5,
-3.644507, 2, -6.009146, 1, 1.5, 0.5, 0.5,
-3.644507, 2, -6.009146, 0, 1.5, 0.5, 0.5,
-3.644507, 3, -6.009146, 0, -0.5, 0.5, 0.5,
-3.644507, 3, -6.009146, 1, -0.5, 0.5, 0.5,
-3.644507, 3, -6.009146, 1, 1.5, 0.5, 0.5,
-3.644507, 3, -6.009146, 0, 1.5, 0.5, 0.5
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
-3.146742, -3.151651, -4,
-3.146742, -3.151651, 4,
-3.146742, -3.151651, -4,
-3.312664, -3.310225, -4,
-3.146742, -3.151651, -2,
-3.312664, -3.310225, -2,
-3.146742, -3.151651, 0,
-3.312664, -3.310225, 0,
-3.146742, -3.151651, 2,
-3.312664, -3.310225, 2,
-3.146742, -3.151651, 4,
-3.312664, -3.310225, 4
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
-3.644507, -3.627372, -4, 0, -0.5, 0.5, 0.5,
-3.644507, -3.627372, -4, 1, -0.5, 0.5, 0.5,
-3.644507, -3.627372, -4, 1, 1.5, 0.5, 0.5,
-3.644507, -3.627372, -4, 0, 1.5, 0.5, 0.5,
-3.644507, -3.627372, -2, 0, -0.5, 0.5, 0.5,
-3.644507, -3.627372, -2, 1, -0.5, 0.5, 0.5,
-3.644507, -3.627372, -2, 1, 1.5, 0.5, 0.5,
-3.644507, -3.627372, -2, 0, 1.5, 0.5, 0.5,
-3.644507, -3.627372, 0, 0, -0.5, 0.5, 0.5,
-3.644507, -3.627372, 0, 1, -0.5, 0.5, 0.5,
-3.644507, -3.627372, 0, 1, 1.5, 0.5, 0.5,
-3.644507, -3.627372, 0, 0, 1.5, 0.5, 0.5,
-3.644507, -3.627372, 2, 0, -0.5, 0.5, 0.5,
-3.644507, -3.627372, 2, 1, -0.5, 0.5, 0.5,
-3.644507, -3.627372, 2, 1, 1.5, 0.5, 0.5,
-3.644507, -3.627372, 2, 0, 1.5, 0.5, 0.5,
-3.644507, -3.627372, 4, 0, -0.5, 0.5, 0.5,
-3.644507, -3.627372, 4, 1, -0.5, 0.5, 0.5,
-3.644507, -3.627372, 4, 1, 1.5, 0.5, 0.5,
-3.644507, -3.627372, 4, 0, 1.5, 0.5, 0.5
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
-3.146742, -3.151651, -5.213958,
-3.146742, 3.19129, -5.213958,
-3.146742, -3.151651, 5.388539,
-3.146742, 3.19129, 5.388539,
-3.146742, -3.151651, -5.213958,
-3.146742, -3.151651, 5.388539,
-3.146742, 3.19129, -5.213958,
-3.146742, 3.19129, 5.388539,
-3.146742, -3.151651, -5.213958,
3.490119, -3.151651, -5.213958,
-3.146742, -3.151651, 5.388539,
3.490119, -3.151651, 5.388539,
-3.146742, 3.19129, -5.213958,
3.490119, 3.19129, -5.213958,
-3.146742, 3.19129, 5.388539,
3.490119, 3.19129, 5.388539,
3.490119, -3.151651, -5.213958,
3.490119, 3.19129, -5.213958,
3.490119, -3.151651, 5.388539,
3.490119, 3.19129, 5.388539,
3.490119, -3.151651, -5.213958,
3.490119, -3.151651, 5.388539,
3.490119, 3.19129, -5.213958,
3.490119, 3.19129, 5.388539
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
var radius = 7.488948;
var distance = 33.31918;
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
mvMatrix.translate( -0.1716883, -0.01981938, -0.08729053 );
mvMatrix.scale( 1.220034, 1.276568, 0.7637065 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.31918);
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
Pencycuron<-read.table("Pencycuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pencycuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pencycuron' not found
```

```r
y<-Pencycuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pencycuron' not found
```

```r
z<-Pencycuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pencycuron' not found
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
-3.050089, 0.5533895, -1.646496, 0, 0, 1, 1, 1,
-2.900787, 0.7699273, -1.338585, 1, 0, 0, 1, 1,
-2.594626, -0.3656465, -2.071591, 1, 0, 0, 1, 1,
-2.365211, 2.351135, -2.315861, 1, 0, 0, 1, 1,
-2.317865, 0.5956586, -0.5342709, 1, 0, 0, 1, 1,
-2.286595, -1.608794, -2.358625, 1, 0, 0, 1, 1,
-2.272179, -0.589281, -3.616343, 0, 0, 0, 1, 1,
-2.249074, -0.2115448, -2.929831, 0, 0, 0, 1, 1,
-2.242397, -1.252445, -1.104355, 0, 0, 0, 1, 1,
-2.141077, -0.1216377, -1.561805, 0, 0, 0, 1, 1,
-2.135058, -0.2682144, -4.104221, 0, 0, 0, 1, 1,
-2.092853, 1.18769, -1.121528, 0, 0, 0, 1, 1,
-2.084418, 2.250466, -0.03686807, 0, 0, 0, 1, 1,
-2.074725, -0.1957802, -3.544538, 1, 1, 1, 1, 1,
-2.043823, 0.05029094, 0.867228, 1, 1, 1, 1, 1,
-2.036275, 0.1296156, -1.203564, 1, 1, 1, 1, 1,
-2.03573, 1.532033, 0.6184493, 1, 1, 1, 1, 1,
-2.022788, 0.3139936, -0.3432799, 1, 1, 1, 1, 1,
-1.999021, -0.8328342, -1.976439, 1, 1, 1, 1, 1,
-1.998432, -0.2855319, -2.128183, 1, 1, 1, 1, 1,
-1.964974, 1.427549, -0.4121301, 1, 1, 1, 1, 1,
-1.926696, 0.7045828, 0.1740302, 1, 1, 1, 1, 1,
-1.923839, -0.4629216, -3.072209, 1, 1, 1, 1, 1,
-1.883957, -1.253732, -2.656872, 1, 1, 1, 1, 1,
-1.879577, 1.151539, -1.318228, 1, 1, 1, 1, 1,
-1.87857, -1.147405, -3.263674, 1, 1, 1, 1, 1,
-1.861431, -0.2215036, -2.27387, 1, 1, 1, 1, 1,
-1.857718, 0.5689753, 0.4832818, 1, 1, 1, 1, 1,
-1.854937, -0.2167112, -0.422121, 0, 0, 1, 1, 1,
-1.842916, 2.071532, -1.368231, 1, 0, 0, 1, 1,
-1.833269, -0.5296597, -2.116176, 1, 0, 0, 1, 1,
-1.829696, -0.696993, -2.315119, 1, 0, 0, 1, 1,
-1.820676, -0.782003, -0.595939, 1, 0, 0, 1, 1,
-1.80987, -0.4955741, -1.802405, 1, 0, 0, 1, 1,
-1.802518, -1.157286, -3.652835, 0, 0, 0, 1, 1,
-1.784975, -1.348614, -3.303485, 0, 0, 0, 1, 1,
-1.778006, -0.4603582, -1.991894, 0, 0, 0, 1, 1,
-1.771029, 0.4222679, 0.01846799, 0, 0, 0, 1, 1,
-1.768836, 0.9537882, 1.347267, 0, 0, 0, 1, 1,
-1.766314, 1.119414, -2.551343, 0, 0, 0, 1, 1,
-1.739155, 1.620747, -2.037851, 0, 0, 0, 1, 1,
-1.735672, -0.7378153, -0.2482935, 1, 1, 1, 1, 1,
-1.731977, -0.2955007, -1.807395, 1, 1, 1, 1, 1,
-1.726071, -0.5094594, -1.914855, 1, 1, 1, 1, 1,
-1.707356, -0.7081948, -3.144839, 1, 1, 1, 1, 1,
-1.697029, 0.1179866, -0.5438947, 1, 1, 1, 1, 1,
-1.688415, 0.05977907, -1.496306, 1, 1, 1, 1, 1,
-1.678757, 1.229577, -1.319358, 1, 1, 1, 1, 1,
-1.673072, -0.7727178, -1.552604, 1, 1, 1, 1, 1,
-1.638993, -0.3936602, -1.762558, 1, 1, 1, 1, 1,
-1.630728, 0.5519392, 0.2398056, 1, 1, 1, 1, 1,
-1.630427, -0.9026746, -1.515066, 1, 1, 1, 1, 1,
-1.612468, 0.1525379, -0.5642768, 1, 1, 1, 1, 1,
-1.606688, -0.958142, -2.087696, 1, 1, 1, 1, 1,
-1.582247, 0.04707662, -1.342412, 1, 1, 1, 1, 1,
-1.576923, -0.8699193, -1.654577, 1, 1, 1, 1, 1,
-1.574278, -0.5036246, 0.7005746, 0, 0, 1, 1, 1,
-1.571717, 0.4207348, -1.141281, 1, 0, 0, 1, 1,
-1.570467, -0.2215066, -2.515218, 1, 0, 0, 1, 1,
-1.565763, -0.9399922, -1.320709, 1, 0, 0, 1, 1,
-1.547831, 1.387102, -1.035767, 1, 0, 0, 1, 1,
-1.546896, 0.3218374, -3.125009, 1, 0, 0, 1, 1,
-1.542488, 0.8524646, -1.710914, 0, 0, 0, 1, 1,
-1.539472, 0.7610925, 0.5129033, 0, 0, 0, 1, 1,
-1.538209, 1.464593, -2.221493, 0, 0, 0, 1, 1,
-1.519006, 1.26259, -1.531015, 0, 0, 0, 1, 1,
-1.504835, 0.2159357, -1.743236, 0, 0, 0, 1, 1,
-1.493158, 0.3531133, -0.9647833, 0, 0, 0, 1, 1,
-1.488516, 0.6417396, -1.172814, 0, 0, 0, 1, 1,
-1.488402, -0.06576317, -1.069115, 1, 1, 1, 1, 1,
-1.475122, -0.6220189, -2.187356, 1, 1, 1, 1, 1,
-1.464137, 0.1525675, -1.383477, 1, 1, 1, 1, 1,
-1.46332, 0.3922986, -1.332951, 1, 1, 1, 1, 1,
-1.45899, 0.2747144, -0.03366425, 1, 1, 1, 1, 1,
-1.450586, 1.285528, -2.10449, 1, 1, 1, 1, 1,
-1.447723, 0.2050988, -1.306822, 1, 1, 1, 1, 1,
-1.439263, -0.4466562, -1.00783, 1, 1, 1, 1, 1,
-1.425886, 0.4046732, -1.169077, 1, 1, 1, 1, 1,
-1.414003, 2.142668, -1.666712, 1, 1, 1, 1, 1,
-1.412402, -0.288363, -3.094028, 1, 1, 1, 1, 1,
-1.409464, 0.2468029, -0.3407817, 1, 1, 1, 1, 1,
-1.408002, -0.6450861, -1.447201, 1, 1, 1, 1, 1,
-1.385564, -0.695565, -1.691638, 1, 1, 1, 1, 1,
-1.385508, 1.332877, -0.540773, 1, 1, 1, 1, 1,
-1.38341, -0.5566707, -1.445507, 0, 0, 1, 1, 1,
-1.381397, -0.4616626, -2.611895, 1, 0, 0, 1, 1,
-1.381201, 1.353228, -0.903169, 1, 0, 0, 1, 1,
-1.381, -1.258621, -2.694632, 1, 0, 0, 1, 1,
-1.377229, -0.5491477, -2.26594, 1, 0, 0, 1, 1,
-1.365411, 1.23348, -0.1584579, 1, 0, 0, 1, 1,
-1.363351, -0.6942394, -3.150682, 0, 0, 0, 1, 1,
-1.354296, 0.4270794, -1.068902, 0, 0, 0, 1, 1,
-1.351675, -0.913058, -2.899316, 0, 0, 0, 1, 1,
-1.348286, 0.0792671, -0.6981706, 0, 0, 0, 1, 1,
-1.342881, 1.074203, -1.427509, 0, 0, 0, 1, 1,
-1.341155, -0.2052345, -1.563343, 0, 0, 0, 1, 1,
-1.34065, -0.9368201, -1.206398, 0, 0, 0, 1, 1,
-1.338758, 0.8412248, -0.9230709, 1, 1, 1, 1, 1,
-1.332453, -0.5907765, -0.3346435, 1, 1, 1, 1, 1,
-1.313203, -0.5021747, -1.465105, 1, 1, 1, 1, 1,
-1.31228, 1.79469, -0.6687249, 1, 1, 1, 1, 1,
-1.307942, -0.008099372, -0.756759, 1, 1, 1, 1, 1,
-1.286105, -0.6431129, -2.657899, 1, 1, 1, 1, 1,
-1.274176, 0.353037, -0.5112203, 1, 1, 1, 1, 1,
-1.26926, -0.9727697, -0.7778716, 1, 1, 1, 1, 1,
-1.264677, -0.1361782, -1.801903, 1, 1, 1, 1, 1,
-1.255483, -0.1310956, -1.046662, 1, 1, 1, 1, 1,
-1.249035, 0.7938201, 0.9763604, 1, 1, 1, 1, 1,
-1.24166, 0.6553807, -1.12874, 1, 1, 1, 1, 1,
-1.234396, -2.221351, -1.060794, 1, 1, 1, 1, 1,
-1.23101, 1.65773, -1.963549, 1, 1, 1, 1, 1,
-1.227314, -2.522781, -2.822317, 1, 1, 1, 1, 1,
-1.226701, 1.08532, -0.06173246, 0, 0, 1, 1, 1,
-1.221238, 1.28018, -0.1541189, 1, 0, 0, 1, 1,
-1.220333, 0.2003976, -2.031849, 1, 0, 0, 1, 1,
-1.218732, 1.190642, -0.7653577, 1, 0, 0, 1, 1,
-1.218677, 0.3932576, -1.135536, 1, 0, 0, 1, 1,
-1.214142, -0.3385459, -2.086145, 1, 0, 0, 1, 1,
-1.200427, 1.695184, -0.1349269, 0, 0, 0, 1, 1,
-1.198377, 1.979009, 0.5937969, 0, 0, 0, 1, 1,
-1.196188, -0.184676, -1.970129, 0, 0, 0, 1, 1,
-1.194602, 0.1161429, -2.104259, 0, 0, 0, 1, 1,
-1.193482, 0.08815716, -1.235554, 0, 0, 0, 1, 1,
-1.191881, -0.7604235, -2.104986, 0, 0, 0, 1, 1,
-1.191128, -1.318455, -2.548795, 0, 0, 0, 1, 1,
-1.189197, -0.3739543, -3.475218, 1, 1, 1, 1, 1,
-1.184361, 0.5447878, -0.4481871, 1, 1, 1, 1, 1,
-1.183593, 0.9118941, -0.449781, 1, 1, 1, 1, 1,
-1.178817, -0.2896014, -1.842831, 1, 1, 1, 1, 1,
-1.173537, 0.1746211, -1.963419, 1, 1, 1, 1, 1,
-1.173513, -0.06515575, -1.09851, 1, 1, 1, 1, 1,
-1.172984, -2.059356, -3.92462, 1, 1, 1, 1, 1,
-1.158859, -0.2015072, -3.03074, 1, 1, 1, 1, 1,
-1.156122, 0.1914794, -0.02262273, 1, 1, 1, 1, 1,
-1.150617, 0.4093332, -2.680855, 1, 1, 1, 1, 1,
-1.150453, -0.2266513, -2.598049, 1, 1, 1, 1, 1,
-1.141755, -0.04339526, -2.705884, 1, 1, 1, 1, 1,
-1.141165, -0.1447872, -2.335894, 1, 1, 1, 1, 1,
-1.118639, 0.9005669, -0.3056151, 1, 1, 1, 1, 1,
-1.117402, 1.417364, -0.2404677, 1, 1, 1, 1, 1,
-1.115125, 2.112381, -0.5196234, 0, 0, 1, 1, 1,
-1.113032, -0.2986154, -2.608359, 1, 0, 0, 1, 1,
-1.110409, -1.577782, -3.803078, 1, 0, 0, 1, 1,
-1.110369, 0.4740921, 0.2554388, 1, 0, 0, 1, 1,
-1.107728, -0.8862404, -3.003125, 1, 0, 0, 1, 1,
-1.107249, 0.08498668, -2.040496, 1, 0, 0, 1, 1,
-1.094091, -1.855169, -2.263327, 0, 0, 0, 1, 1,
-1.088531, -0.3851414, -2.72086, 0, 0, 0, 1, 1,
-1.088335, -0.09857374, -2.407254, 0, 0, 0, 1, 1,
-1.080953, -0.04340618, -1.79736, 0, 0, 0, 1, 1,
-1.080371, -0.6812773, -1.960042, 0, 0, 0, 1, 1,
-1.080098, -0.1898148, -2.511214, 0, 0, 0, 1, 1,
-1.070393, 2.748668, 0.7676609, 0, 0, 0, 1, 1,
-1.060732, 0.6507596, 1.055818, 1, 1, 1, 1, 1,
-1.059111, 1.041597, -1.242227, 1, 1, 1, 1, 1,
-1.053253, -0.5591499, -2.01037, 1, 1, 1, 1, 1,
-1.053251, -0.6354325, -2.862899, 1, 1, 1, 1, 1,
-1.050717, -1.127735, -1.982852, 1, 1, 1, 1, 1,
-1.049326, 0.8507161, 0.8860543, 1, 1, 1, 1, 1,
-1.048788, -0.1506981, -2.855552, 1, 1, 1, 1, 1,
-1.048225, -0.4649014, -2.589983, 1, 1, 1, 1, 1,
-1.046404, -0.5068858, -1.209564, 1, 1, 1, 1, 1,
-1.040504, -0.2810109, -0.5257144, 1, 1, 1, 1, 1,
-1.039301, -0.1897617, -0.6726913, 1, 1, 1, 1, 1,
-1.039059, 0.5878311, -0.2533832, 1, 1, 1, 1, 1,
-1.038752, -1.217737, -3.491735, 1, 1, 1, 1, 1,
-1.038494, 0.6371558, -1.499242, 1, 1, 1, 1, 1,
-1.036634, -2.21677, -2.112039, 1, 1, 1, 1, 1,
-1.029194, -0.8934367, -2.066015, 0, 0, 1, 1, 1,
-1.028937, -1.365602, -2.016279, 1, 0, 0, 1, 1,
-1.022055, 1.830198, -0.1504129, 1, 0, 0, 1, 1,
-1.010797, -0.1848734, -2.947512, 1, 0, 0, 1, 1,
-1.001388, 1.518794, 0.03237317, 1, 0, 0, 1, 1,
-1.000992, 0.3064125, -1.003943, 1, 0, 0, 1, 1,
-0.9932284, -0.2621805, -2.653719, 0, 0, 0, 1, 1,
-0.9900359, -0.6594337, -4.202699, 0, 0, 0, 1, 1,
-0.9869461, -0.3755004, -2.600695, 0, 0, 0, 1, 1,
-0.9864408, -0.03768728, -2.578636, 0, 0, 0, 1, 1,
-0.9858063, 1.163539, 0.3686199, 0, 0, 0, 1, 1,
-0.9857865, 0.5892349, 0.847117, 0, 0, 0, 1, 1,
-0.9857202, -0.06918774, -1.867007, 0, 0, 0, 1, 1,
-0.9853425, 0.8145021, -1.974053, 1, 1, 1, 1, 1,
-0.982655, 0.5138852, -2.670111, 1, 1, 1, 1, 1,
-0.969537, -0.2319811, -2.515333, 1, 1, 1, 1, 1,
-0.9667389, 0.9622464, 0.01831128, 1, 1, 1, 1, 1,
-0.961477, -0.768967, -2.593691, 1, 1, 1, 1, 1,
-0.9413183, -1.777657, -1.482301, 1, 1, 1, 1, 1,
-0.9396647, 0.09646949, -0.0984328, 1, 1, 1, 1, 1,
-0.9361398, -0.4210323, -1.507671, 1, 1, 1, 1, 1,
-0.9348321, 1.034937, -0.9072377, 1, 1, 1, 1, 1,
-0.9342256, 0.1244541, -0.719681, 1, 1, 1, 1, 1,
-0.9321041, -0.2223888, -1.43628, 1, 1, 1, 1, 1,
-0.9308223, -0.4932575, -0.904983, 1, 1, 1, 1, 1,
-0.9270098, -0.6817359, -2.249765, 1, 1, 1, 1, 1,
-0.9263331, -0.7010154, -0.664588, 1, 1, 1, 1, 1,
-0.9208307, 0.4159132, -3.239244, 1, 1, 1, 1, 1,
-0.9195442, 1.157181, -1.684831, 0, 0, 1, 1, 1,
-0.9120672, 0.4384341, -0.9289346, 1, 0, 0, 1, 1,
-0.9033327, 0.1256811, -1.849459, 1, 0, 0, 1, 1,
-0.9018549, -0.08671024, -3.094368, 1, 0, 0, 1, 1,
-0.901679, -0.1829812, 0.387128, 1, 0, 0, 1, 1,
-0.9003197, -0.3889186, -3.34222, 1, 0, 0, 1, 1,
-0.8936496, 0.007894225, -1.297083, 0, 0, 0, 1, 1,
-0.8892826, 1.336218, -1.192452, 0, 0, 0, 1, 1,
-0.8860294, -1.192287, -1.618668, 0, 0, 0, 1, 1,
-0.8741797, -0.5144888, -1.1484, 0, 0, 0, 1, 1,
-0.8738827, -0.01111712, -1.021177, 0, 0, 0, 1, 1,
-0.8697929, 1.029896, -0.1367476, 0, 0, 0, 1, 1,
-0.8683549, 0.2704434, -2.490127, 0, 0, 0, 1, 1,
-0.8628603, -0.741765, -3.230955, 1, 1, 1, 1, 1,
-0.8627068, 1.46148, -1.920214, 1, 1, 1, 1, 1,
-0.8616882, 0.5998705, -0.4846494, 1, 1, 1, 1, 1,
-0.8602435, 0.1696374, -0.3819264, 1, 1, 1, 1, 1,
-0.859016, 0.5313076, -0.5666299, 1, 1, 1, 1, 1,
-0.8586, -1.389806, -2.825786, 1, 1, 1, 1, 1,
-0.84661, -0.2687078, -2.128006, 1, 1, 1, 1, 1,
-0.8444534, -0.04577648, -1.354887, 1, 1, 1, 1, 1,
-0.8414917, 0.5444292, -0.9177738, 1, 1, 1, 1, 1,
-0.8389906, 0.2696078, -2.966784, 1, 1, 1, 1, 1,
-0.834363, -0.04593704, -3.955424, 1, 1, 1, 1, 1,
-0.8336014, 0.09243529, -1.949595, 1, 1, 1, 1, 1,
-0.8286235, -0.1122022, -1.431862, 1, 1, 1, 1, 1,
-0.828167, 0.2091857, -2.198676, 1, 1, 1, 1, 1,
-0.8235227, -0.6487138, -1.94224, 1, 1, 1, 1, 1,
-0.8210346, -1.150581, -2.862442, 0, 0, 1, 1, 1,
-0.8199202, 0.337658, -0.9520171, 1, 0, 0, 1, 1,
-0.813382, -0.003196853, -1.747842, 1, 0, 0, 1, 1,
-0.8114741, 1.154491, -0.5723001, 1, 0, 0, 1, 1,
-0.8055626, -0.1163277, -0.004127094, 1, 0, 0, 1, 1,
-0.7997919, -0.04727519, -0.2791794, 1, 0, 0, 1, 1,
-0.7969518, 0.3194511, -0.7800874, 0, 0, 0, 1, 1,
-0.7907362, -2.023446, -3.063998, 0, 0, 0, 1, 1,
-0.790598, 0.9336402, -1.985561, 0, 0, 0, 1, 1,
-0.7888114, 1.168643, -1.656399, 0, 0, 0, 1, 1,
-0.7879044, 0.229623, -2.670628, 0, 0, 0, 1, 1,
-0.7838542, -0.2200844, -2.698024, 0, 0, 0, 1, 1,
-0.779727, -0.02197304, -2.594063, 0, 0, 0, 1, 1,
-0.7764493, -2.372826, -4.639796, 1, 1, 1, 1, 1,
-0.7665148, 0.7928593, -0.2791457, 1, 1, 1, 1, 1,
-0.7650828, 0.09311001, -3.094831, 1, 1, 1, 1, 1,
-0.764922, -2.064616, -2.920171, 1, 1, 1, 1, 1,
-0.7619256, 0.7497162, -1.77916, 1, 1, 1, 1, 1,
-0.7613574, -0.5136908, -3.166791, 1, 1, 1, 1, 1,
-0.7609321, -0.08166179, -1.994956, 1, 1, 1, 1, 1,
-0.7555177, 0.9648806, -1.709649, 1, 1, 1, 1, 1,
-0.7542459, -0.4031872, -2.835145, 1, 1, 1, 1, 1,
-0.7536696, -1.175561, -0.515, 1, 1, 1, 1, 1,
-0.7515084, -1.247304, -2.229049, 1, 1, 1, 1, 1,
-0.7502003, -0.1176101, -3.73359, 1, 1, 1, 1, 1,
-0.7492307, -0.1030493, -0.4213217, 1, 1, 1, 1, 1,
-0.7434815, 1.244278, -0.9918855, 1, 1, 1, 1, 1,
-0.7383318, -0.711542, -1.852715, 1, 1, 1, 1, 1,
-0.7252149, 1.867137, 0.8693309, 0, 0, 1, 1, 1,
-0.7214125, -1.355932, -1.734813, 1, 0, 0, 1, 1,
-0.721198, -2.222953, -3.886101, 1, 0, 0, 1, 1,
-0.7166013, 3.098917, -0.6527649, 1, 0, 0, 1, 1,
-0.714285, -2.377372, -3.399826, 1, 0, 0, 1, 1,
-0.7104525, 0.5827593, -1.913317, 1, 0, 0, 1, 1,
-0.70967, 0.03761606, -1.367043, 0, 0, 0, 1, 1,
-0.7095189, -2.07249, -0.3398957, 0, 0, 0, 1, 1,
-0.7091247, -1.858418, -3.145812, 0, 0, 0, 1, 1,
-0.708725, -0.211076, -3.015812, 0, 0, 0, 1, 1,
-0.7052746, 1.251602, -0.00792997, 0, 0, 0, 1, 1,
-0.7012169, -0.006399991, -0.5343329, 0, 0, 0, 1, 1,
-0.6964829, 0.9265563, 1.083645, 0, 0, 0, 1, 1,
-0.6934131, -0.3502705, -0.7753382, 1, 1, 1, 1, 1,
-0.6931086, 1.071263, -0.612423, 1, 1, 1, 1, 1,
-0.6881468, 0.7300484, 0.4052206, 1, 1, 1, 1, 1,
-0.6872039, 0.5116886, -1.015199, 1, 1, 1, 1, 1,
-0.6795436, -0.3715157, -1.400584, 1, 1, 1, 1, 1,
-0.6715037, 0.8888936, 1.222551, 1, 1, 1, 1, 1,
-0.6708352, 0.1998419, -1.160696, 1, 1, 1, 1, 1,
-0.66598, -0.8626466, -3.274451, 1, 1, 1, 1, 1,
-0.6589094, 0.5545259, -0.8273205, 1, 1, 1, 1, 1,
-0.6584525, -0.6700162, -2.422261, 1, 1, 1, 1, 1,
-0.6574105, -0.07038875, -2.737096, 1, 1, 1, 1, 1,
-0.653029, 2.087491, -0.4644837, 1, 1, 1, 1, 1,
-0.6412936, -0.3360613, -1.373313, 1, 1, 1, 1, 1,
-0.6370018, 0.1703121, -1.116346, 1, 1, 1, 1, 1,
-0.6340092, 0.1380205, -1.486787, 1, 1, 1, 1, 1,
-0.6321797, 0.8762755, 1.166749, 0, 0, 1, 1, 1,
-0.6274444, 0.3991129, -1.013071, 1, 0, 0, 1, 1,
-0.6240259, 0.7842627, 1.154244, 1, 0, 0, 1, 1,
-0.6237921, 0.4762995, -1.385596, 1, 0, 0, 1, 1,
-0.6235079, -1.435811, -4.013733, 1, 0, 0, 1, 1,
-0.6229554, 1.138253, -0.5914288, 1, 0, 0, 1, 1,
-0.6228752, 0.2115643, -1.030982, 0, 0, 0, 1, 1,
-0.6225386, 0.2413857, 0.04050274, 0, 0, 0, 1, 1,
-0.6216652, -1.173672, -2.938109, 0, 0, 0, 1, 1,
-0.620049, -2.351368, -4.168576, 0, 0, 0, 1, 1,
-0.6182871, 0.6808481, -1.390972, 0, 0, 0, 1, 1,
-0.6058618, -0.2039871, -3.320022, 0, 0, 0, 1, 1,
-0.6054285, -0.6622779, -3.318012, 0, 0, 0, 1, 1,
-0.6023608, -1.127372, -3.694453, 1, 1, 1, 1, 1,
-0.6005603, 0.746028, -1.191504, 1, 1, 1, 1, 1,
-0.5997029, -0.4777196, -2.01347, 1, 1, 1, 1, 1,
-0.5980384, -0.1192611, -0.910571, 1, 1, 1, 1, 1,
-0.5969422, -1.033217, -2.677208, 1, 1, 1, 1, 1,
-0.5960078, 1.054114, -1.634653, 1, 1, 1, 1, 1,
-0.594919, -0.2258406, -1.735004, 1, 1, 1, 1, 1,
-0.5932912, -0.9638387, -0.9726227, 1, 1, 1, 1, 1,
-0.5909058, -1.405523, -1.743281, 1, 1, 1, 1, 1,
-0.5875761, -0.6241502, -1.705633, 1, 1, 1, 1, 1,
-0.586927, -0.3664973, -2.229769, 1, 1, 1, 1, 1,
-0.5856502, -1.642562, -2.753582, 1, 1, 1, 1, 1,
-0.5823188, -0.1182169, -1.391345, 1, 1, 1, 1, 1,
-0.5797201, 0.1906033, -1.104824, 1, 1, 1, 1, 1,
-0.576811, -0.334418, -4.707634, 1, 1, 1, 1, 1,
-0.5724295, 0.02244919, -0.8507225, 0, 0, 1, 1, 1,
-0.5672538, 0.4221458, -1.551104, 1, 0, 0, 1, 1,
-0.5655844, 2.425408, 1.784858, 1, 0, 0, 1, 1,
-0.5625336, -0.9365087, -1.576591, 1, 0, 0, 1, 1,
-0.5613153, -1.722661, -2.370331, 1, 0, 0, 1, 1,
-0.559822, -1.584278, -2.022933, 1, 0, 0, 1, 1,
-0.5595813, -1.284273, -3.463512, 0, 0, 0, 1, 1,
-0.5578215, 0.5789461, -3.380435, 0, 0, 0, 1, 1,
-0.552376, 0.8134691, -0.1826584, 0, 0, 0, 1, 1,
-0.5517809, 0.1981276, -2.200328, 0, 0, 0, 1, 1,
-0.5513633, -0.298464, -0.7506094, 0, 0, 0, 1, 1,
-0.5502343, -2.15722, -2.725646, 0, 0, 0, 1, 1,
-0.5469359, 0.06656056, 1.590829, 0, 0, 0, 1, 1,
-0.5429927, 0.6777657, -2.10226, 1, 1, 1, 1, 1,
-0.5367431, -1.098395, -2.397246, 1, 1, 1, 1, 1,
-0.5301243, -0.7303538, -3.18129, 1, 1, 1, 1, 1,
-0.5291067, 0.4580821, -0.7213042, 1, 1, 1, 1, 1,
-0.5278364, -1.82863, -3.210282, 1, 1, 1, 1, 1,
-0.5278101, -0.2286447, -1.749362, 1, 1, 1, 1, 1,
-0.5228541, -2.191134, -3.297031, 1, 1, 1, 1, 1,
-0.5215354, -0.3187126, -3.288398, 1, 1, 1, 1, 1,
-0.5147297, -0.4315184, -0.7284939, 1, 1, 1, 1, 1,
-0.5117471, 0.6454555, 0.3401573, 1, 1, 1, 1, 1,
-0.5113197, -0.7116779, -0.9162067, 1, 1, 1, 1, 1,
-0.500768, 2.052427, -1.496191, 1, 1, 1, 1, 1,
-0.500186, -0.1979524, -0.7464145, 1, 1, 1, 1, 1,
-0.4975421, -0.2305683, -2.66915, 1, 1, 1, 1, 1,
-0.496363, 0.2284761, -1.465294, 1, 1, 1, 1, 1,
-0.4948701, 0.9397789, -0.2779244, 0, 0, 1, 1, 1,
-0.4882626, -0.06902698, -2.490131, 1, 0, 0, 1, 1,
-0.4865321, 0.07493114, 0.01746632, 1, 0, 0, 1, 1,
-0.4861568, -0.8392666, -0.5796817, 1, 0, 0, 1, 1,
-0.4788128, 1.482567, 0.4634218, 1, 0, 0, 1, 1,
-0.4782791, -0.3949237, -2.356225, 1, 0, 0, 1, 1,
-0.4756783, 0.498122, -0.3677337, 0, 0, 0, 1, 1,
-0.472932, -0.7922142, -3.412093, 0, 0, 0, 1, 1,
-0.4696384, 1.374104, 0.3758543, 0, 0, 0, 1, 1,
-0.4663641, 1.033354, -0.1502524, 0, 0, 0, 1, 1,
-0.4613024, 0.5424625, -0.1425541, 0, 0, 0, 1, 1,
-0.451019, -0.1376493, -3.331055, 0, 0, 0, 1, 1,
-0.448522, 0.4201226, -1.046179, 0, 0, 0, 1, 1,
-0.4476691, 1.405728, 0.4106343, 1, 1, 1, 1, 1,
-0.4392521, 0.2121686, -2.444366, 1, 1, 1, 1, 1,
-0.4374362, 2.243617, -0.3720102, 1, 1, 1, 1, 1,
-0.4359684, -2.027138, -1.73793, 1, 1, 1, 1, 1,
-0.4358865, 0.2252291, -2.248439, 1, 1, 1, 1, 1,
-0.4318402, 0.3774906, -1.848285, 1, 1, 1, 1, 1,
-0.4273472, -0.3456361, -1.927414, 1, 1, 1, 1, 1,
-0.4225286, -0.459528, -1.826492, 1, 1, 1, 1, 1,
-0.4170481, 0.7422787, -1.373714, 1, 1, 1, 1, 1,
-0.4099409, 0.8792765, 1.29896, 1, 1, 1, 1, 1,
-0.4072177, -2.279046, -3.81069, 1, 1, 1, 1, 1,
-0.4055148, -0.3586363, -3.273684, 1, 1, 1, 1, 1,
-0.4044558, -2.214176, -5.059553, 1, 1, 1, 1, 1,
-0.4043376, 1.900594, -1.605729, 1, 1, 1, 1, 1,
-0.4018925, 1.024482, -2.529171, 1, 1, 1, 1, 1,
-0.3918119, -0.2607656, -3.369608, 0, 0, 1, 1, 1,
-0.3902024, -0.2213011, -2.335971, 1, 0, 0, 1, 1,
-0.3900525, 0.3721907, -0.736248, 1, 0, 0, 1, 1,
-0.3843067, -0.2963985, -2.283303, 1, 0, 0, 1, 1,
-0.3763641, 2.155105, -0.9098898, 1, 0, 0, 1, 1,
-0.3750134, 0.5977163, 0.4809804, 1, 0, 0, 1, 1,
-0.374314, -0.7561359, -3.328252, 0, 0, 0, 1, 1,
-0.3663912, 1.397703, 0.6756805, 0, 0, 0, 1, 1,
-0.3653073, 0.04039834, -2.146032, 0, 0, 0, 1, 1,
-0.3517024, -1.29244, -3.834691, 0, 0, 0, 1, 1,
-0.3480723, 0.9172187, 0.5817687, 0, 0, 0, 1, 1,
-0.3454552, 2.044313, -0.2541412, 0, 0, 0, 1, 1,
-0.3445526, -0.7580376, -3.381181, 0, 0, 0, 1, 1,
-0.3402486, -0.9049699, -2.197867, 1, 1, 1, 1, 1,
-0.3389662, -0.7814984, -2.527733, 1, 1, 1, 1, 1,
-0.3364807, -0.158931, -0.09735417, 1, 1, 1, 1, 1,
-0.3293957, 1.392585, 0.2732534, 1, 1, 1, 1, 1,
-0.3279484, -0.932023, -3.528544, 1, 1, 1, 1, 1,
-0.3251186, -0.1091194, -2.797394, 1, 1, 1, 1, 1,
-0.3185143, -0.7779657, -2.310941, 1, 1, 1, 1, 1,
-0.3157995, 1.20625, 0.4604997, 1, 1, 1, 1, 1,
-0.3152554, -0.7565558, -4.278491, 1, 1, 1, 1, 1,
-0.3145539, 0.2136671, -1.951751, 1, 1, 1, 1, 1,
-0.3143484, 1.383732, -1.005762, 1, 1, 1, 1, 1,
-0.3130206, -1.440811, -2.082376, 1, 1, 1, 1, 1,
-0.3095057, 0.00464278, -2.736112, 1, 1, 1, 1, 1,
-0.3034812, 2.193268, -1.488922, 1, 1, 1, 1, 1,
-0.3009824, 0.3683171, -0.4263265, 1, 1, 1, 1, 1,
-0.2999974, 1.044118, -0.8241693, 0, 0, 1, 1, 1,
-0.2989745, 1.197686, -0.9121225, 1, 0, 0, 1, 1,
-0.296249, -0.2835104, -3.241312, 1, 0, 0, 1, 1,
-0.2929328, 0.7153113, 0.1800255, 1, 0, 0, 1, 1,
-0.2852871, -1.548965, -2.413053, 1, 0, 0, 1, 1,
-0.2838115, 1.248412, -0.2589036, 1, 0, 0, 1, 1,
-0.2836519, -0.7063685, -1.955946, 0, 0, 0, 1, 1,
-0.2810833, 1.469723, 1.341361, 0, 0, 0, 1, 1,
-0.2801911, 0.5858983, -1.392487, 0, 0, 0, 1, 1,
-0.277517, 1.05668, 0.09717587, 0, 0, 0, 1, 1,
-0.2765239, -0.1425766, -0.7109473, 0, 0, 0, 1, 1,
-0.2746851, -0.5584049, -2.514957, 0, 0, 0, 1, 1,
-0.2708924, -0.514739, -2.854802, 0, 0, 0, 1, 1,
-0.2695715, 2.011977, 0.9948969, 1, 1, 1, 1, 1,
-0.2670107, 0.06357053, 0.1137612, 1, 1, 1, 1, 1,
-0.265704, -0.002326761, 0.891188, 1, 1, 1, 1, 1,
-0.2643073, -0.400745, -2.331398, 1, 1, 1, 1, 1,
-0.2639981, 0.7723275, 0.8635629, 1, 1, 1, 1, 1,
-0.2604212, -0.5376973, -4.985417, 1, 1, 1, 1, 1,
-0.2601714, -0.1234772, -1.193646, 1, 1, 1, 1, 1,
-0.2560516, -0.8476008, -3.90981, 1, 1, 1, 1, 1,
-0.2546312, -0.1412811, -2.828403, 1, 1, 1, 1, 1,
-0.2540583, 0.9986222, -1.212918, 1, 1, 1, 1, 1,
-0.2537949, 0.8276249, -0.4757257, 1, 1, 1, 1, 1,
-0.2514206, -1.987874, -2.569218, 1, 1, 1, 1, 1,
-0.2500342, 1.392552, -1.117005, 1, 1, 1, 1, 1,
-0.2489874, 1.33959, -1.643392, 1, 1, 1, 1, 1,
-0.2462169, 0.1272109, -2.189154, 1, 1, 1, 1, 1,
-0.2450183, -0.2264676, -3.187416, 0, 0, 1, 1, 1,
-0.2383938, -1.989289, -2.898054, 1, 0, 0, 1, 1,
-0.2383635, -1.034392, -2.747096, 1, 0, 0, 1, 1,
-0.2375798, 0.4256793, -0.3772222, 1, 0, 0, 1, 1,
-0.2373779, -2.002157, -2.575226, 1, 0, 0, 1, 1,
-0.236555, 0.5729091, 0.1063016, 1, 0, 0, 1, 1,
-0.2355727, -1.310111, -3.27872, 0, 0, 0, 1, 1,
-0.2307066, 0.5397662, 0.3085271, 0, 0, 0, 1, 1,
-0.2266096, 2.408321, -0.6766601, 0, 0, 0, 1, 1,
-0.2246652, -1.783759, -1.201025, 0, 0, 0, 1, 1,
-0.2242496, -0.1461048, -1.466239, 0, 0, 0, 1, 1,
-0.2237743, -0.2243412, -3.083159, 0, 0, 0, 1, 1,
-0.2230989, -1.180719, -2.279742, 0, 0, 0, 1, 1,
-0.2217862, 0.1753707, -1.008791, 1, 1, 1, 1, 1,
-0.2086318, 0.5431357, -2.105199, 1, 1, 1, 1, 1,
-0.2071081, 0.438142, 0.1480677, 1, 1, 1, 1, 1,
-0.199052, -1.002438, -3.006629, 1, 1, 1, 1, 1,
-0.1967006, 1.78404, -0.3158674, 1, 1, 1, 1, 1,
-0.1964222, -0.2791784, -2.533797, 1, 1, 1, 1, 1,
-0.1935473, -1.280242, -3.284834, 1, 1, 1, 1, 1,
-0.1918757, -1.443438, -3.972975, 1, 1, 1, 1, 1,
-0.1871582, -0.7345001, -4.115618, 1, 1, 1, 1, 1,
-0.1869676, 1.473515, 1.167811, 1, 1, 1, 1, 1,
-0.1828867, -0.5538116, -3.305832, 1, 1, 1, 1, 1,
-0.1821027, 2.64848, 1.38851, 1, 1, 1, 1, 1,
-0.1814848, -1.494299, -4.112066, 1, 1, 1, 1, 1,
-0.1809414, 0.1827606, -2.628067, 1, 1, 1, 1, 1,
-0.1694518, 0.8408077, 0.3506285, 1, 1, 1, 1, 1,
-0.1688416, -0.3034254, -2.161437, 0, 0, 1, 1, 1,
-0.1685578, 0.2267776, 0.2783987, 1, 0, 0, 1, 1,
-0.1666274, 0.827094, 2.111634, 1, 0, 0, 1, 1,
-0.1659724, 2.529993, 0.5883958, 1, 0, 0, 1, 1,
-0.1625823, 0.6640685, -1.120765, 1, 0, 0, 1, 1,
-0.1557031, 0.1155047, -0.6626878, 1, 0, 0, 1, 1,
-0.1506878, 0.9896818, 0.6635776, 0, 0, 0, 1, 1,
-0.1477425, -0.7061872, -1.804284, 0, 0, 0, 1, 1,
-0.1444027, -1.101376, -1.132712, 0, 0, 0, 1, 1,
-0.1428654, 1.285924, 1.797402, 0, 0, 0, 1, 1,
-0.1423721, 0.7397446, 0.3125611, 0, 0, 0, 1, 1,
-0.1375307, 1.101066, -0.2911581, 0, 0, 0, 1, 1,
-0.1366925, 1.297258, 0.1719828, 0, 0, 0, 1, 1,
-0.1363255, -0.6835403, -2.290165, 1, 1, 1, 1, 1,
-0.1355117, -0.3670639, -2.805496, 1, 1, 1, 1, 1,
-0.1350626, -1.412799, -3.114684, 1, 1, 1, 1, 1,
-0.1291882, 0.6008727, 0.6125308, 1, 1, 1, 1, 1,
-0.1189472, -0.590891, -3.271457, 1, 1, 1, 1, 1,
-0.1188291, -0.6345313, -1.805087, 1, 1, 1, 1, 1,
-0.1175483, 1.774562, 1.314968, 1, 1, 1, 1, 1,
-0.1169239, 0.1362747, -0.1115425, 1, 1, 1, 1, 1,
-0.1036988, -1.434027, -3.610622, 1, 1, 1, 1, 1,
-0.1035152, -0.7772225, -4.000013, 1, 1, 1, 1, 1,
-0.102364, 0.8907632, -0.6540112, 1, 1, 1, 1, 1,
-0.1004843, 0.1108621, -0.796154, 1, 1, 1, 1, 1,
-0.09926633, -1.589936, -2.830043, 1, 1, 1, 1, 1,
-0.09523233, -1.976365, -1.44616, 1, 1, 1, 1, 1,
-0.07864671, -0.3477474, -2.387173, 1, 1, 1, 1, 1,
-0.07820836, -0.117984, -3.116528, 0, 0, 1, 1, 1,
-0.07698671, -1.212358, -0.8609387, 1, 0, 0, 1, 1,
-0.07610247, 0.4558249, -0.1067857, 1, 0, 0, 1, 1,
-0.07569657, 0.7860772, -0.07617923, 1, 0, 0, 1, 1,
-0.07185053, 0.4589156, -1.493146, 1, 0, 0, 1, 1,
-0.07132797, 0.3288492, -1.651657, 1, 0, 0, 1, 1,
-0.0697775, 0.2306224, 0.5138031, 0, 0, 0, 1, 1,
-0.06822865, -0.7195322, -3.161591, 0, 0, 0, 1, 1,
-0.06395302, 0.7534488, 1.882451, 0, 0, 0, 1, 1,
-0.06389715, -0.5889521, -3.244335, 0, 0, 0, 1, 1,
-0.06306072, 0.1294915, -0.9574475, 0, 0, 0, 1, 1,
-0.06102625, 0.141357, -0.2679178, 0, 0, 0, 1, 1,
-0.05606636, -0.9400287, -2.076639, 0, 0, 0, 1, 1,
-0.0485506, -1.088086, -2.030458, 1, 1, 1, 1, 1,
-0.04692033, 0.06718876, -1.465927, 1, 1, 1, 1, 1,
-0.04505688, -0.8899657, -2.664844, 1, 1, 1, 1, 1,
-0.04078306, 0.7511602, 2.107846, 1, 1, 1, 1, 1,
-0.03584354, 0.5255818, -0.8413337, 1, 1, 1, 1, 1,
-0.03424957, 1.32482, 0.6941722, 1, 1, 1, 1, 1,
-0.02985796, 1.620144, -0.7288277, 1, 1, 1, 1, 1,
-0.02385106, -0.4446584, -1.871637, 1, 1, 1, 1, 1,
-0.02315636, 0.2071474, -0.3927672, 1, 1, 1, 1, 1,
-0.02042298, -0.8028017, -3.768107, 1, 1, 1, 1, 1,
-0.01739565, 0.2745252, -1.13364, 1, 1, 1, 1, 1,
-0.01220689, 1.305456, -2.555956, 1, 1, 1, 1, 1,
-0.007522887, -0.9406754, -3.53493, 1, 1, 1, 1, 1,
-0.007228843, -0.221683, -1.875235, 1, 1, 1, 1, 1,
-0.005611218, 0.7202424, -0.923466, 1, 1, 1, 1, 1,
-0.002676577, -1.246818, -3.322536, 0, 0, 1, 1, 1,
-0.0008774046, -0.05400477, -1.936138, 1, 0, 0, 1, 1,
0.002759368, 0.7517796, 0.1138121, 1, 0, 0, 1, 1,
0.007822827, 2.583302, -0.1034305, 1, 0, 0, 1, 1,
0.009801585, -1.79373, 3.868046, 1, 0, 0, 1, 1,
0.01283136, 0.2419469, -0.132376, 1, 0, 0, 1, 1,
0.01339311, 0.1252508, 1.328397, 0, 0, 0, 1, 1,
0.01382627, -0.6547694, 0.7615342, 0, 0, 0, 1, 1,
0.01384445, -0.1173821, 3.499129, 0, 0, 0, 1, 1,
0.01455359, 0.6243904, 0.1808046, 0, 0, 0, 1, 1,
0.01465982, 0.6672813, -1.954393, 0, 0, 0, 1, 1,
0.01756475, -1.84336, 4.368494, 0, 0, 0, 1, 1,
0.02256743, 0.3314251, 0.2540252, 0, 0, 0, 1, 1,
0.02697431, 2.009422, 0.3641188, 1, 1, 1, 1, 1,
0.02769115, -0.1740634, 5.01976, 1, 1, 1, 1, 1,
0.0283764, -0.1721011, 2.887084, 1, 1, 1, 1, 1,
0.03064453, -0.5159637, 4.004152, 1, 1, 1, 1, 1,
0.03064955, 0.1221633, -0.1508309, 1, 1, 1, 1, 1,
0.03758753, 0.4128052, 1.135047, 1, 1, 1, 1, 1,
0.04020355, 0.2564989, -0.2752095, 1, 1, 1, 1, 1,
0.04361287, -1.181686, 5.234134, 1, 1, 1, 1, 1,
0.04363339, 0.8071046, -0.05455304, 1, 1, 1, 1, 1,
0.04898323, -0.571166, 2.914528, 1, 1, 1, 1, 1,
0.05161398, 1.033473, -0.6638287, 1, 1, 1, 1, 1,
0.05367408, -0.245887, 4.464993, 1, 1, 1, 1, 1,
0.06387318, -1.619228, 3.399246, 1, 1, 1, 1, 1,
0.06565179, 0.2157384, 1.500026, 1, 1, 1, 1, 1,
0.06630836, 1.733461, -0.2380215, 1, 1, 1, 1, 1,
0.06848989, 1.350843, 0.3011417, 0, 0, 1, 1, 1,
0.06990051, -0.1554356, 3.061884, 1, 0, 0, 1, 1,
0.06998263, -0.7237347, 2.440303, 1, 0, 0, 1, 1,
0.07854333, 0.974921, -0.4591539, 1, 0, 0, 1, 1,
0.08150944, -1.080969, 1.590677, 1, 0, 0, 1, 1,
0.08162425, 0.09510472, 0.9438961, 1, 0, 0, 1, 1,
0.08215168, -1.119283, 4.165524, 0, 0, 0, 1, 1,
0.08433867, -1.905374, 0.6031044, 0, 0, 0, 1, 1,
0.08654443, 0.7918907, -1.740229, 0, 0, 0, 1, 1,
0.08709408, 0.5348037, -1.13484, 0, 0, 0, 1, 1,
0.08749136, -0.7362013, 2.420353, 0, 0, 0, 1, 1,
0.09266562, -0.9389138, 0.9141081, 0, 0, 0, 1, 1,
0.09572056, -0.2639378, 2.81193, 0, 0, 0, 1, 1,
0.09702169, -0.6904504, 2.640303, 1, 1, 1, 1, 1,
0.1019733, -0.6675771, 2.636179, 1, 1, 1, 1, 1,
0.1109815, 0.851318, 0.6244266, 1, 1, 1, 1, 1,
0.111336, 0.808664, 1.39385, 1, 1, 1, 1, 1,
0.1119739, -0.07226964, 1.21165, 1, 1, 1, 1, 1,
0.1126485, 1.160139, 1.15746, 1, 1, 1, 1, 1,
0.1179243, -0.2353436, 2.4006, 1, 1, 1, 1, 1,
0.1190076, 0.697383, -0.3227077, 1, 1, 1, 1, 1,
0.1196495, 1.734424, 1.755327, 1, 1, 1, 1, 1,
0.1198261, -0.4340931, 5.106836, 1, 1, 1, 1, 1,
0.1226473, 1.142615, 1.894967, 1, 1, 1, 1, 1,
0.1266016, -0.8843645, 3.0741, 1, 1, 1, 1, 1,
0.1287398, 0.759316, 1.334535, 1, 1, 1, 1, 1,
0.1374717, 0.202363, 0.08152023, 1, 1, 1, 1, 1,
0.1419833, -0.2857296, 3.383838, 1, 1, 1, 1, 1,
0.1421021, 0.74444, 1.646395, 0, 0, 1, 1, 1,
0.1451068, -0.9558296, 3.239132, 1, 0, 0, 1, 1,
0.1526017, -0.380364, 4.565553, 1, 0, 0, 1, 1,
0.156106, 0.1997784, 1.330564, 1, 0, 0, 1, 1,
0.1584375, -1.372403, 3.832092, 1, 0, 0, 1, 1,
0.1597392, 0.9767725, -0.07930336, 1, 0, 0, 1, 1,
0.1672505, -0.2095043, 1.884181, 0, 0, 0, 1, 1,
0.1676989, -0.4526425, 2.027823, 0, 0, 0, 1, 1,
0.1681307, -0.4486237, 3.132378, 0, 0, 0, 1, 1,
0.1706777, 1.673731, -0.7203525, 0, 0, 0, 1, 1,
0.1735325, -0.06879006, 1.422995, 0, 0, 0, 1, 1,
0.1757735, -1.862366, 2.630157, 0, 0, 0, 1, 1,
0.1758678, -0.4273875, 3.62849, 0, 0, 0, 1, 1,
0.1771346, 1.073497, -0.7594146, 1, 1, 1, 1, 1,
0.1805776, 1.365687, -0.2465919, 1, 1, 1, 1, 1,
0.182307, -0.7618764, 1.950962, 1, 1, 1, 1, 1,
0.1827033, 0.266596, -0.1884976, 1, 1, 1, 1, 1,
0.1833901, -0.02621558, 1.791609, 1, 1, 1, 1, 1,
0.1853855, 0.5881683, -0.7608131, 1, 1, 1, 1, 1,
0.1864379, -1.258941, 2.956985, 1, 1, 1, 1, 1,
0.1908316, -0.1752384, 0.5443151, 1, 1, 1, 1, 1,
0.1937517, -1.094103, 2.659827, 1, 1, 1, 1, 1,
0.1964339, -0.7285399, 2.52333, 1, 1, 1, 1, 1,
0.1967, 1.360464, -0.2258183, 1, 1, 1, 1, 1,
0.1982916, -0.5518424, 0.6663107, 1, 1, 1, 1, 1,
0.198416, -1.168816, 3.329039, 1, 1, 1, 1, 1,
0.2056024, 0.7899194, 2.992509, 1, 1, 1, 1, 1,
0.2095286, 0.04904197, 1.801537, 1, 1, 1, 1, 1,
0.2103939, 0.4747685, 1.514341, 0, 0, 1, 1, 1,
0.2157995, -0.0140779, -0.2613542, 1, 0, 0, 1, 1,
0.2207742, -0.3204398, 2.003263, 1, 0, 0, 1, 1,
0.2207844, -0.4980186, 2.308566, 1, 0, 0, 1, 1,
0.2253998, -0.6939889, 4.201214, 1, 0, 0, 1, 1,
0.2287351, -0.6244594, 1.284167, 1, 0, 0, 1, 1,
0.2303374, -1.14018, 4.65605, 0, 0, 0, 1, 1,
0.2337693, 0.1959106, -0.5017992, 0, 0, 0, 1, 1,
0.2377358, -1.024197, 1.427064, 0, 0, 0, 1, 1,
0.2446144, 0.08817508, -0.9869292, 0, 0, 0, 1, 1,
0.2535526, -0.04244709, 1.690273, 0, 0, 0, 1, 1,
0.2537226, -1.219689, 2.229829, 0, 0, 0, 1, 1,
0.2566484, 0.5758742, 0.7762455, 0, 0, 0, 1, 1,
0.2610393, 0.4829519, 0.3708543, 1, 1, 1, 1, 1,
0.2615948, -0.3452147, 2.621957, 1, 1, 1, 1, 1,
0.2712143, 1.287747, 0.9359976, 1, 1, 1, 1, 1,
0.2714876, 0.2833358, 0.5025228, 1, 1, 1, 1, 1,
0.2726413, -0.7489712, -1.023927, 1, 1, 1, 1, 1,
0.2806205, -0.2450972, 4.050978, 1, 1, 1, 1, 1,
0.2832694, 1.08201, 1.124874, 1, 1, 1, 1, 1,
0.2840083, 1.27587, -2.219804, 1, 1, 1, 1, 1,
0.2849937, -0.7307302, 2.960108, 1, 1, 1, 1, 1,
0.2880718, 0.4447661, 2.609749, 1, 1, 1, 1, 1,
0.290859, 0.4701058, -0.05818189, 1, 1, 1, 1, 1,
0.2927699, -2.190742, 3.586861, 1, 1, 1, 1, 1,
0.2940524, -1.944563, 2.994908, 1, 1, 1, 1, 1,
0.294095, 0.5143878, 1.512793, 1, 1, 1, 1, 1,
0.2973233, -0.8495462, 2.779765, 1, 1, 1, 1, 1,
0.2984666, -1.205427, 2.461542, 0, 0, 1, 1, 1,
0.2990304, 1.83476, 1.139602, 1, 0, 0, 1, 1,
0.3016371, 0.3686458, 0.147376, 1, 0, 0, 1, 1,
0.308157, 0.5925832, 0.2689439, 1, 0, 0, 1, 1,
0.3109114, -0.6305338, 4.578091, 1, 0, 0, 1, 1,
0.3111621, -1.893657, 2.076712, 1, 0, 0, 1, 1,
0.3113454, 1.969922, 0.8274105, 0, 0, 0, 1, 1,
0.3126881, 1.394385, 1.176912, 0, 0, 0, 1, 1,
0.3152919, -1.525285, 3.089719, 0, 0, 0, 1, 1,
0.3227826, 1.452804, 0.1709506, 0, 0, 0, 1, 1,
0.3283792, 0.463062, 0.7671309, 0, 0, 0, 1, 1,
0.3284985, -0.8534078, 0.1370225, 0, 0, 0, 1, 1,
0.3304037, 0.1978351, 1.560392, 0, 0, 0, 1, 1,
0.3363405, -0.2256137, 3.335408, 1, 1, 1, 1, 1,
0.3422751, 0.3892145, -0.9475242, 1, 1, 1, 1, 1,
0.3425227, 1.613551, 0.1296027, 1, 1, 1, 1, 1,
0.3425699, 0.3196803, 0.8675343, 1, 1, 1, 1, 1,
0.3440555, 0.1334045, 0.461684, 1, 1, 1, 1, 1,
0.3487673, 0.8474637, 1.142347, 1, 1, 1, 1, 1,
0.3507607, -1.671869, 3.791756, 1, 1, 1, 1, 1,
0.3541601, -0.8177733, 2.016888, 1, 1, 1, 1, 1,
0.3554268, -0.2365433, 3.229611, 1, 1, 1, 1, 1,
0.3561409, -0.1533391, 3.248747, 1, 1, 1, 1, 1,
0.3620122, 0.5812132, 1.017664, 1, 1, 1, 1, 1,
0.3649726, -0.1366003, 1.318518, 1, 1, 1, 1, 1,
0.3662181, -0.08852051, 1.261574, 1, 1, 1, 1, 1,
0.369534, 0.9863753, 0.9553429, 1, 1, 1, 1, 1,
0.3702553, 1.414218, 0.7010266, 1, 1, 1, 1, 1,
0.3745409, -0.4227756, 3.450202, 0, 0, 1, 1, 1,
0.3754846, -0.4017522, 5.210316, 1, 0, 0, 1, 1,
0.3758734, -0.2110858, 0.2735587, 1, 0, 0, 1, 1,
0.3759749, -0.7919918, 1.029305, 1, 0, 0, 1, 1,
0.380559, 0.8211423, 0.3562806, 1, 0, 0, 1, 1,
0.3853058, -1.990291, 1.872499, 1, 0, 0, 1, 1,
0.3863924, 0.8695851, -0.3087319, 0, 0, 0, 1, 1,
0.3887559, 1.0755, -0.1828283, 0, 0, 0, 1, 1,
0.3898883, -0.879183, 2.653682, 0, 0, 0, 1, 1,
0.3972258, 0.5475845, 1.589807, 0, 0, 0, 1, 1,
0.3976569, -0.9711072, 1.65141, 0, 0, 0, 1, 1,
0.4024125, 0.7968669, 0.7762076, 0, 0, 0, 1, 1,
0.4091386, -1.24445, 2.691036, 0, 0, 0, 1, 1,
0.409888, 1.070315, 0.6820729, 1, 1, 1, 1, 1,
0.4120627, -1.727439, 0.8930939, 1, 1, 1, 1, 1,
0.4175625, 0.3993167, 0.6185566, 1, 1, 1, 1, 1,
0.4227235, -0.2837203, 2.275553, 1, 1, 1, 1, 1,
0.4232886, -0.8274941, 2.981821, 1, 1, 1, 1, 1,
0.4293248, -1.486687, 2.725077, 1, 1, 1, 1, 1,
0.429841, -0.5790056, 1.025424, 1, 1, 1, 1, 1,
0.4331778, -0.8182634, 2.987024, 1, 1, 1, 1, 1,
0.4342729, 1.596645, 1.004127, 1, 1, 1, 1, 1,
0.4349238, -0.3936583, 2.544511, 1, 1, 1, 1, 1,
0.4376987, 0.507775, -0.3220789, 1, 1, 1, 1, 1,
0.437829, 0.4719059, 0.9508812, 1, 1, 1, 1, 1,
0.4403415, 0.3399913, 1.874573, 1, 1, 1, 1, 1,
0.4432387, 0.1808736, 1.861194, 1, 1, 1, 1, 1,
0.4450395, 0.4616686, 1.087079, 1, 1, 1, 1, 1,
0.4478124, 0.2623294, 1.656803, 0, 0, 1, 1, 1,
0.4480098, 0.09743172, 1.559324, 1, 0, 0, 1, 1,
0.4498647, 1.965114, 0.6979631, 1, 0, 0, 1, 1,
0.45324, 0.003094959, -0.2905653, 1, 0, 0, 1, 1,
0.4533756, 1.472505, -0.8040882, 1, 0, 0, 1, 1,
0.4587518, -0.3900936, 1.645479, 1, 0, 0, 1, 1,
0.4599842, -1.123775, 2.930058, 0, 0, 0, 1, 1,
0.4640357, -0.7224708, 4.791, 0, 0, 0, 1, 1,
0.4649919, 0.7911887, -2.082645, 0, 0, 0, 1, 1,
0.4667772, 0.4498556, -0.5989455, 0, 0, 0, 1, 1,
0.4674254, -1.060277, 4.27371, 0, 0, 0, 1, 1,
0.4704424, -0.8307466, 2.503904, 0, 0, 0, 1, 1,
0.4727099, -0.1851622, 2.018668, 0, 0, 0, 1, 1,
0.4772061, 0.5007158, 1.199175, 1, 1, 1, 1, 1,
0.4773886, -1.064081, 2.620637, 1, 1, 1, 1, 1,
0.4801177, -0.1051151, 1.114434, 1, 1, 1, 1, 1,
0.4815962, -0.2632814, 0.9875839, 1, 1, 1, 1, 1,
0.4819637, 1.469118, 0.2487005, 1, 1, 1, 1, 1,
0.4890197, 0.8855564, 1.813972, 1, 1, 1, 1, 1,
0.4896809, 0.3928874, 1.683863, 1, 1, 1, 1, 1,
0.4905065, -1.810666, 3.404108, 1, 1, 1, 1, 1,
0.5089238, -0.439668, 1.158362, 1, 1, 1, 1, 1,
0.513822, -1.019612, 3.185771, 1, 1, 1, 1, 1,
0.5183755, -0.4793514, 3.292177, 1, 1, 1, 1, 1,
0.5210733, -1.202182, 3.388399, 1, 1, 1, 1, 1,
0.5247183, -1.067786, 0.6844838, 1, 1, 1, 1, 1,
0.5307956, -0.06961188, 1.819751, 1, 1, 1, 1, 1,
0.531794, 0.6684659, -0.3016928, 1, 1, 1, 1, 1,
0.5322459, -0.1717486, 0.5396636, 0, 0, 1, 1, 1,
0.5323592, -0.595372, 1.67366, 1, 0, 0, 1, 1,
0.5344599, -1.275267, 3.482757, 1, 0, 0, 1, 1,
0.5364997, 0.4080813, 0.09802091, 1, 0, 0, 1, 1,
0.5378318, -2.437876, 2.635985, 1, 0, 0, 1, 1,
0.5413507, -0.651638, 4.637386, 1, 0, 0, 1, 1,
0.5415007, 1.203113, 0.2834266, 0, 0, 0, 1, 1,
0.5475961, -0.06345009, 3.074553, 0, 0, 0, 1, 1,
0.5478875, -0.4306596, 2.697232, 0, 0, 0, 1, 1,
0.5516802, 0.8892633, -0.6740166, 0, 0, 0, 1, 1,
0.5544277, 0.995692, -1.339346, 0, 0, 0, 1, 1,
0.5557422, -0.656498, 1.623673, 0, 0, 0, 1, 1,
0.5560095, -0.6426752, 2.37943, 0, 0, 0, 1, 1,
0.5567631, -0.3509921, 1.697567, 1, 1, 1, 1, 1,
0.5569583, -1.267357, 2.04768, 1, 1, 1, 1, 1,
0.5599132, -1.089279, 2.450568, 1, 1, 1, 1, 1,
0.5701889, 0.947445, 3.151429, 1, 1, 1, 1, 1,
0.5719286, 1.545195, 0.895332, 1, 1, 1, 1, 1,
0.5785323, -0.7586696, 2.795739, 1, 1, 1, 1, 1,
0.5786529, -0.7028134, 3.841032, 1, 1, 1, 1, 1,
0.5800446, 0.1004329, 1.810414, 1, 1, 1, 1, 1,
0.5858007, -0.1892792, 1.307285, 1, 1, 1, 1, 1,
0.5861005, -0.423348, 2.126994, 1, 1, 1, 1, 1,
0.5929356, 0.1429286, 2.113813, 1, 1, 1, 1, 1,
0.5949379, -1.457037, 4.322511, 1, 1, 1, 1, 1,
0.5954323, -1.123735, 2.206421, 1, 1, 1, 1, 1,
0.5976638, -0.7269223, 2.028977, 1, 1, 1, 1, 1,
0.600972, 0.4853632, 1.068455, 1, 1, 1, 1, 1,
0.6014249, -1.015393, 2.360669, 0, 0, 1, 1, 1,
0.6016924, 1.675981, -0.597767, 1, 0, 0, 1, 1,
0.60716, 0.1421657, 1.675282, 1, 0, 0, 1, 1,
0.6176153, -0.9814948, 3.47501, 1, 0, 0, 1, 1,
0.6193722, 1.836803, -0.7445571, 1, 0, 0, 1, 1,
0.6215308, -2.052122, 2.435022, 1, 0, 0, 1, 1,
0.6218246, 0.4679098, 1.550679, 0, 0, 0, 1, 1,
0.6220189, -0.3603451, 2.575193, 0, 0, 0, 1, 1,
0.6226528, 0.2739314, 1.721516, 0, 0, 0, 1, 1,
0.6284978, -0.6113956, 1.893111, 0, 0, 0, 1, 1,
0.6315847, 1.787919, 0.1955059, 0, 0, 0, 1, 1,
0.633485, -1.592017, 2.660067, 0, 0, 0, 1, 1,
0.6348978, -0.1422927, 0.7667012, 0, 0, 0, 1, 1,
0.6360145, 0.4256544, 0.4798074, 1, 1, 1, 1, 1,
0.6384153, -1.277816, 2.473902, 1, 1, 1, 1, 1,
0.6390675, -2.482495, 3.516078, 1, 1, 1, 1, 1,
0.6417205, -0.8416725, 1.001686, 1, 1, 1, 1, 1,
0.6501143, 0.5105058, 1.847365, 1, 1, 1, 1, 1,
0.6519914, 0.771737, 1.474438, 1, 1, 1, 1, 1,
0.6530821, -1.357103, 3.994001, 1, 1, 1, 1, 1,
0.6538822, -0.9804342, 4.540962, 1, 1, 1, 1, 1,
0.6598165, 0.03300391, 0.4413623, 1, 1, 1, 1, 1,
0.6608041, 0.3224607, 1.865673, 1, 1, 1, 1, 1,
0.6654766, -2.4844, 3.537568, 1, 1, 1, 1, 1,
0.671563, -1.382938, 2.176696, 1, 1, 1, 1, 1,
0.6725472, -1.574641, 3.212486, 1, 1, 1, 1, 1,
0.6758946, -0.4295267, 1.773986, 1, 1, 1, 1, 1,
0.6766613, 0.3286757, 1.282424, 1, 1, 1, 1, 1,
0.6832285, 0.7738868, 0.4761865, 0, 0, 1, 1, 1,
0.6837655, 0.6328707, 1.378843, 1, 0, 0, 1, 1,
0.6849611, 0.06289139, 1.152009, 1, 0, 0, 1, 1,
0.6884856, 0.898701, 1.558745, 1, 0, 0, 1, 1,
0.6886924, 0.1039993, 2.139928, 1, 0, 0, 1, 1,
0.6907865, -0.1366963, 1.876808, 1, 0, 0, 1, 1,
0.6996012, 0.6385986, 0.646778, 0, 0, 0, 1, 1,
0.6996092, -1.460224, 4.137604, 0, 0, 0, 1, 1,
0.7005343, -0.4268036, 3.707733, 0, 0, 0, 1, 1,
0.7040419, 0.2939592, 1.316451, 0, 0, 0, 1, 1,
0.7048945, 0.4385304, 3.073323, 0, 0, 0, 1, 1,
0.7115859, 1.824267, -0.4329962, 0, 0, 0, 1, 1,
0.7138025, 0.3754594, -0.4349, 0, 0, 0, 1, 1,
0.714928, 0.05420922, 1.115023, 1, 1, 1, 1, 1,
0.7178825, -1.08489, 2.171178, 1, 1, 1, 1, 1,
0.7231787, 0.5013626, 1.426817, 1, 1, 1, 1, 1,
0.7261305, 1.27749, 0.1533694, 1, 1, 1, 1, 1,
0.7264545, -0.9589844, 2.689314, 1, 1, 1, 1, 1,
0.7318798, 0.5388759, 1.470587, 1, 1, 1, 1, 1,
0.7319548, 0.3134281, 0.0933845, 1, 1, 1, 1, 1,
0.7321585, -0.1569407, 1.751532, 1, 1, 1, 1, 1,
0.7368122, 2.152443, -0.7325411, 1, 1, 1, 1, 1,
0.7377319, 0.05860842, 1.985738, 1, 1, 1, 1, 1,
0.7437804, 1.086919, -0.08292723, 1, 1, 1, 1, 1,
0.7517564, -0.7436765, 1.593201, 1, 1, 1, 1, 1,
0.7608049, 1.628696, -0.8905009, 1, 1, 1, 1, 1,
0.7615582, -0.4811313, 3.523125, 1, 1, 1, 1, 1,
0.7679512, -0.1552899, 2.866303, 1, 1, 1, 1, 1,
0.771411, 0.6505694, 0.4829963, 0, 0, 1, 1, 1,
0.7752686, -1.269205, 2.919082, 1, 0, 0, 1, 1,
0.777122, -0.01528335, 2.918206, 1, 0, 0, 1, 1,
0.7773486, 1.435324, 0.7915716, 1, 0, 0, 1, 1,
0.7795135, -0.7319602, 2.64592, 1, 0, 0, 1, 1,
0.7801348, 0.3992901, 2.542292, 1, 0, 0, 1, 1,
0.7809755, 0.5124188, 1.073376, 0, 0, 0, 1, 1,
0.7815789, -0.3416075, 1.557798, 0, 0, 0, 1, 1,
0.7830408, -0.1572241, 2.757288, 0, 0, 0, 1, 1,
0.7903706, -0.1223528, 0.8073477, 0, 0, 0, 1, 1,
0.7914441, -0.5980795, 1.787915, 0, 0, 0, 1, 1,
0.7936251, -0.5132986, 1.98209, 0, 0, 0, 1, 1,
0.8000212, -0.1017963, 1.441096, 0, 0, 0, 1, 1,
0.8071786, -0.2753655, 2.111107, 1, 1, 1, 1, 1,
0.810364, 0.7728249, 1.682455, 1, 1, 1, 1, 1,
0.812681, -0.1014363, 2.884643, 1, 1, 1, 1, 1,
0.8169616, 1.390699, 0.9050813, 1, 1, 1, 1, 1,
0.8178027, 1.557307, 2.637909, 1, 1, 1, 1, 1,
0.8196012, -0.6612687, 2.020923, 1, 1, 1, 1, 1,
0.8325766, -0.8507869, 0.7707599, 1, 1, 1, 1, 1,
0.8383458, -0.1160654, 1.990643, 1, 1, 1, 1, 1,
0.8408741, 0.5875065, 1.387971, 1, 1, 1, 1, 1,
0.8458625, -0.9984449, 1.7042, 1, 1, 1, 1, 1,
0.8665416, -0.1800176, 1.455512, 1, 1, 1, 1, 1,
0.8686661, 0.2127621, 0.7614153, 1, 1, 1, 1, 1,
0.8762754, 0.3250435, 0.8108339, 1, 1, 1, 1, 1,
0.8821736, 0.4201761, 0.2157841, 1, 1, 1, 1, 1,
0.8899235, 0.735562, 1.598843, 1, 1, 1, 1, 1,
0.8900974, 0.2566272, 1.616983, 0, 0, 1, 1, 1,
0.8987013, 0.9832873, 1.691739, 1, 0, 0, 1, 1,
0.9057912, 0.04611991, 1.245313, 1, 0, 0, 1, 1,
0.9106246, -0.2111445, 1.152526, 1, 0, 0, 1, 1,
0.9114046, -1.058027, 1.686836, 1, 0, 0, 1, 1,
0.9223306, 0.6458023, 2.914151, 1, 0, 0, 1, 1,
0.9282049, -1.162825, 1.911931, 0, 0, 0, 1, 1,
0.9407014, -3.059278, 3.33637, 0, 0, 0, 1, 1,
0.9442914, 0.2629617, 2.976371, 0, 0, 0, 1, 1,
0.947206, -0.4301991, 2.325171, 0, 0, 0, 1, 1,
0.9478139, -0.1450033, 1.83646, 0, 0, 0, 1, 1,
0.955872, 0.3194063, 1.865853, 0, 0, 0, 1, 1,
0.9621095, 0.2508111, 0.9062503, 0, 0, 0, 1, 1,
0.964377, 0.4994775, 0.6568186, 1, 1, 1, 1, 1,
0.96731, -0.5556301, 1.883967, 1, 1, 1, 1, 1,
0.9707775, 0.4505771, 1.573701, 1, 1, 1, 1, 1,
0.9747981, -1.71288, 2.949502, 1, 1, 1, 1, 1,
0.975022, 0.1087663, 0.9963952, 1, 1, 1, 1, 1,
0.9783354, 1.150818, 0.01036092, 1, 1, 1, 1, 1,
0.9803064, 0.502337, 2.801342, 1, 1, 1, 1, 1,
0.983578, 0.5455154, -0.3051459, 1, 1, 1, 1, 1,
0.9841161, 0.457169, 1.734802, 1, 1, 1, 1, 1,
0.9896714, -0.3240247, 0.3410725, 1, 1, 1, 1, 1,
0.9916049, -1.667066, 1.571241, 1, 1, 1, 1, 1,
0.9958264, 0.9686354, 0.9180393, 1, 1, 1, 1, 1,
0.9973425, -1.454838, 1.817339, 1, 1, 1, 1, 1,
0.9992874, -1.088173, 3.498849, 1, 1, 1, 1, 1,
1.006061, 0.4017824, -0.5451133, 1, 1, 1, 1, 1,
1.006577, -0.3820568, 1.764076, 0, 0, 1, 1, 1,
1.019566, 0.06009202, 0.6084548, 1, 0, 0, 1, 1,
1.023112, 1.922487, 0.266095, 1, 0, 0, 1, 1,
1.026607, -0.1771861, 1.640979, 1, 0, 0, 1, 1,
1.037251, 0.8540918, -0.1947985, 1, 0, 0, 1, 1,
1.03806, -0.2157225, 2.610561, 1, 0, 0, 1, 1,
1.04082, -0.2628914, 1.575799, 0, 0, 0, 1, 1,
1.041471, -0.9075562, 2.24246, 0, 0, 0, 1, 1,
1.056656, -0.2062722, 2.568174, 0, 0, 0, 1, 1,
1.058254, 0.6084024, -0.1548758, 0, 0, 0, 1, 1,
1.059265, -0.1553198, 1.54474, 0, 0, 0, 1, 1,
1.06437, -0.2252806, 3.247186, 0, 0, 0, 1, 1,
1.069806, -0.747395, 0.3128023, 0, 0, 0, 1, 1,
1.071812, 0.09771512, 0.9249399, 1, 1, 1, 1, 1,
1.074429, 1.190975, 1.054108, 1, 1, 1, 1, 1,
1.075517, 0.3088593, 3.185569, 1, 1, 1, 1, 1,
1.078156, -0.1936409, 1.435584, 1, 1, 1, 1, 1,
1.085711, 1.450368, 1.285493, 1, 1, 1, 1, 1,
1.098711, 0.5705112, 1.29263, 1, 1, 1, 1, 1,
1.098727, -0.2185025, 3.390859, 1, 1, 1, 1, 1,
1.100109, 0.01107476, 2.031588, 1, 1, 1, 1, 1,
1.104829, 0.4690228, -0.4712379, 1, 1, 1, 1, 1,
1.107249, 1.25978, 0.03173553, 1, 1, 1, 1, 1,
1.109493, 1.880583, 0.6749519, 1, 1, 1, 1, 1,
1.114794, 0.4827423, 2.317945, 1, 1, 1, 1, 1,
1.119982, -0.7805655, 2.754287, 1, 1, 1, 1, 1,
1.127744, -1.083904, 0.7861125, 1, 1, 1, 1, 1,
1.132097, -0.7951168, 2.133861, 1, 1, 1, 1, 1,
1.136906, -0.6001731, 0.7587529, 0, 0, 1, 1, 1,
1.142962, 0.4511949, 1.282935, 1, 0, 0, 1, 1,
1.147856, 0.8372506, 2.826501, 1, 0, 0, 1, 1,
1.155265, -1.212114, 2.603503, 1, 0, 0, 1, 1,
1.157571, 0.2610359, 1.62757, 1, 0, 0, 1, 1,
1.165123, -1.519082, 3.23901, 1, 0, 0, 1, 1,
1.165275, -1.517597, 2.483855, 0, 0, 0, 1, 1,
1.165575, -0.6598216, 2.616012, 0, 0, 0, 1, 1,
1.170684, -0.3019746, 3.376759, 0, 0, 0, 1, 1,
1.171014, 0.6194044, 2.121676, 0, 0, 0, 1, 1,
1.173397, -0.8332638, 1.605059, 0, 0, 0, 1, 1,
1.182824, 1.032639, 1.16421, 0, 0, 0, 1, 1,
1.18423, -1.118195, 3.740003, 0, 0, 0, 1, 1,
1.189685, 0.02156713, 4.365489, 1, 1, 1, 1, 1,
1.194975, 1.815983, -0.2002821, 1, 1, 1, 1, 1,
1.198082, -0.7611232, 2.045547, 1, 1, 1, 1, 1,
1.20541, -1.474258, 2.702549, 1, 1, 1, 1, 1,
1.206428, 1.867055, 0.7114387, 1, 1, 1, 1, 1,
1.21984, -0.6184801, 3.243987, 1, 1, 1, 1, 1,
1.221905, 0.05060346, 2.02464, 1, 1, 1, 1, 1,
1.222112, -0.2094901, 1.344245, 1, 1, 1, 1, 1,
1.224215, -2.514699, 3.366415, 1, 1, 1, 1, 1,
1.239444, 1.080435, -1.309838, 1, 1, 1, 1, 1,
1.240593, 0.9892813, -0.4529973, 1, 1, 1, 1, 1,
1.247997, 1.160718, 2.237964, 1, 1, 1, 1, 1,
1.251283, -1.456313, 1.045055, 1, 1, 1, 1, 1,
1.251381, -1.345505, 2.670405, 1, 1, 1, 1, 1,
1.253071, -0.09076472, -0.8144941, 1, 1, 1, 1, 1,
1.262991, 0.488661, 0.1769919, 0, 0, 1, 1, 1,
1.265106, 0.8170384, -0.798067, 1, 0, 0, 1, 1,
1.265364, -2.141282, 1.512259, 1, 0, 0, 1, 1,
1.265935, 0.2178986, 0.2553961, 1, 0, 0, 1, 1,
1.266796, -2.632327, 1.231425, 1, 0, 0, 1, 1,
1.277701, -0.1553913, 1.518932, 1, 0, 0, 1, 1,
1.278108, 1.314887, 2.030533, 0, 0, 0, 1, 1,
1.291769, -0.8318604, 3.317755, 0, 0, 0, 1, 1,
1.296973, 1.927674, 1.028571, 0, 0, 0, 1, 1,
1.303974, -1.746773, 0.8663545, 0, 0, 0, 1, 1,
1.30718, 1.602789, 0.5975645, 0, 0, 0, 1, 1,
1.311655, -0.2878662, 2.077029, 0, 0, 0, 1, 1,
1.311759, 0.071305, 2.39455, 0, 0, 0, 1, 1,
1.320668, -0.7917119, 2.400834, 1, 1, 1, 1, 1,
1.321146, 0.4994442, 1.970621, 1, 1, 1, 1, 1,
1.335298, 0.2035281, 2.166673, 1, 1, 1, 1, 1,
1.339694, -1.649355, 1.447763, 1, 1, 1, 1, 1,
1.344266, 0.2913051, 1.355789, 1, 1, 1, 1, 1,
1.352362, -0.05213451, 1.680156, 1, 1, 1, 1, 1,
1.362225, -0.6105404, 0.9269559, 1, 1, 1, 1, 1,
1.364149, -0.5824803, 3.564152, 1, 1, 1, 1, 1,
1.366519, -0.5640516, 2.274013, 1, 1, 1, 1, 1,
1.369208, -2.495639, 3.206594, 1, 1, 1, 1, 1,
1.369464, 0.4782957, 1.162315, 1, 1, 1, 1, 1,
1.370196, -0.5981315, 3.429357, 1, 1, 1, 1, 1,
1.376305, 0.4542176, 2.513141, 1, 1, 1, 1, 1,
1.385661, 0.06137111, 1.942186, 1, 1, 1, 1, 1,
1.389489, 0.1916038, 3.54493, 1, 1, 1, 1, 1,
1.397336, 0.7620084, 2.064604, 0, 0, 1, 1, 1,
1.398966, 0.266771, 0.4296147, 1, 0, 0, 1, 1,
1.401975, 0.9659742, 1.027781, 1, 0, 0, 1, 1,
1.423611, 0.2740725, 0.1756728, 1, 0, 0, 1, 1,
1.425587, -0.744426, 1.967758, 1, 0, 0, 1, 1,
1.430551, 1.095637, 1.227663, 1, 0, 0, 1, 1,
1.435469, 0.1033693, 0.5903297, 0, 0, 0, 1, 1,
1.436649, 2.415491, -0.6569939, 0, 0, 0, 1, 1,
1.437413, -0.06401427, 1.684462, 0, 0, 0, 1, 1,
1.45454, -0.8700962, 4.603091, 0, 0, 0, 1, 1,
1.459308, 0.1422961, -0.833313, 0, 0, 0, 1, 1,
1.467036, -0.3390447, 2.707157, 0, 0, 0, 1, 1,
1.467975, -0.2260749, 1.383437, 0, 0, 0, 1, 1,
1.472157, -1.028534, 3.15352, 1, 1, 1, 1, 1,
1.476465, -0.9119085, 1.938472, 1, 1, 1, 1, 1,
1.504652, 1.382653, 0.9613018, 1, 1, 1, 1, 1,
1.504993, 1.145702, 1.210211, 1, 1, 1, 1, 1,
1.522321, 0.2490505, 0.1285157, 1, 1, 1, 1, 1,
1.533889, 0.7210414, -0.004497709, 1, 1, 1, 1, 1,
1.53605, -2.489404, 2.37094, 1, 1, 1, 1, 1,
1.538207, 0.4967368, 1.426117, 1, 1, 1, 1, 1,
1.540789, 1.421747, 1.791898, 1, 1, 1, 1, 1,
1.548164, 0.6187063, 2.027636, 1, 1, 1, 1, 1,
1.554526, -0.2502479, 2.066046, 1, 1, 1, 1, 1,
1.559745, 0.7419471, 1.915672, 1, 1, 1, 1, 1,
1.560019, -1.363745, 3.214405, 1, 1, 1, 1, 1,
1.591528, 0.8568703, 0.6560801, 1, 1, 1, 1, 1,
1.601264, -0.3953849, 3.117724, 1, 1, 1, 1, 1,
1.618847, 0.6906729, 1.337574, 0, 0, 1, 1, 1,
1.620642, 1.147642, 1.812388, 1, 0, 0, 1, 1,
1.627959, 0.5332059, 1.742385, 1, 0, 0, 1, 1,
1.636032, 0.5413889, 2.347487, 1, 0, 0, 1, 1,
1.641186, -0.8089876, 2.058244, 1, 0, 0, 1, 1,
1.646582, -0.700544, 1.774632, 1, 0, 0, 1, 1,
1.649127, -0.6367824, 3.38756, 0, 0, 0, 1, 1,
1.720819, 0.7572043, 0.7093074, 0, 0, 0, 1, 1,
1.723849, -1.125694, 2.349806, 0, 0, 0, 1, 1,
1.724161, 0.31874, 1.049559, 0, 0, 0, 1, 1,
1.734248, -0.2355229, 3.789504, 0, 0, 0, 1, 1,
1.762653, -2.374274, 3.016867, 0, 0, 0, 1, 1,
1.785078, 1.463283, 0.5668455, 0, 0, 0, 1, 1,
1.787434, -0.8048637, -0.3964246, 1, 1, 1, 1, 1,
1.802924, -1.121537, 2.361351, 1, 1, 1, 1, 1,
1.807889, -1.111722, 2.257743, 1, 1, 1, 1, 1,
1.808983, -1.590073, 1.571077, 1, 1, 1, 1, 1,
1.837901, -0.2809671, 2.152306, 1, 1, 1, 1, 1,
1.84795, -0.4142819, -0.4662913, 1, 1, 1, 1, 1,
1.85816, 0.2658619, 0.5724889, 1, 1, 1, 1, 1,
1.887458, -0.7039828, 0.8908263, 1, 1, 1, 1, 1,
1.889668, 2.265166, 0.1110794, 1, 1, 1, 1, 1,
1.905613, 0.7300354, -0.425597, 1, 1, 1, 1, 1,
1.922197, 1.2179, 1.256607, 1, 1, 1, 1, 1,
1.926469, 0.4397049, 1.184765, 1, 1, 1, 1, 1,
1.940535, -0.1225854, 0.7346575, 1, 1, 1, 1, 1,
1.978366, -0.9584674, 0.4508562, 1, 1, 1, 1, 1,
1.979026, -0.467265, 0.8466074, 1, 1, 1, 1, 1,
1.994829, -0.6430288, 2.00058, 0, 0, 1, 1, 1,
2.023356, -1.470604, 1.900916, 1, 0, 0, 1, 1,
2.026833, -0.6250841, 0.0618636, 1, 0, 0, 1, 1,
2.036906, -0.05536568, -0.05308665, 1, 0, 0, 1, 1,
2.03944, 0.1811175, 0.760134, 1, 0, 0, 1, 1,
2.074963, -1.776718, 2.300689, 1, 0, 0, 1, 1,
2.175919, 0.8813493, 1.766918, 0, 0, 0, 1, 1,
2.214986, 0.5784104, 1.272573, 0, 0, 0, 1, 1,
2.235879, 1.289946, 1.516767, 0, 0, 0, 1, 1,
2.270531, 0.5478407, 0.9741107, 0, 0, 0, 1, 1,
2.294794, 0.1747134, 1.624906, 0, 0, 0, 1, 1,
2.318902, -0.1323803, 1.822335, 0, 0, 0, 1, 1,
2.328834, 0.8887765, 0.9886968, 0, 0, 0, 1, 1,
2.367228, 0.4150584, 1.294603, 1, 1, 1, 1, 1,
2.407732, 1.175888, 0.7264458, 1, 1, 1, 1, 1,
2.483353, -1.303397, 2.130962, 1, 1, 1, 1, 1,
2.504328, -0.6575099, 1.989289, 1, 1, 1, 1, 1,
2.580532, 0.8374646, 1.710547, 1, 1, 1, 1, 1,
2.763985, -1.060893, 3.577931, 1, 1, 1, 1, 1,
3.393466, -0.9189029, 0.5271494, 1, 1, 1, 1, 1
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
var radius = 9.349749;
var distance = 32.8406;
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
mvMatrix.translate( -0.1716883, -0.0198195, -0.08729053 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.8406);
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
