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
-3.389338, 0.2220331, -2.817785, 1, 0, 0, 1,
-2.680411, -1.054783, -3.068662, 1, 0.007843138, 0, 1,
-2.627887, 0.2826574, -0.2663203, 1, 0.01176471, 0, 1,
-2.586915, 0.351843, -2.48817, 1, 0.01960784, 0, 1,
-2.532708, -0.763763, -2.16084, 1, 0.02352941, 0, 1,
-2.471391, -0.02762322, -2.501801, 1, 0.03137255, 0, 1,
-2.452775, -0.02186661, -1.206769, 1, 0.03529412, 0, 1,
-2.448473, -0.02658578, -2.075162, 1, 0.04313726, 0, 1,
-2.381677, 1.443661, -1.716879, 1, 0.04705882, 0, 1,
-2.369713, -0.06889582, -1.752113, 1, 0.05490196, 0, 1,
-2.366482, -0.8131161, -1.190342, 1, 0.05882353, 0, 1,
-2.329218, 0.9631155, -1.568918, 1, 0.06666667, 0, 1,
-2.321783, -0.6179349, -2.244051, 1, 0.07058824, 0, 1,
-2.315139, 0.841886, -1.327138, 1, 0.07843138, 0, 1,
-2.294681, 0.4972678, -1.602644, 1, 0.08235294, 0, 1,
-2.230826, 0.8754501, 0.0924615, 1, 0.09019608, 0, 1,
-2.164354, -1.238955, -0.8673432, 1, 0.09411765, 0, 1,
-2.132702, -1.007937, -2.954517, 1, 0.1019608, 0, 1,
-2.124012, 3.716503, -1.5712, 1, 0.1098039, 0, 1,
-2.109787, -0.5268899, -1.389578, 1, 0.1137255, 0, 1,
-2.102345, -0.3190489, -1.325134, 1, 0.1215686, 0, 1,
-2.064174, 0.4306456, -1.523935, 1, 0.1254902, 0, 1,
-2.035125, -0.1510567, -1.448783, 1, 0.1333333, 0, 1,
-1.987097, 0.7195337, -2.377207, 1, 0.1372549, 0, 1,
-1.985458, -0.3078755, -0.8636547, 1, 0.145098, 0, 1,
-1.974815, 0.1499983, -1.54915, 1, 0.1490196, 0, 1,
-1.958848, 0.08352479, -2.456877, 1, 0.1568628, 0, 1,
-1.955189, -0.4933869, -1.455724, 1, 0.1607843, 0, 1,
-1.950535, 0.5508396, -2.75325, 1, 0.1686275, 0, 1,
-1.946723, 1.084288, -0.004923204, 1, 0.172549, 0, 1,
-1.938081, -0.8807728, -2.541084, 1, 0.1803922, 0, 1,
-1.932568, 0.1579028, -1.079643, 1, 0.1843137, 0, 1,
-1.927436, 1.138487, -1.203335, 1, 0.1921569, 0, 1,
-1.917434, 1.24171, -1.801479, 1, 0.1960784, 0, 1,
-1.904447, 1.022966, 0.4146419, 1, 0.2039216, 0, 1,
-1.889206, 1.745933, -0.48981, 1, 0.2117647, 0, 1,
-1.879856, 2.340858, -1.642207, 1, 0.2156863, 0, 1,
-1.867007, -1.840855, -4.071714, 1, 0.2235294, 0, 1,
-1.838081, 1.587986, -0.1536522, 1, 0.227451, 0, 1,
-1.820547, -0.04903564, -2.938877, 1, 0.2352941, 0, 1,
-1.818394, -0.01448543, -2.417914, 1, 0.2392157, 0, 1,
-1.81576, 0.4997339, -0.6937788, 1, 0.2470588, 0, 1,
-1.811521, 0.01552984, -1.917252, 1, 0.2509804, 0, 1,
-1.797368, -0.3899816, -1.792766, 1, 0.2588235, 0, 1,
-1.780433, 1.447427, -0.8876456, 1, 0.2627451, 0, 1,
-1.766387, 0.9668179, -0.8523336, 1, 0.2705882, 0, 1,
-1.76424, -0.8865174, -2.393664, 1, 0.2745098, 0, 1,
-1.754007, -1.662985, -4.0011, 1, 0.282353, 0, 1,
-1.752556, 1.306594, -0.632261, 1, 0.2862745, 0, 1,
-1.747605, -0.08738638, -0.6627625, 1, 0.2941177, 0, 1,
-1.722719, 1.062568, -0.6609452, 1, 0.3019608, 0, 1,
-1.702549, -0.5841151, -3.413339, 1, 0.3058824, 0, 1,
-1.690488, 0.5501916, -1.05375, 1, 0.3137255, 0, 1,
-1.682971, 1.025967, -2.715124, 1, 0.3176471, 0, 1,
-1.681299, -0.9466897, -2.322011, 1, 0.3254902, 0, 1,
-1.672259, 2.129616, 0.5881199, 1, 0.3294118, 0, 1,
-1.671457, 0.2780443, -1.856746, 1, 0.3372549, 0, 1,
-1.663829, -0.02694634, -0.7878618, 1, 0.3411765, 0, 1,
-1.660461, 0.08754254, -0.3621548, 1, 0.3490196, 0, 1,
-1.658904, 0.1563025, 0.8838636, 1, 0.3529412, 0, 1,
-1.657878, 0.3291273, -3.563091, 1, 0.3607843, 0, 1,
-1.655868, -1.184956, -3.215813, 1, 0.3647059, 0, 1,
-1.643126, -0.7819344, -1.850827, 1, 0.372549, 0, 1,
-1.635693, -1.683419, -2.539509, 1, 0.3764706, 0, 1,
-1.63517, 0.09813307, -0.5068443, 1, 0.3843137, 0, 1,
-1.633453, -0.5628089, -2.979545, 1, 0.3882353, 0, 1,
-1.628721, -1.48805, -1.73859, 1, 0.3960784, 0, 1,
-1.627393, -0.4393346, 0.1370011, 1, 0.4039216, 0, 1,
-1.625594, -0.632184, -2.775158, 1, 0.4078431, 0, 1,
-1.619057, 0.5880972, -1.964726, 1, 0.4156863, 0, 1,
-1.600833, -1.611003, -2.321295, 1, 0.4196078, 0, 1,
-1.588237, 0.2943889, -1.659185, 1, 0.427451, 0, 1,
-1.581088, 0.689546, -1.29273, 1, 0.4313726, 0, 1,
-1.568261, 0.1492332, -2.40239, 1, 0.4392157, 0, 1,
-1.568075, 1.416986, -0.1091624, 1, 0.4431373, 0, 1,
-1.564909, 2.194246, -0.6202874, 1, 0.4509804, 0, 1,
-1.563408, -0.3622231, -1.910392, 1, 0.454902, 0, 1,
-1.55747, 0.9933322, -3.072944, 1, 0.4627451, 0, 1,
-1.548714, -0.4454621, -2.341914, 1, 0.4666667, 0, 1,
-1.54487, -0.04769441, -1.728023, 1, 0.4745098, 0, 1,
-1.544342, -0.4385827, -3.53275, 1, 0.4784314, 0, 1,
-1.530478, -0.8602035, -3.367444, 1, 0.4862745, 0, 1,
-1.527139, -1.323262, -2.792474, 1, 0.4901961, 0, 1,
-1.518741, 0.6042123, 0.2482766, 1, 0.4980392, 0, 1,
-1.50579, -1.116881, -2.820735, 1, 0.5058824, 0, 1,
-1.489106, 0.09880117, -1.777004, 1, 0.509804, 0, 1,
-1.481739, 0.1959205, -2.026168, 1, 0.5176471, 0, 1,
-1.475431, -0.3730094, -1.698333, 1, 0.5215687, 0, 1,
-1.457782, 0.3585415, -2.368405, 1, 0.5294118, 0, 1,
-1.450398, 0.3218784, -1.107601, 1, 0.5333334, 0, 1,
-1.450323, 1.044134, -0.7084069, 1, 0.5411765, 0, 1,
-1.441207, -0.649059, -3.569212, 1, 0.5450981, 0, 1,
-1.437075, 0.2400895, -1.336919, 1, 0.5529412, 0, 1,
-1.436309, 0.1812682, -1.905557, 1, 0.5568628, 0, 1,
-1.433759, -1.021871, -2.081371, 1, 0.5647059, 0, 1,
-1.425794, 0.6956505, -0.3329833, 1, 0.5686275, 0, 1,
-1.421396, -0.1386075, -0.9537504, 1, 0.5764706, 0, 1,
-1.416287, 1.443373, -1.424235, 1, 0.5803922, 0, 1,
-1.407153, 0.8547367, 0.9445976, 1, 0.5882353, 0, 1,
-1.394982, -0.3932501, -2.457926, 1, 0.5921569, 0, 1,
-1.388284, 1.303066, -1.870917, 1, 0.6, 0, 1,
-1.387353, 0.98958, -1.810024, 1, 0.6078432, 0, 1,
-1.377838, -1.199868, -1.804094, 1, 0.6117647, 0, 1,
-1.367962, -1.033266, -1.492945, 1, 0.6196079, 0, 1,
-1.363583, 1.2808, -1.964883, 1, 0.6235294, 0, 1,
-1.355056, 0.167813, -1.928126, 1, 0.6313726, 0, 1,
-1.353225, -0.9841626, -3.270126, 1, 0.6352941, 0, 1,
-1.352472, 0.9060306, -1.251411, 1, 0.6431373, 0, 1,
-1.352396, -1.128115, -1.207968, 1, 0.6470588, 0, 1,
-1.337693, 0.9761894, -2.660646, 1, 0.654902, 0, 1,
-1.324759, -0.1635706, -2.266588, 1, 0.6588235, 0, 1,
-1.319423, -0.2804638, -0.8868629, 1, 0.6666667, 0, 1,
-1.316897, 0.9819756, -0.4939849, 1, 0.6705883, 0, 1,
-1.309099, -1.510991, -2.379888, 1, 0.6784314, 0, 1,
-1.305089, 0.4287504, -1.798529, 1, 0.682353, 0, 1,
-1.303172, 1.179242, 1.550202, 1, 0.6901961, 0, 1,
-1.301826, 0.2864749, -1.427161, 1, 0.6941177, 0, 1,
-1.297004, -0.1999363, -1.39346, 1, 0.7019608, 0, 1,
-1.296937, 0.3274998, -1.104526, 1, 0.7098039, 0, 1,
-1.288495, 0.6668406, -1.60896, 1, 0.7137255, 0, 1,
-1.285283, -0.6642596, -2.010846, 1, 0.7215686, 0, 1,
-1.279647, -0.5606256, -2.213943, 1, 0.7254902, 0, 1,
-1.27211, 1.417868, -1.492681, 1, 0.7333333, 0, 1,
-1.26845, -2.219906, -5.282268, 1, 0.7372549, 0, 1,
-1.268429, -0.334054, -3.212044, 1, 0.7450981, 0, 1,
-1.263987, 0.3734011, -1.236822, 1, 0.7490196, 0, 1,
-1.2628, 0.115788, 0.7640224, 1, 0.7568628, 0, 1,
-1.252824, -1.446528, -1.466301, 1, 0.7607843, 0, 1,
-1.232212, -0.350242, -0.354377, 1, 0.7686275, 0, 1,
-1.223272, -0.4968629, -0.4544861, 1, 0.772549, 0, 1,
-1.217403, 0.05383284, -0.6923425, 1, 0.7803922, 0, 1,
-1.217197, -0.7985877, -0.612604, 1, 0.7843137, 0, 1,
-1.205924, -1.569353, -1.865462, 1, 0.7921569, 0, 1,
-1.205427, -0.6427486, -3.073444, 1, 0.7960784, 0, 1,
-1.202549, -0.8922132, -3.666885, 1, 0.8039216, 0, 1,
-1.196764, 0.7385035, -0.3484206, 1, 0.8117647, 0, 1,
-1.193856, -0.1882829, -0.01357577, 1, 0.8156863, 0, 1,
-1.187827, -1.771792, -3.368901, 1, 0.8235294, 0, 1,
-1.185261, 1.652366, 1.007662, 1, 0.827451, 0, 1,
-1.184433, 1.29849, 0.6810115, 1, 0.8352941, 0, 1,
-1.18021, 0.4654776, 0.8477959, 1, 0.8392157, 0, 1,
-1.174272, -0.9695092, -2.777149, 1, 0.8470588, 0, 1,
-1.173862, -1.180394, -2.30171, 1, 0.8509804, 0, 1,
-1.172264, -0.1537352, -0.4295423, 1, 0.8588235, 0, 1,
-1.16657, -1.077662, -2.50932, 1, 0.8627451, 0, 1,
-1.156707, 1.469473, -0.5813497, 1, 0.8705882, 0, 1,
-1.156705, 0.7161472, 1.146654, 1, 0.8745098, 0, 1,
-1.149892, 0.4959337, -1.932967, 1, 0.8823529, 0, 1,
-1.146209, -0.2908362, -1.018158, 1, 0.8862745, 0, 1,
-1.137051, 0.5500026, -0.6698023, 1, 0.8941177, 0, 1,
-1.124605, -1.185596, -0.8946964, 1, 0.8980392, 0, 1,
-1.120904, -1.238537, -1.925026, 1, 0.9058824, 0, 1,
-1.120011, 0.5812145, -0.608468, 1, 0.9137255, 0, 1,
-1.119751, -0.3152461, -2.111315, 1, 0.9176471, 0, 1,
-1.106121, -0.1167706, -1.169676, 1, 0.9254902, 0, 1,
-1.105097, 0.3879125, -2.342704, 1, 0.9294118, 0, 1,
-1.098453, 1.017537, -2.273488, 1, 0.9372549, 0, 1,
-1.094887, -0.5624872, -1.452163, 1, 0.9411765, 0, 1,
-1.094722, 0.2854845, -2.993268, 1, 0.9490196, 0, 1,
-1.094177, 0.4722047, -2.437324, 1, 0.9529412, 0, 1,
-1.087587, 1.782923, -1.19493, 1, 0.9607843, 0, 1,
-1.086578, -0.669798, -3.480464, 1, 0.9647059, 0, 1,
-1.086065, 1.235548, -1.124799, 1, 0.972549, 0, 1,
-1.085432, 0.6841308, -1.325422, 1, 0.9764706, 0, 1,
-1.082548, 0.7768301, -1.293595, 1, 0.9843137, 0, 1,
-1.075035, -0.2745067, -0.5944039, 1, 0.9882353, 0, 1,
-1.070312, 1.437964, -1.583828, 1, 0.9960784, 0, 1,
-1.06837, 1.054218, 0.03931494, 0.9960784, 1, 0, 1,
-1.067689, 1.076135, -0.1541962, 0.9921569, 1, 0, 1,
-1.063802, 0.9460279, -0.5625931, 0.9843137, 1, 0, 1,
-1.060189, -1.006263, -1.304629, 0.9803922, 1, 0, 1,
-1.056297, -1.180316, -1.557311, 0.972549, 1, 0, 1,
-1.044998, -0.7416028, -1.773319, 0.9686275, 1, 0, 1,
-1.040667, 0.100031, -0.01021776, 0.9607843, 1, 0, 1,
-1.038022, 0.1667036, -1.388609, 0.9568627, 1, 0, 1,
-1.02827, -0.7159399, -1.337767, 0.9490196, 1, 0, 1,
-1.027411, 0.3445811, -1.244238, 0.945098, 1, 0, 1,
-1.021694, -0.2867523, -1.514843, 0.9372549, 1, 0, 1,
-1.021359, -0.3989008, -3.450976, 0.9333333, 1, 0, 1,
-1.020255, 0.1606153, -0.7055785, 0.9254902, 1, 0, 1,
-1.012294, 0.1291097, -1.139442, 0.9215686, 1, 0, 1,
-1.00932, 0.4264443, -2.343683, 0.9137255, 1, 0, 1,
-0.9990067, 0.8298841, -0.2593705, 0.9098039, 1, 0, 1,
-0.9968954, 1.39376, 0.9940315, 0.9019608, 1, 0, 1,
-0.9963493, 1.680252, -1.904478, 0.8941177, 1, 0, 1,
-0.9858657, 0.472305, -1.160197, 0.8901961, 1, 0, 1,
-0.9857998, -0.2999512, -1.083898, 0.8823529, 1, 0, 1,
-0.9852462, -0.9233422, -2.103296, 0.8784314, 1, 0, 1,
-0.9790795, 0.4865265, -1.800909, 0.8705882, 1, 0, 1,
-0.9778286, 0.7293752, -2.073282, 0.8666667, 1, 0, 1,
-0.9777401, -1.154578, -1.721367, 0.8588235, 1, 0, 1,
-0.9693593, -0.3619271, -1.634791, 0.854902, 1, 0, 1,
-0.9666833, 0.3795117, -2.074142, 0.8470588, 1, 0, 1,
-0.9632533, 0.003065977, -1.002227, 0.8431373, 1, 0, 1,
-0.9620501, -0.3148817, -3.329013, 0.8352941, 1, 0, 1,
-0.9474745, -1.035843, -2.685714, 0.8313726, 1, 0, 1,
-0.9458109, -0.9537991, -1.454225, 0.8235294, 1, 0, 1,
-0.9456833, -2.028544, -3.454119, 0.8196079, 1, 0, 1,
-0.9382829, -0.4643948, -2.142629, 0.8117647, 1, 0, 1,
-0.9377047, -0.7267216, -0.2303913, 0.8078431, 1, 0, 1,
-0.9365359, 2.193832, -1.345848, 0.8, 1, 0, 1,
-0.925276, 1.051698, 0.1225379, 0.7921569, 1, 0, 1,
-0.9113328, 0.826853, -1.507133, 0.7882353, 1, 0, 1,
-0.9056227, 0.2219153, -0.6676188, 0.7803922, 1, 0, 1,
-0.8910502, 0.03546743, -1.515075, 0.7764706, 1, 0, 1,
-0.8880302, 1.148709, -2.739226, 0.7686275, 1, 0, 1,
-0.8864342, 0.8221742, -2.050614, 0.7647059, 1, 0, 1,
-0.8850294, 0.2831305, -1.058883, 0.7568628, 1, 0, 1,
-0.8828412, -1.252243, -1.765305, 0.7529412, 1, 0, 1,
-0.8655714, 0.9920285, -1.798433, 0.7450981, 1, 0, 1,
-0.8650826, 0.3928362, -1.180295, 0.7411765, 1, 0, 1,
-0.8594719, -0.680655, -1.509499, 0.7333333, 1, 0, 1,
-0.8593263, -0.05663614, -0.8979982, 0.7294118, 1, 0, 1,
-0.8551749, 1.291982, -1.292187, 0.7215686, 1, 0, 1,
-0.8487434, -0.4048879, -2.001283, 0.7176471, 1, 0, 1,
-0.8445607, -1.473222, -2.51384, 0.7098039, 1, 0, 1,
-0.8388709, -0.2290439, -2.404971, 0.7058824, 1, 0, 1,
-0.8380618, 0.6655021, -2.257139, 0.6980392, 1, 0, 1,
-0.8327241, -0.4177388, -0.7659172, 0.6901961, 1, 0, 1,
-0.8230733, -1.095286, -1.459178, 0.6862745, 1, 0, 1,
-0.8184642, -0.938814, -3.121292, 0.6784314, 1, 0, 1,
-0.8168478, -1.003813, -1.676486, 0.6745098, 1, 0, 1,
-0.8159274, 0.487115, -0.6056579, 0.6666667, 1, 0, 1,
-0.8131813, -0.5621671, -1.136708, 0.6627451, 1, 0, 1,
-0.8052719, -0.7641266, -3.424458, 0.654902, 1, 0, 1,
-0.8048742, -0.9489606, -2.104655, 0.6509804, 1, 0, 1,
-0.804171, -0.2458467, -3.171695, 0.6431373, 1, 0, 1,
-0.794805, 0.9585108, 0.548157, 0.6392157, 1, 0, 1,
-0.7903864, 0.6379968, -1.687567, 0.6313726, 1, 0, 1,
-0.7878633, 1.722236, -0.7253901, 0.627451, 1, 0, 1,
-0.7825325, -0.3982956, -2.269536, 0.6196079, 1, 0, 1,
-0.7780679, 0.8849409, 0.3053433, 0.6156863, 1, 0, 1,
-0.7752429, -0.7509634, -4.528053, 0.6078432, 1, 0, 1,
-0.7752056, 1.296022, 0.034209, 0.6039216, 1, 0, 1,
-0.772758, 0.2295104, -1.674676, 0.5960785, 1, 0, 1,
-0.7624855, 0.4942529, -0.04080823, 0.5882353, 1, 0, 1,
-0.7595367, 0.2694072, -1.272949, 0.5843138, 1, 0, 1,
-0.7591752, -0.7480394, -1.487106, 0.5764706, 1, 0, 1,
-0.7557088, -1.131896, -2.262871, 0.572549, 1, 0, 1,
-0.7555805, 1.181661, 0.3481823, 0.5647059, 1, 0, 1,
-0.7497885, -0.3070677, -1.649877, 0.5607843, 1, 0, 1,
-0.7474042, 0.6148894, -1.082123, 0.5529412, 1, 0, 1,
-0.7447438, 1.001521, -0.1307643, 0.5490196, 1, 0, 1,
-0.7387967, 0.02952233, -3.373767, 0.5411765, 1, 0, 1,
-0.7353321, -1.260878, -2.156977, 0.5372549, 1, 0, 1,
-0.7351942, -0.2197894, -1.8413, 0.5294118, 1, 0, 1,
-0.7275358, 0.1474871, -1.11804, 0.5254902, 1, 0, 1,
-0.7189137, -0.1681517, -1.875788, 0.5176471, 1, 0, 1,
-0.7170238, -0.1384663, -2.230975, 0.5137255, 1, 0, 1,
-0.7120238, 0.3281812, 0.173149, 0.5058824, 1, 0, 1,
-0.7115147, -0.8807617, -2.144901, 0.5019608, 1, 0, 1,
-0.7107112, 0.9002952, 0.8566606, 0.4941176, 1, 0, 1,
-0.7088366, -0.6217898, -2.619461, 0.4862745, 1, 0, 1,
-0.7049283, 0.4307863, -1.488778, 0.4823529, 1, 0, 1,
-0.7009124, 0.8968979, 0.3659431, 0.4745098, 1, 0, 1,
-0.698324, -0.1567132, -2.479197, 0.4705882, 1, 0, 1,
-0.6969424, -0.0886869, -2.195574, 0.4627451, 1, 0, 1,
-0.6925226, -1.10665, -3.830346, 0.4588235, 1, 0, 1,
-0.6901752, -0.4650485, -1.303604, 0.4509804, 1, 0, 1,
-0.6873737, -0.9622864, -3.455536, 0.4470588, 1, 0, 1,
-0.6865161, 0.5488125, -0.8550709, 0.4392157, 1, 0, 1,
-0.6832968, -0.9227227, -3.047672, 0.4352941, 1, 0, 1,
-0.6825647, 0.3211446, -1.651762, 0.427451, 1, 0, 1,
-0.6804596, 0.7693011, -1.87071, 0.4235294, 1, 0, 1,
-0.677662, -2.187196, -3.520298, 0.4156863, 1, 0, 1,
-0.6775469, -1.193137, -3.075446, 0.4117647, 1, 0, 1,
-0.6727401, -1.24144, -3.623067, 0.4039216, 1, 0, 1,
-0.6722313, 0.2902786, -2.008538, 0.3960784, 1, 0, 1,
-0.6688914, 0.5560827, -0.6146314, 0.3921569, 1, 0, 1,
-0.6686181, -0.1667904, -1.468128, 0.3843137, 1, 0, 1,
-0.6630297, 0.3540895, -0.3878827, 0.3803922, 1, 0, 1,
-0.6579663, 1.044014, -0.3192387, 0.372549, 1, 0, 1,
-0.651907, -0.1963385, -3.915137, 0.3686275, 1, 0, 1,
-0.6461917, 0.02356762, -2.960548, 0.3607843, 1, 0, 1,
-0.6461332, 0.824597, -1.140961, 0.3568628, 1, 0, 1,
-0.6418687, -0.04954328, -1.076153, 0.3490196, 1, 0, 1,
-0.6411344, 0.3250945, -2.774307, 0.345098, 1, 0, 1,
-0.6400481, 0.06600522, -1.750747, 0.3372549, 1, 0, 1,
-0.6375492, -0.289219, -2.35521, 0.3333333, 1, 0, 1,
-0.6367998, -1.035625, -2.497295, 0.3254902, 1, 0, 1,
-0.6304379, 1.730272, -1.108448, 0.3215686, 1, 0, 1,
-0.6302435, 0.2929001, -1.079205, 0.3137255, 1, 0, 1,
-0.6244289, -0.8232344, -2.559705, 0.3098039, 1, 0, 1,
-0.624261, -0.4297592, -2.167912, 0.3019608, 1, 0, 1,
-0.6242527, 0.3922625, -1.045122, 0.2941177, 1, 0, 1,
-0.6196741, 0.3596059, -0.3631192, 0.2901961, 1, 0, 1,
-0.6161785, 0.5929574, -1.918088, 0.282353, 1, 0, 1,
-0.6161267, 0.1868755, -1.751751, 0.2784314, 1, 0, 1,
-0.6115546, -1.033811, -3.409288, 0.2705882, 1, 0, 1,
-0.6109846, -0.9888688, -2.902533, 0.2666667, 1, 0, 1,
-0.6108232, -0.8141599, -2.86784, 0.2588235, 1, 0, 1,
-0.6089917, 1.993777, 0.4086707, 0.254902, 1, 0, 1,
-0.6024871, 0.2475758, -1.282126, 0.2470588, 1, 0, 1,
-0.6022509, 0.36881, -0.2528046, 0.2431373, 1, 0, 1,
-0.6008503, -0.9560666, -1.060068, 0.2352941, 1, 0, 1,
-0.6003862, 2.216725, -0.001339049, 0.2313726, 1, 0, 1,
-0.5981675, -0.2100349, -2.678973, 0.2235294, 1, 0, 1,
-0.5969676, -0.2071575, -2.013134, 0.2196078, 1, 0, 1,
-0.595657, -1.152625, -2.566121, 0.2117647, 1, 0, 1,
-0.5956417, -0.6190201, -1.287845, 0.2078431, 1, 0, 1,
-0.5930793, 0.8756883, -0.6904741, 0.2, 1, 0, 1,
-0.5846218, -1.497373, -1.758957, 0.1921569, 1, 0, 1,
-0.5839326, 0.3354987, -2.023455, 0.1882353, 1, 0, 1,
-0.5831992, -0.2751768, -2.309393, 0.1803922, 1, 0, 1,
-0.5788499, -0.7292585, -2.883392, 0.1764706, 1, 0, 1,
-0.5786332, -1.599339, -1.571734, 0.1686275, 1, 0, 1,
-0.5777254, -0.3082708, -1.295117, 0.1647059, 1, 0, 1,
-0.5741808, 0.3685816, -1.123264, 0.1568628, 1, 0, 1,
-0.5708774, 1.805149, -0.4473375, 0.1529412, 1, 0, 1,
-0.5697222, -0.6572063, -0.533718, 0.145098, 1, 0, 1,
-0.5696432, 0.7002025, -0.2325598, 0.1411765, 1, 0, 1,
-0.5685664, -0.4708697, -1.617177, 0.1333333, 1, 0, 1,
-0.5524318, 0.5916359, -1.529307, 0.1294118, 1, 0, 1,
-0.5506302, 0.02422892, -1.821053, 0.1215686, 1, 0, 1,
-0.5505585, -0.7571036, -1.280171, 0.1176471, 1, 0, 1,
-0.5493416, 0.03911372, -2.621203, 0.1098039, 1, 0, 1,
-0.5489363, -1.054253, -1.612031, 0.1058824, 1, 0, 1,
-0.5482355, 1.191691, 1.012362, 0.09803922, 1, 0, 1,
-0.544643, 0.6643118, 0.6377512, 0.09019608, 1, 0, 1,
-0.5420046, 0.7372114, -0.2114813, 0.08627451, 1, 0, 1,
-0.5365981, 0.04607445, -2.787953, 0.07843138, 1, 0, 1,
-0.5360867, -1.054582, -1.816205, 0.07450981, 1, 0, 1,
-0.5307775, 0.131276, -1.658171, 0.06666667, 1, 0, 1,
-0.5292208, -1.31151, -3.308814, 0.0627451, 1, 0, 1,
-0.5281857, -0.1005287, -2.663821, 0.05490196, 1, 0, 1,
-0.5217524, 0.4604232, -1.495805, 0.05098039, 1, 0, 1,
-0.5199729, 1.500712, -2.262024, 0.04313726, 1, 0, 1,
-0.5192615, 0.1003394, -2.490944, 0.03921569, 1, 0, 1,
-0.5150922, 1.60187, 0.09552144, 0.03137255, 1, 0, 1,
-0.514227, 1.266708, -1.242177, 0.02745098, 1, 0, 1,
-0.5141172, -0.2086494, -3.06824, 0.01960784, 1, 0, 1,
-0.5115081, -0.4744637, -4.136439, 0.01568628, 1, 0, 1,
-0.5067678, -1.275337, -2.232814, 0.007843138, 1, 0, 1,
-0.5050759, -0.4704579, -2.432527, 0.003921569, 1, 0, 1,
-0.4986589, -0.05563211, -1.015042, 0, 1, 0.003921569, 1,
-0.4981622, 2.704064, -0.8759758, 0, 1, 0.01176471, 1,
-0.49789, 0.7888997, 1.063015, 0, 1, 0.01568628, 1,
-0.490318, -1.465096, -4.129325, 0, 1, 0.02352941, 1,
-0.4902138, 0.5954502, -1.342435, 0, 1, 0.02745098, 1,
-0.4861972, 0.3755095, -0.4014536, 0, 1, 0.03529412, 1,
-0.4844698, -0.502751, -0.4010809, 0, 1, 0.03921569, 1,
-0.4797971, 1.369905, -0.08593384, 0, 1, 0.04705882, 1,
-0.4796985, 0.7655983, 0.1493575, 0, 1, 0.05098039, 1,
-0.4760908, -1.264848, -0.721658, 0, 1, 0.05882353, 1,
-0.4724781, -0.3034893, -1.536807, 0, 1, 0.0627451, 1,
-0.4695103, 1.613213, -1.090645, 0, 1, 0.07058824, 1,
-0.4684092, -0.95272, -2.563246, 0, 1, 0.07450981, 1,
-0.4660231, 0.7641193, 0.1989669, 0, 1, 0.08235294, 1,
-0.4623412, 0.07286245, -2.794491, 0, 1, 0.08627451, 1,
-0.4614642, -0.5574952, -2.614038, 0, 1, 0.09411765, 1,
-0.4587798, 0.5367302, 0.5013868, 0, 1, 0.1019608, 1,
-0.4572941, -1.699063, -1.381796, 0, 1, 0.1058824, 1,
-0.4565594, -0.09693386, -2.14297, 0, 1, 0.1137255, 1,
-0.448151, 0.4777805, -1.409753, 0, 1, 0.1176471, 1,
-0.4455591, 1.623156, -0.7194632, 0, 1, 0.1254902, 1,
-0.4416604, -0.460342, -3.1682, 0, 1, 0.1294118, 1,
-0.4409108, 0.2912364, -2.229388, 0, 1, 0.1372549, 1,
-0.4393519, 2.026734, 0.7076014, 0, 1, 0.1411765, 1,
-0.4390807, 0.8180484, -1.287517, 0, 1, 0.1490196, 1,
-0.4378214, 0.4448099, -0.1106673, 0, 1, 0.1529412, 1,
-0.4377904, -0.6083638, -3.483627, 0, 1, 0.1607843, 1,
-0.4328638, 0.02099228, -1.660453, 0, 1, 0.1647059, 1,
-0.4220608, -0.7942044, -2.685274, 0, 1, 0.172549, 1,
-0.4163642, -0.5394421, -2.929147, 0, 1, 0.1764706, 1,
-0.4130177, -0.2390074, -0.09656972, 0, 1, 0.1843137, 1,
-0.4103909, -1.341006, -2.892072, 0, 1, 0.1882353, 1,
-0.4095602, 0.16912, 0.08949585, 0, 1, 0.1960784, 1,
-0.4094162, -0.06677742, -0.961046, 0, 1, 0.2039216, 1,
-0.4077644, 1.260525, -0.2725062, 0, 1, 0.2078431, 1,
-0.4068659, 0.1710242, -2.433097, 0, 1, 0.2156863, 1,
-0.4048623, 0.3648823, -1.542107, 0, 1, 0.2196078, 1,
-0.400198, -2.839049, -2.706635, 0, 1, 0.227451, 1,
-0.3993548, -0.8530058, -1.841022, 0, 1, 0.2313726, 1,
-0.3988083, -0.05963267, -1.559634, 0, 1, 0.2392157, 1,
-0.3939719, 0.145106, -0.6163526, 0, 1, 0.2431373, 1,
-0.3921771, -1.759585, -4.341647, 0, 1, 0.2509804, 1,
-0.3921414, -0.5061087, -2.992408, 0, 1, 0.254902, 1,
-0.3849682, -1.177993, -2.059712, 0, 1, 0.2627451, 1,
-0.3801156, -2.376173, -5.138529, 0, 1, 0.2666667, 1,
-0.3748753, -0.5926611, -1.784003, 0, 1, 0.2745098, 1,
-0.3726393, 1.265417, 1.270946, 0, 1, 0.2784314, 1,
-0.3721927, -0.5179085, -2.84684, 0, 1, 0.2862745, 1,
-0.3697387, -0.6868324, -3.770836, 0, 1, 0.2901961, 1,
-0.3669442, 0.2581969, -0.754851, 0, 1, 0.2980392, 1,
-0.3659133, -0.541039, -4.090956, 0, 1, 0.3058824, 1,
-0.3651057, -0.4028162, -2.366265, 0, 1, 0.3098039, 1,
-0.3631357, -0.2180097, -1.442995, 0, 1, 0.3176471, 1,
-0.359957, -0.3673589, -2.027337, 0, 1, 0.3215686, 1,
-0.3553827, -2.07336, -3.448386, 0, 1, 0.3294118, 1,
-0.3546854, -0.04247693, -0.4232706, 0, 1, 0.3333333, 1,
-0.3543873, -0.06752077, -3.657847, 0, 1, 0.3411765, 1,
-0.3505693, -0.1390159, -0.9510401, 0, 1, 0.345098, 1,
-0.3497168, -0.6455601, -2.063918, 0, 1, 0.3529412, 1,
-0.3495564, -0.6270052, -2.017683, 0, 1, 0.3568628, 1,
-0.3485756, 0.6815758, -0.1402507, 0, 1, 0.3647059, 1,
-0.3485107, -0.3914358, -1.637628, 0, 1, 0.3686275, 1,
-0.347125, 1.003989, 0.2315222, 0, 1, 0.3764706, 1,
-0.346596, -0.1533947, -2.536613, 0, 1, 0.3803922, 1,
-0.3425809, 1.636828, -0.6198518, 0, 1, 0.3882353, 1,
-0.3410932, -1.839272, -2.655911, 0, 1, 0.3921569, 1,
-0.3401106, 0.5908247, -1.194454, 0, 1, 0.4, 1,
-0.3392613, 0.4531635, -1.472901, 0, 1, 0.4078431, 1,
-0.3388425, -0.8626476, -4.726243, 0, 1, 0.4117647, 1,
-0.3368246, -1.03546, -2.934549, 0, 1, 0.4196078, 1,
-0.3348158, 0.7455211, -0.1672453, 0, 1, 0.4235294, 1,
-0.3344312, -0.1534374, -2.187382, 0, 1, 0.4313726, 1,
-0.3319574, -0.4486281, -2.36237, 0, 1, 0.4352941, 1,
-0.3284528, 0.1054054, 0.04668941, 0, 1, 0.4431373, 1,
-0.3245146, 0.6069556, 0.3912516, 0, 1, 0.4470588, 1,
-0.3189097, 0.9246956, 1.122554, 0, 1, 0.454902, 1,
-0.3185889, 1.768855, -1.676103, 0, 1, 0.4588235, 1,
-0.3133554, -2.08327, -3.181251, 0, 1, 0.4666667, 1,
-0.3091706, 1.472175, -0.4967043, 0, 1, 0.4705882, 1,
-0.3080119, -0.2211303, -1.520612, 0, 1, 0.4784314, 1,
-0.3009828, 1.664048, -0.5015472, 0, 1, 0.4823529, 1,
-0.2973848, -0.04273164, 0.9402362, 0, 1, 0.4901961, 1,
-0.2958885, -0.548527, -1.98015, 0, 1, 0.4941176, 1,
-0.2938705, -0.3644933, -2.529892, 0, 1, 0.5019608, 1,
-0.2880005, -0.1056454, -1.489759, 0, 1, 0.509804, 1,
-0.2856217, -0.1870866, -1.400814, 0, 1, 0.5137255, 1,
-0.2831015, 0.8723683, -0.9525172, 0, 1, 0.5215687, 1,
-0.2824216, 0.5257913, -0.9313065, 0, 1, 0.5254902, 1,
-0.2800561, -0.7452662, -3.519158, 0, 1, 0.5333334, 1,
-0.2725895, 1.469635, -0.2148805, 0, 1, 0.5372549, 1,
-0.2701608, -0.5687684, -3.974924, 0, 1, 0.5450981, 1,
-0.2672856, 0.9182316, -0.6608534, 0, 1, 0.5490196, 1,
-0.2650062, 0.6155255, -1.538767, 0, 1, 0.5568628, 1,
-0.2634479, -1.602952, -2.78981, 0, 1, 0.5607843, 1,
-0.2559915, 0.131392, -1.803163, 0, 1, 0.5686275, 1,
-0.2554336, 0.7954561, -0.4943937, 0, 1, 0.572549, 1,
-0.2549525, 0.4683112, -0.7033961, 0, 1, 0.5803922, 1,
-0.2533977, 0.3460586, -0.3902824, 0, 1, 0.5843138, 1,
-0.2520775, 2.796028, 0.8993145, 0, 1, 0.5921569, 1,
-0.2493575, 0.3650964, -2.196509, 0, 1, 0.5960785, 1,
-0.2460949, -0.4991406, -2.4244, 0, 1, 0.6039216, 1,
-0.2420721, 0.3104909, -0.1756416, 0, 1, 0.6117647, 1,
-0.240837, -0.9531973, -3.842636, 0, 1, 0.6156863, 1,
-0.2408042, -1.050932, -2.573494, 0, 1, 0.6235294, 1,
-0.2332376, 1.173018, 1.835389, 0, 1, 0.627451, 1,
-0.2221316, -1.354624, -3.633044, 0, 1, 0.6352941, 1,
-0.2219597, -0.9565278, -4.860152, 0, 1, 0.6392157, 1,
-0.219843, -0.6642749, -0.2880872, 0, 1, 0.6470588, 1,
-0.2179043, -1.424973, -3.406995, 0, 1, 0.6509804, 1,
-0.2149024, -0.1348863, -1.520176, 0, 1, 0.6588235, 1,
-0.2085343, 0.9046838, 1.365614, 0, 1, 0.6627451, 1,
-0.2069189, -0.3135753, -3.528764, 0, 1, 0.6705883, 1,
-0.2037031, 3.688391, -0.4885333, 0, 1, 0.6745098, 1,
-0.1959007, -0.04515767, -1.507869, 0, 1, 0.682353, 1,
-0.1951156, -0.9984294, -4.813521, 0, 1, 0.6862745, 1,
-0.1923931, 1.622301, -1.050563, 0, 1, 0.6941177, 1,
-0.1897969, 1.218043, -1.191992, 0, 1, 0.7019608, 1,
-0.1873538, -0.8055986, -4.457088, 0, 1, 0.7058824, 1,
-0.1807139, 0.01039615, -1.653277, 0, 1, 0.7137255, 1,
-0.1792151, -1.900834, -2.611053, 0, 1, 0.7176471, 1,
-0.1753221, 0.03115502, -2.963721, 0, 1, 0.7254902, 1,
-0.1699833, -0.1472843, -1.5181, 0, 1, 0.7294118, 1,
-0.1674016, 0.9023537, -0.5601449, 0, 1, 0.7372549, 1,
-0.1668819, 1.927512, 1.545327, 0, 1, 0.7411765, 1,
-0.1659972, 0.2094935, -0.9725218, 0, 1, 0.7490196, 1,
-0.1653664, -0.7530411, -4.141513, 0, 1, 0.7529412, 1,
-0.1614392, 1.295743, 1.168058, 0, 1, 0.7607843, 1,
-0.160272, -0.7904356, -4.96968, 0, 1, 0.7647059, 1,
-0.1588784, -0.6245692, -2.468486, 0, 1, 0.772549, 1,
-0.1526661, -0.5816848, -2.342254, 0, 1, 0.7764706, 1,
-0.1508936, -0.5847797, -3.502223, 0, 1, 0.7843137, 1,
-0.1498399, 0.3502152, 0.480113, 0, 1, 0.7882353, 1,
-0.1483951, 1.694644, 0.4928251, 0, 1, 0.7960784, 1,
-0.1481048, 0.5417768, -1.361775, 0, 1, 0.8039216, 1,
-0.1446575, 1.073276, -1.732562, 0, 1, 0.8078431, 1,
-0.1393735, 1.740788, -0.187416, 0, 1, 0.8156863, 1,
-0.1362098, 0.6296156, 0.1458251, 0, 1, 0.8196079, 1,
-0.1353764, -0.6834951, -1.319538, 0, 1, 0.827451, 1,
-0.133168, 0.3757711, -0.1209832, 0, 1, 0.8313726, 1,
-0.1328889, 0.8399449, 0.1054903, 0, 1, 0.8392157, 1,
-0.132162, -1.158425, -3.922324, 0, 1, 0.8431373, 1,
-0.1296399, 1.026658, -0.28555, 0, 1, 0.8509804, 1,
-0.1294302, -0.07912753, -0.9857641, 0, 1, 0.854902, 1,
-0.128263, 0.4621868, -0.3884043, 0, 1, 0.8627451, 1,
-0.1282116, -1.543635, -0.9845214, 0, 1, 0.8666667, 1,
-0.1279818, 0.3703361, 0.7315062, 0, 1, 0.8745098, 1,
-0.127008, -0.5723665, -3.726364, 0, 1, 0.8784314, 1,
-0.1264744, -0.1173825, -0.9254475, 0, 1, 0.8862745, 1,
-0.1246472, 0.1722108, -0.2644999, 0, 1, 0.8901961, 1,
-0.1242672, -1.783565, -3.356557, 0, 1, 0.8980392, 1,
-0.1229712, 0.3007984, -2.561419, 0, 1, 0.9058824, 1,
-0.1214976, -0.7218358, -2.849296, 0, 1, 0.9098039, 1,
-0.1086925, -1.128584, -2.669716, 0, 1, 0.9176471, 1,
-0.1074014, 0.2247049, -0.00624111, 0, 1, 0.9215686, 1,
-0.1070632, -2.014916, -4.059525, 0, 1, 0.9294118, 1,
-0.1042882, 1.344961, 1.219767, 0, 1, 0.9333333, 1,
-0.1002193, -1.043712, -3.669425, 0, 1, 0.9411765, 1,
-0.09975807, 0.3949445, 1.384567, 0, 1, 0.945098, 1,
-0.09712118, -0.1973859, -0.5006261, 0, 1, 0.9529412, 1,
-0.09509505, 0.9272829, 0.3171337, 0, 1, 0.9568627, 1,
-0.09241579, 0.5315216, -1.268363, 0, 1, 0.9647059, 1,
-0.08803898, -1.332235, -2.50995, 0, 1, 0.9686275, 1,
-0.08325493, 0.5439745, -1.210708, 0, 1, 0.9764706, 1,
-0.08157909, -3.115218, -2.413678, 0, 1, 0.9803922, 1,
-0.08128112, -0.7274082, -3.898135, 0, 1, 0.9882353, 1,
-0.07856657, -1.125962, -3.794092, 0, 1, 0.9921569, 1,
-0.07303043, 0.8253947, -2.051274, 0, 1, 1, 1,
-0.07067927, -2.307118, -2.94716, 0, 0.9921569, 1, 1,
-0.06847068, -0.03051257, -3.61017, 0, 0.9882353, 1, 1,
-0.06738457, 0.3717329, 0.9384504, 0, 0.9803922, 1, 1,
-0.06483916, 0.5580412, -0.1841273, 0, 0.9764706, 1, 1,
-0.05589521, 0.4536902, 2.077518, 0, 0.9686275, 1, 1,
-0.04497521, -0.5458488, -1.393293, 0, 0.9647059, 1, 1,
-0.04316822, -0.04122125, -2.162845, 0, 0.9568627, 1, 1,
-0.03920137, -0.181564, -3.057009, 0, 0.9529412, 1, 1,
-0.03533397, 0.4969525, 0.4665931, 0, 0.945098, 1, 1,
-0.03520727, -1.007582, -3.301245, 0, 0.9411765, 1, 1,
-0.03241004, 1.180001, -1.39008, 0, 0.9333333, 1, 1,
-0.02992503, -0.7392692, -5.263051, 0, 0.9294118, 1, 1,
-0.02909726, -0.7580491, -2.520137, 0, 0.9215686, 1, 1,
-0.02759996, 0.4228024, 0.3330287, 0, 0.9176471, 1, 1,
-0.02446122, -1.059223, -1.736524, 0, 0.9098039, 1, 1,
-0.02339529, -0.7179489, -4.132624, 0, 0.9058824, 1, 1,
-0.02086348, -2.587163, -4.083314, 0, 0.8980392, 1, 1,
-0.0186286, -0.5069678, -4.062996, 0, 0.8901961, 1, 1,
-0.01815045, -0.3881326, -3.76469, 0, 0.8862745, 1, 1,
-0.01660257, 0.6901065, -0.1663456, 0, 0.8784314, 1, 1,
-0.01594127, 1.235597, -0.3424194, 0, 0.8745098, 1, 1,
-0.01296233, -0.01634909, -2.630234, 0, 0.8666667, 1, 1,
-0.0125772, 0.7577696, 0.278717, 0, 0.8627451, 1, 1,
-0.004789702, -0.8478408, -4.024326, 0, 0.854902, 1, 1,
-0.004383502, -0.3084202, -2.229397, 0, 0.8509804, 1, 1,
-0.002401714, -0.9838269, -3.912387, 0, 0.8431373, 1, 1,
0.005361795, -0.3408456, 4.254692, 0, 0.8392157, 1, 1,
0.005404482, 1.457587, -0.5351617, 0, 0.8313726, 1, 1,
0.007815656, -1.597236, 3.870001, 0, 0.827451, 1, 1,
0.01042696, 0.2039266, -1.693134, 0, 0.8196079, 1, 1,
0.01414307, 1.583304, 1.753728, 0, 0.8156863, 1, 1,
0.01511729, 1.337773, -0.004818849, 0, 0.8078431, 1, 1,
0.0153406, 0.1230921, -0.1150264, 0, 0.8039216, 1, 1,
0.01820177, 0.5344384, -1.252414, 0, 0.7960784, 1, 1,
0.02064089, 1.144239, -0.8949065, 0, 0.7882353, 1, 1,
0.0211879, -0.4625591, 0.8698878, 0, 0.7843137, 1, 1,
0.02563866, -0.3019909, 2.482634, 0, 0.7764706, 1, 1,
0.03332407, -0.4053425, 2.652706, 0, 0.772549, 1, 1,
0.0334613, 0.3011819, 0.09332866, 0, 0.7647059, 1, 1,
0.03395304, 1.068821, 0.0007939865, 0, 0.7607843, 1, 1,
0.03535505, -0.1978825, 2.84954, 0, 0.7529412, 1, 1,
0.03598168, 1.731516, -0.5391352, 0, 0.7490196, 1, 1,
0.03814195, -1.067791, 2.388916, 0, 0.7411765, 1, 1,
0.04426448, 2.102893, 0.579427, 0, 0.7372549, 1, 1,
0.04493829, -0.1339036, 2.706893, 0, 0.7294118, 1, 1,
0.05586825, -0.2861031, 2.970662, 0, 0.7254902, 1, 1,
0.05625326, -0.1391252, 2.460148, 0, 0.7176471, 1, 1,
0.05969035, 0.3366374, -0.5702662, 0, 0.7137255, 1, 1,
0.06376409, -0.1498854, 3.379486, 0, 0.7058824, 1, 1,
0.06470138, 0.6574126, -1.612516, 0, 0.6980392, 1, 1,
0.06974308, -1.814288, 5.15371, 0, 0.6941177, 1, 1,
0.06976519, 2.474989, -1.800999, 0, 0.6862745, 1, 1,
0.07011812, 1.7635, -1.181214, 0, 0.682353, 1, 1,
0.07666764, 0.5037897, -0.2058875, 0, 0.6745098, 1, 1,
0.07869532, 1.625317, -0.14301, 0, 0.6705883, 1, 1,
0.08285682, 0.2312538, 0.02050589, 0, 0.6627451, 1, 1,
0.08906858, -0.4793802, 2.380857, 0, 0.6588235, 1, 1,
0.09324472, -1.585885, 2.269916, 0, 0.6509804, 1, 1,
0.098585, 0.5956922, 0.5616679, 0, 0.6470588, 1, 1,
0.1034713, -1.966929, 5.59093, 0, 0.6392157, 1, 1,
0.1036713, 0.1445611, 0.7224118, 0, 0.6352941, 1, 1,
0.1036838, -1.084138, 3.714511, 0, 0.627451, 1, 1,
0.107434, 1.848191, 0.9177806, 0, 0.6235294, 1, 1,
0.1095174, 0.5162599, 0.17517, 0, 0.6156863, 1, 1,
0.112108, 0.2059293, 1.057595, 0, 0.6117647, 1, 1,
0.1133123, -0.9919586, 2.025133, 0, 0.6039216, 1, 1,
0.1162333, -0.61602, 3.604071, 0, 0.5960785, 1, 1,
0.1207075, 0.1817691, 1.039399, 0, 0.5921569, 1, 1,
0.1225937, 1.578657, -0.1228786, 0, 0.5843138, 1, 1,
0.1276338, 0.2407791, 2.083647, 0, 0.5803922, 1, 1,
0.1306434, -0.5465491, 3.150568, 0, 0.572549, 1, 1,
0.137517, 1.483905, -0.3854603, 0, 0.5686275, 1, 1,
0.1388181, -1.677377, 1.671691, 0, 0.5607843, 1, 1,
0.144276, 1.325055, -1.096014, 0, 0.5568628, 1, 1,
0.1452521, 2.4169, -0.4668537, 0, 0.5490196, 1, 1,
0.1486777, 0.2298661, 0.6090542, 0, 0.5450981, 1, 1,
0.1489493, -0.6407316, 4.224347, 0, 0.5372549, 1, 1,
0.15095, 1.035841, 0.05856525, 0, 0.5333334, 1, 1,
0.1525519, -0.09575847, 2.27228, 0, 0.5254902, 1, 1,
0.1536273, 0.09996656, 1.820707, 0, 0.5215687, 1, 1,
0.154787, -1.747702, 4.043179, 0, 0.5137255, 1, 1,
0.1573137, -1.234977, 4.86656, 0, 0.509804, 1, 1,
0.157979, -0.6754392, 3.815239, 0, 0.5019608, 1, 1,
0.1588748, -1.534278, 3.214589, 0, 0.4941176, 1, 1,
0.1617982, -0.9663885, 3.789727, 0, 0.4901961, 1, 1,
0.1686097, 0.5278908, -0.8496128, 0, 0.4823529, 1, 1,
0.1697215, -2.019922, 5.140391, 0, 0.4784314, 1, 1,
0.1779647, -0.1237034, 3.620004, 0, 0.4705882, 1, 1,
0.1846766, -0.7593077, 1.144089, 0, 0.4666667, 1, 1,
0.1890435, -1.068648, 2.742161, 0, 0.4588235, 1, 1,
0.1911925, 0.5253187, 0.8621532, 0, 0.454902, 1, 1,
0.1929426, -0.8446257, 1.503281, 0, 0.4470588, 1, 1,
0.1947831, 0.2916767, 0.8454714, 0, 0.4431373, 1, 1,
0.1951928, 0.4275288, 1.18935, 0, 0.4352941, 1, 1,
0.1953108, -1.28053, 3.921476, 0, 0.4313726, 1, 1,
0.1969262, 0.4111129, 0.2948951, 0, 0.4235294, 1, 1,
0.2031112, -0.2368705, 2.84324, 0, 0.4196078, 1, 1,
0.2035655, 1.639365, 0.3037514, 0, 0.4117647, 1, 1,
0.203595, 1.048208, 0.2755287, 0, 0.4078431, 1, 1,
0.2051829, -0.1056624, 3.694739, 0, 0.4, 1, 1,
0.2144629, 0.4631926, -0.3050028, 0, 0.3921569, 1, 1,
0.2199511, 0.9017944, -0.5059428, 0, 0.3882353, 1, 1,
0.2208107, 0.7229928, -1.074539, 0, 0.3803922, 1, 1,
0.2217728, 0.1295845, 1.545748, 0, 0.3764706, 1, 1,
0.2219804, -0.1555029, 1.452083, 0, 0.3686275, 1, 1,
0.2245577, 0.05422315, -0.8189052, 0, 0.3647059, 1, 1,
0.225662, -0.424525, 4.097755, 0, 0.3568628, 1, 1,
0.2275396, -0.5084718, 3.797857, 0, 0.3529412, 1, 1,
0.236942, -0.701503, 1.767342, 0, 0.345098, 1, 1,
0.237532, 1.099601, 0.02255918, 0, 0.3411765, 1, 1,
0.2391406, -0.8724849, 2.761256, 0, 0.3333333, 1, 1,
0.2505891, 1.568721, 2.511483, 0, 0.3294118, 1, 1,
0.2521659, 0.7140789, 1.133384, 0, 0.3215686, 1, 1,
0.2551185, 0.4545948, -0.1478653, 0, 0.3176471, 1, 1,
0.2591831, 1.34087, 2.266627, 0, 0.3098039, 1, 1,
0.2622322, 0.503298, -0.06599382, 0, 0.3058824, 1, 1,
0.262937, 0.3124977, -0.5675929, 0, 0.2980392, 1, 1,
0.2666803, 2.09726, 0.5776455, 0, 0.2901961, 1, 1,
0.2689618, -0.2574795, 3.894592, 0, 0.2862745, 1, 1,
0.2694391, 0.1723885, 1.0337, 0, 0.2784314, 1, 1,
0.2774991, 1.290747, -0.3391113, 0, 0.2745098, 1, 1,
0.2811163, -0.2139721, 0.7591037, 0, 0.2666667, 1, 1,
0.2892015, 0.4989093, -0.499691, 0, 0.2627451, 1, 1,
0.2899559, -1.379427, 2.790334, 0, 0.254902, 1, 1,
0.2904917, -1.405672, 2.187345, 0, 0.2509804, 1, 1,
0.2912803, -0.682329, 3.813114, 0, 0.2431373, 1, 1,
0.2940001, -0.4099512, 0.6947181, 0, 0.2392157, 1, 1,
0.2959087, 0.3520219, 1.160536, 0, 0.2313726, 1, 1,
0.2986162, 0.4557825, 1.218208, 0, 0.227451, 1, 1,
0.3002302, -0.5859682, 3.769519, 0, 0.2196078, 1, 1,
0.3025655, -0.5838564, 2.186535, 0, 0.2156863, 1, 1,
0.3039643, -0.6815276, 2.334868, 0, 0.2078431, 1, 1,
0.3041515, -0.694446, 0.7186958, 0, 0.2039216, 1, 1,
0.3043631, 1.480183, 0.7087317, 0, 0.1960784, 1, 1,
0.3059437, 1.056098, 0.9443427, 0, 0.1882353, 1, 1,
0.3061436, -0.448549, 0.9377357, 0, 0.1843137, 1, 1,
0.3105423, 0.1793705, 1.423522, 0, 0.1764706, 1, 1,
0.31201, -0.0458004, 0.4197203, 0, 0.172549, 1, 1,
0.3129131, 0.7590727, 0.7841519, 0, 0.1647059, 1, 1,
0.3155282, 0.7494244, -0.137231, 0, 0.1607843, 1, 1,
0.3155417, 1.426575, -0.4687451, 0, 0.1529412, 1, 1,
0.3168739, 1.054106, 1.154228, 0, 0.1490196, 1, 1,
0.3242671, 0.07063908, 0.9756356, 0, 0.1411765, 1, 1,
0.3253592, 1.037405, 0.1506513, 0, 0.1372549, 1, 1,
0.3270262, -0.4831305, 4.171109, 0, 0.1294118, 1, 1,
0.3280172, -0.3903031, 2.340829, 0, 0.1254902, 1, 1,
0.3342475, 0.2755508, 2.274301, 0, 0.1176471, 1, 1,
0.3352353, -1.94583, 1.509819, 0, 0.1137255, 1, 1,
0.3360048, -1.478144, 3.44608, 0, 0.1058824, 1, 1,
0.3364872, -0.7029795, 3.03209, 0, 0.09803922, 1, 1,
0.3401216, -0.4517436, 3.66609, 0, 0.09411765, 1, 1,
0.3438197, -0.2564014, 2.404999, 0, 0.08627451, 1, 1,
0.3451859, 0.4402831, 1.167018, 0, 0.08235294, 1, 1,
0.3470589, 0.5281054, 0.9840127, 0, 0.07450981, 1, 1,
0.3478912, 0.951991, 1.54735, 0, 0.07058824, 1, 1,
0.3479696, 1.06857, 2.178436, 0, 0.0627451, 1, 1,
0.3492072, -2.83128, 1.562247, 0, 0.05882353, 1, 1,
0.3500989, -0.4344142, 3.931302, 0, 0.05098039, 1, 1,
0.3516176, 1.166799, 2.032231, 0, 0.04705882, 1, 1,
0.3550861, 0.1020594, 3.134257, 0, 0.03921569, 1, 1,
0.3553521, 1.561211, 0.9636848, 0, 0.03529412, 1, 1,
0.3589204, 0.3940175, 0.9067201, 0, 0.02745098, 1, 1,
0.3590702, -1.19906, 1.818717, 0, 0.02352941, 1, 1,
0.3663146, -0.8377458, 3.227973, 0, 0.01568628, 1, 1,
0.3689094, 0.6343944, 0.7419261, 0, 0.01176471, 1, 1,
0.3701791, 0.4605995, 0.4143818, 0, 0.003921569, 1, 1,
0.3703121, -0.3426319, 3.806331, 0.003921569, 0, 1, 1,
0.3743587, 0.4655256, 0.4245722, 0.007843138, 0, 1, 1,
0.3778375, -0.6660889, 1.775505, 0.01568628, 0, 1, 1,
0.3814948, -0.5888609, 1.625317, 0.01960784, 0, 1, 1,
0.3815449, -0.2813629, 2.436793, 0.02745098, 0, 1, 1,
0.3840685, 0.7538226, -0.8051581, 0.03137255, 0, 1, 1,
0.387004, 0.2822832, 2.846601, 0.03921569, 0, 1, 1,
0.3893871, 0.4809405, -0.4061489, 0.04313726, 0, 1, 1,
0.3910439, 0.2229171, 0.750653, 0.05098039, 0, 1, 1,
0.3919401, -0.01579024, 2.784745, 0.05490196, 0, 1, 1,
0.3937437, -0.5104452, 4.218602, 0.0627451, 0, 1, 1,
0.4090267, 0.5710599, 1.171355, 0.06666667, 0, 1, 1,
0.4132667, 1.222147, 1.093005, 0.07450981, 0, 1, 1,
0.4229368, -0.7488828, 2.700147, 0.07843138, 0, 1, 1,
0.4240586, -1.173148, 1.800253, 0.08627451, 0, 1, 1,
0.4343616, -0.8194932, 3.547799, 0.09019608, 0, 1, 1,
0.4404887, -0.6940902, 4.54124, 0.09803922, 0, 1, 1,
0.4423623, -1.43717, 2.491561, 0.1058824, 0, 1, 1,
0.4462864, -1.787956, 2.887516, 0.1098039, 0, 1, 1,
0.4530606, 0.0800025, 2.282541, 0.1176471, 0, 1, 1,
0.4535788, 0.7279879, -0.9846264, 0.1215686, 0, 1, 1,
0.4590541, -0.7713879, 2.711306, 0.1294118, 0, 1, 1,
0.4633195, 3.049489, -0.5068102, 0.1333333, 0, 1, 1,
0.4738915, 0.549043, 1.10303, 0.1411765, 0, 1, 1,
0.4740925, 0.7455979, 0.9075493, 0.145098, 0, 1, 1,
0.4780411, -1.195798, 1.840322, 0.1529412, 0, 1, 1,
0.4790324, 1.219425, -0.1145726, 0.1568628, 0, 1, 1,
0.4823167, -1.592229, 1.328437, 0.1647059, 0, 1, 1,
0.4831644, 1.303552, -0.644278, 0.1686275, 0, 1, 1,
0.4835998, 0.9866122, 0.468872, 0.1764706, 0, 1, 1,
0.4857075, 0.1122312, 2.804618, 0.1803922, 0, 1, 1,
0.4860559, 0.5380518, 0.6482428, 0.1882353, 0, 1, 1,
0.486711, -0.9793527, 4.114051, 0.1921569, 0, 1, 1,
0.487677, 0.5968444, 2.39258, 0.2, 0, 1, 1,
0.4935474, -0.7443491, 3.555016, 0.2078431, 0, 1, 1,
0.4957981, 0.943621, 2.337274, 0.2117647, 0, 1, 1,
0.5050347, 0.1016348, 1.860762, 0.2196078, 0, 1, 1,
0.5082826, 0.05752018, 1.148824, 0.2235294, 0, 1, 1,
0.5084997, -0.3684141, 2.514273, 0.2313726, 0, 1, 1,
0.5109296, 0.7344577, 0.832101, 0.2352941, 0, 1, 1,
0.5116051, 1.64083, -0.7771864, 0.2431373, 0, 1, 1,
0.512661, -0.8125046, 3.460456, 0.2470588, 0, 1, 1,
0.5165589, 0.03802773, 2.66734, 0.254902, 0, 1, 1,
0.5188434, 0.4077151, 0.7708462, 0.2588235, 0, 1, 1,
0.5232072, -0.02225956, 1.192285, 0.2666667, 0, 1, 1,
0.5262961, 0.6266706, 1.869613, 0.2705882, 0, 1, 1,
0.5270684, 0.8284364, -0.1162778, 0.2784314, 0, 1, 1,
0.5309386, 1.779275, 1.085681, 0.282353, 0, 1, 1,
0.5349937, -1.131872, 3.777712, 0.2901961, 0, 1, 1,
0.535014, -0.570172, 3.402107, 0.2941177, 0, 1, 1,
0.5363544, 0.4445808, 1.264608, 0.3019608, 0, 1, 1,
0.536597, -0.3974393, 2.013728, 0.3098039, 0, 1, 1,
0.5429853, 0.7494537, -0.6905001, 0.3137255, 0, 1, 1,
0.5430001, -1.070896, 4.508141, 0.3215686, 0, 1, 1,
0.5441192, -1.656097, 1.682011, 0.3254902, 0, 1, 1,
0.5542174, -1.267328, 5.125785, 0.3333333, 0, 1, 1,
0.5586426, 0.2766634, 1.527843, 0.3372549, 0, 1, 1,
0.5607929, -0.1756004, 1.021709, 0.345098, 0, 1, 1,
0.5653993, 1.594806, 1.679134, 0.3490196, 0, 1, 1,
0.5733234, 0.3599956, 2.005921, 0.3568628, 0, 1, 1,
0.5839305, 0.4056097, 1.273312, 0.3607843, 0, 1, 1,
0.5854114, 0.4183064, 0.803288, 0.3686275, 0, 1, 1,
0.5942935, -0.4731902, 2.643816, 0.372549, 0, 1, 1,
0.5990758, 2.525983, 1.918951, 0.3803922, 0, 1, 1,
0.6006905, 1.945475, -0.3740417, 0.3843137, 0, 1, 1,
0.602294, -1.078119, 3.543764, 0.3921569, 0, 1, 1,
0.6075631, 1.817403, 2.026569, 0.3960784, 0, 1, 1,
0.6091794, 0.4799766, 0.2287607, 0.4039216, 0, 1, 1,
0.6093067, -0.9971246, 3.69413, 0.4117647, 0, 1, 1,
0.6103398, 1.136497, 0.3037641, 0.4156863, 0, 1, 1,
0.6112339, 0.8354926, 0.7396729, 0.4235294, 0, 1, 1,
0.619189, 1.586497, 0.7530509, 0.427451, 0, 1, 1,
0.6232364, -1.994262, 2.402488, 0.4352941, 0, 1, 1,
0.6242628, -1.58887, 2.890392, 0.4392157, 0, 1, 1,
0.6250529, 1.692919, 0.5242825, 0.4470588, 0, 1, 1,
0.6330251, 0.566983, 0.589262, 0.4509804, 0, 1, 1,
0.6354308, 0.5260863, -1.512649, 0.4588235, 0, 1, 1,
0.6372275, -0.1304795, 1.403124, 0.4627451, 0, 1, 1,
0.6406477, -0.5787954, 0.7029708, 0.4705882, 0, 1, 1,
0.6421376, -0.1332487, 2.501677, 0.4745098, 0, 1, 1,
0.6429691, -1.202592, 2.63302, 0.4823529, 0, 1, 1,
0.6442807, 0.121506, 1.982193, 0.4862745, 0, 1, 1,
0.6458361, 0.5026731, 0.6048139, 0.4941176, 0, 1, 1,
0.6508315, -0.7452741, 1.451422, 0.5019608, 0, 1, 1,
0.6534217, 0.8184043, 2.118331, 0.5058824, 0, 1, 1,
0.6600637, -0.2919322, 1.676839, 0.5137255, 0, 1, 1,
0.6630979, -1.383171, 2.061377, 0.5176471, 0, 1, 1,
0.6671479, -0.1500975, -0.6581306, 0.5254902, 0, 1, 1,
0.6682028, -0.6197617, 1.558384, 0.5294118, 0, 1, 1,
0.6812604, 0.8370355, -1.579834, 0.5372549, 0, 1, 1,
0.6858733, -1.136823, 3.893234, 0.5411765, 0, 1, 1,
0.68927, 0.8258669, 1.226049, 0.5490196, 0, 1, 1,
0.6921287, -1.452718, 3.326338, 0.5529412, 0, 1, 1,
0.699402, -1.579104, 2.377411, 0.5607843, 0, 1, 1,
0.7026722, -1.414293, 2.648106, 0.5647059, 0, 1, 1,
0.7028551, 1.350121, -0.7568234, 0.572549, 0, 1, 1,
0.7051253, -0.7881861, 1.780226, 0.5764706, 0, 1, 1,
0.7078757, -2.2284, 3.592155, 0.5843138, 0, 1, 1,
0.7093912, -2.24227, 3.242032, 0.5882353, 0, 1, 1,
0.715172, -0.4882159, 4.047489, 0.5960785, 0, 1, 1,
0.7155761, -1.00594, 2.821427, 0.6039216, 0, 1, 1,
0.7192162, -0.6316051, 3.916527, 0.6078432, 0, 1, 1,
0.7254181, -0.551228, 3.003175, 0.6156863, 0, 1, 1,
0.7263515, 0.5316159, 0.4059484, 0.6196079, 0, 1, 1,
0.7329683, -0.9306712, 2.342813, 0.627451, 0, 1, 1,
0.7376109, -0.8230876, 2.145125, 0.6313726, 0, 1, 1,
0.7419136, 0.6033273, 2.814559, 0.6392157, 0, 1, 1,
0.7467513, -0.4979989, 3.287825, 0.6431373, 0, 1, 1,
0.7469659, 0.6359921, 0.7525728, 0.6509804, 0, 1, 1,
0.7504137, -0.4760863, 1.690008, 0.654902, 0, 1, 1,
0.7529172, -0.09376507, -0.6736476, 0.6627451, 0, 1, 1,
0.7531547, -0.1299714, 2.424977, 0.6666667, 0, 1, 1,
0.7643691, -0.2804406, 1.548716, 0.6745098, 0, 1, 1,
0.7644826, 0.7751549, 0.9548607, 0.6784314, 0, 1, 1,
0.764755, -1.972533, 3.068732, 0.6862745, 0, 1, 1,
0.7688205, 0.4174837, 1.07982, 0.6901961, 0, 1, 1,
0.7721205, 1.080071, 1.180668, 0.6980392, 0, 1, 1,
0.7798225, 0.9719479, 0.4430572, 0.7058824, 0, 1, 1,
0.7827895, 0.4840764, -0.4273716, 0.7098039, 0, 1, 1,
0.7877879, -1.308572, 3.502171, 0.7176471, 0, 1, 1,
0.7882597, -0.3869164, 2.062091, 0.7215686, 0, 1, 1,
0.7955673, 0.2254726, 1.952711, 0.7294118, 0, 1, 1,
0.7969035, 0.7810376, 1.374247, 0.7333333, 0, 1, 1,
0.8002194, -1.646526, 1.943337, 0.7411765, 0, 1, 1,
0.8003494, -0.08121957, 2.02949, 0.7450981, 0, 1, 1,
0.8039737, 0.5480385, 1.678146, 0.7529412, 0, 1, 1,
0.8045543, -0.8789682, 1.701064, 0.7568628, 0, 1, 1,
0.8073649, 0.1055894, -0.3859887, 0.7647059, 0, 1, 1,
0.8139173, 0.613517, 1.637639, 0.7686275, 0, 1, 1,
0.8143212, -1.054054, 2.875717, 0.7764706, 0, 1, 1,
0.8158091, -1.11234, 4.108662, 0.7803922, 0, 1, 1,
0.8265331, 0.7644873, -1.262372, 0.7882353, 0, 1, 1,
0.8287532, -0.9563345, 2.500867, 0.7921569, 0, 1, 1,
0.8306096, 1.185556, -1.547644, 0.8, 0, 1, 1,
0.83521, 0.1919552, 2.105474, 0.8078431, 0, 1, 1,
0.8442608, 0.7473089, 0.1655177, 0.8117647, 0, 1, 1,
0.8447465, -0.4152907, 1.565771, 0.8196079, 0, 1, 1,
0.8456464, 0.4066876, 0.5121595, 0.8235294, 0, 1, 1,
0.8512036, -0.6822192, 2.641145, 0.8313726, 0, 1, 1,
0.8558745, 0.6111311, -1.896241, 0.8352941, 0, 1, 1,
0.8626198, 2.360204, 0.7939666, 0.8431373, 0, 1, 1,
0.8638778, 0.6901409, 2.038148, 0.8470588, 0, 1, 1,
0.8653742, 0.6437738, 0.813443, 0.854902, 0, 1, 1,
0.8689541, -1.494652, 3.13791, 0.8588235, 0, 1, 1,
0.8747531, 1.263352, 1.124513, 0.8666667, 0, 1, 1,
0.8796255, -0.1675731, 2.07114, 0.8705882, 0, 1, 1,
0.8841239, -0.08787149, 1.194368, 0.8784314, 0, 1, 1,
0.886098, -0.918424, 2.439025, 0.8823529, 0, 1, 1,
0.8871282, 1.061061, 0.325146, 0.8901961, 0, 1, 1,
0.8882335, 1.154085, 2.412426, 0.8941177, 0, 1, 1,
0.8901662, -0.8172441, 4.045331, 0.9019608, 0, 1, 1,
0.8976005, 0.2692946, 1.740491, 0.9098039, 0, 1, 1,
0.9004428, 0.9113321, -0.2914955, 0.9137255, 0, 1, 1,
0.9036064, 0.8773537, 1.339349, 0.9215686, 0, 1, 1,
0.9040325, -1.355605, 2.131792, 0.9254902, 0, 1, 1,
0.9082204, 1.534719, 0.1674903, 0.9333333, 0, 1, 1,
0.9082473, -1.06121, 1.660668, 0.9372549, 0, 1, 1,
0.9100541, 1.467385, 0.713342, 0.945098, 0, 1, 1,
0.9190465, -0.6244912, 3.42214, 0.9490196, 0, 1, 1,
0.9223193, -1.820373, 2.189537, 0.9568627, 0, 1, 1,
0.9313707, 0.06337739, 0.05490471, 0.9607843, 0, 1, 1,
0.937488, -0.485113, 3.576214, 0.9686275, 0, 1, 1,
0.9379054, -0.2062312, 2.213733, 0.972549, 0, 1, 1,
0.939819, 0.01866844, 2.20509, 0.9803922, 0, 1, 1,
0.9552932, 1.227379, 1.281743, 0.9843137, 0, 1, 1,
0.9575289, 0.2263125, 1.614066, 0.9921569, 0, 1, 1,
0.9591415, -0.2318661, 2.561015, 0.9960784, 0, 1, 1,
0.9614927, -0.4954911, 3.41223, 1, 0, 0.9960784, 1,
0.9625444, -1.339435, 2.306298, 1, 0, 0.9882353, 1,
0.9685661, -0.9734808, 3.738078, 1, 0, 0.9843137, 1,
0.9732013, 0.1445463, 1.840234, 1, 0, 0.9764706, 1,
0.9758852, -1.426673, 3.154207, 1, 0, 0.972549, 1,
0.9784638, 0.619111, 0.6629843, 1, 0, 0.9647059, 1,
0.9784896, -0.004460465, 0.2675347, 1, 0, 0.9607843, 1,
0.9808646, -0.7676812, 2.452496, 1, 0, 0.9529412, 1,
0.9900271, -0.7340158, 2.988544, 1, 0, 0.9490196, 1,
0.9971064, -0.4080649, 2.317798, 1, 0, 0.9411765, 1,
0.9973707, -0.4221937, 3.616278, 1, 0, 0.9372549, 1,
1.002524, -0.4422097, 1.669202, 1, 0, 0.9294118, 1,
1.003485, -0.3413734, 1.364937, 1, 0, 0.9254902, 1,
1.004591, 0.9582823, 0.06924222, 1, 0, 0.9176471, 1,
1.005526, -0.1264549, -0.09942685, 1, 0, 0.9137255, 1,
1.01234, 0.544341, 0.6607803, 1, 0, 0.9058824, 1,
1.016461, -1.079633, 1.480059, 1, 0, 0.9019608, 1,
1.020044, 1.823954, -1.340823, 1, 0, 0.8941177, 1,
1.021113, 0.3002342, 0.5652941, 1, 0, 0.8862745, 1,
1.039198, -0.7201581, 1.885735, 1, 0, 0.8823529, 1,
1.039237, 0.6993149, 0.03276789, 1, 0, 0.8745098, 1,
1.043481, 0.5264228, -1.401262, 1, 0, 0.8705882, 1,
1.045305, -0.8972816, 1.80804, 1, 0, 0.8627451, 1,
1.045541, -0.4381212, 2.274572, 1, 0, 0.8588235, 1,
1.047221, 1.756542, 1.59837, 1, 0, 0.8509804, 1,
1.047839, -0.9196875, 0.4988294, 1, 0, 0.8470588, 1,
1.054642, -0.5948836, 1.996176, 1, 0, 0.8392157, 1,
1.056606, -0.1994662, 1.291041, 1, 0, 0.8352941, 1,
1.062031, 1.2431, 0.2671396, 1, 0, 0.827451, 1,
1.062468, 1.123482, -1.088458, 1, 0, 0.8235294, 1,
1.063066, -0.6751978, 2.419364, 1, 0, 0.8156863, 1,
1.066963, 1.630001, 1.620259, 1, 0, 0.8117647, 1,
1.074652, 0.01596305, 1.895472, 1, 0, 0.8039216, 1,
1.074837, 0.01699323, 2.485068, 1, 0, 0.7960784, 1,
1.079814, 0.5909349, -0.3798158, 1, 0, 0.7921569, 1,
1.085359, -0.2716234, 2.920679, 1, 0, 0.7843137, 1,
1.092528, -0.3909879, 1.257347, 1, 0, 0.7803922, 1,
1.098247, -0.704538, 2.399539, 1, 0, 0.772549, 1,
1.100097, -2.397571, 3.402697, 1, 0, 0.7686275, 1,
1.103657, -0.8913137, 1.243145, 1, 0, 0.7607843, 1,
1.10744, -0.5232081, 3.025337, 1, 0, 0.7568628, 1,
1.11704, 1.981841, 2.080856, 1, 0, 0.7490196, 1,
1.121219, 0.5918754, 0.07375349, 1, 0, 0.7450981, 1,
1.123347, -0.244558, 2.043621, 1, 0, 0.7372549, 1,
1.127099, -1.536759, 3.206136, 1, 0, 0.7333333, 1,
1.128507, 0.4057317, 1.801989, 1, 0, 0.7254902, 1,
1.129694, -0.2482376, 1.62157, 1, 0, 0.7215686, 1,
1.129712, 2.093522, 0.3939501, 1, 0, 0.7137255, 1,
1.130835, -1.055644, 2.195325, 1, 0, 0.7098039, 1,
1.134104, 0.2565864, 1.220076, 1, 0, 0.7019608, 1,
1.138625, -0.6349443, 1.792376, 1, 0, 0.6941177, 1,
1.152722, 1.758105, 0.1440918, 1, 0, 0.6901961, 1,
1.156948, -1.684884, 1.546818, 1, 0, 0.682353, 1,
1.167893, 0.1591853, 0.8439404, 1, 0, 0.6784314, 1,
1.174996, -0.9083444, 2.109646, 1, 0, 0.6705883, 1,
1.184279, -0.698703, 1.884189, 1, 0, 0.6666667, 1,
1.200869, 0.5600035, -0.3924608, 1, 0, 0.6588235, 1,
1.201939, 0.2064118, -0.0896427, 1, 0, 0.654902, 1,
1.214269, 0.115373, 1.820179, 1, 0, 0.6470588, 1,
1.220608, -0.4789605, 0.4590001, 1, 0, 0.6431373, 1,
1.224716, 0.6265895, 1.937719, 1, 0, 0.6352941, 1,
1.229143, -0.336818, 1.55291, 1, 0, 0.6313726, 1,
1.230355, -1.620472, 3.275946, 1, 0, 0.6235294, 1,
1.23441, -0.3839217, 3.269344, 1, 0, 0.6196079, 1,
1.238905, -0.3686847, 1.634103, 1, 0, 0.6117647, 1,
1.242883, -0.3288489, 3.078646, 1, 0, 0.6078432, 1,
1.254761, 0.1036327, 1.781953, 1, 0, 0.6, 1,
1.25591, -0.4098847, 1.007882, 1, 0, 0.5921569, 1,
1.260957, -0.4366295, 2.848834, 1, 0, 0.5882353, 1,
1.268837, 0.2656479, 0.4402627, 1, 0, 0.5803922, 1,
1.27599, -0.6201836, 1.643246, 1, 0, 0.5764706, 1,
1.293867, 0.1313695, 1.374596, 1, 0, 0.5686275, 1,
1.29472, 0.4503598, 1.042098, 1, 0, 0.5647059, 1,
1.306288, -0.6928167, 2.407828, 1, 0, 0.5568628, 1,
1.308251, 0.2179105, 1.970607, 1, 0, 0.5529412, 1,
1.315082, 0.2068617, 1.105595, 1, 0, 0.5450981, 1,
1.321252, -1.191601, 3.638063, 1, 0, 0.5411765, 1,
1.324387, -0.434496, 1.802878, 1, 0, 0.5333334, 1,
1.33382, 0.05617866, 0.8052602, 1, 0, 0.5294118, 1,
1.337526, -0.3986902, 2.827065, 1, 0, 0.5215687, 1,
1.338788, 1.274329, 0.8538307, 1, 0, 0.5176471, 1,
1.344334, 1.18877, 1.236958, 1, 0, 0.509804, 1,
1.344389, 0.3285214, 2.053243, 1, 0, 0.5058824, 1,
1.346964, 0.9838175, 1.704257, 1, 0, 0.4980392, 1,
1.356917, 0.9698058, 0.5080559, 1, 0, 0.4901961, 1,
1.363711, -0.06547111, 1.356267, 1, 0, 0.4862745, 1,
1.364976, 0.7439063, 0.1349126, 1, 0, 0.4784314, 1,
1.365503, 2.044624, 1.784391, 1, 0, 0.4745098, 1,
1.377453, -0.3221115, 1.967398, 1, 0, 0.4666667, 1,
1.378509, 0.8687783, 1.892902, 1, 0, 0.4627451, 1,
1.392009, 1.1468, 0.7657166, 1, 0, 0.454902, 1,
1.395261, 1.255886, 0.8040208, 1, 0, 0.4509804, 1,
1.395371, -0.5184889, 1.120904, 1, 0, 0.4431373, 1,
1.398145, -0.1901814, 1.376555, 1, 0, 0.4392157, 1,
1.401201, 0.6682919, 0.5792392, 1, 0, 0.4313726, 1,
1.415588, 1.129321, 1.339033, 1, 0, 0.427451, 1,
1.427168, -0.7133491, 2.295691, 1, 0, 0.4196078, 1,
1.433329, 0.7945552, 1.528035, 1, 0, 0.4156863, 1,
1.44295, 2.57015, 0.7991741, 1, 0, 0.4078431, 1,
1.444379, -0.7906022, 3.113997, 1, 0, 0.4039216, 1,
1.461274, -1.463599, 2.803815, 1, 0, 0.3960784, 1,
1.467765, -1.73826, 2.39118, 1, 0, 0.3882353, 1,
1.468516, 0.2422373, 2.431778, 1, 0, 0.3843137, 1,
1.471477, 0.01889265, 0.2587304, 1, 0, 0.3764706, 1,
1.480189, -1.038287, 1.640173, 1, 0, 0.372549, 1,
1.494288, 0.9020659, 1.03971, 1, 0, 0.3647059, 1,
1.495801, 0.4994698, 0.236432, 1, 0, 0.3607843, 1,
1.501788, -0.2566055, 2.584748, 1, 0, 0.3529412, 1,
1.506686, -0.0619749, 0.9518494, 1, 0, 0.3490196, 1,
1.508946, 1.460453, 0.8493274, 1, 0, 0.3411765, 1,
1.525525, -0.5487705, 4.58413, 1, 0, 0.3372549, 1,
1.528194, -1.276251, 1.473163, 1, 0, 0.3294118, 1,
1.52884, 0.3211161, -0.5154633, 1, 0, 0.3254902, 1,
1.565019, -1.021249, 3.136405, 1, 0, 0.3176471, 1,
1.567299, 1.185071, -0.2913039, 1, 0, 0.3137255, 1,
1.581423, 2.499637, 0.08631113, 1, 0, 0.3058824, 1,
1.59104, -1.275375, 1.477247, 1, 0, 0.2980392, 1,
1.599757, 0.550844, 3.162289, 1, 0, 0.2941177, 1,
1.615623, 0.4418266, 1.63144, 1, 0, 0.2862745, 1,
1.623737, 1.628327, 2.665711, 1, 0, 0.282353, 1,
1.625239, -0.552088, 1.794145, 1, 0, 0.2745098, 1,
1.628414, 0.7712852, 1.48425, 1, 0, 0.2705882, 1,
1.629493, 0.01348011, 1.392684, 1, 0, 0.2627451, 1,
1.632162, -0.283538, 2.621214, 1, 0, 0.2588235, 1,
1.63332, -0.6092592, 1.08707, 1, 0, 0.2509804, 1,
1.647067, 0.004582951, 1.265949, 1, 0, 0.2470588, 1,
1.649936, -1.248585, 2.62602, 1, 0, 0.2392157, 1,
1.66471, -0.4851467, 2.819092, 1, 0, 0.2352941, 1,
1.665005, -0.4487239, 0.5917087, 1, 0, 0.227451, 1,
1.678698, 0.3246244, 2.153184, 1, 0, 0.2235294, 1,
1.694058, 1.20125, 1.253828, 1, 0, 0.2156863, 1,
1.739602, -0.5543202, 0.4709317, 1, 0, 0.2117647, 1,
1.76777, 0.6587435, 0.7881988, 1, 0, 0.2039216, 1,
1.776017, -0.2600565, 3.351063, 1, 0, 0.1960784, 1,
1.790671, 0.2302856, 3.10535, 1, 0, 0.1921569, 1,
1.792687, 0.4677394, 2.246544, 1, 0, 0.1843137, 1,
1.801148, 0.1042397, 0.508862, 1, 0, 0.1803922, 1,
1.809012, -0.5191432, 2.055017, 1, 0, 0.172549, 1,
1.827347, -1.331118, 3.666991, 1, 0, 0.1686275, 1,
1.834134, -1.285291, 0.3984324, 1, 0, 0.1607843, 1,
1.836465, 0.9960255, 2.43479, 1, 0, 0.1568628, 1,
1.877149, -1.447906, 3.126715, 1, 0, 0.1490196, 1,
1.885746, -1.37961, 1.446072, 1, 0, 0.145098, 1,
1.89828, -0.7789918, 0.5496522, 1, 0, 0.1372549, 1,
1.900366, -0.5553194, 2.604869, 1, 0, 0.1333333, 1,
1.907481, 0.1592979, 0.4949241, 1, 0, 0.1254902, 1,
1.91025, -0.3891976, 3.311272, 1, 0, 0.1215686, 1,
1.914793, 0.09079052, 1.980064, 1, 0, 0.1137255, 1,
1.917934, 0.5457003, 2.558047, 1, 0, 0.1098039, 1,
1.925258, 1.648103, 1.679954, 1, 0, 0.1019608, 1,
1.963655, 1.163548, 0.7890542, 1, 0, 0.09411765, 1,
2.004916, 2.51515, -1.475855, 1, 0, 0.09019608, 1,
2.059142, 0.4091907, -0.5878833, 1, 0, 0.08235294, 1,
2.075244, -0.9533579, 2.589798, 1, 0, 0.07843138, 1,
2.15742, 1.064469, 1.508891, 1, 0, 0.07058824, 1,
2.172439, -0.926291, 2.771828, 1, 0, 0.06666667, 1,
2.192209, 0.3498619, 2.963183, 1, 0, 0.05882353, 1,
2.230131, -1.771744, 2.394854, 1, 0, 0.05490196, 1,
2.264966, -1.695638, 2.731271, 1, 0, 0.04705882, 1,
2.537801, -0.6837006, 2.480566, 1, 0, 0.04313726, 1,
2.541592, -1.323372, 0.7207627, 1, 0, 0.03529412, 1,
2.638733, 0.7660535, 1.193142, 1, 0, 0.03137255, 1,
2.657573, 1.559566, 0.5092995, 1, 0, 0.02352941, 1,
2.788713, -1.316774, 2.316066, 1, 0, 0.01960784, 1,
2.918298, 1.192921, 1.792599, 1, 0, 0.01176471, 1,
3.010424, 0.6393784, 2.771707, 1, 0, 0.007843138, 1
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
-0.1894569, -4.273195, -7.125275, 0, -0.5, 0.5, 0.5,
-0.1894569, -4.273195, -7.125275, 1, -0.5, 0.5, 0.5,
-0.1894569, -4.273195, -7.125275, 1, 1.5, 0.5, 0.5,
-0.1894569, -4.273195, -7.125275, 0, 1.5, 0.5, 0.5
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
-4.474097, 0.3006423, -7.125275, 0, -0.5, 0.5, 0.5,
-4.474097, 0.3006423, -7.125275, 1, -0.5, 0.5, 0.5,
-4.474097, 0.3006423, -7.125275, 1, 1.5, 0.5, 0.5,
-4.474097, 0.3006423, -7.125275, 0, 1.5, 0.5, 0.5
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
-4.474097, -4.273195, 0.1543307, 0, -0.5, 0.5, 0.5,
-4.474097, -4.273195, 0.1543307, 1, -0.5, 0.5, 0.5,
-4.474097, -4.273195, 0.1543307, 1, 1.5, 0.5, 0.5,
-4.474097, -4.273195, 0.1543307, 0, 1.5, 0.5, 0.5
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
-3, -3.217694, -5.445366,
3, -3.217694, -5.445366,
-3, -3.217694, -5.445366,
-3, -3.393611, -5.725351,
-2, -3.217694, -5.445366,
-2, -3.393611, -5.725351,
-1, -3.217694, -5.445366,
-1, -3.393611, -5.725351,
0, -3.217694, -5.445366,
0, -3.393611, -5.725351,
1, -3.217694, -5.445366,
1, -3.393611, -5.725351,
2, -3.217694, -5.445366,
2, -3.393611, -5.725351,
3, -3.217694, -5.445366,
3, -3.393611, -5.725351
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
-3, -3.745444, -6.285321, 0, -0.5, 0.5, 0.5,
-3, -3.745444, -6.285321, 1, -0.5, 0.5, 0.5,
-3, -3.745444, -6.285321, 1, 1.5, 0.5, 0.5,
-3, -3.745444, -6.285321, 0, 1.5, 0.5, 0.5,
-2, -3.745444, -6.285321, 0, -0.5, 0.5, 0.5,
-2, -3.745444, -6.285321, 1, -0.5, 0.5, 0.5,
-2, -3.745444, -6.285321, 1, 1.5, 0.5, 0.5,
-2, -3.745444, -6.285321, 0, 1.5, 0.5, 0.5,
-1, -3.745444, -6.285321, 0, -0.5, 0.5, 0.5,
-1, -3.745444, -6.285321, 1, -0.5, 0.5, 0.5,
-1, -3.745444, -6.285321, 1, 1.5, 0.5, 0.5,
-1, -3.745444, -6.285321, 0, 1.5, 0.5, 0.5,
0, -3.745444, -6.285321, 0, -0.5, 0.5, 0.5,
0, -3.745444, -6.285321, 1, -0.5, 0.5, 0.5,
0, -3.745444, -6.285321, 1, 1.5, 0.5, 0.5,
0, -3.745444, -6.285321, 0, 1.5, 0.5, 0.5,
1, -3.745444, -6.285321, 0, -0.5, 0.5, 0.5,
1, -3.745444, -6.285321, 1, -0.5, 0.5, 0.5,
1, -3.745444, -6.285321, 1, 1.5, 0.5, 0.5,
1, -3.745444, -6.285321, 0, 1.5, 0.5, 0.5,
2, -3.745444, -6.285321, 0, -0.5, 0.5, 0.5,
2, -3.745444, -6.285321, 1, -0.5, 0.5, 0.5,
2, -3.745444, -6.285321, 1, 1.5, 0.5, 0.5,
2, -3.745444, -6.285321, 0, 1.5, 0.5, 0.5,
3, -3.745444, -6.285321, 0, -0.5, 0.5, 0.5,
3, -3.745444, -6.285321, 1, -0.5, 0.5, 0.5,
3, -3.745444, -6.285321, 1, 1.5, 0.5, 0.5,
3, -3.745444, -6.285321, 0, 1.5, 0.5, 0.5
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
-3.485334, -3, -5.445366,
-3.485334, 3, -5.445366,
-3.485334, -3, -5.445366,
-3.650128, -3, -5.725351,
-3.485334, -2, -5.445366,
-3.650128, -2, -5.725351,
-3.485334, -1, -5.445366,
-3.650128, -1, -5.725351,
-3.485334, 0, -5.445366,
-3.650128, 0, -5.725351,
-3.485334, 1, -5.445366,
-3.650128, 1, -5.725351,
-3.485334, 2, -5.445366,
-3.650128, 2, -5.725351,
-3.485334, 3, -5.445366,
-3.650128, 3, -5.725351
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
-3.979716, -3, -6.285321, 0, -0.5, 0.5, 0.5,
-3.979716, -3, -6.285321, 1, -0.5, 0.5, 0.5,
-3.979716, -3, -6.285321, 1, 1.5, 0.5, 0.5,
-3.979716, -3, -6.285321, 0, 1.5, 0.5, 0.5,
-3.979716, -2, -6.285321, 0, -0.5, 0.5, 0.5,
-3.979716, -2, -6.285321, 1, -0.5, 0.5, 0.5,
-3.979716, -2, -6.285321, 1, 1.5, 0.5, 0.5,
-3.979716, -2, -6.285321, 0, 1.5, 0.5, 0.5,
-3.979716, -1, -6.285321, 0, -0.5, 0.5, 0.5,
-3.979716, -1, -6.285321, 1, -0.5, 0.5, 0.5,
-3.979716, -1, -6.285321, 1, 1.5, 0.5, 0.5,
-3.979716, -1, -6.285321, 0, 1.5, 0.5, 0.5,
-3.979716, 0, -6.285321, 0, -0.5, 0.5, 0.5,
-3.979716, 0, -6.285321, 1, -0.5, 0.5, 0.5,
-3.979716, 0, -6.285321, 1, 1.5, 0.5, 0.5,
-3.979716, 0, -6.285321, 0, 1.5, 0.5, 0.5,
-3.979716, 1, -6.285321, 0, -0.5, 0.5, 0.5,
-3.979716, 1, -6.285321, 1, -0.5, 0.5, 0.5,
-3.979716, 1, -6.285321, 1, 1.5, 0.5, 0.5,
-3.979716, 1, -6.285321, 0, 1.5, 0.5, 0.5,
-3.979716, 2, -6.285321, 0, -0.5, 0.5, 0.5,
-3.979716, 2, -6.285321, 1, -0.5, 0.5, 0.5,
-3.979716, 2, -6.285321, 1, 1.5, 0.5, 0.5,
-3.979716, 2, -6.285321, 0, 1.5, 0.5, 0.5,
-3.979716, 3, -6.285321, 0, -0.5, 0.5, 0.5,
-3.979716, 3, -6.285321, 1, -0.5, 0.5, 0.5,
-3.979716, 3, -6.285321, 1, 1.5, 0.5, 0.5,
-3.979716, 3, -6.285321, 0, 1.5, 0.5, 0.5
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
-3.485334, -3.217694, -4,
-3.485334, -3.217694, 4,
-3.485334, -3.217694, -4,
-3.650128, -3.393611, -4,
-3.485334, -3.217694, -2,
-3.650128, -3.393611, -2,
-3.485334, -3.217694, 0,
-3.650128, -3.393611, 0,
-3.485334, -3.217694, 2,
-3.650128, -3.393611, 2,
-3.485334, -3.217694, 4,
-3.650128, -3.393611, 4
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
-3.979716, -3.745444, -4, 0, -0.5, 0.5, 0.5,
-3.979716, -3.745444, -4, 1, -0.5, 0.5, 0.5,
-3.979716, -3.745444, -4, 1, 1.5, 0.5, 0.5,
-3.979716, -3.745444, -4, 0, 1.5, 0.5, 0.5,
-3.979716, -3.745444, -2, 0, -0.5, 0.5, 0.5,
-3.979716, -3.745444, -2, 1, -0.5, 0.5, 0.5,
-3.979716, -3.745444, -2, 1, 1.5, 0.5, 0.5,
-3.979716, -3.745444, -2, 0, 1.5, 0.5, 0.5,
-3.979716, -3.745444, 0, 0, -0.5, 0.5, 0.5,
-3.979716, -3.745444, 0, 1, -0.5, 0.5, 0.5,
-3.979716, -3.745444, 0, 1, 1.5, 0.5, 0.5,
-3.979716, -3.745444, 0, 0, 1.5, 0.5, 0.5,
-3.979716, -3.745444, 2, 0, -0.5, 0.5, 0.5,
-3.979716, -3.745444, 2, 1, -0.5, 0.5, 0.5,
-3.979716, -3.745444, 2, 1, 1.5, 0.5, 0.5,
-3.979716, -3.745444, 2, 0, 1.5, 0.5, 0.5,
-3.979716, -3.745444, 4, 0, -0.5, 0.5, 0.5,
-3.979716, -3.745444, 4, 1, -0.5, 0.5, 0.5,
-3.979716, -3.745444, 4, 1, 1.5, 0.5, 0.5,
-3.979716, -3.745444, 4, 0, 1.5, 0.5, 0.5
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
-3.485334, -3.217694, -5.445366,
-3.485334, 3.818979, -5.445366,
-3.485334, -3.217694, 5.754027,
-3.485334, 3.818979, 5.754027,
-3.485334, -3.217694, -5.445366,
-3.485334, -3.217694, 5.754027,
-3.485334, 3.818979, -5.445366,
-3.485334, 3.818979, 5.754027,
-3.485334, -3.217694, -5.445366,
3.10642, -3.217694, -5.445366,
-3.485334, -3.217694, 5.754027,
3.10642, -3.217694, 5.754027,
-3.485334, 3.818979, -5.445366,
3.10642, 3.818979, -5.445366,
-3.485334, 3.818979, 5.754027,
3.10642, 3.818979, 5.754027,
3.10642, -3.217694, -5.445366,
3.10642, 3.818979, -5.445366,
3.10642, -3.217694, 5.754027,
3.10642, 3.818979, 5.754027,
3.10642, -3.217694, -5.445366,
3.10642, -3.217694, 5.754027,
3.10642, 3.818979, -5.445366,
3.10642, 3.818979, 5.754027
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
var radius = 7.891221;
var distance = 35.10893;
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
mvMatrix.translate( 0.1894569, -0.3006423, -0.1543307 );
mvMatrix.scale( 1.294366, 1.212525, 0.7618397 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.10893);
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
Zyban<-read.table("Zyban.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Zyban$V2
```

```
## Error in eval(expr, envir, enclos): object 'Zyban' not found
```

```r
y<-Zyban$V3
```

```
## Error in eval(expr, envir, enclos): object 'Zyban' not found
```

```r
z<-Zyban$V4
```

```
## Error in eval(expr, envir, enclos): object 'Zyban' not found
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
-3.389338, 0.2220331, -2.817785, 0, 0, 1, 1, 1,
-2.680411, -1.054783, -3.068662, 1, 0, 0, 1, 1,
-2.627887, 0.2826574, -0.2663203, 1, 0, 0, 1, 1,
-2.586915, 0.351843, -2.48817, 1, 0, 0, 1, 1,
-2.532708, -0.763763, -2.16084, 1, 0, 0, 1, 1,
-2.471391, -0.02762322, -2.501801, 1, 0, 0, 1, 1,
-2.452775, -0.02186661, -1.206769, 0, 0, 0, 1, 1,
-2.448473, -0.02658578, -2.075162, 0, 0, 0, 1, 1,
-2.381677, 1.443661, -1.716879, 0, 0, 0, 1, 1,
-2.369713, -0.06889582, -1.752113, 0, 0, 0, 1, 1,
-2.366482, -0.8131161, -1.190342, 0, 0, 0, 1, 1,
-2.329218, 0.9631155, -1.568918, 0, 0, 0, 1, 1,
-2.321783, -0.6179349, -2.244051, 0, 0, 0, 1, 1,
-2.315139, 0.841886, -1.327138, 1, 1, 1, 1, 1,
-2.294681, 0.4972678, -1.602644, 1, 1, 1, 1, 1,
-2.230826, 0.8754501, 0.0924615, 1, 1, 1, 1, 1,
-2.164354, -1.238955, -0.8673432, 1, 1, 1, 1, 1,
-2.132702, -1.007937, -2.954517, 1, 1, 1, 1, 1,
-2.124012, 3.716503, -1.5712, 1, 1, 1, 1, 1,
-2.109787, -0.5268899, -1.389578, 1, 1, 1, 1, 1,
-2.102345, -0.3190489, -1.325134, 1, 1, 1, 1, 1,
-2.064174, 0.4306456, -1.523935, 1, 1, 1, 1, 1,
-2.035125, -0.1510567, -1.448783, 1, 1, 1, 1, 1,
-1.987097, 0.7195337, -2.377207, 1, 1, 1, 1, 1,
-1.985458, -0.3078755, -0.8636547, 1, 1, 1, 1, 1,
-1.974815, 0.1499983, -1.54915, 1, 1, 1, 1, 1,
-1.958848, 0.08352479, -2.456877, 1, 1, 1, 1, 1,
-1.955189, -0.4933869, -1.455724, 1, 1, 1, 1, 1,
-1.950535, 0.5508396, -2.75325, 0, 0, 1, 1, 1,
-1.946723, 1.084288, -0.004923204, 1, 0, 0, 1, 1,
-1.938081, -0.8807728, -2.541084, 1, 0, 0, 1, 1,
-1.932568, 0.1579028, -1.079643, 1, 0, 0, 1, 1,
-1.927436, 1.138487, -1.203335, 1, 0, 0, 1, 1,
-1.917434, 1.24171, -1.801479, 1, 0, 0, 1, 1,
-1.904447, 1.022966, 0.4146419, 0, 0, 0, 1, 1,
-1.889206, 1.745933, -0.48981, 0, 0, 0, 1, 1,
-1.879856, 2.340858, -1.642207, 0, 0, 0, 1, 1,
-1.867007, -1.840855, -4.071714, 0, 0, 0, 1, 1,
-1.838081, 1.587986, -0.1536522, 0, 0, 0, 1, 1,
-1.820547, -0.04903564, -2.938877, 0, 0, 0, 1, 1,
-1.818394, -0.01448543, -2.417914, 0, 0, 0, 1, 1,
-1.81576, 0.4997339, -0.6937788, 1, 1, 1, 1, 1,
-1.811521, 0.01552984, -1.917252, 1, 1, 1, 1, 1,
-1.797368, -0.3899816, -1.792766, 1, 1, 1, 1, 1,
-1.780433, 1.447427, -0.8876456, 1, 1, 1, 1, 1,
-1.766387, 0.9668179, -0.8523336, 1, 1, 1, 1, 1,
-1.76424, -0.8865174, -2.393664, 1, 1, 1, 1, 1,
-1.754007, -1.662985, -4.0011, 1, 1, 1, 1, 1,
-1.752556, 1.306594, -0.632261, 1, 1, 1, 1, 1,
-1.747605, -0.08738638, -0.6627625, 1, 1, 1, 1, 1,
-1.722719, 1.062568, -0.6609452, 1, 1, 1, 1, 1,
-1.702549, -0.5841151, -3.413339, 1, 1, 1, 1, 1,
-1.690488, 0.5501916, -1.05375, 1, 1, 1, 1, 1,
-1.682971, 1.025967, -2.715124, 1, 1, 1, 1, 1,
-1.681299, -0.9466897, -2.322011, 1, 1, 1, 1, 1,
-1.672259, 2.129616, 0.5881199, 1, 1, 1, 1, 1,
-1.671457, 0.2780443, -1.856746, 0, 0, 1, 1, 1,
-1.663829, -0.02694634, -0.7878618, 1, 0, 0, 1, 1,
-1.660461, 0.08754254, -0.3621548, 1, 0, 0, 1, 1,
-1.658904, 0.1563025, 0.8838636, 1, 0, 0, 1, 1,
-1.657878, 0.3291273, -3.563091, 1, 0, 0, 1, 1,
-1.655868, -1.184956, -3.215813, 1, 0, 0, 1, 1,
-1.643126, -0.7819344, -1.850827, 0, 0, 0, 1, 1,
-1.635693, -1.683419, -2.539509, 0, 0, 0, 1, 1,
-1.63517, 0.09813307, -0.5068443, 0, 0, 0, 1, 1,
-1.633453, -0.5628089, -2.979545, 0, 0, 0, 1, 1,
-1.628721, -1.48805, -1.73859, 0, 0, 0, 1, 1,
-1.627393, -0.4393346, 0.1370011, 0, 0, 0, 1, 1,
-1.625594, -0.632184, -2.775158, 0, 0, 0, 1, 1,
-1.619057, 0.5880972, -1.964726, 1, 1, 1, 1, 1,
-1.600833, -1.611003, -2.321295, 1, 1, 1, 1, 1,
-1.588237, 0.2943889, -1.659185, 1, 1, 1, 1, 1,
-1.581088, 0.689546, -1.29273, 1, 1, 1, 1, 1,
-1.568261, 0.1492332, -2.40239, 1, 1, 1, 1, 1,
-1.568075, 1.416986, -0.1091624, 1, 1, 1, 1, 1,
-1.564909, 2.194246, -0.6202874, 1, 1, 1, 1, 1,
-1.563408, -0.3622231, -1.910392, 1, 1, 1, 1, 1,
-1.55747, 0.9933322, -3.072944, 1, 1, 1, 1, 1,
-1.548714, -0.4454621, -2.341914, 1, 1, 1, 1, 1,
-1.54487, -0.04769441, -1.728023, 1, 1, 1, 1, 1,
-1.544342, -0.4385827, -3.53275, 1, 1, 1, 1, 1,
-1.530478, -0.8602035, -3.367444, 1, 1, 1, 1, 1,
-1.527139, -1.323262, -2.792474, 1, 1, 1, 1, 1,
-1.518741, 0.6042123, 0.2482766, 1, 1, 1, 1, 1,
-1.50579, -1.116881, -2.820735, 0, 0, 1, 1, 1,
-1.489106, 0.09880117, -1.777004, 1, 0, 0, 1, 1,
-1.481739, 0.1959205, -2.026168, 1, 0, 0, 1, 1,
-1.475431, -0.3730094, -1.698333, 1, 0, 0, 1, 1,
-1.457782, 0.3585415, -2.368405, 1, 0, 0, 1, 1,
-1.450398, 0.3218784, -1.107601, 1, 0, 0, 1, 1,
-1.450323, 1.044134, -0.7084069, 0, 0, 0, 1, 1,
-1.441207, -0.649059, -3.569212, 0, 0, 0, 1, 1,
-1.437075, 0.2400895, -1.336919, 0, 0, 0, 1, 1,
-1.436309, 0.1812682, -1.905557, 0, 0, 0, 1, 1,
-1.433759, -1.021871, -2.081371, 0, 0, 0, 1, 1,
-1.425794, 0.6956505, -0.3329833, 0, 0, 0, 1, 1,
-1.421396, -0.1386075, -0.9537504, 0, 0, 0, 1, 1,
-1.416287, 1.443373, -1.424235, 1, 1, 1, 1, 1,
-1.407153, 0.8547367, 0.9445976, 1, 1, 1, 1, 1,
-1.394982, -0.3932501, -2.457926, 1, 1, 1, 1, 1,
-1.388284, 1.303066, -1.870917, 1, 1, 1, 1, 1,
-1.387353, 0.98958, -1.810024, 1, 1, 1, 1, 1,
-1.377838, -1.199868, -1.804094, 1, 1, 1, 1, 1,
-1.367962, -1.033266, -1.492945, 1, 1, 1, 1, 1,
-1.363583, 1.2808, -1.964883, 1, 1, 1, 1, 1,
-1.355056, 0.167813, -1.928126, 1, 1, 1, 1, 1,
-1.353225, -0.9841626, -3.270126, 1, 1, 1, 1, 1,
-1.352472, 0.9060306, -1.251411, 1, 1, 1, 1, 1,
-1.352396, -1.128115, -1.207968, 1, 1, 1, 1, 1,
-1.337693, 0.9761894, -2.660646, 1, 1, 1, 1, 1,
-1.324759, -0.1635706, -2.266588, 1, 1, 1, 1, 1,
-1.319423, -0.2804638, -0.8868629, 1, 1, 1, 1, 1,
-1.316897, 0.9819756, -0.4939849, 0, 0, 1, 1, 1,
-1.309099, -1.510991, -2.379888, 1, 0, 0, 1, 1,
-1.305089, 0.4287504, -1.798529, 1, 0, 0, 1, 1,
-1.303172, 1.179242, 1.550202, 1, 0, 0, 1, 1,
-1.301826, 0.2864749, -1.427161, 1, 0, 0, 1, 1,
-1.297004, -0.1999363, -1.39346, 1, 0, 0, 1, 1,
-1.296937, 0.3274998, -1.104526, 0, 0, 0, 1, 1,
-1.288495, 0.6668406, -1.60896, 0, 0, 0, 1, 1,
-1.285283, -0.6642596, -2.010846, 0, 0, 0, 1, 1,
-1.279647, -0.5606256, -2.213943, 0, 0, 0, 1, 1,
-1.27211, 1.417868, -1.492681, 0, 0, 0, 1, 1,
-1.26845, -2.219906, -5.282268, 0, 0, 0, 1, 1,
-1.268429, -0.334054, -3.212044, 0, 0, 0, 1, 1,
-1.263987, 0.3734011, -1.236822, 1, 1, 1, 1, 1,
-1.2628, 0.115788, 0.7640224, 1, 1, 1, 1, 1,
-1.252824, -1.446528, -1.466301, 1, 1, 1, 1, 1,
-1.232212, -0.350242, -0.354377, 1, 1, 1, 1, 1,
-1.223272, -0.4968629, -0.4544861, 1, 1, 1, 1, 1,
-1.217403, 0.05383284, -0.6923425, 1, 1, 1, 1, 1,
-1.217197, -0.7985877, -0.612604, 1, 1, 1, 1, 1,
-1.205924, -1.569353, -1.865462, 1, 1, 1, 1, 1,
-1.205427, -0.6427486, -3.073444, 1, 1, 1, 1, 1,
-1.202549, -0.8922132, -3.666885, 1, 1, 1, 1, 1,
-1.196764, 0.7385035, -0.3484206, 1, 1, 1, 1, 1,
-1.193856, -0.1882829, -0.01357577, 1, 1, 1, 1, 1,
-1.187827, -1.771792, -3.368901, 1, 1, 1, 1, 1,
-1.185261, 1.652366, 1.007662, 1, 1, 1, 1, 1,
-1.184433, 1.29849, 0.6810115, 1, 1, 1, 1, 1,
-1.18021, 0.4654776, 0.8477959, 0, 0, 1, 1, 1,
-1.174272, -0.9695092, -2.777149, 1, 0, 0, 1, 1,
-1.173862, -1.180394, -2.30171, 1, 0, 0, 1, 1,
-1.172264, -0.1537352, -0.4295423, 1, 0, 0, 1, 1,
-1.16657, -1.077662, -2.50932, 1, 0, 0, 1, 1,
-1.156707, 1.469473, -0.5813497, 1, 0, 0, 1, 1,
-1.156705, 0.7161472, 1.146654, 0, 0, 0, 1, 1,
-1.149892, 0.4959337, -1.932967, 0, 0, 0, 1, 1,
-1.146209, -0.2908362, -1.018158, 0, 0, 0, 1, 1,
-1.137051, 0.5500026, -0.6698023, 0, 0, 0, 1, 1,
-1.124605, -1.185596, -0.8946964, 0, 0, 0, 1, 1,
-1.120904, -1.238537, -1.925026, 0, 0, 0, 1, 1,
-1.120011, 0.5812145, -0.608468, 0, 0, 0, 1, 1,
-1.119751, -0.3152461, -2.111315, 1, 1, 1, 1, 1,
-1.106121, -0.1167706, -1.169676, 1, 1, 1, 1, 1,
-1.105097, 0.3879125, -2.342704, 1, 1, 1, 1, 1,
-1.098453, 1.017537, -2.273488, 1, 1, 1, 1, 1,
-1.094887, -0.5624872, -1.452163, 1, 1, 1, 1, 1,
-1.094722, 0.2854845, -2.993268, 1, 1, 1, 1, 1,
-1.094177, 0.4722047, -2.437324, 1, 1, 1, 1, 1,
-1.087587, 1.782923, -1.19493, 1, 1, 1, 1, 1,
-1.086578, -0.669798, -3.480464, 1, 1, 1, 1, 1,
-1.086065, 1.235548, -1.124799, 1, 1, 1, 1, 1,
-1.085432, 0.6841308, -1.325422, 1, 1, 1, 1, 1,
-1.082548, 0.7768301, -1.293595, 1, 1, 1, 1, 1,
-1.075035, -0.2745067, -0.5944039, 1, 1, 1, 1, 1,
-1.070312, 1.437964, -1.583828, 1, 1, 1, 1, 1,
-1.06837, 1.054218, 0.03931494, 1, 1, 1, 1, 1,
-1.067689, 1.076135, -0.1541962, 0, 0, 1, 1, 1,
-1.063802, 0.9460279, -0.5625931, 1, 0, 0, 1, 1,
-1.060189, -1.006263, -1.304629, 1, 0, 0, 1, 1,
-1.056297, -1.180316, -1.557311, 1, 0, 0, 1, 1,
-1.044998, -0.7416028, -1.773319, 1, 0, 0, 1, 1,
-1.040667, 0.100031, -0.01021776, 1, 0, 0, 1, 1,
-1.038022, 0.1667036, -1.388609, 0, 0, 0, 1, 1,
-1.02827, -0.7159399, -1.337767, 0, 0, 0, 1, 1,
-1.027411, 0.3445811, -1.244238, 0, 0, 0, 1, 1,
-1.021694, -0.2867523, -1.514843, 0, 0, 0, 1, 1,
-1.021359, -0.3989008, -3.450976, 0, 0, 0, 1, 1,
-1.020255, 0.1606153, -0.7055785, 0, 0, 0, 1, 1,
-1.012294, 0.1291097, -1.139442, 0, 0, 0, 1, 1,
-1.00932, 0.4264443, -2.343683, 1, 1, 1, 1, 1,
-0.9990067, 0.8298841, -0.2593705, 1, 1, 1, 1, 1,
-0.9968954, 1.39376, 0.9940315, 1, 1, 1, 1, 1,
-0.9963493, 1.680252, -1.904478, 1, 1, 1, 1, 1,
-0.9858657, 0.472305, -1.160197, 1, 1, 1, 1, 1,
-0.9857998, -0.2999512, -1.083898, 1, 1, 1, 1, 1,
-0.9852462, -0.9233422, -2.103296, 1, 1, 1, 1, 1,
-0.9790795, 0.4865265, -1.800909, 1, 1, 1, 1, 1,
-0.9778286, 0.7293752, -2.073282, 1, 1, 1, 1, 1,
-0.9777401, -1.154578, -1.721367, 1, 1, 1, 1, 1,
-0.9693593, -0.3619271, -1.634791, 1, 1, 1, 1, 1,
-0.9666833, 0.3795117, -2.074142, 1, 1, 1, 1, 1,
-0.9632533, 0.003065977, -1.002227, 1, 1, 1, 1, 1,
-0.9620501, -0.3148817, -3.329013, 1, 1, 1, 1, 1,
-0.9474745, -1.035843, -2.685714, 1, 1, 1, 1, 1,
-0.9458109, -0.9537991, -1.454225, 0, 0, 1, 1, 1,
-0.9456833, -2.028544, -3.454119, 1, 0, 0, 1, 1,
-0.9382829, -0.4643948, -2.142629, 1, 0, 0, 1, 1,
-0.9377047, -0.7267216, -0.2303913, 1, 0, 0, 1, 1,
-0.9365359, 2.193832, -1.345848, 1, 0, 0, 1, 1,
-0.925276, 1.051698, 0.1225379, 1, 0, 0, 1, 1,
-0.9113328, 0.826853, -1.507133, 0, 0, 0, 1, 1,
-0.9056227, 0.2219153, -0.6676188, 0, 0, 0, 1, 1,
-0.8910502, 0.03546743, -1.515075, 0, 0, 0, 1, 1,
-0.8880302, 1.148709, -2.739226, 0, 0, 0, 1, 1,
-0.8864342, 0.8221742, -2.050614, 0, 0, 0, 1, 1,
-0.8850294, 0.2831305, -1.058883, 0, 0, 0, 1, 1,
-0.8828412, -1.252243, -1.765305, 0, 0, 0, 1, 1,
-0.8655714, 0.9920285, -1.798433, 1, 1, 1, 1, 1,
-0.8650826, 0.3928362, -1.180295, 1, 1, 1, 1, 1,
-0.8594719, -0.680655, -1.509499, 1, 1, 1, 1, 1,
-0.8593263, -0.05663614, -0.8979982, 1, 1, 1, 1, 1,
-0.8551749, 1.291982, -1.292187, 1, 1, 1, 1, 1,
-0.8487434, -0.4048879, -2.001283, 1, 1, 1, 1, 1,
-0.8445607, -1.473222, -2.51384, 1, 1, 1, 1, 1,
-0.8388709, -0.2290439, -2.404971, 1, 1, 1, 1, 1,
-0.8380618, 0.6655021, -2.257139, 1, 1, 1, 1, 1,
-0.8327241, -0.4177388, -0.7659172, 1, 1, 1, 1, 1,
-0.8230733, -1.095286, -1.459178, 1, 1, 1, 1, 1,
-0.8184642, -0.938814, -3.121292, 1, 1, 1, 1, 1,
-0.8168478, -1.003813, -1.676486, 1, 1, 1, 1, 1,
-0.8159274, 0.487115, -0.6056579, 1, 1, 1, 1, 1,
-0.8131813, -0.5621671, -1.136708, 1, 1, 1, 1, 1,
-0.8052719, -0.7641266, -3.424458, 0, 0, 1, 1, 1,
-0.8048742, -0.9489606, -2.104655, 1, 0, 0, 1, 1,
-0.804171, -0.2458467, -3.171695, 1, 0, 0, 1, 1,
-0.794805, 0.9585108, 0.548157, 1, 0, 0, 1, 1,
-0.7903864, 0.6379968, -1.687567, 1, 0, 0, 1, 1,
-0.7878633, 1.722236, -0.7253901, 1, 0, 0, 1, 1,
-0.7825325, -0.3982956, -2.269536, 0, 0, 0, 1, 1,
-0.7780679, 0.8849409, 0.3053433, 0, 0, 0, 1, 1,
-0.7752429, -0.7509634, -4.528053, 0, 0, 0, 1, 1,
-0.7752056, 1.296022, 0.034209, 0, 0, 0, 1, 1,
-0.772758, 0.2295104, -1.674676, 0, 0, 0, 1, 1,
-0.7624855, 0.4942529, -0.04080823, 0, 0, 0, 1, 1,
-0.7595367, 0.2694072, -1.272949, 0, 0, 0, 1, 1,
-0.7591752, -0.7480394, -1.487106, 1, 1, 1, 1, 1,
-0.7557088, -1.131896, -2.262871, 1, 1, 1, 1, 1,
-0.7555805, 1.181661, 0.3481823, 1, 1, 1, 1, 1,
-0.7497885, -0.3070677, -1.649877, 1, 1, 1, 1, 1,
-0.7474042, 0.6148894, -1.082123, 1, 1, 1, 1, 1,
-0.7447438, 1.001521, -0.1307643, 1, 1, 1, 1, 1,
-0.7387967, 0.02952233, -3.373767, 1, 1, 1, 1, 1,
-0.7353321, -1.260878, -2.156977, 1, 1, 1, 1, 1,
-0.7351942, -0.2197894, -1.8413, 1, 1, 1, 1, 1,
-0.7275358, 0.1474871, -1.11804, 1, 1, 1, 1, 1,
-0.7189137, -0.1681517, -1.875788, 1, 1, 1, 1, 1,
-0.7170238, -0.1384663, -2.230975, 1, 1, 1, 1, 1,
-0.7120238, 0.3281812, 0.173149, 1, 1, 1, 1, 1,
-0.7115147, -0.8807617, -2.144901, 1, 1, 1, 1, 1,
-0.7107112, 0.9002952, 0.8566606, 1, 1, 1, 1, 1,
-0.7088366, -0.6217898, -2.619461, 0, 0, 1, 1, 1,
-0.7049283, 0.4307863, -1.488778, 1, 0, 0, 1, 1,
-0.7009124, 0.8968979, 0.3659431, 1, 0, 0, 1, 1,
-0.698324, -0.1567132, -2.479197, 1, 0, 0, 1, 1,
-0.6969424, -0.0886869, -2.195574, 1, 0, 0, 1, 1,
-0.6925226, -1.10665, -3.830346, 1, 0, 0, 1, 1,
-0.6901752, -0.4650485, -1.303604, 0, 0, 0, 1, 1,
-0.6873737, -0.9622864, -3.455536, 0, 0, 0, 1, 1,
-0.6865161, 0.5488125, -0.8550709, 0, 0, 0, 1, 1,
-0.6832968, -0.9227227, -3.047672, 0, 0, 0, 1, 1,
-0.6825647, 0.3211446, -1.651762, 0, 0, 0, 1, 1,
-0.6804596, 0.7693011, -1.87071, 0, 0, 0, 1, 1,
-0.677662, -2.187196, -3.520298, 0, 0, 0, 1, 1,
-0.6775469, -1.193137, -3.075446, 1, 1, 1, 1, 1,
-0.6727401, -1.24144, -3.623067, 1, 1, 1, 1, 1,
-0.6722313, 0.2902786, -2.008538, 1, 1, 1, 1, 1,
-0.6688914, 0.5560827, -0.6146314, 1, 1, 1, 1, 1,
-0.6686181, -0.1667904, -1.468128, 1, 1, 1, 1, 1,
-0.6630297, 0.3540895, -0.3878827, 1, 1, 1, 1, 1,
-0.6579663, 1.044014, -0.3192387, 1, 1, 1, 1, 1,
-0.651907, -0.1963385, -3.915137, 1, 1, 1, 1, 1,
-0.6461917, 0.02356762, -2.960548, 1, 1, 1, 1, 1,
-0.6461332, 0.824597, -1.140961, 1, 1, 1, 1, 1,
-0.6418687, -0.04954328, -1.076153, 1, 1, 1, 1, 1,
-0.6411344, 0.3250945, -2.774307, 1, 1, 1, 1, 1,
-0.6400481, 0.06600522, -1.750747, 1, 1, 1, 1, 1,
-0.6375492, -0.289219, -2.35521, 1, 1, 1, 1, 1,
-0.6367998, -1.035625, -2.497295, 1, 1, 1, 1, 1,
-0.6304379, 1.730272, -1.108448, 0, 0, 1, 1, 1,
-0.6302435, 0.2929001, -1.079205, 1, 0, 0, 1, 1,
-0.6244289, -0.8232344, -2.559705, 1, 0, 0, 1, 1,
-0.624261, -0.4297592, -2.167912, 1, 0, 0, 1, 1,
-0.6242527, 0.3922625, -1.045122, 1, 0, 0, 1, 1,
-0.6196741, 0.3596059, -0.3631192, 1, 0, 0, 1, 1,
-0.6161785, 0.5929574, -1.918088, 0, 0, 0, 1, 1,
-0.6161267, 0.1868755, -1.751751, 0, 0, 0, 1, 1,
-0.6115546, -1.033811, -3.409288, 0, 0, 0, 1, 1,
-0.6109846, -0.9888688, -2.902533, 0, 0, 0, 1, 1,
-0.6108232, -0.8141599, -2.86784, 0, 0, 0, 1, 1,
-0.6089917, 1.993777, 0.4086707, 0, 0, 0, 1, 1,
-0.6024871, 0.2475758, -1.282126, 0, 0, 0, 1, 1,
-0.6022509, 0.36881, -0.2528046, 1, 1, 1, 1, 1,
-0.6008503, -0.9560666, -1.060068, 1, 1, 1, 1, 1,
-0.6003862, 2.216725, -0.001339049, 1, 1, 1, 1, 1,
-0.5981675, -0.2100349, -2.678973, 1, 1, 1, 1, 1,
-0.5969676, -0.2071575, -2.013134, 1, 1, 1, 1, 1,
-0.595657, -1.152625, -2.566121, 1, 1, 1, 1, 1,
-0.5956417, -0.6190201, -1.287845, 1, 1, 1, 1, 1,
-0.5930793, 0.8756883, -0.6904741, 1, 1, 1, 1, 1,
-0.5846218, -1.497373, -1.758957, 1, 1, 1, 1, 1,
-0.5839326, 0.3354987, -2.023455, 1, 1, 1, 1, 1,
-0.5831992, -0.2751768, -2.309393, 1, 1, 1, 1, 1,
-0.5788499, -0.7292585, -2.883392, 1, 1, 1, 1, 1,
-0.5786332, -1.599339, -1.571734, 1, 1, 1, 1, 1,
-0.5777254, -0.3082708, -1.295117, 1, 1, 1, 1, 1,
-0.5741808, 0.3685816, -1.123264, 1, 1, 1, 1, 1,
-0.5708774, 1.805149, -0.4473375, 0, 0, 1, 1, 1,
-0.5697222, -0.6572063, -0.533718, 1, 0, 0, 1, 1,
-0.5696432, 0.7002025, -0.2325598, 1, 0, 0, 1, 1,
-0.5685664, -0.4708697, -1.617177, 1, 0, 0, 1, 1,
-0.5524318, 0.5916359, -1.529307, 1, 0, 0, 1, 1,
-0.5506302, 0.02422892, -1.821053, 1, 0, 0, 1, 1,
-0.5505585, -0.7571036, -1.280171, 0, 0, 0, 1, 1,
-0.5493416, 0.03911372, -2.621203, 0, 0, 0, 1, 1,
-0.5489363, -1.054253, -1.612031, 0, 0, 0, 1, 1,
-0.5482355, 1.191691, 1.012362, 0, 0, 0, 1, 1,
-0.544643, 0.6643118, 0.6377512, 0, 0, 0, 1, 1,
-0.5420046, 0.7372114, -0.2114813, 0, 0, 0, 1, 1,
-0.5365981, 0.04607445, -2.787953, 0, 0, 0, 1, 1,
-0.5360867, -1.054582, -1.816205, 1, 1, 1, 1, 1,
-0.5307775, 0.131276, -1.658171, 1, 1, 1, 1, 1,
-0.5292208, -1.31151, -3.308814, 1, 1, 1, 1, 1,
-0.5281857, -0.1005287, -2.663821, 1, 1, 1, 1, 1,
-0.5217524, 0.4604232, -1.495805, 1, 1, 1, 1, 1,
-0.5199729, 1.500712, -2.262024, 1, 1, 1, 1, 1,
-0.5192615, 0.1003394, -2.490944, 1, 1, 1, 1, 1,
-0.5150922, 1.60187, 0.09552144, 1, 1, 1, 1, 1,
-0.514227, 1.266708, -1.242177, 1, 1, 1, 1, 1,
-0.5141172, -0.2086494, -3.06824, 1, 1, 1, 1, 1,
-0.5115081, -0.4744637, -4.136439, 1, 1, 1, 1, 1,
-0.5067678, -1.275337, -2.232814, 1, 1, 1, 1, 1,
-0.5050759, -0.4704579, -2.432527, 1, 1, 1, 1, 1,
-0.4986589, -0.05563211, -1.015042, 1, 1, 1, 1, 1,
-0.4981622, 2.704064, -0.8759758, 1, 1, 1, 1, 1,
-0.49789, 0.7888997, 1.063015, 0, 0, 1, 1, 1,
-0.490318, -1.465096, -4.129325, 1, 0, 0, 1, 1,
-0.4902138, 0.5954502, -1.342435, 1, 0, 0, 1, 1,
-0.4861972, 0.3755095, -0.4014536, 1, 0, 0, 1, 1,
-0.4844698, -0.502751, -0.4010809, 1, 0, 0, 1, 1,
-0.4797971, 1.369905, -0.08593384, 1, 0, 0, 1, 1,
-0.4796985, 0.7655983, 0.1493575, 0, 0, 0, 1, 1,
-0.4760908, -1.264848, -0.721658, 0, 0, 0, 1, 1,
-0.4724781, -0.3034893, -1.536807, 0, 0, 0, 1, 1,
-0.4695103, 1.613213, -1.090645, 0, 0, 0, 1, 1,
-0.4684092, -0.95272, -2.563246, 0, 0, 0, 1, 1,
-0.4660231, 0.7641193, 0.1989669, 0, 0, 0, 1, 1,
-0.4623412, 0.07286245, -2.794491, 0, 0, 0, 1, 1,
-0.4614642, -0.5574952, -2.614038, 1, 1, 1, 1, 1,
-0.4587798, 0.5367302, 0.5013868, 1, 1, 1, 1, 1,
-0.4572941, -1.699063, -1.381796, 1, 1, 1, 1, 1,
-0.4565594, -0.09693386, -2.14297, 1, 1, 1, 1, 1,
-0.448151, 0.4777805, -1.409753, 1, 1, 1, 1, 1,
-0.4455591, 1.623156, -0.7194632, 1, 1, 1, 1, 1,
-0.4416604, -0.460342, -3.1682, 1, 1, 1, 1, 1,
-0.4409108, 0.2912364, -2.229388, 1, 1, 1, 1, 1,
-0.4393519, 2.026734, 0.7076014, 1, 1, 1, 1, 1,
-0.4390807, 0.8180484, -1.287517, 1, 1, 1, 1, 1,
-0.4378214, 0.4448099, -0.1106673, 1, 1, 1, 1, 1,
-0.4377904, -0.6083638, -3.483627, 1, 1, 1, 1, 1,
-0.4328638, 0.02099228, -1.660453, 1, 1, 1, 1, 1,
-0.4220608, -0.7942044, -2.685274, 1, 1, 1, 1, 1,
-0.4163642, -0.5394421, -2.929147, 1, 1, 1, 1, 1,
-0.4130177, -0.2390074, -0.09656972, 0, 0, 1, 1, 1,
-0.4103909, -1.341006, -2.892072, 1, 0, 0, 1, 1,
-0.4095602, 0.16912, 0.08949585, 1, 0, 0, 1, 1,
-0.4094162, -0.06677742, -0.961046, 1, 0, 0, 1, 1,
-0.4077644, 1.260525, -0.2725062, 1, 0, 0, 1, 1,
-0.4068659, 0.1710242, -2.433097, 1, 0, 0, 1, 1,
-0.4048623, 0.3648823, -1.542107, 0, 0, 0, 1, 1,
-0.400198, -2.839049, -2.706635, 0, 0, 0, 1, 1,
-0.3993548, -0.8530058, -1.841022, 0, 0, 0, 1, 1,
-0.3988083, -0.05963267, -1.559634, 0, 0, 0, 1, 1,
-0.3939719, 0.145106, -0.6163526, 0, 0, 0, 1, 1,
-0.3921771, -1.759585, -4.341647, 0, 0, 0, 1, 1,
-0.3921414, -0.5061087, -2.992408, 0, 0, 0, 1, 1,
-0.3849682, -1.177993, -2.059712, 1, 1, 1, 1, 1,
-0.3801156, -2.376173, -5.138529, 1, 1, 1, 1, 1,
-0.3748753, -0.5926611, -1.784003, 1, 1, 1, 1, 1,
-0.3726393, 1.265417, 1.270946, 1, 1, 1, 1, 1,
-0.3721927, -0.5179085, -2.84684, 1, 1, 1, 1, 1,
-0.3697387, -0.6868324, -3.770836, 1, 1, 1, 1, 1,
-0.3669442, 0.2581969, -0.754851, 1, 1, 1, 1, 1,
-0.3659133, -0.541039, -4.090956, 1, 1, 1, 1, 1,
-0.3651057, -0.4028162, -2.366265, 1, 1, 1, 1, 1,
-0.3631357, -0.2180097, -1.442995, 1, 1, 1, 1, 1,
-0.359957, -0.3673589, -2.027337, 1, 1, 1, 1, 1,
-0.3553827, -2.07336, -3.448386, 1, 1, 1, 1, 1,
-0.3546854, -0.04247693, -0.4232706, 1, 1, 1, 1, 1,
-0.3543873, -0.06752077, -3.657847, 1, 1, 1, 1, 1,
-0.3505693, -0.1390159, -0.9510401, 1, 1, 1, 1, 1,
-0.3497168, -0.6455601, -2.063918, 0, 0, 1, 1, 1,
-0.3495564, -0.6270052, -2.017683, 1, 0, 0, 1, 1,
-0.3485756, 0.6815758, -0.1402507, 1, 0, 0, 1, 1,
-0.3485107, -0.3914358, -1.637628, 1, 0, 0, 1, 1,
-0.347125, 1.003989, 0.2315222, 1, 0, 0, 1, 1,
-0.346596, -0.1533947, -2.536613, 1, 0, 0, 1, 1,
-0.3425809, 1.636828, -0.6198518, 0, 0, 0, 1, 1,
-0.3410932, -1.839272, -2.655911, 0, 0, 0, 1, 1,
-0.3401106, 0.5908247, -1.194454, 0, 0, 0, 1, 1,
-0.3392613, 0.4531635, -1.472901, 0, 0, 0, 1, 1,
-0.3388425, -0.8626476, -4.726243, 0, 0, 0, 1, 1,
-0.3368246, -1.03546, -2.934549, 0, 0, 0, 1, 1,
-0.3348158, 0.7455211, -0.1672453, 0, 0, 0, 1, 1,
-0.3344312, -0.1534374, -2.187382, 1, 1, 1, 1, 1,
-0.3319574, -0.4486281, -2.36237, 1, 1, 1, 1, 1,
-0.3284528, 0.1054054, 0.04668941, 1, 1, 1, 1, 1,
-0.3245146, 0.6069556, 0.3912516, 1, 1, 1, 1, 1,
-0.3189097, 0.9246956, 1.122554, 1, 1, 1, 1, 1,
-0.3185889, 1.768855, -1.676103, 1, 1, 1, 1, 1,
-0.3133554, -2.08327, -3.181251, 1, 1, 1, 1, 1,
-0.3091706, 1.472175, -0.4967043, 1, 1, 1, 1, 1,
-0.3080119, -0.2211303, -1.520612, 1, 1, 1, 1, 1,
-0.3009828, 1.664048, -0.5015472, 1, 1, 1, 1, 1,
-0.2973848, -0.04273164, 0.9402362, 1, 1, 1, 1, 1,
-0.2958885, -0.548527, -1.98015, 1, 1, 1, 1, 1,
-0.2938705, -0.3644933, -2.529892, 1, 1, 1, 1, 1,
-0.2880005, -0.1056454, -1.489759, 1, 1, 1, 1, 1,
-0.2856217, -0.1870866, -1.400814, 1, 1, 1, 1, 1,
-0.2831015, 0.8723683, -0.9525172, 0, 0, 1, 1, 1,
-0.2824216, 0.5257913, -0.9313065, 1, 0, 0, 1, 1,
-0.2800561, -0.7452662, -3.519158, 1, 0, 0, 1, 1,
-0.2725895, 1.469635, -0.2148805, 1, 0, 0, 1, 1,
-0.2701608, -0.5687684, -3.974924, 1, 0, 0, 1, 1,
-0.2672856, 0.9182316, -0.6608534, 1, 0, 0, 1, 1,
-0.2650062, 0.6155255, -1.538767, 0, 0, 0, 1, 1,
-0.2634479, -1.602952, -2.78981, 0, 0, 0, 1, 1,
-0.2559915, 0.131392, -1.803163, 0, 0, 0, 1, 1,
-0.2554336, 0.7954561, -0.4943937, 0, 0, 0, 1, 1,
-0.2549525, 0.4683112, -0.7033961, 0, 0, 0, 1, 1,
-0.2533977, 0.3460586, -0.3902824, 0, 0, 0, 1, 1,
-0.2520775, 2.796028, 0.8993145, 0, 0, 0, 1, 1,
-0.2493575, 0.3650964, -2.196509, 1, 1, 1, 1, 1,
-0.2460949, -0.4991406, -2.4244, 1, 1, 1, 1, 1,
-0.2420721, 0.3104909, -0.1756416, 1, 1, 1, 1, 1,
-0.240837, -0.9531973, -3.842636, 1, 1, 1, 1, 1,
-0.2408042, -1.050932, -2.573494, 1, 1, 1, 1, 1,
-0.2332376, 1.173018, 1.835389, 1, 1, 1, 1, 1,
-0.2221316, -1.354624, -3.633044, 1, 1, 1, 1, 1,
-0.2219597, -0.9565278, -4.860152, 1, 1, 1, 1, 1,
-0.219843, -0.6642749, -0.2880872, 1, 1, 1, 1, 1,
-0.2179043, -1.424973, -3.406995, 1, 1, 1, 1, 1,
-0.2149024, -0.1348863, -1.520176, 1, 1, 1, 1, 1,
-0.2085343, 0.9046838, 1.365614, 1, 1, 1, 1, 1,
-0.2069189, -0.3135753, -3.528764, 1, 1, 1, 1, 1,
-0.2037031, 3.688391, -0.4885333, 1, 1, 1, 1, 1,
-0.1959007, -0.04515767, -1.507869, 1, 1, 1, 1, 1,
-0.1951156, -0.9984294, -4.813521, 0, 0, 1, 1, 1,
-0.1923931, 1.622301, -1.050563, 1, 0, 0, 1, 1,
-0.1897969, 1.218043, -1.191992, 1, 0, 0, 1, 1,
-0.1873538, -0.8055986, -4.457088, 1, 0, 0, 1, 1,
-0.1807139, 0.01039615, -1.653277, 1, 0, 0, 1, 1,
-0.1792151, -1.900834, -2.611053, 1, 0, 0, 1, 1,
-0.1753221, 0.03115502, -2.963721, 0, 0, 0, 1, 1,
-0.1699833, -0.1472843, -1.5181, 0, 0, 0, 1, 1,
-0.1674016, 0.9023537, -0.5601449, 0, 0, 0, 1, 1,
-0.1668819, 1.927512, 1.545327, 0, 0, 0, 1, 1,
-0.1659972, 0.2094935, -0.9725218, 0, 0, 0, 1, 1,
-0.1653664, -0.7530411, -4.141513, 0, 0, 0, 1, 1,
-0.1614392, 1.295743, 1.168058, 0, 0, 0, 1, 1,
-0.160272, -0.7904356, -4.96968, 1, 1, 1, 1, 1,
-0.1588784, -0.6245692, -2.468486, 1, 1, 1, 1, 1,
-0.1526661, -0.5816848, -2.342254, 1, 1, 1, 1, 1,
-0.1508936, -0.5847797, -3.502223, 1, 1, 1, 1, 1,
-0.1498399, 0.3502152, 0.480113, 1, 1, 1, 1, 1,
-0.1483951, 1.694644, 0.4928251, 1, 1, 1, 1, 1,
-0.1481048, 0.5417768, -1.361775, 1, 1, 1, 1, 1,
-0.1446575, 1.073276, -1.732562, 1, 1, 1, 1, 1,
-0.1393735, 1.740788, -0.187416, 1, 1, 1, 1, 1,
-0.1362098, 0.6296156, 0.1458251, 1, 1, 1, 1, 1,
-0.1353764, -0.6834951, -1.319538, 1, 1, 1, 1, 1,
-0.133168, 0.3757711, -0.1209832, 1, 1, 1, 1, 1,
-0.1328889, 0.8399449, 0.1054903, 1, 1, 1, 1, 1,
-0.132162, -1.158425, -3.922324, 1, 1, 1, 1, 1,
-0.1296399, 1.026658, -0.28555, 1, 1, 1, 1, 1,
-0.1294302, -0.07912753, -0.9857641, 0, 0, 1, 1, 1,
-0.128263, 0.4621868, -0.3884043, 1, 0, 0, 1, 1,
-0.1282116, -1.543635, -0.9845214, 1, 0, 0, 1, 1,
-0.1279818, 0.3703361, 0.7315062, 1, 0, 0, 1, 1,
-0.127008, -0.5723665, -3.726364, 1, 0, 0, 1, 1,
-0.1264744, -0.1173825, -0.9254475, 1, 0, 0, 1, 1,
-0.1246472, 0.1722108, -0.2644999, 0, 0, 0, 1, 1,
-0.1242672, -1.783565, -3.356557, 0, 0, 0, 1, 1,
-0.1229712, 0.3007984, -2.561419, 0, 0, 0, 1, 1,
-0.1214976, -0.7218358, -2.849296, 0, 0, 0, 1, 1,
-0.1086925, -1.128584, -2.669716, 0, 0, 0, 1, 1,
-0.1074014, 0.2247049, -0.00624111, 0, 0, 0, 1, 1,
-0.1070632, -2.014916, -4.059525, 0, 0, 0, 1, 1,
-0.1042882, 1.344961, 1.219767, 1, 1, 1, 1, 1,
-0.1002193, -1.043712, -3.669425, 1, 1, 1, 1, 1,
-0.09975807, 0.3949445, 1.384567, 1, 1, 1, 1, 1,
-0.09712118, -0.1973859, -0.5006261, 1, 1, 1, 1, 1,
-0.09509505, 0.9272829, 0.3171337, 1, 1, 1, 1, 1,
-0.09241579, 0.5315216, -1.268363, 1, 1, 1, 1, 1,
-0.08803898, -1.332235, -2.50995, 1, 1, 1, 1, 1,
-0.08325493, 0.5439745, -1.210708, 1, 1, 1, 1, 1,
-0.08157909, -3.115218, -2.413678, 1, 1, 1, 1, 1,
-0.08128112, -0.7274082, -3.898135, 1, 1, 1, 1, 1,
-0.07856657, -1.125962, -3.794092, 1, 1, 1, 1, 1,
-0.07303043, 0.8253947, -2.051274, 1, 1, 1, 1, 1,
-0.07067927, -2.307118, -2.94716, 1, 1, 1, 1, 1,
-0.06847068, -0.03051257, -3.61017, 1, 1, 1, 1, 1,
-0.06738457, 0.3717329, 0.9384504, 1, 1, 1, 1, 1,
-0.06483916, 0.5580412, -0.1841273, 0, 0, 1, 1, 1,
-0.05589521, 0.4536902, 2.077518, 1, 0, 0, 1, 1,
-0.04497521, -0.5458488, -1.393293, 1, 0, 0, 1, 1,
-0.04316822, -0.04122125, -2.162845, 1, 0, 0, 1, 1,
-0.03920137, -0.181564, -3.057009, 1, 0, 0, 1, 1,
-0.03533397, 0.4969525, 0.4665931, 1, 0, 0, 1, 1,
-0.03520727, -1.007582, -3.301245, 0, 0, 0, 1, 1,
-0.03241004, 1.180001, -1.39008, 0, 0, 0, 1, 1,
-0.02992503, -0.7392692, -5.263051, 0, 0, 0, 1, 1,
-0.02909726, -0.7580491, -2.520137, 0, 0, 0, 1, 1,
-0.02759996, 0.4228024, 0.3330287, 0, 0, 0, 1, 1,
-0.02446122, -1.059223, -1.736524, 0, 0, 0, 1, 1,
-0.02339529, -0.7179489, -4.132624, 0, 0, 0, 1, 1,
-0.02086348, -2.587163, -4.083314, 1, 1, 1, 1, 1,
-0.0186286, -0.5069678, -4.062996, 1, 1, 1, 1, 1,
-0.01815045, -0.3881326, -3.76469, 1, 1, 1, 1, 1,
-0.01660257, 0.6901065, -0.1663456, 1, 1, 1, 1, 1,
-0.01594127, 1.235597, -0.3424194, 1, 1, 1, 1, 1,
-0.01296233, -0.01634909, -2.630234, 1, 1, 1, 1, 1,
-0.0125772, 0.7577696, 0.278717, 1, 1, 1, 1, 1,
-0.004789702, -0.8478408, -4.024326, 1, 1, 1, 1, 1,
-0.004383502, -0.3084202, -2.229397, 1, 1, 1, 1, 1,
-0.002401714, -0.9838269, -3.912387, 1, 1, 1, 1, 1,
0.005361795, -0.3408456, 4.254692, 1, 1, 1, 1, 1,
0.005404482, 1.457587, -0.5351617, 1, 1, 1, 1, 1,
0.007815656, -1.597236, 3.870001, 1, 1, 1, 1, 1,
0.01042696, 0.2039266, -1.693134, 1, 1, 1, 1, 1,
0.01414307, 1.583304, 1.753728, 1, 1, 1, 1, 1,
0.01511729, 1.337773, -0.004818849, 0, 0, 1, 1, 1,
0.0153406, 0.1230921, -0.1150264, 1, 0, 0, 1, 1,
0.01820177, 0.5344384, -1.252414, 1, 0, 0, 1, 1,
0.02064089, 1.144239, -0.8949065, 1, 0, 0, 1, 1,
0.0211879, -0.4625591, 0.8698878, 1, 0, 0, 1, 1,
0.02563866, -0.3019909, 2.482634, 1, 0, 0, 1, 1,
0.03332407, -0.4053425, 2.652706, 0, 0, 0, 1, 1,
0.0334613, 0.3011819, 0.09332866, 0, 0, 0, 1, 1,
0.03395304, 1.068821, 0.0007939865, 0, 0, 0, 1, 1,
0.03535505, -0.1978825, 2.84954, 0, 0, 0, 1, 1,
0.03598168, 1.731516, -0.5391352, 0, 0, 0, 1, 1,
0.03814195, -1.067791, 2.388916, 0, 0, 0, 1, 1,
0.04426448, 2.102893, 0.579427, 0, 0, 0, 1, 1,
0.04493829, -0.1339036, 2.706893, 1, 1, 1, 1, 1,
0.05586825, -0.2861031, 2.970662, 1, 1, 1, 1, 1,
0.05625326, -0.1391252, 2.460148, 1, 1, 1, 1, 1,
0.05969035, 0.3366374, -0.5702662, 1, 1, 1, 1, 1,
0.06376409, -0.1498854, 3.379486, 1, 1, 1, 1, 1,
0.06470138, 0.6574126, -1.612516, 1, 1, 1, 1, 1,
0.06974308, -1.814288, 5.15371, 1, 1, 1, 1, 1,
0.06976519, 2.474989, -1.800999, 1, 1, 1, 1, 1,
0.07011812, 1.7635, -1.181214, 1, 1, 1, 1, 1,
0.07666764, 0.5037897, -0.2058875, 1, 1, 1, 1, 1,
0.07869532, 1.625317, -0.14301, 1, 1, 1, 1, 1,
0.08285682, 0.2312538, 0.02050589, 1, 1, 1, 1, 1,
0.08906858, -0.4793802, 2.380857, 1, 1, 1, 1, 1,
0.09324472, -1.585885, 2.269916, 1, 1, 1, 1, 1,
0.098585, 0.5956922, 0.5616679, 1, 1, 1, 1, 1,
0.1034713, -1.966929, 5.59093, 0, 0, 1, 1, 1,
0.1036713, 0.1445611, 0.7224118, 1, 0, 0, 1, 1,
0.1036838, -1.084138, 3.714511, 1, 0, 0, 1, 1,
0.107434, 1.848191, 0.9177806, 1, 0, 0, 1, 1,
0.1095174, 0.5162599, 0.17517, 1, 0, 0, 1, 1,
0.112108, 0.2059293, 1.057595, 1, 0, 0, 1, 1,
0.1133123, -0.9919586, 2.025133, 0, 0, 0, 1, 1,
0.1162333, -0.61602, 3.604071, 0, 0, 0, 1, 1,
0.1207075, 0.1817691, 1.039399, 0, 0, 0, 1, 1,
0.1225937, 1.578657, -0.1228786, 0, 0, 0, 1, 1,
0.1276338, 0.2407791, 2.083647, 0, 0, 0, 1, 1,
0.1306434, -0.5465491, 3.150568, 0, 0, 0, 1, 1,
0.137517, 1.483905, -0.3854603, 0, 0, 0, 1, 1,
0.1388181, -1.677377, 1.671691, 1, 1, 1, 1, 1,
0.144276, 1.325055, -1.096014, 1, 1, 1, 1, 1,
0.1452521, 2.4169, -0.4668537, 1, 1, 1, 1, 1,
0.1486777, 0.2298661, 0.6090542, 1, 1, 1, 1, 1,
0.1489493, -0.6407316, 4.224347, 1, 1, 1, 1, 1,
0.15095, 1.035841, 0.05856525, 1, 1, 1, 1, 1,
0.1525519, -0.09575847, 2.27228, 1, 1, 1, 1, 1,
0.1536273, 0.09996656, 1.820707, 1, 1, 1, 1, 1,
0.154787, -1.747702, 4.043179, 1, 1, 1, 1, 1,
0.1573137, -1.234977, 4.86656, 1, 1, 1, 1, 1,
0.157979, -0.6754392, 3.815239, 1, 1, 1, 1, 1,
0.1588748, -1.534278, 3.214589, 1, 1, 1, 1, 1,
0.1617982, -0.9663885, 3.789727, 1, 1, 1, 1, 1,
0.1686097, 0.5278908, -0.8496128, 1, 1, 1, 1, 1,
0.1697215, -2.019922, 5.140391, 1, 1, 1, 1, 1,
0.1779647, -0.1237034, 3.620004, 0, 0, 1, 1, 1,
0.1846766, -0.7593077, 1.144089, 1, 0, 0, 1, 1,
0.1890435, -1.068648, 2.742161, 1, 0, 0, 1, 1,
0.1911925, 0.5253187, 0.8621532, 1, 0, 0, 1, 1,
0.1929426, -0.8446257, 1.503281, 1, 0, 0, 1, 1,
0.1947831, 0.2916767, 0.8454714, 1, 0, 0, 1, 1,
0.1951928, 0.4275288, 1.18935, 0, 0, 0, 1, 1,
0.1953108, -1.28053, 3.921476, 0, 0, 0, 1, 1,
0.1969262, 0.4111129, 0.2948951, 0, 0, 0, 1, 1,
0.2031112, -0.2368705, 2.84324, 0, 0, 0, 1, 1,
0.2035655, 1.639365, 0.3037514, 0, 0, 0, 1, 1,
0.203595, 1.048208, 0.2755287, 0, 0, 0, 1, 1,
0.2051829, -0.1056624, 3.694739, 0, 0, 0, 1, 1,
0.2144629, 0.4631926, -0.3050028, 1, 1, 1, 1, 1,
0.2199511, 0.9017944, -0.5059428, 1, 1, 1, 1, 1,
0.2208107, 0.7229928, -1.074539, 1, 1, 1, 1, 1,
0.2217728, 0.1295845, 1.545748, 1, 1, 1, 1, 1,
0.2219804, -0.1555029, 1.452083, 1, 1, 1, 1, 1,
0.2245577, 0.05422315, -0.8189052, 1, 1, 1, 1, 1,
0.225662, -0.424525, 4.097755, 1, 1, 1, 1, 1,
0.2275396, -0.5084718, 3.797857, 1, 1, 1, 1, 1,
0.236942, -0.701503, 1.767342, 1, 1, 1, 1, 1,
0.237532, 1.099601, 0.02255918, 1, 1, 1, 1, 1,
0.2391406, -0.8724849, 2.761256, 1, 1, 1, 1, 1,
0.2505891, 1.568721, 2.511483, 1, 1, 1, 1, 1,
0.2521659, 0.7140789, 1.133384, 1, 1, 1, 1, 1,
0.2551185, 0.4545948, -0.1478653, 1, 1, 1, 1, 1,
0.2591831, 1.34087, 2.266627, 1, 1, 1, 1, 1,
0.2622322, 0.503298, -0.06599382, 0, 0, 1, 1, 1,
0.262937, 0.3124977, -0.5675929, 1, 0, 0, 1, 1,
0.2666803, 2.09726, 0.5776455, 1, 0, 0, 1, 1,
0.2689618, -0.2574795, 3.894592, 1, 0, 0, 1, 1,
0.2694391, 0.1723885, 1.0337, 1, 0, 0, 1, 1,
0.2774991, 1.290747, -0.3391113, 1, 0, 0, 1, 1,
0.2811163, -0.2139721, 0.7591037, 0, 0, 0, 1, 1,
0.2892015, 0.4989093, -0.499691, 0, 0, 0, 1, 1,
0.2899559, -1.379427, 2.790334, 0, 0, 0, 1, 1,
0.2904917, -1.405672, 2.187345, 0, 0, 0, 1, 1,
0.2912803, -0.682329, 3.813114, 0, 0, 0, 1, 1,
0.2940001, -0.4099512, 0.6947181, 0, 0, 0, 1, 1,
0.2959087, 0.3520219, 1.160536, 0, 0, 0, 1, 1,
0.2986162, 0.4557825, 1.218208, 1, 1, 1, 1, 1,
0.3002302, -0.5859682, 3.769519, 1, 1, 1, 1, 1,
0.3025655, -0.5838564, 2.186535, 1, 1, 1, 1, 1,
0.3039643, -0.6815276, 2.334868, 1, 1, 1, 1, 1,
0.3041515, -0.694446, 0.7186958, 1, 1, 1, 1, 1,
0.3043631, 1.480183, 0.7087317, 1, 1, 1, 1, 1,
0.3059437, 1.056098, 0.9443427, 1, 1, 1, 1, 1,
0.3061436, -0.448549, 0.9377357, 1, 1, 1, 1, 1,
0.3105423, 0.1793705, 1.423522, 1, 1, 1, 1, 1,
0.31201, -0.0458004, 0.4197203, 1, 1, 1, 1, 1,
0.3129131, 0.7590727, 0.7841519, 1, 1, 1, 1, 1,
0.3155282, 0.7494244, -0.137231, 1, 1, 1, 1, 1,
0.3155417, 1.426575, -0.4687451, 1, 1, 1, 1, 1,
0.3168739, 1.054106, 1.154228, 1, 1, 1, 1, 1,
0.3242671, 0.07063908, 0.9756356, 1, 1, 1, 1, 1,
0.3253592, 1.037405, 0.1506513, 0, 0, 1, 1, 1,
0.3270262, -0.4831305, 4.171109, 1, 0, 0, 1, 1,
0.3280172, -0.3903031, 2.340829, 1, 0, 0, 1, 1,
0.3342475, 0.2755508, 2.274301, 1, 0, 0, 1, 1,
0.3352353, -1.94583, 1.509819, 1, 0, 0, 1, 1,
0.3360048, -1.478144, 3.44608, 1, 0, 0, 1, 1,
0.3364872, -0.7029795, 3.03209, 0, 0, 0, 1, 1,
0.3401216, -0.4517436, 3.66609, 0, 0, 0, 1, 1,
0.3438197, -0.2564014, 2.404999, 0, 0, 0, 1, 1,
0.3451859, 0.4402831, 1.167018, 0, 0, 0, 1, 1,
0.3470589, 0.5281054, 0.9840127, 0, 0, 0, 1, 1,
0.3478912, 0.951991, 1.54735, 0, 0, 0, 1, 1,
0.3479696, 1.06857, 2.178436, 0, 0, 0, 1, 1,
0.3492072, -2.83128, 1.562247, 1, 1, 1, 1, 1,
0.3500989, -0.4344142, 3.931302, 1, 1, 1, 1, 1,
0.3516176, 1.166799, 2.032231, 1, 1, 1, 1, 1,
0.3550861, 0.1020594, 3.134257, 1, 1, 1, 1, 1,
0.3553521, 1.561211, 0.9636848, 1, 1, 1, 1, 1,
0.3589204, 0.3940175, 0.9067201, 1, 1, 1, 1, 1,
0.3590702, -1.19906, 1.818717, 1, 1, 1, 1, 1,
0.3663146, -0.8377458, 3.227973, 1, 1, 1, 1, 1,
0.3689094, 0.6343944, 0.7419261, 1, 1, 1, 1, 1,
0.3701791, 0.4605995, 0.4143818, 1, 1, 1, 1, 1,
0.3703121, -0.3426319, 3.806331, 1, 1, 1, 1, 1,
0.3743587, 0.4655256, 0.4245722, 1, 1, 1, 1, 1,
0.3778375, -0.6660889, 1.775505, 1, 1, 1, 1, 1,
0.3814948, -0.5888609, 1.625317, 1, 1, 1, 1, 1,
0.3815449, -0.2813629, 2.436793, 1, 1, 1, 1, 1,
0.3840685, 0.7538226, -0.8051581, 0, 0, 1, 1, 1,
0.387004, 0.2822832, 2.846601, 1, 0, 0, 1, 1,
0.3893871, 0.4809405, -0.4061489, 1, 0, 0, 1, 1,
0.3910439, 0.2229171, 0.750653, 1, 0, 0, 1, 1,
0.3919401, -0.01579024, 2.784745, 1, 0, 0, 1, 1,
0.3937437, -0.5104452, 4.218602, 1, 0, 0, 1, 1,
0.4090267, 0.5710599, 1.171355, 0, 0, 0, 1, 1,
0.4132667, 1.222147, 1.093005, 0, 0, 0, 1, 1,
0.4229368, -0.7488828, 2.700147, 0, 0, 0, 1, 1,
0.4240586, -1.173148, 1.800253, 0, 0, 0, 1, 1,
0.4343616, -0.8194932, 3.547799, 0, 0, 0, 1, 1,
0.4404887, -0.6940902, 4.54124, 0, 0, 0, 1, 1,
0.4423623, -1.43717, 2.491561, 0, 0, 0, 1, 1,
0.4462864, -1.787956, 2.887516, 1, 1, 1, 1, 1,
0.4530606, 0.0800025, 2.282541, 1, 1, 1, 1, 1,
0.4535788, 0.7279879, -0.9846264, 1, 1, 1, 1, 1,
0.4590541, -0.7713879, 2.711306, 1, 1, 1, 1, 1,
0.4633195, 3.049489, -0.5068102, 1, 1, 1, 1, 1,
0.4738915, 0.549043, 1.10303, 1, 1, 1, 1, 1,
0.4740925, 0.7455979, 0.9075493, 1, 1, 1, 1, 1,
0.4780411, -1.195798, 1.840322, 1, 1, 1, 1, 1,
0.4790324, 1.219425, -0.1145726, 1, 1, 1, 1, 1,
0.4823167, -1.592229, 1.328437, 1, 1, 1, 1, 1,
0.4831644, 1.303552, -0.644278, 1, 1, 1, 1, 1,
0.4835998, 0.9866122, 0.468872, 1, 1, 1, 1, 1,
0.4857075, 0.1122312, 2.804618, 1, 1, 1, 1, 1,
0.4860559, 0.5380518, 0.6482428, 1, 1, 1, 1, 1,
0.486711, -0.9793527, 4.114051, 1, 1, 1, 1, 1,
0.487677, 0.5968444, 2.39258, 0, 0, 1, 1, 1,
0.4935474, -0.7443491, 3.555016, 1, 0, 0, 1, 1,
0.4957981, 0.943621, 2.337274, 1, 0, 0, 1, 1,
0.5050347, 0.1016348, 1.860762, 1, 0, 0, 1, 1,
0.5082826, 0.05752018, 1.148824, 1, 0, 0, 1, 1,
0.5084997, -0.3684141, 2.514273, 1, 0, 0, 1, 1,
0.5109296, 0.7344577, 0.832101, 0, 0, 0, 1, 1,
0.5116051, 1.64083, -0.7771864, 0, 0, 0, 1, 1,
0.512661, -0.8125046, 3.460456, 0, 0, 0, 1, 1,
0.5165589, 0.03802773, 2.66734, 0, 0, 0, 1, 1,
0.5188434, 0.4077151, 0.7708462, 0, 0, 0, 1, 1,
0.5232072, -0.02225956, 1.192285, 0, 0, 0, 1, 1,
0.5262961, 0.6266706, 1.869613, 0, 0, 0, 1, 1,
0.5270684, 0.8284364, -0.1162778, 1, 1, 1, 1, 1,
0.5309386, 1.779275, 1.085681, 1, 1, 1, 1, 1,
0.5349937, -1.131872, 3.777712, 1, 1, 1, 1, 1,
0.535014, -0.570172, 3.402107, 1, 1, 1, 1, 1,
0.5363544, 0.4445808, 1.264608, 1, 1, 1, 1, 1,
0.536597, -0.3974393, 2.013728, 1, 1, 1, 1, 1,
0.5429853, 0.7494537, -0.6905001, 1, 1, 1, 1, 1,
0.5430001, -1.070896, 4.508141, 1, 1, 1, 1, 1,
0.5441192, -1.656097, 1.682011, 1, 1, 1, 1, 1,
0.5542174, -1.267328, 5.125785, 1, 1, 1, 1, 1,
0.5586426, 0.2766634, 1.527843, 1, 1, 1, 1, 1,
0.5607929, -0.1756004, 1.021709, 1, 1, 1, 1, 1,
0.5653993, 1.594806, 1.679134, 1, 1, 1, 1, 1,
0.5733234, 0.3599956, 2.005921, 1, 1, 1, 1, 1,
0.5839305, 0.4056097, 1.273312, 1, 1, 1, 1, 1,
0.5854114, 0.4183064, 0.803288, 0, 0, 1, 1, 1,
0.5942935, -0.4731902, 2.643816, 1, 0, 0, 1, 1,
0.5990758, 2.525983, 1.918951, 1, 0, 0, 1, 1,
0.6006905, 1.945475, -0.3740417, 1, 0, 0, 1, 1,
0.602294, -1.078119, 3.543764, 1, 0, 0, 1, 1,
0.6075631, 1.817403, 2.026569, 1, 0, 0, 1, 1,
0.6091794, 0.4799766, 0.2287607, 0, 0, 0, 1, 1,
0.6093067, -0.9971246, 3.69413, 0, 0, 0, 1, 1,
0.6103398, 1.136497, 0.3037641, 0, 0, 0, 1, 1,
0.6112339, 0.8354926, 0.7396729, 0, 0, 0, 1, 1,
0.619189, 1.586497, 0.7530509, 0, 0, 0, 1, 1,
0.6232364, -1.994262, 2.402488, 0, 0, 0, 1, 1,
0.6242628, -1.58887, 2.890392, 0, 0, 0, 1, 1,
0.6250529, 1.692919, 0.5242825, 1, 1, 1, 1, 1,
0.6330251, 0.566983, 0.589262, 1, 1, 1, 1, 1,
0.6354308, 0.5260863, -1.512649, 1, 1, 1, 1, 1,
0.6372275, -0.1304795, 1.403124, 1, 1, 1, 1, 1,
0.6406477, -0.5787954, 0.7029708, 1, 1, 1, 1, 1,
0.6421376, -0.1332487, 2.501677, 1, 1, 1, 1, 1,
0.6429691, -1.202592, 2.63302, 1, 1, 1, 1, 1,
0.6442807, 0.121506, 1.982193, 1, 1, 1, 1, 1,
0.6458361, 0.5026731, 0.6048139, 1, 1, 1, 1, 1,
0.6508315, -0.7452741, 1.451422, 1, 1, 1, 1, 1,
0.6534217, 0.8184043, 2.118331, 1, 1, 1, 1, 1,
0.6600637, -0.2919322, 1.676839, 1, 1, 1, 1, 1,
0.6630979, -1.383171, 2.061377, 1, 1, 1, 1, 1,
0.6671479, -0.1500975, -0.6581306, 1, 1, 1, 1, 1,
0.6682028, -0.6197617, 1.558384, 1, 1, 1, 1, 1,
0.6812604, 0.8370355, -1.579834, 0, 0, 1, 1, 1,
0.6858733, -1.136823, 3.893234, 1, 0, 0, 1, 1,
0.68927, 0.8258669, 1.226049, 1, 0, 0, 1, 1,
0.6921287, -1.452718, 3.326338, 1, 0, 0, 1, 1,
0.699402, -1.579104, 2.377411, 1, 0, 0, 1, 1,
0.7026722, -1.414293, 2.648106, 1, 0, 0, 1, 1,
0.7028551, 1.350121, -0.7568234, 0, 0, 0, 1, 1,
0.7051253, -0.7881861, 1.780226, 0, 0, 0, 1, 1,
0.7078757, -2.2284, 3.592155, 0, 0, 0, 1, 1,
0.7093912, -2.24227, 3.242032, 0, 0, 0, 1, 1,
0.715172, -0.4882159, 4.047489, 0, 0, 0, 1, 1,
0.7155761, -1.00594, 2.821427, 0, 0, 0, 1, 1,
0.7192162, -0.6316051, 3.916527, 0, 0, 0, 1, 1,
0.7254181, -0.551228, 3.003175, 1, 1, 1, 1, 1,
0.7263515, 0.5316159, 0.4059484, 1, 1, 1, 1, 1,
0.7329683, -0.9306712, 2.342813, 1, 1, 1, 1, 1,
0.7376109, -0.8230876, 2.145125, 1, 1, 1, 1, 1,
0.7419136, 0.6033273, 2.814559, 1, 1, 1, 1, 1,
0.7467513, -0.4979989, 3.287825, 1, 1, 1, 1, 1,
0.7469659, 0.6359921, 0.7525728, 1, 1, 1, 1, 1,
0.7504137, -0.4760863, 1.690008, 1, 1, 1, 1, 1,
0.7529172, -0.09376507, -0.6736476, 1, 1, 1, 1, 1,
0.7531547, -0.1299714, 2.424977, 1, 1, 1, 1, 1,
0.7643691, -0.2804406, 1.548716, 1, 1, 1, 1, 1,
0.7644826, 0.7751549, 0.9548607, 1, 1, 1, 1, 1,
0.764755, -1.972533, 3.068732, 1, 1, 1, 1, 1,
0.7688205, 0.4174837, 1.07982, 1, 1, 1, 1, 1,
0.7721205, 1.080071, 1.180668, 1, 1, 1, 1, 1,
0.7798225, 0.9719479, 0.4430572, 0, 0, 1, 1, 1,
0.7827895, 0.4840764, -0.4273716, 1, 0, 0, 1, 1,
0.7877879, -1.308572, 3.502171, 1, 0, 0, 1, 1,
0.7882597, -0.3869164, 2.062091, 1, 0, 0, 1, 1,
0.7955673, 0.2254726, 1.952711, 1, 0, 0, 1, 1,
0.7969035, 0.7810376, 1.374247, 1, 0, 0, 1, 1,
0.8002194, -1.646526, 1.943337, 0, 0, 0, 1, 1,
0.8003494, -0.08121957, 2.02949, 0, 0, 0, 1, 1,
0.8039737, 0.5480385, 1.678146, 0, 0, 0, 1, 1,
0.8045543, -0.8789682, 1.701064, 0, 0, 0, 1, 1,
0.8073649, 0.1055894, -0.3859887, 0, 0, 0, 1, 1,
0.8139173, 0.613517, 1.637639, 0, 0, 0, 1, 1,
0.8143212, -1.054054, 2.875717, 0, 0, 0, 1, 1,
0.8158091, -1.11234, 4.108662, 1, 1, 1, 1, 1,
0.8265331, 0.7644873, -1.262372, 1, 1, 1, 1, 1,
0.8287532, -0.9563345, 2.500867, 1, 1, 1, 1, 1,
0.8306096, 1.185556, -1.547644, 1, 1, 1, 1, 1,
0.83521, 0.1919552, 2.105474, 1, 1, 1, 1, 1,
0.8442608, 0.7473089, 0.1655177, 1, 1, 1, 1, 1,
0.8447465, -0.4152907, 1.565771, 1, 1, 1, 1, 1,
0.8456464, 0.4066876, 0.5121595, 1, 1, 1, 1, 1,
0.8512036, -0.6822192, 2.641145, 1, 1, 1, 1, 1,
0.8558745, 0.6111311, -1.896241, 1, 1, 1, 1, 1,
0.8626198, 2.360204, 0.7939666, 1, 1, 1, 1, 1,
0.8638778, 0.6901409, 2.038148, 1, 1, 1, 1, 1,
0.8653742, 0.6437738, 0.813443, 1, 1, 1, 1, 1,
0.8689541, -1.494652, 3.13791, 1, 1, 1, 1, 1,
0.8747531, 1.263352, 1.124513, 1, 1, 1, 1, 1,
0.8796255, -0.1675731, 2.07114, 0, 0, 1, 1, 1,
0.8841239, -0.08787149, 1.194368, 1, 0, 0, 1, 1,
0.886098, -0.918424, 2.439025, 1, 0, 0, 1, 1,
0.8871282, 1.061061, 0.325146, 1, 0, 0, 1, 1,
0.8882335, 1.154085, 2.412426, 1, 0, 0, 1, 1,
0.8901662, -0.8172441, 4.045331, 1, 0, 0, 1, 1,
0.8976005, 0.2692946, 1.740491, 0, 0, 0, 1, 1,
0.9004428, 0.9113321, -0.2914955, 0, 0, 0, 1, 1,
0.9036064, 0.8773537, 1.339349, 0, 0, 0, 1, 1,
0.9040325, -1.355605, 2.131792, 0, 0, 0, 1, 1,
0.9082204, 1.534719, 0.1674903, 0, 0, 0, 1, 1,
0.9082473, -1.06121, 1.660668, 0, 0, 0, 1, 1,
0.9100541, 1.467385, 0.713342, 0, 0, 0, 1, 1,
0.9190465, -0.6244912, 3.42214, 1, 1, 1, 1, 1,
0.9223193, -1.820373, 2.189537, 1, 1, 1, 1, 1,
0.9313707, 0.06337739, 0.05490471, 1, 1, 1, 1, 1,
0.937488, -0.485113, 3.576214, 1, 1, 1, 1, 1,
0.9379054, -0.2062312, 2.213733, 1, 1, 1, 1, 1,
0.939819, 0.01866844, 2.20509, 1, 1, 1, 1, 1,
0.9552932, 1.227379, 1.281743, 1, 1, 1, 1, 1,
0.9575289, 0.2263125, 1.614066, 1, 1, 1, 1, 1,
0.9591415, -0.2318661, 2.561015, 1, 1, 1, 1, 1,
0.9614927, -0.4954911, 3.41223, 1, 1, 1, 1, 1,
0.9625444, -1.339435, 2.306298, 1, 1, 1, 1, 1,
0.9685661, -0.9734808, 3.738078, 1, 1, 1, 1, 1,
0.9732013, 0.1445463, 1.840234, 1, 1, 1, 1, 1,
0.9758852, -1.426673, 3.154207, 1, 1, 1, 1, 1,
0.9784638, 0.619111, 0.6629843, 1, 1, 1, 1, 1,
0.9784896, -0.004460465, 0.2675347, 0, 0, 1, 1, 1,
0.9808646, -0.7676812, 2.452496, 1, 0, 0, 1, 1,
0.9900271, -0.7340158, 2.988544, 1, 0, 0, 1, 1,
0.9971064, -0.4080649, 2.317798, 1, 0, 0, 1, 1,
0.9973707, -0.4221937, 3.616278, 1, 0, 0, 1, 1,
1.002524, -0.4422097, 1.669202, 1, 0, 0, 1, 1,
1.003485, -0.3413734, 1.364937, 0, 0, 0, 1, 1,
1.004591, 0.9582823, 0.06924222, 0, 0, 0, 1, 1,
1.005526, -0.1264549, -0.09942685, 0, 0, 0, 1, 1,
1.01234, 0.544341, 0.6607803, 0, 0, 0, 1, 1,
1.016461, -1.079633, 1.480059, 0, 0, 0, 1, 1,
1.020044, 1.823954, -1.340823, 0, 0, 0, 1, 1,
1.021113, 0.3002342, 0.5652941, 0, 0, 0, 1, 1,
1.039198, -0.7201581, 1.885735, 1, 1, 1, 1, 1,
1.039237, 0.6993149, 0.03276789, 1, 1, 1, 1, 1,
1.043481, 0.5264228, -1.401262, 1, 1, 1, 1, 1,
1.045305, -0.8972816, 1.80804, 1, 1, 1, 1, 1,
1.045541, -0.4381212, 2.274572, 1, 1, 1, 1, 1,
1.047221, 1.756542, 1.59837, 1, 1, 1, 1, 1,
1.047839, -0.9196875, 0.4988294, 1, 1, 1, 1, 1,
1.054642, -0.5948836, 1.996176, 1, 1, 1, 1, 1,
1.056606, -0.1994662, 1.291041, 1, 1, 1, 1, 1,
1.062031, 1.2431, 0.2671396, 1, 1, 1, 1, 1,
1.062468, 1.123482, -1.088458, 1, 1, 1, 1, 1,
1.063066, -0.6751978, 2.419364, 1, 1, 1, 1, 1,
1.066963, 1.630001, 1.620259, 1, 1, 1, 1, 1,
1.074652, 0.01596305, 1.895472, 1, 1, 1, 1, 1,
1.074837, 0.01699323, 2.485068, 1, 1, 1, 1, 1,
1.079814, 0.5909349, -0.3798158, 0, 0, 1, 1, 1,
1.085359, -0.2716234, 2.920679, 1, 0, 0, 1, 1,
1.092528, -0.3909879, 1.257347, 1, 0, 0, 1, 1,
1.098247, -0.704538, 2.399539, 1, 0, 0, 1, 1,
1.100097, -2.397571, 3.402697, 1, 0, 0, 1, 1,
1.103657, -0.8913137, 1.243145, 1, 0, 0, 1, 1,
1.10744, -0.5232081, 3.025337, 0, 0, 0, 1, 1,
1.11704, 1.981841, 2.080856, 0, 0, 0, 1, 1,
1.121219, 0.5918754, 0.07375349, 0, 0, 0, 1, 1,
1.123347, -0.244558, 2.043621, 0, 0, 0, 1, 1,
1.127099, -1.536759, 3.206136, 0, 0, 0, 1, 1,
1.128507, 0.4057317, 1.801989, 0, 0, 0, 1, 1,
1.129694, -0.2482376, 1.62157, 0, 0, 0, 1, 1,
1.129712, 2.093522, 0.3939501, 1, 1, 1, 1, 1,
1.130835, -1.055644, 2.195325, 1, 1, 1, 1, 1,
1.134104, 0.2565864, 1.220076, 1, 1, 1, 1, 1,
1.138625, -0.6349443, 1.792376, 1, 1, 1, 1, 1,
1.152722, 1.758105, 0.1440918, 1, 1, 1, 1, 1,
1.156948, -1.684884, 1.546818, 1, 1, 1, 1, 1,
1.167893, 0.1591853, 0.8439404, 1, 1, 1, 1, 1,
1.174996, -0.9083444, 2.109646, 1, 1, 1, 1, 1,
1.184279, -0.698703, 1.884189, 1, 1, 1, 1, 1,
1.200869, 0.5600035, -0.3924608, 1, 1, 1, 1, 1,
1.201939, 0.2064118, -0.0896427, 1, 1, 1, 1, 1,
1.214269, 0.115373, 1.820179, 1, 1, 1, 1, 1,
1.220608, -0.4789605, 0.4590001, 1, 1, 1, 1, 1,
1.224716, 0.6265895, 1.937719, 1, 1, 1, 1, 1,
1.229143, -0.336818, 1.55291, 1, 1, 1, 1, 1,
1.230355, -1.620472, 3.275946, 0, 0, 1, 1, 1,
1.23441, -0.3839217, 3.269344, 1, 0, 0, 1, 1,
1.238905, -0.3686847, 1.634103, 1, 0, 0, 1, 1,
1.242883, -0.3288489, 3.078646, 1, 0, 0, 1, 1,
1.254761, 0.1036327, 1.781953, 1, 0, 0, 1, 1,
1.25591, -0.4098847, 1.007882, 1, 0, 0, 1, 1,
1.260957, -0.4366295, 2.848834, 0, 0, 0, 1, 1,
1.268837, 0.2656479, 0.4402627, 0, 0, 0, 1, 1,
1.27599, -0.6201836, 1.643246, 0, 0, 0, 1, 1,
1.293867, 0.1313695, 1.374596, 0, 0, 0, 1, 1,
1.29472, 0.4503598, 1.042098, 0, 0, 0, 1, 1,
1.306288, -0.6928167, 2.407828, 0, 0, 0, 1, 1,
1.308251, 0.2179105, 1.970607, 0, 0, 0, 1, 1,
1.315082, 0.2068617, 1.105595, 1, 1, 1, 1, 1,
1.321252, -1.191601, 3.638063, 1, 1, 1, 1, 1,
1.324387, -0.434496, 1.802878, 1, 1, 1, 1, 1,
1.33382, 0.05617866, 0.8052602, 1, 1, 1, 1, 1,
1.337526, -0.3986902, 2.827065, 1, 1, 1, 1, 1,
1.338788, 1.274329, 0.8538307, 1, 1, 1, 1, 1,
1.344334, 1.18877, 1.236958, 1, 1, 1, 1, 1,
1.344389, 0.3285214, 2.053243, 1, 1, 1, 1, 1,
1.346964, 0.9838175, 1.704257, 1, 1, 1, 1, 1,
1.356917, 0.9698058, 0.5080559, 1, 1, 1, 1, 1,
1.363711, -0.06547111, 1.356267, 1, 1, 1, 1, 1,
1.364976, 0.7439063, 0.1349126, 1, 1, 1, 1, 1,
1.365503, 2.044624, 1.784391, 1, 1, 1, 1, 1,
1.377453, -0.3221115, 1.967398, 1, 1, 1, 1, 1,
1.378509, 0.8687783, 1.892902, 1, 1, 1, 1, 1,
1.392009, 1.1468, 0.7657166, 0, 0, 1, 1, 1,
1.395261, 1.255886, 0.8040208, 1, 0, 0, 1, 1,
1.395371, -0.5184889, 1.120904, 1, 0, 0, 1, 1,
1.398145, -0.1901814, 1.376555, 1, 0, 0, 1, 1,
1.401201, 0.6682919, 0.5792392, 1, 0, 0, 1, 1,
1.415588, 1.129321, 1.339033, 1, 0, 0, 1, 1,
1.427168, -0.7133491, 2.295691, 0, 0, 0, 1, 1,
1.433329, 0.7945552, 1.528035, 0, 0, 0, 1, 1,
1.44295, 2.57015, 0.7991741, 0, 0, 0, 1, 1,
1.444379, -0.7906022, 3.113997, 0, 0, 0, 1, 1,
1.461274, -1.463599, 2.803815, 0, 0, 0, 1, 1,
1.467765, -1.73826, 2.39118, 0, 0, 0, 1, 1,
1.468516, 0.2422373, 2.431778, 0, 0, 0, 1, 1,
1.471477, 0.01889265, 0.2587304, 1, 1, 1, 1, 1,
1.480189, -1.038287, 1.640173, 1, 1, 1, 1, 1,
1.494288, 0.9020659, 1.03971, 1, 1, 1, 1, 1,
1.495801, 0.4994698, 0.236432, 1, 1, 1, 1, 1,
1.501788, -0.2566055, 2.584748, 1, 1, 1, 1, 1,
1.506686, -0.0619749, 0.9518494, 1, 1, 1, 1, 1,
1.508946, 1.460453, 0.8493274, 1, 1, 1, 1, 1,
1.525525, -0.5487705, 4.58413, 1, 1, 1, 1, 1,
1.528194, -1.276251, 1.473163, 1, 1, 1, 1, 1,
1.52884, 0.3211161, -0.5154633, 1, 1, 1, 1, 1,
1.565019, -1.021249, 3.136405, 1, 1, 1, 1, 1,
1.567299, 1.185071, -0.2913039, 1, 1, 1, 1, 1,
1.581423, 2.499637, 0.08631113, 1, 1, 1, 1, 1,
1.59104, -1.275375, 1.477247, 1, 1, 1, 1, 1,
1.599757, 0.550844, 3.162289, 1, 1, 1, 1, 1,
1.615623, 0.4418266, 1.63144, 0, 0, 1, 1, 1,
1.623737, 1.628327, 2.665711, 1, 0, 0, 1, 1,
1.625239, -0.552088, 1.794145, 1, 0, 0, 1, 1,
1.628414, 0.7712852, 1.48425, 1, 0, 0, 1, 1,
1.629493, 0.01348011, 1.392684, 1, 0, 0, 1, 1,
1.632162, -0.283538, 2.621214, 1, 0, 0, 1, 1,
1.63332, -0.6092592, 1.08707, 0, 0, 0, 1, 1,
1.647067, 0.004582951, 1.265949, 0, 0, 0, 1, 1,
1.649936, -1.248585, 2.62602, 0, 0, 0, 1, 1,
1.66471, -0.4851467, 2.819092, 0, 0, 0, 1, 1,
1.665005, -0.4487239, 0.5917087, 0, 0, 0, 1, 1,
1.678698, 0.3246244, 2.153184, 0, 0, 0, 1, 1,
1.694058, 1.20125, 1.253828, 0, 0, 0, 1, 1,
1.739602, -0.5543202, 0.4709317, 1, 1, 1, 1, 1,
1.76777, 0.6587435, 0.7881988, 1, 1, 1, 1, 1,
1.776017, -0.2600565, 3.351063, 1, 1, 1, 1, 1,
1.790671, 0.2302856, 3.10535, 1, 1, 1, 1, 1,
1.792687, 0.4677394, 2.246544, 1, 1, 1, 1, 1,
1.801148, 0.1042397, 0.508862, 1, 1, 1, 1, 1,
1.809012, -0.5191432, 2.055017, 1, 1, 1, 1, 1,
1.827347, -1.331118, 3.666991, 1, 1, 1, 1, 1,
1.834134, -1.285291, 0.3984324, 1, 1, 1, 1, 1,
1.836465, 0.9960255, 2.43479, 1, 1, 1, 1, 1,
1.877149, -1.447906, 3.126715, 1, 1, 1, 1, 1,
1.885746, -1.37961, 1.446072, 1, 1, 1, 1, 1,
1.89828, -0.7789918, 0.5496522, 1, 1, 1, 1, 1,
1.900366, -0.5553194, 2.604869, 1, 1, 1, 1, 1,
1.907481, 0.1592979, 0.4949241, 1, 1, 1, 1, 1,
1.91025, -0.3891976, 3.311272, 0, 0, 1, 1, 1,
1.914793, 0.09079052, 1.980064, 1, 0, 0, 1, 1,
1.917934, 0.5457003, 2.558047, 1, 0, 0, 1, 1,
1.925258, 1.648103, 1.679954, 1, 0, 0, 1, 1,
1.963655, 1.163548, 0.7890542, 1, 0, 0, 1, 1,
2.004916, 2.51515, -1.475855, 1, 0, 0, 1, 1,
2.059142, 0.4091907, -0.5878833, 0, 0, 0, 1, 1,
2.075244, -0.9533579, 2.589798, 0, 0, 0, 1, 1,
2.15742, 1.064469, 1.508891, 0, 0, 0, 1, 1,
2.172439, -0.926291, 2.771828, 0, 0, 0, 1, 1,
2.192209, 0.3498619, 2.963183, 0, 0, 0, 1, 1,
2.230131, -1.771744, 2.394854, 0, 0, 0, 1, 1,
2.264966, -1.695638, 2.731271, 0, 0, 0, 1, 1,
2.537801, -0.6837006, 2.480566, 1, 1, 1, 1, 1,
2.541592, -1.323372, 0.7207627, 1, 1, 1, 1, 1,
2.638733, 0.7660535, 1.193142, 1, 1, 1, 1, 1,
2.657573, 1.559566, 0.5092995, 1, 1, 1, 1, 1,
2.788713, -1.316774, 2.316066, 1, 1, 1, 1, 1,
2.918298, 1.192921, 1.792599, 1, 1, 1, 1, 1,
3.010424, 0.6393784, 2.771707, 1, 1, 1, 1, 1
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
var radius = 9.750284;
var distance = 34.24746;
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
mvMatrix.translate( 0.1894569, -0.3006423, -0.1543307 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.24746);
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
