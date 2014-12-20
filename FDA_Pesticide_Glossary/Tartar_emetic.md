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
-3.69672, -0.1212339, -1.670962, 1, 0, 0, 1,
-3.099534, -0.01595469, -1.641478, 1, 0.007843138, 0, 1,
-2.952059, 0.5170346, -4.431856, 1, 0.01176471, 0, 1,
-2.931493, 0.4874617, -2.185624, 1, 0.01960784, 0, 1,
-2.911543, -0.6063946, -3.346333, 1, 0.02352941, 0, 1,
-2.883471, -0.7494693, -0.5809069, 1, 0.03137255, 0, 1,
-2.715179, -0.363943, -1.256531, 1, 0.03529412, 0, 1,
-2.709953, 0.5872891, -1.505146, 1, 0.04313726, 0, 1,
-2.534184, 0.1177928, -0.4335813, 1, 0.04705882, 0, 1,
-2.529166, -0.919533, -0.8415178, 1, 0.05490196, 0, 1,
-2.485638, -1.144103, 0.1634631, 1, 0.05882353, 0, 1,
-2.443392, -0.6344035, -1.928598, 1, 0.06666667, 0, 1,
-2.342433, 2.213868, -0.992177, 1, 0.07058824, 0, 1,
-2.309998, -0.9695884, -2.243539, 1, 0.07843138, 0, 1,
-2.302742, -0.108592, -3.337688, 1, 0.08235294, 0, 1,
-2.277264, 2.405307, -0.4642376, 1, 0.09019608, 0, 1,
-2.241397, 0.06577172, -0.4240169, 1, 0.09411765, 0, 1,
-2.176663, -0.7623787, -1.340285, 1, 0.1019608, 0, 1,
-2.124189, 1.621474, 0.1726233, 1, 0.1098039, 0, 1,
-2.123804, 1.035832, -0.8142751, 1, 0.1137255, 0, 1,
-2.09588, -0.9348043, -1.927354, 1, 0.1215686, 0, 1,
-2.088892, 1.39057, -3.548375, 1, 0.1254902, 0, 1,
-2.067358, -0.3405004, -0.7812952, 1, 0.1333333, 0, 1,
-2.036456, 1.266011, -1.286147, 1, 0.1372549, 0, 1,
-2.017026, 0.3133752, -0.5222879, 1, 0.145098, 0, 1,
-2.008046, -0.3689519, -1.625359, 1, 0.1490196, 0, 1,
-1.981844, 0.3758321, -1.902064, 1, 0.1568628, 0, 1,
-1.980007, -0.3842514, -0.473401, 1, 0.1607843, 0, 1,
-1.976865, -1.391422, -0.3796659, 1, 0.1686275, 0, 1,
-1.958248, -0.9829791, -1.723129, 1, 0.172549, 0, 1,
-1.951493, -0.9381535, -1.440947, 1, 0.1803922, 0, 1,
-1.923341, 0.2331799, -0.4338323, 1, 0.1843137, 0, 1,
-1.921514, -0.7714247, -1.983829, 1, 0.1921569, 0, 1,
-1.898658, -0.9388298, -2.488895, 1, 0.1960784, 0, 1,
-1.89693, 1.647658, -3.641167, 1, 0.2039216, 0, 1,
-1.866013, 0.2512289, -0.7522018, 1, 0.2117647, 0, 1,
-1.864233, 1.02572, -2.673862, 1, 0.2156863, 0, 1,
-1.852072, 0.1167487, -2.942253, 1, 0.2235294, 0, 1,
-1.84824, 2.132667, 0.9266753, 1, 0.227451, 0, 1,
-1.846233, 1.36065, 0.1284477, 1, 0.2352941, 0, 1,
-1.84169, -0.8810345, -0.6068394, 1, 0.2392157, 0, 1,
-1.817887, -0.6959822, -0.1196298, 1, 0.2470588, 0, 1,
-1.81077, 0.6183415, -1.970688, 1, 0.2509804, 0, 1,
-1.802059, 1.352477, -0.8952917, 1, 0.2588235, 0, 1,
-1.788557, 1.069719, -0.195642, 1, 0.2627451, 0, 1,
-1.783821, 0.3248129, -1.749455, 1, 0.2705882, 0, 1,
-1.758564, 0.06696147, -2.502954, 1, 0.2745098, 0, 1,
-1.754474, 0.8072438, -1.235163, 1, 0.282353, 0, 1,
-1.735103, -1.251045, -3.550199, 1, 0.2862745, 0, 1,
-1.730121, -1.938462, -1.627452, 1, 0.2941177, 0, 1,
-1.723156, -1.263723, -3.129514, 1, 0.3019608, 0, 1,
-1.719238, -0.1058158, -0.5960014, 1, 0.3058824, 0, 1,
-1.718742, 0.2581138, -2.053761, 1, 0.3137255, 0, 1,
-1.710937, -0.2398902, -2.396387, 1, 0.3176471, 0, 1,
-1.67434, -0.7911171, -1.88664, 1, 0.3254902, 0, 1,
-1.670435, -0.05562345, -1.776252, 1, 0.3294118, 0, 1,
-1.667982, -0.6523575, -0.9662316, 1, 0.3372549, 0, 1,
-1.654135, -1.21623, -3.462785, 1, 0.3411765, 0, 1,
-1.650163, -0.001117501, -2.039623, 1, 0.3490196, 0, 1,
-1.622113, 0.562748, -0.3016911, 1, 0.3529412, 0, 1,
-1.619392, 1.931221, 0.2074504, 1, 0.3607843, 0, 1,
-1.61735, -1.058864, -0.9451636, 1, 0.3647059, 0, 1,
-1.61528, 0.006978497, -0.687995, 1, 0.372549, 0, 1,
-1.610623, -0.05762339, -0.8638108, 1, 0.3764706, 0, 1,
-1.608861, -0.9172727, -1.418945, 1, 0.3843137, 0, 1,
-1.606586, -1.02831, -2.520301, 1, 0.3882353, 0, 1,
-1.594038, 0.4008361, -2.980188, 1, 0.3960784, 0, 1,
-1.577978, -0.7509252, -1.049084, 1, 0.4039216, 0, 1,
-1.568109, 0.5971203, -1.105066, 1, 0.4078431, 0, 1,
-1.565184, 0.1544564, -0.4063559, 1, 0.4156863, 0, 1,
-1.564072, 1.162325, -0.7381186, 1, 0.4196078, 0, 1,
-1.558901, 1.861129, -1.994689, 1, 0.427451, 0, 1,
-1.554086, 0.6863019, -1.152075, 1, 0.4313726, 0, 1,
-1.546675, -0.7831739, -1.859057, 1, 0.4392157, 0, 1,
-1.537339, 0.5944337, -1.473781, 1, 0.4431373, 0, 1,
-1.53002, 1.324023, -0.9826267, 1, 0.4509804, 0, 1,
-1.527772, -0.6913689, -1.003229, 1, 0.454902, 0, 1,
-1.516252, 1.443182, 0.1096751, 1, 0.4627451, 0, 1,
-1.509396, -0.2098317, -0.8443596, 1, 0.4666667, 0, 1,
-1.496863, -0.8809389, -1.107199, 1, 0.4745098, 0, 1,
-1.494599, 1.104623, -2.975514, 1, 0.4784314, 0, 1,
-1.461545, 2.050419, -1.49833, 1, 0.4862745, 0, 1,
-1.457739, -2.402167, -2.87783, 1, 0.4901961, 0, 1,
-1.443936, 1.272766, -2.064611, 1, 0.4980392, 0, 1,
-1.430989, 0.7443733, -0.008324222, 1, 0.5058824, 0, 1,
-1.429217, 0.0194013, -1.851739, 1, 0.509804, 0, 1,
-1.426948, -1.001471, -1.259226, 1, 0.5176471, 0, 1,
-1.423227, -0.08541258, -1.511849, 1, 0.5215687, 0, 1,
-1.422253, -2.82466, -0.8577073, 1, 0.5294118, 0, 1,
-1.420602, -0.2883795, -0.4375668, 1, 0.5333334, 0, 1,
-1.41704, -1.491095, -3.05487, 1, 0.5411765, 0, 1,
-1.413607, -0.0664021, -3.632159, 1, 0.5450981, 0, 1,
-1.404421, 0.1238029, -2.809457, 1, 0.5529412, 0, 1,
-1.39248, 0.9569398, -2.007537, 1, 0.5568628, 0, 1,
-1.384727, -1.254974, -2.767125, 1, 0.5647059, 0, 1,
-1.378279, 0.2985353, -1.880281, 1, 0.5686275, 0, 1,
-1.377227, 0.4197973, -1.063723, 1, 0.5764706, 0, 1,
-1.371817, -1.067654, -3.505562, 1, 0.5803922, 0, 1,
-1.371234, 0.9411462, -1.822419, 1, 0.5882353, 0, 1,
-1.343973, -0.9799728, -2.034691, 1, 0.5921569, 0, 1,
-1.338634, 0.5536534, -0.6064479, 1, 0.6, 0, 1,
-1.321596, 0.9626814, -2.272388, 1, 0.6078432, 0, 1,
-1.311366, -0.8224031, -0.7874211, 1, 0.6117647, 0, 1,
-1.310161, -0.910199, -2.45654, 1, 0.6196079, 0, 1,
-1.300453, 1.032415, -1.400828, 1, 0.6235294, 0, 1,
-1.295323, -0.5532569, -2.447672, 1, 0.6313726, 0, 1,
-1.294448, -0.7430483, -5.043316, 1, 0.6352941, 0, 1,
-1.276682, 0.6169361, -1.20313, 1, 0.6431373, 0, 1,
-1.275329, -0.4321445, -1.550743, 1, 0.6470588, 0, 1,
-1.272347, 1.239119, -0.7065178, 1, 0.654902, 0, 1,
-1.26958, 1.39323, 0.9158232, 1, 0.6588235, 0, 1,
-1.268542, 0.7382181, -3.528903, 1, 0.6666667, 0, 1,
-1.266574, 2.350643, -1.056196, 1, 0.6705883, 0, 1,
-1.247864, -0.2372037, -2.010612, 1, 0.6784314, 0, 1,
-1.243093, 0.1696228, -1.926013, 1, 0.682353, 0, 1,
-1.239732, 0.06019652, -2.071563, 1, 0.6901961, 0, 1,
-1.216497, 0.9697671, -2.598381, 1, 0.6941177, 0, 1,
-1.216027, 0.6928395, -2.157962, 1, 0.7019608, 0, 1,
-1.212637, -0.4430463, -4.277389, 1, 0.7098039, 0, 1,
-1.211721, -0.9193367, -1.173324, 1, 0.7137255, 0, 1,
-1.196079, 0.6441643, 0.04971334, 1, 0.7215686, 0, 1,
-1.183426, -1.566817, -2.841258, 1, 0.7254902, 0, 1,
-1.181626, -1.764809, -3.001028, 1, 0.7333333, 0, 1,
-1.178572, -0.3839106, -0.939687, 1, 0.7372549, 0, 1,
-1.177681, -0.4810592, -1.479236, 1, 0.7450981, 0, 1,
-1.17456, -0.4919245, -2.499841, 1, 0.7490196, 0, 1,
-1.171469, 1.843827, 0.1381982, 1, 0.7568628, 0, 1,
-1.170314, -1.364113, -3.941254, 1, 0.7607843, 0, 1,
-1.168468, 0.5537394, -0.6417254, 1, 0.7686275, 0, 1,
-1.159355, -0.621838, -2.564488, 1, 0.772549, 0, 1,
-1.146812, 0.1829719, -0.4431844, 1, 0.7803922, 0, 1,
-1.14022, 0.3266334, -1.661723, 1, 0.7843137, 0, 1,
-1.131924, 0.0863165, -1.545975, 1, 0.7921569, 0, 1,
-1.127546, 1.677198, -0.7430229, 1, 0.7960784, 0, 1,
-1.123698, 0.827421, -0.7810084, 1, 0.8039216, 0, 1,
-1.114767, 0.8025376, -2.043787, 1, 0.8117647, 0, 1,
-1.113761, 1.043401, -0.1818227, 1, 0.8156863, 0, 1,
-1.107759, 0.5937381, -0.8522794, 1, 0.8235294, 0, 1,
-1.099221, -0.7206811, -1.198509, 1, 0.827451, 0, 1,
-1.097836, -0.524013, -2.461857, 1, 0.8352941, 0, 1,
-1.097508, -0.2248224, -2.257193, 1, 0.8392157, 0, 1,
-1.090795, -2.936528, -4.654826, 1, 0.8470588, 0, 1,
-1.089328, -0.2983981, -0.9714271, 1, 0.8509804, 0, 1,
-1.080508, 0.3889637, -1.302034, 1, 0.8588235, 0, 1,
-1.07688, 0.7059016, -1.42774, 1, 0.8627451, 0, 1,
-1.06673, 0.7036245, -1.270507, 1, 0.8705882, 0, 1,
-1.066417, -0.07742596, -0.4521836, 1, 0.8745098, 0, 1,
-1.06582, 0.4173192, -1.067453, 1, 0.8823529, 0, 1,
-1.057582, 0.09786385, -0.3714952, 1, 0.8862745, 0, 1,
-1.053948, -1.815526, -1.910738, 1, 0.8941177, 0, 1,
-1.049534, 2.384661, -1.182507, 1, 0.8980392, 0, 1,
-1.037703, -1.831942, -3.319316, 1, 0.9058824, 0, 1,
-1.036601, 0.1981774, -0.4987956, 1, 0.9137255, 0, 1,
-1.035139, 1.545712, 0.9822899, 1, 0.9176471, 0, 1,
-1.028783, 0.9186803, -0.3692378, 1, 0.9254902, 0, 1,
-1.027516, 0.1856976, -1.188172, 1, 0.9294118, 0, 1,
-1.025932, 0.3452804, -0.5772414, 1, 0.9372549, 0, 1,
-1.024155, 0.9085522, 0.4024205, 1, 0.9411765, 0, 1,
-1.016856, -0.7962973, -1.020838, 1, 0.9490196, 0, 1,
-1.015402, 1.39792, -0.5361735, 1, 0.9529412, 0, 1,
-1.0121, -0.519764, -1.50407, 1, 0.9607843, 0, 1,
-0.9983569, 0.5223917, -1.612339, 1, 0.9647059, 0, 1,
-0.9798926, 0.814178, -0.7131825, 1, 0.972549, 0, 1,
-0.9763067, 0.6783167, -2.174636, 1, 0.9764706, 0, 1,
-0.9706718, -0.5641472, -2.259705, 1, 0.9843137, 0, 1,
-0.9685404, -1.5397, -4.241583, 1, 0.9882353, 0, 1,
-0.9680374, 0.04995685, 1.403054, 1, 0.9960784, 0, 1,
-0.9677632, 0.7024158, -2.097145, 0.9960784, 1, 0, 1,
-0.9658594, 0.1506746, 0.7499462, 0.9921569, 1, 0, 1,
-0.9555852, -1.373876, -3.210307, 0.9843137, 1, 0, 1,
-0.9458624, -0.6609935, -2.36499, 0.9803922, 1, 0, 1,
-0.9312193, -0.1951906, -1.072113, 0.972549, 1, 0, 1,
-0.93083, 0.3353512, -1.582882, 0.9686275, 1, 0, 1,
-0.9240075, -0.2257157, -2.322155, 0.9607843, 1, 0, 1,
-0.9153734, 0.6951295, -1.128375, 0.9568627, 1, 0, 1,
-0.9088883, 0.04140749, -1.082142, 0.9490196, 1, 0, 1,
-0.9088693, 1.014043, -0.9042789, 0.945098, 1, 0, 1,
-0.9049605, -1.97335, -3.40831, 0.9372549, 1, 0, 1,
-0.9027808, -0.3794634, -2.055882, 0.9333333, 1, 0, 1,
-0.9001293, -0.7377097, -2.116996, 0.9254902, 1, 0, 1,
-0.9000406, 0.5177677, -1.783027, 0.9215686, 1, 0, 1,
-0.8906356, -0.4724764, 0.3325884, 0.9137255, 1, 0, 1,
-0.8850172, 0.566003, 0.6065919, 0.9098039, 1, 0, 1,
-0.8804624, 1.275948, -0.4250744, 0.9019608, 1, 0, 1,
-0.8761157, 1.087826, -0.3984027, 0.8941177, 1, 0, 1,
-0.8758217, -0.3972867, -2.342364, 0.8901961, 1, 0, 1,
-0.870487, -1.221673, -3.245961, 0.8823529, 1, 0, 1,
-0.8698142, -0.5765337, -1.720701, 0.8784314, 1, 0, 1,
-0.8682348, 0.9008683, -1.154864, 0.8705882, 1, 0, 1,
-0.8600635, -0.3246602, -1.667737, 0.8666667, 1, 0, 1,
-0.8515868, -0.6020649, -1.092924, 0.8588235, 1, 0, 1,
-0.8477437, 0.9813288, -1.886729, 0.854902, 1, 0, 1,
-0.8468106, -1.693042, -2.32318, 0.8470588, 1, 0, 1,
-0.8466592, -1.522712, -2.430259, 0.8431373, 1, 0, 1,
-0.8457809, -0.3035924, -2.732133, 0.8352941, 1, 0, 1,
-0.8454519, -1.196068, -3.26374, 0.8313726, 1, 0, 1,
-0.8446919, 0.08654921, -1.446157, 0.8235294, 1, 0, 1,
-0.8437863, 0.3109282, -0.5612783, 0.8196079, 1, 0, 1,
-0.8412035, -0.5322853, -2.998758, 0.8117647, 1, 0, 1,
-0.8408958, -1.394618, -2.78394, 0.8078431, 1, 0, 1,
-0.838559, 0.199109, 0.1676045, 0.8, 1, 0, 1,
-0.8385357, -1.266905, -2.660175, 0.7921569, 1, 0, 1,
-0.8366851, 0.1795714, 0.5531321, 0.7882353, 1, 0, 1,
-0.834833, -0.1711478, -1.873725, 0.7803922, 1, 0, 1,
-0.8346729, 0.4334055, -3.205677, 0.7764706, 1, 0, 1,
-0.822436, -1.222519, -3.05276, 0.7686275, 1, 0, 1,
-0.8159119, 0.8138314, -3.453438, 0.7647059, 1, 0, 1,
-0.811929, 0.1103203, 0.3751687, 0.7568628, 1, 0, 1,
-0.811034, -0.8877897, -1.863391, 0.7529412, 1, 0, 1,
-0.8094051, 0.6501897, -0.2721511, 0.7450981, 1, 0, 1,
-0.8058107, 0.9761403, -1.024748, 0.7411765, 1, 0, 1,
-0.8041199, 0.476176, -1.709975, 0.7333333, 1, 0, 1,
-0.8009267, 0.9670121, -0.7321763, 0.7294118, 1, 0, 1,
-0.8000072, -0.1566779, -1.413885, 0.7215686, 1, 0, 1,
-0.7996082, 0.07465955, -1.354418, 0.7176471, 1, 0, 1,
-0.7979069, -0.6010627, -2.565632, 0.7098039, 1, 0, 1,
-0.797484, -0.1402332, -1.187817, 0.7058824, 1, 0, 1,
-0.7932338, 0.1042987, -1.004257, 0.6980392, 1, 0, 1,
-0.7836828, 0.572761, -1.369824, 0.6901961, 1, 0, 1,
-0.782143, -0.8774936, -1.524137, 0.6862745, 1, 0, 1,
-0.7817724, -1.753405, -2.28396, 0.6784314, 1, 0, 1,
-0.7809343, -0.5279012, -1.99503, 0.6745098, 1, 0, 1,
-0.7787738, 2.158095, -1.481915, 0.6666667, 1, 0, 1,
-0.7708231, 0.1887317, -1.416177, 0.6627451, 1, 0, 1,
-0.7687503, 0.6307027, -0.4013408, 0.654902, 1, 0, 1,
-0.7595298, -0.8904593, -3.378902, 0.6509804, 1, 0, 1,
-0.7582823, 0.2603756, -0.4903722, 0.6431373, 1, 0, 1,
-0.756631, 0.3028483, 0.4005151, 0.6392157, 1, 0, 1,
-0.7549442, -0.7225823, -1.503003, 0.6313726, 1, 0, 1,
-0.7509015, 0.7060056, -1.211919, 0.627451, 1, 0, 1,
-0.750626, -0.007028667, -1.81713, 0.6196079, 1, 0, 1,
-0.7399778, 0.2123595, -0.1504227, 0.6156863, 1, 0, 1,
-0.7399281, -0.6242671, -0.193471, 0.6078432, 1, 0, 1,
-0.738911, -0.7702401, -2.16388, 0.6039216, 1, 0, 1,
-0.7358001, 0.05173125, -0.417885, 0.5960785, 1, 0, 1,
-0.7302244, 0.02709156, 0.1962442, 0.5882353, 1, 0, 1,
-0.7279162, 1.121852, 0.5231225, 0.5843138, 1, 0, 1,
-0.7237372, 0.7329657, -0.3552671, 0.5764706, 1, 0, 1,
-0.7179711, -1.370995, -1.726521, 0.572549, 1, 0, 1,
-0.7176871, 1.700148, 0.4791552, 0.5647059, 1, 0, 1,
-0.7150689, -0.9116488, -4.73586, 0.5607843, 1, 0, 1,
-0.7126474, -0.3974559, -2.194196, 0.5529412, 1, 0, 1,
-0.7098606, -1.996783, -2.865442, 0.5490196, 1, 0, 1,
-0.7089435, 1.288455, -0.5381457, 0.5411765, 1, 0, 1,
-0.7060259, -0.04700544, -2.715321, 0.5372549, 1, 0, 1,
-0.7028503, -0.3644018, -2.831584, 0.5294118, 1, 0, 1,
-0.6948115, -1.734746, -3.85037, 0.5254902, 1, 0, 1,
-0.6946363, 1.664406, -1.149905, 0.5176471, 1, 0, 1,
-0.6923231, -0.0963297, -1.776241, 0.5137255, 1, 0, 1,
-0.6896158, -1.741364, -1.571007, 0.5058824, 1, 0, 1,
-0.6870796, 0.9517988, -2.238952, 0.5019608, 1, 0, 1,
-0.6836441, 1.688738, 1.666539, 0.4941176, 1, 0, 1,
-0.6807676, -0.3720712, -1.016775, 0.4862745, 1, 0, 1,
-0.6715791, -1.563548, -3.385123, 0.4823529, 1, 0, 1,
-0.6711248, -0.2398315, -3.635859, 0.4745098, 1, 0, 1,
-0.664458, -0.8660423, -2.381983, 0.4705882, 1, 0, 1,
-0.6638184, -0.03756049, -1.733692, 0.4627451, 1, 0, 1,
-0.6627195, 0.7901538, -0.6975743, 0.4588235, 1, 0, 1,
-0.659163, -0.9399653, -1.465454, 0.4509804, 1, 0, 1,
-0.651931, -0.1461337, -1.142096, 0.4470588, 1, 0, 1,
-0.6471936, 0.3609113, 0.04629786, 0.4392157, 1, 0, 1,
-0.6466812, 0.2133538, -0.3640867, 0.4352941, 1, 0, 1,
-0.6438696, -0.6380556, 0.03270605, 0.427451, 1, 0, 1,
-0.6416235, -1.582317, -2.436869, 0.4235294, 1, 0, 1,
-0.6373738, 0.9397091, -1.081626, 0.4156863, 1, 0, 1,
-0.6334195, -0.4091332, -2.062574, 0.4117647, 1, 0, 1,
-0.6283387, 0.9472003, -0.5615427, 0.4039216, 1, 0, 1,
-0.625975, -0.2984752, -2.561742, 0.3960784, 1, 0, 1,
-0.6253212, 0.9566578, -0.5826185, 0.3921569, 1, 0, 1,
-0.618611, -0.1578691, -1.649408, 0.3843137, 1, 0, 1,
-0.6130458, 0.8190024, -0.8769692, 0.3803922, 1, 0, 1,
-0.608906, -0.3258611, -2.478198, 0.372549, 1, 0, 1,
-0.6043826, 0.1127216, -1.568197, 0.3686275, 1, 0, 1,
-0.5952696, -0.4192735, 0.4793467, 0.3607843, 1, 0, 1,
-0.5948223, 1.388923, 0.436774, 0.3568628, 1, 0, 1,
-0.5945498, 0.2806641, -1.78767, 0.3490196, 1, 0, 1,
-0.5903065, -0.8250431, -0.1816122, 0.345098, 1, 0, 1,
-0.5880356, -0.9536834, -1.940793, 0.3372549, 1, 0, 1,
-0.5804923, 1.846853, -1.77609, 0.3333333, 1, 0, 1,
-0.5800822, 1.68708, 0.5245219, 0.3254902, 1, 0, 1,
-0.5752962, 0.01221874, -1.743005, 0.3215686, 1, 0, 1,
-0.5709251, 1.121324, 0.6549726, 0.3137255, 1, 0, 1,
-0.5672844, -0.8589179, -2.845685, 0.3098039, 1, 0, 1,
-0.5643184, -1.609775, -2.7265, 0.3019608, 1, 0, 1,
-0.564207, 1.717304, 0.7345597, 0.2941177, 1, 0, 1,
-0.5612572, 1.261441, 0.4174866, 0.2901961, 1, 0, 1,
-0.5515044, -0.362013, -2.616578, 0.282353, 1, 0, 1,
-0.5493551, 0.1028835, -1.085479, 0.2784314, 1, 0, 1,
-0.5475956, 0.7861323, -1.624275, 0.2705882, 1, 0, 1,
-0.5459184, -0.1079751, -3.180635, 0.2666667, 1, 0, 1,
-0.5457908, -0.9306468, -3.362011, 0.2588235, 1, 0, 1,
-0.5397729, 0.004732012, -0.8405795, 0.254902, 1, 0, 1,
-0.5329664, 0.2671035, -1.918283, 0.2470588, 1, 0, 1,
-0.5318091, 0.08122655, -1.539857, 0.2431373, 1, 0, 1,
-0.5317228, 2.165774, 0.1038254, 0.2352941, 1, 0, 1,
-0.5293902, 0.522688, -1.714276, 0.2313726, 1, 0, 1,
-0.5280038, -0.5382177, -3.842535, 0.2235294, 1, 0, 1,
-0.5243531, -0.8712736, -2.945091, 0.2196078, 1, 0, 1,
-0.5202201, -0.7029085, -2.282472, 0.2117647, 1, 0, 1,
-0.5193778, -2.21609, -2.5913, 0.2078431, 1, 0, 1,
-0.5141945, 0.5954161, -2.206757, 0.2, 1, 0, 1,
-0.5135448, -0.8809038, -3.208061, 0.1921569, 1, 0, 1,
-0.5127162, -1.012277, -2.46138, 0.1882353, 1, 0, 1,
-0.5018054, 0.8607507, -1.035276, 0.1803922, 1, 0, 1,
-0.5004585, 0.9235731, -0.1063099, 0.1764706, 1, 0, 1,
-0.4981307, 1.599005, 1.401146, 0.1686275, 1, 0, 1,
-0.4973718, -3.030157, -3.017127, 0.1647059, 1, 0, 1,
-0.4968414, 0.4358363, -1.650029, 0.1568628, 1, 0, 1,
-0.4925793, -0.7555398, -3.662151, 0.1529412, 1, 0, 1,
-0.4851899, -0.613587, -0.7523412, 0.145098, 1, 0, 1,
-0.4817505, -0.04073244, -2.041122, 0.1411765, 1, 0, 1,
-0.48127, 0.1889408, -2.275344, 0.1333333, 1, 0, 1,
-0.4783824, 0.3017708, -1.584955, 0.1294118, 1, 0, 1,
-0.4771716, -1.114992, -1.502477, 0.1215686, 1, 0, 1,
-0.4746035, -1.062174, -2.661598, 0.1176471, 1, 0, 1,
-0.4670798, 1.248887, 0.4881158, 0.1098039, 1, 0, 1,
-0.4661261, 0.05163205, -1.081586, 0.1058824, 1, 0, 1,
-0.4658672, 0.1437254, -1.873395, 0.09803922, 1, 0, 1,
-0.4656905, 0.02727449, -0.08230193, 0.09019608, 1, 0, 1,
-0.4653431, -0.6509041, -2.71677, 0.08627451, 1, 0, 1,
-0.4648172, 0.8147638, 0.3857902, 0.07843138, 1, 0, 1,
-0.4644922, -1.669289, -2.749538, 0.07450981, 1, 0, 1,
-0.4601786, 0.06287849, -0.9174044, 0.06666667, 1, 0, 1,
-0.459549, 1.297804, -2.32602, 0.0627451, 1, 0, 1,
-0.4589498, 1.319902, -0.8599469, 0.05490196, 1, 0, 1,
-0.4587088, 0.7038174, 0.8905503, 0.05098039, 1, 0, 1,
-0.4450716, 0.7358207, -0.5514261, 0.04313726, 1, 0, 1,
-0.4439205, -0.2219209, -2.578857, 0.03921569, 1, 0, 1,
-0.438809, 0.5067105, -1.15192, 0.03137255, 1, 0, 1,
-0.4371209, -2.45456, -3.111727, 0.02745098, 1, 0, 1,
-0.4350841, -0.4105103, -3.232599, 0.01960784, 1, 0, 1,
-0.4313616, 1.338587, -0.4207408, 0.01568628, 1, 0, 1,
-0.4298989, -1.254622, -1.013369, 0.007843138, 1, 0, 1,
-0.4295143, -0.2580884, -2.443141, 0.003921569, 1, 0, 1,
-0.4248508, -1.425304, -2.440666, 0, 1, 0.003921569, 1,
-0.4242747, -1.533235, -3.92126, 0, 1, 0.01176471, 1,
-0.4238241, 0.6364478, -1.872423, 0, 1, 0.01568628, 1,
-0.4237286, 0.4035638, -1.084608, 0, 1, 0.02352941, 1,
-0.4221237, -0.07711509, -2.924875, 0, 1, 0.02745098, 1,
-0.4214795, -0.6011303, -2.098885, 0, 1, 0.03529412, 1,
-0.417147, -2.177529, -1.12083, 0, 1, 0.03921569, 1,
-0.410223, -0.8684101, -2.572922, 0, 1, 0.04705882, 1,
-0.4013103, 1.118416, -1.103292, 0, 1, 0.05098039, 1,
-0.4002501, 0.3298716, -1.311305, 0, 1, 0.05882353, 1,
-0.397477, -1.383049, -3.282989, 0, 1, 0.0627451, 1,
-0.397009, 0.4107205, -0.2377935, 0, 1, 0.07058824, 1,
-0.3939821, -0.7835718, -1.449529, 0, 1, 0.07450981, 1,
-0.3876706, 1.541952, 1.768803, 0, 1, 0.08235294, 1,
-0.3825129, -1.567716, -2.280397, 0, 1, 0.08627451, 1,
-0.3797823, 0.8849591, -1.437164, 0, 1, 0.09411765, 1,
-0.3791423, 0.2770219, -0.1496982, 0, 1, 0.1019608, 1,
-0.3752339, -0.5663927, -1.475125, 0, 1, 0.1058824, 1,
-0.3751393, -0.3247165, -2.833639, 0, 1, 0.1137255, 1,
-0.3724479, -0.4470215, -2.625119, 0, 1, 0.1176471, 1,
-0.3687925, -0.7621183, -3.494076, 0, 1, 0.1254902, 1,
-0.3579081, 1.63517, 0.9988362, 0, 1, 0.1294118, 1,
-0.3532301, -0.9174412, -4.470672, 0, 1, 0.1372549, 1,
-0.3506982, -1.093966, -1.522537, 0, 1, 0.1411765, 1,
-0.3499266, 0.2791552, -0.9688463, 0, 1, 0.1490196, 1,
-0.3455108, 0.378701, 0.7644015, 0, 1, 0.1529412, 1,
-0.342582, -1.430393, -4.291007, 0, 1, 0.1607843, 1,
-0.34064, 0.8256125, -0.2479094, 0, 1, 0.1647059, 1,
-0.3403257, -0.5615367, -2.267435, 0, 1, 0.172549, 1,
-0.3402746, -0.2399939, -0.9940668, 0, 1, 0.1764706, 1,
-0.3300132, 0.3532849, -2.237281, 0, 1, 0.1843137, 1,
-0.3297118, -0.1043589, -2.161064, 0, 1, 0.1882353, 1,
-0.3284171, 1.784863, -0.953564, 0, 1, 0.1960784, 1,
-0.3249013, 1.255145, -0.06869031, 0, 1, 0.2039216, 1,
-0.3220748, 1.132401, -2.466129, 0, 1, 0.2078431, 1,
-0.3185263, -0.5656059, -1.917108, 0, 1, 0.2156863, 1,
-0.3181656, -1.313911, -1.923227, 0, 1, 0.2196078, 1,
-0.3125153, 0.8876761, -0.4422353, 0, 1, 0.227451, 1,
-0.3091491, 0.1078989, -1.152941, 0, 1, 0.2313726, 1,
-0.3060097, 1.627993, 0.1830636, 0, 1, 0.2392157, 1,
-0.305883, 0.8047084, 0.2538774, 0, 1, 0.2431373, 1,
-0.3057256, 0.01967743, -2.630967, 0, 1, 0.2509804, 1,
-0.3022771, -0.03437009, -3.139413, 0, 1, 0.254902, 1,
-0.2969833, -1.198818, -3.487043, 0, 1, 0.2627451, 1,
-0.2941645, 0.3723516, -0.8201391, 0, 1, 0.2666667, 1,
-0.2926811, 0.1957355, -0.9300516, 0, 1, 0.2745098, 1,
-0.2872773, 0.784795, -1.752152, 0, 1, 0.2784314, 1,
-0.2803585, -1.423443, -1.512839, 0, 1, 0.2862745, 1,
-0.2736134, -0.4405631, -3.039247, 0, 1, 0.2901961, 1,
-0.2704493, -0.310381, 0.3708352, 0, 1, 0.2980392, 1,
-0.2629434, 0.501834, -2.855136, 0, 1, 0.3058824, 1,
-0.2561822, 1.820557, 0.2508703, 0, 1, 0.3098039, 1,
-0.253206, -1.101542, -1.829968, 0, 1, 0.3176471, 1,
-0.2404123, -1.319064, -2.835669, 0, 1, 0.3215686, 1,
-0.2379282, 0.08273661, -1.516267, 0, 1, 0.3294118, 1,
-0.2367386, -0.2404704, -2.043726, 0, 1, 0.3333333, 1,
-0.2365346, -0.02903709, -1.990166, 0, 1, 0.3411765, 1,
-0.2362051, 0.4683667, -2.543214, 0, 1, 0.345098, 1,
-0.2360098, 0.15877, -0.4616333, 0, 1, 0.3529412, 1,
-0.2310572, 0.09111728, -1.636082, 0, 1, 0.3568628, 1,
-0.2304703, -0.5392618, -0.9147825, 0, 1, 0.3647059, 1,
-0.2209815, -0.6456349, -2.934241, 0, 1, 0.3686275, 1,
-0.2180599, -0.1697609, -1.949275, 0, 1, 0.3764706, 1,
-0.2175485, 1.621431, 1.101377, 0, 1, 0.3803922, 1,
-0.213893, -0.7459776, -5.303955, 0, 1, 0.3882353, 1,
-0.2123166, 0.3765384, -0.01373984, 0, 1, 0.3921569, 1,
-0.2064026, -0.6354268, -1.074003, 0, 1, 0.4, 1,
-0.201942, -0.6791576, -4.862759, 0, 1, 0.4078431, 1,
-0.201204, 0.5181146, -0.6194207, 0, 1, 0.4117647, 1,
-0.1999719, -1.285942, -4.15476, 0, 1, 0.4196078, 1,
-0.1889026, -1.496776, -4.405109, 0, 1, 0.4235294, 1,
-0.1883913, 1.280959, 2.550335, 0, 1, 0.4313726, 1,
-0.1870732, -0.2408419, -2.710406, 0, 1, 0.4352941, 1,
-0.1794048, 0.09509259, -1.04446, 0, 1, 0.4431373, 1,
-0.1787915, -1.551609, -2.426865, 0, 1, 0.4470588, 1,
-0.1780004, -1.940335, -3.122403, 0, 1, 0.454902, 1,
-0.1767871, 0.6998714, -1.096785, 0, 1, 0.4588235, 1,
-0.1761937, 1.74457, 0.934179, 0, 1, 0.4666667, 1,
-0.1634424, -0.823674, -3.378625, 0, 1, 0.4705882, 1,
-0.1631946, 0.003692612, -0.717118, 0, 1, 0.4784314, 1,
-0.1615712, 0.9263859, -0.2219678, 0, 1, 0.4823529, 1,
-0.1606904, 0.003402726, -1.877065, 0, 1, 0.4901961, 1,
-0.1603242, 0.3052188, 1.05761, 0, 1, 0.4941176, 1,
-0.1592081, -1.497124, -3.739844, 0, 1, 0.5019608, 1,
-0.1522835, 1.075986, -1.685937, 0, 1, 0.509804, 1,
-0.151801, 0.7816505, -2.351319, 0, 1, 0.5137255, 1,
-0.1497732, -0.9568702, -4.311347, 0, 1, 0.5215687, 1,
-0.1494785, -0.4777192, -1.098808, 0, 1, 0.5254902, 1,
-0.1486644, -0.05535753, -1.627836, 0, 1, 0.5333334, 1,
-0.148644, -0.7950543, -3.651921, 0, 1, 0.5372549, 1,
-0.1456098, 0.2977171, 1.888153, 0, 1, 0.5450981, 1,
-0.1439362, 0.9159282, -1.325372, 0, 1, 0.5490196, 1,
-0.1423454, 0.328642, -1.192709, 0, 1, 0.5568628, 1,
-0.1411056, 0.07663537, -0.9044793, 0, 1, 0.5607843, 1,
-0.1389275, -0.337433, -2.193242, 0, 1, 0.5686275, 1,
-0.1360882, -2.453562, -4.088139, 0, 1, 0.572549, 1,
-0.1344651, 0.7790747, -0.2986191, 0, 1, 0.5803922, 1,
-0.1342728, 3.485368, 1.138047, 0, 1, 0.5843138, 1,
-0.1289705, 0.8462902, -1.933215, 0, 1, 0.5921569, 1,
-0.1278018, -0.1341086, -1.942035, 0, 1, 0.5960785, 1,
-0.1270283, 0.1735924, 1.053989, 0, 1, 0.6039216, 1,
-0.1252483, 1.08583, 1.033896, 0, 1, 0.6117647, 1,
-0.1246554, -0.3147073, -2.090398, 0, 1, 0.6156863, 1,
-0.1245894, -1.05389, -4.107841, 0, 1, 0.6235294, 1,
-0.124336, -2.026013, -3.964132, 0, 1, 0.627451, 1,
-0.1199471, -0.2733451, -0.8808784, 0, 1, 0.6352941, 1,
-0.1162455, 0.1779338, -2.720758, 0, 1, 0.6392157, 1,
-0.1063948, -0.2966755, -1.72041, 0, 1, 0.6470588, 1,
-0.105994, 1.703739, -0.03581109, 0, 1, 0.6509804, 1,
-0.103661, -0.754741, -1.128048, 0, 1, 0.6588235, 1,
-0.1022839, -1.164726, -2.096075, 0, 1, 0.6627451, 1,
-0.1003733, -0.5725331, -3.137716, 0, 1, 0.6705883, 1,
-0.09934149, -1.076375, -5.187692, 0, 1, 0.6745098, 1,
-0.09222473, -0.9681737, -2.598724, 0, 1, 0.682353, 1,
-0.08988526, -0.6098158, -1.3703, 0, 1, 0.6862745, 1,
-0.08886962, 0.2416134, 0.5927307, 0, 1, 0.6941177, 1,
-0.08655903, 1.809849, 0.533374, 0, 1, 0.7019608, 1,
-0.08467848, -0.1054189, -1.408477, 0, 1, 0.7058824, 1,
-0.08103602, -1.988957, -4.346064, 0, 1, 0.7137255, 1,
-0.07389101, 0.356437, -1.814268, 0, 1, 0.7176471, 1,
-0.07358505, -0.3585891, -2.547348, 0, 1, 0.7254902, 1,
-0.07163368, -0.3803371, -2.420971, 0, 1, 0.7294118, 1,
-0.07044211, -0.6211722, -4.162775, 0, 1, 0.7372549, 1,
-0.06827904, -0.9501517, -3.555215, 0, 1, 0.7411765, 1,
-0.065667, -0.2769944, -2.554559, 0, 1, 0.7490196, 1,
-0.06550912, -1.58252, -3.30918, 0, 1, 0.7529412, 1,
-0.06320957, 1.142806, 0.6118677, 0, 1, 0.7607843, 1,
-0.06153014, -0.7933387, -2.486858, 0, 1, 0.7647059, 1,
-0.05663326, 0.1139067, -1.855317, 0, 1, 0.772549, 1,
-0.0565749, 0.6306587, 1.087871, 0, 1, 0.7764706, 1,
-0.05366633, -0.07801735, -3.443806, 0, 1, 0.7843137, 1,
-0.04902722, 1.012776, -1.157876, 0, 1, 0.7882353, 1,
-0.04605327, 0.5333228, -0.1478634, 0, 1, 0.7960784, 1,
-0.04277414, -0.4034482, -2.391909, 0, 1, 0.8039216, 1,
-0.04035197, -0.7768462, -5.250413, 0, 1, 0.8078431, 1,
-0.03983663, 0.9072545, 0.8131419, 0, 1, 0.8156863, 1,
-0.03605124, -1.180981, -3.563343, 0, 1, 0.8196079, 1,
-0.03267049, 0.4839608, 1.634854, 0, 1, 0.827451, 1,
-0.03002311, -1.021423, -1.918701, 0, 1, 0.8313726, 1,
-0.02974763, -1.019082, -2.835371, 0, 1, 0.8392157, 1,
-0.02819639, 0.9759449, -0.8460637, 0, 1, 0.8431373, 1,
-0.02418742, -0.7478538, -3.966748, 0, 1, 0.8509804, 1,
-0.01804577, 2.009346, 2.13033, 0, 1, 0.854902, 1,
-0.01729078, 1.045092, 0.5551066, 0, 1, 0.8627451, 1,
-0.01172489, 0.7165076, 0.9162632, 0, 1, 0.8666667, 1,
-0.009781216, 1.033659, 1.007666, 0, 1, 0.8745098, 1,
-0.005641589, -0.8677182, -2.275623, 0, 1, 0.8784314, 1,
-0.001556722, -0.0683054, -4.270504, 0, 1, 0.8862745, 1,
-0.001322368, -0.07170738, -3.951337, 0, 1, 0.8901961, 1,
0.003616614, 0.6543779, -1.024892, 0, 1, 0.8980392, 1,
0.004678965, -0.1933977, 3.62819, 0, 1, 0.9058824, 1,
0.006923643, 0.3511927, -0.6901146, 0, 1, 0.9098039, 1,
0.01618434, 0.1438973, -1.023916, 0, 1, 0.9176471, 1,
0.01763034, 1.275961, -0.579798, 0, 1, 0.9215686, 1,
0.01857756, 0.3411998, 1.209636, 0, 1, 0.9294118, 1,
0.01923272, -0.242872, 2.343069, 0, 1, 0.9333333, 1,
0.02026381, -1.068211, 3.495917, 0, 1, 0.9411765, 1,
0.02195658, -0.01948367, 1.857601, 0, 1, 0.945098, 1,
0.02205247, 0.6024564, -0.5649855, 0, 1, 0.9529412, 1,
0.02382362, -1.812393, 2.440518, 0, 1, 0.9568627, 1,
0.02814193, 2.92735, -1.828982, 0, 1, 0.9647059, 1,
0.03189515, -0.3028658, 3.938204, 0, 1, 0.9686275, 1,
0.03491878, 1.850346, 0.7083173, 0, 1, 0.9764706, 1,
0.03580306, 1.229101, -0.2368067, 0, 1, 0.9803922, 1,
0.03838028, 0.01592301, -0.5144421, 0, 1, 0.9882353, 1,
0.04171321, 0.2045771, 1.630154, 0, 1, 0.9921569, 1,
0.04247672, 0.3454016, 2.225653, 0, 1, 1, 1,
0.04446108, 1.784031, 0.1441762, 0, 0.9921569, 1, 1,
0.04514454, 0.08591401, 0.1604331, 0, 0.9882353, 1, 1,
0.04568335, -0.0007381805, 1.777719, 0, 0.9803922, 1, 1,
0.05017003, -0.2981386, 2.44104, 0, 0.9764706, 1, 1,
0.0524423, 0.6639961, 0.6267276, 0, 0.9686275, 1, 1,
0.05247159, -1.358341, 2.51421, 0, 0.9647059, 1, 1,
0.05327838, -0.5873787, 2.543507, 0, 0.9568627, 1, 1,
0.06174739, 0.01396185, 1.874394, 0, 0.9529412, 1, 1,
0.061761, 0.4634169, -0.00491438, 0, 0.945098, 1, 1,
0.0680298, 0.02934224, 1.397754, 0, 0.9411765, 1, 1,
0.06950376, -0.4520723, 5.010934, 0, 0.9333333, 1, 1,
0.07640814, 1.573485, 0.4577051, 0, 0.9294118, 1, 1,
0.07766542, 1.646502, -0.3857121, 0, 0.9215686, 1, 1,
0.0806496, 0.3583166, 0.4236351, 0, 0.9176471, 1, 1,
0.08516201, -1.157409, 2.398863, 0, 0.9098039, 1, 1,
0.100422, -0.005498102, 0.8960218, 0, 0.9058824, 1, 1,
0.1007926, 0.3704174, -1.121382, 0, 0.8980392, 1, 1,
0.1023815, -0.9923458, 3.070984, 0, 0.8901961, 1, 1,
0.1127829, 0.8356038, -0.4029424, 0, 0.8862745, 1, 1,
0.1177987, 0.2541461, -1.191071, 0, 0.8784314, 1, 1,
0.1223163, 0.006482325, 0.8612556, 0, 0.8745098, 1, 1,
0.1303329, 1.101098, -0.7682641, 0, 0.8666667, 1, 1,
0.1303537, 0.254778, 1.233564, 0, 0.8627451, 1, 1,
0.13316, -1.395686, 3.621958, 0, 0.854902, 1, 1,
0.1339314, 1.938632, 1.410015, 0, 0.8509804, 1, 1,
0.1421035, -0.3388528, 2.963021, 0, 0.8431373, 1, 1,
0.1458115, 0.7830135, -0.7272177, 0, 0.8392157, 1, 1,
0.1475783, -0.1373937, 2.453917, 0, 0.8313726, 1, 1,
0.1517268, 0.1183425, 0.3657675, 0, 0.827451, 1, 1,
0.1524897, 0.4322883, -0.7715475, 0, 0.8196079, 1, 1,
0.153263, -0.09550334, 1.187437, 0, 0.8156863, 1, 1,
0.1540131, 0.8250405, 0.7454591, 0, 0.8078431, 1, 1,
0.1542527, 1.164374, -0.748347, 0, 0.8039216, 1, 1,
0.1546941, -1.051471, 2.239592, 0, 0.7960784, 1, 1,
0.1564572, 0.3274611, 0.7563094, 0, 0.7882353, 1, 1,
0.1583721, -0.5665423, 2.150558, 0, 0.7843137, 1, 1,
0.1609721, 2.260292, -0.09948797, 0, 0.7764706, 1, 1,
0.1661077, -0.6771472, 4.097383, 0, 0.772549, 1, 1,
0.1662101, -1.203643, 3.901684, 0, 0.7647059, 1, 1,
0.1687612, -0.4456381, 3.772372, 0, 0.7607843, 1, 1,
0.1695327, 0.1341707, 1.249962, 0, 0.7529412, 1, 1,
0.1701858, -0.03182099, 1.820988, 0, 0.7490196, 1, 1,
0.1728773, -0.6525314, 4.029202, 0, 0.7411765, 1, 1,
0.1762395, -0.4031083, 2.880188, 0, 0.7372549, 1, 1,
0.1825853, 2.109278, 0.2947469, 0, 0.7294118, 1, 1,
0.1829082, -0.4560203, 2.133715, 0, 0.7254902, 1, 1,
0.1891958, 0.4447916, 2.204053, 0, 0.7176471, 1, 1,
0.1906305, -0.2009589, 2.954665, 0, 0.7137255, 1, 1,
0.1931891, 2.043542, -2.626234, 0, 0.7058824, 1, 1,
0.1952072, 0.9561538, 1.136058, 0, 0.6980392, 1, 1,
0.1958582, -0.9681323, 4.094272, 0, 0.6941177, 1, 1,
0.196234, 0.6600887, 0.8386795, 0, 0.6862745, 1, 1,
0.1976928, 0.3565109, 0.7751866, 0, 0.682353, 1, 1,
0.1989312, -2.467563, 5.521959, 0, 0.6745098, 1, 1,
0.2028821, -0.05993802, 2.820715, 0, 0.6705883, 1, 1,
0.2048788, -1.249102, 2.036566, 0, 0.6627451, 1, 1,
0.2096429, 0.09086102, -0.5963848, 0, 0.6588235, 1, 1,
0.2195503, 1.029056, -1.547757, 0, 0.6509804, 1, 1,
0.2262776, -0.3526231, 4.030336, 0, 0.6470588, 1, 1,
0.226694, -0.7385385, 3.178157, 0, 0.6392157, 1, 1,
0.2294852, 0.8338109, 0.8739831, 0, 0.6352941, 1, 1,
0.2308244, -1.416309, 3.023718, 0, 0.627451, 1, 1,
0.2325235, 0.562875, -0.1814413, 0, 0.6235294, 1, 1,
0.2341665, -0.171732, 2.335441, 0, 0.6156863, 1, 1,
0.2355009, 2.158126, 0.8246415, 0, 0.6117647, 1, 1,
0.2366619, -2.009308, 4.377743, 0, 0.6039216, 1, 1,
0.2372169, 0.3048292, -0.2031133, 0, 0.5960785, 1, 1,
0.2399245, -0.8895364, 2.237798, 0, 0.5921569, 1, 1,
0.2432962, -1.293394, 1.724091, 0, 0.5843138, 1, 1,
0.2434251, 0.1246112, 0.3040177, 0, 0.5803922, 1, 1,
0.2478443, 1.27709, 1.909035, 0, 0.572549, 1, 1,
0.2512774, 0.9633498, 0.6934867, 0, 0.5686275, 1, 1,
0.2512887, 0.6688954, 1.153904, 0, 0.5607843, 1, 1,
0.2578575, -0.6773559, 3.6674, 0, 0.5568628, 1, 1,
0.2601607, 1.895246, 0.6086209, 0, 0.5490196, 1, 1,
0.2608545, 0.2190914, 1.033468, 0, 0.5450981, 1, 1,
0.2609122, 0.9931686, -0.6061952, 0, 0.5372549, 1, 1,
0.2609781, 0.08543932, 2.01003, 0, 0.5333334, 1, 1,
0.261444, 0.006360489, 0.6824239, 0, 0.5254902, 1, 1,
0.2635664, -1.742252, 4.857177, 0, 0.5215687, 1, 1,
0.2636683, -1.05095, 2.533768, 0, 0.5137255, 1, 1,
0.2678628, 0.2622732, 1.079073, 0, 0.509804, 1, 1,
0.2692209, -0.8725746, 2.492335, 0, 0.5019608, 1, 1,
0.2693414, -1.186416, 1.990375, 0, 0.4941176, 1, 1,
0.2693523, 0.3266433, 1.320451, 0, 0.4901961, 1, 1,
0.2722223, -2.46053, 3.328878, 0, 0.4823529, 1, 1,
0.2777156, 0.8648587, -0.2175274, 0, 0.4784314, 1, 1,
0.2836123, 0.4214732, -0.2356724, 0, 0.4705882, 1, 1,
0.2843696, -2.517565, 2.729167, 0, 0.4666667, 1, 1,
0.287631, -0.02951269, 0.49873, 0, 0.4588235, 1, 1,
0.2913474, 0.7584291, -0.7460335, 0, 0.454902, 1, 1,
0.2917999, -0.2652147, 4.369407, 0, 0.4470588, 1, 1,
0.2955879, 1.576916, 0.3509288, 0, 0.4431373, 1, 1,
0.2966828, -0.2229516, 2.418497, 0, 0.4352941, 1, 1,
0.2991237, 0.7976921, -0.2642976, 0, 0.4313726, 1, 1,
0.29963, 0.2421462, 0.8747991, 0, 0.4235294, 1, 1,
0.3003168, -0.4665782, 0.5175383, 0, 0.4196078, 1, 1,
0.3040715, 1.400167, -0.7758802, 0, 0.4117647, 1, 1,
0.3074303, 1.739474, 0.6804147, 0, 0.4078431, 1, 1,
0.3089865, -0.003062718, 1.335953, 0, 0.4, 1, 1,
0.3128889, 0.6989256, -0.1003695, 0, 0.3921569, 1, 1,
0.3139919, -0.5494488, 5.011878, 0, 0.3882353, 1, 1,
0.3193266, -0.7511327, 3.816481, 0, 0.3803922, 1, 1,
0.3246192, 2.72013, 0.7431981, 0, 0.3764706, 1, 1,
0.3260551, 0.8855227, 1.050575, 0, 0.3686275, 1, 1,
0.3289468, 0.7956713, 0.2562008, 0, 0.3647059, 1, 1,
0.3305393, -1.043899, 2.586639, 0, 0.3568628, 1, 1,
0.3324931, 0.4152704, 0.06570505, 0, 0.3529412, 1, 1,
0.3369184, 0.6251152, 0.01769173, 0, 0.345098, 1, 1,
0.3380114, 1.572255, 1.018525, 0, 0.3411765, 1, 1,
0.3395179, 0.7432232, -0.5092005, 0, 0.3333333, 1, 1,
0.3413723, 0.5330431, 1.624222, 0, 0.3294118, 1, 1,
0.3439399, -0.8802697, 4.617841, 0, 0.3215686, 1, 1,
0.3490144, -0.7976723, 3.597569, 0, 0.3176471, 1, 1,
0.3534351, -0.2555915, 2.623762, 0, 0.3098039, 1, 1,
0.3571095, -0.1536152, 1.778835, 0, 0.3058824, 1, 1,
0.3586336, -1.124945, 1.635844, 0, 0.2980392, 1, 1,
0.3605155, 0.5357308, 0.5798926, 0, 0.2901961, 1, 1,
0.3621665, -0.4115385, 0.9348685, 0, 0.2862745, 1, 1,
0.3638313, 2.299955, -1.919239, 0, 0.2784314, 1, 1,
0.3649549, -0.4702738, 2.285236, 0, 0.2745098, 1, 1,
0.3652866, -0.7253435, 3.786183, 0, 0.2666667, 1, 1,
0.3690961, 0.9795272, 0.2748602, 0, 0.2627451, 1, 1,
0.3698882, -0.937953, 3.35183, 0, 0.254902, 1, 1,
0.37852, 1.035407, -0.5211329, 0, 0.2509804, 1, 1,
0.3791918, -0.3040069, 3.503942, 0, 0.2431373, 1, 1,
0.3835206, -1.269714, 2.482195, 0, 0.2392157, 1, 1,
0.386229, -0.1694617, 2.498946, 0, 0.2313726, 1, 1,
0.3876538, 0.600928, 0.7865496, 0, 0.227451, 1, 1,
0.3934571, -0.3228962, 3.177802, 0, 0.2196078, 1, 1,
0.3949247, -1.613068, 2.243232, 0, 0.2156863, 1, 1,
0.3953902, 1.131355, 0.4375327, 0, 0.2078431, 1, 1,
0.3958084, 0.2066671, 2.036711, 0, 0.2039216, 1, 1,
0.3959005, -0.6526935, 1.788768, 0, 0.1960784, 1, 1,
0.3976275, 0.2743717, 2.724562, 0, 0.1882353, 1, 1,
0.4001686, 0.05191237, 1.805758, 0, 0.1843137, 1, 1,
0.4023623, 1.834385, 1.010256, 0, 0.1764706, 1, 1,
0.403424, 0.818391, 0.5076475, 0, 0.172549, 1, 1,
0.4058169, -1.242842, 3.394236, 0, 0.1647059, 1, 1,
0.4064389, 1.997272, -0.3231954, 0, 0.1607843, 1, 1,
0.4072984, 0.776849, 0.8603122, 0, 0.1529412, 1, 1,
0.4096723, 0.5332322, 1.895176, 0, 0.1490196, 1, 1,
0.4167501, -0.7919281, 1.419516, 0, 0.1411765, 1, 1,
0.4188545, -1.137791, 2.74223, 0, 0.1372549, 1, 1,
0.4188904, 0.2290728, 1.18368, 0, 0.1294118, 1, 1,
0.424408, -0.1911962, 1.617662, 0, 0.1254902, 1, 1,
0.4262489, -0.6197915, 1.286251, 0, 0.1176471, 1, 1,
0.4274861, -0.3881218, 1.801161, 0, 0.1137255, 1, 1,
0.4291602, -1.242089, 2.464593, 0, 0.1058824, 1, 1,
0.4309732, 0.6261072, 1.178993, 0, 0.09803922, 1, 1,
0.4323012, -0.1824692, 1.755345, 0, 0.09411765, 1, 1,
0.4323257, 0.1610333, 0.4964718, 0, 0.08627451, 1, 1,
0.4331774, 0.704399, 0.9672101, 0, 0.08235294, 1, 1,
0.4355363, 0.1304522, 0.4855343, 0, 0.07450981, 1, 1,
0.4367213, -0.0906161, 1.302563, 0, 0.07058824, 1, 1,
0.4442308, 1.590757, 0.4549373, 0, 0.0627451, 1, 1,
0.4523334, 0.4950164, 0.8496695, 0, 0.05882353, 1, 1,
0.4542237, -0.1303645, 3.347553, 0, 0.05098039, 1, 1,
0.4547433, -0.09323052, 1.849462, 0, 0.04705882, 1, 1,
0.45569, -0.3466151, 3.311091, 0, 0.03921569, 1, 1,
0.4566708, 0.2591924, 0.5877638, 0, 0.03529412, 1, 1,
0.4576092, -1.085133, 5.588347, 0, 0.02745098, 1, 1,
0.4603889, 0.468318, -0.5180376, 0, 0.02352941, 1, 1,
0.4604077, 1.5064, -1.479743, 0, 0.01568628, 1, 1,
0.460514, 0.2535325, -0.732222, 0, 0.01176471, 1, 1,
0.4611082, 0.2756396, 2.658933, 0, 0.003921569, 1, 1,
0.4613699, -0.5938273, 2.762847, 0.003921569, 0, 1, 1,
0.4617853, -0.06064272, 1.875431, 0.007843138, 0, 1, 1,
0.4636557, -0.2138196, 2.380298, 0.01568628, 0, 1, 1,
0.4636905, -1.180646, 2.426117, 0.01960784, 0, 1, 1,
0.4640455, -0.6934158, 2.439984, 0.02745098, 0, 1, 1,
0.4711653, 0.3226045, 1.977734, 0.03137255, 0, 1, 1,
0.4731953, 0.890462, 2.322586, 0.03921569, 0, 1, 1,
0.4741747, -0.2280773, 3.44751, 0.04313726, 0, 1, 1,
0.4760694, -2.303699, 1.621815, 0.05098039, 0, 1, 1,
0.477553, 0.9934207, -0.5317368, 0.05490196, 0, 1, 1,
0.4776026, 1.212713, -0.676799, 0.0627451, 0, 1, 1,
0.4784681, 0.1803224, 0.858064, 0.06666667, 0, 1, 1,
0.4807293, -0.1206116, 1.468362, 0.07450981, 0, 1, 1,
0.4815608, 0.2594441, 2.052102, 0.07843138, 0, 1, 1,
0.4819392, 0.1226269, 3.060988, 0.08627451, 0, 1, 1,
0.4865336, -0.7599062, 3.305535, 0.09019608, 0, 1, 1,
0.4872316, -0.6758572, 3.082968, 0.09803922, 0, 1, 1,
0.4930645, 0.03806018, 3.44861, 0.1058824, 0, 1, 1,
0.4935656, 0.4412988, -0.2366747, 0.1098039, 0, 1, 1,
0.4940085, 0.2492001, 0.1899164, 0.1176471, 0, 1, 1,
0.4981378, -0.4683596, 2.179515, 0.1215686, 0, 1, 1,
0.5030279, 1.260145, -0.4795381, 0.1294118, 0, 1, 1,
0.5117989, -0.710108, 1.379326, 0.1333333, 0, 1, 1,
0.5156726, 1.006091, 2.601208, 0.1411765, 0, 1, 1,
0.5158402, -0.3056807, 1.747224, 0.145098, 0, 1, 1,
0.5171854, 0.1018092, 1.002007, 0.1529412, 0, 1, 1,
0.5195565, 2.876217, -0.7060218, 0.1568628, 0, 1, 1,
0.5199875, 0.6492917, 1.128087, 0.1647059, 0, 1, 1,
0.5211936, 0.708037, -0.0915697, 0.1686275, 0, 1, 1,
0.5245125, -0.2429784, 0.4355389, 0.1764706, 0, 1, 1,
0.5281577, -1.155172, 0.8962095, 0.1803922, 0, 1, 1,
0.5309349, -0.3193967, 1.785028, 0.1882353, 0, 1, 1,
0.5348634, -0.9257475, 1.791537, 0.1921569, 0, 1, 1,
0.5349468, -1.461888, 4.834908, 0.2, 0, 1, 1,
0.5374264, 0.1515417, 0.1680042, 0.2078431, 0, 1, 1,
0.5375138, -0.6225895, 2.709731, 0.2117647, 0, 1, 1,
0.5406252, -1.565109, 3.793286, 0.2196078, 0, 1, 1,
0.5406588, -0.09564756, 1.57328, 0.2235294, 0, 1, 1,
0.5430019, -0.1606914, 1.146377, 0.2313726, 0, 1, 1,
0.5454587, -0.2061071, 0.5647418, 0.2352941, 0, 1, 1,
0.5515739, 0.1217397, 2.24273, 0.2431373, 0, 1, 1,
0.5607904, -0.003669917, 3.017957, 0.2470588, 0, 1, 1,
0.5657982, 0.09756099, 2.24404, 0.254902, 0, 1, 1,
0.5688586, 1.168739, -1.357243, 0.2588235, 0, 1, 1,
0.5690355, 0.3869984, 0.1607441, 0.2666667, 0, 1, 1,
0.5717251, -1.193873, 3.897563, 0.2705882, 0, 1, 1,
0.5726949, 1.221576, 0.8828665, 0.2784314, 0, 1, 1,
0.5744488, 2.317633, 0.7683977, 0.282353, 0, 1, 1,
0.5747804, 0.4459082, 0.7896181, 0.2901961, 0, 1, 1,
0.5755802, 0.08168101, 0.5897734, 0.2941177, 0, 1, 1,
0.5770907, -1.658706, 2.892051, 0.3019608, 0, 1, 1,
0.5831059, 0.7177629, 1.416076, 0.3098039, 0, 1, 1,
0.5927555, -0.4232734, 3.005068, 0.3137255, 0, 1, 1,
0.5938386, -0.08354264, 1.791625, 0.3215686, 0, 1, 1,
0.5969325, 0.2356629, 0.9703344, 0.3254902, 0, 1, 1,
0.5979188, 0.4577709, 1.187747, 0.3333333, 0, 1, 1,
0.6042471, 0.3403776, 0.7703098, 0.3372549, 0, 1, 1,
0.6095873, 1.557372, 0.5805726, 0.345098, 0, 1, 1,
0.6104507, -0.5164273, 3.573532, 0.3490196, 0, 1, 1,
0.612549, -0.8093121, 1.883056, 0.3568628, 0, 1, 1,
0.6127999, -0.5446214, 2.445602, 0.3607843, 0, 1, 1,
0.617798, 0.378421, -1.172092, 0.3686275, 0, 1, 1,
0.6215611, -0.6635996, 1.430949, 0.372549, 0, 1, 1,
0.6228579, -0.773678, 3.700168, 0.3803922, 0, 1, 1,
0.6241351, -0.7480668, 2.809829, 0.3843137, 0, 1, 1,
0.6256378, 0.1065118, 0.4779347, 0.3921569, 0, 1, 1,
0.6368833, -1.312842, 3.54682, 0.3960784, 0, 1, 1,
0.6370706, -0.4568975, 3.435807, 0.4039216, 0, 1, 1,
0.6382819, -0.3848499, 2.040386, 0.4117647, 0, 1, 1,
0.6403744, -2.097028, 1.589025, 0.4156863, 0, 1, 1,
0.6504673, 0.5399651, 1.042157, 0.4235294, 0, 1, 1,
0.651811, 0.5229223, -0.6408322, 0.427451, 0, 1, 1,
0.6532263, -1.415935, 0.9326264, 0.4352941, 0, 1, 1,
0.6541296, -1.122599, 3.661729, 0.4392157, 0, 1, 1,
0.6541492, -0.7768858, 1.7312, 0.4470588, 0, 1, 1,
0.6582886, 1.077176, 0.890565, 0.4509804, 0, 1, 1,
0.6623712, -0.714925, 1.269978, 0.4588235, 0, 1, 1,
0.6680418, 0.4968682, 1.982381, 0.4627451, 0, 1, 1,
0.6745105, -1.150792, 1.044599, 0.4705882, 0, 1, 1,
0.6789896, 1.643598, 0.943143, 0.4745098, 0, 1, 1,
0.6793085, -0.9777352, 3.358061, 0.4823529, 0, 1, 1,
0.6909391, -1.090125, 2.144908, 0.4862745, 0, 1, 1,
0.6948549, -1.09314, 1.944633, 0.4941176, 0, 1, 1,
0.6960859, -1.509314, 3.227561, 0.5019608, 0, 1, 1,
0.699659, -0.7521759, 1.621618, 0.5058824, 0, 1, 1,
0.7043367, 1.380298, -0.3930185, 0.5137255, 0, 1, 1,
0.70558, -0.811994, 2.097113, 0.5176471, 0, 1, 1,
0.7144228, -2.109716, 1.928158, 0.5254902, 0, 1, 1,
0.7281684, -0.3132038, 1.928366, 0.5294118, 0, 1, 1,
0.7347385, -0.09897771, 3.092292, 0.5372549, 0, 1, 1,
0.7352794, 0.1733513, 2.427163, 0.5411765, 0, 1, 1,
0.7359245, 1.16536, -0.4274905, 0.5490196, 0, 1, 1,
0.7382447, 1.298, 0.1757857, 0.5529412, 0, 1, 1,
0.7424089, 1.918712, 0.5883518, 0.5607843, 0, 1, 1,
0.7434124, -0.8272911, 1.484178, 0.5647059, 0, 1, 1,
0.7482948, 1.389863, -0.1739834, 0.572549, 0, 1, 1,
0.7529783, 2.40305, 0.1060285, 0.5764706, 0, 1, 1,
0.7571621, 0.4217873, 0.7340102, 0.5843138, 0, 1, 1,
0.7645352, -1.910482, 1.821991, 0.5882353, 0, 1, 1,
0.7647678, -0.2964515, 1.645347, 0.5960785, 0, 1, 1,
0.7677186, 0.2728253, 2.663894, 0.6039216, 0, 1, 1,
0.7701458, 2.06356, 0.04875634, 0.6078432, 0, 1, 1,
0.7706871, -1.579995, 3.00545, 0.6156863, 0, 1, 1,
0.7728406, 1.582386, 1.233045, 0.6196079, 0, 1, 1,
0.7729549, 1.235283, -0.2316495, 0.627451, 0, 1, 1,
0.7745204, -1.159053, 3.191392, 0.6313726, 0, 1, 1,
0.7754275, -0.9472835, 0.4038995, 0.6392157, 0, 1, 1,
0.7782314, -1.192551, 2.063476, 0.6431373, 0, 1, 1,
0.7803116, -1.733899, 3.755546, 0.6509804, 0, 1, 1,
0.7804728, 1.400503, 0.7408798, 0.654902, 0, 1, 1,
0.7832949, 0.1119471, 1.596645, 0.6627451, 0, 1, 1,
0.7893142, 1.168242, -0.6996508, 0.6666667, 0, 1, 1,
0.789363, -0.008228799, 1.939301, 0.6745098, 0, 1, 1,
0.7931905, -1.23533, 0.6107532, 0.6784314, 0, 1, 1,
0.7975684, -0.7231371, 1.71325, 0.6862745, 0, 1, 1,
0.7988513, 1.653277, -0.5149567, 0.6901961, 0, 1, 1,
0.806981, -1.450637, 2.978473, 0.6980392, 0, 1, 1,
0.8105189, -0.7330317, 0.5664169, 0.7058824, 0, 1, 1,
0.8142794, -0.1405058, 0.02357873, 0.7098039, 0, 1, 1,
0.8196867, -1.042116, 3.367426, 0.7176471, 0, 1, 1,
0.823626, 1.139189, -1.519193, 0.7215686, 0, 1, 1,
0.824916, 1.615193, 1.554146, 0.7294118, 0, 1, 1,
0.8258004, 1.959378, 0.5247266, 0.7333333, 0, 1, 1,
0.8320929, -0.8975099, 3.14382, 0.7411765, 0, 1, 1,
0.8438639, -1.260589, 3.327048, 0.7450981, 0, 1, 1,
0.8472827, 0.460271, 0.7491208, 0.7529412, 0, 1, 1,
0.852643, 0.9296422, 1.286437, 0.7568628, 0, 1, 1,
0.8587167, 0.5004871, -0.4232044, 0.7647059, 0, 1, 1,
0.8588871, 0.02771533, 1.457791, 0.7686275, 0, 1, 1,
0.8594868, 0.2653883, 1.320001, 0.7764706, 0, 1, 1,
0.8630772, 0.468059, 1.750215, 0.7803922, 0, 1, 1,
0.8632547, -0.3574773, 2.464072, 0.7882353, 0, 1, 1,
0.8639039, -0.3139202, 2.355133, 0.7921569, 0, 1, 1,
0.8675874, 0.8885322, 1.390668, 0.8, 0, 1, 1,
0.8680483, 0.8379648, 1.448767, 0.8078431, 0, 1, 1,
0.8703149, -1.076139, 2.525837, 0.8117647, 0, 1, 1,
0.8820267, 0.2419773, -0.1721427, 0.8196079, 0, 1, 1,
0.884917, -0.51616, 4.694246, 0.8235294, 0, 1, 1,
0.8851043, 2.769425, -0.3892105, 0.8313726, 0, 1, 1,
0.889886, 0.9795442, 2.045552, 0.8352941, 0, 1, 1,
0.8985475, 0.1524142, 0.7475412, 0.8431373, 0, 1, 1,
0.8987083, 2.353443, 2.567566, 0.8470588, 0, 1, 1,
0.9011922, -0.3120126, 2.362695, 0.854902, 0, 1, 1,
0.9034694, -0.03438595, 2.181649, 0.8588235, 0, 1, 1,
0.9052215, -0.3165747, 3.242504, 0.8666667, 0, 1, 1,
0.9115965, 0.3432888, 0.3621913, 0.8705882, 0, 1, 1,
0.9191014, -0.06009148, 4.183692, 0.8784314, 0, 1, 1,
0.9202539, 0.08158855, 1.004905, 0.8823529, 0, 1, 1,
0.9233095, 2.283298, 1.446953, 0.8901961, 0, 1, 1,
0.925005, 0.4518099, 1.892865, 0.8941177, 0, 1, 1,
0.9268037, -0.1966514, 2.752275, 0.9019608, 0, 1, 1,
0.9320484, -0.1066787, 2.580901, 0.9098039, 0, 1, 1,
0.9390768, -2.009273, 2.036409, 0.9137255, 0, 1, 1,
0.943001, 0.135958, 2.394062, 0.9215686, 0, 1, 1,
0.9628535, 0.2574263, 4.064514, 0.9254902, 0, 1, 1,
0.9651957, 0.3615983, 2.34233, 0.9333333, 0, 1, 1,
0.965337, -0.3461628, 1.217956, 0.9372549, 0, 1, 1,
0.9812271, 0.5690432, 0.8574044, 0.945098, 0, 1, 1,
0.9859128, -1.513159, 3.135173, 0.9490196, 0, 1, 1,
0.9894575, -0.4322138, 0.7612026, 0.9568627, 0, 1, 1,
0.9936962, 1.845048, 0.2063285, 0.9607843, 0, 1, 1,
1.006912, -1.484512, 2.459147, 0.9686275, 0, 1, 1,
1.011781, 0.5619858, 1.328687, 0.972549, 0, 1, 1,
1.013686, -0.4674897, 1.892282, 0.9803922, 0, 1, 1,
1.015323, 0.3511087, 1.578349, 0.9843137, 0, 1, 1,
1.021464, -0.5591848, -0.02389734, 0.9921569, 0, 1, 1,
1.031873, -0.8266206, 1.002151, 0.9960784, 0, 1, 1,
1.034787, -1.034566, 0.7485518, 1, 0, 0.9960784, 1,
1.035566, 0.3566646, 1.864172, 1, 0, 0.9882353, 1,
1.040284, -0.2086007, 1.643603, 1, 0, 0.9843137, 1,
1.045784, 0.1554678, 1.060819, 1, 0, 0.9764706, 1,
1.048675, -1.887572, 2.615965, 1, 0, 0.972549, 1,
1.049756, 0.7298617, 1.20542, 1, 0, 0.9647059, 1,
1.058748, -1.655178, 3.581437, 1, 0, 0.9607843, 1,
1.062157, -1.193238, 0.472434, 1, 0, 0.9529412, 1,
1.063648, -1.350823, 3.331618, 1, 0, 0.9490196, 1,
1.071617, 0.5659302, 1.640323, 1, 0, 0.9411765, 1,
1.076063, 0.7419184, 0.9933642, 1, 0, 0.9372549, 1,
1.077088, -0.1050496, 2.274114, 1, 0, 0.9294118, 1,
1.082756, 0.3217696, 1.216475, 1, 0, 0.9254902, 1,
1.084703, -1.187187, 2.3448, 1, 0, 0.9176471, 1,
1.087863, 1.303513, -0.2450007, 1, 0, 0.9137255, 1,
1.096305, -1.146669, 2.540598, 1, 0, 0.9058824, 1,
1.097333, 0.6607638, 1.630497, 1, 0, 0.9019608, 1,
1.102079, -0.5177109, 1.256347, 1, 0, 0.8941177, 1,
1.104262, -0.6523134, 1.483814, 1, 0, 0.8862745, 1,
1.116281, 1.194087, 0.828573, 1, 0, 0.8823529, 1,
1.11664, 0.02540192, 1.167022, 1, 0, 0.8745098, 1,
1.117126, 0.3507759, 1.934537, 1, 0, 0.8705882, 1,
1.161559, -0.6327183, 1.520215, 1, 0, 0.8627451, 1,
1.164572, 1.441038, 0.7420379, 1, 0, 0.8588235, 1,
1.186163, -1.363886, 2.739925, 1, 0, 0.8509804, 1,
1.187904, -0.3316914, 2.371261, 1, 0, 0.8470588, 1,
1.189213, 0.9809459, -0.4045456, 1, 0, 0.8392157, 1,
1.189552, -0.3026605, 2.3621, 1, 0, 0.8352941, 1,
1.191969, -0.5886176, 0.3516004, 1, 0, 0.827451, 1,
1.199134, 1.470751, 2.34931, 1, 0, 0.8235294, 1,
1.206448, 0.09205849, 2.346428, 1, 0, 0.8156863, 1,
1.206483, 0.8229035, 1.99348, 1, 0, 0.8117647, 1,
1.213827, 0.03917986, 2.296067, 1, 0, 0.8039216, 1,
1.227178, -0.133416, 2.744021, 1, 0, 0.7960784, 1,
1.228615, -0.8766717, 3.658279, 1, 0, 0.7921569, 1,
1.23032, -0.7291254, 1.878211, 1, 0, 0.7843137, 1,
1.230983, 1.074483, 1.167828, 1, 0, 0.7803922, 1,
1.236565, 0.5940474, 2.415047, 1, 0, 0.772549, 1,
1.248855, -0.7934161, 4.018382, 1, 0, 0.7686275, 1,
1.24947, 0.6168414, 0.4204223, 1, 0, 0.7607843, 1,
1.254072, -0.7564113, 1.775278, 1, 0, 0.7568628, 1,
1.25474, -1.023398, 3.452819, 1, 0, 0.7490196, 1,
1.260705, 0.8888862, 1.51115, 1, 0, 0.7450981, 1,
1.261925, 0.5944287, -0.2247654, 1, 0, 0.7372549, 1,
1.276617, -0.6157784, 2.641577, 1, 0, 0.7333333, 1,
1.276674, -0.4864841, 2.186708, 1, 0, 0.7254902, 1,
1.293332, 0.04433843, 2.742431, 1, 0, 0.7215686, 1,
1.293517, 0.1287448, 0.9333581, 1, 0, 0.7137255, 1,
1.293631, 1.1767, 0.07371315, 1, 0, 0.7098039, 1,
1.296461, 1.172608, 0.5440406, 1, 0, 0.7019608, 1,
1.311938, -0.03167682, 0.2829673, 1, 0, 0.6941177, 1,
1.314504, -0.7677622, 0.5233371, 1, 0, 0.6901961, 1,
1.321513, -0.3925484, 2.442094, 1, 0, 0.682353, 1,
1.324202, 0.1965825, 1.057484, 1, 0, 0.6784314, 1,
1.325338, 0.334929, 2.064021, 1, 0, 0.6705883, 1,
1.337729, 0.7561486, 0.09699736, 1, 0, 0.6666667, 1,
1.340456, -1.241395, 3.968259, 1, 0, 0.6588235, 1,
1.344188, -1.682806, -0.1906821, 1, 0, 0.654902, 1,
1.347692, 0.1617042, 1.60332, 1, 0, 0.6470588, 1,
1.35479, 1.366379, -0.01670239, 1, 0, 0.6431373, 1,
1.367829, 0.186854, 0.6059741, 1, 0, 0.6352941, 1,
1.372587, -1.308713, 1.02996, 1, 0, 0.6313726, 1,
1.373485, -0.462105, 1.667113, 1, 0, 0.6235294, 1,
1.375163, 0.4873942, -0.358807, 1, 0, 0.6196079, 1,
1.379843, -0.9665268, 0.6814004, 1, 0, 0.6117647, 1,
1.393371, 0.5884967, 0.9305962, 1, 0, 0.6078432, 1,
1.399063, 0.08529076, 0.9646063, 1, 0, 0.6, 1,
1.400448, -1.070362, 1.512164, 1, 0, 0.5921569, 1,
1.407358, -0.1187702, 1.974966, 1, 0, 0.5882353, 1,
1.414017, -1.622732, 2.180181, 1, 0, 0.5803922, 1,
1.425268, 0.1665514, 0.7496749, 1, 0, 0.5764706, 1,
1.45239, -0.6997401, 1.014015, 1, 0, 0.5686275, 1,
1.462545, 0.37565, 2.940993, 1, 0, 0.5647059, 1,
1.468083, 0.2304723, 0.8933879, 1, 0, 0.5568628, 1,
1.487854, -0.392549, 2.959263, 1, 0, 0.5529412, 1,
1.488813, 0.1428694, 0.0982278, 1, 0, 0.5450981, 1,
1.49475, 1.349037, 3.136716, 1, 0, 0.5411765, 1,
1.507555, 0.4206319, -0.7211774, 1, 0, 0.5333334, 1,
1.509029, -0.1950404, -0.589026, 1, 0, 0.5294118, 1,
1.51603, -0.04758629, 3.374596, 1, 0, 0.5215687, 1,
1.519926, 0.787149, -0.06267305, 1, 0, 0.5176471, 1,
1.52118, -1.133121, 4.486517, 1, 0, 0.509804, 1,
1.521662, -1.084912, 3.43312, 1, 0, 0.5058824, 1,
1.522494, -0.9928389, 1.811061, 1, 0, 0.4980392, 1,
1.537364, 1.683873, -0.09224976, 1, 0, 0.4901961, 1,
1.555333, -1.405467, 2.07742, 1, 0, 0.4862745, 1,
1.571389, 2.017365, 0.1234234, 1, 0, 0.4784314, 1,
1.572357, 0.1419407, 1.858175, 1, 0, 0.4745098, 1,
1.575189, 0.1757879, 2.20001, 1, 0, 0.4666667, 1,
1.584838, 0.0788148, 1.483624, 1, 0, 0.4627451, 1,
1.591757, -0.8533036, 1.82221, 1, 0, 0.454902, 1,
1.595082, -0.898446, 1.08409, 1, 0, 0.4509804, 1,
1.597759, 1.073476, 0.3806229, 1, 0, 0.4431373, 1,
1.604371, -0.7620982, 2.619606, 1, 0, 0.4392157, 1,
1.637171, -0.1496821, 3.349631, 1, 0, 0.4313726, 1,
1.637582, -0.9494423, 0.9141313, 1, 0, 0.427451, 1,
1.639488, -0.8383376, 2.062597, 1, 0, 0.4196078, 1,
1.649391, 0.558269, 2.320784, 1, 0, 0.4156863, 1,
1.650181, -0.3836832, 4.579806, 1, 0, 0.4078431, 1,
1.657538, -1.436388, 1.04047, 1, 0, 0.4039216, 1,
1.657812, -1.173478, 1.544096, 1, 0, 0.3960784, 1,
1.658871, 0.9423156, 1.70383, 1, 0, 0.3882353, 1,
1.667019, -0.7599601, 2.190372, 1, 0, 0.3843137, 1,
1.667887, 0.4403781, 2.39894, 1, 0, 0.3764706, 1,
1.69294, 1.277823, 1.302935, 1, 0, 0.372549, 1,
1.705258, 0.1730572, 2.321666, 1, 0, 0.3647059, 1,
1.713049, -1.100766, 2.172981, 1, 0, 0.3607843, 1,
1.72217, -0.701863, 1.077733, 1, 0, 0.3529412, 1,
1.732959, 0.6839036, 2.36111, 1, 0, 0.3490196, 1,
1.734476, -2.29479, 0.9928257, 1, 0, 0.3411765, 1,
1.743318, -0.8762802, 2.915987, 1, 0, 0.3372549, 1,
1.745252, 0.1304911, 0.4982743, 1, 0, 0.3294118, 1,
1.799773, 1.466859, -0.1209074, 1, 0, 0.3254902, 1,
1.800954, 0.5625559, 0.03874125, 1, 0, 0.3176471, 1,
1.848344, -0.3151461, 3.200752, 1, 0, 0.3137255, 1,
1.874403, 0.7761825, 1.227232, 1, 0, 0.3058824, 1,
1.882434, -1.044511, 0.5789992, 1, 0, 0.2980392, 1,
1.891431, 0.6214889, 1.638481, 1, 0, 0.2941177, 1,
1.909468, 2.133013, -1.152732, 1, 0, 0.2862745, 1,
1.911665, -1.323224, 1.724155, 1, 0, 0.282353, 1,
1.913886, 0.5521714, 3.608417, 1, 0, 0.2745098, 1,
1.916097, 0.9104383, 2.319082, 1, 0, 0.2705882, 1,
1.932181, -1.14858, 2.60652, 1, 0, 0.2627451, 1,
1.934141, -0.4584751, 1.863005, 1, 0, 0.2588235, 1,
1.936487, 0.3161675, 0.3764434, 1, 0, 0.2509804, 1,
1.947275, 1.073418, -0.6838582, 1, 0, 0.2470588, 1,
1.960911, -2.381452, 2.496105, 1, 0, 0.2392157, 1,
1.962774, 1.381944, 2.526186, 1, 0, 0.2352941, 1,
1.969199, -0.8675599, 2.775435, 1, 0, 0.227451, 1,
1.973374, 1.865241, 2.316493, 1, 0, 0.2235294, 1,
1.975204, 0.3082714, 2.561732, 1, 0, 0.2156863, 1,
1.977766, -0.6505228, 1.276711, 1, 0, 0.2117647, 1,
2.006692, -0.1161548, 1.444603, 1, 0, 0.2039216, 1,
2.013832, -0.4037159, 0.5571683, 1, 0, 0.1960784, 1,
2.029313, -0.2036676, 2.008697, 1, 0, 0.1921569, 1,
2.029477, -0.3599067, 2.150065, 1, 0, 0.1843137, 1,
2.039822, 0.4572741, 2.445518, 1, 0, 0.1803922, 1,
2.045385, -1.473837, 2.868412, 1, 0, 0.172549, 1,
2.04641, -0.6364452, 0.08337051, 1, 0, 0.1686275, 1,
2.052584, -0.05194476, 2.214861, 1, 0, 0.1607843, 1,
2.091484, 1.056876, 0.9295557, 1, 0, 0.1568628, 1,
2.101261, 0.6465005, 0.7178352, 1, 0, 0.1490196, 1,
2.112058, 0.03736548, 1.016185, 1, 0, 0.145098, 1,
2.122007, 1.215775, -0.06331825, 1, 0, 0.1372549, 1,
2.125594, 0.858578, 2.45163, 1, 0, 0.1333333, 1,
2.163999, -0.3827063, -0.05805393, 1, 0, 0.1254902, 1,
2.174651, 0.1213796, 1.205016, 1, 0, 0.1215686, 1,
2.211277, -0.8693463, 3.341264, 1, 0, 0.1137255, 1,
2.254042, -0.2629223, 2.663394, 1, 0, 0.1098039, 1,
2.259557, 0.3421972, 0.5763406, 1, 0, 0.1019608, 1,
2.26141, 1.004934, 0.7801047, 1, 0, 0.09411765, 1,
2.27488, -0.5197337, 1.756315, 1, 0, 0.09019608, 1,
2.287438, -1.311956, 2.076773, 1, 0, 0.08235294, 1,
2.321051, 0.4711196, 2.005694, 1, 0, 0.07843138, 1,
2.347475, 0.6968078, 0.01217258, 1, 0, 0.07058824, 1,
2.396437, -0.7393731, 2.477018, 1, 0, 0.06666667, 1,
2.434737, -0.2297835, -0.09285994, 1, 0, 0.05882353, 1,
2.456712, 0.5072066, 1.452258, 1, 0, 0.05490196, 1,
2.474989, -0.9204318, 1.921048, 1, 0, 0.04705882, 1,
2.53358, 0.3841695, 3.874917, 1, 0, 0.04313726, 1,
2.543744, 0.3517585, -0.06981672, 1, 0, 0.03529412, 1,
2.596726, 0.4754041, -0.8065562, 1, 0, 0.03137255, 1,
2.665365, 2.211977, 2.788949, 1, 0, 0.02352941, 1,
2.683564, -0.6863014, 1.409881, 1, 0, 0.01960784, 1,
2.733541, 0.7606865, 2.565353, 1, 0, 0.01176471, 1,
3.110169, 2.102687, 1.318686, 1, 0, 0.007843138, 1
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
-0.2932755, -4.134538, -7.1502, 0, -0.5, 0.5, 0.5,
-0.2932755, -4.134538, -7.1502, 1, -0.5, 0.5, 0.5,
-0.2932755, -4.134538, -7.1502, 1, 1.5, 0.5, 0.5,
-0.2932755, -4.134538, -7.1502, 0, 1.5, 0.5, 0.5
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
-4.850488, 0.2276056, -7.1502, 0, -0.5, 0.5, 0.5,
-4.850488, 0.2276056, -7.1502, 1, -0.5, 0.5, 0.5,
-4.850488, 0.2276056, -7.1502, 1, 1.5, 0.5, 0.5,
-4.850488, 0.2276056, -7.1502, 0, 1.5, 0.5, 0.5
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
-4.850488, -4.134538, 0.1421959, 0, -0.5, 0.5, 0.5,
-4.850488, -4.134538, 0.1421959, 1, -0.5, 0.5, 0.5,
-4.850488, -4.134538, 0.1421959, 1, 1.5, 0.5, 0.5,
-4.850488, -4.134538, 0.1421959, 0, 1.5, 0.5, 0.5
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
-3, -3.127889, -5.46734,
3, -3.127889, -5.46734,
-3, -3.127889, -5.46734,
-3, -3.295664, -5.747817,
-2, -3.127889, -5.46734,
-2, -3.295664, -5.747817,
-1, -3.127889, -5.46734,
-1, -3.295664, -5.747817,
0, -3.127889, -5.46734,
0, -3.295664, -5.747817,
1, -3.127889, -5.46734,
1, -3.295664, -5.747817,
2, -3.127889, -5.46734,
2, -3.295664, -5.747817,
3, -3.127889, -5.46734,
3, -3.295664, -5.747817
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
-3, -3.631214, -6.30877, 0, -0.5, 0.5, 0.5,
-3, -3.631214, -6.30877, 1, -0.5, 0.5, 0.5,
-3, -3.631214, -6.30877, 1, 1.5, 0.5, 0.5,
-3, -3.631214, -6.30877, 0, 1.5, 0.5, 0.5,
-2, -3.631214, -6.30877, 0, -0.5, 0.5, 0.5,
-2, -3.631214, -6.30877, 1, -0.5, 0.5, 0.5,
-2, -3.631214, -6.30877, 1, 1.5, 0.5, 0.5,
-2, -3.631214, -6.30877, 0, 1.5, 0.5, 0.5,
-1, -3.631214, -6.30877, 0, -0.5, 0.5, 0.5,
-1, -3.631214, -6.30877, 1, -0.5, 0.5, 0.5,
-1, -3.631214, -6.30877, 1, 1.5, 0.5, 0.5,
-1, -3.631214, -6.30877, 0, 1.5, 0.5, 0.5,
0, -3.631214, -6.30877, 0, -0.5, 0.5, 0.5,
0, -3.631214, -6.30877, 1, -0.5, 0.5, 0.5,
0, -3.631214, -6.30877, 1, 1.5, 0.5, 0.5,
0, -3.631214, -6.30877, 0, 1.5, 0.5, 0.5,
1, -3.631214, -6.30877, 0, -0.5, 0.5, 0.5,
1, -3.631214, -6.30877, 1, -0.5, 0.5, 0.5,
1, -3.631214, -6.30877, 1, 1.5, 0.5, 0.5,
1, -3.631214, -6.30877, 0, 1.5, 0.5, 0.5,
2, -3.631214, -6.30877, 0, -0.5, 0.5, 0.5,
2, -3.631214, -6.30877, 1, -0.5, 0.5, 0.5,
2, -3.631214, -6.30877, 1, 1.5, 0.5, 0.5,
2, -3.631214, -6.30877, 0, 1.5, 0.5, 0.5,
3, -3.631214, -6.30877, 0, -0.5, 0.5, 0.5,
3, -3.631214, -6.30877, 1, -0.5, 0.5, 0.5,
3, -3.631214, -6.30877, 1, 1.5, 0.5, 0.5,
3, -3.631214, -6.30877, 0, 1.5, 0.5, 0.5
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
-3.798823, -3, -5.46734,
-3.798823, 3, -5.46734,
-3.798823, -3, -5.46734,
-3.974101, -3, -5.747817,
-3.798823, -2, -5.46734,
-3.974101, -2, -5.747817,
-3.798823, -1, -5.46734,
-3.974101, -1, -5.747817,
-3.798823, 0, -5.46734,
-3.974101, 0, -5.747817,
-3.798823, 1, -5.46734,
-3.974101, 1, -5.747817,
-3.798823, 2, -5.46734,
-3.974101, 2, -5.747817,
-3.798823, 3, -5.46734,
-3.974101, 3, -5.747817
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
-4.324656, -3, -6.30877, 0, -0.5, 0.5, 0.5,
-4.324656, -3, -6.30877, 1, -0.5, 0.5, 0.5,
-4.324656, -3, -6.30877, 1, 1.5, 0.5, 0.5,
-4.324656, -3, -6.30877, 0, 1.5, 0.5, 0.5,
-4.324656, -2, -6.30877, 0, -0.5, 0.5, 0.5,
-4.324656, -2, -6.30877, 1, -0.5, 0.5, 0.5,
-4.324656, -2, -6.30877, 1, 1.5, 0.5, 0.5,
-4.324656, -2, -6.30877, 0, 1.5, 0.5, 0.5,
-4.324656, -1, -6.30877, 0, -0.5, 0.5, 0.5,
-4.324656, -1, -6.30877, 1, -0.5, 0.5, 0.5,
-4.324656, -1, -6.30877, 1, 1.5, 0.5, 0.5,
-4.324656, -1, -6.30877, 0, 1.5, 0.5, 0.5,
-4.324656, 0, -6.30877, 0, -0.5, 0.5, 0.5,
-4.324656, 0, -6.30877, 1, -0.5, 0.5, 0.5,
-4.324656, 0, -6.30877, 1, 1.5, 0.5, 0.5,
-4.324656, 0, -6.30877, 0, 1.5, 0.5, 0.5,
-4.324656, 1, -6.30877, 0, -0.5, 0.5, 0.5,
-4.324656, 1, -6.30877, 1, -0.5, 0.5, 0.5,
-4.324656, 1, -6.30877, 1, 1.5, 0.5, 0.5,
-4.324656, 1, -6.30877, 0, 1.5, 0.5, 0.5,
-4.324656, 2, -6.30877, 0, -0.5, 0.5, 0.5,
-4.324656, 2, -6.30877, 1, -0.5, 0.5, 0.5,
-4.324656, 2, -6.30877, 1, 1.5, 0.5, 0.5,
-4.324656, 2, -6.30877, 0, 1.5, 0.5, 0.5,
-4.324656, 3, -6.30877, 0, -0.5, 0.5, 0.5,
-4.324656, 3, -6.30877, 1, -0.5, 0.5, 0.5,
-4.324656, 3, -6.30877, 1, 1.5, 0.5, 0.5,
-4.324656, 3, -6.30877, 0, 1.5, 0.5, 0.5
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
-3.798823, -3.127889, -4,
-3.798823, -3.127889, 4,
-3.798823, -3.127889, -4,
-3.974101, -3.295664, -4,
-3.798823, -3.127889, -2,
-3.974101, -3.295664, -2,
-3.798823, -3.127889, 0,
-3.974101, -3.295664, 0,
-3.798823, -3.127889, 2,
-3.974101, -3.295664, 2,
-3.798823, -3.127889, 4,
-3.974101, -3.295664, 4
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
-4.324656, -3.631214, -4, 0, -0.5, 0.5, 0.5,
-4.324656, -3.631214, -4, 1, -0.5, 0.5, 0.5,
-4.324656, -3.631214, -4, 1, 1.5, 0.5, 0.5,
-4.324656, -3.631214, -4, 0, 1.5, 0.5, 0.5,
-4.324656, -3.631214, -2, 0, -0.5, 0.5, 0.5,
-4.324656, -3.631214, -2, 1, -0.5, 0.5, 0.5,
-4.324656, -3.631214, -2, 1, 1.5, 0.5, 0.5,
-4.324656, -3.631214, -2, 0, 1.5, 0.5, 0.5,
-4.324656, -3.631214, 0, 0, -0.5, 0.5, 0.5,
-4.324656, -3.631214, 0, 1, -0.5, 0.5, 0.5,
-4.324656, -3.631214, 0, 1, 1.5, 0.5, 0.5,
-4.324656, -3.631214, 0, 0, 1.5, 0.5, 0.5,
-4.324656, -3.631214, 2, 0, -0.5, 0.5, 0.5,
-4.324656, -3.631214, 2, 1, -0.5, 0.5, 0.5,
-4.324656, -3.631214, 2, 1, 1.5, 0.5, 0.5,
-4.324656, -3.631214, 2, 0, 1.5, 0.5, 0.5,
-4.324656, -3.631214, 4, 0, -0.5, 0.5, 0.5,
-4.324656, -3.631214, 4, 1, -0.5, 0.5, 0.5,
-4.324656, -3.631214, 4, 1, 1.5, 0.5, 0.5,
-4.324656, -3.631214, 4, 0, 1.5, 0.5, 0.5
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
-3.798823, -3.127889, -5.46734,
-3.798823, 3.583101, -5.46734,
-3.798823, -3.127889, 5.751731,
-3.798823, 3.583101, 5.751731,
-3.798823, -3.127889, -5.46734,
-3.798823, -3.127889, 5.751731,
-3.798823, 3.583101, -5.46734,
-3.798823, 3.583101, 5.751731,
-3.798823, -3.127889, -5.46734,
3.212272, -3.127889, -5.46734,
-3.798823, -3.127889, 5.751731,
3.212272, -3.127889, 5.751731,
-3.798823, 3.583101, -5.46734,
3.212272, 3.583101, -5.46734,
-3.798823, 3.583101, 5.751731,
3.212272, 3.583101, 5.751731,
3.212272, -3.127889, -5.46734,
3.212272, 3.583101, -5.46734,
3.212272, -3.127889, 5.751731,
3.212272, 3.583101, 5.751731,
3.212272, -3.127889, -5.46734,
3.212272, -3.127889, 5.751731,
3.212272, 3.583101, -5.46734,
3.212272, 3.583101, 5.751731
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
var radius = 7.921299;
var distance = 35.24276;
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
mvMatrix.translate( 0.2932755, -0.2276056, -0.1421959 );
mvMatrix.scale( 1.221587, 1.276215, 0.7634022 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.24276);
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
Tartar_emetic<-read.table("Tartar_emetic.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Tartar_emetic$V2
```

```
## Error in eval(expr, envir, enclos): object 'Tartar_emetic' not found
```

```r
y<-Tartar_emetic$V3
```

```
## Error in eval(expr, envir, enclos): object 'Tartar_emetic' not found
```

```r
z<-Tartar_emetic$V4
```

```
## Error in eval(expr, envir, enclos): object 'Tartar_emetic' not found
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
-3.69672, -0.1212339, -1.670962, 0, 0, 1, 1, 1,
-3.099534, -0.01595469, -1.641478, 1, 0, 0, 1, 1,
-2.952059, 0.5170346, -4.431856, 1, 0, 0, 1, 1,
-2.931493, 0.4874617, -2.185624, 1, 0, 0, 1, 1,
-2.911543, -0.6063946, -3.346333, 1, 0, 0, 1, 1,
-2.883471, -0.7494693, -0.5809069, 1, 0, 0, 1, 1,
-2.715179, -0.363943, -1.256531, 0, 0, 0, 1, 1,
-2.709953, 0.5872891, -1.505146, 0, 0, 0, 1, 1,
-2.534184, 0.1177928, -0.4335813, 0, 0, 0, 1, 1,
-2.529166, -0.919533, -0.8415178, 0, 0, 0, 1, 1,
-2.485638, -1.144103, 0.1634631, 0, 0, 0, 1, 1,
-2.443392, -0.6344035, -1.928598, 0, 0, 0, 1, 1,
-2.342433, 2.213868, -0.992177, 0, 0, 0, 1, 1,
-2.309998, -0.9695884, -2.243539, 1, 1, 1, 1, 1,
-2.302742, -0.108592, -3.337688, 1, 1, 1, 1, 1,
-2.277264, 2.405307, -0.4642376, 1, 1, 1, 1, 1,
-2.241397, 0.06577172, -0.4240169, 1, 1, 1, 1, 1,
-2.176663, -0.7623787, -1.340285, 1, 1, 1, 1, 1,
-2.124189, 1.621474, 0.1726233, 1, 1, 1, 1, 1,
-2.123804, 1.035832, -0.8142751, 1, 1, 1, 1, 1,
-2.09588, -0.9348043, -1.927354, 1, 1, 1, 1, 1,
-2.088892, 1.39057, -3.548375, 1, 1, 1, 1, 1,
-2.067358, -0.3405004, -0.7812952, 1, 1, 1, 1, 1,
-2.036456, 1.266011, -1.286147, 1, 1, 1, 1, 1,
-2.017026, 0.3133752, -0.5222879, 1, 1, 1, 1, 1,
-2.008046, -0.3689519, -1.625359, 1, 1, 1, 1, 1,
-1.981844, 0.3758321, -1.902064, 1, 1, 1, 1, 1,
-1.980007, -0.3842514, -0.473401, 1, 1, 1, 1, 1,
-1.976865, -1.391422, -0.3796659, 0, 0, 1, 1, 1,
-1.958248, -0.9829791, -1.723129, 1, 0, 0, 1, 1,
-1.951493, -0.9381535, -1.440947, 1, 0, 0, 1, 1,
-1.923341, 0.2331799, -0.4338323, 1, 0, 0, 1, 1,
-1.921514, -0.7714247, -1.983829, 1, 0, 0, 1, 1,
-1.898658, -0.9388298, -2.488895, 1, 0, 0, 1, 1,
-1.89693, 1.647658, -3.641167, 0, 0, 0, 1, 1,
-1.866013, 0.2512289, -0.7522018, 0, 0, 0, 1, 1,
-1.864233, 1.02572, -2.673862, 0, 0, 0, 1, 1,
-1.852072, 0.1167487, -2.942253, 0, 0, 0, 1, 1,
-1.84824, 2.132667, 0.9266753, 0, 0, 0, 1, 1,
-1.846233, 1.36065, 0.1284477, 0, 0, 0, 1, 1,
-1.84169, -0.8810345, -0.6068394, 0, 0, 0, 1, 1,
-1.817887, -0.6959822, -0.1196298, 1, 1, 1, 1, 1,
-1.81077, 0.6183415, -1.970688, 1, 1, 1, 1, 1,
-1.802059, 1.352477, -0.8952917, 1, 1, 1, 1, 1,
-1.788557, 1.069719, -0.195642, 1, 1, 1, 1, 1,
-1.783821, 0.3248129, -1.749455, 1, 1, 1, 1, 1,
-1.758564, 0.06696147, -2.502954, 1, 1, 1, 1, 1,
-1.754474, 0.8072438, -1.235163, 1, 1, 1, 1, 1,
-1.735103, -1.251045, -3.550199, 1, 1, 1, 1, 1,
-1.730121, -1.938462, -1.627452, 1, 1, 1, 1, 1,
-1.723156, -1.263723, -3.129514, 1, 1, 1, 1, 1,
-1.719238, -0.1058158, -0.5960014, 1, 1, 1, 1, 1,
-1.718742, 0.2581138, -2.053761, 1, 1, 1, 1, 1,
-1.710937, -0.2398902, -2.396387, 1, 1, 1, 1, 1,
-1.67434, -0.7911171, -1.88664, 1, 1, 1, 1, 1,
-1.670435, -0.05562345, -1.776252, 1, 1, 1, 1, 1,
-1.667982, -0.6523575, -0.9662316, 0, 0, 1, 1, 1,
-1.654135, -1.21623, -3.462785, 1, 0, 0, 1, 1,
-1.650163, -0.001117501, -2.039623, 1, 0, 0, 1, 1,
-1.622113, 0.562748, -0.3016911, 1, 0, 0, 1, 1,
-1.619392, 1.931221, 0.2074504, 1, 0, 0, 1, 1,
-1.61735, -1.058864, -0.9451636, 1, 0, 0, 1, 1,
-1.61528, 0.006978497, -0.687995, 0, 0, 0, 1, 1,
-1.610623, -0.05762339, -0.8638108, 0, 0, 0, 1, 1,
-1.608861, -0.9172727, -1.418945, 0, 0, 0, 1, 1,
-1.606586, -1.02831, -2.520301, 0, 0, 0, 1, 1,
-1.594038, 0.4008361, -2.980188, 0, 0, 0, 1, 1,
-1.577978, -0.7509252, -1.049084, 0, 0, 0, 1, 1,
-1.568109, 0.5971203, -1.105066, 0, 0, 0, 1, 1,
-1.565184, 0.1544564, -0.4063559, 1, 1, 1, 1, 1,
-1.564072, 1.162325, -0.7381186, 1, 1, 1, 1, 1,
-1.558901, 1.861129, -1.994689, 1, 1, 1, 1, 1,
-1.554086, 0.6863019, -1.152075, 1, 1, 1, 1, 1,
-1.546675, -0.7831739, -1.859057, 1, 1, 1, 1, 1,
-1.537339, 0.5944337, -1.473781, 1, 1, 1, 1, 1,
-1.53002, 1.324023, -0.9826267, 1, 1, 1, 1, 1,
-1.527772, -0.6913689, -1.003229, 1, 1, 1, 1, 1,
-1.516252, 1.443182, 0.1096751, 1, 1, 1, 1, 1,
-1.509396, -0.2098317, -0.8443596, 1, 1, 1, 1, 1,
-1.496863, -0.8809389, -1.107199, 1, 1, 1, 1, 1,
-1.494599, 1.104623, -2.975514, 1, 1, 1, 1, 1,
-1.461545, 2.050419, -1.49833, 1, 1, 1, 1, 1,
-1.457739, -2.402167, -2.87783, 1, 1, 1, 1, 1,
-1.443936, 1.272766, -2.064611, 1, 1, 1, 1, 1,
-1.430989, 0.7443733, -0.008324222, 0, 0, 1, 1, 1,
-1.429217, 0.0194013, -1.851739, 1, 0, 0, 1, 1,
-1.426948, -1.001471, -1.259226, 1, 0, 0, 1, 1,
-1.423227, -0.08541258, -1.511849, 1, 0, 0, 1, 1,
-1.422253, -2.82466, -0.8577073, 1, 0, 0, 1, 1,
-1.420602, -0.2883795, -0.4375668, 1, 0, 0, 1, 1,
-1.41704, -1.491095, -3.05487, 0, 0, 0, 1, 1,
-1.413607, -0.0664021, -3.632159, 0, 0, 0, 1, 1,
-1.404421, 0.1238029, -2.809457, 0, 0, 0, 1, 1,
-1.39248, 0.9569398, -2.007537, 0, 0, 0, 1, 1,
-1.384727, -1.254974, -2.767125, 0, 0, 0, 1, 1,
-1.378279, 0.2985353, -1.880281, 0, 0, 0, 1, 1,
-1.377227, 0.4197973, -1.063723, 0, 0, 0, 1, 1,
-1.371817, -1.067654, -3.505562, 1, 1, 1, 1, 1,
-1.371234, 0.9411462, -1.822419, 1, 1, 1, 1, 1,
-1.343973, -0.9799728, -2.034691, 1, 1, 1, 1, 1,
-1.338634, 0.5536534, -0.6064479, 1, 1, 1, 1, 1,
-1.321596, 0.9626814, -2.272388, 1, 1, 1, 1, 1,
-1.311366, -0.8224031, -0.7874211, 1, 1, 1, 1, 1,
-1.310161, -0.910199, -2.45654, 1, 1, 1, 1, 1,
-1.300453, 1.032415, -1.400828, 1, 1, 1, 1, 1,
-1.295323, -0.5532569, -2.447672, 1, 1, 1, 1, 1,
-1.294448, -0.7430483, -5.043316, 1, 1, 1, 1, 1,
-1.276682, 0.6169361, -1.20313, 1, 1, 1, 1, 1,
-1.275329, -0.4321445, -1.550743, 1, 1, 1, 1, 1,
-1.272347, 1.239119, -0.7065178, 1, 1, 1, 1, 1,
-1.26958, 1.39323, 0.9158232, 1, 1, 1, 1, 1,
-1.268542, 0.7382181, -3.528903, 1, 1, 1, 1, 1,
-1.266574, 2.350643, -1.056196, 0, 0, 1, 1, 1,
-1.247864, -0.2372037, -2.010612, 1, 0, 0, 1, 1,
-1.243093, 0.1696228, -1.926013, 1, 0, 0, 1, 1,
-1.239732, 0.06019652, -2.071563, 1, 0, 0, 1, 1,
-1.216497, 0.9697671, -2.598381, 1, 0, 0, 1, 1,
-1.216027, 0.6928395, -2.157962, 1, 0, 0, 1, 1,
-1.212637, -0.4430463, -4.277389, 0, 0, 0, 1, 1,
-1.211721, -0.9193367, -1.173324, 0, 0, 0, 1, 1,
-1.196079, 0.6441643, 0.04971334, 0, 0, 0, 1, 1,
-1.183426, -1.566817, -2.841258, 0, 0, 0, 1, 1,
-1.181626, -1.764809, -3.001028, 0, 0, 0, 1, 1,
-1.178572, -0.3839106, -0.939687, 0, 0, 0, 1, 1,
-1.177681, -0.4810592, -1.479236, 0, 0, 0, 1, 1,
-1.17456, -0.4919245, -2.499841, 1, 1, 1, 1, 1,
-1.171469, 1.843827, 0.1381982, 1, 1, 1, 1, 1,
-1.170314, -1.364113, -3.941254, 1, 1, 1, 1, 1,
-1.168468, 0.5537394, -0.6417254, 1, 1, 1, 1, 1,
-1.159355, -0.621838, -2.564488, 1, 1, 1, 1, 1,
-1.146812, 0.1829719, -0.4431844, 1, 1, 1, 1, 1,
-1.14022, 0.3266334, -1.661723, 1, 1, 1, 1, 1,
-1.131924, 0.0863165, -1.545975, 1, 1, 1, 1, 1,
-1.127546, 1.677198, -0.7430229, 1, 1, 1, 1, 1,
-1.123698, 0.827421, -0.7810084, 1, 1, 1, 1, 1,
-1.114767, 0.8025376, -2.043787, 1, 1, 1, 1, 1,
-1.113761, 1.043401, -0.1818227, 1, 1, 1, 1, 1,
-1.107759, 0.5937381, -0.8522794, 1, 1, 1, 1, 1,
-1.099221, -0.7206811, -1.198509, 1, 1, 1, 1, 1,
-1.097836, -0.524013, -2.461857, 1, 1, 1, 1, 1,
-1.097508, -0.2248224, -2.257193, 0, 0, 1, 1, 1,
-1.090795, -2.936528, -4.654826, 1, 0, 0, 1, 1,
-1.089328, -0.2983981, -0.9714271, 1, 0, 0, 1, 1,
-1.080508, 0.3889637, -1.302034, 1, 0, 0, 1, 1,
-1.07688, 0.7059016, -1.42774, 1, 0, 0, 1, 1,
-1.06673, 0.7036245, -1.270507, 1, 0, 0, 1, 1,
-1.066417, -0.07742596, -0.4521836, 0, 0, 0, 1, 1,
-1.06582, 0.4173192, -1.067453, 0, 0, 0, 1, 1,
-1.057582, 0.09786385, -0.3714952, 0, 0, 0, 1, 1,
-1.053948, -1.815526, -1.910738, 0, 0, 0, 1, 1,
-1.049534, 2.384661, -1.182507, 0, 0, 0, 1, 1,
-1.037703, -1.831942, -3.319316, 0, 0, 0, 1, 1,
-1.036601, 0.1981774, -0.4987956, 0, 0, 0, 1, 1,
-1.035139, 1.545712, 0.9822899, 1, 1, 1, 1, 1,
-1.028783, 0.9186803, -0.3692378, 1, 1, 1, 1, 1,
-1.027516, 0.1856976, -1.188172, 1, 1, 1, 1, 1,
-1.025932, 0.3452804, -0.5772414, 1, 1, 1, 1, 1,
-1.024155, 0.9085522, 0.4024205, 1, 1, 1, 1, 1,
-1.016856, -0.7962973, -1.020838, 1, 1, 1, 1, 1,
-1.015402, 1.39792, -0.5361735, 1, 1, 1, 1, 1,
-1.0121, -0.519764, -1.50407, 1, 1, 1, 1, 1,
-0.9983569, 0.5223917, -1.612339, 1, 1, 1, 1, 1,
-0.9798926, 0.814178, -0.7131825, 1, 1, 1, 1, 1,
-0.9763067, 0.6783167, -2.174636, 1, 1, 1, 1, 1,
-0.9706718, -0.5641472, -2.259705, 1, 1, 1, 1, 1,
-0.9685404, -1.5397, -4.241583, 1, 1, 1, 1, 1,
-0.9680374, 0.04995685, 1.403054, 1, 1, 1, 1, 1,
-0.9677632, 0.7024158, -2.097145, 1, 1, 1, 1, 1,
-0.9658594, 0.1506746, 0.7499462, 0, 0, 1, 1, 1,
-0.9555852, -1.373876, -3.210307, 1, 0, 0, 1, 1,
-0.9458624, -0.6609935, -2.36499, 1, 0, 0, 1, 1,
-0.9312193, -0.1951906, -1.072113, 1, 0, 0, 1, 1,
-0.93083, 0.3353512, -1.582882, 1, 0, 0, 1, 1,
-0.9240075, -0.2257157, -2.322155, 1, 0, 0, 1, 1,
-0.9153734, 0.6951295, -1.128375, 0, 0, 0, 1, 1,
-0.9088883, 0.04140749, -1.082142, 0, 0, 0, 1, 1,
-0.9088693, 1.014043, -0.9042789, 0, 0, 0, 1, 1,
-0.9049605, -1.97335, -3.40831, 0, 0, 0, 1, 1,
-0.9027808, -0.3794634, -2.055882, 0, 0, 0, 1, 1,
-0.9001293, -0.7377097, -2.116996, 0, 0, 0, 1, 1,
-0.9000406, 0.5177677, -1.783027, 0, 0, 0, 1, 1,
-0.8906356, -0.4724764, 0.3325884, 1, 1, 1, 1, 1,
-0.8850172, 0.566003, 0.6065919, 1, 1, 1, 1, 1,
-0.8804624, 1.275948, -0.4250744, 1, 1, 1, 1, 1,
-0.8761157, 1.087826, -0.3984027, 1, 1, 1, 1, 1,
-0.8758217, -0.3972867, -2.342364, 1, 1, 1, 1, 1,
-0.870487, -1.221673, -3.245961, 1, 1, 1, 1, 1,
-0.8698142, -0.5765337, -1.720701, 1, 1, 1, 1, 1,
-0.8682348, 0.9008683, -1.154864, 1, 1, 1, 1, 1,
-0.8600635, -0.3246602, -1.667737, 1, 1, 1, 1, 1,
-0.8515868, -0.6020649, -1.092924, 1, 1, 1, 1, 1,
-0.8477437, 0.9813288, -1.886729, 1, 1, 1, 1, 1,
-0.8468106, -1.693042, -2.32318, 1, 1, 1, 1, 1,
-0.8466592, -1.522712, -2.430259, 1, 1, 1, 1, 1,
-0.8457809, -0.3035924, -2.732133, 1, 1, 1, 1, 1,
-0.8454519, -1.196068, -3.26374, 1, 1, 1, 1, 1,
-0.8446919, 0.08654921, -1.446157, 0, 0, 1, 1, 1,
-0.8437863, 0.3109282, -0.5612783, 1, 0, 0, 1, 1,
-0.8412035, -0.5322853, -2.998758, 1, 0, 0, 1, 1,
-0.8408958, -1.394618, -2.78394, 1, 0, 0, 1, 1,
-0.838559, 0.199109, 0.1676045, 1, 0, 0, 1, 1,
-0.8385357, -1.266905, -2.660175, 1, 0, 0, 1, 1,
-0.8366851, 0.1795714, 0.5531321, 0, 0, 0, 1, 1,
-0.834833, -0.1711478, -1.873725, 0, 0, 0, 1, 1,
-0.8346729, 0.4334055, -3.205677, 0, 0, 0, 1, 1,
-0.822436, -1.222519, -3.05276, 0, 0, 0, 1, 1,
-0.8159119, 0.8138314, -3.453438, 0, 0, 0, 1, 1,
-0.811929, 0.1103203, 0.3751687, 0, 0, 0, 1, 1,
-0.811034, -0.8877897, -1.863391, 0, 0, 0, 1, 1,
-0.8094051, 0.6501897, -0.2721511, 1, 1, 1, 1, 1,
-0.8058107, 0.9761403, -1.024748, 1, 1, 1, 1, 1,
-0.8041199, 0.476176, -1.709975, 1, 1, 1, 1, 1,
-0.8009267, 0.9670121, -0.7321763, 1, 1, 1, 1, 1,
-0.8000072, -0.1566779, -1.413885, 1, 1, 1, 1, 1,
-0.7996082, 0.07465955, -1.354418, 1, 1, 1, 1, 1,
-0.7979069, -0.6010627, -2.565632, 1, 1, 1, 1, 1,
-0.797484, -0.1402332, -1.187817, 1, 1, 1, 1, 1,
-0.7932338, 0.1042987, -1.004257, 1, 1, 1, 1, 1,
-0.7836828, 0.572761, -1.369824, 1, 1, 1, 1, 1,
-0.782143, -0.8774936, -1.524137, 1, 1, 1, 1, 1,
-0.7817724, -1.753405, -2.28396, 1, 1, 1, 1, 1,
-0.7809343, -0.5279012, -1.99503, 1, 1, 1, 1, 1,
-0.7787738, 2.158095, -1.481915, 1, 1, 1, 1, 1,
-0.7708231, 0.1887317, -1.416177, 1, 1, 1, 1, 1,
-0.7687503, 0.6307027, -0.4013408, 0, 0, 1, 1, 1,
-0.7595298, -0.8904593, -3.378902, 1, 0, 0, 1, 1,
-0.7582823, 0.2603756, -0.4903722, 1, 0, 0, 1, 1,
-0.756631, 0.3028483, 0.4005151, 1, 0, 0, 1, 1,
-0.7549442, -0.7225823, -1.503003, 1, 0, 0, 1, 1,
-0.7509015, 0.7060056, -1.211919, 1, 0, 0, 1, 1,
-0.750626, -0.007028667, -1.81713, 0, 0, 0, 1, 1,
-0.7399778, 0.2123595, -0.1504227, 0, 0, 0, 1, 1,
-0.7399281, -0.6242671, -0.193471, 0, 0, 0, 1, 1,
-0.738911, -0.7702401, -2.16388, 0, 0, 0, 1, 1,
-0.7358001, 0.05173125, -0.417885, 0, 0, 0, 1, 1,
-0.7302244, 0.02709156, 0.1962442, 0, 0, 0, 1, 1,
-0.7279162, 1.121852, 0.5231225, 0, 0, 0, 1, 1,
-0.7237372, 0.7329657, -0.3552671, 1, 1, 1, 1, 1,
-0.7179711, -1.370995, -1.726521, 1, 1, 1, 1, 1,
-0.7176871, 1.700148, 0.4791552, 1, 1, 1, 1, 1,
-0.7150689, -0.9116488, -4.73586, 1, 1, 1, 1, 1,
-0.7126474, -0.3974559, -2.194196, 1, 1, 1, 1, 1,
-0.7098606, -1.996783, -2.865442, 1, 1, 1, 1, 1,
-0.7089435, 1.288455, -0.5381457, 1, 1, 1, 1, 1,
-0.7060259, -0.04700544, -2.715321, 1, 1, 1, 1, 1,
-0.7028503, -0.3644018, -2.831584, 1, 1, 1, 1, 1,
-0.6948115, -1.734746, -3.85037, 1, 1, 1, 1, 1,
-0.6946363, 1.664406, -1.149905, 1, 1, 1, 1, 1,
-0.6923231, -0.0963297, -1.776241, 1, 1, 1, 1, 1,
-0.6896158, -1.741364, -1.571007, 1, 1, 1, 1, 1,
-0.6870796, 0.9517988, -2.238952, 1, 1, 1, 1, 1,
-0.6836441, 1.688738, 1.666539, 1, 1, 1, 1, 1,
-0.6807676, -0.3720712, -1.016775, 0, 0, 1, 1, 1,
-0.6715791, -1.563548, -3.385123, 1, 0, 0, 1, 1,
-0.6711248, -0.2398315, -3.635859, 1, 0, 0, 1, 1,
-0.664458, -0.8660423, -2.381983, 1, 0, 0, 1, 1,
-0.6638184, -0.03756049, -1.733692, 1, 0, 0, 1, 1,
-0.6627195, 0.7901538, -0.6975743, 1, 0, 0, 1, 1,
-0.659163, -0.9399653, -1.465454, 0, 0, 0, 1, 1,
-0.651931, -0.1461337, -1.142096, 0, 0, 0, 1, 1,
-0.6471936, 0.3609113, 0.04629786, 0, 0, 0, 1, 1,
-0.6466812, 0.2133538, -0.3640867, 0, 0, 0, 1, 1,
-0.6438696, -0.6380556, 0.03270605, 0, 0, 0, 1, 1,
-0.6416235, -1.582317, -2.436869, 0, 0, 0, 1, 1,
-0.6373738, 0.9397091, -1.081626, 0, 0, 0, 1, 1,
-0.6334195, -0.4091332, -2.062574, 1, 1, 1, 1, 1,
-0.6283387, 0.9472003, -0.5615427, 1, 1, 1, 1, 1,
-0.625975, -0.2984752, -2.561742, 1, 1, 1, 1, 1,
-0.6253212, 0.9566578, -0.5826185, 1, 1, 1, 1, 1,
-0.618611, -0.1578691, -1.649408, 1, 1, 1, 1, 1,
-0.6130458, 0.8190024, -0.8769692, 1, 1, 1, 1, 1,
-0.608906, -0.3258611, -2.478198, 1, 1, 1, 1, 1,
-0.6043826, 0.1127216, -1.568197, 1, 1, 1, 1, 1,
-0.5952696, -0.4192735, 0.4793467, 1, 1, 1, 1, 1,
-0.5948223, 1.388923, 0.436774, 1, 1, 1, 1, 1,
-0.5945498, 0.2806641, -1.78767, 1, 1, 1, 1, 1,
-0.5903065, -0.8250431, -0.1816122, 1, 1, 1, 1, 1,
-0.5880356, -0.9536834, -1.940793, 1, 1, 1, 1, 1,
-0.5804923, 1.846853, -1.77609, 1, 1, 1, 1, 1,
-0.5800822, 1.68708, 0.5245219, 1, 1, 1, 1, 1,
-0.5752962, 0.01221874, -1.743005, 0, 0, 1, 1, 1,
-0.5709251, 1.121324, 0.6549726, 1, 0, 0, 1, 1,
-0.5672844, -0.8589179, -2.845685, 1, 0, 0, 1, 1,
-0.5643184, -1.609775, -2.7265, 1, 0, 0, 1, 1,
-0.564207, 1.717304, 0.7345597, 1, 0, 0, 1, 1,
-0.5612572, 1.261441, 0.4174866, 1, 0, 0, 1, 1,
-0.5515044, -0.362013, -2.616578, 0, 0, 0, 1, 1,
-0.5493551, 0.1028835, -1.085479, 0, 0, 0, 1, 1,
-0.5475956, 0.7861323, -1.624275, 0, 0, 0, 1, 1,
-0.5459184, -0.1079751, -3.180635, 0, 0, 0, 1, 1,
-0.5457908, -0.9306468, -3.362011, 0, 0, 0, 1, 1,
-0.5397729, 0.004732012, -0.8405795, 0, 0, 0, 1, 1,
-0.5329664, 0.2671035, -1.918283, 0, 0, 0, 1, 1,
-0.5318091, 0.08122655, -1.539857, 1, 1, 1, 1, 1,
-0.5317228, 2.165774, 0.1038254, 1, 1, 1, 1, 1,
-0.5293902, 0.522688, -1.714276, 1, 1, 1, 1, 1,
-0.5280038, -0.5382177, -3.842535, 1, 1, 1, 1, 1,
-0.5243531, -0.8712736, -2.945091, 1, 1, 1, 1, 1,
-0.5202201, -0.7029085, -2.282472, 1, 1, 1, 1, 1,
-0.5193778, -2.21609, -2.5913, 1, 1, 1, 1, 1,
-0.5141945, 0.5954161, -2.206757, 1, 1, 1, 1, 1,
-0.5135448, -0.8809038, -3.208061, 1, 1, 1, 1, 1,
-0.5127162, -1.012277, -2.46138, 1, 1, 1, 1, 1,
-0.5018054, 0.8607507, -1.035276, 1, 1, 1, 1, 1,
-0.5004585, 0.9235731, -0.1063099, 1, 1, 1, 1, 1,
-0.4981307, 1.599005, 1.401146, 1, 1, 1, 1, 1,
-0.4973718, -3.030157, -3.017127, 1, 1, 1, 1, 1,
-0.4968414, 0.4358363, -1.650029, 1, 1, 1, 1, 1,
-0.4925793, -0.7555398, -3.662151, 0, 0, 1, 1, 1,
-0.4851899, -0.613587, -0.7523412, 1, 0, 0, 1, 1,
-0.4817505, -0.04073244, -2.041122, 1, 0, 0, 1, 1,
-0.48127, 0.1889408, -2.275344, 1, 0, 0, 1, 1,
-0.4783824, 0.3017708, -1.584955, 1, 0, 0, 1, 1,
-0.4771716, -1.114992, -1.502477, 1, 0, 0, 1, 1,
-0.4746035, -1.062174, -2.661598, 0, 0, 0, 1, 1,
-0.4670798, 1.248887, 0.4881158, 0, 0, 0, 1, 1,
-0.4661261, 0.05163205, -1.081586, 0, 0, 0, 1, 1,
-0.4658672, 0.1437254, -1.873395, 0, 0, 0, 1, 1,
-0.4656905, 0.02727449, -0.08230193, 0, 0, 0, 1, 1,
-0.4653431, -0.6509041, -2.71677, 0, 0, 0, 1, 1,
-0.4648172, 0.8147638, 0.3857902, 0, 0, 0, 1, 1,
-0.4644922, -1.669289, -2.749538, 1, 1, 1, 1, 1,
-0.4601786, 0.06287849, -0.9174044, 1, 1, 1, 1, 1,
-0.459549, 1.297804, -2.32602, 1, 1, 1, 1, 1,
-0.4589498, 1.319902, -0.8599469, 1, 1, 1, 1, 1,
-0.4587088, 0.7038174, 0.8905503, 1, 1, 1, 1, 1,
-0.4450716, 0.7358207, -0.5514261, 1, 1, 1, 1, 1,
-0.4439205, -0.2219209, -2.578857, 1, 1, 1, 1, 1,
-0.438809, 0.5067105, -1.15192, 1, 1, 1, 1, 1,
-0.4371209, -2.45456, -3.111727, 1, 1, 1, 1, 1,
-0.4350841, -0.4105103, -3.232599, 1, 1, 1, 1, 1,
-0.4313616, 1.338587, -0.4207408, 1, 1, 1, 1, 1,
-0.4298989, -1.254622, -1.013369, 1, 1, 1, 1, 1,
-0.4295143, -0.2580884, -2.443141, 1, 1, 1, 1, 1,
-0.4248508, -1.425304, -2.440666, 1, 1, 1, 1, 1,
-0.4242747, -1.533235, -3.92126, 1, 1, 1, 1, 1,
-0.4238241, 0.6364478, -1.872423, 0, 0, 1, 1, 1,
-0.4237286, 0.4035638, -1.084608, 1, 0, 0, 1, 1,
-0.4221237, -0.07711509, -2.924875, 1, 0, 0, 1, 1,
-0.4214795, -0.6011303, -2.098885, 1, 0, 0, 1, 1,
-0.417147, -2.177529, -1.12083, 1, 0, 0, 1, 1,
-0.410223, -0.8684101, -2.572922, 1, 0, 0, 1, 1,
-0.4013103, 1.118416, -1.103292, 0, 0, 0, 1, 1,
-0.4002501, 0.3298716, -1.311305, 0, 0, 0, 1, 1,
-0.397477, -1.383049, -3.282989, 0, 0, 0, 1, 1,
-0.397009, 0.4107205, -0.2377935, 0, 0, 0, 1, 1,
-0.3939821, -0.7835718, -1.449529, 0, 0, 0, 1, 1,
-0.3876706, 1.541952, 1.768803, 0, 0, 0, 1, 1,
-0.3825129, -1.567716, -2.280397, 0, 0, 0, 1, 1,
-0.3797823, 0.8849591, -1.437164, 1, 1, 1, 1, 1,
-0.3791423, 0.2770219, -0.1496982, 1, 1, 1, 1, 1,
-0.3752339, -0.5663927, -1.475125, 1, 1, 1, 1, 1,
-0.3751393, -0.3247165, -2.833639, 1, 1, 1, 1, 1,
-0.3724479, -0.4470215, -2.625119, 1, 1, 1, 1, 1,
-0.3687925, -0.7621183, -3.494076, 1, 1, 1, 1, 1,
-0.3579081, 1.63517, 0.9988362, 1, 1, 1, 1, 1,
-0.3532301, -0.9174412, -4.470672, 1, 1, 1, 1, 1,
-0.3506982, -1.093966, -1.522537, 1, 1, 1, 1, 1,
-0.3499266, 0.2791552, -0.9688463, 1, 1, 1, 1, 1,
-0.3455108, 0.378701, 0.7644015, 1, 1, 1, 1, 1,
-0.342582, -1.430393, -4.291007, 1, 1, 1, 1, 1,
-0.34064, 0.8256125, -0.2479094, 1, 1, 1, 1, 1,
-0.3403257, -0.5615367, -2.267435, 1, 1, 1, 1, 1,
-0.3402746, -0.2399939, -0.9940668, 1, 1, 1, 1, 1,
-0.3300132, 0.3532849, -2.237281, 0, 0, 1, 1, 1,
-0.3297118, -0.1043589, -2.161064, 1, 0, 0, 1, 1,
-0.3284171, 1.784863, -0.953564, 1, 0, 0, 1, 1,
-0.3249013, 1.255145, -0.06869031, 1, 0, 0, 1, 1,
-0.3220748, 1.132401, -2.466129, 1, 0, 0, 1, 1,
-0.3185263, -0.5656059, -1.917108, 1, 0, 0, 1, 1,
-0.3181656, -1.313911, -1.923227, 0, 0, 0, 1, 1,
-0.3125153, 0.8876761, -0.4422353, 0, 0, 0, 1, 1,
-0.3091491, 0.1078989, -1.152941, 0, 0, 0, 1, 1,
-0.3060097, 1.627993, 0.1830636, 0, 0, 0, 1, 1,
-0.305883, 0.8047084, 0.2538774, 0, 0, 0, 1, 1,
-0.3057256, 0.01967743, -2.630967, 0, 0, 0, 1, 1,
-0.3022771, -0.03437009, -3.139413, 0, 0, 0, 1, 1,
-0.2969833, -1.198818, -3.487043, 1, 1, 1, 1, 1,
-0.2941645, 0.3723516, -0.8201391, 1, 1, 1, 1, 1,
-0.2926811, 0.1957355, -0.9300516, 1, 1, 1, 1, 1,
-0.2872773, 0.784795, -1.752152, 1, 1, 1, 1, 1,
-0.2803585, -1.423443, -1.512839, 1, 1, 1, 1, 1,
-0.2736134, -0.4405631, -3.039247, 1, 1, 1, 1, 1,
-0.2704493, -0.310381, 0.3708352, 1, 1, 1, 1, 1,
-0.2629434, 0.501834, -2.855136, 1, 1, 1, 1, 1,
-0.2561822, 1.820557, 0.2508703, 1, 1, 1, 1, 1,
-0.253206, -1.101542, -1.829968, 1, 1, 1, 1, 1,
-0.2404123, -1.319064, -2.835669, 1, 1, 1, 1, 1,
-0.2379282, 0.08273661, -1.516267, 1, 1, 1, 1, 1,
-0.2367386, -0.2404704, -2.043726, 1, 1, 1, 1, 1,
-0.2365346, -0.02903709, -1.990166, 1, 1, 1, 1, 1,
-0.2362051, 0.4683667, -2.543214, 1, 1, 1, 1, 1,
-0.2360098, 0.15877, -0.4616333, 0, 0, 1, 1, 1,
-0.2310572, 0.09111728, -1.636082, 1, 0, 0, 1, 1,
-0.2304703, -0.5392618, -0.9147825, 1, 0, 0, 1, 1,
-0.2209815, -0.6456349, -2.934241, 1, 0, 0, 1, 1,
-0.2180599, -0.1697609, -1.949275, 1, 0, 0, 1, 1,
-0.2175485, 1.621431, 1.101377, 1, 0, 0, 1, 1,
-0.213893, -0.7459776, -5.303955, 0, 0, 0, 1, 1,
-0.2123166, 0.3765384, -0.01373984, 0, 0, 0, 1, 1,
-0.2064026, -0.6354268, -1.074003, 0, 0, 0, 1, 1,
-0.201942, -0.6791576, -4.862759, 0, 0, 0, 1, 1,
-0.201204, 0.5181146, -0.6194207, 0, 0, 0, 1, 1,
-0.1999719, -1.285942, -4.15476, 0, 0, 0, 1, 1,
-0.1889026, -1.496776, -4.405109, 0, 0, 0, 1, 1,
-0.1883913, 1.280959, 2.550335, 1, 1, 1, 1, 1,
-0.1870732, -0.2408419, -2.710406, 1, 1, 1, 1, 1,
-0.1794048, 0.09509259, -1.04446, 1, 1, 1, 1, 1,
-0.1787915, -1.551609, -2.426865, 1, 1, 1, 1, 1,
-0.1780004, -1.940335, -3.122403, 1, 1, 1, 1, 1,
-0.1767871, 0.6998714, -1.096785, 1, 1, 1, 1, 1,
-0.1761937, 1.74457, 0.934179, 1, 1, 1, 1, 1,
-0.1634424, -0.823674, -3.378625, 1, 1, 1, 1, 1,
-0.1631946, 0.003692612, -0.717118, 1, 1, 1, 1, 1,
-0.1615712, 0.9263859, -0.2219678, 1, 1, 1, 1, 1,
-0.1606904, 0.003402726, -1.877065, 1, 1, 1, 1, 1,
-0.1603242, 0.3052188, 1.05761, 1, 1, 1, 1, 1,
-0.1592081, -1.497124, -3.739844, 1, 1, 1, 1, 1,
-0.1522835, 1.075986, -1.685937, 1, 1, 1, 1, 1,
-0.151801, 0.7816505, -2.351319, 1, 1, 1, 1, 1,
-0.1497732, -0.9568702, -4.311347, 0, 0, 1, 1, 1,
-0.1494785, -0.4777192, -1.098808, 1, 0, 0, 1, 1,
-0.1486644, -0.05535753, -1.627836, 1, 0, 0, 1, 1,
-0.148644, -0.7950543, -3.651921, 1, 0, 0, 1, 1,
-0.1456098, 0.2977171, 1.888153, 1, 0, 0, 1, 1,
-0.1439362, 0.9159282, -1.325372, 1, 0, 0, 1, 1,
-0.1423454, 0.328642, -1.192709, 0, 0, 0, 1, 1,
-0.1411056, 0.07663537, -0.9044793, 0, 0, 0, 1, 1,
-0.1389275, -0.337433, -2.193242, 0, 0, 0, 1, 1,
-0.1360882, -2.453562, -4.088139, 0, 0, 0, 1, 1,
-0.1344651, 0.7790747, -0.2986191, 0, 0, 0, 1, 1,
-0.1342728, 3.485368, 1.138047, 0, 0, 0, 1, 1,
-0.1289705, 0.8462902, -1.933215, 0, 0, 0, 1, 1,
-0.1278018, -0.1341086, -1.942035, 1, 1, 1, 1, 1,
-0.1270283, 0.1735924, 1.053989, 1, 1, 1, 1, 1,
-0.1252483, 1.08583, 1.033896, 1, 1, 1, 1, 1,
-0.1246554, -0.3147073, -2.090398, 1, 1, 1, 1, 1,
-0.1245894, -1.05389, -4.107841, 1, 1, 1, 1, 1,
-0.124336, -2.026013, -3.964132, 1, 1, 1, 1, 1,
-0.1199471, -0.2733451, -0.8808784, 1, 1, 1, 1, 1,
-0.1162455, 0.1779338, -2.720758, 1, 1, 1, 1, 1,
-0.1063948, -0.2966755, -1.72041, 1, 1, 1, 1, 1,
-0.105994, 1.703739, -0.03581109, 1, 1, 1, 1, 1,
-0.103661, -0.754741, -1.128048, 1, 1, 1, 1, 1,
-0.1022839, -1.164726, -2.096075, 1, 1, 1, 1, 1,
-0.1003733, -0.5725331, -3.137716, 1, 1, 1, 1, 1,
-0.09934149, -1.076375, -5.187692, 1, 1, 1, 1, 1,
-0.09222473, -0.9681737, -2.598724, 1, 1, 1, 1, 1,
-0.08988526, -0.6098158, -1.3703, 0, 0, 1, 1, 1,
-0.08886962, 0.2416134, 0.5927307, 1, 0, 0, 1, 1,
-0.08655903, 1.809849, 0.533374, 1, 0, 0, 1, 1,
-0.08467848, -0.1054189, -1.408477, 1, 0, 0, 1, 1,
-0.08103602, -1.988957, -4.346064, 1, 0, 0, 1, 1,
-0.07389101, 0.356437, -1.814268, 1, 0, 0, 1, 1,
-0.07358505, -0.3585891, -2.547348, 0, 0, 0, 1, 1,
-0.07163368, -0.3803371, -2.420971, 0, 0, 0, 1, 1,
-0.07044211, -0.6211722, -4.162775, 0, 0, 0, 1, 1,
-0.06827904, -0.9501517, -3.555215, 0, 0, 0, 1, 1,
-0.065667, -0.2769944, -2.554559, 0, 0, 0, 1, 1,
-0.06550912, -1.58252, -3.30918, 0, 0, 0, 1, 1,
-0.06320957, 1.142806, 0.6118677, 0, 0, 0, 1, 1,
-0.06153014, -0.7933387, -2.486858, 1, 1, 1, 1, 1,
-0.05663326, 0.1139067, -1.855317, 1, 1, 1, 1, 1,
-0.0565749, 0.6306587, 1.087871, 1, 1, 1, 1, 1,
-0.05366633, -0.07801735, -3.443806, 1, 1, 1, 1, 1,
-0.04902722, 1.012776, -1.157876, 1, 1, 1, 1, 1,
-0.04605327, 0.5333228, -0.1478634, 1, 1, 1, 1, 1,
-0.04277414, -0.4034482, -2.391909, 1, 1, 1, 1, 1,
-0.04035197, -0.7768462, -5.250413, 1, 1, 1, 1, 1,
-0.03983663, 0.9072545, 0.8131419, 1, 1, 1, 1, 1,
-0.03605124, -1.180981, -3.563343, 1, 1, 1, 1, 1,
-0.03267049, 0.4839608, 1.634854, 1, 1, 1, 1, 1,
-0.03002311, -1.021423, -1.918701, 1, 1, 1, 1, 1,
-0.02974763, -1.019082, -2.835371, 1, 1, 1, 1, 1,
-0.02819639, 0.9759449, -0.8460637, 1, 1, 1, 1, 1,
-0.02418742, -0.7478538, -3.966748, 1, 1, 1, 1, 1,
-0.01804577, 2.009346, 2.13033, 0, 0, 1, 1, 1,
-0.01729078, 1.045092, 0.5551066, 1, 0, 0, 1, 1,
-0.01172489, 0.7165076, 0.9162632, 1, 0, 0, 1, 1,
-0.009781216, 1.033659, 1.007666, 1, 0, 0, 1, 1,
-0.005641589, -0.8677182, -2.275623, 1, 0, 0, 1, 1,
-0.001556722, -0.0683054, -4.270504, 1, 0, 0, 1, 1,
-0.001322368, -0.07170738, -3.951337, 0, 0, 0, 1, 1,
0.003616614, 0.6543779, -1.024892, 0, 0, 0, 1, 1,
0.004678965, -0.1933977, 3.62819, 0, 0, 0, 1, 1,
0.006923643, 0.3511927, -0.6901146, 0, 0, 0, 1, 1,
0.01618434, 0.1438973, -1.023916, 0, 0, 0, 1, 1,
0.01763034, 1.275961, -0.579798, 0, 0, 0, 1, 1,
0.01857756, 0.3411998, 1.209636, 0, 0, 0, 1, 1,
0.01923272, -0.242872, 2.343069, 1, 1, 1, 1, 1,
0.02026381, -1.068211, 3.495917, 1, 1, 1, 1, 1,
0.02195658, -0.01948367, 1.857601, 1, 1, 1, 1, 1,
0.02205247, 0.6024564, -0.5649855, 1, 1, 1, 1, 1,
0.02382362, -1.812393, 2.440518, 1, 1, 1, 1, 1,
0.02814193, 2.92735, -1.828982, 1, 1, 1, 1, 1,
0.03189515, -0.3028658, 3.938204, 1, 1, 1, 1, 1,
0.03491878, 1.850346, 0.7083173, 1, 1, 1, 1, 1,
0.03580306, 1.229101, -0.2368067, 1, 1, 1, 1, 1,
0.03838028, 0.01592301, -0.5144421, 1, 1, 1, 1, 1,
0.04171321, 0.2045771, 1.630154, 1, 1, 1, 1, 1,
0.04247672, 0.3454016, 2.225653, 1, 1, 1, 1, 1,
0.04446108, 1.784031, 0.1441762, 1, 1, 1, 1, 1,
0.04514454, 0.08591401, 0.1604331, 1, 1, 1, 1, 1,
0.04568335, -0.0007381805, 1.777719, 1, 1, 1, 1, 1,
0.05017003, -0.2981386, 2.44104, 0, 0, 1, 1, 1,
0.0524423, 0.6639961, 0.6267276, 1, 0, 0, 1, 1,
0.05247159, -1.358341, 2.51421, 1, 0, 0, 1, 1,
0.05327838, -0.5873787, 2.543507, 1, 0, 0, 1, 1,
0.06174739, 0.01396185, 1.874394, 1, 0, 0, 1, 1,
0.061761, 0.4634169, -0.00491438, 1, 0, 0, 1, 1,
0.0680298, 0.02934224, 1.397754, 0, 0, 0, 1, 1,
0.06950376, -0.4520723, 5.010934, 0, 0, 0, 1, 1,
0.07640814, 1.573485, 0.4577051, 0, 0, 0, 1, 1,
0.07766542, 1.646502, -0.3857121, 0, 0, 0, 1, 1,
0.0806496, 0.3583166, 0.4236351, 0, 0, 0, 1, 1,
0.08516201, -1.157409, 2.398863, 0, 0, 0, 1, 1,
0.100422, -0.005498102, 0.8960218, 0, 0, 0, 1, 1,
0.1007926, 0.3704174, -1.121382, 1, 1, 1, 1, 1,
0.1023815, -0.9923458, 3.070984, 1, 1, 1, 1, 1,
0.1127829, 0.8356038, -0.4029424, 1, 1, 1, 1, 1,
0.1177987, 0.2541461, -1.191071, 1, 1, 1, 1, 1,
0.1223163, 0.006482325, 0.8612556, 1, 1, 1, 1, 1,
0.1303329, 1.101098, -0.7682641, 1, 1, 1, 1, 1,
0.1303537, 0.254778, 1.233564, 1, 1, 1, 1, 1,
0.13316, -1.395686, 3.621958, 1, 1, 1, 1, 1,
0.1339314, 1.938632, 1.410015, 1, 1, 1, 1, 1,
0.1421035, -0.3388528, 2.963021, 1, 1, 1, 1, 1,
0.1458115, 0.7830135, -0.7272177, 1, 1, 1, 1, 1,
0.1475783, -0.1373937, 2.453917, 1, 1, 1, 1, 1,
0.1517268, 0.1183425, 0.3657675, 1, 1, 1, 1, 1,
0.1524897, 0.4322883, -0.7715475, 1, 1, 1, 1, 1,
0.153263, -0.09550334, 1.187437, 1, 1, 1, 1, 1,
0.1540131, 0.8250405, 0.7454591, 0, 0, 1, 1, 1,
0.1542527, 1.164374, -0.748347, 1, 0, 0, 1, 1,
0.1546941, -1.051471, 2.239592, 1, 0, 0, 1, 1,
0.1564572, 0.3274611, 0.7563094, 1, 0, 0, 1, 1,
0.1583721, -0.5665423, 2.150558, 1, 0, 0, 1, 1,
0.1609721, 2.260292, -0.09948797, 1, 0, 0, 1, 1,
0.1661077, -0.6771472, 4.097383, 0, 0, 0, 1, 1,
0.1662101, -1.203643, 3.901684, 0, 0, 0, 1, 1,
0.1687612, -0.4456381, 3.772372, 0, 0, 0, 1, 1,
0.1695327, 0.1341707, 1.249962, 0, 0, 0, 1, 1,
0.1701858, -0.03182099, 1.820988, 0, 0, 0, 1, 1,
0.1728773, -0.6525314, 4.029202, 0, 0, 0, 1, 1,
0.1762395, -0.4031083, 2.880188, 0, 0, 0, 1, 1,
0.1825853, 2.109278, 0.2947469, 1, 1, 1, 1, 1,
0.1829082, -0.4560203, 2.133715, 1, 1, 1, 1, 1,
0.1891958, 0.4447916, 2.204053, 1, 1, 1, 1, 1,
0.1906305, -0.2009589, 2.954665, 1, 1, 1, 1, 1,
0.1931891, 2.043542, -2.626234, 1, 1, 1, 1, 1,
0.1952072, 0.9561538, 1.136058, 1, 1, 1, 1, 1,
0.1958582, -0.9681323, 4.094272, 1, 1, 1, 1, 1,
0.196234, 0.6600887, 0.8386795, 1, 1, 1, 1, 1,
0.1976928, 0.3565109, 0.7751866, 1, 1, 1, 1, 1,
0.1989312, -2.467563, 5.521959, 1, 1, 1, 1, 1,
0.2028821, -0.05993802, 2.820715, 1, 1, 1, 1, 1,
0.2048788, -1.249102, 2.036566, 1, 1, 1, 1, 1,
0.2096429, 0.09086102, -0.5963848, 1, 1, 1, 1, 1,
0.2195503, 1.029056, -1.547757, 1, 1, 1, 1, 1,
0.2262776, -0.3526231, 4.030336, 1, 1, 1, 1, 1,
0.226694, -0.7385385, 3.178157, 0, 0, 1, 1, 1,
0.2294852, 0.8338109, 0.8739831, 1, 0, 0, 1, 1,
0.2308244, -1.416309, 3.023718, 1, 0, 0, 1, 1,
0.2325235, 0.562875, -0.1814413, 1, 0, 0, 1, 1,
0.2341665, -0.171732, 2.335441, 1, 0, 0, 1, 1,
0.2355009, 2.158126, 0.8246415, 1, 0, 0, 1, 1,
0.2366619, -2.009308, 4.377743, 0, 0, 0, 1, 1,
0.2372169, 0.3048292, -0.2031133, 0, 0, 0, 1, 1,
0.2399245, -0.8895364, 2.237798, 0, 0, 0, 1, 1,
0.2432962, -1.293394, 1.724091, 0, 0, 0, 1, 1,
0.2434251, 0.1246112, 0.3040177, 0, 0, 0, 1, 1,
0.2478443, 1.27709, 1.909035, 0, 0, 0, 1, 1,
0.2512774, 0.9633498, 0.6934867, 0, 0, 0, 1, 1,
0.2512887, 0.6688954, 1.153904, 1, 1, 1, 1, 1,
0.2578575, -0.6773559, 3.6674, 1, 1, 1, 1, 1,
0.2601607, 1.895246, 0.6086209, 1, 1, 1, 1, 1,
0.2608545, 0.2190914, 1.033468, 1, 1, 1, 1, 1,
0.2609122, 0.9931686, -0.6061952, 1, 1, 1, 1, 1,
0.2609781, 0.08543932, 2.01003, 1, 1, 1, 1, 1,
0.261444, 0.006360489, 0.6824239, 1, 1, 1, 1, 1,
0.2635664, -1.742252, 4.857177, 1, 1, 1, 1, 1,
0.2636683, -1.05095, 2.533768, 1, 1, 1, 1, 1,
0.2678628, 0.2622732, 1.079073, 1, 1, 1, 1, 1,
0.2692209, -0.8725746, 2.492335, 1, 1, 1, 1, 1,
0.2693414, -1.186416, 1.990375, 1, 1, 1, 1, 1,
0.2693523, 0.3266433, 1.320451, 1, 1, 1, 1, 1,
0.2722223, -2.46053, 3.328878, 1, 1, 1, 1, 1,
0.2777156, 0.8648587, -0.2175274, 1, 1, 1, 1, 1,
0.2836123, 0.4214732, -0.2356724, 0, 0, 1, 1, 1,
0.2843696, -2.517565, 2.729167, 1, 0, 0, 1, 1,
0.287631, -0.02951269, 0.49873, 1, 0, 0, 1, 1,
0.2913474, 0.7584291, -0.7460335, 1, 0, 0, 1, 1,
0.2917999, -0.2652147, 4.369407, 1, 0, 0, 1, 1,
0.2955879, 1.576916, 0.3509288, 1, 0, 0, 1, 1,
0.2966828, -0.2229516, 2.418497, 0, 0, 0, 1, 1,
0.2991237, 0.7976921, -0.2642976, 0, 0, 0, 1, 1,
0.29963, 0.2421462, 0.8747991, 0, 0, 0, 1, 1,
0.3003168, -0.4665782, 0.5175383, 0, 0, 0, 1, 1,
0.3040715, 1.400167, -0.7758802, 0, 0, 0, 1, 1,
0.3074303, 1.739474, 0.6804147, 0, 0, 0, 1, 1,
0.3089865, -0.003062718, 1.335953, 0, 0, 0, 1, 1,
0.3128889, 0.6989256, -0.1003695, 1, 1, 1, 1, 1,
0.3139919, -0.5494488, 5.011878, 1, 1, 1, 1, 1,
0.3193266, -0.7511327, 3.816481, 1, 1, 1, 1, 1,
0.3246192, 2.72013, 0.7431981, 1, 1, 1, 1, 1,
0.3260551, 0.8855227, 1.050575, 1, 1, 1, 1, 1,
0.3289468, 0.7956713, 0.2562008, 1, 1, 1, 1, 1,
0.3305393, -1.043899, 2.586639, 1, 1, 1, 1, 1,
0.3324931, 0.4152704, 0.06570505, 1, 1, 1, 1, 1,
0.3369184, 0.6251152, 0.01769173, 1, 1, 1, 1, 1,
0.3380114, 1.572255, 1.018525, 1, 1, 1, 1, 1,
0.3395179, 0.7432232, -0.5092005, 1, 1, 1, 1, 1,
0.3413723, 0.5330431, 1.624222, 1, 1, 1, 1, 1,
0.3439399, -0.8802697, 4.617841, 1, 1, 1, 1, 1,
0.3490144, -0.7976723, 3.597569, 1, 1, 1, 1, 1,
0.3534351, -0.2555915, 2.623762, 1, 1, 1, 1, 1,
0.3571095, -0.1536152, 1.778835, 0, 0, 1, 1, 1,
0.3586336, -1.124945, 1.635844, 1, 0, 0, 1, 1,
0.3605155, 0.5357308, 0.5798926, 1, 0, 0, 1, 1,
0.3621665, -0.4115385, 0.9348685, 1, 0, 0, 1, 1,
0.3638313, 2.299955, -1.919239, 1, 0, 0, 1, 1,
0.3649549, -0.4702738, 2.285236, 1, 0, 0, 1, 1,
0.3652866, -0.7253435, 3.786183, 0, 0, 0, 1, 1,
0.3690961, 0.9795272, 0.2748602, 0, 0, 0, 1, 1,
0.3698882, -0.937953, 3.35183, 0, 0, 0, 1, 1,
0.37852, 1.035407, -0.5211329, 0, 0, 0, 1, 1,
0.3791918, -0.3040069, 3.503942, 0, 0, 0, 1, 1,
0.3835206, -1.269714, 2.482195, 0, 0, 0, 1, 1,
0.386229, -0.1694617, 2.498946, 0, 0, 0, 1, 1,
0.3876538, 0.600928, 0.7865496, 1, 1, 1, 1, 1,
0.3934571, -0.3228962, 3.177802, 1, 1, 1, 1, 1,
0.3949247, -1.613068, 2.243232, 1, 1, 1, 1, 1,
0.3953902, 1.131355, 0.4375327, 1, 1, 1, 1, 1,
0.3958084, 0.2066671, 2.036711, 1, 1, 1, 1, 1,
0.3959005, -0.6526935, 1.788768, 1, 1, 1, 1, 1,
0.3976275, 0.2743717, 2.724562, 1, 1, 1, 1, 1,
0.4001686, 0.05191237, 1.805758, 1, 1, 1, 1, 1,
0.4023623, 1.834385, 1.010256, 1, 1, 1, 1, 1,
0.403424, 0.818391, 0.5076475, 1, 1, 1, 1, 1,
0.4058169, -1.242842, 3.394236, 1, 1, 1, 1, 1,
0.4064389, 1.997272, -0.3231954, 1, 1, 1, 1, 1,
0.4072984, 0.776849, 0.8603122, 1, 1, 1, 1, 1,
0.4096723, 0.5332322, 1.895176, 1, 1, 1, 1, 1,
0.4167501, -0.7919281, 1.419516, 1, 1, 1, 1, 1,
0.4188545, -1.137791, 2.74223, 0, 0, 1, 1, 1,
0.4188904, 0.2290728, 1.18368, 1, 0, 0, 1, 1,
0.424408, -0.1911962, 1.617662, 1, 0, 0, 1, 1,
0.4262489, -0.6197915, 1.286251, 1, 0, 0, 1, 1,
0.4274861, -0.3881218, 1.801161, 1, 0, 0, 1, 1,
0.4291602, -1.242089, 2.464593, 1, 0, 0, 1, 1,
0.4309732, 0.6261072, 1.178993, 0, 0, 0, 1, 1,
0.4323012, -0.1824692, 1.755345, 0, 0, 0, 1, 1,
0.4323257, 0.1610333, 0.4964718, 0, 0, 0, 1, 1,
0.4331774, 0.704399, 0.9672101, 0, 0, 0, 1, 1,
0.4355363, 0.1304522, 0.4855343, 0, 0, 0, 1, 1,
0.4367213, -0.0906161, 1.302563, 0, 0, 0, 1, 1,
0.4442308, 1.590757, 0.4549373, 0, 0, 0, 1, 1,
0.4523334, 0.4950164, 0.8496695, 1, 1, 1, 1, 1,
0.4542237, -0.1303645, 3.347553, 1, 1, 1, 1, 1,
0.4547433, -0.09323052, 1.849462, 1, 1, 1, 1, 1,
0.45569, -0.3466151, 3.311091, 1, 1, 1, 1, 1,
0.4566708, 0.2591924, 0.5877638, 1, 1, 1, 1, 1,
0.4576092, -1.085133, 5.588347, 1, 1, 1, 1, 1,
0.4603889, 0.468318, -0.5180376, 1, 1, 1, 1, 1,
0.4604077, 1.5064, -1.479743, 1, 1, 1, 1, 1,
0.460514, 0.2535325, -0.732222, 1, 1, 1, 1, 1,
0.4611082, 0.2756396, 2.658933, 1, 1, 1, 1, 1,
0.4613699, -0.5938273, 2.762847, 1, 1, 1, 1, 1,
0.4617853, -0.06064272, 1.875431, 1, 1, 1, 1, 1,
0.4636557, -0.2138196, 2.380298, 1, 1, 1, 1, 1,
0.4636905, -1.180646, 2.426117, 1, 1, 1, 1, 1,
0.4640455, -0.6934158, 2.439984, 1, 1, 1, 1, 1,
0.4711653, 0.3226045, 1.977734, 0, 0, 1, 1, 1,
0.4731953, 0.890462, 2.322586, 1, 0, 0, 1, 1,
0.4741747, -0.2280773, 3.44751, 1, 0, 0, 1, 1,
0.4760694, -2.303699, 1.621815, 1, 0, 0, 1, 1,
0.477553, 0.9934207, -0.5317368, 1, 0, 0, 1, 1,
0.4776026, 1.212713, -0.676799, 1, 0, 0, 1, 1,
0.4784681, 0.1803224, 0.858064, 0, 0, 0, 1, 1,
0.4807293, -0.1206116, 1.468362, 0, 0, 0, 1, 1,
0.4815608, 0.2594441, 2.052102, 0, 0, 0, 1, 1,
0.4819392, 0.1226269, 3.060988, 0, 0, 0, 1, 1,
0.4865336, -0.7599062, 3.305535, 0, 0, 0, 1, 1,
0.4872316, -0.6758572, 3.082968, 0, 0, 0, 1, 1,
0.4930645, 0.03806018, 3.44861, 0, 0, 0, 1, 1,
0.4935656, 0.4412988, -0.2366747, 1, 1, 1, 1, 1,
0.4940085, 0.2492001, 0.1899164, 1, 1, 1, 1, 1,
0.4981378, -0.4683596, 2.179515, 1, 1, 1, 1, 1,
0.5030279, 1.260145, -0.4795381, 1, 1, 1, 1, 1,
0.5117989, -0.710108, 1.379326, 1, 1, 1, 1, 1,
0.5156726, 1.006091, 2.601208, 1, 1, 1, 1, 1,
0.5158402, -0.3056807, 1.747224, 1, 1, 1, 1, 1,
0.5171854, 0.1018092, 1.002007, 1, 1, 1, 1, 1,
0.5195565, 2.876217, -0.7060218, 1, 1, 1, 1, 1,
0.5199875, 0.6492917, 1.128087, 1, 1, 1, 1, 1,
0.5211936, 0.708037, -0.0915697, 1, 1, 1, 1, 1,
0.5245125, -0.2429784, 0.4355389, 1, 1, 1, 1, 1,
0.5281577, -1.155172, 0.8962095, 1, 1, 1, 1, 1,
0.5309349, -0.3193967, 1.785028, 1, 1, 1, 1, 1,
0.5348634, -0.9257475, 1.791537, 1, 1, 1, 1, 1,
0.5349468, -1.461888, 4.834908, 0, 0, 1, 1, 1,
0.5374264, 0.1515417, 0.1680042, 1, 0, 0, 1, 1,
0.5375138, -0.6225895, 2.709731, 1, 0, 0, 1, 1,
0.5406252, -1.565109, 3.793286, 1, 0, 0, 1, 1,
0.5406588, -0.09564756, 1.57328, 1, 0, 0, 1, 1,
0.5430019, -0.1606914, 1.146377, 1, 0, 0, 1, 1,
0.5454587, -0.2061071, 0.5647418, 0, 0, 0, 1, 1,
0.5515739, 0.1217397, 2.24273, 0, 0, 0, 1, 1,
0.5607904, -0.003669917, 3.017957, 0, 0, 0, 1, 1,
0.5657982, 0.09756099, 2.24404, 0, 0, 0, 1, 1,
0.5688586, 1.168739, -1.357243, 0, 0, 0, 1, 1,
0.5690355, 0.3869984, 0.1607441, 0, 0, 0, 1, 1,
0.5717251, -1.193873, 3.897563, 0, 0, 0, 1, 1,
0.5726949, 1.221576, 0.8828665, 1, 1, 1, 1, 1,
0.5744488, 2.317633, 0.7683977, 1, 1, 1, 1, 1,
0.5747804, 0.4459082, 0.7896181, 1, 1, 1, 1, 1,
0.5755802, 0.08168101, 0.5897734, 1, 1, 1, 1, 1,
0.5770907, -1.658706, 2.892051, 1, 1, 1, 1, 1,
0.5831059, 0.7177629, 1.416076, 1, 1, 1, 1, 1,
0.5927555, -0.4232734, 3.005068, 1, 1, 1, 1, 1,
0.5938386, -0.08354264, 1.791625, 1, 1, 1, 1, 1,
0.5969325, 0.2356629, 0.9703344, 1, 1, 1, 1, 1,
0.5979188, 0.4577709, 1.187747, 1, 1, 1, 1, 1,
0.6042471, 0.3403776, 0.7703098, 1, 1, 1, 1, 1,
0.6095873, 1.557372, 0.5805726, 1, 1, 1, 1, 1,
0.6104507, -0.5164273, 3.573532, 1, 1, 1, 1, 1,
0.612549, -0.8093121, 1.883056, 1, 1, 1, 1, 1,
0.6127999, -0.5446214, 2.445602, 1, 1, 1, 1, 1,
0.617798, 0.378421, -1.172092, 0, 0, 1, 1, 1,
0.6215611, -0.6635996, 1.430949, 1, 0, 0, 1, 1,
0.6228579, -0.773678, 3.700168, 1, 0, 0, 1, 1,
0.6241351, -0.7480668, 2.809829, 1, 0, 0, 1, 1,
0.6256378, 0.1065118, 0.4779347, 1, 0, 0, 1, 1,
0.6368833, -1.312842, 3.54682, 1, 0, 0, 1, 1,
0.6370706, -0.4568975, 3.435807, 0, 0, 0, 1, 1,
0.6382819, -0.3848499, 2.040386, 0, 0, 0, 1, 1,
0.6403744, -2.097028, 1.589025, 0, 0, 0, 1, 1,
0.6504673, 0.5399651, 1.042157, 0, 0, 0, 1, 1,
0.651811, 0.5229223, -0.6408322, 0, 0, 0, 1, 1,
0.6532263, -1.415935, 0.9326264, 0, 0, 0, 1, 1,
0.6541296, -1.122599, 3.661729, 0, 0, 0, 1, 1,
0.6541492, -0.7768858, 1.7312, 1, 1, 1, 1, 1,
0.6582886, 1.077176, 0.890565, 1, 1, 1, 1, 1,
0.6623712, -0.714925, 1.269978, 1, 1, 1, 1, 1,
0.6680418, 0.4968682, 1.982381, 1, 1, 1, 1, 1,
0.6745105, -1.150792, 1.044599, 1, 1, 1, 1, 1,
0.6789896, 1.643598, 0.943143, 1, 1, 1, 1, 1,
0.6793085, -0.9777352, 3.358061, 1, 1, 1, 1, 1,
0.6909391, -1.090125, 2.144908, 1, 1, 1, 1, 1,
0.6948549, -1.09314, 1.944633, 1, 1, 1, 1, 1,
0.6960859, -1.509314, 3.227561, 1, 1, 1, 1, 1,
0.699659, -0.7521759, 1.621618, 1, 1, 1, 1, 1,
0.7043367, 1.380298, -0.3930185, 1, 1, 1, 1, 1,
0.70558, -0.811994, 2.097113, 1, 1, 1, 1, 1,
0.7144228, -2.109716, 1.928158, 1, 1, 1, 1, 1,
0.7281684, -0.3132038, 1.928366, 1, 1, 1, 1, 1,
0.7347385, -0.09897771, 3.092292, 0, 0, 1, 1, 1,
0.7352794, 0.1733513, 2.427163, 1, 0, 0, 1, 1,
0.7359245, 1.16536, -0.4274905, 1, 0, 0, 1, 1,
0.7382447, 1.298, 0.1757857, 1, 0, 0, 1, 1,
0.7424089, 1.918712, 0.5883518, 1, 0, 0, 1, 1,
0.7434124, -0.8272911, 1.484178, 1, 0, 0, 1, 1,
0.7482948, 1.389863, -0.1739834, 0, 0, 0, 1, 1,
0.7529783, 2.40305, 0.1060285, 0, 0, 0, 1, 1,
0.7571621, 0.4217873, 0.7340102, 0, 0, 0, 1, 1,
0.7645352, -1.910482, 1.821991, 0, 0, 0, 1, 1,
0.7647678, -0.2964515, 1.645347, 0, 0, 0, 1, 1,
0.7677186, 0.2728253, 2.663894, 0, 0, 0, 1, 1,
0.7701458, 2.06356, 0.04875634, 0, 0, 0, 1, 1,
0.7706871, -1.579995, 3.00545, 1, 1, 1, 1, 1,
0.7728406, 1.582386, 1.233045, 1, 1, 1, 1, 1,
0.7729549, 1.235283, -0.2316495, 1, 1, 1, 1, 1,
0.7745204, -1.159053, 3.191392, 1, 1, 1, 1, 1,
0.7754275, -0.9472835, 0.4038995, 1, 1, 1, 1, 1,
0.7782314, -1.192551, 2.063476, 1, 1, 1, 1, 1,
0.7803116, -1.733899, 3.755546, 1, 1, 1, 1, 1,
0.7804728, 1.400503, 0.7408798, 1, 1, 1, 1, 1,
0.7832949, 0.1119471, 1.596645, 1, 1, 1, 1, 1,
0.7893142, 1.168242, -0.6996508, 1, 1, 1, 1, 1,
0.789363, -0.008228799, 1.939301, 1, 1, 1, 1, 1,
0.7931905, -1.23533, 0.6107532, 1, 1, 1, 1, 1,
0.7975684, -0.7231371, 1.71325, 1, 1, 1, 1, 1,
0.7988513, 1.653277, -0.5149567, 1, 1, 1, 1, 1,
0.806981, -1.450637, 2.978473, 1, 1, 1, 1, 1,
0.8105189, -0.7330317, 0.5664169, 0, 0, 1, 1, 1,
0.8142794, -0.1405058, 0.02357873, 1, 0, 0, 1, 1,
0.8196867, -1.042116, 3.367426, 1, 0, 0, 1, 1,
0.823626, 1.139189, -1.519193, 1, 0, 0, 1, 1,
0.824916, 1.615193, 1.554146, 1, 0, 0, 1, 1,
0.8258004, 1.959378, 0.5247266, 1, 0, 0, 1, 1,
0.8320929, -0.8975099, 3.14382, 0, 0, 0, 1, 1,
0.8438639, -1.260589, 3.327048, 0, 0, 0, 1, 1,
0.8472827, 0.460271, 0.7491208, 0, 0, 0, 1, 1,
0.852643, 0.9296422, 1.286437, 0, 0, 0, 1, 1,
0.8587167, 0.5004871, -0.4232044, 0, 0, 0, 1, 1,
0.8588871, 0.02771533, 1.457791, 0, 0, 0, 1, 1,
0.8594868, 0.2653883, 1.320001, 0, 0, 0, 1, 1,
0.8630772, 0.468059, 1.750215, 1, 1, 1, 1, 1,
0.8632547, -0.3574773, 2.464072, 1, 1, 1, 1, 1,
0.8639039, -0.3139202, 2.355133, 1, 1, 1, 1, 1,
0.8675874, 0.8885322, 1.390668, 1, 1, 1, 1, 1,
0.8680483, 0.8379648, 1.448767, 1, 1, 1, 1, 1,
0.8703149, -1.076139, 2.525837, 1, 1, 1, 1, 1,
0.8820267, 0.2419773, -0.1721427, 1, 1, 1, 1, 1,
0.884917, -0.51616, 4.694246, 1, 1, 1, 1, 1,
0.8851043, 2.769425, -0.3892105, 1, 1, 1, 1, 1,
0.889886, 0.9795442, 2.045552, 1, 1, 1, 1, 1,
0.8985475, 0.1524142, 0.7475412, 1, 1, 1, 1, 1,
0.8987083, 2.353443, 2.567566, 1, 1, 1, 1, 1,
0.9011922, -0.3120126, 2.362695, 1, 1, 1, 1, 1,
0.9034694, -0.03438595, 2.181649, 1, 1, 1, 1, 1,
0.9052215, -0.3165747, 3.242504, 1, 1, 1, 1, 1,
0.9115965, 0.3432888, 0.3621913, 0, 0, 1, 1, 1,
0.9191014, -0.06009148, 4.183692, 1, 0, 0, 1, 1,
0.9202539, 0.08158855, 1.004905, 1, 0, 0, 1, 1,
0.9233095, 2.283298, 1.446953, 1, 0, 0, 1, 1,
0.925005, 0.4518099, 1.892865, 1, 0, 0, 1, 1,
0.9268037, -0.1966514, 2.752275, 1, 0, 0, 1, 1,
0.9320484, -0.1066787, 2.580901, 0, 0, 0, 1, 1,
0.9390768, -2.009273, 2.036409, 0, 0, 0, 1, 1,
0.943001, 0.135958, 2.394062, 0, 0, 0, 1, 1,
0.9628535, 0.2574263, 4.064514, 0, 0, 0, 1, 1,
0.9651957, 0.3615983, 2.34233, 0, 0, 0, 1, 1,
0.965337, -0.3461628, 1.217956, 0, 0, 0, 1, 1,
0.9812271, 0.5690432, 0.8574044, 0, 0, 0, 1, 1,
0.9859128, -1.513159, 3.135173, 1, 1, 1, 1, 1,
0.9894575, -0.4322138, 0.7612026, 1, 1, 1, 1, 1,
0.9936962, 1.845048, 0.2063285, 1, 1, 1, 1, 1,
1.006912, -1.484512, 2.459147, 1, 1, 1, 1, 1,
1.011781, 0.5619858, 1.328687, 1, 1, 1, 1, 1,
1.013686, -0.4674897, 1.892282, 1, 1, 1, 1, 1,
1.015323, 0.3511087, 1.578349, 1, 1, 1, 1, 1,
1.021464, -0.5591848, -0.02389734, 1, 1, 1, 1, 1,
1.031873, -0.8266206, 1.002151, 1, 1, 1, 1, 1,
1.034787, -1.034566, 0.7485518, 1, 1, 1, 1, 1,
1.035566, 0.3566646, 1.864172, 1, 1, 1, 1, 1,
1.040284, -0.2086007, 1.643603, 1, 1, 1, 1, 1,
1.045784, 0.1554678, 1.060819, 1, 1, 1, 1, 1,
1.048675, -1.887572, 2.615965, 1, 1, 1, 1, 1,
1.049756, 0.7298617, 1.20542, 1, 1, 1, 1, 1,
1.058748, -1.655178, 3.581437, 0, 0, 1, 1, 1,
1.062157, -1.193238, 0.472434, 1, 0, 0, 1, 1,
1.063648, -1.350823, 3.331618, 1, 0, 0, 1, 1,
1.071617, 0.5659302, 1.640323, 1, 0, 0, 1, 1,
1.076063, 0.7419184, 0.9933642, 1, 0, 0, 1, 1,
1.077088, -0.1050496, 2.274114, 1, 0, 0, 1, 1,
1.082756, 0.3217696, 1.216475, 0, 0, 0, 1, 1,
1.084703, -1.187187, 2.3448, 0, 0, 0, 1, 1,
1.087863, 1.303513, -0.2450007, 0, 0, 0, 1, 1,
1.096305, -1.146669, 2.540598, 0, 0, 0, 1, 1,
1.097333, 0.6607638, 1.630497, 0, 0, 0, 1, 1,
1.102079, -0.5177109, 1.256347, 0, 0, 0, 1, 1,
1.104262, -0.6523134, 1.483814, 0, 0, 0, 1, 1,
1.116281, 1.194087, 0.828573, 1, 1, 1, 1, 1,
1.11664, 0.02540192, 1.167022, 1, 1, 1, 1, 1,
1.117126, 0.3507759, 1.934537, 1, 1, 1, 1, 1,
1.161559, -0.6327183, 1.520215, 1, 1, 1, 1, 1,
1.164572, 1.441038, 0.7420379, 1, 1, 1, 1, 1,
1.186163, -1.363886, 2.739925, 1, 1, 1, 1, 1,
1.187904, -0.3316914, 2.371261, 1, 1, 1, 1, 1,
1.189213, 0.9809459, -0.4045456, 1, 1, 1, 1, 1,
1.189552, -0.3026605, 2.3621, 1, 1, 1, 1, 1,
1.191969, -0.5886176, 0.3516004, 1, 1, 1, 1, 1,
1.199134, 1.470751, 2.34931, 1, 1, 1, 1, 1,
1.206448, 0.09205849, 2.346428, 1, 1, 1, 1, 1,
1.206483, 0.8229035, 1.99348, 1, 1, 1, 1, 1,
1.213827, 0.03917986, 2.296067, 1, 1, 1, 1, 1,
1.227178, -0.133416, 2.744021, 1, 1, 1, 1, 1,
1.228615, -0.8766717, 3.658279, 0, 0, 1, 1, 1,
1.23032, -0.7291254, 1.878211, 1, 0, 0, 1, 1,
1.230983, 1.074483, 1.167828, 1, 0, 0, 1, 1,
1.236565, 0.5940474, 2.415047, 1, 0, 0, 1, 1,
1.248855, -0.7934161, 4.018382, 1, 0, 0, 1, 1,
1.24947, 0.6168414, 0.4204223, 1, 0, 0, 1, 1,
1.254072, -0.7564113, 1.775278, 0, 0, 0, 1, 1,
1.25474, -1.023398, 3.452819, 0, 0, 0, 1, 1,
1.260705, 0.8888862, 1.51115, 0, 0, 0, 1, 1,
1.261925, 0.5944287, -0.2247654, 0, 0, 0, 1, 1,
1.276617, -0.6157784, 2.641577, 0, 0, 0, 1, 1,
1.276674, -0.4864841, 2.186708, 0, 0, 0, 1, 1,
1.293332, 0.04433843, 2.742431, 0, 0, 0, 1, 1,
1.293517, 0.1287448, 0.9333581, 1, 1, 1, 1, 1,
1.293631, 1.1767, 0.07371315, 1, 1, 1, 1, 1,
1.296461, 1.172608, 0.5440406, 1, 1, 1, 1, 1,
1.311938, -0.03167682, 0.2829673, 1, 1, 1, 1, 1,
1.314504, -0.7677622, 0.5233371, 1, 1, 1, 1, 1,
1.321513, -0.3925484, 2.442094, 1, 1, 1, 1, 1,
1.324202, 0.1965825, 1.057484, 1, 1, 1, 1, 1,
1.325338, 0.334929, 2.064021, 1, 1, 1, 1, 1,
1.337729, 0.7561486, 0.09699736, 1, 1, 1, 1, 1,
1.340456, -1.241395, 3.968259, 1, 1, 1, 1, 1,
1.344188, -1.682806, -0.1906821, 1, 1, 1, 1, 1,
1.347692, 0.1617042, 1.60332, 1, 1, 1, 1, 1,
1.35479, 1.366379, -0.01670239, 1, 1, 1, 1, 1,
1.367829, 0.186854, 0.6059741, 1, 1, 1, 1, 1,
1.372587, -1.308713, 1.02996, 1, 1, 1, 1, 1,
1.373485, -0.462105, 1.667113, 0, 0, 1, 1, 1,
1.375163, 0.4873942, -0.358807, 1, 0, 0, 1, 1,
1.379843, -0.9665268, 0.6814004, 1, 0, 0, 1, 1,
1.393371, 0.5884967, 0.9305962, 1, 0, 0, 1, 1,
1.399063, 0.08529076, 0.9646063, 1, 0, 0, 1, 1,
1.400448, -1.070362, 1.512164, 1, 0, 0, 1, 1,
1.407358, -0.1187702, 1.974966, 0, 0, 0, 1, 1,
1.414017, -1.622732, 2.180181, 0, 0, 0, 1, 1,
1.425268, 0.1665514, 0.7496749, 0, 0, 0, 1, 1,
1.45239, -0.6997401, 1.014015, 0, 0, 0, 1, 1,
1.462545, 0.37565, 2.940993, 0, 0, 0, 1, 1,
1.468083, 0.2304723, 0.8933879, 0, 0, 0, 1, 1,
1.487854, -0.392549, 2.959263, 0, 0, 0, 1, 1,
1.488813, 0.1428694, 0.0982278, 1, 1, 1, 1, 1,
1.49475, 1.349037, 3.136716, 1, 1, 1, 1, 1,
1.507555, 0.4206319, -0.7211774, 1, 1, 1, 1, 1,
1.509029, -0.1950404, -0.589026, 1, 1, 1, 1, 1,
1.51603, -0.04758629, 3.374596, 1, 1, 1, 1, 1,
1.519926, 0.787149, -0.06267305, 1, 1, 1, 1, 1,
1.52118, -1.133121, 4.486517, 1, 1, 1, 1, 1,
1.521662, -1.084912, 3.43312, 1, 1, 1, 1, 1,
1.522494, -0.9928389, 1.811061, 1, 1, 1, 1, 1,
1.537364, 1.683873, -0.09224976, 1, 1, 1, 1, 1,
1.555333, -1.405467, 2.07742, 1, 1, 1, 1, 1,
1.571389, 2.017365, 0.1234234, 1, 1, 1, 1, 1,
1.572357, 0.1419407, 1.858175, 1, 1, 1, 1, 1,
1.575189, 0.1757879, 2.20001, 1, 1, 1, 1, 1,
1.584838, 0.0788148, 1.483624, 1, 1, 1, 1, 1,
1.591757, -0.8533036, 1.82221, 0, 0, 1, 1, 1,
1.595082, -0.898446, 1.08409, 1, 0, 0, 1, 1,
1.597759, 1.073476, 0.3806229, 1, 0, 0, 1, 1,
1.604371, -0.7620982, 2.619606, 1, 0, 0, 1, 1,
1.637171, -0.1496821, 3.349631, 1, 0, 0, 1, 1,
1.637582, -0.9494423, 0.9141313, 1, 0, 0, 1, 1,
1.639488, -0.8383376, 2.062597, 0, 0, 0, 1, 1,
1.649391, 0.558269, 2.320784, 0, 0, 0, 1, 1,
1.650181, -0.3836832, 4.579806, 0, 0, 0, 1, 1,
1.657538, -1.436388, 1.04047, 0, 0, 0, 1, 1,
1.657812, -1.173478, 1.544096, 0, 0, 0, 1, 1,
1.658871, 0.9423156, 1.70383, 0, 0, 0, 1, 1,
1.667019, -0.7599601, 2.190372, 0, 0, 0, 1, 1,
1.667887, 0.4403781, 2.39894, 1, 1, 1, 1, 1,
1.69294, 1.277823, 1.302935, 1, 1, 1, 1, 1,
1.705258, 0.1730572, 2.321666, 1, 1, 1, 1, 1,
1.713049, -1.100766, 2.172981, 1, 1, 1, 1, 1,
1.72217, -0.701863, 1.077733, 1, 1, 1, 1, 1,
1.732959, 0.6839036, 2.36111, 1, 1, 1, 1, 1,
1.734476, -2.29479, 0.9928257, 1, 1, 1, 1, 1,
1.743318, -0.8762802, 2.915987, 1, 1, 1, 1, 1,
1.745252, 0.1304911, 0.4982743, 1, 1, 1, 1, 1,
1.799773, 1.466859, -0.1209074, 1, 1, 1, 1, 1,
1.800954, 0.5625559, 0.03874125, 1, 1, 1, 1, 1,
1.848344, -0.3151461, 3.200752, 1, 1, 1, 1, 1,
1.874403, 0.7761825, 1.227232, 1, 1, 1, 1, 1,
1.882434, -1.044511, 0.5789992, 1, 1, 1, 1, 1,
1.891431, 0.6214889, 1.638481, 1, 1, 1, 1, 1,
1.909468, 2.133013, -1.152732, 0, 0, 1, 1, 1,
1.911665, -1.323224, 1.724155, 1, 0, 0, 1, 1,
1.913886, 0.5521714, 3.608417, 1, 0, 0, 1, 1,
1.916097, 0.9104383, 2.319082, 1, 0, 0, 1, 1,
1.932181, -1.14858, 2.60652, 1, 0, 0, 1, 1,
1.934141, -0.4584751, 1.863005, 1, 0, 0, 1, 1,
1.936487, 0.3161675, 0.3764434, 0, 0, 0, 1, 1,
1.947275, 1.073418, -0.6838582, 0, 0, 0, 1, 1,
1.960911, -2.381452, 2.496105, 0, 0, 0, 1, 1,
1.962774, 1.381944, 2.526186, 0, 0, 0, 1, 1,
1.969199, -0.8675599, 2.775435, 0, 0, 0, 1, 1,
1.973374, 1.865241, 2.316493, 0, 0, 0, 1, 1,
1.975204, 0.3082714, 2.561732, 0, 0, 0, 1, 1,
1.977766, -0.6505228, 1.276711, 1, 1, 1, 1, 1,
2.006692, -0.1161548, 1.444603, 1, 1, 1, 1, 1,
2.013832, -0.4037159, 0.5571683, 1, 1, 1, 1, 1,
2.029313, -0.2036676, 2.008697, 1, 1, 1, 1, 1,
2.029477, -0.3599067, 2.150065, 1, 1, 1, 1, 1,
2.039822, 0.4572741, 2.445518, 1, 1, 1, 1, 1,
2.045385, -1.473837, 2.868412, 1, 1, 1, 1, 1,
2.04641, -0.6364452, 0.08337051, 1, 1, 1, 1, 1,
2.052584, -0.05194476, 2.214861, 1, 1, 1, 1, 1,
2.091484, 1.056876, 0.9295557, 1, 1, 1, 1, 1,
2.101261, 0.6465005, 0.7178352, 1, 1, 1, 1, 1,
2.112058, 0.03736548, 1.016185, 1, 1, 1, 1, 1,
2.122007, 1.215775, -0.06331825, 1, 1, 1, 1, 1,
2.125594, 0.858578, 2.45163, 1, 1, 1, 1, 1,
2.163999, -0.3827063, -0.05805393, 1, 1, 1, 1, 1,
2.174651, 0.1213796, 1.205016, 0, 0, 1, 1, 1,
2.211277, -0.8693463, 3.341264, 1, 0, 0, 1, 1,
2.254042, -0.2629223, 2.663394, 1, 0, 0, 1, 1,
2.259557, 0.3421972, 0.5763406, 1, 0, 0, 1, 1,
2.26141, 1.004934, 0.7801047, 1, 0, 0, 1, 1,
2.27488, -0.5197337, 1.756315, 1, 0, 0, 1, 1,
2.287438, -1.311956, 2.076773, 0, 0, 0, 1, 1,
2.321051, 0.4711196, 2.005694, 0, 0, 0, 1, 1,
2.347475, 0.6968078, 0.01217258, 0, 0, 0, 1, 1,
2.396437, -0.7393731, 2.477018, 0, 0, 0, 1, 1,
2.434737, -0.2297835, -0.09285994, 0, 0, 0, 1, 1,
2.456712, 0.5072066, 1.452258, 0, 0, 0, 1, 1,
2.474989, -0.9204318, 1.921048, 0, 0, 0, 1, 1,
2.53358, 0.3841695, 3.874917, 1, 1, 1, 1, 1,
2.543744, 0.3517585, -0.06981672, 1, 1, 1, 1, 1,
2.596726, 0.4754041, -0.8065562, 1, 1, 1, 1, 1,
2.665365, 2.211977, 2.788949, 1, 1, 1, 1, 1,
2.683564, -0.6863014, 1.409881, 1, 1, 1, 1, 1,
2.733541, 0.7606865, 2.565353, 1, 1, 1, 1, 1,
3.110169, 2.102687, 1.318686, 1, 1, 1, 1, 1
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
var radius = 9.781451;
var distance = 34.35693;
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
mvMatrix.translate( 0.2932754, -0.2276056, -0.1421959 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.35693);
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
