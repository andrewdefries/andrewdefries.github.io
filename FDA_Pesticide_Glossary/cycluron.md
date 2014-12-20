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
-3.178302, -0.2932301, 0.4231815, 1, 0, 0, 1,
-3.101424, 1.651309, -1.457544, 1, 0.007843138, 0, 1,
-3.07909, 0.291503, -1.914071, 1, 0.01176471, 0, 1,
-3.023673, -1.612873, -2.200501, 1, 0.01960784, 0, 1,
-2.665261, -2.828822, -2.668576, 1, 0.02352941, 0, 1,
-2.548553, 0.9671901, -1.630502, 1, 0.03137255, 0, 1,
-2.547034, -0.02401016, -1.144638, 1, 0.03529412, 0, 1,
-2.489335, -0.6872088, -2.186223, 1, 0.04313726, 0, 1,
-2.455141, -0.8508595, -1.928514, 1, 0.04705882, 0, 1,
-2.37872, -1.104383, -1.16928, 1, 0.05490196, 0, 1,
-2.259219, -1.081218, -0.3645793, 1, 0.05882353, 0, 1,
-2.257483, 2.098448, 0.1890595, 1, 0.06666667, 0, 1,
-2.22977, 1.754745, -0.5636562, 1, 0.07058824, 0, 1,
-2.179637, 0.5306119, -1.745483, 1, 0.07843138, 0, 1,
-2.16249, 0.02647223, -0.2930341, 1, 0.08235294, 0, 1,
-2.126484, -0.2209465, 0.0610824, 1, 0.09019608, 0, 1,
-2.060135, 0.004472087, -1.324058, 1, 0.09411765, 0, 1,
-2.010438, -1.359905, -2.494482, 1, 0.1019608, 0, 1,
-2.009357, 0.3491727, -0.05585629, 1, 0.1098039, 0, 1,
-1.981842, 0.6114035, -0.7737214, 1, 0.1137255, 0, 1,
-1.968363, -1.077134, -2.753518, 1, 0.1215686, 0, 1,
-1.939954, -0.9269081, -1.897753, 1, 0.1254902, 0, 1,
-1.935581, -1.521543, -1.869212, 1, 0.1333333, 0, 1,
-1.91198, -0.638072, -2.820151, 1, 0.1372549, 0, 1,
-1.905969, -0.1635101, -2.50337, 1, 0.145098, 0, 1,
-1.900311, -1.581469, -0.4407648, 1, 0.1490196, 0, 1,
-1.895034, -0.8366385, -2.725183, 1, 0.1568628, 0, 1,
-1.865143, -0.3825387, -1.141104, 1, 0.1607843, 0, 1,
-1.822261, 1.237222, -0.1454686, 1, 0.1686275, 0, 1,
-1.814076, -0.2902464, -2.351169, 1, 0.172549, 0, 1,
-1.812808, -0.1360244, -1.973599, 1, 0.1803922, 0, 1,
-1.81237, -0.8291164, -3.539321, 1, 0.1843137, 0, 1,
-1.808599, 0.8857579, -1.997651, 1, 0.1921569, 0, 1,
-1.788862, 1.259644, 0.01581055, 1, 0.1960784, 0, 1,
-1.785879, -0.6380111, -2.649118, 1, 0.2039216, 0, 1,
-1.777429, 0.6582908, -2.057721, 1, 0.2117647, 0, 1,
-1.75645, 1.869175, -1.582206, 1, 0.2156863, 0, 1,
-1.735174, 0.18589, -1.297382, 1, 0.2235294, 0, 1,
-1.722542, -0.8404155, -1.662904, 1, 0.227451, 0, 1,
-1.721837, -0.08900029, -2.601483, 1, 0.2352941, 0, 1,
-1.713578, 0.8513327, 0.1095841, 1, 0.2392157, 0, 1,
-1.708319, 1.407832, -1.06692, 1, 0.2470588, 0, 1,
-1.701746, 0.6941358, -1.200483, 1, 0.2509804, 0, 1,
-1.698486, -0.4989753, -3.601667, 1, 0.2588235, 0, 1,
-1.686199, 1.207943, -2.089716, 1, 0.2627451, 0, 1,
-1.6766, -0.7913697, -1.157926, 1, 0.2705882, 0, 1,
-1.666049, -1.153997, -0.6697655, 1, 0.2745098, 0, 1,
-1.665832, 1.483972, -0.1500184, 1, 0.282353, 0, 1,
-1.65784, 0.6919218, -0.7005672, 1, 0.2862745, 0, 1,
-1.657131, 1.502147, -3.44672, 1, 0.2941177, 0, 1,
-1.651722, -2.028483, -2.729939, 1, 0.3019608, 0, 1,
-1.644475, 1.42049, -1.014231, 1, 0.3058824, 0, 1,
-1.635954, 0.1672854, -2.283261, 1, 0.3137255, 0, 1,
-1.593713, -0.05900815, -1.753174, 1, 0.3176471, 0, 1,
-1.557154, 0.08250101, -1.401233, 1, 0.3254902, 0, 1,
-1.556073, -1.320259, -1.515406, 1, 0.3294118, 0, 1,
-1.552321, 1.719048, -1.199265, 1, 0.3372549, 0, 1,
-1.551106, -1.629114, -1.229621, 1, 0.3411765, 0, 1,
-1.548516, 1.688832, -0.2971813, 1, 0.3490196, 0, 1,
-1.546622, -0.4256529, -1.740438, 1, 0.3529412, 0, 1,
-1.534087, 1.277907, -1.786677, 1, 0.3607843, 0, 1,
-1.53379, -1.192481, -2.299469, 1, 0.3647059, 0, 1,
-1.532458, 0.3244799, -2.398032, 1, 0.372549, 0, 1,
-1.499609, -0.5636217, -2.477532, 1, 0.3764706, 0, 1,
-1.478202, 1.560783, -0.1521884, 1, 0.3843137, 0, 1,
-1.468737, -1.038543, -3.085777, 1, 0.3882353, 0, 1,
-1.467945, 0.6365916, -2.606823, 1, 0.3960784, 0, 1,
-1.45339, -0.6728762, -3.151248, 1, 0.4039216, 0, 1,
-1.45319, 1.106193, -0.4948956, 1, 0.4078431, 0, 1,
-1.446497, -0.3924995, -1.595628, 1, 0.4156863, 0, 1,
-1.441907, -0.5986626, -1.364404, 1, 0.4196078, 0, 1,
-1.43376, -0.4869393, -1.148575, 1, 0.427451, 0, 1,
-1.427456, -0.9606996, -2.116114, 1, 0.4313726, 0, 1,
-1.415469, -0.00835004, -0.9013201, 1, 0.4392157, 0, 1,
-1.407394, 0.6587107, -2.485809, 1, 0.4431373, 0, 1,
-1.405019, -1.988672, -2.519678, 1, 0.4509804, 0, 1,
-1.392004, 1.113086, -2.581011, 1, 0.454902, 0, 1,
-1.383963, -0.4495504, -1.701319, 1, 0.4627451, 0, 1,
-1.368898, -0.4961708, -1.725524, 1, 0.4666667, 0, 1,
-1.356743, 0.3514096, -2.100672, 1, 0.4745098, 0, 1,
-1.356106, 0.005107668, -2.146164, 1, 0.4784314, 0, 1,
-1.340996, 1.537171, 0.8058791, 1, 0.4862745, 0, 1,
-1.337588, -0.5907001, -2.316282, 1, 0.4901961, 0, 1,
-1.337421, -0.734825, -1.186716, 1, 0.4980392, 0, 1,
-1.33599, 0.4641279, -1.695005, 1, 0.5058824, 0, 1,
-1.335223, 1.002946, -0.6166025, 1, 0.509804, 0, 1,
-1.3202, -0.8575764, 0.1926411, 1, 0.5176471, 0, 1,
-1.316841, 0.793833, 1.380365, 1, 0.5215687, 0, 1,
-1.306737, 0.4679994, -0.8466355, 1, 0.5294118, 0, 1,
-1.30599, -0.8812556, -2.264004, 1, 0.5333334, 0, 1,
-1.302903, 1.483841, -0.9615608, 1, 0.5411765, 0, 1,
-1.301456, -0.4064496, -3.315891, 1, 0.5450981, 0, 1,
-1.30145, 1.127743, -0.522437, 1, 0.5529412, 0, 1,
-1.298475, -1.563144, -4.092333, 1, 0.5568628, 0, 1,
-1.280401, 0.5662482, -0.307781, 1, 0.5647059, 0, 1,
-1.274469, -1.710541, -1.913673, 1, 0.5686275, 0, 1,
-1.264725, 1.186608, 0.3042082, 1, 0.5764706, 0, 1,
-1.261591, 0.6611091, -0.9260569, 1, 0.5803922, 0, 1,
-1.260692, -2.426568, -2.112596, 1, 0.5882353, 0, 1,
-1.252195, -0.7753751, -3.014885, 1, 0.5921569, 0, 1,
-1.250025, 1.667773, 0.3522446, 1, 0.6, 0, 1,
-1.227816, -0.5012663, -1.175037, 1, 0.6078432, 0, 1,
-1.224623, -0.2886458, -1.780677, 1, 0.6117647, 0, 1,
-1.219273, 0.4955786, -2.231361, 1, 0.6196079, 0, 1,
-1.210127, 1.197517, -0.9180871, 1, 0.6235294, 0, 1,
-1.202406, 1.542259, -0.01557518, 1, 0.6313726, 0, 1,
-1.196617, -0.7818857, -3.011685, 1, 0.6352941, 0, 1,
-1.193217, -1.659263, -1.424083, 1, 0.6431373, 0, 1,
-1.192011, 0.5914031, 0.1661488, 1, 0.6470588, 0, 1,
-1.190919, -1.651113, -3.161793, 1, 0.654902, 0, 1,
-1.190113, -0.6046059, -2.61981, 1, 0.6588235, 0, 1,
-1.187515, 1.417436, 0.2440877, 1, 0.6666667, 0, 1,
-1.169009, 0.5783132, -2.785806, 1, 0.6705883, 0, 1,
-1.151881, 0.3102965, -2.249626, 1, 0.6784314, 0, 1,
-1.145886, -0.09678847, -2.202237, 1, 0.682353, 0, 1,
-1.14152, -0.2603951, -0.7013086, 1, 0.6901961, 0, 1,
-1.13674, -0.8308145, -3.157349, 1, 0.6941177, 0, 1,
-1.134225, 1.117465, -2.582496, 1, 0.7019608, 0, 1,
-1.133618, -0.78966, -2.273757, 1, 0.7098039, 0, 1,
-1.126534, -1.036854, -2.511218, 1, 0.7137255, 0, 1,
-1.124885, -0.4870937, -3.495243, 1, 0.7215686, 0, 1,
-1.123589, 1.369974, -1.433372, 1, 0.7254902, 0, 1,
-1.114406, -0.3331829, -0.9383865, 1, 0.7333333, 0, 1,
-1.112951, -0.3693031, -0.2083634, 1, 0.7372549, 0, 1,
-1.111042, 0.01243461, 0.5299121, 1, 0.7450981, 0, 1,
-1.109864, 2.297697, 0.009720295, 1, 0.7490196, 0, 1,
-1.108194, 1.265697, -2.794608, 1, 0.7568628, 0, 1,
-1.097304, 0.9036684, 1.704039, 1, 0.7607843, 0, 1,
-1.094303, -1.531549, -4.378011, 1, 0.7686275, 0, 1,
-1.081173, 0.2319183, -2.206147, 1, 0.772549, 0, 1,
-1.077214, 0.7812322, -1.595736, 1, 0.7803922, 0, 1,
-1.061769, -0.1966861, 0.3406685, 1, 0.7843137, 0, 1,
-1.055021, -0.4868868, -1.978036, 1, 0.7921569, 0, 1,
-1.053624, -0.5952469, 0.6100725, 1, 0.7960784, 0, 1,
-1.051326, 1.142126, -0.8988804, 1, 0.8039216, 0, 1,
-1.047883, 0.8676014, -0.3828565, 1, 0.8117647, 0, 1,
-1.040384, 0.6010986, 0.3223995, 1, 0.8156863, 0, 1,
-1.018993, -0.4523754, -1.395336, 1, 0.8235294, 0, 1,
-1.007145, 1.166035, -1.29181, 1, 0.827451, 0, 1,
-0.9893904, 1.063959, -1.235703, 1, 0.8352941, 0, 1,
-0.9874278, -0.04183411, -1.72461, 1, 0.8392157, 0, 1,
-0.977351, 1.916458, 0.5682451, 1, 0.8470588, 0, 1,
-0.9711987, 0.3297288, -0.2951743, 1, 0.8509804, 0, 1,
-0.9583342, 1.008245, -2.255899, 1, 0.8588235, 0, 1,
-0.9562895, 0.9037136, -2.649913, 1, 0.8627451, 0, 1,
-0.9536584, -0.9402711, -2.377506, 1, 0.8705882, 0, 1,
-0.9522847, -1.886456, -2.53419, 1, 0.8745098, 0, 1,
-0.9502221, -1.044897, -4.625003, 1, 0.8823529, 0, 1,
-0.9484311, -0.03113833, -0.5358388, 1, 0.8862745, 0, 1,
-0.9449669, 0.4363374, -1.699381, 1, 0.8941177, 0, 1,
-0.9441957, -0.1371993, -2.522139, 1, 0.8980392, 0, 1,
-0.9404163, -0.7653388, -2.550537, 1, 0.9058824, 0, 1,
-0.9366412, -0.1410411, -2.610894, 1, 0.9137255, 0, 1,
-0.9276392, -0.1082486, -1.098387, 1, 0.9176471, 0, 1,
-0.9259959, 0.7464977, -1.738034, 1, 0.9254902, 0, 1,
-0.9213459, -1.636075, -1.032572, 1, 0.9294118, 0, 1,
-0.9168881, 0.8900214, -1.336436, 1, 0.9372549, 0, 1,
-0.913767, -1.821641, -3.630733, 1, 0.9411765, 0, 1,
-0.9101158, -1.754914, -3.831238, 1, 0.9490196, 0, 1,
-0.9091953, -0.04724121, -0.8032266, 1, 0.9529412, 0, 1,
-0.9018204, -0.6535904, -2.486457, 1, 0.9607843, 0, 1,
-0.901713, -1.749461, -2.227658, 1, 0.9647059, 0, 1,
-0.9012125, -0.3930875, -1.356756, 1, 0.972549, 0, 1,
-0.9001634, -1.001357, -1.315792, 1, 0.9764706, 0, 1,
-0.8882671, 0.4873204, -0.6209759, 1, 0.9843137, 0, 1,
-0.8880929, 1.244927, -0.5427043, 1, 0.9882353, 0, 1,
-0.8877634, 0.8113858, -0.9747202, 1, 0.9960784, 0, 1,
-0.8815235, -1.799997, -3.703368, 0.9960784, 1, 0, 1,
-0.8800674, -1.475326, -2.768549, 0.9921569, 1, 0, 1,
-0.8766093, 0.5464666, -0.7123571, 0.9843137, 1, 0, 1,
-0.8751516, -0.3796498, -1.922073, 0.9803922, 1, 0, 1,
-0.8748575, 0.1010401, -3.043581, 0.972549, 1, 0, 1,
-0.8722697, -0.6650184, -1.283165, 0.9686275, 1, 0, 1,
-0.8700669, 1.012431, -1.103941, 0.9607843, 1, 0, 1,
-0.8671345, 1.751665, -1.030403, 0.9568627, 1, 0, 1,
-0.8650566, 0.5600444, -0.3784511, 0.9490196, 1, 0, 1,
-0.8609129, 1.482616, -0.2448271, 0.945098, 1, 0, 1,
-0.8591086, 0.1651726, -1.167414, 0.9372549, 1, 0, 1,
-0.8517823, 1.60402, -1.353124, 0.9333333, 1, 0, 1,
-0.8484987, -0.5504737, -1.323541, 0.9254902, 1, 0, 1,
-0.8456202, 0.2763741, 0.267407, 0.9215686, 1, 0, 1,
-0.844818, -1.181565, -1.94517, 0.9137255, 1, 0, 1,
-0.8442978, -0.114191, -2.86971, 0.9098039, 1, 0, 1,
-0.8404183, 0.7855667, -1.012757, 0.9019608, 1, 0, 1,
-0.8324767, -0.4197156, -1.280377, 0.8941177, 1, 0, 1,
-0.8310704, -1.733032, -3.84461, 0.8901961, 1, 0, 1,
-0.8154194, -2.597624, -1.55154, 0.8823529, 1, 0, 1,
-0.8151772, -0.3970606, -2.3153, 0.8784314, 1, 0, 1,
-0.8130839, -0.4644008, -2.307975, 0.8705882, 1, 0, 1,
-0.8097675, -1.68871, -0.9637488, 0.8666667, 1, 0, 1,
-0.8088548, -0.1244045, -1.496871, 0.8588235, 1, 0, 1,
-0.7983624, -1.02057, -3.252858, 0.854902, 1, 0, 1,
-0.796585, -0.5098671, -3.367255, 0.8470588, 1, 0, 1,
-0.7934246, 2.308727, -1.971452, 0.8431373, 1, 0, 1,
-0.7888505, -1.102316, -3.966172, 0.8352941, 1, 0, 1,
-0.788802, 0.01935171, 0.4935943, 0.8313726, 1, 0, 1,
-0.7848623, 0.7541735, -2.655848, 0.8235294, 1, 0, 1,
-0.7847371, -0.03315514, 0.142283, 0.8196079, 1, 0, 1,
-0.7844154, -0.8728762, -3.792066, 0.8117647, 1, 0, 1,
-0.772507, -0.8770418, -2.905914, 0.8078431, 1, 0, 1,
-0.7688673, 1.282702, 1.221875, 0.8, 1, 0, 1,
-0.7684819, 0.02831939, -1.808275, 0.7921569, 1, 0, 1,
-0.7658876, -0.05505075, -1.675343, 0.7882353, 1, 0, 1,
-0.7644898, -0.3537885, -1.41596, 0.7803922, 1, 0, 1,
-0.7605237, -0.1600541, -1.219177, 0.7764706, 1, 0, 1,
-0.7603588, 0.1760231, -2.17856, 0.7686275, 1, 0, 1,
-0.7598398, 2.336597, 0.2147669, 0.7647059, 1, 0, 1,
-0.7564373, -0.9258996, -0.9340562, 0.7568628, 1, 0, 1,
-0.7525321, -0.5916126, -1.665954, 0.7529412, 1, 0, 1,
-0.7499403, 0.8087711, -0.4794179, 0.7450981, 1, 0, 1,
-0.7424667, 0.351445, -3.336224, 0.7411765, 1, 0, 1,
-0.7410578, 1.481614, 0.106868, 0.7333333, 1, 0, 1,
-0.7391822, -0.4540386, -1.771331, 0.7294118, 1, 0, 1,
-0.7367453, 0.9054146, -0.5854682, 0.7215686, 1, 0, 1,
-0.7318027, 0.1328758, -1.168504, 0.7176471, 1, 0, 1,
-0.7302595, 0.5098302, -1.166256, 0.7098039, 1, 0, 1,
-0.7289896, -0.1917741, -0.7443227, 0.7058824, 1, 0, 1,
-0.7240208, -0.07783782, -4.104574, 0.6980392, 1, 0, 1,
-0.7206951, 0.2892393, -2.224956, 0.6901961, 1, 0, 1,
-0.7196587, -1.234727, -3.707324, 0.6862745, 1, 0, 1,
-0.7153153, 0.6446488, 1.047823, 0.6784314, 1, 0, 1,
-0.7122213, 0.5272, -0.9146814, 0.6745098, 1, 0, 1,
-0.7118181, -0.6251867, 0.06846413, 0.6666667, 1, 0, 1,
-0.7100648, -0.7539181, -1.516528, 0.6627451, 1, 0, 1,
-0.7029212, 0.2303435, 0.2316373, 0.654902, 1, 0, 1,
-0.7020288, 0.08750269, -0.5969584, 0.6509804, 1, 0, 1,
-0.6979858, -1.441437, -2.249736, 0.6431373, 1, 0, 1,
-0.6973535, -0.124487, -1.474886, 0.6392157, 1, 0, 1,
-0.6957812, 2.985862, 0.5111223, 0.6313726, 1, 0, 1,
-0.695741, -0.5271021, -1.174646, 0.627451, 1, 0, 1,
-0.6957269, -1.816531, -3.740678, 0.6196079, 1, 0, 1,
-0.6953647, -0.2639934, -2.038573, 0.6156863, 1, 0, 1,
-0.6949637, 0.0593801, -0.4582958, 0.6078432, 1, 0, 1,
-0.6948475, 0.4614844, -0.7555284, 0.6039216, 1, 0, 1,
-0.6942531, -2.283463, -3.188295, 0.5960785, 1, 0, 1,
-0.6886585, 0.5619646, -2.813692, 0.5882353, 1, 0, 1,
-0.681446, 1.189127, -0.8262309, 0.5843138, 1, 0, 1,
-0.6814333, -1.046968, -3.476654, 0.5764706, 1, 0, 1,
-0.6809207, 0.3416245, -1.683632, 0.572549, 1, 0, 1,
-0.6769924, -1.0978, -2.780708, 0.5647059, 1, 0, 1,
-0.6732697, 0.7836949, -2.409457, 0.5607843, 1, 0, 1,
-0.6717802, -0.4334203, -2.523071, 0.5529412, 1, 0, 1,
-0.667716, -0.1100863, -0.63798, 0.5490196, 1, 0, 1,
-0.6673567, 1.675321, -0.2471974, 0.5411765, 1, 0, 1,
-0.6665598, -0.2182923, -2.080255, 0.5372549, 1, 0, 1,
-0.6643848, 0.9409942, 1.543492, 0.5294118, 1, 0, 1,
-0.661449, 0.316707, -0.8111004, 0.5254902, 1, 0, 1,
-0.6562216, -0.3035005, -3.073431, 0.5176471, 1, 0, 1,
-0.6502857, 1.757602, 1.513203, 0.5137255, 1, 0, 1,
-0.6466545, -1.230354, -4.214347, 0.5058824, 1, 0, 1,
-0.6409385, 1.309362, 0.3206883, 0.5019608, 1, 0, 1,
-0.6368247, 0.3423294, -0.09117395, 0.4941176, 1, 0, 1,
-0.6366046, -0.9757101, -1.455725, 0.4862745, 1, 0, 1,
-0.6347474, -0.8651366, -3.409176, 0.4823529, 1, 0, 1,
-0.6312768, 0.2983784, -1.01004, 0.4745098, 1, 0, 1,
-0.6310963, -0.2871847, -2.006517, 0.4705882, 1, 0, 1,
-0.6260719, 1.113591, -0.7646807, 0.4627451, 1, 0, 1,
-0.6251249, -0.5738679, -2.954708, 0.4588235, 1, 0, 1,
-0.6232771, 0.7972946, -0.5809273, 0.4509804, 1, 0, 1,
-0.6215189, -2.220174, -2.665359, 0.4470588, 1, 0, 1,
-0.6214034, -0.8877894, -0.1833537, 0.4392157, 1, 0, 1,
-0.6100694, -0.1217148, -2.389824, 0.4352941, 1, 0, 1,
-0.6077015, -0.06939222, -1.614368, 0.427451, 1, 0, 1,
-0.6002393, 0.306906, -2.460091, 0.4235294, 1, 0, 1,
-0.5974541, 0.3517257, -0.5945275, 0.4156863, 1, 0, 1,
-0.5878313, 0.7479425, -0.1657778, 0.4117647, 1, 0, 1,
-0.5863521, 1.797209, -1.846782, 0.4039216, 1, 0, 1,
-0.5859799, -1.563667, -2.604577, 0.3960784, 1, 0, 1,
-0.5827901, 0.4111873, 0.5546673, 0.3921569, 1, 0, 1,
-0.5814377, -0.08916542, -1.36774, 0.3843137, 1, 0, 1,
-0.5782515, 1.335958, 0.2115692, 0.3803922, 1, 0, 1,
-0.5723968, -0.3141653, -2.919297, 0.372549, 1, 0, 1,
-0.5695937, 0.1534683, -1.728775, 0.3686275, 1, 0, 1,
-0.5684193, 2.005057, -0.6501454, 0.3607843, 1, 0, 1,
-0.5678682, -1.451053, -2.364938, 0.3568628, 1, 0, 1,
-0.5668378, -0.8072979, -2.19157, 0.3490196, 1, 0, 1,
-0.5663681, -0.918065, 0.8405439, 0.345098, 1, 0, 1,
-0.56156, -0.3645821, -1.214372, 0.3372549, 1, 0, 1,
-0.5610919, -1.897935, -3.588528, 0.3333333, 1, 0, 1,
-0.5601623, 0.03052169, -1.152917, 0.3254902, 1, 0, 1,
-0.5596356, -0.5392869, -2.736507, 0.3215686, 1, 0, 1,
-0.5594317, -0.9797429, -2.149708, 0.3137255, 1, 0, 1,
-0.551613, -0.4900124, -3.767738, 0.3098039, 1, 0, 1,
-0.5499107, 1.223665, -1.093257, 0.3019608, 1, 0, 1,
-0.5366881, -0.4092466, -2.377151, 0.2941177, 1, 0, 1,
-0.5363415, -0.8359036, -1.313313, 0.2901961, 1, 0, 1,
-0.5313639, -1.202553, -1.670949, 0.282353, 1, 0, 1,
-0.5305437, 0.6556528, -1.463453, 0.2784314, 1, 0, 1,
-0.5291693, 1.698314, 0.5871482, 0.2705882, 1, 0, 1,
-0.5262402, -2.170996, -2.221754, 0.2666667, 1, 0, 1,
-0.5253096, 0.636921, -0.1433837, 0.2588235, 1, 0, 1,
-0.5242393, -0.6287193, -2.438345, 0.254902, 1, 0, 1,
-0.5214795, 0.1393499, -1.221026, 0.2470588, 1, 0, 1,
-0.5206146, 2.914781, -1.453973, 0.2431373, 1, 0, 1,
-0.5166593, 0.3418576, 0.6340353, 0.2352941, 1, 0, 1,
-0.5077138, 0.04840621, -2.136147, 0.2313726, 1, 0, 1,
-0.5009731, 0.5181396, -0.2663941, 0.2235294, 1, 0, 1,
-0.4966664, 1.12482, -1.810053, 0.2196078, 1, 0, 1,
-0.4888798, 0.1820568, -2.379426, 0.2117647, 1, 0, 1,
-0.4887546, 0.2396884, -1.156356, 0.2078431, 1, 0, 1,
-0.4858047, -1.028423, -2.086052, 0.2, 1, 0, 1,
-0.4794801, -0.6624746, -2.685938, 0.1921569, 1, 0, 1,
-0.4780603, 0.1119536, 0.2134826, 0.1882353, 1, 0, 1,
-0.4773574, 1.336394, 0.8749244, 0.1803922, 1, 0, 1,
-0.4763371, -0.4065758, -2.152384, 0.1764706, 1, 0, 1,
-0.4692292, -0.5562467, -1.732699, 0.1686275, 1, 0, 1,
-0.4666545, -1.26901, -4.511709, 0.1647059, 1, 0, 1,
-0.4661309, -0.8782933, -2.359726, 0.1568628, 1, 0, 1,
-0.4651321, -0.8409652, -2.010494, 0.1529412, 1, 0, 1,
-0.4650586, 1.313284, -0.9065575, 0.145098, 1, 0, 1,
-0.462414, 0.06618357, -1.488379, 0.1411765, 1, 0, 1,
-0.456925, 0.6422634, 0.6731176, 0.1333333, 1, 0, 1,
-0.4535584, -0.07100594, -2.270693, 0.1294118, 1, 0, 1,
-0.4461266, 0.28682, -2.260026, 0.1215686, 1, 0, 1,
-0.4460043, -1.112649, -2.835109, 0.1176471, 1, 0, 1,
-0.4430933, -0.2902866, -3.22406, 0.1098039, 1, 0, 1,
-0.4391495, -0.4669526, -1.939115, 0.1058824, 1, 0, 1,
-0.4371265, 0.6872825, 0.3180733, 0.09803922, 1, 0, 1,
-0.4336069, 1.225775, -0.3669696, 0.09019608, 1, 0, 1,
-0.4311716, -0.7393892, -1.822074, 0.08627451, 1, 0, 1,
-0.4272452, 0.7211708, -0.6026723, 0.07843138, 1, 0, 1,
-0.4269305, -0.9377136, -1.750922, 0.07450981, 1, 0, 1,
-0.4231246, 1.936826, -0.1679487, 0.06666667, 1, 0, 1,
-0.4173924, -0.5475355, -1.67815, 0.0627451, 1, 0, 1,
-0.4154866, 0.007609999, -2.862772, 0.05490196, 1, 0, 1,
-0.4137181, -0.3522321, -1.240388, 0.05098039, 1, 0, 1,
-0.4096934, -0.9620546, -1.427706, 0.04313726, 1, 0, 1,
-0.408154, 0.3256232, -3.236929, 0.03921569, 1, 0, 1,
-0.3999349, -0.7685992, -1.018213, 0.03137255, 1, 0, 1,
-0.3991738, -0.6903014, -3.139724, 0.02745098, 1, 0, 1,
-0.39873, -1.725251, -3.657011, 0.01960784, 1, 0, 1,
-0.3972431, -0.9137799, -3.359984, 0.01568628, 1, 0, 1,
-0.3960379, -1.504398, -3.312135, 0.007843138, 1, 0, 1,
-0.3934309, -0.4043807, -1.80589, 0.003921569, 1, 0, 1,
-0.3910281, -2.300719, -1.862004, 0, 1, 0.003921569, 1,
-0.3870743, -1.299568, -1.467937, 0, 1, 0.01176471, 1,
-0.3835407, -0.2096373, -3.090192, 0, 1, 0.01568628, 1,
-0.3824438, 1.057916, -0.5131116, 0, 1, 0.02352941, 1,
-0.3795551, -0.4799718, -3.436253, 0, 1, 0.02745098, 1,
-0.3788082, -0.1347449, -3.074455, 0, 1, 0.03529412, 1,
-0.3709532, -1.165513, -2.362071, 0, 1, 0.03921569, 1,
-0.3690472, 0.7996282, -1.082635, 0, 1, 0.04705882, 1,
-0.3689861, -0.1195168, -1.261179, 0, 1, 0.05098039, 1,
-0.3677224, -0.7310793, -2.468377, 0, 1, 0.05882353, 1,
-0.3654537, 2.776892, -0.1714458, 0, 1, 0.0627451, 1,
-0.3647148, -0.6874804, -2.57102, 0, 1, 0.07058824, 1,
-0.3597615, -1.357568, -4.06361, 0, 1, 0.07450981, 1,
-0.35821, -0.3094579, -3.16369, 0, 1, 0.08235294, 1,
-0.3571617, -1.740782, -3.875962, 0, 1, 0.08627451, 1,
-0.3561265, 0.5077458, -1.580912, 0, 1, 0.09411765, 1,
-0.355037, 1.947492, -0.3218588, 0, 1, 0.1019608, 1,
-0.354634, 1.461197, 1.995732, 0, 1, 0.1058824, 1,
-0.3512874, 1.097471, -1.773747, 0, 1, 0.1137255, 1,
-0.3429742, -0.8647012, -3.490505, 0, 1, 0.1176471, 1,
-0.342491, 1.023662, 2.413927, 0, 1, 0.1254902, 1,
-0.3423146, 0.8329548, -0.4149766, 0, 1, 0.1294118, 1,
-0.3390585, -1.110381, -2.870364, 0, 1, 0.1372549, 1,
-0.3279226, 0.7543474, -1.458484, 0, 1, 0.1411765, 1,
-0.3266875, -0.1945749, -1.996601, 0, 1, 0.1490196, 1,
-0.3232232, -0.1774674, -2.638726, 0, 1, 0.1529412, 1,
-0.3199639, -1.370455, -3.172877, 0, 1, 0.1607843, 1,
-0.3197916, -0.647145, -1.821994, 0, 1, 0.1647059, 1,
-0.3151246, 0.4764149, 0.6383903, 0, 1, 0.172549, 1,
-0.3139682, -0.7093862, -2.924191, 0, 1, 0.1764706, 1,
-0.3120256, 1.1598, -1.268894, 0, 1, 0.1843137, 1,
-0.3118562, 0.2908145, -0.1322438, 0, 1, 0.1882353, 1,
-0.3095396, -1.345181, -2.731122, 0, 1, 0.1960784, 1,
-0.3058147, -1.781078, -2.22174, 0, 1, 0.2039216, 1,
-0.3044249, -0.9343356, -3.301685, 0, 1, 0.2078431, 1,
-0.3001185, -0.2952436, -2.351703, 0, 1, 0.2156863, 1,
-0.2951272, 0.6184355, -0.1587934, 0, 1, 0.2196078, 1,
-0.2913667, 0.7708461, -1.858447, 0, 1, 0.227451, 1,
-0.2884824, -0.3970615, -2.558959, 0, 1, 0.2313726, 1,
-0.2867061, 0.2360498, -1.459818, 0, 1, 0.2392157, 1,
-0.284011, 1.069414, 0.3336938, 0, 1, 0.2431373, 1,
-0.2816633, 0.4548323, 0.4220647, 0, 1, 0.2509804, 1,
-0.2761881, -2.408769, -2.186105, 0, 1, 0.254902, 1,
-0.2729897, -1.250135, -2.113425, 0, 1, 0.2627451, 1,
-0.2711468, 1.171551, -0.0211845, 0, 1, 0.2666667, 1,
-0.2701966, 0.261317, -1.260334, 0, 1, 0.2745098, 1,
-0.2685885, 1.658583, 0.1318865, 0, 1, 0.2784314, 1,
-0.2681989, 0.6271632, -0.7776368, 0, 1, 0.2862745, 1,
-0.2665957, -1.794284, -3.30412, 0, 1, 0.2901961, 1,
-0.2650619, -1.139836, -3.226688, 0, 1, 0.2980392, 1,
-0.2640748, -1.188021, -2.489511, 0, 1, 0.3058824, 1,
-0.2630592, -1.089749, -2.531207, 0, 1, 0.3098039, 1,
-0.2607659, -0.5552034, -2.131091, 0, 1, 0.3176471, 1,
-0.257853, -1.174677, -2.830434, 0, 1, 0.3215686, 1,
-0.2560699, 0.5669349, 0.4296381, 0, 1, 0.3294118, 1,
-0.2539265, -0.8280885, -1.90644, 0, 1, 0.3333333, 1,
-0.2535822, -0.28684, -3.640982, 0, 1, 0.3411765, 1,
-0.2484338, -0.5127499, -2.466855, 0, 1, 0.345098, 1,
-0.2480668, -0.08495814, -2.249213, 0, 1, 0.3529412, 1,
-0.2457068, 0.2371801, 0.004659858, 0, 1, 0.3568628, 1,
-0.2419365, 0.544526, 1.091287, 0, 1, 0.3647059, 1,
-0.2342321, 1.088408, 1.597384, 0, 1, 0.3686275, 1,
-0.2258224, 1.530943, -1.16411, 0, 1, 0.3764706, 1,
-0.2207024, 1.985742, 0.8393106, 0, 1, 0.3803922, 1,
-0.2151461, -0.05545428, -1.643201, 0, 1, 0.3882353, 1,
-0.2132468, 0.8686165, -0.5835344, 0, 1, 0.3921569, 1,
-0.2102052, 1.224948, 0.4175433, 0, 1, 0.4, 1,
-0.2060185, -0.3761664, -2.911691, 0, 1, 0.4078431, 1,
-0.2056031, 0.1368049, -0.07682049, 0, 1, 0.4117647, 1,
-0.2043431, -0.001889948, -4.037192, 0, 1, 0.4196078, 1,
-0.1968163, -0.4003445, -1.955962, 0, 1, 0.4235294, 1,
-0.1967365, 0.5867009, 0.7548718, 0, 1, 0.4313726, 1,
-0.1966391, -0.04074977, -1.567948, 0, 1, 0.4352941, 1,
-0.1956116, -0.3580949, -3.267948, 0, 1, 0.4431373, 1,
-0.1941804, -0.1491842, -3.213218, 0, 1, 0.4470588, 1,
-0.1934425, -0.3600476, -3.592143, 0, 1, 0.454902, 1,
-0.1926483, -0.6748102, -1.648056, 0, 1, 0.4588235, 1,
-0.1924149, 0.1969242, -1.78318, 0, 1, 0.4666667, 1,
-0.1921094, 0.01636998, -1.668538, 0, 1, 0.4705882, 1,
-0.1867072, 1.44301, 0.5585962, 0, 1, 0.4784314, 1,
-0.1864287, 0.4787096, -0.07166821, 0, 1, 0.4823529, 1,
-0.1857101, 1.910566, 0.9465906, 0, 1, 0.4901961, 1,
-0.1848287, -0.6691225, -3.390338, 0, 1, 0.4941176, 1,
-0.1823393, -0.8538337, -2.480455, 0, 1, 0.5019608, 1,
-0.1806423, 0.2149759, -0.4355296, 0, 1, 0.509804, 1,
-0.1800375, -0.2219852, -3.636025, 0, 1, 0.5137255, 1,
-0.1763118, -0.873568, -5.386433, 0, 1, 0.5215687, 1,
-0.1732771, 0.3530812, 0.00901542, 0, 1, 0.5254902, 1,
-0.1729762, 0.3356869, 0.2451221, 0, 1, 0.5333334, 1,
-0.1724544, 1.362708, -0.2884293, 0, 1, 0.5372549, 1,
-0.1701804, -2.302494, -3.931097, 0, 1, 0.5450981, 1,
-0.1680526, 0.007533113, -0.5761002, 0, 1, 0.5490196, 1,
-0.1677799, 0.5152065, -1.744636, 0, 1, 0.5568628, 1,
-0.1668467, 1.527731, -1.39422, 0, 1, 0.5607843, 1,
-0.1653317, -1.739522, -3.699486, 0, 1, 0.5686275, 1,
-0.1604107, 0.9280642, 2.726071, 0, 1, 0.572549, 1,
-0.1568051, 0.2457005, -1.584105, 0, 1, 0.5803922, 1,
-0.147565, 0.3388174, -1.050887, 0, 1, 0.5843138, 1,
-0.1446319, -0.6468134, -0.8521635, 0, 1, 0.5921569, 1,
-0.1443243, -0.8493937, -2.635967, 0, 1, 0.5960785, 1,
-0.1414599, 0.952265, -0.3167051, 0, 1, 0.6039216, 1,
-0.1407675, -1.41633, -2.434547, 0, 1, 0.6117647, 1,
-0.1333111, 0.06944584, 0.8254141, 0, 1, 0.6156863, 1,
-0.1261188, -0.4472644, -2.090974, 0, 1, 0.6235294, 1,
-0.1217561, 0.2457413, 1.341531, 0, 1, 0.627451, 1,
-0.1183356, 0.9891498, -1.56568, 0, 1, 0.6352941, 1,
-0.1169539, 0.3778411, 0.810453, 0, 1, 0.6392157, 1,
-0.1159988, 0.7028251, -0.6036668, 0, 1, 0.6470588, 1,
-0.1138591, -1.762868, -3.48099, 0, 1, 0.6509804, 1,
-0.1071956, 0.6984388, -0.5847048, 0, 1, 0.6588235, 1,
-0.1057988, -0.2219076, -2.812152, 0, 1, 0.6627451, 1,
-0.1049035, 1.297182, 1.457478, 0, 1, 0.6705883, 1,
-0.0997922, -0.3019048, -3.547648, 0, 1, 0.6745098, 1,
-0.09768458, -0.6947657, -3.09944, 0, 1, 0.682353, 1,
-0.097051, -1.256024, -2.285534, 0, 1, 0.6862745, 1,
-0.09398044, 1.340987, 0.803225, 0, 1, 0.6941177, 1,
-0.09225416, -0.7802576, -3.303144, 0, 1, 0.7019608, 1,
-0.08942723, 0.4090163, 0.8649392, 0, 1, 0.7058824, 1,
-0.08873245, -0.6518376, -4.800474, 0, 1, 0.7137255, 1,
-0.08426099, -0.762974, -3.334785, 0, 1, 0.7176471, 1,
-0.08305178, -0.7079096, -2.167491, 0, 1, 0.7254902, 1,
-0.08218891, 2.099617, 0.3593344, 0, 1, 0.7294118, 1,
-0.07522788, 0.4830264, -0.04615845, 0, 1, 0.7372549, 1,
-0.07231446, 0.5185329, 0.2624624, 0, 1, 0.7411765, 1,
-0.0705355, 0.1759651, -0.01235967, 0, 1, 0.7490196, 1,
-0.07048742, 3.116657, 1.744867, 0, 1, 0.7529412, 1,
-0.06994982, -0.2121055, -2.842416, 0, 1, 0.7607843, 1,
-0.06593766, 0.02542512, -0.9930157, 0, 1, 0.7647059, 1,
-0.06289656, 0.8594001, 0.4788168, 0, 1, 0.772549, 1,
-0.06212446, -0.6368502, -3.149733, 0, 1, 0.7764706, 1,
-0.05951893, -1.710314, -1.843312, 0, 1, 0.7843137, 1,
-0.05934386, 0.9646679, 0.5407937, 0, 1, 0.7882353, 1,
-0.05670141, -1.885331, -2.458808, 0, 1, 0.7960784, 1,
-0.05448284, 1.273786, -0.7832349, 0, 1, 0.8039216, 1,
-0.05245131, -0.2796597, -1.961284, 0, 1, 0.8078431, 1,
-0.05137046, 0.4489299, 0.9437691, 0, 1, 0.8156863, 1,
-0.04790705, -0.2417955, -2.636042, 0, 1, 0.8196079, 1,
-0.04211003, -0.07175838, -1.971254, 0, 1, 0.827451, 1,
-0.04205513, -0.1158465, -2.414652, 0, 1, 0.8313726, 1,
-0.04015711, 0.5415895, 0.414743, 0, 1, 0.8392157, 1,
-0.0366172, -0.7161139, -2.093497, 0, 1, 0.8431373, 1,
-0.03564287, -0.6244445, -3.707374, 0, 1, 0.8509804, 1,
-0.03458504, -0.5854324, -3.887831, 0, 1, 0.854902, 1,
-0.03266429, 0.5832654, 0.5607986, 0, 1, 0.8627451, 1,
-0.02485167, 0.2491475, -0.7317252, 0, 1, 0.8666667, 1,
-0.0244764, 0.5454075, 0.4790969, 0, 1, 0.8745098, 1,
-0.02292213, -0.3386351, -3.851053, 0, 1, 0.8784314, 1,
-0.01897146, 0.6826638, -0.02760115, 0, 1, 0.8862745, 1,
-0.01438422, -1.055924, -4.641136, 0, 1, 0.8901961, 1,
-0.0129313, -0.5377916, -2.246105, 0, 1, 0.8980392, 1,
-0.01179, -1.943335, -5.27982, 0, 1, 0.9058824, 1,
-0.01169795, 1.009497, 0.58609, 0, 1, 0.9098039, 1,
-0.01120068, -1.239928, -3.467933, 0, 1, 0.9176471, 1,
-0.01002458, -1.043039, -3.244214, 0, 1, 0.9215686, 1,
-0.006910255, -0.212772, -3.282867, 0, 1, 0.9294118, 1,
0.00262185, 0.2437395, -0.1553472, 0, 1, 0.9333333, 1,
0.00264622, 1.9873, 1.620509, 0, 1, 0.9411765, 1,
0.006776189, 1.071279, -0.8286002, 0, 1, 0.945098, 1,
0.01075474, -0.1203178, 3.825465, 0, 1, 0.9529412, 1,
0.01146546, 0.2432594, 1.092132, 0, 1, 0.9568627, 1,
0.01247202, -1.434258, 3.320184, 0, 1, 0.9647059, 1,
0.01343195, 1.563401, 0.5962522, 0, 1, 0.9686275, 1,
0.01628116, -0.8451234, 5.223096, 0, 1, 0.9764706, 1,
0.01717495, -0.1125043, 4.688691, 0, 1, 0.9803922, 1,
0.01922083, -0.6377999, 1.468628, 0, 1, 0.9882353, 1,
0.02227939, 0.4684568, -0.4679971, 0, 1, 0.9921569, 1,
0.02609676, 1.712958, -0.7011094, 0, 1, 1, 1,
0.03155455, 0.06211963, -0.3463205, 0, 0.9921569, 1, 1,
0.0359184, 0.2790959, 0.09803979, 0, 0.9882353, 1, 1,
0.04620093, -1.584468, 5.804046, 0, 0.9803922, 1, 1,
0.04621548, 0.5384755, 0.1594182, 0, 0.9764706, 1, 1,
0.04880147, 0.5544748, -0.04861411, 0, 0.9686275, 1, 1,
0.04929146, -1.487917, 3.472192, 0, 0.9647059, 1, 1,
0.05528001, -0.8303246, 2.442764, 0, 0.9568627, 1, 1,
0.05642432, 1.079307, 1.33427, 0, 0.9529412, 1, 1,
0.05705592, -1.33808, 3.056695, 0, 0.945098, 1, 1,
0.05866244, 1.310482, -0.1773074, 0, 0.9411765, 1, 1,
0.06072412, -0.3864563, 2.049752, 0, 0.9333333, 1, 1,
0.0623381, 1.010822, -1.395385, 0, 0.9294118, 1, 1,
0.06301612, 1.157749, 1.016767, 0, 0.9215686, 1, 1,
0.06748399, 0.7990705, 0.04951812, 0, 0.9176471, 1, 1,
0.06829441, 0.02856312, 3.023184, 0, 0.9098039, 1, 1,
0.06892542, -1.237793, 2.472559, 0, 0.9058824, 1, 1,
0.07208622, -0.5953488, 2.772545, 0, 0.8980392, 1, 1,
0.07657896, 0.9947377, 0.5979183, 0, 0.8901961, 1, 1,
0.08038188, -0.2770915, 2.639422, 0, 0.8862745, 1, 1,
0.0829846, 1.295725, -1.257453, 0, 0.8784314, 1, 1,
0.08400308, -1.872081, 2.321364, 0, 0.8745098, 1, 1,
0.08728432, 0.4441596, 1.677795, 0, 0.8666667, 1, 1,
0.09119688, -0.1831488, 3.046392, 0, 0.8627451, 1, 1,
0.09185716, 0.6836812, -1.005913, 0, 0.854902, 1, 1,
0.09405962, -0.5764781, 4.122537, 0, 0.8509804, 1, 1,
0.09519032, 0.2414498, -0.1569125, 0, 0.8431373, 1, 1,
0.09601846, 0.3678015, 1.70204, 0, 0.8392157, 1, 1,
0.09616655, -0.002764711, 0.2325855, 0, 0.8313726, 1, 1,
0.0985719, -0.4153192, 0.66715, 0, 0.827451, 1, 1,
0.09908578, -0.3999886, 2.847939, 0, 0.8196079, 1, 1,
0.1025172, -1.000627, 2.143126, 0, 0.8156863, 1, 1,
0.1066405, -0.3872443, 3.096769, 0, 0.8078431, 1, 1,
0.1073783, -1.785412, 5.868608, 0, 0.8039216, 1, 1,
0.107991, 0.5244581, -1.160733, 0, 0.7960784, 1, 1,
0.1086784, 0.1557694, -0.4078692, 0, 0.7882353, 1, 1,
0.1104415, 0.3077693, -0.9119049, 0, 0.7843137, 1, 1,
0.1144367, -0.3189022, 3.218486, 0, 0.7764706, 1, 1,
0.1147501, -0.5262673, 2.275055, 0, 0.772549, 1, 1,
0.1248365, 0.08507617, 0.08156192, 0, 0.7647059, 1, 1,
0.1278978, 1.925455, -1.55523, 0, 0.7607843, 1, 1,
0.1299129, 0.08439191, 0.1450631, 0, 0.7529412, 1, 1,
0.1308717, -0.957428, 2.545947, 0, 0.7490196, 1, 1,
0.1339814, 0.1945394, 1.479292, 0, 0.7411765, 1, 1,
0.137989, 0.0589844, 0.1762369, 0, 0.7372549, 1, 1,
0.1386878, -0.04742716, 2.641168, 0, 0.7294118, 1, 1,
0.1393252, 0.4085822, -0.08876763, 0, 0.7254902, 1, 1,
0.1404311, -1.077369, 4.060154, 0, 0.7176471, 1, 1,
0.1533347, 0.5419224, 1.244695, 0, 0.7137255, 1, 1,
0.1545687, 2.072799, 0.01418678, 0, 0.7058824, 1, 1,
0.1558876, -0.2527093, 1.805159, 0, 0.6980392, 1, 1,
0.1568137, -0.7513059, 2.690485, 0, 0.6941177, 1, 1,
0.1574558, 1.231983, 0.2303224, 0, 0.6862745, 1, 1,
0.1578223, -1.671314, 3.188934, 0, 0.682353, 1, 1,
0.1579774, 1.303717, 0.563798, 0, 0.6745098, 1, 1,
0.1631554, 0.570563, -1.121883, 0, 0.6705883, 1, 1,
0.1631837, 1.482733, -0.3226191, 0, 0.6627451, 1, 1,
0.1664769, -0.8704656, 3.903318, 0, 0.6588235, 1, 1,
0.1680051, 0.6708413, -0.1250993, 0, 0.6509804, 1, 1,
0.1693436, -0.04131745, 0.7011886, 0, 0.6470588, 1, 1,
0.1726996, 0.9812186, -2.720128, 0, 0.6392157, 1, 1,
0.1737145, 0.2384315, -0.3394834, 0, 0.6352941, 1, 1,
0.181644, -1.698249, 2.389881, 0, 0.627451, 1, 1,
0.1897272, 1.193009, 2.519923, 0, 0.6235294, 1, 1,
0.1924842, 0.09838323, 2.008417, 0, 0.6156863, 1, 1,
0.194179, 0.0523934, 2.423006, 0, 0.6117647, 1, 1,
0.1946477, 0.03687558, 0.9333685, 0, 0.6039216, 1, 1,
0.1957692, -0.02072806, 1.733971, 0, 0.5960785, 1, 1,
0.1983753, 0.4077483, 1.892228, 0, 0.5921569, 1, 1,
0.2045909, 0.6093499, 0.2683548, 0, 0.5843138, 1, 1,
0.2072958, -0.4075315, 3.022011, 0, 0.5803922, 1, 1,
0.2105525, -1.411687, 0.5543407, 0, 0.572549, 1, 1,
0.2131621, -0.4361951, 2.124317, 0, 0.5686275, 1, 1,
0.2141277, 0.6710629, -0.06851593, 0, 0.5607843, 1, 1,
0.2163736, -0.6732107, 3.402249, 0, 0.5568628, 1, 1,
0.2173631, -0.07478169, 1.987506, 0, 0.5490196, 1, 1,
0.2184481, 0.7523921, 0.5036905, 0, 0.5450981, 1, 1,
0.2184546, 1.215808, -0.2528455, 0, 0.5372549, 1, 1,
0.2215693, 0.8671113, 0.5069031, 0, 0.5333334, 1, 1,
0.2246613, 0.4944814, 0.2182443, 0, 0.5254902, 1, 1,
0.2262507, -0.5644931, 2.777673, 0, 0.5215687, 1, 1,
0.226463, -0.7023068, 4.048857, 0, 0.5137255, 1, 1,
0.2287357, 1.197128, -0.4913594, 0, 0.509804, 1, 1,
0.230692, 0.8542446, 1.507497, 0, 0.5019608, 1, 1,
0.2344528, 0.7035347, 0.5616505, 0, 0.4941176, 1, 1,
0.2410091, -0.9854584, 1.632052, 0, 0.4901961, 1, 1,
0.2423025, 1.852828, -0.671399, 0, 0.4823529, 1, 1,
0.2504889, 1.977864, 0.4817041, 0, 0.4784314, 1, 1,
0.2514322, -1.620959, 3.895876, 0, 0.4705882, 1, 1,
0.2547041, 1.212066, 1.697408, 0, 0.4666667, 1, 1,
0.2547524, -0.8212001, 2.193452, 0, 0.4588235, 1, 1,
0.2579215, -0.2454142, 1.471439, 0, 0.454902, 1, 1,
0.2588215, 0.2554943, 0.8299837, 0, 0.4470588, 1, 1,
0.2613655, 0.05955544, 1.593605, 0, 0.4431373, 1, 1,
0.262309, 1.058605, -0.4614111, 0, 0.4352941, 1, 1,
0.2637126, -1.343469, 3.853546, 0, 0.4313726, 1, 1,
0.2669429, -0.3270974, 5.887508, 0, 0.4235294, 1, 1,
0.2702765, -0.7140945, 2.135412, 0, 0.4196078, 1, 1,
0.2702847, -2.120918, 0.9934303, 0, 0.4117647, 1, 1,
0.2762272, 0.7713149, 0.05856895, 0, 0.4078431, 1, 1,
0.2772435, -1.463495, 3.313681, 0, 0.4, 1, 1,
0.2781716, 1.212559, 0.4337074, 0, 0.3921569, 1, 1,
0.2833114, -0.2736169, 1.590255, 0, 0.3882353, 1, 1,
0.2841556, 0.2943707, 0.07002304, 0, 0.3803922, 1, 1,
0.2853588, -0.6814021, 1.416482, 0, 0.3764706, 1, 1,
0.2869924, 0.3345366, -1.299984, 0, 0.3686275, 1, 1,
0.2888835, -1.116823, 2.050611, 0, 0.3647059, 1, 1,
0.2928058, -1.175847, 1.158657, 0, 0.3568628, 1, 1,
0.2937302, -1.566841, 2.690891, 0, 0.3529412, 1, 1,
0.2946784, -0.3437717, 3.084946, 0, 0.345098, 1, 1,
0.2968248, -1.398087, 3.728364, 0, 0.3411765, 1, 1,
0.3023301, -0.9979222, 1.75554, 0, 0.3333333, 1, 1,
0.3041449, 1.309609, 0.1617803, 0, 0.3294118, 1, 1,
0.3050081, -1.529187, 3.164141, 0, 0.3215686, 1, 1,
0.3093797, -0.002751067, 2.590419, 0, 0.3176471, 1, 1,
0.3111333, -0.742133, 3.640342, 0, 0.3098039, 1, 1,
0.3121808, -0.4066586, 3.686738, 0, 0.3058824, 1, 1,
0.3146757, 1.042614, 0.9641579, 0, 0.2980392, 1, 1,
0.3159405, 0.5655777, 1.808177, 0, 0.2901961, 1, 1,
0.3162497, -0.7548356, 3.39678, 0, 0.2862745, 1, 1,
0.318318, -0.7987736, 1.643559, 0, 0.2784314, 1, 1,
0.3206823, 0.4241499, 1.628361, 0, 0.2745098, 1, 1,
0.3222009, 0.2198555, 2.348778, 0, 0.2666667, 1, 1,
0.3229147, -0.1335952, 2.295602, 0, 0.2627451, 1, 1,
0.3236209, -1.674032, 1.574226, 0, 0.254902, 1, 1,
0.3239225, -0.5550726, 2.614628, 0, 0.2509804, 1, 1,
0.3248724, -0.5042564, 2.308305, 0, 0.2431373, 1, 1,
0.3257176, -0.6634085, 2.558331, 0, 0.2392157, 1, 1,
0.326055, 0.437811, -0.7839055, 0, 0.2313726, 1, 1,
0.3284027, -1.472049, 3.062732, 0, 0.227451, 1, 1,
0.3314859, 2.34509, 0.4998921, 0, 0.2196078, 1, 1,
0.3318564, 0.4031053, 1.482905, 0, 0.2156863, 1, 1,
0.3329898, -0.7422475, 4.447495, 0, 0.2078431, 1, 1,
0.3358773, 0.194593, 0.1262855, 0, 0.2039216, 1, 1,
0.336718, -0.2435966, 3.375851, 0, 0.1960784, 1, 1,
0.337402, 1.325695, -0.3689059, 0, 0.1882353, 1, 1,
0.3423293, -0.6302341, 2.117608, 0, 0.1843137, 1, 1,
0.3489422, -1.098754, 1.311512, 0, 0.1764706, 1, 1,
0.3504749, 0.8877923, 1.172041, 0, 0.172549, 1, 1,
0.3529076, 3.069896, 1.233894, 0, 0.1647059, 1, 1,
0.3531972, 0.3414183, 1.178806, 0, 0.1607843, 1, 1,
0.353704, -1.340023, 1.89957, 0, 0.1529412, 1, 1,
0.3601742, 0.7131198, 0.8520432, 0, 0.1490196, 1, 1,
0.3611681, 0.6913874, 1.68795, 0, 0.1411765, 1, 1,
0.3632155, -0.1024155, 1.384073, 0, 0.1372549, 1, 1,
0.3634392, -0.547841, 3.175003, 0, 0.1294118, 1, 1,
0.3639061, 1.176549, 0.08366434, 0, 0.1254902, 1, 1,
0.3667204, 0.04418977, 1.720473, 0, 0.1176471, 1, 1,
0.3693908, 1.19101, 1.430276, 0, 0.1137255, 1, 1,
0.3694633, 0.01211014, 0.1314344, 0, 0.1058824, 1, 1,
0.3699321, -0.1518319, 0.6202693, 0, 0.09803922, 1, 1,
0.3699424, -0.7735143, 2.556796, 0, 0.09411765, 1, 1,
0.3724616, -0.1108633, 1.54072, 0, 0.08627451, 1, 1,
0.3755808, 0.3466053, 0.2914398, 0, 0.08235294, 1, 1,
0.3759239, -0.2286677, 3.662537, 0, 0.07450981, 1, 1,
0.378488, -1.344607, 0.8707474, 0, 0.07058824, 1, 1,
0.378653, -0.04859469, 1.898833, 0, 0.0627451, 1, 1,
0.3818098, 1.313352, 1.324282, 0, 0.05882353, 1, 1,
0.382225, 1.926941, 0.506431, 0, 0.05098039, 1, 1,
0.3901792, 1.205744, 0.91756, 0, 0.04705882, 1, 1,
0.3918642, -1.182846, 2.834468, 0, 0.03921569, 1, 1,
0.3930658, -0.9208499, 1.434544, 0, 0.03529412, 1, 1,
0.3979218, -0.9082915, 3.279965, 0, 0.02745098, 1, 1,
0.3981295, 1.313867, -1.178263, 0, 0.02352941, 1, 1,
0.4047574, 0.08731211, 1.839581, 0, 0.01568628, 1, 1,
0.405748, -0.4859381, 4.364693, 0, 0.01176471, 1, 1,
0.4094191, 2.141605, 1.13553, 0, 0.003921569, 1, 1,
0.4113857, -0.9059445, 2.646013, 0.003921569, 0, 1, 1,
0.4146579, 0.8242531, 1.03911, 0.007843138, 0, 1, 1,
0.4173694, -0.5754169, 3.057488, 0.01568628, 0, 1, 1,
0.4194779, 0.1375771, 2.089428, 0.01960784, 0, 1, 1,
0.4202886, 0.7449377, 1.852294, 0.02745098, 0, 1, 1,
0.4245818, 0.3252371, 0.5985281, 0.03137255, 0, 1, 1,
0.424732, -1.46572, 4.655483, 0.03921569, 0, 1, 1,
0.4329761, 0.5117605, 1.398193, 0.04313726, 0, 1, 1,
0.434562, 0.6623985, 1.68745, 0.05098039, 0, 1, 1,
0.4358948, -1.028766, 3.203124, 0.05490196, 0, 1, 1,
0.4375566, -0.3535058, 2.415864, 0.0627451, 0, 1, 1,
0.4385205, -0.8001336, 0.4810204, 0.06666667, 0, 1, 1,
0.4408927, 0.7277279, 0.3912482, 0.07450981, 0, 1, 1,
0.4412612, 1.714957, 1.374973, 0.07843138, 0, 1, 1,
0.4416836, -1.458457, 3.829807, 0.08627451, 0, 1, 1,
0.4456738, 0.01427392, 1.678168, 0.09019608, 0, 1, 1,
0.4527164, -1.396385, 4.265424, 0.09803922, 0, 1, 1,
0.453712, -0.7426858, 3.804905, 0.1058824, 0, 1, 1,
0.4540579, 1.544927, -0.3920943, 0.1098039, 0, 1, 1,
0.4542263, -0.7449688, 3.591902, 0.1176471, 0, 1, 1,
0.4553287, 1.981088, 1.524741, 0.1215686, 0, 1, 1,
0.4568689, -0.7173045, 3.730766, 0.1294118, 0, 1, 1,
0.4608015, -2.378871, 4.014121, 0.1333333, 0, 1, 1,
0.4705997, 0.9052297, -0.587292, 0.1411765, 0, 1, 1,
0.4793554, 1.028738, 1.765092, 0.145098, 0, 1, 1,
0.4803506, 0.6696517, 2.466824, 0.1529412, 0, 1, 1,
0.4837301, -0.08723819, 2.224891, 0.1568628, 0, 1, 1,
0.4872007, -1.112415, 5.109859, 0.1647059, 0, 1, 1,
0.4872999, 0.3375339, 1.976001, 0.1686275, 0, 1, 1,
0.4874266, 0.405136, 1.088454, 0.1764706, 0, 1, 1,
0.4960733, -1.38916, 1.94526, 0.1803922, 0, 1, 1,
0.4963696, 0.1122004, 0.7028978, 0.1882353, 0, 1, 1,
0.502764, 0.8823242, -0.6821715, 0.1921569, 0, 1, 1,
0.5062116, -1.007063, 3.007803, 0.2, 0, 1, 1,
0.5080222, 2.098438, 1.11945, 0.2078431, 0, 1, 1,
0.5091904, 0.06459856, 1.69088, 0.2117647, 0, 1, 1,
0.5129325, 0.3861653, 0.4461834, 0.2196078, 0, 1, 1,
0.5255279, -0.4006734, 0.7149954, 0.2235294, 0, 1, 1,
0.5304301, -0.188125, 3.388941, 0.2313726, 0, 1, 1,
0.5310975, -0.03276086, 2.735567, 0.2352941, 0, 1, 1,
0.5418945, -1.432978, 1.488013, 0.2431373, 0, 1, 1,
0.5455913, 0.7874485, -1.139791, 0.2470588, 0, 1, 1,
0.549046, 1.876384, -0.03627364, 0.254902, 0, 1, 1,
0.559136, -0.6201447, 4.149335, 0.2588235, 0, 1, 1,
0.5593153, 0.7514518, -0.1075294, 0.2666667, 0, 1, 1,
0.5602368, -0.5978944, 3.148083, 0.2705882, 0, 1, 1,
0.5687549, 0.5073075, 1.694933, 0.2784314, 0, 1, 1,
0.572037, 1.24664, 1.343391, 0.282353, 0, 1, 1,
0.5727488, 1.388661, 1.266505, 0.2901961, 0, 1, 1,
0.575151, -0.6700221, 1.77635, 0.2941177, 0, 1, 1,
0.5833366, -0.7479001, 2.783355, 0.3019608, 0, 1, 1,
0.5841878, 0.2340614, 3.39667, 0.3098039, 0, 1, 1,
0.5856679, 1.976742, -0.01069669, 0.3137255, 0, 1, 1,
0.5859753, -1.222022, 3.131005, 0.3215686, 0, 1, 1,
0.5908117, 1.271147, 0.8118694, 0.3254902, 0, 1, 1,
0.5916814, 0.5469182, -0.3147104, 0.3333333, 0, 1, 1,
0.5971014, 1.15092, -0.7512456, 0.3372549, 0, 1, 1,
0.610925, -0.5847, 0.5984768, 0.345098, 0, 1, 1,
0.6116655, 0.02435391, 2.071575, 0.3490196, 0, 1, 1,
0.6129043, -0.05795237, 1.362905, 0.3568628, 0, 1, 1,
0.6159266, 0.6194015, 2.321225, 0.3607843, 0, 1, 1,
0.6233368, -0.05296241, 0.7579797, 0.3686275, 0, 1, 1,
0.6278171, -0.05811212, 1.039357, 0.372549, 0, 1, 1,
0.6302125, 2.440713, 1.372576, 0.3803922, 0, 1, 1,
0.6392936, 1.355725, 1.012153, 0.3843137, 0, 1, 1,
0.6393211, -1.178403, 1.743534, 0.3921569, 0, 1, 1,
0.642556, 0.1248563, 1.937648, 0.3960784, 0, 1, 1,
0.6451789, 0.5575302, 1.757486, 0.4039216, 0, 1, 1,
0.6469279, -0.3477616, 1.575373, 0.4117647, 0, 1, 1,
0.6548157, 0.9515358, 2.432472, 0.4156863, 0, 1, 1,
0.6568104, 0.8537177, 0.4428023, 0.4235294, 0, 1, 1,
0.6581128, -2.171914, 2.596355, 0.427451, 0, 1, 1,
0.6600822, -0.9092802, 3.292684, 0.4352941, 0, 1, 1,
0.6620069, 1.238402, 0.8682289, 0.4392157, 0, 1, 1,
0.6672449, 0.2893152, 2.688199, 0.4470588, 0, 1, 1,
0.6718107, -1.607809, 3.212099, 0.4509804, 0, 1, 1,
0.6724161, 0.7138348, 0.395813, 0.4588235, 0, 1, 1,
0.6734163, 0.4001453, 0.986707, 0.4627451, 0, 1, 1,
0.6808875, 0.2212362, 1.879078, 0.4705882, 0, 1, 1,
0.6860089, -0.03707379, 1.942722, 0.4745098, 0, 1, 1,
0.6861336, 0.5534557, 0.8892867, 0.4823529, 0, 1, 1,
0.686166, 0.6679071, -0.2766782, 0.4862745, 0, 1, 1,
0.6874528, -0.5577345, 1.561883, 0.4941176, 0, 1, 1,
0.6875983, 0.9008843, -1.938935, 0.5019608, 0, 1, 1,
0.6893151, -0.03408203, 1.274658, 0.5058824, 0, 1, 1,
0.689955, -0.5828755, 1.520981, 0.5137255, 0, 1, 1,
0.7013278, -0.4616637, 2.492923, 0.5176471, 0, 1, 1,
0.7063547, 1.529715, -0.4786255, 0.5254902, 0, 1, 1,
0.7075208, 0.8510933, -0.8521571, 0.5294118, 0, 1, 1,
0.7128474, 1.465502, 0.6251971, 0.5372549, 0, 1, 1,
0.7133458, -0.6649221, 3.61946, 0.5411765, 0, 1, 1,
0.7216487, -1.868749, 1.118776, 0.5490196, 0, 1, 1,
0.7290074, 0.2510723, -0.2165477, 0.5529412, 0, 1, 1,
0.7294942, 0.8390166, 1.675535, 0.5607843, 0, 1, 1,
0.7308171, 1.049088, 1.693436, 0.5647059, 0, 1, 1,
0.7367686, -1.473006, 3.272989, 0.572549, 0, 1, 1,
0.7401492, 1.477564, 2.418949, 0.5764706, 0, 1, 1,
0.7405839, -0.02756044, -0.2852717, 0.5843138, 0, 1, 1,
0.7425752, 1.461053, 1.74469, 0.5882353, 0, 1, 1,
0.7481474, 0.3443412, 0.6124763, 0.5960785, 0, 1, 1,
0.7501029, -0.8199862, 2.634904, 0.6039216, 0, 1, 1,
0.7512541, 0.5971995, 0.3578156, 0.6078432, 0, 1, 1,
0.7528774, 1.173588, -0.2566035, 0.6156863, 0, 1, 1,
0.7581029, -1.49846, 3.00624, 0.6196079, 0, 1, 1,
0.7593935, -1.428816, 2.65707, 0.627451, 0, 1, 1,
0.7629224, 0.6478671, -0.5635915, 0.6313726, 0, 1, 1,
0.7664115, -0.03906054, 2.017715, 0.6392157, 0, 1, 1,
0.7677782, 1.267132, 1.303591, 0.6431373, 0, 1, 1,
0.7795569, 1.35405, 0.4018437, 0.6509804, 0, 1, 1,
0.7813662, 0.901642, 0.0481408, 0.654902, 0, 1, 1,
0.7818362, -1.122449, 2.914312, 0.6627451, 0, 1, 1,
0.7820089, -1.53725, 2.524179, 0.6666667, 0, 1, 1,
0.7841712, 0.7969523, 1.550167, 0.6745098, 0, 1, 1,
0.7880171, 0.7807626, 1.625224, 0.6784314, 0, 1, 1,
0.788076, -0.8948013, 1.370946, 0.6862745, 0, 1, 1,
0.7908198, 1.508047, 0.2993673, 0.6901961, 0, 1, 1,
0.7959784, 1.724803, -0.9623806, 0.6980392, 0, 1, 1,
0.7974507, -0.6269029, 1.801148, 0.7058824, 0, 1, 1,
0.7977679, 0.9376093, 1.591306, 0.7098039, 0, 1, 1,
0.8012808, 0.5141488, 0.9868705, 0.7176471, 0, 1, 1,
0.8045436, -0.5665663, 0.3614343, 0.7215686, 0, 1, 1,
0.811628, -0.0821621, 2.618414, 0.7294118, 0, 1, 1,
0.8154367, 0.9456635, -1.08438, 0.7333333, 0, 1, 1,
0.8225474, -0.02560195, 0.7858506, 0.7411765, 0, 1, 1,
0.8233212, -0.1192584, 1.276541, 0.7450981, 0, 1, 1,
0.8251951, 0.7425298, 0.4248479, 0.7529412, 0, 1, 1,
0.8288726, 1.000695, 2.990713, 0.7568628, 0, 1, 1,
0.8348179, -0.4641053, -0.005097893, 0.7647059, 0, 1, 1,
0.8358178, 0.8240411, 1.432114, 0.7686275, 0, 1, 1,
0.837259, -1.441084, 0.9585859, 0.7764706, 0, 1, 1,
0.845768, -0.5675669, 2.908139, 0.7803922, 0, 1, 1,
0.8511088, 1.767638, -0.6715541, 0.7882353, 0, 1, 1,
0.8514622, 1.707001, 0.007930741, 0.7921569, 0, 1, 1,
0.8521147, -0.6284105, 1.080329, 0.8, 0, 1, 1,
0.8545051, 0.539656, 2.021392, 0.8078431, 0, 1, 1,
0.8563488, 0.6854298, 1.582763, 0.8117647, 0, 1, 1,
0.8575131, -0.7796451, 3.468025, 0.8196079, 0, 1, 1,
0.86461, 2.266494, 1.663171, 0.8235294, 0, 1, 1,
0.8720984, 0.4536254, 1.093251, 0.8313726, 0, 1, 1,
0.8766117, 0.3121351, 2.244637, 0.8352941, 0, 1, 1,
0.8779821, 1.291438, 0.2184209, 0.8431373, 0, 1, 1,
0.8790905, -0.9732187, 1.952681, 0.8470588, 0, 1, 1,
0.8804041, -1.951037, 3.450253, 0.854902, 0, 1, 1,
0.8833129, -0.09030788, 2.159171, 0.8588235, 0, 1, 1,
0.8840638, 0.9757878, 1.349644, 0.8666667, 0, 1, 1,
0.8894645, 1.058419, 1.674909, 0.8705882, 0, 1, 1,
0.8982884, 0.3328916, 1.30659, 0.8784314, 0, 1, 1,
0.898656, -0.5189723, 4.343829, 0.8823529, 0, 1, 1,
0.8988077, 0.5901012, -1.052721, 0.8901961, 0, 1, 1,
0.9129558, -0.793882, 1.537756, 0.8941177, 0, 1, 1,
0.9167234, 0.9504932, 0.9452642, 0.9019608, 0, 1, 1,
0.9256256, -0.814696, 3.111253, 0.9098039, 0, 1, 1,
0.929563, -0.08853684, 1.072094, 0.9137255, 0, 1, 1,
0.9302088, -0.5155246, 3.672925, 0.9215686, 0, 1, 1,
0.9306551, -0.3697893, 1.161148, 0.9254902, 0, 1, 1,
0.936201, -0.3916154, 3.735445, 0.9333333, 0, 1, 1,
0.9375403, 1.199823, -1.039663, 0.9372549, 0, 1, 1,
0.9480249, 0.4075402, 2.235482, 0.945098, 0, 1, 1,
0.9510218, 0.02574912, 2.082253, 0.9490196, 0, 1, 1,
0.9520021, 0.05940295, -0.177359, 0.9568627, 0, 1, 1,
0.9584149, -2.750615, 2.23331, 0.9607843, 0, 1, 1,
0.9642738, -0.4962877, 2.346262, 0.9686275, 0, 1, 1,
0.966114, -0.2714107, 0.5600377, 0.972549, 0, 1, 1,
0.9705909, -0.4777416, 0.5847673, 0.9803922, 0, 1, 1,
0.9749059, -0.9248137, 2.573916, 0.9843137, 0, 1, 1,
0.9757063, -0.3067989, 2.607187, 0.9921569, 0, 1, 1,
0.9836981, -0.7817725, 3.487589, 0.9960784, 0, 1, 1,
0.9880205, 0.2172208, 1.111258, 1, 0, 0.9960784, 1,
0.9891752, -1.107797, 1.053461, 1, 0, 0.9882353, 1,
0.9905591, -0.7486277, 1.051596, 1, 0, 0.9843137, 1,
0.9935459, 1.193899, -0.6902134, 1, 0, 0.9764706, 1,
0.9968517, -0.02799594, 2.113429, 1, 0, 0.972549, 1,
0.9979817, -0.3977536, 2.179743, 1, 0, 0.9647059, 1,
1.003172, -0.7306069, 0.1624724, 1, 0, 0.9607843, 1,
1.009408, -0.4248707, 1.486041, 1, 0, 0.9529412, 1,
1.009735, 0.7422227, 1.039748, 1, 0, 0.9490196, 1,
1.01597, -1.116625, 0.4125178, 1, 0, 0.9411765, 1,
1.017757, -0.463153, 3.202789, 1, 0, 0.9372549, 1,
1.023513, -0.4669018, 2.322515, 1, 0, 0.9294118, 1,
1.024423, -0.2836522, 4.201393, 1, 0, 0.9254902, 1,
1.029606, 0.1855387, 2.256185, 1, 0, 0.9176471, 1,
1.037971, -0.5373607, -0.08194159, 1, 0, 0.9137255, 1,
1.044664, 0.6050245, 0.4790195, 1, 0, 0.9058824, 1,
1.046308, -0.5853429, 1.433382, 1, 0, 0.9019608, 1,
1.04699, 0.08537444, 3.75959, 1, 0, 0.8941177, 1,
1.048104, 0.2321751, 2.544627, 1, 0, 0.8862745, 1,
1.054684, 1.013213, 1.070477e-05, 1, 0, 0.8823529, 1,
1.059134, -0.009642361, 3.681303, 1, 0, 0.8745098, 1,
1.059511, 0.3290118, 0.9093162, 1, 0, 0.8705882, 1,
1.060108, -1.765844, 4.224891, 1, 0, 0.8627451, 1,
1.060396, -0.2671171, 2.168824, 1, 0, 0.8588235, 1,
1.061014, 1.253419, 1.291271, 1, 0, 0.8509804, 1,
1.074736, 0.1878506, 0.7584183, 1, 0, 0.8470588, 1,
1.07544, -0.4296468, 0.5761128, 1, 0, 0.8392157, 1,
1.082085, -0.5322943, 2.816814, 1, 0, 0.8352941, 1,
1.085824, -1.039528, 2.965254, 1, 0, 0.827451, 1,
1.086534, -1.270648, 3.677499, 1, 0, 0.8235294, 1,
1.096319, -0.5510063, 1.473422, 1, 0, 0.8156863, 1,
1.096851, -0.2463534, 1.957791, 1, 0, 0.8117647, 1,
1.101386, 0.1018791, 0.4822409, 1, 0, 0.8039216, 1,
1.119585, -1.396524, 3.255728, 1, 0, 0.7960784, 1,
1.122089, 1.178719, 1.736112, 1, 0, 0.7921569, 1,
1.123356, -0.7158822, 2.497579, 1, 0, 0.7843137, 1,
1.125279, -0.8286041, 3.14677, 1, 0, 0.7803922, 1,
1.125657, 0.971547, 1.363234, 1, 0, 0.772549, 1,
1.125791, 1.353323, 1.339877, 1, 0, 0.7686275, 1,
1.130352, 0.5877975, 2.308459, 1, 0, 0.7607843, 1,
1.132986, -0.629731, 1.491785, 1, 0, 0.7568628, 1,
1.134997, 2.094259, -0.5366773, 1, 0, 0.7490196, 1,
1.140561, 1.17698, 1.120317, 1, 0, 0.7450981, 1,
1.144737, 0.9004689, -0.09327095, 1, 0, 0.7372549, 1,
1.148865, 0.4877495, 1.660624, 1, 0, 0.7333333, 1,
1.154904, -0.8429758, 3.167905, 1, 0, 0.7254902, 1,
1.170947, -0.9935576, 1.744902, 1, 0, 0.7215686, 1,
1.184037, -0.3957703, 2.409875, 1, 0, 0.7137255, 1,
1.191342, -0.8927519, 1.76146, 1, 0, 0.7098039, 1,
1.205886, -1.230302, 1.680558, 1, 0, 0.7019608, 1,
1.220126, -0.07182916, 0.7004244, 1, 0, 0.6941177, 1,
1.224133, 0.1183651, 1.112683, 1, 0, 0.6901961, 1,
1.231503, -1.822555, 1.214013, 1, 0, 0.682353, 1,
1.23668, -0.1244096, 1.895237, 1, 0, 0.6784314, 1,
1.238465, -0.2378516, 0.8260494, 1, 0, 0.6705883, 1,
1.238559, -0.64843, 2.01162, 1, 0, 0.6666667, 1,
1.243513, 1.527546, 0.2395158, 1, 0, 0.6588235, 1,
1.244802, 0.3734523, 2.074188, 1, 0, 0.654902, 1,
1.245285, 1.453158, 1.676439, 1, 0, 0.6470588, 1,
1.2493, -1.22534, 2.933814, 1, 0, 0.6431373, 1,
1.251288, 0.3979824, 0.2135306, 1, 0, 0.6352941, 1,
1.254981, -1.037534, 0.6921804, 1, 0, 0.6313726, 1,
1.264116, -0.8956367, 1.558274, 1, 0, 0.6235294, 1,
1.27125, -0.4200491, 2.572942, 1, 0, 0.6196079, 1,
1.289086, -0.4430789, 1.806864, 1, 0, 0.6117647, 1,
1.300729, -1.178805, 0.8946069, 1, 0, 0.6078432, 1,
1.304008, -0.7060067, 1.607946, 1, 0, 0.6, 1,
1.304498, -0.2258016, 1.564465, 1, 0, 0.5921569, 1,
1.306262, 0.3098002, -0.1764343, 1, 0, 0.5882353, 1,
1.306638, -0.1281396, 2.305076, 1, 0, 0.5803922, 1,
1.307456, -1.836649, 0.9885841, 1, 0, 0.5764706, 1,
1.315197, -1.58629, 2.711941, 1, 0, 0.5686275, 1,
1.316094, -0.6501275, 2.037398, 1, 0, 0.5647059, 1,
1.328487, -0.01068117, 3.143047, 1, 0, 0.5568628, 1,
1.334655, -0.5359432, 3.656945, 1, 0, 0.5529412, 1,
1.336115, -0.6909074, 3.050805, 1, 0, 0.5450981, 1,
1.337755, 0.4074484, 2.414042, 1, 0, 0.5411765, 1,
1.338, 1.370861, 1.175146, 1, 0, 0.5333334, 1,
1.370168, 1.527558, 0.539823, 1, 0, 0.5294118, 1,
1.371575, -0.3305207, 1.485251, 1, 0, 0.5215687, 1,
1.37488, 0.03532877, 1.804764, 1, 0, 0.5176471, 1,
1.379175, 0.7315251, 1.903892, 1, 0, 0.509804, 1,
1.387719, 1.320655, 2.448166, 1, 0, 0.5058824, 1,
1.38817, 0.8302315, 0.8728239, 1, 0, 0.4980392, 1,
1.392668, -0.3978709, 1.397265, 1, 0, 0.4901961, 1,
1.399233, -0.7952148, 2.80209, 1, 0, 0.4862745, 1,
1.407663, 0.002184035, -0.07144542, 1, 0, 0.4784314, 1,
1.414586, -0.4599242, 1.227356, 1, 0, 0.4745098, 1,
1.421217, 1.003153, -0.2665285, 1, 0, 0.4666667, 1,
1.421566, 0.2327148, 0.6989017, 1, 0, 0.4627451, 1,
1.431699, 1.65573, -0.1014284, 1, 0, 0.454902, 1,
1.448248, 1.503576, -0.6367555, 1, 0, 0.4509804, 1,
1.451156, 1.025793, 0.05818469, 1, 0, 0.4431373, 1,
1.460379, -0.5050077, 2.579761, 1, 0, 0.4392157, 1,
1.488699, -0.8994152, 2.388509, 1, 0, 0.4313726, 1,
1.497461, 1.106595, 1.912082, 1, 0, 0.427451, 1,
1.510205, -1.524406, 2.40492, 1, 0, 0.4196078, 1,
1.518255, 2.351573, 0.9793072, 1, 0, 0.4156863, 1,
1.519939, 0.8989908, 1.059734, 1, 0, 0.4078431, 1,
1.535981, 0.5359125, 3.766967, 1, 0, 0.4039216, 1,
1.538407, -0.3409151, 2.683316, 1, 0, 0.3960784, 1,
1.544564, -0.1416022, 1.070184, 1, 0, 0.3882353, 1,
1.545989, -0.3905478, 2.530903, 1, 0, 0.3843137, 1,
1.551905, -1.275214, 3.759717, 1, 0, 0.3764706, 1,
1.553079, 1.000156, 0.02890568, 1, 0, 0.372549, 1,
1.566322, -0.3632481, 1.789856, 1, 0, 0.3647059, 1,
1.574226, 0.2749041, 1.060563, 1, 0, 0.3607843, 1,
1.581533, -0.7706819, 1.482789, 1, 0, 0.3529412, 1,
1.582883, 0.7231952, 1.422798, 1, 0, 0.3490196, 1,
1.583973, 0.5899984, 1.390001, 1, 0, 0.3411765, 1,
1.587528, 0.6037122, -0.5221962, 1, 0, 0.3372549, 1,
1.600706, 0.2904088, 1.096602, 1, 0, 0.3294118, 1,
1.608761, -1.585513, 1.244166, 1, 0, 0.3254902, 1,
1.611066, -0.8175794, 2.475555, 1, 0, 0.3176471, 1,
1.613004, 0.146887, 2.091444, 1, 0, 0.3137255, 1,
1.619564, 1.284021, 2.231753, 1, 0, 0.3058824, 1,
1.627023, -1.111203, 2.241803, 1, 0, 0.2980392, 1,
1.627086, 0.08752043, 2.339101, 1, 0, 0.2941177, 1,
1.65642, 1.605915, 0.0697, 1, 0, 0.2862745, 1,
1.665138, 1.601231, 2.10297, 1, 0, 0.282353, 1,
1.667477, 0.2076546, 0.1261275, 1, 0, 0.2745098, 1,
1.676332, -0.2722506, 1.436177, 1, 0, 0.2705882, 1,
1.687983, 0.1001983, 0.4902066, 1, 0, 0.2627451, 1,
1.69679, 0.1697226, 0.9043596, 1, 0, 0.2588235, 1,
1.702865, 0.5115368, 2.1828, 1, 0, 0.2509804, 1,
1.706103, 1.697245, 1.439079, 1, 0, 0.2470588, 1,
1.724106, 0.465168, 1.392905, 1, 0, 0.2392157, 1,
1.750122, 0.1854058, 2.319792, 1, 0, 0.2352941, 1,
1.765518, 2.538753, 1.717876, 1, 0, 0.227451, 1,
1.765712, 0.674114, 3.054526, 1, 0, 0.2235294, 1,
1.808393, 1.674888, 0.7277938, 1, 0, 0.2156863, 1,
1.814588, 1.184374, 1.425504, 1, 0, 0.2117647, 1,
1.821463, 0.268839, 2.749882, 1, 0, 0.2039216, 1,
1.831528, -0.4238623, 0.8783225, 1, 0, 0.1960784, 1,
1.865095, -0.3682439, 1.296978, 1, 0, 0.1921569, 1,
1.897391, -0.9231174, 2.811462, 1, 0, 0.1843137, 1,
1.933601, -0.0961077, 2.148913, 1, 0, 0.1803922, 1,
1.937672, -0.797737, 3.252813, 1, 0, 0.172549, 1,
1.939451, -0.9810176, 2.18807, 1, 0, 0.1686275, 1,
1.946831, -0.2141842, 1.524441, 1, 0, 0.1607843, 1,
1.9595, -0.923902, 0.3668708, 1, 0, 0.1568628, 1,
1.966741, -0.8932126, 2.369957, 1, 0, 0.1490196, 1,
1.989495, 0.1220614, 3.01309, 1, 0, 0.145098, 1,
2.006749, 1.118829, 1.161139, 1, 0, 0.1372549, 1,
2.023032, -1.127396, 1.493429, 1, 0, 0.1333333, 1,
2.19635, 1.442265, 1.047381, 1, 0, 0.1254902, 1,
2.198652, -1.691009, 3.701472, 1, 0, 0.1215686, 1,
2.204278, -0.3272089, 0.4386188, 1, 0, 0.1137255, 1,
2.205271, -0.9849679, 2.060657, 1, 0, 0.1098039, 1,
2.244791, 1.852292, -0.8733602, 1, 0, 0.1019608, 1,
2.261415, 1.969538, 1.558726, 1, 0, 0.09411765, 1,
2.27309, -0.9141437, 2.939935, 1, 0, 0.09019608, 1,
2.286513, -0.4276078, 2.365314, 1, 0, 0.08235294, 1,
2.393257, -0.05851512, 1.7314, 1, 0, 0.07843138, 1,
2.402221, -0.02129751, 1.758876, 1, 0, 0.07058824, 1,
2.403647, 0.9847835, 1.814545, 1, 0, 0.06666667, 1,
2.484046, -1.435238, 2.498368, 1, 0, 0.05882353, 1,
2.503564, 1.298429, 2.221645, 1, 0, 0.05490196, 1,
2.565007, -1.318725, 2.912767, 1, 0, 0.04705882, 1,
2.611391, 0.7686366, 1.123232, 1, 0, 0.04313726, 1,
2.797756, 0.9666596, 3.102952, 1, 0, 0.03529412, 1,
2.87125, -0.3289312, 1.584706, 1, 0, 0.03137255, 1,
2.928868, 1.552707, 2.627132, 1, 0, 0.02352941, 1,
2.97262, -0.2796211, -0.3512085, 1, 0, 0.01960784, 1,
3.23469, -1.015681, 2.741548, 1, 0, 0.01176471, 1,
3.277558, -0.4033625, 1.52211, 1, 0, 0.007843138, 1
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
0.04962802, -3.836581, -7.297366, 0, -0.5, 0.5, 0.5,
0.04962802, -3.836581, -7.297366, 1, -0.5, 0.5, 0.5,
0.04962802, -3.836581, -7.297366, 1, 1.5, 0.5, 0.5,
0.04962802, -3.836581, -7.297366, 0, 1.5, 0.5, 0.5
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
-4.27257, 0.1439173, -7.297366, 0, -0.5, 0.5, 0.5,
-4.27257, 0.1439173, -7.297366, 1, -0.5, 0.5, 0.5,
-4.27257, 0.1439173, -7.297366, 1, 1.5, 0.5, 0.5,
-4.27257, 0.1439173, -7.297366, 0, 1.5, 0.5, 0.5
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
-4.27257, -3.836581, 0.2505379, 0, -0.5, 0.5, 0.5,
-4.27257, -3.836581, 0.2505379, 1, -0.5, 0.5, 0.5,
-4.27257, -3.836581, 0.2505379, 1, 1.5, 0.5, 0.5,
-4.27257, -3.836581, 0.2505379, 0, 1.5, 0.5, 0.5
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
-3, -2.918004, -5.555542,
3, -2.918004, -5.555542,
-3, -2.918004, -5.555542,
-3, -3.0711, -5.845846,
-2, -2.918004, -5.555542,
-2, -3.0711, -5.845846,
-1, -2.918004, -5.555542,
-1, -3.0711, -5.845846,
0, -2.918004, -5.555542,
0, -3.0711, -5.845846,
1, -2.918004, -5.555542,
1, -3.0711, -5.845846,
2, -2.918004, -5.555542,
2, -3.0711, -5.845846,
3, -2.918004, -5.555542,
3, -3.0711, -5.845846
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
-3, -3.377292, -6.426454, 0, -0.5, 0.5, 0.5,
-3, -3.377292, -6.426454, 1, -0.5, 0.5, 0.5,
-3, -3.377292, -6.426454, 1, 1.5, 0.5, 0.5,
-3, -3.377292, -6.426454, 0, 1.5, 0.5, 0.5,
-2, -3.377292, -6.426454, 0, -0.5, 0.5, 0.5,
-2, -3.377292, -6.426454, 1, -0.5, 0.5, 0.5,
-2, -3.377292, -6.426454, 1, 1.5, 0.5, 0.5,
-2, -3.377292, -6.426454, 0, 1.5, 0.5, 0.5,
-1, -3.377292, -6.426454, 0, -0.5, 0.5, 0.5,
-1, -3.377292, -6.426454, 1, -0.5, 0.5, 0.5,
-1, -3.377292, -6.426454, 1, 1.5, 0.5, 0.5,
-1, -3.377292, -6.426454, 0, 1.5, 0.5, 0.5,
0, -3.377292, -6.426454, 0, -0.5, 0.5, 0.5,
0, -3.377292, -6.426454, 1, -0.5, 0.5, 0.5,
0, -3.377292, -6.426454, 1, 1.5, 0.5, 0.5,
0, -3.377292, -6.426454, 0, 1.5, 0.5, 0.5,
1, -3.377292, -6.426454, 0, -0.5, 0.5, 0.5,
1, -3.377292, -6.426454, 1, -0.5, 0.5, 0.5,
1, -3.377292, -6.426454, 1, 1.5, 0.5, 0.5,
1, -3.377292, -6.426454, 0, 1.5, 0.5, 0.5,
2, -3.377292, -6.426454, 0, -0.5, 0.5, 0.5,
2, -3.377292, -6.426454, 1, -0.5, 0.5, 0.5,
2, -3.377292, -6.426454, 1, 1.5, 0.5, 0.5,
2, -3.377292, -6.426454, 0, 1.5, 0.5, 0.5,
3, -3.377292, -6.426454, 0, -0.5, 0.5, 0.5,
3, -3.377292, -6.426454, 1, -0.5, 0.5, 0.5,
3, -3.377292, -6.426454, 1, 1.5, 0.5, 0.5,
3, -3.377292, -6.426454, 0, 1.5, 0.5, 0.5
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
-3.27514, -2, -5.555542,
-3.27514, 3, -5.555542,
-3.27514, -2, -5.555542,
-3.441378, -2, -5.845846,
-3.27514, -1, -5.555542,
-3.441378, -1, -5.845846,
-3.27514, 0, -5.555542,
-3.441378, 0, -5.845846,
-3.27514, 1, -5.555542,
-3.441378, 1, -5.845846,
-3.27514, 2, -5.555542,
-3.441378, 2, -5.845846,
-3.27514, 3, -5.555542,
-3.441378, 3, -5.845846
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
-3.773854, -2, -6.426454, 0, -0.5, 0.5, 0.5,
-3.773854, -2, -6.426454, 1, -0.5, 0.5, 0.5,
-3.773854, -2, -6.426454, 1, 1.5, 0.5, 0.5,
-3.773854, -2, -6.426454, 0, 1.5, 0.5, 0.5,
-3.773854, -1, -6.426454, 0, -0.5, 0.5, 0.5,
-3.773854, -1, -6.426454, 1, -0.5, 0.5, 0.5,
-3.773854, -1, -6.426454, 1, 1.5, 0.5, 0.5,
-3.773854, -1, -6.426454, 0, 1.5, 0.5, 0.5,
-3.773854, 0, -6.426454, 0, -0.5, 0.5, 0.5,
-3.773854, 0, -6.426454, 1, -0.5, 0.5, 0.5,
-3.773854, 0, -6.426454, 1, 1.5, 0.5, 0.5,
-3.773854, 0, -6.426454, 0, 1.5, 0.5, 0.5,
-3.773854, 1, -6.426454, 0, -0.5, 0.5, 0.5,
-3.773854, 1, -6.426454, 1, -0.5, 0.5, 0.5,
-3.773854, 1, -6.426454, 1, 1.5, 0.5, 0.5,
-3.773854, 1, -6.426454, 0, 1.5, 0.5, 0.5,
-3.773854, 2, -6.426454, 0, -0.5, 0.5, 0.5,
-3.773854, 2, -6.426454, 1, -0.5, 0.5, 0.5,
-3.773854, 2, -6.426454, 1, 1.5, 0.5, 0.5,
-3.773854, 2, -6.426454, 0, 1.5, 0.5, 0.5,
-3.773854, 3, -6.426454, 0, -0.5, 0.5, 0.5,
-3.773854, 3, -6.426454, 1, -0.5, 0.5, 0.5,
-3.773854, 3, -6.426454, 1, 1.5, 0.5, 0.5,
-3.773854, 3, -6.426454, 0, 1.5, 0.5, 0.5
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
-3.27514, -2.918004, -4,
-3.27514, -2.918004, 4,
-3.27514, -2.918004, -4,
-3.441378, -3.0711, -4,
-3.27514, -2.918004, -2,
-3.441378, -3.0711, -2,
-3.27514, -2.918004, 0,
-3.441378, -3.0711, 0,
-3.27514, -2.918004, 2,
-3.441378, -3.0711, 2,
-3.27514, -2.918004, 4,
-3.441378, -3.0711, 4
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
-3.773854, -3.377292, -4, 0, -0.5, 0.5, 0.5,
-3.773854, -3.377292, -4, 1, -0.5, 0.5, 0.5,
-3.773854, -3.377292, -4, 1, 1.5, 0.5, 0.5,
-3.773854, -3.377292, -4, 0, 1.5, 0.5, 0.5,
-3.773854, -3.377292, -2, 0, -0.5, 0.5, 0.5,
-3.773854, -3.377292, -2, 1, -0.5, 0.5, 0.5,
-3.773854, -3.377292, -2, 1, 1.5, 0.5, 0.5,
-3.773854, -3.377292, -2, 0, 1.5, 0.5, 0.5,
-3.773854, -3.377292, 0, 0, -0.5, 0.5, 0.5,
-3.773854, -3.377292, 0, 1, -0.5, 0.5, 0.5,
-3.773854, -3.377292, 0, 1, 1.5, 0.5, 0.5,
-3.773854, -3.377292, 0, 0, 1.5, 0.5, 0.5,
-3.773854, -3.377292, 2, 0, -0.5, 0.5, 0.5,
-3.773854, -3.377292, 2, 1, -0.5, 0.5, 0.5,
-3.773854, -3.377292, 2, 1, 1.5, 0.5, 0.5,
-3.773854, -3.377292, 2, 0, 1.5, 0.5, 0.5,
-3.773854, -3.377292, 4, 0, -0.5, 0.5, 0.5,
-3.773854, -3.377292, 4, 1, -0.5, 0.5, 0.5,
-3.773854, -3.377292, 4, 1, 1.5, 0.5, 0.5,
-3.773854, -3.377292, 4, 0, 1.5, 0.5, 0.5
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
-3.27514, -2.918004, -5.555542,
-3.27514, 3.205839, -5.555542,
-3.27514, -2.918004, 6.056618,
-3.27514, 3.205839, 6.056618,
-3.27514, -2.918004, -5.555542,
-3.27514, -2.918004, 6.056618,
-3.27514, 3.205839, -5.555542,
-3.27514, 3.205839, 6.056618,
-3.27514, -2.918004, -5.555542,
3.374396, -2.918004, -5.555542,
-3.27514, -2.918004, 6.056618,
3.374396, -2.918004, 6.056618,
-3.27514, 3.205839, -5.555542,
3.374396, 3.205839, -5.555542,
-3.27514, 3.205839, 6.056618,
3.374396, 3.205839, 6.056618,
3.374396, -2.918004, -5.555542,
3.374396, 3.205839, -5.555542,
3.374396, -2.918004, 6.056618,
3.374396, 3.205839, 6.056618,
3.374396, -2.918004, -5.555542,
3.374396, -2.918004, 6.056618,
3.374396, 3.205839, -5.555542,
3.374396, 3.205839, 6.056618
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
var radius = 7.858046;
var distance = 34.96133;
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
mvMatrix.translate( -0.04962802, -0.1439173, -0.2505379 );
mvMatrix.scale( 1.277725, 1.387409, 0.7316704 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.96133);
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
cycluron<-read.table("cycluron.xyz")
```

```
## Error in read.table("cycluron.xyz"): no lines available in input
```

```r
x<-cycluron$V2
```

```
## Error in eval(expr, envir, enclos): object 'cycluron' not found
```

```r
y<-cycluron$V3
```

```
## Error in eval(expr, envir, enclos): object 'cycluron' not found
```

```r
z<-cycluron$V4
```

```
## Error in eval(expr, envir, enclos): object 'cycluron' not found
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
-3.178302, -0.2932301, 0.4231815, 0, 0, 1, 1, 1,
-3.101424, 1.651309, -1.457544, 1, 0, 0, 1, 1,
-3.07909, 0.291503, -1.914071, 1, 0, 0, 1, 1,
-3.023673, -1.612873, -2.200501, 1, 0, 0, 1, 1,
-2.665261, -2.828822, -2.668576, 1, 0, 0, 1, 1,
-2.548553, 0.9671901, -1.630502, 1, 0, 0, 1, 1,
-2.547034, -0.02401016, -1.144638, 0, 0, 0, 1, 1,
-2.489335, -0.6872088, -2.186223, 0, 0, 0, 1, 1,
-2.455141, -0.8508595, -1.928514, 0, 0, 0, 1, 1,
-2.37872, -1.104383, -1.16928, 0, 0, 0, 1, 1,
-2.259219, -1.081218, -0.3645793, 0, 0, 0, 1, 1,
-2.257483, 2.098448, 0.1890595, 0, 0, 0, 1, 1,
-2.22977, 1.754745, -0.5636562, 0, 0, 0, 1, 1,
-2.179637, 0.5306119, -1.745483, 1, 1, 1, 1, 1,
-2.16249, 0.02647223, -0.2930341, 1, 1, 1, 1, 1,
-2.126484, -0.2209465, 0.0610824, 1, 1, 1, 1, 1,
-2.060135, 0.004472087, -1.324058, 1, 1, 1, 1, 1,
-2.010438, -1.359905, -2.494482, 1, 1, 1, 1, 1,
-2.009357, 0.3491727, -0.05585629, 1, 1, 1, 1, 1,
-1.981842, 0.6114035, -0.7737214, 1, 1, 1, 1, 1,
-1.968363, -1.077134, -2.753518, 1, 1, 1, 1, 1,
-1.939954, -0.9269081, -1.897753, 1, 1, 1, 1, 1,
-1.935581, -1.521543, -1.869212, 1, 1, 1, 1, 1,
-1.91198, -0.638072, -2.820151, 1, 1, 1, 1, 1,
-1.905969, -0.1635101, -2.50337, 1, 1, 1, 1, 1,
-1.900311, -1.581469, -0.4407648, 1, 1, 1, 1, 1,
-1.895034, -0.8366385, -2.725183, 1, 1, 1, 1, 1,
-1.865143, -0.3825387, -1.141104, 1, 1, 1, 1, 1,
-1.822261, 1.237222, -0.1454686, 0, 0, 1, 1, 1,
-1.814076, -0.2902464, -2.351169, 1, 0, 0, 1, 1,
-1.812808, -0.1360244, -1.973599, 1, 0, 0, 1, 1,
-1.81237, -0.8291164, -3.539321, 1, 0, 0, 1, 1,
-1.808599, 0.8857579, -1.997651, 1, 0, 0, 1, 1,
-1.788862, 1.259644, 0.01581055, 1, 0, 0, 1, 1,
-1.785879, -0.6380111, -2.649118, 0, 0, 0, 1, 1,
-1.777429, 0.6582908, -2.057721, 0, 0, 0, 1, 1,
-1.75645, 1.869175, -1.582206, 0, 0, 0, 1, 1,
-1.735174, 0.18589, -1.297382, 0, 0, 0, 1, 1,
-1.722542, -0.8404155, -1.662904, 0, 0, 0, 1, 1,
-1.721837, -0.08900029, -2.601483, 0, 0, 0, 1, 1,
-1.713578, 0.8513327, 0.1095841, 0, 0, 0, 1, 1,
-1.708319, 1.407832, -1.06692, 1, 1, 1, 1, 1,
-1.701746, 0.6941358, -1.200483, 1, 1, 1, 1, 1,
-1.698486, -0.4989753, -3.601667, 1, 1, 1, 1, 1,
-1.686199, 1.207943, -2.089716, 1, 1, 1, 1, 1,
-1.6766, -0.7913697, -1.157926, 1, 1, 1, 1, 1,
-1.666049, -1.153997, -0.6697655, 1, 1, 1, 1, 1,
-1.665832, 1.483972, -0.1500184, 1, 1, 1, 1, 1,
-1.65784, 0.6919218, -0.7005672, 1, 1, 1, 1, 1,
-1.657131, 1.502147, -3.44672, 1, 1, 1, 1, 1,
-1.651722, -2.028483, -2.729939, 1, 1, 1, 1, 1,
-1.644475, 1.42049, -1.014231, 1, 1, 1, 1, 1,
-1.635954, 0.1672854, -2.283261, 1, 1, 1, 1, 1,
-1.593713, -0.05900815, -1.753174, 1, 1, 1, 1, 1,
-1.557154, 0.08250101, -1.401233, 1, 1, 1, 1, 1,
-1.556073, -1.320259, -1.515406, 1, 1, 1, 1, 1,
-1.552321, 1.719048, -1.199265, 0, 0, 1, 1, 1,
-1.551106, -1.629114, -1.229621, 1, 0, 0, 1, 1,
-1.548516, 1.688832, -0.2971813, 1, 0, 0, 1, 1,
-1.546622, -0.4256529, -1.740438, 1, 0, 0, 1, 1,
-1.534087, 1.277907, -1.786677, 1, 0, 0, 1, 1,
-1.53379, -1.192481, -2.299469, 1, 0, 0, 1, 1,
-1.532458, 0.3244799, -2.398032, 0, 0, 0, 1, 1,
-1.499609, -0.5636217, -2.477532, 0, 0, 0, 1, 1,
-1.478202, 1.560783, -0.1521884, 0, 0, 0, 1, 1,
-1.468737, -1.038543, -3.085777, 0, 0, 0, 1, 1,
-1.467945, 0.6365916, -2.606823, 0, 0, 0, 1, 1,
-1.45339, -0.6728762, -3.151248, 0, 0, 0, 1, 1,
-1.45319, 1.106193, -0.4948956, 0, 0, 0, 1, 1,
-1.446497, -0.3924995, -1.595628, 1, 1, 1, 1, 1,
-1.441907, -0.5986626, -1.364404, 1, 1, 1, 1, 1,
-1.43376, -0.4869393, -1.148575, 1, 1, 1, 1, 1,
-1.427456, -0.9606996, -2.116114, 1, 1, 1, 1, 1,
-1.415469, -0.00835004, -0.9013201, 1, 1, 1, 1, 1,
-1.407394, 0.6587107, -2.485809, 1, 1, 1, 1, 1,
-1.405019, -1.988672, -2.519678, 1, 1, 1, 1, 1,
-1.392004, 1.113086, -2.581011, 1, 1, 1, 1, 1,
-1.383963, -0.4495504, -1.701319, 1, 1, 1, 1, 1,
-1.368898, -0.4961708, -1.725524, 1, 1, 1, 1, 1,
-1.356743, 0.3514096, -2.100672, 1, 1, 1, 1, 1,
-1.356106, 0.005107668, -2.146164, 1, 1, 1, 1, 1,
-1.340996, 1.537171, 0.8058791, 1, 1, 1, 1, 1,
-1.337588, -0.5907001, -2.316282, 1, 1, 1, 1, 1,
-1.337421, -0.734825, -1.186716, 1, 1, 1, 1, 1,
-1.33599, 0.4641279, -1.695005, 0, 0, 1, 1, 1,
-1.335223, 1.002946, -0.6166025, 1, 0, 0, 1, 1,
-1.3202, -0.8575764, 0.1926411, 1, 0, 0, 1, 1,
-1.316841, 0.793833, 1.380365, 1, 0, 0, 1, 1,
-1.306737, 0.4679994, -0.8466355, 1, 0, 0, 1, 1,
-1.30599, -0.8812556, -2.264004, 1, 0, 0, 1, 1,
-1.302903, 1.483841, -0.9615608, 0, 0, 0, 1, 1,
-1.301456, -0.4064496, -3.315891, 0, 0, 0, 1, 1,
-1.30145, 1.127743, -0.522437, 0, 0, 0, 1, 1,
-1.298475, -1.563144, -4.092333, 0, 0, 0, 1, 1,
-1.280401, 0.5662482, -0.307781, 0, 0, 0, 1, 1,
-1.274469, -1.710541, -1.913673, 0, 0, 0, 1, 1,
-1.264725, 1.186608, 0.3042082, 0, 0, 0, 1, 1,
-1.261591, 0.6611091, -0.9260569, 1, 1, 1, 1, 1,
-1.260692, -2.426568, -2.112596, 1, 1, 1, 1, 1,
-1.252195, -0.7753751, -3.014885, 1, 1, 1, 1, 1,
-1.250025, 1.667773, 0.3522446, 1, 1, 1, 1, 1,
-1.227816, -0.5012663, -1.175037, 1, 1, 1, 1, 1,
-1.224623, -0.2886458, -1.780677, 1, 1, 1, 1, 1,
-1.219273, 0.4955786, -2.231361, 1, 1, 1, 1, 1,
-1.210127, 1.197517, -0.9180871, 1, 1, 1, 1, 1,
-1.202406, 1.542259, -0.01557518, 1, 1, 1, 1, 1,
-1.196617, -0.7818857, -3.011685, 1, 1, 1, 1, 1,
-1.193217, -1.659263, -1.424083, 1, 1, 1, 1, 1,
-1.192011, 0.5914031, 0.1661488, 1, 1, 1, 1, 1,
-1.190919, -1.651113, -3.161793, 1, 1, 1, 1, 1,
-1.190113, -0.6046059, -2.61981, 1, 1, 1, 1, 1,
-1.187515, 1.417436, 0.2440877, 1, 1, 1, 1, 1,
-1.169009, 0.5783132, -2.785806, 0, 0, 1, 1, 1,
-1.151881, 0.3102965, -2.249626, 1, 0, 0, 1, 1,
-1.145886, -0.09678847, -2.202237, 1, 0, 0, 1, 1,
-1.14152, -0.2603951, -0.7013086, 1, 0, 0, 1, 1,
-1.13674, -0.8308145, -3.157349, 1, 0, 0, 1, 1,
-1.134225, 1.117465, -2.582496, 1, 0, 0, 1, 1,
-1.133618, -0.78966, -2.273757, 0, 0, 0, 1, 1,
-1.126534, -1.036854, -2.511218, 0, 0, 0, 1, 1,
-1.124885, -0.4870937, -3.495243, 0, 0, 0, 1, 1,
-1.123589, 1.369974, -1.433372, 0, 0, 0, 1, 1,
-1.114406, -0.3331829, -0.9383865, 0, 0, 0, 1, 1,
-1.112951, -0.3693031, -0.2083634, 0, 0, 0, 1, 1,
-1.111042, 0.01243461, 0.5299121, 0, 0, 0, 1, 1,
-1.109864, 2.297697, 0.009720295, 1, 1, 1, 1, 1,
-1.108194, 1.265697, -2.794608, 1, 1, 1, 1, 1,
-1.097304, 0.9036684, 1.704039, 1, 1, 1, 1, 1,
-1.094303, -1.531549, -4.378011, 1, 1, 1, 1, 1,
-1.081173, 0.2319183, -2.206147, 1, 1, 1, 1, 1,
-1.077214, 0.7812322, -1.595736, 1, 1, 1, 1, 1,
-1.061769, -0.1966861, 0.3406685, 1, 1, 1, 1, 1,
-1.055021, -0.4868868, -1.978036, 1, 1, 1, 1, 1,
-1.053624, -0.5952469, 0.6100725, 1, 1, 1, 1, 1,
-1.051326, 1.142126, -0.8988804, 1, 1, 1, 1, 1,
-1.047883, 0.8676014, -0.3828565, 1, 1, 1, 1, 1,
-1.040384, 0.6010986, 0.3223995, 1, 1, 1, 1, 1,
-1.018993, -0.4523754, -1.395336, 1, 1, 1, 1, 1,
-1.007145, 1.166035, -1.29181, 1, 1, 1, 1, 1,
-0.9893904, 1.063959, -1.235703, 1, 1, 1, 1, 1,
-0.9874278, -0.04183411, -1.72461, 0, 0, 1, 1, 1,
-0.977351, 1.916458, 0.5682451, 1, 0, 0, 1, 1,
-0.9711987, 0.3297288, -0.2951743, 1, 0, 0, 1, 1,
-0.9583342, 1.008245, -2.255899, 1, 0, 0, 1, 1,
-0.9562895, 0.9037136, -2.649913, 1, 0, 0, 1, 1,
-0.9536584, -0.9402711, -2.377506, 1, 0, 0, 1, 1,
-0.9522847, -1.886456, -2.53419, 0, 0, 0, 1, 1,
-0.9502221, -1.044897, -4.625003, 0, 0, 0, 1, 1,
-0.9484311, -0.03113833, -0.5358388, 0, 0, 0, 1, 1,
-0.9449669, 0.4363374, -1.699381, 0, 0, 0, 1, 1,
-0.9441957, -0.1371993, -2.522139, 0, 0, 0, 1, 1,
-0.9404163, -0.7653388, -2.550537, 0, 0, 0, 1, 1,
-0.9366412, -0.1410411, -2.610894, 0, 0, 0, 1, 1,
-0.9276392, -0.1082486, -1.098387, 1, 1, 1, 1, 1,
-0.9259959, 0.7464977, -1.738034, 1, 1, 1, 1, 1,
-0.9213459, -1.636075, -1.032572, 1, 1, 1, 1, 1,
-0.9168881, 0.8900214, -1.336436, 1, 1, 1, 1, 1,
-0.913767, -1.821641, -3.630733, 1, 1, 1, 1, 1,
-0.9101158, -1.754914, -3.831238, 1, 1, 1, 1, 1,
-0.9091953, -0.04724121, -0.8032266, 1, 1, 1, 1, 1,
-0.9018204, -0.6535904, -2.486457, 1, 1, 1, 1, 1,
-0.901713, -1.749461, -2.227658, 1, 1, 1, 1, 1,
-0.9012125, -0.3930875, -1.356756, 1, 1, 1, 1, 1,
-0.9001634, -1.001357, -1.315792, 1, 1, 1, 1, 1,
-0.8882671, 0.4873204, -0.6209759, 1, 1, 1, 1, 1,
-0.8880929, 1.244927, -0.5427043, 1, 1, 1, 1, 1,
-0.8877634, 0.8113858, -0.9747202, 1, 1, 1, 1, 1,
-0.8815235, -1.799997, -3.703368, 1, 1, 1, 1, 1,
-0.8800674, -1.475326, -2.768549, 0, 0, 1, 1, 1,
-0.8766093, 0.5464666, -0.7123571, 1, 0, 0, 1, 1,
-0.8751516, -0.3796498, -1.922073, 1, 0, 0, 1, 1,
-0.8748575, 0.1010401, -3.043581, 1, 0, 0, 1, 1,
-0.8722697, -0.6650184, -1.283165, 1, 0, 0, 1, 1,
-0.8700669, 1.012431, -1.103941, 1, 0, 0, 1, 1,
-0.8671345, 1.751665, -1.030403, 0, 0, 0, 1, 1,
-0.8650566, 0.5600444, -0.3784511, 0, 0, 0, 1, 1,
-0.8609129, 1.482616, -0.2448271, 0, 0, 0, 1, 1,
-0.8591086, 0.1651726, -1.167414, 0, 0, 0, 1, 1,
-0.8517823, 1.60402, -1.353124, 0, 0, 0, 1, 1,
-0.8484987, -0.5504737, -1.323541, 0, 0, 0, 1, 1,
-0.8456202, 0.2763741, 0.267407, 0, 0, 0, 1, 1,
-0.844818, -1.181565, -1.94517, 1, 1, 1, 1, 1,
-0.8442978, -0.114191, -2.86971, 1, 1, 1, 1, 1,
-0.8404183, 0.7855667, -1.012757, 1, 1, 1, 1, 1,
-0.8324767, -0.4197156, -1.280377, 1, 1, 1, 1, 1,
-0.8310704, -1.733032, -3.84461, 1, 1, 1, 1, 1,
-0.8154194, -2.597624, -1.55154, 1, 1, 1, 1, 1,
-0.8151772, -0.3970606, -2.3153, 1, 1, 1, 1, 1,
-0.8130839, -0.4644008, -2.307975, 1, 1, 1, 1, 1,
-0.8097675, -1.68871, -0.9637488, 1, 1, 1, 1, 1,
-0.8088548, -0.1244045, -1.496871, 1, 1, 1, 1, 1,
-0.7983624, -1.02057, -3.252858, 1, 1, 1, 1, 1,
-0.796585, -0.5098671, -3.367255, 1, 1, 1, 1, 1,
-0.7934246, 2.308727, -1.971452, 1, 1, 1, 1, 1,
-0.7888505, -1.102316, -3.966172, 1, 1, 1, 1, 1,
-0.788802, 0.01935171, 0.4935943, 1, 1, 1, 1, 1,
-0.7848623, 0.7541735, -2.655848, 0, 0, 1, 1, 1,
-0.7847371, -0.03315514, 0.142283, 1, 0, 0, 1, 1,
-0.7844154, -0.8728762, -3.792066, 1, 0, 0, 1, 1,
-0.772507, -0.8770418, -2.905914, 1, 0, 0, 1, 1,
-0.7688673, 1.282702, 1.221875, 1, 0, 0, 1, 1,
-0.7684819, 0.02831939, -1.808275, 1, 0, 0, 1, 1,
-0.7658876, -0.05505075, -1.675343, 0, 0, 0, 1, 1,
-0.7644898, -0.3537885, -1.41596, 0, 0, 0, 1, 1,
-0.7605237, -0.1600541, -1.219177, 0, 0, 0, 1, 1,
-0.7603588, 0.1760231, -2.17856, 0, 0, 0, 1, 1,
-0.7598398, 2.336597, 0.2147669, 0, 0, 0, 1, 1,
-0.7564373, -0.9258996, -0.9340562, 0, 0, 0, 1, 1,
-0.7525321, -0.5916126, -1.665954, 0, 0, 0, 1, 1,
-0.7499403, 0.8087711, -0.4794179, 1, 1, 1, 1, 1,
-0.7424667, 0.351445, -3.336224, 1, 1, 1, 1, 1,
-0.7410578, 1.481614, 0.106868, 1, 1, 1, 1, 1,
-0.7391822, -0.4540386, -1.771331, 1, 1, 1, 1, 1,
-0.7367453, 0.9054146, -0.5854682, 1, 1, 1, 1, 1,
-0.7318027, 0.1328758, -1.168504, 1, 1, 1, 1, 1,
-0.7302595, 0.5098302, -1.166256, 1, 1, 1, 1, 1,
-0.7289896, -0.1917741, -0.7443227, 1, 1, 1, 1, 1,
-0.7240208, -0.07783782, -4.104574, 1, 1, 1, 1, 1,
-0.7206951, 0.2892393, -2.224956, 1, 1, 1, 1, 1,
-0.7196587, -1.234727, -3.707324, 1, 1, 1, 1, 1,
-0.7153153, 0.6446488, 1.047823, 1, 1, 1, 1, 1,
-0.7122213, 0.5272, -0.9146814, 1, 1, 1, 1, 1,
-0.7118181, -0.6251867, 0.06846413, 1, 1, 1, 1, 1,
-0.7100648, -0.7539181, -1.516528, 1, 1, 1, 1, 1,
-0.7029212, 0.2303435, 0.2316373, 0, 0, 1, 1, 1,
-0.7020288, 0.08750269, -0.5969584, 1, 0, 0, 1, 1,
-0.6979858, -1.441437, -2.249736, 1, 0, 0, 1, 1,
-0.6973535, -0.124487, -1.474886, 1, 0, 0, 1, 1,
-0.6957812, 2.985862, 0.5111223, 1, 0, 0, 1, 1,
-0.695741, -0.5271021, -1.174646, 1, 0, 0, 1, 1,
-0.6957269, -1.816531, -3.740678, 0, 0, 0, 1, 1,
-0.6953647, -0.2639934, -2.038573, 0, 0, 0, 1, 1,
-0.6949637, 0.0593801, -0.4582958, 0, 0, 0, 1, 1,
-0.6948475, 0.4614844, -0.7555284, 0, 0, 0, 1, 1,
-0.6942531, -2.283463, -3.188295, 0, 0, 0, 1, 1,
-0.6886585, 0.5619646, -2.813692, 0, 0, 0, 1, 1,
-0.681446, 1.189127, -0.8262309, 0, 0, 0, 1, 1,
-0.6814333, -1.046968, -3.476654, 1, 1, 1, 1, 1,
-0.6809207, 0.3416245, -1.683632, 1, 1, 1, 1, 1,
-0.6769924, -1.0978, -2.780708, 1, 1, 1, 1, 1,
-0.6732697, 0.7836949, -2.409457, 1, 1, 1, 1, 1,
-0.6717802, -0.4334203, -2.523071, 1, 1, 1, 1, 1,
-0.667716, -0.1100863, -0.63798, 1, 1, 1, 1, 1,
-0.6673567, 1.675321, -0.2471974, 1, 1, 1, 1, 1,
-0.6665598, -0.2182923, -2.080255, 1, 1, 1, 1, 1,
-0.6643848, 0.9409942, 1.543492, 1, 1, 1, 1, 1,
-0.661449, 0.316707, -0.8111004, 1, 1, 1, 1, 1,
-0.6562216, -0.3035005, -3.073431, 1, 1, 1, 1, 1,
-0.6502857, 1.757602, 1.513203, 1, 1, 1, 1, 1,
-0.6466545, -1.230354, -4.214347, 1, 1, 1, 1, 1,
-0.6409385, 1.309362, 0.3206883, 1, 1, 1, 1, 1,
-0.6368247, 0.3423294, -0.09117395, 1, 1, 1, 1, 1,
-0.6366046, -0.9757101, -1.455725, 0, 0, 1, 1, 1,
-0.6347474, -0.8651366, -3.409176, 1, 0, 0, 1, 1,
-0.6312768, 0.2983784, -1.01004, 1, 0, 0, 1, 1,
-0.6310963, -0.2871847, -2.006517, 1, 0, 0, 1, 1,
-0.6260719, 1.113591, -0.7646807, 1, 0, 0, 1, 1,
-0.6251249, -0.5738679, -2.954708, 1, 0, 0, 1, 1,
-0.6232771, 0.7972946, -0.5809273, 0, 0, 0, 1, 1,
-0.6215189, -2.220174, -2.665359, 0, 0, 0, 1, 1,
-0.6214034, -0.8877894, -0.1833537, 0, 0, 0, 1, 1,
-0.6100694, -0.1217148, -2.389824, 0, 0, 0, 1, 1,
-0.6077015, -0.06939222, -1.614368, 0, 0, 0, 1, 1,
-0.6002393, 0.306906, -2.460091, 0, 0, 0, 1, 1,
-0.5974541, 0.3517257, -0.5945275, 0, 0, 0, 1, 1,
-0.5878313, 0.7479425, -0.1657778, 1, 1, 1, 1, 1,
-0.5863521, 1.797209, -1.846782, 1, 1, 1, 1, 1,
-0.5859799, -1.563667, -2.604577, 1, 1, 1, 1, 1,
-0.5827901, 0.4111873, 0.5546673, 1, 1, 1, 1, 1,
-0.5814377, -0.08916542, -1.36774, 1, 1, 1, 1, 1,
-0.5782515, 1.335958, 0.2115692, 1, 1, 1, 1, 1,
-0.5723968, -0.3141653, -2.919297, 1, 1, 1, 1, 1,
-0.5695937, 0.1534683, -1.728775, 1, 1, 1, 1, 1,
-0.5684193, 2.005057, -0.6501454, 1, 1, 1, 1, 1,
-0.5678682, -1.451053, -2.364938, 1, 1, 1, 1, 1,
-0.5668378, -0.8072979, -2.19157, 1, 1, 1, 1, 1,
-0.5663681, -0.918065, 0.8405439, 1, 1, 1, 1, 1,
-0.56156, -0.3645821, -1.214372, 1, 1, 1, 1, 1,
-0.5610919, -1.897935, -3.588528, 1, 1, 1, 1, 1,
-0.5601623, 0.03052169, -1.152917, 1, 1, 1, 1, 1,
-0.5596356, -0.5392869, -2.736507, 0, 0, 1, 1, 1,
-0.5594317, -0.9797429, -2.149708, 1, 0, 0, 1, 1,
-0.551613, -0.4900124, -3.767738, 1, 0, 0, 1, 1,
-0.5499107, 1.223665, -1.093257, 1, 0, 0, 1, 1,
-0.5366881, -0.4092466, -2.377151, 1, 0, 0, 1, 1,
-0.5363415, -0.8359036, -1.313313, 1, 0, 0, 1, 1,
-0.5313639, -1.202553, -1.670949, 0, 0, 0, 1, 1,
-0.5305437, 0.6556528, -1.463453, 0, 0, 0, 1, 1,
-0.5291693, 1.698314, 0.5871482, 0, 0, 0, 1, 1,
-0.5262402, -2.170996, -2.221754, 0, 0, 0, 1, 1,
-0.5253096, 0.636921, -0.1433837, 0, 0, 0, 1, 1,
-0.5242393, -0.6287193, -2.438345, 0, 0, 0, 1, 1,
-0.5214795, 0.1393499, -1.221026, 0, 0, 0, 1, 1,
-0.5206146, 2.914781, -1.453973, 1, 1, 1, 1, 1,
-0.5166593, 0.3418576, 0.6340353, 1, 1, 1, 1, 1,
-0.5077138, 0.04840621, -2.136147, 1, 1, 1, 1, 1,
-0.5009731, 0.5181396, -0.2663941, 1, 1, 1, 1, 1,
-0.4966664, 1.12482, -1.810053, 1, 1, 1, 1, 1,
-0.4888798, 0.1820568, -2.379426, 1, 1, 1, 1, 1,
-0.4887546, 0.2396884, -1.156356, 1, 1, 1, 1, 1,
-0.4858047, -1.028423, -2.086052, 1, 1, 1, 1, 1,
-0.4794801, -0.6624746, -2.685938, 1, 1, 1, 1, 1,
-0.4780603, 0.1119536, 0.2134826, 1, 1, 1, 1, 1,
-0.4773574, 1.336394, 0.8749244, 1, 1, 1, 1, 1,
-0.4763371, -0.4065758, -2.152384, 1, 1, 1, 1, 1,
-0.4692292, -0.5562467, -1.732699, 1, 1, 1, 1, 1,
-0.4666545, -1.26901, -4.511709, 1, 1, 1, 1, 1,
-0.4661309, -0.8782933, -2.359726, 1, 1, 1, 1, 1,
-0.4651321, -0.8409652, -2.010494, 0, 0, 1, 1, 1,
-0.4650586, 1.313284, -0.9065575, 1, 0, 0, 1, 1,
-0.462414, 0.06618357, -1.488379, 1, 0, 0, 1, 1,
-0.456925, 0.6422634, 0.6731176, 1, 0, 0, 1, 1,
-0.4535584, -0.07100594, -2.270693, 1, 0, 0, 1, 1,
-0.4461266, 0.28682, -2.260026, 1, 0, 0, 1, 1,
-0.4460043, -1.112649, -2.835109, 0, 0, 0, 1, 1,
-0.4430933, -0.2902866, -3.22406, 0, 0, 0, 1, 1,
-0.4391495, -0.4669526, -1.939115, 0, 0, 0, 1, 1,
-0.4371265, 0.6872825, 0.3180733, 0, 0, 0, 1, 1,
-0.4336069, 1.225775, -0.3669696, 0, 0, 0, 1, 1,
-0.4311716, -0.7393892, -1.822074, 0, 0, 0, 1, 1,
-0.4272452, 0.7211708, -0.6026723, 0, 0, 0, 1, 1,
-0.4269305, -0.9377136, -1.750922, 1, 1, 1, 1, 1,
-0.4231246, 1.936826, -0.1679487, 1, 1, 1, 1, 1,
-0.4173924, -0.5475355, -1.67815, 1, 1, 1, 1, 1,
-0.4154866, 0.007609999, -2.862772, 1, 1, 1, 1, 1,
-0.4137181, -0.3522321, -1.240388, 1, 1, 1, 1, 1,
-0.4096934, -0.9620546, -1.427706, 1, 1, 1, 1, 1,
-0.408154, 0.3256232, -3.236929, 1, 1, 1, 1, 1,
-0.3999349, -0.7685992, -1.018213, 1, 1, 1, 1, 1,
-0.3991738, -0.6903014, -3.139724, 1, 1, 1, 1, 1,
-0.39873, -1.725251, -3.657011, 1, 1, 1, 1, 1,
-0.3972431, -0.9137799, -3.359984, 1, 1, 1, 1, 1,
-0.3960379, -1.504398, -3.312135, 1, 1, 1, 1, 1,
-0.3934309, -0.4043807, -1.80589, 1, 1, 1, 1, 1,
-0.3910281, -2.300719, -1.862004, 1, 1, 1, 1, 1,
-0.3870743, -1.299568, -1.467937, 1, 1, 1, 1, 1,
-0.3835407, -0.2096373, -3.090192, 0, 0, 1, 1, 1,
-0.3824438, 1.057916, -0.5131116, 1, 0, 0, 1, 1,
-0.3795551, -0.4799718, -3.436253, 1, 0, 0, 1, 1,
-0.3788082, -0.1347449, -3.074455, 1, 0, 0, 1, 1,
-0.3709532, -1.165513, -2.362071, 1, 0, 0, 1, 1,
-0.3690472, 0.7996282, -1.082635, 1, 0, 0, 1, 1,
-0.3689861, -0.1195168, -1.261179, 0, 0, 0, 1, 1,
-0.3677224, -0.7310793, -2.468377, 0, 0, 0, 1, 1,
-0.3654537, 2.776892, -0.1714458, 0, 0, 0, 1, 1,
-0.3647148, -0.6874804, -2.57102, 0, 0, 0, 1, 1,
-0.3597615, -1.357568, -4.06361, 0, 0, 0, 1, 1,
-0.35821, -0.3094579, -3.16369, 0, 0, 0, 1, 1,
-0.3571617, -1.740782, -3.875962, 0, 0, 0, 1, 1,
-0.3561265, 0.5077458, -1.580912, 1, 1, 1, 1, 1,
-0.355037, 1.947492, -0.3218588, 1, 1, 1, 1, 1,
-0.354634, 1.461197, 1.995732, 1, 1, 1, 1, 1,
-0.3512874, 1.097471, -1.773747, 1, 1, 1, 1, 1,
-0.3429742, -0.8647012, -3.490505, 1, 1, 1, 1, 1,
-0.342491, 1.023662, 2.413927, 1, 1, 1, 1, 1,
-0.3423146, 0.8329548, -0.4149766, 1, 1, 1, 1, 1,
-0.3390585, -1.110381, -2.870364, 1, 1, 1, 1, 1,
-0.3279226, 0.7543474, -1.458484, 1, 1, 1, 1, 1,
-0.3266875, -0.1945749, -1.996601, 1, 1, 1, 1, 1,
-0.3232232, -0.1774674, -2.638726, 1, 1, 1, 1, 1,
-0.3199639, -1.370455, -3.172877, 1, 1, 1, 1, 1,
-0.3197916, -0.647145, -1.821994, 1, 1, 1, 1, 1,
-0.3151246, 0.4764149, 0.6383903, 1, 1, 1, 1, 1,
-0.3139682, -0.7093862, -2.924191, 1, 1, 1, 1, 1,
-0.3120256, 1.1598, -1.268894, 0, 0, 1, 1, 1,
-0.3118562, 0.2908145, -0.1322438, 1, 0, 0, 1, 1,
-0.3095396, -1.345181, -2.731122, 1, 0, 0, 1, 1,
-0.3058147, -1.781078, -2.22174, 1, 0, 0, 1, 1,
-0.3044249, -0.9343356, -3.301685, 1, 0, 0, 1, 1,
-0.3001185, -0.2952436, -2.351703, 1, 0, 0, 1, 1,
-0.2951272, 0.6184355, -0.1587934, 0, 0, 0, 1, 1,
-0.2913667, 0.7708461, -1.858447, 0, 0, 0, 1, 1,
-0.2884824, -0.3970615, -2.558959, 0, 0, 0, 1, 1,
-0.2867061, 0.2360498, -1.459818, 0, 0, 0, 1, 1,
-0.284011, 1.069414, 0.3336938, 0, 0, 0, 1, 1,
-0.2816633, 0.4548323, 0.4220647, 0, 0, 0, 1, 1,
-0.2761881, -2.408769, -2.186105, 0, 0, 0, 1, 1,
-0.2729897, -1.250135, -2.113425, 1, 1, 1, 1, 1,
-0.2711468, 1.171551, -0.0211845, 1, 1, 1, 1, 1,
-0.2701966, 0.261317, -1.260334, 1, 1, 1, 1, 1,
-0.2685885, 1.658583, 0.1318865, 1, 1, 1, 1, 1,
-0.2681989, 0.6271632, -0.7776368, 1, 1, 1, 1, 1,
-0.2665957, -1.794284, -3.30412, 1, 1, 1, 1, 1,
-0.2650619, -1.139836, -3.226688, 1, 1, 1, 1, 1,
-0.2640748, -1.188021, -2.489511, 1, 1, 1, 1, 1,
-0.2630592, -1.089749, -2.531207, 1, 1, 1, 1, 1,
-0.2607659, -0.5552034, -2.131091, 1, 1, 1, 1, 1,
-0.257853, -1.174677, -2.830434, 1, 1, 1, 1, 1,
-0.2560699, 0.5669349, 0.4296381, 1, 1, 1, 1, 1,
-0.2539265, -0.8280885, -1.90644, 1, 1, 1, 1, 1,
-0.2535822, -0.28684, -3.640982, 1, 1, 1, 1, 1,
-0.2484338, -0.5127499, -2.466855, 1, 1, 1, 1, 1,
-0.2480668, -0.08495814, -2.249213, 0, 0, 1, 1, 1,
-0.2457068, 0.2371801, 0.004659858, 1, 0, 0, 1, 1,
-0.2419365, 0.544526, 1.091287, 1, 0, 0, 1, 1,
-0.2342321, 1.088408, 1.597384, 1, 0, 0, 1, 1,
-0.2258224, 1.530943, -1.16411, 1, 0, 0, 1, 1,
-0.2207024, 1.985742, 0.8393106, 1, 0, 0, 1, 1,
-0.2151461, -0.05545428, -1.643201, 0, 0, 0, 1, 1,
-0.2132468, 0.8686165, -0.5835344, 0, 0, 0, 1, 1,
-0.2102052, 1.224948, 0.4175433, 0, 0, 0, 1, 1,
-0.2060185, -0.3761664, -2.911691, 0, 0, 0, 1, 1,
-0.2056031, 0.1368049, -0.07682049, 0, 0, 0, 1, 1,
-0.2043431, -0.001889948, -4.037192, 0, 0, 0, 1, 1,
-0.1968163, -0.4003445, -1.955962, 0, 0, 0, 1, 1,
-0.1967365, 0.5867009, 0.7548718, 1, 1, 1, 1, 1,
-0.1966391, -0.04074977, -1.567948, 1, 1, 1, 1, 1,
-0.1956116, -0.3580949, -3.267948, 1, 1, 1, 1, 1,
-0.1941804, -0.1491842, -3.213218, 1, 1, 1, 1, 1,
-0.1934425, -0.3600476, -3.592143, 1, 1, 1, 1, 1,
-0.1926483, -0.6748102, -1.648056, 1, 1, 1, 1, 1,
-0.1924149, 0.1969242, -1.78318, 1, 1, 1, 1, 1,
-0.1921094, 0.01636998, -1.668538, 1, 1, 1, 1, 1,
-0.1867072, 1.44301, 0.5585962, 1, 1, 1, 1, 1,
-0.1864287, 0.4787096, -0.07166821, 1, 1, 1, 1, 1,
-0.1857101, 1.910566, 0.9465906, 1, 1, 1, 1, 1,
-0.1848287, -0.6691225, -3.390338, 1, 1, 1, 1, 1,
-0.1823393, -0.8538337, -2.480455, 1, 1, 1, 1, 1,
-0.1806423, 0.2149759, -0.4355296, 1, 1, 1, 1, 1,
-0.1800375, -0.2219852, -3.636025, 1, 1, 1, 1, 1,
-0.1763118, -0.873568, -5.386433, 0, 0, 1, 1, 1,
-0.1732771, 0.3530812, 0.00901542, 1, 0, 0, 1, 1,
-0.1729762, 0.3356869, 0.2451221, 1, 0, 0, 1, 1,
-0.1724544, 1.362708, -0.2884293, 1, 0, 0, 1, 1,
-0.1701804, -2.302494, -3.931097, 1, 0, 0, 1, 1,
-0.1680526, 0.007533113, -0.5761002, 1, 0, 0, 1, 1,
-0.1677799, 0.5152065, -1.744636, 0, 0, 0, 1, 1,
-0.1668467, 1.527731, -1.39422, 0, 0, 0, 1, 1,
-0.1653317, -1.739522, -3.699486, 0, 0, 0, 1, 1,
-0.1604107, 0.9280642, 2.726071, 0, 0, 0, 1, 1,
-0.1568051, 0.2457005, -1.584105, 0, 0, 0, 1, 1,
-0.147565, 0.3388174, -1.050887, 0, 0, 0, 1, 1,
-0.1446319, -0.6468134, -0.8521635, 0, 0, 0, 1, 1,
-0.1443243, -0.8493937, -2.635967, 1, 1, 1, 1, 1,
-0.1414599, 0.952265, -0.3167051, 1, 1, 1, 1, 1,
-0.1407675, -1.41633, -2.434547, 1, 1, 1, 1, 1,
-0.1333111, 0.06944584, 0.8254141, 1, 1, 1, 1, 1,
-0.1261188, -0.4472644, -2.090974, 1, 1, 1, 1, 1,
-0.1217561, 0.2457413, 1.341531, 1, 1, 1, 1, 1,
-0.1183356, 0.9891498, -1.56568, 1, 1, 1, 1, 1,
-0.1169539, 0.3778411, 0.810453, 1, 1, 1, 1, 1,
-0.1159988, 0.7028251, -0.6036668, 1, 1, 1, 1, 1,
-0.1138591, -1.762868, -3.48099, 1, 1, 1, 1, 1,
-0.1071956, 0.6984388, -0.5847048, 1, 1, 1, 1, 1,
-0.1057988, -0.2219076, -2.812152, 1, 1, 1, 1, 1,
-0.1049035, 1.297182, 1.457478, 1, 1, 1, 1, 1,
-0.0997922, -0.3019048, -3.547648, 1, 1, 1, 1, 1,
-0.09768458, -0.6947657, -3.09944, 1, 1, 1, 1, 1,
-0.097051, -1.256024, -2.285534, 0, 0, 1, 1, 1,
-0.09398044, 1.340987, 0.803225, 1, 0, 0, 1, 1,
-0.09225416, -0.7802576, -3.303144, 1, 0, 0, 1, 1,
-0.08942723, 0.4090163, 0.8649392, 1, 0, 0, 1, 1,
-0.08873245, -0.6518376, -4.800474, 1, 0, 0, 1, 1,
-0.08426099, -0.762974, -3.334785, 1, 0, 0, 1, 1,
-0.08305178, -0.7079096, -2.167491, 0, 0, 0, 1, 1,
-0.08218891, 2.099617, 0.3593344, 0, 0, 0, 1, 1,
-0.07522788, 0.4830264, -0.04615845, 0, 0, 0, 1, 1,
-0.07231446, 0.5185329, 0.2624624, 0, 0, 0, 1, 1,
-0.0705355, 0.1759651, -0.01235967, 0, 0, 0, 1, 1,
-0.07048742, 3.116657, 1.744867, 0, 0, 0, 1, 1,
-0.06994982, -0.2121055, -2.842416, 0, 0, 0, 1, 1,
-0.06593766, 0.02542512, -0.9930157, 1, 1, 1, 1, 1,
-0.06289656, 0.8594001, 0.4788168, 1, 1, 1, 1, 1,
-0.06212446, -0.6368502, -3.149733, 1, 1, 1, 1, 1,
-0.05951893, -1.710314, -1.843312, 1, 1, 1, 1, 1,
-0.05934386, 0.9646679, 0.5407937, 1, 1, 1, 1, 1,
-0.05670141, -1.885331, -2.458808, 1, 1, 1, 1, 1,
-0.05448284, 1.273786, -0.7832349, 1, 1, 1, 1, 1,
-0.05245131, -0.2796597, -1.961284, 1, 1, 1, 1, 1,
-0.05137046, 0.4489299, 0.9437691, 1, 1, 1, 1, 1,
-0.04790705, -0.2417955, -2.636042, 1, 1, 1, 1, 1,
-0.04211003, -0.07175838, -1.971254, 1, 1, 1, 1, 1,
-0.04205513, -0.1158465, -2.414652, 1, 1, 1, 1, 1,
-0.04015711, 0.5415895, 0.414743, 1, 1, 1, 1, 1,
-0.0366172, -0.7161139, -2.093497, 1, 1, 1, 1, 1,
-0.03564287, -0.6244445, -3.707374, 1, 1, 1, 1, 1,
-0.03458504, -0.5854324, -3.887831, 0, 0, 1, 1, 1,
-0.03266429, 0.5832654, 0.5607986, 1, 0, 0, 1, 1,
-0.02485167, 0.2491475, -0.7317252, 1, 0, 0, 1, 1,
-0.0244764, 0.5454075, 0.4790969, 1, 0, 0, 1, 1,
-0.02292213, -0.3386351, -3.851053, 1, 0, 0, 1, 1,
-0.01897146, 0.6826638, -0.02760115, 1, 0, 0, 1, 1,
-0.01438422, -1.055924, -4.641136, 0, 0, 0, 1, 1,
-0.0129313, -0.5377916, -2.246105, 0, 0, 0, 1, 1,
-0.01179, -1.943335, -5.27982, 0, 0, 0, 1, 1,
-0.01169795, 1.009497, 0.58609, 0, 0, 0, 1, 1,
-0.01120068, -1.239928, -3.467933, 0, 0, 0, 1, 1,
-0.01002458, -1.043039, -3.244214, 0, 0, 0, 1, 1,
-0.006910255, -0.212772, -3.282867, 0, 0, 0, 1, 1,
0.00262185, 0.2437395, -0.1553472, 1, 1, 1, 1, 1,
0.00264622, 1.9873, 1.620509, 1, 1, 1, 1, 1,
0.006776189, 1.071279, -0.8286002, 1, 1, 1, 1, 1,
0.01075474, -0.1203178, 3.825465, 1, 1, 1, 1, 1,
0.01146546, 0.2432594, 1.092132, 1, 1, 1, 1, 1,
0.01247202, -1.434258, 3.320184, 1, 1, 1, 1, 1,
0.01343195, 1.563401, 0.5962522, 1, 1, 1, 1, 1,
0.01628116, -0.8451234, 5.223096, 1, 1, 1, 1, 1,
0.01717495, -0.1125043, 4.688691, 1, 1, 1, 1, 1,
0.01922083, -0.6377999, 1.468628, 1, 1, 1, 1, 1,
0.02227939, 0.4684568, -0.4679971, 1, 1, 1, 1, 1,
0.02609676, 1.712958, -0.7011094, 1, 1, 1, 1, 1,
0.03155455, 0.06211963, -0.3463205, 1, 1, 1, 1, 1,
0.0359184, 0.2790959, 0.09803979, 1, 1, 1, 1, 1,
0.04620093, -1.584468, 5.804046, 1, 1, 1, 1, 1,
0.04621548, 0.5384755, 0.1594182, 0, 0, 1, 1, 1,
0.04880147, 0.5544748, -0.04861411, 1, 0, 0, 1, 1,
0.04929146, -1.487917, 3.472192, 1, 0, 0, 1, 1,
0.05528001, -0.8303246, 2.442764, 1, 0, 0, 1, 1,
0.05642432, 1.079307, 1.33427, 1, 0, 0, 1, 1,
0.05705592, -1.33808, 3.056695, 1, 0, 0, 1, 1,
0.05866244, 1.310482, -0.1773074, 0, 0, 0, 1, 1,
0.06072412, -0.3864563, 2.049752, 0, 0, 0, 1, 1,
0.0623381, 1.010822, -1.395385, 0, 0, 0, 1, 1,
0.06301612, 1.157749, 1.016767, 0, 0, 0, 1, 1,
0.06748399, 0.7990705, 0.04951812, 0, 0, 0, 1, 1,
0.06829441, 0.02856312, 3.023184, 0, 0, 0, 1, 1,
0.06892542, -1.237793, 2.472559, 0, 0, 0, 1, 1,
0.07208622, -0.5953488, 2.772545, 1, 1, 1, 1, 1,
0.07657896, 0.9947377, 0.5979183, 1, 1, 1, 1, 1,
0.08038188, -0.2770915, 2.639422, 1, 1, 1, 1, 1,
0.0829846, 1.295725, -1.257453, 1, 1, 1, 1, 1,
0.08400308, -1.872081, 2.321364, 1, 1, 1, 1, 1,
0.08728432, 0.4441596, 1.677795, 1, 1, 1, 1, 1,
0.09119688, -0.1831488, 3.046392, 1, 1, 1, 1, 1,
0.09185716, 0.6836812, -1.005913, 1, 1, 1, 1, 1,
0.09405962, -0.5764781, 4.122537, 1, 1, 1, 1, 1,
0.09519032, 0.2414498, -0.1569125, 1, 1, 1, 1, 1,
0.09601846, 0.3678015, 1.70204, 1, 1, 1, 1, 1,
0.09616655, -0.002764711, 0.2325855, 1, 1, 1, 1, 1,
0.0985719, -0.4153192, 0.66715, 1, 1, 1, 1, 1,
0.09908578, -0.3999886, 2.847939, 1, 1, 1, 1, 1,
0.1025172, -1.000627, 2.143126, 1, 1, 1, 1, 1,
0.1066405, -0.3872443, 3.096769, 0, 0, 1, 1, 1,
0.1073783, -1.785412, 5.868608, 1, 0, 0, 1, 1,
0.107991, 0.5244581, -1.160733, 1, 0, 0, 1, 1,
0.1086784, 0.1557694, -0.4078692, 1, 0, 0, 1, 1,
0.1104415, 0.3077693, -0.9119049, 1, 0, 0, 1, 1,
0.1144367, -0.3189022, 3.218486, 1, 0, 0, 1, 1,
0.1147501, -0.5262673, 2.275055, 0, 0, 0, 1, 1,
0.1248365, 0.08507617, 0.08156192, 0, 0, 0, 1, 1,
0.1278978, 1.925455, -1.55523, 0, 0, 0, 1, 1,
0.1299129, 0.08439191, 0.1450631, 0, 0, 0, 1, 1,
0.1308717, -0.957428, 2.545947, 0, 0, 0, 1, 1,
0.1339814, 0.1945394, 1.479292, 0, 0, 0, 1, 1,
0.137989, 0.0589844, 0.1762369, 0, 0, 0, 1, 1,
0.1386878, -0.04742716, 2.641168, 1, 1, 1, 1, 1,
0.1393252, 0.4085822, -0.08876763, 1, 1, 1, 1, 1,
0.1404311, -1.077369, 4.060154, 1, 1, 1, 1, 1,
0.1533347, 0.5419224, 1.244695, 1, 1, 1, 1, 1,
0.1545687, 2.072799, 0.01418678, 1, 1, 1, 1, 1,
0.1558876, -0.2527093, 1.805159, 1, 1, 1, 1, 1,
0.1568137, -0.7513059, 2.690485, 1, 1, 1, 1, 1,
0.1574558, 1.231983, 0.2303224, 1, 1, 1, 1, 1,
0.1578223, -1.671314, 3.188934, 1, 1, 1, 1, 1,
0.1579774, 1.303717, 0.563798, 1, 1, 1, 1, 1,
0.1631554, 0.570563, -1.121883, 1, 1, 1, 1, 1,
0.1631837, 1.482733, -0.3226191, 1, 1, 1, 1, 1,
0.1664769, -0.8704656, 3.903318, 1, 1, 1, 1, 1,
0.1680051, 0.6708413, -0.1250993, 1, 1, 1, 1, 1,
0.1693436, -0.04131745, 0.7011886, 1, 1, 1, 1, 1,
0.1726996, 0.9812186, -2.720128, 0, 0, 1, 1, 1,
0.1737145, 0.2384315, -0.3394834, 1, 0, 0, 1, 1,
0.181644, -1.698249, 2.389881, 1, 0, 0, 1, 1,
0.1897272, 1.193009, 2.519923, 1, 0, 0, 1, 1,
0.1924842, 0.09838323, 2.008417, 1, 0, 0, 1, 1,
0.194179, 0.0523934, 2.423006, 1, 0, 0, 1, 1,
0.1946477, 0.03687558, 0.9333685, 0, 0, 0, 1, 1,
0.1957692, -0.02072806, 1.733971, 0, 0, 0, 1, 1,
0.1983753, 0.4077483, 1.892228, 0, 0, 0, 1, 1,
0.2045909, 0.6093499, 0.2683548, 0, 0, 0, 1, 1,
0.2072958, -0.4075315, 3.022011, 0, 0, 0, 1, 1,
0.2105525, -1.411687, 0.5543407, 0, 0, 0, 1, 1,
0.2131621, -0.4361951, 2.124317, 0, 0, 0, 1, 1,
0.2141277, 0.6710629, -0.06851593, 1, 1, 1, 1, 1,
0.2163736, -0.6732107, 3.402249, 1, 1, 1, 1, 1,
0.2173631, -0.07478169, 1.987506, 1, 1, 1, 1, 1,
0.2184481, 0.7523921, 0.5036905, 1, 1, 1, 1, 1,
0.2184546, 1.215808, -0.2528455, 1, 1, 1, 1, 1,
0.2215693, 0.8671113, 0.5069031, 1, 1, 1, 1, 1,
0.2246613, 0.4944814, 0.2182443, 1, 1, 1, 1, 1,
0.2262507, -0.5644931, 2.777673, 1, 1, 1, 1, 1,
0.226463, -0.7023068, 4.048857, 1, 1, 1, 1, 1,
0.2287357, 1.197128, -0.4913594, 1, 1, 1, 1, 1,
0.230692, 0.8542446, 1.507497, 1, 1, 1, 1, 1,
0.2344528, 0.7035347, 0.5616505, 1, 1, 1, 1, 1,
0.2410091, -0.9854584, 1.632052, 1, 1, 1, 1, 1,
0.2423025, 1.852828, -0.671399, 1, 1, 1, 1, 1,
0.2504889, 1.977864, 0.4817041, 1, 1, 1, 1, 1,
0.2514322, -1.620959, 3.895876, 0, 0, 1, 1, 1,
0.2547041, 1.212066, 1.697408, 1, 0, 0, 1, 1,
0.2547524, -0.8212001, 2.193452, 1, 0, 0, 1, 1,
0.2579215, -0.2454142, 1.471439, 1, 0, 0, 1, 1,
0.2588215, 0.2554943, 0.8299837, 1, 0, 0, 1, 1,
0.2613655, 0.05955544, 1.593605, 1, 0, 0, 1, 1,
0.262309, 1.058605, -0.4614111, 0, 0, 0, 1, 1,
0.2637126, -1.343469, 3.853546, 0, 0, 0, 1, 1,
0.2669429, -0.3270974, 5.887508, 0, 0, 0, 1, 1,
0.2702765, -0.7140945, 2.135412, 0, 0, 0, 1, 1,
0.2702847, -2.120918, 0.9934303, 0, 0, 0, 1, 1,
0.2762272, 0.7713149, 0.05856895, 0, 0, 0, 1, 1,
0.2772435, -1.463495, 3.313681, 0, 0, 0, 1, 1,
0.2781716, 1.212559, 0.4337074, 1, 1, 1, 1, 1,
0.2833114, -0.2736169, 1.590255, 1, 1, 1, 1, 1,
0.2841556, 0.2943707, 0.07002304, 1, 1, 1, 1, 1,
0.2853588, -0.6814021, 1.416482, 1, 1, 1, 1, 1,
0.2869924, 0.3345366, -1.299984, 1, 1, 1, 1, 1,
0.2888835, -1.116823, 2.050611, 1, 1, 1, 1, 1,
0.2928058, -1.175847, 1.158657, 1, 1, 1, 1, 1,
0.2937302, -1.566841, 2.690891, 1, 1, 1, 1, 1,
0.2946784, -0.3437717, 3.084946, 1, 1, 1, 1, 1,
0.2968248, -1.398087, 3.728364, 1, 1, 1, 1, 1,
0.3023301, -0.9979222, 1.75554, 1, 1, 1, 1, 1,
0.3041449, 1.309609, 0.1617803, 1, 1, 1, 1, 1,
0.3050081, -1.529187, 3.164141, 1, 1, 1, 1, 1,
0.3093797, -0.002751067, 2.590419, 1, 1, 1, 1, 1,
0.3111333, -0.742133, 3.640342, 1, 1, 1, 1, 1,
0.3121808, -0.4066586, 3.686738, 0, 0, 1, 1, 1,
0.3146757, 1.042614, 0.9641579, 1, 0, 0, 1, 1,
0.3159405, 0.5655777, 1.808177, 1, 0, 0, 1, 1,
0.3162497, -0.7548356, 3.39678, 1, 0, 0, 1, 1,
0.318318, -0.7987736, 1.643559, 1, 0, 0, 1, 1,
0.3206823, 0.4241499, 1.628361, 1, 0, 0, 1, 1,
0.3222009, 0.2198555, 2.348778, 0, 0, 0, 1, 1,
0.3229147, -0.1335952, 2.295602, 0, 0, 0, 1, 1,
0.3236209, -1.674032, 1.574226, 0, 0, 0, 1, 1,
0.3239225, -0.5550726, 2.614628, 0, 0, 0, 1, 1,
0.3248724, -0.5042564, 2.308305, 0, 0, 0, 1, 1,
0.3257176, -0.6634085, 2.558331, 0, 0, 0, 1, 1,
0.326055, 0.437811, -0.7839055, 0, 0, 0, 1, 1,
0.3284027, -1.472049, 3.062732, 1, 1, 1, 1, 1,
0.3314859, 2.34509, 0.4998921, 1, 1, 1, 1, 1,
0.3318564, 0.4031053, 1.482905, 1, 1, 1, 1, 1,
0.3329898, -0.7422475, 4.447495, 1, 1, 1, 1, 1,
0.3358773, 0.194593, 0.1262855, 1, 1, 1, 1, 1,
0.336718, -0.2435966, 3.375851, 1, 1, 1, 1, 1,
0.337402, 1.325695, -0.3689059, 1, 1, 1, 1, 1,
0.3423293, -0.6302341, 2.117608, 1, 1, 1, 1, 1,
0.3489422, -1.098754, 1.311512, 1, 1, 1, 1, 1,
0.3504749, 0.8877923, 1.172041, 1, 1, 1, 1, 1,
0.3529076, 3.069896, 1.233894, 1, 1, 1, 1, 1,
0.3531972, 0.3414183, 1.178806, 1, 1, 1, 1, 1,
0.353704, -1.340023, 1.89957, 1, 1, 1, 1, 1,
0.3601742, 0.7131198, 0.8520432, 1, 1, 1, 1, 1,
0.3611681, 0.6913874, 1.68795, 1, 1, 1, 1, 1,
0.3632155, -0.1024155, 1.384073, 0, 0, 1, 1, 1,
0.3634392, -0.547841, 3.175003, 1, 0, 0, 1, 1,
0.3639061, 1.176549, 0.08366434, 1, 0, 0, 1, 1,
0.3667204, 0.04418977, 1.720473, 1, 0, 0, 1, 1,
0.3693908, 1.19101, 1.430276, 1, 0, 0, 1, 1,
0.3694633, 0.01211014, 0.1314344, 1, 0, 0, 1, 1,
0.3699321, -0.1518319, 0.6202693, 0, 0, 0, 1, 1,
0.3699424, -0.7735143, 2.556796, 0, 0, 0, 1, 1,
0.3724616, -0.1108633, 1.54072, 0, 0, 0, 1, 1,
0.3755808, 0.3466053, 0.2914398, 0, 0, 0, 1, 1,
0.3759239, -0.2286677, 3.662537, 0, 0, 0, 1, 1,
0.378488, -1.344607, 0.8707474, 0, 0, 0, 1, 1,
0.378653, -0.04859469, 1.898833, 0, 0, 0, 1, 1,
0.3818098, 1.313352, 1.324282, 1, 1, 1, 1, 1,
0.382225, 1.926941, 0.506431, 1, 1, 1, 1, 1,
0.3901792, 1.205744, 0.91756, 1, 1, 1, 1, 1,
0.3918642, -1.182846, 2.834468, 1, 1, 1, 1, 1,
0.3930658, -0.9208499, 1.434544, 1, 1, 1, 1, 1,
0.3979218, -0.9082915, 3.279965, 1, 1, 1, 1, 1,
0.3981295, 1.313867, -1.178263, 1, 1, 1, 1, 1,
0.4047574, 0.08731211, 1.839581, 1, 1, 1, 1, 1,
0.405748, -0.4859381, 4.364693, 1, 1, 1, 1, 1,
0.4094191, 2.141605, 1.13553, 1, 1, 1, 1, 1,
0.4113857, -0.9059445, 2.646013, 1, 1, 1, 1, 1,
0.4146579, 0.8242531, 1.03911, 1, 1, 1, 1, 1,
0.4173694, -0.5754169, 3.057488, 1, 1, 1, 1, 1,
0.4194779, 0.1375771, 2.089428, 1, 1, 1, 1, 1,
0.4202886, 0.7449377, 1.852294, 1, 1, 1, 1, 1,
0.4245818, 0.3252371, 0.5985281, 0, 0, 1, 1, 1,
0.424732, -1.46572, 4.655483, 1, 0, 0, 1, 1,
0.4329761, 0.5117605, 1.398193, 1, 0, 0, 1, 1,
0.434562, 0.6623985, 1.68745, 1, 0, 0, 1, 1,
0.4358948, -1.028766, 3.203124, 1, 0, 0, 1, 1,
0.4375566, -0.3535058, 2.415864, 1, 0, 0, 1, 1,
0.4385205, -0.8001336, 0.4810204, 0, 0, 0, 1, 1,
0.4408927, 0.7277279, 0.3912482, 0, 0, 0, 1, 1,
0.4412612, 1.714957, 1.374973, 0, 0, 0, 1, 1,
0.4416836, -1.458457, 3.829807, 0, 0, 0, 1, 1,
0.4456738, 0.01427392, 1.678168, 0, 0, 0, 1, 1,
0.4527164, -1.396385, 4.265424, 0, 0, 0, 1, 1,
0.453712, -0.7426858, 3.804905, 0, 0, 0, 1, 1,
0.4540579, 1.544927, -0.3920943, 1, 1, 1, 1, 1,
0.4542263, -0.7449688, 3.591902, 1, 1, 1, 1, 1,
0.4553287, 1.981088, 1.524741, 1, 1, 1, 1, 1,
0.4568689, -0.7173045, 3.730766, 1, 1, 1, 1, 1,
0.4608015, -2.378871, 4.014121, 1, 1, 1, 1, 1,
0.4705997, 0.9052297, -0.587292, 1, 1, 1, 1, 1,
0.4793554, 1.028738, 1.765092, 1, 1, 1, 1, 1,
0.4803506, 0.6696517, 2.466824, 1, 1, 1, 1, 1,
0.4837301, -0.08723819, 2.224891, 1, 1, 1, 1, 1,
0.4872007, -1.112415, 5.109859, 1, 1, 1, 1, 1,
0.4872999, 0.3375339, 1.976001, 1, 1, 1, 1, 1,
0.4874266, 0.405136, 1.088454, 1, 1, 1, 1, 1,
0.4960733, -1.38916, 1.94526, 1, 1, 1, 1, 1,
0.4963696, 0.1122004, 0.7028978, 1, 1, 1, 1, 1,
0.502764, 0.8823242, -0.6821715, 1, 1, 1, 1, 1,
0.5062116, -1.007063, 3.007803, 0, 0, 1, 1, 1,
0.5080222, 2.098438, 1.11945, 1, 0, 0, 1, 1,
0.5091904, 0.06459856, 1.69088, 1, 0, 0, 1, 1,
0.5129325, 0.3861653, 0.4461834, 1, 0, 0, 1, 1,
0.5255279, -0.4006734, 0.7149954, 1, 0, 0, 1, 1,
0.5304301, -0.188125, 3.388941, 1, 0, 0, 1, 1,
0.5310975, -0.03276086, 2.735567, 0, 0, 0, 1, 1,
0.5418945, -1.432978, 1.488013, 0, 0, 0, 1, 1,
0.5455913, 0.7874485, -1.139791, 0, 0, 0, 1, 1,
0.549046, 1.876384, -0.03627364, 0, 0, 0, 1, 1,
0.559136, -0.6201447, 4.149335, 0, 0, 0, 1, 1,
0.5593153, 0.7514518, -0.1075294, 0, 0, 0, 1, 1,
0.5602368, -0.5978944, 3.148083, 0, 0, 0, 1, 1,
0.5687549, 0.5073075, 1.694933, 1, 1, 1, 1, 1,
0.572037, 1.24664, 1.343391, 1, 1, 1, 1, 1,
0.5727488, 1.388661, 1.266505, 1, 1, 1, 1, 1,
0.575151, -0.6700221, 1.77635, 1, 1, 1, 1, 1,
0.5833366, -0.7479001, 2.783355, 1, 1, 1, 1, 1,
0.5841878, 0.2340614, 3.39667, 1, 1, 1, 1, 1,
0.5856679, 1.976742, -0.01069669, 1, 1, 1, 1, 1,
0.5859753, -1.222022, 3.131005, 1, 1, 1, 1, 1,
0.5908117, 1.271147, 0.8118694, 1, 1, 1, 1, 1,
0.5916814, 0.5469182, -0.3147104, 1, 1, 1, 1, 1,
0.5971014, 1.15092, -0.7512456, 1, 1, 1, 1, 1,
0.610925, -0.5847, 0.5984768, 1, 1, 1, 1, 1,
0.6116655, 0.02435391, 2.071575, 1, 1, 1, 1, 1,
0.6129043, -0.05795237, 1.362905, 1, 1, 1, 1, 1,
0.6159266, 0.6194015, 2.321225, 1, 1, 1, 1, 1,
0.6233368, -0.05296241, 0.7579797, 0, 0, 1, 1, 1,
0.6278171, -0.05811212, 1.039357, 1, 0, 0, 1, 1,
0.6302125, 2.440713, 1.372576, 1, 0, 0, 1, 1,
0.6392936, 1.355725, 1.012153, 1, 0, 0, 1, 1,
0.6393211, -1.178403, 1.743534, 1, 0, 0, 1, 1,
0.642556, 0.1248563, 1.937648, 1, 0, 0, 1, 1,
0.6451789, 0.5575302, 1.757486, 0, 0, 0, 1, 1,
0.6469279, -0.3477616, 1.575373, 0, 0, 0, 1, 1,
0.6548157, 0.9515358, 2.432472, 0, 0, 0, 1, 1,
0.6568104, 0.8537177, 0.4428023, 0, 0, 0, 1, 1,
0.6581128, -2.171914, 2.596355, 0, 0, 0, 1, 1,
0.6600822, -0.9092802, 3.292684, 0, 0, 0, 1, 1,
0.6620069, 1.238402, 0.8682289, 0, 0, 0, 1, 1,
0.6672449, 0.2893152, 2.688199, 1, 1, 1, 1, 1,
0.6718107, -1.607809, 3.212099, 1, 1, 1, 1, 1,
0.6724161, 0.7138348, 0.395813, 1, 1, 1, 1, 1,
0.6734163, 0.4001453, 0.986707, 1, 1, 1, 1, 1,
0.6808875, 0.2212362, 1.879078, 1, 1, 1, 1, 1,
0.6860089, -0.03707379, 1.942722, 1, 1, 1, 1, 1,
0.6861336, 0.5534557, 0.8892867, 1, 1, 1, 1, 1,
0.686166, 0.6679071, -0.2766782, 1, 1, 1, 1, 1,
0.6874528, -0.5577345, 1.561883, 1, 1, 1, 1, 1,
0.6875983, 0.9008843, -1.938935, 1, 1, 1, 1, 1,
0.6893151, -0.03408203, 1.274658, 1, 1, 1, 1, 1,
0.689955, -0.5828755, 1.520981, 1, 1, 1, 1, 1,
0.7013278, -0.4616637, 2.492923, 1, 1, 1, 1, 1,
0.7063547, 1.529715, -0.4786255, 1, 1, 1, 1, 1,
0.7075208, 0.8510933, -0.8521571, 1, 1, 1, 1, 1,
0.7128474, 1.465502, 0.6251971, 0, 0, 1, 1, 1,
0.7133458, -0.6649221, 3.61946, 1, 0, 0, 1, 1,
0.7216487, -1.868749, 1.118776, 1, 0, 0, 1, 1,
0.7290074, 0.2510723, -0.2165477, 1, 0, 0, 1, 1,
0.7294942, 0.8390166, 1.675535, 1, 0, 0, 1, 1,
0.7308171, 1.049088, 1.693436, 1, 0, 0, 1, 1,
0.7367686, -1.473006, 3.272989, 0, 0, 0, 1, 1,
0.7401492, 1.477564, 2.418949, 0, 0, 0, 1, 1,
0.7405839, -0.02756044, -0.2852717, 0, 0, 0, 1, 1,
0.7425752, 1.461053, 1.74469, 0, 0, 0, 1, 1,
0.7481474, 0.3443412, 0.6124763, 0, 0, 0, 1, 1,
0.7501029, -0.8199862, 2.634904, 0, 0, 0, 1, 1,
0.7512541, 0.5971995, 0.3578156, 0, 0, 0, 1, 1,
0.7528774, 1.173588, -0.2566035, 1, 1, 1, 1, 1,
0.7581029, -1.49846, 3.00624, 1, 1, 1, 1, 1,
0.7593935, -1.428816, 2.65707, 1, 1, 1, 1, 1,
0.7629224, 0.6478671, -0.5635915, 1, 1, 1, 1, 1,
0.7664115, -0.03906054, 2.017715, 1, 1, 1, 1, 1,
0.7677782, 1.267132, 1.303591, 1, 1, 1, 1, 1,
0.7795569, 1.35405, 0.4018437, 1, 1, 1, 1, 1,
0.7813662, 0.901642, 0.0481408, 1, 1, 1, 1, 1,
0.7818362, -1.122449, 2.914312, 1, 1, 1, 1, 1,
0.7820089, -1.53725, 2.524179, 1, 1, 1, 1, 1,
0.7841712, 0.7969523, 1.550167, 1, 1, 1, 1, 1,
0.7880171, 0.7807626, 1.625224, 1, 1, 1, 1, 1,
0.788076, -0.8948013, 1.370946, 1, 1, 1, 1, 1,
0.7908198, 1.508047, 0.2993673, 1, 1, 1, 1, 1,
0.7959784, 1.724803, -0.9623806, 1, 1, 1, 1, 1,
0.7974507, -0.6269029, 1.801148, 0, 0, 1, 1, 1,
0.7977679, 0.9376093, 1.591306, 1, 0, 0, 1, 1,
0.8012808, 0.5141488, 0.9868705, 1, 0, 0, 1, 1,
0.8045436, -0.5665663, 0.3614343, 1, 0, 0, 1, 1,
0.811628, -0.0821621, 2.618414, 1, 0, 0, 1, 1,
0.8154367, 0.9456635, -1.08438, 1, 0, 0, 1, 1,
0.8225474, -0.02560195, 0.7858506, 0, 0, 0, 1, 1,
0.8233212, -0.1192584, 1.276541, 0, 0, 0, 1, 1,
0.8251951, 0.7425298, 0.4248479, 0, 0, 0, 1, 1,
0.8288726, 1.000695, 2.990713, 0, 0, 0, 1, 1,
0.8348179, -0.4641053, -0.005097893, 0, 0, 0, 1, 1,
0.8358178, 0.8240411, 1.432114, 0, 0, 0, 1, 1,
0.837259, -1.441084, 0.9585859, 0, 0, 0, 1, 1,
0.845768, -0.5675669, 2.908139, 1, 1, 1, 1, 1,
0.8511088, 1.767638, -0.6715541, 1, 1, 1, 1, 1,
0.8514622, 1.707001, 0.007930741, 1, 1, 1, 1, 1,
0.8521147, -0.6284105, 1.080329, 1, 1, 1, 1, 1,
0.8545051, 0.539656, 2.021392, 1, 1, 1, 1, 1,
0.8563488, 0.6854298, 1.582763, 1, 1, 1, 1, 1,
0.8575131, -0.7796451, 3.468025, 1, 1, 1, 1, 1,
0.86461, 2.266494, 1.663171, 1, 1, 1, 1, 1,
0.8720984, 0.4536254, 1.093251, 1, 1, 1, 1, 1,
0.8766117, 0.3121351, 2.244637, 1, 1, 1, 1, 1,
0.8779821, 1.291438, 0.2184209, 1, 1, 1, 1, 1,
0.8790905, -0.9732187, 1.952681, 1, 1, 1, 1, 1,
0.8804041, -1.951037, 3.450253, 1, 1, 1, 1, 1,
0.8833129, -0.09030788, 2.159171, 1, 1, 1, 1, 1,
0.8840638, 0.9757878, 1.349644, 1, 1, 1, 1, 1,
0.8894645, 1.058419, 1.674909, 0, 0, 1, 1, 1,
0.8982884, 0.3328916, 1.30659, 1, 0, 0, 1, 1,
0.898656, -0.5189723, 4.343829, 1, 0, 0, 1, 1,
0.8988077, 0.5901012, -1.052721, 1, 0, 0, 1, 1,
0.9129558, -0.793882, 1.537756, 1, 0, 0, 1, 1,
0.9167234, 0.9504932, 0.9452642, 1, 0, 0, 1, 1,
0.9256256, -0.814696, 3.111253, 0, 0, 0, 1, 1,
0.929563, -0.08853684, 1.072094, 0, 0, 0, 1, 1,
0.9302088, -0.5155246, 3.672925, 0, 0, 0, 1, 1,
0.9306551, -0.3697893, 1.161148, 0, 0, 0, 1, 1,
0.936201, -0.3916154, 3.735445, 0, 0, 0, 1, 1,
0.9375403, 1.199823, -1.039663, 0, 0, 0, 1, 1,
0.9480249, 0.4075402, 2.235482, 0, 0, 0, 1, 1,
0.9510218, 0.02574912, 2.082253, 1, 1, 1, 1, 1,
0.9520021, 0.05940295, -0.177359, 1, 1, 1, 1, 1,
0.9584149, -2.750615, 2.23331, 1, 1, 1, 1, 1,
0.9642738, -0.4962877, 2.346262, 1, 1, 1, 1, 1,
0.966114, -0.2714107, 0.5600377, 1, 1, 1, 1, 1,
0.9705909, -0.4777416, 0.5847673, 1, 1, 1, 1, 1,
0.9749059, -0.9248137, 2.573916, 1, 1, 1, 1, 1,
0.9757063, -0.3067989, 2.607187, 1, 1, 1, 1, 1,
0.9836981, -0.7817725, 3.487589, 1, 1, 1, 1, 1,
0.9880205, 0.2172208, 1.111258, 1, 1, 1, 1, 1,
0.9891752, -1.107797, 1.053461, 1, 1, 1, 1, 1,
0.9905591, -0.7486277, 1.051596, 1, 1, 1, 1, 1,
0.9935459, 1.193899, -0.6902134, 1, 1, 1, 1, 1,
0.9968517, -0.02799594, 2.113429, 1, 1, 1, 1, 1,
0.9979817, -0.3977536, 2.179743, 1, 1, 1, 1, 1,
1.003172, -0.7306069, 0.1624724, 0, 0, 1, 1, 1,
1.009408, -0.4248707, 1.486041, 1, 0, 0, 1, 1,
1.009735, 0.7422227, 1.039748, 1, 0, 0, 1, 1,
1.01597, -1.116625, 0.4125178, 1, 0, 0, 1, 1,
1.017757, -0.463153, 3.202789, 1, 0, 0, 1, 1,
1.023513, -0.4669018, 2.322515, 1, 0, 0, 1, 1,
1.024423, -0.2836522, 4.201393, 0, 0, 0, 1, 1,
1.029606, 0.1855387, 2.256185, 0, 0, 0, 1, 1,
1.037971, -0.5373607, -0.08194159, 0, 0, 0, 1, 1,
1.044664, 0.6050245, 0.4790195, 0, 0, 0, 1, 1,
1.046308, -0.5853429, 1.433382, 0, 0, 0, 1, 1,
1.04699, 0.08537444, 3.75959, 0, 0, 0, 1, 1,
1.048104, 0.2321751, 2.544627, 0, 0, 0, 1, 1,
1.054684, 1.013213, 1.070477e-05, 1, 1, 1, 1, 1,
1.059134, -0.009642361, 3.681303, 1, 1, 1, 1, 1,
1.059511, 0.3290118, 0.9093162, 1, 1, 1, 1, 1,
1.060108, -1.765844, 4.224891, 1, 1, 1, 1, 1,
1.060396, -0.2671171, 2.168824, 1, 1, 1, 1, 1,
1.061014, 1.253419, 1.291271, 1, 1, 1, 1, 1,
1.074736, 0.1878506, 0.7584183, 1, 1, 1, 1, 1,
1.07544, -0.4296468, 0.5761128, 1, 1, 1, 1, 1,
1.082085, -0.5322943, 2.816814, 1, 1, 1, 1, 1,
1.085824, -1.039528, 2.965254, 1, 1, 1, 1, 1,
1.086534, -1.270648, 3.677499, 1, 1, 1, 1, 1,
1.096319, -0.5510063, 1.473422, 1, 1, 1, 1, 1,
1.096851, -0.2463534, 1.957791, 1, 1, 1, 1, 1,
1.101386, 0.1018791, 0.4822409, 1, 1, 1, 1, 1,
1.119585, -1.396524, 3.255728, 1, 1, 1, 1, 1,
1.122089, 1.178719, 1.736112, 0, 0, 1, 1, 1,
1.123356, -0.7158822, 2.497579, 1, 0, 0, 1, 1,
1.125279, -0.8286041, 3.14677, 1, 0, 0, 1, 1,
1.125657, 0.971547, 1.363234, 1, 0, 0, 1, 1,
1.125791, 1.353323, 1.339877, 1, 0, 0, 1, 1,
1.130352, 0.5877975, 2.308459, 1, 0, 0, 1, 1,
1.132986, -0.629731, 1.491785, 0, 0, 0, 1, 1,
1.134997, 2.094259, -0.5366773, 0, 0, 0, 1, 1,
1.140561, 1.17698, 1.120317, 0, 0, 0, 1, 1,
1.144737, 0.9004689, -0.09327095, 0, 0, 0, 1, 1,
1.148865, 0.4877495, 1.660624, 0, 0, 0, 1, 1,
1.154904, -0.8429758, 3.167905, 0, 0, 0, 1, 1,
1.170947, -0.9935576, 1.744902, 0, 0, 0, 1, 1,
1.184037, -0.3957703, 2.409875, 1, 1, 1, 1, 1,
1.191342, -0.8927519, 1.76146, 1, 1, 1, 1, 1,
1.205886, -1.230302, 1.680558, 1, 1, 1, 1, 1,
1.220126, -0.07182916, 0.7004244, 1, 1, 1, 1, 1,
1.224133, 0.1183651, 1.112683, 1, 1, 1, 1, 1,
1.231503, -1.822555, 1.214013, 1, 1, 1, 1, 1,
1.23668, -0.1244096, 1.895237, 1, 1, 1, 1, 1,
1.238465, -0.2378516, 0.8260494, 1, 1, 1, 1, 1,
1.238559, -0.64843, 2.01162, 1, 1, 1, 1, 1,
1.243513, 1.527546, 0.2395158, 1, 1, 1, 1, 1,
1.244802, 0.3734523, 2.074188, 1, 1, 1, 1, 1,
1.245285, 1.453158, 1.676439, 1, 1, 1, 1, 1,
1.2493, -1.22534, 2.933814, 1, 1, 1, 1, 1,
1.251288, 0.3979824, 0.2135306, 1, 1, 1, 1, 1,
1.254981, -1.037534, 0.6921804, 1, 1, 1, 1, 1,
1.264116, -0.8956367, 1.558274, 0, 0, 1, 1, 1,
1.27125, -0.4200491, 2.572942, 1, 0, 0, 1, 1,
1.289086, -0.4430789, 1.806864, 1, 0, 0, 1, 1,
1.300729, -1.178805, 0.8946069, 1, 0, 0, 1, 1,
1.304008, -0.7060067, 1.607946, 1, 0, 0, 1, 1,
1.304498, -0.2258016, 1.564465, 1, 0, 0, 1, 1,
1.306262, 0.3098002, -0.1764343, 0, 0, 0, 1, 1,
1.306638, -0.1281396, 2.305076, 0, 0, 0, 1, 1,
1.307456, -1.836649, 0.9885841, 0, 0, 0, 1, 1,
1.315197, -1.58629, 2.711941, 0, 0, 0, 1, 1,
1.316094, -0.6501275, 2.037398, 0, 0, 0, 1, 1,
1.328487, -0.01068117, 3.143047, 0, 0, 0, 1, 1,
1.334655, -0.5359432, 3.656945, 0, 0, 0, 1, 1,
1.336115, -0.6909074, 3.050805, 1, 1, 1, 1, 1,
1.337755, 0.4074484, 2.414042, 1, 1, 1, 1, 1,
1.338, 1.370861, 1.175146, 1, 1, 1, 1, 1,
1.370168, 1.527558, 0.539823, 1, 1, 1, 1, 1,
1.371575, -0.3305207, 1.485251, 1, 1, 1, 1, 1,
1.37488, 0.03532877, 1.804764, 1, 1, 1, 1, 1,
1.379175, 0.7315251, 1.903892, 1, 1, 1, 1, 1,
1.387719, 1.320655, 2.448166, 1, 1, 1, 1, 1,
1.38817, 0.8302315, 0.8728239, 1, 1, 1, 1, 1,
1.392668, -0.3978709, 1.397265, 1, 1, 1, 1, 1,
1.399233, -0.7952148, 2.80209, 1, 1, 1, 1, 1,
1.407663, 0.002184035, -0.07144542, 1, 1, 1, 1, 1,
1.414586, -0.4599242, 1.227356, 1, 1, 1, 1, 1,
1.421217, 1.003153, -0.2665285, 1, 1, 1, 1, 1,
1.421566, 0.2327148, 0.6989017, 1, 1, 1, 1, 1,
1.431699, 1.65573, -0.1014284, 0, 0, 1, 1, 1,
1.448248, 1.503576, -0.6367555, 1, 0, 0, 1, 1,
1.451156, 1.025793, 0.05818469, 1, 0, 0, 1, 1,
1.460379, -0.5050077, 2.579761, 1, 0, 0, 1, 1,
1.488699, -0.8994152, 2.388509, 1, 0, 0, 1, 1,
1.497461, 1.106595, 1.912082, 1, 0, 0, 1, 1,
1.510205, -1.524406, 2.40492, 0, 0, 0, 1, 1,
1.518255, 2.351573, 0.9793072, 0, 0, 0, 1, 1,
1.519939, 0.8989908, 1.059734, 0, 0, 0, 1, 1,
1.535981, 0.5359125, 3.766967, 0, 0, 0, 1, 1,
1.538407, -0.3409151, 2.683316, 0, 0, 0, 1, 1,
1.544564, -0.1416022, 1.070184, 0, 0, 0, 1, 1,
1.545989, -0.3905478, 2.530903, 0, 0, 0, 1, 1,
1.551905, -1.275214, 3.759717, 1, 1, 1, 1, 1,
1.553079, 1.000156, 0.02890568, 1, 1, 1, 1, 1,
1.566322, -0.3632481, 1.789856, 1, 1, 1, 1, 1,
1.574226, 0.2749041, 1.060563, 1, 1, 1, 1, 1,
1.581533, -0.7706819, 1.482789, 1, 1, 1, 1, 1,
1.582883, 0.7231952, 1.422798, 1, 1, 1, 1, 1,
1.583973, 0.5899984, 1.390001, 1, 1, 1, 1, 1,
1.587528, 0.6037122, -0.5221962, 1, 1, 1, 1, 1,
1.600706, 0.2904088, 1.096602, 1, 1, 1, 1, 1,
1.608761, -1.585513, 1.244166, 1, 1, 1, 1, 1,
1.611066, -0.8175794, 2.475555, 1, 1, 1, 1, 1,
1.613004, 0.146887, 2.091444, 1, 1, 1, 1, 1,
1.619564, 1.284021, 2.231753, 1, 1, 1, 1, 1,
1.627023, -1.111203, 2.241803, 1, 1, 1, 1, 1,
1.627086, 0.08752043, 2.339101, 1, 1, 1, 1, 1,
1.65642, 1.605915, 0.0697, 0, 0, 1, 1, 1,
1.665138, 1.601231, 2.10297, 1, 0, 0, 1, 1,
1.667477, 0.2076546, 0.1261275, 1, 0, 0, 1, 1,
1.676332, -0.2722506, 1.436177, 1, 0, 0, 1, 1,
1.687983, 0.1001983, 0.4902066, 1, 0, 0, 1, 1,
1.69679, 0.1697226, 0.9043596, 1, 0, 0, 1, 1,
1.702865, 0.5115368, 2.1828, 0, 0, 0, 1, 1,
1.706103, 1.697245, 1.439079, 0, 0, 0, 1, 1,
1.724106, 0.465168, 1.392905, 0, 0, 0, 1, 1,
1.750122, 0.1854058, 2.319792, 0, 0, 0, 1, 1,
1.765518, 2.538753, 1.717876, 0, 0, 0, 1, 1,
1.765712, 0.674114, 3.054526, 0, 0, 0, 1, 1,
1.808393, 1.674888, 0.7277938, 0, 0, 0, 1, 1,
1.814588, 1.184374, 1.425504, 1, 1, 1, 1, 1,
1.821463, 0.268839, 2.749882, 1, 1, 1, 1, 1,
1.831528, -0.4238623, 0.8783225, 1, 1, 1, 1, 1,
1.865095, -0.3682439, 1.296978, 1, 1, 1, 1, 1,
1.897391, -0.9231174, 2.811462, 1, 1, 1, 1, 1,
1.933601, -0.0961077, 2.148913, 1, 1, 1, 1, 1,
1.937672, -0.797737, 3.252813, 1, 1, 1, 1, 1,
1.939451, -0.9810176, 2.18807, 1, 1, 1, 1, 1,
1.946831, -0.2141842, 1.524441, 1, 1, 1, 1, 1,
1.9595, -0.923902, 0.3668708, 1, 1, 1, 1, 1,
1.966741, -0.8932126, 2.369957, 1, 1, 1, 1, 1,
1.989495, 0.1220614, 3.01309, 1, 1, 1, 1, 1,
2.006749, 1.118829, 1.161139, 1, 1, 1, 1, 1,
2.023032, -1.127396, 1.493429, 1, 1, 1, 1, 1,
2.19635, 1.442265, 1.047381, 1, 1, 1, 1, 1,
2.198652, -1.691009, 3.701472, 0, 0, 1, 1, 1,
2.204278, -0.3272089, 0.4386188, 1, 0, 0, 1, 1,
2.205271, -0.9849679, 2.060657, 1, 0, 0, 1, 1,
2.244791, 1.852292, -0.8733602, 1, 0, 0, 1, 1,
2.261415, 1.969538, 1.558726, 1, 0, 0, 1, 1,
2.27309, -0.9141437, 2.939935, 1, 0, 0, 1, 1,
2.286513, -0.4276078, 2.365314, 0, 0, 0, 1, 1,
2.393257, -0.05851512, 1.7314, 0, 0, 0, 1, 1,
2.402221, -0.02129751, 1.758876, 0, 0, 0, 1, 1,
2.403647, 0.9847835, 1.814545, 0, 0, 0, 1, 1,
2.484046, -1.435238, 2.498368, 0, 0, 0, 1, 1,
2.503564, 1.298429, 2.221645, 0, 0, 0, 1, 1,
2.565007, -1.318725, 2.912767, 0, 0, 0, 1, 1,
2.611391, 0.7686366, 1.123232, 1, 1, 1, 1, 1,
2.797756, 0.9666596, 3.102952, 1, 1, 1, 1, 1,
2.87125, -0.3289312, 1.584706, 1, 1, 1, 1, 1,
2.928868, 1.552707, 2.627132, 1, 1, 1, 1, 1,
2.97262, -0.2796211, -0.3512085, 1, 1, 1, 1, 1,
3.23469, -1.015681, 2.741548, 1, 1, 1, 1, 1,
3.277558, -0.4033625, 1.52211, 1, 1, 1, 1, 1
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
var radius = 9.696699;
var distance = 34.05925;
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
mvMatrix.translate( -0.04962778, -0.1439172, -0.2505379 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.05925);
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
