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
-2.904486, 0.1823816, -2.662877, 1, 0, 0, 1,
-2.519039, 0.7223864, 0.1558939, 1, 0.007843138, 0, 1,
-2.501521, 1.586201, -2.007866, 1, 0.01176471, 0, 1,
-2.370845, 0.1708365, -0.8797568, 1, 0.01960784, 0, 1,
-2.323915, -1.815592, -1.99367, 1, 0.02352941, 0, 1,
-2.290803, -0.6979057, -0.6803787, 1, 0.03137255, 0, 1,
-2.261949, -0.2054328, -0.9796888, 1, 0.03529412, 0, 1,
-2.2565, 1.192965, -0.01211608, 1, 0.04313726, 0, 1,
-2.208072, 0.4144807, -1.574062, 1, 0.04705882, 0, 1,
-2.187293, -0.8962919, -1.375849, 1, 0.05490196, 0, 1,
-2.172086, 0.8203216, -2.126637, 1, 0.05882353, 0, 1,
-2.143725, 0.5808928, -1.107188, 1, 0.06666667, 0, 1,
-2.075753, 0.2368363, -1.832426, 1, 0.07058824, 0, 1,
-2.066241, 0.4953714, -1.50537, 1, 0.07843138, 0, 1,
-2.004302, 0.3010071, -0.9461979, 1, 0.08235294, 0, 1,
-1.963549, -0.267167, -3.251899, 1, 0.09019608, 0, 1,
-1.917895, 0.7358915, -1.408766, 1, 0.09411765, 0, 1,
-1.887902, -3.153904, -1.779525, 1, 0.1019608, 0, 1,
-1.867304, -0.4921691, -2.547121, 1, 0.1098039, 0, 1,
-1.825788, 0.5496408, -2.313212, 1, 0.1137255, 0, 1,
-1.802242, 0.2917906, -0.9585588, 1, 0.1215686, 0, 1,
-1.776404, -0.7622432, -4.073836, 1, 0.1254902, 0, 1,
-1.768113, -0.5028765, -0.6883731, 1, 0.1333333, 0, 1,
-1.757861, 2.057902, -1.27697, 1, 0.1372549, 0, 1,
-1.75676, 1.472745, -1.320961, 1, 0.145098, 0, 1,
-1.738408, -0.4210263, -1.702725, 1, 0.1490196, 0, 1,
-1.722936, 1.316081, -1.086532, 1, 0.1568628, 0, 1,
-1.720543, 1.075285, -1.209619, 1, 0.1607843, 0, 1,
-1.712402, 0.4357168, 0.4236435, 1, 0.1686275, 0, 1,
-1.700699, -0.001750983, -3.215626, 1, 0.172549, 0, 1,
-1.700515, -0.4496654, -1.892254, 1, 0.1803922, 0, 1,
-1.695125, 0.660604, 0.09175473, 1, 0.1843137, 0, 1,
-1.688259, 0.232265, 0.4322673, 1, 0.1921569, 0, 1,
-1.679518, 1.69262, -0.251131, 1, 0.1960784, 0, 1,
-1.663669, -1.585213, -1.809206, 1, 0.2039216, 0, 1,
-1.662706, -0.825991, -1.711062, 1, 0.2117647, 0, 1,
-1.63134, 0.05066729, -1.702667, 1, 0.2156863, 0, 1,
-1.630455, 1.851766, 0.4058954, 1, 0.2235294, 0, 1,
-1.629881, -0.2717337, -1.889125, 1, 0.227451, 0, 1,
-1.608003, -0.1023612, -2.456034, 1, 0.2352941, 0, 1,
-1.602756, 0.5886684, -3.928198, 1, 0.2392157, 0, 1,
-1.600764, 0.7719038, -0.8889981, 1, 0.2470588, 0, 1,
-1.599665, 0.367225, -0.244662, 1, 0.2509804, 0, 1,
-1.584285, 2.227498, -0.6373575, 1, 0.2588235, 0, 1,
-1.579924, -0.8046439, -1.448667, 1, 0.2627451, 0, 1,
-1.575437, -0.5902737, -0.6054888, 1, 0.2705882, 0, 1,
-1.572494, -0.287695, -1.765565, 1, 0.2745098, 0, 1,
-1.570898, -0.7683726, -2.727592, 1, 0.282353, 0, 1,
-1.567951, -1.132038, -2.382464, 1, 0.2862745, 0, 1,
-1.5664, -0.6628039, -1.110829, 1, 0.2941177, 0, 1,
-1.563422, 0.01560971, -0.9602826, 1, 0.3019608, 0, 1,
-1.55014, 0.9297061, -1.053315, 1, 0.3058824, 0, 1,
-1.544903, 1.707442, -1.490029, 1, 0.3137255, 0, 1,
-1.544226, -0.5806859, -0.3081537, 1, 0.3176471, 0, 1,
-1.528092, 1.847411, -1.443192, 1, 0.3254902, 0, 1,
-1.507046, -2.174993, -2.809827, 1, 0.3294118, 0, 1,
-1.506402, -1.031601, -1.785948, 1, 0.3372549, 0, 1,
-1.487527, 1.651209, -0.0282375, 1, 0.3411765, 0, 1,
-1.485425, 2.103885, -0.8435796, 1, 0.3490196, 0, 1,
-1.47257, -1.684833, -3.303268, 1, 0.3529412, 0, 1,
-1.469378, 1.205848, -0.6227251, 1, 0.3607843, 0, 1,
-1.465241, 1.057155, -0.764361, 1, 0.3647059, 0, 1,
-1.461544, -0.1833057, -2.257097, 1, 0.372549, 0, 1,
-1.456699, 0.6389094, -2.393296, 1, 0.3764706, 0, 1,
-1.450754, 0.8371512, -1.073746, 1, 0.3843137, 0, 1,
-1.449859, -1.98278, -4.643087, 1, 0.3882353, 0, 1,
-1.436999, -0.3853175, -2.667992, 1, 0.3960784, 0, 1,
-1.429158, -1.010391, -3.270097, 1, 0.4039216, 0, 1,
-1.418426, -2.160784, -1.152071, 1, 0.4078431, 0, 1,
-1.411046, 1.894529, -2.110907, 1, 0.4156863, 0, 1,
-1.409851, -1.142457, -3.535993, 1, 0.4196078, 0, 1,
-1.407566, -1.760922, -1.932343, 1, 0.427451, 0, 1,
-1.406909, 0.1301475, -0.1636765, 1, 0.4313726, 0, 1,
-1.402472, -1.483098, -2.948362, 1, 0.4392157, 0, 1,
-1.396646, 1.06808, -1.516472, 1, 0.4431373, 0, 1,
-1.393106, -0.5205115, -0.3458507, 1, 0.4509804, 0, 1,
-1.380906, 1.075414, -0.2177791, 1, 0.454902, 0, 1,
-1.377402, -0.1398609, -2.359186, 1, 0.4627451, 0, 1,
-1.36784, -2.139004, -1.351102, 1, 0.4666667, 0, 1,
-1.35629, 1.377739, -1.723754, 1, 0.4745098, 0, 1,
-1.355552, 1.327736, -0.8289814, 1, 0.4784314, 0, 1,
-1.349676, 0.2684847, -0.5488515, 1, 0.4862745, 0, 1,
-1.349469, -0.02228124, -1.053235, 1, 0.4901961, 0, 1,
-1.345888, 0.293973, -0.1794875, 1, 0.4980392, 0, 1,
-1.337676, -0.4170499, -2.131368, 1, 0.5058824, 0, 1,
-1.337085, -1.469975, -0.6240503, 1, 0.509804, 0, 1,
-1.335654, 0.6973687, -2.931847, 1, 0.5176471, 0, 1,
-1.334939, -1.339707, -2.204675, 1, 0.5215687, 0, 1,
-1.334465, 2.039488, -1.541393, 1, 0.5294118, 0, 1,
-1.324303, 1.940214, 0.301637, 1, 0.5333334, 0, 1,
-1.323767, 0.9146551, -1.228678, 1, 0.5411765, 0, 1,
-1.322766, 1.602743, 0.4710107, 1, 0.5450981, 0, 1,
-1.314719, -0.7415955, -2.882702, 1, 0.5529412, 0, 1,
-1.305407, 0.6007687, -3.426151, 1, 0.5568628, 0, 1,
-1.295205, -0.1647693, -0.8753612, 1, 0.5647059, 0, 1,
-1.288831, -0.4357963, -2.036982, 1, 0.5686275, 0, 1,
-1.288312, -0.08412372, -0.228406, 1, 0.5764706, 0, 1,
-1.276443, -0.7396026, -3.225019, 1, 0.5803922, 0, 1,
-1.260911, 0.08168467, 0.104115, 1, 0.5882353, 0, 1,
-1.248236, 0.2133267, -0.4252705, 1, 0.5921569, 0, 1,
-1.241422, 1.409868, -0.1909646, 1, 0.6, 0, 1,
-1.235042, -0.5105075, -0.09461744, 1, 0.6078432, 0, 1,
-1.233645, 2.210316, -0.1455746, 1, 0.6117647, 0, 1,
-1.232316, -0.8308461, -2.993523, 1, 0.6196079, 0, 1,
-1.227409, 0.4145086, 0.516839, 1, 0.6235294, 0, 1,
-1.222144, 2.383333, 0.7697119, 1, 0.6313726, 0, 1,
-1.220648, -0.3131956, -0.9321759, 1, 0.6352941, 0, 1,
-1.21462, 1.187522, -1.552629, 1, 0.6431373, 0, 1,
-1.20933, -0.4961646, -1.754713, 1, 0.6470588, 0, 1,
-1.201988, 1.448087, -1.28574, 1, 0.654902, 0, 1,
-1.187942, 1.46763, -0.263817, 1, 0.6588235, 0, 1,
-1.171944, -0.3290227, -1.894899, 1, 0.6666667, 0, 1,
-1.171795, 0.6827445, -1.068796, 1, 0.6705883, 0, 1,
-1.169218, 1.425824, -1.317678, 1, 0.6784314, 0, 1,
-1.168189, -0.863363, -2.171869, 1, 0.682353, 0, 1,
-1.164979, -0.7718579, -3.350298, 1, 0.6901961, 0, 1,
-1.162288, -0.222706, -3.47753, 1, 0.6941177, 0, 1,
-1.150457, -1.660879, -3.138297, 1, 0.7019608, 0, 1,
-1.149684, 0.7117497, -1.587074, 1, 0.7098039, 0, 1,
-1.148297, 1.325368, -1.37858, 1, 0.7137255, 0, 1,
-1.140859, 1.530877, -0.791826, 1, 0.7215686, 0, 1,
-1.13609, -0.541671, -0.6143006, 1, 0.7254902, 0, 1,
-1.135422, -0.6736122, 0.02608032, 1, 0.7333333, 0, 1,
-1.128502, 1.899268, 1.103749, 1, 0.7372549, 0, 1,
-1.121593, 0.3517697, -0.5626028, 1, 0.7450981, 0, 1,
-1.118344, -1.113557, -2.96966, 1, 0.7490196, 0, 1,
-1.116728, -0.4173381, -1.566189, 1, 0.7568628, 0, 1,
-1.115585, -1.034809, -1.673181, 1, 0.7607843, 0, 1,
-1.112681, 0.09422928, -2.591837, 1, 0.7686275, 0, 1,
-1.107841, 2.221624, 0.3156986, 1, 0.772549, 0, 1,
-1.102438, 1.132283, -0.6838716, 1, 0.7803922, 0, 1,
-1.094699, -0.1352403, -2.655471, 1, 0.7843137, 0, 1,
-1.091249, -0.3613969, -1.324506, 1, 0.7921569, 0, 1,
-1.08639, -1.061102, -2.953585, 1, 0.7960784, 0, 1,
-1.083739, -0.3949758, -3.455534, 1, 0.8039216, 0, 1,
-1.08101, 0.2253928, -0.3324516, 1, 0.8117647, 0, 1,
-1.078832, -0.4866912, -0.8296964, 1, 0.8156863, 0, 1,
-1.073937, -0.006271908, 0.7849638, 1, 0.8235294, 0, 1,
-1.071127, 0.6314597, 0.1765202, 1, 0.827451, 0, 1,
-1.066882, 0.2808712, -1.440649, 1, 0.8352941, 0, 1,
-1.066652, -1.510544, -3.061075, 1, 0.8392157, 0, 1,
-1.064971, 0.5470951, -3.14746, 1, 0.8470588, 0, 1,
-1.064681, 1.210885, 0.1836154, 1, 0.8509804, 0, 1,
-1.064033, 0.7065802, -0.8240774, 1, 0.8588235, 0, 1,
-1.057272, 1.078808, -0.6108033, 1, 0.8627451, 0, 1,
-1.056351, 0.6750057, -2.987268, 1, 0.8705882, 0, 1,
-1.051224, -0.6398509, -2.322613, 1, 0.8745098, 0, 1,
-1.049044, -0.863216, -1.539312, 1, 0.8823529, 0, 1,
-1.046616, 0.6078465, -1.540958, 1, 0.8862745, 0, 1,
-1.03877, -1.153747, -1.494391, 1, 0.8941177, 0, 1,
-1.034479, -1.888392, -2.998882, 1, 0.8980392, 0, 1,
-1.03106, 1.48286, -0.8523327, 1, 0.9058824, 0, 1,
-1.024157, 0.07130131, -2.874178, 1, 0.9137255, 0, 1,
-1.015326, 0.5432354, -0.6295853, 1, 0.9176471, 0, 1,
-1.014241, -0.1812759, -0.6063912, 1, 0.9254902, 0, 1,
-1.012243, 0.3276362, -1.438559, 1, 0.9294118, 0, 1,
-1.01068, -1.0931, -2.558689, 1, 0.9372549, 0, 1,
-1.008896, -0.04554794, -2.865138, 1, 0.9411765, 0, 1,
-1.001285, 0.7747523, -0.4356293, 1, 0.9490196, 0, 1,
-1.000695, 1.90781, -0.2105111, 1, 0.9529412, 0, 1,
-0.9996278, -0.6111187, -1.593611, 1, 0.9607843, 0, 1,
-0.9994506, -1.179094, -1.998099, 1, 0.9647059, 0, 1,
-0.9940384, 1.344651, -0.7413266, 1, 0.972549, 0, 1,
-0.9848943, -0.1183822, -2.706467, 1, 0.9764706, 0, 1,
-0.9818762, 0.6707897, -1.951441, 1, 0.9843137, 0, 1,
-0.9794315, -0.3886113, -2.551928, 1, 0.9882353, 0, 1,
-0.9776742, 0.05524224, -2.116811, 1, 0.9960784, 0, 1,
-0.9772341, -0.4635842, -2.828389, 0.9960784, 1, 0, 1,
-0.9759439, 1.002629, -0.7838979, 0.9921569, 1, 0, 1,
-0.9657689, 1.662572, -2.065, 0.9843137, 1, 0, 1,
-0.964001, -1.176566, -3.205661, 0.9803922, 1, 0, 1,
-0.9629415, 2.239665, -0.3853018, 0.972549, 1, 0, 1,
-0.9627361, -0.2722071, -1.05238, 0.9686275, 1, 0, 1,
-0.959629, 0.3260083, -1.565978, 0.9607843, 1, 0, 1,
-0.9583846, -1.07912, -3.228396, 0.9568627, 1, 0, 1,
-0.9555421, 0.002404256, -3.26993, 0.9490196, 1, 0, 1,
-0.9552808, 0.3878264, 0.4688211, 0.945098, 1, 0, 1,
-0.9538188, -1.004686, -2.389722, 0.9372549, 1, 0, 1,
-0.9420063, -0.1422149, 1.320019, 0.9333333, 1, 0, 1,
-0.9412446, 0.2452234, -0.6593881, 0.9254902, 1, 0, 1,
-0.9368296, -1.07765, -3.442034, 0.9215686, 1, 0, 1,
-0.9318669, -0.303672, -1.502532, 0.9137255, 1, 0, 1,
-0.9311943, -0.2564242, -2.541621, 0.9098039, 1, 0, 1,
-0.929997, 1.149724, 1.191607, 0.9019608, 1, 0, 1,
-0.9196779, -0.2976412, -2.890837, 0.8941177, 1, 0, 1,
-0.9190546, 1.405527, -1.017397, 0.8901961, 1, 0, 1,
-0.9190331, 2.49954, 0.7067646, 0.8823529, 1, 0, 1,
-0.9158708, -0.1213525, -1.940169, 0.8784314, 1, 0, 1,
-0.9093855, 0.8844264, -0.363306, 0.8705882, 1, 0, 1,
-0.9077377, -0.1388702, -2.290737, 0.8666667, 1, 0, 1,
-0.9014006, -0.04063474, -3.455149, 0.8588235, 1, 0, 1,
-0.9010847, 0.2916489, -0.6328544, 0.854902, 1, 0, 1,
-0.8975722, 0.5970278, -0.4828631, 0.8470588, 1, 0, 1,
-0.8966399, 0.3617843, 2.236008, 0.8431373, 1, 0, 1,
-0.8941507, -0.04975581, -1.3191, 0.8352941, 1, 0, 1,
-0.8934063, 0.387598, -0.5643063, 0.8313726, 1, 0, 1,
-0.8796768, -0.6424437, -2.893311, 0.8235294, 1, 0, 1,
-0.8781265, -0.4929398, -3.113334, 0.8196079, 1, 0, 1,
-0.873282, 0.3873239, -2.139005, 0.8117647, 1, 0, 1,
-0.8702512, 1.474097, -0.5397292, 0.8078431, 1, 0, 1,
-0.8612165, -1.480959, -3.391756, 0.8, 1, 0, 1,
-0.860554, 0.2129062, -1.769512, 0.7921569, 1, 0, 1,
-0.8585116, -1.224917, -1.989501, 0.7882353, 1, 0, 1,
-0.8497551, 0.0019841, -0.8816999, 0.7803922, 1, 0, 1,
-0.8450265, 0.6480367, -0.8231182, 0.7764706, 1, 0, 1,
-0.8411897, 0.4825281, -1.137726, 0.7686275, 1, 0, 1,
-0.8397143, 1.08727, -0.8924039, 0.7647059, 1, 0, 1,
-0.8386672, 0.5704631, -0.5621257, 0.7568628, 1, 0, 1,
-0.837805, -0.8791272, -4.797749, 0.7529412, 1, 0, 1,
-0.8349676, 0.6130924, -3.518895, 0.7450981, 1, 0, 1,
-0.8333021, -0.5311053, -1.818956, 0.7411765, 1, 0, 1,
-0.832315, -0.9607739, -3.656132, 0.7333333, 1, 0, 1,
-0.8277839, -1.024112, -2.323635, 0.7294118, 1, 0, 1,
-0.8203723, -0.08017618, -1.243926, 0.7215686, 1, 0, 1,
-0.8137656, 1.04684, 0.4926871, 0.7176471, 1, 0, 1,
-0.8133685, -0.7497689, -1.97921, 0.7098039, 1, 0, 1,
-0.8031198, -1.820755, -3.811465, 0.7058824, 1, 0, 1,
-0.8017115, -0.6934943, -3.119348, 0.6980392, 1, 0, 1,
-0.8002424, -0.6200208, -3.287298, 0.6901961, 1, 0, 1,
-0.793512, 0.5573657, -2.58951, 0.6862745, 1, 0, 1,
-0.7872856, -1.087215, -2.982281, 0.6784314, 1, 0, 1,
-0.781888, 0.007907717, -0.7372828, 0.6745098, 1, 0, 1,
-0.7781971, -1.406047, -2.946195, 0.6666667, 1, 0, 1,
-0.7745727, 0.8241615, -0.005437891, 0.6627451, 1, 0, 1,
-0.7642413, -1.004499, -3.193362, 0.654902, 1, 0, 1,
-0.7632463, -0.09433751, -1.225545, 0.6509804, 1, 0, 1,
-0.7632269, 1.288338, 0.535108, 0.6431373, 1, 0, 1,
-0.7543173, -0.08931039, -2.578107, 0.6392157, 1, 0, 1,
-0.7522531, -0.5712953, -3.137643, 0.6313726, 1, 0, 1,
-0.7511031, -0.1633482, -0.5596043, 0.627451, 1, 0, 1,
-0.7488143, -1.662308, -3.534313, 0.6196079, 1, 0, 1,
-0.746653, 0.9492413, -3.551022, 0.6156863, 1, 0, 1,
-0.7463617, 1.717788, -1.49896, 0.6078432, 1, 0, 1,
-0.7460021, 1.022413, -1.575974, 0.6039216, 1, 0, 1,
-0.7453718, 0.6798912, 0.02911515, 0.5960785, 1, 0, 1,
-0.7423712, -0.5949191, -0.3749196, 0.5882353, 1, 0, 1,
-0.7408742, 0.7408029, 0.340571, 0.5843138, 1, 0, 1,
-0.7394301, -0.8518953, -2.274467, 0.5764706, 1, 0, 1,
-0.7383994, 1.23079, -1.258076, 0.572549, 1, 0, 1,
-0.7363268, 0.5562076, -0.2362913, 0.5647059, 1, 0, 1,
-0.7319123, -0.05872468, -2.057105, 0.5607843, 1, 0, 1,
-0.7280493, -1.315858, -3.318406, 0.5529412, 1, 0, 1,
-0.7246714, -0.4662326, -1.015038, 0.5490196, 1, 0, 1,
-0.7241119, 0.5041127, -1.817825, 0.5411765, 1, 0, 1,
-0.7230378, -2.313157, -2.211791, 0.5372549, 1, 0, 1,
-0.7207593, 0.9656356, -1.261811, 0.5294118, 1, 0, 1,
-0.7204552, 1.482582, 0.4826677, 0.5254902, 1, 0, 1,
-0.7178633, 1.420834, 0.1935418, 0.5176471, 1, 0, 1,
-0.7154809, -0.8786385, -2.418861, 0.5137255, 1, 0, 1,
-0.7148007, -0.1322979, -1.21672, 0.5058824, 1, 0, 1,
-0.7123619, -0.09320948, 0.2961881, 0.5019608, 1, 0, 1,
-0.7078454, 2.279098, -1.555053, 0.4941176, 1, 0, 1,
-0.7075945, -1.29604, -2.668025, 0.4862745, 1, 0, 1,
-0.7051422, 0.4759437, -1.276003, 0.4823529, 1, 0, 1,
-0.6945103, -0.7432066, -1.874032, 0.4745098, 1, 0, 1,
-0.6856071, -0.1699132, -2.135372, 0.4705882, 1, 0, 1,
-0.6835271, 0.4201609, 0.01101423, 0.4627451, 1, 0, 1,
-0.6813126, -1.28983, -1.53251, 0.4588235, 1, 0, 1,
-0.6771832, -1.318841, -2.145317, 0.4509804, 1, 0, 1,
-0.6707324, 2.334088, 1.124614, 0.4470588, 1, 0, 1,
-0.6685332, 0.01965289, -0.3191593, 0.4392157, 1, 0, 1,
-0.6673129, -1.52285, -2.045689, 0.4352941, 1, 0, 1,
-0.6656896, 1.057423, 0.6814, 0.427451, 1, 0, 1,
-0.6619566, 0.1720269, -0.1545107, 0.4235294, 1, 0, 1,
-0.6588037, 0.05796492, -2.369406, 0.4156863, 1, 0, 1,
-0.6380424, -0.524794, -3.396913, 0.4117647, 1, 0, 1,
-0.6369462, -0.1772479, -4.503118, 0.4039216, 1, 0, 1,
-0.6323543, -0.9666442, -2.69557, 0.3960784, 1, 0, 1,
-0.6321545, 0.9467759, -0.5084544, 0.3921569, 1, 0, 1,
-0.6304966, -0.9105763, -2.256475, 0.3843137, 1, 0, 1,
-0.6276427, -0.6382622, -1.618749, 0.3803922, 1, 0, 1,
-0.627248, -0.2345729, -1.905505, 0.372549, 1, 0, 1,
-0.6255648, 0.342755, -1.404094, 0.3686275, 1, 0, 1,
-0.6246573, -0.9841221, -2.046484, 0.3607843, 1, 0, 1,
-0.6204065, 0.6597594, -0.4789506, 0.3568628, 1, 0, 1,
-0.6195332, 0.5988004, -2.12426, 0.3490196, 1, 0, 1,
-0.6123073, -0.4177799, -1.569452, 0.345098, 1, 0, 1,
-0.6040149, 1.015308, -1.291674, 0.3372549, 1, 0, 1,
-0.5965683, 1.352352, -0.1297077, 0.3333333, 1, 0, 1,
-0.5960643, 0.3338815, -2.050588, 0.3254902, 1, 0, 1,
-0.5904943, -1.757769, -4.214834, 0.3215686, 1, 0, 1,
-0.5888926, 0.1759136, -0.4459165, 0.3137255, 1, 0, 1,
-0.5834599, -1.371973, -2.477396, 0.3098039, 1, 0, 1,
-0.5819784, 0.09055503, -2.760327, 0.3019608, 1, 0, 1,
-0.5785732, 0.8492706, -1.058526, 0.2941177, 1, 0, 1,
-0.5762975, 1.859839, -1.283332, 0.2901961, 1, 0, 1,
-0.5760559, -1.385235, -3.217731, 0.282353, 1, 0, 1,
-0.5746446, -0.5619675, -2.56038, 0.2784314, 1, 0, 1,
-0.5712397, 1.570052, 0.09850622, 0.2705882, 1, 0, 1,
-0.5655634, -0.5013571, -1.377364, 0.2666667, 1, 0, 1,
-0.5652267, -1.356335, -3.957527, 0.2588235, 1, 0, 1,
-0.5621629, 1.513664, -0.4909647, 0.254902, 1, 0, 1,
-0.5609983, -1.053176, -0.4753837, 0.2470588, 1, 0, 1,
-0.5594555, 0.5851146, 0.02209325, 0.2431373, 1, 0, 1,
-0.5562938, 1.535895, -1.699188, 0.2352941, 1, 0, 1,
-0.5505689, 0.03485763, 1.213795, 0.2313726, 1, 0, 1,
-0.549558, 0.7623905, 0.1571279, 0.2235294, 1, 0, 1,
-0.5478, 2.080436, 0.2734738, 0.2196078, 1, 0, 1,
-0.5446654, -0.9232634, -1.310598, 0.2117647, 1, 0, 1,
-0.5446433, -0.4402065, -3.17852, 0.2078431, 1, 0, 1,
-0.5420945, -0.5764627, -2.090556, 0.2, 1, 0, 1,
-0.5408604, -0.1021685, -0.8525495, 0.1921569, 1, 0, 1,
-0.5347199, -0.9628239, -2.934012, 0.1882353, 1, 0, 1,
-0.5342835, -0.5624043, -2.103702, 0.1803922, 1, 0, 1,
-0.5312482, 0.5491416, -0.1969174, 0.1764706, 1, 0, 1,
-0.5312167, 1.697727, -1.649327, 0.1686275, 1, 0, 1,
-0.5303299, 0.6852104, -0.1261577, 0.1647059, 1, 0, 1,
-0.5301114, -0.1059991, -2.27325, 0.1568628, 1, 0, 1,
-0.5289403, 0.8511469, 0.04425988, 0.1529412, 1, 0, 1,
-0.5272695, 0.9804228, -2.46616, 0.145098, 1, 0, 1,
-0.5250711, 0.269964, 0.5014875, 0.1411765, 1, 0, 1,
-0.5239558, 0.2208778, -0.1833773, 0.1333333, 1, 0, 1,
-0.5221711, -0.7057298, -3.293937, 0.1294118, 1, 0, 1,
-0.5151743, 0.5946327, 0.3229324, 0.1215686, 1, 0, 1,
-0.5129691, -1.67703, -2.547966, 0.1176471, 1, 0, 1,
-0.5098358, 1.116266, -1.395987, 0.1098039, 1, 0, 1,
-0.509191, 0.2446274, -1.504798, 0.1058824, 1, 0, 1,
-0.5045604, -0.3840611, -3.890104, 0.09803922, 1, 0, 1,
-0.5041668, 0.5480102, -2.73771, 0.09019608, 1, 0, 1,
-0.4997586, -0.3306376, -1.760719, 0.08627451, 1, 0, 1,
-0.4972473, -0.7271121, -4.041724, 0.07843138, 1, 0, 1,
-0.4961495, 0.3702419, -1.147367, 0.07450981, 1, 0, 1,
-0.4937658, -0.5172321, -2.434369, 0.06666667, 1, 0, 1,
-0.4880336, -0.5715228, -1.579274, 0.0627451, 1, 0, 1,
-0.4860811, 1.088379, -0.4049561, 0.05490196, 1, 0, 1,
-0.4833662, -0.1953374, -0.8840251, 0.05098039, 1, 0, 1,
-0.4829754, 2.015116, 0.2974079, 0.04313726, 1, 0, 1,
-0.4773033, -0.6040146, -2.936572, 0.03921569, 1, 0, 1,
-0.4771178, -0.898066, -3.54813, 0.03137255, 1, 0, 1,
-0.4690778, -0.5853295, -2.764748, 0.02745098, 1, 0, 1,
-0.466984, -0.03439564, -0.5471768, 0.01960784, 1, 0, 1,
-0.4652135, -0.7789042, -1.773558, 0.01568628, 1, 0, 1,
-0.4597936, 0.1748708, 0.005691573, 0.007843138, 1, 0, 1,
-0.4592991, 0.6994368, -1.891843, 0.003921569, 1, 0, 1,
-0.4560326, -2.424571, -3.620872, 0, 1, 0.003921569, 1,
-0.4511506, -0.5222259, -4.601926, 0, 1, 0.01176471, 1,
-0.4502276, 1.118381, 0.3951605, 0, 1, 0.01568628, 1,
-0.4481567, -0.09370048, -2.300817, 0, 1, 0.02352941, 1,
-0.4353628, 1.109071, 2.031425, 0, 1, 0.02745098, 1,
-0.433304, 0.514303, 1.419695, 0, 1, 0.03529412, 1,
-0.4241066, 0.6493622, -0.03402636, 0, 1, 0.03921569, 1,
-0.4224908, -0.4216867, -2.430435, 0, 1, 0.04705882, 1,
-0.4154929, 0.7065277, 0.6725481, 0, 1, 0.05098039, 1,
-0.4105353, 0.1607748, -3.006831, 0, 1, 0.05882353, 1,
-0.4061943, 0.5087035, -0.8908928, 0, 1, 0.0627451, 1,
-0.4060078, 0.8614495, 0.07246726, 0, 1, 0.07058824, 1,
-0.4057693, 1.625868, -0.9514934, 0, 1, 0.07450981, 1,
-0.4031606, -0.9477418, -1.137642, 0, 1, 0.08235294, 1,
-0.3962322, 0.3640529, -1.976926, 0, 1, 0.08627451, 1,
-0.3959161, -0.07243443, -2.721371, 0, 1, 0.09411765, 1,
-0.3953578, -0.7792125, -2.742732, 0, 1, 0.1019608, 1,
-0.3926518, 0.5693735, -0.1726013, 0, 1, 0.1058824, 1,
-0.3903793, 2.629979, 1.121608, 0, 1, 0.1137255, 1,
-0.3891551, -0.6337274, -1.736378, 0, 1, 0.1176471, 1,
-0.3845301, 0.7322187, 0.826618, 0, 1, 0.1254902, 1,
-0.3825921, 0.318547, -1.514575, 0, 1, 0.1294118, 1,
-0.3770184, -0.2040894, -2.583351, 0, 1, 0.1372549, 1,
-0.375802, -0.3831579, -2.67033, 0, 1, 0.1411765, 1,
-0.3743126, -0.182993, -1.296883, 0, 1, 0.1490196, 1,
-0.3737558, -1.1493, -2.053855, 0, 1, 0.1529412, 1,
-0.3735077, -1.131744, -3.497309, 0, 1, 0.1607843, 1,
-0.3699563, 0.08553843, -0.9420952, 0, 1, 0.1647059, 1,
-0.3652524, -2.289153, -4.590295, 0, 1, 0.172549, 1,
-0.362258, 0.3841761, -0.5205592, 0, 1, 0.1764706, 1,
-0.3597991, 1.811677, -0.66298, 0, 1, 0.1843137, 1,
-0.359698, 0.7349996, -0.2180705, 0, 1, 0.1882353, 1,
-0.3515612, 3.649845, -0.5451587, 0, 1, 0.1960784, 1,
-0.3491183, 0.7410027, 0.2719701, 0, 1, 0.2039216, 1,
-0.3463234, -1.036213, -2.290531, 0, 1, 0.2078431, 1,
-0.3451658, -0.05838205, -2.514646, 0, 1, 0.2156863, 1,
-0.3427116, 0.7974204, -2.113831, 0, 1, 0.2196078, 1,
-0.3414734, -0.1109861, -2.464641, 0, 1, 0.227451, 1,
-0.3392867, 1.169253, -2.245791, 0, 1, 0.2313726, 1,
-0.335676, -0.6662886, -2.624252, 0, 1, 0.2392157, 1,
-0.3350665, 0.8996188, -0.6462731, 0, 1, 0.2431373, 1,
-0.3337127, -0.9133825, -2.605879, 0, 1, 0.2509804, 1,
-0.3320801, 0.09878591, -4.11442, 0, 1, 0.254902, 1,
-0.3284003, -0.475771, -1.34789, 0, 1, 0.2627451, 1,
-0.3275028, 0.2873471, -0.05239264, 0, 1, 0.2666667, 1,
-0.3268038, -0.06733078, -1.478803, 0, 1, 0.2745098, 1,
-0.3242288, 0.3288587, -1.054805, 0, 1, 0.2784314, 1,
-0.3142387, 0.3826961, 0.2538678, 0, 1, 0.2862745, 1,
-0.3130222, 1.469519, -0.1911794, 0, 1, 0.2901961, 1,
-0.3055673, -0.5769113, -2.980118, 0, 1, 0.2980392, 1,
-0.3027439, -0.2899512, -1.280681, 0, 1, 0.3058824, 1,
-0.2983631, -2.169366, -3.202805, 0, 1, 0.3098039, 1,
-0.2951259, 1.228214, -1.301335, 0, 1, 0.3176471, 1,
-0.2916816, -0.6459658, -0.9197375, 0, 1, 0.3215686, 1,
-0.2854535, 0.3330538, -0.7120987, 0, 1, 0.3294118, 1,
-0.2797774, -0.124338, -1.432424, 0, 1, 0.3333333, 1,
-0.2794711, 0.3729212, -0.8645418, 0, 1, 0.3411765, 1,
-0.2781192, 0.4435178, -1.671349, 0, 1, 0.345098, 1,
-0.2749653, 1.085424, 0.4456587, 0, 1, 0.3529412, 1,
-0.2733544, -1.53189, -2.969427, 0, 1, 0.3568628, 1,
-0.2703138, 0.1871737, -2.226254, 0, 1, 0.3647059, 1,
-0.2663353, 2.493504, -0.4915143, 0, 1, 0.3686275, 1,
-0.2657199, 0.127471, -1.30755, 0, 1, 0.3764706, 1,
-0.2642253, 0.9587653, -1.854538, 0, 1, 0.3803922, 1,
-0.2628022, -0.270931, -3.709067, 0, 1, 0.3882353, 1,
-0.2586855, -0.8797066, -2.674462, 0, 1, 0.3921569, 1,
-0.2521024, 0.2697969, 0.4911961, 0, 1, 0.4, 1,
-0.2477015, 0.7555194, -0.006416756, 0, 1, 0.4078431, 1,
-0.2474873, 0.1685025, -2.582056, 0, 1, 0.4117647, 1,
-0.2468017, -0.7898692, -1.631788, 0, 1, 0.4196078, 1,
-0.2400311, -1.27852, -2.874076, 0, 1, 0.4235294, 1,
-0.2383588, 1.390809, 0.4186093, 0, 1, 0.4313726, 1,
-0.2332686, 0.8650258, 1.037137, 0, 1, 0.4352941, 1,
-0.2306026, -0.7200062, -3.676879, 0, 1, 0.4431373, 1,
-0.2298848, -0.1555817, -0.8841686, 0, 1, 0.4470588, 1,
-0.2260869, -0.4341758, -3.374296, 0, 1, 0.454902, 1,
-0.217065, 1.736621, -0.1076056, 0, 1, 0.4588235, 1,
-0.2129075, -0.2414807, -1.230398, 0, 1, 0.4666667, 1,
-0.2107867, 0.5705482, 0.3285634, 0, 1, 0.4705882, 1,
-0.2098604, -0.3930034, -2.036633, 0, 1, 0.4784314, 1,
-0.2083525, -0.3204583, -2.828706, 0, 1, 0.4823529, 1,
-0.2067291, 1.057883, 1.076868, 0, 1, 0.4901961, 1,
-0.205626, -0.3725842, -2.389338, 0, 1, 0.4941176, 1,
-0.2044242, 1.769482, 0.5798439, 0, 1, 0.5019608, 1,
-0.2031862, 1.515493, 0.7375529, 0, 1, 0.509804, 1,
-0.1997004, -0.4270255, -2.40691, 0, 1, 0.5137255, 1,
-0.1979373, -2.432488, -2.715188, 0, 1, 0.5215687, 1,
-0.1966651, -0.6138858, -2.414083, 0, 1, 0.5254902, 1,
-0.1938793, 0.9874761, 0.7445726, 0, 1, 0.5333334, 1,
-0.1926037, -0.9870501, -3.741992, 0, 1, 0.5372549, 1,
-0.191146, 1.462276, 0.8618471, 0, 1, 0.5450981, 1,
-0.1896005, 0.4344207, -0.4052099, 0, 1, 0.5490196, 1,
-0.1873793, 1.634541, 0.3661148, 0, 1, 0.5568628, 1,
-0.1858369, -0.04217829, -3.531191, 0, 1, 0.5607843, 1,
-0.1773665, 1.752693, 0.7336596, 0, 1, 0.5686275, 1,
-0.1745564, 1.091562, -0.6670827, 0, 1, 0.572549, 1,
-0.1664004, 1.201234, -1.846684, 0, 1, 0.5803922, 1,
-0.1550835, -0.8160861, -3.705606, 0, 1, 0.5843138, 1,
-0.1527941, -0.2251988, -1.273665, 0, 1, 0.5921569, 1,
-0.1499847, -1.528513, -4.954535, 0, 1, 0.5960785, 1,
-0.1478671, -0.1775283, -2.738773, 0, 1, 0.6039216, 1,
-0.1469773, 0.8168525, -1.507364, 0, 1, 0.6117647, 1,
-0.1455238, 0.2410155, -0.11721, 0, 1, 0.6156863, 1,
-0.1451395, -0.4469736, -2.158394, 0, 1, 0.6235294, 1,
-0.1448062, 1.069612, -1.301805, 0, 1, 0.627451, 1,
-0.1446547, -1.606016, -3.275808, 0, 1, 0.6352941, 1,
-0.1443982, 0.1666203, -2.059995, 0, 1, 0.6392157, 1,
-0.1420267, -0.9510413, -1.583961, 0, 1, 0.6470588, 1,
-0.136926, 0.8187444, -0.4065004, 0, 1, 0.6509804, 1,
-0.1343006, 0.3345474, -0.4935977, 0, 1, 0.6588235, 1,
-0.1295839, 1.384999, 0.5688407, 0, 1, 0.6627451, 1,
-0.1206489, 0.7895223, -1.572012, 0, 1, 0.6705883, 1,
-0.1198531, -1.122247, -2.62026, 0, 1, 0.6745098, 1,
-0.1197386, 0.1077948, -0.582251, 0, 1, 0.682353, 1,
-0.1181136, -1.480541, -3.578196, 0, 1, 0.6862745, 1,
-0.1162668, -1.225053, -2.11087, 0, 1, 0.6941177, 1,
-0.1117739, -0.06419062, -2.654833, 0, 1, 0.7019608, 1,
-0.1080623, 0.3147197, 1.458909, 0, 1, 0.7058824, 1,
-0.104998, -0.4084055, -3.428172, 0, 1, 0.7137255, 1,
-0.1044308, 0.2416219, -0.3268518, 0, 1, 0.7176471, 1,
-0.1033702, -1.012698, -1.608293, 0, 1, 0.7254902, 1,
-0.1023718, 0.4257915, 0.192748, 0, 1, 0.7294118, 1,
-0.09045641, 2.014931, 0.3415815, 0, 1, 0.7372549, 1,
-0.08958696, -0.4042381, -2.12397, 0, 1, 0.7411765, 1,
-0.08953097, -0.3147585, -3.093321, 0, 1, 0.7490196, 1,
-0.08735407, 0.7339383, -0.529335, 0, 1, 0.7529412, 1,
-0.08263493, -1.311192, -7.167071, 0, 1, 0.7607843, 1,
-0.08239958, -2.314387, -1.717209, 0, 1, 0.7647059, 1,
-0.08009843, 2.186862, -0.8085766, 0, 1, 0.772549, 1,
-0.07619686, 0.7146711, -1.380808, 0, 1, 0.7764706, 1,
-0.07146234, -0.1097198, -1.994635, 0, 1, 0.7843137, 1,
-0.06900433, -0.9699901, -2.075518, 0, 1, 0.7882353, 1,
-0.06563491, -1.049802, -5.465081, 0, 1, 0.7960784, 1,
-0.06262171, -0.9959012, -4.7066, 0, 1, 0.8039216, 1,
-0.06250555, -1.081851, -3.547169, 0, 1, 0.8078431, 1,
-0.06128537, 1.246142, -1.094446, 0, 1, 0.8156863, 1,
-0.05364876, -1.255522, -2.451966, 0, 1, 0.8196079, 1,
-0.05055647, -0.1726987, -1.89392, 0, 1, 0.827451, 1,
-0.04961133, -0.3045912, -4.107673, 0, 1, 0.8313726, 1,
-0.04734329, 0.2904268, 1.151089, 0, 1, 0.8392157, 1,
-0.04514055, 0.1003715, -0.9272414, 0, 1, 0.8431373, 1,
-0.04388466, 0.7536947, -0.1559349, 0, 1, 0.8509804, 1,
-0.03779846, -0.5446132, -2.192905, 0, 1, 0.854902, 1,
-0.03748109, 1.117519, 0.5152464, 0, 1, 0.8627451, 1,
-0.03363745, -0.5572229, -3.61346, 0, 1, 0.8666667, 1,
-0.03317856, -0.01237963, -2.811931, 0, 1, 0.8745098, 1,
-0.03141971, -1.299312, -2.14678, 0, 1, 0.8784314, 1,
-0.02968362, 0.7053711, 0.8245322, 0, 1, 0.8862745, 1,
-0.02598126, 0.01443384, -0.9389513, 0, 1, 0.8901961, 1,
-0.02545737, 0.4432297, 1.446959, 0, 1, 0.8980392, 1,
-0.024505, 0.3829655, -1.29924, 0, 1, 0.9058824, 1,
-0.02169453, 0.1569585, -0.1571222, 0, 1, 0.9098039, 1,
-0.02114144, -0.6842119, -3.247937, 0, 1, 0.9176471, 1,
-0.02022474, -0.5718127, -4.259752, 0, 1, 0.9215686, 1,
-0.01894314, -0.9188582, -0.7859147, 0, 1, 0.9294118, 1,
-0.01794023, 0.1683702, -1.482866, 0, 1, 0.9333333, 1,
-0.01791458, -0.1837595, -3.664118, 0, 1, 0.9411765, 1,
-0.01613473, -1.199594, -3.545141, 0, 1, 0.945098, 1,
-0.01606249, -0.2323883, -3.290048, 0, 1, 0.9529412, 1,
-0.01266284, -0.07888323, -2.922077, 0, 1, 0.9568627, 1,
-0.01258963, -0.6483174, -3.611784, 0, 1, 0.9647059, 1,
-0.01027742, 0.5415789, 1.651527, 0, 1, 0.9686275, 1,
-0.006304737, 0.450809, 0.799798, 0, 1, 0.9764706, 1,
-0.005773928, -0.6648866, -3.400931, 0, 1, 0.9803922, 1,
-0.003885043, -0.4748132, -4.754885, 0, 1, 0.9882353, 1,
0.004993231, -1.654019, 2.429641, 0, 1, 0.9921569, 1,
0.00577267, -0.5297521, 2.603158, 0, 1, 1, 1,
0.01073356, -1.606289, 2.058839, 0, 0.9921569, 1, 1,
0.0163982, -0.6109218, 2.969753, 0, 0.9882353, 1, 1,
0.02061591, 1.647048, 1.651588, 0, 0.9803922, 1, 1,
0.02580385, 0.03998024, -0.4092419, 0, 0.9764706, 1, 1,
0.02634728, -0.9215569, 5.171222, 0, 0.9686275, 1, 1,
0.03222874, -0.7657223, 1.256525, 0, 0.9647059, 1, 1,
0.033284, 0.7065472, -0.07188765, 0, 0.9568627, 1, 1,
0.03361668, 0.9106855, -1.110793, 0, 0.9529412, 1, 1,
0.03517301, 0.3786918, -0.07431286, 0, 0.945098, 1, 1,
0.03522716, -1.02221, 3.424267, 0, 0.9411765, 1, 1,
0.04207666, 0.3464576, 0.28407, 0, 0.9333333, 1, 1,
0.04678399, -3.217288, 1.72441, 0, 0.9294118, 1, 1,
0.04834084, 0.03257261, -0.2739083, 0, 0.9215686, 1, 1,
0.06002267, -0.7246399, 2.889033, 0, 0.9176471, 1, 1,
0.06243423, -0.5896998, 2.600756, 0, 0.9098039, 1, 1,
0.07042743, -0.2680376, 2.35887, 0, 0.9058824, 1, 1,
0.07360159, -0.02398193, 1.77698, 0, 0.8980392, 1, 1,
0.0767319, 0.9200119, -1.09682, 0, 0.8901961, 1, 1,
0.0838762, 0.2936508, 0.8985566, 0, 0.8862745, 1, 1,
0.08429548, 0.6860145, 0.9163139, 0, 0.8784314, 1, 1,
0.0852077, 0.7143772, 0.2679383, 0, 0.8745098, 1, 1,
0.08749207, -1.071788, 1.958769, 0, 0.8666667, 1, 1,
0.08753487, -1.279947, 1.889652, 0, 0.8627451, 1, 1,
0.08821611, -0.7058473, 2.47311, 0, 0.854902, 1, 1,
0.09399235, -1.027034, 1.206836, 0, 0.8509804, 1, 1,
0.1052967, -0.05462877, 2.327253, 0, 0.8431373, 1, 1,
0.10557, -0.2419337, 4.140085, 0, 0.8392157, 1, 1,
0.1088764, 1.064583, 1.342836, 0, 0.8313726, 1, 1,
0.1125743, -1.227046, 3.476935, 0, 0.827451, 1, 1,
0.1126079, 2.176164, 0.8466637, 0, 0.8196079, 1, 1,
0.1160498, 0.4065694, -0.4498604, 0, 0.8156863, 1, 1,
0.1174119, 0.1962572, 0.268531, 0, 0.8078431, 1, 1,
0.1185836, -1.25445, 1.869574, 0, 0.8039216, 1, 1,
0.1204193, 0.606637, -0.5439878, 0, 0.7960784, 1, 1,
0.1215908, 0.3741869, -0.5463954, 0, 0.7882353, 1, 1,
0.1218033, -0.4343987, 2.938471, 0, 0.7843137, 1, 1,
0.1254566, -0.2282849, 3.03596, 0, 0.7764706, 1, 1,
0.130988, -2.108316, 3.603436, 0, 0.772549, 1, 1,
0.1333186, -0.6869488, -0.3603989, 0, 0.7647059, 1, 1,
0.136042, -1.348743, 4.150352, 0, 0.7607843, 1, 1,
0.1360761, -0.6384279, 2.235272, 0, 0.7529412, 1, 1,
0.136458, 1.901734, 0.4196585, 0, 0.7490196, 1, 1,
0.1380503, 0.7054799, -1.122398, 0, 0.7411765, 1, 1,
0.1383062, 0.005589189, -0.3885755, 0, 0.7372549, 1, 1,
0.1388484, -1.520734, 2.687733, 0, 0.7294118, 1, 1,
0.1443996, 0.57555, 2.085178, 0, 0.7254902, 1, 1,
0.1464864, -1.003174, 5.877457, 0, 0.7176471, 1, 1,
0.1492143, -0.07467216, 2.258138, 0, 0.7137255, 1, 1,
0.1544615, 0.0925326, 2.457368, 0, 0.7058824, 1, 1,
0.1549927, -0.3089363, 1.429916, 0, 0.6980392, 1, 1,
0.1582833, 0.01805055, 2.037963, 0, 0.6941177, 1, 1,
0.1589947, -0.9529719, 2.632554, 0, 0.6862745, 1, 1,
0.1619156, -1.135825, 2.928355, 0, 0.682353, 1, 1,
0.1623546, 0.004233665, 1.441628, 0, 0.6745098, 1, 1,
0.1647135, 0.3234027, 1.082769, 0, 0.6705883, 1, 1,
0.1648038, -0.5916622, 4.331362, 0, 0.6627451, 1, 1,
0.1693567, 1.410911, 0.226674, 0, 0.6588235, 1, 1,
0.1734521, -0.02194277, 1.438387, 0, 0.6509804, 1, 1,
0.1790787, 0.8872622, 0.6201378, 0, 0.6470588, 1, 1,
0.1848051, -0.654949, 4.089197, 0, 0.6392157, 1, 1,
0.1850907, 0.6846169, -0.5111881, 0, 0.6352941, 1, 1,
0.1852454, -0.9389452, 1.476073, 0, 0.627451, 1, 1,
0.1863321, 0.5205789, 0.2791333, 0, 0.6235294, 1, 1,
0.1882455, 0.3154168, -0.5647655, 0, 0.6156863, 1, 1,
0.1885175, -1.728043, 3.539539, 0, 0.6117647, 1, 1,
0.1923531, 0.8183682, 0.5549475, 0, 0.6039216, 1, 1,
0.1930143, 0.4397108, 0.0007454634, 0, 0.5960785, 1, 1,
0.2001623, -1.367347, 5.94084, 0, 0.5921569, 1, 1,
0.2012012, -1.027613, 3.230954, 0, 0.5843138, 1, 1,
0.2028156, 0.1518877, 2.640058, 0, 0.5803922, 1, 1,
0.2050834, -0.0006795165, 2.163536, 0, 0.572549, 1, 1,
0.206411, -0.1766665, 0.5340282, 0, 0.5686275, 1, 1,
0.2127624, -0.8276006, 2.541794, 0, 0.5607843, 1, 1,
0.2136671, -1.29893, 3.320762, 0, 0.5568628, 1, 1,
0.2170703, 1.455042, 2.768739, 0, 0.5490196, 1, 1,
0.2177526, -1.340878, 4.836178, 0, 0.5450981, 1, 1,
0.2207971, 1.448623, 0.5662693, 0, 0.5372549, 1, 1,
0.2211232, 0.6083472, 0.4392295, 0, 0.5333334, 1, 1,
0.2248998, 0.4436251, 0.965392, 0, 0.5254902, 1, 1,
0.2259504, 0.8059112, -0.8001661, 0, 0.5215687, 1, 1,
0.2289538, -0.08880351, 3.580781, 0, 0.5137255, 1, 1,
0.2291865, 0.8262599, -1.004898, 0, 0.509804, 1, 1,
0.2302147, 2.294281, -0.4823924, 0, 0.5019608, 1, 1,
0.2312895, -1.045065, 1.464631, 0, 0.4941176, 1, 1,
0.2317336, 0.7383366, 1.29203, 0, 0.4901961, 1, 1,
0.2458807, -0.6220843, 3.056613, 0, 0.4823529, 1, 1,
0.2500776, 0.4020766, 1.497683, 0, 0.4784314, 1, 1,
0.2511702, -0.4329256, 2.420461, 0, 0.4705882, 1, 1,
0.2517, -0.2275218, 0.538444, 0, 0.4666667, 1, 1,
0.2520222, -1.129827, 3.107397, 0, 0.4588235, 1, 1,
0.2534573, 0.09111416, 1.850375, 0, 0.454902, 1, 1,
0.2582471, 0.9520519, 2.950296, 0, 0.4470588, 1, 1,
0.2628344, 0.6993203, 0.3316914, 0, 0.4431373, 1, 1,
0.267656, 0.3371708, 1.821198, 0, 0.4352941, 1, 1,
0.2706647, -0.2296204, 2.737805, 0, 0.4313726, 1, 1,
0.2754462, 0.06802525, 1.890803, 0, 0.4235294, 1, 1,
0.2774369, -0.9885024, 3.65566, 0, 0.4196078, 1, 1,
0.280701, -0.4102955, 3.138173, 0, 0.4117647, 1, 1,
0.2814452, -0.8578607, 2.749268, 0, 0.4078431, 1, 1,
0.2840174, -1.140823, 4.388678, 0, 0.4, 1, 1,
0.2842355, 1.264263, 0.2000778, 0, 0.3921569, 1, 1,
0.2865891, -2.352631, 2.102581, 0, 0.3882353, 1, 1,
0.2893876, 0.2743243, 1.453456, 0, 0.3803922, 1, 1,
0.2901756, -0.2642213, 3.053141, 0, 0.3764706, 1, 1,
0.2933645, 0.3128865, 1.026495, 0, 0.3686275, 1, 1,
0.2964134, 0.1962359, 0.544552, 0, 0.3647059, 1, 1,
0.2974319, -0.7055339, 2.547058, 0, 0.3568628, 1, 1,
0.2981834, -0.1325121, 1.268879, 0, 0.3529412, 1, 1,
0.3031166, -0.5927559, 1.879472, 0, 0.345098, 1, 1,
0.3032969, -1.110265, 3.24217, 0, 0.3411765, 1, 1,
0.3057487, -0.7135029, 4.677441, 0, 0.3333333, 1, 1,
0.3063855, 0.5657659, 1.091225, 0, 0.3294118, 1, 1,
0.3076364, -0.03338483, 1.955051, 0, 0.3215686, 1, 1,
0.3131465, -0.4148699, 2.791172, 0, 0.3176471, 1, 1,
0.3139477, -0.5120892, 1.641575, 0, 0.3098039, 1, 1,
0.3149965, -0.9292814, 1.827672, 0, 0.3058824, 1, 1,
0.3155283, -0.745668, 3.108431, 0, 0.2980392, 1, 1,
0.3157982, -1.40163, 3.57899, 0, 0.2901961, 1, 1,
0.315954, -1.559754, 3.072408, 0, 0.2862745, 1, 1,
0.3159874, 0.009079936, 2.539959, 0, 0.2784314, 1, 1,
0.3187666, 1.187728, -0.1451, 0, 0.2745098, 1, 1,
0.3218985, 0.3371217, 1.541726, 0, 0.2666667, 1, 1,
0.3225287, 0.1623938, 2.70057, 0, 0.2627451, 1, 1,
0.3280908, -0.1909124, 2.266017, 0, 0.254902, 1, 1,
0.3284883, -0.1096992, 1.56704, 0, 0.2509804, 1, 1,
0.329124, 0.7570314, 0.006137817, 0, 0.2431373, 1, 1,
0.3305488, 0.7405555, 0.1656984, 0, 0.2392157, 1, 1,
0.3305511, 0.5095249, -0.1616148, 0, 0.2313726, 1, 1,
0.3315321, 1.459853, 0.6929548, 0, 0.227451, 1, 1,
0.3321919, -0.9018903, 1.337938, 0, 0.2196078, 1, 1,
0.3369058, 0.5215698, -1.247393, 0, 0.2156863, 1, 1,
0.3397551, -1.561625, 2.263719, 0, 0.2078431, 1, 1,
0.3411225, 0.3315467, 0.6124893, 0, 0.2039216, 1, 1,
0.3417291, 3.180589, 0.6857297, 0, 0.1960784, 1, 1,
0.3424768, -1.433568, 1.554159, 0, 0.1882353, 1, 1,
0.3465893, 0.7466701, 1.602449, 0, 0.1843137, 1, 1,
0.3475757, -0.7821359, 0.9656393, 0, 0.1764706, 1, 1,
0.3478573, -1.883164, 2.746102, 0, 0.172549, 1, 1,
0.3568848, -0.006480141, 2.58787, 0, 0.1647059, 1, 1,
0.3572097, 0.1689557, 1.150946, 0, 0.1607843, 1, 1,
0.3577114, -1.046934, 2.81564, 0, 0.1529412, 1, 1,
0.3649899, -1.753812, 2.679492, 0, 0.1490196, 1, 1,
0.3652402, -0.2359234, 2.840286, 0, 0.1411765, 1, 1,
0.3655447, 0.3236469, 0.6600383, 0, 0.1372549, 1, 1,
0.3658355, -0.4263103, 0.772777, 0, 0.1294118, 1, 1,
0.3677181, 0.8713934, 0.2309881, 0, 0.1254902, 1, 1,
0.3696555, 0.3390492, 2.78571, 0, 0.1176471, 1, 1,
0.371213, -0.740967, 3.634552, 0, 0.1137255, 1, 1,
0.3813948, -0.3672157, 1.171836, 0, 0.1058824, 1, 1,
0.3855668, -1.660748, 1.609015, 0, 0.09803922, 1, 1,
0.3870277, 1.062908, -0.6840546, 0, 0.09411765, 1, 1,
0.3969923, 0.5153202, 0.524032, 0, 0.08627451, 1, 1,
0.3998693, -0.4083994, 0.9211041, 0, 0.08235294, 1, 1,
0.4028625, -0.9174966, 1.955945, 0, 0.07450981, 1, 1,
0.4054353, -1.785556, 4.067636, 0, 0.07058824, 1, 1,
0.4059857, 0.3523481, -0.4000336, 0, 0.0627451, 1, 1,
0.4116691, -0.6970354, 0.8929901, 0, 0.05882353, 1, 1,
0.416578, -0.1380622, 0.5370046, 0, 0.05098039, 1, 1,
0.4177498, 0.3406367, 1.218492, 0, 0.04705882, 1, 1,
0.4197138, 0.7512512, 0.8071333, 0, 0.03921569, 1, 1,
0.4204871, 0.1695136, 2.98383, 0, 0.03529412, 1, 1,
0.4277421, -1.036391, 3.255466, 0, 0.02745098, 1, 1,
0.4282745, -1.202546, 2.568065, 0, 0.02352941, 1, 1,
0.4302438, 2.404029, 0.6242223, 0, 0.01568628, 1, 1,
0.4314941, 0.08800383, 1.774162, 0, 0.01176471, 1, 1,
0.4327669, 2.422801, -0.6094121, 0, 0.003921569, 1, 1,
0.435448, 1.243516, -0.1825768, 0.003921569, 0, 1, 1,
0.4354577, 0.6857546, -1.064048, 0.007843138, 0, 1, 1,
0.4361238, 0.6512377, 0.9136002, 0.01568628, 0, 1, 1,
0.437406, -0.9123614, 3.148788, 0.01960784, 0, 1, 1,
0.4393662, -0.9932654, 4.610611, 0.02745098, 0, 1, 1,
0.4412695, -1.926909, 2.473132, 0.03137255, 0, 1, 1,
0.4431522, 0.1734477, 0.3970942, 0.03921569, 0, 1, 1,
0.4434501, -2.152029, 3.892076, 0.04313726, 0, 1, 1,
0.4436536, 1.039598, 0.5245991, 0.05098039, 0, 1, 1,
0.4446039, 0.3672157, 1.107286, 0.05490196, 0, 1, 1,
0.4456822, -0.1350956, 3.611903, 0.0627451, 0, 1, 1,
0.4462836, 1.072957, -1.042431, 0.06666667, 0, 1, 1,
0.4524837, 0.320581, -0.3999578, 0.07450981, 0, 1, 1,
0.4564434, 0.2795459, 2.747638, 0.07843138, 0, 1, 1,
0.4597407, 0.7518713, 0.3377007, 0.08627451, 0, 1, 1,
0.4656799, 0.8563792, 1.099087, 0.09019608, 0, 1, 1,
0.4689815, 0.3686003, 3.481075, 0.09803922, 0, 1, 1,
0.4694343, 1.695348, -0.8580655, 0.1058824, 0, 1, 1,
0.4705552, -1.001298, 4.560436, 0.1098039, 0, 1, 1,
0.472086, 0.466303, -0.8271593, 0.1176471, 0, 1, 1,
0.4721359, -0.9731042, 3.032589, 0.1215686, 0, 1, 1,
0.4728273, -0.3645633, 2.633938, 0.1294118, 0, 1, 1,
0.4746306, -0.5324028, 3.888506, 0.1333333, 0, 1, 1,
0.4758503, 0.2771624, -1.216591, 0.1411765, 0, 1, 1,
0.4767262, 0.1132606, 0.3446912, 0.145098, 0, 1, 1,
0.482839, -1.520715, 3.200513, 0.1529412, 0, 1, 1,
0.4856762, 0.466658, 0.03538542, 0.1568628, 0, 1, 1,
0.4913576, 0.2111357, 0.2255522, 0.1647059, 0, 1, 1,
0.4947447, -0.5965792, 2.752249, 0.1686275, 0, 1, 1,
0.4947816, -0.9630843, 1.30691, 0.1764706, 0, 1, 1,
0.5029164, 0.2540375, 0.4396511, 0.1803922, 0, 1, 1,
0.5029917, -1.055168, 2.255514, 0.1882353, 0, 1, 1,
0.5101492, 0.8586248, 0.151458, 0.1921569, 0, 1, 1,
0.513082, 1.226853, -0.3204651, 0.2, 0, 1, 1,
0.5148039, 0.2352148, -0.1381708, 0.2078431, 0, 1, 1,
0.5174859, 0.6880273, 0.2421793, 0.2117647, 0, 1, 1,
0.5282688, 0.8059443, -0.2930742, 0.2196078, 0, 1, 1,
0.5313591, -0.456833, 1.673533, 0.2235294, 0, 1, 1,
0.5329626, 0.9285255, 0.9612638, 0.2313726, 0, 1, 1,
0.5335144, 0.4826762, 1.187953, 0.2352941, 0, 1, 1,
0.5360733, -0.04842453, 2.182436, 0.2431373, 0, 1, 1,
0.5376037, -0.1109666, 0.8655699, 0.2470588, 0, 1, 1,
0.5391485, -0.6045593, 2.655464, 0.254902, 0, 1, 1,
0.5411145, -0.7134579, 0.7705204, 0.2588235, 0, 1, 1,
0.5433543, -0.1744981, 0.9676371, 0.2666667, 0, 1, 1,
0.5447806, 0.9482784, -1.034382, 0.2705882, 0, 1, 1,
0.5473267, 0.07275785, -1.059968, 0.2784314, 0, 1, 1,
0.5538746, 1.103914, 0.1628163, 0.282353, 0, 1, 1,
0.5552334, -1.139521, 2.511261, 0.2901961, 0, 1, 1,
0.5562943, 0.8870215, -0.4687483, 0.2941177, 0, 1, 1,
0.5589294, 0.3008789, -0.2157559, 0.3019608, 0, 1, 1,
0.5626023, 0.5994788, 0.7918391, 0.3098039, 0, 1, 1,
0.5667566, 1.392731, 0.8858944, 0.3137255, 0, 1, 1,
0.5677735, -0.752336, 1.34294, 0.3215686, 0, 1, 1,
0.5748098, 0.7823672, -0.1247897, 0.3254902, 0, 1, 1,
0.5758629, -1.208333, 1.169538, 0.3333333, 0, 1, 1,
0.5840123, -0.7277362, 1.538612, 0.3372549, 0, 1, 1,
0.5897038, -0.003010731, 2.316699, 0.345098, 0, 1, 1,
0.5931678, 1.215889, 1.188442, 0.3490196, 0, 1, 1,
0.5972251, 0.179856, 2.831879, 0.3568628, 0, 1, 1,
0.5984403, 0.7067758, 2.126165, 0.3607843, 0, 1, 1,
0.6013587, 0.9270137, 0.9620359, 0.3686275, 0, 1, 1,
0.6021488, -0.2245563, 2.589048, 0.372549, 0, 1, 1,
0.6069178, -0.8765606, 2.669126, 0.3803922, 0, 1, 1,
0.6074665, 0.2667738, 0.6849989, 0.3843137, 0, 1, 1,
0.6082462, -1.100877, 2.856188, 0.3921569, 0, 1, 1,
0.610015, -1.211921, 3.070713, 0.3960784, 0, 1, 1,
0.6128731, -0.5913582, 2.945617, 0.4039216, 0, 1, 1,
0.6154225, -2.28369, 3.712952, 0.4117647, 0, 1, 1,
0.6164251, 1.970497, 0.4446509, 0.4156863, 0, 1, 1,
0.6204057, 0.7478036, 0.6275866, 0.4235294, 0, 1, 1,
0.6241978, 0.312117, -0.8467163, 0.427451, 0, 1, 1,
0.6276917, 1.553208, 0.7517822, 0.4352941, 0, 1, 1,
0.6328823, -0.2414345, 2.59242, 0.4392157, 0, 1, 1,
0.6329543, 0.6966521, 1.007418, 0.4470588, 0, 1, 1,
0.6347504, 0.4272464, 0.2516807, 0.4509804, 0, 1, 1,
0.6405412, 0.3090062, 0.6225784, 0.4588235, 0, 1, 1,
0.6415158, 0.4440504, 0.4901911, 0.4627451, 0, 1, 1,
0.6450697, -1.098496, 2.818462, 0.4705882, 0, 1, 1,
0.6543873, -0.462804, 2.052761, 0.4745098, 0, 1, 1,
0.6609568, 0.5852903, 0.466157, 0.4823529, 0, 1, 1,
0.6622985, 0.0816377, 0.7473235, 0.4862745, 0, 1, 1,
0.6657893, 0.3993796, 0.918344, 0.4941176, 0, 1, 1,
0.6675112, 0.6762986, 0.05861996, 0.5019608, 0, 1, 1,
0.6777049, 0.3367798, 0.4432812, 0.5058824, 0, 1, 1,
0.6780025, -1.142264, 2.924808, 0.5137255, 0, 1, 1,
0.6781056, -0.5942359, 4.964353, 0.5176471, 0, 1, 1,
0.6817269, -0.1018426, 3.041292, 0.5254902, 0, 1, 1,
0.6835415, 1.355114, -0.7541929, 0.5294118, 0, 1, 1,
0.6854686, 0.4075533, -0.6984865, 0.5372549, 0, 1, 1,
0.6863102, 0.3787418, -0.5369797, 0.5411765, 0, 1, 1,
0.6865875, -0.2705331, -1.016751, 0.5490196, 0, 1, 1,
0.6869984, -0.8931686, 3.930643, 0.5529412, 0, 1, 1,
0.6871212, -0.113046, -0.6095764, 0.5607843, 0, 1, 1,
0.68745, 1.802356, 0.07054689, 0.5647059, 0, 1, 1,
0.6888595, -0.5966915, 1.976406, 0.572549, 0, 1, 1,
0.6915151, 1.224546, 1.857375, 0.5764706, 0, 1, 1,
0.6995184, -0.8775237, 2.052833, 0.5843138, 0, 1, 1,
0.700277, 0.1345553, 2.25337, 0.5882353, 0, 1, 1,
0.7010881, -0.09900362, 1.541892, 0.5960785, 0, 1, 1,
0.7036409, 0.316603, 2.508983, 0.6039216, 0, 1, 1,
0.7083009, 1.937227, -0.05378555, 0.6078432, 0, 1, 1,
0.716736, -0.6264832, 1.685399, 0.6156863, 0, 1, 1,
0.7176167, 0.05793938, 2.352159, 0.6196079, 0, 1, 1,
0.7187538, -0.03567239, -0.3571849, 0.627451, 0, 1, 1,
0.7196572, -1.040736, 2.605467, 0.6313726, 0, 1, 1,
0.7197903, -0.2437835, 2.373994, 0.6392157, 0, 1, 1,
0.7322497, 1.015252, 0.3071701, 0.6431373, 0, 1, 1,
0.733848, -0.308388, -0.9413521, 0.6509804, 0, 1, 1,
0.7357678, -1.830411, 2.70804, 0.654902, 0, 1, 1,
0.7402319, -0.08929791, 2.330033, 0.6627451, 0, 1, 1,
0.7418685, -2.244774, 4.277473, 0.6666667, 0, 1, 1,
0.7427285, 0.5611439, -0.02976413, 0.6745098, 0, 1, 1,
0.7488122, 2.638119, 0.376933, 0.6784314, 0, 1, 1,
0.7537858, 0.2916512, 2.9313, 0.6862745, 0, 1, 1,
0.7540334, 0.6021976, 0.7188752, 0.6901961, 0, 1, 1,
0.7547249, -0.4707864, 2.08822, 0.6980392, 0, 1, 1,
0.7590542, 1.244161, 0.1599159, 0.7058824, 0, 1, 1,
0.7663589, 0.3214972, 0.9296708, 0.7098039, 0, 1, 1,
0.7667224, -1.299376, 3.606764, 0.7176471, 0, 1, 1,
0.7700007, 1.099309, 1.063473, 0.7215686, 0, 1, 1,
0.771852, 0.1083516, 3.06931, 0.7294118, 0, 1, 1,
0.77473, -1.288491, 3.490151, 0.7333333, 0, 1, 1,
0.7755246, -1.456467, 2.664582, 0.7411765, 0, 1, 1,
0.7767566, 1.431717, 0.3638536, 0.7450981, 0, 1, 1,
0.7776625, -1.260724, 2.649922, 0.7529412, 0, 1, 1,
0.7835752, 0.9590247, 0.3027726, 0.7568628, 0, 1, 1,
0.7861859, -0.9927368, 2.330814, 0.7647059, 0, 1, 1,
0.7888238, -0.8112742, 0.831138, 0.7686275, 0, 1, 1,
0.7930132, -0.6504351, 1.958825, 0.7764706, 0, 1, 1,
0.793771, 0.289409, 0.1793518, 0.7803922, 0, 1, 1,
0.8024431, -0.4214286, 1.619447, 0.7882353, 0, 1, 1,
0.8142211, 0.1827504, 1.959001, 0.7921569, 0, 1, 1,
0.8152674, -0.07034924, 1.963753, 0.8, 0, 1, 1,
0.817795, -0.7243795, 4.150878, 0.8078431, 0, 1, 1,
0.8199717, 0.6500531, 1.988754, 0.8117647, 0, 1, 1,
0.8205941, -0.4387922, 0.8099423, 0.8196079, 0, 1, 1,
0.8244271, 0.8420807, 0.5361366, 0.8235294, 0, 1, 1,
0.829972, -2.187393, 3.352222, 0.8313726, 0, 1, 1,
0.853523, -0.5255334, 2.935173, 0.8352941, 0, 1, 1,
0.8542175, -0.2473895, 1.789902, 0.8431373, 0, 1, 1,
0.8604713, -0.4046387, 1.434544, 0.8470588, 0, 1, 1,
0.8700413, 0.576139, -0.213612, 0.854902, 0, 1, 1,
0.8725313, 0.1475244, 1.176806, 0.8588235, 0, 1, 1,
0.8740088, -0.6604078, 1.508724, 0.8666667, 0, 1, 1,
0.8797866, -1.866478, 1.82511, 0.8705882, 0, 1, 1,
0.8820738, 0.8282146, 0.676, 0.8784314, 0, 1, 1,
0.8827332, 0.9637492, 1.207172, 0.8823529, 0, 1, 1,
0.8932588, 0.1957244, 2.300465, 0.8901961, 0, 1, 1,
0.9077216, 0.5317267, -0.06535517, 0.8941177, 0, 1, 1,
0.9111858, 1.811712, 1.548412, 0.9019608, 0, 1, 1,
0.9148588, -0.07653414, 2.529823, 0.9098039, 0, 1, 1,
0.9163939, 0.5262459, -0.04879608, 0.9137255, 0, 1, 1,
0.9166762, 0.6435241, -0.6268767, 0.9215686, 0, 1, 1,
0.9170862, 0.1216968, 1.692716, 0.9254902, 0, 1, 1,
0.9199745, -1.158218, 2.476291, 0.9333333, 0, 1, 1,
0.9237286, 1.457345, 0.4358591, 0.9372549, 0, 1, 1,
0.9242579, 0.6185566, 2.428918, 0.945098, 0, 1, 1,
0.9282741, -1.11373, 3.041918, 0.9490196, 0, 1, 1,
0.9335353, 0.583155, -0.8683473, 0.9568627, 0, 1, 1,
0.9341679, 0.5497127, 0.428088, 0.9607843, 0, 1, 1,
0.9372085, 0.006481323, 0.623586, 0.9686275, 0, 1, 1,
0.9380426, -0.2624381, 2.046042, 0.972549, 0, 1, 1,
0.9398437, -0.7042848, 3.264632, 0.9803922, 0, 1, 1,
0.9550368, 0.573822, 1.972284, 0.9843137, 0, 1, 1,
0.955076, -0.4941889, 2.703906, 0.9921569, 0, 1, 1,
0.9573066, -1.648291, 1.535988, 0.9960784, 0, 1, 1,
0.9604687, -0.4929962, 4.400109, 1, 0, 0.9960784, 1,
0.9636873, -1.404632, 1.463236, 1, 0, 0.9882353, 1,
0.9747248, -0.6224557, 0.7848804, 1, 0, 0.9843137, 1,
0.9804899, -0.6470042, 2.223824, 1, 0, 0.9764706, 1,
0.9869824, -1.79004, 2.42426, 1, 0, 0.972549, 1,
0.9879329, -0.9618341, 2.538487, 1, 0, 0.9647059, 1,
0.993024, -0.8397726, 2.26056, 1, 0, 0.9607843, 1,
0.9978179, 0.01199051, 1.089465, 1, 0, 0.9529412, 1,
0.9980538, -0.3549185, 0.770991, 1, 0, 0.9490196, 1,
0.9981943, -1.534637, 2.085464, 1, 0, 0.9411765, 1,
0.9997562, -2.745003, 3.796838, 1, 0, 0.9372549, 1,
1.009604, 0.2603151, 2.451054, 1, 0, 0.9294118, 1,
1.018017, 0.9748356, -0.5981697, 1, 0, 0.9254902, 1,
1.028062, 2.525263, -0.3283065, 1, 0, 0.9176471, 1,
1.033545, 0.243727, 1.768609, 1, 0, 0.9137255, 1,
1.051914, -2.504463, 3.540045, 1, 0, 0.9058824, 1,
1.053546, 0.362626, 0.7865126, 1, 0, 0.9019608, 1,
1.055581, 0.3433715, 2.524539, 1, 0, 0.8941177, 1,
1.061227, 1.064384, 0.5627371, 1, 0, 0.8862745, 1,
1.070921, 1.284333, 1.02189, 1, 0, 0.8823529, 1,
1.071691, -1.2279, 0.9947902, 1, 0, 0.8745098, 1,
1.084595, -1.210372, 3.033414, 1, 0, 0.8705882, 1,
1.091015, 0.3348247, 3.295594, 1, 0, 0.8627451, 1,
1.096244, 1.013133, -0.422117, 1, 0, 0.8588235, 1,
1.100784, -0.6865801, 1.594785, 1, 0, 0.8509804, 1,
1.10208, -0.486331, 1.561965, 1, 0, 0.8470588, 1,
1.108095, 0.9655796, -0.6014501, 1, 0, 0.8392157, 1,
1.108336, -0.02979142, 1.571773, 1, 0, 0.8352941, 1,
1.109938, 1.609334, 1.195928, 1, 0, 0.827451, 1,
1.114896, -0.5294136, 1.453089, 1, 0, 0.8235294, 1,
1.120208, -0.3793143, 1.899278, 1, 0, 0.8156863, 1,
1.126327, 0.06885633, 1.816008, 1, 0, 0.8117647, 1,
1.128829, 2.589878, 0.4009329, 1, 0, 0.8039216, 1,
1.132898, -0.2719916, 2.195566, 1, 0, 0.7960784, 1,
1.140906, 1.484137, -1.611433, 1, 0, 0.7921569, 1,
1.143552, 1.050807, 2.268319, 1, 0, 0.7843137, 1,
1.148938, 0.3594281, 2.120554, 1, 0, 0.7803922, 1,
1.152165, -0.7232193, 2.98623, 1, 0, 0.772549, 1,
1.164428, 0.4582919, 0.3758655, 1, 0, 0.7686275, 1,
1.165691, -1.443641, 1.822856, 1, 0, 0.7607843, 1,
1.16912, -0.9156167, 2.390209, 1, 0, 0.7568628, 1,
1.171908, -1.667625, -0.7284217, 1, 0, 0.7490196, 1,
1.174311, -0.5718724, 1.293131, 1, 0, 0.7450981, 1,
1.176304, 0.4190848, 1.444177, 1, 0, 0.7372549, 1,
1.189606, 0.1469183, 1.430087, 1, 0, 0.7333333, 1,
1.190788, 0.9679564, 1.914147, 1, 0, 0.7254902, 1,
1.191413, 0.4771028, -0.1209534, 1, 0, 0.7215686, 1,
1.194036, 2.197338, 1.169744, 1, 0, 0.7137255, 1,
1.194993, -0.4425887, 3.414681, 1, 0, 0.7098039, 1,
1.198167, -1.707038, 2.783912, 1, 0, 0.7019608, 1,
1.200968, -1.797266, 1.930866, 1, 0, 0.6941177, 1,
1.203161, -0.2943367, 0.6389049, 1, 0, 0.6901961, 1,
1.217939, 0.5519007, 2.053874, 1, 0, 0.682353, 1,
1.230076, 0.2665377, -0.1731191, 1, 0, 0.6784314, 1,
1.234789, 0.8746683, 1.516775, 1, 0, 0.6705883, 1,
1.237374, -1.15228, 2.528537, 1, 0, 0.6666667, 1,
1.243653, -0.9972809, 2.81712, 1, 0, 0.6588235, 1,
1.248526, 1.193039, 1.580181, 1, 0, 0.654902, 1,
1.250278, -1.277002, 1.131637, 1, 0, 0.6470588, 1,
1.254311, -0.8239003, 2.865556, 1, 0, 0.6431373, 1,
1.254929, -0.1379591, 1.011167, 1, 0, 0.6352941, 1,
1.261333, -0.8643232, 1.168739, 1, 0, 0.6313726, 1,
1.270861, 0.5527663, 1.478547, 1, 0, 0.6235294, 1,
1.275684, -0.9882957, 1.900753, 1, 0, 0.6196079, 1,
1.28213, -1.436965, 1.212409, 1, 0, 0.6117647, 1,
1.289054, -0.08176, 2.110837, 1, 0, 0.6078432, 1,
1.299396, -0.504589, 1.459808, 1, 0, 0.6, 1,
1.301255, -0.8034979, 1.417072, 1, 0, 0.5921569, 1,
1.308874, 0.7459226, 0.7352211, 1, 0, 0.5882353, 1,
1.314813, -0.01713867, 2.186502, 1, 0, 0.5803922, 1,
1.320256, -2.532819, 1.485495, 1, 0, 0.5764706, 1,
1.330725, 0.4705114, 3.384614, 1, 0, 0.5686275, 1,
1.331589, -1.118558, 0.3975487, 1, 0, 0.5647059, 1,
1.355886, 0.06185848, 3.922145, 1, 0, 0.5568628, 1,
1.389249, -2.563143, 3.341013, 1, 0, 0.5529412, 1,
1.395087, -1.562689, 4.241666, 1, 0, 0.5450981, 1,
1.403642, -0.3892586, 2.081327, 1, 0, 0.5411765, 1,
1.405032, 0.2467626, 2.434442, 1, 0, 0.5333334, 1,
1.407043, 0.5730027, 1.339926, 1, 0, 0.5294118, 1,
1.416421, -0.06909646, 2.740287, 1, 0, 0.5215687, 1,
1.417806, 0.6528274, 1.130382, 1, 0, 0.5176471, 1,
1.420069, -0.5513952, 2.884986, 1, 0, 0.509804, 1,
1.420419, -1.053908, 1.971967, 1, 0, 0.5058824, 1,
1.42571, 0.1952537, 1.69296, 1, 0, 0.4980392, 1,
1.426957, -0.4399396, 1.675139, 1, 0, 0.4901961, 1,
1.427774, 0.2725865, 1.423707, 1, 0, 0.4862745, 1,
1.43088, -0.8646209, 2.70238, 1, 0, 0.4784314, 1,
1.446272, -1.10259, 2.798066, 1, 0, 0.4745098, 1,
1.448519, 0.2211189, 2.212852, 1, 0, 0.4666667, 1,
1.451635, -0.2974889, 2.484243, 1, 0, 0.4627451, 1,
1.459165, -0.00652439, 1.842732, 1, 0, 0.454902, 1,
1.468506, 0.5911184, 2.510632, 1, 0, 0.4509804, 1,
1.471338, -0.05858088, 0.7496104, 1, 0, 0.4431373, 1,
1.476371, 0.3269534, 2.320932, 1, 0, 0.4392157, 1,
1.479046, -0.1918745, -0.3071913, 1, 0, 0.4313726, 1,
1.490053, -2.054894, 2.707632, 1, 0, 0.427451, 1,
1.498103, -0.6099187, 1.30276, 1, 0, 0.4196078, 1,
1.507814, 1.157537, -0.1656281, 1, 0, 0.4156863, 1,
1.516557, -0.7326705, 2.251283, 1, 0, 0.4078431, 1,
1.52965, 0.09509625, 1.525417, 1, 0, 0.4039216, 1,
1.53803, 1.29209, 2.821187, 1, 0, 0.3960784, 1,
1.543857, -1.101498, 1.31262, 1, 0, 0.3882353, 1,
1.550091, 0.3475135, -1.15801, 1, 0, 0.3843137, 1,
1.552926, -0.6915537, 1.046821, 1, 0, 0.3764706, 1,
1.553236, 0.788614, -0.3161119, 1, 0, 0.372549, 1,
1.555966, 0.7531211, 1.638195, 1, 0, 0.3647059, 1,
1.556539, -0.1222101, 3.623395, 1, 0, 0.3607843, 1,
1.557215, 0.6671523, 2.259356, 1, 0, 0.3529412, 1,
1.566977, 0.06309494, 1.422718, 1, 0, 0.3490196, 1,
1.570322, -0.7709855, 0.4647604, 1, 0, 0.3411765, 1,
1.574501, -0.839097, 3.600542, 1, 0, 0.3372549, 1,
1.581571, 0.2975981, 2.712327, 1, 0, 0.3294118, 1,
1.601445, 2.585807, 2.00317, 1, 0, 0.3254902, 1,
1.601585, 1.246429, 1.218083, 1, 0, 0.3176471, 1,
1.615864, 0.9693668, 0.1241354, 1, 0, 0.3137255, 1,
1.620924, 0.2594865, 2.487103, 1, 0, 0.3058824, 1,
1.629611, -0.3988754, 3.248012, 1, 0, 0.2980392, 1,
1.642367, -0.5486842, 0.7973305, 1, 0, 0.2941177, 1,
1.655615, 1.578112, 0.3082756, 1, 0, 0.2862745, 1,
1.673419, 0.1982471, 2.253248, 1, 0, 0.282353, 1,
1.688177, 0.5213037, 0.9697574, 1, 0, 0.2745098, 1,
1.694758, 0.7818336, 1.48913, 1, 0, 0.2705882, 1,
1.695816, 0.6431677, -0.5138074, 1, 0, 0.2627451, 1,
1.696281, -0.09253477, 1.620839, 1, 0, 0.2588235, 1,
1.710805, -0.1291076, 1.133517, 1, 0, 0.2509804, 1,
1.714676, -0.05054327, 2.823914, 1, 0, 0.2470588, 1,
1.730251, -1.311345, 2.222435, 1, 0, 0.2392157, 1,
1.739304, -0.7982395, 3.818074, 1, 0, 0.2352941, 1,
1.743916, -0.7654037, 0.5634176, 1, 0, 0.227451, 1,
1.763956, 0.2326036, 0.384809, 1, 0, 0.2235294, 1,
1.765173, -1.545484, 2.581839, 1, 0, 0.2156863, 1,
1.770067, -0.6874434, 1.256802, 1, 0, 0.2117647, 1,
1.771786, 0.3653397, 1.488927, 1, 0, 0.2039216, 1,
1.791919, 0.7061307, 1.390893, 1, 0, 0.1960784, 1,
1.795039, -0.4355293, 2.177531, 1, 0, 0.1921569, 1,
1.810705, -0.1781128, -0.01071932, 1, 0, 0.1843137, 1,
1.820769, -0.2730628, 2.76743, 1, 0, 0.1803922, 1,
1.833246, -1.752255, 3.327648, 1, 0, 0.172549, 1,
1.84045, -0.76704, 1.414887, 1, 0, 0.1686275, 1,
1.846735, -0.8965612, 1.613573, 1, 0, 0.1607843, 1,
1.859144, 0.9570266, 1.568117, 1, 0, 0.1568628, 1,
1.870198, -0.8854371, 2.317136, 1, 0, 0.1490196, 1,
1.889077, 1.75932, 0.03590419, 1, 0, 0.145098, 1,
1.897699, 0.8265175, 1.191351, 1, 0, 0.1372549, 1,
1.904271, 1.588092, 1.887482, 1, 0, 0.1333333, 1,
1.908866, -0.3857373, 4.016855, 1, 0, 0.1254902, 1,
1.940329, 0.8140522, 1.463714, 1, 0, 0.1215686, 1,
1.954485, -0.1530067, 2.58396, 1, 0, 0.1137255, 1,
1.962209, -0.8043932, 1.881534, 1, 0, 0.1098039, 1,
2.027156, -0.1817968, 1.213331, 1, 0, 0.1019608, 1,
2.030481, -0.5085785, 1.758136, 1, 0, 0.09411765, 1,
2.125351, -0.5712836, 1.838354, 1, 0, 0.09019608, 1,
2.141825, -2.028737, 3.559285, 1, 0, 0.08235294, 1,
2.17528, 0.8758281, 2.036467, 1, 0, 0.07843138, 1,
2.226775, -0.3548069, 3.65493, 1, 0, 0.07058824, 1,
2.265652, 0.4181708, 0.8588388, 1, 0, 0.06666667, 1,
2.35783, 1.161911, 1.397914, 1, 0, 0.05882353, 1,
2.368498, 1.700499, 1.642752, 1, 0, 0.05490196, 1,
2.377353, -0.4081895, 1.73857, 1, 0, 0.04705882, 1,
2.389637, 1.994732, 0.9309682, 1, 0, 0.04313726, 1,
2.461046, -1.643744, 3.038272, 1, 0, 0.03529412, 1,
2.5039, -0.8389304, 2.465221, 1, 0, 0.03137255, 1,
2.668237, 0.3859043, 1.387931, 1, 0, 0.02352941, 1,
2.841935, -0.1759599, 3.236915, 1, 0, 0.01960784, 1,
2.91876, -0.2069499, 2.657188, 1, 0, 0.01176471, 1,
3.441791, -0.3723951, 2.289651, 1, 0, 0.007843138, 1
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
0.2686523, -4.381268, -9.388862, 0, -0.5, 0.5, 0.5,
0.2686523, -4.381268, -9.388862, 1, -0.5, 0.5, 0.5,
0.2686523, -4.381268, -9.388862, 1, 1.5, 0.5, 0.5,
0.2686523, -4.381268, -9.388862, 0, 1.5, 0.5, 0.5
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
-3.98018, 0.2162783, -9.388862, 0, -0.5, 0.5, 0.5,
-3.98018, 0.2162783, -9.388862, 1, -0.5, 0.5, 0.5,
-3.98018, 0.2162783, -9.388862, 1, 1.5, 0.5, 0.5,
-3.98018, 0.2162783, -9.388862, 0, 1.5, 0.5, 0.5
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
-3.98018, -4.381268, -0.6131153, 0, -0.5, 0.5, 0.5,
-3.98018, -4.381268, -0.6131153, 1, -0.5, 0.5, 0.5,
-3.98018, -4.381268, -0.6131153, 1, 1.5, 0.5, 0.5,
-3.98018, -4.381268, -0.6131153, 0, 1.5, 0.5, 0.5
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
-2, -3.320295, -7.363689,
3, -3.320295, -7.363689,
-2, -3.320295, -7.363689,
-2, -3.497124, -7.701218,
-1, -3.320295, -7.363689,
-1, -3.497124, -7.701218,
0, -3.320295, -7.363689,
0, -3.497124, -7.701218,
1, -3.320295, -7.363689,
1, -3.497124, -7.701218,
2, -3.320295, -7.363689,
2, -3.497124, -7.701218,
3, -3.320295, -7.363689,
3, -3.497124, -7.701218
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
-2, -3.850781, -8.376276, 0, -0.5, 0.5, 0.5,
-2, -3.850781, -8.376276, 1, -0.5, 0.5, 0.5,
-2, -3.850781, -8.376276, 1, 1.5, 0.5, 0.5,
-2, -3.850781, -8.376276, 0, 1.5, 0.5, 0.5,
-1, -3.850781, -8.376276, 0, -0.5, 0.5, 0.5,
-1, -3.850781, -8.376276, 1, -0.5, 0.5, 0.5,
-1, -3.850781, -8.376276, 1, 1.5, 0.5, 0.5,
-1, -3.850781, -8.376276, 0, 1.5, 0.5, 0.5,
0, -3.850781, -8.376276, 0, -0.5, 0.5, 0.5,
0, -3.850781, -8.376276, 1, -0.5, 0.5, 0.5,
0, -3.850781, -8.376276, 1, 1.5, 0.5, 0.5,
0, -3.850781, -8.376276, 0, 1.5, 0.5, 0.5,
1, -3.850781, -8.376276, 0, -0.5, 0.5, 0.5,
1, -3.850781, -8.376276, 1, -0.5, 0.5, 0.5,
1, -3.850781, -8.376276, 1, 1.5, 0.5, 0.5,
1, -3.850781, -8.376276, 0, 1.5, 0.5, 0.5,
2, -3.850781, -8.376276, 0, -0.5, 0.5, 0.5,
2, -3.850781, -8.376276, 1, -0.5, 0.5, 0.5,
2, -3.850781, -8.376276, 1, 1.5, 0.5, 0.5,
2, -3.850781, -8.376276, 0, 1.5, 0.5, 0.5,
3, -3.850781, -8.376276, 0, -0.5, 0.5, 0.5,
3, -3.850781, -8.376276, 1, -0.5, 0.5, 0.5,
3, -3.850781, -8.376276, 1, 1.5, 0.5, 0.5,
3, -3.850781, -8.376276, 0, 1.5, 0.5, 0.5
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
-2.99968, -3, -7.363689,
-2.99968, 3, -7.363689,
-2.99968, -3, -7.363689,
-3.163097, -3, -7.701218,
-2.99968, -2, -7.363689,
-3.163097, -2, -7.701218,
-2.99968, -1, -7.363689,
-3.163097, -1, -7.701218,
-2.99968, 0, -7.363689,
-3.163097, 0, -7.701218,
-2.99968, 1, -7.363689,
-3.163097, 1, -7.701218,
-2.99968, 2, -7.363689,
-3.163097, 2, -7.701218,
-2.99968, 3, -7.363689,
-3.163097, 3, -7.701218
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
-3.48993, -3, -8.376276, 0, -0.5, 0.5, 0.5,
-3.48993, -3, -8.376276, 1, -0.5, 0.5, 0.5,
-3.48993, -3, -8.376276, 1, 1.5, 0.5, 0.5,
-3.48993, -3, -8.376276, 0, 1.5, 0.5, 0.5,
-3.48993, -2, -8.376276, 0, -0.5, 0.5, 0.5,
-3.48993, -2, -8.376276, 1, -0.5, 0.5, 0.5,
-3.48993, -2, -8.376276, 1, 1.5, 0.5, 0.5,
-3.48993, -2, -8.376276, 0, 1.5, 0.5, 0.5,
-3.48993, -1, -8.376276, 0, -0.5, 0.5, 0.5,
-3.48993, -1, -8.376276, 1, -0.5, 0.5, 0.5,
-3.48993, -1, -8.376276, 1, 1.5, 0.5, 0.5,
-3.48993, -1, -8.376276, 0, 1.5, 0.5, 0.5,
-3.48993, 0, -8.376276, 0, -0.5, 0.5, 0.5,
-3.48993, 0, -8.376276, 1, -0.5, 0.5, 0.5,
-3.48993, 0, -8.376276, 1, 1.5, 0.5, 0.5,
-3.48993, 0, -8.376276, 0, 1.5, 0.5, 0.5,
-3.48993, 1, -8.376276, 0, -0.5, 0.5, 0.5,
-3.48993, 1, -8.376276, 1, -0.5, 0.5, 0.5,
-3.48993, 1, -8.376276, 1, 1.5, 0.5, 0.5,
-3.48993, 1, -8.376276, 0, 1.5, 0.5, 0.5,
-3.48993, 2, -8.376276, 0, -0.5, 0.5, 0.5,
-3.48993, 2, -8.376276, 1, -0.5, 0.5, 0.5,
-3.48993, 2, -8.376276, 1, 1.5, 0.5, 0.5,
-3.48993, 2, -8.376276, 0, 1.5, 0.5, 0.5,
-3.48993, 3, -8.376276, 0, -0.5, 0.5, 0.5,
-3.48993, 3, -8.376276, 1, -0.5, 0.5, 0.5,
-3.48993, 3, -8.376276, 1, 1.5, 0.5, 0.5,
-3.48993, 3, -8.376276, 0, 1.5, 0.5, 0.5
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
-2.99968, -3.320295, -6,
-2.99968, -3.320295, 4,
-2.99968, -3.320295, -6,
-3.163097, -3.497124, -6,
-2.99968, -3.320295, -4,
-3.163097, -3.497124, -4,
-2.99968, -3.320295, -2,
-3.163097, -3.497124, -2,
-2.99968, -3.320295, 0,
-3.163097, -3.497124, 0,
-2.99968, -3.320295, 2,
-3.163097, -3.497124, 2,
-2.99968, -3.320295, 4,
-3.163097, -3.497124, 4
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
"-6",
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
-3.48993, -3.850781, -6, 0, -0.5, 0.5, 0.5,
-3.48993, -3.850781, -6, 1, -0.5, 0.5, 0.5,
-3.48993, -3.850781, -6, 1, 1.5, 0.5, 0.5,
-3.48993, -3.850781, -6, 0, 1.5, 0.5, 0.5,
-3.48993, -3.850781, -4, 0, -0.5, 0.5, 0.5,
-3.48993, -3.850781, -4, 1, -0.5, 0.5, 0.5,
-3.48993, -3.850781, -4, 1, 1.5, 0.5, 0.5,
-3.48993, -3.850781, -4, 0, 1.5, 0.5, 0.5,
-3.48993, -3.850781, -2, 0, -0.5, 0.5, 0.5,
-3.48993, -3.850781, -2, 1, -0.5, 0.5, 0.5,
-3.48993, -3.850781, -2, 1, 1.5, 0.5, 0.5,
-3.48993, -3.850781, -2, 0, 1.5, 0.5, 0.5,
-3.48993, -3.850781, 0, 0, -0.5, 0.5, 0.5,
-3.48993, -3.850781, 0, 1, -0.5, 0.5, 0.5,
-3.48993, -3.850781, 0, 1, 1.5, 0.5, 0.5,
-3.48993, -3.850781, 0, 0, 1.5, 0.5, 0.5,
-3.48993, -3.850781, 2, 0, -0.5, 0.5, 0.5,
-3.48993, -3.850781, 2, 1, -0.5, 0.5, 0.5,
-3.48993, -3.850781, 2, 1, 1.5, 0.5, 0.5,
-3.48993, -3.850781, 2, 0, 1.5, 0.5, 0.5,
-3.48993, -3.850781, 4, 0, -0.5, 0.5, 0.5,
-3.48993, -3.850781, 4, 1, -0.5, 0.5, 0.5,
-3.48993, -3.850781, 4, 1, 1.5, 0.5, 0.5,
-3.48993, -3.850781, 4, 0, 1.5, 0.5, 0.5
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
-2.99968, -3.320295, -7.363689,
-2.99968, 3.752852, -7.363689,
-2.99968, -3.320295, 6.137459,
-2.99968, 3.752852, 6.137459,
-2.99968, -3.320295, -7.363689,
-2.99968, -3.320295, 6.137459,
-2.99968, 3.752852, -7.363689,
-2.99968, 3.752852, 6.137459,
-2.99968, -3.320295, -7.363689,
3.536985, -3.320295, -7.363689,
-2.99968, -3.320295, 6.137459,
3.536985, -3.320295, 6.137459,
-2.99968, 3.752852, -7.363689,
3.536985, 3.752852, -7.363689,
-2.99968, 3.752852, 6.137459,
3.536985, 3.752852, 6.137459,
3.536985, -3.320295, -7.363689,
3.536985, 3.752852, -7.363689,
3.536985, -3.320295, 6.137459,
3.536985, 3.752852, 6.137459,
3.536985, -3.320295, -7.363689,
3.536985, -3.320295, 6.137459,
3.536985, 3.752852, -7.363689,
3.536985, 3.752852, 6.137459
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
var radius = 8.855685;
var distance = 39.39994;
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
mvMatrix.translate( -0.2686523, -0.2162783, 0.6131153 );
mvMatrix.scale( 1.464805, 1.353703, 0.7091945 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -39.39994);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
calcium_arsenate_tri<-read.table("calcium_arsenate_tri.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 5 elements
```

```r
x<-calcium_arsenate_tri$V2
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_tri' not found
```

```r
y<-calcium_arsenate_tri$V3
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_tri' not found
```

```r
z<-calcium_arsenate_tri$V4
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_tri' not found
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
-2.904486, 0.1823816, -2.662877, 0, 0, 1, 1, 1,
-2.519039, 0.7223864, 0.1558939, 1, 0, 0, 1, 1,
-2.501521, 1.586201, -2.007866, 1, 0, 0, 1, 1,
-2.370845, 0.1708365, -0.8797568, 1, 0, 0, 1, 1,
-2.323915, -1.815592, -1.99367, 1, 0, 0, 1, 1,
-2.290803, -0.6979057, -0.6803787, 1, 0, 0, 1, 1,
-2.261949, -0.2054328, -0.9796888, 0, 0, 0, 1, 1,
-2.2565, 1.192965, -0.01211608, 0, 0, 0, 1, 1,
-2.208072, 0.4144807, -1.574062, 0, 0, 0, 1, 1,
-2.187293, -0.8962919, -1.375849, 0, 0, 0, 1, 1,
-2.172086, 0.8203216, -2.126637, 0, 0, 0, 1, 1,
-2.143725, 0.5808928, -1.107188, 0, 0, 0, 1, 1,
-2.075753, 0.2368363, -1.832426, 0, 0, 0, 1, 1,
-2.066241, 0.4953714, -1.50537, 1, 1, 1, 1, 1,
-2.004302, 0.3010071, -0.9461979, 1, 1, 1, 1, 1,
-1.963549, -0.267167, -3.251899, 1, 1, 1, 1, 1,
-1.917895, 0.7358915, -1.408766, 1, 1, 1, 1, 1,
-1.887902, -3.153904, -1.779525, 1, 1, 1, 1, 1,
-1.867304, -0.4921691, -2.547121, 1, 1, 1, 1, 1,
-1.825788, 0.5496408, -2.313212, 1, 1, 1, 1, 1,
-1.802242, 0.2917906, -0.9585588, 1, 1, 1, 1, 1,
-1.776404, -0.7622432, -4.073836, 1, 1, 1, 1, 1,
-1.768113, -0.5028765, -0.6883731, 1, 1, 1, 1, 1,
-1.757861, 2.057902, -1.27697, 1, 1, 1, 1, 1,
-1.75676, 1.472745, -1.320961, 1, 1, 1, 1, 1,
-1.738408, -0.4210263, -1.702725, 1, 1, 1, 1, 1,
-1.722936, 1.316081, -1.086532, 1, 1, 1, 1, 1,
-1.720543, 1.075285, -1.209619, 1, 1, 1, 1, 1,
-1.712402, 0.4357168, 0.4236435, 0, 0, 1, 1, 1,
-1.700699, -0.001750983, -3.215626, 1, 0, 0, 1, 1,
-1.700515, -0.4496654, -1.892254, 1, 0, 0, 1, 1,
-1.695125, 0.660604, 0.09175473, 1, 0, 0, 1, 1,
-1.688259, 0.232265, 0.4322673, 1, 0, 0, 1, 1,
-1.679518, 1.69262, -0.251131, 1, 0, 0, 1, 1,
-1.663669, -1.585213, -1.809206, 0, 0, 0, 1, 1,
-1.662706, -0.825991, -1.711062, 0, 0, 0, 1, 1,
-1.63134, 0.05066729, -1.702667, 0, 0, 0, 1, 1,
-1.630455, 1.851766, 0.4058954, 0, 0, 0, 1, 1,
-1.629881, -0.2717337, -1.889125, 0, 0, 0, 1, 1,
-1.608003, -0.1023612, -2.456034, 0, 0, 0, 1, 1,
-1.602756, 0.5886684, -3.928198, 0, 0, 0, 1, 1,
-1.600764, 0.7719038, -0.8889981, 1, 1, 1, 1, 1,
-1.599665, 0.367225, -0.244662, 1, 1, 1, 1, 1,
-1.584285, 2.227498, -0.6373575, 1, 1, 1, 1, 1,
-1.579924, -0.8046439, -1.448667, 1, 1, 1, 1, 1,
-1.575437, -0.5902737, -0.6054888, 1, 1, 1, 1, 1,
-1.572494, -0.287695, -1.765565, 1, 1, 1, 1, 1,
-1.570898, -0.7683726, -2.727592, 1, 1, 1, 1, 1,
-1.567951, -1.132038, -2.382464, 1, 1, 1, 1, 1,
-1.5664, -0.6628039, -1.110829, 1, 1, 1, 1, 1,
-1.563422, 0.01560971, -0.9602826, 1, 1, 1, 1, 1,
-1.55014, 0.9297061, -1.053315, 1, 1, 1, 1, 1,
-1.544903, 1.707442, -1.490029, 1, 1, 1, 1, 1,
-1.544226, -0.5806859, -0.3081537, 1, 1, 1, 1, 1,
-1.528092, 1.847411, -1.443192, 1, 1, 1, 1, 1,
-1.507046, -2.174993, -2.809827, 1, 1, 1, 1, 1,
-1.506402, -1.031601, -1.785948, 0, 0, 1, 1, 1,
-1.487527, 1.651209, -0.0282375, 1, 0, 0, 1, 1,
-1.485425, 2.103885, -0.8435796, 1, 0, 0, 1, 1,
-1.47257, -1.684833, -3.303268, 1, 0, 0, 1, 1,
-1.469378, 1.205848, -0.6227251, 1, 0, 0, 1, 1,
-1.465241, 1.057155, -0.764361, 1, 0, 0, 1, 1,
-1.461544, -0.1833057, -2.257097, 0, 0, 0, 1, 1,
-1.456699, 0.6389094, -2.393296, 0, 0, 0, 1, 1,
-1.450754, 0.8371512, -1.073746, 0, 0, 0, 1, 1,
-1.449859, -1.98278, -4.643087, 0, 0, 0, 1, 1,
-1.436999, -0.3853175, -2.667992, 0, 0, 0, 1, 1,
-1.429158, -1.010391, -3.270097, 0, 0, 0, 1, 1,
-1.418426, -2.160784, -1.152071, 0, 0, 0, 1, 1,
-1.411046, 1.894529, -2.110907, 1, 1, 1, 1, 1,
-1.409851, -1.142457, -3.535993, 1, 1, 1, 1, 1,
-1.407566, -1.760922, -1.932343, 1, 1, 1, 1, 1,
-1.406909, 0.1301475, -0.1636765, 1, 1, 1, 1, 1,
-1.402472, -1.483098, -2.948362, 1, 1, 1, 1, 1,
-1.396646, 1.06808, -1.516472, 1, 1, 1, 1, 1,
-1.393106, -0.5205115, -0.3458507, 1, 1, 1, 1, 1,
-1.380906, 1.075414, -0.2177791, 1, 1, 1, 1, 1,
-1.377402, -0.1398609, -2.359186, 1, 1, 1, 1, 1,
-1.36784, -2.139004, -1.351102, 1, 1, 1, 1, 1,
-1.35629, 1.377739, -1.723754, 1, 1, 1, 1, 1,
-1.355552, 1.327736, -0.8289814, 1, 1, 1, 1, 1,
-1.349676, 0.2684847, -0.5488515, 1, 1, 1, 1, 1,
-1.349469, -0.02228124, -1.053235, 1, 1, 1, 1, 1,
-1.345888, 0.293973, -0.1794875, 1, 1, 1, 1, 1,
-1.337676, -0.4170499, -2.131368, 0, 0, 1, 1, 1,
-1.337085, -1.469975, -0.6240503, 1, 0, 0, 1, 1,
-1.335654, 0.6973687, -2.931847, 1, 0, 0, 1, 1,
-1.334939, -1.339707, -2.204675, 1, 0, 0, 1, 1,
-1.334465, 2.039488, -1.541393, 1, 0, 0, 1, 1,
-1.324303, 1.940214, 0.301637, 1, 0, 0, 1, 1,
-1.323767, 0.9146551, -1.228678, 0, 0, 0, 1, 1,
-1.322766, 1.602743, 0.4710107, 0, 0, 0, 1, 1,
-1.314719, -0.7415955, -2.882702, 0, 0, 0, 1, 1,
-1.305407, 0.6007687, -3.426151, 0, 0, 0, 1, 1,
-1.295205, -0.1647693, -0.8753612, 0, 0, 0, 1, 1,
-1.288831, -0.4357963, -2.036982, 0, 0, 0, 1, 1,
-1.288312, -0.08412372, -0.228406, 0, 0, 0, 1, 1,
-1.276443, -0.7396026, -3.225019, 1, 1, 1, 1, 1,
-1.260911, 0.08168467, 0.104115, 1, 1, 1, 1, 1,
-1.248236, 0.2133267, -0.4252705, 1, 1, 1, 1, 1,
-1.241422, 1.409868, -0.1909646, 1, 1, 1, 1, 1,
-1.235042, -0.5105075, -0.09461744, 1, 1, 1, 1, 1,
-1.233645, 2.210316, -0.1455746, 1, 1, 1, 1, 1,
-1.232316, -0.8308461, -2.993523, 1, 1, 1, 1, 1,
-1.227409, 0.4145086, 0.516839, 1, 1, 1, 1, 1,
-1.222144, 2.383333, 0.7697119, 1, 1, 1, 1, 1,
-1.220648, -0.3131956, -0.9321759, 1, 1, 1, 1, 1,
-1.21462, 1.187522, -1.552629, 1, 1, 1, 1, 1,
-1.20933, -0.4961646, -1.754713, 1, 1, 1, 1, 1,
-1.201988, 1.448087, -1.28574, 1, 1, 1, 1, 1,
-1.187942, 1.46763, -0.263817, 1, 1, 1, 1, 1,
-1.171944, -0.3290227, -1.894899, 1, 1, 1, 1, 1,
-1.171795, 0.6827445, -1.068796, 0, 0, 1, 1, 1,
-1.169218, 1.425824, -1.317678, 1, 0, 0, 1, 1,
-1.168189, -0.863363, -2.171869, 1, 0, 0, 1, 1,
-1.164979, -0.7718579, -3.350298, 1, 0, 0, 1, 1,
-1.162288, -0.222706, -3.47753, 1, 0, 0, 1, 1,
-1.150457, -1.660879, -3.138297, 1, 0, 0, 1, 1,
-1.149684, 0.7117497, -1.587074, 0, 0, 0, 1, 1,
-1.148297, 1.325368, -1.37858, 0, 0, 0, 1, 1,
-1.140859, 1.530877, -0.791826, 0, 0, 0, 1, 1,
-1.13609, -0.541671, -0.6143006, 0, 0, 0, 1, 1,
-1.135422, -0.6736122, 0.02608032, 0, 0, 0, 1, 1,
-1.128502, 1.899268, 1.103749, 0, 0, 0, 1, 1,
-1.121593, 0.3517697, -0.5626028, 0, 0, 0, 1, 1,
-1.118344, -1.113557, -2.96966, 1, 1, 1, 1, 1,
-1.116728, -0.4173381, -1.566189, 1, 1, 1, 1, 1,
-1.115585, -1.034809, -1.673181, 1, 1, 1, 1, 1,
-1.112681, 0.09422928, -2.591837, 1, 1, 1, 1, 1,
-1.107841, 2.221624, 0.3156986, 1, 1, 1, 1, 1,
-1.102438, 1.132283, -0.6838716, 1, 1, 1, 1, 1,
-1.094699, -0.1352403, -2.655471, 1, 1, 1, 1, 1,
-1.091249, -0.3613969, -1.324506, 1, 1, 1, 1, 1,
-1.08639, -1.061102, -2.953585, 1, 1, 1, 1, 1,
-1.083739, -0.3949758, -3.455534, 1, 1, 1, 1, 1,
-1.08101, 0.2253928, -0.3324516, 1, 1, 1, 1, 1,
-1.078832, -0.4866912, -0.8296964, 1, 1, 1, 1, 1,
-1.073937, -0.006271908, 0.7849638, 1, 1, 1, 1, 1,
-1.071127, 0.6314597, 0.1765202, 1, 1, 1, 1, 1,
-1.066882, 0.2808712, -1.440649, 1, 1, 1, 1, 1,
-1.066652, -1.510544, -3.061075, 0, 0, 1, 1, 1,
-1.064971, 0.5470951, -3.14746, 1, 0, 0, 1, 1,
-1.064681, 1.210885, 0.1836154, 1, 0, 0, 1, 1,
-1.064033, 0.7065802, -0.8240774, 1, 0, 0, 1, 1,
-1.057272, 1.078808, -0.6108033, 1, 0, 0, 1, 1,
-1.056351, 0.6750057, -2.987268, 1, 0, 0, 1, 1,
-1.051224, -0.6398509, -2.322613, 0, 0, 0, 1, 1,
-1.049044, -0.863216, -1.539312, 0, 0, 0, 1, 1,
-1.046616, 0.6078465, -1.540958, 0, 0, 0, 1, 1,
-1.03877, -1.153747, -1.494391, 0, 0, 0, 1, 1,
-1.034479, -1.888392, -2.998882, 0, 0, 0, 1, 1,
-1.03106, 1.48286, -0.8523327, 0, 0, 0, 1, 1,
-1.024157, 0.07130131, -2.874178, 0, 0, 0, 1, 1,
-1.015326, 0.5432354, -0.6295853, 1, 1, 1, 1, 1,
-1.014241, -0.1812759, -0.6063912, 1, 1, 1, 1, 1,
-1.012243, 0.3276362, -1.438559, 1, 1, 1, 1, 1,
-1.01068, -1.0931, -2.558689, 1, 1, 1, 1, 1,
-1.008896, -0.04554794, -2.865138, 1, 1, 1, 1, 1,
-1.001285, 0.7747523, -0.4356293, 1, 1, 1, 1, 1,
-1.000695, 1.90781, -0.2105111, 1, 1, 1, 1, 1,
-0.9996278, -0.6111187, -1.593611, 1, 1, 1, 1, 1,
-0.9994506, -1.179094, -1.998099, 1, 1, 1, 1, 1,
-0.9940384, 1.344651, -0.7413266, 1, 1, 1, 1, 1,
-0.9848943, -0.1183822, -2.706467, 1, 1, 1, 1, 1,
-0.9818762, 0.6707897, -1.951441, 1, 1, 1, 1, 1,
-0.9794315, -0.3886113, -2.551928, 1, 1, 1, 1, 1,
-0.9776742, 0.05524224, -2.116811, 1, 1, 1, 1, 1,
-0.9772341, -0.4635842, -2.828389, 1, 1, 1, 1, 1,
-0.9759439, 1.002629, -0.7838979, 0, 0, 1, 1, 1,
-0.9657689, 1.662572, -2.065, 1, 0, 0, 1, 1,
-0.964001, -1.176566, -3.205661, 1, 0, 0, 1, 1,
-0.9629415, 2.239665, -0.3853018, 1, 0, 0, 1, 1,
-0.9627361, -0.2722071, -1.05238, 1, 0, 0, 1, 1,
-0.959629, 0.3260083, -1.565978, 1, 0, 0, 1, 1,
-0.9583846, -1.07912, -3.228396, 0, 0, 0, 1, 1,
-0.9555421, 0.002404256, -3.26993, 0, 0, 0, 1, 1,
-0.9552808, 0.3878264, 0.4688211, 0, 0, 0, 1, 1,
-0.9538188, -1.004686, -2.389722, 0, 0, 0, 1, 1,
-0.9420063, -0.1422149, 1.320019, 0, 0, 0, 1, 1,
-0.9412446, 0.2452234, -0.6593881, 0, 0, 0, 1, 1,
-0.9368296, -1.07765, -3.442034, 0, 0, 0, 1, 1,
-0.9318669, -0.303672, -1.502532, 1, 1, 1, 1, 1,
-0.9311943, -0.2564242, -2.541621, 1, 1, 1, 1, 1,
-0.929997, 1.149724, 1.191607, 1, 1, 1, 1, 1,
-0.9196779, -0.2976412, -2.890837, 1, 1, 1, 1, 1,
-0.9190546, 1.405527, -1.017397, 1, 1, 1, 1, 1,
-0.9190331, 2.49954, 0.7067646, 1, 1, 1, 1, 1,
-0.9158708, -0.1213525, -1.940169, 1, 1, 1, 1, 1,
-0.9093855, 0.8844264, -0.363306, 1, 1, 1, 1, 1,
-0.9077377, -0.1388702, -2.290737, 1, 1, 1, 1, 1,
-0.9014006, -0.04063474, -3.455149, 1, 1, 1, 1, 1,
-0.9010847, 0.2916489, -0.6328544, 1, 1, 1, 1, 1,
-0.8975722, 0.5970278, -0.4828631, 1, 1, 1, 1, 1,
-0.8966399, 0.3617843, 2.236008, 1, 1, 1, 1, 1,
-0.8941507, -0.04975581, -1.3191, 1, 1, 1, 1, 1,
-0.8934063, 0.387598, -0.5643063, 1, 1, 1, 1, 1,
-0.8796768, -0.6424437, -2.893311, 0, 0, 1, 1, 1,
-0.8781265, -0.4929398, -3.113334, 1, 0, 0, 1, 1,
-0.873282, 0.3873239, -2.139005, 1, 0, 0, 1, 1,
-0.8702512, 1.474097, -0.5397292, 1, 0, 0, 1, 1,
-0.8612165, -1.480959, -3.391756, 1, 0, 0, 1, 1,
-0.860554, 0.2129062, -1.769512, 1, 0, 0, 1, 1,
-0.8585116, -1.224917, -1.989501, 0, 0, 0, 1, 1,
-0.8497551, 0.0019841, -0.8816999, 0, 0, 0, 1, 1,
-0.8450265, 0.6480367, -0.8231182, 0, 0, 0, 1, 1,
-0.8411897, 0.4825281, -1.137726, 0, 0, 0, 1, 1,
-0.8397143, 1.08727, -0.8924039, 0, 0, 0, 1, 1,
-0.8386672, 0.5704631, -0.5621257, 0, 0, 0, 1, 1,
-0.837805, -0.8791272, -4.797749, 0, 0, 0, 1, 1,
-0.8349676, 0.6130924, -3.518895, 1, 1, 1, 1, 1,
-0.8333021, -0.5311053, -1.818956, 1, 1, 1, 1, 1,
-0.832315, -0.9607739, -3.656132, 1, 1, 1, 1, 1,
-0.8277839, -1.024112, -2.323635, 1, 1, 1, 1, 1,
-0.8203723, -0.08017618, -1.243926, 1, 1, 1, 1, 1,
-0.8137656, 1.04684, 0.4926871, 1, 1, 1, 1, 1,
-0.8133685, -0.7497689, -1.97921, 1, 1, 1, 1, 1,
-0.8031198, -1.820755, -3.811465, 1, 1, 1, 1, 1,
-0.8017115, -0.6934943, -3.119348, 1, 1, 1, 1, 1,
-0.8002424, -0.6200208, -3.287298, 1, 1, 1, 1, 1,
-0.793512, 0.5573657, -2.58951, 1, 1, 1, 1, 1,
-0.7872856, -1.087215, -2.982281, 1, 1, 1, 1, 1,
-0.781888, 0.007907717, -0.7372828, 1, 1, 1, 1, 1,
-0.7781971, -1.406047, -2.946195, 1, 1, 1, 1, 1,
-0.7745727, 0.8241615, -0.005437891, 1, 1, 1, 1, 1,
-0.7642413, -1.004499, -3.193362, 0, 0, 1, 1, 1,
-0.7632463, -0.09433751, -1.225545, 1, 0, 0, 1, 1,
-0.7632269, 1.288338, 0.535108, 1, 0, 0, 1, 1,
-0.7543173, -0.08931039, -2.578107, 1, 0, 0, 1, 1,
-0.7522531, -0.5712953, -3.137643, 1, 0, 0, 1, 1,
-0.7511031, -0.1633482, -0.5596043, 1, 0, 0, 1, 1,
-0.7488143, -1.662308, -3.534313, 0, 0, 0, 1, 1,
-0.746653, 0.9492413, -3.551022, 0, 0, 0, 1, 1,
-0.7463617, 1.717788, -1.49896, 0, 0, 0, 1, 1,
-0.7460021, 1.022413, -1.575974, 0, 0, 0, 1, 1,
-0.7453718, 0.6798912, 0.02911515, 0, 0, 0, 1, 1,
-0.7423712, -0.5949191, -0.3749196, 0, 0, 0, 1, 1,
-0.7408742, 0.7408029, 0.340571, 0, 0, 0, 1, 1,
-0.7394301, -0.8518953, -2.274467, 1, 1, 1, 1, 1,
-0.7383994, 1.23079, -1.258076, 1, 1, 1, 1, 1,
-0.7363268, 0.5562076, -0.2362913, 1, 1, 1, 1, 1,
-0.7319123, -0.05872468, -2.057105, 1, 1, 1, 1, 1,
-0.7280493, -1.315858, -3.318406, 1, 1, 1, 1, 1,
-0.7246714, -0.4662326, -1.015038, 1, 1, 1, 1, 1,
-0.7241119, 0.5041127, -1.817825, 1, 1, 1, 1, 1,
-0.7230378, -2.313157, -2.211791, 1, 1, 1, 1, 1,
-0.7207593, 0.9656356, -1.261811, 1, 1, 1, 1, 1,
-0.7204552, 1.482582, 0.4826677, 1, 1, 1, 1, 1,
-0.7178633, 1.420834, 0.1935418, 1, 1, 1, 1, 1,
-0.7154809, -0.8786385, -2.418861, 1, 1, 1, 1, 1,
-0.7148007, -0.1322979, -1.21672, 1, 1, 1, 1, 1,
-0.7123619, -0.09320948, 0.2961881, 1, 1, 1, 1, 1,
-0.7078454, 2.279098, -1.555053, 1, 1, 1, 1, 1,
-0.7075945, -1.29604, -2.668025, 0, 0, 1, 1, 1,
-0.7051422, 0.4759437, -1.276003, 1, 0, 0, 1, 1,
-0.6945103, -0.7432066, -1.874032, 1, 0, 0, 1, 1,
-0.6856071, -0.1699132, -2.135372, 1, 0, 0, 1, 1,
-0.6835271, 0.4201609, 0.01101423, 1, 0, 0, 1, 1,
-0.6813126, -1.28983, -1.53251, 1, 0, 0, 1, 1,
-0.6771832, -1.318841, -2.145317, 0, 0, 0, 1, 1,
-0.6707324, 2.334088, 1.124614, 0, 0, 0, 1, 1,
-0.6685332, 0.01965289, -0.3191593, 0, 0, 0, 1, 1,
-0.6673129, -1.52285, -2.045689, 0, 0, 0, 1, 1,
-0.6656896, 1.057423, 0.6814, 0, 0, 0, 1, 1,
-0.6619566, 0.1720269, -0.1545107, 0, 0, 0, 1, 1,
-0.6588037, 0.05796492, -2.369406, 0, 0, 0, 1, 1,
-0.6380424, -0.524794, -3.396913, 1, 1, 1, 1, 1,
-0.6369462, -0.1772479, -4.503118, 1, 1, 1, 1, 1,
-0.6323543, -0.9666442, -2.69557, 1, 1, 1, 1, 1,
-0.6321545, 0.9467759, -0.5084544, 1, 1, 1, 1, 1,
-0.6304966, -0.9105763, -2.256475, 1, 1, 1, 1, 1,
-0.6276427, -0.6382622, -1.618749, 1, 1, 1, 1, 1,
-0.627248, -0.2345729, -1.905505, 1, 1, 1, 1, 1,
-0.6255648, 0.342755, -1.404094, 1, 1, 1, 1, 1,
-0.6246573, -0.9841221, -2.046484, 1, 1, 1, 1, 1,
-0.6204065, 0.6597594, -0.4789506, 1, 1, 1, 1, 1,
-0.6195332, 0.5988004, -2.12426, 1, 1, 1, 1, 1,
-0.6123073, -0.4177799, -1.569452, 1, 1, 1, 1, 1,
-0.6040149, 1.015308, -1.291674, 1, 1, 1, 1, 1,
-0.5965683, 1.352352, -0.1297077, 1, 1, 1, 1, 1,
-0.5960643, 0.3338815, -2.050588, 1, 1, 1, 1, 1,
-0.5904943, -1.757769, -4.214834, 0, 0, 1, 1, 1,
-0.5888926, 0.1759136, -0.4459165, 1, 0, 0, 1, 1,
-0.5834599, -1.371973, -2.477396, 1, 0, 0, 1, 1,
-0.5819784, 0.09055503, -2.760327, 1, 0, 0, 1, 1,
-0.5785732, 0.8492706, -1.058526, 1, 0, 0, 1, 1,
-0.5762975, 1.859839, -1.283332, 1, 0, 0, 1, 1,
-0.5760559, -1.385235, -3.217731, 0, 0, 0, 1, 1,
-0.5746446, -0.5619675, -2.56038, 0, 0, 0, 1, 1,
-0.5712397, 1.570052, 0.09850622, 0, 0, 0, 1, 1,
-0.5655634, -0.5013571, -1.377364, 0, 0, 0, 1, 1,
-0.5652267, -1.356335, -3.957527, 0, 0, 0, 1, 1,
-0.5621629, 1.513664, -0.4909647, 0, 0, 0, 1, 1,
-0.5609983, -1.053176, -0.4753837, 0, 0, 0, 1, 1,
-0.5594555, 0.5851146, 0.02209325, 1, 1, 1, 1, 1,
-0.5562938, 1.535895, -1.699188, 1, 1, 1, 1, 1,
-0.5505689, 0.03485763, 1.213795, 1, 1, 1, 1, 1,
-0.549558, 0.7623905, 0.1571279, 1, 1, 1, 1, 1,
-0.5478, 2.080436, 0.2734738, 1, 1, 1, 1, 1,
-0.5446654, -0.9232634, -1.310598, 1, 1, 1, 1, 1,
-0.5446433, -0.4402065, -3.17852, 1, 1, 1, 1, 1,
-0.5420945, -0.5764627, -2.090556, 1, 1, 1, 1, 1,
-0.5408604, -0.1021685, -0.8525495, 1, 1, 1, 1, 1,
-0.5347199, -0.9628239, -2.934012, 1, 1, 1, 1, 1,
-0.5342835, -0.5624043, -2.103702, 1, 1, 1, 1, 1,
-0.5312482, 0.5491416, -0.1969174, 1, 1, 1, 1, 1,
-0.5312167, 1.697727, -1.649327, 1, 1, 1, 1, 1,
-0.5303299, 0.6852104, -0.1261577, 1, 1, 1, 1, 1,
-0.5301114, -0.1059991, -2.27325, 1, 1, 1, 1, 1,
-0.5289403, 0.8511469, 0.04425988, 0, 0, 1, 1, 1,
-0.5272695, 0.9804228, -2.46616, 1, 0, 0, 1, 1,
-0.5250711, 0.269964, 0.5014875, 1, 0, 0, 1, 1,
-0.5239558, 0.2208778, -0.1833773, 1, 0, 0, 1, 1,
-0.5221711, -0.7057298, -3.293937, 1, 0, 0, 1, 1,
-0.5151743, 0.5946327, 0.3229324, 1, 0, 0, 1, 1,
-0.5129691, -1.67703, -2.547966, 0, 0, 0, 1, 1,
-0.5098358, 1.116266, -1.395987, 0, 0, 0, 1, 1,
-0.509191, 0.2446274, -1.504798, 0, 0, 0, 1, 1,
-0.5045604, -0.3840611, -3.890104, 0, 0, 0, 1, 1,
-0.5041668, 0.5480102, -2.73771, 0, 0, 0, 1, 1,
-0.4997586, -0.3306376, -1.760719, 0, 0, 0, 1, 1,
-0.4972473, -0.7271121, -4.041724, 0, 0, 0, 1, 1,
-0.4961495, 0.3702419, -1.147367, 1, 1, 1, 1, 1,
-0.4937658, -0.5172321, -2.434369, 1, 1, 1, 1, 1,
-0.4880336, -0.5715228, -1.579274, 1, 1, 1, 1, 1,
-0.4860811, 1.088379, -0.4049561, 1, 1, 1, 1, 1,
-0.4833662, -0.1953374, -0.8840251, 1, 1, 1, 1, 1,
-0.4829754, 2.015116, 0.2974079, 1, 1, 1, 1, 1,
-0.4773033, -0.6040146, -2.936572, 1, 1, 1, 1, 1,
-0.4771178, -0.898066, -3.54813, 1, 1, 1, 1, 1,
-0.4690778, -0.5853295, -2.764748, 1, 1, 1, 1, 1,
-0.466984, -0.03439564, -0.5471768, 1, 1, 1, 1, 1,
-0.4652135, -0.7789042, -1.773558, 1, 1, 1, 1, 1,
-0.4597936, 0.1748708, 0.005691573, 1, 1, 1, 1, 1,
-0.4592991, 0.6994368, -1.891843, 1, 1, 1, 1, 1,
-0.4560326, -2.424571, -3.620872, 1, 1, 1, 1, 1,
-0.4511506, -0.5222259, -4.601926, 1, 1, 1, 1, 1,
-0.4502276, 1.118381, 0.3951605, 0, 0, 1, 1, 1,
-0.4481567, -0.09370048, -2.300817, 1, 0, 0, 1, 1,
-0.4353628, 1.109071, 2.031425, 1, 0, 0, 1, 1,
-0.433304, 0.514303, 1.419695, 1, 0, 0, 1, 1,
-0.4241066, 0.6493622, -0.03402636, 1, 0, 0, 1, 1,
-0.4224908, -0.4216867, -2.430435, 1, 0, 0, 1, 1,
-0.4154929, 0.7065277, 0.6725481, 0, 0, 0, 1, 1,
-0.4105353, 0.1607748, -3.006831, 0, 0, 0, 1, 1,
-0.4061943, 0.5087035, -0.8908928, 0, 0, 0, 1, 1,
-0.4060078, 0.8614495, 0.07246726, 0, 0, 0, 1, 1,
-0.4057693, 1.625868, -0.9514934, 0, 0, 0, 1, 1,
-0.4031606, -0.9477418, -1.137642, 0, 0, 0, 1, 1,
-0.3962322, 0.3640529, -1.976926, 0, 0, 0, 1, 1,
-0.3959161, -0.07243443, -2.721371, 1, 1, 1, 1, 1,
-0.3953578, -0.7792125, -2.742732, 1, 1, 1, 1, 1,
-0.3926518, 0.5693735, -0.1726013, 1, 1, 1, 1, 1,
-0.3903793, 2.629979, 1.121608, 1, 1, 1, 1, 1,
-0.3891551, -0.6337274, -1.736378, 1, 1, 1, 1, 1,
-0.3845301, 0.7322187, 0.826618, 1, 1, 1, 1, 1,
-0.3825921, 0.318547, -1.514575, 1, 1, 1, 1, 1,
-0.3770184, -0.2040894, -2.583351, 1, 1, 1, 1, 1,
-0.375802, -0.3831579, -2.67033, 1, 1, 1, 1, 1,
-0.3743126, -0.182993, -1.296883, 1, 1, 1, 1, 1,
-0.3737558, -1.1493, -2.053855, 1, 1, 1, 1, 1,
-0.3735077, -1.131744, -3.497309, 1, 1, 1, 1, 1,
-0.3699563, 0.08553843, -0.9420952, 1, 1, 1, 1, 1,
-0.3652524, -2.289153, -4.590295, 1, 1, 1, 1, 1,
-0.362258, 0.3841761, -0.5205592, 1, 1, 1, 1, 1,
-0.3597991, 1.811677, -0.66298, 0, 0, 1, 1, 1,
-0.359698, 0.7349996, -0.2180705, 1, 0, 0, 1, 1,
-0.3515612, 3.649845, -0.5451587, 1, 0, 0, 1, 1,
-0.3491183, 0.7410027, 0.2719701, 1, 0, 0, 1, 1,
-0.3463234, -1.036213, -2.290531, 1, 0, 0, 1, 1,
-0.3451658, -0.05838205, -2.514646, 1, 0, 0, 1, 1,
-0.3427116, 0.7974204, -2.113831, 0, 0, 0, 1, 1,
-0.3414734, -0.1109861, -2.464641, 0, 0, 0, 1, 1,
-0.3392867, 1.169253, -2.245791, 0, 0, 0, 1, 1,
-0.335676, -0.6662886, -2.624252, 0, 0, 0, 1, 1,
-0.3350665, 0.8996188, -0.6462731, 0, 0, 0, 1, 1,
-0.3337127, -0.9133825, -2.605879, 0, 0, 0, 1, 1,
-0.3320801, 0.09878591, -4.11442, 0, 0, 0, 1, 1,
-0.3284003, -0.475771, -1.34789, 1, 1, 1, 1, 1,
-0.3275028, 0.2873471, -0.05239264, 1, 1, 1, 1, 1,
-0.3268038, -0.06733078, -1.478803, 1, 1, 1, 1, 1,
-0.3242288, 0.3288587, -1.054805, 1, 1, 1, 1, 1,
-0.3142387, 0.3826961, 0.2538678, 1, 1, 1, 1, 1,
-0.3130222, 1.469519, -0.1911794, 1, 1, 1, 1, 1,
-0.3055673, -0.5769113, -2.980118, 1, 1, 1, 1, 1,
-0.3027439, -0.2899512, -1.280681, 1, 1, 1, 1, 1,
-0.2983631, -2.169366, -3.202805, 1, 1, 1, 1, 1,
-0.2951259, 1.228214, -1.301335, 1, 1, 1, 1, 1,
-0.2916816, -0.6459658, -0.9197375, 1, 1, 1, 1, 1,
-0.2854535, 0.3330538, -0.7120987, 1, 1, 1, 1, 1,
-0.2797774, -0.124338, -1.432424, 1, 1, 1, 1, 1,
-0.2794711, 0.3729212, -0.8645418, 1, 1, 1, 1, 1,
-0.2781192, 0.4435178, -1.671349, 1, 1, 1, 1, 1,
-0.2749653, 1.085424, 0.4456587, 0, 0, 1, 1, 1,
-0.2733544, -1.53189, -2.969427, 1, 0, 0, 1, 1,
-0.2703138, 0.1871737, -2.226254, 1, 0, 0, 1, 1,
-0.2663353, 2.493504, -0.4915143, 1, 0, 0, 1, 1,
-0.2657199, 0.127471, -1.30755, 1, 0, 0, 1, 1,
-0.2642253, 0.9587653, -1.854538, 1, 0, 0, 1, 1,
-0.2628022, -0.270931, -3.709067, 0, 0, 0, 1, 1,
-0.2586855, -0.8797066, -2.674462, 0, 0, 0, 1, 1,
-0.2521024, 0.2697969, 0.4911961, 0, 0, 0, 1, 1,
-0.2477015, 0.7555194, -0.006416756, 0, 0, 0, 1, 1,
-0.2474873, 0.1685025, -2.582056, 0, 0, 0, 1, 1,
-0.2468017, -0.7898692, -1.631788, 0, 0, 0, 1, 1,
-0.2400311, -1.27852, -2.874076, 0, 0, 0, 1, 1,
-0.2383588, 1.390809, 0.4186093, 1, 1, 1, 1, 1,
-0.2332686, 0.8650258, 1.037137, 1, 1, 1, 1, 1,
-0.2306026, -0.7200062, -3.676879, 1, 1, 1, 1, 1,
-0.2298848, -0.1555817, -0.8841686, 1, 1, 1, 1, 1,
-0.2260869, -0.4341758, -3.374296, 1, 1, 1, 1, 1,
-0.217065, 1.736621, -0.1076056, 1, 1, 1, 1, 1,
-0.2129075, -0.2414807, -1.230398, 1, 1, 1, 1, 1,
-0.2107867, 0.5705482, 0.3285634, 1, 1, 1, 1, 1,
-0.2098604, -0.3930034, -2.036633, 1, 1, 1, 1, 1,
-0.2083525, -0.3204583, -2.828706, 1, 1, 1, 1, 1,
-0.2067291, 1.057883, 1.076868, 1, 1, 1, 1, 1,
-0.205626, -0.3725842, -2.389338, 1, 1, 1, 1, 1,
-0.2044242, 1.769482, 0.5798439, 1, 1, 1, 1, 1,
-0.2031862, 1.515493, 0.7375529, 1, 1, 1, 1, 1,
-0.1997004, -0.4270255, -2.40691, 1, 1, 1, 1, 1,
-0.1979373, -2.432488, -2.715188, 0, 0, 1, 1, 1,
-0.1966651, -0.6138858, -2.414083, 1, 0, 0, 1, 1,
-0.1938793, 0.9874761, 0.7445726, 1, 0, 0, 1, 1,
-0.1926037, -0.9870501, -3.741992, 1, 0, 0, 1, 1,
-0.191146, 1.462276, 0.8618471, 1, 0, 0, 1, 1,
-0.1896005, 0.4344207, -0.4052099, 1, 0, 0, 1, 1,
-0.1873793, 1.634541, 0.3661148, 0, 0, 0, 1, 1,
-0.1858369, -0.04217829, -3.531191, 0, 0, 0, 1, 1,
-0.1773665, 1.752693, 0.7336596, 0, 0, 0, 1, 1,
-0.1745564, 1.091562, -0.6670827, 0, 0, 0, 1, 1,
-0.1664004, 1.201234, -1.846684, 0, 0, 0, 1, 1,
-0.1550835, -0.8160861, -3.705606, 0, 0, 0, 1, 1,
-0.1527941, -0.2251988, -1.273665, 0, 0, 0, 1, 1,
-0.1499847, -1.528513, -4.954535, 1, 1, 1, 1, 1,
-0.1478671, -0.1775283, -2.738773, 1, 1, 1, 1, 1,
-0.1469773, 0.8168525, -1.507364, 1, 1, 1, 1, 1,
-0.1455238, 0.2410155, -0.11721, 1, 1, 1, 1, 1,
-0.1451395, -0.4469736, -2.158394, 1, 1, 1, 1, 1,
-0.1448062, 1.069612, -1.301805, 1, 1, 1, 1, 1,
-0.1446547, -1.606016, -3.275808, 1, 1, 1, 1, 1,
-0.1443982, 0.1666203, -2.059995, 1, 1, 1, 1, 1,
-0.1420267, -0.9510413, -1.583961, 1, 1, 1, 1, 1,
-0.136926, 0.8187444, -0.4065004, 1, 1, 1, 1, 1,
-0.1343006, 0.3345474, -0.4935977, 1, 1, 1, 1, 1,
-0.1295839, 1.384999, 0.5688407, 1, 1, 1, 1, 1,
-0.1206489, 0.7895223, -1.572012, 1, 1, 1, 1, 1,
-0.1198531, -1.122247, -2.62026, 1, 1, 1, 1, 1,
-0.1197386, 0.1077948, -0.582251, 1, 1, 1, 1, 1,
-0.1181136, -1.480541, -3.578196, 0, 0, 1, 1, 1,
-0.1162668, -1.225053, -2.11087, 1, 0, 0, 1, 1,
-0.1117739, -0.06419062, -2.654833, 1, 0, 0, 1, 1,
-0.1080623, 0.3147197, 1.458909, 1, 0, 0, 1, 1,
-0.104998, -0.4084055, -3.428172, 1, 0, 0, 1, 1,
-0.1044308, 0.2416219, -0.3268518, 1, 0, 0, 1, 1,
-0.1033702, -1.012698, -1.608293, 0, 0, 0, 1, 1,
-0.1023718, 0.4257915, 0.192748, 0, 0, 0, 1, 1,
-0.09045641, 2.014931, 0.3415815, 0, 0, 0, 1, 1,
-0.08958696, -0.4042381, -2.12397, 0, 0, 0, 1, 1,
-0.08953097, -0.3147585, -3.093321, 0, 0, 0, 1, 1,
-0.08735407, 0.7339383, -0.529335, 0, 0, 0, 1, 1,
-0.08263493, -1.311192, -7.167071, 0, 0, 0, 1, 1,
-0.08239958, -2.314387, -1.717209, 1, 1, 1, 1, 1,
-0.08009843, 2.186862, -0.8085766, 1, 1, 1, 1, 1,
-0.07619686, 0.7146711, -1.380808, 1, 1, 1, 1, 1,
-0.07146234, -0.1097198, -1.994635, 1, 1, 1, 1, 1,
-0.06900433, -0.9699901, -2.075518, 1, 1, 1, 1, 1,
-0.06563491, -1.049802, -5.465081, 1, 1, 1, 1, 1,
-0.06262171, -0.9959012, -4.7066, 1, 1, 1, 1, 1,
-0.06250555, -1.081851, -3.547169, 1, 1, 1, 1, 1,
-0.06128537, 1.246142, -1.094446, 1, 1, 1, 1, 1,
-0.05364876, -1.255522, -2.451966, 1, 1, 1, 1, 1,
-0.05055647, -0.1726987, -1.89392, 1, 1, 1, 1, 1,
-0.04961133, -0.3045912, -4.107673, 1, 1, 1, 1, 1,
-0.04734329, 0.2904268, 1.151089, 1, 1, 1, 1, 1,
-0.04514055, 0.1003715, -0.9272414, 1, 1, 1, 1, 1,
-0.04388466, 0.7536947, -0.1559349, 1, 1, 1, 1, 1,
-0.03779846, -0.5446132, -2.192905, 0, 0, 1, 1, 1,
-0.03748109, 1.117519, 0.5152464, 1, 0, 0, 1, 1,
-0.03363745, -0.5572229, -3.61346, 1, 0, 0, 1, 1,
-0.03317856, -0.01237963, -2.811931, 1, 0, 0, 1, 1,
-0.03141971, -1.299312, -2.14678, 1, 0, 0, 1, 1,
-0.02968362, 0.7053711, 0.8245322, 1, 0, 0, 1, 1,
-0.02598126, 0.01443384, -0.9389513, 0, 0, 0, 1, 1,
-0.02545737, 0.4432297, 1.446959, 0, 0, 0, 1, 1,
-0.024505, 0.3829655, -1.29924, 0, 0, 0, 1, 1,
-0.02169453, 0.1569585, -0.1571222, 0, 0, 0, 1, 1,
-0.02114144, -0.6842119, -3.247937, 0, 0, 0, 1, 1,
-0.02022474, -0.5718127, -4.259752, 0, 0, 0, 1, 1,
-0.01894314, -0.9188582, -0.7859147, 0, 0, 0, 1, 1,
-0.01794023, 0.1683702, -1.482866, 1, 1, 1, 1, 1,
-0.01791458, -0.1837595, -3.664118, 1, 1, 1, 1, 1,
-0.01613473, -1.199594, -3.545141, 1, 1, 1, 1, 1,
-0.01606249, -0.2323883, -3.290048, 1, 1, 1, 1, 1,
-0.01266284, -0.07888323, -2.922077, 1, 1, 1, 1, 1,
-0.01258963, -0.6483174, -3.611784, 1, 1, 1, 1, 1,
-0.01027742, 0.5415789, 1.651527, 1, 1, 1, 1, 1,
-0.006304737, 0.450809, 0.799798, 1, 1, 1, 1, 1,
-0.005773928, -0.6648866, -3.400931, 1, 1, 1, 1, 1,
-0.003885043, -0.4748132, -4.754885, 1, 1, 1, 1, 1,
0.004993231, -1.654019, 2.429641, 1, 1, 1, 1, 1,
0.00577267, -0.5297521, 2.603158, 1, 1, 1, 1, 1,
0.01073356, -1.606289, 2.058839, 1, 1, 1, 1, 1,
0.0163982, -0.6109218, 2.969753, 1, 1, 1, 1, 1,
0.02061591, 1.647048, 1.651588, 1, 1, 1, 1, 1,
0.02580385, 0.03998024, -0.4092419, 0, 0, 1, 1, 1,
0.02634728, -0.9215569, 5.171222, 1, 0, 0, 1, 1,
0.03222874, -0.7657223, 1.256525, 1, 0, 0, 1, 1,
0.033284, 0.7065472, -0.07188765, 1, 0, 0, 1, 1,
0.03361668, 0.9106855, -1.110793, 1, 0, 0, 1, 1,
0.03517301, 0.3786918, -0.07431286, 1, 0, 0, 1, 1,
0.03522716, -1.02221, 3.424267, 0, 0, 0, 1, 1,
0.04207666, 0.3464576, 0.28407, 0, 0, 0, 1, 1,
0.04678399, -3.217288, 1.72441, 0, 0, 0, 1, 1,
0.04834084, 0.03257261, -0.2739083, 0, 0, 0, 1, 1,
0.06002267, -0.7246399, 2.889033, 0, 0, 0, 1, 1,
0.06243423, -0.5896998, 2.600756, 0, 0, 0, 1, 1,
0.07042743, -0.2680376, 2.35887, 0, 0, 0, 1, 1,
0.07360159, -0.02398193, 1.77698, 1, 1, 1, 1, 1,
0.0767319, 0.9200119, -1.09682, 1, 1, 1, 1, 1,
0.0838762, 0.2936508, 0.8985566, 1, 1, 1, 1, 1,
0.08429548, 0.6860145, 0.9163139, 1, 1, 1, 1, 1,
0.0852077, 0.7143772, 0.2679383, 1, 1, 1, 1, 1,
0.08749207, -1.071788, 1.958769, 1, 1, 1, 1, 1,
0.08753487, -1.279947, 1.889652, 1, 1, 1, 1, 1,
0.08821611, -0.7058473, 2.47311, 1, 1, 1, 1, 1,
0.09399235, -1.027034, 1.206836, 1, 1, 1, 1, 1,
0.1052967, -0.05462877, 2.327253, 1, 1, 1, 1, 1,
0.10557, -0.2419337, 4.140085, 1, 1, 1, 1, 1,
0.1088764, 1.064583, 1.342836, 1, 1, 1, 1, 1,
0.1125743, -1.227046, 3.476935, 1, 1, 1, 1, 1,
0.1126079, 2.176164, 0.8466637, 1, 1, 1, 1, 1,
0.1160498, 0.4065694, -0.4498604, 1, 1, 1, 1, 1,
0.1174119, 0.1962572, 0.268531, 0, 0, 1, 1, 1,
0.1185836, -1.25445, 1.869574, 1, 0, 0, 1, 1,
0.1204193, 0.606637, -0.5439878, 1, 0, 0, 1, 1,
0.1215908, 0.3741869, -0.5463954, 1, 0, 0, 1, 1,
0.1218033, -0.4343987, 2.938471, 1, 0, 0, 1, 1,
0.1254566, -0.2282849, 3.03596, 1, 0, 0, 1, 1,
0.130988, -2.108316, 3.603436, 0, 0, 0, 1, 1,
0.1333186, -0.6869488, -0.3603989, 0, 0, 0, 1, 1,
0.136042, -1.348743, 4.150352, 0, 0, 0, 1, 1,
0.1360761, -0.6384279, 2.235272, 0, 0, 0, 1, 1,
0.136458, 1.901734, 0.4196585, 0, 0, 0, 1, 1,
0.1380503, 0.7054799, -1.122398, 0, 0, 0, 1, 1,
0.1383062, 0.005589189, -0.3885755, 0, 0, 0, 1, 1,
0.1388484, -1.520734, 2.687733, 1, 1, 1, 1, 1,
0.1443996, 0.57555, 2.085178, 1, 1, 1, 1, 1,
0.1464864, -1.003174, 5.877457, 1, 1, 1, 1, 1,
0.1492143, -0.07467216, 2.258138, 1, 1, 1, 1, 1,
0.1544615, 0.0925326, 2.457368, 1, 1, 1, 1, 1,
0.1549927, -0.3089363, 1.429916, 1, 1, 1, 1, 1,
0.1582833, 0.01805055, 2.037963, 1, 1, 1, 1, 1,
0.1589947, -0.9529719, 2.632554, 1, 1, 1, 1, 1,
0.1619156, -1.135825, 2.928355, 1, 1, 1, 1, 1,
0.1623546, 0.004233665, 1.441628, 1, 1, 1, 1, 1,
0.1647135, 0.3234027, 1.082769, 1, 1, 1, 1, 1,
0.1648038, -0.5916622, 4.331362, 1, 1, 1, 1, 1,
0.1693567, 1.410911, 0.226674, 1, 1, 1, 1, 1,
0.1734521, -0.02194277, 1.438387, 1, 1, 1, 1, 1,
0.1790787, 0.8872622, 0.6201378, 1, 1, 1, 1, 1,
0.1848051, -0.654949, 4.089197, 0, 0, 1, 1, 1,
0.1850907, 0.6846169, -0.5111881, 1, 0, 0, 1, 1,
0.1852454, -0.9389452, 1.476073, 1, 0, 0, 1, 1,
0.1863321, 0.5205789, 0.2791333, 1, 0, 0, 1, 1,
0.1882455, 0.3154168, -0.5647655, 1, 0, 0, 1, 1,
0.1885175, -1.728043, 3.539539, 1, 0, 0, 1, 1,
0.1923531, 0.8183682, 0.5549475, 0, 0, 0, 1, 1,
0.1930143, 0.4397108, 0.0007454634, 0, 0, 0, 1, 1,
0.2001623, -1.367347, 5.94084, 0, 0, 0, 1, 1,
0.2012012, -1.027613, 3.230954, 0, 0, 0, 1, 1,
0.2028156, 0.1518877, 2.640058, 0, 0, 0, 1, 1,
0.2050834, -0.0006795165, 2.163536, 0, 0, 0, 1, 1,
0.206411, -0.1766665, 0.5340282, 0, 0, 0, 1, 1,
0.2127624, -0.8276006, 2.541794, 1, 1, 1, 1, 1,
0.2136671, -1.29893, 3.320762, 1, 1, 1, 1, 1,
0.2170703, 1.455042, 2.768739, 1, 1, 1, 1, 1,
0.2177526, -1.340878, 4.836178, 1, 1, 1, 1, 1,
0.2207971, 1.448623, 0.5662693, 1, 1, 1, 1, 1,
0.2211232, 0.6083472, 0.4392295, 1, 1, 1, 1, 1,
0.2248998, 0.4436251, 0.965392, 1, 1, 1, 1, 1,
0.2259504, 0.8059112, -0.8001661, 1, 1, 1, 1, 1,
0.2289538, -0.08880351, 3.580781, 1, 1, 1, 1, 1,
0.2291865, 0.8262599, -1.004898, 1, 1, 1, 1, 1,
0.2302147, 2.294281, -0.4823924, 1, 1, 1, 1, 1,
0.2312895, -1.045065, 1.464631, 1, 1, 1, 1, 1,
0.2317336, 0.7383366, 1.29203, 1, 1, 1, 1, 1,
0.2458807, -0.6220843, 3.056613, 1, 1, 1, 1, 1,
0.2500776, 0.4020766, 1.497683, 1, 1, 1, 1, 1,
0.2511702, -0.4329256, 2.420461, 0, 0, 1, 1, 1,
0.2517, -0.2275218, 0.538444, 1, 0, 0, 1, 1,
0.2520222, -1.129827, 3.107397, 1, 0, 0, 1, 1,
0.2534573, 0.09111416, 1.850375, 1, 0, 0, 1, 1,
0.2582471, 0.9520519, 2.950296, 1, 0, 0, 1, 1,
0.2628344, 0.6993203, 0.3316914, 1, 0, 0, 1, 1,
0.267656, 0.3371708, 1.821198, 0, 0, 0, 1, 1,
0.2706647, -0.2296204, 2.737805, 0, 0, 0, 1, 1,
0.2754462, 0.06802525, 1.890803, 0, 0, 0, 1, 1,
0.2774369, -0.9885024, 3.65566, 0, 0, 0, 1, 1,
0.280701, -0.4102955, 3.138173, 0, 0, 0, 1, 1,
0.2814452, -0.8578607, 2.749268, 0, 0, 0, 1, 1,
0.2840174, -1.140823, 4.388678, 0, 0, 0, 1, 1,
0.2842355, 1.264263, 0.2000778, 1, 1, 1, 1, 1,
0.2865891, -2.352631, 2.102581, 1, 1, 1, 1, 1,
0.2893876, 0.2743243, 1.453456, 1, 1, 1, 1, 1,
0.2901756, -0.2642213, 3.053141, 1, 1, 1, 1, 1,
0.2933645, 0.3128865, 1.026495, 1, 1, 1, 1, 1,
0.2964134, 0.1962359, 0.544552, 1, 1, 1, 1, 1,
0.2974319, -0.7055339, 2.547058, 1, 1, 1, 1, 1,
0.2981834, -0.1325121, 1.268879, 1, 1, 1, 1, 1,
0.3031166, -0.5927559, 1.879472, 1, 1, 1, 1, 1,
0.3032969, -1.110265, 3.24217, 1, 1, 1, 1, 1,
0.3057487, -0.7135029, 4.677441, 1, 1, 1, 1, 1,
0.3063855, 0.5657659, 1.091225, 1, 1, 1, 1, 1,
0.3076364, -0.03338483, 1.955051, 1, 1, 1, 1, 1,
0.3131465, -0.4148699, 2.791172, 1, 1, 1, 1, 1,
0.3139477, -0.5120892, 1.641575, 1, 1, 1, 1, 1,
0.3149965, -0.9292814, 1.827672, 0, 0, 1, 1, 1,
0.3155283, -0.745668, 3.108431, 1, 0, 0, 1, 1,
0.3157982, -1.40163, 3.57899, 1, 0, 0, 1, 1,
0.315954, -1.559754, 3.072408, 1, 0, 0, 1, 1,
0.3159874, 0.009079936, 2.539959, 1, 0, 0, 1, 1,
0.3187666, 1.187728, -0.1451, 1, 0, 0, 1, 1,
0.3218985, 0.3371217, 1.541726, 0, 0, 0, 1, 1,
0.3225287, 0.1623938, 2.70057, 0, 0, 0, 1, 1,
0.3280908, -0.1909124, 2.266017, 0, 0, 0, 1, 1,
0.3284883, -0.1096992, 1.56704, 0, 0, 0, 1, 1,
0.329124, 0.7570314, 0.006137817, 0, 0, 0, 1, 1,
0.3305488, 0.7405555, 0.1656984, 0, 0, 0, 1, 1,
0.3305511, 0.5095249, -0.1616148, 0, 0, 0, 1, 1,
0.3315321, 1.459853, 0.6929548, 1, 1, 1, 1, 1,
0.3321919, -0.9018903, 1.337938, 1, 1, 1, 1, 1,
0.3369058, 0.5215698, -1.247393, 1, 1, 1, 1, 1,
0.3397551, -1.561625, 2.263719, 1, 1, 1, 1, 1,
0.3411225, 0.3315467, 0.6124893, 1, 1, 1, 1, 1,
0.3417291, 3.180589, 0.6857297, 1, 1, 1, 1, 1,
0.3424768, -1.433568, 1.554159, 1, 1, 1, 1, 1,
0.3465893, 0.7466701, 1.602449, 1, 1, 1, 1, 1,
0.3475757, -0.7821359, 0.9656393, 1, 1, 1, 1, 1,
0.3478573, -1.883164, 2.746102, 1, 1, 1, 1, 1,
0.3568848, -0.006480141, 2.58787, 1, 1, 1, 1, 1,
0.3572097, 0.1689557, 1.150946, 1, 1, 1, 1, 1,
0.3577114, -1.046934, 2.81564, 1, 1, 1, 1, 1,
0.3649899, -1.753812, 2.679492, 1, 1, 1, 1, 1,
0.3652402, -0.2359234, 2.840286, 1, 1, 1, 1, 1,
0.3655447, 0.3236469, 0.6600383, 0, 0, 1, 1, 1,
0.3658355, -0.4263103, 0.772777, 1, 0, 0, 1, 1,
0.3677181, 0.8713934, 0.2309881, 1, 0, 0, 1, 1,
0.3696555, 0.3390492, 2.78571, 1, 0, 0, 1, 1,
0.371213, -0.740967, 3.634552, 1, 0, 0, 1, 1,
0.3813948, -0.3672157, 1.171836, 1, 0, 0, 1, 1,
0.3855668, -1.660748, 1.609015, 0, 0, 0, 1, 1,
0.3870277, 1.062908, -0.6840546, 0, 0, 0, 1, 1,
0.3969923, 0.5153202, 0.524032, 0, 0, 0, 1, 1,
0.3998693, -0.4083994, 0.9211041, 0, 0, 0, 1, 1,
0.4028625, -0.9174966, 1.955945, 0, 0, 0, 1, 1,
0.4054353, -1.785556, 4.067636, 0, 0, 0, 1, 1,
0.4059857, 0.3523481, -0.4000336, 0, 0, 0, 1, 1,
0.4116691, -0.6970354, 0.8929901, 1, 1, 1, 1, 1,
0.416578, -0.1380622, 0.5370046, 1, 1, 1, 1, 1,
0.4177498, 0.3406367, 1.218492, 1, 1, 1, 1, 1,
0.4197138, 0.7512512, 0.8071333, 1, 1, 1, 1, 1,
0.4204871, 0.1695136, 2.98383, 1, 1, 1, 1, 1,
0.4277421, -1.036391, 3.255466, 1, 1, 1, 1, 1,
0.4282745, -1.202546, 2.568065, 1, 1, 1, 1, 1,
0.4302438, 2.404029, 0.6242223, 1, 1, 1, 1, 1,
0.4314941, 0.08800383, 1.774162, 1, 1, 1, 1, 1,
0.4327669, 2.422801, -0.6094121, 1, 1, 1, 1, 1,
0.435448, 1.243516, -0.1825768, 1, 1, 1, 1, 1,
0.4354577, 0.6857546, -1.064048, 1, 1, 1, 1, 1,
0.4361238, 0.6512377, 0.9136002, 1, 1, 1, 1, 1,
0.437406, -0.9123614, 3.148788, 1, 1, 1, 1, 1,
0.4393662, -0.9932654, 4.610611, 1, 1, 1, 1, 1,
0.4412695, -1.926909, 2.473132, 0, 0, 1, 1, 1,
0.4431522, 0.1734477, 0.3970942, 1, 0, 0, 1, 1,
0.4434501, -2.152029, 3.892076, 1, 0, 0, 1, 1,
0.4436536, 1.039598, 0.5245991, 1, 0, 0, 1, 1,
0.4446039, 0.3672157, 1.107286, 1, 0, 0, 1, 1,
0.4456822, -0.1350956, 3.611903, 1, 0, 0, 1, 1,
0.4462836, 1.072957, -1.042431, 0, 0, 0, 1, 1,
0.4524837, 0.320581, -0.3999578, 0, 0, 0, 1, 1,
0.4564434, 0.2795459, 2.747638, 0, 0, 0, 1, 1,
0.4597407, 0.7518713, 0.3377007, 0, 0, 0, 1, 1,
0.4656799, 0.8563792, 1.099087, 0, 0, 0, 1, 1,
0.4689815, 0.3686003, 3.481075, 0, 0, 0, 1, 1,
0.4694343, 1.695348, -0.8580655, 0, 0, 0, 1, 1,
0.4705552, -1.001298, 4.560436, 1, 1, 1, 1, 1,
0.472086, 0.466303, -0.8271593, 1, 1, 1, 1, 1,
0.4721359, -0.9731042, 3.032589, 1, 1, 1, 1, 1,
0.4728273, -0.3645633, 2.633938, 1, 1, 1, 1, 1,
0.4746306, -0.5324028, 3.888506, 1, 1, 1, 1, 1,
0.4758503, 0.2771624, -1.216591, 1, 1, 1, 1, 1,
0.4767262, 0.1132606, 0.3446912, 1, 1, 1, 1, 1,
0.482839, -1.520715, 3.200513, 1, 1, 1, 1, 1,
0.4856762, 0.466658, 0.03538542, 1, 1, 1, 1, 1,
0.4913576, 0.2111357, 0.2255522, 1, 1, 1, 1, 1,
0.4947447, -0.5965792, 2.752249, 1, 1, 1, 1, 1,
0.4947816, -0.9630843, 1.30691, 1, 1, 1, 1, 1,
0.5029164, 0.2540375, 0.4396511, 1, 1, 1, 1, 1,
0.5029917, -1.055168, 2.255514, 1, 1, 1, 1, 1,
0.5101492, 0.8586248, 0.151458, 1, 1, 1, 1, 1,
0.513082, 1.226853, -0.3204651, 0, 0, 1, 1, 1,
0.5148039, 0.2352148, -0.1381708, 1, 0, 0, 1, 1,
0.5174859, 0.6880273, 0.2421793, 1, 0, 0, 1, 1,
0.5282688, 0.8059443, -0.2930742, 1, 0, 0, 1, 1,
0.5313591, -0.456833, 1.673533, 1, 0, 0, 1, 1,
0.5329626, 0.9285255, 0.9612638, 1, 0, 0, 1, 1,
0.5335144, 0.4826762, 1.187953, 0, 0, 0, 1, 1,
0.5360733, -0.04842453, 2.182436, 0, 0, 0, 1, 1,
0.5376037, -0.1109666, 0.8655699, 0, 0, 0, 1, 1,
0.5391485, -0.6045593, 2.655464, 0, 0, 0, 1, 1,
0.5411145, -0.7134579, 0.7705204, 0, 0, 0, 1, 1,
0.5433543, -0.1744981, 0.9676371, 0, 0, 0, 1, 1,
0.5447806, 0.9482784, -1.034382, 0, 0, 0, 1, 1,
0.5473267, 0.07275785, -1.059968, 1, 1, 1, 1, 1,
0.5538746, 1.103914, 0.1628163, 1, 1, 1, 1, 1,
0.5552334, -1.139521, 2.511261, 1, 1, 1, 1, 1,
0.5562943, 0.8870215, -0.4687483, 1, 1, 1, 1, 1,
0.5589294, 0.3008789, -0.2157559, 1, 1, 1, 1, 1,
0.5626023, 0.5994788, 0.7918391, 1, 1, 1, 1, 1,
0.5667566, 1.392731, 0.8858944, 1, 1, 1, 1, 1,
0.5677735, -0.752336, 1.34294, 1, 1, 1, 1, 1,
0.5748098, 0.7823672, -0.1247897, 1, 1, 1, 1, 1,
0.5758629, -1.208333, 1.169538, 1, 1, 1, 1, 1,
0.5840123, -0.7277362, 1.538612, 1, 1, 1, 1, 1,
0.5897038, -0.003010731, 2.316699, 1, 1, 1, 1, 1,
0.5931678, 1.215889, 1.188442, 1, 1, 1, 1, 1,
0.5972251, 0.179856, 2.831879, 1, 1, 1, 1, 1,
0.5984403, 0.7067758, 2.126165, 1, 1, 1, 1, 1,
0.6013587, 0.9270137, 0.9620359, 0, 0, 1, 1, 1,
0.6021488, -0.2245563, 2.589048, 1, 0, 0, 1, 1,
0.6069178, -0.8765606, 2.669126, 1, 0, 0, 1, 1,
0.6074665, 0.2667738, 0.6849989, 1, 0, 0, 1, 1,
0.6082462, -1.100877, 2.856188, 1, 0, 0, 1, 1,
0.610015, -1.211921, 3.070713, 1, 0, 0, 1, 1,
0.6128731, -0.5913582, 2.945617, 0, 0, 0, 1, 1,
0.6154225, -2.28369, 3.712952, 0, 0, 0, 1, 1,
0.6164251, 1.970497, 0.4446509, 0, 0, 0, 1, 1,
0.6204057, 0.7478036, 0.6275866, 0, 0, 0, 1, 1,
0.6241978, 0.312117, -0.8467163, 0, 0, 0, 1, 1,
0.6276917, 1.553208, 0.7517822, 0, 0, 0, 1, 1,
0.6328823, -0.2414345, 2.59242, 0, 0, 0, 1, 1,
0.6329543, 0.6966521, 1.007418, 1, 1, 1, 1, 1,
0.6347504, 0.4272464, 0.2516807, 1, 1, 1, 1, 1,
0.6405412, 0.3090062, 0.6225784, 1, 1, 1, 1, 1,
0.6415158, 0.4440504, 0.4901911, 1, 1, 1, 1, 1,
0.6450697, -1.098496, 2.818462, 1, 1, 1, 1, 1,
0.6543873, -0.462804, 2.052761, 1, 1, 1, 1, 1,
0.6609568, 0.5852903, 0.466157, 1, 1, 1, 1, 1,
0.6622985, 0.0816377, 0.7473235, 1, 1, 1, 1, 1,
0.6657893, 0.3993796, 0.918344, 1, 1, 1, 1, 1,
0.6675112, 0.6762986, 0.05861996, 1, 1, 1, 1, 1,
0.6777049, 0.3367798, 0.4432812, 1, 1, 1, 1, 1,
0.6780025, -1.142264, 2.924808, 1, 1, 1, 1, 1,
0.6781056, -0.5942359, 4.964353, 1, 1, 1, 1, 1,
0.6817269, -0.1018426, 3.041292, 1, 1, 1, 1, 1,
0.6835415, 1.355114, -0.7541929, 1, 1, 1, 1, 1,
0.6854686, 0.4075533, -0.6984865, 0, 0, 1, 1, 1,
0.6863102, 0.3787418, -0.5369797, 1, 0, 0, 1, 1,
0.6865875, -0.2705331, -1.016751, 1, 0, 0, 1, 1,
0.6869984, -0.8931686, 3.930643, 1, 0, 0, 1, 1,
0.6871212, -0.113046, -0.6095764, 1, 0, 0, 1, 1,
0.68745, 1.802356, 0.07054689, 1, 0, 0, 1, 1,
0.6888595, -0.5966915, 1.976406, 0, 0, 0, 1, 1,
0.6915151, 1.224546, 1.857375, 0, 0, 0, 1, 1,
0.6995184, -0.8775237, 2.052833, 0, 0, 0, 1, 1,
0.700277, 0.1345553, 2.25337, 0, 0, 0, 1, 1,
0.7010881, -0.09900362, 1.541892, 0, 0, 0, 1, 1,
0.7036409, 0.316603, 2.508983, 0, 0, 0, 1, 1,
0.7083009, 1.937227, -0.05378555, 0, 0, 0, 1, 1,
0.716736, -0.6264832, 1.685399, 1, 1, 1, 1, 1,
0.7176167, 0.05793938, 2.352159, 1, 1, 1, 1, 1,
0.7187538, -0.03567239, -0.3571849, 1, 1, 1, 1, 1,
0.7196572, -1.040736, 2.605467, 1, 1, 1, 1, 1,
0.7197903, -0.2437835, 2.373994, 1, 1, 1, 1, 1,
0.7322497, 1.015252, 0.3071701, 1, 1, 1, 1, 1,
0.733848, -0.308388, -0.9413521, 1, 1, 1, 1, 1,
0.7357678, -1.830411, 2.70804, 1, 1, 1, 1, 1,
0.7402319, -0.08929791, 2.330033, 1, 1, 1, 1, 1,
0.7418685, -2.244774, 4.277473, 1, 1, 1, 1, 1,
0.7427285, 0.5611439, -0.02976413, 1, 1, 1, 1, 1,
0.7488122, 2.638119, 0.376933, 1, 1, 1, 1, 1,
0.7537858, 0.2916512, 2.9313, 1, 1, 1, 1, 1,
0.7540334, 0.6021976, 0.7188752, 1, 1, 1, 1, 1,
0.7547249, -0.4707864, 2.08822, 1, 1, 1, 1, 1,
0.7590542, 1.244161, 0.1599159, 0, 0, 1, 1, 1,
0.7663589, 0.3214972, 0.9296708, 1, 0, 0, 1, 1,
0.7667224, -1.299376, 3.606764, 1, 0, 0, 1, 1,
0.7700007, 1.099309, 1.063473, 1, 0, 0, 1, 1,
0.771852, 0.1083516, 3.06931, 1, 0, 0, 1, 1,
0.77473, -1.288491, 3.490151, 1, 0, 0, 1, 1,
0.7755246, -1.456467, 2.664582, 0, 0, 0, 1, 1,
0.7767566, 1.431717, 0.3638536, 0, 0, 0, 1, 1,
0.7776625, -1.260724, 2.649922, 0, 0, 0, 1, 1,
0.7835752, 0.9590247, 0.3027726, 0, 0, 0, 1, 1,
0.7861859, -0.9927368, 2.330814, 0, 0, 0, 1, 1,
0.7888238, -0.8112742, 0.831138, 0, 0, 0, 1, 1,
0.7930132, -0.6504351, 1.958825, 0, 0, 0, 1, 1,
0.793771, 0.289409, 0.1793518, 1, 1, 1, 1, 1,
0.8024431, -0.4214286, 1.619447, 1, 1, 1, 1, 1,
0.8142211, 0.1827504, 1.959001, 1, 1, 1, 1, 1,
0.8152674, -0.07034924, 1.963753, 1, 1, 1, 1, 1,
0.817795, -0.7243795, 4.150878, 1, 1, 1, 1, 1,
0.8199717, 0.6500531, 1.988754, 1, 1, 1, 1, 1,
0.8205941, -0.4387922, 0.8099423, 1, 1, 1, 1, 1,
0.8244271, 0.8420807, 0.5361366, 1, 1, 1, 1, 1,
0.829972, -2.187393, 3.352222, 1, 1, 1, 1, 1,
0.853523, -0.5255334, 2.935173, 1, 1, 1, 1, 1,
0.8542175, -0.2473895, 1.789902, 1, 1, 1, 1, 1,
0.8604713, -0.4046387, 1.434544, 1, 1, 1, 1, 1,
0.8700413, 0.576139, -0.213612, 1, 1, 1, 1, 1,
0.8725313, 0.1475244, 1.176806, 1, 1, 1, 1, 1,
0.8740088, -0.6604078, 1.508724, 1, 1, 1, 1, 1,
0.8797866, -1.866478, 1.82511, 0, 0, 1, 1, 1,
0.8820738, 0.8282146, 0.676, 1, 0, 0, 1, 1,
0.8827332, 0.9637492, 1.207172, 1, 0, 0, 1, 1,
0.8932588, 0.1957244, 2.300465, 1, 0, 0, 1, 1,
0.9077216, 0.5317267, -0.06535517, 1, 0, 0, 1, 1,
0.9111858, 1.811712, 1.548412, 1, 0, 0, 1, 1,
0.9148588, -0.07653414, 2.529823, 0, 0, 0, 1, 1,
0.9163939, 0.5262459, -0.04879608, 0, 0, 0, 1, 1,
0.9166762, 0.6435241, -0.6268767, 0, 0, 0, 1, 1,
0.9170862, 0.1216968, 1.692716, 0, 0, 0, 1, 1,
0.9199745, -1.158218, 2.476291, 0, 0, 0, 1, 1,
0.9237286, 1.457345, 0.4358591, 0, 0, 0, 1, 1,
0.9242579, 0.6185566, 2.428918, 0, 0, 0, 1, 1,
0.9282741, -1.11373, 3.041918, 1, 1, 1, 1, 1,
0.9335353, 0.583155, -0.8683473, 1, 1, 1, 1, 1,
0.9341679, 0.5497127, 0.428088, 1, 1, 1, 1, 1,
0.9372085, 0.006481323, 0.623586, 1, 1, 1, 1, 1,
0.9380426, -0.2624381, 2.046042, 1, 1, 1, 1, 1,
0.9398437, -0.7042848, 3.264632, 1, 1, 1, 1, 1,
0.9550368, 0.573822, 1.972284, 1, 1, 1, 1, 1,
0.955076, -0.4941889, 2.703906, 1, 1, 1, 1, 1,
0.9573066, -1.648291, 1.535988, 1, 1, 1, 1, 1,
0.9604687, -0.4929962, 4.400109, 1, 1, 1, 1, 1,
0.9636873, -1.404632, 1.463236, 1, 1, 1, 1, 1,
0.9747248, -0.6224557, 0.7848804, 1, 1, 1, 1, 1,
0.9804899, -0.6470042, 2.223824, 1, 1, 1, 1, 1,
0.9869824, -1.79004, 2.42426, 1, 1, 1, 1, 1,
0.9879329, -0.9618341, 2.538487, 1, 1, 1, 1, 1,
0.993024, -0.8397726, 2.26056, 0, 0, 1, 1, 1,
0.9978179, 0.01199051, 1.089465, 1, 0, 0, 1, 1,
0.9980538, -0.3549185, 0.770991, 1, 0, 0, 1, 1,
0.9981943, -1.534637, 2.085464, 1, 0, 0, 1, 1,
0.9997562, -2.745003, 3.796838, 1, 0, 0, 1, 1,
1.009604, 0.2603151, 2.451054, 1, 0, 0, 1, 1,
1.018017, 0.9748356, -0.5981697, 0, 0, 0, 1, 1,
1.028062, 2.525263, -0.3283065, 0, 0, 0, 1, 1,
1.033545, 0.243727, 1.768609, 0, 0, 0, 1, 1,
1.051914, -2.504463, 3.540045, 0, 0, 0, 1, 1,
1.053546, 0.362626, 0.7865126, 0, 0, 0, 1, 1,
1.055581, 0.3433715, 2.524539, 0, 0, 0, 1, 1,
1.061227, 1.064384, 0.5627371, 0, 0, 0, 1, 1,
1.070921, 1.284333, 1.02189, 1, 1, 1, 1, 1,
1.071691, -1.2279, 0.9947902, 1, 1, 1, 1, 1,
1.084595, -1.210372, 3.033414, 1, 1, 1, 1, 1,
1.091015, 0.3348247, 3.295594, 1, 1, 1, 1, 1,
1.096244, 1.013133, -0.422117, 1, 1, 1, 1, 1,
1.100784, -0.6865801, 1.594785, 1, 1, 1, 1, 1,
1.10208, -0.486331, 1.561965, 1, 1, 1, 1, 1,
1.108095, 0.9655796, -0.6014501, 1, 1, 1, 1, 1,
1.108336, -0.02979142, 1.571773, 1, 1, 1, 1, 1,
1.109938, 1.609334, 1.195928, 1, 1, 1, 1, 1,
1.114896, -0.5294136, 1.453089, 1, 1, 1, 1, 1,
1.120208, -0.3793143, 1.899278, 1, 1, 1, 1, 1,
1.126327, 0.06885633, 1.816008, 1, 1, 1, 1, 1,
1.128829, 2.589878, 0.4009329, 1, 1, 1, 1, 1,
1.132898, -0.2719916, 2.195566, 1, 1, 1, 1, 1,
1.140906, 1.484137, -1.611433, 0, 0, 1, 1, 1,
1.143552, 1.050807, 2.268319, 1, 0, 0, 1, 1,
1.148938, 0.3594281, 2.120554, 1, 0, 0, 1, 1,
1.152165, -0.7232193, 2.98623, 1, 0, 0, 1, 1,
1.164428, 0.4582919, 0.3758655, 1, 0, 0, 1, 1,
1.165691, -1.443641, 1.822856, 1, 0, 0, 1, 1,
1.16912, -0.9156167, 2.390209, 0, 0, 0, 1, 1,
1.171908, -1.667625, -0.7284217, 0, 0, 0, 1, 1,
1.174311, -0.5718724, 1.293131, 0, 0, 0, 1, 1,
1.176304, 0.4190848, 1.444177, 0, 0, 0, 1, 1,
1.189606, 0.1469183, 1.430087, 0, 0, 0, 1, 1,
1.190788, 0.9679564, 1.914147, 0, 0, 0, 1, 1,
1.191413, 0.4771028, -0.1209534, 0, 0, 0, 1, 1,
1.194036, 2.197338, 1.169744, 1, 1, 1, 1, 1,
1.194993, -0.4425887, 3.414681, 1, 1, 1, 1, 1,
1.198167, -1.707038, 2.783912, 1, 1, 1, 1, 1,
1.200968, -1.797266, 1.930866, 1, 1, 1, 1, 1,
1.203161, -0.2943367, 0.6389049, 1, 1, 1, 1, 1,
1.217939, 0.5519007, 2.053874, 1, 1, 1, 1, 1,
1.230076, 0.2665377, -0.1731191, 1, 1, 1, 1, 1,
1.234789, 0.8746683, 1.516775, 1, 1, 1, 1, 1,
1.237374, -1.15228, 2.528537, 1, 1, 1, 1, 1,
1.243653, -0.9972809, 2.81712, 1, 1, 1, 1, 1,
1.248526, 1.193039, 1.580181, 1, 1, 1, 1, 1,
1.250278, -1.277002, 1.131637, 1, 1, 1, 1, 1,
1.254311, -0.8239003, 2.865556, 1, 1, 1, 1, 1,
1.254929, -0.1379591, 1.011167, 1, 1, 1, 1, 1,
1.261333, -0.8643232, 1.168739, 1, 1, 1, 1, 1,
1.270861, 0.5527663, 1.478547, 0, 0, 1, 1, 1,
1.275684, -0.9882957, 1.900753, 1, 0, 0, 1, 1,
1.28213, -1.436965, 1.212409, 1, 0, 0, 1, 1,
1.289054, -0.08176, 2.110837, 1, 0, 0, 1, 1,
1.299396, -0.504589, 1.459808, 1, 0, 0, 1, 1,
1.301255, -0.8034979, 1.417072, 1, 0, 0, 1, 1,
1.308874, 0.7459226, 0.7352211, 0, 0, 0, 1, 1,
1.314813, -0.01713867, 2.186502, 0, 0, 0, 1, 1,
1.320256, -2.532819, 1.485495, 0, 0, 0, 1, 1,
1.330725, 0.4705114, 3.384614, 0, 0, 0, 1, 1,
1.331589, -1.118558, 0.3975487, 0, 0, 0, 1, 1,
1.355886, 0.06185848, 3.922145, 0, 0, 0, 1, 1,
1.389249, -2.563143, 3.341013, 0, 0, 0, 1, 1,
1.395087, -1.562689, 4.241666, 1, 1, 1, 1, 1,
1.403642, -0.3892586, 2.081327, 1, 1, 1, 1, 1,
1.405032, 0.2467626, 2.434442, 1, 1, 1, 1, 1,
1.407043, 0.5730027, 1.339926, 1, 1, 1, 1, 1,
1.416421, -0.06909646, 2.740287, 1, 1, 1, 1, 1,
1.417806, 0.6528274, 1.130382, 1, 1, 1, 1, 1,
1.420069, -0.5513952, 2.884986, 1, 1, 1, 1, 1,
1.420419, -1.053908, 1.971967, 1, 1, 1, 1, 1,
1.42571, 0.1952537, 1.69296, 1, 1, 1, 1, 1,
1.426957, -0.4399396, 1.675139, 1, 1, 1, 1, 1,
1.427774, 0.2725865, 1.423707, 1, 1, 1, 1, 1,
1.43088, -0.8646209, 2.70238, 1, 1, 1, 1, 1,
1.446272, -1.10259, 2.798066, 1, 1, 1, 1, 1,
1.448519, 0.2211189, 2.212852, 1, 1, 1, 1, 1,
1.451635, -0.2974889, 2.484243, 1, 1, 1, 1, 1,
1.459165, -0.00652439, 1.842732, 0, 0, 1, 1, 1,
1.468506, 0.5911184, 2.510632, 1, 0, 0, 1, 1,
1.471338, -0.05858088, 0.7496104, 1, 0, 0, 1, 1,
1.476371, 0.3269534, 2.320932, 1, 0, 0, 1, 1,
1.479046, -0.1918745, -0.3071913, 1, 0, 0, 1, 1,
1.490053, -2.054894, 2.707632, 1, 0, 0, 1, 1,
1.498103, -0.6099187, 1.30276, 0, 0, 0, 1, 1,
1.507814, 1.157537, -0.1656281, 0, 0, 0, 1, 1,
1.516557, -0.7326705, 2.251283, 0, 0, 0, 1, 1,
1.52965, 0.09509625, 1.525417, 0, 0, 0, 1, 1,
1.53803, 1.29209, 2.821187, 0, 0, 0, 1, 1,
1.543857, -1.101498, 1.31262, 0, 0, 0, 1, 1,
1.550091, 0.3475135, -1.15801, 0, 0, 0, 1, 1,
1.552926, -0.6915537, 1.046821, 1, 1, 1, 1, 1,
1.553236, 0.788614, -0.3161119, 1, 1, 1, 1, 1,
1.555966, 0.7531211, 1.638195, 1, 1, 1, 1, 1,
1.556539, -0.1222101, 3.623395, 1, 1, 1, 1, 1,
1.557215, 0.6671523, 2.259356, 1, 1, 1, 1, 1,
1.566977, 0.06309494, 1.422718, 1, 1, 1, 1, 1,
1.570322, -0.7709855, 0.4647604, 1, 1, 1, 1, 1,
1.574501, -0.839097, 3.600542, 1, 1, 1, 1, 1,
1.581571, 0.2975981, 2.712327, 1, 1, 1, 1, 1,
1.601445, 2.585807, 2.00317, 1, 1, 1, 1, 1,
1.601585, 1.246429, 1.218083, 1, 1, 1, 1, 1,
1.615864, 0.9693668, 0.1241354, 1, 1, 1, 1, 1,
1.620924, 0.2594865, 2.487103, 1, 1, 1, 1, 1,
1.629611, -0.3988754, 3.248012, 1, 1, 1, 1, 1,
1.642367, -0.5486842, 0.7973305, 1, 1, 1, 1, 1,
1.655615, 1.578112, 0.3082756, 0, 0, 1, 1, 1,
1.673419, 0.1982471, 2.253248, 1, 0, 0, 1, 1,
1.688177, 0.5213037, 0.9697574, 1, 0, 0, 1, 1,
1.694758, 0.7818336, 1.48913, 1, 0, 0, 1, 1,
1.695816, 0.6431677, -0.5138074, 1, 0, 0, 1, 1,
1.696281, -0.09253477, 1.620839, 1, 0, 0, 1, 1,
1.710805, -0.1291076, 1.133517, 0, 0, 0, 1, 1,
1.714676, -0.05054327, 2.823914, 0, 0, 0, 1, 1,
1.730251, -1.311345, 2.222435, 0, 0, 0, 1, 1,
1.739304, -0.7982395, 3.818074, 0, 0, 0, 1, 1,
1.743916, -0.7654037, 0.5634176, 0, 0, 0, 1, 1,
1.763956, 0.2326036, 0.384809, 0, 0, 0, 1, 1,
1.765173, -1.545484, 2.581839, 0, 0, 0, 1, 1,
1.770067, -0.6874434, 1.256802, 1, 1, 1, 1, 1,
1.771786, 0.3653397, 1.488927, 1, 1, 1, 1, 1,
1.791919, 0.7061307, 1.390893, 1, 1, 1, 1, 1,
1.795039, -0.4355293, 2.177531, 1, 1, 1, 1, 1,
1.810705, -0.1781128, -0.01071932, 1, 1, 1, 1, 1,
1.820769, -0.2730628, 2.76743, 1, 1, 1, 1, 1,
1.833246, -1.752255, 3.327648, 1, 1, 1, 1, 1,
1.84045, -0.76704, 1.414887, 1, 1, 1, 1, 1,
1.846735, -0.8965612, 1.613573, 1, 1, 1, 1, 1,
1.859144, 0.9570266, 1.568117, 1, 1, 1, 1, 1,
1.870198, -0.8854371, 2.317136, 1, 1, 1, 1, 1,
1.889077, 1.75932, 0.03590419, 1, 1, 1, 1, 1,
1.897699, 0.8265175, 1.191351, 1, 1, 1, 1, 1,
1.904271, 1.588092, 1.887482, 1, 1, 1, 1, 1,
1.908866, -0.3857373, 4.016855, 1, 1, 1, 1, 1,
1.940329, 0.8140522, 1.463714, 0, 0, 1, 1, 1,
1.954485, -0.1530067, 2.58396, 1, 0, 0, 1, 1,
1.962209, -0.8043932, 1.881534, 1, 0, 0, 1, 1,
2.027156, -0.1817968, 1.213331, 1, 0, 0, 1, 1,
2.030481, -0.5085785, 1.758136, 1, 0, 0, 1, 1,
2.125351, -0.5712836, 1.838354, 1, 0, 0, 1, 1,
2.141825, -2.028737, 3.559285, 0, 0, 0, 1, 1,
2.17528, 0.8758281, 2.036467, 0, 0, 0, 1, 1,
2.226775, -0.3548069, 3.65493, 0, 0, 0, 1, 1,
2.265652, 0.4181708, 0.8588388, 0, 0, 0, 1, 1,
2.35783, 1.161911, 1.397914, 0, 0, 0, 1, 1,
2.368498, 1.700499, 1.642752, 0, 0, 0, 1, 1,
2.377353, -0.4081895, 1.73857, 0, 0, 0, 1, 1,
2.389637, 1.994732, 0.9309682, 1, 1, 1, 1, 1,
2.461046, -1.643744, 3.038272, 1, 1, 1, 1, 1,
2.5039, -0.8389304, 2.465221, 1, 1, 1, 1, 1,
2.668237, 0.3859043, 1.387931, 1, 1, 1, 1, 1,
2.841935, -0.1759599, 3.236915, 1, 1, 1, 1, 1,
2.91876, -0.2069499, 2.657188, 1, 1, 1, 1, 1,
3.441791, -0.3723951, 2.289651, 1, 1, 1, 1, 1
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
var radius = 10.67249;
var distance = 37.48665;
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
mvMatrix.translate( -0.2686522, -0.2162786, 0.6131151 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -37.48665);
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
