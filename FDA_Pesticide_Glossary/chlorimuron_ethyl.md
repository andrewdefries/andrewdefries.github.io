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
-2.984136, -0.5275996, -1.579809, 1, 0, 0, 1,
-2.939488, -1.268942, -2.213513, 1, 0.007843138, 0, 1,
-2.904211, -0.4285763, -1.060056, 1, 0.01176471, 0, 1,
-2.851735, -0.1931145, -3.316624, 1, 0.01960784, 0, 1,
-2.767466, 0.1522841, -1.02364, 1, 0.02352941, 0, 1,
-2.731347, -0.6417146, -1.762421, 1, 0.03137255, 0, 1,
-2.640731, 0.7484458, -1.785384, 1, 0.03529412, 0, 1,
-2.632647, -1.751398, -2.548913, 1, 0.04313726, 0, 1,
-2.608542, -0.2249922, -2.426843, 1, 0.04705882, 0, 1,
-2.426255, 1.249416, 0.1219372, 1, 0.05490196, 0, 1,
-2.368875, -0.3683876, 0.4165115, 1, 0.05882353, 0, 1,
-2.292871, 0.08377312, -2.029607, 1, 0.06666667, 0, 1,
-2.23732, 0.9266782, -1.733965, 1, 0.07058824, 0, 1,
-2.223892, -0.4101442, -0.3334123, 1, 0.07843138, 0, 1,
-2.218579, -0.1292818, -1.155586, 1, 0.08235294, 0, 1,
-2.130783, 0.0751253, -2.659626, 1, 0.09019608, 0, 1,
-2.099991, -0.6610168, -2.210788, 1, 0.09411765, 0, 1,
-2.099637, -1.344927, -1.255559, 1, 0.1019608, 0, 1,
-2.065112, -0.1891042, -1.806939, 1, 0.1098039, 0, 1,
-2.052373, -0.3544115, -2.388517, 1, 0.1137255, 0, 1,
-2.015511, 0.9118521, -2.009637, 1, 0.1215686, 0, 1,
-1.999732, 0.1095445, -2.818492, 1, 0.1254902, 0, 1,
-1.969541, -0.2708965, -2.433098, 1, 0.1333333, 0, 1,
-1.963189, 0.2129383, -0.9695213, 1, 0.1372549, 0, 1,
-1.962666, 1.790889, -1.366875, 1, 0.145098, 0, 1,
-1.957385, 0.04533295, -1.462922, 1, 0.1490196, 0, 1,
-1.938789, 0.4984153, -1.419916, 1, 0.1568628, 0, 1,
-1.933, -0.9410422, -2.331464, 1, 0.1607843, 0, 1,
-1.897467, 1.550719, -0.03046186, 1, 0.1686275, 0, 1,
-1.891156, 0.9028453, -0.5318972, 1, 0.172549, 0, 1,
-1.88502, -0.07868566, -3.423373, 1, 0.1803922, 0, 1,
-1.881277, -0.1574669, -2.662843, 1, 0.1843137, 0, 1,
-1.8056, 1.014019, -0.5534717, 1, 0.1921569, 0, 1,
-1.793855, 0.2799983, -1.129665, 1, 0.1960784, 0, 1,
-1.788249, -0.5449595, -2.360588, 1, 0.2039216, 0, 1,
-1.746268, 0.8258829, -1.193468, 1, 0.2117647, 0, 1,
-1.74444, 1.445017, -0.4222322, 1, 0.2156863, 0, 1,
-1.735431, -0.1570017, -0.4425732, 1, 0.2235294, 0, 1,
-1.729829, -0.1901896, -1.743659, 1, 0.227451, 0, 1,
-1.716379, 0.2501955, -2.242144, 1, 0.2352941, 0, 1,
-1.715216, -1.225622, -2.382049, 1, 0.2392157, 0, 1,
-1.71045, 0.6694502, -0.7589844, 1, 0.2470588, 0, 1,
-1.685811, -0.6223567, -1.965806, 1, 0.2509804, 0, 1,
-1.678753, -0.9531621, -2.238294, 1, 0.2588235, 0, 1,
-1.667054, 2.75684, -1.27632, 1, 0.2627451, 0, 1,
-1.650816, -0.4796948, -1.862421, 1, 0.2705882, 0, 1,
-1.647941, 0.820711, -0.777723, 1, 0.2745098, 0, 1,
-1.644905, -0.7164178, -1.351986, 1, 0.282353, 0, 1,
-1.628185, -1.330969, -3.015594, 1, 0.2862745, 0, 1,
-1.61856, -1.779474, -2.593883, 1, 0.2941177, 0, 1,
-1.613303, -0.7680075, -1.892708, 1, 0.3019608, 0, 1,
-1.613186, 0.401261, -3.395133, 1, 0.3058824, 0, 1,
-1.597915, 2.057776, -1.360664, 1, 0.3137255, 0, 1,
-1.591769, 0.002159578, -1.381498, 1, 0.3176471, 0, 1,
-1.590326, -0.1156975, 0.2098158, 1, 0.3254902, 0, 1,
-1.584826, 1.115797, 0.5513231, 1, 0.3294118, 0, 1,
-1.571062, -0.7309593, -0.9798241, 1, 0.3372549, 0, 1,
-1.563967, 0.1356099, 0.6984406, 1, 0.3411765, 0, 1,
-1.556491, -1.971516, -2.100072, 1, 0.3490196, 0, 1,
-1.549055, 0.03163138, -1.770442, 1, 0.3529412, 0, 1,
-1.542041, -0.5063648, -2.22641, 1, 0.3607843, 0, 1,
-1.532322, -0.1862823, -0.7755182, 1, 0.3647059, 0, 1,
-1.528191, 0.6252291, -0.9923276, 1, 0.372549, 0, 1,
-1.525193, 1.020431, 0.5348749, 1, 0.3764706, 0, 1,
-1.513415, -0.8746351, -3.27929, 1, 0.3843137, 0, 1,
-1.507868, -0.8970816, -1.719429, 1, 0.3882353, 0, 1,
-1.501813, -2.353064, -2.663036, 1, 0.3960784, 0, 1,
-1.481392, 0.9407264, -0.9009047, 1, 0.4039216, 0, 1,
-1.46763, 0.8109484, -2.530575, 1, 0.4078431, 0, 1,
-1.462831, -1.844013, -3.56207, 1, 0.4156863, 0, 1,
-1.45825, -0.1539406, -2.101616, 1, 0.4196078, 0, 1,
-1.442192, -0.4577156, -1.284418, 1, 0.427451, 0, 1,
-1.438288, -2.342025, -1.597442, 1, 0.4313726, 0, 1,
-1.421134, -1.193301, -2.487722, 1, 0.4392157, 0, 1,
-1.418305, -0.2003508, -1.522334, 1, 0.4431373, 0, 1,
-1.40887, -0.5229585, -3.0615, 1, 0.4509804, 0, 1,
-1.401548, -1.715765, -3.086587, 1, 0.454902, 0, 1,
-1.398935, -0.09128871, -2.111807, 1, 0.4627451, 0, 1,
-1.398623, 0.5003098, -1.683701, 1, 0.4666667, 0, 1,
-1.395675, -0.1881261, -0.5697276, 1, 0.4745098, 0, 1,
-1.394934, 0.7613012, -0.3354977, 1, 0.4784314, 0, 1,
-1.394842, -2.421788, -0.9280682, 1, 0.4862745, 0, 1,
-1.391284, -1.730712, -3.004122, 1, 0.4901961, 0, 1,
-1.376857, 1.466975, -2.159702, 1, 0.4980392, 0, 1,
-1.374129, 2.124064, -1.525304, 1, 0.5058824, 0, 1,
-1.373521, 0.9258385, -0.5233759, 1, 0.509804, 0, 1,
-1.358454, 0.3407995, -0.980501, 1, 0.5176471, 0, 1,
-1.352041, 1.831369, -0.5208086, 1, 0.5215687, 0, 1,
-1.346868, 0.4949575, -0.2668037, 1, 0.5294118, 0, 1,
-1.344895, 0.4179296, -2.369416, 1, 0.5333334, 0, 1,
-1.344836, -0.2853859, -1.714446, 1, 0.5411765, 0, 1,
-1.341742, 1.109834, 1.164801, 1, 0.5450981, 0, 1,
-1.338241, -0.03834266, -1.487374, 1, 0.5529412, 0, 1,
-1.33219, 0.6702836, -1.442136, 1, 0.5568628, 0, 1,
-1.326345, -1.678491, -1.705591, 1, 0.5647059, 0, 1,
-1.319623, -0.672673, -2.695994, 1, 0.5686275, 0, 1,
-1.30892, 0.1691198, 0.5742766, 1, 0.5764706, 0, 1,
-1.304497, -2.072844, -1.566704, 1, 0.5803922, 0, 1,
-1.295644, 0.2716579, -1.41652, 1, 0.5882353, 0, 1,
-1.292256, 0.3256054, -0.7984228, 1, 0.5921569, 0, 1,
-1.291923, -1.493776, -1.407122, 1, 0.6, 0, 1,
-1.28405, 1.176792, -2.107058, 1, 0.6078432, 0, 1,
-1.281595, -0.9856594, -2.68816, 1, 0.6117647, 0, 1,
-1.279104, 1.826991, -0.754383, 1, 0.6196079, 0, 1,
-1.278591, -1.076938, -3.441921, 1, 0.6235294, 0, 1,
-1.276339, -1.039365, -1.44556, 1, 0.6313726, 0, 1,
-1.273691, 0.7286777, -1.178242, 1, 0.6352941, 0, 1,
-1.265706, -1.162202, -2.881315, 1, 0.6431373, 0, 1,
-1.262632, -0.8192701, -1.830535, 1, 0.6470588, 0, 1,
-1.249075, -0.02496973, -2.289848, 1, 0.654902, 0, 1,
-1.238231, -0.6030323, -3.038865, 1, 0.6588235, 0, 1,
-1.231558, 1.652173, -0.4499337, 1, 0.6666667, 0, 1,
-1.230506, -0.2901387, -1.630618, 1, 0.6705883, 0, 1,
-1.219763, 1.056587, 0.7620414, 1, 0.6784314, 0, 1,
-1.216157, 0.6225154, -0.5041669, 1, 0.682353, 0, 1,
-1.215087, -1.690074, -1.682287, 1, 0.6901961, 0, 1,
-1.211383, -0.8270736, -3.229438, 1, 0.6941177, 0, 1,
-1.210771, 0.1846762, -2.300631, 1, 0.7019608, 0, 1,
-1.202776, -0.4003766, -2.736034, 1, 0.7098039, 0, 1,
-1.177969, 0.1920276, -3.19247, 1, 0.7137255, 0, 1,
-1.169544, 1.988212, -1.631052, 1, 0.7215686, 0, 1,
-1.15664, 0.4847327, -1.940641, 1, 0.7254902, 0, 1,
-1.150954, -1.244212, -1.607479, 1, 0.7333333, 0, 1,
-1.148416, -0.779966, -1.978998, 1, 0.7372549, 0, 1,
-1.13947, 0.5224853, -0.3673591, 1, 0.7450981, 0, 1,
-1.137462, -0.9826673, -1.933036, 1, 0.7490196, 0, 1,
-1.12568, 1.10049, -0.4235594, 1, 0.7568628, 0, 1,
-1.121374, 0.01096663, -2.10895, 1, 0.7607843, 0, 1,
-1.121046, 1.852531, -0.9760488, 1, 0.7686275, 0, 1,
-1.120035, -1.088399, -3.22766, 1, 0.772549, 0, 1,
-1.114195, 0.1200959, 0.3325331, 1, 0.7803922, 0, 1,
-1.111887, 0.6499367, -0.5482596, 1, 0.7843137, 0, 1,
-1.109949, 1.365763, -1.215917, 1, 0.7921569, 0, 1,
-1.100296, -0.1574037, -0.985131, 1, 0.7960784, 0, 1,
-1.098823, -0.1098768, -1.921772, 1, 0.8039216, 0, 1,
-1.094346, -0.9346331, -4.551606, 1, 0.8117647, 0, 1,
-1.09333, 1.09316, -0.04169483, 1, 0.8156863, 0, 1,
-1.09186, -1.283798, -1.250821, 1, 0.8235294, 0, 1,
-1.086076, 0.5216313, -1.596874, 1, 0.827451, 0, 1,
-1.070181, 1.407902, -1.320326, 1, 0.8352941, 0, 1,
-1.053856, 0.5558999, -0.8712541, 1, 0.8392157, 0, 1,
-1.046722, 0.5146019, -0.9506869, 1, 0.8470588, 0, 1,
-1.042087, -0.1886168, -1.306598, 1, 0.8509804, 0, 1,
-1.038934, -0.6839639, -2.392079, 1, 0.8588235, 0, 1,
-1.038379, -0.4177325, -1.725951, 1, 0.8627451, 0, 1,
-1.037959, -1.039782, -3.18435, 1, 0.8705882, 0, 1,
-1.035947, 0.7657205, -1.819857, 1, 0.8745098, 0, 1,
-1.029786, -2.073907, -3.395747, 1, 0.8823529, 0, 1,
-1.025158, 0.6198801, -1.228991, 1, 0.8862745, 0, 1,
-1.02255, 1.230919, 0.05433709, 1, 0.8941177, 0, 1,
-1.02074, 0.4416964, 0.9506928, 1, 0.8980392, 0, 1,
-1.019576, -1.083486, -3.342234, 1, 0.9058824, 0, 1,
-1.018923, 0.6404174, -0.259405, 1, 0.9137255, 0, 1,
-1.014864, -1.893429, -1.878284, 1, 0.9176471, 0, 1,
-1.006866, -0.7808645, -3.001552, 1, 0.9254902, 0, 1,
-1.002721, -1.620622, -2.983423, 1, 0.9294118, 0, 1,
-0.9985916, 0.5601753, -0.1921713, 1, 0.9372549, 0, 1,
-0.9831623, 0.9029912, -1.990497, 1, 0.9411765, 0, 1,
-0.9818037, -0.7579584, -2.514374, 1, 0.9490196, 0, 1,
-0.9786463, 0.9521239, -0.2692947, 1, 0.9529412, 0, 1,
-0.9738451, 2.098082, 1.459852, 1, 0.9607843, 0, 1,
-0.9736658, 1.737316, -0.6884882, 1, 0.9647059, 0, 1,
-0.9712358, -0.03415532, 0.03806616, 1, 0.972549, 0, 1,
-0.9689358, 0.2128033, -0.2643441, 1, 0.9764706, 0, 1,
-0.9662734, -1.486921, -0.4259987, 1, 0.9843137, 0, 1,
-0.964318, -0.1291025, -2.81562, 1, 0.9882353, 0, 1,
-0.9560542, -0.1392048, 0.3331372, 1, 0.9960784, 0, 1,
-0.9483067, -0.1851382, -2.479192, 0.9960784, 1, 0, 1,
-0.9472167, -1.324674, -1.921089, 0.9921569, 1, 0, 1,
-0.942445, -1.29318, -3.502729, 0.9843137, 1, 0, 1,
-0.9410785, 0.03645276, -0.2589084, 0.9803922, 1, 0, 1,
-0.9409336, -1.00476, -1.581859, 0.972549, 1, 0, 1,
-0.9391022, 0.2390698, -1.924066, 0.9686275, 1, 0, 1,
-0.9376567, 0.1466078, -1.810862, 0.9607843, 1, 0, 1,
-0.9337373, 0.06095452, -1.471642, 0.9568627, 1, 0, 1,
-0.9288758, -0.504369, -3.598414, 0.9490196, 1, 0, 1,
-0.9193277, -0.7949298, 0.4205267, 0.945098, 1, 0, 1,
-0.9169675, 0.7661488, -1.424798, 0.9372549, 1, 0, 1,
-0.9104345, 1.041731, -2.115289, 0.9333333, 1, 0, 1,
-0.9068639, -1.021818, -2.08238, 0.9254902, 1, 0, 1,
-0.9035531, 0.6431108, -0.2834056, 0.9215686, 1, 0, 1,
-0.9010546, 0.2252377, -1.999839, 0.9137255, 1, 0, 1,
-0.8971318, -0.02923064, -1.487684, 0.9098039, 1, 0, 1,
-0.8911987, -0.274005, -4.316767, 0.9019608, 1, 0, 1,
-0.8752467, 1.878695, -0.5319994, 0.8941177, 1, 0, 1,
-0.873448, -0.3989844, -3.232444, 0.8901961, 1, 0, 1,
-0.8663645, 1.010301, 0.8031815, 0.8823529, 1, 0, 1,
-0.8646809, -0.5692354, -1.957706, 0.8784314, 1, 0, 1,
-0.8605582, -0.06058081, -2.456916, 0.8705882, 1, 0, 1,
-0.8600423, 0.002501742, -1.898449, 0.8666667, 1, 0, 1,
-0.8540061, 0.2395595, -1.469361, 0.8588235, 1, 0, 1,
-0.8537359, -0.3918318, 0.0839272, 0.854902, 1, 0, 1,
-0.8481869, -1.790401, -3.277246, 0.8470588, 1, 0, 1,
-0.8473676, 0.05648969, -2.270624, 0.8431373, 1, 0, 1,
-0.8421171, 0.9021865, 0.2815782, 0.8352941, 1, 0, 1,
-0.8387147, 1.359839, -0.07938851, 0.8313726, 1, 0, 1,
-0.8346698, 1.167174, -0.7524366, 0.8235294, 1, 0, 1,
-0.8336545, 0.2951752, -1.426836, 0.8196079, 1, 0, 1,
-0.8251625, -1.286295, -3.15714, 0.8117647, 1, 0, 1,
-0.8238932, 0.3554317, -0.382333, 0.8078431, 1, 0, 1,
-0.8063617, 2.326909, -2.789827, 0.8, 1, 0, 1,
-0.8020532, 1.020486, 0.04086228, 0.7921569, 1, 0, 1,
-0.8015975, -0.2905686, -0.9762551, 0.7882353, 1, 0, 1,
-0.7974762, 0.5950578, -0.9755376, 0.7803922, 1, 0, 1,
-0.7943726, 0.5392858, -1.651969, 0.7764706, 1, 0, 1,
-0.7940951, 1.65511, -2.185503, 0.7686275, 1, 0, 1,
-0.793725, 0.1159546, -1.836107, 0.7647059, 1, 0, 1,
-0.791818, -0.1639138, -2.903965, 0.7568628, 1, 0, 1,
-0.7917989, 0.7069226, -0.1383037, 0.7529412, 1, 0, 1,
-0.77943, -0.6405938, -1.381495, 0.7450981, 1, 0, 1,
-0.7730716, 0.1333604, -3.749038, 0.7411765, 1, 0, 1,
-0.7717084, -0.444136, -1.444309, 0.7333333, 1, 0, 1,
-0.7707726, 0.3359161, -0.08553825, 0.7294118, 1, 0, 1,
-0.7676836, -1.749742, -2.498548, 0.7215686, 1, 0, 1,
-0.7619793, 1.147481, 0.4418061, 0.7176471, 1, 0, 1,
-0.7618923, 1.144324, -0.1775616, 0.7098039, 1, 0, 1,
-0.7598691, -0.984604, -2.687652, 0.7058824, 1, 0, 1,
-0.7560881, -1.535765, -2.819251, 0.6980392, 1, 0, 1,
-0.7554799, 0.6436815, -0.8120669, 0.6901961, 1, 0, 1,
-0.754449, -0.6715533, -4.198714, 0.6862745, 1, 0, 1,
-0.7527752, -0.1585226, -1.176372, 0.6784314, 1, 0, 1,
-0.7527498, 0.8224971, 0.5077006, 0.6745098, 1, 0, 1,
-0.7511058, -0.3561614, -2.136364, 0.6666667, 1, 0, 1,
-0.7506436, 0.5184796, -0.4567595, 0.6627451, 1, 0, 1,
-0.7470165, -1.186165, -2.306701, 0.654902, 1, 0, 1,
-0.7455713, -0.5583087, -0.5239403, 0.6509804, 1, 0, 1,
-0.7451497, -0.05456038, -1.964894, 0.6431373, 1, 0, 1,
-0.737646, 1.528832, 0.692719, 0.6392157, 1, 0, 1,
-0.7339534, 2.29115, -0.3692444, 0.6313726, 1, 0, 1,
-0.7337384, 0.7322467, -1.031647, 0.627451, 1, 0, 1,
-0.7320731, -0.9925452, -0.3784892, 0.6196079, 1, 0, 1,
-0.7314934, -0.8496923, -0.01779016, 0.6156863, 1, 0, 1,
-0.7311481, 2.152623, 1.565436, 0.6078432, 1, 0, 1,
-0.7303002, -0.9671151, -3.359898, 0.6039216, 1, 0, 1,
-0.7244617, 0.1786772, -1.870277, 0.5960785, 1, 0, 1,
-0.7231724, 1.009673, -0.0652421, 0.5882353, 1, 0, 1,
-0.72254, 0.3780048, -0.8821014, 0.5843138, 1, 0, 1,
-0.7197435, 0.06972826, 1.279641, 0.5764706, 1, 0, 1,
-0.7189652, -0.2178954, -2.778008, 0.572549, 1, 0, 1,
-0.717741, -0.6928744, -2.867659, 0.5647059, 1, 0, 1,
-0.7165797, 2.928479, 0.8816261, 0.5607843, 1, 0, 1,
-0.715142, -0.2095875, -1.666038, 0.5529412, 1, 0, 1,
-0.7131299, 1.591054, 1.503638, 0.5490196, 1, 0, 1,
-0.7100399, 1.009414, 0.1573382, 0.5411765, 1, 0, 1,
-0.7087246, 1.315178, 0.09409563, 0.5372549, 1, 0, 1,
-0.7080743, -0.4619334, -1.048207, 0.5294118, 1, 0, 1,
-0.7050321, 0.4333873, -1.667723, 0.5254902, 1, 0, 1,
-0.7018992, -0.7107385, -3.474369, 0.5176471, 1, 0, 1,
-0.693696, 0.5059152, 1.953953, 0.5137255, 1, 0, 1,
-0.6931734, -0.2517886, -1.938615, 0.5058824, 1, 0, 1,
-0.6891773, 0.9459677, 0.1764518, 0.5019608, 1, 0, 1,
-0.6859135, 0.7716467, 1.640932, 0.4941176, 1, 0, 1,
-0.6803644, 0.3816503, -2.416017, 0.4862745, 1, 0, 1,
-0.676816, -1.120888, -3.0811, 0.4823529, 1, 0, 1,
-0.6698664, 0.3264642, -0.05173657, 0.4745098, 1, 0, 1,
-0.6646993, 0.6327984, 0.2793454, 0.4705882, 1, 0, 1,
-0.6615397, 0.332083, -2.863248, 0.4627451, 1, 0, 1,
-0.6600911, 1.058332, -2.573472, 0.4588235, 1, 0, 1,
-0.6571676, 0.6470336, -2.273187, 0.4509804, 1, 0, 1,
-0.6565031, 2.542155, -0.5573328, 0.4470588, 1, 0, 1,
-0.6495147, 0.3286345, -0.9701415, 0.4392157, 1, 0, 1,
-0.6473128, -1.108945, -2.007774, 0.4352941, 1, 0, 1,
-0.6442761, 0.4056186, -2.611921, 0.427451, 1, 0, 1,
-0.6441506, 0.07107952, -1.612553, 0.4235294, 1, 0, 1,
-0.6389254, 0.5993897, -0.7867044, 0.4156863, 1, 0, 1,
-0.6367497, -0.6002591, -2.967052, 0.4117647, 1, 0, 1,
-0.6356361, 0.09688251, 0.2700206, 0.4039216, 1, 0, 1,
-0.6332341, -0.04257328, -0.04995601, 0.3960784, 1, 0, 1,
-0.628603, -1.536101, -1.663108, 0.3921569, 1, 0, 1,
-0.6273981, 0.7185789, -1.788371, 0.3843137, 1, 0, 1,
-0.6263035, -0.3746366, -1.577177, 0.3803922, 1, 0, 1,
-0.62274, -0.391185, -1.428991, 0.372549, 1, 0, 1,
-0.6208174, 0.2452922, -1.791761, 0.3686275, 1, 0, 1,
-0.6167397, -0.8155605, -3.28223, 0.3607843, 1, 0, 1,
-0.6152228, 0.2987095, -2.125602, 0.3568628, 1, 0, 1,
-0.6097305, 0.1300139, -0.169317, 0.3490196, 1, 0, 1,
-0.6090157, -0.02459209, -2.432792, 0.345098, 1, 0, 1,
-0.6088482, 1.723387, -0.3461795, 0.3372549, 1, 0, 1,
-0.6051853, -1.434114, -1.908317, 0.3333333, 1, 0, 1,
-0.6029553, -1.549546, -2.965003, 0.3254902, 1, 0, 1,
-0.6013016, 0.4621109, -1.620312, 0.3215686, 1, 0, 1,
-0.5993845, -0.4530618, -2.045449, 0.3137255, 1, 0, 1,
-0.5984951, 0.9153501, -0.8154404, 0.3098039, 1, 0, 1,
-0.5968291, 0.7021465, -0.654836, 0.3019608, 1, 0, 1,
-0.5908666, 0.1377077, -1.867628, 0.2941177, 1, 0, 1,
-0.5849321, 0.2536216, -1.159514, 0.2901961, 1, 0, 1,
-0.5833572, -0.3283592, -2.370601, 0.282353, 1, 0, 1,
-0.5788291, 1.104306, 0.5812055, 0.2784314, 1, 0, 1,
-0.5765865, 0.5161552, -2.449355, 0.2705882, 1, 0, 1,
-0.5762526, 0.3179598, 1.455721, 0.2666667, 1, 0, 1,
-0.5738367, 0.1825058, -1.288629, 0.2588235, 1, 0, 1,
-0.5713046, -0.7385702, -1.477348, 0.254902, 1, 0, 1,
-0.5658101, -0.3237002, -2.926723, 0.2470588, 1, 0, 1,
-0.5576926, -0.2348532, -1.432414, 0.2431373, 1, 0, 1,
-0.5478477, -0.209155, -1.858789, 0.2352941, 1, 0, 1,
-0.5476924, -0.004311853, -0.1226907, 0.2313726, 1, 0, 1,
-0.5441738, 0.7131243, -1.134717, 0.2235294, 1, 0, 1,
-0.5389196, 1.184153, -2.14473, 0.2196078, 1, 0, 1,
-0.538233, -0.7571231, -1.583305, 0.2117647, 1, 0, 1,
-0.5331116, -1.487352, -5.732575, 0.2078431, 1, 0, 1,
-0.5302042, 0.5126358, -1.955781, 0.2, 1, 0, 1,
-0.5248264, -0.8860669, -2.642876, 0.1921569, 1, 0, 1,
-0.5231335, -1.013612, -0.6143276, 0.1882353, 1, 0, 1,
-0.5202248, 2.256634, -0.2685303, 0.1803922, 1, 0, 1,
-0.5199489, 0.05905838, -1.757782, 0.1764706, 1, 0, 1,
-0.5164568, 0.104476, -1.528037, 0.1686275, 1, 0, 1,
-0.5135689, -0.2429321, -2.348199, 0.1647059, 1, 0, 1,
-0.5131493, -1.743512, -1.826203, 0.1568628, 1, 0, 1,
-0.5047257, 0.8886286, -0.3233747, 0.1529412, 1, 0, 1,
-0.5009527, 0.8122474, -1.399086, 0.145098, 1, 0, 1,
-0.4973854, 1.979143, 2.278876, 0.1411765, 1, 0, 1,
-0.4955945, -1.556799, -2.971382, 0.1333333, 1, 0, 1,
-0.4935493, -1.598323, -2.851529, 0.1294118, 1, 0, 1,
-0.4882515, 0.5314203, -0.1849435, 0.1215686, 1, 0, 1,
-0.4880979, -0.2349055, -3.486537, 0.1176471, 1, 0, 1,
-0.4714485, -1.106265, -3.67724, 0.1098039, 1, 0, 1,
-0.469821, -0.1430244, -0.3701242, 0.1058824, 1, 0, 1,
-0.4691522, -0.5237467, -2.262455, 0.09803922, 1, 0, 1,
-0.4664264, 0.2802985, -0.1983772, 0.09019608, 1, 0, 1,
-0.4632091, -0.7248799, -1.018395, 0.08627451, 1, 0, 1,
-0.4599576, 0.904965, 0.8632358, 0.07843138, 1, 0, 1,
-0.4592784, 0.9598961, -0.8523676, 0.07450981, 1, 0, 1,
-0.4592254, 0.8929915, -0.8270324, 0.06666667, 1, 0, 1,
-0.4573771, -0.1331012, -2.823446, 0.0627451, 1, 0, 1,
-0.4567926, 1.036715, 0.5264951, 0.05490196, 1, 0, 1,
-0.456341, 2.173095, -0.3378997, 0.05098039, 1, 0, 1,
-0.4522208, 0.5809459, -1.770508, 0.04313726, 1, 0, 1,
-0.4521105, 0.7350441, 0.0723363, 0.03921569, 1, 0, 1,
-0.4510908, 1.984826, 0.682156, 0.03137255, 1, 0, 1,
-0.4480006, -1.555406, 0.3708229, 0.02745098, 1, 0, 1,
-0.4388049, 0.1226664, -1.805932, 0.01960784, 1, 0, 1,
-0.4382713, -1.419662, -3.789076, 0.01568628, 1, 0, 1,
-0.4375694, -0.819258, -2.212713, 0.007843138, 1, 0, 1,
-0.4369282, -0.5918549, -1.733863, 0.003921569, 1, 0, 1,
-0.4308653, 0.4867206, 0.8010522, 0, 1, 0.003921569, 1,
-0.43033, 0.2946397, -1.174749, 0, 1, 0.01176471, 1,
-0.425447, 1.564329, 0.9004423, 0, 1, 0.01568628, 1,
-0.42058, -0.317054, -2.184391, 0, 1, 0.02352941, 1,
-0.4143997, -2.141862, -4.640063, 0, 1, 0.02745098, 1,
-0.4118989, -0.7533677, -2.905667, 0, 1, 0.03529412, 1,
-0.4088141, -0.03088006, -2.155614, 0, 1, 0.03921569, 1,
-0.4048104, 1.295967, -1.368727, 0, 1, 0.04705882, 1,
-0.4029932, -2.147083, -1.322312, 0, 1, 0.05098039, 1,
-0.4008041, -0.1104114, -2.063347, 0, 1, 0.05882353, 1,
-0.4004923, 0.1820804, 0.4337714, 0, 1, 0.0627451, 1,
-0.3961746, 0.444505, 0.5372038, 0, 1, 0.07058824, 1,
-0.3943503, 0.8250917, -2.15997, 0, 1, 0.07450981, 1,
-0.392138, 0.5747068, 1.163718, 0, 1, 0.08235294, 1,
-0.3915859, -0.2432105, -1.302896, 0, 1, 0.08627451, 1,
-0.389139, 0.5452647, -0.3106141, 0, 1, 0.09411765, 1,
-0.3875084, -1.054605, -1.726272, 0, 1, 0.1019608, 1,
-0.3856691, -0.6059507, -2.075751, 0, 1, 0.1058824, 1,
-0.3843319, 2.187167, 0.219459, 0, 1, 0.1137255, 1,
-0.3834321, 0.1001639, -2.621496, 0, 1, 0.1176471, 1,
-0.3827512, 0.8842033, -1.24939, 0, 1, 0.1254902, 1,
-0.3802784, -1.95849, -3.144031, 0, 1, 0.1294118, 1,
-0.3770027, -1.258068, -2.239111, 0, 1, 0.1372549, 1,
-0.3723451, 1.004737, -2.876065, 0, 1, 0.1411765, 1,
-0.3723386, 0.6188086, 0.07790346, 0, 1, 0.1490196, 1,
-0.3721256, -1.721499, -2.860346, 0, 1, 0.1529412, 1,
-0.3698085, -0.6217327, -1.776127, 0, 1, 0.1607843, 1,
-0.368942, 1.316618, -0.5588014, 0, 1, 0.1647059, 1,
-0.3686436, 1.097402, -0.9896739, 0, 1, 0.172549, 1,
-0.3646064, -0.2763219, -1.187968, 0, 1, 0.1764706, 1,
-0.3642783, -0.1707846, -2.207135, 0, 1, 0.1843137, 1,
-0.3612868, 1.46219, 0.1332434, 0, 1, 0.1882353, 1,
-0.3587035, 0.6027232, -0.6616618, 0, 1, 0.1960784, 1,
-0.3584692, -1.447369, -3.857787, 0, 1, 0.2039216, 1,
-0.3549581, 0.6506692, -1.392374, 0, 1, 0.2078431, 1,
-0.3539345, 0.8390941, 1.036772, 0, 1, 0.2156863, 1,
-0.3534026, 0.5176053, -0.987906, 0, 1, 0.2196078, 1,
-0.3525799, 1.170682, -1.550189, 0, 1, 0.227451, 1,
-0.3515792, -0.9065622, -2.758999, 0, 1, 0.2313726, 1,
-0.350462, 2.036221, 1.2552, 0, 1, 0.2392157, 1,
-0.3490051, 0.9371672, -1.239913, 0, 1, 0.2431373, 1,
-0.3457128, 2.011675, -0.9159327, 0, 1, 0.2509804, 1,
-0.3435614, 0.1754805, -0.1786769, 0, 1, 0.254902, 1,
-0.3404936, 0.7638587, -0.3115288, 0, 1, 0.2627451, 1,
-0.3355772, 1.420952, 1.346783, 0, 1, 0.2666667, 1,
-0.3199717, 0.3428353, -2.382033, 0, 1, 0.2745098, 1,
-0.3186239, -1.188551, -2.223584, 0, 1, 0.2784314, 1,
-0.3152362, 0.6877792, -1.265366, 0, 1, 0.2862745, 1,
-0.3102922, 0.6538919, -1.427863, 0, 1, 0.2901961, 1,
-0.3075732, -0.2527418, -1.281494, 0, 1, 0.2980392, 1,
-0.3073443, 0.01433767, -1.444872, 0, 1, 0.3058824, 1,
-0.3067591, -0.2342128, -2.184677, 0, 1, 0.3098039, 1,
-0.3051446, -0.7179706, -3.602388, 0, 1, 0.3176471, 1,
-0.3050572, 1.187325, -0.1714638, 0, 1, 0.3215686, 1,
-0.303794, 1.71958, 0.6925838, 0, 1, 0.3294118, 1,
-0.3018971, 0.6802921, -0.5259783, 0, 1, 0.3333333, 1,
-0.2972873, 0.06737532, 0.04404397, 0, 1, 0.3411765, 1,
-0.297251, 0.9042766, -1.407923, 0, 1, 0.345098, 1,
-0.2958731, 0.07100888, -1.227435, 0, 1, 0.3529412, 1,
-0.2941202, -0.2154319, -4.526528, 0, 1, 0.3568628, 1,
-0.2931218, 0.5511714, -0.1944747, 0, 1, 0.3647059, 1,
-0.2880727, -1.868542, -2.964962, 0, 1, 0.3686275, 1,
-0.2861624, 0.04436984, -1.773268, 0, 1, 0.3764706, 1,
-0.2846196, -0.06820224, -1.798312, 0, 1, 0.3803922, 1,
-0.2826614, -0.1322182, -1.424305, 0, 1, 0.3882353, 1,
-0.28153, 0.5277363, -0.9426453, 0, 1, 0.3921569, 1,
-0.2716625, -1.340499, -2.901793, 0, 1, 0.4, 1,
-0.2705356, -0.4821526, -5.682613, 0, 1, 0.4078431, 1,
-0.2694138, 0.7545014, -0.4191735, 0, 1, 0.4117647, 1,
-0.2652887, -0.3143292, -1.378349, 0, 1, 0.4196078, 1,
-0.2645251, 0.267776, -0.7189699, 0, 1, 0.4235294, 1,
-0.2636681, -1.677645, -1.706079, 0, 1, 0.4313726, 1,
-0.2615282, -1.036453, -2.965704, 0, 1, 0.4352941, 1,
-0.2594725, -1.262123, -3.934373, 0, 1, 0.4431373, 1,
-0.2546495, 0.4658566, -1.49246, 0, 1, 0.4470588, 1,
-0.2519928, 1.398359, -1.704926, 0, 1, 0.454902, 1,
-0.2482758, -0.5206122, -4.083607, 0, 1, 0.4588235, 1,
-0.2467177, 1.722881, -1.921389, 0, 1, 0.4666667, 1,
-0.2458004, -0.8227881, -1.300107, 0, 1, 0.4705882, 1,
-0.2447327, 0.1129213, -1.309518, 0, 1, 0.4784314, 1,
-0.2422171, 1.151843, -3.098966, 0, 1, 0.4823529, 1,
-0.2406131, 0.2769931, 1.29743, 0, 1, 0.4901961, 1,
-0.2369533, -1.164161, -2.810668, 0, 1, 0.4941176, 1,
-0.2352108, 0.1067545, -1.0122, 0, 1, 0.5019608, 1,
-0.2338651, -0.4039207, -2.344928, 0, 1, 0.509804, 1,
-0.2250368, 1.19867, 0.5150426, 0, 1, 0.5137255, 1,
-0.223643, 0.2176031, -0.1016886, 0, 1, 0.5215687, 1,
-0.2222937, 0.09716567, -0.8813977, 0, 1, 0.5254902, 1,
-0.2212359, -0.9439555, -4.655035, 0, 1, 0.5333334, 1,
-0.2210882, -1.133209, -2.331989, 0, 1, 0.5372549, 1,
-0.2146572, -0.1115673, -2.322491, 0, 1, 0.5450981, 1,
-0.2119113, 0.5627502, -0.9877153, 0, 1, 0.5490196, 1,
-0.2099412, -0.2714639, -2.368568, 0, 1, 0.5568628, 1,
-0.209786, -0.6095629, -0.9451502, 0, 1, 0.5607843, 1,
-0.2084664, 1.905853, -0.5170807, 0, 1, 0.5686275, 1,
-0.2051676, -2.412595, -2.105873, 0, 1, 0.572549, 1,
-0.2010073, 1.100923, -2.179976, 0, 1, 0.5803922, 1,
-0.1962999, -0.271885, -1.620836, 0, 1, 0.5843138, 1,
-0.191696, -1.018049, -2.711287, 0, 1, 0.5921569, 1,
-0.1878169, -1.579831, -2.750405, 0, 1, 0.5960785, 1,
-0.1855833, 0.4652454, -1.481655, 0, 1, 0.6039216, 1,
-0.1853297, 0.3545247, 0.08586133, 0, 1, 0.6117647, 1,
-0.1838656, 0.1591519, -0.554144, 0, 1, 0.6156863, 1,
-0.1820973, -0.3389411, -2.184901, 0, 1, 0.6235294, 1,
-0.1817385, 1.584149, 1.292225, 0, 1, 0.627451, 1,
-0.1782205, -0.6789745, -2.672211, 0, 1, 0.6352941, 1,
-0.1744595, -1.403105, -2.9817, 0, 1, 0.6392157, 1,
-0.1740465, 0.7340529, -1.038648, 0, 1, 0.6470588, 1,
-0.1716879, -0.115827, -2.743492, 0, 1, 0.6509804, 1,
-0.1699766, -1.529088, -3.56145, 0, 1, 0.6588235, 1,
-0.1681053, 0.5721295, -0.03575605, 0, 1, 0.6627451, 1,
-0.165672, 0.1011356, -0.568193, 0, 1, 0.6705883, 1,
-0.165666, -1.118898, -2.157635, 0, 1, 0.6745098, 1,
-0.1629202, -0.02140773, -1.454429, 0, 1, 0.682353, 1,
-0.1618396, -1.510223, -3.128873, 0, 1, 0.6862745, 1,
-0.1617911, 0.3571588, 0.2994874, 0, 1, 0.6941177, 1,
-0.1594364, 2.117789, 1.402164, 0, 1, 0.7019608, 1,
-0.1553878, -1.540655, -1.924025, 0, 1, 0.7058824, 1,
-0.1520869, 0.5884471, -0.738552, 0, 1, 0.7137255, 1,
-0.1516767, -0.4915729, -3.538209, 0, 1, 0.7176471, 1,
-0.1511543, -0.2775301, -1.114282, 0, 1, 0.7254902, 1,
-0.1460537, -0.7543579, -3.720784, 0, 1, 0.7294118, 1,
-0.1460332, -0.2078147, -3.921042, 0, 1, 0.7372549, 1,
-0.1445979, 0.6470827, -1.436805, 0, 1, 0.7411765, 1,
-0.1444339, 0.854941, -1.042274, 0, 1, 0.7490196, 1,
-0.143851, -1.323245, -4.069785, 0, 1, 0.7529412, 1,
-0.1435604, -0.8793131, -1.975015, 0, 1, 0.7607843, 1,
-0.1430672, -2.314852, -2.73081, 0, 1, 0.7647059, 1,
-0.1423159, 0.9991559, -0.3023565, 0, 1, 0.772549, 1,
-0.1393081, -0.01165102, -1.867118, 0, 1, 0.7764706, 1,
-0.1371225, -0.4457846, -3.697675, 0, 1, 0.7843137, 1,
-0.1359617, -0.6731969, -2.524833, 0, 1, 0.7882353, 1,
-0.1326834, -0.1012095, -3.188331, 0, 1, 0.7960784, 1,
-0.1325529, -1.255614, -4.409577, 0, 1, 0.8039216, 1,
-0.1294623, 0.06985409, -1.02046, 0, 1, 0.8078431, 1,
-0.1275021, -0.364597, -2.993371, 0, 1, 0.8156863, 1,
-0.1233457, -0.2854129, -2.38552, 0, 1, 0.8196079, 1,
-0.1194033, 0.2954667, -2.024974, 0, 1, 0.827451, 1,
-0.1143308, -0.8589793, -2.483946, 0, 1, 0.8313726, 1,
-0.1089576, 0.6211324, 0.7397947, 0, 1, 0.8392157, 1,
-0.09893005, -1.899444, -2.589032, 0, 1, 0.8431373, 1,
-0.0987478, -0.2240643, -1.45961, 0, 1, 0.8509804, 1,
-0.09853988, -0.8647624, -2.041938, 0, 1, 0.854902, 1,
-0.09809154, 2.446521, 0.3218573, 0, 1, 0.8627451, 1,
-0.0928333, 0.1643058, -0.8394232, 0, 1, 0.8666667, 1,
-0.091819, 1.263384, 0.9145164, 0, 1, 0.8745098, 1,
-0.09023496, 1.320984, 0.8566188, 0, 1, 0.8784314, 1,
-0.08723773, 1.863033, -0.1790899, 0, 1, 0.8862745, 1,
-0.08679705, 1.633123, -0.4740598, 0, 1, 0.8901961, 1,
-0.08644804, 0.9696571, -0.4256783, 0, 1, 0.8980392, 1,
-0.08442894, 0.9574077, -0.5679452, 0, 1, 0.9058824, 1,
-0.08388501, -0.6260028, -4.571634, 0, 1, 0.9098039, 1,
-0.08326803, -1.670843, -4.221822, 0, 1, 0.9176471, 1,
-0.08106624, -0.5920036, -3.844563, 0, 1, 0.9215686, 1,
-0.0810219, -1.230244, -3.207941, 0, 1, 0.9294118, 1,
-0.07973965, 0.4697011, -0.6446151, 0, 1, 0.9333333, 1,
-0.07805886, -0.8786468, -2.749095, 0, 1, 0.9411765, 1,
-0.07653657, 0.3172114, -1.183705, 0, 1, 0.945098, 1,
-0.07280794, -1.44259, -4.187052, 0, 1, 0.9529412, 1,
-0.07004776, -1.04982, -3.559087, 0, 1, 0.9568627, 1,
-0.0699775, 0.3362396, -0.7796745, 0, 1, 0.9647059, 1,
-0.06951368, 0.05232857, -1.518183, 0, 1, 0.9686275, 1,
-0.06942228, -0.03313255, -1.347629, 0, 1, 0.9764706, 1,
-0.06916012, -1.250663, -5.214755, 0, 1, 0.9803922, 1,
-0.06755818, -0.9368353, -5.627724, 0, 1, 0.9882353, 1,
-0.06656548, -0.09274767, -2.063746, 0, 1, 0.9921569, 1,
-0.06382453, -1.21805, -2.848246, 0, 1, 1, 1,
-0.0614687, -0.9743569, -2.001395, 0, 0.9921569, 1, 1,
-0.0611805, 0.1855931, -0.6898527, 0, 0.9882353, 1, 1,
-0.05634946, -0.7857177, -4.850836, 0, 0.9803922, 1, 1,
-0.05474309, 1.587037, -0.2497551, 0, 0.9764706, 1, 1,
-0.05426264, 1.084818, 1.625455, 0, 0.9686275, 1, 1,
-0.0539482, 0.1030795, 0.8151575, 0, 0.9647059, 1, 1,
-0.05345934, 0.3643257, -0.5600035, 0, 0.9568627, 1, 1,
-0.04927298, -0.1956054, -3.447243, 0, 0.9529412, 1, 1,
-0.04830737, 2.790503, 1.103231, 0, 0.945098, 1, 1,
-0.04177804, -1.203477, -3.354617, 0, 0.9411765, 1, 1,
-0.03855516, -0.7353573, -3.164403, 0, 0.9333333, 1, 1,
-0.03660161, 1.227206, -0.8346304, 0, 0.9294118, 1, 1,
-0.02899391, 0.3708666, 0.2683384, 0, 0.9215686, 1, 1,
-0.02832419, 0.01642176, 0.3303885, 0, 0.9176471, 1, 1,
-0.02269926, 0.4673342, 0.1749073, 0, 0.9098039, 1, 1,
-0.02004804, 0.8360174, -0.7164038, 0, 0.9058824, 1, 1,
-0.01951532, 1.587184, -0.3165, 0, 0.8980392, 1, 1,
-0.005628697, 2.63212, 0.1962924, 0, 0.8901961, 1, 1,
-0.002631126, 1.27024, -1.519809, 0, 0.8862745, 1, 1,
-0.000879874, 1.265616, 0.1968996, 0, 0.8784314, 1, 1,
0.0009659742, 0.213758, 0.05851999, 0, 0.8745098, 1, 1,
0.001791726, -1.777059, 2.284834, 0, 0.8666667, 1, 1,
0.001958904, -2.026295, 2.396077, 0, 0.8627451, 1, 1,
0.002902733, 0.3167805, 0.2116674, 0, 0.854902, 1, 1,
0.006034919, -0.9376463, 3.290245, 0, 0.8509804, 1, 1,
0.006493275, 0.9002829, -1.667858, 0, 0.8431373, 1, 1,
0.006520499, -0.2467665, 2.871142, 0, 0.8392157, 1, 1,
0.007666639, -0.4344321, 3.215428, 0, 0.8313726, 1, 1,
0.008091964, -0.9578308, 4.052326, 0, 0.827451, 1, 1,
0.009328093, -0.08856837, 4.658058, 0, 0.8196079, 1, 1,
0.01480328, 0.06405696, -0.09904687, 0, 0.8156863, 1, 1,
0.0149029, 0.1017473, -0.7601875, 0, 0.8078431, 1, 1,
0.01765141, 0.1358757, 1.354465, 0, 0.8039216, 1, 1,
0.02199065, 1.121842, 1.049162, 0, 0.7960784, 1, 1,
0.02217974, 0.5814174, 0.6238616, 0, 0.7882353, 1, 1,
0.02773676, -0.6966218, 1.226186, 0, 0.7843137, 1, 1,
0.03179527, -1.374879, 4.820157, 0, 0.7764706, 1, 1,
0.03193449, -0.4285529, 3.352285, 0, 0.772549, 1, 1,
0.03984028, 0.4726743, -0.1650122, 0, 0.7647059, 1, 1,
0.04079125, -0.4938127, 3.185436, 0, 0.7607843, 1, 1,
0.04698437, -0.1016953, 3.325998, 0, 0.7529412, 1, 1,
0.04827015, -0.3617435, 0.7647381, 0, 0.7490196, 1, 1,
0.04945722, -2.353477, 2.217387, 0, 0.7411765, 1, 1,
0.05212035, -1.423775, 4.571602, 0, 0.7372549, 1, 1,
0.05253462, -0.289891, 2.419538, 0, 0.7294118, 1, 1,
0.05331594, -0.6995682, 3.664314, 0, 0.7254902, 1, 1,
0.05388632, 0.1599454, 0.1190111, 0, 0.7176471, 1, 1,
0.0610569, 0.8320385, 1.127893, 0, 0.7137255, 1, 1,
0.06283163, -1.057916, 3.551321, 0, 0.7058824, 1, 1,
0.06391893, -0.275296, 2.614672, 0, 0.6980392, 1, 1,
0.06405868, 0.2873136, -0.7852229, 0, 0.6941177, 1, 1,
0.06518854, -0.8655414, 4.018936, 0, 0.6862745, 1, 1,
0.06645872, -0.7499884, 2.304224, 0, 0.682353, 1, 1,
0.06646959, -0.08817343, 1.800093, 0, 0.6745098, 1, 1,
0.06696068, -1.075793, 3.308461, 0, 0.6705883, 1, 1,
0.06781732, -1.469551, 2.651176, 0, 0.6627451, 1, 1,
0.0755576, 0.1679618, 0.5909451, 0, 0.6588235, 1, 1,
0.07559791, 0.3843124, 0.1625149, 0, 0.6509804, 1, 1,
0.08177594, -1.108164, 3.570393, 0, 0.6470588, 1, 1,
0.08232316, 0.7924839, -0.5740214, 0, 0.6392157, 1, 1,
0.09069195, -1.530301, 3.394901, 0, 0.6352941, 1, 1,
0.09137145, 0.1728211, 0.123852, 0, 0.627451, 1, 1,
0.09209524, -1.498673, 4.077948, 0, 0.6235294, 1, 1,
0.09866707, 1.329055, -0.2083187, 0, 0.6156863, 1, 1,
0.09881934, -0.575263, 4.400837, 0, 0.6117647, 1, 1,
0.1015801, -0.1634078, 0.5168369, 0, 0.6039216, 1, 1,
0.1035635, -1.42885, 2.66361, 0, 0.5960785, 1, 1,
0.1151634, -2.18626, 1.0896, 0, 0.5921569, 1, 1,
0.1191452, -0.06421199, 1.895123, 0, 0.5843138, 1, 1,
0.1217917, -0.6266542, 4.17223, 0, 0.5803922, 1, 1,
0.1310702, 0.9287893, 0.1380417, 0, 0.572549, 1, 1,
0.1417293, 1.971805, 1.563946, 0, 0.5686275, 1, 1,
0.1426332, 0.1692304, 2.823911, 0, 0.5607843, 1, 1,
0.1437479, 0.5834818, -1.266145, 0, 0.5568628, 1, 1,
0.1439118, 1.196695, -0.2132193, 0, 0.5490196, 1, 1,
0.1477787, 0.8585624, 0.2230414, 0, 0.5450981, 1, 1,
0.1479092, -0.5369731, 3.352385, 0, 0.5372549, 1, 1,
0.1557873, -1.462323, 2.108366, 0, 0.5333334, 1, 1,
0.1589336, -0.294536, 2.536853, 0, 0.5254902, 1, 1,
0.1594361, 1.205908, -0.6802981, 0, 0.5215687, 1, 1,
0.1611568, 0.5753665, 0.06420205, 0, 0.5137255, 1, 1,
0.1705202, -1.61052, -0.1043576, 0, 0.509804, 1, 1,
0.1734789, -0.4083416, 2.59453, 0, 0.5019608, 1, 1,
0.1745433, -1.243819, 3.560343, 0, 0.4941176, 1, 1,
0.1752891, -0.6809615, 4.507757, 0, 0.4901961, 1, 1,
0.1754798, -0.4559418, 1.796595, 0, 0.4823529, 1, 1,
0.1763947, -1.469947, 3.209364, 0, 0.4784314, 1, 1,
0.1786281, 0.2261872, 0.8053601, 0, 0.4705882, 1, 1,
0.1790518, 2.002281, 1.45954, 0, 0.4666667, 1, 1,
0.1884732, -1.398888, 3.754144, 0, 0.4588235, 1, 1,
0.1893503, -0.2126518, 0.9502354, 0, 0.454902, 1, 1,
0.1896869, 0.1054841, 0.3143625, 0, 0.4470588, 1, 1,
0.1898793, 1.64704, -0.9763681, 0, 0.4431373, 1, 1,
0.1909398, 0.9077235, 0.2689639, 0, 0.4352941, 1, 1,
0.1936471, -0.4997443, 1.427971, 0, 0.4313726, 1, 1,
0.1936895, -1.32813, 3.122265, 0, 0.4235294, 1, 1,
0.1938979, 0.6573168, 1.144867, 0, 0.4196078, 1, 1,
0.1950731, -0.627163, 3.259928, 0, 0.4117647, 1, 1,
0.1966818, 1.891228, 0.9500927, 0, 0.4078431, 1, 1,
0.2072718, -3.434855, 5.207181, 0, 0.4, 1, 1,
0.2073183, -0.8973622, 2.215671, 0, 0.3921569, 1, 1,
0.2090846, 1.608505, -0.6585608, 0, 0.3882353, 1, 1,
0.2247145, 0.8960362, -0.08145367, 0, 0.3803922, 1, 1,
0.2318236, -0.9679102, 2.296385, 0, 0.3764706, 1, 1,
0.2319203, -0.4991319, 0.9966891, 0, 0.3686275, 1, 1,
0.2344173, -0.8620066, 3.796138, 0, 0.3647059, 1, 1,
0.235054, -0.4002405, 3.270634, 0, 0.3568628, 1, 1,
0.2361664, -0.3852183, 3.234484, 0, 0.3529412, 1, 1,
0.2380765, -0.5683401, 2.710742, 0, 0.345098, 1, 1,
0.2385137, -1.986338, 3.520842, 0, 0.3411765, 1, 1,
0.2440403, -1.772927, 3.935224, 0, 0.3333333, 1, 1,
0.2449125, -1.167547, 2.075217, 0, 0.3294118, 1, 1,
0.2457519, 2.132828, 0.6099951, 0, 0.3215686, 1, 1,
0.2460119, 0.7467041, -1.685104, 0, 0.3176471, 1, 1,
0.2483837, 0.523832, 1.468371, 0, 0.3098039, 1, 1,
0.2501049, 0.2840381, 0.175386, 0, 0.3058824, 1, 1,
0.2504548, -2.017138, 2.022422, 0, 0.2980392, 1, 1,
0.2514725, -1.366017, 2.373504, 0, 0.2901961, 1, 1,
0.2515056, -0.9703477, 1.981698, 0, 0.2862745, 1, 1,
0.2556073, 0.6079039, 1.73945, 0, 0.2784314, 1, 1,
0.2567383, -0.7561937, 1.943928, 0, 0.2745098, 1, 1,
0.2567682, -1.106434, 2.208971, 0, 0.2666667, 1, 1,
0.2586208, -1.319548, 3.266239, 0, 0.2627451, 1, 1,
0.2678584, -1.037457, 3.806916, 0, 0.254902, 1, 1,
0.2703954, 1.070229, 2.197883, 0, 0.2509804, 1, 1,
0.2728159, 0.8815145, 0.9794071, 0, 0.2431373, 1, 1,
0.2748792, -0.520798, 2.16897, 0, 0.2392157, 1, 1,
0.2757306, 0.4796833, 0.2440805, 0, 0.2313726, 1, 1,
0.2795307, 0.5318849, 1.509947, 0, 0.227451, 1, 1,
0.2965986, 1.18956, -0.1668357, 0, 0.2196078, 1, 1,
0.2971661, 1.182145, -1.537011, 0, 0.2156863, 1, 1,
0.2993329, -1.504582, 2.701809, 0, 0.2078431, 1, 1,
0.2995525, -1.698006, 0.9509249, 0, 0.2039216, 1, 1,
0.300092, -0.03458678, 0.8315338, 0, 0.1960784, 1, 1,
0.3002456, -1.495811, 3.754648, 0, 0.1882353, 1, 1,
0.3045455, -0.7241709, 1.898037, 0, 0.1843137, 1, 1,
0.3073637, -0.4653973, 0.6281319, 0, 0.1764706, 1, 1,
0.3077495, -1.270842, 2.220022, 0, 0.172549, 1, 1,
0.3083696, 0.6495797, 1.169577, 0, 0.1647059, 1, 1,
0.3106559, 1.373779, -0.889768, 0, 0.1607843, 1, 1,
0.3134563, -0.3157835, 2.694664, 0, 0.1529412, 1, 1,
0.3186588, 0.5445196, -0.1024622, 0, 0.1490196, 1, 1,
0.3203427, -0.1783655, 3.224199, 0, 0.1411765, 1, 1,
0.3221934, 0.5741773, -0.7758195, 0, 0.1372549, 1, 1,
0.3257229, 0.5267128, 0.364856, 0, 0.1294118, 1, 1,
0.3258081, -0.2108015, 3.367157, 0, 0.1254902, 1, 1,
0.3344977, 0.1840617, -0.02077318, 0, 0.1176471, 1, 1,
0.3399686, 0.3688821, 1.645001, 0, 0.1137255, 1, 1,
0.3407401, 1.619096, -0.6889999, 0, 0.1058824, 1, 1,
0.3432471, 0.8840689, 1.516841, 0, 0.09803922, 1, 1,
0.3454327, -0.2935432, 3.151162, 0, 0.09411765, 1, 1,
0.3459977, -3.030108, 4.677606, 0, 0.08627451, 1, 1,
0.3460252, -1.042818, 2.276369, 0, 0.08235294, 1, 1,
0.3555669, -0.3743473, 0.9445205, 0, 0.07450981, 1, 1,
0.3566809, -0.1862135, 2.440264, 0, 0.07058824, 1, 1,
0.3666579, -0.5194154, 2.637188, 0, 0.0627451, 1, 1,
0.3681078, 1.32971, 0.2275789, 0, 0.05882353, 1, 1,
0.3687084, -1.065331, 3.019583, 0, 0.05098039, 1, 1,
0.374741, -0.1045337, 1.345792, 0, 0.04705882, 1, 1,
0.378783, 0.9597542, -0.7120762, 0, 0.03921569, 1, 1,
0.3790946, 1.049852, 1.10883, 0, 0.03529412, 1, 1,
0.3805581, -1.146605, 2.115392, 0, 0.02745098, 1, 1,
0.3842454, -0.185997, 2.810167, 0, 0.02352941, 1, 1,
0.3897542, 0.8265699, -0.5408822, 0, 0.01568628, 1, 1,
0.3917588, -1.634962, 2.738258, 0, 0.01176471, 1, 1,
0.3957662, 0.3998426, 2.226229, 0, 0.003921569, 1, 1,
0.3985663, -0.2180083, 1.695275, 0.003921569, 0, 1, 1,
0.4029791, 0.331462, -0.1085785, 0.007843138, 0, 1, 1,
0.4046095, -0.8956193, 3.686034, 0.01568628, 0, 1, 1,
0.4053298, -0.5987775, 3.859038, 0.01960784, 0, 1, 1,
0.4055308, -0.2223795, 1.791363, 0.02745098, 0, 1, 1,
0.4080648, -0.09440383, 1.230987, 0.03137255, 0, 1, 1,
0.4126085, -0.306717, 2.363246, 0.03921569, 0, 1, 1,
0.4197991, -1.829053, 2.830756, 0.04313726, 0, 1, 1,
0.419889, 0.2780911, -0.473379, 0.05098039, 0, 1, 1,
0.420013, 0.6720533, -0.7641593, 0.05490196, 0, 1, 1,
0.4285068, 0.9462818, 1.695838, 0.0627451, 0, 1, 1,
0.4297658, 0.7886608, 0.7644037, 0.06666667, 0, 1, 1,
0.4328406, -0.5250317, 3.842673, 0.07450981, 0, 1, 1,
0.4357787, 0.9980859, 0.2642985, 0.07843138, 0, 1, 1,
0.4412106, -1.576654, 4.944455, 0.08627451, 0, 1, 1,
0.4441626, -0.2829696, 4.078246, 0.09019608, 0, 1, 1,
0.4463138, -0.2921643, 2.717307, 0.09803922, 0, 1, 1,
0.4472957, 1.210579, -0.5723772, 0.1058824, 0, 1, 1,
0.456459, -1.241761, 4.407092, 0.1098039, 0, 1, 1,
0.4585216, 1.228513, 0.4194084, 0.1176471, 0, 1, 1,
0.4589635, 0.1450524, 1.664479, 0.1215686, 0, 1, 1,
0.4681609, 1.38225, 1.526865, 0.1294118, 0, 1, 1,
0.468578, -0.2973712, 1.990354, 0.1333333, 0, 1, 1,
0.4693169, -0.08609277, 3.300785, 0.1411765, 0, 1, 1,
0.4734896, -0.2100879, -0.1149181, 0.145098, 0, 1, 1,
0.4752725, 1.037621, 1.662126, 0.1529412, 0, 1, 1,
0.4798593, -1.600393, 4.419767, 0.1568628, 0, 1, 1,
0.4799532, 1.679693, 0.3649607, 0.1647059, 0, 1, 1,
0.4803247, 0.9806792, 1.372488, 0.1686275, 0, 1, 1,
0.4861541, -0.005112606, 3.828523, 0.1764706, 0, 1, 1,
0.486484, 0.01872927, 2.184024, 0.1803922, 0, 1, 1,
0.4873812, -1.534304, 3.202132, 0.1882353, 0, 1, 1,
0.4917272, -0.3729479, 3.130706, 0.1921569, 0, 1, 1,
0.4924033, 0.1920855, 1.678926, 0.2, 0, 1, 1,
0.493748, 0.9184969, 0.4184243, 0.2078431, 0, 1, 1,
0.5008295, 1.224991, 0.7480932, 0.2117647, 0, 1, 1,
0.509569, 0.5450121, 0.7002156, 0.2196078, 0, 1, 1,
0.5100266, -0.1350639, 1.874623, 0.2235294, 0, 1, 1,
0.5125978, 0.6193089, -0.4734874, 0.2313726, 0, 1, 1,
0.5157023, 0.3214804, 0.1121815, 0.2352941, 0, 1, 1,
0.5203652, 1.610624, -0.6588039, 0.2431373, 0, 1, 1,
0.5220391, -1.141122, 2.042241, 0.2470588, 0, 1, 1,
0.5220487, 0.4088992, -0.8578165, 0.254902, 0, 1, 1,
0.5248709, -1.804241, 2.410912, 0.2588235, 0, 1, 1,
0.5250226, 0.2787051, 0.2191585, 0.2666667, 0, 1, 1,
0.5269377, -0.001196076, 0.3384822, 0.2705882, 0, 1, 1,
0.5298986, 0.8687611, 3.112611, 0.2784314, 0, 1, 1,
0.5325797, 0.3816494, 1.604176, 0.282353, 0, 1, 1,
0.5348056, -0.3871599, 3.210978, 0.2901961, 0, 1, 1,
0.5403356, -0.7508939, 1.67686, 0.2941177, 0, 1, 1,
0.546597, -0.6876423, 3.205978, 0.3019608, 0, 1, 1,
0.5475058, 0.7651604, 0.5680029, 0.3098039, 0, 1, 1,
0.5480719, -1.018878, 1.965215, 0.3137255, 0, 1, 1,
0.5550991, 0.2987309, 0.5982135, 0.3215686, 0, 1, 1,
0.5582408, 0.634227, 0.1626854, 0.3254902, 0, 1, 1,
0.5587266, -1.290233, 3.655871, 0.3333333, 0, 1, 1,
0.5642946, -1.092628, 1.358872, 0.3372549, 0, 1, 1,
0.5650983, 1.098749, 0.3635683, 0.345098, 0, 1, 1,
0.569833, -0.05195101, 1.742968, 0.3490196, 0, 1, 1,
0.570823, 0.2948656, 1.744144, 0.3568628, 0, 1, 1,
0.5715638, -0.04607841, 2.228708, 0.3607843, 0, 1, 1,
0.5759382, 0.2565192, 0.9781684, 0.3686275, 0, 1, 1,
0.5773861, 0.3110179, 1.010143, 0.372549, 0, 1, 1,
0.5786363, 1.046418, 1.413162, 0.3803922, 0, 1, 1,
0.5789498, -0.5993535, 2.486435, 0.3843137, 0, 1, 1,
0.5811259, -0.4163154, 3.008577, 0.3921569, 0, 1, 1,
0.5814012, 0.06100583, 1.336539, 0.3960784, 0, 1, 1,
0.5824322, 0.1517249, 1.922892, 0.4039216, 0, 1, 1,
0.5861925, 0.2518609, 1.546498, 0.4117647, 0, 1, 1,
0.5876395, -0.2064289, 1.352362, 0.4156863, 0, 1, 1,
0.5903221, -0.2707612, 0.3295877, 0.4235294, 0, 1, 1,
0.5930919, -0.519066, 1.418845, 0.427451, 0, 1, 1,
0.6063749, 0.258462, 2.092975, 0.4352941, 0, 1, 1,
0.6079254, -1.057768, 1.436696, 0.4392157, 0, 1, 1,
0.6086347, -1.172063, 2.108865, 0.4470588, 0, 1, 1,
0.6120512, 1.020251, 0.9611759, 0.4509804, 0, 1, 1,
0.6125339, 1.346579, 1.272861, 0.4588235, 0, 1, 1,
0.6158348, -0.04307557, 2.188126, 0.4627451, 0, 1, 1,
0.6191249, -1.020668, 2.755059, 0.4705882, 0, 1, 1,
0.6271774, -0.2388349, 1.715844, 0.4745098, 0, 1, 1,
0.62964, 0.003225616, 1.29068, 0.4823529, 0, 1, 1,
0.6301792, 0.9367465, -0.5943387, 0.4862745, 0, 1, 1,
0.632012, 1.821657, 0.2066159, 0.4941176, 0, 1, 1,
0.6338428, -1.594813, 4.050639, 0.5019608, 0, 1, 1,
0.6414962, 0.7642266, 0.8708019, 0.5058824, 0, 1, 1,
0.6434822, -0.2740242, 3.33619, 0.5137255, 0, 1, 1,
0.6454713, 0.4606937, 1.004879, 0.5176471, 0, 1, 1,
0.6469339, 0.09485842, 2.796134, 0.5254902, 0, 1, 1,
0.651644, 0.7455838, 0.2098534, 0.5294118, 0, 1, 1,
0.6543867, -0.9921504, 2.633409, 0.5372549, 0, 1, 1,
0.654875, 0.4012675, -0.01704556, 0.5411765, 0, 1, 1,
0.6610376, -0.2066592, 1.100956, 0.5490196, 0, 1, 1,
0.6625106, -2.031314, 1.938942, 0.5529412, 0, 1, 1,
0.6630083, 0.9865349, 0.5538816, 0.5607843, 0, 1, 1,
0.6667338, -1.311162, 0.9784262, 0.5647059, 0, 1, 1,
0.6821371, 0.9256671, 0.417729, 0.572549, 0, 1, 1,
0.6842175, -1.080515, 1.536145, 0.5764706, 0, 1, 1,
0.6885976, -1.463372, 5.575782, 0.5843138, 0, 1, 1,
0.6939076, 1.303039, 1.594293, 0.5882353, 0, 1, 1,
0.6996278, -0.9128938, 3.305915, 0.5960785, 0, 1, 1,
0.7055909, -1.073446, 2.692231, 0.6039216, 0, 1, 1,
0.708153, -1.754679, 3.615737, 0.6078432, 0, 1, 1,
0.7121689, 0.4275669, 1.014235, 0.6156863, 0, 1, 1,
0.7138084, -0.7718822, 2.661349, 0.6196079, 0, 1, 1,
0.7181422, -0.2751937, 1.511884, 0.627451, 0, 1, 1,
0.7224822, -1.039451, 1.790885, 0.6313726, 0, 1, 1,
0.7252089, 0.6177272, 0.7495223, 0.6392157, 0, 1, 1,
0.7350826, 0.01308058, 1.05871, 0.6431373, 0, 1, 1,
0.7357892, -0.6475933, 3.109828, 0.6509804, 0, 1, 1,
0.737401, -0.6906982, 2.110843, 0.654902, 0, 1, 1,
0.7475697, 0.2720462, 0.6901026, 0.6627451, 0, 1, 1,
0.7510315, 0.3607822, 1.373624, 0.6666667, 0, 1, 1,
0.7511913, -0.9120157, 3.034765, 0.6745098, 0, 1, 1,
0.7517645, -0.4969055, 3.653037, 0.6784314, 0, 1, 1,
0.7663471, -0.1890092, 2.626923, 0.6862745, 0, 1, 1,
0.7894657, -1.052139, 2.049258, 0.6901961, 0, 1, 1,
0.7917184, -1.587242, 2.738246, 0.6980392, 0, 1, 1,
0.7926133, -0.3369971, 1.098433, 0.7058824, 0, 1, 1,
0.8020958, -1.2234, 4.136948, 0.7098039, 0, 1, 1,
0.8070867, -0.5044326, 1.939894, 0.7176471, 0, 1, 1,
0.8118626, -0.1014129, 1.750556, 0.7215686, 0, 1, 1,
0.8145384, 0.2584561, 0.3122058, 0.7294118, 0, 1, 1,
0.8178389, 0.2669058, 0.06554521, 0.7333333, 0, 1, 1,
0.8215188, 0.35974, 0.6637496, 0.7411765, 0, 1, 1,
0.8238141, 0.1125259, 0.4455082, 0.7450981, 0, 1, 1,
0.8313365, -0.8584276, 3.188848, 0.7529412, 0, 1, 1,
0.8359726, 0.4383804, 2.712602, 0.7568628, 0, 1, 1,
0.8397289, -0.2518576, 2.646572, 0.7647059, 0, 1, 1,
0.8420007, -0.5857694, 3.536674, 0.7686275, 0, 1, 1,
0.8431895, -0.08678471, 1.915164, 0.7764706, 0, 1, 1,
0.8445322, -0.6626089, 4.255901, 0.7803922, 0, 1, 1,
0.8448438, 0.1889939, 0.2458787, 0.7882353, 0, 1, 1,
0.8456182, 1.555053, -0.1829206, 0.7921569, 0, 1, 1,
0.8475558, -0.8956335, 2.73592, 0.8, 0, 1, 1,
0.8536798, 1.050092, 0.693103, 0.8078431, 0, 1, 1,
0.8549216, 0.01179772, 2.128652, 0.8117647, 0, 1, 1,
0.8581974, 0.716809, -0.7102204, 0.8196079, 0, 1, 1,
0.8614612, 0.3211654, 1.832742, 0.8235294, 0, 1, 1,
0.8677245, -2.273106, 3.635727, 0.8313726, 0, 1, 1,
0.8775096, 1.74542, -0.1775107, 0.8352941, 0, 1, 1,
0.8890401, -0.1972772, 1.31438, 0.8431373, 0, 1, 1,
0.8907621, 0.6108336, -2.327396, 0.8470588, 0, 1, 1,
0.891695, 1.153389, 3.947182, 0.854902, 0, 1, 1,
0.8972986, -0.5521089, 2.726467, 0.8588235, 0, 1, 1,
0.9001523, 0.3586138, 1.611287, 0.8666667, 0, 1, 1,
0.9015802, -0.406939, 0.7625872, 0.8705882, 0, 1, 1,
0.9037789, -1.742862, 4.209986, 0.8784314, 0, 1, 1,
0.9061881, 0.04232152, 1.723458, 0.8823529, 0, 1, 1,
0.9071837, 1.37177, 0.4887854, 0.8901961, 0, 1, 1,
0.9089458, -1.830456, 2.488004, 0.8941177, 0, 1, 1,
0.913875, -1.214039, 2.821042, 0.9019608, 0, 1, 1,
0.9211106, -0.4428569, 1.962226, 0.9098039, 0, 1, 1,
0.9231161, 0.5651166, 1.118516, 0.9137255, 0, 1, 1,
0.9232038, -1.812332, 2.547955, 0.9215686, 0, 1, 1,
0.9235535, -2.744576, 1.047371, 0.9254902, 0, 1, 1,
0.9260002, -0.5749938, 3.446132, 0.9333333, 0, 1, 1,
0.9329439, 0.3959805, -0.4808581, 0.9372549, 0, 1, 1,
0.9387028, -0.4284302, 3.321783, 0.945098, 0, 1, 1,
0.9452515, 0.06311233, 1.650631, 0.9490196, 0, 1, 1,
0.948948, -1.148582, 1.610335, 0.9568627, 0, 1, 1,
0.9586533, -0.6713871, 2.34748, 0.9607843, 0, 1, 1,
0.9741277, -0.984647, 1.79895, 0.9686275, 0, 1, 1,
0.9760969, 0.6563404, 0.6132892, 0.972549, 0, 1, 1,
0.983114, 0.006496902, 1.055946, 0.9803922, 0, 1, 1,
0.9854566, -1.17421, 2.531724, 0.9843137, 0, 1, 1,
0.99313, 0.2888328, 0.615825, 0.9921569, 0, 1, 1,
0.9934373, 1.123811, 0.07181665, 0.9960784, 0, 1, 1,
0.9974278, 0.173701, -0.3227267, 1, 0, 0.9960784, 1,
0.9976476, 2.70647, -0.8034663, 1, 0, 0.9882353, 1,
1.008031, -0.9694797, 0.7828366, 1, 0, 0.9843137, 1,
1.008261, -1.176984, 0.3924416, 1, 0, 0.9764706, 1,
1.012817, 0.1990748, 0.2326473, 1, 0, 0.972549, 1,
1.016131, 1.330421, 3.408299, 1, 0, 0.9647059, 1,
1.016745, 0.1609067, 1.672372, 1, 0, 0.9607843, 1,
1.016897, 0.8579262, 1.360495, 1, 0, 0.9529412, 1,
1.017233, 0.4464144, 0.841359, 1, 0, 0.9490196, 1,
1.017558, 1.109046, 0.6129622, 1, 0, 0.9411765, 1,
1.017767, -0.1043449, 2.890856, 1, 0, 0.9372549, 1,
1.020878, 0.7945461, 1.807336, 1, 0, 0.9294118, 1,
1.02739, -1.389138, 2.911319, 1, 0, 0.9254902, 1,
1.029268, -0.2493188, 2.643977, 1, 0, 0.9176471, 1,
1.032857, -1.530869, 3.258116, 1, 0, 0.9137255, 1,
1.033974, 0.4396077, 2.326542, 1, 0, 0.9058824, 1,
1.044683, -0.5062802, 1.978934, 1, 0, 0.9019608, 1,
1.059342, 0.3772464, 0.2796125, 1, 0, 0.8941177, 1,
1.060432, -0.6709389, 0.9679932, 1, 0, 0.8862745, 1,
1.074854, -0.002093652, 2.329159, 1, 0, 0.8823529, 1,
1.07712, -0.4290696, 2.871831, 1, 0, 0.8745098, 1,
1.081088, -1.90425, 2.150176, 1, 0, 0.8705882, 1,
1.082887, 1.628313, 0.1386016, 1, 0, 0.8627451, 1,
1.086832, -0.3202569, 2.339092, 1, 0, 0.8588235, 1,
1.088766, -2.51866, 2.243068, 1, 0, 0.8509804, 1,
1.094836, -2.022391, 3.849937, 1, 0, 0.8470588, 1,
1.097057, -1.723985, 1.814564, 1, 0, 0.8392157, 1,
1.100958, -0.1668621, 1.014918, 1, 0, 0.8352941, 1,
1.105211, -1.718851, 2.020772, 1, 0, 0.827451, 1,
1.109745, 0.7974303, 1.091178, 1, 0, 0.8235294, 1,
1.110459, -2.323733, 1.313279, 1, 0, 0.8156863, 1,
1.117607, 1.196522, 0.8559089, 1, 0, 0.8117647, 1,
1.119731, -0.1196863, 1.975305, 1, 0, 0.8039216, 1,
1.124977, 1.69878, 0.4471949, 1, 0, 0.7960784, 1,
1.125132, 1.103198, -1.569212, 1, 0, 0.7921569, 1,
1.136501, -0.2001582, 0.9525985, 1, 0, 0.7843137, 1,
1.145514, 1.495167, 2.280044, 1, 0, 0.7803922, 1,
1.148393, 0.613741, 0.3734654, 1, 0, 0.772549, 1,
1.151397, 0.516102, 0.5226697, 1, 0, 0.7686275, 1,
1.15263, 0.4156078, 2.23069, 1, 0, 0.7607843, 1,
1.154153, -1.20812, 1.770759, 1, 0, 0.7568628, 1,
1.154584, 1.168176, 1.648563, 1, 0, 0.7490196, 1,
1.168977, -0.7644296, 1.744094, 1, 0, 0.7450981, 1,
1.171495, -1.974557, 2.187361, 1, 0, 0.7372549, 1,
1.173836, 0.742399, 1.444916, 1, 0, 0.7333333, 1,
1.180353, -1.615771, 2.838996, 1, 0, 0.7254902, 1,
1.188617, -0.5751117, 2.851656, 1, 0, 0.7215686, 1,
1.195333, 0.4390993, 1.499763, 1, 0, 0.7137255, 1,
1.197286, 0.5517642, 2.146765, 1, 0, 0.7098039, 1,
1.215969, -1.24749, 1.236245, 1, 0, 0.7019608, 1,
1.219373, -1.003586, 1.74793, 1, 0, 0.6941177, 1,
1.219649, 1.019806, 0.2003777, 1, 0, 0.6901961, 1,
1.221023, 1.294128, -0.7991984, 1, 0, 0.682353, 1,
1.234769, -1.215391, 3.635123, 1, 0, 0.6784314, 1,
1.239835, 0.513441, 2.94098, 1, 0, 0.6705883, 1,
1.239983, -0.1023453, 0.5273979, 1, 0, 0.6666667, 1,
1.246522, -0.6832595, 2.26573, 1, 0, 0.6588235, 1,
1.248415, 0.4367705, 1.20155, 1, 0, 0.654902, 1,
1.252258, -0.02367831, 0.8305696, 1, 0, 0.6470588, 1,
1.255002, 1.049088, 1.085704, 1, 0, 0.6431373, 1,
1.262442, 0.1918477, 2.885582, 1, 0, 0.6352941, 1,
1.280164, 0.4386104, 0.8520399, 1, 0, 0.6313726, 1,
1.282075, 0.3784997, 0.1240951, 1, 0, 0.6235294, 1,
1.286754, 1.971696, -1.231584, 1, 0, 0.6196079, 1,
1.301822, -0.85434, 1.815254, 1, 0, 0.6117647, 1,
1.306581, -0.5707522, 2.142519, 1, 0, 0.6078432, 1,
1.323328, 1.084635, 0.2197867, 1, 0, 0.6, 1,
1.331536, -0.6548875, -0.7211553, 1, 0, 0.5921569, 1,
1.346582, 0.9408001, 1.185785, 1, 0, 0.5882353, 1,
1.360094, 0.476055, 1.079972, 1, 0, 0.5803922, 1,
1.403237, -0.3122291, 1.947624, 1, 0, 0.5764706, 1,
1.406993, 0.8783666, 1.590917, 1, 0, 0.5686275, 1,
1.407993, 0.2834882, 0.7627876, 1, 0, 0.5647059, 1,
1.409587, 0.5239368, 0.9797024, 1, 0, 0.5568628, 1,
1.41277, 0.3751131, 1.397385, 1, 0, 0.5529412, 1,
1.417633, -2.195067, 3.609146, 1, 0, 0.5450981, 1,
1.431297, 0.1693702, 1.238844, 1, 0, 0.5411765, 1,
1.438722, -0.7073979, 2.711512, 1, 0, 0.5333334, 1,
1.440348, 0.3560639, 1.020595, 1, 0, 0.5294118, 1,
1.442099, 1.306869, 0.9571632, 1, 0, 0.5215687, 1,
1.442264, -0.2063807, 0.667821, 1, 0, 0.5176471, 1,
1.446893, 1.516454, 0.9325346, 1, 0, 0.509804, 1,
1.461955, 0.7810891, 0.6626326, 1, 0, 0.5058824, 1,
1.468682, 0.2838957, 0.8408885, 1, 0, 0.4980392, 1,
1.470238, -0.6355584, 0.4755692, 1, 0, 0.4901961, 1,
1.50492, -1.122391, 2.632246, 1, 0, 0.4862745, 1,
1.516455, -1.162975, 2.889361, 1, 0, 0.4784314, 1,
1.518462, 0.1505199, 1.154952, 1, 0, 0.4745098, 1,
1.521214, -1.447901, 2.844492, 1, 0, 0.4666667, 1,
1.524019, 0.03900062, 2.185712, 1, 0, 0.4627451, 1,
1.559803, 0.5287062, -0.2175389, 1, 0, 0.454902, 1,
1.561917, -0.8886157, 1.122597, 1, 0, 0.4509804, 1,
1.578384, 0.3202576, -1.308702, 1, 0, 0.4431373, 1,
1.584455, -0.1405918, 2.243412, 1, 0, 0.4392157, 1,
1.59734, -1.568472, 2.864537, 1, 0, 0.4313726, 1,
1.603747, -0.7898367, 3.031905, 1, 0, 0.427451, 1,
1.610683, 1.611125, 0.3079774, 1, 0, 0.4196078, 1,
1.61508, -1.164143, 2.69377, 1, 0, 0.4156863, 1,
1.62148, 0.6250781, 1.200556, 1, 0, 0.4078431, 1,
1.634471, 0.3715559, 0.9009653, 1, 0, 0.4039216, 1,
1.634683, -1.179501, 2.873432, 1, 0, 0.3960784, 1,
1.638556, 1.2919, 1.264647, 1, 0, 0.3882353, 1,
1.646456, -0.03108124, 0.7910284, 1, 0, 0.3843137, 1,
1.647726, 2.772453, 1.280316, 1, 0, 0.3764706, 1,
1.650115, -0.1946006, -0.3493165, 1, 0, 0.372549, 1,
1.659281, 0.07508519, 2.429602, 1, 0, 0.3647059, 1,
1.678542, -0.5224581, 0.8986584, 1, 0, 0.3607843, 1,
1.678954, 0.8198583, 0.5696102, 1, 0, 0.3529412, 1,
1.686539, -1.889603, 1.935841, 1, 0, 0.3490196, 1,
1.691888, -0.7779999, 3.17466, 1, 0, 0.3411765, 1,
1.703985, -0.6926367, 3.54615, 1, 0, 0.3372549, 1,
1.703997, -0.784051, 3.089501, 1, 0, 0.3294118, 1,
1.705654, -0.3450673, 1.977124, 1, 0, 0.3254902, 1,
1.71012, 0.8641269, 1.678339, 1, 0, 0.3176471, 1,
1.71138, -1.539437, 2.551248, 1, 0, 0.3137255, 1,
1.730074, 0.4255519, 0.7683752, 1, 0, 0.3058824, 1,
1.750162, 0.5171383, 1.737731, 1, 0, 0.2980392, 1,
1.75812, 0.6280971, 2.033684, 1, 0, 0.2941177, 1,
1.758323, 0.6080763, 1.13887, 1, 0, 0.2862745, 1,
1.760947, 1.419056, 0.9859241, 1, 0, 0.282353, 1,
1.771379, 0.2651907, 0.5459021, 1, 0, 0.2745098, 1,
1.811066, -0.1851492, 0.9392341, 1, 0, 0.2705882, 1,
1.816466, -0.4454722, 3.551099, 1, 0, 0.2627451, 1,
1.819084, -0.6413044, 3.198583, 1, 0, 0.2588235, 1,
1.824203, 0.07123663, 2.04022, 1, 0, 0.2509804, 1,
1.835202, -1.418901, 1.86519, 1, 0, 0.2470588, 1,
1.839424, -0.6527416, 0.7494289, 1, 0, 0.2392157, 1,
1.846652, 1.422661, 1.096393, 1, 0, 0.2352941, 1,
1.852237, -0.8323379, 1.56102, 1, 0, 0.227451, 1,
1.883217, -0.5039678, 1.984413, 1, 0, 0.2235294, 1,
1.886377, 0.3885656, 1.804701, 1, 0, 0.2156863, 1,
1.904178, -0.230834, 1.810936, 1, 0, 0.2117647, 1,
1.909045, 1.014433, 0.4201803, 1, 0, 0.2039216, 1,
1.921443, 0.1797854, 0.1511182, 1, 0, 0.1960784, 1,
1.92727, 0.224307, 1.313511, 1, 0, 0.1921569, 1,
1.928936, 2.159262, 1.037057, 1, 0, 0.1843137, 1,
1.939912, 1.263372, 1.996476, 1, 0, 0.1803922, 1,
1.945725, 1.054798, 3.35813, 1, 0, 0.172549, 1,
1.96445, 0.8612145, 0.9093927, 1, 0, 0.1686275, 1,
1.964802, -0.4675926, 2.823841, 1, 0, 0.1607843, 1,
2.000969, 0.5588694, 2.374062, 1, 0, 0.1568628, 1,
2.001791, 1.977388, -0.9488733, 1, 0, 0.1490196, 1,
2.014041, -1.081963, 2.298834, 1, 0, 0.145098, 1,
2.032461, 0.4575292, 1.607087, 1, 0, 0.1372549, 1,
2.037287, -0.0920319, 0.8740026, 1, 0, 0.1333333, 1,
2.074836, -1.302656, 1.964434, 1, 0, 0.1254902, 1,
2.096399, -0.554754, 1.578953, 1, 0, 0.1215686, 1,
2.097507, -0.08670877, 1.616929, 1, 0, 0.1137255, 1,
2.108473, -0.5351875, 1.473507, 1, 0, 0.1098039, 1,
2.134845, -0.4423131, 1.948677, 1, 0, 0.1019608, 1,
2.189347, -0.5727075, 1.19539, 1, 0, 0.09411765, 1,
2.219146, 0.6102986, 1.908314, 1, 0, 0.09019608, 1,
2.307967, 0.3478386, 3.934401, 1, 0, 0.08235294, 1,
2.352007, -0.8137653, 1.883826, 1, 0, 0.07843138, 1,
2.376863, 1.038175, 1.164768, 1, 0, 0.07058824, 1,
2.379673, -1.151107, 1.734179, 1, 0, 0.06666667, 1,
2.454833, 0.08219951, 1.331915, 1, 0, 0.05882353, 1,
2.479425, 1.187036, 2.402362, 1, 0, 0.05490196, 1,
2.594954, -0.839874, 1.394707, 1, 0, 0.04705882, 1,
2.641142, -0.7728308, 2.136573, 1, 0, 0.04313726, 1,
2.705052, 0.05415974, 1.941166, 1, 0, 0.03529412, 1,
2.737577, -0.4140701, 1.573782, 1, 0, 0.03137255, 1,
2.97525, 0.02648849, 2.280077, 1, 0, 0.02352941, 1,
3.04262, 1.644342, -0.6153966, 1, 0, 0.01960784, 1,
3.067598, 1.929066, 1.850699, 1, 0, 0.01176471, 1,
3.102986, -0.4983141, 1.113878, 1, 0, 0.007843138, 1
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
0.05942476, -4.51344, -7.649342, 0, -0.5, 0.5, 0.5,
0.05942476, -4.51344, -7.649342, 1, -0.5, 0.5, 0.5,
0.05942476, -4.51344, -7.649342, 1, 1.5, 0.5, 0.5,
0.05942476, -4.51344, -7.649342, 0, 1.5, 0.5, 0.5
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
-4.015903, -0.2531879, -7.649342, 0, -0.5, 0.5, 0.5,
-4.015903, -0.2531879, -7.649342, 1, -0.5, 0.5, 0.5,
-4.015903, -0.2531879, -7.649342, 1, 1.5, 0.5, 0.5,
-4.015903, -0.2531879, -7.649342, 0, 1.5, 0.5, 0.5
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
-4.015903, -4.51344, -0.07839656, 0, -0.5, 0.5, 0.5,
-4.015903, -4.51344, -0.07839656, 1, -0.5, 0.5, 0.5,
-4.015903, -4.51344, -0.07839656, 1, 1.5, 0.5, 0.5,
-4.015903, -4.51344, -0.07839656, 0, 1.5, 0.5, 0.5
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
-2, -3.530305, -5.902201,
3, -3.530305, -5.902201,
-2, -3.530305, -5.902201,
-2, -3.694161, -6.193391,
-1, -3.530305, -5.902201,
-1, -3.694161, -6.193391,
0, -3.530305, -5.902201,
0, -3.694161, -6.193391,
1, -3.530305, -5.902201,
1, -3.694161, -6.193391,
2, -3.530305, -5.902201,
2, -3.694161, -6.193391,
3, -3.530305, -5.902201,
3, -3.694161, -6.193391
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
-2, -4.021873, -6.775772, 0, -0.5, 0.5, 0.5,
-2, -4.021873, -6.775772, 1, -0.5, 0.5, 0.5,
-2, -4.021873, -6.775772, 1, 1.5, 0.5, 0.5,
-2, -4.021873, -6.775772, 0, 1.5, 0.5, 0.5,
-1, -4.021873, -6.775772, 0, -0.5, 0.5, 0.5,
-1, -4.021873, -6.775772, 1, -0.5, 0.5, 0.5,
-1, -4.021873, -6.775772, 1, 1.5, 0.5, 0.5,
-1, -4.021873, -6.775772, 0, 1.5, 0.5, 0.5,
0, -4.021873, -6.775772, 0, -0.5, 0.5, 0.5,
0, -4.021873, -6.775772, 1, -0.5, 0.5, 0.5,
0, -4.021873, -6.775772, 1, 1.5, 0.5, 0.5,
0, -4.021873, -6.775772, 0, 1.5, 0.5, 0.5,
1, -4.021873, -6.775772, 0, -0.5, 0.5, 0.5,
1, -4.021873, -6.775772, 1, -0.5, 0.5, 0.5,
1, -4.021873, -6.775772, 1, 1.5, 0.5, 0.5,
1, -4.021873, -6.775772, 0, 1.5, 0.5, 0.5,
2, -4.021873, -6.775772, 0, -0.5, 0.5, 0.5,
2, -4.021873, -6.775772, 1, -0.5, 0.5, 0.5,
2, -4.021873, -6.775772, 1, 1.5, 0.5, 0.5,
2, -4.021873, -6.775772, 0, 1.5, 0.5, 0.5,
3, -4.021873, -6.775772, 0, -0.5, 0.5, 0.5,
3, -4.021873, -6.775772, 1, -0.5, 0.5, 0.5,
3, -4.021873, -6.775772, 1, 1.5, 0.5, 0.5,
3, -4.021873, -6.775772, 0, 1.5, 0.5, 0.5
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
-3.075443, -3, -5.902201,
-3.075443, 2, -5.902201,
-3.075443, -3, -5.902201,
-3.232187, -3, -6.193391,
-3.075443, -2, -5.902201,
-3.232187, -2, -6.193391,
-3.075443, -1, -5.902201,
-3.232187, -1, -6.193391,
-3.075443, 0, -5.902201,
-3.232187, 0, -6.193391,
-3.075443, 1, -5.902201,
-3.232187, 1, -6.193391,
-3.075443, 2, -5.902201,
-3.232187, 2, -6.193391
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
-3.545673, -3, -6.775772, 0, -0.5, 0.5, 0.5,
-3.545673, -3, -6.775772, 1, -0.5, 0.5, 0.5,
-3.545673, -3, -6.775772, 1, 1.5, 0.5, 0.5,
-3.545673, -3, -6.775772, 0, 1.5, 0.5, 0.5,
-3.545673, -2, -6.775772, 0, -0.5, 0.5, 0.5,
-3.545673, -2, -6.775772, 1, -0.5, 0.5, 0.5,
-3.545673, -2, -6.775772, 1, 1.5, 0.5, 0.5,
-3.545673, -2, -6.775772, 0, 1.5, 0.5, 0.5,
-3.545673, -1, -6.775772, 0, -0.5, 0.5, 0.5,
-3.545673, -1, -6.775772, 1, -0.5, 0.5, 0.5,
-3.545673, -1, -6.775772, 1, 1.5, 0.5, 0.5,
-3.545673, -1, -6.775772, 0, 1.5, 0.5, 0.5,
-3.545673, 0, -6.775772, 0, -0.5, 0.5, 0.5,
-3.545673, 0, -6.775772, 1, -0.5, 0.5, 0.5,
-3.545673, 0, -6.775772, 1, 1.5, 0.5, 0.5,
-3.545673, 0, -6.775772, 0, 1.5, 0.5, 0.5,
-3.545673, 1, -6.775772, 0, -0.5, 0.5, 0.5,
-3.545673, 1, -6.775772, 1, -0.5, 0.5, 0.5,
-3.545673, 1, -6.775772, 1, 1.5, 0.5, 0.5,
-3.545673, 1, -6.775772, 0, 1.5, 0.5, 0.5,
-3.545673, 2, -6.775772, 0, -0.5, 0.5, 0.5,
-3.545673, 2, -6.775772, 1, -0.5, 0.5, 0.5,
-3.545673, 2, -6.775772, 1, 1.5, 0.5, 0.5,
-3.545673, 2, -6.775772, 0, 1.5, 0.5, 0.5
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
-3.075443, -3.530305, -4,
-3.075443, -3.530305, 4,
-3.075443, -3.530305, -4,
-3.232187, -3.694161, -4,
-3.075443, -3.530305, -2,
-3.232187, -3.694161, -2,
-3.075443, -3.530305, 0,
-3.232187, -3.694161, 0,
-3.075443, -3.530305, 2,
-3.232187, -3.694161, 2,
-3.075443, -3.530305, 4,
-3.232187, -3.694161, 4
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
-3.545673, -4.021873, -4, 0, -0.5, 0.5, 0.5,
-3.545673, -4.021873, -4, 1, -0.5, 0.5, 0.5,
-3.545673, -4.021873, -4, 1, 1.5, 0.5, 0.5,
-3.545673, -4.021873, -4, 0, 1.5, 0.5, 0.5,
-3.545673, -4.021873, -2, 0, -0.5, 0.5, 0.5,
-3.545673, -4.021873, -2, 1, -0.5, 0.5, 0.5,
-3.545673, -4.021873, -2, 1, 1.5, 0.5, 0.5,
-3.545673, -4.021873, -2, 0, 1.5, 0.5, 0.5,
-3.545673, -4.021873, 0, 0, -0.5, 0.5, 0.5,
-3.545673, -4.021873, 0, 1, -0.5, 0.5, 0.5,
-3.545673, -4.021873, 0, 1, 1.5, 0.5, 0.5,
-3.545673, -4.021873, 0, 0, 1.5, 0.5, 0.5,
-3.545673, -4.021873, 2, 0, -0.5, 0.5, 0.5,
-3.545673, -4.021873, 2, 1, -0.5, 0.5, 0.5,
-3.545673, -4.021873, 2, 1, 1.5, 0.5, 0.5,
-3.545673, -4.021873, 2, 0, 1.5, 0.5, 0.5,
-3.545673, -4.021873, 4, 0, -0.5, 0.5, 0.5,
-3.545673, -4.021873, 4, 1, -0.5, 0.5, 0.5,
-3.545673, -4.021873, 4, 1, 1.5, 0.5, 0.5,
-3.545673, -4.021873, 4, 0, 1.5, 0.5, 0.5
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
-3.075443, -3.530305, -5.902201,
-3.075443, 3.023929, -5.902201,
-3.075443, -3.530305, 5.745408,
-3.075443, 3.023929, 5.745408,
-3.075443, -3.530305, -5.902201,
-3.075443, -3.530305, 5.745408,
-3.075443, 3.023929, -5.902201,
-3.075443, 3.023929, 5.745408,
-3.075443, -3.530305, -5.902201,
3.194293, -3.530305, -5.902201,
-3.075443, -3.530305, 5.745408,
3.194293, -3.530305, 5.745408,
-3.075443, 3.023929, -5.902201,
3.194293, 3.023929, -5.902201,
-3.075443, 3.023929, 5.745408,
3.194293, 3.023929, 5.745408,
3.194293, -3.530305, -5.902201,
3.194293, 3.023929, -5.902201,
3.194293, -3.530305, 5.745408,
3.194293, 3.023929, 5.745408,
3.194293, -3.530305, -5.902201,
3.194293, -3.530305, 5.745408,
3.194293, 3.023929, -5.902201,
3.194293, 3.023929, 5.745408
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
var radius = 7.882942;
var distance = 35.0721;
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
mvMatrix.translate( -0.05942476, 0.2531879, 0.07839656 );
mvMatrix.scale( 1.359418, 1.30041, 0.7317546 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.0721);
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
chlorimuron_ethyl<-read.table("chlorimuron_ethyl.xyz")
```

```
## Error in read.table("chlorimuron_ethyl.xyz"): no lines available in input
```

```r
x<-chlorimuron_ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorimuron_ethyl' not found
```

```r
y<-chlorimuron_ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorimuron_ethyl' not found
```

```r
z<-chlorimuron_ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorimuron_ethyl' not found
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
-2.984136, -0.5275996, -1.579809, 0, 0, 1, 1, 1,
-2.939488, -1.268942, -2.213513, 1, 0, 0, 1, 1,
-2.904211, -0.4285763, -1.060056, 1, 0, 0, 1, 1,
-2.851735, -0.1931145, -3.316624, 1, 0, 0, 1, 1,
-2.767466, 0.1522841, -1.02364, 1, 0, 0, 1, 1,
-2.731347, -0.6417146, -1.762421, 1, 0, 0, 1, 1,
-2.640731, 0.7484458, -1.785384, 0, 0, 0, 1, 1,
-2.632647, -1.751398, -2.548913, 0, 0, 0, 1, 1,
-2.608542, -0.2249922, -2.426843, 0, 0, 0, 1, 1,
-2.426255, 1.249416, 0.1219372, 0, 0, 0, 1, 1,
-2.368875, -0.3683876, 0.4165115, 0, 0, 0, 1, 1,
-2.292871, 0.08377312, -2.029607, 0, 0, 0, 1, 1,
-2.23732, 0.9266782, -1.733965, 0, 0, 0, 1, 1,
-2.223892, -0.4101442, -0.3334123, 1, 1, 1, 1, 1,
-2.218579, -0.1292818, -1.155586, 1, 1, 1, 1, 1,
-2.130783, 0.0751253, -2.659626, 1, 1, 1, 1, 1,
-2.099991, -0.6610168, -2.210788, 1, 1, 1, 1, 1,
-2.099637, -1.344927, -1.255559, 1, 1, 1, 1, 1,
-2.065112, -0.1891042, -1.806939, 1, 1, 1, 1, 1,
-2.052373, -0.3544115, -2.388517, 1, 1, 1, 1, 1,
-2.015511, 0.9118521, -2.009637, 1, 1, 1, 1, 1,
-1.999732, 0.1095445, -2.818492, 1, 1, 1, 1, 1,
-1.969541, -0.2708965, -2.433098, 1, 1, 1, 1, 1,
-1.963189, 0.2129383, -0.9695213, 1, 1, 1, 1, 1,
-1.962666, 1.790889, -1.366875, 1, 1, 1, 1, 1,
-1.957385, 0.04533295, -1.462922, 1, 1, 1, 1, 1,
-1.938789, 0.4984153, -1.419916, 1, 1, 1, 1, 1,
-1.933, -0.9410422, -2.331464, 1, 1, 1, 1, 1,
-1.897467, 1.550719, -0.03046186, 0, 0, 1, 1, 1,
-1.891156, 0.9028453, -0.5318972, 1, 0, 0, 1, 1,
-1.88502, -0.07868566, -3.423373, 1, 0, 0, 1, 1,
-1.881277, -0.1574669, -2.662843, 1, 0, 0, 1, 1,
-1.8056, 1.014019, -0.5534717, 1, 0, 0, 1, 1,
-1.793855, 0.2799983, -1.129665, 1, 0, 0, 1, 1,
-1.788249, -0.5449595, -2.360588, 0, 0, 0, 1, 1,
-1.746268, 0.8258829, -1.193468, 0, 0, 0, 1, 1,
-1.74444, 1.445017, -0.4222322, 0, 0, 0, 1, 1,
-1.735431, -0.1570017, -0.4425732, 0, 0, 0, 1, 1,
-1.729829, -0.1901896, -1.743659, 0, 0, 0, 1, 1,
-1.716379, 0.2501955, -2.242144, 0, 0, 0, 1, 1,
-1.715216, -1.225622, -2.382049, 0, 0, 0, 1, 1,
-1.71045, 0.6694502, -0.7589844, 1, 1, 1, 1, 1,
-1.685811, -0.6223567, -1.965806, 1, 1, 1, 1, 1,
-1.678753, -0.9531621, -2.238294, 1, 1, 1, 1, 1,
-1.667054, 2.75684, -1.27632, 1, 1, 1, 1, 1,
-1.650816, -0.4796948, -1.862421, 1, 1, 1, 1, 1,
-1.647941, 0.820711, -0.777723, 1, 1, 1, 1, 1,
-1.644905, -0.7164178, -1.351986, 1, 1, 1, 1, 1,
-1.628185, -1.330969, -3.015594, 1, 1, 1, 1, 1,
-1.61856, -1.779474, -2.593883, 1, 1, 1, 1, 1,
-1.613303, -0.7680075, -1.892708, 1, 1, 1, 1, 1,
-1.613186, 0.401261, -3.395133, 1, 1, 1, 1, 1,
-1.597915, 2.057776, -1.360664, 1, 1, 1, 1, 1,
-1.591769, 0.002159578, -1.381498, 1, 1, 1, 1, 1,
-1.590326, -0.1156975, 0.2098158, 1, 1, 1, 1, 1,
-1.584826, 1.115797, 0.5513231, 1, 1, 1, 1, 1,
-1.571062, -0.7309593, -0.9798241, 0, 0, 1, 1, 1,
-1.563967, 0.1356099, 0.6984406, 1, 0, 0, 1, 1,
-1.556491, -1.971516, -2.100072, 1, 0, 0, 1, 1,
-1.549055, 0.03163138, -1.770442, 1, 0, 0, 1, 1,
-1.542041, -0.5063648, -2.22641, 1, 0, 0, 1, 1,
-1.532322, -0.1862823, -0.7755182, 1, 0, 0, 1, 1,
-1.528191, 0.6252291, -0.9923276, 0, 0, 0, 1, 1,
-1.525193, 1.020431, 0.5348749, 0, 0, 0, 1, 1,
-1.513415, -0.8746351, -3.27929, 0, 0, 0, 1, 1,
-1.507868, -0.8970816, -1.719429, 0, 0, 0, 1, 1,
-1.501813, -2.353064, -2.663036, 0, 0, 0, 1, 1,
-1.481392, 0.9407264, -0.9009047, 0, 0, 0, 1, 1,
-1.46763, 0.8109484, -2.530575, 0, 0, 0, 1, 1,
-1.462831, -1.844013, -3.56207, 1, 1, 1, 1, 1,
-1.45825, -0.1539406, -2.101616, 1, 1, 1, 1, 1,
-1.442192, -0.4577156, -1.284418, 1, 1, 1, 1, 1,
-1.438288, -2.342025, -1.597442, 1, 1, 1, 1, 1,
-1.421134, -1.193301, -2.487722, 1, 1, 1, 1, 1,
-1.418305, -0.2003508, -1.522334, 1, 1, 1, 1, 1,
-1.40887, -0.5229585, -3.0615, 1, 1, 1, 1, 1,
-1.401548, -1.715765, -3.086587, 1, 1, 1, 1, 1,
-1.398935, -0.09128871, -2.111807, 1, 1, 1, 1, 1,
-1.398623, 0.5003098, -1.683701, 1, 1, 1, 1, 1,
-1.395675, -0.1881261, -0.5697276, 1, 1, 1, 1, 1,
-1.394934, 0.7613012, -0.3354977, 1, 1, 1, 1, 1,
-1.394842, -2.421788, -0.9280682, 1, 1, 1, 1, 1,
-1.391284, -1.730712, -3.004122, 1, 1, 1, 1, 1,
-1.376857, 1.466975, -2.159702, 1, 1, 1, 1, 1,
-1.374129, 2.124064, -1.525304, 0, 0, 1, 1, 1,
-1.373521, 0.9258385, -0.5233759, 1, 0, 0, 1, 1,
-1.358454, 0.3407995, -0.980501, 1, 0, 0, 1, 1,
-1.352041, 1.831369, -0.5208086, 1, 0, 0, 1, 1,
-1.346868, 0.4949575, -0.2668037, 1, 0, 0, 1, 1,
-1.344895, 0.4179296, -2.369416, 1, 0, 0, 1, 1,
-1.344836, -0.2853859, -1.714446, 0, 0, 0, 1, 1,
-1.341742, 1.109834, 1.164801, 0, 0, 0, 1, 1,
-1.338241, -0.03834266, -1.487374, 0, 0, 0, 1, 1,
-1.33219, 0.6702836, -1.442136, 0, 0, 0, 1, 1,
-1.326345, -1.678491, -1.705591, 0, 0, 0, 1, 1,
-1.319623, -0.672673, -2.695994, 0, 0, 0, 1, 1,
-1.30892, 0.1691198, 0.5742766, 0, 0, 0, 1, 1,
-1.304497, -2.072844, -1.566704, 1, 1, 1, 1, 1,
-1.295644, 0.2716579, -1.41652, 1, 1, 1, 1, 1,
-1.292256, 0.3256054, -0.7984228, 1, 1, 1, 1, 1,
-1.291923, -1.493776, -1.407122, 1, 1, 1, 1, 1,
-1.28405, 1.176792, -2.107058, 1, 1, 1, 1, 1,
-1.281595, -0.9856594, -2.68816, 1, 1, 1, 1, 1,
-1.279104, 1.826991, -0.754383, 1, 1, 1, 1, 1,
-1.278591, -1.076938, -3.441921, 1, 1, 1, 1, 1,
-1.276339, -1.039365, -1.44556, 1, 1, 1, 1, 1,
-1.273691, 0.7286777, -1.178242, 1, 1, 1, 1, 1,
-1.265706, -1.162202, -2.881315, 1, 1, 1, 1, 1,
-1.262632, -0.8192701, -1.830535, 1, 1, 1, 1, 1,
-1.249075, -0.02496973, -2.289848, 1, 1, 1, 1, 1,
-1.238231, -0.6030323, -3.038865, 1, 1, 1, 1, 1,
-1.231558, 1.652173, -0.4499337, 1, 1, 1, 1, 1,
-1.230506, -0.2901387, -1.630618, 0, 0, 1, 1, 1,
-1.219763, 1.056587, 0.7620414, 1, 0, 0, 1, 1,
-1.216157, 0.6225154, -0.5041669, 1, 0, 0, 1, 1,
-1.215087, -1.690074, -1.682287, 1, 0, 0, 1, 1,
-1.211383, -0.8270736, -3.229438, 1, 0, 0, 1, 1,
-1.210771, 0.1846762, -2.300631, 1, 0, 0, 1, 1,
-1.202776, -0.4003766, -2.736034, 0, 0, 0, 1, 1,
-1.177969, 0.1920276, -3.19247, 0, 0, 0, 1, 1,
-1.169544, 1.988212, -1.631052, 0, 0, 0, 1, 1,
-1.15664, 0.4847327, -1.940641, 0, 0, 0, 1, 1,
-1.150954, -1.244212, -1.607479, 0, 0, 0, 1, 1,
-1.148416, -0.779966, -1.978998, 0, 0, 0, 1, 1,
-1.13947, 0.5224853, -0.3673591, 0, 0, 0, 1, 1,
-1.137462, -0.9826673, -1.933036, 1, 1, 1, 1, 1,
-1.12568, 1.10049, -0.4235594, 1, 1, 1, 1, 1,
-1.121374, 0.01096663, -2.10895, 1, 1, 1, 1, 1,
-1.121046, 1.852531, -0.9760488, 1, 1, 1, 1, 1,
-1.120035, -1.088399, -3.22766, 1, 1, 1, 1, 1,
-1.114195, 0.1200959, 0.3325331, 1, 1, 1, 1, 1,
-1.111887, 0.6499367, -0.5482596, 1, 1, 1, 1, 1,
-1.109949, 1.365763, -1.215917, 1, 1, 1, 1, 1,
-1.100296, -0.1574037, -0.985131, 1, 1, 1, 1, 1,
-1.098823, -0.1098768, -1.921772, 1, 1, 1, 1, 1,
-1.094346, -0.9346331, -4.551606, 1, 1, 1, 1, 1,
-1.09333, 1.09316, -0.04169483, 1, 1, 1, 1, 1,
-1.09186, -1.283798, -1.250821, 1, 1, 1, 1, 1,
-1.086076, 0.5216313, -1.596874, 1, 1, 1, 1, 1,
-1.070181, 1.407902, -1.320326, 1, 1, 1, 1, 1,
-1.053856, 0.5558999, -0.8712541, 0, 0, 1, 1, 1,
-1.046722, 0.5146019, -0.9506869, 1, 0, 0, 1, 1,
-1.042087, -0.1886168, -1.306598, 1, 0, 0, 1, 1,
-1.038934, -0.6839639, -2.392079, 1, 0, 0, 1, 1,
-1.038379, -0.4177325, -1.725951, 1, 0, 0, 1, 1,
-1.037959, -1.039782, -3.18435, 1, 0, 0, 1, 1,
-1.035947, 0.7657205, -1.819857, 0, 0, 0, 1, 1,
-1.029786, -2.073907, -3.395747, 0, 0, 0, 1, 1,
-1.025158, 0.6198801, -1.228991, 0, 0, 0, 1, 1,
-1.02255, 1.230919, 0.05433709, 0, 0, 0, 1, 1,
-1.02074, 0.4416964, 0.9506928, 0, 0, 0, 1, 1,
-1.019576, -1.083486, -3.342234, 0, 0, 0, 1, 1,
-1.018923, 0.6404174, -0.259405, 0, 0, 0, 1, 1,
-1.014864, -1.893429, -1.878284, 1, 1, 1, 1, 1,
-1.006866, -0.7808645, -3.001552, 1, 1, 1, 1, 1,
-1.002721, -1.620622, -2.983423, 1, 1, 1, 1, 1,
-0.9985916, 0.5601753, -0.1921713, 1, 1, 1, 1, 1,
-0.9831623, 0.9029912, -1.990497, 1, 1, 1, 1, 1,
-0.9818037, -0.7579584, -2.514374, 1, 1, 1, 1, 1,
-0.9786463, 0.9521239, -0.2692947, 1, 1, 1, 1, 1,
-0.9738451, 2.098082, 1.459852, 1, 1, 1, 1, 1,
-0.9736658, 1.737316, -0.6884882, 1, 1, 1, 1, 1,
-0.9712358, -0.03415532, 0.03806616, 1, 1, 1, 1, 1,
-0.9689358, 0.2128033, -0.2643441, 1, 1, 1, 1, 1,
-0.9662734, -1.486921, -0.4259987, 1, 1, 1, 1, 1,
-0.964318, -0.1291025, -2.81562, 1, 1, 1, 1, 1,
-0.9560542, -0.1392048, 0.3331372, 1, 1, 1, 1, 1,
-0.9483067, -0.1851382, -2.479192, 1, 1, 1, 1, 1,
-0.9472167, -1.324674, -1.921089, 0, 0, 1, 1, 1,
-0.942445, -1.29318, -3.502729, 1, 0, 0, 1, 1,
-0.9410785, 0.03645276, -0.2589084, 1, 0, 0, 1, 1,
-0.9409336, -1.00476, -1.581859, 1, 0, 0, 1, 1,
-0.9391022, 0.2390698, -1.924066, 1, 0, 0, 1, 1,
-0.9376567, 0.1466078, -1.810862, 1, 0, 0, 1, 1,
-0.9337373, 0.06095452, -1.471642, 0, 0, 0, 1, 1,
-0.9288758, -0.504369, -3.598414, 0, 0, 0, 1, 1,
-0.9193277, -0.7949298, 0.4205267, 0, 0, 0, 1, 1,
-0.9169675, 0.7661488, -1.424798, 0, 0, 0, 1, 1,
-0.9104345, 1.041731, -2.115289, 0, 0, 0, 1, 1,
-0.9068639, -1.021818, -2.08238, 0, 0, 0, 1, 1,
-0.9035531, 0.6431108, -0.2834056, 0, 0, 0, 1, 1,
-0.9010546, 0.2252377, -1.999839, 1, 1, 1, 1, 1,
-0.8971318, -0.02923064, -1.487684, 1, 1, 1, 1, 1,
-0.8911987, -0.274005, -4.316767, 1, 1, 1, 1, 1,
-0.8752467, 1.878695, -0.5319994, 1, 1, 1, 1, 1,
-0.873448, -0.3989844, -3.232444, 1, 1, 1, 1, 1,
-0.8663645, 1.010301, 0.8031815, 1, 1, 1, 1, 1,
-0.8646809, -0.5692354, -1.957706, 1, 1, 1, 1, 1,
-0.8605582, -0.06058081, -2.456916, 1, 1, 1, 1, 1,
-0.8600423, 0.002501742, -1.898449, 1, 1, 1, 1, 1,
-0.8540061, 0.2395595, -1.469361, 1, 1, 1, 1, 1,
-0.8537359, -0.3918318, 0.0839272, 1, 1, 1, 1, 1,
-0.8481869, -1.790401, -3.277246, 1, 1, 1, 1, 1,
-0.8473676, 0.05648969, -2.270624, 1, 1, 1, 1, 1,
-0.8421171, 0.9021865, 0.2815782, 1, 1, 1, 1, 1,
-0.8387147, 1.359839, -0.07938851, 1, 1, 1, 1, 1,
-0.8346698, 1.167174, -0.7524366, 0, 0, 1, 1, 1,
-0.8336545, 0.2951752, -1.426836, 1, 0, 0, 1, 1,
-0.8251625, -1.286295, -3.15714, 1, 0, 0, 1, 1,
-0.8238932, 0.3554317, -0.382333, 1, 0, 0, 1, 1,
-0.8063617, 2.326909, -2.789827, 1, 0, 0, 1, 1,
-0.8020532, 1.020486, 0.04086228, 1, 0, 0, 1, 1,
-0.8015975, -0.2905686, -0.9762551, 0, 0, 0, 1, 1,
-0.7974762, 0.5950578, -0.9755376, 0, 0, 0, 1, 1,
-0.7943726, 0.5392858, -1.651969, 0, 0, 0, 1, 1,
-0.7940951, 1.65511, -2.185503, 0, 0, 0, 1, 1,
-0.793725, 0.1159546, -1.836107, 0, 0, 0, 1, 1,
-0.791818, -0.1639138, -2.903965, 0, 0, 0, 1, 1,
-0.7917989, 0.7069226, -0.1383037, 0, 0, 0, 1, 1,
-0.77943, -0.6405938, -1.381495, 1, 1, 1, 1, 1,
-0.7730716, 0.1333604, -3.749038, 1, 1, 1, 1, 1,
-0.7717084, -0.444136, -1.444309, 1, 1, 1, 1, 1,
-0.7707726, 0.3359161, -0.08553825, 1, 1, 1, 1, 1,
-0.7676836, -1.749742, -2.498548, 1, 1, 1, 1, 1,
-0.7619793, 1.147481, 0.4418061, 1, 1, 1, 1, 1,
-0.7618923, 1.144324, -0.1775616, 1, 1, 1, 1, 1,
-0.7598691, -0.984604, -2.687652, 1, 1, 1, 1, 1,
-0.7560881, -1.535765, -2.819251, 1, 1, 1, 1, 1,
-0.7554799, 0.6436815, -0.8120669, 1, 1, 1, 1, 1,
-0.754449, -0.6715533, -4.198714, 1, 1, 1, 1, 1,
-0.7527752, -0.1585226, -1.176372, 1, 1, 1, 1, 1,
-0.7527498, 0.8224971, 0.5077006, 1, 1, 1, 1, 1,
-0.7511058, -0.3561614, -2.136364, 1, 1, 1, 1, 1,
-0.7506436, 0.5184796, -0.4567595, 1, 1, 1, 1, 1,
-0.7470165, -1.186165, -2.306701, 0, 0, 1, 1, 1,
-0.7455713, -0.5583087, -0.5239403, 1, 0, 0, 1, 1,
-0.7451497, -0.05456038, -1.964894, 1, 0, 0, 1, 1,
-0.737646, 1.528832, 0.692719, 1, 0, 0, 1, 1,
-0.7339534, 2.29115, -0.3692444, 1, 0, 0, 1, 1,
-0.7337384, 0.7322467, -1.031647, 1, 0, 0, 1, 1,
-0.7320731, -0.9925452, -0.3784892, 0, 0, 0, 1, 1,
-0.7314934, -0.8496923, -0.01779016, 0, 0, 0, 1, 1,
-0.7311481, 2.152623, 1.565436, 0, 0, 0, 1, 1,
-0.7303002, -0.9671151, -3.359898, 0, 0, 0, 1, 1,
-0.7244617, 0.1786772, -1.870277, 0, 0, 0, 1, 1,
-0.7231724, 1.009673, -0.0652421, 0, 0, 0, 1, 1,
-0.72254, 0.3780048, -0.8821014, 0, 0, 0, 1, 1,
-0.7197435, 0.06972826, 1.279641, 1, 1, 1, 1, 1,
-0.7189652, -0.2178954, -2.778008, 1, 1, 1, 1, 1,
-0.717741, -0.6928744, -2.867659, 1, 1, 1, 1, 1,
-0.7165797, 2.928479, 0.8816261, 1, 1, 1, 1, 1,
-0.715142, -0.2095875, -1.666038, 1, 1, 1, 1, 1,
-0.7131299, 1.591054, 1.503638, 1, 1, 1, 1, 1,
-0.7100399, 1.009414, 0.1573382, 1, 1, 1, 1, 1,
-0.7087246, 1.315178, 0.09409563, 1, 1, 1, 1, 1,
-0.7080743, -0.4619334, -1.048207, 1, 1, 1, 1, 1,
-0.7050321, 0.4333873, -1.667723, 1, 1, 1, 1, 1,
-0.7018992, -0.7107385, -3.474369, 1, 1, 1, 1, 1,
-0.693696, 0.5059152, 1.953953, 1, 1, 1, 1, 1,
-0.6931734, -0.2517886, -1.938615, 1, 1, 1, 1, 1,
-0.6891773, 0.9459677, 0.1764518, 1, 1, 1, 1, 1,
-0.6859135, 0.7716467, 1.640932, 1, 1, 1, 1, 1,
-0.6803644, 0.3816503, -2.416017, 0, 0, 1, 1, 1,
-0.676816, -1.120888, -3.0811, 1, 0, 0, 1, 1,
-0.6698664, 0.3264642, -0.05173657, 1, 0, 0, 1, 1,
-0.6646993, 0.6327984, 0.2793454, 1, 0, 0, 1, 1,
-0.6615397, 0.332083, -2.863248, 1, 0, 0, 1, 1,
-0.6600911, 1.058332, -2.573472, 1, 0, 0, 1, 1,
-0.6571676, 0.6470336, -2.273187, 0, 0, 0, 1, 1,
-0.6565031, 2.542155, -0.5573328, 0, 0, 0, 1, 1,
-0.6495147, 0.3286345, -0.9701415, 0, 0, 0, 1, 1,
-0.6473128, -1.108945, -2.007774, 0, 0, 0, 1, 1,
-0.6442761, 0.4056186, -2.611921, 0, 0, 0, 1, 1,
-0.6441506, 0.07107952, -1.612553, 0, 0, 0, 1, 1,
-0.6389254, 0.5993897, -0.7867044, 0, 0, 0, 1, 1,
-0.6367497, -0.6002591, -2.967052, 1, 1, 1, 1, 1,
-0.6356361, 0.09688251, 0.2700206, 1, 1, 1, 1, 1,
-0.6332341, -0.04257328, -0.04995601, 1, 1, 1, 1, 1,
-0.628603, -1.536101, -1.663108, 1, 1, 1, 1, 1,
-0.6273981, 0.7185789, -1.788371, 1, 1, 1, 1, 1,
-0.6263035, -0.3746366, -1.577177, 1, 1, 1, 1, 1,
-0.62274, -0.391185, -1.428991, 1, 1, 1, 1, 1,
-0.6208174, 0.2452922, -1.791761, 1, 1, 1, 1, 1,
-0.6167397, -0.8155605, -3.28223, 1, 1, 1, 1, 1,
-0.6152228, 0.2987095, -2.125602, 1, 1, 1, 1, 1,
-0.6097305, 0.1300139, -0.169317, 1, 1, 1, 1, 1,
-0.6090157, -0.02459209, -2.432792, 1, 1, 1, 1, 1,
-0.6088482, 1.723387, -0.3461795, 1, 1, 1, 1, 1,
-0.6051853, -1.434114, -1.908317, 1, 1, 1, 1, 1,
-0.6029553, -1.549546, -2.965003, 1, 1, 1, 1, 1,
-0.6013016, 0.4621109, -1.620312, 0, 0, 1, 1, 1,
-0.5993845, -0.4530618, -2.045449, 1, 0, 0, 1, 1,
-0.5984951, 0.9153501, -0.8154404, 1, 0, 0, 1, 1,
-0.5968291, 0.7021465, -0.654836, 1, 0, 0, 1, 1,
-0.5908666, 0.1377077, -1.867628, 1, 0, 0, 1, 1,
-0.5849321, 0.2536216, -1.159514, 1, 0, 0, 1, 1,
-0.5833572, -0.3283592, -2.370601, 0, 0, 0, 1, 1,
-0.5788291, 1.104306, 0.5812055, 0, 0, 0, 1, 1,
-0.5765865, 0.5161552, -2.449355, 0, 0, 0, 1, 1,
-0.5762526, 0.3179598, 1.455721, 0, 0, 0, 1, 1,
-0.5738367, 0.1825058, -1.288629, 0, 0, 0, 1, 1,
-0.5713046, -0.7385702, -1.477348, 0, 0, 0, 1, 1,
-0.5658101, -0.3237002, -2.926723, 0, 0, 0, 1, 1,
-0.5576926, -0.2348532, -1.432414, 1, 1, 1, 1, 1,
-0.5478477, -0.209155, -1.858789, 1, 1, 1, 1, 1,
-0.5476924, -0.004311853, -0.1226907, 1, 1, 1, 1, 1,
-0.5441738, 0.7131243, -1.134717, 1, 1, 1, 1, 1,
-0.5389196, 1.184153, -2.14473, 1, 1, 1, 1, 1,
-0.538233, -0.7571231, -1.583305, 1, 1, 1, 1, 1,
-0.5331116, -1.487352, -5.732575, 1, 1, 1, 1, 1,
-0.5302042, 0.5126358, -1.955781, 1, 1, 1, 1, 1,
-0.5248264, -0.8860669, -2.642876, 1, 1, 1, 1, 1,
-0.5231335, -1.013612, -0.6143276, 1, 1, 1, 1, 1,
-0.5202248, 2.256634, -0.2685303, 1, 1, 1, 1, 1,
-0.5199489, 0.05905838, -1.757782, 1, 1, 1, 1, 1,
-0.5164568, 0.104476, -1.528037, 1, 1, 1, 1, 1,
-0.5135689, -0.2429321, -2.348199, 1, 1, 1, 1, 1,
-0.5131493, -1.743512, -1.826203, 1, 1, 1, 1, 1,
-0.5047257, 0.8886286, -0.3233747, 0, 0, 1, 1, 1,
-0.5009527, 0.8122474, -1.399086, 1, 0, 0, 1, 1,
-0.4973854, 1.979143, 2.278876, 1, 0, 0, 1, 1,
-0.4955945, -1.556799, -2.971382, 1, 0, 0, 1, 1,
-0.4935493, -1.598323, -2.851529, 1, 0, 0, 1, 1,
-0.4882515, 0.5314203, -0.1849435, 1, 0, 0, 1, 1,
-0.4880979, -0.2349055, -3.486537, 0, 0, 0, 1, 1,
-0.4714485, -1.106265, -3.67724, 0, 0, 0, 1, 1,
-0.469821, -0.1430244, -0.3701242, 0, 0, 0, 1, 1,
-0.4691522, -0.5237467, -2.262455, 0, 0, 0, 1, 1,
-0.4664264, 0.2802985, -0.1983772, 0, 0, 0, 1, 1,
-0.4632091, -0.7248799, -1.018395, 0, 0, 0, 1, 1,
-0.4599576, 0.904965, 0.8632358, 0, 0, 0, 1, 1,
-0.4592784, 0.9598961, -0.8523676, 1, 1, 1, 1, 1,
-0.4592254, 0.8929915, -0.8270324, 1, 1, 1, 1, 1,
-0.4573771, -0.1331012, -2.823446, 1, 1, 1, 1, 1,
-0.4567926, 1.036715, 0.5264951, 1, 1, 1, 1, 1,
-0.456341, 2.173095, -0.3378997, 1, 1, 1, 1, 1,
-0.4522208, 0.5809459, -1.770508, 1, 1, 1, 1, 1,
-0.4521105, 0.7350441, 0.0723363, 1, 1, 1, 1, 1,
-0.4510908, 1.984826, 0.682156, 1, 1, 1, 1, 1,
-0.4480006, -1.555406, 0.3708229, 1, 1, 1, 1, 1,
-0.4388049, 0.1226664, -1.805932, 1, 1, 1, 1, 1,
-0.4382713, -1.419662, -3.789076, 1, 1, 1, 1, 1,
-0.4375694, -0.819258, -2.212713, 1, 1, 1, 1, 1,
-0.4369282, -0.5918549, -1.733863, 1, 1, 1, 1, 1,
-0.4308653, 0.4867206, 0.8010522, 1, 1, 1, 1, 1,
-0.43033, 0.2946397, -1.174749, 1, 1, 1, 1, 1,
-0.425447, 1.564329, 0.9004423, 0, 0, 1, 1, 1,
-0.42058, -0.317054, -2.184391, 1, 0, 0, 1, 1,
-0.4143997, -2.141862, -4.640063, 1, 0, 0, 1, 1,
-0.4118989, -0.7533677, -2.905667, 1, 0, 0, 1, 1,
-0.4088141, -0.03088006, -2.155614, 1, 0, 0, 1, 1,
-0.4048104, 1.295967, -1.368727, 1, 0, 0, 1, 1,
-0.4029932, -2.147083, -1.322312, 0, 0, 0, 1, 1,
-0.4008041, -0.1104114, -2.063347, 0, 0, 0, 1, 1,
-0.4004923, 0.1820804, 0.4337714, 0, 0, 0, 1, 1,
-0.3961746, 0.444505, 0.5372038, 0, 0, 0, 1, 1,
-0.3943503, 0.8250917, -2.15997, 0, 0, 0, 1, 1,
-0.392138, 0.5747068, 1.163718, 0, 0, 0, 1, 1,
-0.3915859, -0.2432105, -1.302896, 0, 0, 0, 1, 1,
-0.389139, 0.5452647, -0.3106141, 1, 1, 1, 1, 1,
-0.3875084, -1.054605, -1.726272, 1, 1, 1, 1, 1,
-0.3856691, -0.6059507, -2.075751, 1, 1, 1, 1, 1,
-0.3843319, 2.187167, 0.219459, 1, 1, 1, 1, 1,
-0.3834321, 0.1001639, -2.621496, 1, 1, 1, 1, 1,
-0.3827512, 0.8842033, -1.24939, 1, 1, 1, 1, 1,
-0.3802784, -1.95849, -3.144031, 1, 1, 1, 1, 1,
-0.3770027, -1.258068, -2.239111, 1, 1, 1, 1, 1,
-0.3723451, 1.004737, -2.876065, 1, 1, 1, 1, 1,
-0.3723386, 0.6188086, 0.07790346, 1, 1, 1, 1, 1,
-0.3721256, -1.721499, -2.860346, 1, 1, 1, 1, 1,
-0.3698085, -0.6217327, -1.776127, 1, 1, 1, 1, 1,
-0.368942, 1.316618, -0.5588014, 1, 1, 1, 1, 1,
-0.3686436, 1.097402, -0.9896739, 1, 1, 1, 1, 1,
-0.3646064, -0.2763219, -1.187968, 1, 1, 1, 1, 1,
-0.3642783, -0.1707846, -2.207135, 0, 0, 1, 1, 1,
-0.3612868, 1.46219, 0.1332434, 1, 0, 0, 1, 1,
-0.3587035, 0.6027232, -0.6616618, 1, 0, 0, 1, 1,
-0.3584692, -1.447369, -3.857787, 1, 0, 0, 1, 1,
-0.3549581, 0.6506692, -1.392374, 1, 0, 0, 1, 1,
-0.3539345, 0.8390941, 1.036772, 1, 0, 0, 1, 1,
-0.3534026, 0.5176053, -0.987906, 0, 0, 0, 1, 1,
-0.3525799, 1.170682, -1.550189, 0, 0, 0, 1, 1,
-0.3515792, -0.9065622, -2.758999, 0, 0, 0, 1, 1,
-0.350462, 2.036221, 1.2552, 0, 0, 0, 1, 1,
-0.3490051, 0.9371672, -1.239913, 0, 0, 0, 1, 1,
-0.3457128, 2.011675, -0.9159327, 0, 0, 0, 1, 1,
-0.3435614, 0.1754805, -0.1786769, 0, 0, 0, 1, 1,
-0.3404936, 0.7638587, -0.3115288, 1, 1, 1, 1, 1,
-0.3355772, 1.420952, 1.346783, 1, 1, 1, 1, 1,
-0.3199717, 0.3428353, -2.382033, 1, 1, 1, 1, 1,
-0.3186239, -1.188551, -2.223584, 1, 1, 1, 1, 1,
-0.3152362, 0.6877792, -1.265366, 1, 1, 1, 1, 1,
-0.3102922, 0.6538919, -1.427863, 1, 1, 1, 1, 1,
-0.3075732, -0.2527418, -1.281494, 1, 1, 1, 1, 1,
-0.3073443, 0.01433767, -1.444872, 1, 1, 1, 1, 1,
-0.3067591, -0.2342128, -2.184677, 1, 1, 1, 1, 1,
-0.3051446, -0.7179706, -3.602388, 1, 1, 1, 1, 1,
-0.3050572, 1.187325, -0.1714638, 1, 1, 1, 1, 1,
-0.303794, 1.71958, 0.6925838, 1, 1, 1, 1, 1,
-0.3018971, 0.6802921, -0.5259783, 1, 1, 1, 1, 1,
-0.2972873, 0.06737532, 0.04404397, 1, 1, 1, 1, 1,
-0.297251, 0.9042766, -1.407923, 1, 1, 1, 1, 1,
-0.2958731, 0.07100888, -1.227435, 0, 0, 1, 1, 1,
-0.2941202, -0.2154319, -4.526528, 1, 0, 0, 1, 1,
-0.2931218, 0.5511714, -0.1944747, 1, 0, 0, 1, 1,
-0.2880727, -1.868542, -2.964962, 1, 0, 0, 1, 1,
-0.2861624, 0.04436984, -1.773268, 1, 0, 0, 1, 1,
-0.2846196, -0.06820224, -1.798312, 1, 0, 0, 1, 1,
-0.2826614, -0.1322182, -1.424305, 0, 0, 0, 1, 1,
-0.28153, 0.5277363, -0.9426453, 0, 0, 0, 1, 1,
-0.2716625, -1.340499, -2.901793, 0, 0, 0, 1, 1,
-0.2705356, -0.4821526, -5.682613, 0, 0, 0, 1, 1,
-0.2694138, 0.7545014, -0.4191735, 0, 0, 0, 1, 1,
-0.2652887, -0.3143292, -1.378349, 0, 0, 0, 1, 1,
-0.2645251, 0.267776, -0.7189699, 0, 0, 0, 1, 1,
-0.2636681, -1.677645, -1.706079, 1, 1, 1, 1, 1,
-0.2615282, -1.036453, -2.965704, 1, 1, 1, 1, 1,
-0.2594725, -1.262123, -3.934373, 1, 1, 1, 1, 1,
-0.2546495, 0.4658566, -1.49246, 1, 1, 1, 1, 1,
-0.2519928, 1.398359, -1.704926, 1, 1, 1, 1, 1,
-0.2482758, -0.5206122, -4.083607, 1, 1, 1, 1, 1,
-0.2467177, 1.722881, -1.921389, 1, 1, 1, 1, 1,
-0.2458004, -0.8227881, -1.300107, 1, 1, 1, 1, 1,
-0.2447327, 0.1129213, -1.309518, 1, 1, 1, 1, 1,
-0.2422171, 1.151843, -3.098966, 1, 1, 1, 1, 1,
-0.2406131, 0.2769931, 1.29743, 1, 1, 1, 1, 1,
-0.2369533, -1.164161, -2.810668, 1, 1, 1, 1, 1,
-0.2352108, 0.1067545, -1.0122, 1, 1, 1, 1, 1,
-0.2338651, -0.4039207, -2.344928, 1, 1, 1, 1, 1,
-0.2250368, 1.19867, 0.5150426, 1, 1, 1, 1, 1,
-0.223643, 0.2176031, -0.1016886, 0, 0, 1, 1, 1,
-0.2222937, 0.09716567, -0.8813977, 1, 0, 0, 1, 1,
-0.2212359, -0.9439555, -4.655035, 1, 0, 0, 1, 1,
-0.2210882, -1.133209, -2.331989, 1, 0, 0, 1, 1,
-0.2146572, -0.1115673, -2.322491, 1, 0, 0, 1, 1,
-0.2119113, 0.5627502, -0.9877153, 1, 0, 0, 1, 1,
-0.2099412, -0.2714639, -2.368568, 0, 0, 0, 1, 1,
-0.209786, -0.6095629, -0.9451502, 0, 0, 0, 1, 1,
-0.2084664, 1.905853, -0.5170807, 0, 0, 0, 1, 1,
-0.2051676, -2.412595, -2.105873, 0, 0, 0, 1, 1,
-0.2010073, 1.100923, -2.179976, 0, 0, 0, 1, 1,
-0.1962999, -0.271885, -1.620836, 0, 0, 0, 1, 1,
-0.191696, -1.018049, -2.711287, 0, 0, 0, 1, 1,
-0.1878169, -1.579831, -2.750405, 1, 1, 1, 1, 1,
-0.1855833, 0.4652454, -1.481655, 1, 1, 1, 1, 1,
-0.1853297, 0.3545247, 0.08586133, 1, 1, 1, 1, 1,
-0.1838656, 0.1591519, -0.554144, 1, 1, 1, 1, 1,
-0.1820973, -0.3389411, -2.184901, 1, 1, 1, 1, 1,
-0.1817385, 1.584149, 1.292225, 1, 1, 1, 1, 1,
-0.1782205, -0.6789745, -2.672211, 1, 1, 1, 1, 1,
-0.1744595, -1.403105, -2.9817, 1, 1, 1, 1, 1,
-0.1740465, 0.7340529, -1.038648, 1, 1, 1, 1, 1,
-0.1716879, -0.115827, -2.743492, 1, 1, 1, 1, 1,
-0.1699766, -1.529088, -3.56145, 1, 1, 1, 1, 1,
-0.1681053, 0.5721295, -0.03575605, 1, 1, 1, 1, 1,
-0.165672, 0.1011356, -0.568193, 1, 1, 1, 1, 1,
-0.165666, -1.118898, -2.157635, 1, 1, 1, 1, 1,
-0.1629202, -0.02140773, -1.454429, 1, 1, 1, 1, 1,
-0.1618396, -1.510223, -3.128873, 0, 0, 1, 1, 1,
-0.1617911, 0.3571588, 0.2994874, 1, 0, 0, 1, 1,
-0.1594364, 2.117789, 1.402164, 1, 0, 0, 1, 1,
-0.1553878, -1.540655, -1.924025, 1, 0, 0, 1, 1,
-0.1520869, 0.5884471, -0.738552, 1, 0, 0, 1, 1,
-0.1516767, -0.4915729, -3.538209, 1, 0, 0, 1, 1,
-0.1511543, -0.2775301, -1.114282, 0, 0, 0, 1, 1,
-0.1460537, -0.7543579, -3.720784, 0, 0, 0, 1, 1,
-0.1460332, -0.2078147, -3.921042, 0, 0, 0, 1, 1,
-0.1445979, 0.6470827, -1.436805, 0, 0, 0, 1, 1,
-0.1444339, 0.854941, -1.042274, 0, 0, 0, 1, 1,
-0.143851, -1.323245, -4.069785, 0, 0, 0, 1, 1,
-0.1435604, -0.8793131, -1.975015, 0, 0, 0, 1, 1,
-0.1430672, -2.314852, -2.73081, 1, 1, 1, 1, 1,
-0.1423159, 0.9991559, -0.3023565, 1, 1, 1, 1, 1,
-0.1393081, -0.01165102, -1.867118, 1, 1, 1, 1, 1,
-0.1371225, -0.4457846, -3.697675, 1, 1, 1, 1, 1,
-0.1359617, -0.6731969, -2.524833, 1, 1, 1, 1, 1,
-0.1326834, -0.1012095, -3.188331, 1, 1, 1, 1, 1,
-0.1325529, -1.255614, -4.409577, 1, 1, 1, 1, 1,
-0.1294623, 0.06985409, -1.02046, 1, 1, 1, 1, 1,
-0.1275021, -0.364597, -2.993371, 1, 1, 1, 1, 1,
-0.1233457, -0.2854129, -2.38552, 1, 1, 1, 1, 1,
-0.1194033, 0.2954667, -2.024974, 1, 1, 1, 1, 1,
-0.1143308, -0.8589793, -2.483946, 1, 1, 1, 1, 1,
-0.1089576, 0.6211324, 0.7397947, 1, 1, 1, 1, 1,
-0.09893005, -1.899444, -2.589032, 1, 1, 1, 1, 1,
-0.0987478, -0.2240643, -1.45961, 1, 1, 1, 1, 1,
-0.09853988, -0.8647624, -2.041938, 0, 0, 1, 1, 1,
-0.09809154, 2.446521, 0.3218573, 1, 0, 0, 1, 1,
-0.0928333, 0.1643058, -0.8394232, 1, 0, 0, 1, 1,
-0.091819, 1.263384, 0.9145164, 1, 0, 0, 1, 1,
-0.09023496, 1.320984, 0.8566188, 1, 0, 0, 1, 1,
-0.08723773, 1.863033, -0.1790899, 1, 0, 0, 1, 1,
-0.08679705, 1.633123, -0.4740598, 0, 0, 0, 1, 1,
-0.08644804, 0.9696571, -0.4256783, 0, 0, 0, 1, 1,
-0.08442894, 0.9574077, -0.5679452, 0, 0, 0, 1, 1,
-0.08388501, -0.6260028, -4.571634, 0, 0, 0, 1, 1,
-0.08326803, -1.670843, -4.221822, 0, 0, 0, 1, 1,
-0.08106624, -0.5920036, -3.844563, 0, 0, 0, 1, 1,
-0.0810219, -1.230244, -3.207941, 0, 0, 0, 1, 1,
-0.07973965, 0.4697011, -0.6446151, 1, 1, 1, 1, 1,
-0.07805886, -0.8786468, -2.749095, 1, 1, 1, 1, 1,
-0.07653657, 0.3172114, -1.183705, 1, 1, 1, 1, 1,
-0.07280794, -1.44259, -4.187052, 1, 1, 1, 1, 1,
-0.07004776, -1.04982, -3.559087, 1, 1, 1, 1, 1,
-0.0699775, 0.3362396, -0.7796745, 1, 1, 1, 1, 1,
-0.06951368, 0.05232857, -1.518183, 1, 1, 1, 1, 1,
-0.06942228, -0.03313255, -1.347629, 1, 1, 1, 1, 1,
-0.06916012, -1.250663, -5.214755, 1, 1, 1, 1, 1,
-0.06755818, -0.9368353, -5.627724, 1, 1, 1, 1, 1,
-0.06656548, -0.09274767, -2.063746, 1, 1, 1, 1, 1,
-0.06382453, -1.21805, -2.848246, 1, 1, 1, 1, 1,
-0.0614687, -0.9743569, -2.001395, 1, 1, 1, 1, 1,
-0.0611805, 0.1855931, -0.6898527, 1, 1, 1, 1, 1,
-0.05634946, -0.7857177, -4.850836, 1, 1, 1, 1, 1,
-0.05474309, 1.587037, -0.2497551, 0, 0, 1, 1, 1,
-0.05426264, 1.084818, 1.625455, 1, 0, 0, 1, 1,
-0.0539482, 0.1030795, 0.8151575, 1, 0, 0, 1, 1,
-0.05345934, 0.3643257, -0.5600035, 1, 0, 0, 1, 1,
-0.04927298, -0.1956054, -3.447243, 1, 0, 0, 1, 1,
-0.04830737, 2.790503, 1.103231, 1, 0, 0, 1, 1,
-0.04177804, -1.203477, -3.354617, 0, 0, 0, 1, 1,
-0.03855516, -0.7353573, -3.164403, 0, 0, 0, 1, 1,
-0.03660161, 1.227206, -0.8346304, 0, 0, 0, 1, 1,
-0.02899391, 0.3708666, 0.2683384, 0, 0, 0, 1, 1,
-0.02832419, 0.01642176, 0.3303885, 0, 0, 0, 1, 1,
-0.02269926, 0.4673342, 0.1749073, 0, 0, 0, 1, 1,
-0.02004804, 0.8360174, -0.7164038, 0, 0, 0, 1, 1,
-0.01951532, 1.587184, -0.3165, 1, 1, 1, 1, 1,
-0.005628697, 2.63212, 0.1962924, 1, 1, 1, 1, 1,
-0.002631126, 1.27024, -1.519809, 1, 1, 1, 1, 1,
-0.000879874, 1.265616, 0.1968996, 1, 1, 1, 1, 1,
0.0009659742, 0.213758, 0.05851999, 1, 1, 1, 1, 1,
0.001791726, -1.777059, 2.284834, 1, 1, 1, 1, 1,
0.001958904, -2.026295, 2.396077, 1, 1, 1, 1, 1,
0.002902733, 0.3167805, 0.2116674, 1, 1, 1, 1, 1,
0.006034919, -0.9376463, 3.290245, 1, 1, 1, 1, 1,
0.006493275, 0.9002829, -1.667858, 1, 1, 1, 1, 1,
0.006520499, -0.2467665, 2.871142, 1, 1, 1, 1, 1,
0.007666639, -0.4344321, 3.215428, 1, 1, 1, 1, 1,
0.008091964, -0.9578308, 4.052326, 1, 1, 1, 1, 1,
0.009328093, -0.08856837, 4.658058, 1, 1, 1, 1, 1,
0.01480328, 0.06405696, -0.09904687, 1, 1, 1, 1, 1,
0.0149029, 0.1017473, -0.7601875, 0, 0, 1, 1, 1,
0.01765141, 0.1358757, 1.354465, 1, 0, 0, 1, 1,
0.02199065, 1.121842, 1.049162, 1, 0, 0, 1, 1,
0.02217974, 0.5814174, 0.6238616, 1, 0, 0, 1, 1,
0.02773676, -0.6966218, 1.226186, 1, 0, 0, 1, 1,
0.03179527, -1.374879, 4.820157, 1, 0, 0, 1, 1,
0.03193449, -0.4285529, 3.352285, 0, 0, 0, 1, 1,
0.03984028, 0.4726743, -0.1650122, 0, 0, 0, 1, 1,
0.04079125, -0.4938127, 3.185436, 0, 0, 0, 1, 1,
0.04698437, -0.1016953, 3.325998, 0, 0, 0, 1, 1,
0.04827015, -0.3617435, 0.7647381, 0, 0, 0, 1, 1,
0.04945722, -2.353477, 2.217387, 0, 0, 0, 1, 1,
0.05212035, -1.423775, 4.571602, 0, 0, 0, 1, 1,
0.05253462, -0.289891, 2.419538, 1, 1, 1, 1, 1,
0.05331594, -0.6995682, 3.664314, 1, 1, 1, 1, 1,
0.05388632, 0.1599454, 0.1190111, 1, 1, 1, 1, 1,
0.0610569, 0.8320385, 1.127893, 1, 1, 1, 1, 1,
0.06283163, -1.057916, 3.551321, 1, 1, 1, 1, 1,
0.06391893, -0.275296, 2.614672, 1, 1, 1, 1, 1,
0.06405868, 0.2873136, -0.7852229, 1, 1, 1, 1, 1,
0.06518854, -0.8655414, 4.018936, 1, 1, 1, 1, 1,
0.06645872, -0.7499884, 2.304224, 1, 1, 1, 1, 1,
0.06646959, -0.08817343, 1.800093, 1, 1, 1, 1, 1,
0.06696068, -1.075793, 3.308461, 1, 1, 1, 1, 1,
0.06781732, -1.469551, 2.651176, 1, 1, 1, 1, 1,
0.0755576, 0.1679618, 0.5909451, 1, 1, 1, 1, 1,
0.07559791, 0.3843124, 0.1625149, 1, 1, 1, 1, 1,
0.08177594, -1.108164, 3.570393, 1, 1, 1, 1, 1,
0.08232316, 0.7924839, -0.5740214, 0, 0, 1, 1, 1,
0.09069195, -1.530301, 3.394901, 1, 0, 0, 1, 1,
0.09137145, 0.1728211, 0.123852, 1, 0, 0, 1, 1,
0.09209524, -1.498673, 4.077948, 1, 0, 0, 1, 1,
0.09866707, 1.329055, -0.2083187, 1, 0, 0, 1, 1,
0.09881934, -0.575263, 4.400837, 1, 0, 0, 1, 1,
0.1015801, -0.1634078, 0.5168369, 0, 0, 0, 1, 1,
0.1035635, -1.42885, 2.66361, 0, 0, 0, 1, 1,
0.1151634, -2.18626, 1.0896, 0, 0, 0, 1, 1,
0.1191452, -0.06421199, 1.895123, 0, 0, 0, 1, 1,
0.1217917, -0.6266542, 4.17223, 0, 0, 0, 1, 1,
0.1310702, 0.9287893, 0.1380417, 0, 0, 0, 1, 1,
0.1417293, 1.971805, 1.563946, 0, 0, 0, 1, 1,
0.1426332, 0.1692304, 2.823911, 1, 1, 1, 1, 1,
0.1437479, 0.5834818, -1.266145, 1, 1, 1, 1, 1,
0.1439118, 1.196695, -0.2132193, 1, 1, 1, 1, 1,
0.1477787, 0.8585624, 0.2230414, 1, 1, 1, 1, 1,
0.1479092, -0.5369731, 3.352385, 1, 1, 1, 1, 1,
0.1557873, -1.462323, 2.108366, 1, 1, 1, 1, 1,
0.1589336, -0.294536, 2.536853, 1, 1, 1, 1, 1,
0.1594361, 1.205908, -0.6802981, 1, 1, 1, 1, 1,
0.1611568, 0.5753665, 0.06420205, 1, 1, 1, 1, 1,
0.1705202, -1.61052, -0.1043576, 1, 1, 1, 1, 1,
0.1734789, -0.4083416, 2.59453, 1, 1, 1, 1, 1,
0.1745433, -1.243819, 3.560343, 1, 1, 1, 1, 1,
0.1752891, -0.6809615, 4.507757, 1, 1, 1, 1, 1,
0.1754798, -0.4559418, 1.796595, 1, 1, 1, 1, 1,
0.1763947, -1.469947, 3.209364, 1, 1, 1, 1, 1,
0.1786281, 0.2261872, 0.8053601, 0, 0, 1, 1, 1,
0.1790518, 2.002281, 1.45954, 1, 0, 0, 1, 1,
0.1884732, -1.398888, 3.754144, 1, 0, 0, 1, 1,
0.1893503, -0.2126518, 0.9502354, 1, 0, 0, 1, 1,
0.1896869, 0.1054841, 0.3143625, 1, 0, 0, 1, 1,
0.1898793, 1.64704, -0.9763681, 1, 0, 0, 1, 1,
0.1909398, 0.9077235, 0.2689639, 0, 0, 0, 1, 1,
0.1936471, -0.4997443, 1.427971, 0, 0, 0, 1, 1,
0.1936895, -1.32813, 3.122265, 0, 0, 0, 1, 1,
0.1938979, 0.6573168, 1.144867, 0, 0, 0, 1, 1,
0.1950731, -0.627163, 3.259928, 0, 0, 0, 1, 1,
0.1966818, 1.891228, 0.9500927, 0, 0, 0, 1, 1,
0.2072718, -3.434855, 5.207181, 0, 0, 0, 1, 1,
0.2073183, -0.8973622, 2.215671, 1, 1, 1, 1, 1,
0.2090846, 1.608505, -0.6585608, 1, 1, 1, 1, 1,
0.2247145, 0.8960362, -0.08145367, 1, 1, 1, 1, 1,
0.2318236, -0.9679102, 2.296385, 1, 1, 1, 1, 1,
0.2319203, -0.4991319, 0.9966891, 1, 1, 1, 1, 1,
0.2344173, -0.8620066, 3.796138, 1, 1, 1, 1, 1,
0.235054, -0.4002405, 3.270634, 1, 1, 1, 1, 1,
0.2361664, -0.3852183, 3.234484, 1, 1, 1, 1, 1,
0.2380765, -0.5683401, 2.710742, 1, 1, 1, 1, 1,
0.2385137, -1.986338, 3.520842, 1, 1, 1, 1, 1,
0.2440403, -1.772927, 3.935224, 1, 1, 1, 1, 1,
0.2449125, -1.167547, 2.075217, 1, 1, 1, 1, 1,
0.2457519, 2.132828, 0.6099951, 1, 1, 1, 1, 1,
0.2460119, 0.7467041, -1.685104, 1, 1, 1, 1, 1,
0.2483837, 0.523832, 1.468371, 1, 1, 1, 1, 1,
0.2501049, 0.2840381, 0.175386, 0, 0, 1, 1, 1,
0.2504548, -2.017138, 2.022422, 1, 0, 0, 1, 1,
0.2514725, -1.366017, 2.373504, 1, 0, 0, 1, 1,
0.2515056, -0.9703477, 1.981698, 1, 0, 0, 1, 1,
0.2556073, 0.6079039, 1.73945, 1, 0, 0, 1, 1,
0.2567383, -0.7561937, 1.943928, 1, 0, 0, 1, 1,
0.2567682, -1.106434, 2.208971, 0, 0, 0, 1, 1,
0.2586208, -1.319548, 3.266239, 0, 0, 0, 1, 1,
0.2678584, -1.037457, 3.806916, 0, 0, 0, 1, 1,
0.2703954, 1.070229, 2.197883, 0, 0, 0, 1, 1,
0.2728159, 0.8815145, 0.9794071, 0, 0, 0, 1, 1,
0.2748792, -0.520798, 2.16897, 0, 0, 0, 1, 1,
0.2757306, 0.4796833, 0.2440805, 0, 0, 0, 1, 1,
0.2795307, 0.5318849, 1.509947, 1, 1, 1, 1, 1,
0.2965986, 1.18956, -0.1668357, 1, 1, 1, 1, 1,
0.2971661, 1.182145, -1.537011, 1, 1, 1, 1, 1,
0.2993329, -1.504582, 2.701809, 1, 1, 1, 1, 1,
0.2995525, -1.698006, 0.9509249, 1, 1, 1, 1, 1,
0.300092, -0.03458678, 0.8315338, 1, 1, 1, 1, 1,
0.3002456, -1.495811, 3.754648, 1, 1, 1, 1, 1,
0.3045455, -0.7241709, 1.898037, 1, 1, 1, 1, 1,
0.3073637, -0.4653973, 0.6281319, 1, 1, 1, 1, 1,
0.3077495, -1.270842, 2.220022, 1, 1, 1, 1, 1,
0.3083696, 0.6495797, 1.169577, 1, 1, 1, 1, 1,
0.3106559, 1.373779, -0.889768, 1, 1, 1, 1, 1,
0.3134563, -0.3157835, 2.694664, 1, 1, 1, 1, 1,
0.3186588, 0.5445196, -0.1024622, 1, 1, 1, 1, 1,
0.3203427, -0.1783655, 3.224199, 1, 1, 1, 1, 1,
0.3221934, 0.5741773, -0.7758195, 0, 0, 1, 1, 1,
0.3257229, 0.5267128, 0.364856, 1, 0, 0, 1, 1,
0.3258081, -0.2108015, 3.367157, 1, 0, 0, 1, 1,
0.3344977, 0.1840617, -0.02077318, 1, 0, 0, 1, 1,
0.3399686, 0.3688821, 1.645001, 1, 0, 0, 1, 1,
0.3407401, 1.619096, -0.6889999, 1, 0, 0, 1, 1,
0.3432471, 0.8840689, 1.516841, 0, 0, 0, 1, 1,
0.3454327, -0.2935432, 3.151162, 0, 0, 0, 1, 1,
0.3459977, -3.030108, 4.677606, 0, 0, 0, 1, 1,
0.3460252, -1.042818, 2.276369, 0, 0, 0, 1, 1,
0.3555669, -0.3743473, 0.9445205, 0, 0, 0, 1, 1,
0.3566809, -0.1862135, 2.440264, 0, 0, 0, 1, 1,
0.3666579, -0.5194154, 2.637188, 0, 0, 0, 1, 1,
0.3681078, 1.32971, 0.2275789, 1, 1, 1, 1, 1,
0.3687084, -1.065331, 3.019583, 1, 1, 1, 1, 1,
0.374741, -0.1045337, 1.345792, 1, 1, 1, 1, 1,
0.378783, 0.9597542, -0.7120762, 1, 1, 1, 1, 1,
0.3790946, 1.049852, 1.10883, 1, 1, 1, 1, 1,
0.3805581, -1.146605, 2.115392, 1, 1, 1, 1, 1,
0.3842454, -0.185997, 2.810167, 1, 1, 1, 1, 1,
0.3897542, 0.8265699, -0.5408822, 1, 1, 1, 1, 1,
0.3917588, -1.634962, 2.738258, 1, 1, 1, 1, 1,
0.3957662, 0.3998426, 2.226229, 1, 1, 1, 1, 1,
0.3985663, -0.2180083, 1.695275, 1, 1, 1, 1, 1,
0.4029791, 0.331462, -0.1085785, 1, 1, 1, 1, 1,
0.4046095, -0.8956193, 3.686034, 1, 1, 1, 1, 1,
0.4053298, -0.5987775, 3.859038, 1, 1, 1, 1, 1,
0.4055308, -0.2223795, 1.791363, 1, 1, 1, 1, 1,
0.4080648, -0.09440383, 1.230987, 0, 0, 1, 1, 1,
0.4126085, -0.306717, 2.363246, 1, 0, 0, 1, 1,
0.4197991, -1.829053, 2.830756, 1, 0, 0, 1, 1,
0.419889, 0.2780911, -0.473379, 1, 0, 0, 1, 1,
0.420013, 0.6720533, -0.7641593, 1, 0, 0, 1, 1,
0.4285068, 0.9462818, 1.695838, 1, 0, 0, 1, 1,
0.4297658, 0.7886608, 0.7644037, 0, 0, 0, 1, 1,
0.4328406, -0.5250317, 3.842673, 0, 0, 0, 1, 1,
0.4357787, 0.9980859, 0.2642985, 0, 0, 0, 1, 1,
0.4412106, -1.576654, 4.944455, 0, 0, 0, 1, 1,
0.4441626, -0.2829696, 4.078246, 0, 0, 0, 1, 1,
0.4463138, -0.2921643, 2.717307, 0, 0, 0, 1, 1,
0.4472957, 1.210579, -0.5723772, 0, 0, 0, 1, 1,
0.456459, -1.241761, 4.407092, 1, 1, 1, 1, 1,
0.4585216, 1.228513, 0.4194084, 1, 1, 1, 1, 1,
0.4589635, 0.1450524, 1.664479, 1, 1, 1, 1, 1,
0.4681609, 1.38225, 1.526865, 1, 1, 1, 1, 1,
0.468578, -0.2973712, 1.990354, 1, 1, 1, 1, 1,
0.4693169, -0.08609277, 3.300785, 1, 1, 1, 1, 1,
0.4734896, -0.2100879, -0.1149181, 1, 1, 1, 1, 1,
0.4752725, 1.037621, 1.662126, 1, 1, 1, 1, 1,
0.4798593, -1.600393, 4.419767, 1, 1, 1, 1, 1,
0.4799532, 1.679693, 0.3649607, 1, 1, 1, 1, 1,
0.4803247, 0.9806792, 1.372488, 1, 1, 1, 1, 1,
0.4861541, -0.005112606, 3.828523, 1, 1, 1, 1, 1,
0.486484, 0.01872927, 2.184024, 1, 1, 1, 1, 1,
0.4873812, -1.534304, 3.202132, 1, 1, 1, 1, 1,
0.4917272, -0.3729479, 3.130706, 1, 1, 1, 1, 1,
0.4924033, 0.1920855, 1.678926, 0, 0, 1, 1, 1,
0.493748, 0.9184969, 0.4184243, 1, 0, 0, 1, 1,
0.5008295, 1.224991, 0.7480932, 1, 0, 0, 1, 1,
0.509569, 0.5450121, 0.7002156, 1, 0, 0, 1, 1,
0.5100266, -0.1350639, 1.874623, 1, 0, 0, 1, 1,
0.5125978, 0.6193089, -0.4734874, 1, 0, 0, 1, 1,
0.5157023, 0.3214804, 0.1121815, 0, 0, 0, 1, 1,
0.5203652, 1.610624, -0.6588039, 0, 0, 0, 1, 1,
0.5220391, -1.141122, 2.042241, 0, 0, 0, 1, 1,
0.5220487, 0.4088992, -0.8578165, 0, 0, 0, 1, 1,
0.5248709, -1.804241, 2.410912, 0, 0, 0, 1, 1,
0.5250226, 0.2787051, 0.2191585, 0, 0, 0, 1, 1,
0.5269377, -0.001196076, 0.3384822, 0, 0, 0, 1, 1,
0.5298986, 0.8687611, 3.112611, 1, 1, 1, 1, 1,
0.5325797, 0.3816494, 1.604176, 1, 1, 1, 1, 1,
0.5348056, -0.3871599, 3.210978, 1, 1, 1, 1, 1,
0.5403356, -0.7508939, 1.67686, 1, 1, 1, 1, 1,
0.546597, -0.6876423, 3.205978, 1, 1, 1, 1, 1,
0.5475058, 0.7651604, 0.5680029, 1, 1, 1, 1, 1,
0.5480719, -1.018878, 1.965215, 1, 1, 1, 1, 1,
0.5550991, 0.2987309, 0.5982135, 1, 1, 1, 1, 1,
0.5582408, 0.634227, 0.1626854, 1, 1, 1, 1, 1,
0.5587266, -1.290233, 3.655871, 1, 1, 1, 1, 1,
0.5642946, -1.092628, 1.358872, 1, 1, 1, 1, 1,
0.5650983, 1.098749, 0.3635683, 1, 1, 1, 1, 1,
0.569833, -0.05195101, 1.742968, 1, 1, 1, 1, 1,
0.570823, 0.2948656, 1.744144, 1, 1, 1, 1, 1,
0.5715638, -0.04607841, 2.228708, 1, 1, 1, 1, 1,
0.5759382, 0.2565192, 0.9781684, 0, 0, 1, 1, 1,
0.5773861, 0.3110179, 1.010143, 1, 0, 0, 1, 1,
0.5786363, 1.046418, 1.413162, 1, 0, 0, 1, 1,
0.5789498, -0.5993535, 2.486435, 1, 0, 0, 1, 1,
0.5811259, -0.4163154, 3.008577, 1, 0, 0, 1, 1,
0.5814012, 0.06100583, 1.336539, 1, 0, 0, 1, 1,
0.5824322, 0.1517249, 1.922892, 0, 0, 0, 1, 1,
0.5861925, 0.2518609, 1.546498, 0, 0, 0, 1, 1,
0.5876395, -0.2064289, 1.352362, 0, 0, 0, 1, 1,
0.5903221, -0.2707612, 0.3295877, 0, 0, 0, 1, 1,
0.5930919, -0.519066, 1.418845, 0, 0, 0, 1, 1,
0.6063749, 0.258462, 2.092975, 0, 0, 0, 1, 1,
0.6079254, -1.057768, 1.436696, 0, 0, 0, 1, 1,
0.6086347, -1.172063, 2.108865, 1, 1, 1, 1, 1,
0.6120512, 1.020251, 0.9611759, 1, 1, 1, 1, 1,
0.6125339, 1.346579, 1.272861, 1, 1, 1, 1, 1,
0.6158348, -0.04307557, 2.188126, 1, 1, 1, 1, 1,
0.6191249, -1.020668, 2.755059, 1, 1, 1, 1, 1,
0.6271774, -0.2388349, 1.715844, 1, 1, 1, 1, 1,
0.62964, 0.003225616, 1.29068, 1, 1, 1, 1, 1,
0.6301792, 0.9367465, -0.5943387, 1, 1, 1, 1, 1,
0.632012, 1.821657, 0.2066159, 1, 1, 1, 1, 1,
0.6338428, -1.594813, 4.050639, 1, 1, 1, 1, 1,
0.6414962, 0.7642266, 0.8708019, 1, 1, 1, 1, 1,
0.6434822, -0.2740242, 3.33619, 1, 1, 1, 1, 1,
0.6454713, 0.4606937, 1.004879, 1, 1, 1, 1, 1,
0.6469339, 0.09485842, 2.796134, 1, 1, 1, 1, 1,
0.651644, 0.7455838, 0.2098534, 1, 1, 1, 1, 1,
0.6543867, -0.9921504, 2.633409, 0, 0, 1, 1, 1,
0.654875, 0.4012675, -0.01704556, 1, 0, 0, 1, 1,
0.6610376, -0.2066592, 1.100956, 1, 0, 0, 1, 1,
0.6625106, -2.031314, 1.938942, 1, 0, 0, 1, 1,
0.6630083, 0.9865349, 0.5538816, 1, 0, 0, 1, 1,
0.6667338, -1.311162, 0.9784262, 1, 0, 0, 1, 1,
0.6821371, 0.9256671, 0.417729, 0, 0, 0, 1, 1,
0.6842175, -1.080515, 1.536145, 0, 0, 0, 1, 1,
0.6885976, -1.463372, 5.575782, 0, 0, 0, 1, 1,
0.6939076, 1.303039, 1.594293, 0, 0, 0, 1, 1,
0.6996278, -0.9128938, 3.305915, 0, 0, 0, 1, 1,
0.7055909, -1.073446, 2.692231, 0, 0, 0, 1, 1,
0.708153, -1.754679, 3.615737, 0, 0, 0, 1, 1,
0.7121689, 0.4275669, 1.014235, 1, 1, 1, 1, 1,
0.7138084, -0.7718822, 2.661349, 1, 1, 1, 1, 1,
0.7181422, -0.2751937, 1.511884, 1, 1, 1, 1, 1,
0.7224822, -1.039451, 1.790885, 1, 1, 1, 1, 1,
0.7252089, 0.6177272, 0.7495223, 1, 1, 1, 1, 1,
0.7350826, 0.01308058, 1.05871, 1, 1, 1, 1, 1,
0.7357892, -0.6475933, 3.109828, 1, 1, 1, 1, 1,
0.737401, -0.6906982, 2.110843, 1, 1, 1, 1, 1,
0.7475697, 0.2720462, 0.6901026, 1, 1, 1, 1, 1,
0.7510315, 0.3607822, 1.373624, 1, 1, 1, 1, 1,
0.7511913, -0.9120157, 3.034765, 1, 1, 1, 1, 1,
0.7517645, -0.4969055, 3.653037, 1, 1, 1, 1, 1,
0.7663471, -0.1890092, 2.626923, 1, 1, 1, 1, 1,
0.7894657, -1.052139, 2.049258, 1, 1, 1, 1, 1,
0.7917184, -1.587242, 2.738246, 1, 1, 1, 1, 1,
0.7926133, -0.3369971, 1.098433, 0, 0, 1, 1, 1,
0.8020958, -1.2234, 4.136948, 1, 0, 0, 1, 1,
0.8070867, -0.5044326, 1.939894, 1, 0, 0, 1, 1,
0.8118626, -0.1014129, 1.750556, 1, 0, 0, 1, 1,
0.8145384, 0.2584561, 0.3122058, 1, 0, 0, 1, 1,
0.8178389, 0.2669058, 0.06554521, 1, 0, 0, 1, 1,
0.8215188, 0.35974, 0.6637496, 0, 0, 0, 1, 1,
0.8238141, 0.1125259, 0.4455082, 0, 0, 0, 1, 1,
0.8313365, -0.8584276, 3.188848, 0, 0, 0, 1, 1,
0.8359726, 0.4383804, 2.712602, 0, 0, 0, 1, 1,
0.8397289, -0.2518576, 2.646572, 0, 0, 0, 1, 1,
0.8420007, -0.5857694, 3.536674, 0, 0, 0, 1, 1,
0.8431895, -0.08678471, 1.915164, 0, 0, 0, 1, 1,
0.8445322, -0.6626089, 4.255901, 1, 1, 1, 1, 1,
0.8448438, 0.1889939, 0.2458787, 1, 1, 1, 1, 1,
0.8456182, 1.555053, -0.1829206, 1, 1, 1, 1, 1,
0.8475558, -0.8956335, 2.73592, 1, 1, 1, 1, 1,
0.8536798, 1.050092, 0.693103, 1, 1, 1, 1, 1,
0.8549216, 0.01179772, 2.128652, 1, 1, 1, 1, 1,
0.8581974, 0.716809, -0.7102204, 1, 1, 1, 1, 1,
0.8614612, 0.3211654, 1.832742, 1, 1, 1, 1, 1,
0.8677245, -2.273106, 3.635727, 1, 1, 1, 1, 1,
0.8775096, 1.74542, -0.1775107, 1, 1, 1, 1, 1,
0.8890401, -0.1972772, 1.31438, 1, 1, 1, 1, 1,
0.8907621, 0.6108336, -2.327396, 1, 1, 1, 1, 1,
0.891695, 1.153389, 3.947182, 1, 1, 1, 1, 1,
0.8972986, -0.5521089, 2.726467, 1, 1, 1, 1, 1,
0.9001523, 0.3586138, 1.611287, 1, 1, 1, 1, 1,
0.9015802, -0.406939, 0.7625872, 0, 0, 1, 1, 1,
0.9037789, -1.742862, 4.209986, 1, 0, 0, 1, 1,
0.9061881, 0.04232152, 1.723458, 1, 0, 0, 1, 1,
0.9071837, 1.37177, 0.4887854, 1, 0, 0, 1, 1,
0.9089458, -1.830456, 2.488004, 1, 0, 0, 1, 1,
0.913875, -1.214039, 2.821042, 1, 0, 0, 1, 1,
0.9211106, -0.4428569, 1.962226, 0, 0, 0, 1, 1,
0.9231161, 0.5651166, 1.118516, 0, 0, 0, 1, 1,
0.9232038, -1.812332, 2.547955, 0, 0, 0, 1, 1,
0.9235535, -2.744576, 1.047371, 0, 0, 0, 1, 1,
0.9260002, -0.5749938, 3.446132, 0, 0, 0, 1, 1,
0.9329439, 0.3959805, -0.4808581, 0, 0, 0, 1, 1,
0.9387028, -0.4284302, 3.321783, 0, 0, 0, 1, 1,
0.9452515, 0.06311233, 1.650631, 1, 1, 1, 1, 1,
0.948948, -1.148582, 1.610335, 1, 1, 1, 1, 1,
0.9586533, -0.6713871, 2.34748, 1, 1, 1, 1, 1,
0.9741277, -0.984647, 1.79895, 1, 1, 1, 1, 1,
0.9760969, 0.6563404, 0.6132892, 1, 1, 1, 1, 1,
0.983114, 0.006496902, 1.055946, 1, 1, 1, 1, 1,
0.9854566, -1.17421, 2.531724, 1, 1, 1, 1, 1,
0.99313, 0.2888328, 0.615825, 1, 1, 1, 1, 1,
0.9934373, 1.123811, 0.07181665, 1, 1, 1, 1, 1,
0.9974278, 0.173701, -0.3227267, 1, 1, 1, 1, 1,
0.9976476, 2.70647, -0.8034663, 1, 1, 1, 1, 1,
1.008031, -0.9694797, 0.7828366, 1, 1, 1, 1, 1,
1.008261, -1.176984, 0.3924416, 1, 1, 1, 1, 1,
1.012817, 0.1990748, 0.2326473, 1, 1, 1, 1, 1,
1.016131, 1.330421, 3.408299, 1, 1, 1, 1, 1,
1.016745, 0.1609067, 1.672372, 0, 0, 1, 1, 1,
1.016897, 0.8579262, 1.360495, 1, 0, 0, 1, 1,
1.017233, 0.4464144, 0.841359, 1, 0, 0, 1, 1,
1.017558, 1.109046, 0.6129622, 1, 0, 0, 1, 1,
1.017767, -0.1043449, 2.890856, 1, 0, 0, 1, 1,
1.020878, 0.7945461, 1.807336, 1, 0, 0, 1, 1,
1.02739, -1.389138, 2.911319, 0, 0, 0, 1, 1,
1.029268, -0.2493188, 2.643977, 0, 0, 0, 1, 1,
1.032857, -1.530869, 3.258116, 0, 0, 0, 1, 1,
1.033974, 0.4396077, 2.326542, 0, 0, 0, 1, 1,
1.044683, -0.5062802, 1.978934, 0, 0, 0, 1, 1,
1.059342, 0.3772464, 0.2796125, 0, 0, 0, 1, 1,
1.060432, -0.6709389, 0.9679932, 0, 0, 0, 1, 1,
1.074854, -0.002093652, 2.329159, 1, 1, 1, 1, 1,
1.07712, -0.4290696, 2.871831, 1, 1, 1, 1, 1,
1.081088, -1.90425, 2.150176, 1, 1, 1, 1, 1,
1.082887, 1.628313, 0.1386016, 1, 1, 1, 1, 1,
1.086832, -0.3202569, 2.339092, 1, 1, 1, 1, 1,
1.088766, -2.51866, 2.243068, 1, 1, 1, 1, 1,
1.094836, -2.022391, 3.849937, 1, 1, 1, 1, 1,
1.097057, -1.723985, 1.814564, 1, 1, 1, 1, 1,
1.100958, -0.1668621, 1.014918, 1, 1, 1, 1, 1,
1.105211, -1.718851, 2.020772, 1, 1, 1, 1, 1,
1.109745, 0.7974303, 1.091178, 1, 1, 1, 1, 1,
1.110459, -2.323733, 1.313279, 1, 1, 1, 1, 1,
1.117607, 1.196522, 0.8559089, 1, 1, 1, 1, 1,
1.119731, -0.1196863, 1.975305, 1, 1, 1, 1, 1,
1.124977, 1.69878, 0.4471949, 1, 1, 1, 1, 1,
1.125132, 1.103198, -1.569212, 0, 0, 1, 1, 1,
1.136501, -0.2001582, 0.9525985, 1, 0, 0, 1, 1,
1.145514, 1.495167, 2.280044, 1, 0, 0, 1, 1,
1.148393, 0.613741, 0.3734654, 1, 0, 0, 1, 1,
1.151397, 0.516102, 0.5226697, 1, 0, 0, 1, 1,
1.15263, 0.4156078, 2.23069, 1, 0, 0, 1, 1,
1.154153, -1.20812, 1.770759, 0, 0, 0, 1, 1,
1.154584, 1.168176, 1.648563, 0, 0, 0, 1, 1,
1.168977, -0.7644296, 1.744094, 0, 0, 0, 1, 1,
1.171495, -1.974557, 2.187361, 0, 0, 0, 1, 1,
1.173836, 0.742399, 1.444916, 0, 0, 0, 1, 1,
1.180353, -1.615771, 2.838996, 0, 0, 0, 1, 1,
1.188617, -0.5751117, 2.851656, 0, 0, 0, 1, 1,
1.195333, 0.4390993, 1.499763, 1, 1, 1, 1, 1,
1.197286, 0.5517642, 2.146765, 1, 1, 1, 1, 1,
1.215969, -1.24749, 1.236245, 1, 1, 1, 1, 1,
1.219373, -1.003586, 1.74793, 1, 1, 1, 1, 1,
1.219649, 1.019806, 0.2003777, 1, 1, 1, 1, 1,
1.221023, 1.294128, -0.7991984, 1, 1, 1, 1, 1,
1.234769, -1.215391, 3.635123, 1, 1, 1, 1, 1,
1.239835, 0.513441, 2.94098, 1, 1, 1, 1, 1,
1.239983, -0.1023453, 0.5273979, 1, 1, 1, 1, 1,
1.246522, -0.6832595, 2.26573, 1, 1, 1, 1, 1,
1.248415, 0.4367705, 1.20155, 1, 1, 1, 1, 1,
1.252258, -0.02367831, 0.8305696, 1, 1, 1, 1, 1,
1.255002, 1.049088, 1.085704, 1, 1, 1, 1, 1,
1.262442, 0.1918477, 2.885582, 1, 1, 1, 1, 1,
1.280164, 0.4386104, 0.8520399, 1, 1, 1, 1, 1,
1.282075, 0.3784997, 0.1240951, 0, 0, 1, 1, 1,
1.286754, 1.971696, -1.231584, 1, 0, 0, 1, 1,
1.301822, -0.85434, 1.815254, 1, 0, 0, 1, 1,
1.306581, -0.5707522, 2.142519, 1, 0, 0, 1, 1,
1.323328, 1.084635, 0.2197867, 1, 0, 0, 1, 1,
1.331536, -0.6548875, -0.7211553, 1, 0, 0, 1, 1,
1.346582, 0.9408001, 1.185785, 0, 0, 0, 1, 1,
1.360094, 0.476055, 1.079972, 0, 0, 0, 1, 1,
1.403237, -0.3122291, 1.947624, 0, 0, 0, 1, 1,
1.406993, 0.8783666, 1.590917, 0, 0, 0, 1, 1,
1.407993, 0.2834882, 0.7627876, 0, 0, 0, 1, 1,
1.409587, 0.5239368, 0.9797024, 0, 0, 0, 1, 1,
1.41277, 0.3751131, 1.397385, 0, 0, 0, 1, 1,
1.417633, -2.195067, 3.609146, 1, 1, 1, 1, 1,
1.431297, 0.1693702, 1.238844, 1, 1, 1, 1, 1,
1.438722, -0.7073979, 2.711512, 1, 1, 1, 1, 1,
1.440348, 0.3560639, 1.020595, 1, 1, 1, 1, 1,
1.442099, 1.306869, 0.9571632, 1, 1, 1, 1, 1,
1.442264, -0.2063807, 0.667821, 1, 1, 1, 1, 1,
1.446893, 1.516454, 0.9325346, 1, 1, 1, 1, 1,
1.461955, 0.7810891, 0.6626326, 1, 1, 1, 1, 1,
1.468682, 0.2838957, 0.8408885, 1, 1, 1, 1, 1,
1.470238, -0.6355584, 0.4755692, 1, 1, 1, 1, 1,
1.50492, -1.122391, 2.632246, 1, 1, 1, 1, 1,
1.516455, -1.162975, 2.889361, 1, 1, 1, 1, 1,
1.518462, 0.1505199, 1.154952, 1, 1, 1, 1, 1,
1.521214, -1.447901, 2.844492, 1, 1, 1, 1, 1,
1.524019, 0.03900062, 2.185712, 1, 1, 1, 1, 1,
1.559803, 0.5287062, -0.2175389, 0, 0, 1, 1, 1,
1.561917, -0.8886157, 1.122597, 1, 0, 0, 1, 1,
1.578384, 0.3202576, -1.308702, 1, 0, 0, 1, 1,
1.584455, -0.1405918, 2.243412, 1, 0, 0, 1, 1,
1.59734, -1.568472, 2.864537, 1, 0, 0, 1, 1,
1.603747, -0.7898367, 3.031905, 1, 0, 0, 1, 1,
1.610683, 1.611125, 0.3079774, 0, 0, 0, 1, 1,
1.61508, -1.164143, 2.69377, 0, 0, 0, 1, 1,
1.62148, 0.6250781, 1.200556, 0, 0, 0, 1, 1,
1.634471, 0.3715559, 0.9009653, 0, 0, 0, 1, 1,
1.634683, -1.179501, 2.873432, 0, 0, 0, 1, 1,
1.638556, 1.2919, 1.264647, 0, 0, 0, 1, 1,
1.646456, -0.03108124, 0.7910284, 0, 0, 0, 1, 1,
1.647726, 2.772453, 1.280316, 1, 1, 1, 1, 1,
1.650115, -0.1946006, -0.3493165, 1, 1, 1, 1, 1,
1.659281, 0.07508519, 2.429602, 1, 1, 1, 1, 1,
1.678542, -0.5224581, 0.8986584, 1, 1, 1, 1, 1,
1.678954, 0.8198583, 0.5696102, 1, 1, 1, 1, 1,
1.686539, -1.889603, 1.935841, 1, 1, 1, 1, 1,
1.691888, -0.7779999, 3.17466, 1, 1, 1, 1, 1,
1.703985, -0.6926367, 3.54615, 1, 1, 1, 1, 1,
1.703997, -0.784051, 3.089501, 1, 1, 1, 1, 1,
1.705654, -0.3450673, 1.977124, 1, 1, 1, 1, 1,
1.71012, 0.8641269, 1.678339, 1, 1, 1, 1, 1,
1.71138, -1.539437, 2.551248, 1, 1, 1, 1, 1,
1.730074, 0.4255519, 0.7683752, 1, 1, 1, 1, 1,
1.750162, 0.5171383, 1.737731, 1, 1, 1, 1, 1,
1.75812, 0.6280971, 2.033684, 1, 1, 1, 1, 1,
1.758323, 0.6080763, 1.13887, 0, 0, 1, 1, 1,
1.760947, 1.419056, 0.9859241, 1, 0, 0, 1, 1,
1.771379, 0.2651907, 0.5459021, 1, 0, 0, 1, 1,
1.811066, -0.1851492, 0.9392341, 1, 0, 0, 1, 1,
1.816466, -0.4454722, 3.551099, 1, 0, 0, 1, 1,
1.819084, -0.6413044, 3.198583, 1, 0, 0, 1, 1,
1.824203, 0.07123663, 2.04022, 0, 0, 0, 1, 1,
1.835202, -1.418901, 1.86519, 0, 0, 0, 1, 1,
1.839424, -0.6527416, 0.7494289, 0, 0, 0, 1, 1,
1.846652, 1.422661, 1.096393, 0, 0, 0, 1, 1,
1.852237, -0.8323379, 1.56102, 0, 0, 0, 1, 1,
1.883217, -0.5039678, 1.984413, 0, 0, 0, 1, 1,
1.886377, 0.3885656, 1.804701, 0, 0, 0, 1, 1,
1.904178, -0.230834, 1.810936, 1, 1, 1, 1, 1,
1.909045, 1.014433, 0.4201803, 1, 1, 1, 1, 1,
1.921443, 0.1797854, 0.1511182, 1, 1, 1, 1, 1,
1.92727, 0.224307, 1.313511, 1, 1, 1, 1, 1,
1.928936, 2.159262, 1.037057, 1, 1, 1, 1, 1,
1.939912, 1.263372, 1.996476, 1, 1, 1, 1, 1,
1.945725, 1.054798, 3.35813, 1, 1, 1, 1, 1,
1.96445, 0.8612145, 0.9093927, 1, 1, 1, 1, 1,
1.964802, -0.4675926, 2.823841, 1, 1, 1, 1, 1,
2.000969, 0.5588694, 2.374062, 1, 1, 1, 1, 1,
2.001791, 1.977388, -0.9488733, 1, 1, 1, 1, 1,
2.014041, -1.081963, 2.298834, 1, 1, 1, 1, 1,
2.032461, 0.4575292, 1.607087, 1, 1, 1, 1, 1,
2.037287, -0.0920319, 0.8740026, 1, 1, 1, 1, 1,
2.074836, -1.302656, 1.964434, 1, 1, 1, 1, 1,
2.096399, -0.554754, 1.578953, 0, 0, 1, 1, 1,
2.097507, -0.08670877, 1.616929, 1, 0, 0, 1, 1,
2.108473, -0.5351875, 1.473507, 1, 0, 0, 1, 1,
2.134845, -0.4423131, 1.948677, 1, 0, 0, 1, 1,
2.189347, -0.5727075, 1.19539, 1, 0, 0, 1, 1,
2.219146, 0.6102986, 1.908314, 1, 0, 0, 1, 1,
2.307967, 0.3478386, 3.934401, 0, 0, 0, 1, 1,
2.352007, -0.8137653, 1.883826, 0, 0, 0, 1, 1,
2.376863, 1.038175, 1.164768, 0, 0, 0, 1, 1,
2.379673, -1.151107, 1.734179, 0, 0, 0, 1, 1,
2.454833, 0.08219951, 1.331915, 0, 0, 0, 1, 1,
2.479425, 1.187036, 2.402362, 0, 0, 0, 1, 1,
2.594954, -0.839874, 1.394707, 0, 0, 0, 1, 1,
2.641142, -0.7728308, 2.136573, 1, 1, 1, 1, 1,
2.705052, 0.05415974, 1.941166, 1, 1, 1, 1, 1,
2.737577, -0.4140701, 1.573782, 1, 1, 1, 1, 1,
2.97525, 0.02648849, 2.280077, 1, 1, 1, 1, 1,
3.04262, 1.644342, -0.6153966, 1, 1, 1, 1, 1,
3.067598, 1.929066, 1.850699, 1, 1, 1, 1, 1,
3.102986, -0.4983141, 1.113878, 1, 1, 1, 1, 1
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
var radius = 9.722085;
var distance = 34.14841;
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
mvMatrix.translate( -0.05942476, 0.2531879, 0.07839656 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.14841);
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
