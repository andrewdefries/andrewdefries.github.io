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
-2.889399, 0.3658928, -1.787866, 1, 0, 0, 1,
-2.76174, 0.9749742, -1.225441, 1, 0.007843138, 0, 1,
-2.7479, 0.1839326, -2.145751, 1, 0.01176471, 0, 1,
-2.680616, -0.1267248, -2.516093, 1, 0.01960784, 0, 1,
-2.651866, -0.4738582, -1.938211, 1, 0.02352941, 0, 1,
-2.553946, 0.9624159, -1.650969, 1, 0.03137255, 0, 1,
-2.535652, 1.501022, 0.02290097, 1, 0.03529412, 0, 1,
-2.517505, 0.280604, -1.328318, 1, 0.04313726, 0, 1,
-2.500498, -1.181251, -0.9261938, 1, 0.04705882, 0, 1,
-2.383481, -0.3242895, -1.484785, 1, 0.05490196, 0, 1,
-2.378613, -0.3233551, -2.014154, 1, 0.05882353, 0, 1,
-2.247936, 0.5505127, -2.105283, 1, 0.06666667, 0, 1,
-2.239283, -0.2846473, -2.481159, 1, 0.07058824, 0, 1,
-2.226246, 0.934296, -2.148686, 1, 0.07843138, 0, 1,
-2.183697, 1.250172, -1.418764, 1, 0.08235294, 0, 1,
-2.15539, 0.5763916, -1.311519, 1, 0.09019608, 0, 1,
-2.087481, 1.067641, -1.945332, 1, 0.09411765, 0, 1,
-2.07965, -1.636737, -1.188514, 1, 0.1019608, 0, 1,
-2.078939, -0.4230278, -1.734289, 1, 0.1098039, 0, 1,
-2.07846, -0.5131457, -0.7346544, 1, 0.1137255, 0, 1,
-2.053276, -1.273823, -2.60368, 1, 0.1215686, 0, 1,
-2.022816, -0.003202493, -1.711497, 1, 0.1254902, 0, 1,
-2.002588, -1.312432, -0.6429321, 1, 0.1333333, 0, 1,
-1.997249, 0.1590433, -1.971091, 1, 0.1372549, 0, 1,
-1.98273, 0.4750718, -2.698139, 1, 0.145098, 0, 1,
-1.966807, 1.03376, -2.076163, 1, 0.1490196, 0, 1,
-1.950807, 1.961707, -1.249409, 1, 0.1568628, 0, 1,
-1.909997, -1.285817, -1.418487, 1, 0.1607843, 0, 1,
-1.827597, 0.3244144, -0.7746476, 1, 0.1686275, 0, 1,
-1.816577, -0.5750895, -2.249171, 1, 0.172549, 0, 1,
-1.788192, -0.00478808, -1.062808, 1, 0.1803922, 0, 1,
-1.786813, -1.214271, -1.447105, 1, 0.1843137, 0, 1,
-1.729881, -0.01318504, -1.759869, 1, 0.1921569, 0, 1,
-1.725973, -0.009200279, 0.5873161, 1, 0.1960784, 0, 1,
-1.724017, -0.3401845, 0.3290907, 1, 0.2039216, 0, 1,
-1.713566, -0.6147376, -1.89831, 1, 0.2117647, 0, 1,
-1.700333, -1.397042, -2.120742, 1, 0.2156863, 0, 1,
-1.656717, 2.533722, -0.5478307, 1, 0.2235294, 0, 1,
-1.64868, 0.3270906, -1.630531, 1, 0.227451, 0, 1,
-1.638719, 0.4991644, -1.17883, 1, 0.2352941, 0, 1,
-1.634223, -0.609612, -2.507473, 1, 0.2392157, 0, 1,
-1.626494, -0.1150629, -0.4562864, 1, 0.2470588, 0, 1,
-1.62332, -0.6843005, 0.4201964, 1, 0.2509804, 0, 1,
-1.620362, 0.629474, -0.8761763, 1, 0.2588235, 0, 1,
-1.603027, 0.1614215, -1.147748, 1, 0.2627451, 0, 1,
-1.602687, -0.7081667, -1.498104, 1, 0.2705882, 0, 1,
-1.598339, -0.07591829, -1.093393, 1, 0.2745098, 0, 1,
-1.578698, 0.7471069, -1.343157, 1, 0.282353, 0, 1,
-1.56878, -0.8421593, -3.35375, 1, 0.2862745, 0, 1,
-1.56522, -0.7689912, -2.011067, 1, 0.2941177, 0, 1,
-1.541485, -1.187237, -2.970439, 1, 0.3019608, 0, 1,
-1.530826, -0.7545469, -3.396395, 1, 0.3058824, 0, 1,
-1.528628, 2.334995, -0.6463893, 1, 0.3137255, 0, 1,
-1.524611, 0.03733549, -1.267341, 1, 0.3176471, 0, 1,
-1.522073, 0.5473934, -1.635597, 1, 0.3254902, 0, 1,
-1.516529, -0.227448, -1.516708, 1, 0.3294118, 0, 1,
-1.511625, -0.9015296, -3.494107, 1, 0.3372549, 0, 1,
-1.508067, 0.8063954, -1.88555, 1, 0.3411765, 0, 1,
-1.504342, 1.189745, -0.2600278, 1, 0.3490196, 0, 1,
-1.499235, -0.9076893, -2.124022, 1, 0.3529412, 0, 1,
-1.497717, 0.2857221, -1.33113, 1, 0.3607843, 0, 1,
-1.49164, -0.2161983, -1.17414, 1, 0.3647059, 0, 1,
-1.490416, 0.2799827, -1.308819, 1, 0.372549, 0, 1,
-1.486325, -0.9180776, -2.921335, 1, 0.3764706, 0, 1,
-1.46966, -1.162973, -0.6787344, 1, 0.3843137, 0, 1,
-1.469633, -0.915101, -1.881635, 1, 0.3882353, 0, 1,
-1.467692, 0.4135022, -2.473603, 1, 0.3960784, 0, 1,
-1.466953, 0.7233653, -2.274647, 1, 0.4039216, 0, 1,
-1.458628, 0.5334557, -0.4310712, 1, 0.4078431, 0, 1,
-1.455032, -1.22474, -3.324709, 1, 0.4156863, 0, 1,
-1.453527, 0.2988653, -1.357656, 1, 0.4196078, 0, 1,
-1.451085, 0.5195525, -2.205139, 1, 0.427451, 0, 1,
-1.417849, 0.7250428, -0.5350945, 1, 0.4313726, 0, 1,
-1.412071, -2.615954, -1.972182, 1, 0.4392157, 0, 1,
-1.396719, -2.524182, -0.1854761, 1, 0.4431373, 0, 1,
-1.387102, -0.2594692, -2.096384, 1, 0.4509804, 0, 1,
-1.371735, 1.051292, 0.1133323, 1, 0.454902, 0, 1,
-1.366697, -0.9748018, -2.599007, 1, 0.4627451, 0, 1,
-1.365015, 0.1131016, -1.3459, 1, 0.4666667, 0, 1,
-1.363152, -1.740303, -0.9434525, 1, 0.4745098, 0, 1,
-1.360462, -0.4897197, 0.9041462, 1, 0.4784314, 0, 1,
-1.360433, -0.3888431, -1.799664, 1, 0.4862745, 0, 1,
-1.356227, 0.895398, 0.6070294, 1, 0.4901961, 0, 1,
-1.353422, -0.5994297, -3.407104, 1, 0.4980392, 0, 1,
-1.323041, 0.3192399, -3.520654, 1, 0.5058824, 0, 1,
-1.319121, 0.008070226, -1.224074, 1, 0.509804, 0, 1,
-1.302801, 1.439043, 0.165232, 1, 0.5176471, 0, 1,
-1.289616, -0.228195, -0.3258504, 1, 0.5215687, 0, 1,
-1.278605, -0.6692725, -1.563123, 1, 0.5294118, 0, 1,
-1.278097, 0.282304, -4.062313, 1, 0.5333334, 0, 1,
-1.267293, -0.6337199, -0.7676358, 1, 0.5411765, 0, 1,
-1.26002, 0.7617207, -0.739029, 1, 0.5450981, 0, 1,
-1.256813, 0.3478117, -0.9499468, 1, 0.5529412, 0, 1,
-1.256278, 1.536877, -0.4208953, 1, 0.5568628, 0, 1,
-1.248244, -0.08769678, -1.437499, 1, 0.5647059, 0, 1,
-1.244093, 1.12391, -0.7713472, 1, 0.5686275, 0, 1,
-1.243854, 1.988558, -0.4663774, 1, 0.5764706, 0, 1,
-1.243483, -0.9344603, -1.122954, 1, 0.5803922, 0, 1,
-1.235441, 0.4615781, -3.078996, 1, 0.5882353, 0, 1,
-1.232063, 1.184727, -0.7045463, 1, 0.5921569, 0, 1,
-1.229428, -0.7214174, -0.3061667, 1, 0.6, 0, 1,
-1.224771, -0.02998511, -1.052384, 1, 0.6078432, 0, 1,
-1.222428, -0.02918664, -3.203864, 1, 0.6117647, 0, 1,
-1.209632, 0.5415856, -0.7779403, 1, 0.6196079, 0, 1,
-1.208098, -1.515462, -0.7211508, 1, 0.6235294, 0, 1,
-1.204426, -0.8082652, -2.224573, 1, 0.6313726, 0, 1,
-1.20253, -2.778347, -3.653896, 1, 0.6352941, 0, 1,
-1.194074, -0.8020449, -3.000454, 1, 0.6431373, 0, 1,
-1.190592, -0.0455762, -2.338644, 1, 0.6470588, 0, 1,
-1.190163, 0.6708264, -1.459893, 1, 0.654902, 0, 1,
-1.184366, -0.3071373, -1.218088, 1, 0.6588235, 0, 1,
-1.176995, -1.583961, -0.7788515, 1, 0.6666667, 0, 1,
-1.173085, 0.4563168, 0.5551728, 1, 0.6705883, 0, 1,
-1.164394, -0.07122068, -1.701308, 1, 0.6784314, 0, 1,
-1.144069, 0.813326, -0.5961217, 1, 0.682353, 0, 1,
-1.143969, 0.858102, -0.5784282, 1, 0.6901961, 0, 1,
-1.138477, 2.022432, -1.35436, 1, 0.6941177, 0, 1,
-1.135918, -0.1047241, -1.319378, 1, 0.7019608, 0, 1,
-1.132802, 0.3967275, -2.466758, 1, 0.7098039, 0, 1,
-1.122656, 0.2135216, -2.233034, 1, 0.7137255, 0, 1,
-1.119704, -1.753066, -1.037452, 1, 0.7215686, 0, 1,
-1.118206, -1.800296, -2.39481, 1, 0.7254902, 0, 1,
-1.115413, 0.7307235, -0.6723055, 1, 0.7333333, 0, 1,
-1.115169, -0.5364276, -2.490126, 1, 0.7372549, 0, 1,
-1.10715, 0.8440087, 1.094752, 1, 0.7450981, 0, 1,
-1.105848, -1.979907, -4.440401, 1, 0.7490196, 0, 1,
-1.10397, 0.1302821, -1.304322, 1, 0.7568628, 0, 1,
-1.103401, -0.183952, -1.428014, 1, 0.7607843, 0, 1,
-1.10042, -0.2389735, -0.6347375, 1, 0.7686275, 0, 1,
-1.089523, -0.339392, -2.338726, 1, 0.772549, 0, 1,
-1.084927, 0.2036595, -1.483784, 1, 0.7803922, 0, 1,
-1.079516, 0.5980526, -2.038415, 1, 0.7843137, 0, 1,
-1.071758, -2.813759, -3.50529, 1, 0.7921569, 0, 1,
-1.070386, 0.6087946, -1.017689, 1, 0.7960784, 0, 1,
-1.065499, 0.6437503, -1.904858, 1, 0.8039216, 0, 1,
-1.05129, 0.2239551, -2.218105, 1, 0.8117647, 0, 1,
-1.048394, -1.412217, -2.804737, 1, 0.8156863, 0, 1,
-1.047915, 1.230119, -2.139726, 1, 0.8235294, 0, 1,
-1.044236, 1.380171, 0.2742267, 1, 0.827451, 0, 1,
-1.031501, -1.595853, -3.83667, 1, 0.8352941, 0, 1,
-1.028209, -0.1417535, -4.601363, 1, 0.8392157, 0, 1,
-1.022436, -0.1366447, -0.4799555, 1, 0.8470588, 0, 1,
-1.018109, 2.253057, 0.7534405, 1, 0.8509804, 0, 1,
-1.015658, 2.373438, -1.107293, 1, 0.8588235, 0, 1,
-1.013231, 1.806175, -0.008009478, 1, 0.8627451, 0, 1,
-1.006462, 0.6788087, -0.6424652, 1, 0.8705882, 0, 1,
-1.000218, -0.2045862, -1.38247, 1, 0.8745098, 0, 1,
-1.000189, 1.425406, -0.3782459, 1, 0.8823529, 0, 1,
-0.9953777, 1.011407, 1.044435, 1, 0.8862745, 0, 1,
-0.9942405, 0.5425598, -1.692464, 1, 0.8941177, 0, 1,
-0.9865778, 1.93063, -1.487125, 1, 0.8980392, 0, 1,
-0.9825408, 0.6253672, -0.04750513, 1, 0.9058824, 0, 1,
-0.9732382, -1.374392, -0.2482475, 1, 0.9137255, 0, 1,
-0.9727647, 0.05079914, 0.06720699, 1, 0.9176471, 0, 1,
-0.9687525, -0.5266637, -2.374151, 1, 0.9254902, 0, 1,
-0.9634922, 0.8318314, -0.6915056, 1, 0.9294118, 0, 1,
-0.9597213, 0.7535897, -0.06144867, 1, 0.9372549, 0, 1,
-0.957109, 0.334037, -1.52372, 1, 0.9411765, 0, 1,
-0.9549735, 0.554948, -2.296772, 1, 0.9490196, 0, 1,
-0.9526335, -0.7698823, -3.178791, 1, 0.9529412, 0, 1,
-0.946562, 1.203787, 0.1788612, 1, 0.9607843, 0, 1,
-0.9434208, 3.075193, 0.4317444, 1, 0.9647059, 0, 1,
-0.9426784, -0.3415409, -1.941935, 1, 0.972549, 0, 1,
-0.9332271, -0.4342894, -1.241097, 1, 0.9764706, 0, 1,
-0.9303318, 0.6676334, -0.5197732, 1, 0.9843137, 0, 1,
-0.9258883, 1.022028, -1.063389, 1, 0.9882353, 0, 1,
-0.9256541, 0.8578734, -0.7790065, 1, 0.9960784, 0, 1,
-0.924902, 0.4323235, 1.327225, 0.9960784, 1, 0, 1,
-0.9231952, 0.6278011, -2.782186, 0.9921569, 1, 0, 1,
-0.9209012, -0.2194537, -1.052713, 0.9843137, 1, 0, 1,
-0.9157947, -0.02331296, -1.130118, 0.9803922, 1, 0, 1,
-0.9131278, -0.1442996, -0.8573142, 0.972549, 1, 0, 1,
-0.8943906, -0.9411015, -3.461471, 0.9686275, 1, 0, 1,
-0.8876038, -0.723605, -2.530774, 0.9607843, 1, 0, 1,
-0.886021, 0.7061453, -3.035674, 0.9568627, 1, 0, 1,
-0.885853, 0.9151765, -1.544631, 0.9490196, 1, 0, 1,
-0.8775689, -0.005929388, -1.786063, 0.945098, 1, 0, 1,
-0.872822, -0.9395251, -2.264689, 0.9372549, 1, 0, 1,
-0.8705546, -0.005861054, -2.670764, 0.9333333, 1, 0, 1,
-0.8697233, -0.5292817, -1.971831, 0.9254902, 1, 0, 1,
-0.8693517, -2.054427, -3.551995, 0.9215686, 1, 0, 1,
-0.8673934, -1.284751, -3.739345, 0.9137255, 1, 0, 1,
-0.8672511, -0.3606766, -3.090562, 0.9098039, 1, 0, 1,
-0.8672403, 1.238464, -0.8723992, 0.9019608, 1, 0, 1,
-0.8663942, 0.3538165, -0.4924649, 0.8941177, 1, 0, 1,
-0.8656507, 0.1088386, -3.087814, 0.8901961, 1, 0, 1,
-0.8619378, -0.01208413, -1.019985, 0.8823529, 1, 0, 1,
-0.8563249, -0.425871, -1.360854, 0.8784314, 1, 0, 1,
-0.8553567, -2.2804, -1.793297, 0.8705882, 1, 0, 1,
-0.8552063, 0.6140587, -1.216663, 0.8666667, 1, 0, 1,
-0.8449262, -0.3995092, -2.707365, 0.8588235, 1, 0, 1,
-0.8427685, -1.337322, -2.55757, 0.854902, 1, 0, 1,
-0.839475, 0.4906993, 0.6367713, 0.8470588, 1, 0, 1,
-0.8383296, -0.6527627, -3.08664, 0.8431373, 1, 0, 1,
-0.8316675, 0.7286626, -0.3602513, 0.8352941, 1, 0, 1,
-0.8308417, -0.707637, -1.755691, 0.8313726, 1, 0, 1,
-0.8297803, 1.482439, 0.6150887, 0.8235294, 1, 0, 1,
-0.8292972, -0.705736, -0.9904718, 0.8196079, 1, 0, 1,
-0.824599, 0.3833306, -0.9057221, 0.8117647, 1, 0, 1,
-0.8196375, -0.6120183, -4.757617, 0.8078431, 1, 0, 1,
-0.8189798, -0.6445525, -2.868318, 0.8, 1, 0, 1,
-0.8187304, 0.8787651, -1.268314, 0.7921569, 1, 0, 1,
-0.8180503, -0.04398082, -2.34923, 0.7882353, 1, 0, 1,
-0.8178493, 0.440554, -0.1353635, 0.7803922, 1, 0, 1,
-0.8176082, 2.144572, 1.454583, 0.7764706, 1, 0, 1,
-0.8147814, 1.370697, 0.5401568, 0.7686275, 1, 0, 1,
-0.8091709, 0.7605639, -2.141886, 0.7647059, 1, 0, 1,
-0.8069334, -0.04547098, -1.619602, 0.7568628, 1, 0, 1,
-0.8035114, -0.4993724, -1.894105, 0.7529412, 1, 0, 1,
-0.8003922, 0.3596576, -2.462787, 0.7450981, 1, 0, 1,
-0.8000197, 0.8243311, -1.165584, 0.7411765, 1, 0, 1,
-0.7829106, -1.20968, -1.934739, 0.7333333, 1, 0, 1,
-0.7808914, 1.653259, 0.04413622, 0.7294118, 1, 0, 1,
-0.7767031, 0.04704042, -0.2839813, 0.7215686, 1, 0, 1,
-0.776361, -0.2129501, -1.556113, 0.7176471, 1, 0, 1,
-0.776188, 0.09791234, -0.0258008, 0.7098039, 1, 0, 1,
-0.7615105, -0.9269859, -2.531801, 0.7058824, 1, 0, 1,
-0.761265, 0.1351829, -1.412923, 0.6980392, 1, 0, 1,
-0.7585682, -0.1503417, -3.477295, 0.6901961, 1, 0, 1,
-0.755046, -2.234019, -3.436183, 0.6862745, 1, 0, 1,
-0.7550092, 2.022243, 1.171667, 0.6784314, 1, 0, 1,
-0.7513092, -0.1237562, -1.908163, 0.6745098, 1, 0, 1,
-0.7506726, -0.1318468, -2.594561, 0.6666667, 1, 0, 1,
-0.7504539, -0.3891782, -2.467089, 0.6627451, 1, 0, 1,
-0.7498818, -1.947176, -2.440737, 0.654902, 1, 0, 1,
-0.7471219, 0.5743616, -1.66276, 0.6509804, 1, 0, 1,
-0.746337, -0.1001609, -1.989504, 0.6431373, 1, 0, 1,
-0.7457395, -1.033206, -3.593231, 0.6392157, 1, 0, 1,
-0.74254, 0.4455931, -1.771813, 0.6313726, 1, 0, 1,
-0.7379658, 0.4688349, -0.239192, 0.627451, 1, 0, 1,
-0.7361778, 0.6983129, 0.8428101, 0.6196079, 1, 0, 1,
-0.7348751, -0.3983434, -2.681509, 0.6156863, 1, 0, 1,
-0.7177985, -0.1912142, -0.6063972, 0.6078432, 1, 0, 1,
-0.7174539, 0.2606906, -1.552463, 0.6039216, 1, 0, 1,
-0.7155985, -1.07098, -2.412317, 0.5960785, 1, 0, 1,
-0.7117634, 0.441379, -1.276543, 0.5882353, 1, 0, 1,
-0.6970583, 0.08448692, -0.2170423, 0.5843138, 1, 0, 1,
-0.696216, -0.04113967, -1.461092, 0.5764706, 1, 0, 1,
-0.6937909, 1.259255, -1.550641, 0.572549, 1, 0, 1,
-0.6911553, 0.3312308, -1.719923, 0.5647059, 1, 0, 1,
-0.6902471, 2.132857, 0.5347578, 0.5607843, 1, 0, 1,
-0.6866755, -0.1720124, -2.399894, 0.5529412, 1, 0, 1,
-0.6826292, 0.4888206, -1.46898, 0.5490196, 1, 0, 1,
-0.6815901, 0.7626147, -1.346598, 0.5411765, 1, 0, 1,
-0.6744168, 0.6528749, 0.1663501, 0.5372549, 1, 0, 1,
-0.6741834, -1.007853, -2.144249, 0.5294118, 1, 0, 1,
-0.669542, 2.11844, 0.4794117, 0.5254902, 1, 0, 1,
-0.6671821, 0.4186155, -0.6188734, 0.5176471, 1, 0, 1,
-0.6653638, 1.163422, 0.4254644, 0.5137255, 1, 0, 1,
-0.6627522, -0.4847403, -2.973675, 0.5058824, 1, 0, 1,
-0.6599571, -1.273941, -3.157419, 0.5019608, 1, 0, 1,
-0.6594818, -0.5443632, -1.550091, 0.4941176, 1, 0, 1,
-0.6557945, 1.032411, -1.668157, 0.4862745, 1, 0, 1,
-0.655525, -1.395278, -1.271679, 0.4823529, 1, 0, 1,
-0.6544589, 2.186271, -0.1238947, 0.4745098, 1, 0, 1,
-0.6505743, -1.151929, -1.702367, 0.4705882, 1, 0, 1,
-0.6489322, -0.7703981, -2.637602, 0.4627451, 1, 0, 1,
-0.6482073, 1.104939, -0.7853667, 0.4588235, 1, 0, 1,
-0.646304, 0.2570479, 0.5959674, 0.4509804, 1, 0, 1,
-0.6435039, 0.7368689, 0.4855593, 0.4470588, 1, 0, 1,
-0.6343986, -0.4610755, -1.687993, 0.4392157, 1, 0, 1,
-0.6311366, 0.4645585, -1.620508, 0.4352941, 1, 0, 1,
-0.6301187, 1.02029, -2.273115, 0.427451, 1, 0, 1,
-0.6293462, 0.3954372, -0.7325144, 0.4235294, 1, 0, 1,
-0.6257282, -0.6253447, -0.9829742, 0.4156863, 1, 0, 1,
-0.6197819, -1.091165, -3.191065, 0.4117647, 1, 0, 1,
-0.6190332, 0.5276727, -0.8178195, 0.4039216, 1, 0, 1,
-0.617774, 0.242958, -0.3659244, 0.3960784, 1, 0, 1,
-0.6055591, 0.3663138, -0.4149969, 0.3921569, 1, 0, 1,
-0.6043782, 0.2508686, -1.258521, 0.3843137, 1, 0, 1,
-0.6023347, -0.7359786, -3.225116, 0.3803922, 1, 0, 1,
-0.6018123, 0.629572, 1.017343, 0.372549, 1, 0, 1,
-0.6015342, -0.03437359, -2.79449, 0.3686275, 1, 0, 1,
-0.5994422, 0.2278595, -0.4015651, 0.3607843, 1, 0, 1,
-0.5971248, 1.100064, -0.5019471, 0.3568628, 1, 0, 1,
-0.588741, 0.08257323, -3.238028, 0.3490196, 1, 0, 1,
-0.5768046, 1.871116, -0.137527, 0.345098, 1, 0, 1,
-0.5763038, -0.2454223, -1.044445, 0.3372549, 1, 0, 1,
-0.5761621, 0.8273737, -0.5524971, 0.3333333, 1, 0, 1,
-0.5753061, -0.8719743, -2.39826, 0.3254902, 1, 0, 1,
-0.5744488, 0.5647087, -1.0427, 0.3215686, 1, 0, 1,
-0.5702075, -1.564706, -1.994506, 0.3137255, 1, 0, 1,
-0.5651931, 0.8069087, -1.515666, 0.3098039, 1, 0, 1,
-0.5642288, 0.9100053, -0.9114997, 0.3019608, 1, 0, 1,
-0.5617341, -0.235053, -1.330368, 0.2941177, 1, 0, 1,
-0.559148, 0.4664267, -1.24515, 0.2901961, 1, 0, 1,
-0.5536887, -0.187731, 0.2044591, 0.282353, 1, 0, 1,
-0.5469998, 0.7723058, -0.6330909, 0.2784314, 1, 0, 1,
-0.5430928, -0.636437, -1.76759, 0.2705882, 1, 0, 1,
-0.54183, -0.396121, -1.303792, 0.2666667, 1, 0, 1,
-0.5374672, 0.9605649, -0.2925002, 0.2588235, 1, 0, 1,
-0.5366213, -0.5140968, -3.130309, 0.254902, 1, 0, 1,
-0.5335371, -1.225799, -2.840744, 0.2470588, 1, 0, 1,
-0.5333875, 0.2532651, -0.3970296, 0.2431373, 1, 0, 1,
-0.5295822, 1.279543, -1.009623, 0.2352941, 1, 0, 1,
-0.5277546, 0.6006604, 0.8782986, 0.2313726, 1, 0, 1,
-0.5183668, -1.744744, -3.484454, 0.2235294, 1, 0, 1,
-0.5142818, 0.3197696, -2.047337, 0.2196078, 1, 0, 1,
-0.5135741, 1.864225, -1.421745, 0.2117647, 1, 0, 1,
-0.507433, 1.202186, -0.9842651, 0.2078431, 1, 0, 1,
-0.5029915, -0.5928382, -1.952599, 0.2, 1, 0, 1,
-0.4985486, 0.3234731, -0.306848, 0.1921569, 1, 0, 1,
-0.4964692, -1.24045, -2.289343, 0.1882353, 1, 0, 1,
-0.4962553, 2.119367, 0.002890775, 0.1803922, 1, 0, 1,
-0.4927555, -0.7991107, -2.873137, 0.1764706, 1, 0, 1,
-0.4905617, -1.158747, -3.198401, 0.1686275, 1, 0, 1,
-0.4905095, 0.2435132, 0.5666823, 0.1647059, 1, 0, 1,
-0.4901699, 0.6459489, -1.008434, 0.1568628, 1, 0, 1,
-0.48942, 0.3173505, -0.7272009, 0.1529412, 1, 0, 1,
-0.488856, 0.4407626, -2.289522, 0.145098, 1, 0, 1,
-0.4869708, -0.2348484, -2.958793, 0.1411765, 1, 0, 1,
-0.4829695, -0.3517248, -1.935613, 0.1333333, 1, 0, 1,
-0.4809884, -1.061698, -3.818848, 0.1294118, 1, 0, 1,
-0.4761272, 0.8385333, -0.4705956, 0.1215686, 1, 0, 1,
-0.4711378, 0.3436972, 0.3276769, 0.1176471, 1, 0, 1,
-0.4704595, 0.168943, 0.9320127, 0.1098039, 1, 0, 1,
-0.4685181, -1.323638, -4.03153, 0.1058824, 1, 0, 1,
-0.4680778, -0.03397054, -1.63044, 0.09803922, 1, 0, 1,
-0.4658343, -1.288517, -3.085236, 0.09019608, 1, 0, 1,
-0.4615459, -0.009947517, -2.151254, 0.08627451, 1, 0, 1,
-0.4607765, -1.670442, -3.627796, 0.07843138, 1, 0, 1,
-0.4606635, 0.8324038, -0.2604736, 0.07450981, 1, 0, 1,
-0.4601648, 0.683762, -0.7465832, 0.06666667, 1, 0, 1,
-0.4579566, -0.6560738, -2.060925, 0.0627451, 1, 0, 1,
-0.4578718, 1.323661, -0.1823851, 0.05490196, 1, 0, 1,
-0.4562872, 0.8297085, -1.834153, 0.05098039, 1, 0, 1,
-0.4458588, 0.103234, -0.3052628, 0.04313726, 1, 0, 1,
-0.4455648, -0.5969586, -0.5294778, 0.03921569, 1, 0, 1,
-0.4442388, -2.168931, -4.361874, 0.03137255, 1, 0, 1,
-0.4436373, 0.673013, -1.839293, 0.02745098, 1, 0, 1,
-0.4430646, -0.2276168, -1.004852, 0.01960784, 1, 0, 1,
-0.4425719, 0.6164227, -0.7870262, 0.01568628, 1, 0, 1,
-0.4400189, -1.028607, -2.668327, 0.007843138, 1, 0, 1,
-0.434755, 1.760875, -0.7515389, 0.003921569, 1, 0, 1,
-0.4301135, 0.4920426, -1.399009, 0, 1, 0.003921569, 1,
-0.4294999, 1.247139, -0.7508989, 0, 1, 0.01176471, 1,
-0.4294173, -1.784239, -4.786314, 0, 1, 0.01568628, 1,
-0.428379, 0.6394673, 1.347219, 0, 1, 0.02352941, 1,
-0.4248903, -0.5305483, -2.368805, 0, 1, 0.02745098, 1,
-0.4244654, -0.8145073, -2.690934, 0, 1, 0.03529412, 1,
-0.4179337, 0.5388664, -0.8492752, 0, 1, 0.03921569, 1,
-0.4119245, -1.814702, -1.910905, 0, 1, 0.04705882, 1,
-0.4114222, 0.9990724, 0.7029417, 0, 1, 0.05098039, 1,
-0.4080816, -0.8164797, -2.300017, 0, 1, 0.05882353, 1,
-0.4064766, -1.225966, -1.935754, 0, 1, 0.0627451, 1,
-0.4061076, -0.5851747, -1.838155, 0, 1, 0.07058824, 1,
-0.4060421, -1.358696, -3.653919, 0, 1, 0.07450981, 1,
-0.4053724, 0.5876592, 0.3302133, 0, 1, 0.08235294, 1,
-0.4045989, 0.6374565, -1.90064, 0, 1, 0.08627451, 1,
-0.4033073, 0.2375567, 0.3498003, 0, 1, 0.09411765, 1,
-0.4032979, -0.3023117, -4.183405, 0, 1, 0.1019608, 1,
-0.4026837, 1.037931, -0.6437486, 0, 1, 0.1058824, 1,
-0.4003051, -0.6156471, -2.476213, 0, 1, 0.1137255, 1,
-0.3988416, -0.001841994, -2.706579, 0, 1, 0.1176471, 1,
-0.3947699, -0.6872705, -2.404983, 0, 1, 0.1254902, 1,
-0.3945817, 0.7439138, -1.161876, 0, 1, 0.1294118, 1,
-0.3935823, -0.5340492, -3.049265, 0, 1, 0.1372549, 1,
-0.3922896, 1.403329, 0.3602534, 0, 1, 0.1411765, 1,
-0.3867444, 0.06921503, -1.645626, 0, 1, 0.1490196, 1,
-0.3819946, -0.2263338, -3.538725, 0, 1, 0.1529412, 1,
-0.3819561, 0.88998, 0.5816439, 0, 1, 0.1607843, 1,
-0.3798603, 0.5499383, 0.3941002, 0, 1, 0.1647059, 1,
-0.3770243, 0.9578006, 1.350854, 0, 1, 0.172549, 1,
-0.373185, 0.2419074, -1.897175, 0, 1, 0.1764706, 1,
-0.3730722, -1.342562, -2.599066, 0, 1, 0.1843137, 1,
-0.3687568, 0.4822696, -0.09201596, 0, 1, 0.1882353, 1,
-0.3674523, -0.05397042, -2.07728, 0, 1, 0.1960784, 1,
-0.3662923, 0.8385814, -1.260743, 0, 1, 0.2039216, 1,
-0.3652304, 0.2411266, -2.233716, 0, 1, 0.2078431, 1,
-0.3582571, -0.1051866, -1.786613, 0, 1, 0.2156863, 1,
-0.3549906, -0.9822019, -3.639318, 0, 1, 0.2196078, 1,
-0.3549784, -1.431858, -2.908982, 0, 1, 0.227451, 1,
-0.3536987, 0.1760954, -1.793907, 0, 1, 0.2313726, 1,
-0.3533973, 0.5346995, -0.3247037, 0, 1, 0.2392157, 1,
-0.3518415, 0.2506703, -0.580868, 0, 1, 0.2431373, 1,
-0.3512227, 1.943292, -0.3700325, 0, 1, 0.2509804, 1,
-0.3507472, -0.3659044, -0.4812827, 0, 1, 0.254902, 1,
-0.3503726, -0.7359105, -4.52472, 0, 1, 0.2627451, 1,
-0.3490406, -0.1253512, -3.402179, 0, 1, 0.2666667, 1,
-0.3338847, 0.04503593, -1.485119, 0, 1, 0.2745098, 1,
-0.3336413, 0.1573051, -0.7741666, 0, 1, 0.2784314, 1,
-0.3326843, -0.08898981, -2.640863, 0, 1, 0.2862745, 1,
-0.3179965, 0.05156619, -2.197275, 0, 1, 0.2901961, 1,
-0.3084305, 0.3735937, -2.538974, 0, 1, 0.2980392, 1,
-0.3051285, -0.5621714, -0.5065678, 0, 1, 0.3058824, 1,
-0.3039883, 0.5982845, -0.4640009, 0, 1, 0.3098039, 1,
-0.3021694, -0.2865482, -1.031103, 0, 1, 0.3176471, 1,
-0.298252, -0.2504972, -1.74155, 0, 1, 0.3215686, 1,
-0.2948912, 0.4511975, 0.1989601, 0, 1, 0.3294118, 1,
-0.293398, -0.9629453, -2.620483, 0, 1, 0.3333333, 1,
-0.2693232, 1.819306, 0.8997706, 0, 1, 0.3411765, 1,
-0.2688077, 0.7198992, -1.054382, 0, 1, 0.345098, 1,
-0.268481, 1.335806, 0.9586053, 0, 1, 0.3529412, 1,
-0.2678984, 0.3614976, -1.842206, 0, 1, 0.3568628, 1,
-0.2674191, 0.7822602, -0.1909375, 0, 1, 0.3647059, 1,
-0.267153, -1.659534, -1.793215, 0, 1, 0.3686275, 1,
-0.2669812, -0.5065523, -2.612529, 0, 1, 0.3764706, 1,
-0.2602136, -1.106349, -3.927088, 0, 1, 0.3803922, 1,
-0.2527134, 0.2371379, -0.7680343, 0, 1, 0.3882353, 1,
-0.2503691, -0.05726381, -1.1719, 0, 1, 0.3921569, 1,
-0.2467985, -0.173275, -2.880016, 0, 1, 0.4, 1,
-0.2467821, 0.0007718729, -1.339098, 0, 1, 0.4078431, 1,
-0.2453593, 0.6683105, -0.6261019, 0, 1, 0.4117647, 1,
-0.2322659, -0.8017786, -3.211203, 0, 1, 0.4196078, 1,
-0.2317919, -0.9796298, -4.219186, 0, 1, 0.4235294, 1,
-0.2308528, -0.8276039, -3.621567, 0, 1, 0.4313726, 1,
-0.228875, 0.02812472, -2.555598, 0, 1, 0.4352941, 1,
-0.228441, 0.2842007, -2.354702, 0, 1, 0.4431373, 1,
-0.2268093, 0.8504379, -0.7766635, 0, 1, 0.4470588, 1,
-0.2261979, -0.2587897, -3.443264, 0, 1, 0.454902, 1,
-0.2261748, 0.8186694, -0.7481816, 0, 1, 0.4588235, 1,
-0.2233931, 0.9149076, 0.8705611, 0, 1, 0.4666667, 1,
-0.22152, 0.1403478, -0.7462872, 0, 1, 0.4705882, 1,
-0.2204283, 0.6564003, -1.32188, 0, 1, 0.4784314, 1,
-0.2196448, 0.4632464, 0.7893556, 0, 1, 0.4823529, 1,
-0.2176123, 0.4245073, 1.012719, 0, 1, 0.4901961, 1,
-0.21006, 0.7723323, 0.4159105, 0, 1, 0.4941176, 1,
-0.2072348, -0.5973106, -3.053908, 0, 1, 0.5019608, 1,
-0.2060633, -0.3088261, -3.977902, 0, 1, 0.509804, 1,
-0.2060464, 1.11218, 0.006273566, 0, 1, 0.5137255, 1,
-0.2022416, -0.7501942, -3.740668, 0, 1, 0.5215687, 1,
-0.201506, -0.9443986, -4.401725, 0, 1, 0.5254902, 1,
-0.1961687, -0.381547, -4.323884, 0, 1, 0.5333334, 1,
-0.1931724, -0.3715432, -2.330304, 0, 1, 0.5372549, 1,
-0.1885191, 0.5224861, 0.2200928, 0, 1, 0.5450981, 1,
-0.1868896, -0.0291968, -2.60546, 0, 1, 0.5490196, 1,
-0.1868077, -0.6420747, -3.379306, 0, 1, 0.5568628, 1,
-0.182858, -1.563682, -4.821867, 0, 1, 0.5607843, 1,
-0.1801012, -0.5219686, -4.1381, 0, 1, 0.5686275, 1,
-0.1789977, -1.426511, -3.369911, 0, 1, 0.572549, 1,
-0.1765593, 2.117922, 0.8914301, 0, 1, 0.5803922, 1,
-0.1760487, 0.3745619, 0.4157259, 0, 1, 0.5843138, 1,
-0.1756449, -3.34724, -3.446659, 0, 1, 0.5921569, 1,
-0.1710417, -0.53056, -1.964289, 0, 1, 0.5960785, 1,
-0.1656268, 0.4952229, -0.3711595, 0, 1, 0.6039216, 1,
-0.1558039, -0.3593684, -4.054084, 0, 1, 0.6117647, 1,
-0.1543562, -1.205946, -1.884082, 0, 1, 0.6156863, 1,
-0.1517973, -0.5246644, -3.055776, 0, 1, 0.6235294, 1,
-0.1498351, 0.3754663, -0.5247564, 0, 1, 0.627451, 1,
-0.1483267, -0.5533184, -2.575592, 0, 1, 0.6352941, 1,
-0.1465092, 0.6753183, -1.116032, 0, 1, 0.6392157, 1,
-0.1448328, -1.189784, -2.209744, 0, 1, 0.6470588, 1,
-0.1432819, 0.05235659, -0.3651755, 0, 1, 0.6509804, 1,
-0.1421858, -0.1011802, -2.90761, 0, 1, 0.6588235, 1,
-0.1378463, 0.6173864, 1.726933, 0, 1, 0.6627451, 1,
-0.1378414, 1.398321, -0.6668204, 0, 1, 0.6705883, 1,
-0.1362084, 0.478891, -1.167269, 0, 1, 0.6745098, 1,
-0.1355974, 2.533659, -1.368199, 0, 1, 0.682353, 1,
-0.131587, 0.2463892, 0.5197543, 0, 1, 0.6862745, 1,
-0.128034, 0.5559254, -1.066021, 0, 1, 0.6941177, 1,
-0.1243329, 0.305418, -0.236363, 0, 1, 0.7019608, 1,
-0.1222353, 0.1745456, -0.6084792, 0, 1, 0.7058824, 1,
-0.12147, -1.832797, -2.1147, 0, 1, 0.7137255, 1,
-0.1207136, 0.3290168, -1.32912, 0, 1, 0.7176471, 1,
-0.1171251, 0.6051519, -1.913297, 0, 1, 0.7254902, 1,
-0.1154177, 1.215918, 1.01514, 0, 1, 0.7294118, 1,
-0.1138172, -0.6624264, -2.00065, 0, 1, 0.7372549, 1,
-0.1115011, -0.7871279, -4.326866, 0, 1, 0.7411765, 1,
-0.1060858, 0.4712873, -1.296067, 0, 1, 0.7490196, 1,
-0.1055363, 0.09336475, -0.80621, 0, 1, 0.7529412, 1,
-0.1048772, -0.4753539, -1.1536, 0, 1, 0.7607843, 1,
-0.1042042, -0.4346172, -3.524338, 0, 1, 0.7647059, 1,
-0.100914, -0.2611178, -4.020667, 0, 1, 0.772549, 1,
-0.08689269, 0.1772752, 0.6380622, 0, 1, 0.7764706, 1,
-0.086768, -0.5803154, -1.558712, 0, 1, 0.7843137, 1,
-0.08615788, 0.7195258, 0.7738063, 0, 1, 0.7882353, 1,
-0.08307479, 1.098789, 1.001844, 0, 1, 0.7960784, 1,
-0.07273811, 0.6561017, -0.0832259, 0, 1, 0.8039216, 1,
-0.07203949, -1.183503, -3.276404, 0, 1, 0.8078431, 1,
-0.07043394, 1.325118, -1.050574, 0, 1, 0.8156863, 1,
-0.07020435, 1.261984, 0.8040408, 0, 1, 0.8196079, 1,
-0.06588408, -1.771573, -3.031064, 0, 1, 0.827451, 1,
-0.05587691, -0.7179608, -3.568857, 0, 1, 0.8313726, 1,
-0.05093131, -0.1426166, -2.426097, 0, 1, 0.8392157, 1,
-0.03579783, -1.895151, -2.461949, 0, 1, 0.8431373, 1,
-0.0352371, -0.3737579, -2.613516, 0, 1, 0.8509804, 1,
-0.03322686, -0.1387351, -2.153437, 0, 1, 0.854902, 1,
-0.02857197, -0.7176114, -2.347226, 0, 1, 0.8627451, 1,
-0.02808272, -0.7109448, -1.733569, 0, 1, 0.8666667, 1,
-0.02728238, -1.361537, -3.498374, 0, 1, 0.8745098, 1,
-0.02574012, -2.360664, -4.219775, 0, 1, 0.8784314, 1,
-0.02496692, -0.1552206, -2.443732, 0, 1, 0.8862745, 1,
-0.01802313, 0.3474745, 2.040323, 0, 1, 0.8901961, 1,
-0.01755217, 1.039137, -2.109484, 0, 1, 0.8980392, 1,
-0.01390827, -1.682203, -3.139185, 0, 1, 0.9058824, 1,
-0.01185134, -1.172962, -2.359012, 0, 1, 0.9098039, 1,
-0.009492388, 0.3402037, -0.7425445, 0, 1, 0.9176471, 1,
-0.009025056, -0.005161378, -2.107396, 0, 1, 0.9215686, 1,
-0.004919124, 0.4850247, 0.7006677, 0, 1, 0.9294118, 1,
0.008896927, 1.629686, -1.610929, 0, 1, 0.9333333, 1,
0.009295863, 0.6513118, -0.9271177, 0, 1, 0.9411765, 1,
0.01058678, 0.2191586, 0.1802818, 0, 1, 0.945098, 1,
0.01475587, 1.464111, 1.278097, 0, 1, 0.9529412, 1,
0.01947238, 0.3434823, 0.9313771, 0, 1, 0.9568627, 1,
0.02168432, -0.707304, 3.902065, 0, 1, 0.9647059, 1,
0.02207558, -0.04139297, 2.29776, 0, 1, 0.9686275, 1,
0.0226741, 0.6432241, 0.9515219, 0, 1, 0.9764706, 1,
0.02427862, -1.24173, 3.917429, 0, 1, 0.9803922, 1,
0.02661813, -0.3345691, 4.266907, 0, 1, 0.9882353, 1,
0.02740811, -0.5200191, 4.415631, 0, 1, 0.9921569, 1,
0.02780568, -1.076134, 1.87717, 0, 1, 1, 1,
0.02970307, -1.361605, 4.697778, 0, 0.9921569, 1, 1,
0.02998516, -1.009243, 5.374675, 0, 0.9882353, 1, 1,
0.03114309, -1.765379, 3.950607, 0, 0.9803922, 1, 1,
0.03194879, -1.019543, 2.457219, 0, 0.9764706, 1, 1,
0.03391403, -0.6582218, 1.989088, 0, 0.9686275, 1, 1,
0.03945611, 0.03462217, 0.007890903, 0, 0.9647059, 1, 1,
0.04504594, 1.196974, 0.08234735, 0, 0.9568627, 1, 1,
0.04666946, -0.6683791, 3.290524, 0, 0.9529412, 1, 1,
0.04733016, -0.1661662, 2.802478, 0, 0.945098, 1, 1,
0.04898673, 0.9622226, -0.2177902, 0, 0.9411765, 1, 1,
0.04997164, 0.4576929, -1.013459, 0, 0.9333333, 1, 1,
0.05105215, -1.105928, 3.669161, 0, 0.9294118, 1, 1,
0.0522394, 1.561803, -0.9246441, 0, 0.9215686, 1, 1,
0.05364172, 1.401348, -0.08999138, 0, 0.9176471, 1, 1,
0.05485055, -0.1838245, 2.376371, 0, 0.9098039, 1, 1,
0.05496234, 0.9587936, -1.556571, 0, 0.9058824, 1, 1,
0.05930523, 1.398837, 0.2853242, 0, 0.8980392, 1, 1,
0.05954726, -0.4631464, 3.261852, 0, 0.8901961, 1, 1,
0.06332168, -1.607341, 2.741607, 0, 0.8862745, 1, 1,
0.06668196, 1.150654, -0.09876534, 0, 0.8784314, 1, 1,
0.06959125, 0.4341042, 0.2189652, 0, 0.8745098, 1, 1,
0.06964211, 0.4485873, 1.181813, 0, 0.8666667, 1, 1,
0.07172529, -0.5956472, 2.898399, 0, 0.8627451, 1, 1,
0.07189612, -0.8626367, 2.272463, 0, 0.854902, 1, 1,
0.07673565, -0.001237615, 2.707024, 0, 0.8509804, 1, 1,
0.08057255, 0.1426859, -0.9012753, 0, 0.8431373, 1, 1,
0.08496652, 0.2627628, 0.994954, 0, 0.8392157, 1, 1,
0.08638757, 0.5248176, 1.805903, 0, 0.8313726, 1, 1,
0.08707935, -1.81498, 2.475917, 0, 0.827451, 1, 1,
0.08816982, 1.305393, 1.03605, 0, 0.8196079, 1, 1,
0.08946645, 1.391347, 1.350446, 0, 0.8156863, 1, 1,
0.09756704, -1.101901, 4.2427, 0, 0.8078431, 1, 1,
0.09757991, 0.08595183, 0.3290418, 0, 0.8039216, 1, 1,
0.09758949, 0.4305356, 0.6309844, 0, 0.7960784, 1, 1,
0.09848353, 0.1723663, -0.9049079, 0, 0.7882353, 1, 1,
0.1029521, 0.3447112, 0.1363174, 0, 0.7843137, 1, 1,
0.1058517, 0.4992134, 1.716588, 0, 0.7764706, 1, 1,
0.1071829, -1.311745, 4.217606, 0, 0.772549, 1, 1,
0.1089431, -2.143463, 3.376796, 0, 0.7647059, 1, 1,
0.1090076, 0.4376221, -0.7891771, 0, 0.7607843, 1, 1,
0.1124426, 1.237348, 0.86948, 0, 0.7529412, 1, 1,
0.1143923, -1.067634, 0.7893273, 0, 0.7490196, 1, 1,
0.115576, -1.211635, 2.061805, 0, 0.7411765, 1, 1,
0.117019, -0.4650577, 3.20075, 0, 0.7372549, 1, 1,
0.1236931, 1.379768, 0.318886, 0, 0.7294118, 1, 1,
0.1270248, -0.1705213, 2.24882, 0, 0.7254902, 1, 1,
0.1278224, -0.4729708, 2.528772, 0, 0.7176471, 1, 1,
0.1293202, 1.595934, -1.336861, 0, 0.7137255, 1, 1,
0.1299391, 0.808798, 0.06470542, 0, 0.7058824, 1, 1,
0.1316794, 0.1101886, 1.555217, 0, 0.6980392, 1, 1,
0.1324715, -1.215179, 4.275683, 0, 0.6941177, 1, 1,
0.1339088, -0.8482828, 3.161616, 0, 0.6862745, 1, 1,
0.1369931, -1.692142, 3.391549, 0, 0.682353, 1, 1,
0.1374071, -1.40078, 4.492562, 0, 0.6745098, 1, 1,
0.1376841, 1.426452, 0.5791738, 0, 0.6705883, 1, 1,
0.1385653, 0.7929243, 0.6292555, 0, 0.6627451, 1, 1,
0.1401294, -0.1178211, 2.315381, 0, 0.6588235, 1, 1,
0.1481346, 1.987585, 1.326765, 0, 0.6509804, 1, 1,
0.1484317, -0.2988506, 0.5478925, 0, 0.6470588, 1, 1,
0.1494812, 0.4297269, 0.5641961, 0, 0.6392157, 1, 1,
0.1503789, -0.01619486, 2.208967, 0, 0.6352941, 1, 1,
0.1507577, 0.7349494, 0.4430611, 0, 0.627451, 1, 1,
0.1523527, 0.7111191, 0.2517879, 0, 0.6235294, 1, 1,
0.1538076, -0.99783, 2.048145, 0, 0.6156863, 1, 1,
0.155434, -0.03805828, 1.114445, 0, 0.6117647, 1, 1,
0.1567427, -0.111367, 2.056034, 0, 0.6039216, 1, 1,
0.1575695, 0.04077855, 1.870562, 0, 0.5960785, 1, 1,
0.1578031, 0.2540807, 1.634533, 0, 0.5921569, 1, 1,
0.1597676, -0.6416036, 3.111605, 0, 0.5843138, 1, 1,
0.1600979, -2.178495, 3.948083, 0, 0.5803922, 1, 1,
0.1655677, -0.3116582, 2.556285, 0, 0.572549, 1, 1,
0.1676201, -0.02708942, 3.517231, 0, 0.5686275, 1, 1,
0.169423, 0.6733444, 1.503504, 0, 0.5607843, 1, 1,
0.1699197, -1.923794, 2.378674, 0, 0.5568628, 1, 1,
0.1699447, 0.1541896, 0.9917831, 0, 0.5490196, 1, 1,
0.1785485, 0.5983819, 0.8549138, 0, 0.5450981, 1, 1,
0.1824676, 0.2815274, 0.9678307, 0, 0.5372549, 1, 1,
0.1877823, -0.3784742, 1.921006, 0, 0.5333334, 1, 1,
0.1903388, -0.5898484, 1.769454, 0, 0.5254902, 1, 1,
0.1948083, 1.30614, 0.239531, 0, 0.5215687, 1, 1,
0.195433, 0.6010876, -0.02460367, 0, 0.5137255, 1, 1,
0.1954945, 0.9327372, -0.9590204, 0, 0.509804, 1, 1,
0.1956039, 0.9417548, 0.4731295, 0, 0.5019608, 1, 1,
0.2018069, 1.127542, -0.6404526, 0, 0.4941176, 1, 1,
0.2028939, 0.9988731, -0.462108, 0, 0.4901961, 1, 1,
0.2030517, -0.2453367, 3.034246, 0, 0.4823529, 1, 1,
0.2046528, -0.2359277, 1.887846, 0, 0.4784314, 1, 1,
0.2069119, 0.2229097, 1.453249, 0, 0.4705882, 1, 1,
0.2081143, -0.464653, 2.9279, 0, 0.4666667, 1, 1,
0.2088511, -0.5357333, 2.804408, 0, 0.4588235, 1, 1,
0.2094317, -0.3742705, 2.417654, 0, 0.454902, 1, 1,
0.2133469, 2.011237, -0.8677598, 0, 0.4470588, 1, 1,
0.2172684, 0.05373628, 1.082403, 0, 0.4431373, 1, 1,
0.2190517, 0.7421772, 2.45453, 0, 0.4352941, 1, 1,
0.2227186, -1.059838, 2.792475, 0, 0.4313726, 1, 1,
0.2232623, 1.067687, -0.08254295, 0, 0.4235294, 1, 1,
0.2269158, 1.626628, -0.5863977, 0, 0.4196078, 1, 1,
0.2270479, -0.1606615, 0.2592901, 0, 0.4117647, 1, 1,
0.2282698, -1.577384, 1.935226, 0, 0.4078431, 1, 1,
0.2364113, 0.3217665, 0.1703487, 0, 0.4, 1, 1,
0.2377878, -0.4871333, 2.170633, 0, 0.3921569, 1, 1,
0.2476452, 0.5864009, 0.8697777, 0, 0.3882353, 1, 1,
0.2487051, 0.01108868, 3.344985, 0, 0.3803922, 1, 1,
0.2517882, -0.2018754, 3.165118, 0, 0.3764706, 1, 1,
0.256226, -0.5025352, 3.738994, 0, 0.3686275, 1, 1,
0.258128, 0.5270836, -0.4221494, 0, 0.3647059, 1, 1,
0.2588852, 1.113698, -0.05356255, 0, 0.3568628, 1, 1,
0.2603368, -0.8842449, 1.947968, 0, 0.3529412, 1, 1,
0.2610108, -1.772906, 4.342898, 0, 0.345098, 1, 1,
0.2659616, 1.182782, -0.03698005, 0, 0.3411765, 1, 1,
0.2678977, -1.290983, 4.704079, 0, 0.3333333, 1, 1,
0.2703608, -1.453978, 1.233181, 0, 0.3294118, 1, 1,
0.2713233, 0.8897617, -0.9935364, 0, 0.3215686, 1, 1,
0.2724251, -0.4353684, 3.627038, 0, 0.3176471, 1, 1,
0.2725062, 0.5183259, -0.2558231, 0, 0.3098039, 1, 1,
0.2783696, 1.004653, -2.075875, 0, 0.3058824, 1, 1,
0.2783728, -0.8360018, 3.089899, 0, 0.2980392, 1, 1,
0.2826122, -1.970285, 2.370114, 0, 0.2901961, 1, 1,
0.2859557, 0.5720026, 0.3001517, 0, 0.2862745, 1, 1,
0.2860204, 0.520663, 1.221963, 0, 0.2784314, 1, 1,
0.2920695, -0.2090507, 2.856288, 0, 0.2745098, 1, 1,
0.295576, 0.3370708, 0.655803, 0, 0.2666667, 1, 1,
0.2964701, 0.066682, 2.213623, 0, 0.2627451, 1, 1,
0.3043852, -0.01885374, 1.999043, 0, 0.254902, 1, 1,
0.3166758, 0.6705996, -1.464795, 0, 0.2509804, 1, 1,
0.317203, 0.01884701, 1.432044, 0, 0.2431373, 1, 1,
0.3188914, 0.1230272, 0.7035449, 0, 0.2392157, 1, 1,
0.3234172, 0.285578, 1.535046, 0, 0.2313726, 1, 1,
0.3272667, -2.067014, 4.182882, 0, 0.227451, 1, 1,
0.3292854, -0.4825168, 3.412914, 0, 0.2196078, 1, 1,
0.3299746, 1.047697, 0.06877951, 0, 0.2156863, 1, 1,
0.33585, -0.4852089, 1.407751, 0, 0.2078431, 1, 1,
0.3390696, 1.508307, 0.5033664, 0, 0.2039216, 1, 1,
0.339469, -0.7125823, 1.260768, 0, 0.1960784, 1, 1,
0.3402624, -0.07656124, 2.815952, 0, 0.1882353, 1, 1,
0.3404195, 0.547435, 1.167957, 0, 0.1843137, 1, 1,
0.3493209, -1.494278, 2.67155, 0, 0.1764706, 1, 1,
0.3587343, 0.9911225, 0.3033533, 0, 0.172549, 1, 1,
0.3590651, 1.319197, 0.8428299, 0, 0.1647059, 1, 1,
0.3615199, -0.1755953, 0.7654275, 0, 0.1607843, 1, 1,
0.3642593, 0.8734417, -0.7281959, 0, 0.1529412, 1, 1,
0.3674829, 1.57187, 0.9247303, 0, 0.1490196, 1, 1,
0.3693369, -0.5433122, 2.159884, 0, 0.1411765, 1, 1,
0.3697822, 1.248726, -0.6571398, 0, 0.1372549, 1, 1,
0.3751321, -0.2278398, 2.790744, 0, 0.1294118, 1, 1,
0.3812728, -0.1201109, 2.437822, 0, 0.1254902, 1, 1,
0.3826657, -1.006747, 3.926965, 0, 0.1176471, 1, 1,
0.3846909, 0.3050173, 0.7302105, 0, 0.1137255, 1, 1,
0.3859077, 1.716958, 0.1100919, 0, 0.1058824, 1, 1,
0.3906431, -0.05709282, 2.206635, 0, 0.09803922, 1, 1,
0.3910002, -0.4794468, 0.5498292, 0, 0.09411765, 1, 1,
0.3919183, 0.2550374, 0.3759439, 0, 0.08627451, 1, 1,
0.3921627, 0.8574041, 2.059845, 0, 0.08235294, 1, 1,
0.3938583, -1.204878, 4.001333, 0, 0.07450981, 1, 1,
0.3979428, 0.19892, 0.5811812, 0, 0.07058824, 1, 1,
0.398849, 0.1005967, 0.003370126, 0, 0.0627451, 1, 1,
0.4016253, -1.484306, 1.754594, 0, 0.05882353, 1, 1,
0.4056646, 0.6841969, 0.4800987, 0, 0.05098039, 1, 1,
0.4085408, -0.3752669, 2.175994, 0, 0.04705882, 1, 1,
0.4190099, 0.5861847, -0.8131294, 0, 0.03921569, 1, 1,
0.4224545, 2.091622, 1.811353, 0, 0.03529412, 1, 1,
0.4296471, -0.09834506, 1.667951, 0, 0.02745098, 1, 1,
0.4338389, -1.94065, 3.856923, 0, 0.02352941, 1, 1,
0.4364138, 0.1408437, 0.9772518, 0, 0.01568628, 1, 1,
0.4372835, 1.681677, 1.595796, 0, 0.01176471, 1, 1,
0.4379643, -1.395533, 3.159672, 0, 0.003921569, 1, 1,
0.4412311, -1.065483, 2.902816, 0.003921569, 0, 1, 1,
0.4432261, -0.3457432, 1.807413, 0.007843138, 0, 1, 1,
0.4467368, 0.9091582, 2.033296, 0.01568628, 0, 1, 1,
0.4494135, -0.2286724, 3.13681, 0.01960784, 0, 1, 1,
0.450089, 0.2772781, 0.7933128, 0.02745098, 0, 1, 1,
0.4510049, 0.488649, 1.205535, 0.03137255, 0, 1, 1,
0.4530969, 1.555644, 1.271293, 0.03921569, 0, 1, 1,
0.45515, -0.3078102, 2.749177, 0.04313726, 0, 1, 1,
0.4566026, -0.4845239, 2.822384, 0.05098039, 0, 1, 1,
0.4575409, 0.4157846, 1.39452, 0.05490196, 0, 1, 1,
0.4577739, -0.3348965, 1.6127, 0.0627451, 0, 1, 1,
0.458281, -0.6978256, 1.716903, 0.06666667, 0, 1, 1,
0.4597549, -0.01353942, 0.7461092, 0.07450981, 0, 1, 1,
0.4599122, -0.03728358, 1.091084, 0.07843138, 0, 1, 1,
0.4604598, 1.351062, 0.08546913, 0.08627451, 0, 1, 1,
0.4630925, 0.2659455, 0.7162781, 0.09019608, 0, 1, 1,
0.4660881, 1.078296, 0.7945309, 0.09803922, 0, 1, 1,
0.4677565, -0.9590154, 1.916719, 0.1058824, 0, 1, 1,
0.4703723, 0.6882231, 0.4942755, 0.1098039, 0, 1, 1,
0.4736344, 1.184973, -0.1521298, 0.1176471, 0, 1, 1,
0.4770238, 1.106727, 0.176694, 0.1215686, 0, 1, 1,
0.486263, 1.086013, -0.8996115, 0.1294118, 0, 1, 1,
0.4920538, -0.4146537, 2.128433, 0.1333333, 0, 1, 1,
0.4953529, -0.2485079, 2.014033, 0.1411765, 0, 1, 1,
0.4967162, 0.8899121, 0.4768371, 0.145098, 0, 1, 1,
0.4994526, 0.84666, -1.994119, 0.1529412, 0, 1, 1,
0.4996129, -1.035883, 2.236762, 0.1568628, 0, 1, 1,
0.5004983, 0.430452, 1.386263, 0.1647059, 0, 1, 1,
0.5025004, -0.4670556, 2.533072, 0.1686275, 0, 1, 1,
0.5129696, 0.9754421, 1.588237, 0.1764706, 0, 1, 1,
0.5171003, -2.218569, 3.293567, 0.1803922, 0, 1, 1,
0.5191128, 0.6375071, 0.7880115, 0.1882353, 0, 1, 1,
0.5243336, 0.6487618, 0.3002677, 0.1921569, 0, 1, 1,
0.527131, 0.6438684, 0.6536333, 0.2, 0, 1, 1,
0.5287127, 0.8031313, 1.589176, 0.2078431, 0, 1, 1,
0.5288743, 2.115308, -0.9162533, 0.2117647, 0, 1, 1,
0.5314627, 0.2852092, 1.44, 0.2196078, 0, 1, 1,
0.5413847, -0.3717247, 0.1929381, 0.2235294, 0, 1, 1,
0.5449399, -1.739592, 2.834419, 0.2313726, 0, 1, 1,
0.5451752, 1.489886, 0.8357643, 0.2352941, 0, 1, 1,
0.5483133, 0.66957, 1.114021, 0.2431373, 0, 1, 1,
0.550028, 0.2231399, 1.171323, 0.2470588, 0, 1, 1,
0.5594662, -1.369689, 1.385114, 0.254902, 0, 1, 1,
0.5607255, 1.367861, 0.09442751, 0.2588235, 0, 1, 1,
0.5666232, 2.810843, -0.686164, 0.2666667, 0, 1, 1,
0.5683092, -0.4406208, 2.578402, 0.2705882, 0, 1, 1,
0.5723793, 1.37024, -1.193628, 0.2784314, 0, 1, 1,
0.5724899, 0.3563355, 1.029764, 0.282353, 0, 1, 1,
0.5733807, -0.5724535, 3.321391, 0.2901961, 0, 1, 1,
0.574922, -0.9459532, 2.890901, 0.2941177, 0, 1, 1,
0.5779653, 0.1921012, 3.047685, 0.3019608, 0, 1, 1,
0.5786305, 1.42144, 0.1067583, 0.3098039, 0, 1, 1,
0.5798665, 0.6032678, -0.8016757, 0.3137255, 0, 1, 1,
0.5832239, 0.03637234, 0.01198944, 0.3215686, 0, 1, 1,
0.5854672, 0.3845072, 1.692244, 0.3254902, 0, 1, 1,
0.586483, 0.7055497, 1.509641, 0.3333333, 0, 1, 1,
0.5907188, 0.508277, -0.1882332, 0.3372549, 0, 1, 1,
0.5921199, 0.9983625, 2.019447, 0.345098, 0, 1, 1,
0.603034, -1.244399, 2.057043, 0.3490196, 0, 1, 1,
0.6039785, -1.931108, 3.349075, 0.3568628, 0, 1, 1,
0.6079725, 0.4008665, 1.103357, 0.3607843, 0, 1, 1,
0.6082819, 0.8905353, -0.4141424, 0.3686275, 0, 1, 1,
0.6140509, -0.6577442, 3.598619, 0.372549, 0, 1, 1,
0.619152, 1.676404, 0.169395, 0.3803922, 0, 1, 1,
0.6202632, -0.4161425, 1.547378, 0.3843137, 0, 1, 1,
0.6202891, 0.2708561, -0.003510162, 0.3921569, 0, 1, 1,
0.622551, 0.8570495, 0.5531412, 0.3960784, 0, 1, 1,
0.632336, -0.08420574, 2.797755, 0.4039216, 0, 1, 1,
0.6330788, -0.03718363, 0.1024582, 0.4117647, 0, 1, 1,
0.6334491, 0.3223526, 0.2994559, 0.4156863, 0, 1, 1,
0.6394343, 0.4466664, 0.696697, 0.4235294, 0, 1, 1,
0.642356, 1.010482, 0.04418252, 0.427451, 0, 1, 1,
0.6453431, -0.6384972, 2.510189, 0.4352941, 0, 1, 1,
0.6564162, 2.609443, -1.177217, 0.4392157, 0, 1, 1,
0.6576185, -0.9474574, 0.6697027, 0.4470588, 0, 1, 1,
0.658449, -0.2686639, 1.358914, 0.4509804, 0, 1, 1,
0.6591052, 1.849231, -0.8834153, 0.4588235, 0, 1, 1,
0.661024, -0.677487, 2.327921, 0.4627451, 0, 1, 1,
0.6621678, 0.3431049, 2.096703, 0.4705882, 0, 1, 1,
0.6632077, -0.1271064, 0.6385425, 0.4745098, 0, 1, 1,
0.6643154, -0.8128409, 2.188043, 0.4823529, 0, 1, 1,
0.6679567, -0.0978348, 1.430489, 0.4862745, 0, 1, 1,
0.6697197, 1.013512, 1.164068, 0.4941176, 0, 1, 1,
0.6697876, -0.8316582, 3.660493, 0.5019608, 0, 1, 1,
0.6700727, -1.344714, 4.362049, 0.5058824, 0, 1, 1,
0.6732371, -0.7395941, 2.511378, 0.5137255, 0, 1, 1,
0.6738436, -0.6147509, 2.270831, 0.5176471, 0, 1, 1,
0.6745116, 0.31811, 2.053893, 0.5254902, 0, 1, 1,
0.6784709, -0.3649685, 2.582155, 0.5294118, 0, 1, 1,
0.6809594, -0.1325124, 0.6780923, 0.5372549, 0, 1, 1,
0.6811525, -1.890988, 4.070316, 0.5411765, 0, 1, 1,
0.6842093, 1.355721, 1.539578, 0.5490196, 0, 1, 1,
0.6844544, 1.753281, 0.496134, 0.5529412, 0, 1, 1,
0.6880408, 0.4286298, 1.419592, 0.5607843, 0, 1, 1,
0.6909428, 0.07109085, 0.05295317, 0.5647059, 0, 1, 1,
0.6914011, -2.244182, 1.810635, 0.572549, 0, 1, 1,
0.6914297, -1.616936, 2.932044, 0.5764706, 0, 1, 1,
0.6965655, 0.5225693, -0.9103387, 0.5843138, 0, 1, 1,
0.6990941, 0.9968085, 2.143378, 0.5882353, 0, 1, 1,
0.7002464, -0.3040459, 2.901798, 0.5960785, 0, 1, 1,
0.7029383, -0.3956411, 2.433743, 0.6039216, 0, 1, 1,
0.7088643, -0.7681682, 2.383697, 0.6078432, 0, 1, 1,
0.7094756, 0.08201602, 0.8499106, 0.6156863, 0, 1, 1,
0.7148397, -0.4621614, 2.026058, 0.6196079, 0, 1, 1,
0.7164205, -1.850318, 3.186949, 0.627451, 0, 1, 1,
0.7165549, 0.8816774, 1.553757, 0.6313726, 0, 1, 1,
0.7180735, 0.6228678, 2.105932, 0.6392157, 0, 1, 1,
0.7291961, -0.6038323, 1.921317, 0.6431373, 0, 1, 1,
0.7317023, -1.316605, 3.071866, 0.6509804, 0, 1, 1,
0.7318189, 0.230439, 1.357606, 0.654902, 0, 1, 1,
0.741631, -0.196098, 2.705658, 0.6627451, 0, 1, 1,
0.7420679, -0.4760226, 0.9380953, 0.6666667, 0, 1, 1,
0.7462121, 1.684831, -0.6399958, 0.6745098, 0, 1, 1,
0.7472985, 0.9850006, 0.8582473, 0.6784314, 0, 1, 1,
0.7518524, -0.4781285, 2.058202, 0.6862745, 0, 1, 1,
0.7586612, 1.445505, 0.02004041, 0.6901961, 0, 1, 1,
0.7587364, 1.193002, 0.6969897, 0.6980392, 0, 1, 1,
0.7597652, 0.4526268, -0.5912684, 0.7058824, 0, 1, 1,
0.7603925, -3.440067, 4.470617, 0.7098039, 0, 1, 1,
0.7657648, 0.5914957, 0.5780137, 0.7176471, 0, 1, 1,
0.7678303, -0.7292907, 1.348156, 0.7215686, 0, 1, 1,
0.7702324, 1.027899, 1.016433, 0.7294118, 0, 1, 1,
0.7708421, -0.5456961, 2.421676, 0.7333333, 0, 1, 1,
0.7726306, 1.040782, -0.03052134, 0.7411765, 0, 1, 1,
0.773423, 0.9822255, -1.234204, 0.7450981, 0, 1, 1,
0.7764405, 1.250053, -0.6294824, 0.7529412, 0, 1, 1,
0.7771387, -0.2182345, 1.400315, 0.7568628, 0, 1, 1,
0.7797183, 0.4157356, 1.483705, 0.7647059, 0, 1, 1,
0.783367, -0.6244192, 2.487678, 0.7686275, 0, 1, 1,
0.7854153, -1.529425, 3.607088, 0.7764706, 0, 1, 1,
0.7869889, 1.51775, -0.2430929, 0.7803922, 0, 1, 1,
0.795078, -0.3386267, 1.276768, 0.7882353, 0, 1, 1,
0.7988351, -0.2490634, 1.764737, 0.7921569, 0, 1, 1,
0.8146409, 0.3449283, 1.556655, 0.8, 0, 1, 1,
0.8154122, 1.651772, 1.798378, 0.8078431, 0, 1, 1,
0.8181592, -1.715698, 2.820256, 0.8117647, 0, 1, 1,
0.8228412, 0.6759967, 3.4482, 0.8196079, 0, 1, 1,
0.824484, 0.894128, -0.5718007, 0.8235294, 0, 1, 1,
0.8294407, 0.01697757, 2.360798, 0.8313726, 0, 1, 1,
0.8343511, 1.355413, 1.440397, 0.8352941, 0, 1, 1,
0.8351834, 0.2012278, 1.406805, 0.8431373, 0, 1, 1,
0.8352068, 2.527887, -1.026363, 0.8470588, 0, 1, 1,
0.8424461, 1.225299, 1.424338, 0.854902, 0, 1, 1,
0.8513551, -0.4444363, 2.212482, 0.8588235, 0, 1, 1,
0.8514064, -0.8943193, 1.678746, 0.8666667, 0, 1, 1,
0.8595219, 1.78211, -0.551401, 0.8705882, 0, 1, 1,
0.8620746, -0.5473012, 0.6068705, 0.8784314, 0, 1, 1,
0.8628834, 0.2228464, 0.8919544, 0.8823529, 0, 1, 1,
0.8646002, 1.006489, -0.2666142, 0.8901961, 0, 1, 1,
0.8653609, 0.230822, 1.185618, 0.8941177, 0, 1, 1,
0.8810589, -0.1403416, -0.03267772, 0.9019608, 0, 1, 1,
0.882489, 0.3190849, -1.013286, 0.9098039, 0, 1, 1,
0.8862833, 2.009961, 0.2568209, 0.9137255, 0, 1, 1,
0.8878436, 1.15102, -0.6710864, 0.9215686, 0, 1, 1,
0.8908907, 0.2368446, 0.5579802, 0.9254902, 0, 1, 1,
0.8972728, 0.9242287, 0.6032045, 0.9333333, 0, 1, 1,
0.8979241, -1.276969, 2.751309, 0.9372549, 0, 1, 1,
0.9008465, -0.2371355, 2.526425, 0.945098, 0, 1, 1,
0.9118034, -0.3498478, -0.02793841, 0.9490196, 0, 1, 1,
0.9195507, 0.7602776, 0.1104192, 0.9568627, 0, 1, 1,
0.9231802, -0.12808, 2.49423, 0.9607843, 0, 1, 1,
0.929066, 0.8288673, 1.190063, 0.9686275, 0, 1, 1,
0.9325371, -1.294627, 2.147377, 0.972549, 0, 1, 1,
0.9343042, 0.6368616, 0.651198, 0.9803922, 0, 1, 1,
0.9356585, 0.5375062, 1.030793, 0.9843137, 0, 1, 1,
0.9459872, -2.040879, 2.350322, 0.9921569, 0, 1, 1,
0.9553949, 1.128036, -0.5571532, 0.9960784, 0, 1, 1,
0.9561809, 0.602563, 0.912182, 1, 0, 0.9960784, 1,
0.9590635, -0.5647834, 3.286906, 1, 0, 0.9882353, 1,
0.9592863, 0.6518631, 1.19349, 1, 0, 0.9843137, 1,
0.9594984, 0.6985604, -0.2809174, 1, 0, 0.9764706, 1,
0.9614365, -1.12946, 2.666449, 1, 0, 0.972549, 1,
0.9616656, 0.5432602, 1.662367, 1, 0, 0.9647059, 1,
0.9660769, 0.481212, 0.9522261, 1, 0, 0.9607843, 1,
0.9664009, 0.2907583, 0.5694979, 1, 0, 0.9529412, 1,
0.9770561, 0.8618724, 1.557677, 1, 0, 0.9490196, 1,
0.9782468, -1.236764, 3.830567, 1, 0, 0.9411765, 1,
0.9787917, 0.002843756, 1.52042, 1, 0, 0.9372549, 1,
0.9861965, -1.86654, 1.69759, 1, 0, 0.9294118, 1,
0.9869173, 1.592296, 1.53792, 1, 0, 0.9254902, 1,
0.9928458, -1.021169, 2.230597, 1, 0, 0.9176471, 1,
0.9950395, -0.3216806, 1.83767, 1, 0, 0.9137255, 1,
1.000069, -1.801703, 3.177537, 1, 0, 0.9058824, 1,
1.000744, 1.242916, 0.2732552, 1, 0, 0.9019608, 1,
1.005954, 0.1169736, 3.358906, 1, 0, 0.8941177, 1,
1.02312, -2.186911, 2.886542, 1, 0, 0.8862745, 1,
1.037306, 0.2021201, 3.525422, 1, 0, 0.8823529, 1,
1.038179, 0.07197633, 2.993399, 1, 0, 0.8745098, 1,
1.050209, 0.2125592, 0.2365243, 1, 0, 0.8705882, 1,
1.054647, 0.1552008, 1.316581, 1, 0, 0.8627451, 1,
1.054705, -1.006518, 2.83609, 1, 0, 0.8588235, 1,
1.059642, 1.061342, -0.5724071, 1, 0, 0.8509804, 1,
1.064297, -0.08973429, 2.658038, 1, 0, 0.8470588, 1,
1.064912, -0.4818453, 2.954706, 1, 0, 0.8392157, 1,
1.073897, 1.39809, -0.8998631, 1, 0, 0.8352941, 1,
1.079758, 0.576191, -1.460639, 1, 0, 0.827451, 1,
1.081312, -1.214774, 3.58279, 1, 0, 0.8235294, 1,
1.086902, -0.06839599, 1.692683, 1, 0, 0.8156863, 1,
1.090279, 0.2235799, 1.725734, 1, 0, 0.8117647, 1,
1.095512, 0.146234, 0.8926287, 1, 0, 0.8039216, 1,
1.104977, -1.858307, 3.39477, 1, 0, 0.7960784, 1,
1.111383, 1.337978, 1.761601, 1, 0, 0.7921569, 1,
1.113665, -1.054267, 3.707505, 1, 0, 0.7843137, 1,
1.115331, 0.5963334, 1.003785, 1, 0, 0.7803922, 1,
1.115604, -0.4469053, 2.926281, 1, 0, 0.772549, 1,
1.120761, 0.5849524, 0.2745462, 1, 0, 0.7686275, 1,
1.124499, -0.6646187, 2.601433, 1, 0, 0.7607843, 1,
1.12771, -0.3396554, 2.933151, 1, 0, 0.7568628, 1,
1.132058, -0.428028, 3.05022, 1, 0, 0.7490196, 1,
1.139588, -0.04874748, 0.5377363, 1, 0, 0.7450981, 1,
1.143262, -0.478583, 0.5952418, 1, 0, 0.7372549, 1,
1.143376, -1.477147, 1.677429, 1, 0, 0.7333333, 1,
1.143448, 0.04821332, 0.4746051, 1, 0, 0.7254902, 1,
1.144179, -1.280232, 2.395941, 1, 0, 0.7215686, 1,
1.166942, -0.7623898, 3.371969, 1, 0, 0.7137255, 1,
1.174361, 0.4948371, 2.62745, 1, 0, 0.7098039, 1,
1.17942, 0.446735, -0.2302379, 1, 0, 0.7019608, 1,
1.17945, 1.050509, 2.525843, 1, 0, 0.6941177, 1,
1.183586, 0.2249568, -1.12296, 1, 0, 0.6901961, 1,
1.185467, 1.543144, 0.144558, 1, 0, 0.682353, 1,
1.185774, 0.1485986, 3.09071, 1, 0, 0.6784314, 1,
1.192333, 0.65078, 0.8509465, 1, 0, 0.6705883, 1,
1.192437, 0.6994265, -0.6100765, 1, 0, 0.6666667, 1,
1.192901, -0.260356, 1.043911, 1, 0, 0.6588235, 1,
1.212176, -1.519507, 2.909319, 1, 0, 0.654902, 1,
1.242055, -0.547942, 2.087014, 1, 0, 0.6470588, 1,
1.245253, -0.7245559, 1.195484, 1, 0, 0.6431373, 1,
1.247478, 0.7993582, -0.4390225, 1, 0, 0.6352941, 1,
1.25527, 1.192589, 0.8019159, 1, 0, 0.6313726, 1,
1.269275, 1.224941, 1.186178, 1, 0, 0.6235294, 1,
1.273751, 0.8454813, 2.783456, 1, 0, 0.6196079, 1,
1.275516, -1.911631, 1.653501, 1, 0, 0.6117647, 1,
1.27945, 2.35837, 1.058401, 1, 0, 0.6078432, 1,
1.27966, 0.8500962, -0.02884166, 1, 0, 0.6, 1,
1.282103, 1.734373, -0.6826116, 1, 0, 0.5921569, 1,
1.28668, 1.870525, 1.453901, 1, 0, 0.5882353, 1,
1.290727, -0.8672726, 1.505251, 1, 0, 0.5803922, 1,
1.300328, 0.1758854, 1.487636, 1, 0, 0.5764706, 1,
1.308055, -1.68175, 1.00926, 1, 0, 0.5686275, 1,
1.313787, -1.983095, 2.377972, 1, 0, 0.5647059, 1,
1.314289, 0.6382061, 2.45762, 1, 0, 0.5568628, 1,
1.315277, 1.021821, 1.88232, 1, 0, 0.5529412, 1,
1.322495, 0.8380046, -0.6337223, 1, 0, 0.5450981, 1,
1.337298, 0.2739518, -0.2760162, 1, 0, 0.5411765, 1,
1.345963, 1.687304, 2.017342, 1, 0, 0.5333334, 1,
1.350004, 1.062533, -0.3504243, 1, 0, 0.5294118, 1,
1.357571, -0.5719957, -0.2045147, 1, 0, 0.5215687, 1,
1.372753, -2.184072, 2.292373, 1, 0, 0.5176471, 1,
1.381406, 0.7861985, 1.882563, 1, 0, 0.509804, 1,
1.39139, -0.08268916, 1.659278, 1, 0, 0.5058824, 1,
1.403295, 1.886236, 1.680801, 1, 0, 0.4980392, 1,
1.403387, -0.800765, 1.314588, 1, 0, 0.4901961, 1,
1.403788, 0.4213858, 2.041813, 1, 0, 0.4862745, 1,
1.408435, 0.2651301, 2.096557, 1, 0, 0.4784314, 1,
1.411844, -0.6739468, 0.9185891, 1, 0, 0.4745098, 1,
1.419928, 1.122221, 2.950992, 1, 0, 0.4666667, 1,
1.42188, 0.6910834, 1.559458, 1, 0, 0.4627451, 1,
1.423249, 0.2871973, 2.357413, 1, 0, 0.454902, 1,
1.425399, 1.739613, 2.077184, 1, 0, 0.4509804, 1,
1.447388, -0.1665904, -0.05255126, 1, 0, 0.4431373, 1,
1.466862, 0.5956583, 1.602013, 1, 0, 0.4392157, 1,
1.467016, 1.985549, -0.4864974, 1, 0, 0.4313726, 1,
1.474576, 1.602975, 0.7190822, 1, 0, 0.427451, 1,
1.479169, 0.7365516, 2.574173, 1, 0, 0.4196078, 1,
1.479992, 0.2538746, 1.777782, 1, 0, 0.4156863, 1,
1.511984, 1.574616, 1.978784, 1, 0, 0.4078431, 1,
1.51416, -0.1062723, 1.775404, 1, 0, 0.4039216, 1,
1.537499, 0.7509046, 0.6016297, 1, 0, 0.3960784, 1,
1.539345, -1.539067, -0.3245269, 1, 0, 0.3882353, 1,
1.540203, -0.3162741, 4.514466, 1, 0, 0.3843137, 1,
1.543368, -0.3413989, 3.058632, 1, 0, 0.3764706, 1,
1.561932, 0.8166369, 1.915214, 1, 0, 0.372549, 1,
1.582914, -1.768028, 2.410321, 1, 0, 0.3647059, 1,
1.590941, 0.1673147, 1.512758, 1, 0, 0.3607843, 1,
1.592147, 0.3018232, 0.2909556, 1, 0, 0.3529412, 1,
1.633671, 0.08137289, 2.237575, 1, 0, 0.3490196, 1,
1.641162, -0.5091442, 1.024711, 1, 0, 0.3411765, 1,
1.645776, -1.214307, 1.955498, 1, 0, 0.3372549, 1,
1.665888, 0.5298881, 1.114841, 1, 0, 0.3294118, 1,
1.667614, 0.2348811, 0.9552203, 1, 0, 0.3254902, 1,
1.682066, -0.2226342, -0.158096, 1, 0, 0.3176471, 1,
1.694062, 0.8553214, 1.536085, 1, 0, 0.3137255, 1,
1.725048, -1.394498, 2.964506, 1, 0, 0.3058824, 1,
1.735428, -1.200362, 2.649693, 1, 0, 0.2980392, 1,
1.747765, -1.337707, 1.583543, 1, 0, 0.2941177, 1,
1.762262, 0.06908456, 1.906484, 1, 0, 0.2862745, 1,
1.763627, -1.452048, 3.07126, 1, 0, 0.282353, 1,
1.776607, 0.4011198, 0.9268091, 1, 0, 0.2745098, 1,
1.81621, 1.059406, 1.158742, 1, 0, 0.2705882, 1,
1.816388, -0.1312397, 2.861511, 1, 0, 0.2627451, 1,
1.81787, -0.3453472, 1.251494, 1, 0, 0.2588235, 1,
1.829895, -0.1872805, 2.130229, 1, 0, 0.2509804, 1,
1.86393, 0.7607819, 1.864028, 1, 0, 0.2470588, 1,
1.86624, -0.04445164, -0.8806921, 1, 0, 0.2392157, 1,
1.896483, 0.3642595, 1.608671, 1, 0, 0.2352941, 1,
1.898248, -0.9028684, 2.228336, 1, 0, 0.227451, 1,
1.909546, 1.806363, 0.836593, 1, 0, 0.2235294, 1,
1.92105, -0.1153195, 1.395238, 1, 0, 0.2156863, 1,
1.922771, 0.6250652, 1.52051, 1, 0, 0.2117647, 1,
1.924994, 2.219513, 0.2085584, 1, 0, 0.2039216, 1,
1.932881, 0.4584921, 1.52763, 1, 0, 0.1960784, 1,
1.944561, 0.3970769, 2.337043, 1, 0, 0.1921569, 1,
1.946842, 1.155649, -0.09020659, 1, 0, 0.1843137, 1,
1.954115, 0.08622017, 0.8863208, 1, 0, 0.1803922, 1,
1.998739, 1.268014, 1.253696, 1, 0, 0.172549, 1,
2.034039, 1.0374, -0.01214937, 1, 0, 0.1686275, 1,
2.035128, -0.1159176, 2.99678, 1, 0, 0.1607843, 1,
2.046784, -0.0605448, 3.598909, 1, 0, 0.1568628, 1,
2.049099, -0.8114655, 3.598509, 1, 0, 0.1490196, 1,
2.04937, -0.6489356, 3.130124, 1, 0, 0.145098, 1,
2.056773, 1.808879, 2.064752, 1, 0, 0.1372549, 1,
2.085138, 0.1510702, 0.365268, 1, 0, 0.1333333, 1,
2.085449, 1.374884, 1.426784, 1, 0, 0.1254902, 1,
2.111419, -1.466058, 1.644518, 1, 0, 0.1215686, 1,
2.133369, -0.04341777, 2.043883, 1, 0, 0.1137255, 1,
2.143395, 0.3645042, 0.6075861, 1, 0, 0.1098039, 1,
2.143737, -0.7539344, 2.333179, 1, 0, 0.1019608, 1,
2.175071, 0.1670069, 1.8712, 1, 0, 0.09411765, 1,
2.203215, -0.04168843, 2.554997, 1, 0, 0.09019608, 1,
2.322954, -1.445299, -0.3631179, 1, 0, 0.08235294, 1,
2.337078, 0.4245242, 2.011084, 1, 0, 0.07843138, 1,
2.398946, -1.060865, 0.8833246, 1, 0, 0.07058824, 1,
2.425639, 0.4102397, 1.854607, 1, 0, 0.06666667, 1,
2.510684, 0.7918062, 1.178835, 1, 0, 0.05882353, 1,
2.55749, -1.648759, 1.939585, 1, 0, 0.05490196, 1,
2.566562, -0.9789783, 2.181787, 1, 0, 0.04705882, 1,
2.637108, 1.231336, 1.04731, 1, 0, 0.04313726, 1,
2.712572, 1.036236, -0.3979952, 1, 0, 0.03529412, 1,
2.811294, 1.246991, 1.353748, 1, 0, 0.03137255, 1,
3.014598, -1.314135, 3.68726, 1, 0, 0.02352941, 1,
3.208219, -0.678224, -0.01163866, 1, 0, 0.01960784, 1,
3.334015, -0.9403033, 2.130996, 1, 0, 0.01176471, 1,
3.578122, 2.115322, 0.06475721, 1, 0, 0.007843138, 1
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
0.3443615, -4.544403, -6.55018, 0, -0.5, 0.5, 0.5,
0.3443615, -4.544403, -6.55018, 1, -0.5, 0.5, 0.5,
0.3443615, -4.544403, -6.55018, 1, 1.5, 0.5, 0.5,
0.3443615, -4.544403, -6.55018, 0, 1.5, 0.5, 0.5
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
-3.985643, -0.1824367, -6.55018, 0, -0.5, 0.5, 0.5,
-3.985643, -0.1824367, -6.55018, 1, -0.5, 0.5, 0.5,
-3.985643, -0.1824367, -6.55018, 1, 1.5, 0.5, 0.5,
-3.985643, -0.1824367, -6.55018, 0, 1.5, 0.5, 0.5
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
-3.985643, -4.544403, 0.2764044, 0, -0.5, 0.5, 0.5,
-3.985643, -4.544403, 0.2764044, 1, -0.5, 0.5, 0.5,
-3.985643, -4.544403, 0.2764044, 1, 1.5, 0.5, 0.5,
-3.985643, -4.544403, 0.2764044, 0, 1.5, 0.5, 0.5
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
-2, -3.537796, -4.974814,
3, -3.537796, -4.974814,
-2, -3.537796, -4.974814,
-2, -3.705563, -5.237376,
-1, -3.537796, -4.974814,
-1, -3.705563, -5.237376,
0, -3.537796, -4.974814,
0, -3.705563, -5.237376,
1, -3.537796, -4.974814,
1, -3.705563, -5.237376,
2, -3.537796, -4.974814,
2, -3.705563, -5.237376,
3, -3.537796, -4.974814,
3, -3.705563, -5.237376
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
-2, -4.041099, -5.762497, 0, -0.5, 0.5, 0.5,
-2, -4.041099, -5.762497, 1, -0.5, 0.5, 0.5,
-2, -4.041099, -5.762497, 1, 1.5, 0.5, 0.5,
-2, -4.041099, -5.762497, 0, 1.5, 0.5, 0.5,
-1, -4.041099, -5.762497, 0, -0.5, 0.5, 0.5,
-1, -4.041099, -5.762497, 1, -0.5, 0.5, 0.5,
-1, -4.041099, -5.762497, 1, 1.5, 0.5, 0.5,
-1, -4.041099, -5.762497, 0, 1.5, 0.5, 0.5,
0, -4.041099, -5.762497, 0, -0.5, 0.5, 0.5,
0, -4.041099, -5.762497, 1, -0.5, 0.5, 0.5,
0, -4.041099, -5.762497, 1, 1.5, 0.5, 0.5,
0, -4.041099, -5.762497, 0, 1.5, 0.5, 0.5,
1, -4.041099, -5.762497, 0, -0.5, 0.5, 0.5,
1, -4.041099, -5.762497, 1, -0.5, 0.5, 0.5,
1, -4.041099, -5.762497, 1, 1.5, 0.5, 0.5,
1, -4.041099, -5.762497, 0, 1.5, 0.5, 0.5,
2, -4.041099, -5.762497, 0, -0.5, 0.5, 0.5,
2, -4.041099, -5.762497, 1, -0.5, 0.5, 0.5,
2, -4.041099, -5.762497, 1, 1.5, 0.5, 0.5,
2, -4.041099, -5.762497, 0, 1.5, 0.5, 0.5,
3, -4.041099, -5.762497, 0, -0.5, 0.5, 0.5,
3, -4.041099, -5.762497, 1, -0.5, 0.5, 0.5,
3, -4.041099, -5.762497, 1, 1.5, 0.5, 0.5,
3, -4.041099, -5.762497, 0, 1.5, 0.5, 0.5
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
-2.986411, -3, -4.974814,
-2.986411, 3, -4.974814,
-2.986411, -3, -4.974814,
-3.15295, -3, -5.237376,
-2.986411, -2, -4.974814,
-3.15295, -2, -5.237376,
-2.986411, -1, -4.974814,
-3.15295, -1, -5.237376,
-2.986411, 0, -4.974814,
-3.15295, 0, -5.237376,
-2.986411, 1, -4.974814,
-3.15295, 1, -5.237376,
-2.986411, 2, -4.974814,
-3.15295, 2, -5.237376,
-2.986411, 3, -4.974814,
-3.15295, 3, -5.237376
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
-3.486027, -3, -5.762497, 0, -0.5, 0.5, 0.5,
-3.486027, -3, -5.762497, 1, -0.5, 0.5, 0.5,
-3.486027, -3, -5.762497, 1, 1.5, 0.5, 0.5,
-3.486027, -3, -5.762497, 0, 1.5, 0.5, 0.5,
-3.486027, -2, -5.762497, 0, -0.5, 0.5, 0.5,
-3.486027, -2, -5.762497, 1, -0.5, 0.5, 0.5,
-3.486027, -2, -5.762497, 1, 1.5, 0.5, 0.5,
-3.486027, -2, -5.762497, 0, 1.5, 0.5, 0.5,
-3.486027, -1, -5.762497, 0, -0.5, 0.5, 0.5,
-3.486027, -1, -5.762497, 1, -0.5, 0.5, 0.5,
-3.486027, -1, -5.762497, 1, 1.5, 0.5, 0.5,
-3.486027, -1, -5.762497, 0, 1.5, 0.5, 0.5,
-3.486027, 0, -5.762497, 0, -0.5, 0.5, 0.5,
-3.486027, 0, -5.762497, 1, -0.5, 0.5, 0.5,
-3.486027, 0, -5.762497, 1, 1.5, 0.5, 0.5,
-3.486027, 0, -5.762497, 0, 1.5, 0.5, 0.5,
-3.486027, 1, -5.762497, 0, -0.5, 0.5, 0.5,
-3.486027, 1, -5.762497, 1, -0.5, 0.5, 0.5,
-3.486027, 1, -5.762497, 1, 1.5, 0.5, 0.5,
-3.486027, 1, -5.762497, 0, 1.5, 0.5, 0.5,
-3.486027, 2, -5.762497, 0, -0.5, 0.5, 0.5,
-3.486027, 2, -5.762497, 1, -0.5, 0.5, 0.5,
-3.486027, 2, -5.762497, 1, 1.5, 0.5, 0.5,
-3.486027, 2, -5.762497, 0, 1.5, 0.5, 0.5,
-3.486027, 3, -5.762497, 0, -0.5, 0.5, 0.5,
-3.486027, 3, -5.762497, 1, -0.5, 0.5, 0.5,
-3.486027, 3, -5.762497, 1, 1.5, 0.5, 0.5,
-3.486027, 3, -5.762497, 0, 1.5, 0.5, 0.5
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
-2.986411, -3.537796, -4,
-2.986411, -3.537796, 4,
-2.986411, -3.537796, -4,
-3.15295, -3.705563, -4,
-2.986411, -3.537796, -2,
-3.15295, -3.705563, -2,
-2.986411, -3.537796, 0,
-3.15295, -3.705563, 0,
-2.986411, -3.537796, 2,
-3.15295, -3.705563, 2,
-2.986411, -3.537796, 4,
-3.15295, -3.705563, 4
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
-3.486027, -4.041099, -4, 0, -0.5, 0.5, 0.5,
-3.486027, -4.041099, -4, 1, -0.5, 0.5, 0.5,
-3.486027, -4.041099, -4, 1, 1.5, 0.5, 0.5,
-3.486027, -4.041099, -4, 0, 1.5, 0.5, 0.5,
-3.486027, -4.041099, -2, 0, -0.5, 0.5, 0.5,
-3.486027, -4.041099, -2, 1, -0.5, 0.5, 0.5,
-3.486027, -4.041099, -2, 1, 1.5, 0.5, 0.5,
-3.486027, -4.041099, -2, 0, 1.5, 0.5, 0.5,
-3.486027, -4.041099, 0, 0, -0.5, 0.5, 0.5,
-3.486027, -4.041099, 0, 1, -0.5, 0.5, 0.5,
-3.486027, -4.041099, 0, 1, 1.5, 0.5, 0.5,
-3.486027, -4.041099, 0, 0, 1.5, 0.5, 0.5,
-3.486027, -4.041099, 2, 0, -0.5, 0.5, 0.5,
-3.486027, -4.041099, 2, 1, -0.5, 0.5, 0.5,
-3.486027, -4.041099, 2, 1, 1.5, 0.5, 0.5,
-3.486027, -4.041099, 2, 0, 1.5, 0.5, 0.5,
-3.486027, -4.041099, 4, 0, -0.5, 0.5, 0.5,
-3.486027, -4.041099, 4, 1, -0.5, 0.5, 0.5,
-3.486027, -4.041099, 4, 1, 1.5, 0.5, 0.5,
-3.486027, -4.041099, 4, 0, 1.5, 0.5, 0.5
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
-2.986411, -3.537796, -4.974814,
-2.986411, 3.172922, -4.974814,
-2.986411, -3.537796, 5.527623,
-2.986411, 3.172922, 5.527623,
-2.986411, -3.537796, -4.974814,
-2.986411, -3.537796, 5.527623,
-2.986411, 3.172922, -4.974814,
-2.986411, 3.172922, 5.527623,
-2.986411, -3.537796, -4.974814,
3.675134, -3.537796, -4.974814,
-2.986411, -3.537796, 5.527623,
3.675134, -3.537796, 5.527623,
-2.986411, 3.172922, -4.974814,
3.675134, 3.172922, -4.974814,
-2.986411, 3.172922, 5.527623,
3.675134, 3.172922, 5.527623,
3.675134, -3.537796, -4.974814,
3.675134, 3.172922, -4.974814,
3.675134, -3.537796, 5.527623,
3.675134, 3.172922, 5.527623,
3.675134, -3.537796, -4.974814,
3.675134, -3.537796, 5.527623,
3.675134, 3.172922, -4.974814,
3.675134, 3.172922, 5.527623
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
var radius = 7.54617;
var distance = 33.57376;
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
mvMatrix.translate( -0.3443615, 0.1824367, -0.2764044 );
mvMatrix.scale( 1.224801, 1.215826, 0.7768736 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.57376);
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
Sevin<-read.table("Sevin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sevin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sevin' not found
```

```r
y<-Sevin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sevin' not found
```

```r
z<-Sevin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sevin' not found
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
-2.889399, 0.3658928, -1.787866, 0, 0, 1, 1, 1,
-2.76174, 0.9749742, -1.225441, 1, 0, 0, 1, 1,
-2.7479, 0.1839326, -2.145751, 1, 0, 0, 1, 1,
-2.680616, -0.1267248, -2.516093, 1, 0, 0, 1, 1,
-2.651866, -0.4738582, -1.938211, 1, 0, 0, 1, 1,
-2.553946, 0.9624159, -1.650969, 1, 0, 0, 1, 1,
-2.535652, 1.501022, 0.02290097, 0, 0, 0, 1, 1,
-2.517505, 0.280604, -1.328318, 0, 0, 0, 1, 1,
-2.500498, -1.181251, -0.9261938, 0, 0, 0, 1, 1,
-2.383481, -0.3242895, -1.484785, 0, 0, 0, 1, 1,
-2.378613, -0.3233551, -2.014154, 0, 0, 0, 1, 1,
-2.247936, 0.5505127, -2.105283, 0, 0, 0, 1, 1,
-2.239283, -0.2846473, -2.481159, 0, 0, 0, 1, 1,
-2.226246, 0.934296, -2.148686, 1, 1, 1, 1, 1,
-2.183697, 1.250172, -1.418764, 1, 1, 1, 1, 1,
-2.15539, 0.5763916, -1.311519, 1, 1, 1, 1, 1,
-2.087481, 1.067641, -1.945332, 1, 1, 1, 1, 1,
-2.07965, -1.636737, -1.188514, 1, 1, 1, 1, 1,
-2.078939, -0.4230278, -1.734289, 1, 1, 1, 1, 1,
-2.07846, -0.5131457, -0.7346544, 1, 1, 1, 1, 1,
-2.053276, -1.273823, -2.60368, 1, 1, 1, 1, 1,
-2.022816, -0.003202493, -1.711497, 1, 1, 1, 1, 1,
-2.002588, -1.312432, -0.6429321, 1, 1, 1, 1, 1,
-1.997249, 0.1590433, -1.971091, 1, 1, 1, 1, 1,
-1.98273, 0.4750718, -2.698139, 1, 1, 1, 1, 1,
-1.966807, 1.03376, -2.076163, 1, 1, 1, 1, 1,
-1.950807, 1.961707, -1.249409, 1, 1, 1, 1, 1,
-1.909997, -1.285817, -1.418487, 1, 1, 1, 1, 1,
-1.827597, 0.3244144, -0.7746476, 0, 0, 1, 1, 1,
-1.816577, -0.5750895, -2.249171, 1, 0, 0, 1, 1,
-1.788192, -0.00478808, -1.062808, 1, 0, 0, 1, 1,
-1.786813, -1.214271, -1.447105, 1, 0, 0, 1, 1,
-1.729881, -0.01318504, -1.759869, 1, 0, 0, 1, 1,
-1.725973, -0.009200279, 0.5873161, 1, 0, 0, 1, 1,
-1.724017, -0.3401845, 0.3290907, 0, 0, 0, 1, 1,
-1.713566, -0.6147376, -1.89831, 0, 0, 0, 1, 1,
-1.700333, -1.397042, -2.120742, 0, 0, 0, 1, 1,
-1.656717, 2.533722, -0.5478307, 0, 0, 0, 1, 1,
-1.64868, 0.3270906, -1.630531, 0, 0, 0, 1, 1,
-1.638719, 0.4991644, -1.17883, 0, 0, 0, 1, 1,
-1.634223, -0.609612, -2.507473, 0, 0, 0, 1, 1,
-1.626494, -0.1150629, -0.4562864, 1, 1, 1, 1, 1,
-1.62332, -0.6843005, 0.4201964, 1, 1, 1, 1, 1,
-1.620362, 0.629474, -0.8761763, 1, 1, 1, 1, 1,
-1.603027, 0.1614215, -1.147748, 1, 1, 1, 1, 1,
-1.602687, -0.7081667, -1.498104, 1, 1, 1, 1, 1,
-1.598339, -0.07591829, -1.093393, 1, 1, 1, 1, 1,
-1.578698, 0.7471069, -1.343157, 1, 1, 1, 1, 1,
-1.56878, -0.8421593, -3.35375, 1, 1, 1, 1, 1,
-1.56522, -0.7689912, -2.011067, 1, 1, 1, 1, 1,
-1.541485, -1.187237, -2.970439, 1, 1, 1, 1, 1,
-1.530826, -0.7545469, -3.396395, 1, 1, 1, 1, 1,
-1.528628, 2.334995, -0.6463893, 1, 1, 1, 1, 1,
-1.524611, 0.03733549, -1.267341, 1, 1, 1, 1, 1,
-1.522073, 0.5473934, -1.635597, 1, 1, 1, 1, 1,
-1.516529, -0.227448, -1.516708, 1, 1, 1, 1, 1,
-1.511625, -0.9015296, -3.494107, 0, 0, 1, 1, 1,
-1.508067, 0.8063954, -1.88555, 1, 0, 0, 1, 1,
-1.504342, 1.189745, -0.2600278, 1, 0, 0, 1, 1,
-1.499235, -0.9076893, -2.124022, 1, 0, 0, 1, 1,
-1.497717, 0.2857221, -1.33113, 1, 0, 0, 1, 1,
-1.49164, -0.2161983, -1.17414, 1, 0, 0, 1, 1,
-1.490416, 0.2799827, -1.308819, 0, 0, 0, 1, 1,
-1.486325, -0.9180776, -2.921335, 0, 0, 0, 1, 1,
-1.46966, -1.162973, -0.6787344, 0, 0, 0, 1, 1,
-1.469633, -0.915101, -1.881635, 0, 0, 0, 1, 1,
-1.467692, 0.4135022, -2.473603, 0, 0, 0, 1, 1,
-1.466953, 0.7233653, -2.274647, 0, 0, 0, 1, 1,
-1.458628, 0.5334557, -0.4310712, 0, 0, 0, 1, 1,
-1.455032, -1.22474, -3.324709, 1, 1, 1, 1, 1,
-1.453527, 0.2988653, -1.357656, 1, 1, 1, 1, 1,
-1.451085, 0.5195525, -2.205139, 1, 1, 1, 1, 1,
-1.417849, 0.7250428, -0.5350945, 1, 1, 1, 1, 1,
-1.412071, -2.615954, -1.972182, 1, 1, 1, 1, 1,
-1.396719, -2.524182, -0.1854761, 1, 1, 1, 1, 1,
-1.387102, -0.2594692, -2.096384, 1, 1, 1, 1, 1,
-1.371735, 1.051292, 0.1133323, 1, 1, 1, 1, 1,
-1.366697, -0.9748018, -2.599007, 1, 1, 1, 1, 1,
-1.365015, 0.1131016, -1.3459, 1, 1, 1, 1, 1,
-1.363152, -1.740303, -0.9434525, 1, 1, 1, 1, 1,
-1.360462, -0.4897197, 0.9041462, 1, 1, 1, 1, 1,
-1.360433, -0.3888431, -1.799664, 1, 1, 1, 1, 1,
-1.356227, 0.895398, 0.6070294, 1, 1, 1, 1, 1,
-1.353422, -0.5994297, -3.407104, 1, 1, 1, 1, 1,
-1.323041, 0.3192399, -3.520654, 0, 0, 1, 1, 1,
-1.319121, 0.008070226, -1.224074, 1, 0, 0, 1, 1,
-1.302801, 1.439043, 0.165232, 1, 0, 0, 1, 1,
-1.289616, -0.228195, -0.3258504, 1, 0, 0, 1, 1,
-1.278605, -0.6692725, -1.563123, 1, 0, 0, 1, 1,
-1.278097, 0.282304, -4.062313, 1, 0, 0, 1, 1,
-1.267293, -0.6337199, -0.7676358, 0, 0, 0, 1, 1,
-1.26002, 0.7617207, -0.739029, 0, 0, 0, 1, 1,
-1.256813, 0.3478117, -0.9499468, 0, 0, 0, 1, 1,
-1.256278, 1.536877, -0.4208953, 0, 0, 0, 1, 1,
-1.248244, -0.08769678, -1.437499, 0, 0, 0, 1, 1,
-1.244093, 1.12391, -0.7713472, 0, 0, 0, 1, 1,
-1.243854, 1.988558, -0.4663774, 0, 0, 0, 1, 1,
-1.243483, -0.9344603, -1.122954, 1, 1, 1, 1, 1,
-1.235441, 0.4615781, -3.078996, 1, 1, 1, 1, 1,
-1.232063, 1.184727, -0.7045463, 1, 1, 1, 1, 1,
-1.229428, -0.7214174, -0.3061667, 1, 1, 1, 1, 1,
-1.224771, -0.02998511, -1.052384, 1, 1, 1, 1, 1,
-1.222428, -0.02918664, -3.203864, 1, 1, 1, 1, 1,
-1.209632, 0.5415856, -0.7779403, 1, 1, 1, 1, 1,
-1.208098, -1.515462, -0.7211508, 1, 1, 1, 1, 1,
-1.204426, -0.8082652, -2.224573, 1, 1, 1, 1, 1,
-1.20253, -2.778347, -3.653896, 1, 1, 1, 1, 1,
-1.194074, -0.8020449, -3.000454, 1, 1, 1, 1, 1,
-1.190592, -0.0455762, -2.338644, 1, 1, 1, 1, 1,
-1.190163, 0.6708264, -1.459893, 1, 1, 1, 1, 1,
-1.184366, -0.3071373, -1.218088, 1, 1, 1, 1, 1,
-1.176995, -1.583961, -0.7788515, 1, 1, 1, 1, 1,
-1.173085, 0.4563168, 0.5551728, 0, 0, 1, 1, 1,
-1.164394, -0.07122068, -1.701308, 1, 0, 0, 1, 1,
-1.144069, 0.813326, -0.5961217, 1, 0, 0, 1, 1,
-1.143969, 0.858102, -0.5784282, 1, 0, 0, 1, 1,
-1.138477, 2.022432, -1.35436, 1, 0, 0, 1, 1,
-1.135918, -0.1047241, -1.319378, 1, 0, 0, 1, 1,
-1.132802, 0.3967275, -2.466758, 0, 0, 0, 1, 1,
-1.122656, 0.2135216, -2.233034, 0, 0, 0, 1, 1,
-1.119704, -1.753066, -1.037452, 0, 0, 0, 1, 1,
-1.118206, -1.800296, -2.39481, 0, 0, 0, 1, 1,
-1.115413, 0.7307235, -0.6723055, 0, 0, 0, 1, 1,
-1.115169, -0.5364276, -2.490126, 0, 0, 0, 1, 1,
-1.10715, 0.8440087, 1.094752, 0, 0, 0, 1, 1,
-1.105848, -1.979907, -4.440401, 1, 1, 1, 1, 1,
-1.10397, 0.1302821, -1.304322, 1, 1, 1, 1, 1,
-1.103401, -0.183952, -1.428014, 1, 1, 1, 1, 1,
-1.10042, -0.2389735, -0.6347375, 1, 1, 1, 1, 1,
-1.089523, -0.339392, -2.338726, 1, 1, 1, 1, 1,
-1.084927, 0.2036595, -1.483784, 1, 1, 1, 1, 1,
-1.079516, 0.5980526, -2.038415, 1, 1, 1, 1, 1,
-1.071758, -2.813759, -3.50529, 1, 1, 1, 1, 1,
-1.070386, 0.6087946, -1.017689, 1, 1, 1, 1, 1,
-1.065499, 0.6437503, -1.904858, 1, 1, 1, 1, 1,
-1.05129, 0.2239551, -2.218105, 1, 1, 1, 1, 1,
-1.048394, -1.412217, -2.804737, 1, 1, 1, 1, 1,
-1.047915, 1.230119, -2.139726, 1, 1, 1, 1, 1,
-1.044236, 1.380171, 0.2742267, 1, 1, 1, 1, 1,
-1.031501, -1.595853, -3.83667, 1, 1, 1, 1, 1,
-1.028209, -0.1417535, -4.601363, 0, 0, 1, 1, 1,
-1.022436, -0.1366447, -0.4799555, 1, 0, 0, 1, 1,
-1.018109, 2.253057, 0.7534405, 1, 0, 0, 1, 1,
-1.015658, 2.373438, -1.107293, 1, 0, 0, 1, 1,
-1.013231, 1.806175, -0.008009478, 1, 0, 0, 1, 1,
-1.006462, 0.6788087, -0.6424652, 1, 0, 0, 1, 1,
-1.000218, -0.2045862, -1.38247, 0, 0, 0, 1, 1,
-1.000189, 1.425406, -0.3782459, 0, 0, 0, 1, 1,
-0.9953777, 1.011407, 1.044435, 0, 0, 0, 1, 1,
-0.9942405, 0.5425598, -1.692464, 0, 0, 0, 1, 1,
-0.9865778, 1.93063, -1.487125, 0, 0, 0, 1, 1,
-0.9825408, 0.6253672, -0.04750513, 0, 0, 0, 1, 1,
-0.9732382, -1.374392, -0.2482475, 0, 0, 0, 1, 1,
-0.9727647, 0.05079914, 0.06720699, 1, 1, 1, 1, 1,
-0.9687525, -0.5266637, -2.374151, 1, 1, 1, 1, 1,
-0.9634922, 0.8318314, -0.6915056, 1, 1, 1, 1, 1,
-0.9597213, 0.7535897, -0.06144867, 1, 1, 1, 1, 1,
-0.957109, 0.334037, -1.52372, 1, 1, 1, 1, 1,
-0.9549735, 0.554948, -2.296772, 1, 1, 1, 1, 1,
-0.9526335, -0.7698823, -3.178791, 1, 1, 1, 1, 1,
-0.946562, 1.203787, 0.1788612, 1, 1, 1, 1, 1,
-0.9434208, 3.075193, 0.4317444, 1, 1, 1, 1, 1,
-0.9426784, -0.3415409, -1.941935, 1, 1, 1, 1, 1,
-0.9332271, -0.4342894, -1.241097, 1, 1, 1, 1, 1,
-0.9303318, 0.6676334, -0.5197732, 1, 1, 1, 1, 1,
-0.9258883, 1.022028, -1.063389, 1, 1, 1, 1, 1,
-0.9256541, 0.8578734, -0.7790065, 1, 1, 1, 1, 1,
-0.924902, 0.4323235, 1.327225, 1, 1, 1, 1, 1,
-0.9231952, 0.6278011, -2.782186, 0, 0, 1, 1, 1,
-0.9209012, -0.2194537, -1.052713, 1, 0, 0, 1, 1,
-0.9157947, -0.02331296, -1.130118, 1, 0, 0, 1, 1,
-0.9131278, -0.1442996, -0.8573142, 1, 0, 0, 1, 1,
-0.8943906, -0.9411015, -3.461471, 1, 0, 0, 1, 1,
-0.8876038, -0.723605, -2.530774, 1, 0, 0, 1, 1,
-0.886021, 0.7061453, -3.035674, 0, 0, 0, 1, 1,
-0.885853, 0.9151765, -1.544631, 0, 0, 0, 1, 1,
-0.8775689, -0.005929388, -1.786063, 0, 0, 0, 1, 1,
-0.872822, -0.9395251, -2.264689, 0, 0, 0, 1, 1,
-0.8705546, -0.005861054, -2.670764, 0, 0, 0, 1, 1,
-0.8697233, -0.5292817, -1.971831, 0, 0, 0, 1, 1,
-0.8693517, -2.054427, -3.551995, 0, 0, 0, 1, 1,
-0.8673934, -1.284751, -3.739345, 1, 1, 1, 1, 1,
-0.8672511, -0.3606766, -3.090562, 1, 1, 1, 1, 1,
-0.8672403, 1.238464, -0.8723992, 1, 1, 1, 1, 1,
-0.8663942, 0.3538165, -0.4924649, 1, 1, 1, 1, 1,
-0.8656507, 0.1088386, -3.087814, 1, 1, 1, 1, 1,
-0.8619378, -0.01208413, -1.019985, 1, 1, 1, 1, 1,
-0.8563249, -0.425871, -1.360854, 1, 1, 1, 1, 1,
-0.8553567, -2.2804, -1.793297, 1, 1, 1, 1, 1,
-0.8552063, 0.6140587, -1.216663, 1, 1, 1, 1, 1,
-0.8449262, -0.3995092, -2.707365, 1, 1, 1, 1, 1,
-0.8427685, -1.337322, -2.55757, 1, 1, 1, 1, 1,
-0.839475, 0.4906993, 0.6367713, 1, 1, 1, 1, 1,
-0.8383296, -0.6527627, -3.08664, 1, 1, 1, 1, 1,
-0.8316675, 0.7286626, -0.3602513, 1, 1, 1, 1, 1,
-0.8308417, -0.707637, -1.755691, 1, 1, 1, 1, 1,
-0.8297803, 1.482439, 0.6150887, 0, 0, 1, 1, 1,
-0.8292972, -0.705736, -0.9904718, 1, 0, 0, 1, 1,
-0.824599, 0.3833306, -0.9057221, 1, 0, 0, 1, 1,
-0.8196375, -0.6120183, -4.757617, 1, 0, 0, 1, 1,
-0.8189798, -0.6445525, -2.868318, 1, 0, 0, 1, 1,
-0.8187304, 0.8787651, -1.268314, 1, 0, 0, 1, 1,
-0.8180503, -0.04398082, -2.34923, 0, 0, 0, 1, 1,
-0.8178493, 0.440554, -0.1353635, 0, 0, 0, 1, 1,
-0.8176082, 2.144572, 1.454583, 0, 0, 0, 1, 1,
-0.8147814, 1.370697, 0.5401568, 0, 0, 0, 1, 1,
-0.8091709, 0.7605639, -2.141886, 0, 0, 0, 1, 1,
-0.8069334, -0.04547098, -1.619602, 0, 0, 0, 1, 1,
-0.8035114, -0.4993724, -1.894105, 0, 0, 0, 1, 1,
-0.8003922, 0.3596576, -2.462787, 1, 1, 1, 1, 1,
-0.8000197, 0.8243311, -1.165584, 1, 1, 1, 1, 1,
-0.7829106, -1.20968, -1.934739, 1, 1, 1, 1, 1,
-0.7808914, 1.653259, 0.04413622, 1, 1, 1, 1, 1,
-0.7767031, 0.04704042, -0.2839813, 1, 1, 1, 1, 1,
-0.776361, -0.2129501, -1.556113, 1, 1, 1, 1, 1,
-0.776188, 0.09791234, -0.0258008, 1, 1, 1, 1, 1,
-0.7615105, -0.9269859, -2.531801, 1, 1, 1, 1, 1,
-0.761265, 0.1351829, -1.412923, 1, 1, 1, 1, 1,
-0.7585682, -0.1503417, -3.477295, 1, 1, 1, 1, 1,
-0.755046, -2.234019, -3.436183, 1, 1, 1, 1, 1,
-0.7550092, 2.022243, 1.171667, 1, 1, 1, 1, 1,
-0.7513092, -0.1237562, -1.908163, 1, 1, 1, 1, 1,
-0.7506726, -0.1318468, -2.594561, 1, 1, 1, 1, 1,
-0.7504539, -0.3891782, -2.467089, 1, 1, 1, 1, 1,
-0.7498818, -1.947176, -2.440737, 0, 0, 1, 1, 1,
-0.7471219, 0.5743616, -1.66276, 1, 0, 0, 1, 1,
-0.746337, -0.1001609, -1.989504, 1, 0, 0, 1, 1,
-0.7457395, -1.033206, -3.593231, 1, 0, 0, 1, 1,
-0.74254, 0.4455931, -1.771813, 1, 0, 0, 1, 1,
-0.7379658, 0.4688349, -0.239192, 1, 0, 0, 1, 1,
-0.7361778, 0.6983129, 0.8428101, 0, 0, 0, 1, 1,
-0.7348751, -0.3983434, -2.681509, 0, 0, 0, 1, 1,
-0.7177985, -0.1912142, -0.6063972, 0, 0, 0, 1, 1,
-0.7174539, 0.2606906, -1.552463, 0, 0, 0, 1, 1,
-0.7155985, -1.07098, -2.412317, 0, 0, 0, 1, 1,
-0.7117634, 0.441379, -1.276543, 0, 0, 0, 1, 1,
-0.6970583, 0.08448692, -0.2170423, 0, 0, 0, 1, 1,
-0.696216, -0.04113967, -1.461092, 1, 1, 1, 1, 1,
-0.6937909, 1.259255, -1.550641, 1, 1, 1, 1, 1,
-0.6911553, 0.3312308, -1.719923, 1, 1, 1, 1, 1,
-0.6902471, 2.132857, 0.5347578, 1, 1, 1, 1, 1,
-0.6866755, -0.1720124, -2.399894, 1, 1, 1, 1, 1,
-0.6826292, 0.4888206, -1.46898, 1, 1, 1, 1, 1,
-0.6815901, 0.7626147, -1.346598, 1, 1, 1, 1, 1,
-0.6744168, 0.6528749, 0.1663501, 1, 1, 1, 1, 1,
-0.6741834, -1.007853, -2.144249, 1, 1, 1, 1, 1,
-0.669542, 2.11844, 0.4794117, 1, 1, 1, 1, 1,
-0.6671821, 0.4186155, -0.6188734, 1, 1, 1, 1, 1,
-0.6653638, 1.163422, 0.4254644, 1, 1, 1, 1, 1,
-0.6627522, -0.4847403, -2.973675, 1, 1, 1, 1, 1,
-0.6599571, -1.273941, -3.157419, 1, 1, 1, 1, 1,
-0.6594818, -0.5443632, -1.550091, 1, 1, 1, 1, 1,
-0.6557945, 1.032411, -1.668157, 0, 0, 1, 1, 1,
-0.655525, -1.395278, -1.271679, 1, 0, 0, 1, 1,
-0.6544589, 2.186271, -0.1238947, 1, 0, 0, 1, 1,
-0.6505743, -1.151929, -1.702367, 1, 0, 0, 1, 1,
-0.6489322, -0.7703981, -2.637602, 1, 0, 0, 1, 1,
-0.6482073, 1.104939, -0.7853667, 1, 0, 0, 1, 1,
-0.646304, 0.2570479, 0.5959674, 0, 0, 0, 1, 1,
-0.6435039, 0.7368689, 0.4855593, 0, 0, 0, 1, 1,
-0.6343986, -0.4610755, -1.687993, 0, 0, 0, 1, 1,
-0.6311366, 0.4645585, -1.620508, 0, 0, 0, 1, 1,
-0.6301187, 1.02029, -2.273115, 0, 0, 0, 1, 1,
-0.6293462, 0.3954372, -0.7325144, 0, 0, 0, 1, 1,
-0.6257282, -0.6253447, -0.9829742, 0, 0, 0, 1, 1,
-0.6197819, -1.091165, -3.191065, 1, 1, 1, 1, 1,
-0.6190332, 0.5276727, -0.8178195, 1, 1, 1, 1, 1,
-0.617774, 0.242958, -0.3659244, 1, 1, 1, 1, 1,
-0.6055591, 0.3663138, -0.4149969, 1, 1, 1, 1, 1,
-0.6043782, 0.2508686, -1.258521, 1, 1, 1, 1, 1,
-0.6023347, -0.7359786, -3.225116, 1, 1, 1, 1, 1,
-0.6018123, 0.629572, 1.017343, 1, 1, 1, 1, 1,
-0.6015342, -0.03437359, -2.79449, 1, 1, 1, 1, 1,
-0.5994422, 0.2278595, -0.4015651, 1, 1, 1, 1, 1,
-0.5971248, 1.100064, -0.5019471, 1, 1, 1, 1, 1,
-0.588741, 0.08257323, -3.238028, 1, 1, 1, 1, 1,
-0.5768046, 1.871116, -0.137527, 1, 1, 1, 1, 1,
-0.5763038, -0.2454223, -1.044445, 1, 1, 1, 1, 1,
-0.5761621, 0.8273737, -0.5524971, 1, 1, 1, 1, 1,
-0.5753061, -0.8719743, -2.39826, 1, 1, 1, 1, 1,
-0.5744488, 0.5647087, -1.0427, 0, 0, 1, 1, 1,
-0.5702075, -1.564706, -1.994506, 1, 0, 0, 1, 1,
-0.5651931, 0.8069087, -1.515666, 1, 0, 0, 1, 1,
-0.5642288, 0.9100053, -0.9114997, 1, 0, 0, 1, 1,
-0.5617341, -0.235053, -1.330368, 1, 0, 0, 1, 1,
-0.559148, 0.4664267, -1.24515, 1, 0, 0, 1, 1,
-0.5536887, -0.187731, 0.2044591, 0, 0, 0, 1, 1,
-0.5469998, 0.7723058, -0.6330909, 0, 0, 0, 1, 1,
-0.5430928, -0.636437, -1.76759, 0, 0, 0, 1, 1,
-0.54183, -0.396121, -1.303792, 0, 0, 0, 1, 1,
-0.5374672, 0.9605649, -0.2925002, 0, 0, 0, 1, 1,
-0.5366213, -0.5140968, -3.130309, 0, 0, 0, 1, 1,
-0.5335371, -1.225799, -2.840744, 0, 0, 0, 1, 1,
-0.5333875, 0.2532651, -0.3970296, 1, 1, 1, 1, 1,
-0.5295822, 1.279543, -1.009623, 1, 1, 1, 1, 1,
-0.5277546, 0.6006604, 0.8782986, 1, 1, 1, 1, 1,
-0.5183668, -1.744744, -3.484454, 1, 1, 1, 1, 1,
-0.5142818, 0.3197696, -2.047337, 1, 1, 1, 1, 1,
-0.5135741, 1.864225, -1.421745, 1, 1, 1, 1, 1,
-0.507433, 1.202186, -0.9842651, 1, 1, 1, 1, 1,
-0.5029915, -0.5928382, -1.952599, 1, 1, 1, 1, 1,
-0.4985486, 0.3234731, -0.306848, 1, 1, 1, 1, 1,
-0.4964692, -1.24045, -2.289343, 1, 1, 1, 1, 1,
-0.4962553, 2.119367, 0.002890775, 1, 1, 1, 1, 1,
-0.4927555, -0.7991107, -2.873137, 1, 1, 1, 1, 1,
-0.4905617, -1.158747, -3.198401, 1, 1, 1, 1, 1,
-0.4905095, 0.2435132, 0.5666823, 1, 1, 1, 1, 1,
-0.4901699, 0.6459489, -1.008434, 1, 1, 1, 1, 1,
-0.48942, 0.3173505, -0.7272009, 0, 0, 1, 1, 1,
-0.488856, 0.4407626, -2.289522, 1, 0, 0, 1, 1,
-0.4869708, -0.2348484, -2.958793, 1, 0, 0, 1, 1,
-0.4829695, -0.3517248, -1.935613, 1, 0, 0, 1, 1,
-0.4809884, -1.061698, -3.818848, 1, 0, 0, 1, 1,
-0.4761272, 0.8385333, -0.4705956, 1, 0, 0, 1, 1,
-0.4711378, 0.3436972, 0.3276769, 0, 0, 0, 1, 1,
-0.4704595, 0.168943, 0.9320127, 0, 0, 0, 1, 1,
-0.4685181, -1.323638, -4.03153, 0, 0, 0, 1, 1,
-0.4680778, -0.03397054, -1.63044, 0, 0, 0, 1, 1,
-0.4658343, -1.288517, -3.085236, 0, 0, 0, 1, 1,
-0.4615459, -0.009947517, -2.151254, 0, 0, 0, 1, 1,
-0.4607765, -1.670442, -3.627796, 0, 0, 0, 1, 1,
-0.4606635, 0.8324038, -0.2604736, 1, 1, 1, 1, 1,
-0.4601648, 0.683762, -0.7465832, 1, 1, 1, 1, 1,
-0.4579566, -0.6560738, -2.060925, 1, 1, 1, 1, 1,
-0.4578718, 1.323661, -0.1823851, 1, 1, 1, 1, 1,
-0.4562872, 0.8297085, -1.834153, 1, 1, 1, 1, 1,
-0.4458588, 0.103234, -0.3052628, 1, 1, 1, 1, 1,
-0.4455648, -0.5969586, -0.5294778, 1, 1, 1, 1, 1,
-0.4442388, -2.168931, -4.361874, 1, 1, 1, 1, 1,
-0.4436373, 0.673013, -1.839293, 1, 1, 1, 1, 1,
-0.4430646, -0.2276168, -1.004852, 1, 1, 1, 1, 1,
-0.4425719, 0.6164227, -0.7870262, 1, 1, 1, 1, 1,
-0.4400189, -1.028607, -2.668327, 1, 1, 1, 1, 1,
-0.434755, 1.760875, -0.7515389, 1, 1, 1, 1, 1,
-0.4301135, 0.4920426, -1.399009, 1, 1, 1, 1, 1,
-0.4294999, 1.247139, -0.7508989, 1, 1, 1, 1, 1,
-0.4294173, -1.784239, -4.786314, 0, 0, 1, 1, 1,
-0.428379, 0.6394673, 1.347219, 1, 0, 0, 1, 1,
-0.4248903, -0.5305483, -2.368805, 1, 0, 0, 1, 1,
-0.4244654, -0.8145073, -2.690934, 1, 0, 0, 1, 1,
-0.4179337, 0.5388664, -0.8492752, 1, 0, 0, 1, 1,
-0.4119245, -1.814702, -1.910905, 1, 0, 0, 1, 1,
-0.4114222, 0.9990724, 0.7029417, 0, 0, 0, 1, 1,
-0.4080816, -0.8164797, -2.300017, 0, 0, 0, 1, 1,
-0.4064766, -1.225966, -1.935754, 0, 0, 0, 1, 1,
-0.4061076, -0.5851747, -1.838155, 0, 0, 0, 1, 1,
-0.4060421, -1.358696, -3.653919, 0, 0, 0, 1, 1,
-0.4053724, 0.5876592, 0.3302133, 0, 0, 0, 1, 1,
-0.4045989, 0.6374565, -1.90064, 0, 0, 0, 1, 1,
-0.4033073, 0.2375567, 0.3498003, 1, 1, 1, 1, 1,
-0.4032979, -0.3023117, -4.183405, 1, 1, 1, 1, 1,
-0.4026837, 1.037931, -0.6437486, 1, 1, 1, 1, 1,
-0.4003051, -0.6156471, -2.476213, 1, 1, 1, 1, 1,
-0.3988416, -0.001841994, -2.706579, 1, 1, 1, 1, 1,
-0.3947699, -0.6872705, -2.404983, 1, 1, 1, 1, 1,
-0.3945817, 0.7439138, -1.161876, 1, 1, 1, 1, 1,
-0.3935823, -0.5340492, -3.049265, 1, 1, 1, 1, 1,
-0.3922896, 1.403329, 0.3602534, 1, 1, 1, 1, 1,
-0.3867444, 0.06921503, -1.645626, 1, 1, 1, 1, 1,
-0.3819946, -0.2263338, -3.538725, 1, 1, 1, 1, 1,
-0.3819561, 0.88998, 0.5816439, 1, 1, 1, 1, 1,
-0.3798603, 0.5499383, 0.3941002, 1, 1, 1, 1, 1,
-0.3770243, 0.9578006, 1.350854, 1, 1, 1, 1, 1,
-0.373185, 0.2419074, -1.897175, 1, 1, 1, 1, 1,
-0.3730722, -1.342562, -2.599066, 0, 0, 1, 1, 1,
-0.3687568, 0.4822696, -0.09201596, 1, 0, 0, 1, 1,
-0.3674523, -0.05397042, -2.07728, 1, 0, 0, 1, 1,
-0.3662923, 0.8385814, -1.260743, 1, 0, 0, 1, 1,
-0.3652304, 0.2411266, -2.233716, 1, 0, 0, 1, 1,
-0.3582571, -0.1051866, -1.786613, 1, 0, 0, 1, 1,
-0.3549906, -0.9822019, -3.639318, 0, 0, 0, 1, 1,
-0.3549784, -1.431858, -2.908982, 0, 0, 0, 1, 1,
-0.3536987, 0.1760954, -1.793907, 0, 0, 0, 1, 1,
-0.3533973, 0.5346995, -0.3247037, 0, 0, 0, 1, 1,
-0.3518415, 0.2506703, -0.580868, 0, 0, 0, 1, 1,
-0.3512227, 1.943292, -0.3700325, 0, 0, 0, 1, 1,
-0.3507472, -0.3659044, -0.4812827, 0, 0, 0, 1, 1,
-0.3503726, -0.7359105, -4.52472, 1, 1, 1, 1, 1,
-0.3490406, -0.1253512, -3.402179, 1, 1, 1, 1, 1,
-0.3338847, 0.04503593, -1.485119, 1, 1, 1, 1, 1,
-0.3336413, 0.1573051, -0.7741666, 1, 1, 1, 1, 1,
-0.3326843, -0.08898981, -2.640863, 1, 1, 1, 1, 1,
-0.3179965, 0.05156619, -2.197275, 1, 1, 1, 1, 1,
-0.3084305, 0.3735937, -2.538974, 1, 1, 1, 1, 1,
-0.3051285, -0.5621714, -0.5065678, 1, 1, 1, 1, 1,
-0.3039883, 0.5982845, -0.4640009, 1, 1, 1, 1, 1,
-0.3021694, -0.2865482, -1.031103, 1, 1, 1, 1, 1,
-0.298252, -0.2504972, -1.74155, 1, 1, 1, 1, 1,
-0.2948912, 0.4511975, 0.1989601, 1, 1, 1, 1, 1,
-0.293398, -0.9629453, -2.620483, 1, 1, 1, 1, 1,
-0.2693232, 1.819306, 0.8997706, 1, 1, 1, 1, 1,
-0.2688077, 0.7198992, -1.054382, 1, 1, 1, 1, 1,
-0.268481, 1.335806, 0.9586053, 0, 0, 1, 1, 1,
-0.2678984, 0.3614976, -1.842206, 1, 0, 0, 1, 1,
-0.2674191, 0.7822602, -0.1909375, 1, 0, 0, 1, 1,
-0.267153, -1.659534, -1.793215, 1, 0, 0, 1, 1,
-0.2669812, -0.5065523, -2.612529, 1, 0, 0, 1, 1,
-0.2602136, -1.106349, -3.927088, 1, 0, 0, 1, 1,
-0.2527134, 0.2371379, -0.7680343, 0, 0, 0, 1, 1,
-0.2503691, -0.05726381, -1.1719, 0, 0, 0, 1, 1,
-0.2467985, -0.173275, -2.880016, 0, 0, 0, 1, 1,
-0.2467821, 0.0007718729, -1.339098, 0, 0, 0, 1, 1,
-0.2453593, 0.6683105, -0.6261019, 0, 0, 0, 1, 1,
-0.2322659, -0.8017786, -3.211203, 0, 0, 0, 1, 1,
-0.2317919, -0.9796298, -4.219186, 0, 0, 0, 1, 1,
-0.2308528, -0.8276039, -3.621567, 1, 1, 1, 1, 1,
-0.228875, 0.02812472, -2.555598, 1, 1, 1, 1, 1,
-0.228441, 0.2842007, -2.354702, 1, 1, 1, 1, 1,
-0.2268093, 0.8504379, -0.7766635, 1, 1, 1, 1, 1,
-0.2261979, -0.2587897, -3.443264, 1, 1, 1, 1, 1,
-0.2261748, 0.8186694, -0.7481816, 1, 1, 1, 1, 1,
-0.2233931, 0.9149076, 0.8705611, 1, 1, 1, 1, 1,
-0.22152, 0.1403478, -0.7462872, 1, 1, 1, 1, 1,
-0.2204283, 0.6564003, -1.32188, 1, 1, 1, 1, 1,
-0.2196448, 0.4632464, 0.7893556, 1, 1, 1, 1, 1,
-0.2176123, 0.4245073, 1.012719, 1, 1, 1, 1, 1,
-0.21006, 0.7723323, 0.4159105, 1, 1, 1, 1, 1,
-0.2072348, -0.5973106, -3.053908, 1, 1, 1, 1, 1,
-0.2060633, -0.3088261, -3.977902, 1, 1, 1, 1, 1,
-0.2060464, 1.11218, 0.006273566, 1, 1, 1, 1, 1,
-0.2022416, -0.7501942, -3.740668, 0, 0, 1, 1, 1,
-0.201506, -0.9443986, -4.401725, 1, 0, 0, 1, 1,
-0.1961687, -0.381547, -4.323884, 1, 0, 0, 1, 1,
-0.1931724, -0.3715432, -2.330304, 1, 0, 0, 1, 1,
-0.1885191, 0.5224861, 0.2200928, 1, 0, 0, 1, 1,
-0.1868896, -0.0291968, -2.60546, 1, 0, 0, 1, 1,
-0.1868077, -0.6420747, -3.379306, 0, 0, 0, 1, 1,
-0.182858, -1.563682, -4.821867, 0, 0, 0, 1, 1,
-0.1801012, -0.5219686, -4.1381, 0, 0, 0, 1, 1,
-0.1789977, -1.426511, -3.369911, 0, 0, 0, 1, 1,
-0.1765593, 2.117922, 0.8914301, 0, 0, 0, 1, 1,
-0.1760487, 0.3745619, 0.4157259, 0, 0, 0, 1, 1,
-0.1756449, -3.34724, -3.446659, 0, 0, 0, 1, 1,
-0.1710417, -0.53056, -1.964289, 1, 1, 1, 1, 1,
-0.1656268, 0.4952229, -0.3711595, 1, 1, 1, 1, 1,
-0.1558039, -0.3593684, -4.054084, 1, 1, 1, 1, 1,
-0.1543562, -1.205946, -1.884082, 1, 1, 1, 1, 1,
-0.1517973, -0.5246644, -3.055776, 1, 1, 1, 1, 1,
-0.1498351, 0.3754663, -0.5247564, 1, 1, 1, 1, 1,
-0.1483267, -0.5533184, -2.575592, 1, 1, 1, 1, 1,
-0.1465092, 0.6753183, -1.116032, 1, 1, 1, 1, 1,
-0.1448328, -1.189784, -2.209744, 1, 1, 1, 1, 1,
-0.1432819, 0.05235659, -0.3651755, 1, 1, 1, 1, 1,
-0.1421858, -0.1011802, -2.90761, 1, 1, 1, 1, 1,
-0.1378463, 0.6173864, 1.726933, 1, 1, 1, 1, 1,
-0.1378414, 1.398321, -0.6668204, 1, 1, 1, 1, 1,
-0.1362084, 0.478891, -1.167269, 1, 1, 1, 1, 1,
-0.1355974, 2.533659, -1.368199, 1, 1, 1, 1, 1,
-0.131587, 0.2463892, 0.5197543, 0, 0, 1, 1, 1,
-0.128034, 0.5559254, -1.066021, 1, 0, 0, 1, 1,
-0.1243329, 0.305418, -0.236363, 1, 0, 0, 1, 1,
-0.1222353, 0.1745456, -0.6084792, 1, 0, 0, 1, 1,
-0.12147, -1.832797, -2.1147, 1, 0, 0, 1, 1,
-0.1207136, 0.3290168, -1.32912, 1, 0, 0, 1, 1,
-0.1171251, 0.6051519, -1.913297, 0, 0, 0, 1, 1,
-0.1154177, 1.215918, 1.01514, 0, 0, 0, 1, 1,
-0.1138172, -0.6624264, -2.00065, 0, 0, 0, 1, 1,
-0.1115011, -0.7871279, -4.326866, 0, 0, 0, 1, 1,
-0.1060858, 0.4712873, -1.296067, 0, 0, 0, 1, 1,
-0.1055363, 0.09336475, -0.80621, 0, 0, 0, 1, 1,
-0.1048772, -0.4753539, -1.1536, 0, 0, 0, 1, 1,
-0.1042042, -0.4346172, -3.524338, 1, 1, 1, 1, 1,
-0.100914, -0.2611178, -4.020667, 1, 1, 1, 1, 1,
-0.08689269, 0.1772752, 0.6380622, 1, 1, 1, 1, 1,
-0.086768, -0.5803154, -1.558712, 1, 1, 1, 1, 1,
-0.08615788, 0.7195258, 0.7738063, 1, 1, 1, 1, 1,
-0.08307479, 1.098789, 1.001844, 1, 1, 1, 1, 1,
-0.07273811, 0.6561017, -0.0832259, 1, 1, 1, 1, 1,
-0.07203949, -1.183503, -3.276404, 1, 1, 1, 1, 1,
-0.07043394, 1.325118, -1.050574, 1, 1, 1, 1, 1,
-0.07020435, 1.261984, 0.8040408, 1, 1, 1, 1, 1,
-0.06588408, -1.771573, -3.031064, 1, 1, 1, 1, 1,
-0.05587691, -0.7179608, -3.568857, 1, 1, 1, 1, 1,
-0.05093131, -0.1426166, -2.426097, 1, 1, 1, 1, 1,
-0.03579783, -1.895151, -2.461949, 1, 1, 1, 1, 1,
-0.0352371, -0.3737579, -2.613516, 1, 1, 1, 1, 1,
-0.03322686, -0.1387351, -2.153437, 0, 0, 1, 1, 1,
-0.02857197, -0.7176114, -2.347226, 1, 0, 0, 1, 1,
-0.02808272, -0.7109448, -1.733569, 1, 0, 0, 1, 1,
-0.02728238, -1.361537, -3.498374, 1, 0, 0, 1, 1,
-0.02574012, -2.360664, -4.219775, 1, 0, 0, 1, 1,
-0.02496692, -0.1552206, -2.443732, 1, 0, 0, 1, 1,
-0.01802313, 0.3474745, 2.040323, 0, 0, 0, 1, 1,
-0.01755217, 1.039137, -2.109484, 0, 0, 0, 1, 1,
-0.01390827, -1.682203, -3.139185, 0, 0, 0, 1, 1,
-0.01185134, -1.172962, -2.359012, 0, 0, 0, 1, 1,
-0.009492388, 0.3402037, -0.7425445, 0, 0, 0, 1, 1,
-0.009025056, -0.005161378, -2.107396, 0, 0, 0, 1, 1,
-0.004919124, 0.4850247, 0.7006677, 0, 0, 0, 1, 1,
0.008896927, 1.629686, -1.610929, 1, 1, 1, 1, 1,
0.009295863, 0.6513118, -0.9271177, 1, 1, 1, 1, 1,
0.01058678, 0.2191586, 0.1802818, 1, 1, 1, 1, 1,
0.01475587, 1.464111, 1.278097, 1, 1, 1, 1, 1,
0.01947238, 0.3434823, 0.9313771, 1, 1, 1, 1, 1,
0.02168432, -0.707304, 3.902065, 1, 1, 1, 1, 1,
0.02207558, -0.04139297, 2.29776, 1, 1, 1, 1, 1,
0.0226741, 0.6432241, 0.9515219, 1, 1, 1, 1, 1,
0.02427862, -1.24173, 3.917429, 1, 1, 1, 1, 1,
0.02661813, -0.3345691, 4.266907, 1, 1, 1, 1, 1,
0.02740811, -0.5200191, 4.415631, 1, 1, 1, 1, 1,
0.02780568, -1.076134, 1.87717, 1, 1, 1, 1, 1,
0.02970307, -1.361605, 4.697778, 1, 1, 1, 1, 1,
0.02998516, -1.009243, 5.374675, 1, 1, 1, 1, 1,
0.03114309, -1.765379, 3.950607, 1, 1, 1, 1, 1,
0.03194879, -1.019543, 2.457219, 0, 0, 1, 1, 1,
0.03391403, -0.6582218, 1.989088, 1, 0, 0, 1, 1,
0.03945611, 0.03462217, 0.007890903, 1, 0, 0, 1, 1,
0.04504594, 1.196974, 0.08234735, 1, 0, 0, 1, 1,
0.04666946, -0.6683791, 3.290524, 1, 0, 0, 1, 1,
0.04733016, -0.1661662, 2.802478, 1, 0, 0, 1, 1,
0.04898673, 0.9622226, -0.2177902, 0, 0, 0, 1, 1,
0.04997164, 0.4576929, -1.013459, 0, 0, 0, 1, 1,
0.05105215, -1.105928, 3.669161, 0, 0, 0, 1, 1,
0.0522394, 1.561803, -0.9246441, 0, 0, 0, 1, 1,
0.05364172, 1.401348, -0.08999138, 0, 0, 0, 1, 1,
0.05485055, -0.1838245, 2.376371, 0, 0, 0, 1, 1,
0.05496234, 0.9587936, -1.556571, 0, 0, 0, 1, 1,
0.05930523, 1.398837, 0.2853242, 1, 1, 1, 1, 1,
0.05954726, -0.4631464, 3.261852, 1, 1, 1, 1, 1,
0.06332168, -1.607341, 2.741607, 1, 1, 1, 1, 1,
0.06668196, 1.150654, -0.09876534, 1, 1, 1, 1, 1,
0.06959125, 0.4341042, 0.2189652, 1, 1, 1, 1, 1,
0.06964211, 0.4485873, 1.181813, 1, 1, 1, 1, 1,
0.07172529, -0.5956472, 2.898399, 1, 1, 1, 1, 1,
0.07189612, -0.8626367, 2.272463, 1, 1, 1, 1, 1,
0.07673565, -0.001237615, 2.707024, 1, 1, 1, 1, 1,
0.08057255, 0.1426859, -0.9012753, 1, 1, 1, 1, 1,
0.08496652, 0.2627628, 0.994954, 1, 1, 1, 1, 1,
0.08638757, 0.5248176, 1.805903, 1, 1, 1, 1, 1,
0.08707935, -1.81498, 2.475917, 1, 1, 1, 1, 1,
0.08816982, 1.305393, 1.03605, 1, 1, 1, 1, 1,
0.08946645, 1.391347, 1.350446, 1, 1, 1, 1, 1,
0.09756704, -1.101901, 4.2427, 0, 0, 1, 1, 1,
0.09757991, 0.08595183, 0.3290418, 1, 0, 0, 1, 1,
0.09758949, 0.4305356, 0.6309844, 1, 0, 0, 1, 1,
0.09848353, 0.1723663, -0.9049079, 1, 0, 0, 1, 1,
0.1029521, 0.3447112, 0.1363174, 1, 0, 0, 1, 1,
0.1058517, 0.4992134, 1.716588, 1, 0, 0, 1, 1,
0.1071829, -1.311745, 4.217606, 0, 0, 0, 1, 1,
0.1089431, -2.143463, 3.376796, 0, 0, 0, 1, 1,
0.1090076, 0.4376221, -0.7891771, 0, 0, 0, 1, 1,
0.1124426, 1.237348, 0.86948, 0, 0, 0, 1, 1,
0.1143923, -1.067634, 0.7893273, 0, 0, 0, 1, 1,
0.115576, -1.211635, 2.061805, 0, 0, 0, 1, 1,
0.117019, -0.4650577, 3.20075, 0, 0, 0, 1, 1,
0.1236931, 1.379768, 0.318886, 1, 1, 1, 1, 1,
0.1270248, -0.1705213, 2.24882, 1, 1, 1, 1, 1,
0.1278224, -0.4729708, 2.528772, 1, 1, 1, 1, 1,
0.1293202, 1.595934, -1.336861, 1, 1, 1, 1, 1,
0.1299391, 0.808798, 0.06470542, 1, 1, 1, 1, 1,
0.1316794, 0.1101886, 1.555217, 1, 1, 1, 1, 1,
0.1324715, -1.215179, 4.275683, 1, 1, 1, 1, 1,
0.1339088, -0.8482828, 3.161616, 1, 1, 1, 1, 1,
0.1369931, -1.692142, 3.391549, 1, 1, 1, 1, 1,
0.1374071, -1.40078, 4.492562, 1, 1, 1, 1, 1,
0.1376841, 1.426452, 0.5791738, 1, 1, 1, 1, 1,
0.1385653, 0.7929243, 0.6292555, 1, 1, 1, 1, 1,
0.1401294, -0.1178211, 2.315381, 1, 1, 1, 1, 1,
0.1481346, 1.987585, 1.326765, 1, 1, 1, 1, 1,
0.1484317, -0.2988506, 0.5478925, 1, 1, 1, 1, 1,
0.1494812, 0.4297269, 0.5641961, 0, 0, 1, 1, 1,
0.1503789, -0.01619486, 2.208967, 1, 0, 0, 1, 1,
0.1507577, 0.7349494, 0.4430611, 1, 0, 0, 1, 1,
0.1523527, 0.7111191, 0.2517879, 1, 0, 0, 1, 1,
0.1538076, -0.99783, 2.048145, 1, 0, 0, 1, 1,
0.155434, -0.03805828, 1.114445, 1, 0, 0, 1, 1,
0.1567427, -0.111367, 2.056034, 0, 0, 0, 1, 1,
0.1575695, 0.04077855, 1.870562, 0, 0, 0, 1, 1,
0.1578031, 0.2540807, 1.634533, 0, 0, 0, 1, 1,
0.1597676, -0.6416036, 3.111605, 0, 0, 0, 1, 1,
0.1600979, -2.178495, 3.948083, 0, 0, 0, 1, 1,
0.1655677, -0.3116582, 2.556285, 0, 0, 0, 1, 1,
0.1676201, -0.02708942, 3.517231, 0, 0, 0, 1, 1,
0.169423, 0.6733444, 1.503504, 1, 1, 1, 1, 1,
0.1699197, -1.923794, 2.378674, 1, 1, 1, 1, 1,
0.1699447, 0.1541896, 0.9917831, 1, 1, 1, 1, 1,
0.1785485, 0.5983819, 0.8549138, 1, 1, 1, 1, 1,
0.1824676, 0.2815274, 0.9678307, 1, 1, 1, 1, 1,
0.1877823, -0.3784742, 1.921006, 1, 1, 1, 1, 1,
0.1903388, -0.5898484, 1.769454, 1, 1, 1, 1, 1,
0.1948083, 1.30614, 0.239531, 1, 1, 1, 1, 1,
0.195433, 0.6010876, -0.02460367, 1, 1, 1, 1, 1,
0.1954945, 0.9327372, -0.9590204, 1, 1, 1, 1, 1,
0.1956039, 0.9417548, 0.4731295, 1, 1, 1, 1, 1,
0.2018069, 1.127542, -0.6404526, 1, 1, 1, 1, 1,
0.2028939, 0.9988731, -0.462108, 1, 1, 1, 1, 1,
0.2030517, -0.2453367, 3.034246, 1, 1, 1, 1, 1,
0.2046528, -0.2359277, 1.887846, 1, 1, 1, 1, 1,
0.2069119, 0.2229097, 1.453249, 0, 0, 1, 1, 1,
0.2081143, -0.464653, 2.9279, 1, 0, 0, 1, 1,
0.2088511, -0.5357333, 2.804408, 1, 0, 0, 1, 1,
0.2094317, -0.3742705, 2.417654, 1, 0, 0, 1, 1,
0.2133469, 2.011237, -0.8677598, 1, 0, 0, 1, 1,
0.2172684, 0.05373628, 1.082403, 1, 0, 0, 1, 1,
0.2190517, 0.7421772, 2.45453, 0, 0, 0, 1, 1,
0.2227186, -1.059838, 2.792475, 0, 0, 0, 1, 1,
0.2232623, 1.067687, -0.08254295, 0, 0, 0, 1, 1,
0.2269158, 1.626628, -0.5863977, 0, 0, 0, 1, 1,
0.2270479, -0.1606615, 0.2592901, 0, 0, 0, 1, 1,
0.2282698, -1.577384, 1.935226, 0, 0, 0, 1, 1,
0.2364113, 0.3217665, 0.1703487, 0, 0, 0, 1, 1,
0.2377878, -0.4871333, 2.170633, 1, 1, 1, 1, 1,
0.2476452, 0.5864009, 0.8697777, 1, 1, 1, 1, 1,
0.2487051, 0.01108868, 3.344985, 1, 1, 1, 1, 1,
0.2517882, -0.2018754, 3.165118, 1, 1, 1, 1, 1,
0.256226, -0.5025352, 3.738994, 1, 1, 1, 1, 1,
0.258128, 0.5270836, -0.4221494, 1, 1, 1, 1, 1,
0.2588852, 1.113698, -0.05356255, 1, 1, 1, 1, 1,
0.2603368, -0.8842449, 1.947968, 1, 1, 1, 1, 1,
0.2610108, -1.772906, 4.342898, 1, 1, 1, 1, 1,
0.2659616, 1.182782, -0.03698005, 1, 1, 1, 1, 1,
0.2678977, -1.290983, 4.704079, 1, 1, 1, 1, 1,
0.2703608, -1.453978, 1.233181, 1, 1, 1, 1, 1,
0.2713233, 0.8897617, -0.9935364, 1, 1, 1, 1, 1,
0.2724251, -0.4353684, 3.627038, 1, 1, 1, 1, 1,
0.2725062, 0.5183259, -0.2558231, 1, 1, 1, 1, 1,
0.2783696, 1.004653, -2.075875, 0, 0, 1, 1, 1,
0.2783728, -0.8360018, 3.089899, 1, 0, 0, 1, 1,
0.2826122, -1.970285, 2.370114, 1, 0, 0, 1, 1,
0.2859557, 0.5720026, 0.3001517, 1, 0, 0, 1, 1,
0.2860204, 0.520663, 1.221963, 1, 0, 0, 1, 1,
0.2920695, -0.2090507, 2.856288, 1, 0, 0, 1, 1,
0.295576, 0.3370708, 0.655803, 0, 0, 0, 1, 1,
0.2964701, 0.066682, 2.213623, 0, 0, 0, 1, 1,
0.3043852, -0.01885374, 1.999043, 0, 0, 0, 1, 1,
0.3166758, 0.6705996, -1.464795, 0, 0, 0, 1, 1,
0.317203, 0.01884701, 1.432044, 0, 0, 0, 1, 1,
0.3188914, 0.1230272, 0.7035449, 0, 0, 0, 1, 1,
0.3234172, 0.285578, 1.535046, 0, 0, 0, 1, 1,
0.3272667, -2.067014, 4.182882, 1, 1, 1, 1, 1,
0.3292854, -0.4825168, 3.412914, 1, 1, 1, 1, 1,
0.3299746, 1.047697, 0.06877951, 1, 1, 1, 1, 1,
0.33585, -0.4852089, 1.407751, 1, 1, 1, 1, 1,
0.3390696, 1.508307, 0.5033664, 1, 1, 1, 1, 1,
0.339469, -0.7125823, 1.260768, 1, 1, 1, 1, 1,
0.3402624, -0.07656124, 2.815952, 1, 1, 1, 1, 1,
0.3404195, 0.547435, 1.167957, 1, 1, 1, 1, 1,
0.3493209, -1.494278, 2.67155, 1, 1, 1, 1, 1,
0.3587343, 0.9911225, 0.3033533, 1, 1, 1, 1, 1,
0.3590651, 1.319197, 0.8428299, 1, 1, 1, 1, 1,
0.3615199, -0.1755953, 0.7654275, 1, 1, 1, 1, 1,
0.3642593, 0.8734417, -0.7281959, 1, 1, 1, 1, 1,
0.3674829, 1.57187, 0.9247303, 1, 1, 1, 1, 1,
0.3693369, -0.5433122, 2.159884, 1, 1, 1, 1, 1,
0.3697822, 1.248726, -0.6571398, 0, 0, 1, 1, 1,
0.3751321, -0.2278398, 2.790744, 1, 0, 0, 1, 1,
0.3812728, -0.1201109, 2.437822, 1, 0, 0, 1, 1,
0.3826657, -1.006747, 3.926965, 1, 0, 0, 1, 1,
0.3846909, 0.3050173, 0.7302105, 1, 0, 0, 1, 1,
0.3859077, 1.716958, 0.1100919, 1, 0, 0, 1, 1,
0.3906431, -0.05709282, 2.206635, 0, 0, 0, 1, 1,
0.3910002, -0.4794468, 0.5498292, 0, 0, 0, 1, 1,
0.3919183, 0.2550374, 0.3759439, 0, 0, 0, 1, 1,
0.3921627, 0.8574041, 2.059845, 0, 0, 0, 1, 1,
0.3938583, -1.204878, 4.001333, 0, 0, 0, 1, 1,
0.3979428, 0.19892, 0.5811812, 0, 0, 0, 1, 1,
0.398849, 0.1005967, 0.003370126, 0, 0, 0, 1, 1,
0.4016253, -1.484306, 1.754594, 1, 1, 1, 1, 1,
0.4056646, 0.6841969, 0.4800987, 1, 1, 1, 1, 1,
0.4085408, -0.3752669, 2.175994, 1, 1, 1, 1, 1,
0.4190099, 0.5861847, -0.8131294, 1, 1, 1, 1, 1,
0.4224545, 2.091622, 1.811353, 1, 1, 1, 1, 1,
0.4296471, -0.09834506, 1.667951, 1, 1, 1, 1, 1,
0.4338389, -1.94065, 3.856923, 1, 1, 1, 1, 1,
0.4364138, 0.1408437, 0.9772518, 1, 1, 1, 1, 1,
0.4372835, 1.681677, 1.595796, 1, 1, 1, 1, 1,
0.4379643, -1.395533, 3.159672, 1, 1, 1, 1, 1,
0.4412311, -1.065483, 2.902816, 1, 1, 1, 1, 1,
0.4432261, -0.3457432, 1.807413, 1, 1, 1, 1, 1,
0.4467368, 0.9091582, 2.033296, 1, 1, 1, 1, 1,
0.4494135, -0.2286724, 3.13681, 1, 1, 1, 1, 1,
0.450089, 0.2772781, 0.7933128, 1, 1, 1, 1, 1,
0.4510049, 0.488649, 1.205535, 0, 0, 1, 1, 1,
0.4530969, 1.555644, 1.271293, 1, 0, 0, 1, 1,
0.45515, -0.3078102, 2.749177, 1, 0, 0, 1, 1,
0.4566026, -0.4845239, 2.822384, 1, 0, 0, 1, 1,
0.4575409, 0.4157846, 1.39452, 1, 0, 0, 1, 1,
0.4577739, -0.3348965, 1.6127, 1, 0, 0, 1, 1,
0.458281, -0.6978256, 1.716903, 0, 0, 0, 1, 1,
0.4597549, -0.01353942, 0.7461092, 0, 0, 0, 1, 1,
0.4599122, -0.03728358, 1.091084, 0, 0, 0, 1, 1,
0.4604598, 1.351062, 0.08546913, 0, 0, 0, 1, 1,
0.4630925, 0.2659455, 0.7162781, 0, 0, 0, 1, 1,
0.4660881, 1.078296, 0.7945309, 0, 0, 0, 1, 1,
0.4677565, -0.9590154, 1.916719, 0, 0, 0, 1, 1,
0.4703723, 0.6882231, 0.4942755, 1, 1, 1, 1, 1,
0.4736344, 1.184973, -0.1521298, 1, 1, 1, 1, 1,
0.4770238, 1.106727, 0.176694, 1, 1, 1, 1, 1,
0.486263, 1.086013, -0.8996115, 1, 1, 1, 1, 1,
0.4920538, -0.4146537, 2.128433, 1, 1, 1, 1, 1,
0.4953529, -0.2485079, 2.014033, 1, 1, 1, 1, 1,
0.4967162, 0.8899121, 0.4768371, 1, 1, 1, 1, 1,
0.4994526, 0.84666, -1.994119, 1, 1, 1, 1, 1,
0.4996129, -1.035883, 2.236762, 1, 1, 1, 1, 1,
0.5004983, 0.430452, 1.386263, 1, 1, 1, 1, 1,
0.5025004, -0.4670556, 2.533072, 1, 1, 1, 1, 1,
0.5129696, 0.9754421, 1.588237, 1, 1, 1, 1, 1,
0.5171003, -2.218569, 3.293567, 1, 1, 1, 1, 1,
0.5191128, 0.6375071, 0.7880115, 1, 1, 1, 1, 1,
0.5243336, 0.6487618, 0.3002677, 1, 1, 1, 1, 1,
0.527131, 0.6438684, 0.6536333, 0, 0, 1, 1, 1,
0.5287127, 0.8031313, 1.589176, 1, 0, 0, 1, 1,
0.5288743, 2.115308, -0.9162533, 1, 0, 0, 1, 1,
0.5314627, 0.2852092, 1.44, 1, 0, 0, 1, 1,
0.5413847, -0.3717247, 0.1929381, 1, 0, 0, 1, 1,
0.5449399, -1.739592, 2.834419, 1, 0, 0, 1, 1,
0.5451752, 1.489886, 0.8357643, 0, 0, 0, 1, 1,
0.5483133, 0.66957, 1.114021, 0, 0, 0, 1, 1,
0.550028, 0.2231399, 1.171323, 0, 0, 0, 1, 1,
0.5594662, -1.369689, 1.385114, 0, 0, 0, 1, 1,
0.5607255, 1.367861, 0.09442751, 0, 0, 0, 1, 1,
0.5666232, 2.810843, -0.686164, 0, 0, 0, 1, 1,
0.5683092, -0.4406208, 2.578402, 0, 0, 0, 1, 1,
0.5723793, 1.37024, -1.193628, 1, 1, 1, 1, 1,
0.5724899, 0.3563355, 1.029764, 1, 1, 1, 1, 1,
0.5733807, -0.5724535, 3.321391, 1, 1, 1, 1, 1,
0.574922, -0.9459532, 2.890901, 1, 1, 1, 1, 1,
0.5779653, 0.1921012, 3.047685, 1, 1, 1, 1, 1,
0.5786305, 1.42144, 0.1067583, 1, 1, 1, 1, 1,
0.5798665, 0.6032678, -0.8016757, 1, 1, 1, 1, 1,
0.5832239, 0.03637234, 0.01198944, 1, 1, 1, 1, 1,
0.5854672, 0.3845072, 1.692244, 1, 1, 1, 1, 1,
0.586483, 0.7055497, 1.509641, 1, 1, 1, 1, 1,
0.5907188, 0.508277, -0.1882332, 1, 1, 1, 1, 1,
0.5921199, 0.9983625, 2.019447, 1, 1, 1, 1, 1,
0.603034, -1.244399, 2.057043, 1, 1, 1, 1, 1,
0.6039785, -1.931108, 3.349075, 1, 1, 1, 1, 1,
0.6079725, 0.4008665, 1.103357, 1, 1, 1, 1, 1,
0.6082819, 0.8905353, -0.4141424, 0, 0, 1, 1, 1,
0.6140509, -0.6577442, 3.598619, 1, 0, 0, 1, 1,
0.619152, 1.676404, 0.169395, 1, 0, 0, 1, 1,
0.6202632, -0.4161425, 1.547378, 1, 0, 0, 1, 1,
0.6202891, 0.2708561, -0.003510162, 1, 0, 0, 1, 1,
0.622551, 0.8570495, 0.5531412, 1, 0, 0, 1, 1,
0.632336, -0.08420574, 2.797755, 0, 0, 0, 1, 1,
0.6330788, -0.03718363, 0.1024582, 0, 0, 0, 1, 1,
0.6334491, 0.3223526, 0.2994559, 0, 0, 0, 1, 1,
0.6394343, 0.4466664, 0.696697, 0, 0, 0, 1, 1,
0.642356, 1.010482, 0.04418252, 0, 0, 0, 1, 1,
0.6453431, -0.6384972, 2.510189, 0, 0, 0, 1, 1,
0.6564162, 2.609443, -1.177217, 0, 0, 0, 1, 1,
0.6576185, -0.9474574, 0.6697027, 1, 1, 1, 1, 1,
0.658449, -0.2686639, 1.358914, 1, 1, 1, 1, 1,
0.6591052, 1.849231, -0.8834153, 1, 1, 1, 1, 1,
0.661024, -0.677487, 2.327921, 1, 1, 1, 1, 1,
0.6621678, 0.3431049, 2.096703, 1, 1, 1, 1, 1,
0.6632077, -0.1271064, 0.6385425, 1, 1, 1, 1, 1,
0.6643154, -0.8128409, 2.188043, 1, 1, 1, 1, 1,
0.6679567, -0.0978348, 1.430489, 1, 1, 1, 1, 1,
0.6697197, 1.013512, 1.164068, 1, 1, 1, 1, 1,
0.6697876, -0.8316582, 3.660493, 1, 1, 1, 1, 1,
0.6700727, -1.344714, 4.362049, 1, 1, 1, 1, 1,
0.6732371, -0.7395941, 2.511378, 1, 1, 1, 1, 1,
0.6738436, -0.6147509, 2.270831, 1, 1, 1, 1, 1,
0.6745116, 0.31811, 2.053893, 1, 1, 1, 1, 1,
0.6784709, -0.3649685, 2.582155, 1, 1, 1, 1, 1,
0.6809594, -0.1325124, 0.6780923, 0, 0, 1, 1, 1,
0.6811525, -1.890988, 4.070316, 1, 0, 0, 1, 1,
0.6842093, 1.355721, 1.539578, 1, 0, 0, 1, 1,
0.6844544, 1.753281, 0.496134, 1, 0, 0, 1, 1,
0.6880408, 0.4286298, 1.419592, 1, 0, 0, 1, 1,
0.6909428, 0.07109085, 0.05295317, 1, 0, 0, 1, 1,
0.6914011, -2.244182, 1.810635, 0, 0, 0, 1, 1,
0.6914297, -1.616936, 2.932044, 0, 0, 0, 1, 1,
0.6965655, 0.5225693, -0.9103387, 0, 0, 0, 1, 1,
0.6990941, 0.9968085, 2.143378, 0, 0, 0, 1, 1,
0.7002464, -0.3040459, 2.901798, 0, 0, 0, 1, 1,
0.7029383, -0.3956411, 2.433743, 0, 0, 0, 1, 1,
0.7088643, -0.7681682, 2.383697, 0, 0, 0, 1, 1,
0.7094756, 0.08201602, 0.8499106, 1, 1, 1, 1, 1,
0.7148397, -0.4621614, 2.026058, 1, 1, 1, 1, 1,
0.7164205, -1.850318, 3.186949, 1, 1, 1, 1, 1,
0.7165549, 0.8816774, 1.553757, 1, 1, 1, 1, 1,
0.7180735, 0.6228678, 2.105932, 1, 1, 1, 1, 1,
0.7291961, -0.6038323, 1.921317, 1, 1, 1, 1, 1,
0.7317023, -1.316605, 3.071866, 1, 1, 1, 1, 1,
0.7318189, 0.230439, 1.357606, 1, 1, 1, 1, 1,
0.741631, -0.196098, 2.705658, 1, 1, 1, 1, 1,
0.7420679, -0.4760226, 0.9380953, 1, 1, 1, 1, 1,
0.7462121, 1.684831, -0.6399958, 1, 1, 1, 1, 1,
0.7472985, 0.9850006, 0.8582473, 1, 1, 1, 1, 1,
0.7518524, -0.4781285, 2.058202, 1, 1, 1, 1, 1,
0.7586612, 1.445505, 0.02004041, 1, 1, 1, 1, 1,
0.7587364, 1.193002, 0.6969897, 1, 1, 1, 1, 1,
0.7597652, 0.4526268, -0.5912684, 0, 0, 1, 1, 1,
0.7603925, -3.440067, 4.470617, 1, 0, 0, 1, 1,
0.7657648, 0.5914957, 0.5780137, 1, 0, 0, 1, 1,
0.7678303, -0.7292907, 1.348156, 1, 0, 0, 1, 1,
0.7702324, 1.027899, 1.016433, 1, 0, 0, 1, 1,
0.7708421, -0.5456961, 2.421676, 1, 0, 0, 1, 1,
0.7726306, 1.040782, -0.03052134, 0, 0, 0, 1, 1,
0.773423, 0.9822255, -1.234204, 0, 0, 0, 1, 1,
0.7764405, 1.250053, -0.6294824, 0, 0, 0, 1, 1,
0.7771387, -0.2182345, 1.400315, 0, 0, 0, 1, 1,
0.7797183, 0.4157356, 1.483705, 0, 0, 0, 1, 1,
0.783367, -0.6244192, 2.487678, 0, 0, 0, 1, 1,
0.7854153, -1.529425, 3.607088, 0, 0, 0, 1, 1,
0.7869889, 1.51775, -0.2430929, 1, 1, 1, 1, 1,
0.795078, -0.3386267, 1.276768, 1, 1, 1, 1, 1,
0.7988351, -0.2490634, 1.764737, 1, 1, 1, 1, 1,
0.8146409, 0.3449283, 1.556655, 1, 1, 1, 1, 1,
0.8154122, 1.651772, 1.798378, 1, 1, 1, 1, 1,
0.8181592, -1.715698, 2.820256, 1, 1, 1, 1, 1,
0.8228412, 0.6759967, 3.4482, 1, 1, 1, 1, 1,
0.824484, 0.894128, -0.5718007, 1, 1, 1, 1, 1,
0.8294407, 0.01697757, 2.360798, 1, 1, 1, 1, 1,
0.8343511, 1.355413, 1.440397, 1, 1, 1, 1, 1,
0.8351834, 0.2012278, 1.406805, 1, 1, 1, 1, 1,
0.8352068, 2.527887, -1.026363, 1, 1, 1, 1, 1,
0.8424461, 1.225299, 1.424338, 1, 1, 1, 1, 1,
0.8513551, -0.4444363, 2.212482, 1, 1, 1, 1, 1,
0.8514064, -0.8943193, 1.678746, 1, 1, 1, 1, 1,
0.8595219, 1.78211, -0.551401, 0, 0, 1, 1, 1,
0.8620746, -0.5473012, 0.6068705, 1, 0, 0, 1, 1,
0.8628834, 0.2228464, 0.8919544, 1, 0, 0, 1, 1,
0.8646002, 1.006489, -0.2666142, 1, 0, 0, 1, 1,
0.8653609, 0.230822, 1.185618, 1, 0, 0, 1, 1,
0.8810589, -0.1403416, -0.03267772, 1, 0, 0, 1, 1,
0.882489, 0.3190849, -1.013286, 0, 0, 0, 1, 1,
0.8862833, 2.009961, 0.2568209, 0, 0, 0, 1, 1,
0.8878436, 1.15102, -0.6710864, 0, 0, 0, 1, 1,
0.8908907, 0.2368446, 0.5579802, 0, 0, 0, 1, 1,
0.8972728, 0.9242287, 0.6032045, 0, 0, 0, 1, 1,
0.8979241, -1.276969, 2.751309, 0, 0, 0, 1, 1,
0.9008465, -0.2371355, 2.526425, 0, 0, 0, 1, 1,
0.9118034, -0.3498478, -0.02793841, 1, 1, 1, 1, 1,
0.9195507, 0.7602776, 0.1104192, 1, 1, 1, 1, 1,
0.9231802, -0.12808, 2.49423, 1, 1, 1, 1, 1,
0.929066, 0.8288673, 1.190063, 1, 1, 1, 1, 1,
0.9325371, -1.294627, 2.147377, 1, 1, 1, 1, 1,
0.9343042, 0.6368616, 0.651198, 1, 1, 1, 1, 1,
0.9356585, 0.5375062, 1.030793, 1, 1, 1, 1, 1,
0.9459872, -2.040879, 2.350322, 1, 1, 1, 1, 1,
0.9553949, 1.128036, -0.5571532, 1, 1, 1, 1, 1,
0.9561809, 0.602563, 0.912182, 1, 1, 1, 1, 1,
0.9590635, -0.5647834, 3.286906, 1, 1, 1, 1, 1,
0.9592863, 0.6518631, 1.19349, 1, 1, 1, 1, 1,
0.9594984, 0.6985604, -0.2809174, 1, 1, 1, 1, 1,
0.9614365, -1.12946, 2.666449, 1, 1, 1, 1, 1,
0.9616656, 0.5432602, 1.662367, 1, 1, 1, 1, 1,
0.9660769, 0.481212, 0.9522261, 0, 0, 1, 1, 1,
0.9664009, 0.2907583, 0.5694979, 1, 0, 0, 1, 1,
0.9770561, 0.8618724, 1.557677, 1, 0, 0, 1, 1,
0.9782468, -1.236764, 3.830567, 1, 0, 0, 1, 1,
0.9787917, 0.002843756, 1.52042, 1, 0, 0, 1, 1,
0.9861965, -1.86654, 1.69759, 1, 0, 0, 1, 1,
0.9869173, 1.592296, 1.53792, 0, 0, 0, 1, 1,
0.9928458, -1.021169, 2.230597, 0, 0, 0, 1, 1,
0.9950395, -0.3216806, 1.83767, 0, 0, 0, 1, 1,
1.000069, -1.801703, 3.177537, 0, 0, 0, 1, 1,
1.000744, 1.242916, 0.2732552, 0, 0, 0, 1, 1,
1.005954, 0.1169736, 3.358906, 0, 0, 0, 1, 1,
1.02312, -2.186911, 2.886542, 0, 0, 0, 1, 1,
1.037306, 0.2021201, 3.525422, 1, 1, 1, 1, 1,
1.038179, 0.07197633, 2.993399, 1, 1, 1, 1, 1,
1.050209, 0.2125592, 0.2365243, 1, 1, 1, 1, 1,
1.054647, 0.1552008, 1.316581, 1, 1, 1, 1, 1,
1.054705, -1.006518, 2.83609, 1, 1, 1, 1, 1,
1.059642, 1.061342, -0.5724071, 1, 1, 1, 1, 1,
1.064297, -0.08973429, 2.658038, 1, 1, 1, 1, 1,
1.064912, -0.4818453, 2.954706, 1, 1, 1, 1, 1,
1.073897, 1.39809, -0.8998631, 1, 1, 1, 1, 1,
1.079758, 0.576191, -1.460639, 1, 1, 1, 1, 1,
1.081312, -1.214774, 3.58279, 1, 1, 1, 1, 1,
1.086902, -0.06839599, 1.692683, 1, 1, 1, 1, 1,
1.090279, 0.2235799, 1.725734, 1, 1, 1, 1, 1,
1.095512, 0.146234, 0.8926287, 1, 1, 1, 1, 1,
1.104977, -1.858307, 3.39477, 1, 1, 1, 1, 1,
1.111383, 1.337978, 1.761601, 0, 0, 1, 1, 1,
1.113665, -1.054267, 3.707505, 1, 0, 0, 1, 1,
1.115331, 0.5963334, 1.003785, 1, 0, 0, 1, 1,
1.115604, -0.4469053, 2.926281, 1, 0, 0, 1, 1,
1.120761, 0.5849524, 0.2745462, 1, 0, 0, 1, 1,
1.124499, -0.6646187, 2.601433, 1, 0, 0, 1, 1,
1.12771, -0.3396554, 2.933151, 0, 0, 0, 1, 1,
1.132058, -0.428028, 3.05022, 0, 0, 0, 1, 1,
1.139588, -0.04874748, 0.5377363, 0, 0, 0, 1, 1,
1.143262, -0.478583, 0.5952418, 0, 0, 0, 1, 1,
1.143376, -1.477147, 1.677429, 0, 0, 0, 1, 1,
1.143448, 0.04821332, 0.4746051, 0, 0, 0, 1, 1,
1.144179, -1.280232, 2.395941, 0, 0, 0, 1, 1,
1.166942, -0.7623898, 3.371969, 1, 1, 1, 1, 1,
1.174361, 0.4948371, 2.62745, 1, 1, 1, 1, 1,
1.17942, 0.446735, -0.2302379, 1, 1, 1, 1, 1,
1.17945, 1.050509, 2.525843, 1, 1, 1, 1, 1,
1.183586, 0.2249568, -1.12296, 1, 1, 1, 1, 1,
1.185467, 1.543144, 0.144558, 1, 1, 1, 1, 1,
1.185774, 0.1485986, 3.09071, 1, 1, 1, 1, 1,
1.192333, 0.65078, 0.8509465, 1, 1, 1, 1, 1,
1.192437, 0.6994265, -0.6100765, 1, 1, 1, 1, 1,
1.192901, -0.260356, 1.043911, 1, 1, 1, 1, 1,
1.212176, -1.519507, 2.909319, 1, 1, 1, 1, 1,
1.242055, -0.547942, 2.087014, 1, 1, 1, 1, 1,
1.245253, -0.7245559, 1.195484, 1, 1, 1, 1, 1,
1.247478, 0.7993582, -0.4390225, 1, 1, 1, 1, 1,
1.25527, 1.192589, 0.8019159, 1, 1, 1, 1, 1,
1.269275, 1.224941, 1.186178, 0, 0, 1, 1, 1,
1.273751, 0.8454813, 2.783456, 1, 0, 0, 1, 1,
1.275516, -1.911631, 1.653501, 1, 0, 0, 1, 1,
1.27945, 2.35837, 1.058401, 1, 0, 0, 1, 1,
1.27966, 0.8500962, -0.02884166, 1, 0, 0, 1, 1,
1.282103, 1.734373, -0.6826116, 1, 0, 0, 1, 1,
1.28668, 1.870525, 1.453901, 0, 0, 0, 1, 1,
1.290727, -0.8672726, 1.505251, 0, 0, 0, 1, 1,
1.300328, 0.1758854, 1.487636, 0, 0, 0, 1, 1,
1.308055, -1.68175, 1.00926, 0, 0, 0, 1, 1,
1.313787, -1.983095, 2.377972, 0, 0, 0, 1, 1,
1.314289, 0.6382061, 2.45762, 0, 0, 0, 1, 1,
1.315277, 1.021821, 1.88232, 0, 0, 0, 1, 1,
1.322495, 0.8380046, -0.6337223, 1, 1, 1, 1, 1,
1.337298, 0.2739518, -0.2760162, 1, 1, 1, 1, 1,
1.345963, 1.687304, 2.017342, 1, 1, 1, 1, 1,
1.350004, 1.062533, -0.3504243, 1, 1, 1, 1, 1,
1.357571, -0.5719957, -0.2045147, 1, 1, 1, 1, 1,
1.372753, -2.184072, 2.292373, 1, 1, 1, 1, 1,
1.381406, 0.7861985, 1.882563, 1, 1, 1, 1, 1,
1.39139, -0.08268916, 1.659278, 1, 1, 1, 1, 1,
1.403295, 1.886236, 1.680801, 1, 1, 1, 1, 1,
1.403387, -0.800765, 1.314588, 1, 1, 1, 1, 1,
1.403788, 0.4213858, 2.041813, 1, 1, 1, 1, 1,
1.408435, 0.2651301, 2.096557, 1, 1, 1, 1, 1,
1.411844, -0.6739468, 0.9185891, 1, 1, 1, 1, 1,
1.419928, 1.122221, 2.950992, 1, 1, 1, 1, 1,
1.42188, 0.6910834, 1.559458, 1, 1, 1, 1, 1,
1.423249, 0.2871973, 2.357413, 0, 0, 1, 1, 1,
1.425399, 1.739613, 2.077184, 1, 0, 0, 1, 1,
1.447388, -0.1665904, -0.05255126, 1, 0, 0, 1, 1,
1.466862, 0.5956583, 1.602013, 1, 0, 0, 1, 1,
1.467016, 1.985549, -0.4864974, 1, 0, 0, 1, 1,
1.474576, 1.602975, 0.7190822, 1, 0, 0, 1, 1,
1.479169, 0.7365516, 2.574173, 0, 0, 0, 1, 1,
1.479992, 0.2538746, 1.777782, 0, 0, 0, 1, 1,
1.511984, 1.574616, 1.978784, 0, 0, 0, 1, 1,
1.51416, -0.1062723, 1.775404, 0, 0, 0, 1, 1,
1.537499, 0.7509046, 0.6016297, 0, 0, 0, 1, 1,
1.539345, -1.539067, -0.3245269, 0, 0, 0, 1, 1,
1.540203, -0.3162741, 4.514466, 0, 0, 0, 1, 1,
1.543368, -0.3413989, 3.058632, 1, 1, 1, 1, 1,
1.561932, 0.8166369, 1.915214, 1, 1, 1, 1, 1,
1.582914, -1.768028, 2.410321, 1, 1, 1, 1, 1,
1.590941, 0.1673147, 1.512758, 1, 1, 1, 1, 1,
1.592147, 0.3018232, 0.2909556, 1, 1, 1, 1, 1,
1.633671, 0.08137289, 2.237575, 1, 1, 1, 1, 1,
1.641162, -0.5091442, 1.024711, 1, 1, 1, 1, 1,
1.645776, -1.214307, 1.955498, 1, 1, 1, 1, 1,
1.665888, 0.5298881, 1.114841, 1, 1, 1, 1, 1,
1.667614, 0.2348811, 0.9552203, 1, 1, 1, 1, 1,
1.682066, -0.2226342, -0.158096, 1, 1, 1, 1, 1,
1.694062, 0.8553214, 1.536085, 1, 1, 1, 1, 1,
1.725048, -1.394498, 2.964506, 1, 1, 1, 1, 1,
1.735428, -1.200362, 2.649693, 1, 1, 1, 1, 1,
1.747765, -1.337707, 1.583543, 1, 1, 1, 1, 1,
1.762262, 0.06908456, 1.906484, 0, 0, 1, 1, 1,
1.763627, -1.452048, 3.07126, 1, 0, 0, 1, 1,
1.776607, 0.4011198, 0.9268091, 1, 0, 0, 1, 1,
1.81621, 1.059406, 1.158742, 1, 0, 0, 1, 1,
1.816388, -0.1312397, 2.861511, 1, 0, 0, 1, 1,
1.81787, -0.3453472, 1.251494, 1, 0, 0, 1, 1,
1.829895, -0.1872805, 2.130229, 0, 0, 0, 1, 1,
1.86393, 0.7607819, 1.864028, 0, 0, 0, 1, 1,
1.86624, -0.04445164, -0.8806921, 0, 0, 0, 1, 1,
1.896483, 0.3642595, 1.608671, 0, 0, 0, 1, 1,
1.898248, -0.9028684, 2.228336, 0, 0, 0, 1, 1,
1.909546, 1.806363, 0.836593, 0, 0, 0, 1, 1,
1.92105, -0.1153195, 1.395238, 0, 0, 0, 1, 1,
1.922771, 0.6250652, 1.52051, 1, 1, 1, 1, 1,
1.924994, 2.219513, 0.2085584, 1, 1, 1, 1, 1,
1.932881, 0.4584921, 1.52763, 1, 1, 1, 1, 1,
1.944561, 0.3970769, 2.337043, 1, 1, 1, 1, 1,
1.946842, 1.155649, -0.09020659, 1, 1, 1, 1, 1,
1.954115, 0.08622017, 0.8863208, 1, 1, 1, 1, 1,
1.998739, 1.268014, 1.253696, 1, 1, 1, 1, 1,
2.034039, 1.0374, -0.01214937, 1, 1, 1, 1, 1,
2.035128, -0.1159176, 2.99678, 1, 1, 1, 1, 1,
2.046784, -0.0605448, 3.598909, 1, 1, 1, 1, 1,
2.049099, -0.8114655, 3.598509, 1, 1, 1, 1, 1,
2.04937, -0.6489356, 3.130124, 1, 1, 1, 1, 1,
2.056773, 1.808879, 2.064752, 1, 1, 1, 1, 1,
2.085138, 0.1510702, 0.365268, 1, 1, 1, 1, 1,
2.085449, 1.374884, 1.426784, 1, 1, 1, 1, 1,
2.111419, -1.466058, 1.644518, 0, 0, 1, 1, 1,
2.133369, -0.04341777, 2.043883, 1, 0, 0, 1, 1,
2.143395, 0.3645042, 0.6075861, 1, 0, 0, 1, 1,
2.143737, -0.7539344, 2.333179, 1, 0, 0, 1, 1,
2.175071, 0.1670069, 1.8712, 1, 0, 0, 1, 1,
2.203215, -0.04168843, 2.554997, 1, 0, 0, 1, 1,
2.322954, -1.445299, -0.3631179, 0, 0, 0, 1, 1,
2.337078, 0.4245242, 2.011084, 0, 0, 0, 1, 1,
2.398946, -1.060865, 0.8833246, 0, 0, 0, 1, 1,
2.425639, 0.4102397, 1.854607, 0, 0, 0, 1, 1,
2.510684, 0.7918062, 1.178835, 0, 0, 0, 1, 1,
2.55749, -1.648759, 1.939585, 0, 0, 0, 1, 1,
2.566562, -0.9789783, 2.181787, 0, 0, 0, 1, 1,
2.637108, 1.231336, 1.04731, 1, 1, 1, 1, 1,
2.712572, 1.036236, -0.3979952, 1, 1, 1, 1, 1,
2.811294, 1.246991, 1.353748, 1, 1, 1, 1, 1,
3.014598, -1.314135, 3.68726, 1, 1, 1, 1, 1,
3.208219, -0.678224, -0.01163866, 1, 1, 1, 1, 1,
3.334015, -0.9403033, 2.130996, 1, 1, 1, 1, 1,
3.578122, 2.115322, 0.06475721, 1, 1, 1, 1, 1
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
var radius = 9.413908;
var distance = 33.06595;
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
mvMatrix.translate( -0.3443615, 0.1824365, -0.2764044 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.06595);
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
