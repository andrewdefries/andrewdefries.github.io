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
-3.393808, 0.9996876, -2.840266, 1, 0, 0, 1,
-3.076666, 0.1048941, -2.359966, 1, 0.007843138, 0, 1,
-3.011773, -0.4925902, -1.900545, 1, 0.01176471, 0, 1,
-2.827427, 0.5893132, -0.7945731, 1, 0.01960784, 0, 1,
-2.578432, -0.7157404, -1.19697, 1, 0.02352941, 0, 1,
-2.542111, -1.315906, -1.804107, 1, 0.03137255, 0, 1,
-2.507538, -0.4150593, -1.636029, 1, 0.03529412, 0, 1,
-2.490215, -0.08504739, -0.9604328, 1, 0.04313726, 0, 1,
-2.439225, -1.062815, -2.120705, 1, 0.04705882, 0, 1,
-2.438416, -1.363252, -2.148038, 1, 0.05490196, 0, 1,
-2.355362, -0.8917539, -2.638184, 1, 0.05882353, 0, 1,
-2.353211, 0.3086373, -2.236757, 1, 0.06666667, 0, 1,
-2.342371, -0.5228904, -1.264425, 1, 0.07058824, 0, 1,
-2.302032, 0.5197753, -1.412519, 1, 0.07843138, 0, 1,
-2.275306, 0.3797314, -1.918924, 1, 0.08235294, 0, 1,
-2.254843, 1.094738, -1.799116, 1, 0.09019608, 0, 1,
-2.241974, -0.7209014, -2.104413, 1, 0.09411765, 0, 1,
-2.175587, -1.156689, -0.3703909, 1, 0.1019608, 0, 1,
-2.120761, -0.9371737, -3.388284, 1, 0.1098039, 0, 1,
-2.10963, 1.658088, -2.308233, 1, 0.1137255, 0, 1,
-2.100039, -0.8453258, -1.111896, 1, 0.1215686, 0, 1,
-2.087945, -0.3259867, -2.174343, 1, 0.1254902, 0, 1,
-2.069308, -0.2889171, -1.956595, 1, 0.1333333, 0, 1,
-2.061254, 0.434781, -2.883729, 1, 0.1372549, 0, 1,
-2.04323, 0.8063039, -2.171904, 1, 0.145098, 0, 1,
-2.026948, -1.199387, -1.889037, 1, 0.1490196, 0, 1,
-2.002573, 1.728692, -0.744601, 1, 0.1568628, 0, 1,
-1.974509, -2.102292, -2.872184, 1, 0.1607843, 0, 1,
-1.944885, 0.7794569, -1.518974, 1, 0.1686275, 0, 1,
-1.936951, 0.3203953, -0.5527256, 1, 0.172549, 0, 1,
-1.904205, 1.391394, 0.475974, 1, 0.1803922, 0, 1,
-1.901643, 0.08540425, -1.384294, 1, 0.1843137, 0, 1,
-1.890749, 0.0393526, -1.127455, 1, 0.1921569, 0, 1,
-1.887003, -0.8923694, -3.708626, 1, 0.1960784, 0, 1,
-1.884909, 0.8606529, -1.354328, 1, 0.2039216, 0, 1,
-1.878007, -0.1307968, -4.109634, 1, 0.2117647, 0, 1,
-1.868327, -1.120252, -1.700481, 1, 0.2156863, 0, 1,
-1.860386, 0.09810553, -0.9206553, 1, 0.2235294, 0, 1,
-1.85763, -1.51891, -1.71443, 1, 0.227451, 0, 1,
-1.849217, 1.253603, -0.8603602, 1, 0.2352941, 0, 1,
-1.835093, 0.8326964, -1.61683, 1, 0.2392157, 0, 1,
-1.821634, 2.222217, -2.618985, 1, 0.2470588, 0, 1,
-1.812033, 0.07639863, -2.211081, 1, 0.2509804, 0, 1,
-1.796104, 0.9150136, -1.484846, 1, 0.2588235, 0, 1,
-1.768431, -1.838823, -2.395423, 1, 0.2627451, 0, 1,
-1.761835, 0.07226637, -2.71204, 1, 0.2705882, 0, 1,
-1.758451, 0.2667787, -1.607414, 1, 0.2745098, 0, 1,
-1.75768, -1.717105, -1.073302, 1, 0.282353, 0, 1,
-1.72315, -0.5417128, -2.390051, 1, 0.2862745, 0, 1,
-1.716891, 0.06521091, -2.10111, 1, 0.2941177, 0, 1,
-1.707773, -0.0101957, -2.155057, 1, 0.3019608, 0, 1,
-1.698238, 0.2111676, -1.907186, 1, 0.3058824, 0, 1,
-1.678024, 0.007348057, -2.718411, 1, 0.3137255, 0, 1,
-1.657475, 0.6843983, -0.8001975, 1, 0.3176471, 0, 1,
-1.651559, -1.28799, -2.03649, 1, 0.3254902, 0, 1,
-1.645885, -0.1647084, -1.854811, 1, 0.3294118, 0, 1,
-1.645046, -0.5082318, -2.960911, 1, 0.3372549, 0, 1,
-1.627465, -2.238, -1.943144, 1, 0.3411765, 0, 1,
-1.624437, 0.5378872, -1.920086, 1, 0.3490196, 0, 1,
-1.620149, -0.5294346, -2.54699, 1, 0.3529412, 0, 1,
-1.610579, 0.8059086, -1.460419, 1, 0.3607843, 0, 1,
-1.608288, 1.752272, -1.653308, 1, 0.3647059, 0, 1,
-1.605363, -0.2789865, -0.9705194, 1, 0.372549, 0, 1,
-1.600971, -1.018517, -3.969743, 1, 0.3764706, 0, 1,
-1.589415, -0.1189602, -0.600625, 1, 0.3843137, 0, 1,
-1.587059, -0.7026001, -1.81118, 1, 0.3882353, 0, 1,
-1.583878, -0.816506, -2.101321, 1, 0.3960784, 0, 1,
-1.562141, -0.6237724, -1.77663, 1, 0.4039216, 0, 1,
-1.550912, -0.5654691, -0.938315, 1, 0.4078431, 0, 1,
-1.530186, 0.9736438, -3.92066, 1, 0.4156863, 0, 1,
-1.515581, 0.4075271, -2.640908, 1, 0.4196078, 0, 1,
-1.497026, 1.577628, 0.436289, 1, 0.427451, 0, 1,
-1.495411, 0.1219565, 1.465125, 1, 0.4313726, 0, 1,
-1.492261, 0.2173665, -2.717263, 1, 0.4392157, 0, 1,
-1.484336, -0.8852207, -0.8076274, 1, 0.4431373, 0, 1,
-1.478879, -0.2830297, -1.700164, 1, 0.4509804, 0, 1,
-1.464428, -0.5537547, -1.448821, 1, 0.454902, 0, 1,
-1.459658, 0.2485707, 0.6476926, 1, 0.4627451, 0, 1,
-1.454805, -0.6669884, -2.696388, 1, 0.4666667, 0, 1,
-1.453775, 1.087926, 2.250274, 1, 0.4745098, 0, 1,
-1.450977, 1.357327, -1.742193, 1, 0.4784314, 0, 1,
-1.449362, -0.3835169, -1.779707, 1, 0.4862745, 0, 1,
-1.441653, 0.2892525, -1.344432, 1, 0.4901961, 0, 1,
-1.430568, 0.2718744, -1.617125, 1, 0.4980392, 0, 1,
-1.425246, 0.5624636, 0.02549607, 1, 0.5058824, 0, 1,
-1.422875, -0.4347302, -1.643079, 1, 0.509804, 0, 1,
-1.417829, -0.1941938, -0.5732287, 1, 0.5176471, 0, 1,
-1.404384, -1.278007, -1.966628, 1, 0.5215687, 0, 1,
-1.394286, 0.9355634, -1.404486, 1, 0.5294118, 0, 1,
-1.391089, -1.368282, -3.416727, 1, 0.5333334, 0, 1,
-1.382114, 1.07959, -2.251133, 1, 0.5411765, 0, 1,
-1.379172, 0.4022627, -1.298205, 1, 0.5450981, 0, 1,
-1.374112, 0.03146747, -2.44988, 1, 0.5529412, 0, 1,
-1.373115, -1.262509, -2.079652, 1, 0.5568628, 0, 1,
-1.352421, 0.02909411, -1.182796, 1, 0.5647059, 0, 1,
-1.3493, 0.4495798, -1.768817, 1, 0.5686275, 0, 1,
-1.340298, 0.7597157, 0.1725762, 1, 0.5764706, 0, 1,
-1.334923, -0.5318584, -0.9334723, 1, 0.5803922, 0, 1,
-1.334679, 0.9166867, -2.020013, 1, 0.5882353, 0, 1,
-1.32915, 0.1956773, -0.8342246, 1, 0.5921569, 0, 1,
-1.322512, -0.615714, -2.323504, 1, 0.6, 0, 1,
-1.317736, 1.343269, -0.01032264, 1, 0.6078432, 0, 1,
-1.31554, 0.3932115, -2.612581, 1, 0.6117647, 0, 1,
-1.311844, 0.6156615, -2.005282, 1, 0.6196079, 0, 1,
-1.310602, 0.9202285, -0.3868985, 1, 0.6235294, 0, 1,
-1.305106, 0.08686472, -2.079005, 1, 0.6313726, 0, 1,
-1.300433, 0.6477728, -0.03470451, 1, 0.6352941, 0, 1,
-1.298212, 0.03109962, -2.015207, 1, 0.6431373, 0, 1,
-1.290332, 2.031466, 0.1064029, 1, 0.6470588, 0, 1,
-1.289071, 0.1234584, -1.017875, 1, 0.654902, 0, 1,
-1.279225, -0.183863, -2.112969, 1, 0.6588235, 0, 1,
-1.275227, -0.9217021, -3.482809, 1, 0.6666667, 0, 1,
-1.269191, 1.426169, 0.4287499, 1, 0.6705883, 0, 1,
-1.265089, -0.6484721, -0.9886636, 1, 0.6784314, 0, 1,
-1.262592, 0.2714026, -0.95927, 1, 0.682353, 0, 1,
-1.259983, -0.6588709, -4.263676, 1, 0.6901961, 0, 1,
-1.250203, 0.4471532, -1.777218, 1, 0.6941177, 0, 1,
-1.247601, -0.7355528, -3.484231, 1, 0.7019608, 0, 1,
-1.243259, 0.0638299, -1.219012, 1, 0.7098039, 0, 1,
-1.241424, -0.2232318, -0.7444884, 1, 0.7137255, 0, 1,
-1.237366, -0.3121338, -2.959225, 1, 0.7215686, 0, 1,
-1.232445, 2.56272, -1.130189, 1, 0.7254902, 0, 1,
-1.226544, -0.7246295, -3.084252, 1, 0.7333333, 0, 1,
-1.212149, -0.3299772, -0.2031101, 1, 0.7372549, 0, 1,
-1.209992, -0.5243481, -0.8976867, 1, 0.7450981, 0, 1,
-1.2049, 2.142456, -0.9722975, 1, 0.7490196, 0, 1,
-1.193155, 0.7074206, -0.3380191, 1, 0.7568628, 0, 1,
-1.189628, 0.2054286, -0.515455, 1, 0.7607843, 0, 1,
-1.18911, 1.339618, -2.777972, 1, 0.7686275, 0, 1,
-1.185212, 1.02764, -1.763094, 1, 0.772549, 0, 1,
-1.181192, 0.2410206, -2.349878, 1, 0.7803922, 0, 1,
-1.177033, 0.2249448, -1.818848, 1, 0.7843137, 0, 1,
-1.173085, -0.09159123, -2.777503, 1, 0.7921569, 0, 1,
-1.161702, 1.366474, -0.6026541, 1, 0.7960784, 0, 1,
-1.155631, -0.7621076, -2.42238, 1, 0.8039216, 0, 1,
-1.154367, 0.8768463, -2.196085, 1, 0.8117647, 0, 1,
-1.151558, -1.799842, -2.516112, 1, 0.8156863, 0, 1,
-1.151528, -1.693814, -1.893681, 1, 0.8235294, 0, 1,
-1.148051, -0.2920365, -2.049111, 1, 0.827451, 0, 1,
-1.141457, 0.6636788, 0.002236847, 1, 0.8352941, 0, 1,
-1.135582, -1.431556, -2.531654, 1, 0.8392157, 0, 1,
-1.134004, -1.114335, -0.1291863, 1, 0.8470588, 0, 1,
-1.121237, -0.4901556, -2.816083, 1, 0.8509804, 0, 1,
-1.119191, 1.886873, -0.1461872, 1, 0.8588235, 0, 1,
-1.11557, -0.2177348, 0.1683074, 1, 0.8627451, 0, 1,
-1.115347, -0.3607653, -1.827153, 1, 0.8705882, 0, 1,
-1.115008, -1.068415, -2.309004, 1, 0.8745098, 0, 1,
-1.114693, -0.9867318, -3.652714, 1, 0.8823529, 0, 1,
-1.114179, 0.7223219, -1.010725, 1, 0.8862745, 0, 1,
-1.113157, -1.808275, -2.006688, 1, 0.8941177, 0, 1,
-1.112242, 0.368791, -0.6569278, 1, 0.8980392, 0, 1,
-1.108527, 0.1942377, -2.255025, 1, 0.9058824, 0, 1,
-1.107627, -1.061149, -3.883813, 1, 0.9137255, 0, 1,
-1.102214, 0.4604127, -0.9462636, 1, 0.9176471, 0, 1,
-1.100329, -0.9606227, -2.43129, 1, 0.9254902, 0, 1,
-1.094904, -0.354878, -1.541769, 1, 0.9294118, 0, 1,
-1.094146, -0.1663227, -2.528714, 1, 0.9372549, 0, 1,
-1.088224, -1.575404, -2.707717, 1, 0.9411765, 0, 1,
-1.081613, 0.8420009, -0.2031536, 1, 0.9490196, 0, 1,
-1.080526, -0.227006, 0.09524302, 1, 0.9529412, 0, 1,
-1.075832, -1.135426, -1.167988, 1, 0.9607843, 0, 1,
-1.072428, 1.012085, 0.2019813, 1, 0.9647059, 0, 1,
-1.069661, 1.246151, -2.801152, 1, 0.972549, 0, 1,
-1.066967, 0.3069288, -1.152876, 1, 0.9764706, 0, 1,
-1.061525, 1.197616, -0.800742, 1, 0.9843137, 0, 1,
-1.057289, -1.12218, -0.6164331, 1, 0.9882353, 0, 1,
-1.052245, 0.7927774, -0.8826189, 1, 0.9960784, 0, 1,
-1.052214, -0.2664069, 0.160521, 0.9960784, 1, 0, 1,
-1.049569, 0.2713578, -1.546644, 0.9921569, 1, 0, 1,
-1.044058, 1.842247, 0.45994, 0.9843137, 1, 0, 1,
-1.020942, -1.811765, -2.026341, 0.9803922, 1, 0, 1,
-1.018731, 1.385424, -0.2611977, 0.972549, 1, 0, 1,
-1.008678, 0.3281277, -0.08115667, 0.9686275, 1, 0, 1,
-1.001355, 0.3924893, -1.941085, 0.9607843, 1, 0, 1,
-1.000779, -1.09325, -2.327813, 0.9568627, 1, 0, 1,
-0.9984796, 0.6517283, 0.372514, 0.9490196, 1, 0, 1,
-0.9956559, 1.841588, 0.3709538, 0.945098, 1, 0, 1,
-0.9934373, 0.6956009, -2.051955, 0.9372549, 1, 0, 1,
-0.9885666, -1.167078, -3.903186, 0.9333333, 1, 0, 1,
-0.9860854, 1.019133, -0.9930155, 0.9254902, 1, 0, 1,
-0.9787804, -0.3340658, -1.216145, 0.9215686, 1, 0, 1,
-0.9730794, -0.313346, -1.675345, 0.9137255, 1, 0, 1,
-0.9719893, -1.129787, -1.939316, 0.9098039, 1, 0, 1,
-0.9687648, 1.022787, -0.3074129, 0.9019608, 1, 0, 1,
-0.9678437, 0.02633471, -2.020839, 0.8941177, 1, 0, 1,
-0.9638216, -0.7153409, -3.166453, 0.8901961, 1, 0, 1,
-0.9632277, 0.461335, -1.343063, 0.8823529, 1, 0, 1,
-0.959691, 0.8546056, -0.5916613, 0.8784314, 1, 0, 1,
-0.9465748, -2.980515, -3.946166, 0.8705882, 1, 0, 1,
-0.9451029, -1.290694, -4.220747, 0.8666667, 1, 0, 1,
-0.9435976, 0.6232982, -0.9104294, 0.8588235, 1, 0, 1,
-0.9419424, 1.096943, -1.522167, 0.854902, 1, 0, 1,
-0.9384651, 1.569041, -0.2320829, 0.8470588, 1, 0, 1,
-0.9351863, -1.334263, -1.811981, 0.8431373, 1, 0, 1,
-0.9175541, 0.9355128, 0.8435345, 0.8352941, 1, 0, 1,
-0.9099029, 2.187307, 1.287952, 0.8313726, 1, 0, 1,
-0.8923103, 0.8727369, 1.329401, 0.8235294, 1, 0, 1,
-0.8900107, -0.4533079, -2.142215, 0.8196079, 1, 0, 1,
-0.8896922, -1.006393, -3.4482, 0.8117647, 1, 0, 1,
-0.8786533, 0.7306938, -1.689158, 0.8078431, 1, 0, 1,
-0.8772787, -0.6908488, -3.007272, 0.8, 1, 0, 1,
-0.8768113, -0.00180457, -0.4266813, 0.7921569, 1, 0, 1,
-0.8731425, -0.05012086, -2.311444, 0.7882353, 1, 0, 1,
-0.8731158, 2.422606, -1.963196, 0.7803922, 1, 0, 1,
-0.8603516, 0.4874171, -3.031003, 0.7764706, 1, 0, 1,
-0.8599494, 0.1533133, -0.2998472, 0.7686275, 1, 0, 1,
-0.858455, 0.3463738, -1.683394, 0.7647059, 1, 0, 1,
-0.8574038, -0.007682498, -1.39212, 0.7568628, 1, 0, 1,
-0.8566973, -0.6160285, -1.59192, 0.7529412, 1, 0, 1,
-0.8555357, -0.3743628, -4.393996, 0.7450981, 1, 0, 1,
-0.8504034, -0.6927847, -2.476438, 0.7411765, 1, 0, 1,
-0.8479243, -0.6925809, -1.674667, 0.7333333, 1, 0, 1,
-0.8461925, -0.1615262, -1.630471, 0.7294118, 1, 0, 1,
-0.8425488, 1.121864, -0.4141371, 0.7215686, 1, 0, 1,
-0.8379002, 1.12184, 0.3652306, 0.7176471, 1, 0, 1,
-0.8371379, 0.5540679, 0.3419785, 0.7098039, 1, 0, 1,
-0.8364441, -0.3089767, -2.656221, 0.7058824, 1, 0, 1,
-0.832179, 0.02009537, -0.9709628, 0.6980392, 1, 0, 1,
-0.8310555, -0.8580878, -2.821522, 0.6901961, 1, 0, 1,
-0.8085114, 0.1555739, -0.8079349, 0.6862745, 1, 0, 1,
-0.8043843, -1.941742, -1.117304, 0.6784314, 1, 0, 1,
-0.8042991, 1.34147, -0.7027216, 0.6745098, 1, 0, 1,
-0.8005897, 1.08054, -1.503153, 0.6666667, 1, 0, 1,
-0.7972935, -1.063936, -3.489424, 0.6627451, 1, 0, 1,
-0.7947088, -0.7607775, -0.7923712, 0.654902, 1, 0, 1,
-0.7896779, -0.2683035, -2.338124, 0.6509804, 1, 0, 1,
-0.7855721, 0.03812271, 0.5328628, 0.6431373, 1, 0, 1,
-0.7844988, -0.2142427, -2.185064, 0.6392157, 1, 0, 1,
-0.7841542, 1.115616, 1.627244, 0.6313726, 1, 0, 1,
-0.7834936, -0.7917213, -3.775414, 0.627451, 1, 0, 1,
-0.7773041, 0.8451431, -0.3424511, 0.6196079, 1, 0, 1,
-0.7772295, -0.5528674, -1.826181, 0.6156863, 1, 0, 1,
-0.7687424, -1.31651, -2.687334, 0.6078432, 1, 0, 1,
-0.7622897, 0.6336104, 0.09565397, 0.6039216, 1, 0, 1,
-0.7607546, 0.4137734, -0.9804348, 0.5960785, 1, 0, 1,
-0.7530852, -0.1245962, -3.482318, 0.5882353, 1, 0, 1,
-0.7517883, 1.268535, -1.27093, 0.5843138, 1, 0, 1,
-0.7456065, -0.9294499, -3.281676, 0.5764706, 1, 0, 1,
-0.7441389, 0.4020171, -1.460212, 0.572549, 1, 0, 1,
-0.7440218, 0.7715896, -0.5147386, 0.5647059, 1, 0, 1,
-0.7381749, -0.9915647, -3.579146, 0.5607843, 1, 0, 1,
-0.7345831, -0.203484, -1.72883, 0.5529412, 1, 0, 1,
-0.7330663, 1.432656, 1.204259, 0.5490196, 1, 0, 1,
-0.7325987, 0.1672695, -1.68422, 0.5411765, 1, 0, 1,
-0.7302133, -0.8629971, -4.058926, 0.5372549, 1, 0, 1,
-0.7292347, 0.6882433, 0.1508284, 0.5294118, 1, 0, 1,
-0.7276213, -0.5903263, -2.273335, 0.5254902, 1, 0, 1,
-0.7211984, 0.7575766, -0.551322, 0.5176471, 1, 0, 1,
-0.7161486, -1.13561, -3.206067, 0.5137255, 1, 0, 1,
-0.715865, -0.8764355, -1.166658, 0.5058824, 1, 0, 1,
-0.714448, 1.294404, -1.994311, 0.5019608, 1, 0, 1,
-0.7112574, 1.442046, -0.9978288, 0.4941176, 1, 0, 1,
-0.7090137, -0.1771987, -1.731557, 0.4862745, 1, 0, 1,
-0.7084479, -0.6889347, -2.091569, 0.4823529, 1, 0, 1,
-0.7082633, 0.5185857, 1.529174, 0.4745098, 1, 0, 1,
-0.7022722, -0.9061441, -3.678286, 0.4705882, 1, 0, 1,
-0.701935, -0.3398454, -1.842309, 0.4627451, 1, 0, 1,
-0.6983016, -1.253127, -1.772019, 0.4588235, 1, 0, 1,
-0.6974595, -0.1286083, -1.346899, 0.4509804, 1, 0, 1,
-0.6971187, 1.013562, -0.668004, 0.4470588, 1, 0, 1,
-0.6968578, 0.3570418, -1.225512, 0.4392157, 1, 0, 1,
-0.6932352, 0.7068427, -0.06639403, 0.4352941, 1, 0, 1,
-0.6883334, 0.6106232, -2.108623, 0.427451, 1, 0, 1,
-0.6865865, -0.6596768, -2.50378, 0.4235294, 1, 0, 1,
-0.6710973, 1.049995, -0.3183649, 0.4156863, 1, 0, 1,
-0.6650431, 1.677048, -0.4818932, 0.4117647, 1, 0, 1,
-0.6612927, 0.8552207, 1.01795, 0.4039216, 1, 0, 1,
-0.6540722, -2.257929, -2.761137, 0.3960784, 1, 0, 1,
-0.648644, 0.1047835, -0.2633462, 0.3921569, 1, 0, 1,
-0.6476306, 1.058485, 0.1996024, 0.3843137, 1, 0, 1,
-0.6460375, -0.007154455, -3.061339, 0.3803922, 1, 0, 1,
-0.641268, -0.2169455, -1.809565, 0.372549, 1, 0, 1,
-0.6390892, -0.3415517, -2.700592, 0.3686275, 1, 0, 1,
-0.6387084, -1.833754, -3.396772, 0.3607843, 1, 0, 1,
-0.6324795, -0.2594303, -1.312452, 0.3568628, 1, 0, 1,
-0.6293406, 0.301208, -3.716092, 0.3490196, 1, 0, 1,
-0.6266826, -1.535836, -4.077171, 0.345098, 1, 0, 1,
-0.6260033, -1.036064, -0.1970921, 0.3372549, 1, 0, 1,
-0.6210207, -0.9248803, -2.272214, 0.3333333, 1, 0, 1,
-0.620854, -0.4163052, -4.595852, 0.3254902, 1, 0, 1,
-0.6187013, -0.1065735, -0.93999, 0.3215686, 1, 0, 1,
-0.61124, -0.6197532, -3.18179, 0.3137255, 1, 0, 1,
-0.6037941, -0.4910085, -1.452471, 0.3098039, 1, 0, 1,
-0.5935651, 0.6131734, -0.6386402, 0.3019608, 1, 0, 1,
-0.5926986, 2.938421, -1.082354, 0.2941177, 1, 0, 1,
-0.5881335, 2.128976, 1.216702, 0.2901961, 1, 0, 1,
-0.5878698, 1.559145, -0.6312011, 0.282353, 1, 0, 1,
-0.5866424, -0.5842039, -2.041167, 0.2784314, 1, 0, 1,
-0.5850807, 0.05721545, -0.06461632, 0.2705882, 1, 0, 1,
-0.5785257, 1.057225, 1.366099, 0.2666667, 1, 0, 1,
-0.5771279, -0.2214697, -2.066152, 0.2588235, 1, 0, 1,
-0.5741715, -2.06866, -2.575195, 0.254902, 1, 0, 1,
-0.5715526, -0.3453623, -0.6485201, 0.2470588, 1, 0, 1,
-0.568615, 2.787036, -1.46647, 0.2431373, 1, 0, 1,
-0.5682171, 0.1102144, -1.811877, 0.2352941, 1, 0, 1,
-0.5644054, 0.7987794, 0.6619982, 0.2313726, 1, 0, 1,
-0.5636479, 0.2391134, -0.3960312, 0.2235294, 1, 0, 1,
-0.5605333, 0.1241455, 0.02357071, 0.2196078, 1, 0, 1,
-0.5600132, -0.9578412, -3.477679, 0.2117647, 1, 0, 1,
-0.5564457, 0.1161769, -0.9096798, 0.2078431, 1, 0, 1,
-0.5561972, 0.03353809, -2.368188, 0.2, 1, 0, 1,
-0.5559419, 0.6094381, -0.5538417, 0.1921569, 1, 0, 1,
-0.5540957, -0.1424864, -1.160395, 0.1882353, 1, 0, 1,
-0.5505381, 0.3443148, -0.9078391, 0.1803922, 1, 0, 1,
-0.5500985, -0.5286577, -2.780018, 0.1764706, 1, 0, 1,
-0.5455639, 0.3507213, 1.349516, 0.1686275, 1, 0, 1,
-0.5439064, -1.710393, -2.316263, 0.1647059, 1, 0, 1,
-0.5411463, 1.170327, -1.650906, 0.1568628, 1, 0, 1,
-0.5349546, 0.1014482, -0.5794053, 0.1529412, 1, 0, 1,
-0.5334262, -0.2148865, -0.5994764, 0.145098, 1, 0, 1,
-0.5212822, 1.481592, -0.4960777, 0.1411765, 1, 0, 1,
-0.516321, 0.4141171, -2.209186, 0.1333333, 1, 0, 1,
-0.5137418, -1.559054, -3.647944, 0.1294118, 1, 0, 1,
-0.5127976, 1.203339, -0.2062687, 0.1215686, 1, 0, 1,
-0.5067562, 0.5916723, -2.25948, 0.1176471, 1, 0, 1,
-0.4956339, -1.392774, -3.323509, 0.1098039, 1, 0, 1,
-0.4826592, -0.4325024, -0.9805025, 0.1058824, 1, 0, 1,
-0.4822547, -0.5863626, -2.63279, 0.09803922, 1, 0, 1,
-0.4781007, 1.563538, -1.562982, 0.09019608, 1, 0, 1,
-0.4765883, -1.815687, -0.9281681, 0.08627451, 1, 0, 1,
-0.4722268, -0.1441632, -3.098242, 0.07843138, 1, 0, 1,
-0.4719481, -0.1975279, -1.186806, 0.07450981, 1, 0, 1,
-0.4717729, -0.41509, -3.4152, 0.06666667, 1, 0, 1,
-0.4679762, 1.966788, 1.010901, 0.0627451, 1, 0, 1,
-0.4679013, 0.341718, -1.036485, 0.05490196, 1, 0, 1,
-0.4647701, 1.072554, 0.5267203, 0.05098039, 1, 0, 1,
-0.4588531, 0.3461772, -1.684575, 0.04313726, 1, 0, 1,
-0.4578369, 0.9712217, -0.7120147, 0.03921569, 1, 0, 1,
-0.4557104, -0.3325934, -0.4796956, 0.03137255, 1, 0, 1,
-0.451384, -1.207133, -3.192212, 0.02745098, 1, 0, 1,
-0.4494547, -0.1179464, -1.675073, 0.01960784, 1, 0, 1,
-0.4382465, -0.2245656, -1.849181, 0.01568628, 1, 0, 1,
-0.4366547, 0.9292909, -1.513385, 0.007843138, 1, 0, 1,
-0.4331518, 1.108915, -1.676344, 0.003921569, 1, 0, 1,
-0.4324082, -0.8369014, -2.091031, 0, 1, 0.003921569, 1,
-0.4303227, -1.987725, -2.328012, 0, 1, 0.01176471, 1,
-0.4290067, -0.0414432, -0.05607666, 0, 1, 0.01568628, 1,
-0.4281369, -0.8858632, -1.71356, 0, 1, 0.02352941, 1,
-0.4272453, 0.3241408, 0.6251864, 0, 1, 0.02745098, 1,
-0.4211228, -0.5473952, -3.165589, 0, 1, 0.03529412, 1,
-0.419549, 0.662443, -1.325372, 0, 1, 0.03921569, 1,
-0.4107153, 2.152235, -0.1783856, 0, 1, 0.04705882, 1,
-0.4065127, 1.38685, -0.7585495, 0, 1, 0.05098039, 1,
-0.404867, 0.951125, 0.0650484, 0, 1, 0.05882353, 1,
-0.4042143, 1.176748, -1.925772, 0, 1, 0.0627451, 1,
-0.3994825, -1.698409, -2.804266, 0, 1, 0.07058824, 1,
-0.3986467, -0.208458, -1.422259, 0, 1, 0.07450981, 1,
-0.3951987, 0.2057058, -1.761651, 0, 1, 0.08235294, 1,
-0.3936448, -0.9799377, -1.68241, 0, 1, 0.08627451, 1,
-0.3888385, -0.2650097, 0.03129197, 0, 1, 0.09411765, 1,
-0.3886946, -1.30616, -1.856907, 0, 1, 0.1019608, 1,
-0.3874819, -0.3064058, -2.33487, 0, 1, 0.1058824, 1,
-0.3820218, -0.5784352, -3.674551, 0, 1, 0.1137255, 1,
-0.3787337, -0.77248, -1.539273, 0, 1, 0.1176471, 1,
-0.3771029, -1.102454, -3.367739, 0, 1, 0.1254902, 1,
-0.3766531, -0.4183458, -3.351693, 0, 1, 0.1294118, 1,
-0.3731489, -1.058004, -3.474472, 0, 1, 0.1372549, 1,
-0.3729809, -0.3117236, -4.564009, 0, 1, 0.1411765, 1,
-0.3689706, -1.67497, -3.099572, 0, 1, 0.1490196, 1,
-0.3684181, -0.719009, -3.702404, 0, 1, 0.1529412, 1,
-0.3675252, -0.2066192, -1.004256, 0, 1, 0.1607843, 1,
-0.3666285, -1.032825, -3.03316, 0, 1, 0.1647059, 1,
-0.3603877, 0.1414515, -0.2960153, 0, 1, 0.172549, 1,
-0.3593696, -1.329768, -3.932974, 0, 1, 0.1764706, 1,
-0.357653, -1.520726, -3.273192, 0, 1, 0.1843137, 1,
-0.355776, 1.702011, 1.000618, 0, 1, 0.1882353, 1,
-0.3533987, 0.8807217, 0.2629649, 0, 1, 0.1960784, 1,
-0.3525655, 1.211761, 0.7224372, 0, 1, 0.2039216, 1,
-0.3525607, 0.8117271, -2.190257, 0, 1, 0.2078431, 1,
-0.3492265, 0.8202615, -0.3970863, 0, 1, 0.2156863, 1,
-0.3461908, -0.8744193, -3.405781, 0, 1, 0.2196078, 1,
-0.3458353, 0.4596528, -0.8952439, 0, 1, 0.227451, 1,
-0.3424416, 2.828139, -0.6692824, 0, 1, 0.2313726, 1,
-0.3326426, -0.3078563, -2.084238, 0, 1, 0.2392157, 1,
-0.3214636, -2.291087, -2.994597, 0, 1, 0.2431373, 1,
-0.3200831, -0.2706155, -3.295364, 0, 1, 0.2509804, 1,
-0.3192572, -1.136179, -1.891225, 0, 1, 0.254902, 1,
-0.3169865, -1.477611, -2.21992, 0, 1, 0.2627451, 1,
-0.3163499, 0.9452902, 0.03144369, 0, 1, 0.2666667, 1,
-0.3162831, -0.3930801, -1.55837, 0, 1, 0.2745098, 1,
-0.3110976, 0.1215618, -1.354009, 0, 1, 0.2784314, 1,
-0.3096427, 0.4360821, -1.540891, 0, 1, 0.2862745, 1,
-0.3091708, 1.840726, -3.178113, 0, 1, 0.2901961, 1,
-0.3088496, -0.2973177, -3.322674, 0, 1, 0.2980392, 1,
-0.3075013, 0.5069721, -2.375998, 0, 1, 0.3058824, 1,
-0.3074974, -0.09344999, -1.656759, 0, 1, 0.3098039, 1,
-0.3067832, -0.4438529, -2.907795, 0, 1, 0.3176471, 1,
-0.3025994, -0.4999998, -2.400465, 0, 1, 0.3215686, 1,
-0.3024509, -1.218358, -1.409332, 0, 1, 0.3294118, 1,
-0.300495, -0.6531628, -2.390033, 0, 1, 0.3333333, 1,
-0.2985339, 0.9597225, 1.306188, 0, 1, 0.3411765, 1,
-0.2983613, 0.6025741, -0.5023246, 0, 1, 0.345098, 1,
-0.2962431, -0.7717482, -3.018418, 0, 1, 0.3529412, 1,
-0.2961259, 1.55461, 1.680871, 0, 1, 0.3568628, 1,
-0.2956052, -1.633181, -3.605389, 0, 1, 0.3647059, 1,
-0.294981, 0.7357211, -1.43767, 0, 1, 0.3686275, 1,
-0.2934763, 0.2215908, -1.485931, 0, 1, 0.3764706, 1,
-0.292722, 0.2564951, -1.986228, 0, 1, 0.3803922, 1,
-0.2920167, 0.7017151, 0.2984159, 0, 1, 0.3882353, 1,
-0.2856588, -0.7951222, -3.551766, 0, 1, 0.3921569, 1,
-0.284524, -1.320134, -1.246719, 0, 1, 0.4, 1,
-0.2801255, -1.161097, -2.65616, 0, 1, 0.4078431, 1,
-0.2791637, 0.3925893, -0.9870819, 0, 1, 0.4117647, 1,
-0.2750212, 0.2010916, -1.688039, 0, 1, 0.4196078, 1,
-0.2738434, -0.993411, -3.914957, 0, 1, 0.4235294, 1,
-0.2706801, 0.8946938, -0.8374193, 0, 1, 0.4313726, 1,
-0.2701051, 1.43424, -0.1836812, 0, 1, 0.4352941, 1,
-0.26678, -0.6416317, -2.516916, 0, 1, 0.4431373, 1,
-0.2640847, -0.4844461, -3.427988, 0, 1, 0.4470588, 1,
-0.2580305, -0.1996331, -3.267621, 0, 1, 0.454902, 1,
-0.257445, -0.547754, -2.871307, 0, 1, 0.4588235, 1,
-0.2522559, -1.030402, -2.287518, 0, 1, 0.4666667, 1,
-0.2490632, 0.9472099, -1.100111, 0, 1, 0.4705882, 1,
-0.2438494, 0.865195, -0.3239168, 0, 1, 0.4784314, 1,
-0.2413199, -1.731154, -2.832657, 0, 1, 0.4823529, 1,
-0.2388205, 2.435718, 0.5275351, 0, 1, 0.4901961, 1,
-0.2335359, -0.1225304, -2.088558, 0, 1, 0.4941176, 1,
-0.2281196, 1.253214, -0.04968281, 0, 1, 0.5019608, 1,
-0.2272245, -0.3234235, -3.090242, 0, 1, 0.509804, 1,
-0.226011, 0.8914765, 0.4496611, 0, 1, 0.5137255, 1,
-0.2237145, 1.4936, -0.6869251, 0, 1, 0.5215687, 1,
-0.2223031, 0.2303459, -0.05845468, 0, 1, 0.5254902, 1,
-0.22188, 1.430633, 0.4949775, 0, 1, 0.5333334, 1,
-0.2186498, -2.120097, -3.039417, 0, 1, 0.5372549, 1,
-0.218026, -0.1209246, -2.406843, 0, 1, 0.5450981, 1,
-0.2134329, -0.3889553, -3.059387, 0, 1, 0.5490196, 1,
-0.210653, 0.6191768, 0.3072235, 0, 1, 0.5568628, 1,
-0.2106106, 0.1669225, -0.3424311, 0, 1, 0.5607843, 1,
-0.208206, 0.2329793, 0.6079156, 0, 1, 0.5686275, 1,
-0.2076585, 0.04393601, -0.7797448, 0, 1, 0.572549, 1,
-0.2074374, 1.030247, -0.2021685, 0, 1, 0.5803922, 1,
-0.2071753, -1.076311, -3.117557, 0, 1, 0.5843138, 1,
-0.2071391, -0.5464628, -3.117058, 0, 1, 0.5921569, 1,
-0.1981015, -1.029799, -3.77209, 0, 1, 0.5960785, 1,
-0.1968517, 0.7288865, 0.4126267, 0, 1, 0.6039216, 1,
-0.1928642, -0.3780337, -2.602956, 0, 1, 0.6117647, 1,
-0.1891024, -0.5322524, -2.725183, 0, 1, 0.6156863, 1,
-0.1855031, 0.3014612, -0.2080469, 0, 1, 0.6235294, 1,
-0.1833879, -0.8333309, -3.338612, 0, 1, 0.627451, 1,
-0.181662, -0.3321879, -4.30867, 0, 1, 0.6352941, 1,
-0.1794134, -0.9592271, -3.279827, 0, 1, 0.6392157, 1,
-0.1791366, -1.024758, -3.354717, 0, 1, 0.6470588, 1,
-0.1781397, -0.8155345, -2.931466, 0, 1, 0.6509804, 1,
-0.1763218, -0.7075101, -2.684746, 0, 1, 0.6588235, 1,
-0.1732704, -0.5170908, -3.37823, 0, 1, 0.6627451, 1,
-0.1729002, 0.2247289, -1.310011, 0, 1, 0.6705883, 1,
-0.1727862, 0.518313, 0.1362392, 0, 1, 0.6745098, 1,
-0.1683154, -0.6108053, -1.376947, 0, 1, 0.682353, 1,
-0.1676194, -0.6472781, -3.143326, 0, 1, 0.6862745, 1,
-0.1627235, 0.2741683, -2.053243, 0, 1, 0.6941177, 1,
-0.1602478, 0.4007168, -0.6261216, 0, 1, 0.7019608, 1,
-0.1587666, 1.539066, 0.7956037, 0, 1, 0.7058824, 1,
-0.1525688, 0.8271865, -0.3138752, 0, 1, 0.7137255, 1,
-0.1518566, 0.1261464, -1.716318, 0, 1, 0.7176471, 1,
-0.1511536, 0.1756274, 0.2892475, 0, 1, 0.7254902, 1,
-0.1500461, 0.02483844, -0.8330734, 0, 1, 0.7294118, 1,
-0.1468702, 1.510916, -1.822709, 0, 1, 0.7372549, 1,
-0.145987, 1.430426, -1.325138, 0, 1, 0.7411765, 1,
-0.1431588, -1.323634, -3.160714, 0, 1, 0.7490196, 1,
-0.1423027, -0.1837801, -3.189218, 0, 1, 0.7529412, 1,
-0.1279674, 0.3702508, -1.185585, 0, 1, 0.7607843, 1,
-0.1242816, 0.1182593, -0.6437725, 0, 1, 0.7647059, 1,
-0.1195853, -0.6028706, -4.320148, 0, 1, 0.772549, 1,
-0.1174947, -0.8123137, -3.423616, 0, 1, 0.7764706, 1,
-0.1156257, 0.7705424, -0.1751744, 0, 1, 0.7843137, 1,
-0.1118065, 0.1005028, -1.084268, 0, 1, 0.7882353, 1,
-0.1114976, -1.277744, -2.197641, 0, 1, 0.7960784, 1,
-0.1112465, 0.1050864, -1.786181, 0, 1, 0.8039216, 1,
-0.1097427, 0.8195606, -1.062668, 0, 1, 0.8078431, 1,
-0.1018595, 1.344852, 0.2310094, 0, 1, 0.8156863, 1,
-0.09859463, -1.710934, -2.240115, 0, 1, 0.8196079, 1,
-0.09634486, 0.2813032, 0.8199187, 0, 1, 0.827451, 1,
-0.0954033, 0.09783068, -2.262267, 0, 1, 0.8313726, 1,
-0.09517659, 0.4520447, -0.5080947, 0, 1, 0.8392157, 1,
-0.09507455, 0.1068326, 1.164061, 0, 1, 0.8431373, 1,
-0.08939916, -1.751382, -3.677327, 0, 1, 0.8509804, 1,
-0.08523948, 1.672814, 0.203281, 0, 1, 0.854902, 1,
-0.08246038, -1.975665, -1.606744, 0, 1, 0.8627451, 1,
-0.07503753, 0.2375237, 1.885851, 0, 1, 0.8666667, 1,
-0.07474257, -1.181416, -2.19267, 0, 1, 0.8745098, 1,
-0.06974433, -1.04784, -3.959612, 0, 1, 0.8784314, 1,
-0.06618889, 0.326059, 0.1874572, 0, 1, 0.8862745, 1,
-0.06571075, 0.1983117, -1.211772, 0, 1, 0.8901961, 1,
-0.06271978, 0.5679294, -0.4992591, 0, 1, 0.8980392, 1,
-0.06191938, 1.68137, -0.1712491, 0, 1, 0.9058824, 1,
-0.06172679, 0.04858202, 0.7341744, 0, 1, 0.9098039, 1,
-0.0614936, -0.3703715, -2.720829, 0, 1, 0.9176471, 1,
-0.05891727, 0.2785935, 0.7868205, 0, 1, 0.9215686, 1,
-0.05743104, -0.9509751, -2.546243, 0, 1, 0.9294118, 1,
-0.05374663, -0.1967089, -4.450051, 0, 1, 0.9333333, 1,
-0.05276787, -0.9929063, -4.041039, 0, 1, 0.9411765, 1,
-0.05187261, 0.2867354, -0.4772001, 0, 1, 0.945098, 1,
-0.04962224, 1.629476, -0.08693728, 0, 1, 0.9529412, 1,
-0.04394991, 0.3898511, 0.004130856, 0, 1, 0.9568627, 1,
-0.0431944, 0.9475583, 0.008980181, 0, 1, 0.9647059, 1,
-0.03982688, -0.8044055, -1.759908, 0, 1, 0.9686275, 1,
-0.03524371, 0.2678504, -0.7994443, 0, 1, 0.9764706, 1,
-0.03197066, 0.2615007, -1.210561, 0, 1, 0.9803922, 1,
-0.02853977, 0.06287253, -0.9304665, 0, 1, 0.9882353, 1,
-0.02321546, 0.8650714, -0.2607973, 0, 1, 0.9921569, 1,
-0.02308294, 0.4251465, -0.2945219, 0, 1, 1, 1,
-0.02306541, 1.054961, 0.8646237, 0, 0.9921569, 1, 1,
-0.01428114, -1.859431, -2.040082, 0, 0.9882353, 1, 1,
-0.01021243, -0.680077, -2.074638, 0, 0.9803922, 1, 1,
-0.002583422, 1.27393, 0.05256762, 0, 0.9764706, 1, 1,
0.000176649, -1.055557, 0.6039065, 0, 0.9686275, 1, 1,
0.01081511, -0.3799967, 2.26256, 0, 0.9647059, 1, 1,
0.0163145, -1.281641, 2.10433, 0, 0.9568627, 1, 1,
0.01856965, 2.32311, -0.03669084, 0, 0.9529412, 1, 1,
0.02034088, 0.6400367, 0.4208552, 0, 0.945098, 1, 1,
0.02508449, 1.580181, 0.9422175, 0, 0.9411765, 1, 1,
0.02833999, 2.014285, 0.2836426, 0, 0.9333333, 1, 1,
0.02836317, -0.3506208, 4.521645, 0, 0.9294118, 1, 1,
0.02969113, -1.401273, 3.102652, 0, 0.9215686, 1, 1,
0.03214949, 0.7882119, 0.443689, 0, 0.9176471, 1, 1,
0.0339204, 0.1038063, 2.003523, 0, 0.9098039, 1, 1,
0.03790218, 1.464692, -0.7118492, 0, 0.9058824, 1, 1,
0.03826601, -1.001085, 4.118595, 0, 0.8980392, 1, 1,
0.03999985, 0.8781982, -0.08758295, 0, 0.8901961, 1, 1,
0.04407909, 1.032106, -0.5641921, 0, 0.8862745, 1, 1,
0.04748071, 2.057614, 1.050906, 0, 0.8784314, 1, 1,
0.05190087, 0.1677332, 1.15398, 0, 0.8745098, 1, 1,
0.05246484, 1.054266, -0.6613538, 0, 0.8666667, 1, 1,
0.05312198, 0.009830478, 1.361554, 0, 0.8627451, 1, 1,
0.05537574, 1.548147, 0.2234684, 0, 0.854902, 1, 1,
0.05556119, -0.3582102, 3.832673, 0, 0.8509804, 1, 1,
0.0586873, 0.683489, -2.238875, 0, 0.8431373, 1, 1,
0.0594529, -0.5063509, 3.091519, 0, 0.8392157, 1, 1,
0.06115702, -0.9864476, 2.473325, 0, 0.8313726, 1, 1,
0.06203235, 2.123778, 1.228546, 0, 0.827451, 1, 1,
0.06435913, -0.05406884, 2.687369, 0, 0.8196079, 1, 1,
0.06522619, -0.6052345, 2.339785, 0, 0.8156863, 1, 1,
0.06565619, -0.4837314, 2.593972, 0, 0.8078431, 1, 1,
0.06841299, -0.8459616, 3.530655, 0, 0.8039216, 1, 1,
0.0689123, 0.5952647, -0.2615447, 0, 0.7960784, 1, 1,
0.07131231, -1.281922, 3.481776, 0, 0.7882353, 1, 1,
0.07614401, -0.2031496, 3.454824, 0, 0.7843137, 1, 1,
0.07676259, -0.4524965, 2.258173, 0, 0.7764706, 1, 1,
0.07848509, 0.1406337, -0.1412802, 0, 0.772549, 1, 1,
0.07977303, 2.0804, 0.2432511, 0, 0.7647059, 1, 1,
0.08533484, -0.5084785, 3.090672, 0, 0.7607843, 1, 1,
0.08723597, -1.371149, 3.775018, 0, 0.7529412, 1, 1,
0.08948983, 0.2826335, 1.113966, 0, 0.7490196, 1, 1,
0.08963933, -1.403642, 3.988133, 0, 0.7411765, 1, 1,
0.09124507, 0.7740656, 2.008451, 0, 0.7372549, 1, 1,
0.09207515, -2.170634, 2.664158, 0, 0.7294118, 1, 1,
0.09507282, 1.176387, 1.67725, 0, 0.7254902, 1, 1,
0.09639753, 0.2941652, 0.644865, 0, 0.7176471, 1, 1,
0.09697587, 1.22898, 0.6415166, 0, 0.7137255, 1, 1,
0.09774643, -0.5189679, 2.620062, 0, 0.7058824, 1, 1,
0.09839828, -0.7499998, 4.233562, 0, 0.6980392, 1, 1,
0.1002285, -1.339852, 2.475342, 0, 0.6941177, 1, 1,
0.1032272, 1.128508, 0.07790695, 0, 0.6862745, 1, 1,
0.1065091, 1.344523, -1.110534, 0, 0.682353, 1, 1,
0.1084241, -0.6870028, 3.100017, 0, 0.6745098, 1, 1,
0.1106186, 1.573001, 0.01495836, 0, 0.6705883, 1, 1,
0.1108481, 0.7734089, -0.8034081, 0, 0.6627451, 1, 1,
0.1174365, 0.5208257, 2.881464, 0, 0.6588235, 1, 1,
0.1240266, 1.197177, -0.8675093, 0, 0.6509804, 1, 1,
0.1249221, -0.4882877, 3.82372, 0, 0.6470588, 1, 1,
0.1270374, -0.009787718, 1.932411, 0, 0.6392157, 1, 1,
0.1314812, -0.4507896, 3.894967, 0, 0.6352941, 1, 1,
0.1352582, -0.8243706, 2.328961, 0, 0.627451, 1, 1,
0.1389813, -0.849305, 3.255548, 0, 0.6235294, 1, 1,
0.1423682, -0.05140856, 2.640996, 0, 0.6156863, 1, 1,
0.1431541, -1.853215, 3.453403, 0, 0.6117647, 1, 1,
0.1434147, 1.782575, 1.286264, 0, 0.6039216, 1, 1,
0.1455168, -1.007857, 2.603275, 0, 0.5960785, 1, 1,
0.1467523, -0.009105849, 3.450734, 0, 0.5921569, 1, 1,
0.1518456, 0.4741666, -0.6436957, 0, 0.5843138, 1, 1,
0.154722, 1.119381, -0.1474396, 0, 0.5803922, 1, 1,
0.1585275, -0.8200331, 3.533646, 0, 0.572549, 1, 1,
0.1665484, 3.357411, -1.927627, 0, 0.5686275, 1, 1,
0.1670859, 0.8545871, 1.968626, 0, 0.5607843, 1, 1,
0.1692397, -1.133105, 4.144091, 0, 0.5568628, 1, 1,
0.1750963, 1.19873, 0.8569329, 0, 0.5490196, 1, 1,
0.1777442, 0.2143708, 0.5299399, 0, 0.5450981, 1, 1,
0.1850997, -0.1848487, 2.687428, 0, 0.5372549, 1, 1,
0.1891806, -0.2983206, 3.338621, 0, 0.5333334, 1, 1,
0.1908138, 0.6771314, 0.877018, 0, 0.5254902, 1, 1,
0.1928198, -0.08545767, 1.740545, 0, 0.5215687, 1, 1,
0.1950841, 1.843391, -0.8456994, 0, 0.5137255, 1, 1,
0.1954776, -0.7183232, 3.43627, 0, 0.509804, 1, 1,
0.2039783, 0.2198752, 0.6804596, 0, 0.5019608, 1, 1,
0.207626, -0.3666684, 3.282982, 0, 0.4941176, 1, 1,
0.2090942, -0.1096789, 1.072725, 0, 0.4901961, 1, 1,
0.2137761, 0.03069551, 1.333094, 0, 0.4823529, 1, 1,
0.2192985, -0.984911, 3.612031, 0, 0.4784314, 1, 1,
0.2219893, 0.5879666, -2.134734, 0, 0.4705882, 1, 1,
0.2226095, -0.7966492, 3.250225, 0, 0.4666667, 1, 1,
0.2286553, 0.4580867, -0.3667175, 0, 0.4588235, 1, 1,
0.2325168, 0.009141978, 1.918377, 0, 0.454902, 1, 1,
0.2332706, 0.1457419, 0.4285703, 0, 0.4470588, 1, 1,
0.2357118, -0.7206296, 3.359538, 0, 0.4431373, 1, 1,
0.2359224, 0.5028182, -0.8028857, 0, 0.4352941, 1, 1,
0.2395732, -0.7305853, 2.005291, 0, 0.4313726, 1, 1,
0.2404821, 0.6191325, -0.7845045, 0, 0.4235294, 1, 1,
0.2419319, 0.4354579, -1.634709, 0, 0.4196078, 1, 1,
0.2461842, 0.6887597, 1.038862, 0, 0.4117647, 1, 1,
0.2474773, -0.1564815, 1.660336, 0, 0.4078431, 1, 1,
0.2535206, 0.3928173, -1.267552, 0, 0.4, 1, 1,
0.2538176, 0.6985897, -0.2249129, 0, 0.3921569, 1, 1,
0.2553303, -0.07942522, -0.4335519, 0, 0.3882353, 1, 1,
0.2563739, 1.261225, 1.730807, 0, 0.3803922, 1, 1,
0.2581286, -1.317421, 2.28151, 0, 0.3764706, 1, 1,
0.2597192, 3.222641, 0.2914895, 0, 0.3686275, 1, 1,
0.2608502, 1.031821, 0.8720552, 0, 0.3647059, 1, 1,
0.261336, -0.4909226, 2.657479, 0, 0.3568628, 1, 1,
0.2673404, -0.795744, 3.840895, 0, 0.3529412, 1, 1,
0.2706109, -0.2205681, 0.4672553, 0, 0.345098, 1, 1,
0.2724817, -1.141186, 2.571122, 0, 0.3411765, 1, 1,
0.2785833, -1.579528, 2.876433, 0, 0.3333333, 1, 1,
0.2803426, -0.5130987, 2.283278, 0, 0.3294118, 1, 1,
0.2805019, 0.0498954, 0.01792045, 0, 0.3215686, 1, 1,
0.2819562, -0.85755, 1.616272, 0, 0.3176471, 1, 1,
0.2852188, -0.07480109, 1.180237, 0, 0.3098039, 1, 1,
0.2878521, -0.6624311, 2.696074, 0, 0.3058824, 1, 1,
0.2922053, 0.1110206, 0.107438, 0, 0.2980392, 1, 1,
0.2923335, 0.08029932, 1.418129, 0, 0.2901961, 1, 1,
0.2982067, -0.1363731, 2.335308, 0, 0.2862745, 1, 1,
0.3023791, 1.316542, -0.03609628, 0, 0.2784314, 1, 1,
0.3045238, -0.05556329, 2.234486, 0, 0.2745098, 1, 1,
0.3085992, -0.1426144, 0.4521856, 0, 0.2666667, 1, 1,
0.3130772, -0.5689155, 3.155475, 0, 0.2627451, 1, 1,
0.3244961, -1.21573, 2.626166, 0, 0.254902, 1, 1,
0.3251501, 0.02515109, 1.14624, 0, 0.2509804, 1, 1,
0.3255429, -1.192105, 2.688765, 0, 0.2431373, 1, 1,
0.3316643, -0.2630835, 2.349806, 0, 0.2392157, 1, 1,
0.3375695, 1.214292, 2.245285, 0, 0.2313726, 1, 1,
0.3426568, -1.748056, 4.324287, 0, 0.227451, 1, 1,
0.3507627, -1.367715, 4.833712, 0, 0.2196078, 1, 1,
0.3526782, -1.550351, 4.831599, 0, 0.2156863, 1, 1,
0.354256, -1.099418, 3.62209, 0, 0.2078431, 1, 1,
0.3550791, 0.5497743, 1.556665, 0, 0.2039216, 1, 1,
0.3564635, 2.08835, -0.3225331, 0, 0.1960784, 1, 1,
0.3576274, -2.163472, 2.223815, 0, 0.1882353, 1, 1,
0.3595978, 1.947966, 0.6929119, 0, 0.1843137, 1, 1,
0.3615376, 0.9991214, 1.475452, 0, 0.1764706, 1, 1,
0.3658141, 0.5269744, 0.3185513, 0, 0.172549, 1, 1,
0.3683958, 0.9996489, 0.3656861, 0, 0.1647059, 1, 1,
0.3707323, -0.7247991, 0.715179, 0, 0.1607843, 1, 1,
0.3740454, -0.9073868, 3.223261, 0, 0.1529412, 1, 1,
0.3778557, 0.3022441, 0.3187616, 0, 0.1490196, 1, 1,
0.379644, 0.222064, 0.1184443, 0, 0.1411765, 1, 1,
0.3799316, -0.3058779, 1.01449, 0, 0.1372549, 1, 1,
0.3812998, 0.6663292, 0.3068147, 0, 0.1294118, 1, 1,
0.3822285, -2.156671, 1.456407, 0, 0.1254902, 1, 1,
0.3845896, -0.3237416, 3.935761, 0, 0.1176471, 1, 1,
0.3851948, -0.165808, 3.352518, 0, 0.1137255, 1, 1,
0.3953786, -1.463808, 4.177593, 0, 0.1058824, 1, 1,
0.3994066, 0.6882358, 1.673792, 0, 0.09803922, 1, 1,
0.4012801, 1.153584, 0.7839355, 0, 0.09411765, 1, 1,
0.4014379, 0.2505671, 1.445945, 0, 0.08627451, 1, 1,
0.4019493, -0.337065, 3.270574, 0, 0.08235294, 1, 1,
0.4032608, 0.415809, -0.2039115, 0, 0.07450981, 1, 1,
0.403692, -0.323276, 4.087502, 0, 0.07058824, 1, 1,
0.4038776, -0.6859989, 2.69794, 0, 0.0627451, 1, 1,
0.4078039, 0.69374, 1.053928, 0, 0.05882353, 1, 1,
0.4080518, 1.076476, 0.4733637, 0, 0.05098039, 1, 1,
0.4176343, -0.264088, 3.300421, 0, 0.04705882, 1, 1,
0.4301348, 0.353921, -0.1413255, 0, 0.03921569, 1, 1,
0.43233, -1.77896, 4.53457, 0, 0.03529412, 1, 1,
0.4335839, 0.9410663, -0.06638578, 0, 0.02745098, 1, 1,
0.4352646, 0.5113762, 0.7968283, 0, 0.02352941, 1, 1,
0.4369242, 1.152386, -1.597146, 0, 0.01568628, 1, 1,
0.4377334, -1.233762, 1.856616, 0, 0.01176471, 1, 1,
0.4378147, 1.225832, 0.6498662, 0, 0.003921569, 1, 1,
0.4414025, -0.3108405, 0.4523912, 0.003921569, 0, 1, 1,
0.4421303, -0.01540496, 1.274224, 0.007843138, 0, 1, 1,
0.4424066, 0.09592976, 1.689495, 0.01568628, 0, 1, 1,
0.4454306, -0.2520414, 1.207522, 0.01960784, 0, 1, 1,
0.4478208, 1.63401, -0.2205778, 0.02745098, 0, 1, 1,
0.4482675, 0.648208, -0.2302684, 0.03137255, 0, 1, 1,
0.4591301, 1.462776, 1.326011, 0.03921569, 0, 1, 1,
0.460467, 0.7013215, 1.804419, 0.04313726, 0, 1, 1,
0.4604933, -0.1716745, 0.6883745, 0.05098039, 0, 1, 1,
0.4641451, -3.113511, 2.191538, 0.05490196, 0, 1, 1,
0.4672442, 0.6427018, 0.5418857, 0.0627451, 0, 1, 1,
0.4750432, 1.27765, -1.280506, 0.06666667, 0, 1, 1,
0.4781254, -0.03875165, 0.08382696, 0.07450981, 0, 1, 1,
0.4784375, 0.419343, 2.052382, 0.07843138, 0, 1, 1,
0.4805835, 0.8228998, -0.6989835, 0.08627451, 0, 1, 1,
0.487157, 1.535805, -0.4420608, 0.09019608, 0, 1, 1,
0.4914806, 0.7949828, -0.1925675, 0.09803922, 0, 1, 1,
0.491609, -1.138873, 3.558885, 0.1058824, 0, 1, 1,
0.4928054, 0.2118791, 2.673339, 0.1098039, 0, 1, 1,
0.4933028, -0.02517774, 1.945454, 0.1176471, 0, 1, 1,
0.494034, 1.240729, 0.6064111, 0.1215686, 0, 1, 1,
0.4947498, -0.7125039, 1.551961, 0.1294118, 0, 1, 1,
0.4987947, 1.584664, -0.8221575, 0.1333333, 0, 1, 1,
0.5022954, -0.878234, 2.403193, 0.1411765, 0, 1, 1,
0.5036125, -1.391462, 3.469525, 0.145098, 0, 1, 1,
0.5038494, -0.634839, 2.867763, 0.1529412, 0, 1, 1,
0.5055991, 0.3853537, 2.620184, 0.1568628, 0, 1, 1,
0.5102074, -0.7954808, 1.225186, 0.1647059, 0, 1, 1,
0.5103254, 1.585426, 0.8511812, 0.1686275, 0, 1, 1,
0.5113308, -0.6753472, 2.614416, 0.1764706, 0, 1, 1,
0.516587, -0.2135302, 2.147005, 0.1803922, 0, 1, 1,
0.5166647, -0.6040618, 1.469628, 0.1882353, 0, 1, 1,
0.5246991, -0.1975259, 1.73846, 0.1921569, 0, 1, 1,
0.5302262, 0.3914989, 0.9747861, 0.2, 0, 1, 1,
0.5303417, -0.2688133, 2.845653, 0.2078431, 0, 1, 1,
0.5307508, -1.451915, 3.831427, 0.2117647, 0, 1, 1,
0.5328342, 1.12728, 0.8388154, 0.2196078, 0, 1, 1,
0.5328726, -0.02227319, -0.2094104, 0.2235294, 0, 1, 1,
0.5348248, 0.5924083, 2.066675, 0.2313726, 0, 1, 1,
0.5349404, 0.04626978, 0.3459951, 0.2352941, 0, 1, 1,
0.5370298, 0.04655368, 1.507186, 0.2431373, 0, 1, 1,
0.5371742, -0.056969, 3.014519, 0.2470588, 0, 1, 1,
0.5371888, -0.4945264, 1.431324, 0.254902, 0, 1, 1,
0.5384483, 2.1751, -0.5562029, 0.2588235, 0, 1, 1,
0.5386285, -0.2084158, 0.9096219, 0.2666667, 0, 1, 1,
0.5404122, -0.4291286, 1.030881, 0.2705882, 0, 1, 1,
0.5444241, -0.9009204, 1.835083, 0.2784314, 0, 1, 1,
0.545562, 0.9480065, 1.530856, 0.282353, 0, 1, 1,
0.5541874, -0.04098605, 1.342297, 0.2901961, 0, 1, 1,
0.5646643, -0.5386845, 2.943292, 0.2941177, 0, 1, 1,
0.5678535, -0.2306202, 2.365022, 0.3019608, 0, 1, 1,
0.5734835, -0.4775013, 2.095429, 0.3098039, 0, 1, 1,
0.573577, 0.5046362, 0.3889585, 0.3137255, 0, 1, 1,
0.5792626, 0.6961001, 0.5891752, 0.3215686, 0, 1, 1,
0.5795731, -0.8908312, 1.870086, 0.3254902, 0, 1, 1,
0.5823607, 0.02208729, 1.013915, 0.3333333, 0, 1, 1,
0.582516, 0.883695, 1.121068, 0.3372549, 0, 1, 1,
0.5962356, 0.4309745, -0.3973904, 0.345098, 0, 1, 1,
0.5966572, 0.6279613, -0.5390994, 0.3490196, 0, 1, 1,
0.5994489, -0.858772, 4.556715, 0.3568628, 0, 1, 1,
0.6152152, 0.3494161, 0.3954281, 0.3607843, 0, 1, 1,
0.6176041, -0.5226899, 3.377231, 0.3686275, 0, 1, 1,
0.6178032, 0.9592841, 0.9205333, 0.372549, 0, 1, 1,
0.6185686, 0.1693094, 2.062974, 0.3803922, 0, 1, 1,
0.6224376, -1.600561, 2.37875, 0.3843137, 0, 1, 1,
0.6232805, 0.1558614, 1.135011, 0.3921569, 0, 1, 1,
0.6247368, 0.8587683, 0.6735554, 0.3960784, 0, 1, 1,
0.6248143, -0.3796488, 1.606279, 0.4039216, 0, 1, 1,
0.6261848, -0.6661724, 1.275332, 0.4117647, 0, 1, 1,
0.6299456, 0.0278239, 2.249772, 0.4156863, 0, 1, 1,
0.6330284, -0.8495004, 2.721899, 0.4235294, 0, 1, 1,
0.6333339, -0.3658324, 1.653879, 0.427451, 0, 1, 1,
0.6346235, -0.9209983, 2.233681, 0.4352941, 0, 1, 1,
0.6388756, 0.4958844, 2.414824, 0.4392157, 0, 1, 1,
0.6413718, 0.02570036, 1.12186, 0.4470588, 0, 1, 1,
0.6415638, 0.7241477, -0.4107668, 0.4509804, 0, 1, 1,
0.6435922, -0.8413164, 2.29529, 0.4588235, 0, 1, 1,
0.6441734, -0.6167608, 1.071275, 0.4627451, 0, 1, 1,
0.6464832, -0.6242732, 1.934197, 0.4705882, 0, 1, 1,
0.6559854, -1.298315, 2.931869, 0.4745098, 0, 1, 1,
0.66138, 1.367186, -0.9332037, 0.4823529, 0, 1, 1,
0.6631604, 0.9856946, 0.09536123, 0.4862745, 0, 1, 1,
0.6644306, 0.6013421, 0.8666991, 0.4941176, 0, 1, 1,
0.6698087, -0.759002, 0.74106, 0.5019608, 0, 1, 1,
0.6736878, 1.796942, -1.466916, 0.5058824, 0, 1, 1,
0.6763818, 2.154498, 0.158561, 0.5137255, 0, 1, 1,
0.677106, -0.3743293, 0.7350695, 0.5176471, 0, 1, 1,
0.6821783, -1.035337, 0.9641278, 0.5254902, 0, 1, 1,
0.6918831, 0.5841573, 0.9715574, 0.5294118, 0, 1, 1,
0.6949396, 1.176361, -0.1563655, 0.5372549, 0, 1, 1,
0.6964445, -0.5230291, 2.632238, 0.5411765, 0, 1, 1,
0.6976309, 0.2392769, 3.041376, 0.5490196, 0, 1, 1,
0.6987338, 2.379308, 0.2570128, 0.5529412, 0, 1, 1,
0.7007101, 1.092151, 1.061124, 0.5607843, 0, 1, 1,
0.7102327, -0.9570136, 2.188712, 0.5647059, 0, 1, 1,
0.7117572, 1.237573, 0.1054908, 0.572549, 0, 1, 1,
0.7121135, -0.01938875, 3.564842, 0.5764706, 0, 1, 1,
0.7127773, 0.3203244, 1.66026, 0.5843138, 0, 1, 1,
0.7156858, 0.9512883, 0.2188245, 0.5882353, 0, 1, 1,
0.7208663, -0.6044099, 1.028921, 0.5960785, 0, 1, 1,
0.7225685, -2.476563, 2.153437, 0.6039216, 0, 1, 1,
0.7238389, -0.6319806, 2.48138, 0.6078432, 0, 1, 1,
0.7244657, 0.9811839, 0.7775882, 0.6156863, 0, 1, 1,
0.7277091, 0.4443556, 0.4512659, 0.6196079, 0, 1, 1,
0.7285162, 0.1030532, 1.399818, 0.627451, 0, 1, 1,
0.7314402, -0.7098876, 1.895647, 0.6313726, 0, 1, 1,
0.732101, 0.6036295, 0.9670309, 0.6392157, 0, 1, 1,
0.7426577, -0.7738805, 1.975108, 0.6431373, 0, 1, 1,
0.7436386, 0.7104918, 2.59834, 0.6509804, 0, 1, 1,
0.743956, -0.2937021, 3.083555, 0.654902, 0, 1, 1,
0.7450762, 1.122138, 1.802017, 0.6627451, 0, 1, 1,
0.7452887, -0.132616, 1.021113, 0.6666667, 0, 1, 1,
0.75285, 1.988449, -0.0587479, 0.6745098, 0, 1, 1,
0.7532688, -0.2126207, 1.086592, 0.6784314, 0, 1, 1,
0.7556055, -1.490978, 2.197928, 0.6862745, 0, 1, 1,
0.7563756, 1.658117, 0.364853, 0.6901961, 0, 1, 1,
0.7572621, 0.5219658, 0.009861949, 0.6980392, 0, 1, 1,
0.7573718, 0.1024272, 3.311655, 0.7058824, 0, 1, 1,
0.7588159, 0.002407725, 0.7955292, 0.7098039, 0, 1, 1,
0.7595814, -0.519482, 1.730684, 0.7176471, 0, 1, 1,
0.7610699, 0.3896734, 0.6318276, 0.7215686, 0, 1, 1,
0.7659804, 1.032436, 0.3598168, 0.7294118, 0, 1, 1,
0.7685213, 0.4768634, -0.05015884, 0.7333333, 0, 1, 1,
0.7706208, 0.279292, -0.3908167, 0.7411765, 0, 1, 1,
0.7715262, 0.09722889, 1.600326, 0.7450981, 0, 1, 1,
0.7764068, -0.2711615, 1.766724, 0.7529412, 0, 1, 1,
0.7811754, -0.9194514, 3.41945, 0.7568628, 0, 1, 1,
0.7908626, 1.005998, 0.7988675, 0.7647059, 0, 1, 1,
0.7915502, -0.321912, 1.458739, 0.7686275, 0, 1, 1,
0.7960311, 0.05183128, 1.882265, 0.7764706, 0, 1, 1,
0.797235, -0.5440503, 3.950429, 0.7803922, 0, 1, 1,
0.8007299, -0.3495932, 1.579721, 0.7882353, 0, 1, 1,
0.8024536, -0.1125937, -0.09357458, 0.7921569, 0, 1, 1,
0.805492, 1.05913, -0.2899572, 0.8, 0, 1, 1,
0.8072215, 2.049074, 2.175309, 0.8078431, 0, 1, 1,
0.810614, 0.4375676, 1.783804, 0.8117647, 0, 1, 1,
0.8107876, 0.6860777, 1.199028, 0.8196079, 0, 1, 1,
0.8108363, -0.1783925, 3.060457, 0.8235294, 0, 1, 1,
0.8275294, -0.2126354, 3.224504, 0.8313726, 0, 1, 1,
0.83208, 1.102233, 2.576261, 0.8352941, 0, 1, 1,
0.8329423, 0.2071523, 0.8924462, 0.8431373, 0, 1, 1,
0.8372286, -0.3365771, 1.115065, 0.8470588, 0, 1, 1,
0.837659, -1.093278, 4.008437, 0.854902, 0, 1, 1,
0.8427922, -0.09014188, 0.6345191, 0.8588235, 0, 1, 1,
0.8485663, 0.04801491, 2.17769, 0.8666667, 0, 1, 1,
0.8510094, -0.7116759, 1.82162, 0.8705882, 0, 1, 1,
0.8535924, 1.148115, -0.2556346, 0.8784314, 0, 1, 1,
0.8617082, -0.2217118, 1.54765, 0.8823529, 0, 1, 1,
0.8625559, -0.9808297, 3.403335, 0.8901961, 0, 1, 1,
0.8679609, 0.6583746, 2.541039, 0.8941177, 0, 1, 1,
0.8684986, 0.1087849, 1.662826, 0.9019608, 0, 1, 1,
0.8705338, -0.8697208, 2.446627, 0.9098039, 0, 1, 1,
0.8766425, 0.3321263, 0.6905549, 0.9137255, 0, 1, 1,
0.8797166, 0.1919511, 2.616636, 0.9215686, 0, 1, 1,
0.8836603, -0.5432293, 2.266181, 0.9254902, 0, 1, 1,
0.8836666, 1.167108, 0.08112434, 0.9333333, 0, 1, 1,
0.8911351, 1.223196, 1.82204, 0.9372549, 0, 1, 1,
0.9075922, 1.055925, 0.4329913, 0.945098, 0, 1, 1,
0.9096017, -0.2017478, 1.946842, 0.9490196, 0, 1, 1,
0.9158123, 1.129008, -0.6645757, 0.9568627, 0, 1, 1,
0.9165826, 1.227889, -1.117628, 0.9607843, 0, 1, 1,
0.9167836, -0.05717248, 1.748103, 0.9686275, 0, 1, 1,
0.9178776, 0.6800789, 0.4915006, 0.972549, 0, 1, 1,
0.9219129, 0.324342, 1.287075, 0.9803922, 0, 1, 1,
0.9257776, 0.1683796, 0.9225639, 0.9843137, 0, 1, 1,
0.9273723, -0.7812742, 1.780269, 0.9921569, 0, 1, 1,
0.9274403, 1.573628, 0.1531297, 0.9960784, 0, 1, 1,
0.9320015, 0.389496, 3.040394, 1, 0, 0.9960784, 1,
0.9327682, 1.604832, 1.046269, 1, 0, 0.9882353, 1,
0.9336123, -1.469923, 2.868405, 1, 0, 0.9843137, 1,
0.9353071, 0.5150943, 1.200513, 1, 0, 0.9764706, 1,
0.9452281, 0.378119, 2.270334, 1, 0, 0.972549, 1,
0.9457979, 0.4763651, 1.576105, 1, 0, 0.9647059, 1,
0.9472587, -1.455687, 3.672613, 1, 0, 0.9607843, 1,
0.947388, 0.03457578, 0.8207251, 1, 0, 0.9529412, 1,
0.9503784, 0.5521271, 2.622512, 1, 0, 0.9490196, 1,
0.9505191, -1.436033, 0.9433039, 1, 0, 0.9411765, 1,
0.9536458, -1.590652, 2.932336, 1, 0, 0.9372549, 1,
0.965403, -0.6723875, 4.16567, 1, 0, 0.9294118, 1,
0.9672748, 0.07934931, 1.833253, 1, 0, 0.9254902, 1,
0.9681929, -0.7786235, 3.400357, 1, 0, 0.9176471, 1,
0.9731252, -2.017747, 3.784733, 1, 0, 0.9137255, 1,
0.9798115, 0.4510822, 1.197888, 1, 0, 0.9058824, 1,
0.9820794, -1.54778, 2.818343, 1, 0, 0.9019608, 1,
0.9870319, 0.03768726, 0.6577578, 1, 0, 0.8941177, 1,
0.9958916, 0.4975179, 0.9362332, 1, 0, 0.8862745, 1,
0.9962841, -0.196057, 1.670187, 1, 0, 0.8823529, 1,
0.9969959, -0.404028, 2.036237, 1, 0, 0.8745098, 1,
0.9990239, 0.06564677, 0.09155327, 1, 0, 0.8705882, 1,
0.9996313, -0.130978, 0.6229403, 1, 0, 0.8627451, 1,
1.008325, 0.8108464, 0.004109782, 1, 0, 0.8588235, 1,
1.011562, -0.7904495, 3.32779, 1, 0, 0.8509804, 1,
1.019075, -0.3611251, 0.6909706, 1, 0, 0.8470588, 1,
1.024785, -0.8321366, 0.4466997, 1, 0, 0.8392157, 1,
1.027548, -0.4709079, 1.816808, 1, 0, 0.8352941, 1,
1.035189, 1.728515, 1.138497, 1, 0, 0.827451, 1,
1.035483, 0.3344533, 2.409026, 1, 0, 0.8235294, 1,
1.035868, 0.7794176, -0.5801131, 1, 0, 0.8156863, 1,
1.039093, 1.093438, 2.468423, 1, 0, 0.8117647, 1,
1.047822, 1.833292, 2.252763, 1, 0, 0.8039216, 1,
1.052436, -1.003503, 2.294609, 1, 0, 0.7960784, 1,
1.052696, 0.2508784, 0.5039288, 1, 0, 0.7921569, 1,
1.052922, 1.695341, 1.112301, 1, 0, 0.7843137, 1,
1.055308, 0.7747362, -0.3410137, 1, 0, 0.7803922, 1,
1.06571, -0.4247723, 1.350278, 1, 0, 0.772549, 1,
1.067281, 0.1379661, 0.1630882, 1, 0, 0.7686275, 1,
1.069198, -0.06887756, 0.4677024, 1, 0, 0.7607843, 1,
1.072901, 0.5681602, 0.014253, 1, 0, 0.7568628, 1,
1.073699, -0.06247435, 2.366978, 1, 0, 0.7490196, 1,
1.077872, -1.272784, 2.836545, 1, 0, 0.7450981, 1,
1.082214, 1.437047, 1.759508, 1, 0, 0.7372549, 1,
1.08598, -0.9255991, 2.211989, 1, 0, 0.7333333, 1,
1.094026, 0.2723415, 0.9015459, 1, 0, 0.7254902, 1,
1.098403, 0.5638644, 0.7504516, 1, 0, 0.7215686, 1,
1.100111, 0.6855865, 1.64302, 1, 0, 0.7137255, 1,
1.101176, 1.35828, 1.340245, 1, 0, 0.7098039, 1,
1.10204, -0.5715175, 2.372193, 1, 0, 0.7019608, 1,
1.106298, -1.101602, 2.659332, 1, 0, 0.6941177, 1,
1.106799, 0.3193087, 1.429889, 1, 0, 0.6901961, 1,
1.114122, -1.425935, 2.119962, 1, 0, 0.682353, 1,
1.123399, 1.396485, 1.866768, 1, 0, 0.6784314, 1,
1.127299, 0.6778094, -0.1849784, 1, 0, 0.6705883, 1,
1.14351, -1.347612, 2.922505, 1, 0, 0.6666667, 1,
1.147002, 0.8194951, 0.04644074, 1, 0, 0.6588235, 1,
1.149449, 0.08837485, 4.1968, 1, 0, 0.654902, 1,
1.153461, 1.746478, -0.1401666, 1, 0, 0.6470588, 1,
1.156127, 0.1541173, 1.571625, 1, 0, 0.6431373, 1,
1.157874, -0.06562272, 1.887483, 1, 0, 0.6352941, 1,
1.163206, -0.6521065, 0.3959959, 1, 0, 0.6313726, 1,
1.163939, -1.073335, 2.608781, 1, 0, 0.6235294, 1,
1.165613, 0.05348119, 2.023674, 1, 0, 0.6196079, 1,
1.16747, -0.08073056, 2.050555, 1, 0, 0.6117647, 1,
1.181465, 0.6859645, 0.1445408, 1, 0, 0.6078432, 1,
1.182803, -0.3333828, 1.83968, 1, 0, 0.6, 1,
1.183089, 1.887197, -1.266386, 1, 0, 0.5921569, 1,
1.184473, -0.2960328, 1.39599, 1, 0, 0.5882353, 1,
1.187156, -0.8831913, 1.84943, 1, 0, 0.5803922, 1,
1.189963, 1.527088, 0.4221476, 1, 0, 0.5764706, 1,
1.191593, -0.8573789, 3.725463, 1, 0, 0.5686275, 1,
1.195572, -1.393549, 1.474025, 1, 0, 0.5647059, 1,
1.199898, 0.312422, 2.562536, 1, 0, 0.5568628, 1,
1.205205, -0.2004263, 1.002283, 1, 0, 0.5529412, 1,
1.219075, 0.6759661, 0.1386083, 1, 0, 0.5450981, 1,
1.220793, -0.3846535, 1.562461, 1, 0, 0.5411765, 1,
1.229977, 1.704782, -0.2410466, 1, 0, 0.5333334, 1,
1.230891, 0.4053749, 2.290732, 1, 0, 0.5294118, 1,
1.232035, 0.9684587, -1.326344, 1, 0, 0.5215687, 1,
1.232699, 1.057321, 0.7072014, 1, 0, 0.5176471, 1,
1.238107, 0.1557247, 1.123274, 1, 0, 0.509804, 1,
1.241499, 0.6836968, 3.885707, 1, 0, 0.5058824, 1,
1.248084, -0.5383667, 3.268813, 1, 0, 0.4980392, 1,
1.250215, 1.47693, 2.883159, 1, 0, 0.4901961, 1,
1.261668, 0.3291466, 0.9325532, 1, 0, 0.4862745, 1,
1.264461, 6.34864e-05, 0.6177916, 1, 0, 0.4784314, 1,
1.267466, 0.6561638, 1.432491, 1, 0, 0.4745098, 1,
1.273556, -0.2454647, 3.416412, 1, 0, 0.4666667, 1,
1.27373, -2.428901, 2.752121, 1, 0, 0.4627451, 1,
1.278618, 0.001893217, 1.981234, 1, 0, 0.454902, 1,
1.283434, 0.1519776, 0.3836246, 1, 0, 0.4509804, 1,
1.285171, 0.1941041, 2.429303, 1, 0, 0.4431373, 1,
1.290557, -0.1942435, 0.4859112, 1, 0, 0.4392157, 1,
1.298349, -0.604754, 2.150464, 1, 0, 0.4313726, 1,
1.301806, 0.6003726, 1.149423, 1, 0, 0.427451, 1,
1.306467, 0.006204517, 2.200937, 1, 0, 0.4196078, 1,
1.307701, 0.5306746, 2.081225, 1, 0, 0.4156863, 1,
1.318409, 1.410679, -0.5125216, 1, 0, 0.4078431, 1,
1.32043, 0.1517592, 0.9667906, 1, 0, 0.4039216, 1,
1.33834, 2.835172, -1.2647, 1, 0, 0.3960784, 1,
1.343632, -1.470984, 3.323546, 1, 0, 0.3882353, 1,
1.380068, -0.3469483, 1.706439, 1, 0, 0.3843137, 1,
1.382299, 1.14334, 1.008844, 1, 0, 0.3764706, 1,
1.393629, -0.6996071, 0.8306945, 1, 0, 0.372549, 1,
1.3965, 1.043719, 0.5605649, 1, 0, 0.3647059, 1,
1.405653, 0.05099652, 1.057362, 1, 0, 0.3607843, 1,
1.410969, 0.3646957, 0.6903532, 1, 0, 0.3529412, 1,
1.421574, -0.1098103, 1.839247, 1, 0, 0.3490196, 1,
1.425238, -0.01986497, 2.561443, 1, 0, 0.3411765, 1,
1.434182, 1.374175, 1.5015, 1, 0, 0.3372549, 1,
1.443698, 0.6807642, 1.20942, 1, 0, 0.3294118, 1,
1.450788, -0.9998011, 2.245595, 1, 0, 0.3254902, 1,
1.463109, -0.8350756, 3.308332, 1, 0, 0.3176471, 1,
1.472946, 1.443541, 1.272749, 1, 0, 0.3137255, 1,
1.476576, 1.097655, 0.7167687, 1, 0, 0.3058824, 1,
1.490176, -1.244642, 3.275681, 1, 0, 0.2980392, 1,
1.510194, -1.986482, 1.255201, 1, 0, 0.2941177, 1,
1.510445, -0.3350664, 0.5862833, 1, 0, 0.2862745, 1,
1.538091, -0.3657554, 1.173198, 1, 0, 0.282353, 1,
1.548484, 0.5733975, 1.296854, 1, 0, 0.2745098, 1,
1.553124, -0.9748016, 2.810387, 1, 0, 0.2705882, 1,
1.555479, 0.1383197, 2.030415, 1, 0, 0.2627451, 1,
1.576118, -0.476229, 1.822424, 1, 0, 0.2588235, 1,
1.604857, 0.4687608, 1.66314, 1, 0, 0.2509804, 1,
1.613556, -0.8765641, 2.617604, 1, 0, 0.2470588, 1,
1.626522, -0.8250323, 1.834053, 1, 0, 0.2392157, 1,
1.631603, -1.072248, 1.807057, 1, 0, 0.2352941, 1,
1.634225, -0.1473111, 1.779114, 1, 0, 0.227451, 1,
1.641105, 0.8528039, 2.628741, 1, 0, 0.2235294, 1,
1.646181, -0.002325369, 1.446595, 1, 0, 0.2156863, 1,
1.662467, 0.3783255, 1.702482, 1, 0, 0.2117647, 1,
1.691283, 0.1151298, 1.91965, 1, 0, 0.2039216, 1,
1.702246, -0.4240169, 0.1249005, 1, 0, 0.1960784, 1,
1.7144, -0.1430292, 0.8153068, 1, 0, 0.1921569, 1,
1.72643, -0.39201, 2.233832, 1, 0, 0.1843137, 1,
1.733828, 0.6309149, 1.270775, 1, 0, 0.1803922, 1,
1.755567, 0.5050745, 0.5124808, 1, 0, 0.172549, 1,
1.764927, -0.4820011, 4.163198, 1, 0, 0.1686275, 1,
1.771188, -0.939679, 1.097452, 1, 0, 0.1607843, 1,
1.802293, -2.410333, 2.122416, 1, 0, 0.1568628, 1,
1.808567, -0.540244, 2.859687, 1, 0, 0.1490196, 1,
1.832405, -1.498424, 3.623733, 1, 0, 0.145098, 1,
1.859202, 1.018709, 2.907992, 1, 0, 0.1372549, 1,
1.864002, 0.7158957, 1.096927, 1, 0, 0.1333333, 1,
1.868643, -0.3671836, 1.751039, 1, 0, 0.1254902, 1,
1.887043, -0.07267939, -0.2334205, 1, 0, 0.1215686, 1,
1.9141, 0.3084762, 2.800972, 1, 0, 0.1137255, 1,
1.93848, -0.3117684, 2.785573, 1, 0, 0.1098039, 1,
1.957106, 0.8775212, 1.988161, 1, 0, 0.1019608, 1,
1.967936, 0.7313471, 1.343584, 1, 0, 0.09411765, 1,
2.007093, 0.5763015, 1.035923, 1, 0, 0.09019608, 1,
2.047639, 1.250607, 0.8582708, 1, 0, 0.08235294, 1,
2.05965, -0.5200284, 0.6178235, 1, 0, 0.07843138, 1,
2.108539, -0.5402333, 1.896269, 1, 0, 0.07058824, 1,
2.118651, 0.01297364, 0.8355722, 1, 0, 0.06666667, 1,
2.152269, -0.2211485, 1.636374, 1, 0, 0.05882353, 1,
2.188901, 0.3552203, 2.279619, 1, 0, 0.05490196, 1,
2.188977, -0.1113136, 1.820054, 1, 0, 0.04705882, 1,
2.256417, 0.1886552, 0.8639159, 1, 0, 0.04313726, 1,
2.268698, -0.5576527, 1.507252, 1, 0, 0.03529412, 1,
2.416332, 0.8003702, 1.619586, 1, 0, 0.03137255, 1,
2.43184, 1.090119, -0.7812042, 1, 0, 0.02352941, 1,
2.507377, -0.42492, 1.913038, 1, 0, 0.01960784, 1,
2.61737, -0.7573723, 2.553734, 1, 0, 0.01176471, 1,
2.780681, -0.9259698, 2.016753, 1, 0, 0.007843138, 1
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
-0.3065633, -4.210332, -6.194163, 0, -0.5, 0.5, 0.5,
-0.3065633, -4.210332, -6.194163, 1, -0.5, 0.5, 0.5,
-0.3065633, -4.210332, -6.194163, 1, 1.5, 0.5, 0.5,
-0.3065633, -4.210332, -6.194163, 0, 1.5, 0.5, 0.5
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
-4.440384, 0.1219499, -6.194163, 0, -0.5, 0.5, 0.5,
-4.440384, 0.1219499, -6.194163, 1, -0.5, 0.5, 0.5,
-4.440384, 0.1219499, -6.194163, 1, 1.5, 0.5, 0.5,
-4.440384, 0.1219499, -6.194163, 0, 1.5, 0.5, 0.5
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
-4.440384, -4.210332, 0.1189299, 0, -0.5, 0.5, 0.5,
-4.440384, -4.210332, 0.1189299, 1, -0.5, 0.5, 0.5,
-4.440384, -4.210332, 0.1189299, 1, 1.5, 0.5, 0.5,
-4.440384, -4.210332, 0.1189299, 0, 1.5, 0.5, 0.5
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
-3, -3.210575, -4.737295,
2, -3.210575, -4.737295,
-3, -3.210575, -4.737295,
-3, -3.377201, -4.980107,
-2, -3.210575, -4.737295,
-2, -3.377201, -4.980107,
-1, -3.210575, -4.737295,
-1, -3.377201, -4.980107,
0, -3.210575, -4.737295,
0, -3.377201, -4.980107,
1, -3.210575, -4.737295,
1, -3.377201, -4.980107,
2, -3.210575, -4.737295,
2, -3.377201, -4.980107
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
-3, -3.710453, -5.465729, 0, -0.5, 0.5, 0.5,
-3, -3.710453, -5.465729, 1, -0.5, 0.5, 0.5,
-3, -3.710453, -5.465729, 1, 1.5, 0.5, 0.5,
-3, -3.710453, -5.465729, 0, 1.5, 0.5, 0.5,
-2, -3.710453, -5.465729, 0, -0.5, 0.5, 0.5,
-2, -3.710453, -5.465729, 1, -0.5, 0.5, 0.5,
-2, -3.710453, -5.465729, 1, 1.5, 0.5, 0.5,
-2, -3.710453, -5.465729, 0, 1.5, 0.5, 0.5,
-1, -3.710453, -5.465729, 0, -0.5, 0.5, 0.5,
-1, -3.710453, -5.465729, 1, -0.5, 0.5, 0.5,
-1, -3.710453, -5.465729, 1, 1.5, 0.5, 0.5,
-1, -3.710453, -5.465729, 0, 1.5, 0.5, 0.5,
0, -3.710453, -5.465729, 0, -0.5, 0.5, 0.5,
0, -3.710453, -5.465729, 1, -0.5, 0.5, 0.5,
0, -3.710453, -5.465729, 1, 1.5, 0.5, 0.5,
0, -3.710453, -5.465729, 0, 1.5, 0.5, 0.5,
1, -3.710453, -5.465729, 0, -0.5, 0.5, 0.5,
1, -3.710453, -5.465729, 1, -0.5, 0.5, 0.5,
1, -3.710453, -5.465729, 1, 1.5, 0.5, 0.5,
1, -3.710453, -5.465729, 0, 1.5, 0.5, 0.5,
2, -3.710453, -5.465729, 0, -0.5, 0.5, 0.5,
2, -3.710453, -5.465729, 1, -0.5, 0.5, 0.5,
2, -3.710453, -5.465729, 1, 1.5, 0.5, 0.5,
2, -3.710453, -5.465729, 0, 1.5, 0.5, 0.5
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
-3.486425, -3, -4.737295,
-3.486425, 3, -4.737295,
-3.486425, -3, -4.737295,
-3.645418, -3, -4.980107,
-3.486425, -2, -4.737295,
-3.645418, -2, -4.980107,
-3.486425, -1, -4.737295,
-3.645418, -1, -4.980107,
-3.486425, 0, -4.737295,
-3.645418, 0, -4.980107,
-3.486425, 1, -4.737295,
-3.645418, 1, -4.980107,
-3.486425, 2, -4.737295,
-3.645418, 2, -4.980107,
-3.486425, 3, -4.737295,
-3.645418, 3, -4.980107
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
-3.963404, -3, -5.465729, 0, -0.5, 0.5, 0.5,
-3.963404, -3, -5.465729, 1, -0.5, 0.5, 0.5,
-3.963404, -3, -5.465729, 1, 1.5, 0.5, 0.5,
-3.963404, -3, -5.465729, 0, 1.5, 0.5, 0.5,
-3.963404, -2, -5.465729, 0, -0.5, 0.5, 0.5,
-3.963404, -2, -5.465729, 1, -0.5, 0.5, 0.5,
-3.963404, -2, -5.465729, 1, 1.5, 0.5, 0.5,
-3.963404, -2, -5.465729, 0, 1.5, 0.5, 0.5,
-3.963404, -1, -5.465729, 0, -0.5, 0.5, 0.5,
-3.963404, -1, -5.465729, 1, -0.5, 0.5, 0.5,
-3.963404, -1, -5.465729, 1, 1.5, 0.5, 0.5,
-3.963404, -1, -5.465729, 0, 1.5, 0.5, 0.5,
-3.963404, 0, -5.465729, 0, -0.5, 0.5, 0.5,
-3.963404, 0, -5.465729, 1, -0.5, 0.5, 0.5,
-3.963404, 0, -5.465729, 1, 1.5, 0.5, 0.5,
-3.963404, 0, -5.465729, 0, 1.5, 0.5, 0.5,
-3.963404, 1, -5.465729, 0, -0.5, 0.5, 0.5,
-3.963404, 1, -5.465729, 1, -0.5, 0.5, 0.5,
-3.963404, 1, -5.465729, 1, 1.5, 0.5, 0.5,
-3.963404, 1, -5.465729, 0, 1.5, 0.5, 0.5,
-3.963404, 2, -5.465729, 0, -0.5, 0.5, 0.5,
-3.963404, 2, -5.465729, 1, -0.5, 0.5, 0.5,
-3.963404, 2, -5.465729, 1, 1.5, 0.5, 0.5,
-3.963404, 2, -5.465729, 0, 1.5, 0.5, 0.5,
-3.963404, 3, -5.465729, 0, -0.5, 0.5, 0.5,
-3.963404, 3, -5.465729, 1, -0.5, 0.5, 0.5,
-3.963404, 3, -5.465729, 1, 1.5, 0.5, 0.5,
-3.963404, 3, -5.465729, 0, 1.5, 0.5, 0.5
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
-3.486425, -3.210575, -4,
-3.486425, -3.210575, 4,
-3.486425, -3.210575, -4,
-3.645418, -3.377201, -4,
-3.486425, -3.210575, -2,
-3.645418, -3.377201, -2,
-3.486425, -3.210575, 0,
-3.645418, -3.377201, 0,
-3.486425, -3.210575, 2,
-3.645418, -3.377201, 2,
-3.486425, -3.210575, 4,
-3.645418, -3.377201, 4
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
-3.963404, -3.710453, -4, 0, -0.5, 0.5, 0.5,
-3.963404, -3.710453, -4, 1, -0.5, 0.5, 0.5,
-3.963404, -3.710453, -4, 1, 1.5, 0.5, 0.5,
-3.963404, -3.710453, -4, 0, 1.5, 0.5, 0.5,
-3.963404, -3.710453, -2, 0, -0.5, 0.5, 0.5,
-3.963404, -3.710453, -2, 1, -0.5, 0.5, 0.5,
-3.963404, -3.710453, -2, 1, 1.5, 0.5, 0.5,
-3.963404, -3.710453, -2, 0, 1.5, 0.5, 0.5,
-3.963404, -3.710453, 0, 0, -0.5, 0.5, 0.5,
-3.963404, -3.710453, 0, 1, -0.5, 0.5, 0.5,
-3.963404, -3.710453, 0, 1, 1.5, 0.5, 0.5,
-3.963404, -3.710453, 0, 0, 1.5, 0.5, 0.5,
-3.963404, -3.710453, 2, 0, -0.5, 0.5, 0.5,
-3.963404, -3.710453, 2, 1, -0.5, 0.5, 0.5,
-3.963404, -3.710453, 2, 1, 1.5, 0.5, 0.5,
-3.963404, -3.710453, 2, 0, 1.5, 0.5, 0.5,
-3.963404, -3.710453, 4, 0, -0.5, 0.5, 0.5,
-3.963404, -3.710453, 4, 1, -0.5, 0.5, 0.5,
-3.963404, -3.710453, 4, 1, 1.5, 0.5, 0.5,
-3.963404, -3.710453, 4, 0, 1.5, 0.5, 0.5
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
-3.486425, -3.210575, -4.737295,
-3.486425, 3.454474, -4.737295,
-3.486425, -3.210575, 4.975155,
-3.486425, 3.454474, 4.975155,
-3.486425, -3.210575, -4.737295,
-3.486425, -3.210575, 4.975155,
-3.486425, 3.454474, -4.737295,
-3.486425, 3.454474, 4.975155,
-3.486425, -3.210575, -4.737295,
2.873299, -3.210575, -4.737295,
-3.486425, -3.210575, 4.975155,
2.873299, -3.210575, 4.975155,
-3.486425, 3.454474, -4.737295,
2.873299, 3.454474, -4.737295,
-3.486425, 3.454474, 4.975155,
2.873299, 3.454474, 4.975155,
2.873299, -3.210575, -4.737295,
2.873299, 3.454474, -4.737295,
2.873299, -3.210575, 4.975155,
2.873299, 3.454474, 4.975155,
2.873299, -3.210575, -4.737295,
2.873299, -3.210575, 4.975155,
2.873299, 3.454474, -4.737295,
2.873299, 3.454474, 4.975155
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
var radius = 7.148176;
var distance = 31.80305;
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
mvMatrix.translate( 0.3065633, -0.1219499, -0.1189299 );
mvMatrix.scale( 1.215265, 1.159594, 0.7957568 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.80305);
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
Phostebupirim<-read.table("Phostebupirim.xyz")
```

```
## Error in read.table("Phostebupirim.xyz"): no lines available in input
```

```r
x<-Phostebupirim$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phostebupirim' not found
```

```r
y<-Phostebupirim$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phostebupirim' not found
```

```r
z<-Phostebupirim$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phostebupirim' not found
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
-3.393808, 0.9996876, -2.840266, 0, 0, 1, 1, 1,
-3.076666, 0.1048941, -2.359966, 1, 0, 0, 1, 1,
-3.011773, -0.4925902, -1.900545, 1, 0, 0, 1, 1,
-2.827427, 0.5893132, -0.7945731, 1, 0, 0, 1, 1,
-2.578432, -0.7157404, -1.19697, 1, 0, 0, 1, 1,
-2.542111, -1.315906, -1.804107, 1, 0, 0, 1, 1,
-2.507538, -0.4150593, -1.636029, 0, 0, 0, 1, 1,
-2.490215, -0.08504739, -0.9604328, 0, 0, 0, 1, 1,
-2.439225, -1.062815, -2.120705, 0, 0, 0, 1, 1,
-2.438416, -1.363252, -2.148038, 0, 0, 0, 1, 1,
-2.355362, -0.8917539, -2.638184, 0, 0, 0, 1, 1,
-2.353211, 0.3086373, -2.236757, 0, 0, 0, 1, 1,
-2.342371, -0.5228904, -1.264425, 0, 0, 0, 1, 1,
-2.302032, 0.5197753, -1.412519, 1, 1, 1, 1, 1,
-2.275306, 0.3797314, -1.918924, 1, 1, 1, 1, 1,
-2.254843, 1.094738, -1.799116, 1, 1, 1, 1, 1,
-2.241974, -0.7209014, -2.104413, 1, 1, 1, 1, 1,
-2.175587, -1.156689, -0.3703909, 1, 1, 1, 1, 1,
-2.120761, -0.9371737, -3.388284, 1, 1, 1, 1, 1,
-2.10963, 1.658088, -2.308233, 1, 1, 1, 1, 1,
-2.100039, -0.8453258, -1.111896, 1, 1, 1, 1, 1,
-2.087945, -0.3259867, -2.174343, 1, 1, 1, 1, 1,
-2.069308, -0.2889171, -1.956595, 1, 1, 1, 1, 1,
-2.061254, 0.434781, -2.883729, 1, 1, 1, 1, 1,
-2.04323, 0.8063039, -2.171904, 1, 1, 1, 1, 1,
-2.026948, -1.199387, -1.889037, 1, 1, 1, 1, 1,
-2.002573, 1.728692, -0.744601, 1, 1, 1, 1, 1,
-1.974509, -2.102292, -2.872184, 1, 1, 1, 1, 1,
-1.944885, 0.7794569, -1.518974, 0, 0, 1, 1, 1,
-1.936951, 0.3203953, -0.5527256, 1, 0, 0, 1, 1,
-1.904205, 1.391394, 0.475974, 1, 0, 0, 1, 1,
-1.901643, 0.08540425, -1.384294, 1, 0, 0, 1, 1,
-1.890749, 0.0393526, -1.127455, 1, 0, 0, 1, 1,
-1.887003, -0.8923694, -3.708626, 1, 0, 0, 1, 1,
-1.884909, 0.8606529, -1.354328, 0, 0, 0, 1, 1,
-1.878007, -0.1307968, -4.109634, 0, 0, 0, 1, 1,
-1.868327, -1.120252, -1.700481, 0, 0, 0, 1, 1,
-1.860386, 0.09810553, -0.9206553, 0, 0, 0, 1, 1,
-1.85763, -1.51891, -1.71443, 0, 0, 0, 1, 1,
-1.849217, 1.253603, -0.8603602, 0, 0, 0, 1, 1,
-1.835093, 0.8326964, -1.61683, 0, 0, 0, 1, 1,
-1.821634, 2.222217, -2.618985, 1, 1, 1, 1, 1,
-1.812033, 0.07639863, -2.211081, 1, 1, 1, 1, 1,
-1.796104, 0.9150136, -1.484846, 1, 1, 1, 1, 1,
-1.768431, -1.838823, -2.395423, 1, 1, 1, 1, 1,
-1.761835, 0.07226637, -2.71204, 1, 1, 1, 1, 1,
-1.758451, 0.2667787, -1.607414, 1, 1, 1, 1, 1,
-1.75768, -1.717105, -1.073302, 1, 1, 1, 1, 1,
-1.72315, -0.5417128, -2.390051, 1, 1, 1, 1, 1,
-1.716891, 0.06521091, -2.10111, 1, 1, 1, 1, 1,
-1.707773, -0.0101957, -2.155057, 1, 1, 1, 1, 1,
-1.698238, 0.2111676, -1.907186, 1, 1, 1, 1, 1,
-1.678024, 0.007348057, -2.718411, 1, 1, 1, 1, 1,
-1.657475, 0.6843983, -0.8001975, 1, 1, 1, 1, 1,
-1.651559, -1.28799, -2.03649, 1, 1, 1, 1, 1,
-1.645885, -0.1647084, -1.854811, 1, 1, 1, 1, 1,
-1.645046, -0.5082318, -2.960911, 0, 0, 1, 1, 1,
-1.627465, -2.238, -1.943144, 1, 0, 0, 1, 1,
-1.624437, 0.5378872, -1.920086, 1, 0, 0, 1, 1,
-1.620149, -0.5294346, -2.54699, 1, 0, 0, 1, 1,
-1.610579, 0.8059086, -1.460419, 1, 0, 0, 1, 1,
-1.608288, 1.752272, -1.653308, 1, 0, 0, 1, 1,
-1.605363, -0.2789865, -0.9705194, 0, 0, 0, 1, 1,
-1.600971, -1.018517, -3.969743, 0, 0, 0, 1, 1,
-1.589415, -0.1189602, -0.600625, 0, 0, 0, 1, 1,
-1.587059, -0.7026001, -1.81118, 0, 0, 0, 1, 1,
-1.583878, -0.816506, -2.101321, 0, 0, 0, 1, 1,
-1.562141, -0.6237724, -1.77663, 0, 0, 0, 1, 1,
-1.550912, -0.5654691, -0.938315, 0, 0, 0, 1, 1,
-1.530186, 0.9736438, -3.92066, 1, 1, 1, 1, 1,
-1.515581, 0.4075271, -2.640908, 1, 1, 1, 1, 1,
-1.497026, 1.577628, 0.436289, 1, 1, 1, 1, 1,
-1.495411, 0.1219565, 1.465125, 1, 1, 1, 1, 1,
-1.492261, 0.2173665, -2.717263, 1, 1, 1, 1, 1,
-1.484336, -0.8852207, -0.8076274, 1, 1, 1, 1, 1,
-1.478879, -0.2830297, -1.700164, 1, 1, 1, 1, 1,
-1.464428, -0.5537547, -1.448821, 1, 1, 1, 1, 1,
-1.459658, 0.2485707, 0.6476926, 1, 1, 1, 1, 1,
-1.454805, -0.6669884, -2.696388, 1, 1, 1, 1, 1,
-1.453775, 1.087926, 2.250274, 1, 1, 1, 1, 1,
-1.450977, 1.357327, -1.742193, 1, 1, 1, 1, 1,
-1.449362, -0.3835169, -1.779707, 1, 1, 1, 1, 1,
-1.441653, 0.2892525, -1.344432, 1, 1, 1, 1, 1,
-1.430568, 0.2718744, -1.617125, 1, 1, 1, 1, 1,
-1.425246, 0.5624636, 0.02549607, 0, 0, 1, 1, 1,
-1.422875, -0.4347302, -1.643079, 1, 0, 0, 1, 1,
-1.417829, -0.1941938, -0.5732287, 1, 0, 0, 1, 1,
-1.404384, -1.278007, -1.966628, 1, 0, 0, 1, 1,
-1.394286, 0.9355634, -1.404486, 1, 0, 0, 1, 1,
-1.391089, -1.368282, -3.416727, 1, 0, 0, 1, 1,
-1.382114, 1.07959, -2.251133, 0, 0, 0, 1, 1,
-1.379172, 0.4022627, -1.298205, 0, 0, 0, 1, 1,
-1.374112, 0.03146747, -2.44988, 0, 0, 0, 1, 1,
-1.373115, -1.262509, -2.079652, 0, 0, 0, 1, 1,
-1.352421, 0.02909411, -1.182796, 0, 0, 0, 1, 1,
-1.3493, 0.4495798, -1.768817, 0, 0, 0, 1, 1,
-1.340298, 0.7597157, 0.1725762, 0, 0, 0, 1, 1,
-1.334923, -0.5318584, -0.9334723, 1, 1, 1, 1, 1,
-1.334679, 0.9166867, -2.020013, 1, 1, 1, 1, 1,
-1.32915, 0.1956773, -0.8342246, 1, 1, 1, 1, 1,
-1.322512, -0.615714, -2.323504, 1, 1, 1, 1, 1,
-1.317736, 1.343269, -0.01032264, 1, 1, 1, 1, 1,
-1.31554, 0.3932115, -2.612581, 1, 1, 1, 1, 1,
-1.311844, 0.6156615, -2.005282, 1, 1, 1, 1, 1,
-1.310602, 0.9202285, -0.3868985, 1, 1, 1, 1, 1,
-1.305106, 0.08686472, -2.079005, 1, 1, 1, 1, 1,
-1.300433, 0.6477728, -0.03470451, 1, 1, 1, 1, 1,
-1.298212, 0.03109962, -2.015207, 1, 1, 1, 1, 1,
-1.290332, 2.031466, 0.1064029, 1, 1, 1, 1, 1,
-1.289071, 0.1234584, -1.017875, 1, 1, 1, 1, 1,
-1.279225, -0.183863, -2.112969, 1, 1, 1, 1, 1,
-1.275227, -0.9217021, -3.482809, 1, 1, 1, 1, 1,
-1.269191, 1.426169, 0.4287499, 0, 0, 1, 1, 1,
-1.265089, -0.6484721, -0.9886636, 1, 0, 0, 1, 1,
-1.262592, 0.2714026, -0.95927, 1, 0, 0, 1, 1,
-1.259983, -0.6588709, -4.263676, 1, 0, 0, 1, 1,
-1.250203, 0.4471532, -1.777218, 1, 0, 0, 1, 1,
-1.247601, -0.7355528, -3.484231, 1, 0, 0, 1, 1,
-1.243259, 0.0638299, -1.219012, 0, 0, 0, 1, 1,
-1.241424, -0.2232318, -0.7444884, 0, 0, 0, 1, 1,
-1.237366, -0.3121338, -2.959225, 0, 0, 0, 1, 1,
-1.232445, 2.56272, -1.130189, 0, 0, 0, 1, 1,
-1.226544, -0.7246295, -3.084252, 0, 0, 0, 1, 1,
-1.212149, -0.3299772, -0.2031101, 0, 0, 0, 1, 1,
-1.209992, -0.5243481, -0.8976867, 0, 0, 0, 1, 1,
-1.2049, 2.142456, -0.9722975, 1, 1, 1, 1, 1,
-1.193155, 0.7074206, -0.3380191, 1, 1, 1, 1, 1,
-1.189628, 0.2054286, -0.515455, 1, 1, 1, 1, 1,
-1.18911, 1.339618, -2.777972, 1, 1, 1, 1, 1,
-1.185212, 1.02764, -1.763094, 1, 1, 1, 1, 1,
-1.181192, 0.2410206, -2.349878, 1, 1, 1, 1, 1,
-1.177033, 0.2249448, -1.818848, 1, 1, 1, 1, 1,
-1.173085, -0.09159123, -2.777503, 1, 1, 1, 1, 1,
-1.161702, 1.366474, -0.6026541, 1, 1, 1, 1, 1,
-1.155631, -0.7621076, -2.42238, 1, 1, 1, 1, 1,
-1.154367, 0.8768463, -2.196085, 1, 1, 1, 1, 1,
-1.151558, -1.799842, -2.516112, 1, 1, 1, 1, 1,
-1.151528, -1.693814, -1.893681, 1, 1, 1, 1, 1,
-1.148051, -0.2920365, -2.049111, 1, 1, 1, 1, 1,
-1.141457, 0.6636788, 0.002236847, 1, 1, 1, 1, 1,
-1.135582, -1.431556, -2.531654, 0, 0, 1, 1, 1,
-1.134004, -1.114335, -0.1291863, 1, 0, 0, 1, 1,
-1.121237, -0.4901556, -2.816083, 1, 0, 0, 1, 1,
-1.119191, 1.886873, -0.1461872, 1, 0, 0, 1, 1,
-1.11557, -0.2177348, 0.1683074, 1, 0, 0, 1, 1,
-1.115347, -0.3607653, -1.827153, 1, 0, 0, 1, 1,
-1.115008, -1.068415, -2.309004, 0, 0, 0, 1, 1,
-1.114693, -0.9867318, -3.652714, 0, 0, 0, 1, 1,
-1.114179, 0.7223219, -1.010725, 0, 0, 0, 1, 1,
-1.113157, -1.808275, -2.006688, 0, 0, 0, 1, 1,
-1.112242, 0.368791, -0.6569278, 0, 0, 0, 1, 1,
-1.108527, 0.1942377, -2.255025, 0, 0, 0, 1, 1,
-1.107627, -1.061149, -3.883813, 0, 0, 0, 1, 1,
-1.102214, 0.4604127, -0.9462636, 1, 1, 1, 1, 1,
-1.100329, -0.9606227, -2.43129, 1, 1, 1, 1, 1,
-1.094904, -0.354878, -1.541769, 1, 1, 1, 1, 1,
-1.094146, -0.1663227, -2.528714, 1, 1, 1, 1, 1,
-1.088224, -1.575404, -2.707717, 1, 1, 1, 1, 1,
-1.081613, 0.8420009, -0.2031536, 1, 1, 1, 1, 1,
-1.080526, -0.227006, 0.09524302, 1, 1, 1, 1, 1,
-1.075832, -1.135426, -1.167988, 1, 1, 1, 1, 1,
-1.072428, 1.012085, 0.2019813, 1, 1, 1, 1, 1,
-1.069661, 1.246151, -2.801152, 1, 1, 1, 1, 1,
-1.066967, 0.3069288, -1.152876, 1, 1, 1, 1, 1,
-1.061525, 1.197616, -0.800742, 1, 1, 1, 1, 1,
-1.057289, -1.12218, -0.6164331, 1, 1, 1, 1, 1,
-1.052245, 0.7927774, -0.8826189, 1, 1, 1, 1, 1,
-1.052214, -0.2664069, 0.160521, 1, 1, 1, 1, 1,
-1.049569, 0.2713578, -1.546644, 0, 0, 1, 1, 1,
-1.044058, 1.842247, 0.45994, 1, 0, 0, 1, 1,
-1.020942, -1.811765, -2.026341, 1, 0, 0, 1, 1,
-1.018731, 1.385424, -0.2611977, 1, 0, 0, 1, 1,
-1.008678, 0.3281277, -0.08115667, 1, 0, 0, 1, 1,
-1.001355, 0.3924893, -1.941085, 1, 0, 0, 1, 1,
-1.000779, -1.09325, -2.327813, 0, 0, 0, 1, 1,
-0.9984796, 0.6517283, 0.372514, 0, 0, 0, 1, 1,
-0.9956559, 1.841588, 0.3709538, 0, 0, 0, 1, 1,
-0.9934373, 0.6956009, -2.051955, 0, 0, 0, 1, 1,
-0.9885666, -1.167078, -3.903186, 0, 0, 0, 1, 1,
-0.9860854, 1.019133, -0.9930155, 0, 0, 0, 1, 1,
-0.9787804, -0.3340658, -1.216145, 0, 0, 0, 1, 1,
-0.9730794, -0.313346, -1.675345, 1, 1, 1, 1, 1,
-0.9719893, -1.129787, -1.939316, 1, 1, 1, 1, 1,
-0.9687648, 1.022787, -0.3074129, 1, 1, 1, 1, 1,
-0.9678437, 0.02633471, -2.020839, 1, 1, 1, 1, 1,
-0.9638216, -0.7153409, -3.166453, 1, 1, 1, 1, 1,
-0.9632277, 0.461335, -1.343063, 1, 1, 1, 1, 1,
-0.959691, 0.8546056, -0.5916613, 1, 1, 1, 1, 1,
-0.9465748, -2.980515, -3.946166, 1, 1, 1, 1, 1,
-0.9451029, -1.290694, -4.220747, 1, 1, 1, 1, 1,
-0.9435976, 0.6232982, -0.9104294, 1, 1, 1, 1, 1,
-0.9419424, 1.096943, -1.522167, 1, 1, 1, 1, 1,
-0.9384651, 1.569041, -0.2320829, 1, 1, 1, 1, 1,
-0.9351863, -1.334263, -1.811981, 1, 1, 1, 1, 1,
-0.9175541, 0.9355128, 0.8435345, 1, 1, 1, 1, 1,
-0.9099029, 2.187307, 1.287952, 1, 1, 1, 1, 1,
-0.8923103, 0.8727369, 1.329401, 0, 0, 1, 1, 1,
-0.8900107, -0.4533079, -2.142215, 1, 0, 0, 1, 1,
-0.8896922, -1.006393, -3.4482, 1, 0, 0, 1, 1,
-0.8786533, 0.7306938, -1.689158, 1, 0, 0, 1, 1,
-0.8772787, -0.6908488, -3.007272, 1, 0, 0, 1, 1,
-0.8768113, -0.00180457, -0.4266813, 1, 0, 0, 1, 1,
-0.8731425, -0.05012086, -2.311444, 0, 0, 0, 1, 1,
-0.8731158, 2.422606, -1.963196, 0, 0, 0, 1, 1,
-0.8603516, 0.4874171, -3.031003, 0, 0, 0, 1, 1,
-0.8599494, 0.1533133, -0.2998472, 0, 0, 0, 1, 1,
-0.858455, 0.3463738, -1.683394, 0, 0, 0, 1, 1,
-0.8574038, -0.007682498, -1.39212, 0, 0, 0, 1, 1,
-0.8566973, -0.6160285, -1.59192, 0, 0, 0, 1, 1,
-0.8555357, -0.3743628, -4.393996, 1, 1, 1, 1, 1,
-0.8504034, -0.6927847, -2.476438, 1, 1, 1, 1, 1,
-0.8479243, -0.6925809, -1.674667, 1, 1, 1, 1, 1,
-0.8461925, -0.1615262, -1.630471, 1, 1, 1, 1, 1,
-0.8425488, 1.121864, -0.4141371, 1, 1, 1, 1, 1,
-0.8379002, 1.12184, 0.3652306, 1, 1, 1, 1, 1,
-0.8371379, 0.5540679, 0.3419785, 1, 1, 1, 1, 1,
-0.8364441, -0.3089767, -2.656221, 1, 1, 1, 1, 1,
-0.832179, 0.02009537, -0.9709628, 1, 1, 1, 1, 1,
-0.8310555, -0.8580878, -2.821522, 1, 1, 1, 1, 1,
-0.8085114, 0.1555739, -0.8079349, 1, 1, 1, 1, 1,
-0.8043843, -1.941742, -1.117304, 1, 1, 1, 1, 1,
-0.8042991, 1.34147, -0.7027216, 1, 1, 1, 1, 1,
-0.8005897, 1.08054, -1.503153, 1, 1, 1, 1, 1,
-0.7972935, -1.063936, -3.489424, 1, 1, 1, 1, 1,
-0.7947088, -0.7607775, -0.7923712, 0, 0, 1, 1, 1,
-0.7896779, -0.2683035, -2.338124, 1, 0, 0, 1, 1,
-0.7855721, 0.03812271, 0.5328628, 1, 0, 0, 1, 1,
-0.7844988, -0.2142427, -2.185064, 1, 0, 0, 1, 1,
-0.7841542, 1.115616, 1.627244, 1, 0, 0, 1, 1,
-0.7834936, -0.7917213, -3.775414, 1, 0, 0, 1, 1,
-0.7773041, 0.8451431, -0.3424511, 0, 0, 0, 1, 1,
-0.7772295, -0.5528674, -1.826181, 0, 0, 0, 1, 1,
-0.7687424, -1.31651, -2.687334, 0, 0, 0, 1, 1,
-0.7622897, 0.6336104, 0.09565397, 0, 0, 0, 1, 1,
-0.7607546, 0.4137734, -0.9804348, 0, 0, 0, 1, 1,
-0.7530852, -0.1245962, -3.482318, 0, 0, 0, 1, 1,
-0.7517883, 1.268535, -1.27093, 0, 0, 0, 1, 1,
-0.7456065, -0.9294499, -3.281676, 1, 1, 1, 1, 1,
-0.7441389, 0.4020171, -1.460212, 1, 1, 1, 1, 1,
-0.7440218, 0.7715896, -0.5147386, 1, 1, 1, 1, 1,
-0.7381749, -0.9915647, -3.579146, 1, 1, 1, 1, 1,
-0.7345831, -0.203484, -1.72883, 1, 1, 1, 1, 1,
-0.7330663, 1.432656, 1.204259, 1, 1, 1, 1, 1,
-0.7325987, 0.1672695, -1.68422, 1, 1, 1, 1, 1,
-0.7302133, -0.8629971, -4.058926, 1, 1, 1, 1, 1,
-0.7292347, 0.6882433, 0.1508284, 1, 1, 1, 1, 1,
-0.7276213, -0.5903263, -2.273335, 1, 1, 1, 1, 1,
-0.7211984, 0.7575766, -0.551322, 1, 1, 1, 1, 1,
-0.7161486, -1.13561, -3.206067, 1, 1, 1, 1, 1,
-0.715865, -0.8764355, -1.166658, 1, 1, 1, 1, 1,
-0.714448, 1.294404, -1.994311, 1, 1, 1, 1, 1,
-0.7112574, 1.442046, -0.9978288, 1, 1, 1, 1, 1,
-0.7090137, -0.1771987, -1.731557, 0, 0, 1, 1, 1,
-0.7084479, -0.6889347, -2.091569, 1, 0, 0, 1, 1,
-0.7082633, 0.5185857, 1.529174, 1, 0, 0, 1, 1,
-0.7022722, -0.9061441, -3.678286, 1, 0, 0, 1, 1,
-0.701935, -0.3398454, -1.842309, 1, 0, 0, 1, 1,
-0.6983016, -1.253127, -1.772019, 1, 0, 0, 1, 1,
-0.6974595, -0.1286083, -1.346899, 0, 0, 0, 1, 1,
-0.6971187, 1.013562, -0.668004, 0, 0, 0, 1, 1,
-0.6968578, 0.3570418, -1.225512, 0, 0, 0, 1, 1,
-0.6932352, 0.7068427, -0.06639403, 0, 0, 0, 1, 1,
-0.6883334, 0.6106232, -2.108623, 0, 0, 0, 1, 1,
-0.6865865, -0.6596768, -2.50378, 0, 0, 0, 1, 1,
-0.6710973, 1.049995, -0.3183649, 0, 0, 0, 1, 1,
-0.6650431, 1.677048, -0.4818932, 1, 1, 1, 1, 1,
-0.6612927, 0.8552207, 1.01795, 1, 1, 1, 1, 1,
-0.6540722, -2.257929, -2.761137, 1, 1, 1, 1, 1,
-0.648644, 0.1047835, -0.2633462, 1, 1, 1, 1, 1,
-0.6476306, 1.058485, 0.1996024, 1, 1, 1, 1, 1,
-0.6460375, -0.007154455, -3.061339, 1, 1, 1, 1, 1,
-0.641268, -0.2169455, -1.809565, 1, 1, 1, 1, 1,
-0.6390892, -0.3415517, -2.700592, 1, 1, 1, 1, 1,
-0.6387084, -1.833754, -3.396772, 1, 1, 1, 1, 1,
-0.6324795, -0.2594303, -1.312452, 1, 1, 1, 1, 1,
-0.6293406, 0.301208, -3.716092, 1, 1, 1, 1, 1,
-0.6266826, -1.535836, -4.077171, 1, 1, 1, 1, 1,
-0.6260033, -1.036064, -0.1970921, 1, 1, 1, 1, 1,
-0.6210207, -0.9248803, -2.272214, 1, 1, 1, 1, 1,
-0.620854, -0.4163052, -4.595852, 1, 1, 1, 1, 1,
-0.6187013, -0.1065735, -0.93999, 0, 0, 1, 1, 1,
-0.61124, -0.6197532, -3.18179, 1, 0, 0, 1, 1,
-0.6037941, -0.4910085, -1.452471, 1, 0, 0, 1, 1,
-0.5935651, 0.6131734, -0.6386402, 1, 0, 0, 1, 1,
-0.5926986, 2.938421, -1.082354, 1, 0, 0, 1, 1,
-0.5881335, 2.128976, 1.216702, 1, 0, 0, 1, 1,
-0.5878698, 1.559145, -0.6312011, 0, 0, 0, 1, 1,
-0.5866424, -0.5842039, -2.041167, 0, 0, 0, 1, 1,
-0.5850807, 0.05721545, -0.06461632, 0, 0, 0, 1, 1,
-0.5785257, 1.057225, 1.366099, 0, 0, 0, 1, 1,
-0.5771279, -0.2214697, -2.066152, 0, 0, 0, 1, 1,
-0.5741715, -2.06866, -2.575195, 0, 0, 0, 1, 1,
-0.5715526, -0.3453623, -0.6485201, 0, 0, 0, 1, 1,
-0.568615, 2.787036, -1.46647, 1, 1, 1, 1, 1,
-0.5682171, 0.1102144, -1.811877, 1, 1, 1, 1, 1,
-0.5644054, 0.7987794, 0.6619982, 1, 1, 1, 1, 1,
-0.5636479, 0.2391134, -0.3960312, 1, 1, 1, 1, 1,
-0.5605333, 0.1241455, 0.02357071, 1, 1, 1, 1, 1,
-0.5600132, -0.9578412, -3.477679, 1, 1, 1, 1, 1,
-0.5564457, 0.1161769, -0.9096798, 1, 1, 1, 1, 1,
-0.5561972, 0.03353809, -2.368188, 1, 1, 1, 1, 1,
-0.5559419, 0.6094381, -0.5538417, 1, 1, 1, 1, 1,
-0.5540957, -0.1424864, -1.160395, 1, 1, 1, 1, 1,
-0.5505381, 0.3443148, -0.9078391, 1, 1, 1, 1, 1,
-0.5500985, -0.5286577, -2.780018, 1, 1, 1, 1, 1,
-0.5455639, 0.3507213, 1.349516, 1, 1, 1, 1, 1,
-0.5439064, -1.710393, -2.316263, 1, 1, 1, 1, 1,
-0.5411463, 1.170327, -1.650906, 1, 1, 1, 1, 1,
-0.5349546, 0.1014482, -0.5794053, 0, 0, 1, 1, 1,
-0.5334262, -0.2148865, -0.5994764, 1, 0, 0, 1, 1,
-0.5212822, 1.481592, -0.4960777, 1, 0, 0, 1, 1,
-0.516321, 0.4141171, -2.209186, 1, 0, 0, 1, 1,
-0.5137418, -1.559054, -3.647944, 1, 0, 0, 1, 1,
-0.5127976, 1.203339, -0.2062687, 1, 0, 0, 1, 1,
-0.5067562, 0.5916723, -2.25948, 0, 0, 0, 1, 1,
-0.4956339, -1.392774, -3.323509, 0, 0, 0, 1, 1,
-0.4826592, -0.4325024, -0.9805025, 0, 0, 0, 1, 1,
-0.4822547, -0.5863626, -2.63279, 0, 0, 0, 1, 1,
-0.4781007, 1.563538, -1.562982, 0, 0, 0, 1, 1,
-0.4765883, -1.815687, -0.9281681, 0, 0, 0, 1, 1,
-0.4722268, -0.1441632, -3.098242, 0, 0, 0, 1, 1,
-0.4719481, -0.1975279, -1.186806, 1, 1, 1, 1, 1,
-0.4717729, -0.41509, -3.4152, 1, 1, 1, 1, 1,
-0.4679762, 1.966788, 1.010901, 1, 1, 1, 1, 1,
-0.4679013, 0.341718, -1.036485, 1, 1, 1, 1, 1,
-0.4647701, 1.072554, 0.5267203, 1, 1, 1, 1, 1,
-0.4588531, 0.3461772, -1.684575, 1, 1, 1, 1, 1,
-0.4578369, 0.9712217, -0.7120147, 1, 1, 1, 1, 1,
-0.4557104, -0.3325934, -0.4796956, 1, 1, 1, 1, 1,
-0.451384, -1.207133, -3.192212, 1, 1, 1, 1, 1,
-0.4494547, -0.1179464, -1.675073, 1, 1, 1, 1, 1,
-0.4382465, -0.2245656, -1.849181, 1, 1, 1, 1, 1,
-0.4366547, 0.9292909, -1.513385, 1, 1, 1, 1, 1,
-0.4331518, 1.108915, -1.676344, 1, 1, 1, 1, 1,
-0.4324082, -0.8369014, -2.091031, 1, 1, 1, 1, 1,
-0.4303227, -1.987725, -2.328012, 1, 1, 1, 1, 1,
-0.4290067, -0.0414432, -0.05607666, 0, 0, 1, 1, 1,
-0.4281369, -0.8858632, -1.71356, 1, 0, 0, 1, 1,
-0.4272453, 0.3241408, 0.6251864, 1, 0, 0, 1, 1,
-0.4211228, -0.5473952, -3.165589, 1, 0, 0, 1, 1,
-0.419549, 0.662443, -1.325372, 1, 0, 0, 1, 1,
-0.4107153, 2.152235, -0.1783856, 1, 0, 0, 1, 1,
-0.4065127, 1.38685, -0.7585495, 0, 0, 0, 1, 1,
-0.404867, 0.951125, 0.0650484, 0, 0, 0, 1, 1,
-0.4042143, 1.176748, -1.925772, 0, 0, 0, 1, 1,
-0.3994825, -1.698409, -2.804266, 0, 0, 0, 1, 1,
-0.3986467, -0.208458, -1.422259, 0, 0, 0, 1, 1,
-0.3951987, 0.2057058, -1.761651, 0, 0, 0, 1, 1,
-0.3936448, -0.9799377, -1.68241, 0, 0, 0, 1, 1,
-0.3888385, -0.2650097, 0.03129197, 1, 1, 1, 1, 1,
-0.3886946, -1.30616, -1.856907, 1, 1, 1, 1, 1,
-0.3874819, -0.3064058, -2.33487, 1, 1, 1, 1, 1,
-0.3820218, -0.5784352, -3.674551, 1, 1, 1, 1, 1,
-0.3787337, -0.77248, -1.539273, 1, 1, 1, 1, 1,
-0.3771029, -1.102454, -3.367739, 1, 1, 1, 1, 1,
-0.3766531, -0.4183458, -3.351693, 1, 1, 1, 1, 1,
-0.3731489, -1.058004, -3.474472, 1, 1, 1, 1, 1,
-0.3729809, -0.3117236, -4.564009, 1, 1, 1, 1, 1,
-0.3689706, -1.67497, -3.099572, 1, 1, 1, 1, 1,
-0.3684181, -0.719009, -3.702404, 1, 1, 1, 1, 1,
-0.3675252, -0.2066192, -1.004256, 1, 1, 1, 1, 1,
-0.3666285, -1.032825, -3.03316, 1, 1, 1, 1, 1,
-0.3603877, 0.1414515, -0.2960153, 1, 1, 1, 1, 1,
-0.3593696, -1.329768, -3.932974, 1, 1, 1, 1, 1,
-0.357653, -1.520726, -3.273192, 0, 0, 1, 1, 1,
-0.355776, 1.702011, 1.000618, 1, 0, 0, 1, 1,
-0.3533987, 0.8807217, 0.2629649, 1, 0, 0, 1, 1,
-0.3525655, 1.211761, 0.7224372, 1, 0, 0, 1, 1,
-0.3525607, 0.8117271, -2.190257, 1, 0, 0, 1, 1,
-0.3492265, 0.8202615, -0.3970863, 1, 0, 0, 1, 1,
-0.3461908, -0.8744193, -3.405781, 0, 0, 0, 1, 1,
-0.3458353, 0.4596528, -0.8952439, 0, 0, 0, 1, 1,
-0.3424416, 2.828139, -0.6692824, 0, 0, 0, 1, 1,
-0.3326426, -0.3078563, -2.084238, 0, 0, 0, 1, 1,
-0.3214636, -2.291087, -2.994597, 0, 0, 0, 1, 1,
-0.3200831, -0.2706155, -3.295364, 0, 0, 0, 1, 1,
-0.3192572, -1.136179, -1.891225, 0, 0, 0, 1, 1,
-0.3169865, -1.477611, -2.21992, 1, 1, 1, 1, 1,
-0.3163499, 0.9452902, 0.03144369, 1, 1, 1, 1, 1,
-0.3162831, -0.3930801, -1.55837, 1, 1, 1, 1, 1,
-0.3110976, 0.1215618, -1.354009, 1, 1, 1, 1, 1,
-0.3096427, 0.4360821, -1.540891, 1, 1, 1, 1, 1,
-0.3091708, 1.840726, -3.178113, 1, 1, 1, 1, 1,
-0.3088496, -0.2973177, -3.322674, 1, 1, 1, 1, 1,
-0.3075013, 0.5069721, -2.375998, 1, 1, 1, 1, 1,
-0.3074974, -0.09344999, -1.656759, 1, 1, 1, 1, 1,
-0.3067832, -0.4438529, -2.907795, 1, 1, 1, 1, 1,
-0.3025994, -0.4999998, -2.400465, 1, 1, 1, 1, 1,
-0.3024509, -1.218358, -1.409332, 1, 1, 1, 1, 1,
-0.300495, -0.6531628, -2.390033, 1, 1, 1, 1, 1,
-0.2985339, 0.9597225, 1.306188, 1, 1, 1, 1, 1,
-0.2983613, 0.6025741, -0.5023246, 1, 1, 1, 1, 1,
-0.2962431, -0.7717482, -3.018418, 0, 0, 1, 1, 1,
-0.2961259, 1.55461, 1.680871, 1, 0, 0, 1, 1,
-0.2956052, -1.633181, -3.605389, 1, 0, 0, 1, 1,
-0.294981, 0.7357211, -1.43767, 1, 0, 0, 1, 1,
-0.2934763, 0.2215908, -1.485931, 1, 0, 0, 1, 1,
-0.292722, 0.2564951, -1.986228, 1, 0, 0, 1, 1,
-0.2920167, 0.7017151, 0.2984159, 0, 0, 0, 1, 1,
-0.2856588, -0.7951222, -3.551766, 0, 0, 0, 1, 1,
-0.284524, -1.320134, -1.246719, 0, 0, 0, 1, 1,
-0.2801255, -1.161097, -2.65616, 0, 0, 0, 1, 1,
-0.2791637, 0.3925893, -0.9870819, 0, 0, 0, 1, 1,
-0.2750212, 0.2010916, -1.688039, 0, 0, 0, 1, 1,
-0.2738434, -0.993411, -3.914957, 0, 0, 0, 1, 1,
-0.2706801, 0.8946938, -0.8374193, 1, 1, 1, 1, 1,
-0.2701051, 1.43424, -0.1836812, 1, 1, 1, 1, 1,
-0.26678, -0.6416317, -2.516916, 1, 1, 1, 1, 1,
-0.2640847, -0.4844461, -3.427988, 1, 1, 1, 1, 1,
-0.2580305, -0.1996331, -3.267621, 1, 1, 1, 1, 1,
-0.257445, -0.547754, -2.871307, 1, 1, 1, 1, 1,
-0.2522559, -1.030402, -2.287518, 1, 1, 1, 1, 1,
-0.2490632, 0.9472099, -1.100111, 1, 1, 1, 1, 1,
-0.2438494, 0.865195, -0.3239168, 1, 1, 1, 1, 1,
-0.2413199, -1.731154, -2.832657, 1, 1, 1, 1, 1,
-0.2388205, 2.435718, 0.5275351, 1, 1, 1, 1, 1,
-0.2335359, -0.1225304, -2.088558, 1, 1, 1, 1, 1,
-0.2281196, 1.253214, -0.04968281, 1, 1, 1, 1, 1,
-0.2272245, -0.3234235, -3.090242, 1, 1, 1, 1, 1,
-0.226011, 0.8914765, 0.4496611, 1, 1, 1, 1, 1,
-0.2237145, 1.4936, -0.6869251, 0, 0, 1, 1, 1,
-0.2223031, 0.2303459, -0.05845468, 1, 0, 0, 1, 1,
-0.22188, 1.430633, 0.4949775, 1, 0, 0, 1, 1,
-0.2186498, -2.120097, -3.039417, 1, 0, 0, 1, 1,
-0.218026, -0.1209246, -2.406843, 1, 0, 0, 1, 1,
-0.2134329, -0.3889553, -3.059387, 1, 0, 0, 1, 1,
-0.210653, 0.6191768, 0.3072235, 0, 0, 0, 1, 1,
-0.2106106, 0.1669225, -0.3424311, 0, 0, 0, 1, 1,
-0.208206, 0.2329793, 0.6079156, 0, 0, 0, 1, 1,
-0.2076585, 0.04393601, -0.7797448, 0, 0, 0, 1, 1,
-0.2074374, 1.030247, -0.2021685, 0, 0, 0, 1, 1,
-0.2071753, -1.076311, -3.117557, 0, 0, 0, 1, 1,
-0.2071391, -0.5464628, -3.117058, 0, 0, 0, 1, 1,
-0.1981015, -1.029799, -3.77209, 1, 1, 1, 1, 1,
-0.1968517, 0.7288865, 0.4126267, 1, 1, 1, 1, 1,
-0.1928642, -0.3780337, -2.602956, 1, 1, 1, 1, 1,
-0.1891024, -0.5322524, -2.725183, 1, 1, 1, 1, 1,
-0.1855031, 0.3014612, -0.2080469, 1, 1, 1, 1, 1,
-0.1833879, -0.8333309, -3.338612, 1, 1, 1, 1, 1,
-0.181662, -0.3321879, -4.30867, 1, 1, 1, 1, 1,
-0.1794134, -0.9592271, -3.279827, 1, 1, 1, 1, 1,
-0.1791366, -1.024758, -3.354717, 1, 1, 1, 1, 1,
-0.1781397, -0.8155345, -2.931466, 1, 1, 1, 1, 1,
-0.1763218, -0.7075101, -2.684746, 1, 1, 1, 1, 1,
-0.1732704, -0.5170908, -3.37823, 1, 1, 1, 1, 1,
-0.1729002, 0.2247289, -1.310011, 1, 1, 1, 1, 1,
-0.1727862, 0.518313, 0.1362392, 1, 1, 1, 1, 1,
-0.1683154, -0.6108053, -1.376947, 1, 1, 1, 1, 1,
-0.1676194, -0.6472781, -3.143326, 0, 0, 1, 1, 1,
-0.1627235, 0.2741683, -2.053243, 1, 0, 0, 1, 1,
-0.1602478, 0.4007168, -0.6261216, 1, 0, 0, 1, 1,
-0.1587666, 1.539066, 0.7956037, 1, 0, 0, 1, 1,
-0.1525688, 0.8271865, -0.3138752, 1, 0, 0, 1, 1,
-0.1518566, 0.1261464, -1.716318, 1, 0, 0, 1, 1,
-0.1511536, 0.1756274, 0.2892475, 0, 0, 0, 1, 1,
-0.1500461, 0.02483844, -0.8330734, 0, 0, 0, 1, 1,
-0.1468702, 1.510916, -1.822709, 0, 0, 0, 1, 1,
-0.145987, 1.430426, -1.325138, 0, 0, 0, 1, 1,
-0.1431588, -1.323634, -3.160714, 0, 0, 0, 1, 1,
-0.1423027, -0.1837801, -3.189218, 0, 0, 0, 1, 1,
-0.1279674, 0.3702508, -1.185585, 0, 0, 0, 1, 1,
-0.1242816, 0.1182593, -0.6437725, 1, 1, 1, 1, 1,
-0.1195853, -0.6028706, -4.320148, 1, 1, 1, 1, 1,
-0.1174947, -0.8123137, -3.423616, 1, 1, 1, 1, 1,
-0.1156257, 0.7705424, -0.1751744, 1, 1, 1, 1, 1,
-0.1118065, 0.1005028, -1.084268, 1, 1, 1, 1, 1,
-0.1114976, -1.277744, -2.197641, 1, 1, 1, 1, 1,
-0.1112465, 0.1050864, -1.786181, 1, 1, 1, 1, 1,
-0.1097427, 0.8195606, -1.062668, 1, 1, 1, 1, 1,
-0.1018595, 1.344852, 0.2310094, 1, 1, 1, 1, 1,
-0.09859463, -1.710934, -2.240115, 1, 1, 1, 1, 1,
-0.09634486, 0.2813032, 0.8199187, 1, 1, 1, 1, 1,
-0.0954033, 0.09783068, -2.262267, 1, 1, 1, 1, 1,
-0.09517659, 0.4520447, -0.5080947, 1, 1, 1, 1, 1,
-0.09507455, 0.1068326, 1.164061, 1, 1, 1, 1, 1,
-0.08939916, -1.751382, -3.677327, 1, 1, 1, 1, 1,
-0.08523948, 1.672814, 0.203281, 0, 0, 1, 1, 1,
-0.08246038, -1.975665, -1.606744, 1, 0, 0, 1, 1,
-0.07503753, 0.2375237, 1.885851, 1, 0, 0, 1, 1,
-0.07474257, -1.181416, -2.19267, 1, 0, 0, 1, 1,
-0.06974433, -1.04784, -3.959612, 1, 0, 0, 1, 1,
-0.06618889, 0.326059, 0.1874572, 1, 0, 0, 1, 1,
-0.06571075, 0.1983117, -1.211772, 0, 0, 0, 1, 1,
-0.06271978, 0.5679294, -0.4992591, 0, 0, 0, 1, 1,
-0.06191938, 1.68137, -0.1712491, 0, 0, 0, 1, 1,
-0.06172679, 0.04858202, 0.7341744, 0, 0, 0, 1, 1,
-0.0614936, -0.3703715, -2.720829, 0, 0, 0, 1, 1,
-0.05891727, 0.2785935, 0.7868205, 0, 0, 0, 1, 1,
-0.05743104, -0.9509751, -2.546243, 0, 0, 0, 1, 1,
-0.05374663, -0.1967089, -4.450051, 1, 1, 1, 1, 1,
-0.05276787, -0.9929063, -4.041039, 1, 1, 1, 1, 1,
-0.05187261, 0.2867354, -0.4772001, 1, 1, 1, 1, 1,
-0.04962224, 1.629476, -0.08693728, 1, 1, 1, 1, 1,
-0.04394991, 0.3898511, 0.004130856, 1, 1, 1, 1, 1,
-0.0431944, 0.9475583, 0.008980181, 1, 1, 1, 1, 1,
-0.03982688, -0.8044055, -1.759908, 1, 1, 1, 1, 1,
-0.03524371, 0.2678504, -0.7994443, 1, 1, 1, 1, 1,
-0.03197066, 0.2615007, -1.210561, 1, 1, 1, 1, 1,
-0.02853977, 0.06287253, -0.9304665, 1, 1, 1, 1, 1,
-0.02321546, 0.8650714, -0.2607973, 1, 1, 1, 1, 1,
-0.02308294, 0.4251465, -0.2945219, 1, 1, 1, 1, 1,
-0.02306541, 1.054961, 0.8646237, 1, 1, 1, 1, 1,
-0.01428114, -1.859431, -2.040082, 1, 1, 1, 1, 1,
-0.01021243, -0.680077, -2.074638, 1, 1, 1, 1, 1,
-0.002583422, 1.27393, 0.05256762, 0, 0, 1, 1, 1,
0.000176649, -1.055557, 0.6039065, 1, 0, 0, 1, 1,
0.01081511, -0.3799967, 2.26256, 1, 0, 0, 1, 1,
0.0163145, -1.281641, 2.10433, 1, 0, 0, 1, 1,
0.01856965, 2.32311, -0.03669084, 1, 0, 0, 1, 1,
0.02034088, 0.6400367, 0.4208552, 1, 0, 0, 1, 1,
0.02508449, 1.580181, 0.9422175, 0, 0, 0, 1, 1,
0.02833999, 2.014285, 0.2836426, 0, 0, 0, 1, 1,
0.02836317, -0.3506208, 4.521645, 0, 0, 0, 1, 1,
0.02969113, -1.401273, 3.102652, 0, 0, 0, 1, 1,
0.03214949, 0.7882119, 0.443689, 0, 0, 0, 1, 1,
0.0339204, 0.1038063, 2.003523, 0, 0, 0, 1, 1,
0.03790218, 1.464692, -0.7118492, 0, 0, 0, 1, 1,
0.03826601, -1.001085, 4.118595, 1, 1, 1, 1, 1,
0.03999985, 0.8781982, -0.08758295, 1, 1, 1, 1, 1,
0.04407909, 1.032106, -0.5641921, 1, 1, 1, 1, 1,
0.04748071, 2.057614, 1.050906, 1, 1, 1, 1, 1,
0.05190087, 0.1677332, 1.15398, 1, 1, 1, 1, 1,
0.05246484, 1.054266, -0.6613538, 1, 1, 1, 1, 1,
0.05312198, 0.009830478, 1.361554, 1, 1, 1, 1, 1,
0.05537574, 1.548147, 0.2234684, 1, 1, 1, 1, 1,
0.05556119, -0.3582102, 3.832673, 1, 1, 1, 1, 1,
0.0586873, 0.683489, -2.238875, 1, 1, 1, 1, 1,
0.0594529, -0.5063509, 3.091519, 1, 1, 1, 1, 1,
0.06115702, -0.9864476, 2.473325, 1, 1, 1, 1, 1,
0.06203235, 2.123778, 1.228546, 1, 1, 1, 1, 1,
0.06435913, -0.05406884, 2.687369, 1, 1, 1, 1, 1,
0.06522619, -0.6052345, 2.339785, 1, 1, 1, 1, 1,
0.06565619, -0.4837314, 2.593972, 0, 0, 1, 1, 1,
0.06841299, -0.8459616, 3.530655, 1, 0, 0, 1, 1,
0.0689123, 0.5952647, -0.2615447, 1, 0, 0, 1, 1,
0.07131231, -1.281922, 3.481776, 1, 0, 0, 1, 1,
0.07614401, -0.2031496, 3.454824, 1, 0, 0, 1, 1,
0.07676259, -0.4524965, 2.258173, 1, 0, 0, 1, 1,
0.07848509, 0.1406337, -0.1412802, 0, 0, 0, 1, 1,
0.07977303, 2.0804, 0.2432511, 0, 0, 0, 1, 1,
0.08533484, -0.5084785, 3.090672, 0, 0, 0, 1, 1,
0.08723597, -1.371149, 3.775018, 0, 0, 0, 1, 1,
0.08948983, 0.2826335, 1.113966, 0, 0, 0, 1, 1,
0.08963933, -1.403642, 3.988133, 0, 0, 0, 1, 1,
0.09124507, 0.7740656, 2.008451, 0, 0, 0, 1, 1,
0.09207515, -2.170634, 2.664158, 1, 1, 1, 1, 1,
0.09507282, 1.176387, 1.67725, 1, 1, 1, 1, 1,
0.09639753, 0.2941652, 0.644865, 1, 1, 1, 1, 1,
0.09697587, 1.22898, 0.6415166, 1, 1, 1, 1, 1,
0.09774643, -0.5189679, 2.620062, 1, 1, 1, 1, 1,
0.09839828, -0.7499998, 4.233562, 1, 1, 1, 1, 1,
0.1002285, -1.339852, 2.475342, 1, 1, 1, 1, 1,
0.1032272, 1.128508, 0.07790695, 1, 1, 1, 1, 1,
0.1065091, 1.344523, -1.110534, 1, 1, 1, 1, 1,
0.1084241, -0.6870028, 3.100017, 1, 1, 1, 1, 1,
0.1106186, 1.573001, 0.01495836, 1, 1, 1, 1, 1,
0.1108481, 0.7734089, -0.8034081, 1, 1, 1, 1, 1,
0.1174365, 0.5208257, 2.881464, 1, 1, 1, 1, 1,
0.1240266, 1.197177, -0.8675093, 1, 1, 1, 1, 1,
0.1249221, -0.4882877, 3.82372, 1, 1, 1, 1, 1,
0.1270374, -0.009787718, 1.932411, 0, 0, 1, 1, 1,
0.1314812, -0.4507896, 3.894967, 1, 0, 0, 1, 1,
0.1352582, -0.8243706, 2.328961, 1, 0, 0, 1, 1,
0.1389813, -0.849305, 3.255548, 1, 0, 0, 1, 1,
0.1423682, -0.05140856, 2.640996, 1, 0, 0, 1, 1,
0.1431541, -1.853215, 3.453403, 1, 0, 0, 1, 1,
0.1434147, 1.782575, 1.286264, 0, 0, 0, 1, 1,
0.1455168, -1.007857, 2.603275, 0, 0, 0, 1, 1,
0.1467523, -0.009105849, 3.450734, 0, 0, 0, 1, 1,
0.1518456, 0.4741666, -0.6436957, 0, 0, 0, 1, 1,
0.154722, 1.119381, -0.1474396, 0, 0, 0, 1, 1,
0.1585275, -0.8200331, 3.533646, 0, 0, 0, 1, 1,
0.1665484, 3.357411, -1.927627, 0, 0, 0, 1, 1,
0.1670859, 0.8545871, 1.968626, 1, 1, 1, 1, 1,
0.1692397, -1.133105, 4.144091, 1, 1, 1, 1, 1,
0.1750963, 1.19873, 0.8569329, 1, 1, 1, 1, 1,
0.1777442, 0.2143708, 0.5299399, 1, 1, 1, 1, 1,
0.1850997, -0.1848487, 2.687428, 1, 1, 1, 1, 1,
0.1891806, -0.2983206, 3.338621, 1, 1, 1, 1, 1,
0.1908138, 0.6771314, 0.877018, 1, 1, 1, 1, 1,
0.1928198, -0.08545767, 1.740545, 1, 1, 1, 1, 1,
0.1950841, 1.843391, -0.8456994, 1, 1, 1, 1, 1,
0.1954776, -0.7183232, 3.43627, 1, 1, 1, 1, 1,
0.2039783, 0.2198752, 0.6804596, 1, 1, 1, 1, 1,
0.207626, -0.3666684, 3.282982, 1, 1, 1, 1, 1,
0.2090942, -0.1096789, 1.072725, 1, 1, 1, 1, 1,
0.2137761, 0.03069551, 1.333094, 1, 1, 1, 1, 1,
0.2192985, -0.984911, 3.612031, 1, 1, 1, 1, 1,
0.2219893, 0.5879666, -2.134734, 0, 0, 1, 1, 1,
0.2226095, -0.7966492, 3.250225, 1, 0, 0, 1, 1,
0.2286553, 0.4580867, -0.3667175, 1, 0, 0, 1, 1,
0.2325168, 0.009141978, 1.918377, 1, 0, 0, 1, 1,
0.2332706, 0.1457419, 0.4285703, 1, 0, 0, 1, 1,
0.2357118, -0.7206296, 3.359538, 1, 0, 0, 1, 1,
0.2359224, 0.5028182, -0.8028857, 0, 0, 0, 1, 1,
0.2395732, -0.7305853, 2.005291, 0, 0, 0, 1, 1,
0.2404821, 0.6191325, -0.7845045, 0, 0, 0, 1, 1,
0.2419319, 0.4354579, -1.634709, 0, 0, 0, 1, 1,
0.2461842, 0.6887597, 1.038862, 0, 0, 0, 1, 1,
0.2474773, -0.1564815, 1.660336, 0, 0, 0, 1, 1,
0.2535206, 0.3928173, -1.267552, 0, 0, 0, 1, 1,
0.2538176, 0.6985897, -0.2249129, 1, 1, 1, 1, 1,
0.2553303, -0.07942522, -0.4335519, 1, 1, 1, 1, 1,
0.2563739, 1.261225, 1.730807, 1, 1, 1, 1, 1,
0.2581286, -1.317421, 2.28151, 1, 1, 1, 1, 1,
0.2597192, 3.222641, 0.2914895, 1, 1, 1, 1, 1,
0.2608502, 1.031821, 0.8720552, 1, 1, 1, 1, 1,
0.261336, -0.4909226, 2.657479, 1, 1, 1, 1, 1,
0.2673404, -0.795744, 3.840895, 1, 1, 1, 1, 1,
0.2706109, -0.2205681, 0.4672553, 1, 1, 1, 1, 1,
0.2724817, -1.141186, 2.571122, 1, 1, 1, 1, 1,
0.2785833, -1.579528, 2.876433, 1, 1, 1, 1, 1,
0.2803426, -0.5130987, 2.283278, 1, 1, 1, 1, 1,
0.2805019, 0.0498954, 0.01792045, 1, 1, 1, 1, 1,
0.2819562, -0.85755, 1.616272, 1, 1, 1, 1, 1,
0.2852188, -0.07480109, 1.180237, 1, 1, 1, 1, 1,
0.2878521, -0.6624311, 2.696074, 0, 0, 1, 1, 1,
0.2922053, 0.1110206, 0.107438, 1, 0, 0, 1, 1,
0.2923335, 0.08029932, 1.418129, 1, 0, 0, 1, 1,
0.2982067, -0.1363731, 2.335308, 1, 0, 0, 1, 1,
0.3023791, 1.316542, -0.03609628, 1, 0, 0, 1, 1,
0.3045238, -0.05556329, 2.234486, 1, 0, 0, 1, 1,
0.3085992, -0.1426144, 0.4521856, 0, 0, 0, 1, 1,
0.3130772, -0.5689155, 3.155475, 0, 0, 0, 1, 1,
0.3244961, -1.21573, 2.626166, 0, 0, 0, 1, 1,
0.3251501, 0.02515109, 1.14624, 0, 0, 0, 1, 1,
0.3255429, -1.192105, 2.688765, 0, 0, 0, 1, 1,
0.3316643, -0.2630835, 2.349806, 0, 0, 0, 1, 1,
0.3375695, 1.214292, 2.245285, 0, 0, 0, 1, 1,
0.3426568, -1.748056, 4.324287, 1, 1, 1, 1, 1,
0.3507627, -1.367715, 4.833712, 1, 1, 1, 1, 1,
0.3526782, -1.550351, 4.831599, 1, 1, 1, 1, 1,
0.354256, -1.099418, 3.62209, 1, 1, 1, 1, 1,
0.3550791, 0.5497743, 1.556665, 1, 1, 1, 1, 1,
0.3564635, 2.08835, -0.3225331, 1, 1, 1, 1, 1,
0.3576274, -2.163472, 2.223815, 1, 1, 1, 1, 1,
0.3595978, 1.947966, 0.6929119, 1, 1, 1, 1, 1,
0.3615376, 0.9991214, 1.475452, 1, 1, 1, 1, 1,
0.3658141, 0.5269744, 0.3185513, 1, 1, 1, 1, 1,
0.3683958, 0.9996489, 0.3656861, 1, 1, 1, 1, 1,
0.3707323, -0.7247991, 0.715179, 1, 1, 1, 1, 1,
0.3740454, -0.9073868, 3.223261, 1, 1, 1, 1, 1,
0.3778557, 0.3022441, 0.3187616, 1, 1, 1, 1, 1,
0.379644, 0.222064, 0.1184443, 1, 1, 1, 1, 1,
0.3799316, -0.3058779, 1.01449, 0, 0, 1, 1, 1,
0.3812998, 0.6663292, 0.3068147, 1, 0, 0, 1, 1,
0.3822285, -2.156671, 1.456407, 1, 0, 0, 1, 1,
0.3845896, -0.3237416, 3.935761, 1, 0, 0, 1, 1,
0.3851948, -0.165808, 3.352518, 1, 0, 0, 1, 1,
0.3953786, -1.463808, 4.177593, 1, 0, 0, 1, 1,
0.3994066, 0.6882358, 1.673792, 0, 0, 0, 1, 1,
0.4012801, 1.153584, 0.7839355, 0, 0, 0, 1, 1,
0.4014379, 0.2505671, 1.445945, 0, 0, 0, 1, 1,
0.4019493, -0.337065, 3.270574, 0, 0, 0, 1, 1,
0.4032608, 0.415809, -0.2039115, 0, 0, 0, 1, 1,
0.403692, -0.323276, 4.087502, 0, 0, 0, 1, 1,
0.4038776, -0.6859989, 2.69794, 0, 0, 0, 1, 1,
0.4078039, 0.69374, 1.053928, 1, 1, 1, 1, 1,
0.4080518, 1.076476, 0.4733637, 1, 1, 1, 1, 1,
0.4176343, -0.264088, 3.300421, 1, 1, 1, 1, 1,
0.4301348, 0.353921, -0.1413255, 1, 1, 1, 1, 1,
0.43233, -1.77896, 4.53457, 1, 1, 1, 1, 1,
0.4335839, 0.9410663, -0.06638578, 1, 1, 1, 1, 1,
0.4352646, 0.5113762, 0.7968283, 1, 1, 1, 1, 1,
0.4369242, 1.152386, -1.597146, 1, 1, 1, 1, 1,
0.4377334, -1.233762, 1.856616, 1, 1, 1, 1, 1,
0.4378147, 1.225832, 0.6498662, 1, 1, 1, 1, 1,
0.4414025, -0.3108405, 0.4523912, 1, 1, 1, 1, 1,
0.4421303, -0.01540496, 1.274224, 1, 1, 1, 1, 1,
0.4424066, 0.09592976, 1.689495, 1, 1, 1, 1, 1,
0.4454306, -0.2520414, 1.207522, 1, 1, 1, 1, 1,
0.4478208, 1.63401, -0.2205778, 1, 1, 1, 1, 1,
0.4482675, 0.648208, -0.2302684, 0, 0, 1, 1, 1,
0.4591301, 1.462776, 1.326011, 1, 0, 0, 1, 1,
0.460467, 0.7013215, 1.804419, 1, 0, 0, 1, 1,
0.4604933, -0.1716745, 0.6883745, 1, 0, 0, 1, 1,
0.4641451, -3.113511, 2.191538, 1, 0, 0, 1, 1,
0.4672442, 0.6427018, 0.5418857, 1, 0, 0, 1, 1,
0.4750432, 1.27765, -1.280506, 0, 0, 0, 1, 1,
0.4781254, -0.03875165, 0.08382696, 0, 0, 0, 1, 1,
0.4784375, 0.419343, 2.052382, 0, 0, 0, 1, 1,
0.4805835, 0.8228998, -0.6989835, 0, 0, 0, 1, 1,
0.487157, 1.535805, -0.4420608, 0, 0, 0, 1, 1,
0.4914806, 0.7949828, -0.1925675, 0, 0, 0, 1, 1,
0.491609, -1.138873, 3.558885, 0, 0, 0, 1, 1,
0.4928054, 0.2118791, 2.673339, 1, 1, 1, 1, 1,
0.4933028, -0.02517774, 1.945454, 1, 1, 1, 1, 1,
0.494034, 1.240729, 0.6064111, 1, 1, 1, 1, 1,
0.4947498, -0.7125039, 1.551961, 1, 1, 1, 1, 1,
0.4987947, 1.584664, -0.8221575, 1, 1, 1, 1, 1,
0.5022954, -0.878234, 2.403193, 1, 1, 1, 1, 1,
0.5036125, -1.391462, 3.469525, 1, 1, 1, 1, 1,
0.5038494, -0.634839, 2.867763, 1, 1, 1, 1, 1,
0.5055991, 0.3853537, 2.620184, 1, 1, 1, 1, 1,
0.5102074, -0.7954808, 1.225186, 1, 1, 1, 1, 1,
0.5103254, 1.585426, 0.8511812, 1, 1, 1, 1, 1,
0.5113308, -0.6753472, 2.614416, 1, 1, 1, 1, 1,
0.516587, -0.2135302, 2.147005, 1, 1, 1, 1, 1,
0.5166647, -0.6040618, 1.469628, 1, 1, 1, 1, 1,
0.5246991, -0.1975259, 1.73846, 1, 1, 1, 1, 1,
0.5302262, 0.3914989, 0.9747861, 0, 0, 1, 1, 1,
0.5303417, -0.2688133, 2.845653, 1, 0, 0, 1, 1,
0.5307508, -1.451915, 3.831427, 1, 0, 0, 1, 1,
0.5328342, 1.12728, 0.8388154, 1, 0, 0, 1, 1,
0.5328726, -0.02227319, -0.2094104, 1, 0, 0, 1, 1,
0.5348248, 0.5924083, 2.066675, 1, 0, 0, 1, 1,
0.5349404, 0.04626978, 0.3459951, 0, 0, 0, 1, 1,
0.5370298, 0.04655368, 1.507186, 0, 0, 0, 1, 1,
0.5371742, -0.056969, 3.014519, 0, 0, 0, 1, 1,
0.5371888, -0.4945264, 1.431324, 0, 0, 0, 1, 1,
0.5384483, 2.1751, -0.5562029, 0, 0, 0, 1, 1,
0.5386285, -0.2084158, 0.9096219, 0, 0, 0, 1, 1,
0.5404122, -0.4291286, 1.030881, 0, 0, 0, 1, 1,
0.5444241, -0.9009204, 1.835083, 1, 1, 1, 1, 1,
0.545562, 0.9480065, 1.530856, 1, 1, 1, 1, 1,
0.5541874, -0.04098605, 1.342297, 1, 1, 1, 1, 1,
0.5646643, -0.5386845, 2.943292, 1, 1, 1, 1, 1,
0.5678535, -0.2306202, 2.365022, 1, 1, 1, 1, 1,
0.5734835, -0.4775013, 2.095429, 1, 1, 1, 1, 1,
0.573577, 0.5046362, 0.3889585, 1, 1, 1, 1, 1,
0.5792626, 0.6961001, 0.5891752, 1, 1, 1, 1, 1,
0.5795731, -0.8908312, 1.870086, 1, 1, 1, 1, 1,
0.5823607, 0.02208729, 1.013915, 1, 1, 1, 1, 1,
0.582516, 0.883695, 1.121068, 1, 1, 1, 1, 1,
0.5962356, 0.4309745, -0.3973904, 1, 1, 1, 1, 1,
0.5966572, 0.6279613, -0.5390994, 1, 1, 1, 1, 1,
0.5994489, -0.858772, 4.556715, 1, 1, 1, 1, 1,
0.6152152, 0.3494161, 0.3954281, 1, 1, 1, 1, 1,
0.6176041, -0.5226899, 3.377231, 0, 0, 1, 1, 1,
0.6178032, 0.9592841, 0.9205333, 1, 0, 0, 1, 1,
0.6185686, 0.1693094, 2.062974, 1, 0, 0, 1, 1,
0.6224376, -1.600561, 2.37875, 1, 0, 0, 1, 1,
0.6232805, 0.1558614, 1.135011, 1, 0, 0, 1, 1,
0.6247368, 0.8587683, 0.6735554, 1, 0, 0, 1, 1,
0.6248143, -0.3796488, 1.606279, 0, 0, 0, 1, 1,
0.6261848, -0.6661724, 1.275332, 0, 0, 0, 1, 1,
0.6299456, 0.0278239, 2.249772, 0, 0, 0, 1, 1,
0.6330284, -0.8495004, 2.721899, 0, 0, 0, 1, 1,
0.6333339, -0.3658324, 1.653879, 0, 0, 0, 1, 1,
0.6346235, -0.9209983, 2.233681, 0, 0, 0, 1, 1,
0.6388756, 0.4958844, 2.414824, 0, 0, 0, 1, 1,
0.6413718, 0.02570036, 1.12186, 1, 1, 1, 1, 1,
0.6415638, 0.7241477, -0.4107668, 1, 1, 1, 1, 1,
0.6435922, -0.8413164, 2.29529, 1, 1, 1, 1, 1,
0.6441734, -0.6167608, 1.071275, 1, 1, 1, 1, 1,
0.6464832, -0.6242732, 1.934197, 1, 1, 1, 1, 1,
0.6559854, -1.298315, 2.931869, 1, 1, 1, 1, 1,
0.66138, 1.367186, -0.9332037, 1, 1, 1, 1, 1,
0.6631604, 0.9856946, 0.09536123, 1, 1, 1, 1, 1,
0.6644306, 0.6013421, 0.8666991, 1, 1, 1, 1, 1,
0.6698087, -0.759002, 0.74106, 1, 1, 1, 1, 1,
0.6736878, 1.796942, -1.466916, 1, 1, 1, 1, 1,
0.6763818, 2.154498, 0.158561, 1, 1, 1, 1, 1,
0.677106, -0.3743293, 0.7350695, 1, 1, 1, 1, 1,
0.6821783, -1.035337, 0.9641278, 1, 1, 1, 1, 1,
0.6918831, 0.5841573, 0.9715574, 1, 1, 1, 1, 1,
0.6949396, 1.176361, -0.1563655, 0, 0, 1, 1, 1,
0.6964445, -0.5230291, 2.632238, 1, 0, 0, 1, 1,
0.6976309, 0.2392769, 3.041376, 1, 0, 0, 1, 1,
0.6987338, 2.379308, 0.2570128, 1, 0, 0, 1, 1,
0.7007101, 1.092151, 1.061124, 1, 0, 0, 1, 1,
0.7102327, -0.9570136, 2.188712, 1, 0, 0, 1, 1,
0.7117572, 1.237573, 0.1054908, 0, 0, 0, 1, 1,
0.7121135, -0.01938875, 3.564842, 0, 0, 0, 1, 1,
0.7127773, 0.3203244, 1.66026, 0, 0, 0, 1, 1,
0.7156858, 0.9512883, 0.2188245, 0, 0, 0, 1, 1,
0.7208663, -0.6044099, 1.028921, 0, 0, 0, 1, 1,
0.7225685, -2.476563, 2.153437, 0, 0, 0, 1, 1,
0.7238389, -0.6319806, 2.48138, 0, 0, 0, 1, 1,
0.7244657, 0.9811839, 0.7775882, 1, 1, 1, 1, 1,
0.7277091, 0.4443556, 0.4512659, 1, 1, 1, 1, 1,
0.7285162, 0.1030532, 1.399818, 1, 1, 1, 1, 1,
0.7314402, -0.7098876, 1.895647, 1, 1, 1, 1, 1,
0.732101, 0.6036295, 0.9670309, 1, 1, 1, 1, 1,
0.7426577, -0.7738805, 1.975108, 1, 1, 1, 1, 1,
0.7436386, 0.7104918, 2.59834, 1, 1, 1, 1, 1,
0.743956, -0.2937021, 3.083555, 1, 1, 1, 1, 1,
0.7450762, 1.122138, 1.802017, 1, 1, 1, 1, 1,
0.7452887, -0.132616, 1.021113, 1, 1, 1, 1, 1,
0.75285, 1.988449, -0.0587479, 1, 1, 1, 1, 1,
0.7532688, -0.2126207, 1.086592, 1, 1, 1, 1, 1,
0.7556055, -1.490978, 2.197928, 1, 1, 1, 1, 1,
0.7563756, 1.658117, 0.364853, 1, 1, 1, 1, 1,
0.7572621, 0.5219658, 0.009861949, 1, 1, 1, 1, 1,
0.7573718, 0.1024272, 3.311655, 0, 0, 1, 1, 1,
0.7588159, 0.002407725, 0.7955292, 1, 0, 0, 1, 1,
0.7595814, -0.519482, 1.730684, 1, 0, 0, 1, 1,
0.7610699, 0.3896734, 0.6318276, 1, 0, 0, 1, 1,
0.7659804, 1.032436, 0.3598168, 1, 0, 0, 1, 1,
0.7685213, 0.4768634, -0.05015884, 1, 0, 0, 1, 1,
0.7706208, 0.279292, -0.3908167, 0, 0, 0, 1, 1,
0.7715262, 0.09722889, 1.600326, 0, 0, 0, 1, 1,
0.7764068, -0.2711615, 1.766724, 0, 0, 0, 1, 1,
0.7811754, -0.9194514, 3.41945, 0, 0, 0, 1, 1,
0.7908626, 1.005998, 0.7988675, 0, 0, 0, 1, 1,
0.7915502, -0.321912, 1.458739, 0, 0, 0, 1, 1,
0.7960311, 0.05183128, 1.882265, 0, 0, 0, 1, 1,
0.797235, -0.5440503, 3.950429, 1, 1, 1, 1, 1,
0.8007299, -0.3495932, 1.579721, 1, 1, 1, 1, 1,
0.8024536, -0.1125937, -0.09357458, 1, 1, 1, 1, 1,
0.805492, 1.05913, -0.2899572, 1, 1, 1, 1, 1,
0.8072215, 2.049074, 2.175309, 1, 1, 1, 1, 1,
0.810614, 0.4375676, 1.783804, 1, 1, 1, 1, 1,
0.8107876, 0.6860777, 1.199028, 1, 1, 1, 1, 1,
0.8108363, -0.1783925, 3.060457, 1, 1, 1, 1, 1,
0.8275294, -0.2126354, 3.224504, 1, 1, 1, 1, 1,
0.83208, 1.102233, 2.576261, 1, 1, 1, 1, 1,
0.8329423, 0.2071523, 0.8924462, 1, 1, 1, 1, 1,
0.8372286, -0.3365771, 1.115065, 1, 1, 1, 1, 1,
0.837659, -1.093278, 4.008437, 1, 1, 1, 1, 1,
0.8427922, -0.09014188, 0.6345191, 1, 1, 1, 1, 1,
0.8485663, 0.04801491, 2.17769, 1, 1, 1, 1, 1,
0.8510094, -0.7116759, 1.82162, 0, 0, 1, 1, 1,
0.8535924, 1.148115, -0.2556346, 1, 0, 0, 1, 1,
0.8617082, -0.2217118, 1.54765, 1, 0, 0, 1, 1,
0.8625559, -0.9808297, 3.403335, 1, 0, 0, 1, 1,
0.8679609, 0.6583746, 2.541039, 1, 0, 0, 1, 1,
0.8684986, 0.1087849, 1.662826, 1, 0, 0, 1, 1,
0.8705338, -0.8697208, 2.446627, 0, 0, 0, 1, 1,
0.8766425, 0.3321263, 0.6905549, 0, 0, 0, 1, 1,
0.8797166, 0.1919511, 2.616636, 0, 0, 0, 1, 1,
0.8836603, -0.5432293, 2.266181, 0, 0, 0, 1, 1,
0.8836666, 1.167108, 0.08112434, 0, 0, 0, 1, 1,
0.8911351, 1.223196, 1.82204, 0, 0, 0, 1, 1,
0.9075922, 1.055925, 0.4329913, 0, 0, 0, 1, 1,
0.9096017, -0.2017478, 1.946842, 1, 1, 1, 1, 1,
0.9158123, 1.129008, -0.6645757, 1, 1, 1, 1, 1,
0.9165826, 1.227889, -1.117628, 1, 1, 1, 1, 1,
0.9167836, -0.05717248, 1.748103, 1, 1, 1, 1, 1,
0.9178776, 0.6800789, 0.4915006, 1, 1, 1, 1, 1,
0.9219129, 0.324342, 1.287075, 1, 1, 1, 1, 1,
0.9257776, 0.1683796, 0.9225639, 1, 1, 1, 1, 1,
0.9273723, -0.7812742, 1.780269, 1, 1, 1, 1, 1,
0.9274403, 1.573628, 0.1531297, 1, 1, 1, 1, 1,
0.9320015, 0.389496, 3.040394, 1, 1, 1, 1, 1,
0.9327682, 1.604832, 1.046269, 1, 1, 1, 1, 1,
0.9336123, -1.469923, 2.868405, 1, 1, 1, 1, 1,
0.9353071, 0.5150943, 1.200513, 1, 1, 1, 1, 1,
0.9452281, 0.378119, 2.270334, 1, 1, 1, 1, 1,
0.9457979, 0.4763651, 1.576105, 1, 1, 1, 1, 1,
0.9472587, -1.455687, 3.672613, 0, 0, 1, 1, 1,
0.947388, 0.03457578, 0.8207251, 1, 0, 0, 1, 1,
0.9503784, 0.5521271, 2.622512, 1, 0, 0, 1, 1,
0.9505191, -1.436033, 0.9433039, 1, 0, 0, 1, 1,
0.9536458, -1.590652, 2.932336, 1, 0, 0, 1, 1,
0.965403, -0.6723875, 4.16567, 1, 0, 0, 1, 1,
0.9672748, 0.07934931, 1.833253, 0, 0, 0, 1, 1,
0.9681929, -0.7786235, 3.400357, 0, 0, 0, 1, 1,
0.9731252, -2.017747, 3.784733, 0, 0, 0, 1, 1,
0.9798115, 0.4510822, 1.197888, 0, 0, 0, 1, 1,
0.9820794, -1.54778, 2.818343, 0, 0, 0, 1, 1,
0.9870319, 0.03768726, 0.6577578, 0, 0, 0, 1, 1,
0.9958916, 0.4975179, 0.9362332, 0, 0, 0, 1, 1,
0.9962841, -0.196057, 1.670187, 1, 1, 1, 1, 1,
0.9969959, -0.404028, 2.036237, 1, 1, 1, 1, 1,
0.9990239, 0.06564677, 0.09155327, 1, 1, 1, 1, 1,
0.9996313, -0.130978, 0.6229403, 1, 1, 1, 1, 1,
1.008325, 0.8108464, 0.004109782, 1, 1, 1, 1, 1,
1.011562, -0.7904495, 3.32779, 1, 1, 1, 1, 1,
1.019075, -0.3611251, 0.6909706, 1, 1, 1, 1, 1,
1.024785, -0.8321366, 0.4466997, 1, 1, 1, 1, 1,
1.027548, -0.4709079, 1.816808, 1, 1, 1, 1, 1,
1.035189, 1.728515, 1.138497, 1, 1, 1, 1, 1,
1.035483, 0.3344533, 2.409026, 1, 1, 1, 1, 1,
1.035868, 0.7794176, -0.5801131, 1, 1, 1, 1, 1,
1.039093, 1.093438, 2.468423, 1, 1, 1, 1, 1,
1.047822, 1.833292, 2.252763, 1, 1, 1, 1, 1,
1.052436, -1.003503, 2.294609, 1, 1, 1, 1, 1,
1.052696, 0.2508784, 0.5039288, 0, 0, 1, 1, 1,
1.052922, 1.695341, 1.112301, 1, 0, 0, 1, 1,
1.055308, 0.7747362, -0.3410137, 1, 0, 0, 1, 1,
1.06571, -0.4247723, 1.350278, 1, 0, 0, 1, 1,
1.067281, 0.1379661, 0.1630882, 1, 0, 0, 1, 1,
1.069198, -0.06887756, 0.4677024, 1, 0, 0, 1, 1,
1.072901, 0.5681602, 0.014253, 0, 0, 0, 1, 1,
1.073699, -0.06247435, 2.366978, 0, 0, 0, 1, 1,
1.077872, -1.272784, 2.836545, 0, 0, 0, 1, 1,
1.082214, 1.437047, 1.759508, 0, 0, 0, 1, 1,
1.08598, -0.9255991, 2.211989, 0, 0, 0, 1, 1,
1.094026, 0.2723415, 0.9015459, 0, 0, 0, 1, 1,
1.098403, 0.5638644, 0.7504516, 0, 0, 0, 1, 1,
1.100111, 0.6855865, 1.64302, 1, 1, 1, 1, 1,
1.101176, 1.35828, 1.340245, 1, 1, 1, 1, 1,
1.10204, -0.5715175, 2.372193, 1, 1, 1, 1, 1,
1.106298, -1.101602, 2.659332, 1, 1, 1, 1, 1,
1.106799, 0.3193087, 1.429889, 1, 1, 1, 1, 1,
1.114122, -1.425935, 2.119962, 1, 1, 1, 1, 1,
1.123399, 1.396485, 1.866768, 1, 1, 1, 1, 1,
1.127299, 0.6778094, -0.1849784, 1, 1, 1, 1, 1,
1.14351, -1.347612, 2.922505, 1, 1, 1, 1, 1,
1.147002, 0.8194951, 0.04644074, 1, 1, 1, 1, 1,
1.149449, 0.08837485, 4.1968, 1, 1, 1, 1, 1,
1.153461, 1.746478, -0.1401666, 1, 1, 1, 1, 1,
1.156127, 0.1541173, 1.571625, 1, 1, 1, 1, 1,
1.157874, -0.06562272, 1.887483, 1, 1, 1, 1, 1,
1.163206, -0.6521065, 0.3959959, 1, 1, 1, 1, 1,
1.163939, -1.073335, 2.608781, 0, 0, 1, 1, 1,
1.165613, 0.05348119, 2.023674, 1, 0, 0, 1, 1,
1.16747, -0.08073056, 2.050555, 1, 0, 0, 1, 1,
1.181465, 0.6859645, 0.1445408, 1, 0, 0, 1, 1,
1.182803, -0.3333828, 1.83968, 1, 0, 0, 1, 1,
1.183089, 1.887197, -1.266386, 1, 0, 0, 1, 1,
1.184473, -0.2960328, 1.39599, 0, 0, 0, 1, 1,
1.187156, -0.8831913, 1.84943, 0, 0, 0, 1, 1,
1.189963, 1.527088, 0.4221476, 0, 0, 0, 1, 1,
1.191593, -0.8573789, 3.725463, 0, 0, 0, 1, 1,
1.195572, -1.393549, 1.474025, 0, 0, 0, 1, 1,
1.199898, 0.312422, 2.562536, 0, 0, 0, 1, 1,
1.205205, -0.2004263, 1.002283, 0, 0, 0, 1, 1,
1.219075, 0.6759661, 0.1386083, 1, 1, 1, 1, 1,
1.220793, -0.3846535, 1.562461, 1, 1, 1, 1, 1,
1.229977, 1.704782, -0.2410466, 1, 1, 1, 1, 1,
1.230891, 0.4053749, 2.290732, 1, 1, 1, 1, 1,
1.232035, 0.9684587, -1.326344, 1, 1, 1, 1, 1,
1.232699, 1.057321, 0.7072014, 1, 1, 1, 1, 1,
1.238107, 0.1557247, 1.123274, 1, 1, 1, 1, 1,
1.241499, 0.6836968, 3.885707, 1, 1, 1, 1, 1,
1.248084, -0.5383667, 3.268813, 1, 1, 1, 1, 1,
1.250215, 1.47693, 2.883159, 1, 1, 1, 1, 1,
1.261668, 0.3291466, 0.9325532, 1, 1, 1, 1, 1,
1.264461, 6.34864e-05, 0.6177916, 1, 1, 1, 1, 1,
1.267466, 0.6561638, 1.432491, 1, 1, 1, 1, 1,
1.273556, -0.2454647, 3.416412, 1, 1, 1, 1, 1,
1.27373, -2.428901, 2.752121, 1, 1, 1, 1, 1,
1.278618, 0.001893217, 1.981234, 0, 0, 1, 1, 1,
1.283434, 0.1519776, 0.3836246, 1, 0, 0, 1, 1,
1.285171, 0.1941041, 2.429303, 1, 0, 0, 1, 1,
1.290557, -0.1942435, 0.4859112, 1, 0, 0, 1, 1,
1.298349, -0.604754, 2.150464, 1, 0, 0, 1, 1,
1.301806, 0.6003726, 1.149423, 1, 0, 0, 1, 1,
1.306467, 0.006204517, 2.200937, 0, 0, 0, 1, 1,
1.307701, 0.5306746, 2.081225, 0, 0, 0, 1, 1,
1.318409, 1.410679, -0.5125216, 0, 0, 0, 1, 1,
1.32043, 0.1517592, 0.9667906, 0, 0, 0, 1, 1,
1.33834, 2.835172, -1.2647, 0, 0, 0, 1, 1,
1.343632, -1.470984, 3.323546, 0, 0, 0, 1, 1,
1.380068, -0.3469483, 1.706439, 0, 0, 0, 1, 1,
1.382299, 1.14334, 1.008844, 1, 1, 1, 1, 1,
1.393629, -0.6996071, 0.8306945, 1, 1, 1, 1, 1,
1.3965, 1.043719, 0.5605649, 1, 1, 1, 1, 1,
1.405653, 0.05099652, 1.057362, 1, 1, 1, 1, 1,
1.410969, 0.3646957, 0.6903532, 1, 1, 1, 1, 1,
1.421574, -0.1098103, 1.839247, 1, 1, 1, 1, 1,
1.425238, -0.01986497, 2.561443, 1, 1, 1, 1, 1,
1.434182, 1.374175, 1.5015, 1, 1, 1, 1, 1,
1.443698, 0.6807642, 1.20942, 1, 1, 1, 1, 1,
1.450788, -0.9998011, 2.245595, 1, 1, 1, 1, 1,
1.463109, -0.8350756, 3.308332, 1, 1, 1, 1, 1,
1.472946, 1.443541, 1.272749, 1, 1, 1, 1, 1,
1.476576, 1.097655, 0.7167687, 1, 1, 1, 1, 1,
1.490176, -1.244642, 3.275681, 1, 1, 1, 1, 1,
1.510194, -1.986482, 1.255201, 1, 1, 1, 1, 1,
1.510445, -0.3350664, 0.5862833, 0, 0, 1, 1, 1,
1.538091, -0.3657554, 1.173198, 1, 0, 0, 1, 1,
1.548484, 0.5733975, 1.296854, 1, 0, 0, 1, 1,
1.553124, -0.9748016, 2.810387, 1, 0, 0, 1, 1,
1.555479, 0.1383197, 2.030415, 1, 0, 0, 1, 1,
1.576118, -0.476229, 1.822424, 1, 0, 0, 1, 1,
1.604857, 0.4687608, 1.66314, 0, 0, 0, 1, 1,
1.613556, -0.8765641, 2.617604, 0, 0, 0, 1, 1,
1.626522, -0.8250323, 1.834053, 0, 0, 0, 1, 1,
1.631603, -1.072248, 1.807057, 0, 0, 0, 1, 1,
1.634225, -0.1473111, 1.779114, 0, 0, 0, 1, 1,
1.641105, 0.8528039, 2.628741, 0, 0, 0, 1, 1,
1.646181, -0.002325369, 1.446595, 0, 0, 0, 1, 1,
1.662467, 0.3783255, 1.702482, 1, 1, 1, 1, 1,
1.691283, 0.1151298, 1.91965, 1, 1, 1, 1, 1,
1.702246, -0.4240169, 0.1249005, 1, 1, 1, 1, 1,
1.7144, -0.1430292, 0.8153068, 1, 1, 1, 1, 1,
1.72643, -0.39201, 2.233832, 1, 1, 1, 1, 1,
1.733828, 0.6309149, 1.270775, 1, 1, 1, 1, 1,
1.755567, 0.5050745, 0.5124808, 1, 1, 1, 1, 1,
1.764927, -0.4820011, 4.163198, 1, 1, 1, 1, 1,
1.771188, -0.939679, 1.097452, 1, 1, 1, 1, 1,
1.802293, -2.410333, 2.122416, 1, 1, 1, 1, 1,
1.808567, -0.540244, 2.859687, 1, 1, 1, 1, 1,
1.832405, -1.498424, 3.623733, 1, 1, 1, 1, 1,
1.859202, 1.018709, 2.907992, 1, 1, 1, 1, 1,
1.864002, 0.7158957, 1.096927, 1, 1, 1, 1, 1,
1.868643, -0.3671836, 1.751039, 1, 1, 1, 1, 1,
1.887043, -0.07267939, -0.2334205, 0, 0, 1, 1, 1,
1.9141, 0.3084762, 2.800972, 1, 0, 0, 1, 1,
1.93848, -0.3117684, 2.785573, 1, 0, 0, 1, 1,
1.957106, 0.8775212, 1.988161, 1, 0, 0, 1, 1,
1.967936, 0.7313471, 1.343584, 1, 0, 0, 1, 1,
2.007093, 0.5763015, 1.035923, 1, 0, 0, 1, 1,
2.047639, 1.250607, 0.8582708, 0, 0, 0, 1, 1,
2.05965, -0.5200284, 0.6178235, 0, 0, 0, 1, 1,
2.108539, -0.5402333, 1.896269, 0, 0, 0, 1, 1,
2.118651, 0.01297364, 0.8355722, 0, 0, 0, 1, 1,
2.152269, -0.2211485, 1.636374, 0, 0, 0, 1, 1,
2.188901, 0.3552203, 2.279619, 0, 0, 0, 1, 1,
2.188977, -0.1113136, 1.820054, 0, 0, 0, 1, 1,
2.256417, 0.1886552, 0.8639159, 1, 1, 1, 1, 1,
2.268698, -0.5576527, 1.507252, 1, 1, 1, 1, 1,
2.416332, 0.8003702, 1.619586, 1, 1, 1, 1, 1,
2.43184, 1.090119, -0.7812042, 1, 1, 1, 1, 1,
2.507377, -0.42492, 1.913038, 1, 1, 1, 1, 1,
2.61737, -0.7573723, 2.553734, 1, 1, 1, 1, 1,
2.780681, -0.9259698, 2.016753, 1, 1, 1, 1, 1
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
var radius = 9.024253;
var distance = 31.6973;
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
mvMatrix.translate( 0.3065633, -0.1219497, -0.1189299 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.6973);
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
