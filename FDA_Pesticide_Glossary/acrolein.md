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
-2.768042, 0.133087, -0.7617431, 1, 0, 0, 1,
-2.640303, 1.083078, -1.639762, 1, 0.007843138, 0, 1,
-2.559144, 1.187963, -0.6956354, 1, 0.01176471, 0, 1,
-2.362179, 1.021316, -0.8098614, 1, 0.01960784, 0, 1,
-2.332087, 0.0285617, -1.217371, 1, 0.02352941, 0, 1,
-2.256612, 1.241028, -1.597671, 1, 0.03137255, 0, 1,
-2.247978, -1.135985, -2.642157, 1, 0.03529412, 0, 1,
-2.232734, -0.6765212, -1.865477, 1, 0.04313726, 0, 1,
-2.226616, -1.338271, -2.799985, 1, 0.04705882, 0, 1,
-2.214222, -1.164404, -1.705409, 1, 0.05490196, 0, 1,
-2.208944, -2.281858, -2.903094, 1, 0.05882353, 0, 1,
-2.202632, 1.116615, -1.684604, 1, 0.06666667, 0, 1,
-2.17838, -0.7091687, -0.33032, 1, 0.07058824, 0, 1,
-2.170057, 2.048293, -2.327777, 1, 0.07843138, 0, 1,
-2.149237, -0.3530633, -2.819326, 1, 0.08235294, 0, 1,
-2.141097, -0.4235701, -0.2436003, 1, 0.09019608, 0, 1,
-2.135114, 0.9024764, -2.006879, 1, 0.09411765, 0, 1,
-2.127784, -1.952191, -1.056632, 1, 0.1019608, 0, 1,
-2.126686, 0.7939015, -0.6063062, 1, 0.1098039, 0, 1,
-2.113792, -0.7516865, -0.8680593, 1, 0.1137255, 0, 1,
-2.089753, -0.01816618, -1.629593, 1, 0.1215686, 0, 1,
-2.052983, 0.02515221, -2.536882, 1, 0.1254902, 0, 1,
-2.031948, 0.3310251, 0.3234165, 1, 0.1333333, 0, 1,
-1.996731, -1.291156, -0.8892017, 1, 0.1372549, 0, 1,
-1.962188, 0.6251014, -1.456329, 1, 0.145098, 0, 1,
-1.961447, -1.860531, -4.379599, 1, 0.1490196, 0, 1,
-1.937995, -1.391821, -2.488294, 1, 0.1568628, 0, 1,
-1.933772, 0.7983192, 0.4679843, 1, 0.1607843, 0, 1,
-1.928589, -1.469393, -2.000169, 1, 0.1686275, 0, 1,
-1.925149, -1.137364, -0.9399985, 1, 0.172549, 0, 1,
-1.923325, 2.531791, -1.721328, 1, 0.1803922, 0, 1,
-1.879945, 0.6297928, -1.666936, 1, 0.1843137, 0, 1,
-1.872125, 0.4821453, -0.9230984, 1, 0.1921569, 0, 1,
-1.865088, 0.09219725, -1.579423, 1, 0.1960784, 0, 1,
-1.855664, 0.6123623, -1.957844, 1, 0.2039216, 0, 1,
-1.853893, -0.8512562, -0.9161241, 1, 0.2117647, 0, 1,
-1.841631, -1.105051, -3.111607, 1, 0.2156863, 0, 1,
-1.827666, -0.7319822, -1.626916, 1, 0.2235294, 0, 1,
-1.819616, -1.685281, -3.608001, 1, 0.227451, 0, 1,
-1.815805, -0.8205081, -2.038088, 1, 0.2352941, 0, 1,
-1.795198, -0.4521365, -2.813178, 1, 0.2392157, 0, 1,
-1.790195, 0.6563205, -0.5655553, 1, 0.2470588, 0, 1,
-1.785027, 0.2828153, -2.113337, 1, 0.2509804, 0, 1,
-1.77758, 0.1938699, -0.09430325, 1, 0.2588235, 0, 1,
-1.775069, -1.896729, -1.409004, 1, 0.2627451, 0, 1,
-1.771197, 0.9157987, -0.6374553, 1, 0.2705882, 0, 1,
-1.739199, -0.9134811, -3.132353, 1, 0.2745098, 0, 1,
-1.723642, -0.0245984, -2.082659, 1, 0.282353, 0, 1,
-1.720324, 1.414949, -0.6714375, 1, 0.2862745, 0, 1,
-1.691446, 0.1855942, -1.241494, 1, 0.2941177, 0, 1,
-1.679862, -0.7281207, -1.835721, 1, 0.3019608, 0, 1,
-1.678081, 1.767283, -2.009524, 1, 0.3058824, 0, 1,
-1.665426, 0.8274434, 0.03426671, 1, 0.3137255, 0, 1,
-1.656234, 1.489233, -0.01476987, 1, 0.3176471, 0, 1,
-1.650003, -1.564748, -3.134223, 1, 0.3254902, 0, 1,
-1.623403, -2.140829, -2.022145, 1, 0.3294118, 0, 1,
-1.623381, -0.6585112, -0.7116747, 1, 0.3372549, 0, 1,
-1.617946, -0.3001712, -0.6749974, 1, 0.3411765, 0, 1,
-1.607602, 0.8608361, 0.1085001, 1, 0.3490196, 0, 1,
-1.606178, 1.808593, 0.2042429, 1, 0.3529412, 0, 1,
-1.602433, -1.741526, -3.13528, 1, 0.3607843, 0, 1,
-1.590806, 0.1238309, -2.03371, 1, 0.3647059, 0, 1,
-1.582648, -0.3779324, -3.086242, 1, 0.372549, 0, 1,
-1.551211, 1.032129, -2.5434, 1, 0.3764706, 0, 1,
-1.544121, 0.7042271, -0.5790145, 1, 0.3843137, 0, 1,
-1.538844, -0.002392575, -0.6373594, 1, 0.3882353, 0, 1,
-1.532203, -0.9983532, -3.371892, 1, 0.3960784, 0, 1,
-1.531479, -0.9720469, -2.00147, 1, 0.4039216, 0, 1,
-1.527229, -0.8302789, -2.911921, 1, 0.4078431, 0, 1,
-1.520407, 0.5577692, -2.810422, 1, 0.4156863, 0, 1,
-1.516948, 1.240192, -1.205489, 1, 0.4196078, 0, 1,
-1.506325, -0.6285617, -2.294691, 1, 0.427451, 0, 1,
-1.505739, 0.710263, -1.111736, 1, 0.4313726, 0, 1,
-1.501127, -0.6022015, -0.8206592, 1, 0.4392157, 0, 1,
-1.498634, -0.5543411, -2.837308, 1, 0.4431373, 0, 1,
-1.490322, -0.4889565, -1.748174, 1, 0.4509804, 0, 1,
-1.478329, 0.232179, -0.5229856, 1, 0.454902, 0, 1,
-1.47714, 0.05077846, -2.755229, 1, 0.4627451, 0, 1,
-1.466402, 1.151278, -0.3396061, 1, 0.4666667, 0, 1,
-1.462863, 0.7238715, -0.8215346, 1, 0.4745098, 0, 1,
-1.455506, -0.03923618, -2.328477, 1, 0.4784314, 0, 1,
-1.454615, -0.3383653, -1.065327, 1, 0.4862745, 0, 1,
-1.454523, -0.3145458, -1.363049, 1, 0.4901961, 0, 1,
-1.448189, -0.6409464, -2.84865, 1, 0.4980392, 0, 1,
-1.448105, 2.200465, -0.1450993, 1, 0.5058824, 0, 1,
-1.443593, -1.891252, -1.993161, 1, 0.509804, 0, 1,
-1.44351, -2.143849, -2.636284, 1, 0.5176471, 0, 1,
-1.442558, -0.9692055, -1.288977, 1, 0.5215687, 0, 1,
-1.430413, -0.2012741, -1.993761, 1, 0.5294118, 0, 1,
-1.429546, 1.005359, -0.2532638, 1, 0.5333334, 0, 1,
-1.426116, -0.6787177, -1.615137, 1, 0.5411765, 0, 1,
-1.421914, 0.8216935, -1.100087, 1, 0.5450981, 0, 1,
-1.419234, 0.3761081, -0.8175191, 1, 0.5529412, 0, 1,
-1.397137, 0.08894761, -1.893011, 1, 0.5568628, 0, 1,
-1.388155, -0.1721685, -2.710693, 1, 0.5647059, 0, 1,
-1.370178, -1.499062, -3.173065, 1, 0.5686275, 0, 1,
-1.358588, -0.2006555, 0.1350083, 1, 0.5764706, 0, 1,
-1.350875, -1.544366, -2.276179, 1, 0.5803922, 0, 1,
-1.340953, -0.8407112, -1.310756, 1, 0.5882353, 0, 1,
-1.338706, -0.3922111, -0.9786636, 1, 0.5921569, 0, 1,
-1.33283, -0.2513809, -0.9858622, 1, 0.6, 0, 1,
-1.319282, 1.159658, -2.087895, 1, 0.6078432, 0, 1,
-1.318241, 1.250432, -0.9493126, 1, 0.6117647, 0, 1,
-1.31715, -1.799438, -3.61315, 1, 0.6196079, 0, 1,
-1.300529, 0.1086868, -0.2493125, 1, 0.6235294, 0, 1,
-1.300326, -1.482169, -1.858442, 1, 0.6313726, 0, 1,
-1.297448, -1.142518, -2.655888, 1, 0.6352941, 0, 1,
-1.297434, 0.2442992, -0.6230353, 1, 0.6431373, 0, 1,
-1.295081, 2.165304, -0.5846006, 1, 0.6470588, 0, 1,
-1.256003, 1.44475, 0.4629692, 1, 0.654902, 0, 1,
-1.254621, 0.407375, -0.4203924, 1, 0.6588235, 0, 1,
-1.24948, -0.5020142, -1.84982, 1, 0.6666667, 0, 1,
-1.246569, -0.03386576, -2.653979, 1, 0.6705883, 0, 1,
-1.244927, 1.227554, -0.7708972, 1, 0.6784314, 0, 1,
-1.222306, 0.7466254, -1.967493, 1, 0.682353, 0, 1,
-1.205231, 0.8311875, -1.911662, 1, 0.6901961, 0, 1,
-1.2042, -0.6134071, -1.83437, 1, 0.6941177, 0, 1,
-1.19664, 0.6434826, -0.7063293, 1, 0.7019608, 0, 1,
-1.1953, 0.7343836, -1.941841, 1, 0.7098039, 0, 1,
-1.19032, -0.9982507, -2.979482, 1, 0.7137255, 0, 1,
-1.18067, -0.755685, -2.790261, 1, 0.7215686, 0, 1,
-1.177703, 0.4165153, -1.993837, 1, 0.7254902, 0, 1,
-1.175249, -1.525659, -2.707782, 1, 0.7333333, 0, 1,
-1.17094, 0.5806446, -1.152242, 1, 0.7372549, 0, 1,
-1.167577, 0.2601561, -2.882463, 1, 0.7450981, 0, 1,
-1.166343, -1.695551, -3.388394, 1, 0.7490196, 0, 1,
-1.158287, 0.03618801, 0.8995517, 1, 0.7568628, 0, 1,
-1.158139, -0.8293241, -0.9560294, 1, 0.7607843, 0, 1,
-1.153525, -0.2878669, -2.443785, 1, 0.7686275, 0, 1,
-1.151994, -0.5196482, -1.371064, 1, 0.772549, 0, 1,
-1.150413, 0.7703625, -1.038115, 1, 0.7803922, 0, 1,
-1.146939, 1.861539, -0.8487542, 1, 0.7843137, 0, 1,
-1.128961, 0.2659003, -0.5776119, 1, 0.7921569, 0, 1,
-1.12811, 0.2711457, -2.684505, 1, 0.7960784, 0, 1,
-1.124319, 0.1486605, -2.359281, 1, 0.8039216, 0, 1,
-1.121418, 1.905898, -1.805041, 1, 0.8117647, 0, 1,
-1.118508, -1.6511, -1.978708, 1, 0.8156863, 0, 1,
-1.115004, -0.618821, -3.126596, 1, 0.8235294, 0, 1,
-1.11449, -0.5092771, 0.02743284, 1, 0.827451, 0, 1,
-1.111341, -1.270298, -0.5108275, 1, 0.8352941, 0, 1,
-1.10864, 2.230276, -0.519619, 1, 0.8392157, 0, 1,
-1.10508, -0.3347895, -1.839988, 1, 0.8470588, 0, 1,
-1.09938, -0.7147058, -3.091612, 1, 0.8509804, 0, 1,
-1.096896, 0.5260109, -0.5662746, 1, 0.8588235, 0, 1,
-1.089515, 1.135918, 0.1386443, 1, 0.8627451, 0, 1,
-1.089472, -0.3792665, -1.546162, 1, 0.8705882, 0, 1,
-1.087167, 0.7790939, -1.398721, 1, 0.8745098, 0, 1,
-1.080961, 0.8973706, 0.8910068, 1, 0.8823529, 0, 1,
-1.066323, 0.395934, -0.7989988, 1, 0.8862745, 0, 1,
-1.064331, 0.09094166, -1.461569, 1, 0.8941177, 0, 1,
-1.064053, 0.1223373, 1.73962, 1, 0.8980392, 0, 1,
-1.059857, 1.177721, -1.051933, 1, 0.9058824, 0, 1,
-1.052749, 0.0578803, -2.449981, 1, 0.9137255, 0, 1,
-1.046051, -0.9078761, -1.918451, 1, 0.9176471, 0, 1,
-1.041893, 0.9184601, -0.2185663, 1, 0.9254902, 0, 1,
-1.028176, 0.2566161, -0.7359911, 1, 0.9294118, 0, 1,
-1.023919, -1.20891, -2.530542, 1, 0.9372549, 0, 1,
-1.023868, -0.6972326, -1.940459, 1, 0.9411765, 0, 1,
-1.019466, -0.6036233, -1.664348, 1, 0.9490196, 0, 1,
-1.01885, 0.9957683, -0.262348, 1, 0.9529412, 0, 1,
-1.003702, -0.5107352, -3.501173, 1, 0.9607843, 0, 1,
-1.00097, 0.01712414, -2.462386, 1, 0.9647059, 0, 1,
-0.9922965, 2.197478, -1.358919, 1, 0.972549, 0, 1,
-0.9899738, -1.095196, -2.521505, 1, 0.9764706, 0, 1,
-0.9897163, 0.295991, -0.568357, 1, 0.9843137, 0, 1,
-0.9881025, 1.25475, -0.7654315, 1, 0.9882353, 0, 1,
-0.9872302, -1.293603, -3.119431, 1, 0.9960784, 0, 1,
-0.9861652, -0.356325, -1.762774, 0.9960784, 1, 0, 1,
-0.9848211, 0.8925537, 2.48548e-05, 0.9921569, 1, 0, 1,
-0.9821522, 1.411632, 0.07707385, 0.9843137, 1, 0, 1,
-0.9799174, -0.00788266, -1.44615, 0.9803922, 1, 0, 1,
-0.9778582, -0.8957867, -2.492311, 0.972549, 1, 0, 1,
-0.9757976, 2.214108, -0.7713166, 0.9686275, 1, 0, 1,
-0.9736027, 0.2370758, -2.524058, 0.9607843, 1, 0, 1,
-0.9708465, -1.513432, -1.162916, 0.9568627, 1, 0, 1,
-0.9701859, -0.3049426, -3.711795, 0.9490196, 1, 0, 1,
-0.969725, 0.5301975, -1.746061, 0.945098, 1, 0, 1,
-0.9685183, 0.9927371, -0.4863591, 0.9372549, 1, 0, 1,
-0.9564198, -0.3230542, -3.33751, 0.9333333, 1, 0, 1,
-0.9445136, -0.5917144, -2.774451, 0.9254902, 1, 0, 1,
-0.9432422, -0.5295815, -1.922277, 0.9215686, 1, 0, 1,
-0.9389695, -1.019472, -2.993961, 0.9137255, 1, 0, 1,
-0.9384518, -1.488959, -2.867432, 0.9098039, 1, 0, 1,
-0.9289243, 0.8569934, -0.9071254, 0.9019608, 1, 0, 1,
-0.9036211, 0.03783323, -1.480601, 0.8941177, 1, 0, 1,
-0.8943002, -1.31916, -1.903859, 0.8901961, 1, 0, 1,
-0.8942981, -0.2220652, -1.741122, 0.8823529, 1, 0, 1,
-0.8877526, 0.3959264, 0.1375658, 0.8784314, 1, 0, 1,
-0.8875535, 2.446497, 0.9027159, 0.8705882, 1, 0, 1,
-0.887531, -1.17207, -2.198258, 0.8666667, 1, 0, 1,
-0.8836694, 0.1528531, -2.551545, 0.8588235, 1, 0, 1,
-0.8768411, -1.455526, -2.226857, 0.854902, 1, 0, 1,
-0.8743498, 0.139466, -1.211715, 0.8470588, 1, 0, 1,
-0.8729212, -0.7769246, -3.547506, 0.8431373, 1, 0, 1,
-0.8725108, 0.1516861, -2.094933, 0.8352941, 1, 0, 1,
-0.8604335, -0.7181346, -2.453901, 0.8313726, 1, 0, 1,
-0.8595443, -0.3354036, -2.156952, 0.8235294, 1, 0, 1,
-0.8526211, 0.1341851, -2.938983, 0.8196079, 1, 0, 1,
-0.8474781, -0.2056746, -0.8840989, 0.8117647, 1, 0, 1,
-0.8392568, -0.6308113, -2.865551, 0.8078431, 1, 0, 1,
-0.8386148, -0.004314293, -0.6999209, 0.8, 1, 0, 1,
-0.8379649, 0.1234916, -0.8929299, 0.7921569, 1, 0, 1,
-0.8309962, -1.578446, -2.188214, 0.7882353, 1, 0, 1,
-0.8287992, 0.05306138, -2.187119, 0.7803922, 1, 0, 1,
-0.8224947, 0.9357321, -0.667821, 0.7764706, 1, 0, 1,
-0.8220061, 1.11294, -1.615406, 0.7686275, 1, 0, 1,
-0.821237, 0.7054939, -1.103366, 0.7647059, 1, 0, 1,
-0.8188908, 0.3415635, 0.3858645, 0.7568628, 1, 0, 1,
-0.8156258, 0.08886324, -0.5229167, 0.7529412, 1, 0, 1,
-0.811879, -1.740776, -3.330369, 0.7450981, 1, 0, 1,
-0.8109601, 1.445417, -1.285117, 0.7411765, 1, 0, 1,
-0.8080149, 0.3466331, -1.647727, 0.7333333, 1, 0, 1,
-0.8033848, -1.029467, -1.69499, 0.7294118, 1, 0, 1,
-0.802519, -1.28033, -1.882192, 0.7215686, 1, 0, 1,
-0.8004993, -1.548415, -4.547068, 0.7176471, 1, 0, 1,
-0.7996783, 1.057497, 0.2515367, 0.7098039, 1, 0, 1,
-0.7976997, 0.7655995, -0.2955768, 0.7058824, 1, 0, 1,
-0.7973674, 0.1081524, -2.001242, 0.6980392, 1, 0, 1,
-0.7920214, 0.2312276, -1.553533, 0.6901961, 1, 0, 1,
-0.7876699, -0.2331355, -1.259215, 0.6862745, 1, 0, 1,
-0.7828867, 0.4046733, -1.953681, 0.6784314, 1, 0, 1,
-0.7691732, 0.9123642, -0.03066652, 0.6745098, 1, 0, 1,
-0.7678531, -0.8352628, -1.647695, 0.6666667, 1, 0, 1,
-0.7677155, -0.3981035, -2.925005, 0.6627451, 1, 0, 1,
-0.7637398, 1.42328, -0.3899436, 0.654902, 1, 0, 1,
-0.7431029, 0.2753004, -2.903072, 0.6509804, 1, 0, 1,
-0.7428839, -0.3356606, -4.273423, 0.6431373, 1, 0, 1,
-0.7398014, -0.5384337, -1.109848, 0.6392157, 1, 0, 1,
-0.7380383, -0.2471476, -2.216547, 0.6313726, 1, 0, 1,
-0.7357846, 1.22516, -0.3352924, 0.627451, 1, 0, 1,
-0.7356622, 2.016832, 0.1827824, 0.6196079, 1, 0, 1,
-0.734486, -0.5050826, -2.13369, 0.6156863, 1, 0, 1,
-0.7215589, 1.122335, -1.896257, 0.6078432, 1, 0, 1,
-0.7113284, 0.07199525, -3.229887, 0.6039216, 1, 0, 1,
-0.7108619, -0.4530853, -1.966213, 0.5960785, 1, 0, 1,
-0.7048635, 1.181809, 0.329106, 0.5882353, 1, 0, 1,
-0.7015374, 0.2010481, -0.01848234, 0.5843138, 1, 0, 1,
-0.6985162, 2.044554, -0.2117936, 0.5764706, 1, 0, 1,
-0.6964647, 0.2881161, -1.451463, 0.572549, 1, 0, 1,
-0.6921741, 0.5736115, -1.750395, 0.5647059, 1, 0, 1,
-0.6904156, -0.9875872, -2.832023, 0.5607843, 1, 0, 1,
-0.6852781, -0.459163, -1.947135, 0.5529412, 1, 0, 1,
-0.6828367, -0.5490915, -0.3140209, 0.5490196, 1, 0, 1,
-0.6815819, 0.8049041, -1.474505, 0.5411765, 1, 0, 1,
-0.6790646, -0.9726046, -1.805807, 0.5372549, 1, 0, 1,
-0.6773161, -1.546984, -3.260032, 0.5294118, 1, 0, 1,
-0.6765841, 0.7085376, 0.03454934, 0.5254902, 1, 0, 1,
-0.6728473, -1.661986, -1.432575, 0.5176471, 1, 0, 1,
-0.6710891, -0.7465916, -3.285315, 0.5137255, 1, 0, 1,
-0.6708145, -0.8344328, -2.249527, 0.5058824, 1, 0, 1,
-0.6700751, -1.70565, -3.281253, 0.5019608, 1, 0, 1,
-0.6651171, 0.7900267, -0.6179246, 0.4941176, 1, 0, 1,
-0.6637257, 0.1761769, -1.298248, 0.4862745, 1, 0, 1,
-0.6628519, 0.2965374, -0.6569107, 0.4823529, 1, 0, 1,
-0.661458, -0.2931601, -2.754066, 0.4745098, 1, 0, 1,
-0.6598519, 4.06473, 0.960676, 0.4705882, 1, 0, 1,
-0.6571288, 0.5849719, -1.008152, 0.4627451, 1, 0, 1,
-0.6509871, -0.1458841, -0.9148416, 0.4588235, 1, 0, 1,
-0.6471215, -0.9044319, -1.321086, 0.4509804, 1, 0, 1,
-0.645917, -1.163959, -2.932311, 0.4470588, 1, 0, 1,
-0.643448, -0.8834437, -4.758269, 0.4392157, 1, 0, 1,
-0.6420677, 0.5045205, 0.3969892, 0.4352941, 1, 0, 1,
-0.6404322, -0.5281634, -3.531812, 0.427451, 1, 0, 1,
-0.6350167, -0.6492031, -3.458548, 0.4235294, 1, 0, 1,
-0.6328824, -0.2275749, -0.7133998, 0.4156863, 1, 0, 1,
-0.6325865, 0.9518206, -0.7015644, 0.4117647, 1, 0, 1,
-0.6322163, -1.764348, -2.665775, 0.4039216, 1, 0, 1,
-0.6286922, 0.2553177, 1.039342, 0.3960784, 1, 0, 1,
-0.6225437, -1.234917, -2.382477, 0.3921569, 1, 0, 1,
-0.6209339, -0.3172371, -3.779111, 0.3843137, 1, 0, 1,
-0.6208679, 0.1644905, -2.43062, 0.3803922, 1, 0, 1,
-0.6208078, 0.5054795, -0.8984711, 0.372549, 1, 0, 1,
-0.6203718, -0.2585073, -0.1726513, 0.3686275, 1, 0, 1,
-0.6125782, -1.747159, -2.890079, 0.3607843, 1, 0, 1,
-0.6120571, -0.1043968, -1.775271, 0.3568628, 1, 0, 1,
-0.6071855, -0.8450221, -2.508435, 0.3490196, 1, 0, 1,
-0.6070384, 0.2694804, -1.677371, 0.345098, 1, 0, 1,
-0.6051464, -1.878893, -1.912416, 0.3372549, 1, 0, 1,
-0.6048986, 0.3111833, -2.570103, 0.3333333, 1, 0, 1,
-0.6029135, -1.853794, -1.937113, 0.3254902, 1, 0, 1,
-0.5999476, -0.7010015, -1.872051, 0.3215686, 1, 0, 1,
-0.594482, 1.905971, -1.485668, 0.3137255, 1, 0, 1,
-0.5939893, 0.211328, -1.543679, 0.3098039, 1, 0, 1,
-0.5929429, 1.410639, 1.173123, 0.3019608, 1, 0, 1,
-0.5807598, 1.241694, -1.378118, 0.2941177, 1, 0, 1,
-0.579051, -0.01702289, -1.886427, 0.2901961, 1, 0, 1,
-0.5789474, -0.9382993, -1.769513, 0.282353, 1, 0, 1,
-0.5785078, -1.571037, -2.707372, 0.2784314, 1, 0, 1,
-0.5767803, 1.318924, -0.8348601, 0.2705882, 1, 0, 1,
-0.5741923, 0.5666832, -1.970628, 0.2666667, 1, 0, 1,
-0.5684524, -0.7191187, -2.141277, 0.2588235, 1, 0, 1,
-0.5681925, -0.1735986, -0.1256163, 0.254902, 1, 0, 1,
-0.5675622, 0.5500647, -1.809238, 0.2470588, 1, 0, 1,
-0.564145, -1.278245, -3.486605, 0.2431373, 1, 0, 1,
-0.5639709, -0.1118724, -3.321697, 0.2352941, 1, 0, 1,
-0.5635884, 0.8108214, -1.715241, 0.2313726, 1, 0, 1,
-0.5591789, 0.1342549, -0.3615802, 0.2235294, 1, 0, 1,
-0.5590128, 0.4351433, -0.8494933, 0.2196078, 1, 0, 1,
-0.5565132, -0.05919472, -3.265802, 0.2117647, 1, 0, 1,
-0.5552018, -1.12587, -2.23345, 0.2078431, 1, 0, 1,
-0.5530161, -0.306187, -0.3551663, 0.2, 1, 0, 1,
-0.5496404, -0.9030857, -1.758966, 0.1921569, 1, 0, 1,
-0.5437645, 0.6498714, -0.3808294, 0.1882353, 1, 0, 1,
-0.5433489, -0.7888884, -2.410858, 0.1803922, 1, 0, 1,
-0.5393311, -0.5139872, -3.130874, 0.1764706, 1, 0, 1,
-0.5386919, 1.546312, 1.179852, 0.1686275, 1, 0, 1,
-0.5385834, 0.2041049, -1.344471, 0.1647059, 1, 0, 1,
-0.5342075, 1.723604, 0.7753524, 0.1568628, 1, 0, 1,
-0.5317013, -0.9180393, -1.734971, 0.1529412, 1, 0, 1,
-0.5305584, -1.175326, -3.991914, 0.145098, 1, 0, 1,
-0.5284674, 0.8241664, -1.86167, 0.1411765, 1, 0, 1,
-0.5284184, 0.2925632, -2.303863, 0.1333333, 1, 0, 1,
-0.5268269, -0.2681406, -1.594769, 0.1294118, 1, 0, 1,
-0.5236434, -0.9982969, -1.684883, 0.1215686, 1, 0, 1,
-0.5182747, -0.1195034, -1.176336, 0.1176471, 1, 0, 1,
-0.5173011, 0.01718383, 0.4476352, 0.1098039, 1, 0, 1,
-0.5131572, -0.9560725, -2.284758, 0.1058824, 1, 0, 1,
-0.5091873, -0.460612, -1.988007, 0.09803922, 1, 0, 1,
-0.5088934, -0.1784235, -3.127843, 0.09019608, 1, 0, 1,
-0.5085807, -0.2687666, -0.570188, 0.08627451, 1, 0, 1,
-0.5065663, -0.1379917, -1.186773, 0.07843138, 1, 0, 1,
-0.5060685, -1.493724, -1.374299, 0.07450981, 1, 0, 1,
-0.4991789, 0.587854, -0.577589, 0.06666667, 1, 0, 1,
-0.4988202, 1.965589, -0.48167, 0.0627451, 1, 0, 1,
-0.4944714, -0.7862403, -3.115678, 0.05490196, 1, 0, 1,
-0.4935922, -1.774172, -3.014776, 0.05098039, 1, 0, 1,
-0.4932721, -0.7162396, -1.377477, 0.04313726, 1, 0, 1,
-0.4920518, 0.3642094, 0.4675669, 0.03921569, 1, 0, 1,
-0.4878048, -0.3377572, -1.820625, 0.03137255, 1, 0, 1,
-0.4867139, -1.794585, -1.344439, 0.02745098, 1, 0, 1,
-0.4828393, 0.3330447, 0.163148, 0.01960784, 1, 0, 1,
-0.4785078, 0.04530242, -2.087287, 0.01568628, 1, 0, 1,
-0.47654, -0.1843372, -1.558646, 0.007843138, 1, 0, 1,
-0.4722321, 1.097261, -2.011573, 0.003921569, 1, 0, 1,
-0.4688773, -1.61886, -2.288904, 0, 1, 0.003921569, 1,
-0.4614096, 0.4452005, -0.9710042, 0, 1, 0.01176471, 1,
-0.4584877, 0.6128969, -1.886046, 0, 1, 0.01568628, 1,
-0.4570505, 1.512796, -0.6856421, 0, 1, 0.02352941, 1,
-0.4564142, -1.361277, -3.002407, 0, 1, 0.02745098, 1,
-0.4554188, 0.1612364, -2.2339, 0, 1, 0.03529412, 1,
-0.4541905, -1.623205, -3.349099, 0, 1, 0.03921569, 1,
-0.4496539, -0.4502323, -2.829188, 0, 1, 0.04705882, 1,
-0.4488003, -0.521982, -4.913175, 0, 1, 0.05098039, 1,
-0.4410938, 1.445022, -2.045167, 0, 1, 0.05882353, 1,
-0.4404977, 1.531129, -0.8106167, 0, 1, 0.0627451, 1,
-0.440346, -0.6211853, -3.781873, 0, 1, 0.07058824, 1,
-0.4385675, 0.8744463, -0.3810433, 0, 1, 0.07450981, 1,
-0.4356432, 0.5668216, -0.1843641, 0, 1, 0.08235294, 1,
-0.4347975, 0.8130432, -0.6605219, 0, 1, 0.08627451, 1,
-0.4329502, 0.3459969, 0.9170711, 0, 1, 0.09411765, 1,
-0.4309278, -1.833444, -2.566321, 0, 1, 0.1019608, 1,
-0.4305018, -0.2467602, -2.936355, 0, 1, 0.1058824, 1,
-0.4300894, -0.556821, -4.510193, 0, 1, 0.1137255, 1,
-0.4288446, 0.3767194, -0.1463565, 0, 1, 0.1176471, 1,
-0.4273689, 0.08022466, 0.949623, 0, 1, 0.1254902, 1,
-0.4265956, -2.136447, -2.560744, 0, 1, 0.1294118, 1,
-0.4240498, 1.490964, -0.2420251, 0, 1, 0.1372549, 1,
-0.4209615, 0.7535828, -0.6837845, 0, 1, 0.1411765, 1,
-0.4207641, -0.01566534, -0.7092968, 0, 1, 0.1490196, 1,
-0.4205305, -0.4924647, -1.997726, 0, 1, 0.1529412, 1,
-0.4198048, -0.1914988, -2.625909, 0, 1, 0.1607843, 1,
-0.4187897, -1.238788, -3.055626, 0, 1, 0.1647059, 1,
-0.4170888, -0.6299374, -1.128453, 0, 1, 0.172549, 1,
-0.4164457, -0.5020902, -2.397918, 0, 1, 0.1764706, 1,
-0.4107271, 0.06201428, -0.4959033, 0, 1, 0.1843137, 1,
-0.408988, -1.175838, -3.281741, 0, 1, 0.1882353, 1,
-0.4067985, 0.966368, -0.8452691, 0, 1, 0.1960784, 1,
-0.4060319, -1.079674, -2.077348, 0, 1, 0.2039216, 1,
-0.4044843, 1.108693, 1.700974, 0, 1, 0.2078431, 1,
-0.4012299, 0.9656648, -0.1535289, 0, 1, 0.2156863, 1,
-0.3988531, 0.2886502, -1.10294, 0, 1, 0.2196078, 1,
-0.3951628, 0.1039668, -2.270871, 0, 1, 0.227451, 1,
-0.3951021, 1.986393, -0.7433698, 0, 1, 0.2313726, 1,
-0.3932866, 1.001746, -1.79817, 0, 1, 0.2392157, 1,
-0.3917634, 1.081212, -1.618023, 0, 1, 0.2431373, 1,
-0.3860791, 1.777768, 0.3885483, 0, 1, 0.2509804, 1,
-0.3854787, 0.3421261, -0.8505351, 0, 1, 0.254902, 1,
-0.377923, 0.2825103, -0.602365, 0, 1, 0.2627451, 1,
-0.3671088, 2.033963, 0.5918277, 0, 1, 0.2666667, 1,
-0.3551486, 1.731997, 1.358953, 0, 1, 0.2745098, 1,
-0.3537508, 0.5655732, -1.40246, 0, 1, 0.2784314, 1,
-0.3526088, -1.526901, -2.976913, 0, 1, 0.2862745, 1,
-0.3442777, 1.176989, -0.2067952, 0, 1, 0.2901961, 1,
-0.342407, -0.4259864, -2.970195, 0, 1, 0.2980392, 1,
-0.3414709, -0.7314173, -3.565832, 0, 1, 0.3058824, 1,
-0.3390324, -0.8897648, -4.403888, 0, 1, 0.3098039, 1,
-0.3350069, -0.2365608, -3.790977, 0, 1, 0.3176471, 1,
-0.3340135, 1.454825, -1.787818, 0, 1, 0.3215686, 1,
-0.3294016, -0.7581573, -1.884398, 0, 1, 0.3294118, 1,
-0.3229876, 0.8936306, -0.01928953, 0, 1, 0.3333333, 1,
-0.3219404, -0.1357832, -1.051236, 0, 1, 0.3411765, 1,
-0.3199568, -0.7214524, -4.315646, 0, 1, 0.345098, 1,
-0.3123146, 0.1386453, -2.576087, 0, 1, 0.3529412, 1,
-0.3091371, 0.5593598, -1.269663, 0, 1, 0.3568628, 1,
-0.3090836, -2.278344, -3.315868, 0, 1, 0.3647059, 1,
-0.3008842, 0.2261645, -1.506953, 0, 1, 0.3686275, 1,
-0.2953421, 0.66684, 0.2090434, 0, 1, 0.3764706, 1,
-0.2952455, 1.590716, 0.07931537, 0, 1, 0.3803922, 1,
-0.2912373, 0.3126281, -0.8636536, 0, 1, 0.3882353, 1,
-0.2866563, -1.399572, -3.687757, 0, 1, 0.3921569, 1,
-0.285787, -0.800795, -1.860806, 0, 1, 0.4, 1,
-0.2850111, 0.4503411, -0.9536709, 0, 1, 0.4078431, 1,
-0.2811057, -0.3096437, -0.5738095, 0, 1, 0.4117647, 1,
-0.2806368, -0.09563955, -1.824706, 0, 1, 0.4196078, 1,
-0.2750355, -0.7351916, -2.601542, 0, 1, 0.4235294, 1,
-0.2731673, -0.5011756, -3.019451, 0, 1, 0.4313726, 1,
-0.2713414, 0.4114007, -0.6420102, 0, 1, 0.4352941, 1,
-0.2692592, -0.6696399, -1.969887, 0, 1, 0.4431373, 1,
-0.2681217, -0.03982686, -1.812945, 0, 1, 0.4470588, 1,
-0.2680607, -0.9363455, -2.658874, 0, 1, 0.454902, 1,
-0.2679954, -0.7744123, -3.931869, 0, 1, 0.4588235, 1,
-0.2654808, 0.1383138, 1.466222, 0, 1, 0.4666667, 1,
-0.262317, 1.503099, -0.5204601, 0, 1, 0.4705882, 1,
-0.2622473, 1.057299, -1.747693, 0, 1, 0.4784314, 1,
-0.2617426, -1.272077, -4.15237, 0, 1, 0.4823529, 1,
-0.2611358, -0.3113539, -1.196962, 0, 1, 0.4901961, 1,
-0.2586036, -1.093927, -2.275288, 0, 1, 0.4941176, 1,
-0.2584254, 0.01973244, -2.248992, 0, 1, 0.5019608, 1,
-0.2561136, 0.7953343, 1.142108, 0, 1, 0.509804, 1,
-0.2551286, 0.5586975, -0.5379834, 0, 1, 0.5137255, 1,
-0.2486361, 0.5738075, -1.054741, 0, 1, 0.5215687, 1,
-0.2480613, -0.767413, -1.849626, 0, 1, 0.5254902, 1,
-0.2452135, 1.698051, -0.3309663, 0, 1, 0.5333334, 1,
-0.2447525, -0.9889989, -4.269077, 0, 1, 0.5372549, 1,
-0.2418756, 1.021561, -1.852921, 0, 1, 0.5450981, 1,
-0.2390534, -0.192166, -1.740306, 0, 1, 0.5490196, 1,
-0.2347454, 0.4454765, -0.7383499, 0, 1, 0.5568628, 1,
-0.2322864, 0.7907195, 0.1969474, 0, 1, 0.5607843, 1,
-0.2320019, 0.5173612, -0.7966188, 0, 1, 0.5686275, 1,
-0.2182252, 0.9132805, 0.5961472, 0, 1, 0.572549, 1,
-0.2165386, 0.3417007, -0.9774469, 0, 1, 0.5803922, 1,
-0.2155563, 2.071246, -0.3806648, 0, 1, 0.5843138, 1,
-0.2140256, -0.4430155, -2.987777, 0, 1, 0.5921569, 1,
-0.2126824, -0.03024406, -1.802684, 0, 1, 0.5960785, 1,
-0.2113002, -2.070009, -2.1341, 0, 1, 0.6039216, 1,
-0.2107823, -1.737782, -3.41016, 0, 1, 0.6117647, 1,
-0.2106576, 1.028486, -0.4229633, 0, 1, 0.6156863, 1,
-0.2073505, 0.6639791, 0.9938285, 0, 1, 0.6235294, 1,
-0.2045081, 0.627862, 1.576484, 0, 1, 0.627451, 1,
-0.2035077, 2.158276, -0.1042584, 0, 1, 0.6352941, 1,
-0.2024784, 1.732328, 0.158808, 0, 1, 0.6392157, 1,
-0.2006101, 0.3509625, -2.08425, 0, 1, 0.6470588, 1,
-0.1955271, 0.7239016, -0.7223145, 0, 1, 0.6509804, 1,
-0.1929791, 0.7053993, -1.331748, 0, 1, 0.6588235, 1,
-0.1913453, 0.2777581, 1.204014, 0, 1, 0.6627451, 1,
-0.1887398, -1.682069, -2.819661, 0, 1, 0.6705883, 1,
-0.1873606, -0.3171198, -0.4998489, 0, 1, 0.6745098, 1,
-0.1632069, -1.866945, -3.351102, 0, 1, 0.682353, 1,
-0.1631745, 0.0651628, 0.199193, 0, 1, 0.6862745, 1,
-0.1620303, -1.380307, -3.557494, 0, 1, 0.6941177, 1,
-0.1606354, 0.5339439, -0.7796798, 0, 1, 0.7019608, 1,
-0.1587938, 0.4610079, -1.369575, 0, 1, 0.7058824, 1,
-0.1536607, 0.005023659, 0.2048207, 0, 1, 0.7137255, 1,
-0.1516684, -0.9734426, -3.642418, 0, 1, 0.7176471, 1,
-0.1498391, -1.68204, -1.501981, 0, 1, 0.7254902, 1,
-0.1423206, 2.327938, -0.9250411, 0, 1, 0.7294118, 1,
-0.1355648, -1.733213, -3.776985, 0, 1, 0.7372549, 1,
-0.1337791, -0.767776, -3.496237, 0, 1, 0.7411765, 1,
-0.1337514, 1.346462, 0.3177926, 0, 1, 0.7490196, 1,
-0.1334281, -0.8905486, -2.555768, 0, 1, 0.7529412, 1,
-0.1325259, 0.9392231, 0.8109279, 0, 1, 0.7607843, 1,
-0.1306909, 0.2983565, 1.348037, 0, 1, 0.7647059, 1,
-0.123859, 0.4966138, -1.514134, 0, 1, 0.772549, 1,
-0.120925, 0.9423304, -0.7341802, 0, 1, 0.7764706, 1,
-0.1207197, -1.24331, -3.857097, 0, 1, 0.7843137, 1,
-0.1202564, 0.5673134, 2.102839, 0, 1, 0.7882353, 1,
-0.115551, -0.9322026, -2.580643, 0, 1, 0.7960784, 1,
-0.1091648, 0.4451088, -0.644887, 0, 1, 0.8039216, 1,
-0.1067684, -0.4961931, -3.3211, 0, 1, 0.8078431, 1,
-0.1060066, -0.9260321, -1.450625, 0, 1, 0.8156863, 1,
-0.105217, -0.6961163, -1.223356, 0, 1, 0.8196079, 1,
-0.1035475, 0.9804822, -0.6415654, 0, 1, 0.827451, 1,
-0.09058129, -1.041423, -3.284732, 0, 1, 0.8313726, 1,
-0.08411077, 0.5374508, 0.1991031, 0, 1, 0.8392157, 1,
-0.08401379, -0.03921898, -3.182909, 0, 1, 0.8431373, 1,
-0.07857942, -0.8317838, -2.079642, 0, 1, 0.8509804, 1,
-0.07747587, 0.07550334, -1.828125, 0, 1, 0.854902, 1,
-0.07374067, 0.2726272, 0.1524126, 0, 1, 0.8627451, 1,
-0.0713953, 1.206751, 0.3300597, 0, 1, 0.8666667, 1,
-0.07085959, 0.7610089, -0.6301075, 0, 1, 0.8745098, 1,
-0.06492174, 1.101387, -0.7495729, 0, 1, 0.8784314, 1,
-0.05372396, -0.4844183, -4.172966, 0, 1, 0.8862745, 1,
-0.05295038, -1.493587, -2.605016, 0, 1, 0.8901961, 1,
-0.04551781, -1.841607, -3.528114, 0, 1, 0.8980392, 1,
-0.04512217, 0.4552915, -0.7040797, 0, 1, 0.9058824, 1,
-0.0418594, 0.7453637, -2.063456, 0, 1, 0.9098039, 1,
-0.04177838, 0.4565061, -1.451818, 0, 1, 0.9176471, 1,
-0.04044287, -1.315319, -2.583434, 0, 1, 0.9215686, 1,
-0.03950447, 0.2231023, -0.2945966, 0, 1, 0.9294118, 1,
-0.03736253, 0.7642635, 0.03801261, 0, 1, 0.9333333, 1,
-0.03677433, -0.8177302, -1.763661, 0, 1, 0.9411765, 1,
-0.03119012, -0.1931891, -3.48925, 0, 1, 0.945098, 1,
-0.03057988, -0.1918491, -2.645464, 0, 1, 0.9529412, 1,
-0.03023844, 1.108844, -0.6383798, 0, 1, 0.9568627, 1,
-0.02843107, -1.688746, -2.109327, 0, 1, 0.9647059, 1,
-0.02104509, 0.6715513, -0.03920525, 0, 1, 0.9686275, 1,
-0.01909542, -0.3269297, -4.676162, 0, 1, 0.9764706, 1,
-0.01374603, 0.9049289, -0.2340919, 0, 1, 0.9803922, 1,
-0.01110273, 0.5462822, -0.1474057, 0, 1, 0.9882353, 1,
-0.009238782, 1.123158, -0.313133, 0, 1, 0.9921569, 1,
-0.008632594, -0.4602617, -3.49694, 0, 1, 1, 1,
-0.006886032, -1.496183, -3.223642, 0, 0.9921569, 1, 1,
-0.004716222, -0.6918192, -1.084925, 0, 0.9882353, 1, 1,
-0.004126973, -0.3909095, -4.638189, 0, 0.9803922, 1, 1,
-0.00346139, 0.4262474, -0.6389568, 0, 0.9764706, 1, 1,
-0.001653534, 0.5415365, 0.3445031, 0, 0.9686275, 1, 1,
0.0003484427, 0.6424749, -0.5494337, 0, 0.9647059, 1, 1,
0.002741811, 0.7911932, 0.4656385, 0, 0.9568627, 1, 1,
0.003000941, 1.7873, -0.4706623, 0, 0.9529412, 1, 1,
0.003720941, 1.111624, 0.5930514, 0, 0.945098, 1, 1,
0.01040298, 2.178412, -0.3818878, 0, 0.9411765, 1, 1,
0.01190272, 0.756817, -0.1441638, 0, 0.9333333, 1, 1,
0.01205966, 2.105196, 1.297976, 0, 0.9294118, 1, 1,
0.01223384, 0.6712424, 0.7775103, 0, 0.9215686, 1, 1,
0.01259922, 1.172362, 1.041038, 0, 0.9176471, 1, 1,
0.01545568, 1.586139, -1.186613, 0, 0.9098039, 1, 1,
0.01568049, -1.120414, 3.500012, 0, 0.9058824, 1, 1,
0.01665153, 0.6469347, 1.464294, 0, 0.8980392, 1, 1,
0.01966304, 1.225063, -0.7730113, 0, 0.8901961, 1, 1,
0.02268451, -2.002829, 2.31147, 0, 0.8862745, 1, 1,
0.02381864, -0.07835831, 4.206014, 0, 0.8784314, 1, 1,
0.02459013, 0.1057029, -0.1584928, 0, 0.8745098, 1, 1,
0.02599259, 0.2758943, -0.3159753, 0, 0.8666667, 1, 1,
0.02934317, 2.242884, 0.3213226, 0, 0.8627451, 1, 1,
0.02936548, 0.8223644, -0.1132118, 0, 0.854902, 1, 1,
0.02954765, 0.93405, -1.067698, 0, 0.8509804, 1, 1,
0.02989146, -1.425509, 3.937083, 0, 0.8431373, 1, 1,
0.03130873, 0.3395565, -0.1527656, 0, 0.8392157, 1, 1,
0.03170586, 0.2377038, 0.4872576, 0, 0.8313726, 1, 1,
0.03243152, -0.2495397, 3.442265, 0, 0.827451, 1, 1,
0.0328012, 0.2493165, -0.3807819, 0, 0.8196079, 1, 1,
0.03390953, -0.5413686, 3.320539, 0, 0.8156863, 1, 1,
0.03761702, -0.4305373, 1.624485, 0, 0.8078431, 1, 1,
0.0426359, 0.1040605, 0.4126015, 0, 0.8039216, 1, 1,
0.0452165, -2.588577, 2.643899, 0, 0.7960784, 1, 1,
0.0456191, -1.643527, 3.484553, 0, 0.7882353, 1, 1,
0.0531312, -3.109594, 4.244804, 0, 0.7843137, 1, 1,
0.05346331, 0.7504661, 1.07855, 0, 0.7764706, 1, 1,
0.05347955, 0.2600065, 1.282337, 0, 0.772549, 1, 1,
0.07104936, 0.7792658, 0.2003816, 0, 0.7647059, 1, 1,
0.07530867, -1.629331, 3.252103, 0, 0.7607843, 1, 1,
0.07592227, -0.5395154, 2.866525, 0, 0.7529412, 1, 1,
0.07703844, 0.126644, 3.270629, 0, 0.7490196, 1, 1,
0.07940063, -1.261128, 3.444205, 0, 0.7411765, 1, 1,
0.07954072, 0.7324032, 2.504678, 0, 0.7372549, 1, 1,
0.07995832, 0.9106559, -1.25251, 0, 0.7294118, 1, 1,
0.0818677, 0.9179877, -1.182526, 0, 0.7254902, 1, 1,
0.08283807, 1.309405, 0.2247219, 0, 0.7176471, 1, 1,
0.08890613, -1.136359, 3.69462, 0, 0.7137255, 1, 1,
0.08919427, 0.661531, -0.658575, 0, 0.7058824, 1, 1,
0.0900269, -0.1285921, 1.838488, 0, 0.6980392, 1, 1,
0.1057881, 2.257067, -0.3942102, 0, 0.6941177, 1, 1,
0.1145511, 0.0541247, 1.03555, 0, 0.6862745, 1, 1,
0.1159611, -0.2025391, 1.841318, 0, 0.682353, 1, 1,
0.1168551, -0.9564173, 4.25572, 0, 0.6745098, 1, 1,
0.1201469, 0.7027948, 0.133183, 0, 0.6705883, 1, 1,
0.1341937, 0.4592349, -0.03896058, 0, 0.6627451, 1, 1,
0.1398035, -2.155366, 2.716408, 0, 0.6588235, 1, 1,
0.1434828, -1.738343, 2.7426, 0, 0.6509804, 1, 1,
0.1505603, -0.1053041, 1.040604, 0, 0.6470588, 1, 1,
0.153457, 0.9307002, -0.2487833, 0, 0.6392157, 1, 1,
0.1585706, -0.6439255, 3.900931, 0, 0.6352941, 1, 1,
0.1596049, 0.6808293, -0.2114522, 0, 0.627451, 1, 1,
0.1597222, 0.3119126, -0.4688946, 0, 0.6235294, 1, 1,
0.1647705, 1.255861, 0.579031, 0, 0.6156863, 1, 1,
0.1653927, -0.7963343, 3.242522, 0, 0.6117647, 1, 1,
0.1659813, 0.3727893, -0.1848712, 0, 0.6039216, 1, 1,
0.1684472, 2.472231, 1.650369, 0, 0.5960785, 1, 1,
0.1694434, -1.232859, 2.258932, 0, 0.5921569, 1, 1,
0.1697647, -0.4518332, 3.13256, 0, 0.5843138, 1, 1,
0.1774936, 1.176201, 1.57278, 0, 0.5803922, 1, 1,
0.1780207, -1.959566, 2.927901, 0, 0.572549, 1, 1,
0.1783376, -1.164231, 1.790586, 0, 0.5686275, 1, 1,
0.1787885, 0.6160133, 0.3981519, 0, 0.5607843, 1, 1,
0.180473, -0.6849521, 4.475917, 0, 0.5568628, 1, 1,
0.1852007, -0.796181, 3.759895, 0, 0.5490196, 1, 1,
0.1854551, -1.758981, 2.304723, 0, 0.5450981, 1, 1,
0.1858438, 1.776245, -1.265764, 0, 0.5372549, 1, 1,
0.1873914, 1.802006, 0.6599674, 0, 0.5333334, 1, 1,
0.1946225, 0.08706503, 1.89413, 0, 0.5254902, 1, 1,
0.1955434, 0.9261687, -0.3834796, 0, 0.5215687, 1, 1,
0.198133, -0.5522388, 3.028789, 0, 0.5137255, 1, 1,
0.1996203, -0.05755243, 3.066469, 0, 0.509804, 1, 1,
0.2031322, -3.277894, 2.204565, 0, 0.5019608, 1, 1,
0.2033032, -2.308475, 3.453542, 0, 0.4941176, 1, 1,
0.2064756, 0.8175737, -1.216521, 0, 0.4901961, 1, 1,
0.207415, -2.184482, 1.146757, 0, 0.4823529, 1, 1,
0.2099508, -0.8461816, 2.768664, 0, 0.4784314, 1, 1,
0.2102586, 0.3495976, 2.07015, 0, 0.4705882, 1, 1,
0.2170665, 0.2979224, 2.527218, 0, 0.4666667, 1, 1,
0.2225574, -0.7132375, 2.114755, 0, 0.4588235, 1, 1,
0.2230165, 0.1315997, 0.9505442, 0, 0.454902, 1, 1,
0.2284752, -0.0005730073, 0.3372904, 0, 0.4470588, 1, 1,
0.2342787, -0.9262804, 3.653021, 0, 0.4431373, 1, 1,
0.2379077, 1.152945, -0.6367704, 0, 0.4352941, 1, 1,
0.2379415, -0.9292769, 2.034916, 0, 0.4313726, 1, 1,
0.2391159, -1.287425, 2.970837, 0, 0.4235294, 1, 1,
0.2402169, -0.1471388, 4.143551, 0, 0.4196078, 1, 1,
0.2403886, -2.895019, 3.121973, 0, 0.4117647, 1, 1,
0.2414064, -1.138109, 3.517381, 0, 0.4078431, 1, 1,
0.242642, -0.8533579, 1.890415, 0, 0.4, 1, 1,
0.2483853, -0.1935011, 2.161433, 0, 0.3921569, 1, 1,
0.2497494, 0.4817176, 1.048359, 0, 0.3882353, 1, 1,
0.2522463, 0.8822326, 0.6717383, 0, 0.3803922, 1, 1,
0.2526262, 1.259802, -1.939082, 0, 0.3764706, 1, 1,
0.2575894, -0.4190837, 1.263891, 0, 0.3686275, 1, 1,
0.2623069, -0.2530529, 2.774787, 0, 0.3647059, 1, 1,
0.2641888, -1.259427, 2.399546, 0, 0.3568628, 1, 1,
0.264986, 0.2800244, 0.7514744, 0, 0.3529412, 1, 1,
0.2684274, -0.9836268, 2.694966, 0, 0.345098, 1, 1,
0.2693112, -1.014537, 2.553186, 0, 0.3411765, 1, 1,
0.2693505, -1.134422, 2.946778, 0, 0.3333333, 1, 1,
0.2701092, 2.057236, 0.2022752, 0, 0.3294118, 1, 1,
0.272964, 0.5947896, 1.709342, 0, 0.3215686, 1, 1,
0.2730678, -1.854297, 2.007921, 0, 0.3176471, 1, 1,
0.2741996, 0.5218773, 0.09610552, 0, 0.3098039, 1, 1,
0.2750817, -0.04252769, 3.534445, 0, 0.3058824, 1, 1,
0.2754311, -0.4822389, 1.768352, 0, 0.2980392, 1, 1,
0.2801436, 2.08401, 0.3216284, 0, 0.2901961, 1, 1,
0.2828098, -0.2259419, 2.79213, 0, 0.2862745, 1, 1,
0.2886564, 1.685861, 0.001931439, 0, 0.2784314, 1, 1,
0.2894017, -0.4100715, 2.595494, 0, 0.2745098, 1, 1,
0.291971, -0.1335429, 1.419278, 0, 0.2666667, 1, 1,
0.2941391, -0.6945445, 2.800324, 0, 0.2627451, 1, 1,
0.2956386, -0.4104204, 2.611841, 0, 0.254902, 1, 1,
0.2968484, 0.9096645, 0.04011235, 0, 0.2509804, 1, 1,
0.2981654, -0.1092592, 3.218302, 0, 0.2431373, 1, 1,
0.3005312, -0.874328, 1.787575, 0, 0.2392157, 1, 1,
0.3064184, -0.3765852, 1.776334, 0, 0.2313726, 1, 1,
0.3086282, 2.334051, -0.6955437, 0, 0.227451, 1, 1,
0.3086934, 0.3471959, 0.877344, 0, 0.2196078, 1, 1,
0.3166824, 0.5273032, 0.7694898, 0, 0.2156863, 1, 1,
0.319847, 0.5855427, -1.196779, 0, 0.2078431, 1, 1,
0.3214002, 0.9623861, -0.3475384, 0, 0.2039216, 1, 1,
0.3214602, -1.236363, 3.122528, 0, 0.1960784, 1, 1,
0.3236919, 0.8928748, 0.3774371, 0, 0.1882353, 1, 1,
0.3242739, 1.173105, 1.961575, 0, 0.1843137, 1, 1,
0.325796, 0.7855206, -1.549677, 0, 0.1764706, 1, 1,
0.3286389, -0.5420935, 3.87022, 0, 0.172549, 1, 1,
0.3291981, 0.9061205, 0.03996816, 0, 0.1647059, 1, 1,
0.3329531, -0.789551, 3.006207, 0, 0.1607843, 1, 1,
0.3354125, 1.504429, -0.2091854, 0, 0.1529412, 1, 1,
0.3354742, 0.1470612, 0.4536022, 0, 0.1490196, 1, 1,
0.3359496, -0.03435958, 1.984896, 0, 0.1411765, 1, 1,
0.339609, 0.1122882, 2.578233, 0, 0.1372549, 1, 1,
0.3406112, 0.1160962, 0.9218693, 0, 0.1294118, 1, 1,
0.343923, 0.8691748, -0.7092532, 0, 0.1254902, 1, 1,
0.3464982, -0.2615167, 3.463129, 0, 0.1176471, 1, 1,
0.3539319, 0.01341393, 0.2088375, 0, 0.1137255, 1, 1,
0.3550001, 0.6484686, 1.719675, 0, 0.1058824, 1, 1,
0.35841, -1.093778, 2.712269, 0, 0.09803922, 1, 1,
0.3595914, 0.2965868, 0.7559993, 0, 0.09411765, 1, 1,
0.3597261, -0.3664719, 0.2135171, 0, 0.08627451, 1, 1,
0.3621933, -0.7994097, 4.074392, 0, 0.08235294, 1, 1,
0.3634312, -0.4711669, 1.868112, 0, 0.07450981, 1, 1,
0.367178, -0.4902815, 5.665614, 0, 0.07058824, 1, 1,
0.3676995, 1.124618, 0.5409857, 0, 0.0627451, 1, 1,
0.3700265, -0.3432678, 2.216779, 0, 0.05882353, 1, 1,
0.370964, -0.9239028, 1.493651, 0, 0.05098039, 1, 1,
0.3717858, 0.04309753, -0.5827916, 0, 0.04705882, 1, 1,
0.3725821, -0.7541389, 3.105365, 0, 0.03921569, 1, 1,
0.3750609, 1.852263, -0.1893687, 0, 0.03529412, 1, 1,
0.3757166, -0.3682326, 1.71954, 0, 0.02745098, 1, 1,
0.3803372, -0.9132338, 3.237932, 0, 0.02352941, 1, 1,
0.3891201, -0.1789327, 1.529767, 0, 0.01568628, 1, 1,
0.3911045, 0.4737735, 2.68575, 0, 0.01176471, 1, 1,
0.3911529, 0.5982163, 0.06151957, 0, 0.003921569, 1, 1,
0.3947859, 0.6308045, 1.622589, 0.003921569, 0, 1, 1,
0.3968361, -0.3283259, 3.549222, 0.007843138, 0, 1, 1,
0.3980676, 0.3867482, 1.516015, 0.01568628, 0, 1, 1,
0.3988914, -0.1373339, 2.212291, 0.01960784, 0, 1, 1,
0.3995387, -0.6017848, 2.531287, 0.02745098, 0, 1, 1,
0.4000858, -0.02209055, 2.848381, 0.03137255, 0, 1, 1,
0.400308, -0.4587375, 2.765709, 0.03921569, 0, 1, 1,
0.4010627, 1.32198, -0.845826, 0.04313726, 0, 1, 1,
0.4096909, -0.2352141, 0.4243988, 0.05098039, 0, 1, 1,
0.4132557, 1.529599, 1.284865, 0.05490196, 0, 1, 1,
0.4166724, -0.5994092, 0.3926637, 0.0627451, 0, 1, 1,
0.4171279, -1.302057, 3.865564, 0.06666667, 0, 1, 1,
0.4194766, -2.136863, 3.610825, 0.07450981, 0, 1, 1,
0.4223169, -0.03919462, -0.3372705, 0.07843138, 0, 1, 1,
0.425645, -1.547526, 2.445239, 0.08627451, 0, 1, 1,
0.427383, -0.3596807, 0.6623789, 0.09019608, 0, 1, 1,
0.430268, 1.339342, -0.1091618, 0.09803922, 0, 1, 1,
0.4310529, -2.363154, 2.506268, 0.1058824, 0, 1, 1,
0.4322637, 0.3706302, 1.95462, 0.1098039, 0, 1, 1,
0.4322926, 1.286082, 1.223515, 0.1176471, 0, 1, 1,
0.4339306, 1.326754, -1.701205, 0.1215686, 0, 1, 1,
0.4373021, -1.257103, 3.625646, 0.1294118, 0, 1, 1,
0.4422736, 0.2483254, 0.6537487, 0.1333333, 0, 1, 1,
0.4478293, 0.7184409, 1.420454, 0.1411765, 0, 1, 1,
0.4545703, 0.3649377, 1.051624, 0.145098, 0, 1, 1,
0.4577907, 1.43812, 1.221856, 0.1529412, 0, 1, 1,
0.4581948, -1.699057, 5.257573, 0.1568628, 0, 1, 1,
0.4595856, -1.302165, 3.435419, 0.1647059, 0, 1, 1,
0.4735762, 0.5638384, 1.120867, 0.1686275, 0, 1, 1,
0.4753287, 1.267354, 0.5596813, 0.1764706, 0, 1, 1,
0.4766074, -0.09334372, 0.7713453, 0.1803922, 0, 1, 1,
0.4828211, 1.236095, 1.52366, 0.1882353, 0, 1, 1,
0.4849083, -1.11634, 3.484399, 0.1921569, 0, 1, 1,
0.4869211, 0.8140356, -0.3824077, 0.2, 0, 1, 1,
0.4871642, -0.8089667, 3.939005, 0.2078431, 0, 1, 1,
0.4897307, -0.5240124, 2.885309, 0.2117647, 0, 1, 1,
0.4909685, -0.1016075, 0.7543523, 0.2196078, 0, 1, 1,
0.4929756, 0.3336694, 0.4237201, 0.2235294, 0, 1, 1,
0.494735, -0.7838691, 3.562037, 0.2313726, 0, 1, 1,
0.497056, 0.5718367, 2.551491, 0.2352941, 0, 1, 1,
0.4973812, 1.504045, 0.9476274, 0.2431373, 0, 1, 1,
0.4985307, 0.1221378, 2.795331, 0.2470588, 0, 1, 1,
0.4988957, -0.8818728, 1.772618, 0.254902, 0, 1, 1,
0.5013859, 0.4815122, 0.1467703, 0.2588235, 0, 1, 1,
0.509799, 0.8537802, 0.3749059, 0.2666667, 0, 1, 1,
0.5186065, -1.340902, 1.508616, 0.2705882, 0, 1, 1,
0.5193974, -0.2586353, 2.972775, 0.2784314, 0, 1, 1,
0.5196923, 0.4902511, 0.845331, 0.282353, 0, 1, 1,
0.5204548, -0.6332995, 2.91224, 0.2901961, 0, 1, 1,
0.5218717, 0.8693677, -0.6393663, 0.2941177, 0, 1, 1,
0.5272343, -0.9698402, 3.19992, 0.3019608, 0, 1, 1,
0.5279683, 0.3350271, 0.7866759, 0.3098039, 0, 1, 1,
0.5298599, -0.01482062, -0.06633412, 0.3137255, 0, 1, 1,
0.536131, -0.02810275, 1.721124, 0.3215686, 0, 1, 1,
0.5389902, 0.3225631, -0.6758034, 0.3254902, 0, 1, 1,
0.5390824, -0.9711948, 2.313101, 0.3333333, 0, 1, 1,
0.5477114, 1.77749, -0.4549744, 0.3372549, 0, 1, 1,
0.5514356, -1.015779, 2.281279, 0.345098, 0, 1, 1,
0.5531733, -1.554281, 3.25707, 0.3490196, 0, 1, 1,
0.5557538, -0.9851937, 1.576644, 0.3568628, 0, 1, 1,
0.5566769, -0.7274488, 1.866847, 0.3607843, 0, 1, 1,
0.5595856, 0.7063387, 0.7247203, 0.3686275, 0, 1, 1,
0.5601419, -0.7212738, 2.281569, 0.372549, 0, 1, 1,
0.5660232, 1.202055, 1.191813, 0.3803922, 0, 1, 1,
0.5662383, 0.9312295, 1.38294, 0.3843137, 0, 1, 1,
0.567538, -0.5467812, 1.557764, 0.3921569, 0, 1, 1,
0.568882, -1.261259, 2.036299, 0.3960784, 0, 1, 1,
0.5696766, 1.140153, 1.544334, 0.4039216, 0, 1, 1,
0.5737664, 0.7949308, 1.778768, 0.4117647, 0, 1, 1,
0.5763974, -0.7666024, 2.459398, 0.4156863, 0, 1, 1,
0.5765605, 1.115024, 1.427284, 0.4235294, 0, 1, 1,
0.5779757, -1.175133, 3.113501, 0.427451, 0, 1, 1,
0.5786823, -0.2634192, 2.355752, 0.4352941, 0, 1, 1,
0.5816804, -1.997236, 2.940997, 0.4392157, 0, 1, 1,
0.5830452, -0.07476982, 2.106298, 0.4470588, 0, 1, 1,
0.5867793, 2.354081, -0.03976103, 0.4509804, 0, 1, 1,
0.594122, -1.008971, 4.145432, 0.4588235, 0, 1, 1,
0.5985259, 1.561198, -1.245138, 0.4627451, 0, 1, 1,
0.6010557, -0.6349231, 2.463249, 0.4705882, 0, 1, 1,
0.6022085, 0.8788919, 0.9836906, 0.4745098, 0, 1, 1,
0.6035065, -0.937137, 2.186983, 0.4823529, 0, 1, 1,
0.6087865, 0.6232821, 0.5847325, 0.4862745, 0, 1, 1,
0.6101786, 0.07759559, 1.797813, 0.4941176, 0, 1, 1,
0.6287624, -0.05811463, 0.8322045, 0.5019608, 0, 1, 1,
0.630338, -0.4258989, 3.567526, 0.5058824, 0, 1, 1,
0.6336048, 0.7475114, -1.027968, 0.5137255, 0, 1, 1,
0.6377577, -0.3583792, 2.26728, 0.5176471, 0, 1, 1,
0.6436605, 1.124662, 0.5232755, 0.5254902, 0, 1, 1,
0.6438611, 0.9540596, 1.414591, 0.5294118, 0, 1, 1,
0.6448799, -0.248188, 2.299781, 0.5372549, 0, 1, 1,
0.6463787, 1.550982, 2.003167, 0.5411765, 0, 1, 1,
0.6467423, -0.4743701, 3.041904, 0.5490196, 0, 1, 1,
0.6498004, 0.009229599, 2.190239, 0.5529412, 0, 1, 1,
0.651464, -1.867353, 2.220413, 0.5607843, 0, 1, 1,
0.6566594, -1.891346, 5.076115, 0.5647059, 0, 1, 1,
0.6598743, 1.56018, 0.72361, 0.572549, 0, 1, 1,
0.6640168, 0.09311378, -1.606694, 0.5764706, 0, 1, 1,
0.6654361, 0.2246909, 1.012173, 0.5843138, 0, 1, 1,
0.668039, 0.5619017, 2.012514, 0.5882353, 0, 1, 1,
0.6704543, 0.254878, 1.487438, 0.5960785, 0, 1, 1,
0.6730047, -0.3291725, 1.010387, 0.6039216, 0, 1, 1,
0.675256, 0.258128, 0.8501272, 0.6078432, 0, 1, 1,
0.6767411, 2.666905, -0.4346859, 0.6156863, 0, 1, 1,
0.6858651, 0.1092253, 1.07135, 0.6196079, 0, 1, 1,
0.6960843, -0.4282782, 3.097144, 0.627451, 0, 1, 1,
0.7060624, -0.4925765, 3.309422, 0.6313726, 0, 1, 1,
0.7214434, 0.4592748, 2.520416, 0.6392157, 0, 1, 1,
0.7220815, 0.7302213, 1.597821, 0.6431373, 0, 1, 1,
0.7252873, 1.044026, 1.47953, 0.6509804, 0, 1, 1,
0.7266127, 1.027134, 1.29434, 0.654902, 0, 1, 1,
0.7322927, -1.72441, 1.650052, 0.6627451, 0, 1, 1,
0.7341735, -0.6758892, 1.634239, 0.6666667, 0, 1, 1,
0.7377572, -1.825397, 2.868273, 0.6745098, 0, 1, 1,
0.7390942, -0.5856546, 2.370171, 0.6784314, 0, 1, 1,
0.742807, -0.6298941, 1.465681, 0.6862745, 0, 1, 1,
0.749127, -0.07776256, 0.3790771, 0.6901961, 0, 1, 1,
0.7554408, 0.846322, 1.431079, 0.6980392, 0, 1, 1,
0.7600361, 0.9871756, 0.8676428, 0.7058824, 0, 1, 1,
0.7615815, 0.1963483, 2.198004, 0.7098039, 0, 1, 1,
0.7644199, -0.2821038, 1.729884, 0.7176471, 0, 1, 1,
0.7710426, -1.224209, 2.303054, 0.7215686, 0, 1, 1,
0.7759042, 0.4160892, 0.6925082, 0.7294118, 0, 1, 1,
0.7778209, 0.6996589, 0.2346412, 0.7333333, 0, 1, 1,
0.7850106, 0.1530304, 0.9452736, 0.7411765, 0, 1, 1,
0.7922837, 0.1855909, 2.874231, 0.7450981, 0, 1, 1,
0.7982571, -0.9930389, 2.593318, 0.7529412, 0, 1, 1,
0.799698, -0.7184421, 2.081566, 0.7568628, 0, 1, 1,
0.8050572, -1.353767, 3.533374, 0.7647059, 0, 1, 1,
0.8135353, 0.5837765, 0.4995476, 0.7686275, 0, 1, 1,
0.8179605, -0.009988219, 0.9009419, 0.7764706, 0, 1, 1,
0.82302, -0.2229976, 3.186704, 0.7803922, 0, 1, 1,
0.8306548, 1.334027, -0.5299666, 0.7882353, 0, 1, 1,
0.8329161, -0.5804679, 2.87157, 0.7921569, 0, 1, 1,
0.8355419, -0.5258688, 1.58087, 0.8, 0, 1, 1,
0.8489755, 0.7837768, 0.1775547, 0.8078431, 0, 1, 1,
0.8497777, -0.9709989, 1.790366, 0.8117647, 0, 1, 1,
0.8517987, -0.8801485, 1.791355, 0.8196079, 0, 1, 1,
0.8529948, 0.8746619, 1.3844, 0.8235294, 0, 1, 1,
0.8540863, 0.4996346, 2.46264, 0.8313726, 0, 1, 1,
0.8651329, 0.1539134, 1.779276, 0.8352941, 0, 1, 1,
0.8684821, -0.7606611, 4.114019, 0.8431373, 0, 1, 1,
0.8687909, 1.781701, 0.5251474, 0.8470588, 0, 1, 1,
0.8753195, 0.5449845, 1.250127, 0.854902, 0, 1, 1,
0.8775934, -0.1769636, 0.2595397, 0.8588235, 0, 1, 1,
0.8780544, 1.613405, 1.743832, 0.8666667, 0, 1, 1,
0.878275, -1.526638, 2.799833, 0.8705882, 0, 1, 1,
0.8836104, -0.05628004, 2.184729, 0.8784314, 0, 1, 1,
0.8889826, -0.06585995, 1.888384, 0.8823529, 0, 1, 1,
0.8933015, -0.4797168, 1.64312, 0.8901961, 0, 1, 1,
0.8967316, 0.002361577, 1.156947, 0.8941177, 0, 1, 1,
0.8967999, 0.3676184, -1.011, 0.9019608, 0, 1, 1,
0.9071749, 0.6009017, 1.052202, 0.9098039, 0, 1, 1,
0.9087883, -0.4801656, 1.74466, 0.9137255, 0, 1, 1,
0.9181157, -0.3865559, 3.773216, 0.9215686, 0, 1, 1,
0.9211239, 0.6477029, 1.477923, 0.9254902, 0, 1, 1,
0.9230161, -0.1607521, 2.198631, 0.9333333, 0, 1, 1,
0.9311782, 1.631037, 1.093121, 0.9372549, 0, 1, 1,
0.9325267, -1.334249, 2.499985, 0.945098, 0, 1, 1,
0.9358265, 0.1317873, 0.6822838, 0.9490196, 0, 1, 1,
0.9493781, 0.6123325, 0.9359401, 0.9568627, 0, 1, 1,
0.9508942, 0.5643981, 2.02935, 0.9607843, 0, 1, 1,
0.9538671, -0.6984641, 2.257921, 0.9686275, 0, 1, 1,
0.9539952, 1.307405, -0.9280224, 0.972549, 0, 1, 1,
0.9640219, -0.6982588, 2.004544, 0.9803922, 0, 1, 1,
0.9660547, 0.6890593, 1.766165, 0.9843137, 0, 1, 1,
0.9661491, 1.273531, 0.3741152, 0.9921569, 0, 1, 1,
0.9666659, 1.938397, 0.1705352, 0.9960784, 0, 1, 1,
0.9737475, 2.708213, -0.2479067, 1, 0, 0.9960784, 1,
0.9767935, -1.862448, 2.318913, 1, 0, 0.9882353, 1,
0.977329, 0.3098279, 1.824835, 1, 0, 0.9843137, 1,
0.983519, -1.010816, 1.724076, 1, 0, 0.9764706, 1,
0.9912798, 0.08958436, 0.5972953, 1, 0, 0.972549, 1,
0.9949604, -0.761382, 4.284548, 1, 0, 0.9647059, 1,
0.9949816, 0.8009493, 1.575936, 1, 0, 0.9607843, 1,
1.006413, 1.247101, 1.415128, 1, 0, 0.9529412, 1,
1.008587, -0.04579626, 2.662843, 1, 0, 0.9490196, 1,
1.011122, 0.2887908, 1.313136, 1, 0, 0.9411765, 1,
1.021652, -1.302887, 3.093032, 1, 0, 0.9372549, 1,
1.028875, 0.1514684, 0.6160126, 1, 0, 0.9294118, 1,
1.030507, -0.4804054, 2.131959, 1, 0, 0.9254902, 1,
1.037742, 0.9247925, 1.336488, 1, 0, 0.9176471, 1,
1.041107, 0.03558613, 2.210033, 1, 0, 0.9137255, 1,
1.042899, -1.39463, 2.949945, 1, 0, 0.9058824, 1,
1.045606, 0.9314616, 0.8278652, 1, 0, 0.9019608, 1,
1.051678, 0.6377687, 1.915662, 1, 0, 0.8941177, 1,
1.051733, 1.159321, 0.7536941, 1, 0, 0.8862745, 1,
1.054223, -1.633512, 0.8780379, 1, 0, 0.8823529, 1,
1.055616, -0.5463553, 3.54779, 1, 0, 0.8745098, 1,
1.06007, 0.2461086, 1.546182, 1, 0, 0.8705882, 1,
1.063047, 0.7455161, 0.3538627, 1, 0, 0.8627451, 1,
1.073137, 0.2432948, 1.928265, 1, 0, 0.8588235, 1,
1.073725, 0.06542751, 0.1251321, 1, 0, 0.8509804, 1,
1.073806, 1.466918, 0.7128364, 1, 0, 0.8470588, 1,
1.074469, 0.3245615, 0.5602011, 1, 0, 0.8392157, 1,
1.0779, 1.718346, 0.4259412, 1, 0, 0.8352941, 1,
1.087313, 2.818623, -0.4422798, 1, 0, 0.827451, 1,
1.092694, -0.6308455, 2.48445, 1, 0, 0.8235294, 1,
1.101225, 0.3715679, -0.1819667, 1, 0, 0.8156863, 1,
1.101662, -0.962514, 2.331327, 1, 0, 0.8117647, 1,
1.107855, 0.5143998, 1.218823, 1, 0, 0.8039216, 1,
1.109231, 0.1819383, 2.44447, 1, 0, 0.7960784, 1,
1.126135, -0.7576471, 3.230955, 1, 0, 0.7921569, 1,
1.127376, 0.1235873, 0.5242485, 1, 0, 0.7843137, 1,
1.133005, -0.7025487, 2.341633, 1, 0, 0.7803922, 1,
1.133133, -0.1807363, 1.576585, 1, 0, 0.772549, 1,
1.140523, -0.7900046, 1.437091, 1, 0, 0.7686275, 1,
1.141322, 0.8036357, 1.338622, 1, 0, 0.7607843, 1,
1.142597, 0.5834925, 0.8339698, 1, 0, 0.7568628, 1,
1.148885, 0.9346068, 1.163311, 1, 0, 0.7490196, 1,
1.149986, 1.249231, 0.694864, 1, 0, 0.7450981, 1,
1.156883, -0.01967953, 3.545202, 1, 0, 0.7372549, 1,
1.162666, -1.441824, 4.182398, 1, 0, 0.7333333, 1,
1.172825, 0.2189798, 1.756652, 1, 0, 0.7254902, 1,
1.19654, 0.231619, 0.43948, 1, 0, 0.7215686, 1,
1.215622, 1.002242, 2.293185, 1, 0, 0.7137255, 1,
1.215918, -0.8983198, 0.7123063, 1, 0, 0.7098039, 1,
1.223493, 0.782173, 2.147036, 1, 0, 0.7019608, 1,
1.23427, -0.9219964, 1.126205, 1, 0, 0.6941177, 1,
1.238039, 0.307515, 1.605311, 1, 0, 0.6901961, 1,
1.260978, 1.543069, 1.63079, 1, 0, 0.682353, 1,
1.261817, 0.2410745, 3.135084, 1, 0, 0.6784314, 1,
1.263291, -0.8792434, 2.471853, 1, 0, 0.6705883, 1,
1.268556, -0.3510748, 0.4671574, 1, 0, 0.6666667, 1,
1.268959, -2.141331, 2.105243, 1, 0, 0.6588235, 1,
1.273303, 0.6575301, 0.1898189, 1, 0, 0.654902, 1,
1.279299, -0.5069948, 1.394738, 1, 0, 0.6470588, 1,
1.287579, -0.7988943, 2.250722, 1, 0, 0.6431373, 1,
1.294561, 0.9058426, 0.6322985, 1, 0, 0.6352941, 1,
1.294695, -1.525943, 1.728155, 1, 0, 0.6313726, 1,
1.304346, 0.5873736, 1.631859, 1, 0, 0.6235294, 1,
1.313941, 0.7116014, 1.292959, 1, 0, 0.6196079, 1,
1.315059, -0.1244345, 2.007881, 1, 0, 0.6117647, 1,
1.321978, 0.2634988, 2.048661, 1, 0, 0.6078432, 1,
1.326524, -0.9128175, 2.41118, 1, 0, 0.6, 1,
1.34389, 0.07594385, -0.4636421, 1, 0, 0.5921569, 1,
1.34591, -0.6682037, 2.386866, 1, 0, 0.5882353, 1,
1.346572, 1.010171, 2.406406, 1, 0, 0.5803922, 1,
1.349885, 1.932938, 1.039531, 1, 0, 0.5764706, 1,
1.35655, 0.7296414, 0.4447748, 1, 0, 0.5686275, 1,
1.358047, 0.7238899, 0.4211293, 1, 0, 0.5647059, 1,
1.365414, 0.2065804, 1.675336, 1, 0, 0.5568628, 1,
1.366036, 0.7079953, 1.493926, 1, 0, 0.5529412, 1,
1.373609, 1.53819, 1.030029, 1, 0, 0.5450981, 1,
1.409771, -0.5217973, 1.486666, 1, 0, 0.5411765, 1,
1.431324, 0.4086135, 1.74471, 1, 0, 0.5333334, 1,
1.43522, 0.9523914, 1.953402, 1, 0, 0.5294118, 1,
1.435715, 1.032523, 0.499678, 1, 0, 0.5215687, 1,
1.46665, 0.09204877, 0.8220954, 1, 0, 0.5176471, 1,
1.471758, 0.2828133, 2.056067, 1, 0, 0.509804, 1,
1.481761, 1.121617, 0.08773676, 1, 0, 0.5058824, 1,
1.488593, 1.609098, 0.04089209, 1, 0, 0.4980392, 1,
1.491898, -0.05000698, 3.053025, 1, 0, 0.4901961, 1,
1.492272, 1.793416, 0.3936355, 1, 0, 0.4862745, 1,
1.493787, -1.918191, 0.9750841, 1, 0, 0.4784314, 1,
1.495838, -0.8046663, 4.631907, 1, 0, 0.4745098, 1,
1.500527, -0.3179863, 2.081005, 1, 0, 0.4666667, 1,
1.504431, -0.1717762, 0.3140004, 1, 0, 0.4627451, 1,
1.507316, 0.1185349, 2.223033, 1, 0, 0.454902, 1,
1.508627, -0.9541826, 1.181845, 1, 0, 0.4509804, 1,
1.511318, -0.1257934, 1.481455, 1, 0, 0.4431373, 1,
1.512195, 0.8521688, 1.510213, 1, 0, 0.4392157, 1,
1.513878, 0.2801115, 2.39612, 1, 0, 0.4313726, 1,
1.514363, 0.09162489, 1.676429, 1, 0, 0.427451, 1,
1.52504, -0.7147944, 2.826097, 1, 0, 0.4196078, 1,
1.526142, 0.6915728, 2.173165, 1, 0, 0.4156863, 1,
1.531878, 0.9710128, 0.3192697, 1, 0, 0.4078431, 1,
1.565723, -0.9710609, 2.916795, 1, 0, 0.4039216, 1,
1.567355, -0.7644666, 1.367685, 1, 0, 0.3960784, 1,
1.572544, 0.5189497, 0.7242869, 1, 0, 0.3882353, 1,
1.581195, 0.7944065, 0.6148022, 1, 0, 0.3843137, 1,
1.589179, -1.701375, 4.059941, 1, 0, 0.3764706, 1,
1.593351, 0.1503239, 1.080758, 1, 0, 0.372549, 1,
1.603364, 0.3112901, 1.790072, 1, 0, 0.3647059, 1,
1.617779, -1.076629, 4.952224, 1, 0, 0.3607843, 1,
1.625201, -1.214327, 1.276439, 1, 0, 0.3529412, 1,
1.625749, -1.010519, 1.856647, 1, 0, 0.3490196, 1,
1.626905, -0.1101802, 1.709386, 1, 0, 0.3411765, 1,
1.651155, -0.9537699, 1.739805, 1, 0, 0.3372549, 1,
1.66084, 0.3734858, 0.7191849, 1, 0, 0.3294118, 1,
1.676426, -0.0658314, 2.362683, 1, 0, 0.3254902, 1,
1.681105, -0.9665946, 1.772285, 1, 0, 0.3176471, 1,
1.695336, 0.7102797, 1.778253, 1, 0, 0.3137255, 1,
1.714703, -0.03084067, 0.9040487, 1, 0, 0.3058824, 1,
1.722002, -0.3450753, 1.97022, 1, 0, 0.2980392, 1,
1.735391, -1.074775, 1.05203, 1, 0, 0.2941177, 1,
1.774855, -0.6013536, 2.589201, 1, 0, 0.2862745, 1,
1.78279, 0.02871105, 2.010297, 1, 0, 0.282353, 1,
1.786036, -1.863321, -0.4713597, 1, 0, 0.2745098, 1,
1.790645, -0.3167241, 1.582323, 1, 0, 0.2705882, 1,
1.793539, 0.6641859, 0.3029822, 1, 0, 0.2627451, 1,
1.804207, 0.5589914, -0.7312853, 1, 0, 0.2588235, 1,
1.807749, 1.811482, -0.3183032, 1, 0, 0.2509804, 1,
1.824332, -0.3666151, 2.914879, 1, 0, 0.2470588, 1,
1.84896, -1.533612, 1.479399, 1, 0, 0.2392157, 1,
1.851409, 0.4761057, 1.023418, 1, 0, 0.2352941, 1,
1.90393, -1.043928, 2.637813, 1, 0, 0.227451, 1,
1.906352, -1.514377, 1.231351, 1, 0, 0.2235294, 1,
1.916134, 0.8477986, -0.4206042, 1, 0, 0.2156863, 1,
1.926264, 0.4381769, 2.720056, 1, 0, 0.2117647, 1,
1.931221, -0.8640637, 2.087999, 1, 0, 0.2039216, 1,
1.94891, 0.1308194, 1.033357, 1, 0, 0.1960784, 1,
1.97349, -1.313095, 2.06051, 1, 0, 0.1921569, 1,
1.984541, 0.3142056, 2.953836, 1, 0, 0.1843137, 1,
1.986747, 0.5673801, 0.1714579, 1, 0, 0.1803922, 1,
1.989525, 0.05824641, 1.29758, 1, 0, 0.172549, 1,
1.992613, 0.1429294, 0.3982849, 1, 0, 0.1686275, 1,
1.995944, 0.2895356, 0.3835668, 1, 0, 0.1607843, 1,
2.038687, -1.9956, 3.328585, 1, 0, 0.1568628, 1,
2.066638, -0.7385677, 2.463304, 1, 0, 0.1490196, 1,
2.073399, 0.6100069, 1.612272, 1, 0, 0.145098, 1,
2.124719, -1.672923, -0.1566292, 1, 0, 0.1372549, 1,
2.126217, -0.625426, 3.491778, 1, 0, 0.1333333, 1,
2.12841, -0.9793952, 2.550763, 1, 0, 0.1254902, 1,
2.160986, 1.621613, 2.157336, 1, 0, 0.1215686, 1,
2.160995, -1.799275, 2.159629, 1, 0, 0.1137255, 1,
2.164674, 0.8676628, 2.062127, 1, 0, 0.1098039, 1,
2.189779, 1.631328, 0.07584589, 1, 0, 0.1019608, 1,
2.19676, 1.332543, 2.015441, 1, 0, 0.09411765, 1,
2.227697, 2.315233, 1.627496, 1, 0, 0.09019608, 1,
2.23208, -0.3560638, 1.416173, 1, 0, 0.08235294, 1,
2.244479, -0.204922, 1.421542, 1, 0, 0.07843138, 1,
2.250138, 0.6101294, 1.542749, 1, 0, 0.07058824, 1,
2.307504, -0.5369217, 1.362368, 1, 0, 0.06666667, 1,
2.330626, 1.34558, 0.5036521, 1, 0, 0.05882353, 1,
2.34304, -1.983551, 0.8603871, 1, 0, 0.05490196, 1,
2.349589, 0.5438508, 1.000362, 1, 0, 0.04705882, 1,
2.468494, -0.1240048, 2.303123, 1, 0, 0.04313726, 1,
2.520491, -1.712529, 2.72086, 1, 0, 0.03529412, 1,
2.524864, -1.261417, 1.669936, 1, 0, 0.03137255, 1,
2.66392, 2.769427, -1.190279, 1, 0, 0.02352941, 1,
2.942508, 0.3490887, 2.804997, 1, 0, 0.01960784, 1,
3.086332, 0.6235619, 0.8702605, 1, 0, 0.01176471, 1,
3.307109, -0.6873596, 1.013553, 1, 0, 0.007843138, 1
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
0.2695335, -4.522469, -6.70628, 0, -0.5, 0.5, 0.5,
0.2695335, -4.522469, -6.70628, 1, -0.5, 0.5, 0.5,
0.2695335, -4.522469, -6.70628, 1, 1.5, 0.5, 0.5,
0.2695335, -4.522469, -6.70628, 0, 1.5, 0.5, 0.5
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
-3.79778, 0.3934177, -6.70628, 0, -0.5, 0.5, 0.5,
-3.79778, 0.3934177, -6.70628, 1, -0.5, 0.5, 0.5,
-3.79778, 0.3934177, -6.70628, 1, 1.5, 0.5, 0.5,
-3.79778, 0.3934177, -6.70628, 0, 1.5, 0.5, 0.5
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
-3.79778, -4.522469, 0.3762193, 0, -0.5, 0.5, 0.5,
-3.79778, -4.522469, 0.3762193, 1, -0.5, 0.5, 0.5,
-3.79778, -4.522469, 0.3762193, 1, 1.5, 0.5, 0.5,
-3.79778, -4.522469, 0.3762193, 0, 1.5, 0.5, 0.5
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
-2, -3.388034, -5.071857,
3, -3.388034, -5.071857,
-2, -3.388034, -5.071857,
-2, -3.577106, -5.344261,
-1, -3.388034, -5.071857,
-1, -3.577106, -5.344261,
0, -3.388034, -5.071857,
0, -3.577106, -5.344261,
1, -3.388034, -5.071857,
1, -3.577106, -5.344261,
2, -3.388034, -5.071857,
2, -3.577106, -5.344261,
3, -3.388034, -5.071857,
3, -3.577106, -5.344261
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
-2, -3.955251, -5.889069, 0, -0.5, 0.5, 0.5,
-2, -3.955251, -5.889069, 1, -0.5, 0.5, 0.5,
-2, -3.955251, -5.889069, 1, 1.5, 0.5, 0.5,
-2, -3.955251, -5.889069, 0, 1.5, 0.5, 0.5,
-1, -3.955251, -5.889069, 0, -0.5, 0.5, 0.5,
-1, -3.955251, -5.889069, 1, -0.5, 0.5, 0.5,
-1, -3.955251, -5.889069, 1, 1.5, 0.5, 0.5,
-1, -3.955251, -5.889069, 0, 1.5, 0.5, 0.5,
0, -3.955251, -5.889069, 0, -0.5, 0.5, 0.5,
0, -3.955251, -5.889069, 1, -0.5, 0.5, 0.5,
0, -3.955251, -5.889069, 1, 1.5, 0.5, 0.5,
0, -3.955251, -5.889069, 0, 1.5, 0.5, 0.5,
1, -3.955251, -5.889069, 0, -0.5, 0.5, 0.5,
1, -3.955251, -5.889069, 1, -0.5, 0.5, 0.5,
1, -3.955251, -5.889069, 1, 1.5, 0.5, 0.5,
1, -3.955251, -5.889069, 0, 1.5, 0.5, 0.5,
2, -3.955251, -5.889069, 0, -0.5, 0.5, 0.5,
2, -3.955251, -5.889069, 1, -0.5, 0.5, 0.5,
2, -3.955251, -5.889069, 1, 1.5, 0.5, 0.5,
2, -3.955251, -5.889069, 0, 1.5, 0.5, 0.5,
3, -3.955251, -5.889069, 0, -0.5, 0.5, 0.5,
3, -3.955251, -5.889069, 1, -0.5, 0.5, 0.5,
3, -3.955251, -5.889069, 1, 1.5, 0.5, 0.5,
3, -3.955251, -5.889069, 0, 1.5, 0.5, 0.5
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
-2.859169, -2, -5.071857,
-2.859169, 4, -5.071857,
-2.859169, -2, -5.071857,
-3.015604, -2, -5.344261,
-2.859169, 0, -5.071857,
-3.015604, 0, -5.344261,
-2.859169, 2, -5.071857,
-3.015604, 2, -5.344261,
-2.859169, 4, -5.071857,
-3.015604, 4, -5.344261
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
"2",
"4"
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
-3.328475, -2, -5.889069, 0, -0.5, 0.5, 0.5,
-3.328475, -2, -5.889069, 1, -0.5, 0.5, 0.5,
-3.328475, -2, -5.889069, 1, 1.5, 0.5, 0.5,
-3.328475, -2, -5.889069, 0, 1.5, 0.5, 0.5,
-3.328475, 0, -5.889069, 0, -0.5, 0.5, 0.5,
-3.328475, 0, -5.889069, 1, -0.5, 0.5, 0.5,
-3.328475, 0, -5.889069, 1, 1.5, 0.5, 0.5,
-3.328475, 0, -5.889069, 0, 1.5, 0.5, 0.5,
-3.328475, 2, -5.889069, 0, -0.5, 0.5, 0.5,
-3.328475, 2, -5.889069, 1, -0.5, 0.5, 0.5,
-3.328475, 2, -5.889069, 1, 1.5, 0.5, 0.5,
-3.328475, 2, -5.889069, 0, 1.5, 0.5, 0.5,
-3.328475, 4, -5.889069, 0, -0.5, 0.5, 0.5,
-3.328475, 4, -5.889069, 1, -0.5, 0.5, 0.5,
-3.328475, 4, -5.889069, 1, 1.5, 0.5, 0.5,
-3.328475, 4, -5.889069, 0, 1.5, 0.5, 0.5
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
-2.859169, -3.388034, -4,
-2.859169, -3.388034, 4,
-2.859169, -3.388034, -4,
-3.015604, -3.577106, -4,
-2.859169, -3.388034, -2,
-3.015604, -3.577106, -2,
-2.859169, -3.388034, 0,
-3.015604, -3.577106, 0,
-2.859169, -3.388034, 2,
-3.015604, -3.577106, 2,
-2.859169, -3.388034, 4,
-3.015604, -3.577106, 4
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
-3.328475, -3.955251, -4, 0, -0.5, 0.5, 0.5,
-3.328475, -3.955251, -4, 1, -0.5, 0.5, 0.5,
-3.328475, -3.955251, -4, 1, 1.5, 0.5, 0.5,
-3.328475, -3.955251, -4, 0, 1.5, 0.5, 0.5,
-3.328475, -3.955251, -2, 0, -0.5, 0.5, 0.5,
-3.328475, -3.955251, -2, 1, -0.5, 0.5, 0.5,
-3.328475, -3.955251, -2, 1, 1.5, 0.5, 0.5,
-3.328475, -3.955251, -2, 0, 1.5, 0.5, 0.5,
-3.328475, -3.955251, 0, 0, -0.5, 0.5, 0.5,
-3.328475, -3.955251, 0, 1, -0.5, 0.5, 0.5,
-3.328475, -3.955251, 0, 1, 1.5, 0.5, 0.5,
-3.328475, -3.955251, 0, 0, 1.5, 0.5, 0.5,
-3.328475, -3.955251, 2, 0, -0.5, 0.5, 0.5,
-3.328475, -3.955251, 2, 1, -0.5, 0.5, 0.5,
-3.328475, -3.955251, 2, 1, 1.5, 0.5, 0.5,
-3.328475, -3.955251, 2, 0, 1.5, 0.5, 0.5,
-3.328475, -3.955251, 4, 0, -0.5, 0.5, 0.5,
-3.328475, -3.955251, 4, 1, -0.5, 0.5, 0.5,
-3.328475, -3.955251, 4, 1, 1.5, 0.5, 0.5,
-3.328475, -3.955251, 4, 0, 1.5, 0.5, 0.5
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
-2.859169, -3.388034, -5.071857,
-2.859169, 4.174869, -5.071857,
-2.859169, -3.388034, 5.824296,
-2.859169, 4.174869, 5.824296,
-2.859169, -3.388034, -5.071857,
-2.859169, -3.388034, 5.824296,
-2.859169, 4.174869, -5.071857,
-2.859169, 4.174869, 5.824296,
-2.859169, -3.388034, -5.071857,
3.398236, -3.388034, -5.071857,
-2.859169, -3.388034, 5.824296,
3.398236, -3.388034, 5.824296,
-2.859169, 4.174869, -5.071857,
3.398236, 4.174869, -5.071857,
-2.859169, 4.174869, 5.824296,
3.398236, 4.174869, 5.824296,
3.398236, -3.388034, -5.071857,
3.398236, 4.174869, -5.071857,
3.398236, -3.388034, 5.824296,
3.398236, 4.174869, 5.824296,
3.398236, -3.388034, -5.071857,
3.398236, -3.388034, 5.824296,
3.398236, 4.174869, -5.071857,
3.398236, 4.174869, 5.824296
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
var radius = 7.831126;
var distance = 34.84157;
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
mvMatrix.translate( -0.2695335, -0.3934177, -0.3762193 );
mvMatrix.scale( 1.353143, 1.119566, 0.7770786 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.84157);
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
acrolein<-read.table("acrolein.xyz")
```

```
## Error in read.table("acrolein.xyz"): no lines available in input
```

```r
x<-acrolein$V2
```

```
## Error in eval(expr, envir, enclos): object 'acrolein' not found
```

```r
y<-acrolein$V3
```

```
## Error in eval(expr, envir, enclos): object 'acrolein' not found
```

```r
z<-acrolein$V4
```

```
## Error in eval(expr, envir, enclos): object 'acrolein' not found
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
-2.768042, 0.133087, -0.7617431, 0, 0, 1, 1, 1,
-2.640303, 1.083078, -1.639762, 1, 0, 0, 1, 1,
-2.559144, 1.187963, -0.6956354, 1, 0, 0, 1, 1,
-2.362179, 1.021316, -0.8098614, 1, 0, 0, 1, 1,
-2.332087, 0.0285617, -1.217371, 1, 0, 0, 1, 1,
-2.256612, 1.241028, -1.597671, 1, 0, 0, 1, 1,
-2.247978, -1.135985, -2.642157, 0, 0, 0, 1, 1,
-2.232734, -0.6765212, -1.865477, 0, 0, 0, 1, 1,
-2.226616, -1.338271, -2.799985, 0, 0, 0, 1, 1,
-2.214222, -1.164404, -1.705409, 0, 0, 0, 1, 1,
-2.208944, -2.281858, -2.903094, 0, 0, 0, 1, 1,
-2.202632, 1.116615, -1.684604, 0, 0, 0, 1, 1,
-2.17838, -0.7091687, -0.33032, 0, 0, 0, 1, 1,
-2.170057, 2.048293, -2.327777, 1, 1, 1, 1, 1,
-2.149237, -0.3530633, -2.819326, 1, 1, 1, 1, 1,
-2.141097, -0.4235701, -0.2436003, 1, 1, 1, 1, 1,
-2.135114, 0.9024764, -2.006879, 1, 1, 1, 1, 1,
-2.127784, -1.952191, -1.056632, 1, 1, 1, 1, 1,
-2.126686, 0.7939015, -0.6063062, 1, 1, 1, 1, 1,
-2.113792, -0.7516865, -0.8680593, 1, 1, 1, 1, 1,
-2.089753, -0.01816618, -1.629593, 1, 1, 1, 1, 1,
-2.052983, 0.02515221, -2.536882, 1, 1, 1, 1, 1,
-2.031948, 0.3310251, 0.3234165, 1, 1, 1, 1, 1,
-1.996731, -1.291156, -0.8892017, 1, 1, 1, 1, 1,
-1.962188, 0.6251014, -1.456329, 1, 1, 1, 1, 1,
-1.961447, -1.860531, -4.379599, 1, 1, 1, 1, 1,
-1.937995, -1.391821, -2.488294, 1, 1, 1, 1, 1,
-1.933772, 0.7983192, 0.4679843, 1, 1, 1, 1, 1,
-1.928589, -1.469393, -2.000169, 0, 0, 1, 1, 1,
-1.925149, -1.137364, -0.9399985, 1, 0, 0, 1, 1,
-1.923325, 2.531791, -1.721328, 1, 0, 0, 1, 1,
-1.879945, 0.6297928, -1.666936, 1, 0, 0, 1, 1,
-1.872125, 0.4821453, -0.9230984, 1, 0, 0, 1, 1,
-1.865088, 0.09219725, -1.579423, 1, 0, 0, 1, 1,
-1.855664, 0.6123623, -1.957844, 0, 0, 0, 1, 1,
-1.853893, -0.8512562, -0.9161241, 0, 0, 0, 1, 1,
-1.841631, -1.105051, -3.111607, 0, 0, 0, 1, 1,
-1.827666, -0.7319822, -1.626916, 0, 0, 0, 1, 1,
-1.819616, -1.685281, -3.608001, 0, 0, 0, 1, 1,
-1.815805, -0.8205081, -2.038088, 0, 0, 0, 1, 1,
-1.795198, -0.4521365, -2.813178, 0, 0, 0, 1, 1,
-1.790195, 0.6563205, -0.5655553, 1, 1, 1, 1, 1,
-1.785027, 0.2828153, -2.113337, 1, 1, 1, 1, 1,
-1.77758, 0.1938699, -0.09430325, 1, 1, 1, 1, 1,
-1.775069, -1.896729, -1.409004, 1, 1, 1, 1, 1,
-1.771197, 0.9157987, -0.6374553, 1, 1, 1, 1, 1,
-1.739199, -0.9134811, -3.132353, 1, 1, 1, 1, 1,
-1.723642, -0.0245984, -2.082659, 1, 1, 1, 1, 1,
-1.720324, 1.414949, -0.6714375, 1, 1, 1, 1, 1,
-1.691446, 0.1855942, -1.241494, 1, 1, 1, 1, 1,
-1.679862, -0.7281207, -1.835721, 1, 1, 1, 1, 1,
-1.678081, 1.767283, -2.009524, 1, 1, 1, 1, 1,
-1.665426, 0.8274434, 0.03426671, 1, 1, 1, 1, 1,
-1.656234, 1.489233, -0.01476987, 1, 1, 1, 1, 1,
-1.650003, -1.564748, -3.134223, 1, 1, 1, 1, 1,
-1.623403, -2.140829, -2.022145, 1, 1, 1, 1, 1,
-1.623381, -0.6585112, -0.7116747, 0, 0, 1, 1, 1,
-1.617946, -0.3001712, -0.6749974, 1, 0, 0, 1, 1,
-1.607602, 0.8608361, 0.1085001, 1, 0, 0, 1, 1,
-1.606178, 1.808593, 0.2042429, 1, 0, 0, 1, 1,
-1.602433, -1.741526, -3.13528, 1, 0, 0, 1, 1,
-1.590806, 0.1238309, -2.03371, 1, 0, 0, 1, 1,
-1.582648, -0.3779324, -3.086242, 0, 0, 0, 1, 1,
-1.551211, 1.032129, -2.5434, 0, 0, 0, 1, 1,
-1.544121, 0.7042271, -0.5790145, 0, 0, 0, 1, 1,
-1.538844, -0.002392575, -0.6373594, 0, 0, 0, 1, 1,
-1.532203, -0.9983532, -3.371892, 0, 0, 0, 1, 1,
-1.531479, -0.9720469, -2.00147, 0, 0, 0, 1, 1,
-1.527229, -0.8302789, -2.911921, 0, 0, 0, 1, 1,
-1.520407, 0.5577692, -2.810422, 1, 1, 1, 1, 1,
-1.516948, 1.240192, -1.205489, 1, 1, 1, 1, 1,
-1.506325, -0.6285617, -2.294691, 1, 1, 1, 1, 1,
-1.505739, 0.710263, -1.111736, 1, 1, 1, 1, 1,
-1.501127, -0.6022015, -0.8206592, 1, 1, 1, 1, 1,
-1.498634, -0.5543411, -2.837308, 1, 1, 1, 1, 1,
-1.490322, -0.4889565, -1.748174, 1, 1, 1, 1, 1,
-1.478329, 0.232179, -0.5229856, 1, 1, 1, 1, 1,
-1.47714, 0.05077846, -2.755229, 1, 1, 1, 1, 1,
-1.466402, 1.151278, -0.3396061, 1, 1, 1, 1, 1,
-1.462863, 0.7238715, -0.8215346, 1, 1, 1, 1, 1,
-1.455506, -0.03923618, -2.328477, 1, 1, 1, 1, 1,
-1.454615, -0.3383653, -1.065327, 1, 1, 1, 1, 1,
-1.454523, -0.3145458, -1.363049, 1, 1, 1, 1, 1,
-1.448189, -0.6409464, -2.84865, 1, 1, 1, 1, 1,
-1.448105, 2.200465, -0.1450993, 0, 0, 1, 1, 1,
-1.443593, -1.891252, -1.993161, 1, 0, 0, 1, 1,
-1.44351, -2.143849, -2.636284, 1, 0, 0, 1, 1,
-1.442558, -0.9692055, -1.288977, 1, 0, 0, 1, 1,
-1.430413, -0.2012741, -1.993761, 1, 0, 0, 1, 1,
-1.429546, 1.005359, -0.2532638, 1, 0, 0, 1, 1,
-1.426116, -0.6787177, -1.615137, 0, 0, 0, 1, 1,
-1.421914, 0.8216935, -1.100087, 0, 0, 0, 1, 1,
-1.419234, 0.3761081, -0.8175191, 0, 0, 0, 1, 1,
-1.397137, 0.08894761, -1.893011, 0, 0, 0, 1, 1,
-1.388155, -0.1721685, -2.710693, 0, 0, 0, 1, 1,
-1.370178, -1.499062, -3.173065, 0, 0, 0, 1, 1,
-1.358588, -0.2006555, 0.1350083, 0, 0, 0, 1, 1,
-1.350875, -1.544366, -2.276179, 1, 1, 1, 1, 1,
-1.340953, -0.8407112, -1.310756, 1, 1, 1, 1, 1,
-1.338706, -0.3922111, -0.9786636, 1, 1, 1, 1, 1,
-1.33283, -0.2513809, -0.9858622, 1, 1, 1, 1, 1,
-1.319282, 1.159658, -2.087895, 1, 1, 1, 1, 1,
-1.318241, 1.250432, -0.9493126, 1, 1, 1, 1, 1,
-1.31715, -1.799438, -3.61315, 1, 1, 1, 1, 1,
-1.300529, 0.1086868, -0.2493125, 1, 1, 1, 1, 1,
-1.300326, -1.482169, -1.858442, 1, 1, 1, 1, 1,
-1.297448, -1.142518, -2.655888, 1, 1, 1, 1, 1,
-1.297434, 0.2442992, -0.6230353, 1, 1, 1, 1, 1,
-1.295081, 2.165304, -0.5846006, 1, 1, 1, 1, 1,
-1.256003, 1.44475, 0.4629692, 1, 1, 1, 1, 1,
-1.254621, 0.407375, -0.4203924, 1, 1, 1, 1, 1,
-1.24948, -0.5020142, -1.84982, 1, 1, 1, 1, 1,
-1.246569, -0.03386576, -2.653979, 0, 0, 1, 1, 1,
-1.244927, 1.227554, -0.7708972, 1, 0, 0, 1, 1,
-1.222306, 0.7466254, -1.967493, 1, 0, 0, 1, 1,
-1.205231, 0.8311875, -1.911662, 1, 0, 0, 1, 1,
-1.2042, -0.6134071, -1.83437, 1, 0, 0, 1, 1,
-1.19664, 0.6434826, -0.7063293, 1, 0, 0, 1, 1,
-1.1953, 0.7343836, -1.941841, 0, 0, 0, 1, 1,
-1.19032, -0.9982507, -2.979482, 0, 0, 0, 1, 1,
-1.18067, -0.755685, -2.790261, 0, 0, 0, 1, 1,
-1.177703, 0.4165153, -1.993837, 0, 0, 0, 1, 1,
-1.175249, -1.525659, -2.707782, 0, 0, 0, 1, 1,
-1.17094, 0.5806446, -1.152242, 0, 0, 0, 1, 1,
-1.167577, 0.2601561, -2.882463, 0, 0, 0, 1, 1,
-1.166343, -1.695551, -3.388394, 1, 1, 1, 1, 1,
-1.158287, 0.03618801, 0.8995517, 1, 1, 1, 1, 1,
-1.158139, -0.8293241, -0.9560294, 1, 1, 1, 1, 1,
-1.153525, -0.2878669, -2.443785, 1, 1, 1, 1, 1,
-1.151994, -0.5196482, -1.371064, 1, 1, 1, 1, 1,
-1.150413, 0.7703625, -1.038115, 1, 1, 1, 1, 1,
-1.146939, 1.861539, -0.8487542, 1, 1, 1, 1, 1,
-1.128961, 0.2659003, -0.5776119, 1, 1, 1, 1, 1,
-1.12811, 0.2711457, -2.684505, 1, 1, 1, 1, 1,
-1.124319, 0.1486605, -2.359281, 1, 1, 1, 1, 1,
-1.121418, 1.905898, -1.805041, 1, 1, 1, 1, 1,
-1.118508, -1.6511, -1.978708, 1, 1, 1, 1, 1,
-1.115004, -0.618821, -3.126596, 1, 1, 1, 1, 1,
-1.11449, -0.5092771, 0.02743284, 1, 1, 1, 1, 1,
-1.111341, -1.270298, -0.5108275, 1, 1, 1, 1, 1,
-1.10864, 2.230276, -0.519619, 0, 0, 1, 1, 1,
-1.10508, -0.3347895, -1.839988, 1, 0, 0, 1, 1,
-1.09938, -0.7147058, -3.091612, 1, 0, 0, 1, 1,
-1.096896, 0.5260109, -0.5662746, 1, 0, 0, 1, 1,
-1.089515, 1.135918, 0.1386443, 1, 0, 0, 1, 1,
-1.089472, -0.3792665, -1.546162, 1, 0, 0, 1, 1,
-1.087167, 0.7790939, -1.398721, 0, 0, 0, 1, 1,
-1.080961, 0.8973706, 0.8910068, 0, 0, 0, 1, 1,
-1.066323, 0.395934, -0.7989988, 0, 0, 0, 1, 1,
-1.064331, 0.09094166, -1.461569, 0, 0, 0, 1, 1,
-1.064053, 0.1223373, 1.73962, 0, 0, 0, 1, 1,
-1.059857, 1.177721, -1.051933, 0, 0, 0, 1, 1,
-1.052749, 0.0578803, -2.449981, 0, 0, 0, 1, 1,
-1.046051, -0.9078761, -1.918451, 1, 1, 1, 1, 1,
-1.041893, 0.9184601, -0.2185663, 1, 1, 1, 1, 1,
-1.028176, 0.2566161, -0.7359911, 1, 1, 1, 1, 1,
-1.023919, -1.20891, -2.530542, 1, 1, 1, 1, 1,
-1.023868, -0.6972326, -1.940459, 1, 1, 1, 1, 1,
-1.019466, -0.6036233, -1.664348, 1, 1, 1, 1, 1,
-1.01885, 0.9957683, -0.262348, 1, 1, 1, 1, 1,
-1.003702, -0.5107352, -3.501173, 1, 1, 1, 1, 1,
-1.00097, 0.01712414, -2.462386, 1, 1, 1, 1, 1,
-0.9922965, 2.197478, -1.358919, 1, 1, 1, 1, 1,
-0.9899738, -1.095196, -2.521505, 1, 1, 1, 1, 1,
-0.9897163, 0.295991, -0.568357, 1, 1, 1, 1, 1,
-0.9881025, 1.25475, -0.7654315, 1, 1, 1, 1, 1,
-0.9872302, -1.293603, -3.119431, 1, 1, 1, 1, 1,
-0.9861652, -0.356325, -1.762774, 1, 1, 1, 1, 1,
-0.9848211, 0.8925537, 2.48548e-05, 0, 0, 1, 1, 1,
-0.9821522, 1.411632, 0.07707385, 1, 0, 0, 1, 1,
-0.9799174, -0.00788266, -1.44615, 1, 0, 0, 1, 1,
-0.9778582, -0.8957867, -2.492311, 1, 0, 0, 1, 1,
-0.9757976, 2.214108, -0.7713166, 1, 0, 0, 1, 1,
-0.9736027, 0.2370758, -2.524058, 1, 0, 0, 1, 1,
-0.9708465, -1.513432, -1.162916, 0, 0, 0, 1, 1,
-0.9701859, -0.3049426, -3.711795, 0, 0, 0, 1, 1,
-0.969725, 0.5301975, -1.746061, 0, 0, 0, 1, 1,
-0.9685183, 0.9927371, -0.4863591, 0, 0, 0, 1, 1,
-0.9564198, -0.3230542, -3.33751, 0, 0, 0, 1, 1,
-0.9445136, -0.5917144, -2.774451, 0, 0, 0, 1, 1,
-0.9432422, -0.5295815, -1.922277, 0, 0, 0, 1, 1,
-0.9389695, -1.019472, -2.993961, 1, 1, 1, 1, 1,
-0.9384518, -1.488959, -2.867432, 1, 1, 1, 1, 1,
-0.9289243, 0.8569934, -0.9071254, 1, 1, 1, 1, 1,
-0.9036211, 0.03783323, -1.480601, 1, 1, 1, 1, 1,
-0.8943002, -1.31916, -1.903859, 1, 1, 1, 1, 1,
-0.8942981, -0.2220652, -1.741122, 1, 1, 1, 1, 1,
-0.8877526, 0.3959264, 0.1375658, 1, 1, 1, 1, 1,
-0.8875535, 2.446497, 0.9027159, 1, 1, 1, 1, 1,
-0.887531, -1.17207, -2.198258, 1, 1, 1, 1, 1,
-0.8836694, 0.1528531, -2.551545, 1, 1, 1, 1, 1,
-0.8768411, -1.455526, -2.226857, 1, 1, 1, 1, 1,
-0.8743498, 0.139466, -1.211715, 1, 1, 1, 1, 1,
-0.8729212, -0.7769246, -3.547506, 1, 1, 1, 1, 1,
-0.8725108, 0.1516861, -2.094933, 1, 1, 1, 1, 1,
-0.8604335, -0.7181346, -2.453901, 1, 1, 1, 1, 1,
-0.8595443, -0.3354036, -2.156952, 0, 0, 1, 1, 1,
-0.8526211, 0.1341851, -2.938983, 1, 0, 0, 1, 1,
-0.8474781, -0.2056746, -0.8840989, 1, 0, 0, 1, 1,
-0.8392568, -0.6308113, -2.865551, 1, 0, 0, 1, 1,
-0.8386148, -0.004314293, -0.6999209, 1, 0, 0, 1, 1,
-0.8379649, 0.1234916, -0.8929299, 1, 0, 0, 1, 1,
-0.8309962, -1.578446, -2.188214, 0, 0, 0, 1, 1,
-0.8287992, 0.05306138, -2.187119, 0, 0, 0, 1, 1,
-0.8224947, 0.9357321, -0.667821, 0, 0, 0, 1, 1,
-0.8220061, 1.11294, -1.615406, 0, 0, 0, 1, 1,
-0.821237, 0.7054939, -1.103366, 0, 0, 0, 1, 1,
-0.8188908, 0.3415635, 0.3858645, 0, 0, 0, 1, 1,
-0.8156258, 0.08886324, -0.5229167, 0, 0, 0, 1, 1,
-0.811879, -1.740776, -3.330369, 1, 1, 1, 1, 1,
-0.8109601, 1.445417, -1.285117, 1, 1, 1, 1, 1,
-0.8080149, 0.3466331, -1.647727, 1, 1, 1, 1, 1,
-0.8033848, -1.029467, -1.69499, 1, 1, 1, 1, 1,
-0.802519, -1.28033, -1.882192, 1, 1, 1, 1, 1,
-0.8004993, -1.548415, -4.547068, 1, 1, 1, 1, 1,
-0.7996783, 1.057497, 0.2515367, 1, 1, 1, 1, 1,
-0.7976997, 0.7655995, -0.2955768, 1, 1, 1, 1, 1,
-0.7973674, 0.1081524, -2.001242, 1, 1, 1, 1, 1,
-0.7920214, 0.2312276, -1.553533, 1, 1, 1, 1, 1,
-0.7876699, -0.2331355, -1.259215, 1, 1, 1, 1, 1,
-0.7828867, 0.4046733, -1.953681, 1, 1, 1, 1, 1,
-0.7691732, 0.9123642, -0.03066652, 1, 1, 1, 1, 1,
-0.7678531, -0.8352628, -1.647695, 1, 1, 1, 1, 1,
-0.7677155, -0.3981035, -2.925005, 1, 1, 1, 1, 1,
-0.7637398, 1.42328, -0.3899436, 0, 0, 1, 1, 1,
-0.7431029, 0.2753004, -2.903072, 1, 0, 0, 1, 1,
-0.7428839, -0.3356606, -4.273423, 1, 0, 0, 1, 1,
-0.7398014, -0.5384337, -1.109848, 1, 0, 0, 1, 1,
-0.7380383, -0.2471476, -2.216547, 1, 0, 0, 1, 1,
-0.7357846, 1.22516, -0.3352924, 1, 0, 0, 1, 1,
-0.7356622, 2.016832, 0.1827824, 0, 0, 0, 1, 1,
-0.734486, -0.5050826, -2.13369, 0, 0, 0, 1, 1,
-0.7215589, 1.122335, -1.896257, 0, 0, 0, 1, 1,
-0.7113284, 0.07199525, -3.229887, 0, 0, 0, 1, 1,
-0.7108619, -0.4530853, -1.966213, 0, 0, 0, 1, 1,
-0.7048635, 1.181809, 0.329106, 0, 0, 0, 1, 1,
-0.7015374, 0.2010481, -0.01848234, 0, 0, 0, 1, 1,
-0.6985162, 2.044554, -0.2117936, 1, 1, 1, 1, 1,
-0.6964647, 0.2881161, -1.451463, 1, 1, 1, 1, 1,
-0.6921741, 0.5736115, -1.750395, 1, 1, 1, 1, 1,
-0.6904156, -0.9875872, -2.832023, 1, 1, 1, 1, 1,
-0.6852781, -0.459163, -1.947135, 1, 1, 1, 1, 1,
-0.6828367, -0.5490915, -0.3140209, 1, 1, 1, 1, 1,
-0.6815819, 0.8049041, -1.474505, 1, 1, 1, 1, 1,
-0.6790646, -0.9726046, -1.805807, 1, 1, 1, 1, 1,
-0.6773161, -1.546984, -3.260032, 1, 1, 1, 1, 1,
-0.6765841, 0.7085376, 0.03454934, 1, 1, 1, 1, 1,
-0.6728473, -1.661986, -1.432575, 1, 1, 1, 1, 1,
-0.6710891, -0.7465916, -3.285315, 1, 1, 1, 1, 1,
-0.6708145, -0.8344328, -2.249527, 1, 1, 1, 1, 1,
-0.6700751, -1.70565, -3.281253, 1, 1, 1, 1, 1,
-0.6651171, 0.7900267, -0.6179246, 1, 1, 1, 1, 1,
-0.6637257, 0.1761769, -1.298248, 0, 0, 1, 1, 1,
-0.6628519, 0.2965374, -0.6569107, 1, 0, 0, 1, 1,
-0.661458, -0.2931601, -2.754066, 1, 0, 0, 1, 1,
-0.6598519, 4.06473, 0.960676, 1, 0, 0, 1, 1,
-0.6571288, 0.5849719, -1.008152, 1, 0, 0, 1, 1,
-0.6509871, -0.1458841, -0.9148416, 1, 0, 0, 1, 1,
-0.6471215, -0.9044319, -1.321086, 0, 0, 0, 1, 1,
-0.645917, -1.163959, -2.932311, 0, 0, 0, 1, 1,
-0.643448, -0.8834437, -4.758269, 0, 0, 0, 1, 1,
-0.6420677, 0.5045205, 0.3969892, 0, 0, 0, 1, 1,
-0.6404322, -0.5281634, -3.531812, 0, 0, 0, 1, 1,
-0.6350167, -0.6492031, -3.458548, 0, 0, 0, 1, 1,
-0.6328824, -0.2275749, -0.7133998, 0, 0, 0, 1, 1,
-0.6325865, 0.9518206, -0.7015644, 1, 1, 1, 1, 1,
-0.6322163, -1.764348, -2.665775, 1, 1, 1, 1, 1,
-0.6286922, 0.2553177, 1.039342, 1, 1, 1, 1, 1,
-0.6225437, -1.234917, -2.382477, 1, 1, 1, 1, 1,
-0.6209339, -0.3172371, -3.779111, 1, 1, 1, 1, 1,
-0.6208679, 0.1644905, -2.43062, 1, 1, 1, 1, 1,
-0.6208078, 0.5054795, -0.8984711, 1, 1, 1, 1, 1,
-0.6203718, -0.2585073, -0.1726513, 1, 1, 1, 1, 1,
-0.6125782, -1.747159, -2.890079, 1, 1, 1, 1, 1,
-0.6120571, -0.1043968, -1.775271, 1, 1, 1, 1, 1,
-0.6071855, -0.8450221, -2.508435, 1, 1, 1, 1, 1,
-0.6070384, 0.2694804, -1.677371, 1, 1, 1, 1, 1,
-0.6051464, -1.878893, -1.912416, 1, 1, 1, 1, 1,
-0.6048986, 0.3111833, -2.570103, 1, 1, 1, 1, 1,
-0.6029135, -1.853794, -1.937113, 1, 1, 1, 1, 1,
-0.5999476, -0.7010015, -1.872051, 0, 0, 1, 1, 1,
-0.594482, 1.905971, -1.485668, 1, 0, 0, 1, 1,
-0.5939893, 0.211328, -1.543679, 1, 0, 0, 1, 1,
-0.5929429, 1.410639, 1.173123, 1, 0, 0, 1, 1,
-0.5807598, 1.241694, -1.378118, 1, 0, 0, 1, 1,
-0.579051, -0.01702289, -1.886427, 1, 0, 0, 1, 1,
-0.5789474, -0.9382993, -1.769513, 0, 0, 0, 1, 1,
-0.5785078, -1.571037, -2.707372, 0, 0, 0, 1, 1,
-0.5767803, 1.318924, -0.8348601, 0, 0, 0, 1, 1,
-0.5741923, 0.5666832, -1.970628, 0, 0, 0, 1, 1,
-0.5684524, -0.7191187, -2.141277, 0, 0, 0, 1, 1,
-0.5681925, -0.1735986, -0.1256163, 0, 0, 0, 1, 1,
-0.5675622, 0.5500647, -1.809238, 0, 0, 0, 1, 1,
-0.564145, -1.278245, -3.486605, 1, 1, 1, 1, 1,
-0.5639709, -0.1118724, -3.321697, 1, 1, 1, 1, 1,
-0.5635884, 0.8108214, -1.715241, 1, 1, 1, 1, 1,
-0.5591789, 0.1342549, -0.3615802, 1, 1, 1, 1, 1,
-0.5590128, 0.4351433, -0.8494933, 1, 1, 1, 1, 1,
-0.5565132, -0.05919472, -3.265802, 1, 1, 1, 1, 1,
-0.5552018, -1.12587, -2.23345, 1, 1, 1, 1, 1,
-0.5530161, -0.306187, -0.3551663, 1, 1, 1, 1, 1,
-0.5496404, -0.9030857, -1.758966, 1, 1, 1, 1, 1,
-0.5437645, 0.6498714, -0.3808294, 1, 1, 1, 1, 1,
-0.5433489, -0.7888884, -2.410858, 1, 1, 1, 1, 1,
-0.5393311, -0.5139872, -3.130874, 1, 1, 1, 1, 1,
-0.5386919, 1.546312, 1.179852, 1, 1, 1, 1, 1,
-0.5385834, 0.2041049, -1.344471, 1, 1, 1, 1, 1,
-0.5342075, 1.723604, 0.7753524, 1, 1, 1, 1, 1,
-0.5317013, -0.9180393, -1.734971, 0, 0, 1, 1, 1,
-0.5305584, -1.175326, -3.991914, 1, 0, 0, 1, 1,
-0.5284674, 0.8241664, -1.86167, 1, 0, 0, 1, 1,
-0.5284184, 0.2925632, -2.303863, 1, 0, 0, 1, 1,
-0.5268269, -0.2681406, -1.594769, 1, 0, 0, 1, 1,
-0.5236434, -0.9982969, -1.684883, 1, 0, 0, 1, 1,
-0.5182747, -0.1195034, -1.176336, 0, 0, 0, 1, 1,
-0.5173011, 0.01718383, 0.4476352, 0, 0, 0, 1, 1,
-0.5131572, -0.9560725, -2.284758, 0, 0, 0, 1, 1,
-0.5091873, -0.460612, -1.988007, 0, 0, 0, 1, 1,
-0.5088934, -0.1784235, -3.127843, 0, 0, 0, 1, 1,
-0.5085807, -0.2687666, -0.570188, 0, 0, 0, 1, 1,
-0.5065663, -0.1379917, -1.186773, 0, 0, 0, 1, 1,
-0.5060685, -1.493724, -1.374299, 1, 1, 1, 1, 1,
-0.4991789, 0.587854, -0.577589, 1, 1, 1, 1, 1,
-0.4988202, 1.965589, -0.48167, 1, 1, 1, 1, 1,
-0.4944714, -0.7862403, -3.115678, 1, 1, 1, 1, 1,
-0.4935922, -1.774172, -3.014776, 1, 1, 1, 1, 1,
-0.4932721, -0.7162396, -1.377477, 1, 1, 1, 1, 1,
-0.4920518, 0.3642094, 0.4675669, 1, 1, 1, 1, 1,
-0.4878048, -0.3377572, -1.820625, 1, 1, 1, 1, 1,
-0.4867139, -1.794585, -1.344439, 1, 1, 1, 1, 1,
-0.4828393, 0.3330447, 0.163148, 1, 1, 1, 1, 1,
-0.4785078, 0.04530242, -2.087287, 1, 1, 1, 1, 1,
-0.47654, -0.1843372, -1.558646, 1, 1, 1, 1, 1,
-0.4722321, 1.097261, -2.011573, 1, 1, 1, 1, 1,
-0.4688773, -1.61886, -2.288904, 1, 1, 1, 1, 1,
-0.4614096, 0.4452005, -0.9710042, 1, 1, 1, 1, 1,
-0.4584877, 0.6128969, -1.886046, 0, 0, 1, 1, 1,
-0.4570505, 1.512796, -0.6856421, 1, 0, 0, 1, 1,
-0.4564142, -1.361277, -3.002407, 1, 0, 0, 1, 1,
-0.4554188, 0.1612364, -2.2339, 1, 0, 0, 1, 1,
-0.4541905, -1.623205, -3.349099, 1, 0, 0, 1, 1,
-0.4496539, -0.4502323, -2.829188, 1, 0, 0, 1, 1,
-0.4488003, -0.521982, -4.913175, 0, 0, 0, 1, 1,
-0.4410938, 1.445022, -2.045167, 0, 0, 0, 1, 1,
-0.4404977, 1.531129, -0.8106167, 0, 0, 0, 1, 1,
-0.440346, -0.6211853, -3.781873, 0, 0, 0, 1, 1,
-0.4385675, 0.8744463, -0.3810433, 0, 0, 0, 1, 1,
-0.4356432, 0.5668216, -0.1843641, 0, 0, 0, 1, 1,
-0.4347975, 0.8130432, -0.6605219, 0, 0, 0, 1, 1,
-0.4329502, 0.3459969, 0.9170711, 1, 1, 1, 1, 1,
-0.4309278, -1.833444, -2.566321, 1, 1, 1, 1, 1,
-0.4305018, -0.2467602, -2.936355, 1, 1, 1, 1, 1,
-0.4300894, -0.556821, -4.510193, 1, 1, 1, 1, 1,
-0.4288446, 0.3767194, -0.1463565, 1, 1, 1, 1, 1,
-0.4273689, 0.08022466, 0.949623, 1, 1, 1, 1, 1,
-0.4265956, -2.136447, -2.560744, 1, 1, 1, 1, 1,
-0.4240498, 1.490964, -0.2420251, 1, 1, 1, 1, 1,
-0.4209615, 0.7535828, -0.6837845, 1, 1, 1, 1, 1,
-0.4207641, -0.01566534, -0.7092968, 1, 1, 1, 1, 1,
-0.4205305, -0.4924647, -1.997726, 1, 1, 1, 1, 1,
-0.4198048, -0.1914988, -2.625909, 1, 1, 1, 1, 1,
-0.4187897, -1.238788, -3.055626, 1, 1, 1, 1, 1,
-0.4170888, -0.6299374, -1.128453, 1, 1, 1, 1, 1,
-0.4164457, -0.5020902, -2.397918, 1, 1, 1, 1, 1,
-0.4107271, 0.06201428, -0.4959033, 0, 0, 1, 1, 1,
-0.408988, -1.175838, -3.281741, 1, 0, 0, 1, 1,
-0.4067985, 0.966368, -0.8452691, 1, 0, 0, 1, 1,
-0.4060319, -1.079674, -2.077348, 1, 0, 0, 1, 1,
-0.4044843, 1.108693, 1.700974, 1, 0, 0, 1, 1,
-0.4012299, 0.9656648, -0.1535289, 1, 0, 0, 1, 1,
-0.3988531, 0.2886502, -1.10294, 0, 0, 0, 1, 1,
-0.3951628, 0.1039668, -2.270871, 0, 0, 0, 1, 1,
-0.3951021, 1.986393, -0.7433698, 0, 0, 0, 1, 1,
-0.3932866, 1.001746, -1.79817, 0, 0, 0, 1, 1,
-0.3917634, 1.081212, -1.618023, 0, 0, 0, 1, 1,
-0.3860791, 1.777768, 0.3885483, 0, 0, 0, 1, 1,
-0.3854787, 0.3421261, -0.8505351, 0, 0, 0, 1, 1,
-0.377923, 0.2825103, -0.602365, 1, 1, 1, 1, 1,
-0.3671088, 2.033963, 0.5918277, 1, 1, 1, 1, 1,
-0.3551486, 1.731997, 1.358953, 1, 1, 1, 1, 1,
-0.3537508, 0.5655732, -1.40246, 1, 1, 1, 1, 1,
-0.3526088, -1.526901, -2.976913, 1, 1, 1, 1, 1,
-0.3442777, 1.176989, -0.2067952, 1, 1, 1, 1, 1,
-0.342407, -0.4259864, -2.970195, 1, 1, 1, 1, 1,
-0.3414709, -0.7314173, -3.565832, 1, 1, 1, 1, 1,
-0.3390324, -0.8897648, -4.403888, 1, 1, 1, 1, 1,
-0.3350069, -0.2365608, -3.790977, 1, 1, 1, 1, 1,
-0.3340135, 1.454825, -1.787818, 1, 1, 1, 1, 1,
-0.3294016, -0.7581573, -1.884398, 1, 1, 1, 1, 1,
-0.3229876, 0.8936306, -0.01928953, 1, 1, 1, 1, 1,
-0.3219404, -0.1357832, -1.051236, 1, 1, 1, 1, 1,
-0.3199568, -0.7214524, -4.315646, 1, 1, 1, 1, 1,
-0.3123146, 0.1386453, -2.576087, 0, 0, 1, 1, 1,
-0.3091371, 0.5593598, -1.269663, 1, 0, 0, 1, 1,
-0.3090836, -2.278344, -3.315868, 1, 0, 0, 1, 1,
-0.3008842, 0.2261645, -1.506953, 1, 0, 0, 1, 1,
-0.2953421, 0.66684, 0.2090434, 1, 0, 0, 1, 1,
-0.2952455, 1.590716, 0.07931537, 1, 0, 0, 1, 1,
-0.2912373, 0.3126281, -0.8636536, 0, 0, 0, 1, 1,
-0.2866563, -1.399572, -3.687757, 0, 0, 0, 1, 1,
-0.285787, -0.800795, -1.860806, 0, 0, 0, 1, 1,
-0.2850111, 0.4503411, -0.9536709, 0, 0, 0, 1, 1,
-0.2811057, -0.3096437, -0.5738095, 0, 0, 0, 1, 1,
-0.2806368, -0.09563955, -1.824706, 0, 0, 0, 1, 1,
-0.2750355, -0.7351916, -2.601542, 0, 0, 0, 1, 1,
-0.2731673, -0.5011756, -3.019451, 1, 1, 1, 1, 1,
-0.2713414, 0.4114007, -0.6420102, 1, 1, 1, 1, 1,
-0.2692592, -0.6696399, -1.969887, 1, 1, 1, 1, 1,
-0.2681217, -0.03982686, -1.812945, 1, 1, 1, 1, 1,
-0.2680607, -0.9363455, -2.658874, 1, 1, 1, 1, 1,
-0.2679954, -0.7744123, -3.931869, 1, 1, 1, 1, 1,
-0.2654808, 0.1383138, 1.466222, 1, 1, 1, 1, 1,
-0.262317, 1.503099, -0.5204601, 1, 1, 1, 1, 1,
-0.2622473, 1.057299, -1.747693, 1, 1, 1, 1, 1,
-0.2617426, -1.272077, -4.15237, 1, 1, 1, 1, 1,
-0.2611358, -0.3113539, -1.196962, 1, 1, 1, 1, 1,
-0.2586036, -1.093927, -2.275288, 1, 1, 1, 1, 1,
-0.2584254, 0.01973244, -2.248992, 1, 1, 1, 1, 1,
-0.2561136, 0.7953343, 1.142108, 1, 1, 1, 1, 1,
-0.2551286, 0.5586975, -0.5379834, 1, 1, 1, 1, 1,
-0.2486361, 0.5738075, -1.054741, 0, 0, 1, 1, 1,
-0.2480613, -0.767413, -1.849626, 1, 0, 0, 1, 1,
-0.2452135, 1.698051, -0.3309663, 1, 0, 0, 1, 1,
-0.2447525, -0.9889989, -4.269077, 1, 0, 0, 1, 1,
-0.2418756, 1.021561, -1.852921, 1, 0, 0, 1, 1,
-0.2390534, -0.192166, -1.740306, 1, 0, 0, 1, 1,
-0.2347454, 0.4454765, -0.7383499, 0, 0, 0, 1, 1,
-0.2322864, 0.7907195, 0.1969474, 0, 0, 0, 1, 1,
-0.2320019, 0.5173612, -0.7966188, 0, 0, 0, 1, 1,
-0.2182252, 0.9132805, 0.5961472, 0, 0, 0, 1, 1,
-0.2165386, 0.3417007, -0.9774469, 0, 0, 0, 1, 1,
-0.2155563, 2.071246, -0.3806648, 0, 0, 0, 1, 1,
-0.2140256, -0.4430155, -2.987777, 0, 0, 0, 1, 1,
-0.2126824, -0.03024406, -1.802684, 1, 1, 1, 1, 1,
-0.2113002, -2.070009, -2.1341, 1, 1, 1, 1, 1,
-0.2107823, -1.737782, -3.41016, 1, 1, 1, 1, 1,
-0.2106576, 1.028486, -0.4229633, 1, 1, 1, 1, 1,
-0.2073505, 0.6639791, 0.9938285, 1, 1, 1, 1, 1,
-0.2045081, 0.627862, 1.576484, 1, 1, 1, 1, 1,
-0.2035077, 2.158276, -0.1042584, 1, 1, 1, 1, 1,
-0.2024784, 1.732328, 0.158808, 1, 1, 1, 1, 1,
-0.2006101, 0.3509625, -2.08425, 1, 1, 1, 1, 1,
-0.1955271, 0.7239016, -0.7223145, 1, 1, 1, 1, 1,
-0.1929791, 0.7053993, -1.331748, 1, 1, 1, 1, 1,
-0.1913453, 0.2777581, 1.204014, 1, 1, 1, 1, 1,
-0.1887398, -1.682069, -2.819661, 1, 1, 1, 1, 1,
-0.1873606, -0.3171198, -0.4998489, 1, 1, 1, 1, 1,
-0.1632069, -1.866945, -3.351102, 1, 1, 1, 1, 1,
-0.1631745, 0.0651628, 0.199193, 0, 0, 1, 1, 1,
-0.1620303, -1.380307, -3.557494, 1, 0, 0, 1, 1,
-0.1606354, 0.5339439, -0.7796798, 1, 0, 0, 1, 1,
-0.1587938, 0.4610079, -1.369575, 1, 0, 0, 1, 1,
-0.1536607, 0.005023659, 0.2048207, 1, 0, 0, 1, 1,
-0.1516684, -0.9734426, -3.642418, 1, 0, 0, 1, 1,
-0.1498391, -1.68204, -1.501981, 0, 0, 0, 1, 1,
-0.1423206, 2.327938, -0.9250411, 0, 0, 0, 1, 1,
-0.1355648, -1.733213, -3.776985, 0, 0, 0, 1, 1,
-0.1337791, -0.767776, -3.496237, 0, 0, 0, 1, 1,
-0.1337514, 1.346462, 0.3177926, 0, 0, 0, 1, 1,
-0.1334281, -0.8905486, -2.555768, 0, 0, 0, 1, 1,
-0.1325259, 0.9392231, 0.8109279, 0, 0, 0, 1, 1,
-0.1306909, 0.2983565, 1.348037, 1, 1, 1, 1, 1,
-0.123859, 0.4966138, -1.514134, 1, 1, 1, 1, 1,
-0.120925, 0.9423304, -0.7341802, 1, 1, 1, 1, 1,
-0.1207197, -1.24331, -3.857097, 1, 1, 1, 1, 1,
-0.1202564, 0.5673134, 2.102839, 1, 1, 1, 1, 1,
-0.115551, -0.9322026, -2.580643, 1, 1, 1, 1, 1,
-0.1091648, 0.4451088, -0.644887, 1, 1, 1, 1, 1,
-0.1067684, -0.4961931, -3.3211, 1, 1, 1, 1, 1,
-0.1060066, -0.9260321, -1.450625, 1, 1, 1, 1, 1,
-0.105217, -0.6961163, -1.223356, 1, 1, 1, 1, 1,
-0.1035475, 0.9804822, -0.6415654, 1, 1, 1, 1, 1,
-0.09058129, -1.041423, -3.284732, 1, 1, 1, 1, 1,
-0.08411077, 0.5374508, 0.1991031, 1, 1, 1, 1, 1,
-0.08401379, -0.03921898, -3.182909, 1, 1, 1, 1, 1,
-0.07857942, -0.8317838, -2.079642, 1, 1, 1, 1, 1,
-0.07747587, 0.07550334, -1.828125, 0, 0, 1, 1, 1,
-0.07374067, 0.2726272, 0.1524126, 1, 0, 0, 1, 1,
-0.0713953, 1.206751, 0.3300597, 1, 0, 0, 1, 1,
-0.07085959, 0.7610089, -0.6301075, 1, 0, 0, 1, 1,
-0.06492174, 1.101387, -0.7495729, 1, 0, 0, 1, 1,
-0.05372396, -0.4844183, -4.172966, 1, 0, 0, 1, 1,
-0.05295038, -1.493587, -2.605016, 0, 0, 0, 1, 1,
-0.04551781, -1.841607, -3.528114, 0, 0, 0, 1, 1,
-0.04512217, 0.4552915, -0.7040797, 0, 0, 0, 1, 1,
-0.0418594, 0.7453637, -2.063456, 0, 0, 0, 1, 1,
-0.04177838, 0.4565061, -1.451818, 0, 0, 0, 1, 1,
-0.04044287, -1.315319, -2.583434, 0, 0, 0, 1, 1,
-0.03950447, 0.2231023, -0.2945966, 0, 0, 0, 1, 1,
-0.03736253, 0.7642635, 0.03801261, 1, 1, 1, 1, 1,
-0.03677433, -0.8177302, -1.763661, 1, 1, 1, 1, 1,
-0.03119012, -0.1931891, -3.48925, 1, 1, 1, 1, 1,
-0.03057988, -0.1918491, -2.645464, 1, 1, 1, 1, 1,
-0.03023844, 1.108844, -0.6383798, 1, 1, 1, 1, 1,
-0.02843107, -1.688746, -2.109327, 1, 1, 1, 1, 1,
-0.02104509, 0.6715513, -0.03920525, 1, 1, 1, 1, 1,
-0.01909542, -0.3269297, -4.676162, 1, 1, 1, 1, 1,
-0.01374603, 0.9049289, -0.2340919, 1, 1, 1, 1, 1,
-0.01110273, 0.5462822, -0.1474057, 1, 1, 1, 1, 1,
-0.009238782, 1.123158, -0.313133, 1, 1, 1, 1, 1,
-0.008632594, -0.4602617, -3.49694, 1, 1, 1, 1, 1,
-0.006886032, -1.496183, -3.223642, 1, 1, 1, 1, 1,
-0.004716222, -0.6918192, -1.084925, 1, 1, 1, 1, 1,
-0.004126973, -0.3909095, -4.638189, 1, 1, 1, 1, 1,
-0.00346139, 0.4262474, -0.6389568, 0, 0, 1, 1, 1,
-0.001653534, 0.5415365, 0.3445031, 1, 0, 0, 1, 1,
0.0003484427, 0.6424749, -0.5494337, 1, 0, 0, 1, 1,
0.002741811, 0.7911932, 0.4656385, 1, 0, 0, 1, 1,
0.003000941, 1.7873, -0.4706623, 1, 0, 0, 1, 1,
0.003720941, 1.111624, 0.5930514, 1, 0, 0, 1, 1,
0.01040298, 2.178412, -0.3818878, 0, 0, 0, 1, 1,
0.01190272, 0.756817, -0.1441638, 0, 0, 0, 1, 1,
0.01205966, 2.105196, 1.297976, 0, 0, 0, 1, 1,
0.01223384, 0.6712424, 0.7775103, 0, 0, 0, 1, 1,
0.01259922, 1.172362, 1.041038, 0, 0, 0, 1, 1,
0.01545568, 1.586139, -1.186613, 0, 0, 0, 1, 1,
0.01568049, -1.120414, 3.500012, 0, 0, 0, 1, 1,
0.01665153, 0.6469347, 1.464294, 1, 1, 1, 1, 1,
0.01966304, 1.225063, -0.7730113, 1, 1, 1, 1, 1,
0.02268451, -2.002829, 2.31147, 1, 1, 1, 1, 1,
0.02381864, -0.07835831, 4.206014, 1, 1, 1, 1, 1,
0.02459013, 0.1057029, -0.1584928, 1, 1, 1, 1, 1,
0.02599259, 0.2758943, -0.3159753, 1, 1, 1, 1, 1,
0.02934317, 2.242884, 0.3213226, 1, 1, 1, 1, 1,
0.02936548, 0.8223644, -0.1132118, 1, 1, 1, 1, 1,
0.02954765, 0.93405, -1.067698, 1, 1, 1, 1, 1,
0.02989146, -1.425509, 3.937083, 1, 1, 1, 1, 1,
0.03130873, 0.3395565, -0.1527656, 1, 1, 1, 1, 1,
0.03170586, 0.2377038, 0.4872576, 1, 1, 1, 1, 1,
0.03243152, -0.2495397, 3.442265, 1, 1, 1, 1, 1,
0.0328012, 0.2493165, -0.3807819, 1, 1, 1, 1, 1,
0.03390953, -0.5413686, 3.320539, 1, 1, 1, 1, 1,
0.03761702, -0.4305373, 1.624485, 0, 0, 1, 1, 1,
0.0426359, 0.1040605, 0.4126015, 1, 0, 0, 1, 1,
0.0452165, -2.588577, 2.643899, 1, 0, 0, 1, 1,
0.0456191, -1.643527, 3.484553, 1, 0, 0, 1, 1,
0.0531312, -3.109594, 4.244804, 1, 0, 0, 1, 1,
0.05346331, 0.7504661, 1.07855, 1, 0, 0, 1, 1,
0.05347955, 0.2600065, 1.282337, 0, 0, 0, 1, 1,
0.07104936, 0.7792658, 0.2003816, 0, 0, 0, 1, 1,
0.07530867, -1.629331, 3.252103, 0, 0, 0, 1, 1,
0.07592227, -0.5395154, 2.866525, 0, 0, 0, 1, 1,
0.07703844, 0.126644, 3.270629, 0, 0, 0, 1, 1,
0.07940063, -1.261128, 3.444205, 0, 0, 0, 1, 1,
0.07954072, 0.7324032, 2.504678, 0, 0, 0, 1, 1,
0.07995832, 0.9106559, -1.25251, 1, 1, 1, 1, 1,
0.0818677, 0.9179877, -1.182526, 1, 1, 1, 1, 1,
0.08283807, 1.309405, 0.2247219, 1, 1, 1, 1, 1,
0.08890613, -1.136359, 3.69462, 1, 1, 1, 1, 1,
0.08919427, 0.661531, -0.658575, 1, 1, 1, 1, 1,
0.0900269, -0.1285921, 1.838488, 1, 1, 1, 1, 1,
0.1057881, 2.257067, -0.3942102, 1, 1, 1, 1, 1,
0.1145511, 0.0541247, 1.03555, 1, 1, 1, 1, 1,
0.1159611, -0.2025391, 1.841318, 1, 1, 1, 1, 1,
0.1168551, -0.9564173, 4.25572, 1, 1, 1, 1, 1,
0.1201469, 0.7027948, 0.133183, 1, 1, 1, 1, 1,
0.1341937, 0.4592349, -0.03896058, 1, 1, 1, 1, 1,
0.1398035, -2.155366, 2.716408, 1, 1, 1, 1, 1,
0.1434828, -1.738343, 2.7426, 1, 1, 1, 1, 1,
0.1505603, -0.1053041, 1.040604, 1, 1, 1, 1, 1,
0.153457, 0.9307002, -0.2487833, 0, 0, 1, 1, 1,
0.1585706, -0.6439255, 3.900931, 1, 0, 0, 1, 1,
0.1596049, 0.6808293, -0.2114522, 1, 0, 0, 1, 1,
0.1597222, 0.3119126, -0.4688946, 1, 0, 0, 1, 1,
0.1647705, 1.255861, 0.579031, 1, 0, 0, 1, 1,
0.1653927, -0.7963343, 3.242522, 1, 0, 0, 1, 1,
0.1659813, 0.3727893, -0.1848712, 0, 0, 0, 1, 1,
0.1684472, 2.472231, 1.650369, 0, 0, 0, 1, 1,
0.1694434, -1.232859, 2.258932, 0, 0, 0, 1, 1,
0.1697647, -0.4518332, 3.13256, 0, 0, 0, 1, 1,
0.1774936, 1.176201, 1.57278, 0, 0, 0, 1, 1,
0.1780207, -1.959566, 2.927901, 0, 0, 0, 1, 1,
0.1783376, -1.164231, 1.790586, 0, 0, 0, 1, 1,
0.1787885, 0.6160133, 0.3981519, 1, 1, 1, 1, 1,
0.180473, -0.6849521, 4.475917, 1, 1, 1, 1, 1,
0.1852007, -0.796181, 3.759895, 1, 1, 1, 1, 1,
0.1854551, -1.758981, 2.304723, 1, 1, 1, 1, 1,
0.1858438, 1.776245, -1.265764, 1, 1, 1, 1, 1,
0.1873914, 1.802006, 0.6599674, 1, 1, 1, 1, 1,
0.1946225, 0.08706503, 1.89413, 1, 1, 1, 1, 1,
0.1955434, 0.9261687, -0.3834796, 1, 1, 1, 1, 1,
0.198133, -0.5522388, 3.028789, 1, 1, 1, 1, 1,
0.1996203, -0.05755243, 3.066469, 1, 1, 1, 1, 1,
0.2031322, -3.277894, 2.204565, 1, 1, 1, 1, 1,
0.2033032, -2.308475, 3.453542, 1, 1, 1, 1, 1,
0.2064756, 0.8175737, -1.216521, 1, 1, 1, 1, 1,
0.207415, -2.184482, 1.146757, 1, 1, 1, 1, 1,
0.2099508, -0.8461816, 2.768664, 1, 1, 1, 1, 1,
0.2102586, 0.3495976, 2.07015, 0, 0, 1, 1, 1,
0.2170665, 0.2979224, 2.527218, 1, 0, 0, 1, 1,
0.2225574, -0.7132375, 2.114755, 1, 0, 0, 1, 1,
0.2230165, 0.1315997, 0.9505442, 1, 0, 0, 1, 1,
0.2284752, -0.0005730073, 0.3372904, 1, 0, 0, 1, 1,
0.2342787, -0.9262804, 3.653021, 1, 0, 0, 1, 1,
0.2379077, 1.152945, -0.6367704, 0, 0, 0, 1, 1,
0.2379415, -0.9292769, 2.034916, 0, 0, 0, 1, 1,
0.2391159, -1.287425, 2.970837, 0, 0, 0, 1, 1,
0.2402169, -0.1471388, 4.143551, 0, 0, 0, 1, 1,
0.2403886, -2.895019, 3.121973, 0, 0, 0, 1, 1,
0.2414064, -1.138109, 3.517381, 0, 0, 0, 1, 1,
0.242642, -0.8533579, 1.890415, 0, 0, 0, 1, 1,
0.2483853, -0.1935011, 2.161433, 1, 1, 1, 1, 1,
0.2497494, 0.4817176, 1.048359, 1, 1, 1, 1, 1,
0.2522463, 0.8822326, 0.6717383, 1, 1, 1, 1, 1,
0.2526262, 1.259802, -1.939082, 1, 1, 1, 1, 1,
0.2575894, -0.4190837, 1.263891, 1, 1, 1, 1, 1,
0.2623069, -0.2530529, 2.774787, 1, 1, 1, 1, 1,
0.2641888, -1.259427, 2.399546, 1, 1, 1, 1, 1,
0.264986, 0.2800244, 0.7514744, 1, 1, 1, 1, 1,
0.2684274, -0.9836268, 2.694966, 1, 1, 1, 1, 1,
0.2693112, -1.014537, 2.553186, 1, 1, 1, 1, 1,
0.2693505, -1.134422, 2.946778, 1, 1, 1, 1, 1,
0.2701092, 2.057236, 0.2022752, 1, 1, 1, 1, 1,
0.272964, 0.5947896, 1.709342, 1, 1, 1, 1, 1,
0.2730678, -1.854297, 2.007921, 1, 1, 1, 1, 1,
0.2741996, 0.5218773, 0.09610552, 1, 1, 1, 1, 1,
0.2750817, -0.04252769, 3.534445, 0, 0, 1, 1, 1,
0.2754311, -0.4822389, 1.768352, 1, 0, 0, 1, 1,
0.2801436, 2.08401, 0.3216284, 1, 0, 0, 1, 1,
0.2828098, -0.2259419, 2.79213, 1, 0, 0, 1, 1,
0.2886564, 1.685861, 0.001931439, 1, 0, 0, 1, 1,
0.2894017, -0.4100715, 2.595494, 1, 0, 0, 1, 1,
0.291971, -0.1335429, 1.419278, 0, 0, 0, 1, 1,
0.2941391, -0.6945445, 2.800324, 0, 0, 0, 1, 1,
0.2956386, -0.4104204, 2.611841, 0, 0, 0, 1, 1,
0.2968484, 0.9096645, 0.04011235, 0, 0, 0, 1, 1,
0.2981654, -0.1092592, 3.218302, 0, 0, 0, 1, 1,
0.3005312, -0.874328, 1.787575, 0, 0, 0, 1, 1,
0.3064184, -0.3765852, 1.776334, 0, 0, 0, 1, 1,
0.3086282, 2.334051, -0.6955437, 1, 1, 1, 1, 1,
0.3086934, 0.3471959, 0.877344, 1, 1, 1, 1, 1,
0.3166824, 0.5273032, 0.7694898, 1, 1, 1, 1, 1,
0.319847, 0.5855427, -1.196779, 1, 1, 1, 1, 1,
0.3214002, 0.9623861, -0.3475384, 1, 1, 1, 1, 1,
0.3214602, -1.236363, 3.122528, 1, 1, 1, 1, 1,
0.3236919, 0.8928748, 0.3774371, 1, 1, 1, 1, 1,
0.3242739, 1.173105, 1.961575, 1, 1, 1, 1, 1,
0.325796, 0.7855206, -1.549677, 1, 1, 1, 1, 1,
0.3286389, -0.5420935, 3.87022, 1, 1, 1, 1, 1,
0.3291981, 0.9061205, 0.03996816, 1, 1, 1, 1, 1,
0.3329531, -0.789551, 3.006207, 1, 1, 1, 1, 1,
0.3354125, 1.504429, -0.2091854, 1, 1, 1, 1, 1,
0.3354742, 0.1470612, 0.4536022, 1, 1, 1, 1, 1,
0.3359496, -0.03435958, 1.984896, 1, 1, 1, 1, 1,
0.339609, 0.1122882, 2.578233, 0, 0, 1, 1, 1,
0.3406112, 0.1160962, 0.9218693, 1, 0, 0, 1, 1,
0.343923, 0.8691748, -0.7092532, 1, 0, 0, 1, 1,
0.3464982, -0.2615167, 3.463129, 1, 0, 0, 1, 1,
0.3539319, 0.01341393, 0.2088375, 1, 0, 0, 1, 1,
0.3550001, 0.6484686, 1.719675, 1, 0, 0, 1, 1,
0.35841, -1.093778, 2.712269, 0, 0, 0, 1, 1,
0.3595914, 0.2965868, 0.7559993, 0, 0, 0, 1, 1,
0.3597261, -0.3664719, 0.2135171, 0, 0, 0, 1, 1,
0.3621933, -0.7994097, 4.074392, 0, 0, 0, 1, 1,
0.3634312, -0.4711669, 1.868112, 0, 0, 0, 1, 1,
0.367178, -0.4902815, 5.665614, 0, 0, 0, 1, 1,
0.3676995, 1.124618, 0.5409857, 0, 0, 0, 1, 1,
0.3700265, -0.3432678, 2.216779, 1, 1, 1, 1, 1,
0.370964, -0.9239028, 1.493651, 1, 1, 1, 1, 1,
0.3717858, 0.04309753, -0.5827916, 1, 1, 1, 1, 1,
0.3725821, -0.7541389, 3.105365, 1, 1, 1, 1, 1,
0.3750609, 1.852263, -0.1893687, 1, 1, 1, 1, 1,
0.3757166, -0.3682326, 1.71954, 1, 1, 1, 1, 1,
0.3803372, -0.9132338, 3.237932, 1, 1, 1, 1, 1,
0.3891201, -0.1789327, 1.529767, 1, 1, 1, 1, 1,
0.3911045, 0.4737735, 2.68575, 1, 1, 1, 1, 1,
0.3911529, 0.5982163, 0.06151957, 1, 1, 1, 1, 1,
0.3947859, 0.6308045, 1.622589, 1, 1, 1, 1, 1,
0.3968361, -0.3283259, 3.549222, 1, 1, 1, 1, 1,
0.3980676, 0.3867482, 1.516015, 1, 1, 1, 1, 1,
0.3988914, -0.1373339, 2.212291, 1, 1, 1, 1, 1,
0.3995387, -0.6017848, 2.531287, 1, 1, 1, 1, 1,
0.4000858, -0.02209055, 2.848381, 0, 0, 1, 1, 1,
0.400308, -0.4587375, 2.765709, 1, 0, 0, 1, 1,
0.4010627, 1.32198, -0.845826, 1, 0, 0, 1, 1,
0.4096909, -0.2352141, 0.4243988, 1, 0, 0, 1, 1,
0.4132557, 1.529599, 1.284865, 1, 0, 0, 1, 1,
0.4166724, -0.5994092, 0.3926637, 1, 0, 0, 1, 1,
0.4171279, -1.302057, 3.865564, 0, 0, 0, 1, 1,
0.4194766, -2.136863, 3.610825, 0, 0, 0, 1, 1,
0.4223169, -0.03919462, -0.3372705, 0, 0, 0, 1, 1,
0.425645, -1.547526, 2.445239, 0, 0, 0, 1, 1,
0.427383, -0.3596807, 0.6623789, 0, 0, 0, 1, 1,
0.430268, 1.339342, -0.1091618, 0, 0, 0, 1, 1,
0.4310529, -2.363154, 2.506268, 0, 0, 0, 1, 1,
0.4322637, 0.3706302, 1.95462, 1, 1, 1, 1, 1,
0.4322926, 1.286082, 1.223515, 1, 1, 1, 1, 1,
0.4339306, 1.326754, -1.701205, 1, 1, 1, 1, 1,
0.4373021, -1.257103, 3.625646, 1, 1, 1, 1, 1,
0.4422736, 0.2483254, 0.6537487, 1, 1, 1, 1, 1,
0.4478293, 0.7184409, 1.420454, 1, 1, 1, 1, 1,
0.4545703, 0.3649377, 1.051624, 1, 1, 1, 1, 1,
0.4577907, 1.43812, 1.221856, 1, 1, 1, 1, 1,
0.4581948, -1.699057, 5.257573, 1, 1, 1, 1, 1,
0.4595856, -1.302165, 3.435419, 1, 1, 1, 1, 1,
0.4735762, 0.5638384, 1.120867, 1, 1, 1, 1, 1,
0.4753287, 1.267354, 0.5596813, 1, 1, 1, 1, 1,
0.4766074, -0.09334372, 0.7713453, 1, 1, 1, 1, 1,
0.4828211, 1.236095, 1.52366, 1, 1, 1, 1, 1,
0.4849083, -1.11634, 3.484399, 1, 1, 1, 1, 1,
0.4869211, 0.8140356, -0.3824077, 0, 0, 1, 1, 1,
0.4871642, -0.8089667, 3.939005, 1, 0, 0, 1, 1,
0.4897307, -0.5240124, 2.885309, 1, 0, 0, 1, 1,
0.4909685, -0.1016075, 0.7543523, 1, 0, 0, 1, 1,
0.4929756, 0.3336694, 0.4237201, 1, 0, 0, 1, 1,
0.494735, -0.7838691, 3.562037, 1, 0, 0, 1, 1,
0.497056, 0.5718367, 2.551491, 0, 0, 0, 1, 1,
0.4973812, 1.504045, 0.9476274, 0, 0, 0, 1, 1,
0.4985307, 0.1221378, 2.795331, 0, 0, 0, 1, 1,
0.4988957, -0.8818728, 1.772618, 0, 0, 0, 1, 1,
0.5013859, 0.4815122, 0.1467703, 0, 0, 0, 1, 1,
0.509799, 0.8537802, 0.3749059, 0, 0, 0, 1, 1,
0.5186065, -1.340902, 1.508616, 0, 0, 0, 1, 1,
0.5193974, -0.2586353, 2.972775, 1, 1, 1, 1, 1,
0.5196923, 0.4902511, 0.845331, 1, 1, 1, 1, 1,
0.5204548, -0.6332995, 2.91224, 1, 1, 1, 1, 1,
0.5218717, 0.8693677, -0.6393663, 1, 1, 1, 1, 1,
0.5272343, -0.9698402, 3.19992, 1, 1, 1, 1, 1,
0.5279683, 0.3350271, 0.7866759, 1, 1, 1, 1, 1,
0.5298599, -0.01482062, -0.06633412, 1, 1, 1, 1, 1,
0.536131, -0.02810275, 1.721124, 1, 1, 1, 1, 1,
0.5389902, 0.3225631, -0.6758034, 1, 1, 1, 1, 1,
0.5390824, -0.9711948, 2.313101, 1, 1, 1, 1, 1,
0.5477114, 1.77749, -0.4549744, 1, 1, 1, 1, 1,
0.5514356, -1.015779, 2.281279, 1, 1, 1, 1, 1,
0.5531733, -1.554281, 3.25707, 1, 1, 1, 1, 1,
0.5557538, -0.9851937, 1.576644, 1, 1, 1, 1, 1,
0.5566769, -0.7274488, 1.866847, 1, 1, 1, 1, 1,
0.5595856, 0.7063387, 0.7247203, 0, 0, 1, 1, 1,
0.5601419, -0.7212738, 2.281569, 1, 0, 0, 1, 1,
0.5660232, 1.202055, 1.191813, 1, 0, 0, 1, 1,
0.5662383, 0.9312295, 1.38294, 1, 0, 0, 1, 1,
0.567538, -0.5467812, 1.557764, 1, 0, 0, 1, 1,
0.568882, -1.261259, 2.036299, 1, 0, 0, 1, 1,
0.5696766, 1.140153, 1.544334, 0, 0, 0, 1, 1,
0.5737664, 0.7949308, 1.778768, 0, 0, 0, 1, 1,
0.5763974, -0.7666024, 2.459398, 0, 0, 0, 1, 1,
0.5765605, 1.115024, 1.427284, 0, 0, 0, 1, 1,
0.5779757, -1.175133, 3.113501, 0, 0, 0, 1, 1,
0.5786823, -0.2634192, 2.355752, 0, 0, 0, 1, 1,
0.5816804, -1.997236, 2.940997, 0, 0, 0, 1, 1,
0.5830452, -0.07476982, 2.106298, 1, 1, 1, 1, 1,
0.5867793, 2.354081, -0.03976103, 1, 1, 1, 1, 1,
0.594122, -1.008971, 4.145432, 1, 1, 1, 1, 1,
0.5985259, 1.561198, -1.245138, 1, 1, 1, 1, 1,
0.6010557, -0.6349231, 2.463249, 1, 1, 1, 1, 1,
0.6022085, 0.8788919, 0.9836906, 1, 1, 1, 1, 1,
0.6035065, -0.937137, 2.186983, 1, 1, 1, 1, 1,
0.6087865, 0.6232821, 0.5847325, 1, 1, 1, 1, 1,
0.6101786, 0.07759559, 1.797813, 1, 1, 1, 1, 1,
0.6287624, -0.05811463, 0.8322045, 1, 1, 1, 1, 1,
0.630338, -0.4258989, 3.567526, 1, 1, 1, 1, 1,
0.6336048, 0.7475114, -1.027968, 1, 1, 1, 1, 1,
0.6377577, -0.3583792, 2.26728, 1, 1, 1, 1, 1,
0.6436605, 1.124662, 0.5232755, 1, 1, 1, 1, 1,
0.6438611, 0.9540596, 1.414591, 1, 1, 1, 1, 1,
0.6448799, -0.248188, 2.299781, 0, 0, 1, 1, 1,
0.6463787, 1.550982, 2.003167, 1, 0, 0, 1, 1,
0.6467423, -0.4743701, 3.041904, 1, 0, 0, 1, 1,
0.6498004, 0.009229599, 2.190239, 1, 0, 0, 1, 1,
0.651464, -1.867353, 2.220413, 1, 0, 0, 1, 1,
0.6566594, -1.891346, 5.076115, 1, 0, 0, 1, 1,
0.6598743, 1.56018, 0.72361, 0, 0, 0, 1, 1,
0.6640168, 0.09311378, -1.606694, 0, 0, 0, 1, 1,
0.6654361, 0.2246909, 1.012173, 0, 0, 0, 1, 1,
0.668039, 0.5619017, 2.012514, 0, 0, 0, 1, 1,
0.6704543, 0.254878, 1.487438, 0, 0, 0, 1, 1,
0.6730047, -0.3291725, 1.010387, 0, 0, 0, 1, 1,
0.675256, 0.258128, 0.8501272, 0, 0, 0, 1, 1,
0.6767411, 2.666905, -0.4346859, 1, 1, 1, 1, 1,
0.6858651, 0.1092253, 1.07135, 1, 1, 1, 1, 1,
0.6960843, -0.4282782, 3.097144, 1, 1, 1, 1, 1,
0.7060624, -0.4925765, 3.309422, 1, 1, 1, 1, 1,
0.7214434, 0.4592748, 2.520416, 1, 1, 1, 1, 1,
0.7220815, 0.7302213, 1.597821, 1, 1, 1, 1, 1,
0.7252873, 1.044026, 1.47953, 1, 1, 1, 1, 1,
0.7266127, 1.027134, 1.29434, 1, 1, 1, 1, 1,
0.7322927, -1.72441, 1.650052, 1, 1, 1, 1, 1,
0.7341735, -0.6758892, 1.634239, 1, 1, 1, 1, 1,
0.7377572, -1.825397, 2.868273, 1, 1, 1, 1, 1,
0.7390942, -0.5856546, 2.370171, 1, 1, 1, 1, 1,
0.742807, -0.6298941, 1.465681, 1, 1, 1, 1, 1,
0.749127, -0.07776256, 0.3790771, 1, 1, 1, 1, 1,
0.7554408, 0.846322, 1.431079, 1, 1, 1, 1, 1,
0.7600361, 0.9871756, 0.8676428, 0, 0, 1, 1, 1,
0.7615815, 0.1963483, 2.198004, 1, 0, 0, 1, 1,
0.7644199, -0.2821038, 1.729884, 1, 0, 0, 1, 1,
0.7710426, -1.224209, 2.303054, 1, 0, 0, 1, 1,
0.7759042, 0.4160892, 0.6925082, 1, 0, 0, 1, 1,
0.7778209, 0.6996589, 0.2346412, 1, 0, 0, 1, 1,
0.7850106, 0.1530304, 0.9452736, 0, 0, 0, 1, 1,
0.7922837, 0.1855909, 2.874231, 0, 0, 0, 1, 1,
0.7982571, -0.9930389, 2.593318, 0, 0, 0, 1, 1,
0.799698, -0.7184421, 2.081566, 0, 0, 0, 1, 1,
0.8050572, -1.353767, 3.533374, 0, 0, 0, 1, 1,
0.8135353, 0.5837765, 0.4995476, 0, 0, 0, 1, 1,
0.8179605, -0.009988219, 0.9009419, 0, 0, 0, 1, 1,
0.82302, -0.2229976, 3.186704, 1, 1, 1, 1, 1,
0.8306548, 1.334027, -0.5299666, 1, 1, 1, 1, 1,
0.8329161, -0.5804679, 2.87157, 1, 1, 1, 1, 1,
0.8355419, -0.5258688, 1.58087, 1, 1, 1, 1, 1,
0.8489755, 0.7837768, 0.1775547, 1, 1, 1, 1, 1,
0.8497777, -0.9709989, 1.790366, 1, 1, 1, 1, 1,
0.8517987, -0.8801485, 1.791355, 1, 1, 1, 1, 1,
0.8529948, 0.8746619, 1.3844, 1, 1, 1, 1, 1,
0.8540863, 0.4996346, 2.46264, 1, 1, 1, 1, 1,
0.8651329, 0.1539134, 1.779276, 1, 1, 1, 1, 1,
0.8684821, -0.7606611, 4.114019, 1, 1, 1, 1, 1,
0.8687909, 1.781701, 0.5251474, 1, 1, 1, 1, 1,
0.8753195, 0.5449845, 1.250127, 1, 1, 1, 1, 1,
0.8775934, -0.1769636, 0.2595397, 1, 1, 1, 1, 1,
0.8780544, 1.613405, 1.743832, 1, 1, 1, 1, 1,
0.878275, -1.526638, 2.799833, 0, 0, 1, 1, 1,
0.8836104, -0.05628004, 2.184729, 1, 0, 0, 1, 1,
0.8889826, -0.06585995, 1.888384, 1, 0, 0, 1, 1,
0.8933015, -0.4797168, 1.64312, 1, 0, 0, 1, 1,
0.8967316, 0.002361577, 1.156947, 1, 0, 0, 1, 1,
0.8967999, 0.3676184, -1.011, 1, 0, 0, 1, 1,
0.9071749, 0.6009017, 1.052202, 0, 0, 0, 1, 1,
0.9087883, -0.4801656, 1.74466, 0, 0, 0, 1, 1,
0.9181157, -0.3865559, 3.773216, 0, 0, 0, 1, 1,
0.9211239, 0.6477029, 1.477923, 0, 0, 0, 1, 1,
0.9230161, -0.1607521, 2.198631, 0, 0, 0, 1, 1,
0.9311782, 1.631037, 1.093121, 0, 0, 0, 1, 1,
0.9325267, -1.334249, 2.499985, 0, 0, 0, 1, 1,
0.9358265, 0.1317873, 0.6822838, 1, 1, 1, 1, 1,
0.9493781, 0.6123325, 0.9359401, 1, 1, 1, 1, 1,
0.9508942, 0.5643981, 2.02935, 1, 1, 1, 1, 1,
0.9538671, -0.6984641, 2.257921, 1, 1, 1, 1, 1,
0.9539952, 1.307405, -0.9280224, 1, 1, 1, 1, 1,
0.9640219, -0.6982588, 2.004544, 1, 1, 1, 1, 1,
0.9660547, 0.6890593, 1.766165, 1, 1, 1, 1, 1,
0.9661491, 1.273531, 0.3741152, 1, 1, 1, 1, 1,
0.9666659, 1.938397, 0.1705352, 1, 1, 1, 1, 1,
0.9737475, 2.708213, -0.2479067, 1, 1, 1, 1, 1,
0.9767935, -1.862448, 2.318913, 1, 1, 1, 1, 1,
0.977329, 0.3098279, 1.824835, 1, 1, 1, 1, 1,
0.983519, -1.010816, 1.724076, 1, 1, 1, 1, 1,
0.9912798, 0.08958436, 0.5972953, 1, 1, 1, 1, 1,
0.9949604, -0.761382, 4.284548, 1, 1, 1, 1, 1,
0.9949816, 0.8009493, 1.575936, 0, 0, 1, 1, 1,
1.006413, 1.247101, 1.415128, 1, 0, 0, 1, 1,
1.008587, -0.04579626, 2.662843, 1, 0, 0, 1, 1,
1.011122, 0.2887908, 1.313136, 1, 0, 0, 1, 1,
1.021652, -1.302887, 3.093032, 1, 0, 0, 1, 1,
1.028875, 0.1514684, 0.6160126, 1, 0, 0, 1, 1,
1.030507, -0.4804054, 2.131959, 0, 0, 0, 1, 1,
1.037742, 0.9247925, 1.336488, 0, 0, 0, 1, 1,
1.041107, 0.03558613, 2.210033, 0, 0, 0, 1, 1,
1.042899, -1.39463, 2.949945, 0, 0, 0, 1, 1,
1.045606, 0.9314616, 0.8278652, 0, 0, 0, 1, 1,
1.051678, 0.6377687, 1.915662, 0, 0, 0, 1, 1,
1.051733, 1.159321, 0.7536941, 0, 0, 0, 1, 1,
1.054223, -1.633512, 0.8780379, 1, 1, 1, 1, 1,
1.055616, -0.5463553, 3.54779, 1, 1, 1, 1, 1,
1.06007, 0.2461086, 1.546182, 1, 1, 1, 1, 1,
1.063047, 0.7455161, 0.3538627, 1, 1, 1, 1, 1,
1.073137, 0.2432948, 1.928265, 1, 1, 1, 1, 1,
1.073725, 0.06542751, 0.1251321, 1, 1, 1, 1, 1,
1.073806, 1.466918, 0.7128364, 1, 1, 1, 1, 1,
1.074469, 0.3245615, 0.5602011, 1, 1, 1, 1, 1,
1.0779, 1.718346, 0.4259412, 1, 1, 1, 1, 1,
1.087313, 2.818623, -0.4422798, 1, 1, 1, 1, 1,
1.092694, -0.6308455, 2.48445, 1, 1, 1, 1, 1,
1.101225, 0.3715679, -0.1819667, 1, 1, 1, 1, 1,
1.101662, -0.962514, 2.331327, 1, 1, 1, 1, 1,
1.107855, 0.5143998, 1.218823, 1, 1, 1, 1, 1,
1.109231, 0.1819383, 2.44447, 1, 1, 1, 1, 1,
1.126135, -0.7576471, 3.230955, 0, 0, 1, 1, 1,
1.127376, 0.1235873, 0.5242485, 1, 0, 0, 1, 1,
1.133005, -0.7025487, 2.341633, 1, 0, 0, 1, 1,
1.133133, -0.1807363, 1.576585, 1, 0, 0, 1, 1,
1.140523, -0.7900046, 1.437091, 1, 0, 0, 1, 1,
1.141322, 0.8036357, 1.338622, 1, 0, 0, 1, 1,
1.142597, 0.5834925, 0.8339698, 0, 0, 0, 1, 1,
1.148885, 0.9346068, 1.163311, 0, 0, 0, 1, 1,
1.149986, 1.249231, 0.694864, 0, 0, 0, 1, 1,
1.156883, -0.01967953, 3.545202, 0, 0, 0, 1, 1,
1.162666, -1.441824, 4.182398, 0, 0, 0, 1, 1,
1.172825, 0.2189798, 1.756652, 0, 0, 0, 1, 1,
1.19654, 0.231619, 0.43948, 0, 0, 0, 1, 1,
1.215622, 1.002242, 2.293185, 1, 1, 1, 1, 1,
1.215918, -0.8983198, 0.7123063, 1, 1, 1, 1, 1,
1.223493, 0.782173, 2.147036, 1, 1, 1, 1, 1,
1.23427, -0.9219964, 1.126205, 1, 1, 1, 1, 1,
1.238039, 0.307515, 1.605311, 1, 1, 1, 1, 1,
1.260978, 1.543069, 1.63079, 1, 1, 1, 1, 1,
1.261817, 0.2410745, 3.135084, 1, 1, 1, 1, 1,
1.263291, -0.8792434, 2.471853, 1, 1, 1, 1, 1,
1.268556, -0.3510748, 0.4671574, 1, 1, 1, 1, 1,
1.268959, -2.141331, 2.105243, 1, 1, 1, 1, 1,
1.273303, 0.6575301, 0.1898189, 1, 1, 1, 1, 1,
1.279299, -0.5069948, 1.394738, 1, 1, 1, 1, 1,
1.287579, -0.7988943, 2.250722, 1, 1, 1, 1, 1,
1.294561, 0.9058426, 0.6322985, 1, 1, 1, 1, 1,
1.294695, -1.525943, 1.728155, 1, 1, 1, 1, 1,
1.304346, 0.5873736, 1.631859, 0, 0, 1, 1, 1,
1.313941, 0.7116014, 1.292959, 1, 0, 0, 1, 1,
1.315059, -0.1244345, 2.007881, 1, 0, 0, 1, 1,
1.321978, 0.2634988, 2.048661, 1, 0, 0, 1, 1,
1.326524, -0.9128175, 2.41118, 1, 0, 0, 1, 1,
1.34389, 0.07594385, -0.4636421, 1, 0, 0, 1, 1,
1.34591, -0.6682037, 2.386866, 0, 0, 0, 1, 1,
1.346572, 1.010171, 2.406406, 0, 0, 0, 1, 1,
1.349885, 1.932938, 1.039531, 0, 0, 0, 1, 1,
1.35655, 0.7296414, 0.4447748, 0, 0, 0, 1, 1,
1.358047, 0.7238899, 0.4211293, 0, 0, 0, 1, 1,
1.365414, 0.2065804, 1.675336, 0, 0, 0, 1, 1,
1.366036, 0.7079953, 1.493926, 0, 0, 0, 1, 1,
1.373609, 1.53819, 1.030029, 1, 1, 1, 1, 1,
1.409771, -0.5217973, 1.486666, 1, 1, 1, 1, 1,
1.431324, 0.4086135, 1.74471, 1, 1, 1, 1, 1,
1.43522, 0.9523914, 1.953402, 1, 1, 1, 1, 1,
1.435715, 1.032523, 0.499678, 1, 1, 1, 1, 1,
1.46665, 0.09204877, 0.8220954, 1, 1, 1, 1, 1,
1.471758, 0.2828133, 2.056067, 1, 1, 1, 1, 1,
1.481761, 1.121617, 0.08773676, 1, 1, 1, 1, 1,
1.488593, 1.609098, 0.04089209, 1, 1, 1, 1, 1,
1.491898, -0.05000698, 3.053025, 1, 1, 1, 1, 1,
1.492272, 1.793416, 0.3936355, 1, 1, 1, 1, 1,
1.493787, -1.918191, 0.9750841, 1, 1, 1, 1, 1,
1.495838, -0.8046663, 4.631907, 1, 1, 1, 1, 1,
1.500527, -0.3179863, 2.081005, 1, 1, 1, 1, 1,
1.504431, -0.1717762, 0.3140004, 1, 1, 1, 1, 1,
1.507316, 0.1185349, 2.223033, 0, 0, 1, 1, 1,
1.508627, -0.9541826, 1.181845, 1, 0, 0, 1, 1,
1.511318, -0.1257934, 1.481455, 1, 0, 0, 1, 1,
1.512195, 0.8521688, 1.510213, 1, 0, 0, 1, 1,
1.513878, 0.2801115, 2.39612, 1, 0, 0, 1, 1,
1.514363, 0.09162489, 1.676429, 1, 0, 0, 1, 1,
1.52504, -0.7147944, 2.826097, 0, 0, 0, 1, 1,
1.526142, 0.6915728, 2.173165, 0, 0, 0, 1, 1,
1.531878, 0.9710128, 0.3192697, 0, 0, 0, 1, 1,
1.565723, -0.9710609, 2.916795, 0, 0, 0, 1, 1,
1.567355, -0.7644666, 1.367685, 0, 0, 0, 1, 1,
1.572544, 0.5189497, 0.7242869, 0, 0, 0, 1, 1,
1.581195, 0.7944065, 0.6148022, 0, 0, 0, 1, 1,
1.589179, -1.701375, 4.059941, 1, 1, 1, 1, 1,
1.593351, 0.1503239, 1.080758, 1, 1, 1, 1, 1,
1.603364, 0.3112901, 1.790072, 1, 1, 1, 1, 1,
1.617779, -1.076629, 4.952224, 1, 1, 1, 1, 1,
1.625201, -1.214327, 1.276439, 1, 1, 1, 1, 1,
1.625749, -1.010519, 1.856647, 1, 1, 1, 1, 1,
1.626905, -0.1101802, 1.709386, 1, 1, 1, 1, 1,
1.651155, -0.9537699, 1.739805, 1, 1, 1, 1, 1,
1.66084, 0.3734858, 0.7191849, 1, 1, 1, 1, 1,
1.676426, -0.0658314, 2.362683, 1, 1, 1, 1, 1,
1.681105, -0.9665946, 1.772285, 1, 1, 1, 1, 1,
1.695336, 0.7102797, 1.778253, 1, 1, 1, 1, 1,
1.714703, -0.03084067, 0.9040487, 1, 1, 1, 1, 1,
1.722002, -0.3450753, 1.97022, 1, 1, 1, 1, 1,
1.735391, -1.074775, 1.05203, 1, 1, 1, 1, 1,
1.774855, -0.6013536, 2.589201, 0, 0, 1, 1, 1,
1.78279, 0.02871105, 2.010297, 1, 0, 0, 1, 1,
1.786036, -1.863321, -0.4713597, 1, 0, 0, 1, 1,
1.790645, -0.3167241, 1.582323, 1, 0, 0, 1, 1,
1.793539, 0.6641859, 0.3029822, 1, 0, 0, 1, 1,
1.804207, 0.5589914, -0.7312853, 1, 0, 0, 1, 1,
1.807749, 1.811482, -0.3183032, 0, 0, 0, 1, 1,
1.824332, -0.3666151, 2.914879, 0, 0, 0, 1, 1,
1.84896, -1.533612, 1.479399, 0, 0, 0, 1, 1,
1.851409, 0.4761057, 1.023418, 0, 0, 0, 1, 1,
1.90393, -1.043928, 2.637813, 0, 0, 0, 1, 1,
1.906352, -1.514377, 1.231351, 0, 0, 0, 1, 1,
1.916134, 0.8477986, -0.4206042, 0, 0, 0, 1, 1,
1.926264, 0.4381769, 2.720056, 1, 1, 1, 1, 1,
1.931221, -0.8640637, 2.087999, 1, 1, 1, 1, 1,
1.94891, 0.1308194, 1.033357, 1, 1, 1, 1, 1,
1.97349, -1.313095, 2.06051, 1, 1, 1, 1, 1,
1.984541, 0.3142056, 2.953836, 1, 1, 1, 1, 1,
1.986747, 0.5673801, 0.1714579, 1, 1, 1, 1, 1,
1.989525, 0.05824641, 1.29758, 1, 1, 1, 1, 1,
1.992613, 0.1429294, 0.3982849, 1, 1, 1, 1, 1,
1.995944, 0.2895356, 0.3835668, 1, 1, 1, 1, 1,
2.038687, -1.9956, 3.328585, 1, 1, 1, 1, 1,
2.066638, -0.7385677, 2.463304, 1, 1, 1, 1, 1,
2.073399, 0.6100069, 1.612272, 1, 1, 1, 1, 1,
2.124719, -1.672923, -0.1566292, 1, 1, 1, 1, 1,
2.126217, -0.625426, 3.491778, 1, 1, 1, 1, 1,
2.12841, -0.9793952, 2.550763, 1, 1, 1, 1, 1,
2.160986, 1.621613, 2.157336, 0, 0, 1, 1, 1,
2.160995, -1.799275, 2.159629, 1, 0, 0, 1, 1,
2.164674, 0.8676628, 2.062127, 1, 0, 0, 1, 1,
2.189779, 1.631328, 0.07584589, 1, 0, 0, 1, 1,
2.19676, 1.332543, 2.015441, 1, 0, 0, 1, 1,
2.227697, 2.315233, 1.627496, 1, 0, 0, 1, 1,
2.23208, -0.3560638, 1.416173, 0, 0, 0, 1, 1,
2.244479, -0.204922, 1.421542, 0, 0, 0, 1, 1,
2.250138, 0.6101294, 1.542749, 0, 0, 0, 1, 1,
2.307504, -0.5369217, 1.362368, 0, 0, 0, 1, 1,
2.330626, 1.34558, 0.5036521, 0, 0, 0, 1, 1,
2.34304, -1.983551, 0.8603871, 0, 0, 0, 1, 1,
2.349589, 0.5438508, 1.000362, 0, 0, 0, 1, 1,
2.468494, -0.1240048, 2.303123, 1, 1, 1, 1, 1,
2.520491, -1.712529, 2.72086, 1, 1, 1, 1, 1,
2.524864, -1.261417, 1.669936, 1, 1, 1, 1, 1,
2.66392, 2.769427, -1.190279, 1, 1, 1, 1, 1,
2.942508, 0.3490887, 2.804997, 1, 1, 1, 1, 1,
3.086332, 0.6235619, 0.8702605, 1, 1, 1, 1, 1,
3.307109, -0.6873596, 1.013553, 1, 1, 1, 1, 1
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
var radius = 9.694967;
var distance = 34.05316;
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
mvMatrix.translate( -0.2695334, -0.3934178, -0.3762193 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.05316);
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
