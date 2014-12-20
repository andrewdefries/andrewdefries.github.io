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
-3.252459, 0.4064896, -2.139488, 1, 0, 0, 1,
-2.723656, 0.8107091, -2.577017, 1, 0.007843138, 0, 1,
-2.408737, -0.7947305, -1.641521, 1, 0.01176471, 0, 1,
-2.403644, 0.7898995, -1.117002, 1, 0.01960784, 0, 1,
-2.26192, -0.1938775, -2.820975, 1, 0.02352941, 0, 1,
-2.258634, 0.07366911, -1.679954, 1, 0.03137255, 0, 1,
-2.258072, -0.4441713, -0.7487044, 1, 0.03529412, 0, 1,
-2.247381, 0.6884903, -2.684045, 1, 0.04313726, 0, 1,
-2.165619, -1.32393, -2.507806, 1, 0.04705882, 0, 1,
-2.072338, -0.2080076, -1.141028, 1, 0.05490196, 0, 1,
-2.015952, -0.9028308, -1.911225, 1, 0.05882353, 0, 1,
-1.983985, 0.5578099, -0.5599431, 1, 0.06666667, 0, 1,
-1.952903, 1.603645, 0.05554424, 1, 0.07058824, 0, 1,
-1.94901, 1.813866, -0.4563862, 1, 0.07843138, 0, 1,
-1.9488, -0.7823502, -2.671575, 1, 0.08235294, 0, 1,
-1.9479, 0.4403175, -1.337354, 1, 0.09019608, 0, 1,
-1.930633, -1.496112, -1.680692, 1, 0.09411765, 0, 1,
-1.926235, -0.3545465, -0.806643, 1, 0.1019608, 0, 1,
-1.874586, 0.1256479, 0.520813, 1, 0.1098039, 0, 1,
-1.853691, -1.250388, -2.171933, 1, 0.1137255, 0, 1,
-1.850689, 1.831414, -0.2289364, 1, 0.1215686, 0, 1,
-1.848469, 1.342994, -1.059398, 1, 0.1254902, 0, 1,
-1.838581, 1.478145, -1.564317, 1, 0.1333333, 0, 1,
-1.830706, -0.0903931, -2.620809, 1, 0.1372549, 0, 1,
-1.792953, 0.6395474, -0.7836009, 1, 0.145098, 0, 1,
-1.780484, -0.3503358, -2.531293, 1, 0.1490196, 0, 1,
-1.774637, 0.2747155, -1.980469, 1, 0.1568628, 0, 1,
-1.768295, -0.553887, -3.006875, 1, 0.1607843, 0, 1,
-1.756219, -0.8475991, -1.533573, 1, 0.1686275, 0, 1,
-1.742219, 0.1521615, -1.80479, 1, 0.172549, 0, 1,
-1.727836, 0.6201112, -3.228026, 1, 0.1803922, 0, 1,
-1.725313, -1.52496, -1.286003, 1, 0.1843137, 0, 1,
-1.712238, 0.3366069, -0.6536925, 1, 0.1921569, 0, 1,
-1.707695, 0.2945437, -1.887558, 1, 0.1960784, 0, 1,
-1.702156, -2.257334, -2.457761, 1, 0.2039216, 0, 1,
-1.695525, 2.297597, -0.7692767, 1, 0.2117647, 0, 1,
-1.676008, 1.656545, -1.889074, 1, 0.2156863, 0, 1,
-1.672382, -0.7872332, -1.62745, 1, 0.2235294, 0, 1,
-1.671499, 1.811551, -1.86961, 1, 0.227451, 0, 1,
-1.670418, -0.9171691, -1.54774, 1, 0.2352941, 0, 1,
-1.668593, 0.5781714, -0.5129421, 1, 0.2392157, 0, 1,
-1.662444, -0.2218564, -2.642205, 1, 0.2470588, 0, 1,
-1.657827, 1.184542, -1.113551, 1, 0.2509804, 0, 1,
-1.657713, 1.395664, -1.310707, 1, 0.2588235, 0, 1,
-1.656876, 2.388285, -1.188251, 1, 0.2627451, 0, 1,
-1.640545, -1.19333, -0.9350967, 1, 0.2705882, 0, 1,
-1.626096, 1.198962, -0.1717616, 1, 0.2745098, 0, 1,
-1.577103, -1.299008, -1.185904, 1, 0.282353, 0, 1,
-1.57101, -1.533035, -2.88503, 1, 0.2862745, 0, 1,
-1.570728, -1.199567, -2.41825, 1, 0.2941177, 0, 1,
-1.552661, 1.113814, -1.123142, 1, 0.3019608, 0, 1,
-1.551079, -0.7468776, -2.85399, 1, 0.3058824, 0, 1,
-1.549587, -0.02425166, -3.131384, 1, 0.3137255, 0, 1,
-1.546137, -0.426418, -1.520935, 1, 0.3176471, 0, 1,
-1.539512, -0.3053651, -1.799724, 1, 0.3254902, 0, 1,
-1.529129, -0.03623993, -2.901299, 1, 0.3294118, 0, 1,
-1.52428, 1.575417, -0.2814944, 1, 0.3372549, 0, 1,
-1.516626, 0.2052404, -1.16597, 1, 0.3411765, 0, 1,
-1.511579, -1.68153, -2.798711, 1, 0.3490196, 0, 1,
-1.49892, -1.71922, -3.539024, 1, 0.3529412, 0, 1,
-1.496669, -0.01457612, -1.84142, 1, 0.3607843, 0, 1,
-1.490031, 0.7554781, -1.309488, 1, 0.3647059, 0, 1,
-1.46639, -0.2825885, -1.89503, 1, 0.372549, 0, 1,
-1.444591, 2.081956, -1.258359, 1, 0.3764706, 0, 1,
-1.444452, -1.463198, -1.958958, 1, 0.3843137, 0, 1,
-1.436219, 0.1399349, -1.982394, 1, 0.3882353, 0, 1,
-1.430716, -0.7804508, -2.294145, 1, 0.3960784, 0, 1,
-1.422649, 0.1429285, -2.365776, 1, 0.4039216, 0, 1,
-1.412962, 0.5875944, -2.1329, 1, 0.4078431, 0, 1,
-1.408625, -1.297967, -4.003134, 1, 0.4156863, 0, 1,
-1.405091, 1.716326, -0.7527456, 1, 0.4196078, 0, 1,
-1.403653, 0.2162197, -1.371014, 1, 0.427451, 0, 1,
-1.392364, -1.128946, -0.879354, 1, 0.4313726, 0, 1,
-1.385922, -0.1858743, -2.052905, 1, 0.4392157, 0, 1,
-1.376099, 1.235449, -1.273995, 1, 0.4431373, 0, 1,
-1.373715, -1.425194, -1.993061, 1, 0.4509804, 0, 1,
-1.354628, -1.354005, -1.967267, 1, 0.454902, 0, 1,
-1.339692, -0.6012728, -2.354762, 1, 0.4627451, 0, 1,
-1.331452, 0.2385964, -1.160729, 1, 0.4666667, 0, 1,
-1.328331, -0.2440464, -2.365955, 1, 0.4745098, 0, 1,
-1.322962, -1.34043, -2.27713, 1, 0.4784314, 0, 1,
-1.310441, 0.179533, -1.276879, 1, 0.4862745, 0, 1,
-1.30363, 1.417788, -0.6824509, 1, 0.4901961, 0, 1,
-1.29554, 0.5281187, 0.1027408, 1, 0.4980392, 0, 1,
-1.2934, -0.3341212, -0.8985107, 1, 0.5058824, 0, 1,
-1.292212, 0.9759436, -0.7099054, 1, 0.509804, 0, 1,
-1.29057, 1.022433, -0.8100327, 1, 0.5176471, 0, 1,
-1.279841, 0.2424127, -0.974503, 1, 0.5215687, 0, 1,
-1.275154, 0.2418496, -1.560737, 1, 0.5294118, 0, 1,
-1.274121, -0.7518424, -2.260183, 1, 0.5333334, 0, 1,
-1.27166, -0.9149712, -2.127605, 1, 0.5411765, 0, 1,
-1.269133, -0.2047843, -3.023761, 1, 0.5450981, 0, 1,
-1.267691, 0.798453, -1.715743, 1, 0.5529412, 0, 1,
-1.26483, 1.032498, 0.454507, 1, 0.5568628, 0, 1,
-1.264426, 0.1442851, -1.733356, 1, 0.5647059, 0, 1,
-1.263981, 0.6847025, -1.395139, 1, 0.5686275, 0, 1,
-1.2538, -1.919975, -4.249563, 1, 0.5764706, 0, 1,
-1.253258, -1.106629, -2.351424, 1, 0.5803922, 0, 1,
-1.250694, 0.360269, -1.033054, 1, 0.5882353, 0, 1,
-1.248929, -0.5308015, -2.808873, 1, 0.5921569, 0, 1,
-1.243719, 0.6387593, 0.9049737, 1, 0.6, 0, 1,
-1.24247, 1.307611, 0.6671579, 1, 0.6078432, 0, 1,
-1.235371, -1.135646, -1.768439, 1, 0.6117647, 0, 1,
-1.230134, -1.650621, -5.000113, 1, 0.6196079, 0, 1,
-1.226402, 1.564368, -0.274913, 1, 0.6235294, 0, 1,
-1.217883, 0.8039153, -0.6420447, 1, 0.6313726, 0, 1,
-1.215127, -1.278939, -2.04404, 1, 0.6352941, 0, 1,
-1.209015, 0.2850168, -0.8857709, 1, 0.6431373, 0, 1,
-1.201083, 0.1919324, -0.7023348, 1, 0.6470588, 0, 1,
-1.200984, -0.2200707, -4.570865, 1, 0.654902, 0, 1,
-1.199972, -1.720041, -2.542967, 1, 0.6588235, 0, 1,
-1.175935, -0.7785338, -2.230655, 1, 0.6666667, 0, 1,
-1.173685, 1.391716, -1.668303, 1, 0.6705883, 0, 1,
-1.168455, 0.2287038, -0.7515299, 1, 0.6784314, 0, 1,
-1.166862, -0.2932597, -1.821851, 1, 0.682353, 0, 1,
-1.166133, -0.1275775, -2.005207, 1, 0.6901961, 0, 1,
-1.152072, -0.9714539, -3.668188, 1, 0.6941177, 0, 1,
-1.150569, 0.9083454, -1.714027, 1, 0.7019608, 0, 1,
-1.149898, -0.488759, -1.098216, 1, 0.7098039, 0, 1,
-1.14974, -0.9337457, -2.878343, 1, 0.7137255, 0, 1,
-1.145085, -0.2394006, -1.903884, 1, 0.7215686, 0, 1,
-1.14009, -1.170706, -2.932926, 1, 0.7254902, 0, 1,
-1.135967, -0.1608534, -1.12849, 1, 0.7333333, 0, 1,
-1.128237, -2.580772, -4.969282, 1, 0.7372549, 0, 1,
-1.126278, 0.7445521, -0.1438154, 1, 0.7450981, 0, 1,
-1.117529, 0.6425477, 0.4617165, 1, 0.7490196, 0, 1,
-1.11575, 2.795933, -0.7009721, 1, 0.7568628, 0, 1,
-1.10612, -0.5591249, -1.484642, 1, 0.7607843, 0, 1,
-1.105065, 0.2169775, -1.501864, 1, 0.7686275, 0, 1,
-1.095563, -0.660922, -2.674638, 1, 0.772549, 0, 1,
-1.094189, 0.9592335, 0.1206309, 1, 0.7803922, 0, 1,
-1.093255, -0.4300187, -2.578851, 1, 0.7843137, 0, 1,
-1.084486, 0.6655146, -3.023041, 1, 0.7921569, 0, 1,
-1.07141, -1.204732, -0.7662835, 1, 0.7960784, 0, 1,
-1.057503, 0.7115456, -1.488302, 1, 0.8039216, 0, 1,
-1.054713, -0.3518346, -3.130454, 1, 0.8117647, 0, 1,
-1.046222, 0.8182264, -0.3578226, 1, 0.8156863, 0, 1,
-1.045382, 1.759751, -2.247271, 1, 0.8235294, 0, 1,
-1.036655, -0.7382249, -2.931412, 1, 0.827451, 0, 1,
-1.034466, 0.3416907, -0.9065399, 1, 0.8352941, 0, 1,
-1.033228, -0.6036501, -2.5929, 1, 0.8392157, 0, 1,
-1.030916, -0.4551378, -2.354578, 1, 0.8470588, 0, 1,
-1.021805, 1.651152, -1.182746, 1, 0.8509804, 0, 1,
-1.013282, -0.6558498, -2.232613, 1, 0.8588235, 0, 1,
-1.009632, -0.09049103, -1.743725, 1, 0.8627451, 0, 1,
-1.006601, 1.204514, 0.1112521, 1, 0.8705882, 0, 1,
-1.005865, -1.149945, -1.317747, 1, 0.8745098, 0, 1,
-1.001254, -0.1301761, -0.4675878, 1, 0.8823529, 0, 1,
-1.001158, -0.1034465, -2.489722, 1, 0.8862745, 0, 1,
-0.9982308, -0.07367644, -2.370415, 1, 0.8941177, 0, 1,
-0.9980001, 0.3852564, -0.6213885, 1, 0.8980392, 0, 1,
-0.9913476, -0.1990853, -1.553191, 1, 0.9058824, 0, 1,
-0.9909555, -1.210361, -2.43358, 1, 0.9137255, 0, 1,
-0.9898798, 0.1985096, -2.404809, 1, 0.9176471, 0, 1,
-0.9889769, 1.045426, 0.4666503, 1, 0.9254902, 0, 1,
-0.9857494, 0.7453755, -1.309118, 1, 0.9294118, 0, 1,
-0.9842631, -0.363126, -0.8197183, 1, 0.9372549, 0, 1,
-0.9837453, -1.352346, -1.236308, 1, 0.9411765, 0, 1,
-0.9789208, -1.697355, -2.188701, 1, 0.9490196, 0, 1,
-0.9714934, 0.9178536, -0.4965203, 1, 0.9529412, 0, 1,
-0.9643849, 0.9027522, -1.574546, 1, 0.9607843, 0, 1,
-0.9594809, 0.8086751, -0.2687535, 1, 0.9647059, 0, 1,
-0.9593192, 0.2496307, 0.8200213, 1, 0.972549, 0, 1,
-0.9562331, 0.3396707, -0.6700848, 1, 0.9764706, 0, 1,
-0.9530961, 3.415766, -0.490194, 1, 0.9843137, 0, 1,
-0.9421769, 0.7959239, 0.13397, 1, 0.9882353, 0, 1,
-0.93082, -1.839182, -2.703329, 1, 0.9960784, 0, 1,
-0.9169351, -0.5513672, -2.80625, 0.9960784, 1, 0, 1,
-0.916467, -0.7841113, -3.32089, 0.9921569, 1, 0, 1,
-0.9124489, -0.4932486, -3.481406, 0.9843137, 1, 0, 1,
-0.9088968, -0.3259888, -2.063401, 0.9803922, 1, 0, 1,
-0.9028897, 0.09628901, -1.348727, 0.972549, 1, 0, 1,
-0.9021177, -1.967098, -4.602699, 0.9686275, 1, 0, 1,
-0.899943, 0.1326762, -1.040033, 0.9607843, 1, 0, 1,
-0.8918183, -0.2323796, -0.8238814, 0.9568627, 1, 0, 1,
-0.8858942, -0.173943, -2.790878, 0.9490196, 1, 0, 1,
-0.8802559, 0.7953636, -0.3830996, 0.945098, 1, 0, 1,
-0.8760326, -2.31633, -3.870046, 0.9372549, 1, 0, 1,
-0.8725887, -0.7862242, -2.586524, 0.9333333, 1, 0, 1,
-0.8723216, -0.4599916, -2.015119, 0.9254902, 1, 0, 1,
-0.8718305, 0.09124728, -2.563173, 0.9215686, 1, 0, 1,
-0.8702739, 0.9191028, -0.1887223, 0.9137255, 1, 0, 1,
-0.8700482, -1.027398, -1.749001, 0.9098039, 1, 0, 1,
-0.8652864, 1.374687, -0.6682826, 0.9019608, 1, 0, 1,
-0.8618997, -1.167487, -2.742173, 0.8941177, 1, 0, 1,
-0.8533435, -0.008818973, -1.476533, 0.8901961, 1, 0, 1,
-0.8482898, -0.0633299, -1.608271, 0.8823529, 1, 0, 1,
-0.8470264, 0.4845217, -0.7698444, 0.8784314, 1, 0, 1,
-0.8416338, -0.3431276, -1.843029, 0.8705882, 1, 0, 1,
-0.8407866, 1.013927, -2.239438, 0.8666667, 1, 0, 1,
-0.836315, -1.659432, -1.97012, 0.8588235, 1, 0, 1,
-0.8352939, -0.201428, -3.022522, 0.854902, 1, 0, 1,
-0.8340808, 0.570438, 0.7207747, 0.8470588, 1, 0, 1,
-0.8318548, -1.369241, -3.847349, 0.8431373, 1, 0, 1,
-0.8301368, 1.02073, -2.4606, 0.8352941, 1, 0, 1,
-0.8241726, -1.730391, -1.820441, 0.8313726, 1, 0, 1,
-0.8201074, 1.309149, -0.1806564, 0.8235294, 1, 0, 1,
-0.817593, -1.748862, -1.991044, 0.8196079, 1, 0, 1,
-0.814114, -1.840197, -4.234413, 0.8117647, 1, 0, 1,
-0.8136297, 0.6330824, -1.366627, 0.8078431, 1, 0, 1,
-0.8135324, -0.2166914, -1.005162, 0.8, 1, 0, 1,
-0.8111945, 0.9891164, -1.212094, 0.7921569, 1, 0, 1,
-0.8093231, 0.6097599, -1.63825, 0.7882353, 1, 0, 1,
-0.8031413, 1.485455, 0.06792311, 0.7803922, 1, 0, 1,
-0.8020001, -1.522443, -2.886501, 0.7764706, 1, 0, 1,
-0.8001308, 1.193939, -0.9031303, 0.7686275, 1, 0, 1,
-0.7989001, -0.1513549, -1.889565, 0.7647059, 1, 0, 1,
-0.7971832, 0.6428679, -0.7563384, 0.7568628, 1, 0, 1,
-0.79601, 1.456477, -0.7401583, 0.7529412, 1, 0, 1,
-0.7914101, 1.356885, -0.7213482, 0.7450981, 1, 0, 1,
-0.7878503, 0.7897581, -0.03197543, 0.7411765, 1, 0, 1,
-0.7788771, 0.9736289, -0.8519844, 0.7333333, 1, 0, 1,
-0.7745446, 0.1210404, -1.781435, 0.7294118, 1, 0, 1,
-0.772646, -0.2444253, -2.129429, 0.7215686, 1, 0, 1,
-0.7689468, 0.2654822, -1.484686, 0.7176471, 1, 0, 1,
-0.7675553, 0.90088, 1.526667, 0.7098039, 1, 0, 1,
-0.7626548, -0.7496186, -4.283256, 0.7058824, 1, 0, 1,
-0.7545316, 0.613185, -0.9342095, 0.6980392, 1, 0, 1,
-0.7533944, 0.645252, 0.002860284, 0.6901961, 1, 0, 1,
-0.7532057, 1.520869, 0.3918642, 0.6862745, 1, 0, 1,
-0.7417331, 0.3654663, -1.363774, 0.6784314, 1, 0, 1,
-0.7386416, -1.035734, -2.114813, 0.6745098, 1, 0, 1,
-0.7371097, 0.6760271, 0.6738707, 0.6666667, 1, 0, 1,
-0.7311033, 1.279302, 0.5463101, 0.6627451, 1, 0, 1,
-0.72908, 0.6200731, -0.2243495, 0.654902, 1, 0, 1,
-0.7138456, -0.1469509, -1.034108, 0.6509804, 1, 0, 1,
-0.7117392, 1.214668, -0.4049159, 0.6431373, 1, 0, 1,
-0.7107322, -0.3651446, -3.690709, 0.6392157, 1, 0, 1,
-0.7097702, 2.136031, -1.711908, 0.6313726, 1, 0, 1,
-0.709749, -1.906425, -2.100169, 0.627451, 1, 0, 1,
-0.7079236, 0.5827852, -0.2191134, 0.6196079, 1, 0, 1,
-0.7073442, -1.180373, -1.530407, 0.6156863, 1, 0, 1,
-0.7067873, 0.3121713, -0.4653139, 0.6078432, 1, 0, 1,
-0.7032884, 0.3213095, -1.220162, 0.6039216, 1, 0, 1,
-0.6982651, 0.5409115, -0.6220747, 0.5960785, 1, 0, 1,
-0.6911603, 1.968709, -0.4237364, 0.5882353, 1, 0, 1,
-0.69088, 0.5260602, -0.4910086, 0.5843138, 1, 0, 1,
-0.6827722, 0.8257049, -0.3875696, 0.5764706, 1, 0, 1,
-0.6775489, -0.06948157, -2.088566, 0.572549, 1, 0, 1,
-0.6690777, 0.2771615, -0.9575362, 0.5647059, 1, 0, 1,
-0.6680473, 0.8964414, -1.435911, 0.5607843, 1, 0, 1,
-0.6638047, -0.733292, -3.101646, 0.5529412, 1, 0, 1,
-0.6618943, -0.9596646, -1.563464, 0.5490196, 1, 0, 1,
-0.6564212, 1.523926, -1.288954, 0.5411765, 1, 0, 1,
-0.6561361, 0.9747281, -0.738887, 0.5372549, 1, 0, 1,
-0.655033, 1.479142, 0.5725467, 0.5294118, 1, 0, 1,
-0.655022, 0.1579432, -1.774137, 0.5254902, 1, 0, 1,
-0.6545112, -0.1830188, -0.6016113, 0.5176471, 1, 0, 1,
-0.6494374, -0.1940107, -1.949809, 0.5137255, 1, 0, 1,
-0.649193, -0.6320482, -2.521806, 0.5058824, 1, 0, 1,
-0.6462661, 1.456467, -0.8799897, 0.5019608, 1, 0, 1,
-0.6412293, 0.1419599, -2.286827, 0.4941176, 1, 0, 1,
-0.6394674, -0.09515275, -2.354556, 0.4862745, 1, 0, 1,
-0.6331969, -0.07074294, 1.741861, 0.4823529, 1, 0, 1,
-0.632656, -0.9410364, -1.303645, 0.4745098, 1, 0, 1,
-0.6305426, 0.009729765, -2.337945, 0.4705882, 1, 0, 1,
-0.6294751, 1.40736, -0.07135209, 0.4627451, 1, 0, 1,
-0.6279896, -1.0348, -3.073064, 0.4588235, 1, 0, 1,
-0.6239287, 0.8650969, -2.039362, 0.4509804, 1, 0, 1,
-0.6204562, -1.54682, -2.130961, 0.4470588, 1, 0, 1,
-0.6104389, -0.3711387, -3.404481, 0.4392157, 1, 0, 1,
-0.6094266, -2.697001, -3.9292, 0.4352941, 1, 0, 1,
-0.6073363, -1.69073, -3.202154, 0.427451, 1, 0, 1,
-0.598698, 0.3978086, 0.06842269, 0.4235294, 1, 0, 1,
-0.5966156, -0.641418, -2.033303, 0.4156863, 1, 0, 1,
-0.5951641, -0.5556404, -3.29832, 0.4117647, 1, 0, 1,
-0.594936, 1.413274, -0.1971247, 0.4039216, 1, 0, 1,
-0.5933095, -0.5962778, 0.5699559, 0.3960784, 1, 0, 1,
-0.5855993, 1.631122, 1.136949, 0.3921569, 1, 0, 1,
-0.5803136, 0.2168379, -2.327046, 0.3843137, 1, 0, 1,
-0.5767305, 2.976485, 0.6364955, 0.3803922, 1, 0, 1,
-0.5697779, -0.2551098, -3.046256, 0.372549, 1, 0, 1,
-0.563558, 0.9802474, -1.843251, 0.3686275, 1, 0, 1,
-0.5626884, -1.765378, -1.967702, 0.3607843, 1, 0, 1,
-0.5599834, 0.1490283, -0.5779146, 0.3568628, 1, 0, 1,
-0.5596387, 0.03030163, -2.102133, 0.3490196, 1, 0, 1,
-0.5550804, -0.8422692, -2.428104, 0.345098, 1, 0, 1,
-0.5533363, -0.943727, -1.864453, 0.3372549, 1, 0, 1,
-0.553318, 0.2287645, -2.229519, 0.3333333, 1, 0, 1,
-0.5523146, 0.1312886, -3.245204, 0.3254902, 1, 0, 1,
-0.5458806, -0.3995518, -1.879241, 0.3215686, 1, 0, 1,
-0.5432394, 1.489127, -0.9320338, 0.3137255, 1, 0, 1,
-0.5368711, 0.3842408, -2.235525, 0.3098039, 1, 0, 1,
-0.532503, 1.08736, -1.366854, 0.3019608, 1, 0, 1,
-0.525902, -2.84978, -3.472541, 0.2941177, 1, 0, 1,
-0.5254742, -0.04972285, -2.70207, 0.2901961, 1, 0, 1,
-0.5222119, -2.587862, -1.435955, 0.282353, 1, 0, 1,
-0.5199429, 1.524431, -0.602268, 0.2784314, 1, 0, 1,
-0.5160908, 1.008504, -2.740484, 0.2705882, 1, 0, 1,
-0.5157354, 0.09928618, -2.477582, 0.2666667, 1, 0, 1,
-0.513379, -0.3573896, -1.570961, 0.2588235, 1, 0, 1,
-0.5131937, 0.5543045, 1.5194, 0.254902, 1, 0, 1,
-0.5074909, -1.02468, -1.64336, 0.2470588, 1, 0, 1,
-0.5037092, -0.1130167, -1.394217, 0.2431373, 1, 0, 1,
-0.5008259, 0.930035, -0.6756774, 0.2352941, 1, 0, 1,
-0.498338, -0.03547332, -2.098679, 0.2313726, 1, 0, 1,
-0.4975379, 1.918865, 1.013103, 0.2235294, 1, 0, 1,
-0.4956795, 0.9296918, -0.9795657, 0.2196078, 1, 0, 1,
-0.4863827, 0.2757913, -0.9388518, 0.2117647, 1, 0, 1,
-0.4863092, 0.4532027, -0.424794, 0.2078431, 1, 0, 1,
-0.4837551, 1.013935, -2.660496, 0.2, 1, 0, 1,
-0.474973, -0.1834205, -2.628721, 0.1921569, 1, 0, 1,
-0.4743065, -0.4586766, -3.9213, 0.1882353, 1, 0, 1,
-0.4710462, -1.242738, -4.089108, 0.1803922, 1, 0, 1,
-0.4676626, -0.2041021, -1.970814, 0.1764706, 1, 0, 1,
-0.4673027, -0.5428113, -3.069387, 0.1686275, 1, 0, 1,
-0.4641472, -0.8547232, -3.437936, 0.1647059, 1, 0, 1,
-0.4619614, 1.213896, 0.7299904, 0.1568628, 1, 0, 1,
-0.460686, -0.05079015, -2.693102, 0.1529412, 1, 0, 1,
-0.4598168, -0.1295627, -1.374452, 0.145098, 1, 0, 1,
-0.4576302, -2.489116, -3.548816, 0.1411765, 1, 0, 1,
-0.4549732, 1.031181, 1.478583, 0.1333333, 1, 0, 1,
-0.4540225, -1.560472, -1.787977, 0.1294118, 1, 0, 1,
-0.4504829, -0.4095712, -2.435839, 0.1215686, 1, 0, 1,
-0.4482961, 1.480782, -0.8186259, 0.1176471, 1, 0, 1,
-0.4418864, 0.928431, 0.2570553, 0.1098039, 1, 0, 1,
-0.4417481, 2.153584, -0.439308, 0.1058824, 1, 0, 1,
-0.4394755, -0.1744904, -3.424579, 0.09803922, 1, 0, 1,
-0.4310809, 1.197414, -0.2626404, 0.09019608, 1, 0, 1,
-0.4281287, 0.579541, -0.6006585, 0.08627451, 1, 0, 1,
-0.4223536, 0.3253743, -1.049893, 0.07843138, 1, 0, 1,
-0.4155955, -0.9858485, -4.87783, 0.07450981, 1, 0, 1,
-0.4155754, -0.2902455, 0.2112148, 0.06666667, 1, 0, 1,
-0.4112843, 0.007469818, -2.119716, 0.0627451, 1, 0, 1,
-0.4090614, 0.633845, 0.102651, 0.05490196, 1, 0, 1,
-0.4073494, 1.438561, -0.9293231, 0.05098039, 1, 0, 1,
-0.4067549, 0.7443072, -1.976379, 0.04313726, 1, 0, 1,
-0.4065555, -1.635441, -3.096988, 0.03921569, 1, 0, 1,
-0.4063227, 1.540478, -0.9319853, 0.03137255, 1, 0, 1,
-0.4060478, -1.369703, -4.002238, 0.02745098, 1, 0, 1,
-0.4051319, -0.9920479, -3.361735, 0.01960784, 1, 0, 1,
-0.4016342, 2.574804, -1.249839, 0.01568628, 1, 0, 1,
-0.3998308, 1.326617, -0.2863345, 0.007843138, 1, 0, 1,
-0.3965848, -0.6498268, -1.424727, 0.003921569, 1, 0, 1,
-0.3911302, -0.8008384, -4.768321, 0, 1, 0.003921569, 1,
-0.3898781, -0.9888884, -1.954813, 0, 1, 0.01176471, 1,
-0.3885548, -0.7154069, -1.134804, 0, 1, 0.01568628, 1,
-0.3832427, 0.4470802, -0.9085779, 0, 1, 0.02352941, 1,
-0.3812767, -0.1572319, -1.639694, 0, 1, 0.02745098, 1,
-0.3810682, -1.76501, -3.813946, 0, 1, 0.03529412, 1,
-0.3798005, 0.7184686, -0.1920198, 0, 1, 0.03921569, 1,
-0.378021, -0.0798852, -0.09806875, 0, 1, 0.04705882, 1,
-0.3771363, 1.218874, -1.067869, 0, 1, 0.05098039, 1,
-0.3765217, -0.2995074, -1.310932, 0, 1, 0.05882353, 1,
-0.3757759, -0.9795412, -1.587927, 0, 1, 0.0627451, 1,
-0.3752538, 0.5560993, -3.00721, 0, 1, 0.07058824, 1,
-0.3748949, 2.362191, -0.08961634, 0, 1, 0.07450981, 1,
-0.3696178, 1.269098, -0.9760329, 0, 1, 0.08235294, 1,
-0.3692091, -0.6998322, -2.955771, 0, 1, 0.08627451, 1,
-0.3686064, 0.352527, -1.603532, 0, 1, 0.09411765, 1,
-0.3644055, -0.8128104, -1.206443, 0, 1, 0.1019608, 1,
-0.3614123, 0.2697903, -1.915943, 0, 1, 0.1058824, 1,
-0.3577895, -2.125091, -3.743739, 0, 1, 0.1137255, 1,
-0.3533547, 1.759726, -0.1726609, 0, 1, 0.1176471, 1,
-0.3531204, -1.591196, -3.092367, 0, 1, 0.1254902, 1,
-0.3524964, 1.058252, -2.445954, 0, 1, 0.1294118, 1,
-0.3468211, 0.284667, -1.167306, 0, 1, 0.1372549, 1,
-0.3443674, -0.1374097, -1.299986, 0, 1, 0.1411765, 1,
-0.343041, -0.7665046, -2.662683, 0, 1, 0.1490196, 1,
-0.3410216, 1.366658, 0.01501875, 0, 1, 0.1529412, 1,
-0.3380688, -0.7529577, -2.893854, 0, 1, 0.1607843, 1,
-0.336989, 0.2383009, -0.3436911, 0, 1, 0.1647059, 1,
-0.3364372, 2.871763, -3.327238, 0, 1, 0.172549, 1,
-0.3348991, -0.548318, -3.343398, 0, 1, 0.1764706, 1,
-0.3299704, 1.459322, -0.2822203, 0, 1, 0.1843137, 1,
-0.3299347, -1.193662, -2.435648, 0, 1, 0.1882353, 1,
-0.3297463, 0.04948194, -1.387719, 0, 1, 0.1960784, 1,
-0.3273044, 0.6704729, -0.3002344, 0, 1, 0.2039216, 1,
-0.3260609, 0.4457707, -1.151351, 0, 1, 0.2078431, 1,
-0.3185461, 1.985448, 0.8146746, 0, 1, 0.2156863, 1,
-0.3179544, 1.360695, 0.3293014, 0, 1, 0.2196078, 1,
-0.3163399, 0.5757663, -1.312553, 0, 1, 0.227451, 1,
-0.3152573, 0.5084352, -0.676192, 0, 1, 0.2313726, 1,
-0.3140938, 0.07684541, -1.981146, 0, 1, 0.2392157, 1,
-0.3121012, 0.3833186, -0.8011003, 0, 1, 0.2431373, 1,
-0.3098749, 0.4100296, 0.03526932, 0, 1, 0.2509804, 1,
-0.3076185, 0.39687, -1.48365, 0, 1, 0.254902, 1,
-0.3074444, 0.6290799, 0.7173675, 0, 1, 0.2627451, 1,
-0.3050456, -0.4678814, -0.2005164, 0, 1, 0.2666667, 1,
-0.303826, 0.2079745, -2.279109, 0, 1, 0.2745098, 1,
-0.3003556, -0.6363035, -4.012676, 0, 1, 0.2784314, 1,
-0.2996743, 2.019168, -0.6306704, 0, 1, 0.2862745, 1,
-0.2995255, -0.1526694, -1.26842, 0, 1, 0.2901961, 1,
-0.2994476, 1.036224, 0.7958537, 0, 1, 0.2980392, 1,
-0.2940976, 0.1409978, -1.033692, 0, 1, 0.3058824, 1,
-0.2940496, -0.3685628, -2.1482, 0, 1, 0.3098039, 1,
-0.2924252, 0.1758709, -0.7554842, 0, 1, 0.3176471, 1,
-0.2915139, -0.3800858, -1.957361, 0, 1, 0.3215686, 1,
-0.2890168, -0.4144552, -2.002227, 0, 1, 0.3294118, 1,
-0.2880257, -0.2603924, -2.996162, 0, 1, 0.3333333, 1,
-0.2875904, -0.7128868, -2.927199, 0, 1, 0.3411765, 1,
-0.2847221, 0.3682156, -0.7285781, 0, 1, 0.345098, 1,
-0.2806138, -0.1864712, -0.9308609, 0, 1, 0.3529412, 1,
-0.2796667, -0.1115761, -2.514346, 0, 1, 0.3568628, 1,
-0.2758022, -1.293879, -3.357903, 0, 1, 0.3647059, 1,
-0.2749555, 1.065453, 0.3476626, 0, 1, 0.3686275, 1,
-0.2748086, -0.5418018, -3.171751, 0, 1, 0.3764706, 1,
-0.2737049, -0.2050602, -0.4891602, 0, 1, 0.3803922, 1,
-0.2668291, 0.4928396, -2.226666, 0, 1, 0.3882353, 1,
-0.264217, -1.256161, -1.743886, 0, 1, 0.3921569, 1,
-0.2626465, 0.5255991, -1.775254, 0, 1, 0.4, 1,
-0.2619195, 0.003707979, -2.999175, 0, 1, 0.4078431, 1,
-0.2595605, 1.021907, 1.48956, 0, 1, 0.4117647, 1,
-0.2580231, -1.297425, -3.51755, 0, 1, 0.4196078, 1,
-0.2563594, -0.3922006, -3.489439, 0, 1, 0.4235294, 1,
-0.2559088, -1.858774, -3.127519, 0, 1, 0.4313726, 1,
-0.2532099, 0.8076892, -1.42167, 0, 1, 0.4352941, 1,
-0.2503849, -0.6259242, -2.143239, 0, 1, 0.4431373, 1,
-0.242703, 2.444114, 0.6483768, 0, 1, 0.4470588, 1,
-0.2404973, -0.1737326, -1.757572, 0, 1, 0.454902, 1,
-0.2399055, -0.09287018, -0.9873773, 0, 1, 0.4588235, 1,
-0.2389975, -0.9602582, -3.051131, 0, 1, 0.4666667, 1,
-0.2342731, 1.562683, -0.7379783, 0, 1, 0.4705882, 1,
-0.2325435, -1.492631, -3.344876, 0, 1, 0.4784314, 1,
-0.2302232, -2.517278, -1.944118, 0, 1, 0.4823529, 1,
-0.2299583, -0.7971957, -3.982244, 0, 1, 0.4901961, 1,
-0.2239973, 0.1524376, -1.500371, 0, 1, 0.4941176, 1,
-0.2238827, 0.4317377, -2.720659, 0, 1, 0.5019608, 1,
-0.2185742, 0.04976429, -2.999874, 0, 1, 0.509804, 1,
-0.214632, -2.196202, -3.910172, 0, 1, 0.5137255, 1,
-0.2129922, -0.4067306, -3.218942, 0, 1, 0.5215687, 1,
-0.2101321, 0.0605372, -1.348953, 0, 1, 0.5254902, 1,
-0.2092872, -0.5022035, -2.775274, 0, 1, 0.5333334, 1,
-0.2078026, 0.7947271, -1.55136, 0, 1, 0.5372549, 1,
-0.2029293, 1.882936, 1.306519, 0, 1, 0.5450981, 1,
-0.2020887, 0.9677004, -0.6588101, 0, 1, 0.5490196, 1,
-0.2017031, 0.532138, 0.3817204, 0, 1, 0.5568628, 1,
-0.1991122, -0.8128012, -2.526219, 0, 1, 0.5607843, 1,
-0.1983358, 1.136224, 0.2393991, 0, 1, 0.5686275, 1,
-0.1981559, -1.227715, -2.69544, 0, 1, 0.572549, 1,
-0.1944791, 1.801205, 0.8625999, 0, 1, 0.5803922, 1,
-0.1913596, 0.4409217, 0.1777656, 0, 1, 0.5843138, 1,
-0.1912185, 2.084275, 0.6264384, 0, 1, 0.5921569, 1,
-0.1875346, 1.925179, 1.061231, 0, 1, 0.5960785, 1,
-0.1871306, -0.8114625, -2.809525, 0, 1, 0.6039216, 1,
-0.1836863, 0.7615411, -0.6983503, 0, 1, 0.6117647, 1,
-0.1822944, 0.4154324, -1.507406, 0, 1, 0.6156863, 1,
-0.1806089, -0.7459824, -2.617682, 0, 1, 0.6235294, 1,
-0.1772666, -0.6005723, -2.618879, 0, 1, 0.627451, 1,
-0.1745758, -0.09777855, -2.551605, 0, 1, 0.6352941, 1,
-0.1692156, -0.09528466, -2.111869, 0, 1, 0.6392157, 1,
-0.1680835, -0.3282022, -2.900298, 0, 1, 0.6470588, 1,
-0.165807, -0.04234992, -2.563871, 0, 1, 0.6509804, 1,
-0.1655816, 0.6858884, -2.287455, 0, 1, 0.6588235, 1,
-0.164269, 0.4263434, 0.0304672, 0, 1, 0.6627451, 1,
-0.1637514, 0.7523747, -1.193164, 0, 1, 0.6705883, 1,
-0.1619689, -1.165664, -2.45356, 0, 1, 0.6745098, 1,
-0.1597422, -0.5902784, -2.765399, 0, 1, 0.682353, 1,
-0.1508328, -0.5886796, -2.180386, 0, 1, 0.6862745, 1,
-0.1416707, 0.5524459, -0.7404364, 0, 1, 0.6941177, 1,
-0.1412249, 0.541154, -1.287551, 0, 1, 0.7019608, 1,
-0.1410259, 0.487094, -1.612058, 0, 1, 0.7058824, 1,
-0.1400827, 1.107029, -1.080359, 0, 1, 0.7137255, 1,
-0.1375661, 0.5130731, 0.307498, 0, 1, 0.7176471, 1,
-0.1373069, -0.010133, -1.980793, 0, 1, 0.7254902, 1,
-0.1363657, -0.23058, -4.300952, 0, 1, 0.7294118, 1,
-0.1316627, -0.08612575, -2.037688, 0, 1, 0.7372549, 1,
-0.123521, -0.6193073, -1.508937, 0, 1, 0.7411765, 1,
-0.121597, 1.920823, -0.4919557, 0, 1, 0.7490196, 1,
-0.1196023, -0.7110418, -2.273637, 0, 1, 0.7529412, 1,
-0.11942, 0.2582441, -1.158863, 0, 1, 0.7607843, 1,
-0.1168918, 1.315594, 0.1637365, 0, 1, 0.7647059, 1,
-0.1134216, -0.6185741, -2.596634, 0, 1, 0.772549, 1,
-0.1133363, -0.6872576, -2.461461, 0, 1, 0.7764706, 1,
-0.1113116, 0.6920364, -0.3913187, 0, 1, 0.7843137, 1,
-0.1076993, -1.206015, -2.757726, 0, 1, 0.7882353, 1,
-0.1076193, -0.2290893, -3.160538, 0, 1, 0.7960784, 1,
-0.1059523, 0.9597574, 0.526649, 0, 1, 0.8039216, 1,
-0.1036907, -0.5516984, -3.272813, 0, 1, 0.8078431, 1,
-0.1017225, -2.362762, -2.478056, 0, 1, 0.8156863, 1,
-0.1003643, -0.1885735, -2.65789, 0, 1, 0.8196079, 1,
-0.09973302, 0.3246407, 0.4236221, 0, 1, 0.827451, 1,
-0.09672016, 1.073358, -1.952036, 0, 1, 0.8313726, 1,
-0.09644213, -0.1319551, -1.512289, 0, 1, 0.8392157, 1,
-0.09387865, -2.089446, -4.023193, 0, 1, 0.8431373, 1,
-0.0919854, -0.1488223, -2.51624, 0, 1, 0.8509804, 1,
-0.08928598, 2.016928, 0.112791, 0, 1, 0.854902, 1,
-0.08913165, 0.6156567, -0.7699205, 0, 1, 0.8627451, 1,
-0.08282714, -1.34752, -3.846643, 0, 1, 0.8666667, 1,
-0.08235696, -1.776494, -1.72691, 0, 1, 0.8745098, 1,
-0.07910798, 0.3590439, 0.2417146, 0, 1, 0.8784314, 1,
-0.07809098, 0.8393256, -0.06085093, 0, 1, 0.8862745, 1,
-0.0769483, 0.8677022, -2.292811, 0, 1, 0.8901961, 1,
-0.07614052, 0.3443862, -1.332343, 0, 1, 0.8980392, 1,
-0.07558595, 1.712653, 1.445295, 0, 1, 0.9058824, 1,
-0.07524996, 0.3963276, -0.07650635, 0, 1, 0.9098039, 1,
-0.06917275, -1.558255, -1.942847, 0, 1, 0.9176471, 1,
-0.068647, -1.087195, -3.12595, 0, 1, 0.9215686, 1,
-0.06583947, -0.7271505, -1.881493, 0, 1, 0.9294118, 1,
-0.06396378, -1.155382, -2.603638, 0, 1, 0.9333333, 1,
-0.06171122, -0.6214617, -2.165751, 0, 1, 0.9411765, 1,
-0.05838732, 0.6132685, 0.2510022, 0, 1, 0.945098, 1,
-0.05695083, -0.1819096, -2.707438, 0, 1, 0.9529412, 1,
-0.05550612, 1.905817, 0.4339884, 0, 1, 0.9568627, 1,
-0.04777358, -0.2338406, -3.829101, 0, 1, 0.9647059, 1,
-0.04103528, -2.191808, -5.32531, 0, 1, 0.9686275, 1,
-0.03862515, -0.1376877, -3.495001, 0, 1, 0.9764706, 1,
-0.034004, -0.9582, -4.071901, 0, 1, 0.9803922, 1,
-0.03243333, -0.6176638, -2.537457, 0, 1, 0.9882353, 1,
-0.02989442, 0.2786186, -1.653444, 0, 1, 0.9921569, 1,
-0.0288917, 0.5109351, -2.166452, 0, 1, 1, 1,
-0.0176715, -0.796626, -3.264319, 0, 0.9921569, 1, 1,
-0.01265013, -0.7286185, -2.31029, 0, 0.9882353, 1, 1,
-0.01031737, 1.381464, -0.2570385, 0, 0.9803922, 1, 1,
-0.006690607, 0.926886, -0.6771781, 0, 0.9764706, 1, 1,
0.00102189, -0.2030258, 2.787647, 0, 0.9686275, 1, 1,
0.003561886, -0.9627953, 4.14979, 0, 0.9647059, 1, 1,
0.007332633, -0.8347571, 3.199076, 0, 0.9568627, 1, 1,
0.0105444, 0.1154996, 1.559675, 0, 0.9529412, 1, 1,
0.01457461, 0.27558, -0.6291522, 0, 0.945098, 1, 1,
0.01639905, 0.7018831, 1.473617, 0, 0.9411765, 1, 1,
0.02040147, -0.07810619, 3.735334, 0, 0.9333333, 1, 1,
0.02082305, -0.5211442, 3.76351, 0, 0.9294118, 1, 1,
0.02663128, 1.207357, 0.6157143, 0, 0.9215686, 1, 1,
0.02794282, -0.513466, 2.522037, 0, 0.9176471, 1, 1,
0.03222549, 0.1778727, 0.4641648, 0, 0.9098039, 1, 1,
0.03238987, -1.351858, 2.375348, 0, 0.9058824, 1, 1,
0.0344174, -0.07372104, 3.814661, 0, 0.8980392, 1, 1,
0.04077881, 0.3222386, 0.1246858, 0, 0.8901961, 1, 1,
0.0424931, -0.2679729, 0.6197649, 0, 0.8862745, 1, 1,
0.04452381, -0.8762094, 3.700302, 0, 0.8784314, 1, 1,
0.04459307, -0.7087331, 3.146698, 0, 0.8745098, 1, 1,
0.04461452, 1.298678, 0.8747684, 0, 0.8666667, 1, 1,
0.04474029, 0.4464108, 0.6964436, 0, 0.8627451, 1, 1,
0.04901813, -0.5631618, 4.469805, 0, 0.854902, 1, 1,
0.05346763, -0.8799832, 1.189276, 0, 0.8509804, 1, 1,
0.05522842, 0.03364339, 0.1944671, 0, 0.8431373, 1, 1,
0.05855291, 0.441253, -1.055792, 0, 0.8392157, 1, 1,
0.06012655, 1.670237, 0.8885276, 0, 0.8313726, 1, 1,
0.06378496, -2.200319, 4.505459, 0, 0.827451, 1, 1,
0.06479581, 1.650056, -0.5905203, 0, 0.8196079, 1, 1,
0.06677008, 2.305961, -0.1678421, 0, 0.8156863, 1, 1,
0.06730674, 0.8651937, 0.4131718, 0, 0.8078431, 1, 1,
0.07172859, 0.1496719, -0.0960677, 0, 0.8039216, 1, 1,
0.07497853, -0.4583691, 2.198355, 0, 0.7960784, 1, 1,
0.07762664, 0.4700456, 0.004211749, 0, 0.7882353, 1, 1,
0.08476642, 0.2003175, 0.1910579, 0, 0.7843137, 1, 1,
0.08603796, 0.4293266, 0.6367693, 0, 0.7764706, 1, 1,
0.08835506, -0.6408406, 2.593405, 0, 0.772549, 1, 1,
0.0889983, -0.1540399, 1.944226, 0, 0.7647059, 1, 1,
0.08920645, 1.976255, 0.5224901, 0, 0.7607843, 1, 1,
0.09284831, -0.7379292, 1.828462, 0, 0.7529412, 1, 1,
0.09477008, -0.817735, 1.731394, 0, 0.7490196, 1, 1,
0.09639134, 0.3155425, -0.3684006, 0, 0.7411765, 1, 1,
0.0982042, 0.05906204, 0.5806301, 0, 0.7372549, 1, 1,
0.1017708, 1.201622, -1.01527, 0, 0.7294118, 1, 1,
0.1071054, 1.411366, -0.1190194, 0, 0.7254902, 1, 1,
0.1091545, 1.591598, 0.477109, 0, 0.7176471, 1, 1,
0.1178779, 0.2941882, 2.168495, 0, 0.7137255, 1, 1,
0.1233436, 0.18535, 0.5484011, 0, 0.7058824, 1, 1,
0.1282735, -0.2937377, 2.40645, 0, 0.6980392, 1, 1,
0.1297341, -0.2264071, 0.9824077, 0, 0.6941177, 1, 1,
0.1320759, -0.6551096, 3.344347, 0, 0.6862745, 1, 1,
0.1326312, 0.7141106, -0.7229532, 0, 0.682353, 1, 1,
0.1369031, -0.4943056, 4.457326, 0, 0.6745098, 1, 1,
0.1385873, -0.09049683, 4.547409, 0, 0.6705883, 1, 1,
0.1387066, 0.152085, 0.5483366, 0, 0.6627451, 1, 1,
0.1401012, -0.7221355, 3.53382, 0, 0.6588235, 1, 1,
0.1448337, -0.1299461, 2.476133, 0, 0.6509804, 1, 1,
0.1449784, 2.915243, -0.7534377, 0, 0.6470588, 1, 1,
0.1450511, -1.114271, 1.243523, 0, 0.6392157, 1, 1,
0.1473729, -1.13217, 3.050277, 0, 0.6352941, 1, 1,
0.1489975, 1.463385, 1.575589, 0, 0.627451, 1, 1,
0.149618, -0.1331018, 3.299609, 0, 0.6235294, 1, 1,
0.1564113, -0.9149969, 2.644098, 0, 0.6156863, 1, 1,
0.1592888, 0.549018, 0.1717077, 0, 0.6117647, 1, 1,
0.1600977, -1.921151, 2.491616, 0, 0.6039216, 1, 1,
0.1628259, -1.145129, 3.350822, 0, 0.5960785, 1, 1,
0.1653223, 0.4149681, 0.279755, 0, 0.5921569, 1, 1,
0.1654772, -0.1806524, 3.267337, 0, 0.5843138, 1, 1,
0.1671247, 0.9389758, -0.5290017, 0, 0.5803922, 1, 1,
0.1672669, -1.483647, 2.284797, 0, 0.572549, 1, 1,
0.1677928, -0.8201881, 3.254349, 0, 0.5686275, 1, 1,
0.1700551, -0.7020928, 4.419047, 0, 0.5607843, 1, 1,
0.1703013, 1.03734, 0.2090471, 0, 0.5568628, 1, 1,
0.1719054, 2.10872, 0.5998785, 0, 0.5490196, 1, 1,
0.1737843, 1.233395, 1.922364, 0, 0.5450981, 1, 1,
0.1777624, 0.4105123, 1.957425, 0, 0.5372549, 1, 1,
0.1818618, 0.7975652, 0.1039595, 0, 0.5333334, 1, 1,
0.1856856, -0.357456, 0.3802648, 0, 0.5254902, 1, 1,
0.1868998, -0.4394084, 4.076212, 0, 0.5215687, 1, 1,
0.1878983, 0.1210571, 2.354017, 0, 0.5137255, 1, 1,
0.1889968, -2.607716, 2.407727, 0, 0.509804, 1, 1,
0.1942062, 0.7186167, -0.2138297, 0, 0.5019608, 1, 1,
0.1953105, 1.355112, 0.1182293, 0, 0.4941176, 1, 1,
0.2018264, 1.224806, 0.02952983, 0, 0.4901961, 1, 1,
0.2018338, -0.5665181, 3.133335, 0, 0.4823529, 1, 1,
0.2019548, -0.8872948, 3.587165, 0, 0.4784314, 1, 1,
0.2048117, 0.3985544, 0.2812359, 0, 0.4705882, 1, 1,
0.2101091, -1.458551, 1.069519, 0, 0.4666667, 1, 1,
0.2106983, 0.203504, -0.5430612, 0, 0.4588235, 1, 1,
0.2145582, -0.7842084, 3.302757, 0, 0.454902, 1, 1,
0.2172333, -0.8381086, 1.932255, 0, 0.4470588, 1, 1,
0.2321518, 0.1963628, -0.9996012, 0, 0.4431373, 1, 1,
0.2369628, -0.5180934, 1.985527, 0, 0.4352941, 1, 1,
0.2375144, -0.4981179, 3.595315, 0, 0.4313726, 1, 1,
0.239804, 1.382899, -1.959661, 0, 0.4235294, 1, 1,
0.2408269, 0.2625089, 1.169378, 0, 0.4196078, 1, 1,
0.2427461, -0.3922833, 3.492077, 0, 0.4117647, 1, 1,
0.2439129, -1.391491, 3.881914, 0, 0.4078431, 1, 1,
0.2441322, 0.03055941, 1.584818, 0, 0.4, 1, 1,
0.2481944, 0.4990055, 0.2187289, 0, 0.3921569, 1, 1,
0.2500348, -0.6535284, 4.818752, 0, 0.3882353, 1, 1,
0.2526719, -0.3023888, 1.9008, 0, 0.3803922, 1, 1,
0.2542146, -0.5051242, 5.480371, 0, 0.3764706, 1, 1,
0.2544957, -0.4088942, 5.325352, 0, 0.3686275, 1, 1,
0.2676649, -0.1654389, 3.018191, 0, 0.3647059, 1, 1,
0.2713133, -0.5599536, 2.764708, 0, 0.3568628, 1, 1,
0.2720885, 0.6838884, -1.098557, 0, 0.3529412, 1, 1,
0.2735815, 1.087177, 0.1297546, 0, 0.345098, 1, 1,
0.2782045, 1.130054, 1.444175, 0, 0.3411765, 1, 1,
0.2809648, 0.6614467, -0.420283, 0, 0.3333333, 1, 1,
0.2820649, -1.10507, 2.266417, 0, 0.3294118, 1, 1,
0.2841347, 1.925537, -0.01545496, 0, 0.3215686, 1, 1,
0.28715, 0.3684699, -0.3854004, 0, 0.3176471, 1, 1,
0.2990935, -2.52526, 3.41421, 0, 0.3098039, 1, 1,
0.3003139, 0.2908324, 2.396302, 0, 0.3058824, 1, 1,
0.3028172, -2.226483, 1.1366, 0, 0.2980392, 1, 1,
0.303811, -1.51424, 2.44742, 0, 0.2901961, 1, 1,
0.3069625, 1.144718, 0.1716824, 0, 0.2862745, 1, 1,
0.3079993, 1.336517, -0.287117, 0, 0.2784314, 1, 1,
0.3100232, -2.02554, 4.151835, 0, 0.2745098, 1, 1,
0.3117016, -0.4199037, 0.9687193, 0, 0.2666667, 1, 1,
0.315133, 0.5665888, 1.330577, 0, 0.2627451, 1, 1,
0.3159369, 0.1739128, 2.220465, 0, 0.254902, 1, 1,
0.3167966, -0.5363983, 1.752024, 0, 0.2509804, 1, 1,
0.3203685, -1.7271, 2.988006, 0, 0.2431373, 1, 1,
0.3212811, 1.104335, -0.05229577, 0, 0.2392157, 1, 1,
0.3232032, -1.63009, 1.435977, 0, 0.2313726, 1, 1,
0.3287135, -0.2200384, 3.926746, 0, 0.227451, 1, 1,
0.3325794, 0.0215371, -0.003192097, 0, 0.2196078, 1, 1,
0.333611, 1.436673, 1.465951, 0, 0.2156863, 1, 1,
0.3352597, -1.164479, 2.423273, 0, 0.2078431, 1, 1,
0.3395255, 0.8592668, -0.376614, 0, 0.2039216, 1, 1,
0.3456744, -1.107459, 2.030497, 0, 0.1960784, 1, 1,
0.3478389, 1.576286, 0.3199463, 0, 0.1882353, 1, 1,
0.3505965, 1.227012, 0.9083033, 0, 0.1843137, 1, 1,
0.3519572, 0.3197722, 1.824996, 0, 0.1764706, 1, 1,
0.3544501, 0.736218, 1.735407, 0, 0.172549, 1, 1,
0.3583896, 0.4474929, 0.7847863, 0, 0.1647059, 1, 1,
0.3600052, -1.097674, 2.525725, 0, 0.1607843, 1, 1,
0.3627076, -1.062296, 4.603593, 0, 0.1529412, 1, 1,
0.3629878, -0.3208058, 1.9462, 0, 0.1490196, 1, 1,
0.3637957, -1.934007, 1.885669, 0, 0.1411765, 1, 1,
0.3642496, 0.5623468, -0.5925775, 0, 0.1372549, 1, 1,
0.3652109, -1.448512, 2.29573, 0, 0.1294118, 1, 1,
0.3652187, 0.259699, 0.3579056, 0, 0.1254902, 1, 1,
0.3715574, 0.6588026, -1.798497, 0, 0.1176471, 1, 1,
0.3716452, -0.9450948, 3.733645, 0, 0.1137255, 1, 1,
0.3756517, 2.299838, -0.4709762, 0, 0.1058824, 1, 1,
0.3772751, 1.10088, -0.1385015, 0, 0.09803922, 1, 1,
0.3786893, -0.1780874, 0.1882331, 0, 0.09411765, 1, 1,
0.3795219, 0.4093346, 2.101314, 0, 0.08627451, 1, 1,
0.3846006, 0.3637738, 1.31764, 0, 0.08235294, 1, 1,
0.3850833, -0.4869759, 2.595887, 0, 0.07450981, 1, 1,
0.3875103, -0.7707586, 2.566065, 0, 0.07058824, 1, 1,
0.3881815, 0.9509536, 0.02205239, 0, 0.0627451, 1, 1,
0.3919913, 1.617401, -0.3287667, 0, 0.05882353, 1, 1,
0.3923131, -0.1180353, 1.957922, 0, 0.05098039, 1, 1,
0.3998719, 0.547015, 1.821103, 0, 0.04705882, 1, 1,
0.4008952, 1.270084, 0.3436322, 0, 0.03921569, 1, 1,
0.4021119, -2.780558, 4.29003, 0, 0.03529412, 1, 1,
0.4044262, 3.256853, 0.8276963, 0, 0.02745098, 1, 1,
0.4054591, 0.0706413, 1.177888, 0, 0.02352941, 1, 1,
0.4095179, 1.087197, -0.7422205, 0, 0.01568628, 1, 1,
0.4108027, 1.029148, 2.753922, 0, 0.01176471, 1, 1,
0.4136447, 1.916021, -0.6917436, 0, 0.003921569, 1, 1,
0.4152423, -0.2846917, 2.563699, 0.003921569, 0, 1, 1,
0.4186965, -0.6377882, 2.822816, 0.007843138, 0, 1, 1,
0.4213913, 0.9432164, -0.3865276, 0.01568628, 0, 1, 1,
0.426548, 0.8584368, 0.6309498, 0.01960784, 0, 1, 1,
0.4286128, 1.650957, 1.949413, 0.02745098, 0, 1, 1,
0.4295421, -0.07282083, 1.838262, 0.03137255, 0, 1, 1,
0.4306499, -0.2887141, 0.2112699, 0.03921569, 0, 1, 1,
0.43314, -0.983395, 2.241123, 0.04313726, 0, 1, 1,
0.4366907, 0.07224564, 1.43508, 0.05098039, 0, 1, 1,
0.4401537, -0.9627486, 2.009511, 0.05490196, 0, 1, 1,
0.441835, 0.05741076, 0.7955655, 0.0627451, 0, 1, 1,
0.4419448, 1.107387, 1.061863, 0.06666667, 0, 1, 1,
0.4423874, 1.165808, 0.0003408206, 0.07450981, 0, 1, 1,
0.4459987, 1.938823, -0.8681743, 0.07843138, 0, 1, 1,
0.447423, -0.9097204, 2.591204, 0.08627451, 0, 1, 1,
0.4474846, -0.3127933, 1.195798, 0.09019608, 0, 1, 1,
0.4516047, -1.150855, 1.929442, 0.09803922, 0, 1, 1,
0.4558751, -1.007876, 3.117756, 0.1058824, 0, 1, 1,
0.4644028, 0.5512956, 0.2493519, 0.1098039, 0, 1, 1,
0.4672105, 0.2552713, 2.673447, 0.1176471, 0, 1, 1,
0.4703823, 1.356403, -0.1520942, 0.1215686, 0, 1, 1,
0.4721698, 0.154594, 2.339236, 0.1294118, 0, 1, 1,
0.475521, 0.3876415, 1.734459, 0.1333333, 0, 1, 1,
0.4772669, -1.12847, 4.364733, 0.1411765, 0, 1, 1,
0.4776859, 0.2613088, 1.572087, 0.145098, 0, 1, 1,
0.483823, -0.4739145, 1.310935, 0.1529412, 0, 1, 1,
0.4890271, -0.5028507, 2.1327, 0.1568628, 0, 1, 1,
0.4901395, 0.5713837, 0.05367509, 0.1647059, 0, 1, 1,
0.4962632, -0.4870724, 2.340781, 0.1686275, 0, 1, 1,
0.4979542, -0.2045932, 1.614967, 0.1764706, 0, 1, 1,
0.4996344, 0.5870766, 1.195798, 0.1803922, 0, 1, 1,
0.5007372, -0.8106704, 3.310487, 0.1882353, 0, 1, 1,
0.5046349, -0.05139167, 2.434576, 0.1921569, 0, 1, 1,
0.5083935, -0.6831017, 4.427035, 0.2, 0, 1, 1,
0.5107771, 0.04884798, 0.5656627, 0.2078431, 0, 1, 1,
0.5132778, 1.476782, -1.151069, 0.2117647, 0, 1, 1,
0.5156522, -0.8396599, 2.94101, 0.2196078, 0, 1, 1,
0.5157724, -0.07522721, 2.952268, 0.2235294, 0, 1, 1,
0.5164821, 0.06958218, 1.451047, 0.2313726, 0, 1, 1,
0.5205432, -0.4421171, 1.840408, 0.2352941, 0, 1, 1,
0.5213907, 0.3227642, -0.134686, 0.2431373, 0, 1, 1,
0.5244671, -1.042053, 5.251375, 0.2470588, 0, 1, 1,
0.5255505, 0.5601621, 0.4694967, 0.254902, 0, 1, 1,
0.5256754, 1.093266, 1.77258, 0.2588235, 0, 1, 1,
0.5345345, 1.512673, 0.6567101, 0.2666667, 0, 1, 1,
0.5451431, 0.6523799, 0.6902559, 0.2705882, 0, 1, 1,
0.5483707, -0.1024522, 1.914974, 0.2784314, 0, 1, 1,
0.549939, -1.000684, 3.956724, 0.282353, 0, 1, 1,
0.5568582, -0.8483229, 2.798038, 0.2901961, 0, 1, 1,
0.5569856, -0.7857085, 2.887446, 0.2941177, 0, 1, 1,
0.5575141, 1.004223, 1.003917, 0.3019608, 0, 1, 1,
0.5587091, -1.122611, 3.550185, 0.3098039, 0, 1, 1,
0.5592369, -0.7548886, 2.539495, 0.3137255, 0, 1, 1,
0.5611589, 0.007088726, 0.6911651, 0.3215686, 0, 1, 1,
0.5657784, -0.3531605, 1.334209, 0.3254902, 0, 1, 1,
0.5660607, 0.8262046, 1.070409, 0.3333333, 0, 1, 1,
0.5670173, -0.4193688, 2.852334, 0.3372549, 0, 1, 1,
0.5741536, 0.01987001, 2.044773, 0.345098, 0, 1, 1,
0.57564, -0.2775881, 0.487871, 0.3490196, 0, 1, 1,
0.5789067, -1.703213, 2.854622, 0.3568628, 0, 1, 1,
0.5819902, 0.647852, -0.2685015, 0.3607843, 0, 1, 1,
0.582638, 0.5526788, 0.9507273, 0.3686275, 0, 1, 1,
0.5906117, -1.29978, 0.6853064, 0.372549, 0, 1, 1,
0.5990753, 0.6078636, 0.7987441, 0.3803922, 0, 1, 1,
0.60192, -2.284986, 3.189987, 0.3843137, 0, 1, 1,
0.6071847, 0.004135899, -0.1827435, 0.3921569, 0, 1, 1,
0.6104758, 0.1323283, 2.747178, 0.3960784, 0, 1, 1,
0.6159909, -1.632905, 2.840822, 0.4039216, 0, 1, 1,
0.6169794, 1.036534, 1.362496, 0.4117647, 0, 1, 1,
0.6237492, -0.5150602, 0.2307998, 0.4156863, 0, 1, 1,
0.6277751, -0.2835284, 2.794652, 0.4235294, 0, 1, 1,
0.6302182, 1.712029, 1.421124, 0.427451, 0, 1, 1,
0.6369311, -0.01793129, 1.177009, 0.4352941, 0, 1, 1,
0.6414112, -0.164871, 2.300199, 0.4392157, 0, 1, 1,
0.6419244, -0.6028641, 2.196563, 0.4470588, 0, 1, 1,
0.6441483, -1.45523, 2.706037, 0.4509804, 0, 1, 1,
0.6452854, 0.04417529, 3.188125, 0.4588235, 0, 1, 1,
0.6468798, 0.5751589, 1.97967, 0.4627451, 0, 1, 1,
0.6542484, 0.8672727, 0.4415548, 0.4705882, 0, 1, 1,
0.6548142, 2.086486, 1.718516, 0.4745098, 0, 1, 1,
0.6548204, 0.2660669, 0.475766, 0.4823529, 0, 1, 1,
0.6559123, 0.2997897, 1.066617, 0.4862745, 0, 1, 1,
0.6561925, -1.082414, 2.557016, 0.4941176, 0, 1, 1,
0.6620243, -0.3228264, 2.438849, 0.5019608, 0, 1, 1,
0.6661414, 0.2102859, 2.02054, 0.5058824, 0, 1, 1,
0.6665219, -1.303009, 3.533164, 0.5137255, 0, 1, 1,
0.6675429, 0.0209452, 1.796966, 0.5176471, 0, 1, 1,
0.6683174, 0.9601843, -0.811528, 0.5254902, 0, 1, 1,
0.6685184, -0.5593361, 1.168335, 0.5294118, 0, 1, 1,
0.6700489, 0.7539356, 2.083357, 0.5372549, 0, 1, 1,
0.6723416, 0.4825264, 0.786273, 0.5411765, 0, 1, 1,
0.6762912, 0.3161881, 1.527439, 0.5490196, 0, 1, 1,
0.6824026, 0.3266843, 1.750611, 0.5529412, 0, 1, 1,
0.6832867, -0.8189611, 2.101976, 0.5607843, 0, 1, 1,
0.6851359, 0.571695, 1.215381, 0.5647059, 0, 1, 1,
0.6870596, -0.4786209, 1.263911, 0.572549, 0, 1, 1,
0.6940297, -1.205944, 1.297902, 0.5764706, 0, 1, 1,
0.6943174, -1.294866, 2.38404, 0.5843138, 0, 1, 1,
0.6970458, 1.409324, -0.3415032, 0.5882353, 0, 1, 1,
0.6986726, 0.1343244, 1.162299, 0.5960785, 0, 1, 1,
0.7004979, -0.3652681, 1.543436, 0.6039216, 0, 1, 1,
0.7034407, -0.1067672, 2.679004, 0.6078432, 0, 1, 1,
0.7077121, -1.242993, 2.439673, 0.6156863, 0, 1, 1,
0.7123175, 1.673616, 1.15739, 0.6196079, 0, 1, 1,
0.7176731, -1.35792, 1.420698, 0.627451, 0, 1, 1,
0.7320297, 2.125371, 0.2105854, 0.6313726, 0, 1, 1,
0.7350143, 0.7293382, 0.3467603, 0.6392157, 0, 1, 1,
0.7356889, -0.3617477, 1.482597, 0.6431373, 0, 1, 1,
0.7397611, 2.081389, -1.832487, 0.6509804, 0, 1, 1,
0.7452691, 1.039786, -0.9590414, 0.654902, 0, 1, 1,
0.7475205, 0.6230471, -0.1021954, 0.6627451, 0, 1, 1,
0.7475649, -1.793061, 3.730576, 0.6666667, 0, 1, 1,
0.7506095, -0.7559764, 2.727395, 0.6745098, 0, 1, 1,
0.7507961, 0.01037681, 1.127351, 0.6784314, 0, 1, 1,
0.7722246, -1.612116, 2.14966, 0.6862745, 0, 1, 1,
0.7736543, 1.75117, 0.9904379, 0.6901961, 0, 1, 1,
0.7748948, -0.07262591, 2.911878, 0.6980392, 0, 1, 1,
0.7749178, -0.6804768, 3.204281, 0.7058824, 0, 1, 1,
0.7777711, -1.571849, 2.843267, 0.7098039, 0, 1, 1,
0.7789105, -1.19693, 2.524411, 0.7176471, 0, 1, 1,
0.7820407, -0.5183635, 0.17515, 0.7215686, 0, 1, 1,
0.7843573, 0.9911178, 0.3322642, 0.7294118, 0, 1, 1,
0.7893907, -1.020628, 3.237257, 0.7333333, 0, 1, 1,
0.792322, -0.363595, 2.93492, 0.7411765, 0, 1, 1,
0.7924194, -1.25776, 2.343945, 0.7450981, 0, 1, 1,
0.7986453, 0.6813808, 2.575726, 0.7529412, 0, 1, 1,
0.7993841, 0.3265673, 0.03058339, 0.7568628, 0, 1, 1,
0.8011474, -0.29146, 1.050356, 0.7647059, 0, 1, 1,
0.8014304, 0.75054, -0.7860591, 0.7686275, 0, 1, 1,
0.8017694, 0.6446046, 1.44524, 0.7764706, 0, 1, 1,
0.8068424, -0.1572152, 1.618047, 0.7803922, 0, 1, 1,
0.8070223, 0.0932664, 1.714614, 0.7882353, 0, 1, 1,
0.808749, 2.555169, 1.091467, 0.7921569, 0, 1, 1,
0.8102044, 0.05755273, 1.634605, 0.8, 0, 1, 1,
0.8175107, -0.2034012, 1.635804, 0.8078431, 0, 1, 1,
0.821409, 0.2831383, 2.822827, 0.8117647, 0, 1, 1,
0.8235661, 0.1102068, -0.05623297, 0.8196079, 0, 1, 1,
0.8250728, -0.9771749, 3.023645, 0.8235294, 0, 1, 1,
0.8285059, 1.95341, -0.8509403, 0.8313726, 0, 1, 1,
0.8330961, 0.4444261, 0.2307953, 0.8352941, 0, 1, 1,
0.8411193, -1.304877, 1.014199, 0.8431373, 0, 1, 1,
0.8425237, -0.5289773, 0.8047783, 0.8470588, 0, 1, 1,
0.8455777, 1.075506, 0.9130682, 0.854902, 0, 1, 1,
0.8519024, -0.03763075, 1.747987, 0.8588235, 0, 1, 1,
0.8540633, -2.09602, 2.72624, 0.8666667, 0, 1, 1,
0.8540804, -0.3464493, 2.684237, 0.8705882, 0, 1, 1,
0.8547107, 1.074402, 1.951648, 0.8784314, 0, 1, 1,
0.8606982, -1.794519, 3.386175, 0.8823529, 0, 1, 1,
0.8611595, -0.2701303, 2.096313, 0.8901961, 0, 1, 1,
0.8621827, 0.2861938, 0.1073499, 0.8941177, 0, 1, 1,
0.8633996, -2.246524, 2.591849, 0.9019608, 0, 1, 1,
0.8644727, 0.8908484, 1.621934, 0.9098039, 0, 1, 1,
0.8651542, 0.6305307, 0.565861, 0.9137255, 0, 1, 1,
0.8667645, -1.400705, 3.153846, 0.9215686, 0, 1, 1,
0.8769966, 0.4593523, 1.826536, 0.9254902, 0, 1, 1,
0.878832, -1.691294, 2.992736, 0.9333333, 0, 1, 1,
0.8816801, 0.05049191, 2.543102, 0.9372549, 0, 1, 1,
0.8847886, -0.2996394, 1.759152, 0.945098, 0, 1, 1,
0.8860468, -1.317729, 2.470104, 0.9490196, 0, 1, 1,
0.8901762, -1.979398, 1.21701, 0.9568627, 0, 1, 1,
0.8935862, 2.155427, -1.643049, 0.9607843, 0, 1, 1,
0.8959934, -1.489044, 2.609839, 0.9686275, 0, 1, 1,
0.900681, 0.8097417, -0.9115119, 0.972549, 0, 1, 1,
0.9017172, -1.276057, 1.978862, 0.9803922, 0, 1, 1,
0.9049872, -0.3424869, 0.5268651, 0.9843137, 0, 1, 1,
0.9067177, 0.008530632, 1.680615, 0.9921569, 0, 1, 1,
0.9069023, 0.3568838, 1.661587, 0.9960784, 0, 1, 1,
0.9090575, -1.244958, 3.573065, 1, 0, 0.9960784, 1,
0.9134542, -1.046836, 2.328169, 1, 0, 0.9882353, 1,
0.920234, 0.6392813, 1.978745, 1, 0, 0.9843137, 1,
0.9376657, 0.1705946, -0.4512493, 1, 0, 0.9764706, 1,
0.9592373, -0.6191492, 0.3972485, 1, 0, 0.972549, 1,
0.9608903, -2.042541, 2.252649, 1, 0, 0.9647059, 1,
0.9627167, -0.1929922, 1.383421, 1, 0, 0.9607843, 1,
0.9635829, -1.183103, 2.150891, 1, 0, 0.9529412, 1,
0.9756041, -2.01185, 2.249192, 1, 0, 0.9490196, 1,
0.9757176, -0.01400129, -0.8272666, 1, 0, 0.9411765, 1,
0.9802206, -0.6539577, 2.115906, 1, 0, 0.9372549, 1,
0.984648, 1.506384, 0.9494689, 1, 0, 0.9294118, 1,
0.9915944, 1.242589, 1.003783, 1, 0, 0.9254902, 1,
0.998754, -0.2404205, 1.18309, 1, 0, 0.9176471, 1,
1.004891, 0.3490428, 1.299684, 1, 0, 0.9137255, 1,
1.011889, 0.03202215, 1.982336, 1, 0, 0.9058824, 1,
1.034102, -1.06781, 3.163244, 1, 0, 0.9019608, 1,
1.042359, -0.06104256, 0.8771409, 1, 0, 0.8941177, 1,
1.046603, -1.292932, 0.7081867, 1, 0, 0.8862745, 1,
1.058536, -0.3975768, 1.484701, 1, 0, 0.8823529, 1,
1.059157, -0.7479153, 1.790634, 1, 0, 0.8745098, 1,
1.059994, 1.522312, 0.7919611, 1, 0, 0.8705882, 1,
1.063037, 0.1633558, 1.83338, 1, 0, 0.8627451, 1,
1.072894, 0.5227465, 1.874575, 1, 0, 0.8588235, 1,
1.073532, -0.6550751, 1.396213, 1, 0, 0.8509804, 1,
1.081086, -0.4998553, -0.06342071, 1, 0, 0.8470588, 1,
1.08172, 0.5446109, 0.8353117, 1, 0, 0.8392157, 1,
1.082314, 0.2197797, -0.355869, 1, 0, 0.8352941, 1,
1.089984, 0.5125037, 2.214681, 1, 0, 0.827451, 1,
1.092271, 1.064892, -0.03612593, 1, 0, 0.8235294, 1,
1.092478, -0.1233998, 0.7011808, 1, 0, 0.8156863, 1,
1.09385, 0.5957838, 0.3704848, 1, 0, 0.8117647, 1,
1.095031, -0.2502434, 0.4912858, 1, 0, 0.8039216, 1,
1.096915, -0.07445297, 2.159279, 1, 0, 0.7960784, 1,
1.10123, -0.6399258, 3.199698, 1, 0, 0.7921569, 1,
1.101958, 0.919998, 1.165797, 1, 0, 0.7843137, 1,
1.102413, -0.2253626, 0.7473087, 1, 0, 0.7803922, 1,
1.111602, -0.650202, 0.8866094, 1, 0, 0.772549, 1,
1.125017, -0.02600616, 1.974553, 1, 0, 0.7686275, 1,
1.131879, -0.2512237, 2.652415, 1, 0, 0.7607843, 1,
1.137116, -0.4061526, 2.881004, 1, 0, 0.7568628, 1,
1.149136, 0.2846334, -0.6834907, 1, 0, 0.7490196, 1,
1.150236, 0.4341258, -0.1266714, 1, 0, 0.7450981, 1,
1.158755, 0.5983067, -1.070593, 1, 0, 0.7372549, 1,
1.15882, 0.1605067, 1.439523, 1, 0, 0.7333333, 1,
1.162419, 0.008903616, 1.742392, 1, 0, 0.7254902, 1,
1.164253, -1.22225, 1.310588, 1, 0, 0.7215686, 1,
1.164795, -0.3618239, 1.386507, 1, 0, 0.7137255, 1,
1.182915, -1.208257, 1.837556, 1, 0, 0.7098039, 1,
1.190627, 0.5550093, 2.718955, 1, 0, 0.7019608, 1,
1.202003, 1.90789, 1.653366, 1, 0, 0.6941177, 1,
1.203457, 0.4954787, 1.432752, 1, 0, 0.6901961, 1,
1.207356, 0.8128633, 0.3041161, 1, 0, 0.682353, 1,
1.211476, -0.05313616, 2.258248, 1, 0, 0.6784314, 1,
1.213872, -0.9598762, 1.904423, 1, 0, 0.6705883, 1,
1.215578, 2.121707, -0.1774857, 1, 0, 0.6666667, 1,
1.217648, 0.9542978, 0.9456277, 1, 0, 0.6588235, 1,
1.219813, 0.04790122, 2.384722, 1, 0, 0.654902, 1,
1.223892, -0.2853532, 2.306458, 1, 0, 0.6470588, 1,
1.224852, 0.3013192, 0.977054, 1, 0, 0.6431373, 1,
1.224996, -1.355875, 1.51116, 1, 0, 0.6352941, 1,
1.230361, -0.324434, 1.994784, 1, 0, 0.6313726, 1,
1.236321, 1.063789, 0.5605453, 1, 0, 0.6235294, 1,
1.239369, -1.32057, 1.869345, 1, 0, 0.6196079, 1,
1.255116, -0.2944152, 1.362688, 1, 0, 0.6117647, 1,
1.255353, -1.948576, 1.699667, 1, 0, 0.6078432, 1,
1.262333, -0.8767489, 3.874334, 1, 0, 0.6, 1,
1.264363, -0.4241978, 2.829046, 1, 0, 0.5921569, 1,
1.264877, 2.12051, 1.439655, 1, 0, 0.5882353, 1,
1.276533, 0.3734309, -0.05183569, 1, 0, 0.5803922, 1,
1.285076, -0.4583476, 0.4974726, 1, 0, 0.5764706, 1,
1.291349, -0.07032092, 1.057694, 1, 0, 0.5686275, 1,
1.295391, -1.323726, 1.60852, 1, 0, 0.5647059, 1,
1.309024, 0.5488607, 0.8433756, 1, 0, 0.5568628, 1,
1.328224, 0.3712661, 1.3305, 1, 0, 0.5529412, 1,
1.336217, 1.183906, 1.001244, 1, 0, 0.5450981, 1,
1.34293, 0.8290995, 1.710979, 1, 0, 0.5411765, 1,
1.344869, 0.5966799, 3.538935, 1, 0, 0.5333334, 1,
1.349486, 0.2316434, -0.1274614, 1, 0, 0.5294118, 1,
1.355201, -1.56633, 1.026031, 1, 0, 0.5215687, 1,
1.356897, -0.9660648, 2.91711, 1, 0, 0.5176471, 1,
1.360536, -0.8413078, 2.360355, 1, 0, 0.509804, 1,
1.384326, 1.160789, -0.8171114, 1, 0, 0.5058824, 1,
1.397774, 0.9057266, 0.1691476, 1, 0, 0.4980392, 1,
1.401785, -1.509297, 1.400763, 1, 0, 0.4901961, 1,
1.407958, 1.335333, -0.7350057, 1, 0, 0.4862745, 1,
1.414973, 0.4890405, 1.715969, 1, 0, 0.4784314, 1,
1.415157, 0.8994654, 1.045738, 1, 0, 0.4745098, 1,
1.421488, -0.9772536, 2.417551, 1, 0, 0.4666667, 1,
1.429658, -0.5480701, 2.299257, 1, 0, 0.4627451, 1,
1.451432, 1.262757, 0.2834691, 1, 0, 0.454902, 1,
1.454535, 1.275075, 1.913425, 1, 0, 0.4509804, 1,
1.463583, -0.7322114, 0.9247088, 1, 0, 0.4431373, 1,
1.46792, 0.9190997, 0.9447045, 1, 0, 0.4392157, 1,
1.492594, -1.07756, 1.61275, 1, 0, 0.4313726, 1,
1.5025, 0.0887344, 1.478523, 1, 0, 0.427451, 1,
1.506788, 1.770182, 2.775717, 1, 0, 0.4196078, 1,
1.509646, 1.143656, 0.5970679, 1, 0, 0.4156863, 1,
1.51211, -1.011955, 1.213385, 1, 0, 0.4078431, 1,
1.512329, -0.6979088, 2.418732, 1, 0, 0.4039216, 1,
1.520961, 0.4661628, 0.409543, 1, 0, 0.3960784, 1,
1.529336, 1.632394, 1.334479, 1, 0, 0.3882353, 1,
1.548392, 0.05589949, 0.1886889, 1, 0, 0.3843137, 1,
1.553263, -0.7392616, 2.136497, 1, 0, 0.3764706, 1,
1.561093, -0.483137, 2.993151, 1, 0, 0.372549, 1,
1.563403, -0.7212588, 2.533728, 1, 0, 0.3647059, 1,
1.577301, -0.860897, 2.61183, 1, 0, 0.3607843, 1,
1.583387, 0.6830876, 1.479921, 1, 0, 0.3529412, 1,
1.584409, -2.483282, 2.524937, 1, 0, 0.3490196, 1,
1.59458, -1.306061, 1.627177, 1, 0, 0.3411765, 1,
1.601977, -0.1903419, 3.556199, 1, 0, 0.3372549, 1,
1.606275, -0.2784247, 1.333273, 1, 0, 0.3294118, 1,
1.607052, -0.01676442, 2.496626, 1, 0, 0.3254902, 1,
1.634432, -0.7908804, 2.413463, 1, 0, 0.3176471, 1,
1.645541, -1.350183, 1.11536, 1, 0, 0.3137255, 1,
1.6563, 0.2147387, 2.546969, 1, 0, 0.3058824, 1,
1.6572, 1.516614, 3.914181, 1, 0, 0.2980392, 1,
1.659036, 1.082692, 0.9926516, 1, 0, 0.2941177, 1,
1.661913, -0.02358118, 0.2900331, 1, 0, 0.2862745, 1,
1.711296, 1.305447, 2.852678, 1, 0, 0.282353, 1,
1.727011, -1.146212, 2.493328, 1, 0, 0.2745098, 1,
1.737896, 0.72515, 1.546022, 1, 0, 0.2705882, 1,
1.737986, -1.296853, 2.572824, 1, 0, 0.2627451, 1,
1.742017, -0.435888, 3.073887, 1, 0, 0.2588235, 1,
1.75345, 1.943852, 1.566968, 1, 0, 0.2509804, 1,
1.767615, 0.06356812, 1.015703, 1, 0, 0.2470588, 1,
1.786439, 0.3795577, 2.27463, 1, 0, 0.2392157, 1,
1.791885, -0.02305167, 3.687024, 1, 0, 0.2352941, 1,
1.792869, 0.2060681, 2.316336, 1, 0, 0.227451, 1,
1.83606, 0.6456159, 1.433744, 1, 0, 0.2235294, 1,
1.855251, -0.2830924, 2.541132, 1, 0, 0.2156863, 1,
1.878779, 0.6462415, 0.7089653, 1, 0, 0.2117647, 1,
1.880611, -1.158445, 0.9355059, 1, 0, 0.2039216, 1,
1.883454, -0.4174805, 0.8300021, 1, 0, 0.1960784, 1,
1.884259, -0.404844, 3.008308, 1, 0, 0.1921569, 1,
1.891229, -2.02638, 3.112367, 1, 0, 0.1843137, 1,
1.922275, -0.7038385, 2.640603, 1, 0, 0.1803922, 1,
1.962642, 0.6757008, 0.5621693, 1, 0, 0.172549, 1,
1.993899, -1.398884, 2.62258, 1, 0, 0.1686275, 1,
2.015003, 0.8249014, 1.459024, 1, 0, 0.1607843, 1,
2.03571, -0.1064975, 2.49786, 1, 0, 0.1568628, 1,
2.047754, 0.849739, 0.801205, 1, 0, 0.1490196, 1,
2.048746, -0.7906629, 3.695074, 1, 0, 0.145098, 1,
2.054546, -0.1948679, 1.544456, 1, 0, 0.1372549, 1,
2.089839, -1.125266, 2.553552, 1, 0, 0.1333333, 1,
2.098878, -1.715196, 5.055651, 1, 0, 0.1254902, 1,
2.107047, -0.4222987, 1.857527, 1, 0, 0.1215686, 1,
2.124299, 0.461277, -0.2239741, 1, 0, 0.1137255, 1,
2.143489, 0.5741745, -0.1183594, 1, 0, 0.1098039, 1,
2.151678, -0.3532277, 2.081829, 1, 0, 0.1019608, 1,
2.157036, 1.03521, 2.009762, 1, 0, 0.09411765, 1,
2.186878, -0.3281043, 0.8501625, 1, 0, 0.09019608, 1,
2.196359, -0.3069673, 1.91438, 1, 0, 0.08235294, 1,
2.232789, -1.356027, 2.529208, 1, 0, 0.07843138, 1,
2.237181, -1.297636, 2.019218, 1, 0, 0.07058824, 1,
2.273366, 0.3708158, 1.661345, 1, 0, 0.06666667, 1,
2.278404, -0.1673648, 1.547993, 1, 0, 0.05882353, 1,
2.304575, 1.076583, 2.277881, 1, 0, 0.05490196, 1,
2.311702, 1.29873, 0.06065875, 1, 0, 0.04705882, 1,
2.318348, -0.1494997, 3.616604, 1, 0, 0.04313726, 1,
2.351969, -1.092516, 2.105921, 1, 0, 0.03529412, 1,
2.377394, -1.430984, 2.849974, 1, 0, 0.03137255, 1,
2.398208, -0.2180656, 1.869593, 1, 0, 0.02352941, 1,
2.663922, -0.796047, 0.2418304, 1, 0, 0.01960784, 1,
3.29929, 0.315515, 0.1662679, 1, 0, 0.01176471, 1,
3.457269, -0.7210208, 1.906687, 1, 0, 0.007843138, 1
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
0.1024051, -3.91179, -7.156873, 0, -0.5, 0.5, 0.5,
0.1024051, -3.91179, -7.156873, 1, -0.5, 0.5, 0.5,
0.1024051, -3.91179, -7.156873, 1, 1.5, 0.5, 0.5,
0.1024051, -3.91179, -7.156873, 0, 1.5, 0.5, 0.5
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
-4.389758, 0.2829932, -7.156873, 0, -0.5, 0.5, 0.5,
-4.389758, 0.2829932, -7.156873, 1, -0.5, 0.5, 0.5,
-4.389758, 0.2829932, -7.156873, 1, 1.5, 0.5, 0.5,
-4.389758, 0.2829932, -7.156873, 0, 1.5, 0.5, 0.5
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
-4.389758, -3.91179, 0.07753038, 0, -0.5, 0.5, 0.5,
-4.389758, -3.91179, 0.07753038, 1, -0.5, 0.5, 0.5,
-4.389758, -3.91179, 0.07753038, 1, 1.5, 0.5, 0.5,
-4.389758, -3.91179, 0.07753038, 0, 1.5, 0.5, 0.5
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
-3, -2.943763, -5.487395,
3, -2.943763, -5.487395,
-3, -2.943763, -5.487395,
-3, -3.105101, -5.765642,
-2, -2.943763, -5.487395,
-2, -3.105101, -5.765642,
-1, -2.943763, -5.487395,
-1, -3.105101, -5.765642,
0, -2.943763, -5.487395,
0, -3.105101, -5.765642,
1, -2.943763, -5.487395,
1, -3.105101, -5.765642,
2, -2.943763, -5.487395,
2, -3.105101, -5.765642,
3, -2.943763, -5.487395,
3, -3.105101, -5.765642
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
-3, -3.427776, -6.322134, 0, -0.5, 0.5, 0.5,
-3, -3.427776, -6.322134, 1, -0.5, 0.5, 0.5,
-3, -3.427776, -6.322134, 1, 1.5, 0.5, 0.5,
-3, -3.427776, -6.322134, 0, 1.5, 0.5, 0.5,
-2, -3.427776, -6.322134, 0, -0.5, 0.5, 0.5,
-2, -3.427776, -6.322134, 1, -0.5, 0.5, 0.5,
-2, -3.427776, -6.322134, 1, 1.5, 0.5, 0.5,
-2, -3.427776, -6.322134, 0, 1.5, 0.5, 0.5,
-1, -3.427776, -6.322134, 0, -0.5, 0.5, 0.5,
-1, -3.427776, -6.322134, 1, -0.5, 0.5, 0.5,
-1, -3.427776, -6.322134, 1, 1.5, 0.5, 0.5,
-1, -3.427776, -6.322134, 0, 1.5, 0.5, 0.5,
0, -3.427776, -6.322134, 0, -0.5, 0.5, 0.5,
0, -3.427776, -6.322134, 1, -0.5, 0.5, 0.5,
0, -3.427776, -6.322134, 1, 1.5, 0.5, 0.5,
0, -3.427776, -6.322134, 0, 1.5, 0.5, 0.5,
1, -3.427776, -6.322134, 0, -0.5, 0.5, 0.5,
1, -3.427776, -6.322134, 1, -0.5, 0.5, 0.5,
1, -3.427776, -6.322134, 1, 1.5, 0.5, 0.5,
1, -3.427776, -6.322134, 0, 1.5, 0.5, 0.5,
2, -3.427776, -6.322134, 0, -0.5, 0.5, 0.5,
2, -3.427776, -6.322134, 1, -0.5, 0.5, 0.5,
2, -3.427776, -6.322134, 1, 1.5, 0.5, 0.5,
2, -3.427776, -6.322134, 0, 1.5, 0.5, 0.5,
3, -3.427776, -6.322134, 0, -0.5, 0.5, 0.5,
3, -3.427776, -6.322134, 1, -0.5, 0.5, 0.5,
3, -3.427776, -6.322134, 1, 1.5, 0.5, 0.5,
3, -3.427776, -6.322134, 0, 1.5, 0.5, 0.5
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
-3.353105, -2, -5.487395,
-3.353105, 3, -5.487395,
-3.353105, -2, -5.487395,
-3.525881, -2, -5.765642,
-3.353105, -1, -5.487395,
-3.525881, -1, -5.765642,
-3.353105, 0, -5.487395,
-3.525881, 0, -5.765642,
-3.353105, 1, -5.487395,
-3.525881, 1, -5.765642,
-3.353105, 2, -5.487395,
-3.525881, 2, -5.765642,
-3.353105, 3, -5.487395,
-3.525881, 3, -5.765642
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
-3.871432, -2, -6.322134, 0, -0.5, 0.5, 0.5,
-3.871432, -2, -6.322134, 1, -0.5, 0.5, 0.5,
-3.871432, -2, -6.322134, 1, 1.5, 0.5, 0.5,
-3.871432, -2, -6.322134, 0, 1.5, 0.5, 0.5,
-3.871432, -1, -6.322134, 0, -0.5, 0.5, 0.5,
-3.871432, -1, -6.322134, 1, -0.5, 0.5, 0.5,
-3.871432, -1, -6.322134, 1, 1.5, 0.5, 0.5,
-3.871432, -1, -6.322134, 0, 1.5, 0.5, 0.5,
-3.871432, 0, -6.322134, 0, -0.5, 0.5, 0.5,
-3.871432, 0, -6.322134, 1, -0.5, 0.5, 0.5,
-3.871432, 0, -6.322134, 1, 1.5, 0.5, 0.5,
-3.871432, 0, -6.322134, 0, 1.5, 0.5, 0.5,
-3.871432, 1, -6.322134, 0, -0.5, 0.5, 0.5,
-3.871432, 1, -6.322134, 1, -0.5, 0.5, 0.5,
-3.871432, 1, -6.322134, 1, 1.5, 0.5, 0.5,
-3.871432, 1, -6.322134, 0, 1.5, 0.5, 0.5,
-3.871432, 2, -6.322134, 0, -0.5, 0.5, 0.5,
-3.871432, 2, -6.322134, 1, -0.5, 0.5, 0.5,
-3.871432, 2, -6.322134, 1, 1.5, 0.5, 0.5,
-3.871432, 2, -6.322134, 0, 1.5, 0.5, 0.5,
-3.871432, 3, -6.322134, 0, -0.5, 0.5, 0.5,
-3.871432, 3, -6.322134, 1, -0.5, 0.5, 0.5,
-3.871432, 3, -6.322134, 1, 1.5, 0.5, 0.5,
-3.871432, 3, -6.322134, 0, 1.5, 0.5, 0.5
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
-3.353105, -2.943763, -4,
-3.353105, -2.943763, 4,
-3.353105, -2.943763, -4,
-3.525881, -3.105101, -4,
-3.353105, -2.943763, -2,
-3.525881, -3.105101, -2,
-3.353105, -2.943763, 0,
-3.525881, -3.105101, 0,
-3.353105, -2.943763, 2,
-3.525881, -3.105101, 2,
-3.353105, -2.943763, 4,
-3.525881, -3.105101, 4
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
-3.871432, -3.427776, -4, 0, -0.5, 0.5, 0.5,
-3.871432, -3.427776, -4, 1, -0.5, 0.5, 0.5,
-3.871432, -3.427776, -4, 1, 1.5, 0.5, 0.5,
-3.871432, -3.427776, -4, 0, 1.5, 0.5, 0.5,
-3.871432, -3.427776, -2, 0, -0.5, 0.5, 0.5,
-3.871432, -3.427776, -2, 1, -0.5, 0.5, 0.5,
-3.871432, -3.427776, -2, 1, 1.5, 0.5, 0.5,
-3.871432, -3.427776, -2, 0, 1.5, 0.5, 0.5,
-3.871432, -3.427776, 0, 0, -0.5, 0.5, 0.5,
-3.871432, -3.427776, 0, 1, -0.5, 0.5, 0.5,
-3.871432, -3.427776, 0, 1, 1.5, 0.5, 0.5,
-3.871432, -3.427776, 0, 0, 1.5, 0.5, 0.5,
-3.871432, -3.427776, 2, 0, -0.5, 0.5, 0.5,
-3.871432, -3.427776, 2, 1, -0.5, 0.5, 0.5,
-3.871432, -3.427776, 2, 1, 1.5, 0.5, 0.5,
-3.871432, -3.427776, 2, 0, 1.5, 0.5, 0.5,
-3.871432, -3.427776, 4, 0, -0.5, 0.5, 0.5,
-3.871432, -3.427776, 4, 1, -0.5, 0.5, 0.5,
-3.871432, -3.427776, 4, 1, 1.5, 0.5, 0.5,
-3.871432, -3.427776, 4, 0, 1.5, 0.5, 0.5
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
-3.353105, -2.943763, -5.487395,
-3.353105, 3.509749, -5.487395,
-3.353105, -2.943763, 5.642456,
-3.353105, 3.509749, 5.642456,
-3.353105, -2.943763, -5.487395,
-3.353105, -2.943763, 5.642456,
-3.353105, 3.509749, -5.487395,
-3.353105, 3.509749, 5.642456,
-3.353105, -2.943763, -5.487395,
3.557915, -2.943763, -5.487395,
-3.353105, -2.943763, 5.642456,
3.557915, -2.943763, 5.642456,
-3.353105, 3.509749, -5.487395,
3.557915, 3.509749, -5.487395,
-3.353105, 3.509749, 5.642456,
3.557915, 3.509749, 5.642456,
3.557915, -2.943763, -5.487395,
3.557915, 3.509749, -5.487395,
3.557915, -2.943763, 5.642456,
3.557915, 3.509749, 5.642456,
3.557915, -2.943763, -5.487395,
3.557915, -2.943763, 5.642456,
3.557915, 3.509749, -5.487395,
3.557915, 3.509749, 5.642456
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
var radius = 7.798377;
var distance = 34.69586;
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
mvMatrix.translate( -0.1024051, -0.2829932, -0.07753038 );
mvMatrix.scale( 1.220045, 1.306538, 0.7575805 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.69586);
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
bromopropylate_1-met<-read.table("bromopropylate_1-met.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bromopropylate_1-met$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromopropylate_1' not found
```

```r
y<-bromopropylate_1-met$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromopropylate_1' not found
```

```r
z<-bromopropylate_1-met$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromopropylate_1' not found
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
-3.252459, 0.4064896, -2.139488, 0, 0, 1, 1, 1,
-2.723656, 0.8107091, -2.577017, 1, 0, 0, 1, 1,
-2.408737, -0.7947305, -1.641521, 1, 0, 0, 1, 1,
-2.403644, 0.7898995, -1.117002, 1, 0, 0, 1, 1,
-2.26192, -0.1938775, -2.820975, 1, 0, 0, 1, 1,
-2.258634, 0.07366911, -1.679954, 1, 0, 0, 1, 1,
-2.258072, -0.4441713, -0.7487044, 0, 0, 0, 1, 1,
-2.247381, 0.6884903, -2.684045, 0, 0, 0, 1, 1,
-2.165619, -1.32393, -2.507806, 0, 0, 0, 1, 1,
-2.072338, -0.2080076, -1.141028, 0, 0, 0, 1, 1,
-2.015952, -0.9028308, -1.911225, 0, 0, 0, 1, 1,
-1.983985, 0.5578099, -0.5599431, 0, 0, 0, 1, 1,
-1.952903, 1.603645, 0.05554424, 0, 0, 0, 1, 1,
-1.94901, 1.813866, -0.4563862, 1, 1, 1, 1, 1,
-1.9488, -0.7823502, -2.671575, 1, 1, 1, 1, 1,
-1.9479, 0.4403175, -1.337354, 1, 1, 1, 1, 1,
-1.930633, -1.496112, -1.680692, 1, 1, 1, 1, 1,
-1.926235, -0.3545465, -0.806643, 1, 1, 1, 1, 1,
-1.874586, 0.1256479, 0.520813, 1, 1, 1, 1, 1,
-1.853691, -1.250388, -2.171933, 1, 1, 1, 1, 1,
-1.850689, 1.831414, -0.2289364, 1, 1, 1, 1, 1,
-1.848469, 1.342994, -1.059398, 1, 1, 1, 1, 1,
-1.838581, 1.478145, -1.564317, 1, 1, 1, 1, 1,
-1.830706, -0.0903931, -2.620809, 1, 1, 1, 1, 1,
-1.792953, 0.6395474, -0.7836009, 1, 1, 1, 1, 1,
-1.780484, -0.3503358, -2.531293, 1, 1, 1, 1, 1,
-1.774637, 0.2747155, -1.980469, 1, 1, 1, 1, 1,
-1.768295, -0.553887, -3.006875, 1, 1, 1, 1, 1,
-1.756219, -0.8475991, -1.533573, 0, 0, 1, 1, 1,
-1.742219, 0.1521615, -1.80479, 1, 0, 0, 1, 1,
-1.727836, 0.6201112, -3.228026, 1, 0, 0, 1, 1,
-1.725313, -1.52496, -1.286003, 1, 0, 0, 1, 1,
-1.712238, 0.3366069, -0.6536925, 1, 0, 0, 1, 1,
-1.707695, 0.2945437, -1.887558, 1, 0, 0, 1, 1,
-1.702156, -2.257334, -2.457761, 0, 0, 0, 1, 1,
-1.695525, 2.297597, -0.7692767, 0, 0, 0, 1, 1,
-1.676008, 1.656545, -1.889074, 0, 0, 0, 1, 1,
-1.672382, -0.7872332, -1.62745, 0, 0, 0, 1, 1,
-1.671499, 1.811551, -1.86961, 0, 0, 0, 1, 1,
-1.670418, -0.9171691, -1.54774, 0, 0, 0, 1, 1,
-1.668593, 0.5781714, -0.5129421, 0, 0, 0, 1, 1,
-1.662444, -0.2218564, -2.642205, 1, 1, 1, 1, 1,
-1.657827, 1.184542, -1.113551, 1, 1, 1, 1, 1,
-1.657713, 1.395664, -1.310707, 1, 1, 1, 1, 1,
-1.656876, 2.388285, -1.188251, 1, 1, 1, 1, 1,
-1.640545, -1.19333, -0.9350967, 1, 1, 1, 1, 1,
-1.626096, 1.198962, -0.1717616, 1, 1, 1, 1, 1,
-1.577103, -1.299008, -1.185904, 1, 1, 1, 1, 1,
-1.57101, -1.533035, -2.88503, 1, 1, 1, 1, 1,
-1.570728, -1.199567, -2.41825, 1, 1, 1, 1, 1,
-1.552661, 1.113814, -1.123142, 1, 1, 1, 1, 1,
-1.551079, -0.7468776, -2.85399, 1, 1, 1, 1, 1,
-1.549587, -0.02425166, -3.131384, 1, 1, 1, 1, 1,
-1.546137, -0.426418, -1.520935, 1, 1, 1, 1, 1,
-1.539512, -0.3053651, -1.799724, 1, 1, 1, 1, 1,
-1.529129, -0.03623993, -2.901299, 1, 1, 1, 1, 1,
-1.52428, 1.575417, -0.2814944, 0, 0, 1, 1, 1,
-1.516626, 0.2052404, -1.16597, 1, 0, 0, 1, 1,
-1.511579, -1.68153, -2.798711, 1, 0, 0, 1, 1,
-1.49892, -1.71922, -3.539024, 1, 0, 0, 1, 1,
-1.496669, -0.01457612, -1.84142, 1, 0, 0, 1, 1,
-1.490031, 0.7554781, -1.309488, 1, 0, 0, 1, 1,
-1.46639, -0.2825885, -1.89503, 0, 0, 0, 1, 1,
-1.444591, 2.081956, -1.258359, 0, 0, 0, 1, 1,
-1.444452, -1.463198, -1.958958, 0, 0, 0, 1, 1,
-1.436219, 0.1399349, -1.982394, 0, 0, 0, 1, 1,
-1.430716, -0.7804508, -2.294145, 0, 0, 0, 1, 1,
-1.422649, 0.1429285, -2.365776, 0, 0, 0, 1, 1,
-1.412962, 0.5875944, -2.1329, 0, 0, 0, 1, 1,
-1.408625, -1.297967, -4.003134, 1, 1, 1, 1, 1,
-1.405091, 1.716326, -0.7527456, 1, 1, 1, 1, 1,
-1.403653, 0.2162197, -1.371014, 1, 1, 1, 1, 1,
-1.392364, -1.128946, -0.879354, 1, 1, 1, 1, 1,
-1.385922, -0.1858743, -2.052905, 1, 1, 1, 1, 1,
-1.376099, 1.235449, -1.273995, 1, 1, 1, 1, 1,
-1.373715, -1.425194, -1.993061, 1, 1, 1, 1, 1,
-1.354628, -1.354005, -1.967267, 1, 1, 1, 1, 1,
-1.339692, -0.6012728, -2.354762, 1, 1, 1, 1, 1,
-1.331452, 0.2385964, -1.160729, 1, 1, 1, 1, 1,
-1.328331, -0.2440464, -2.365955, 1, 1, 1, 1, 1,
-1.322962, -1.34043, -2.27713, 1, 1, 1, 1, 1,
-1.310441, 0.179533, -1.276879, 1, 1, 1, 1, 1,
-1.30363, 1.417788, -0.6824509, 1, 1, 1, 1, 1,
-1.29554, 0.5281187, 0.1027408, 1, 1, 1, 1, 1,
-1.2934, -0.3341212, -0.8985107, 0, 0, 1, 1, 1,
-1.292212, 0.9759436, -0.7099054, 1, 0, 0, 1, 1,
-1.29057, 1.022433, -0.8100327, 1, 0, 0, 1, 1,
-1.279841, 0.2424127, -0.974503, 1, 0, 0, 1, 1,
-1.275154, 0.2418496, -1.560737, 1, 0, 0, 1, 1,
-1.274121, -0.7518424, -2.260183, 1, 0, 0, 1, 1,
-1.27166, -0.9149712, -2.127605, 0, 0, 0, 1, 1,
-1.269133, -0.2047843, -3.023761, 0, 0, 0, 1, 1,
-1.267691, 0.798453, -1.715743, 0, 0, 0, 1, 1,
-1.26483, 1.032498, 0.454507, 0, 0, 0, 1, 1,
-1.264426, 0.1442851, -1.733356, 0, 0, 0, 1, 1,
-1.263981, 0.6847025, -1.395139, 0, 0, 0, 1, 1,
-1.2538, -1.919975, -4.249563, 0, 0, 0, 1, 1,
-1.253258, -1.106629, -2.351424, 1, 1, 1, 1, 1,
-1.250694, 0.360269, -1.033054, 1, 1, 1, 1, 1,
-1.248929, -0.5308015, -2.808873, 1, 1, 1, 1, 1,
-1.243719, 0.6387593, 0.9049737, 1, 1, 1, 1, 1,
-1.24247, 1.307611, 0.6671579, 1, 1, 1, 1, 1,
-1.235371, -1.135646, -1.768439, 1, 1, 1, 1, 1,
-1.230134, -1.650621, -5.000113, 1, 1, 1, 1, 1,
-1.226402, 1.564368, -0.274913, 1, 1, 1, 1, 1,
-1.217883, 0.8039153, -0.6420447, 1, 1, 1, 1, 1,
-1.215127, -1.278939, -2.04404, 1, 1, 1, 1, 1,
-1.209015, 0.2850168, -0.8857709, 1, 1, 1, 1, 1,
-1.201083, 0.1919324, -0.7023348, 1, 1, 1, 1, 1,
-1.200984, -0.2200707, -4.570865, 1, 1, 1, 1, 1,
-1.199972, -1.720041, -2.542967, 1, 1, 1, 1, 1,
-1.175935, -0.7785338, -2.230655, 1, 1, 1, 1, 1,
-1.173685, 1.391716, -1.668303, 0, 0, 1, 1, 1,
-1.168455, 0.2287038, -0.7515299, 1, 0, 0, 1, 1,
-1.166862, -0.2932597, -1.821851, 1, 0, 0, 1, 1,
-1.166133, -0.1275775, -2.005207, 1, 0, 0, 1, 1,
-1.152072, -0.9714539, -3.668188, 1, 0, 0, 1, 1,
-1.150569, 0.9083454, -1.714027, 1, 0, 0, 1, 1,
-1.149898, -0.488759, -1.098216, 0, 0, 0, 1, 1,
-1.14974, -0.9337457, -2.878343, 0, 0, 0, 1, 1,
-1.145085, -0.2394006, -1.903884, 0, 0, 0, 1, 1,
-1.14009, -1.170706, -2.932926, 0, 0, 0, 1, 1,
-1.135967, -0.1608534, -1.12849, 0, 0, 0, 1, 1,
-1.128237, -2.580772, -4.969282, 0, 0, 0, 1, 1,
-1.126278, 0.7445521, -0.1438154, 0, 0, 0, 1, 1,
-1.117529, 0.6425477, 0.4617165, 1, 1, 1, 1, 1,
-1.11575, 2.795933, -0.7009721, 1, 1, 1, 1, 1,
-1.10612, -0.5591249, -1.484642, 1, 1, 1, 1, 1,
-1.105065, 0.2169775, -1.501864, 1, 1, 1, 1, 1,
-1.095563, -0.660922, -2.674638, 1, 1, 1, 1, 1,
-1.094189, 0.9592335, 0.1206309, 1, 1, 1, 1, 1,
-1.093255, -0.4300187, -2.578851, 1, 1, 1, 1, 1,
-1.084486, 0.6655146, -3.023041, 1, 1, 1, 1, 1,
-1.07141, -1.204732, -0.7662835, 1, 1, 1, 1, 1,
-1.057503, 0.7115456, -1.488302, 1, 1, 1, 1, 1,
-1.054713, -0.3518346, -3.130454, 1, 1, 1, 1, 1,
-1.046222, 0.8182264, -0.3578226, 1, 1, 1, 1, 1,
-1.045382, 1.759751, -2.247271, 1, 1, 1, 1, 1,
-1.036655, -0.7382249, -2.931412, 1, 1, 1, 1, 1,
-1.034466, 0.3416907, -0.9065399, 1, 1, 1, 1, 1,
-1.033228, -0.6036501, -2.5929, 0, 0, 1, 1, 1,
-1.030916, -0.4551378, -2.354578, 1, 0, 0, 1, 1,
-1.021805, 1.651152, -1.182746, 1, 0, 0, 1, 1,
-1.013282, -0.6558498, -2.232613, 1, 0, 0, 1, 1,
-1.009632, -0.09049103, -1.743725, 1, 0, 0, 1, 1,
-1.006601, 1.204514, 0.1112521, 1, 0, 0, 1, 1,
-1.005865, -1.149945, -1.317747, 0, 0, 0, 1, 1,
-1.001254, -0.1301761, -0.4675878, 0, 0, 0, 1, 1,
-1.001158, -0.1034465, -2.489722, 0, 0, 0, 1, 1,
-0.9982308, -0.07367644, -2.370415, 0, 0, 0, 1, 1,
-0.9980001, 0.3852564, -0.6213885, 0, 0, 0, 1, 1,
-0.9913476, -0.1990853, -1.553191, 0, 0, 0, 1, 1,
-0.9909555, -1.210361, -2.43358, 0, 0, 0, 1, 1,
-0.9898798, 0.1985096, -2.404809, 1, 1, 1, 1, 1,
-0.9889769, 1.045426, 0.4666503, 1, 1, 1, 1, 1,
-0.9857494, 0.7453755, -1.309118, 1, 1, 1, 1, 1,
-0.9842631, -0.363126, -0.8197183, 1, 1, 1, 1, 1,
-0.9837453, -1.352346, -1.236308, 1, 1, 1, 1, 1,
-0.9789208, -1.697355, -2.188701, 1, 1, 1, 1, 1,
-0.9714934, 0.9178536, -0.4965203, 1, 1, 1, 1, 1,
-0.9643849, 0.9027522, -1.574546, 1, 1, 1, 1, 1,
-0.9594809, 0.8086751, -0.2687535, 1, 1, 1, 1, 1,
-0.9593192, 0.2496307, 0.8200213, 1, 1, 1, 1, 1,
-0.9562331, 0.3396707, -0.6700848, 1, 1, 1, 1, 1,
-0.9530961, 3.415766, -0.490194, 1, 1, 1, 1, 1,
-0.9421769, 0.7959239, 0.13397, 1, 1, 1, 1, 1,
-0.93082, -1.839182, -2.703329, 1, 1, 1, 1, 1,
-0.9169351, -0.5513672, -2.80625, 1, 1, 1, 1, 1,
-0.916467, -0.7841113, -3.32089, 0, 0, 1, 1, 1,
-0.9124489, -0.4932486, -3.481406, 1, 0, 0, 1, 1,
-0.9088968, -0.3259888, -2.063401, 1, 0, 0, 1, 1,
-0.9028897, 0.09628901, -1.348727, 1, 0, 0, 1, 1,
-0.9021177, -1.967098, -4.602699, 1, 0, 0, 1, 1,
-0.899943, 0.1326762, -1.040033, 1, 0, 0, 1, 1,
-0.8918183, -0.2323796, -0.8238814, 0, 0, 0, 1, 1,
-0.8858942, -0.173943, -2.790878, 0, 0, 0, 1, 1,
-0.8802559, 0.7953636, -0.3830996, 0, 0, 0, 1, 1,
-0.8760326, -2.31633, -3.870046, 0, 0, 0, 1, 1,
-0.8725887, -0.7862242, -2.586524, 0, 0, 0, 1, 1,
-0.8723216, -0.4599916, -2.015119, 0, 0, 0, 1, 1,
-0.8718305, 0.09124728, -2.563173, 0, 0, 0, 1, 1,
-0.8702739, 0.9191028, -0.1887223, 1, 1, 1, 1, 1,
-0.8700482, -1.027398, -1.749001, 1, 1, 1, 1, 1,
-0.8652864, 1.374687, -0.6682826, 1, 1, 1, 1, 1,
-0.8618997, -1.167487, -2.742173, 1, 1, 1, 1, 1,
-0.8533435, -0.008818973, -1.476533, 1, 1, 1, 1, 1,
-0.8482898, -0.0633299, -1.608271, 1, 1, 1, 1, 1,
-0.8470264, 0.4845217, -0.7698444, 1, 1, 1, 1, 1,
-0.8416338, -0.3431276, -1.843029, 1, 1, 1, 1, 1,
-0.8407866, 1.013927, -2.239438, 1, 1, 1, 1, 1,
-0.836315, -1.659432, -1.97012, 1, 1, 1, 1, 1,
-0.8352939, -0.201428, -3.022522, 1, 1, 1, 1, 1,
-0.8340808, 0.570438, 0.7207747, 1, 1, 1, 1, 1,
-0.8318548, -1.369241, -3.847349, 1, 1, 1, 1, 1,
-0.8301368, 1.02073, -2.4606, 1, 1, 1, 1, 1,
-0.8241726, -1.730391, -1.820441, 1, 1, 1, 1, 1,
-0.8201074, 1.309149, -0.1806564, 0, 0, 1, 1, 1,
-0.817593, -1.748862, -1.991044, 1, 0, 0, 1, 1,
-0.814114, -1.840197, -4.234413, 1, 0, 0, 1, 1,
-0.8136297, 0.6330824, -1.366627, 1, 0, 0, 1, 1,
-0.8135324, -0.2166914, -1.005162, 1, 0, 0, 1, 1,
-0.8111945, 0.9891164, -1.212094, 1, 0, 0, 1, 1,
-0.8093231, 0.6097599, -1.63825, 0, 0, 0, 1, 1,
-0.8031413, 1.485455, 0.06792311, 0, 0, 0, 1, 1,
-0.8020001, -1.522443, -2.886501, 0, 0, 0, 1, 1,
-0.8001308, 1.193939, -0.9031303, 0, 0, 0, 1, 1,
-0.7989001, -0.1513549, -1.889565, 0, 0, 0, 1, 1,
-0.7971832, 0.6428679, -0.7563384, 0, 0, 0, 1, 1,
-0.79601, 1.456477, -0.7401583, 0, 0, 0, 1, 1,
-0.7914101, 1.356885, -0.7213482, 1, 1, 1, 1, 1,
-0.7878503, 0.7897581, -0.03197543, 1, 1, 1, 1, 1,
-0.7788771, 0.9736289, -0.8519844, 1, 1, 1, 1, 1,
-0.7745446, 0.1210404, -1.781435, 1, 1, 1, 1, 1,
-0.772646, -0.2444253, -2.129429, 1, 1, 1, 1, 1,
-0.7689468, 0.2654822, -1.484686, 1, 1, 1, 1, 1,
-0.7675553, 0.90088, 1.526667, 1, 1, 1, 1, 1,
-0.7626548, -0.7496186, -4.283256, 1, 1, 1, 1, 1,
-0.7545316, 0.613185, -0.9342095, 1, 1, 1, 1, 1,
-0.7533944, 0.645252, 0.002860284, 1, 1, 1, 1, 1,
-0.7532057, 1.520869, 0.3918642, 1, 1, 1, 1, 1,
-0.7417331, 0.3654663, -1.363774, 1, 1, 1, 1, 1,
-0.7386416, -1.035734, -2.114813, 1, 1, 1, 1, 1,
-0.7371097, 0.6760271, 0.6738707, 1, 1, 1, 1, 1,
-0.7311033, 1.279302, 0.5463101, 1, 1, 1, 1, 1,
-0.72908, 0.6200731, -0.2243495, 0, 0, 1, 1, 1,
-0.7138456, -0.1469509, -1.034108, 1, 0, 0, 1, 1,
-0.7117392, 1.214668, -0.4049159, 1, 0, 0, 1, 1,
-0.7107322, -0.3651446, -3.690709, 1, 0, 0, 1, 1,
-0.7097702, 2.136031, -1.711908, 1, 0, 0, 1, 1,
-0.709749, -1.906425, -2.100169, 1, 0, 0, 1, 1,
-0.7079236, 0.5827852, -0.2191134, 0, 0, 0, 1, 1,
-0.7073442, -1.180373, -1.530407, 0, 0, 0, 1, 1,
-0.7067873, 0.3121713, -0.4653139, 0, 0, 0, 1, 1,
-0.7032884, 0.3213095, -1.220162, 0, 0, 0, 1, 1,
-0.6982651, 0.5409115, -0.6220747, 0, 0, 0, 1, 1,
-0.6911603, 1.968709, -0.4237364, 0, 0, 0, 1, 1,
-0.69088, 0.5260602, -0.4910086, 0, 0, 0, 1, 1,
-0.6827722, 0.8257049, -0.3875696, 1, 1, 1, 1, 1,
-0.6775489, -0.06948157, -2.088566, 1, 1, 1, 1, 1,
-0.6690777, 0.2771615, -0.9575362, 1, 1, 1, 1, 1,
-0.6680473, 0.8964414, -1.435911, 1, 1, 1, 1, 1,
-0.6638047, -0.733292, -3.101646, 1, 1, 1, 1, 1,
-0.6618943, -0.9596646, -1.563464, 1, 1, 1, 1, 1,
-0.6564212, 1.523926, -1.288954, 1, 1, 1, 1, 1,
-0.6561361, 0.9747281, -0.738887, 1, 1, 1, 1, 1,
-0.655033, 1.479142, 0.5725467, 1, 1, 1, 1, 1,
-0.655022, 0.1579432, -1.774137, 1, 1, 1, 1, 1,
-0.6545112, -0.1830188, -0.6016113, 1, 1, 1, 1, 1,
-0.6494374, -0.1940107, -1.949809, 1, 1, 1, 1, 1,
-0.649193, -0.6320482, -2.521806, 1, 1, 1, 1, 1,
-0.6462661, 1.456467, -0.8799897, 1, 1, 1, 1, 1,
-0.6412293, 0.1419599, -2.286827, 1, 1, 1, 1, 1,
-0.6394674, -0.09515275, -2.354556, 0, 0, 1, 1, 1,
-0.6331969, -0.07074294, 1.741861, 1, 0, 0, 1, 1,
-0.632656, -0.9410364, -1.303645, 1, 0, 0, 1, 1,
-0.6305426, 0.009729765, -2.337945, 1, 0, 0, 1, 1,
-0.6294751, 1.40736, -0.07135209, 1, 0, 0, 1, 1,
-0.6279896, -1.0348, -3.073064, 1, 0, 0, 1, 1,
-0.6239287, 0.8650969, -2.039362, 0, 0, 0, 1, 1,
-0.6204562, -1.54682, -2.130961, 0, 0, 0, 1, 1,
-0.6104389, -0.3711387, -3.404481, 0, 0, 0, 1, 1,
-0.6094266, -2.697001, -3.9292, 0, 0, 0, 1, 1,
-0.6073363, -1.69073, -3.202154, 0, 0, 0, 1, 1,
-0.598698, 0.3978086, 0.06842269, 0, 0, 0, 1, 1,
-0.5966156, -0.641418, -2.033303, 0, 0, 0, 1, 1,
-0.5951641, -0.5556404, -3.29832, 1, 1, 1, 1, 1,
-0.594936, 1.413274, -0.1971247, 1, 1, 1, 1, 1,
-0.5933095, -0.5962778, 0.5699559, 1, 1, 1, 1, 1,
-0.5855993, 1.631122, 1.136949, 1, 1, 1, 1, 1,
-0.5803136, 0.2168379, -2.327046, 1, 1, 1, 1, 1,
-0.5767305, 2.976485, 0.6364955, 1, 1, 1, 1, 1,
-0.5697779, -0.2551098, -3.046256, 1, 1, 1, 1, 1,
-0.563558, 0.9802474, -1.843251, 1, 1, 1, 1, 1,
-0.5626884, -1.765378, -1.967702, 1, 1, 1, 1, 1,
-0.5599834, 0.1490283, -0.5779146, 1, 1, 1, 1, 1,
-0.5596387, 0.03030163, -2.102133, 1, 1, 1, 1, 1,
-0.5550804, -0.8422692, -2.428104, 1, 1, 1, 1, 1,
-0.5533363, -0.943727, -1.864453, 1, 1, 1, 1, 1,
-0.553318, 0.2287645, -2.229519, 1, 1, 1, 1, 1,
-0.5523146, 0.1312886, -3.245204, 1, 1, 1, 1, 1,
-0.5458806, -0.3995518, -1.879241, 0, 0, 1, 1, 1,
-0.5432394, 1.489127, -0.9320338, 1, 0, 0, 1, 1,
-0.5368711, 0.3842408, -2.235525, 1, 0, 0, 1, 1,
-0.532503, 1.08736, -1.366854, 1, 0, 0, 1, 1,
-0.525902, -2.84978, -3.472541, 1, 0, 0, 1, 1,
-0.5254742, -0.04972285, -2.70207, 1, 0, 0, 1, 1,
-0.5222119, -2.587862, -1.435955, 0, 0, 0, 1, 1,
-0.5199429, 1.524431, -0.602268, 0, 0, 0, 1, 1,
-0.5160908, 1.008504, -2.740484, 0, 0, 0, 1, 1,
-0.5157354, 0.09928618, -2.477582, 0, 0, 0, 1, 1,
-0.513379, -0.3573896, -1.570961, 0, 0, 0, 1, 1,
-0.5131937, 0.5543045, 1.5194, 0, 0, 0, 1, 1,
-0.5074909, -1.02468, -1.64336, 0, 0, 0, 1, 1,
-0.5037092, -0.1130167, -1.394217, 1, 1, 1, 1, 1,
-0.5008259, 0.930035, -0.6756774, 1, 1, 1, 1, 1,
-0.498338, -0.03547332, -2.098679, 1, 1, 1, 1, 1,
-0.4975379, 1.918865, 1.013103, 1, 1, 1, 1, 1,
-0.4956795, 0.9296918, -0.9795657, 1, 1, 1, 1, 1,
-0.4863827, 0.2757913, -0.9388518, 1, 1, 1, 1, 1,
-0.4863092, 0.4532027, -0.424794, 1, 1, 1, 1, 1,
-0.4837551, 1.013935, -2.660496, 1, 1, 1, 1, 1,
-0.474973, -0.1834205, -2.628721, 1, 1, 1, 1, 1,
-0.4743065, -0.4586766, -3.9213, 1, 1, 1, 1, 1,
-0.4710462, -1.242738, -4.089108, 1, 1, 1, 1, 1,
-0.4676626, -0.2041021, -1.970814, 1, 1, 1, 1, 1,
-0.4673027, -0.5428113, -3.069387, 1, 1, 1, 1, 1,
-0.4641472, -0.8547232, -3.437936, 1, 1, 1, 1, 1,
-0.4619614, 1.213896, 0.7299904, 1, 1, 1, 1, 1,
-0.460686, -0.05079015, -2.693102, 0, 0, 1, 1, 1,
-0.4598168, -0.1295627, -1.374452, 1, 0, 0, 1, 1,
-0.4576302, -2.489116, -3.548816, 1, 0, 0, 1, 1,
-0.4549732, 1.031181, 1.478583, 1, 0, 0, 1, 1,
-0.4540225, -1.560472, -1.787977, 1, 0, 0, 1, 1,
-0.4504829, -0.4095712, -2.435839, 1, 0, 0, 1, 1,
-0.4482961, 1.480782, -0.8186259, 0, 0, 0, 1, 1,
-0.4418864, 0.928431, 0.2570553, 0, 0, 0, 1, 1,
-0.4417481, 2.153584, -0.439308, 0, 0, 0, 1, 1,
-0.4394755, -0.1744904, -3.424579, 0, 0, 0, 1, 1,
-0.4310809, 1.197414, -0.2626404, 0, 0, 0, 1, 1,
-0.4281287, 0.579541, -0.6006585, 0, 0, 0, 1, 1,
-0.4223536, 0.3253743, -1.049893, 0, 0, 0, 1, 1,
-0.4155955, -0.9858485, -4.87783, 1, 1, 1, 1, 1,
-0.4155754, -0.2902455, 0.2112148, 1, 1, 1, 1, 1,
-0.4112843, 0.007469818, -2.119716, 1, 1, 1, 1, 1,
-0.4090614, 0.633845, 0.102651, 1, 1, 1, 1, 1,
-0.4073494, 1.438561, -0.9293231, 1, 1, 1, 1, 1,
-0.4067549, 0.7443072, -1.976379, 1, 1, 1, 1, 1,
-0.4065555, -1.635441, -3.096988, 1, 1, 1, 1, 1,
-0.4063227, 1.540478, -0.9319853, 1, 1, 1, 1, 1,
-0.4060478, -1.369703, -4.002238, 1, 1, 1, 1, 1,
-0.4051319, -0.9920479, -3.361735, 1, 1, 1, 1, 1,
-0.4016342, 2.574804, -1.249839, 1, 1, 1, 1, 1,
-0.3998308, 1.326617, -0.2863345, 1, 1, 1, 1, 1,
-0.3965848, -0.6498268, -1.424727, 1, 1, 1, 1, 1,
-0.3911302, -0.8008384, -4.768321, 1, 1, 1, 1, 1,
-0.3898781, -0.9888884, -1.954813, 1, 1, 1, 1, 1,
-0.3885548, -0.7154069, -1.134804, 0, 0, 1, 1, 1,
-0.3832427, 0.4470802, -0.9085779, 1, 0, 0, 1, 1,
-0.3812767, -0.1572319, -1.639694, 1, 0, 0, 1, 1,
-0.3810682, -1.76501, -3.813946, 1, 0, 0, 1, 1,
-0.3798005, 0.7184686, -0.1920198, 1, 0, 0, 1, 1,
-0.378021, -0.0798852, -0.09806875, 1, 0, 0, 1, 1,
-0.3771363, 1.218874, -1.067869, 0, 0, 0, 1, 1,
-0.3765217, -0.2995074, -1.310932, 0, 0, 0, 1, 1,
-0.3757759, -0.9795412, -1.587927, 0, 0, 0, 1, 1,
-0.3752538, 0.5560993, -3.00721, 0, 0, 0, 1, 1,
-0.3748949, 2.362191, -0.08961634, 0, 0, 0, 1, 1,
-0.3696178, 1.269098, -0.9760329, 0, 0, 0, 1, 1,
-0.3692091, -0.6998322, -2.955771, 0, 0, 0, 1, 1,
-0.3686064, 0.352527, -1.603532, 1, 1, 1, 1, 1,
-0.3644055, -0.8128104, -1.206443, 1, 1, 1, 1, 1,
-0.3614123, 0.2697903, -1.915943, 1, 1, 1, 1, 1,
-0.3577895, -2.125091, -3.743739, 1, 1, 1, 1, 1,
-0.3533547, 1.759726, -0.1726609, 1, 1, 1, 1, 1,
-0.3531204, -1.591196, -3.092367, 1, 1, 1, 1, 1,
-0.3524964, 1.058252, -2.445954, 1, 1, 1, 1, 1,
-0.3468211, 0.284667, -1.167306, 1, 1, 1, 1, 1,
-0.3443674, -0.1374097, -1.299986, 1, 1, 1, 1, 1,
-0.343041, -0.7665046, -2.662683, 1, 1, 1, 1, 1,
-0.3410216, 1.366658, 0.01501875, 1, 1, 1, 1, 1,
-0.3380688, -0.7529577, -2.893854, 1, 1, 1, 1, 1,
-0.336989, 0.2383009, -0.3436911, 1, 1, 1, 1, 1,
-0.3364372, 2.871763, -3.327238, 1, 1, 1, 1, 1,
-0.3348991, -0.548318, -3.343398, 1, 1, 1, 1, 1,
-0.3299704, 1.459322, -0.2822203, 0, 0, 1, 1, 1,
-0.3299347, -1.193662, -2.435648, 1, 0, 0, 1, 1,
-0.3297463, 0.04948194, -1.387719, 1, 0, 0, 1, 1,
-0.3273044, 0.6704729, -0.3002344, 1, 0, 0, 1, 1,
-0.3260609, 0.4457707, -1.151351, 1, 0, 0, 1, 1,
-0.3185461, 1.985448, 0.8146746, 1, 0, 0, 1, 1,
-0.3179544, 1.360695, 0.3293014, 0, 0, 0, 1, 1,
-0.3163399, 0.5757663, -1.312553, 0, 0, 0, 1, 1,
-0.3152573, 0.5084352, -0.676192, 0, 0, 0, 1, 1,
-0.3140938, 0.07684541, -1.981146, 0, 0, 0, 1, 1,
-0.3121012, 0.3833186, -0.8011003, 0, 0, 0, 1, 1,
-0.3098749, 0.4100296, 0.03526932, 0, 0, 0, 1, 1,
-0.3076185, 0.39687, -1.48365, 0, 0, 0, 1, 1,
-0.3074444, 0.6290799, 0.7173675, 1, 1, 1, 1, 1,
-0.3050456, -0.4678814, -0.2005164, 1, 1, 1, 1, 1,
-0.303826, 0.2079745, -2.279109, 1, 1, 1, 1, 1,
-0.3003556, -0.6363035, -4.012676, 1, 1, 1, 1, 1,
-0.2996743, 2.019168, -0.6306704, 1, 1, 1, 1, 1,
-0.2995255, -0.1526694, -1.26842, 1, 1, 1, 1, 1,
-0.2994476, 1.036224, 0.7958537, 1, 1, 1, 1, 1,
-0.2940976, 0.1409978, -1.033692, 1, 1, 1, 1, 1,
-0.2940496, -0.3685628, -2.1482, 1, 1, 1, 1, 1,
-0.2924252, 0.1758709, -0.7554842, 1, 1, 1, 1, 1,
-0.2915139, -0.3800858, -1.957361, 1, 1, 1, 1, 1,
-0.2890168, -0.4144552, -2.002227, 1, 1, 1, 1, 1,
-0.2880257, -0.2603924, -2.996162, 1, 1, 1, 1, 1,
-0.2875904, -0.7128868, -2.927199, 1, 1, 1, 1, 1,
-0.2847221, 0.3682156, -0.7285781, 1, 1, 1, 1, 1,
-0.2806138, -0.1864712, -0.9308609, 0, 0, 1, 1, 1,
-0.2796667, -0.1115761, -2.514346, 1, 0, 0, 1, 1,
-0.2758022, -1.293879, -3.357903, 1, 0, 0, 1, 1,
-0.2749555, 1.065453, 0.3476626, 1, 0, 0, 1, 1,
-0.2748086, -0.5418018, -3.171751, 1, 0, 0, 1, 1,
-0.2737049, -0.2050602, -0.4891602, 1, 0, 0, 1, 1,
-0.2668291, 0.4928396, -2.226666, 0, 0, 0, 1, 1,
-0.264217, -1.256161, -1.743886, 0, 0, 0, 1, 1,
-0.2626465, 0.5255991, -1.775254, 0, 0, 0, 1, 1,
-0.2619195, 0.003707979, -2.999175, 0, 0, 0, 1, 1,
-0.2595605, 1.021907, 1.48956, 0, 0, 0, 1, 1,
-0.2580231, -1.297425, -3.51755, 0, 0, 0, 1, 1,
-0.2563594, -0.3922006, -3.489439, 0, 0, 0, 1, 1,
-0.2559088, -1.858774, -3.127519, 1, 1, 1, 1, 1,
-0.2532099, 0.8076892, -1.42167, 1, 1, 1, 1, 1,
-0.2503849, -0.6259242, -2.143239, 1, 1, 1, 1, 1,
-0.242703, 2.444114, 0.6483768, 1, 1, 1, 1, 1,
-0.2404973, -0.1737326, -1.757572, 1, 1, 1, 1, 1,
-0.2399055, -0.09287018, -0.9873773, 1, 1, 1, 1, 1,
-0.2389975, -0.9602582, -3.051131, 1, 1, 1, 1, 1,
-0.2342731, 1.562683, -0.7379783, 1, 1, 1, 1, 1,
-0.2325435, -1.492631, -3.344876, 1, 1, 1, 1, 1,
-0.2302232, -2.517278, -1.944118, 1, 1, 1, 1, 1,
-0.2299583, -0.7971957, -3.982244, 1, 1, 1, 1, 1,
-0.2239973, 0.1524376, -1.500371, 1, 1, 1, 1, 1,
-0.2238827, 0.4317377, -2.720659, 1, 1, 1, 1, 1,
-0.2185742, 0.04976429, -2.999874, 1, 1, 1, 1, 1,
-0.214632, -2.196202, -3.910172, 1, 1, 1, 1, 1,
-0.2129922, -0.4067306, -3.218942, 0, 0, 1, 1, 1,
-0.2101321, 0.0605372, -1.348953, 1, 0, 0, 1, 1,
-0.2092872, -0.5022035, -2.775274, 1, 0, 0, 1, 1,
-0.2078026, 0.7947271, -1.55136, 1, 0, 0, 1, 1,
-0.2029293, 1.882936, 1.306519, 1, 0, 0, 1, 1,
-0.2020887, 0.9677004, -0.6588101, 1, 0, 0, 1, 1,
-0.2017031, 0.532138, 0.3817204, 0, 0, 0, 1, 1,
-0.1991122, -0.8128012, -2.526219, 0, 0, 0, 1, 1,
-0.1983358, 1.136224, 0.2393991, 0, 0, 0, 1, 1,
-0.1981559, -1.227715, -2.69544, 0, 0, 0, 1, 1,
-0.1944791, 1.801205, 0.8625999, 0, 0, 0, 1, 1,
-0.1913596, 0.4409217, 0.1777656, 0, 0, 0, 1, 1,
-0.1912185, 2.084275, 0.6264384, 0, 0, 0, 1, 1,
-0.1875346, 1.925179, 1.061231, 1, 1, 1, 1, 1,
-0.1871306, -0.8114625, -2.809525, 1, 1, 1, 1, 1,
-0.1836863, 0.7615411, -0.6983503, 1, 1, 1, 1, 1,
-0.1822944, 0.4154324, -1.507406, 1, 1, 1, 1, 1,
-0.1806089, -0.7459824, -2.617682, 1, 1, 1, 1, 1,
-0.1772666, -0.6005723, -2.618879, 1, 1, 1, 1, 1,
-0.1745758, -0.09777855, -2.551605, 1, 1, 1, 1, 1,
-0.1692156, -0.09528466, -2.111869, 1, 1, 1, 1, 1,
-0.1680835, -0.3282022, -2.900298, 1, 1, 1, 1, 1,
-0.165807, -0.04234992, -2.563871, 1, 1, 1, 1, 1,
-0.1655816, 0.6858884, -2.287455, 1, 1, 1, 1, 1,
-0.164269, 0.4263434, 0.0304672, 1, 1, 1, 1, 1,
-0.1637514, 0.7523747, -1.193164, 1, 1, 1, 1, 1,
-0.1619689, -1.165664, -2.45356, 1, 1, 1, 1, 1,
-0.1597422, -0.5902784, -2.765399, 1, 1, 1, 1, 1,
-0.1508328, -0.5886796, -2.180386, 0, 0, 1, 1, 1,
-0.1416707, 0.5524459, -0.7404364, 1, 0, 0, 1, 1,
-0.1412249, 0.541154, -1.287551, 1, 0, 0, 1, 1,
-0.1410259, 0.487094, -1.612058, 1, 0, 0, 1, 1,
-0.1400827, 1.107029, -1.080359, 1, 0, 0, 1, 1,
-0.1375661, 0.5130731, 0.307498, 1, 0, 0, 1, 1,
-0.1373069, -0.010133, -1.980793, 0, 0, 0, 1, 1,
-0.1363657, -0.23058, -4.300952, 0, 0, 0, 1, 1,
-0.1316627, -0.08612575, -2.037688, 0, 0, 0, 1, 1,
-0.123521, -0.6193073, -1.508937, 0, 0, 0, 1, 1,
-0.121597, 1.920823, -0.4919557, 0, 0, 0, 1, 1,
-0.1196023, -0.7110418, -2.273637, 0, 0, 0, 1, 1,
-0.11942, 0.2582441, -1.158863, 0, 0, 0, 1, 1,
-0.1168918, 1.315594, 0.1637365, 1, 1, 1, 1, 1,
-0.1134216, -0.6185741, -2.596634, 1, 1, 1, 1, 1,
-0.1133363, -0.6872576, -2.461461, 1, 1, 1, 1, 1,
-0.1113116, 0.6920364, -0.3913187, 1, 1, 1, 1, 1,
-0.1076993, -1.206015, -2.757726, 1, 1, 1, 1, 1,
-0.1076193, -0.2290893, -3.160538, 1, 1, 1, 1, 1,
-0.1059523, 0.9597574, 0.526649, 1, 1, 1, 1, 1,
-0.1036907, -0.5516984, -3.272813, 1, 1, 1, 1, 1,
-0.1017225, -2.362762, -2.478056, 1, 1, 1, 1, 1,
-0.1003643, -0.1885735, -2.65789, 1, 1, 1, 1, 1,
-0.09973302, 0.3246407, 0.4236221, 1, 1, 1, 1, 1,
-0.09672016, 1.073358, -1.952036, 1, 1, 1, 1, 1,
-0.09644213, -0.1319551, -1.512289, 1, 1, 1, 1, 1,
-0.09387865, -2.089446, -4.023193, 1, 1, 1, 1, 1,
-0.0919854, -0.1488223, -2.51624, 1, 1, 1, 1, 1,
-0.08928598, 2.016928, 0.112791, 0, 0, 1, 1, 1,
-0.08913165, 0.6156567, -0.7699205, 1, 0, 0, 1, 1,
-0.08282714, -1.34752, -3.846643, 1, 0, 0, 1, 1,
-0.08235696, -1.776494, -1.72691, 1, 0, 0, 1, 1,
-0.07910798, 0.3590439, 0.2417146, 1, 0, 0, 1, 1,
-0.07809098, 0.8393256, -0.06085093, 1, 0, 0, 1, 1,
-0.0769483, 0.8677022, -2.292811, 0, 0, 0, 1, 1,
-0.07614052, 0.3443862, -1.332343, 0, 0, 0, 1, 1,
-0.07558595, 1.712653, 1.445295, 0, 0, 0, 1, 1,
-0.07524996, 0.3963276, -0.07650635, 0, 0, 0, 1, 1,
-0.06917275, -1.558255, -1.942847, 0, 0, 0, 1, 1,
-0.068647, -1.087195, -3.12595, 0, 0, 0, 1, 1,
-0.06583947, -0.7271505, -1.881493, 0, 0, 0, 1, 1,
-0.06396378, -1.155382, -2.603638, 1, 1, 1, 1, 1,
-0.06171122, -0.6214617, -2.165751, 1, 1, 1, 1, 1,
-0.05838732, 0.6132685, 0.2510022, 1, 1, 1, 1, 1,
-0.05695083, -0.1819096, -2.707438, 1, 1, 1, 1, 1,
-0.05550612, 1.905817, 0.4339884, 1, 1, 1, 1, 1,
-0.04777358, -0.2338406, -3.829101, 1, 1, 1, 1, 1,
-0.04103528, -2.191808, -5.32531, 1, 1, 1, 1, 1,
-0.03862515, -0.1376877, -3.495001, 1, 1, 1, 1, 1,
-0.034004, -0.9582, -4.071901, 1, 1, 1, 1, 1,
-0.03243333, -0.6176638, -2.537457, 1, 1, 1, 1, 1,
-0.02989442, 0.2786186, -1.653444, 1, 1, 1, 1, 1,
-0.0288917, 0.5109351, -2.166452, 1, 1, 1, 1, 1,
-0.0176715, -0.796626, -3.264319, 1, 1, 1, 1, 1,
-0.01265013, -0.7286185, -2.31029, 1, 1, 1, 1, 1,
-0.01031737, 1.381464, -0.2570385, 1, 1, 1, 1, 1,
-0.006690607, 0.926886, -0.6771781, 0, 0, 1, 1, 1,
0.00102189, -0.2030258, 2.787647, 1, 0, 0, 1, 1,
0.003561886, -0.9627953, 4.14979, 1, 0, 0, 1, 1,
0.007332633, -0.8347571, 3.199076, 1, 0, 0, 1, 1,
0.0105444, 0.1154996, 1.559675, 1, 0, 0, 1, 1,
0.01457461, 0.27558, -0.6291522, 1, 0, 0, 1, 1,
0.01639905, 0.7018831, 1.473617, 0, 0, 0, 1, 1,
0.02040147, -0.07810619, 3.735334, 0, 0, 0, 1, 1,
0.02082305, -0.5211442, 3.76351, 0, 0, 0, 1, 1,
0.02663128, 1.207357, 0.6157143, 0, 0, 0, 1, 1,
0.02794282, -0.513466, 2.522037, 0, 0, 0, 1, 1,
0.03222549, 0.1778727, 0.4641648, 0, 0, 0, 1, 1,
0.03238987, -1.351858, 2.375348, 0, 0, 0, 1, 1,
0.0344174, -0.07372104, 3.814661, 1, 1, 1, 1, 1,
0.04077881, 0.3222386, 0.1246858, 1, 1, 1, 1, 1,
0.0424931, -0.2679729, 0.6197649, 1, 1, 1, 1, 1,
0.04452381, -0.8762094, 3.700302, 1, 1, 1, 1, 1,
0.04459307, -0.7087331, 3.146698, 1, 1, 1, 1, 1,
0.04461452, 1.298678, 0.8747684, 1, 1, 1, 1, 1,
0.04474029, 0.4464108, 0.6964436, 1, 1, 1, 1, 1,
0.04901813, -0.5631618, 4.469805, 1, 1, 1, 1, 1,
0.05346763, -0.8799832, 1.189276, 1, 1, 1, 1, 1,
0.05522842, 0.03364339, 0.1944671, 1, 1, 1, 1, 1,
0.05855291, 0.441253, -1.055792, 1, 1, 1, 1, 1,
0.06012655, 1.670237, 0.8885276, 1, 1, 1, 1, 1,
0.06378496, -2.200319, 4.505459, 1, 1, 1, 1, 1,
0.06479581, 1.650056, -0.5905203, 1, 1, 1, 1, 1,
0.06677008, 2.305961, -0.1678421, 1, 1, 1, 1, 1,
0.06730674, 0.8651937, 0.4131718, 0, 0, 1, 1, 1,
0.07172859, 0.1496719, -0.0960677, 1, 0, 0, 1, 1,
0.07497853, -0.4583691, 2.198355, 1, 0, 0, 1, 1,
0.07762664, 0.4700456, 0.004211749, 1, 0, 0, 1, 1,
0.08476642, 0.2003175, 0.1910579, 1, 0, 0, 1, 1,
0.08603796, 0.4293266, 0.6367693, 1, 0, 0, 1, 1,
0.08835506, -0.6408406, 2.593405, 0, 0, 0, 1, 1,
0.0889983, -0.1540399, 1.944226, 0, 0, 0, 1, 1,
0.08920645, 1.976255, 0.5224901, 0, 0, 0, 1, 1,
0.09284831, -0.7379292, 1.828462, 0, 0, 0, 1, 1,
0.09477008, -0.817735, 1.731394, 0, 0, 0, 1, 1,
0.09639134, 0.3155425, -0.3684006, 0, 0, 0, 1, 1,
0.0982042, 0.05906204, 0.5806301, 0, 0, 0, 1, 1,
0.1017708, 1.201622, -1.01527, 1, 1, 1, 1, 1,
0.1071054, 1.411366, -0.1190194, 1, 1, 1, 1, 1,
0.1091545, 1.591598, 0.477109, 1, 1, 1, 1, 1,
0.1178779, 0.2941882, 2.168495, 1, 1, 1, 1, 1,
0.1233436, 0.18535, 0.5484011, 1, 1, 1, 1, 1,
0.1282735, -0.2937377, 2.40645, 1, 1, 1, 1, 1,
0.1297341, -0.2264071, 0.9824077, 1, 1, 1, 1, 1,
0.1320759, -0.6551096, 3.344347, 1, 1, 1, 1, 1,
0.1326312, 0.7141106, -0.7229532, 1, 1, 1, 1, 1,
0.1369031, -0.4943056, 4.457326, 1, 1, 1, 1, 1,
0.1385873, -0.09049683, 4.547409, 1, 1, 1, 1, 1,
0.1387066, 0.152085, 0.5483366, 1, 1, 1, 1, 1,
0.1401012, -0.7221355, 3.53382, 1, 1, 1, 1, 1,
0.1448337, -0.1299461, 2.476133, 1, 1, 1, 1, 1,
0.1449784, 2.915243, -0.7534377, 1, 1, 1, 1, 1,
0.1450511, -1.114271, 1.243523, 0, 0, 1, 1, 1,
0.1473729, -1.13217, 3.050277, 1, 0, 0, 1, 1,
0.1489975, 1.463385, 1.575589, 1, 0, 0, 1, 1,
0.149618, -0.1331018, 3.299609, 1, 0, 0, 1, 1,
0.1564113, -0.9149969, 2.644098, 1, 0, 0, 1, 1,
0.1592888, 0.549018, 0.1717077, 1, 0, 0, 1, 1,
0.1600977, -1.921151, 2.491616, 0, 0, 0, 1, 1,
0.1628259, -1.145129, 3.350822, 0, 0, 0, 1, 1,
0.1653223, 0.4149681, 0.279755, 0, 0, 0, 1, 1,
0.1654772, -0.1806524, 3.267337, 0, 0, 0, 1, 1,
0.1671247, 0.9389758, -0.5290017, 0, 0, 0, 1, 1,
0.1672669, -1.483647, 2.284797, 0, 0, 0, 1, 1,
0.1677928, -0.8201881, 3.254349, 0, 0, 0, 1, 1,
0.1700551, -0.7020928, 4.419047, 1, 1, 1, 1, 1,
0.1703013, 1.03734, 0.2090471, 1, 1, 1, 1, 1,
0.1719054, 2.10872, 0.5998785, 1, 1, 1, 1, 1,
0.1737843, 1.233395, 1.922364, 1, 1, 1, 1, 1,
0.1777624, 0.4105123, 1.957425, 1, 1, 1, 1, 1,
0.1818618, 0.7975652, 0.1039595, 1, 1, 1, 1, 1,
0.1856856, -0.357456, 0.3802648, 1, 1, 1, 1, 1,
0.1868998, -0.4394084, 4.076212, 1, 1, 1, 1, 1,
0.1878983, 0.1210571, 2.354017, 1, 1, 1, 1, 1,
0.1889968, -2.607716, 2.407727, 1, 1, 1, 1, 1,
0.1942062, 0.7186167, -0.2138297, 1, 1, 1, 1, 1,
0.1953105, 1.355112, 0.1182293, 1, 1, 1, 1, 1,
0.2018264, 1.224806, 0.02952983, 1, 1, 1, 1, 1,
0.2018338, -0.5665181, 3.133335, 1, 1, 1, 1, 1,
0.2019548, -0.8872948, 3.587165, 1, 1, 1, 1, 1,
0.2048117, 0.3985544, 0.2812359, 0, 0, 1, 1, 1,
0.2101091, -1.458551, 1.069519, 1, 0, 0, 1, 1,
0.2106983, 0.203504, -0.5430612, 1, 0, 0, 1, 1,
0.2145582, -0.7842084, 3.302757, 1, 0, 0, 1, 1,
0.2172333, -0.8381086, 1.932255, 1, 0, 0, 1, 1,
0.2321518, 0.1963628, -0.9996012, 1, 0, 0, 1, 1,
0.2369628, -0.5180934, 1.985527, 0, 0, 0, 1, 1,
0.2375144, -0.4981179, 3.595315, 0, 0, 0, 1, 1,
0.239804, 1.382899, -1.959661, 0, 0, 0, 1, 1,
0.2408269, 0.2625089, 1.169378, 0, 0, 0, 1, 1,
0.2427461, -0.3922833, 3.492077, 0, 0, 0, 1, 1,
0.2439129, -1.391491, 3.881914, 0, 0, 0, 1, 1,
0.2441322, 0.03055941, 1.584818, 0, 0, 0, 1, 1,
0.2481944, 0.4990055, 0.2187289, 1, 1, 1, 1, 1,
0.2500348, -0.6535284, 4.818752, 1, 1, 1, 1, 1,
0.2526719, -0.3023888, 1.9008, 1, 1, 1, 1, 1,
0.2542146, -0.5051242, 5.480371, 1, 1, 1, 1, 1,
0.2544957, -0.4088942, 5.325352, 1, 1, 1, 1, 1,
0.2676649, -0.1654389, 3.018191, 1, 1, 1, 1, 1,
0.2713133, -0.5599536, 2.764708, 1, 1, 1, 1, 1,
0.2720885, 0.6838884, -1.098557, 1, 1, 1, 1, 1,
0.2735815, 1.087177, 0.1297546, 1, 1, 1, 1, 1,
0.2782045, 1.130054, 1.444175, 1, 1, 1, 1, 1,
0.2809648, 0.6614467, -0.420283, 1, 1, 1, 1, 1,
0.2820649, -1.10507, 2.266417, 1, 1, 1, 1, 1,
0.2841347, 1.925537, -0.01545496, 1, 1, 1, 1, 1,
0.28715, 0.3684699, -0.3854004, 1, 1, 1, 1, 1,
0.2990935, -2.52526, 3.41421, 1, 1, 1, 1, 1,
0.3003139, 0.2908324, 2.396302, 0, 0, 1, 1, 1,
0.3028172, -2.226483, 1.1366, 1, 0, 0, 1, 1,
0.303811, -1.51424, 2.44742, 1, 0, 0, 1, 1,
0.3069625, 1.144718, 0.1716824, 1, 0, 0, 1, 1,
0.3079993, 1.336517, -0.287117, 1, 0, 0, 1, 1,
0.3100232, -2.02554, 4.151835, 1, 0, 0, 1, 1,
0.3117016, -0.4199037, 0.9687193, 0, 0, 0, 1, 1,
0.315133, 0.5665888, 1.330577, 0, 0, 0, 1, 1,
0.3159369, 0.1739128, 2.220465, 0, 0, 0, 1, 1,
0.3167966, -0.5363983, 1.752024, 0, 0, 0, 1, 1,
0.3203685, -1.7271, 2.988006, 0, 0, 0, 1, 1,
0.3212811, 1.104335, -0.05229577, 0, 0, 0, 1, 1,
0.3232032, -1.63009, 1.435977, 0, 0, 0, 1, 1,
0.3287135, -0.2200384, 3.926746, 1, 1, 1, 1, 1,
0.3325794, 0.0215371, -0.003192097, 1, 1, 1, 1, 1,
0.333611, 1.436673, 1.465951, 1, 1, 1, 1, 1,
0.3352597, -1.164479, 2.423273, 1, 1, 1, 1, 1,
0.3395255, 0.8592668, -0.376614, 1, 1, 1, 1, 1,
0.3456744, -1.107459, 2.030497, 1, 1, 1, 1, 1,
0.3478389, 1.576286, 0.3199463, 1, 1, 1, 1, 1,
0.3505965, 1.227012, 0.9083033, 1, 1, 1, 1, 1,
0.3519572, 0.3197722, 1.824996, 1, 1, 1, 1, 1,
0.3544501, 0.736218, 1.735407, 1, 1, 1, 1, 1,
0.3583896, 0.4474929, 0.7847863, 1, 1, 1, 1, 1,
0.3600052, -1.097674, 2.525725, 1, 1, 1, 1, 1,
0.3627076, -1.062296, 4.603593, 1, 1, 1, 1, 1,
0.3629878, -0.3208058, 1.9462, 1, 1, 1, 1, 1,
0.3637957, -1.934007, 1.885669, 1, 1, 1, 1, 1,
0.3642496, 0.5623468, -0.5925775, 0, 0, 1, 1, 1,
0.3652109, -1.448512, 2.29573, 1, 0, 0, 1, 1,
0.3652187, 0.259699, 0.3579056, 1, 0, 0, 1, 1,
0.3715574, 0.6588026, -1.798497, 1, 0, 0, 1, 1,
0.3716452, -0.9450948, 3.733645, 1, 0, 0, 1, 1,
0.3756517, 2.299838, -0.4709762, 1, 0, 0, 1, 1,
0.3772751, 1.10088, -0.1385015, 0, 0, 0, 1, 1,
0.3786893, -0.1780874, 0.1882331, 0, 0, 0, 1, 1,
0.3795219, 0.4093346, 2.101314, 0, 0, 0, 1, 1,
0.3846006, 0.3637738, 1.31764, 0, 0, 0, 1, 1,
0.3850833, -0.4869759, 2.595887, 0, 0, 0, 1, 1,
0.3875103, -0.7707586, 2.566065, 0, 0, 0, 1, 1,
0.3881815, 0.9509536, 0.02205239, 0, 0, 0, 1, 1,
0.3919913, 1.617401, -0.3287667, 1, 1, 1, 1, 1,
0.3923131, -0.1180353, 1.957922, 1, 1, 1, 1, 1,
0.3998719, 0.547015, 1.821103, 1, 1, 1, 1, 1,
0.4008952, 1.270084, 0.3436322, 1, 1, 1, 1, 1,
0.4021119, -2.780558, 4.29003, 1, 1, 1, 1, 1,
0.4044262, 3.256853, 0.8276963, 1, 1, 1, 1, 1,
0.4054591, 0.0706413, 1.177888, 1, 1, 1, 1, 1,
0.4095179, 1.087197, -0.7422205, 1, 1, 1, 1, 1,
0.4108027, 1.029148, 2.753922, 1, 1, 1, 1, 1,
0.4136447, 1.916021, -0.6917436, 1, 1, 1, 1, 1,
0.4152423, -0.2846917, 2.563699, 1, 1, 1, 1, 1,
0.4186965, -0.6377882, 2.822816, 1, 1, 1, 1, 1,
0.4213913, 0.9432164, -0.3865276, 1, 1, 1, 1, 1,
0.426548, 0.8584368, 0.6309498, 1, 1, 1, 1, 1,
0.4286128, 1.650957, 1.949413, 1, 1, 1, 1, 1,
0.4295421, -0.07282083, 1.838262, 0, 0, 1, 1, 1,
0.4306499, -0.2887141, 0.2112699, 1, 0, 0, 1, 1,
0.43314, -0.983395, 2.241123, 1, 0, 0, 1, 1,
0.4366907, 0.07224564, 1.43508, 1, 0, 0, 1, 1,
0.4401537, -0.9627486, 2.009511, 1, 0, 0, 1, 1,
0.441835, 0.05741076, 0.7955655, 1, 0, 0, 1, 1,
0.4419448, 1.107387, 1.061863, 0, 0, 0, 1, 1,
0.4423874, 1.165808, 0.0003408206, 0, 0, 0, 1, 1,
0.4459987, 1.938823, -0.8681743, 0, 0, 0, 1, 1,
0.447423, -0.9097204, 2.591204, 0, 0, 0, 1, 1,
0.4474846, -0.3127933, 1.195798, 0, 0, 0, 1, 1,
0.4516047, -1.150855, 1.929442, 0, 0, 0, 1, 1,
0.4558751, -1.007876, 3.117756, 0, 0, 0, 1, 1,
0.4644028, 0.5512956, 0.2493519, 1, 1, 1, 1, 1,
0.4672105, 0.2552713, 2.673447, 1, 1, 1, 1, 1,
0.4703823, 1.356403, -0.1520942, 1, 1, 1, 1, 1,
0.4721698, 0.154594, 2.339236, 1, 1, 1, 1, 1,
0.475521, 0.3876415, 1.734459, 1, 1, 1, 1, 1,
0.4772669, -1.12847, 4.364733, 1, 1, 1, 1, 1,
0.4776859, 0.2613088, 1.572087, 1, 1, 1, 1, 1,
0.483823, -0.4739145, 1.310935, 1, 1, 1, 1, 1,
0.4890271, -0.5028507, 2.1327, 1, 1, 1, 1, 1,
0.4901395, 0.5713837, 0.05367509, 1, 1, 1, 1, 1,
0.4962632, -0.4870724, 2.340781, 1, 1, 1, 1, 1,
0.4979542, -0.2045932, 1.614967, 1, 1, 1, 1, 1,
0.4996344, 0.5870766, 1.195798, 1, 1, 1, 1, 1,
0.5007372, -0.8106704, 3.310487, 1, 1, 1, 1, 1,
0.5046349, -0.05139167, 2.434576, 1, 1, 1, 1, 1,
0.5083935, -0.6831017, 4.427035, 0, 0, 1, 1, 1,
0.5107771, 0.04884798, 0.5656627, 1, 0, 0, 1, 1,
0.5132778, 1.476782, -1.151069, 1, 0, 0, 1, 1,
0.5156522, -0.8396599, 2.94101, 1, 0, 0, 1, 1,
0.5157724, -0.07522721, 2.952268, 1, 0, 0, 1, 1,
0.5164821, 0.06958218, 1.451047, 1, 0, 0, 1, 1,
0.5205432, -0.4421171, 1.840408, 0, 0, 0, 1, 1,
0.5213907, 0.3227642, -0.134686, 0, 0, 0, 1, 1,
0.5244671, -1.042053, 5.251375, 0, 0, 0, 1, 1,
0.5255505, 0.5601621, 0.4694967, 0, 0, 0, 1, 1,
0.5256754, 1.093266, 1.77258, 0, 0, 0, 1, 1,
0.5345345, 1.512673, 0.6567101, 0, 0, 0, 1, 1,
0.5451431, 0.6523799, 0.6902559, 0, 0, 0, 1, 1,
0.5483707, -0.1024522, 1.914974, 1, 1, 1, 1, 1,
0.549939, -1.000684, 3.956724, 1, 1, 1, 1, 1,
0.5568582, -0.8483229, 2.798038, 1, 1, 1, 1, 1,
0.5569856, -0.7857085, 2.887446, 1, 1, 1, 1, 1,
0.5575141, 1.004223, 1.003917, 1, 1, 1, 1, 1,
0.5587091, -1.122611, 3.550185, 1, 1, 1, 1, 1,
0.5592369, -0.7548886, 2.539495, 1, 1, 1, 1, 1,
0.5611589, 0.007088726, 0.6911651, 1, 1, 1, 1, 1,
0.5657784, -0.3531605, 1.334209, 1, 1, 1, 1, 1,
0.5660607, 0.8262046, 1.070409, 1, 1, 1, 1, 1,
0.5670173, -0.4193688, 2.852334, 1, 1, 1, 1, 1,
0.5741536, 0.01987001, 2.044773, 1, 1, 1, 1, 1,
0.57564, -0.2775881, 0.487871, 1, 1, 1, 1, 1,
0.5789067, -1.703213, 2.854622, 1, 1, 1, 1, 1,
0.5819902, 0.647852, -0.2685015, 1, 1, 1, 1, 1,
0.582638, 0.5526788, 0.9507273, 0, 0, 1, 1, 1,
0.5906117, -1.29978, 0.6853064, 1, 0, 0, 1, 1,
0.5990753, 0.6078636, 0.7987441, 1, 0, 0, 1, 1,
0.60192, -2.284986, 3.189987, 1, 0, 0, 1, 1,
0.6071847, 0.004135899, -0.1827435, 1, 0, 0, 1, 1,
0.6104758, 0.1323283, 2.747178, 1, 0, 0, 1, 1,
0.6159909, -1.632905, 2.840822, 0, 0, 0, 1, 1,
0.6169794, 1.036534, 1.362496, 0, 0, 0, 1, 1,
0.6237492, -0.5150602, 0.2307998, 0, 0, 0, 1, 1,
0.6277751, -0.2835284, 2.794652, 0, 0, 0, 1, 1,
0.6302182, 1.712029, 1.421124, 0, 0, 0, 1, 1,
0.6369311, -0.01793129, 1.177009, 0, 0, 0, 1, 1,
0.6414112, -0.164871, 2.300199, 0, 0, 0, 1, 1,
0.6419244, -0.6028641, 2.196563, 1, 1, 1, 1, 1,
0.6441483, -1.45523, 2.706037, 1, 1, 1, 1, 1,
0.6452854, 0.04417529, 3.188125, 1, 1, 1, 1, 1,
0.6468798, 0.5751589, 1.97967, 1, 1, 1, 1, 1,
0.6542484, 0.8672727, 0.4415548, 1, 1, 1, 1, 1,
0.6548142, 2.086486, 1.718516, 1, 1, 1, 1, 1,
0.6548204, 0.2660669, 0.475766, 1, 1, 1, 1, 1,
0.6559123, 0.2997897, 1.066617, 1, 1, 1, 1, 1,
0.6561925, -1.082414, 2.557016, 1, 1, 1, 1, 1,
0.6620243, -0.3228264, 2.438849, 1, 1, 1, 1, 1,
0.6661414, 0.2102859, 2.02054, 1, 1, 1, 1, 1,
0.6665219, -1.303009, 3.533164, 1, 1, 1, 1, 1,
0.6675429, 0.0209452, 1.796966, 1, 1, 1, 1, 1,
0.6683174, 0.9601843, -0.811528, 1, 1, 1, 1, 1,
0.6685184, -0.5593361, 1.168335, 1, 1, 1, 1, 1,
0.6700489, 0.7539356, 2.083357, 0, 0, 1, 1, 1,
0.6723416, 0.4825264, 0.786273, 1, 0, 0, 1, 1,
0.6762912, 0.3161881, 1.527439, 1, 0, 0, 1, 1,
0.6824026, 0.3266843, 1.750611, 1, 0, 0, 1, 1,
0.6832867, -0.8189611, 2.101976, 1, 0, 0, 1, 1,
0.6851359, 0.571695, 1.215381, 1, 0, 0, 1, 1,
0.6870596, -0.4786209, 1.263911, 0, 0, 0, 1, 1,
0.6940297, -1.205944, 1.297902, 0, 0, 0, 1, 1,
0.6943174, -1.294866, 2.38404, 0, 0, 0, 1, 1,
0.6970458, 1.409324, -0.3415032, 0, 0, 0, 1, 1,
0.6986726, 0.1343244, 1.162299, 0, 0, 0, 1, 1,
0.7004979, -0.3652681, 1.543436, 0, 0, 0, 1, 1,
0.7034407, -0.1067672, 2.679004, 0, 0, 0, 1, 1,
0.7077121, -1.242993, 2.439673, 1, 1, 1, 1, 1,
0.7123175, 1.673616, 1.15739, 1, 1, 1, 1, 1,
0.7176731, -1.35792, 1.420698, 1, 1, 1, 1, 1,
0.7320297, 2.125371, 0.2105854, 1, 1, 1, 1, 1,
0.7350143, 0.7293382, 0.3467603, 1, 1, 1, 1, 1,
0.7356889, -0.3617477, 1.482597, 1, 1, 1, 1, 1,
0.7397611, 2.081389, -1.832487, 1, 1, 1, 1, 1,
0.7452691, 1.039786, -0.9590414, 1, 1, 1, 1, 1,
0.7475205, 0.6230471, -0.1021954, 1, 1, 1, 1, 1,
0.7475649, -1.793061, 3.730576, 1, 1, 1, 1, 1,
0.7506095, -0.7559764, 2.727395, 1, 1, 1, 1, 1,
0.7507961, 0.01037681, 1.127351, 1, 1, 1, 1, 1,
0.7722246, -1.612116, 2.14966, 1, 1, 1, 1, 1,
0.7736543, 1.75117, 0.9904379, 1, 1, 1, 1, 1,
0.7748948, -0.07262591, 2.911878, 1, 1, 1, 1, 1,
0.7749178, -0.6804768, 3.204281, 0, 0, 1, 1, 1,
0.7777711, -1.571849, 2.843267, 1, 0, 0, 1, 1,
0.7789105, -1.19693, 2.524411, 1, 0, 0, 1, 1,
0.7820407, -0.5183635, 0.17515, 1, 0, 0, 1, 1,
0.7843573, 0.9911178, 0.3322642, 1, 0, 0, 1, 1,
0.7893907, -1.020628, 3.237257, 1, 0, 0, 1, 1,
0.792322, -0.363595, 2.93492, 0, 0, 0, 1, 1,
0.7924194, -1.25776, 2.343945, 0, 0, 0, 1, 1,
0.7986453, 0.6813808, 2.575726, 0, 0, 0, 1, 1,
0.7993841, 0.3265673, 0.03058339, 0, 0, 0, 1, 1,
0.8011474, -0.29146, 1.050356, 0, 0, 0, 1, 1,
0.8014304, 0.75054, -0.7860591, 0, 0, 0, 1, 1,
0.8017694, 0.6446046, 1.44524, 0, 0, 0, 1, 1,
0.8068424, -0.1572152, 1.618047, 1, 1, 1, 1, 1,
0.8070223, 0.0932664, 1.714614, 1, 1, 1, 1, 1,
0.808749, 2.555169, 1.091467, 1, 1, 1, 1, 1,
0.8102044, 0.05755273, 1.634605, 1, 1, 1, 1, 1,
0.8175107, -0.2034012, 1.635804, 1, 1, 1, 1, 1,
0.821409, 0.2831383, 2.822827, 1, 1, 1, 1, 1,
0.8235661, 0.1102068, -0.05623297, 1, 1, 1, 1, 1,
0.8250728, -0.9771749, 3.023645, 1, 1, 1, 1, 1,
0.8285059, 1.95341, -0.8509403, 1, 1, 1, 1, 1,
0.8330961, 0.4444261, 0.2307953, 1, 1, 1, 1, 1,
0.8411193, -1.304877, 1.014199, 1, 1, 1, 1, 1,
0.8425237, -0.5289773, 0.8047783, 1, 1, 1, 1, 1,
0.8455777, 1.075506, 0.9130682, 1, 1, 1, 1, 1,
0.8519024, -0.03763075, 1.747987, 1, 1, 1, 1, 1,
0.8540633, -2.09602, 2.72624, 1, 1, 1, 1, 1,
0.8540804, -0.3464493, 2.684237, 0, 0, 1, 1, 1,
0.8547107, 1.074402, 1.951648, 1, 0, 0, 1, 1,
0.8606982, -1.794519, 3.386175, 1, 0, 0, 1, 1,
0.8611595, -0.2701303, 2.096313, 1, 0, 0, 1, 1,
0.8621827, 0.2861938, 0.1073499, 1, 0, 0, 1, 1,
0.8633996, -2.246524, 2.591849, 1, 0, 0, 1, 1,
0.8644727, 0.8908484, 1.621934, 0, 0, 0, 1, 1,
0.8651542, 0.6305307, 0.565861, 0, 0, 0, 1, 1,
0.8667645, -1.400705, 3.153846, 0, 0, 0, 1, 1,
0.8769966, 0.4593523, 1.826536, 0, 0, 0, 1, 1,
0.878832, -1.691294, 2.992736, 0, 0, 0, 1, 1,
0.8816801, 0.05049191, 2.543102, 0, 0, 0, 1, 1,
0.8847886, -0.2996394, 1.759152, 0, 0, 0, 1, 1,
0.8860468, -1.317729, 2.470104, 1, 1, 1, 1, 1,
0.8901762, -1.979398, 1.21701, 1, 1, 1, 1, 1,
0.8935862, 2.155427, -1.643049, 1, 1, 1, 1, 1,
0.8959934, -1.489044, 2.609839, 1, 1, 1, 1, 1,
0.900681, 0.8097417, -0.9115119, 1, 1, 1, 1, 1,
0.9017172, -1.276057, 1.978862, 1, 1, 1, 1, 1,
0.9049872, -0.3424869, 0.5268651, 1, 1, 1, 1, 1,
0.9067177, 0.008530632, 1.680615, 1, 1, 1, 1, 1,
0.9069023, 0.3568838, 1.661587, 1, 1, 1, 1, 1,
0.9090575, -1.244958, 3.573065, 1, 1, 1, 1, 1,
0.9134542, -1.046836, 2.328169, 1, 1, 1, 1, 1,
0.920234, 0.6392813, 1.978745, 1, 1, 1, 1, 1,
0.9376657, 0.1705946, -0.4512493, 1, 1, 1, 1, 1,
0.9592373, -0.6191492, 0.3972485, 1, 1, 1, 1, 1,
0.9608903, -2.042541, 2.252649, 1, 1, 1, 1, 1,
0.9627167, -0.1929922, 1.383421, 0, 0, 1, 1, 1,
0.9635829, -1.183103, 2.150891, 1, 0, 0, 1, 1,
0.9756041, -2.01185, 2.249192, 1, 0, 0, 1, 1,
0.9757176, -0.01400129, -0.8272666, 1, 0, 0, 1, 1,
0.9802206, -0.6539577, 2.115906, 1, 0, 0, 1, 1,
0.984648, 1.506384, 0.9494689, 1, 0, 0, 1, 1,
0.9915944, 1.242589, 1.003783, 0, 0, 0, 1, 1,
0.998754, -0.2404205, 1.18309, 0, 0, 0, 1, 1,
1.004891, 0.3490428, 1.299684, 0, 0, 0, 1, 1,
1.011889, 0.03202215, 1.982336, 0, 0, 0, 1, 1,
1.034102, -1.06781, 3.163244, 0, 0, 0, 1, 1,
1.042359, -0.06104256, 0.8771409, 0, 0, 0, 1, 1,
1.046603, -1.292932, 0.7081867, 0, 0, 0, 1, 1,
1.058536, -0.3975768, 1.484701, 1, 1, 1, 1, 1,
1.059157, -0.7479153, 1.790634, 1, 1, 1, 1, 1,
1.059994, 1.522312, 0.7919611, 1, 1, 1, 1, 1,
1.063037, 0.1633558, 1.83338, 1, 1, 1, 1, 1,
1.072894, 0.5227465, 1.874575, 1, 1, 1, 1, 1,
1.073532, -0.6550751, 1.396213, 1, 1, 1, 1, 1,
1.081086, -0.4998553, -0.06342071, 1, 1, 1, 1, 1,
1.08172, 0.5446109, 0.8353117, 1, 1, 1, 1, 1,
1.082314, 0.2197797, -0.355869, 1, 1, 1, 1, 1,
1.089984, 0.5125037, 2.214681, 1, 1, 1, 1, 1,
1.092271, 1.064892, -0.03612593, 1, 1, 1, 1, 1,
1.092478, -0.1233998, 0.7011808, 1, 1, 1, 1, 1,
1.09385, 0.5957838, 0.3704848, 1, 1, 1, 1, 1,
1.095031, -0.2502434, 0.4912858, 1, 1, 1, 1, 1,
1.096915, -0.07445297, 2.159279, 1, 1, 1, 1, 1,
1.10123, -0.6399258, 3.199698, 0, 0, 1, 1, 1,
1.101958, 0.919998, 1.165797, 1, 0, 0, 1, 1,
1.102413, -0.2253626, 0.7473087, 1, 0, 0, 1, 1,
1.111602, -0.650202, 0.8866094, 1, 0, 0, 1, 1,
1.125017, -0.02600616, 1.974553, 1, 0, 0, 1, 1,
1.131879, -0.2512237, 2.652415, 1, 0, 0, 1, 1,
1.137116, -0.4061526, 2.881004, 0, 0, 0, 1, 1,
1.149136, 0.2846334, -0.6834907, 0, 0, 0, 1, 1,
1.150236, 0.4341258, -0.1266714, 0, 0, 0, 1, 1,
1.158755, 0.5983067, -1.070593, 0, 0, 0, 1, 1,
1.15882, 0.1605067, 1.439523, 0, 0, 0, 1, 1,
1.162419, 0.008903616, 1.742392, 0, 0, 0, 1, 1,
1.164253, -1.22225, 1.310588, 0, 0, 0, 1, 1,
1.164795, -0.3618239, 1.386507, 1, 1, 1, 1, 1,
1.182915, -1.208257, 1.837556, 1, 1, 1, 1, 1,
1.190627, 0.5550093, 2.718955, 1, 1, 1, 1, 1,
1.202003, 1.90789, 1.653366, 1, 1, 1, 1, 1,
1.203457, 0.4954787, 1.432752, 1, 1, 1, 1, 1,
1.207356, 0.8128633, 0.3041161, 1, 1, 1, 1, 1,
1.211476, -0.05313616, 2.258248, 1, 1, 1, 1, 1,
1.213872, -0.9598762, 1.904423, 1, 1, 1, 1, 1,
1.215578, 2.121707, -0.1774857, 1, 1, 1, 1, 1,
1.217648, 0.9542978, 0.9456277, 1, 1, 1, 1, 1,
1.219813, 0.04790122, 2.384722, 1, 1, 1, 1, 1,
1.223892, -0.2853532, 2.306458, 1, 1, 1, 1, 1,
1.224852, 0.3013192, 0.977054, 1, 1, 1, 1, 1,
1.224996, -1.355875, 1.51116, 1, 1, 1, 1, 1,
1.230361, -0.324434, 1.994784, 1, 1, 1, 1, 1,
1.236321, 1.063789, 0.5605453, 0, 0, 1, 1, 1,
1.239369, -1.32057, 1.869345, 1, 0, 0, 1, 1,
1.255116, -0.2944152, 1.362688, 1, 0, 0, 1, 1,
1.255353, -1.948576, 1.699667, 1, 0, 0, 1, 1,
1.262333, -0.8767489, 3.874334, 1, 0, 0, 1, 1,
1.264363, -0.4241978, 2.829046, 1, 0, 0, 1, 1,
1.264877, 2.12051, 1.439655, 0, 0, 0, 1, 1,
1.276533, 0.3734309, -0.05183569, 0, 0, 0, 1, 1,
1.285076, -0.4583476, 0.4974726, 0, 0, 0, 1, 1,
1.291349, -0.07032092, 1.057694, 0, 0, 0, 1, 1,
1.295391, -1.323726, 1.60852, 0, 0, 0, 1, 1,
1.309024, 0.5488607, 0.8433756, 0, 0, 0, 1, 1,
1.328224, 0.3712661, 1.3305, 0, 0, 0, 1, 1,
1.336217, 1.183906, 1.001244, 1, 1, 1, 1, 1,
1.34293, 0.8290995, 1.710979, 1, 1, 1, 1, 1,
1.344869, 0.5966799, 3.538935, 1, 1, 1, 1, 1,
1.349486, 0.2316434, -0.1274614, 1, 1, 1, 1, 1,
1.355201, -1.56633, 1.026031, 1, 1, 1, 1, 1,
1.356897, -0.9660648, 2.91711, 1, 1, 1, 1, 1,
1.360536, -0.8413078, 2.360355, 1, 1, 1, 1, 1,
1.384326, 1.160789, -0.8171114, 1, 1, 1, 1, 1,
1.397774, 0.9057266, 0.1691476, 1, 1, 1, 1, 1,
1.401785, -1.509297, 1.400763, 1, 1, 1, 1, 1,
1.407958, 1.335333, -0.7350057, 1, 1, 1, 1, 1,
1.414973, 0.4890405, 1.715969, 1, 1, 1, 1, 1,
1.415157, 0.8994654, 1.045738, 1, 1, 1, 1, 1,
1.421488, -0.9772536, 2.417551, 1, 1, 1, 1, 1,
1.429658, -0.5480701, 2.299257, 1, 1, 1, 1, 1,
1.451432, 1.262757, 0.2834691, 0, 0, 1, 1, 1,
1.454535, 1.275075, 1.913425, 1, 0, 0, 1, 1,
1.463583, -0.7322114, 0.9247088, 1, 0, 0, 1, 1,
1.46792, 0.9190997, 0.9447045, 1, 0, 0, 1, 1,
1.492594, -1.07756, 1.61275, 1, 0, 0, 1, 1,
1.5025, 0.0887344, 1.478523, 1, 0, 0, 1, 1,
1.506788, 1.770182, 2.775717, 0, 0, 0, 1, 1,
1.509646, 1.143656, 0.5970679, 0, 0, 0, 1, 1,
1.51211, -1.011955, 1.213385, 0, 0, 0, 1, 1,
1.512329, -0.6979088, 2.418732, 0, 0, 0, 1, 1,
1.520961, 0.4661628, 0.409543, 0, 0, 0, 1, 1,
1.529336, 1.632394, 1.334479, 0, 0, 0, 1, 1,
1.548392, 0.05589949, 0.1886889, 0, 0, 0, 1, 1,
1.553263, -0.7392616, 2.136497, 1, 1, 1, 1, 1,
1.561093, -0.483137, 2.993151, 1, 1, 1, 1, 1,
1.563403, -0.7212588, 2.533728, 1, 1, 1, 1, 1,
1.577301, -0.860897, 2.61183, 1, 1, 1, 1, 1,
1.583387, 0.6830876, 1.479921, 1, 1, 1, 1, 1,
1.584409, -2.483282, 2.524937, 1, 1, 1, 1, 1,
1.59458, -1.306061, 1.627177, 1, 1, 1, 1, 1,
1.601977, -0.1903419, 3.556199, 1, 1, 1, 1, 1,
1.606275, -0.2784247, 1.333273, 1, 1, 1, 1, 1,
1.607052, -0.01676442, 2.496626, 1, 1, 1, 1, 1,
1.634432, -0.7908804, 2.413463, 1, 1, 1, 1, 1,
1.645541, -1.350183, 1.11536, 1, 1, 1, 1, 1,
1.6563, 0.2147387, 2.546969, 1, 1, 1, 1, 1,
1.6572, 1.516614, 3.914181, 1, 1, 1, 1, 1,
1.659036, 1.082692, 0.9926516, 1, 1, 1, 1, 1,
1.661913, -0.02358118, 0.2900331, 0, 0, 1, 1, 1,
1.711296, 1.305447, 2.852678, 1, 0, 0, 1, 1,
1.727011, -1.146212, 2.493328, 1, 0, 0, 1, 1,
1.737896, 0.72515, 1.546022, 1, 0, 0, 1, 1,
1.737986, -1.296853, 2.572824, 1, 0, 0, 1, 1,
1.742017, -0.435888, 3.073887, 1, 0, 0, 1, 1,
1.75345, 1.943852, 1.566968, 0, 0, 0, 1, 1,
1.767615, 0.06356812, 1.015703, 0, 0, 0, 1, 1,
1.786439, 0.3795577, 2.27463, 0, 0, 0, 1, 1,
1.791885, -0.02305167, 3.687024, 0, 0, 0, 1, 1,
1.792869, 0.2060681, 2.316336, 0, 0, 0, 1, 1,
1.83606, 0.6456159, 1.433744, 0, 0, 0, 1, 1,
1.855251, -0.2830924, 2.541132, 0, 0, 0, 1, 1,
1.878779, 0.6462415, 0.7089653, 1, 1, 1, 1, 1,
1.880611, -1.158445, 0.9355059, 1, 1, 1, 1, 1,
1.883454, -0.4174805, 0.8300021, 1, 1, 1, 1, 1,
1.884259, -0.404844, 3.008308, 1, 1, 1, 1, 1,
1.891229, -2.02638, 3.112367, 1, 1, 1, 1, 1,
1.922275, -0.7038385, 2.640603, 1, 1, 1, 1, 1,
1.962642, 0.6757008, 0.5621693, 1, 1, 1, 1, 1,
1.993899, -1.398884, 2.62258, 1, 1, 1, 1, 1,
2.015003, 0.8249014, 1.459024, 1, 1, 1, 1, 1,
2.03571, -0.1064975, 2.49786, 1, 1, 1, 1, 1,
2.047754, 0.849739, 0.801205, 1, 1, 1, 1, 1,
2.048746, -0.7906629, 3.695074, 1, 1, 1, 1, 1,
2.054546, -0.1948679, 1.544456, 1, 1, 1, 1, 1,
2.089839, -1.125266, 2.553552, 1, 1, 1, 1, 1,
2.098878, -1.715196, 5.055651, 1, 1, 1, 1, 1,
2.107047, -0.4222987, 1.857527, 0, 0, 1, 1, 1,
2.124299, 0.461277, -0.2239741, 1, 0, 0, 1, 1,
2.143489, 0.5741745, -0.1183594, 1, 0, 0, 1, 1,
2.151678, -0.3532277, 2.081829, 1, 0, 0, 1, 1,
2.157036, 1.03521, 2.009762, 1, 0, 0, 1, 1,
2.186878, -0.3281043, 0.8501625, 1, 0, 0, 1, 1,
2.196359, -0.3069673, 1.91438, 0, 0, 0, 1, 1,
2.232789, -1.356027, 2.529208, 0, 0, 0, 1, 1,
2.237181, -1.297636, 2.019218, 0, 0, 0, 1, 1,
2.273366, 0.3708158, 1.661345, 0, 0, 0, 1, 1,
2.278404, -0.1673648, 1.547993, 0, 0, 0, 1, 1,
2.304575, 1.076583, 2.277881, 0, 0, 0, 1, 1,
2.311702, 1.29873, 0.06065875, 0, 0, 0, 1, 1,
2.318348, -0.1494997, 3.616604, 1, 1, 1, 1, 1,
2.351969, -1.092516, 2.105921, 1, 1, 1, 1, 1,
2.377394, -1.430984, 2.849974, 1, 1, 1, 1, 1,
2.398208, -0.2180656, 1.869593, 1, 1, 1, 1, 1,
2.663922, -0.796047, 0.2418304, 1, 1, 1, 1, 1,
3.29929, 0.315515, 0.1662679, 1, 1, 1, 1, 1,
3.457269, -0.7210208, 1.906687, 1, 1, 1, 1, 1
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
var radius = 9.655032;
var distance = 33.91289;
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
mvMatrix.translate( -0.1024051, -0.2829931, -0.07753038 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.91289);
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
