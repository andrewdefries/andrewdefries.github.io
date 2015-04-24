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
-3.037453, -0.03531221, -1.095556, 1, 0, 0, 1,
-2.893053, 1.151114, -1.939899, 1, 0.007843138, 0, 1,
-2.772189, -1.045593, -1.627989, 1, 0.01176471, 0, 1,
-2.64182, -0.4372042, -1.538011, 1, 0.01960784, 0, 1,
-2.617831, -0.5820452, -2.30594, 1, 0.02352941, 0, 1,
-2.529248, 1.568917, -0.5989003, 1, 0.03137255, 0, 1,
-2.495464, -0.1905141, 0.2301543, 1, 0.03529412, 0, 1,
-2.475987, 0.07918198, -1.420117, 1, 0.04313726, 0, 1,
-2.471519, 0.9664986, 0.6018821, 1, 0.04705882, 0, 1,
-2.378465, -1.213672, -1.917282, 1, 0.05490196, 0, 1,
-2.33159, -0.7263878, -1.664138, 1, 0.05882353, 0, 1,
-2.327746, 1.21105, -1.483373, 1, 0.06666667, 0, 1,
-2.226632, 0.2493203, -0.8988259, 1, 0.07058824, 0, 1,
-2.221686, 2.218359, 0.2205219, 1, 0.07843138, 0, 1,
-2.190814, -1.489405, -2.51524, 1, 0.08235294, 0, 1,
-2.174934, -0.7894634, -2.889509, 1, 0.09019608, 0, 1,
-2.171655, -2.143193, -3.687128, 1, 0.09411765, 0, 1,
-2.141464, -2.134044, -1.404141, 1, 0.1019608, 0, 1,
-2.138459, 0.6221243, 0.03488855, 1, 0.1098039, 0, 1,
-2.128019, 0.8686454, -0.8651132, 1, 0.1137255, 0, 1,
-2.104844, -1.690596, -3.231883, 1, 0.1215686, 0, 1,
-2.089234, 1.033829, -1.267255, 1, 0.1254902, 0, 1,
-2.066252, -2.088801, -1.508461, 1, 0.1333333, 0, 1,
-2.055822, 0.8622423, -0.2667192, 1, 0.1372549, 0, 1,
-2.054804, 1.299913, -1.450508, 1, 0.145098, 0, 1,
-2.020518, -0.02308159, -1.00282, 1, 0.1490196, 0, 1,
-2.01876, 0.0417803, -1.232424, 1, 0.1568628, 0, 1,
-2.011029, 1.208813, -2.471954, 1, 0.1607843, 0, 1,
-1.971066, 1.254727, -1.463244, 1, 0.1686275, 0, 1,
-1.966141, 0.9977555, -1.562301, 1, 0.172549, 0, 1,
-1.963753, -0.3963573, -3.291623, 1, 0.1803922, 0, 1,
-1.958108, -1.92732, -1.311537, 1, 0.1843137, 0, 1,
-1.897728, -0.04137412, -1.590625, 1, 0.1921569, 0, 1,
-1.896535, 0.3616261, -1.583799, 1, 0.1960784, 0, 1,
-1.878255, -0.5904331, -2.110905, 1, 0.2039216, 0, 1,
-1.876972, -0.823854, -1.373314, 1, 0.2117647, 0, 1,
-1.874566, -0.1453758, -2.619641, 1, 0.2156863, 0, 1,
-1.839161, 0.141131, -2.584108, 1, 0.2235294, 0, 1,
-1.817029, -1.40389, -3.610433, 1, 0.227451, 0, 1,
-1.80848, 0.7703089, -1.12333, 1, 0.2352941, 0, 1,
-1.803275, 1.339106, -0.1902926, 1, 0.2392157, 0, 1,
-1.770704, -0.4840172, -2.301131, 1, 0.2470588, 0, 1,
-1.749612, -0.07289343, -3.17309, 1, 0.2509804, 0, 1,
-1.727839, 0.4490906, -1.288245, 1, 0.2588235, 0, 1,
-1.726662, -1.014216, -2.376097, 1, 0.2627451, 0, 1,
-1.725839, -0.4464475, -2.626323, 1, 0.2705882, 0, 1,
-1.714702, -0.486237, -0.9038358, 1, 0.2745098, 0, 1,
-1.710359, 0.3654088, -2.379414, 1, 0.282353, 0, 1,
-1.688047, 1.620839, -0.6330012, 1, 0.2862745, 0, 1,
-1.684469, -0.2063035, -1.095183, 1, 0.2941177, 0, 1,
-1.65741, 1.341933, 0.6498512, 1, 0.3019608, 0, 1,
-1.65238, 1.789244, -1.150962, 1, 0.3058824, 0, 1,
-1.637175, 0.729475, 0.03373402, 1, 0.3137255, 0, 1,
-1.61765, 1.515594, -1.795035, 1, 0.3176471, 0, 1,
-1.592617, -0.2588966, -1.001887, 1, 0.3254902, 0, 1,
-1.580805, -0.6946362, -0.3559606, 1, 0.3294118, 0, 1,
-1.580555, 1.173554, -1.0442, 1, 0.3372549, 0, 1,
-1.557703, 0.6328072, -2.031144, 1, 0.3411765, 0, 1,
-1.555407, -0.3396768, -2.301103, 1, 0.3490196, 0, 1,
-1.554337, -2.313967, -2.767996, 1, 0.3529412, 0, 1,
-1.54956, 0.3236444, -2.214596, 1, 0.3607843, 0, 1,
-1.54811, 1.373477, -2.194957, 1, 0.3647059, 0, 1,
-1.543954, 1.406481, 0.2545462, 1, 0.372549, 0, 1,
-1.539372, 0.3134337, -0.8860875, 1, 0.3764706, 0, 1,
-1.520463, -1.688667, -3.374573, 1, 0.3843137, 0, 1,
-1.520362, -0.5633993, -0.9651469, 1, 0.3882353, 0, 1,
-1.514474, 0.04874058, -2.88169, 1, 0.3960784, 0, 1,
-1.513728, 0.7822763, -0.4828608, 1, 0.4039216, 0, 1,
-1.510633, 1.496715, -0.563193, 1, 0.4078431, 0, 1,
-1.503245, -0.6319174, -0.8941444, 1, 0.4156863, 0, 1,
-1.486768, 0.997135, -3.244208, 1, 0.4196078, 0, 1,
-1.485261, -0.9587663, -3.528693, 1, 0.427451, 0, 1,
-1.47305, -0.5588822, -1.097085, 1, 0.4313726, 0, 1,
-1.465821, -0.01029435, -2.064207, 1, 0.4392157, 0, 1,
-1.460142, 0.6279182, -1.341523, 1, 0.4431373, 0, 1,
-1.450537, -0.9269477, -0.97803, 1, 0.4509804, 0, 1,
-1.448529, 1.671315, 0.1923622, 1, 0.454902, 0, 1,
-1.447362, 0.9323598, -0.3125919, 1, 0.4627451, 0, 1,
-1.432649, -1.638059, -3.740531, 1, 0.4666667, 0, 1,
-1.417445, -0.8572335, -2.913683, 1, 0.4745098, 0, 1,
-1.414874, 1.16682, -0.6166216, 1, 0.4784314, 0, 1,
-1.413193, -1.377994, -3.002027, 1, 0.4862745, 0, 1,
-1.405142, 1.734887, -1.222798, 1, 0.4901961, 0, 1,
-1.396963, -0.9853242, -1.393157, 1, 0.4980392, 0, 1,
-1.393618, -0.9401719, -2.709166, 1, 0.5058824, 0, 1,
-1.386197, 0.155605, -1.184913, 1, 0.509804, 0, 1,
-1.385231, -1.606907, -1.511526, 1, 0.5176471, 0, 1,
-1.364672, -1.307859, -2.833206, 1, 0.5215687, 0, 1,
-1.360355, -0.9142209, -2.499567, 1, 0.5294118, 0, 1,
-1.357289, 0.7604731, -1.57312, 1, 0.5333334, 0, 1,
-1.354247, -1.911558, -3.282804, 1, 0.5411765, 0, 1,
-1.336782, 0.6718484, -3.247609, 1, 0.5450981, 0, 1,
-1.326666, -1.212722, -4.093527, 1, 0.5529412, 0, 1,
-1.323522, -1.777566, -1.993347, 1, 0.5568628, 0, 1,
-1.320696, 1.538044, -1.786644, 1, 0.5647059, 0, 1,
-1.315886, -0.6381311, -1.828189, 1, 0.5686275, 0, 1,
-1.315331, 1.624256, -0.5928836, 1, 0.5764706, 0, 1,
-1.312812, 0.01529211, -1.237324, 1, 0.5803922, 0, 1,
-1.309707, -0.5854692, -2.212319, 1, 0.5882353, 0, 1,
-1.299924, -1.118838, -0.7424935, 1, 0.5921569, 0, 1,
-1.299892, -1.373932, -3.429736, 1, 0.6, 0, 1,
-1.289279, 0.03890904, 0.5667843, 1, 0.6078432, 0, 1,
-1.277611, 0.8798578, -2.689507, 1, 0.6117647, 0, 1,
-1.272482, 0.1150248, -1.51968, 1, 0.6196079, 0, 1,
-1.268552, -0.2643787, -0.08012276, 1, 0.6235294, 0, 1,
-1.26532, 0.7595689, -2.537478, 1, 0.6313726, 0, 1,
-1.264279, 1.036486, -1.264817, 1, 0.6352941, 0, 1,
-1.261259, -0.2933079, -1.724862, 1, 0.6431373, 0, 1,
-1.255235, -2.437595, -2.526849, 1, 0.6470588, 0, 1,
-1.250664, 0.7899749, -0.1084828, 1, 0.654902, 0, 1,
-1.242459, 0.2778015, -2.440552, 1, 0.6588235, 0, 1,
-1.238844, -1.782424, -4.357154, 1, 0.6666667, 0, 1,
-1.23758, -0.9749126, -1.912539, 1, 0.6705883, 0, 1,
-1.237389, -0.1875125, -0.0257764, 1, 0.6784314, 0, 1,
-1.236256, 0.4775428, -1.775494, 1, 0.682353, 0, 1,
-1.229437, 0.9529637, -1.488841, 1, 0.6901961, 0, 1,
-1.224882, -1.024046, -1.507228, 1, 0.6941177, 0, 1,
-1.217395, 1.708885, -0.9366947, 1, 0.7019608, 0, 1,
-1.215034, 0.9421531, 0.090944, 1, 0.7098039, 0, 1,
-1.206538, 1.513424, -0.7277181, 1, 0.7137255, 0, 1,
-1.200132, 0.1545703, -1.451606, 1, 0.7215686, 0, 1,
-1.182647, -1.040694, -2.530727, 1, 0.7254902, 0, 1,
-1.181629, 1.508445, -1.242789, 1, 0.7333333, 0, 1,
-1.181285, 2.88491, 1.045798, 1, 0.7372549, 0, 1,
-1.179954, 0.5165925, -0.7717707, 1, 0.7450981, 0, 1,
-1.175356, 2.979848, -0.1070203, 1, 0.7490196, 0, 1,
-1.172838, -0.1861056, -1.583827, 1, 0.7568628, 0, 1,
-1.168216, -1.164374, -4.514069, 1, 0.7607843, 0, 1,
-1.165316, 0.1746844, -1.59823, 1, 0.7686275, 0, 1,
-1.1318, 0.7862229, -0.5386257, 1, 0.772549, 0, 1,
-1.127214, -0.381277, -2.540023, 1, 0.7803922, 0, 1,
-1.120269, -0.9792824, -1.245725, 1, 0.7843137, 0, 1,
-1.117686, -1.398394, -3.142116, 1, 0.7921569, 0, 1,
-1.114012, -1.849874, -2.468542, 1, 0.7960784, 0, 1,
-1.111089, 1.649245, -1.934163, 1, 0.8039216, 0, 1,
-1.105793, -0.4989657, -3.023651, 1, 0.8117647, 0, 1,
-1.103973, -2.518841, -3.102835, 1, 0.8156863, 0, 1,
-1.092943, -0.6358137, -0.7599836, 1, 0.8235294, 0, 1,
-1.090375, -0.3359181, -2.916578, 1, 0.827451, 0, 1,
-1.090319, -0.1538167, -2.708802, 1, 0.8352941, 0, 1,
-1.090201, 0.1603392, -2.316428, 1, 0.8392157, 0, 1,
-1.083773, 1.155916, -0.663581, 1, 0.8470588, 0, 1,
-1.078533, -0.1139775, -1.623345, 1, 0.8509804, 0, 1,
-1.075613, -0.5447962, -1.68627, 1, 0.8588235, 0, 1,
-1.074203, -0.78782, -0.2506649, 1, 0.8627451, 0, 1,
-1.072677, -0.3253701, -2.811768, 1, 0.8705882, 0, 1,
-1.059802, 0.6062303, -0.9140803, 1, 0.8745098, 0, 1,
-1.057453, 1.373537, 1.520931, 1, 0.8823529, 0, 1,
-1.055823, -0.4752294, -1.969512, 1, 0.8862745, 0, 1,
-1.053697, 0.4329712, -1.315865, 1, 0.8941177, 0, 1,
-1.052047, -0.5544589, -2.774757, 1, 0.8980392, 0, 1,
-1.045785, 0.483777, -1.644847, 1, 0.9058824, 0, 1,
-1.031987, -0.4106347, -1.200274, 1, 0.9137255, 0, 1,
-1.02772, 1.512574, 0.5205143, 1, 0.9176471, 0, 1,
-1.027696, 0.522881, -1.141524, 1, 0.9254902, 0, 1,
-1.027041, -1.067213, -1.79123, 1, 0.9294118, 0, 1,
-1.015429, 0.09970545, -1.51709, 1, 0.9372549, 0, 1,
-1.01155, 0.9728809, -0.3898887, 1, 0.9411765, 0, 1,
-1.006684, 0.1379147, -0.5453753, 1, 0.9490196, 0, 1,
-1.004474, 0.3271903, -2.835032, 1, 0.9529412, 0, 1,
-0.9997001, -0.08603486, -1.49993, 1, 0.9607843, 0, 1,
-0.9986771, -0.4372288, -1.921803, 1, 0.9647059, 0, 1,
-0.993995, 1.933233, -0.04258974, 1, 0.972549, 0, 1,
-0.9878849, -0.5080302, -1.946022, 1, 0.9764706, 0, 1,
-0.9877831, -0.8557398, -1.57962, 1, 0.9843137, 0, 1,
-0.9841396, 1.009203, -2.659441, 1, 0.9882353, 0, 1,
-0.9770038, 1.58, -0.1033775, 1, 0.9960784, 0, 1,
-0.973401, -0.9648815, -1.6259, 0.9960784, 1, 0, 1,
-0.9628338, -0.99001, -4.264646, 0.9921569, 1, 0, 1,
-0.960388, 1.230946, -0.06907066, 0.9843137, 1, 0, 1,
-0.9539931, -2.060961, -2.107628, 0.9803922, 1, 0, 1,
-0.9502141, 1.443996, -1.329584, 0.972549, 1, 0, 1,
-0.949132, -0.3202378, -0.7813566, 0.9686275, 1, 0, 1,
-0.94867, 1.56773, -0.07569717, 0.9607843, 1, 0, 1,
-0.9481607, -1.217317, -2.483709, 0.9568627, 1, 0, 1,
-0.9409001, 0.4791226, 0.594899, 0.9490196, 1, 0, 1,
-0.9396349, -0.6399577, -1.133973, 0.945098, 1, 0, 1,
-0.9392418, -0.7000139, -2.55062, 0.9372549, 1, 0, 1,
-0.9327503, 1.194497, -1.277371, 0.9333333, 1, 0, 1,
-0.9315038, 0.7994562, -2.299596, 0.9254902, 1, 0, 1,
-0.9297071, 0.525317, -1.524353, 0.9215686, 1, 0, 1,
-0.9212558, 0.7938947, -0.4544887, 0.9137255, 1, 0, 1,
-0.9181665, 0.3495507, -0.9957059, 0.9098039, 1, 0, 1,
-0.9103773, -0.070452, -1.63488, 0.9019608, 1, 0, 1,
-0.9085839, 0.4528625, -1.419589, 0.8941177, 1, 0, 1,
-0.9066851, 0.6890002, -1.013229, 0.8901961, 1, 0, 1,
-0.9049085, -1.234249, -2.705087, 0.8823529, 1, 0, 1,
-0.9044515, 0.8708857, 0.1017949, 0.8784314, 1, 0, 1,
-0.8935126, -0.3940108, -0.3872643, 0.8705882, 1, 0, 1,
-0.8928332, 1.407641, -1.265123, 0.8666667, 1, 0, 1,
-0.8910707, -1.015344, -3.94895, 0.8588235, 1, 0, 1,
-0.8887486, 1.231648, -0.7485722, 0.854902, 1, 0, 1,
-0.883019, 0.4371078, -0.2255871, 0.8470588, 1, 0, 1,
-0.882002, -1.637112, -3.855837, 0.8431373, 1, 0, 1,
-0.8808723, 0.007237393, -2.604978, 0.8352941, 1, 0, 1,
-0.8802761, -0.5083156, -1.891356, 0.8313726, 1, 0, 1,
-0.8756605, 0.06921645, -1.124453, 0.8235294, 1, 0, 1,
-0.8755883, 0.1544926, -0.1592928, 0.8196079, 1, 0, 1,
-0.8711171, 0.8299001, 0.4466872, 0.8117647, 1, 0, 1,
-0.8695822, -1.636187, -1.575128, 0.8078431, 1, 0, 1,
-0.8667343, -1.700905, -2.639997, 0.8, 1, 0, 1,
-0.8654219, 0.5842668, -0.863188, 0.7921569, 1, 0, 1,
-0.8632256, 0.6406564, -0.6222209, 0.7882353, 1, 0, 1,
-0.8593885, -0.5865955, -1.406103, 0.7803922, 1, 0, 1,
-0.8571383, -0.6261994, -3.243874, 0.7764706, 1, 0, 1,
-0.8569226, -1.166694, -1.392986, 0.7686275, 1, 0, 1,
-0.853631, 1.440367, -0.9935898, 0.7647059, 1, 0, 1,
-0.8532421, 0.264423, -3.314809, 0.7568628, 1, 0, 1,
-0.8461033, 0.8720128, -2.05598, 0.7529412, 1, 0, 1,
-0.8408855, -0.7949836, -3.375028, 0.7450981, 1, 0, 1,
-0.8394305, 0.6970325, -1.729706, 0.7411765, 1, 0, 1,
-0.8384427, -0.7606499, -1.942289, 0.7333333, 1, 0, 1,
-0.8382456, -1.607362, -2.619525, 0.7294118, 1, 0, 1,
-0.8382372, -0.5294605, -2.216496, 0.7215686, 1, 0, 1,
-0.8367264, -1.499418, -2.642783, 0.7176471, 1, 0, 1,
-0.8327744, 1.93856, -0.2718993, 0.7098039, 1, 0, 1,
-0.82881, -0.7649893, -1.70018, 0.7058824, 1, 0, 1,
-0.8231594, 0.3027132, -1.308463, 0.6980392, 1, 0, 1,
-0.8204472, -0.0544625, -1.506411, 0.6901961, 1, 0, 1,
-0.8192999, -2.102702, -2.767747, 0.6862745, 1, 0, 1,
-0.8156481, 0.6573755, 0.16793, 0.6784314, 1, 0, 1,
-0.8137079, 0.03525591, -0.7996099, 0.6745098, 1, 0, 1,
-0.8132762, 0.2284428, -1.120556, 0.6666667, 1, 0, 1,
-0.8092362, -0.4801221, -1.704993, 0.6627451, 1, 0, 1,
-0.806195, -0.320784, -1.708543, 0.654902, 1, 0, 1,
-0.8052726, -1.44718, -2.802732, 0.6509804, 1, 0, 1,
-0.7999855, -1.306593, -2.490211, 0.6431373, 1, 0, 1,
-0.7965856, 0.7696807, -1.09714, 0.6392157, 1, 0, 1,
-0.7957517, -0.2603761, -3.139706, 0.6313726, 1, 0, 1,
-0.7919939, 1.08793, -3.514196, 0.627451, 1, 0, 1,
-0.7868597, 0.1110459, -0.6307573, 0.6196079, 1, 0, 1,
-0.7862177, 1.533962, -0.2136811, 0.6156863, 1, 0, 1,
-0.7800427, 0.2676488, -0.5632087, 0.6078432, 1, 0, 1,
-0.7797401, 1.469442, -0.2362446, 0.6039216, 1, 0, 1,
-0.7746124, -0.06476628, -1.374131, 0.5960785, 1, 0, 1,
-0.7707434, 0.5229523, -1.324421, 0.5882353, 1, 0, 1,
-0.7694685, -0.6340779, -2.07822, 0.5843138, 1, 0, 1,
-0.7672691, -0.7342411, -1.961581, 0.5764706, 1, 0, 1,
-0.7654395, 0.1157227, -0.7696196, 0.572549, 1, 0, 1,
-0.7644877, -0.222761, -3.936006, 0.5647059, 1, 0, 1,
-0.7570738, 0.9415953, 1.149489, 0.5607843, 1, 0, 1,
-0.7555764, 0.5987587, -2.864243, 0.5529412, 1, 0, 1,
-0.7543914, -0.8381682, -3.667998, 0.5490196, 1, 0, 1,
-0.7520385, 0.485432, -0.9835306, 0.5411765, 1, 0, 1,
-0.7515014, -0.5397453, -1.048693, 0.5372549, 1, 0, 1,
-0.7502203, -2.453479, -1.358361, 0.5294118, 1, 0, 1,
-0.740666, 0.4544447, 0.03138525, 0.5254902, 1, 0, 1,
-0.7399614, -0.2356013, -1.0592, 0.5176471, 1, 0, 1,
-0.7318059, 1.539301, -1.631007, 0.5137255, 1, 0, 1,
-0.7251471, -0.3357192, -2.997535, 0.5058824, 1, 0, 1,
-0.7202166, -1.295541, -2.117115, 0.5019608, 1, 0, 1,
-0.7168879, -0.6656454, -2.183628, 0.4941176, 1, 0, 1,
-0.7140121, -0.07793839, -1.908166, 0.4862745, 1, 0, 1,
-0.7133832, 0.1140543, -0.9470105, 0.4823529, 1, 0, 1,
-0.7128163, -1.762412, -1.718654, 0.4745098, 1, 0, 1,
-0.7107694, -1.699633, -5.478094, 0.4705882, 1, 0, 1,
-0.7071776, 1.80422, -0.4425499, 0.4627451, 1, 0, 1,
-0.6953458, 0.3645908, 0.1661708, 0.4588235, 1, 0, 1,
-0.6932586, -0.2921378, -2.419606, 0.4509804, 1, 0, 1,
-0.6914004, -1.553525, -2.578358, 0.4470588, 1, 0, 1,
-0.6872184, 1.660151, 0.7537533, 0.4392157, 1, 0, 1,
-0.6834896, 1.682837, -0.6688209, 0.4352941, 1, 0, 1,
-0.6827416, -0.2947495, -2.500074, 0.427451, 1, 0, 1,
-0.6826784, 0.183231, -3.318595, 0.4235294, 1, 0, 1,
-0.680192, 0.5885995, -0.2141706, 0.4156863, 1, 0, 1,
-0.6782709, -0.6915718, -3.822067, 0.4117647, 1, 0, 1,
-0.6749499, -0.2576037, -1.237488, 0.4039216, 1, 0, 1,
-0.6702714, 0.1881789, -1.103345, 0.3960784, 1, 0, 1,
-0.6637651, -0.472368, -1.797327, 0.3921569, 1, 0, 1,
-0.6617528, -0.5283369, -0.7745815, 0.3843137, 1, 0, 1,
-0.6583558, -0.07320815, -0.3878997, 0.3803922, 1, 0, 1,
-0.6561396, -1.4764, -2.137267, 0.372549, 1, 0, 1,
-0.6549004, -0.1727997, -3.037276, 0.3686275, 1, 0, 1,
-0.6541013, -0.3941291, -2.690647, 0.3607843, 1, 0, 1,
-0.6520169, 0.4562417, -3.079603, 0.3568628, 1, 0, 1,
-0.6516626, 1.032318, -0.6870946, 0.3490196, 1, 0, 1,
-0.6440254, 0.7324139, -0.7421447, 0.345098, 1, 0, 1,
-0.6440172, 0.02480103, -2.262346, 0.3372549, 1, 0, 1,
-0.6436597, -0.2500685, -1.779336, 0.3333333, 1, 0, 1,
-0.6338013, -2.405846, -3.491968, 0.3254902, 1, 0, 1,
-0.6206027, 1.039982, -1.002259, 0.3215686, 1, 0, 1,
-0.6145738, -1.132806, -1.30802, 0.3137255, 1, 0, 1,
-0.607067, -0.1643777, 0.8378751, 0.3098039, 1, 0, 1,
-0.6052865, -0.9938973, -3.849285, 0.3019608, 1, 0, 1,
-0.6049734, -0.4612871, -4.084408, 0.2941177, 1, 0, 1,
-0.6040174, 0.7412899, -2.282557, 0.2901961, 1, 0, 1,
-0.6017541, 1.11703, -0.3767426, 0.282353, 1, 0, 1,
-0.5968738, 1.385662, -0.1550922, 0.2784314, 1, 0, 1,
-0.5887187, -0.06092337, -1.576392, 0.2705882, 1, 0, 1,
-0.587997, -0.5231043, -3.788206, 0.2666667, 1, 0, 1,
-0.5870357, -0.3244043, -2.738254, 0.2588235, 1, 0, 1,
-0.5770705, -0.4075726, -2.508604, 0.254902, 1, 0, 1,
-0.5758331, -0.3754528, -2.413352, 0.2470588, 1, 0, 1,
-0.5726441, -0.9317861, -1.730042, 0.2431373, 1, 0, 1,
-0.5721653, 1.158937, 0.491371, 0.2352941, 1, 0, 1,
-0.5638707, -1.591628, -1.629382, 0.2313726, 1, 0, 1,
-0.5615928, -0.7435141, -3.036339, 0.2235294, 1, 0, 1,
-0.5610335, 0.6318877, 0.04988548, 0.2196078, 1, 0, 1,
-0.5537634, 0.1815409, -0.7896972, 0.2117647, 1, 0, 1,
-0.5533763, 0.1116668, -0.833185, 0.2078431, 1, 0, 1,
-0.5474226, 0.3181674, -0.6911904, 0.2, 1, 0, 1,
-0.5460602, -1.71065, -3.541771, 0.1921569, 1, 0, 1,
-0.5460422, 1.133399, -0.8449474, 0.1882353, 1, 0, 1,
-0.5448188, -1.160198, -2.759337, 0.1803922, 1, 0, 1,
-0.5376886, 0.1786985, -1.687731, 0.1764706, 1, 0, 1,
-0.537074, -1.391217, -3.965929, 0.1686275, 1, 0, 1,
-0.534991, 1.157939, -0.7307607, 0.1647059, 1, 0, 1,
-0.5332841, 1.314649, -0.5165323, 0.1568628, 1, 0, 1,
-0.5270815, -0.3617809, -1.077056, 0.1529412, 1, 0, 1,
-0.5250679, -0.8112941, -2.867558, 0.145098, 1, 0, 1,
-0.5209809, -0.4952883, -2.060459, 0.1411765, 1, 0, 1,
-0.5167573, -0.4099009, -1.079705, 0.1333333, 1, 0, 1,
-0.5110304, 0.1222759, -0.9499129, 0.1294118, 1, 0, 1,
-0.5066581, 0.8102903, 0.8753824, 0.1215686, 1, 0, 1,
-0.5061862, 1.016455, 0.1648249, 0.1176471, 1, 0, 1,
-0.5037266, 0.1240241, -1.324681, 0.1098039, 1, 0, 1,
-0.5036694, 0.3395866, -0.05103342, 0.1058824, 1, 0, 1,
-0.5025741, 0.2498844, -2.102049, 0.09803922, 1, 0, 1,
-0.4996237, -0.9253523, -1.458964, 0.09019608, 1, 0, 1,
-0.4959305, -0.7073827, -2.924472, 0.08627451, 1, 0, 1,
-0.4949306, -1.499123, -1.560432, 0.07843138, 1, 0, 1,
-0.4932844, -0.2339122, -1.295338, 0.07450981, 1, 0, 1,
-0.4881202, -0.5561643, -2.791112, 0.06666667, 1, 0, 1,
-0.4876741, 0.5331752, -0.2783265, 0.0627451, 1, 0, 1,
-0.4832731, -0.4309977, -1.194492, 0.05490196, 1, 0, 1,
-0.4832278, -1.016655, -0.3789001, 0.05098039, 1, 0, 1,
-0.4760809, 0.4777068, -1.591177, 0.04313726, 1, 0, 1,
-0.4709382, 0.5317819, -1.791172, 0.03921569, 1, 0, 1,
-0.4692244, 2.276036, -0.8608727, 0.03137255, 1, 0, 1,
-0.4673428, 1.682193, -1.320457, 0.02745098, 1, 0, 1,
-0.4668444, -1.265973, -2.307255, 0.01960784, 1, 0, 1,
-0.4623678, -0.1454189, -1.63366, 0.01568628, 1, 0, 1,
-0.462192, 1.368323, 0.2107118, 0.007843138, 1, 0, 1,
-0.4556484, -1.515703, -2.45692, 0.003921569, 1, 0, 1,
-0.4460954, 0.6559138, -1.277879, 0, 1, 0.003921569, 1,
-0.4437004, -1.192354, -2.409463, 0, 1, 0.01176471, 1,
-0.4405054, -0.7432576, -2.660125, 0, 1, 0.01568628, 1,
-0.42883, -1.193096, -1.314753, 0, 1, 0.02352941, 1,
-0.4272978, 0.5872864, -1.348673, 0, 1, 0.02745098, 1,
-0.4268495, -0.5610862, -3.164005, 0, 1, 0.03529412, 1,
-0.424318, 0.4346316, -1.142521, 0, 1, 0.03921569, 1,
-0.4230159, 0.2363582, -1.932783, 0, 1, 0.04705882, 1,
-0.4208106, 0.6630951, 1.291739, 0, 1, 0.05098039, 1,
-0.4169479, 2.205769, 0.04376329, 0, 1, 0.05882353, 1,
-0.4168935, -0.2972301, -1.973589, 0, 1, 0.0627451, 1,
-0.4165325, -0.5729848, -1.372024, 0, 1, 0.07058824, 1,
-0.4158182, 1.128234, 0.5291184, 0, 1, 0.07450981, 1,
-0.4115062, 0.6331581, -1.395533, 0, 1, 0.08235294, 1,
-0.4101783, 1.718893, 1.613215, 0, 1, 0.08627451, 1,
-0.40935, 1.389259, -1.815278, 0, 1, 0.09411765, 1,
-0.4069155, 1.069409, -0.3497277, 0, 1, 0.1019608, 1,
-0.4055276, 1.350389, 0.475985, 0, 1, 0.1058824, 1,
-0.4037981, -0.7492822, -4.084226, 0, 1, 0.1137255, 1,
-0.4026799, 0.4291563, -0.2048198, 0, 1, 0.1176471, 1,
-0.4009188, -0.07861351, -1.029084, 0, 1, 0.1254902, 1,
-0.3988541, -0.9986238, -4.303288, 0, 1, 0.1294118, 1,
-0.3949789, 0.2451077, -1.016367, 0, 1, 0.1372549, 1,
-0.3913772, -0.984601, -2.024652, 0, 1, 0.1411765, 1,
-0.3889005, 0.1060031, -1.785372, 0, 1, 0.1490196, 1,
-0.3828014, 0.5868682, -0.1582458, 0, 1, 0.1529412, 1,
-0.3800927, 0.2953145, -1.680159, 0, 1, 0.1607843, 1,
-0.3790094, 0.9192488, -0.05594302, 0, 1, 0.1647059, 1,
-0.3779038, 0.2987615, -0.1326815, 0, 1, 0.172549, 1,
-0.3741207, -1.27378, -2.794172, 0, 1, 0.1764706, 1,
-0.361857, 0.3479926, -1.174742, 0, 1, 0.1843137, 1,
-0.360061, 0.008213892, -1.785249, 0, 1, 0.1882353, 1,
-0.3577998, 0.7917112, -1.037736, 0, 1, 0.1960784, 1,
-0.3566934, -1.021513, -3.020953, 0, 1, 0.2039216, 1,
-0.3489497, -1.358119, -4.447906, 0, 1, 0.2078431, 1,
-0.3446594, -1.495543, -3.330505, 0, 1, 0.2156863, 1,
-0.3442806, -2.638798, -2.776595, 0, 1, 0.2196078, 1,
-0.3433066, -0.2566239, -2.184021, 0, 1, 0.227451, 1,
-0.3406235, 2.52975, -0.3950197, 0, 1, 0.2313726, 1,
-0.3361769, 0.9154417, -0.9528086, 0, 1, 0.2392157, 1,
-0.3341262, 0.5934348, -2.380046, 0, 1, 0.2431373, 1,
-0.3315798, 0.4387126, -0.5181888, 0, 1, 0.2509804, 1,
-0.331501, 0.8454427, -0.1211418, 0, 1, 0.254902, 1,
-0.325422, 1.599553, -0.2336796, 0, 1, 0.2627451, 1,
-0.3245592, 0.2768149, -1.190188, 0, 1, 0.2666667, 1,
-0.3226805, -0.4724323, -3.802941, 0, 1, 0.2745098, 1,
-0.3222571, 0.3635985, -1.129961, 0, 1, 0.2784314, 1,
-0.3214562, 1.894176, -0.3768032, 0, 1, 0.2862745, 1,
-0.3158553, -1.744016, -2.846625, 0, 1, 0.2901961, 1,
-0.3061152, 1.326878, 0.4430647, 0, 1, 0.2980392, 1,
-0.3023328, -1.046148, -2.715439, 0, 1, 0.3058824, 1,
-0.3017617, 0.471149, -1.59939, 0, 1, 0.3098039, 1,
-0.2996053, -1.438006, -3.26522, 0, 1, 0.3176471, 1,
-0.2967823, -0.8006475, -2.54626, 0, 1, 0.3215686, 1,
-0.2945291, -1.641842, -2.776753, 0, 1, 0.3294118, 1,
-0.2929905, -0.2526871, -1.507024, 0, 1, 0.3333333, 1,
-0.2927108, 0.06786843, -1.90637, 0, 1, 0.3411765, 1,
-0.2917282, 0.1367168, -1.279658, 0, 1, 0.345098, 1,
-0.2861251, 0.6205837, -0.6526424, 0, 1, 0.3529412, 1,
-0.2852383, -1.814145, -3.864424, 0, 1, 0.3568628, 1,
-0.2847324, -1.039737, -2.002786, 0, 1, 0.3647059, 1,
-0.282973, 1.573056, -0.9004928, 0, 1, 0.3686275, 1,
-0.2801147, 0.2242402, -0.6457761, 0, 1, 0.3764706, 1,
-0.2782242, 1.507731, -0.5169235, 0, 1, 0.3803922, 1,
-0.2777891, 0.3952515, 1.223914, 0, 1, 0.3882353, 1,
-0.2763433, 0.7465125, -0.6043994, 0, 1, 0.3921569, 1,
-0.2665014, 0.1218717, -1.13821, 0, 1, 0.4, 1,
-0.264909, 1.401122, -0.4809853, 0, 1, 0.4078431, 1,
-0.2643141, 0.1810818, -2.932282, 0, 1, 0.4117647, 1,
-0.2642262, 0.2360558, -0.1695369, 0, 1, 0.4196078, 1,
-0.2631329, -0.1055955, -1.328694, 0, 1, 0.4235294, 1,
-0.2621618, 1.555332, -0.3613359, 0, 1, 0.4313726, 1,
-0.255102, -0.2091654, -2.319226, 0, 1, 0.4352941, 1,
-0.2549555, -2.399265, -3.976229, 0, 1, 0.4431373, 1,
-0.244379, 1.461273, -0.475334, 0, 1, 0.4470588, 1,
-0.2406658, -1.754044, -3.700833, 0, 1, 0.454902, 1,
-0.2347116, -0.9678711, -3.260188, 0, 1, 0.4588235, 1,
-0.2310885, 0.3083124, -0.4316467, 0, 1, 0.4666667, 1,
-0.2285721, -0.6339306, -1.911776, 0, 1, 0.4705882, 1,
-0.2196249, -0.6622861, -2.518601, 0, 1, 0.4784314, 1,
-0.2152107, 0.7830826, 0.6881206, 0, 1, 0.4823529, 1,
-0.212753, 2.155147, -0.239909, 0, 1, 0.4901961, 1,
-0.2108001, 0.5244138, 0.3426189, 0, 1, 0.4941176, 1,
-0.2104343, -0.3352311, -0.5883657, 0, 1, 0.5019608, 1,
-0.2087063, 0.06546948, -1.946115, 0, 1, 0.509804, 1,
-0.2068018, -0.4500287, -3.412082, 0, 1, 0.5137255, 1,
-0.2067904, 2.76775, -0.4892476, 0, 1, 0.5215687, 1,
-0.2056941, -0.6912188, -4.430921, 0, 1, 0.5254902, 1,
-0.2051607, 0.403896, -0.6187994, 0, 1, 0.5333334, 1,
-0.2040103, 1.868459, 0.0266954, 0, 1, 0.5372549, 1,
-0.20295, -0.07996614, -2.323648, 0, 1, 0.5450981, 1,
-0.1982052, 0.6210694, -0.02509344, 0, 1, 0.5490196, 1,
-0.1959424, 1.007451, -0.1292015, 0, 1, 0.5568628, 1,
-0.1852364, -0.7479314, -2.928609, 0, 1, 0.5607843, 1,
-0.185043, -0.8995888, -2.448231, 0, 1, 0.5686275, 1,
-0.1816911, 1.547317, -1.393789, 0, 1, 0.572549, 1,
-0.1798018, -0.3652721, -4.278766, 0, 1, 0.5803922, 1,
-0.171809, -0.3962186, -2.666326, 0, 1, 0.5843138, 1,
-0.1702256, -1.570347, -2.623427, 0, 1, 0.5921569, 1,
-0.1644047, 1.89734, -0.3152169, 0, 1, 0.5960785, 1,
-0.1509196, 0.4222965, -1.355534, 0, 1, 0.6039216, 1,
-0.148921, -0.1772455, -1.356588, 0, 1, 0.6117647, 1,
-0.1459094, 1.144077, -1.403067, 0, 1, 0.6156863, 1,
-0.1444074, 0.6515949, -1.1101, 0, 1, 0.6235294, 1,
-0.1366723, -0.6742201, -4.889035, 0, 1, 0.627451, 1,
-0.1366332, -1.124864, -1.102248, 0, 1, 0.6352941, 1,
-0.1332077, 0.1698137, -1.430157, 0, 1, 0.6392157, 1,
-0.1330029, 0.216877, -1.555261, 0, 1, 0.6470588, 1,
-0.132952, 1.631079, -1.042845, 0, 1, 0.6509804, 1,
-0.1313721, 0.6462719, -1.355569, 0, 1, 0.6588235, 1,
-0.1302928, 0.1010683, -1.817934, 0, 1, 0.6627451, 1,
-0.122043, 0.6596632, -1.499068, 0, 1, 0.6705883, 1,
-0.1195035, 2.244819, 0.2964146, 0, 1, 0.6745098, 1,
-0.118704, -1.176046, -2.173852, 0, 1, 0.682353, 1,
-0.1167817, -1.766814, -3.284122, 0, 1, 0.6862745, 1,
-0.112325, 1.288167, 0.3197073, 0, 1, 0.6941177, 1,
-0.1118377, -0.08830933, -3.537554, 0, 1, 0.7019608, 1,
-0.1086199, 0.7495533, 1.572944, 0, 1, 0.7058824, 1,
-0.1085768, 0.5716737, 1.437136, 0, 1, 0.7137255, 1,
-0.1044775, 1.257516, -2.158808, 0, 1, 0.7176471, 1,
-0.1033834, 0.1203143, 0.2934064, 0, 1, 0.7254902, 1,
-0.09836558, -0.429311, -1.305614, 0, 1, 0.7294118, 1,
-0.09131882, -1.443533, -2.965337, 0, 1, 0.7372549, 1,
-0.0790296, 0.4019011, -0.9360885, 0, 1, 0.7411765, 1,
-0.0785176, 0.03055206, -2.473554, 0, 1, 0.7490196, 1,
-0.07583829, 1.454276, -0.7290825, 0, 1, 0.7529412, 1,
-0.0756174, 1.329892, 0.2525961, 0, 1, 0.7607843, 1,
-0.07458418, -0.03197847, -2.40196, 0, 1, 0.7647059, 1,
-0.07406434, 1.164096, -0.3165128, 0, 1, 0.772549, 1,
-0.0723208, -0.4675049, -2.625501, 0, 1, 0.7764706, 1,
-0.07056132, -0.5682387, -1.044931, 0, 1, 0.7843137, 1,
-0.06771898, -2.544231, -4.932741, 0, 1, 0.7882353, 1,
-0.06708395, -0.1971599, -2.840659, 0, 1, 0.7960784, 1,
-0.06674112, -0.05494374, -2.172241, 0, 1, 0.8039216, 1,
-0.06554116, 0.4185835, -1.120282, 0, 1, 0.8078431, 1,
-0.06263991, 0.1664321, -0.2173804, 0, 1, 0.8156863, 1,
-0.0609651, -1.618918, -2.450046, 0, 1, 0.8196079, 1,
-0.06070564, -0.8923382, -3.045979, 0, 1, 0.827451, 1,
-0.05649278, -0.9314219, -2.120392, 0, 1, 0.8313726, 1,
-0.05493969, -0.5763656, -3.02796, 0, 1, 0.8392157, 1,
-0.05446408, 0.2959239, -0.7864389, 0, 1, 0.8431373, 1,
-0.05354329, -0.3633731, -2.643276, 0, 1, 0.8509804, 1,
-0.05339873, 0.07131426, -1.70242, 0, 1, 0.854902, 1,
-0.05328809, -0.08417773, -3.680169, 0, 1, 0.8627451, 1,
-0.05250433, 0.4917199, -0.2956948, 0, 1, 0.8666667, 1,
-0.05242437, 1.033052, 1.729663, 0, 1, 0.8745098, 1,
-0.04832732, -2.5509, -2.875838, 0, 1, 0.8784314, 1,
-0.04676654, 0.2167496, -0.8345782, 0, 1, 0.8862745, 1,
-0.04544184, -0.8633134, -3.985793, 0, 1, 0.8901961, 1,
-0.04323306, -0.4113608, -3.198791, 0, 1, 0.8980392, 1,
-0.04269084, 1.698555, 1.735632, 0, 1, 0.9058824, 1,
-0.04042919, -0.2772088, -3.436949, 0, 1, 0.9098039, 1,
-0.03550955, -0.3488219, -4.154233, 0, 1, 0.9176471, 1,
-0.03393327, 0.2149046, -1.47565, 0, 1, 0.9215686, 1,
-0.03342095, 1.102111, 0.3842087, 0, 1, 0.9294118, 1,
-0.02296357, 0.2853679, -0.8047451, 0, 1, 0.9333333, 1,
-0.02273253, 1.232288, -0.4843229, 0, 1, 0.9411765, 1,
-0.02248119, -0.4239788, -2.735988, 0, 1, 0.945098, 1,
-0.0218534, -0.05787807, -4.768325, 0, 1, 0.9529412, 1,
-0.02109466, -0.574758, -2.122772, 0, 1, 0.9568627, 1,
-0.007092203, -0.890272, -3.142402, 0, 1, 0.9647059, 1,
-0.006885852, 0.8418968, 1.015348, 0, 1, 0.9686275, 1,
-0.001603332, 1.013154, 0.3927502, 0, 1, 0.9764706, 1,
-0.0006125017, -0.7581626, -3.413253, 0, 1, 0.9803922, 1,
0.001267137, -0.3122735, 4.738562, 0, 1, 0.9882353, 1,
0.001600435, -0.6125181, 0.6335776, 0, 1, 0.9921569, 1,
0.001824751, -0.3182366, 1.976098, 0, 1, 1, 1,
0.004640788, -0.6074864, 3.331986, 0, 0.9921569, 1, 1,
0.006136436, 0.1346526, -1.994565, 0, 0.9882353, 1, 1,
0.008273841, 0.1045823, -0.234674, 0, 0.9803922, 1, 1,
0.01160053, 1.104902, -2.569942, 0, 0.9764706, 1, 1,
0.01343398, -0.2522437, 1.532826, 0, 0.9686275, 1, 1,
0.01419469, -1.629903, 2.673357, 0, 0.9647059, 1, 1,
0.01448649, 0.4772944, 0.2418608, 0, 0.9568627, 1, 1,
0.01626439, -0.4108894, 4.015717, 0, 0.9529412, 1, 1,
0.01682918, -0.175287, 2.990966, 0, 0.945098, 1, 1,
0.0182036, -0.9648389, 1.585256, 0, 0.9411765, 1, 1,
0.02057932, 1.207578, -0.9243655, 0, 0.9333333, 1, 1,
0.02200626, -0.4136034, 1.028986, 0, 0.9294118, 1, 1,
0.02262436, 1.060728, -0.6018748, 0, 0.9215686, 1, 1,
0.02297914, -1.251282, 3.659278, 0, 0.9176471, 1, 1,
0.02353118, -0.03808133, 1.307757, 0, 0.9098039, 1, 1,
0.02387959, 0.0610586, 0.0431244, 0, 0.9058824, 1, 1,
0.02470403, 1.061532, -0.7435638, 0, 0.8980392, 1, 1,
0.0250483, -2.401366, 2.584223, 0, 0.8901961, 1, 1,
0.02935032, -0.3282026, 1.553279, 0, 0.8862745, 1, 1,
0.03267137, -0.8894764, 4.744376, 0, 0.8784314, 1, 1,
0.03461295, 0.7339858, -0.2138336, 0, 0.8745098, 1, 1,
0.03933186, 0.0842505, 0.334862, 0, 0.8666667, 1, 1,
0.04114291, 0.6690704, 0.9929467, 0, 0.8627451, 1, 1,
0.04328004, 1.601951, 0.2169679, 0, 0.854902, 1, 1,
0.0435056, -0.02423093, 0.5704976, 0, 0.8509804, 1, 1,
0.04397563, -0.05979734, 1.375319, 0, 0.8431373, 1, 1,
0.04557461, -1.098713, 3.19188, 0, 0.8392157, 1, 1,
0.04931867, 1.204052, -0.9533898, 0, 0.8313726, 1, 1,
0.05310141, 0.3098652, 0.05829084, 0, 0.827451, 1, 1,
0.05534939, 1.028941, 0.7153257, 0, 0.8196079, 1, 1,
0.05675793, -0.8131426, 4.442488, 0, 0.8156863, 1, 1,
0.06079496, -2.166449, 1.434056, 0, 0.8078431, 1, 1,
0.06582172, 0.1679348, 2.197029, 0, 0.8039216, 1, 1,
0.0664727, -0.5084758, 1.919312, 0, 0.7960784, 1, 1,
0.06700714, -0.6347756, 0.721628, 0, 0.7882353, 1, 1,
0.06747595, -0.2633806, 3.615737, 0, 0.7843137, 1, 1,
0.06787584, 0.7946686, 0.5419682, 0, 0.7764706, 1, 1,
0.06830399, 1.414053, 1.299818, 0, 0.772549, 1, 1,
0.07444064, 1.793333, 1.630517, 0, 0.7647059, 1, 1,
0.07798587, -0.7324549, 2.113935, 0, 0.7607843, 1, 1,
0.07825369, -0.07927172, 2.335837, 0, 0.7529412, 1, 1,
0.08055177, -0.4170116, 2.455808, 0, 0.7490196, 1, 1,
0.08063343, -1.141837, 2.909333, 0, 0.7411765, 1, 1,
0.102962, -0.6986827, 3.468169, 0, 0.7372549, 1, 1,
0.1071085, 2.556194, -0.08137289, 0, 0.7294118, 1, 1,
0.1092883, -0.3322766, 2.406726, 0, 0.7254902, 1, 1,
0.1099917, 0.5875224, 0.3652761, 0, 0.7176471, 1, 1,
0.1148891, -1.003436, 4.507627, 0, 0.7137255, 1, 1,
0.1153313, -0.9935032, 2.91186, 0, 0.7058824, 1, 1,
0.1181828, -0.1450937, 2.517905, 0, 0.6980392, 1, 1,
0.1183012, 2.242318, 0.5356308, 0, 0.6941177, 1, 1,
0.1207666, 1.365394, -0.3001141, 0, 0.6862745, 1, 1,
0.1249904, 0.878203, -0.2390457, 0, 0.682353, 1, 1,
0.1271412, 1.351693, 0.5998504, 0, 0.6745098, 1, 1,
0.1286257, 1.165808, 0.4698562, 0, 0.6705883, 1, 1,
0.1288282, 0.1613005, 1.390302, 0, 0.6627451, 1, 1,
0.1304305, 0.2457895, -1.059896, 0, 0.6588235, 1, 1,
0.1340179, 1.400568, 1.042672, 0, 0.6509804, 1, 1,
0.1345235, -2.942364, 2.090599, 0, 0.6470588, 1, 1,
0.1441002, 0.5372145, 1.260435, 0, 0.6392157, 1, 1,
0.1514438, -0.6702839, 3.298289, 0, 0.6352941, 1, 1,
0.151645, -0.4440401, 3.854872, 0, 0.627451, 1, 1,
0.15231, 0.4294711, 1.18687, 0, 0.6235294, 1, 1,
0.1540787, 0.734242, 0.450688, 0, 0.6156863, 1, 1,
0.1611477, -2.007735, 1.893456, 0, 0.6117647, 1, 1,
0.1618804, -0.450836, 2.935521, 0, 0.6039216, 1, 1,
0.1620827, -0.300413, 3.26725, 0, 0.5960785, 1, 1,
0.1647222, 0.3789826, 1.211137, 0, 0.5921569, 1, 1,
0.1678917, 1.097326, 0.4941328, 0, 0.5843138, 1, 1,
0.1785337, -0.1038679, 1.828945, 0, 0.5803922, 1, 1,
0.1787975, -0.1910116, 3.485427, 0, 0.572549, 1, 1,
0.1796746, 1.296775, 0.3149211, 0, 0.5686275, 1, 1,
0.1814878, 0.8822386, 0.5130636, 0, 0.5607843, 1, 1,
0.1823984, 1.302465, 0.1593792, 0, 0.5568628, 1, 1,
0.1842795, 0.4642791, 0.3642717, 0, 0.5490196, 1, 1,
0.189953, 0.1891546, 1.791465, 0, 0.5450981, 1, 1,
0.1925551, 0.6866886, 0.6702814, 0, 0.5372549, 1, 1,
0.1954632, -0.4097424, 2.406536, 0, 0.5333334, 1, 1,
0.1990787, -0.4286069, 4.038152, 0, 0.5254902, 1, 1,
0.2019817, -1.167654, 4.079199, 0, 0.5215687, 1, 1,
0.2023069, -1.267455, 1.979846, 0, 0.5137255, 1, 1,
0.204743, 0.6025699, 0.2519798, 0, 0.509804, 1, 1,
0.2058653, 1.785481, -0.1842817, 0, 0.5019608, 1, 1,
0.2071979, -0.7051218, 2.681376, 0, 0.4941176, 1, 1,
0.2087859, -0.4672267, 2.378633, 0, 0.4901961, 1, 1,
0.2089852, 0.2924966, 2.137908, 0, 0.4823529, 1, 1,
0.2099922, 0.9717755, -0.1291496, 0, 0.4784314, 1, 1,
0.2107232, -0.1711995, 1.705715, 0, 0.4705882, 1, 1,
0.2117817, -0.1166174, 0.5225322, 0, 0.4666667, 1, 1,
0.2132079, -0.7422519, 5.564388, 0, 0.4588235, 1, 1,
0.2206509, 0.7626218, 0.7100673, 0, 0.454902, 1, 1,
0.221327, -0.002209002, 1.893721, 0, 0.4470588, 1, 1,
0.2227643, -1.724065, 3.796673, 0, 0.4431373, 1, 1,
0.2233652, -1.285268, 3.026179, 0, 0.4352941, 1, 1,
0.224033, -0.4581235, 4.135088, 0, 0.4313726, 1, 1,
0.2316787, -0.524539, 0.5412796, 0, 0.4235294, 1, 1,
0.2407034, 1.840245, -0.573231, 0, 0.4196078, 1, 1,
0.241417, 1.251889, -0.6011327, 0, 0.4117647, 1, 1,
0.24556, -0.001958511, -0.3295806, 0, 0.4078431, 1, 1,
0.2461218, -1.388248, 3.096925, 0, 0.4, 1, 1,
0.2474123, 1.204912, 0.05966643, 0, 0.3921569, 1, 1,
0.2476328, -0.5854915, 4.161637, 0, 0.3882353, 1, 1,
0.2539569, 1.162891, 1.15621, 0, 0.3803922, 1, 1,
0.2599815, -0.7420858, 2.660027, 0, 0.3764706, 1, 1,
0.2609985, -0.447771, 1.99179, 0, 0.3686275, 1, 1,
0.2641614, -0.02121417, 2.748743, 0, 0.3647059, 1, 1,
0.2646958, 0.174131, 0.3830321, 0, 0.3568628, 1, 1,
0.2660745, -1.237989, 0.2970121, 0, 0.3529412, 1, 1,
0.2666115, -0.06229452, 1.913602, 0, 0.345098, 1, 1,
0.2673102, -0.428114, 2.740505, 0, 0.3411765, 1, 1,
0.2679818, -2.365961, 2.559895, 0, 0.3333333, 1, 1,
0.2698052, -0.327098, -0.4629125, 0, 0.3294118, 1, 1,
0.2711381, 0.1859078, 0.2196373, 0, 0.3215686, 1, 1,
0.2765301, 0.4657319, 2.292948, 0, 0.3176471, 1, 1,
0.2771236, -1.725609, 3.912518, 0, 0.3098039, 1, 1,
0.2846775, 0.03518651, 2.018482, 0, 0.3058824, 1, 1,
0.2884862, 0.3503242, 0.3230408, 0, 0.2980392, 1, 1,
0.2891182, 0.6666453, 1.047492, 0, 0.2901961, 1, 1,
0.2900294, 0.7363692, 1.933831, 0, 0.2862745, 1, 1,
0.2918168, -1.249874, 3.981057, 0, 0.2784314, 1, 1,
0.2921706, -0.3064927, 0.763293, 0, 0.2745098, 1, 1,
0.2971012, -0.4204539, 0.8416948, 0, 0.2666667, 1, 1,
0.2974113, 1.3976, -0.594534, 0, 0.2627451, 1, 1,
0.2975857, -1.68235, 1.059505, 0, 0.254902, 1, 1,
0.2990764, -1.184388, 3.56503, 0, 0.2509804, 1, 1,
0.3015566, -0.7916934, 2.405071, 0, 0.2431373, 1, 1,
0.3038494, -0.1168844, 2.845903, 0, 0.2392157, 1, 1,
0.3042615, -1.460791, 5.02463, 0, 0.2313726, 1, 1,
0.3083006, 2.159003, -3.101376, 0, 0.227451, 1, 1,
0.3097756, 0.3706613, 0.2983216, 0, 0.2196078, 1, 1,
0.3142315, -0.06928285, 0.5549582, 0, 0.2156863, 1, 1,
0.3168534, 0.3930216, 0.3085017, 0, 0.2078431, 1, 1,
0.3172055, 0.1886286, 1.081011, 0, 0.2039216, 1, 1,
0.3204829, 0.07029793, 1.307464, 0, 0.1960784, 1, 1,
0.3217211, 1.137596, 0.3655706, 0, 0.1882353, 1, 1,
0.3226973, -0.7824917, 2.226971, 0, 0.1843137, 1, 1,
0.3264985, 0.6276149, 0.9922825, 0, 0.1764706, 1, 1,
0.3273341, -1.268601, 3.476436, 0, 0.172549, 1, 1,
0.3320705, -0.0694703, 0.6133542, 0, 0.1647059, 1, 1,
0.332338, 1.215884, 0.2150142, 0, 0.1607843, 1, 1,
0.3325053, 0.4623615, 0.7272626, 0, 0.1529412, 1, 1,
0.3359941, 1.274132, 0.6738369, 0, 0.1490196, 1, 1,
0.3415149, -1.065335, 4.338899, 0, 0.1411765, 1, 1,
0.3441427, -0.2321519, 0.5473626, 0, 0.1372549, 1, 1,
0.3569149, -1.539971, 4.141453, 0, 0.1294118, 1, 1,
0.3618099, 0.1623088, 0.8224346, 0, 0.1254902, 1, 1,
0.3649108, 1.313111, 1.556503, 0, 0.1176471, 1, 1,
0.3652917, -0.2686489, 0.721055, 0, 0.1137255, 1, 1,
0.3675241, -0.2118526, 3.540221, 0, 0.1058824, 1, 1,
0.3712224, -0.190447, 1.009157, 0, 0.09803922, 1, 1,
0.3722945, -0.3563813, 1.952971, 0, 0.09411765, 1, 1,
0.3728519, -0.04912147, 1.691662, 0, 0.08627451, 1, 1,
0.3731935, 0.02035347, 0.5224282, 0, 0.08235294, 1, 1,
0.3782659, 0.1120972, 2.411029, 0, 0.07450981, 1, 1,
0.3784954, 0.1175861, 0.7258919, 0, 0.07058824, 1, 1,
0.3790638, 0.8158403, 0.2435615, 0, 0.0627451, 1, 1,
0.3799888, 0.08599301, 0.7817523, 0, 0.05882353, 1, 1,
0.3810801, 0.6143584, 0.2878958, 0, 0.05098039, 1, 1,
0.3922881, 0.5325813, 0.5104514, 0, 0.04705882, 1, 1,
0.3923944, 1.691799, 1.263081, 0, 0.03921569, 1, 1,
0.3940874, -1.679245, 2.355473, 0, 0.03529412, 1, 1,
0.3975354, -1.120021, 2.571555, 0, 0.02745098, 1, 1,
0.4015501, 1.390438, 0.5133587, 0, 0.02352941, 1, 1,
0.4075337, -1.358558, 1.630836, 0, 0.01568628, 1, 1,
0.4138887, -1.877026, 4.456207, 0, 0.01176471, 1, 1,
0.4214753, -0.9492979, 2.355705, 0, 0.003921569, 1, 1,
0.4217841, -1.709778, 2.997873, 0.003921569, 0, 1, 1,
0.4260035, 2.056237, -0.5429869, 0.007843138, 0, 1, 1,
0.4294228, 0.09946096, 2.043959, 0.01568628, 0, 1, 1,
0.4335135, 0.1975582, 2.517556, 0.01960784, 0, 1, 1,
0.4340437, 0.5433604, 0.1887441, 0.02745098, 0, 1, 1,
0.4357336, 0.1138694, 0.01298254, 0.03137255, 0, 1, 1,
0.4370861, 1.808488, -0.01712765, 0.03921569, 0, 1, 1,
0.439735, -0.09877802, 3.969521, 0.04313726, 0, 1, 1,
0.4473355, 0.4496929, 0.9922749, 0.05098039, 0, 1, 1,
0.4574131, 0.2159817, 1.400701, 0.05490196, 0, 1, 1,
0.4577294, 0.939203, 0.6469306, 0.0627451, 0, 1, 1,
0.4607967, 1.46251, -0.6692463, 0.06666667, 0, 1, 1,
0.4656142, 0.5566738, -1.574921, 0.07450981, 0, 1, 1,
0.4658367, 0.5940361, -0.5167603, 0.07843138, 0, 1, 1,
0.4663963, 0.7289424, 1.242584, 0.08627451, 0, 1, 1,
0.4691756, 0.6250603, 0.4757793, 0.09019608, 0, 1, 1,
0.4719608, 0.7287406, -0.2603658, 0.09803922, 0, 1, 1,
0.4719819, -1.657541, 2.343823, 0.1058824, 0, 1, 1,
0.47334, 0.6298277, -1.01228, 0.1098039, 0, 1, 1,
0.4774131, -0.3282753, 1.600683, 0.1176471, 0, 1, 1,
0.4846668, -1.522321, 3.756844, 0.1215686, 0, 1, 1,
0.4848819, 0.6316217, 0.2405722, 0.1294118, 0, 1, 1,
0.4875079, -0.3730083, 2.409873, 0.1333333, 0, 1, 1,
0.4941799, 1.039957, -1.046589, 0.1411765, 0, 1, 1,
0.4968052, -1.141909, 2.679846, 0.145098, 0, 1, 1,
0.5049565, -0.05801651, 1.259427, 0.1529412, 0, 1, 1,
0.5063087, 0.6823435, 1.620649, 0.1568628, 0, 1, 1,
0.5066918, 1.629039, 1.200567, 0.1647059, 0, 1, 1,
0.5093725, 1.64118, 0.7121955, 0.1686275, 0, 1, 1,
0.5120949, -1.163954, 2.563806, 0.1764706, 0, 1, 1,
0.5150647, -0.4372324, 2.861661, 0.1803922, 0, 1, 1,
0.5163465, -0.5563073, 3.049228, 0.1882353, 0, 1, 1,
0.5167469, -0.2152179, 3.740688, 0.1921569, 0, 1, 1,
0.5198311, -0.3306673, 2.111036, 0.2, 0, 1, 1,
0.5255135, -0.8464925, 2.512657, 0.2078431, 0, 1, 1,
0.5256845, 0.6280941, 0.9527023, 0.2117647, 0, 1, 1,
0.526365, -1.198515, 1.967558, 0.2196078, 0, 1, 1,
0.5315816, 0.3458316, 1.572569, 0.2235294, 0, 1, 1,
0.5321186, 0.5809521, 0.2717374, 0.2313726, 0, 1, 1,
0.5328885, 1.21219, 1.47766, 0.2352941, 0, 1, 1,
0.5347607, -1.302449, 2.848627, 0.2431373, 0, 1, 1,
0.5361838, 0.4122018, 0.5933609, 0.2470588, 0, 1, 1,
0.5361955, -0.1282893, -0.03326187, 0.254902, 0, 1, 1,
0.5462078, -1.506552, 2.767093, 0.2588235, 0, 1, 1,
0.5475361, -0.4295972, 2.821023, 0.2666667, 0, 1, 1,
0.548768, -1.129156, 1.917971, 0.2705882, 0, 1, 1,
0.5571839, 0.3591606, -0.2920713, 0.2784314, 0, 1, 1,
0.5578312, -1.127364, 3.630095, 0.282353, 0, 1, 1,
0.5585889, 0.3704393, 0.5518154, 0.2901961, 0, 1, 1,
0.5586868, -1.608243, 2.325506, 0.2941177, 0, 1, 1,
0.5652906, -1.959202, 4.406855, 0.3019608, 0, 1, 1,
0.5754787, 0.2170521, 1.527475, 0.3098039, 0, 1, 1,
0.5786754, 2.197867, 3.592043, 0.3137255, 0, 1, 1,
0.5797016, 0.7954892, 1.725479, 0.3215686, 0, 1, 1,
0.581871, -1.486193, 1.360092, 0.3254902, 0, 1, 1,
0.5835012, 2.913505, 0.6771129, 0.3333333, 0, 1, 1,
0.5851319, 0.2299688, 1.22045, 0.3372549, 0, 1, 1,
0.5875437, 1.516295, -0.9633239, 0.345098, 0, 1, 1,
0.5883494, 1.303561, 0.7522646, 0.3490196, 0, 1, 1,
0.5940574, -0.6681659, 1.603493, 0.3568628, 0, 1, 1,
0.5942505, -1.216081, 1.61917, 0.3607843, 0, 1, 1,
0.5973023, -0.6385298, 1.322783, 0.3686275, 0, 1, 1,
0.5974413, -1.615214, 2.309826, 0.372549, 0, 1, 1,
0.5991449, -0.07625154, 1.230285, 0.3803922, 0, 1, 1,
0.6016368, -0.3338585, 2.639371, 0.3843137, 0, 1, 1,
0.6029165, 1.413996, -0.8046982, 0.3921569, 0, 1, 1,
0.6033945, 1.072835, -0.5464928, 0.3960784, 0, 1, 1,
0.6206062, -1.746399, 4.578607, 0.4039216, 0, 1, 1,
0.621142, -0.5015826, 1.920232, 0.4117647, 0, 1, 1,
0.6241673, -0.6953817, 1.083501, 0.4156863, 0, 1, 1,
0.6249594, 0.1009194, 1.884615, 0.4235294, 0, 1, 1,
0.632734, -0.8544804, 1.635832, 0.427451, 0, 1, 1,
0.6385166, -0.4497616, 5.374103, 0.4352941, 0, 1, 1,
0.6427423, -0.003692339, 0.7515396, 0.4392157, 0, 1, 1,
0.6454609, -1.734675, 3.371812, 0.4470588, 0, 1, 1,
0.652447, -0.8106017, 1.713366, 0.4509804, 0, 1, 1,
0.6553456, 0.5005985, -0.3066019, 0.4588235, 0, 1, 1,
0.6558695, -1.129496, 4.474913, 0.4627451, 0, 1, 1,
0.6565475, 0.8041342, 1.206389, 0.4705882, 0, 1, 1,
0.6595091, 0.2386841, -1.374756, 0.4745098, 0, 1, 1,
0.6601817, -0.1793743, 2.780484, 0.4823529, 0, 1, 1,
0.661805, -0.5096086, 2.598955, 0.4862745, 0, 1, 1,
0.6636515, -1.051747, 4.465508, 0.4941176, 0, 1, 1,
0.6655209, 0.196647, 0.9636562, 0.5019608, 0, 1, 1,
0.6675765, 0.9566326, 1.320524, 0.5058824, 0, 1, 1,
0.6703912, -0.4605027, 2.298472, 0.5137255, 0, 1, 1,
0.6705247, -0.7430679, 2.501871, 0.5176471, 0, 1, 1,
0.6711223, -0.06591814, 3.278931, 0.5254902, 0, 1, 1,
0.6742603, -1.169402, 1.775411, 0.5294118, 0, 1, 1,
0.6848433, 1.603861, 0.7850201, 0.5372549, 0, 1, 1,
0.6965541, 0.7310743, 1.929245, 0.5411765, 0, 1, 1,
0.7029102, -1.128777, 3.68162, 0.5490196, 0, 1, 1,
0.7048579, -0.5578036, 1.997417, 0.5529412, 0, 1, 1,
0.7054634, 0.147913, 1.677691, 0.5607843, 0, 1, 1,
0.7125744, 0.8268658, 0.4893158, 0.5647059, 0, 1, 1,
0.7144643, -1.914288, 2.553865, 0.572549, 0, 1, 1,
0.7152877, 0.560821, 1.722979, 0.5764706, 0, 1, 1,
0.715912, -0.3196969, 2.229013, 0.5843138, 0, 1, 1,
0.7229308, 1.049581, 1.724792, 0.5882353, 0, 1, 1,
0.7245917, 0.292904, 2.619444, 0.5960785, 0, 1, 1,
0.7258194, 0.5208564, 0.3257279, 0.6039216, 0, 1, 1,
0.7289746, -0.02244736, 0.5692663, 0.6078432, 0, 1, 1,
0.7302253, -0.3866601, 3.729058, 0.6156863, 0, 1, 1,
0.7308736, 0.4010081, 0.5844377, 0.6196079, 0, 1, 1,
0.7318522, -1.504132, 3.602766, 0.627451, 0, 1, 1,
0.7353138, 0.05389556, 1.572631, 0.6313726, 0, 1, 1,
0.7378701, 0.6368466, 0.05916923, 0.6392157, 0, 1, 1,
0.7421563, 0.8376679, 1.387028, 0.6431373, 0, 1, 1,
0.7482076, -0.611521, 3.425839, 0.6509804, 0, 1, 1,
0.7489883, 0.4380044, -0.3910246, 0.654902, 0, 1, 1,
0.7490599, 1.176846, 1.580584, 0.6627451, 0, 1, 1,
0.7518898, 0.8877065, 3.484968, 0.6666667, 0, 1, 1,
0.7520591, -0.4378539, 1.945303, 0.6745098, 0, 1, 1,
0.7593315, 1.405446, -0.7762846, 0.6784314, 0, 1, 1,
0.7639665, -0.74143, 1.146091, 0.6862745, 0, 1, 1,
0.765423, -0.664341, 1.625975, 0.6901961, 0, 1, 1,
0.7659304, -1.861804, 4.346412, 0.6980392, 0, 1, 1,
0.7705117, 2.080542, 1.329151, 0.7058824, 0, 1, 1,
0.7794176, -0.2892093, 1.999267, 0.7098039, 0, 1, 1,
0.7824489, -0.128575, 2.293489, 0.7176471, 0, 1, 1,
0.7834989, -0.09765227, 1.726923, 0.7215686, 0, 1, 1,
0.7840009, 0.1316052, 2.057386, 0.7294118, 0, 1, 1,
0.7955576, -1.656456, 1.288212, 0.7333333, 0, 1, 1,
0.7993192, -0.3421446, 0.3418127, 0.7411765, 0, 1, 1,
0.8071528, -0.2985745, 0.01052109, 0.7450981, 0, 1, 1,
0.8092614, 0.3013319, 1.418899, 0.7529412, 0, 1, 1,
0.809532, -1.478781, 2.352478, 0.7568628, 0, 1, 1,
0.8132759, 2.068497, 0.3055335, 0.7647059, 0, 1, 1,
0.8186898, 0.2697419, 0.6591617, 0.7686275, 0, 1, 1,
0.8216517, -0.7421051, 2.494581, 0.7764706, 0, 1, 1,
0.82721, -1.621152, 3.756481, 0.7803922, 0, 1, 1,
0.8293509, 0.3936948, 1.851233, 0.7882353, 0, 1, 1,
0.8296632, 0.2757375, 1.615936, 0.7921569, 0, 1, 1,
0.8304703, -0.333089, 4.553708, 0.8, 0, 1, 1,
0.8366195, 1.158542, -0.3737934, 0.8078431, 0, 1, 1,
0.8391113, 1.401395, -1.312413, 0.8117647, 0, 1, 1,
0.8408099, 0.3269266, 0.5408471, 0.8196079, 0, 1, 1,
0.8494711, 1.871398, -0.04750894, 0.8235294, 0, 1, 1,
0.8536556, 0.2729627, 1.198697, 0.8313726, 0, 1, 1,
0.8593546, -1.577375, 3.698631, 0.8352941, 0, 1, 1,
0.8679379, -0.17558, 0.09788505, 0.8431373, 0, 1, 1,
0.868861, 0.551998, 0.06330012, 0.8470588, 0, 1, 1,
0.8740959, -1.193609, 2.217137, 0.854902, 0, 1, 1,
0.8752136, 0.194866, 2.296982, 0.8588235, 0, 1, 1,
0.8900918, 0.6799981, 1.007378, 0.8666667, 0, 1, 1,
0.8916686, 2.138091, 0.3359642, 0.8705882, 0, 1, 1,
0.8943226, 0.2440812, -0.6558612, 0.8784314, 0, 1, 1,
0.9073904, -2.190652, 3.320426, 0.8823529, 0, 1, 1,
0.9083102, 0.1427133, -0.684719, 0.8901961, 0, 1, 1,
0.9087718, 0.3193455, 2.279672, 0.8941177, 0, 1, 1,
0.9206325, -0.9260225, 2.045428, 0.9019608, 0, 1, 1,
0.9214557, 1.317357, -1.462603, 0.9098039, 0, 1, 1,
0.9246256, -0.3494092, 1.923624, 0.9137255, 0, 1, 1,
0.9260734, 1.097339, -0.3349902, 0.9215686, 0, 1, 1,
0.9309485, 0.1047667, 2.228018, 0.9254902, 0, 1, 1,
0.9346328, 1.642554, -0.05519716, 0.9333333, 0, 1, 1,
0.9394797, -0.3491564, 1.298368, 0.9372549, 0, 1, 1,
0.940922, 0.648029, -1.269549, 0.945098, 0, 1, 1,
0.9414201, -2.034948, 2.505493, 0.9490196, 0, 1, 1,
0.943249, 1.477921, -1.112059, 0.9568627, 0, 1, 1,
0.946808, 0.3083526, 0.563203, 0.9607843, 0, 1, 1,
0.9560542, -0.1444764, 2.512608, 0.9686275, 0, 1, 1,
0.957137, 0.9644561, 1.522833, 0.972549, 0, 1, 1,
0.9575614, -0.3603492, 1.648444, 0.9803922, 0, 1, 1,
0.9591951, 0.9854687, 1.944472, 0.9843137, 0, 1, 1,
0.9626964, 0.584112, 1.623236, 0.9921569, 0, 1, 1,
0.964731, 1.810762, 0.07423422, 0.9960784, 0, 1, 1,
0.9752994, 0.2510323, 2.180467, 1, 0, 0.9960784, 1,
0.9758449, -0.9006973, 2.11825, 1, 0, 0.9882353, 1,
0.9800157, -1.484868, 2.750924, 1, 0, 0.9843137, 1,
0.9874425, 1.453167, -1.083071, 1, 0, 0.9764706, 1,
0.9960877, 0.1807104, 1.611175, 1, 0, 0.972549, 1,
0.9980609, -0.576883, 3.603763, 1, 0, 0.9647059, 1,
1.000413, -0.4069695, 0.006450306, 1, 0, 0.9607843, 1,
1.001701, -0.5129699, 1.409454, 1, 0, 0.9529412, 1,
1.002547, 0.8136409, 0.2439243, 1, 0, 0.9490196, 1,
1.003922, -0.5692736, 2.713732, 1, 0, 0.9411765, 1,
1.009453, -0.5462486, 3.261457, 1, 0, 0.9372549, 1,
1.01596, 0.4985061, 1.609943, 1, 0, 0.9294118, 1,
1.016545, -0.02591671, 1.220564, 1, 0, 0.9254902, 1,
1.020222, -1.435793, 4.118243, 1, 0, 0.9176471, 1,
1.021221, 1.473438, -0.2412538, 1, 0, 0.9137255, 1,
1.02598, -0.4960852, 1.869918, 1, 0, 0.9058824, 1,
1.030646, 0.3830676, 2.110584, 1, 0, 0.9019608, 1,
1.035613, 0.4879708, 0.217982, 1, 0, 0.8941177, 1,
1.037274, -0.9211464, 3.507239, 1, 0, 0.8862745, 1,
1.051954, -1.0295, 2.041857, 1, 0, 0.8823529, 1,
1.057453, -0.1049593, 2.021246, 1, 0, 0.8745098, 1,
1.057849, -1.956237, 0.8325261, 1, 0, 0.8705882, 1,
1.059838, 0.9449579, 3.385916, 1, 0, 0.8627451, 1,
1.065932, 0.09220897, 1.321357, 1, 0, 0.8588235, 1,
1.068549, 2.147953, -0.6071616, 1, 0, 0.8509804, 1,
1.07164, -0.5420281, 1.458055, 1, 0, 0.8470588, 1,
1.076574, -0.05139447, 2.477176, 1, 0, 0.8392157, 1,
1.079281, -0.2112209, 1.765891, 1, 0, 0.8352941, 1,
1.079598, 0.5342264, 0.8078766, 1, 0, 0.827451, 1,
1.083739, -0.9474477, 1.393863, 1, 0, 0.8235294, 1,
1.085709, 1.112932, -0.7320261, 1, 0, 0.8156863, 1,
1.087616, 0.8266748, 0.2904598, 1, 0, 0.8117647, 1,
1.090144, -1.33198, 3.795915, 1, 0, 0.8039216, 1,
1.09211, -0.1455181, 2.398306, 1, 0, 0.7960784, 1,
1.098303, 1.284568, -1.042394, 1, 0, 0.7921569, 1,
1.100624, -1.518259, 3.184339, 1, 0, 0.7843137, 1,
1.105072, -0.6591419, 2.249882, 1, 0, 0.7803922, 1,
1.121205, 0.2327949, 0.07230577, 1, 0, 0.772549, 1,
1.122834, 0.9629688, 1.717381, 1, 0, 0.7686275, 1,
1.127023, -0.1913533, 2.795034, 1, 0, 0.7607843, 1,
1.134187, 2.429211, -0.8134956, 1, 0, 0.7568628, 1,
1.135084, -0.5758254, 1.277154, 1, 0, 0.7490196, 1,
1.141039, -1.241743, 1.36841, 1, 0, 0.7450981, 1,
1.144143, -1.659073, 0.9800804, 1, 0, 0.7372549, 1,
1.168255, 1.129053, 2.025777, 1, 0, 0.7333333, 1,
1.170065, 0.4641205, 0.2681231, 1, 0, 0.7254902, 1,
1.174587, -0.08688524, 1.261192, 1, 0, 0.7215686, 1,
1.176605, -1.265652, 1.497564, 1, 0, 0.7137255, 1,
1.181022, -0.2362135, 1.985572, 1, 0, 0.7098039, 1,
1.199776, -1.525248, 0.4262381, 1, 0, 0.7019608, 1,
1.200504, 0.1764644, -1.304106, 1, 0, 0.6941177, 1,
1.209213, 2.408548, 0.7492472, 1, 0, 0.6901961, 1,
1.225482, 0.8908957, -0.4310009, 1, 0, 0.682353, 1,
1.235247, -1.007531, 2.061212, 1, 0, 0.6784314, 1,
1.235409, -0.2336908, 0.09299198, 1, 0, 0.6705883, 1,
1.238242, 0.5603843, 2.775794, 1, 0, 0.6666667, 1,
1.247483, -1.107711, 2.41172, 1, 0, 0.6588235, 1,
1.257091, -1.667844, 2.49414, 1, 0, 0.654902, 1,
1.258478, -0.1424593, 3.114051, 1, 0, 0.6470588, 1,
1.262073, 0.397666, 3.107641, 1, 0, 0.6431373, 1,
1.262773, -1.030629, 2.267775, 1, 0, 0.6352941, 1,
1.264826, -0.7492583, 1.825703, 1, 0, 0.6313726, 1,
1.268566, 1.089363, 0.2000644, 1, 0, 0.6235294, 1,
1.269411, 1.291008, 0.3390322, 1, 0, 0.6196079, 1,
1.273535, -0.00518804, 1.611707, 1, 0, 0.6117647, 1,
1.280465, 0.8300786, 1.002012, 1, 0, 0.6078432, 1,
1.28754, 0.9293712, 2.11654, 1, 0, 0.6, 1,
1.300372, 2.223397, -0.7968132, 1, 0, 0.5921569, 1,
1.303236, 0.3137441, 2.525228, 1, 0, 0.5882353, 1,
1.320865, 0.7389474, 1.846348, 1, 0, 0.5803922, 1,
1.323978, 0.6686786, 0.7591604, 1, 0, 0.5764706, 1,
1.324457, 0.03860432, 1.418345, 1, 0, 0.5686275, 1,
1.329227, 0.893998, 0.6714022, 1, 0, 0.5647059, 1,
1.333602, 0.3163382, 1.021949, 1, 0, 0.5568628, 1,
1.334786, -0.3059975, 1.523204, 1, 0, 0.5529412, 1,
1.341252, 0.5999917, -0.3507557, 1, 0, 0.5450981, 1,
1.347335, 1.013469, 0.4962593, 1, 0, 0.5411765, 1,
1.366325, 0.7371958, 0.04533427, 1, 0, 0.5333334, 1,
1.366952, -0.8198165, 3.162612, 1, 0, 0.5294118, 1,
1.367468, -1.571984, 1.464604, 1, 0, 0.5215687, 1,
1.371795, 0.4456932, 2.496082, 1, 0, 0.5176471, 1,
1.374309, 0.3653712, 1.315596, 1, 0, 0.509804, 1,
1.376087, 2.327629, -0.3137929, 1, 0, 0.5058824, 1,
1.377686, -1.096612, 4.178524, 1, 0, 0.4980392, 1,
1.386601, 0.6000206, 1.327379, 1, 0, 0.4901961, 1,
1.410595, 0.6535106, 1.234541, 1, 0, 0.4862745, 1,
1.416217, -0.8843564, 3.385701, 1, 0, 0.4784314, 1,
1.422943, -0.73925, 1.578032, 1, 0, 0.4745098, 1,
1.428346, 0.37975, 2.577619, 1, 0, 0.4666667, 1,
1.431643, 1.760692, 1.4839, 1, 0, 0.4627451, 1,
1.432059, -0.3467155, 4.083745, 1, 0, 0.454902, 1,
1.438667, -0.6423674, 1.006613, 1, 0, 0.4509804, 1,
1.442906, -0.107327, -0.8212855, 1, 0, 0.4431373, 1,
1.447984, 2.514, 1.333914, 1, 0, 0.4392157, 1,
1.45884, 1.242976, 1.158358, 1, 0, 0.4313726, 1,
1.4602, 0.6575468, 1.050475, 1, 0, 0.427451, 1,
1.470672, 1.110634, 0.7470722, 1, 0, 0.4196078, 1,
1.471003, 0.8458745, 0.1479831, 1, 0, 0.4156863, 1,
1.474355, 0.4343038, 2.184911, 1, 0, 0.4078431, 1,
1.48536, -0.06670752, 0.6294333, 1, 0, 0.4039216, 1,
1.488123, -0.01819548, 1.352393, 1, 0, 0.3960784, 1,
1.488165, 0.1182133, 1.465724, 1, 0, 0.3882353, 1,
1.490251, -0.2234549, 3.430449, 1, 0, 0.3843137, 1,
1.511596, 0.4886304, -0.6100503, 1, 0, 0.3764706, 1,
1.516019, 0.4362764, 3.951228, 1, 0, 0.372549, 1,
1.523508, -0.6043407, -0.4697881, 1, 0, 0.3647059, 1,
1.530883, -1.065805, 1.498554, 1, 0, 0.3607843, 1,
1.531824, -1.546584, 2.415392, 1, 0, 0.3529412, 1,
1.539886, 0.6198886, -0.3607077, 1, 0, 0.3490196, 1,
1.554633, -0.5431736, 0.8199369, 1, 0, 0.3411765, 1,
1.562267, 0.1919967, 0.3998185, 1, 0, 0.3372549, 1,
1.566531, 1.299313, 1.322971, 1, 0, 0.3294118, 1,
1.569272, -1.241649, 3.042612, 1, 0, 0.3254902, 1,
1.570264, -0.7932395, 1.418145, 1, 0, 0.3176471, 1,
1.576153, -0.3881478, 2.99975, 1, 0, 0.3137255, 1,
1.576667, -0.2759771, 2.235692, 1, 0, 0.3058824, 1,
1.610111, 1.090767, 1.491984, 1, 0, 0.2980392, 1,
1.610862, 0.2989556, 2.991779, 1, 0, 0.2941177, 1,
1.621081, -0.2172975, 0.7802314, 1, 0, 0.2862745, 1,
1.621483, 0.04334442, 0.9561374, 1, 0, 0.282353, 1,
1.624001, -0.1554713, 1.149265, 1, 0, 0.2745098, 1,
1.637402, 0.62889, 1.657243, 1, 0, 0.2705882, 1,
1.649913, -0.3774209, 0.9805958, 1, 0, 0.2627451, 1,
1.64997, 0.02170851, 1.133259, 1, 0, 0.2588235, 1,
1.66231, -1.244614, 3.659967, 1, 0, 0.2509804, 1,
1.6661, 0.08375455, 1.114094, 1, 0, 0.2470588, 1,
1.666529, -0.008781327, 2.119658, 1, 0, 0.2392157, 1,
1.67488, -2.005716, 2.060508, 1, 0, 0.2352941, 1,
1.679847, -1.55133, 2.886449, 1, 0, 0.227451, 1,
1.686234, -0.8791911, 2.771234, 1, 0, 0.2235294, 1,
1.718245, 0.7222139, 1.167599, 1, 0, 0.2156863, 1,
1.728483, -0.4995821, 3.380326, 1, 0, 0.2117647, 1,
1.747552, 0.3641643, 1.472974, 1, 0, 0.2039216, 1,
1.748358, 0.6801518, 2.714202, 1, 0, 0.1960784, 1,
1.753815, -1.177482, 2.307221, 1, 0, 0.1921569, 1,
1.754755, -0.1869584, 5.21557, 1, 0, 0.1843137, 1,
1.771548, 0.7378309, 1.269556, 1, 0, 0.1803922, 1,
1.777798, -0.918721, 2.39793, 1, 0, 0.172549, 1,
1.78815, 0.6417594, 1.774845, 1, 0, 0.1686275, 1,
1.788363, 0.3623157, 0.3334794, 1, 0, 0.1607843, 1,
1.789631, -0.02748475, 2.766956, 1, 0, 0.1568628, 1,
1.798691, -1.136401, 2.974691, 1, 0, 0.1490196, 1,
1.830263, 1.403054, 1.514594, 1, 0, 0.145098, 1,
1.835438, -0.6375906, 0.9214508, 1, 0, 0.1372549, 1,
1.872819, 0.4573988, -0.6176246, 1, 0, 0.1333333, 1,
1.946707, -0.2003436, 2.791863, 1, 0, 0.1254902, 1,
1.967788, -0.09746384, -0.03006138, 1, 0, 0.1215686, 1,
1.979465, 0.6685668, 3.230616, 1, 0, 0.1137255, 1,
1.980077, -0.8566958, 0.2167778, 1, 0, 0.1098039, 1,
1.996385, 0.7613459, 0.05813079, 1, 0, 0.1019608, 1,
2.008713, -1.135631, 1.132881, 1, 0, 0.09411765, 1,
2.041142, -0.9883052, 3.3535, 1, 0, 0.09019608, 1,
2.047506, -0.6726442, 1.931792, 1, 0, 0.08235294, 1,
2.058331, 0.06003891, 1.875539, 1, 0, 0.07843138, 1,
2.169849, 0.7329577, 1.84598, 1, 0, 0.07058824, 1,
2.196912, -0.1070418, 1.996237, 1, 0, 0.06666667, 1,
2.212883, 0.5246996, 0.4655343, 1, 0, 0.05882353, 1,
2.234548, 0.1206074, 1.401977, 1, 0, 0.05490196, 1,
2.316221, -0.3810064, 1.054281, 1, 0, 0.04705882, 1,
2.364026, 0.08417313, 3.757763, 1, 0, 0.04313726, 1,
2.367167, 0.8447348, 0.5029877, 1, 0, 0.03529412, 1,
2.385224, -0.1401085, 1.035479, 1, 0, 0.03137255, 1,
2.415959, 1.238942, 0.2261313, 1, 0, 0.02352941, 1,
2.490884, 0.221768, 1.402915, 1, 0, 0.01960784, 1,
2.573328, -1.919118, 2.877452, 1, 0, 0.01176471, 1,
3.000875, 0.04938172, 1.538045, 1, 0, 0.007843138, 1
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
-0.01828873, -3.946179, -7.349795, 0, -0.5, 0.5, 0.5,
-0.01828873, -3.946179, -7.349795, 1, -0.5, 0.5, 0.5,
-0.01828873, -3.946179, -7.349795, 1, 1.5, 0.5, 0.5,
-0.01828873, -3.946179, -7.349795, 0, 1.5, 0.5, 0.5
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
-4.060949, 0.01874197, -7.349795, 0, -0.5, 0.5, 0.5,
-4.060949, 0.01874197, -7.349795, 1, -0.5, 0.5, 0.5,
-4.060949, 0.01874197, -7.349795, 1, 1.5, 0.5, 0.5,
-4.060949, 0.01874197, -7.349795, 0, 1.5, 0.5, 0.5
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
-4.060949, -3.946179, 0.04314685, 0, -0.5, 0.5, 0.5,
-4.060949, -3.946179, 0.04314685, 1, -0.5, 0.5, 0.5,
-4.060949, -3.946179, 0.04314685, 1, 1.5, 0.5, 0.5,
-4.060949, -3.946179, 0.04314685, 0, 1.5, 0.5, 0.5
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
-3, -3.031197, -5.643731,
3, -3.031197, -5.643731,
-3, -3.031197, -5.643731,
-3, -3.183694, -5.928075,
-2, -3.031197, -5.643731,
-2, -3.183694, -5.928075,
-1, -3.031197, -5.643731,
-1, -3.183694, -5.928075,
0, -3.031197, -5.643731,
0, -3.183694, -5.928075,
1, -3.031197, -5.643731,
1, -3.183694, -5.928075,
2, -3.031197, -5.643731,
2, -3.183694, -5.928075,
3, -3.031197, -5.643731,
3, -3.183694, -5.928075
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
-3, -3.488688, -6.496763, 0, -0.5, 0.5, 0.5,
-3, -3.488688, -6.496763, 1, -0.5, 0.5, 0.5,
-3, -3.488688, -6.496763, 1, 1.5, 0.5, 0.5,
-3, -3.488688, -6.496763, 0, 1.5, 0.5, 0.5,
-2, -3.488688, -6.496763, 0, -0.5, 0.5, 0.5,
-2, -3.488688, -6.496763, 1, -0.5, 0.5, 0.5,
-2, -3.488688, -6.496763, 1, 1.5, 0.5, 0.5,
-2, -3.488688, -6.496763, 0, 1.5, 0.5, 0.5,
-1, -3.488688, -6.496763, 0, -0.5, 0.5, 0.5,
-1, -3.488688, -6.496763, 1, -0.5, 0.5, 0.5,
-1, -3.488688, -6.496763, 1, 1.5, 0.5, 0.5,
-1, -3.488688, -6.496763, 0, 1.5, 0.5, 0.5,
0, -3.488688, -6.496763, 0, -0.5, 0.5, 0.5,
0, -3.488688, -6.496763, 1, -0.5, 0.5, 0.5,
0, -3.488688, -6.496763, 1, 1.5, 0.5, 0.5,
0, -3.488688, -6.496763, 0, 1.5, 0.5, 0.5,
1, -3.488688, -6.496763, 0, -0.5, 0.5, 0.5,
1, -3.488688, -6.496763, 1, -0.5, 0.5, 0.5,
1, -3.488688, -6.496763, 1, 1.5, 0.5, 0.5,
1, -3.488688, -6.496763, 0, 1.5, 0.5, 0.5,
2, -3.488688, -6.496763, 0, -0.5, 0.5, 0.5,
2, -3.488688, -6.496763, 1, -0.5, 0.5, 0.5,
2, -3.488688, -6.496763, 1, 1.5, 0.5, 0.5,
2, -3.488688, -6.496763, 0, 1.5, 0.5, 0.5,
3, -3.488688, -6.496763, 0, -0.5, 0.5, 0.5,
3, -3.488688, -6.496763, 1, -0.5, 0.5, 0.5,
3, -3.488688, -6.496763, 1, 1.5, 0.5, 0.5,
3, -3.488688, -6.496763, 0, 1.5, 0.5, 0.5
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
-3.128028, -2, -5.643731,
-3.128028, 2, -5.643731,
-3.128028, -2, -5.643731,
-3.283514, -2, -5.928075,
-3.128028, -1, -5.643731,
-3.283514, -1, -5.928075,
-3.128028, 0, -5.643731,
-3.283514, 0, -5.928075,
-3.128028, 1, -5.643731,
-3.283514, 1, -5.928075,
-3.128028, 2, -5.643731,
-3.283514, 2, -5.928075
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
-3.594488, -2, -6.496763, 0, -0.5, 0.5, 0.5,
-3.594488, -2, -6.496763, 1, -0.5, 0.5, 0.5,
-3.594488, -2, -6.496763, 1, 1.5, 0.5, 0.5,
-3.594488, -2, -6.496763, 0, 1.5, 0.5, 0.5,
-3.594488, -1, -6.496763, 0, -0.5, 0.5, 0.5,
-3.594488, -1, -6.496763, 1, -0.5, 0.5, 0.5,
-3.594488, -1, -6.496763, 1, 1.5, 0.5, 0.5,
-3.594488, -1, -6.496763, 0, 1.5, 0.5, 0.5,
-3.594488, 0, -6.496763, 0, -0.5, 0.5, 0.5,
-3.594488, 0, -6.496763, 1, -0.5, 0.5, 0.5,
-3.594488, 0, -6.496763, 1, 1.5, 0.5, 0.5,
-3.594488, 0, -6.496763, 0, 1.5, 0.5, 0.5,
-3.594488, 1, -6.496763, 0, -0.5, 0.5, 0.5,
-3.594488, 1, -6.496763, 1, -0.5, 0.5, 0.5,
-3.594488, 1, -6.496763, 1, 1.5, 0.5, 0.5,
-3.594488, 1, -6.496763, 0, 1.5, 0.5, 0.5,
-3.594488, 2, -6.496763, 0, -0.5, 0.5, 0.5,
-3.594488, 2, -6.496763, 1, -0.5, 0.5, 0.5,
-3.594488, 2, -6.496763, 1, 1.5, 0.5, 0.5,
-3.594488, 2, -6.496763, 0, 1.5, 0.5, 0.5
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
-3.128028, -3.031197, -4,
-3.128028, -3.031197, 4,
-3.128028, -3.031197, -4,
-3.283514, -3.183694, -4,
-3.128028, -3.031197, -2,
-3.283514, -3.183694, -2,
-3.128028, -3.031197, 0,
-3.283514, -3.183694, 0,
-3.128028, -3.031197, 2,
-3.283514, -3.183694, 2,
-3.128028, -3.031197, 4,
-3.283514, -3.183694, 4
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
-3.594488, -3.488688, -4, 0, -0.5, 0.5, 0.5,
-3.594488, -3.488688, -4, 1, -0.5, 0.5, 0.5,
-3.594488, -3.488688, -4, 1, 1.5, 0.5, 0.5,
-3.594488, -3.488688, -4, 0, 1.5, 0.5, 0.5,
-3.594488, -3.488688, -2, 0, -0.5, 0.5, 0.5,
-3.594488, -3.488688, -2, 1, -0.5, 0.5, 0.5,
-3.594488, -3.488688, -2, 1, 1.5, 0.5, 0.5,
-3.594488, -3.488688, -2, 0, 1.5, 0.5, 0.5,
-3.594488, -3.488688, 0, 0, -0.5, 0.5, 0.5,
-3.594488, -3.488688, 0, 1, -0.5, 0.5, 0.5,
-3.594488, -3.488688, 0, 1, 1.5, 0.5, 0.5,
-3.594488, -3.488688, 0, 0, 1.5, 0.5, 0.5,
-3.594488, -3.488688, 2, 0, -0.5, 0.5, 0.5,
-3.594488, -3.488688, 2, 1, -0.5, 0.5, 0.5,
-3.594488, -3.488688, 2, 1, 1.5, 0.5, 0.5,
-3.594488, -3.488688, 2, 0, 1.5, 0.5, 0.5,
-3.594488, -3.488688, 4, 0, -0.5, 0.5, 0.5,
-3.594488, -3.488688, 4, 1, -0.5, 0.5, 0.5,
-3.594488, -3.488688, 4, 1, 1.5, 0.5, 0.5,
-3.594488, -3.488688, 4, 0, 1.5, 0.5, 0.5
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
-3.128028, -3.031197, -5.643731,
-3.128028, 3.068681, -5.643731,
-3.128028, -3.031197, 5.730025,
-3.128028, 3.068681, 5.730025,
-3.128028, -3.031197, -5.643731,
-3.128028, -3.031197, 5.730025,
-3.128028, 3.068681, -5.643731,
-3.128028, 3.068681, 5.730025,
-3.128028, -3.031197, -5.643731,
3.09145, -3.031197, -5.643731,
-3.128028, -3.031197, 5.730025,
3.09145, -3.031197, 5.730025,
-3.128028, 3.068681, -5.643731,
3.09145, 3.068681, -5.643731,
-3.128028, 3.068681, 5.730025,
3.09145, 3.068681, 5.730025,
3.09145, -3.031197, -5.643731,
3.09145, 3.068681, -5.643731,
3.09145, -3.031197, 5.730025,
3.09145, 3.068681, 5.730025,
3.09145, -3.031197, -5.643731,
3.09145, -3.031197, 5.730025,
3.09145, 3.068681, -5.643731,
3.09145, 3.068681, 5.730025
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
var radius = 7.65015;
var distance = 34.03638;
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
mvMatrix.translate( 0.01828873, -0.01874197, -0.04314685 );
mvMatrix.scale( 1.329934, 1.356009, 0.7272437 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.03638);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
benzthiazuron<-read.table("benzthiazuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benzthiazuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzthiazuron' not found
```

```r
y<-benzthiazuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzthiazuron' not found
```

```r
z<-benzthiazuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzthiazuron' not found
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
-3.037453, -0.03531221, -1.095556, 0, 0, 1, 1, 1,
-2.893053, 1.151114, -1.939899, 1, 0, 0, 1, 1,
-2.772189, -1.045593, -1.627989, 1, 0, 0, 1, 1,
-2.64182, -0.4372042, -1.538011, 1, 0, 0, 1, 1,
-2.617831, -0.5820452, -2.30594, 1, 0, 0, 1, 1,
-2.529248, 1.568917, -0.5989003, 1, 0, 0, 1, 1,
-2.495464, -0.1905141, 0.2301543, 0, 0, 0, 1, 1,
-2.475987, 0.07918198, -1.420117, 0, 0, 0, 1, 1,
-2.471519, 0.9664986, 0.6018821, 0, 0, 0, 1, 1,
-2.378465, -1.213672, -1.917282, 0, 0, 0, 1, 1,
-2.33159, -0.7263878, -1.664138, 0, 0, 0, 1, 1,
-2.327746, 1.21105, -1.483373, 0, 0, 0, 1, 1,
-2.226632, 0.2493203, -0.8988259, 0, 0, 0, 1, 1,
-2.221686, 2.218359, 0.2205219, 1, 1, 1, 1, 1,
-2.190814, -1.489405, -2.51524, 1, 1, 1, 1, 1,
-2.174934, -0.7894634, -2.889509, 1, 1, 1, 1, 1,
-2.171655, -2.143193, -3.687128, 1, 1, 1, 1, 1,
-2.141464, -2.134044, -1.404141, 1, 1, 1, 1, 1,
-2.138459, 0.6221243, 0.03488855, 1, 1, 1, 1, 1,
-2.128019, 0.8686454, -0.8651132, 1, 1, 1, 1, 1,
-2.104844, -1.690596, -3.231883, 1, 1, 1, 1, 1,
-2.089234, 1.033829, -1.267255, 1, 1, 1, 1, 1,
-2.066252, -2.088801, -1.508461, 1, 1, 1, 1, 1,
-2.055822, 0.8622423, -0.2667192, 1, 1, 1, 1, 1,
-2.054804, 1.299913, -1.450508, 1, 1, 1, 1, 1,
-2.020518, -0.02308159, -1.00282, 1, 1, 1, 1, 1,
-2.01876, 0.0417803, -1.232424, 1, 1, 1, 1, 1,
-2.011029, 1.208813, -2.471954, 1, 1, 1, 1, 1,
-1.971066, 1.254727, -1.463244, 0, 0, 1, 1, 1,
-1.966141, 0.9977555, -1.562301, 1, 0, 0, 1, 1,
-1.963753, -0.3963573, -3.291623, 1, 0, 0, 1, 1,
-1.958108, -1.92732, -1.311537, 1, 0, 0, 1, 1,
-1.897728, -0.04137412, -1.590625, 1, 0, 0, 1, 1,
-1.896535, 0.3616261, -1.583799, 1, 0, 0, 1, 1,
-1.878255, -0.5904331, -2.110905, 0, 0, 0, 1, 1,
-1.876972, -0.823854, -1.373314, 0, 0, 0, 1, 1,
-1.874566, -0.1453758, -2.619641, 0, 0, 0, 1, 1,
-1.839161, 0.141131, -2.584108, 0, 0, 0, 1, 1,
-1.817029, -1.40389, -3.610433, 0, 0, 0, 1, 1,
-1.80848, 0.7703089, -1.12333, 0, 0, 0, 1, 1,
-1.803275, 1.339106, -0.1902926, 0, 0, 0, 1, 1,
-1.770704, -0.4840172, -2.301131, 1, 1, 1, 1, 1,
-1.749612, -0.07289343, -3.17309, 1, 1, 1, 1, 1,
-1.727839, 0.4490906, -1.288245, 1, 1, 1, 1, 1,
-1.726662, -1.014216, -2.376097, 1, 1, 1, 1, 1,
-1.725839, -0.4464475, -2.626323, 1, 1, 1, 1, 1,
-1.714702, -0.486237, -0.9038358, 1, 1, 1, 1, 1,
-1.710359, 0.3654088, -2.379414, 1, 1, 1, 1, 1,
-1.688047, 1.620839, -0.6330012, 1, 1, 1, 1, 1,
-1.684469, -0.2063035, -1.095183, 1, 1, 1, 1, 1,
-1.65741, 1.341933, 0.6498512, 1, 1, 1, 1, 1,
-1.65238, 1.789244, -1.150962, 1, 1, 1, 1, 1,
-1.637175, 0.729475, 0.03373402, 1, 1, 1, 1, 1,
-1.61765, 1.515594, -1.795035, 1, 1, 1, 1, 1,
-1.592617, -0.2588966, -1.001887, 1, 1, 1, 1, 1,
-1.580805, -0.6946362, -0.3559606, 1, 1, 1, 1, 1,
-1.580555, 1.173554, -1.0442, 0, 0, 1, 1, 1,
-1.557703, 0.6328072, -2.031144, 1, 0, 0, 1, 1,
-1.555407, -0.3396768, -2.301103, 1, 0, 0, 1, 1,
-1.554337, -2.313967, -2.767996, 1, 0, 0, 1, 1,
-1.54956, 0.3236444, -2.214596, 1, 0, 0, 1, 1,
-1.54811, 1.373477, -2.194957, 1, 0, 0, 1, 1,
-1.543954, 1.406481, 0.2545462, 0, 0, 0, 1, 1,
-1.539372, 0.3134337, -0.8860875, 0, 0, 0, 1, 1,
-1.520463, -1.688667, -3.374573, 0, 0, 0, 1, 1,
-1.520362, -0.5633993, -0.9651469, 0, 0, 0, 1, 1,
-1.514474, 0.04874058, -2.88169, 0, 0, 0, 1, 1,
-1.513728, 0.7822763, -0.4828608, 0, 0, 0, 1, 1,
-1.510633, 1.496715, -0.563193, 0, 0, 0, 1, 1,
-1.503245, -0.6319174, -0.8941444, 1, 1, 1, 1, 1,
-1.486768, 0.997135, -3.244208, 1, 1, 1, 1, 1,
-1.485261, -0.9587663, -3.528693, 1, 1, 1, 1, 1,
-1.47305, -0.5588822, -1.097085, 1, 1, 1, 1, 1,
-1.465821, -0.01029435, -2.064207, 1, 1, 1, 1, 1,
-1.460142, 0.6279182, -1.341523, 1, 1, 1, 1, 1,
-1.450537, -0.9269477, -0.97803, 1, 1, 1, 1, 1,
-1.448529, 1.671315, 0.1923622, 1, 1, 1, 1, 1,
-1.447362, 0.9323598, -0.3125919, 1, 1, 1, 1, 1,
-1.432649, -1.638059, -3.740531, 1, 1, 1, 1, 1,
-1.417445, -0.8572335, -2.913683, 1, 1, 1, 1, 1,
-1.414874, 1.16682, -0.6166216, 1, 1, 1, 1, 1,
-1.413193, -1.377994, -3.002027, 1, 1, 1, 1, 1,
-1.405142, 1.734887, -1.222798, 1, 1, 1, 1, 1,
-1.396963, -0.9853242, -1.393157, 1, 1, 1, 1, 1,
-1.393618, -0.9401719, -2.709166, 0, 0, 1, 1, 1,
-1.386197, 0.155605, -1.184913, 1, 0, 0, 1, 1,
-1.385231, -1.606907, -1.511526, 1, 0, 0, 1, 1,
-1.364672, -1.307859, -2.833206, 1, 0, 0, 1, 1,
-1.360355, -0.9142209, -2.499567, 1, 0, 0, 1, 1,
-1.357289, 0.7604731, -1.57312, 1, 0, 0, 1, 1,
-1.354247, -1.911558, -3.282804, 0, 0, 0, 1, 1,
-1.336782, 0.6718484, -3.247609, 0, 0, 0, 1, 1,
-1.326666, -1.212722, -4.093527, 0, 0, 0, 1, 1,
-1.323522, -1.777566, -1.993347, 0, 0, 0, 1, 1,
-1.320696, 1.538044, -1.786644, 0, 0, 0, 1, 1,
-1.315886, -0.6381311, -1.828189, 0, 0, 0, 1, 1,
-1.315331, 1.624256, -0.5928836, 0, 0, 0, 1, 1,
-1.312812, 0.01529211, -1.237324, 1, 1, 1, 1, 1,
-1.309707, -0.5854692, -2.212319, 1, 1, 1, 1, 1,
-1.299924, -1.118838, -0.7424935, 1, 1, 1, 1, 1,
-1.299892, -1.373932, -3.429736, 1, 1, 1, 1, 1,
-1.289279, 0.03890904, 0.5667843, 1, 1, 1, 1, 1,
-1.277611, 0.8798578, -2.689507, 1, 1, 1, 1, 1,
-1.272482, 0.1150248, -1.51968, 1, 1, 1, 1, 1,
-1.268552, -0.2643787, -0.08012276, 1, 1, 1, 1, 1,
-1.26532, 0.7595689, -2.537478, 1, 1, 1, 1, 1,
-1.264279, 1.036486, -1.264817, 1, 1, 1, 1, 1,
-1.261259, -0.2933079, -1.724862, 1, 1, 1, 1, 1,
-1.255235, -2.437595, -2.526849, 1, 1, 1, 1, 1,
-1.250664, 0.7899749, -0.1084828, 1, 1, 1, 1, 1,
-1.242459, 0.2778015, -2.440552, 1, 1, 1, 1, 1,
-1.238844, -1.782424, -4.357154, 1, 1, 1, 1, 1,
-1.23758, -0.9749126, -1.912539, 0, 0, 1, 1, 1,
-1.237389, -0.1875125, -0.0257764, 1, 0, 0, 1, 1,
-1.236256, 0.4775428, -1.775494, 1, 0, 0, 1, 1,
-1.229437, 0.9529637, -1.488841, 1, 0, 0, 1, 1,
-1.224882, -1.024046, -1.507228, 1, 0, 0, 1, 1,
-1.217395, 1.708885, -0.9366947, 1, 0, 0, 1, 1,
-1.215034, 0.9421531, 0.090944, 0, 0, 0, 1, 1,
-1.206538, 1.513424, -0.7277181, 0, 0, 0, 1, 1,
-1.200132, 0.1545703, -1.451606, 0, 0, 0, 1, 1,
-1.182647, -1.040694, -2.530727, 0, 0, 0, 1, 1,
-1.181629, 1.508445, -1.242789, 0, 0, 0, 1, 1,
-1.181285, 2.88491, 1.045798, 0, 0, 0, 1, 1,
-1.179954, 0.5165925, -0.7717707, 0, 0, 0, 1, 1,
-1.175356, 2.979848, -0.1070203, 1, 1, 1, 1, 1,
-1.172838, -0.1861056, -1.583827, 1, 1, 1, 1, 1,
-1.168216, -1.164374, -4.514069, 1, 1, 1, 1, 1,
-1.165316, 0.1746844, -1.59823, 1, 1, 1, 1, 1,
-1.1318, 0.7862229, -0.5386257, 1, 1, 1, 1, 1,
-1.127214, -0.381277, -2.540023, 1, 1, 1, 1, 1,
-1.120269, -0.9792824, -1.245725, 1, 1, 1, 1, 1,
-1.117686, -1.398394, -3.142116, 1, 1, 1, 1, 1,
-1.114012, -1.849874, -2.468542, 1, 1, 1, 1, 1,
-1.111089, 1.649245, -1.934163, 1, 1, 1, 1, 1,
-1.105793, -0.4989657, -3.023651, 1, 1, 1, 1, 1,
-1.103973, -2.518841, -3.102835, 1, 1, 1, 1, 1,
-1.092943, -0.6358137, -0.7599836, 1, 1, 1, 1, 1,
-1.090375, -0.3359181, -2.916578, 1, 1, 1, 1, 1,
-1.090319, -0.1538167, -2.708802, 1, 1, 1, 1, 1,
-1.090201, 0.1603392, -2.316428, 0, 0, 1, 1, 1,
-1.083773, 1.155916, -0.663581, 1, 0, 0, 1, 1,
-1.078533, -0.1139775, -1.623345, 1, 0, 0, 1, 1,
-1.075613, -0.5447962, -1.68627, 1, 0, 0, 1, 1,
-1.074203, -0.78782, -0.2506649, 1, 0, 0, 1, 1,
-1.072677, -0.3253701, -2.811768, 1, 0, 0, 1, 1,
-1.059802, 0.6062303, -0.9140803, 0, 0, 0, 1, 1,
-1.057453, 1.373537, 1.520931, 0, 0, 0, 1, 1,
-1.055823, -0.4752294, -1.969512, 0, 0, 0, 1, 1,
-1.053697, 0.4329712, -1.315865, 0, 0, 0, 1, 1,
-1.052047, -0.5544589, -2.774757, 0, 0, 0, 1, 1,
-1.045785, 0.483777, -1.644847, 0, 0, 0, 1, 1,
-1.031987, -0.4106347, -1.200274, 0, 0, 0, 1, 1,
-1.02772, 1.512574, 0.5205143, 1, 1, 1, 1, 1,
-1.027696, 0.522881, -1.141524, 1, 1, 1, 1, 1,
-1.027041, -1.067213, -1.79123, 1, 1, 1, 1, 1,
-1.015429, 0.09970545, -1.51709, 1, 1, 1, 1, 1,
-1.01155, 0.9728809, -0.3898887, 1, 1, 1, 1, 1,
-1.006684, 0.1379147, -0.5453753, 1, 1, 1, 1, 1,
-1.004474, 0.3271903, -2.835032, 1, 1, 1, 1, 1,
-0.9997001, -0.08603486, -1.49993, 1, 1, 1, 1, 1,
-0.9986771, -0.4372288, -1.921803, 1, 1, 1, 1, 1,
-0.993995, 1.933233, -0.04258974, 1, 1, 1, 1, 1,
-0.9878849, -0.5080302, -1.946022, 1, 1, 1, 1, 1,
-0.9877831, -0.8557398, -1.57962, 1, 1, 1, 1, 1,
-0.9841396, 1.009203, -2.659441, 1, 1, 1, 1, 1,
-0.9770038, 1.58, -0.1033775, 1, 1, 1, 1, 1,
-0.973401, -0.9648815, -1.6259, 1, 1, 1, 1, 1,
-0.9628338, -0.99001, -4.264646, 0, 0, 1, 1, 1,
-0.960388, 1.230946, -0.06907066, 1, 0, 0, 1, 1,
-0.9539931, -2.060961, -2.107628, 1, 0, 0, 1, 1,
-0.9502141, 1.443996, -1.329584, 1, 0, 0, 1, 1,
-0.949132, -0.3202378, -0.7813566, 1, 0, 0, 1, 1,
-0.94867, 1.56773, -0.07569717, 1, 0, 0, 1, 1,
-0.9481607, -1.217317, -2.483709, 0, 0, 0, 1, 1,
-0.9409001, 0.4791226, 0.594899, 0, 0, 0, 1, 1,
-0.9396349, -0.6399577, -1.133973, 0, 0, 0, 1, 1,
-0.9392418, -0.7000139, -2.55062, 0, 0, 0, 1, 1,
-0.9327503, 1.194497, -1.277371, 0, 0, 0, 1, 1,
-0.9315038, 0.7994562, -2.299596, 0, 0, 0, 1, 1,
-0.9297071, 0.525317, -1.524353, 0, 0, 0, 1, 1,
-0.9212558, 0.7938947, -0.4544887, 1, 1, 1, 1, 1,
-0.9181665, 0.3495507, -0.9957059, 1, 1, 1, 1, 1,
-0.9103773, -0.070452, -1.63488, 1, 1, 1, 1, 1,
-0.9085839, 0.4528625, -1.419589, 1, 1, 1, 1, 1,
-0.9066851, 0.6890002, -1.013229, 1, 1, 1, 1, 1,
-0.9049085, -1.234249, -2.705087, 1, 1, 1, 1, 1,
-0.9044515, 0.8708857, 0.1017949, 1, 1, 1, 1, 1,
-0.8935126, -0.3940108, -0.3872643, 1, 1, 1, 1, 1,
-0.8928332, 1.407641, -1.265123, 1, 1, 1, 1, 1,
-0.8910707, -1.015344, -3.94895, 1, 1, 1, 1, 1,
-0.8887486, 1.231648, -0.7485722, 1, 1, 1, 1, 1,
-0.883019, 0.4371078, -0.2255871, 1, 1, 1, 1, 1,
-0.882002, -1.637112, -3.855837, 1, 1, 1, 1, 1,
-0.8808723, 0.007237393, -2.604978, 1, 1, 1, 1, 1,
-0.8802761, -0.5083156, -1.891356, 1, 1, 1, 1, 1,
-0.8756605, 0.06921645, -1.124453, 0, 0, 1, 1, 1,
-0.8755883, 0.1544926, -0.1592928, 1, 0, 0, 1, 1,
-0.8711171, 0.8299001, 0.4466872, 1, 0, 0, 1, 1,
-0.8695822, -1.636187, -1.575128, 1, 0, 0, 1, 1,
-0.8667343, -1.700905, -2.639997, 1, 0, 0, 1, 1,
-0.8654219, 0.5842668, -0.863188, 1, 0, 0, 1, 1,
-0.8632256, 0.6406564, -0.6222209, 0, 0, 0, 1, 1,
-0.8593885, -0.5865955, -1.406103, 0, 0, 0, 1, 1,
-0.8571383, -0.6261994, -3.243874, 0, 0, 0, 1, 1,
-0.8569226, -1.166694, -1.392986, 0, 0, 0, 1, 1,
-0.853631, 1.440367, -0.9935898, 0, 0, 0, 1, 1,
-0.8532421, 0.264423, -3.314809, 0, 0, 0, 1, 1,
-0.8461033, 0.8720128, -2.05598, 0, 0, 0, 1, 1,
-0.8408855, -0.7949836, -3.375028, 1, 1, 1, 1, 1,
-0.8394305, 0.6970325, -1.729706, 1, 1, 1, 1, 1,
-0.8384427, -0.7606499, -1.942289, 1, 1, 1, 1, 1,
-0.8382456, -1.607362, -2.619525, 1, 1, 1, 1, 1,
-0.8382372, -0.5294605, -2.216496, 1, 1, 1, 1, 1,
-0.8367264, -1.499418, -2.642783, 1, 1, 1, 1, 1,
-0.8327744, 1.93856, -0.2718993, 1, 1, 1, 1, 1,
-0.82881, -0.7649893, -1.70018, 1, 1, 1, 1, 1,
-0.8231594, 0.3027132, -1.308463, 1, 1, 1, 1, 1,
-0.8204472, -0.0544625, -1.506411, 1, 1, 1, 1, 1,
-0.8192999, -2.102702, -2.767747, 1, 1, 1, 1, 1,
-0.8156481, 0.6573755, 0.16793, 1, 1, 1, 1, 1,
-0.8137079, 0.03525591, -0.7996099, 1, 1, 1, 1, 1,
-0.8132762, 0.2284428, -1.120556, 1, 1, 1, 1, 1,
-0.8092362, -0.4801221, -1.704993, 1, 1, 1, 1, 1,
-0.806195, -0.320784, -1.708543, 0, 0, 1, 1, 1,
-0.8052726, -1.44718, -2.802732, 1, 0, 0, 1, 1,
-0.7999855, -1.306593, -2.490211, 1, 0, 0, 1, 1,
-0.7965856, 0.7696807, -1.09714, 1, 0, 0, 1, 1,
-0.7957517, -0.2603761, -3.139706, 1, 0, 0, 1, 1,
-0.7919939, 1.08793, -3.514196, 1, 0, 0, 1, 1,
-0.7868597, 0.1110459, -0.6307573, 0, 0, 0, 1, 1,
-0.7862177, 1.533962, -0.2136811, 0, 0, 0, 1, 1,
-0.7800427, 0.2676488, -0.5632087, 0, 0, 0, 1, 1,
-0.7797401, 1.469442, -0.2362446, 0, 0, 0, 1, 1,
-0.7746124, -0.06476628, -1.374131, 0, 0, 0, 1, 1,
-0.7707434, 0.5229523, -1.324421, 0, 0, 0, 1, 1,
-0.7694685, -0.6340779, -2.07822, 0, 0, 0, 1, 1,
-0.7672691, -0.7342411, -1.961581, 1, 1, 1, 1, 1,
-0.7654395, 0.1157227, -0.7696196, 1, 1, 1, 1, 1,
-0.7644877, -0.222761, -3.936006, 1, 1, 1, 1, 1,
-0.7570738, 0.9415953, 1.149489, 1, 1, 1, 1, 1,
-0.7555764, 0.5987587, -2.864243, 1, 1, 1, 1, 1,
-0.7543914, -0.8381682, -3.667998, 1, 1, 1, 1, 1,
-0.7520385, 0.485432, -0.9835306, 1, 1, 1, 1, 1,
-0.7515014, -0.5397453, -1.048693, 1, 1, 1, 1, 1,
-0.7502203, -2.453479, -1.358361, 1, 1, 1, 1, 1,
-0.740666, 0.4544447, 0.03138525, 1, 1, 1, 1, 1,
-0.7399614, -0.2356013, -1.0592, 1, 1, 1, 1, 1,
-0.7318059, 1.539301, -1.631007, 1, 1, 1, 1, 1,
-0.7251471, -0.3357192, -2.997535, 1, 1, 1, 1, 1,
-0.7202166, -1.295541, -2.117115, 1, 1, 1, 1, 1,
-0.7168879, -0.6656454, -2.183628, 1, 1, 1, 1, 1,
-0.7140121, -0.07793839, -1.908166, 0, 0, 1, 1, 1,
-0.7133832, 0.1140543, -0.9470105, 1, 0, 0, 1, 1,
-0.7128163, -1.762412, -1.718654, 1, 0, 0, 1, 1,
-0.7107694, -1.699633, -5.478094, 1, 0, 0, 1, 1,
-0.7071776, 1.80422, -0.4425499, 1, 0, 0, 1, 1,
-0.6953458, 0.3645908, 0.1661708, 1, 0, 0, 1, 1,
-0.6932586, -0.2921378, -2.419606, 0, 0, 0, 1, 1,
-0.6914004, -1.553525, -2.578358, 0, 0, 0, 1, 1,
-0.6872184, 1.660151, 0.7537533, 0, 0, 0, 1, 1,
-0.6834896, 1.682837, -0.6688209, 0, 0, 0, 1, 1,
-0.6827416, -0.2947495, -2.500074, 0, 0, 0, 1, 1,
-0.6826784, 0.183231, -3.318595, 0, 0, 0, 1, 1,
-0.680192, 0.5885995, -0.2141706, 0, 0, 0, 1, 1,
-0.6782709, -0.6915718, -3.822067, 1, 1, 1, 1, 1,
-0.6749499, -0.2576037, -1.237488, 1, 1, 1, 1, 1,
-0.6702714, 0.1881789, -1.103345, 1, 1, 1, 1, 1,
-0.6637651, -0.472368, -1.797327, 1, 1, 1, 1, 1,
-0.6617528, -0.5283369, -0.7745815, 1, 1, 1, 1, 1,
-0.6583558, -0.07320815, -0.3878997, 1, 1, 1, 1, 1,
-0.6561396, -1.4764, -2.137267, 1, 1, 1, 1, 1,
-0.6549004, -0.1727997, -3.037276, 1, 1, 1, 1, 1,
-0.6541013, -0.3941291, -2.690647, 1, 1, 1, 1, 1,
-0.6520169, 0.4562417, -3.079603, 1, 1, 1, 1, 1,
-0.6516626, 1.032318, -0.6870946, 1, 1, 1, 1, 1,
-0.6440254, 0.7324139, -0.7421447, 1, 1, 1, 1, 1,
-0.6440172, 0.02480103, -2.262346, 1, 1, 1, 1, 1,
-0.6436597, -0.2500685, -1.779336, 1, 1, 1, 1, 1,
-0.6338013, -2.405846, -3.491968, 1, 1, 1, 1, 1,
-0.6206027, 1.039982, -1.002259, 0, 0, 1, 1, 1,
-0.6145738, -1.132806, -1.30802, 1, 0, 0, 1, 1,
-0.607067, -0.1643777, 0.8378751, 1, 0, 0, 1, 1,
-0.6052865, -0.9938973, -3.849285, 1, 0, 0, 1, 1,
-0.6049734, -0.4612871, -4.084408, 1, 0, 0, 1, 1,
-0.6040174, 0.7412899, -2.282557, 1, 0, 0, 1, 1,
-0.6017541, 1.11703, -0.3767426, 0, 0, 0, 1, 1,
-0.5968738, 1.385662, -0.1550922, 0, 0, 0, 1, 1,
-0.5887187, -0.06092337, -1.576392, 0, 0, 0, 1, 1,
-0.587997, -0.5231043, -3.788206, 0, 0, 0, 1, 1,
-0.5870357, -0.3244043, -2.738254, 0, 0, 0, 1, 1,
-0.5770705, -0.4075726, -2.508604, 0, 0, 0, 1, 1,
-0.5758331, -0.3754528, -2.413352, 0, 0, 0, 1, 1,
-0.5726441, -0.9317861, -1.730042, 1, 1, 1, 1, 1,
-0.5721653, 1.158937, 0.491371, 1, 1, 1, 1, 1,
-0.5638707, -1.591628, -1.629382, 1, 1, 1, 1, 1,
-0.5615928, -0.7435141, -3.036339, 1, 1, 1, 1, 1,
-0.5610335, 0.6318877, 0.04988548, 1, 1, 1, 1, 1,
-0.5537634, 0.1815409, -0.7896972, 1, 1, 1, 1, 1,
-0.5533763, 0.1116668, -0.833185, 1, 1, 1, 1, 1,
-0.5474226, 0.3181674, -0.6911904, 1, 1, 1, 1, 1,
-0.5460602, -1.71065, -3.541771, 1, 1, 1, 1, 1,
-0.5460422, 1.133399, -0.8449474, 1, 1, 1, 1, 1,
-0.5448188, -1.160198, -2.759337, 1, 1, 1, 1, 1,
-0.5376886, 0.1786985, -1.687731, 1, 1, 1, 1, 1,
-0.537074, -1.391217, -3.965929, 1, 1, 1, 1, 1,
-0.534991, 1.157939, -0.7307607, 1, 1, 1, 1, 1,
-0.5332841, 1.314649, -0.5165323, 1, 1, 1, 1, 1,
-0.5270815, -0.3617809, -1.077056, 0, 0, 1, 1, 1,
-0.5250679, -0.8112941, -2.867558, 1, 0, 0, 1, 1,
-0.5209809, -0.4952883, -2.060459, 1, 0, 0, 1, 1,
-0.5167573, -0.4099009, -1.079705, 1, 0, 0, 1, 1,
-0.5110304, 0.1222759, -0.9499129, 1, 0, 0, 1, 1,
-0.5066581, 0.8102903, 0.8753824, 1, 0, 0, 1, 1,
-0.5061862, 1.016455, 0.1648249, 0, 0, 0, 1, 1,
-0.5037266, 0.1240241, -1.324681, 0, 0, 0, 1, 1,
-0.5036694, 0.3395866, -0.05103342, 0, 0, 0, 1, 1,
-0.5025741, 0.2498844, -2.102049, 0, 0, 0, 1, 1,
-0.4996237, -0.9253523, -1.458964, 0, 0, 0, 1, 1,
-0.4959305, -0.7073827, -2.924472, 0, 0, 0, 1, 1,
-0.4949306, -1.499123, -1.560432, 0, 0, 0, 1, 1,
-0.4932844, -0.2339122, -1.295338, 1, 1, 1, 1, 1,
-0.4881202, -0.5561643, -2.791112, 1, 1, 1, 1, 1,
-0.4876741, 0.5331752, -0.2783265, 1, 1, 1, 1, 1,
-0.4832731, -0.4309977, -1.194492, 1, 1, 1, 1, 1,
-0.4832278, -1.016655, -0.3789001, 1, 1, 1, 1, 1,
-0.4760809, 0.4777068, -1.591177, 1, 1, 1, 1, 1,
-0.4709382, 0.5317819, -1.791172, 1, 1, 1, 1, 1,
-0.4692244, 2.276036, -0.8608727, 1, 1, 1, 1, 1,
-0.4673428, 1.682193, -1.320457, 1, 1, 1, 1, 1,
-0.4668444, -1.265973, -2.307255, 1, 1, 1, 1, 1,
-0.4623678, -0.1454189, -1.63366, 1, 1, 1, 1, 1,
-0.462192, 1.368323, 0.2107118, 1, 1, 1, 1, 1,
-0.4556484, -1.515703, -2.45692, 1, 1, 1, 1, 1,
-0.4460954, 0.6559138, -1.277879, 1, 1, 1, 1, 1,
-0.4437004, -1.192354, -2.409463, 1, 1, 1, 1, 1,
-0.4405054, -0.7432576, -2.660125, 0, 0, 1, 1, 1,
-0.42883, -1.193096, -1.314753, 1, 0, 0, 1, 1,
-0.4272978, 0.5872864, -1.348673, 1, 0, 0, 1, 1,
-0.4268495, -0.5610862, -3.164005, 1, 0, 0, 1, 1,
-0.424318, 0.4346316, -1.142521, 1, 0, 0, 1, 1,
-0.4230159, 0.2363582, -1.932783, 1, 0, 0, 1, 1,
-0.4208106, 0.6630951, 1.291739, 0, 0, 0, 1, 1,
-0.4169479, 2.205769, 0.04376329, 0, 0, 0, 1, 1,
-0.4168935, -0.2972301, -1.973589, 0, 0, 0, 1, 1,
-0.4165325, -0.5729848, -1.372024, 0, 0, 0, 1, 1,
-0.4158182, 1.128234, 0.5291184, 0, 0, 0, 1, 1,
-0.4115062, 0.6331581, -1.395533, 0, 0, 0, 1, 1,
-0.4101783, 1.718893, 1.613215, 0, 0, 0, 1, 1,
-0.40935, 1.389259, -1.815278, 1, 1, 1, 1, 1,
-0.4069155, 1.069409, -0.3497277, 1, 1, 1, 1, 1,
-0.4055276, 1.350389, 0.475985, 1, 1, 1, 1, 1,
-0.4037981, -0.7492822, -4.084226, 1, 1, 1, 1, 1,
-0.4026799, 0.4291563, -0.2048198, 1, 1, 1, 1, 1,
-0.4009188, -0.07861351, -1.029084, 1, 1, 1, 1, 1,
-0.3988541, -0.9986238, -4.303288, 1, 1, 1, 1, 1,
-0.3949789, 0.2451077, -1.016367, 1, 1, 1, 1, 1,
-0.3913772, -0.984601, -2.024652, 1, 1, 1, 1, 1,
-0.3889005, 0.1060031, -1.785372, 1, 1, 1, 1, 1,
-0.3828014, 0.5868682, -0.1582458, 1, 1, 1, 1, 1,
-0.3800927, 0.2953145, -1.680159, 1, 1, 1, 1, 1,
-0.3790094, 0.9192488, -0.05594302, 1, 1, 1, 1, 1,
-0.3779038, 0.2987615, -0.1326815, 1, 1, 1, 1, 1,
-0.3741207, -1.27378, -2.794172, 1, 1, 1, 1, 1,
-0.361857, 0.3479926, -1.174742, 0, 0, 1, 1, 1,
-0.360061, 0.008213892, -1.785249, 1, 0, 0, 1, 1,
-0.3577998, 0.7917112, -1.037736, 1, 0, 0, 1, 1,
-0.3566934, -1.021513, -3.020953, 1, 0, 0, 1, 1,
-0.3489497, -1.358119, -4.447906, 1, 0, 0, 1, 1,
-0.3446594, -1.495543, -3.330505, 1, 0, 0, 1, 1,
-0.3442806, -2.638798, -2.776595, 0, 0, 0, 1, 1,
-0.3433066, -0.2566239, -2.184021, 0, 0, 0, 1, 1,
-0.3406235, 2.52975, -0.3950197, 0, 0, 0, 1, 1,
-0.3361769, 0.9154417, -0.9528086, 0, 0, 0, 1, 1,
-0.3341262, 0.5934348, -2.380046, 0, 0, 0, 1, 1,
-0.3315798, 0.4387126, -0.5181888, 0, 0, 0, 1, 1,
-0.331501, 0.8454427, -0.1211418, 0, 0, 0, 1, 1,
-0.325422, 1.599553, -0.2336796, 1, 1, 1, 1, 1,
-0.3245592, 0.2768149, -1.190188, 1, 1, 1, 1, 1,
-0.3226805, -0.4724323, -3.802941, 1, 1, 1, 1, 1,
-0.3222571, 0.3635985, -1.129961, 1, 1, 1, 1, 1,
-0.3214562, 1.894176, -0.3768032, 1, 1, 1, 1, 1,
-0.3158553, -1.744016, -2.846625, 1, 1, 1, 1, 1,
-0.3061152, 1.326878, 0.4430647, 1, 1, 1, 1, 1,
-0.3023328, -1.046148, -2.715439, 1, 1, 1, 1, 1,
-0.3017617, 0.471149, -1.59939, 1, 1, 1, 1, 1,
-0.2996053, -1.438006, -3.26522, 1, 1, 1, 1, 1,
-0.2967823, -0.8006475, -2.54626, 1, 1, 1, 1, 1,
-0.2945291, -1.641842, -2.776753, 1, 1, 1, 1, 1,
-0.2929905, -0.2526871, -1.507024, 1, 1, 1, 1, 1,
-0.2927108, 0.06786843, -1.90637, 1, 1, 1, 1, 1,
-0.2917282, 0.1367168, -1.279658, 1, 1, 1, 1, 1,
-0.2861251, 0.6205837, -0.6526424, 0, 0, 1, 1, 1,
-0.2852383, -1.814145, -3.864424, 1, 0, 0, 1, 1,
-0.2847324, -1.039737, -2.002786, 1, 0, 0, 1, 1,
-0.282973, 1.573056, -0.9004928, 1, 0, 0, 1, 1,
-0.2801147, 0.2242402, -0.6457761, 1, 0, 0, 1, 1,
-0.2782242, 1.507731, -0.5169235, 1, 0, 0, 1, 1,
-0.2777891, 0.3952515, 1.223914, 0, 0, 0, 1, 1,
-0.2763433, 0.7465125, -0.6043994, 0, 0, 0, 1, 1,
-0.2665014, 0.1218717, -1.13821, 0, 0, 0, 1, 1,
-0.264909, 1.401122, -0.4809853, 0, 0, 0, 1, 1,
-0.2643141, 0.1810818, -2.932282, 0, 0, 0, 1, 1,
-0.2642262, 0.2360558, -0.1695369, 0, 0, 0, 1, 1,
-0.2631329, -0.1055955, -1.328694, 0, 0, 0, 1, 1,
-0.2621618, 1.555332, -0.3613359, 1, 1, 1, 1, 1,
-0.255102, -0.2091654, -2.319226, 1, 1, 1, 1, 1,
-0.2549555, -2.399265, -3.976229, 1, 1, 1, 1, 1,
-0.244379, 1.461273, -0.475334, 1, 1, 1, 1, 1,
-0.2406658, -1.754044, -3.700833, 1, 1, 1, 1, 1,
-0.2347116, -0.9678711, -3.260188, 1, 1, 1, 1, 1,
-0.2310885, 0.3083124, -0.4316467, 1, 1, 1, 1, 1,
-0.2285721, -0.6339306, -1.911776, 1, 1, 1, 1, 1,
-0.2196249, -0.6622861, -2.518601, 1, 1, 1, 1, 1,
-0.2152107, 0.7830826, 0.6881206, 1, 1, 1, 1, 1,
-0.212753, 2.155147, -0.239909, 1, 1, 1, 1, 1,
-0.2108001, 0.5244138, 0.3426189, 1, 1, 1, 1, 1,
-0.2104343, -0.3352311, -0.5883657, 1, 1, 1, 1, 1,
-0.2087063, 0.06546948, -1.946115, 1, 1, 1, 1, 1,
-0.2068018, -0.4500287, -3.412082, 1, 1, 1, 1, 1,
-0.2067904, 2.76775, -0.4892476, 0, 0, 1, 1, 1,
-0.2056941, -0.6912188, -4.430921, 1, 0, 0, 1, 1,
-0.2051607, 0.403896, -0.6187994, 1, 0, 0, 1, 1,
-0.2040103, 1.868459, 0.0266954, 1, 0, 0, 1, 1,
-0.20295, -0.07996614, -2.323648, 1, 0, 0, 1, 1,
-0.1982052, 0.6210694, -0.02509344, 1, 0, 0, 1, 1,
-0.1959424, 1.007451, -0.1292015, 0, 0, 0, 1, 1,
-0.1852364, -0.7479314, -2.928609, 0, 0, 0, 1, 1,
-0.185043, -0.8995888, -2.448231, 0, 0, 0, 1, 1,
-0.1816911, 1.547317, -1.393789, 0, 0, 0, 1, 1,
-0.1798018, -0.3652721, -4.278766, 0, 0, 0, 1, 1,
-0.171809, -0.3962186, -2.666326, 0, 0, 0, 1, 1,
-0.1702256, -1.570347, -2.623427, 0, 0, 0, 1, 1,
-0.1644047, 1.89734, -0.3152169, 1, 1, 1, 1, 1,
-0.1509196, 0.4222965, -1.355534, 1, 1, 1, 1, 1,
-0.148921, -0.1772455, -1.356588, 1, 1, 1, 1, 1,
-0.1459094, 1.144077, -1.403067, 1, 1, 1, 1, 1,
-0.1444074, 0.6515949, -1.1101, 1, 1, 1, 1, 1,
-0.1366723, -0.6742201, -4.889035, 1, 1, 1, 1, 1,
-0.1366332, -1.124864, -1.102248, 1, 1, 1, 1, 1,
-0.1332077, 0.1698137, -1.430157, 1, 1, 1, 1, 1,
-0.1330029, 0.216877, -1.555261, 1, 1, 1, 1, 1,
-0.132952, 1.631079, -1.042845, 1, 1, 1, 1, 1,
-0.1313721, 0.6462719, -1.355569, 1, 1, 1, 1, 1,
-0.1302928, 0.1010683, -1.817934, 1, 1, 1, 1, 1,
-0.122043, 0.6596632, -1.499068, 1, 1, 1, 1, 1,
-0.1195035, 2.244819, 0.2964146, 1, 1, 1, 1, 1,
-0.118704, -1.176046, -2.173852, 1, 1, 1, 1, 1,
-0.1167817, -1.766814, -3.284122, 0, 0, 1, 1, 1,
-0.112325, 1.288167, 0.3197073, 1, 0, 0, 1, 1,
-0.1118377, -0.08830933, -3.537554, 1, 0, 0, 1, 1,
-0.1086199, 0.7495533, 1.572944, 1, 0, 0, 1, 1,
-0.1085768, 0.5716737, 1.437136, 1, 0, 0, 1, 1,
-0.1044775, 1.257516, -2.158808, 1, 0, 0, 1, 1,
-0.1033834, 0.1203143, 0.2934064, 0, 0, 0, 1, 1,
-0.09836558, -0.429311, -1.305614, 0, 0, 0, 1, 1,
-0.09131882, -1.443533, -2.965337, 0, 0, 0, 1, 1,
-0.0790296, 0.4019011, -0.9360885, 0, 0, 0, 1, 1,
-0.0785176, 0.03055206, -2.473554, 0, 0, 0, 1, 1,
-0.07583829, 1.454276, -0.7290825, 0, 0, 0, 1, 1,
-0.0756174, 1.329892, 0.2525961, 0, 0, 0, 1, 1,
-0.07458418, -0.03197847, -2.40196, 1, 1, 1, 1, 1,
-0.07406434, 1.164096, -0.3165128, 1, 1, 1, 1, 1,
-0.0723208, -0.4675049, -2.625501, 1, 1, 1, 1, 1,
-0.07056132, -0.5682387, -1.044931, 1, 1, 1, 1, 1,
-0.06771898, -2.544231, -4.932741, 1, 1, 1, 1, 1,
-0.06708395, -0.1971599, -2.840659, 1, 1, 1, 1, 1,
-0.06674112, -0.05494374, -2.172241, 1, 1, 1, 1, 1,
-0.06554116, 0.4185835, -1.120282, 1, 1, 1, 1, 1,
-0.06263991, 0.1664321, -0.2173804, 1, 1, 1, 1, 1,
-0.0609651, -1.618918, -2.450046, 1, 1, 1, 1, 1,
-0.06070564, -0.8923382, -3.045979, 1, 1, 1, 1, 1,
-0.05649278, -0.9314219, -2.120392, 1, 1, 1, 1, 1,
-0.05493969, -0.5763656, -3.02796, 1, 1, 1, 1, 1,
-0.05446408, 0.2959239, -0.7864389, 1, 1, 1, 1, 1,
-0.05354329, -0.3633731, -2.643276, 1, 1, 1, 1, 1,
-0.05339873, 0.07131426, -1.70242, 0, 0, 1, 1, 1,
-0.05328809, -0.08417773, -3.680169, 1, 0, 0, 1, 1,
-0.05250433, 0.4917199, -0.2956948, 1, 0, 0, 1, 1,
-0.05242437, 1.033052, 1.729663, 1, 0, 0, 1, 1,
-0.04832732, -2.5509, -2.875838, 1, 0, 0, 1, 1,
-0.04676654, 0.2167496, -0.8345782, 1, 0, 0, 1, 1,
-0.04544184, -0.8633134, -3.985793, 0, 0, 0, 1, 1,
-0.04323306, -0.4113608, -3.198791, 0, 0, 0, 1, 1,
-0.04269084, 1.698555, 1.735632, 0, 0, 0, 1, 1,
-0.04042919, -0.2772088, -3.436949, 0, 0, 0, 1, 1,
-0.03550955, -0.3488219, -4.154233, 0, 0, 0, 1, 1,
-0.03393327, 0.2149046, -1.47565, 0, 0, 0, 1, 1,
-0.03342095, 1.102111, 0.3842087, 0, 0, 0, 1, 1,
-0.02296357, 0.2853679, -0.8047451, 1, 1, 1, 1, 1,
-0.02273253, 1.232288, -0.4843229, 1, 1, 1, 1, 1,
-0.02248119, -0.4239788, -2.735988, 1, 1, 1, 1, 1,
-0.0218534, -0.05787807, -4.768325, 1, 1, 1, 1, 1,
-0.02109466, -0.574758, -2.122772, 1, 1, 1, 1, 1,
-0.007092203, -0.890272, -3.142402, 1, 1, 1, 1, 1,
-0.006885852, 0.8418968, 1.015348, 1, 1, 1, 1, 1,
-0.001603332, 1.013154, 0.3927502, 1, 1, 1, 1, 1,
-0.0006125017, -0.7581626, -3.413253, 1, 1, 1, 1, 1,
0.001267137, -0.3122735, 4.738562, 1, 1, 1, 1, 1,
0.001600435, -0.6125181, 0.6335776, 1, 1, 1, 1, 1,
0.001824751, -0.3182366, 1.976098, 1, 1, 1, 1, 1,
0.004640788, -0.6074864, 3.331986, 1, 1, 1, 1, 1,
0.006136436, 0.1346526, -1.994565, 1, 1, 1, 1, 1,
0.008273841, 0.1045823, -0.234674, 1, 1, 1, 1, 1,
0.01160053, 1.104902, -2.569942, 0, 0, 1, 1, 1,
0.01343398, -0.2522437, 1.532826, 1, 0, 0, 1, 1,
0.01419469, -1.629903, 2.673357, 1, 0, 0, 1, 1,
0.01448649, 0.4772944, 0.2418608, 1, 0, 0, 1, 1,
0.01626439, -0.4108894, 4.015717, 1, 0, 0, 1, 1,
0.01682918, -0.175287, 2.990966, 1, 0, 0, 1, 1,
0.0182036, -0.9648389, 1.585256, 0, 0, 0, 1, 1,
0.02057932, 1.207578, -0.9243655, 0, 0, 0, 1, 1,
0.02200626, -0.4136034, 1.028986, 0, 0, 0, 1, 1,
0.02262436, 1.060728, -0.6018748, 0, 0, 0, 1, 1,
0.02297914, -1.251282, 3.659278, 0, 0, 0, 1, 1,
0.02353118, -0.03808133, 1.307757, 0, 0, 0, 1, 1,
0.02387959, 0.0610586, 0.0431244, 0, 0, 0, 1, 1,
0.02470403, 1.061532, -0.7435638, 1, 1, 1, 1, 1,
0.0250483, -2.401366, 2.584223, 1, 1, 1, 1, 1,
0.02935032, -0.3282026, 1.553279, 1, 1, 1, 1, 1,
0.03267137, -0.8894764, 4.744376, 1, 1, 1, 1, 1,
0.03461295, 0.7339858, -0.2138336, 1, 1, 1, 1, 1,
0.03933186, 0.0842505, 0.334862, 1, 1, 1, 1, 1,
0.04114291, 0.6690704, 0.9929467, 1, 1, 1, 1, 1,
0.04328004, 1.601951, 0.2169679, 1, 1, 1, 1, 1,
0.0435056, -0.02423093, 0.5704976, 1, 1, 1, 1, 1,
0.04397563, -0.05979734, 1.375319, 1, 1, 1, 1, 1,
0.04557461, -1.098713, 3.19188, 1, 1, 1, 1, 1,
0.04931867, 1.204052, -0.9533898, 1, 1, 1, 1, 1,
0.05310141, 0.3098652, 0.05829084, 1, 1, 1, 1, 1,
0.05534939, 1.028941, 0.7153257, 1, 1, 1, 1, 1,
0.05675793, -0.8131426, 4.442488, 1, 1, 1, 1, 1,
0.06079496, -2.166449, 1.434056, 0, 0, 1, 1, 1,
0.06582172, 0.1679348, 2.197029, 1, 0, 0, 1, 1,
0.0664727, -0.5084758, 1.919312, 1, 0, 0, 1, 1,
0.06700714, -0.6347756, 0.721628, 1, 0, 0, 1, 1,
0.06747595, -0.2633806, 3.615737, 1, 0, 0, 1, 1,
0.06787584, 0.7946686, 0.5419682, 1, 0, 0, 1, 1,
0.06830399, 1.414053, 1.299818, 0, 0, 0, 1, 1,
0.07444064, 1.793333, 1.630517, 0, 0, 0, 1, 1,
0.07798587, -0.7324549, 2.113935, 0, 0, 0, 1, 1,
0.07825369, -0.07927172, 2.335837, 0, 0, 0, 1, 1,
0.08055177, -0.4170116, 2.455808, 0, 0, 0, 1, 1,
0.08063343, -1.141837, 2.909333, 0, 0, 0, 1, 1,
0.102962, -0.6986827, 3.468169, 0, 0, 0, 1, 1,
0.1071085, 2.556194, -0.08137289, 1, 1, 1, 1, 1,
0.1092883, -0.3322766, 2.406726, 1, 1, 1, 1, 1,
0.1099917, 0.5875224, 0.3652761, 1, 1, 1, 1, 1,
0.1148891, -1.003436, 4.507627, 1, 1, 1, 1, 1,
0.1153313, -0.9935032, 2.91186, 1, 1, 1, 1, 1,
0.1181828, -0.1450937, 2.517905, 1, 1, 1, 1, 1,
0.1183012, 2.242318, 0.5356308, 1, 1, 1, 1, 1,
0.1207666, 1.365394, -0.3001141, 1, 1, 1, 1, 1,
0.1249904, 0.878203, -0.2390457, 1, 1, 1, 1, 1,
0.1271412, 1.351693, 0.5998504, 1, 1, 1, 1, 1,
0.1286257, 1.165808, 0.4698562, 1, 1, 1, 1, 1,
0.1288282, 0.1613005, 1.390302, 1, 1, 1, 1, 1,
0.1304305, 0.2457895, -1.059896, 1, 1, 1, 1, 1,
0.1340179, 1.400568, 1.042672, 1, 1, 1, 1, 1,
0.1345235, -2.942364, 2.090599, 1, 1, 1, 1, 1,
0.1441002, 0.5372145, 1.260435, 0, 0, 1, 1, 1,
0.1514438, -0.6702839, 3.298289, 1, 0, 0, 1, 1,
0.151645, -0.4440401, 3.854872, 1, 0, 0, 1, 1,
0.15231, 0.4294711, 1.18687, 1, 0, 0, 1, 1,
0.1540787, 0.734242, 0.450688, 1, 0, 0, 1, 1,
0.1611477, -2.007735, 1.893456, 1, 0, 0, 1, 1,
0.1618804, -0.450836, 2.935521, 0, 0, 0, 1, 1,
0.1620827, -0.300413, 3.26725, 0, 0, 0, 1, 1,
0.1647222, 0.3789826, 1.211137, 0, 0, 0, 1, 1,
0.1678917, 1.097326, 0.4941328, 0, 0, 0, 1, 1,
0.1785337, -0.1038679, 1.828945, 0, 0, 0, 1, 1,
0.1787975, -0.1910116, 3.485427, 0, 0, 0, 1, 1,
0.1796746, 1.296775, 0.3149211, 0, 0, 0, 1, 1,
0.1814878, 0.8822386, 0.5130636, 1, 1, 1, 1, 1,
0.1823984, 1.302465, 0.1593792, 1, 1, 1, 1, 1,
0.1842795, 0.4642791, 0.3642717, 1, 1, 1, 1, 1,
0.189953, 0.1891546, 1.791465, 1, 1, 1, 1, 1,
0.1925551, 0.6866886, 0.6702814, 1, 1, 1, 1, 1,
0.1954632, -0.4097424, 2.406536, 1, 1, 1, 1, 1,
0.1990787, -0.4286069, 4.038152, 1, 1, 1, 1, 1,
0.2019817, -1.167654, 4.079199, 1, 1, 1, 1, 1,
0.2023069, -1.267455, 1.979846, 1, 1, 1, 1, 1,
0.204743, 0.6025699, 0.2519798, 1, 1, 1, 1, 1,
0.2058653, 1.785481, -0.1842817, 1, 1, 1, 1, 1,
0.2071979, -0.7051218, 2.681376, 1, 1, 1, 1, 1,
0.2087859, -0.4672267, 2.378633, 1, 1, 1, 1, 1,
0.2089852, 0.2924966, 2.137908, 1, 1, 1, 1, 1,
0.2099922, 0.9717755, -0.1291496, 1, 1, 1, 1, 1,
0.2107232, -0.1711995, 1.705715, 0, 0, 1, 1, 1,
0.2117817, -0.1166174, 0.5225322, 1, 0, 0, 1, 1,
0.2132079, -0.7422519, 5.564388, 1, 0, 0, 1, 1,
0.2206509, 0.7626218, 0.7100673, 1, 0, 0, 1, 1,
0.221327, -0.002209002, 1.893721, 1, 0, 0, 1, 1,
0.2227643, -1.724065, 3.796673, 1, 0, 0, 1, 1,
0.2233652, -1.285268, 3.026179, 0, 0, 0, 1, 1,
0.224033, -0.4581235, 4.135088, 0, 0, 0, 1, 1,
0.2316787, -0.524539, 0.5412796, 0, 0, 0, 1, 1,
0.2407034, 1.840245, -0.573231, 0, 0, 0, 1, 1,
0.241417, 1.251889, -0.6011327, 0, 0, 0, 1, 1,
0.24556, -0.001958511, -0.3295806, 0, 0, 0, 1, 1,
0.2461218, -1.388248, 3.096925, 0, 0, 0, 1, 1,
0.2474123, 1.204912, 0.05966643, 1, 1, 1, 1, 1,
0.2476328, -0.5854915, 4.161637, 1, 1, 1, 1, 1,
0.2539569, 1.162891, 1.15621, 1, 1, 1, 1, 1,
0.2599815, -0.7420858, 2.660027, 1, 1, 1, 1, 1,
0.2609985, -0.447771, 1.99179, 1, 1, 1, 1, 1,
0.2641614, -0.02121417, 2.748743, 1, 1, 1, 1, 1,
0.2646958, 0.174131, 0.3830321, 1, 1, 1, 1, 1,
0.2660745, -1.237989, 0.2970121, 1, 1, 1, 1, 1,
0.2666115, -0.06229452, 1.913602, 1, 1, 1, 1, 1,
0.2673102, -0.428114, 2.740505, 1, 1, 1, 1, 1,
0.2679818, -2.365961, 2.559895, 1, 1, 1, 1, 1,
0.2698052, -0.327098, -0.4629125, 1, 1, 1, 1, 1,
0.2711381, 0.1859078, 0.2196373, 1, 1, 1, 1, 1,
0.2765301, 0.4657319, 2.292948, 1, 1, 1, 1, 1,
0.2771236, -1.725609, 3.912518, 1, 1, 1, 1, 1,
0.2846775, 0.03518651, 2.018482, 0, 0, 1, 1, 1,
0.2884862, 0.3503242, 0.3230408, 1, 0, 0, 1, 1,
0.2891182, 0.6666453, 1.047492, 1, 0, 0, 1, 1,
0.2900294, 0.7363692, 1.933831, 1, 0, 0, 1, 1,
0.2918168, -1.249874, 3.981057, 1, 0, 0, 1, 1,
0.2921706, -0.3064927, 0.763293, 1, 0, 0, 1, 1,
0.2971012, -0.4204539, 0.8416948, 0, 0, 0, 1, 1,
0.2974113, 1.3976, -0.594534, 0, 0, 0, 1, 1,
0.2975857, -1.68235, 1.059505, 0, 0, 0, 1, 1,
0.2990764, -1.184388, 3.56503, 0, 0, 0, 1, 1,
0.3015566, -0.7916934, 2.405071, 0, 0, 0, 1, 1,
0.3038494, -0.1168844, 2.845903, 0, 0, 0, 1, 1,
0.3042615, -1.460791, 5.02463, 0, 0, 0, 1, 1,
0.3083006, 2.159003, -3.101376, 1, 1, 1, 1, 1,
0.3097756, 0.3706613, 0.2983216, 1, 1, 1, 1, 1,
0.3142315, -0.06928285, 0.5549582, 1, 1, 1, 1, 1,
0.3168534, 0.3930216, 0.3085017, 1, 1, 1, 1, 1,
0.3172055, 0.1886286, 1.081011, 1, 1, 1, 1, 1,
0.3204829, 0.07029793, 1.307464, 1, 1, 1, 1, 1,
0.3217211, 1.137596, 0.3655706, 1, 1, 1, 1, 1,
0.3226973, -0.7824917, 2.226971, 1, 1, 1, 1, 1,
0.3264985, 0.6276149, 0.9922825, 1, 1, 1, 1, 1,
0.3273341, -1.268601, 3.476436, 1, 1, 1, 1, 1,
0.3320705, -0.0694703, 0.6133542, 1, 1, 1, 1, 1,
0.332338, 1.215884, 0.2150142, 1, 1, 1, 1, 1,
0.3325053, 0.4623615, 0.7272626, 1, 1, 1, 1, 1,
0.3359941, 1.274132, 0.6738369, 1, 1, 1, 1, 1,
0.3415149, -1.065335, 4.338899, 1, 1, 1, 1, 1,
0.3441427, -0.2321519, 0.5473626, 0, 0, 1, 1, 1,
0.3569149, -1.539971, 4.141453, 1, 0, 0, 1, 1,
0.3618099, 0.1623088, 0.8224346, 1, 0, 0, 1, 1,
0.3649108, 1.313111, 1.556503, 1, 0, 0, 1, 1,
0.3652917, -0.2686489, 0.721055, 1, 0, 0, 1, 1,
0.3675241, -0.2118526, 3.540221, 1, 0, 0, 1, 1,
0.3712224, -0.190447, 1.009157, 0, 0, 0, 1, 1,
0.3722945, -0.3563813, 1.952971, 0, 0, 0, 1, 1,
0.3728519, -0.04912147, 1.691662, 0, 0, 0, 1, 1,
0.3731935, 0.02035347, 0.5224282, 0, 0, 0, 1, 1,
0.3782659, 0.1120972, 2.411029, 0, 0, 0, 1, 1,
0.3784954, 0.1175861, 0.7258919, 0, 0, 0, 1, 1,
0.3790638, 0.8158403, 0.2435615, 0, 0, 0, 1, 1,
0.3799888, 0.08599301, 0.7817523, 1, 1, 1, 1, 1,
0.3810801, 0.6143584, 0.2878958, 1, 1, 1, 1, 1,
0.3922881, 0.5325813, 0.5104514, 1, 1, 1, 1, 1,
0.3923944, 1.691799, 1.263081, 1, 1, 1, 1, 1,
0.3940874, -1.679245, 2.355473, 1, 1, 1, 1, 1,
0.3975354, -1.120021, 2.571555, 1, 1, 1, 1, 1,
0.4015501, 1.390438, 0.5133587, 1, 1, 1, 1, 1,
0.4075337, -1.358558, 1.630836, 1, 1, 1, 1, 1,
0.4138887, -1.877026, 4.456207, 1, 1, 1, 1, 1,
0.4214753, -0.9492979, 2.355705, 1, 1, 1, 1, 1,
0.4217841, -1.709778, 2.997873, 1, 1, 1, 1, 1,
0.4260035, 2.056237, -0.5429869, 1, 1, 1, 1, 1,
0.4294228, 0.09946096, 2.043959, 1, 1, 1, 1, 1,
0.4335135, 0.1975582, 2.517556, 1, 1, 1, 1, 1,
0.4340437, 0.5433604, 0.1887441, 1, 1, 1, 1, 1,
0.4357336, 0.1138694, 0.01298254, 0, 0, 1, 1, 1,
0.4370861, 1.808488, -0.01712765, 1, 0, 0, 1, 1,
0.439735, -0.09877802, 3.969521, 1, 0, 0, 1, 1,
0.4473355, 0.4496929, 0.9922749, 1, 0, 0, 1, 1,
0.4574131, 0.2159817, 1.400701, 1, 0, 0, 1, 1,
0.4577294, 0.939203, 0.6469306, 1, 0, 0, 1, 1,
0.4607967, 1.46251, -0.6692463, 0, 0, 0, 1, 1,
0.4656142, 0.5566738, -1.574921, 0, 0, 0, 1, 1,
0.4658367, 0.5940361, -0.5167603, 0, 0, 0, 1, 1,
0.4663963, 0.7289424, 1.242584, 0, 0, 0, 1, 1,
0.4691756, 0.6250603, 0.4757793, 0, 0, 0, 1, 1,
0.4719608, 0.7287406, -0.2603658, 0, 0, 0, 1, 1,
0.4719819, -1.657541, 2.343823, 0, 0, 0, 1, 1,
0.47334, 0.6298277, -1.01228, 1, 1, 1, 1, 1,
0.4774131, -0.3282753, 1.600683, 1, 1, 1, 1, 1,
0.4846668, -1.522321, 3.756844, 1, 1, 1, 1, 1,
0.4848819, 0.6316217, 0.2405722, 1, 1, 1, 1, 1,
0.4875079, -0.3730083, 2.409873, 1, 1, 1, 1, 1,
0.4941799, 1.039957, -1.046589, 1, 1, 1, 1, 1,
0.4968052, -1.141909, 2.679846, 1, 1, 1, 1, 1,
0.5049565, -0.05801651, 1.259427, 1, 1, 1, 1, 1,
0.5063087, 0.6823435, 1.620649, 1, 1, 1, 1, 1,
0.5066918, 1.629039, 1.200567, 1, 1, 1, 1, 1,
0.5093725, 1.64118, 0.7121955, 1, 1, 1, 1, 1,
0.5120949, -1.163954, 2.563806, 1, 1, 1, 1, 1,
0.5150647, -0.4372324, 2.861661, 1, 1, 1, 1, 1,
0.5163465, -0.5563073, 3.049228, 1, 1, 1, 1, 1,
0.5167469, -0.2152179, 3.740688, 1, 1, 1, 1, 1,
0.5198311, -0.3306673, 2.111036, 0, 0, 1, 1, 1,
0.5255135, -0.8464925, 2.512657, 1, 0, 0, 1, 1,
0.5256845, 0.6280941, 0.9527023, 1, 0, 0, 1, 1,
0.526365, -1.198515, 1.967558, 1, 0, 0, 1, 1,
0.5315816, 0.3458316, 1.572569, 1, 0, 0, 1, 1,
0.5321186, 0.5809521, 0.2717374, 1, 0, 0, 1, 1,
0.5328885, 1.21219, 1.47766, 0, 0, 0, 1, 1,
0.5347607, -1.302449, 2.848627, 0, 0, 0, 1, 1,
0.5361838, 0.4122018, 0.5933609, 0, 0, 0, 1, 1,
0.5361955, -0.1282893, -0.03326187, 0, 0, 0, 1, 1,
0.5462078, -1.506552, 2.767093, 0, 0, 0, 1, 1,
0.5475361, -0.4295972, 2.821023, 0, 0, 0, 1, 1,
0.548768, -1.129156, 1.917971, 0, 0, 0, 1, 1,
0.5571839, 0.3591606, -0.2920713, 1, 1, 1, 1, 1,
0.5578312, -1.127364, 3.630095, 1, 1, 1, 1, 1,
0.5585889, 0.3704393, 0.5518154, 1, 1, 1, 1, 1,
0.5586868, -1.608243, 2.325506, 1, 1, 1, 1, 1,
0.5652906, -1.959202, 4.406855, 1, 1, 1, 1, 1,
0.5754787, 0.2170521, 1.527475, 1, 1, 1, 1, 1,
0.5786754, 2.197867, 3.592043, 1, 1, 1, 1, 1,
0.5797016, 0.7954892, 1.725479, 1, 1, 1, 1, 1,
0.581871, -1.486193, 1.360092, 1, 1, 1, 1, 1,
0.5835012, 2.913505, 0.6771129, 1, 1, 1, 1, 1,
0.5851319, 0.2299688, 1.22045, 1, 1, 1, 1, 1,
0.5875437, 1.516295, -0.9633239, 1, 1, 1, 1, 1,
0.5883494, 1.303561, 0.7522646, 1, 1, 1, 1, 1,
0.5940574, -0.6681659, 1.603493, 1, 1, 1, 1, 1,
0.5942505, -1.216081, 1.61917, 1, 1, 1, 1, 1,
0.5973023, -0.6385298, 1.322783, 0, 0, 1, 1, 1,
0.5974413, -1.615214, 2.309826, 1, 0, 0, 1, 1,
0.5991449, -0.07625154, 1.230285, 1, 0, 0, 1, 1,
0.6016368, -0.3338585, 2.639371, 1, 0, 0, 1, 1,
0.6029165, 1.413996, -0.8046982, 1, 0, 0, 1, 1,
0.6033945, 1.072835, -0.5464928, 1, 0, 0, 1, 1,
0.6206062, -1.746399, 4.578607, 0, 0, 0, 1, 1,
0.621142, -0.5015826, 1.920232, 0, 0, 0, 1, 1,
0.6241673, -0.6953817, 1.083501, 0, 0, 0, 1, 1,
0.6249594, 0.1009194, 1.884615, 0, 0, 0, 1, 1,
0.632734, -0.8544804, 1.635832, 0, 0, 0, 1, 1,
0.6385166, -0.4497616, 5.374103, 0, 0, 0, 1, 1,
0.6427423, -0.003692339, 0.7515396, 0, 0, 0, 1, 1,
0.6454609, -1.734675, 3.371812, 1, 1, 1, 1, 1,
0.652447, -0.8106017, 1.713366, 1, 1, 1, 1, 1,
0.6553456, 0.5005985, -0.3066019, 1, 1, 1, 1, 1,
0.6558695, -1.129496, 4.474913, 1, 1, 1, 1, 1,
0.6565475, 0.8041342, 1.206389, 1, 1, 1, 1, 1,
0.6595091, 0.2386841, -1.374756, 1, 1, 1, 1, 1,
0.6601817, -0.1793743, 2.780484, 1, 1, 1, 1, 1,
0.661805, -0.5096086, 2.598955, 1, 1, 1, 1, 1,
0.6636515, -1.051747, 4.465508, 1, 1, 1, 1, 1,
0.6655209, 0.196647, 0.9636562, 1, 1, 1, 1, 1,
0.6675765, 0.9566326, 1.320524, 1, 1, 1, 1, 1,
0.6703912, -0.4605027, 2.298472, 1, 1, 1, 1, 1,
0.6705247, -0.7430679, 2.501871, 1, 1, 1, 1, 1,
0.6711223, -0.06591814, 3.278931, 1, 1, 1, 1, 1,
0.6742603, -1.169402, 1.775411, 1, 1, 1, 1, 1,
0.6848433, 1.603861, 0.7850201, 0, 0, 1, 1, 1,
0.6965541, 0.7310743, 1.929245, 1, 0, 0, 1, 1,
0.7029102, -1.128777, 3.68162, 1, 0, 0, 1, 1,
0.7048579, -0.5578036, 1.997417, 1, 0, 0, 1, 1,
0.7054634, 0.147913, 1.677691, 1, 0, 0, 1, 1,
0.7125744, 0.8268658, 0.4893158, 1, 0, 0, 1, 1,
0.7144643, -1.914288, 2.553865, 0, 0, 0, 1, 1,
0.7152877, 0.560821, 1.722979, 0, 0, 0, 1, 1,
0.715912, -0.3196969, 2.229013, 0, 0, 0, 1, 1,
0.7229308, 1.049581, 1.724792, 0, 0, 0, 1, 1,
0.7245917, 0.292904, 2.619444, 0, 0, 0, 1, 1,
0.7258194, 0.5208564, 0.3257279, 0, 0, 0, 1, 1,
0.7289746, -0.02244736, 0.5692663, 0, 0, 0, 1, 1,
0.7302253, -0.3866601, 3.729058, 1, 1, 1, 1, 1,
0.7308736, 0.4010081, 0.5844377, 1, 1, 1, 1, 1,
0.7318522, -1.504132, 3.602766, 1, 1, 1, 1, 1,
0.7353138, 0.05389556, 1.572631, 1, 1, 1, 1, 1,
0.7378701, 0.6368466, 0.05916923, 1, 1, 1, 1, 1,
0.7421563, 0.8376679, 1.387028, 1, 1, 1, 1, 1,
0.7482076, -0.611521, 3.425839, 1, 1, 1, 1, 1,
0.7489883, 0.4380044, -0.3910246, 1, 1, 1, 1, 1,
0.7490599, 1.176846, 1.580584, 1, 1, 1, 1, 1,
0.7518898, 0.8877065, 3.484968, 1, 1, 1, 1, 1,
0.7520591, -0.4378539, 1.945303, 1, 1, 1, 1, 1,
0.7593315, 1.405446, -0.7762846, 1, 1, 1, 1, 1,
0.7639665, -0.74143, 1.146091, 1, 1, 1, 1, 1,
0.765423, -0.664341, 1.625975, 1, 1, 1, 1, 1,
0.7659304, -1.861804, 4.346412, 1, 1, 1, 1, 1,
0.7705117, 2.080542, 1.329151, 0, 0, 1, 1, 1,
0.7794176, -0.2892093, 1.999267, 1, 0, 0, 1, 1,
0.7824489, -0.128575, 2.293489, 1, 0, 0, 1, 1,
0.7834989, -0.09765227, 1.726923, 1, 0, 0, 1, 1,
0.7840009, 0.1316052, 2.057386, 1, 0, 0, 1, 1,
0.7955576, -1.656456, 1.288212, 1, 0, 0, 1, 1,
0.7993192, -0.3421446, 0.3418127, 0, 0, 0, 1, 1,
0.8071528, -0.2985745, 0.01052109, 0, 0, 0, 1, 1,
0.8092614, 0.3013319, 1.418899, 0, 0, 0, 1, 1,
0.809532, -1.478781, 2.352478, 0, 0, 0, 1, 1,
0.8132759, 2.068497, 0.3055335, 0, 0, 0, 1, 1,
0.8186898, 0.2697419, 0.6591617, 0, 0, 0, 1, 1,
0.8216517, -0.7421051, 2.494581, 0, 0, 0, 1, 1,
0.82721, -1.621152, 3.756481, 1, 1, 1, 1, 1,
0.8293509, 0.3936948, 1.851233, 1, 1, 1, 1, 1,
0.8296632, 0.2757375, 1.615936, 1, 1, 1, 1, 1,
0.8304703, -0.333089, 4.553708, 1, 1, 1, 1, 1,
0.8366195, 1.158542, -0.3737934, 1, 1, 1, 1, 1,
0.8391113, 1.401395, -1.312413, 1, 1, 1, 1, 1,
0.8408099, 0.3269266, 0.5408471, 1, 1, 1, 1, 1,
0.8494711, 1.871398, -0.04750894, 1, 1, 1, 1, 1,
0.8536556, 0.2729627, 1.198697, 1, 1, 1, 1, 1,
0.8593546, -1.577375, 3.698631, 1, 1, 1, 1, 1,
0.8679379, -0.17558, 0.09788505, 1, 1, 1, 1, 1,
0.868861, 0.551998, 0.06330012, 1, 1, 1, 1, 1,
0.8740959, -1.193609, 2.217137, 1, 1, 1, 1, 1,
0.8752136, 0.194866, 2.296982, 1, 1, 1, 1, 1,
0.8900918, 0.6799981, 1.007378, 1, 1, 1, 1, 1,
0.8916686, 2.138091, 0.3359642, 0, 0, 1, 1, 1,
0.8943226, 0.2440812, -0.6558612, 1, 0, 0, 1, 1,
0.9073904, -2.190652, 3.320426, 1, 0, 0, 1, 1,
0.9083102, 0.1427133, -0.684719, 1, 0, 0, 1, 1,
0.9087718, 0.3193455, 2.279672, 1, 0, 0, 1, 1,
0.9206325, -0.9260225, 2.045428, 1, 0, 0, 1, 1,
0.9214557, 1.317357, -1.462603, 0, 0, 0, 1, 1,
0.9246256, -0.3494092, 1.923624, 0, 0, 0, 1, 1,
0.9260734, 1.097339, -0.3349902, 0, 0, 0, 1, 1,
0.9309485, 0.1047667, 2.228018, 0, 0, 0, 1, 1,
0.9346328, 1.642554, -0.05519716, 0, 0, 0, 1, 1,
0.9394797, -0.3491564, 1.298368, 0, 0, 0, 1, 1,
0.940922, 0.648029, -1.269549, 0, 0, 0, 1, 1,
0.9414201, -2.034948, 2.505493, 1, 1, 1, 1, 1,
0.943249, 1.477921, -1.112059, 1, 1, 1, 1, 1,
0.946808, 0.3083526, 0.563203, 1, 1, 1, 1, 1,
0.9560542, -0.1444764, 2.512608, 1, 1, 1, 1, 1,
0.957137, 0.9644561, 1.522833, 1, 1, 1, 1, 1,
0.9575614, -0.3603492, 1.648444, 1, 1, 1, 1, 1,
0.9591951, 0.9854687, 1.944472, 1, 1, 1, 1, 1,
0.9626964, 0.584112, 1.623236, 1, 1, 1, 1, 1,
0.964731, 1.810762, 0.07423422, 1, 1, 1, 1, 1,
0.9752994, 0.2510323, 2.180467, 1, 1, 1, 1, 1,
0.9758449, -0.9006973, 2.11825, 1, 1, 1, 1, 1,
0.9800157, -1.484868, 2.750924, 1, 1, 1, 1, 1,
0.9874425, 1.453167, -1.083071, 1, 1, 1, 1, 1,
0.9960877, 0.1807104, 1.611175, 1, 1, 1, 1, 1,
0.9980609, -0.576883, 3.603763, 1, 1, 1, 1, 1,
1.000413, -0.4069695, 0.006450306, 0, 0, 1, 1, 1,
1.001701, -0.5129699, 1.409454, 1, 0, 0, 1, 1,
1.002547, 0.8136409, 0.2439243, 1, 0, 0, 1, 1,
1.003922, -0.5692736, 2.713732, 1, 0, 0, 1, 1,
1.009453, -0.5462486, 3.261457, 1, 0, 0, 1, 1,
1.01596, 0.4985061, 1.609943, 1, 0, 0, 1, 1,
1.016545, -0.02591671, 1.220564, 0, 0, 0, 1, 1,
1.020222, -1.435793, 4.118243, 0, 0, 0, 1, 1,
1.021221, 1.473438, -0.2412538, 0, 0, 0, 1, 1,
1.02598, -0.4960852, 1.869918, 0, 0, 0, 1, 1,
1.030646, 0.3830676, 2.110584, 0, 0, 0, 1, 1,
1.035613, 0.4879708, 0.217982, 0, 0, 0, 1, 1,
1.037274, -0.9211464, 3.507239, 0, 0, 0, 1, 1,
1.051954, -1.0295, 2.041857, 1, 1, 1, 1, 1,
1.057453, -0.1049593, 2.021246, 1, 1, 1, 1, 1,
1.057849, -1.956237, 0.8325261, 1, 1, 1, 1, 1,
1.059838, 0.9449579, 3.385916, 1, 1, 1, 1, 1,
1.065932, 0.09220897, 1.321357, 1, 1, 1, 1, 1,
1.068549, 2.147953, -0.6071616, 1, 1, 1, 1, 1,
1.07164, -0.5420281, 1.458055, 1, 1, 1, 1, 1,
1.076574, -0.05139447, 2.477176, 1, 1, 1, 1, 1,
1.079281, -0.2112209, 1.765891, 1, 1, 1, 1, 1,
1.079598, 0.5342264, 0.8078766, 1, 1, 1, 1, 1,
1.083739, -0.9474477, 1.393863, 1, 1, 1, 1, 1,
1.085709, 1.112932, -0.7320261, 1, 1, 1, 1, 1,
1.087616, 0.8266748, 0.2904598, 1, 1, 1, 1, 1,
1.090144, -1.33198, 3.795915, 1, 1, 1, 1, 1,
1.09211, -0.1455181, 2.398306, 1, 1, 1, 1, 1,
1.098303, 1.284568, -1.042394, 0, 0, 1, 1, 1,
1.100624, -1.518259, 3.184339, 1, 0, 0, 1, 1,
1.105072, -0.6591419, 2.249882, 1, 0, 0, 1, 1,
1.121205, 0.2327949, 0.07230577, 1, 0, 0, 1, 1,
1.122834, 0.9629688, 1.717381, 1, 0, 0, 1, 1,
1.127023, -0.1913533, 2.795034, 1, 0, 0, 1, 1,
1.134187, 2.429211, -0.8134956, 0, 0, 0, 1, 1,
1.135084, -0.5758254, 1.277154, 0, 0, 0, 1, 1,
1.141039, -1.241743, 1.36841, 0, 0, 0, 1, 1,
1.144143, -1.659073, 0.9800804, 0, 0, 0, 1, 1,
1.168255, 1.129053, 2.025777, 0, 0, 0, 1, 1,
1.170065, 0.4641205, 0.2681231, 0, 0, 0, 1, 1,
1.174587, -0.08688524, 1.261192, 0, 0, 0, 1, 1,
1.176605, -1.265652, 1.497564, 1, 1, 1, 1, 1,
1.181022, -0.2362135, 1.985572, 1, 1, 1, 1, 1,
1.199776, -1.525248, 0.4262381, 1, 1, 1, 1, 1,
1.200504, 0.1764644, -1.304106, 1, 1, 1, 1, 1,
1.209213, 2.408548, 0.7492472, 1, 1, 1, 1, 1,
1.225482, 0.8908957, -0.4310009, 1, 1, 1, 1, 1,
1.235247, -1.007531, 2.061212, 1, 1, 1, 1, 1,
1.235409, -0.2336908, 0.09299198, 1, 1, 1, 1, 1,
1.238242, 0.5603843, 2.775794, 1, 1, 1, 1, 1,
1.247483, -1.107711, 2.41172, 1, 1, 1, 1, 1,
1.257091, -1.667844, 2.49414, 1, 1, 1, 1, 1,
1.258478, -0.1424593, 3.114051, 1, 1, 1, 1, 1,
1.262073, 0.397666, 3.107641, 1, 1, 1, 1, 1,
1.262773, -1.030629, 2.267775, 1, 1, 1, 1, 1,
1.264826, -0.7492583, 1.825703, 1, 1, 1, 1, 1,
1.268566, 1.089363, 0.2000644, 0, 0, 1, 1, 1,
1.269411, 1.291008, 0.3390322, 1, 0, 0, 1, 1,
1.273535, -0.00518804, 1.611707, 1, 0, 0, 1, 1,
1.280465, 0.8300786, 1.002012, 1, 0, 0, 1, 1,
1.28754, 0.9293712, 2.11654, 1, 0, 0, 1, 1,
1.300372, 2.223397, -0.7968132, 1, 0, 0, 1, 1,
1.303236, 0.3137441, 2.525228, 0, 0, 0, 1, 1,
1.320865, 0.7389474, 1.846348, 0, 0, 0, 1, 1,
1.323978, 0.6686786, 0.7591604, 0, 0, 0, 1, 1,
1.324457, 0.03860432, 1.418345, 0, 0, 0, 1, 1,
1.329227, 0.893998, 0.6714022, 0, 0, 0, 1, 1,
1.333602, 0.3163382, 1.021949, 0, 0, 0, 1, 1,
1.334786, -0.3059975, 1.523204, 0, 0, 0, 1, 1,
1.341252, 0.5999917, -0.3507557, 1, 1, 1, 1, 1,
1.347335, 1.013469, 0.4962593, 1, 1, 1, 1, 1,
1.366325, 0.7371958, 0.04533427, 1, 1, 1, 1, 1,
1.366952, -0.8198165, 3.162612, 1, 1, 1, 1, 1,
1.367468, -1.571984, 1.464604, 1, 1, 1, 1, 1,
1.371795, 0.4456932, 2.496082, 1, 1, 1, 1, 1,
1.374309, 0.3653712, 1.315596, 1, 1, 1, 1, 1,
1.376087, 2.327629, -0.3137929, 1, 1, 1, 1, 1,
1.377686, -1.096612, 4.178524, 1, 1, 1, 1, 1,
1.386601, 0.6000206, 1.327379, 1, 1, 1, 1, 1,
1.410595, 0.6535106, 1.234541, 1, 1, 1, 1, 1,
1.416217, -0.8843564, 3.385701, 1, 1, 1, 1, 1,
1.422943, -0.73925, 1.578032, 1, 1, 1, 1, 1,
1.428346, 0.37975, 2.577619, 1, 1, 1, 1, 1,
1.431643, 1.760692, 1.4839, 1, 1, 1, 1, 1,
1.432059, -0.3467155, 4.083745, 0, 0, 1, 1, 1,
1.438667, -0.6423674, 1.006613, 1, 0, 0, 1, 1,
1.442906, -0.107327, -0.8212855, 1, 0, 0, 1, 1,
1.447984, 2.514, 1.333914, 1, 0, 0, 1, 1,
1.45884, 1.242976, 1.158358, 1, 0, 0, 1, 1,
1.4602, 0.6575468, 1.050475, 1, 0, 0, 1, 1,
1.470672, 1.110634, 0.7470722, 0, 0, 0, 1, 1,
1.471003, 0.8458745, 0.1479831, 0, 0, 0, 1, 1,
1.474355, 0.4343038, 2.184911, 0, 0, 0, 1, 1,
1.48536, -0.06670752, 0.6294333, 0, 0, 0, 1, 1,
1.488123, -0.01819548, 1.352393, 0, 0, 0, 1, 1,
1.488165, 0.1182133, 1.465724, 0, 0, 0, 1, 1,
1.490251, -0.2234549, 3.430449, 0, 0, 0, 1, 1,
1.511596, 0.4886304, -0.6100503, 1, 1, 1, 1, 1,
1.516019, 0.4362764, 3.951228, 1, 1, 1, 1, 1,
1.523508, -0.6043407, -0.4697881, 1, 1, 1, 1, 1,
1.530883, -1.065805, 1.498554, 1, 1, 1, 1, 1,
1.531824, -1.546584, 2.415392, 1, 1, 1, 1, 1,
1.539886, 0.6198886, -0.3607077, 1, 1, 1, 1, 1,
1.554633, -0.5431736, 0.8199369, 1, 1, 1, 1, 1,
1.562267, 0.1919967, 0.3998185, 1, 1, 1, 1, 1,
1.566531, 1.299313, 1.322971, 1, 1, 1, 1, 1,
1.569272, -1.241649, 3.042612, 1, 1, 1, 1, 1,
1.570264, -0.7932395, 1.418145, 1, 1, 1, 1, 1,
1.576153, -0.3881478, 2.99975, 1, 1, 1, 1, 1,
1.576667, -0.2759771, 2.235692, 1, 1, 1, 1, 1,
1.610111, 1.090767, 1.491984, 1, 1, 1, 1, 1,
1.610862, 0.2989556, 2.991779, 1, 1, 1, 1, 1,
1.621081, -0.2172975, 0.7802314, 0, 0, 1, 1, 1,
1.621483, 0.04334442, 0.9561374, 1, 0, 0, 1, 1,
1.624001, -0.1554713, 1.149265, 1, 0, 0, 1, 1,
1.637402, 0.62889, 1.657243, 1, 0, 0, 1, 1,
1.649913, -0.3774209, 0.9805958, 1, 0, 0, 1, 1,
1.64997, 0.02170851, 1.133259, 1, 0, 0, 1, 1,
1.66231, -1.244614, 3.659967, 0, 0, 0, 1, 1,
1.6661, 0.08375455, 1.114094, 0, 0, 0, 1, 1,
1.666529, -0.008781327, 2.119658, 0, 0, 0, 1, 1,
1.67488, -2.005716, 2.060508, 0, 0, 0, 1, 1,
1.679847, -1.55133, 2.886449, 0, 0, 0, 1, 1,
1.686234, -0.8791911, 2.771234, 0, 0, 0, 1, 1,
1.718245, 0.7222139, 1.167599, 0, 0, 0, 1, 1,
1.728483, -0.4995821, 3.380326, 1, 1, 1, 1, 1,
1.747552, 0.3641643, 1.472974, 1, 1, 1, 1, 1,
1.748358, 0.6801518, 2.714202, 1, 1, 1, 1, 1,
1.753815, -1.177482, 2.307221, 1, 1, 1, 1, 1,
1.754755, -0.1869584, 5.21557, 1, 1, 1, 1, 1,
1.771548, 0.7378309, 1.269556, 1, 1, 1, 1, 1,
1.777798, -0.918721, 2.39793, 1, 1, 1, 1, 1,
1.78815, 0.6417594, 1.774845, 1, 1, 1, 1, 1,
1.788363, 0.3623157, 0.3334794, 1, 1, 1, 1, 1,
1.789631, -0.02748475, 2.766956, 1, 1, 1, 1, 1,
1.798691, -1.136401, 2.974691, 1, 1, 1, 1, 1,
1.830263, 1.403054, 1.514594, 1, 1, 1, 1, 1,
1.835438, -0.6375906, 0.9214508, 1, 1, 1, 1, 1,
1.872819, 0.4573988, -0.6176246, 1, 1, 1, 1, 1,
1.946707, -0.2003436, 2.791863, 1, 1, 1, 1, 1,
1.967788, -0.09746384, -0.03006138, 0, 0, 1, 1, 1,
1.979465, 0.6685668, 3.230616, 1, 0, 0, 1, 1,
1.980077, -0.8566958, 0.2167778, 1, 0, 0, 1, 1,
1.996385, 0.7613459, 0.05813079, 1, 0, 0, 1, 1,
2.008713, -1.135631, 1.132881, 1, 0, 0, 1, 1,
2.041142, -0.9883052, 3.3535, 1, 0, 0, 1, 1,
2.047506, -0.6726442, 1.931792, 0, 0, 0, 1, 1,
2.058331, 0.06003891, 1.875539, 0, 0, 0, 1, 1,
2.169849, 0.7329577, 1.84598, 0, 0, 0, 1, 1,
2.196912, -0.1070418, 1.996237, 0, 0, 0, 1, 1,
2.212883, 0.5246996, 0.4655343, 0, 0, 0, 1, 1,
2.234548, 0.1206074, 1.401977, 0, 0, 0, 1, 1,
2.316221, -0.3810064, 1.054281, 0, 0, 0, 1, 1,
2.364026, 0.08417313, 3.757763, 1, 1, 1, 1, 1,
2.367167, 0.8447348, 0.5029877, 1, 1, 1, 1, 1,
2.385224, -0.1401085, 1.035479, 1, 1, 1, 1, 1,
2.415959, 1.238942, 0.2261313, 1, 1, 1, 1, 1,
2.490884, 0.221768, 1.402915, 1, 1, 1, 1, 1,
2.573328, -1.919118, 2.877452, 1, 1, 1, 1, 1,
3.000875, 0.04938172, 1.538045, 1, 1, 1, 1, 1
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
var radius = 9.486225;
var distance = 33.31997;
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
mvMatrix.translate( 0.01828861, -0.01874197, -0.04314685 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.31997);
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