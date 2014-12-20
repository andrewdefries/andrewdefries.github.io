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
-3.284577, 0.2548759, -0.166263, 1, 0, 0, 1,
-3.149795, 0.7832922, 0.1803355, 1, 0.007843138, 0, 1,
-2.768384, 0.8101956, -0.8833513, 1, 0.01176471, 0, 1,
-2.719041, -0.5834754, -3.0139, 1, 0.01960784, 0, 1,
-2.391397, 0.2019801, -1.97647, 1, 0.02352941, 0, 1,
-2.292771, -0.594465, 0.4883261, 1, 0.03137255, 0, 1,
-2.267499, 0.2850102, -2.420841, 1, 0.03529412, 0, 1,
-2.250812, 0.4264985, 0.3498743, 1, 0.04313726, 0, 1,
-2.186407, 0.3223762, -0.2153836, 1, 0.04705882, 0, 1,
-2.136759, -0.4931786, -0.9124498, 1, 0.05490196, 0, 1,
-2.131134, 0.9810454, -2.132533, 1, 0.05882353, 0, 1,
-2.130139, -0.4337832, -0.1677711, 1, 0.06666667, 0, 1,
-2.096628, 2.043791, -0.1921489, 1, 0.07058824, 0, 1,
-2.066126, 2.694405, -2.882493, 1, 0.07843138, 0, 1,
-2.061427, 0.9015456, -2.065589, 1, 0.08235294, 0, 1,
-2.012824, 1.108851, -0.7977267, 1, 0.09019608, 0, 1,
-1.966668, -0.09396728, -0.4125016, 1, 0.09411765, 0, 1,
-1.950706, 2.113476, -0.6893446, 1, 0.1019608, 0, 1,
-1.950526, -1.170735, -1.845783, 1, 0.1098039, 0, 1,
-1.913815, -0.4335967, -0.6596028, 1, 0.1137255, 0, 1,
-1.891855, 0.6222844, -1.971982, 1, 0.1215686, 0, 1,
-1.882207, 0.3440267, -2.40839, 1, 0.1254902, 0, 1,
-1.880052, -0.5655248, -2.540489, 1, 0.1333333, 0, 1,
-1.868549, -0.467541, -0.9833317, 1, 0.1372549, 0, 1,
-1.867312, -1.497321, -1.550558, 1, 0.145098, 0, 1,
-1.864405, -0.07825845, -3.004552, 1, 0.1490196, 0, 1,
-1.863265, -0.1731087, -0.7753582, 1, 0.1568628, 0, 1,
-1.862105, -1.815538, -1.519418, 1, 0.1607843, 0, 1,
-1.857605, -2.085361, -3.692768, 1, 0.1686275, 0, 1,
-1.82436, 0.4025895, 0.5551799, 1, 0.172549, 0, 1,
-1.818236, 0.648289, -2.103154, 1, 0.1803922, 0, 1,
-1.811416, 1.788225, -1.459735, 1, 0.1843137, 0, 1,
-1.808671, -0.3307077, 0.2026814, 1, 0.1921569, 0, 1,
-1.768172, -0.186107, -0.7238783, 1, 0.1960784, 0, 1,
-1.767067, 0.4108072, -0.7203881, 1, 0.2039216, 0, 1,
-1.760657, -0.5054693, -2.224236, 1, 0.2117647, 0, 1,
-1.73016, 0.1927616, -1.480775, 1, 0.2156863, 0, 1,
-1.720958, -0.08936086, -1.258922, 1, 0.2235294, 0, 1,
-1.712955, -0.7313287, -2.577575, 1, 0.227451, 0, 1,
-1.711357, 0.3907076, -2.057344, 1, 0.2352941, 0, 1,
-1.681098, 1.554849, -0.8752142, 1, 0.2392157, 0, 1,
-1.670926, -0.8594091, -2.932853, 1, 0.2470588, 0, 1,
-1.664723, -0.4340717, -2.673088, 1, 0.2509804, 0, 1,
-1.661492, -0.6348765, -2.077117, 1, 0.2588235, 0, 1,
-1.660724, -2.879379, -2.22462, 1, 0.2627451, 0, 1,
-1.654482, 0.6441654, -0.470946, 1, 0.2705882, 0, 1,
-1.645341, -1.021266, -3.388985, 1, 0.2745098, 0, 1,
-1.644572, 1.386565, -0.410561, 1, 0.282353, 0, 1,
-1.631221, -1.117736, -1.077486, 1, 0.2862745, 0, 1,
-1.62443, -0.08826021, -2.118192, 1, 0.2941177, 0, 1,
-1.575522, -0.01718601, -1.100373, 1, 0.3019608, 0, 1,
-1.570431, -0.4980379, -0.5318977, 1, 0.3058824, 0, 1,
-1.562688, 0.7464784, -0.4362633, 1, 0.3137255, 0, 1,
-1.561457, -0.4760458, -3.108039, 1, 0.3176471, 0, 1,
-1.55916, 0.9465006, 1.046216, 1, 0.3254902, 0, 1,
-1.555288, -1.133393, -2.780251, 1, 0.3294118, 0, 1,
-1.554211, -0.7733812, -2.072338, 1, 0.3372549, 0, 1,
-1.551347, 2.00491, -0.9274746, 1, 0.3411765, 0, 1,
-1.54403, -0.6346866, -4.082296, 1, 0.3490196, 0, 1,
-1.540659, -0.3419073, -2.314981, 1, 0.3529412, 0, 1,
-1.538619, 0.5151899, -0.1244282, 1, 0.3607843, 0, 1,
-1.532682, 0.3223015, -1.801129, 1, 0.3647059, 0, 1,
-1.524659, -1.392257, -1.351805, 1, 0.372549, 0, 1,
-1.523561, -0.8921727, -2.259328, 1, 0.3764706, 0, 1,
-1.501888, 0.3599346, -1.536279, 1, 0.3843137, 0, 1,
-1.500279, -0.1693201, -0.6196296, 1, 0.3882353, 0, 1,
-1.493582, 0.5743966, -1.083784, 1, 0.3960784, 0, 1,
-1.487882, 1.194207, -0.540742, 1, 0.4039216, 0, 1,
-1.487735, 0.9292006, -0.6491519, 1, 0.4078431, 0, 1,
-1.485798, -0.6901641, -1.85575, 1, 0.4156863, 0, 1,
-1.475046, 0.03412146, -2.024208, 1, 0.4196078, 0, 1,
-1.472421, -0.4635782, -0.6962926, 1, 0.427451, 0, 1,
-1.470349, 0.1552337, -1.778067, 1, 0.4313726, 0, 1,
-1.461183, -1.649728, -3.485312, 1, 0.4392157, 0, 1,
-1.460106, 0.03331839, -0.0295845, 1, 0.4431373, 0, 1,
-1.455371, 0.5915248, -0.2620993, 1, 0.4509804, 0, 1,
-1.447176, -2.733088, -1.140616, 1, 0.454902, 0, 1,
-1.443522, -0.6853451, -2.813159, 1, 0.4627451, 0, 1,
-1.438001, 0.6411079, -0.4735161, 1, 0.4666667, 0, 1,
-1.431519, 0.2181054, -0.8657788, 1, 0.4745098, 0, 1,
-1.425712, -1.882222, -1.655555, 1, 0.4784314, 0, 1,
-1.415528, 0.05285202, -1.606457, 1, 0.4862745, 0, 1,
-1.402174, 0.9828694, -0.2924671, 1, 0.4901961, 0, 1,
-1.399781, 1.119836, -1.194865, 1, 0.4980392, 0, 1,
-1.396357, -1.586764, -1.070819, 1, 0.5058824, 0, 1,
-1.381827, 0.3890491, -0.6160849, 1, 0.509804, 0, 1,
-1.368399, 1.596443, 0.9380739, 1, 0.5176471, 0, 1,
-1.368382, 1.475984, -1.629678, 1, 0.5215687, 0, 1,
-1.363464, -0.2158114, -2.035368, 1, 0.5294118, 0, 1,
-1.36141, 1.007688, -1.718076, 1, 0.5333334, 0, 1,
-1.355559, 1.02025, -1.955843, 1, 0.5411765, 0, 1,
-1.355039, -0.2200553, -1.693784, 1, 0.5450981, 0, 1,
-1.337646, 0.3062286, -1.948662, 1, 0.5529412, 0, 1,
-1.334167, -1.235885, -1.222206, 1, 0.5568628, 0, 1,
-1.33356, -0.116503, -1.426649, 1, 0.5647059, 0, 1,
-1.328421, -0.3611252, -0.5119532, 1, 0.5686275, 0, 1,
-1.326963, 0.3519687, -1.291048, 1, 0.5764706, 0, 1,
-1.326161, 0.699373, -1.009029, 1, 0.5803922, 0, 1,
-1.32348, -0.0794194, -2.411477, 1, 0.5882353, 0, 1,
-1.317313, -0.07822274, -2.584723, 1, 0.5921569, 0, 1,
-1.315765, 0.3243227, -0.681997, 1, 0.6, 0, 1,
-1.313053, -0.6003137, -1.713911, 1, 0.6078432, 0, 1,
-1.307674, 1.072956, 0.9648027, 1, 0.6117647, 0, 1,
-1.298384, 0.5376862, -0.9961315, 1, 0.6196079, 0, 1,
-1.290106, -1.449999, -2.896982, 1, 0.6235294, 0, 1,
-1.283028, -0.847646, -1.124757, 1, 0.6313726, 0, 1,
-1.27613, 0.6185287, -0.3166524, 1, 0.6352941, 0, 1,
-1.269593, -0.7324232, -0.470647, 1, 0.6431373, 0, 1,
-1.252835, 0.1303132, -1.735154, 1, 0.6470588, 0, 1,
-1.251124, 0.3431299, -1.6323, 1, 0.654902, 0, 1,
-1.250237, -0.1685244, -2.923055, 1, 0.6588235, 0, 1,
-1.23926, 1.754708, 1.063303, 1, 0.6666667, 0, 1,
-1.239002, -0.5299542, -1.940735, 1, 0.6705883, 0, 1,
-1.232765, 1.295325, -1.314253, 1, 0.6784314, 0, 1,
-1.222163, -0.4384225, -3.486568, 1, 0.682353, 0, 1,
-1.214499, -0.7973502, -1.902411, 1, 0.6901961, 0, 1,
-1.213531, 1.67448, -0.8431845, 1, 0.6941177, 0, 1,
-1.210615, -2.201189, -1.896873, 1, 0.7019608, 0, 1,
-1.203399, 1.272719, -0.7533442, 1, 0.7098039, 0, 1,
-1.201265, 0.1826035, -0.1472773, 1, 0.7137255, 0, 1,
-1.198639, 0.4280336, -1.384865, 1, 0.7215686, 0, 1,
-1.197975, 1.999016, -0.7566444, 1, 0.7254902, 0, 1,
-1.195389, 1.527677, -0.8042813, 1, 0.7333333, 0, 1,
-1.187525, 0.465154, 0.5184516, 1, 0.7372549, 0, 1,
-1.187041, 0.09239458, -3.931112, 1, 0.7450981, 0, 1,
-1.171222, 0.9129007, -1.548832, 1, 0.7490196, 0, 1,
-1.167074, -0.377536, -2.555959, 1, 0.7568628, 0, 1,
-1.164728, 0.1310743, -1.59824, 1, 0.7607843, 0, 1,
-1.159276, -0.413516, -1.337789, 1, 0.7686275, 0, 1,
-1.15316, 0.03009527, -2.040375, 1, 0.772549, 0, 1,
-1.150144, 2.458678, -0.03797045, 1, 0.7803922, 0, 1,
-1.142446, -0.1074656, -1.31819, 1, 0.7843137, 0, 1,
-1.132879, -0.9220012, -3.101918, 1, 0.7921569, 0, 1,
-1.128745, -0.4874762, -2.936244, 1, 0.7960784, 0, 1,
-1.127124, 0.4354361, -0.6411369, 1, 0.8039216, 0, 1,
-1.119414, -0.4363581, -1.186542, 1, 0.8117647, 0, 1,
-1.107622, 1.340984, -1.411929, 1, 0.8156863, 0, 1,
-1.10288, -0.4659361, -3.50689, 1, 0.8235294, 0, 1,
-1.102257, -1.018796, -2.586997, 1, 0.827451, 0, 1,
-1.10058, -1.685776, -2.221416, 1, 0.8352941, 0, 1,
-1.100549, -0.5304804, -2.327732, 1, 0.8392157, 0, 1,
-1.09305, 1.144019, 0.3780736, 1, 0.8470588, 0, 1,
-1.087381, -0.8093171, -3.279927, 1, 0.8509804, 0, 1,
-1.085026, 0.9391429, -1.786431, 1, 0.8588235, 0, 1,
-1.083874, 0.9560673, -1.505087, 1, 0.8627451, 0, 1,
-1.078833, -0.5517438, -1.556101, 1, 0.8705882, 0, 1,
-1.078441, -0.4493933, -1.455343, 1, 0.8745098, 0, 1,
-1.077334, 2.981827, 1.573449, 1, 0.8823529, 0, 1,
-1.075198, 0.5017357, -2.135266, 1, 0.8862745, 0, 1,
-1.071114, 0.3170382, -1.738228, 1, 0.8941177, 0, 1,
-1.070299, 1.48926, -1.546369, 1, 0.8980392, 0, 1,
-1.06303, -1.209079, -2.710294, 1, 0.9058824, 0, 1,
-1.058806, 0.4346074, -1.459293, 1, 0.9137255, 0, 1,
-1.048637, 0.04317968, -1.093679, 1, 0.9176471, 0, 1,
-1.048305, -2.73784, -2.535604, 1, 0.9254902, 0, 1,
-1.047484, -1.081583, -2.647399, 1, 0.9294118, 0, 1,
-1.043736, -1.472199, -2.200284, 1, 0.9372549, 0, 1,
-1.039419, 0.8847484, 0.08861051, 1, 0.9411765, 0, 1,
-1.022186, 0.783096, -2.283143, 1, 0.9490196, 0, 1,
-1.018265, -0.1347757, -0.4134298, 1, 0.9529412, 0, 1,
-1.007856, 0.2091776, -0.8232365, 1, 0.9607843, 0, 1,
-0.9984686, -0.3454311, -2.667046, 1, 0.9647059, 0, 1,
-0.9907815, 0.1151649, -1.816475, 1, 0.972549, 0, 1,
-0.9895782, 0.6687125, -1.643865, 1, 0.9764706, 0, 1,
-0.9835055, 0.07274185, -1.468534, 1, 0.9843137, 0, 1,
-0.978655, -0.1814662, -1.624976, 1, 0.9882353, 0, 1,
-0.9762924, 0.3044146, -0.4069719, 1, 0.9960784, 0, 1,
-0.9653928, -1.044197, -2.689079, 0.9960784, 1, 0, 1,
-0.9629809, -0.5696168, -3.380464, 0.9921569, 1, 0, 1,
-0.9549633, -0.2899786, -2.098561, 0.9843137, 1, 0, 1,
-0.9459469, 0.05684372, -1.83857, 0.9803922, 1, 0, 1,
-0.937377, -1.754044, -1.081395, 0.972549, 1, 0, 1,
-0.9224123, -0.3270157, -2.124219, 0.9686275, 1, 0, 1,
-0.9223214, -1.588379, -2.132456, 0.9607843, 1, 0, 1,
-0.9199133, -0.9933298, -1.856084, 0.9568627, 1, 0, 1,
-0.9174771, 0.7539557, -4.005862, 0.9490196, 1, 0, 1,
-0.9160191, 1.384822, -2.026232, 0.945098, 1, 0, 1,
-0.9149597, -0.6772754, -2.741751, 0.9372549, 1, 0, 1,
-0.9130994, 0.3211732, 0.2371911, 0.9333333, 1, 0, 1,
-0.9087189, -0.6302348, -1.911412, 0.9254902, 1, 0, 1,
-0.9073124, -0.1324165, -1.048044, 0.9215686, 1, 0, 1,
-0.9036912, 0.9096627, -0.4228618, 0.9137255, 1, 0, 1,
-0.8973694, 1.363697, -0.8535836, 0.9098039, 1, 0, 1,
-0.8949581, 0.2444276, -2.666571, 0.9019608, 1, 0, 1,
-0.893717, -0.7476621, -2.945932, 0.8941177, 1, 0, 1,
-0.8925697, -0.744414, -2.073009, 0.8901961, 1, 0, 1,
-0.8852842, -0.1990789, -1.69606, 0.8823529, 1, 0, 1,
-0.8850827, -0.497958, -1.495978, 0.8784314, 1, 0, 1,
-0.881635, -0.6345888, 0.106851, 0.8705882, 1, 0, 1,
-0.8793106, -0.7894825, -4.128352, 0.8666667, 1, 0, 1,
-0.8784826, -0.9886196, -2.863934, 0.8588235, 1, 0, 1,
-0.871493, -0.2141242, -2.14243, 0.854902, 1, 0, 1,
-0.8706721, -0.5867093, -2.817498, 0.8470588, 1, 0, 1,
-0.8684667, 1.006105, -0.06165249, 0.8431373, 1, 0, 1,
-0.8621557, 2.604334, 1.61507, 0.8352941, 1, 0, 1,
-0.859493, -0.0722883, 0.2495663, 0.8313726, 1, 0, 1,
-0.847182, -1.225904, -2.20963, 0.8235294, 1, 0, 1,
-0.8433131, 1.249202, -1.205712, 0.8196079, 1, 0, 1,
-0.8411517, -0.3096186, -3.072342, 0.8117647, 1, 0, 1,
-0.8280731, 1.830145, 1.182566, 0.8078431, 1, 0, 1,
-0.819967, 0.7076953, 0.07317605, 0.8, 1, 0, 1,
-0.8176745, -0.02030984, -0.4985166, 0.7921569, 1, 0, 1,
-0.8154352, 0.6351864, -1.582351, 0.7882353, 1, 0, 1,
-0.8111243, -1.109809, -2.629897, 0.7803922, 1, 0, 1,
-0.8109166, 0.007989469, -1.018227, 0.7764706, 1, 0, 1,
-0.8098543, 0.8873461, 0.2938172, 0.7686275, 1, 0, 1,
-0.8093253, 0.05174306, -1.539679, 0.7647059, 1, 0, 1,
-0.8027539, 0.01334868, -1.141777, 0.7568628, 1, 0, 1,
-0.8023881, -0.4412185, -2.885549, 0.7529412, 1, 0, 1,
-0.8021882, -0.8825709, -2.994997, 0.7450981, 1, 0, 1,
-0.7975641, -2.019428, -4.431517, 0.7411765, 1, 0, 1,
-0.7964101, -0.03566857, -1.911156, 0.7333333, 1, 0, 1,
-0.7865017, 0.8777806, 0.5411844, 0.7294118, 1, 0, 1,
-0.7844784, 0.7443816, -0.3599429, 0.7215686, 1, 0, 1,
-0.7798469, -0.2115914, -0.3974899, 0.7176471, 1, 0, 1,
-0.7731247, 0.8396382, -0.1556384, 0.7098039, 1, 0, 1,
-0.7727522, 0.8187663, -0.6881584, 0.7058824, 1, 0, 1,
-0.7717794, -0.8104197, -3.911804, 0.6980392, 1, 0, 1,
-0.7714831, 1.350453, -1.800341, 0.6901961, 1, 0, 1,
-0.7646771, 0.8128069, 0.8467709, 0.6862745, 1, 0, 1,
-0.7623052, -1.100733, -2.609665, 0.6784314, 1, 0, 1,
-0.7593749, -1.40898, -2.332252, 0.6745098, 1, 0, 1,
-0.756524, -2.576801, -3.602401, 0.6666667, 1, 0, 1,
-0.7539113, -1.534893, -3.376158, 0.6627451, 1, 0, 1,
-0.7438916, -1.207212, -4.945638, 0.654902, 1, 0, 1,
-0.7424112, 2.361591, -0.3155904, 0.6509804, 1, 0, 1,
-0.7415535, 0.8388441, 0.8234783, 0.6431373, 1, 0, 1,
-0.7400305, 0.4025071, -0.3367437, 0.6392157, 1, 0, 1,
-0.7377523, -0.7320275, -2.23533, 0.6313726, 1, 0, 1,
-0.732071, 0.8208086, -0.3026187, 0.627451, 1, 0, 1,
-0.7265822, 0.8439886, -1.485756, 0.6196079, 1, 0, 1,
-0.7220058, -0.6859, -1.525669, 0.6156863, 1, 0, 1,
-0.7191237, -0.2484773, -0.6958127, 0.6078432, 1, 0, 1,
-0.7128521, -0.4571943, -3.070284, 0.6039216, 1, 0, 1,
-0.7079774, 0.0951291, 0.2639264, 0.5960785, 1, 0, 1,
-0.7058926, -0.1711, -1.451958, 0.5882353, 1, 0, 1,
-0.6992319, 0.9997928, -0.8763058, 0.5843138, 1, 0, 1,
-0.6943465, 0.9269879, -1.158832, 0.5764706, 1, 0, 1,
-0.6933272, 0.06316847, -2.000109, 0.572549, 1, 0, 1,
-0.6912965, 0.6418046, -1.296986, 0.5647059, 1, 0, 1,
-0.678314, 0.1545005, -0.9764251, 0.5607843, 1, 0, 1,
-0.6777681, -0.9228327, -1.64815, 0.5529412, 1, 0, 1,
-0.6764542, -0.8939663, -3.840125, 0.5490196, 1, 0, 1,
-0.6757425, 0.05458498, -0.8003368, 0.5411765, 1, 0, 1,
-0.6733201, 1.290478, -1.405426, 0.5372549, 1, 0, 1,
-0.6728981, 0.8481386, -2.319071, 0.5294118, 1, 0, 1,
-0.6716794, -0.5400031, -1.26261, 0.5254902, 1, 0, 1,
-0.671222, 1.984617, -1.266361, 0.5176471, 1, 0, 1,
-0.666613, 0.111519, 0.1150103, 0.5137255, 1, 0, 1,
-0.6608983, 0.7754303, -1.675447, 0.5058824, 1, 0, 1,
-0.6568122, 0.1638544, -1.495426, 0.5019608, 1, 0, 1,
-0.6548548, -0.169795, -1.294358, 0.4941176, 1, 0, 1,
-0.6531314, -0.6204391, -1.810538, 0.4862745, 1, 0, 1,
-0.6476088, -1.628226, -3.17708, 0.4823529, 1, 0, 1,
-0.6458881, -0.3435207, -3.31591, 0.4745098, 1, 0, 1,
-0.6457687, -0.1930882, -1.61157, 0.4705882, 1, 0, 1,
-0.6417819, 0.01818751, -0.9858296, 0.4627451, 1, 0, 1,
-0.641207, 1.140101, -0.5393181, 0.4588235, 1, 0, 1,
-0.6407441, 0.03554038, -2.561927, 0.4509804, 1, 0, 1,
-0.6390349, -1.233919, -2.900847, 0.4470588, 1, 0, 1,
-0.6359602, 1.446554, -0.9440657, 0.4392157, 1, 0, 1,
-0.6351747, -0.9737104, -0.6689548, 0.4352941, 1, 0, 1,
-0.6338341, 0.1146122, -2.521202, 0.427451, 1, 0, 1,
-0.6332884, -1.075169, -2.401533, 0.4235294, 1, 0, 1,
-0.6224959, -0.4041959, 0.2539153, 0.4156863, 1, 0, 1,
-0.6163259, -0.5727197, -2.533935, 0.4117647, 1, 0, 1,
-0.608497, 0.3278936, -0.7391509, 0.4039216, 1, 0, 1,
-0.6072935, 0.7502803, 0.7309837, 0.3960784, 1, 0, 1,
-0.6054901, 0.4424755, -1.078113, 0.3921569, 1, 0, 1,
-0.600878, 1.380551, -2.785677, 0.3843137, 1, 0, 1,
-0.5999064, -0.2334327, -2.379085, 0.3803922, 1, 0, 1,
-0.5990127, 0.5839036, -0.2847115, 0.372549, 1, 0, 1,
-0.5967463, -0.03567627, -2.061766, 0.3686275, 1, 0, 1,
-0.5955747, -0.6520227, -3.268924, 0.3607843, 1, 0, 1,
-0.5940143, 0.3102541, 0.08003391, 0.3568628, 1, 0, 1,
-0.593708, 0.3579, -0.3786187, 0.3490196, 1, 0, 1,
-0.59008, -0.8192128, -3.152895, 0.345098, 1, 0, 1,
-0.5897461, -0.128273, -1.300484, 0.3372549, 1, 0, 1,
-0.5896468, -2.168262, -3.05068, 0.3333333, 1, 0, 1,
-0.5870603, -0.1307343, -2.858352, 0.3254902, 1, 0, 1,
-0.5833979, 2.244181, -0.5267394, 0.3215686, 1, 0, 1,
-0.5777593, -0.2937052, -1.630808, 0.3137255, 1, 0, 1,
-0.5755793, 1.376188, -0.5376909, 0.3098039, 1, 0, 1,
-0.5714842, -0.3914435, -1.810568, 0.3019608, 1, 0, 1,
-0.5624065, 0.2280113, -2.632118, 0.2941177, 1, 0, 1,
-0.5607854, 0.2934822, -0.9899853, 0.2901961, 1, 0, 1,
-0.5485225, 2.188195, 0.2986602, 0.282353, 1, 0, 1,
-0.5484602, 0.4257348, -0.8378513, 0.2784314, 1, 0, 1,
-0.5477468, 0.5038879, -2.220951, 0.2705882, 1, 0, 1,
-0.5450673, 0.1578854, -2.721902, 0.2666667, 1, 0, 1,
-0.5426974, -1.538798, -3.364632, 0.2588235, 1, 0, 1,
-0.5417611, 0.4318536, -1.755167, 0.254902, 1, 0, 1,
-0.5404496, 2.103204, -0.07719219, 0.2470588, 1, 0, 1,
-0.5404031, -0.8805889, -1.802851, 0.2431373, 1, 0, 1,
-0.5395625, 1.092758, -0.4522572, 0.2352941, 1, 0, 1,
-0.5356136, -0.4305595, -3.114966, 0.2313726, 1, 0, 1,
-0.5315011, 1.021131, -0.5994884, 0.2235294, 1, 0, 1,
-0.5305076, -0.9941713, -2.762658, 0.2196078, 1, 0, 1,
-0.5302407, -1.347877, -2.18859, 0.2117647, 1, 0, 1,
-0.5271488, -0.7813007, -0.6912283, 0.2078431, 1, 0, 1,
-0.5249203, 0.3854854, -2.657468, 0.2, 1, 0, 1,
-0.5229195, 1.743781, -0.7888548, 0.1921569, 1, 0, 1,
-0.5227874, -0.3692676, -1.842514, 0.1882353, 1, 0, 1,
-0.5189025, -2.175785, -3.48566, 0.1803922, 1, 0, 1,
-0.5177312, -0.2746418, -1.308459, 0.1764706, 1, 0, 1,
-0.5168433, -1.342985, -1.878529, 0.1686275, 1, 0, 1,
-0.5163966, -0.2836139, -1.341794, 0.1647059, 1, 0, 1,
-0.5081285, -1.514585, -3.629181, 0.1568628, 1, 0, 1,
-0.5003057, 1.407494, 0.7561308, 0.1529412, 1, 0, 1,
-0.4948961, 1.517326, -0.431535, 0.145098, 1, 0, 1,
-0.4933046, 1.549076, -0.3217825, 0.1411765, 1, 0, 1,
-0.4848487, -1.762564, -2.582083, 0.1333333, 1, 0, 1,
-0.4829312, -1.611491, -3.872474, 0.1294118, 1, 0, 1,
-0.4798374, 0.06954464, -0.8597586, 0.1215686, 1, 0, 1,
-0.4661649, -0.7874228, -3.594102, 0.1176471, 1, 0, 1,
-0.461407, 0.9464874, -1.495507, 0.1098039, 1, 0, 1,
-0.4605134, -0.5461453, -4.210671, 0.1058824, 1, 0, 1,
-0.4603404, 0.5820943, -1.590484, 0.09803922, 1, 0, 1,
-0.4574247, -0.07272355, -2.802945, 0.09019608, 1, 0, 1,
-0.4532749, 0.8329747, -0.6206086, 0.08627451, 1, 0, 1,
-0.4519369, -0.1699875, -2.281898, 0.07843138, 1, 0, 1,
-0.4507974, 0.09082076, -0.2490266, 0.07450981, 1, 0, 1,
-0.4473891, -0.3778206, -1.956516, 0.06666667, 1, 0, 1,
-0.4417683, -0.1232193, -0.7918453, 0.0627451, 1, 0, 1,
-0.4385836, -0.1984575, -0.9238644, 0.05490196, 1, 0, 1,
-0.4354819, 0.7264181, 0.5810525, 0.05098039, 1, 0, 1,
-0.4334875, 0.001190333, 0.2128129, 0.04313726, 1, 0, 1,
-0.4324106, -0.6166174, -1.980225, 0.03921569, 1, 0, 1,
-0.4282661, 0.6814037, -0.3057507, 0.03137255, 1, 0, 1,
-0.4243157, 0.9993731, 1.69846, 0.02745098, 1, 0, 1,
-0.4234634, 0.321396, -0.5777342, 0.01960784, 1, 0, 1,
-0.4224809, 0.1389474, 0.4949491, 0.01568628, 1, 0, 1,
-0.4187885, 1.453806, -1.740101, 0.007843138, 1, 0, 1,
-0.4183021, -2.349252, -2.562538, 0.003921569, 1, 0, 1,
-0.4147431, -1.05282, -4.620917, 0, 1, 0.003921569, 1,
-0.4140206, 0.4146916, -1.802411, 0, 1, 0.01176471, 1,
-0.4110831, 0.517252, -1.285666, 0, 1, 0.01568628, 1,
-0.4104732, 0.3412585, -0.02013274, 0, 1, 0.02352941, 1,
-0.4100247, -2.198117, -3.407016, 0, 1, 0.02745098, 1,
-0.4092435, -1.501408, -3.071374, 0, 1, 0.03529412, 1,
-0.4084582, 0.5167594, 0.2629767, 0, 1, 0.03921569, 1,
-0.4076249, -0.2984705, -2.61272, 0, 1, 0.04705882, 1,
-0.4065675, 0.7502934, -2.195257, 0, 1, 0.05098039, 1,
-0.4062201, -0.7578948, -2.420452, 0, 1, 0.05882353, 1,
-0.4009716, -0.6633782, -1.586214, 0, 1, 0.0627451, 1,
-0.3981396, -1.29238, -3.790443, 0, 1, 0.07058824, 1,
-0.3940832, -0.4796581, -1.58116, 0, 1, 0.07450981, 1,
-0.3902335, -0.3577679, -2.1324, 0, 1, 0.08235294, 1,
-0.3862531, 1.179587, -1.20874, 0, 1, 0.08627451, 1,
-0.384247, 0.5164488, 0.6334195, 0, 1, 0.09411765, 1,
-0.3800496, -2.020298, -3.167315, 0, 1, 0.1019608, 1,
-0.3721652, 1.374572, 0.7225965, 0, 1, 0.1058824, 1,
-0.3656103, -0.8200166, -3.070769, 0, 1, 0.1137255, 1,
-0.3612384, -1.931222, -2.189875, 0, 1, 0.1176471, 1,
-0.361001, -0.9049493, -3.474798, 0, 1, 0.1254902, 1,
-0.360119, 0.5008872, -0.4291952, 0, 1, 0.1294118, 1,
-0.3583947, 0.8481708, -0.04941492, 0, 1, 0.1372549, 1,
-0.3553927, 0.6098756, -1.45103, 0, 1, 0.1411765, 1,
-0.3507362, -1.256009, -3.816287, 0, 1, 0.1490196, 1,
-0.3456334, -0.5763779, -3.00994, 0, 1, 0.1529412, 1,
-0.3399339, 0.5123547, -0.3180679, 0, 1, 0.1607843, 1,
-0.339743, 1.209875, -0.1839801, 0, 1, 0.1647059, 1,
-0.3349884, 1.715232, 0.4550618, 0, 1, 0.172549, 1,
-0.3286032, 0.3230848, -0.07211307, 0, 1, 0.1764706, 1,
-0.3274448, 0.2351645, -2.349175, 0, 1, 0.1843137, 1,
-0.3251071, -0.5681688, -1.909074, 0, 1, 0.1882353, 1,
-0.3224721, -0.1842955, -2.275897, 0, 1, 0.1960784, 1,
-0.3122307, 0.5346712, -0.7111452, 0, 1, 0.2039216, 1,
-0.3118887, -1.479525, -3.971197, 0, 1, 0.2078431, 1,
-0.305981, 0.5542551, -1.195815, 0, 1, 0.2156863, 1,
-0.30112, -0.7203408, -3.398463, 0, 1, 0.2196078, 1,
-0.2994037, -0.7635838, -0.8331872, 0, 1, 0.227451, 1,
-0.2938586, 1.068403, -0.2522938, 0, 1, 0.2313726, 1,
-0.2919487, -0.9994593, -2.855282, 0, 1, 0.2392157, 1,
-0.2909929, 0.4561597, 1.304302, 0, 1, 0.2431373, 1,
-0.2908436, -1.043311, -1.691035, 0, 1, 0.2509804, 1,
-0.2836496, -0.3921578, -1.751923, 0, 1, 0.254902, 1,
-0.2762322, 0.02136069, -1.324288, 0, 1, 0.2627451, 1,
-0.2757207, -1.051106, -1.538623, 0, 1, 0.2666667, 1,
-0.2723832, 0.654749, 0.966393, 0, 1, 0.2745098, 1,
-0.2717961, -1.604605, -3.363886, 0, 1, 0.2784314, 1,
-0.2714284, -0.2902248, -2.693112, 0, 1, 0.2862745, 1,
-0.2667174, 0.5691732, 0.7265499, 0, 1, 0.2901961, 1,
-0.262491, -1.176167, -2.7657, 0, 1, 0.2980392, 1,
-0.2576099, -0.335369, -3.130429, 0, 1, 0.3058824, 1,
-0.255596, 3.179794, -0.3455878, 0, 1, 0.3098039, 1,
-0.2492183, 0.9711144, -0.8657342, 0, 1, 0.3176471, 1,
-0.2476342, 0.8500368, -0.1777083, 0, 1, 0.3215686, 1,
-0.246853, 1.059807, 0.3435608, 0, 1, 0.3294118, 1,
-0.2460097, -0.4577954, -2.855818, 0, 1, 0.3333333, 1,
-0.2395967, 0.0533189, -0.597565, 0, 1, 0.3411765, 1,
-0.2392377, 1.268949, -0.5972478, 0, 1, 0.345098, 1,
-0.2349685, -0.4949105, -2.002613, 0, 1, 0.3529412, 1,
-0.2312695, -0.6999478, -1.428034, 0, 1, 0.3568628, 1,
-0.2306666, -1.324602, -3.095452, 0, 1, 0.3647059, 1,
-0.2271674, 1.563636, 1.11363, 0, 1, 0.3686275, 1,
-0.2260849, -0.6077095, -2.110565, 0, 1, 0.3764706, 1,
-0.2228506, 0.5124865, -0.1283554, 0, 1, 0.3803922, 1,
-0.2205341, -0.09727951, -2.507742, 0, 1, 0.3882353, 1,
-0.2018885, -0.013217, -2.218179, 0, 1, 0.3921569, 1,
-0.1986068, 0.3309196, -1.136835, 0, 1, 0.4, 1,
-0.196994, -0.4186074, -4.415621, 0, 1, 0.4078431, 1,
-0.193396, 1.22812, -0.1142944, 0, 1, 0.4117647, 1,
-0.1922511, 0.03477917, -1.900492, 0, 1, 0.4196078, 1,
-0.1918785, 1.659109, -0.8319646, 0, 1, 0.4235294, 1,
-0.1878589, -2.352918, -3.580357, 0, 1, 0.4313726, 1,
-0.1843881, 0.4552845, -1.066981, 0, 1, 0.4352941, 1,
-0.1841448, -0.516821, -2.543341, 0, 1, 0.4431373, 1,
-0.1835589, 0.5286237, -2.405023, 0, 1, 0.4470588, 1,
-0.1747591, -0.9987068, -3.057077, 0, 1, 0.454902, 1,
-0.1738915, 1.21644, -0.2764627, 0, 1, 0.4588235, 1,
-0.1724799, -1.394224, -2.250409, 0, 1, 0.4666667, 1,
-0.1684946, -1.248619, -1.844392, 0, 1, 0.4705882, 1,
-0.1678742, 0.6905922, 1.112784, 0, 1, 0.4784314, 1,
-0.1637339, -0.1005918, -2.029639, 0, 1, 0.4823529, 1,
-0.1624326, -1.742994, -2.602117, 0, 1, 0.4901961, 1,
-0.1603371, -0.3621497, -3.593841, 0, 1, 0.4941176, 1,
-0.159019, 0.06682426, -2.657285, 0, 1, 0.5019608, 1,
-0.158796, 0.5193166, -0.6313326, 0, 1, 0.509804, 1,
-0.1585255, -0.2946329, -2.167689, 0, 1, 0.5137255, 1,
-0.1567377, -0.6539583, -3.207052, 0, 1, 0.5215687, 1,
-0.1546825, 1.685985, 0.1363806, 0, 1, 0.5254902, 1,
-0.1523695, 0.9026074, -0.9763827, 0, 1, 0.5333334, 1,
-0.152066, 1.229267, 0.2514445, 0, 1, 0.5372549, 1,
-0.1440644, 2.363525, -0.4855546, 0, 1, 0.5450981, 1,
-0.1425712, -0.5526366, -2.071569, 0, 1, 0.5490196, 1,
-0.1386767, 0.3456907, -0.7512707, 0, 1, 0.5568628, 1,
-0.1359175, -1.52188, -3.502654, 0, 1, 0.5607843, 1,
-0.1335539, 0.1635162, 0.5250919, 0, 1, 0.5686275, 1,
-0.1284293, -0.9486802, -1.973544, 0, 1, 0.572549, 1,
-0.1241092, 0.326225, -1.370395, 0, 1, 0.5803922, 1,
-0.1202097, -1.027505, -2.961812, 0, 1, 0.5843138, 1,
-0.1195447, 1.43098, 0.9600204, 0, 1, 0.5921569, 1,
-0.1187772, -2.548287, -2.575014, 0, 1, 0.5960785, 1,
-0.1184129, 0.3267325, 2.290996, 0, 1, 0.6039216, 1,
-0.115975, -1.518183, -2.128028, 0, 1, 0.6117647, 1,
-0.11404, -0.4452907, -5.912653, 0, 1, 0.6156863, 1,
-0.1135286, 0.9989005, -1.056132, 0, 1, 0.6235294, 1,
-0.1124858, -1.427175, -2.418162, 0, 1, 0.627451, 1,
-0.1070785, 2.470022, 0.1481405, 0, 1, 0.6352941, 1,
-0.09473417, -0.5294686, -3.258921, 0, 1, 0.6392157, 1,
-0.09128798, -0.7662018, -3.526552, 0, 1, 0.6470588, 1,
-0.09063853, -0.9162341, -2.777834, 0, 1, 0.6509804, 1,
-0.08925696, -1.201615, -4.392319, 0, 1, 0.6588235, 1,
-0.08545317, -0.1389931, -2.963345, 0, 1, 0.6627451, 1,
-0.08392728, 1.376255, 1.269835, 0, 1, 0.6705883, 1,
-0.06698178, 2.126302, -0.6010513, 0, 1, 0.6745098, 1,
-0.06588306, 1.639951, -0.7614875, 0, 1, 0.682353, 1,
-0.0650358, 1.138512, 0.1526625, 0, 1, 0.6862745, 1,
-0.060924, -0.6355923, -2.760392, 0, 1, 0.6941177, 1,
-0.06079251, -0.7835813, -3.160166, 0, 1, 0.7019608, 1,
-0.06073294, -1.830186, -4.960851, 0, 1, 0.7058824, 1,
-0.05985727, -0.0681929, -2.521008, 0, 1, 0.7137255, 1,
-0.05965483, -0.5961916, -2.584764, 0, 1, 0.7176471, 1,
-0.05646195, -0.3084596, -3.519583, 0, 1, 0.7254902, 1,
-0.05587674, 0.3996771, 1.324293, 0, 1, 0.7294118, 1,
-0.0553875, -0.08093598, -2.611275, 0, 1, 0.7372549, 1,
-0.05441873, -0.4281976, -2.712045, 0, 1, 0.7411765, 1,
-0.04934072, 0.4985816, -0.3376574, 0, 1, 0.7490196, 1,
-0.04654725, -1.04414, -3.937139, 0, 1, 0.7529412, 1,
-0.04411905, -1.330951, -3.689477, 0, 1, 0.7607843, 1,
-0.04018743, 0.1574119, -0.3330474, 0, 1, 0.7647059, 1,
-0.03675074, -0.3744747, -3.613821, 0, 1, 0.772549, 1,
-0.03250391, 2.739835, 1.039546, 0, 1, 0.7764706, 1,
-0.029631, -0.8747064, -4.478132, 0, 1, 0.7843137, 1,
-0.02935102, 0.3856317, 0.2592069, 0, 1, 0.7882353, 1,
-0.02765462, -0.2249521, -2.832527, 0, 1, 0.7960784, 1,
-0.02654902, -0.04944576, -1.354255, 0, 1, 0.8039216, 1,
-0.02485913, 0.2558814, -0.8764918, 0, 1, 0.8078431, 1,
-0.02383174, 1.097111, 1.488258, 0, 1, 0.8156863, 1,
-0.02205603, -1.692821, -1.744265, 0, 1, 0.8196079, 1,
-0.01938749, 0.8500941, -0.7993623, 0, 1, 0.827451, 1,
-0.01891946, -0.5248519, -2.625752, 0, 1, 0.8313726, 1,
-0.01569118, -1.25571, -3.720508, 0, 1, 0.8392157, 1,
-0.01500981, 0.3450639, -2.142753, 0, 1, 0.8431373, 1,
-0.01439764, 0.9709506, 0.4990093, 0, 1, 0.8509804, 1,
-0.01288414, -0.02007766, -1.604793, 0, 1, 0.854902, 1,
-0.01199107, 0.7297797, 0.08969853, 0, 1, 0.8627451, 1,
-0.0118872, 0.1931672, -0.7720346, 0, 1, 0.8666667, 1,
-0.009073916, -0.9612747, -2.144713, 0, 1, 0.8745098, 1,
-0.008839888, -0.375479, -1.796651, 0, 1, 0.8784314, 1,
-0.008002984, -0.6171837, -3.275738, 0, 1, 0.8862745, 1,
-0.006877804, 0.8282592, 0.6867638, 0, 1, 0.8901961, 1,
-0.002996832, -1.359692, -2.459399, 0, 1, 0.8980392, 1,
-0.001433089, -0.8112997, -3.110744, 0, 1, 0.9058824, 1,
0.0008471653, -0.4653527, 3.553229, 0, 1, 0.9098039, 1,
0.003399107, -2.383622, 2.988936, 0, 1, 0.9176471, 1,
0.01435473, 0.8298123, 0.4655398, 0, 1, 0.9215686, 1,
0.01578464, -0.3179216, 1.922879, 0, 1, 0.9294118, 1,
0.01898894, 0.3447822, 1.984597, 0, 1, 0.9333333, 1,
0.01930138, -1.126984, 0.8514728, 0, 1, 0.9411765, 1,
0.02207659, -0.1833654, 4.483624, 0, 1, 0.945098, 1,
0.02292279, 2.47034, -0.9334722, 0, 1, 0.9529412, 1,
0.02405344, -1.337159, 3.506438, 0, 1, 0.9568627, 1,
0.02920795, -0.8238981, 3.772374, 0, 1, 0.9647059, 1,
0.02997028, 0.6025487, -0.7673052, 0, 1, 0.9686275, 1,
0.03388446, -0.4575021, 4.083286, 0, 1, 0.9764706, 1,
0.03489273, 0.1146042, -0.3350505, 0, 1, 0.9803922, 1,
0.03663763, -0.4564786, 3.940003, 0, 1, 0.9882353, 1,
0.04911877, 0.1016326, 0.8706558, 0, 1, 0.9921569, 1,
0.05189951, -0.06457667, 2.154406, 0, 1, 1, 1,
0.05254284, 0.903736, 1.232611, 0, 0.9921569, 1, 1,
0.0527553, 0.2250509, 1.674349, 0, 0.9882353, 1, 1,
0.05402624, -0.07505279, 1.755794, 0, 0.9803922, 1, 1,
0.06307992, 0.2656119, 0.1317396, 0, 0.9764706, 1, 1,
0.06309233, -2.493732, 3.071321, 0, 0.9686275, 1, 1,
0.06568099, -0.3873778, 3.357392, 0, 0.9647059, 1, 1,
0.0660859, -0.8766482, 3.091713, 0, 0.9568627, 1, 1,
0.06694449, 0.9270659, 1.423635, 0, 0.9529412, 1, 1,
0.06770707, -1.050362, 3.505933, 0, 0.945098, 1, 1,
0.07310292, -0.698168, 2.832991, 0, 0.9411765, 1, 1,
0.07684611, -1.094358, 2.460191, 0, 0.9333333, 1, 1,
0.08392695, -1.255138, 3.378394, 0, 0.9294118, 1, 1,
0.08403285, -0.2063808, 2.960108, 0, 0.9215686, 1, 1,
0.09151027, -0.3704264, 3.63188, 0, 0.9176471, 1, 1,
0.09288704, 0.9997624, -1.366655, 0, 0.9098039, 1, 1,
0.09566001, -0.7098674, 3.147377, 0, 0.9058824, 1, 1,
0.09601067, 0.07541259, 0.3745947, 0, 0.8980392, 1, 1,
0.09713463, 0.4133486, 1.263803, 0, 0.8901961, 1, 1,
0.09716199, -0.1589329, 1.85582, 0, 0.8862745, 1, 1,
0.103275, -1.928692, 3.419312, 0, 0.8784314, 1, 1,
0.1035934, 2.406165, -0.165512, 0, 0.8745098, 1, 1,
0.1057623, -1.371812, 3.054797, 0, 0.8666667, 1, 1,
0.1062442, -0.6458122, 2.698487, 0, 0.8627451, 1, 1,
0.1065944, 0.5540805, 0.222453, 0, 0.854902, 1, 1,
0.1097967, -1.123521, 3.87595, 0, 0.8509804, 1, 1,
0.1099837, 1.136898, -0.5195873, 0, 0.8431373, 1, 1,
0.1152133, -0.330002, 3.129188, 0, 0.8392157, 1, 1,
0.1161508, -0.04492643, 0.6099109, 0, 0.8313726, 1, 1,
0.1174608, 0.4252887, 0.6313043, 0, 0.827451, 1, 1,
0.1238166, 0.08181901, 0.7659376, 0, 0.8196079, 1, 1,
0.1312322, -1.546325, 1.444402, 0, 0.8156863, 1, 1,
0.1345426, -1.315948, 4.628076, 0, 0.8078431, 1, 1,
0.1363465, -1.391326, 1.987045, 0, 0.8039216, 1, 1,
0.1400934, -0.1185423, 0.439931, 0, 0.7960784, 1, 1,
0.1414279, -0.2118017, 2.57621, 0, 0.7882353, 1, 1,
0.143483, 1.279059, -1.621056, 0, 0.7843137, 1, 1,
0.1450647, -0.8217672, 1.298805, 0, 0.7764706, 1, 1,
0.1461528, -1.301709, 2.570135, 0, 0.772549, 1, 1,
0.1461945, -1.316734, 3.922298, 0, 0.7647059, 1, 1,
0.1472738, -1.45134, 2.080248, 0, 0.7607843, 1, 1,
0.1479608, -0.5832134, 2.256813, 0, 0.7529412, 1, 1,
0.1528918, 0.3014053, 2.626651, 0, 0.7490196, 1, 1,
0.1546093, 0.03550936, 1.286121, 0, 0.7411765, 1, 1,
0.1550226, -0.651985, 2.070915, 0, 0.7372549, 1, 1,
0.159488, -0.6632476, 3.829001, 0, 0.7294118, 1, 1,
0.16208, -1.919278, 3.519315, 0, 0.7254902, 1, 1,
0.1634742, 0.5278875, 1.760706, 0, 0.7176471, 1, 1,
0.1668443, 0.5820625, 0.1677535, 0, 0.7137255, 1, 1,
0.1686808, -0.3443728, 3.504784, 0, 0.7058824, 1, 1,
0.1695561, 0.5690635, 0.3803766, 0, 0.6980392, 1, 1,
0.1695673, -0.07385816, 2.352908, 0, 0.6941177, 1, 1,
0.1698137, -0.2818545, 2.57319, 0, 0.6862745, 1, 1,
0.1719624, 0.4752796, -0.8550283, 0, 0.682353, 1, 1,
0.1766208, -1.230094, 2.453589, 0, 0.6745098, 1, 1,
0.1767839, -0.2680841, 2.456255, 0, 0.6705883, 1, 1,
0.1790855, 2.155245, -1.192067, 0, 0.6627451, 1, 1,
0.182345, -1.442424, 3.714564, 0, 0.6588235, 1, 1,
0.1856265, 0.4852904, -0.243765, 0, 0.6509804, 1, 1,
0.195182, 0.5573596, 0.04585602, 0, 0.6470588, 1, 1,
0.197244, -0.1799786, 2.053045, 0, 0.6392157, 1, 1,
0.1977777, 0.4698214, -0.4100262, 0, 0.6352941, 1, 1,
0.2011917, -0.3051854, 3.388335, 0, 0.627451, 1, 1,
0.210584, -0.3854999, 3.647679, 0, 0.6235294, 1, 1,
0.2135562, 0.4702456, 1.133232, 0, 0.6156863, 1, 1,
0.215758, 0.3579829, 0.3360327, 0, 0.6117647, 1, 1,
0.218211, -0.5151672, 3.911661, 0, 0.6039216, 1, 1,
0.2197308, 1.361655, 0.640385, 0, 0.5960785, 1, 1,
0.2204903, -0.2898743, 4.833171, 0, 0.5921569, 1, 1,
0.2232422, 0.005194221, 1.979579, 0, 0.5843138, 1, 1,
0.2252232, -2.884775, 2.415525, 0, 0.5803922, 1, 1,
0.2285182, 0.9319125, 0.9572346, 0, 0.572549, 1, 1,
0.2323805, 0.2264246, -0.3016497, 0, 0.5686275, 1, 1,
0.2381474, -1.617373, 3.325002, 0, 0.5607843, 1, 1,
0.2503331, -0.8568628, 3.720456, 0, 0.5568628, 1, 1,
0.2581212, 0.1262302, 1.340619, 0, 0.5490196, 1, 1,
0.2590366, -0.2431688, 2.169666, 0, 0.5450981, 1, 1,
0.2667522, -0.2510863, 3.058212, 0, 0.5372549, 1, 1,
0.268082, -0.7582307, 2.579444, 0, 0.5333334, 1, 1,
0.2727798, 1.264648, 0.7197756, 0, 0.5254902, 1, 1,
0.2729048, -0.704048, 1.542673, 0, 0.5215687, 1, 1,
0.2729751, 1.206524, -1.107128, 0, 0.5137255, 1, 1,
0.2738806, 0.3288558, -0.6290646, 0, 0.509804, 1, 1,
0.2772856, 2.188575, -1.715873, 0, 0.5019608, 1, 1,
0.2782463, 1.601019, 0.1247233, 0, 0.4941176, 1, 1,
0.2800854, 1.231465, 0.2452269, 0, 0.4901961, 1, 1,
0.2803594, -0.1089378, 1.438318, 0, 0.4823529, 1, 1,
0.2810425, 0.2533355, 1.604224, 0, 0.4784314, 1, 1,
0.2828512, 0.5246385, 1.475051, 0, 0.4705882, 1, 1,
0.2845271, 0.2356715, 0.963823, 0, 0.4666667, 1, 1,
0.2855313, 0.3178361, 0.7358812, 0, 0.4588235, 1, 1,
0.2873074, 0.4296742, 0.8109189, 0, 0.454902, 1, 1,
0.2876459, 1.039265, -0.3734418, 0, 0.4470588, 1, 1,
0.2905271, 1.377996, -1.908726, 0, 0.4431373, 1, 1,
0.2938502, 0.08161257, 0.2943845, 0, 0.4352941, 1, 1,
0.2976779, -1.406683, 4.045121, 0, 0.4313726, 1, 1,
0.3030722, -0.3344309, 2.376608, 0, 0.4235294, 1, 1,
0.3143876, -1.454645, 1.460883, 0, 0.4196078, 1, 1,
0.3180948, 0.7357822, 0.5817552, 0, 0.4117647, 1, 1,
0.3202023, 0.3315468, 1.114798, 0, 0.4078431, 1, 1,
0.321108, -0.5756168, 2.438149, 0, 0.4, 1, 1,
0.32861, 2.516024, -0.3090495, 0, 0.3921569, 1, 1,
0.328929, -0.3689325, 3.304265, 0, 0.3882353, 1, 1,
0.331063, -1.299226, 3.034387, 0, 0.3803922, 1, 1,
0.3317229, 0.3530432, 1.774022, 0, 0.3764706, 1, 1,
0.3357, -0.495814, 1.434872, 0, 0.3686275, 1, 1,
0.3377275, -0.0573095, 2.83847, 0, 0.3647059, 1, 1,
0.3383346, -0.01363324, 3.571286, 0, 0.3568628, 1, 1,
0.3474786, -0.331222, 3.058991, 0, 0.3529412, 1, 1,
0.3536414, 0.1746943, 1.649777, 0, 0.345098, 1, 1,
0.3543816, 0.1591852, 1.495122, 0, 0.3411765, 1, 1,
0.3568546, 0.7068762, -0.6891761, 0, 0.3333333, 1, 1,
0.3569178, 1.18957, 0.02610049, 0, 0.3294118, 1, 1,
0.362605, -1.243032, 2.938951, 0, 0.3215686, 1, 1,
0.3654252, 1.080962, -0.6250417, 0, 0.3176471, 1, 1,
0.3675675, 0.8228534, 0.376259, 0, 0.3098039, 1, 1,
0.3695537, 1.427957, 0.1517419, 0, 0.3058824, 1, 1,
0.370757, -1.143247, 2.61538, 0, 0.2980392, 1, 1,
0.3712774, 1.404817, 0.6278557, 0, 0.2901961, 1, 1,
0.3804021, 0.2329636, -0.8678881, 0, 0.2862745, 1, 1,
0.384037, 1.05058, 0.4801584, 0, 0.2784314, 1, 1,
0.3873993, 0.6064965, -1.958292, 0, 0.2745098, 1, 1,
0.3926201, 0.6077443, 2.532519, 0, 0.2666667, 1, 1,
0.3944324, -1.325988, 2.513514, 0, 0.2627451, 1, 1,
0.3957645, -0.4368166, 2.721346, 0, 0.254902, 1, 1,
0.3963883, 0.9405835, 0.1366343, 0, 0.2509804, 1, 1,
0.3969662, 0.09245308, 1.605573, 0, 0.2431373, 1, 1,
0.3970071, 0.9082379, 1.110301, 0, 0.2392157, 1, 1,
0.3972432, -1.522804, 3.541316, 0, 0.2313726, 1, 1,
0.4001022, 0.3227484, 0.2820572, 0, 0.227451, 1, 1,
0.4012159, -0.8154806, 3.657861, 0, 0.2196078, 1, 1,
0.402155, -0.4841698, 2.35036, 0, 0.2156863, 1, 1,
0.4023838, -2.010064, 3.93587, 0, 0.2078431, 1, 1,
0.4063407, -1.040649, 4.460548, 0, 0.2039216, 1, 1,
0.4088239, 0.6652671, 0.2096826, 0, 0.1960784, 1, 1,
0.4090432, -1.440311, 3.20615, 0, 0.1882353, 1, 1,
0.4100663, 0.02169558, 2.355931, 0, 0.1843137, 1, 1,
0.4130903, -1.137081, 4.655077, 0, 0.1764706, 1, 1,
0.4176471, 0.8400861, 0.8691854, 0, 0.172549, 1, 1,
0.4197258, 0.5822307, 0.4641417, 0, 0.1647059, 1, 1,
0.4240642, 2.1191, -1.493328, 0, 0.1607843, 1, 1,
0.4268638, -1.153956, 3.103388, 0, 0.1529412, 1, 1,
0.4295228, -0.2357291, 1.097269, 0, 0.1490196, 1, 1,
0.4338425, -0.7410124, 1.693918, 0, 0.1411765, 1, 1,
0.4372283, -0.394497, 1.26992, 0, 0.1372549, 1, 1,
0.4388805, -1.654742, 2.952818, 0, 0.1294118, 1, 1,
0.4452615, 0.4924426, -0.3197475, 0, 0.1254902, 1, 1,
0.4485597, -1.217345, 2.743348, 0, 0.1176471, 1, 1,
0.4512175, 0.2621985, 0.111071, 0, 0.1137255, 1, 1,
0.4562201, 1.496645, 0.256508, 0, 0.1058824, 1, 1,
0.4570172, -1.030928, 3.709856, 0, 0.09803922, 1, 1,
0.460886, 2.100765, 0.9621136, 0, 0.09411765, 1, 1,
0.4718465, -0.8044859, 2.084509, 0, 0.08627451, 1, 1,
0.4728623, -0.8813494, 1.75378, 0, 0.08235294, 1, 1,
0.4731042, 0.9072112, 1.135119, 0, 0.07450981, 1, 1,
0.4762181, 0.8284134, 1.624571, 0, 0.07058824, 1, 1,
0.4767767, -0.453929, 1.336671, 0, 0.0627451, 1, 1,
0.4843575, 0.0890398, 1.144074, 0, 0.05882353, 1, 1,
0.4844331, 1.187055, -0.712907, 0, 0.05098039, 1, 1,
0.4880887, -1.366109, 2.925689, 0, 0.04705882, 1, 1,
0.4918314, 0.1354272, 2.180732, 0, 0.03921569, 1, 1,
0.4966876, -0.4197412, 2.39041, 0, 0.03529412, 1, 1,
0.5022976, 0.9699505, 0.3385875, 0, 0.02745098, 1, 1,
0.5028729, -0.5124207, 2.011968, 0, 0.02352941, 1, 1,
0.5030329, 1.497702, 0.06640714, 0, 0.01568628, 1, 1,
0.5063345, -0.9000096, 1.790664, 0, 0.01176471, 1, 1,
0.5067341, 1.146496, 1.05127, 0, 0.003921569, 1, 1,
0.5086398, -0.5817219, 3.17665, 0.003921569, 0, 1, 1,
0.5086934, -1.292464, 1.777707, 0.007843138, 0, 1, 1,
0.5155808, -1.042288, 2.481719, 0.01568628, 0, 1, 1,
0.5169572, -0.1714128, 2.929728, 0.01960784, 0, 1, 1,
0.5203162, -1.204843, 1.683993, 0.02745098, 0, 1, 1,
0.5221493, -1.693075, 3.886229, 0.03137255, 0, 1, 1,
0.5254568, -0.6084708, 2.042899, 0.03921569, 0, 1, 1,
0.5279512, -0.1437727, 2.740998, 0.04313726, 0, 1, 1,
0.531854, 0.2580937, 1.882765, 0.05098039, 0, 1, 1,
0.5322214, 0.6395895, 1.029169, 0.05490196, 0, 1, 1,
0.5423298, -0.8531953, 2.570082, 0.0627451, 0, 1, 1,
0.5475607, -1.308016, 3.79349, 0.06666667, 0, 1, 1,
0.5479594, 0.9248984, 0.801052, 0.07450981, 0, 1, 1,
0.5486264, 0.2374416, 1.156795, 0.07843138, 0, 1, 1,
0.5498569, -0.7679681, 1.979346, 0.08627451, 0, 1, 1,
0.5543782, -0.2735623, 3.893087, 0.09019608, 0, 1, 1,
0.5545153, 1.00226, -1.030834, 0.09803922, 0, 1, 1,
0.5545948, -1.103383, 1.399568, 0.1058824, 0, 1, 1,
0.5566572, 0.8163307, -1.670379, 0.1098039, 0, 1, 1,
0.5601184, -0.9799259, 2.827855, 0.1176471, 0, 1, 1,
0.5644764, 0.6745579, 1.649486, 0.1215686, 0, 1, 1,
0.5655461, 1.091605, 1.06978, 0.1294118, 0, 1, 1,
0.566976, 1.624219, 1.740851, 0.1333333, 0, 1, 1,
0.5697365, 0.7696277, 0.6254056, 0.1411765, 0, 1, 1,
0.5742796, -2.067715, 3.341572, 0.145098, 0, 1, 1,
0.5798054, 0.195381, 0.78135, 0.1529412, 0, 1, 1,
0.5921801, -0.5448796, 0.3174506, 0.1568628, 0, 1, 1,
0.5937967, -1.05581, 3.151565, 0.1647059, 0, 1, 1,
0.5958534, -1.575127, 3.803135, 0.1686275, 0, 1, 1,
0.6032929, 0.6284325, -0.9515814, 0.1764706, 0, 1, 1,
0.6050937, -0.1100109, 2.047921, 0.1803922, 0, 1, 1,
0.6108596, 1.315698, 0.2542774, 0.1882353, 0, 1, 1,
0.617493, 1.366547, 1.242498, 0.1921569, 0, 1, 1,
0.6234895, -0.6984099, 2.203103, 0.2, 0, 1, 1,
0.6246744, -1.096213, 2.684734, 0.2078431, 0, 1, 1,
0.6279902, 1.397837, 1.426121, 0.2117647, 0, 1, 1,
0.6381996, 1.013587, 0.5657949, 0.2196078, 0, 1, 1,
0.6388674, 0.125948, 0.7122128, 0.2235294, 0, 1, 1,
0.6394548, -0.4641912, 4.019184, 0.2313726, 0, 1, 1,
0.6415496, -1.964761, 3.013191, 0.2352941, 0, 1, 1,
0.645182, -1.095347, 1.967407, 0.2431373, 0, 1, 1,
0.6462611, -0.483944, 3.168217, 0.2470588, 0, 1, 1,
0.6477489, -0.755953, 2.029003, 0.254902, 0, 1, 1,
0.6514201, 0.3257492, 1.109734, 0.2588235, 0, 1, 1,
0.6515331, 1.023149, 0.3010314, 0.2666667, 0, 1, 1,
0.6518983, 1.462152, -0.6796192, 0.2705882, 0, 1, 1,
0.6539863, -1.821928, 2.910989, 0.2784314, 0, 1, 1,
0.6572294, 0.2116725, -0.8737234, 0.282353, 0, 1, 1,
0.6598371, -0.6703782, 2.918759, 0.2901961, 0, 1, 1,
0.6598856, -0.7909372, 3.637888, 0.2941177, 0, 1, 1,
0.6640468, -1.825202, 2.307359, 0.3019608, 0, 1, 1,
0.6645301, 0.2411258, 2.186286, 0.3098039, 0, 1, 1,
0.6654664, -2.411123, 3.442749, 0.3137255, 0, 1, 1,
0.6657475, 2.053346, -0.3889896, 0.3215686, 0, 1, 1,
0.6704254, -0.79126, 2.342541, 0.3254902, 0, 1, 1,
0.6721267, 0.9859357, -0.8314378, 0.3333333, 0, 1, 1,
0.6721342, -0.1274207, 1.331463, 0.3372549, 0, 1, 1,
0.6776803, -0.8346972, 1.529998, 0.345098, 0, 1, 1,
0.6884456, -1.704713, 2.600185, 0.3490196, 0, 1, 1,
0.6905065, -1.022552, 2.392078, 0.3568628, 0, 1, 1,
0.6909946, -0.6369696, 2.961671, 0.3607843, 0, 1, 1,
0.692443, -0.8663679, 0.1134997, 0.3686275, 0, 1, 1,
0.6946585, -0.03866155, 2.084482, 0.372549, 0, 1, 1,
0.6970361, -2.356614, 3.437893, 0.3803922, 0, 1, 1,
0.6973304, 1.241837, 2.143599, 0.3843137, 0, 1, 1,
0.7096151, 0.2928829, -1.727599, 0.3921569, 0, 1, 1,
0.7128288, 1.020008, -1.385176, 0.3960784, 0, 1, 1,
0.7156968, -1.162433, 2.268353, 0.4039216, 0, 1, 1,
0.7244246, 0.6990491, 0.5049981, 0.4117647, 0, 1, 1,
0.7253423, -0.8863634, 0.6313108, 0.4156863, 0, 1, 1,
0.7261837, 0.2814764, 0.4011481, 0.4235294, 0, 1, 1,
0.7473821, -0.1302723, 1.232532, 0.427451, 0, 1, 1,
0.7523487, -1.103289, 1.955872, 0.4352941, 0, 1, 1,
0.7573752, 0.3142477, 0.3968355, 0.4392157, 0, 1, 1,
0.7574352, -0.1877402, 3.284571, 0.4470588, 0, 1, 1,
0.7588094, 0.1816362, 1.874917, 0.4509804, 0, 1, 1,
0.7609345, -1.107754, 2.163046, 0.4588235, 0, 1, 1,
0.7675272, -1.165884, 4.094, 0.4627451, 0, 1, 1,
0.7695264, 0.4594563, 0.7372506, 0.4705882, 0, 1, 1,
0.7731252, -0.3454967, 0.7506727, 0.4745098, 0, 1, 1,
0.7794232, -0.2913324, 2.633802, 0.4823529, 0, 1, 1,
0.780768, 0.2019052, 0.511498, 0.4862745, 0, 1, 1,
0.7926089, 0.6335302, 0.6779988, 0.4941176, 0, 1, 1,
0.7978763, -1.654789, 2.44589, 0.5019608, 0, 1, 1,
0.7997265, 0.4079486, 2.506954, 0.5058824, 0, 1, 1,
0.801666, 0.2002132, 3.012652, 0.5137255, 0, 1, 1,
0.8019463, -0.1521993, 0.5433367, 0.5176471, 0, 1, 1,
0.8021154, 0.7444373, 1.154488, 0.5254902, 0, 1, 1,
0.8024234, 0.9701409, 0.6404649, 0.5294118, 0, 1, 1,
0.8136008, -1.661155, 4.346485, 0.5372549, 0, 1, 1,
0.8168594, -0.3953003, 0.6385195, 0.5411765, 0, 1, 1,
0.8179349, -0.4165663, 2.277545, 0.5490196, 0, 1, 1,
0.8190293, -0.1109577, 1.541024, 0.5529412, 0, 1, 1,
0.821397, -0.4971015, 1.141723, 0.5607843, 0, 1, 1,
0.8215627, -0.8997802, 2.297728, 0.5647059, 0, 1, 1,
0.82421, -0.1354469, 1.331762, 0.572549, 0, 1, 1,
0.826943, 0.03063169, 0.8782926, 0.5764706, 0, 1, 1,
0.8282633, -2.606642, 3.699244, 0.5843138, 0, 1, 1,
0.8325679, -0.2917569, 3.096712, 0.5882353, 0, 1, 1,
0.8329173, 0.512046, -0.5792636, 0.5960785, 0, 1, 1,
0.8341269, 1.57637, 0.4403737, 0.6039216, 0, 1, 1,
0.8373982, 0.7519911, 1.236889, 0.6078432, 0, 1, 1,
0.8416317, -0.4377736, 1.79361, 0.6156863, 0, 1, 1,
0.8436269, -1.765109, 3.337417, 0.6196079, 0, 1, 1,
0.8466817, 0.8297229, 1.164646, 0.627451, 0, 1, 1,
0.8472584, -0.9760611, 0.5470252, 0.6313726, 0, 1, 1,
0.8477458, -0.9677414, 2.350622, 0.6392157, 0, 1, 1,
0.8545475, -0.1494171, 3.944828, 0.6431373, 0, 1, 1,
0.8618731, -1.225301, 2.996053, 0.6509804, 0, 1, 1,
0.8654899, -0.09453247, 1.049405, 0.654902, 0, 1, 1,
0.8717185, 0.8526035, 0.9394158, 0.6627451, 0, 1, 1,
0.8722419, -0.6805882, 4.772456, 0.6666667, 0, 1, 1,
0.8753375, -0.126738, 2.071644, 0.6745098, 0, 1, 1,
0.875657, 0.6177666, -0.02620076, 0.6784314, 0, 1, 1,
0.8756886, -1.238093, 2.912614, 0.6862745, 0, 1, 1,
0.8760663, -0.3462561, 1.723783, 0.6901961, 0, 1, 1,
0.8812494, -0.1270132, 0.8544285, 0.6980392, 0, 1, 1,
0.8839979, -1.4996, 3.466676, 0.7058824, 0, 1, 1,
0.886192, -1.166234, 2.057983, 0.7098039, 0, 1, 1,
0.8900452, 0.3057866, 0.2763879, 0.7176471, 0, 1, 1,
0.904875, 0.7077397, -0.1554401, 0.7215686, 0, 1, 1,
0.9091392, -0.3607593, 3.16206, 0.7294118, 0, 1, 1,
0.9115816, 0.3620691, 1.44391, 0.7333333, 0, 1, 1,
0.9130561, 0.8357522, 1.787554, 0.7411765, 0, 1, 1,
0.9133423, -0.04315875, 2.319679, 0.7450981, 0, 1, 1,
0.9198932, -1.269637, 3.242005, 0.7529412, 0, 1, 1,
0.9223012, -0.04676675, 0.7882142, 0.7568628, 0, 1, 1,
0.9230589, -1.409923, 2.515857, 0.7647059, 0, 1, 1,
0.926298, 0.06129842, 3.53481, 0.7686275, 0, 1, 1,
0.9306731, 1.328678, 3.405752, 0.7764706, 0, 1, 1,
0.9338644, 0.2649952, -0.3110507, 0.7803922, 0, 1, 1,
0.9349855, 1.270625, -0.9637846, 0.7882353, 0, 1, 1,
0.9358414, -1.232072, 1.149263, 0.7921569, 0, 1, 1,
0.9484672, 0.1613058, 1.95992, 0.8, 0, 1, 1,
0.9485648, 0.390505, 2.516389, 0.8078431, 0, 1, 1,
0.948957, -0.5505145, 2.760161, 0.8117647, 0, 1, 1,
0.9503611, -0.4853013, 2.512275, 0.8196079, 0, 1, 1,
0.958517, -1.173797, 2.542039, 0.8235294, 0, 1, 1,
0.9596735, -0.5638607, 2.389993, 0.8313726, 0, 1, 1,
0.959812, 0.1273296, 2.485451, 0.8352941, 0, 1, 1,
0.961217, -0.02561743, 2.890841, 0.8431373, 0, 1, 1,
0.9617525, 0.948897, 1.819604, 0.8470588, 0, 1, 1,
0.9642119, -0.4814688, 3.485381, 0.854902, 0, 1, 1,
0.9722809, 1.343828, 0.2593947, 0.8588235, 0, 1, 1,
0.9818923, 1.400157, 1.118783, 0.8666667, 0, 1, 1,
0.9832007, -1.081472, 2.225687, 0.8705882, 0, 1, 1,
0.9840832, -0.4915264, 2.573273, 0.8784314, 0, 1, 1,
0.9882368, 0.0912066, 2.445032, 0.8823529, 0, 1, 1,
0.9892184, -0.3469059, 2.517636, 0.8901961, 0, 1, 1,
0.9895914, -0.1769745, 1.326904, 0.8941177, 0, 1, 1,
0.991402, -0.7620014, 1.59536, 0.9019608, 0, 1, 1,
0.9929107, 0.07826681, 1.669337, 0.9098039, 0, 1, 1,
0.9980658, -0.5091978, 1.082784, 0.9137255, 0, 1, 1,
0.9997799, 0.919937, 0.6835788, 0.9215686, 0, 1, 1,
1.008706, 0.2318527, 1.172536, 0.9254902, 0, 1, 1,
1.011115, -0.6784938, 1.697438, 0.9333333, 0, 1, 1,
1.012203, 0.9688237, 2.163877, 0.9372549, 0, 1, 1,
1.012475, 0.4094432, 2.857308, 0.945098, 0, 1, 1,
1.015559, 1.233846, 0.7475843, 0.9490196, 0, 1, 1,
1.021722, -0.3713845, 2.242383, 0.9568627, 0, 1, 1,
1.027139, 0.703773, -0.6968484, 0.9607843, 0, 1, 1,
1.028277, -0.4422427, 2.48222, 0.9686275, 0, 1, 1,
1.030327, -1.604271, 1.767106, 0.972549, 0, 1, 1,
1.033569, -2.866185, 2.294687, 0.9803922, 0, 1, 1,
1.040693, -0.5385229, 0.4028387, 0.9843137, 0, 1, 1,
1.042701, 0.7021357, 0.6155905, 0.9921569, 0, 1, 1,
1.044729, -1.001093, 1.713627, 0.9960784, 0, 1, 1,
1.04727, 0.9893503, 0.974612, 1, 0, 0.9960784, 1,
1.048537, -0.6294693, 2.277105, 1, 0, 0.9882353, 1,
1.054293, 0.03465788, -0.4027227, 1, 0, 0.9843137, 1,
1.054359, -0.6621224, 1.496879, 1, 0, 0.9764706, 1,
1.05716, -0.8735255, 2.471162, 1, 0, 0.972549, 1,
1.059963, -0.2762769, 3.265629, 1, 0, 0.9647059, 1,
1.072931, -2.182158, 2.448802, 1, 0, 0.9607843, 1,
1.079053, 0.2252925, 2.348876, 1, 0, 0.9529412, 1,
1.082317, -0.6343681, 2.089664, 1, 0, 0.9490196, 1,
1.085313, -0.8808503, 1.714935, 1, 0, 0.9411765, 1,
1.090482, 0.2991412, 0.8462682, 1, 0, 0.9372549, 1,
1.090519, -1.183392, 2.280394, 1, 0, 0.9294118, 1,
1.091012, 0.7384213, -0.2607336, 1, 0, 0.9254902, 1,
1.093204, -0.7199241, 3.402388, 1, 0, 0.9176471, 1,
1.099366, 1.268739, 1.243837, 1, 0, 0.9137255, 1,
1.099519, 1.746968, -0.5402591, 1, 0, 0.9058824, 1,
1.10275, -1.523395, 0.2409391, 1, 0, 0.9019608, 1,
1.105224, -1.578482, 2.73177, 1, 0, 0.8941177, 1,
1.106995, -0.1030242, 3.027063, 1, 0, 0.8862745, 1,
1.10855, 1.248037, 1.277732, 1, 0, 0.8823529, 1,
1.114295, 0.6605716, 1.113324, 1, 0, 0.8745098, 1,
1.126119, -0.7573172, 2.739537, 1, 0, 0.8705882, 1,
1.126406, -0.8110004, 2.612811, 1, 0, 0.8627451, 1,
1.132801, 0.553994, 1.87139, 1, 0, 0.8588235, 1,
1.138088, -0.9256201, 2.963969, 1, 0, 0.8509804, 1,
1.143111, 0.8332555, 0.6860008, 1, 0, 0.8470588, 1,
1.143203, -0.1884228, 2.523189, 1, 0, 0.8392157, 1,
1.143489, -0.1874396, 0.8205588, 1, 0, 0.8352941, 1,
1.151049, -0.2742402, 1.043086, 1, 0, 0.827451, 1,
1.152977, 0.2145002, 2.418573, 1, 0, 0.8235294, 1,
1.157054, 0.6018121, 0.8105422, 1, 0, 0.8156863, 1,
1.158513, 1.082677, 0.2603506, 1, 0, 0.8117647, 1,
1.170385, -1.302256, 2.043205, 1, 0, 0.8039216, 1,
1.17298, -0.4702453, 1.323123, 1, 0, 0.7960784, 1,
1.173267, -1.1093, 3.963251, 1, 0, 0.7921569, 1,
1.182438, -2.133677, 1.27422, 1, 0, 0.7843137, 1,
1.184285, -0.8305987, 2.673108, 1, 0, 0.7803922, 1,
1.186515, -0.08793063, 0.8195236, 1, 0, 0.772549, 1,
1.187884, 0.6058125, 0.5947328, 1, 0, 0.7686275, 1,
1.189465, -0.6895849, 1.757441, 1, 0, 0.7607843, 1,
1.194081, 0.8313499, 0.09909669, 1, 0, 0.7568628, 1,
1.198861, -0.5476079, 0.7477359, 1, 0, 0.7490196, 1,
1.201234, -0.4750741, 3.109748, 1, 0, 0.7450981, 1,
1.202768, 0.3074679, 0.9739627, 1, 0, 0.7372549, 1,
1.214278, -0.8809709, 1.414047, 1, 0, 0.7333333, 1,
1.232662, -0.3458256, 2.605652, 1, 0, 0.7254902, 1,
1.236567, 1.202323, 1.200775, 1, 0, 0.7215686, 1,
1.237315, 1.141507, 1.507505, 1, 0, 0.7137255, 1,
1.239904, -0.3881091, 3.109344, 1, 0, 0.7098039, 1,
1.246991, -1.244434, 2.677358, 1, 0, 0.7019608, 1,
1.255567, -0.1242804, 3.159954, 1, 0, 0.6941177, 1,
1.262192, -1.362824, 2.094244, 1, 0, 0.6901961, 1,
1.269107, 1.872357, -0.4807989, 1, 0, 0.682353, 1,
1.280121, -1.54144, 3.730155, 1, 0, 0.6784314, 1,
1.281075, 0.1754147, 0.4446177, 1, 0, 0.6705883, 1,
1.282459, 0.2572159, 2.128658, 1, 0, 0.6666667, 1,
1.287713, 1.175457, 0.4003166, 1, 0, 0.6588235, 1,
1.288046, 2.534087, 1.622983, 1, 0, 0.654902, 1,
1.28825, -0.117784, 1.423734, 1, 0, 0.6470588, 1,
1.297258, -2.022555, 2.084692, 1, 0, 0.6431373, 1,
1.298304, -0.05347408, 1.005916, 1, 0, 0.6352941, 1,
1.299058, 1.022962, 1.818139, 1, 0, 0.6313726, 1,
1.304604, 0.03204995, 4.773686, 1, 0, 0.6235294, 1,
1.313248, -1.465171, 2.282973, 1, 0, 0.6196079, 1,
1.317554, -1.252795, 3.250263, 1, 0, 0.6117647, 1,
1.320443, -2.075206, 3.044764, 1, 0, 0.6078432, 1,
1.326048, -1.023337, 2.916861, 1, 0, 0.6, 1,
1.326299, 0.09691503, 2.187269, 1, 0, 0.5921569, 1,
1.341441, 1.059044, 0.6653435, 1, 0, 0.5882353, 1,
1.341502, 1.881737, 1.432385, 1, 0, 0.5803922, 1,
1.343665, -0.6378105, 1.483738, 1, 0, 0.5764706, 1,
1.346954, -0.01008116, 1.444819, 1, 0, 0.5686275, 1,
1.350142, 0.9354798, 0.3823086, 1, 0, 0.5647059, 1,
1.351062, -0.542962, 3.064172, 1, 0, 0.5568628, 1,
1.354566, 0.7338673, 1.275686, 1, 0, 0.5529412, 1,
1.364771, -0.9580309, 2.370016, 1, 0, 0.5450981, 1,
1.365717, 1.318727, 0.6171376, 1, 0, 0.5411765, 1,
1.380045, 1.731203, 2.45857, 1, 0, 0.5333334, 1,
1.384765, 0.4961474, 1.679096, 1, 0, 0.5294118, 1,
1.395737, -0.1577963, 3.244035, 1, 0, 0.5215687, 1,
1.403514, 0.07086318, 2.113222, 1, 0, 0.5176471, 1,
1.404964, 0.407149, 1.528308, 1, 0, 0.509804, 1,
1.420333, 1.078355, 1.599881, 1, 0, 0.5058824, 1,
1.422067, 0.005564728, 1.792576, 1, 0, 0.4980392, 1,
1.422535, -0.7627998, 2.608873, 1, 0, 0.4901961, 1,
1.424854, -0.624869, 0.8117138, 1, 0, 0.4862745, 1,
1.430381, 0.2356899, 1.679873, 1, 0, 0.4784314, 1,
1.434611, 0.6468619, 1.811199, 1, 0, 0.4745098, 1,
1.434911, 2.06427, 1.413643, 1, 0, 0.4666667, 1,
1.461755, -0.9813634, -0.5635851, 1, 0, 0.4627451, 1,
1.491585, 0.4589047, 0.9360602, 1, 0, 0.454902, 1,
1.492541, 0.6038374, 0.7534361, 1, 0, 0.4509804, 1,
1.495286, 1.4814, 1.444335, 1, 0, 0.4431373, 1,
1.501692, 1.772723, 1.544835, 1, 0, 0.4392157, 1,
1.506672, -0.4508255, 2.193912, 1, 0, 0.4313726, 1,
1.507468, -1.045889, 0.4041436, 1, 0, 0.427451, 1,
1.515437, 0.1821502, 1.922519, 1, 0, 0.4196078, 1,
1.541845, 0.3530934, 2.287785, 1, 0, 0.4156863, 1,
1.543202, 0.8404636, 0.7047952, 1, 0, 0.4078431, 1,
1.553971, -0.3343928, 3.17147, 1, 0, 0.4039216, 1,
1.56155, -0.9601879, 2.921123, 1, 0, 0.3960784, 1,
1.582486, 1.334164, 1.959733, 1, 0, 0.3882353, 1,
1.589511, 0.2854805, 1.020647, 1, 0, 0.3843137, 1,
1.59352, 0.2023266, 1.612491, 1, 0, 0.3764706, 1,
1.596524, 0.8188615, 1.342171, 1, 0, 0.372549, 1,
1.597202, 0.594767, 2.540078, 1, 0, 0.3647059, 1,
1.600987, -0.6024198, 2.511829, 1, 0, 0.3607843, 1,
1.603175, 1.13745, 0.1920619, 1, 0, 0.3529412, 1,
1.606185, 0.1227667, 1.63033, 1, 0, 0.3490196, 1,
1.618624, 0.8049716, 1.369767, 1, 0, 0.3411765, 1,
1.629321, 0.2362286, 2.79391, 1, 0, 0.3372549, 1,
1.631272, -0.1945102, 1.468795, 1, 0, 0.3294118, 1,
1.637567, 1.418319, 1.214119, 1, 0, 0.3254902, 1,
1.64005, -0.1545434, 1.483678, 1, 0, 0.3176471, 1,
1.653314, -0.5002775, 2.008811, 1, 0, 0.3137255, 1,
1.654743, 2.083237, -0.07070353, 1, 0, 0.3058824, 1,
1.667495, -0.357599, 3.09158, 1, 0, 0.2980392, 1,
1.677647, 1.679107, 0.8309592, 1, 0, 0.2941177, 1,
1.683392, 0.6251035, 1.909206, 1, 0, 0.2862745, 1,
1.685408, -0.3066905, 0.7579001, 1, 0, 0.282353, 1,
1.71611, -1.582455, 0.8987119, 1, 0, 0.2745098, 1,
1.723339, -0.6857389, 0.6626538, 1, 0, 0.2705882, 1,
1.761119, 0.0141841, 1.363188, 1, 0, 0.2627451, 1,
1.7664, -0.01968779, -1.128355, 1, 0, 0.2588235, 1,
1.803171, -0.09390028, 1.752695, 1, 0, 0.2509804, 1,
1.806747, 0.4657402, 3.019095, 1, 0, 0.2470588, 1,
1.813626, -1.901187, 4.127129, 1, 0, 0.2392157, 1,
1.819667, -1.416625, 3.607804, 1, 0, 0.2352941, 1,
1.832992, 0.4964792, 2.491179, 1, 0, 0.227451, 1,
1.841607, -2.085019, 1.584951, 1, 0, 0.2235294, 1,
1.849293, -0.2688293, 3.498339, 1, 0, 0.2156863, 1,
1.863559, 0.5065776, 1.982793, 1, 0, 0.2117647, 1,
1.863766, -0.07895521, 2.197654, 1, 0, 0.2039216, 1,
1.879906, 0.8061108, 2.257583, 1, 0, 0.1960784, 1,
1.897638, 0.4012636, 1.167348, 1, 0, 0.1921569, 1,
1.92534, 1.275079, 3.178584, 1, 0, 0.1843137, 1,
1.960097, -2.570873, 4.056262, 1, 0, 0.1803922, 1,
1.964259, -0.07790881, 2.146174, 1, 0, 0.172549, 1,
1.975315, 0.4320661, 2.488163, 1, 0, 0.1686275, 1,
2.002589, 0.6306061, 1.044204, 1, 0, 0.1607843, 1,
2.056027, -0.7766413, 2.128869, 1, 0, 0.1568628, 1,
2.074209, -0.4622446, 2.295764, 1, 0, 0.1490196, 1,
2.084356, 1.388291, 1.276094, 1, 0, 0.145098, 1,
2.123334, 0.9962691, 1.282699, 1, 0, 0.1372549, 1,
2.141313, 0.0678397, 2.417336, 1, 0, 0.1333333, 1,
2.148363, -0.06256577, 1.344724, 1, 0, 0.1254902, 1,
2.18474, -0.6596827, 3.758835, 1, 0, 0.1215686, 1,
2.200438, -0.8790627, 3.625387, 1, 0, 0.1137255, 1,
2.204014, 1.86878, 0.5913907, 1, 0, 0.1098039, 1,
2.265939, -1.083438, 2.153363, 1, 0, 0.1019608, 1,
2.266531, -0.3056323, 1.700068, 1, 0, 0.09411765, 1,
2.268972, -0.6818168, 2.948169, 1, 0, 0.09019608, 1,
2.311801, 1.051483, -0.777514, 1, 0, 0.08235294, 1,
2.394346, 0.6961999, 1.516039, 1, 0, 0.07843138, 1,
2.430025, 0.4861846, 1.057879, 1, 0, 0.07058824, 1,
2.437432, -1.698743, 1.398143, 1, 0, 0.06666667, 1,
2.51101, 0.1581551, 0.8740041, 1, 0, 0.05882353, 1,
2.58752, -0.6764976, 0.2956903, 1, 0, 0.05490196, 1,
2.610662, -0.1286353, 3.509634, 1, 0, 0.04705882, 1,
2.649573, 0.03696854, 1.146425, 1, 0, 0.04313726, 1,
2.723783, 0.2296381, 3.144549, 1, 0, 0.03529412, 1,
2.767876, 1.020049, 0.2302164, 1, 0, 0.03137255, 1,
2.827591, -0.7660362, 2.260969, 1, 0, 0.02352941, 1,
2.930116, 0.939216, 1.882224, 1, 0, 0.01960784, 1,
2.951216, -1.093448, 1.157284, 1, 0, 0.01176471, 1,
3.055072, -0.02961885, 1.708312, 1, 0, 0.007843138, 1
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
-0.1147527, -3.912719, -7.73407, 0, -0.5, 0.5, 0.5,
-0.1147527, -3.912719, -7.73407, 1, -0.5, 0.5, 0.5,
-0.1147527, -3.912719, -7.73407, 1, 1.5, 0.5, 0.5,
-0.1147527, -3.912719, -7.73407, 0, 1.5, 0.5, 0.5
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
-4.359148, 0.1475092, -7.73407, 0, -0.5, 0.5, 0.5,
-4.359148, 0.1475092, -7.73407, 1, -0.5, 0.5, 0.5,
-4.359148, 0.1475092, -7.73407, 1, 1.5, 0.5, 0.5,
-4.359148, 0.1475092, -7.73407, 0, 1.5, 0.5, 0.5
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
-4.359148, -3.912719, -0.5397408, 0, -0.5, 0.5, 0.5,
-4.359148, -3.912719, -0.5397408, 1, -0.5, 0.5, 0.5,
-4.359148, -3.912719, -0.5397408, 1, 1.5, 0.5, 0.5,
-4.359148, -3.912719, -0.5397408, 0, 1.5, 0.5, 0.5
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
-3, -2.975744, -6.07384,
3, -2.975744, -6.07384,
-3, -2.975744, -6.07384,
-3, -3.131906, -6.350545,
-2, -2.975744, -6.07384,
-2, -3.131906, -6.350545,
-1, -2.975744, -6.07384,
-1, -3.131906, -6.350545,
0, -2.975744, -6.07384,
0, -3.131906, -6.350545,
1, -2.975744, -6.07384,
1, -3.131906, -6.350545,
2, -2.975744, -6.07384,
2, -3.131906, -6.350545,
3, -2.975744, -6.07384,
3, -3.131906, -6.350545
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
-3, -3.444232, -6.903955, 0, -0.5, 0.5, 0.5,
-3, -3.444232, -6.903955, 1, -0.5, 0.5, 0.5,
-3, -3.444232, -6.903955, 1, 1.5, 0.5, 0.5,
-3, -3.444232, -6.903955, 0, 1.5, 0.5, 0.5,
-2, -3.444232, -6.903955, 0, -0.5, 0.5, 0.5,
-2, -3.444232, -6.903955, 1, -0.5, 0.5, 0.5,
-2, -3.444232, -6.903955, 1, 1.5, 0.5, 0.5,
-2, -3.444232, -6.903955, 0, 1.5, 0.5, 0.5,
-1, -3.444232, -6.903955, 0, -0.5, 0.5, 0.5,
-1, -3.444232, -6.903955, 1, -0.5, 0.5, 0.5,
-1, -3.444232, -6.903955, 1, 1.5, 0.5, 0.5,
-1, -3.444232, -6.903955, 0, 1.5, 0.5, 0.5,
0, -3.444232, -6.903955, 0, -0.5, 0.5, 0.5,
0, -3.444232, -6.903955, 1, -0.5, 0.5, 0.5,
0, -3.444232, -6.903955, 1, 1.5, 0.5, 0.5,
0, -3.444232, -6.903955, 0, 1.5, 0.5, 0.5,
1, -3.444232, -6.903955, 0, -0.5, 0.5, 0.5,
1, -3.444232, -6.903955, 1, -0.5, 0.5, 0.5,
1, -3.444232, -6.903955, 1, 1.5, 0.5, 0.5,
1, -3.444232, -6.903955, 0, 1.5, 0.5, 0.5,
2, -3.444232, -6.903955, 0, -0.5, 0.5, 0.5,
2, -3.444232, -6.903955, 1, -0.5, 0.5, 0.5,
2, -3.444232, -6.903955, 1, 1.5, 0.5, 0.5,
2, -3.444232, -6.903955, 0, 1.5, 0.5, 0.5,
3, -3.444232, -6.903955, 0, -0.5, 0.5, 0.5,
3, -3.444232, -6.903955, 1, -0.5, 0.5, 0.5,
3, -3.444232, -6.903955, 1, 1.5, 0.5, 0.5,
3, -3.444232, -6.903955, 0, 1.5, 0.5, 0.5
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
-3.379672, -2, -6.07384,
-3.379672, 3, -6.07384,
-3.379672, -2, -6.07384,
-3.542918, -2, -6.350545,
-3.379672, -1, -6.07384,
-3.542918, -1, -6.350545,
-3.379672, 0, -6.07384,
-3.542918, 0, -6.350545,
-3.379672, 1, -6.07384,
-3.542918, 1, -6.350545,
-3.379672, 2, -6.07384,
-3.542918, 2, -6.350545,
-3.379672, 3, -6.07384,
-3.542918, 3, -6.350545
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
-3.86941, -2, -6.903955, 0, -0.5, 0.5, 0.5,
-3.86941, -2, -6.903955, 1, -0.5, 0.5, 0.5,
-3.86941, -2, -6.903955, 1, 1.5, 0.5, 0.5,
-3.86941, -2, -6.903955, 0, 1.5, 0.5, 0.5,
-3.86941, -1, -6.903955, 0, -0.5, 0.5, 0.5,
-3.86941, -1, -6.903955, 1, -0.5, 0.5, 0.5,
-3.86941, -1, -6.903955, 1, 1.5, 0.5, 0.5,
-3.86941, -1, -6.903955, 0, 1.5, 0.5, 0.5,
-3.86941, 0, -6.903955, 0, -0.5, 0.5, 0.5,
-3.86941, 0, -6.903955, 1, -0.5, 0.5, 0.5,
-3.86941, 0, -6.903955, 1, 1.5, 0.5, 0.5,
-3.86941, 0, -6.903955, 0, 1.5, 0.5, 0.5,
-3.86941, 1, -6.903955, 0, -0.5, 0.5, 0.5,
-3.86941, 1, -6.903955, 1, -0.5, 0.5, 0.5,
-3.86941, 1, -6.903955, 1, 1.5, 0.5, 0.5,
-3.86941, 1, -6.903955, 0, 1.5, 0.5, 0.5,
-3.86941, 2, -6.903955, 0, -0.5, 0.5, 0.5,
-3.86941, 2, -6.903955, 1, -0.5, 0.5, 0.5,
-3.86941, 2, -6.903955, 1, 1.5, 0.5, 0.5,
-3.86941, 2, -6.903955, 0, 1.5, 0.5, 0.5,
-3.86941, 3, -6.903955, 0, -0.5, 0.5, 0.5,
-3.86941, 3, -6.903955, 1, -0.5, 0.5, 0.5,
-3.86941, 3, -6.903955, 1, 1.5, 0.5, 0.5,
-3.86941, 3, -6.903955, 0, 1.5, 0.5, 0.5
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
-3.379672, -2.975744, -4,
-3.379672, -2.975744, 4,
-3.379672, -2.975744, -4,
-3.542918, -3.131906, -4,
-3.379672, -2.975744, -2,
-3.542918, -3.131906, -2,
-3.379672, -2.975744, 0,
-3.542918, -3.131906, 0,
-3.379672, -2.975744, 2,
-3.542918, -3.131906, 2,
-3.379672, -2.975744, 4,
-3.542918, -3.131906, 4
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
-3.86941, -3.444232, -4, 0, -0.5, 0.5, 0.5,
-3.86941, -3.444232, -4, 1, -0.5, 0.5, 0.5,
-3.86941, -3.444232, -4, 1, 1.5, 0.5, 0.5,
-3.86941, -3.444232, -4, 0, 1.5, 0.5, 0.5,
-3.86941, -3.444232, -2, 0, -0.5, 0.5, 0.5,
-3.86941, -3.444232, -2, 1, -0.5, 0.5, 0.5,
-3.86941, -3.444232, -2, 1, 1.5, 0.5, 0.5,
-3.86941, -3.444232, -2, 0, 1.5, 0.5, 0.5,
-3.86941, -3.444232, 0, 0, -0.5, 0.5, 0.5,
-3.86941, -3.444232, 0, 1, -0.5, 0.5, 0.5,
-3.86941, -3.444232, 0, 1, 1.5, 0.5, 0.5,
-3.86941, -3.444232, 0, 0, 1.5, 0.5, 0.5,
-3.86941, -3.444232, 2, 0, -0.5, 0.5, 0.5,
-3.86941, -3.444232, 2, 1, -0.5, 0.5, 0.5,
-3.86941, -3.444232, 2, 1, 1.5, 0.5, 0.5,
-3.86941, -3.444232, 2, 0, 1.5, 0.5, 0.5,
-3.86941, -3.444232, 4, 0, -0.5, 0.5, 0.5,
-3.86941, -3.444232, 4, 1, -0.5, 0.5, 0.5,
-3.86941, -3.444232, 4, 1, 1.5, 0.5, 0.5,
-3.86941, -3.444232, 4, 0, 1.5, 0.5, 0.5
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
-3.379672, -2.975744, -6.07384,
-3.379672, 3.270762, -6.07384,
-3.379672, -2.975744, 4.994359,
-3.379672, 3.270762, 4.994359,
-3.379672, -2.975744, -6.07384,
-3.379672, -2.975744, 4.994359,
-3.379672, 3.270762, -6.07384,
-3.379672, 3.270762, 4.994359,
-3.379672, -2.975744, -6.07384,
3.150167, -2.975744, -6.07384,
-3.379672, -2.975744, 4.994359,
3.150167, -2.975744, 4.994359,
-3.379672, 3.270762, -6.07384,
3.150167, 3.270762, -6.07384,
-3.379672, 3.270762, 4.994359,
3.150167, 3.270762, 4.994359,
3.150167, -2.975744, -6.07384,
3.150167, 3.270762, -6.07384,
3.150167, -2.975744, 4.994359,
3.150167, 3.270762, 4.994359,
3.150167, -2.975744, -6.07384,
3.150167, -2.975744, 4.994359,
3.150167, 3.270762, -6.07384,
3.150167, 3.270762, 4.994359
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
var radius = 7.629808;
var distance = 33.94588;
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
mvMatrix.translate( 0.1147527, -0.1475092, 0.5397408 );
mvMatrix.scale( 1.263354, 1.320658, 0.7453334 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.94588);
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
Propyl_carbamate<-read.table("Propyl_carbamate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propyl_carbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propyl_carbamate' not found
```

```r
y<-Propyl_carbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propyl_carbamate' not found
```

```r
z<-Propyl_carbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propyl_carbamate' not found
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
-3.284577, 0.2548759, -0.166263, 0, 0, 1, 1, 1,
-3.149795, 0.7832922, 0.1803355, 1, 0, 0, 1, 1,
-2.768384, 0.8101956, -0.8833513, 1, 0, 0, 1, 1,
-2.719041, -0.5834754, -3.0139, 1, 0, 0, 1, 1,
-2.391397, 0.2019801, -1.97647, 1, 0, 0, 1, 1,
-2.292771, -0.594465, 0.4883261, 1, 0, 0, 1, 1,
-2.267499, 0.2850102, -2.420841, 0, 0, 0, 1, 1,
-2.250812, 0.4264985, 0.3498743, 0, 0, 0, 1, 1,
-2.186407, 0.3223762, -0.2153836, 0, 0, 0, 1, 1,
-2.136759, -0.4931786, -0.9124498, 0, 0, 0, 1, 1,
-2.131134, 0.9810454, -2.132533, 0, 0, 0, 1, 1,
-2.130139, -0.4337832, -0.1677711, 0, 0, 0, 1, 1,
-2.096628, 2.043791, -0.1921489, 0, 0, 0, 1, 1,
-2.066126, 2.694405, -2.882493, 1, 1, 1, 1, 1,
-2.061427, 0.9015456, -2.065589, 1, 1, 1, 1, 1,
-2.012824, 1.108851, -0.7977267, 1, 1, 1, 1, 1,
-1.966668, -0.09396728, -0.4125016, 1, 1, 1, 1, 1,
-1.950706, 2.113476, -0.6893446, 1, 1, 1, 1, 1,
-1.950526, -1.170735, -1.845783, 1, 1, 1, 1, 1,
-1.913815, -0.4335967, -0.6596028, 1, 1, 1, 1, 1,
-1.891855, 0.6222844, -1.971982, 1, 1, 1, 1, 1,
-1.882207, 0.3440267, -2.40839, 1, 1, 1, 1, 1,
-1.880052, -0.5655248, -2.540489, 1, 1, 1, 1, 1,
-1.868549, -0.467541, -0.9833317, 1, 1, 1, 1, 1,
-1.867312, -1.497321, -1.550558, 1, 1, 1, 1, 1,
-1.864405, -0.07825845, -3.004552, 1, 1, 1, 1, 1,
-1.863265, -0.1731087, -0.7753582, 1, 1, 1, 1, 1,
-1.862105, -1.815538, -1.519418, 1, 1, 1, 1, 1,
-1.857605, -2.085361, -3.692768, 0, 0, 1, 1, 1,
-1.82436, 0.4025895, 0.5551799, 1, 0, 0, 1, 1,
-1.818236, 0.648289, -2.103154, 1, 0, 0, 1, 1,
-1.811416, 1.788225, -1.459735, 1, 0, 0, 1, 1,
-1.808671, -0.3307077, 0.2026814, 1, 0, 0, 1, 1,
-1.768172, -0.186107, -0.7238783, 1, 0, 0, 1, 1,
-1.767067, 0.4108072, -0.7203881, 0, 0, 0, 1, 1,
-1.760657, -0.5054693, -2.224236, 0, 0, 0, 1, 1,
-1.73016, 0.1927616, -1.480775, 0, 0, 0, 1, 1,
-1.720958, -0.08936086, -1.258922, 0, 0, 0, 1, 1,
-1.712955, -0.7313287, -2.577575, 0, 0, 0, 1, 1,
-1.711357, 0.3907076, -2.057344, 0, 0, 0, 1, 1,
-1.681098, 1.554849, -0.8752142, 0, 0, 0, 1, 1,
-1.670926, -0.8594091, -2.932853, 1, 1, 1, 1, 1,
-1.664723, -0.4340717, -2.673088, 1, 1, 1, 1, 1,
-1.661492, -0.6348765, -2.077117, 1, 1, 1, 1, 1,
-1.660724, -2.879379, -2.22462, 1, 1, 1, 1, 1,
-1.654482, 0.6441654, -0.470946, 1, 1, 1, 1, 1,
-1.645341, -1.021266, -3.388985, 1, 1, 1, 1, 1,
-1.644572, 1.386565, -0.410561, 1, 1, 1, 1, 1,
-1.631221, -1.117736, -1.077486, 1, 1, 1, 1, 1,
-1.62443, -0.08826021, -2.118192, 1, 1, 1, 1, 1,
-1.575522, -0.01718601, -1.100373, 1, 1, 1, 1, 1,
-1.570431, -0.4980379, -0.5318977, 1, 1, 1, 1, 1,
-1.562688, 0.7464784, -0.4362633, 1, 1, 1, 1, 1,
-1.561457, -0.4760458, -3.108039, 1, 1, 1, 1, 1,
-1.55916, 0.9465006, 1.046216, 1, 1, 1, 1, 1,
-1.555288, -1.133393, -2.780251, 1, 1, 1, 1, 1,
-1.554211, -0.7733812, -2.072338, 0, 0, 1, 1, 1,
-1.551347, 2.00491, -0.9274746, 1, 0, 0, 1, 1,
-1.54403, -0.6346866, -4.082296, 1, 0, 0, 1, 1,
-1.540659, -0.3419073, -2.314981, 1, 0, 0, 1, 1,
-1.538619, 0.5151899, -0.1244282, 1, 0, 0, 1, 1,
-1.532682, 0.3223015, -1.801129, 1, 0, 0, 1, 1,
-1.524659, -1.392257, -1.351805, 0, 0, 0, 1, 1,
-1.523561, -0.8921727, -2.259328, 0, 0, 0, 1, 1,
-1.501888, 0.3599346, -1.536279, 0, 0, 0, 1, 1,
-1.500279, -0.1693201, -0.6196296, 0, 0, 0, 1, 1,
-1.493582, 0.5743966, -1.083784, 0, 0, 0, 1, 1,
-1.487882, 1.194207, -0.540742, 0, 0, 0, 1, 1,
-1.487735, 0.9292006, -0.6491519, 0, 0, 0, 1, 1,
-1.485798, -0.6901641, -1.85575, 1, 1, 1, 1, 1,
-1.475046, 0.03412146, -2.024208, 1, 1, 1, 1, 1,
-1.472421, -0.4635782, -0.6962926, 1, 1, 1, 1, 1,
-1.470349, 0.1552337, -1.778067, 1, 1, 1, 1, 1,
-1.461183, -1.649728, -3.485312, 1, 1, 1, 1, 1,
-1.460106, 0.03331839, -0.0295845, 1, 1, 1, 1, 1,
-1.455371, 0.5915248, -0.2620993, 1, 1, 1, 1, 1,
-1.447176, -2.733088, -1.140616, 1, 1, 1, 1, 1,
-1.443522, -0.6853451, -2.813159, 1, 1, 1, 1, 1,
-1.438001, 0.6411079, -0.4735161, 1, 1, 1, 1, 1,
-1.431519, 0.2181054, -0.8657788, 1, 1, 1, 1, 1,
-1.425712, -1.882222, -1.655555, 1, 1, 1, 1, 1,
-1.415528, 0.05285202, -1.606457, 1, 1, 1, 1, 1,
-1.402174, 0.9828694, -0.2924671, 1, 1, 1, 1, 1,
-1.399781, 1.119836, -1.194865, 1, 1, 1, 1, 1,
-1.396357, -1.586764, -1.070819, 0, 0, 1, 1, 1,
-1.381827, 0.3890491, -0.6160849, 1, 0, 0, 1, 1,
-1.368399, 1.596443, 0.9380739, 1, 0, 0, 1, 1,
-1.368382, 1.475984, -1.629678, 1, 0, 0, 1, 1,
-1.363464, -0.2158114, -2.035368, 1, 0, 0, 1, 1,
-1.36141, 1.007688, -1.718076, 1, 0, 0, 1, 1,
-1.355559, 1.02025, -1.955843, 0, 0, 0, 1, 1,
-1.355039, -0.2200553, -1.693784, 0, 0, 0, 1, 1,
-1.337646, 0.3062286, -1.948662, 0, 0, 0, 1, 1,
-1.334167, -1.235885, -1.222206, 0, 0, 0, 1, 1,
-1.33356, -0.116503, -1.426649, 0, 0, 0, 1, 1,
-1.328421, -0.3611252, -0.5119532, 0, 0, 0, 1, 1,
-1.326963, 0.3519687, -1.291048, 0, 0, 0, 1, 1,
-1.326161, 0.699373, -1.009029, 1, 1, 1, 1, 1,
-1.32348, -0.0794194, -2.411477, 1, 1, 1, 1, 1,
-1.317313, -0.07822274, -2.584723, 1, 1, 1, 1, 1,
-1.315765, 0.3243227, -0.681997, 1, 1, 1, 1, 1,
-1.313053, -0.6003137, -1.713911, 1, 1, 1, 1, 1,
-1.307674, 1.072956, 0.9648027, 1, 1, 1, 1, 1,
-1.298384, 0.5376862, -0.9961315, 1, 1, 1, 1, 1,
-1.290106, -1.449999, -2.896982, 1, 1, 1, 1, 1,
-1.283028, -0.847646, -1.124757, 1, 1, 1, 1, 1,
-1.27613, 0.6185287, -0.3166524, 1, 1, 1, 1, 1,
-1.269593, -0.7324232, -0.470647, 1, 1, 1, 1, 1,
-1.252835, 0.1303132, -1.735154, 1, 1, 1, 1, 1,
-1.251124, 0.3431299, -1.6323, 1, 1, 1, 1, 1,
-1.250237, -0.1685244, -2.923055, 1, 1, 1, 1, 1,
-1.23926, 1.754708, 1.063303, 1, 1, 1, 1, 1,
-1.239002, -0.5299542, -1.940735, 0, 0, 1, 1, 1,
-1.232765, 1.295325, -1.314253, 1, 0, 0, 1, 1,
-1.222163, -0.4384225, -3.486568, 1, 0, 0, 1, 1,
-1.214499, -0.7973502, -1.902411, 1, 0, 0, 1, 1,
-1.213531, 1.67448, -0.8431845, 1, 0, 0, 1, 1,
-1.210615, -2.201189, -1.896873, 1, 0, 0, 1, 1,
-1.203399, 1.272719, -0.7533442, 0, 0, 0, 1, 1,
-1.201265, 0.1826035, -0.1472773, 0, 0, 0, 1, 1,
-1.198639, 0.4280336, -1.384865, 0, 0, 0, 1, 1,
-1.197975, 1.999016, -0.7566444, 0, 0, 0, 1, 1,
-1.195389, 1.527677, -0.8042813, 0, 0, 0, 1, 1,
-1.187525, 0.465154, 0.5184516, 0, 0, 0, 1, 1,
-1.187041, 0.09239458, -3.931112, 0, 0, 0, 1, 1,
-1.171222, 0.9129007, -1.548832, 1, 1, 1, 1, 1,
-1.167074, -0.377536, -2.555959, 1, 1, 1, 1, 1,
-1.164728, 0.1310743, -1.59824, 1, 1, 1, 1, 1,
-1.159276, -0.413516, -1.337789, 1, 1, 1, 1, 1,
-1.15316, 0.03009527, -2.040375, 1, 1, 1, 1, 1,
-1.150144, 2.458678, -0.03797045, 1, 1, 1, 1, 1,
-1.142446, -0.1074656, -1.31819, 1, 1, 1, 1, 1,
-1.132879, -0.9220012, -3.101918, 1, 1, 1, 1, 1,
-1.128745, -0.4874762, -2.936244, 1, 1, 1, 1, 1,
-1.127124, 0.4354361, -0.6411369, 1, 1, 1, 1, 1,
-1.119414, -0.4363581, -1.186542, 1, 1, 1, 1, 1,
-1.107622, 1.340984, -1.411929, 1, 1, 1, 1, 1,
-1.10288, -0.4659361, -3.50689, 1, 1, 1, 1, 1,
-1.102257, -1.018796, -2.586997, 1, 1, 1, 1, 1,
-1.10058, -1.685776, -2.221416, 1, 1, 1, 1, 1,
-1.100549, -0.5304804, -2.327732, 0, 0, 1, 1, 1,
-1.09305, 1.144019, 0.3780736, 1, 0, 0, 1, 1,
-1.087381, -0.8093171, -3.279927, 1, 0, 0, 1, 1,
-1.085026, 0.9391429, -1.786431, 1, 0, 0, 1, 1,
-1.083874, 0.9560673, -1.505087, 1, 0, 0, 1, 1,
-1.078833, -0.5517438, -1.556101, 1, 0, 0, 1, 1,
-1.078441, -0.4493933, -1.455343, 0, 0, 0, 1, 1,
-1.077334, 2.981827, 1.573449, 0, 0, 0, 1, 1,
-1.075198, 0.5017357, -2.135266, 0, 0, 0, 1, 1,
-1.071114, 0.3170382, -1.738228, 0, 0, 0, 1, 1,
-1.070299, 1.48926, -1.546369, 0, 0, 0, 1, 1,
-1.06303, -1.209079, -2.710294, 0, 0, 0, 1, 1,
-1.058806, 0.4346074, -1.459293, 0, 0, 0, 1, 1,
-1.048637, 0.04317968, -1.093679, 1, 1, 1, 1, 1,
-1.048305, -2.73784, -2.535604, 1, 1, 1, 1, 1,
-1.047484, -1.081583, -2.647399, 1, 1, 1, 1, 1,
-1.043736, -1.472199, -2.200284, 1, 1, 1, 1, 1,
-1.039419, 0.8847484, 0.08861051, 1, 1, 1, 1, 1,
-1.022186, 0.783096, -2.283143, 1, 1, 1, 1, 1,
-1.018265, -0.1347757, -0.4134298, 1, 1, 1, 1, 1,
-1.007856, 0.2091776, -0.8232365, 1, 1, 1, 1, 1,
-0.9984686, -0.3454311, -2.667046, 1, 1, 1, 1, 1,
-0.9907815, 0.1151649, -1.816475, 1, 1, 1, 1, 1,
-0.9895782, 0.6687125, -1.643865, 1, 1, 1, 1, 1,
-0.9835055, 0.07274185, -1.468534, 1, 1, 1, 1, 1,
-0.978655, -0.1814662, -1.624976, 1, 1, 1, 1, 1,
-0.9762924, 0.3044146, -0.4069719, 1, 1, 1, 1, 1,
-0.9653928, -1.044197, -2.689079, 1, 1, 1, 1, 1,
-0.9629809, -0.5696168, -3.380464, 0, 0, 1, 1, 1,
-0.9549633, -0.2899786, -2.098561, 1, 0, 0, 1, 1,
-0.9459469, 0.05684372, -1.83857, 1, 0, 0, 1, 1,
-0.937377, -1.754044, -1.081395, 1, 0, 0, 1, 1,
-0.9224123, -0.3270157, -2.124219, 1, 0, 0, 1, 1,
-0.9223214, -1.588379, -2.132456, 1, 0, 0, 1, 1,
-0.9199133, -0.9933298, -1.856084, 0, 0, 0, 1, 1,
-0.9174771, 0.7539557, -4.005862, 0, 0, 0, 1, 1,
-0.9160191, 1.384822, -2.026232, 0, 0, 0, 1, 1,
-0.9149597, -0.6772754, -2.741751, 0, 0, 0, 1, 1,
-0.9130994, 0.3211732, 0.2371911, 0, 0, 0, 1, 1,
-0.9087189, -0.6302348, -1.911412, 0, 0, 0, 1, 1,
-0.9073124, -0.1324165, -1.048044, 0, 0, 0, 1, 1,
-0.9036912, 0.9096627, -0.4228618, 1, 1, 1, 1, 1,
-0.8973694, 1.363697, -0.8535836, 1, 1, 1, 1, 1,
-0.8949581, 0.2444276, -2.666571, 1, 1, 1, 1, 1,
-0.893717, -0.7476621, -2.945932, 1, 1, 1, 1, 1,
-0.8925697, -0.744414, -2.073009, 1, 1, 1, 1, 1,
-0.8852842, -0.1990789, -1.69606, 1, 1, 1, 1, 1,
-0.8850827, -0.497958, -1.495978, 1, 1, 1, 1, 1,
-0.881635, -0.6345888, 0.106851, 1, 1, 1, 1, 1,
-0.8793106, -0.7894825, -4.128352, 1, 1, 1, 1, 1,
-0.8784826, -0.9886196, -2.863934, 1, 1, 1, 1, 1,
-0.871493, -0.2141242, -2.14243, 1, 1, 1, 1, 1,
-0.8706721, -0.5867093, -2.817498, 1, 1, 1, 1, 1,
-0.8684667, 1.006105, -0.06165249, 1, 1, 1, 1, 1,
-0.8621557, 2.604334, 1.61507, 1, 1, 1, 1, 1,
-0.859493, -0.0722883, 0.2495663, 1, 1, 1, 1, 1,
-0.847182, -1.225904, -2.20963, 0, 0, 1, 1, 1,
-0.8433131, 1.249202, -1.205712, 1, 0, 0, 1, 1,
-0.8411517, -0.3096186, -3.072342, 1, 0, 0, 1, 1,
-0.8280731, 1.830145, 1.182566, 1, 0, 0, 1, 1,
-0.819967, 0.7076953, 0.07317605, 1, 0, 0, 1, 1,
-0.8176745, -0.02030984, -0.4985166, 1, 0, 0, 1, 1,
-0.8154352, 0.6351864, -1.582351, 0, 0, 0, 1, 1,
-0.8111243, -1.109809, -2.629897, 0, 0, 0, 1, 1,
-0.8109166, 0.007989469, -1.018227, 0, 0, 0, 1, 1,
-0.8098543, 0.8873461, 0.2938172, 0, 0, 0, 1, 1,
-0.8093253, 0.05174306, -1.539679, 0, 0, 0, 1, 1,
-0.8027539, 0.01334868, -1.141777, 0, 0, 0, 1, 1,
-0.8023881, -0.4412185, -2.885549, 0, 0, 0, 1, 1,
-0.8021882, -0.8825709, -2.994997, 1, 1, 1, 1, 1,
-0.7975641, -2.019428, -4.431517, 1, 1, 1, 1, 1,
-0.7964101, -0.03566857, -1.911156, 1, 1, 1, 1, 1,
-0.7865017, 0.8777806, 0.5411844, 1, 1, 1, 1, 1,
-0.7844784, 0.7443816, -0.3599429, 1, 1, 1, 1, 1,
-0.7798469, -0.2115914, -0.3974899, 1, 1, 1, 1, 1,
-0.7731247, 0.8396382, -0.1556384, 1, 1, 1, 1, 1,
-0.7727522, 0.8187663, -0.6881584, 1, 1, 1, 1, 1,
-0.7717794, -0.8104197, -3.911804, 1, 1, 1, 1, 1,
-0.7714831, 1.350453, -1.800341, 1, 1, 1, 1, 1,
-0.7646771, 0.8128069, 0.8467709, 1, 1, 1, 1, 1,
-0.7623052, -1.100733, -2.609665, 1, 1, 1, 1, 1,
-0.7593749, -1.40898, -2.332252, 1, 1, 1, 1, 1,
-0.756524, -2.576801, -3.602401, 1, 1, 1, 1, 1,
-0.7539113, -1.534893, -3.376158, 1, 1, 1, 1, 1,
-0.7438916, -1.207212, -4.945638, 0, 0, 1, 1, 1,
-0.7424112, 2.361591, -0.3155904, 1, 0, 0, 1, 1,
-0.7415535, 0.8388441, 0.8234783, 1, 0, 0, 1, 1,
-0.7400305, 0.4025071, -0.3367437, 1, 0, 0, 1, 1,
-0.7377523, -0.7320275, -2.23533, 1, 0, 0, 1, 1,
-0.732071, 0.8208086, -0.3026187, 1, 0, 0, 1, 1,
-0.7265822, 0.8439886, -1.485756, 0, 0, 0, 1, 1,
-0.7220058, -0.6859, -1.525669, 0, 0, 0, 1, 1,
-0.7191237, -0.2484773, -0.6958127, 0, 0, 0, 1, 1,
-0.7128521, -0.4571943, -3.070284, 0, 0, 0, 1, 1,
-0.7079774, 0.0951291, 0.2639264, 0, 0, 0, 1, 1,
-0.7058926, -0.1711, -1.451958, 0, 0, 0, 1, 1,
-0.6992319, 0.9997928, -0.8763058, 0, 0, 0, 1, 1,
-0.6943465, 0.9269879, -1.158832, 1, 1, 1, 1, 1,
-0.6933272, 0.06316847, -2.000109, 1, 1, 1, 1, 1,
-0.6912965, 0.6418046, -1.296986, 1, 1, 1, 1, 1,
-0.678314, 0.1545005, -0.9764251, 1, 1, 1, 1, 1,
-0.6777681, -0.9228327, -1.64815, 1, 1, 1, 1, 1,
-0.6764542, -0.8939663, -3.840125, 1, 1, 1, 1, 1,
-0.6757425, 0.05458498, -0.8003368, 1, 1, 1, 1, 1,
-0.6733201, 1.290478, -1.405426, 1, 1, 1, 1, 1,
-0.6728981, 0.8481386, -2.319071, 1, 1, 1, 1, 1,
-0.6716794, -0.5400031, -1.26261, 1, 1, 1, 1, 1,
-0.671222, 1.984617, -1.266361, 1, 1, 1, 1, 1,
-0.666613, 0.111519, 0.1150103, 1, 1, 1, 1, 1,
-0.6608983, 0.7754303, -1.675447, 1, 1, 1, 1, 1,
-0.6568122, 0.1638544, -1.495426, 1, 1, 1, 1, 1,
-0.6548548, -0.169795, -1.294358, 1, 1, 1, 1, 1,
-0.6531314, -0.6204391, -1.810538, 0, 0, 1, 1, 1,
-0.6476088, -1.628226, -3.17708, 1, 0, 0, 1, 1,
-0.6458881, -0.3435207, -3.31591, 1, 0, 0, 1, 1,
-0.6457687, -0.1930882, -1.61157, 1, 0, 0, 1, 1,
-0.6417819, 0.01818751, -0.9858296, 1, 0, 0, 1, 1,
-0.641207, 1.140101, -0.5393181, 1, 0, 0, 1, 1,
-0.6407441, 0.03554038, -2.561927, 0, 0, 0, 1, 1,
-0.6390349, -1.233919, -2.900847, 0, 0, 0, 1, 1,
-0.6359602, 1.446554, -0.9440657, 0, 0, 0, 1, 1,
-0.6351747, -0.9737104, -0.6689548, 0, 0, 0, 1, 1,
-0.6338341, 0.1146122, -2.521202, 0, 0, 0, 1, 1,
-0.6332884, -1.075169, -2.401533, 0, 0, 0, 1, 1,
-0.6224959, -0.4041959, 0.2539153, 0, 0, 0, 1, 1,
-0.6163259, -0.5727197, -2.533935, 1, 1, 1, 1, 1,
-0.608497, 0.3278936, -0.7391509, 1, 1, 1, 1, 1,
-0.6072935, 0.7502803, 0.7309837, 1, 1, 1, 1, 1,
-0.6054901, 0.4424755, -1.078113, 1, 1, 1, 1, 1,
-0.600878, 1.380551, -2.785677, 1, 1, 1, 1, 1,
-0.5999064, -0.2334327, -2.379085, 1, 1, 1, 1, 1,
-0.5990127, 0.5839036, -0.2847115, 1, 1, 1, 1, 1,
-0.5967463, -0.03567627, -2.061766, 1, 1, 1, 1, 1,
-0.5955747, -0.6520227, -3.268924, 1, 1, 1, 1, 1,
-0.5940143, 0.3102541, 0.08003391, 1, 1, 1, 1, 1,
-0.593708, 0.3579, -0.3786187, 1, 1, 1, 1, 1,
-0.59008, -0.8192128, -3.152895, 1, 1, 1, 1, 1,
-0.5897461, -0.128273, -1.300484, 1, 1, 1, 1, 1,
-0.5896468, -2.168262, -3.05068, 1, 1, 1, 1, 1,
-0.5870603, -0.1307343, -2.858352, 1, 1, 1, 1, 1,
-0.5833979, 2.244181, -0.5267394, 0, 0, 1, 1, 1,
-0.5777593, -0.2937052, -1.630808, 1, 0, 0, 1, 1,
-0.5755793, 1.376188, -0.5376909, 1, 0, 0, 1, 1,
-0.5714842, -0.3914435, -1.810568, 1, 0, 0, 1, 1,
-0.5624065, 0.2280113, -2.632118, 1, 0, 0, 1, 1,
-0.5607854, 0.2934822, -0.9899853, 1, 0, 0, 1, 1,
-0.5485225, 2.188195, 0.2986602, 0, 0, 0, 1, 1,
-0.5484602, 0.4257348, -0.8378513, 0, 0, 0, 1, 1,
-0.5477468, 0.5038879, -2.220951, 0, 0, 0, 1, 1,
-0.5450673, 0.1578854, -2.721902, 0, 0, 0, 1, 1,
-0.5426974, -1.538798, -3.364632, 0, 0, 0, 1, 1,
-0.5417611, 0.4318536, -1.755167, 0, 0, 0, 1, 1,
-0.5404496, 2.103204, -0.07719219, 0, 0, 0, 1, 1,
-0.5404031, -0.8805889, -1.802851, 1, 1, 1, 1, 1,
-0.5395625, 1.092758, -0.4522572, 1, 1, 1, 1, 1,
-0.5356136, -0.4305595, -3.114966, 1, 1, 1, 1, 1,
-0.5315011, 1.021131, -0.5994884, 1, 1, 1, 1, 1,
-0.5305076, -0.9941713, -2.762658, 1, 1, 1, 1, 1,
-0.5302407, -1.347877, -2.18859, 1, 1, 1, 1, 1,
-0.5271488, -0.7813007, -0.6912283, 1, 1, 1, 1, 1,
-0.5249203, 0.3854854, -2.657468, 1, 1, 1, 1, 1,
-0.5229195, 1.743781, -0.7888548, 1, 1, 1, 1, 1,
-0.5227874, -0.3692676, -1.842514, 1, 1, 1, 1, 1,
-0.5189025, -2.175785, -3.48566, 1, 1, 1, 1, 1,
-0.5177312, -0.2746418, -1.308459, 1, 1, 1, 1, 1,
-0.5168433, -1.342985, -1.878529, 1, 1, 1, 1, 1,
-0.5163966, -0.2836139, -1.341794, 1, 1, 1, 1, 1,
-0.5081285, -1.514585, -3.629181, 1, 1, 1, 1, 1,
-0.5003057, 1.407494, 0.7561308, 0, 0, 1, 1, 1,
-0.4948961, 1.517326, -0.431535, 1, 0, 0, 1, 1,
-0.4933046, 1.549076, -0.3217825, 1, 0, 0, 1, 1,
-0.4848487, -1.762564, -2.582083, 1, 0, 0, 1, 1,
-0.4829312, -1.611491, -3.872474, 1, 0, 0, 1, 1,
-0.4798374, 0.06954464, -0.8597586, 1, 0, 0, 1, 1,
-0.4661649, -0.7874228, -3.594102, 0, 0, 0, 1, 1,
-0.461407, 0.9464874, -1.495507, 0, 0, 0, 1, 1,
-0.4605134, -0.5461453, -4.210671, 0, 0, 0, 1, 1,
-0.4603404, 0.5820943, -1.590484, 0, 0, 0, 1, 1,
-0.4574247, -0.07272355, -2.802945, 0, 0, 0, 1, 1,
-0.4532749, 0.8329747, -0.6206086, 0, 0, 0, 1, 1,
-0.4519369, -0.1699875, -2.281898, 0, 0, 0, 1, 1,
-0.4507974, 0.09082076, -0.2490266, 1, 1, 1, 1, 1,
-0.4473891, -0.3778206, -1.956516, 1, 1, 1, 1, 1,
-0.4417683, -0.1232193, -0.7918453, 1, 1, 1, 1, 1,
-0.4385836, -0.1984575, -0.9238644, 1, 1, 1, 1, 1,
-0.4354819, 0.7264181, 0.5810525, 1, 1, 1, 1, 1,
-0.4334875, 0.001190333, 0.2128129, 1, 1, 1, 1, 1,
-0.4324106, -0.6166174, -1.980225, 1, 1, 1, 1, 1,
-0.4282661, 0.6814037, -0.3057507, 1, 1, 1, 1, 1,
-0.4243157, 0.9993731, 1.69846, 1, 1, 1, 1, 1,
-0.4234634, 0.321396, -0.5777342, 1, 1, 1, 1, 1,
-0.4224809, 0.1389474, 0.4949491, 1, 1, 1, 1, 1,
-0.4187885, 1.453806, -1.740101, 1, 1, 1, 1, 1,
-0.4183021, -2.349252, -2.562538, 1, 1, 1, 1, 1,
-0.4147431, -1.05282, -4.620917, 1, 1, 1, 1, 1,
-0.4140206, 0.4146916, -1.802411, 1, 1, 1, 1, 1,
-0.4110831, 0.517252, -1.285666, 0, 0, 1, 1, 1,
-0.4104732, 0.3412585, -0.02013274, 1, 0, 0, 1, 1,
-0.4100247, -2.198117, -3.407016, 1, 0, 0, 1, 1,
-0.4092435, -1.501408, -3.071374, 1, 0, 0, 1, 1,
-0.4084582, 0.5167594, 0.2629767, 1, 0, 0, 1, 1,
-0.4076249, -0.2984705, -2.61272, 1, 0, 0, 1, 1,
-0.4065675, 0.7502934, -2.195257, 0, 0, 0, 1, 1,
-0.4062201, -0.7578948, -2.420452, 0, 0, 0, 1, 1,
-0.4009716, -0.6633782, -1.586214, 0, 0, 0, 1, 1,
-0.3981396, -1.29238, -3.790443, 0, 0, 0, 1, 1,
-0.3940832, -0.4796581, -1.58116, 0, 0, 0, 1, 1,
-0.3902335, -0.3577679, -2.1324, 0, 0, 0, 1, 1,
-0.3862531, 1.179587, -1.20874, 0, 0, 0, 1, 1,
-0.384247, 0.5164488, 0.6334195, 1, 1, 1, 1, 1,
-0.3800496, -2.020298, -3.167315, 1, 1, 1, 1, 1,
-0.3721652, 1.374572, 0.7225965, 1, 1, 1, 1, 1,
-0.3656103, -0.8200166, -3.070769, 1, 1, 1, 1, 1,
-0.3612384, -1.931222, -2.189875, 1, 1, 1, 1, 1,
-0.361001, -0.9049493, -3.474798, 1, 1, 1, 1, 1,
-0.360119, 0.5008872, -0.4291952, 1, 1, 1, 1, 1,
-0.3583947, 0.8481708, -0.04941492, 1, 1, 1, 1, 1,
-0.3553927, 0.6098756, -1.45103, 1, 1, 1, 1, 1,
-0.3507362, -1.256009, -3.816287, 1, 1, 1, 1, 1,
-0.3456334, -0.5763779, -3.00994, 1, 1, 1, 1, 1,
-0.3399339, 0.5123547, -0.3180679, 1, 1, 1, 1, 1,
-0.339743, 1.209875, -0.1839801, 1, 1, 1, 1, 1,
-0.3349884, 1.715232, 0.4550618, 1, 1, 1, 1, 1,
-0.3286032, 0.3230848, -0.07211307, 1, 1, 1, 1, 1,
-0.3274448, 0.2351645, -2.349175, 0, 0, 1, 1, 1,
-0.3251071, -0.5681688, -1.909074, 1, 0, 0, 1, 1,
-0.3224721, -0.1842955, -2.275897, 1, 0, 0, 1, 1,
-0.3122307, 0.5346712, -0.7111452, 1, 0, 0, 1, 1,
-0.3118887, -1.479525, -3.971197, 1, 0, 0, 1, 1,
-0.305981, 0.5542551, -1.195815, 1, 0, 0, 1, 1,
-0.30112, -0.7203408, -3.398463, 0, 0, 0, 1, 1,
-0.2994037, -0.7635838, -0.8331872, 0, 0, 0, 1, 1,
-0.2938586, 1.068403, -0.2522938, 0, 0, 0, 1, 1,
-0.2919487, -0.9994593, -2.855282, 0, 0, 0, 1, 1,
-0.2909929, 0.4561597, 1.304302, 0, 0, 0, 1, 1,
-0.2908436, -1.043311, -1.691035, 0, 0, 0, 1, 1,
-0.2836496, -0.3921578, -1.751923, 0, 0, 0, 1, 1,
-0.2762322, 0.02136069, -1.324288, 1, 1, 1, 1, 1,
-0.2757207, -1.051106, -1.538623, 1, 1, 1, 1, 1,
-0.2723832, 0.654749, 0.966393, 1, 1, 1, 1, 1,
-0.2717961, -1.604605, -3.363886, 1, 1, 1, 1, 1,
-0.2714284, -0.2902248, -2.693112, 1, 1, 1, 1, 1,
-0.2667174, 0.5691732, 0.7265499, 1, 1, 1, 1, 1,
-0.262491, -1.176167, -2.7657, 1, 1, 1, 1, 1,
-0.2576099, -0.335369, -3.130429, 1, 1, 1, 1, 1,
-0.255596, 3.179794, -0.3455878, 1, 1, 1, 1, 1,
-0.2492183, 0.9711144, -0.8657342, 1, 1, 1, 1, 1,
-0.2476342, 0.8500368, -0.1777083, 1, 1, 1, 1, 1,
-0.246853, 1.059807, 0.3435608, 1, 1, 1, 1, 1,
-0.2460097, -0.4577954, -2.855818, 1, 1, 1, 1, 1,
-0.2395967, 0.0533189, -0.597565, 1, 1, 1, 1, 1,
-0.2392377, 1.268949, -0.5972478, 1, 1, 1, 1, 1,
-0.2349685, -0.4949105, -2.002613, 0, 0, 1, 1, 1,
-0.2312695, -0.6999478, -1.428034, 1, 0, 0, 1, 1,
-0.2306666, -1.324602, -3.095452, 1, 0, 0, 1, 1,
-0.2271674, 1.563636, 1.11363, 1, 0, 0, 1, 1,
-0.2260849, -0.6077095, -2.110565, 1, 0, 0, 1, 1,
-0.2228506, 0.5124865, -0.1283554, 1, 0, 0, 1, 1,
-0.2205341, -0.09727951, -2.507742, 0, 0, 0, 1, 1,
-0.2018885, -0.013217, -2.218179, 0, 0, 0, 1, 1,
-0.1986068, 0.3309196, -1.136835, 0, 0, 0, 1, 1,
-0.196994, -0.4186074, -4.415621, 0, 0, 0, 1, 1,
-0.193396, 1.22812, -0.1142944, 0, 0, 0, 1, 1,
-0.1922511, 0.03477917, -1.900492, 0, 0, 0, 1, 1,
-0.1918785, 1.659109, -0.8319646, 0, 0, 0, 1, 1,
-0.1878589, -2.352918, -3.580357, 1, 1, 1, 1, 1,
-0.1843881, 0.4552845, -1.066981, 1, 1, 1, 1, 1,
-0.1841448, -0.516821, -2.543341, 1, 1, 1, 1, 1,
-0.1835589, 0.5286237, -2.405023, 1, 1, 1, 1, 1,
-0.1747591, -0.9987068, -3.057077, 1, 1, 1, 1, 1,
-0.1738915, 1.21644, -0.2764627, 1, 1, 1, 1, 1,
-0.1724799, -1.394224, -2.250409, 1, 1, 1, 1, 1,
-0.1684946, -1.248619, -1.844392, 1, 1, 1, 1, 1,
-0.1678742, 0.6905922, 1.112784, 1, 1, 1, 1, 1,
-0.1637339, -0.1005918, -2.029639, 1, 1, 1, 1, 1,
-0.1624326, -1.742994, -2.602117, 1, 1, 1, 1, 1,
-0.1603371, -0.3621497, -3.593841, 1, 1, 1, 1, 1,
-0.159019, 0.06682426, -2.657285, 1, 1, 1, 1, 1,
-0.158796, 0.5193166, -0.6313326, 1, 1, 1, 1, 1,
-0.1585255, -0.2946329, -2.167689, 1, 1, 1, 1, 1,
-0.1567377, -0.6539583, -3.207052, 0, 0, 1, 1, 1,
-0.1546825, 1.685985, 0.1363806, 1, 0, 0, 1, 1,
-0.1523695, 0.9026074, -0.9763827, 1, 0, 0, 1, 1,
-0.152066, 1.229267, 0.2514445, 1, 0, 0, 1, 1,
-0.1440644, 2.363525, -0.4855546, 1, 0, 0, 1, 1,
-0.1425712, -0.5526366, -2.071569, 1, 0, 0, 1, 1,
-0.1386767, 0.3456907, -0.7512707, 0, 0, 0, 1, 1,
-0.1359175, -1.52188, -3.502654, 0, 0, 0, 1, 1,
-0.1335539, 0.1635162, 0.5250919, 0, 0, 0, 1, 1,
-0.1284293, -0.9486802, -1.973544, 0, 0, 0, 1, 1,
-0.1241092, 0.326225, -1.370395, 0, 0, 0, 1, 1,
-0.1202097, -1.027505, -2.961812, 0, 0, 0, 1, 1,
-0.1195447, 1.43098, 0.9600204, 0, 0, 0, 1, 1,
-0.1187772, -2.548287, -2.575014, 1, 1, 1, 1, 1,
-0.1184129, 0.3267325, 2.290996, 1, 1, 1, 1, 1,
-0.115975, -1.518183, -2.128028, 1, 1, 1, 1, 1,
-0.11404, -0.4452907, -5.912653, 1, 1, 1, 1, 1,
-0.1135286, 0.9989005, -1.056132, 1, 1, 1, 1, 1,
-0.1124858, -1.427175, -2.418162, 1, 1, 1, 1, 1,
-0.1070785, 2.470022, 0.1481405, 1, 1, 1, 1, 1,
-0.09473417, -0.5294686, -3.258921, 1, 1, 1, 1, 1,
-0.09128798, -0.7662018, -3.526552, 1, 1, 1, 1, 1,
-0.09063853, -0.9162341, -2.777834, 1, 1, 1, 1, 1,
-0.08925696, -1.201615, -4.392319, 1, 1, 1, 1, 1,
-0.08545317, -0.1389931, -2.963345, 1, 1, 1, 1, 1,
-0.08392728, 1.376255, 1.269835, 1, 1, 1, 1, 1,
-0.06698178, 2.126302, -0.6010513, 1, 1, 1, 1, 1,
-0.06588306, 1.639951, -0.7614875, 1, 1, 1, 1, 1,
-0.0650358, 1.138512, 0.1526625, 0, 0, 1, 1, 1,
-0.060924, -0.6355923, -2.760392, 1, 0, 0, 1, 1,
-0.06079251, -0.7835813, -3.160166, 1, 0, 0, 1, 1,
-0.06073294, -1.830186, -4.960851, 1, 0, 0, 1, 1,
-0.05985727, -0.0681929, -2.521008, 1, 0, 0, 1, 1,
-0.05965483, -0.5961916, -2.584764, 1, 0, 0, 1, 1,
-0.05646195, -0.3084596, -3.519583, 0, 0, 0, 1, 1,
-0.05587674, 0.3996771, 1.324293, 0, 0, 0, 1, 1,
-0.0553875, -0.08093598, -2.611275, 0, 0, 0, 1, 1,
-0.05441873, -0.4281976, -2.712045, 0, 0, 0, 1, 1,
-0.04934072, 0.4985816, -0.3376574, 0, 0, 0, 1, 1,
-0.04654725, -1.04414, -3.937139, 0, 0, 0, 1, 1,
-0.04411905, -1.330951, -3.689477, 0, 0, 0, 1, 1,
-0.04018743, 0.1574119, -0.3330474, 1, 1, 1, 1, 1,
-0.03675074, -0.3744747, -3.613821, 1, 1, 1, 1, 1,
-0.03250391, 2.739835, 1.039546, 1, 1, 1, 1, 1,
-0.029631, -0.8747064, -4.478132, 1, 1, 1, 1, 1,
-0.02935102, 0.3856317, 0.2592069, 1, 1, 1, 1, 1,
-0.02765462, -0.2249521, -2.832527, 1, 1, 1, 1, 1,
-0.02654902, -0.04944576, -1.354255, 1, 1, 1, 1, 1,
-0.02485913, 0.2558814, -0.8764918, 1, 1, 1, 1, 1,
-0.02383174, 1.097111, 1.488258, 1, 1, 1, 1, 1,
-0.02205603, -1.692821, -1.744265, 1, 1, 1, 1, 1,
-0.01938749, 0.8500941, -0.7993623, 1, 1, 1, 1, 1,
-0.01891946, -0.5248519, -2.625752, 1, 1, 1, 1, 1,
-0.01569118, -1.25571, -3.720508, 1, 1, 1, 1, 1,
-0.01500981, 0.3450639, -2.142753, 1, 1, 1, 1, 1,
-0.01439764, 0.9709506, 0.4990093, 1, 1, 1, 1, 1,
-0.01288414, -0.02007766, -1.604793, 0, 0, 1, 1, 1,
-0.01199107, 0.7297797, 0.08969853, 1, 0, 0, 1, 1,
-0.0118872, 0.1931672, -0.7720346, 1, 0, 0, 1, 1,
-0.009073916, -0.9612747, -2.144713, 1, 0, 0, 1, 1,
-0.008839888, -0.375479, -1.796651, 1, 0, 0, 1, 1,
-0.008002984, -0.6171837, -3.275738, 1, 0, 0, 1, 1,
-0.006877804, 0.8282592, 0.6867638, 0, 0, 0, 1, 1,
-0.002996832, -1.359692, -2.459399, 0, 0, 0, 1, 1,
-0.001433089, -0.8112997, -3.110744, 0, 0, 0, 1, 1,
0.0008471653, -0.4653527, 3.553229, 0, 0, 0, 1, 1,
0.003399107, -2.383622, 2.988936, 0, 0, 0, 1, 1,
0.01435473, 0.8298123, 0.4655398, 0, 0, 0, 1, 1,
0.01578464, -0.3179216, 1.922879, 0, 0, 0, 1, 1,
0.01898894, 0.3447822, 1.984597, 1, 1, 1, 1, 1,
0.01930138, -1.126984, 0.8514728, 1, 1, 1, 1, 1,
0.02207659, -0.1833654, 4.483624, 1, 1, 1, 1, 1,
0.02292279, 2.47034, -0.9334722, 1, 1, 1, 1, 1,
0.02405344, -1.337159, 3.506438, 1, 1, 1, 1, 1,
0.02920795, -0.8238981, 3.772374, 1, 1, 1, 1, 1,
0.02997028, 0.6025487, -0.7673052, 1, 1, 1, 1, 1,
0.03388446, -0.4575021, 4.083286, 1, 1, 1, 1, 1,
0.03489273, 0.1146042, -0.3350505, 1, 1, 1, 1, 1,
0.03663763, -0.4564786, 3.940003, 1, 1, 1, 1, 1,
0.04911877, 0.1016326, 0.8706558, 1, 1, 1, 1, 1,
0.05189951, -0.06457667, 2.154406, 1, 1, 1, 1, 1,
0.05254284, 0.903736, 1.232611, 1, 1, 1, 1, 1,
0.0527553, 0.2250509, 1.674349, 1, 1, 1, 1, 1,
0.05402624, -0.07505279, 1.755794, 1, 1, 1, 1, 1,
0.06307992, 0.2656119, 0.1317396, 0, 0, 1, 1, 1,
0.06309233, -2.493732, 3.071321, 1, 0, 0, 1, 1,
0.06568099, -0.3873778, 3.357392, 1, 0, 0, 1, 1,
0.0660859, -0.8766482, 3.091713, 1, 0, 0, 1, 1,
0.06694449, 0.9270659, 1.423635, 1, 0, 0, 1, 1,
0.06770707, -1.050362, 3.505933, 1, 0, 0, 1, 1,
0.07310292, -0.698168, 2.832991, 0, 0, 0, 1, 1,
0.07684611, -1.094358, 2.460191, 0, 0, 0, 1, 1,
0.08392695, -1.255138, 3.378394, 0, 0, 0, 1, 1,
0.08403285, -0.2063808, 2.960108, 0, 0, 0, 1, 1,
0.09151027, -0.3704264, 3.63188, 0, 0, 0, 1, 1,
0.09288704, 0.9997624, -1.366655, 0, 0, 0, 1, 1,
0.09566001, -0.7098674, 3.147377, 0, 0, 0, 1, 1,
0.09601067, 0.07541259, 0.3745947, 1, 1, 1, 1, 1,
0.09713463, 0.4133486, 1.263803, 1, 1, 1, 1, 1,
0.09716199, -0.1589329, 1.85582, 1, 1, 1, 1, 1,
0.103275, -1.928692, 3.419312, 1, 1, 1, 1, 1,
0.1035934, 2.406165, -0.165512, 1, 1, 1, 1, 1,
0.1057623, -1.371812, 3.054797, 1, 1, 1, 1, 1,
0.1062442, -0.6458122, 2.698487, 1, 1, 1, 1, 1,
0.1065944, 0.5540805, 0.222453, 1, 1, 1, 1, 1,
0.1097967, -1.123521, 3.87595, 1, 1, 1, 1, 1,
0.1099837, 1.136898, -0.5195873, 1, 1, 1, 1, 1,
0.1152133, -0.330002, 3.129188, 1, 1, 1, 1, 1,
0.1161508, -0.04492643, 0.6099109, 1, 1, 1, 1, 1,
0.1174608, 0.4252887, 0.6313043, 1, 1, 1, 1, 1,
0.1238166, 0.08181901, 0.7659376, 1, 1, 1, 1, 1,
0.1312322, -1.546325, 1.444402, 1, 1, 1, 1, 1,
0.1345426, -1.315948, 4.628076, 0, 0, 1, 1, 1,
0.1363465, -1.391326, 1.987045, 1, 0, 0, 1, 1,
0.1400934, -0.1185423, 0.439931, 1, 0, 0, 1, 1,
0.1414279, -0.2118017, 2.57621, 1, 0, 0, 1, 1,
0.143483, 1.279059, -1.621056, 1, 0, 0, 1, 1,
0.1450647, -0.8217672, 1.298805, 1, 0, 0, 1, 1,
0.1461528, -1.301709, 2.570135, 0, 0, 0, 1, 1,
0.1461945, -1.316734, 3.922298, 0, 0, 0, 1, 1,
0.1472738, -1.45134, 2.080248, 0, 0, 0, 1, 1,
0.1479608, -0.5832134, 2.256813, 0, 0, 0, 1, 1,
0.1528918, 0.3014053, 2.626651, 0, 0, 0, 1, 1,
0.1546093, 0.03550936, 1.286121, 0, 0, 0, 1, 1,
0.1550226, -0.651985, 2.070915, 0, 0, 0, 1, 1,
0.159488, -0.6632476, 3.829001, 1, 1, 1, 1, 1,
0.16208, -1.919278, 3.519315, 1, 1, 1, 1, 1,
0.1634742, 0.5278875, 1.760706, 1, 1, 1, 1, 1,
0.1668443, 0.5820625, 0.1677535, 1, 1, 1, 1, 1,
0.1686808, -0.3443728, 3.504784, 1, 1, 1, 1, 1,
0.1695561, 0.5690635, 0.3803766, 1, 1, 1, 1, 1,
0.1695673, -0.07385816, 2.352908, 1, 1, 1, 1, 1,
0.1698137, -0.2818545, 2.57319, 1, 1, 1, 1, 1,
0.1719624, 0.4752796, -0.8550283, 1, 1, 1, 1, 1,
0.1766208, -1.230094, 2.453589, 1, 1, 1, 1, 1,
0.1767839, -0.2680841, 2.456255, 1, 1, 1, 1, 1,
0.1790855, 2.155245, -1.192067, 1, 1, 1, 1, 1,
0.182345, -1.442424, 3.714564, 1, 1, 1, 1, 1,
0.1856265, 0.4852904, -0.243765, 1, 1, 1, 1, 1,
0.195182, 0.5573596, 0.04585602, 1, 1, 1, 1, 1,
0.197244, -0.1799786, 2.053045, 0, 0, 1, 1, 1,
0.1977777, 0.4698214, -0.4100262, 1, 0, 0, 1, 1,
0.2011917, -0.3051854, 3.388335, 1, 0, 0, 1, 1,
0.210584, -0.3854999, 3.647679, 1, 0, 0, 1, 1,
0.2135562, 0.4702456, 1.133232, 1, 0, 0, 1, 1,
0.215758, 0.3579829, 0.3360327, 1, 0, 0, 1, 1,
0.218211, -0.5151672, 3.911661, 0, 0, 0, 1, 1,
0.2197308, 1.361655, 0.640385, 0, 0, 0, 1, 1,
0.2204903, -0.2898743, 4.833171, 0, 0, 0, 1, 1,
0.2232422, 0.005194221, 1.979579, 0, 0, 0, 1, 1,
0.2252232, -2.884775, 2.415525, 0, 0, 0, 1, 1,
0.2285182, 0.9319125, 0.9572346, 0, 0, 0, 1, 1,
0.2323805, 0.2264246, -0.3016497, 0, 0, 0, 1, 1,
0.2381474, -1.617373, 3.325002, 1, 1, 1, 1, 1,
0.2503331, -0.8568628, 3.720456, 1, 1, 1, 1, 1,
0.2581212, 0.1262302, 1.340619, 1, 1, 1, 1, 1,
0.2590366, -0.2431688, 2.169666, 1, 1, 1, 1, 1,
0.2667522, -0.2510863, 3.058212, 1, 1, 1, 1, 1,
0.268082, -0.7582307, 2.579444, 1, 1, 1, 1, 1,
0.2727798, 1.264648, 0.7197756, 1, 1, 1, 1, 1,
0.2729048, -0.704048, 1.542673, 1, 1, 1, 1, 1,
0.2729751, 1.206524, -1.107128, 1, 1, 1, 1, 1,
0.2738806, 0.3288558, -0.6290646, 1, 1, 1, 1, 1,
0.2772856, 2.188575, -1.715873, 1, 1, 1, 1, 1,
0.2782463, 1.601019, 0.1247233, 1, 1, 1, 1, 1,
0.2800854, 1.231465, 0.2452269, 1, 1, 1, 1, 1,
0.2803594, -0.1089378, 1.438318, 1, 1, 1, 1, 1,
0.2810425, 0.2533355, 1.604224, 1, 1, 1, 1, 1,
0.2828512, 0.5246385, 1.475051, 0, 0, 1, 1, 1,
0.2845271, 0.2356715, 0.963823, 1, 0, 0, 1, 1,
0.2855313, 0.3178361, 0.7358812, 1, 0, 0, 1, 1,
0.2873074, 0.4296742, 0.8109189, 1, 0, 0, 1, 1,
0.2876459, 1.039265, -0.3734418, 1, 0, 0, 1, 1,
0.2905271, 1.377996, -1.908726, 1, 0, 0, 1, 1,
0.2938502, 0.08161257, 0.2943845, 0, 0, 0, 1, 1,
0.2976779, -1.406683, 4.045121, 0, 0, 0, 1, 1,
0.3030722, -0.3344309, 2.376608, 0, 0, 0, 1, 1,
0.3143876, -1.454645, 1.460883, 0, 0, 0, 1, 1,
0.3180948, 0.7357822, 0.5817552, 0, 0, 0, 1, 1,
0.3202023, 0.3315468, 1.114798, 0, 0, 0, 1, 1,
0.321108, -0.5756168, 2.438149, 0, 0, 0, 1, 1,
0.32861, 2.516024, -0.3090495, 1, 1, 1, 1, 1,
0.328929, -0.3689325, 3.304265, 1, 1, 1, 1, 1,
0.331063, -1.299226, 3.034387, 1, 1, 1, 1, 1,
0.3317229, 0.3530432, 1.774022, 1, 1, 1, 1, 1,
0.3357, -0.495814, 1.434872, 1, 1, 1, 1, 1,
0.3377275, -0.0573095, 2.83847, 1, 1, 1, 1, 1,
0.3383346, -0.01363324, 3.571286, 1, 1, 1, 1, 1,
0.3474786, -0.331222, 3.058991, 1, 1, 1, 1, 1,
0.3536414, 0.1746943, 1.649777, 1, 1, 1, 1, 1,
0.3543816, 0.1591852, 1.495122, 1, 1, 1, 1, 1,
0.3568546, 0.7068762, -0.6891761, 1, 1, 1, 1, 1,
0.3569178, 1.18957, 0.02610049, 1, 1, 1, 1, 1,
0.362605, -1.243032, 2.938951, 1, 1, 1, 1, 1,
0.3654252, 1.080962, -0.6250417, 1, 1, 1, 1, 1,
0.3675675, 0.8228534, 0.376259, 1, 1, 1, 1, 1,
0.3695537, 1.427957, 0.1517419, 0, 0, 1, 1, 1,
0.370757, -1.143247, 2.61538, 1, 0, 0, 1, 1,
0.3712774, 1.404817, 0.6278557, 1, 0, 0, 1, 1,
0.3804021, 0.2329636, -0.8678881, 1, 0, 0, 1, 1,
0.384037, 1.05058, 0.4801584, 1, 0, 0, 1, 1,
0.3873993, 0.6064965, -1.958292, 1, 0, 0, 1, 1,
0.3926201, 0.6077443, 2.532519, 0, 0, 0, 1, 1,
0.3944324, -1.325988, 2.513514, 0, 0, 0, 1, 1,
0.3957645, -0.4368166, 2.721346, 0, 0, 0, 1, 1,
0.3963883, 0.9405835, 0.1366343, 0, 0, 0, 1, 1,
0.3969662, 0.09245308, 1.605573, 0, 0, 0, 1, 1,
0.3970071, 0.9082379, 1.110301, 0, 0, 0, 1, 1,
0.3972432, -1.522804, 3.541316, 0, 0, 0, 1, 1,
0.4001022, 0.3227484, 0.2820572, 1, 1, 1, 1, 1,
0.4012159, -0.8154806, 3.657861, 1, 1, 1, 1, 1,
0.402155, -0.4841698, 2.35036, 1, 1, 1, 1, 1,
0.4023838, -2.010064, 3.93587, 1, 1, 1, 1, 1,
0.4063407, -1.040649, 4.460548, 1, 1, 1, 1, 1,
0.4088239, 0.6652671, 0.2096826, 1, 1, 1, 1, 1,
0.4090432, -1.440311, 3.20615, 1, 1, 1, 1, 1,
0.4100663, 0.02169558, 2.355931, 1, 1, 1, 1, 1,
0.4130903, -1.137081, 4.655077, 1, 1, 1, 1, 1,
0.4176471, 0.8400861, 0.8691854, 1, 1, 1, 1, 1,
0.4197258, 0.5822307, 0.4641417, 1, 1, 1, 1, 1,
0.4240642, 2.1191, -1.493328, 1, 1, 1, 1, 1,
0.4268638, -1.153956, 3.103388, 1, 1, 1, 1, 1,
0.4295228, -0.2357291, 1.097269, 1, 1, 1, 1, 1,
0.4338425, -0.7410124, 1.693918, 1, 1, 1, 1, 1,
0.4372283, -0.394497, 1.26992, 0, 0, 1, 1, 1,
0.4388805, -1.654742, 2.952818, 1, 0, 0, 1, 1,
0.4452615, 0.4924426, -0.3197475, 1, 0, 0, 1, 1,
0.4485597, -1.217345, 2.743348, 1, 0, 0, 1, 1,
0.4512175, 0.2621985, 0.111071, 1, 0, 0, 1, 1,
0.4562201, 1.496645, 0.256508, 1, 0, 0, 1, 1,
0.4570172, -1.030928, 3.709856, 0, 0, 0, 1, 1,
0.460886, 2.100765, 0.9621136, 0, 0, 0, 1, 1,
0.4718465, -0.8044859, 2.084509, 0, 0, 0, 1, 1,
0.4728623, -0.8813494, 1.75378, 0, 0, 0, 1, 1,
0.4731042, 0.9072112, 1.135119, 0, 0, 0, 1, 1,
0.4762181, 0.8284134, 1.624571, 0, 0, 0, 1, 1,
0.4767767, -0.453929, 1.336671, 0, 0, 0, 1, 1,
0.4843575, 0.0890398, 1.144074, 1, 1, 1, 1, 1,
0.4844331, 1.187055, -0.712907, 1, 1, 1, 1, 1,
0.4880887, -1.366109, 2.925689, 1, 1, 1, 1, 1,
0.4918314, 0.1354272, 2.180732, 1, 1, 1, 1, 1,
0.4966876, -0.4197412, 2.39041, 1, 1, 1, 1, 1,
0.5022976, 0.9699505, 0.3385875, 1, 1, 1, 1, 1,
0.5028729, -0.5124207, 2.011968, 1, 1, 1, 1, 1,
0.5030329, 1.497702, 0.06640714, 1, 1, 1, 1, 1,
0.5063345, -0.9000096, 1.790664, 1, 1, 1, 1, 1,
0.5067341, 1.146496, 1.05127, 1, 1, 1, 1, 1,
0.5086398, -0.5817219, 3.17665, 1, 1, 1, 1, 1,
0.5086934, -1.292464, 1.777707, 1, 1, 1, 1, 1,
0.5155808, -1.042288, 2.481719, 1, 1, 1, 1, 1,
0.5169572, -0.1714128, 2.929728, 1, 1, 1, 1, 1,
0.5203162, -1.204843, 1.683993, 1, 1, 1, 1, 1,
0.5221493, -1.693075, 3.886229, 0, 0, 1, 1, 1,
0.5254568, -0.6084708, 2.042899, 1, 0, 0, 1, 1,
0.5279512, -0.1437727, 2.740998, 1, 0, 0, 1, 1,
0.531854, 0.2580937, 1.882765, 1, 0, 0, 1, 1,
0.5322214, 0.6395895, 1.029169, 1, 0, 0, 1, 1,
0.5423298, -0.8531953, 2.570082, 1, 0, 0, 1, 1,
0.5475607, -1.308016, 3.79349, 0, 0, 0, 1, 1,
0.5479594, 0.9248984, 0.801052, 0, 0, 0, 1, 1,
0.5486264, 0.2374416, 1.156795, 0, 0, 0, 1, 1,
0.5498569, -0.7679681, 1.979346, 0, 0, 0, 1, 1,
0.5543782, -0.2735623, 3.893087, 0, 0, 0, 1, 1,
0.5545153, 1.00226, -1.030834, 0, 0, 0, 1, 1,
0.5545948, -1.103383, 1.399568, 0, 0, 0, 1, 1,
0.5566572, 0.8163307, -1.670379, 1, 1, 1, 1, 1,
0.5601184, -0.9799259, 2.827855, 1, 1, 1, 1, 1,
0.5644764, 0.6745579, 1.649486, 1, 1, 1, 1, 1,
0.5655461, 1.091605, 1.06978, 1, 1, 1, 1, 1,
0.566976, 1.624219, 1.740851, 1, 1, 1, 1, 1,
0.5697365, 0.7696277, 0.6254056, 1, 1, 1, 1, 1,
0.5742796, -2.067715, 3.341572, 1, 1, 1, 1, 1,
0.5798054, 0.195381, 0.78135, 1, 1, 1, 1, 1,
0.5921801, -0.5448796, 0.3174506, 1, 1, 1, 1, 1,
0.5937967, -1.05581, 3.151565, 1, 1, 1, 1, 1,
0.5958534, -1.575127, 3.803135, 1, 1, 1, 1, 1,
0.6032929, 0.6284325, -0.9515814, 1, 1, 1, 1, 1,
0.6050937, -0.1100109, 2.047921, 1, 1, 1, 1, 1,
0.6108596, 1.315698, 0.2542774, 1, 1, 1, 1, 1,
0.617493, 1.366547, 1.242498, 1, 1, 1, 1, 1,
0.6234895, -0.6984099, 2.203103, 0, 0, 1, 1, 1,
0.6246744, -1.096213, 2.684734, 1, 0, 0, 1, 1,
0.6279902, 1.397837, 1.426121, 1, 0, 0, 1, 1,
0.6381996, 1.013587, 0.5657949, 1, 0, 0, 1, 1,
0.6388674, 0.125948, 0.7122128, 1, 0, 0, 1, 1,
0.6394548, -0.4641912, 4.019184, 1, 0, 0, 1, 1,
0.6415496, -1.964761, 3.013191, 0, 0, 0, 1, 1,
0.645182, -1.095347, 1.967407, 0, 0, 0, 1, 1,
0.6462611, -0.483944, 3.168217, 0, 0, 0, 1, 1,
0.6477489, -0.755953, 2.029003, 0, 0, 0, 1, 1,
0.6514201, 0.3257492, 1.109734, 0, 0, 0, 1, 1,
0.6515331, 1.023149, 0.3010314, 0, 0, 0, 1, 1,
0.6518983, 1.462152, -0.6796192, 0, 0, 0, 1, 1,
0.6539863, -1.821928, 2.910989, 1, 1, 1, 1, 1,
0.6572294, 0.2116725, -0.8737234, 1, 1, 1, 1, 1,
0.6598371, -0.6703782, 2.918759, 1, 1, 1, 1, 1,
0.6598856, -0.7909372, 3.637888, 1, 1, 1, 1, 1,
0.6640468, -1.825202, 2.307359, 1, 1, 1, 1, 1,
0.6645301, 0.2411258, 2.186286, 1, 1, 1, 1, 1,
0.6654664, -2.411123, 3.442749, 1, 1, 1, 1, 1,
0.6657475, 2.053346, -0.3889896, 1, 1, 1, 1, 1,
0.6704254, -0.79126, 2.342541, 1, 1, 1, 1, 1,
0.6721267, 0.9859357, -0.8314378, 1, 1, 1, 1, 1,
0.6721342, -0.1274207, 1.331463, 1, 1, 1, 1, 1,
0.6776803, -0.8346972, 1.529998, 1, 1, 1, 1, 1,
0.6884456, -1.704713, 2.600185, 1, 1, 1, 1, 1,
0.6905065, -1.022552, 2.392078, 1, 1, 1, 1, 1,
0.6909946, -0.6369696, 2.961671, 1, 1, 1, 1, 1,
0.692443, -0.8663679, 0.1134997, 0, 0, 1, 1, 1,
0.6946585, -0.03866155, 2.084482, 1, 0, 0, 1, 1,
0.6970361, -2.356614, 3.437893, 1, 0, 0, 1, 1,
0.6973304, 1.241837, 2.143599, 1, 0, 0, 1, 1,
0.7096151, 0.2928829, -1.727599, 1, 0, 0, 1, 1,
0.7128288, 1.020008, -1.385176, 1, 0, 0, 1, 1,
0.7156968, -1.162433, 2.268353, 0, 0, 0, 1, 1,
0.7244246, 0.6990491, 0.5049981, 0, 0, 0, 1, 1,
0.7253423, -0.8863634, 0.6313108, 0, 0, 0, 1, 1,
0.7261837, 0.2814764, 0.4011481, 0, 0, 0, 1, 1,
0.7473821, -0.1302723, 1.232532, 0, 0, 0, 1, 1,
0.7523487, -1.103289, 1.955872, 0, 0, 0, 1, 1,
0.7573752, 0.3142477, 0.3968355, 0, 0, 0, 1, 1,
0.7574352, -0.1877402, 3.284571, 1, 1, 1, 1, 1,
0.7588094, 0.1816362, 1.874917, 1, 1, 1, 1, 1,
0.7609345, -1.107754, 2.163046, 1, 1, 1, 1, 1,
0.7675272, -1.165884, 4.094, 1, 1, 1, 1, 1,
0.7695264, 0.4594563, 0.7372506, 1, 1, 1, 1, 1,
0.7731252, -0.3454967, 0.7506727, 1, 1, 1, 1, 1,
0.7794232, -0.2913324, 2.633802, 1, 1, 1, 1, 1,
0.780768, 0.2019052, 0.511498, 1, 1, 1, 1, 1,
0.7926089, 0.6335302, 0.6779988, 1, 1, 1, 1, 1,
0.7978763, -1.654789, 2.44589, 1, 1, 1, 1, 1,
0.7997265, 0.4079486, 2.506954, 1, 1, 1, 1, 1,
0.801666, 0.2002132, 3.012652, 1, 1, 1, 1, 1,
0.8019463, -0.1521993, 0.5433367, 1, 1, 1, 1, 1,
0.8021154, 0.7444373, 1.154488, 1, 1, 1, 1, 1,
0.8024234, 0.9701409, 0.6404649, 1, 1, 1, 1, 1,
0.8136008, -1.661155, 4.346485, 0, 0, 1, 1, 1,
0.8168594, -0.3953003, 0.6385195, 1, 0, 0, 1, 1,
0.8179349, -0.4165663, 2.277545, 1, 0, 0, 1, 1,
0.8190293, -0.1109577, 1.541024, 1, 0, 0, 1, 1,
0.821397, -0.4971015, 1.141723, 1, 0, 0, 1, 1,
0.8215627, -0.8997802, 2.297728, 1, 0, 0, 1, 1,
0.82421, -0.1354469, 1.331762, 0, 0, 0, 1, 1,
0.826943, 0.03063169, 0.8782926, 0, 0, 0, 1, 1,
0.8282633, -2.606642, 3.699244, 0, 0, 0, 1, 1,
0.8325679, -0.2917569, 3.096712, 0, 0, 0, 1, 1,
0.8329173, 0.512046, -0.5792636, 0, 0, 0, 1, 1,
0.8341269, 1.57637, 0.4403737, 0, 0, 0, 1, 1,
0.8373982, 0.7519911, 1.236889, 0, 0, 0, 1, 1,
0.8416317, -0.4377736, 1.79361, 1, 1, 1, 1, 1,
0.8436269, -1.765109, 3.337417, 1, 1, 1, 1, 1,
0.8466817, 0.8297229, 1.164646, 1, 1, 1, 1, 1,
0.8472584, -0.9760611, 0.5470252, 1, 1, 1, 1, 1,
0.8477458, -0.9677414, 2.350622, 1, 1, 1, 1, 1,
0.8545475, -0.1494171, 3.944828, 1, 1, 1, 1, 1,
0.8618731, -1.225301, 2.996053, 1, 1, 1, 1, 1,
0.8654899, -0.09453247, 1.049405, 1, 1, 1, 1, 1,
0.8717185, 0.8526035, 0.9394158, 1, 1, 1, 1, 1,
0.8722419, -0.6805882, 4.772456, 1, 1, 1, 1, 1,
0.8753375, -0.126738, 2.071644, 1, 1, 1, 1, 1,
0.875657, 0.6177666, -0.02620076, 1, 1, 1, 1, 1,
0.8756886, -1.238093, 2.912614, 1, 1, 1, 1, 1,
0.8760663, -0.3462561, 1.723783, 1, 1, 1, 1, 1,
0.8812494, -0.1270132, 0.8544285, 1, 1, 1, 1, 1,
0.8839979, -1.4996, 3.466676, 0, 0, 1, 1, 1,
0.886192, -1.166234, 2.057983, 1, 0, 0, 1, 1,
0.8900452, 0.3057866, 0.2763879, 1, 0, 0, 1, 1,
0.904875, 0.7077397, -0.1554401, 1, 0, 0, 1, 1,
0.9091392, -0.3607593, 3.16206, 1, 0, 0, 1, 1,
0.9115816, 0.3620691, 1.44391, 1, 0, 0, 1, 1,
0.9130561, 0.8357522, 1.787554, 0, 0, 0, 1, 1,
0.9133423, -0.04315875, 2.319679, 0, 0, 0, 1, 1,
0.9198932, -1.269637, 3.242005, 0, 0, 0, 1, 1,
0.9223012, -0.04676675, 0.7882142, 0, 0, 0, 1, 1,
0.9230589, -1.409923, 2.515857, 0, 0, 0, 1, 1,
0.926298, 0.06129842, 3.53481, 0, 0, 0, 1, 1,
0.9306731, 1.328678, 3.405752, 0, 0, 0, 1, 1,
0.9338644, 0.2649952, -0.3110507, 1, 1, 1, 1, 1,
0.9349855, 1.270625, -0.9637846, 1, 1, 1, 1, 1,
0.9358414, -1.232072, 1.149263, 1, 1, 1, 1, 1,
0.9484672, 0.1613058, 1.95992, 1, 1, 1, 1, 1,
0.9485648, 0.390505, 2.516389, 1, 1, 1, 1, 1,
0.948957, -0.5505145, 2.760161, 1, 1, 1, 1, 1,
0.9503611, -0.4853013, 2.512275, 1, 1, 1, 1, 1,
0.958517, -1.173797, 2.542039, 1, 1, 1, 1, 1,
0.9596735, -0.5638607, 2.389993, 1, 1, 1, 1, 1,
0.959812, 0.1273296, 2.485451, 1, 1, 1, 1, 1,
0.961217, -0.02561743, 2.890841, 1, 1, 1, 1, 1,
0.9617525, 0.948897, 1.819604, 1, 1, 1, 1, 1,
0.9642119, -0.4814688, 3.485381, 1, 1, 1, 1, 1,
0.9722809, 1.343828, 0.2593947, 1, 1, 1, 1, 1,
0.9818923, 1.400157, 1.118783, 1, 1, 1, 1, 1,
0.9832007, -1.081472, 2.225687, 0, 0, 1, 1, 1,
0.9840832, -0.4915264, 2.573273, 1, 0, 0, 1, 1,
0.9882368, 0.0912066, 2.445032, 1, 0, 0, 1, 1,
0.9892184, -0.3469059, 2.517636, 1, 0, 0, 1, 1,
0.9895914, -0.1769745, 1.326904, 1, 0, 0, 1, 1,
0.991402, -0.7620014, 1.59536, 1, 0, 0, 1, 1,
0.9929107, 0.07826681, 1.669337, 0, 0, 0, 1, 1,
0.9980658, -0.5091978, 1.082784, 0, 0, 0, 1, 1,
0.9997799, 0.919937, 0.6835788, 0, 0, 0, 1, 1,
1.008706, 0.2318527, 1.172536, 0, 0, 0, 1, 1,
1.011115, -0.6784938, 1.697438, 0, 0, 0, 1, 1,
1.012203, 0.9688237, 2.163877, 0, 0, 0, 1, 1,
1.012475, 0.4094432, 2.857308, 0, 0, 0, 1, 1,
1.015559, 1.233846, 0.7475843, 1, 1, 1, 1, 1,
1.021722, -0.3713845, 2.242383, 1, 1, 1, 1, 1,
1.027139, 0.703773, -0.6968484, 1, 1, 1, 1, 1,
1.028277, -0.4422427, 2.48222, 1, 1, 1, 1, 1,
1.030327, -1.604271, 1.767106, 1, 1, 1, 1, 1,
1.033569, -2.866185, 2.294687, 1, 1, 1, 1, 1,
1.040693, -0.5385229, 0.4028387, 1, 1, 1, 1, 1,
1.042701, 0.7021357, 0.6155905, 1, 1, 1, 1, 1,
1.044729, -1.001093, 1.713627, 1, 1, 1, 1, 1,
1.04727, 0.9893503, 0.974612, 1, 1, 1, 1, 1,
1.048537, -0.6294693, 2.277105, 1, 1, 1, 1, 1,
1.054293, 0.03465788, -0.4027227, 1, 1, 1, 1, 1,
1.054359, -0.6621224, 1.496879, 1, 1, 1, 1, 1,
1.05716, -0.8735255, 2.471162, 1, 1, 1, 1, 1,
1.059963, -0.2762769, 3.265629, 1, 1, 1, 1, 1,
1.072931, -2.182158, 2.448802, 0, 0, 1, 1, 1,
1.079053, 0.2252925, 2.348876, 1, 0, 0, 1, 1,
1.082317, -0.6343681, 2.089664, 1, 0, 0, 1, 1,
1.085313, -0.8808503, 1.714935, 1, 0, 0, 1, 1,
1.090482, 0.2991412, 0.8462682, 1, 0, 0, 1, 1,
1.090519, -1.183392, 2.280394, 1, 0, 0, 1, 1,
1.091012, 0.7384213, -0.2607336, 0, 0, 0, 1, 1,
1.093204, -0.7199241, 3.402388, 0, 0, 0, 1, 1,
1.099366, 1.268739, 1.243837, 0, 0, 0, 1, 1,
1.099519, 1.746968, -0.5402591, 0, 0, 0, 1, 1,
1.10275, -1.523395, 0.2409391, 0, 0, 0, 1, 1,
1.105224, -1.578482, 2.73177, 0, 0, 0, 1, 1,
1.106995, -0.1030242, 3.027063, 0, 0, 0, 1, 1,
1.10855, 1.248037, 1.277732, 1, 1, 1, 1, 1,
1.114295, 0.6605716, 1.113324, 1, 1, 1, 1, 1,
1.126119, -0.7573172, 2.739537, 1, 1, 1, 1, 1,
1.126406, -0.8110004, 2.612811, 1, 1, 1, 1, 1,
1.132801, 0.553994, 1.87139, 1, 1, 1, 1, 1,
1.138088, -0.9256201, 2.963969, 1, 1, 1, 1, 1,
1.143111, 0.8332555, 0.6860008, 1, 1, 1, 1, 1,
1.143203, -0.1884228, 2.523189, 1, 1, 1, 1, 1,
1.143489, -0.1874396, 0.8205588, 1, 1, 1, 1, 1,
1.151049, -0.2742402, 1.043086, 1, 1, 1, 1, 1,
1.152977, 0.2145002, 2.418573, 1, 1, 1, 1, 1,
1.157054, 0.6018121, 0.8105422, 1, 1, 1, 1, 1,
1.158513, 1.082677, 0.2603506, 1, 1, 1, 1, 1,
1.170385, -1.302256, 2.043205, 1, 1, 1, 1, 1,
1.17298, -0.4702453, 1.323123, 1, 1, 1, 1, 1,
1.173267, -1.1093, 3.963251, 0, 0, 1, 1, 1,
1.182438, -2.133677, 1.27422, 1, 0, 0, 1, 1,
1.184285, -0.8305987, 2.673108, 1, 0, 0, 1, 1,
1.186515, -0.08793063, 0.8195236, 1, 0, 0, 1, 1,
1.187884, 0.6058125, 0.5947328, 1, 0, 0, 1, 1,
1.189465, -0.6895849, 1.757441, 1, 0, 0, 1, 1,
1.194081, 0.8313499, 0.09909669, 0, 0, 0, 1, 1,
1.198861, -0.5476079, 0.7477359, 0, 0, 0, 1, 1,
1.201234, -0.4750741, 3.109748, 0, 0, 0, 1, 1,
1.202768, 0.3074679, 0.9739627, 0, 0, 0, 1, 1,
1.214278, -0.8809709, 1.414047, 0, 0, 0, 1, 1,
1.232662, -0.3458256, 2.605652, 0, 0, 0, 1, 1,
1.236567, 1.202323, 1.200775, 0, 0, 0, 1, 1,
1.237315, 1.141507, 1.507505, 1, 1, 1, 1, 1,
1.239904, -0.3881091, 3.109344, 1, 1, 1, 1, 1,
1.246991, -1.244434, 2.677358, 1, 1, 1, 1, 1,
1.255567, -0.1242804, 3.159954, 1, 1, 1, 1, 1,
1.262192, -1.362824, 2.094244, 1, 1, 1, 1, 1,
1.269107, 1.872357, -0.4807989, 1, 1, 1, 1, 1,
1.280121, -1.54144, 3.730155, 1, 1, 1, 1, 1,
1.281075, 0.1754147, 0.4446177, 1, 1, 1, 1, 1,
1.282459, 0.2572159, 2.128658, 1, 1, 1, 1, 1,
1.287713, 1.175457, 0.4003166, 1, 1, 1, 1, 1,
1.288046, 2.534087, 1.622983, 1, 1, 1, 1, 1,
1.28825, -0.117784, 1.423734, 1, 1, 1, 1, 1,
1.297258, -2.022555, 2.084692, 1, 1, 1, 1, 1,
1.298304, -0.05347408, 1.005916, 1, 1, 1, 1, 1,
1.299058, 1.022962, 1.818139, 1, 1, 1, 1, 1,
1.304604, 0.03204995, 4.773686, 0, 0, 1, 1, 1,
1.313248, -1.465171, 2.282973, 1, 0, 0, 1, 1,
1.317554, -1.252795, 3.250263, 1, 0, 0, 1, 1,
1.320443, -2.075206, 3.044764, 1, 0, 0, 1, 1,
1.326048, -1.023337, 2.916861, 1, 0, 0, 1, 1,
1.326299, 0.09691503, 2.187269, 1, 0, 0, 1, 1,
1.341441, 1.059044, 0.6653435, 0, 0, 0, 1, 1,
1.341502, 1.881737, 1.432385, 0, 0, 0, 1, 1,
1.343665, -0.6378105, 1.483738, 0, 0, 0, 1, 1,
1.346954, -0.01008116, 1.444819, 0, 0, 0, 1, 1,
1.350142, 0.9354798, 0.3823086, 0, 0, 0, 1, 1,
1.351062, -0.542962, 3.064172, 0, 0, 0, 1, 1,
1.354566, 0.7338673, 1.275686, 0, 0, 0, 1, 1,
1.364771, -0.9580309, 2.370016, 1, 1, 1, 1, 1,
1.365717, 1.318727, 0.6171376, 1, 1, 1, 1, 1,
1.380045, 1.731203, 2.45857, 1, 1, 1, 1, 1,
1.384765, 0.4961474, 1.679096, 1, 1, 1, 1, 1,
1.395737, -0.1577963, 3.244035, 1, 1, 1, 1, 1,
1.403514, 0.07086318, 2.113222, 1, 1, 1, 1, 1,
1.404964, 0.407149, 1.528308, 1, 1, 1, 1, 1,
1.420333, 1.078355, 1.599881, 1, 1, 1, 1, 1,
1.422067, 0.005564728, 1.792576, 1, 1, 1, 1, 1,
1.422535, -0.7627998, 2.608873, 1, 1, 1, 1, 1,
1.424854, -0.624869, 0.8117138, 1, 1, 1, 1, 1,
1.430381, 0.2356899, 1.679873, 1, 1, 1, 1, 1,
1.434611, 0.6468619, 1.811199, 1, 1, 1, 1, 1,
1.434911, 2.06427, 1.413643, 1, 1, 1, 1, 1,
1.461755, -0.9813634, -0.5635851, 1, 1, 1, 1, 1,
1.491585, 0.4589047, 0.9360602, 0, 0, 1, 1, 1,
1.492541, 0.6038374, 0.7534361, 1, 0, 0, 1, 1,
1.495286, 1.4814, 1.444335, 1, 0, 0, 1, 1,
1.501692, 1.772723, 1.544835, 1, 0, 0, 1, 1,
1.506672, -0.4508255, 2.193912, 1, 0, 0, 1, 1,
1.507468, -1.045889, 0.4041436, 1, 0, 0, 1, 1,
1.515437, 0.1821502, 1.922519, 0, 0, 0, 1, 1,
1.541845, 0.3530934, 2.287785, 0, 0, 0, 1, 1,
1.543202, 0.8404636, 0.7047952, 0, 0, 0, 1, 1,
1.553971, -0.3343928, 3.17147, 0, 0, 0, 1, 1,
1.56155, -0.9601879, 2.921123, 0, 0, 0, 1, 1,
1.582486, 1.334164, 1.959733, 0, 0, 0, 1, 1,
1.589511, 0.2854805, 1.020647, 0, 0, 0, 1, 1,
1.59352, 0.2023266, 1.612491, 1, 1, 1, 1, 1,
1.596524, 0.8188615, 1.342171, 1, 1, 1, 1, 1,
1.597202, 0.594767, 2.540078, 1, 1, 1, 1, 1,
1.600987, -0.6024198, 2.511829, 1, 1, 1, 1, 1,
1.603175, 1.13745, 0.1920619, 1, 1, 1, 1, 1,
1.606185, 0.1227667, 1.63033, 1, 1, 1, 1, 1,
1.618624, 0.8049716, 1.369767, 1, 1, 1, 1, 1,
1.629321, 0.2362286, 2.79391, 1, 1, 1, 1, 1,
1.631272, -0.1945102, 1.468795, 1, 1, 1, 1, 1,
1.637567, 1.418319, 1.214119, 1, 1, 1, 1, 1,
1.64005, -0.1545434, 1.483678, 1, 1, 1, 1, 1,
1.653314, -0.5002775, 2.008811, 1, 1, 1, 1, 1,
1.654743, 2.083237, -0.07070353, 1, 1, 1, 1, 1,
1.667495, -0.357599, 3.09158, 1, 1, 1, 1, 1,
1.677647, 1.679107, 0.8309592, 1, 1, 1, 1, 1,
1.683392, 0.6251035, 1.909206, 0, 0, 1, 1, 1,
1.685408, -0.3066905, 0.7579001, 1, 0, 0, 1, 1,
1.71611, -1.582455, 0.8987119, 1, 0, 0, 1, 1,
1.723339, -0.6857389, 0.6626538, 1, 0, 0, 1, 1,
1.761119, 0.0141841, 1.363188, 1, 0, 0, 1, 1,
1.7664, -0.01968779, -1.128355, 1, 0, 0, 1, 1,
1.803171, -0.09390028, 1.752695, 0, 0, 0, 1, 1,
1.806747, 0.4657402, 3.019095, 0, 0, 0, 1, 1,
1.813626, -1.901187, 4.127129, 0, 0, 0, 1, 1,
1.819667, -1.416625, 3.607804, 0, 0, 0, 1, 1,
1.832992, 0.4964792, 2.491179, 0, 0, 0, 1, 1,
1.841607, -2.085019, 1.584951, 0, 0, 0, 1, 1,
1.849293, -0.2688293, 3.498339, 0, 0, 0, 1, 1,
1.863559, 0.5065776, 1.982793, 1, 1, 1, 1, 1,
1.863766, -0.07895521, 2.197654, 1, 1, 1, 1, 1,
1.879906, 0.8061108, 2.257583, 1, 1, 1, 1, 1,
1.897638, 0.4012636, 1.167348, 1, 1, 1, 1, 1,
1.92534, 1.275079, 3.178584, 1, 1, 1, 1, 1,
1.960097, -2.570873, 4.056262, 1, 1, 1, 1, 1,
1.964259, -0.07790881, 2.146174, 1, 1, 1, 1, 1,
1.975315, 0.4320661, 2.488163, 1, 1, 1, 1, 1,
2.002589, 0.6306061, 1.044204, 1, 1, 1, 1, 1,
2.056027, -0.7766413, 2.128869, 1, 1, 1, 1, 1,
2.074209, -0.4622446, 2.295764, 1, 1, 1, 1, 1,
2.084356, 1.388291, 1.276094, 1, 1, 1, 1, 1,
2.123334, 0.9962691, 1.282699, 1, 1, 1, 1, 1,
2.141313, 0.0678397, 2.417336, 1, 1, 1, 1, 1,
2.148363, -0.06256577, 1.344724, 1, 1, 1, 1, 1,
2.18474, -0.6596827, 3.758835, 0, 0, 1, 1, 1,
2.200438, -0.8790627, 3.625387, 1, 0, 0, 1, 1,
2.204014, 1.86878, 0.5913907, 1, 0, 0, 1, 1,
2.265939, -1.083438, 2.153363, 1, 0, 0, 1, 1,
2.266531, -0.3056323, 1.700068, 1, 0, 0, 1, 1,
2.268972, -0.6818168, 2.948169, 1, 0, 0, 1, 1,
2.311801, 1.051483, -0.777514, 0, 0, 0, 1, 1,
2.394346, 0.6961999, 1.516039, 0, 0, 0, 1, 1,
2.430025, 0.4861846, 1.057879, 0, 0, 0, 1, 1,
2.437432, -1.698743, 1.398143, 0, 0, 0, 1, 1,
2.51101, 0.1581551, 0.8740041, 0, 0, 0, 1, 1,
2.58752, -0.6764976, 0.2956903, 0, 0, 0, 1, 1,
2.610662, -0.1286353, 3.509634, 0, 0, 0, 1, 1,
2.649573, 0.03696854, 1.146425, 1, 1, 1, 1, 1,
2.723783, 0.2296381, 3.144549, 1, 1, 1, 1, 1,
2.767876, 1.020049, 0.2302164, 1, 1, 1, 1, 1,
2.827591, -0.7660362, 2.260969, 1, 1, 1, 1, 1,
2.930116, 0.939216, 1.882224, 1, 1, 1, 1, 1,
2.951216, -1.093448, 1.157284, 1, 1, 1, 1, 1,
3.055072, -0.02961885, 1.708312, 1, 1, 1, 1, 1
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
var radius = 9.479215;
var distance = 33.29534;
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
mvMatrix.translate( 0.1147528, -0.1475091, 0.5397408 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.29534);
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
