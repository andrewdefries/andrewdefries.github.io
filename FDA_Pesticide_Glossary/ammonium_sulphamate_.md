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
-3.557379, -0.1291947, -1.286606, 1, 0, 0, 1,
-3.367072, 1.609701, -1.435362, 1, 0.007843138, 0, 1,
-3.071735, -2.708096, -1.207743, 1, 0.01176471, 0, 1,
-2.929706, 1.546802, -1.73632, 1, 0.01960784, 0, 1,
-2.911002, -0.7876107, -2.140717, 1, 0.02352941, 0, 1,
-2.692972, 1.632973, 0.2429539, 1, 0.03137255, 0, 1,
-2.531862, 1.472911, -1.010801, 1, 0.03529412, 0, 1,
-2.444249, 0.2181695, -1.576084, 1, 0.04313726, 0, 1,
-2.443987, -0.5004652, -3.183472, 1, 0.04705882, 0, 1,
-2.422884, -1.728796, -0.02686991, 1, 0.05490196, 0, 1,
-2.404514, 1.11953, -0.06240456, 1, 0.05882353, 0, 1,
-2.372142, 0.4169134, -1.933067, 1, 0.06666667, 0, 1,
-2.313268, -0.1018355, -3.018738, 1, 0.07058824, 0, 1,
-2.290794, -0.9315371, -1.893484, 1, 0.07843138, 0, 1,
-2.287239, -2.267539, -3.907925, 1, 0.08235294, 0, 1,
-2.194371, 2.543008, -1.567636, 1, 0.09019608, 0, 1,
-2.18252, 0.02741144, -1.260077, 1, 0.09411765, 0, 1,
-2.164006, -1.099592, -1.858851, 1, 0.1019608, 0, 1,
-2.140412, 0.5574397, -1.918903, 1, 0.1098039, 0, 1,
-2.135772, 1.23973, -1.451969, 1, 0.1137255, 0, 1,
-2.11808, -0.06500267, -2.993185, 1, 0.1215686, 0, 1,
-2.076955, -0.08713701, -4.050601, 1, 0.1254902, 0, 1,
-2.03953, -0.6586311, -0.3691998, 1, 0.1333333, 0, 1,
-2.025459, 0.8412834, 0.8198904, 1, 0.1372549, 0, 1,
-1.969275, 0.1296011, -0.5591006, 1, 0.145098, 0, 1,
-1.925428, 0.07759601, -0.1803509, 1, 0.1490196, 0, 1,
-1.924091, -1.015408, -3.36521, 1, 0.1568628, 0, 1,
-1.890412, -0.3452542, -2.875701, 1, 0.1607843, 0, 1,
-1.883594, 0.9239177, -1.010778, 1, 0.1686275, 0, 1,
-1.877326, -0.8625678, -2.307319, 1, 0.172549, 0, 1,
-1.860108, 0.04981147, -1.867547, 1, 0.1803922, 0, 1,
-1.803526, -0.1300072, -1.817547, 1, 0.1843137, 0, 1,
-1.792254, 1.035963, -0.4546913, 1, 0.1921569, 0, 1,
-1.780835, 0.2848634, -2.777034, 1, 0.1960784, 0, 1,
-1.762336, -0.0907969, -2.008, 1, 0.2039216, 0, 1,
-1.749094, -0.4326035, -0.2046746, 1, 0.2117647, 0, 1,
-1.74545, 0.9403046, -0.9124688, 1, 0.2156863, 0, 1,
-1.716644, 0.220834, -1.044548, 1, 0.2235294, 0, 1,
-1.687974, -1.114089, -2.957512, 1, 0.227451, 0, 1,
-1.67021, 2.605963, 0.3887324, 1, 0.2352941, 0, 1,
-1.667985, 0.9748366, -0.4756902, 1, 0.2392157, 0, 1,
-1.663184, 0.2708207, -0.3883167, 1, 0.2470588, 0, 1,
-1.661474, -1.220178, -2.43115, 1, 0.2509804, 0, 1,
-1.651867, -0.9509522, -3.434932, 1, 0.2588235, 0, 1,
-1.618169, 0.1694414, -0.242485, 1, 0.2627451, 0, 1,
-1.600635, 1.424621, 0.1056869, 1, 0.2705882, 0, 1,
-1.594836, 0.5940087, -3.19739, 1, 0.2745098, 0, 1,
-1.590334, 1.689585, -1.020604, 1, 0.282353, 0, 1,
-1.570805, -1.938018, -3.332492, 1, 0.2862745, 0, 1,
-1.561556, 1.496154, 0.4599051, 1, 0.2941177, 0, 1,
-1.554993, 1.260331, -1.285721, 1, 0.3019608, 0, 1,
-1.547337, 0.120866, -2.154947, 1, 0.3058824, 0, 1,
-1.545957, -0.6228606, -0.8606008, 1, 0.3137255, 0, 1,
-1.542763, -0.08706973, -1.383092, 1, 0.3176471, 0, 1,
-1.535954, 0.3240826, -2.553031, 1, 0.3254902, 0, 1,
-1.532758, 0.5830454, -2.222928, 1, 0.3294118, 0, 1,
-1.531126, -0.9281098, -2.050725, 1, 0.3372549, 0, 1,
-1.528591, -0.5950243, -2.449405, 1, 0.3411765, 0, 1,
-1.512962, -0.652938, -1.03884, 1, 0.3490196, 0, 1,
-1.503509, -0.8504353, -4.075238, 1, 0.3529412, 0, 1,
-1.501178, -1.577438, -3.884753, 1, 0.3607843, 0, 1,
-1.500292, 1.158813, -2.407748, 1, 0.3647059, 0, 1,
-1.495721, -0.390247, -1.437944, 1, 0.372549, 0, 1,
-1.492132, -1.774773, -2.019207, 1, 0.3764706, 0, 1,
-1.485256, -0.9347841, -1.348573, 1, 0.3843137, 0, 1,
-1.477248, -1.216321, -1.73027, 1, 0.3882353, 0, 1,
-1.476332, -2.149297, -4.641278, 1, 0.3960784, 0, 1,
-1.474698, -1.288852, -3.720633, 1, 0.4039216, 0, 1,
-1.461884, -1.065811, -2.113848, 1, 0.4078431, 0, 1,
-1.45166, -0.7680246, -2.339426, 1, 0.4156863, 0, 1,
-1.451644, -0.1872337, -0.6148371, 1, 0.4196078, 0, 1,
-1.447707, -0.6304178, -2.507394, 1, 0.427451, 0, 1,
-1.434392, -0.1489461, -0.2834279, 1, 0.4313726, 0, 1,
-1.428725, -0.4943675, -1.431445, 1, 0.4392157, 0, 1,
-1.426786, 0.8223338, -1.027929, 1, 0.4431373, 0, 1,
-1.41783, 1.043566, -2.77608, 1, 0.4509804, 0, 1,
-1.417466, -0.2693096, -2.943032, 1, 0.454902, 0, 1,
-1.417131, 0.4091686, -0.2688004, 1, 0.4627451, 0, 1,
-1.404137, 0.6861463, -1.015646, 1, 0.4666667, 0, 1,
-1.400214, 0.8259431, -0.8488698, 1, 0.4745098, 0, 1,
-1.398205, 0.8514989, -0.8069504, 1, 0.4784314, 0, 1,
-1.363548, 0.2904176, -0.7537315, 1, 0.4862745, 0, 1,
-1.346508, 1.461608, -0.9229016, 1, 0.4901961, 0, 1,
-1.33879, -0.5087556, -0.6065492, 1, 0.4980392, 0, 1,
-1.328701, -0.1880481, -1.921808, 1, 0.5058824, 0, 1,
-1.327652, 1.228504, -1.174082, 1, 0.509804, 0, 1,
-1.324313, -1.194224, -2.901655, 1, 0.5176471, 0, 1,
-1.323397, -1.020951, -1.500282, 1, 0.5215687, 0, 1,
-1.32149, -1.183017, -2.376497, 1, 0.5294118, 0, 1,
-1.301872, -0.9662099, -4.37202, 1, 0.5333334, 0, 1,
-1.299903, -0.4440628, -2.059499, 1, 0.5411765, 0, 1,
-1.299175, -0.4986793, -0.9605949, 1, 0.5450981, 0, 1,
-1.290943, 0.2011585, -1.64485, 1, 0.5529412, 0, 1,
-1.285823, 1.218696, -0.957205, 1, 0.5568628, 0, 1,
-1.284407, 0.8703281, -0.1329599, 1, 0.5647059, 0, 1,
-1.283266, 0.8381512, 0.8197817, 1, 0.5686275, 0, 1,
-1.281654, 0.1248157, -1.673997, 1, 0.5764706, 0, 1,
-1.277975, 0.03797863, -0.9054818, 1, 0.5803922, 0, 1,
-1.266489, -1.214224, -4.176897, 1, 0.5882353, 0, 1,
-1.25543, -0.6246191, -2.218146, 1, 0.5921569, 0, 1,
-1.251679, 1.050736, 0.3324846, 1, 0.6, 0, 1,
-1.24689, -1.444151, -0.7793944, 1, 0.6078432, 0, 1,
-1.240555, 1.100088, -0.188776, 1, 0.6117647, 0, 1,
-1.235365, -1.136827, -1.926009, 1, 0.6196079, 0, 1,
-1.224219, -1.407049, -4.137606, 1, 0.6235294, 0, 1,
-1.218397, -0.8855243, -1.954763, 1, 0.6313726, 0, 1,
-1.210203, 1.691246, -1.414766, 1, 0.6352941, 0, 1,
-1.198909, -0.5886803, -2.272877, 1, 0.6431373, 0, 1,
-1.197143, -0.02604807, 0.8912145, 1, 0.6470588, 0, 1,
-1.191067, -0.1571631, -2.321083, 1, 0.654902, 0, 1,
-1.190158, -0.5377171, -0.3778763, 1, 0.6588235, 0, 1,
-1.178884, -1.132894, -2.606404, 1, 0.6666667, 0, 1,
-1.178804, 0.420093, -0.8230448, 1, 0.6705883, 0, 1,
-1.173863, 1.331815, -1.744875, 1, 0.6784314, 0, 1,
-1.165226, -2.110644, -2.668468, 1, 0.682353, 0, 1,
-1.160127, -0.1539097, -1.753687, 1, 0.6901961, 0, 1,
-1.14911, 0.3799959, -1.301047, 1, 0.6941177, 0, 1,
-1.146885, 0.5520666, -0.9794066, 1, 0.7019608, 0, 1,
-1.146536, -0.5804077, -3.000993, 1, 0.7098039, 0, 1,
-1.145416, -0.2068334, -1.794205, 1, 0.7137255, 0, 1,
-1.131577, 1.886046, 0.09104954, 1, 0.7215686, 0, 1,
-1.117261, 0.3600944, -2.213138, 1, 0.7254902, 0, 1,
-1.116204, 0.3302892, -0.4783862, 1, 0.7333333, 0, 1,
-1.109164, -1.127892, -2.963469, 1, 0.7372549, 0, 1,
-1.102069, 0.9609544, -1.263796, 1, 0.7450981, 0, 1,
-1.099094, 0.5046293, -1.670922, 1, 0.7490196, 0, 1,
-1.093199, -0.0517584, -0.8101855, 1, 0.7568628, 0, 1,
-1.08269, -0.1415294, -1.440154, 1, 0.7607843, 0, 1,
-1.081849, 1.85767, -1.633107, 1, 0.7686275, 0, 1,
-1.07576, 0.4633735, -1.09352, 1, 0.772549, 0, 1,
-1.074425, 0.5186047, -1.60797, 1, 0.7803922, 0, 1,
-1.066694, 0.9772792, -1.312831, 1, 0.7843137, 0, 1,
-1.064529, -0.5095534, -0.1981984, 1, 0.7921569, 0, 1,
-1.063954, -0.4080779, -2.798012, 1, 0.7960784, 0, 1,
-1.060708, -0.3402547, -3.236994, 1, 0.8039216, 0, 1,
-1.053406, 1.424588, -0.6592179, 1, 0.8117647, 0, 1,
-1.05172, -0.356363, -1.334103, 1, 0.8156863, 0, 1,
-1.049239, -0.2466142, -1.565355, 1, 0.8235294, 0, 1,
-1.048973, 0.3640256, -3.150526, 1, 0.827451, 0, 1,
-1.045104, -0.9720646, -2.136776, 1, 0.8352941, 0, 1,
-1.041388, 0.1758467, -3.142051, 1, 0.8392157, 0, 1,
-1.041059, 1.897111, 0.4665307, 1, 0.8470588, 0, 1,
-1.034212, -0.9709898, -1.310898, 1, 0.8509804, 0, 1,
-1.018563, -0.4884117, -0.8810663, 1, 0.8588235, 0, 1,
-1.017297, 0.4796386, 0.2514697, 1, 0.8627451, 0, 1,
-1.009133, -1.921657, -2.285774, 1, 0.8705882, 0, 1,
-0.995487, 0.1308997, -1.39806, 1, 0.8745098, 0, 1,
-0.9924895, 0.4637136, -3.030082, 1, 0.8823529, 0, 1,
-0.9906402, -0.7192674, -1.914305, 1, 0.8862745, 0, 1,
-0.9870804, 1.734569, 0.6949469, 1, 0.8941177, 0, 1,
-0.9824868, 0.7703963, -2.530405, 1, 0.8980392, 0, 1,
-0.9744896, -0.7131537, -0.6868782, 1, 0.9058824, 0, 1,
-0.9712418, -1.182437, -2.00286, 1, 0.9137255, 0, 1,
-0.9677613, -0.5079359, -3.197441, 1, 0.9176471, 0, 1,
-0.9638645, 0.5343812, -1.508631, 1, 0.9254902, 0, 1,
-0.9572285, 1.115156, -1.266452, 1, 0.9294118, 0, 1,
-0.9571791, -0.2381555, -0.5700482, 1, 0.9372549, 0, 1,
-0.9559647, -0.1507206, -1.02572, 1, 0.9411765, 0, 1,
-0.9540051, -0.1196753, -1.647116, 1, 0.9490196, 0, 1,
-0.9515207, -0.7194231, -4.100036, 1, 0.9529412, 0, 1,
-0.9415314, 1.117592, 0.7778002, 1, 0.9607843, 0, 1,
-0.9341144, -0.8603731, -3.795793, 1, 0.9647059, 0, 1,
-0.9339852, -1.038511, -2.365018, 1, 0.972549, 0, 1,
-0.931815, -0.4782933, -2.364069, 1, 0.9764706, 0, 1,
-0.9264336, -1.024294, -2.446625, 1, 0.9843137, 0, 1,
-0.9263479, 1.588173, -0.6178828, 1, 0.9882353, 0, 1,
-0.9259441, -0.7918409, -1.801459, 1, 0.9960784, 0, 1,
-0.9241674, 0.4742472, -2.303562, 0.9960784, 1, 0, 1,
-0.9236123, -0.09201902, -3.399955, 0.9921569, 1, 0, 1,
-0.9172888, -0.5173634, -2.977037, 0.9843137, 1, 0, 1,
-0.9162593, 0.4428966, -1.448791, 0.9803922, 1, 0, 1,
-0.9089682, -0.2750925, -4.825061, 0.972549, 1, 0, 1,
-0.9052778, 0.8030115, 1.017267, 0.9686275, 1, 0, 1,
-0.899826, -0.900512, -1.483819, 0.9607843, 1, 0, 1,
-0.8995429, -0.2436168, -0.9340926, 0.9568627, 1, 0, 1,
-0.8964029, 0.9342101, -1.619478, 0.9490196, 1, 0, 1,
-0.8830387, -0.4966012, -3.056773, 0.945098, 1, 0, 1,
-0.8725035, -0.09900592, -0.5358779, 0.9372549, 1, 0, 1,
-0.8693585, 0.1640289, -1.447537, 0.9333333, 1, 0, 1,
-0.8620712, 1.895698, -0.3209638, 0.9254902, 1, 0, 1,
-0.8584434, 0.5424108, -0.1532516, 0.9215686, 1, 0, 1,
-0.8534456, 1.509722, -1.620875, 0.9137255, 1, 0, 1,
-0.8471572, -0.2177814, -3.10832, 0.9098039, 1, 0, 1,
-0.8462448, -1.174755, -1.601027, 0.9019608, 1, 0, 1,
-0.8386129, -0.8023097, -4.388138, 0.8941177, 1, 0, 1,
-0.8363246, 0.1389618, -0.7624452, 0.8901961, 1, 0, 1,
-0.8326278, 1.498082, -0.1554341, 0.8823529, 1, 0, 1,
-0.8323302, -2.603703, -2.256708, 0.8784314, 1, 0, 1,
-0.8302124, 0.7947124, -0.9869298, 0.8705882, 1, 0, 1,
-0.8203071, 1.471082, 0.2385651, 0.8666667, 1, 0, 1,
-0.8200064, -1.056973, -2.853235, 0.8588235, 1, 0, 1,
-0.8196357, -0.2126113, -0.5144649, 0.854902, 1, 0, 1,
-0.8196005, -0.3484419, -3.476499, 0.8470588, 1, 0, 1,
-0.8190138, 1.231304, -0.1601798, 0.8431373, 1, 0, 1,
-0.8100533, 1.089186, -1.156305, 0.8352941, 1, 0, 1,
-0.8078967, -0.9485437, -1.31487, 0.8313726, 1, 0, 1,
-0.8043957, 0.540876, -3.257778, 0.8235294, 1, 0, 1,
-0.8035257, 1.432741, -0.4503006, 0.8196079, 1, 0, 1,
-0.8023416, 0.946376, -1.272258, 0.8117647, 1, 0, 1,
-0.79308, 1.139133, -1.47752, 0.8078431, 1, 0, 1,
-0.791826, -1.791383, -4.164888, 0.8, 1, 0, 1,
-0.7917887, -0.2438289, -1.320404, 0.7921569, 1, 0, 1,
-0.7916102, -0.1499633, -0.2113692, 0.7882353, 1, 0, 1,
-0.7886239, -0.2684907, -3.551138, 0.7803922, 1, 0, 1,
-0.7881293, 0.3646651, -0.6461062, 0.7764706, 1, 0, 1,
-0.7843041, -0.9090329, -2.905134, 0.7686275, 1, 0, 1,
-0.783824, 1.354778, 1.300866, 0.7647059, 1, 0, 1,
-0.7782815, 0.1007612, -2.657896, 0.7568628, 1, 0, 1,
-0.777765, -1.527512, -2.734365, 0.7529412, 1, 0, 1,
-0.7712532, -1.576437, -2.809473, 0.7450981, 1, 0, 1,
-0.7689031, 0.3059285, -0.08284186, 0.7411765, 1, 0, 1,
-0.7628369, -0.6473217, -1.701151, 0.7333333, 1, 0, 1,
-0.7570478, 0.3270773, -1.685904, 0.7294118, 1, 0, 1,
-0.7524436, 0.5773973, -0.6759797, 0.7215686, 1, 0, 1,
-0.7459965, -0.8259357, -1.742263, 0.7176471, 1, 0, 1,
-0.7450032, 0.3784244, -1.284158, 0.7098039, 1, 0, 1,
-0.7448261, -0.04437962, -0.3964074, 0.7058824, 1, 0, 1,
-0.7435668, 2.61096, 0.06278393, 0.6980392, 1, 0, 1,
-0.7380686, 1.952232, -0.934038, 0.6901961, 1, 0, 1,
-0.7373497, 1.846177, 0.2330141, 0.6862745, 1, 0, 1,
-0.730383, -0.9495448, -2.673641, 0.6784314, 1, 0, 1,
-0.7286296, -1.114863, -1.922215, 0.6745098, 1, 0, 1,
-0.7232732, 0.30036, -1.382549, 0.6666667, 1, 0, 1,
-0.722266, 2.025155, 0.7879383, 0.6627451, 1, 0, 1,
-0.7212085, -1.619845, -2.086439, 0.654902, 1, 0, 1,
-0.7144138, 0.66306, 0.1908372, 0.6509804, 1, 0, 1,
-0.7130477, 0.3532361, -0.2871379, 0.6431373, 1, 0, 1,
-0.7099261, -0.5255603, -1.827921, 0.6392157, 1, 0, 1,
-0.7029878, 0.5768989, -1.317467, 0.6313726, 1, 0, 1,
-0.7027903, 0.04975962, -2.684678, 0.627451, 1, 0, 1,
-0.7010237, -0.7902332, -2.492673, 0.6196079, 1, 0, 1,
-0.6993467, 0.7642878, -0.4285519, 0.6156863, 1, 0, 1,
-0.6988159, -0.4654615, -2.494297, 0.6078432, 1, 0, 1,
-0.6918843, 0.3077746, -2.144398, 0.6039216, 1, 0, 1,
-0.6869808, 1.218757, -1.217181, 0.5960785, 1, 0, 1,
-0.6857732, 0.06080615, 0.8247928, 0.5882353, 1, 0, 1,
-0.6814202, 0.6606475, -0.1043509, 0.5843138, 1, 0, 1,
-0.6790472, -2.288685, -3.270008, 0.5764706, 1, 0, 1,
-0.6759623, -0.9400629, -2.630703, 0.572549, 1, 0, 1,
-0.6747761, 0.8516375, 0.634934, 0.5647059, 1, 0, 1,
-0.6739432, -1.273672, -2.154672, 0.5607843, 1, 0, 1,
-0.6681867, 1.151492, 0.545825, 0.5529412, 1, 0, 1,
-0.668159, 1.662854, 0.7101999, 0.5490196, 1, 0, 1,
-0.6577914, -0.8334288, -0.527944, 0.5411765, 1, 0, 1,
-0.6569189, 0.37331, -0.8154925, 0.5372549, 1, 0, 1,
-0.6374316, -1.393412, -3.648981, 0.5294118, 1, 0, 1,
-0.6297679, -0.6868858, -4.151084, 0.5254902, 1, 0, 1,
-0.6271709, -0.7884781, -1.217827, 0.5176471, 1, 0, 1,
-0.6262576, 0.480692, -0.3233669, 0.5137255, 1, 0, 1,
-0.6238123, 1.293557, -0.7423145, 0.5058824, 1, 0, 1,
-0.6212988, 1.023283, 0.0006370686, 0.5019608, 1, 0, 1,
-0.6173877, -0.936785, -4.464929, 0.4941176, 1, 0, 1,
-0.6169044, 1.004506, 0.2925102, 0.4862745, 1, 0, 1,
-0.6165026, 0.5519454, -0.1024196, 0.4823529, 1, 0, 1,
-0.6164868, 0.8714759, -0.2980286, 0.4745098, 1, 0, 1,
-0.6132928, -1.675611, -3.00506, 0.4705882, 1, 0, 1,
-0.6126485, 0.4549618, -3.059802, 0.4627451, 1, 0, 1,
-0.6107116, -1.121082, -2.483045, 0.4588235, 1, 0, 1,
-0.6092755, 1.098401, -1.056618, 0.4509804, 1, 0, 1,
-0.5919742, 0.6340308, 1.066538, 0.4470588, 1, 0, 1,
-0.5909753, 0.4992789, -0.6804712, 0.4392157, 1, 0, 1,
-0.5905443, -0.06280766, -1.500044, 0.4352941, 1, 0, 1,
-0.5903307, -1.173284, -4.164358, 0.427451, 1, 0, 1,
-0.5874978, 0.4041929, -1.762298, 0.4235294, 1, 0, 1,
-0.5869187, 1.725567, 0.01752844, 0.4156863, 1, 0, 1,
-0.5832563, 0.5085182, 0.6174343, 0.4117647, 1, 0, 1,
-0.5820771, 0.2281761, -0.3737887, 0.4039216, 1, 0, 1,
-0.5797135, -0.3626927, -1.733145, 0.3960784, 1, 0, 1,
-0.5792518, 0.3396487, -1.456899, 0.3921569, 1, 0, 1,
-0.5757506, 1.11824, -1.416836, 0.3843137, 1, 0, 1,
-0.5756478, -0.6966867, -0.7897025, 0.3803922, 1, 0, 1,
-0.5740414, -1.021651, -2.747053, 0.372549, 1, 0, 1,
-0.5723685, 0.7148424, -2.623488, 0.3686275, 1, 0, 1,
-0.570908, 0.6649662, -1.412452, 0.3607843, 1, 0, 1,
-0.5686299, 1.396458, 0.5326893, 0.3568628, 1, 0, 1,
-0.5648307, 0.6302138, -1.559026, 0.3490196, 1, 0, 1,
-0.5617478, -1.843134, -3.570162, 0.345098, 1, 0, 1,
-0.5560704, 0.1391626, -2.241643, 0.3372549, 1, 0, 1,
-0.5401925, -1.328447, -4.567511, 0.3333333, 1, 0, 1,
-0.5397276, -0.5584043, -3.142215, 0.3254902, 1, 0, 1,
-0.5345669, 0.810326, -2.498215, 0.3215686, 1, 0, 1,
-0.5277013, 0.2660114, -1.05991, 0.3137255, 1, 0, 1,
-0.5222223, 0.3767759, -1.132325, 0.3098039, 1, 0, 1,
-0.5207482, -0.6074189, -0.514707, 0.3019608, 1, 0, 1,
-0.5203246, 1.074075, -0.5549175, 0.2941177, 1, 0, 1,
-0.5151072, -0.4795344, -2.2521, 0.2901961, 1, 0, 1,
-0.515029, 0.9346169, -3.679827, 0.282353, 1, 0, 1,
-0.5148187, -0.4162805, -3.381682, 0.2784314, 1, 0, 1,
-0.5085139, 1.215826, -0.5013846, 0.2705882, 1, 0, 1,
-0.5041379, -0.3116832, 0.3972675, 0.2666667, 1, 0, 1,
-0.4999372, -0.2340205, -2.367054, 0.2588235, 1, 0, 1,
-0.4980606, -1.340161, -2.178587, 0.254902, 1, 0, 1,
-0.4920057, -0.9576667, -2.625244, 0.2470588, 1, 0, 1,
-0.4916771, 0.5540893, -1.077563, 0.2431373, 1, 0, 1,
-0.4905779, -1.609897, -3.075607, 0.2352941, 1, 0, 1,
-0.4870246, -1.20296, -1.61123, 0.2313726, 1, 0, 1,
-0.4856781, 0.1361896, -1.263544, 0.2235294, 1, 0, 1,
-0.4801053, 0.8366683, 0.4691422, 0.2196078, 1, 0, 1,
-0.4800141, 1.601633, 2.858444, 0.2117647, 1, 0, 1,
-0.4799576, -1.057593, -2.290038, 0.2078431, 1, 0, 1,
-0.4745777, -0.4254701, -3.099524, 0.2, 1, 0, 1,
-0.4647551, 0.03998149, -1.169921, 0.1921569, 1, 0, 1,
-0.4642512, 1.994601, 2.377318, 0.1882353, 1, 0, 1,
-0.4638196, -0.62976, -3.646569, 0.1803922, 1, 0, 1,
-0.4543669, -1.297775, -4.340662, 0.1764706, 1, 0, 1,
-0.452797, 1.240504, 1.119138, 0.1686275, 1, 0, 1,
-0.4473186, -0.1327276, -1.890043, 0.1647059, 1, 0, 1,
-0.4429518, 0.1310595, -2.721998, 0.1568628, 1, 0, 1,
-0.4418742, -0.7177445, -1.783745, 0.1529412, 1, 0, 1,
-0.4404657, -0.9991294, -1.75039, 0.145098, 1, 0, 1,
-0.4399436, 1.1462, -0.7501658, 0.1411765, 1, 0, 1,
-0.4371189, -0.3582771, 0.01234611, 0.1333333, 1, 0, 1,
-0.430976, 0.9685446, 1.378975, 0.1294118, 1, 0, 1,
-0.4295848, 0.2080477, -0.6622577, 0.1215686, 1, 0, 1,
-0.4286809, 2.426122, 0.07060399, 0.1176471, 1, 0, 1,
-0.423982, 1.411695, 0.4664422, 0.1098039, 1, 0, 1,
-0.4239297, 1.904761, -0.2325052, 0.1058824, 1, 0, 1,
-0.4216183, -0.867236, -3.198661, 0.09803922, 1, 0, 1,
-0.4197142, 0.8853506, -0.3583438, 0.09019608, 1, 0, 1,
-0.4161529, -0.5647348, -5.196449, 0.08627451, 1, 0, 1,
-0.4150608, 1.00089, -0.2251805, 0.07843138, 1, 0, 1,
-0.4142214, -1.599628, -1.925738, 0.07450981, 1, 0, 1,
-0.4140203, -0.6259283, -1.70115, 0.06666667, 1, 0, 1,
-0.4130203, -0.6495662, -1.006327, 0.0627451, 1, 0, 1,
-0.4118455, 0.2599653, -0.4082327, 0.05490196, 1, 0, 1,
-0.411199, 0.06650592, -0.5099993, 0.05098039, 1, 0, 1,
-0.4104807, -0.9143371, -2.680789, 0.04313726, 1, 0, 1,
-0.4099703, 0.03602489, -1.41633, 0.03921569, 1, 0, 1,
-0.4098668, 0.395538, -0.5527784, 0.03137255, 1, 0, 1,
-0.409069, 1.062888, 1.096568, 0.02745098, 1, 0, 1,
-0.4084857, -1.337786, -3.063359, 0.01960784, 1, 0, 1,
-0.4042422, 1.102533, -1.218397, 0.01568628, 1, 0, 1,
-0.3983037, 1.268571, -1.934164, 0.007843138, 1, 0, 1,
-0.3975793, -1.045509, -3.552737, 0.003921569, 1, 0, 1,
-0.3939669, -0.1072407, -2.197294, 0, 1, 0.003921569, 1,
-0.3868776, -0.9130407, -2.080773, 0, 1, 0.01176471, 1,
-0.3804261, -0.7512039, -2.124146, 0, 1, 0.01568628, 1,
-0.3799944, -2.04039, -3.014335, 0, 1, 0.02352941, 1,
-0.3711048, -1.133856, -1.106645, 0, 1, 0.02745098, 1,
-0.3708723, -0.2455894, -1.340594, 0, 1, 0.03529412, 1,
-0.3697601, -1.691915, -3.83604, 0, 1, 0.03921569, 1,
-0.3659453, -0.08033637, -0.006561068, 0, 1, 0.04705882, 1,
-0.3628044, -1.073619, -3.310134, 0, 1, 0.05098039, 1,
-0.3590765, 0.09743813, -3.292442, 0, 1, 0.05882353, 1,
-0.3562177, 1.609075, -0.6965815, 0, 1, 0.0627451, 1,
-0.353642, 1.481047, 0.2991285, 0, 1, 0.07058824, 1,
-0.3483039, -0.7901649, -1.67586, 0, 1, 0.07450981, 1,
-0.3361743, -0.6953544, -4.462494, 0, 1, 0.08235294, 1,
-0.3315648, -1.386264, -3.451134, 0, 1, 0.08627451, 1,
-0.3248746, -0.414349, -4.891046, 0, 1, 0.09411765, 1,
-0.321541, -0.2070776, -1.891868, 0, 1, 0.1019608, 1,
-0.3165272, -0.3106864, -2.320001, 0, 1, 0.1058824, 1,
-0.3136298, -0.6998836, -3.432801, 0, 1, 0.1137255, 1,
-0.3135644, 0.7295182, 0.1990175, 0, 1, 0.1176471, 1,
-0.3105395, 2.095482, -0.7605551, 0, 1, 0.1254902, 1,
-0.3048315, 1.934679, -0.5663475, 0, 1, 0.1294118, 1,
-0.3042289, 0.8352791, -1.564474, 0, 1, 0.1372549, 1,
-0.30123, 0.02178688, 0.6341417, 0, 1, 0.1411765, 1,
-0.300442, 1.393778, -0.6826945, 0, 1, 0.1490196, 1,
-0.3001089, 0.2035915, -1.3383, 0, 1, 0.1529412, 1,
-0.2970704, 0.8082209, -0.9946747, 0, 1, 0.1607843, 1,
-0.2953391, -1.363586, -4.366647, 0, 1, 0.1647059, 1,
-0.2938919, -1.225589, -2.650093, 0, 1, 0.172549, 1,
-0.2914369, 0.5905215, 0.104807, 0, 1, 0.1764706, 1,
-0.2763121, -1.125716, -3.391609, 0, 1, 0.1843137, 1,
-0.2708216, -0.5691444, -2.384947, 0, 1, 0.1882353, 1,
-0.2700532, -1.537471, -3.215053, 0, 1, 0.1960784, 1,
-0.2638196, -1.501142, -4.588811, 0, 1, 0.2039216, 1,
-0.2623372, -0.7031931, -1.498697, 0, 1, 0.2078431, 1,
-0.2588066, 0.06589933, -1.430776, 0, 1, 0.2156863, 1,
-0.2578194, 2.401964, -0.1993388, 0, 1, 0.2196078, 1,
-0.2568601, -0.5480561, -2.407471, 0, 1, 0.227451, 1,
-0.2552868, -0.6240615, -2.026065, 0, 1, 0.2313726, 1,
-0.2547017, -0.09927184, -2.785582, 0, 1, 0.2392157, 1,
-0.2546422, -0.2505212, -2.809524, 0, 1, 0.2431373, 1,
-0.2528904, -0.1553774, -0.8895527, 0, 1, 0.2509804, 1,
-0.2502661, 1.293885, -0.009253816, 0, 1, 0.254902, 1,
-0.2496065, -0.4650514, -0.455537, 0, 1, 0.2627451, 1,
-0.2486319, 2.7409, -1.356878, 0, 1, 0.2666667, 1,
-0.248512, 0.01861144, -0.7516955, 0, 1, 0.2745098, 1,
-0.2460219, 0.9298241, 0.07802201, 0, 1, 0.2784314, 1,
-0.2449124, 0.1965439, -1.12562, 0, 1, 0.2862745, 1,
-0.2441556, -0.01731233, -0.8238888, 0, 1, 0.2901961, 1,
-0.2394993, 1.376235, 1.601698, 0, 1, 0.2980392, 1,
-0.2352623, 0.5644571, 1.577076, 0, 1, 0.3058824, 1,
-0.2350837, -0.3964283, -2.900852, 0, 1, 0.3098039, 1,
-0.2326662, -0.2443298, -2.346929, 0, 1, 0.3176471, 1,
-0.2257217, 0.9839737, 0.9815577, 0, 1, 0.3215686, 1,
-0.2209575, -1.825436, -4.741308, 0, 1, 0.3294118, 1,
-0.2137545, -0.5645388, -2.267651, 0, 1, 0.3333333, 1,
-0.2127789, -0.2887721, -0.9088832, 0, 1, 0.3411765, 1,
-0.2102629, -0.4571802, -3.591104, 0, 1, 0.345098, 1,
-0.2012012, 0.5097413, 1.274542, 0, 1, 0.3529412, 1,
-0.1986017, 0.6623914, -0.6072206, 0, 1, 0.3568628, 1,
-0.1974241, 0.2622526, -1.073634, 0, 1, 0.3647059, 1,
-0.197404, 2.299915, 0.7760907, 0, 1, 0.3686275, 1,
-0.196722, -1.916482, -1.706431, 0, 1, 0.3764706, 1,
-0.1964962, 1.113532, 1.479172, 0, 1, 0.3803922, 1,
-0.1955765, -0.4855538, -0.4371954, 0, 1, 0.3882353, 1,
-0.1932113, 0.6823695, 0.4264948, 0, 1, 0.3921569, 1,
-0.1907458, 1.53703, -0.5682039, 0, 1, 0.4, 1,
-0.1904948, -2.369029, -3.90776, 0, 1, 0.4078431, 1,
-0.1902822, 0.1976223, -0.4797781, 0, 1, 0.4117647, 1,
-0.1899262, -1.384309, -2.600821, 0, 1, 0.4196078, 1,
-0.1889908, 2.46431, -0.2080559, 0, 1, 0.4235294, 1,
-0.1889308, 0.4641013, -0.529664, 0, 1, 0.4313726, 1,
-0.1885247, 0.4613351, -0.670754, 0, 1, 0.4352941, 1,
-0.1873307, -0.1444978, -4.435366, 0, 1, 0.4431373, 1,
-0.1796528, 0.6017611, -1.288154, 0, 1, 0.4470588, 1,
-0.1792707, -1.284144, -3.906389, 0, 1, 0.454902, 1,
-0.1765678, 1.363533, -0.9112991, 0, 1, 0.4588235, 1,
-0.1758551, -0.7156, -3.957175, 0, 1, 0.4666667, 1,
-0.1746146, 0.7407547, 0.5804923, 0, 1, 0.4705882, 1,
-0.172785, 0.9381543, -0.4312207, 0, 1, 0.4784314, 1,
-0.172379, 0.4546881, -2.202492, 0, 1, 0.4823529, 1,
-0.1692053, -1.886587, -3.902704, 0, 1, 0.4901961, 1,
-0.1555997, -0.4743899, -4.267246, 0, 1, 0.4941176, 1,
-0.152546, -3.46402, -1.482107, 0, 1, 0.5019608, 1,
-0.1494546, 0.4945004, -0.8377742, 0, 1, 0.509804, 1,
-0.1459793, -0.1668689, -2.279866, 0, 1, 0.5137255, 1,
-0.1413618, -1.174393, -3.063099, 0, 1, 0.5215687, 1,
-0.1408235, 1.130664, -1.182732, 0, 1, 0.5254902, 1,
-0.1387433, -0.9167031, -1.674425, 0, 1, 0.5333334, 1,
-0.1289317, -0.8114207, -3.543781, 0, 1, 0.5372549, 1,
-0.1281279, 0.9212381, 1.666246, 0, 1, 0.5450981, 1,
-0.124848, -0.471339, -3.642241, 0, 1, 0.5490196, 1,
-0.1237177, -1.667307, -2.858659, 0, 1, 0.5568628, 1,
-0.122324, -0.8838625, -2.725508, 0, 1, 0.5607843, 1,
-0.1166934, -0.4633547, -3.538114, 0, 1, 0.5686275, 1,
-0.1125803, 0.02767559, 0.1947607, 0, 1, 0.572549, 1,
-0.1115915, -0.8923059, -0.5589786, 0, 1, 0.5803922, 1,
-0.1106457, 0.2346957, -1.336314, 0, 1, 0.5843138, 1,
-0.1031815, -0.3017303, -1.850576, 0, 1, 0.5921569, 1,
-0.1013112, -0.1688297, -1.304767, 0, 1, 0.5960785, 1,
-0.1004667, 0.1326164, 1.157378, 0, 1, 0.6039216, 1,
-0.09745913, -3.03231, -4.329507, 0, 1, 0.6117647, 1,
-0.09703038, -1.230435, -3.698691, 0, 1, 0.6156863, 1,
-0.09413134, -0.9030882, -4.210132, 0, 1, 0.6235294, 1,
-0.08767856, -1.580338, -3.509001, 0, 1, 0.627451, 1,
-0.08734577, -0.986362, -4.052603, 0, 1, 0.6352941, 1,
-0.08251634, 1.017238, 1.064021, 0, 1, 0.6392157, 1,
-0.0824229, 0.2552727, -0.4304962, 0, 1, 0.6470588, 1,
-0.07901954, 0.4773817, -0.1003905, 0, 1, 0.6509804, 1,
-0.07497557, -1.437652, -2.726264, 0, 1, 0.6588235, 1,
-0.07147598, 0.1921264, -0.1999549, 0, 1, 0.6627451, 1,
-0.06524092, -1.466126, -2.524098, 0, 1, 0.6705883, 1,
-0.06450095, 0.357854, -1.371939, 0, 1, 0.6745098, 1,
-0.06186933, -0.09985013, -2.138858, 0, 1, 0.682353, 1,
-0.06145395, 2.120329, -1.164409, 0, 1, 0.6862745, 1,
-0.05704018, 0.2278489, 1.339901, 0, 1, 0.6941177, 1,
-0.05620223, -0.7505789, -2.816168, 0, 1, 0.7019608, 1,
-0.05106881, -0.7237117, -3.987215, 0, 1, 0.7058824, 1,
-0.0506912, 0.6543589, -1.471254, 0, 1, 0.7137255, 1,
-0.04910596, 0.3162851, -0.03163124, 0, 1, 0.7176471, 1,
-0.04773318, -0.7324302, -4.693626, 0, 1, 0.7254902, 1,
-0.04680541, -0.3525653, -4.010641, 0, 1, 0.7294118, 1,
-0.04598947, 0.06858362, 0.5273626, 0, 1, 0.7372549, 1,
-0.04565093, -0.7900877, -2.504403, 0, 1, 0.7411765, 1,
-0.03935389, 1.713064, 0.2571216, 0, 1, 0.7490196, 1,
-0.03906817, -0.03743768, -1.621376, 0, 1, 0.7529412, 1,
-0.03573783, 0.01096712, 0.5083677, 0, 1, 0.7607843, 1,
-0.02823492, -0.4240869, -2.001707, 0, 1, 0.7647059, 1,
-0.02154152, -1.179682, -4.968519, 0, 1, 0.772549, 1,
-0.0197126, -1.036218, -3.086623, 0, 1, 0.7764706, 1,
-0.01844393, 0.5662152, 0.2708147, 0, 1, 0.7843137, 1,
-0.01596559, -0.0004487788, -0.2202598, 0, 1, 0.7882353, 1,
-0.01445004, 0.4088625, 0.05486533, 0, 1, 0.7960784, 1,
-0.01060253, -0.3821184, -3.606472, 0, 1, 0.8039216, 1,
-0.007710253, -0.4668829, -3.812626, 0, 1, 0.8078431, 1,
-0.007650245, 0.1506056, -0.4517228, 0, 1, 0.8156863, 1,
-0.006061485, -1.561455, -3.193151, 0, 1, 0.8196079, 1,
-0.004299235, 0.9784697, -0.3245508, 0, 1, 0.827451, 1,
-0.004232115, -1.475714, -3.048661, 0, 1, 0.8313726, 1,
-0.001183431, -0.4315491, -3.33667, 0, 1, 0.8392157, 1,
0.0008174089, 0.6681029, -0.2897312, 0, 1, 0.8431373, 1,
0.00159287, -2.787012, 3.215346, 0, 1, 0.8509804, 1,
0.004152507, 0.8573897, -0.6583754, 0, 1, 0.854902, 1,
0.005121984, -0.692814, 2.359903, 0, 1, 0.8627451, 1,
0.008405776, 0.4168091, -0.5444559, 0, 1, 0.8666667, 1,
0.009808597, 1.231352, -0.3503519, 0, 1, 0.8745098, 1,
0.01175565, -0.003869094, 1.590725, 0, 1, 0.8784314, 1,
0.01250553, 0.05787222, -0.1736111, 0, 1, 0.8862745, 1,
0.01589532, 1.378834, 0.9396952, 0, 1, 0.8901961, 1,
0.01710512, -0.5021945, 0.8238104, 0, 1, 0.8980392, 1,
0.01907632, 0.5479803, -1.148555, 0, 1, 0.9058824, 1,
0.02143501, 0.8688961, -0.2621824, 0, 1, 0.9098039, 1,
0.02941573, 0.5630303, -0.7357992, 0, 1, 0.9176471, 1,
0.03512516, -0.9643554, 1.462788, 0, 1, 0.9215686, 1,
0.04005452, 0.1740449, 2.718206, 0, 1, 0.9294118, 1,
0.04251077, 1.372838, 0.2813956, 0, 1, 0.9333333, 1,
0.0457132, -0.5531194, 3.28668, 0, 1, 0.9411765, 1,
0.04798684, 0.1409109, 2.232697, 0, 1, 0.945098, 1,
0.05108818, 0.02642081, 2.221114, 0, 1, 0.9529412, 1,
0.05136836, -0.6548988, 3.372458, 0, 1, 0.9568627, 1,
0.05272467, 0.334113, -0.8206469, 0, 1, 0.9647059, 1,
0.05378077, -0.73343, 1.345137, 0, 1, 0.9686275, 1,
0.05633916, 0.5995025, 0.2708841, 0, 1, 0.9764706, 1,
0.05847554, -1.262321, 1.860089, 0, 1, 0.9803922, 1,
0.05979365, -0.4789916, 3.136073, 0, 1, 0.9882353, 1,
0.06165211, -2.232762, 2.096803, 0, 1, 0.9921569, 1,
0.06526337, -1.172575, 2.960622, 0, 1, 1, 1,
0.07756366, -1.696223, 4.470753, 0, 0.9921569, 1, 1,
0.08189984, 0.8501608, 0.8794454, 0, 0.9882353, 1, 1,
0.08591709, -1.110218, 3.452897, 0, 0.9803922, 1, 1,
0.09098628, -0.9051139, 3.257506, 0, 0.9764706, 1, 1,
0.09268172, -0.6912925, 2.345963, 0, 0.9686275, 1, 1,
0.09332872, -2.095608, 2.592009, 0, 0.9647059, 1, 1,
0.09450284, 0.006795152, 2.746612, 0, 0.9568627, 1, 1,
0.09621011, -0.5159956, 3.931008, 0, 0.9529412, 1, 1,
0.09727023, -1.390862, 4.105057, 0, 0.945098, 1, 1,
0.09771474, 0.1569032, 0.3270006, 0, 0.9411765, 1, 1,
0.09803193, 0.5072008, 0.3256804, 0, 0.9333333, 1, 1,
0.0992871, 1.447043, 1.430406, 0, 0.9294118, 1, 1,
0.1076496, 0.3973009, -0.04558711, 0, 0.9215686, 1, 1,
0.1078902, 2.026021, 1.451415, 0, 0.9176471, 1, 1,
0.1126141, 0.8381447, -1.206276, 0, 0.9098039, 1, 1,
0.1158416, -1.416163, 2.101243, 0, 0.9058824, 1, 1,
0.1179222, -0.04590918, 2.842171, 0, 0.8980392, 1, 1,
0.1195016, -0.6464043, 4.195814, 0, 0.8901961, 1, 1,
0.1231428, 0.2337922, -0.1357755, 0, 0.8862745, 1, 1,
0.1238177, -1.218352, 2.241944, 0, 0.8784314, 1, 1,
0.1249431, -1.589684, 1.748738, 0, 0.8745098, 1, 1,
0.1293477, -0.7844394, 4.247541, 0, 0.8666667, 1, 1,
0.1354858, -0.8507183, 4.873432, 0, 0.8627451, 1, 1,
0.1384347, 1.796325, 0.7631317, 0, 0.854902, 1, 1,
0.1438844, 1.693307, -0.4188132, 0, 0.8509804, 1, 1,
0.14439, 0.4802557, 1.446995, 0, 0.8431373, 1, 1,
0.1461517, 0.1192842, -0.4506679, 0, 0.8392157, 1, 1,
0.1470026, 1.057697, -0.7327399, 0, 0.8313726, 1, 1,
0.1493553, -0.6397523, 3.192926, 0, 0.827451, 1, 1,
0.1508589, -1.446735, 1.990536, 0, 0.8196079, 1, 1,
0.1524943, -0.609705, 1.770547, 0, 0.8156863, 1, 1,
0.1542853, -0.4885334, 5.368961, 0, 0.8078431, 1, 1,
0.15673, -1.615745, 3.840578, 0, 0.8039216, 1, 1,
0.1572984, 0.6502156, 0.8207456, 0, 0.7960784, 1, 1,
0.1578163, -0.9257839, 5.274794, 0, 0.7882353, 1, 1,
0.1590701, -2.523385, 4.492932, 0, 0.7843137, 1, 1,
0.1608891, -0.6125656, 3.673443, 0, 0.7764706, 1, 1,
0.1635595, -0.2464156, 3.624142, 0, 0.772549, 1, 1,
0.1636789, 1.661976, 0.4768161, 0, 0.7647059, 1, 1,
0.1638176, -0.8739687, 3.430935, 0, 0.7607843, 1, 1,
0.1638324, -1.466252, 1.419065, 0, 0.7529412, 1, 1,
0.1648555, -1.509089, 2.822474, 0, 0.7490196, 1, 1,
0.1734964, -0.9891567, 4.974423, 0, 0.7411765, 1, 1,
0.1783209, 0.8206307, 0.8320551, 0, 0.7372549, 1, 1,
0.1801103, -0.492057, 1.087627, 0, 0.7294118, 1, 1,
0.1854584, 0.01151147, 1.779783, 0, 0.7254902, 1, 1,
0.1857897, 0.0629875, 0.6684366, 0, 0.7176471, 1, 1,
0.1880612, 2.141018, -0.728885, 0, 0.7137255, 1, 1,
0.1883258, -1.021855, 4.17252, 0, 0.7058824, 1, 1,
0.1894182, 0.7479, 0.224189, 0, 0.6980392, 1, 1,
0.1897983, -1.944247, 2.260352, 0, 0.6941177, 1, 1,
0.1932352, -0.2470975, 2.433107, 0, 0.6862745, 1, 1,
0.1955796, -0.1261058, 2.925037, 0, 0.682353, 1, 1,
0.1960886, 1.026736, 0.8710558, 0, 0.6745098, 1, 1,
0.1986487, 0.1064898, 0.5854902, 0, 0.6705883, 1, 1,
0.1993078, -0.9472433, 1.467141, 0, 0.6627451, 1, 1,
0.2009032, -2.271613, 2.892831, 0, 0.6588235, 1, 1,
0.209205, -1.193184, 1.309997, 0, 0.6509804, 1, 1,
0.2183062, 0.05307163, 0.8049272, 0, 0.6470588, 1, 1,
0.2186593, 0.7690343, 0.2922359, 0, 0.6392157, 1, 1,
0.2190565, 0.2488841, 2.139183, 0, 0.6352941, 1, 1,
0.2209925, -1.074095, 3.995619, 0, 0.627451, 1, 1,
0.2238632, 0.9099332, 0.3841262, 0, 0.6235294, 1, 1,
0.2241197, -0.8824849, 2.350444, 0, 0.6156863, 1, 1,
0.2244647, 0.5988244, 0.5101846, 0, 0.6117647, 1, 1,
0.2261739, -0.3082997, 4.22749, 0, 0.6039216, 1, 1,
0.2283761, 0.31499, 0.7453995, 0, 0.5960785, 1, 1,
0.2291021, 1.17768, -0.4277952, 0, 0.5921569, 1, 1,
0.233132, 0.3467782, 1.501692, 0, 0.5843138, 1, 1,
0.233164, 1.002825, 1.109527, 0, 0.5803922, 1, 1,
0.2337721, -1.301306, 2.921197, 0, 0.572549, 1, 1,
0.2365968, 0.1867469, 0.8197254, 0, 0.5686275, 1, 1,
0.2390523, -0.1407532, 2.718364, 0, 0.5607843, 1, 1,
0.2418132, 0.6580153, 2.285866, 0, 0.5568628, 1, 1,
0.2448423, 0.4005488, 1.846763, 0, 0.5490196, 1, 1,
0.2452638, -1.354256, 1.732548, 0, 0.5450981, 1, 1,
0.2465725, -0.2582199, 2.697129, 0, 0.5372549, 1, 1,
0.2526443, 1.148792, 0.5867296, 0, 0.5333334, 1, 1,
0.253268, 0.8481792, 2.448512, 0, 0.5254902, 1, 1,
0.2541194, 0.457436, 0.6378945, 0, 0.5215687, 1, 1,
0.2547337, -0.7819266, 3.026484, 0, 0.5137255, 1, 1,
0.2554604, -1.611878, 2.48552, 0, 0.509804, 1, 1,
0.2572983, 1.282514, -1.154214, 0, 0.5019608, 1, 1,
0.2622476, -1.252945, 3.892411, 0, 0.4941176, 1, 1,
0.2627236, 0.2779607, 1.387179, 0, 0.4901961, 1, 1,
0.2666386, -0.8135555, 3.567385, 0, 0.4823529, 1, 1,
0.2667032, 0.3045876, 1.307194, 0, 0.4784314, 1, 1,
0.2668588, 0.261838, -0.6482511, 0, 0.4705882, 1, 1,
0.2690594, -0.3460155, 2.340128, 0, 0.4666667, 1, 1,
0.2712247, 0.7848621, 1.26809, 0, 0.4588235, 1, 1,
0.2778517, -1.377425, 2.656274, 0, 0.454902, 1, 1,
0.279074, 0.3308918, 1.947626, 0, 0.4470588, 1, 1,
0.2810913, 2.263598, -0.7664068, 0, 0.4431373, 1, 1,
0.2939221, 0.2259124, -1.387138, 0, 0.4352941, 1, 1,
0.297671, -1.587666, 3.274227, 0, 0.4313726, 1, 1,
0.2999884, 0.43622, 0.6186243, 0, 0.4235294, 1, 1,
0.3030043, 0.5146197, 0.7059575, 0, 0.4196078, 1, 1,
0.3031428, 0.3244202, -0.4548949, 0, 0.4117647, 1, 1,
0.3119219, -0.0485375, 1.072804, 0, 0.4078431, 1, 1,
0.3122789, -0.04623363, 0.9764937, 0, 0.4, 1, 1,
0.3132392, -0.239401, 1.481021, 0, 0.3921569, 1, 1,
0.3132685, -0.2211966, 1.298536, 0, 0.3882353, 1, 1,
0.3161887, -1.000361, 3.154553, 0, 0.3803922, 1, 1,
0.3201776, 1.116684, 0.5432305, 0, 0.3764706, 1, 1,
0.3214392, 0.6760092, -0.2351224, 0, 0.3686275, 1, 1,
0.3217596, -2.083532, 2.914854, 0, 0.3647059, 1, 1,
0.3237505, -0.2226374, 2.839879, 0, 0.3568628, 1, 1,
0.326028, 1.491505, -0.7528901, 0, 0.3529412, 1, 1,
0.326158, 0.4387646, 0.8118916, 0, 0.345098, 1, 1,
0.3278714, -0.6395687, 3.800836, 0, 0.3411765, 1, 1,
0.3300565, -0.2557395, 4.548095, 0, 0.3333333, 1, 1,
0.3323296, 1.577585, 1.179878, 0, 0.3294118, 1, 1,
0.3324448, 0.7568415, -0.08714249, 0, 0.3215686, 1, 1,
0.3368377, 0.9868293, -0.9205304, 0, 0.3176471, 1, 1,
0.3369751, 1.143798, 0.9809472, 0, 0.3098039, 1, 1,
0.3387118, 0.168266, 0.3891879, 0, 0.3058824, 1, 1,
0.3388669, -0.1957228, 1.049983, 0, 0.2980392, 1, 1,
0.3463484, 0.4164695, -1.995272, 0, 0.2901961, 1, 1,
0.3489115, -0.005521328, 1.48186, 0, 0.2862745, 1, 1,
0.3515714, -0.42941, 3.866818, 0, 0.2784314, 1, 1,
0.357605, -0.4822642, 3.750451, 0, 0.2745098, 1, 1,
0.3594699, -1.17846, 2.471499, 0, 0.2666667, 1, 1,
0.3630699, 0.9359047, 0.0901972, 0, 0.2627451, 1, 1,
0.3639167, -0.9073938, 1.738981, 0, 0.254902, 1, 1,
0.3643115, 0.3655151, 1.385149, 0, 0.2509804, 1, 1,
0.3650069, 0.2353908, 0.9364368, 0, 0.2431373, 1, 1,
0.3670292, -0.1996945, 1.508902, 0, 0.2392157, 1, 1,
0.3692303, -0.8748198, 2.337635, 0, 0.2313726, 1, 1,
0.3732997, 2.000389, 0.2014081, 0, 0.227451, 1, 1,
0.3745683, -1.155936, 3.98571, 0, 0.2196078, 1, 1,
0.374692, 0.591552, 0.3941389, 0, 0.2156863, 1, 1,
0.378527, 1.531378, 0.194189, 0, 0.2078431, 1, 1,
0.3806837, -0.305706, 1.103638, 0, 0.2039216, 1, 1,
0.3813098, -0.5109624, 2.733519, 0, 0.1960784, 1, 1,
0.3842291, -0.1830484, 0.8401656, 0, 0.1882353, 1, 1,
0.3863876, 0.6757131, 1.506672, 0, 0.1843137, 1, 1,
0.3880935, 0.8802309, 2.040561, 0, 0.1764706, 1, 1,
0.3886583, 0.111706, 3.403595, 0, 0.172549, 1, 1,
0.3909119, -0.6268826, 2.435364, 0, 0.1647059, 1, 1,
0.3919682, -0.1153302, 2.02531, 0, 0.1607843, 1, 1,
0.3979189, -0.01607959, 1.612268, 0, 0.1529412, 1, 1,
0.3983774, 0.8721681, -0.7373582, 0, 0.1490196, 1, 1,
0.4018767, -0.4909401, 1.758112, 0, 0.1411765, 1, 1,
0.4103313, -0.2735757, 2.006565, 0, 0.1372549, 1, 1,
0.4160625, -1.032416, 1.096804, 0, 0.1294118, 1, 1,
0.4198942, -0.2488543, 2.944551, 0, 0.1254902, 1, 1,
0.4217964, -0.3176441, 3.141765, 0, 0.1176471, 1, 1,
0.4229333, -0.9685972, 4.697314, 0, 0.1137255, 1, 1,
0.4265156, -0.2714885, 3.018027, 0, 0.1058824, 1, 1,
0.4267914, 0.2287285, 5.005039, 0, 0.09803922, 1, 1,
0.4286376, 0.18298, 0.1671846, 0, 0.09411765, 1, 1,
0.4302829, -2.219299, 4.440408, 0, 0.08627451, 1, 1,
0.437231, 1.072473, 0.7511889, 0, 0.08235294, 1, 1,
0.4385035, 2.043328, 0.5449704, 0, 0.07450981, 1, 1,
0.4386985, 0.08834365, 1.87627, 0, 0.07058824, 1, 1,
0.4393158, -1.767007, 2.295588, 0, 0.0627451, 1, 1,
0.4411553, 0.6857495, 1.041018, 0, 0.05882353, 1, 1,
0.441835, -0.816562, 2.638981, 0, 0.05098039, 1, 1,
0.4430517, -0.1086923, 1.571086, 0, 0.04705882, 1, 1,
0.4446394, -0.4990797, 3.085758, 0, 0.03921569, 1, 1,
0.4467162, 0.1760788, 1.457911, 0, 0.03529412, 1, 1,
0.4503677, -0.04270959, 0.113557, 0, 0.02745098, 1, 1,
0.4513554, -0.5907062, 1.520454, 0, 0.02352941, 1, 1,
0.4529301, 0.3726652, -0.8480733, 0, 0.01568628, 1, 1,
0.4594259, -0.4639092, -0.3779974, 0, 0.01176471, 1, 1,
0.4607001, 1.526645, 2.048698, 0, 0.003921569, 1, 1,
0.4677604, -0.3038938, 1.312233, 0.003921569, 0, 1, 1,
0.4688096, 0.4690406, 0.2577435, 0.007843138, 0, 1, 1,
0.4692498, -0.5092945, 2.302285, 0.01568628, 0, 1, 1,
0.4718476, 0.4281043, 2.188051, 0.01960784, 0, 1, 1,
0.4720172, -0.1900352, 1.546624, 0.02745098, 0, 1, 1,
0.4731452, 1.248026, -0.07143364, 0.03137255, 0, 1, 1,
0.4754623, -1.434766, 4.01731, 0.03921569, 0, 1, 1,
0.4783116, 1.54507, -0.129392, 0.04313726, 0, 1, 1,
0.4873148, 0.221699, 1.584688, 0.05098039, 0, 1, 1,
0.4879364, -1.064313, 4.504519, 0.05490196, 0, 1, 1,
0.4921636, -0.8747113, 1.617894, 0.0627451, 0, 1, 1,
0.4948613, 0.4292946, 0.9114898, 0.06666667, 0, 1, 1,
0.498412, -0.1584279, 2.510036, 0.07450981, 0, 1, 1,
0.4998457, -2.239233, 1.349112, 0.07843138, 0, 1, 1,
0.5032306, -1.084834, 2.554394, 0.08627451, 0, 1, 1,
0.5048267, -0.04733683, 0.08653293, 0.09019608, 0, 1, 1,
0.5068573, 0.8534776, -0.7192147, 0.09803922, 0, 1, 1,
0.5108142, 0.2456718, 0.6554165, 0.1058824, 0, 1, 1,
0.5134737, 0.6496767, 1.040086, 0.1098039, 0, 1, 1,
0.5159246, -2.520965, 2.122821, 0.1176471, 0, 1, 1,
0.5182584, 1.11473, 0.07186694, 0.1215686, 0, 1, 1,
0.519184, -0.4686069, 1.811933, 0.1294118, 0, 1, 1,
0.5210795, 0.1037382, 1.646888, 0.1333333, 0, 1, 1,
0.5218642, -1.356071, 1.081792, 0.1411765, 0, 1, 1,
0.5235979, 1.600436, 1.019745, 0.145098, 0, 1, 1,
0.5238532, -1.215645, 1.326676, 0.1529412, 0, 1, 1,
0.5247642, 0.7127739, -1.106796, 0.1568628, 0, 1, 1,
0.5250298, 1.164493, 0.6604491, 0.1647059, 0, 1, 1,
0.5286496, 0.1889164, -0.4037628, 0.1686275, 0, 1, 1,
0.5303668, -0.6635987, 1.205609, 0.1764706, 0, 1, 1,
0.5400318, 0.03301005, 1.617566, 0.1803922, 0, 1, 1,
0.5402705, 0.1714064, 0.771657, 0.1882353, 0, 1, 1,
0.5429021, 0.8344479, 1.630596, 0.1921569, 0, 1, 1,
0.5447485, -2.633765, 4.158821, 0.2, 0, 1, 1,
0.5485482, 0.3763521, -1.084603, 0.2078431, 0, 1, 1,
0.549374, 0.4181419, 0.9945548, 0.2117647, 0, 1, 1,
0.549544, -1.766734, 3.017808, 0.2196078, 0, 1, 1,
0.5500159, 2.449334, -1.032877, 0.2235294, 0, 1, 1,
0.5566748, 0.2094788, 0.9793824, 0.2313726, 0, 1, 1,
0.5571092, -0.3952498, 2.619261, 0.2352941, 0, 1, 1,
0.559208, -1.357137, 2.977435, 0.2431373, 0, 1, 1,
0.5599169, -0.6507387, 2.744222, 0.2470588, 0, 1, 1,
0.5683621, -0.3874375, 0.2953757, 0.254902, 0, 1, 1,
0.5689665, -1.781597, 1.626645, 0.2588235, 0, 1, 1,
0.5698078, -0.4013196, 2.29329, 0.2666667, 0, 1, 1,
0.5789706, -1.291498, 3.537357, 0.2705882, 0, 1, 1,
0.5814754, 0.8957407, -0.3819047, 0.2784314, 0, 1, 1,
0.5845392, 0.4190791, 1.309012, 0.282353, 0, 1, 1,
0.5860919, 2.013896, 0.6760282, 0.2901961, 0, 1, 1,
0.5942798, 1.081555, -0.1174785, 0.2941177, 0, 1, 1,
0.5981067, -0.2357786, 1.219529, 0.3019608, 0, 1, 1,
0.6064484, 0.5524006, 0.7519696, 0.3098039, 0, 1, 1,
0.6121247, 0.5999099, -0.6555535, 0.3137255, 0, 1, 1,
0.6144301, 0.4362769, 0.1968246, 0.3215686, 0, 1, 1,
0.6150724, 0.5895299, 2.10625, 0.3254902, 0, 1, 1,
0.6156338, 1.640566, 1.301052, 0.3333333, 0, 1, 1,
0.6174204, 0.1102668, 2.620249, 0.3372549, 0, 1, 1,
0.6203216, -0.7471994, 4.15518, 0.345098, 0, 1, 1,
0.6230236, -1.187033, 2.953887, 0.3490196, 0, 1, 1,
0.6313246, -0.5444837, 1.559651, 0.3568628, 0, 1, 1,
0.6358397, 2.697641, 0.2045483, 0.3607843, 0, 1, 1,
0.6358654, 2.935437, -0.2796129, 0.3686275, 0, 1, 1,
0.637566, -0.2327709, 2.655626, 0.372549, 0, 1, 1,
0.6382506, 0.1361754, 1.093188, 0.3803922, 0, 1, 1,
0.6416284, -0.2038497, 1.036629, 0.3843137, 0, 1, 1,
0.6421271, -2.247925, 0.9785297, 0.3921569, 0, 1, 1,
0.6440513, 1.408255, -0.5995395, 0.3960784, 0, 1, 1,
0.645164, -0.2901669, 1.57671, 0.4039216, 0, 1, 1,
0.6456432, -1.048856, 2.098161, 0.4117647, 0, 1, 1,
0.6494138, 0.4764221, 1.261918, 0.4156863, 0, 1, 1,
0.6525095, 0.568238, 0.2955161, 0.4235294, 0, 1, 1,
0.6557288, -0.751305, 1.416458, 0.427451, 0, 1, 1,
0.6594862, 2.130306, 1.259667, 0.4352941, 0, 1, 1,
0.6627914, -0.236618, 3.930074, 0.4392157, 0, 1, 1,
0.6653739, -0.4836505, 3.199239, 0.4470588, 0, 1, 1,
0.6659029, 0.9728388, 0.3216698, 0.4509804, 0, 1, 1,
0.668613, -0.6444804, 2.856757, 0.4588235, 0, 1, 1,
0.6769866, 0.9769703, 1.253531, 0.4627451, 0, 1, 1,
0.6777114, -0.8800768, 2.401954, 0.4705882, 0, 1, 1,
0.6897002, -0.001200384, 1.072957, 0.4745098, 0, 1, 1,
0.6941626, 0.02387317, 0.3798994, 0.4823529, 0, 1, 1,
0.6975844, -0.001972988, 1.061613, 0.4862745, 0, 1, 1,
0.7022356, 1.435264, 1.650879, 0.4941176, 0, 1, 1,
0.7040629, 0.537496, 1.07181, 0.5019608, 0, 1, 1,
0.7053924, -1.126592, 3.223082, 0.5058824, 0, 1, 1,
0.7098692, -0.6670092, 3.493458, 0.5137255, 0, 1, 1,
0.7146382, -0.04996772, 1.152591, 0.5176471, 0, 1, 1,
0.7158343, 2.036933, -0.6319583, 0.5254902, 0, 1, 1,
0.7167665, -0.5765417, 1.0418, 0.5294118, 0, 1, 1,
0.7181132, 2.817714, -0.5350382, 0.5372549, 0, 1, 1,
0.7202176, -0.3782752, 0.491406, 0.5411765, 0, 1, 1,
0.7220367, 1.627172, -0.2657776, 0.5490196, 0, 1, 1,
0.7229701, 1.666481, 0.3240165, 0.5529412, 0, 1, 1,
0.7293314, 1.685596, 0.869499, 0.5607843, 0, 1, 1,
0.7361904, 1.502754, 0.8238664, 0.5647059, 0, 1, 1,
0.7369731, 0.1873735, 1.301483, 0.572549, 0, 1, 1,
0.7374277, 2.03384, 0.8033581, 0.5764706, 0, 1, 1,
0.737505, 0.5172772, 1.299383, 0.5843138, 0, 1, 1,
0.7392387, -1.139776, 2.218566, 0.5882353, 0, 1, 1,
0.7524907, 0.6451762, 1.004327, 0.5960785, 0, 1, 1,
0.7531619, -2.726261, 1.995655, 0.6039216, 0, 1, 1,
0.7574497, 0.2700286, -0.1671084, 0.6078432, 0, 1, 1,
0.7576885, -1.301193, 3.506872, 0.6156863, 0, 1, 1,
0.7614205, -0.2470013, 1.612793, 0.6196079, 0, 1, 1,
0.7619269, -2.259629, 3.26369, 0.627451, 0, 1, 1,
0.7642424, 0.7643322, 1.04067, 0.6313726, 0, 1, 1,
0.7669038, 2.070289, 0.8212334, 0.6392157, 0, 1, 1,
0.7671099, 0.686672, -1.112825, 0.6431373, 0, 1, 1,
0.7741495, 0.5322818, 1.216321, 0.6509804, 0, 1, 1,
0.7745917, -0.04590685, 0.3651905, 0.654902, 0, 1, 1,
0.7820188, -0.9863456, 2.297695, 0.6627451, 0, 1, 1,
0.785457, -0.6419557, 1.493936, 0.6666667, 0, 1, 1,
0.7861192, -0.2488364, 2.110135, 0.6745098, 0, 1, 1,
0.7867167, 0.3210658, -0.433816, 0.6784314, 0, 1, 1,
0.788165, -1.051536, 3.080214, 0.6862745, 0, 1, 1,
0.7900707, 0.04838495, 1.189304, 0.6901961, 0, 1, 1,
0.8024976, -1.429814, 1.280199, 0.6980392, 0, 1, 1,
0.8027351, -0.3696987, 1.069448, 0.7058824, 0, 1, 1,
0.8028293, -0.6156095, 2.682144, 0.7098039, 0, 1, 1,
0.8041254, -0.4718757, 2.18492, 0.7176471, 0, 1, 1,
0.8107566, -0.2624547, 1.236275, 0.7215686, 0, 1, 1,
0.8126829, 0.3170381, 0.6313174, 0.7294118, 0, 1, 1,
0.8154656, -0.7427355, 2.988846, 0.7333333, 0, 1, 1,
0.8195207, 0.9327157, 1.221875, 0.7411765, 0, 1, 1,
0.8203862, -0.1062955, 1.821752, 0.7450981, 0, 1, 1,
0.8205679, 0.2201952, 1.355475, 0.7529412, 0, 1, 1,
0.8264971, 1.431968, 1.843061, 0.7568628, 0, 1, 1,
0.8282744, -0.2037377, 3.187967, 0.7647059, 0, 1, 1,
0.8321334, -0.9373207, 1.707635, 0.7686275, 0, 1, 1,
0.8351135, 1.0049, 1.975158, 0.7764706, 0, 1, 1,
0.83971, 0.1427025, 2.25003, 0.7803922, 0, 1, 1,
0.8416383, 0.5842546, 0.6532342, 0.7882353, 0, 1, 1,
0.843881, 1.288216, 1.8441, 0.7921569, 0, 1, 1,
0.8443266, 1.503224, -0.4373748, 0.8, 0, 1, 1,
0.8449712, 2.446336, 2.715922, 0.8078431, 0, 1, 1,
0.8467001, 1.707189, 0.4608618, 0.8117647, 0, 1, 1,
0.8481663, -0.02455085, 1.948252, 0.8196079, 0, 1, 1,
0.851371, 0.4700266, -0.5955074, 0.8235294, 0, 1, 1,
0.851392, -0.1749379, 2.21872, 0.8313726, 0, 1, 1,
0.8602446, 0.206607, 1.976514, 0.8352941, 0, 1, 1,
0.8642484, -0.6079802, 0.05513719, 0.8431373, 0, 1, 1,
0.8709278, -1.900294, 2.483973, 0.8470588, 0, 1, 1,
0.8782003, 0.1005581, -0.08417384, 0.854902, 0, 1, 1,
0.8884053, 0.2832565, 0.997775, 0.8588235, 0, 1, 1,
0.8914302, 0.5430727, 1.122293, 0.8666667, 0, 1, 1,
0.8917451, 0.2683798, 2.537696, 0.8705882, 0, 1, 1,
0.8928258, -1.560447, 1.988814, 0.8784314, 0, 1, 1,
0.8977298, 0.5392242, 0.6069542, 0.8823529, 0, 1, 1,
0.8981894, -0.5511079, 3.018451, 0.8901961, 0, 1, 1,
0.9015263, 0.2789885, 0.8747864, 0.8941177, 0, 1, 1,
0.9019112, 1.421391, 0.9819115, 0.9019608, 0, 1, 1,
0.9020811, -0.2079963, 1.434059, 0.9098039, 0, 1, 1,
0.9091728, 1.062399, 1.527479, 0.9137255, 0, 1, 1,
0.9107711, -0.2744199, 4.130912, 0.9215686, 0, 1, 1,
0.912718, -1.958032, 4.432647, 0.9254902, 0, 1, 1,
0.9208603, -0.01314535, 1.656276, 0.9333333, 0, 1, 1,
0.9260533, 0.2167481, 3.15999, 0.9372549, 0, 1, 1,
0.9267324, 0.6138104, 2.187271, 0.945098, 0, 1, 1,
0.9287638, -0.3465819, 0.2462751, 0.9490196, 0, 1, 1,
0.9334943, -0.2071782, 1.323322, 0.9568627, 0, 1, 1,
0.9338192, 0.09789053, 2.079736, 0.9607843, 0, 1, 1,
0.9384021, -0.940916, 1.26256, 0.9686275, 0, 1, 1,
0.9418682, 0.9045467, 0.430309, 0.972549, 0, 1, 1,
0.9526013, 1.525703, 0.1963215, 0.9803922, 0, 1, 1,
0.9662831, 1.529193, 0.8397426, 0.9843137, 0, 1, 1,
0.9675881, -0.1582533, 2.09464, 0.9921569, 0, 1, 1,
0.975942, 2.114232, 0.8435975, 0.9960784, 0, 1, 1,
0.9781379, 0.0820692, 0.8724451, 1, 0, 0.9960784, 1,
0.9792221, -0.2987089, 2.795465, 1, 0, 0.9882353, 1,
0.9842469, -0.5002389, 3.174261, 1, 0, 0.9843137, 1,
0.9879447, 0.8280935, 0.2001241, 1, 0, 0.9764706, 1,
0.9965386, 1.076303, -1.187679, 1, 0, 0.972549, 1,
0.9990966, -0.1344641, 0.939844, 1, 0, 0.9647059, 1,
1.002135, 0.009579795, 0.8492853, 1, 0, 0.9607843, 1,
1.012262, -0.8336741, 1.248276, 1, 0, 0.9529412, 1,
1.01337, 0.6919813, 1.120108, 1, 0, 0.9490196, 1,
1.027689, 0.7503077, 1.105891, 1, 0, 0.9411765, 1,
1.030696, 1.554609, 0.961178, 1, 0, 0.9372549, 1,
1.030848, 1.215336, 0.129318, 1, 0, 0.9294118, 1,
1.03227, 0.08653824, -0.1401626, 1, 0, 0.9254902, 1,
1.034277, -0.7760619, 3.109231, 1, 0, 0.9176471, 1,
1.036739, 1.508977, 0.3083034, 1, 0, 0.9137255, 1,
1.03977, -1.465469, 2.88029, 1, 0, 0.9058824, 1,
1.042422, -0.1257994, 2.177069, 1, 0, 0.9019608, 1,
1.047391, -0.2280463, 2.338436, 1, 0, 0.8941177, 1,
1.06155, -0.6255899, 1.350123, 1, 0, 0.8862745, 1,
1.071023, 0.01265992, 1.634539, 1, 0, 0.8823529, 1,
1.075589, 1.207, 1.836606, 1, 0, 0.8745098, 1,
1.076596, 1.48474, 1.7728, 1, 0, 0.8705882, 1,
1.077896, -1.323915, 3.020757, 1, 0, 0.8627451, 1,
1.087303, 1.470303, -0.1368239, 1, 0, 0.8588235, 1,
1.089964, 0.3828726, 0.5363533, 1, 0, 0.8509804, 1,
1.100829, -0.299366, 2.452943, 1, 0, 0.8470588, 1,
1.10269, -0.7923269, 2.56559, 1, 0, 0.8392157, 1,
1.107672, -0.6511325, 4.105572, 1, 0, 0.8352941, 1,
1.10814, -0.4020271, 1.009742, 1, 0, 0.827451, 1,
1.112912, 0.3174265, 2.398399, 1, 0, 0.8235294, 1,
1.113376, -0.3269068, 1.067266, 1, 0, 0.8156863, 1,
1.11461, 2.458283, -0.0437745, 1, 0, 0.8117647, 1,
1.13944, -1.39263, 2.717926, 1, 0, 0.8039216, 1,
1.146263, 0.1017592, 2.600514, 1, 0, 0.7960784, 1,
1.147844, 2.04103, 0.6821491, 1, 0, 0.7921569, 1,
1.154515, 0.2716193, 2.318017, 1, 0, 0.7843137, 1,
1.15673, -0.573873, 2.839548, 1, 0, 0.7803922, 1,
1.159618, 0.2893743, -0.281893, 1, 0, 0.772549, 1,
1.172446, 0.677195, 3.011868, 1, 0, 0.7686275, 1,
1.178248, 0.2831307, 1.068498, 1, 0, 0.7607843, 1,
1.190609, 0.8024697, 0.1989943, 1, 0, 0.7568628, 1,
1.190812, 1.115023, 0.8661923, 1, 0, 0.7490196, 1,
1.194787, -0.6901597, 0.5944136, 1, 0, 0.7450981, 1,
1.197322, -0.2062066, 2.020196, 1, 0, 0.7372549, 1,
1.199757, -0.7744972, 2.656365, 1, 0, 0.7333333, 1,
1.200738, 0.4549786, -0.3975874, 1, 0, 0.7254902, 1,
1.202353, 0.08354305, 1.69366, 1, 0, 0.7215686, 1,
1.202448, 0.4075448, 1.887048, 1, 0, 0.7137255, 1,
1.208597, -0.9760094, 2.378275, 1, 0, 0.7098039, 1,
1.211561, 0.1250495, 0.429051, 1, 0, 0.7019608, 1,
1.213114, 1.060209, 0.01910861, 1, 0, 0.6941177, 1,
1.216478, 0.2661445, 1.698812, 1, 0, 0.6901961, 1,
1.21884, 0.8925049, 2.151315, 1, 0, 0.682353, 1,
1.219115, -0.3902728, -0.08860614, 1, 0, 0.6784314, 1,
1.221332, 0.7932329, 1.732687, 1, 0, 0.6705883, 1,
1.236753, 1.507839, 0.01300235, 1, 0, 0.6666667, 1,
1.244595, -1.509288, 2.975408, 1, 0, 0.6588235, 1,
1.245385, -1.072569, 2.838317, 1, 0, 0.654902, 1,
1.253334, 0.4557714, -0.6635692, 1, 0, 0.6470588, 1,
1.263197, 1.93696, -0.430168, 1, 0, 0.6431373, 1,
1.269956, -0.1679292, 1.683869, 1, 0, 0.6352941, 1,
1.276146, 0.2835833, 1.651638, 1, 0, 0.6313726, 1,
1.278476, -0.7218181, 4.780572, 1, 0, 0.6235294, 1,
1.278637, -0.45171, 2.078775, 1, 0, 0.6196079, 1,
1.279604, -1.045892, 1.284509, 1, 0, 0.6117647, 1,
1.285976, 0.2081869, 1.076813, 1, 0, 0.6078432, 1,
1.29718, 0.5049826, 2.587328, 1, 0, 0.6, 1,
1.302747, -0.810402, 0.4314528, 1, 0, 0.5921569, 1,
1.304544, -0.472816, 2.95196, 1, 0, 0.5882353, 1,
1.305238, -2.013853, 5.496496, 1, 0, 0.5803922, 1,
1.307931, -0.7063494, 2.117631, 1, 0, 0.5764706, 1,
1.310064, 1.267274, 0.4693205, 1, 0, 0.5686275, 1,
1.313828, 0.414868, 1.88547, 1, 0, 0.5647059, 1,
1.318112, 0.985081, 1.612596, 1, 0, 0.5568628, 1,
1.323078, 0.2156025, -0.1031967, 1, 0, 0.5529412, 1,
1.327278, -0.752669, 1.117427, 1, 0, 0.5450981, 1,
1.327376, 0.2120529, 1.410859, 1, 0, 0.5411765, 1,
1.332182, -0.2153283, 1.47383, 1, 0, 0.5333334, 1,
1.348609, -0.7016526, 1.831877, 1, 0, 0.5294118, 1,
1.350125, 1.023423, 0.2672242, 1, 0, 0.5215687, 1,
1.356099, 0.006137725, 0.999167, 1, 0, 0.5176471, 1,
1.373301, -0.261875, 1.708616, 1, 0, 0.509804, 1,
1.37718, 0.2616145, 1.818514, 1, 0, 0.5058824, 1,
1.379577, -0.7015908, 1.407483, 1, 0, 0.4980392, 1,
1.383694, -1.425833, 4.398129, 1, 0, 0.4901961, 1,
1.388004, -1.268769, 2.079288, 1, 0, 0.4862745, 1,
1.394971, 0.5583372, 2.616669, 1, 0, 0.4784314, 1,
1.402534, -1.461899, 3.229702, 1, 0, 0.4745098, 1,
1.40814, -2.47629, 2.305932, 1, 0, 0.4666667, 1,
1.409564, 0.7342316, 1.686827, 1, 0, 0.4627451, 1,
1.427774, -0.2129441, -0.3038551, 1, 0, 0.454902, 1,
1.428569, -0.6088893, 1.479627, 1, 0, 0.4509804, 1,
1.43355, 0.4214751, 1.982732, 1, 0, 0.4431373, 1,
1.440784, -0.7480577, 0.9123308, 1, 0, 0.4392157, 1,
1.443805, -2.304344, 1.475766, 1, 0, 0.4313726, 1,
1.444636, 0.4795881, 1.918402, 1, 0, 0.427451, 1,
1.445205, -1.38958, 0.2631735, 1, 0, 0.4196078, 1,
1.451826, 0.672396, 2.352534, 1, 0, 0.4156863, 1,
1.453418, -0.3092712, 3.06998, 1, 0, 0.4078431, 1,
1.468338, -2.170027, 4.444047, 1, 0, 0.4039216, 1,
1.481119, 0.2117809, 2.246676, 1, 0, 0.3960784, 1,
1.481814, 0.06812819, 2.097671, 1, 0, 0.3882353, 1,
1.48205, -0.8717812, 1.506931, 1, 0, 0.3843137, 1,
1.493346, 1.272057, 0.1801926, 1, 0, 0.3764706, 1,
1.503134, -1.178836, 0.8286186, 1, 0, 0.372549, 1,
1.549414, 1.271155, 2.701782, 1, 0, 0.3647059, 1,
1.576377, 0.9419435, -0.08565813, 1, 0, 0.3607843, 1,
1.587723, 0.8077865, 0.8480476, 1, 0, 0.3529412, 1,
1.602772, 1.233142, 2.58905, 1, 0, 0.3490196, 1,
1.603941, -0.2507164, 0.5355139, 1, 0, 0.3411765, 1,
1.60538, 0.5257866, 1.396558, 1, 0, 0.3372549, 1,
1.608572, -0.5525468, 1.351327, 1, 0, 0.3294118, 1,
1.628364, 0.931269, 1.827048, 1, 0, 0.3254902, 1,
1.631449, 0.7400023, 3.296189, 1, 0, 0.3176471, 1,
1.63262, -0.1427101, 0.9954203, 1, 0, 0.3137255, 1,
1.637456, 0.1876215, 0.3148334, 1, 0, 0.3058824, 1,
1.638645, -0.7250464, 2.344883, 1, 0, 0.2980392, 1,
1.649286, -0.2808459, 2.586175, 1, 0, 0.2941177, 1,
1.654763, -0.03235322, 0.9126356, 1, 0, 0.2862745, 1,
1.657881, 0.295914, -1.188218, 1, 0, 0.282353, 1,
1.676255, -1.404381, 3.387747, 1, 0, 0.2745098, 1,
1.692922, -0.3611183, 0.7512702, 1, 0, 0.2705882, 1,
1.696491, -0.1631549, 0.452499, 1, 0, 0.2627451, 1,
1.703556, 0.006951275, 2.389731, 1, 0, 0.2588235, 1,
1.713568, -0.833088, 2.789883, 1, 0, 0.2509804, 1,
1.713907, -0.3726943, 2.697956, 1, 0, 0.2470588, 1,
1.714537, -0.02525361, 1.774595, 1, 0, 0.2392157, 1,
1.722335, -0.8675874, 1.809509, 1, 0, 0.2352941, 1,
1.742993, 0.9480065, 1.02594, 1, 0, 0.227451, 1,
1.850607, 0.4267771, 4.458913, 1, 0, 0.2235294, 1,
1.854265, 1.395869, 0.9282311, 1, 0, 0.2156863, 1,
1.86038, -0.4528457, 2.717953, 1, 0, 0.2117647, 1,
1.877387, 1.095859, 1.215359, 1, 0, 0.2039216, 1,
1.87746, 0.5605711, 1.409757, 1, 0, 0.1960784, 1,
1.890635, -0.5419561, -0.1771892, 1, 0, 0.1921569, 1,
1.924139, -0.8821254, 2.297314, 1, 0, 0.1843137, 1,
1.930768, 1.055477, -0.1253347, 1, 0, 0.1803922, 1,
1.941918, 0.1282171, 1.690384, 1, 0, 0.172549, 1,
1.942944, 0.2604913, 2.109146, 1, 0, 0.1686275, 1,
1.957293, 1.169839, 0.1942484, 1, 0, 0.1607843, 1,
1.968116, 0.3199363, 1.497138, 1, 0, 0.1568628, 1,
1.978969, 1.090713, 0.4763288, 1, 0, 0.1490196, 1,
1.987158, 0.1631321, 0.3853101, 1, 0, 0.145098, 1,
1.994285, 1.254204, 2.099519, 1, 0, 0.1372549, 1,
2.018762, 1.398277, 2.272149, 1, 0, 0.1333333, 1,
2.053362, 1.785133, -0.3928623, 1, 0, 0.1254902, 1,
2.060761, -0.9478719, 3.858066, 1, 0, 0.1215686, 1,
2.067147, 1.051145, 2.811221, 1, 0, 0.1137255, 1,
2.097461, -2.368474, 2.973808, 1, 0, 0.1098039, 1,
2.117272, 0.1604132, 1.351911, 1, 0, 0.1019608, 1,
2.126055, -0.8171399, 1.862969, 1, 0, 0.09411765, 1,
2.191537, 0.1729472, 4.401666, 1, 0, 0.09019608, 1,
2.208712, 0.1118017, 1.857761, 1, 0, 0.08235294, 1,
2.232592, -0.6109319, 2.065159, 1, 0, 0.07843138, 1,
2.238755, 0.8322013, 1.620705, 1, 0, 0.07058824, 1,
2.241832, 0.6636045, 2.826361, 1, 0, 0.06666667, 1,
2.251578, 0.100739, 1.64865, 1, 0, 0.05882353, 1,
2.273681, -0.4916915, 3.109407, 1, 0, 0.05490196, 1,
2.287279, -0.652707, 1.955612, 1, 0, 0.04705882, 1,
2.32434, 0.6624959, 1.970369, 1, 0, 0.04313726, 1,
2.366544, -1.221213, 2.107882, 1, 0, 0.03529412, 1,
2.471333, -0.1199744, 3.005331, 1, 0, 0.03137255, 1,
2.497279, 0.1264326, 2.873688, 1, 0, 0.02352941, 1,
2.664143, -0.6789127, 2.677489, 1, 0, 0.01960784, 1,
2.879482, 0.8312132, 1.076629, 1, 0, 0.01176471, 1,
3.143428, 1.337834, 0.5581177, 1, 0, 0.007843138, 1
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
-0.2069753, -4.548728, -7.008904, 0, -0.5, 0.5, 0.5,
-0.2069753, -4.548728, -7.008904, 1, -0.5, 0.5, 0.5,
-0.2069753, -4.548728, -7.008904, 1, 1.5, 0.5, 0.5,
-0.2069753, -4.548728, -7.008904, 0, 1.5, 0.5, 0.5
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
-4.693166, -0.264291, -7.008904, 0, -0.5, 0.5, 0.5,
-4.693166, -0.264291, -7.008904, 1, -0.5, 0.5, 0.5,
-4.693166, -0.264291, -7.008904, 1, 1.5, 0.5, 0.5,
-4.693166, -0.264291, -7.008904, 0, 1.5, 0.5, 0.5
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
-4.693166, -4.548728, 0.1500235, 0, -0.5, 0.5, 0.5,
-4.693166, -4.548728, 0.1500235, 1, -0.5, 0.5, 0.5,
-4.693166, -4.548728, 0.1500235, 1, 1.5, 0.5, 0.5,
-4.693166, -4.548728, 0.1500235, 0, 1.5, 0.5, 0.5
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
-3, -3.560011, -5.356843,
3, -3.560011, -5.356843,
-3, -3.560011, -5.356843,
-3, -3.724797, -5.632187,
-2, -3.560011, -5.356843,
-2, -3.724797, -5.632187,
-1, -3.560011, -5.356843,
-1, -3.724797, -5.632187,
0, -3.560011, -5.356843,
0, -3.724797, -5.632187,
1, -3.560011, -5.356843,
1, -3.724797, -5.632187,
2, -3.560011, -5.356843,
2, -3.724797, -5.632187,
3, -3.560011, -5.356843,
3, -3.724797, -5.632187
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
-3, -4.054369, -6.182874, 0, -0.5, 0.5, 0.5,
-3, -4.054369, -6.182874, 1, -0.5, 0.5, 0.5,
-3, -4.054369, -6.182874, 1, 1.5, 0.5, 0.5,
-3, -4.054369, -6.182874, 0, 1.5, 0.5, 0.5,
-2, -4.054369, -6.182874, 0, -0.5, 0.5, 0.5,
-2, -4.054369, -6.182874, 1, -0.5, 0.5, 0.5,
-2, -4.054369, -6.182874, 1, 1.5, 0.5, 0.5,
-2, -4.054369, -6.182874, 0, 1.5, 0.5, 0.5,
-1, -4.054369, -6.182874, 0, -0.5, 0.5, 0.5,
-1, -4.054369, -6.182874, 1, -0.5, 0.5, 0.5,
-1, -4.054369, -6.182874, 1, 1.5, 0.5, 0.5,
-1, -4.054369, -6.182874, 0, 1.5, 0.5, 0.5,
0, -4.054369, -6.182874, 0, -0.5, 0.5, 0.5,
0, -4.054369, -6.182874, 1, -0.5, 0.5, 0.5,
0, -4.054369, -6.182874, 1, 1.5, 0.5, 0.5,
0, -4.054369, -6.182874, 0, 1.5, 0.5, 0.5,
1, -4.054369, -6.182874, 0, -0.5, 0.5, 0.5,
1, -4.054369, -6.182874, 1, -0.5, 0.5, 0.5,
1, -4.054369, -6.182874, 1, 1.5, 0.5, 0.5,
1, -4.054369, -6.182874, 0, 1.5, 0.5, 0.5,
2, -4.054369, -6.182874, 0, -0.5, 0.5, 0.5,
2, -4.054369, -6.182874, 1, -0.5, 0.5, 0.5,
2, -4.054369, -6.182874, 1, 1.5, 0.5, 0.5,
2, -4.054369, -6.182874, 0, 1.5, 0.5, 0.5,
3, -4.054369, -6.182874, 0, -0.5, 0.5, 0.5,
3, -4.054369, -6.182874, 1, -0.5, 0.5, 0.5,
3, -4.054369, -6.182874, 1, 1.5, 0.5, 0.5,
3, -4.054369, -6.182874, 0, 1.5, 0.5, 0.5
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
-3.657891, -3, -5.356843,
-3.657891, 2, -5.356843,
-3.657891, -3, -5.356843,
-3.830437, -3, -5.632187,
-3.657891, -2, -5.356843,
-3.830437, -2, -5.632187,
-3.657891, -1, -5.356843,
-3.830437, -1, -5.632187,
-3.657891, 0, -5.356843,
-3.830437, 0, -5.632187,
-3.657891, 1, -5.356843,
-3.830437, 1, -5.632187,
-3.657891, 2, -5.356843,
-3.830437, 2, -5.632187
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
-4.175529, -3, -6.182874, 0, -0.5, 0.5, 0.5,
-4.175529, -3, -6.182874, 1, -0.5, 0.5, 0.5,
-4.175529, -3, -6.182874, 1, 1.5, 0.5, 0.5,
-4.175529, -3, -6.182874, 0, 1.5, 0.5, 0.5,
-4.175529, -2, -6.182874, 0, -0.5, 0.5, 0.5,
-4.175529, -2, -6.182874, 1, -0.5, 0.5, 0.5,
-4.175529, -2, -6.182874, 1, 1.5, 0.5, 0.5,
-4.175529, -2, -6.182874, 0, 1.5, 0.5, 0.5,
-4.175529, -1, -6.182874, 0, -0.5, 0.5, 0.5,
-4.175529, -1, -6.182874, 1, -0.5, 0.5, 0.5,
-4.175529, -1, -6.182874, 1, 1.5, 0.5, 0.5,
-4.175529, -1, -6.182874, 0, 1.5, 0.5, 0.5,
-4.175529, 0, -6.182874, 0, -0.5, 0.5, 0.5,
-4.175529, 0, -6.182874, 1, -0.5, 0.5, 0.5,
-4.175529, 0, -6.182874, 1, 1.5, 0.5, 0.5,
-4.175529, 0, -6.182874, 0, 1.5, 0.5, 0.5,
-4.175529, 1, -6.182874, 0, -0.5, 0.5, 0.5,
-4.175529, 1, -6.182874, 1, -0.5, 0.5, 0.5,
-4.175529, 1, -6.182874, 1, 1.5, 0.5, 0.5,
-4.175529, 1, -6.182874, 0, 1.5, 0.5, 0.5,
-4.175529, 2, -6.182874, 0, -0.5, 0.5, 0.5,
-4.175529, 2, -6.182874, 1, -0.5, 0.5, 0.5,
-4.175529, 2, -6.182874, 1, 1.5, 0.5, 0.5,
-4.175529, 2, -6.182874, 0, 1.5, 0.5, 0.5
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
-3.657891, -3.560011, -4,
-3.657891, -3.560011, 4,
-3.657891, -3.560011, -4,
-3.830437, -3.724797, -4,
-3.657891, -3.560011, -2,
-3.830437, -3.724797, -2,
-3.657891, -3.560011, 0,
-3.830437, -3.724797, 0,
-3.657891, -3.560011, 2,
-3.830437, -3.724797, 2,
-3.657891, -3.560011, 4,
-3.830437, -3.724797, 4
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
-4.175529, -4.054369, -4, 0, -0.5, 0.5, 0.5,
-4.175529, -4.054369, -4, 1, -0.5, 0.5, 0.5,
-4.175529, -4.054369, -4, 1, 1.5, 0.5, 0.5,
-4.175529, -4.054369, -4, 0, 1.5, 0.5, 0.5,
-4.175529, -4.054369, -2, 0, -0.5, 0.5, 0.5,
-4.175529, -4.054369, -2, 1, -0.5, 0.5, 0.5,
-4.175529, -4.054369, -2, 1, 1.5, 0.5, 0.5,
-4.175529, -4.054369, -2, 0, 1.5, 0.5, 0.5,
-4.175529, -4.054369, 0, 0, -0.5, 0.5, 0.5,
-4.175529, -4.054369, 0, 1, -0.5, 0.5, 0.5,
-4.175529, -4.054369, 0, 1, 1.5, 0.5, 0.5,
-4.175529, -4.054369, 0, 0, 1.5, 0.5, 0.5,
-4.175529, -4.054369, 2, 0, -0.5, 0.5, 0.5,
-4.175529, -4.054369, 2, 1, -0.5, 0.5, 0.5,
-4.175529, -4.054369, 2, 1, 1.5, 0.5, 0.5,
-4.175529, -4.054369, 2, 0, 1.5, 0.5, 0.5,
-4.175529, -4.054369, 4, 0, -0.5, 0.5, 0.5,
-4.175529, -4.054369, 4, 1, -0.5, 0.5, 0.5,
-4.175529, -4.054369, 4, 1, 1.5, 0.5, 0.5,
-4.175529, -4.054369, 4, 0, 1.5, 0.5, 0.5
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
-3.657891, -3.560011, -5.356843,
-3.657891, 3.031429, -5.356843,
-3.657891, -3.560011, 5.65689,
-3.657891, 3.031429, 5.65689,
-3.657891, -3.560011, -5.356843,
-3.657891, -3.560011, 5.65689,
-3.657891, 3.031429, -5.356843,
-3.657891, 3.031429, 5.65689,
-3.657891, -3.560011, -5.356843,
3.24394, -3.560011, -5.356843,
-3.657891, -3.560011, 5.65689,
3.24394, -3.560011, 5.65689,
-3.657891, 3.031429, -5.356843,
3.24394, 3.031429, -5.356843,
-3.657891, 3.031429, 5.65689,
3.24394, 3.031429, 5.65689,
3.24394, -3.560011, -5.356843,
3.24394, 3.031429, -5.356843,
3.24394, -3.560011, 5.65689,
3.24394, 3.031429, 5.65689,
3.24394, -3.560011, -5.356843,
3.24394, -3.560011, 5.65689,
3.24394, 3.031429, -5.356843,
3.24394, 3.031429, 5.65689
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
var radius = 7.781926;
var distance = 34.62267;
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
mvMatrix.translate( 0.2069753, 0.264291, -0.1500235 );
mvMatrix.scale( 1.219092, 1.2765, 0.7639526 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.62267);
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
ammonium_sulphamate_<-read.table("ammonium_sulphamate_.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ammonium_sulphamate_$V2
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulphamate_' not found
```

```r
y<-ammonium_sulphamate_$V3
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulphamate_' not found
```

```r
z<-ammonium_sulphamate_$V4
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulphamate_' not found
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
-3.557379, -0.1291947, -1.286606, 0, 0, 1, 1, 1,
-3.367072, 1.609701, -1.435362, 1, 0, 0, 1, 1,
-3.071735, -2.708096, -1.207743, 1, 0, 0, 1, 1,
-2.929706, 1.546802, -1.73632, 1, 0, 0, 1, 1,
-2.911002, -0.7876107, -2.140717, 1, 0, 0, 1, 1,
-2.692972, 1.632973, 0.2429539, 1, 0, 0, 1, 1,
-2.531862, 1.472911, -1.010801, 0, 0, 0, 1, 1,
-2.444249, 0.2181695, -1.576084, 0, 0, 0, 1, 1,
-2.443987, -0.5004652, -3.183472, 0, 0, 0, 1, 1,
-2.422884, -1.728796, -0.02686991, 0, 0, 0, 1, 1,
-2.404514, 1.11953, -0.06240456, 0, 0, 0, 1, 1,
-2.372142, 0.4169134, -1.933067, 0, 0, 0, 1, 1,
-2.313268, -0.1018355, -3.018738, 0, 0, 0, 1, 1,
-2.290794, -0.9315371, -1.893484, 1, 1, 1, 1, 1,
-2.287239, -2.267539, -3.907925, 1, 1, 1, 1, 1,
-2.194371, 2.543008, -1.567636, 1, 1, 1, 1, 1,
-2.18252, 0.02741144, -1.260077, 1, 1, 1, 1, 1,
-2.164006, -1.099592, -1.858851, 1, 1, 1, 1, 1,
-2.140412, 0.5574397, -1.918903, 1, 1, 1, 1, 1,
-2.135772, 1.23973, -1.451969, 1, 1, 1, 1, 1,
-2.11808, -0.06500267, -2.993185, 1, 1, 1, 1, 1,
-2.076955, -0.08713701, -4.050601, 1, 1, 1, 1, 1,
-2.03953, -0.6586311, -0.3691998, 1, 1, 1, 1, 1,
-2.025459, 0.8412834, 0.8198904, 1, 1, 1, 1, 1,
-1.969275, 0.1296011, -0.5591006, 1, 1, 1, 1, 1,
-1.925428, 0.07759601, -0.1803509, 1, 1, 1, 1, 1,
-1.924091, -1.015408, -3.36521, 1, 1, 1, 1, 1,
-1.890412, -0.3452542, -2.875701, 1, 1, 1, 1, 1,
-1.883594, 0.9239177, -1.010778, 0, 0, 1, 1, 1,
-1.877326, -0.8625678, -2.307319, 1, 0, 0, 1, 1,
-1.860108, 0.04981147, -1.867547, 1, 0, 0, 1, 1,
-1.803526, -0.1300072, -1.817547, 1, 0, 0, 1, 1,
-1.792254, 1.035963, -0.4546913, 1, 0, 0, 1, 1,
-1.780835, 0.2848634, -2.777034, 1, 0, 0, 1, 1,
-1.762336, -0.0907969, -2.008, 0, 0, 0, 1, 1,
-1.749094, -0.4326035, -0.2046746, 0, 0, 0, 1, 1,
-1.74545, 0.9403046, -0.9124688, 0, 0, 0, 1, 1,
-1.716644, 0.220834, -1.044548, 0, 0, 0, 1, 1,
-1.687974, -1.114089, -2.957512, 0, 0, 0, 1, 1,
-1.67021, 2.605963, 0.3887324, 0, 0, 0, 1, 1,
-1.667985, 0.9748366, -0.4756902, 0, 0, 0, 1, 1,
-1.663184, 0.2708207, -0.3883167, 1, 1, 1, 1, 1,
-1.661474, -1.220178, -2.43115, 1, 1, 1, 1, 1,
-1.651867, -0.9509522, -3.434932, 1, 1, 1, 1, 1,
-1.618169, 0.1694414, -0.242485, 1, 1, 1, 1, 1,
-1.600635, 1.424621, 0.1056869, 1, 1, 1, 1, 1,
-1.594836, 0.5940087, -3.19739, 1, 1, 1, 1, 1,
-1.590334, 1.689585, -1.020604, 1, 1, 1, 1, 1,
-1.570805, -1.938018, -3.332492, 1, 1, 1, 1, 1,
-1.561556, 1.496154, 0.4599051, 1, 1, 1, 1, 1,
-1.554993, 1.260331, -1.285721, 1, 1, 1, 1, 1,
-1.547337, 0.120866, -2.154947, 1, 1, 1, 1, 1,
-1.545957, -0.6228606, -0.8606008, 1, 1, 1, 1, 1,
-1.542763, -0.08706973, -1.383092, 1, 1, 1, 1, 1,
-1.535954, 0.3240826, -2.553031, 1, 1, 1, 1, 1,
-1.532758, 0.5830454, -2.222928, 1, 1, 1, 1, 1,
-1.531126, -0.9281098, -2.050725, 0, 0, 1, 1, 1,
-1.528591, -0.5950243, -2.449405, 1, 0, 0, 1, 1,
-1.512962, -0.652938, -1.03884, 1, 0, 0, 1, 1,
-1.503509, -0.8504353, -4.075238, 1, 0, 0, 1, 1,
-1.501178, -1.577438, -3.884753, 1, 0, 0, 1, 1,
-1.500292, 1.158813, -2.407748, 1, 0, 0, 1, 1,
-1.495721, -0.390247, -1.437944, 0, 0, 0, 1, 1,
-1.492132, -1.774773, -2.019207, 0, 0, 0, 1, 1,
-1.485256, -0.9347841, -1.348573, 0, 0, 0, 1, 1,
-1.477248, -1.216321, -1.73027, 0, 0, 0, 1, 1,
-1.476332, -2.149297, -4.641278, 0, 0, 0, 1, 1,
-1.474698, -1.288852, -3.720633, 0, 0, 0, 1, 1,
-1.461884, -1.065811, -2.113848, 0, 0, 0, 1, 1,
-1.45166, -0.7680246, -2.339426, 1, 1, 1, 1, 1,
-1.451644, -0.1872337, -0.6148371, 1, 1, 1, 1, 1,
-1.447707, -0.6304178, -2.507394, 1, 1, 1, 1, 1,
-1.434392, -0.1489461, -0.2834279, 1, 1, 1, 1, 1,
-1.428725, -0.4943675, -1.431445, 1, 1, 1, 1, 1,
-1.426786, 0.8223338, -1.027929, 1, 1, 1, 1, 1,
-1.41783, 1.043566, -2.77608, 1, 1, 1, 1, 1,
-1.417466, -0.2693096, -2.943032, 1, 1, 1, 1, 1,
-1.417131, 0.4091686, -0.2688004, 1, 1, 1, 1, 1,
-1.404137, 0.6861463, -1.015646, 1, 1, 1, 1, 1,
-1.400214, 0.8259431, -0.8488698, 1, 1, 1, 1, 1,
-1.398205, 0.8514989, -0.8069504, 1, 1, 1, 1, 1,
-1.363548, 0.2904176, -0.7537315, 1, 1, 1, 1, 1,
-1.346508, 1.461608, -0.9229016, 1, 1, 1, 1, 1,
-1.33879, -0.5087556, -0.6065492, 1, 1, 1, 1, 1,
-1.328701, -0.1880481, -1.921808, 0, 0, 1, 1, 1,
-1.327652, 1.228504, -1.174082, 1, 0, 0, 1, 1,
-1.324313, -1.194224, -2.901655, 1, 0, 0, 1, 1,
-1.323397, -1.020951, -1.500282, 1, 0, 0, 1, 1,
-1.32149, -1.183017, -2.376497, 1, 0, 0, 1, 1,
-1.301872, -0.9662099, -4.37202, 1, 0, 0, 1, 1,
-1.299903, -0.4440628, -2.059499, 0, 0, 0, 1, 1,
-1.299175, -0.4986793, -0.9605949, 0, 0, 0, 1, 1,
-1.290943, 0.2011585, -1.64485, 0, 0, 0, 1, 1,
-1.285823, 1.218696, -0.957205, 0, 0, 0, 1, 1,
-1.284407, 0.8703281, -0.1329599, 0, 0, 0, 1, 1,
-1.283266, 0.8381512, 0.8197817, 0, 0, 0, 1, 1,
-1.281654, 0.1248157, -1.673997, 0, 0, 0, 1, 1,
-1.277975, 0.03797863, -0.9054818, 1, 1, 1, 1, 1,
-1.266489, -1.214224, -4.176897, 1, 1, 1, 1, 1,
-1.25543, -0.6246191, -2.218146, 1, 1, 1, 1, 1,
-1.251679, 1.050736, 0.3324846, 1, 1, 1, 1, 1,
-1.24689, -1.444151, -0.7793944, 1, 1, 1, 1, 1,
-1.240555, 1.100088, -0.188776, 1, 1, 1, 1, 1,
-1.235365, -1.136827, -1.926009, 1, 1, 1, 1, 1,
-1.224219, -1.407049, -4.137606, 1, 1, 1, 1, 1,
-1.218397, -0.8855243, -1.954763, 1, 1, 1, 1, 1,
-1.210203, 1.691246, -1.414766, 1, 1, 1, 1, 1,
-1.198909, -0.5886803, -2.272877, 1, 1, 1, 1, 1,
-1.197143, -0.02604807, 0.8912145, 1, 1, 1, 1, 1,
-1.191067, -0.1571631, -2.321083, 1, 1, 1, 1, 1,
-1.190158, -0.5377171, -0.3778763, 1, 1, 1, 1, 1,
-1.178884, -1.132894, -2.606404, 1, 1, 1, 1, 1,
-1.178804, 0.420093, -0.8230448, 0, 0, 1, 1, 1,
-1.173863, 1.331815, -1.744875, 1, 0, 0, 1, 1,
-1.165226, -2.110644, -2.668468, 1, 0, 0, 1, 1,
-1.160127, -0.1539097, -1.753687, 1, 0, 0, 1, 1,
-1.14911, 0.3799959, -1.301047, 1, 0, 0, 1, 1,
-1.146885, 0.5520666, -0.9794066, 1, 0, 0, 1, 1,
-1.146536, -0.5804077, -3.000993, 0, 0, 0, 1, 1,
-1.145416, -0.2068334, -1.794205, 0, 0, 0, 1, 1,
-1.131577, 1.886046, 0.09104954, 0, 0, 0, 1, 1,
-1.117261, 0.3600944, -2.213138, 0, 0, 0, 1, 1,
-1.116204, 0.3302892, -0.4783862, 0, 0, 0, 1, 1,
-1.109164, -1.127892, -2.963469, 0, 0, 0, 1, 1,
-1.102069, 0.9609544, -1.263796, 0, 0, 0, 1, 1,
-1.099094, 0.5046293, -1.670922, 1, 1, 1, 1, 1,
-1.093199, -0.0517584, -0.8101855, 1, 1, 1, 1, 1,
-1.08269, -0.1415294, -1.440154, 1, 1, 1, 1, 1,
-1.081849, 1.85767, -1.633107, 1, 1, 1, 1, 1,
-1.07576, 0.4633735, -1.09352, 1, 1, 1, 1, 1,
-1.074425, 0.5186047, -1.60797, 1, 1, 1, 1, 1,
-1.066694, 0.9772792, -1.312831, 1, 1, 1, 1, 1,
-1.064529, -0.5095534, -0.1981984, 1, 1, 1, 1, 1,
-1.063954, -0.4080779, -2.798012, 1, 1, 1, 1, 1,
-1.060708, -0.3402547, -3.236994, 1, 1, 1, 1, 1,
-1.053406, 1.424588, -0.6592179, 1, 1, 1, 1, 1,
-1.05172, -0.356363, -1.334103, 1, 1, 1, 1, 1,
-1.049239, -0.2466142, -1.565355, 1, 1, 1, 1, 1,
-1.048973, 0.3640256, -3.150526, 1, 1, 1, 1, 1,
-1.045104, -0.9720646, -2.136776, 1, 1, 1, 1, 1,
-1.041388, 0.1758467, -3.142051, 0, 0, 1, 1, 1,
-1.041059, 1.897111, 0.4665307, 1, 0, 0, 1, 1,
-1.034212, -0.9709898, -1.310898, 1, 0, 0, 1, 1,
-1.018563, -0.4884117, -0.8810663, 1, 0, 0, 1, 1,
-1.017297, 0.4796386, 0.2514697, 1, 0, 0, 1, 1,
-1.009133, -1.921657, -2.285774, 1, 0, 0, 1, 1,
-0.995487, 0.1308997, -1.39806, 0, 0, 0, 1, 1,
-0.9924895, 0.4637136, -3.030082, 0, 0, 0, 1, 1,
-0.9906402, -0.7192674, -1.914305, 0, 0, 0, 1, 1,
-0.9870804, 1.734569, 0.6949469, 0, 0, 0, 1, 1,
-0.9824868, 0.7703963, -2.530405, 0, 0, 0, 1, 1,
-0.9744896, -0.7131537, -0.6868782, 0, 0, 0, 1, 1,
-0.9712418, -1.182437, -2.00286, 0, 0, 0, 1, 1,
-0.9677613, -0.5079359, -3.197441, 1, 1, 1, 1, 1,
-0.9638645, 0.5343812, -1.508631, 1, 1, 1, 1, 1,
-0.9572285, 1.115156, -1.266452, 1, 1, 1, 1, 1,
-0.9571791, -0.2381555, -0.5700482, 1, 1, 1, 1, 1,
-0.9559647, -0.1507206, -1.02572, 1, 1, 1, 1, 1,
-0.9540051, -0.1196753, -1.647116, 1, 1, 1, 1, 1,
-0.9515207, -0.7194231, -4.100036, 1, 1, 1, 1, 1,
-0.9415314, 1.117592, 0.7778002, 1, 1, 1, 1, 1,
-0.9341144, -0.8603731, -3.795793, 1, 1, 1, 1, 1,
-0.9339852, -1.038511, -2.365018, 1, 1, 1, 1, 1,
-0.931815, -0.4782933, -2.364069, 1, 1, 1, 1, 1,
-0.9264336, -1.024294, -2.446625, 1, 1, 1, 1, 1,
-0.9263479, 1.588173, -0.6178828, 1, 1, 1, 1, 1,
-0.9259441, -0.7918409, -1.801459, 1, 1, 1, 1, 1,
-0.9241674, 0.4742472, -2.303562, 1, 1, 1, 1, 1,
-0.9236123, -0.09201902, -3.399955, 0, 0, 1, 1, 1,
-0.9172888, -0.5173634, -2.977037, 1, 0, 0, 1, 1,
-0.9162593, 0.4428966, -1.448791, 1, 0, 0, 1, 1,
-0.9089682, -0.2750925, -4.825061, 1, 0, 0, 1, 1,
-0.9052778, 0.8030115, 1.017267, 1, 0, 0, 1, 1,
-0.899826, -0.900512, -1.483819, 1, 0, 0, 1, 1,
-0.8995429, -0.2436168, -0.9340926, 0, 0, 0, 1, 1,
-0.8964029, 0.9342101, -1.619478, 0, 0, 0, 1, 1,
-0.8830387, -0.4966012, -3.056773, 0, 0, 0, 1, 1,
-0.8725035, -0.09900592, -0.5358779, 0, 0, 0, 1, 1,
-0.8693585, 0.1640289, -1.447537, 0, 0, 0, 1, 1,
-0.8620712, 1.895698, -0.3209638, 0, 0, 0, 1, 1,
-0.8584434, 0.5424108, -0.1532516, 0, 0, 0, 1, 1,
-0.8534456, 1.509722, -1.620875, 1, 1, 1, 1, 1,
-0.8471572, -0.2177814, -3.10832, 1, 1, 1, 1, 1,
-0.8462448, -1.174755, -1.601027, 1, 1, 1, 1, 1,
-0.8386129, -0.8023097, -4.388138, 1, 1, 1, 1, 1,
-0.8363246, 0.1389618, -0.7624452, 1, 1, 1, 1, 1,
-0.8326278, 1.498082, -0.1554341, 1, 1, 1, 1, 1,
-0.8323302, -2.603703, -2.256708, 1, 1, 1, 1, 1,
-0.8302124, 0.7947124, -0.9869298, 1, 1, 1, 1, 1,
-0.8203071, 1.471082, 0.2385651, 1, 1, 1, 1, 1,
-0.8200064, -1.056973, -2.853235, 1, 1, 1, 1, 1,
-0.8196357, -0.2126113, -0.5144649, 1, 1, 1, 1, 1,
-0.8196005, -0.3484419, -3.476499, 1, 1, 1, 1, 1,
-0.8190138, 1.231304, -0.1601798, 1, 1, 1, 1, 1,
-0.8100533, 1.089186, -1.156305, 1, 1, 1, 1, 1,
-0.8078967, -0.9485437, -1.31487, 1, 1, 1, 1, 1,
-0.8043957, 0.540876, -3.257778, 0, 0, 1, 1, 1,
-0.8035257, 1.432741, -0.4503006, 1, 0, 0, 1, 1,
-0.8023416, 0.946376, -1.272258, 1, 0, 0, 1, 1,
-0.79308, 1.139133, -1.47752, 1, 0, 0, 1, 1,
-0.791826, -1.791383, -4.164888, 1, 0, 0, 1, 1,
-0.7917887, -0.2438289, -1.320404, 1, 0, 0, 1, 1,
-0.7916102, -0.1499633, -0.2113692, 0, 0, 0, 1, 1,
-0.7886239, -0.2684907, -3.551138, 0, 0, 0, 1, 1,
-0.7881293, 0.3646651, -0.6461062, 0, 0, 0, 1, 1,
-0.7843041, -0.9090329, -2.905134, 0, 0, 0, 1, 1,
-0.783824, 1.354778, 1.300866, 0, 0, 0, 1, 1,
-0.7782815, 0.1007612, -2.657896, 0, 0, 0, 1, 1,
-0.777765, -1.527512, -2.734365, 0, 0, 0, 1, 1,
-0.7712532, -1.576437, -2.809473, 1, 1, 1, 1, 1,
-0.7689031, 0.3059285, -0.08284186, 1, 1, 1, 1, 1,
-0.7628369, -0.6473217, -1.701151, 1, 1, 1, 1, 1,
-0.7570478, 0.3270773, -1.685904, 1, 1, 1, 1, 1,
-0.7524436, 0.5773973, -0.6759797, 1, 1, 1, 1, 1,
-0.7459965, -0.8259357, -1.742263, 1, 1, 1, 1, 1,
-0.7450032, 0.3784244, -1.284158, 1, 1, 1, 1, 1,
-0.7448261, -0.04437962, -0.3964074, 1, 1, 1, 1, 1,
-0.7435668, 2.61096, 0.06278393, 1, 1, 1, 1, 1,
-0.7380686, 1.952232, -0.934038, 1, 1, 1, 1, 1,
-0.7373497, 1.846177, 0.2330141, 1, 1, 1, 1, 1,
-0.730383, -0.9495448, -2.673641, 1, 1, 1, 1, 1,
-0.7286296, -1.114863, -1.922215, 1, 1, 1, 1, 1,
-0.7232732, 0.30036, -1.382549, 1, 1, 1, 1, 1,
-0.722266, 2.025155, 0.7879383, 1, 1, 1, 1, 1,
-0.7212085, -1.619845, -2.086439, 0, 0, 1, 1, 1,
-0.7144138, 0.66306, 0.1908372, 1, 0, 0, 1, 1,
-0.7130477, 0.3532361, -0.2871379, 1, 0, 0, 1, 1,
-0.7099261, -0.5255603, -1.827921, 1, 0, 0, 1, 1,
-0.7029878, 0.5768989, -1.317467, 1, 0, 0, 1, 1,
-0.7027903, 0.04975962, -2.684678, 1, 0, 0, 1, 1,
-0.7010237, -0.7902332, -2.492673, 0, 0, 0, 1, 1,
-0.6993467, 0.7642878, -0.4285519, 0, 0, 0, 1, 1,
-0.6988159, -0.4654615, -2.494297, 0, 0, 0, 1, 1,
-0.6918843, 0.3077746, -2.144398, 0, 0, 0, 1, 1,
-0.6869808, 1.218757, -1.217181, 0, 0, 0, 1, 1,
-0.6857732, 0.06080615, 0.8247928, 0, 0, 0, 1, 1,
-0.6814202, 0.6606475, -0.1043509, 0, 0, 0, 1, 1,
-0.6790472, -2.288685, -3.270008, 1, 1, 1, 1, 1,
-0.6759623, -0.9400629, -2.630703, 1, 1, 1, 1, 1,
-0.6747761, 0.8516375, 0.634934, 1, 1, 1, 1, 1,
-0.6739432, -1.273672, -2.154672, 1, 1, 1, 1, 1,
-0.6681867, 1.151492, 0.545825, 1, 1, 1, 1, 1,
-0.668159, 1.662854, 0.7101999, 1, 1, 1, 1, 1,
-0.6577914, -0.8334288, -0.527944, 1, 1, 1, 1, 1,
-0.6569189, 0.37331, -0.8154925, 1, 1, 1, 1, 1,
-0.6374316, -1.393412, -3.648981, 1, 1, 1, 1, 1,
-0.6297679, -0.6868858, -4.151084, 1, 1, 1, 1, 1,
-0.6271709, -0.7884781, -1.217827, 1, 1, 1, 1, 1,
-0.6262576, 0.480692, -0.3233669, 1, 1, 1, 1, 1,
-0.6238123, 1.293557, -0.7423145, 1, 1, 1, 1, 1,
-0.6212988, 1.023283, 0.0006370686, 1, 1, 1, 1, 1,
-0.6173877, -0.936785, -4.464929, 1, 1, 1, 1, 1,
-0.6169044, 1.004506, 0.2925102, 0, 0, 1, 1, 1,
-0.6165026, 0.5519454, -0.1024196, 1, 0, 0, 1, 1,
-0.6164868, 0.8714759, -0.2980286, 1, 0, 0, 1, 1,
-0.6132928, -1.675611, -3.00506, 1, 0, 0, 1, 1,
-0.6126485, 0.4549618, -3.059802, 1, 0, 0, 1, 1,
-0.6107116, -1.121082, -2.483045, 1, 0, 0, 1, 1,
-0.6092755, 1.098401, -1.056618, 0, 0, 0, 1, 1,
-0.5919742, 0.6340308, 1.066538, 0, 0, 0, 1, 1,
-0.5909753, 0.4992789, -0.6804712, 0, 0, 0, 1, 1,
-0.5905443, -0.06280766, -1.500044, 0, 0, 0, 1, 1,
-0.5903307, -1.173284, -4.164358, 0, 0, 0, 1, 1,
-0.5874978, 0.4041929, -1.762298, 0, 0, 0, 1, 1,
-0.5869187, 1.725567, 0.01752844, 0, 0, 0, 1, 1,
-0.5832563, 0.5085182, 0.6174343, 1, 1, 1, 1, 1,
-0.5820771, 0.2281761, -0.3737887, 1, 1, 1, 1, 1,
-0.5797135, -0.3626927, -1.733145, 1, 1, 1, 1, 1,
-0.5792518, 0.3396487, -1.456899, 1, 1, 1, 1, 1,
-0.5757506, 1.11824, -1.416836, 1, 1, 1, 1, 1,
-0.5756478, -0.6966867, -0.7897025, 1, 1, 1, 1, 1,
-0.5740414, -1.021651, -2.747053, 1, 1, 1, 1, 1,
-0.5723685, 0.7148424, -2.623488, 1, 1, 1, 1, 1,
-0.570908, 0.6649662, -1.412452, 1, 1, 1, 1, 1,
-0.5686299, 1.396458, 0.5326893, 1, 1, 1, 1, 1,
-0.5648307, 0.6302138, -1.559026, 1, 1, 1, 1, 1,
-0.5617478, -1.843134, -3.570162, 1, 1, 1, 1, 1,
-0.5560704, 0.1391626, -2.241643, 1, 1, 1, 1, 1,
-0.5401925, -1.328447, -4.567511, 1, 1, 1, 1, 1,
-0.5397276, -0.5584043, -3.142215, 1, 1, 1, 1, 1,
-0.5345669, 0.810326, -2.498215, 0, 0, 1, 1, 1,
-0.5277013, 0.2660114, -1.05991, 1, 0, 0, 1, 1,
-0.5222223, 0.3767759, -1.132325, 1, 0, 0, 1, 1,
-0.5207482, -0.6074189, -0.514707, 1, 0, 0, 1, 1,
-0.5203246, 1.074075, -0.5549175, 1, 0, 0, 1, 1,
-0.5151072, -0.4795344, -2.2521, 1, 0, 0, 1, 1,
-0.515029, 0.9346169, -3.679827, 0, 0, 0, 1, 1,
-0.5148187, -0.4162805, -3.381682, 0, 0, 0, 1, 1,
-0.5085139, 1.215826, -0.5013846, 0, 0, 0, 1, 1,
-0.5041379, -0.3116832, 0.3972675, 0, 0, 0, 1, 1,
-0.4999372, -0.2340205, -2.367054, 0, 0, 0, 1, 1,
-0.4980606, -1.340161, -2.178587, 0, 0, 0, 1, 1,
-0.4920057, -0.9576667, -2.625244, 0, 0, 0, 1, 1,
-0.4916771, 0.5540893, -1.077563, 1, 1, 1, 1, 1,
-0.4905779, -1.609897, -3.075607, 1, 1, 1, 1, 1,
-0.4870246, -1.20296, -1.61123, 1, 1, 1, 1, 1,
-0.4856781, 0.1361896, -1.263544, 1, 1, 1, 1, 1,
-0.4801053, 0.8366683, 0.4691422, 1, 1, 1, 1, 1,
-0.4800141, 1.601633, 2.858444, 1, 1, 1, 1, 1,
-0.4799576, -1.057593, -2.290038, 1, 1, 1, 1, 1,
-0.4745777, -0.4254701, -3.099524, 1, 1, 1, 1, 1,
-0.4647551, 0.03998149, -1.169921, 1, 1, 1, 1, 1,
-0.4642512, 1.994601, 2.377318, 1, 1, 1, 1, 1,
-0.4638196, -0.62976, -3.646569, 1, 1, 1, 1, 1,
-0.4543669, -1.297775, -4.340662, 1, 1, 1, 1, 1,
-0.452797, 1.240504, 1.119138, 1, 1, 1, 1, 1,
-0.4473186, -0.1327276, -1.890043, 1, 1, 1, 1, 1,
-0.4429518, 0.1310595, -2.721998, 1, 1, 1, 1, 1,
-0.4418742, -0.7177445, -1.783745, 0, 0, 1, 1, 1,
-0.4404657, -0.9991294, -1.75039, 1, 0, 0, 1, 1,
-0.4399436, 1.1462, -0.7501658, 1, 0, 0, 1, 1,
-0.4371189, -0.3582771, 0.01234611, 1, 0, 0, 1, 1,
-0.430976, 0.9685446, 1.378975, 1, 0, 0, 1, 1,
-0.4295848, 0.2080477, -0.6622577, 1, 0, 0, 1, 1,
-0.4286809, 2.426122, 0.07060399, 0, 0, 0, 1, 1,
-0.423982, 1.411695, 0.4664422, 0, 0, 0, 1, 1,
-0.4239297, 1.904761, -0.2325052, 0, 0, 0, 1, 1,
-0.4216183, -0.867236, -3.198661, 0, 0, 0, 1, 1,
-0.4197142, 0.8853506, -0.3583438, 0, 0, 0, 1, 1,
-0.4161529, -0.5647348, -5.196449, 0, 0, 0, 1, 1,
-0.4150608, 1.00089, -0.2251805, 0, 0, 0, 1, 1,
-0.4142214, -1.599628, -1.925738, 1, 1, 1, 1, 1,
-0.4140203, -0.6259283, -1.70115, 1, 1, 1, 1, 1,
-0.4130203, -0.6495662, -1.006327, 1, 1, 1, 1, 1,
-0.4118455, 0.2599653, -0.4082327, 1, 1, 1, 1, 1,
-0.411199, 0.06650592, -0.5099993, 1, 1, 1, 1, 1,
-0.4104807, -0.9143371, -2.680789, 1, 1, 1, 1, 1,
-0.4099703, 0.03602489, -1.41633, 1, 1, 1, 1, 1,
-0.4098668, 0.395538, -0.5527784, 1, 1, 1, 1, 1,
-0.409069, 1.062888, 1.096568, 1, 1, 1, 1, 1,
-0.4084857, -1.337786, -3.063359, 1, 1, 1, 1, 1,
-0.4042422, 1.102533, -1.218397, 1, 1, 1, 1, 1,
-0.3983037, 1.268571, -1.934164, 1, 1, 1, 1, 1,
-0.3975793, -1.045509, -3.552737, 1, 1, 1, 1, 1,
-0.3939669, -0.1072407, -2.197294, 1, 1, 1, 1, 1,
-0.3868776, -0.9130407, -2.080773, 1, 1, 1, 1, 1,
-0.3804261, -0.7512039, -2.124146, 0, 0, 1, 1, 1,
-0.3799944, -2.04039, -3.014335, 1, 0, 0, 1, 1,
-0.3711048, -1.133856, -1.106645, 1, 0, 0, 1, 1,
-0.3708723, -0.2455894, -1.340594, 1, 0, 0, 1, 1,
-0.3697601, -1.691915, -3.83604, 1, 0, 0, 1, 1,
-0.3659453, -0.08033637, -0.006561068, 1, 0, 0, 1, 1,
-0.3628044, -1.073619, -3.310134, 0, 0, 0, 1, 1,
-0.3590765, 0.09743813, -3.292442, 0, 0, 0, 1, 1,
-0.3562177, 1.609075, -0.6965815, 0, 0, 0, 1, 1,
-0.353642, 1.481047, 0.2991285, 0, 0, 0, 1, 1,
-0.3483039, -0.7901649, -1.67586, 0, 0, 0, 1, 1,
-0.3361743, -0.6953544, -4.462494, 0, 0, 0, 1, 1,
-0.3315648, -1.386264, -3.451134, 0, 0, 0, 1, 1,
-0.3248746, -0.414349, -4.891046, 1, 1, 1, 1, 1,
-0.321541, -0.2070776, -1.891868, 1, 1, 1, 1, 1,
-0.3165272, -0.3106864, -2.320001, 1, 1, 1, 1, 1,
-0.3136298, -0.6998836, -3.432801, 1, 1, 1, 1, 1,
-0.3135644, 0.7295182, 0.1990175, 1, 1, 1, 1, 1,
-0.3105395, 2.095482, -0.7605551, 1, 1, 1, 1, 1,
-0.3048315, 1.934679, -0.5663475, 1, 1, 1, 1, 1,
-0.3042289, 0.8352791, -1.564474, 1, 1, 1, 1, 1,
-0.30123, 0.02178688, 0.6341417, 1, 1, 1, 1, 1,
-0.300442, 1.393778, -0.6826945, 1, 1, 1, 1, 1,
-0.3001089, 0.2035915, -1.3383, 1, 1, 1, 1, 1,
-0.2970704, 0.8082209, -0.9946747, 1, 1, 1, 1, 1,
-0.2953391, -1.363586, -4.366647, 1, 1, 1, 1, 1,
-0.2938919, -1.225589, -2.650093, 1, 1, 1, 1, 1,
-0.2914369, 0.5905215, 0.104807, 1, 1, 1, 1, 1,
-0.2763121, -1.125716, -3.391609, 0, 0, 1, 1, 1,
-0.2708216, -0.5691444, -2.384947, 1, 0, 0, 1, 1,
-0.2700532, -1.537471, -3.215053, 1, 0, 0, 1, 1,
-0.2638196, -1.501142, -4.588811, 1, 0, 0, 1, 1,
-0.2623372, -0.7031931, -1.498697, 1, 0, 0, 1, 1,
-0.2588066, 0.06589933, -1.430776, 1, 0, 0, 1, 1,
-0.2578194, 2.401964, -0.1993388, 0, 0, 0, 1, 1,
-0.2568601, -0.5480561, -2.407471, 0, 0, 0, 1, 1,
-0.2552868, -0.6240615, -2.026065, 0, 0, 0, 1, 1,
-0.2547017, -0.09927184, -2.785582, 0, 0, 0, 1, 1,
-0.2546422, -0.2505212, -2.809524, 0, 0, 0, 1, 1,
-0.2528904, -0.1553774, -0.8895527, 0, 0, 0, 1, 1,
-0.2502661, 1.293885, -0.009253816, 0, 0, 0, 1, 1,
-0.2496065, -0.4650514, -0.455537, 1, 1, 1, 1, 1,
-0.2486319, 2.7409, -1.356878, 1, 1, 1, 1, 1,
-0.248512, 0.01861144, -0.7516955, 1, 1, 1, 1, 1,
-0.2460219, 0.9298241, 0.07802201, 1, 1, 1, 1, 1,
-0.2449124, 0.1965439, -1.12562, 1, 1, 1, 1, 1,
-0.2441556, -0.01731233, -0.8238888, 1, 1, 1, 1, 1,
-0.2394993, 1.376235, 1.601698, 1, 1, 1, 1, 1,
-0.2352623, 0.5644571, 1.577076, 1, 1, 1, 1, 1,
-0.2350837, -0.3964283, -2.900852, 1, 1, 1, 1, 1,
-0.2326662, -0.2443298, -2.346929, 1, 1, 1, 1, 1,
-0.2257217, 0.9839737, 0.9815577, 1, 1, 1, 1, 1,
-0.2209575, -1.825436, -4.741308, 1, 1, 1, 1, 1,
-0.2137545, -0.5645388, -2.267651, 1, 1, 1, 1, 1,
-0.2127789, -0.2887721, -0.9088832, 1, 1, 1, 1, 1,
-0.2102629, -0.4571802, -3.591104, 1, 1, 1, 1, 1,
-0.2012012, 0.5097413, 1.274542, 0, 0, 1, 1, 1,
-0.1986017, 0.6623914, -0.6072206, 1, 0, 0, 1, 1,
-0.1974241, 0.2622526, -1.073634, 1, 0, 0, 1, 1,
-0.197404, 2.299915, 0.7760907, 1, 0, 0, 1, 1,
-0.196722, -1.916482, -1.706431, 1, 0, 0, 1, 1,
-0.1964962, 1.113532, 1.479172, 1, 0, 0, 1, 1,
-0.1955765, -0.4855538, -0.4371954, 0, 0, 0, 1, 1,
-0.1932113, 0.6823695, 0.4264948, 0, 0, 0, 1, 1,
-0.1907458, 1.53703, -0.5682039, 0, 0, 0, 1, 1,
-0.1904948, -2.369029, -3.90776, 0, 0, 0, 1, 1,
-0.1902822, 0.1976223, -0.4797781, 0, 0, 0, 1, 1,
-0.1899262, -1.384309, -2.600821, 0, 0, 0, 1, 1,
-0.1889908, 2.46431, -0.2080559, 0, 0, 0, 1, 1,
-0.1889308, 0.4641013, -0.529664, 1, 1, 1, 1, 1,
-0.1885247, 0.4613351, -0.670754, 1, 1, 1, 1, 1,
-0.1873307, -0.1444978, -4.435366, 1, 1, 1, 1, 1,
-0.1796528, 0.6017611, -1.288154, 1, 1, 1, 1, 1,
-0.1792707, -1.284144, -3.906389, 1, 1, 1, 1, 1,
-0.1765678, 1.363533, -0.9112991, 1, 1, 1, 1, 1,
-0.1758551, -0.7156, -3.957175, 1, 1, 1, 1, 1,
-0.1746146, 0.7407547, 0.5804923, 1, 1, 1, 1, 1,
-0.172785, 0.9381543, -0.4312207, 1, 1, 1, 1, 1,
-0.172379, 0.4546881, -2.202492, 1, 1, 1, 1, 1,
-0.1692053, -1.886587, -3.902704, 1, 1, 1, 1, 1,
-0.1555997, -0.4743899, -4.267246, 1, 1, 1, 1, 1,
-0.152546, -3.46402, -1.482107, 1, 1, 1, 1, 1,
-0.1494546, 0.4945004, -0.8377742, 1, 1, 1, 1, 1,
-0.1459793, -0.1668689, -2.279866, 1, 1, 1, 1, 1,
-0.1413618, -1.174393, -3.063099, 0, 0, 1, 1, 1,
-0.1408235, 1.130664, -1.182732, 1, 0, 0, 1, 1,
-0.1387433, -0.9167031, -1.674425, 1, 0, 0, 1, 1,
-0.1289317, -0.8114207, -3.543781, 1, 0, 0, 1, 1,
-0.1281279, 0.9212381, 1.666246, 1, 0, 0, 1, 1,
-0.124848, -0.471339, -3.642241, 1, 0, 0, 1, 1,
-0.1237177, -1.667307, -2.858659, 0, 0, 0, 1, 1,
-0.122324, -0.8838625, -2.725508, 0, 0, 0, 1, 1,
-0.1166934, -0.4633547, -3.538114, 0, 0, 0, 1, 1,
-0.1125803, 0.02767559, 0.1947607, 0, 0, 0, 1, 1,
-0.1115915, -0.8923059, -0.5589786, 0, 0, 0, 1, 1,
-0.1106457, 0.2346957, -1.336314, 0, 0, 0, 1, 1,
-0.1031815, -0.3017303, -1.850576, 0, 0, 0, 1, 1,
-0.1013112, -0.1688297, -1.304767, 1, 1, 1, 1, 1,
-0.1004667, 0.1326164, 1.157378, 1, 1, 1, 1, 1,
-0.09745913, -3.03231, -4.329507, 1, 1, 1, 1, 1,
-0.09703038, -1.230435, -3.698691, 1, 1, 1, 1, 1,
-0.09413134, -0.9030882, -4.210132, 1, 1, 1, 1, 1,
-0.08767856, -1.580338, -3.509001, 1, 1, 1, 1, 1,
-0.08734577, -0.986362, -4.052603, 1, 1, 1, 1, 1,
-0.08251634, 1.017238, 1.064021, 1, 1, 1, 1, 1,
-0.0824229, 0.2552727, -0.4304962, 1, 1, 1, 1, 1,
-0.07901954, 0.4773817, -0.1003905, 1, 1, 1, 1, 1,
-0.07497557, -1.437652, -2.726264, 1, 1, 1, 1, 1,
-0.07147598, 0.1921264, -0.1999549, 1, 1, 1, 1, 1,
-0.06524092, -1.466126, -2.524098, 1, 1, 1, 1, 1,
-0.06450095, 0.357854, -1.371939, 1, 1, 1, 1, 1,
-0.06186933, -0.09985013, -2.138858, 1, 1, 1, 1, 1,
-0.06145395, 2.120329, -1.164409, 0, 0, 1, 1, 1,
-0.05704018, 0.2278489, 1.339901, 1, 0, 0, 1, 1,
-0.05620223, -0.7505789, -2.816168, 1, 0, 0, 1, 1,
-0.05106881, -0.7237117, -3.987215, 1, 0, 0, 1, 1,
-0.0506912, 0.6543589, -1.471254, 1, 0, 0, 1, 1,
-0.04910596, 0.3162851, -0.03163124, 1, 0, 0, 1, 1,
-0.04773318, -0.7324302, -4.693626, 0, 0, 0, 1, 1,
-0.04680541, -0.3525653, -4.010641, 0, 0, 0, 1, 1,
-0.04598947, 0.06858362, 0.5273626, 0, 0, 0, 1, 1,
-0.04565093, -0.7900877, -2.504403, 0, 0, 0, 1, 1,
-0.03935389, 1.713064, 0.2571216, 0, 0, 0, 1, 1,
-0.03906817, -0.03743768, -1.621376, 0, 0, 0, 1, 1,
-0.03573783, 0.01096712, 0.5083677, 0, 0, 0, 1, 1,
-0.02823492, -0.4240869, -2.001707, 1, 1, 1, 1, 1,
-0.02154152, -1.179682, -4.968519, 1, 1, 1, 1, 1,
-0.0197126, -1.036218, -3.086623, 1, 1, 1, 1, 1,
-0.01844393, 0.5662152, 0.2708147, 1, 1, 1, 1, 1,
-0.01596559, -0.0004487788, -0.2202598, 1, 1, 1, 1, 1,
-0.01445004, 0.4088625, 0.05486533, 1, 1, 1, 1, 1,
-0.01060253, -0.3821184, -3.606472, 1, 1, 1, 1, 1,
-0.007710253, -0.4668829, -3.812626, 1, 1, 1, 1, 1,
-0.007650245, 0.1506056, -0.4517228, 1, 1, 1, 1, 1,
-0.006061485, -1.561455, -3.193151, 1, 1, 1, 1, 1,
-0.004299235, 0.9784697, -0.3245508, 1, 1, 1, 1, 1,
-0.004232115, -1.475714, -3.048661, 1, 1, 1, 1, 1,
-0.001183431, -0.4315491, -3.33667, 1, 1, 1, 1, 1,
0.0008174089, 0.6681029, -0.2897312, 1, 1, 1, 1, 1,
0.00159287, -2.787012, 3.215346, 1, 1, 1, 1, 1,
0.004152507, 0.8573897, -0.6583754, 0, 0, 1, 1, 1,
0.005121984, -0.692814, 2.359903, 1, 0, 0, 1, 1,
0.008405776, 0.4168091, -0.5444559, 1, 0, 0, 1, 1,
0.009808597, 1.231352, -0.3503519, 1, 0, 0, 1, 1,
0.01175565, -0.003869094, 1.590725, 1, 0, 0, 1, 1,
0.01250553, 0.05787222, -0.1736111, 1, 0, 0, 1, 1,
0.01589532, 1.378834, 0.9396952, 0, 0, 0, 1, 1,
0.01710512, -0.5021945, 0.8238104, 0, 0, 0, 1, 1,
0.01907632, 0.5479803, -1.148555, 0, 0, 0, 1, 1,
0.02143501, 0.8688961, -0.2621824, 0, 0, 0, 1, 1,
0.02941573, 0.5630303, -0.7357992, 0, 0, 0, 1, 1,
0.03512516, -0.9643554, 1.462788, 0, 0, 0, 1, 1,
0.04005452, 0.1740449, 2.718206, 0, 0, 0, 1, 1,
0.04251077, 1.372838, 0.2813956, 1, 1, 1, 1, 1,
0.0457132, -0.5531194, 3.28668, 1, 1, 1, 1, 1,
0.04798684, 0.1409109, 2.232697, 1, 1, 1, 1, 1,
0.05108818, 0.02642081, 2.221114, 1, 1, 1, 1, 1,
0.05136836, -0.6548988, 3.372458, 1, 1, 1, 1, 1,
0.05272467, 0.334113, -0.8206469, 1, 1, 1, 1, 1,
0.05378077, -0.73343, 1.345137, 1, 1, 1, 1, 1,
0.05633916, 0.5995025, 0.2708841, 1, 1, 1, 1, 1,
0.05847554, -1.262321, 1.860089, 1, 1, 1, 1, 1,
0.05979365, -0.4789916, 3.136073, 1, 1, 1, 1, 1,
0.06165211, -2.232762, 2.096803, 1, 1, 1, 1, 1,
0.06526337, -1.172575, 2.960622, 1, 1, 1, 1, 1,
0.07756366, -1.696223, 4.470753, 1, 1, 1, 1, 1,
0.08189984, 0.8501608, 0.8794454, 1, 1, 1, 1, 1,
0.08591709, -1.110218, 3.452897, 1, 1, 1, 1, 1,
0.09098628, -0.9051139, 3.257506, 0, 0, 1, 1, 1,
0.09268172, -0.6912925, 2.345963, 1, 0, 0, 1, 1,
0.09332872, -2.095608, 2.592009, 1, 0, 0, 1, 1,
0.09450284, 0.006795152, 2.746612, 1, 0, 0, 1, 1,
0.09621011, -0.5159956, 3.931008, 1, 0, 0, 1, 1,
0.09727023, -1.390862, 4.105057, 1, 0, 0, 1, 1,
0.09771474, 0.1569032, 0.3270006, 0, 0, 0, 1, 1,
0.09803193, 0.5072008, 0.3256804, 0, 0, 0, 1, 1,
0.0992871, 1.447043, 1.430406, 0, 0, 0, 1, 1,
0.1076496, 0.3973009, -0.04558711, 0, 0, 0, 1, 1,
0.1078902, 2.026021, 1.451415, 0, 0, 0, 1, 1,
0.1126141, 0.8381447, -1.206276, 0, 0, 0, 1, 1,
0.1158416, -1.416163, 2.101243, 0, 0, 0, 1, 1,
0.1179222, -0.04590918, 2.842171, 1, 1, 1, 1, 1,
0.1195016, -0.6464043, 4.195814, 1, 1, 1, 1, 1,
0.1231428, 0.2337922, -0.1357755, 1, 1, 1, 1, 1,
0.1238177, -1.218352, 2.241944, 1, 1, 1, 1, 1,
0.1249431, -1.589684, 1.748738, 1, 1, 1, 1, 1,
0.1293477, -0.7844394, 4.247541, 1, 1, 1, 1, 1,
0.1354858, -0.8507183, 4.873432, 1, 1, 1, 1, 1,
0.1384347, 1.796325, 0.7631317, 1, 1, 1, 1, 1,
0.1438844, 1.693307, -0.4188132, 1, 1, 1, 1, 1,
0.14439, 0.4802557, 1.446995, 1, 1, 1, 1, 1,
0.1461517, 0.1192842, -0.4506679, 1, 1, 1, 1, 1,
0.1470026, 1.057697, -0.7327399, 1, 1, 1, 1, 1,
0.1493553, -0.6397523, 3.192926, 1, 1, 1, 1, 1,
0.1508589, -1.446735, 1.990536, 1, 1, 1, 1, 1,
0.1524943, -0.609705, 1.770547, 1, 1, 1, 1, 1,
0.1542853, -0.4885334, 5.368961, 0, 0, 1, 1, 1,
0.15673, -1.615745, 3.840578, 1, 0, 0, 1, 1,
0.1572984, 0.6502156, 0.8207456, 1, 0, 0, 1, 1,
0.1578163, -0.9257839, 5.274794, 1, 0, 0, 1, 1,
0.1590701, -2.523385, 4.492932, 1, 0, 0, 1, 1,
0.1608891, -0.6125656, 3.673443, 1, 0, 0, 1, 1,
0.1635595, -0.2464156, 3.624142, 0, 0, 0, 1, 1,
0.1636789, 1.661976, 0.4768161, 0, 0, 0, 1, 1,
0.1638176, -0.8739687, 3.430935, 0, 0, 0, 1, 1,
0.1638324, -1.466252, 1.419065, 0, 0, 0, 1, 1,
0.1648555, -1.509089, 2.822474, 0, 0, 0, 1, 1,
0.1734964, -0.9891567, 4.974423, 0, 0, 0, 1, 1,
0.1783209, 0.8206307, 0.8320551, 0, 0, 0, 1, 1,
0.1801103, -0.492057, 1.087627, 1, 1, 1, 1, 1,
0.1854584, 0.01151147, 1.779783, 1, 1, 1, 1, 1,
0.1857897, 0.0629875, 0.6684366, 1, 1, 1, 1, 1,
0.1880612, 2.141018, -0.728885, 1, 1, 1, 1, 1,
0.1883258, -1.021855, 4.17252, 1, 1, 1, 1, 1,
0.1894182, 0.7479, 0.224189, 1, 1, 1, 1, 1,
0.1897983, -1.944247, 2.260352, 1, 1, 1, 1, 1,
0.1932352, -0.2470975, 2.433107, 1, 1, 1, 1, 1,
0.1955796, -0.1261058, 2.925037, 1, 1, 1, 1, 1,
0.1960886, 1.026736, 0.8710558, 1, 1, 1, 1, 1,
0.1986487, 0.1064898, 0.5854902, 1, 1, 1, 1, 1,
0.1993078, -0.9472433, 1.467141, 1, 1, 1, 1, 1,
0.2009032, -2.271613, 2.892831, 1, 1, 1, 1, 1,
0.209205, -1.193184, 1.309997, 1, 1, 1, 1, 1,
0.2183062, 0.05307163, 0.8049272, 1, 1, 1, 1, 1,
0.2186593, 0.7690343, 0.2922359, 0, 0, 1, 1, 1,
0.2190565, 0.2488841, 2.139183, 1, 0, 0, 1, 1,
0.2209925, -1.074095, 3.995619, 1, 0, 0, 1, 1,
0.2238632, 0.9099332, 0.3841262, 1, 0, 0, 1, 1,
0.2241197, -0.8824849, 2.350444, 1, 0, 0, 1, 1,
0.2244647, 0.5988244, 0.5101846, 1, 0, 0, 1, 1,
0.2261739, -0.3082997, 4.22749, 0, 0, 0, 1, 1,
0.2283761, 0.31499, 0.7453995, 0, 0, 0, 1, 1,
0.2291021, 1.17768, -0.4277952, 0, 0, 0, 1, 1,
0.233132, 0.3467782, 1.501692, 0, 0, 0, 1, 1,
0.233164, 1.002825, 1.109527, 0, 0, 0, 1, 1,
0.2337721, -1.301306, 2.921197, 0, 0, 0, 1, 1,
0.2365968, 0.1867469, 0.8197254, 0, 0, 0, 1, 1,
0.2390523, -0.1407532, 2.718364, 1, 1, 1, 1, 1,
0.2418132, 0.6580153, 2.285866, 1, 1, 1, 1, 1,
0.2448423, 0.4005488, 1.846763, 1, 1, 1, 1, 1,
0.2452638, -1.354256, 1.732548, 1, 1, 1, 1, 1,
0.2465725, -0.2582199, 2.697129, 1, 1, 1, 1, 1,
0.2526443, 1.148792, 0.5867296, 1, 1, 1, 1, 1,
0.253268, 0.8481792, 2.448512, 1, 1, 1, 1, 1,
0.2541194, 0.457436, 0.6378945, 1, 1, 1, 1, 1,
0.2547337, -0.7819266, 3.026484, 1, 1, 1, 1, 1,
0.2554604, -1.611878, 2.48552, 1, 1, 1, 1, 1,
0.2572983, 1.282514, -1.154214, 1, 1, 1, 1, 1,
0.2622476, -1.252945, 3.892411, 1, 1, 1, 1, 1,
0.2627236, 0.2779607, 1.387179, 1, 1, 1, 1, 1,
0.2666386, -0.8135555, 3.567385, 1, 1, 1, 1, 1,
0.2667032, 0.3045876, 1.307194, 1, 1, 1, 1, 1,
0.2668588, 0.261838, -0.6482511, 0, 0, 1, 1, 1,
0.2690594, -0.3460155, 2.340128, 1, 0, 0, 1, 1,
0.2712247, 0.7848621, 1.26809, 1, 0, 0, 1, 1,
0.2778517, -1.377425, 2.656274, 1, 0, 0, 1, 1,
0.279074, 0.3308918, 1.947626, 1, 0, 0, 1, 1,
0.2810913, 2.263598, -0.7664068, 1, 0, 0, 1, 1,
0.2939221, 0.2259124, -1.387138, 0, 0, 0, 1, 1,
0.297671, -1.587666, 3.274227, 0, 0, 0, 1, 1,
0.2999884, 0.43622, 0.6186243, 0, 0, 0, 1, 1,
0.3030043, 0.5146197, 0.7059575, 0, 0, 0, 1, 1,
0.3031428, 0.3244202, -0.4548949, 0, 0, 0, 1, 1,
0.3119219, -0.0485375, 1.072804, 0, 0, 0, 1, 1,
0.3122789, -0.04623363, 0.9764937, 0, 0, 0, 1, 1,
0.3132392, -0.239401, 1.481021, 1, 1, 1, 1, 1,
0.3132685, -0.2211966, 1.298536, 1, 1, 1, 1, 1,
0.3161887, -1.000361, 3.154553, 1, 1, 1, 1, 1,
0.3201776, 1.116684, 0.5432305, 1, 1, 1, 1, 1,
0.3214392, 0.6760092, -0.2351224, 1, 1, 1, 1, 1,
0.3217596, -2.083532, 2.914854, 1, 1, 1, 1, 1,
0.3237505, -0.2226374, 2.839879, 1, 1, 1, 1, 1,
0.326028, 1.491505, -0.7528901, 1, 1, 1, 1, 1,
0.326158, 0.4387646, 0.8118916, 1, 1, 1, 1, 1,
0.3278714, -0.6395687, 3.800836, 1, 1, 1, 1, 1,
0.3300565, -0.2557395, 4.548095, 1, 1, 1, 1, 1,
0.3323296, 1.577585, 1.179878, 1, 1, 1, 1, 1,
0.3324448, 0.7568415, -0.08714249, 1, 1, 1, 1, 1,
0.3368377, 0.9868293, -0.9205304, 1, 1, 1, 1, 1,
0.3369751, 1.143798, 0.9809472, 1, 1, 1, 1, 1,
0.3387118, 0.168266, 0.3891879, 0, 0, 1, 1, 1,
0.3388669, -0.1957228, 1.049983, 1, 0, 0, 1, 1,
0.3463484, 0.4164695, -1.995272, 1, 0, 0, 1, 1,
0.3489115, -0.005521328, 1.48186, 1, 0, 0, 1, 1,
0.3515714, -0.42941, 3.866818, 1, 0, 0, 1, 1,
0.357605, -0.4822642, 3.750451, 1, 0, 0, 1, 1,
0.3594699, -1.17846, 2.471499, 0, 0, 0, 1, 1,
0.3630699, 0.9359047, 0.0901972, 0, 0, 0, 1, 1,
0.3639167, -0.9073938, 1.738981, 0, 0, 0, 1, 1,
0.3643115, 0.3655151, 1.385149, 0, 0, 0, 1, 1,
0.3650069, 0.2353908, 0.9364368, 0, 0, 0, 1, 1,
0.3670292, -0.1996945, 1.508902, 0, 0, 0, 1, 1,
0.3692303, -0.8748198, 2.337635, 0, 0, 0, 1, 1,
0.3732997, 2.000389, 0.2014081, 1, 1, 1, 1, 1,
0.3745683, -1.155936, 3.98571, 1, 1, 1, 1, 1,
0.374692, 0.591552, 0.3941389, 1, 1, 1, 1, 1,
0.378527, 1.531378, 0.194189, 1, 1, 1, 1, 1,
0.3806837, -0.305706, 1.103638, 1, 1, 1, 1, 1,
0.3813098, -0.5109624, 2.733519, 1, 1, 1, 1, 1,
0.3842291, -0.1830484, 0.8401656, 1, 1, 1, 1, 1,
0.3863876, 0.6757131, 1.506672, 1, 1, 1, 1, 1,
0.3880935, 0.8802309, 2.040561, 1, 1, 1, 1, 1,
0.3886583, 0.111706, 3.403595, 1, 1, 1, 1, 1,
0.3909119, -0.6268826, 2.435364, 1, 1, 1, 1, 1,
0.3919682, -0.1153302, 2.02531, 1, 1, 1, 1, 1,
0.3979189, -0.01607959, 1.612268, 1, 1, 1, 1, 1,
0.3983774, 0.8721681, -0.7373582, 1, 1, 1, 1, 1,
0.4018767, -0.4909401, 1.758112, 1, 1, 1, 1, 1,
0.4103313, -0.2735757, 2.006565, 0, 0, 1, 1, 1,
0.4160625, -1.032416, 1.096804, 1, 0, 0, 1, 1,
0.4198942, -0.2488543, 2.944551, 1, 0, 0, 1, 1,
0.4217964, -0.3176441, 3.141765, 1, 0, 0, 1, 1,
0.4229333, -0.9685972, 4.697314, 1, 0, 0, 1, 1,
0.4265156, -0.2714885, 3.018027, 1, 0, 0, 1, 1,
0.4267914, 0.2287285, 5.005039, 0, 0, 0, 1, 1,
0.4286376, 0.18298, 0.1671846, 0, 0, 0, 1, 1,
0.4302829, -2.219299, 4.440408, 0, 0, 0, 1, 1,
0.437231, 1.072473, 0.7511889, 0, 0, 0, 1, 1,
0.4385035, 2.043328, 0.5449704, 0, 0, 0, 1, 1,
0.4386985, 0.08834365, 1.87627, 0, 0, 0, 1, 1,
0.4393158, -1.767007, 2.295588, 0, 0, 0, 1, 1,
0.4411553, 0.6857495, 1.041018, 1, 1, 1, 1, 1,
0.441835, -0.816562, 2.638981, 1, 1, 1, 1, 1,
0.4430517, -0.1086923, 1.571086, 1, 1, 1, 1, 1,
0.4446394, -0.4990797, 3.085758, 1, 1, 1, 1, 1,
0.4467162, 0.1760788, 1.457911, 1, 1, 1, 1, 1,
0.4503677, -0.04270959, 0.113557, 1, 1, 1, 1, 1,
0.4513554, -0.5907062, 1.520454, 1, 1, 1, 1, 1,
0.4529301, 0.3726652, -0.8480733, 1, 1, 1, 1, 1,
0.4594259, -0.4639092, -0.3779974, 1, 1, 1, 1, 1,
0.4607001, 1.526645, 2.048698, 1, 1, 1, 1, 1,
0.4677604, -0.3038938, 1.312233, 1, 1, 1, 1, 1,
0.4688096, 0.4690406, 0.2577435, 1, 1, 1, 1, 1,
0.4692498, -0.5092945, 2.302285, 1, 1, 1, 1, 1,
0.4718476, 0.4281043, 2.188051, 1, 1, 1, 1, 1,
0.4720172, -0.1900352, 1.546624, 1, 1, 1, 1, 1,
0.4731452, 1.248026, -0.07143364, 0, 0, 1, 1, 1,
0.4754623, -1.434766, 4.01731, 1, 0, 0, 1, 1,
0.4783116, 1.54507, -0.129392, 1, 0, 0, 1, 1,
0.4873148, 0.221699, 1.584688, 1, 0, 0, 1, 1,
0.4879364, -1.064313, 4.504519, 1, 0, 0, 1, 1,
0.4921636, -0.8747113, 1.617894, 1, 0, 0, 1, 1,
0.4948613, 0.4292946, 0.9114898, 0, 0, 0, 1, 1,
0.498412, -0.1584279, 2.510036, 0, 0, 0, 1, 1,
0.4998457, -2.239233, 1.349112, 0, 0, 0, 1, 1,
0.5032306, -1.084834, 2.554394, 0, 0, 0, 1, 1,
0.5048267, -0.04733683, 0.08653293, 0, 0, 0, 1, 1,
0.5068573, 0.8534776, -0.7192147, 0, 0, 0, 1, 1,
0.5108142, 0.2456718, 0.6554165, 0, 0, 0, 1, 1,
0.5134737, 0.6496767, 1.040086, 1, 1, 1, 1, 1,
0.5159246, -2.520965, 2.122821, 1, 1, 1, 1, 1,
0.5182584, 1.11473, 0.07186694, 1, 1, 1, 1, 1,
0.519184, -0.4686069, 1.811933, 1, 1, 1, 1, 1,
0.5210795, 0.1037382, 1.646888, 1, 1, 1, 1, 1,
0.5218642, -1.356071, 1.081792, 1, 1, 1, 1, 1,
0.5235979, 1.600436, 1.019745, 1, 1, 1, 1, 1,
0.5238532, -1.215645, 1.326676, 1, 1, 1, 1, 1,
0.5247642, 0.7127739, -1.106796, 1, 1, 1, 1, 1,
0.5250298, 1.164493, 0.6604491, 1, 1, 1, 1, 1,
0.5286496, 0.1889164, -0.4037628, 1, 1, 1, 1, 1,
0.5303668, -0.6635987, 1.205609, 1, 1, 1, 1, 1,
0.5400318, 0.03301005, 1.617566, 1, 1, 1, 1, 1,
0.5402705, 0.1714064, 0.771657, 1, 1, 1, 1, 1,
0.5429021, 0.8344479, 1.630596, 1, 1, 1, 1, 1,
0.5447485, -2.633765, 4.158821, 0, 0, 1, 1, 1,
0.5485482, 0.3763521, -1.084603, 1, 0, 0, 1, 1,
0.549374, 0.4181419, 0.9945548, 1, 0, 0, 1, 1,
0.549544, -1.766734, 3.017808, 1, 0, 0, 1, 1,
0.5500159, 2.449334, -1.032877, 1, 0, 0, 1, 1,
0.5566748, 0.2094788, 0.9793824, 1, 0, 0, 1, 1,
0.5571092, -0.3952498, 2.619261, 0, 0, 0, 1, 1,
0.559208, -1.357137, 2.977435, 0, 0, 0, 1, 1,
0.5599169, -0.6507387, 2.744222, 0, 0, 0, 1, 1,
0.5683621, -0.3874375, 0.2953757, 0, 0, 0, 1, 1,
0.5689665, -1.781597, 1.626645, 0, 0, 0, 1, 1,
0.5698078, -0.4013196, 2.29329, 0, 0, 0, 1, 1,
0.5789706, -1.291498, 3.537357, 0, 0, 0, 1, 1,
0.5814754, 0.8957407, -0.3819047, 1, 1, 1, 1, 1,
0.5845392, 0.4190791, 1.309012, 1, 1, 1, 1, 1,
0.5860919, 2.013896, 0.6760282, 1, 1, 1, 1, 1,
0.5942798, 1.081555, -0.1174785, 1, 1, 1, 1, 1,
0.5981067, -0.2357786, 1.219529, 1, 1, 1, 1, 1,
0.6064484, 0.5524006, 0.7519696, 1, 1, 1, 1, 1,
0.6121247, 0.5999099, -0.6555535, 1, 1, 1, 1, 1,
0.6144301, 0.4362769, 0.1968246, 1, 1, 1, 1, 1,
0.6150724, 0.5895299, 2.10625, 1, 1, 1, 1, 1,
0.6156338, 1.640566, 1.301052, 1, 1, 1, 1, 1,
0.6174204, 0.1102668, 2.620249, 1, 1, 1, 1, 1,
0.6203216, -0.7471994, 4.15518, 1, 1, 1, 1, 1,
0.6230236, -1.187033, 2.953887, 1, 1, 1, 1, 1,
0.6313246, -0.5444837, 1.559651, 1, 1, 1, 1, 1,
0.6358397, 2.697641, 0.2045483, 1, 1, 1, 1, 1,
0.6358654, 2.935437, -0.2796129, 0, 0, 1, 1, 1,
0.637566, -0.2327709, 2.655626, 1, 0, 0, 1, 1,
0.6382506, 0.1361754, 1.093188, 1, 0, 0, 1, 1,
0.6416284, -0.2038497, 1.036629, 1, 0, 0, 1, 1,
0.6421271, -2.247925, 0.9785297, 1, 0, 0, 1, 1,
0.6440513, 1.408255, -0.5995395, 1, 0, 0, 1, 1,
0.645164, -0.2901669, 1.57671, 0, 0, 0, 1, 1,
0.6456432, -1.048856, 2.098161, 0, 0, 0, 1, 1,
0.6494138, 0.4764221, 1.261918, 0, 0, 0, 1, 1,
0.6525095, 0.568238, 0.2955161, 0, 0, 0, 1, 1,
0.6557288, -0.751305, 1.416458, 0, 0, 0, 1, 1,
0.6594862, 2.130306, 1.259667, 0, 0, 0, 1, 1,
0.6627914, -0.236618, 3.930074, 0, 0, 0, 1, 1,
0.6653739, -0.4836505, 3.199239, 1, 1, 1, 1, 1,
0.6659029, 0.9728388, 0.3216698, 1, 1, 1, 1, 1,
0.668613, -0.6444804, 2.856757, 1, 1, 1, 1, 1,
0.6769866, 0.9769703, 1.253531, 1, 1, 1, 1, 1,
0.6777114, -0.8800768, 2.401954, 1, 1, 1, 1, 1,
0.6897002, -0.001200384, 1.072957, 1, 1, 1, 1, 1,
0.6941626, 0.02387317, 0.3798994, 1, 1, 1, 1, 1,
0.6975844, -0.001972988, 1.061613, 1, 1, 1, 1, 1,
0.7022356, 1.435264, 1.650879, 1, 1, 1, 1, 1,
0.7040629, 0.537496, 1.07181, 1, 1, 1, 1, 1,
0.7053924, -1.126592, 3.223082, 1, 1, 1, 1, 1,
0.7098692, -0.6670092, 3.493458, 1, 1, 1, 1, 1,
0.7146382, -0.04996772, 1.152591, 1, 1, 1, 1, 1,
0.7158343, 2.036933, -0.6319583, 1, 1, 1, 1, 1,
0.7167665, -0.5765417, 1.0418, 1, 1, 1, 1, 1,
0.7181132, 2.817714, -0.5350382, 0, 0, 1, 1, 1,
0.7202176, -0.3782752, 0.491406, 1, 0, 0, 1, 1,
0.7220367, 1.627172, -0.2657776, 1, 0, 0, 1, 1,
0.7229701, 1.666481, 0.3240165, 1, 0, 0, 1, 1,
0.7293314, 1.685596, 0.869499, 1, 0, 0, 1, 1,
0.7361904, 1.502754, 0.8238664, 1, 0, 0, 1, 1,
0.7369731, 0.1873735, 1.301483, 0, 0, 0, 1, 1,
0.7374277, 2.03384, 0.8033581, 0, 0, 0, 1, 1,
0.737505, 0.5172772, 1.299383, 0, 0, 0, 1, 1,
0.7392387, -1.139776, 2.218566, 0, 0, 0, 1, 1,
0.7524907, 0.6451762, 1.004327, 0, 0, 0, 1, 1,
0.7531619, -2.726261, 1.995655, 0, 0, 0, 1, 1,
0.7574497, 0.2700286, -0.1671084, 0, 0, 0, 1, 1,
0.7576885, -1.301193, 3.506872, 1, 1, 1, 1, 1,
0.7614205, -0.2470013, 1.612793, 1, 1, 1, 1, 1,
0.7619269, -2.259629, 3.26369, 1, 1, 1, 1, 1,
0.7642424, 0.7643322, 1.04067, 1, 1, 1, 1, 1,
0.7669038, 2.070289, 0.8212334, 1, 1, 1, 1, 1,
0.7671099, 0.686672, -1.112825, 1, 1, 1, 1, 1,
0.7741495, 0.5322818, 1.216321, 1, 1, 1, 1, 1,
0.7745917, -0.04590685, 0.3651905, 1, 1, 1, 1, 1,
0.7820188, -0.9863456, 2.297695, 1, 1, 1, 1, 1,
0.785457, -0.6419557, 1.493936, 1, 1, 1, 1, 1,
0.7861192, -0.2488364, 2.110135, 1, 1, 1, 1, 1,
0.7867167, 0.3210658, -0.433816, 1, 1, 1, 1, 1,
0.788165, -1.051536, 3.080214, 1, 1, 1, 1, 1,
0.7900707, 0.04838495, 1.189304, 1, 1, 1, 1, 1,
0.8024976, -1.429814, 1.280199, 1, 1, 1, 1, 1,
0.8027351, -0.3696987, 1.069448, 0, 0, 1, 1, 1,
0.8028293, -0.6156095, 2.682144, 1, 0, 0, 1, 1,
0.8041254, -0.4718757, 2.18492, 1, 0, 0, 1, 1,
0.8107566, -0.2624547, 1.236275, 1, 0, 0, 1, 1,
0.8126829, 0.3170381, 0.6313174, 1, 0, 0, 1, 1,
0.8154656, -0.7427355, 2.988846, 1, 0, 0, 1, 1,
0.8195207, 0.9327157, 1.221875, 0, 0, 0, 1, 1,
0.8203862, -0.1062955, 1.821752, 0, 0, 0, 1, 1,
0.8205679, 0.2201952, 1.355475, 0, 0, 0, 1, 1,
0.8264971, 1.431968, 1.843061, 0, 0, 0, 1, 1,
0.8282744, -0.2037377, 3.187967, 0, 0, 0, 1, 1,
0.8321334, -0.9373207, 1.707635, 0, 0, 0, 1, 1,
0.8351135, 1.0049, 1.975158, 0, 0, 0, 1, 1,
0.83971, 0.1427025, 2.25003, 1, 1, 1, 1, 1,
0.8416383, 0.5842546, 0.6532342, 1, 1, 1, 1, 1,
0.843881, 1.288216, 1.8441, 1, 1, 1, 1, 1,
0.8443266, 1.503224, -0.4373748, 1, 1, 1, 1, 1,
0.8449712, 2.446336, 2.715922, 1, 1, 1, 1, 1,
0.8467001, 1.707189, 0.4608618, 1, 1, 1, 1, 1,
0.8481663, -0.02455085, 1.948252, 1, 1, 1, 1, 1,
0.851371, 0.4700266, -0.5955074, 1, 1, 1, 1, 1,
0.851392, -0.1749379, 2.21872, 1, 1, 1, 1, 1,
0.8602446, 0.206607, 1.976514, 1, 1, 1, 1, 1,
0.8642484, -0.6079802, 0.05513719, 1, 1, 1, 1, 1,
0.8709278, -1.900294, 2.483973, 1, 1, 1, 1, 1,
0.8782003, 0.1005581, -0.08417384, 1, 1, 1, 1, 1,
0.8884053, 0.2832565, 0.997775, 1, 1, 1, 1, 1,
0.8914302, 0.5430727, 1.122293, 1, 1, 1, 1, 1,
0.8917451, 0.2683798, 2.537696, 0, 0, 1, 1, 1,
0.8928258, -1.560447, 1.988814, 1, 0, 0, 1, 1,
0.8977298, 0.5392242, 0.6069542, 1, 0, 0, 1, 1,
0.8981894, -0.5511079, 3.018451, 1, 0, 0, 1, 1,
0.9015263, 0.2789885, 0.8747864, 1, 0, 0, 1, 1,
0.9019112, 1.421391, 0.9819115, 1, 0, 0, 1, 1,
0.9020811, -0.2079963, 1.434059, 0, 0, 0, 1, 1,
0.9091728, 1.062399, 1.527479, 0, 0, 0, 1, 1,
0.9107711, -0.2744199, 4.130912, 0, 0, 0, 1, 1,
0.912718, -1.958032, 4.432647, 0, 0, 0, 1, 1,
0.9208603, -0.01314535, 1.656276, 0, 0, 0, 1, 1,
0.9260533, 0.2167481, 3.15999, 0, 0, 0, 1, 1,
0.9267324, 0.6138104, 2.187271, 0, 0, 0, 1, 1,
0.9287638, -0.3465819, 0.2462751, 1, 1, 1, 1, 1,
0.9334943, -0.2071782, 1.323322, 1, 1, 1, 1, 1,
0.9338192, 0.09789053, 2.079736, 1, 1, 1, 1, 1,
0.9384021, -0.940916, 1.26256, 1, 1, 1, 1, 1,
0.9418682, 0.9045467, 0.430309, 1, 1, 1, 1, 1,
0.9526013, 1.525703, 0.1963215, 1, 1, 1, 1, 1,
0.9662831, 1.529193, 0.8397426, 1, 1, 1, 1, 1,
0.9675881, -0.1582533, 2.09464, 1, 1, 1, 1, 1,
0.975942, 2.114232, 0.8435975, 1, 1, 1, 1, 1,
0.9781379, 0.0820692, 0.8724451, 1, 1, 1, 1, 1,
0.9792221, -0.2987089, 2.795465, 1, 1, 1, 1, 1,
0.9842469, -0.5002389, 3.174261, 1, 1, 1, 1, 1,
0.9879447, 0.8280935, 0.2001241, 1, 1, 1, 1, 1,
0.9965386, 1.076303, -1.187679, 1, 1, 1, 1, 1,
0.9990966, -0.1344641, 0.939844, 1, 1, 1, 1, 1,
1.002135, 0.009579795, 0.8492853, 0, 0, 1, 1, 1,
1.012262, -0.8336741, 1.248276, 1, 0, 0, 1, 1,
1.01337, 0.6919813, 1.120108, 1, 0, 0, 1, 1,
1.027689, 0.7503077, 1.105891, 1, 0, 0, 1, 1,
1.030696, 1.554609, 0.961178, 1, 0, 0, 1, 1,
1.030848, 1.215336, 0.129318, 1, 0, 0, 1, 1,
1.03227, 0.08653824, -0.1401626, 0, 0, 0, 1, 1,
1.034277, -0.7760619, 3.109231, 0, 0, 0, 1, 1,
1.036739, 1.508977, 0.3083034, 0, 0, 0, 1, 1,
1.03977, -1.465469, 2.88029, 0, 0, 0, 1, 1,
1.042422, -0.1257994, 2.177069, 0, 0, 0, 1, 1,
1.047391, -0.2280463, 2.338436, 0, 0, 0, 1, 1,
1.06155, -0.6255899, 1.350123, 0, 0, 0, 1, 1,
1.071023, 0.01265992, 1.634539, 1, 1, 1, 1, 1,
1.075589, 1.207, 1.836606, 1, 1, 1, 1, 1,
1.076596, 1.48474, 1.7728, 1, 1, 1, 1, 1,
1.077896, -1.323915, 3.020757, 1, 1, 1, 1, 1,
1.087303, 1.470303, -0.1368239, 1, 1, 1, 1, 1,
1.089964, 0.3828726, 0.5363533, 1, 1, 1, 1, 1,
1.100829, -0.299366, 2.452943, 1, 1, 1, 1, 1,
1.10269, -0.7923269, 2.56559, 1, 1, 1, 1, 1,
1.107672, -0.6511325, 4.105572, 1, 1, 1, 1, 1,
1.10814, -0.4020271, 1.009742, 1, 1, 1, 1, 1,
1.112912, 0.3174265, 2.398399, 1, 1, 1, 1, 1,
1.113376, -0.3269068, 1.067266, 1, 1, 1, 1, 1,
1.11461, 2.458283, -0.0437745, 1, 1, 1, 1, 1,
1.13944, -1.39263, 2.717926, 1, 1, 1, 1, 1,
1.146263, 0.1017592, 2.600514, 1, 1, 1, 1, 1,
1.147844, 2.04103, 0.6821491, 0, 0, 1, 1, 1,
1.154515, 0.2716193, 2.318017, 1, 0, 0, 1, 1,
1.15673, -0.573873, 2.839548, 1, 0, 0, 1, 1,
1.159618, 0.2893743, -0.281893, 1, 0, 0, 1, 1,
1.172446, 0.677195, 3.011868, 1, 0, 0, 1, 1,
1.178248, 0.2831307, 1.068498, 1, 0, 0, 1, 1,
1.190609, 0.8024697, 0.1989943, 0, 0, 0, 1, 1,
1.190812, 1.115023, 0.8661923, 0, 0, 0, 1, 1,
1.194787, -0.6901597, 0.5944136, 0, 0, 0, 1, 1,
1.197322, -0.2062066, 2.020196, 0, 0, 0, 1, 1,
1.199757, -0.7744972, 2.656365, 0, 0, 0, 1, 1,
1.200738, 0.4549786, -0.3975874, 0, 0, 0, 1, 1,
1.202353, 0.08354305, 1.69366, 0, 0, 0, 1, 1,
1.202448, 0.4075448, 1.887048, 1, 1, 1, 1, 1,
1.208597, -0.9760094, 2.378275, 1, 1, 1, 1, 1,
1.211561, 0.1250495, 0.429051, 1, 1, 1, 1, 1,
1.213114, 1.060209, 0.01910861, 1, 1, 1, 1, 1,
1.216478, 0.2661445, 1.698812, 1, 1, 1, 1, 1,
1.21884, 0.8925049, 2.151315, 1, 1, 1, 1, 1,
1.219115, -0.3902728, -0.08860614, 1, 1, 1, 1, 1,
1.221332, 0.7932329, 1.732687, 1, 1, 1, 1, 1,
1.236753, 1.507839, 0.01300235, 1, 1, 1, 1, 1,
1.244595, -1.509288, 2.975408, 1, 1, 1, 1, 1,
1.245385, -1.072569, 2.838317, 1, 1, 1, 1, 1,
1.253334, 0.4557714, -0.6635692, 1, 1, 1, 1, 1,
1.263197, 1.93696, -0.430168, 1, 1, 1, 1, 1,
1.269956, -0.1679292, 1.683869, 1, 1, 1, 1, 1,
1.276146, 0.2835833, 1.651638, 1, 1, 1, 1, 1,
1.278476, -0.7218181, 4.780572, 0, 0, 1, 1, 1,
1.278637, -0.45171, 2.078775, 1, 0, 0, 1, 1,
1.279604, -1.045892, 1.284509, 1, 0, 0, 1, 1,
1.285976, 0.2081869, 1.076813, 1, 0, 0, 1, 1,
1.29718, 0.5049826, 2.587328, 1, 0, 0, 1, 1,
1.302747, -0.810402, 0.4314528, 1, 0, 0, 1, 1,
1.304544, -0.472816, 2.95196, 0, 0, 0, 1, 1,
1.305238, -2.013853, 5.496496, 0, 0, 0, 1, 1,
1.307931, -0.7063494, 2.117631, 0, 0, 0, 1, 1,
1.310064, 1.267274, 0.4693205, 0, 0, 0, 1, 1,
1.313828, 0.414868, 1.88547, 0, 0, 0, 1, 1,
1.318112, 0.985081, 1.612596, 0, 0, 0, 1, 1,
1.323078, 0.2156025, -0.1031967, 0, 0, 0, 1, 1,
1.327278, -0.752669, 1.117427, 1, 1, 1, 1, 1,
1.327376, 0.2120529, 1.410859, 1, 1, 1, 1, 1,
1.332182, -0.2153283, 1.47383, 1, 1, 1, 1, 1,
1.348609, -0.7016526, 1.831877, 1, 1, 1, 1, 1,
1.350125, 1.023423, 0.2672242, 1, 1, 1, 1, 1,
1.356099, 0.006137725, 0.999167, 1, 1, 1, 1, 1,
1.373301, -0.261875, 1.708616, 1, 1, 1, 1, 1,
1.37718, 0.2616145, 1.818514, 1, 1, 1, 1, 1,
1.379577, -0.7015908, 1.407483, 1, 1, 1, 1, 1,
1.383694, -1.425833, 4.398129, 1, 1, 1, 1, 1,
1.388004, -1.268769, 2.079288, 1, 1, 1, 1, 1,
1.394971, 0.5583372, 2.616669, 1, 1, 1, 1, 1,
1.402534, -1.461899, 3.229702, 1, 1, 1, 1, 1,
1.40814, -2.47629, 2.305932, 1, 1, 1, 1, 1,
1.409564, 0.7342316, 1.686827, 1, 1, 1, 1, 1,
1.427774, -0.2129441, -0.3038551, 0, 0, 1, 1, 1,
1.428569, -0.6088893, 1.479627, 1, 0, 0, 1, 1,
1.43355, 0.4214751, 1.982732, 1, 0, 0, 1, 1,
1.440784, -0.7480577, 0.9123308, 1, 0, 0, 1, 1,
1.443805, -2.304344, 1.475766, 1, 0, 0, 1, 1,
1.444636, 0.4795881, 1.918402, 1, 0, 0, 1, 1,
1.445205, -1.38958, 0.2631735, 0, 0, 0, 1, 1,
1.451826, 0.672396, 2.352534, 0, 0, 0, 1, 1,
1.453418, -0.3092712, 3.06998, 0, 0, 0, 1, 1,
1.468338, -2.170027, 4.444047, 0, 0, 0, 1, 1,
1.481119, 0.2117809, 2.246676, 0, 0, 0, 1, 1,
1.481814, 0.06812819, 2.097671, 0, 0, 0, 1, 1,
1.48205, -0.8717812, 1.506931, 0, 0, 0, 1, 1,
1.493346, 1.272057, 0.1801926, 1, 1, 1, 1, 1,
1.503134, -1.178836, 0.8286186, 1, 1, 1, 1, 1,
1.549414, 1.271155, 2.701782, 1, 1, 1, 1, 1,
1.576377, 0.9419435, -0.08565813, 1, 1, 1, 1, 1,
1.587723, 0.8077865, 0.8480476, 1, 1, 1, 1, 1,
1.602772, 1.233142, 2.58905, 1, 1, 1, 1, 1,
1.603941, -0.2507164, 0.5355139, 1, 1, 1, 1, 1,
1.60538, 0.5257866, 1.396558, 1, 1, 1, 1, 1,
1.608572, -0.5525468, 1.351327, 1, 1, 1, 1, 1,
1.628364, 0.931269, 1.827048, 1, 1, 1, 1, 1,
1.631449, 0.7400023, 3.296189, 1, 1, 1, 1, 1,
1.63262, -0.1427101, 0.9954203, 1, 1, 1, 1, 1,
1.637456, 0.1876215, 0.3148334, 1, 1, 1, 1, 1,
1.638645, -0.7250464, 2.344883, 1, 1, 1, 1, 1,
1.649286, -0.2808459, 2.586175, 1, 1, 1, 1, 1,
1.654763, -0.03235322, 0.9126356, 0, 0, 1, 1, 1,
1.657881, 0.295914, -1.188218, 1, 0, 0, 1, 1,
1.676255, -1.404381, 3.387747, 1, 0, 0, 1, 1,
1.692922, -0.3611183, 0.7512702, 1, 0, 0, 1, 1,
1.696491, -0.1631549, 0.452499, 1, 0, 0, 1, 1,
1.703556, 0.006951275, 2.389731, 1, 0, 0, 1, 1,
1.713568, -0.833088, 2.789883, 0, 0, 0, 1, 1,
1.713907, -0.3726943, 2.697956, 0, 0, 0, 1, 1,
1.714537, -0.02525361, 1.774595, 0, 0, 0, 1, 1,
1.722335, -0.8675874, 1.809509, 0, 0, 0, 1, 1,
1.742993, 0.9480065, 1.02594, 0, 0, 0, 1, 1,
1.850607, 0.4267771, 4.458913, 0, 0, 0, 1, 1,
1.854265, 1.395869, 0.9282311, 0, 0, 0, 1, 1,
1.86038, -0.4528457, 2.717953, 1, 1, 1, 1, 1,
1.877387, 1.095859, 1.215359, 1, 1, 1, 1, 1,
1.87746, 0.5605711, 1.409757, 1, 1, 1, 1, 1,
1.890635, -0.5419561, -0.1771892, 1, 1, 1, 1, 1,
1.924139, -0.8821254, 2.297314, 1, 1, 1, 1, 1,
1.930768, 1.055477, -0.1253347, 1, 1, 1, 1, 1,
1.941918, 0.1282171, 1.690384, 1, 1, 1, 1, 1,
1.942944, 0.2604913, 2.109146, 1, 1, 1, 1, 1,
1.957293, 1.169839, 0.1942484, 1, 1, 1, 1, 1,
1.968116, 0.3199363, 1.497138, 1, 1, 1, 1, 1,
1.978969, 1.090713, 0.4763288, 1, 1, 1, 1, 1,
1.987158, 0.1631321, 0.3853101, 1, 1, 1, 1, 1,
1.994285, 1.254204, 2.099519, 1, 1, 1, 1, 1,
2.018762, 1.398277, 2.272149, 1, 1, 1, 1, 1,
2.053362, 1.785133, -0.3928623, 1, 1, 1, 1, 1,
2.060761, -0.9478719, 3.858066, 0, 0, 1, 1, 1,
2.067147, 1.051145, 2.811221, 1, 0, 0, 1, 1,
2.097461, -2.368474, 2.973808, 1, 0, 0, 1, 1,
2.117272, 0.1604132, 1.351911, 1, 0, 0, 1, 1,
2.126055, -0.8171399, 1.862969, 1, 0, 0, 1, 1,
2.191537, 0.1729472, 4.401666, 1, 0, 0, 1, 1,
2.208712, 0.1118017, 1.857761, 0, 0, 0, 1, 1,
2.232592, -0.6109319, 2.065159, 0, 0, 0, 1, 1,
2.238755, 0.8322013, 1.620705, 0, 0, 0, 1, 1,
2.241832, 0.6636045, 2.826361, 0, 0, 0, 1, 1,
2.251578, 0.100739, 1.64865, 0, 0, 0, 1, 1,
2.273681, -0.4916915, 3.109407, 0, 0, 0, 1, 1,
2.287279, -0.652707, 1.955612, 0, 0, 0, 1, 1,
2.32434, 0.6624959, 1.970369, 1, 1, 1, 1, 1,
2.366544, -1.221213, 2.107882, 1, 1, 1, 1, 1,
2.471333, -0.1199744, 3.005331, 1, 1, 1, 1, 1,
2.497279, 0.1264326, 2.873688, 1, 1, 1, 1, 1,
2.664143, -0.6789127, 2.677489, 1, 1, 1, 1, 1,
2.879482, 0.8312132, 1.076629, 1, 1, 1, 1, 1,
3.143428, 1.337834, 0.5581177, 1, 1, 1, 1, 1
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
var radius = 9.642518;
var distance = 33.86893;
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
mvMatrix.translate( 0.2069752, 0.2642912, -0.1500235 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.86893);
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
