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
-3.506793, 0.9698505, -1.817141, 1, 0, 0, 1,
-2.730652, 2.149832, -1.167328, 1, 0.007843138, 0, 1,
-2.690923, 0.131796, -2.937367, 1, 0.01176471, 0, 1,
-2.588123, -1.624064, -2.448796, 1, 0.01960784, 0, 1,
-2.569885, -0.5805399, -2.25022, 1, 0.02352941, 0, 1,
-2.462776, 2.082708, -0.8105879, 1, 0.03137255, 0, 1,
-2.34991, -0.1849201, -3.77234, 1, 0.03529412, 0, 1,
-2.348467, 0.801377, -1.649244, 1, 0.04313726, 0, 1,
-2.346435, 0.3370419, -1.243806, 1, 0.04705882, 0, 1,
-2.286093, -0.278529, -1.02503, 1, 0.05490196, 0, 1,
-2.254609, 2.078324, 0.03155085, 1, 0.05882353, 0, 1,
-2.222547, 0.3056152, -0.2387167, 1, 0.06666667, 0, 1,
-2.182901, 0.5539554, -0.6100021, 1, 0.07058824, 0, 1,
-2.171522, 0.6112056, -0.04508836, 1, 0.07843138, 0, 1,
-2.118746, -1.050389, -1.925759, 1, 0.08235294, 0, 1,
-2.102962, 0.7850322, -1.667577, 1, 0.09019608, 0, 1,
-2.078033, 0.02703006, -0.5027731, 1, 0.09411765, 0, 1,
-2.053092, 0.2106976, -0.5849594, 1, 0.1019608, 0, 1,
-2.038913, -1.070307, -1.148441, 1, 0.1098039, 0, 1,
-1.983589, 0.8870227, -1.014838, 1, 0.1137255, 0, 1,
-1.973713, 0.3095469, -1.781707, 1, 0.1215686, 0, 1,
-1.967946, -1.429096, -2.808897, 1, 0.1254902, 0, 1,
-1.915344, 0.4051223, -0.6782558, 1, 0.1333333, 0, 1,
-1.909055, -0.8613912, -0.830345, 1, 0.1372549, 0, 1,
-1.897143, -0.2816453, -0.1862734, 1, 0.145098, 0, 1,
-1.874342, 0.2374947, 0.8579972, 1, 0.1490196, 0, 1,
-1.870168, -0.9871148, -1.942902, 1, 0.1568628, 0, 1,
-1.848505, -0.3123902, -1.001172, 1, 0.1607843, 0, 1,
-1.845323, -1.504912, -2.372518, 1, 0.1686275, 0, 1,
-1.821867, 0.03326609, -1.55091, 1, 0.172549, 0, 1,
-1.821175, 0.5459396, -0.5791183, 1, 0.1803922, 0, 1,
-1.820326, 1.028973, -2.05155, 1, 0.1843137, 0, 1,
-1.799883, 0.4159983, -0.4615746, 1, 0.1921569, 0, 1,
-1.730905, -1.45657, -3.149781, 1, 0.1960784, 0, 1,
-1.704462, -0.4171, -2.145673, 1, 0.2039216, 0, 1,
-1.691347, -0.715595, -1.454092, 1, 0.2117647, 0, 1,
-1.687565, 0.2213793, -2.038273, 1, 0.2156863, 0, 1,
-1.686974, 0.8887321, 0.2817618, 1, 0.2235294, 0, 1,
-1.68591, 0.5104155, -1.250297, 1, 0.227451, 0, 1,
-1.684792, -0.9203014, -1.694683, 1, 0.2352941, 0, 1,
-1.669598, 1.341638, -1.669331, 1, 0.2392157, 0, 1,
-1.663518, 0.3376667, -0.3554716, 1, 0.2470588, 0, 1,
-1.663013, -1.578955, -0.1021269, 1, 0.2509804, 0, 1,
-1.642902, -0.2355531, -1.445897, 1, 0.2588235, 0, 1,
-1.632129, 0.8890527, -0.936609, 1, 0.2627451, 0, 1,
-1.626142, -0.5570007, -0.4777686, 1, 0.2705882, 0, 1,
-1.61783, -0.1430069, -1.26671, 1, 0.2745098, 0, 1,
-1.590658, 1.383823, -0.5804219, 1, 0.282353, 0, 1,
-1.580169, -1.046274, -3.510383, 1, 0.2862745, 0, 1,
-1.574374, 0.09704857, -0.9724262, 1, 0.2941177, 0, 1,
-1.559168, 2.055118, 1.328376, 1, 0.3019608, 0, 1,
-1.5504, 0.7388088, -0.9078469, 1, 0.3058824, 0, 1,
-1.542721, -2.027068, -1.733832, 1, 0.3137255, 0, 1,
-1.537612, -0.5543531, -1.072797, 1, 0.3176471, 0, 1,
-1.533139, -0.142029, -3.302601, 1, 0.3254902, 0, 1,
-1.528335, -1.481333, -2.402808, 1, 0.3294118, 0, 1,
-1.520262, 0.1240676, 0.7041224, 1, 0.3372549, 0, 1,
-1.518719, -0.1728604, -0.6949401, 1, 0.3411765, 0, 1,
-1.512774, 0.09419589, -1.610815, 1, 0.3490196, 0, 1,
-1.504887, -0.7259787, -4.572845, 1, 0.3529412, 0, 1,
-1.487595, 0.2680337, -2.954103, 1, 0.3607843, 0, 1,
-1.48424, 0.03678847, -2.342746, 1, 0.3647059, 0, 1,
-1.48131, 0.09291053, -1.114587, 1, 0.372549, 0, 1,
-1.478917, -0.3655547, -1.367867, 1, 0.3764706, 0, 1,
-1.475121, 0.5609663, 0.07203522, 1, 0.3843137, 0, 1,
-1.4733, -0.1906639, -2.056745, 1, 0.3882353, 0, 1,
-1.453177, 0.4916953, -0.3613938, 1, 0.3960784, 0, 1,
-1.433058, -0.2150511, -4.661661, 1, 0.4039216, 0, 1,
-1.43061, 0.4729977, -2.946199, 1, 0.4078431, 0, 1,
-1.429629, 1.778406, -0.7491647, 1, 0.4156863, 0, 1,
-1.420749, 0.1623758, -2.214338, 1, 0.4196078, 0, 1,
-1.410672, -1.879957, -2.694371, 1, 0.427451, 0, 1,
-1.408292, -1.020147, -2.963, 1, 0.4313726, 0, 1,
-1.407643, 0.2731476, -2.241759, 1, 0.4392157, 0, 1,
-1.403378, -0.4809721, -2.865626, 1, 0.4431373, 0, 1,
-1.39943, -1.038252, -2.663464, 1, 0.4509804, 0, 1,
-1.396755, 0.1641239, -2.284782, 1, 0.454902, 0, 1,
-1.395214, -1.077539, -2.975611, 1, 0.4627451, 0, 1,
-1.391433, -0.1463276, -1.960691, 1, 0.4666667, 0, 1,
-1.387867, 0.05029855, -1.233059, 1, 0.4745098, 0, 1,
-1.386862, -0.825121, -1.249908, 1, 0.4784314, 0, 1,
-1.38412, 0.6878654, -1.587404, 1, 0.4862745, 0, 1,
-1.369654, -0.318464, -2.983183, 1, 0.4901961, 0, 1,
-1.36233, 0.4594508, -1.019446, 1, 0.4980392, 0, 1,
-1.349859, -0.8709134, -3.367546, 1, 0.5058824, 0, 1,
-1.341876, 1.250598, -0.6488091, 1, 0.509804, 0, 1,
-1.326223, 0.6354041, -1.071089, 1, 0.5176471, 0, 1,
-1.319183, 1.072304, 0.4987841, 1, 0.5215687, 0, 1,
-1.311137, -0.9238543, -2.460829, 1, 0.5294118, 0, 1,
-1.304829, 0.7083715, -2.028477, 1, 0.5333334, 0, 1,
-1.30475, 0.3944341, -1.658821, 1, 0.5411765, 0, 1,
-1.301763, 1.433724, -1.495443, 1, 0.5450981, 0, 1,
-1.287517, 0.9252064, -1.32559, 1, 0.5529412, 0, 1,
-1.26301, 1.739998, -0.3592899, 1, 0.5568628, 0, 1,
-1.258949, 1.425542, 1.383536, 1, 0.5647059, 0, 1,
-1.251781, 1.15037, -1.081308, 1, 0.5686275, 0, 1,
-1.239574, 0.9262055, -0.959578, 1, 0.5764706, 0, 1,
-1.239542, 0.2518746, -0.1417675, 1, 0.5803922, 0, 1,
-1.238745, 1.349918, -1.836068, 1, 0.5882353, 0, 1,
-1.232783, 0.1092955, -3.733076, 1, 0.5921569, 0, 1,
-1.230474, -1.183187, -0.7306321, 1, 0.6, 0, 1,
-1.22546, -1.202667, -3.140321, 1, 0.6078432, 0, 1,
-1.22089, -1.446833, -1.755193, 1, 0.6117647, 0, 1,
-1.217942, -0.2709685, -2.184273, 1, 0.6196079, 0, 1,
-1.217912, -0.09284092, -2.151185, 1, 0.6235294, 0, 1,
-1.217194, -0.4455135, -2.991889, 1, 0.6313726, 0, 1,
-1.206995, 0.8496993, -0.8163145, 1, 0.6352941, 0, 1,
-1.202601, -1.796261, -4.096406, 1, 0.6431373, 0, 1,
-1.197926, -1.325885, -2.907802, 1, 0.6470588, 0, 1,
-1.182407, 1.127136, -0.88232, 1, 0.654902, 0, 1,
-1.172698, -0.7448177, -1.688462, 1, 0.6588235, 0, 1,
-1.171375, -0.3441263, -3.174855, 1, 0.6666667, 0, 1,
-1.167754, -1.363613, -1.984633, 1, 0.6705883, 0, 1,
-1.16471, 0.2605321, -1.773103, 1, 0.6784314, 0, 1,
-1.159415, -0.3217159, -2.120495, 1, 0.682353, 0, 1,
-1.152116, -0.01956266, -2.635709, 1, 0.6901961, 0, 1,
-1.146966, 0.83953, -2.353048, 1, 0.6941177, 0, 1,
-1.145277, -1.138605, -2.938544, 1, 0.7019608, 0, 1,
-1.140736, 0.7021913, -1.053918, 1, 0.7098039, 0, 1,
-1.135993, 1.56499, -0.9668818, 1, 0.7137255, 0, 1,
-1.134258, 0.3303317, -1.476174, 1, 0.7215686, 0, 1,
-1.127129, 0.9131163, -0.8724803, 1, 0.7254902, 0, 1,
-1.126542, -1.386943, -1.480674, 1, 0.7333333, 0, 1,
-1.12015, -0.4773555, -3.955453, 1, 0.7372549, 0, 1,
-1.119834, 0.4838476, -0.6932115, 1, 0.7450981, 0, 1,
-1.115212, 0.3232673, -3.225313, 1, 0.7490196, 0, 1,
-1.113529, -1.451192, -3.592777, 1, 0.7568628, 0, 1,
-1.111476, 0.1049609, -1.448182, 1, 0.7607843, 0, 1,
-1.109557, -1.663754, -2.214025, 1, 0.7686275, 0, 1,
-1.107902, 0.1447805, -1.146127, 1, 0.772549, 0, 1,
-1.106136, -0.6751966, -0.6556367, 1, 0.7803922, 0, 1,
-1.100639, -2.08939, -3.168385, 1, 0.7843137, 0, 1,
-1.095858, -0.1596697, -2.339234, 1, 0.7921569, 0, 1,
-1.092089, -0.8868334, -2.475168, 1, 0.7960784, 0, 1,
-1.090977, 0.9822085, -1.859529, 1, 0.8039216, 0, 1,
-1.086318, 1.116126, -0.3932503, 1, 0.8117647, 0, 1,
-1.084029, 0.651444, -1.246505, 1, 0.8156863, 0, 1,
-1.079594, 0.01705081, -1.722796, 1, 0.8235294, 0, 1,
-1.071419, 0.1108075, -1.817416, 1, 0.827451, 0, 1,
-1.06914, 2.082661, -0.05054721, 1, 0.8352941, 0, 1,
-1.068654, -0.8656863, 0.03970803, 1, 0.8392157, 0, 1,
-1.068506, -1.796353, -2.771414, 1, 0.8470588, 0, 1,
-1.066871, 0.4622444, -1.996347, 1, 0.8509804, 0, 1,
-1.066795, 0.5474193, -2.478017, 1, 0.8588235, 0, 1,
-1.066611, -0.3262797, -3.277835, 1, 0.8627451, 0, 1,
-1.058159, 0.6672098, -0.07285578, 1, 0.8705882, 0, 1,
-1.056579, 0.02294636, -0.4681851, 1, 0.8745098, 0, 1,
-1.054087, 0.9643217, 0.7767534, 1, 0.8823529, 0, 1,
-1.05224, 0.416392, -1.836987, 1, 0.8862745, 0, 1,
-1.044701, 0.04438138, -2.74458, 1, 0.8941177, 0, 1,
-1.04359, 1.780684, -0.8300603, 1, 0.8980392, 0, 1,
-1.040566, -0.06289809, -3.853729, 1, 0.9058824, 0, 1,
-1.031027, -0.3940874, -1.464846, 1, 0.9137255, 0, 1,
-1.025727, 0.277164, -2.417042, 1, 0.9176471, 0, 1,
-1.025536, 0.4730551, -1.466483, 1, 0.9254902, 0, 1,
-1.016764, -2.102105, -3.862046, 1, 0.9294118, 0, 1,
-1.004471, 1.152508, -1.290364, 1, 0.9372549, 0, 1,
-1.002919, 0.7354019, -0.3939294, 1, 0.9411765, 0, 1,
-0.9988371, 1.724711, 1.541472, 1, 0.9490196, 0, 1,
-0.9976306, 0.392022, 1.15025, 1, 0.9529412, 0, 1,
-0.9967319, 0.3498742, -0.9322276, 1, 0.9607843, 0, 1,
-0.9949862, -1.256797, -2.442821, 1, 0.9647059, 0, 1,
-0.9907658, 0.9641338, -1.57444, 1, 0.972549, 0, 1,
-0.9896606, -0.6097824, -2.163234, 1, 0.9764706, 0, 1,
-0.9820422, 1.908822, 0.1823214, 1, 0.9843137, 0, 1,
-0.9810601, 0.6884404, -1.924412, 1, 0.9882353, 0, 1,
-0.9783896, -0.0869026, -1.123909, 1, 0.9960784, 0, 1,
-0.9732267, -0.3078525, -1.465896, 0.9960784, 1, 0, 1,
-0.9727316, -0.3836271, -2.100065, 0.9921569, 1, 0, 1,
-0.9716331, -1.227852, -2.310481, 0.9843137, 1, 0, 1,
-0.9669421, 1.717789, 0.6719386, 0.9803922, 1, 0, 1,
-0.9643933, 0.7116982, -1.808795, 0.972549, 1, 0, 1,
-0.9633132, -1.288432, -2.60101, 0.9686275, 1, 0, 1,
-0.9590153, -0.9960552, -3.96876, 0.9607843, 1, 0, 1,
-0.9583338, -1.119174, -1.645171, 0.9568627, 1, 0, 1,
-0.9576392, 0.453153, -1.691489, 0.9490196, 1, 0, 1,
-0.9530101, 0.01028931, -2.673908, 0.945098, 1, 0, 1,
-0.9445227, 0.4886503, -2.35029, 0.9372549, 1, 0, 1,
-0.9443254, 1.224606, 0.01330737, 0.9333333, 1, 0, 1,
-0.9401599, -1.499012, -3.637747, 0.9254902, 1, 0, 1,
-0.9368901, 0.3795049, -1.860785, 0.9215686, 1, 0, 1,
-0.9365888, 0.1336974, -2.866103, 0.9137255, 1, 0, 1,
-0.9361794, 0.7833753, -0.938088, 0.9098039, 1, 0, 1,
-0.9283573, -0.8776395, -2.939268, 0.9019608, 1, 0, 1,
-0.9257191, -0.986772, -3.517055, 0.8941177, 1, 0, 1,
-0.9241413, -0.6672994, -1.986227, 0.8901961, 1, 0, 1,
-0.9232609, 1.017871, 0.9440185, 0.8823529, 1, 0, 1,
-0.9231393, -0.4221832, -1.98215, 0.8784314, 1, 0, 1,
-0.9230888, -2.118536, -3.525629, 0.8705882, 1, 0, 1,
-0.916278, 0.1525418, -1.008471, 0.8666667, 1, 0, 1,
-0.9160101, 0.6497843, -1.604805, 0.8588235, 1, 0, 1,
-0.913688, 0.08157019, -1.301868, 0.854902, 1, 0, 1,
-0.9107326, -0.05047072, -1.944739, 0.8470588, 1, 0, 1,
-0.90671, 0.309967, -0.8684905, 0.8431373, 1, 0, 1,
-0.9046743, -0.03220436, -1.499401, 0.8352941, 1, 0, 1,
-0.893122, -0.6958498, -2.211542, 0.8313726, 1, 0, 1,
-0.8923253, -0.7883265, -0.9924909, 0.8235294, 1, 0, 1,
-0.8889636, -2.042564, -2.631769, 0.8196079, 1, 0, 1,
-0.8880058, -0.5196403, -2.451786, 0.8117647, 1, 0, 1,
-0.880098, 1.124793, 1.362279, 0.8078431, 1, 0, 1,
-0.8774369, -0.7791486, -2.478457, 0.8, 1, 0, 1,
-0.8762187, 0.09963981, -1.513179, 0.7921569, 1, 0, 1,
-0.8749813, -0.2254691, -1.963134, 0.7882353, 1, 0, 1,
-0.8734621, -1.747556, -1.234506, 0.7803922, 1, 0, 1,
-0.869715, -0.3934382, -1.894155, 0.7764706, 1, 0, 1,
-0.8648841, 0.9710525, 0.3912653, 0.7686275, 1, 0, 1,
-0.8629233, 0.05081598, -1.045272, 0.7647059, 1, 0, 1,
-0.8596498, 0.8244253, -0.4501478, 0.7568628, 1, 0, 1,
-0.8585901, 1.09759, 0.7892379, 0.7529412, 1, 0, 1,
-0.8412095, -0.5864411, -1.996523, 0.7450981, 1, 0, 1,
-0.83926, 1.203658, 0.4279869, 0.7411765, 1, 0, 1,
-0.8389232, -0.6002646, -2.385497, 0.7333333, 1, 0, 1,
-0.8387133, 0.3896734, -0.7785619, 0.7294118, 1, 0, 1,
-0.8335538, 0.8619325, -0.1454012, 0.7215686, 1, 0, 1,
-0.829388, 0.3888538, -0.3559561, 0.7176471, 1, 0, 1,
-0.8266335, -0.3109372, -1.854805, 0.7098039, 1, 0, 1,
-0.8218285, -0.3265862, -2.945542, 0.7058824, 1, 0, 1,
-0.8200032, 0.8510272, -1.18719, 0.6980392, 1, 0, 1,
-0.818849, 0.00180262, -1.623932, 0.6901961, 1, 0, 1,
-0.8152359, -1.407234, -3.529694, 0.6862745, 1, 0, 1,
-0.813529, -0.7618061, -2.250329, 0.6784314, 1, 0, 1,
-0.8101886, -1.331653, -3.386394, 0.6745098, 1, 0, 1,
-0.8027062, -0.5757915, -1.82959, 0.6666667, 1, 0, 1,
-0.8024554, -1.05345, -2.292672, 0.6627451, 1, 0, 1,
-0.7991912, -0.2216566, -1.800188, 0.654902, 1, 0, 1,
-0.7927833, 0.8714372, -0.7997207, 0.6509804, 1, 0, 1,
-0.7873824, 1.131045, -0.6227136, 0.6431373, 1, 0, 1,
-0.786097, 2.014983, -0.06019842, 0.6392157, 1, 0, 1,
-0.785116, 0.5151207, -1.770786, 0.6313726, 1, 0, 1,
-0.779402, 0.8462366, -0.8073447, 0.627451, 1, 0, 1,
-0.7787477, 2.009828, -0.658688, 0.6196079, 1, 0, 1,
-0.7769644, -0.4425937, -2.44126, 0.6156863, 1, 0, 1,
-0.7744548, -0.8207164, -4.050591, 0.6078432, 1, 0, 1,
-0.7716061, 1.460579, 0.4894404, 0.6039216, 1, 0, 1,
-0.7711485, 1.207611, -1.060415, 0.5960785, 1, 0, 1,
-0.7610343, 0.2026982, -3.20988, 0.5882353, 1, 0, 1,
-0.755583, -0.7169542, -2.490027, 0.5843138, 1, 0, 1,
-0.7508134, 0.8885559, 0.1770577, 0.5764706, 1, 0, 1,
-0.745786, -2.176582, -2.269297, 0.572549, 1, 0, 1,
-0.7424152, 0.922914, -0.7055937, 0.5647059, 1, 0, 1,
-0.7397428, 0.3237335, -1.830618, 0.5607843, 1, 0, 1,
-0.7380896, -0.5141147, -2.177998, 0.5529412, 1, 0, 1,
-0.7370799, -0.8364007, -0.8174878, 0.5490196, 1, 0, 1,
-0.730306, -0.996318, -2.020917, 0.5411765, 1, 0, 1,
-0.7290092, -0.1088403, -3.397279, 0.5372549, 1, 0, 1,
-0.7164899, 0.4159229, -1.867615, 0.5294118, 1, 0, 1,
-0.7123538, 0.644816, 0.6275069, 0.5254902, 1, 0, 1,
-0.7119873, 0.2488254, -0.5596743, 0.5176471, 1, 0, 1,
-0.7106355, -0.5180097, -1.79192, 0.5137255, 1, 0, 1,
-0.706388, -0.2339416, -2.019099, 0.5058824, 1, 0, 1,
-0.7062038, 1.469195, -1.291488, 0.5019608, 1, 0, 1,
-0.7008789, 0.172799, -0.4289613, 0.4941176, 1, 0, 1,
-0.6965996, 0.964992, 0.4537933, 0.4862745, 1, 0, 1,
-0.6965907, -1.376281, -1.175572, 0.4823529, 1, 0, 1,
-0.6923021, 1.942113, -0.661604, 0.4745098, 1, 0, 1,
-0.6903575, 1.197071, -1.537262, 0.4705882, 1, 0, 1,
-0.6899587, -0.1165059, -2.948323, 0.4627451, 1, 0, 1,
-0.6895822, 0.3579839, 0.217225, 0.4588235, 1, 0, 1,
-0.6888696, -1.674759, -2.214866, 0.4509804, 1, 0, 1,
-0.6836564, 0.5134137, 0.06374661, 0.4470588, 1, 0, 1,
-0.6791682, 0.6410277, -0.5756071, 0.4392157, 1, 0, 1,
-0.6761337, -1.63385, -2.756419, 0.4352941, 1, 0, 1,
-0.6745689, 0.02653751, -1.916329, 0.427451, 1, 0, 1,
-0.6736987, -2.204741, -2.246228, 0.4235294, 1, 0, 1,
-0.6701718, -0.8426995, -1.168416, 0.4156863, 1, 0, 1,
-0.6699334, -0.2086669, -2.065647, 0.4117647, 1, 0, 1,
-0.6683863, 0.5214512, 0.03763001, 0.4039216, 1, 0, 1,
-0.6679249, 2.391659, -0.22045, 0.3960784, 1, 0, 1,
-0.667166, -0.338612, -3.567604, 0.3921569, 1, 0, 1,
-0.6638426, 0.5065042, -2.711412, 0.3843137, 1, 0, 1,
-0.6590164, -0.1486363, -1.875185, 0.3803922, 1, 0, 1,
-0.6569866, 0.8056023, -0.8629011, 0.372549, 1, 0, 1,
-0.6515951, 0.4882941, -0.7875414, 0.3686275, 1, 0, 1,
-0.6506857, -0.7546887, -2.363245, 0.3607843, 1, 0, 1,
-0.649874, -0.7414704, -1.675591, 0.3568628, 1, 0, 1,
-0.6479395, -0.3027212, -2.173316, 0.3490196, 1, 0, 1,
-0.6470761, 1.596525, -0.4073229, 0.345098, 1, 0, 1,
-0.6424254, -0.4759106, -2.500386, 0.3372549, 1, 0, 1,
-0.6423996, -1.357425, -2.446643, 0.3333333, 1, 0, 1,
-0.6391424, -0.6595915, -1.904694, 0.3254902, 1, 0, 1,
-0.6386799, 0.4344775, -3.121045, 0.3215686, 1, 0, 1,
-0.6245004, 0.6058919, -1.59874, 0.3137255, 1, 0, 1,
-0.6229239, 0.6518784, 0.3369994, 0.3098039, 1, 0, 1,
-0.619366, -2.699596, -2.658889, 0.3019608, 1, 0, 1,
-0.617374, -0.4798456, -1.431553, 0.2941177, 1, 0, 1,
-0.6171715, -0.1565073, -3.2456, 0.2901961, 1, 0, 1,
-0.6102214, -0.07662527, -2.174741, 0.282353, 1, 0, 1,
-0.6055705, -1.641398, -3.926269, 0.2784314, 1, 0, 1,
-0.6033922, 1.082532, -0.219269, 0.2705882, 1, 0, 1,
-0.5997276, 0.465274, -1.978824, 0.2666667, 1, 0, 1,
-0.5994098, 0.3480713, -1.198906, 0.2588235, 1, 0, 1,
-0.5969458, 1.461555, 0.4318671, 0.254902, 1, 0, 1,
-0.5947491, 0.5355309, -0.9098933, 0.2470588, 1, 0, 1,
-0.5886524, 1.824688, -0.505314, 0.2431373, 1, 0, 1,
-0.580639, 0.7268563, 0.1887781, 0.2352941, 1, 0, 1,
-0.5796822, -1.452544, -2.464074, 0.2313726, 1, 0, 1,
-0.5792853, 0.404678, -1.704519, 0.2235294, 1, 0, 1,
-0.5769926, -0.08919724, -0.6443626, 0.2196078, 1, 0, 1,
-0.5716745, -0.2362718, -2.239714, 0.2117647, 1, 0, 1,
-0.5710841, 0.7876286, -1.970508, 0.2078431, 1, 0, 1,
-0.5645947, 0.5921786, -0.7739059, 0.2, 1, 0, 1,
-0.5571349, -0.3541303, -1.86167, 0.1921569, 1, 0, 1,
-0.5560902, -1.949203, -3.14973, 0.1882353, 1, 0, 1,
-0.555694, -0.06842791, -0.709426, 0.1803922, 1, 0, 1,
-0.5517943, 0.06600943, -2.595595, 0.1764706, 1, 0, 1,
-0.5492923, 0.5646631, -1.046006, 0.1686275, 1, 0, 1,
-0.5440574, -0.2727512, -4.604007, 0.1647059, 1, 0, 1,
-0.5395848, -0.8440911, -3.140954, 0.1568628, 1, 0, 1,
-0.5374614, -0.2563635, -1.35822, 0.1529412, 1, 0, 1,
-0.5343027, 0.4983541, -0.4145901, 0.145098, 1, 0, 1,
-0.5291097, 0.234448, -0.6232834, 0.1411765, 1, 0, 1,
-0.5283611, -0.07741696, -2.168861, 0.1333333, 1, 0, 1,
-0.5237454, 1.276272, -0.3106429, 0.1294118, 1, 0, 1,
-0.520919, 0.01836214, -3.749195, 0.1215686, 1, 0, 1,
-0.5194577, -0.9027968, -3.424205, 0.1176471, 1, 0, 1,
-0.5191661, -0.009269959, -0.7502242, 0.1098039, 1, 0, 1,
-0.5167577, 2.279582, -1.094553, 0.1058824, 1, 0, 1,
-0.5151613, -1.089345, -2.997405, 0.09803922, 1, 0, 1,
-0.5138996, -0.3899229, 0.526399, 0.09019608, 1, 0, 1,
-0.5103039, 0.7733953, -0.9735243, 0.08627451, 1, 0, 1,
-0.5033042, -0.7639251, -4.147573, 0.07843138, 1, 0, 1,
-0.5019941, 2.427047, 0.1876371, 0.07450981, 1, 0, 1,
-0.5014102, 0.64294, -1.021562, 0.06666667, 1, 0, 1,
-0.4953842, 0.1379474, -1.061597, 0.0627451, 1, 0, 1,
-0.4947704, -0.2448321, -2.611575, 0.05490196, 1, 0, 1,
-0.4926333, -0.1843187, -3.565977, 0.05098039, 1, 0, 1,
-0.4920092, 2.35712, -0.1704896, 0.04313726, 1, 0, 1,
-0.4863185, 0.5662026, -0.248897, 0.03921569, 1, 0, 1,
-0.4857435, -1.770941, -4.61186, 0.03137255, 1, 0, 1,
-0.4848918, 0.2372519, 0.285623, 0.02745098, 1, 0, 1,
-0.4846429, -1.406831, -1.393076, 0.01960784, 1, 0, 1,
-0.4843199, 0.8627497, -0.584976, 0.01568628, 1, 0, 1,
-0.4807204, 0.9371703, -1.591645, 0.007843138, 1, 0, 1,
-0.4769849, 1.678398, -2.715513, 0.003921569, 1, 0, 1,
-0.4769201, 0.4348096, -2.827604, 0, 1, 0.003921569, 1,
-0.4746082, 0.6676455, -0.7200999, 0, 1, 0.01176471, 1,
-0.4678532, 0.9935966, -1.735869, 0, 1, 0.01568628, 1,
-0.4634102, -1.158244, -1.561355, 0, 1, 0.02352941, 1,
-0.4611204, 1.750059, -0.1334409, 0, 1, 0.02745098, 1,
-0.4579903, 0.8587157, -0.9882907, 0, 1, 0.03529412, 1,
-0.4562178, 0.031871, 0.6581762, 0, 1, 0.03921569, 1,
-0.4538244, -0.9564497, -4.47781, 0, 1, 0.04705882, 1,
-0.4497361, 1.007863, 0.05232731, 0, 1, 0.05098039, 1,
-0.4447538, 0.9690486, -1.77983, 0, 1, 0.05882353, 1,
-0.4413184, -0.4657032, -1.583288, 0, 1, 0.0627451, 1,
-0.4319366, 0.2941839, -0.5833949, 0, 1, 0.07058824, 1,
-0.4247103, 0.9547029, 0.6260961, 0, 1, 0.07450981, 1,
-0.4242553, -0.2458074, -1.565563, 0, 1, 0.08235294, 1,
-0.4239904, 0.6415721, 0.518286, 0, 1, 0.08627451, 1,
-0.4217879, -0.861024, -2.950133, 0, 1, 0.09411765, 1,
-0.4200907, 1.135259, -0.4836625, 0, 1, 0.1019608, 1,
-0.4064496, -0.2732535, -2.375307, 0, 1, 0.1058824, 1,
-0.4048665, -0.3400405, -1.566088, 0, 1, 0.1137255, 1,
-0.3995856, 0.6811665, 0.5919445, 0, 1, 0.1176471, 1,
-0.3979299, 0.305745, -0.6880732, 0, 1, 0.1254902, 1,
-0.3965549, -1.243253, -1.743493, 0, 1, 0.1294118, 1,
-0.3955188, 0.640228, -0.8749431, 0, 1, 0.1372549, 1,
-0.393317, -0.7789146, -2.931751, 0, 1, 0.1411765, 1,
-0.3920821, -0.5841498, -2.379659, 0, 1, 0.1490196, 1,
-0.3828777, 1.805105, 0.9271115, 0, 1, 0.1529412, 1,
-0.3822196, 1.058259, -1.683478, 0, 1, 0.1607843, 1,
-0.3820684, -0.2645273, -2.582994, 0, 1, 0.1647059, 1,
-0.376891, 2.250205, 0.5620883, 0, 1, 0.172549, 1,
-0.3747354, -0.9525267, -3.470276, 0, 1, 0.1764706, 1,
-0.3716595, 0.3173312, 0.8088858, 0, 1, 0.1843137, 1,
-0.3614262, -1.028001, -3.747373, 0, 1, 0.1882353, 1,
-0.360389, 0.5312923, -1.152449, 0, 1, 0.1960784, 1,
-0.359648, -1.431998, -1.923594, 0, 1, 0.2039216, 1,
-0.3547659, 2.035654, 0.3341122, 0, 1, 0.2078431, 1,
-0.3523109, 1.158742, 0.5344658, 0, 1, 0.2156863, 1,
-0.3482504, 0.8843172, 0.3467293, 0, 1, 0.2196078, 1,
-0.347533, 0.8063184, 0.2562793, 0, 1, 0.227451, 1,
-0.3449386, 0.361459, -0.9146903, 0, 1, 0.2313726, 1,
-0.3429993, 0.2072915, -3.128505, 0, 1, 0.2392157, 1,
-0.3418296, 0.1642408, -0.9573837, 0, 1, 0.2431373, 1,
-0.3404303, 0.2515634, -1.865155, 0, 1, 0.2509804, 1,
-0.3399947, -1.90424, -3.300804, 0, 1, 0.254902, 1,
-0.3395893, -0.1861535, -2.643075, 0, 1, 0.2627451, 1,
-0.336664, -0.901456, -3.401214, 0, 1, 0.2666667, 1,
-0.3361564, -0.4393207, -2.935818, 0, 1, 0.2745098, 1,
-0.3341361, 1.458867, 0.1433226, 0, 1, 0.2784314, 1,
-0.3306934, 1.677417, -0.3320841, 0, 1, 0.2862745, 1,
-0.3302059, 0.9068744, -1.043331, 0, 1, 0.2901961, 1,
-0.3295538, 0.857143, -0.855162, 0, 1, 0.2980392, 1,
-0.3209886, -2.092393, -3.164784, 0, 1, 0.3058824, 1,
-0.3194359, 0.9547992, -0.7317035, 0, 1, 0.3098039, 1,
-0.3156, -0.409769, -2.898701, 0, 1, 0.3176471, 1,
-0.3100449, 0.2670091, -4.787879, 0, 1, 0.3215686, 1,
-0.3094391, 0.3576005, 0.7602739, 0, 1, 0.3294118, 1,
-0.3065264, -0.1683264, -0.6715452, 0, 1, 0.3333333, 1,
-0.3039084, -1.204643, -2.781502, 0, 1, 0.3411765, 1,
-0.2988814, 1.033894, -1.538051, 0, 1, 0.345098, 1,
-0.2986352, 0.8824481, -1.064183, 0, 1, 0.3529412, 1,
-0.2972158, 0.0802938, -1.946361, 0, 1, 0.3568628, 1,
-0.2947712, 0.219493, -1.147906, 0, 1, 0.3647059, 1,
-0.2924026, 0.1935188, -1.157257, 0, 1, 0.3686275, 1,
-0.2901314, 1.526358, 0.5878193, 0, 1, 0.3764706, 1,
-0.288821, 1.62989, -0.5898321, 0, 1, 0.3803922, 1,
-0.2825652, -0.9260367, -4.662069, 0, 1, 0.3882353, 1,
-0.2823025, 1.243048, -0.3642474, 0, 1, 0.3921569, 1,
-0.2788405, 0.1418012, -0.2258654, 0, 1, 0.4, 1,
-0.2764, 0.3058413, -0.3040175, 0, 1, 0.4078431, 1,
-0.275594, -0.01259881, -1.602276, 0, 1, 0.4117647, 1,
-0.2747639, -0.457828, -2.49915, 0, 1, 0.4196078, 1,
-0.2709347, -1.493207, -3.063037, 0, 1, 0.4235294, 1,
-0.2706646, 1.522949, 0.507507, 0, 1, 0.4313726, 1,
-0.2687317, 1.010006, -0.2354281, 0, 1, 0.4352941, 1,
-0.2649388, 1.832667, 0.7316482, 0, 1, 0.4431373, 1,
-0.2645707, 0.9485259, -0.6222941, 0, 1, 0.4470588, 1,
-0.2624926, -1.522685, -0.7643396, 0, 1, 0.454902, 1,
-0.2543577, 0.6140599, -0.6336396, 0, 1, 0.4588235, 1,
-0.2540415, -0.1659176, -1.733122, 0, 1, 0.4666667, 1,
-0.2529247, -0.9073289, -0.5154655, 0, 1, 0.4705882, 1,
-0.2522134, -2.068331, -2.071074, 0, 1, 0.4784314, 1,
-0.2498637, -1.681234, -3.209533, 0, 1, 0.4823529, 1,
-0.2491841, -0.8202517, -3.371537, 0, 1, 0.4901961, 1,
-0.2410334, -0.2345908, -3.858472, 0, 1, 0.4941176, 1,
-0.2362348, 1.807514, 1.950336, 0, 1, 0.5019608, 1,
-0.2339691, 1.140743, -0.9234452, 0, 1, 0.509804, 1,
-0.2323135, -0.2149098, -2.451835, 0, 1, 0.5137255, 1,
-0.2283234, -0.02406709, -3.369314, 0, 1, 0.5215687, 1,
-0.2211505, 0.1784257, -1.1696, 0, 1, 0.5254902, 1,
-0.2170372, 0.8707113, -0.8578094, 0, 1, 0.5333334, 1,
-0.2135013, -0.857419, -3.341834, 0, 1, 0.5372549, 1,
-0.2019013, -0.8641452, -2.299699, 0, 1, 0.5450981, 1,
-0.2018737, 0.2788567, -1.432517, 0, 1, 0.5490196, 1,
-0.2009812, -1.868741, -2.851827, 0, 1, 0.5568628, 1,
-0.2006954, -1.611935, -3.131779, 0, 1, 0.5607843, 1,
-0.1983088, -0.08390845, -2.44649, 0, 1, 0.5686275, 1,
-0.1968879, 1.046523, -0.5965213, 0, 1, 0.572549, 1,
-0.1960337, 0.2232286, -0.6845881, 0, 1, 0.5803922, 1,
-0.1948869, -1.212224, -3.655062, 0, 1, 0.5843138, 1,
-0.193797, 0.6530545, 0.636575, 0, 1, 0.5921569, 1,
-0.191657, -0.2814387, -0.2892922, 0, 1, 0.5960785, 1,
-0.1897245, 0.1181823, -0.4709092, 0, 1, 0.6039216, 1,
-0.1894414, 0.1365376, -2.216939, 0, 1, 0.6117647, 1,
-0.1865599, -1.483504, -1.642982, 0, 1, 0.6156863, 1,
-0.1826231, -0.3540255, -3.272, 0, 1, 0.6235294, 1,
-0.1823542, -0.4101056, -1.976777, 0, 1, 0.627451, 1,
-0.1818572, 0.2245305, -0.1704849, 0, 1, 0.6352941, 1,
-0.1784906, -0.949111, -2.920672, 0, 1, 0.6392157, 1,
-0.1783699, -0.2559187, -0.8235498, 0, 1, 0.6470588, 1,
-0.1773296, -0.2474355, -4.432305, 0, 1, 0.6509804, 1,
-0.1752788, -0.1545664, -4.387304, 0, 1, 0.6588235, 1,
-0.174472, 1.292091, 1.019065, 0, 1, 0.6627451, 1,
-0.1723643, -0.7242433, -2.503687, 0, 1, 0.6705883, 1,
-0.1614952, 1.195578, -0.5204386, 0, 1, 0.6745098, 1,
-0.1612681, 1.530052, -1.684805, 0, 1, 0.682353, 1,
-0.1608336, 1.558006, 1.236106, 0, 1, 0.6862745, 1,
-0.1607381, 0.05361277, -3.00591, 0, 1, 0.6941177, 1,
-0.159695, 0.5673705, -0.438075, 0, 1, 0.7019608, 1,
-0.1557032, 0.8255137, 1.103501, 0, 1, 0.7058824, 1,
-0.1463329, 1.125978, -0.4314, 0, 1, 0.7137255, 1,
-0.1446849, -1.268566, -3.532202, 0, 1, 0.7176471, 1,
-0.1445581, 0.1734672, 0.8725516, 0, 1, 0.7254902, 1,
-0.1399762, -0.4428638, -3.762631, 0, 1, 0.7294118, 1,
-0.1365169, -0.3747944, -1.980746, 0, 1, 0.7372549, 1,
-0.1352168, -1.320786, -3.902729, 0, 1, 0.7411765, 1,
-0.1347415, -1.580052, -3.007324, 0, 1, 0.7490196, 1,
-0.1332616, 0.9148867, -1.118189, 0, 1, 0.7529412, 1,
-0.1322499, 0.18523, -1.065682, 0, 1, 0.7607843, 1,
-0.1266778, 0.4100316, -0.2017378, 0, 1, 0.7647059, 1,
-0.1254873, 1.247294, -1.057516, 0, 1, 0.772549, 1,
-0.1251446, 0.5875796, 1.64197, 0, 1, 0.7764706, 1,
-0.1204257, -0.3191706, -2.556346, 0, 1, 0.7843137, 1,
-0.1176791, 0.4966543, -1.679296, 0, 1, 0.7882353, 1,
-0.1161854, -2.868448, -2.237174, 0, 1, 0.7960784, 1,
-0.115729, 2.510149, -0.2105725, 0, 1, 0.8039216, 1,
-0.1155818, -0.623568, -1.032956, 0, 1, 0.8078431, 1,
-0.1143892, -0.2633473, -4.106545, 0, 1, 0.8156863, 1,
-0.1143846, 1.294607, 1.744707, 0, 1, 0.8196079, 1,
-0.1054535, -0.7629908, -1.62531, 0, 1, 0.827451, 1,
-0.1041626, 0.3657225, -0.2836344, 0, 1, 0.8313726, 1,
-0.09716009, 0.322111, 0.1138451, 0, 1, 0.8392157, 1,
-0.09586442, 0.2446427, -0.9580127, 0, 1, 0.8431373, 1,
-0.09537892, -0.5481928, -2.601424, 0, 1, 0.8509804, 1,
-0.09389099, 0.4475107, -1.23367, 0, 1, 0.854902, 1,
-0.09176017, -0.6427857, -1.971393, 0, 1, 0.8627451, 1,
-0.08153039, 1.204818, 0.2757252, 0, 1, 0.8666667, 1,
-0.08137763, -1.370044, -4.535064, 0, 1, 0.8745098, 1,
-0.08134751, -0.2803311, -4.828188, 0, 1, 0.8784314, 1,
-0.08090384, 1.774468, 0.1426285, 0, 1, 0.8862745, 1,
-0.07526781, -0.3327774, -3.445988, 0, 1, 0.8901961, 1,
-0.07008626, 0.3671667, -0.9583868, 0, 1, 0.8980392, 1,
-0.06412853, 0.4291427, 0.1555889, 0, 1, 0.9058824, 1,
-0.06351645, -0.1447147, -2.565185, 0, 1, 0.9098039, 1,
-0.06152933, -1.576365, -3.391567, 0, 1, 0.9176471, 1,
-0.06066849, 0.675635, 1.742478, 0, 1, 0.9215686, 1,
-0.05296955, 0.1664714, -0.3775324, 0, 1, 0.9294118, 1,
-0.05169673, -0.1044877, -2.594626, 0, 1, 0.9333333, 1,
-0.05061748, 0.5470909, -1.184942, 0, 1, 0.9411765, 1,
-0.04648915, -0.5905986, -1.961784, 0, 1, 0.945098, 1,
-0.04280337, 0.1527183, -0.4502966, 0, 1, 0.9529412, 1,
-0.04223885, 0.6073011, 0.4168761, 0, 1, 0.9568627, 1,
-0.04203666, 1.501243, 0.3018523, 0, 1, 0.9647059, 1,
-0.03740273, -0.5234618, -2.903449, 0, 1, 0.9686275, 1,
-0.03159044, -0.4290439, -2.491427, 0, 1, 0.9764706, 1,
-0.03030235, 2.359329, -0.217595, 0, 1, 0.9803922, 1,
-0.02962924, 0.693136, -1.424448, 0, 1, 0.9882353, 1,
-0.02759865, -1.072719, -1.021836, 0, 1, 0.9921569, 1,
-0.02669178, 0.1006516, 0.5721394, 0, 1, 1, 1,
-0.02389009, 1.350797, 0.5892448, 0, 0.9921569, 1, 1,
-0.02381967, 0.591938, 1.111603, 0, 0.9882353, 1, 1,
-0.02322475, 0.8173125, -0.8565393, 0, 0.9803922, 1, 1,
-0.02033749, -1.261759, -1.191477, 0, 0.9764706, 1, 1,
-0.01652093, -0.4250664, -3.685982, 0, 0.9686275, 1, 1,
-0.01374212, 0.05951158, 0.5885176, 0, 0.9647059, 1, 1,
-0.005874674, 0.408174, 1.568506, 0, 0.9568627, 1, 1,
-0.003002473, -0.04769954, -1.644335, 0, 0.9529412, 1, 1,
0.008212556, 2.433574, -1.315709, 0, 0.945098, 1, 1,
0.008872404, -1.86757, 4.481545, 0, 0.9411765, 1, 1,
0.00960642, -1.120433, 1.959321, 0, 0.9333333, 1, 1,
0.01010047, -0.158254, 2.243873, 0, 0.9294118, 1, 1,
0.01386915, 0.2773, 0.683709, 0, 0.9215686, 1, 1,
0.0169451, 0.6974897, -1.459554, 0, 0.9176471, 1, 1,
0.0188273, -0.884865, 4.434091, 0, 0.9098039, 1, 1,
0.02034199, 0.9211819, -1.303684, 0, 0.9058824, 1, 1,
0.02047168, 1.453512, -0.5337546, 0, 0.8980392, 1, 1,
0.02320456, -2.022392, 3.525464, 0, 0.8901961, 1, 1,
0.0233575, 1.313761, -0.2912737, 0, 0.8862745, 1, 1,
0.02553794, 0.400409, 1.656677, 0, 0.8784314, 1, 1,
0.0256722, 1.892702, -0.446564, 0, 0.8745098, 1, 1,
0.02577297, 1.85261, -1.192757, 0, 0.8666667, 1, 1,
0.02653964, -0.03613266, 2.124825, 0, 0.8627451, 1, 1,
0.02704824, 2.447743, 0.772406, 0, 0.854902, 1, 1,
0.02764695, -0.6203243, 3.538664, 0, 0.8509804, 1, 1,
0.0281323, -0.06076769, 4.156273, 0, 0.8431373, 1, 1,
0.03203707, 1.089226, -0.7760445, 0, 0.8392157, 1, 1,
0.03477365, 0.9600852, -1.169856, 0, 0.8313726, 1, 1,
0.03538058, -0.9837236, 3.819289, 0, 0.827451, 1, 1,
0.03647083, 1.376149, 0.07161487, 0, 0.8196079, 1, 1,
0.03958203, 0.04338383, -0.9332203, 0, 0.8156863, 1, 1,
0.04323854, 1.866397, -0.1225194, 0, 0.8078431, 1, 1,
0.04355463, -0.8019971, 2.134015, 0, 0.8039216, 1, 1,
0.0459046, -0.01618836, 2.577389, 0, 0.7960784, 1, 1,
0.04765788, 0.66991, -0.5024465, 0, 0.7882353, 1, 1,
0.04773573, -0.5084005, 2.436437, 0, 0.7843137, 1, 1,
0.05271421, -0.7983391, 4.46889, 0, 0.7764706, 1, 1,
0.05360775, -1.165519, 1.83558, 0, 0.772549, 1, 1,
0.05517923, -1.504264, 3.046114, 0, 0.7647059, 1, 1,
0.05753082, -0.2720221, 4.343514, 0, 0.7607843, 1, 1,
0.05851019, -0.189864, 2.941585, 0, 0.7529412, 1, 1,
0.0593868, -1.626244, 1.961822, 0, 0.7490196, 1, 1,
0.06257483, 0.6365874, 1.846632, 0, 0.7411765, 1, 1,
0.06333211, -0.6134052, 3.775823, 0, 0.7372549, 1, 1,
0.06812911, -0.838081, 3.801798, 0, 0.7294118, 1, 1,
0.07135249, 0.6594883, 1.942516, 0, 0.7254902, 1, 1,
0.07530278, -0.7328762, 3.651714, 0, 0.7176471, 1, 1,
0.07711502, 1.180766, 1.155448, 0, 0.7137255, 1, 1,
0.07764767, -2.688339, 3.636701, 0, 0.7058824, 1, 1,
0.07910687, -0.1698977, 2.849901, 0, 0.6980392, 1, 1,
0.08318569, 0.6131361, 0.7157992, 0, 0.6941177, 1, 1,
0.086782, -0.7014393, 2.137687, 0, 0.6862745, 1, 1,
0.08889695, 2.070104, 0.4396303, 0, 0.682353, 1, 1,
0.09799252, -0.632036, 2.950001, 0, 0.6745098, 1, 1,
0.1049183, 0.6750157, 0.1614557, 0, 0.6705883, 1, 1,
0.1077009, -0.2356211, 2.725692, 0, 0.6627451, 1, 1,
0.1083885, 0.3962712, 0.4541755, 0, 0.6588235, 1, 1,
0.1273112, -0.4714943, 2.527113, 0, 0.6509804, 1, 1,
0.1333253, 0.1099137, 0.08686038, 0, 0.6470588, 1, 1,
0.1334619, 1.661152, -0.8517302, 0, 0.6392157, 1, 1,
0.1355898, 0.1534, -0.07646748, 0, 0.6352941, 1, 1,
0.1365626, -1.248129, 3.8716, 0, 0.627451, 1, 1,
0.1468254, 1.052899, -0.6317075, 0, 0.6235294, 1, 1,
0.1468897, 0.1122913, 1.802485, 0, 0.6156863, 1, 1,
0.1481854, 0.3631892, 0.7545152, 0, 0.6117647, 1, 1,
0.1490658, 1.694109, -0.6348178, 0, 0.6039216, 1, 1,
0.1499161, -1.184654, 1.868529, 0, 0.5960785, 1, 1,
0.150665, -0.8083786, 3.149797, 0, 0.5921569, 1, 1,
0.1544354, -1.267513, 3.440483, 0, 0.5843138, 1, 1,
0.1559347, -2.048903, 0.9491997, 0, 0.5803922, 1, 1,
0.1623765, -1.221319, 2.315457, 0, 0.572549, 1, 1,
0.1645252, -0.2335311, -0.4399448, 0, 0.5686275, 1, 1,
0.1664428, 1.8388, -1.17525, 0, 0.5607843, 1, 1,
0.1720617, 1.281139, 1.105266, 0, 0.5568628, 1, 1,
0.1749948, -0.3516509, 3.194985, 0, 0.5490196, 1, 1,
0.1771794, 0.9758869, -0.6936383, 0, 0.5450981, 1, 1,
0.1790264, 0.2020669, -1.498747, 0, 0.5372549, 1, 1,
0.1810499, -0.2463959, 1.140972, 0, 0.5333334, 1, 1,
0.1853783, 1.353461, 0.2838038, 0, 0.5254902, 1, 1,
0.1879186, -0.1654001, 3.160393, 0, 0.5215687, 1, 1,
0.1901723, -0.8395016, 3.3628, 0, 0.5137255, 1, 1,
0.1920817, -0.292697, 1.697297, 0, 0.509804, 1, 1,
0.1960264, -0.5150955, 0.8312755, 0, 0.5019608, 1, 1,
0.1972601, 0.1497644, 0.5171083, 0, 0.4941176, 1, 1,
0.198583, -1.495967, 3.282006, 0, 0.4901961, 1, 1,
0.2105748, -1.505805, 4.465182, 0, 0.4823529, 1, 1,
0.2116555, 0.378396, -1.247134, 0, 0.4784314, 1, 1,
0.2142564, 0.04808276, 0.8329292, 0, 0.4705882, 1, 1,
0.2143461, 0.3000088, 1.545297, 0, 0.4666667, 1, 1,
0.2180124, 0.5649821, -0.8068404, 0, 0.4588235, 1, 1,
0.2180659, 0.8278688, -1.537359, 0, 0.454902, 1, 1,
0.2223811, -0.6393497, 3.516743, 0, 0.4470588, 1, 1,
0.226373, 1.607611, -0.4866651, 0, 0.4431373, 1, 1,
0.2303358, 1.523126, -0.4980145, 0, 0.4352941, 1, 1,
0.2303661, 1.006886, 0.4267693, 0, 0.4313726, 1, 1,
0.2312268, 0.2303083, 1.837749, 0, 0.4235294, 1, 1,
0.2335052, 1.365677, 0.8598554, 0, 0.4196078, 1, 1,
0.2342108, -0.4359638, 3.182621, 0, 0.4117647, 1, 1,
0.2397814, 1.538393, 0.06716316, 0, 0.4078431, 1, 1,
0.2424503, 0.07768664, 4.487985, 0, 0.4, 1, 1,
0.2512756, 0.1362234, 0.9418972, 0, 0.3921569, 1, 1,
0.2522064, -1.895862, 3.095667, 0, 0.3882353, 1, 1,
0.2525464, 0.03623876, 0.6974847, 0, 0.3803922, 1, 1,
0.2534978, -0.1279729, 0.9409249, 0, 0.3764706, 1, 1,
0.2577677, -1.500621, 1.136063, 0, 0.3686275, 1, 1,
0.2587689, 0.4787407, 1.251589, 0, 0.3647059, 1, 1,
0.2591, -0.1121674, 1.096787, 0, 0.3568628, 1, 1,
0.2596676, -0.551443, 3.333486, 0, 0.3529412, 1, 1,
0.2614034, 0.09035375, 1.864932, 0, 0.345098, 1, 1,
0.2640952, -2.41302, 2.304013, 0, 0.3411765, 1, 1,
0.2642038, 0.1328179, 1.278606, 0, 0.3333333, 1, 1,
0.2660704, -1.367709, 1.161092, 0, 0.3294118, 1, 1,
0.2701472, -0.1633488, 1.909412, 0, 0.3215686, 1, 1,
0.2714708, 0.5068802, 0.7638865, 0, 0.3176471, 1, 1,
0.2768243, -0.854391, 4.267206, 0, 0.3098039, 1, 1,
0.277768, 0.7732821, -1.132695, 0, 0.3058824, 1, 1,
0.2818728, -1.768922, 2.843038, 0, 0.2980392, 1, 1,
0.2821062, -0.1283143, 2.202677, 0, 0.2901961, 1, 1,
0.2889397, -1.496848, 2.359958, 0, 0.2862745, 1, 1,
0.2925617, -1.327463, 4.832281, 0, 0.2784314, 1, 1,
0.2929289, 0.5029087, 1.182055, 0, 0.2745098, 1, 1,
0.2961447, -2.32131, 3.803885, 0, 0.2666667, 1, 1,
0.3013955, -0.1327883, 0.510923, 0, 0.2627451, 1, 1,
0.3087981, -0.8990844, 1.091737, 0, 0.254902, 1, 1,
0.3096757, -0.2776811, 1.07172, 0, 0.2509804, 1, 1,
0.3122961, 0.1456718, 1.210178, 0, 0.2431373, 1, 1,
0.3133935, 0.8536233, 2.029138, 0, 0.2392157, 1, 1,
0.3138106, 1.94956, 1.679679, 0, 0.2313726, 1, 1,
0.3200457, 1.432433, -0.1838247, 0, 0.227451, 1, 1,
0.3218654, -0.3507137, 2.444335, 0, 0.2196078, 1, 1,
0.324781, 2.104497, 0.07206665, 0, 0.2156863, 1, 1,
0.3294356, 1.83703, 0.3169789, 0, 0.2078431, 1, 1,
0.3327525, -0.651572, 3.84144, 0, 0.2039216, 1, 1,
0.3336137, 0.8138877, 2.483565, 0, 0.1960784, 1, 1,
0.3353813, 0.5451109, -0.06254869, 0, 0.1882353, 1, 1,
0.3400466, -0.03950517, 1.51574, 0, 0.1843137, 1, 1,
0.343036, 0.6639012, 2.613117, 0, 0.1764706, 1, 1,
0.3440489, 0.8381349, -0.4548618, 0, 0.172549, 1, 1,
0.3485041, -0.8491711, 2.702811, 0, 0.1647059, 1, 1,
0.3507639, -0.4725738, 3.518838, 0, 0.1607843, 1, 1,
0.350989, 0.6441696, -1.609972, 0, 0.1529412, 1, 1,
0.3531668, -1.579248, 2.329251, 0, 0.1490196, 1, 1,
0.3548939, 1.18862, -0.2415971, 0, 0.1411765, 1, 1,
0.3550642, 1.116261, -0.1476572, 0, 0.1372549, 1, 1,
0.3552847, 0.7021625, -0.395749, 0, 0.1294118, 1, 1,
0.3569623, 1.056512, 0.8080165, 0, 0.1254902, 1, 1,
0.3572289, 0.3829167, 0.1228602, 0, 0.1176471, 1, 1,
0.3580919, -0.8667122, 3.584622, 0, 0.1137255, 1, 1,
0.3593107, -0.2511482, 1.911095, 0, 0.1058824, 1, 1,
0.3656242, 0.5194147, 1.452778, 0, 0.09803922, 1, 1,
0.3706847, -0.4441153, 2.899929, 0, 0.09411765, 1, 1,
0.3794944, 0.2124481, 1.106126, 0, 0.08627451, 1, 1,
0.3909511, -0.4941404, 3.385727, 0, 0.08235294, 1, 1,
0.3922331, 1.856913, 0.8228043, 0, 0.07450981, 1, 1,
0.3926696, -0.45529, 1.74511, 0, 0.07058824, 1, 1,
0.3968959, 2.459561, 0.6008593, 0, 0.0627451, 1, 1,
0.3990718, -0.7833657, 3.518108, 0, 0.05882353, 1, 1,
0.4005069, -0.03778929, 1.817307, 0, 0.05098039, 1, 1,
0.4028828, -1.718102, 1.921898, 0, 0.04705882, 1, 1,
0.4051618, 1.763163, 1.15, 0, 0.03921569, 1, 1,
0.4071814, -0.5045586, 1.686708, 0, 0.03529412, 1, 1,
0.4087414, 2.204965, 0.712231, 0, 0.02745098, 1, 1,
0.409158, -0.05474672, 1.889872, 0, 0.02352941, 1, 1,
0.4102607, -1.07569, 1.702015, 0, 0.01568628, 1, 1,
0.4205377, 0.1356863, 0.0861023, 0, 0.01176471, 1, 1,
0.4227673, -0.563867, 1.973549, 0, 0.003921569, 1, 1,
0.4243156, -0.3567096, 1.622713, 0.003921569, 0, 1, 1,
0.4268326, 0.2496002, 1.630293, 0.007843138, 0, 1, 1,
0.427532, -1.740404, 2.09549, 0.01568628, 0, 1, 1,
0.4286219, -0.7498201, 1.806364, 0.01960784, 0, 1, 1,
0.4293436, -0.9681743, 2.846316, 0.02745098, 0, 1, 1,
0.4311286, -0.1352068, 2.348989, 0.03137255, 0, 1, 1,
0.4315071, 0.8297384, 1.320326, 0.03921569, 0, 1, 1,
0.4433784, -0.2409597, 1.909458, 0.04313726, 0, 1, 1,
0.4435531, 0.008032124, 2.833009, 0.05098039, 0, 1, 1,
0.447435, 0.39284, 0.7738374, 0.05490196, 0, 1, 1,
0.4513736, 1.174481, 0.6700971, 0.0627451, 0, 1, 1,
0.4516634, 1.336953, 0.8531902, 0.06666667, 0, 1, 1,
0.4548689, -0.3921322, 2.057426, 0.07450981, 0, 1, 1,
0.4549085, -0.1452758, 0.7464305, 0.07843138, 0, 1, 1,
0.467084, -0.1114171, 2.527124, 0.08627451, 0, 1, 1,
0.4672115, -0.06893496, 1.29604, 0.09019608, 0, 1, 1,
0.4679553, -0.4230401, 2.882085, 0.09803922, 0, 1, 1,
0.4693414, 0.364154, 0.9449555, 0.1058824, 0, 1, 1,
0.4707757, 1.400934, -0.4639782, 0.1098039, 0, 1, 1,
0.4801447, -0.7268946, 2.192078, 0.1176471, 0, 1, 1,
0.4813209, 0.4942378, 1.545495, 0.1215686, 0, 1, 1,
0.4834894, 0.49143, 1.074961, 0.1294118, 0, 1, 1,
0.4955506, 0.2980044, 1.825243, 0.1333333, 0, 1, 1,
0.4956037, 1.089586, 1.117238, 0.1411765, 0, 1, 1,
0.4987777, 1.116567, 0.5893897, 0.145098, 0, 1, 1,
0.500893, -0.5042098, 2.940907, 0.1529412, 0, 1, 1,
0.5026831, 0.5194578, 1.191937, 0.1568628, 0, 1, 1,
0.5040349, -0.6285263, 0.4736284, 0.1647059, 0, 1, 1,
0.5070483, -0.06166, 1.750242, 0.1686275, 0, 1, 1,
0.5089543, -1.647017, 3.13413, 0.1764706, 0, 1, 1,
0.5096672, -0.6296647, 3.365138, 0.1803922, 0, 1, 1,
0.5139748, 1.055295, -0.292097, 0.1882353, 0, 1, 1,
0.5163227, -0.3168818, 2.619204, 0.1921569, 0, 1, 1,
0.5194682, -0.3644814, 2.636715, 0.2, 0, 1, 1,
0.5201674, 0.002199648, 1.283725, 0.2078431, 0, 1, 1,
0.5208057, -0.6214686, 3.161726, 0.2117647, 0, 1, 1,
0.5213906, -2.063595, 2.590398, 0.2196078, 0, 1, 1,
0.5237056, -0.4825146, 3.534966, 0.2235294, 0, 1, 1,
0.529198, 1.116289, 0.3898485, 0.2313726, 0, 1, 1,
0.5293319, 0.4403832, 1.690375, 0.2352941, 0, 1, 1,
0.5370181, 0.7945023, 0.339626, 0.2431373, 0, 1, 1,
0.5421885, 1.208591, 1.59259, 0.2470588, 0, 1, 1,
0.5465717, 0.1900197, 1.713924, 0.254902, 0, 1, 1,
0.5476147, -1.57157, 3.270035, 0.2588235, 0, 1, 1,
0.5505672, -0.7705615, 1.449684, 0.2666667, 0, 1, 1,
0.5511057, -0.5196239, 1.157513, 0.2705882, 0, 1, 1,
0.5592988, 2.048036, -1.16077, 0.2784314, 0, 1, 1,
0.5613264, -0.1099066, 0.6524313, 0.282353, 0, 1, 1,
0.5640578, -2.390085, 3.575295, 0.2901961, 0, 1, 1,
0.5643263, -0.2646852, 2.460477, 0.2941177, 0, 1, 1,
0.5652434, -0.4312745, 1.36505, 0.3019608, 0, 1, 1,
0.5666544, -1.422766, 3.160354, 0.3098039, 0, 1, 1,
0.5723199, 0.4051585, 1.921328, 0.3137255, 0, 1, 1,
0.5828965, 0.06844796, 2.17078, 0.3215686, 0, 1, 1,
0.5928263, -0.1242232, 0.7173054, 0.3254902, 0, 1, 1,
0.5989538, -0.3075696, 3.216213, 0.3333333, 0, 1, 1,
0.6000845, 1.577417, 0.3959562, 0.3372549, 0, 1, 1,
0.6007814, 1.649361, -0.004177957, 0.345098, 0, 1, 1,
0.6052825, 0.522698, -0.4068764, 0.3490196, 0, 1, 1,
0.6054883, -0.1803361, -0.9330859, 0.3568628, 0, 1, 1,
0.6071824, -1.230661, 2.261694, 0.3607843, 0, 1, 1,
0.6075996, 0.5030494, 0.7975886, 0.3686275, 0, 1, 1,
0.6083661, -0.02336158, 3.548394, 0.372549, 0, 1, 1,
0.6105615, 0.4794653, 0.2299514, 0.3803922, 0, 1, 1,
0.6137183, -2.036952, 2.752712, 0.3843137, 0, 1, 1,
0.6174668, 0.6730201, 0.6873168, 0.3921569, 0, 1, 1,
0.6178225, -0.9806405, 3.104386, 0.3960784, 0, 1, 1,
0.6188754, 1.05608, 1.291655, 0.4039216, 0, 1, 1,
0.6201251, 1.180678, -1.157068, 0.4117647, 0, 1, 1,
0.622898, -0.2405488, 1.265686, 0.4156863, 0, 1, 1,
0.6290032, -0.2774822, 0.7567933, 0.4235294, 0, 1, 1,
0.6300973, 2.039945, -2.027676, 0.427451, 0, 1, 1,
0.6380715, 0.7292767, 2.030699, 0.4352941, 0, 1, 1,
0.6395256, -0.565901, 2.045321, 0.4392157, 0, 1, 1,
0.6408117, -0.3613053, 2.21967, 0.4470588, 0, 1, 1,
0.6427857, 0.5333478, 1.647888, 0.4509804, 0, 1, 1,
0.6467255, 0.6104139, -0.2378185, 0.4588235, 0, 1, 1,
0.6510717, -0.7205475, 4.547392, 0.4627451, 0, 1, 1,
0.6540326, 0.6008106, 0.6146049, 0.4705882, 0, 1, 1,
0.6596014, -0.5330312, 2.539084, 0.4745098, 0, 1, 1,
0.6631491, 0.9630581, 0.9813096, 0.4823529, 0, 1, 1,
0.6631701, -1.494729, 3.687622, 0.4862745, 0, 1, 1,
0.6668637, 1.859702, 2.089564, 0.4941176, 0, 1, 1,
0.6678848, -1.175863, 1.332955, 0.5019608, 0, 1, 1,
0.6698716, -0.6834695, 2.581164, 0.5058824, 0, 1, 1,
0.669919, -2.321365, 3.454399, 0.5137255, 0, 1, 1,
0.6721165, 1.403323, -0.6698977, 0.5176471, 0, 1, 1,
0.6730753, 0.5399861, 0.6469362, 0.5254902, 0, 1, 1,
0.6805662, 0.4193148, 1.45853, 0.5294118, 0, 1, 1,
0.6813036, -1.088328, 2.433018, 0.5372549, 0, 1, 1,
0.6919731, 0.06063948, 2.338045, 0.5411765, 0, 1, 1,
0.6951317, -1.63414, 1.731991, 0.5490196, 0, 1, 1,
0.7099991, -1.252359, 1.829312, 0.5529412, 0, 1, 1,
0.7101846, -0.5786922, 1.894993, 0.5607843, 0, 1, 1,
0.712897, -0.5321848, 2.04739, 0.5647059, 0, 1, 1,
0.7178835, 1.194412, -0.3041039, 0.572549, 0, 1, 1,
0.7197559, 0.4332648, 0.3885116, 0.5764706, 0, 1, 1,
0.7223527, 0.3902802, 1.143945, 0.5843138, 0, 1, 1,
0.7252858, -0.5703827, 1.004794, 0.5882353, 0, 1, 1,
0.7269134, 0.6483213, -0.6918566, 0.5960785, 0, 1, 1,
0.730174, 0.1827032, 1.632467, 0.6039216, 0, 1, 1,
0.7354034, 1.069553, 0.4921102, 0.6078432, 0, 1, 1,
0.7414143, -0.71483, 1.276747, 0.6156863, 0, 1, 1,
0.7495557, 0.9408132, -1.572255, 0.6196079, 0, 1, 1,
0.7502994, -1.729227, 2.497632, 0.627451, 0, 1, 1,
0.7549372, 0.4614204, 1.358248, 0.6313726, 0, 1, 1,
0.7658734, -0.6645423, 1.836357, 0.6392157, 0, 1, 1,
0.7718803, 2.063943, 1.234049, 0.6431373, 0, 1, 1,
0.7741351, 1.007487, 0.3374893, 0.6509804, 0, 1, 1,
0.7824945, -1.568468, 1.387625, 0.654902, 0, 1, 1,
0.7827682, -0.5776085, 3.239733, 0.6627451, 0, 1, 1,
0.7852519, 0.6865425, -2.26146, 0.6666667, 0, 1, 1,
0.7877166, 0.7368584, -0.7232758, 0.6745098, 0, 1, 1,
0.7914223, 0.6969326, 2.141071, 0.6784314, 0, 1, 1,
0.7915664, 1.894347, 1.352495, 0.6862745, 0, 1, 1,
0.7930005, -0.4899673, 4.699277, 0.6901961, 0, 1, 1,
0.7955396, -0.02728738, 2.641188, 0.6980392, 0, 1, 1,
0.805277, -0.2049359, 1.604041, 0.7058824, 0, 1, 1,
0.8065519, 0.1604503, 1.586819, 0.7098039, 0, 1, 1,
0.8098369, 0.05641608, 0.8907756, 0.7176471, 0, 1, 1,
0.8133306, -1.483855, 3.262311, 0.7215686, 0, 1, 1,
0.8135965, 0.8736455, 0.9031302, 0.7294118, 0, 1, 1,
0.8158268, 0.9282097, 0.9688865, 0.7333333, 0, 1, 1,
0.8179442, 2.717901, -0.8029371, 0.7411765, 0, 1, 1,
0.8293698, 1.563189, 0.9976048, 0.7450981, 0, 1, 1,
0.8387144, -1.898511, 3.062448, 0.7529412, 0, 1, 1,
0.8417549, -0.8045746, 1.011139, 0.7568628, 0, 1, 1,
0.8469566, 0.3028309, 0.8570363, 0.7647059, 0, 1, 1,
0.8483475, -0.211491, 2.802424, 0.7686275, 0, 1, 1,
0.8510983, -0.6114931, 2.498813, 0.7764706, 0, 1, 1,
0.8545216, 1.826843, -0.02631108, 0.7803922, 0, 1, 1,
0.8574435, 0.4406842, 0.3396556, 0.7882353, 0, 1, 1,
0.858999, 0.3182963, 1.725177, 0.7921569, 0, 1, 1,
0.8642088, -0.8956248, 3.282161, 0.8, 0, 1, 1,
0.8733609, 0.6505958, 0.2116273, 0.8078431, 0, 1, 1,
0.8777466, 0.1888678, -0.03770357, 0.8117647, 0, 1, 1,
0.8796795, -0.7963234, 2.634267, 0.8196079, 0, 1, 1,
0.8804845, -0.7049862, 2.18394, 0.8235294, 0, 1, 1,
0.8878323, 0.4187648, 1.82186, 0.8313726, 0, 1, 1,
0.8888109, -1.382535, 2.961524, 0.8352941, 0, 1, 1,
0.8893304, -0.5110282, 3.562133, 0.8431373, 0, 1, 1,
0.8904023, 1.05385, 0.07644393, 0.8470588, 0, 1, 1,
0.8947572, 2.957012, 0.00915515, 0.854902, 0, 1, 1,
0.898425, 0.3995853, 1.237344, 0.8588235, 0, 1, 1,
0.9038066, -2.019827, 1.319243, 0.8666667, 0, 1, 1,
0.91147, 0.4042215, 0.967811, 0.8705882, 0, 1, 1,
0.9121813, 0.303778, 0.9645915, 0.8784314, 0, 1, 1,
0.9211952, -0.8641704, 1.106448, 0.8823529, 0, 1, 1,
0.9219682, 0.320585, -0.2163076, 0.8901961, 0, 1, 1,
0.9241331, 0.3033038, 2.351825, 0.8941177, 0, 1, 1,
0.9248794, 0.2805219, 1.010321, 0.9019608, 0, 1, 1,
0.9267858, 0.9884609, 0.1678092, 0.9098039, 0, 1, 1,
0.9313527, 0.3903011, 2.543196, 0.9137255, 0, 1, 1,
0.9339687, 0.226115, 0.4757865, 0.9215686, 0, 1, 1,
0.9341705, 0.005620579, 1.756933, 0.9254902, 0, 1, 1,
0.9344127, 0.9380591, 2.337927, 0.9333333, 0, 1, 1,
0.9415779, 2.020563, 0.5996482, 0.9372549, 0, 1, 1,
0.9419403, 1.867957, -0.3283022, 0.945098, 0, 1, 1,
0.9442451, 0.4114203, 0.08399673, 0.9490196, 0, 1, 1,
0.945871, 1.262496, -0.3997459, 0.9568627, 0, 1, 1,
0.9474102, 1.483325, 0.6684971, 0.9607843, 0, 1, 1,
0.9486778, -0.7010529, 2.111869, 0.9686275, 0, 1, 1,
0.9508683, -0.872512, 3.262574, 0.972549, 0, 1, 1,
0.9535887, -1.11819, 1.970406, 0.9803922, 0, 1, 1,
0.9536213, -1.363111, 3.767991, 0.9843137, 0, 1, 1,
0.9539644, -0.9140137, 3.546495, 0.9921569, 0, 1, 1,
0.9615169, 0.8242639, 1.836042, 0.9960784, 0, 1, 1,
0.962259, 0.2194221, 1.169175, 1, 0, 0.9960784, 1,
0.9650224, 0.1673598, 1.801944, 1, 0, 0.9882353, 1,
0.9650507, 0.8720545, 0.5716614, 1, 0, 0.9843137, 1,
0.965268, 0.836184, 1.585888, 1, 0, 0.9764706, 1,
0.9681706, 0.2000438, 0.5814651, 1, 0, 0.972549, 1,
0.9695713, -0.176687, 1.025804, 1, 0, 0.9647059, 1,
0.9711465, 0.2803237, 0.2179892, 1, 0, 0.9607843, 1,
0.9718615, 0.3131801, 1.180428, 1, 0, 0.9529412, 1,
0.9747932, -0.1859921, 0.1518669, 1, 0, 0.9490196, 1,
0.9793085, -0.6985497, 3.125299, 1, 0, 0.9411765, 1,
0.9812078, -0.9261048, 3.274684, 1, 0, 0.9372549, 1,
0.9829509, 2.033359, 1.117679, 1, 0, 0.9294118, 1,
0.9863716, 0.2391998, 2.847623, 1, 0, 0.9254902, 1,
0.9883276, 2.659063, 3.201238, 1, 0, 0.9176471, 1,
0.9910539, -0.7389777, 2.389489, 1, 0, 0.9137255, 1,
0.9946402, 1.071938, 2.555457, 1, 0, 0.9058824, 1,
1.004716, -0.04435473, 0.2693912, 1, 0, 0.9019608, 1,
1.020717, -0.3367958, 2.615363, 1, 0, 0.8941177, 1,
1.022372, -0.123544, 2.753495, 1, 0, 0.8862745, 1,
1.027541, -0.2319429, 1.341084, 1, 0, 0.8823529, 1,
1.032894, 2.242299, 1.156357, 1, 0, 0.8745098, 1,
1.034391, -0.528976, 2.983697, 1, 0, 0.8705882, 1,
1.040044, -0.9263704, 2.497464, 1, 0, 0.8627451, 1,
1.049121, -1.307684, 3.411393, 1, 0, 0.8588235, 1,
1.049241, 1.624304, 1.95631, 1, 0, 0.8509804, 1,
1.056786, 0.5728115, 0.8920432, 1, 0, 0.8470588, 1,
1.058242, 0.5921508, 1.590223, 1, 0, 0.8392157, 1,
1.074795, 0.4117704, 0.4726933, 1, 0, 0.8352941, 1,
1.080195, 0.0001012195, 1.807412, 1, 0, 0.827451, 1,
1.091123, 0.001063704, 2.822217, 1, 0, 0.8235294, 1,
1.100043, -0.6830303, 2.898215, 1, 0, 0.8156863, 1,
1.104202, -0.3515686, 2.706321, 1, 0, 0.8117647, 1,
1.105375, -0.3896846, -0.4456524, 1, 0, 0.8039216, 1,
1.106356, -0.5448287, 3.150087, 1, 0, 0.7960784, 1,
1.106989, -0.6616555, 2.314527, 1, 0, 0.7921569, 1,
1.109204, 1.094967, 2.22276, 1, 0, 0.7843137, 1,
1.115476, -0.5922834, 3.31776, 1, 0, 0.7803922, 1,
1.116312, -0.2078725, -0.00491305, 1, 0, 0.772549, 1,
1.120818, -0.3264299, 1.6293, 1, 0, 0.7686275, 1,
1.125335, 0.1165336, 1.001086, 1, 0, 0.7607843, 1,
1.134953, 0.4339871, 1.248069, 1, 0, 0.7568628, 1,
1.137015, -1.555978, 1.441112, 1, 0, 0.7490196, 1,
1.138373, 1.47804, 0.7471547, 1, 0, 0.7450981, 1,
1.14557, -1.333061, 1.922537, 1, 0, 0.7372549, 1,
1.149972, 0.9129274, 1.220214, 1, 0, 0.7333333, 1,
1.150572, 0.7884399, 1.435422, 1, 0, 0.7254902, 1,
1.157042, -2.349063, 2.110623, 1, 0, 0.7215686, 1,
1.157762, 0.5101905, 0.2179058, 1, 0, 0.7137255, 1,
1.163079, 0.5603873, 1.600019, 1, 0, 0.7098039, 1,
1.164232, -2.530948, 3.948612, 1, 0, 0.7019608, 1,
1.164405, -1.43248, 2.484615, 1, 0, 0.6941177, 1,
1.165865, -0.7765873, 1.950686, 1, 0, 0.6901961, 1,
1.173296, 0.8879086, 1.905147, 1, 0, 0.682353, 1,
1.180343, -0.3955534, 1.561925, 1, 0, 0.6784314, 1,
1.182267, -0.6531479, 1.310126, 1, 0, 0.6705883, 1,
1.184568, 0.5714484, 1.846728, 1, 0, 0.6666667, 1,
1.188293, 0.3959948, 0.3379781, 1, 0, 0.6588235, 1,
1.192725, 0.7448832, 1.388433, 1, 0, 0.654902, 1,
1.193015, -0.4411873, -0.0004601472, 1, 0, 0.6470588, 1,
1.208423, -0.393693, 2.858384, 1, 0, 0.6431373, 1,
1.215796, -1.032139, 1.66488, 1, 0, 0.6352941, 1,
1.221506, -0.9425457, 2.538804, 1, 0, 0.6313726, 1,
1.221788, -0.8118237, 2.340188, 1, 0, 0.6235294, 1,
1.22815, 0.3594249, 1.85825, 1, 0, 0.6196079, 1,
1.237816, -1.52407, 1.38806, 1, 0, 0.6117647, 1,
1.251932, 0.5933183, -0.6285521, 1, 0, 0.6078432, 1,
1.256498, -0.5936523, 1.861929, 1, 0, 0.6, 1,
1.273303, -2.276841, 2.66747, 1, 0, 0.5921569, 1,
1.275258, -0.3543323, 2.354186, 1, 0, 0.5882353, 1,
1.279602, -1.091918, 3.294573, 1, 0, 0.5803922, 1,
1.283771, 1.499706, 2.547274, 1, 0, 0.5764706, 1,
1.288446, 0.1508087, 1.920327, 1, 0, 0.5686275, 1,
1.321188, -0.5609552, 2.119347, 1, 0, 0.5647059, 1,
1.343218, -0.8445119, 3.408628, 1, 0, 0.5568628, 1,
1.35263, 1.523058, 1.686028, 1, 0, 0.5529412, 1,
1.354218, 0.4997321, 2.00585, 1, 0, 0.5450981, 1,
1.354647, 0.1165235, 1.154994, 1, 0, 0.5411765, 1,
1.356463, -0.7377205, 1.360986, 1, 0, 0.5333334, 1,
1.362866, 0.1890134, 1.024568, 1, 0, 0.5294118, 1,
1.369885, -1.123319, 2.768562, 1, 0, 0.5215687, 1,
1.375285, -0.1176715, 3.117475, 1, 0, 0.5176471, 1,
1.383109, -1.606869, 3.013129, 1, 0, 0.509804, 1,
1.383392, 0.5812535, 0.8710199, 1, 0, 0.5058824, 1,
1.385121, 0.2934456, 0.7900108, 1, 0, 0.4980392, 1,
1.385414, -1.493022, 4.033782, 1, 0, 0.4901961, 1,
1.388682, -0.7801418, 3.278576, 1, 0, 0.4862745, 1,
1.396289, -0.6637962, 2.185555, 1, 0, 0.4784314, 1,
1.396778, -0.7164831, 1.993378, 1, 0, 0.4745098, 1,
1.397471, 0.1521098, 3.51788, 1, 0, 0.4666667, 1,
1.399416, -2.600571, 2.536599, 1, 0, 0.4627451, 1,
1.401019, 0.06592207, 0.7343476, 1, 0, 0.454902, 1,
1.401326, 0.4070437, 1.526143, 1, 0, 0.4509804, 1,
1.406999, 0.03373194, 2.200088, 1, 0, 0.4431373, 1,
1.420344, -0.3920029, 2.342036, 1, 0, 0.4392157, 1,
1.421718, 0.7389356, 1.103723, 1, 0, 0.4313726, 1,
1.426454, -0.4875739, 3.336373, 1, 0, 0.427451, 1,
1.427036, 0.1162978, 1.891564, 1, 0, 0.4196078, 1,
1.430005, 1.160651, 0.4910207, 1, 0, 0.4156863, 1,
1.441195, -1.365235, 2.158605, 1, 0, 0.4078431, 1,
1.454391, 0.5186172, 0.6543754, 1, 0, 0.4039216, 1,
1.457954, 0.6913983, 0.1060119, 1, 0, 0.3960784, 1,
1.46473, 0.6902397, -0.5204255, 1, 0, 0.3882353, 1,
1.488597, 1.045089, 2.257949, 1, 0, 0.3843137, 1,
1.507882, 0.07347351, 1.460908, 1, 0, 0.3764706, 1,
1.516126, -1.007033, 2.243234, 1, 0, 0.372549, 1,
1.547054, -0.1970174, 3.547734, 1, 0, 0.3647059, 1,
1.551455, -1.40409, 1.690536, 1, 0, 0.3607843, 1,
1.563545, -1.128753, 3.672894, 1, 0, 0.3529412, 1,
1.563801, -0.2391351, 1.512106, 1, 0, 0.3490196, 1,
1.575457, -0.3586052, 1.955315, 1, 0, 0.3411765, 1,
1.5775, -0.1229571, 2.79943, 1, 0, 0.3372549, 1,
1.581778, -0.7000031, 2.06164, 1, 0, 0.3294118, 1,
1.587, -0.03030879, 1.92589, 1, 0, 0.3254902, 1,
1.593062, -0.4379152, 1.178367, 1, 0, 0.3176471, 1,
1.599854, -1.017593, 2.891407, 1, 0, 0.3137255, 1,
1.59998, 0.2164142, 0.4762205, 1, 0, 0.3058824, 1,
1.622956, -1.535097, 1.852569, 1, 0, 0.2980392, 1,
1.633168, -0.6309253, 0.811666, 1, 0, 0.2941177, 1,
1.641165, -0.5735044, 2.496615, 1, 0, 0.2862745, 1,
1.643194, -1.790288, 2.217029, 1, 0, 0.282353, 1,
1.649746, -0.6409301, 2.479334, 1, 0, 0.2745098, 1,
1.652016, 1.514121, 1.008492, 1, 0, 0.2705882, 1,
1.653983, -0.6414831, 1.326306, 1, 0, 0.2627451, 1,
1.654836, 0.9841204, 1.81685, 1, 0, 0.2588235, 1,
1.682451, -1.0194, 4.024862, 1, 0, 0.2509804, 1,
1.688755, 0.3951591, 1.173924, 1, 0, 0.2470588, 1,
1.691417, -0.2898367, 1.977221, 1, 0, 0.2392157, 1,
1.723004, -0.2309604, 2.458776, 1, 0, 0.2352941, 1,
1.727065, -0.1513636, 0.8406158, 1, 0, 0.227451, 1,
1.731785, 0.926225, 2.120183, 1, 0, 0.2235294, 1,
1.740328, -1.143527, 2.210469, 1, 0, 0.2156863, 1,
1.74997, 1.186912, -0.5186945, 1, 0, 0.2117647, 1,
1.754479, -1.982955, 3.603006, 1, 0, 0.2039216, 1,
1.762743, -0.8171448, 1.315568, 1, 0, 0.1960784, 1,
1.767779, 0.4863101, 0.02019159, 1, 0, 0.1921569, 1,
1.799692, 1.8995, 0.02187401, 1, 0, 0.1843137, 1,
1.812692, 0.4368667, 1.012984, 1, 0, 0.1803922, 1,
1.814451, -0.267081, 2.097013, 1, 0, 0.172549, 1,
1.82965, 0.8697485, -0.4830838, 1, 0, 0.1686275, 1,
1.845829, -0.5160958, 1.585761, 1, 0, 0.1607843, 1,
1.866527, 0.8259311, 1.003437, 1, 0, 0.1568628, 1,
1.880163, -1.910761, 2.977071, 1, 0, 0.1490196, 1,
1.89713, 0.2460253, 1.995801, 1, 0, 0.145098, 1,
1.904283, 1.058525, 0.9418101, 1, 0, 0.1372549, 1,
1.916385, 0.6578641, 0.2284854, 1, 0, 0.1333333, 1,
1.970951, 0.7553254, 1.738158, 1, 0, 0.1254902, 1,
1.989734, 0.6309993, 1.393203, 1, 0, 0.1215686, 1,
1.996563, 1.111359, 0.8883696, 1, 0, 0.1137255, 1,
1.998209, -0.06971367, 2.123212, 1, 0, 0.1098039, 1,
2.002952, 3.249344, -0.5993044, 1, 0, 0.1019608, 1,
2.055024, 0.348697, 1.396441, 1, 0, 0.09411765, 1,
2.072041, -0.631174, 1.014667, 1, 0, 0.09019608, 1,
2.088539, 0.3252273, 3.184317, 1, 0, 0.08235294, 1,
2.124748, 1.484894, 1.197075, 1, 0, 0.07843138, 1,
2.149491, -1.010454, -0.4218198, 1, 0, 0.07058824, 1,
2.210844, 0.4415126, 0.3512042, 1, 0, 0.06666667, 1,
2.212964, 0.1841588, 1.314282, 1, 0, 0.05882353, 1,
2.220318, 0.2545626, 2.054369, 1, 0, 0.05490196, 1,
2.229585, 0.928481, 1.307588, 1, 0, 0.04705882, 1,
2.268388, -0.3761113, 1.595243, 1, 0, 0.04313726, 1,
2.295406, -2.855665, 2.889813, 1, 0, 0.03529412, 1,
2.32306, 0.09909035, 2.182841, 1, 0, 0.03137255, 1,
2.680842, 1.258014, 1.095796, 1, 0, 0.02352941, 1,
2.820513, 0.3429661, 3.000701, 1, 0, 0.01960784, 1,
2.856423, -1.550556, 2.413027, 1, 0, 0.01176471, 1,
3.013484, 0.6789847, 1.890235, 1, 0, 0.007843138, 1
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
-0.2466542, -3.905414, -6.465638, 0, -0.5, 0.5, 0.5,
-0.2466542, -3.905414, -6.465638, 1, -0.5, 0.5, 0.5,
-0.2466542, -3.905414, -6.465638, 1, 1.5, 0.5, 0.5,
-0.2466542, -3.905414, -6.465638, 0, 1.5, 0.5, 0.5
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
-4.61198, 0.1904479, -6.465638, 0, -0.5, 0.5, 0.5,
-4.61198, 0.1904479, -6.465638, 1, -0.5, 0.5, 0.5,
-4.61198, 0.1904479, -6.465638, 1, 1.5, 0.5, 0.5,
-4.61198, 0.1904479, -6.465638, 0, 1.5, 0.5, 0.5
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
-4.61198, -3.905414, 0.002046347, 0, -0.5, 0.5, 0.5,
-4.61198, -3.905414, 0.002046347, 1, -0.5, 0.5, 0.5,
-4.61198, -3.905414, 0.002046347, 1, 1.5, 0.5, 0.5,
-4.61198, -3.905414, 0.002046347, 0, 1.5, 0.5, 0.5
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
-3, -2.960215, -4.973095,
3, -2.960215, -4.973095,
-3, -2.960215, -4.973095,
-3, -3.117748, -5.221853,
-2, -2.960215, -4.973095,
-2, -3.117748, -5.221853,
-1, -2.960215, -4.973095,
-1, -3.117748, -5.221853,
0, -2.960215, -4.973095,
0, -3.117748, -5.221853,
1, -2.960215, -4.973095,
1, -3.117748, -5.221853,
2, -2.960215, -4.973095,
2, -3.117748, -5.221853,
3, -2.960215, -4.973095,
3, -3.117748, -5.221853
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
-3, -3.432815, -5.719367, 0, -0.5, 0.5, 0.5,
-3, -3.432815, -5.719367, 1, -0.5, 0.5, 0.5,
-3, -3.432815, -5.719367, 1, 1.5, 0.5, 0.5,
-3, -3.432815, -5.719367, 0, 1.5, 0.5, 0.5,
-2, -3.432815, -5.719367, 0, -0.5, 0.5, 0.5,
-2, -3.432815, -5.719367, 1, -0.5, 0.5, 0.5,
-2, -3.432815, -5.719367, 1, 1.5, 0.5, 0.5,
-2, -3.432815, -5.719367, 0, 1.5, 0.5, 0.5,
-1, -3.432815, -5.719367, 0, -0.5, 0.5, 0.5,
-1, -3.432815, -5.719367, 1, -0.5, 0.5, 0.5,
-1, -3.432815, -5.719367, 1, 1.5, 0.5, 0.5,
-1, -3.432815, -5.719367, 0, 1.5, 0.5, 0.5,
0, -3.432815, -5.719367, 0, -0.5, 0.5, 0.5,
0, -3.432815, -5.719367, 1, -0.5, 0.5, 0.5,
0, -3.432815, -5.719367, 1, 1.5, 0.5, 0.5,
0, -3.432815, -5.719367, 0, 1.5, 0.5, 0.5,
1, -3.432815, -5.719367, 0, -0.5, 0.5, 0.5,
1, -3.432815, -5.719367, 1, -0.5, 0.5, 0.5,
1, -3.432815, -5.719367, 1, 1.5, 0.5, 0.5,
1, -3.432815, -5.719367, 0, 1.5, 0.5, 0.5,
2, -3.432815, -5.719367, 0, -0.5, 0.5, 0.5,
2, -3.432815, -5.719367, 1, -0.5, 0.5, 0.5,
2, -3.432815, -5.719367, 1, 1.5, 0.5, 0.5,
2, -3.432815, -5.719367, 0, 1.5, 0.5, 0.5,
3, -3.432815, -5.719367, 0, -0.5, 0.5, 0.5,
3, -3.432815, -5.719367, 1, -0.5, 0.5, 0.5,
3, -3.432815, -5.719367, 1, 1.5, 0.5, 0.5,
3, -3.432815, -5.719367, 0, 1.5, 0.5, 0.5
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
-3.604597, -2, -4.973095,
-3.604597, 3, -4.973095,
-3.604597, -2, -4.973095,
-3.772494, -2, -5.221853,
-3.604597, -1, -4.973095,
-3.772494, -1, -5.221853,
-3.604597, 0, -4.973095,
-3.772494, 0, -5.221853,
-3.604597, 1, -4.973095,
-3.772494, 1, -5.221853,
-3.604597, 2, -4.973095,
-3.772494, 2, -5.221853,
-3.604597, 3, -4.973095,
-3.772494, 3, -5.221853
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
-4.108288, -2, -5.719367, 0, -0.5, 0.5, 0.5,
-4.108288, -2, -5.719367, 1, -0.5, 0.5, 0.5,
-4.108288, -2, -5.719367, 1, 1.5, 0.5, 0.5,
-4.108288, -2, -5.719367, 0, 1.5, 0.5, 0.5,
-4.108288, -1, -5.719367, 0, -0.5, 0.5, 0.5,
-4.108288, -1, -5.719367, 1, -0.5, 0.5, 0.5,
-4.108288, -1, -5.719367, 1, 1.5, 0.5, 0.5,
-4.108288, -1, -5.719367, 0, 1.5, 0.5, 0.5,
-4.108288, 0, -5.719367, 0, -0.5, 0.5, 0.5,
-4.108288, 0, -5.719367, 1, -0.5, 0.5, 0.5,
-4.108288, 0, -5.719367, 1, 1.5, 0.5, 0.5,
-4.108288, 0, -5.719367, 0, 1.5, 0.5, 0.5,
-4.108288, 1, -5.719367, 0, -0.5, 0.5, 0.5,
-4.108288, 1, -5.719367, 1, -0.5, 0.5, 0.5,
-4.108288, 1, -5.719367, 1, 1.5, 0.5, 0.5,
-4.108288, 1, -5.719367, 0, 1.5, 0.5, 0.5,
-4.108288, 2, -5.719367, 0, -0.5, 0.5, 0.5,
-4.108288, 2, -5.719367, 1, -0.5, 0.5, 0.5,
-4.108288, 2, -5.719367, 1, 1.5, 0.5, 0.5,
-4.108288, 2, -5.719367, 0, 1.5, 0.5, 0.5,
-4.108288, 3, -5.719367, 0, -0.5, 0.5, 0.5,
-4.108288, 3, -5.719367, 1, -0.5, 0.5, 0.5,
-4.108288, 3, -5.719367, 1, 1.5, 0.5, 0.5,
-4.108288, 3, -5.719367, 0, 1.5, 0.5, 0.5
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
-3.604597, -2.960215, -4,
-3.604597, -2.960215, 4,
-3.604597, -2.960215, -4,
-3.772494, -3.117748, -4,
-3.604597, -2.960215, -2,
-3.772494, -3.117748, -2,
-3.604597, -2.960215, 0,
-3.772494, -3.117748, 0,
-3.604597, -2.960215, 2,
-3.772494, -3.117748, 2,
-3.604597, -2.960215, 4,
-3.772494, -3.117748, 4
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
-4.108288, -3.432815, -4, 0, -0.5, 0.5, 0.5,
-4.108288, -3.432815, -4, 1, -0.5, 0.5, 0.5,
-4.108288, -3.432815, -4, 1, 1.5, 0.5, 0.5,
-4.108288, -3.432815, -4, 0, 1.5, 0.5, 0.5,
-4.108288, -3.432815, -2, 0, -0.5, 0.5, 0.5,
-4.108288, -3.432815, -2, 1, -0.5, 0.5, 0.5,
-4.108288, -3.432815, -2, 1, 1.5, 0.5, 0.5,
-4.108288, -3.432815, -2, 0, 1.5, 0.5, 0.5,
-4.108288, -3.432815, 0, 0, -0.5, 0.5, 0.5,
-4.108288, -3.432815, 0, 1, -0.5, 0.5, 0.5,
-4.108288, -3.432815, 0, 1, 1.5, 0.5, 0.5,
-4.108288, -3.432815, 0, 0, 1.5, 0.5, 0.5,
-4.108288, -3.432815, 2, 0, -0.5, 0.5, 0.5,
-4.108288, -3.432815, 2, 1, -0.5, 0.5, 0.5,
-4.108288, -3.432815, 2, 1, 1.5, 0.5, 0.5,
-4.108288, -3.432815, 2, 0, 1.5, 0.5, 0.5,
-4.108288, -3.432815, 4, 0, -0.5, 0.5, 0.5,
-4.108288, -3.432815, 4, 1, -0.5, 0.5, 0.5,
-4.108288, -3.432815, 4, 1, 1.5, 0.5, 0.5,
-4.108288, -3.432815, 4, 0, 1.5, 0.5, 0.5
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
-3.604597, -2.960215, -4.973095,
-3.604597, 3.341111, -4.973095,
-3.604597, -2.960215, 4.977188,
-3.604597, 3.341111, 4.977188,
-3.604597, -2.960215, -4.973095,
-3.604597, -2.960215, 4.977188,
-3.604597, 3.341111, -4.973095,
-3.604597, 3.341111, 4.977188,
-3.604597, -2.960215, -4.973095,
3.111289, -2.960215, -4.973095,
-3.604597, -2.960215, 4.977188,
3.111289, -2.960215, 4.977188,
-3.604597, 3.341111, -4.973095,
3.111289, 3.341111, -4.973095,
-3.604597, 3.341111, 4.977188,
3.111289, 3.341111, 4.977188,
3.111289, -2.960215, -4.973095,
3.111289, 3.341111, -4.973095,
3.111289, -2.960215, 4.977188,
3.111289, 3.341111, 4.977188,
3.111289, -2.960215, -4.973095,
3.111289, -2.960215, 4.977188,
3.111289, 3.341111, -4.973095,
3.111289, 3.341111, 4.977188
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
var radius = 7.239681;
var distance = 32.21016;
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
mvMatrix.translate( 0.2466542, -0.1904479, -0.002046347 );
mvMatrix.scale( 1.165548, 1.242228, 0.7866796 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.21016);
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
Trichlorfon<-read.table("Trichlorfon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Trichlorfon$V2
```

```
## Error in eval(expr, envir, enclos): object 'Trichlorfon' not found
```

```r
y<-Trichlorfon$V3
```

```
## Error in eval(expr, envir, enclos): object 'Trichlorfon' not found
```

```r
z<-Trichlorfon$V4
```

```
## Error in eval(expr, envir, enclos): object 'Trichlorfon' not found
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
-3.506793, 0.9698505, -1.817141, 0, 0, 1, 1, 1,
-2.730652, 2.149832, -1.167328, 1, 0, 0, 1, 1,
-2.690923, 0.131796, -2.937367, 1, 0, 0, 1, 1,
-2.588123, -1.624064, -2.448796, 1, 0, 0, 1, 1,
-2.569885, -0.5805399, -2.25022, 1, 0, 0, 1, 1,
-2.462776, 2.082708, -0.8105879, 1, 0, 0, 1, 1,
-2.34991, -0.1849201, -3.77234, 0, 0, 0, 1, 1,
-2.348467, 0.801377, -1.649244, 0, 0, 0, 1, 1,
-2.346435, 0.3370419, -1.243806, 0, 0, 0, 1, 1,
-2.286093, -0.278529, -1.02503, 0, 0, 0, 1, 1,
-2.254609, 2.078324, 0.03155085, 0, 0, 0, 1, 1,
-2.222547, 0.3056152, -0.2387167, 0, 0, 0, 1, 1,
-2.182901, 0.5539554, -0.6100021, 0, 0, 0, 1, 1,
-2.171522, 0.6112056, -0.04508836, 1, 1, 1, 1, 1,
-2.118746, -1.050389, -1.925759, 1, 1, 1, 1, 1,
-2.102962, 0.7850322, -1.667577, 1, 1, 1, 1, 1,
-2.078033, 0.02703006, -0.5027731, 1, 1, 1, 1, 1,
-2.053092, 0.2106976, -0.5849594, 1, 1, 1, 1, 1,
-2.038913, -1.070307, -1.148441, 1, 1, 1, 1, 1,
-1.983589, 0.8870227, -1.014838, 1, 1, 1, 1, 1,
-1.973713, 0.3095469, -1.781707, 1, 1, 1, 1, 1,
-1.967946, -1.429096, -2.808897, 1, 1, 1, 1, 1,
-1.915344, 0.4051223, -0.6782558, 1, 1, 1, 1, 1,
-1.909055, -0.8613912, -0.830345, 1, 1, 1, 1, 1,
-1.897143, -0.2816453, -0.1862734, 1, 1, 1, 1, 1,
-1.874342, 0.2374947, 0.8579972, 1, 1, 1, 1, 1,
-1.870168, -0.9871148, -1.942902, 1, 1, 1, 1, 1,
-1.848505, -0.3123902, -1.001172, 1, 1, 1, 1, 1,
-1.845323, -1.504912, -2.372518, 0, 0, 1, 1, 1,
-1.821867, 0.03326609, -1.55091, 1, 0, 0, 1, 1,
-1.821175, 0.5459396, -0.5791183, 1, 0, 0, 1, 1,
-1.820326, 1.028973, -2.05155, 1, 0, 0, 1, 1,
-1.799883, 0.4159983, -0.4615746, 1, 0, 0, 1, 1,
-1.730905, -1.45657, -3.149781, 1, 0, 0, 1, 1,
-1.704462, -0.4171, -2.145673, 0, 0, 0, 1, 1,
-1.691347, -0.715595, -1.454092, 0, 0, 0, 1, 1,
-1.687565, 0.2213793, -2.038273, 0, 0, 0, 1, 1,
-1.686974, 0.8887321, 0.2817618, 0, 0, 0, 1, 1,
-1.68591, 0.5104155, -1.250297, 0, 0, 0, 1, 1,
-1.684792, -0.9203014, -1.694683, 0, 0, 0, 1, 1,
-1.669598, 1.341638, -1.669331, 0, 0, 0, 1, 1,
-1.663518, 0.3376667, -0.3554716, 1, 1, 1, 1, 1,
-1.663013, -1.578955, -0.1021269, 1, 1, 1, 1, 1,
-1.642902, -0.2355531, -1.445897, 1, 1, 1, 1, 1,
-1.632129, 0.8890527, -0.936609, 1, 1, 1, 1, 1,
-1.626142, -0.5570007, -0.4777686, 1, 1, 1, 1, 1,
-1.61783, -0.1430069, -1.26671, 1, 1, 1, 1, 1,
-1.590658, 1.383823, -0.5804219, 1, 1, 1, 1, 1,
-1.580169, -1.046274, -3.510383, 1, 1, 1, 1, 1,
-1.574374, 0.09704857, -0.9724262, 1, 1, 1, 1, 1,
-1.559168, 2.055118, 1.328376, 1, 1, 1, 1, 1,
-1.5504, 0.7388088, -0.9078469, 1, 1, 1, 1, 1,
-1.542721, -2.027068, -1.733832, 1, 1, 1, 1, 1,
-1.537612, -0.5543531, -1.072797, 1, 1, 1, 1, 1,
-1.533139, -0.142029, -3.302601, 1, 1, 1, 1, 1,
-1.528335, -1.481333, -2.402808, 1, 1, 1, 1, 1,
-1.520262, 0.1240676, 0.7041224, 0, 0, 1, 1, 1,
-1.518719, -0.1728604, -0.6949401, 1, 0, 0, 1, 1,
-1.512774, 0.09419589, -1.610815, 1, 0, 0, 1, 1,
-1.504887, -0.7259787, -4.572845, 1, 0, 0, 1, 1,
-1.487595, 0.2680337, -2.954103, 1, 0, 0, 1, 1,
-1.48424, 0.03678847, -2.342746, 1, 0, 0, 1, 1,
-1.48131, 0.09291053, -1.114587, 0, 0, 0, 1, 1,
-1.478917, -0.3655547, -1.367867, 0, 0, 0, 1, 1,
-1.475121, 0.5609663, 0.07203522, 0, 0, 0, 1, 1,
-1.4733, -0.1906639, -2.056745, 0, 0, 0, 1, 1,
-1.453177, 0.4916953, -0.3613938, 0, 0, 0, 1, 1,
-1.433058, -0.2150511, -4.661661, 0, 0, 0, 1, 1,
-1.43061, 0.4729977, -2.946199, 0, 0, 0, 1, 1,
-1.429629, 1.778406, -0.7491647, 1, 1, 1, 1, 1,
-1.420749, 0.1623758, -2.214338, 1, 1, 1, 1, 1,
-1.410672, -1.879957, -2.694371, 1, 1, 1, 1, 1,
-1.408292, -1.020147, -2.963, 1, 1, 1, 1, 1,
-1.407643, 0.2731476, -2.241759, 1, 1, 1, 1, 1,
-1.403378, -0.4809721, -2.865626, 1, 1, 1, 1, 1,
-1.39943, -1.038252, -2.663464, 1, 1, 1, 1, 1,
-1.396755, 0.1641239, -2.284782, 1, 1, 1, 1, 1,
-1.395214, -1.077539, -2.975611, 1, 1, 1, 1, 1,
-1.391433, -0.1463276, -1.960691, 1, 1, 1, 1, 1,
-1.387867, 0.05029855, -1.233059, 1, 1, 1, 1, 1,
-1.386862, -0.825121, -1.249908, 1, 1, 1, 1, 1,
-1.38412, 0.6878654, -1.587404, 1, 1, 1, 1, 1,
-1.369654, -0.318464, -2.983183, 1, 1, 1, 1, 1,
-1.36233, 0.4594508, -1.019446, 1, 1, 1, 1, 1,
-1.349859, -0.8709134, -3.367546, 0, 0, 1, 1, 1,
-1.341876, 1.250598, -0.6488091, 1, 0, 0, 1, 1,
-1.326223, 0.6354041, -1.071089, 1, 0, 0, 1, 1,
-1.319183, 1.072304, 0.4987841, 1, 0, 0, 1, 1,
-1.311137, -0.9238543, -2.460829, 1, 0, 0, 1, 1,
-1.304829, 0.7083715, -2.028477, 1, 0, 0, 1, 1,
-1.30475, 0.3944341, -1.658821, 0, 0, 0, 1, 1,
-1.301763, 1.433724, -1.495443, 0, 0, 0, 1, 1,
-1.287517, 0.9252064, -1.32559, 0, 0, 0, 1, 1,
-1.26301, 1.739998, -0.3592899, 0, 0, 0, 1, 1,
-1.258949, 1.425542, 1.383536, 0, 0, 0, 1, 1,
-1.251781, 1.15037, -1.081308, 0, 0, 0, 1, 1,
-1.239574, 0.9262055, -0.959578, 0, 0, 0, 1, 1,
-1.239542, 0.2518746, -0.1417675, 1, 1, 1, 1, 1,
-1.238745, 1.349918, -1.836068, 1, 1, 1, 1, 1,
-1.232783, 0.1092955, -3.733076, 1, 1, 1, 1, 1,
-1.230474, -1.183187, -0.7306321, 1, 1, 1, 1, 1,
-1.22546, -1.202667, -3.140321, 1, 1, 1, 1, 1,
-1.22089, -1.446833, -1.755193, 1, 1, 1, 1, 1,
-1.217942, -0.2709685, -2.184273, 1, 1, 1, 1, 1,
-1.217912, -0.09284092, -2.151185, 1, 1, 1, 1, 1,
-1.217194, -0.4455135, -2.991889, 1, 1, 1, 1, 1,
-1.206995, 0.8496993, -0.8163145, 1, 1, 1, 1, 1,
-1.202601, -1.796261, -4.096406, 1, 1, 1, 1, 1,
-1.197926, -1.325885, -2.907802, 1, 1, 1, 1, 1,
-1.182407, 1.127136, -0.88232, 1, 1, 1, 1, 1,
-1.172698, -0.7448177, -1.688462, 1, 1, 1, 1, 1,
-1.171375, -0.3441263, -3.174855, 1, 1, 1, 1, 1,
-1.167754, -1.363613, -1.984633, 0, 0, 1, 1, 1,
-1.16471, 0.2605321, -1.773103, 1, 0, 0, 1, 1,
-1.159415, -0.3217159, -2.120495, 1, 0, 0, 1, 1,
-1.152116, -0.01956266, -2.635709, 1, 0, 0, 1, 1,
-1.146966, 0.83953, -2.353048, 1, 0, 0, 1, 1,
-1.145277, -1.138605, -2.938544, 1, 0, 0, 1, 1,
-1.140736, 0.7021913, -1.053918, 0, 0, 0, 1, 1,
-1.135993, 1.56499, -0.9668818, 0, 0, 0, 1, 1,
-1.134258, 0.3303317, -1.476174, 0, 0, 0, 1, 1,
-1.127129, 0.9131163, -0.8724803, 0, 0, 0, 1, 1,
-1.126542, -1.386943, -1.480674, 0, 0, 0, 1, 1,
-1.12015, -0.4773555, -3.955453, 0, 0, 0, 1, 1,
-1.119834, 0.4838476, -0.6932115, 0, 0, 0, 1, 1,
-1.115212, 0.3232673, -3.225313, 1, 1, 1, 1, 1,
-1.113529, -1.451192, -3.592777, 1, 1, 1, 1, 1,
-1.111476, 0.1049609, -1.448182, 1, 1, 1, 1, 1,
-1.109557, -1.663754, -2.214025, 1, 1, 1, 1, 1,
-1.107902, 0.1447805, -1.146127, 1, 1, 1, 1, 1,
-1.106136, -0.6751966, -0.6556367, 1, 1, 1, 1, 1,
-1.100639, -2.08939, -3.168385, 1, 1, 1, 1, 1,
-1.095858, -0.1596697, -2.339234, 1, 1, 1, 1, 1,
-1.092089, -0.8868334, -2.475168, 1, 1, 1, 1, 1,
-1.090977, 0.9822085, -1.859529, 1, 1, 1, 1, 1,
-1.086318, 1.116126, -0.3932503, 1, 1, 1, 1, 1,
-1.084029, 0.651444, -1.246505, 1, 1, 1, 1, 1,
-1.079594, 0.01705081, -1.722796, 1, 1, 1, 1, 1,
-1.071419, 0.1108075, -1.817416, 1, 1, 1, 1, 1,
-1.06914, 2.082661, -0.05054721, 1, 1, 1, 1, 1,
-1.068654, -0.8656863, 0.03970803, 0, 0, 1, 1, 1,
-1.068506, -1.796353, -2.771414, 1, 0, 0, 1, 1,
-1.066871, 0.4622444, -1.996347, 1, 0, 0, 1, 1,
-1.066795, 0.5474193, -2.478017, 1, 0, 0, 1, 1,
-1.066611, -0.3262797, -3.277835, 1, 0, 0, 1, 1,
-1.058159, 0.6672098, -0.07285578, 1, 0, 0, 1, 1,
-1.056579, 0.02294636, -0.4681851, 0, 0, 0, 1, 1,
-1.054087, 0.9643217, 0.7767534, 0, 0, 0, 1, 1,
-1.05224, 0.416392, -1.836987, 0, 0, 0, 1, 1,
-1.044701, 0.04438138, -2.74458, 0, 0, 0, 1, 1,
-1.04359, 1.780684, -0.8300603, 0, 0, 0, 1, 1,
-1.040566, -0.06289809, -3.853729, 0, 0, 0, 1, 1,
-1.031027, -0.3940874, -1.464846, 0, 0, 0, 1, 1,
-1.025727, 0.277164, -2.417042, 1, 1, 1, 1, 1,
-1.025536, 0.4730551, -1.466483, 1, 1, 1, 1, 1,
-1.016764, -2.102105, -3.862046, 1, 1, 1, 1, 1,
-1.004471, 1.152508, -1.290364, 1, 1, 1, 1, 1,
-1.002919, 0.7354019, -0.3939294, 1, 1, 1, 1, 1,
-0.9988371, 1.724711, 1.541472, 1, 1, 1, 1, 1,
-0.9976306, 0.392022, 1.15025, 1, 1, 1, 1, 1,
-0.9967319, 0.3498742, -0.9322276, 1, 1, 1, 1, 1,
-0.9949862, -1.256797, -2.442821, 1, 1, 1, 1, 1,
-0.9907658, 0.9641338, -1.57444, 1, 1, 1, 1, 1,
-0.9896606, -0.6097824, -2.163234, 1, 1, 1, 1, 1,
-0.9820422, 1.908822, 0.1823214, 1, 1, 1, 1, 1,
-0.9810601, 0.6884404, -1.924412, 1, 1, 1, 1, 1,
-0.9783896, -0.0869026, -1.123909, 1, 1, 1, 1, 1,
-0.9732267, -0.3078525, -1.465896, 1, 1, 1, 1, 1,
-0.9727316, -0.3836271, -2.100065, 0, 0, 1, 1, 1,
-0.9716331, -1.227852, -2.310481, 1, 0, 0, 1, 1,
-0.9669421, 1.717789, 0.6719386, 1, 0, 0, 1, 1,
-0.9643933, 0.7116982, -1.808795, 1, 0, 0, 1, 1,
-0.9633132, -1.288432, -2.60101, 1, 0, 0, 1, 1,
-0.9590153, -0.9960552, -3.96876, 1, 0, 0, 1, 1,
-0.9583338, -1.119174, -1.645171, 0, 0, 0, 1, 1,
-0.9576392, 0.453153, -1.691489, 0, 0, 0, 1, 1,
-0.9530101, 0.01028931, -2.673908, 0, 0, 0, 1, 1,
-0.9445227, 0.4886503, -2.35029, 0, 0, 0, 1, 1,
-0.9443254, 1.224606, 0.01330737, 0, 0, 0, 1, 1,
-0.9401599, -1.499012, -3.637747, 0, 0, 0, 1, 1,
-0.9368901, 0.3795049, -1.860785, 0, 0, 0, 1, 1,
-0.9365888, 0.1336974, -2.866103, 1, 1, 1, 1, 1,
-0.9361794, 0.7833753, -0.938088, 1, 1, 1, 1, 1,
-0.9283573, -0.8776395, -2.939268, 1, 1, 1, 1, 1,
-0.9257191, -0.986772, -3.517055, 1, 1, 1, 1, 1,
-0.9241413, -0.6672994, -1.986227, 1, 1, 1, 1, 1,
-0.9232609, 1.017871, 0.9440185, 1, 1, 1, 1, 1,
-0.9231393, -0.4221832, -1.98215, 1, 1, 1, 1, 1,
-0.9230888, -2.118536, -3.525629, 1, 1, 1, 1, 1,
-0.916278, 0.1525418, -1.008471, 1, 1, 1, 1, 1,
-0.9160101, 0.6497843, -1.604805, 1, 1, 1, 1, 1,
-0.913688, 0.08157019, -1.301868, 1, 1, 1, 1, 1,
-0.9107326, -0.05047072, -1.944739, 1, 1, 1, 1, 1,
-0.90671, 0.309967, -0.8684905, 1, 1, 1, 1, 1,
-0.9046743, -0.03220436, -1.499401, 1, 1, 1, 1, 1,
-0.893122, -0.6958498, -2.211542, 1, 1, 1, 1, 1,
-0.8923253, -0.7883265, -0.9924909, 0, 0, 1, 1, 1,
-0.8889636, -2.042564, -2.631769, 1, 0, 0, 1, 1,
-0.8880058, -0.5196403, -2.451786, 1, 0, 0, 1, 1,
-0.880098, 1.124793, 1.362279, 1, 0, 0, 1, 1,
-0.8774369, -0.7791486, -2.478457, 1, 0, 0, 1, 1,
-0.8762187, 0.09963981, -1.513179, 1, 0, 0, 1, 1,
-0.8749813, -0.2254691, -1.963134, 0, 0, 0, 1, 1,
-0.8734621, -1.747556, -1.234506, 0, 0, 0, 1, 1,
-0.869715, -0.3934382, -1.894155, 0, 0, 0, 1, 1,
-0.8648841, 0.9710525, 0.3912653, 0, 0, 0, 1, 1,
-0.8629233, 0.05081598, -1.045272, 0, 0, 0, 1, 1,
-0.8596498, 0.8244253, -0.4501478, 0, 0, 0, 1, 1,
-0.8585901, 1.09759, 0.7892379, 0, 0, 0, 1, 1,
-0.8412095, -0.5864411, -1.996523, 1, 1, 1, 1, 1,
-0.83926, 1.203658, 0.4279869, 1, 1, 1, 1, 1,
-0.8389232, -0.6002646, -2.385497, 1, 1, 1, 1, 1,
-0.8387133, 0.3896734, -0.7785619, 1, 1, 1, 1, 1,
-0.8335538, 0.8619325, -0.1454012, 1, 1, 1, 1, 1,
-0.829388, 0.3888538, -0.3559561, 1, 1, 1, 1, 1,
-0.8266335, -0.3109372, -1.854805, 1, 1, 1, 1, 1,
-0.8218285, -0.3265862, -2.945542, 1, 1, 1, 1, 1,
-0.8200032, 0.8510272, -1.18719, 1, 1, 1, 1, 1,
-0.818849, 0.00180262, -1.623932, 1, 1, 1, 1, 1,
-0.8152359, -1.407234, -3.529694, 1, 1, 1, 1, 1,
-0.813529, -0.7618061, -2.250329, 1, 1, 1, 1, 1,
-0.8101886, -1.331653, -3.386394, 1, 1, 1, 1, 1,
-0.8027062, -0.5757915, -1.82959, 1, 1, 1, 1, 1,
-0.8024554, -1.05345, -2.292672, 1, 1, 1, 1, 1,
-0.7991912, -0.2216566, -1.800188, 0, 0, 1, 1, 1,
-0.7927833, 0.8714372, -0.7997207, 1, 0, 0, 1, 1,
-0.7873824, 1.131045, -0.6227136, 1, 0, 0, 1, 1,
-0.786097, 2.014983, -0.06019842, 1, 0, 0, 1, 1,
-0.785116, 0.5151207, -1.770786, 1, 0, 0, 1, 1,
-0.779402, 0.8462366, -0.8073447, 1, 0, 0, 1, 1,
-0.7787477, 2.009828, -0.658688, 0, 0, 0, 1, 1,
-0.7769644, -0.4425937, -2.44126, 0, 0, 0, 1, 1,
-0.7744548, -0.8207164, -4.050591, 0, 0, 0, 1, 1,
-0.7716061, 1.460579, 0.4894404, 0, 0, 0, 1, 1,
-0.7711485, 1.207611, -1.060415, 0, 0, 0, 1, 1,
-0.7610343, 0.2026982, -3.20988, 0, 0, 0, 1, 1,
-0.755583, -0.7169542, -2.490027, 0, 0, 0, 1, 1,
-0.7508134, 0.8885559, 0.1770577, 1, 1, 1, 1, 1,
-0.745786, -2.176582, -2.269297, 1, 1, 1, 1, 1,
-0.7424152, 0.922914, -0.7055937, 1, 1, 1, 1, 1,
-0.7397428, 0.3237335, -1.830618, 1, 1, 1, 1, 1,
-0.7380896, -0.5141147, -2.177998, 1, 1, 1, 1, 1,
-0.7370799, -0.8364007, -0.8174878, 1, 1, 1, 1, 1,
-0.730306, -0.996318, -2.020917, 1, 1, 1, 1, 1,
-0.7290092, -0.1088403, -3.397279, 1, 1, 1, 1, 1,
-0.7164899, 0.4159229, -1.867615, 1, 1, 1, 1, 1,
-0.7123538, 0.644816, 0.6275069, 1, 1, 1, 1, 1,
-0.7119873, 0.2488254, -0.5596743, 1, 1, 1, 1, 1,
-0.7106355, -0.5180097, -1.79192, 1, 1, 1, 1, 1,
-0.706388, -0.2339416, -2.019099, 1, 1, 1, 1, 1,
-0.7062038, 1.469195, -1.291488, 1, 1, 1, 1, 1,
-0.7008789, 0.172799, -0.4289613, 1, 1, 1, 1, 1,
-0.6965996, 0.964992, 0.4537933, 0, 0, 1, 1, 1,
-0.6965907, -1.376281, -1.175572, 1, 0, 0, 1, 1,
-0.6923021, 1.942113, -0.661604, 1, 0, 0, 1, 1,
-0.6903575, 1.197071, -1.537262, 1, 0, 0, 1, 1,
-0.6899587, -0.1165059, -2.948323, 1, 0, 0, 1, 1,
-0.6895822, 0.3579839, 0.217225, 1, 0, 0, 1, 1,
-0.6888696, -1.674759, -2.214866, 0, 0, 0, 1, 1,
-0.6836564, 0.5134137, 0.06374661, 0, 0, 0, 1, 1,
-0.6791682, 0.6410277, -0.5756071, 0, 0, 0, 1, 1,
-0.6761337, -1.63385, -2.756419, 0, 0, 0, 1, 1,
-0.6745689, 0.02653751, -1.916329, 0, 0, 0, 1, 1,
-0.6736987, -2.204741, -2.246228, 0, 0, 0, 1, 1,
-0.6701718, -0.8426995, -1.168416, 0, 0, 0, 1, 1,
-0.6699334, -0.2086669, -2.065647, 1, 1, 1, 1, 1,
-0.6683863, 0.5214512, 0.03763001, 1, 1, 1, 1, 1,
-0.6679249, 2.391659, -0.22045, 1, 1, 1, 1, 1,
-0.667166, -0.338612, -3.567604, 1, 1, 1, 1, 1,
-0.6638426, 0.5065042, -2.711412, 1, 1, 1, 1, 1,
-0.6590164, -0.1486363, -1.875185, 1, 1, 1, 1, 1,
-0.6569866, 0.8056023, -0.8629011, 1, 1, 1, 1, 1,
-0.6515951, 0.4882941, -0.7875414, 1, 1, 1, 1, 1,
-0.6506857, -0.7546887, -2.363245, 1, 1, 1, 1, 1,
-0.649874, -0.7414704, -1.675591, 1, 1, 1, 1, 1,
-0.6479395, -0.3027212, -2.173316, 1, 1, 1, 1, 1,
-0.6470761, 1.596525, -0.4073229, 1, 1, 1, 1, 1,
-0.6424254, -0.4759106, -2.500386, 1, 1, 1, 1, 1,
-0.6423996, -1.357425, -2.446643, 1, 1, 1, 1, 1,
-0.6391424, -0.6595915, -1.904694, 1, 1, 1, 1, 1,
-0.6386799, 0.4344775, -3.121045, 0, 0, 1, 1, 1,
-0.6245004, 0.6058919, -1.59874, 1, 0, 0, 1, 1,
-0.6229239, 0.6518784, 0.3369994, 1, 0, 0, 1, 1,
-0.619366, -2.699596, -2.658889, 1, 0, 0, 1, 1,
-0.617374, -0.4798456, -1.431553, 1, 0, 0, 1, 1,
-0.6171715, -0.1565073, -3.2456, 1, 0, 0, 1, 1,
-0.6102214, -0.07662527, -2.174741, 0, 0, 0, 1, 1,
-0.6055705, -1.641398, -3.926269, 0, 0, 0, 1, 1,
-0.6033922, 1.082532, -0.219269, 0, 0, 0, 1, 1,
-0.5997276, 0.465274, -1.978824, 0, 0, 0, 1, 1,
-0.5994098, 0.3480713, -1.198906, 0, 0, 0, 1, 1,
-0.5969458, 1.461555, 0.4318671, 0, 0, 0, 1, 1,
-0.5947491, 0.5355309, -0.9098933, 0, 0, 0, 1, 1,
-0.5886524, 1.824688, -0.505314, 1, 1, 1, 1, 1,
-0.580639, 0.7268563, 0.1887781, 1, 1, 1, 1, 1,
-0.5796822, -1.452544, -2.464074, 1, 1, 1, 1, 1,
-0.5792853, 0.404678, -1.704519, 1, 1, 1, 1, 1,
-0.5769926, -0.08919724, -0.6443626, 1, 1, 1, 1, 1,
-0.5716745, -0.2362718, -2.239714, 1, 1, 1, 1, 1,
-0.5710841, 0.7876286, -1.970508, 1, 1, 1, 1, 1,
-0.5645947, 0.5921786, -0.7739059, 1, 1, 1, 1, 1,
-0.5571349, -0.3541303, -1.86167, 1, 1, 1, 1, 1,
-0.5560902, -1.949203, -3.14973, 1, 1, 1, 1, 1,
-0.555694, -0.06842791, -0.709426, 1, 1, 1, 1, 1,
-0.5517943, 0.06600943, -2.595595, 1, 1, 1, 1, 1,
-0.5492923, 0.5646631, -1.046006, 1, 1, 1, 1, 1,
-0.5440574, -0.2727512, -4.604007, 1, 1, 1, 1, 1,
-0.5395848, -0.8440911, -3.140954, 1, 1, 1, 1, 1,
-0.5374614, -0.2563635, -1.35822, 0, 0, 1, 1, 1,
-0.5343027, 0.4983541, -0.4145901, 1, 0, 0, 1, 1,
-0.5291097, 0.234448, -0.6232834, 1, 0, 0, 1, 1,
-0.5283611, -0.07741696, -2.168861, 1, 0, 0, 1, 1,
-0.5237454, 1.276272, -0.3106429, 1, 0, 0, 1, 1,
-0.520919, 0.01836214, -3.749195, 1, 0, 0, 1, 1,
-0.5194577, -0.9027968, -3.424205, 0, 0, 0, 1, 1,
-0.5191661, -0.009269959, -0.7502242, 0, 0, 0, 1, 1,
-0.5167577, 2.279582, -1.094553, 0, 0, 0, 1, 1,
-0.5151613, -1.089345, -2.997405, 0, 0, 0, 1, 1,
-0.5138996, -0.3899229, 0.526399, 0, 0, 0, 1, 1,
-0.5103039, 0.7733953, -0.9735243, 0, 0, 0, 1, 1,
-0.5033042, -0.7639251, -4.147573, 0, 0, 0, 1, 1,
-0.5019941, 2.427047, 0.1876371, 1, 1, 1, 1, 1,
-0.5014102, 0.64294, -1.021562, 1, 1, 1, 1, 1,
-0.4953842, 0.1379474, -1.061597, 1, 1, 1, 1, 1,
-0.4947704, -0.2448321, -2.611575, 1, 1, 1, 1, 1,
-0.4926333, -0.1843187, -3.565977, 1, 1, 1, 1, 1,
-0.4920092, 2.35712, -0.1704896, 1, 1, 1, 1, 1,
-0.4863185, 0.5662026, -0.248897, 1, 1, 1, 1, 1,
-0.4857435, -1.770941, -4.61186, 1, 1, 1, 1, 1,
-0.4848918, 0.2372519, 0.285623, 1, 1, 1, 1, 1,
-0.4846429, -1.406831, -1.393076, 1, 1, 1, 1, 1,
-0.4843199, 0.8627497, -0.584976, 1, 1, 1, 1, 1,
-0.4807204, 0.9371703, -1.591645, 1, 1, 1, 1, 1,
-0.4769849, 1.678398, -2.715513, 1, 1, 1, 1, 1,
-0.4769201, 0.4348096, -2.827604, 1, 1, 1, 1, 1,
-0.4746082, 0.6676455, -0.7200999, 1, 1, 1, 1, 1,
-0.4678532, 0.9935966, -1.735869, 0, 0, 1, 1, 1,
-0.4634102, -1.158244, -1.561355, 1, 0, 0, 1, 1,
-0.4611204, 1.750059, -0.1334409, 1, 0, 0, 1, 1,
-0.4579903, 0.8587157, -0.9882907, 1, 0, 0, 1, 1,
-0.4562178, 0.031871, 0.6581762, 1, 0, 0, 1, 1,
-0.4538244, -0.9564497, -4.47781, 1, 0, 0, 1, 1,
-0.4497361, 1.007863, 0.05232731, 0, 0, 0, 1, 1,
-0.4447538, 0.9690486, -1.77983, 0, 0, 0, 1, 1,
-0.4413184, -0.4657032, -1.583288, 0, 0, 0, 1, 1,
-0.4319366, 0.2941839, -0.5833949, 0, 0, 0, 1, 1,
-0.4247103, 0.9547029, 0.6260961, 0, 0, 0, 1, 1,
-0.4242553, -0.2458074, -1.565563, 0, 0, 0, 1, 1,
-0.4239904, 0.6415721, 0.518286, 0, 0, 0, 1, 1,
-0.4217879, -0.861024, -2.950133, 1, 1, 1, 1, 1,
-0.4200907, 1.135259, -0.4836625, 1, 1, 1, 1, 1,
-0.4064496, -0.2732535, -2.375307, 1, 1, 1, 1, 1,
-0.4048665, -0.3400405, -1.566088, 1, 1, 1, 1, 1,
-0.3995856, 0.6811665, 0.5919445, 1, 1, 1, 1, 1,
-0.3979299, 0.305745, -0.6880732, 1, 1, 1, 1, 1,
-0.3965549, -1.243253, -1.743493, 1, 1, 1, 1, 1,
-0.3955188, 0.640228, -0.8749431, 1, 1, 1, 1, 1,
-0.393317, -0.7789146, -2.931751, 1, 1, 1, 1, 1,
-0.3920821, -0.5841498, -2.379659, 1, 1, 1, 1, 1,
-0.3828777, 1.805105, 0.9271115, 1, 1, 1, 1, 1,
-0.3822196, 1.058259, -1.683478, 1, 1, 1, 1, 1,
-0.3820684, -0.2645273, -2.582994, 1, 1, 1, 1, 1,
-0.376891, 2.250205, 0.5620883, 1, 1, 1, 1, 1,
-0.3747354, -0.9525267, -3.470276, 1, 1, 1, 1, 1,
-0.3716595, 0.3173312, 0.8088858, 0, 0, 1, 1, 1,
-0.3614262, -1.028001, -3.747373, 1, 0, 0, 1, 1,
-0.360389, 0.5312923, -1.152449, 1, 0, 0, 1, 1,
-0.359648, -1.431998, -1.923594, 1, 0, 0, 1, 1,
-0.3547659, 2.035654, 0.3341122, 1, 0, 0, 1, 1,
-0.3523109, 1.158742, 0.5344658, 1, 0, 0, 1, 1,
-0.3482504, 0.8843172, 0.3467293, 0, 0, 0, 1, 1,
-0.347533, 0.8063184, 0.2562793, 0, 0, 0, 1, 1,
-0.3449386, 0.361459, -0.9146903, 0, 0, 0, 1, 1,
-0.3429993, 0.2072915, -3.128505, 0, 0, 0, 1, 1,
-0.3418296, 0.1642408, -0.9573837, 0, 0, 0, 1, 1,
-0.3404303, 0.2515634, -1.865155, 0, 0, 0, 1, 1,
-0.3399947, -1.90424, -3.300804, 0, 0, 0, 1, 1,
-0.3395893, -0.1861535, -2.643075, 1, 1, 1, 1, 1,
-0.336664, -0.901456, -3.401214, 1, 1, 1, 1, 1,
-0.3361564, -0.4393207, -2.935818, 1, 1, 1, 1, 1,
-0.3341361, 1.458867, 0.1433226, 1, 1, 1, 1, 1,
-0.3306934, 1.677417, -0.3320841, 1, 1, 1, 1, 1,
-0.3302059, 0.9068744, -1.043331, 1, 1, 1, 1, 1,
-0.3295538, 0.857143, -0.855162, 1, 1, 1, 1, 1,
-0.3209886, -2.092393, -3.164784, 1, 1, 1, 1, 1,
-0.3194359, 0.9547992, -0.7317035, 1, 1, 1, 1, 1,
-0.3156, -0.409769, -2.898701, 1, 1, 1, 1, 1,
-0.3100449, 0.2670091, -4.787879, 1, 1, 1, 1, 1,
-0.3094391, 0.3576005, 0.7602739, 1, 1, 1, 1, 1,
-0.3065264, -0.1683264, -0.6715452, 1, 1, 1, 1, 1,
-0.3039084, -1.204643, -2.781502, 1, 1, 1, 1, 1,
-0.2988814, 1.033894, -1.538051, 1, 1, 1, 1, 1,
-0.2986352, 0.8824481, -1.064183, 0, 0, 1, 1, 1,
-0.2972158, 0.0802938, -1.946361, 1, 0, 0, 1, 1,
-0.2947712, 0.219493, -1.147906, 1, 0, 0, 1, 1,
-0.2924026, 0.1935188, -1.157257, 1, 0, 0, 1, 1,
-0.2901314, 1.526358, 0.5878193, 1, 0, 0, 1, 1,
-0.288821, 1.62989, -0.5898321, 1, 0, 0, 1, 1,
-0.2825652, -0.9260367, -4.662069, 0, 0, 0, 1, 1,
-0.2823025, 1.243048, -0.3642474, 0, 0, 0, 1, 1,
-0.2788405, 0.1418012, -0.2258654, 0, 0, 0, 1, 1,
-0.2764, 0.3058413, -0.3040175, 0, 0, 0, 1, 1,
-0.275594, -0.01259881, -1.602276, 0, 0, 0, 1, 1,
-0.2747639, -0.457828, -2.49915, 0, 0, 0, 1, 1,
-0.2709347, -1.493207, -3.063037, 0, 0, 0, 1, 1,
-0.2706646, 1.522949, 0.507507, 1, 1, 1, 1, 1,
-0.2687317, 1.010006, -0.2354281, 1, 1, 1, 1, 1,
-0.2649388, 1.832667, 0.7316482, 1, 1, 1, 1, 1,
-0.2645707, 0.9485259, -0.6222941, 1, 1, 1, 1, 1,
-0.2624926, -1.522685, -0.7643396, 1, 1, 1, 1, 1,
-0.2543577, 0.6140599, -0.6336396, 1, 1, 1, 1, 1,
-0.2540415, -0.1659176, -1.733122, 1, 1, 1, 1, 1,
-0.2529247, -0.9073289, -0.5154655, 1, 1, 1, 1, 1,
-0.2522134, -2.068331, -2.071074, 1, 1, 1, 1, 1,
-0.2498637, -1.681234, -3.209533, 1, 1, 1, 1, 1,
-0.2491841, -0.8202517, -3.371537, 1, 1, 1, 1, 1,
-0.2410334, -0.2345908, -3.858472, 1, 1, 1, 1, 1,
-0.2362348, 1.807514, 1.950336, 1, 1, 1, 1, 1,
-0.2339691, 1.140743, -0.9234452, 1, 1, 1, 1, 1,
-0.2323135, -0.2149098, -2.451835, 1, 1, 1, 1, 1,
-0.2283234, -0.02406709, -3.369314, 0, 0, 1, 1, 1,
-0.2211505, 0.1784257, -1.1696, 1, 0, 0, 1, 1,
-0.2170372, 0.8707113, -0.8578094, 1, 0, 0, 1, 1,
-0.2135013, -0.857419, -3.341834, 1, 0, 0, 1, 1,
-0.2019013, -0.8641452, -2.299699, 1, 0, 0, 1, 1,
-0.2018737, 0.2788567, -1.432517, 1, 0, 0, 1, 1,
-0.2009812, -1.868741, -2.851827, 0, 0, 0, 1, 1,
-0.2006954, -1.611935, -3.131779, 0, 0, 0, 1, 1,
-0.1983088, -0.08390845, -2.44649, 0, 0, 0, 1, 1,
-0.1968879, 1.046523, -0.5965213, 0, 0, 0, 1, 1,
-0.1960337, 0.2232286, -0.6845881, 0, 0, 0, 1, 1,
-0.1948869, -1.212224, -3.655062, 0, 0, 0, 1, 1,
-0.193797, 0.6530545, 0.636575, 0, 0, 0, 1, 1,
-0.191657, -0.2814387, -0.2892922, 1, 1, 1, 1, 1,
-0.1897245, 0.1181823, -0.4709092, 1, 1, 1, 1, 1,
-0.1894414, 0.1365376, -2.216939, 1, 1, 1, 1, 1,
-0.1865599, -1.483504, -1.642982, 1, 1, 1, 1, 1,
-0.1826231, -0.3540255, -3.272, 1, 1, 1, 1, 1,
-0.1823542, -0.4101056, -1.976777, 1, 1, 1, 1, 1,
-0.1818572, 0.2245305, -0.1704849, 1, 1, 1, 1, 1,
-0.1784906, -0.949111, -2.920672, 1, 1, 1, 1, 1,
-0.1783699, -0.2559187, -0.8235498, 1, 1, 1, 1, 1,
-0.1773296, -0.2474355, -4.432305, 1, 1, 1, 1, 1,
-0.1752788, -0.1545664, -4.387304, 1, 1, 1, 1, 1,
-0.174472, 1.292091, 1.019065, 1, 1, 1, 1, 1,
-0.1723643, -0.7242433, -2.503687, 1, 1, 1, 1, 1,
-0.1614952, 1.195578, -0.5204386, 1, 1, 1, 1, 1,
-0.1612681, 1.530052, -1.684805, 1, 1, 1, 1, 1,
-0.1608336, 1.558006, 1.236106, 0, 0, 1, 1, 1,
-0.1607381, 0.05361277, -3.00591, 1, 0, 0, 1, 1,
-0.159695, 0.5673705, -0.438075, 1, 0, 0, 1, 1,
-0.1557032, 0.8255137, 1.103501, 1, 0, 0, 1, 1,
-0.1463329, 1.125978, -0.4314, 1, 0, 0, 1, 1,
-0.1446849, -1.268566, -3.532202, 1, 0, 0, 1, 1,
-0.1445581, 0.1734672, 0.8725516, 0, 0, 0, 1, 1,
-0.1399762, -0.4428638, -3.762631, 0, 0, 0, 1, 1,
-0.1365169, -0.3747944, -1.980746, 0, 0, 0, 1, 1,
-0.1352168, -1.320786, -3.902729, 0, 0, 0, 1, 1,
-0.1347415, -1.580052, -3.007324, 0, 0, 0, 1, 1,
-0.1332616, 0.9148867, -1.118189, 0, 0, 0, 1, 1,
-0.1322499, 0.18523, -1.065682, 0, 0, 0, 1, 1,
-0.1266778, 0.4100316, -0.2017378, 1, 1, 1, 1, 1,
-0.1254873, 1.247294, -1.057516, 1, 1, 1, 1, 1,
-0.1251446, 0.5875796, 1.64197, 1, 1, 1, 1, 1,
-0.1204257, -0.3191706, -2.556346, 1, 1, 1, 1, 1,
-0.1176791, 0.4966543, -1.679296, 1, 1, 1, 1, 1,
-0.1161854, -2.868448, -2.237174, 1, 1, 1, 1, 1,
-0.115729, 2.510149, -0.2105725, 1, 1, 1, 1, 1,
-0.1155818, -0.623568, -1.032956, 1, 1, 1, 1, 1,
-0.1143892, -0.2633473, -4.106545, 1, 1, 1, 1, 1,
-0.1143846, 1.294607, 1.744707, 1, 1, 1, 1, 1,
-0.1054535, -0.7629908, -1.62531, 1, 1, 1, 1, 1,
-0.1041626, 0.3657225, -0.2836344, 1, 1, 1, 1, 1,
-0.09716009, 0.322111, 0.1138451, 1, 1, 1, 1, 1,
-0.09586442, 0.2446427, -0.9580127, 1, 1, 1, 1, 1,
-0.09537892, -0.5481928, -2.601424, 1, 1, 1, 1, 1,
-0.09389099, 0.4475107, -1.23367, 0, 0, 1, 1, 1,
-0.09176017, -0.6427857, -1.971393, 1, 0, 0, 1, 1,
-0.08153039, 1.204818, 0.2757252, 1, 0, 0, 1, 1,
-0.08137763, -1.370044, -4.535064, 1, 0, 0, 1, 1,
-0.08134751, -0.2803311, -4.828188, 1, 0, 0, 1, 1,
-0.08090384, 1.774468, 0.1426285, 1, 0, 0, 1, 1,
-0.07526781, -0.3327774, -3.445988, 0, 0, 0, 1, 1,
-0.07008626, 0.3671667, -0.9583868, 0, 0, 0, 1, 1,
-0.06412853, 0.4291427, 0.1555889, 0, 0, 0, 1, 1,
-0.06351645, -0.1447147, -2.565185, 0, 0, 0, 1, 1,
-0.06152933, -1.576365, -3.391567, 0, 0, 0, 1, 1,
-0.06066849, 0.675635, 1.742478, 0, 0, 0, 1, 1,
-0.05296955, 0.1664714, -0.3775324, 0, 0, 0, 1, 1,
-0.05169673, -0.1044877, -2.594626, 1, 1, 1, 1, 1,
-0.05061748, 0.5470909, -1.184942, 1, 1, 1, 1, 1,
-0.04648915, -0.5905986, -1.961784, 1, 1, 1, 1, 1,
-0.04280337, 0.1527183, -0.4502966, 1, 1, 1, 1, 1,
-0.04223885, 0.6073011, 0.4168761, 1, 1, 1, 1, 1,
-0.04203666, 1.501243, 0.3018523, 1, 1, 1, 1, 1,
-0.03740273, -0.5234618, -2.903449, 1, 1, 1, 1, 1,
-0.03159044, -0.4290439, -2.491427, 1, 1, 1, 1, 1,
-0.03030235, 2.359329, -0.217595, 1, 1, 1, 1, 1,
-0.02962924, 0.693136, -1.424448, 1, 1, 1, 1, 1,
-0.02759865, -1.072719, -1.021836, 1, 1, 1, 1, 1,
-0.02669178, 0.1006516, 0.5721394, 1, 1, 1, 1, 1,
-0.02389009, 1.350797, 0.5892448, 1, 1, 1, 1, 1,
-0.02381967, 0.591938, 1.111603, 1, 1, 1, 1, 1,
-0.02322475, 0.8173125, -0.8565393, 1, 1, 1, 1, 1,
-0.02033749, -1.261759, -1.191477, 0, 0, 1, 1, 1,
-0.01652093, -0.4250664, -3.685982, 1, 0, 0, 1, 1,
-0.01374212, 0.05951158, 0.5885176, 1, 0, 0, 1, 1,
-0.005874674, 0.408174, 1.568506, 1, 0, 0, 1, 1,
-0.003002473, -0.04769954, -1.644335, 1, 0, 0, 1, 1,
0.008212556, 2.433574, -1.315709, 1, 0, 0, 1, 1,
0.008872404, -1.86757, 4.481545, 0, 0, 0, 1, 1,
0.00960642, -1.120433, 1.959321, 0, 0, 0, 1, 1,
0.01010047, -0.158254, 2.243873, 0, 0, 0, 1, 1,
0.01386915, 0.2773, 0.683709, 0, 0, 0, 1, 1,
0.0169451, 0.6974897, -1.459554, 0, 0, 0, 1, 1,
0.0188273, -0.884865, 4.434091, 0, 0, 0, 1, 1,
0.02034199, 0.9211819, -1.303684, 0, 0, 0, 1, 1,
0.02047168, 1.453512, -0.5337546, 1, 1, 1, 1, 1,
0.02320456, -2.022392, 3.525464, 1, 1, 1, 1, 1,
0.0233575, 1.313761, -0.2912737, 1, 1, 1, 1, 1,
0.02553794, 0.400409, 1.656677, 1, 1, 1, 1, 1,
0.0256722, 1.892702, -0.446564, 1, 1, 1, 1, 1,
0.02577297, 1.85261, -1.192757, 1, 1, 1, 1, 1,
0.02653964, -0.03613266, 2.124825, 1, 1, 1, 1, 1,
0.02704824, 2.447743, 0.772406, 1, 1, 1, 1, 1,
0.02764695, -0.6203243, 3.538664, 1, 1, 1, 1, 1,
0.0281323, -0.06076769, 4.156273, 1, 1, 1, 1, 1,
0.03203707, 1.089226, -0.7760445, 1, 1, 1, 1, 1,
0.03477365, 0.9600852, -1.169856, 1, 1, 1, 1, 1,
0.03538058, -0.9837236, 3.819289, 1, 1, 1, 1, 1,
0.03647083, 1.376149, 0.07161487, 1, 1, 1, 1, 1,
0.03958203, 0.04338383, -0.9332203, 1, 1, 1, 1, 1,
0.04323854, 1.866397, -0.1225194, 0, 0, 1, 1, 1,
0.04355463, -0.8019971, 2.134015, 1, 0, 0, 1, 1,
0.0459046, -0.01618836, 2.577389, 1, 0, 0, 1, 1,
0.04765788, 0.66991, -0.5024465, 1, 0, 0, 1, 1,
0.04773573, -0.5084005, 2.436437, 1, 0, 0, 1, 1,
0.05271421, -0.7983391, 4.46889, 1, 0, 0, 1, 1,
0.05360775, -1.165519, 1.83558, 0, 0, 0, 1, 1,
0.05517923, -1.504264, 3.046114, 0, 0, 0, 1, 1,
0.05753082, -0.2720221, 4.343514, 0, 0, 0, 1, 1,
0.05851019, -0.189864, 2.941585, 0, 0, 0, 1, 1,
0.0593868, -1.626244, 1.961822, 0, 0, 0, 1, 1,
0.06257483, 0.6365874, 1.846632, 0, 0, 0, 1, 1,
0.06333211, -0.6134052, 3.775823, 0, 0, 0, 1, 1,
0.06812911, -0.838081, 3.801798, 1, 1, 1, 1, 1,
0.07135249, 0.6594883, 1.942516, 1, 1, 1, 1, 1,
0.07530278, -0.7328762, 3.651714, 1, 1, 1, 1, 1,
0.07711502, 1.180766, 1.155448, 1, 1, 1, 1, 1,
0.07764767, -2.688339, 3.636701, 1, 1, 1, 1, 1,
0.07910687, -0.1698977, 2.849901, 1, 1, 1, 1, 1,
0.08318569, 0.6131361, 0.7157992, 1, 1, 1, 1, 1,
0.086782, -0.7014393, 2.137687, 1, 1, 1, 1, 1,
0.08889695, 2.070104, 0.4396303, 1, 1, 1, 1, 1,
0.09799252, -0.632036, 2.950001, 1, 1, 1, 1, 1,
0.1049183, 0.6750157, 0.1614557, 1, 1, 1, 1, 1,
0.1077009, -0.2356211, 2.725692, 1, 1, 1, 1, 1,
0.1083885, 0.3962712, 0.4541755, 1, 1, 1, 1, 1,
0.1273112, -0.4714943, 2.527113, 1, 1, 1, 1, 1,
0.1333253, 0.1099137, 0.08686038, 1, 1, 1, 1, 1,
0.1334619, 1.661152, -0.8517302, 0, 0, 1, 1, 1,
0.1355898, 0.1534, -0.07646748, 1, 0, 0, 1, 1,
0.1365626, -1.248129, 3.8716, 1, 0, 0, 1, 1,
0.1468254, 1.052899, -0.6317075, 1, 0, 0, 1, 1,
0.1468897, 0.1122913, 1.802485, 1, 0, 0, 1, 1,
0.1481854, 0.3631892, 0.7545152, 1, 0, 0, 1, 1,
0.1490658, 1.694109, -0.6348178, 0, 0, 0, 1, 1,
0.1499161, -1.184654, 1.868529, 0, 0, 0, 1, 1,
0.150665, -0.8083786, 3.149797, 0, 0, 0, 1, 1,
0.1544354, -1.267513, 3.440483, 0, 0, 0, 1, 1,
0.1559347, -2.048903, 0.9491997, 0, 0, 0, 1, 1,
0.1623765, -1.221319, 2.315457, 0, 0, 0, 1, 1,
0.1645252, -0.2335311, -0.4399448, 0, 0, 0, 1, 1,
0.1664428, 1.8388, -1.17525, 1, 1, 1, 1, 1,
0.1720617, 1.281139, 1.105266, 1, 1, 1, 1, 1,
0.1749948, -0.3516509, 3.194985, 1, 1, 1, 1, 1,
0.1771794, 0.9758869, -0.6936383, 1, 1, 1, 1, 1,
0.1790264, 0.2020669, -1.498747, 1, 1, 1, 1, 1,
0.1810499, -0.2463959, 1.140972, 1, 1, 1, 1, 1,
0.1853783, 1.353461, 0.2838038, 1, 1, 1, 1, 1,
0.1879186, -0.1654001, 3.160393, 1, 1, 1, 1, 1,
0.1901723, -0.8395016, 3.3628, 1, 1, 1, 1, 1,
0.1920817, -0.292697, 1.697297, 1, 1, 1, 1, 1,
0.1960264, -0.5150955, 0.8312755, 1, 1, 1, 1, 1,
0.1972601, 0.1497644, 0.5171083, 1, 1, 1, 1, 1,
0.198583, -1.495967, 3.282006, 1, 1, 1, 1, 1,
0.2105748, -1.505805, 4.465182, 1, 1, 1, 1, 1,
0.2116555, 0.378396, -1.247134, 1, 1, 1, 1, 1,
0.2142564, 0.04808276, 0.8329292, 0, 0, 1, 1, 1,
0.2143461, 0.3000088, 1.545297, 1, 0, 0, 1, 1,
0.2180124, 0.5649821, -0.8068404, 1, 0, 0, 1, 1,
0.2180659, 0.8278688, -1.537359, 1, 0, 0, 1, 1,
0.2223811, -0.6393497, 3.516743, 1, 0, 0, 1, 1,
0.226373, 1.607611, -0.4866651, 1, 0, 0, 1, 1,
0.2303358, 1.523126, -0.4980145, 0, 0, 0, 1, 1,
0.2303661, 1.006886, 0.4267693, 0, 0, 0, 1, 1,
0.2312268, 0.2303083, 1.837749, 0, 0, 0, 1, 1,
0.2335052, 1.365677, 0.8598554, 0, 0, 0, 1, 1,
0.2342108, -0.4359638, 3.182621, 0, 0, 0, 1, 1,
0.2397814, 1.538393, 0.06716316, 0, 0, 0, 1, 1,
0.2424503, 0.07768664, 4.487985, 0, 0, 0, 1, 1,
0.2512756, 0.1362234, 0.9418972, 1, 1, 1, 1, 1,
0.2522064, -1.895862, 3.095667, 1, 1, 1, 1, 1,
0.2525464, 0.03623876, 0.6974847, 1, 1, 1, 1, 1,
0.2534978, -0.1279729, 0.9409249, 1, 1, 1, 1, 1,
0.2577677, -1.500621, 1.136063, 1, 1, 1, 1, 1,
0.2587689, 0.4787407, 1.251589, 1, 1, 1, 1, 1,
0.2591, -0.1121674, 1.096787, 1, 1, 1, 1, 1,
0.2596676, -0.551443, 3.333486, 1, 1, 1, 1, 1,
0.2614034, 0.09035375, 1.864932, 1, 1, 1, 1, 1,
0.2640952, -2.41302, 2.304013, 1, 1, 1, 1, 1,
0.2642038, 0.1328179, 1.278606, 1, 1, 1, 1, 1,
0.2660704, -1.367709, 1.161092, 1, 1, 1, 1, 1,
0.2701472, -0.1633488, 1.909412, 1, 1, 1, 1, 1,
0.2714708, 0.5068802, 0.7638865, 1, 1, 1, 1, 1,
0.2768243, -0.854391, 4.267206, 1, 1, 1, 1, 1,
0.277768, 0.7732821, -1.132695, 0, 0, 1, 1, 1,
0.2818728, -1.768922, 2.843038, 1, 0, 0, 1, 1,
0.2821062, -0.1283143, 2.202677, 1, 0, 0, 1, 1,
0.2889397, -1.496848, 2.359958, 1, 0, 0, 1, 1,
0.2925617, -1.327463, 4.832281, 1, 0, 0, 1, 1,
0.2929289, 0.5029087, 1.182055, 1, 0, 0, 1, 1,
0.2961447, -2.32131, 3.803885, 0, 0, 0, 1, 1,
0.3013955, -0.1327883, 0.510923, 0, 0, 0, 1, 1,
0.3087981, -0.8990844, 1.091737, 0, 0, 0, 1, 1,
0.3096757, -0.2776811, 1.07172, 0, 0, 0, 1, 1,
0.3122961, 0.1456718, 1.210178, 0, 0, 0, 1, 1,
0.3133935, 0.8536233, 2.029138, 0, 0, 0, 1, 1,
0.3138106, 1.94956, 1.679679, 0, 0, 0, 1, 1,
0.3200457, 1.432433, -0.1838247, 1, 1, 1, 1, 1,
0.3218654, -0.3507137, 2.444335, 1, 1, 1, 1, 1,
0.324781, 2.104497, 0.07206665, 1, 1, 1, 1, 1,
0.3294356, 1.83703, 0.3169789, 1, 1, 1, 1, 1,
0.3327525, -0.651572, 3.84144, 1, 1, 1, 1, 1,
0.3336137, 0.8138877, 2.483565, 1, 1, 1, 1, 1,
0.3353813, 0.5451109, -0.06254869, 1, 1, 1, 1, 1,
0.3400466, -0.03950517, 1.51574, 1, 1, 1, 1, 1,
0.343036, 0.6639012, 2.613117, 1, 1, 1, 1, 1,
0.3440489, 0.8381349, -0.4548618, 1, 1, 1, 1, 1,
0.3485041, -0.8491711, 2.702811, 1, 1, 1, 1, 1,
0.3507639, -0.4725738, 3.518838, 1, 1, 1, 1, 1,
0.350989, 0.6441696, -1.609972, 1, 1, 1, 1, 1,
0.3531668, -1.579248, 2.329251, 1, 1, 1, 1, 1,
0.3548939, 1.18862, -0.2415971, 1, 1, 1, 1, 1,
0.3550642, 1.116261, -0.1476572, 0, 0, 1, 1, 1,
0.3552847, 0.7021625, -0.395749, 1, 0, 0, 1, 1,
0.3569623, 1.056512, 0.8080165, 1, 0, 0, 1, 1,
0.3572289, 0.3829167, 0.1228602, 1, 0, 0, 1, 1,
0.3580919, -0.8667122, 3.584622, 1, 0, 0, 1, 1,
0.3593107, -0.2511482, 1.911095, 1, 0, 0, 1, 1,
0.3656242, 0.5194147, 1.452778, 0, 0, 0, 1, 1,
0.3706847, -0.4441153, 2.899929, 0, 0, 0, 1, 1,
0.3794944, 0.2124481, 1.106126, 0, 0, 0, 1, 1,
0.3909511, -0.4941404, 3.385727, 0, 0, 0, 1, 1,
0.3922331, 1.856913, 0.8228043, 0, 0, 0, 1, 1,
0.3926696, -0.45529, 1.74511, 0, 0, 0, 1, 1,
0.3968959, 2.459561, 0.6008593, 0, 0, 0, 1, 1,
0.3990718, -0.7833657, 3.518108, 1, 1, 1, 1, 1,
0.4005069, -0.03778929, 1.817307, 1, 1, 1, 1, 1,
0.4028828, -1.718102, 1.921898, 1, 1, 1, 1, 1,
0.4051618, 1.763163, 1.15, 1, 1, 1, 1, 1,
0.4071814, -0.5045586, 1.686708, 1, 1, 1, 1, 1,
0.4087414, 2.204965, 0.712231, 1, 1, 1, 1, 1,
0.409158, -0.05474672, 1.889872, 1, 1, 1, 1, 1,
0.4102607, -1.07569, 1.702015, 1, 1, 1, 1, 1,
0.4205377, 0.1356863, 0.0861023, 1, 1, 1, 1, 1,
0.4227673, -0.563867, 1.973549, 1, 1, 1, 1, 1,
0.4243156, -0.3567096, 1.622713, 1, 1, 1, 1, 1,
0.4268326, 0.2496002, 1.630293, 1, 1, 1, 1, 1,
0.427532, -1.740404, 2.09549, 1, 1, 1, 1, 1,
0.4286219, -0.7498201, 1.806364, 1, 1, 1, 1, 1,
0.4293436, -0.9681743, 2.846316, 1, 1, 1, 1, 1,
0.4311286, -0.1352068, 2.348989, 0, 0, 1, 1, 1,
0.4315071, 0.8297384, 1.320326, 1, 0, 0, 1, 1,
0.4433784, -0.2409597, 1.909458, 1, 0, 0, 1, 1,
0.4435531, 0.008032124, 2.833009, 1, 0, 0, 1, 1,
0.447435, 0.39284, 0.7738374, 1, 0, 0, 1, 1,
0.4513736, 1.174481, 0.6700971, 1, 0, 0, 1, 1,
0.4516634, 1.336953, 0.8531902, 0, 0, 0, 1, 1,
0.4548689, -0.3921322, 2.057426, 0, 0, 0, 1, 1,
0.4549085, -0.1452758, 0.7464305, 0, 0, 0, 1, 1,
0.467084, -0.1114171, 2.527124, 0, 0, 0, 1, 1,
0.4672115, -0.06893496, 1.29604, 0, 0, 0, 1, 1,
0.4679553, -0.4230401, 2.882085, 0, 0, 0, 1, 1,
0.4693414, 0.364154, 0.9449555, 0, 0, 0, 1, 1,
0.4707757, 1.400934, -0.4639782, 1, 1, 1, 1, 1,
0.4801447, -0.7268946, 2.192078, 1, 1, 1, 1, 1,
0.4813209, 0.4942378, 1.545495, 1, 1, 1, 1, 1,
0.4834894, 0.49143, 1.074961, 1, 1, 1, 1, 1,
0.4955506, 0.2980044, 1.825243, 1, 1, 1, 1, 1,
0.4956037, 1.089586, 1.117238, 1, 1, 1, 1, 1,
0.4987777, 1.116567, 0.5893897, 1, 1, 1, 1, 1,
0.500893, -0.5042098, 2.940907, 1, 1, 1, 1, 1,
0.5026831, 0.5194578, 1.191937, 1, 1, 1, 1, 1,
0.5040349, -0.6285263, 0.4736284, 1, 1, 1, 1, 1,
0.5070483, -0.06166, 1.750242, 1, 1, 1, 1, 1,
0.5089543, -1.647017, 3.13413, 1, 1, 1, 1, 1,
0.5096672, -0.6296647, 3.365138, 1, 1, 1, 1, 1,
0.5139748, 1.055295, -0.292097, 1, 1, 1, 1, 1,
0.5163227, -0.3168818, 2.619204, 1, 1, 1, 1, 1,
0.5194682, -0.3644814, 2.636715, 0, 0, 1, 1, 1,
0.5201674, 0.002199648, 1.283725, 1, 0, 0, 1, 1,
0.5208057, -0.6214686, 3.161726, 1, 0, 0, 1, 1,
0.5213906, -2.063595, 2.590398, 1, 0, 0, 1, 1,
0.5237056, -0.4825146, 3.534966, 1, 0, 0, 1, 1,
0.529198, 1.116289, 0.3898485, 1, 0, 0, 1, 1,
0.5293319, 0.4403832, 1.690375, 0, 0, 0, 1, 1,
0.5370181, 0.7945023, 0.339626, 0, 0, 0, 1, 1,
0.5421885, 1.208591, 1.59259, 0, 0, 0, 1, 1,
0.5465717, 0.1900197, 1.713924, 0, 0, 0, 1, 1,
0.5476147, -1.57157, 3.270035, 0, 0, 0, 1, 1,
0.5505672, -0.7705615, 1.449684, 0, 0, 0, 1, 1,
0.5511057, -0.5196239, 1.157513, 0, 0, 0, 1, 1,
0.5592988, 2.048036, -1.16077, 1, 1, 1, 1, 1,
0.5613264, -0.1099066, 0.6524313, 1, 1, 1, 1, 1,
0.5640578, -2.390085, 3.575295, 1, 1, 1, 1, 1,
0.5643263, -0.2646852, 2.460477, 1, 1, 1, 1, 1,
0.5652434, -0.4312745, 1.36505, 1, 1, 1, 1, 1,
0.5666544, -1.422766, 3.160354, 1, 1, 1, 1, 1,
0.5723199, 0.4051585, 1.921328, 1, 1, 1, 1, 1,
0.5828965, 0.06844796, 2.17078, 1, 1, 1, 1, 1,
0.5928263, -0.1242232, 0.7173054, 1, 1, 1, 1, 1,
0.5989538, -0.3075696, 3.216213, 1, 1, 1, 1, 1,
0.6000845, 1.577417, 0.3959562, 1, 1, 1, 1, 1,
0.6007814, 1.649361, -0.004177957, 1, 1, 1, 1, 1,
0.6052825, 0.522698, -0.4068764, 1, 1, 1, 1, 1,
0.6054883, -0.1803361, -0.9330859, 1, 1, 1, 1, 1,
0.6071824, -1.230661, 2.261694, 1, 1, 1, 1, 1,
0.6075996, 0.5030494, 0.7975886, 0, 0, 1, 1, 1,
0.6083661, -0.02336158, 3.548394, 1, 0, 0, 1, 1,
0.6105615, 0.4794653, 0.2299514, 1, 0, 0, 1, 1,
0.6137183, -2.036952, 2.752712, 1, 0, 0, 1, 1,
0.6174668, 0.6730201, 0.6873168, 1, 0, 0, 1, 1,
0.6178225, -0.9806405, 3.104386, 1, 0, 0, 1, 1,
0.6188754, 1.05608, 1.291655, 0, 0, 0, 1, 1,
0.6201251, 1.180678, -1.157068, 0, 0, 0, 1, 1,
0.622898, -0.2405488, 1.265686, 0, 0, 0, 1, 1,
0.6290032, -0.2774822, 0.7567933, 0, 0, 0, 1, 1,
0.6300973, 2.039945, -2.027676, 0, 0, 0, 1, 1,
0.6380715, 0.7292767, 2.030699, 0, 0, 0, 1, 1,
0.6395256, -0.565901, 2.045321, 0, 0, 0, 1, 1,
0.6408117, -0.3613053, 2.21967, 1, 1, 1, 1, 1,
0.6427857, 0.5333478, 1.647888, 1, 1, 1, 1, 1,
0.6467255, 0.6104139, -0.2378185, 1, 1, 1, 1, 1,
0.6510717, -0.7205475, 4.547392, 1, 1, 1, 1, 1,
0.6540326, 0.6008106, 0.6146049, 1, 1, 1, 1, 1,
0.6596014, -0.5330312, 2.539084, 1, 1, 1, 1, 1,
0.6631491, 0.9630581, 0.9813096, 1, 1, 1, 1, 1,
0.6631701, -1.494729, 3.687622, 1, 1, 1, 1, 1,
0.6668637, 1.859702, 2.089564, 1, 1, 1, 1, 1,
0.6678848, -1.175863, 1.332955, 1, 1, 1, 1, 1,
0.6698716, -0.6834695, 2.581164, 1, 1, 1, 1, 1,
0.669919, -2.321365, 3.454399, 1, 1, 1, 1, 1,
0.6721165, 1.403323, -0.6698977, 1, 1, 1, 1, 1,
0.6730753, 0.5399861, 0.6469362, 1, 1, 1, 1, 1,
0.6805662, 0.4193148, 1.45853, 1, 1, 1, 1, 1,
0.6813036, -1.088328, 2.433018, 0, 0, 1, 1, 1,
0.6919731, 0.06063948, 2.338045, 1, 0, 0, 1, 1,
0.6951317, -1.63414, 1.731991, 1, 0, 0, 1, 1,
0.7099991, -1.252359, 1.829312, 1, 0, 0, 1, 1,
0.7101846, -0.5786922, 1.894993, 1, 0, 0, 1, 1,
0.712897, -0.5321848, 2.04739, 1, 0, 0, 1, 1,
0.7178835, 1.194412, -0.3041039, 0, 0, 0, 1, 1,
0.7197559, 0.4332648, 0.3885116, 0, 0, 0, 1, 1,
0.7223527, 0.3902802, 1.143945, 0, 0, 0, 1, 1,
0.7252858, -0.5703827, 1.004794, 0, 0, 0, 1, 1,
0.7269134, 0.6483213, -0.6918566, 0, 0, 0, 1, 1,
0.730174, 0.1827032, 1.632467, 0, 0, 0, 1, 1,
0.7354034, 1.069553, 0.4921102, 0, 0, 0, 1, 1,
0.7414143, -0.71483, 1.276747, 1, 1, 1, 1, 1,
0.7495557, 0.9408132, -1.572255, 1, 1, 1, 1, 1,
0.7502994, -1.729227, 2.497632, 1, 1, 1, 1, 1,
0.7549372, 0.4614204, 1.358248, 1, 1, 1, 1, 1,
0.7658734, -0.6645423, 1.836357, 1, 1, 1, 1, 1,
0.7718803, 2.063943, 1.234049, 1, 1, 1, 1, 1,
0.7741351, 1.007487, 0.3374893, 1, 1, 1, 1, 1,
0.7824945, -1.568468, 1.387625, 1, 1, 1, 1, 1,
0.7827682, -0.5776085, 3.239733, 1, 1, 1, 1, 1,
0.7852519, 0.6865425, -2.26146, 1, 1, 1, 1, 1,
0.7877166, 0.7368584, -0.7232758, 1, 1, 1, 1, 1,
0.7914223, 0.6969326, 2.141071, 1, 1, 1, 1, 1,
0.7915664, 1.894347, 1.352495, 1, 1, 1, 1, 1,
0.7930005, -0.4899673, 4.699277, 1, 1, 1, 1, 1,
0.7955396, -0.02728738, 2.641188, 1, 1, 1, 1, 1,
0.805277, -0.2049359, 1.604041, 0, 0, 1, 1, 1,
0.8065519, 0.1604503, 1.586819, 1, 0, 0, 1, 1,
0.8098369, 0.05641608, 0.8907756, 1, 0, 0, 1, 1,
0.8133306, -1.483855, 3.262311, 1, 0, 0, 1, 1,
0.8135965, 0.8736455, 0.9031302, 1, 0, 0, 1, 1,
0.8158268, 0.9282097, 0.9688865, 1, 0, 0, 1, 1,
0.8179442, 2.717901, -0.8029371, 0, 0, 0, 1, 1,
0.8293698, 1.563189, 0.9976048, 0, 0, 0, 1, 1,
0.8387144, -1.898511, 3.062448, 0, 0, 0, 1, 1,
0.8417549, -0.8045746, 1.011139, 0, 0, 0, 1, 1,
0.8469566, 0.3028309, 0.8570363, 0, 0, 0, 1, 1,
0.8483475, -0.211491, 2.802424, 0, 0, 0, 1, 1,
0.8510983, -0.6114931, 2.498813, 0, 0, 0, 1, 1,
0.8545216, 1.826843, -0.02631108, 1, 1, 1, 1, 1,
0.8574435, 0.4406842, 0.3396556, 1, 1, 1, 1, 1,
0.858999, 0.3182963, 1.725177, 1, 1, 1, 1, 1,
0.8642088, -0.8956248, 3.282161, 1, 1, 1, 1, 1,
0.8733609, 0.6505958, 0.2116273, 1, 1, 1, 1, 1,
0.8777466, 0.1888678, -0.03770357, 1, 1, 1, 1, 1,
0.8796795, -0.7963234, 2.634267, 1, 1, 1, 1, 1,
0.8804845, -0.7049862, 2.18394, 1, 1, 1, 1, 1,
0.8878323, 0.4187648, 1.82186, 1, 1, 1, 1, 1,
0.8888109, -1.382535, 2.961524, 1, 1, 1, 1, 1,
0.8893304, -0.5110282, 3.562133, 1, 1, 1, 1, 1,
0.8904023, 1.05385, 0.07644393, 1, 1, 1, 1, 1,
0.8947572, 2.957012, 0.00915515, 1, 1, 1, 1, 1,
0.898425, 0.3995853, 1.237344, 1, 1, 1, 1, 1,
0.9038066, -2.019827, 1.319243, 1, 1, 1, 1, 1,
0.91147, 0.4042215, 0.967811, 0, 0, 1, 1, 1,
0.9121813, 0.303778, 0.9645915, 1, 0, 0, 1, 1,
0.9211952, -0.8641704, 1.106448, 1, 0, 0, 1, 1,
0.9219682, 0.320585, -0.2163076, 1, 0, 0, 1, 1,
0.9241331, 0.3033038, 2.351825, 1, 0, 0, 1, 1,
0.9248794, 0.2805219, 1.010321, 1, 0, 0, 1, 1,
0.9267858, 0.9884609, 0.1678092, 0, 0, 0, 1, 1,
0.9313527, 0.3903011, 2.543196, 0, 0, 0, 1, 1,
0.9339687, 0.226115, 0.4757865, 0, 0, 0, 1, 1,
0.9341705, 0.005620579, 1.756933, 0, 0, 0, 1, 1,
0.9344127, 0.9380591, 2.337927, 0, 0, 0, 1, 1,
0.9415779, 2.020563, 0.5996482, 0, 0, 0, 1, 1,
0.9419403, 1.867957, -0.3283022, 0, 0, 0, 1, 1,
0.9442451, 0.4114203, 0.08399673, 1, 1, 1, 1, 1,
0.945871, 1.262496, -0.3997459, 1, 1, 1, 1, 1,
0.9474102, 1.483325, 0.6684971, 1, 1, 1, 1, 1,
0.9486778, -0.7010529, 2.111869, 1, 1, 1, 1, 1,
0.9508683, -0.872512, 3.262574, 1, 1, 1, 1, 1,
0.9535887, -1.11819, 1.970406, 1, 1, 1, 1, 1,
0.9536213, -1.363111, 3.767991, 1, 1, 1, 1, 1,
0.9539644, -0.9140137, 3.546495, 1, 1, 1, 1, 1,
0.9615169, 0.8242639, 1.836042, 1, 1, 1, 1, 1,
0.962259, 0.2194221, 1.169175, 1, 1, 1, 1, 1,
0.9650224, 0.1673598, 1.801944, 1, 1, 1, 1, 1,
0.9650507, 0.8720545, 0.5716614, 1, 1, 1, 1, 1,
0.965268, 0.836184, 1.585888, 1, 1, 1, 1, 1,
0.9681706, 0.2000438, 0.5814651, 1, 1, 1, 1, 1,
0.9695713, -0.176687, 1.025804, 1, 1, 1, 1, 1,
0.9711465, 0.2803237, 0.2179892, 0, 0, 1, 1, 1,
0.9718615, 0.3131801, 1.180428, 1, 0, 0, 1, 1,
0.9747932, -0.1859921, 0.1518669, 1, 0, 0, 1, 1,
0.9793085, -0.6985497, 3.125299, 1, 0, 0, 1, 1,
0.9812078, -0.9261048, 3.274684, 1, 0, 0, 1, 1,
0.9829509, 2.033359, 1.117679, 1, 0, 0, 1, 1,
0.9863716, 0.2391998, 2.847623, 0, 0, 0, 1, 1,
0.9883276, 2.659063, 3.201238, 0, 0, 0, 1, 1,
0.9910539, -0.7389777, 2.389489, 0, 0, 0, 1, 1,
0.9946402, 1.071938, 2.555457, 0, 0, 0, 1, 1,
1.004716, -0.04435473, 0.2693912, 0, 0, 0, 1, 1,
1.020717, -0.3367958, 2.615363, 0, 0, 0, 1, 1,
1.022372, -0.123544, 2.753495, 0, 0, 0, 1, 1,
1.027541, -0.2319429, 1.341084, 1, 1, 1, 1, 1,
1.032894, 2.242299, 1.156357, 1, 1, 1, 1, 1,
1.034391, -0.528976, 2.983697, 1, 1, 1, 1, 1,
1.040044, -0.9263704, 2.497464, 1, 1, 1, 1, 1,
1.049121, -1.307684, 3.411393, 1, 1, 1, 1, 1,
1.049241, 1.624304, 1.95631, 1, 1, 1, 1, 1,
1.056786, 0.5728115, 0.8920432, 1, 1, 1, 1, 1,
1.058242, 0.5921508, 1.590223, 1, 1, 1, 1, 1,
1.074795, 0.4117704, 0.4726933, 1, 1, 1, 1, 1,
1.080195, 0.0001012195, 1.807412, 1, 1, 1, 1, 1,
1.091123, 0.001063704, 2.822217, 1, 1, 1, 1, 1,
1.100043, -0.6830303, 2.898215, 1, 1, 1, 1, 1,
1.104202, -0.3515686, 2.706321, 1, 1, 1, 1, 1,
1.105375, -0.3896846, -0.4456524, 1, 1, 1, 1, 1,
1.106356, -0.5448287, 3.150087, 1, 1, 1, 1, 1,
1.106989, -0.6616555, 2.314527, 0, 0, 1, 1, 1,
1.109204, 1.094967, 2.22276, 1, 0, 0, 1, 1,
1.115476, -0.5922834, 3.31776, 1, 0, 0, 1, 1,
1.116312, -0.2078725, -0.00491305, 1, 0, 0, 1, 1,
1.120818, -0.3264299, 1.6293, 1, 0, 0, 1, 1,
1.125335, 0.1165336, 1.001086, 1, 0, 0, 1, 1,
1.134953, 0.4339871, 1.248069, 0, 0, 0, 1, 1,
1.137015, -1.555978, 1.441112, 0, 0, 0, 1, 1,
1.138373, 1.47804, 0.7471547, 0, 0, 0, 1, 1,
1.14557, -1.333061, 1.922537, 0, 0, 0, 1, 1,
1.149972, 0.9129274, 1.220214, 0, 0, 0, 1, 1,
1.150572, 0.7884399, 1.435422, 0, 0, 0, 1, 1,
1.157042, -2.349063, 2.110623, 0, 0, 0, 1, 1,
1.157762, 0.5101905, 0.2179058, 1, 1, 1, 1, 1,
1.163079, 0.5603873, 1.600019, 1, 1, 1, 1, 1,
1.164232, -2.530948, 3.948612, 1, 1, 1, 1, 1,
1.164405, -1.43248, 2.484615, 1, 1, 1, 1, 1,
1.165865, -0.7765873, 1.950686, 1, 1, 1, 1, 1,
1.173296, 0.8879086, 1.905147, 1, 1, 1, 1, 1,
1.180343, -0.3955534, 1.561925, 1, 1, 1, 1, 1,
1.182267, -0.6531479, 1.310126, 1, 1, 1, 1, 1,
1.184568, 0.5714484, 1.846728, 1, 1, 1, 1, 1,
1.188293, 0.3959948, 0.3379781, 1, 1, 1, 1, 1,
1.192725, 0.7448832, 1.388433, 1, 1, 1, 1, 1,
1.193015, -0.4411873, -0.0004601472, 1, 1, 1, 1, 1,
1.208423, -0.393693, 2.858384, 1, 1, 1, 1, 1,
1.215796, -1.032139, 1.66488, 1, 1, 1, 1, 1,
1.221506, -0.9425457, 2.538804, 1, 1, 1, 1, 1,
1.221788, -0.8118237, 2.340188, 0, 0, 1, 1, 1,
1.22815, 0.3594249, 1.85825, 1, 0, 0, 1, 1,
1.237816, -1.52407, 1.38806, 1, 0, 0, 1, 1,
1.251932, 0.5933183, -0.6285521, 1, 0, 0, 1, 1,
1.256498, -0.5936523, 1.861929, 1, 0, 0, 1, 1,
1.273303, -2.276841, 2.66747, 1, 0, 0, 1, 1,
1.275258, -0.3543323, 2.354186, 0, 0, 0, 1, 1,
1.279602, -1.091918, 3.294573, 0, 0, 0, 1, 1,
1.283771, 1.499706, 2.547274, 0, 0, 0, 1, 1,
1.288446, 0.1508087, 1.920327, 0, 0, 0, 1, 1,
1.321188, -0.5609552, 2.119347, 0, 0, 0, 1, 1,
1.343218, -0.8445119, 3.408628, 0, 0, 0, 1, 1,
1.35263, 1.523058, 1.686028, 0, 0, 0, 1, 1,
1.354218, 0.4997321, 2.00585, 1, 1, 1, 1, 1,
1.354647, 0.1165235, 1.154994, 1, 1, 1, 1, 1,
1.356463, -0.7377205, 1.360986, 1, 1, 1, 1, 1,
1.362866, 0.1890134, 1.024568, 1, 1, 1, 1, 1,
1.369885, -1.123319, 2.768562, 1, 1, 1, 1, 1,
1.375285, -0.1176715, 3.117475, 1, 1, 1, 1, 1,
1.383109, -1.606869, 3.013129, 1, 1, 1, 1, 1,
1.383392, 0.5812535, 0.8710199, 1, 1, 1, 1, 1,
1.385121, 0.2934456, 0.7900108, 1, 1, 1, 1, 1,
1.385414, -1.493022, 4.033782, 1, 1, 1, 1, 1,
1.388682, -0.7801418, 3.278576, 1, 1, 1, 1, 1,
1.396289, -0.6637962, 2.185555, 1, 1, 1, 1, 1,
1.396778, -0.7164831, 1.993378, 1, 1, 1, 1, 1,
1.397471, 0.1521098, 3.51788, 1, 1, 1, 1, 1,
1.399416, -2.600571, 2.536599, 1, 1, 1, 1, 1,
1.401019, 0.06592207, 0.7343476, 0, 0, 1, 1, 1,
1.401326, 0.4070437, 1.526143, 1, 0, 0, 1, 1,
1.406999, 0.03373194, 2.200088, 1, 0, 0, 1, 1,
1.420344, -0.3920029, 2.342036, 1, 0, 0, 1, 1,
1.421718, 0.7389356, 1.103723, 1, 0, 0, 1, 1,
1.426454, -0.4875739, 3.336373, 1, 0, 0, 1, 1,
1.427036, 0.1162978, 1.891564, 0, 0, 0, 1, 1,
1.430005, 1.160651, 0.4910207, 0, 0, 0, 1, 1,
1.441195, -1.365235, 2.158605, 0, 0, 0, 1, 1,
1.454391, 0.5186172, 0.6543754, 0, 0, 0, 1, 1,
1.457954, 0.6913983, 0.1060119, 0, 0, 0, 1, 1,
1.46473, 0.6902397, -0.5204255, 0, 0, 0, 1, 1,
1.488597, 1.045089, 2.257949, 0, 0, 0, 1, 1,
1.507882, 0.07347351, 1.460908, 1, 1, 1, 1, 1,
1.516126, -1.007033, 2.243234, 1, 1, 1, 1, 1,
1.547054, -0.1970174, 3.547734, 1, 1, 1, 1, 1,
1.551455, -1.40409, 1.690536, 1, 1, 1, 1, 1,
1.563545, -1.128753, 3.672894, 1, 1, 1, 1, 1,
1.563801, -0.2391351, 1.512106, 1, 1, 1, 1, 1,
1.575457, -0.3586052, 1.955315, 1, 1, 1, 1, 1,
1.5775, -0.1229571, 2.79943, 1, 1, 1, 1, 1,
1.581778, -0.7000031, 2.06164, 1, 1, 1, 1, 1,
1.587, -0.03030879, 1.92589, 1, 1, 1, 1, 1,
1.593062, -0.4379152, 1.178367, 1, 1, 1, 1, 1,
1.599854, -1.017593, 2.891407, 1, 1, 1, 1, 1,
1.59998, 0.2164142, 0.4762205, 1, 1, 1, 1, 1,
1.622956, -1.535097, 1.852569, 1, 1, 1, 1, 1,
1.633168, -0.6309253, 0.811666, 1, 1, 1, 1, 1,
1.641165, -0.5735044, 2.496615, 0, 0, 1, 1, 1,
1.643194, -1.790288, 2.217029, 1, 0, 0, 1, 1,
1.649746, -0.6409301, 2.479334, 1, 0, 0, 1, 1,
1.652016, 1.514121, 1.008492, 1, 0, 0, 1, 1,
1.653983, -0.6414831, 1.326306, 1, 0, 0, 1, 1,
1.654836, 0.9841204, 1.81685, 1, 0, 0, 1, 1,
1.682451, -1.0194, 4.024862, 0, 0, 0, 1, 1,
1.688755, 0.3951591, 1.173924, 0, 0, 0, 1, 1,
1.691417, -0.2898367, 1.977221, 0, 0, 0, 1, 1,
1.723004, -0.2309604, 2.458776, 0, 0, 0, 1, 1,
1.727065, -0.1513636, 0.8406158, 0, 0, 0, 1, 1,
1.731785, 0.926225, 2.120183, 0, 0, 0, 1, 1,
1.740328, -1.143527, 2.210469, 0, 0, 0, 1, 1,
1.74997, 1.186912, -0.5186945, 1, 1, 1, 1, 1,
1.754479, -1.982955, 3.603006, 1, 1, 1, 1, 1,
1.762743, -0.8171448, 1.315568, 1, 1, 1, 1, 1,
1.767779, 0.4863101, 0.02019159, 1, 1, 1, 1, 1,
1.799692, 1.8995, 0.02187401, 1, 1, 1, 1, 1,
1.812692, 0.4368667, 1.012984, 1, 1, 1, 1, 1,
1.814451, -0.267081, 2.097013, 1, 1, 1, 1, 1,
1.82965, 0.8697485, -0.4830838, 1, 1, 1, 1, 1,
1.845829, -0.5160958, 1.585761, 1, 1, 1, 1, 1,
1.866527, 0.8259311, 1.003437, 1, 1, 1, 1, 1,
1.880163, -1.910761, 2.977071, 1, 1, 1, 1, 1,
1.89713, 0.2460253, 1.995801, 1, 1, 1, 1, 1,
1.904283, 1.058525, 0.9418101, 1, 1, 1, 1, 1,
1.916385, 0.6578641, 0.2284854, 1, 1, 1, 1, 1,
1.970951, 0.7553254, 1.738158, 1, 1, 1, 1, 1,
1.989734, 0.6309993, 1.393203, 0, 0, 1, 1, 1,
1.996563, 1.111359, 0.8883696, 1, 0, 0, 1, 1,
1.998209, -0.06971367, 2.123212, 1, 0, 0, 1, 1,
2.002952, 3.249344, -0.5993044, 1, 0, 0, 1, 1,
2.055024, 0.348697, 1.396441, 1, 0, 0, 1, 1,
2.072041, -0.631174, 1.014667, 1, 0, 0, 1, 1,
2.088539, 0.3252273, 3.184317, 0, 0, 0, 1, 1,
2.124748, 1.484894, 1.197075, 0, 0, 0, 1, 1,
2.149491, -1.010454, -0.4218198, 0, 0, 0, 1, 1,
2.210844, 0.4415126, 0.3512042, 0, 0, 0, 1, 1,
2.212964, 0.1841588, 1.314282, 0, 0, 0, 1, 1,
2.220318, 0.2545626, 2.054369, 0, 0, 0, 1, 1,
2.229585, 0.928481, 1.307588, 0, 0, 0, 1, 1,
2.268388, -0.3761113, 1.595243, 1, 1, 1, 1, 1,
2.295406, -2.855665, 2.889813, 1, 1, 1, 1, 1,
2.32306, 0.09909035, 2.182841, 1, 1, 1, 1, 1,
2.680842, 1.258014, 1.095796, 1, 1, 1, 1, 1,
2.820513, 0.3429661, 3.000701, 1, 1, 1, 1, 1,
2.856423, -1.550556, 2.413027, 1, 1, 1, 1, 1,
3.013484, 0.6789847, 1.890235, 1, 1, 1, 1, 1
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
var radius = 9.111763;
var distance = 32.00468;
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
mvMatrix.translate( 0.2466543, -0.1904479, -0.002046347 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.00468);
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
