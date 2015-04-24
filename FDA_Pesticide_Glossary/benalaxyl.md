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
-3.042942, 1.546056, -0.9439585, 1, 0, 0, 1,
-2.747479, 1.398253, -0.3344444, 1, 0.007843138, 0, 1,
-2.61169, 0.006829132, 0.02123578, 1, 0.01176471, 0, 1,
-2.610763, -0.01682086, -1.100662, 1, 0.01960784, 0, 1,
-2.609812, 0.02439898, -1.697569, 1, 0.02352941, 0, 1,
-2.538727, -0.5853643, -1.049457, 1, 0.03137255, 0, 1,
-2.483032, -0.1964199, -2.330918, 1, 0.03529412, 0, 1,
-2.431335, 0.508954, -2.313116, 1, 0.04313726, 0, 1,
-2.424779, 0.7530705, -2.726785, 1, 0.04705882, 0, 1,
-2.395348, 0.3426921, -2.62116, 1, 0.05490196, 0, 1,
-2.270533, 0.4310509, -0.6858689, 1, 0.05882353, 0, 1,
-2.262334, 0.1475752, -2.00499, 1, 0.06666667, 0, 1,
-2.253363, -0.04593299, -1.870123, 1, 0.07058824, 0, 1,
-2.24635, -1.015769, -3.760365, 1, 0.07843138, 0, 1,
-2.195508, 1.008848, -2.131235, 1, 0.08235294, 0, 1,
-2.176456, -0.2483101, -1.142628, 1, 0.09019608, 0, 1,
-2.141512, -0.2892448, -2.487802, 1, 0.09411765, 0, 1,
-2.106365, 0.6592396, -1.006371, 1, 0.1019608, 0, 1,
-2.096353, 2.30268, -1.889806, 1, 0.1098039, 0, 1,
-2.090736, -1.142625, -2.835127, 1, 0.1137255, 0, 1,
-2.038689, 0.3793052, -1.436772, 1, 0.1215686, 0, 1,
-2.023385, 1.17217, 0.1667677, 1, 0.1254902, 0, 1,
-2.010019, 0.3221816, -1.296614, 1, 0.1333333, 0, 1,
-1.98238, -2.586969, -4.516671, 1, 0.1372549, 0, 1,
-1.963194, -0.4200639, -2.415637, 1, 0.145098, 0, 1,
-1.961719, 0.6704222, -2.210969, 1, 0.1490196, 0, 1,
-1.95076, -0.03535657, -2.290147, 1, 0.1568628, 0, 1,
-1.943658, -0.3140768, -1.553845, 1, 0.1607843, 0, 1,
-1.939451, -0.1213033, -0.5638313, 1, 0.1686275, 0, 1,
-1.877882, 0.1688152, -1.532947, 1, 0.172549, 0, 1,
-1.868283, -0.2486732, -2.008971, 1, 0.1803922, 0, 1,
-1.867645, 1.822526, -1.093281, 1, 0.1843137, 0, 1,
-1.859449, -0.1900056, -0.9504341, 1, 0.1921569, 0, 1,
-1.853742, -0.2009096, -0.8829186, 1, 0.1960784, 0, 1,
-1.840827, -0.8656626, -2.383154, 1, 0.2039216, 0, 1,
-1.815255, 0.634082, -1.507681, 1, 0.2117647, 0, 1,
-1.807251, 0.3978941, -0.3565184, 1, 0.2156863, 0, 1,
-1.805499, 0.8787651, 1.164328, 1, 0.2235294, 0, 1,
-1.797773, 0.3919241, 0.9398239, 1, 0.227451, 0, 1,
-1.785768, 0.7106061, -0.5353664, 1, 0.2352941, 0, 1,
-1.783792, 0.1117882, -1.90098, 1, 0.2392157, 0, 1,
-1.779379, -0.4980941, -2.645844, 1, 0.2470588, 0, 1,
-1.778707, -1.402567, -3.37503, 1, 0.2509804, 0, 1,
-1.773826, 1.288323, 1.328998, 1, 0.2588235, 0, 1,
-1.758665, -1.579656, -2.649661, 1, 0.2627451, 0, 1,
-1.74851, 0.01073875, -1.988189, 1, 0.2705882, 0, 1,
-1.740313, 0.08956563, -1.231465, 1, 0.2745098, 0, 1,
-1.685385, -0.500447, -2.896457, 1, 0.282353, 0, 1,
-1.678718, 1.563479, -1.004805, 1, 0.2862745, 0, 1,
-1.678383, -0.7375964, -0.9276845, 1, 0.2941177, 0, 1,
-1.663819, 2.054228, -0.05437153, 1, 0.3019608, 0, 1,
-1.660626, -0.7306063, -1.368046, 1, 0.3058824, 0, 1,
-1.657558, 0.3550234, -0.7692253, 1, 0.3137255, 0, 1,
-1.640706, -1.241704, -2.880008, 1, 0.3176471, 0, 1,
-1.636341, 0.5379938, -1.367617, 1, 0.3254902, 0, 1,
-1.62822, -1.110904, -3.153203, 1, 0.3294118, 0, 1,
-1.625308, -0.9542556, -2.20081, 1, 0.3372549, 0, 1,
-1.618053, 0.9687282, -0.5585602, 1, 0.3411765, 0, 1,
-1.595731, 0.456856, -0.4908555, 1, 0.3490196, 0, 1,
-1.577302, 0.4346359, -2.435943, 1, 0.3529412, 0, 1,
-1.5761, -0.03301569, -0.2053205, 1, 0.3607843, 0, 1,
-1.574724, 1.948868, 0.08921188, 1, 0.3647059, 0, 1,
-1.566113, 0.4393479, -2.519372, 1, 0.372549, 0, 1,
-1.545011, 0.3620725, -0.238476, 1, 0.3764706, 0, 1,
-1.537853, 1.230062, -1.811663, 1, 0.3843137, 0, 1,
-1.507713, -0.4297625, -4.958639, 1, 0.3882353, 0, 1,
-1.501548, 0.3765525, -2.199803, 1, 0.3960784, 0, 1,
-1.493988, 0.694319, -1.023247, 1, 0.4039216, 0, 1,
-1.493533, -0.3382301, -0.1216933, 1, 0.4078431, 0, 1,
-1.491415, -1.753287, -3.384751, 1, 0.4156863, 0, 1,
-1.486976, -0.4692346, -1.771187, 1, 0.4196078, 0, 1,
-1.477403, -1.12005, -1.684789, 1, 0.427451, 0, 1,
-1.469097, -0.108669, -3.007538, 1, 0.4313726, 0, 1,
-1.46695, 1.430532, -1.4616, 1, 0.4392157, 0, 1,
-1.450941, -0.726583, -1.99609, 1, 0.4431373, 0, 1,
-1.420637, -1.799877, -2.818578, 1, 0.4509804, 0, 1,
-1.417551, -0.5020176, -2.270136, 1, 0.454902, 0, 1,
-1.410159, -0.9487594, -2.342069, 1, 0.4627451, 0, 1,
-1.401222, -0.5855264, -2.091698, 1, 0.4666667, 0, 1,
-1.392177, -0.5476396, -1.88889, 1, 0.4745098, 0, 1,
-1.383604, 1.513724, -1.06169, 1, 0.4784314, 0, 1,
-1.369164, 0.3073646, -0.5667338, 1, 0.4862745, 0, 1,
-1.359624, 0.4276597, -2.862021, 1, 0.4901961, 0, 1,
-1.356653, 0.9588394, -0.1183645, 1, 0.4980392, 0, 1,
-1.352908, -0.2754481, -0.6233489, 1, 0.5058824, 0, 1,
-1.350072, -0.1764986, -1.939741, 1, 0.509804, 0, 1,
-1.348636, 0.1344381, -1.083597, 1, 0.5176471, 0, 1,
-1.343411, -0.5874783, -2.614478, 1, 0.5215687, 0, 1,
-1.341145, -0.1961267, -2.796475, 1, 0.5294118, 0, 1,
-1.335905, -1.8131, -2.45618, 1, 0.5333334, 0, 1,
-1.331949, 0.7100504, -1.452778, 1, 0.5411765, 0, 1,
-1.306323, 0.3363953, -0.9962947, 1, 0.5450981, 0, 1,
-1.278154, -0.5128909, -2.694494, 1, 0.5529412, 0, 1,
-1.274263, 0.01309317, -1.639791, 1, 0.5568628, 0, 1,
-1.270564, -0.481196, -0.5941231, 1, 0.5647059, 0, 1,
-1.270301, -0.06934398, -0.6525029, 1, 0.5686275, 0, 1,
-1.267366, 1.723079, -0.04712094, 1, 0.5764706, 0, 1,
-1.258271, 1.075001, -1.357279, 1, 0.5803922, 0, 1,
-1.25704, 0.7666193, 0.7530576, 1, 0.5882353, 0, 1,
-1.254919, 0.3552927, -1.240512, 1, 0.5921569, 0, 1,
-1.250157, -1.18236, -1.498665, 1, 0.6, 0, 1,
-1.24692, 1.225455, -2.243833, 1, 0.6078432, 0, 1,
-1.245614, 0.3642295, -0.8161018, 1, 0.6117647, 0, 1,
-1.243417, 2.038318, -2.16377, 1, 0.6196079, 0, 1,
-1.24169, -0.4092172, -1.328054, 1, 0.6235294, 0, 1,
-1.237884, 0.2587664, -3.044239, 1, 0.6313726, 0, 1,
-1.235852, 1.30064, -2.350595, 1, 0.6352941, 0, 1,
-1.230175, 0.7593855, -1.043246, 1, 0.6431373, 0, 1,
-1.216763, -0.006476319, -1.531735, 1, 0.6470588, 0, 1,
-1.206016, -0.4434974, -1.500011, 1, 0.654902, 0, 1,
-1.196394, 1.506149, -0.6963159, 1, 0.6588235, 0, 1,
-1.19492, -0.05329507, -2.392911, 1, 0.6666667, 0, 1,
-1.194883, 0.7345572, -1.797234, 1, 0.6705883, 0, 1,
-1.190607, -2.424826, -3.826271, 1, 0.6784314, 0, 1,
-1.177822, -0.9633209, -3.06168, 1, 0.682353, 0, 1,
-1.170668, 0.0291835, -1.080965, 1, 0.6901961, 0, 1,
-1.167259, 0.852966, -1.34029, 1, 0.6941177, 0, 1,
-1.166072, 0.840616, 0.2936098, 1, 0.7019608, 0, 1,
-1.161655, -0.5351628, -2.082304, 1, 0.7098039, 0, 1,
-1.160634, 1.022067, -0.8631452, 1, 0.7137255, 0, 1,
-1.154995, 0.2203773, -1.93349, 1, 0.7215686, 0, 1,
-1.153566, 0.6358097, -2.061735, 1, 0.7254902, 0, 1,
-1.145246, 0.8407392, -0.1510319, 1, 0.7333333, 0, 1,
-1.142436, 0.321287, -2.556155, 1, 0.7372549, 0, 1,
-1.142136, -1.151578, -2.586988, 1, 0.7450981, 0, 1,
-1.140351, -0.1537337, -0.3741748, 1, 0.7490196, 0, 1,
-1.138972, 1.314999, -0.8696128, 1, 0.7568628, 0, 1,
-1.138837, -0.265597, -1.302452, 1, 0.7607843, 0, 1,
-1.134311, 1.624557, -2.357912, 1, 0.7686275, 0, 1,
-1.120508, -1.003766, -3.502434, 1, 0.772549, 0, 1,
-1.116962, -0.9602179, -0.2488074, 1, 0.7803922, 0, 1,
-1.107699, -0.3747719, -2.304552, 1, 0.7843137, 0, 1,
-1.101109, 0.4954818, -2.83417, 1, 0.7921569, 0, 1,
-1.098665, 1.61268, -0.1942509, 1, 0.7960784, 0, 1,
-1.096896, 1.592744, -1.235035, 1, 0.8039216, 0, 1,
-1.096625, 0.6301426, -1.430906, 1, 0.8117647, 0, 1,
-1.095662, -0.02173984, -0.4776201, 1, 0.8156863, 0, 1,
-1.091, -0.4180435, -0.1639863, 1, 0.8235294, 0, 1,
-1.082604, 1.544656, -0.1217579, 1, 0.827451, 0, 1,
-1.070946, -0.1974461, -3.415218, 1, 0.8352941, 0, 1,
-1.069144, 0.395946, -2.192652, 1, 0.8392157, 0, 1,
-1.061097, -2.096712, -3.638946, 1, 0.8470588, 0, 1,
-1.055146, -0.1766527, -0.8816539, 1, 0.8509804, 0, 1,
-1.055021, 0.09388137, 1.191921, 1, 0.8588235, 0, 1,
-1.050207, -0.554244, -2.195725, 1, 0.8627451, 0, 1,
-1.039674, -0.2224985, -1.066389, 1, 0.8705882, 0, 1,
-1.028628, 2.199659, -2.014353, 1, 0.8745098, 0, 1,
-1.02857, -0.7010828, -2.123536, 1, 0.8823529, 0, 1,
-1.021491, 1.684413, -0.4460871, 1, 0.8862745, 0, 1,
-1.019527, 0.3826427, -1.170822, 1, 0.8941177, 0, 1,
-1.019161, 0.06089733, -0.7067882, 1, 0.8980392, 0, 1,
-1.014317, 1.267936, 0.3316184, 1, 0.9058824, 0, 1,
-1.001222, 1.05476, -0.3141211, 1, 0.9137255, 0, 1,
-1.00094, 0.0508632, -0.08689333, 1, 0.9176471, 0, 1,
-0.998457, -0.285015, -0.8030586, 1, 0.9254902, 0, 1,
-0.9974088, 1.728555, -3.831739, 1, 0.9294118, 0, 1,
-0.9967674, -1.262807, -1.635734, 1, 0.9372549, 0, 1,
-0.9966556, -0.5450912, -2.519809, 1, 0.9411765, 0, 1,
-0.9925075, 1.525483, 0.06881955, 1, 0.9490196, 0, 1,
-0.9924403, 1.110923, 1.911136, 1, 0.9529412, 0, 1,
-0.9862983, 0.2446484, -3.334742, 1, 0.9607843, 0, 1,
-0.9833792, -2.149294, -3.057188, 1, 0.9647059, 0, 1,
-0.9695829, -1.226698, -1.389416, 1, 0.972549, 0, 1,
-0.9683643, 1.201409, -1.388878, 1, 0.9764706, 0, 1,
-0.9640802, -0.2908621, -1.723563, 1, 0.9843137, 0, 1,
-0.9622022, 1.091969, -0.2373468, 1, 0.9882353, 0, 1,
-0.9599128, -0.7149617, -3.245527, 1, 0.9960784, 0, 1,
-0.9595406, -1.050762, -2.616947, 0.9960784, 1, 0, 1,
-0.9491191, -0.118612, -1.831761, 0.9921569, 1, 0, 1,
-0.9406425, 0.5657645, -2.951622, 0.9843137, 1, 0, 1,
-0.9404198, -0.2785366, -2.107496, 0.9803922, 1, 0, 1,
-0.917322, -1.431854, -3.121175, 0.972549, 1, 0, 1,
-0.9098117, -0.1020051, -3.154569, 0.9686275, 1, 0, 1,
-0.9050186, -0.7448997, -2.95966, 0.9607843, 1, 0, 1,
-0.9043503, -0.3026881, -0.3994251, 0.9568627, 1, 0, 1,
-0.8993689, 1.161367, 0.04847217, 0.9490196, 1, 0, 1,
-0.8957629, -0.3683778, -0.2185418, 0.945098, 1, 0, 1,
-0.894602, -0.1930031, -3.020885, 0.9372549, 1, 0, 1,
-0.8869122, -0.6674086, -2.743482, 0.9333333, 1, 0, 1,
-0.8773618, -0.1429, -1.345985, 0.9254902, 1, 0, 1,
-0.8730058, 0.1382625, -1.510301, 0.9215686, 1, 0, 1,
-0.8707776, 1.018875, -0.5725982, 0.9137255, 1, 0, 1,
-0.8702911, -1.394418, -3.951652, 0.9098039, 1, 0, 1,
-0.8695196, 0.08803975, -1.733681, 0.9019608, 1, 0, 1,
-0.8681355, -0.751272, -4.297532, 0.8941177, 1, 0, 1,
-0.8561561, -1.387545, -3.630475, 0.8901961, 1, 0, 1,
-0.8539304, 0.2168691, -1.327792, 0.8823529, 1, 0, 1,
-0.8515245, -0.5540451, -1.704065, 0.8784314, 1, 0, 1,
-0.8394774, -0.4883297, -2.018569, 0.8705882, 1, 0, 1,
-0.8338464, -2.199458, -1.849587, 0.8666667, 1, 0, 1,
-0.8336064, -0.6428193, -2.847903, 0.8588235, 1, 0, 1,
-0.8292171, 0.7486967, 0.7173801, 0.854902, 1, 0, 1,
-0.8281929, 0.9229141, -1.291363, 0.8470588, 1, 0, 1,
-0.8256627, -0.8873156, -3.868555, 0.8431373, 1, 0, 1,
-0.8245201, -0.253182, -3.291511, 0.8352941, 1, 0, 1,
-0.8243058, -0.9956524, -3.70006, 0.8313726, 1, 0, 1,
-0.819128, 0.670592, -0.0391311, 0.8235294, 1, 0, 1,
-0.813846, -0.6178751, -2.57969, 0.8196079, 1, 0, 1,
-0.8035716, -0.5095928, -2.897405, 0.8117647, 1, 0, 1,
-0.8002469, -1.729851, -3.097823, 0.8078431, 1, 0, 1,
-0.7981402, 0.2908587, 0.02173091, 0.8, 1, 0, 1,
-0.7947973, -1.02758, -2.321238, 0.7921569, 1, 0, 1,
-0.7903988, -1.144635, -2.673803, 0.7882353, 1, 0, 1,
-0.7882668, -0.2172235, 0.4822345, 0.7803922, 1, 0, 1,
-0.7873577, 2.253998, 0.4889219, 0.7764706, 1, 0, 1,
-0.786912, 0.828241, -0.9488989, 0.7686275, 1, 0, 1,
-0.7867134, 0.7420906, -0.5608953, 0.7647059, 1, 0, 1,
-0.7818052, -1.263842, -2.19503, 0.7568628, 1, 0, 1,
-0.7814018, -0.6059394, -2.058039, 0.7529412, 1, 0, 1,
-0.7802504, 0.01162199, -3.805962, 0.7450981, 1, 0, 1,
-0.7788152, -1.06729, -2.79691, 0.7411765, 1, 0, 1,
-0.7729421, 0.9988486, -2.311285, 0.7333333, 1, 0, 1,
-0.7695524, -1.299885, -2.47808, 0.7294118, 1, 0, 1,
-0.7688161, -0.2828656, -2.449769, 0.7215686, 1, 0, 1,
-0.7653168, -0.4272431, -1.37365, 0.7176471, 1, 0, 1,
-0.7628184, -2.100452, -1.917943, 0.7098039, 1, 0, 1,
-0.7567663, 0.7655342, -1.020256, 0.7058824, 1, 0, 1,
-0.7541667, 0.8739289, -1.03255, 0.6980392, 1, 0, 1,
-0.7486615, -1.42907, -0.8985351, 0.6901961, 1, 0, 1,
-0.7334195, 1.214466, 0.6340328, 0.6862745, 1, 0, 1,
-0.7307256, -1.155435, -1.871312, 0.6784314, 1, 0, 1,
-0.7240337, -0.6074061, -2.718461, 0.6745098, 1, 0, 1,
-0.7197441, 0.4806372, -1.501588, 0.6666667, 1, 0, 1,
-0.7151127, -0.2220281, -3.092554, 0.6627451, 1, 0, 1,
-0.7087263, 0.4961939, -1.475989, 0.654902, 1, 0, 1,
-0.7086734, -1.1771, -3.115458, 0.6509804, 1, 0, 1,
-0.706048, -0.7364065, -0.6652406, 0.6431373, 1, 0, 1,
-0.6996638, -1.361588, -3.291551, 0.6392157, 1, 0, 1,
-0.6955055, -0.03193521, -0.4773576, 0.6313726, 1, 0, 1,
-0.6943163, 1.204199, -1.118086, 0.627451, 1, 0, 1,
-0.6901112, 0.8328979, -1.812144, 0.6196079, 1, 0, 1,
-0.6888441, 1.964959, 0.3143015, 0.6156863, 1, 0, 1,
-0.6861499, 0.4324314, -1.083116, 0.6078432, 1, 0, 1,
-0.6789619, -1.384618, -3.96137, 0.6039216, 1, 0, 1,
-0.6773823, -1.189983, -3.749279, 0.5960785, 1, 0, 1,
-0.677366, -1.373988, -2.822895, 0.5882353, 1, 0, 1,
-0.6771339, -1.17532, -2.201533, 0.5843138, 1, 0, 1,
-0.6743289, 0.8925918, -0.8964167, 0.5764706, 1, 0, 1,
-0.6741622, 1.614524, -0.2207481, 0.572549, 1, 0, 1,
-0.6724994, -0.3850863, -0.6995182, 0.5647059, 1, 0, 1,
-0.6711648, -1.63906, -2.376071, 0.5607843, 1, 0, 1,
-0.6708872, 0.2450599, -2.897229, 0.5529412, 1, 0, 1,
-0.6677798, -0.1021137, -2.550828, 0.5490196, 1, 0, 1,
-0.6669471, -1.287609, -1.665537, 0.5411765, 1, 0, 1,
-0.6613711, 1.219647, 0.3090861, 0.5372549, 1, 0, 1,
-0.6601604, 0.9975755, -0.02842198, 0.5294118, 1, 0, 1,
-0.6600189, 1.331732, 0.007503795, 0.5254902, 1, 0, 1,
-0.6491325, 1.01117, -3.627622, 0.5176471, 1, 0, 1,
-0.6424403, -2.064131, -2.752371, 0.5137255, 1, 0, 1,
-0.6419398, 1.759257, -1.425095, 0.5058824, 1, 0, 1,
-0.635749, 0.8260885, 0.7128175, 0.5019608, 1, 0, 1,
-0.6303183, -0.1444297, -0.2162445, 0.4941176, 1, 0, 1,
-0.6301492, 1.214524, -1.555312, 0.4862745, 1, 0, 1,
-0.6279473, -0.5755144, -4.061609, 0.4823529, 1, 0, 1,
-0.6261526, 1.4798, -0.6975158, 0.4745098, 1, 0, 1,
-0.6250222, -0.9497837, -2.601776, 0.4705882, 1, 0, 1,
-0.6224243, 1.560772, -0.5204425, 0.4627451, 1, 0, 1,
-0.6158722, -1.167876, -1.270953, 0.4588235, 1, 0, 1,
-0.6107913, 0.2697957, -0.7959437, 0.4509804, 1, 0, 1,
-0.6053562, 1.163012, 0.486634, 0.4470588, 1, 0, 1,
-0.6045951, 0.6291324, -0.3923877, 0.4392157, 1, 0, 1,
-0.6021133, -0.2825769, -2.035007, 0.4352941, 1, 0, 1,
-0.599632, -1.764278, -2.051919, 0.427451, 1, 0, 1,
-0.5927758, 2.086936, 1.372372, 0.4235294, 1, 0, 1,
-0.5881616, 1.144085, -2.095479, 0.4156863, 1, 0, 1,
-0.5838888, -1.083708, -3.718425, 0.4117647, 1, 0, 1,
-0.5816303, -0.1381857, -2.103492, 0.4039216, 1, 0, 1,
-0.5731161, 2.082563, -1.360122, 0.3960784, 1, 0, 1,
-0.5704179, 0.9760864, 0.7577175, 0.3921569, 1, 0, 1,
-0.5694072, 0.8631551, -0.1842857, 0.3843137, 1, 0, 1,
-0.5686364, -0.5790356, -1.407695, 0.3803922, 1, 0, 1,
-0.5672464, 2.329298, -1.01663, 0.372549, 1, 0, 1,
-0.5587505, 1.22641, -0.6830655, 0.3686275, 1, 0, 1,
-0.5568961, 1.000879, -0.465379, 0.3607843, 1, 0, 1,
-0.5553082, -0.1805148, -0.7971468, 0.3568628, 1, 0, 1,
-0.5549906, 1.227397, 0.1516882, 0.3490196, 1, 0, 1,
-0.5523541, 0.4721448, -0.8165637, 0.345098, 1, 0, 1,
-0.5494821, -0.1610215, -2.335009, 0.3372549, 1, 0, 1,
-0.5478666, -1.168363, -2.966563, 0.3333333, 1, 0, 1,
-0.5471107, 0.2173384, -0.4731704, 0.3254902, 1, 0, 1,
-0.5410639, 0.8098078, -0.4353169, 0.3215686, 1, 0, 1,
-0.5322046, -0.1087404, -1.77573, 0.3137255, 1, 0, 1,
-0.5316922, 1.520869, 0.4783753, 0.3098039, 1, 0, 1,
-0.5297778, -0.1952329, -1.971008, 0.3019608, 1, 0, 1,
-0.528057, 0.9476044, -1.100306, 0.2941177, 1, 0, 1,
-0.5257382, -0.1590808, -2.072944, 0.2901961, 1, 0, 1,
-0.517754, -0.06777889, -1.614636, 0.282353, 1, 0, 1,
-0.5158934, -0.1250009, -2.073132, 0.2784314, 1, 0, 1,
-0.5138234, 0.4370221, 1.086673, 0.2705882, 1, 0, 1,
-0.5131278, -0.8102653, -2.920647, 0.2666667, 1, 0, 1,
-0.507708, -0.5031482, -0.8411608, 0.2588235, 1, 0, 1,
-0.507011, -1.147228, -3.427469, 0.254902, 1, 0, 1,
-0.5053768, -1.1207, -3.148772, 0.2470588, 1, 0, 1,
-0.5037801, -0.7245914, -2.275073, 0.2431373, 1, 0, 1,
-0.5018019, 0.07002974, -1.972859, 0.2352941, 1, 0, 1,
-0.5013808, -0.1673677, -2.621614, 0.2313726, 1, 0, 1,
-0.4949954, 0.4686606, -1.029977, 0.2235294, 1, 0, 1,
-0.4924399, 0.3477514, -1.489734, 0.2196078, 1, 0, 1,
-0.4890645, 0.9943217, 0.2921234, 0.2117647, 1, 0, 1,
-0.4823007, -1.015406, -2.76895, 0.2078431, 1, 0, 1,
-0.4804243, -1.025758, -4.454732, 0.2, 1, 0, 1,
-0.4699952, -0.1319156, -2.276982, 0.1921569, 1, 0, 1,
-0.4689884, 0.3729936, -1.19463, 0.1882353, 1, 0, 1,
-0.4670249, 1.034969, -1.483498, 0.1803922, 1, 0, 1,
-0.4662997, -0.1411982, -3.031162, 0.1764706, 1, 0, 1,
-0.4659235, -1.047802, -1.747436, 0.1686275, 1, 0, 1,
-0.464974, -0.05040177, -1.844422, 0.1647059, 1, 0, 1,
-0.4643213, 0.07593825, -1.803984, 0.1568628, 1, 0, 1,
-0.4637117, 0.3415717, -0.1585538, 0.1529412, 1, 0, 1,
-0.4627578, -1.038804, -2.78611, 0.145098, 1, 0, 1,
-0.4626995, 0.3107117, -0.04885938, 0.1411765, 1, 0, 1,
-0.4598009, 0.4610163, 0.02208242, 0.1333333, 1, 0, 1,
-0.4595401, -1.021272, -3.156126, 0.1294118, 1, 0, 1,
-0.4572864, 0.1616496, -0.9155809, 0.1215686, 1, 0, 1,
-0.4558982, -1.480183, -1.394807, 0.1176471, 1, 0, 1,
-0.4522655, 0.08739146, -0.9396974, 0.1098039, 1, 0, 1,
-0.4513882, 0.6881497, -0.8911012, 0.1058824, 1, 0, 1,
-0.4471244, 0.7567914, -1.13816, 0.09803922, 1, 0, 1,
-0.4367652, 1.261595, -0.2116062, 0.09019608, 1, 0, 1,
-0.4310983, 0.9320518, 0.592209, 0.08627451, 1, 0, 1,
-0.4242885, -1.295249, -1.263125, 0.07843138, 1, 0, 1,
-0.421433, -1.865764, -1.930151, 0.07450981, 1, 0, 1,
-0.4166181, -1.080195, -1.682285, 0.06666667, 1, 0, 1,
-0.4133208, -0.9667808, -1.633463, 0.0627451, 1, 0, 1,
-0.4131514, 0.133769, -1.629222, 0.05490196, 1, 0, 1,
-0.4123074, -0.7636513, -2.18255, 0.05098039, 1, 0, 1,
-0.4117602, -2.115571, -4.687391, 0.04313726, 1, 0, 1,
-0.4101059, -0.2529081, -2.966798, 0.03921569, 1, 0, 1,
-0.4078955, 0.9949083, -1.492558, 0.03137255, 1, 0, 1,
-0.4065061, -0.5532854, -2.513419, 0.02745098, 1, 0, 1,
-0.4040325, 1.293865, -0.7171735, 0.01960784, 1, 0, 1,
-0.4021935, 1.544789, -0.93729, 0.01568628, 1, 0, 1,
-0.4016879, 0.5471178, 0.002150203, 0.007843138, 1, 0, 1,
-0.3977914, -0.2337322, -2.553513, 0.003921569, 1, 0, 1,
-0.3974679, 0.6302867, 0.2475616, 0, 1, 0.003921569, 1,
-0.397289, 0.8251525, -0.7905079, 0, 1, 0.01176471, 1,
-0.3964539, 1.982366, -0.8481975, 0, 1, 0.01568628, 1,
-0.3954427, -0.962993, -2.599512, 0, 1, 0.02352941, 1,
-0.394621, -2.369704, -2.781697, 0, 1, 0.02745098, 1,
-0.3921775, -0.6278052, -2.158056, 0, 1, 0.03529412, 1,
-0.3893003, 0.1125323, -1.511485, 0, 1, 0.03921569, 1,
-0.387558, -1.339194, -2.578729, 0, 1, 0.04705882, 1,
-0.3843343, 0.2648433, -1.712497, 0, 1, 0.05098039, 1,
-0.3833807, -0.9492002, -3.093333, 0, 1, 0.05882353, 1,
-0.3792311, 0.441954, -1.335151, 0, 1, 0.0627451, 1,
-0.3709166, -0.6763973, -4.139837, 0, 1, 0.07058824, 1,
-0.3688915, 0.3490953, -1.565922, 0, 1, 0.07450981, 1,
-0.3633009, 0.9879271, -0.8513546, 0, 1, 0.08235294, 1,
-0.3618054, 0.7068701, -0.1254118, 0, 1, 0.08627451, 1,
-0.3594693, 0.1387151, -1.583052, 0, 1, 0.09411765, 1,
-0.3574765, 0.1337176, -1.9953, 0, 1, 0.1019608, 1,
-0.3552043, -0.2633472, -2.284352, 0, 1, 0.1058824, 1,
-0.3518174, -0.4326167, -3.624382, 0, 1, 0.1137255, 1,
-0.3453496, 0.3267504, -0.8353289, 0, 1, 0.1176471, 1,
-0.3439443, -0.5755975, -2.421774, 0, 1, 0.1254902, 1,
-0.3388615, 0.4450916, -2.942285, 0, 1, 0.1294118, 1,
-0.3379979, -0.2932602, -3.102044, 0, 1, 0.1372549, 1,
-0.3357438, -1.561352, -1.006123, 0, 1, 0.1411765, 1,
-0.3341776, -0.4323121, -4.433822, 0, 1, 0.1490196, 1,
-0.3320334, -0.9119579, -2.973583, 0, 1, 0.1529412, 1,
-0.33016, 0.11903, -2.457465, 0, 1, 0.1607843, 1,
-0.3299662, 0.1119613, -1.587867, 0, 1, 0.1647059, 1,
-0.322884, -0.6128287, -1.201132, 0, 1, 0.172549, 1,
-0.3214381, -1.66071, -3.317734, 0, 1, 0.1764706, 1,
-0.3170561, -0.7804158, -3.599881, 0, 1, 0.1843137, 1,
-0.3138029, -0.7143672, -2.914472, 0, 1, 0.1882353, 1,
-0.3133657, 0.116075, -2.794644, 0, 1, 0.1960784, 1,
-0.3105596, 0.02642729, -1.607508, 0, 1, 0.2039216, 1,
-0.3090507, 1.748782, 0.3365885, 0, 1, 0.2078431, 1,
-0.3069645, -0.4058129, -4.176053, 0, 1, 0.2156863, 1,
-0.3068012, -0.0290928, -3.432394, 0, 1, 0.2196078, 1,
-0.3038368, 0.710903, -0.4209226, 0, 1, 0.227451, 1,
-0.3035904, -0.4451703, -2.09242, 0, 1, 0.2313726, 1,
-0.3021251, -0.9321602, -1.612725, 0, 1, 0.2392157, 1,
-0.3005674, -1.021198, -3.152919, 0, 1, 0.2431373, 1,
-0.2989076, 0.4651423, -1.083243, 0, 1, 0.2509804, 1,
-0.2985325, -0.3721488, -3.463362, 0, 1, 0.254902, 1,
-0.2971591, 0.4565169, -1.665144, 0, 1, 0.2627451, 1,
-0.2966686, 1.013863, -1.172257, 0, 1, 0.2666667, 1,
-0.2956007, -0.3708734, -1.486499, 0, 1, 0.2745098, 1,
-0.2938429, 0.152172, -0.5926231, 0, 1, 0.2784314, 1,
-0.2928708, -0.6578138, -1.175195, 0, 1, 0.2862745, 1,
-0.2921628, 1.088223, -0.9005452, 0, 1, 0.2901961, 1,
-0.2853513, -0.9714938, -2.513708, 0, 1, 0.2980392, 1,
-0.2851928, -1.476233, -4.399517, 0, 1, 0.3058824, 1,
-0.2815284, 0.8967333, -1.789794, 0, 1, 0.3098039, 1,
-0.2808327, -0.3388341, -3.514473, 0, 1, 0.3176471, 1,
-0.2798949, -0.2417848, -0.2286258, 0, 1, 0.3215686, 1,
-0.2739421, -1.353612, -4.137001, 0, 1, 0.3294118, 1,
-0.2734403, -0.5492567, -2.901531, 0, 1, 0.3333333, 1,
-0.2713554, 0.5621803, 1.22947, 0, 1, 0.3411765, 1,
-0.269887, -1.197661, -2.898365, 0, 1, 0.345098, 1,
-0.2683457, 1.016872, -2.398106, 0, 1, 0.3529412, 1,
-0.267956, 0.05318594, -0.4797882, 0, 1, 0.3568628, 1,
-0.2625197, -0.335749, -2.584718, 0, 1, 0.3647059, 1,
-0.2589103, 1.519806, -3.93843, 0, 1, 0.3686275, 1,
-0.2556501, 0.889956, 0.3539886, 0, 1, 0.3764706, 1,
-0.2500791, -0.364565, -2.050192, 0, 1, 0.3803922, 1,
-0.2484981, -3.804142, -3.417423, 0, 1, 0.3882353, 1,
-0.2484694, -0.3288374, -3.672212, 0, 1, 0.3921569, 1,
-0.2478525, 0.2442802, -0.9008526, 0, 1, 0.4, 1,
-0.2455282, -1.573766, -3.054324, 0, 1, 0.4078431, 1,
-0.2405541, 1.629152, 0.3712148, 0, 1, 0.4117647, 1,
-0.2403494, -0.3320926, -2.148243, 0, 1, 0.4196078, 1,
-0.2394816, -0.6322649, -4.796555, 0, 1, 0.4235294, 1,
-0.2380015, 0.9954336, -1.555033, 0, 1, 0.4313726, 1,
-0.2369869, 1.049514, -0.7123968, 0, 1, 0.4352941, 1,
-0.2344411, -0.2355351, -2.369191, 0, 1, 0.4431373, 1,
-0.233902, 0.6219746, -2.094852, 0, 1, 0.4470588, 1,
-0.229918, 0.8746668, 2.35386, 0, 1, 0.454902, 1,
-0.2228385, -1.594025, -4.177686, 0, 1, 0.4588235, 1,
-0.2217969, -2.038949, -1.088163, 0, 1, 0.4666667, 1,
-0.2215482, 1.143107, -0.1276497, 0, 1, 0.4705882, 1,
-0.2165263, 1.250887, -1.091919, 0, 1, 0.4784314, 1,
-0.2138613, 0.5171967, 0.5965487, 0, 1, 0.4823529, 1,
-0.2136276, 1.091459, -0.03568353, 0, 1, 0.4901961, 1,
-0.2130572, -0.7108349, -0.8839162, 0, 1, 0.4941176, 1,
-0.212395, 3.375375, 0.8441508, 0, 1, 0.5019608, 1,
-0.2102978, -0.2055649, -3.050509, 0, 1, 0.509804, 1,
-0.2101723, 0.1156555, 0.3653446, 0, 1, 0.5137255, 1,
-0.2092674, 0.2592489, -0.3737539, 0, 1, 0.5215687, 1,
-0.2084318, 0.8836344, 0.6549595, 0, 1, 0.5254902, 1,
-0.2064544, -0.6883873, -1.724754, 0, 1, 0.5333334, 1,
-0.2037732, -0.9464883, -3.293207, 0, 1, 0.5372549, 1,
-0.2034207, 0.7495446, 1.270302, 0, 1, 0.5450981, 1,
-0.2030612, -0.1949814, -2.017467, 0, 1, 0.5490196, 1,
-0.2028292, -1.182737, -1.579212, 0, 1, 0.5568628, 1,
-0.2002402, -0.5605255, -3.727326, 0, 1, 0.5607843, 1,
-0.1950728, 0.7413085, -0.4903922, 0, 1, 0.5686275, 1,
-0.1936362, -1.05035, -4.148073, 0, 1, 0.572549, 1,
-0.1908673, -1.660508, -2.427816, 0, 1, 0.5803922, 1,
-0.1895138, -1.309746, -2.152075, 0, 1, 0.5843138, 1,
-0.1892384, -0.1086228, -2.875053, 0, 1, 0.5921569, 1,
-0.1883407, -0.2729325, -2.041763, 0, 1, 0.5960785, 1,
-0.1883381, 0.7751791, -0.8045362, 0, 1, 0.6039216, 1,
-0.1811885, -0.110494, -1.25564, 0, 1, 0.6117647, 1,
-0.1797152, -0.1104428, -1.817632, 0, 1, 0.6156863, 1,
-0.1790205, 0.0888503, -2.73769, 0, 1, 0.6235294, 1,
-0.1716929, 0.6793172, 0.1091094, 0, 1, 0.627451, 1,
-0.1673633, 0.4526696, -0.7799181, 0, 1, 0.6352941, 1,
-0.1659912, -1.616783, -2.025044, 0, 1, 0.6392157, 1,
-0.16359, -0.7078324, -2.214719, 0, 1, 0.6470588, 1,
-0.1634424, -0.08955335, -0.5782982, 0, 1, 0.6509804, 1,
-0.1630133, -0.3826917, -4.134978, 0, 1, 0.6588235, 1,
-0.1619225, -0.7158685, -1.951535, 0, 1, 0.6627451, 1,
-0.1594524, -0.9798623, -2.574532, 0, 1, 0.6705883, 1,
-0.1564309, 1.249808, -0.4004587, 0, 1, 0.6745098, 1,
-0.1536389, -1.450583, -3.903939, 0, 1, 0.682353, 1,
-0.1518464, 0.7147118, 0.3084712, 0, 1, 0.6862745, 1,
-0.1491353, 0.01467441, -3.448532, 0, 1, 0.6941177, 1,
-0.1454666, 0.4156398, -2.703239, 0, 1, 0.7019608, 1,
-0.1423196, 1.015977, -0.7628352, 0, 1, 0.7058824, 1,
-0.1420112, 1.137551, -0.5646399, 0, 1, 0.7137255, 1,
-0.140959, -0.4348445, -2.344657, 0, 1, 0.7176471, 1,
-0.139138, -1.448475, -3.726326, 0, 1, 0.7254902, 1,
-0.1390691, -2.214231, -2.859705, 0, 1, 0.7294118, 1,
-0.13625, -0.1301233, -1.293692, 0, 1, 0.7372549, 1,
-0.1299299, 1.342275, -2.469068, 0, 1, 0.7411765, 1,
-0.1270618, -1.28364, -2.766912, 0, 1, 0.7490196, 1,
-0.1255152, -1.019078, -4.670574, 0, 1, 0.7529412, 1,
-0.1176155, 2.278359, -1.077949, 0, 1, 0.7607843, 1,
-0.1163546, -1.252281, -1.235758, 0, 1, 0.7647059, 1,
-0.1153715, 0.957656, 0.2593737, 0, 1, 0.772549, 1,
-0.1096787, 0.1991536, -1.822048, 0, 1, 0.7764706, 1,
-0.1095787, 0.05715076, -0.5720801, 0, 1, 0.7843137, 1,
-0.1068768, -0.1564661, -2.896039, 0, 1, 0.7882353, 1,
-0.1063185, 1.084014, -0.3780307, 0, 1, 0.7960784, 1,
-0.1055019, 1.412157, 0.2446209, 0, 1, 0.8039216, 1,
-0.10544, 1.185796, -1.164248, 0, 1, 0.8078431, 1,
-0.1027134, 0.4942189, 0.9742007, 0, 1, 0.8156863, 1,
-0.1019842, 0.5369558, -1.175386, 0, 1, 0.8196079, 1,
-0.09675654, -1.076978, -3.787013, 0, 1, 0.827451, 1,
-0.09052017, -0.3178362, -3.922789, 0, 1, 0.8313726, 1,
-0.08809307, -0.3294453, -2.872014, 0, 1, 0.8392157, 1,
-0.08774267, 1.922054, 0.5334682, 0, 1, 0.8431373, 1,
-0.08628532, 1.050869, 0.5624024, 0, 1, 0.8509804, 1,
-0.08509948, -1.075027, -3.410031, 0, 1, 0.854902, 1,
-0.07842179, -0.6834642, -3.152098, 0, 1, 0.8627451, 1,
-0.07745799, -0.2815664, -3.306158, 0, 1, 0.8666667, 1,
-0.07485119, 0.6941395, 0.6348197, 0, 1, 0.8745098, 1,
-0.07440689, -0.8071066, -3.896336, 0, 1, 0.8784314, 1,
-0.07000833, -0.836408, -2.575818, 0, 1, 0.8862745, 1,
-0.06774319, 0.7544492, 0.7927328, 0, 1, 0.8901961, 1,
-0.06696919, -1.256435, -2.158735, 0, 1, 0.8980392, 1,
-0.06657258, 0.2752249, -0.4768273, 0, 1, 0.9058824, 1,
-0.06608043, -0.115201, -2.693738, 0, 1, 0.9098039, 1,
-0.06402971, 0.8235481, -1.006907, 0, 1, 0.9176471, 1,
-0.06261294, 1.380585, 0.3924957, 0, 1, 0.9215686, 1,
-0.06234002, 1.510788, 0.6602775, 0, 1, 0.9294118, 1,
-0.06158395, 0.4825527, -0.1697886, 0, 1, 0.9333333, 1,
-0.05717323, 0.3401829, 1.394662, 0, 1, 0.9411765, 1,
-0.05498848, -1.794352, -1.297553, 0, 1, 0.945098, 1,
-0.0478125, 0.1394516, 0.09022099, 0, 1, 0.9529412, 1,
-0.04685546, 0.6533167, 0.7466928, 0, 1, 0.9568627, 1,
-0.04557984, 0.4008805, 2.182163, 0, 1, 0.9647059, 1,
-0.04112506, -1.156026, -3.775846, 0, 1, 0.9686275, 1,
-0.0409023, -0.3108379, -2.697017, 0, 1, 0.9764706, 1,
-0.04082613, -0.6376236, -3.01487, 0, 1, 0.9803922, 1,
-0.04037895, -0.4646333, -3.140713, 0, 1, 0.9882353, 1,
-0.03867568, 0.7793293, 0.9653365, 0, 1, 0.9921569, 1,
-0.03849102, 0.6307957, -0.593957, 0, 1, 1, 1,
-0.03784274, -0.6353803, -3.374387, 0, 0.9921569, 1, 1,
-0.02994784, -1.686293, -3.230297, 0, 0.9882353, 1, 1,
-0.02906549, 1.352607, 0.2059721, 0, 0.9803922, 1, 1,
-0.02784328, 2.204507, -1.006052, 0, 0.9764706, 1, 1,
-0.02432678, -1.527215, -3.843652, 0, 0.9686275, 1, 1,
-0.02190968, -0.08621924, -3.548999, 0, 0.9647059, 1, 1,
-0.0194856, 1.495537, -0.5103161, 0, 0.9568627, 1, 1,
-0.01900524, 1.394678, 0.4568265, 0, 0.9529412, 1, 1,
-0.01845335, 0.7000726, -0.1220835, 0, 0.945098, 1, 1,
-0.01704997, -1.143589, -1.93517, 0, 0.9411765, 1, 1,
-0.01480499, 1.445231, 1.189996, 0, 0.9333333, 1, 1,
-0.007527991, 0.701851, -1.04957, 0, 0.9294118, 1, 1,
-0.006550821, 0.1207957, -0.82553, 0, 0.9215686, 1, 1,
-0.005214281, 1.122567, -0.7460299, 0, 0.9176471, 1, 1,
-0.002377502, 0.9992652, 0.3424897, 0, 0.9098039, 1, 1,
-0.0007708184, 0.5761389, -0.4149913, 0, 0.9058824, 1, 1,
0.001058651, 0.8782539, -0.5948592, 0, 0.8980392, 1, 1,
0.001153722, 2.294899, 0.1524114, 0, 0.8901961, 1, 1,
0.002470191, -0.526184, 2.696053, 0, 0.8862745, 1, 1,
0.003712232, 0.7140032, 0.2024277, 0, 0.8784314, 1, 1,
0.003823594, -0.6577834, 1.326023, 0, 0.8745098, 1, 1,
0.004934058, 0.01208051, -1.142267, 0, 0.8666667, 1, 1,
0.005291236, -1.15431, 4.832336, 0, 0.8627451, 1, 1,
0.008202517, -0.15818, 3.442343, 0, 0.854902, 1, 1,
0.008688552, 0.2745045, 0.757626, 0, 0.8509804, 1, 1,
0.009221128, 0.5841033, 0.3202876, 0, 0.8431373, 1, 1,
0.009372345, 0.6605328, 0.6997355, 0, 0.8392157, 1, 1,
0.01067012, 1.160605, -0.1472718, 0, 0.8313726, 1, 1,
0.01207524, -0.6505657, 3.494243, 0, 0.827451, 1, 1,
0.01251828, 1.53962, 0.1492624, 0, 0.8196079, 1, 1,
0.01336372, 1.675449, -0.7259889, 0, 0.8156863, 1, 1,
0.01494836, -0.8158627, 4.132777, 0, 0.8078431, 1, 1,
0.01938496, -0.6633586, 1.775383, 0, 0.8039216, 1, 1,
0.01983381, 1.90964, 0.6787051, 0, 0.7960784, 1, 1,
0.02065798, 0.4447635, 0.2044188, 0, 0.7882353, 1, 1,
0.02490884, 1.828121, -0.07084005, 0, 0.7843137, 1, 1,
0.02938999, 1.024812, -0.8135347, 0, 0.7764706, 1, 1,
0.03194432, -0.7738721, 2.761074, 0, 0.772549, 1, 1,
0.03450974, 0.5889928, -1.011471, 0, 0.7647059, 1, 1,
0.03561878, -0.2281895, 3.968327, 0, 0.7607843, 1, 1,
0.03972138, 1.160419, -2.409702, 0, 0.7529412, 1, 1,
0.04521943, 2.005727, -0.9819654, 0, 0.7490196, 1, 1,
0.0483808, 0.8125484, 1.280077, 0, 0.7411765, 1, 1,
0.04886657, -0.9069725, 4.794946, 0, 0.7372549, 1, 1,
0.05433786, 1.518399, 0.4968094, 0, 0.7294118, 1, 1,
0.06071526, -0.4036712, 4.375105, 0, 0.7254902, 1, 1,
0.06181166, -1.922816, 2.245679, 0, 0.7176471, 1, 1,
0.06278444, -0.08436748, 2.752221, 0, 0.7137255, 1, 1,
0.06350486, -0.6503335, 4.426031, 0, 0.7058824, 1, 1,
0.06761602, 0.3833584, 0.2587447, 0, 0.6980392, 1, 1,
0.06936765, -0.9207516, 2.798969, 0, 0.6941177, 1, 1,
0.07033525, 0.3098653, -1.3097, 0, 0.6862745, 1, 1,
0.07395953, 0.9029913, 0.5190947, 0, 0.682353, 1, 1,
0.07853252, 0.1672446, -1.051555, 0, 0.6745098, 1, 1,
0.07915545, -0.5450915, 2.284262, 0, 0.6705883, 1, 1,
0.08019413, -0.9879269, 3.782636, 0, 0.6627451, 1, 1,
0.08140885, -0.454889, 2.825914, 0, 0.6588235, 1, 1,
0.08984612, 0.9376418, 0.4143672, 0, 0.6509804, 1, 1,
0.1001622, 0.7111742, 0.7547552, 0, 0.6470588, 1, 1,
0.1065529, -1.038879, 3.335107, 0, 0.6392157, 1, 1,
0.1092904, 0.3861935, -0.4757215, 0, 0.6352941, 1, 1,
0.1095932, 1.130211, 0.2720906, 0, 0.627451, 1, 1,
0.1099475, 1.399241, 0.5673541, 0, 0.6235294, 1, 1,
0.1103704, 1.444059, -0.3460986, 0, 0.6156863, 1, 1,
0.1118687, -1.149616, 1.849632, 0, 0.6117647, 1, 1,
0.1168468, 0.5448394, -1.799706, 0, 0.6039216, 1, 1,
0.1198131, 0.07931392, -0.6914054, 0, 0.5960785, 1, 1,
0.1198576, 0.3560684, 0.7248784, 0, 0.5921569, 1, 1,
0.1220759, 0.1618942, 1.064401, 0, 0.5843138, 1, 1,
0.1234218, 0.7440449, -0.2508186, 0, 0.5803922, 1, 1,
0.1258445, -0.7397826, 2.625257, 0, 0.572549, 1, 1,
0.1267004, 0.6019725, -1.349329, 0, 0.5686275, 1, 1,
0.1267549, 0.1951714, 1.343894, 0, 0.5607843, 1, 1,
0.1276723, -1.44219, 3.834852, 0, 0.5568628, 1, 1,
0.128654, -0.1196092, 1.409039, 0, 0.5490196, 1, 1,
0.1293564, -1.750555, 3.714039, 0, 0.5450981, 1, 1,
0.1295399, -1.576213, 4.148808, 0, 0.5372549, 1, 1,
0.1312743, -0.4095147, 3.420341, 0, 0.5333334, 1, 1,
0.1342519, -0.01753464, 1.654037, 0, 0.5254902, 1, 1,
0.1354451, 0.7927842, -1.754049, 0, 0.5215687, 1, 1,
0.1363783, -0.5009959, 2.486547, 0, 0.5137255, 1, 1,
0.1381204, 0.8951014, -1.070141, 0, 0.509804, 1, 1,
0.1393363, 0.7642336, 1.08689, 0, 0.5019608, 1, 1,
0.1413876, -0.1077196, 1.611415, 0, 0.4941176, 1, 1,
0.1431584, -0.5156928, 2.561415, 0, 0.4901961, 1, 1,
0.1431704, -1.575393, 4.500937, 0, 0.4823529, 1, 1,
0.1439748, -1.054903, 3.572747, 0, 0.4784314, 1, 1,
0.1550858, -0.1742727, 3.172772, 0, 0.4705882, 1, 1,
0.1560728, -0.7201443, 1.566555, 0, 0.4666667, 1, 1,
0.1595698, -1.150401, 3.641762, 0, 0.4588235, 1, 1,
0.1601657, 1.514017, -0.3526574, 0, 0.454902, 1, 1,
0.1690129, 0.8938468, -0.2439218, 0, 0.4470588, 1, 1,
0.1695647, 2.475408, -0.1458106, 0, 0.4431373, 1, 1,
0.1715915, -0.7646334, 2.569777, 0, 0.4352941, 1, 1,
0.1727946, 0.6111748, -0.3445552, 0, 0.4313726, 1, 1,
0.1735087, 0.4027181, 0.9617893, 0, 0.4235294, 1, 1,
0.1747161, -1.301496, 4.006803, 0, 0.4196078, 1, 1,
0.1756934, -0.6448801, 3.597455, 0, 0.4117647, 1, 1,
0.1779813, 2.437323, -2.243438, 0, 0.4078431, 1, 1,
0.1836159, -0.7686503, 2.14124, 0, 0.4, 1, 1,
0.18518, -1.061341, 2.841261, 0, 0.3921569, 1, 1,
0.1888216, 0.3639811, 1.212103, 0, 0.3882353, 1, 1,
0.1903706, -0.2118449, 2.011472, 0, 0.3803922, 1, 1,
0.1920275, 1.158951, 2.546036, 0, 0.3764706, 1, 1,
0.192844, 0.5661836, 0.09210926, 0, 0.3686275, 1, 1,
0.201605, 0.7390591, 0.2260394, 0, 0.3647059, 1, 1,
0.2031286, 0.9610885, 2.32106, 0, 0.3568628, 1, 1,
0.2042073, -2.01871, 2.281626, 0, 0.3529412, 1, 1,
0.206496, 0.2901386, 1.48063, 0, 0.345098, 1, 1,
0.2204443, 0.147742, -0.514762, 0, 0.3411765, 1, 1,
0.2214285, -1.187325, 2.169965, 0, 0.3333333, 1, 1,
0.2229385, 0.2917995, 0.816952, 0, 0.3294118, 1, 1,
0.225326, 1.402002, -1.10694, 0, 0.3215686, 1, 1,
0.2270788, -0.2475924, 1.740541, 0, 0.3176471, 1, 1,
0.2285379, -1.027116, 5.063505, 0, 0.3098039, 1, 1,
0.2346572, 0.9128655, -1.463016, 0, 0.3058824, 1, 1,
0.2365392, 1.00967, 0.7323266, 0, 0.2980392, 1, 1,
0.2424215, -0.1440828, 3.936335, 0, 0.2901961, 1, 1,
0.2440105, 1.290735, -0.8053076, 0, 0.2862745, 1, 1,
0.2440433, 0.8025037, 0.6772724, 0, 0.2784314, 1, 1,
0.2504947, -1.644814, 3.42731, 0, 0.2745098, 1, 1,
0.2599098, -0.6327988, 1.290977, 0, 0.2666667, 1, 1,
0.2654844, 0.5450837, -0.5566306, 0, 0.2627451, 1, 1,
0.2674391, -0.2536023, 4.641811, 0, 0.254902, 1, 1,
0.2681628, 0.6239802, 1.565074, 0, 0.2509804, 1, 1,
0.2690539, -0.646989, 2.071877, 0, 0.2431373, 1, 1,
0.2711303, 0.09680185, 0.8703296, 0, 0.2392157, 1, 1,
0.273924, 2.287388, 0.2170773, 0, 0.2313726, 1, 1,
0.2746054, 0.5628906, 0.540858, 0, 0.227451, 1, 1,
0.2748184, 0.5898914, 1.212753, 0, 0.2196078, 1, 1,
0.2789907, -1.913955, 2.731398, 0, 0.2156863, 1, 1,
0.2795399, 0.35533, 0.4905506, 0, 0.2078431, 1, 1,
0.2796299, -1.282119, 3.984364, 0, 0.2039216, 1, 1,
0.2837138, 0.2365861, 0.3991227, 0, 0.1960784, 1, 1,
0.2857111, -0.1660891, 1.9815, 0, 0.1882353, 1, 1,
0.2873143, 2.112587, 1.702295, 0, 0.1843137, 1, 1,
0.2913361, -0.7077516, 2.680406, 0, 0.1764706, 1, 1,
0.2944362, -0.6686697, 2.168452, 0, 0.172549, 1, 1,
0.2962945, -0.1622135, 3.243474, 0, 0.1647059, 1, 1,
0.2963091, -0.8097985, 3.287078, 0, 0.1607843, 1, 1,
0.3053472, -1.291904, 1.903415, 0, 0.1529412, 1, 1,
0.3055725, 0.6364773, 2.133549, 0, 0.1490196, 1, 1,
0.3072056, 0.2168634, 0.01002259, 0, 0.1411765, 1, 1,
0.3087973, 0.2735181, 1.391029, 0, 0.1372549, 1, 1,
0.3096788, -0.1675759, 3.779848, 0, 0.1294118, 1, 1,
0.309864, 0.5785928, 2.349026, 0, 0.1254902, 1, 1,
0.3099486, 0.8036175, -0.3394273, 0, 0.1176471, 1, 1,
0.3132783, -0.7960112, 0.7690559, 0, 0.1137255, 1, 1,
0.316236, -0.3634146, 3.961035, 0, 0.1058824, 1, 1,
0.3202427, 0.7522247, 0.6969751, 0, 0.09803922, 1, 1,
0.3240688, -0.2198527, 0.5373504, 0, 0.09411765, 1, 1,
0.3333312, -0.3446446, 2.828965, 0, 0.08627451, 1, 1,
0.3353045, 0.005924534, 1.172715, 0, 0.08235294, 1, 1,
0.3409604, -1.463511, 0.6500556, 0, 0.07450981, 1, 1,
0.3437037, 0.5512411, 1.315822, 0, 0.07058824, 1, 1,
0.3449016, 0.5979133, 0.1461789, 0, 0.0627451, 1, 1,
0.3477908, 0.8549287, -1.122462, 0, 0.05882353, 1, 1,
0.3486141, -2.063542, 2.506934, 0, 0.05098039, 1, 1,
0.3578692, -0.8447887, 1.218245, 0, 0.04705882, 1, 1,
0.3583675, 1.120259, -0.1575278, 0, 0.03921569, 1, 1,
0.3595301, -0.008316024, 1.668503, 0, 0.03529412, 1, 1,
0.3639702, -0.9756153, 2.045287, 0, 0.02745098, 1, 1,
0.3701145, 0.8838647, 1.242663, 0, 0.02352941, 1, 1,
0.3721595, -0.6988419, 3.03109, 0, 0.01568628, 1, 1,
0.3752029, -1.59407, 4.713918, 0, 0.01176471, 1, 1,
0.3819292, 0.1055305, 1.409361, 0, 0.003921569, 1, 1,
0.3898033, 1.31206, 0.9942957, 0.003921569, 0, 1, 1,
0.3901836, -0.2801231, 2.54317, 0.007843138, 0, 1, 1,
0.39571, 0.9255108, 0.07348762, 0.01568628, 0, 1, 1,
0.3986722, -0.6195656, 2.538636, 0.01960784, 0, 1, 1,
0.404234, -0.6438851, 3.200681, 0.02745098, 0, 1, 1,
0.4101551, -0.2877964, 2.884093, 0.03137255, 0, 1, 1,
0.41761, 1.347162, -0.5047107, 0.03921569, 0, 1, 1,
0.4261211, 0.1918458, 1.860328, 0.04313726, 0, 1, 1,
0.4262201, -0.2429337, 1.180687, 0.05098039, 0, 1, 1,
0.428221, -0.6816024, 1.154202, 0.05490196, 0, 1, 1,
0.4295066, 0.2993762, 2.040256, 0.0627451, 0, 1, 1,
0.4299503, -0.2029905, 2.627281, 0.06666667, 0, 1, 1,
0.4299834, -0.4064586, 0.4494456, 0.07450981, 0, 1, 1,
0.4345564, 0.7349764, 2.211715, 0.07843138, 0, 1, 1,
0.4408644, 1.45927, -0.2006144, 0.08627451, 0, 1, 1,
0.4461468, 0.4041934, 0.4371485, 0.09019608, 0, 1, 1,
0.4488597, -0.8404334, 3.385243, 0.09803922, 0, 1, 1,
0.4524904, -0.5368421, 2.374934, 0.1058824, 0, 1, 1,
0.452646, -0.03589833, 0.9659307, 0.1098039, 0, 1, 1,
0.452861, -0.6743051, 2.351562, 0.1176471, 0, 1, 1,
0.4530404, 1.055943, -0.6682685, 0.1215686, 0, 1, 1,
0.4546581, -0.9456851, 0.2167521, 0.1294118, 0, 1, 1,
0.4587472, -0.6607001, 1.806712, 0.1333333, 0, 1, 1,
0.4629256, -2.771648, 2.892449, 0.1411765, 0, 1, 1,
0.4645159, -1.49558, 4.213181, 0.145098, 0, 1, 1,
0.468054, -0.3916507, 1.668776, 0.1529412, 0, 1, 1,
0.4690987, 1.101193, 0.7035161, 0.1568628, 0, 1, 1,
0.4747742, -1.606364, 3.750361, 0.1647059, 0, 1, 1,
0.4749635, -1.624849, 4.281728, 0.1686275, 0, 1, 1,
0.4761867, -1.147253, 2.747378, 0.1764706, 0, 1, 1,
0.4775296, -0.1876711, 1.724778, 0.1803922, 0, 1, 1,
0.4854618, 0.4716992, 1.488952, 0.1882353, 0, 1, 1,
0.4857271, 2.499521, -0.7953658, 0.1921569, 0, 1, 1,
0.4871215, 1.208646, -0.6701465, 0.2, 0, 1, 1,
0.4898008, 2.033601, -1.766619, 0.2078431, 0, 1, 1,
0.4929768, 0.1723504, 1.764508, 0.2117647, 0, 1, 1,
0.4939587, 1.921966, 0.4878893, 0.2196078, 0, 1, 1,
0.4995377, -0.2998765, 1.357647, 0.2235294, 0, 1, 1,
0.5056408, -0.6807456, 2.211811, 0.2313726, 0, 1, 1,
0.506211, 0.5189885, -0.9849219, 0.2352941, 0, 1, 1,
0.5099307, 0.448845, 1.880395, 0.2431373, 0, 1, 1,
0.5112733, -1.238598, 2.301313, 0.2470588, 0, 1, 1,
0.5153424, -1.18875, 5.218736, 0.254902, 0, 1, 1,
0.516921, 0.6666929, 1.996519, 0.2588235, 0, 1, 1,
0.5260335, 0.6915052, 1.673134, 0.2666667, 0, 1, 1,
0.5268302, 0.3254025, -0.1856925, 0.2705882, 0, 1, 1,
0.5378655, -0.9356346, 1.924016, 0.2784314, 0, 1, 1,
0.5381594, 1.679456, -0.8129351, 0.282353, 0, 1, 1,
0.5397761, 0.7465953, 0.5652271, 0.2901961, 0, 1, 1,
0.5415166, 1.940515, 0.6728497, 0.2941177, 0, 1, 1,
0.5501517, -1.224082, 2.99415, 0.3019608, 0, 1, 1,
0.5518777, -0.0685823, 1.689656, 0.3098039, 0, 1, 1,
0.5529777, 0.5024019, 0.8621651, 0.3137255, 0, 1, 1,
0.5548067, -0.04647477, 3.512063, 0.3215686, 0, 1, 1,
0.5610565, -0.1931653, 1.662153, 0.3254902, 0, 1, 1,
0.5631528, -1.206276, 2.522526, 0.3333333, 0, 1, 1,
0.5653637, -1.361909, 2.588442, 0.3372549, 0, 1, 1,
0.5784683, 2.109338, 0.841511, 0.345098, 0, 1, 1,
0.585068, 0.2172273, 1.325662, 0.3490196, 0, 1, 1,
0.5902897, -0.5726346, 1.010154, 0.3568628, 0, 1, 1,
0.5931128, -0.4093006, 3.156705, 0.3607843, 0, 1, 1,
0.5945832, 0.04248886, 1.371253, 0.3686275, 0, 1, 1,
0.595736, 1.600616, -0.2859019, 0.372549, 0, 1, 1,
0.601428, 0.7407326, -0.5816987, 0.3803922, 0, 1, 1,
0.6019523, -0.4331717, 2.115924, 0.3843137, 0, 1, 1,
0.6042684, -0.8123817, 2.038484, 0.3921569, 0, 1, 1,
0.6053474, -0.9623053, 2.419009, 0.3960784, 0, 1, 1,
0.6098267, 1.291577, -1.36663, 0.4039216, 0, 1, 1,
0.6122392, 1.064371, -0.01780389, 0.4117647, 0, 1, 1,
0.6133201, 0.03006765, 2.478373, 0.4156863, 0, 1, 1,
0.6141039, -0.9740514, 2.425875, 0.4235294, 0, 1, 1,
0.6142716, 1.431495, 0.3688987, 0.427451, 0, 1, 1,
0.6164383, -2.242741, 3.182948, 0.4352941, 0, 1, 1,
0.6165595, -0.07893066, 2.495566, 0.4392157, 0, 1, 1,
0.6189375, 0.4064816, 1.495136, 0.4470588, 0, 1, 1,
0.6297387, -0.3439009, 0.2942061, 0.4509804, 0, 1, 1,
0.6324931, -0.8692096, 3.52122, 0.4588235, 0, 1, 1,
0.6329225, 0.5748422, 0.1678485, 0.4627451, 0, 1, 1,
0.6380718, -0.709285, 0.7375284, 0.4705882, 0, 1, 1,
0.6414073, 1.501824, 1.268886, 0.4745098, 0, 1, 1,
0.6449369, 0.09914132, 3.325916, 0.4823529, 0, 1, 1,
0.6465696, 0.7635334, 0.5788674, 0.4862745, 0, 1, 1,
0.6565707, 0.3709558, 2.154355, 0.4941176, 0, 1, 1,
0.657982, -0.6530207, 2.919045, 0.5019608, 0, 1, 1,
0.664008, -0.5843693, 1.156412, 0.5058824, 0, 1, 1,
0.6642039, -0.9044605, 2.595307, 0.5137255, 0, 1, 1,
0.6651841, 1.048604, -0.5255075, 0.5176471, 0, 1, 1,
0.6667739, 0.2496005, 1.222833, 0.5254902, 0, 1, 1,
0.6674239, 0.8054769, 0.7592816, 0.5294118, 0, 1, 1,
0.6681167, 0.5508385, 1.373754, 0.5372549, 0, 1, 1,
0.6697522, 0.844572, 1.197056, 0.5411765, 0, 1, 1,
0.6757517, -1.119767, 2.621498, 0.5490196, 0, 1, 1,
0.677811, 0.8166387, 1.738504, 0.5529412, 0, 1, 1,
0.6785357, 2.275817, 0.784451, 0.5607843, 0, 1, 1,
0.6817127, 1.619007, 0.3819318, 0.5647059, 0, 1, 1,
0.6889889, -0.6385764, 2.788074, 0.572549, 0, 1, 1,
0.6958686, 0.3772633, 0.5770308, 0.5764706, 0, 1, 1,
0.6958911, -0.6132705, 1.278115, 0.5843138, 0, 1, 1,
0.6961162, 0.2968402, 3.215684, 0.5882353, 0, 1, 1,
0.6975945, 1.362592, -0.02183725, 0.5960785, 0, 1, 1,
0.6978419, -0.30213, 2.155448, 0.6039216, 0, 1, 1,
0.698633, 0.7149051, 1.25736, 0.6078432, 0, 1, 1,
0.7104387, -1.100942, 4.104508, 0.6156863, 0, 1, 1,
0.7150159, -1.590914, 2.200629, 0.6196079, 0, 1, 1,
0.7169878, -1.413619, 2.027183, 0.627451, 0, 1, 1,
0.7175632, -0.756069, 2.128793, 0.6313726, 0, 1, 1,
0.7283803, 0.04005812, 0.8710436, 0.6392157, 0, 1, 1,
0.7316419, 1.571939, 1.231708, 0.6431373, 0, 1, 1,
0.7344279, 1.08783, 0.2255819, 0.6509804, 0, 1, 1,
0.7358338, -1.373562, 1.952357, 0.654902, 0, 1, 1,
0.738187, 0.8776988, 1.019327, 0.6627451, 0, 1, 1,
0.7461319, -0.4592732, 2.368501, 0.6666667, 0, 1, 1,
0.7530982, 1.577959, 0.7150747, 0.6745098, 0, 1, 1,
0.7552203, 1.363794, 0.3541863, 0.6784314, 0, 1, 1,
0.756762, 0.7433111, 1.785491, 0.6862745, 0, 1, 1,
0.7593634, 0.6589692, 0.397757, 0.6901961, 0, 1, 1,
0.76095, -0.1921827, 2.271291, 0.6980392, 0, 1, 1,
0.7633247, -1.016905, 2.472847, 0.7058824, 0, 1, 1,
0.7635574, 0.9746802, 1.744152, 0.7098039, 0, 1, 1,
0.7639514, 0.3128732, 1.811957, 0.7176471, 0, 1, 1,
0.7675676, -0.008563251, 1.726248, 0.7215686, 0, 1, 1,
0.7712156, -1.623267, 3.552762, 0.7294118, 0, 1, 1,
0.7716284, 1.696999, 0.4466224, 0.7333333, 0, 1, 1,
0.7773224, -1.081095, 2.923739, 0.7411765, 0, 1, 1,
0.7798629, -1.997348, 3.747249, 0.7450981, 0, 1, 1,
0.7803699, -0.3929074, 1.294998, 0.7529412, 0, 1, 1,
0.7888544, 0.5956805, 1.258937, 0.7568628, 0, 1, 1,
0.7967767, 0.8076299, 0.2247796, 0.7647059, 0, 1, 1,
0.801044, -0.2162694, 2.244601, 0.7686275, 0, 1, 1,
0.8015277, 0.5533962, 0.3647626, 0.7764706, 0, 1, 1,
0.8020479, -1.485693, 3.947136, 0.7803922, 0, 1, 1,
0.8070186, 1.384313, 0.7536082, 0.7882353, 0, 1, 1,
0.8178834, -0.5155165, 3.502067, 0.7921569, 0, 1, 1,
0.8180408, 0.5035176, -0.1642787, 0.8, 0, 1, 1,
0.8199616, 0.5229484, -0.238902, 0.8078431, 0, 1, 1,
0.8230177, -0.8369117, 3.165329, 0.8117647, 0, 1, 1,
0.8273766, 0.3356173, 2.615633, 0.8196079, 0, 1, 1,
0.8281769, 1.935547, -0.6521934, 0.8235294, 0, 1, 1,
0.8326458, -1.416018, 1.77967, 0.8313726, 0, 1, 1,
0.8366888, -0.4607394, 0.4470285, 0.8352941, 0, 1, 1,
0.8415804, -0.7967467, 3.349324, 0.8431373, 0, 1, 1,
0.8442444, 0.2341357, 2.07305, 0.8470588, 0, 1, 1,
0.8446707, -1.883435, 2.182478, 0.854902, 0, 1, 1,
0.8463316, -0.7385856, 2.491987, 0.8588235, 0, 1, 1,
0.850663, -0.8093656, 2.494278, 0.8666667, 0, 1, 1,
0.8544024, 0.5547537, 0.9071345, 0.8705882, 0, 1, 1,
0.8563131, 0.190028, -0.2177473, 0.8784314, 0, 1, 1,
0.8577889, -1.281896, 3.328068, 0.8823529, 0, 1, 1,
0.8590536, 0.780475, 1.243184, 0.8901961, 0, 1, 1,
0.8661243, 0.6397985, 2.344743, 0.8941177, 0, 1, 1,
0.8666067, 0.5447124, 1.784946, 0.9019608, 0, 1, 1,
0.8696414, -2.196023, 2.559459, 0.9098039, 0, 1, 1,
0.8737686, 2.137619, 1.373272, 0.9137255, 0, 1, 1,
0.8741231, 2.670299, -1.151465, 0.9215686, 0, 1, 1,
0.8752407, 0.07547004, -0.4301154, 0.9254902, 0, 1, 1,
0.8757502, -0.886552, 1.814528, 0.9333333, 0, 1, 1,
0.8807414, -0.3234484, 1.304024, 0.9372549, 0, 1, 1,
0.8841717, -0.6060536, 2.016864, 0.945098, 0, 1, 1,
0.8876208, -0.652026, 2.112251, 0.9490196, 0, 1, 1,
0.8934633, 1.093857, 0.3759207, 0.9568627, 0, 1, 1,
0.9014321, 0.7681444, 0.2952414, 0.9607843, 0, 1, 1,
0.9037825, -0.3408903, 1.637987, 0.9686275, 0, 1, 1,
0.9041995, 0.7851636, 0.7336909, 0.972549, 0, 1, 1,
0.9054856, -0.8626248, 0.6645042, 0.9803922, 0, 1, 1,
0.9079064, -1.279975, 1.738063, 0.9843137, 0, 1, 1,
0.9133751, 0.05674598, 2.340761, 0.9921569, 0, 1, 1,
0.9165075, -0.7038816, 1.952103, 0.9960784, 0, 1, 1,
0.9251888, 1.739692, 0.5429237, 1, 0, 0.9960784, 1,
0.9274803, 0.01310065, 1.34804, 1, 0, 0.9882353, 1,
0.9302632, -0.8468323, 1.905041, 1, 0, 0.9843137, 1,
0.9326246, -0.5528445, 0.2237251, 1, 0, 0.9764706, 1,
0.9350969, -0.6652895, 2.658111, 1, 0, 0.972549, 1,
0.9385625, -0.6562716, 3.779227, 1, 0, 0.9647059, 1,
0.9432931, 0.09742369, 2.530835, 1, 0, 0.9607843, 1,
0.9436364, -0.3994789, -0.4950976, 1, 0, 0.9529412, 1,
0.944648, -1.28109, 1.685332, 1, 0, 0.9490196, 1,
0.9470667, 0.4504988, 2.37773, 1, 0, 0.9411765, 1,
0.9504651, 0.3506959, 2.491551, 1, 0, 0.9372549, 1,
0.9640056, 1.843967, 0.7476701, 1, 0, 0.9294118, 1,
0.9758493, -0.9889656, 1.874049, 1, 0, 0.9254902, 1,
0.9800248, -0.8433162, 2.433993, 1, 0, 0.9176471, 1,
0.9802799, 0.6146052, 1.3736, 1, 0, 0.9137255, 1,
0.9836834, 0.584569, -0.3394779, 1, 0, 0.9058824, 1,
0.9845622, 0.5665962, 2.467176, 1, 0, 0.9019608, 1,
0.9927865, 1.567706, 2.041564, 1, 0, 0.8941177, 1,
0.9953762, -0.3889094, 0.4168972, 1, 0, 0.8862745, 1,
0.9970262, -1.752024, 3.640184, 1, 0, 0.8823529, 1,
1.00853, -1.3728, 3.360137, 1, 0, 0.8745098, 1,
1.009498, -0.2698761, 0.7113572, 1, 0, 0.8705882, 1,
1.013912, 0.2713543, 3.108172, 1, 0, 0.8627451, 1,
1.024843, 0.006825161, 2.058901, 1, 0, 0.8588235, 1,
1.02801, -0.625147, 2.572437, 1, 0, 0.8509804, 1,
1.037683, -1.130807, 1.412243, 1, 0, 0.8470588, 1,
1.040469, -0.8647518, 1.866181, 1, 0, 0.8392157, 1,
1.048694, 0.5549484, 0.935414, 1, 0, 0.8352941, 1,
1.066555, -1.083506, 2.745756, 1, 0, 0.827451, 1,
1.078341, 0.4610045, 0.8719848, 1, 0, 0.8235294, 1,
1.079318, -0.8366399, 0.6436383, 1, 0, 0.8156863, 1,
1.082938, 1.276505, 1.016432, 1, 0, 0.8117647, 1,
1.083114, -1.908433, 3.449532, 1, 0, 0.8039216, 1,
1.086596, 1.566281, 0.9956208, 1, 0, 0.7960784, 1,
1.093062, 0.3335456, 1.477743, 1, 0, 0.7921569, 1,
1.098384, 0.3742577, 0.3574437, 1, 0, 0.7843137, 1,
1.108049, -0.9193665, 3.774312, 1, 0, 0.7803922, 1,
1.110415, 1.730481, 1.689494, 1, 0, 0.772549, 1,
1.111555, -2.064871, 2.085051, 1, 0, 0.7686275, 1,
1.119114, 1.665271, 2.479022, 1, 0, 0.7607843, 1,
1.119365, 1.629341, -0.2465275, 1, 0, 0.7568628, 1,
1.122684, 0.3482553, -0.05603928, 1, 0, 0.7490196, 1,
1.125074, 0.5686233, 2.105663, 1, 0, 0.7450981, 1,
1.125533, 0.1403869, -0.5482814, 1, 0, 0.7372549, 1,
1.129916, -0.7401412, 2.226548, 1, 0, 0.7333333, 1,
1.13075, 0.9869801, 0.01424055, 1, 0, 0.7254902, 1,
1.143279, 1.06907, 2.034729, 1, 0, 0.7215686, 1,
1.148415, 1.001002, 1.391102, 1, 0, 0.7137255, 1,
1.14975, -0.7684257, 2.32588, 1, 0, 0.7098039, 1,
1.154597, 0.9196416, 0.7656578, 1, 0, 0.7019608, 1,
1.163017, 0.5716527, 1.571593, 1, 0, 0.6941177, 1,
1.165316, -0.8400077, 1.992273, 1, 0, 0.6901961, 1,
1.167405, 2.02116, 1.523774, 1, 0, 0.682353, 1,
1.168159, -0.2856598, 0.8799369, 1, 0, 0.6784314, 1,
1.183343, 0.0774481, 2.239964, 1, 0, 0.6705883, 1,
1.19009, -0.1288544, 3.808628, 1, 0, 0.6666667, 1,
1.194379, -0.3918428, 0.6864595, 1, 0, 0.6588235, 1,
1.194581, 0.3692794, -0.1022316, 1, 0, 0.654902, 1,
1.19562, -0.4840454, 2.985642, 1, 0, 0.6470588, 1,
1.200463, 0.03634315, 1.794616, 1, 0, 0.6431373, 1,
1.200541, 0.9819382, 0.04849186, 1, 0, 0.6352941, 1,
1.202488, 2.166702, 2.580724, 1, 0, 0.6313726, 1,
1.20535, -0.1759154, 1.729283, 1, 0, 0.6235294, 1,
1.207375, -0.6940404, 2.102339, 1, 0, 0.6196079, 1,
1.208068, -0.2332201, 2.670369, 1, 0, 0.6117647, 1,
1.208954, 0.3261711, 1.524436, 1, 0, 0.6078432, 1,
1.212591, -0.1596904, 1.931118, 1, 0, 0.6, 1,
1.21656, -0.3451653, 1.132306, 1, 0, 0.5921569, 1,
1.217313, 0.3555116, 1.276419, 1, 0, 0.5882353, 1,
1.219524, 2.064345, 0.5149859, 1, 0, 0.5803922, 1,
1.222329, -0.5460062, 2.224338, 1, 0, 0.5764706, 1,
1.222378, 1.702161, 2.559005, 1, 0, 0.5686275, 1,
1.227418, 0.4608753, 0.7467024, 1, 0, 0.5647059, 1,
1.233006, 0.09320197, 1.982489, 1, 0, 0.5568628, 1,
1.243334, -1.364702, 1.955359, 1, 0, 0.5529412, 1,
1.243949, 0.7444128, 3.542945, 1, 0, 0.5450981, 1,
1.245329, 1.093052, -0.5352386, 1, 0, 0.5411765, 1,
1.250721, 1.288156, 1.555937, 1, 0, 0.5333334, 1,
1.2573, -1.134928, 2.757976, 1, 0, 0.5294118, 1,
1.259731, 0.5115327, 1.210695, 1, 0, 0.5215687, 1,
1.261934, 1.140667, -0.2946399, 1, 0, 0.5176471, 1,
1.266056, -0.2715981, 2.273254, 1, 0, 0.509804, 1,
1.273858, -0.192098, 0.7265562, 1, 0, 0.5058824, 1,
1.283185, -0.7643484, 3.176963, 1, 0, 0.4980392, 1,
1.28451, -0.07016409, 1.945448, 1, 0, 0.4901961, 1,
1.284644, -0.9669017, 2.204442, 1, 0, 0.4862745, 1,
1.284965, 0.04851072, 2.029709, 1, 0, 0.4784314, 1,
1.288795, 2.412534, 1.070116, 1, 0, 0.4745098, 1,
1.292494, 0.6736836, 0.6658816, 1, 0, 0.4666667, 1,
1.293211, -0.2401192, 1.242712, 1, 0, 0.4627451, 1,
1.299976, 0.4954585, 0.1940604, 1, 0, 0.454902, 1,
1.30396, -0.513383, 1.84584, 1, 0, 0.4509804, 1,
1.309346, -0.3175891, 3.43738, 1, 0, 0.4431373, 1,
1.316006, 0.7219155, 1.205269, 1, 0, 0.4392157, 1,
1.319873, 0.4529606, 2.208526, 1, 0, 0.4313726, 1,
1.321221, -2.670426, 2.715357, 1, 0, 0.427451, 1,
1.328241, -0.4645205, 2.139426, 1, 0, 0.4196078, 1,
1.335973, 0.5406838, 0.5563965, 1, 0, 0.4156863, 1,
1.345353, 0.5571654, -1.19237, 1, 0, 0.4078431, 1,
1.349538, 0.837652, 1.413998, 1, 0, 0.4039216, 1,
1.377195, -0.2881714, 2.667732, 1, 0, 0.3960784, 1,
1.377362, 0.07170352, 2.02156, 1, 0, 0.3882353, 1,
1.3793, -0.4304577, 1.635365, 1, 0, 0.3843137, 1,
1.397352, 2.653059, 1.041453, 1, 0, 0.3764706, 1,
1.398662, 0.9360661, 0.6414644, 1, 0, 0.372549, 1,
1.424214, -1.378312, 1.986059, 1, 0, 0.3647059, 1,
1.428893, -0.1148574, 0.08580359, 1, 0, 0.3607843, 1,
1.437998, 0.05521962, 2.623837, 1, 0, 0.3529412, 1,
1.444668, 0.06082825, 1.479003, 1, 0, 0.3490196, 1,
1.447696, 0.4591039, 1.964633, 1, 0, 0.3411765, 1,
1.451402, 1.394904, 0.524034, 1, 0, 0.3372549, 1,
1.462511, -0.514183, 4.293373, 1, 0, 0.3294118, 1,
1.48794, -0.4703052, 3.272149, 1, 0, 0.3254902, 1,
1.499746, 0.01822125, 1.298759, 1, 0, 0.3176471, 1,
1.499897, -1.026133, 1.917672, 1, 0, 0.3137255, 1,
1.506317, -0.3913423, 1.846305, 1, 0, 0.3058824, 1,
1.531929, -0.4591652, 0.04974575, 1, 0, 0.2980392, 1,
1.53951, 0.5256838, 0.4937209, 1, 0, 0.2941177, 1,
1.557947, -0.2188577, 0.6796597, 1, 0, 0.2862745, 1,
1.581232, -0.5013857, 0.4461904, 1, 0, 0.282353, 1,
1.603598, -0.907603, 1.270109, 1, 0, 0.2745098, 1,
1.606173, -0.712098, 3.135761, 1, 0, 0.2705882, 1,
1.610397, -0.3842387, 2.673458, 1, 0, 0.2627451, 1,
1.627089, 2.212114, 0.992408, 1, 0, 0.2588235, 1,
1.632993, -1.999355, 4.115846, 1, 0, 0.2509804, 1,
1.634398, 0.9763163, 1.465216, 1, 0, 0.2470588, 1,
1.635897, 0.4278278, 1.770503, 1, 0, 0.2392157, 1,
1.637061, 0.1758277, 0.2028715, 1, 0, 0.2352941, 1,
1.66461, 1.108074, 0.9413704, 1, 0, 0.227451, 1,
1.667183, 0.4279478, -0.4530444, 1, 0, 0.2235294, 1,
1.67043, 1.088353, 1.807962, 1, 0, 0.2156863, 1,
1.702586, 0.5827253, 3.549492, 1, 0, 0.2117647, 1,
1.716649, 0.1555024, 1.552778, 1, 0, 0.2039216, 1,
1.738708, 1.933601, 1.586561, 1, 0, 0.1960784, 1,
1.747822, -0.4098586, 1.789823, 1, 0, 0.1921569, 1,
1.774676, 0.8194318, 1.679114, 1, 0, 0.1843137, 1,
1.817569, 0.05863855, 1.668639, 1, 0, 0.1803922, 1,
1.847203, 0.4324401, 2.383292, 1, 0, 0.172549, 1,
1.865136, -1.7812, 1.847489, 1, 0, 0.1686275, 1,
1.865796, 0.04217622, 3.148441, 1, 0, 0.1607843, 1,
1.868456, -0.1743506, 1.784964, 1, 0, 0.1568628, 1,
1.896305, 0.3996872, 3.10835, 1, 0, 0.1490196, 1,
1.910731, 0.5118562, 3.212016, 1, 0, 0.145098, 1,
1.971934, -0.03565971, 2.901876, 1, 0, 0.1372549, 1,
2.037977, 1.00943, 0.8896397, 1, 0, 0.1333333, 1,
2.05337, -1.242629, 0.4469979, 1, 0, 0.1254902, 1,
2.109527, 1.23788, 2.746927, 1, 0, 0.1215686, 1,
2.120857, -0.3003041, 0.5489554, 1, 0, 0.1137255, 1,
2.138975, 0.7823964, 2.722624, 1, 0, 0.1098039, 1,
2.139616, 1.933325, -0.5867684, 1, 0, 0.1019608, 1,
2.154846, 0.9692532, 0.5241501, 1, 0, 0.09411765, 1,
2.164709, -0.5138207, 2.836286, 1, 0, 0.09019608, 1,
2.176154, -2.038897, 3.236183, 1, 0, 0.08235294, 1,
2.192466, -1.200997, 2.237657, 1, 0, 0.07843138, 1,
2.192809, -0.3148555, 1.253408, 1, 0, 0.07058824, 1,
2.279472, 0.2295767, -0.2150514, 1, 0, 0.06666667, 1,
2.297054, 0.2544886, 1.361498, 1, 0, 0.05882353, 1,
2.374016, -0.8530942, 4.263533, 1, 0, 0.05490196, 1,
2.399068, -1.25289, 2.017954, 1, 0, 0.04705882, 1,
2.426769, 0.7767372, 0.8275563, 1, 0, 0.04313726, 1,
2.485656, -0.3314529, 2.02583, 1, 0, 0.03529412, 1,
2.548472, 0.5688632, 0.6970363, 1, 0, 0.03137255, 1,
2.584339, 0.9429297, 2.051844, 1, 0, 0.02352941, 1,
2.657825, 0.6393201, 1.047803, 1, 0, 0.01960784, 1,
3.092835, 0.4837844, 0.5556649, 1, 0, 0.01176471, 1,
3.165157, 2.676322, 2.318506, 1, 0, 0.007843138, 1
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
0.06110752, -5.02107, -6.683704, 0, -0.5, 0.5, 0.5,
0.06110752, -5.02107, -6.683704, 1, -0.5, 0.5, 0.5,
0.06110752, -5.02107, -6.683704, 1, 1.5, 0.5, 0.5,
0.06110752, -5.02107, -6.683704, 0, 1.5, 0.5, 0.5
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
-4.095214, -0.2143835, -6.683704, 0, -0.5, 0.5, 0.5,
-4.095214, -0.2143835, -6.683704, 1, -0.5, 0.5, 0.5,
-4.095214, -0.2143835, -6.683704, 1, 1.5, 0.5, 0.5,
-4.095214, -0.2143835, -6.683704, 0, 1.5, 0.5, 0.5
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
-4.095214, -5.02107, 0.1300488, 0, -0.5, 0.5, 0.5,
-4.095214, -5.02107, 0.1300488, 1, -0.5, 0.5, 0.5,
-4.095214, -5.02107, 0.1300488, 1, 1.5, 0.5, 0.5,
-4.095214, -5.02107, 0.1300488, 0, 1.5, 0.5, 0.5
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
-3, -3.911835, -5.1113,
3, -3.911835, -5.1113,
-3, -3.911835, -5.1113,
-3, -4.096707, -5.373367,
-2, -3.911835, -5.1113,
-2, -4.096707, -5.373367,
-1, -3.911835, -5.1113,
-1, -4.096707, -5.373367,
0, -3.911835, -5.1113,
0, -4.096707, -5.373367,
1, -3.911835, -5.1113,
1, -4.096707, -5.373367,
2, -3.911835, -5.1113,
2, -4.096707, -5.373367,
3, -3.911835, -5.1113,
3, -4.096707, -5.373367
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
-3, -4.466453, -5.897501, 0, -0.5, 0.5, 0.5,
-3, -4.466453, -5.897501, 1, -0.5, 0.5, 0.5,
-3, -4.466453, -5.897501, 1, 1.5, 0.5, 0.5,
-3, -4.466453, -5.897501, 0, 1.5, 0.5, 0.5,
-2, -4.466453, -5.897501, 0, -0.5, 0.5, 0.5,
-2, -4.466453, -5.897501, 1, -0.5, 0.5, 0.5,
-2, -4.466453, -5.897501, 1, 1.5, 0.5, 0.5,
-2, -4.466453, -5.897501, 0, 1.5, 0.5, 0.5,
-1, -4.466453, -5.897501, 0, -0.5, 0.5, 0.5,
-1, -4.466453, -5.897501, 1, -0.5, 0.5, 0.5,
-1, -4.466453, -5.897501, 1, 1.5, 0.5, 0.5,
-1, -4.466453, -5.897501, 0, 1.5, 0.5, 0.5,
0, -4.466453, -5.897501, 0, -0.5, 0.5, 0.5,
0, -4.466453, -5.897501, 1, -0.5, 0.5, 0.5,
0, -4.466453, -5.897501, 1, 1.5, 0.5, 0.5,
0, -4.466453, -5.897501, 0, 1.5, 0.5, 0.5,
1, -4.466453, -5.897501, 0, -0.5, 0.5, 0.5,
1, -4.466453, -5.897501, 1, -0.5, 0.5, 0.5,
1, -4.466453, -5.897501, 1, 1.5, 0.5, 0.5,
1, -4.466453, -5.897501, 0, 1.5, 0.5, 0.5,
2, -4.466453, -5.897501, 0, -0.5, 0.5, 0.5,
2, -4.466453, -5.897501, 1, -0.5, 0.5, 0.5,
2, -4.466453, -5.897501, 1, 1.5, 0.5, 0.5,
2, -4.466453, -5.897501, 0, 1.5, 0.5, 0.5,
3, -4.466453, -5.897501, 0, -0.5, 0.5, 0.5,
3, -4.466453, -5.897501, 1, -0.5, 0.5, 0.5,
3, -4.466453, -5.897501, 1, 1.5, 0.5, 0.5,
3, -4.466453, -5.897501, 0, 1.5, 0.5, 0.5
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
-3.136063, -2, -5.1113,
-3.136063, 2, -5.1113,
-3.136063, -2, -5.1113,
-3.295922, -2, -5.373367,
-3.136063, 0, -5.1113,
-3.295922, 0, -5.373367,
-3.136063, 2, -5.1113,
-3.295922, 2, -5.373367
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
-3.615639, -2, -5.897501, 0, -0.5, 0.5, 0.5,
-3.615639, -2, -5.897501, 1, -0.5, 0.5, 0.5,
-3.615639, -2, -5.897501, 1, 1.5, 0.5, 0.5,
-3.615639, -2, -5.897501, 0, 1.5, 0.5, 0.5,
-3.615639, 0, -5.897501, 0, -0.5, 0.5, 0.5,
-3.615639, 0, -5.897501, 1, -0.5, 0.5, 0.5,
-3.615639, 0, -5.897501, 1, 1.5, 0.5, 0.5,
-3.615639, 0, -5.897501, 0, 1.5, 0.5, 0.5,
-3.615639, 2, -5.897501, 0, -0.5, 0.5, 0.5,
-3.615639, 2, -5.897501, 1, -0.5, 0.5, 0.5,
-3.615639, 2, -5.897501, 1, 1.5, 0.5, 0.5,
-3.615639, 2, -5.897501, 0, 1.5, 0.5, 0.5
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
-3.136063, -3.911835, -4,
-3.136063, -3.911835, 4,
-3.136063, -3.911835, -4,
-3.295922, -4.096707, -4,
-3.136063, -3.911835, -2,
-3.295922, -4.096707, -2,
-3.136063, -3.911835, 0,
-3.295922, -4.096707, 0,
-3.136063, -3.911835, 2,
-3.295922, -4.096707, 2,
-3.136063, -3.911835, 4,
-3.295922, -4.096707, 4
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
-3.615639, -4.466453, -4, 0, -0.5, 0.5, 0.5,
-3.615639, -4.466453, -4, 1, -0.5, 0.5, 0.5,
-3.615639, -4.466453, -4, 1, 1.5, 0.5, 0.5,
-3.615639, -4.466453, -4, 0, 1.5, 0.5, 0.5,
-3.615639, -4.466453, -2, 0, -0.5, 0.5, 0.5,
-3.615639, -4.466453, -2, 1, -0.5, 0.5, 0.5,
-3.615639, -4.466453, -2, 1, 1.5, 0.5, 0.5,
-3.615639, -4.466453, -2, 0, 1.5, 0.5, 0.5,
-3.615639, -4.466453, 0, 0, -0.5, 0.5, 0.5,
-3.615639, -4.466453, 0, 1, -0.5, 0.5, 0.5,
-3.615639, -4.466453, 0, 1, 1.5, 0.5, 0.5,
-3.615639, -4.466453, 0, 0, 1.5, 0.5, 0.5,
-3.615639, -4.466453, 2, 0, -0.5, 0.5, 0.5,
-3.615639, -4.466453, 2, 1, -0.5, 0.5, 0.5,
-3.615639, -4.466453, 2, 1, 1.5, 0.5, 0.5,
-3.615639, -4.466453, 2, 0, 1.5, 0.5, 0.5,
-3.615639, -4.466453, 4, 0, -0.5, 0.5, 0.5,
-3.615639, -4.466453, 4, 1, -0.5, 0.5, 0.5,
-3.615639, -4.466453, 4, 1, 1.5, 0.5, 0.5,
-3.615639, -4.466453, 4, 0, 1.5, 0.5, 0.5
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
-3.136063, -3.911835, -5.1113,
-3.136063, 3.483068, -5.1113,
-3.136063, -3.911835, 5.371397,
-3.136063, 3.483068, 5.371397,
-3.136063, -3.911835, -5.1113,
-3.136063, -3.911835, 5.371397,
-3.136063, 3.483068, -5.1113,
-3.136063, 3.483068, 5.371397,
-3.136063, -3.911835, -5.1113,
3.258278, -3.911835, -5.1113,
-3.136063, -3.911835, 5.371397,
3.258278, -3.911835, 5.371397,
-3.136063, 3.483068, -5.1113,
3.258278, 3.483068, -5.1113,
-3.136063, 3.483068, 5.371397,
3.258278, 3.483068, 5.371397,
3.258278, -3.911835, -5.1113,
3.258278, 3.483068, -5.1113,
3.258278, -3.911835, 5.371397,
3.258278, 3.483068, 5.371397,
3.258278, -3.911835, -5.1113,
3.258278, -3.911835, 5.371397,
3.258278, 3.483068, -5.1113,
3.258278, 3.483068, 5.371397
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
var radius = 7.653995;
var distance = 34.05349;
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
mvMatrix.translate( -0.06110752, 0.2143835, -0.1300488 );
mvMatrix.scale( 1.294214, 1.119102, 0.7894581 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.05349);
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
benalaxyl<-read.table("benalaxyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benalaxyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'benalaxyl' not found
```

```r
y<-benalaxyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'benalaxyl' not found
```

```r
z<-benalaxyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'benalaxyl' not found
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
-3.042942, 1.546056, -0.9439585, 0, 0, 1, 1, 1,
-2.747479, 1.398253, -0.3344444, 1, 0, 0, 1, 1,
-2.61169, 0.006829132, 0.02123578, 1, 0, 0, 1, 1,
-2.610763, -0.01682086, -1.100662, 1, 0, 0, 1, 1,
-2.609812, 0.02439898, -1.697569, 1, 0, 0, 1, 1,
-2.538727, -0.5853643, -1.049457, 1, 0, 0, 1, 1,
-2.483032, -0.1964199, -2.330918, 0, 0, 0, 1, 1,
-2.431335, 0.508954, -2.313116, 0, 0, 0, 1, 1,
-2.424779, 0.7530705, -2.726785, 0, 0, 0, 1, 1,
-2.395348, 0.3426921, -2.62116, 0, 0, 0, 1, 1,
-2.270533, 0.4310509, -0.6858689, 0, 0, 0, 1, 1,
-2.262334, 0.1475752, -2.00499, 0, 0, 0, 1, 1,
-2.253363, -0.04593299, -1.870123, 0, 0, 0, 1, 1,
-2.24635, -1.015769, -3.760365, 1, 1, 1, 1, 1,
-2.195508, 1.008848, -2.131235, 1, 1, 1, 1, 1,
-2.176456, -0.2483101, -1.142628, 1, 1, 1, 1, 1,
-2.141512, -0.2892448, -2.487802, 1, 1, 1, 1, 1,
-2.106365, 0.6592396, -1.006371, 1, 1, 1, 1, 1,
-2.096353, 2.30268, -1.889806, 1, 1, 1, 1, 1,
-2.090736, -1.142625, -2.835127, 1, 1, 1, 1, 1,
-2.038689, 0.3793052, -1.436772, 1, 1, 1, 1, 1,
-2.023385, 1.17217, 0.1667677, 1, 1, 1, 1, 1,
-2.010019, 0.3221816, -1.296614, 1, 1, 1, 1, 1,
-1.98238, -2.586969, -4.516671, 1, 1, 1, 1, 1,
-1.963194, -0.4200639, -2.415637, 1, 1, 1, 1, 1,
-1.961719, 0.6704222, -2.210969, 1, 1, 1, 1, 1,
-1.95076, -0.03535657, -2.290147, 1, 1, 1, 1, 1,
-1.943658, -0.3140768, -1.553845, 1, 1, 1, 1, 1,
-1.939451, -0.1213033, -0.5638313, 0, 0, 1, 1, 1,
-1.877882, 0.1688152, -1.532947, 1, 0, 0, 1, 1,
-1.868283, -0.2486732, -2.008971, 1, 0, 0, 1, 1,
-1.867645, 1.822526, -1.093281, 1, 0, 0, 1, 1,
-1.859449, -0.1900056, -0.9504341, 1, 0, 0, 1, 1,
-1.853742, -0.2009096, -0.8829186, 1, 0, 0, 1, 1,
-1.840827, -0.8656626, -2.383154, 0, 0, 0, 1, 1,
-1.815255, 0.634082, -1.507681, 0, 0, 0, 1, 1,
-1.807251, 0.3978941, -0.3565184, 0, 0, 0, 1, 1,
-1.805499, 0.8787651, 1.164328, 0, 0, 0, 1, 1,
-1.797773, 0.3919241, 0.9398239, 0, 0, 0, 1, 1,
-1.785768, 0.7106061, -0.5353664, 0, 0, 0, 1, 1,
-1.783792, 0.1117882, -1.90098, 0, 0, 0, 1, 1,
-1.779379, -0.4980941, -2.645844, 1, 1, 1, 1, 1,
-1.778707, -1.402567, -3.37503, 1, 1, 1, 1, 1,
-1.773826, 1.288323, 1.328998, 1, 1, 1, 1, 1,
-1.758665, -1.579656, -2.649661, 1, 1, 1, 1, 1,
-1.74851, 0.01073875, -1.988189, 1, 1, 1, 1, 1,
-1.740313, 0.08956563, -1.231465, 1, 1, 1, 1, 1,
-1.685385, -0.500447, -2.896457, 1, 1, 1, 1, 1,
-1.678718, 1.563479, -1.004805, 1, 1, 1, 1, 1,
-1.678383, -0.7375964, -0.9276845, 1, 1, 1, 1, 1,
-1.663819, 2.054228, -0.05437153, 1, 1, 1, 1, 1,
-1.660626, -0.7306063, -1.368046, 1, 1, 1, 1, 1,
-1.657558, 0.3550234, -0.7692253, 1, 1, 1, 1, 1,
-1.640706, -1.241704, -2.880008, 1, 1, 1, 1, 1,
-1.636341, 0.5379938, -1.367617, 1, 1, 1, 1, 1,
-1.62822, -1.110904, -3.153203, 1, 1, 1, 1, 1,
-1.625308, -0.9542556, -2.20081, 0, 0, 1, 1, 1,
-1.618053, 0.9687282, -0.5585602, 1, 0, 0, 1, 1,
-1.595731, 0.456856, -0.4908555, 1, 0, 0, 1, 1,
-1.577302, 0.4346359, -2.435943, 1, 0, 0, 1, 1,
-1.5761, -0.03301569, -0.2053205, 1, 0, 0, 1, 1,
-1.574724, 1.948868, 0.08921188, 1, 0, 0, 1, 1,
-1.566113, 0.4393479, -2.519372, 0, 0, 0, 1, 1,
-1.545011, 0.3620725, -0.238476, 0, 0, 0, 1, 1,
-1.537853, 1.230062, -1.811663, 0, 0, 0, 1, 1,
-1.507713, -0.4297625, -4.958639, 0, 0, 0, 1, 1,
-1.501548, 0.3765525, -2.199803, 0, 0, 0, 1, 1,
-1.493988, 0.694319, -1.023247, 0, 0, 0, 1, 1,
-1.493533, -0.3382301, -0.1216933, 0, 0, 0, 1, 1,
-1.491415, -1.753287, -3.384751, 1, 1, 1, 1, 1,
-1.486976, -0.4692346, -1.771187, 1, 1, 1, 1, 1,
-1.477403, -1.12005, -1.684789, 1, 1, 1, 1, 1,
-1.469097, -0.108669, -3.007538, 1, 1, 1, 1, 1,
-1.46695, 1.430532, -1.4616, 1, 1, 1, 1, 1,
-1.450941, -0.726583, -1.99609, 1, 1, 1, 1, 1,
-1.420637, -1.799877, -2.818578, 1, 1, 1, 1, 1,
-1.417551, -0.5020176, -2.270136, 1, 1, 1, 1, 1,
-1.410159, -0.9487594, -2.342069, 1, 1, 1, 1, 1,
-1.401222, -0.5855264, -2.091698, 1, 1, 1, 1, 1,
-1.392177, -0.5476396, -1.88889, 1, 1, 1, 1, 1,
-1.383604, 1.513724, -1.06169, 1, 1, 1, 1, 1,
-1.369164, 0.3073646, -0.5667338, 1, 1, 1, 1, 1,
-1.359624, 0.4276597, -2.862021, 1, 1, 1, 1, 1,
-1.356653, 0.9588394, -0.1183645, 1, 1, 1, 1, 1,
-1.352908, -0.2754481, -0.6233489, 0, 0, 1, 1, 1,
-1.350072, -0.1764986, -1.939741, 1, 0, 0, 1, 1,
-1.348636, 0.1344381, -1.083597, 1, 0, 0, 1, 1,
-1.343411, -0.5874783, -2.614478, 1, 0, 0, 1, 1,
-1.341145, -0.1961267, -2.796475, 1, 0, 0, 1, 1,
-1.335905, -1.8131, -2.45618, 1, 0, 0, 1, 1,
-1.331949, 0.7100504, -1.452778, 0, 0, 0, 1, 1,
-1.306323, 0.3363953, -0.9962947, 0, 0, 0, 1, 1,
-1.278154, -0.5128909, -2.694494, 0, 0, 0, 1, 1,
-1.274263, 0.01309317, -1.639791, 0, 0, 0, 1, 1,
-1.270564, -0.481196, -0.5941231, 0, 0, 0, 1, 1,
-1.270301, -0.06934398, -0.6525029, 0, 0, 0, 1, 1,
-1.267366, 1.723079, -0.04712094, 0, 0, 0, 1, 1,
-1.258271, 1.075001, -1.357279, 1, 1, 1, 1, 1,
-1.25704, 0.7666193, 0.7530576, 1, 1, 1, 1, 1,
-1.254919, 0.3552927, -1.240512, 1, 1, 1, 1, 1,
-1.250157, -1.18236, -1.498665, 1, 1, 1, 1, 1,
-1.24692, 1.225455, -2.243833, 1, 1, 1, 1, 1,
-1.245614, 0.3642295, -0.8161018, 1, 1, 1, 1, 1,
-1.243417, 2.038318, -2.16377, 1, 1, 1, 1, 1,
-1.24169, -0.4092172, -1.328054, 1, 1, 1, 1, 1,
-1.237884, 0.2587664, -3.044239, 1, 1, 1, 1, 1,
-1.235852, 1.30064, -2.350595, 1, 1, 1, 1, 1,
-1.230175, 0.7593855, -1.043246, 1, 1, 1, 1, 1,
-1.216763, -0.006476319, -1.531735, 1, 1, 1, 1, 1,
-1.206016, -0.4434974, -1.500011, 1, 1, 1, 1, 1,
-1.196394, 1.506149, -0.6963159, 1, 1, 1, 1, 1,
-1.19492, -0.05329507, -2.392911, 1, 1, 1, 1, 1,
-1.194883, 0.7345572, -1.797234, 0, 0, 1, 1, 1,
-1.190607, -2.424826, -3.826271, 1, 0, 0, 1, 1,
-1.177822, -0.9633209, -3.06168, 1, 0, 0, 1, 1,
-1.170668, 0.0291835, -1.080965, 1, 0, 0, 1, 1,
-1.167259, 0.852966, -1.34029, 1, 0, 0, 1, 1,
-1.166072, 0.840616, 0.2936098, 1, 0, 0, 1, 1,
-1.161655, -0.5351628, -2.082304, 0, 0, 0, 1, 1,
-1.160634, 1.022067, -0.8631452, 0, 0, 0, 1, 1,
-1.154995, 0.2203773, -1.93349, 0, 0, 0, 1, 1,
-1.153566, 0.6358097, -2.061735, 0, 0, 0, 1, 1,
-1.145246, 0.8407392, -0.1510319, 0, 0, 0, 1, 1,
-1.142436, 0.321287, -2.556155, 0, 0, 0, 1, 1,
-1.142136, -1.151578, -2.586988, 0, 0, 0, 1, 1,
-1.140351, -0.1537337, -0.3741748, 1, 1, 1, 1, 1,
-1.138972, 1.314999, -0.8696128, 1, 1, 1, 1, 1,
-1.138837, -0.265597, -1.302452, 1, 1, 1, 1, 1,
-1.134311, 1.624557, -2.357912, 1, 1, 1, 1, 1,
-1.120508, -1.003766, -3.502434, 1, 1, 1, 1, 1,
-1.116962, -0.9602179, -0.2488074, 1, 1, 1, 1, 1,
-1.107699, -0.3747719, -2.304552, 1, 1, 1, 1, 1,
-1.101109, 0.4954818, -2.83417, 1, 1, 1, 1, 1,
-1.098665, 1.61268, -0.1942509, 1, 1, 1, 1, 1,
-1.096896, 1.592744, -1.235035, 1, 1, 1, 1, 1,
-1.096625, 0.6301426, -1.430906, 1, 1, 1, 1, 1,
-1.095662, -0.02173984, -0.4776201, 1, 1, 1, 1, 1,
-1.091, -0.4180435, -0.1639863, 1, 1, 1, 1, 1,
-1.082604, 1.544656, -0.1217579, 1, 1, 1, 1, 1,
-1.070946, -0.1974461, -3.415218, 1, 1, 1, 1, 1,
-1.069144, 0.395946, -2.192652, 0, 0, 1, 1, 1,
-1.061097, -2.096712, -3.638946, 1, 0, 0, 1, 1,
-1.055146, -0.1766527, -0.8816539, 1, 0, 0, 1, 1,
-1.055021, 0.09388137, 1.191921, 1, 0, 0, 1, 1,
-1.050207, -0.554244, -2.195725, 1, 0, 0, 1, 1,
-1.039674, -0.2224985, -1.066389, 1, 0, 0, 1, 1,
-1.028628, 2.199659, -2.014353, 0, 0, 0, 1, 1,
-1.02857, -0.7010828, -2.123536, 0, 0, 0, 1, 1,
-1.021491, 1.684413, -0.4460871, 0, 0, 0, 1, 1,
-1.019527, 0.3826427, -1.170822, 0, 0, 0, 1, 1,
-1.019161, 0.06089733, -0.7067882, 0, 0, 0, 1, 1,
-1.014317, 1.267936, 0.3316184, 0, 0, 0, 1, 1,
-1.001222, 1.05476, -0.3141211, 0, 0, 0, 1, 1,
-1.00094, 0.0508632, -0.08689333, 1, 1, 1, 1, 1,
-0.998457, -0.285015, -0.8030586, 1, 1, 1, 1, 1,
-0.9974088, 1.728555, -3.831739, 1, 1, 1, 1, 1,
-0.9967674, -1.262807, -1.635734, 1, 1, 1, 1, 1,
-0.9966556, -0.5450912, -2.519809, 1, 1, 1, 1, 1,
-0.9925075, 1.525483, 0.06881955, 1, 1, 1, 1, 1,
-0.9924403, 1.110923, 1.911136, 1, 1, 1, 1, 1,
-0.9862983, 0.2446484, -3.334742, 1, 1, 1, 1, 1,
-0.9833792, -2.149294, -3.057188, 1, 1, 1, 1, 1,
-0.9695829, -1.226698, -1.389416, 1, 1, 1, 1, 1,
-0.9683643, 1.201409, -1.388878, 1, 1, 1, 1, 1,
-0.9640802, -0.2908621, -1.723563, 1, 1, 1, 1, 1,
-0.9622022, 1.091969, -0.2373468, 1, 1, 1, 1, 1,
-0.9599128, -0.7149617, -3.245527, 1, 1, 1, 1, 1,
-0.9595406, -1.050762, -2.616947, 1, 1, 1, 1, 1,
-0.9491191, -0.118612, -1.831761, 0, 0, 1, 1, 1,
-0.9406425, 0.5657645, -2.951622, 1, 0, 0, 1, 1,
-0.9404198, -0.2785366, -2.107496, 1, 0, 0, 1, 1,
-0.917322, -1.431854, -3.121175, 1, 0, 0, 1, 1,
-0.9098117, -0.1020051, -3.154569, 1, 0, 0, 1, 1,
-0.9050186, -0.7448997, -2.95966, 1, 0, 0, 1, 1,
-0.9043503, -0.3026881, -0.3994251, 0, 0, 0, 1, 1,
-0.8993689, 1.161367, 0.04847217, 0, 0, 0, 1, 1,
-0.8957629, -0.3683778, -0.2185418, 0, 0, 0, 1, 1,
-0.894602, -0.1930031, -3.020885, 0, 0, 0, 1, 1,
-0.8869122, -0.6674086, -2.743482, 0, 0, 0, 1, 1,
-0.8773618, -0.1429, -1.345985, 0, 0, 0, 1, 1,
-0.8730058, 0.1382625, -1.510301, 0, 0, 0, 1, 1,
-0.8707776, 1.018875, -0.5725982, 1, 1, 1, 1, 1,
-0.8702911, -1.394418, -3.951652, 1, 1, 1, 1, 1,
-0.8695196, 0.08803975, -1.733681, 1, 1, 1, 1, 1,
-0.8681355, -0.751272, -4.297532, 1, 1, 1, 1, 1,
-0.8561561, -1.387545, -3.630475, 1, 1, 1, 1, 1,
-0.8539304, 0.2168691, -1.327792, 1, 1, 1, 1, 1,
-0.8515245, -0.5540451, -1.704065, 1, 1, 1, 1, 1,
-0.8394774, -0.4883297, -2.018569, 1, 1, 1, 1, 1,
-0.8338464, -2.199458, -1.849587, 1, 1, 1, 1, 1,
-0.8336064, -0.6428193, -2.847903, 1, 1, 1, 1, 1,
-0.8292171, 0.7486967, 0.7173801, 1, 1, 1, 1, 1,
-0.8281929, 0.9229141, -1.291363, 1, 1, 1, 1, 1,
-0.8256627, -0.8873156, -3.868555, 1, 1, 1, 1, 1,
-0.8245201, -0.253182, -3.291511, 1, 1, 1, 1, 1,
-0.8243058, -0.9956524, -3.70006, 1, 1, 1, 1, 1,
-0.819128, 0.670592, -0.0391311, 0, 0, 1, 1, 1,
-0.813846, -0.6178751, -2.57969, 1, 0, 0, 1, 1,
-0.8035716, -0.5095928, -2.897405, 1, 0, 0, 1, 1,
-0.8002469, -1.729851, -3.097823, 1, 0, 0, 1, 1,
-0.7981402, 0.2908587, 0.02173091, 1, 0, 0, 1, 1,
-0.7947973, -1.02758, -2.321238, 1, 0, 0, 1, 1,
-0.7903988, -1.144635, -2.673803, 0, 0, 0, 1, 1,
-0.7882668, -0.2172235, 0.4822345, 0, 0, 0, 1, 1,
-0.7873577, 2.253998, 0.4889219, 0, 0, 0, 1, 1,
-0.786912, 0.828241, -0.9488989, 0, 0, 0, 1, 1,
-0.7867134, 0.7420906, -0.5608953, 0, 0, 0, 1, 1,
-0.7818052, -1.263842, -2.19503, 0, 0, 0, 1, 1,
-0.7814018, -0.6059394, -2.058039, 0, 0, 0, 1, 1,
-0.7802504, 0.01162199, -3.805962, 1, 1, 1, 1, 1,
-0.7788152, -1.06729, -2.79691, 1, 1, 1, 1, 1,
-0.7729421, 0.9988486, -2.311285, 1, 1, 1, 1, 1,
-0.7695524, -1.299885, -2.47808, 1, 1, 1, 1, 1,
-0.7688161, -0.2828656, -2.449769, 1, 1, 1, 1, 1,
-0.7653168, -0.4272431, -1.37365, 1, 1, 1, 1, 1,
-0.7628184, -2.100452, -1.917943, 1, 1, 1, 1, 1,
-0.7567663, 0.7655342, -1.020256, 1, 1, 1, 1, 1,
-0.7541667, 0.8739289, -1.03255, 1, 1, 1, 1, 1,
-0.7486615, -1.42907, -0.8985351, 1, 1, 1, 1, 1,
-0.7334195, 1.214466, 0.6340328, 1, 1, 1, 1, 1,
-0.7307256, -1.155435, -1.871312, 1, 1, 1, 1, 1,
-0.7240337, -0.6074061, -2.718461, 1, 1, 1, 1, 1,
-0.7197441, 0.4806372, -1.501588, 1, 1, 1, 1, 1,
-0.7151127, -0.2220281, -3.092554, 1, 1, 1, 1, 1,
-0.7087263, 0.4961939, -1.475989, 0, 0, 1, 1, 1,
-0.7086734, -1.1771, -3.115458, 1, 0, 0, 1, 1,
-0.706048, -0.7364065, -0.6652406, 1, 0, 0, 1, 1,
-0.6996638, -1.361588, -3.291551, 1, 0, 0, 1, 1,
-0.6955055, -0.03193521, -0.4773576, 1, 0, 0, 1, 1,
-0.6943163, 1.204199, -1.118086, 1, 0, 0, 1, 1,
-0.6901112, 0.8328979, -1.812144, 0, 0, 0, 1, 1,
-0.6888441, 1.964959, 0.3143015, 0, 0, 0, 1, 1,
-0.6861499, 0.4324314, -1.083116, 0, 0, 0, 1, 1,
-0.6789619, -1.384618, -3.96137, 0, 0, 0, 1, 1,
-0.6773823, -1.189983, -3.749279, 0, 0, 0, 1, 1,
-0.677366, -1.373988, -2.822895, 0, 0, 0, 1, 1,
-0.6771339, -1.17532, -2.201533, 0, 0, 0, 1, 1,
-0.6743289, 0.8925918, -0.8964167, 1, 1, 1, 1, 1,
-0.6741622, 1.614524, -0.2207481, 1, 1, 1, 1, 1,
-0.6724994, -0.3850863, -0.6995182, 1, 1, 1, 1, 1,
-0.6711648, -1.63906, -2.376071, 1, 1, 1, 1, 1,
-0.6708872, 0.2450599, -2.897229, 1, 1, 1, 1, 1,
-0.6677798, -0.1021137, -2.550828, 1, 1, 1, 1, 1,
-0.6669471, -1.287609, -1.665537, 1, 1, 1, 1, 1,
-0.6613711, 1.219647, 0.3090861, 1, 1, 1, 1, 1,
-0.6601604, 0.9975755, -0.02842198, 1, 1, 1, 1, 1,
-0.6600189, 1.331732, 0.007503795, 1, 1, 1, 1, 1,
-0.6491325, 1.01117, -3.627622, 1, 1, 1, 1, 1,
-0.6424403, -2.064131, -2.752371, 1, 1, 1, 1, 1,
-0.6419398, 1.759257, -1.425095, 1, 1, 1, 1, 1,
-0.635749, 0.8260885, 0.7128175, 1, 1, 1, 1, 1,
-0.6303183, -0.1444297, -0.2162445, 1, 1, 1, 1, 1,
-0.6301492, 1.214524, -1.555312, 0, 0, 1, 1, 1,
-0.6279473, -0.5755144, -4.061609, 1, 0, 0, 1, 1,
-0.6261526, 1.4798, -0.6975158, 1, 0, 0, 1, 1,
-0.6250222, -0.9497837, -2.601776, 1, 0, 0, 1, 1,
-0.6224243, 1.560772, -0.5204425, 1, 0, 0, 1, 1,
-0.6158722, -1.167876, -1.270953, 1, 0, 0, 1, 1,
-0.6107913, 0.2697957, -0.7959437, 0, 0, 0, 1, 1,
-0.6053562, 1.163012, 0.486634, 0, 0, 0, 1, 1,
-0.6045951, 0.6291324, -0.3923877, 0, 0, 0, 1, 1,
-0.6021133, -0.2825769, -2.035007, 0, 0, 0, 1, 1,
-0.599632, -1.764278, -2.051919, 0, 0, 0, 1, 1,
-0.5927758, 2.086936, 1.372372, 0, 0, 0, 1, 1,
-0.5881616, 1.144085, -2.095479, 0, 0, 0, 1, 1,
-0.5838888, -1.083708, -3.718425, 1, 1, 1, 1, 1,
-0.5816303, -0.1381857, -2.103492, 1, 1, 1, 1, 1,
-0.5731161, 2.082563, -1.360122, 1, 1, 1, 1, 1,
-0.5704179, 0.9760864, 0.7577175, 1, 1, 1, 1, 1,
-0.5694072, 0.8631551, -0.1842857, 1, 1, 1, 1, 1,
-0.5686364, -0.5790356, -1.407695, 1, 1, 1, 1, 1,
-0.5672464, 2.329298, -1.01663, 1, 1, 1, 1, 1,
-0.5587505, 1.22641, -0.6830655, 1, 1, 1, 1, 1,
-0.5568961, 1.000879, -0.465379, 1, 1, 1, 1, 1,
-0.5553082, -0.1805148, -0.7971468, 1, 1, 1, 1, 1,
-0.5549906, 1.227397, 0.1516882, 1, 1, 1, 1, 1,
-0.5523541, 0.4721448, -0.8165637, 1, 1, 1, 1, 1,
-0.5494821, -0.1610215, -2.335009, 1, 1, 1, 1, 1,
-0.5478666, -1.168363, -2.966563, 1, 1, 1, 1, 1,
-0.5471107, 0.2173384, -0.4731704, 1, 1, 1, 1, 1,
-0.5410639, 0.8098078, -0.4353169, 0, 0, 1, 1, 1,
-0.5322046, -0.1087404, -1.77573, 1, 0, 0, 1, 1,
-0.5316922, 1.520869, 0.4783753, 1, 0, 0, 1, 1,
-0.5297778, -0.1952329, -1.971008, 1, 0, 0, 1, 1,
-0.528057, 0.9476044, -1.100306, 1, 0, 0, 1, 1,
-0.5257382, -0.1590808, -2.072944, 1, 0, 0, 1, 1,
-0.517754, -0.06777889, -1.614636, 0, 0, 0, 1, 1,
-0.5158934, -0.1250009, -2.073132, 0, 0, 0, 1, 1,
-0.5138234, 0.4370221, 1.086673, 0, 0, 0, 1, 1,
-0.5131278, -0.8102653, -2.920647, 0, 0, 0, 1, 1,
-0.507708, -0.5031482, -0.8411608, 0, 0, 0, 1, 1,
-0.507011, -1.147228, -3.427469, 0, 0, 0, 1, 1,
-0.5053768, -1.1207, -3.148772, 0, 0, 0, 1, 1,
-0.5037801, -0.7245914, -2.275073, 1, 1, 1, 1, 1,
-0.5018019, 0.07002974, -1.972859, 1, 1, 1, 1, 1,
-0.5013808, -0.1673677, -2.621614, 1, 1, 1, 1, 1,
-0.4949954, 0.4686606, -1.029977, 1, 1, 1, 1, 1,
-0.4924399, 0.3477514, -1.489734, 1, 1, 1, 1, 1,
-0.4890645, 0.9943217, 0.2921234, 1, 1, 1, 1, 1,
-0.4823007, -1.015406, -2.76895, 1, 1, 1, 1, 1,
-0.4804243, -1.025758, -4.454732, 1, 1, 1, 1, 1,
-0.4699952, -0.1319156, -2.276982, 1, 1, 1, 1, 1,
-0.4689884, 0.3729936, -1.19463, 1, 1, 1, 1, 1,
-0.4670249, 1.034969, -1.483498, 1, 1, 1, 1, 1,
-0.4662997, -0.1411982, -3.031162, 1, 1, 1, 1, 1,
-0.4659235, -1.047802, -1.747436, 1, 1, 1, 1, 1,
-0.464974, -0.05040177, -1.844422, 1, 1, 1, 1, 1,
-0.4643213, 0.07593825, -1.803984, 1, 1, 1, 1, 1,
-0.4637117, 0.3415717, -0.1585538, 0, 0, 1, 1, 1,
-0.4627578, -1.038804, -2.78611, 1, 0, 0, 1, 1,
-0.4626995, 0.3107117, -0.04885938, 1, 0, 0, 1, 1,
-0.4598009, 0.4610163, 0.02208242, 1, 0, 0, 1, 1,
-0.4595401, -1.021272, -3.156126, 1, 0, 0, 1, 1,
-0.4572864, 0.1616496, -0.9155809, 1, 0, 0, 1, 1,
-0.4558982, -1.480183, -1.394807, 0, 0, 0, 1, 1,
-0.4522655, 0.08739146, -0.9396974, 0, 0, 0, 1, 1,
-0.4513882, 0.6881497, -0.8911012, 0, 0, 0, 1, 1,
-0.4471244, 0.7567914, -1.13816, 0, 0, 0, 1, 1,
-0.4367652, 1.261595, -0.2116062, 0, 0, 0, 1, 1,
-0.4310983, 0.9320518, 0.592209, 0, 0, 0, 1, 1,
-0.4242885, -1.295249, -1.263125, 0, 0, 0, 1, 1,
-0.421433, -1.865764, -1.930151, 1, 1, 1, 1, 1,
-0.4166181, -1.080195, -1.682285, 1, 1, 1, 1, 1,
-0.4133208, -0.9667808, -1.633463, 1, 1, 1, 1, 1,
-0.4131514, 0.133769, -1.629222, 1, 1, 1, 1, 1,
-0.4123074, -0.7636513, -2.18255, 1, 1, 1, 1, 1,
-0.4117602, -2.115571, -4.687391, 1, 1, 1, 1, 1,
-0.4101059, -0.2529081, -2.966798, 1, 1, 1, 1, 1,
-0.4078955, 0.9949083, -1.492558, 1, 1, 1, 1, 1,
-0.4065061, -0.5532854, -2.513419, 1, 1, 1, 1, 1,
-0.4040325, 1.293865, -0.7171735, 1, 1, 1, 1, 1,
-0.4021935, 1.544789, -0.93729, 1, 1, 1, 1, 1,
-0.4016879, 0.5471178, 0.002150203, 1, 1, 1, 1, 1,
-0.3977914, -0.2337322, -2.553513, 1, 1, 1, 1, 1,
-0.3974679, 0.6302867, 0.2475616, 1, 1, 1, 1, 1,
-0.397289, 0.8251525, -0.7905079, 1, 1, 1, 1, 1,
-0.3964539, 1.982366, -0.8481975, 0, 0, 1, 1, 1,
-0.3954427, -0.962993, -2.599512, 1, 0, 0, 1, 1,
-0.394621, -2.369704, -2.781697, 1, 0, 0, 1, 1,
-0.3921775, -0.6278052, -2.158056, 1, 0, 0, 1, 1,
-0.3893003, 0.1125323, -1.511485, 1, 0, 0, 1, 1,
-0.387558, -1.339194, -2.578729, 1, 0, 0, 1, 1,
-0.3843343, 0.2648433, -1.712497, 0, 0, 0, 1, 1,
-0.3833807, -0.9492002, -3.093333, 0, 0, 0, 1, 1,
-0.3792311, 0.441954, -1.335151, 0, 0, 0, 1, 1,
-0.3709166, -0.6763973, -4.139837, 0, 0, 0, 1, 1,
-0.3688915, 0.3490953, -1.565922, 0, 0, 0, 1, 1,
-0.3633009, 0.9879271, -0.8513546, 0, 0, 0, 1, 1,
-0.3618054, 0.7068701, -0.1254118, 0, 0, 0, 1, 1,
-0.3594693, 0.1387151, -1.583052, 1, 1, 1, 1, 1,
-0.3574765, 0.1337176, -1.9953, 1, 1, 1, 1, 1,
-0.3552043, -0.2633472, -2.284352, 1, 1, 1, 1, 1,
-0.3518174, -0.4326167, -3.624382, 1, 1, 1, 1, 1,
-0.3453496, 0.3267504, -0.8353289, 1, 1, 1, 1, 1,
-0.3439443, -0.5755975, -2.421774, 1, 1, 1, 1, 1,
-0.3388615, 0.4450916, -2.942285, 1, 1, 1, 1, 1,
-0.3379979, -0.2932602, -3.102044, 1, 1, 1, 1, 1,
-0.3357438, -1.561352, -1.006123, 1, 1, 1, 1, 1,
-0.3341776, -0.4323121, -4.433822, 1, 1, 1, 1, 1,
-0.3320334, -0.9119579, -2.973583, 1, 1, 1, 1, 1,
-0.33016, 0.11903, -2.457465, 1, 1, 1, 1, 1,
-0.3299662, 0.1119613, -1.587867, 1, 1, 1, 1, 1,
-0.322884, -0.6128287, -1.201132, 1, 1, 1, 1, 1,
-0.3214381, -1.66071, -3.317734, 1, 1, 1, 1, 1,
-0.3170561, -0.7804158, -3.599881, 0, 0, 1, 1, 1,
-0.3138029, -0.7143672, -2.914472, 1, 0, 0, 1, 1,
-0.3133657, 0.116075, -2.794644, 1, 0, 0, 1, 1,
-0.3105596, 0.02642729, -1.607508, 1, 0, 0, 1, 1,
-0.3090507, 1.748782, 0.3365885, 1, 0, 0, 1, 1,
-0.3069645, -0.4058129, -4.176053, 1, 0, 0, 1, 1,
-0.3068012, -0.0290928, -3.432394, 0, 0, 0, 1, 1,
-0.3038368, 0.710903, -0.4209226, 0, 0, 0, 1, 1,
-0.3035904, -0.4451703, -2.09242, 0, 0, 0, 1, 1,
-0.3021251, -0.9321602, -1.612725, 0, 0, 0, 1, 1,
-0.3005674, -1.021198, -3.152919, 0, 0, 0, 1, 1,
-0.2989076, 0.4651423, -1.083243, 0, 0, 0, 1, 1,
-0.2985325, -0.3721488, -3.463362, 0, 0, 0, 1, 1,
-0.2971591, 0.4565169, -1.665144, 1, 1, 1, 1, 1,
-0.2966686, 1.013863, -1.172257, 1, 1, 1, 1, 1,
-0.2956007, -0.3708734, -1.486499, 1, 1, 1, 1, 1,
-0.2938429, 0.152172, -0.5926231, 1, 1, 1, 1, 1,
-0.2928708, -0.6578138, -1.175195, 1, 1, 1, 1, 1,
-0.2921628, 1.088223, -0.9005452, 1, 1, 1, 1, 1,
-0.2853513, -0.9714938, -2.513708, 1, 1, 1, 1, 1,
-0.2851928, -1.476233, -4.399517, 1, 1, 1, 1, 1,
-0.2815284, 0.8967333, -1.789794, 1, 1, 1, 1, 1,
-0.2808327, -0.3388341, -3.514473, 1, 1, 1, 1, 1,
-0.2798949, -0.2417848, -0.2286258, 1, 1, 1, 1, 1,
-0.2739421, -1.353612, -4.137001, 1, 1, 1, 1, 1,
-0.2734403, -0.5492567, -2.901531, 1, 1, 1, 1, 1,
-0.2713554, 0.5621803, 1.22947, 1, 1, 1, 1, 1,
-0.269887, -1.197661, -2.898365, 1, 1, 1, 1, 1,
-0.2683457, 1.016872, -2.398106, 0, 0, 1, 1, 1,
-0.267956, 0.05318594, -0.4797882, 1, 0, 0, 1, 1,
-0.2625197, -0.335749, -2.584718, 1, 0, 0, 1, 1,
-0.2589103, 1.519806, -3.93843, 1, 0, 0, 1, 1,
-0.2556501, 0.889956, 0.3539886, 1, 0, 0, 1, 1,
-0.2500791, -0.364565, -2.050192, 1, 0, 0, 1, 1,
-0.2484981, -3.804142, -3.417423, 0, 0, 0, 1, 1,
-0.2484694, -0.3288374, -3.672212, 0, 0, 0, 1, 1,
-0.2478525, 0.2442802, -0.9008526, 0, 0, 0, 1, 1,
-0.2455282, -1.573766, -3.054324, 0, 0, 0, 1, 1,
-0.2405541, 1.629152, 0.3712148, 0, 0, 0, 1, 1,
-0.2403494, -0.3320926, -2.148243, 0, 0, 0, 1, 1,
-0.2394816, -0.6322649, -4.796555, 0, 0, 0, 1, 1,
-0.2380015, 0.9954336, -1.555033, 1, 1, 1, 1, 1,
-0.2369869, 1.049514, -0.7123968, 1, 1, 1, 1, 1,
-0.2344411, -0.2355351, -2.369191, 1, 1, 1, 1, 1,
-0.233902, 0.6219746, -2.094852, 1, 1, 1, 1, 1,
-0.229918, 0.8746668, 2.35386, 1, 1, 1, 1, 1,
-0.2228385, -1.594025, -4.177686, 1, 1, 1, 1, 1,
-0.2217969, -2.038949, -1.088163, 1, 1, 1, 1, 1,
-0.2215482, 1.143107, -0.1276497, 1, 1, 1, 1, 1,
-0.2165263, 1.250887, -1.091919, 1, 1, 1, 1, 1,
-0.2138613, 0.5171967, 0.5965487, 1, 1, 1, 1, 1,
-0.2136276, 1.091459, -0.03568353, 1, 1, 1, 1, 1,
-0.2130572, -0.7108349, -0.8839162, 1, 1, 1, 1, 1,
-0.212395, 3.375375, 0.8441508, 1, 1, 1, 1, 1,
-0.2102978, -0.2055649, -3.050509, 1, 1, 1, 1, 1,
-0.2101723, 0.1156555, 0.3653446, 1, 1, 1, 1, 1,
-0.2092674, 0.2592489, -0.3737539, 0, 0, 1, 1, 1,
-0.2084318, 0.8836344, 0.6549595, 1, 0, 0, 1, 1,
-0.2064544, -0.6883873, -1.724754, 1, 0, 0, 1, 1,
-0.2037732, -0.9464883, -3.293207, 1, 0, 0, 1, 1,
-0.2034207, 0.7495446, 1.270302, 1, 0, 0, 1, 1,
-0.2030612, -0.1949814, -2.017467, 1, 0, 0, 1, 1,
-0.2028292, -1.182737, -1.579212, 0, 0, 0, 1, 1,
-0.2002402, -0.5605255, -3.727326, 0, 0, 0, 1, 1,
-0.1950728, 0.7413085, -0.4903922, 0, 0, 0, 1, 1,
-0.1936362, -1.05035, -4.148073, 0, 0, 0, 1, 1,
-0.1908673, -1.660508, -2.427816, 0, 0, 0, 1, 1,
-0.1895138, -1.309746, -2.152075, 0, 0, 0, 1, 1,
-0.1892384, -0.1086228, -2.875053, 0, 0, 0, 1, 1,
-0.1883407, -0.2729325, -2.041763, 1, 1, 1, 1, 1,
-0.1883381, 0.7751791, -0.8045362, 1, 1, 1, 1, 1,
-0.1811885, -0.110494, -1.25564, 1, 1, 1, 1, 1,
-0.1797152, -0.1104428, -1.817632, 1, 1, 1, 1, 1,
-0.1790205, 0.0888503, -2.73769, 1, 1, 1, 1, 1,
-0.1716929, 0.6793172, 0.1091094, 1, 1, 1, 1, 1,
-0.1673633, 0.4526696, -0.7799181, 1, 1, 1, 1, 1,
-0.1659912, -1.616783, -2.025044, 1, 1, 1, 1, 1,
-0.16359, -0.7078324, -2.214719, 1, 1, 1, 1, 1,
-0.1634424, -0.08955335, -0.5782982, 1, 1, 1, 1, 1,
-0.1630133, -0.3826917, -4.134978, 1, 1, 1, 1, 1,
-0.1619225, -0.7158685, -1.951535, 1, 1, 1, 1, 1,
-0.1594524, -0.9798623, -2.574532, 1, 1, 1, 1, 1,
-0.1564309, 1.249808, -0.4004587, 1, 1, 1, 1, 1,
-0.1536389, -1.450583, -3.903939, 1, 1, 1, 1, 1,
-0.1518464, 0.7147118, 0.3084712, 0, 0, 1, 1, 1,
-0.1491353, 0.01467441, -3.448532, 1, 0, 0, 1, 1,
-0.1454666, 0.4156398, -2.703239, 1, 0, 0, 1, 1,
-0.1423196, 1.015977, -0.7628352, 1, 0, 0, 1, 1,
-0.1420112, 1.137551, -0.5646399, 1, 0, 0, 1, 1,
-0.140959, -0.4348445, -2.344657, 1, 0, 0, 1, 1,
-0.139138, -1.448475, -3.726326, 0, 0, 0, 1, 1,
-0.1390691, -2.214231, -2.859705, 0, 0, 0, 1, 1,
-0.13625, -0.1301233, -1.293692, 0, 0, 0, 1, 1,
-0.1299299, 1.342275, -2.469068, 0, 0, 0, 1, 1,
-0.1270618, -1.28364, -2.766912, 0, 0, 0, 1, 1,
-0.1255152, -1.019078, -4.670574, 0, 0, 0, 1, 1,
-0.1176155, 2.278359, -1.077949, 0, 0, 0, 1, 1,
-0.1163546, -1.252281, -1.235758, 1, 1, 1, 1, 1,
-0.1153715, 0.957656, 0.2593737, 1, 1, 1, 1, 1,
-0.1096787, 0.1991536, -1.822048, 1, 1, 1, 1, 1,
-0.1095787, 0.05715076, -0.5720801, 1, 1, 1, 1, 1,
-0.1068768, -0.1564661, -2.896039, 1, 1, 1, 1, 1,
-0.1063185, 1.084014, -0.3780307, 1, 1, 1, 1, 1,
-0.1055019, 1.412157, 0.2446209, 1, 1, 1, 1, 1,
-0.10544, 1.185796, -1.164248, 1, 1, 1, 1, 1,
-0.1027134, 0.4942189, 0.9742007, 1, 1, 1, 1, 1,
-0.1019842, 0.5369558, -1.175386, 1, 1, 1, 1, 1,
-0.09675654, -1.076978, -3.787013, 1, 1, 1, 1, 1,
-0.09052017, -0.3178362, -3.922789, 1, 1, 1, 1, 1,
-0.08809307, -0.3294453, -2.872014, 1, 1, 1, 1, 1,
-0.08774267, 1.922054, 0.5334682, 1, 1, 1, 1, 1,
-0.08628532, 1.050869, 0.5624024, 1, 1, 1, 1, 1,
-0.08509948, -1.075027, -3.410031, 0, 0, 1, 1, 1,
-0.07842179, -0.6834642, -3.152098, 1, 0, 0, 1, 1,
-0.07745799, -0.2815664, -3.306158, 1, 0, 0, 1, 1,
-0.07485119, 0.6941395, 0.6348197, 1, 0, 0, 1, 1,
-0.07440689, -0.8071066, -3.896336, 1, 0, 0, 1, 1,
-0.07000833, -0.836408, -2.575818, 1, 0, 0, 1, 1,
-0.06774319, 0.7544492, 0.7927328, 0, 0, 0, 1, 1,
-0.06696919, -1.256435, -2.158735, 0, 0, 0, 1, 1,
-0.06657258, 0.2752249, -0.4768273, 0, 0, 0, 1, 1,
-0.06608043, -0.115201, -2.693738, 0, 0, 0, 1, 1,
-0.06402971, 0.8235481, -1.006907, 0, 0, 0, 1, 1,
-0.06261294, 1.380585, 0.3924957, 0, 0, 0, 1, 1,
-0.06234002, 1.510788, 0.6602775, 0, 0, 0, 1, 1,
-0.06158395, 0.4825527, -0.1697886, 1, 1, 1, 1, 1,
-0.05717323, 0.3401829, 1.394662, 1, 1, 1, 1, 1,
-0.05498848, -1.794352, -1.297553, 1, 1, 1, 1, 1,
-0.0478125, 0.1394516, 0.09022099, 1, 1, 1, 1, 1,
-0.04685546, 0.6533167, 0.7466928, 1, 1, 1, 1, 1,
-0.04557984, 0.4008805, 2.182163, 1, 1, 1, 1, 1,
-0.04112506, -1.156026, -3.775846, 1, 1, 1, 1, 1,
-0.0409023, -0.3108379, -2.697017, 1, 1, 1, 1, 1,
-0.04082613, -0.6376236, -3.01487, 1, 1, 1, 1, 1,
-0.04037895, -0.4646333, -3.140713, 1, 1, 1, 1, 1,
-0.03867568, 0.7793293, 0.9653365, 1, 1, 1, 1, 1,
-0.03849102, 0.6307957, -0.593957, 1, 1, 1, 1, 1,
-0.03784274, -0.6353803, -3.374387, 1, 1, 1, 1, 1,
-0.02994784, -1.686293, -3.230297, 1, 1, 1, 1, 1,
-0.02906549, 1.352607, 0.2059721, 1, 1, 1, 1, 1,
-0.02784328, 2.204507, -1.006052, 0, 0, 1, 1, 1,
-0.02432678, -1.527215, -3.843652, 1, 0, 0, 1, 1,
-0.02190968, -0.08621924, -3.548999, 1, 0, 0, 1, 1,
-0.0194856, 1.495537, -0.5103161, 1, 0, 0, 1, 1,
-0.01900524, 1.394678, 0.4568265, 1, 0, 0, 1, 1,
-0.01845335, 0.7000726, -0.1220835, 1, 0, 0, 1, 1,
-0.01704997, -1.143589, -1.93517, 0, 0, 0, 1, 1,
-0.01480499, 1.445231, 1.189996, 0, 0, 0, 1, 1,
-0.007527991, 0.701851, -1.04957, 0, 0, 0, 1, 1,
-0.006550821, 0.1207957, -0.82553, 0, 0, 0, 1, 1,
-0.005214281, 1.122567, -0.7460299, 0, 0, 0, 1, 1,
-0.002377502, 0.9992652, 0.3424897, 0, 0, 0, 1, 1,
-0.0007708184, 0.5761389, -0.4149913, 0, 0, 0, 1, 1,
0.001058651, 0.8782539, -0.5948592, 1, 1, 1, 1, 1,
0.001153722, 2.294899, 0.1524114, 1, 1, 1, 1, 1,
0.002470191, -0.526184, 2.696053, 1, 1, 1, 1, 1,
0.003712232, 0.7140032, 0.2024277, 1, 1, 1, 1, 1,
0.003823594, -0.6577834, 1.326023, 1, 1, 1, 1, 1,
0.004934058, 0.01208051, -1.142267, 1, 1, 1, 1, 1,
0.005291236, -1.15431, 4.832336, 1, 1, 1, 1, 1,
0.008202517, -0.15818, 3.442343, 1, 1, 1, 1, 1,
0.008688552, 0.2745045, 0.757626, 1, 1, 1, 1, 1,
0.009221128, 0.5841033, 0.3202876, 1, 1, 1, 1, 1,
0.009372345, 0.6605328, 0.6997355, 1, 1, 1, 1, 1,
0.01067012, 1.160605, -0.1472718, 1, 1, 1, 1, 1,
0.01207524, -0.6505657, 3.494243, 1, 1, 1, 1, 1,
0.01251828, 1.53962, 0.1492624, 1, 1, 1, 1, 1,
0.01336372, 1.675449, -0.7259889, 1, 1, 1, 1, 1,
0.01494836, -0.8158627, 4.132777, 0, 0, 1, 1, 1,
0.01938496, -0.6633586, 1.775383, 1, 0, 0, 1, 1,
0.01983381, 1.90964, 0.6787051, 1, 0, 0, 1, 1,
0.02065798, 0.4447635, 0.2044188, 1, 0, 0, 1, 1,
0.02490884, 1.828121, -0.07084005, 1, 0, 0, 1, 1,
0.02938999, 1.024812, -0.8135347, 1, 0, 0, 1, 1,
0.03194432, -0.7738721, 2.761074, 0, 0, 0, 1, 1,
0.03450974, 0.5889928, -1.011471, 0, 0, 0, 1, 1,
0.03561878, -0.2281895, 3.968327, 0, 0, 0, 1, 1,
0.03972138, 1.160419, -2.409702, 0, 0, 0, 1, 1,
0.04521943, 2.005727, -0.9819654, 0, 0, 0, 1, 1,
0.0483808, 0.8125484, 1.280077, 0, 0, 0, 1, 1,
0.04886657, -0.9069725, 4.794946, 0, 0, 0, 1, 1,
0.05433786, 1.518399, 0.4968094, 1, 1, 1, 1, 1,
0.06071526, -0.4036712, 4.375105, 1, 1, 1, 1, 1,
0.06181166, -1.922816, 2.245679, 1, 1, 1, 1, 1,
0.06278444, -0.08436748, 2.752221, 1, 1, 1, 1, 1,
0.06350486, -0.6503335, 4.426031, 1, 1, 1, 1, 1,
0.06761602, 0.3833584, 0.2587447, 1, 1, 1, 1, 1,
0.06936765, -0.9207516, 2.798969, 1, 1, 1, 1, 1,
0.07033525, 0.3098653, -1.3097, 1, 1, 1, 1, 1,
0.07395953, 0.9029913, 0.5190947, 1, 1, 1, 1, 1,
0.07853252, 0.1672446, -1.051555, 1, 1, 1, 1, 1,
0.07915545, -0.5450915, 2.284262, 1, 1, 1, 1, 1,
0.08019413, -0.9879269, 3.782636, 1, 1, 1, 1, 1,
0.08140885, -0.454889, 2.825914, 1, 1, 1, 1, 1,
0.08984612, 0.9376418, 0.4143672, 1, 1, 1, 1, 1,
0.1001622, 0.7111742, 0.7547552, 1, 1, 1, 1, 1,
0.1065529, -1.038879, 3.335107, 0, 0, 1, 1, 1,
0.1092904, 0.3861935, -0.4757215, 1, 0, 0, 1, 1,
0.1095932, 1.130211, 0.2720906, 1, 0, 0, 1, 1,
0.1099475, 1.399241, 0.5673541, 1, 0, 0, 1, 1,
0.1103704, 1.444059, -0.3460986, 1, 0, 0, 1, 1,
0.1118687, -1.149616, 1.849632, 1, 0, 0, 1, 1,
0.1168468, 0.5448394, -1.799706, 0, 0, 0, 1, 1,
0.1198131, 0.07931392, -0.6914054, 0, 0, 0, 1, 1,
0.1198576, 0.3560684, 0.7248784, 0, 0, 0, 1, 1,
0.1220759, 0.1618942, 1.064401, 0, 0, 0, 1, 1,
0.1234218, 0.7440449, -0.2508186, 0, 0, 0, 1, 1,
0.1258445, -0.7397826, 2.625257, 0, 0, 0, 1, 1,
0.1267004, 0.6019725, -1.349329, 0, 0, 0, 1, 1,
0.1267549, 0.1951714, 1.343894, 1, 1, 1, 1, 1,
0.1276723, -1.44219, 3.834852, 1, 1, 1, 1, 1,
0.128654, -0.1196092, 1.409039, 1, 1, 1, 1, 1,
0.1293564, -1.750555, 3.714039, 1, 1, 1, 1, 1,
0.1295399, -1.576213, 4.148808, 1, 1, 1, 1, 1,
0.1312743, -0.4095147, 3.420341, 1, 1, 1, 1, 1,
0.1342519, -0.01753464, 1.654037, 1, 1, 1, 1, 1,
0.1354451, 0.7927842, -1.754049, 1, 1, 1, 1, 1,
0.1363783, -0.5009959, 2.486547, 1, 1, 1, 1, 1,
0.1381204, 0.8951014, -1.070141, 1, 1, 1, 1, 1,
0.1393363, 0.7642336, 1.08689, 1, 1, 1, 1, 1,
0.1413876, -0.1077196, 1.611415, 1, 1, 1, 1, 1,
0.1431584, -0.5156928, 2.561415, 1, 1, 1, 1, 1,
0.1431704, -1.575393, 4.500937, 1, 1, 1, 1, 1,
0.1439748, -1.054903, 3.572747, 1, 1, 1, 1, 1,
0.1550858, -0.1742727, 3.172772, 0, 0, 1, 1, 1,
0.1560728, -0.7201443, 1.566555, 1, 0, 0, 1, 1,
0.1595698, -1.150401, 3.641762, 1, 0, 0, 1, 1,
0.1601657, 1.514017, -0.3526574, 1, 0, 0, 1, 1,
0.1690129, 0.8938468, -0.2439218, 1, 0, 0, 1, 1,
0.1695647, 2.475408, -0.1458106, 1, 0, 0, 1, 1,
0.1715915, -0.7646334, 2.569777, 0, 0, 0, 1, 1,
0.1727946, 0.6111748, -0.3445552, 0, 0, 0, 1, 1,
0.1735087, 0.4027181, 0.9617893, 0, 0, 0, 1, 1,
0.1747161, -1.301496, 4.006803, 0, 0, 0, 1, 1,
0.1756934, -0.6448801, 3.597455, 0, 0, 0, 1, 1,
0.1779813, 2.437323, -2.243438, 0, 0, 0, 1, 1,
0.1836159, -0.7686503, 2.14124, 0, 0, 0, 1, 1,
0.18518, -1.061341, 2.841261, 1, 1, 1, 1, 1,
0.1888216, 0.3639811, 1.212103, 1, 1, 1, 1, 1,
0.1903706, -0.2118449, 2.011472, 1, 1, 1, 1, 1,
0.1920275, 1.158951, 2.546036, 1, 1, 1, 1, 1,
0.192844, 0.5661836, 0.09210926, 1, 1, 1, 1, 1,
0.201605, 0.7390591, 0.2260394, 1, 1, 1, 1, 1,
0.2031286, 0.9610885, 2.32106, 1, 1, 1, 1, 1,
0.2042073, -2.01871, 2.281626, 1, 1, 1, 1, 1,
0.206496, 0.2901386, 1.48063, 1, 1, 1, 1, 1,
0.2204443, 0.147742, -0.514762, 1, 1, 1, 1, 1,
0.2214285, -1.187325, 2.169965, 1, 1, 1, 1, 1,
0.2229385, 0.2917995, 0.816952, 1, 1, 1, 1, 1,
0.225326, 1.402002, -1.10694, 1, 1, 1, 1, 1,
0.2270788, -0.2475924, 1.740541, 1, 1, 1, 1, 1,
0.2285379, -1.027116, 5.063505, 1, 1, 1, 1, 1,
0.2346572, 0.9128655, -1.463016, 0, 0, 1, 1, 1,
0.2365392, 1.00967, 0.7323266, 1, 0, 0, 1, 1,
0.2424215, -0.1440828, 3.936335, 1, 0, 0, 1, 1,
0.2440105, 1.290735, -0.8053076, 1, 0, 0, 1, 1,
0.2440433, 0.8025037, 0.6772724, 1, 0, 0, 1, 1,
0.2504947, -1.644814, 3.42731, 1, 0, 0, 1, 1,
0.2599098, -0.6327988, 1.290977, 0, 0, 0, 1, 1,
0.2654844, 0.5450837, -0.5566306, 0, 0, 0, 1, 1,
0.2674391, -0.2536023, 4.641811, 0, 0, 0, 1, 1,
0.2681628, 0.6239802, 1.565074, 0, 0, 0, 1, 1,
0.2690539, -0.646989, 2.071877, 0, 0, 0, 1, 1,
0.2711303, 0.09680185, 0.8703296, 0, 0, 0, 1, 1,
0.273924, 2.287388, 0.2170773, 0, 0, 0, 1, 1,
0.2746054, 0.5628906, 0.540858, 1, 1, 1, 1, 1,
0.2748184, 0.5898914, 1.212753, 1, 1, 1, 1, 1,
0.2789907, -1.913955, 2.731398, 1, 1, 1, 1, 1,
0.2795399, 0.35533, 0.4905506, 1, 1, 1, 1, 1,
0.2796299, -1.282119, 3.984364, 1, 1, 1, 1, 1,
0.2837138, 0.2365861, 0.3991227, 1, 1, 1, 1, 1,
0.2857111, -0.1660891, 1.9815, 1, 1, 1, 1, 1,
0.2873143, 2.112587, 1.702295, 1, 1, 1, 1, 1,
0.2913361, -0.7077516, 2.680406, 1, 1, 1, 1, 1,
0.2944362, -0.6686697, 2.168452, 1, 1, 1, 1, 1,
0.2962945, -0.1622135, 3.243474, 1, 1, 1, 1, 1,
0.2963091, -0.8097985, 3.287078, 1, 1, 1, 1, 1,
0.3053472, -1.291904, 1.903415, 1, 1, 1, 1, 1,
0.3055725, 0.6364773, 2.133549, 1, 1, 1, 1, 1,
0.3072056, 0.2168634, 0.01002259, 1, 1, 1, 1, 1,
0.3087973, 0.2735181, 1.391029, 0, 0, 1, 1, 1,
0.3096788, -0.1675759, 3.779848, 1, 0, 0, 1, 1,
0.309864, 0.5785928, 2.349026, 1, 0, 0, 1, 1,
0.3099486, 0.8036175, -0.3394273, 1, 0, 0, 1, 1,
0.3132783, -0.7960112, 0.7690559, 1, 0, 0, 1, 1,
0.316236, -0.3634146, 3.961035, 1, 0, 0, 1, 1,
0.3202427, 0.7522247, 0.6969751, 0, 0, 0, 1, 1,
0.3240688, -0.2198527, 0.5373504, 0, 0, 0, 1, 1,
0.3333312, -0.3446446, 2.828965, 0, 0, 0, 1, 1,
0.3353045, 0.005924534, 1.172715, 0, 0, 0, 1, 1,
0.3409604, -1.463511, 0.6500556, 0, 0, 0, 1, 1,
0.3437037, 0.5512411, 1.315822, 0, 0, 0, 1, 1,
0.3449016, 0.5979133, 0.1461789, 0, 0, 0, 1, 1,
0.3477908, 0.8549287, -1.122462, 1, 1, 1, 1, 1,
0.3486141, -2.063542, 2.506934, 1, 1, 1, 1, 1,
0.3578692, -0.8447887, 1.218245, 1, 1, 1, 1, 1,
0.3583675, 1.120259, -0.1575278, 1, 1, 1, 1, 1,
0.3595301, -0.008316024, 1.668503, 1, 1, 1, 1, 1,
0.3639702, -0.9756153, 2.045287, 1, 1, 1, 1, 1,
0.3701145, 0.8838647, 1.242663, 1, 1, 1, 1, 1,
0.3721595, -0.6988419, 3.03109, 1, 1, 1, 1, 1,
0.3752029, -1.59407, 4.713918, 1, 1, 1, 1, 1,
0.3819292, 0.1055305, 1.409361, 1, 1, 1, 1, 1,
0.3898033, 1.31206, 0.9942957, 1, 1, 1, 1, 1,
0.3901836, -0.2801231, 2.54317, 1, 1, 1, 1, 1,
0.39571, 0.9255108, 0.07348762, 1, 1, 1, 1, 1,
0.3986722, -0.6195656, 2.538636, 1, 1, 1, 1, 1,
0.404234, -0.6438851, 3.200681, 1, 1, 1, 1, 1,
0.4101551, -0.2877964, 2.884093, 0, 0, 1, 1, 1,
0.41761, 1.347162, -0.5047107, 1, 0, 0, 1, 1,
0.4261211, 0.1918458, 1.860328, 1, 0, 0, 1, 1,
0.4262201, -0.2429337, 1.180687, 1, 0, 0, 1, 1,
0.428221, -0.6816024, 1.154202, 1, 0, 0, 1, 1,
0.4295066, 0.2993762, 2.040256, 1, 0, 0, 1, 1,
0.4299503, -0.2029905, 2.627281, 0, 0, 0, 1, 1,
0.4299834, -0.4064586, 0.4494456, 0, 0, 0, 1, 1,
0.4345564, 0.7349764, 2.211715, 0, 0, 0, 1, 1,
0.4408644, 1.45927, -0.2006144, 0, 0, 0, 1, 1,
0.4461468, 0.4041934, 0.4371485, 0, 0, 0, 1, 1,
0.4488597, -0.8404334, 3.385243, 0, 0, 0, 1, 1,
0.4524904, -0.5368421, 2.374934, 0, 0, 0, 1, 1,
0.452646, -0.03589833, 0.9659307, 1, 1, 1, 1, 1,
0.452861, -0.6743051, 2.351562, 1, 1, 1, 1, 1,
0.4530404, 1.055943, -0.6682685, 1, 1, 1, 1, 1,
0.4546581, -0.9456851, 0.2167521, 1, 1, 1, 1, 1,
0.4587472, -0.6607001, 1.806712, 1, 1, 1, 1, 1,
0.4629256, -2.771648, 2.892449, 1, 1, 1, 1, 1,
0.4645159, -1.49558, 4.213181, 1, 1, 1, 1, 1,
0.468054, -0.3916507, 1.668776, 1, 1, 1, 1, 1,
0.4690987, 1.101193, 0.7035161, 1, 1, 1, 1, 1,
0.4747742, -1.606364, 3.750361, 1, 1, 1, 1, 1,
0.4749635, -1.624849, 4.281728, 1, 1, 1, 1, 1,
0.4761867, -1.147253, 2.747378, 1, 1, 1, 1, 1,
0.4775296, -0.1876711, 1.724778, 1, 1, 1, 1, 1,
0.4854618, 0.4716992, 1.488952, 1, 1, 1, 1, 1,
0.4857271, 2.499521, -0.7953658, 1, 1, 1, 1, 1,
0.4871215, 1.208646, -0.6701465, 0, 0, 1, 1, 1,
0.4898008, 2.033601, -1.766619, 1, 0, 0, 1, 1,
0.4929768, 0.1723504, 1.764508, 1, 0, 0, 1, 1,
0.4939587, 1.921966, 0.4878893, 1, 0, 0, 1, 1,
0.4995377, -0.2998765, 1.357647, 1, 0, 0, 1, 1,
0.5056408, -0.6807456, 2.211811, 1, 0, 0, 1, 1,
0.506211, 0.5189885, -0.9849219, 0, 0, 0, 1, 1,
0.5099307, 0.448845, 1.880395, 0, 0, 0, 1, 1,
0.5112733, -1.238598, 2.301313, 0, 0, 0, 1, 1,
0.5153424, -1.18875, 5.218736, 0, 0, 0, 1, 1,
0.516921, 0.6666929, 1.996519, 0, 0, 0, 1, 1,
0.5260335, 0.6915052, 1.673134, 0, 0, 0, 1, 1,
0.5268302, 0.3254025, -0.1856925, 0, 0, 0, 1, 1,
0.5378655, -0.9356346, 1.924016, 1, 1, 1, 1, 1,
0.5381594, 1.679456, -0.8129351, 1, 1, 1, 1, 1,
0.5397761, 0.7465953, 0.5652271, 1, 1, 1, 1, 1,
0.5415166, 1.940515, 0.6728497, 1, 1, 1, 1, 1,
0.5501517, -1.224082, 2.99415, 1, 1, 1, 1, 1,
0.5518777, -0.0685823, 1.689656, 1, 1, 1, 1, 1,
0.5529777, 0.5024019, 0.8621651, 1, 1, 1, 1, 1,
0.5548067, -0.04647477, 3.512063, 1, 1, 1, 1, 1,
0.5610565, -0.1931653, 1.662153, 1, 1, 1, 1, 1,
0.5631528, -1.206276, 2.522526, 1, 1, 1, 1, 1,
0.5653637, -1.361909, 2.588442, 1, 1, 1, 1, 1,
0.5784683, 2.109338, 0.841511, 1, 1, 1, 1, 1,
0.585068, 0.2172273, 1.325662, 1, 1, 1, 1, 1,
0.5902897, -0.5726346, 1.010154, 1, 1, 1, 1, 1,
0.5931128, -0.4093006, 3.156705, 1, 1, 1, 1, 1,
0.5945832, 0.04248886, 1.371253, 0, 0, 1, 1, 1,
0.595736, 1.600616, -0.2859019, 1, 0, 0, 1, 1,
0.601428, 0.7407326, -0.5816987, 1, 0, 0, 1, 1,
0.6019523, -0.4331717, 2.115924, 1, 0, 0, 1, 1,
0.6042684, -0.8123817, 2.038484, 1, 0, 0, 1, 1,
0.6053474, -0.9623053, 2.419009, 1, 0, 0, 1, 1,
0.6098267, 1.291577, -1.36663, 0, 0, 0, 1, 1,
0.6122392, 1.064371, -0.01780389, 0, 0, 0, 1, 1,
0.6133201, 0.03006765, 2.478373, 0, 0, 0, 1, 1,
0.6141039, -0.9740514, 2.425875, 0, 0, 0, 1, 1,
0.6142716, 1.431495, 0.3688987, 0, 0, 0, 1, 1,
0.6164383, -2.242741, 3.182948, 0, 0, 0, 1, 1,
0.6165595, -0.07893066, 2.495566, 0, 0, 0, 1, 1,
0.6189375, 0.4064816, 1.495136, 1, 1, 1, 1, 1,
0.6297387, -0.3439009, 0.2942061, 1, 1, 1, 1, 1,
0.6324931, -0.8692096, 3.52122, 1, 1, 1, 1, 1,
0.6329225, 0.5748422, 0.1678485, 1, 1, 1, 1, 1,
0.6380718, -0.709285, 0.7375284, 1, 1, 1, 1, 1,
0.6414073, 1.501824, 1.268886, 1, 1, 1, 1, 1,
0.6449369, 0.09914132, 3.325916, 1, 1, 1, 1, 1,
0.6465696, 0.7635334, 0.5788674, 1, 1, 1, 1, 1,
0.6565707, 0.3709558, 2.154355, 1, 1, 1, 1, 1,
0.657982, -0.6530207, 2.919045, 1, 1, 1, 1, 1,
0.664008, -0.5843693, 1.156412, 1, 1, 1, 1, 1,
0.6642039, -0.9044605, 2.595307, 1, 1, 1, 1, 1,
0.6651841, 1.048604, -0.5255075, 1, 1, 1, 1, 1,
0.6667739, 0.2496005, 1.222833, 1, 1, 1, 1, 1,
0.6674239, 0.8054769, 0.7592816, 1, 1, 1, 1, 1,
0.6681167, 0.5508385, 1.373754, 0, 0, 1, 1, 1,
0.6697522, 0.844572, 1.197056, 1, 0, 0, 1, 1,
0.6757517, -1.119767, 2.621498, 1, 0, 0, 1, 1,
0.677811, 0.8166387, 1.738504, 1, 0, 0, 1, 1,
0.6785357, 2.275817, 0.784451, 1, 0, 0, 1, 1,
0.6817127, 1.619007, 0.3819318, 1, 0, 0, 1, 1,
0.6889889, -0.6385764, 2.788074, 0, 0, 0, 1, 1,
0.6958686, 0.3772633, 0.5770308, 0, 0, 0, 1, 1,
0.6958911, -0.6132705, 1.278115, 0, 0, 0, 1, 1,
0.6961162, 0.2968402, 3.215684, 0, 0, 0, 1, 1,
0.6975945, 1.362592, -0.02183725, 0, 0, 0, 1, 1,
0.6978419, -0.30213, 2.155448, 0, 0, 0, 1, 1,
0.698633, 0.7149051, 1.25736, 0, 0, 0, 1, 1,
0.7104387, -1.100942, 4.104508, 1, 1, 1, 1, 1,
0.7150159, -1.590914, 2.200629, 1, 1, 1, 1, 1,
0.7169878, -1.413619, 2.027183, 1, 1, 1, 1, 1,
0.7175632, -0.756069, 2.128793, 1, 1, 1, 1, 1,
0.7283803, 0.04005812, 0.8710436, 1, 1, 1, 1, 1,
0.7316419, 1.571939, 1.231708, 1, 1, 1, 1, 1,
0.7344279, 1.08783, 0.2255819, 1, 1, 1, 1, 1,
0.7358338, -1.373562, 1.952357, 1, 1, 1, 1, 1,
0.738187, 0.8776988, 1.019327, 1, 1, 1, 1, 1,
0.7461319, -0.4592732, 2.368501, 1, 1, 1, 1, 1,
0.7530982, 1.577959, 0.7150747, 1, 1, 1, 1, 1,
0.7552203, 1.363794, 0.3541863, 1, 1, 1, 1, 1,
0.756762, 0.7433111, 1.785491, 1, 1, 1, 1, 1,
0.7593634, 0.6589692, 0.397757, 1, 1, 1, 1, 1,
0.76095, -0.1921827, 2.271291, 1, 1, 1, 1, 1,
0.7633247, -1.016905, 2.472847, 0, 0, 1, 1, 1,
0.7635574, 0.9746802, 1.744152, 1, 0, 0, 1, 1,
0.7639514, 0.3128732, 1.811957, 1, 0, 0, 1, 1,
0.7675676, -0.008563251, 1.726248, 1, 0, 0, 1, 1,
0.7712156, -1.623267, 3.552762, 1, 0, 0, 1, 1,
0.7716284, 1.696999, 0.4466224, 1, 0, 0, 1, 1,
0.7773224, -1.081095, 2.923739, 0, 0, 0, 1, 1,
0.7798629, -1.997348, 3.747249, 0, 0, 0, 1, 1,
0.7803699, -0.3929074, 1.294998, 0, 0, 0, 1, 1,
0.7888544, 0.5956805, 1.258937, 0, 0, 0, 1, 1,
0.7967767, 0.8076299, 0.2247796, 0, 0, 0, 1, 1,
0.801044, -0.2162694, 2.244601, 0, 0, 0, 1, 1,
0.8015277, 0.5533962, 0.3647626, 0, 0, 0, 1, 1,
0.8020479, -1.485693, 3.947136, 1, 1, 1, 1, 1,
0.8070186, 1.384313, 0.7536082, 1, 1, 1, 1, 1,
0.8178834, -0.5155165, 3.502067, 1, 1, 1, 1, 1,
0.8180408, 0.5035176, -0.1642787, 1, 1, 1, 1, 1,
0.8199616, 0.5229484, -0.238902, 1, 1, 1, 1, 1,
0.8230177, -0.8369117, 3.165329, 1, 1, 1, 1, 1,
0.8273766, 0.3356173, 2.615633, 1, 1, 1, 1, 1,
0.8281769, 1.935547, -0.6521934, 1, 1, 1, 1, 1,
0.8326458, -1.416018, 1.77967, 1, 1, 1, 1, 1,
0.8366888, -0.4607394, 0.4470285, 1, 1, 1, 1, 1,
0.8415804, -0.7967467, 3.349324, 1, 1, 1, 1, 1,
0.8442444, 0.2341357, 2.07305, 1, 1, 1, 1, 1,
0.8446707, -1.883435, 2.182478, 1, 1, 1, 1, 1,
0.8463316, -0.7385856, 2.491987, 1, 1, 1, 1, 1,
0.850663, -0.8093656, 2.494278, 1, 1, 1, 1, 1,
0.8544024, 0.5547537, 0.9071345, 0, 0, 1, 1, 1,
0.8563131, 0.190028, -0.2177473, 1, 0, 0, 1, 1,
0.8577889, -1.281896, 3.328068, 1, 0, 0, 1, 1,
0.8590536, 0.780475, 1.243184, 1, 0, 0, 1, 1,
0.8661243, 0.6397985, 2.344743, 1, 0, 0, 1, 1,
0.8666067, 0.5447124, 1.784946, 1, 0, 0, 1, 1,
0.8696414, -2.196023, 2.559459, 0, 0, 0, 1, 1,
0.8737686, 2.137619, 1.373272, 0, 0, 0, 1, 1,
0.8741231, 2.670299, -1.151465, 0, 0, 0, 1, 1,
0.8752407, 0.07547004, -0.4301154, 0, 0, 0, 1, 1,
0.8757502, -0.886552, 1.814528, 0, 0, 0, 1, 1,
0.8807414, -0.3234484, 1.304024, 0, 0, 0, 1, 1,
0.8841717, -0.6060536, 2.016864, 0, 0, 0, 1, 1,
0.8876208, -0.652026, 2.112251, 1, 1, 1, 1, 1,
0.8934633, 1.093857, 0.3759207, 1, 1, 1, 1, 1,
0.9014321, 0.7681444, 0.2952414, 1, 1, 1, 1, 1,
0.9037825, -0.3408903, 1.637987, 1, 1, 1, 1, 1,
0.9041995, 0.7851636, 0.7336909, 1, 1, 1, 1, 1,
0.9054856, -0.8626248, 0.6645042, 1, 1, 1, 1, 1,
0.9079064, -1.279975, 1.738063, 1, 1, 1, 1, 1,
0.9133751, 0.05674598, 2.340761, 1, 1, 1, 1, 1,
0.9165075, -0.7038816, 1.952103, 1, 1, 1, 1, 1,
0.9251888, 1.739692, 0.5429237, 1, 1, 1, 1, 1,
0.9274803, 0.01310065, 1.34804, 1, 1, 1, 1, 1,
0.9302632, -0.8468323, 1.905041, 1, 1, 1, 1, 1,
0.9326246, -0.5528445, 0.2237251, 1, 1, 1, 1, 1,
0.9350969, -0.6652895, 2.658111, 1, 1, 1, 1, 1,
0.9385625, -0.6562716, 3.779227, 1, 1, 1, 1, 1,
0.9432931, 0.09742369, 2.530835, 0, 0, 1, 1, 1,
0.9436364, -0.3994789, -0.4950976, 1, 0, 0, 1, 1,
0.944648, -1.28109, 1.685332, 1, 0, 0, 1, 1,
0.9470667, 0.4504988, 2.37773, 1, 0, 0, 1, 1,
0.9504651, 0.3506959, 2.491551, 1, 0, 0, 1, 1,
0.9640056, 1.843967, 0.7476701, 1, 0, 0, 1, 1,
0.9758493, -0.9889656, 1.874049, 0, 0, 0, 1, 1,
0.9800248, -0.8433162, 2.433993, 0, 0, 0, 1, 1,
0.9802799, 0.6146052, 1.3736, 0, 0, 0, 1, 1,
0.9836834, 0.584569, -0.3394779, 0, 0, 0, 1, 1,
0.9845622, 0.5665962, 2.467176, 0, 0, 0, 1, 1,
0.9927865, 1.567706, 2.041564, 0, 0, 0, 1, 1,
0.9953762, -0.3889094, 0.4168972, 0, 0, 0, 1, 1,
0.9970262, -1.752024, 3.640184, 1, 1, 1, 1, 1,
1.00853, -1.3728, 3.360137, 1, 1, 1, 1, 1,
1.009498, -0.2698761, 0.7113572, 1, 1, 1, 1, 1,
1.013912, 0.2713543, 3.108172, 1, 1, 1, 1, 1,
1.024843, 0.006825161, 2.058901, 1, 1, 1, 1, 1,
1.02801, -0.625147, 2.572437, 1, 1, 1, 1, 1,
1.037683, -1.130807, 1.412243, 1, 1, 1, 1, 1,
1.040469, -0.8647518, 1.866181, 1, 1, 1, 1, 1,
1.048694, 0.5549484, 0.935414, 1, 1, 1, 1, 1,
1.066555, -1.083506, 2.745756, 1, 1, 1, 1, 1,
1.078341, 0.4610045, 0.8719848, 1, 1, 1, 1, 1,
1.079318, -0.8366399, 0.6436383, 1, 1, 1, 1, 1,
1.082938, 1.276505, 1.016432, 1, 1, 1, 1, 1,
1.083114, -1.908433, 3.449532, 1, 1, 1, 1, 1,
1.086596, 1.566281, 0.9956208, 1, 1, 1, 1, 1,
1.093062, 0.3335456, 1.477743, 0, 0, 1, 1, 1,
1.098384, 0.3742577, 0.3574437, 1, 0, 0, 1, 1,
1.108049, -0.9193665, 3.774312, 1, 0, 0, 1, 1,
1.110415, 1.730481, 1.689494, 1, 0, 0, 1, 1,
1.111555, -2.064871, 2.085051, 1, 0, 0, 1, 1,
1.119114, 1.665271, 2.479022, 1, 0, 0, 1, 1,
1.119365, 1.629341, -0.2465275, 0, 0, 0, 1, 1,
1.122684, 0.3482553, -0.05603928, 0, 0, 0, 1, 1,
1.125074, 0.5686233, 2.105663, 0, 0, 0, 1, 1,
1.125533, 0.1403869, -0.5482814, 0, 0, 0, 1, 1,
1.129916, -0.7401412, 2.226548, 0, 0, 0, 1, 1,
1.13075, 0.9869801, 0.01424055, 0, 0, 0, 1, 1,
1.143279, 1.06907, 2.034729, 0, 0, 0, 1, 1,
1.148415, 1.001002, 1.391102, 1, 1, 1, 1, 1,
1.14975, -0.7684257, 2.32588, 1, 1, 1, 1, 1,
1.154597, 0.9196416, 0.7656578, 1, 1, 1, 1, 1,
1.163017, 0.5716527, 1.571593, 1, 1, 1, 1, 1,
1.165316, -0.8400077, 1.992273, 1, 1, 1, 1, 1,
1.167405, 2.02116, 1.523774, 1, 1, 1, 1, 1,
1.168159, -0.2856598, 0.8799369, 1, 1, 1, 1, 1,
1.183343, 0.0774481, 2.239964, 1, 1, 1, 1, 1,
1.19009, -0.1288544, 3.808628, 1, 1, 1, 1, 1,
1.194379, -0.3918428, 0.6864595, 1, 1, 1, 1, 1,
1.194581, 0.3692794, -0.1022316, 1, 1, 1, 1, 1,
1.19562, -0.4840454, 2.985642, 1, 1, 1, 1, 1,
1.200463, 0.03634315, 1.794616, 1, 1, 1, 1, 1,
1.200541, 0.9819382, 0.04849186, 1, 1, 1, 1, 1,
1.202488, 2.166702, 2.580724, 1, 1, 1, 1, 1,
1.20535, -0.1759154, 1.729283, 0, 0, 1, 1, 1,
1.207375, -0.6940404, 2.102339, 1, 0, 0, 1, 1,
1.208068, -0.2332201, 2.670369, 1, 0, 0, 1, 1,
1.208954, 0.3261711, 1.524436, 1, 0, 0, 1, 1,
1.212591, -0.1596904, 1.931118, 1, 0, 0, 1, 1,
1.21656, -0.3451653, 1.132306, 1, 0, 0, 1, 1,
1.217313, 0.3555116, 1.276419, 0, 0, 0, 1, 1,
1.219524, 2.064345, 0.5149859, 0, 0, 0, 1, 1,
1.222329, -0.5460062, 2.224338, 0, 0, 0, 1, 1,
1.222378, 1.702161, 2.559005, 0, 0, 0, 1, 1,
1.227418, 0.4608753, 0.7467024, 0, 0, 0, 1, 1,
1.233006, 0.09320197, 1.982489, 0, 0, 0, 1, 1,
1.243334, -1.364702, 1.955359, 0, 0, 0, 1, 1,
1.243949, 0.7444128, 3.542945, 1, 1, 1, 1, 1,
1.245329, 1.093052, -0.5352386, 1, 1, 1, 1, 1,
1.250721, 1.288156, 1.555937, 1, 1, 1, 1, 1,
1.2573, -1.134928, 2.757976, 1, 1, 1, 1, 1,
1.259731, 0.5115327, 1.210695, 1, 1, 1, 1, 1,
1.261934, 1.140667, -0.2946399, 1, 1, 1, 1, 1,
1.266056, -0.2715981, 2.273254, 1, 1, 1, 1, 1,
1.273858, -0.192098, 0.7265562, 1, 1, 1, 1, 1,
1.283185, -0.7643484, 3.176963, 1, 1, 1, 1, 1,
1.28451, -0.07016409, 1.945448, 1, 1, 1, 1, 1,
1.284644, -0.9669017, 2.204442, 1, 1, 1, 1, 1,
1.284965, 0.04851072, 2.029709, 1, 1, 1, 1, 1,
1.288795, 2.412534, 1.070116, 1, 1, 1, 1, 1,
1.292494, 0.6736836, 0.6658816, 1, 1, 1, 1, 1,
1.293211, -0.2401192, 1.242712, 1, 1, 1, 1, 1,
1.299976, 0.4954585, 0.1940604, 0, 0, 1, 1, 1,
1.30396, -0.513383, 1.84584, 1, 0, 0, 1, 1,
1.309346, -0.3175891, 3.43738, 1, 0, 0, 1, 1,
1.316006, 0.7219155, 1.205269, 1, 0, 0, 1, 1,
1.319873, 0.4529606, 2.208526, 1, 0, 0, 1, 1,
1.321221, -2.670426, 2.715357, 1, 0, 0, 1, 1,
1.328241, -0.4645205, 2.139426, 0, 0, 0, 1, 1,
1.335973, 0.5406838, 0.5563965, 0, 0, 0, 1, 1,
1.345353, 0.5571654, -1.19237, 0, 0, 0, 1, 1,
1.349538, 0.837652, 1.413998, 0, 0, 0, 1, 1,
1.377195, -0.2881714, 2.667732, 0, 0, 0, 1, 1,
1.377362, 0.07170352, 2.02156, 0, 0, 0, 1, 1,
1.3793, -0.4304577, 1.635365, 0, 0, 0, 1, 1,
1.397352, 2.653059, 1.041453, 1, 1, 1, 1, 1,
1.398662, 0.9360661, 0.6414644, 1, 1, 1, 1, 1,
1.424214, -1.378312, 1.986059, 1, 1, 1, 1, 1,
1.428893, -0.1148574, 0.08580359, 1, 1, 1, 1, 1,
1.437998, 0.05521962, 2.623837, 1, 1, 1, 1, 1,
1.444668, 0.06082825, 1.479003, 1, 1, 1, 1, 1,
1.447696, 0.4591039, 1.964633, 1, 1, 1, 1, 1,
1.451402, 1.394904, 0.524034, 1, 1, 1, 1, 1,
1.462511, -0.514183, 4.293373, 1, 1, 1, 1, 1,
1.48794, -0.4703052, 3.272149, 1, 1, 1, 1, 1,
1.499746, 0.01822125, 1.298759, 1, 1, 1, 1, 1,
1.499897, -1.026133, 1.917672, 1, 1, 1, 1, 1,
1.506317, -0.3913423, 1.846305, 1, 1, 1, 1, 1,
1.531929, -0.4591652, 0.04974575, 1, 1, 1, 1, 1,
1.53951, 0.5256838, 0.4937209, 1, 1, 1, 1, 1,
1.557947, -0.2188577, 0.6796597, 0, 0, 1, 1, 1,
1.581232, -0.5013857, 0.4461904, 1, 0, 0, 1, 1,
1.603598, -0.907603, 1.270109, 1, 0, 0, 1, 1,
1.606173, -0.712098, 3.135761, 1, 0, 0, 1, 1,
1.610397, -0.3842387, 2.673458, 1, 0, 0, 1, 1,
1.627089, 2.212114, 0.992408, 1, 0, 0, 1, 1,
1.632993, -1.999355, 4.115846, 0, 0, 0, 1, 1,
1.634398, 0.9763163, 1.465216, 0, 0, 0, 1, 1,
1.635897, 0.4278278, 1.770503, 0, 0, 0, 1, 1,
1.637061, 0.1758277, 0.2028715, 0, 0, 0, 1, 1,
1.66461, 1.108074, 0.9413704, 0, 0, 0, 1, 1,
1.667183, 0.4279478, -0.4530444, 0, 0, 0, 1, 1,
1.67043, 1.088353, 1.807962, 0, 0, 0, 1, 1,
1.702586, 0.5827253, 3.549492, 1, 1, 1, 1, 1,
1.716649, 0.1555024, 1.552778, 1, 1, 1, 1, 1,
1.738708, 1.933601, 1.586561, 1, 1, 1, 1, 1,
1.747822, -0.4098586, 1.789823, 1, 1, 1, 1, 1,
1.774676, 0.8194318, 1.679114, 1, 1, 1, 1, 1,
1.817569, 0.05863855, 1.668639, 1, 1, 1, 1, 1,
1.847203, 0.4324401, 2.383292, 1, 1, 1, 1, 1,
1.865136, -1.7812, 1.847489, 1, 1, 1, 1, 1,
1.865796, 0.04217622, 3.148441, 1, 1, 1, 1, 1,
1.868456, -0.1743506, 1.784964, 1, 1, 1, 1, 1,
1.896305, 0.3996872, 3.10835, 1, 1, 1, 1, 1,
1.910731, 0.5118562, 3.212016, 1, 1, 1, 1, 1,
1.971934, -0.03565971, 2.901876, 1, 1, 1, 1, 1,
2.037977, 1.00943, 0.8896397, 1, 1, 1, 1, 1,
2.05337, -1.242629, 0.4469979, 1, 1, 1, 1, 1,
2.109527, 1.23788, 2.746927, 0, 0, 1, 1, 1,
2.120857, -0.3003041, 0.5489554, 1, 0, 0, 1, 1,
2.138975, 0.7823964, 2.722624, 1, 0, 0, 1, 1,
2.139616, 1.933325, -0.5867684, 1, 0, 0, 1, 1,
2.154846, 0.9692532, 0.5241501, 1, 0, 0, 1, 1,
2.164709, -0.5138207, 2.836286, 1, 0, 0, 1, 1,
2.176154, -2.038897, 3.236183, 0, 0, 0, 1, 1,
2.192466, -1.200997, 2.237657, 0, 0, 0, 1, 1,
2.192809, -0.3148555, 1.253408, 0, 0, 0, 1, 1,
2.279472, 0.2295767, -0.2150514, 0, 0, 0, 1, 1,
2.297054, 0.2544886, 1.361498, 0, 0, 0, 1, 1,
2.374016, -0.8530942, 4.263533, 0, 0, 0, 1, 1,
2.399068, -1.25289, 2.017954, 0, 0, 0, 1, 1,
2.426769, 0.7767372, 0.8275563, 1, 1, 1, 1, 1,
2.485656, -0.3314529, 2.02583, 1, 1, 1, 1, 1,
2.548472, 0.5688632, 0.6970363, 1, 1, 1, 1, 1,
2.584339, 0.9429297, 2.051844, 1, 1, 1, 1, 1,
2.657825, 0.6393201, 1.047803, 1, 1, 1, 1, 1,
3.092835, 0.4837844, 0.5556649, 1, 1, 1, 1, 1,
3.165157, 2.676322, 2.318506, 1, 1, 1, 1, 1
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
var radius = 9.525086;
var distance = 33.45646;
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
mvMatrix.translate( -0.0611074, 0.2143834, -0.1300488 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.45646);
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