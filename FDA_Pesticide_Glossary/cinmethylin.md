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
-3.177973, 0.5757906, -3.034397, 1, 0, 0, 1,
-2.815778, 2.609823, -1.024245, 1, 0.007843138, 0, 1,
-2.642161, -0.561653, -1.823622, 1, 0.01176471, 0, 1,
-2.63388, 1.846859, -1.132349, 1, 0.01960784, 0, 1,
-2.565849, -0.5178174, -3.009387, 1, 0.02352941, 0, 1,
-2.548494, 0.8430659, -1.67809, 1, 0.03137255, 0, 1,
-2.350347, -1.694312, -1.624488, 1, 0.03529412, 0, 1,
-2.197553, 0.1358378, -1.688398, 1, 0.04313726, 0, 1,
-2.09155, -0.03235512, -1.470394, 1, 0.04705882, 0, 1,
-2.089913, -0.1962476, -2.997964, 1, 0.05490196, 0, 1,
-2.064839, -0.1375784, -2.168629, 1, 0.05882353, 0, 1,
-2.030025, -0.8157408, -1.242472, 1, 0.06666667, 0, 1,
-2.000101, -0.07129684, -1.529447, 1, 0.07058824, 0, 1,
-1.990872, -0.2077293, -1.888624, 1, 0.07843138, 0, 1,
-1.976969, 0.5626374, -0.7523001, 1, 0.08235294, 0, 1,
-1.976728, 0.4006968, -1.026635, 1, 0.09019608, 0, 1,
-1.974605, 0.1265948, -2.369061, 1, 0.09411765, 0, 1,
-1.926508, -1.525768, -3.631407, 1, 0.1019608, 0, 1,
-1.883375, -0.5140945, -2.881011, 1, 0.1098039, 0, 1,
-1.879669, -1.098032, -2.10067, 1, 0.1137255, 0, 1,
-1.876448, 1.451935, -2.165424, 1, 0.1215686, 0, 1,
-1.869445, -0.2518207, -1.101764, 1, 0.1254902, 0, 1,
-1.868397, 1.16547, -1.886855, 1, 0.1333333, 0, 1,
-1.845195, -0.06304159, -2.059553, 1, 0.1372549, 0, 1,
-1.839655, -1.587502, -1.678684, 1, 0.145098, 0, 1,
-1.826575, -1.092674, -2.440395, 1, 0.1490196, 0, 1,
-1.819504, 0.5588881, -0.4631523, 1, 0.1568628, 0, 1,
-1.815844, -1.904944, 0.244205, 1, 0.1607843, 0, 1,
-1.815299, -0.3758075, -2.402975, 1, 0.1686275, 0, 1,
-1.795113, 0.04657502, -0.8481022, 1, 0.172549, 0, 1,
-1.782597, 0.7611007, -1.707061, 1, 0.1803922, 0, 1,
-1.775167, -1.350393, -2.186992, 1, 0.1843137, 0, 1,
-1.764395, 2.326724, -0.5394748, 1, 0.1921569, 0, 1,
-1.760888, -0.4687834, -2.337353, 1, 0.1960784, 0, 1,
-1.755339, 0.183898, -0.2383483, 1, 0.2039216, 0, 1,
-1.755051, -1.57854, -2.958522, 1, 0.2117647, 0, 1,
-1.750926, -0.8633111, -1.994666, 1, 0.2156863, 0, 1,
-1.750499, 0.5044563, -2.853603, 1, 0.2235294, 0, 1,
-1.744761, 0.3351031, -0.02178911, 1, 0.227451, 0, 1,
-1.744301, -1.684481, -1.766972, 1, 0.2352941, 0, 1,
-1.718322, -1.458031, -4.446246, 1, 0.2392157, 0, 1,
-1.717145, 0.3823232, -1.268096, 1, 0.2470588, 0, 1,
-1.712924, 0.05526796, -2.666866, 1, 0.2509804, 0, 1,
-1.702397, 0.5522861, -0.7300749, 1, 0.2588235, 0, 1,
-1.700087, -0.07063414, -1.056618, 1, 0.2627451, 0, 1,
-1.68686, -0.5972582, -2.456475, 1, 0.2705882, 0, 1,
-1.680957, -0.8166735, -0.7621334, 1, 0.2745098, 0, 1,
-1.673885, -0.653362, -2.605041, 1, 0.282353, 0, 1,
-1.652578, 0.9414952, -1.481085, 1, 0.2862745, 0, 1,
-1.644107, -1.826683, -2.531789, 1, 0.2941177, 0, 1,
-1.64089, 0.349858, -1.217439, 1, 0.3019608, 0, 1,
-1.630038, 0.7092323, 0.1218374, 1, 0.3058824, 0, 1,
-1.628839, 1.911034, -0.6042911, 1, 0.3137255, 0, 1,
-1.60105, 1.552299, -0.1316229, 1, 0.3176471, 0, 1,
-1.593141, -0.01063362, -0.7885701, 1, 0.3254902, 0, 1,
-1.579808, -1.051599, -2.677014, 1, 0.3294118, 0, 1,
-1.575782, 1.141532, 0.03996618, 1, 0.3372549, 0, 1,
-1.569737, 0.388322, -2.150942, 1, 0.3411765, 0, 1,
-1.564761, -0.164618, -1.267549, 1, 0.3490196, 0, 1,
-1.56432, 1.740279, -1.079756, 1, 0.3529412, 0, 1,
-1.562421, -0.2827253, -1.227989, 1, 0.3607843, 0, 1,
-1.560807, -2.694227, -3.040205, 1, 0.3647059, 0, 1,
-1.558901, -0.2218422, -1.244017, 1, 0.372549, 0, 1,
-1.515396, 1.130956, -2.04295, 1, 0.3764706, 0, 1,
-1.512237, -2.278744, -2.885131, 1, 0.3843137, 0, 1,
-1.499253, -0.4575624, -1.871296, 1, 0.3882353, 0, 1,
-1.497921, -0.2381383, -1.716267, 1, 0.3960784, 0, 1,
-1.488667, -1.303648, -1.395136, 1, 0.4039216, 0, 1,
-1.488591, 0.4378071, -1.277354, 1, 0.4078431, 0, 1,
-1.485885, -0.02800188, -0.7078156, 1, 0.4156863, 0, 1,
-1.473666, 1.366989, -2.223196, 1, 0.4196078, 0, 1,
-1.46814, 0.2637978, -1.895079, 1, 0.427451, 0, 1,
-1.46738, -0.428943, -1.803593, 1, 0.4313726, 0, 1,
-1.463829, -0.6449312, -1.213188, 1, 0.4392157, 0, 1,
-1.462093, 1.091115, -0.43878, 1, 0.4431373, 0, 1,
-1.451372, 0.08418355, -0.7889521, 1, 0.4509804, 0, 1,
-1.44785, 1.472438, 0.008084117, 1, 0.454902, 0, 1,
-1.432359, -0.5307881, -1.866495, 1, 0.4627451, 0, 1,
-1.424966, 0.1710486, -1.668043, 1, 0.4666667, 0, 1,
-1.422877, -0.4919384, -2.110863, 1, 0.4745098, 0, 1,
-1.422291, -0.4574545, -0.8963372, 1, 0.4784314, 0, 1,
-1.418534, -1.848129, -2.30064, 1, 0.4862745, 0, 1,
-1.417938, 1.083649, -1.311103, 1, 0.4901961, 0, 1,
-1.414072, 0.4075218, -0.8949772, 1, 0.4980392, 0, 1,
-1.413078, -0.1972955, -1.405394, 1, 0.5058824, 0, 1,
-1.411314, -1.504211, -2.697336, 1, 0.509804, 0, 1,
-1.405347, -0.3909085, -2.535582, 1, 0.5176471, 0, 1,
-1.404254, -1.262446, -1.231224, 1, 0.5215687, 0, 1,
-1.403507, 0.7992612, -0.3332912, 1, 0.5294118, 0, 1,
-1.40297, -0.9889161, -1.171318, 1, 0.5333334, 0, 1,
-1.396222, -1.141847, -3.003339, 1, 0.5411765, 0, 1,
-1.392175, -0.357333, -3.615733, 1, 0.5450981, 0, 1,
-1.391772, -0.1490293, -2.160339, 1, 0.5529412, 0, 1,
-1.388269, 0.1163307, -0.5481725, 1, 0.5568628, 0, 1,
-1.381588, 1.798122, -0.9581154, 1, 0.5647059, 0, 1,
-1.360381, 1.083212, -1.782384, 1, 0.5686275, 0, 1,
-1.354902, 1.218271, 0.008883, 1, 0.5764706, 0, 1,
-1.350183, 0.7720405, -1.277129, 1, 0.5803922, 0, 1,
-1.345024, -0.05015257, -1.268582, 1, 0.5882353, 0, 1,
-1.342517, -1.357541, -4.631445, 1, 0.5921569, 0, 1,
-1.334275, -0.6802379, -0.8988997, 1, 0.6, 0, 1,
-1.333855, -0.3782084, -3.210499, 1, 0.6078432, 0, 1,
-1.333657, 0.1111743, -2.646456, 1, 0.6117647, 0, 1,
-1.324797, -0.4790407, -2.256004, 1, 0.6196079, 0, 1,
-1.310891, 0.08796219, -0.6392954, 1, 0.6235294, 0, 1,
-1.303801, -0.3878287, -2.94439, 1, 0.6313726, 0, 1,
-1.300156, -0.6222379, -3.446656, 1, 0.6352941, 0, 1,
-1.297109, 0.2638699, -2.757192, 1, 0.6431373, 0, 1,
-1.293844, -1.0302, -1.293342, 1, 0.6470588, 0, 1,
-1.283832, -0.3500901, -1.148893, 1, 0.654902, 0, 1,
-1.2832, -1.617234, -2.449831, 1, 0.6588235, 0, 1,
-1.278486, 0.6040556, -1.920886, 1, 0.6666667, 0, 1,
-1.27642, -0.6639386, -1.464969, 1, 0.6705883, 0, 1,
-1.274725, 0.2700652, -2.440357, 1, 0.6784314, 0, 1,
-1.259808, 0.510805, -1.058594, 1, 0.682353, 0, 1,
-1.255173, -0.2833378, -1.923316, 1, 0.6901961, 0, 1,
-1.238392, 0.534965, -2.12832, 1, 0.6941177, 0, 1,
-1.235429, 0.9549389, 0.5321743, 1, 0.7019608, 0, 1,
-1.231133, 0.9189186, 0.5000789, 1, 0.7098039, 0, 1,
-1.222157, -2.065071, -2.966635, 1, 0.7137255, 0, 1,
-1.2207, -0.1566964, -1.932887, 1, 0.7215686, 0, 1,
-1.219511, 0.8007105, -1.1473, 1, 0.7254902, 0, 1,
-1.199945, 0.608486, 0.3984611, 1, 0.7333333, 0, 1,
-1.196685, 0.1043302, -1.569508, 1, 0.7372549, 0, 1,
-1.19015, -0.88405, -0.9967979, 1, 0.7450981, 0, 1,
-1.187532, 0.5655448, -0.9353796, 1, 0.7490196, 0, 1,
-1.183841, 0.6586576, -1.966208, 1, 0.7568628, 0, 1,
-1.175657, -1.046441, -2.081247, 1, 0.7607843, 0, 1,
-1.17558, -0.3052772, -2.205396, 1, 0.7686275, 0, 1,
-1.170962, 1.250984, -0.5236772, 1, 0.772549, 0, 1,
-1.167133, 0.03592442, -3.231023, 1, 0.7803922, 0, 1,
-1.161077, -0.8426501, -2.547023, 1, 0.7843137, 0, 1,
-1.158515, -1.386703, -4.263001, 1, 0.7921569, 0, 1,
-1.155856, -0.6015402, -2.402436, 1, 0.7960784, 0, 1,
-1.147818, 0.7358109, -1.012308, 1, 0.8039216, 0, 1,
-1.144698, 0.4399685, -1.141422, 1, 0.8117647, 0, 1,
-1.135515, 0.1705246, -1.973598, 1, 0.8156863, 0, 1,
-1.131215, 1.968585, -0.8132784, 1, 0.8235294, 0, 1,
-1.126056, -1.704804, -2.833774, 1, 0.827451, 0, 1,
-1.119779, 0.2524161, -0.01048377, 1, 0.8352941, 0, 1,
-1.114162, -0.7417972, -3.220618, 1, 0.8392157, 0, 1,
-1.109334, -0.1312728, -0.01338604, 1, 0.8470588, 0, 1,
-1.103838, -0.8882576, -2.589635, 1, 0.8509804, 0, 1,
-1.100097, -0.1371063, -2.614072, 1, 0.8588235, 0, 1,
-1.097784, 0.9908144, -1.334627, 1, 0.8627451, 0, 1,
-1.095947, 2.135567, -0.7302831, 1, 0.8705882, 0, 1,
-1.093097, 0.1502378, -2.448026, 1, 0.8745098, 0, 1,
-1.092494, 0.1891247, 0.5074297, 1, 0.8823529, 0, 1,
-1.088839, -0.8628173, -4.336601, 1, 0.8862745, 0, 1,
-1.080678, 0.9548485, -0.9511674, 1, 0.8941177, 0, 1,
-1.070443, -0.9851294, -1.496393, 1, 0.8980392, 0, 1,
-1.062663, 1.537046, -0.3211945, 1, 0.9058824, 0, 1,
-1.054422, -1.025891, -2.176419, 1, 0.9137255, 0, 1,
-1.051077, -0.9077071, -2.974836, 1, 0.9176471, 0, 1,
-1.045792, -0.3006575, -2.29071, 1, 0.9254902, 0, 1,
-1.044807, 1.824531, -0.5294264, 1, 0.9294118, 0, 1,
-1.03328, 0.984461, -0.4483774, 1, 0.9372549, 0, 1,
-1.03041, -0.817972, 1.094503, 1, 0.9411765, 0, 1,
-1.029513, -0.00775471, -0.3858261, 1, 0.9490196, 0, 1,
-1.028305, 0.3306685, -0.6078156, 1, 0.9529412, 0, 1,
-1.017794, 1.360432, 0.5336717, 1, 0.9607843, 0, 1,
-1.006953, -0.4424122, -1.834876, 1, 0.9647059, 0, 1,
-1.005947, -0.4967084, -0.5318831, 1, 0.972549, 0, 1,
-1.00389, 0.08121875, -0.9813731, 1, 0.9764706, 0, 1,
-1.001918, -0.2260808, -2.036726, 1, 0.9843137, 0, 1,
-1.001619, 0.7998084, -1.636164, 1, 0.9882353, 0, 1,
-0.9912297, -0.5314834, -1.964407, 1, 0.9960784, 0, 1,
-0.9899575, -0.2878673, -3.337327, 0.9960784, 1, 0, 1,
-0.9898, 2.051878, 0.8534468, 0.9921569, 1, 0, 1,
-0.9816754, 1.587091, -1.738808, 0.9843137, 1, 0, 1,
-0.9802706, 0.6410509, -0.7423905, 0.9803922, 1, 0, 1,
-0.9757863, 0.8744268, -0.5899705, 0.972549, 1, 0, 1,
-0.9755886, -0.4974689, -1.885877, 0.9686275, 1, 0, 1,
-0.973536, 0.8692731, 0.0692317, 0.9607843, 1, 0, 1,
-0.9552718, -0.314527, -0.3855637, 0.9568627, 1, 0, 1,
-0.9461064, -1.798432, -3.089259, 0.9490196, 1, 0, 1,
-0.9389378, -2.457564, -4.737069, 0.945098, 1, 0, 1,
-0.9377743, 0.4978027, -1.967629, 0.9372549, 1, 0, 1,
-0.9374644, -1.590122, -3.650647, 0.9333333, 1, 0, 1,
-0.9372867, 2.355262, -1.409911, 0.9254902, 1, 0, 1,
-0.936736, -2.026274, -1.544617, 0.9215686, 1, 0, 1,
-0.9274099, -0.3045405, -2.676539, 0.9137255, 1, 0, 1,
-0.9259036, -0.960485, -3.131197, 0.9098039, 1, 0, 1,
-0.9227023, -0.3577343, -2.536745, 0.9019608, 1, 0, 1,
-0.9224521, 0.1074144, -0.3459708, 0.8941177, 1, 0, 1,
-0.9156319, 0.5746818, -0.7987284, 0.8901961, 1, 0, 1,
-0.9095441, 0.2243443, -2.097858, 0.8823529, 1, 0, 1,
-0.9082801, -0.5554429, -1.444369, 0.8784314, 1, 0, 1,
-0.9068369, -0.3728504, -1.950502, 0.8705882, 1, 0, 1,
-0.9044702, -0.8213785, 0.1573207, 0.8666667, 1, 0, 1,
-0.8926063, -0.01551664, -1.058381, 0.8588235, 1, 0, 1,
-0.8898119, -0.9302859, -3.787915, 0.854902, 1, 0, 1,
-0.8844134, 0.7380271, -1.241748, 0.8470588, 1, 0, 1,
-0.8798684, -1.025178, -1.983272, 0.8431373, 1, 0, 1,
-0.8754061, -0.1746829, -2.289162, 0.8352941, 1, 0, 1,
-0.8733431, 0.1270994, -1.934234, 0.8313726, 1, 0, 1,
-0.8728733, 0.4712149, -2.697795, 0.8235294, 1, 0, 1,
-0.8723896, 0.1470191, -1.234553, 0.8196079, 1, 0, 1,
-0.8707594, -2.033951, -2.01524, 0.8117647, 1, 0, 1,
-0.8610616, 1.447548, -0.676595, 0.8078431, 1, 0, 1,
-0.8506256, 0.820933, -1.187622, 0.8, 1, 0, 1,
-0.8505465, -0.9409636, -2.145422, 0.7921569, 1, 0, 1,
-0.8407063, -0.5943593, -0.6704776, 0.7882353, 1, 0, 1,
-0.8314081, 1.165063, 0.3226089, 0.7803922, 1, 0, 1,
-0.8290195, -0.06392673, -2.285279, 0.7764706, 1, 0, 1,
-0.8250966, -1.237408, -0.5450788, 0.7686275, 1, 0, 1,
-0.8195467, -0.8833823, -1.664943, 0.7647059, 1, 0, 1,
-0.8108498, -0.3880428, -2.399023, 0.7568628, 1, 0, 1,
-0.8062817, 0.5056126, -0.5135856, 0.7529412, 1, 0, 1,
-0.8054919, -0.3474731, -3.142589, 0.7450981, 1, 0, 1,
-0.8051711, 0.08811535, -2.777063, 0.7411765, 1, 0, 1,
-0.8022497, -0.4700322, -5.002267, 0.7333333, 1, 0, 1,
-0.7927656, -0.2231427, -1.705866, 0.7294118, 1, 0, 1,
-0.7841915, 0.08088206, -1.61399, 0.7215686, 1, 0, 1,
-0.7823524, -0.6090113, 0.1168066, 0.7176471, 1, 0, 1,
-0.7758928, 0.4105076, -0.2499854, 0.7098039, 1, 0, 1,
-0.7758583, 1.40068, -1.055213, 0.7058824, 1, 0, 1,
-0.7756081, 2.019298, -1.244279, 0.6980392, 1, 0, 1,
-0.7731661, -1.100258, -1.345935, 0.6901961, 1, 0, 1,
-0.7686925, 1.939075, -1.379974, 0.6862745, 1, 0, 1,
-0.7656388, -1.274758, -3.550365, 0.6784314, 1, 0, 1,
-0.7634698, 0.2835039, -2.458604, 0.6745098, 1, 0, 1,
-0.7563281, 0.7906513, 0.1017632, 0.6666667, 1, 0, 1,
-0.7553006, 0.9592346, -0.3730561, 0.6627451, 1, 0, 1,
-0.7491117, 0.002553737, 0.3057967, 0.654902, 1, 0, 1,
-0.7472584, -2.322888, -1.83128, 0.6509804, 1, 0, 1,
-0.7463024, 0.32922, 0.957261, 0.6431373, 1, 0, 1,
-0.7433115, 0.3557018, -2.021153, 0.6392157, 1, 0, 1,
-0.7428845, -0.3024381, -2.483424, 0.6313726, 1, 0, 1,
-0.7214313, -1.132918, -3.044202, 0.627451, 1, 0, 1,
-0.7195066, 1.073789, 0.5262589, 0.6196079, 1, 0, 1,
-0.715818, 0.7985237, -0.1351807, 0.6156863, 1, 0, 1,
-0.7148339, -0.3900406, -3.226381, 0.6078432, 1, 0, 1,
-0.7091568, 1.653426, -2.069062, 0.6039216, 1, 0, 1,
-0.7089862, 0.8522208, -2.622987, 0.5960785, 1, 0, 1,
-0.7072796, -1.147061, -1.906974, 0.5882353, 1, 0, 1,
-0.7066481, -0.4229855, -2.536387, 0.5843138, 1, 0, 1,
-0.7031611, 0.6396305, -2.402254, 0.5764706, 1, 0, 1,
-0.7023888, 0.4661585, 0.9519293, 0.572549, 1, 0, 1,
-0.7023725, -0.786051, -3.744593, 0.5647059, 1, 0, 1,
-0.6971643, 0.102098, -1.484993, 0.5607843, 1, 0, 1,
-0.6947094, -0.7993625, -3.254071, 0.5529412, 1, 0, 1,
-0.6829127, -0.4091844, -2.90549, 0.5490196, 1, 0, 1,
-0.677839, 1.113764, -0.6610622, 0.5411765, 1, 0, 1,
-0.6757102, -0.7577457, -2.320566, 0.5372549, 1, 0, 1,
-0.6724324, -0.5936823, -1.91167, 0.5294118, 1, 0, 1,
-0.6703667, 0.9357107, -1.644409, 0.5254902, 1, 0, 1,
-0.6702878, -0.7396796, -3.961912, 0.5176471, 1, 0, 1,
-0.6695271, -0.2397145, -2.172136, 0.5137255, 1, 0, 1,
-0.6687604, 1.463872, -0.7843219, 0.5058824, 1, 0, 1,
-0.6686097, 0.3874088, -1.515166, 0.5019608, 1, 0, 1,
-0.6648922, 1.0758, -1.386897, 0.4941176, 1, 0, 1,
-0.6646168, -0.2332974, 0.3045979, 0.4862745, 1, 0, 1,
-0.661575, 0.2529429, -1.256045, 0.4823529, 1, 0, 1,
-0.6543761, 0.3463109, -2.159106, 0.4745098, 1, 0, 1,
-0.644745, 1.360707, -0.08097085, 0.4705882, 1, 0, 1,
-0.635169, 0.6238105, -1.320621, 0.4627451, 1, 0, 1,
-0.6323105, -0.4957671, -1.974537, 0.4588235, 1, 0, 1,
-0.6300719, -0.6008952, -1.926793, 0.4509804, 1, 0, 1,
-0.6288698, -1.010687, -2.892588, 0.4470588, 1, 0, 1,
-0.6221708, -0.7913046, -2.597563, 0.4392157, 1, 0, 1,
-0.6219853, -0.08188605, -0.2160077, 0.4352941, 1, 0, 1,
-0.6219853, 0.3234484, -1.561845, 0.427451, 1, 0, 1,
-0.6174951, 0.01412688, -1.022723, 0.4235294, 1, 0, 1,
-0.6172714, 0.9103427, -0.9983314, 0.4156863, 1, 0, 1,
-0.6169335, -1.092619, -5.111841, 0.4117647, 1, 0, 1,
-0.6159945, 0.2322375, 1.110325, 0.4039216, 1, 0, 1,
-0.6055683, 0.7039735, -0.9900234, 0.3960784, 1, 0, 1,
-0.6050968, 0.3837536, -0.06220876, 0.3921569, 1, 0, 1,
-0.6001377, 0.5903441, 0.5055541, 0.3843137, 1, 0, 1,
-0.5995883, 0.6259295, 0.7749323, 0.3803922, 1, 0, 1,
-0.5914559, 0.5775629, -1.314034, 0.372549, 1, 0, 1,
-0.5897841, 0.1742941, -1.619015, 0.3686275, 1, 0, 1,
-0.5891012, -1.614962, -2.346987, 0.3607843, 1, 0, 1,
-0.5859696, -0.5615948, -1.221674, 0.3568628, 1, 0, 1,
-0.5853477, -1.587861, -3.60214, 0.3490196, 1, 0, 1,
-0.5808647, 1.870959, 0.562973, 0.345098, 1, 0, 1,
-0.5771345, 0.5583534, -1.428221, 0.3372549, 1, 0, 1,
-0.5768441, -0.1242866, -3.203037, 0.3333333, 1, 0, 1,
-0.5749642, 1.894669, -0.474354, 0.3254902, 1, 0, 1,
-0.5730019, 0.6439414, -1.828753, 0.3215686, 1, 0, 1,
-0.5728286, 0.297646, -1.340474, 0.3137255, 1, 0, 1,
-0.5700626, -0.2092303, -3.839887, 0.3098039, 1, 0, 1,
-0.5697716, 0.5203527, -1.685327, 0.3019608, 1, 0, 1,
-0.5659763, -0.4622306, -3.474925, 0.2941177, 1, 0, 1,
-0.5632567, 2.515421, -0.6939328, 0.2901961, 1, 0, 1,
-0.5589669, -0.6558419, -2.477575, 0.282353, 1, 0, 1,
-0.5575564, 0.06272952, -2.315197, 0.2784314, 1, 0, 1,
-0.5557635, 0.5975218, -2.937942, 0.2705882, 1, 0, 1,
-0.5530915, -0.9297275, -4.712225, 0.2666667, 1, 0, 1,
-0.551448, 0.4657739, -1.092803, 0.2588235, 1, 0, 1,
-0.5509785, 0.4828619, -1.22163, 0.254902, 1, 0, 1,
-0.547451, -0.02813291, -2.398817, 0.2470588, 1, 0, 1,
-0.5468846, -0.4383438, -1.696972, 0.2431373, 1, 0, 1,
-0.5436457, -0.04568294, -1.365841, 0.2352941, 1, 0, 1,
-0.5427725, 0.08842739, -1.814492, 0.2313726, 1, 0, 1,
-0.5412049, -1.074604, -3.214466, 0.2235294, 1, 0, 1,
-0.537112, 1.067141, -1.495752, 0.2196078, 1, 0, 1,
-0.5357856, 0.8047217, 0.2151041, 0.2117647, 1, 0, 1,
-0.5292929, 1.519371, 0.03019375, 0.2078431, 1, 0, 1,
-0.5282274, 0.1411588, -1.902985, 0.2, 1, 0, 1,
-0.5235546, 0.2790264, -0.2170052, 0.1921569, 1, 0, 1,
-0.5150468, 0.6386241, 0.2736314, 0.1882353, 1, 0, 1,
-0.5150254, -0.1366747, -1.243321, 0.1803922, 1, 0, 1,
-0.5147623, 0.686805, -1.934698, 0.1764706, 1, 0, 1,
-0.5134581, 1.029653, -0.6713766, 0.1686275, 1, 0, 1,
-0.5132113, -0.3633919, -1.093171, 0.1647059, 1, 0, 1,
-0.5104523, -1.24447, -4.013321, 0.1568628, 1, 0, 1,
-0.5090508, -1.187938, -2.708533, 0.1529412, 1, 0, 1,
-0.507258, 0.9442372, -1.256029, 0.145098, 1, 0, 1,
-0.5037909, 1.042042, 0.7527931, 0.1411765, 1, 0, 1,
-0.5030881, -0.3435372, -1.693479, 0.1333333, 1, 0, 1,
-0.5008202, 0.4555602, -0.6625904, 0.1294118, 1, 0, 1,
-0.5006374, -1.725578, -1.852239, 0.1215686, 1, 0, 1,
-0.5004525, 0.156344, -3.445706, 0.1176471, 1, 0, 1,
-0.4949883, 0.002473918, 0.5025679, 0.1098039, 1, 0, 1,
-0.4890504, -1.383125, -1.026576, 0.1058824, 1, 0, 1,
-0.4875634, 0.6687758, -1.813217, 0.09803922, 1, 0, 1,
-0.4860729, -0.3901362, -0.9509209, 0.09019608, 1, 0, 1,
-0.4845999, 0.7911115, -0.3893647, 0.08627451, 1, 0, 1,
-0.4842852, 0.5129187, -0.7847679, 0.07843138, 1, 0, 1,
-0.4841164, -2.183892, -2.337316, 0.07450981, 1, 0, 1,
-0.4838082, -0.8032761, -4.228199, 0.06666667, 1, 0, 1,
-0.4832275, -0.08420303, -1.012809, 0.0627451, 1, 0, 1,
-0.4791153, -1.960348, -1.474162, 0.05490196, 1, 0, 1,
-0.4776503, -1.19706, -3.170077, 0.05098039, 1, 0, 1,
-0.4743716, 0.9854381, -1.301786, 0.04313726, 1, 0, 1,
-0.4721532, -0.5148217, -1.702105, 0.03921569, 1, 0, 1,
-0.4705698, 1.985824, -0.6220334, 0.03137255, 1, 0, 1,
-0.4617674, 2.801582, -1.548263, 0.02745098, 1, 0, 1,
-0.457165, 2.40596, -0.7788249, 0.01960784, 1, 0, 1,
-0.4541863, 0.4122263, 1.006148, 0.01568628, 1, 0, 1,
-0.4522222, 0.4391136, -1.498552, 0.007843138, 1, 0, 1,
-0.4511132, 1.521335, 0.6199122, 0.003921569, 1, 0, 1,
-0.450017, 0.2661368, -1.833108, 0, 1, 0.003921569, 1,
-0.448722, -0.04019033, -1.276761, 0, 1, 0.01176471, 1,
-0.4484, -1.362021, -3.421565, 0, 1, 0.01568628, 1,
-0.4464672, -0.103208, -0.6478726, 0, 1, 0.02352941, 1,
-0.4439774, 0.4856654, 0.008895639, 0, 1, 0.02745098, 1,
-0.4428463, -0.9135822, -4.094339, 0, 1, 0.03529412, 1,
-0.4410269, 0.3863864, -0.9985028, 0, 1, 0.03921569, 1,
-0.4375553, -0.8902527, -1.9843, 0, 1, 0.04705882, 1,
-0.4374065, -1.047157, -3.763796, 0, 1, 0.05098039, 1,
-0.4335717, 0.2164496, -0.9292281, 0, 1, 0.05882353, 1,
-0.4279525, 0.2702388, -1.976289, 0, 1, 0.0627451, 1,
-0.4271145, -0.5710403, -2.813297, 0, 1, 0.07058824, 1,
-0.4262405, -0.4922284, -1.914051, 0, 1, 0.07450981, 1,
-0.4251359, -0.7348404, -3.428872, 0, 1, 0.08235294, 1,
-0.4217172, -1.048269, -2.451907, 0, 1, 0.08627451, 1,
-0.4205626, 0.7156811, -0.2952195, 0, 1, 0.09411765, 1,
-0.4196244, -1.391427, -0.9312199, 0, 1, 0.1019608, 1,
-0.4188483, 0.5169251, -2.092113, 0, 1, 0.1058824, 1,
-0.4131624, -1.882104, -2.377512, 0, 1, 0.1137255, 1,
-0.4110554, 0.4007716, 0.00247433, 0, 1, 0.1176471, 1,
-0.4070961, -1.00012, -3.766363, 0, 1, 0.1254902, 1,
-0.4054538, 0.9024597, -2.050039, 0, 1, 0.1294118, 1,
-0.4037257, 1.272434, 0.7285784, 0, 1, 0.1372549, 1,
-0.4026105, -1.238448, -2.30373, 0, 1, 0.1411765, 1,
-0.4021442, 2.209338, -1.152314, 0, 1, 0.1490196, 1,
-0.4003955, 0.6341062, -0.6940547, 0, 1, 0.1529412, 1,
-0.3973756, -1.044292, -3.241347, 0, 1, 0.1607843, 1,
-0.3973359, 1.5683, 0.4102379, 0, 1, 0.1647059, 1,
-0.3948875, -0.7442477, -3.696541, 0, 1, 0.172549, 1,
-0.3915649, 0.4764103, -1.5472, 0, 1, 0.1764706, 1,
-0.387633, -1.585657, -3.57818, 0, 1, 0.1843137, 1,
-0.37783, 0.8734078, -0.68084, 0, 1, 0.1882353, 1,
-0.3703275, -0.1520962, -2.842119, 0, 1, 0.1960784, 1,
-0.3697058, -0.8669962, -1.275611, 0, 1, 0.2039216, 1,
-0.3676701, 0.1440881, -1.263904, 0, 1, 0.2078431, 1,
-0.3674155, 0.1269407, -0.109808, 0, 1, 0.2156863, 1,
-0.3668221, 1.457622, -0.2991998, 0, 1, 0.2196078, 1,
-0.3605249, -0.3498968, -2.022516, 0, 1, 0.227451, 1,
-0.3591861, 0.2137062, -2.070086, 0, 1, 0.2313726, 1,
-0.3476745, -0.4053195, -1.930156, 0, 1, 0.2392157, 1,
-0.3475963, 0.441459, -2.159187, 0, 1, 0.2431373, 1,
-0.3434577, 0.2334206, -0.9466837, 0, 1, 0.2509804, 1,
-0.3373877, -0.7241319, -1.59303, 0, 1, 0.254902, 1,
-0.3369053, -0.1583624, -1.737017, 0, 1, 0.2627451, 1,
-0.3357072, -0.08700086, -4.055942, 0, 1, 0.2666667, 1,
-0.3346839, -0.9516662, -3.7899, 0, 1, 0.2745098, 1,
-0.3300159, -0.454262, -2.098886, 0, 1, 0.2784314, 1,
-0.3276755, -0.4314219, -3.386981, 0, 1, 0.2862745, 1,
-0.3271082, 1.158604, 0.02851723, 0, 1, 0.2901961, 1,
-0.3228229, 0.5200465, -1.364023, 0, 1, 0.2980392, 1,
-0.3206415, -0.7642636, -2.092932, 0, 1, 0.3058824, 1,
-0.3195285, -0.1951939, -2.417098, 0, 1, 0.3098039, 1,
-0.318334, 1.713427, 1.143771, 0, 1, 0.3176471, 1,
-0.3167968, 0.570239, 0.2066351, 0, 1, 0.3215686, 1,
-0.312219, 1.164945, 0.8532892, 0, 1, 0.3294118, 1,
-0.3081872, -0.3641802, -2.444266, 0, 1, 0.3333333, 1,
-0.307415, -0.08480656, -2.002727, 0, 1, 0.3411765, 1,
-0.3055311, -0.9495407, -3.708135, 0, 1, 0.345098, 1,
-0.3034333, 1.031537, -1.6014, 0, 1, 0.3529412, 1,
-0.3007089, 0.7389228, -1.466531, 0, 1, 0.3568628, 1,
-0.295426, -0.1298977, -2.711901, 0, 1, 0.3647059, 1,
-0.2937125, 1.922562, 0.9407674, 0, 1, 0.3686275, 1,
-0.28975, 0.1985767, -1.932329, 0, 1, 0.3764706, 1,
-0.2876884, 2.232394, -0.6224591, 0, 1, 0.3803922, 1,
-0.2837653, -0.4093084, -4.614646, 0, 1, 0.3882353, 1,
-0.2802888, 1.613187, 0.3313143, 0, 1, 0.3921569, 1,
-0.2792192, -1.851806, -2.572864, 0, 1, 0.4, 1,
-0.2755028, 0.1864423, -1.018147, 0, 1, 0.4078431, 1,
-0.2752928, -0.6463893, -2.780597, 0, 1, 0.4117647, 1,
-0.2731029, -0.8695229, -2.507689, 0, 1, 0.4196078, 1,
-0.2676321, 0.8560365, -1.437251, 0, 1, 0.4235294, 1,
-0.2667856, 0.8504941, -0.275655, 0, 1, 0.4313726, 1,
-0.26604, -0.6963113, -1.648892, 0, 1, 0.4352941, 1,
-0.2593262, 0.1481255, -0.4616445, 0, 1, 0.4431373, 1,
-0.2581412, -0.7480383, -2.859239, 0, 1, 0.4470588, 1,
-0.2540649, 0.2360226, -1.444865, 0, 1, 0.454902, 1,
-0.2527505, 0.5356616, 0.2179888, 0, 1, 0.4588235, 1,
-0.2515248, -1.117285, -2.144057, 0, 1, 0.4666667, 1,
-0.2514492, 1.208712, 1.10712, 0, 1, 0.4705882, 1,
-0.2462257, 0.8679084, -0.5570295, 0, 1, 0.4784314, 1,
-0.244318, -0.9803517, -2.961796, 0, 1, 0.4823529, 1,
-0.2429331, 0.005591779, -2.527774, 0, 1, 0.4901961, 1,
-0.2428034, -0.09237471, -1.022159, 0, 1, 0.4941176, 1,
-0.2415998, 1.350264, -0.9820768, 0, 1, 0.5019608, 1,
-0.2389974, 1.70416, 0.7007797, 0, 1, 0.509804, 1,
-0.2381153, 2.023697, 0.6007091, 0, 1, 0.5137255, 1,
-0.2342391, 0.01410167, -0.6427464, 0, 1, 0.5215687, 1,
-0.2313967, 1.550333, 0.2935717, 0, 1, 0.5254902, 1,
-0.2302371, 3.090106, 0.3387927, 0, 1, 0.5333334, 1,
-0.2294931, -1.834089, -2.297661, 0, 1, 0.5372549, 1,
-0.2291126, -0.7022337, -3.600534, 0, 1, 0.5450981, 1,
-0.2268242, -0.2425578, -2.863338, 0, 1, 0.5490196, 1,
-0.2225911, 0.009466278, -1.517101, 0, 1, 0.5568628, 1,
-0.2183186, -0.8800017, -3.337879, 0, 1, 0.5607843, 1,
-0.2155812, -0.3779099, -2.090238, 0, 1, 0.5686275, 1,
-0.2147396, -1.42269, -3.374465, 0, 1, 0.572549, 1,
-0.213783, -0.5691447, -2.812563, 0, 1, 0.5803922, 1,
-0.2128514, -0.8345252, -2.473245, 0, 1, 0.5843138, 1,
-0.2114361, 0.6672632, -1.626414, 0, 1, 0.5921569, 1,
-0.211404, -1.520367, -3.270754, 0, 1, 0.5960785, 1,
-0.2093955, 0.9633442, -0.9313704, 0, 1, 0.6039216, 1,
-0.20737, -0.1270754, -3.250785, 0, 1, 0.6117647, 1,
-0.2022338, 0.7650608, 0.5388172, 0, 1, 0.6156863, 1,
-0.1999209, 0.3657469, -1.025124, 0, 1, 0.6235294, 1,
-0.199792, 0.7831462, 1.586058, 0, 1, 0.627451, 1,
-0.1923526, -0.3313053, -1.778448, 0, 1, 0.6352941, 1,
-0.1921759, 0.3288969, -0.3174728, 0, 1, 0.6392157, 1,
-0.1903238, -1.194836, -3.864907, 0, 1, 0.6470588, 1,
-0.1875932, -0.5631053, -2.768611, 0, 1, 0.6509804, 1,
-0.187492, -0.2206041, -2.020222, 0, 1, 0.6588235, 1,
-0.1683703, -0.8181362, -3.770325, 0, 1, 0.6627451, 1,
-0.1653267, -0.6403952, -3.778032, 0, 1, 0.6705883, 1,
-0.1519994, -1.104843, -4.614905, 0, 1, 0.6745098, 1,
-0.1510087, -0.1722298, -3.499599, 0, 1, 0.682353, 1,
-0.1501091, -1.561062, -2.448899, 0, 1, 0.6862745, 1,
-0.1500628, 0.5048248, -0.9247203, 0, 1, 0.6941177, 1,
-0.1499337, -0.7156551, -4.012498, 0, 1, 0.7019608, 1,
-0.1489966, -2.182293, -1.830545, 0, 1, 0.7058824, 1,
-0.1462063, 0.4245788, 0.2384215, 0, 1, 0.7137255, 1,
-0.1399011, -0.5735116, -2.484712, 0, 1, 0.7176471, 1,
-0.1320858, -0.3317653, -3.756116, 0, 1, 0.7254902, 1,
-0.1312659, -1.127512, -3.406744, 0, 1, 0.7294118, 1,
-0.1298855, 0.7934782, -0.9177481, 0, 1, 0.7372549, 1,
-0.1238333, 1.192969, -0.9422307, 0, 1, 0.7411765, 1,
-0.1225697, -0.5578466, -2.511049, 0, 1, 0.7490196, 1,
-0.1209426, 1.596761, -0.3709006, 0, 1, 0.7529412, 1,
-0.1207727, 0.2042503, -0.3241034, 0, 1, 0.7607843, 1,
-0.1198643, 0.5176896, -0.3668907, 0, 1, 0.7647059, 1,
-0.1064202, -1.40774, -1.720067, 0, 1, 0.772549, 1,
-0.1054997, -1.34028, -2.050562, 0, 1, 0.7764706, 1,
-0.1038602, 0.5635509, -1.769516, 0, 1, 0.7843137, 1,
-0.09892194, -1.206851, -3.059665, 0, 1, 0.7882353, 1,
-0.09885768, -0.2324545, -3.495475, 0, 1, 0.7960784, 1,
-0.09741383, 1.467796, 0.07381674, 0, 1, 0.8039216, 1,
-0.08935872, 0.5416906, -1.029886, 0, 1, 0.8078431, 1,
-0.08922601, -0.7220107, -3.404278, 0, 1, 0.8156863, 1,
-0.08907963, 0.02026578, -2.09642, 0, 1, 0.8196079, 1,
-0.08880657, 0.2115452, 0.007899142, 0, 1, 0.827451, 1,
-0.08557212, 0.4185171, -0.6304147, 0, 1, 0.8313726, 1,
-0.07994043, -1.513289, -3.49942, 0, 1, 0.8392157, 1,
-0.07535331, -0.505528, -2.373264, 0, 1, 0.8431373, 1,
-0.07516581, -1.523386, -2.64662, 0, 1, 0.8509804, 1,
-0.07239048, 0.797997, -1.138412, 0, 1, 0.854902, 1,
-0.07170321, -0.8677737, -1.66502, 0, 1, 0.8627451, 1,
-0.06858066, 0.2952939, -0.6811467, 0, 1, 0.8666667, 1,
-0.06852063, 0.4844483, -1.435159, 0, 1, 0.8745098, 1,
-0.06818881, -0.2701678, -1.288751, 0, 1, 0.8784314, 1,
-0.06813942, 1.181856, 0.675344, 0, 1, 0.8862745, 1,
-0.06673685, 0.5267472, -0.916481, 0, 1, 0.8901961, 1,
-0.0647836, 0.5909036, -1.013317, 0, 1, 0.8980392, 1,
-0.06101957, 0.4937662, 1.275218, 0, 1, 0.9058824, 1,
-0.05922589, 1.148801, -2.217555, 0, 1, 0.9098039, 1,
-0.05539504, 1.11087, -1.149334, 0, 1, 0.9176471, 1,
-0.05026737, 0.3065306, 0.3002234, 0, 1, 0.9215686, 1,
-0.04872711, -0.6079246, -0.8895562, 0, 1, 0.9294118, 1,
-0.04257647, -0.8731197, -5.548696, 0, 1, 0.9333333, 1,
-0.03850103, 0.3210019, 0.5731809, 0, 1, 0.9411765, 1,
-0.03404995, -0.1146587, -1.635971, 0, 1, 0.945098, 1,
-0.02903967, 0.9218975, -0.9996865, 0, 1, 0.9529412, 1,
-0.0182678, 0.3203841, -1.770939, 0, 1, 0.9568627, 1,
-0.01711429, -1.211907, -3.723778, 0, 1, 0.9647059, 1,
-0.01631718, 0.1214752, -0.4261408, 0, 1, 0.9686275, 1,
-0.01381255, 1.041552, 0.5443058, 0, 1, 0.9764706, 1,
-0.01260222, 0.0006859035, -0.566763, 0, 1, 0.9803922, 1,
-0.01144169, -0.06871253, -0.5896878, 0, 1, 0.9882353, 1,
-0.01127248, -0.0934385, -2.99219, 0, 1, 0.9921569, 1,
-0.009913245, -1.737813, -2.317932, 0, 1, 1, 1,
-0.008831592, 1.395295, -0.9161685, 0, 0.9921569, 1, 1,
-0.008674563, -1.514481, -3.435896, 0, 0.9882353, 1, 1,
-0.004656742, 0.1884947, 0.5886862, 0, 0.9803922, 1, 1,
0.003129254, 0.1836496, 0.2572564, 0, 0.9764706, 1, 1,
0.003760589, -0.356912, 3.910004, 0, 0.9686275, 1, 1,
0.006980582, -0.06671371, 3.04571, 0, 0.9647059, 1, 1,
0.008065452, 0.885942, -0.1907843, 0, 0.9568627, 1, 1,
0.01540022, 0.4010794, 0.1814957, 0, 0.9529412, 1, 1,
0.01556837, 0.3472256, 1.952135, 0, 0.945098, 1, 1,
0.01735118, 0.03189024, -0.3614826, 0, 0.9411765, 1, 1,
0.01953317, -0.02702317, 1.776138, 0, 0.9333333, 1, 1,
0.01982235, -0.1197872, 2.488129, 0, 0.9294118, 1, 1,
0.02008729, -0.3600371, 0.7409446, 0, 0.9215686, 1, 1,
0.02312358, -0.2060035, 3.513437, 0, 0.9176471, 1, 1,
0.03069516, 0.6996084, 0.05419069, 0, 0.9098039, 1, 1,
0.03294751, 0.7955644, -0.7978402, 0, 0.9058824, 1, 1,
0.03512979, -1.453097, 3.428456, 0, 0.8980392, 1, 1,
0.03731401, 1.261931, -0.9795546, 0, 0.8901961, 1, 1,
0.03917528, 0.9535202, 1.635597, 0, 0.8862745, 1, 1,
0.03949861, -0.9945523, 3.164966, 0, 0.8784314, 1, 1,
0.03974258, -0.5172119, 1.781988, 0, 0.8745098, 1, 1,
0.04095856, 0.6903276, -0.01851586, 0, 0.8666667, 1, 1,
0.04146111, -1.372558, 3.887134, 0, 0.8627451, 1, 1,
0.04287882, -0.5343413, 2.738785, 0, 0.854902, 1, 1,
0.04369352, 0.09954525, 0.1036768, 0, 0.8509804, 1, 1,
0.05282137, -0.3283205, 3.311047, 0, 0.8431373, 1, 1,
0.05412556, 0.007202404, -0.1983786, 0, 0.8392157, 1, 1,
0.0579493, -0.07980331, 1.473064, 0, 0.8313726, 1, 1,
0.06120228, 0.03973274, -0.5817408, 0, 0.827451, 1, 1,
0.06326116, 1.567495, -0.4775626, 0, 0.8196079, 1, 1,
0.06439751, 1.616214, -1.64625, 0, 0.8156863, 1, 1,
0.06974831, 0.3618411, 1.256114, 0, 0.8078431, 1, 1,
0.07176104, -1.241178, 1.535822, 0, 0.8039216, 1, 1,
0.07302603, -0.007046982, 1.807087, 0, 0.7960784, 1, 1,
0.07692951, 0.4477742, -0.5148218, 0, 0.7882353, 1, 1,
0.08485443, 0.5910027, 0.324839, 0, 0.7843137, 1, 1,
0.09244943, -0.568812, 3.454638, 0, 0.7764706, 1, 1,
0.09710666, 2.040785, -0.5595398, 0, 0.772549, 1, 1,
0.09820471, -0.006679804, 2.496171, 0, 0.7647059, 1, 1,
0.09916958, -0.32767, 3.159281, 0, 0.7607843, 1, 1,
0.1020435, -1.48106, 1.181485, 0, 0.7529412, 1, 1,
0.1026107, -1.11476, 3.497031, 0, 0.7490196, 1, 1,
0.1111752, -0.06612711, 2.296289, 0, 0.7411765, 1, 1,
0.1239215, 1.070976, 1.731571, 0, 0.7372549, 1, 1,
0.1246242, -0.313669, 3.93283, 0, 0.7294118, 1, 1,
0.1301843, -0.8401719, 3.304928, 0, 0.7254902, 1, 1,
0.1326238, -1.96886, 3.738593, 0, 0.7176471, 1, 1,
0.1343422, 2.881812, 1.125967, 0, 0.7137255, 1, 1,
0.1377239, 0.4514337, 2.148546, 0, 0.7058824, 1, 1,
0.1418957, 1.525211, 0.4470852, 0, 0.6980392, 1, 1,
0.1440154, -0.738407, 3.512204, 0, 0.6941177, 1, 1,
0.1444034, -1.291861, 2.468378, 0, 0.6862745, 1, 1,
0.1481418, -0.9195411, 2.469746, 0, 0.682353, 1, 1,
0.1554266, -0.5909559, 2.518092, 0, 0.6745098, 1, 1,
0.1558062, -0.1216166, 0.8439531, 0, 0.6705883, 1, 1,
0.158087, 0.1389828, 1.221833, 0, 0.6627451, 1, 1,
0.1607296, -0.9911791, 4.180907, 0, 0.6588235, 1, 1,
0.1656996, -0.9656664, 4.371874, 0, 0.6509804, 1, 1,
0.1698799, 0.5469573, 1.259816, 0, 0.6470588, 1, 1,
0.1705797, -0.2716153, 2.461377, 0, 0.6392157, 1, 1,
0.1707766, -1.134017, 3.580193, 0, 0.6352941, 1, 1,
0.1719578, 0.5928026, 0.3859245, 0, 0.627451, 1, 1,
0.1725384, 0.4931764, 0.1965714, 0, 0.6235294, 1, 1,
0.175306, -1.761108, 3.284851, 0, 0.6156863, 1, 1,
0.175316, -0.2061738, 1.118742, 0, 0.6117647, 1, 1,
0.1753921, -0.2655158, 2.037841, 0, 0.6039216, 1, 1,
0.1798886, 1.421405, -0.1787045, 0, 0.5960785, 1, 1,
0.1818139, 0.08380534, 3.288321, 0, 0.5921569, 1, 1,
0.1868826, 0.5730032, -0.9905828, 0, 0.5843138, 1, 1,
0.1902155, 0.5900253, 0.3850857, 0, 0.5803922, 1, 1,
0.1959262, 1.706757, 0.7198322, 0, 0.572549, 1, 1,
0.1981585, 0.5455376, -0.4624108, 0, 0.5686275, 1, 1,
0.1996918, 1.779756, -0.9142129, 0, 0.5607843, 1, 1,
0.2042471, -0.6460662, 2.774817, 0, 0.5568628, 1, 1,
0.2050291, 0.6905827, 0.5456775, 0, 0.5490196, 1, 1,
0.2076616, -0.8991091, 2.076368, 0, 0.5450981, 1, 1,
0.2173346, -1.364543, 2.30068, 0, 0.5372549, 1, 1,
0.217926, -0.7156187, 4.265268, 0, 0.5333334, 1, 1,
0.2189561, -1.243629, 3.443304, 0, 0.5254902, 1, 1,
0.2190809, 0.5159048, -1.155177, 0, 0.5215687, 1, 1,
0.2242253, -0.7692295, 3.761081, 0, 0.5137255, 1, 1,
0.2266573, -0.2815588, 2.228108, 0, 0.509804, 1, 1,
0.2268275, 0.3070931, 0.7610437, 0, 0.5019608, 1, 1,
0.2271581, 0.07129627, 1.929041, 0, 0.4941176, 1, 1,
0.2278565, 0.3312484, 1.534685, 0, 0.4901961, 1, 1,
0.2297559, 1.266165, -0.6493424, 0, 0.4823529, 1, 1,
0.2393593, -0.7399354, 3.599875, 0, 0.4784314, 1, 1,
0.2447806, -0.4791957, 3.383539, 0, 0.4705882, 1, 1,
0.2459536, -0.03857924, 0.7011979, 0, 0.4666667, 1, 1,
0.2473849, 2.088472, 0.4015944, 0, 0.4588235, 1, 1,
0.2478995, -0.1307051, 0.3339812, 0, 0.454902, 1, 1,
0.2499077, 0.04936519, 1.129396, 0, 0.4470588, 1, 1,
0.2520587, 0.4628173, 1.74363, 0, 0.4431373, 1, 1,
0.2522169, 1.502561, 0.3870839, 0, 0.4352941, 1, 1,
0.2600838, 0.6574898, 0.260272, 0, 0.4313726, 1, 1,
0.2651466, -0.8641511, 2.33145, 0, 0.4235294, 1, 1,
0.2738311, -0.5953659, 1.774645, 0, 0.4196078, 1, 1,
0.2749409, -1.671873, 2.490164, 0, 0.4117647, 1, 1,
0.2750231, 0.1919897, 1.399352, 0, 0.4078431, 1, 1,
0.2785825, 0.09894284, 1.575379, 0, 0.4, 1, 1,
0.2814922, 0.5888762, 1.408971, 0, 0.3921569, 1, 1,
0.284676, 1.006515, 0.1968746, 0, 0.3882353, 1, 1,
0.2875968, -0.4712955, 1.605868, 0, 0.3803922, 1, 1,
0.290453, -0.5731155, 2.740555, 0, 0.3764706, 1, 1,
0.2935778, -0.04577431, 0.8751152, 0, 0.3686275, 1, 1,
0.2954932, -0.695033, 3.692798, 0, 0.3647059, 1, 1,
0.297441, 0.2768303, 1.00534, 0, 0.3568628, 1, 1,
0.2984385, -1.914297, 4.909917, 0, 0.3529412, 1, 1,
0.3001443, 2.368057, 1.691296, 0, 0.345098, 1, 1,
0.3001612, -0.747054, 2.747143, 0, 0.3411765, 1, 1,
0.3006219, -0.8618945, 1.550871, 0, 0.3333333, 1, 1,
0.3012888, -0.5795765, 3.196159, 0, 0.3294118, 1, 1,
0.3054909, 0.5801899, 2.95395, 0, 0.3215686, 1, 1,
0.3061945, -1.247689, 3.055673, 0, 0.3176471, 1, 1,
0.3067788, -0.3427574, 2.825024, 0, 0.3098039, 1, 1,
0.3117358, 0.6537868, 1.481344, 0, 0.3058824, 1, 1,
0.3122256, -0.2639165, 1.44511, 0, 0.2980392, 1, 1,
0.3170523, 2.355114, 1.182196, 0, 0.2901961, 1, 1,
0.3175064, -1.38712, 3.447139, 0, 0.2862745, 1, 1,
0.3189903, -1.720003, 2.709335, 0, 0.2784314, 1, 1,
0.319356, -1.378263, 3.15838, 0, 0.2745098, 1, 1,
0.3247229, -1.423226, 2.702728, 0, 0.2666667, 1, 1,
0.3303496, -2.323527, 3.313637, 0, 0.2627451, 1, 1,
0.3341133, 0.2764808, 0.6720344, 0, 0.254902, 1, 1,
0.3367743, 0.9521649, -0.7858002, 0, 0.2509804, 1, 1,
0.3420157, -0.9396037, 3.985107, 0, 0.2431373, 1, 1,
0.3429745, -0.04307299, 1.361482, 0, 0.2392157, 1, 1,
0.3515542, -0.9247892, 2.469345, 0, 0.2313726, 1, 1,
0.3562965, 0.6512582, -1.372193, 0, 0.227451, 1, 1,
0.3570839, -2.501963, 2.124844, 0, 0.2196078, 1, 1,
0.3592198, -0.8069272, 2.499389, 0, 0.2156863, 1, 1,
0.3602531, 1.486772, 1.8007, 0, 0.2078431, 1, 1,
0.3620902, -0.2271349, 2.652797, 0, 0.2039216, 1, 1,
0.3659697, -0.6339803, 2.369885, 0, 0.1960784, 1, 1,
0.3838765, -0.7571355, 2.143807, 0, 0.1882353, 1, 1,
0.3841017, -0.3951373, 3.819706, 0, 0.1843137, 1, 1,
0.3854284, 0.3824314, 0.9572189, 0, 0.1764706, 1, 1,
0.3909824, -0.08005556, 1.88499, 0, 0.172549, 1, 1,
0.391275, -0.2436607, 0.9396799, 0, 0.1647059, 1, 1,
0.3919734, -0.6788372, 3.521034, 0, 0.1607843, 1, 1,
0.3931297, 1.746439, 0.7026464, 0, 0.1529412, 1, 1,
0.393549, 0.2621766, 1.529043, 0, 0.1490196, 1, 1,
0.3974273, -0.6449515, 2.68411, 0, 0.1411765, 1, 1,
0.3989793, 1.234152, -0.7199166, 0, 0.1372549, 1, 1,
0.407436, 0.5002293, 1.098051, 0, 0.1294118, 1, 1,
0.4077177, 0.2270358, 1.354814, 0, 0.1254902, 1, 1,
0.409498, -1.198478, 4.097297, 0, 0.1176471, 1, 1,
0.4147492, -1.100669, 3.367423, 0, 0.1137255, 1, 1,
0.421119, -2.322771, 2.158242, 0, 0.1058824, 1, 1,
0.4230062, -1.144031, 3.851764, 0, 0.09803922, 1, 1,
0.4285271, -0.1853531, 2.2624, 0, 0.09411765, 1, 1,
0.4421008, 0.8084566, -1.845137, 0, 0.08627451, 1, 1,
0.4422705, 0.1240929, 1.078823, 0, 0.08235294, 1, 1,
0.4435121, -0.02797605, 3.28208, 0, 0.07450981, 1, 1,
0.4468658, -0.6616078, 2.509693, 0, 0.07058824, 1, 1,
0.450686, -0.3362619, 2.456484, 0, 0.0627451, 1, 1,
0.453421, 0.8665311, 1.284969, 0, 0.05882353, 1, 1,
0.4593363, 0.635114, -0.885276, 0, 0.05098039, 1, 1,
0.4596054, -1.254034, 2.021363, 0, 0.04705882, 1, 1,
0.4614158, 0.4057353, 2.686298, 0, 0.03921569, 1, 1,
0.4655476, -2.415545, 3.643796, 0, 0.03529412, 1, 1,
0.466048, -0.9189076, 2.670914, 0, 0.02745098, 1, 1,
0.4676624, 1.052727, 1.002998, 0, 0.02352941, 1, 1,
0.4687811, -1.060372, 3.138849, 0, 0.01568628, 1, 1,
0.472009, -0.8462585, 2.540554, 0, 0.01176471, 1, 1,
0.4779074, 1.994639, -1.728038, 0, 0.003921569, 1, 1,
0.4846406, 1.233049, 2.328778, 0.003921569, 0, 1, 1,
0.4886011, -0.1334352, 2.135452, 0.007843138, 0, 1, 1,
0.4909408, 0.1236628, 1.053063, 0.01568628, 0, 1, 1,
0.4931061, -0.9597857, 2.170515, 0.01960784, 0, 1, 1,
0.4960181, -1.441522, 2.503172, 0.02745098, 0, 1, 1,
0.506319, 1.601168, 0.7055843, 0.03137255, 0, 1, 1,
0.5075169, -0.159093, 1.97349, 0.03921569, 0, 1, 1,
0.510417, 0.4622408, -0.7043123, 0.04313726, 0, 1, 1,
0.5170794, 0.3238654, 1.64255, 0.05098039, 0, 1, 1,
0.5183204, 0.9362265, 1.540328, 0.05490196, 0, 1, 1,
0.5246294, 0.5825244, 2.507499, 0.0627451, 0, 1, 1,
0.5273092, 1.065567, 0.7060841, 0.06666667, 0, 1, 1,
0.5321719, -1.259758, 3.52861, 0.07450981, 0, 1, 1,
0.5332966, 0.1680708, 0.01201757, 0.07843138, 0, 1, 1,
0.5350361, 2.336155, -0.6492443, 0.08627451, 0, 1, 1,
0.5365779, -0.7844241, 3.527242, 0.09019608, 0, 1, 1,
0.5391817, -1.055474, 5.139829, 0.09803922, 0, 1, 1,
0.5455142, -0.4833196, 3.422538, 0.1058824, 0, 1, 1,
0.5471494, 1.086428, 0.9554391, 0.1098039, 0, 1, 1,
0.5516745, 0.05060568, 3.154691, 0.1176471, 0, 1, 1,
0.5528969, -0.5130805, 0.7894411, 0.1215686, 0, 1, 1,
0.5535164, -0.260517, 3.697378, 0.1294118, 0, 1, 1,
0.5548962, 0.2741569, 1.175373, 0.1333333, 0, 1, 1,
0.5574426, -0.6873783, 2.43112, 0.1411765, 0, 1, 1,
0.5587173, -0.07845576, 1.566004, 0.145098, 0, 1, 1,
0.5587363, -0.04490823, -0.5093052, 0.1529412, 0, 1, 1,
0.5605571, -0.6296676, 3.273109, 0.1568628, 0, 1, 1,
0.5620642, 1.261294, -0.8123309, 0.1647059, 0, 1, 1,
0.5648043, -1.651339, 3.862359, 0.1686275, 0, 1, 1,
0.5650544, 0.8142258, 1.154872, 0.1764706, 0, 1, 1,
0.5662654, -0.5051628, 3.345112, 0.1803922, 0, 1, 1,
0.5664721, -2.19885, 1.866238, 0.1882353, 0, 1, 1,
0.571009, -0.8096054, 3.719651, 0.1921569, 0, 1, 1,
0.5769457, 0.3537191, 0.4852558, 0.2, 0, 1, 1,
0.5791786, 1.228395, 0.3801334, 0.2078431, 0, 1, 1,
0.5808493, -0.697439, 2.301359, 0.2117647, 0, 1, 1,
0.5816537, 1.528203, 0.3962535, 0.2196078, 0, 1, 1,
0.5821711, 0.07419483, 1.004983, 0.2235294, 0, 1, 1,
0.5829934, -0.8131214, 2.164324, 0.2313726, 0, 1, 1,
0.5836681, -0.7516226, 1.513052, 0.2352941, 0, 1, 1,
0.587638, 1.505742, 0.3572294, 0.2431373, 0, 1, 1,
0.588102, -0.4244901, 4.601951, 0.2470588, 0, 1, 1,
0.5891845, 0.4168788, 1.456736, 0.254902, 0, 1, 1,
0.5917854, -0.1351979, 1.312416, 0.2588235, 0, 1, 1,
0.5938616, 0.3047177, 1.257226, 0.2666667, 0, 1, 1,
0.5992691, -0.4734196, 2.940731, 0.2705882, 0, 1, 1,
0.5994675, 1.408947, 1.7879, 0.2784314, 0, 1, 1,
0.6064626, 0.7125757, 0.1040374, 0.282353, 0, 1, 1,
0.6080015, -1.645572, 3.173661, 0.2901961, 0, 1, 1,
0.6119547, 0.6535441, 0.2805321, 0.2941177, 0, 1, 1,
0.6120983, 0.637603, -0.4031521, 0.3019608, 0, 1, 1,
0.6129172, -0.6295108, 1.85196, 0.3098039, 0, 1, 1,
0.6181714, -0.1749421, 3.174992, 0.3137255, 0, 1, 1,
0.6201931, 1.230335, 0.0781633, 0.3215686, 0, 1, 1,
0.6286347, -0.4129787, 2.662889, 0.3254902, 0, 1, 1,
0.6287709, -0.08461128, 2.766888, 0.3333333, 0, 1, 1,
0.6332348, -0.3321277, 1.729806, 0.3372549, 0, 1, 1,
0.6353806, 0.2306944, 1.005694, 0.345098, 0, 1, 1,
0.6372144, 2.186163, 0.8873249, 0.3490196, 0, 1, 1,
0.6384177, 0.4224129, 0.2623238, 0.3568628, 0, 1, 1,
0.6415244, 1.541781, 0.7131122, 0.3607843, 0, 1, 1,
0.6467053, 1.504467, 0.575138, 0.3686275, 0, 1, 1,
0.6487188, 0.8383139, 1.573859, 0.372549, 0, 1, 1,
0.6499491, -1.461412, 2.670949, 0.3803922, 0, 1, 1,
0.6550508, -0.1363284, 1.743533, 0.3843137, 0, 1, 1,
0.6553614, -0.5909136, 2.402225, 0.3921569, 0, 1, 1,
0.656921, 0.7167311, 0.9238457, 0.3960784, 0, 1, 1,
0.6614364, -0.570647, 2.10572, 0.4039216, 0, 1, 1,
0.6628721, -0.6082374, 2.352013, 0.4117647, 0, 1, 1,
0.6633535, 1.147731, 1.491103, 0.4156863, 0, 1, 1,
0.6690816, 0.01583433, 2.324997, 0.4235294, 0, 1, 1,
0.6715769, 0.6700423, 1.694848, 0.427451, 0, 1, 1,
0.6769649, -0.119508, 1.99739, 0.4352941, 0, 1, 1,
0.6800222, 0.5472791, 2.695507, 0.4392157, 0, 1, 1,
0.6820492, -1.068592, 2.288371, 0.4470588, 0, 1, 1,
0.6831574, -0.3433031, 0.7322969, 0.4509804, 0, 1, 1,
0.6851311, 0.8425212, 0.4638722, 0.4588235, 0, 1, 1,
0.6863705, 0.9464656, 0.6351901, 0.4627451, 0, 1, 1,
0.6914076, -0.01666439, 2.380567, 0.4705882, 0, 1, 1,
0.6926459, 0.2578195, 2.037634, 0.4745098, 0, 1, 1,
0.6926926, -0.5286695, 3.141109, 0.4823529, 0, 1, 1,
0.6972925, -1.127384, 2.218866, 0.4862745, 0, 1, 1,
0.697862, -0.9405131, 1.740394, 0.4941176, 0, 1, 1,
0.7015722, -0.711895, 2.594092, 0.5019608, 0, 1, 1,
0.7020201, -1.559484, 4.404857, 0.5058824, 0, 1, 1,
0.7035, 0.6478825, 0.2623577, 0.5137255, 0, 1, 1,
0.7046785, 0.9442088, 1.573568, 0.5176471, 0, 1, 1,
0.706905, -0.9746177, 2.430438, 0.5254902, 0, 1, 1,
0.7070906, 0.1093401, -0.1340417, 0.5294118, 0, 1, 1,
0.7079251, -0.4085163, 1.569077, 0.5372549, 0, 1, 1,
0.713909, -0.2634941, 3.1241, 0.5411765, 0, 1, 1,
0.7180383, -0.9972916, 1.110459, 0.5490196, 0, 1, 1,
0.7184449, -1.584467, 2.969234, 0.5529412, 0, 1, 1,
0.7255734, -0.5512425, 2.563221, 0.5607843, 0, 1, 1,
0.732125, 0.5530022, 3.778402, 0.5647059, 0, 1, 1,
0.7329108, 0.226368, 1.347543, 0.572549, 0, 1, 1,
0.7421612, 1.081365, -0.3161313, 0.5764706, 0, 1, 1,
0.7436692, -0.007420409, 2.025537, 0.5843138, 0, 1, 1,
0.7438148, -0.01211636, 0.7064017, 0.5882353, 0, 1, 1,
0.746703, -0.4389715, 3.589848, 0.5960785, 0, 1, 1,
0.7494088, 1.025787, 2.297324, 0.6039216, 0, 1, 1,
0.751064, -0.9801636, 1.361683, 0.6078432, 0, 1, 1,
0.7528142, -1.434593, 1.385812, 0.6156863, 0, 1, 1,
0.7528962, 0.7917516, 0.3647719, 0.6196079, 0, 1, 1,
0.7540643, 0.7367418, 1.235111, 0.627451, 0, 1, 1,
0.7601871, 0.32342, 0.9289755, 0.6313726, 0, 1, 1,
0.7646675, -2.13014, 3.516929, 0.6392157, 0, 1, 1,
0.7664552, 1.215973, 1.694085, 0.6431373, 0, 1, 1,
0.7690365, -0.2241096, -0.4094637, 0.6509804, 0, 1, 1,
0.7701852, -2.251489, 2.08214, 0.654902, 0, 1, 1,
0.7706401, 0.2002769, 2.07581, 0.6627451, 0, 1, 1,
0.7727172, 0.1986095, 1.715089, 0.6666667, 0, 1, 1,
0.7820015, -0.2398658, 1.469088, 0.6745098, 0, 1, 1,
0.7822765, -0.4341729, 0.971957, 0.6784314, 0, 1, 1,
0.7936714, -1.002171, 2.585364, 0.6862745, 0, 1, 1,
0.8006212, 1.538735, 1.082087, 0.6901961, 0, 1, 1,
0.8006666, -1.779461, 3.295837, 0.6980392, 0, 1, 1,
0.8138335, 1.294285, 2.474474, 0.7058824, 0, 1, 1,
0.8171325, 0.2486674, 2.701528, 0.7098039, 0, 1, 1,
0.8232945, 0.426622, 1.285664, 0.7176471, 0, 1, 1,
0.824941, 0.045726, 2.236873, 0.7215686, 0, 1, 1,
0.8256082, -2.196017, 1.443474, 0.7294118, 0, 1, 1,
0.8301318, 1.180569, 0.7797312, 0.7333333, 0, 1, 1,
0.8323686, -0.09613904, 2.001635, 0.7411765, 0, 1, 1,
0.8380206, -1.532685, 3.069527, 0.7450981, 0, 1, 1,
0.8389186, 0.005674561, 1.174334, 0.7529412, 0, 1, 1,
0.8431972, 0.5751384, 0.01328824, 0.7568628, 0, 1, 1,
0.8434155, 0.5769924, 0.7118745, 0.7647059, 0, 1, 1,
0.8468488, -1.286261, 2.02015, 0.7686275, 0, 1, 1,
0.8473425, -0.514467, 1.142908, 0.7764706, 0, 1, 1,
0.8524401, 0.354323, -0.2561498, 0.7803922, 0, 1, 1,
0.8529655, -1.279104, 3.316067, 0.7882353, 0, 1, 1,
0.856041, 0.9873436, -0.0310767, 0.7921569, 0, 1, 1,
0.8568713, -2.236402, 2.110076, 0.8, 0, 1, 1,
0.8635987, 0.1165508, 1.689304, 0.8078431, 0, 1, 1,
0.8653817, -0.6279321, 3.218994, 0.8117647, 0, 1, 1,
0.865402, 0.9990125, 0.7592189, 0.8196079, 0, 1, 1,
0.8655047, 1.713642, -0.1390279, 0.8235294, 0, 1, 1,
0.8848887, 0.3135123, 0.1898871, 0.8313726, 0, 1, 1,
0.8856834, -0.9228409, 2.903341, 0.8352941, 0, 1, 1,
0.8873841, 1.01863, 1.07361, 0.8431373, 0, 1, 1,
0.8890636, -0.05893765, 2.829976, 0.8470588, 0, 1, 1,
0.8961241, 0.3902926, -1.154745, 0.854902, 0, 1, 1,
0.8976757, -0.1767454, 2.05688, 0.8588235, 0, 1, 1,
0.9234833, 0.6139882, 0.1140971, 0.8666667, 0, 1, 1,
0.923631, 1.728246, 1.016541, 0.8705882, 0, 1, 1,
0.9274, 0.2987814, 2.146504, 0.8784314, 0, 1, 1,
0.9323438, 0.5904655, -0.5805438, 0.8823529, 0, 1, 1,
0.933881, -1.115542, 1.895189, 0.8901961, 0, 1, 1,
0.9384585, -1.028346, 2.756951, 0.8941177, 0, 1, 1,
0.9443266, 0.994553, 1.905106, 0.9019608, 0, 1, 1,
0.9504089, -1.29408, 2.427089, 0.9098039, 0, 1, 1,
0.9504337, 0.7462941, -1.302943, 0.9137255, 0, 1, 1,
0.953492, 1.674653, 0.2422147, 0.9215686, 0, 1, 1,
0.955174, 0.2113835, 0.6324517, 0.9254902, 0, 1, 1,
0.958667, -0.8433667, 1.318373, 0.9333333, 0, 1, 1,
0.9594691, -0.6101074, 1.123139, 0.9372549, 0, 1, 1,
0.9708365, -1.065662, 2.747811, 0.945098, 0, 1, 1,
0.9797778, 0.3367259, -0.4817367, 0.9490196, 0, 1, 1,
0.9864411, 1.701652, -0.6713194, 0.9568627, 0, 1, 1,
0.9892715, 0.7663918, -0.009244589, 0.9607843, 0, 1, 1,
0.9967124, -1.177261, 4.412273, 0.9686275, 0, 1, 1,
0.997722, 0.8087377, 2.314849, 0.972549, 0, 1, 1,
0.9991973, -1.788587, 3.78273, 0.9803922, 0, 1, 1,
0.9998143, 1.391505, 1.905269, 0.9843137, 0, 1, 1,
1.001362, 0.09542661, 2.21785, 0.9921569, 0, 1, 1,
1.003108, 0.4215986, 2.960767, 0.9960784, 0, 1, 1,
1.008284, 1.317499, 0.3405114, 1, 0, 0.9960784, 1,
1.016168, -0.4706718, 2.956857, 1, 0, 0.9882353, 1,
1.032631, -0.5989337, 2.818304, 1, 0, 0.9843137, 1,
1.037244, -0.2036982, 3.574535, 1, 0, 0.9764706, 1,
1.038615, -1.146337, 2.910762, 1, 0, 0.972549, 1,
1.046638, 0.1325452, -0.3790902, 1, 0, 0.9647059, 1,
1.047176, 0.3689041, 1.752942, 1, 0, 0.9607843, 1,
1.053887, 0.08081999, 0.6749395, 1, 0, 0.9529412, 1,
1.06108, 1.01538, 2.291, 1, 0, 0.9490196, 1,
1.061909, 0.3310422, 1.245572, 1, 0, 0.9411765, 1,
1.066017, 0.01707943, 1.755309, 1, 0, 0.9372549, 1,
1.071225, 1.181559, -0.8256742, 1, 0, 0.9294118, 1,
1.075138, -0.9842609, 2.593791, 1, 0, 0.9254902, 1,
1.075234, -0.01285968, 1.719829, 1, 0, 0.9176471, 1,
1.078414, -1.005952, 2.970896, 1, 0, 0.9137255, 1,
1.086842, 0.3404508, 0.9209169, 1, 0, 0.9058824, 1,
1.090846, 0.03347132, 0.7214685, 1, 0, 0.9019608, 1,
1.094479, 0.2950908, 0.9401811, 1, 0, 0.8941177, 1,
1.098152, -2.050997, 3.989396, 1, 0, 0.8862745, 1,
1.099607, 0.04537616, 2.791428, 1, 0, 0.8823529, 1,
1.100008, 0.3055573, 2.05982, 1, 0, 0.8745098, 1,
1.100877, -0.3749717, 2.944419, 1, 0, 0.8705882, 1,
1.101825, 0.2842592, 0.5472554, 1, 0, 0.8627451, 1,
1.106906, 0.2282134, 2.141947, 1, 0, 0.8588235, 1,
1.116231, -1.517817, 3.684321, 1, 0, 0.8509804, 1,
1.117704, 0.3242902, 1.048735, 1, 0, 0.8470588, 1,
1.118424, 1.340654, 0.2900335, 1, 0, 0.8392157, 1,
1.130382, 0.7637249, 0.9921312, 1, 0, 0.8352941, 1,
1.142532, -0.6643778, 3.061067, 1, 0, 0.827451, 1,
1.145553, -0.036702, 1.747547, 1, 0, 0.8235294, 1,
1.145561, -0.08098248, 2.440359, 1, 0, 0.8156863, 1,
1.156843, 1.10956, 0.1824165, 1, 0, 0.8117647, 1,
1.157251, 0.9911479, -0.2303125, 1, 0, 0.8039216, 1,
1.159288, -0.9958925, 1.711949, 1, 0, 0.7960784, 1,
1.163134, -1.132926, 1.761891, 1, 0, 0.7921569, 1,
1.179117, -1.740753, 2.043002, 1, 0, 0.7843137, 1,
1.179686, -0.7695072, 2.108552, 1, 0, 0.7803922, 1,
1.184579, -2.487637, 2.321549, 1, 0, 0.772549, 1,
1.190135, 0.7019357, 2.096681, 1, 0, 0.7686275, 1,
1.201834, -0.3451462, 1.59409, 1, 0, 0.7607843, 1,
1.209543, -1.065231, 2.887223, 1, 0, 0.7568628, 1,
1.21083, 1.117668, 1.685796, 1, 0, 0.7490196, 1,
1.213984, 1.990901, 0.6934605, 1, 0, 0.7450981, 1,
1.21532, 0.2392117, 2.80938, 1, 0, 0.7372549, 1,
1.221187, -0.2950025, 0.782302, 1, 0, 0.7333333, 1,
1.227094, -1.087648, 2.413565, 1, 0, 0.7254902, 1,
1.23008, 0.1551645, 2.054609, 1, 0, 0.7215686, 1,
1.236588, 0.01332798, 1.570587, 1, 0, 0.7137255, 1,
1.237411, 0.072241, 0.05356076, 1, 0, 0.7098039, 1,
1.237624, 0.3189727, 0.4616499, 1, 0, 0.7019608, 1,
1.239926, -1.814294, 3.867372, 1, 0, 0.6941177, 1,
1.249958, -0.8114481, 2.669453, 1, 0, 0.6901961, 1,
1.257343, 0.1751146, 1.857472, 1, 0, 0.682353, 1,
1.262037, 0.03829975, -0.6745231, 1, 0, 0.6784314, 1,
1.267249, 1.170887, 0.9604585, 1, 0, 0.6705883, 1,
1.270588, -0.8868734, 2.482707, 1, 0, 0.6666667, 1,
1.273402, -1.517049, 3.650209, 1, 0, 0.6588235, 1,
1.278604, -0.2481961, 1.86224, 1, 0, 0.654902, 1,
1.284649, 0.7074577, 2.786988, 1, 0, 0.6470588, 1,
1.291769, 0.09479502, 0.6759179, 1, 0, 0.6431373, 1,
1.292126, -0.8221062, 2.838189, 1, 0, 0.6352941, 1,
1.296412, 0.8456585, 1.733549, 1, 0, 0.6313726, 1,
1.301392, 0.282723, 0.03938325, 1, 0, 0.6235294, 1,
1.306852, 1.107507, 1.789299, 1, 0, 0.6196079, 1,
1.311796, 2.205871, -0.1394191, 1, 0, 0.6117647, 1,
1.320415, 2.341923, 0.7140303, 1, 0, 0.6078432, 1,
1.323538, 0.3770047, 2.542078, 1, 0, 0.6, 1,
1.330937, 1.621544, 2.329489, 1, 0, 0.5921569, 1,
1.337777, 0.3820084, 1.066517, 1, 0, 0.5882353, 1,
1.339911, -0.4765088, 1.257811, 1, 0, 0.5803922, 1,
1.342346, -0.05085738, 1.296157, 1, 0, 0.5764706, 1,
1.354132, -0.03394428, 1.551903, 1, 0, 0.5686275, 1,
1.357205, -0.876766, 3.954294, 1, 0, 0.5647059, 1,
1.36536, -0.5797743, 0.5762925, 1, 0, 0.5568628, 1,
1.365418, 1.619761, 0.8904243, 1, 0, 0.5529412, 1,
1.373825, -0.4540735, 3.378115, 1, 0, 0.5450981, 1,
1.380751, 0.6602872, 1.200872, 1, 0, 0.5411765, 1,
1.386339, 0.09901107, 0.840777, 1, 0, 0.5333334, 1,
1.401001, 1.468143, 1.42571, 1, 0, 0.5294118, 1,
1.401342, 1.470314, 1.470371, 1, 0, 0.5215687, 1,
1.402834, -2.011494, 0.7515472, 1, 0, 0.5176471, 1,
1.403455, -1.397027, 0.4065797, 1, 0, 0.509804, 1,
1.434825, -0.7987071, 2.837763, 1, 0, 0.5058824, 1,
1.439187, 0.6026627, 1.048546, 1, 0, 0.4980392, 1,
1.444325, 1.336124, 0.9374201, 1, 0, 0.4901961, 1,
1.448227, 1.55468, -0.02064658, 1, 0, 0.4862745, 1,
1.469548, -1.95387, 1.281811, 1, 0, 0.4784314, 1,
1.477916, 0.4656881, 2.651345, 1, 0, 0.4745098, 1,
1.48391, -0.1040744, 0.2199287, 1, 0, 0.4666667, 1,
1.484456, 0.7216427, -0.1549031, 1, 0, 0.4627451, 1,
1.498883, -0.5528595, 0.9857321, 1, 0, 0.454902, 1,
1.519454, 0.06772885, 0.4175475, 1, 0, 0.4509804, 1,
1.519656, 1.922792, 0.6642469, 1, 0, 0.4431373, 1,
1.522591, 0.9987316, 0.7543235, 1, 0, 0.4392157, 1,
1.531939, -0.7011278, 3.05424, 1, 0, 0.4313726, 1,
1.531995, -0.9308636, 3.814328, 1, 0, 0.427451, 1,
1.533818, 1.212511, 0.6469723, 1, 0, 0.4196078, 1,
1.533979, -1.164603, 2.020283, 1, 0, 0.4156863, 1,
1.537928, 0.5224252, 2.385274, 1, 0, 0.4078431, 1,
1.551972, 0.7038598, 0.005831812, 1, 0, 0.4039216, 1,
1.567277, -0.07365678, 2.232712, 1, 0, 0.3960784, 1,
1.574014, -0.8467677, 1.856534, 1, 0, 0.3882353, 1,
1.58712, 0.1223623, -1.360624, 1, 0, 0.3843137, 1,
1.594705, -0.2387216, 0.6663501, 1, 0, 0.3764706, 1,
1.62818, -0.06838077, 2.848896, 1, 0, 0.372549, 1,
1.633325, -2.310298, 2.225178, 1, 0, 0.3647059, 1,
1.645431, -0.3578832, 0.2618138, 1, 0, 0.3607843, 1,
1.65055, -0.9074182, 3.441931, 1, 0, 0.3529412, 1,
1.653078, 0.2090416, 0.8434789, 1, 0, 0.3490196, 1,
1.657253, -1.443749, 2.857731, 1, 0, 0.3411765, 1,
1.680576, 0.4114469, 0.8772396, 1, 0, 0.3372549, 1,
1.701612, 2.610083, 2.247231, 1, 0, 0.3294118, 1,
1.702203, 0.4359366, 0.7021177, 1, 0, 0.3254902, 1,
1.706946, 1.279516, 2.162752, 1, 0, 0.3176471, 1,
1.725038, -1.028673, 2.446036, 1, 0, 0.3137255, 1,
1.731191, -0.995053, 0.8915814, 1, 0, 0.3058824, 1,
1.732575, -1.400106, 1.203901, 1, 0, 0.2980392, 1,
1.766773, 0.5292472, 1.550026, 1, 0, 0.2941177, 1,
1.772235, -0.1807421, 2.662256, 1, 0, 0.2862745, 1,
1.776103, 1.898306, 1.242216, 1, 0, 0.282353, 1,
1.777459, 0.1936673, 1.120604, 1, 0, 0.2745098, 1,
1.803087, 1.137515, 1.268661, 1, 0, 0.2705882, 1,
1.824887, 0.009692807, 0.9850394, 1, 0, 0.2627451, 1,
1.827696, 0.06669433, 0.8264917, 1, 0, 0.2588235, 1,
1.836964, -0.6917536, 2.939865, 1, 0, 0.2509804, 1,
1.853568, -0.4768952, 0.1736263, 1, 0, 0.2470588, 1,
1.855868, 0.8550521, 2.838455, 1, 0, 0.2392157, 1,
1.864073, -0.3246449, 1.33143, 1, 0, 0.2352941, 1,
1.865042, 0.13924, 1.463694, 1, 0, 0.227451, 1,
1.867193, 0.42556, 2.560102, 1, 0, 0.2235294, 1,
1.872379, -0.5935535, 2.247306, 1, 0, 0.2156863, 1,
1.882529, 1.23786, 0.5540691, 1, 0, 0.2117647, 1,
1.890225, 1.796196, 1.071506, 1, 0, 0.2039216, 1,
1.890287, -0.2228817, 1.736346, 1, 0, 0.1960784, 1,
1.893348, 1.38508, 0.7839674, 1, 0, 0.1921569, 1,
1.935815, -0.2236433, 1.679748, 1, 0, 0.1843137, 1,
1.985257, 0.5230684, 1.485185, 1, 0, 0.1803922, 1,
1.986665, -0.6067794, -0.009178687, 1, 0, 0.172549, 1,
1.990398, 0.08213504, 1.855184, 1, 0, 0.1686275, 1,
2.037053, -1.405862, 2.825209, 1, 0, 0.1607843, 1,
2.037446, 0.02854409, 0.9365885, 1, 0, 0.1568628, 1,
2.065973, -1.237494, 0.5921481, 1, 0, 0.1490196, 1,
2.088265, -0.4789154, 0.6441159, 1, 0, 0.145098, 1,
2.098311, 0.406722, 0.9534164, 1, 0, 0.1372549, 1,
2.100106, -1.092378, 2.515879, 1, 0, 0.1333333, 1,
2.102872, -0.2808042, 1.485328, 1, 0, 0.1254902, 1,
2.111772, -1.327288, 1.136221, 1, 0, 0.1215686, 1,
2.137216, 0.9889282, 0.9796405, 1, 0, 0.1137255, 1,
2.16739, -0.09064458, 2.058077, 1, 0, 0.1098039, 1,
2.178502, -0.4615006, 1.730083, 1, 0, 0.1019608, 1,
2.227253, -1.280228, 0.1863581, 1, 0, 0.09411765, 1,
2.229184, 1.329103, 1.710152, 1, 0, 0.09019608, 1,
2.238627, -2.760023, 2.226744, 1, 0, 0.08235294, 1,
2.255539, 1.375775, 0.6822788, 1, 0, 0.07843138, 1,
2.27645, -1.103017, 3.687446, 1, 0, 0.07058824, 1,
2.402697, 0.1030957, 1.48671, 1, 0, 0.06666667, 1,
2.404129, -0.5471909, 2.46276, 1, 0, 0.05882353, 1,
2.471003, -0.3723326, 1.827497, 1, 0, 0.05490196, 1,
2.479607, -0.06339825, 1.966481, 1, 0, 0.04705882, 1,
2.536377, 0.8513788, 1.901738, 1, 0, 0.04313726, 1,
2.574429, 0.5594999, 0.06576535, 1, 0, 0.03529412, 1,
2.668495, -0.996226, 0.9186278, 1, 0, 0.03137255, 1,
2.931166, -0.1086598, 2.101208, 1, 0, 0.02352941, 1,
2.965139, 0.8578384, 0.02752417, 1, 0, 0.01960784, 1,
3.019873, 0.8917894, 2.30534, 1, 0, 0.01176471, 1,
3.082197, -1.133067, 2.950695, 1, 0, 0.007843138, 1
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
-0.04788816, -3.75162, -7.3604, 0, -0.5, 0.5, 0.5,
-0.04788816, -3.75162, -7.3604, 1, -0.5, 0.5, 0.5,
-0.04788816, -3.75162, -7.3604, 1, 1.5, 0.5, 0.5,
-0.04788816, -3.75162, -7.3604, 0, 1.5, 0.5, 0.5
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
-4.239072, 0.1650419, -7.3604, 0, -0.5, 0.5, 0.5,
-4.239072, 0.1650419, -7.3604, 1, -0.5, 0.5, 0.5,
-4.239072, 0.1650419, -7.3604, 1, 1.5, 0.5, 0.5,
-4.239072, 0.1650419, -7.3604, 0, 1.5, 0.5, 0.5
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
-4.239072, -3.75162, -0.2044334, 0, -0.5, 0.5, 0.5,
-4.239072, -3.75162, -0.2044334, 1, -0.5, 0.5, 0.5,
-4.239072, -3.75162, -0.2044334, 1, 1.5, 0.5, 0.5,
-4.239072, -3.75162, -0.2044334, 0, 1.5, 0.5, 0.5
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
-3, -2.847775, -5.709023,
3, -2.847775, -5.709023,
-3, -2.847775, -5.709023,
-3, -2.998415, -5.984253,
-2, -2.847775, -5.709023,
-2, -2.998415, -5.984253,
-1, -2.847775, -5.709023,
-1, -2.998415, -5.984253,
0, -2.847775, -5.709023,
0, -2.998415, -5.984253,
1, -2.847775, -5.709023,
1, -2.998415, -5.984253,
2, -2.847775, -5.709023,
2, -2.998415, -5.984253,
3, -2.847775, -5.709023,
3, -2.998415, -5.984253
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
-3, -3.299697, -6.534712, 0, -0.5, 0.5, 0.5,
-3, -3.299697, -6.534712, 1, -0.5, 0.5, 0.5,
-3, -3.299697, -6.534712, 1, 1.5, 0.5, 0.5,
-3, -3.299697, -6.534712, 0, 1.5, 0.5, 0.5,
-2, -3.299697, -6.534712, 0, -0.5, 0.5, 0.5,
-2, -3.299697, -6.534712, 1, -0.5, 0.5, 0.5,
-2, -3.299697, -6.534712, 1, 1.5, 0.5, 0.5,
-2, -3.299697, -6.534712, 0, 1.5, 0.5, 0.5,
-1, -3.299697, -6.534712, 0, -0.5, 0.5, 0.5,
-1, -3.299697, -6.534712, 1, -0.5, 0.5, 0.5,
-1, -3.299697, -6.534712, 1, 1.5, 0.5, 0.5,
-1, -3.299697, -6.534712, 0, 1.5, 0.5, 0.5,
0, -3.299697, -6.534712, 0, -0.5, 0.5, 0.5,
0, -3.299697, -6.534712, 1, -0.5, 0.5, 0.5,
0, -3.299697, -6.534712, 1, 1.5, 0.5, 0.5,
0, -3.299697, -6.534712, 0, 1.5, 0.5, 0.5,
1, -3.299697, -6.534712, 0, -0.5, 0.5, 0.5,
1, -3.299697, -6.534712, 1, -0.5, 0.5, 0.5,
1, -3.299697, -6.534712, 1, 1.5, 0.5, 0.5,
1, -3.299697, -6.534712, 0, 1.5, 0.5, 0.5,
2, -3.299697, -6.534712, 0, -0.5, 0.5, 0.5,
2, -3.299697, -6.534712, 1, -0.5, 0.5, 0.5,
2, -3.299697, -6.534712, 1, 1.5, 0.5, 0.5,
2, -3.299697, -6.534712, 0, 1.5, 0.5, 0.5,
3, -3.299697, -6.534712, 0, -0.5, 0.5, 0.5,
3, -3.299697, -6.534712, 1, -0.5, 0.5, 0.5,
3, -3.299697, -6.534712, 1, 1.5, 0.5, 0.5,
3, -3.299697, -6.534712, 0, 1.5, 0.5, 0.5
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
-3.271876, -2, -5.709023,
-3.271876, 3, -5.709023,
-3.271876, -2, -5.709023,
-3.433075, -2, -5.984253,
-3.271876, -1, -5.709023,
-3.433075, -1, -5.984253,
-3.271876, 0, -5.709023,
-3.433075, 0, -5.984253,
-3.271876, 1, -5.709023,
-3.433075, 1, -5.984253,
-3.271876, 2, -5.709023,
-3.433075, 2, -5.984253,
-3.271876, 3, -5.709023,
-3.433075, 3, -5.984253
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
-3.755474, -2, -6.534712, 0, -0.5, 0.5, 0.5,
-3.755474, -2, -6.534712, 1, -0.5, 0.5, 0.5,
-3.755474, -2, -6.534712, 1, 1.5, 0.5, 0.5,
-3.755474, -2, -6.534712, 0, 1.5, 0.5, 0.5,
-3.755474, -1, -6.534712, 0, -0.5, 0.5, 0.5,
-3.755474, -1, -6.534712, 1, -0.5, 0.5, 0.5,
-3.755474, -1, -6.534712, 1, 1.5, 0.5, 0.5,
-3.755474, -1, -6.534712, 0, 1.5, 0.5, 0.5,
-3.755474, 0, -6.534712, 0, -0.5, 0.5, 0.5,
-3.755474, 0, -6.534712, 1, -0.5, 0.5, 0.5,
-3.755474, 0, -6.534712, 1, 1.5, 0.5, 0.5,
-3.755474, 0, -6.534712, 0, 1.5, 0.5, 0.5,
-3.755474, 1, -6.534712, 0, -0.5, 0.5, 0.5,
-3.755474, 1, -6.534712, 1, -0.5, 0.5, 0.5,
-3.755474, 1, -6.534712, 1, 1.5, 0.5, 0.5,
-3.755474, 1, -6.534712, 0, 1.5, 0.5, 0.5,
-3.755474, 2, -6.534712, 0, -0.5, 0.5, 0.5,
-3.755474, 2, -6.534712, 1, -0.5, 0.5, 0.5,
-3.755474, 2, -6.534712, 1, 1.5, 0.5, 0.5,
-3.755474, 2, -6.534712, 0, 1.5, 0.5, 0.5,
-3.755474, 3, -6.534712, 0, -0.5, 0.5, 0.5,
-3.755474, 3, -6.534712, 1, -0.5, 0.5, 0.5,
-3.755474, 3, -6.534712, 1, 1.5, 0.5, 0.5,
-3.755474, 3, -6.534712, 0, 1.5, 0.5, 0.5
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
-3.271876, -2.847775, -4,
-3.271876, -2.847775, 4,
-3.271876, -2.847775, -4,
-3.433075, -2.998415, -4,
-3.271876, -2.847775, -2,
-3.433075, -2.998415, -2,
-3.271876, -2.847775, 0,
-3.433075, -2.998415, 0,
-3.271876, -2.847775, 2,
-3.433075, -2.998415, 2,
-3.271876, -2.847775, 4,
-3.433075, -2.998415, 4
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
-3.755474, -3.299697, -4, 0, -0.5, 0.5, 0.5,
-3.755474, -3.299697, -4, 1, -0.5, 0.5, 0.5,
-3.755474, -3.299697, -4, 1, 1.5, 0.5, 0.5,
-3.755474, -3.299697, -4, 0, 1.5, 0.5, 0.5,
-3.755474, -3.299697, -2, 0, -0.5, 0.5, 0.5,
-3.755474, -3.299697, -2, 1, -0.5, 0.5, 0.5,
-3.755474, -3.299697, -2, 1, 1.5, 0.5, 0.5,
-3.755474, -3.299697, -2, 0, 1.5, 0.5, 0.5,
-3.755474, -3.299697, 0, 0, -0.5, 0.5, 0.5,
-3.755474, -3.299697, 0, 1, -0.5, 0.5, 0.5,
-3.755474, -3.299697, 0, 1, 1.5, 0.5, 0.5,
-3.755474, -3.299697, 0, 0, 1.5, 0.5, 0.5,
-3.755474, -3.299697, 2, 0, -0.5, 0.5, 0.5,
-3.755474, -3.299697, 2, 1, -0.5, 0.5, 0.5,
-3.755474, -3.299697, 2, 1, 1.5, 0.5, 0.5,
-3.755474, -3.299697, 2, 0, 1.5, 0.5, 0.5,
-3.755474, -3.299697, 4, 0, -0.5, 0.5, 0.5,
-3.755474, -3.299697, 4, 1, -0.5, 0.5, 0.5,
-3.755474, -3.299697, 4, 1, 1.5, 0.5, 0.5,
-3.755474, -3.299697, 4, 0, 1.5, 0.5, 0.5
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
-3.271876, -2.847775, -5.709023,
-3.271876, 3.177858, -5.709023,
-3.271876, -2.847775, 5.300157,
-3.271876, 3.177858, 5.300157,
-3.271876, -2.847775, -5.709023,
-3.271876, -2.847775, 5.300157,
-3.271876, 3.177858, -5.709023,
-3.271876, 3.177858, 5.300157,
-3.271876, -2.847775, -5.709023,
3.1761, -2.847775, -5.709023,
-3.271876, -2.847775, 5.300157,
3.1761, -2.847775, 5.300157,
-3.271876, 3.177858, -5.709023,
3.1761, 3.177858, -5.709023,
-3.271876, 3.177858, 5.300157,
3.1761, 3.177858, 5.300157,
3.1761, -2.847775, -5.709023,
3.1761, 3.177858, -5.709023,
3.1761, -2.847775, 5.300157,
3.1761, 3.177858, 5.300157,
3.1761, -2.847775, -5.709023,
3.1761, -2.847775, 5.300157,
3.1761, 3.177858, -5.709023,
3.1761, 3.177858, 5.300157
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
var radius = 7.534364;
var distance = 33.52123;
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
mvMatrix.translate( 0.04788816, -0.1650419, 0.2044334 );
mvMatrix.scale( 1.263389, 1.351941, 0.7399553 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.52123);
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
cinmethylin<-read.table("cinmethylin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cinmethylin$V2
```

```
## Error in eval(expr, envir, enclos): object 'cinmethylin' not found
```

```r
y<-cinmethylin$V3
```

```
## Error in eval(expr, envir, enclos): object 'cinmethylin' not found
```

```r
z<-cinmethylin$V4
```

```
## Error in eval(expr, envir, enclos): object 'cinmethylin' not found
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
-3.177973, 0.5757906, -3.034397, 0, 0, 1, 1, 1,
-2.815778, 2.609823, -1.024245, 1, 0, 0, 1, 1,
-2.642161, -0.561653, -1.823622, 1, 0, 0, 1, 1,
-2.63388, 1.846859, -1.132349, 1, 0, 0, 1, 1,
-2.565849, -0.5178174, -3.009387, 1, 0, 0, 1, 1,
-2.548494, 0.8430659, -1.67809, 1, 0, 0, 1, 1,
-2.350347, -1.694312, -1.624488, 0, 0, 0, 1, 1,
-2.197553, 0.1358378, -1.688398, 0, 0, 0, 1, 1,
-2.09155, -0.03235512, -1.470394, 0, 0, 0, 1, 1,
-2.089913, -0.1962476, -2.997964, 0, 0, 0, 1, 1,
-2.064839, -0.1375784, -2.168629, 0, 0, 0, 1, 1,
-2.030025, -0.8157408, -1.242472, 0, 0, 0, 1, 1,
-2.000101, -0.07129684, -1.529447, 0, 0, 0, 1, 1,
-1.990872, -0.2077293, -1.888624, 1, 1, 1, 1, 1,
-1.976969, 0.5626374, -0.7523001, 1, 1, 1, 1, 1,
-1.976728, 0.4006968, -1.026635, 1, 1, 1, 1, 1,
-1.974605, 0.1265948, -2.369061, 1, 1, 1, 1, 1,
-1.926508, -1.525768, -3.631407, 1, 1, 1, 1, 1,
-1.883375, -0.5140945, -2.881011, 1, 1, 1, 1, 1,
-1.879669, -1.098032, -2.10067, 1, 1, 1, 1, 1,
-1.876448, 1.451935, -2.165424, 1, 1, 1, 1, 1,
-1.869445, -0.2518207, -1.101764, 1, 1, 1, 1, 1,
-1.868397, 1.16547, -1.886855, 1, 1, 1, 1, 1,
-1.845195, -0.06304159, -2.059553, 1, 1, 1, 1, 1,
-1.839655, -1.587502, -1.678684, 1, 1, 1, 1, 1,
-1.826575, -1.092674, -2.440395, 1, 1, 1, 1, 1,
-1.819504, 0.5588881, -0.4631523, 1, 1, 1, 1, 1,
-1.815844, -1.904944, 0.244205, 1, 1, 1, 1, 1,
-1.815299, -0.3758075, -2.402975, 0, 0, 1, 1, 1,
-1.795113, 0.04657502, -0.8481022, 1, 0, 0, 1, 1,
-1.782597, 0.7611007, -1.707061, 1, 0, 0, 1, 1,
-1.775167, -1.350393, -2.186992, 1, 0, 0, 1, 1,
-1.764395, 2.326724, -0.5394748, 1, 0, 0, 1, 1,
-1.760888, -0.4687834, -2.337353, 1, 0, 0, 1, 1,
-1.755339, 0.183898, -0.2383483, 0, 0, 0, 1, 1,
-1.755051, -1.57854, -2.958522, 0, 0, 0, 1, 1,
-1.750926, -0.8633111, -1.994666, 0, 0, 0, 1, 1,
-1.750499, 0.5044563, -2.853603, 0, 0, 0, 1, 1,
-1.744761, 0.3351031, -0.02178911, 0, 0, 0, 1, 1,
-1.744301, -1.684481, -1.766972, 0, 0, 0, 1, 1,
-1.718322, -1.458031, -4.446246, 0, 0, 0, 1, 1,
-1.717145, 0.3823232, -1.268096, 1, 1, 1, 1, 1,
-1.712924, 0.05526796, -2.666866, 1, 1, 1, 1, 1,
-1.702397, 0.5522861, -0.7300749, 1, 1, 1, 1, 1,
-1.700087, -0.07063414, -1.056618, 1, 1, 1, 1, 1,
-1.68686, -0.5972582, -2.456475, 1, 1, 1, 1, 1,
-1.680957, -0.8166735, -0.7621334, 1, 1, 1, 1, 1,
-1.673885, -0.653362, -2.605041, 1, 1, 1, 1, 1,
-1.652578, 0.9414952, -1.481085, 1, 1, 1, 1, 1,
-1.644107, -1.826683, -2.531789, 1, 1, 1, 1, 1,
-1.64089, 0.349858, -1.217439, 1, 1, 1, 1, 1,
-1.630038, 0.7092323, 0.1218374, 1, 1, 1, 1, 1,
-1.628839, 1.911034, -0.6042911, 1, 1, 1, 1, 1,
-1.60105, 1.552299, -0.1316229, 1, 1, 1, 1, 1,
-1.593141, -0.01063362, -0.7885701, 1, 1, 1, 1, 1,
-1.579808, -1.051599, -2.677014, 1, 1, 1, 1, 1,
-1.575782, 1.141532, 0.03996618, 0, 0, 1, 1, 1,
-1.569737, 0.388322, -2.150942, 1, 0, 0, 1, 1,
-1.564761, -0.164618, -1.267549, 1, 0, 0, 1, 1,
-1.56432, 1.740279, -1.079756, 1, 0, 0, 1, 1,
-1.562421, -0.2827253, -1.227989, 1, 0, 0, 1, 1,
-1.560807, -2.694227, -3.040205, 1, 0, 0, 1, 1,
-1.558901, -0.2218422, -1.244017, 0, 0, 0, 1, 1,
-1.515396, 1.130956, -2.04295, 0, 0, 0, 1, 1,
-1.512237, -2.278744, -2.885131, 0, 0, 0, 1, 1,
-1.499253, -0.4575624, -1.871296, 0, 0, 0, 1, 1,
-1.497921, -0.2381383, -1.716267, 0, 0, 0, 1, 1,
-1.488667, -1.303648, -1.395136, 0, 0, 0, 1, 1,
-1.488591, 0.4378071, -1.277354, 0, 0, 0, 1, 1,
-1.485885, -0.02800188, -0.7078156, 1, 1, 1, 1, 1,
-1.473666, 1.366989, -2.223196, 1, 1, 1, 1, 1,
-1.46814, 0.2637978, -1.895079, 1, 1, 1, 1, 1,
-1.46738, -0.428943, -1.803593, 1, 1, 1, 1, 1,
-1.463829, -0.6449312, -1.213188, 1, 1, 1, 1, 1,
-1.462093, 1.091115, -0.43878, 1, 1, 1, 1, 1,
-1.451372, 0.08418355, -0.7889521, 1, 1, 1, 1, 1,
-1.44785, 1.472438, 0.008084117, 1, 1, 1, 1, 1,
-1.432359, -0.5307881, -1.866495, 1, 1, 1, 1, 1,
-1.424966, 0.1710486, -1.668043, 1, 1, 1, 1, 1,
-1.422877, -0.4919384, -2.110863, 1, 1, 1, 1, 1,
-1.422291, -0.4574545, -0.8963372, 1, 1, 1, 1, 1,
-1.418534, -1.848129, -2.30064, 1, 1, 1, 1, 1,
-1.417938, 1.083649, -1.311103, 1, 1, 1, 1, 1,
-1.414072, 0.4075218, -0.8949772, 1, 1, 1, 1, 1,
-1.413078, -0.1972955, -1.405394, 0, 0, 1, 1, 1,
-1.411314, -1.504211, -2.697336, 1, 0, 0, 1, 1,
-1.405347, -0.3909085, -2.535582, 1, 0, 0, 1, 1,
-1.404254, -1.262446, -1.231224, 1, 0, 0, 1, 1,
-1.403507, 0.7992612, -0.3332912, 1, 0, 0, 1, 1,
-1.40297, -0.9889161, -1.171318, 1, 0, 0, 1, 1,
-1.396222, -1.141847, -3.003339, 0, 0, 0, 1, 1,
-1.392175, -0.357333, -3.615733, 0, 0, 0, 1, 1,
-1.391772, -0.1490293, -2.160339, 0, 0, 0, 1, 1,
-1.388269, 0.1163307, -0.5481725, 0, 0, 0, 1, 1,
-1.381588, 1.798122, -0.9581154, 0, 0, 0, 1, 1,
-1.360381, 1.083212, -1.782384, 0, 0, 0, 1, 1,
-1.354902, 1.218271, 0.008883, 0, 0, 0, 1, 1,
-1.350183, 0.7720405, -1.277129, 1, 1, 1, 1, 1,
-1.345024, -0.05015257, -1.268582, 1, 1, 1, 1, 1,
-1.342517, -1.357541, -4.631445, 1, 1, 1, 1, 1,
-1.334275, -0.6802379, -0.8988997, 1, 1, 1, 1, 1,
-1.333855, -0.3782084, -3.210499, 1, 1, 1, 1, 1,
-1.333657, 0.1111743, -2.646456, 1, 1, 1, 1, 1,
-1.324797, -0.4790407, -2.256004, 1, 1, 1, 1, 1,
-1.310891, 0.08796219, -0.6392954, 1, 1, 1, 1, 1,
-1.303801, -0.3878287, -2.94439, 1, 1, 1, 1, 1,
-1.300156, -0.6222379, -3.446656, 1, 1, 1, 1, 1,
-1.297109, 0.2638699, -2.757192, 1, 1, 1, 1, 1,
-1.293844, -1.0302, -1.293342, 1, 1, 1, 1, 1,
-1.283832, -0.3500901, -1.148893, 1, 1, 1, 1, 1,
-1.2832, -1.617234, -2.449831, 1, 1, 1, 1, 1,
-1.278486, 0.6040556, -1.920886, 1, 1, 1, 1, 1,
-1.27642, -0.6639386, -1.464969, 0, 0, 1, 1, 1,
-1.274725, 0.2700652, -2.440357, 1, 0, 0, 1, 1,
-1.259808, 0.510805, -1.058594, 1, 0, 0, 1, 1,
-1.255173, -0.2833378, -1.923316, 1, 0, 0, 1, 1,
-1.238392, 0.534965, -2.12832, 1, 0, 0, 1, 1,
-1.235429, 0.9549389, 0.5321743, 1, 0, 0, 1, 1,
-1.231133, 0.9189186, 0.5000789, 0, 0, 0, 1, 1,
-1.222157, -2.065071, -2.966635, 0, 0, 0, 1, 1,
-1.2207, -0.1566964, -1.932887, 0, 0, 0, 1, 1,
-1.219511, 0.8007105, -1.1473, 0, 0, 0, 1, 1,
-1.199945, 0.608486, 0.3984611, 0, 0, 0, 1, 1,
-1.196685, 0.1043302, -1.569508, 0, 0, 0, 1, 1,
-1.19015, -0.88405, -0.9967979, 0, 0, 0, 1, 1,
-1.187532, 0.5655448, -0.9353796, 1, 1, 1, 1, 1,
-1.183841, 0.6586576, -1.966208, 1, 1, 1, 1, 1,
-1.175657, -1.046441, -2.081247, 1, 1, 1, 1, 1,
-1.17558, -0.3052772, -2.205396, 1, 1, 1, 1, 1,
-1.170962, 1.250984, -0.5236772, 1, 1, 1, 1, 1,
-1.167133, 0.03592442, -3.231023, 1, 1, 1, 1, 1,
-1.161077, -0.8426501, -2.547023, 1, 1, 1, 1, 1,
-1.158515, -1.386703, -4.263001, 1, 1, 1, 1, 1,
-1.155856, -0.6015402, -2.402436, 1, 1, 1, 1, 1,
-1.147818, 0.7358109, -1.012308, 1, 1, 1, 1, 1,
-1.144698, 0.4399685, -1.141422, 1, 1, 1, 1, 1,
-1.135515, 0.1705246, -1.973598, 1, 1, 1, 1, 1,
-1.131215, 1.968585, -0.8132784, 1, 1, 1, 1, 1,
-1.126056, -1.704804, -2.833774, 1, 1, 1, 1, 1,
-1.119779, 0.2524161, -0.01048377, 1, 1, 1, 1, 1,
-1.114162, -0.7417972, -3.220618, 0, 0, 1, 1, 1,
-1.109334, -0.1312728, -0.01338604, 1, 0, 0, 1, 1,
-1.103838, -0.8882576, -2.589635, 1, 0, 0, 1, 1,
-1.100097, -0.1371063, -2.614072, 1, 0, 0, 1, 1,
-1.097784, 0.9908144, -1.334627, 1, 0, 0, 1, 1,
-1.095947, 2.135567, -0.7302831, 1, 0, 0, 1, 1,
-1.093097, 0.1502378, -2.448026, 0, 0, 0, 1, 1,
-1.092494, 0.1891247, 0.5074297, 0, 0, 0, 1, 1,
-1.088839, -0.8628173, -4.336601, 0, 0, 0, 1, 1,
-1.080678, 0.9548485, -0.9511674, 0, 0, 0, 1, 1,
-1.070443, -0.9851294, -1.496393, 0, 0, 0, 1, 1,
-1.062663, 1.537046, -0.3211945, 0, 0, 0, 1, 1,
-1.054422, -1.025891, -2.176419, 0, 0, 0, 1, 1,
-1.051077, -0.9077071, -2.974836, 1, 1, 1, 1, 1,
-1.045792, -0.3006575, -2.29071, 1, 1, 1, 1, 1,
-1.044807, 1.824531, -0.5294264, 1, 1, 1, 1, 1,
-1.03328, 0.984461, -0.4483774, 1, 1, 1, 1, 1,
-1.03041, -0.817972, 1.094503, 1, 1, 1, 1, 1,
-1.029513, -0.00775471, -0.3858261, 1, 1, 1, 1, 1,
-1.028305, 0.3306685, -0.6078156, 1, 1, 1, 1, 1,
-1.017794, 1.360432, 0.5336717, 1, 1, 1, 1, 1,
-1.006953, -0.4424122, -1.834876, 1, 1, 1, 1, 1,
-1.005947, -0.4967084, -0.5318831, 1, 1, 1, 1, 1,
-1.00389, 0.08121875, -0.9813731, 1, 1, 1, 1, 1,
-1.001918, -0.2260808, -2.036726, 1, 1, 1, 1, 1,
-1.001619, 0.7998084, -1.636164, 1, 1, 1, 1, 1,
-0.9912297, -0.5314834, -1.964407, 1, 1, 1, 1, 1,
-0.9899575, -0.2878673, -3.337327, 1, 1, 1, 1, 1,
-0.9898, 2.051878, 0.8534468, 0, 0, 1, 1, 1,
-0.9816754, 1.587091, -1.738808, 1, 0, 0, 1, 1,
-0.9802706, 0.6410509, -0.7423905, 1, 0, 0, 1, 1,
-0.9757863, 0.8744268, -0.5899705, 1, 0, 0, 1, 1,
-0.9755886, -0.4974689, -1.885877, 1, 0, 0, 1, 1,
-0.973536, 0.8692731, 0.0692317, 1, 0, 0, 1, 1,
-0.9552718, -0.314527, -0.3855637, 0, 0, 0, 1, 1,
-0.9461064, -1.798432, -3.089259, 0, 0, 0, 1, 1,
-0.9389378, -2.457564, -4.737069, 0, 0, 0, 1, 1,
-0.9377743, 0.4978027, -1.967629, 0, 0, 0, 1, 1,
-0.9374644, -1.590122, -3.650647, 0, 0, 0, 1, 1,
-0.9372867, 2.355262, -1.409911, 0, 0, 0, 1, 1,
-0.936736, -2.026274, -1.544617, 0, 0, 0, 1, 1,
-0.9274099, -0.3045405, -2.676539, 1, 1, 1, 1, 1,
-0.9259036, -0.960485, -3.131197, 1, 1, 1, 1, 1,
-0.9227023, -0.3577343, -2.536745, 1, 1, 1, 1, 1,
-0.9224521, 0.1074144, -0.3459708, 1, 1, 1, 1, 1,
-0.9156319, 0.5746818, -0.7987284, 1, 1, 1, 1, 1,
-0.9095441, 0.2243443, -2.097858, 1, 1, 1, 1, 1,
-0.9082801, -0.5554429, -1.444369, 1, 1, 1, 1, 1,
-0.9068369, -0.3728504, -1.950502, 1, 1, 1, 1, 1,
-0.9044702, -0.8213785, 0.1573207, 1, 1, 1, 1, 1,
-0.8926063, -0.01551664, -1.058381, 1, 1, 1, 1, 1,
-0.8898119, -0.9302859, -3.787915, 1, 1, 1, 1, 1,
-0.8844134, 0.7380271, -1.241748, 1, 1, 1, 1, 1,
-0.8798684, -1.025178, -1.983272, 1, 1, 1, 1, 1,
-0.8754061, -0.1746829, -2.289162, 1, 1, 1, 1, 1,
-0.8733431, 0.1270994, -1.934234, 1, 1, 1, 1, 1,
-0.8728733, 0.4712149, -2.697795, 0, 0, 1, 1, 1,
-0.8723896, 0.1470191, -1.234553, 1, 0, 0, 1, 1,
-0.8707594, -2.033951, -2.01524, 1, 0, 0, 1, 1,
-0.8610616, 1.447548, -0.676595, 1, 0, 0, 1, 1,
-0.8506256, 0.820933, -1.187622, 1, 0, 0, 1, 1,
-0.8505465, -0.9409636, -2.145422, 1, 0, 0, 1, 1,
-0.8407063, -0.5943593, -0.6704776, 0, 0, 0, 1, 1,
-0.8314081, 1.165063, 0.3226089, 0, 0, 0, 1, 1,
-0.8290195, -0.06392673, -2.285279, 0, 0, 0, 1, 1,
-0.8250966, -1.237408, -0.5450788, 0, 0, 0, 1, 1,
-0.8195467, -0.8833823, -1.664943, 0, 0, 0, 1, 1,
-0.8108498, -0.3880428, -2.399023, 0, 0, 0, 1, 1,
-0.8062817, 0.5056126, -0.5135856, 0, 0, 0, 1, 1,
-0.8054919, -0.3474731, -3.142589, 1, 1, 1, 1, 1,
-0.8051711, 0.08811535, -2.777063, 1, 1, 1, 1, 1,
-0.8022497, -0.4700322, -5.002267, 1, 1, 1, 1, 1,
-0.7927656, -0.2231427, -1.705866, 1, 1, 1, 1, 1,
-0.7841915, 0.08088206, -1.61399, 1, 1, 1, 1, 1,
-0.7823524, -0.6090113, 0.1168066, 1, 1, 1, 1, 1,
-0.7758928, 0.4105076, -0.2499854, 1, 1, 1, 1, 1,
-0.7758583, 1.40068, -1.055213, 1, 1, 1, 1, 1,
-0.7756081, 2.019298, -1.244279, 1, 1, 1, 1, 1,
-0.7731661, -1.100258, -1.345935, 1, 1, 1, 1, 1,
-0.7686925, 1.939075, -1.379974, 1, 1, 1, 1, 1,
-0.7656388, -1.274758, -3.550365, 1, 1, 1, 1, 1,
-0.7634698, 0.2835039, -2.458604, 1, 1, 1, 1, 1,
-0.7563281, 0.7906513, 0.1017632, 1, 1, 1, 1, 1,
-0.7553006, 0.9592346, -0.3730561, 1, 1, 1, 1, 1,
-0.7491117, 0.002553737, 0.3057967, 0, 0, 1, 1, 1,
-0.7472584, -2.322888, -1.83128, 1, 0, 0, 1, 1,
-0.7463024, 0.32922, 0.957261, 1, 0, 0, 1, 1,
-0.7433115, 0.3557018, -2.021153, 1, 0, 0, 1, 1,
-0.7428845, -0.3024381, -2.483424, 1, 0, 0, 1, 1,
-0.7214313, -1.132918, -3.044202, 1, 0, 0, 1, 1,
-0.7195066, 1.073789, 0.5262589, 0, 0, 0, 1, 1,
-0.715818, 0.7985237, -0.1351807, 0, 0, 0, 1, 1,
-0.7148339, -0.3900406, -3.226381, 0, 0, 0, 1, 1,
-0.7091568, 1.653426, -2.069062, 0, 0, 0, 1, 1,
-0.7089862, 0.8522208, -2.622987, 0, 0, 0, 1, 1,
-0.7072796, -1.147061, -1.906974, 0, 0, 0, 1, 1,
-0.7066481, -0.4229855, -2.536387, 0, 0, 0, 1, 1,
-0.7031611, 0.6396305, -2.402254, 1, 1, 1, 1, 1,
-0.7023888, 0.4661585, 0.9519293, 1, 1, 1, 1, 1,
-0.7023725, -0.786051, -3.744593, 1, 1, 1, 1, 1,
-0.6971643, 0.102098, -1.484993, 1, 1, 1, 1, 1,
-0.6947094, -0.7993625, -3.254071, 1, 1, 1, 1, 1,
-0.6829127, -0.4091844, -2.90549, 1, 1, 1, 1, 1,
-0.677839, 1.113764, -0.6610622, 1, 1, 1, 1, 1,
-0.6757102, -0.7577457, -2.320566, 1, 1, 1, 1, 1,
-0.6724324, -0.5936823, -1.91167, 1, 1, 1, 1, 1,
-0.6703667, 0.9357107, -1.644409, 1, 1, 1, 1, 1,
-0.6702878, -0.7396796, -3.961912, 1, 1, 1, 1, 1,
-0.6695271, -0.2397145, -2.172136, 1, 1, 1, 1, 1,
-0.6687604, 1.463872, -0.7843219, 1, 1, 1, 1, 1,
-0.6686097, 0.3874088, -1.515166, 1, 1, 1, 1, 1,
-0.6648922, 1.0758, -1.386897, 1, 1, 1, 1, 1,
-0.6646168, -0.2332974, 0.3045979, 0, 0, 1, 1, 1,
-0.661575, 0.2529429, -1.256045, 1, 0, 0, 1, 1,
-0.6543761, 0.3463109, -2.159106, 1, 0, 0, 1, 1,
-0.644745, 1.360707, -0.08097085, 1, 0, 0, 1, 1,
-0.635169, 0.6238105, -1.320621, 1, 0, 0, 1, 1,
-0.6323105, -0.4957671, -1.974537, 1, 0, 0, 1, 1,
-0.6300719, -0.6008952, -1.926793, 0, 0, 0, 1, 1,
-0.6288698, -1.010687, -2.892588, 0, 0, 0, 1, 1,
-0.6221708, -0.7913046, -2.597563, 0, 0, 0, 1, 1,
-0.6219853, -0.08188605, -0.2160077, 0, 0, 0, 1, 1,
-0.6219853, 0.3234484, -1.561845, 0, 0, 0, 1, 1,
-0.6174951, 0.01412688, -1.022723, 0, 0, 0, 1, 1,
-0.6172714, 0.9103427, -0.9983314, 0, 0, 0, 1, 1,
-0.6169335, -1.092619, -5.111841, 1, 1, 1, 1, 1,
-0.6159945, 0.2322375, 1.110325, 1, 1, 1, 1, 1,
-0.6055683, 0.7039735, -0.9900234, 1, 1, 1, 1, 1,
-0.6050968, 0.3837536, -0.06220876, 1, 1, 1, 1, 1,
-0.6001377, 0.5903441, 0.5055541, 1, 1, 1, 1, 1,
-0.5995883, 0.6259295, 0.7749323, 1, 1, 1, 1, 1,
-0.5914559, 0.5775629, -1.314034, 1, 1, 1, 1, 1,
-0.5897841, 0.1742941, -1.619015, 1, 1, 1, 1, 1,
-0.5891012, -1.614962, -2.346987, 1, 1, 1, 1, 1,
-0.5859696, -0.5615948, -1.221674, 1, 1, 1, 1, 1,
-0.5853477, -1.587861, -3.60214, 1, 1, 1, 1, 1,
-0.5808647, 1.870959, 0.562973, 1, 1, 1, 1, 1,
-0.5771345, 0.5583534, -1.428221, 1, 1, 1, 1, 1,
-0.5768441, -0.1242866, -3.203037, 1, 1, 1, 1, 1,
-0.5749642, 1.894669, -0.474354, 1, 1, 1, 1, 1,
-0.5730019, 0.6439414, -1.828753, 0, 0, 1, 1, 1,
-0.5728286, 0.297646, -1.340474, 1, 0, 0, 1, 1,
-0.5700626, -0.2092303, -3.839887, 1, 0, 0, 1, 1,
-0.5697716, 0.5203527, -1.685327, 1, 0, 0, 1, 1,
-0.5659763, -0.4622306, -3.474925, 1, 0, 0, 1, 1,
-0.5632567, 2.515421, -0.6939328, 1, 0, 0, 1, 1,
-0.5589669, -0.6558419, -2.477575, 0, 0, 0, 1, 1,
-0.5575564, 0.06272952, -2.315197, 0, 0, 0, 1, 1,
-0.5557635, 0.5975218, -2.937942, 0, 0, 0, 1, 1,
-0.5530915, -0.9297275, -4.712225, 0, 0, 0, 1, 1,
-0.551448, 0.4657739, -1.092803, 0, 0, 0, 1, 1,
-0.5509785, 0.4828619, -1.22163, 0, 0, 0, 1, 1,
-0.547451, -0.02813291, -2.398817, 0, 0, 0, 1, 1,
-0.5468846, -0.4383438, -1.696972, 1, 1, 1, 1, 1,
-0.5436457, -0.04568294, -1.365841, 1, 1, 1, 1, 1,
-0.5427725, 0.08842739, -1.814492, 1, 1, 1, 1, 1,
-0.5412049, -1.074604, -3.214466, 1, 1, 1, 1, 1,
-0.537112, 1.067141, -1.495752, 1, 1, 1, 1, 1,
-0.5357856, 0.8047217, 0.2151041, 1, 1, 1, 1, 1,
-0.5292929, 1.519371, 0.03019375, 1, 1, 1, 1, 1,
-0.5282274, 0.1411588, -1.902985, 1, 1, 1, 1, 1,
-0.5235546, 0.2790264, -0.2170052, 1, 1, 1, 1, 1,
-0.5150468, 0.6386241, 0.2736314, 1, 1, 1, 1, 1,
-0.5150254, -0.1366747, -1.243321, 1, 1, 1, 1, 1,
-0.5147623, 0.686805, -1.934698, 1, 1, 1, 1, 1,
-0.5134581, 1.029653, -0.6713766, 1, 1, 1, 1, 1,
-0.5132113, -0.3633919, -1.093171, 1, 1, 1, 1, 1,
-0.5104523, -1.24447, -4.013321, 1, 1, 1, 1, 1,
-0.5090508, -1.187938, -2.708533, 0, 0, 1, 1, 1,
-0.507258, 0.9442372, -1.256029, 1, 0, 0, 1, 1,
-0.5037909, 1.042042, 0.7527931, 1, 0, 0, 1, 1,
-0.5030881, -0.3435372, -1.693479, 1, 0, 0, 1, 1,
-0.5008202, 0.4555602, -0.6625904, 1, 0, 0, 1, 1,
-0.5006374, -1.725578, -1.852239, 1, 0, 0, 1, 1,
-0.5004525, 0.156344, -3.445706, 0, 0, 0, 1, 1,
-0.4949883, 0.002473918, 0.5025679, 0, 0, 0, 1, 1,
-0.4890504, -1.383125, -1.026576, 0, 0, 0, 1, 1,
-0.4875634, 0.6687758, -1.813217, 0, 0, 0, 1, 1,
-0.4860729, -0.3901362, -0.9509209, 0, 0, 0, 1, 1,
-0.4845999, 0.7911115, -0.3893647, 0, 0, 0, 1, 1,
-0.4842852, 0.5129187, -0.7847679, 0, 0, 0, 1, 1,
-0.4841164, -2.183892, -2.337316, 1, 1, 1, 1, 1,
-0.4838082, -0.8032761, -4.228199, 1, 1, 1, 1, 1,
-0.4832275, -0.08420303, -1.012809, 1, 1, 1, 1, 1,
-0.4791153, -1.960348, -1.474162, 1, 1, 1, 1, 1,
-0.4776503, -1.19706, -3.170077, 1, 1, 1, 1, 1,
-0.4743716, 0.9854381, -1.301786, 1, 1, 1, 1, 1,
-0.4721532, -0.5148217, -1.702105, 1, 1, 1, 1, 1,
-0.4705698, 1.985824, -0.6220334, 1, 1, 1, 1, 1,
-0.4617674, 2.801582, -1.548263, 1, 1, 1, 1, 1,
-0.457165, 2.40596, -0.7788249, 1, 1, 1, 1, 1,
-0.4541863, 0.4122263, 1.006148, 1, 1, 1, 1, 1,
-0.4522222, 0.4391136, -1.498552, 1, 1, 1, 1, 1,
-0.4511132, 1.521335, 0.6199122, 1, 1, 1, 1, 1,
-0.450017, 0.2661368, -1.833108, 1, 1, 1, 1, 1,
-0.448722, -0.04019033, -1.276761, 1, 1, 1, 1, 1,
-0.4484, -1.362021, -3.421565, 0, 0, 1, 1, 1,
-0.4464672, -0.103208, -0.6478726, 1, 0, 0, 1, 1,
-0.4439774, 0.4856654, 0.008895639, 1, 0, 0, 1, 1,
-0.4428463, -0.9135822, -4.094339, 1, 0, 0, 1, 1,
-0.4410269, 0.3863864, -0.9985028, 1, 0, 0, 1, 1,
-0.4375553, -0.8902527, -1.9843, 1, 0, 0, 1, 1,
-0.4374065, -1.047157, -3.763796, 0, 0, 0, 1, 1,
-0.4335717, 0.2164496, -0.9292281, 0, 0, 0, 1, 1,
-0.4279525, 0.2702388, -1.976289, 0, 0, 0, 1, 1,
-0.4271145, -0.5710403, -2.813297, 0, 0, 0, 1, 1,
-0.4262405, -0.4922284, -1.914051, 0, 0, 0, 1, 1,
-0.4251359, -0.7348404, -3.428872, 0, 0, 0, 1, 1,
-0.4217172, -1.048269, -2.451907, 0, 0, 0, 1, 1,
-0.4205626, 0.7156811, -0.2952195, 1, 1, 1, 1, 1,
-0.4196244, -1.391427, -0.9312199, 1, 1, 1, 1, 1,
-0.4188483, 0.5169251, -2.092113, 1, 1, 1, 1, 1,
-0.4131624, -1.882104, -2.377512, 1, 1, 1, 1, 1,
-0.4110554, 0.4007716, 0.00247433, 1, 1, 1, 1, 1,
-0.4070961, -1.00012, -3.766363, 1, 1, 1, 1, 1,
-0.4054538, 0.9024597, -2.050039, 1, 1, 1, 1, 1,
-0.4037257, 1.272434, 0.7285784, 1, 1, 1, 1, 1,
-0.4026105, -1.238448, -2.30373, 1, 1, 1, 1, 1,
-0.4021442, 2.209338, -1.152314, 1, 1, 1, 1, 1,
-0.4003955, 0.6341062, -0.6940547, 1, 1, 1, 1, 1,
-0.3973756, -1.044292, -3.241347, 1, 1, 1, 1, 1,
-0.3973359, 1.5683, 0.4102379, 1, 1, 1, 1, 1,
-0.3948875, -0.7442477, -3.696541, 1, 1, 1, 1, 1,
-0.3915649, 0.4764103, -1.5472, 1, 1, 1, 1, 1,
-0.387633, -1.585657, -3.57818, 0, 0, 1, 1, 1,
-0.37783, 0.8734078, -0.68084, 1, 0, 0, 1, 1,
-0.3703275, -0.1520962, -2.842119, 1, 0, 0, 1, 1,
-0.3697058, -0.8669962, -1.275611, 1, 0, 0, 1, 1,
-0.3676701, 0.1440881, -1.263904, 1, 0, 0, 1, 1,
-0.3674155, 0.1269407, -0.109808, 1, 0, 0, 1, 1,
-0.3668221, 1.457622, -0.2991998, 0, 0, 0, 1, 1,
-0.3605249, -0.3498968, -2.022516, 0, 0, 0, 1, 1,
-0.3591861, 0.2137062, -2.070086, 0, 0, 0, 1, 1,
-0.3476745, -0.4053195, -1.930156, 0, 0, 0, 1, 1,
-0.3475963, 0.441459, -2.159187, 0, 0, 0, 1, 1,
-0.3434577, 0.2334206, -0.9466837, 0, 0, 0, 1, 1,
-0.3373877, -0.7241319, -1.59303, 0, 0, 0, 1, 1,
-0.3369053, -0.1583624, -1.737017, 1, 1, 1, 1, 1,
-0.3357072, -0.08700086, -4.055942, 1, 1, 1, 1, 1,
-0.3346839, -0.9516662, -3.7899, 1, 1, 1, 1, 1,
-0.3300159, -0.454262, -2.098886, 1, 1, 1, 1, 1,
-0.3276755, -0.4314219, -3.386981, 1, 1, 1, 1, 1,
-0.3271082, 1.158604, 0.02851723, 1, 1, 1, 1, 1,
-0.3228229, 0.5200465, -1.364023, 1, 1, 1, 1, 1,
-0.3206415, -0.7642636, -2.092932, 1, 1, 1, 1, 1,
-0.3195285, -0.1951939, -2.417098, 1, 1, 1, 1, 1,
-0.318334, 1.713427, 1.143771, 1, 1, 1, 1, 1,
-0.3167968, 0.570239, 0.2066351, 1, 1, 1, 1, 1,
-0.312219, 1.164945, 0.8532892, 1, 1, 1, 1, 1,
-0.3081872, -0.3641802, -2.444266, 1, 1, 1, 1, 1,
-0.307415, -0.08480656, -2.002727, 1, 1, 1, 1, 1,
-0.3055311, -0.9495407, -3.708135, 1, 1, 1, 1, 1,
-0.3034333, 1.031537, -1.6014, 0, 0, 1, 1, 1,
-0.3007089, 0.7389228, -1.466531, 1, 0, 0, 1, 1,
-0.295426, -0.1298977, -2.711901, 1, 0, 0, 1, 1,
-0.2937125, 1.922562, 0.9407674, 1, 0, 0, 1, 1,
-0.28975, 0.1985767, -1.932329, 1, 0, 0, 1, 1,
-0.2876884, 2.232394, -0.6224591, 1, 0, 0, 1, 1,
-0.2837653, -0.4093084, -4.614646, 0, 0, 0, 1, 1,
-0.2802888, 1.613187, 0.3313143, 0, 0, 0, 1, 1,
-0.2792192, -1.851806, -2.572864, 0, 0, 0, 1, 1,
-0.2755028, 0.1864423, -1.018147, 0, 0, 0, 1, 1,
-0.2752928, -0.6463893, -2.780597, 0, 0, 0, 1, 1,
-0.2731029, -0.8695229, -2.507689, 0, 0, 0, 1, 1,
-0.2676321, 0.8560365, -1.437251, 0, 0, 0, 1, 1,
-0.2667856, 0.8504941, -0.275655, 1, 1, 1, 1, 1,
-0.26604, -0.6963113, -1.648892, 1, 1, 1, 1, 1,
-0.2593262, 0.1481255, -0.4616445, 1, 1, 1, 1, 1,
-0.2581412, -0.7480383, -2.859239, 1, 1, 1, 1, 1,
-0.2540649, 0.2360226, -1.444865, 1, 1, 1, 1, 1,
-0.2527505, 0.5356616, 0.2179888, 1, 1, 1, 1, 1,
-0.2515248, -1.117285, -2.144057, 1, 1, 1, 1, 1,
-0.2514492, 1.208712, 1.10712, 1, 1, 1, 1, 1,
-0.2462257, 0.8679084, -0.5570295, 1, 1, 1, 1, 1,
-0.244318, -0.9803517, -2.961796, 1, 1, 1, 1, 1,
-0.2429331, 0.005591779, -2.527774, 1, 1, 1, 1, 1,
-0.2428034, -0.09237471, -1.022159, 1, 1, 1, 1, 1,
-0.2415998, 1.350264, -0.9820768, 1, 1, 1, 1, 1,
-0.2389974, 1.70416, 0.7007797, 1, 1, 1, 1, 1,
-0.2381153, 2.023697, 0.6007091, 1, 1, 1, 1, 1,
-0.2342391, 0.01410167, -0.6427464, 0, 0, 1, 1, 1,
-0.2313967, 1.550333, 0.2935717, 1, 0, 0, 1, 1,
-0.2302371, 3.090106, 0.3387927, 1, 0, 0, 1, 1,
-0.2294931, -1.834089, -2.297661, 1, 0, 0, 1, 1,
-0.2291126, -0.7022337, -3.600534, 1, 0, 0, 1, 1,
-0.2268242, -0.2425578, -2.863338, 1, 0, 0, 1, 1,
-0.2225911, 0.009466278, -1.517101, 0, 0, 0, 1, 1,
-0.2183186, -0.8800017, -3.337879, 0, 0, 0, 1, 1,
-0.2155812, -0.3779099, -2.090238, 0, 0, 0, 1, 1,
-0.2147396, -1.42269, -3.374465, 0, 0, 0, 1, 1,
-0.213783, -0.5691447, -2.812563, 0, 0, 0, 1, 1,
-0.2128514, -0.8345252, -2.473245, 0, 0, 0, 1, 1,
-0.2114361, 0.6672632, -1.626414, 0, 0, 0, 1, 1,
-0.211404, -1.520367, -3.270754, 1, 1, 1, 1, 1,
-0.2093955, 0.9633442, -0.9313704, 1, 1, 1, 1, 1,
-0.20737, -0.1270754, -3.250785, 1, 1, 1, 1, 1,
-0.2022338, 0.7650608, 0.5388172, 1, 1, 1, 1, 1,
-0.1999209, 0.3657469, -1.025124, 1, 1, 1, 1, 1,
-0.199792, 0.7831462, 1.586058, 1, 1, 1, 1, 1,
-0.1923526, -0.3313053, -1.778448, 1, 1, 1, 1, 1,
-0.1921759, 0.3288969, -0.3174728, 1, 1, 1, 1, 1,
-0.1903238, -1.194836, -3.864907, 1, 1, 1, 1, 1,
-0.1875932, -0.5631053, -2.768611, 1, 1, 1, 1, 1,
-0.187492, -0.2206041, -2.020222, 1, 1, 1, 1, 1,
-0.1683703, -0.8181362, -3.770325, 1, 1, 1, 1, 1,
-0.1653267, -0.6403952, -3.778032, 1, 1, 1, 1, 1,
-0.1519994, -1.104843, -4.614905, 1, 1, 1, 1, 1,
-0.1510087, -0.1722298, -3.499599, 1, 1, 1, 1, 1,
-0.1501091, -1.561062, -2.448899, 0, 0, 1, 1, 1,
-0.1500628, 0.5048248, -0.9247203, 1, 0, 0, 1, 1,
-0.1499337, -0.7156551, -4.012498, 1, 0, 0, 1, 1,
-0.1489966, -2.182293, -1.830545, 1, 0, 0, 1, 1,
-0.1462063, 0.4245788, 0.2384215, 1, 0, 0, 1, 1,
-0.1399011, -0.5735116, -2.484712, 1, 0, 0, 1, 1,
-0.1320858, -0.3317653, -3.756116, 0, 0, 0, 1, 1,
-0.1312659, -1.127512, -3.406744, 0, 0, 0, 1, 1,
-0.1298855, 0.7934782, -0.9177481, 0, 0, 0, 1, 1,
-0.1238333, 1.192969, -0.9422307, 0, 0, 0, 1, 1,
-0.1225697, -0.5578466, -2.511049, 0, 0, 0, 1, 1,
-0.1209426, 1.596761, -0.3709006, 0, 0, 0, 1, 1,
-0.1207727, 0.2042503, -0.3241034, 0, 0, 0, 1, 1,
-0.1198643, 0.5176896, -0.3668907, 1, 1, 1, 1, 1,
-0.1064202, -1.40774, -1.720067, 1, 1, 1, 1, 1,
-0.1054997, -1.34028, -2.050562, 1, 1, 1, 1, 1,
-0.1038602, 0.5635509, -1.769516, 1, 1, 1, 1, 1,
-0.09892194, -1.206851, -3.059665, 1, 1, 1, 1, 1,
-0.09885768, -0.2324545, -3.495475, 1, 1, 1, 1, 1,
-0.09741383, 1.467796, 0.07381674, 1, 1, 1, 1, 1,
-0.08935872, 0.5416906, -1.029886, 1, 1, 1, 1, 1,
-0.08922601, -0.7220107, -3.404278, 1, 1, 1, 1, 1,
-0.08907963, 0.02026578, -2.09642, 1, 1, 1, 1, 1,
-0.08880657, 0.2115452, 0.007899142, 1, 1, 1, 1, 1,
-0.08557212, 0.4185171, -0.6304147, 1, 1, 1, 1, 1,
-0.07994043, -1.513289, -3.49942, 1, 1, 1, 1, 1,
-0.07535331, -0.505528, -2.373264, 1, 1, 1, 1, 1,
-0.07516581, -1.523386, -2.64662, 1, 1, 1, 1, 1,
-0.07239048, 0.797997, -1.138412, 0, 0, 1, 1, 1,
-0.07170321, -0.8677737, -1.66502, 1, 0, 0, 1, 1,
-0.06858066, 0.2952939, -0.6811467, 1, 0, 0, 1, 1,
-0.06852063, 0.4844483, -1.435159, 1, 0, 0, 1, 1,
-0.06818881, -0.2701678, -1.288751, 1, 0, 0, 1, 1,
-0.06813942, 1.181856, 0.675344, 1, 0, 0, 1, 1,
-0.06673685, 0.5267472, -0.916481, 0, 0, 0, 1, 1,
-0.0647836, 0.5909036, -1.013317, 0, 0, 0, 1, 1,
-0.06101957, 0.4937662, 1.275218, 0, 0, 0, 1, 1,
-0.05922589, 1.148801, -2.217555, 0, 0, 0, 1, 1,
-0.05539504, 1.11087, -1.149334, 0, 0, 0, 1, 1,
-0.05026737, 0.3065306, 0.3002234, 0, 0, 0, 1, 1,
-0.04872711, -0.6079246, -0.8895562, 0, 0, 0, 1, 1,
-0.04257647, -0.8731197, -5.548696, 1, 1, 1, 1, 1,
-0.03850103, 0.3210019, 0.5731809, 1, 1, 1, 1, 1,
-0.03404995, -0.1146587, -1.635971, 1, 1, 1, 1, 1,
-0.02903967, 0.9218975, -0.9996865, 1, 1, 1, 1, 1,
-0.0182678, 0.3203841, -1.770939, 1, 1, 1, 1, 1,
-0.01711429, -1.211907, -3.723778, 1, 1, 1, 1, 1,
-0.01631718, 0.1214752, -0.4261408, 1, 1, 1, 1, 1,
-0.01381255, 1.041552, 0.5443058, 1, 1, 1, 1, 1,
-0.01260222, 0.0006859035, -0.566763, 1, 1, 1, 1, 1,
-0.01144169, -0.06871253, -0.5896878, 1, 1, 1, 1, 1,
-0.01127248, -0.0934385, -2.99219, 1, 1, 1, 1, 1,
-0.009913245, -1.737813, -2.317932, 1, 1, 1, 1, 1,
-0.008831592, 1.395295, -0.9161685, 1, 1, 1, 1, 1,
-0.008674563, -1.514481, -3.435896, 1, 1, 1, 1, 1,
-0.004656742, 0.1884947, 0.5886862, 1, 1, 1, 1, 1,
0.003129254, 0.1836496, 0.2572564, 0, 0, 1, 1, 1,
0.003760589, -0.356912, 3.910004, 1, 0, 0, 1, 1,
0.006980582, -0.06671371, 3.04571, 1, 0, 0, 1, 1,
0.008065452, 0.885942, -0.1907843, 1, 0, 0, 1, 1,
0.01540022, 0.4010794, 0.1814957, 1, 0, 0, 1, 1,
0.01556837, 0.3472256, 1.952135, 1, 0, 0, 1, 1,
0.01735118, 0.03189024, -0.3614826, 0, 0, 0, 1, 1,
0.01953317, -0.02702317, 1.776138, 0, 0, 0, 1, 1,
0.01982235, -0.1197872, 2.488129, 0, 0, 0, 1, 1,
0.02008729, -0.3600371, 0.7409446, 0, 0, 0, 1, 1,
0.02312358, -0.2060035, 3.513437, 0, 0, 0, 1, 1,
0.03069516, 0.6996084, 0.05419069, 0, 0, 0, 1, 1,
0.03294751, 0.7955644, -0.7978402, 0, 0, 0, 1, 1,
0.03512979, -1.453097, 3.428456, 1, 1, 1, 1, 1,
0.03731401, 1.261931, -0.9795546, 1, 1, 1, 1, 1,
0.03917528, 0.9535202, 1.635597, 1, 1, 1, 1, 1,
0.03949861, -0.9945523, 3.164966, 1, 1, 1, 1, 1,
0.03974258, -0.5172119, 1.781988, 1, 1, 1, 1, 1,
0.04095856, 0.6903276, -0.01851586, 1, 1, 1, 1, 1,
0.04146111, -1.372558, 3.887134, 1, 1, 1, 1, 1,
0.04287882, -0.5343413, 2.738785, 1, 1, 1, 1, 1,
0.04369352, 0.09954525, 0.1036768, 1, 1, 1, 1, 1,
0.05282137, -0.3283205, 3.311047, 1, 1, 1, 1, 1,
0.05412556, 0.007202404, -0.1983786, 1, 1, 1, 1, 1,
0.0579493, -0.07980331, 1.473064, 1, 1, 1, 1, 1,
0.06120228, 0.03973274, -0.5817408, 1, 1, 1, 1, 1,
0.06326116, 1.567495, -0.4775626, 1, 1, 1, 1, 1,
0.06439751, 1.616214, -1.64625, 1, 1, 1, 1, 1,
0.06974831, 0.3618411, 1.256114, 0, 0, 1, 1, 1,
0.07176104, -1.241178, 1.535822, 1, 0, 0, 1, 1,
0.07302603, -0.007046982, 1.807087, 1, 0, 0, 1, 1,
0.07692951, 0.4477742, -0.5148218, 1, 0, 0, 1, 1,
0.08485443, 0.5910027, 0.324839, 1, 0, 0, 1, 1,
0.09244943, -0.568812, 3.454638, 1, 0, 0, 1, 1,
0.09710666, 2.040785, -0.5595398, 0, 0, 0, 1, 1,
0.09820471, -0.006679804, 2.496171, 0, 0, 0, 1, 1,
0.09916958, -0.32767, 3.159281, 0, 0, 0, 1, 1,
0.1020435, -1.48106, 1.181485, 0, 0, 0, 1, 1,
0.1026107, -1.11476, 3.497031, 0, 0, 0, 1, 1,
0.1111752, -0.06612711, 2.296289, 0, 0, 0, 1, 1,
0.1239215, 1.070976, 1.731571, 0, 0, 0, 1, 1,
0.1246242, -0.313669, 3.93283, 1, 1, 1, 1, 1,
0.1301843, -0.8401719, 3.304928, 1, 1, 1, 1, 1,
0.1326238, -1.96886, 3.738593, 1, 1, 1, 1, 1,
0.1343422, 2.881812, 1.125967, 1, 1, 1, 1, 1,
0.1377239, 0.4514337, 2.148546, 1, 1, 1, 1, 1,
0.1418957, 1.525211, 0.4470852, 1, 1, 1, 1, 1,
0.1440154, -0.738407, 3.512204, 1, 1, 1, 1, 1,
0.1444034, -1.291861, 2.468378, 1, 1, 1, 1, 1,
0.1481418, -0.9195411, 2.469746, 1, 1, 1, 1, 1,
0.1554266, -0.5909559, 2.518092, 1, 1, 1, 1, 1,
0.1558062, -0.1216166, 0.8439531, 1, 1, 1, 1, 1,
0.158087, 0.1389828, 1.221833, 1, 1, 1, 1, 1,
0.1607296, -0.9911791, 4.180907, 1, 1, 1, 1, 1,
0.1656996, -0.9656664, 4.371874, 1, 1, 1, 1, 1,
0.1698799, 0.5469573, 1.259816, 1, 1, 1, 1, 1,
0.1705797, -0.2716153, 2.461377, 0, 0, 1, 1, 1,
0.1707766, -1.134017, 3.580193, 1, 0, 0, 1, 1,
0.1719578, 0.5928026, 0.3859245, 1, 0, 0, 1, 1,
0.1725384, 0.4931764, 0.1965714, 1, 0, 0, 1, 1,
0.175306, -1.761108, 3.284851, 1, 0, 0, 1, 1,
0.175316, -0.2061738, 1.118742, 1, 0, 0, 1, 1,
0.1753921, -0.2655158, 2.037841, 0, 0, 0, 1, 1,
0.1798886, 1.421405, -0.1787045, 0, 0, 0, 1, 1,
0.1818139, 0.08380534, 3.288321, 0, 0, 0, 1, 1,
0.1868826, 0.5730032, -0.9905828, 0, 0, 0, 1, 1,
0.1902155, 0.5900253, 0.3850857, 0, 0, 0, 1, 1,
0.1959262, 1.706757, 0.7198322, 0, 0, 0, 1, 1,
0.1981585, 0.5455376, -0.4624108, 0, 0, 0, 1, 1,
0.1996918, 1.779756, -0.9142129, 1, 1, 1, 1, 1,
0.2042471, -0.6460662, 2.774817, 1, 1, 1, 1, 1,
0.2050291, 0.6905827, 0.5456775, 1, 1, 1, 1, 1,
0.2076616, -0.8991091, 2.076368, 1, 1, 1, 1, 1,
0.2173346, -1.364543, 2.30068, 1, 1, 1, 1, 1,
0.217926, -0.7156187, 4.265268, 1, 1, 1, 1, 1,
0.2189561, -1.243629, 3.443304, 1, 1, 1, 1, 1,
0.2190809, 0.5159048, -1.155177, 1, 1, 1, 1, 1,
0.2242253, -0.7692295, 3.761081, 1, 1, 1, 1, 1,
0.2266573, -0.2815588, 2.228108, 1, 1, 1, 1, 1,
0.2268275, 0.3070931, 0.7610437, 1, 1, 1, 1, 1,
0.2271581, 0.07129627, 1.929041, 1, 1, 1, 1, 1,
0.2278565, 0.3312484, 1.534685, 1, 1, 1, 1, 1,
0.2297559, 1.266165, -0.6493424, 1, 1, 1, 1, 1,
0.2393593, -0.7399354, 3.599875, 1, 1, 1, 1, 1,
0.2447806, -0.4791957, 3.383539, 0, 0, 1, 1, 1,
0.2459536, -0.03857924, 0.7011979, 1, 0, 0, 1, 1,
0.2473849, 2.088472, 0.4015944, 1, 0, 0, 1, 1,
0.2478995, -0.1307051, 0.3339812, 1, 0, 0, 1, 1,
0.2499077, 0.04936519, 1.129396, 1, 0, 0, 1, 1,
0.2520587, 0.4628173, 1.74363, 1, 0, 0, 1, 1,
0.2522169, 1.502561, 0.3870839, 0, 0, 0, 1, 1,
0.2600838, 0.6574898, 0.260272, 0, 0, 0, 1, 1,
0.2651466, -0.8641511, 2.33145, 0, 0, 0, 1, 1,
0.2738311, -0.5953659, 1.774645, 0, 0, 0, 1, 1,
0.2749409, -1.671873, 2.490164, 0, 0, 0, 1, 1,
0.2750231, 0.1919897, 1.399352, 0, 0, 0, 1, 1,
0.2785825, 0.09894284, 1.575379, 0, 0, 0, 1, 1,
0.2814922, 0.5888762, 1.408971, 1, 1, 1, 1, 1,
0.284676, 1.006515, 0.1968746, 1, 1, 1, 1, 1,
0.2875968, -0.4712955, 1.605868, 1, 1, 1, 1, 1,
0.290453, -0.5731155, 2.740555, 1, 1, 1, 1, 1,
0.2935778, -0.04577431, 0.8751152, 1, 1, 1, 1, 1,
0.2954932, -0.695033, 3.692798, 1, 1, 1, 1, 1,
0.297441, 0.2768303, 1.00534, 1, 1, 1, 1, 1,
0.2984385, -1.914297, 4.909917, 1, 1, 1, 1, 1,
0.3001443, 2.368057, 1.691296, 1, 1, 1, 1, 1,
0.3001612, -0.747054, 2.747143, 1, 1, 1, 1, 1,
0.3006219, -0.8618945, 1.550871, 1, 1, 1, 1, 1,
0.3012888, -0.5795765, 3.196159, 1, 1, 1, 1, 1,
0.3054909, 0.5801899, 2.95395, 1, 1, 1, 1, 1,
0.3061945, -1.247689, 3.055673, 1, 1, 1, 1, 1,
0.3067788, -0.3427574, 2.825024, 1, 1, 1, 1, 1,
0.3117358, 0.6537868, 1.481344, 0, 0, 1, 1, 1,
0.3122256, -0.2639165, 1.44511, 1, 0, 0, 1, 1,
0.3170523, 2.355114, 1.182196, 1, 0, 0, 1, 1,
0.3175064, -1.38712, 3.447139, 1, 0, 0, 1, 1,
0.3189903, -1.720003, 2.709335, 1, 0, 0, 1, 1,
0.319356, -1.378263, 3.15838, 1, 0, 0, 1, 1,
0.3247229, -1.423226, 2.702728, 0, 0, 0, 1, 1,
0.3303496, -2.323527, 3.313637, 0, 0, 0, 1, 1,
0.3341133, 0.2764808, 0.6720344, 0, 0, 0, 1, 1,
0.3367743, 0.9521649, -0.7858002, 0, 0, 0, 1, 1,
0.3420157, -0.9396037, 3.985107, 0, 0, 0, 1, 1,
0.3429745, -0.04307299, 1.361482, 0, 0, 0, 1, 1,
0.3515542, -0.9247892, 2.469345, 0, 0, 0, 1, 1,
0.3562965, 0.6512582, -1.372193, 1, 1, 1, 1, 1,
0.3570839, -2.501963, 2.124844, 1, 1, 1, 1, 1,
0.3592198, -0.8069272, 2.499389, 1, 1, 1, 1, 1,
0.3602531, 1.486772, 1.8007, 1, 1, 1, 1, 1,
0.3620902, -0.2271349, 2.652797, 1, 1, 1, 1, 1,
0.3659697, -0.6339803, 2.369885, 1, 1, 1, 1, 1,
0.3838765, -0.7571355, 2.143807, 1, 1, 1, 1, 1,
0.3841017, -0.3951373, 3.819706, 1, 1, 1, 1, 1,
0.3854284, 0.3824314, 0.9572189, 1, 1, 1, 1, 1,
0.3909824, -0.08005556, 1.88499, 1, 1, 1, 1, 1,
0.391275, -0.2436607, 0.9396799, 1, 1, 1, 1, 1,
0.3919734, -0.6788372, 3.521034, 1, 1, 1, 1, 1,
0.3931297, 1.746439, 0.7026464, 1, 1, 1, 1, 1,
0.393549, 0.2621766, 1.529043, 1, 1, 1, 1, 1,
0.3974273, -0.6449515, 2.68411, 1, 1, 1, 1, 1,
0.3989793, 1.234152, -0.7199166, 0, 0, 1, 1, 1,
0.407436, 0.5002293, 1.098051, 1, 0, 0, 1, 1,
0.4077177, 0.2270358, 1.354814, 1, 0, 0, 1, 1,
0.409498, -1.198478, 4.097297, 1, 0, 0, 1, 1,
0.4147492, -1.100669, 3.367423, 1, 0, 0, 1, 1,
0.421119, -2.322771, 2.158242, 1, 0, 0, 1, 1,
0.4230062, -1.144031, 3.851764, 0, 0, 0, 1, 1,
0.4285271, -0.1853531, 2.2624, 0, 0, 0, 1, 1,
0.4421008, 0.8084566, -1.845137, 0, 0, 0, 1, 1,
0.4422705, 0.1240929, 1.078823, 0, 0, 0, 1, 1,
0.4435121, -0.02797605, 3.28208, 0, 0, 0, 1, 1,
0.4468658, -0.6616078, 2.509693, 0, 0, 0, 1, 1,
0.450686, -0.3362619, 2.456484, 0, 0, 0, 1, 1,
0.453421, 0.8665311, 1.284969, 1, 1, 1, 1, 1,
0.4593363, 0.635114, -0.885276, 1, 1, 1, 1, 1,
0.4596054, -1.254034, 2.021363, 1, 1, 1, 1, 1,
0.4614158, 0.4057353, 2.686298, 1, 1, 1, 1, 1,
0.4655476, -2.415545, 3.643796, 1, 1, 1, 1, 1,
0.466048, -0.9189076, 2.670914, 1, 1, 1, 1, 1,
0.4676624, 1.052727, 1.002998, 1, 1, 1, 1, 1,
0.4687811, -1.060372, 3.138849, 1, 1, 1, 1, 1,
0.472009, -0.8462585, 2.540554, 1, 1, 1, 1, 1,
0.4779074, 1.994639, -1.728038, 1, 1, 1, 1, 1,
0.4846406, 1.233049, 2.328778, 1, 1, 1, 1, 1,
0.4886011, -0.1334352, 2.135452, 1, 1, 1, 1, 1,
0.4909408, 0.1236628, 1.053063, 1, 1, 1, 1, 1,
0.4931061, -0.9597857, 2.170515, 1, 1, 1, 1, 1,
0.4960181, -1.441522, 2.503172, 1, 1, 1, 1, 1,
0.506319, 1.601168, 0.7055843, 0, 0, 1, 1, 1,
0.5075169, -0.159093, 1.97349, 1, 0, 0, 1, 1,
0.510417, 0.4622408, -0.7043123, 1, 0, 0, 1, 1,
0.5170794, 0.3238654, 1.64255, 1, 0, 0, 1, 1,
0.5183204, 0.9362265, 1.540328, 1, 0, 0, 1, 1,
0.5246294, 0.5825244, 2.507499, 1, 0, 0, 1, 1,
0.5273092, 1.065567, 0.7060841, 0, 0, 0, 1, 1,
0.5321719, -1.259758, 3.52861, 0, 0, 0, 1, 1,
0.5332966, 0.1680708, 0.01201757, 0, 0, 0, 1, 1,
0.5350361, 2.336155, -0.6492443, 0, 0, 0, 1, 1,
0.5365779, -0.7844241, 3.527242, 0, 0, 0, 1, 1,
0.5391817, -1.055474, 5.139829, 0, 0, 0, 1, 1,
0.5455142, -0.4833196, 3.422538, 0, 0, 0, 1, 1,
0.5471494, 1.086428, 0.9554391, 1, 1, 1, 1, 1,
0.5516745, 0.05060568, 3.154691, 1, 1, 1, 1, 1,
0.5528969, -0.5130805, 0.7894411, 1, 1, 1, 1, 1,
0.5535164, -0.260517, 3.697378, 1, 1, 1, 1, 1,
0.5548962, 0.2741569, 1.175373, 1, 1, 1, 1, 1,
0.5574426, -0.6873783, 2.43112, 1, 1, 1, 1, 1,
0.5587173, -0.07845576, 1.566004, 1, 1, 1, 1, 1,
0.5587363, -0.04490823, -0.5093052, 1, 1, 1, 1, 1,
0.5605571, -0.6296676, 3.273109, 1, 1, 1, 1, 1,
0.5620642, 1.261294, -0.8123309, 1, 1, 1, 1, 1,
0.5648043, -1.651339, 3.862359, 1, 1, 1, 1, 1,
0.5650544, 0.8142258, 1.154872, 1, 1, 1, 1, 1,
0.5662654, -0.5051628, 3.345112, 1, 1, 1, 1, 1,
0.5664721, -2.19885, 1.866238, 1, 1, 1, 1, 1,
0.571009, -0.8096054, 3.719651, 1, 1, 1, 1, 1,
0.5769457, 0.3537191, 0.4852558, 0, 0, 1, 1, 1,
0.5791786, 1.228395, 0.3801334, 1, 0, 0, 1, 1,
0.5808493, -0.697439, 2.301359, 1, 0, 0, 1, 1,
0.5816537, 1.528203, 0.3962535, 1, 0, 0, 1, 1,
0.5821711, 0.07419483, 1.004983, 1, 0, 0, 1, 1,
0.5829934, -0.8131214, 2.164324, 1, 0, 0, 1, 1,
0.5836681, -0.7516226, 1.513052, 0, 0, 0, 1, 1,
0.587638, 1.505742, 0.3572294, 0, 0, 0, 1, 1,
0.588102, -0.4244901, 4.601951, 0, 0, 0, 1, 1,
0.5891845, 0.4168788, 1.456736, 0, 0, 0, 1, 1,
0.5917854, -0.1351979, 1.312416, 0, 0, 0, 1, 1,
0.5938616, 0.3047177, 1.257226, 0, 0, 0, 1, 1,
0.5992691, -0.4734196, 2.940731, 0, 0, 0, 1, 1,
0.5994675, 1.408947, 1.7879, 1, 1, 1, 1, 1,
0.6064626, 0.7125757, 0.1040374, 1, 1, 1, 1, 1,
0.6080015, -1.645572, 3.173661, 1, 1, 1, 1, 1,
0.6119547, 0.6535441, 0.2805321, 1, 1, 1, 1, 1,
0.6120983, 0.637603, -0.4031521, 1, 1, 1, 1, 1,
0.6129172, -0.6295108, 1.85196, 1, 1, 1, 1, 1,
0.6181714, -0.1749421, 3.174992, 1, 1, 1, 1, 1,
0.6201931, 1.230335, 0.0781633, 1, 1, 1, 1, 1,
0.6286347, -0.4129787, 2.662889, 1, 1, 1, 1, 1,
0.6287709, -0.08461128, 2.766888, 1, 1, 1, 1, 1,
0.6332348, -0.3321277, 1.729806, 1, 1, 1, 1, 1,
0.6353806, 0.2306944, 1.005694, 1, 1, 1, 1, 1,
0.6372144, 2.186163, 0.8873249, 1, 1, 1, 1, 1,
0.6384177, 0.4224129, 0.2623238, 1, 1, 1, 1, 1,
0.6415244, 1.541781, 0.7131122, 1, 1, 1, 1, 1,
0.6467053, 1.504467, 0.575138, 0, 0, 1, 1, 1,
0.6487188, 0.8383139, 1.573859, 1, 0, 0, 1, 1,
0.6499491, -1.461412, 2.670949, 1, 0, 0, 1, 1,
0.6550508, -0.1363284, 1.743533, 1, 0, 0, 1, 1,
0.6553614, -0.5909136, 2.402225, 1, 0, 0, 1, 1,
0.656921, 0.7167311, 0.9238457, 1, 0, 0, 1, 1,
0.6614364, -0.570647, 2.10572, 0, 0, 0, 1, 1,
0.6628721, -0.6082374, 2.352013, 0, 0, 0, 1, 1,
0.6633535, 1.147731, 1.491103, 0, 0, 0, 1, 1,
0.6690816, 0.01583433, 2.324997, 0, 0, 0, 1, 1,
0.6715769, 0.6700423, 1.694848, 0, 0, 0, 1, 1,
0.6769649, -0.119508, 1.99739, 0, 0, 0, 1, 1,
0.6800222, 0.5472791, 2.695507, 0, 0, 0, 1, 1,
0.6820492, -1.068592, 2.288371, 1, 1, 1, 1, 1,
0.6831574, -0.3433031, 0.7322969, 1, 1, 1, 1, 1,
0.6851311, 0.8425212, 0.4638722, 1, 1, 1, 1, 1,
0.6863705, 0.9464656, 0.6351901, 1, 1, 1, 1, 1,
0.6914076, -0.01666439, 2.380567, 1, 1, 1, 1, 1,
0.6926459, 0.2578195, 2.037634, 1, 1, 1, 1, 1,
0.6926926, -0.5286695, 3.141109, 1, 1, 1, 1, 1,
0.6972925, -1.127384, 2.218866, 1, 1, 1, 1, 1,
0.697862, -0.9405131, 1.740394, 1, 1, 1, 1, 1,
0.7015722, -0.711895, 2.594092, 1, 1, 1, 1, 1,
0.7020201, -1.559484, 4.404857, 1, 1, 1, 1, 1,
0.7035, 0.6478825, 0.2623577, 1, 1, 1, 1, 1,
0.7046785, 0.9442088, 1.573568, 1, 1, 1, 1, 1,
0.706905, -0.9746177, 2.430438, 1, 1, 1, 1, 1,
0.7070906, 0.1093401, -0.1340417, 1, 1, 1, 1, 1,
0.7079251, -0.4085163, 1.569077, 0, 0, 1, 1, 1,
0.713909, -0.2634941, 3.1241, 1, 0, 0, 1, 1,
0.7180383, -0.9972916, 1.110459, 1, 0, 0, 1, 1,
0.7184449, -1.584467, 2.969234, 1, 0, 0, 1, 1,
0.7255734, -0.5512425, 2.563221, 1, 0, 0, 1, 1,
0.732125, 0.5530022, 3.778402, 1, 0, 0, 1, 1,
0.7329108, 0.226368, 1.347543, 0, 0, 0, 1, 1,
0.7421612, 1.081365, -0.3161313, 0, 0, 0, 1, 1,
0.7436692, -0.007420409, 2.025537, 0, 0, 0, 1, 1,
0.7438148, -0.01211636, 0.7064017, 0, 0, 0, 1, 1,
0.746703, -0.4389715, 3.589848, 0, 0, 0, 1, 1,
0.7494088, 1.025787, 2.297324, 0, 0, 0, 1, 1,
0.751064, -0.9801636, 1.361683, 0, 0, 0, 1, 1,
0.7528142, -1.434593, 1.385812, 1, 1, 1, 1, 1,
0.7528962, 0.7917516, 0.3647719, 1, 1, 1, 1, 1,
0.7540643, 0.7367418, 1.235111, 1, 1, 1, 1, 1,
0.7601871, 0.32342, 0.9289755, 1, 1, 1, 1, 1,
0.7646675, -2.13014, 3.516929, 1, 1, 1, 1, 1,
0.7664552, 1.215973, 1.694085, 1, 1, 1, 1, 1,
0.7690365, -0.2241096, -0.4094637, 1, 1, 1, 1, 1,
0.7701852, -2.251489, 2.08214, 1, 1, 1, 1, 1,
0.7706401, 0.2002769, 2.07581, 1, 1, 1, 1, 1,
0.7727172, 0.1986095, 1.715089, 1, 1, 1, 1, 1,
0.7820015, -0.2398658, 1.469088, 1, 1, 1, 1, 1,
0.7822765, -0.4341729, 0.971957, 1, 1, 1, 1, 1,
0.7936714, -1.002171, 2.585364, 1, 1, 1, 1, 1,
0.8006212, 1.538735, 1.082087, 1, 1, 1, 1, 1,
0.8006666, -1.779461, 3.295837, 1, 1, 1, 1, 1,
0.8138335, 1.294285, 2.474474, 0, 0, 1, 1, 1,
0.8171325, 0.2486674, 2.701528, 1, 0, 0, 1, 1,
0.8232945, 0.426622, 1.285664, 1, 0, 0, 1, 1,
0.824941, 0.045726, 2.236873, 1, 0, 0, 1, 1,
0.8256082, -2.196017, 1.443474, 1, 0, 0, 1, 1,
0.8301318, 1.180569, 0.7797312, 1, 0, 0, 1, 1,
0.8323686, -0.09613904, 2.001635, 0, 0, 0, 1, 1,
0.8380206, -1.532685, 3.069527, 0, 0, 0, 1, 1,
0.8389186, 0.005674561, 1.174334, 0, 0, 0, 1, 1,
0.8431972, 0.5751384, 0.01328824, 0, 0, 0, 1, 1,
0.8434155, 0.5769924, 0.7118745, 0, 0, 0, 1, 1,
0.8468488, -1.286261, 2.02015, 0, 0, 0, 1, 1,
0.8473425, -0.514467, 1.142908, 0, 0, 0, 1, 1,
0.8524401, 0.354323, -0.2561498, 1, 1, 1, 1, 1,
0.8529655, -1.279104, 3.316067, 1, 1, 1, 1, 1,
0.856041, 0.9873436, -0.0310767, 1, 1, 1, 1, 1,
0.8568713, -2.236402, 2.110076, 1, 1, 1, 1, 1,
0.8635987, 0.1165508, 1.689304, 1, 1, 1, 1, 1,
0.8653817, -0.6279321, 3.218994, 1, 1, 1, 1, 1,
0.865402, 0.9990125, 0.7592189, 1, 1, 1, 1, 1,
0.8655047, 1.713642, -0.1390279, 1, 1, 1, 1, 1,
0.8848887, 0.3135123, 0.1898871, 1, 1, 1, 1, 1,
0.8856834, -0.9228409, 2.903341, 1, 1, 1, 1, 1,
0.8873841, 1.01863, 1.07361, 1, 1, 1, 1, 1,
0.8890636, -0.05893765, 2.829976, 1, 1, 1, 1, 1,
0.8961241, 0.3902926, -1.154745, 1, 1, 1, 1, 1,
0.8976757, -0.1767454, 2.05688, 1, 1, 1, 1, 1,
0.9234833, 0.6139882, 0.1140971, 1, 1, 1, 1, 1,
0.923631, 1.728246, 1.016541, 0, 0, 1, 1, 1,
0.9274, 0.2987814, 2.146504, 1, 0, 0, 1, 1,
0.9323438, 0.5904655, -0.5805438, 1, 0, 0, 1, 1,
0.933881, -1.115542, 1.895189, 1, 0, 0, 1, 1,
0.9384585, -1.028346, 2.756951, 1, 0, 0, 1, 1,
0.9443266, 0.994553, 1.905106, 1, 0, 0, 1, 1,
0.9504089, -1.29408, 2.427089, 0, 0, 0, 1, 1,
0.9504337, 0.7462941, -1.302943, 0, 0, 0, 1, 1,
0.953492, 1.674653, 0.2422147, 0, 0, 0, 1, 1,
0.955174, 0.2113835, 0.6324517, 0, 0, 0, 1, 1,
0.958667, -0.8433667, 1.318373, 0, 0, 0, 1, 1,
0.9594691, -0.6101074, 1.123139, 0, 0, 0, 1, 1,
0.9708365, -1.065662, 2.747811, 0, 0, 0, 1, 1,
0.9797778, 0.3367259, -0.4817367, 1, 1, 1, 1, 1,
0.9864411, 1.701652, -0.6713194, 1, 1, 1, 1, 1,
0.9892715, 0.7663918, -0.009244589, 1, 1, 1, 1, 1,
0.9967124, -1.177261, 4.412273, 1, 1, 1, 1, 1,
0.997722, 0.8087377, 2.314849, 1, 1, 1, 1, 1,
0.9991973, -1.788587, 3.78273, 1, 1, 1, 1, 1,
0.9998143, 1.391505, 1.905269, 1, 1, 1, 1, 1,
1.001362, 0.09542661, 2.21785, 1, 1, 1, 1, 1,
1.003108, 0.4215986, 2.960767, 1, 1, 1, 1, 1,
1.008284, 1.317499, 0.3405114, 1, 1, 1, 1, 1,
1.016168, -0.4706718, 2.956857, 1, 1, 1, 1, 1,
1.032631, -0.5989337, 2.818304, 1, 1, 1, 1, 1,
1.037244, -0.2036982, 3.574535, 1, 1, 1, 1, 1,
1.038615, -1.146337, 2.910762, 1, 1, 1, 1, 1,
1.046638, 0.1325452, -0.3790902, 1, 1, 1, 1, 1,
1.047176, 0.3689041, 1.752942, 0, 0, 1, 1, 1,
1.053887, 0.08081999, 0.6749395, 1, 0, 0, 1, 1,
1.06108, 1.01538, 2.291, 1, 0, 0, 1, 1,
1.061909, 0.3310422, 1.245572, 1, 0, 0, 1, 1,
1.066017, 0.01707943, 1.755309, 1, 0, 0, 1, 1,
1.071225, 1.181559, -0.8256742, 1, 0, 0, 1, 1,
1.075138, -0.9842609, 2.593791, 0, 0, 0, 1, 1,
1.075234, -0.01285968, 1.719829, 0, 0, 0, 1, 1,
1.078414, -1.005952, 2.970896, 0, 0, 0, 1, 1,
1.086842, 0.3404508, 0.9209169, 0, 0, 0, 1, 1,
1.090846, 0.03347132, 0.7214685, 0, 0, 0, 1, 1,
1.094479, 0.2950908, 0.9401811, 0, 0, 0, 1, 1,
1.098152, -2.050997, 3.989396, 0, 0, 0, 1, 1,
1.099607, 0.04537616, 2.791428, 1, 1, 1, 1, 1,
1.100008, 0.3055573, 2.05982, 1, 1, 1, 1, 1,
1.100877, -0.3749717, 2.944419, 1, 1, 1, 1, 1,
1.101825, 0.2842592, 0.5472554, 1, 1, 1, 1, 1,
1.106906, 0.2282134, 2.141947, 1, 1, 1, 1, 1,
1.116231, -1.517817, 3.684321, 1, 1, 1, 1, 1,
1.117704, 0.3242902, 1.048735, 1, 1, 1, 1, 1,
1.118424, 1.340654, 0.2900335, 1, 1, 1, 1, 1,
1.130382, 0.7637249, 0.9921312, 1, 1, 1, 1, 1,
1.142532, -0.6643778, 3.061067, 1, 1, 1, 1, 1,
1.145553, -0.036702, 1.747547, 1, 1, 1, 1, 1,
1.145561, -0.08098248, 2.440359, 1, 1, 1, 1, 1,
1.156843, 1.10956, 0.1824165, 1, 1, 1, 1, 1,
1.157251, 0.9911479, -0.2303125, 1, 1, 1, 1, 1,
1.159288, -0.9958925, 1.711949, 1, 1, 1, 1, 1,
1.163134, -1.132926, 1.761891, 0, 0, 1, 1, 1,
1.179117, -1.740753, 2.043002, 1, 0, 0, 1, 1,
1.179686, -0.7695072, 2.108552, 1, 0, 0, 1, 1,
1.184579, -2.487637, 2.321549, 1, 0, 0, 1, 1,
1.190135, 0.7019357, 2.096681, 1, 0, 0, 1, 1,
1.201834, -0.3451462, 1.59409, 1, 0, 0, 1, 1,
1.209543, -1.065231, 2.887223, 0, 0, 0, 1, 1,
1.21083, 1.117668, 1.685796, 0, 0, 0, 1, 1,
1.213984, 1.990901, 0.6934605, 0, 0, 0, 1, 1,
1.21532, 0.2392117, 2.80938, 0, 0, 0, 1, 1,
1.221187, -0.2950025, 0.782302, 0, 0, 0, 1, 1,
1.227094, -1.087648, 2.413565, 0, 0, 0, 1, 1,
1.23008, 0.1551645, 2.054609, 0, 0, 0, 1, 1,
1.236588, 0.01332798, 1.570587, 1, 1, 1, 1, 1,
1.237411, 0.072241, 0.05356076, 1, 1, 1, 1, 1,
1.237624, 0.3189727, 0.4616499, 1, 1, 1, 1, 1,
1.239926, -1.814294, 3.867372, 1, 1, 1, 1, 1,
1.249958, -0.8114481, 2.669453, 1, 1, 1, 1, 1,
1.257343, 0.1751146, 1.857472, 1, 1, 1, 1, 1,
1.262037, 0.03829975, -0.6745231, 1, 1, 1, 1, 1,
1.267249, 1.170887, 0.9604585, 1, 1, 1, 1, 1,
1.270588, -0.8868734, 2.482707, 1, 1, 1, 1, 1,
1.273402, -1.517049, 3.650209, 1, 1, 1, 1, 1,
1.278604, -0.2481961, 1.86224, 1, 1, 1, 1, 1,
1.284649, 0.7074577, 2.786988, 1, 1, 1, 1, 1,
1.291769, 0.09479502, 0.6759179, 1, 1, 1, 1, 1,
1.292126, -0.8221062, 2.838189, 1, 1, 1, 1, 1,
1.296412, 0.8456585, 1.733549, 1, 1, 1, 1, 1,
1.301392, 0.282723, 0.03938325, 0, 0, 1, 1, 1,
1.306852, 1.107507, 1.789299, 1, 0, 0, 1, 1,
1.311796, 2.205871, -0.1394191, 1, 0, 0, 1, 1,
1.320415, 2.341923, 0.7140303, 1, 0, 0, 1, 1,
1.323538, 0.3770047, 2.542078, 1, 0, 0, 1, 1,
1.330937, 1.621544, 2.329489, 1, 0, 0, 1, 1,
1.337777, 0.3820084, 1.066517, 0, 0, 0, 1, 1,
1.339911, -0.4765088, 1.257811, 0, 0, 0, 1, 1,
1.342346, -0.05085738, 1.296157, 0, 0, 0, 1, 1,
1.354132, -0.03394428, 1.551903, 0, 0, 0, 1, 1,
1.357205, -0.876766, 3.954294, 0, 0, 0, 1, 1,
1.36536, -0.5797743, 0.5762925, 0, 0, 0, 1, 1,
1.365418, 1.619761, 0.8904243, 0, 0, 0, 1, 1,
1.373825, -0.4540735, 3.378115, 1, 1, 1, 1, 1,
1.380751, 0.6602872, 1.200872, 1, 1, 1, 1, 1,
1.386339, 0.09901107, 0.840777, 1, 1, 1, 1, 1,
1.401001, 1.468143, 1.42571, 1, 1, 1, 1, 1,
1.401342, 1.470314, 1.470371, 1, 1, 1, 1, 1,
1.402834, -2.011494, 0.7515472, 1, 1, 1, 1, 1,
1.403455, -1.397027, 0.4065797, 1, 1, 1, 1, 1,
1.434825, -0.7987071, 2.837763, 1, 1, 1, 1, 1,
1.439187, 0.6026627, 1.048546, 1, 1, 1, 1, 1,
1.444325, 1.336124, 0.9374201, 1, 1, 1, 1, 1,
1.448227, 1.55468, -0.02064658, 1, 1, 1, 1, 1,
1.469548, -1.95387, 1.281811, 1, 1, 1, 1, 1,
1.477916, 0.4656881, 2.651345, 1, 1, 1, 1, 1,
1.48391, -0.1040744, 0.2199287, 1, 1, 1, 1, 1,
1.484456, 0.7216427, -0.1549031, 1, 1, 1, 1, 1,
1.498883, -0.5528595, 0.9857321, 0, 0, 1, 1, 1,
1.519454, 0.06772885, 0.4175475, 1, 0, 0, 1, 1,
1.519656, 1.922792, 0.6642469, 1, 0, 0, 1, 1,
1.522591, 0.9987316, 0.7543235, 1, 0, 0, 1, 1,
1.531939, -0.7011278, 3.05424, 1, 0, 0, 1, 1,
1.531995, -0.9308636, 3.814328, 1, 0, 0, 1, 1,
1.533818, 1.212511, 0.6469723, 0, 0, 0, 1, 1,
1.533979, -1.164603, 2.020283, 0, 0, 0, 1, 1,
1.537928, 0.5224252, 2.385274, 0, 0, 0, 1, 1,
1.551972, 0.7038598, 0.005831812, 0, 0, 0, 1, 1,
1.567277, -0.07365678, 2.232712, 0, 0, 0, 1, 1,
1.574014, -0.8467677, 1.856534, 0, 0, 0, 1, 1,
1.58712, 0.1223623, -1.360624, 0, 0, 0, 1, 1,
1.594705, -0.2387216, 0.6663501, 1, 1, 1, 1, 1,
1.62818, -0.06838077, 2.848896, 1, 1, 1, 1, 1,
1.633325, -2.310298, 2.225178, 1, 1, 1, 1, 1,
1.645431, -0.3578832, 0.2618138, 1, 1, 1, 1, 1,
1.65055, -0.9074182, 3.441931, 1, 1, 1, 1, 1,
1.653078, 0.2090416, 0.8434789, 1, 1, 1, 1, 1,
1.657253, -1.443749, 2.857731, 1, 1, 1, 1, 1,
1.680576, 0.4114469, 0.8772396, 1, 1, 1, 1, 1,
1.701612, 2.610083, 2.247231, 1, 1, 1, 1, 1,
1.702203, 0.4359366, 0.7021177, 1, 1, 1, 1, 1,
1.706946, 1.279516, 2.162752, 1, 1, 1, 1, 1,
1.725038, -1.028673, 2.446036, 1, 1, 1, 1, 1,
1.731191, -0.995053, 0.8915814, 1, 1, 1, 1, 1,
1.732575, -1.400106, 1.203901, 1, 1, 1, 1, 1,
1.766773, 0.5292472, 1.550026, 1, 1, 1, 1, 1,
1.772235, -0.1807421, 2.662256, 0, 0, 1, 1, 1,
1.776103, 1.898306, 1.242216, 1, 0, 0, 1, 1,
1.777459, 0.1936673, 1.120604, 1, 0, 0, 1, 1,
1.803087, 1.137515, 1.268661, 1, 0, 0, 1, 1,
1.824887, 0.009692807, 0.9850394, 1, 0, 0, 1, 1,
1.827696, 0.06669433, 0.8264917, 1, 0, 0, 1, 1,
1.836964, -0.6917536, 2.939865, 0, 0, 0, 1, 1,
1.853568, -0.4768952, 0.1736263, 0, 0, 0, 1, 1,
1.855868, 0.8550521, 2.838455, 0, 0, 0, 1, 1,
1.864073, -0.3246449, 1.33143, 0, 0, 0, 1, 1,
1.865042, 0.13924, 1.463694, 0, 0, 0, 1, 1,
1.867193, 0.42556, 2.560102, 0, 0, 0, 1, 1,
1.872379, -0.5935535, 2.247306, 0, 0, 0, 1, 1,
1.882529, 1.23786, 0.5540691, 1, 1, 1, 1, 1,
1.890225, 1.796196, 1.071506, 1, 1, 1, 1, 1,
1.890287, -0.2228817, 1.736346, 1, 1, 1, 1, 1,
1.893348, 1.38508, 0.7839674, 1, 1, 1, 1, 1,
1.935815, -0.2236433, 1.679748, 1, 1, 1, 1, 1,
1.985257, 0.5230684, 1.485185, 1, 1, 1, 1, 1,
1.986665, -0.6067794, -0.009178687, 1, 1, 1, 1, 1,
1.990398, 0.08213504, 1.855184, 1, 1, 1, 1, 1,
2.037053, -1.405862, 2.825209, 1, 1, 1, 1, 1,
2.037446, 0.02854409, 0.9365885, 1, 1, 1, 1, 1,
2.065973, -1.237494, 0.5921481, 1, 1, 1, 1, 1,
2.088265, -0.4789154, 0.6441159, 1, 1, 1, 1, 1,
2.098311, 0.406722, 0.9534164, 1, 1, 1, 1, 1,
2.100106, -1.092378, 2.515879, 1, 1, 1, 1, 1,
2.102872, -0.2808042, 1.485328, 1, 1, 1, 1, 1,
2.111772, -1.327288, 1.136221, 0, 0, 1, 1, 1,
2.137216, 0.9889282, 0.9796405, 1, 0, 0, 1, 1,
2.16739, -0.09064458, 2.058077, 1, 0, 0, 1, 1,
2.178502, -0.4615006, 1.730083, 1, 0, 0, 1, 1,
2.227253, -1.280228, 0.1863581, 1, 0, 0, 1, 1,
2.229184, 1.329103, 1.710152, 1, 0, 0, 1, 1,
2.238627, -2.760023, 2.226744, 0, 0, 0, 1, 1,
2.255539, 1.375775, 0.6822788, 0, 0, 0, 1, 1,
2.27645, -1.103017, 3.687446, 0, 0, 0, 1, 1,
2.402697, 0.1030957, 1.48671, 0, 0, 0, 1, 1,
2.404129, -0.5471909, 2.46276, 0, 0, 0, 1, 1,
2.471003, -0.3723326, 1.827497, 0, 0, 0, 1, 1,
2.479607, -0.06339825, 1.966481, 0, 0, 0, 1, 1,
2.536377, 0.8513788, 1.901738, 1, 1, 1, 1, 1,
2.574429, 0.5594999, 0.06576535, 1, 1, 1, 1, 1,
2.668495, -0.996226, 0.9186278, 1, 1, 1, 1, 1,
2.931166, -0.1086598, 2.101208, 1, 1, 1, 1, 1,
2.965139, 0.8578384, 0.02752417, 1, 1, 1, 1, 1,
3.019873, 0.8917894, 2.30534, 1, 1, 1, 1, 1,
3.082197, -1.133067, 2.950695, 1, 1, 1, 1, 1
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
var radius = 9.379937;
var distance = 32.94663;
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
mvMatrix.translate( 0.04788804, -0.1650419, 0.2044334 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.94663);
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
