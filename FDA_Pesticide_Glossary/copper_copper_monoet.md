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
-3.791203, -0.2184388, -0.7792268, 1, 0, 0, 1,
-2.788476, -0.3907948, 0.1944465, 1, 0.007843138, 0, 1,
-2.760864, 0.2420069, -1.828781, 1, 0.01176471, 0, 1,
-2.754366, 0.01306077, -2.07997, 1, 0.01960784, 0, 1,
-2.654061, 0.7664097, -1.206397, 1, 0.02352941, 0, 1,
-2.510408, -0.3861658, -1.802363, 1, 0.03137255, 0, 1,
-2.456549, -0.06533661, -2.384916, 1, 0.03529412, 0, 1,
-2.405662, -1.219833, -2.127041, 1, 0.04313726, 0, 1,
-2.333781, -0.3065154, -1.414473, 1, 0.04705882, 0, 1,
-2.257355, 2.08867, -1.863519, 1, 0.05490196, 0, 1,
-2.253919, 0.7043905, -0.4480626, 1, 0.05882353, 0, 1,
-2.152627, -0.5493748, -0.9051606, 1, 0.06666667, 0, 1,
-2.149576, 0.5739424, -2.512093, 1, 0.07058824, 0, 1,
-2.094861, -0.8628107, -0.5950602, 1, 0.07843138, 0, 1,
-2.068553, 0.03078614, -1.413788, 1, 0.08235294, 0, 1,
-2.050237, -0.2095335, -2.052996, 1, 0.09019608, 0, 1,
-2.022, -0.3886823, -1.432436, 1, 0.09411765, 0, 1,
-1.992613, 0.3599195, -1.540119, 1, 0.1019608, 0, 1,
-1.969916, 1.03392, -2.738863, 1, 0.1098039, 0, 1,
-1.931927, 1.079388, -3.870157, 1, 0.1137255, 0, 1,
-1.912302, 0.872574, -1.442461, 1, 0.1215686, 0, 1,
-1.902704, -1.119683, -0.8850264, 1, 0.1254902, 0, 1,
-1.89145, 0.2340384, -1.666021, 1, 0.1333333, 0, 1,
-1.874703, -0.191623, -1.767231, 1, 0.1372549, 0, 1,
-1.831973, 0.2436663, 0.4034007, 1, 0.145098, 0, 1,
-1.827396, -1.764471, -2.248519, 1, 0.1490196, 0, 1,
-1.816332, -2.558503, -2.174848, 1, 0.1568628, 0, 1,
-1.815373, 0.1300106, -1.994728, 1, 0.1607843, 0, 1,
-1.803182, 1.836761, -0.1445111, 1, 0.1686275, 0, 1,
-1.801206, -0.9254493, -2.788247, 1, 0.172549, 0, 1,
-1.770621, 0.3688737, -0.9076704, 1, 0.1803922, 0, 1,
-1.703592, -0.4544377, -2.689919, 1, 0.1843137, 0, 1,
-1.694519, 0.5582753, -2.121994, 1, 0.1921569, 0, 1,
-1.680807, 1.18469, -1.327728, 1, 0.1960784, 0, 1,
-1.670042, 1.232625, -2.231738, 1, 0.2039216, 0, 1,
-1.665736, 2.377439, -1.852814, 1, 0.2117647, 0, 1,
-1.642743, 1.000051, -1.472424, 1, 0.2156863, 0, 1,
-1.637197, -1.094528, -2.447041, 1, 0.2235294, 0, 1,
-1.633253, 0.9409295, -0.750271, 1, 0.227451, 0, 1,
-1.619171, -0.7289583, -3.791179, 1, 0.2352941, 0, 1,
-1.616177, 0.8292195, -3.012065, 1, 0.2392157, 0, 1,
-1.612402, -2.19092, -4.041838, 1, 0.2470588, 0, 1,
-1.600224, 0.1693573, -1.994217, 1, 0.2509804, 0, 1,
-1.596642, -1.620008, -3.06019, 1, 0.2588235, 0, 1,
-1.596046, 0.1845227, -1.109768, 1, 0.2627451, 0, 1,
-1.582361, -0.4265171, -3.085468, 1, 0.2705882, 0, 1,
-1.574113, 0.4107929, -2.359351, 1, 0.2745098, 0, 1,
-1.567179, -0.8385649, -3.060075, 1, 0.282353, 0, 1,
-1.555026, 0.1870682, -0.9363365, 1, 0.2862745, 0, 1,
-1.5537, -0.4763395, 0.06293128, 1, 0.2941177, 0, 1,
-1.546926, 0.7628109, -0.9730407, 1, 0.3019608, 0, 1,
-1.545467, -0.4290065, -1.691278, 1, 0.3058824, 0, 1,
-1.521142, -0.1795434, -2.182707, 1, 0.3137255, 0, 1,
-1.515629, 0.7518498, -2.428816, 1, 0.3176471, 0, 1,
-1.514177, -0.3657163, -3.686957, 1, 0.3254902, 0, 1,
-1.477551, 0.5512643, -3.033647, 1, 0.3294118, 0, 1,
-1.476237, 0.4931291, -0.6788049, 1, 0.3372549, 0, 1,
-1.464353, -0.04966792, -0.7661961, 1, 0.3411765, 0, 1,
-1.462934, -0.4750955, -0.8736225, 1, 0.3490196, 0, 1,
-1.462136, -0.1432638, -0.9144546, 1, 0.3529412, 0, 1,
-1.46195, 0.2770402, -0.8640025, 1, 0.3607843, 0, 1,
-1.451383, 0.5411121, -0.2896906, 1, 0.3647059, 0, 1,
-1.444068, -0.5524701, -1.626984, 1, 0.372549, 0, 1,
-1.442798, -1.982138, -1.56782, 1, 0.3764706, 0, 1,
-1.44146, 0.621071, -1.462066, 1, 0.3843137, 0, 1,
-1.431939, -0.5818504, -2.0776, 1, 0.3882353, 0, 1,
-1.430422, -0.1813757, -2.473837, 1, 0.3960784, 0, 1,
-1.427215, -0.8099178, -2.600206, 1, 0.4039216, 0, 1,
-1.408202, -0.1329402, -1.319518, 1, 0.4078431, 0, 1,
-1.395509, -0.4631407, -0.9845957, 1, 0.4156863, 0, 1,
-1.394728, -1.751955, -1.951308, 1, 0.4196078, 0, 1,
-1.390522, 0.3890213, -0.1891263, 1, 0.427451, 0, 1,
-1.386094, -1.362235, -0.6962482, 1, 0.4313726, 0, 1,
-1.382542, -0.9381281, -0.8991197, 1, 0.4392157, 0, 1,
-1.37678, 1.226212, -0.1576715, 1, 0.4431373, 0, 1,
-1.352587, 0.8009257, -1.85858, 1, 0.4509804, 0, 1,
-1.348602, 0.03279354, 0.1516238, 1, 0.454902, 0, 1,
-1.32667, 0.545131, -1.360601, 1, 0.4627451, 0, 1,
-1.312788, 1.240561, -1.466257, 1, 0.4666667, 0, 1,
-1.309988, -0.6054965, -2.737062, 1, 0.4745098, 0, 1,
-1.274449, 0.3910286, 0.960931, 1, 0.4784314, 0, 1,
-1.269672, 1.35941, -2.003787, 1, 0.4862745, 0, 1,
-1.253304, -0.08538537, -1.879067, 1, 0.4901961, 0, 1,
-1.253282, 0.9011233, 0.04784285, 1, 0.4980392, 0, 1,
-1.25207, -0.155563, -1.681173, 1, 0.5058824, 0, 1,
-1.241125, 1.39852, -1.287669, 1, 0.509804, 0, 1,
-1.235749, 1.120067, -0.0623815, 1, 0.5176471, 0, 1,
-1.235016, -0.7977777, -1.254278, 1, 0.5215687, 0, 1,
-1.234654, 1.319422, -2.425048, 1, 0.5294118, 0, 1,
-1.234571, -1.347092, -1.500626, 1, 0.5333334, 0, 1,
-1.230108, -0.4183638, -2.9673, 1, 0.5411765, 0, 1,
-1.22546, -0.3011525, -2.711601, 1, 0.5450981, 0, 1,
-1.222087, 0.6072546, -1.83872, 1, 0.5529412, 0, 1,
-1.221846, 0.005336781, -1.634863, 1, 0.5568628, 0, 1,
-1.213359, -0.6623203, -3.97064, 1, 0.5647059, 0, 1,
-1.206791, 1.763598, -0.6936646, 1, 0.5686275, 0, 1,
-1.19257, 0.5627286, -1.648818, 1, 0.5764706, 0, 1,
-1.189386, 0.1503233, -0.453113, 1, 0.5803922, 0, 1,
-1.187653, -0.5084802, -2.585315, 1, 0.5882353, 0, 1,
-1.185117, -0.5723295, -0.1705109, 1, 0.5921569, 0, 1,
-1.182375, 0.7491267, 0.6838383, 1, 0.6, 0, 1,
-1.178179, -1.386433, -2.545558, 1, 0.6078432, 0, 1,
-1.173017, 0.1038099, 0.3325665, 1, 0.6117647, 0, 1,
-1.162914, 0.5641444, -1.351411, 1, 0.6196079, 0, 1,
-1.161991, 0.4531702, -2.515728, 1, 0.6235294, 0, 1,
-1.161678, 0.7139303, -1.715862, 1, 0.6313726, 0, 1,
-1.159086, 0.2158699, -1.326327, 1, 0.6352941, 0, 1,
-1.157078, -0.4281599, -1.601846, 1, 0.6431373, 0, 1,
-1.151502, 0.3188191, -1.114329, 1, 0.6470588, 0, 1,
-1.150586, 0.6754445, -1.806038, 1, 0.654902, 0, 1,
-1.150003, -0.2597755, 0.2435899, 1, 0.6588235, 0, 1,
-1.147954, 0.2748049, -2.2263, 1, 0.6666667, 0, 1,
-1.145058, 0.7514423, -0.7762306, 1, 0.6705883, 0, 1,
-1.142461, 0.2515914, -1.651666, 1, 0.6784314, 0, 1,
-1.141927, -1.200019, 0.1909714, 1, 0.682353, 0, 1,
-1.141039, 0.1040648, -2.507161, 1, 0.6901961, 0, 1,
-1.135042, 0.6035297, -3.013248, 1, 0.6941177, 0, 1,
-1.129109, -0.9669315, -3.469367, 1, 0.7019608, 0, 1,
-1.125363, -1.710516, -3.327404, 1, 0.7098039, 0, 1,
-1.120127, 0.7752629, -0.1164051, 1, 0.7137255, 0, 1,
-1.115966, 0.5039365, -0.4497418, 1, 0.7215686, 0, 1,
-1.114149, 1.635767, 0.4102949, 1, 0.7254902, 0, 1,
-1.113657, 0.739372, 1.649507, 1, 0.7333333, 0, 1,
-1.1048, 0.60745, -0.3118973, 1, 0.7372549, 0, 1,
-1.101893, 0.9443841, -1.128297, 1, 0.7450981, 0, 1,
-1.099324, 1.430737, -2.960792, 1, 0.7490196, 0, 1,
-1.098931, -0.1308101, -0.1149135, 1, 0.7568628, 0, 1,
-1.098733, -0.9532789, -2.197277, 1, 0.7607843, 0, 1,
-1.09841, 0.01178285, -2.658053, 1, 0.7686275, 0, 1,
-1.09241, 0.7420011, -0.9385317, 1, 0.772549, 0, 1,
-1.076917, -0.763602, -0.7970445, 1, 0.7803922, 0, 1,
-1.074435, -1.957939, -3.879342, 1, 0.7843137, 0, 1,
-1.070141, 0.9398076, -1.818975, 1, 0.7921569, 0, 1,
-1.06907, -0.0836869, -0.438703, 1, 0.7960784, 0, 1,
-1.066537, 1.476264, -1.031068, 1, 0.8039216, 0, 1,
-1.055715, 0.6512819, -0.1401136, 1, 0.8117647, 0, 1,
-1.049368, -1.801465, -1.294943, 1, 0.8156863, 0, 1,
-1.049064, -0.4747201, -2.3399, 1, 0.8235294, 0, 1,
-1.040905, 0.2177065, -0.9766673, 1, 0.827451, 0, 1,
-1.037338, -0.3957421, -1.472923, 1, 0.8352941, 0, 1,
-1.032302, 1.331442, -0.6551874, 1, 0.8392157, 0, 1,
-1.031386, 0.6384112, -0.9852068, 1, 0.8470588, 0, 1,
-1.025745, 1.286923, 0.9048594, 1, 0.8509804, 0, 1,
-1.023987, 1.836217, 0.5603848, 1, 0.8588235, 0, 1,
-1.00595, -1.79938, -1.387907, 1, 0.8627451, 0, 1,
-1.005572, 0.09786903, -0.3044859, 1, 0.8705882, 0, 1,
-0.9859912, 0.5379069, -0.7843398, 1, 0.8745098, 0, 1,
-0.9851049, 0.05730109, -2.015537, 1, 0.8823529, 0, 1,
-0.9836351, 0.06179227, -2.149405, 1, 0.8862745, 0, 1,
-0.9818662, 2.352247, -2.288233, 1, 0.8941177, 0, 1,
-0.967234, 0.3140722, -1.023611, 1, 0.8980392, 0, 1,
-0.9663365, -0.6002247, -2.900127, 1, 0.9058824, 0, 1,
-0.9661234, -0.2674474, -2.882832, 1, 0.9137255, 0, 1,
-0.9650537, -0.1366979, -0.9291381, 1, 0.9176471, 0, 1,
-0.9608486, 1.883518, -1.671798, 1, 0.9254902, 0, 1,
-0.9577349, 2.275439, -1.699952, 1, 0.9294118, 0, 1,
-0.9524048, -0.002849068, -1.589453, 1, 0.9372549, 0, 1,
-0.9411756, -1.64766, -2.846769, 1, 0.9411765, 0, 1,
-0.9320802, 1.192047, -0.3653385, 1, 0.9490196, 0, 1,
-0.9197199, -0.39383, 0.2765102, 1, 0.9529412, 0, 1,
-0.9135214, 1.416523, -0.3123195, 1, 0.9607843, 0, 1,
-0.9104413, 1.43413, 0.2062322, 1, 0.9647059, 0, 1,
-0.9085053, -0.3715992, -0.7173417, 1, 0.972549, 0, 1,
-0.9061244, 0.250573, -2.72296, 1, 0.9764706, 0, 1,
-0.905668, -0.4953861, -0.6418995, 1, 0.9843137, 0, 1,
-0.8954065, 0.2654066, -3.176425, 1, 0.9882353, 0, 1,
-0.8913505, 0.9030773, 0.4241609, 1, 0.9960784, 0, 1,
-0.8881364, -0.08270548, -1.891149, 0.9960784, 1, 0, 1,
-0.8790938, -0.2869912, -3.588673, 0.9921569, 1, 0, 1,
-0.8790025, -0.8896754, -1.391316, 0.9843137, 1, 0, 1,
-0.8760551, -0.7805863, -2.952395, 0.9803922, 1, 0, 1,
-0.8749079, 0.2163034, -1.292489, 0.972549, 1, 0, 1,
-0.8712148, -1.097652, -2.332289, 0.9686275, 1, 0, 1,
-0.8710322, 0.6273093, 0.1574033, 0.9607843, 1, 0, 1,
-0.8708914, 0.2931676, -1.435316, 0.9568627, 1, 0, 1,
-0.8652925, 0.4587949, -0.5998765, 0.9490196, 1, 0, 1,
-0.8477294, 0.1358373, -1.737688, 0.945098, 1, 0, 1,
-0.8470204, 0.6753539, -0.4551714, 0.9372549, 1, 0, 1,
-0.8448752, 0.391001, -1.558245, 0.9333333, 1, 0, 1,
-0.8435515, -0.6397616, -2.245355, 0.9254902, 1, 0, 1,
-0.8420018, -1.225024, -3.39704, 0.9215686, 1, 0, 1,
-0.8344536, -1.418041, -3.235307, 0.9137255, 1, 0, 1,
-0.8224089, 0.01501204, -1.683362, 0.9098039, 1, 0, 1,
-0.8220096, 1.045353, 0.8460267, 0.9019608, 1, 0, 1,
-0.8154102, 0.3035077, -3.024009, 0.8941177, 1, 0, 1,
-0.8153576, 0.9097692, -1.335427, 0.8901961, 1, 0, 1,
-0.8136799, -1.058184, -2.492612, 0.8823529, 1, 0, 1,
-0.8124107, 0.6479053, 2.07441, 0.8784314, 1, 0, 1,
-0.8059383, -0.2973842, -2.6928, 0.8705882, 1, 0, 1,
-0.8058859, -0.6548629, -3.016446, 0.8666667, 1, 0, 1,
-0.8036199, 0.5060113, -2.420067, 0.8588235, 1, 0, 1,
-0.7982445, -0.5133735, -2.544569, 0.854902, 1, 0, 1,
-0.7937384, -1.3301, -2.922799, 0.8470588, 1, 0, 1,
-0.7920539, -1.441329, -3.32225, 0.8431373, 1, 0, 1,
-0.7913185, 0.7141047, 0.05742348, 0.8352941, 1, 0, 1,
-0.7887326, -1.187996, -2.835698, 0.8313726, 1, 0, 1,
-0.7820863, 0.3678843, 0.4306223, 0.8235294, 1, 0, 1,
-0.781557, -0.1336724, -2.231362, 0.8196079, 1, 0, 1,
-0.7795074, 0.2091315, -3.08985, 0.8117647, 1, 0, 1,
-0.7790194, -0.4950771, -2.864711, 0.8078431, 1, 0, 1,
-0.7765939, -0.6793705, -2.753828, 0.8, 1, 0, 1,
-0.7675893, 0.8121322, -0.0001168748, 0.7921569, 1, 0, 1,
-0.7669346, -0.7853397, -3.502579, 0.7882353, 1, 0, 1,
-0.7576784, 0.110426, -3.292591, 0.7803922, 1, 0, 1,
-0.7501312, 0.2480872, -1.021478, 0.7764706, 1, 0, 1,
-0.7484082, 0.383975, -2.168221, 0.7686275, 1, 0, 1,
-0.7464124, 0.4963405, -1.917331, 0.7647059, 1, 0, 1,
-0.7450074, 2.611933, -0.9805044, 0.7568628, 1, 0, 1,
-0.7422431, 0.05197724, 0.2501276, 0.7529412, 1, 0, 1,
-0.7416612, 1.194562, -1.090831, 0.7450981, 1, 0, 1,
-0.7383282, 0.3489128, -1.408027, 0.7411765, 1, 0, 1,
-0.7366923, -1.302731, -3.117323, 0.7333333, 1, 0, 1,
-0.7229573, -0.1803907, -1.087817, 0.7294118, 1, 0, 1,
-0.7227519, 0.8148025, -0.7399049, 0.7215686, 1, 0, 1,
-0.7043111, -0.8565276, -1.310138, 0.7176471, 1, 0, 1,
-0.7042614, 0.4306673, -1.678086, 0.7098039, 1, 0, 1,
-0.7026296, -0.1751433, -1.008381, 0.7058824, 1, 0, 1,
-0.6997704, 0.5162483, 0.4010628, 0.6980392, 1, 0, 1,
-0.6955, 0.8168782, 0.6599227, 0.6901961, 1, 0, 1,
-0.688063, -1.184683, -1.955395, 0.6862745, 1, 0, 1,
-0.6877266, 0.4214527, 0.4474857, 0.6784314, 1, 0, 1,
-0.6850917, -0.4186645, -3.824608, 0.6745098, 1, 0, 1,
-0.6850487, 1.364175, -1.374708, 0.6666667, 1, 0, 1,
-0.6790881, 0.01504504, -4.406574, 0.6627451, 1, 0, 1,
-0.6780499, 0.611787, -1.40534, 0.654902, 1, 0, 1,
-0.6756467, 0.9042686, -0.8561522, 0.6509804, 1, 0, 1,
-0.6706978, 0.7988234, -1.258737, 0.6431373, 1, 0, 1,
-0.6688729, 0.7419533, -0.04402436, 0.6392157, 1, 0, 1,
-0.6684935, -0.2968722, -0.9926912, 0.6313726, 1, 0, 1,
-0.6683915, 0.07691839, -0.7744804, 0.627451, 1, 0, 1,
-0.6662329, -0.3172061, -1.408045, 0.6196079, 1, 0, 1,
-0.6640505, -0.5464755, -2.193995, 0.6156863, 1, 0, 1,
-0.6630978, -0.3255871, -1.837837, 0.6078432, 1, 0, 1,
-0.6582914, -1.501443, -3.045274, 0.6039216, 1, 0, 1,
-0.6579854, -0.5279707, -1.162607, 0.5960785, 1, 0, 1,
-0.6563504, 0.9873764, -0.8974105, 0.5882353, 1, 0, 1,
-0.6561377, 0.9742768, -1.15529, 0.5843138, 1, 0, 1,
-0.6516944, -0.4016256, -1.524894, 0.5764706, 1, 0, 1,
-0.6501826, -0.2831546, -1.029596, 0.572549, 1, 0, 1,
-0.642467, 0.06392738, -2.803545, 0.5647059, 1, 0, 1,
-0.6422725, 0.07539578, -1.243282, 0.5607843, 1, 0, 1,
-0.6414229, -0.5868404, -1.13719, 0.5529412, 1, 0, 1,
-0.6413065, -0.3826624, -2.775951, 0.5490196, 1, 0, 1,
-0.6365089, 0.2225768, 0.2541031, 0.5411765, 1, 0, 1,
-0.6329487, 0.4332651, -0.4404476, 0.5372549, 1, 0, 1,
-0.6302188, 1.052355, -0.004591562, 0.5294118, 1, 0, 1,
-0.6301813, 0.3090012, -0.5237624, 0.5254902, 1, 0, 1,
-0.6298746, 1.581468, -0.7826124, 0.5176471, 1, 0, 1,
-0.6248523, 0.5336461, -0.9216961, 0.5137255, 1, 0, 1,
-0.6237944, -0.936125, -1.301147, 0.5058824, 1, 0, 1,
-0.6234079, 2.003293, -0.5085119, 0.5019608, 1, 0, 1,
-0.6216491, 0.8129905, -0.4150554, 0.4941176, 1, 0, 1,
-0.6175514, 1.378324, -0.5210515, 0.4862745, 1, 0, 1,
-0.614583, -0.4909084, -2.935791, 0.4823529, 1, 0, 1,
-0.6051865, 0.1195382, -0.8621174, 0.4745098, 1, 0, 1,
-0.6050861, -1.287981, -1.865118, 0.4705882, 1, 0, 1,
-0.6003168, -0.6928643, -3.105456, 0.4627451, 1, 0, 1,
-0.5989199, -0.775969, -1.380826, 0.4588235, 1, 0, 1,
-0.5973131, -0.6213029, -2.684625, 0.4509804, 1, 0, 1,
-0.5894535, -0.903668, -3.356418, 0.4470588, 1, 0, 1,
-0.5893838, 0.3797024, -3.174941, 0.4392157, 1, 0, 1,
-0.5878854, 0.5768182, -1.595012, 0.4352941, 1, 0, 1,
-0.5871626, 0.9551956, 0.6447716, 0.427451, 1, 0, 1,
-0.5859259, -0.132432, -2.083461, 0.4235294, 1, 0, 1,
-0.5827041, -1.554571, -3.033737, 0.4156863, 1, 0, 1,
-0.5816614, 0.7565135, -1.351309, 0.4117647, 1, 0, 1,
-0.5812327, -0.7929359, -2.255915, 0.4039216, 1, 0, 1,
-0.5808715, -0.61994, -3.143453, 0.3960784, 1, 0, 1,
-0.5790309, -0.9482787, -1.984821, 0.3921569, 1, 0, 1,
-0.5785748, -0.8563104, -2.529074, 0.3843137, 1, 0, 1,
-0.5765646, -1.919813, -3.624003, 0.3803922, 1, 0, 1,
-0.5744604, 0.1348403, -1.394264, 0.372549, 1, 0, 1,
-0.5721719, -2.050111, -0.761422, 0.3686275, 1, 0, 1,
-0.5632144, 0.9573377, -1.726827, 0.3607843, 1, 0, 1,
-0.5598829, -0.563761, -2.491835, 0.3568628, 1, 0, 1,
-0.5484803, -0.04031178, -1.098309, 0.3490196, 1, 0, 1,
-0.5430823, 0.4529351, 0.006629097, 0.345098, 1, 0, 1,
-0.5377164, 1.302571, 0.5645087, 0.3372549, 1, 0, 1,
-0.5346872, 0.4965292, -1.131983, 0.3333333, 1, 0, 1,
-0.533291, 0.02790792, 0.128984, 0.3254902, 1, 0, 1,
-0.5329333, 0.1757441, -1.171908, 0.3215686, 1, 0, 1,
-0.5328993, 0.1277412, -0.5531336, 0.3137255, 1, 0, 1,
-0.5313721, 0.1614098, -2.589275, 0.3098039, 1, 0, 1,
-0.5121165, -0.2578326, -2.780508, 0.3019608, 1, 0, 1,
-0.5107384, -1.360648, -3.900772, 0.2941177, 1, 0, 1,
-0.5099397, -0.6931868, -2.119149, 0.2901961, 1, 0, 1,
-0.5091237, -0.1032042, -1.095897, 0.282353, 1, 0, 1,
-0.507522, 0.7949826, 0.1574281, 0.2784314, 1, 0, 1,
-0.5069857, -0.4040342, -2.182617, 0.2705882, 1, 0, 1,
-0.503962, 0.5723469, -0.7771829, 0.2666667, 1, 0, 1,
-0.5014936, 0.05777904, -2.104506, 0.2588235, 1, 0, 1,
-0.5011066, -0.2126294, -3.504325, 0.254902, 1, 0, 1,
-0.494826, -0.9834437, -2.289915, 0.2470588, 1, 0, 1,
-0.4908015, -1.712878, -3.605378, 0.2431373, 1, 0, 1,
-0.4903336, -0.1476584, -2.217772, 0.2352941, 1, 0, 1,
-0.4892377, 0.2797202, 0.1261304, 0.2313726, 1, 0, 1,
-0.4866262, -0.2284282, -2.996959, 0.2235294, 1, 0, 1,
-0.4805949, 0.3255405, -2.788792, 0.2196078, 1, 0, 1,
-0.4773547, -0.09789446, -2.513026, 0.2117647, 1, 0, 1,
-0.4735189, -0.4497523, -2.107871, 0.2078431, 1, 0, 1,
-0.4701214, -1.441566, -3.269477, 0.2, 1, 0, 1,
-0.4687228, -0.5981132, -2.505753, 0.1921569, 1, 0, 1,
-0.4687129, 1.280333, 0.1814383, 0.1882353, 1, 0, 1,
-0.4684443, -0.6776881, -2.67579, 0.1803922, 1, 0, 1,
-0.4637324, -0.5426744, -1.966161, 0.1764706, 1, 0, 1,
-0.4635594, 0.4121583, -1.997534, 0.1686275, 1, 0, 1,
-0.463137, -1.774539, -4.729772, 0.1647059, 1, 0, 1,
-0.4610655, 0.1747839, -1.885803, 0.1568628, 1, 0, 1,
-0.4593158, 0.05529501, -1.25251, 0.1529412, 1, 0, 1,
-0.4489206, 0.3258947, -2.344037, 0.145098, 1, 0, 1,
-0.4474315, -0.007901123, -2.125011, 0.1411765, 1, 0, 1,
-0.4470865, 0.4143152, 0.1059007, 0.1333333, 1, 0, 1,
-0.4461762, 0.000599349, -3.28295, 0.1294118, 1, 0, 1,
-0.4451858, -0.2560112, -1.751301, 0.1215686, 1, 0, 1,
-0.4447762, 0.02077518, -1.913435, 0.1176471, 1, 0, 1,
-0.4441244, 0.6854269, -0.2796556, 0.1098039, 1, 0, 1,
-0.4420863, 0.6410221, -1.120855, 0.1058824, 1, 0, 1,
-0.4406445, -0.5781921, -2.867888, 0.09803922, 1, 0, 1,
-0.4399096, -1.956072, -2.338775, 0.09019608, 1, 0, 1,
-0.4373082, 0.3317673, -0.8163327, 0.08627451, 1, 0, 1,
-0.4366374, 2.0853, 1.183924, 0.07843138, 1, 0, 1,
-0.4352979, 1.325286, -0.6287898, 0.07450981, 1, 0, 1,
-0.4320903, 0.2073517, -1.591674, 0.06666667, 1, 0, 1,
-0.4265877, -1.030548, -2.837975, 0.0627451, 1, 0, 1,
-0.4229668, 1.420428, -0.8496358, 0.05490196, 1, 0, 1,
-0.4196897, 1.318104, 0.2009715, 0.05098039, 1, 0, 1,
-0.4194162, -0.7975346, -2.601, 0.04313726, 1, 0, 1,
-0.4184985, 0.7952777, -2.147034, 0.03921569, 1, 0, 1,
-0.4183054, 1.0946, -1.800551, 0.03137255, 1, 0, 1,
-0.4157504, -1.278987, -3.982092, 0.02745098, 1, 0, 1,
-0.4099223, -0.6088789, -2.111943, 0.01960784, 1, 0, 1,
-0.4089089, 0.3658981, 0.1113131, 0.01568628, 1, 0, 1,
-0.408285, -1.245833, -2.428037, 0.007843138, 1, 0, 1,
-0.4075369, 0.4452711, -0.9408525, 0.003921569, 1, 0, 1,
-0.4071781, 0.5297541, -0.4921367, 0, 1, 0.003921569, 1,
-0.3942938, 0.110269, -2.191724, 0, 1, 0.01176471, 1,
-0.3931406, -1.26751, -3.277586, 0, 1, 0.01568628, 1,
-0.3920226, 0.01277407, -0.4740252, 0, 1, 0.02352941, 1,
-0.3880763, -0.5975689, -3.434937, 0, 1, 0.02745098, 1,
-0.3849805, 0.3250637, -0.654264, 0, 1, 0.03529412, 1,
-0.3788193, 0.4500213, 0.4187333, 0, 1, 0.03921569, 1,
-0.3734277, 0.4553065, -0.01120852, 0, 1, 0.04705882, 1,
-0.3693558, 1.572396, 0.1270224, 0, 1, 0.05098039, 1,
-0.3675716, 0.3274609, -0.5579739, 0, 1, 0.05882353, 1,
-0.3661873, -0.473081, -2.997001, 0, 1, 0.0627451, 1,
-0.3628605, 1.748995, -0.5344064, 0, 1, 0.07058824, 1,
-0.3620095, -2.064744, -2.213677, 0, 1, 0.07450981, 1,
-0.3593286, -0.09502625, -0.4962705, 0, 1, 0.08235294, 1,
-0.3565298, 0.2354377, -1.80485, 0, 1, 0.08627451, 1,
-0.3542518, -0.625398, -3.27571, 0, 1, 0.09411765, 1,
-0.3530316, -0.7274197, -3.189134, 0, 1, 0.1019608, 1,
-0.3481104, 0.7338631, 0.1977921, 0, 1, 0.1058824, 1,
-0.3480033, -0.8557973, -2.284279, 0, 1, 0.1137255, 1,
-0.3455537, 0.3608432, -1.367837, 0, 1, 0.1176471, 1,
-0.3433847, -0.4423039, -3.233607, 0, 1, 0.1254902, 1,
-0.3424959, 1.804639, 0.20874, 0, 1, 0.1294118, 1,
-0.3330199, -1.42809, -5.26103, 0, 1, 0.1372549, 1,
-0.3329692, -0.4657295, -1.712501, 0, 1, 0.1411765, 1,
-0.3298293, -1.725255, -3.323616, 0, 1, 0.1490196, 1,
-0.327501, 0.4792974, 0.05158972, 0, 1, 0.1529412, 1,
-0.3238769, 0.5958933, 0.03725472, 0, 1, 0.1607843, 1,
-0.3193937, 0.01059141, -1.023118, 0, 1, 0.1647059, 1,
-0.3135463, -2.424224, -2.656228, 0, 1, 0.172549, 1,
-0.3131575, 0.1060602, -1.304072, 0, 1, 0.1764706, 1,
-0.3131419, 0.4451832, -0.4144389, 0, 1, 0.1843137, 1,
-0.3120252, 1.520136, -0.8913725, 0, 1, 0.1882353, 1,
-0.3116784, 0.3121889, -1.965543, 0, 1, 0.1960784, 1,
-0.3101842, -1.068097, -1.674985, 0, 1, 0.2039216, 1,
-0.3094547, -0.4694214, -2.874372, 0, 1, 0.2078431, 1,
-0.2964057, 0.3968289, -1.381987, 0, 1, 0.2156863, 1,
-0.2868613, -1.327187, -3.788095, 0, 1, 0.2196078, 1,
-0.2848327, 0.6618716, 0.6784658, 0, 1, 0.227451, 1,
-0.2831877, -1.467045, -2.872172, 0, 1, 0.2313726, 1,
-0.2798645, 0.7025137, -0.4361306, 0, 1, 0.2392157, 1,
-0.2762103, 1.597232, 1.715802, 0, 1, 0.2431373, 1,
-0.2739017, 0.2271057, -0.3054797, 0, 1, 0.2509804, 1,
-0.2718457, 0.7261456, 0.3730196, 0, 1, 0.254902, 1,
-0.2713556, 0.2304966, 0.9142916, 0, 1, 0.2627451, 1,
-0.2683322, -0.1309329, -2.119923, 0, 1, 0.2666667, 1,
-0.2656978, 1.167276, -1.142862, 0, 1, 0.2745098, 1,
-0.2650543, 1.766463, -0.04045328, 0, 1, 0.2784314, 1,
-0.2587893, -1.498548, -4.653567, 0, 1, 0.2862745, 1,
-0.2586448, -1.886316, -2.892469, 0, 1, 0.2901961, 1,
-0.2577741, 1.140652, -0.1625608, 0, 1, 0.2980392, 1,
-0.2571765, 1.070829, -1.565193, 0, 1, 0.3058824, 1,
-0.2441416, 1.863321, -1.269286, 0, 1, 0.3098039, 1,
-0.2429106, -0.1825763, -2.354754, 0, 1, 0.3176471, 1,
-0.2384717, -0.07462349, -2.526257, 0, 1, 0.3215686, 1,
-0.2373883, -2.416379, -3.366571, 0, 1, 0.3294118, 1,
-0.2342015, -0.506802, -2.511921, 0, 1, 0.3333333, 1,
-0.2309516, 1.345799, -0.1065517, 0, 1, 0.3411765, 1,
-0.2298253, 0.4927815, 0.4613896, 0, 1, 0.345098, 1,
-0.2296209, 0.1353837, -1.696581, 0, 1, 0.3529412, 1,
-0.2286983, 0.3236873, -1.243633, 0, 1, 0.3568628, 1,
-0.2241349, -1.339337, -2.911901, 0, 1, 0.3647059, 1,
-0.2236785, -1.565706, -3.394923, 0, 1, 0.3686275, 1,
-0.2207493, 0.4416625, -2.884828, 0, 1, 0.3764706, 1,
-0.2200175, -0.2460515, -2.465362, 0, 1, 0.3803922, 1,
-0.2196931, -0.05071141, -0.6187965, 0, 1, 0.3882353, 1,
-0.2195288, 1.789926, -0.01996754, 0, 1, 0.3921569, 1,
-0.2143359, 0.4776133, 0.771716, 0, 1, 0.4, 1,
-0.2129649, 1.71651, 0.9163737, 0, 1, 0.4078431, 1,
-0.207504, 0.1129525, -3.137732, 0, 1, 0.4117647, 1,
-0.206158, 1.549383, 1.25835, 0, 1, 0.4196078, 1,
-0.2038075, 1.005953, -0.2713689, 0, 1, 0.4235294, 1,
-0.2011359, -0.5672094, -2.71306, 0, 1, 0.4313726, 1,
-0.2002782, 1.165531, 2.243743, 0, 1, 0.4352941, 1,
-0.1966821, -1.370389, -3.333731, 0, 1, 0.4431373, 1,
-0.1945245, 0.4925021, -0.6219522, 0, 1, 0.4470588, 1,
-0.1916143, -0.7928844, -2.407133, 0, 1, 0.454902, 1,
-0.1883874, -1.406103, -2.630243, 0, 1, 0.4588235, 1,
-0.1882914, -0.136161, -2.580587, 0, 1, 0.4666667, 1,
-0.1875502, -0.619522, -1.9973, 0, 1, 0.4705882, 1,
-0.18717, -0.3160413, -2.581239, 0, 1, 0.4784314, 1,
-0.1845221, 0.1173829, -1.075804, 0, 1, 0.4823529, 1,
-0.1819333, -1.046342, -3.688723, 0, 1, 0.4901961, 1,
-0.1815722, -0.06309514, -1.631442, 0, 1, 0.4941176, 1,
-0.1797261, -0.6123647, -0.5710441, 0, 1, 0.5019608, 1,
-0.1783027, -0.1866879, -2.552943, 0, 1, 0.509804, 1,
-0.1767219, -1.675097, -1.8962, 0, 1, 0.5137255, 1,
-0.1766713, -0.4612845, -2.212367, 0, 1, 0.5215687, 1,
-0.1748927, -0.671429, -1.363502, 0, 1, 0.5254902, 1,
-0.1707611, -0.7501183, -4.371655, 0, 1, 0.5333334, 1,
-0.1687538, -0.02282759, -2.886343, 0, 1, 0.5372549, 1,
-0.1686419, 0.2845689, -0.06726462, 0, 1, 0.5450981, 1,
-0.1673114, 0.5746318, -1.874888, 0, 1, 0.5490196, 1,
-0.1662121, -0.1338296, -3.263792, 0, 1, 0.5568628, 1,
-0.1582757, -0.6660984, -3.235418, 0, 1, 0.5607843, 1,
-0.157904, -0.3301384, -2.588189, 0, 1, 0.5686275, 1,
-0.1568999, 0.005310615, -1.87885, 0, 1, 0.572549, 1,
-0.1566767, 0.8684125, -0.1359392, 0, 1, 0.5803922, 1,
-0.1557747, 0.9998227, 0.2155338, 0, 1, 0.5843138, 1,
-0.1542298, 0.3303686, -1.91072, 0, 1, 0.5921569, 1,
-0.15303, -1.524749, -3.981645, 0, 1, 0.5960785, 1,
-0.1506552, 0.6713568, 0.5096203, 0, 1, 0.6039216, 1,
-0.144162, -0.865407, -2.307005, 0, 1, 0.6117647, 1,
-0.1418863, -1.777989, -3.475754, 0, 1, 0.6156863, 1,
-0.1377816, 0.5461745, -0.8863201, 0, 1, 0.6235294, 1,
-0.13144, 0.6931242, 0.7586151, 0, 1, 0.627451, 1,
-0.1314061, 1.146263, 0.4014492, 0, 1, 0.6352941, 1,
-0.1309526, 0.05194337, 0.2602538, 0, 1, 0.6392157, 1,
-0.1307509, 0.5923792, 1.422763, 0, 1, 0.6470588, 1,
-0.1294952, -0.8231668, -3.085722, 0, 1, 0.6509804, 1,
-0.1264286, -1.485773, -2.238076, 0, 1, 0.6588235, 1,
-0.1241888, -1.657593, -3.238745, 0, 1, 0.6627451, 1,
-0.1240967, 0.4218346, -0.2099797, 0, 1, 0.6705883, 1,
-0.1222643, -1.966541, -4.655348, 0, 1, 0.6745098, 1,
-0.1214188, -0.7356595, -3.681138, 0, 1, 0.682353, 1,
-0.1187926, -0.5877422, -3.515845, 0, 1, 0.6862745, 1,
-0.1174596, 0.3071792, -1.838327, 0, 1, 0.6941177, 1,
-0.1146367, -0.3395207, -1.678464, 0, 1, 0.7019608, 1,
-0.1099116, -2.038921, -3.222059, 0, 1, 0.7058824, 1,
-0.1081596, 1.486737, -1.754959, 0, 1, 0.7137255, 1,
-0.1079694, -0.8899587, -4.386595, 0, 1, 0.7176471, 1,
-0.1073525, -0.3944139, -3.228493, 0, 1, 0.7254902, 1,
-0.1042257, -0.4708477, -4.096014, 0, 1, 0.7294118, 1,
-0.1033846, -0.824888, -2.869522, 0, 1, 0.7372549, 1,
-0.1013255, 1.003208, -2.849312, 0, 1, 0.7411765, 1,
-0.100908, 0.6538581, 0.7556713, 0, 1, 0.7490196, 1,
-0.1006051, -0.6064056, -1.83884, 0, 1, 0.7529412, 1,
-0.09461252, -1.08109, -3.63229, 0, 1, 0.7607843, 1,
-0.08216701, 0.1630467, -2.063885, 0, 1, 0.7647059, 1,
-0.08162566, 0.7759371, -0.2084545, 0, 1, 0.772549, 1,
-0.07836282, -1.381665, -4.271075, 0, 1, 0.7764706, 1,
-0.07774761, 1.420386, -0.2949596, 0, 1, 0.7843137, 1,
-0.07630292, -1.7215, -3.188493, 0, 1, 0.7882353, 1,
-0.07379781, 1.288499, -0.9108065, 0, 1, 0.7960784, 1,
-0.06461861, -0.7019926, -1.926359, 0, 1, 0.8039216, 1,
-0.05436505, -1.321856, -3.255146, 0, 1, 0.8078431, 1,
-0.05342356, -0.394325, -3.57393, 0, 1, 0.8156863, 1,
-0.05309867, 1.33094, -0.4399198, 0, 1, 0.8196079, 1,
-0.05268762, 1.684954, -0.7342627, 0, 1, 0.827451, 1,
-0.05038197, -0.1155612, -2.192277, 0, 1, 0.8313726, 1,
-0.05016137, 1.195288, -0.2445641, 0, 1, 0.8392157, 1,
-0.04804583, 0.6804576, -1.633023, 0, 1, 0.8431373, 1,
-0.04668857, 1.878649, -0.5666455, 0, 1, 0.8509804, 1,
-0.04637952, -1.38807, -1.802919, 0, 1, 0.854902, 1,
-0.04605607, 0.2096626, 0.5073268, 0, 1, 0.8627451, 1,
-0.04457365, 1.386427, -0.5614002, 0, 1, 0.8666667, 1,
-0.04050076, -0.01799265, -0.9582473, 0, 1, 0.8745098, 1,
-0.03500415, -0.04183106, -1.744832, 0, 1, 0.8784314, 1,
-0.03364214, 0.2369362, 1.133295, 0, 1, 0.8862745, 1,
-0.0319645, 0.3415643, -0.1415872, 0, 1, 0.8901961, 1,
-0.03164623, -0.723167, -3.058635, 0, 1, 0.8980392, 1,
-0.02837785, -1.276683, -2.842082, 0, 1, 0.9058824, 1,
-0.02814993, -0.4300527, -2.045365, 0, 1, 0.9098039, 1,
-0.02507241, 0.9090024, 0.1692898, 0, 1, 0.9176471, 1,
-0.02485572, 1.479849, -0.2681783, 0, 1, 0.9215686, 1,
-0.02350172, 0.5589139, 1.413022, 0, 1, 0.9294118, 1,
-0.02316109, 0.6959869, -0.2226325, 0, 1, 0.9333333, 1,
-0.02242779, 1.305524, 2.317572, 0, 1, 0.9411765, 1,
-0.01778863, -0.8315604, -4.117824, 0, 1, 0.945098, 1,
-0.01773364, 0.589326, -1.725285, 0, 1, 0.9529412, 1,
-0.01758065, -0.08067357, -2.740417, 0, 1, 0.9568627, 1,
-0.01740282, -0.2136692, -4.092754, 0, 1, 0.9647059, 1,
-0.01294703, 0.7968164, 1.029684, 0, 1, 0.9686275, 1,
-0.01242125, -1.002372, -3.902221, 0, 1, 0.9764706, 1,
-0.0122533, 0.5285198, -0.4314107, 0, 1, 0.9803922, 1,
-0.01088765, -1.390938, -2.459235, 0, 1, 0.9882353, 1,
-0.008910212, -0.3570086, -1.816813, 0, 1, 0.9921569, 1,
-0.008430183, 0.9953743, 0.5810926, 0, 1, 1, 1,
-0.008261982, -1.578554, -3.446362, 0, 0.9921569, 1, 1,
-0.005351183, -2.46622, -2.137783, 0, 0.9882353, 1, 1,
-0.003197383, 0.1800382, -0.8060142, 0, 0.9803922, 1, 1,
-0.002081927, 0.6565192, 0.6486847, 0, 0.9764706, 1, 1,
-0.001556075, 0.5095098, -0.5275248, 0, 0.9686275, 1, 1,
-0.0001250553, -1.143759, -3.64476, 0, 0.9647059, 1, 1,
0.0005698949, 1.346434, -0.4214368, 0, 0.9568627, 1, 1,
0.002907489, -0.2443508, 2.22964, 0, 0.9529412, 1, 1,
0.005809258, -0.04422598, 3.400104, 0, 0.945098, 1, 1,
0.008448441, 1.039576, 0.3546655, 0, 0.9411765, 1, 1,
0.01119812, 0.4623504, -0.04819919, 0, 0.9333333, 1, 1,
0.014581, -0.2525024, 3.852494, 0, 0.9294118, 1, 1,
0.01663412, 2.88526, 1.354662, 0, 0.9215686, 1, 1,
0.01809827, 0.3540739, -1.194608, 0, 0.9176471, 1, 1,
0.01833289, 0.0275019, 0.4520496, 0, 0.9098039, 1, 1,
0.02046714, 0.7098202, -0.8793227, 0, 0.9058824, 1, 1,
0.02478727, 1.439904, 0.1819721, 0, 0.8980392, 1, 1,
0.02492289, 1.176206, -0.3620962, 0, 0.8901961, 1, 1,
0.02547269, -0.2816552, 3.214269, 0, 0.8862745, 1, 1,
0.02682915, 1.229384, 0.5509112, 0, 0.8784314, 1, 1,
0.03802281, 0.9826931, 2.528972, 0, 0.8745098, 1, 1,
0.03929353, -0.4966711, 2.299283, 0, 0.8666667, 1, 1,
0.0410659, 0.3829491, -0.2302292, 0, 0.8627451, 1, 1,
0.04405142, 0.9121615, -0.4087613, 0, 0.854902, 1, 1,
0.04473821, 1.102518, -0.2740476, 0, 0.8509804, 1, 1,
0.04611884, -1.826265, 3.405759, 0, 0.8431373, 1, 1,
0.04757196, 0.705228, 0.02082355, 0, 0.8392157, 1, 1,
0.05366554, -0.5550352, 3.647118, 0, 0.8313726, 1, 1,
0.05945394, -0.08613003, 2.630724, 0, 0.827451, 1, 1,
0.06096186, 0.05795962, 1.831813, 0, 0.8196079, 1, 1,
0.06121901, 1.412908, 0.07416844, 0, 0.8156863, 1, 1,
0.06256783, -0.1288128, 3.834069, 0, 0.8078431, 1, 1,
0.06328336, 0.1093539, 1.69946, 0, 0.8039216, 1, 1,
0.06490905, -2.186303, 3.242393, 0, 0.7960784, 1, 1,
0.06606859, 0.7457262, -1.456595, 0, 0.7882353, 1, 1,
0.06960616, -1.356046, 1.855712, 0, 0.7843137, 1, 1,
0.07238306, -0.8800145, 3.266914, 0, 0.7764706, 1, 1,
0.07641475, -0.5453742, 2.812654, 0, 0.772549, 1, 1,
0.07739072, 0.4782641, -0.9910549, 0, 0.7647059, 1, 1,
0.07937777, -0.06038953, 2.232977, 0, 0.7607843, 1, 1,
0.08500692, 0.2582047, 1.584606, 0, 0.7529412, 1, 1,
0.08878699, -1.280305, 5.150357, 0, 0.7490196, 1, 1,
0.09297788, -0.4705861, 2.886125, 0, 0.7411765, 1, 1,
0.09349183, -0.1863699, 2.613264, 0, 0.7372549, 1, 1,
0.09557747, 0.4656014, 0.3807018, 0, 0.7294118, 1, 1,
0.09601603, 1.209589, 0.2297028, 0, 0.7254902, 1, 1,
0.09673342, -0.05631152, 1.957996, 0, 0.7176471, 1, 1,
0.09684932, -1.540926, 3.275391, 0, 0.7137255, 1, 1,
0.09743317, 0.4870202, 0.1118964, 0, 0.7058824, 1, 1,
0.1056759, -0.1367772, 1.386601, 0, 0.6980392, 1, 1,
0.1145071, 0.8110169, -0.8299159, 0, 0.6941177, 1, 1,
0.1184278, 0.1325925, 1.221429, 0, 0.6862745, 1, 1,
0.1203125, -0.08420247, 1.778802, 0, 0.682353, 1, 1,
0.1228935, 1.880165, -0.08890363, 0, 0.6745098, 1, 1,
0.1265783, 0.4918396, -0.5945229, 0, 0.6705883, 1, 1,
0.1273684, 1.264874, 0.2388576, 0, 0.6627451, 1, 1,
0.1289241, -0.4643902, 1.84004, 0, 0.6588235, 1, 1,
0.1339061, -0.2993202, 2.857424, 0, 0.6509804, 1, 1,
0.1378478, 2.01267, 0.270222, 0, 0.6470588, 1, 1,
0.1415955, 1.685976, 0.5107175, 0, 0.6392157, 1, 1,
0.142775, 0.737456, 0.9407339, 0, 0.6352941, 1, 1,
0.143703, 0.8768614, -0.434511, 0, 0.627451, 1, 1,
0.1461127, -0.9529489, 3.535044, 0, 0.6235294, 1, 1,
0.1480334, 0.7794014, 0.1684204, 0, 0.6156863, 1, 1,
0.1488581, -1.170426, 2.228531, 0, 0.6117647, 1, 1,
0.149276, 1.257847, -0.5133966, 0, 0.6039216, 1, 1,
0.1515492, 0.794982, 0.04085661, 0, 0.5960785, 1, 1,
0.1553152, -0.6987985, 1.979105, 0, 0.5921569, 1, 1,
0.1564567, 0.3517643, 1.290133, 0, 0.5843138, 1, 1,
0.1604857, -1.298591, 2.445741, 0, 0.5803922, 1, 1,
0.1627692, 0.2333051, 2.012362, 0, 0.572549, 1, 1,
0.1639239, 0.4180449, 0.1195624, 0, 0.5686275, 1, 1,
0.1663661, 0.4281379, -0.7186614, 0, 0.5607843, 1, 1,
0.1673377, -0.3334951, 1.951817, 0, 0.5568628, 1, 1,
0.1701478, 1.914303, -0.3868355, 0, 0.5490196, 1, 1,
0.1730761, -0.06093311, 1.021981, 0, 0.5450981, 1, 1,
0.1741339, -1.61752, 2.088964, 0, 0.5372549, 1, 1,
0.174804, -0.1102225, 2.230886, 0, 0.5333334, 1, 1,
0.175054, 0.6713814, 3.087197, 0, 0.5254902, 1, 1,
0.1779098, -0.1284719, 1.00726, 0, 0.5215687, 1, 1,
0.1813352, 1.693057, -0.6102699, 0, 0.5137255, 1, 1,
0.1819265, -0.2827966, 2.04912, 0, 0.509804, 1, 1,
0.1822443, -1.223095, 2.922109, 0, 0.5019608, 1, 1,
0.1848663, -1.775366, 3.214401, 0, 0.4941176, 1, 1,
0.1869844, 0.378557, 2.837666, 0, 0.4901961, 1, 1,
0.1933474, -0.1523353, 0.3676233, 0, 0.4823529, 1, 1,
0.1944731, 1.354477, 1.511167, 0, 0.4784314, 1, 1,
0.1951594, 0.5314898, -0.8750293, 0, 0.4705882, 1, 1,
0.2022163, -0.5523252, 4.788128, 0, 0.4666667, 1, 1,
0.2023004, 0.4111103, 1.108954, 0, 0.4588235, 1, 1,
0.2033185, 1.218776, 0.06951978, 0, 0.454902, 1, 1,
0.2037921, -0.9973226, 4.023152, 0, 0.4470588, 1, 1,
0.2099196, -0.1207115, 1.624275, 0, 0.4431373, 1, 1,
0.2108568, -0.1337264, 1.692086, 0, 0.4352941, 1, 1,
0.2132733, -1.335535, 3.61207, 0, 0.4313726, 1, 1,
0.214261, 1.091439, 1.215626, 0, 0.4235294, 1, 1,
0.21962, -0.3872252, 3.545677, 0, 0.4196078, 1, 1,
0.2210983, 0.8730049, 0.02170802, 0, 0.4117647, 1, 1,
0.2215424, -1.171484, 2.857401, 0, 0.4078431, 1, 1,
0.2229377, 1.060483, -0.876844, 0, 0.4, 1, 1,
0.2237274, -0.5257806, 2.441811, 0, 0.3921569, 1, 1,
0.22553, 0.3587904, 0.1857805, 0, 0.3882353, 1, 1,
0.2349611, 0.3424358, -0.2035942, 0, 0.3803922, 1, 1,
0.2368816, 0.4769527, 0.02930048, 0, 0.3764706, 1, 1,
0.2381604, 1.049764, 0.8397142, 0, 0.3686275, 1, 1,
0.2385072, -1.304082, 3.425102, 0, 0.3647059, 1, 1,
0.2398536, 1.458642, -0.6078951, 0, 0.3568628, 1, 1,
0.2420513, 0.8357696, -0.9723852, 0, 0.3529412, 1, 1,
0.2423842, 0.2833448, 1.369593, 0, 0.345098, 1, 1,
0.2483739, -2.295683, 2.50845, 0, 0.3411765, 1, 1,
0.2524237, -0.1218555, 2.077916, 0, 0.3333333, 1, 1,
0.2554044, -0.7374315, 4.692911, 0, 0.3294118, 1, 1,
0.2555152, 0.3057584, 1.354048, 0, 0.3215686, 1, 1,
0.2579743, 0.3343517, 0.8533299, 0, 0.3176471, 1, 1,
0.2588224, -1.001351, 3.577735, 0, 0.3098039, 1, 1,
0.2596928, 0.8260427, -0.4939448, 0, 0.3058824, 1, 1,
0.2599996, 0.7131313, 0.8727643, 0, 0.2980392, 1, 1,
0.2610791, -2.365591, 4.08639, 0, 0.2901961, 1, 1,
0.2650953, -1.099013, 1.551963, 0, 0.2862745, 1, 1,
0.2667578, 0.3418553, -0.3170741, 0, 0.2784314, 1, 1,
0.2684419, 0.7946404, -0.09182554, 0, 0.2745098, 1, 1,
0.2700037, 2.068516, -0.173191, 0, 0.2666667, 1, 1,
0.2716737, -0.1951983, 2.671865, 0, 0.2627451, 1, 1,
0.2728889, -1.283742, 3.89515, 0, 0.254902, 1, 1,
0.2758803, -1.191792, 4.451544, 0, 0.2509804, 1, 1,
0.2846679, 0.8415623, -0.3137475, 0, 0.2431373, 1, 1,
0.28655, 0.1040648, 1.46483, 0, 0.2392157, 1, 1,
0.287712, 0.2550514, 1.315855, 0, 0.2313726, 1, 1,
0.2884793, -0.1262418, 2.987636, 0, 0.227451, 1, 1,
0.2886941, -0.3457786, 3.894718, 0, 0.2196078, 1, 1,
0.2923637, 0.7033327, 0.8481356, 0, 0.2156863, 1, 1,
0.2951072, -1.672642, 3.157533, 0, 0.2078431, 1, 1,
0.2959093, 1.106317, -1.128786, 0, 0.2039216, 1, 1,
0.301032, -0.1031749, 1.897027, 0, 0.1960784, 1, 1,
0.3017706, 1.306502, 1.353819, 0, 0.1882353, 1, 1,
0.3065782, -0.06227649, 3.035457, 0, 0.1843137, 1, 1,
0.3079596, -1.922832, 4.37452, 0, 0.1764706, 1, 1,
0.3118139, 0.7742057, -0.208094, 0, 0.172549, 1, 1,
0.3136503, -0.06046348, 2.131834, 0, 0.1647059, 1, 1,
0.3168724, -0.2094207, 1.199526, 0, 0.1607843, 1, 1,
0.3357349, 1.347042, 0.3935263, 0, 0.1529412, 1, 1,
0.3357694, 1.672582, -0.7732211, 0, 0.1490196, 1, 1,
0.3365656, -0.2948458, 2.253675, 0, 0.1411765, 1, 1,
0.3409614, -0.4765847, 2.647902, 0, 0.1372549, 1, 1,
0.341474, -0.1047504, 0.0294379, 0, 0.1294118, 1, 1,
0.3415113, 0.09560778, 1.370858, 0, 0.1254902, 1, 1,
0.3496088, -0.09788679, 1.093821, 0, 0.1176471, 1, 1,
0.3566197, 0.8917948, 0.2625519, 0, 0.1137255, 1, 1,
0.3571791, -0.8191188, 1.79023, 0, 0.1058824, 1, 1,
0.3603679, -0.2650103, 2.506898, 0, 0.09803922, 1, 1,
0.373886, 0.2359948, 2.053526, 0, 0.09411765, 1, 1,
0.3744367, -0.573529, 2.445797, 0, 0.08627451, 1, 1,
0.3762041, 0.72143, 0.441772, 0, 0.08235294, 1, 1,
0.3850001, -0.8283628, 2.120471, 0, 0.07450981, 1, 1,
0.3870941, -0.8615963, 2.122913, 0, 0.07058824, 1, 1,
0.388715, 0.2891576, 0.3341681, 0, 0.0627451, 1, 1,
0.3901833, -0.2716882, 2.172134, 0, 0.05882353, 1, 1,
0.3910681, -0.03473193, 1.896293, 0, 0.05098039, 1, 1,
0.3945794, 1.542485, 0.2866914, 0, 0.04705882, 1, 1,
0.3988186, 0.3505819, 2.281802, 0, 0.03921569, 1, 1,
0.3996087, 2.245671, -0.1401865, 0, 0.03529412, 1, 1,
0.4010946, 1.041771, 1.192389, 0, 0.02745098, 1, 1,
0.4012487, -2.199136, 3.34632, 0, 0.02352941, 1, 1,
0.4035691, -0.9492676, 1.54921, 0, 0.01568628, 1, 1,
0.4081543, -1.052933, 4.027109, 0, 0.01176471, 1, 1,
0.410884, -0.5432432, 0.1750239, 0, 0.003921569, 1, 1,
0.4121233, 0.3566917, 1.507309, 0.003921569, 0, 1, 1,
0.4128599, -1.948925, 2.549734, 0.007843138, 0, 1, 1,
0.4131456, 1.531518, -0.3478619, 0.01568628, 0, 1, 1,
0.4136633, -0.1948076, 2.063833, 0.01960784, 0, 1, 1,
0.4185075, 1.002459, 0.1843286, 0.02745098, 0, 1, 1,
0.4214723, 0.5419671, 1.072664, 0.03137255, 0, 1, 1,
0.424869, -0.4363699, 3.312952, 0.03921569, 0, 1, 1,
0.4269488, 0.07174364, 2.342498, 0.04313726, 0, 1, 1,
0.428165, 0.2655865, 0.622537, 0.05098039, 0, 1, 1,
0.4317587, 0.4007013, 1.255271, 0.05490196, 0, 1, 1,
0.43406, -1.787325, 4.155469, 0.0627451, 0, 1, 1,
0.4346686, 0.5543481, 1.459967, 0.06666667, 0, 1, 1,
0.4348769, -0.2142846, 1.638931, 0.07450981, 0, 1, 1,
0.4356262, 0.4310091, -0.07229055, 0.07843138, 0, 1, 1,
0.4379345, 0.4873756, 1.93451, 0.08627451, 0, 1, 1,
0.444327, -0.4267565, 1.769174, 0.09019608, 0, 1, 1,
0.4446232, -0.1532018, 3.433265, 0.09803922, 0, 1, 1,
0.4446515, -1.008042, 1.967325, 0.1058824, 0, 1, 1,
0.4459127, 1.1615, 1.540908, 0.1098039, 0, 1, 1,
0.4506152, 1.310208, -0.0989636, 0.1176471, 0, 1, 1,
0.4537205, 0.448175, 1.755372, 0.1215686, 0, 1, 1,
0.4549242, 0.2589054, 1.448692, 0.1294118, 0, 1, 1,
0.4555189, 1.217665, 0.6273051, 0.1333333, 0, 1, 1,
0.4607444, -0.2700839, 2.778026, 0.1411765, 0, 1, 1,
0.4612876, 1.33588, 1.071685, 0.145098, 0, 1, 1,
0.463198, 0.2342415, -0.8295506, 0.1529412, 0, 1, 1,
0.4653062, -0.166627, 4.488807, 0.1568628, 0, 1, 1,
0.466123, 0.9573258, -0.5426836, 0.1647059, 0, 1, 1,
0.4701253, 1.189125, 1.126185, 0.1686275, 0, 1, 1,
0.4714078, 1.778531, 1.63128, 0.1764706, 0, 1, 1,
0.4724726, 0.4489547, 3.26614, 0.1803922, 0, 1, 1,
0.4824855, -0.6098337, 2.77858, 0.1882353, 0, 1, 1,
0.4832001, 0.9937174, 3.223141, 0.1921569, 0, 1, 1,
0.489027, 1.125325, 2.269642, 0.2, 0, 1, 1,
0.4958986, -0.8269389, 3.804111, 0.2078431, 0, 1, 1,
0.5015001, 0.003371293, 1.73886, 0.2117647, 0, 1, 1,
0.5027807, 0.0217982, 2.239386, 0.2196078, 0, 1, 1,
0.5030459, -0.313638, 3.252129, 0.2235294, 0, 1, 1,
0.5085962, -1.779891, 2.564605, 0.2313726, 0, 1, 1,
0.5220133, -0.5332949, 1.605308, 0.2352941, 0, 1, 1,
0.5344805, 0.5271298, 0.4425961, 0.2431373, 0, 1, 1,
0.5387028, -2.745608, 3.18532, 0.2470588, 0, 1, 1,
0.5411567, -0.3388095, 2.140131, 0.254902, 0, 1, 1,
0.5423815, 0.8342237, 0.8113959, 0.2588235, 0, 1, 1,
0.5443535, 0.1803166, 1.202796, 0.2666667, 0, 1, 1,
0.5462944, -1.085726, 2.216594, 0.2705882, 0, 1, 1,
0.5501354, 0.5972269, 0.3168769, 0.2784314, 0, 1, 1,
0.5507575, -0.04870661, 1.593601, 0.282353, 0, 1, 1,
0.553572, 1.025626, -0.3764625, 0.2901961, 0, 1, 1,
0.5570022, 2.27379, 0.2415681, 0.2941177, 0, 1, 1,
0.5571727, -0.9698622, 1.143276, 0.3019608, 0, 1, 1,
0.5578699, 0.6412474, 0.7283512, 0.3098039, 0, 1, 1,
0.5595323, 1.241414, 1.147355, 0.3137255, 0, 1, 1,
0.5608796, -1.055508, 2.428849, 0.3215686, 0, 1, 1,
0.561042, -0.6195247, 2.560136, 0.3254902, 0, 1, 1,
0.5625476, 0.9796062, 0.9028682, 0.3333333, 0, 1, 1,
0.5681221, -0.9879019, 3.641972, 0.3372549, 0, 1, 1,
0.5728866, -0.9328626, 2.596605, 0.345098, 0, 1, 1,
0.5732582, -1.851636, 3.630198, 0.3490196, 0, 1, 1,
0.5749625, -0.8444006, -0.03992483, 0.3568628, 0, 1, 1,
0.5776614, 0.1347011, 1.792466, 0.3607843, 0, 1, 1,
0.5833479, 0.2130659, 0.7164716, 0.3686275, 0, 1, 1,
0.5888743, -1.777294, 3.963196, 0.372549, 0, 1, 1,
0.5926001, -1.437023, 3.684362, 0.3803922, 0, 1, 1,
0.594677, 1.103731, 0.3171476, 0.3843137, 0, 1, 1,
0.5967777, 1.12931, 1.631097, 0.3921569, 0, 1, 1,
0.6007924, -1.278815, 1.886849, 0.3960784, 0, 1, 1,
0.6034595, -0.7812461, 1.113422, 0.4039216, 0, 1, 1,
0.6037964, -0.01152655, 0.3305734, 0.4117647, 0, 1, 1,
0.6048008, 0.7454841, -0.1036128, 0.4156863, 0, 1, 1,
0.6061646, 1.102752, 0.2274598, 0.4235294, 0, 1, 1,
0.6076825, 0.1062927, 2.556412, 0.427451, 0, 1, 1,
0.6094992, -0.4031226, 2.21666, 0.4352941, 0, 1, 1,
0.613189, -0.4429102, 3.344593, 0.4392157, 0, 1, 1,
0.6140665, 0.439114, 0.8354813, 0.4470588, 0, 1, 1,
0.6160661, -0.522433, 2.318324, 0.4509804, 0, 1, 1,
0.6202313, -0.7734907, 1.984412, 0.4588235, 0, 1, 1,
0.6205255, -0.4952448, 3.811093, 0.4627451, 0, 1, 1,
0.6245982, -0.9139821, 4.029107, 0.4705882, 0, 1, 1,
0.6307952, -0.4677759, 2.475115, 0.4745098, 0, 1, 1,
0.6322102, 2.558547, -1.662261, 0.4823529, 0, 1, 1,
0.6326936, 0.463234, 2.201367, 0.4862745, 0, 1, 1,
0.6342199, 0.7284331, 0.667722, 0.4941176, 0, 1, 1,
0.6351678, 0.1315886, 1.899194, 0.5019608, 0, 1, 1,
0.6354181, -0.9889626, 2.32026, 0.5058824, 0, 1, 1,
0.6379628, -0.5642417, 2.740768, 0.5137255, 0, 1, 1,
0.6384317, 1.724875, -0.07297222, 0.5176471, 0, 1, 1,
0.6411626, 0.4683891, 1.075761, 0.5254902, 0, 1, 1,
0.6439348, 1.109973, 2.210243, 0.5294118, 0, 1, 1,
0.6512775, 1.254029, -0.3170712, 0.5372549, 0, 1, 1,
0.6514461, -0.6775651, 3.703523, 0.5411765, 0, 1, 1,
0.6581349, -1.178774, 2.731583, 0.5490196, 0, 1, 1,
0.6583705, -0.3005553, 2.042671, 0.5529412, 0, 1, 1,
0.6594019, -0.320637, 0.7393153, 0.5607843, 0, 1, 1,
0.6628276, 0.4666077, 0.6899743, 0.5647059, 0, 1, 1,
0.6664424, 1.068071, 2.83239, 0.572549, 0, 1, 1,
0.6779934, -0.685142, 3.780149, 0.5764706, 0, 1, 1,
0.6783584, 0.7154267, 0.7403058, 0.5843138, 0, 1, 1,
0.6794094, 1.125008, 0.6894767, 0.5882353, 0, 1, 1,
0.68483, 0.7000539, -0.6325685, 0.5960785, 0, 1, 1,
0.688741, 0.2748992, 2.157908, 0.6039216, 0, 1, 1,
0.6909666, -0.6150159, 2.632302, 0.6078432, 0, 1, 1,
0.6923454, 1.436532, -0.3595642, 0.6156863, 0, 1, 1,
0.6991121, 0.4058221, 0.006506722, 0.6196079, 0, 1, 1,
0.7001163, 0.03707574, 0.7838859, 0.627451, 0, 1, 1,
0.7051256, -1.031722, 1.36128, 0.6313726, 0, 1, 1,
0.7136135, 1.279065, 0.9883224, 0.6392157, 0, 1, 1,
0.7142966, -1.899021, 3.033055, 0.6431373, 0, 1, 1,
0.7153026, -0.009803746, 2.321942, 0.6509804, 0, 1, 1,
0.7155119, 1.665042, -2.084868, 0.654902, 0, 1, 1,
0.7199975, 0.552096, 1.807755, 0.6627451, 0, 1, 1,
0.7213004, 0.06829135, -0.4044082, 0.6666667, 0, 1, 1,
0.7228197, 0.0128034, -1.200721, 0.6745098, 0, 1, 1,
0.7229862, 1.322982, 0.8426443, 0.6784314, 0, 1, 1,
0.7268373, -0.7701557, 1.743811, 0.6862745, 0, 1, 1,
0.7270985, 0.3043692, 2.781615, 0.6901961, 0, 1, 1,
0.7318397, -0.1716712, 1.12655, 0.6980392, 0, 1, 1,
0.7319384, -0.481866, 2.820004, 0.7058824, 0, 1, 1,
0.7336701, 0.7424885, 0.7843404, 0.7098039, 0, 1, 1,
0.7391639, 0.8512825, 0.09164312, 0.7176471, 0, 1, 1,
0.7404933, -0.4225124, 2.569933, 0.7215686, 0, 1, 1,
0.74655, -2.219422, 4.589109, 0.7294118, 0, 1, 1,
0.7467985, -0.02889946, 2.036681, 0.7333333, 0, 1, 1,
0.7477046, -0.1980126, 1.696152, 0.7411765, 0, 1, 1,
0.753511, -1.570134, 4.522954, 0.7450981, 0, 1, 1,
0.7544879, -1.148295, 0.9102059, 0.7529412, 0, 1, 1,
0.7571677, 0.3044849, -0.8919283, 0.7568628, 0, 1, 1,
0.7649124, -0.4560879, 1.872724, 0.7647059, 0, 1, 1,
0.7715069, -0.2545947, 1.47979, 0.7686275, 0, 1, 1,
0.7731183, -2.082376, 3.569667, 0.7764706, 0, 1, 1,
0.7732083, 0.5563486, 1.231136, 0.7803922, 0, 1, 1,
0.7749527, -1.592552, 3.185471, 0.7882353, 0, 1, 1,
0.7750424, 0.9268133, 2.342626, 0.7921569, 0, 1, 1,
0.7775962, 0.8903976, 0.7031425, 0.8, 0, 1, 1,
0.7897322, -0.09149579, 1.246737, 0.8078431, 0, 1, 1,
0.793421, 0.6519037, 1.15398, 0.8117647, 0, 1, 1,
0.7949164, -1.308722, 4.18649, 0.8196079, 0, 1, 1,
0.7961793, 0.8728041, 0.6414758, 0.8235294, 0, 1, 1,
0.7991097, -0.2416977, 1.081014, 0.8313726, 0, 1, 1,
0.8032572, -0.5764527, 1.766026, 0.8352941, 0, 1, 1,
0.80475, -1.036077, 1.592939, 0.8431373, 0, 1, 1,
0.804941, -0.2618973, 1.247551, 0.8470588, 0, 1, 1,
0.8060738, -1.309462, 4.449333, 0.854902, 0, 1, 1,
0.8162, 0.3206216, 0.2929364, 0.8588235, 0, 1, 1,
0.8310313, 1.86422, 0.2635715, 0.8666667, 0, 1, 1,
0.8352499, -0.458483, 3.79106, 0.8705882, 0, 1, 1,
0.8357891, -0.5122828, 0.9633084, 0.8784314, 0, 1, 1,
0.8403141, -1.170807, 3.170437, 0.8823529, 0, 1, 1,
0.8466714, -1.118177, 1.989529, 0.8901961, 0, 1, 1,
0.8514894, 0.3347257, 2.230189, 0.8941177, 0, 1, 1,
0.8598852, -1.35901, 4.367506, 0.9019608, 0, 1, 1,
0.8647898, -0.40387, 1.179129, 0.9098039, 0, 1, 1,
0.8679945, -1.420618, 1.260184, 0.9137255, 0, 1, 1,
0.8697325, -0.5212622, 1.595922, 0.9215686, 0, 1, 1,
0.8725788, 0.000244998, 0.344554, 0.9254902, 0, 1, 1,
0.8793684, -0.4366154, 2.931158, 0.9333333, 0, 1, 1,
0.8830231, 0.1763491, 1.516825, 0.9372549, 0, 1, 1,
0.8917821, 1.120118, 0.4754383, 0.945098, 0, 1, 1,
0.9058989, 0.6303264, 0.5507872, 0.9490196, 0, 1, 1,
0.906833, -0.3207304, 1.736416, 0.9568627, 0, 1, 1,
0.9070237, 0.141754, -1.242194, 0.9607843, 0, 1, 1,
0.9070374, 0.8985204, -0.2686031, 0.9686275, 0, 1, 1,
0.9089909, -0.2470579, 2.108599, 0.972549, 0, 1, 1,
0.9106482, -0.08234316, 1.921613, 0.9803922, 0, 1, 1,
0.9116652, 0.5120549, -0.2606866, 0.9843137, 0, 1, 1,
0.9138102, -0.3254269, 0.458354, 0.9921569, 0, 1, 1,
0.9144469, -0.2267406, 1.75826, 0.9960784, 0, 1, 1,
0.9148797, 1.390293, -0.451701, 1, 0, 0.9960784, 1,
0.9193418, -0.7944228, 2.303237, 1, 0, 0.9882353, 1,
0.9226146, -0.9575936, 1.743702, 1, 0, 0.9843137, 1,
0.924207, -0.6471732, 1.089321, 1, 0, 0.9764706, 1,
0.9256358, -0.9286315, 1.802395, 1, 0, 0.972549, 1,
0.9349369, 0.07849885, 2.399307, 1, 0, 0.9647059, 1,
0.9359701, 0.7904304, 1.654121, 1, 0, 0.9607843, 1,
0.9463947, -0.5752186, 1.848026, 1, 0, 0.9529412, 1,
0.953526, -1.258343, 1.663791, 1, 0, 0.9490196, 1,
0.962203, -0.3155338, 1.340007, 1, 0, 0.9411765, 1,
0.9640494, 0.1515868, 1.966415, 1, 0, 0.9372549, 1,
0.9669405, -1.234555, 2.477267, 1, 0, 0.9294118, 1,
0.9768547, 1.150174, 0.5092312, 1, 0, 0.9254902, 1,
0.9787065, -0.7015095, 2.383551, 1, 0, 0.9176471, 1,
0.9837567, 0.3787723, -2.228886, 1, 0, 0.9137255, 1,
0.9877467, 0.130469, 2.127019, 1, 0, 0.9058824, 1,
0.996148, -0.08449137, 2.050603, 1, 0, 0.9019608, 1,
0.9986154, 2.294502, 2.144454, 1, 0, 0.8941177, 1,
1.008195, 0.6228474, -0.1463731, 1, 0, 0.8862745, 1,
1.013947, -0.3218333, 2.520664, 1, 0, 0.8823529, 1,
1.015317, 0.5520804, 3.269601, 1, 0, 0.8745098, 1,
1.027279, 1.924656, 0.3927185, 1, 0, 0.8705882, 1,
1.02773, 0.8355177, 1.759149, 1, 0, 0.8627451, 1,
1.038949, 0.515072, 0.1408836, 1, 0, 0.8588235, 1,
1.051476, 0.835741, 0.6948376, 1, 0, 0.8509804, 1,
1.058594, 0.1986932, 0.9799144, 1, 0, 0.8470588, 1,
1.059207, 1.044864, 0.1038772, 1, 0, 0.8392157, 1,
1.06064, 0.03322593, 0.1095123, 1, 0, 0.8352941, 1,
1.061591, -1.359388, 2.853395, 1, 0, 0.827451, 1,
1.063599, 1.173936, 2.079015, 1, 0, 0.8235294, 1,
1.067469, -0.07053627, -0.4666564, 1, 0, 0.8156863, 1,
1.078361, -0.2232907, 0.03243992, 1, 0, 0.8117647, 1,
1.083371, 0.307748, 1.515861, 1, 0, 0.8039216, 1,
1.089912, -0.4035509, 1.620836, 1, 0, 0.7960784, 1,
1.090834, -0.8443533, 2.466934, 1, 0, 0.7921569, 1,
1.100543, -0.547747, 1.989604, 1, 0, 0.7843137, 1,
1.101501, -0.2659616, 2.835127, 1, 0, 0.7803922, 1,
1.110088, 1.63792, 0.84454, 1, 0, 0.772549, 1,
1.118116, 0.1709574, 3.160091, 1, 0, 0.7686275, 1,
1.120846, 1.071145, -0.4825542, 1, 0, 0.7607843, 1,
1.12159, 0.6621751, 0.8000321, 1, 0, 0.7568628, 1,
1.121997, -1.563889, 2.093054, 1, 0, 0.7490196, 1,
1.127284, 0.06928043, 0.7555337, 1, 0, 0.7450981, 1,
1.13827, -1.082267, 2.74248, 1, 0, 0.7372549, 1,
1.140919, -0.01471557, 2.145409, 1, 0, 0.7333333, 1,
1.147416, 0.03178146, 2.13566, 1, 0, 0.7254902, 1,
1.152003, 1.102143, 0.05308496, 1, 0, 0.7215686, 1,
1.161788, 0.1511168, 0.6223381, 1, 0, 0.7137255, 1,
1.169367, 1.241848, -0.5721257, 1, 0, 0.7098039, 1,
1.174488, -0.5950431, 2.036139, 1, 0, 0.7019608, 1,
1.183802, -0.3943023, 0.9974348, 1, 0, 0.6941177, 1,
1.184918, -1.150952, 2.276344, 1, 0, 0.6901961, 1,
1.19019, -0.6131005, 1.49716, 1, 0, 0.682353, 1,
1.191633, 0.2203532, 3.381501, 1, 0, 0.6784314, 1,
1.194038, 1.267832, -0.3088455, 1, 0, 0.6705883, 1,
1.195094, -1.210142, 0.7372692, 1, 0, 0.6666667, 1,
1.199637, 0.5659732, 1.247053, 1, 0, 0.6588235, 1,
1.200528, -0.06459714, 2.546427, 1, 0, 0.654902, 1,
1.204359, 1.892968, -1.510885, 1, 0, 0.6470588, 1,
1.210787, -1.317204, 1.429928, 1, 0, 0.6431373, 1,
1.212486, -0.5349227, 2.454628, 1, 0, 0.6352941, 1,
1.215769, -0.7483929, 0.7718951, 1, 0, 0.6313726, 1,
1.229215, 0.1733919, 1.11832, 1, 0, 0.6235294, 1,
1.234663, 0.4342339, 0.8493993, 1, 0, 0.6196079, 1,
1.241739, -0.8050151, 1.82494, 1, 0, 0.6117647, 1,
1.248748, -2.147533, 3.88185, 1, 0, 0.6078432, 1,
1.252664, 1.649851, 0.02799234, 1, 0, 0.6, 1,
1.253463, 2.139984, 1.14778, 1, 0, 0.5921569, 1,
1.257033, 1.632629, 1.783903, 1, 0, 0.5882353, 1,
1.258679, -0.8681253, 0.3762915, 1, 0, 0.5803922, 1,
1.262396, -0.4745843, 1.696878, 1, 0, 0.5764706, 1,
1.272559, -0.9778108, 2.001787, 1, 0, 0.5686275, 1,
1.272968, 2.345487, -0.9534829, 1, 0, 0.5647059, 1,
1.274239, -0.4650445, 1.836079, 1, 0, 0.5568628, 1,
1.283727, 1.342776, 1.663838, 1, 0, 0.5529412, 1,
1.287049, 0.2864281, 2.450785, 1, 0, 0.5450981, 1,
1.288958, 0.9335138, 1.353147, 1, 0, 0.5411765, 1,
1.289061, -1.40301, 1.351241, 1, 0, 0.5333334, 1,
1.313177, -0.9471428, 1.434864, 1, 0, 0.5294118, 1,
1.337453, -1.128321, 1.855068, 1, 0, 0.5215687, 1,
1.341363, -2.021215, 1.569948, 1, 0, 0.5176471, 1,
1.345218, 1.279237, 1.656485, 1, 0, 0.509804, 1,
1.356075, 0.8093517, 0.5512888, 1, 0, 0.5058824, 1,
1.356269, -1.825001, 0.9030976, 1, 0, 0.4980392, 1,
1.361933, 0.6550968, 0.9193262, 1, 0, 0.4901961, 1,
1.36392, 0.6260253, -0.6291578, 1, 0, 0.4862745, 1,
1.37383, 0.713712, 1.908163, 1, 0, 0.4784314, 1,
1.387372, 1.280481, 0.2546209, 1, 0, 0.4745098, 1,
1.387598, -0.2667798, 0.1162104, 1, 0, 0.4666667, 1,
1.393452, -0.114449, 0.4682569, 1, 0, 0.4627451, 1,
1.398755, -0.3256471, 0.07207274, 1, 0, 0.454902, 1,
1.40767, 0.08537565, 2.141652, 1, 0, 0.4509804, 1,
1.414749, 2.217939, -0.2404172, 1, 0, 0.4431373, 1,
1.415073, 1.363374, 2.354332, 1, 0, 0.4392157, 1,
1.417504, -0.8766936, 2.81482, 1, 0, 0.4313726, 1,
1.424702, 1.113676, 0.7313485, 1, 0, 0.427451, 1,
1.435503, 0.4374963, 1.515315, 1, 0, 0.4196078, 1,
1.435593, 2.401312, -0.2149233, 1, 0, 0.4156863, 1,
1.46408, 0.1157681, 0.8532676, 1, 0, 0.4078431, 1,
1.471934, 2.24908, -0.01627559, 1, 0, 0.4039216, 1,
1.473184, -0.458431, 2.358226, 1, 0, 0.3960784, 1,
1.486893, -0.4607971, 1.843398, 1, 0, 0.3882353, 1,
1.48869, -1.390781, 2.336599, 1, 0, 0.3843137, 1,
1.494875, 0.1183338, 1.210563, 1, 0, 0.3764706, 1,
1.514502, -0.3413993, 0.7787064, 1, 0, 0.372549, 1,
1.518633, -1.528011, 2.637315, 1, 0, 0.3647059, 1,
1.523154, -1.020691, 0.4472306, 1, 0, 0.3607843, 1,
1.582271, -0.0768673, 1.481802, 1, 0, 0.3529412, 1,
1.592602, -0.611849, 1.754646, 1, 0, 0.3490196, 1,
1.607486, -0.8708548, 1.647374, 1, 0, 0.3411765, 1,
1.622278, -0.4167548, 2.054399, 1, 0, 0.3372549, 1,
1.638127, -0.1440883, 2.479644, 1, 0, 0.3294118, 1,
1.639606, -0.004704463, 2.398999, 1, 0, 0.3254902, 1,
1.640076, 3.014571, -0.4654306, 1, 0, 0.3176471, 1,
1.647322, -0.4093407, 1.485829, 1, 0, 0.3137255, 1,
1.648954, 0.9317956, -0.6098138, 1, 0, 0.3058824, 1,
1.654658, -0.5377399, 1.633983, 1, 0, 0.2980392, 1,
1.661374, -0.7271508, 2.065821, 1, 0, 0.2941177, 1,
1.662583, -0.9708798, 2.886404, 1, 0, 0.2862745, 1,
1.674516, -0.6363202, 2.199435, 1, 0, 0.282353, 1,
1.693224, -0.2808103, 2.953383, 1, 0, 0.2745098, 1,
1.696643, -0.3467543, -0.06311139, 1, 0, 0.2705882, 1,
1.701653, -1.320546, 1.39205, 1, 0, 0.2627451, 1,
1.733808, 0.7110727, 1.072889, 1, 0, 0.2588235, 1,
1.754772, 1.105562, 0.5311999, 1, 0, 0.2509804, 1,
1.756616, 0.5671353, 2.208049, 1, 0, 0.2470588, 1,
1.771707, 0.2772126, 2.798107, 1, 0, 0.2392157, 1,
1.773924, -1.673104, 1.214845, 1, 0, 0.2352941, 1,
1.789979, -0.0798935, 0.67166, 1, 0, 0.227451, 1,
1.791548, 0.3560467, 0.1347256, 1, 0, 0.2235294, 1,
1.798109, -0.4314835, 1.90398, 1, 0, 0.2156863, 1,
1.798945, 1.141496, 0.2662121, 1, 0, 0.2117647, 1,
1.805318, -0.8517979, 2.861023, 1, 0, 0.2039216, 1,
1.839933, 1.033557, -0.5313018, 1, 0, 0.1960784, 1,
1.848093, 1.33006, 0.7741272, 1, 0, 0.1921569, 1,
1.872948, -1.381495, 2.992001, 1, 0, 0.1843137, 1,
1.883806, -1.815826, 2.095469, 1, 0, 0.1803922, 1,
1.905994, 0.805266, 2.067021, 1, 0, 0.172549, 1,
1.909013, 0.09601556, 1.749167, 1, 0, 0.1686275, 1,
1.943042, -0.1941511, 3.290786, 1, 0, 0.1607843, 1,
1.953074, -0.8468938, 2.745965, 1, 0, 0.1568628, 1,
1.976384, 0.3777463, 3.088407, 1, 0, 0.1490196, 1,
1.983189, 0.06466272, 2.505835, 1, 0, 0.145098, 1,
2.018071, 0.4343618, 2.295663, 1, 0, 0.1372549, 1,
2.020355, 0.4034642, 0.8214359, 1, 0, 0.1333333, 1,
2.109352, 0.3045425, 0.6243855, 1, 0, 0.1254902, 1,
2.144902, -0.07380301, 1.709002, 1, 0, 0.1215686, 1,
2.166324, -0.9813888, 2.424485, 1, 0, 0.1137255, 1,
2.183904, 0.9600819, -0.9279234, 1, 0, 0.1098039, 1,
2.198431, -0.3023977, 3.302818, 1, 0, 0.1019608, 1,
2.252658, -1.327099, 0.9675959, 1, 0, 0.09411765, 1,
2.268109, -1.299486, 3.433942, 1, 0, 0.09019608, 1,
2.271782, 1.441195, 0.8500026, 1, 0, 0.08235294, 1,
2.284683, 0.4363777, 1.01384, 1, 0, 0.07843138, 1,
2.343168, 0.4017301, 1.111207, 1, 0, 0.07058824, 1,
2.343297, -1.479459, 2.301677, 1, 0, 0.06666667, 1,
2.357367, 1.315657, 0.4162569, 1, 0, 0.05882353, 1,
2.435147, 1.693275, 0.8474225, 1, 0, 0.05490196, 1,
2.472276, -1.374349, 2.246009, 1, 0, 0.04705882, 1,
2.566672, 0.7639041, 0.5092252, 1, 0, 0.04313726, 1,
2.627883, -1.342265, 1.63191, 1, 0, 0.03529412, 1,
2.995949, -0.4141606, 2.050607, 1, 0, 0.03137255, 1,
3.094295, 0.8252923, 1.219757, 1, 0, 0.02352941, 1,
3.265737, 0.4898169, 1.52985, 1, 0, 0.01960784, 1,
3.269296, -0.6093841, 1.296459, 1, 0, 0.01176471, 1,
4.586302, 0.3295341, 2.002436, 1, 0, 0.007843138, 1
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
0.3975496, -3.721959, -7.02576, 0, -0.5, 0.5, 0.5,
0.3975496, -3.721959, -7.02576, 1, -0.5, 0.5, 0.5,
0.3975496, -3.721959, -7.02576, 1, 1.5, 0.5, 0.5,
0.3975496, -3.721959, -7.02576, 0, 1.5, 0.5, 0.5
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
-5.21119, 0.1344815, -7.02576, 0, -0.5, 0.5, 0.5,
-5.21119, 0.1344815, -7.02576, 1, -0.5, 0.5, 0.5,
-5.21119, 0.1344815, -7.02576, 1, 1.5, 0.5, 0.5,
-5.21119, 0.1344815, -7.02576, 0, 1.5, 0.5, 0.5
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
-5.21119, -3.721959, -0.05533648, 0, -0.5, 0.5, 0.5,
-5.21119, -3.721959, -0.05533648, 1, -0.5, 0.5, 0.5,
-5.21119, -3.721959, -0.05533648, 1, 1.5, 0.5, 0.5,
-5.21119, -3.721959, -0.05533648, 0, 1.5, 0.5, 0.5
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
-2, -2.832011, -5.417201,
4, -2.832011, -5.417201,
-2, -2.832011, -5.417201,
-2, -2.980336, -5.685294,
0, -2.832011, -5.417201,
0, -2.980336, -5.685294,
2, -2.832011, -5.417201,
2, -2.980336, -5.685294,
4, -2.832011, -5.417201,
4, -2.980336, -5.685294
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
"0",
"2",
"4"
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
-2, -3.276985, -6.221481, 0, -0.5, 0.5, 0.5,
-2, -3.276985, -6.221481, 1, -0.5, 0.5, 0.5,
-2, -3.276985, -6.221481, 1, 1.5, 0.5, 0.5,
-2, -3.276985, -6.221481, 0, 1.5, 0.5, 0.5,
0, -3.276985, -6.221481, 0, -0.5, 0.5, 0.5,
0, -3.276985, -6.221481, 1, -0.5, 0.5, 0.5,
0, -3.276985, -6.221481, 1, 1.5, 0.5, 0.5,
0, -3.276985, -6.221481, 0, 1.5, 0.5, 0.5,
2, -3.276985, -6.221481, 0, -0.5, 0.5, 0.5,
2, -3.276985, -6.221481, 1, -0.5, 0.5, 0.5,
2, -3.276985, -6.221481, 1, 1.5, 0.5, 0.5,
2, -3.276985, -6.221481, 0, 1.5, 0.5, 0.5,
4, -3.276985, -6.221481, 0, -0.5, 0.5, 0.5,
4, -3.276985, -6.221481, 1, -0.5, 0.5, 0.5,
4, -3.276985, -6.221481, 1, 1.5, 0.5, 0.5,
4, -3.276985, -6.221481, 0, 1.5, 0.5, 0.5
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
-3.916866, -2, -5.417201,
-3.916866, 3, -5.417201,
-3.916866, -2, -5.417201,
-4.132586, -2, -5.685294,
-3.916866, -1, -5.417201,
-4.132586, -1, -5.685294,
-3.916866, 0, -5.417201,
-4.132586, 0, -5.685294,
-3.916866, 1, -5.417201,
-4.132586, 1, -5.685294,
-3.916866, 2, -5.417201,
-4.132586, 2, -5.685294,
-3.916866, 3, -5.417201,
-4.132586, 3, -5.685294
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
-4.564028, -2, -6.221481, 0, -0.5, 0.5, 0.5,
-4.564028, -2, -6.221481, 1, -0.5, 0.5, 0.5,
-4.564028, -2, -6.221481, 1, 1.5, 0.5, 0.5,
-4.564028, -2, -6.221481, 0, 1.5, 0.5, 0.5,
-4.564028, -1, -6.221481, 0, -0.5, 0.5, 0.5,
-4.564028, -1, -6.221481, 1, -0.5, 0.5, 0.5,
-4.564028, -1, -6.221481, 1, 1.5, 0.5, 0.5,
-4.564028, -1, -6.221481, 0, 1.5, 0.5, 0.5,
-4.564028, 0, -6.221481, 0, -0.5, 0.5, 0.5,
-4.564028, 0, -6.221481, 1, -0.5, 0.5, 0.5,
-4.564028, 0, -6.221481, 1, 1.5, 0.5, 0.5,
-4.564028, 0, -6.221481, 0, 1.5, 0.5, 0.5,
-4.564028, 1, -6.221481, 0, -0.5, 0.5, 0.5,
-4.564028, 1, -6.221481, 1, -0.5, 0.5, 0.5,
-4.564028, 1, -6.221481, 1, 1.5, 0.5, 0.5,
-4.564028, 1, -6.221481, 0, 1.5, 0.5, 0.5,
-4.564028, 2, -6.221481, 0, -0.5, 0.5, 0.5,
-4.564028, 2, -6.221481, 1, -0.5, 0.5, 0.5,
-4.564028, 2, -6.221481, 1, 1.5, 0.5, 0.5,
-4.564028, 2, -6.221481, 0, 1.5, 0.5, 0.5,
-4.564028, 3, -6.221481, 0, -0.5, 0.5, 0.5,
-4.564028, 3, -6.221481, 1, -0.5, 0.5, 0.5,
-4.564028, 3, -6.221481, 1, 1.5, 0.5, 0.5,
-4.564028, 3, -6.221481, 0, 1.5, 0.5, 0.5
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
-3.916866, -2.832011, -4,
-3.916866, -2.832011, 4,
-3.916866, -2.832011, -4,
-4.132586, -2.980336, -4,
-3.916866, -2.832011, -2,
-4.132586, -2.980336, -2,
-3.916866, -2.832011, 0,
-4.132586, -2.980336, 0,
-3.916866, -2.832011, 2,
-4.132586, -2.980336, 2,
-3.916866, -2.832011, 4,
-4.132586, -2.980336, 4
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
-4.564028, -3.276985, -4, 0, -0.5, 0.5, 0.5,
-4.564028, -3.276985, -4, 1, -0.5, 0.5, 0.5,
-4.564028, -3.276985, -4, 1, 1.5, 0.5, 0.5,
-4.564028, -3.276985, -4, 0, 1.5, 0.5, 0.5,
-4.564028, -3.276985, -2, 0, -0.5, 0.5, 0.5,
-4.564028, -3.276985, -2, 1, -0.5, 0.5, 0.5,
-4.564028, -3.276985, -2, 1, 1.5, 0.5, 0.5,
-4.564028, -3.276985, -2, 0, 1.5, 0.5, 0.5,
-4.564028, -3.276985, 0, 0, -0.5, 0.5, 0.5,
-4.564028, -3.276985, 0, 1, -0.5, 0.5, 0.5,
-4.564028, -3.276985, 0, 1, 1.5, 0.5, 0.5,
-4.564028, -3.276985, 0, 0, 1.5, 0.5, 0.5,
-4.564028, -3.276985, 2, 0, -0.5, 0.5, 0.5,
-4.564028, -3.276985, 2, 1, -0.5, 0.5, 0.5,
-4.564028, -3.276985, 2, 1, 1.5, 0.5, 0.5,
-4.564028, -3.276985, 2, 0, 1.5, 0.5, 0.5,
-4.564028, -3.276985, 4, 0, -0.5, 0.5, 0.5,
-4.564028, -3.276985, 4, 1, -0.5, 0.5, 0.5,
-4.564028, -3.276985, 4, 1, 1.5, 0.5, 0.5,
-4.564028, -3.276985, 4, 0, 1.5, 0.5, 0.5
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
-3.916866, -2.832011, -5.417201,
-3.916866, 3.100974, -5.417201,
-3.916866, -2.832011, 5.306528,
-3.916866, 3.100974, 5.306528,
-3.916866, -2.832011, -5.417201,
-3.916866, -2.832011, 5.306528,
-3.916866, 3.100974, -5.417201,
-3.916866, 3.100974, 5.306528,
-3.916866, -2.832011, -5.417201,
4.711965, -2.832011, -5.417201,
-3.916866, -2.832011, 5.306528,
4.711965, -2.832011, 5.306528,
-3.916866, 3.100974, -5.417201,
4.711965, 3.100974, -5.417201,
-3.916866, 3.100974, 5.306528,
4.711965, 3.100974, 5.306528,
4.711965, -2.832011, -5.417201,
4.711965, 3.100974, -5.417201,
4.711965, -2.832011, 5.306528,
4.711965, 3.100974, 5.306528,
4.711965, -2.832011, -5.417201,
4.711965, -2.832011, 5.306528,
4.711965, 3.100974, -5.417201,
4.711965, 3.100974, 5.306528
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
var radius = 8.003573;
var distance = 35.6088;
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
mvMatrix.translate( -0.3975496, -0.1344815, 0.05533648 );
mvMatrix.scale( 1.002873, 1.458561, 0.8069599 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.6088);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
copper_copper_monoet<-read.table("copper_copper_monoet.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-copper_copper_monoet$V2
```

```
## Error in eval(expr, envir, enclos): object 'copper_copper_monoet' not found
```

```r
y<-copper_copper_monoet$V3
```

```
## Error in eval(expr, envir, enclos): object 'copper_copper_monoet' not found
```

```r
z<-copper_copper_monoet$V4
```

```
## Error in eval(expr, envir, enclos): object 'copper_copper_monoet' not found
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
-3.791203, -0.2184388, -0.7792268, 0, 0, 1, 1, 1,
-2.788476, -0.3907948, 0.1944465, 1, 0, 0, 1, 1,
-2.760864, 0.2420069, -1.828781, 1, 0, 0, 1, 1,
-2.754366, 0.01306077, -2.07997, 1, 0, 0, 1, 1,
-2.654061, 0.7664097, -1.206397, 1, 0, 0, 1, 1,
-2.510408, -0.3861658, -1.802363, 1, 0, 0, 1, 1,
-2.456549, -0.06533661, -2.384916, 0, 0, 0, 1, 1,
-2.405662, -1.219833, -2.127041, 0, 0, 0, 1, 1,
-2.333781, -0.3065154, -1.414473, 0, 0, 0, 1, 1,
-2.257355, 2.08867, -1.863519, 0, 0, 0, 1, 1,
-2.253919, 0.7043905, -0.4480626, 0, 0, 0, 1, 1,
-2.152627, -0.5493748, -0.9051606, 0, 0, 0, 1, 1,
-2.149576, 0.5739424, -2.512093, 0, 0, 0, 1, 1,
-2.094861, -0.8628107, -0.5950602, 1, 1, 1, 1, 1,
-2.068553, 0.03078614, -1.413788, 1, 1, 1, 1, 1,
-2.050237, -0.2095335, -2.052996, 1, 1, 1, 1, 1,
-2.022, -0.3886823, -1.432436, 1, 1, 1, 1, 1,
-1.992613, 0.3599195, -1.540119, 1, 1, 1, 1, 1,
-1.969916, 1.03392, -2.738863, 1, 1, 1, 1, 1,
-1.931927, 1.079388, -3.870157, 1, 1, 1, 1, 1,
-1.912302, 0.872574, -1.442461, 1, 1, 1, 1, 1,
-1.902704, -1.119683, -0.8850264, 1, 1, 1, 1, 1,
-1.89145, 0.2340384, -1.666021, 1, 1, 1, 1, 1,
-1.874703, -0.191623, -1.767231, 1, 1, 1, 1, 1,
-1.831973, 0.2436663, 0.4034007, 1, 1, 1, 1, 1,
-1.827396, -1.764471, -2.248519, 1, 1, 1, 1, 1,
-1.816332, -2.558503, -2.174848, 1, 1, 1, 1, 1,
-1.815373, 0.1300106, -1.994728, 1, 1, 1, 1, 1,
-1.803182, 1.836761, -0.1445111, 0, 0, 1, 1, 1,
-1.801206, -0.9254493, -2.788247, 1, 0, 0, 1, 1,
-1.770621, 0.3688737, -0.9076704, 1, 0, 0, 1, 1,
-1.703592, -0.4544377, -2.689919, 1, 0, 0, 1, 1,
-1.694519, 0.5582753, -2.121994, 1, 0, 0, 1, 1,
-1.680807, 1.18469, -1.327728, 1, 0, 0, 1, 1,
-1.670042, 1.232625, -2.231738, 0, 0, 0, 1, 1,
-1.665736, 2.377439, -1.852814, 0, 0, 0, 1, 1,
-1.642743, 1.000051, -1.472424, 0, 0, 0, 1, 1,
-1.637197, -1.094528, -2.447041, 0, 0, 0, 1, 1,
-1.633253, 0.9409295, -0.750271, 0, 0, 0, 1, 1,
-1.619171, -0.7289583, -3.791179, 0, 0, 0, 1, 1,
-1.616177, 0.8292195, -3.012065, 0, 0, 0, 1, 1,
-1.612402, -2.19092, -4.041838, 1, 1, 1, 1, 1,
-1.600224, 0.1693573, -1.994217, 1, 1, 1, 1, 1,
-1.596642, -1.620008, -3.06019, 1, 1, 1, 1, 1,
-1.596046, 0.1845227, -1.109768, 1, 1, 1, 1, 1,
-1.582361, -0.4265171, -3.085468, 1, 1, 1, 1, 1,
-1.574113, 0.4107929, -2.359351, 1, 1, 1, 1, 1,
-1.567179, -0.8385649, -3.060075, 1, 1, 1, 1, 1,
-1.555026, 0.1870682, -0.9363365, 1, 1, 1, 1, 1,
-1.5537, -0.4763395, 0.06293128, 1, 1, 1, 1, 1,
-1.546926, 0.7628109, -0.9730407, 1, 1, 1, 1, 1,
-1.545467, -0.4290065, -1.691278, 1, 1, 1, 1, 1,
-1.521142, -0.1795434, -2.182707, 1, 1, 1, 1, 1,
-1.515629, 0.7518498, -2.428816, 1, 1, 1, 1, 1,
-1.514177, -0.3657163, -3.686957, 1, 1, 1, 1, 1,
-1.477551, 0.5512643, -3.033647, 1, 1, 1, 1, 1,
-1.476237, 0.4931291, -0.6788049, 0, 0, 1, 1, 1,
-1.464353, -0.04966792, -0.7661961, 1, 0, 0, 1, 1,
-1.462934, -0.4750955, -0.8736225, 1, 0, 0, 1, 1,
-1.462136, -0.1432638, -0.9144546, 1, 0, 0, 1, 1,
-1.46195, 0.2770402, -0.8640025, 1, 0, 0, 1, 1,
-1.451383, 0.5411121, -0.2896906, 1, 0, 0, 1, 1,
-1.444068, -0.5524701, -1.626984, 0, 0, 0, 1, 1,
-1.442798, -1.982138, -1.56782, 0, 0, 0, 1, 1,
-1.44146, 0.621071, -1.462066, 0, 0, 0, 1, 1,
-1.431939, -0.5818504, -2.0776, 0, 0, 0, 1, 1,
-1.430422, -0.1813757, -2.473837, 0, 0, 0, 1, 1,
-1.427215, -0.8099178, -2.600206, 0, 0, 0, 1, 1,
-1.408202, -0.1329402, -1.319518, 0, 0, 0, 1, 1,
-1.395509, -0.4631407, -0.9845957, 1, 1, 1, 1, 1,
-1.394728, -1.751955, -1.951308, 1, 1, 1, 1, 1,
-1.390522, 0.3890213, -0.1891263, 1, 1, 1, 1, 1,
-1.386094, -1.362235, -0.6962482, 1, 1, 1, 1, 1,
-1.382542, -0.9381281, -0.8991197, 1, 1, 1, 1, 1,
-1.37678, 1.226212, -0.1576715, 1, 1, 1, 1, 1,
-1.352587, 0.8009257, -1.85858, 1, 1, 1, 1, 1,
-1.348602, 0.03279354, 0.1516238, 1, 1, 1, 1, 1,
-1.32667, 0.545131, -1.360601, 1, 1, 1, 1, 1,
-1.312788, 1.240561, -1.466257, 1, 1, 1, 1, 1,
-1.309988, -0.6054965, -2.737062, 1, 1, 1, 1, 1,
-1.274449, 0.3910286, 0.960931, 1, 1, 1, 1, 1,
-1.269672, 1.35941, -2.003787, 1, 1, 1, 1, 1,
-1.253304, -0.08538537, -1.879067, 1, 1, 1, 1, 1,
-1.253282, 0.9011233, 0.04784285, 1, 1, 1, 1, 1,
-1.25207, -0.155563, -1.681173, 0, 0, 1, 1, 1,
-1.241125, 1.39852, -1.287669, 1, 0, 0, 1, 1,
-1.235749, 1.120067, -0.0623815, 1, 0, 0, 1, 1,
-1.235016, -0.7977777, -1.254278, 1, 0, 0, 1, 1,
-1.234654, 1.319422, -2.425048, 1, 0, 0, 1, 1,
-1.234571, -1.347092, -1.500626, 1, 0, 0, 1, 1,
-1.230108, -0.4183638, -2.9673, 0, 0, 0, 1, 1,
-1.22546, -0.3011525, -2.711601, 0, 0, 0, 1, 1,
-1.222087, 0.6072546, -1.83872, 0, 0, 0, 1, 1,
-1.221846, 0.005336781, -1.634863, 0, 0, 0, 1, 1,
-1.213359, -0.6623203, -3.97064, 0, 0, 0, 1, 1,
-1.206791, 1.763598, -0.6936646, 0, 0, 0, 1, 1,
-1.19257, 0.5627286, -1.648818, 0, 0, 0, 1, 1,
-1.189386, 0.1503233, -0.453113, 1, 1, 1, 1, 1,
-1.187653, -0.5084802, -2.585315, 1, 1, 1, 1, 1,
-1.185117, -0.5723295, -0.1705109, 1, 1, 1, 1, 1,
-1.182375, 0.7491267, 0.6838383, 1, 1, 1, 1, 1,
-1.178179, -1.386433, -2.545558, 1, 1, 1, 1, 1,
-1.173017, 0.1038099, 0.3325665, 1, 1, 1, 1, 1,
-1.162914, 0.5641444, -1.351411, 1, 1, 1, 1, 1,
-1.161991, 0.4531702, -2.515728, 1, 1, 1, 1, 1,
-1.161678, 0.7139303, -1.715862, 1, 1, 1, 1, 1,
-1.159086, 0.2158699, -1.326327, 1, 1, 1, 1, 1,
-1.157078, -0.4281599, -1.601846, 1, 1, 1, 1, 1,
-1.151502, 0.3188191, -1.114329, 1, 1, 1, 1, 1,
-1.150586, 0.6754445, -1.806038, 1, 1, 1, 1, 1,
-1.150003, -0.2597755, 0.2435899, 1, 1, 1, 1, 1,
-1.147954, 0.2748049, -2.2263, 1, 1, 1, 1, 1,
-1.145058, 0.7514423, -0.7762306, 0, 0, 1, 1, 1,
-1.142461, 0.2515914, -1.651666, 1, 0, 0, 1, 1,
-1.141927, -1.200019, 0.1909714, 1, 0, 0, 1, 1,
-1.141039, 0.1040648, -2.507161, 1, 0, 0, 1, 1,
-1.135042, 0.6035297, -3.013248, 1, 0, 0, 1, 1,
-1.129109, -0.9669315, -3.469367, 1, 0, 0, 1, 1,
-1.125363, -1.710516, -3.327404, 0, 0, 0, 1, 1,
-1.120127, 0.7752629, -0.1164051, 0, 0, 0, 1, 1,
-1.115966, 0.5039365, -0.4497418, 0, 0, 0, 1, 1,
-1.114149, 1.635767, 0.4102949, 0, 0, 0, 1, 1,
-1.113657, 0.739372, 1.649507, 0, 0, 0, 1, 1,
-1.1048, 0.60745, -0.3118973, 0, 0, 0, 1, 1,
-1.101893, 0.9443841, -1.128297, 0, 0, 0, 1, 1,
-1.099324, 1.430737, -2.960792, 1, 1, 1, 1, 1,
-1.098931, -0.1308101, -0.1149135, 1, 1, 1, 1, 1,
-1.098733, -0.9532789, -2.197277, 1, 1, 1, 1, 1,
-1.09841, 0.01178285, -2.658053, 1, 1, 1, 1, 1,
-1.09241, 0.7420011, -0.9385317, 1, 1, 1, 1, 1,
-1.076917, -0.763602, -0.7970445, 1, 1, 1, 1, 1,
-1.074435, -1.957939, -3.879342, 1, 1, 1, 1, 1,
-1.070141, 0.9398076, -1.818975, 1, 1, 1, 1, 1,
-1.06907, -0.0836869, -0.438703, 1, 1, 1, 1, 1,
-1.066537, 1.476264, -1.031068, 1, 1, 1, 1, 1,
-1.055715, 0.6512819, -0.1401136, 1, 1, 1, 1, 1,
-1.049368, -1.801465, -1.294943, 1, 1, 1, 1, 1,
-1.049064, -0.4747201, -2.3399, 1, 1, 1, 1, 1,
-1.040905, 0.2177065, -0.9766673, 1, 1, 1, 1, 1,
-1.037338, -0.3957421, -1.472923, 1, 1, 1, 1, 1,
-1.032302, 1.331442, -0.6551874, 0, 0, 1, 1, 1,
-1.031386, 0.6384112, -0.9852068, 1, 0, 0, 1, 1,
-1.025745, 1.286923, 0.9048594, 1, 0, 0, 1, 1,
-1.023987, 1.836217, 0.5603848, 1, 0, 0, 1, 1,
-1.00595, -1.79938, -1.387907, 1, 0, 0, 1, 1,
-1.005572, 0.09786903, -0.3044859, 1, 0, 0, 1, 1,
-0.9859912, 0.5379069, -0.7843398, 0, 0, 0, 1, 1,
-0.9851049, 0.05730109, -2.015537, 0, 0, 0, 1, 1,
-0.9836351, 0.06179227, -2.149405, 0, 0, 0, 1, 1,
-0.9818662, 2.352247, -2.288233, 0, 0, 0, 1, 1,
-0.967234, 0.3140722, -1.023611, 0, 0, 0, 1, 1,
-0.9663365, -0.6002247, -2.900127, 0, 0, 0, 1, 1,
-0.9661234, -0.2674474, -2.882832, 0, 0, 0, 1, 1,
-0.9650537, -0.1366979, -0.9291381, 1, 1, 1, 1, 1,
-0.9608486, 1.883518, -1.671798, 1, 1, 1, 1, 1,
-0.9577349, 2.275439, -1.699952, 1, 1, 1, 1, 1,
-0.9524048, -0.002849068, -1.589453, 1, 1, 1, 1, 1,
-0.9411756, -1.64766, -2.846769, 1, 1, 1, 1, 1,
-0.9320802, 1.192047, -0.3653385, 1, 1, 1, 1, 1,
-0.9197199, -0.39383, 0.2765102, 1, 1, 1, 1, 1,
-0.9135214, 1.416523, -0.3123195, 1, 1, 1, 1, 1,
-0.9104413, 1.43413, 0.2062322, 1, 1, 1, 1, 1,
-0.9085053, -0.3715992, -0.7173417, 1, 1, 1, 1, 1,
-0.9061244, 0.250573, -2.72296, 1, 1, 1, 1, 1,
-0.905668, -0.4953861, -0.6418995, 1, 1, 1, 1, 1,
-0.8954065, 0.2654066, -3.176425, 1, 1, 1, 1, 1,
-0.8913505, 0.9030773, 0.4241609, 1, 1, 1, 1, 1,
-0.8881364, -0.08270548, -1.891149, 1, 1, 1, 1, 1,
-0.8790938, -0.2869912, -3.588673, 0, 0, 1, 1, 1,
-0.8790025, -0.8896754, -1.391316, 1, 0, 0, 1, 1,
-0.8760551, -0.7805863, -2.952395, 1, 0, 0, 1, 1,
-0.8749079, 0.2163034, -1.292489, 1, 0, 0, 1, 1,
-0.8712148, -1.097652, -2.332289, 1, 0, 0, 1, 1,
-0.8710322, 0.6273093, 0.1574033, 1, 0, 0, 1, 1,
-0.8708914, 0.2931676, -1.435316, 0, 0, 0, 1, 1,
-0.8652925, 0.4587949, -0.5998765, 0, 0, 0, 1, 1,
-0.8477294, 0.1358373, -1.737688, 0, 0, 0, 1, 1,
-0.8470204, 0.6753539, -0.4551714, 0, 0, 0, 1, 1,
-0.8448752, 0.391001, -1.558245, 0, 0, 0, 1, 1,
-0.8435515, -0.6397616, -2.245355, 0, 0, 0, 1, 1,
-0.8420018, -1.225024, -3.39704, 0, 0, 0, 1, 1,
-0.8344536, -1.418041, -3.235307, 1, 1, 1, 1, 1,
-0.8224089, 0.01501204, -1.683362, 1, 1, 1, 1, 1,
-0.8220096, 1.045353, 0.8460267, 1, 1, 1, 1, 1,
-0.8154102, 0.3035077, -3.024009, 1, 1, 1, 1, 1,
-0.8153576, 0.9097692, -1.335427, 1, 1, 1, 1, 1,
-0.8136799, -1.058184, -2.492612, 1, 1, 1, 1, 1,
-0.8124107, 0.6479053, 2.07441, 1, 1, 1, 1, 1,
-0.8059383, -0.2973842, -2.6928, 1, 1, 1, 1, 1,
-0.8058859, -0.6548629, -3.016446, 1, 1, 1, 1, 1,
-0.8036199, 0.5060113, -2.420067, 1, 1, 1, 1, 1,
-0.7982445, -0.5133735, -2.544569, 1, 1, 1, 1, 1,
-0.7937384, -1.3301, -2.922799, 1, 1, 1, 1, 1,
-0.7920539, -1.441329, -3.32225, 1, 1, 1, 1, 1,
-0.7913185, 0.7141047, 0.05742348, 1, 1, 1, 1, 1,
-0.7887326, -1.187996, -2.835698, 1, 1, 1, 1, 1,
-0.7820863, 0.3678843, 0.4306223, 0, 0, 1, 1, 1,
-0.781557, -0.1336724, -2.231362, 1, 0, 0, 1, 1,
-0.7795074, 0.2091315, -3.08985, 1, 0, 0, 1, 1,
-0.7790194, -0.4950771, -2.864711, 1, 0, 0, 1, 1,
-0.7765939, -0.6793705, -2.753828, 1, 0, 0, 1, 1,
-0.7675893, 0.8121322, -0.0001168748, 1, 0, 0, 1, 1,
-0.7669346, -0.7853397, -3.502579, 0, 0, 0, 1, 1,
-0.7576784, 0.110426, -3.292591, 0, 0, 0, 1, 1,
-0.7501312, 0.2480872, -1.021478, 0, 0, 0, 1, 1,
-0.7484082, 0.383975, -2.168221, 0, 0, 0, 1, 1,
-0.7464124, 0.4963405, -1.917331, 0, 0, 0, 1, 1,
-0.7450074, 2.611933, -0.9805044, 0, 0, 0, 1, 1,
-0.7422431, 0.05197724, 0.2501276, 0, 0, 0, 1, 1,
-0.7416612, 1.194562, -1.090831, 1, 1, 1, 1, 1,
-0.7383282, 0.3489128, -1.408027, 1, 1, 1, 1, 1,
-0.7366923, -1.302731, -3.117323, 1, 1, 1, 1, 1,
-0.7229573, -0.1803907, -1.087817, 1, 1, 1, 1, 1,
-0.7227519, 0.8148025, -0.7399049, 1, 1, 1, 1, 1,
-0.7043111, -0.8565276, -1.310138, 1, 1, 1, 1, 1,
-0.7042614, 0.4306673, -1.678086, 1, 1, 1, 1, 1,
-0.7026296, -0.1751433, -1.008381, 1, 1, 1, 1, 1,
-0.6997704, 0.5162483, 0.4010628, 1, 1, 1, 1, 1,
-0.6955, 0.8168782, 0.6599227, 1, 1, 1, 1, 1,
-0.688063, -1.184683, -1.955395, 1, 1, 1, 1, 1,
-0.6877266, 0.4214527, 0.4474857, 1, 1, 1, 1, 1,
-0.6850917, -0.4186645, -3.824608, 1, 1, 1, 1, 1,
-0.6850487, 1.364175, -1.374708, 1, 1, 1, 1, 1,
-0.6790881, 0.01504504, -4.406574, 1, 1, 1, 1, 1,
-0.6780499, 0.611787, -1.40534, 0, 0, 1, 1, 1,
-0.6756467, 0.9042686, -0.8561522, 1, 0, 0, 1, 1,
-0.6706978, 0.7988234, -1.258737, 1, 0, 0, 1, 1,
-0.6688729, 0.7419533, -0.04402436, 1, 0, 0, 1, 1,
-0.6684935, -0.2968722, -0.9926912, 1, 0, 0, 1, 1,
-0.6683915, 0.07691839, -0.7744804, 1, 0, 0, 1, 1,
-0.6662329, -0.3172061, -1.408045, 0, 0, 0, 1, 1,
-0.6640505, -0.5464755, -2.193995, 0, 0, 0, 1, 1,
-0.6630978, -0.3255871, -1.837837, 0, 0, 0, 1, 1,
-0.6582914, -1.501443, -3.045274, 0, 0, 0, 1, 1,
-0.6579854, -0.5279707, -1.162607, 0, 0, 0, 1, 1,
-0.6563504, 0.9873764, -0.8974105, 0, 0, 0, 1, 1,
-0.6561377, 0.9742768, -1.15529, 0, 0, 0, 1, 1,
-0.6516944, -0.4016256, -1.524894, 1, 1, 1, 1, 1,
-0.6501826, -0.2831546, -1.029596, 1, 1, 1, 1, 1,
-0.642467, 0.06392738, -2.803545, 1, 1, 1, 1, 1,
-0.6422725, 0.07539578, -1.243282, 1, 1, 1, 1, 1,
-0.6414229, -0.5868404, -1.13719, 1, 1, 1, 1, 1,
-0.6413065, -0.3826624, -2.775951, 1, 1, 1, 1, 1,
-0.6365089, 0.2225768, 0.2541031, 1, 1, 1, 1, 1,
-0.6329487, 0.4332651, -0.4404476, 1, 1, 1, 1, 1,
-0.6302188, 1.052355, -0.004591562, 1, 1, 1, 1, 1,
-0.6301813, 0.3090012, -0.5237624, 1, 1, 1, 1, 1,
-0.6298746, 1.581468, -0.7826124, 1, 1, 1, 1, 1,
-0.6248523, 0.5336461, -0.9216961, 1, 1, 1, 1, 1,
-0.6237944, -0.936125, -1.301147, 1, 1, 1, 1, 1,
-0.6234079, 2.003293, -0.5085119, 1, 1, 1, 1, 1,
-0.6216491, 0.8129905, -0.4150554, 1, 1, 1, 1, 1,
-0.6175514, 1.378324, -0.5210515, 0, 0, 1, 1, 1,
-0.614583, -0.4909084, -2.935791, 1, 0, 0, 1, 1,
-0.6051865, 0.1195382, -0.8621174, 1, 0, 0, 1, 1,
-0.6050861, -1.287981, -1.865118, 1, 0, 0, 1, 1,
-0.6003168, -0.6928643, -3.105456, 1, 0, 0, 1, 1,
-0.5989199, -0.775969, -1.380826, 1, 0, 0, 1, 1,
-0.5973131, -0.6213029, -2.684625, 0, 0, 0, 1, 1,
-0.5894535, -0.903668, -3.356418, 0, 0, 0, 1, 1,
-0.5893838, 0.3797024, -3.174941, 0, 0, 0, 1, 1,
-0.5878854, 0.5768182, -1.595012, 0, 0, 0, 1, 1,
-0.5871626, 0.9551956, 0.6447716, 0, 0, 0, 1, 1,
-0.5859259, -0.132432, -2.083461, 0, 0, 0, 1, 1,
-0.5827041, -1.554571, -3.033737, 0, 0, 0, 1, 1,
-0.5816614, 0.7565135, -1.351309, 1, 1, 1, 1, 1,
-0.5812327, -0.7929359, -2.255915, 1, 1, 1, 1, 1,
-0.5808715, -0.61994, -3.143453, 1, 1, 1, 1, 1,
-0.5790309, -0.9482787, -1.984821, 1, 1, 1, 1, 1,
-0.5785748, -0.8563104, -2.529074, 1, 1, 1, 1, 1,
-0.5765646, -1.919813, -3.624003, 1, 1, 1, 1, 1,
-0.5744604, 0.1348403, -1.394264, 1, 1, 1, 1, 1,
-0.5721719, -2.050111, -0.761422, 1, 1, 1, 1, 1,
-0.5632144, 0.9573377, -1.726827, 1, 1, 1, 1, 1,
-0.5598829, -0.563761, -2.491835, 1, 1, 1, 1, 1,
-0.5484803, -0.04031178, -1.098309, 1, 1, 1, 1, 1,
-0.5430823, 0.4529351, 0.006629097, 1, 1, 1, 1, 1,
-0.5377164, 1.302571, 0.5645087, 1, 1, 1, 1, 1,
-0.5346872, 0.4965292, -1.131983, 1, 1, 1, 1, 1,
-0.533291, 0.02790792, 0.128984, 1, 1, 1, 1, 1,
-0.5329333, 0.1757441, -1.171908, 0, 0, 1, 1, 1,
-0.5328993, 0.1277412, -0.5531336, 1, 0, 0, 1, 1,
-0.5313721, 0.1614098, -2.589275, 1, 0, 0, 1, 1,
-0.5121165, -0.2578326, -2.780508, 1, 0, 0, 1, 1,
-0.5107384, -1.360648, -3.900772, 1, 0, 0, 1, 1,
-0.5099397, -0.6931868, -2.119149, 1, 0, 0, 1, 1,
-0.5091237, -0.1032042, -1.095897, 0, 0, 0, 1, 1,
-0.507522, 0.7949826, 0.1574281, 0, 0, 0, 1, 1,
-0.5069857, -0.4040342, -2.182617, 0, 0, 0, 1, 1,
-0.503962, 0.5723469, -0.7771829, 0, 0, 0, 1, 1,
-0.5014936, 0.05777904, -2.104506, 0, 0, 0, 1, 1,
-0.5011066, -0.2126294, -3.504325, 0, 0, 0, 1, 1,
-0.494826, -0.9834437, -2.289915, 0, 0, 0, 1, 1,
-0.4908015, -1.712878, -3.605378, 1, 1, 1, 1, 1,
-0.4903336, -0.1476584, -2.217772, 1, 1, 1, 1, 1,
-0.4892377, 0.2797202, 0.1261304, 1, 1, 1, 1, 1,
-0.4866262, -0.2284282, -2.996959, 1, 1, 1, 1, 1,
-0.4805949, 0.3255405, -2.788792, 1, 1, 1, 1, 1,
-0.4773547, -0.09789446, -2.513026, 1, 1, 1, 1, 1,
-0.4735189, -0.4497523, -2.107871, 1, 1, 1, 1, 1,
-0.4701214, -1.441566, -3.269477, 1, 1, 1, 1, 1,
-0.4687228, -0.5981132, -2.505753, 1, 1, 1, 1, 1,
-0.4687129, 1.280333, 0.1814383, 1, 1, 1, 1, 1,
-0.4684443, -0.6776881, -2.67579, 1, 1, 1, 1, 1,
-0.4637324, -0.5426744, -1.966161, 1, 1, 1, 1, 1,
-0.4635594, 0.4121583, -1.997534, 1, 1, 1, 1, 1,
-0.463137, -1.774539, -4.729772, 1, 1, 1, 1, 1,
-0.4610655, 0.1747839, -1.885803, 1, 1, 1, 1, 1,
-0.4593158, 0.05529501, -1.25251, 0, 0, 1, 1, 1,
-0.4489206, 0.3258947, -2.344037, 1, 0, 0, 1, 1,
-0.4474315, -0.007901123, -2.125011, 1, 0, 0, 1, 1,
-0.4470865, 0.4143152, 0.1059007, 1, 0, 0, 1, 1,
-0.4461762, 0.000599349, -3.28295, 1, 0, 0, 1, 1,
-0.4451858, -0.2560112, -1.751301, 1, 0, 0, 1, 1,
-0.4447762, 0.02077518, -1.913435, 0, 0, 0, 1, 1,
-0.4441244, 0.6854269, -0.2796556, 0, 0, 0, 1, 1,
-0.4420863, 0.6410221, -1.120855, 0, 0, 0, 1, 1,
-0.4406445, -0.5781921, -2.867888, 0, 0, 0, 1, 1,
-0.4399096, -1.956072, -2.338775, 0, 0, 0, 1, 1,
-0.4373082, 0.3317673, -0.8163327, 0, 0, 0, 1, 1,
-0.4366374, 2.0853, 1.183924, 0, 0, 0, 1, 1,
-0.4352979, 1.325286, -0.6287898, 1, 1, 1, 1, 1,
-0.4320903, 0.2073517, -1.591674, 1, 1, 1, 1, 1,
-0.4265877, -1.030548, -2.837975, 1, 1, 1, 1, 1,
-0.4229668, 1.420428, -0.8496358, 1, 1, 1, 1, 1,
-0.4196897, 1.318104, 0.2009715, 1, 1, 1, 1, 1,
-0.4194162, -0.7975346, -2.601, 1, 1, 1, 1, 1,
-0.4184985, 0.7952777, -2.147034, 1, 1, 1, 1, 1,
-0.4183054, 1.0946, -1.800551, 1, 1, 1, 1, 1,
-0.4157504, -1.278987, -3.982092, 1, 1, 1, 1, 1,
-0.4099223, -0.6088789, -2.111943, 1, 1, 1, 1, 1,
-0.4089089, 0.3658981, 0.1113131, 1, 1, 1, 1, 1,
-0.408285, -1.245833, -2.428037, 1, 1, 1, 1, 1,
-0.4075369, 0.4452711, -0.9408525, 1, 1, 1, 1, 1,
-0.4071781, 0.5297541, -0.4921367, 1, 1, 1, 1, 1,
-0.3942938, 0.110269, -2.191724, 1, 1, 1, 1, 1,
-0.3931406, -1.26751, -3.277586, 0, 0, 1, 1, 1,
-0.3920226, 0.01277407, -0.4740252, 1, 0, 0, 1, 1,
-0.3880763, -0.5975689, -3.434937, 1, 0, 0, 1, 1,
-0.3849805, 0.3250637, -0.654264, 1, 0, 0, 1, 1,
-0.3788193, 0.4500213, 0.4187333, 1, 0, 0, 1, 1,
-0.3734277, 0.4553065, -0.01120852, 1, 0, 0, 1, 1,
-0.3693558, 1.572396, 0.1270224, 0, 0, 0, 1, 1,
-0.3675716, 0.3274609, -0.5579739, 0, 0, 0, 1, 1,
-0.3661873, -0.473081, -2.997001, 0, 0, 0, 1, 1,
-0.3628605, 1.748995, -0.5344064, 0, 0, 0, 1, 1,
-0.3620095, -2.064744, -2.213677, 0, 0, 0, 1, 1,
-0.3593286, -0.09502625, -0.4962705, 0, 0, 0, 1, 1,
-0.3565298, 0.2354377, -1.80485, 0, 0, 0, 1, 1,
-0.3542518, -0.625398, -3.27571, 1, 1, 1, 1, 1,
-0.3530316, -0.7274197, -3.189134, 1, 1, 1, 1, 1,
-0.3481104, 0.7338631, 0.1977921, 1, 1, 1, 1, 1,
-0.3480033, -0.8557973, -2.284279, 1, 1, 1, 1, 1,
-0.3455537, 0.3608432, -1.367837, 1, 1, 1, 1, 1,
-0.3433847, -0.4423039, -3.233607, 1, 1, 1, 1, 1,
-0.3424959, 1.804639, 0.20874, 1, 1, 1, 1, 1,
-0.3330199, -1.42809, -5.26103, 1, 1, 1, 1, 1,
-0.3329692, -0.4657295, -1.712501, 1, 1, 1, 1, 1,
-0.3298293, -1.725255, -3.323616, 1, 1, 1, 1, 1,
-0.327501, 0.4792974, 0.05158972, 1, 1, 1, 1, 1,
-0.3238769, 0.5958933, 0.03725472, 1, 1, 1, 1, 1,
-0.3193937, 0.01059141, -1.023118, 1, 1, 1, 1, 1,
-0.3135463, -2.424224, -2.656228, 1, 1, 1, 1, 1,
-0.3131575, 0.1060602, -1.304072, 1, 1, 1, 1, 1,
-0.3131419, 0.4451832, -0.4144389, 0, 0, 1, 1, 1,
-0.3120252, 1.520136, -0.8913725, 1, 0, 0, 1, 1,
-0.3116784, 0.3121889, -1.965543, 1, 0, 0, 1, 1,
-0.3101842, -1.068097, -1.674985, 1, 0, 0, 1, 1,
-0.3094547, -0.4694214, -2.874372, 1, 0, 0, 1, 1,
-0.2964057, 0.3968289, -1.381987, 1, 0, 0, 1, 1,
-0.2868613, -1.327187, -3.788095, 0, 0, 0, 1, 1,
-0.2848327, 0.6618716, 0.6784658, 0, 0, 0, 1, 1,
-0.2831877, -1.467045, -2.872172, 0, 0, 0, 1, 1,
-0.2798645, 0.7025137, -0.4361306, 0, 0, 0, 1, 1,
-0.2762103, 1.597232, 1.715802, 0, 0, 0, 1, 1,
-0.2739017, 0.2271057, -0.3054797, 0, 0, 0, 1, 1,
-0.2718457, 0.7261456, 0.3730196, 0, 0, 0, 1, 1,
-0.2713556, 0.2304966, 0.9142916, 1, 1, 1, 1, 1,
-0.2683322, -0.1309329, -2.119923, 1, 1, 1, 1, 1,
-0.2656978, 1.167276, -1.142862, 1, 1, 1, 1, 1,
-0.2650543, 1.766463, -0.04045328, 1, 1, 1, 1, 1,
-0.2587893, -1.498548, -4.653567, 1, 1, 1, 1, 1,
-0.2586448, -1.886316, -2.892469, 1, 1, 1, 1, 1,
-0.2577741, 1.140652, -0.1625608, 1, 1, 1, 1, 1,
-0.2571765, 1.070829, -1.565193, 1, 1, 1, 1, 1,
-0.2441416, 1.863321, -1.269286, 1, 1, 1, 1, 1,
-0.2429106, -0.1825763, -2.354754, 1, 1, 1, 1, 1,
-0.2384717, -0.07462349, -2.526257, 1, 1, 1, 1, 1,
-0.2373883, -2.416379, -3.366571, 1, 1, 1, 1, 1,
-0.2342015, -0.506802, -2.511921, 1, 1, 1, 1, 1,
-0.2309516, 1.345799, -0.1065517, 1, 1, 1, 1, 1,
-0.2298253, 0.4927815, 0.4613896, 1, 1, 1, 1, 1,
-0.2296209, 0.1353837, -1.696581, 0, 0, 1, 1, 1,
-0.2286983, 0.3236873, -1.243633, 1, 0, 0, 1, 1,
-0.2241349, -1.339337, -2.911901, 1, 0, 0, 1, 1,
-0.2236785, -1.565706, -3.394923, 1, 0, 0, 1, 1,
-0.2207493, 0.4416625, -2.884828, 1, 0, 0, 1, 1,
-0.2200175, -0.2460515, -2.465362, 1, 0, 0, 1, 1,
-0.2196931, -0.05071141, -0.6187965, 0, 0, 0, 1, 1,
-0.2195288, 1.789926, -0.01996754, 0, 0, 0, 1, 1,
-0.2143359, 0.4776133, 0.771716, 0, 0, 0, 1, 1,
-0.2129649, 1.71651, 0.9163737, 0, 0, 0, 1, 1,
-0.207504, 0.1129525, -3.137732, 0, 0, 0, 1, 1,
-0.206158, 1.549383, 1.25835, 0, 0, 0, 1, 1,
-0.2038075, 1.005953, -0.2713689, 0, 0, 0, 1, 1,
-0.2011359, -0.5672094, -2.71306, 1, 1, 1, 1, 1,
-0.2002782, 1.165531, 2.243743, 1, 1, 1, 1, 1,
-0.1966821, -1.370389, -3.333731, 1, 1, 1, 1, 1,
-0.1945245, 0.4925021, -0.6219522, 1, 1, 1, 1, 1,
-0.1916143, -0.7928844, -2.407133, 1, 1, 1, 1, 1,
-0.1883874, -1.406103, -2.630243, 1, 1, 1, 1, 1,
-0.1882914, -0.136161, -2.580587, 1, 1, 1, 1, 1,
-0.1875502, -0.619522, -1.9973, 1, 1, 1, 1, 1,
-0.18717, -0.3160413, -2.581239, 1, 1, 1, 1, 1,
-0.1845221, 0.1173829, -1.075804, 1, 1, 1, 1, 1,
-0.1819333, -1.046342, -3.688723, 1, 1, 1, 1, 1,
-0.1815722, -0.06309514, -1.631442, 1, 1, 1, 1, 1,
-0.1797261, -0.6123647, -0.5710441, 1, 1, 1, 1, 1,
-0.1783027, -0.1866879, -2.552943, 1, 1, 1, 1, 1,
-0.1767219, -1.675097, -1.8962, 1, 1, 1, 1, 1,
-0.1766713, -0.4612845, -2.212367, 0, 0, 1, 1, 1,
-0.1748927, -0.671429, -1.363502, 1, 0, 0, 1, 1,
-0.1707611, -0.7501183, -4.371655, 1, 0, 0, 1, 1,
-0.1687538, -0.02282759, -2.886343, 1, 0, 0, 1, 1,
-0.1686419, 0.2845689, -0.06726462, 1, 0, 0, 1, 1,
-0.1673114, 0.5746318, -1.874888, 1, 0, 0, 1, 1,
-0.1662121, -0.1338296, -3.263792, 0, 0, 0, 1, 1,
-0.1582757, -0.6660984, -3.235418, 0, 0, 0, 1, 1,
-0.157904, -0.3301384, -2.588189, 0, 0, 0, 1, 1,
-0.1568999, 0.005310615, -1.87885, 0, 0, 0, 1, 1,
-0.1566767, 0.8684125, -0.1359392, 0, 0, 0, 1, 1,
-0.1557747, 0.9998227, 0.2155338, 0, 0, 0, 1, 1,
-0.1542298, 0.3303686, -1.91072, 0, 0, 0, 1, 1,
-0.15303, -1.524749, -3.981645, 1, 1, 1, 1, 1,
-0.1506552, 0.6713568, 0.5096203, 1, 1, 1, 1, 1,
-0.144162, -0.865407, -2.307005, 1, 1, 1, 1, 1,
-0.1418863, -1.777989, -3.475754, 1, 1, 1, 1, 1,
-0.1377816, 0.5461745, -0.8863201, 1, 1, 1, 1, 1,
-0.13144, 0.6931242, 0.7586151, 1, 1, 1, 1, 1,
-0.1314061, 1.146263, 0.4014492, 1, 1, 1, 1, 1,
-0.1309526, 0.05194337, 0.2602538, 1, 1, 1, 1, 1,
-0.1307509, 0.5923792, 1.422763, 1, 1, 1, 1, 1,
-0.1294952, -0.8231668, -3.085722, 1, 1, 1, 1, 1,
-0.1264286, -1.485773, -2.238076, 1, 1, 1, 1, 1,
-0.1241888, -1.657593, -3.238745, 1, 1, 1, 1, 1,
-0.1240967, 0.4218346, -0.2099797, 1, 1, 1, 1, 1,
-0.1222643, -1.966541, -4.655348, 1, 1, 1, 1, 1,
-0.1214188, -0.7356595, -3.681138, 1, 1, 1, 1, 1,
-0.1187926, -0.5877422, -3.515845, 0, 0, 1, 1, 1,
-0.1174596, 0.3071792, -1.838327, 1, 0, 0, 1, 1,
-0.1146367, -0.3395207, -1.678464, 1, 0, 0, 1, 1,
-0.1099116, -2.038921, -3.222059, 1, 0, 0, 1, 1,
-0.1081596, 1.486737, -1.754959, 1, 0, 0, 1, 1,
-0.1079694, -0.8899587, -4.386595, 1, 0, 0, 1, 1,
-0.1073525, -0.3944139, -3.228493, 0, 0, 0, 1, 1,
-0.1042257, -0.4708477, -4.096014, 0, 0, 0, 1, 1,
-0.1033846, -0.824888, -2.869522, 0, 0, 0, 1, 1,
-0.1013255, 1.003208, -2.849312, 0, 0, 0, 1, 1,
-0.100908, 0.6538581, 0.7556713, 0, 0, 0, 1, 1,
-0.1006051, -0.6064056, -1.83884, 0, 0, 0, 1, 1,
-0.09461252, -1.08109, -3.63229, 0, 0, 0, 1, 1,
-0.08216701, 0.1630467, -2.063885, 1, 1, 1, 1, 1,
-0.08162566, 0.7759371, -0.2084545, 1, 1, 1, 1, 1,
-0.07836282, -1.381665, -4.271075, 1, 1, 1, 1, 1,
-0.07774761, 1.420386, -0.2949596, 1, 1, 1, 1, 1,
-0.07630292, -1.7215, -3.188493, 1, 1, 1, 1, 1,
-0.07379781, 1.288499, -0.9108065, 1, 1, 1, 1, 1,
-0.06461861, -0.7019926, -1.926359, 1, 1, 1, 1, 1,
-0.05436505, -1.321856, -3.255146, 1, 1, 1, 1, 1,
-0.05342356, -0.394325, -3.57393, 1, 1, 1, 1, 1,
-0.05309867, 1.33094, -0.4399198, 1, 1, 1, 1, 1,
-0.05268762, 1.684954, -0.7342627, 1, 1, 1, 1, 1,
-0.05038197, -0.1155612, -2.192277, 1, 1, 1, 1, 1,
-0.05016137, 1.195288, -0.2445641, 1, 1, 1, 1, 1,
-0.04804583, 0.6804576, -1.633023, 1, 1, 1, 1, 1,
-0.04668857, 1.878649, -0.5666455, 1, 1, 1, 1, 1,
-0.04637952, -1.38807, -1.802919, 0, 0, 1, 1, 1,
-0.04605607, 0.2096626, 0.5073268, 1, 0, 0, 1, 1,
-0.04457365, 1.386427, -0.5614002, 1, 0, 0, 1, 1,
-0.04050076, -0.01799265, -0.9582473, 1, 0, 0, 1, 1,
-0.03500415, -0.04183106, -1.744832, 1, 0, 0, 1, 1,
-0.03364214, 0.2369362, 1.133295, 1, 0, 0, 1, 1,
-0.0319645, 0.3415643, -0.1415872, 0, 0, 0, 1, 1,
-0.03164623, -0.723167, -3.058635, 0, 0, 0, 1, 1,
-0.02837785, -1.276683, -2.842082, 0, 0, 0, 1, 1,
-0.02814993, -0.4300527, -2.045365, 0, 0, 0, 1, 1,
-0.02507241, 0.9090024, 0.1692898, 0, 0, 0, 1, 1,
-0.02485572, 1.479849, -0.2681783, 0, 0, 0, 1, 1,
-0.02350172, 0.5589139, 1.413022, 0, 0, 0, 1, 1,
-0.02316109, 0.6959869, -0.2226325, 1, 1, 1, 1, 1,
-0.02242779, 1.305524, 2.317572, 1, 1, 1, 1, 1,
-0.01778863, -0.8315604, -4.117824, 1, 1, 1, 1, 1,
-0.01773364, 0.589326, -1.725285, 1, 1, 1, 1, 1,
-0.01758065, -0.08067357, -2.740417, 1, 1, 1, 1, 1,
-0.01740282, -0.2136692, -4.092754, 1, 1, 1, 1, 1,
-0.01294703, 0.7968164, 1.029684, 1, 1, 1, 1, 1,
-0.01242125, -1.002372, -3.902221, 1, 1, 1, 1, 1,
-0.0122533, 0.5285198, -0.4314107, 1, 1, 1, 1, 1,
-0.01088765, -1.390938, -2.459235, 1, 1, 1, 1, 1,
-0.008910212, -0.3570086, -1.816813, 1, 1, 1, 1, 1,
-0.008430183, 0.9953743, 0.5810926, 1, 1, 1, 1, 1,
-0.008261982, -1.578554, -3.446362, 1, 1, 1, 1, 1,
-0.005351183, -2.46622, -2.137783, 1, 1, 1, 1, 1,
-0.003197383, 0.1800382, -0.8060142, 1, 1, 1, 1, 1,
-0.002081927, 0.6565192, 0.6486847, 0, 0, 1, 1, 1,
-0.001556075, 0.5095098, -0.5275248, 1, 0, 0, 1, 1,
-0.0001250553, -1.143759, -3.64476, 1, 0, 0, 1, 1,
0.0005698949, 1.346434, -0.4214368, 1, 0, 0, 1, 1,
0.002907489, -0.2443508, 2.22964, 1, 0, 0, 1, 1,
0.005809258, -0.04422598, 3.400104, 1, 0, 0, 1, 1,
0.008448441, 1.039576, 0.3546655, 0, 0, 0, 1, 1,
0.01119812, 0.4623504, -0.04819919, 0, 0, 0, 1, 1,
0.014581, -0.2525024, 3.852494, 0, 0, 0, 1, 1,
0.01663412, 2.88526, 1.354662, 0, 0, 0, 1, 1,
0.01809827, 0.3540739, -1.194608, 0, 0, 0, 1, 1,
0.01833289, 0.0275019, 0.4520496, 0, 0, 0, 1, 1,
0.02046714, 0.7098202, -0.8793227, 0, 0, 0, 1, 1,
0.02478727, 1.439904, 0.1819721, 1, 1, 1, 1, 1,
0.02492289, 1.176206, -0.3620962, 1, 1, 1, 1, 1,
0.02547269, -0.2816552, 3.214269, 1, 1, 1, 1, 1,
0.02682915, 1.229384, 0.5509112, 1, 1, 1, 1, 1,
0.03802281, 0.9826931, 2.528972, 1, 1, 1, 1, 1,
0.03929353, -0.4966711, 2.299283, 1, 1, 1, 1, 1,
0.0410659, 0.3829491, -0.2302292, 1, 1, 1, 1, 1,
0.04405142, 0.9121615, -0.4087613, 1, 1, 1, 1, 1,
0.04473821, 1.102518, -0.2740476, 1, 1, 1, 1, 1,
0.04611884, -1.826265, 3.405759, 1, 1, 1, 1, 1,
0.04757196, 0.705228, 0.02082355, 1, 1, 1, 1, 1,
0.05366554, -0.5550352, 3.647118, 1, 1, 1, 1, 1,
0.05945394, -0.08613003, 2.630724, 1, 1, 1, 1, 1,
0.06096186, 0.05795962, 1.831813, 1, 1, 1, 1, 1,
0.06121901, 1.412908, 0.07416844, 1, 1, 1, 1, 1,
0.06256783, -0.1288128, 3.834069, 0, 0, 1, 1, 1,
0.06328336, 0.1093539, 1.69946, 1, 0, 0, 1, 1,
0.06490905, -2.186303, 3.242393, 1, 0, 0, 1, 1,
0.06606859, 0.7457262, -1.456595, 1, 0, 0, 1, 1,
0.06960616, -1.356046, 1.855712, 1, 0, 0, 1, 1,
0.07238306, -0.8800145, 3.266914, 1, 0, 0, 1, 1,
0.07641475, -0.5453742, 2.812654, 0, 0, 0, 1, 1,
0.07739072, 0.4782641, -0.9910549, 0, 0, 0, 1, 1,
0.07937777, -0.06038953, 2.232977, 0, 0, 0, 1, 1,
0.08500692, 0.2582047, 1.584606, 0, 0, 0, 1, 1,
0.08878699, -1.280305, 5.150357, 0, 0, 0, 1, 1,
0.09297788, -0.4705861, 2.886125, 0, 0, 0, 1, 1,
0.09349183, -0.1863699, 2.613264, 0, 0, 0, 1, 1,
0.09557747, 0.4656014, 0.3807018, 1, 1, 1, 1, 1,
0.09601603, 1.209589, 0.2297028, 1, 1, 1, 1, 1,
0.09673342, -0.05631152, 1.957996, 1, 1, 1, 1, 1,
0.09684932, -1.540926, 3.275391, 1, 1, 1, 1, 1,
0.09743317, 0.4870202, 0.1118964, 1, 1, 1, 1, 1,
0.1056759, -0.1367772, 1.386601, 1, 1, 1, 1, 1,
0.1145071, 0.8110169, -0.8299159, 1, 1, 1, 1, 1,
0.1184278, 0.1325925, 1.221429, 1, 1, 1, 1, 1,
0.1203125, -0.08420247, 1.778802, 1, 1, 1, 1, 1,
0.1228935, 1.880165, -0.08890363, 1, 1, 1, 1, 1,
0.1265783, 0.4918396, -0.5945229, 1, 1, 1, 1, 1,
0.1273684, 1.264874, 0.2388576, 1, 1, 1, 1, 1,
0.1289241, -0.4643902, 1.84004, 1, 1, 1, 1, 1,
0.1339061, -0.2993202, 2.857424, 1, 1, 1, 1, 1,
0.1378478, 2.01267, 0.270222, 1, 1, 1, 1, 1,
0.1415955, 1.685976, 0.5107175, 0, 0, 1, 1, 1,
0.142775, 0.737456, 0.9407339, 1, 0, 0, 1, 1,
0.143703, 0.8768614, -0.434511, 1, 0, 0, 1, 1,
0.1461127, -0.9529489, 3.535044, 1, 0, 0, 1, 1,
0.1480334, 0.7794014, 0.1684204, 1, 0, 0, 1, 1,
0.1488581, -1.170426, 2.228531, 1, 0, 0, 1, 1,
0.149276, 1.257847, -0.5133966, 0, 0, 0, 1, 1,
0.1515492, 0.794982, 0.04085661, 0, 0, 0, 1, 1,
0.1553152, -0.6987985, 1.979105, 0, 0, 0, 1, 1,
0.1564567, 0.3517643, 1.290133, 0, 0, 0, 1, 1,
0.1604857, -1.298591, 2.445741, 0, 0, 0, 1, 1,
0.1627692, 0.2333051, 2.012362, 0, 0, 0, 1, 1,
0.1639239, 0.4180449, 0.1195624, 0, 0, 0, 1, 1,
0.1663661, 0.4281379, -0.7186614, 1, 1, 1, 1, 1,
0.1673377, -0.3334951, 1.951817, 1, 1, 1, 1, 1,
0.1701478, 1.914303, -0.3868355, 1, 1, 1, 1, 1,
0.1730761, -0.06093311, 1.021981, 1, 1, 1, 1, 1,
0.1741339, -1.61752, 2.088964, 1, 1, 1, 1, 1,
0.174804, -0.1102225, 2.230886, 1, 1, 1, 1, 1,
0.175054, 0.6713814, 3.087197, 1, 1, 1, 1, 1,
0.1779098, -0.1284719, 1.00726, 1, 1, 1, 1, 1,
0.1813352, 1.693057, -0.6102699, 1, 1, 1, 1, 1,
0.1819265, -0.2827966, 2.04912, 1, 1, 1, 1, 1,
0.1822443, -1.223095, 2.922109, 1, 1, 1, 1, 1,
0.1848663, -1.775366, 3.214401, 1, 1, 1, 1, 1,
0.1869844, 0.378557, 2.837666, 1, 1, 1, 1, 1,
0.1933474, -0.1523353, 0.3676233, 1, 1, 1, 1, 1,
0.1944731, 1.354477, 1.511167, 1, 1, 1, 1, 1,
0.1951594, 0.5314898, -0.8750293, 0, 0, 1, 1, 1,
0.2022163, -0.5523252, 4.788128, 1, 0, 0, 1, 1,
0.2023004, 0.4111103, 1.108954, 1, 0, 0, 1, 1,
0.2033185, 1.218776, 0.06951978, 1, 0, 0, 1, 1,
0.2037921, -0.9973226, 4.023152, 1, 0, 0, 1, 1,
0.2099196, -0.1207115, 1.624275, 1, 0, 0, 1, 1,
0.2108568, -0.1337264, 1.692086, 0, 0, 0, 1, 1,
0.2132733, -1.335535, 3.61207, 0, 0, 0, 1, 1,
0.214261, 1.091439, 1.215626, 0, 0, 0, 1, 1,
0.21962, -0.3872252, 3.545677, 0, 0, 0, 1, 1,
0.2210983, 0.8730049, 0.02170802, 0, 0, 0, 1, 1,
0.2215424, -1.171484, 2.857401, 0, 0, 0, 1, 1,
0.2229377, 1.060483, -0.876844, 0, 0, 0, 1, 1,
0.2237274, -0.5257806, 2.441811, 1, 1, 1, 1, 1,
0.22553, 0.3587904, 0.1857805, 1, 1, 1, 1, 1,
0.2349611, 0.3424358, -0.2035942, 1, 1, 1, 1, 1,
0.2368816, 0.4769527, 0.02930048, 1, 1, 1, 1, 1,
0.2381604, 1.049764, 0.8397142, 1, 1, 1, 1, 1,
0.2385072, -1.304082, 3.425102, 1, 1, 1, 1, 1,
0.2398536, 1.458642, -0.6078951, 1, 1, 1, 1, 1,
0.2420513, 0.8357696, -0.9723852, 1, 1, 1, 1, 1,
0.2423842, 0.2833448, 1.369593, 1, 1, 1, 1, 1,
0.2483739, -2.295683, 2.50845, 1, 1, 1, 1, 1,
0.2524237, -0.1218555, 2.077916, 1, 1, 1, 1, 1,
0.2554044, -0.7374315, 4.692911, 1, 1, 1, 1, 1,
0.2555152, 0.3057584, 1.354048, 1, 1, 1, 1, 1,
0.2579743, 0.3343517, 0.8533299, 1, 1, 1, 1, 1,
0.2588224, -1.001351, 3.577735, 1, 1, 1, 1, 1,
0.2596928, 0.8260427, -0.4939448, 0, 0, 1, 1, 1,
0.2599996, 0.7131313, 0.8727643, 1, 0, 0, 1, 1,
0.2610791, -2.365591, 4.08639, 1, 0, 0, 1, 1,
0.2650953, -1.099013, 1.551963, 1, 0, 0, 1, 1,
0.2667578, 0.3418553, -0.3170741, 1, 0, 0, 1, 1,
0.2684419, 0.7946404, -0.09182554, 1, 0, 0, 1, 1,
0.2700037, 2.068516, -0.173191, 0, 0, 0, 1, 1,
0.2716737, -0.1951983, 2.671865, 0, 0, 0, 1, 1,
0.2728889, -1.283742, 3.89515, 0, 0, 0, 1, 1,
0.2758803, -1.191792, 4.451544, 0, 0, 0, 1, 1,
0.2846679, 0.8415623, -0.3137475, 0, 0, 0, 1, 1,
0.28655, 0.1040648, 1.46483, 0, 0, 0, 1, 1,
0.287712, 0.2550514, 1.315855, 0, 0, 0, 1, 1,
0.2884793, -0.1262418, 2.987636, 1, 1, 1, 1, 1,
0.2886941, -0.3457786, 3.894718, 1, 1, 1, 1, 1,
0.2923637, 0.7033327, 0.8481356, 1, 1, 1, 1, 1,
0.2951072, -1.672642, 3.157533, 1, 1, 1, 1, 1,
0.2959093, 1.106317, -1.128786, 1, 1, 1, 1, 1,
0.301032, -0.1031749, 1.897027, 1, 1, 1, 1, 1,
0.3017706, 1.306502, 1.353819, 1, 1, 1, 1, 1,
0.3065782, -0.06227649, 3.035457, 1, 1, 1, 1, 1,
0.3079596, -1.922832, 4.37452, 1, 1, 1, 1, 1,
0.3118139, 0.7742057, -0.208094, 1, 1, 1, 1, 1,
0.3136503, -0.06046348, 2.131834, 1, 1, 1, 1, 1,
0.3168724, -0.2094207, 1.199526, 1, 1, 1, 1, 1,
0.3357349, 1.347042, 0.3935263, 1, 1, 1, 1, 1,
0.3357694, 1.672582, -0.7732211, 1, 1, 1, 1, 1,
0.3365656, -0.2948458, 2.253675, 1, 1, 1, 1, 1,
0.3409614, -0.4765847, 2.647902, 0, 0, 1, 1, 1,
0.341474, -0.1047504, 0.0294379, 1, 0, 0, 1, 1,
0.3415113, 0.09560778, 1.370858, 1, 0, 0, 1, 1,
0.3496088, -0.09788679, 1.093821, 1, 0, 0, 1, 1,
0.3566197, 0.8917948, 0.2625519, 1, 0, 0, 1, 1,
0.3571791, -0.8191188, 1.79023, 1, 0, 0, 1, 1,
0.3603679, -0.2650103, 2.506898, 0, 0, 0, 1, 1,
0.373886, 0.2359948, 2.053526, 0, 0, 0, 1, 1,
0.3744367, -0.573529, 2.445797, 0, 0, 0, 1, 1,
0.3762041, 0.72143, 0.441772, 0, 0, 0, 1, 1,
0.3850001, -0.8283628, 2.120471, 0, 0, 0, 1, 1,
0.3870941, -0.8615963, 2.122913, 0, 0, 0, 1, 1,
0.388715, 0.2891576, 0.3341681, 0, 0, 0, 1, 1,
0.3901833, -0.2716882, 2.172134, 1, 1, 1, 1, 1,
0.3910681, -0.03473193, 1.896293, 1, 1, 1, 1, 1,
0.3945794, 1.542485, 0.2866914, 1, 1, 1, 1, 1,
0.3988186, 0.3505819, 2.281802, 1, 1, 1, 1, 1,
0.3996087, 2.245671, -0.1401865, 1, 1, 1, 1, 1,
0.4010946, 1.041771, 1.192389, 1, 1, 1, 1, 1,
0.4012487, -2.199136, 3.34632, 1, 1, 1, 1, 1,
0.4035691, -0.9492676, 1.54921, 1, 1, 1, 1, 1,
0.4081543, -1.052933, 4.027109, 1, 1, 1, 1, 1,
0.410884, -0.5432432, 0.1750239, 1, 1, 1, 1, 1,
0.4121233, 0.3566917, 1.507309, 1, 1, 1, 1, 1,
0.4128599, -1.948925, 2.549734, 1, 1, 1, 1, 1,
0.4131456, 1.531518, -0.3478619, 1, 1, 1, 1, 1,
0.4136633, -0.1948076, 2.063833, 1, 1, 1, 1, 1,
0.4185075, 1.002459, 0.1843286, 1, 1, 1, 1, 1,
0.4214723, 0.5419671, 1.072664, 0, 0, 1, 1, 1,
0.424869, -0.4363699, 3.312952, 1, 0, 0, 1, 1,
0.4269488, 0.07174364, 2.342498, 1, 0, 0, 1, 1,
0.428165, 0.2655865, 0.622537, 1, 0, 0, 1, 1,
0.4317587, 0.4007013, 1.255271, 1, 0, 0, 1, 1,
0.43406, -1.787325, 4.155469, 1, 0, 0, 1, 1,
0.4346686, 0.5543481, 1.459967, 0, 0, 0, 1, 1,
0.4348769, -0.2142846, 1.638931, 0, 0, 0, 1, 1,
0.4356262, 0.4310091, -0.07229055, 0, 0, 0, 1, 1,
0.4379345, 0.4873756, 1.93451, 0, 0, 0, 1, 1,
0.444327, -0.4267565, 1.769174, 0, 0, 0, 1, 1,
0.4446232, -0.1532018, 3.433265, 0, 0, 0, 1, 1,
0.4446515, -1.008042, 1.967325, 0, 0, 0, 1, 1,
0.4459127, 1.1615, 1.540908, 1, 1, 1, 1, 1,
0.4506152, 1.310208, -0.0989636, 1, 1, 1, 1, 1,
0.4537205, 0.448175, 1.755372, 1, 1, 1, 1, 1,
0.4549242, 0.2589054, 1.448692, 1, 1, 1, 1, 1,
0.4555189, 1.217665, 0.6273051, 1, 1, 1, 1, 1,
0.4607444, -0.2700839, 2.778026, 1, 1, 1, 1, 1,
0.4612876, 1.33588, 1.071685, 1, 1, 1, 1, 1,
0.463198, 0.2342415, -0.8295506, 1, 1, 1, 1, 1,
0.4653062, -0.166627, 4.488807, 1, 1, 1, 1, 1,
0.466123, 0.9573258, -0.5426836, 1, 1, 1, 1, 1,
0.4701253, 1.189125, 1.126185, 1, 1, 1, 1, 1,
0.4714078, 1.778531, 1.63128, 1, 1, 1, 1, 1,
0.4724726, 0.4489547, 3.26614, 1, 1, 1, 1, 1,
0.4824855, -0.6098337, 2.77858, 1, 1, 1, 1, 1,
0.4832001, 0.9937174, 3.223141, 1, 1, 1, 1, 1,
0.489027, 1.125325, 2.269642, 0, 0, 1, 1, 1,
0.4958986, -0.8269389, 3.804111, 1, 0, 0, 1, 1,
0.5015001, 0.003371293, 1.73886, 1, 0, 0, 1, 1,
0.5027807, 0.0217982, 2.239386, 1, 0, 0, 1, 1,
0.5030459, -0.313638, 3.252129, 1, 0, 0, 1, 1,
0.5085962, -1.779891, 2.564605, 1, 0, 0, 1, 1,
0.5220133, -0.5332949, 1.605308, 0, 0, 0, 1, 1,
0.5344805, 0.5271298, 0.4425961, 0, 0, 0, 1, 1,
0.5387028, -2.745608, 3.18532, 0, 0, 0, 1, 1,
0.5411567, -0.3388095, 2.140131, 0, 0, 0, 1, 1,
0.5423815, 0.8342237, 0.8113959, 0, 0, 0, 1, 1,
0.5443535, 0.1803166, 1.202796, 0, 0, 0, 1, 1,
0.5462944, -1.085726, 2.216594, 0, 0, 0, 1, 1,
0.5501354, 0.5972269, 0.3168769, 1, 1, 1, 1, 1,
0.5507575, -0.04870661, 1.593601, 1, 1, 1, 1, 1,
0.553572, 1.025626, -0.3764625, 1, 1, 1, 1, 1,
0.5570022, 2.27379, 0.2415681, 1, 1, 1, 1, 1,
0.5571727, -0.9698622, 1.143276, 1, 1, 1, 1, 1,
0.5578699, 0.6412474, 0.7283512, 1, 1, 1, 1, 1,
0.5595323, 1.241414, 1.147355, 1, 1, 1, 1, 1,
0.5608796, -1.055508, 2.428849, 1, 1, 1, 1, 1,
0.561042, -0.6195247, 2.560136, 1, 1, 1, 1, 1,
0.5625476, 0.9796062, 0.9028682, 1, 1, 1, 1, 1,
0.5681221, -0.9879019, 3.641972, 1, 1, 1, 1, 1,
0.5728866, -0.9328626, 2.596605, 1, 1, 1, 1, 1,
0.5732582, -1.851636, 3.630198, 1, 1, 1, 1, 1,
0.5749625, -0.8444006, -0.03992483, 1, 1, 1, 1, 1,
0.5776614, 0.1347011, 1.792466, 1, 1, 1, 1, 1,
0.5833479, 0.2130659, 0.7164716, 0, 0, 1, 1, 1,
0.5888743, -1.777294, 3.963196, 1, 0, 0, 1, 1,
0.5926001, -1.437023, 3.684362, 1, 0, 0, 1, 1,
0.594677, 1.103731, 0.3171476, 1, 0, 0, 1, 1,
0.5967777, 1.12931, 1.631097, 1, 0, 0, 1, 1,
0.6007924, -1.278815, 1.886849, 1, 0, 0, 1, 1,
0.6034595, -0.7812461, 1.113422, 0, 0, 0, 1, 1,
0.6037964, -0.01152655, 0.3305734, 0, 0, 0, 1, 1,
0.6048008, 0.7454841, -0.1036128, 0, 0, 0, 1, 1,
0.6061646, 1.102752, 0.2274598, 0, 0, 0, 1, 1,
0.6076825, 0.1062927, 2.556412, 0, 0, 0, 1, 1,
0.6094992, -0.4031226, 2.21666, 0, 0, 0, 1, 1,
0.613189, -0.4429102, 3.344593, 0, 0, 0, 1, 1,
0.6140665, 0.439114, 0.8354813, 1, 1, 1, 1, 1,
0.6160661, -0.522433, 2.318324, 1, 1, 1, 1, 1,
0.6202313, -0.7734907, 1.984412, 1, 1, 1, 1, 1,
0.6205255, -0.4952448, 3.811093, 1, 1, 1, 1, 1,
0.6245982, -0.9139821, 4.029107, 1, 1, 1, 1, 1,
0.6307952, -0.4677759, 2.475115, 1, 1, 1, 1, 1,
0.6322102, 2.558547, -1.662261, 1, 1, 1, 1, 1,
0.6326936, 0.463234, 2.201367, 1, 1, 1, 1, 1,
0.6342199, 0.7284331, 0.667722, 1, 1, 1, 1, 1,
0.6351678, 0.1315886, 1.899194, 1, 1, 1, 1, 1,
0.6354181, -0.9889626, 2.32026, 1, 1, 1, 1, 1,
0.6379628, -0.5642417, 2.740768, 1, 1, 1, 1, 1,
0.6384317, 1.724875, -0.07297222, 1, 1, 1, 1, 1,
0.6411626, 0.4683891, 1.075761, 1, 1, 1, 1, 1,
0.6439348, 1.109973, 2.210243, 1, 1, 1, 1, 1,
0.6512775, 1.254029, -0.3170712, 0, 0, 1, 1, 1,
0.6514461, -0.6775651, 3.703523, 1, 0, 0, 1, 1,
0.6581349, -1.178774, 2.731583, 1, 0, 0, 1, 1,
0.6583705, -0.3005553, 2.042671, 1, 0, 0, 1, 1,
0.6594019, -0.320637, 0.7393153, 1, 0, 0, 1, 1,
0.6628276, 0.4666077, 0.6899743, 1, 0, 0, 1, 1,
0.6664424, 1.068071, 2.83239, 0, 0, 0, 1, 1,
0.6779934, -0.685142, 3.780149, 0, 0, 0, 1, 1,
0.6783584, 0.7154267, 0.7403058, 0, 0, 0, 1, 1,
0.6794094, 1.125008, 0.6894767, 0, 0, 0, 1, 1,
0.68483, 0.7000539, -0.6325685, 0, 0, 0, 1, 1,
0.688741, 0.2748992, 2.157908, 0, 0, 0, 1, 1,
0.6909666, -0.6150159, 2.632302, 0, 0, 0, 1, 1,
0.6923454, 1.436532, -0.3595642, 1, 1, 1, 1, 1,
0.6991121, 0.4058221, 0.006506722, 1, 1, 1, 1, 1,
0.7001163, 0.03707574, 0.7838859, 1, 1, 1, 1, 1,
0.7051256, -1.031722, 1.36128, 1, 1, 1, 1, 1,
0.7136135, 1.279065, 0.9883224, 1, 1, 1, 1, 1,
0.7142966, -1.899021, 3.033055, 1, 1, 1, 1, 1,
0.7153026, -0.009803746, 2.321942, 1, 1, 1, 1, 1,
0.7155119, 1.665042, -2.084868, 1, 1, 1, 1, 1,
0.7199975, 0.552096, 1.807755, 1, 1, 1, 1, 1,
0.7213004, 0.06829135, -0.4044082, 1, 1, 1, 1, 1,
0.7228197, 0.0128034, -1.200721, 1, 1, 1, 1, 1,
0.7229862, 1.322982, 0.8426443, 1, 1, 1, 1, 1,
0.7268373, -0.7701557, 1.743811, 1, 1, 1, 1, 1,
0.7270985, 0.3043692, 2.781615, 1, 1, 1, 1, 1,
0.7318397, -0.1716712, 1.12655, 1, 1, 1, 1, 1,
0.7319384, -0.481866, 2.820004, 0, 0, 1, 1, 1,
0.7336701, 0.7424885, 0.7843404, 1, 0, 0, 1, 1,
0.7391639, 0.8512825, 0.09164312, 1, 0, 0, 1, 1,
0.7404933, -0.4225124, 2.569933, 1, 0, 0, 1, 1,
0.74655, -2.219422, 4.589109, 1, 0, 0, 1, 1,
0.7467985, -0.02889946, 2.036681, 1, 0, 0, 1, 1,
0.7477046, -0.1980126, 1.696152, 0, 0, 0, 1, 1,
0.753511, -1.570134, 4.522954, 0, 0, 0, 1, 1,
0.7544879, -1.148295, 0.9102059, 0, 0, 0, 1, 1,
0.7571677, 0.3044849, -0.8919283, 0, 0, 0, 1, 1,
0.7649124, -0.4560879, 1.872724, 0, 0, 0, 1, 1,
0.7715069, -0.2545947, 1.47979, 0, 0, 0, 1, 1,
0.7731183, -2.082376, 3.569667, 0, 0, 0, 1, 1,
0.7732083, 0.5563486, 1.231136, 1, 1, 1, 1, 1,
0.7749527, -1.592552, 3.185471, 1, 1, 1, 1, 1,
0.7750424, 0.9268133, 2.342626, 1, 1, 1, 1, 1,
0.7775962, 0.8903976, 0.7031425, 1, 1, 1, 1, 1,
0.7897322, -0.09149579, 1.246737, 1, 1, 1, 1, 1,
0.793421, 0.6519037, 1.15398, 1, 1, 1, 1, 1,
0.7949164, -1.308722, 4.18649, 1, 1, 1, 1, 1,
0.7961793, 0.8728041, 0.6414758, 1, 1, 1, 1, 1,
0.7991097, -0.2416977, 1.081014, 1, 1, 1, 1, 1,
0.8032572, -0.5764527, 1.766026, 1, 1, 1, 1, 1,
0.80475, -1.036077, 1.592939, 1, 1, 1, 1, 1,
0.804941, -0.2618973, 1.247551, 1, 1, 1, 1, 1,
0.8060738, -1.309462, 4.449333, 1, 1, 1, 1, 1,
0.8162, 0.3206216, 0.2929364, 1, 1, 1, 1, 1,
0.8310313, 1.86422, 0.2635715, 1, 1, 1, 1, 1,
0.8352499, -0.458483, 3.79106, 0, 0, 1, 1, 1,
0.8357891, -0.5122828, 0.9633084, 1, 0, 0, 1, 1,
0.8403141, -1.170807, 3.170437, 1, 0, 0, 1, 1,
0.8466714, -1.118177, 1.989529, 1, 0, 0, 1, 1,
0.8514894, 0.3347257, 2.230189, 1, 0, 0, 1, 1,
0.8598852, -1.35901, 4.367506, 1, 0, 0, 1, 1,
0.8647898, -0.40387, 1.179129, 0, 0, 0, 1, 1,
0.8679945, -1.420618, 1.260184, 0, 0, 0, 1, 1,
0.8697325, -0.5212622, 1.595922, 0, 0, 0, 1, 1,
0.8725788, 0.000244998, 0.344554, 0, 0, 0, 1, 1,
0.8793684, -0.4366154, 2.931158, 0, 0, 0, 1, 1,
0.8830231, 0.1763491, 1.516825, 0, 0, 0, 1, 1,
0.8917821, 1.120118, 0.4754383, 0, 0, 0, 1, 1,
0.9058989, 0.6303264, 0.5507872, 1, 1, 1, 1, 1,
0.906833, -0.3207304, 1.736416, 1, 1, 1, 1, 1,
0.9070237, 0.141754, -1.242194, 1, 1, 1, 1, 1,
0.9070374, 0.8985204, -0.2686031, 1, 1, 1, 1, 1,
0.9089909, -0.2470579, 2.108599, 1, 1, 1, 1, 1,
0.9106482, -0.08234316, 1.921613, 1, 1, 1, 1, 1,
0.9116652, 0.5120549, -0.2606866, 1, 1, 1, 1, 1,
0.9138102, -0.3254269, 0.458354, 1, 1, 1, 1, 1,
0.9144469, -0.2267406, 1.75826, 1, 1, 1, 1, 1,
0.9148797, 1.390293, -0.451701, 1, 1, 1, 1, 1,
0.9193418, -0.7944228, 2.303237, 1, 1, 1, 1, 1,
0.9226146, -0.9575936, 1.743702, 1, 1, 1, 1, 1,
0.924207, -0.6471732, 1.089321, 1, 1, 1, 1, 1,
0.9256358, -0.9286315, 1.802395, 1, 1, 1, 1, 1,
0.9349369, 0.07849885, 2.399307, 1, 1, 1, 1, 1,
0.9359701, 0.7904304, 1.654121, 0, 0, 1, 1, 1,
0.9463947, -0.5752186, 1.848026, 1, 0, 0, 1, 1,
0.953526, -1.258343, 1.663791, 1, 0, 0, 1, 1,
0.962203, -0.3155338, 1.340007, 1, 0, 0, 1, 1,
0.9640494, 0.1515868, 1.966415, 1, 0, 0, 1, 1,
0.9669405, -1.234555, 2.477267, 1, 0, 0, 1, 1,
0.9768547, 1.150174, 0.5092312, 0, 0, 0, 1, 1,
0.9787065, -0.7015095, 2.383551, 0, 0, 0, 1, 1,
0.9837567, 0.3787723, -2.228886, 0, 0, 0, 1, 1,
0.9877467, 0.130469, 2.127019, 0, 0, 0, 1, 1,
0.996148, -0.08449137, 2.050603, 0, 0, 0, 1, 1,
0.9986154, 2.294502, 2.144454, 0, 0, 0, 1, 1,
1.008195, 0.6228474, -0.1463731, 0, 0, 0, 1, 1,
1.013947, -0.3218333, 2.520664, 1, 1, 1, 1, 1,
1.015317, 0.5520804, 3.269601, 1, 1, 1, 1, 1,
1.027279, 1.924656, 0.3927185, 1, 1, 1, 1, 1,
1.02773, 0.8355177, 1.759149, 1, 1, 1, 1, 1,
1.038949, 0.515072, 0.1408836, 1, 1, 1, 1, 1,
1.051476, 0.835741, 0.6948376, 1, 1, 1, 1, 1,
1.058594, 0.1986932, 0.9799144, 1, 1, 1, 1, 1,
1.059207, 1.044864, 0.1038772, 1, 1, 1, 1, 1,
1.06064, 0.03322593, 0.1095123, 1, 1, 1, 1, 1,
1.061591, -1.359388, 2.853395, 1, 1, 1, 1, 1,
1.063599, 1.173936, 2.079015, 1, 1, 1, 1, 1,
1.067469, -0.07053627, -0.4666564, 1, 1, 1, 1, 1,
1.078361, -0.2232907, 0.03243992, 1, 1, 1, 1, 1,
1.083371, 0.307748, 1.515861, 1, 1, 1, 1, 1,
1.089912, -0.4035509, 1.620836, 1, 1, 1, 1, 1,
1.090834, -0.8443533, 2.466934, 0, 0, 1, 1, 1,
1.100543, -0.547747, 1.989604, 1, 0, 0, 1, 1,
1.101501, -0.2659616, 2.835127, 1, 0, 0, 1, 1,
1.110088, 1.63792, 0.84454, 1, 0, 0, 1, 1,
1.118116, 0.1709574, 3.160091, 1, 0, 0, 1, 1,
1.120846, 1.071145, -0.4825542, 1, 0, 0, 1, 1,
1.12159, 0.6621751, 0.8000321, 0, 0, 0, 1, 1,
1.121997, -1.563889, 2.093054, 0, 0, 0, 1, 1,
1.127284, 0.06928043, 0.7555337, 0, 0, 0, 1, 1,
1.13827, -1.082267, 2.74248, 0, 0, 0, 1, 1,
1.140919, -0.01471557, 2.145409, 0, 0, 0, 1, 1,
1.147416, 0.03178146, 2.13566, 0, 0, 0, 1, 1,
1.152003, 1.102143, 0.05308496, 0, 0, 0, 1, 1,
1.161788, 0.1511168, 0.6223381, 1, 1, 1, 1, 1,
1.169367, 1.241848, -0.5721257, 1, 1, 1, 1, 1,
1.174488, -0.5950431, 2.036139, 1, 1, 1, 1, 1,
1.183802, -0.3943023, 0.9974348, 1, 1, 1, 1, 1,
1.184918, -1.150952, 2.276344, 1, 1, 1, 1, 1,
1.19019, -0.6131005, 1.49716, 1, 1, 1, 1, 1,
1.191633, 0.2203532, 3.381501, 1, 1, 1, 1, 1,
1.194038, 1.267832, -0.3088455, 1, 1, 1, 1, 1,
1.195094, -1.210142, 0.7372692, 1, 1, 1, 1, 1,
1.199637, 0.5659732, 1.247053, 1, 1, 1, 1, 1,
1.200528, -0.06459714, 2.546427, 1, 1, 1, 1, 1,
1.204359, 1.892968, -1.510885, 1, 1, 1, 1, 1,
1.210787, -1.317204, 1.429928, 1, 1, 1, 1, 1,
1.212486, -0.5349227, 2.454628, 1, 1, 1, 1, 1,
1.215769, -0.7483929, 0.7718951, 1, 1, 1, 1, 1,
1.229215, 0.1733919, 1.11832, 0, 0, 1, 1, 1,
1.234663, 0.4342339, 0.8493993, 1, 0, 0, 1, 1,
1.241739, -0.8050151, 1.82494, 1, 0, 0, 1, 1,
1.248748, -2.147533, 3.88185, 1, 0, 0, 1, 1,
1.252664, 1.649851, 0.02799234, 1, 0, 0, 1, 1,
1.253463, 2.139984, 1.14778, 1, 0, 0, 1, 1,
1.257033, 1.632629, 1.783903, 0, 0, 0, 1, 1,
1.258679, -0.8681253, 0.3762915, 0, 0, 0, 1, 1,
1.262396, -0.4745843, 1.696878, 0, 0, 0, 1, 1,
1.272559, -0.9778108, 2.001787, 0, 0, 0, 1, 1,
1.272968, 2.345487, -0.9534829, 0, 0, 0, 1, 1,
1.274239, -0.4650445, 1.836079, 0, 0, 0, 1, 1,
1.283727, 1.342776, 1.663838, 0, 0, 0, 1, 1,
1.287049, 0.2864281, 2.450785, 1, 1, 1, 1, 1,
1.288958, 0.9335138, 1.353147, 1, 1, 1, 1, 1,
1.289061, -1.40301, 1.351241, 1, 1, 1, 1, 1,
1.313177, -0.9471428, 1.434864, 1, 1, 1, 1, 1,
1.337453, -1.128321, 1.855068, 1, 1, 1, 1, 1,
1.341363, -2.021215, 1.569948, 1, 1, 1, 1, 1,
1.345218, 1.279237, 1.656485, 1, 1, 1, 1, 1,
1.356075, 0.8093517, 0.5512888, 1, 1, 1, 1, 1,
1.356269, -1.825001, 0.9030976, 1, 1, 1, 1, 1,
1.361933, 0.6550968, 0.9193262, 1, 1, 1, 1, 1,
1.36392, 0.6260253, -0.6291578, 1, 1, 1, 1, 1,
1.37383, 0.713712, 1.908163, 1, 1, 1, 1, 1,
1.387372, 1.280481, 0.2546209, 1, 1, 1, 1, 1,
1.387598, -0.2667798, 0.1162104, 1, 1, 1, 1, 1,
1.393452, -0.114449, 0.4682569, 1, 1, 1, 1, 1,
1.398755, -0.3256471, 0.07207274, 0, 0, 1, 1, 1,
1.40767, 0.08537565, 2.141652, 1, 0, 0, 1, 1,
1.414749, 2.217939, -0.2404172, 1, 0, 0, 1, 1,
1.415073, 1.363374, 2.354332, 1, 0, 0, 1, 1,
1.417504, -0.8766936, 2.81482, 1, 0, 0, 1, 1,
1.424702, 1.113676, 0.7313485, 1, 0, 0, 1, 1,
1.435503, 0.4374963, 1.515315, 0, 0, 0, 1, 1,
1.435593, 2.401312, -0.2149233, 0, 0, 0, 1, 1,
1.46408, 0.1157681, 0.8532676, 0, 0, 0, 1, 1,
1.471934, 2.24908, -0.01627559, 0, 0, 0, 1, 1,
1.473184, -0.458431, 2.358226, 0, 0, 0, 1, 1,
1.486893, -0.4607971, 1.843398, 0, 0, 0, 1, 1,
1.48869, -1.390781, 2.336599, 0, 0, 0, 1, 1,
1.494875, 0.1183338, 1.210563, 1, 1, 1, 1, 1,
1.514502, -0.3413993, 0.7787064, 1, 1, 1, 1, 1,
1.518633, -1.528011, 2.637315, 1, 1, 1, 1, 1,
1.523154, -1.020691, 0.4472306, 1, 1, 1, 1, 1,
1.582271, -0.0768673, 1.481802, 1, 1, 1, 1, 1,
1.592602, -0.611849, 1.754646, 1, 1, 1, 1, 1,
1.607486, -0.8708548, 1.647374, 1, 1, 1, 1, 1,
1.622278, -0.4167548, 2.054399, 1, 1, 1, 1, 1,
1.638127, -0.1440883, 2.479644, 1, 1, 1, 1, 1,
1.639606, -0.004704463, 2.398999, 1, 1, 1, 1, 1,
1.640076, 3.014571, -0.4654306, 1, 1, 1, 1, 1,
1.647322, -0.4093407, 1.485829, 1, 1, 1, 1, 1,
1.648954, 0.9317956, -0.6098138, 1, 1, 1, 1, 1,
1.654658, -0.5377399, 1.633983, 1, 1, 1, 1, 1,
1.661374, -0.7271508, 2.065821, 1, 1, 1, 1, 1,
1.662583, -0.9708798, 2.886404, 0, 0, 1, 1, 1,
1.674516, -0.6363202, 2.199435, 1, 0, 0, 1, 1,
1.693224, -0.2808103, 2.953383, 1, 0, 0, 1, 1,
1.696643, -0.3467543, -0.06311139, 1, 0, 0, 1, 1,
1.701653, -1.320546, 1.39205, 1, 0, 0, 1, 1,
1.733808, 0.7110727, 1.072889, 1, 0, 0, 1, 1,
1.754772, 1.105562, 0.5311999, 0, 0, 0, 1, 1,
1.756616, 0.5671353, 2.208049, 0, 0, 0, 1, 1,
1.771707, 0.2772126, 2.798107, 0, 0, 0, 1, 1,
1.773924, -1.673104, 1.214845, 0, 0, 0, 1, 1,
1.789979, -0.0798935, 0.67166, 0, 0, 0, 1, 1,
1.791548, 0.3560467, 0.1347256, 0, 0, 0, 1, 1,
1.798109, -0.4314835, 1.90398, 0, 0, 0, 1, 1,
1.798945, 1.141496, 0.2662121, 1, 1, 1, 1, 1,
1.805318, -0.8517979, 2.861023, 1, 1, 1, 1, 1,
1.839933, 1.033557, -0.5313018, 1, 1, 1, 1, 1,
1.848093, 1.33006, 0.7741272, 1, 1, 1, 1, 1,
1.872948, -1.381495, 2.992001, 1, 1, 1, 1, 1,
1.883806, -1.815826, 2.095469, 1, 1, 1, 1, 1,
1.905994, 0.805266, 2.067021, 1, 1, 1, 1, 1,
1.909013, 0.09601556, 1.749167, 1, 1, 1, 1, 1,
1.943042, -0.1941511, 3.290786, 1, 1, 1, 1, 1,
1.953074, -0.8468938, 2.745965, 1, 1, 1, 1, 1,
1.976384, 0.3777463, 3.088407, 1, 1, 1, 1, 1,
1.983189, 0.06466272, 2.505835, 1, 1, 1, 1, 1,
2.018071, 0.4343618, 2.295663, 1, 1, 1, 1, 1,
2.020355, 0.4034642, 0.8214359, 1, 1, 1, 1, 1,
2.109352, 0.3045425, 0.6243855, 1, 1, 1, 1, 1,
2.144902, -0.07380301, 1.709002, 0, 0, 1, 1, 1,
2.166324, -0.9813888, 2.424485, 1, 0, 0, 1, 1,
2.183904, 0.9600819, -0.9279234, 1, 0, 0, 1, 1,
2.198431, -0.3023977, 3.302818, 1, 0, 0, 1, 1,
2.252658, -1.327099, 0.9675959, 1, 0, 0, 1, 1,
2.268109, -1.299486, 3.433942, 1, 0, 0, 1, 1,
2.271782, 1.441195, 0.8500026, 0, 0, 0, 1, 1,
2.284683, 0.4363777, 1.01384, 0, 0, 0, 1, 1,
2.343168, 0.4017301, 1.111207, 0, 0, 0, 1, 1,
2.343297, -1.479459, 2.301677, 0, 0, 0, 1, 1,
2.357367, 1.315657, 0.4162569, 0, 0, 0, 1, 1,
2.435147, 1.693275, 0.8474225, 0, 0, 0, 1, 1,
2.472276, -1.374349, 2.246009, 0, 0, 0, 1, 1,
2.566672, 0.7639041, 0.5092252, 1, 1, 1, 1, 1,
2.627883, -1.342265, 1.63191, 1, 1, 1, 1, 1,
2.995949, -0.4141606, 2.050607, 1, 1, 1, 1, 1,
3.094295, 0.8252923, 1.219757, 1, 1, 1, 1, 1,
3.265737, 0.4898169, 1.52985, 1, 1, 1, 1, 1,
3.269296, -0.6093841, 1.296459, 1, 1, 1, 1, 1,
4.586302, 0.3295341, 2.002436, 1, 1, 1, 1, 1
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
var radius = 9.868716;
var distance = 34.66345;
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
mvMatrix.translate( -0.3975496, -0.1344814, 0.05533648 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.66345);
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
