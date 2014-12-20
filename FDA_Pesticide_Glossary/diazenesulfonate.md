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
-3.71494, -1.565829, -1.955449, 1, 0, 0, 1,
-3.186288, -1.173498, -3.7315, 1, 0.007843138, 0, 1,
-3.05819, 1.282463, -1.09391, 1, 0.01176471, 0, 1,
-2.938862, -0.1578609, -2.58196, 1, 0.01960784, 0, 1,
-2.866979, 0.2127728, -1.810292, 1, 0.02352941, 0, 1,
-2.846402, 0.2189907, -1.391937, 1, 0.03137255, 0, 1,
-2.771473, 0.3851713, -0.06773382, 1, 0.03529412, 0, 1,
-2.635476, 0.3885518, -1.37551, 1, 0.04313726, 0, 1,
-2.57439, 0.4989446, -3.68479, 1, 0.04705882, 0, 1,
-2.514603, -0.9849137, -0.6729884, 1, 0.05490196, 0, 1,
-2.430918, 1.223545, -1.924752, 1, 0.05882353, 0, 1,
-2.379601, -0.3464168, -1.464653, 1, 0.06666667, 0, 1,
-2.302099, 1.508176, -0.3638952, 1, 0.07058824, 0, 1,
-2.278064, -0.5378973, -3.658996, 1, 0.07843138, 0, 1,
-2.220198, 1.255733, -0.8198431, 1, 0.08235294, 0, 1,
-2.214559, 1.827735, -1.402654, 1, 0.09019608, 0, 1,
-2.181988, 0.5466237, -1.56867, 1, 0.09411765, 0, 1,
-2.177684, -0.297824, -2.421122, 1, 0.1019608, 0, 1,
-2.15031, 0.3060178, -2.530001, 1, 0.1098039, 0, 1,
-2.149897, -0.7211981, -3.299281, 1, 0.1137255, 0, 1,
-2.141423, -1.941149, -1.434734, 1, 0.1215686, 0, 1,
-2.11557, 1.79435, -0.9846564, 1, 0.1254902, 0, 1,
-2.106253, 0.4997954, -0.5971872, 1, 0.1333333, 0, 1,
-2.056069, -0.711204, -1.223871, 1, 0.1372549, 0, 1,
-2.049591, -1.835158, -3.841094, 1, 0.145098, 0, 1,
-2.04938, -1.962168, -2.553208, 1, 0.1490196, 0, 1,
-2.040805, 1.174796, -1.772248, 1, 0.1568628, 0, 1,
-2.031704, -2.607319, -0.336703, 1, 0.1607843, 0, 1,
-2.008605, -2.496003, -2.7632, 1, 0.1686275, 0, 1,
-1.976929, -0.4161471, 0.5292432, 1, 0.172549, 0, 1,
-1.954281, -0.02201758, -2.13473, 1, 0.1803922, 0, 1,
-1.947505, -0.8421638, -1.146163, 1, 0.1843137, 0, 1,
-1.921493, -0.7918001, -2.856478, 1, 0.1921569, 0, 1,
-1.919776, 1.35728, 1.360701, 1, 0.1960784, 0, 1,
-1.904131, 1.230706, -3.0715, 1, 0.2039216, 0, 1,
-1.898217, -0.3681928, -0.8518499, 1, 0.2117647, 0, 1,
-1.896932, 0.09599092, -1.253638, 1, 0.2156863, 0, 1,
-1.873833, 0.6247228, -2.809182, 1, 0.2235294, 0, 1,
-1.870978, 0.3147281, -2.420889, 1, 0.227451, 0, 1,
-1.867473, 1.373815, -0.7857132, 1, 0.2352941, 0, 1,
-1.865814, 1.240486, -0.9921044, 1, 0.2392157, 0, 1,
-1.845894, -0.4088738, -3.002956, 1, 0.2470588, 0, 1,
-1.837437, -0.03503594, -1.434076, 1, 0.2509804, 0, 1,
-1.835404, 0.3261622, -1.44472, 1, 0.2588235, 0, 1,
-1.819414, -1.022044, -0.8413983, 1, 0.2627451, 0, 1,
-1.816292, -0.3394943, -3.868719, 1, 0.2705882, 0, 1,
-1.813301, -0.2850849, -1.852741, 1, 0.2745098, 0, 1,
-1.811324, -2.162784, -2.848087, 1, 0.282353, 0, 1,
-1.805588, -0.221906, -2.322583, 1, 0.2862745, 0, 1,
-1.784753, -0.5504944, -0.05994877, 1, 0.2941177, 0, 1,
-1.761215, -1.447353, -3.821804, 1, 0.3019608, 0, 1,
-1.7527, 0.1803517, 0.3639095, 1, 0.3058824, 0, 1,
-1.7501, -0.04963772, -0.3148684, 1, 0.3137255, 0, 1,
-1.738587, -0.003149685, -3.646358, 1, 0.3176471, 0, 1,
-1.730077, -0.139626, -0.8339425, 1, 0.3254902, 0, 1,
-1.707731, 0.8144583, -0.2761571, 1, 0.3294118, 0, 1,
-1.702946, -0.5008559, -1.488841, 1, 0.3372549, 0, 1,
-1.701815, 0.4505459, 0.08478377, 1, 0.3411765, 0, 1,
-1.670859, -0.0589618, -0.2581974, 1, 0.3490196, 0, 1,
-1.6413, 0.08648656, -0.9580438, 1, 0.3529412, 0, 1,
-1.641231, -0.08521187, -2.95493, 1, 0.3607843, 0, 1,
-1.639217, 1.578612, -3.219961, 1, 0.3647059, 0, 1,
-1.637204, -1.135627, -2.282212, 1, 0.372549, 0, 1,
-1.624591, 0.6430386, 0.2725217, 1, 0.3764706, 0, 1,
-1.61439, -1.789964, -2.464392, 1, 0.3843137, 0, 1,
-1.608312, 0.8032561, -1.060301, 1, 0.3882353, 0, 1,
-1.588757, 1.550747, 1.055366, 1, 0.3960784, 0, 1,
-1.576915, -1.503221, -4.887412, 1, 0.4039216, 0, 1,
-1.574192, -0.3695827, -2.043308, 1, 0.4078431, 0, 1,
-1.568193, 1.066091, -0.5518513, 1, 0.4156863, 0, 1,
-1.553419, -0.4669512, -2.701339, 1, 0.4196078, 0, 1,
-1.551727, -0.05020459, -1.639867, 1, 0.427451, 0, 1,
-1.516865, -1.09191, -1.864901, 1, 0.4313726, 0, 1,
-1.510517, 0.09321587, -2.117261, 1, 0.4392157, 0, 1,
-1.503093, -1.300374, -2.19983, 1, 0.4431373, 0, 1,
-1.495798, 0.5278642, -0.6505408, 1, 0.4509804, 0, 1,
-1.482822, 0.09545388, -1.351517, 1, 0.454902, 0, 1,
-1.473105, 0.1260959, 0.16994, 1, 0.4627451, 0, 1,
-1.470072, 0.5707989, 0.5854862, 1, 0.4666667, 0, 1,
-1.463977, 0.7192639, 0.2812431, 1, 0.4745098, 0, 1,
-1.459671, -0.6824819, -1.556201, 1, 0.4784314, 0, 1,
-1.452292, 0.1991252, -1.5694, 1, 0.4862745, 0, 1,
-1.450409, -0.4995562, -2.229282, 1, 0.4901961, 0, 1,
-1.4439, 0.1185707, -3.265496, 1, 0.4980392, 0, 1,
-1.426524, -0.8647335, -1.112315, 1, 0.5058824, 0, 1,
-1.411272, -0.2512273, -0.6172311, 1, 0.509804, 0, 1,
-1.410426, 0.4880585, 0.6654797, 1, 0.5176471, 0, 1,
-1.404575, 0.1153313, -0.8946087, 1, 0.5215687, 0, 1,
-1.397558, 0.6963699, -1.31212, 1, 0.5294118, 0, 1,
-1.386291, 0.1216589, -0.1091163, 1, 0.5333334, 0, 1,
-1.384123, 0.3160011, -0.1758171, 1, 0.5411765, 0, 1,
-1.383565, 1.359159, -3.136483, 1, 0.5450981, 0, 1,
-1.376766, 1.742215, -0.4960547, 1, 0.5529412, 0, 1,
-1.366137, 0.2656665, -1.382267, 1, 0.5568628, 0, 1,
-1.350915, -0.1770928, -1.165609, 1, 0.5647059, 0, 1,
-1.332987, 0.6193705, -3.028307, 1, 0.5686275, 0, 1,
-1.320393, 0.6481564, -3.124998, 1, 0.5764706, 0, 1,
-1.316619, 1.497778, -0.8083105, 1, 0.5803922, 0, 1,
-1.315965, 0.3117991, -2.007411, 1, 0.5882353, 0, 1,
-1.309524, -1.126072, -0.9635427, 1, 0.5921569, 0, 1,
-1.306511, -0.807521, -2.796177, 1, 0.6, 0, 1,
-1.306395, 0.385714, -1.016897, 1, 0.6078432, 0, 1,
-1.287975, 2.131366, 0.02068747, 1, 0.6117647, 0, 1,
-1.282019, -0.1769729, -1.625438, 1, 0.6196079, 0, 1,
-1.281934, 0.5474346, -1.552042, 1, 0.6235294, 0, 1,
-1.271107, 0.4032922, 0.2225564, 1, 0.6313726, 0, 1,
-1.264813, 0.2098688, -0.9841331, 1, 0.6352941, 0, 1,
-1.260567, 1.368898, -0.6283816, 1, 0.6431373, 0, 1,
-1.258241, -1.839282, -2.698548, 1, 0.6470588, 0, 1,
-1.258017, 0.8573355, -1.4438, 1, 0.654902, 0, 1,
-1.253762, 0.2116657, -1.489806, 1, 0.6588235, 0, 1,
-1.245352, 0.9547139, -0.4559379, 1, 0.6666667, 0, 1,
-1.240283, -0.8637075, -0.669454, 1, 0.6705883, 0, 1,
-1.225523, 0.3896112, -0.995802, 1, 0.6784314, 0, 1,
-1.222131, -0.7781352, -4.179348, 1, 0.682353, 0, 1,
-1.221222, 0.9548317, -1.570904, 1, 0.6901961, 0, 1,
-1.210473, 1.638026, 0.3543486, 1, 0.6941177, 0, 1,
-1.209352, 1.007645, -2.048561, 1, 0.7019608, 0, 1,
-1.206226, -0.3780687, -2.426057, 1, 0.7098039, 0, 1,
-1.204035, -1.83095, -3.909984, 1, 0.7137255, 0, 1,
-1.201557, 0.2114483, -1.03219, 1, 0.7215686, 0, 1,
-1.199237, 0.4122287, -1.134293, 1, 0.7254902, 0, 1,
-1.186462, -0.9256921, -3.402144, 1, 0.7333333, 0, 1,
-1.182128, -1.112131, -2.314866, 1, 0.7372549, 0, 1,
-1.179665, -0.3745347, -0.9013089, 1, 0.7450981, 0, 1,
-1.176979, 0.1120355, -1.596896, 1, 0.7490196, 0, 1,
-1.174366, -0.2295777, -2.149986, 1, 0.7568628, 0, 1,
-1.170278, -2.070142, -1.077276, 1, 0.7607843, 0, 1,
-1.166644, -1.147675, -2.508098, 1, 0.7686275, 0, 1,
-1.164111, -0.1464006, -2.203224, 1, 0.772549, 0, 1,
-1.159675, -0.4685328, -2.993562, 1, 0.7803922, 0, 1,
-1.153563, 0.1279236, -2.928147, 1, 0.7843137, 0, 1,
-1.147006, 0.2546059, -2.807063, 1, 0.7921569, 0, 1,
-1.137063, -0.8905659, -1.535818, 1, 0.7960784, 0, 1,
-1.137059, -0.2738617, -1.901627, 1, 0.8039216, 0, 1,
-1.131585, 0.1206364, -2.61019, 1, 0.8117647, 0, 1,
-1.128518, 0.9997416, -0.3594007, 1, 0.8156863, 0, 1,
-1.121959, 0.105927, 0.3972769, 1, 0.8235294, 0, 1,
-1.121015, -1.923491, -1.751144, 1, 0.827451, 0, 1,
-1.120605, 0.3077023, -0.6727736, 1, 0.8352941, 0, 1,
-1.117954, 0.501527, -1.267166, 1, 0.8392157, 0, 1,
-1.117781, -0.2434869, -2.449503, 1, 0.8470588, 0, 1,
-1.116421, -0.9397373, -1.641009, 1, 0.8509804, 0, 1,
-1.116073, -0.8632352, -2.128297, 1, 0.8588235, 0, 1,
-1.113424, -0.5864449, -1.198399, 1, 0.8627451, 0, 1,
-1.100534, 0.00938303, -2.367074, 1, 0.8705882, 0, 1,
-1.093997, 0.8761169, -1.982286, 1, 0.8745098, 0, 1,
-1.089042, -0.9037092, -4.257964, 1, 0.8823529, 0, 1,
-1.087219, -0.5367206, -1.919239, 1, 0.8862745, 0, 1,
-1.081209, -0.1187257, -2.162654, 1, 0.8941177, 0, 1,
-1.080076, -1.092966, 0.4060632, 1, 0.8980392, 0, 1,
-1.077541, 1.519167, 0.8619618, 1, 0.9058824, 0, 1,
-1.074243, -0.8875169, -2.811782, 1, 0.9137255, 0, 1,
-1.072574, 1.214684, 0.2179679, 1, 0.9176471, 0, 1,
-1.068749, -0.003961653, -2.398336, 1, 0.9254902, 0, 1,
-1.066187, 1.705778, -1.52596, 1, 0.9294118, 0, 1,
-1.065521, 0.127207, -0.04846737, 1, 0.9372549, 0, 1,
-1.064625, -0.7534257, -0.7422565, 1, 0.9411765, 0, 1,
-1.062769, 1.086627, -0.5547532, 1, 0.9490196, 0, 1,
-1.062157, 1.184975, -0.4598161, 1, 0.9529412, 0, 1,
-1.054361, 1.300222, -0.9739137, 1, 0.9607843, 0, 1,
-1.046444, 0.4243384, -1.606845, 1, 0.9647059, 0, 1,
-1.043109, 1.352145, -0.2656787, 1, 0.972549, 0, 1,
-1.040282, 0.9088871, -1.613342, 1, 0.9764706, 0, 1,
-1.029543, -0.6676126, -2.239876, 1, 0.9843137, 0, 1,
-1.020689, 1.175549, 0.7809091, 1, 0.9882353, 0, 1,
-1.018302, 0.2521657, -2.431559, 1, 0.9960784, 0, 1,
-1.01821, -0.4632137, -2.933757, 0.9960784, 1, 0, 1,
-1.017233, -1.189697, -2.956497, 0.9921569, 1, 0, 1,
-1.012847, -2.143093, -2.751221, 0.9843137, 1, 0, 1,
-1.008782, -1.20849, -3.169008, 0.9803922, 1, 0, 1,
-0.988889, -2.244843, -1.615793, 0.972549, 1, 0, 1,
-0.9878466, 0.2332725, -1.166106, 0.9686275, 1, 0, 1,
-0.9872201, 1.426783, -1.11125, 0.9607843, 1, 0, 1,
-0.9817625, -0.5448468, -1.965564, 0.9568627, 1, 0, 1,
-0.977522, -1.897319, -3.567858, 0.9490196, 1, 0, 1,
-0.9747211, 1.22237, -0.603847, 0.945098, 1, 0, 1,
-0.9731201, 1.496399, -1.570995, 0.9372549, 1, 0, 1,
-0.9728606, -1.126842, -2.5204, 0.9333333, 1, 0, 1,
-0.972452, -0.01936934, -1.139044, 0.9254902, 1, 0, 1,
-0.9693358, 0.4096064, -1.308244, 0.9215686, 1, 0, 1,
-0.9639311, -1.206296, -1.389705, 0.9137255, 1, 0, 1,
-0.9625525, -2.04373, -3.897313, 0.9098039, 1, 0, 1,
-0.9613252, 1.079606, -0.910006, 0.9019608, 1, 0, 1,
-0.9595498, 0.0733426, -1.310302, 0.8941177, 1, 0, 1,
-0.9592882, -0.207789, -1.588164, 0.8901961, 1, 0, 1,
-0.9553863, -0.2842817, -0.801155, 0.8823529, 1, 0, 1,
-0.9473184, -0.04295582, -2.849477, 0.8784314, 1, 0, 1,
-0.9467106, -1.010339, -1.673587, 0.8705882, 1, 0, 1,
-0.9451981, -0.2020717, -3.091057, 0.8666667, 1, 0, 1,
-0.9397038, -0.08612681, -2.610873, 0.8588235, 1, 0, 1,
-0.9393486, 0.4513, -0.3103964, 0.854902, 1, 0, 1,
-0.9369145, -0.2171185, -1.903003, 0.8470588, 1, 0, 1,
-0.9354013, -0.5726602, -2.076742, 0.8431373, 1, 0, 1,
-0.9305885, 0.958351, -0.3230495, 0.8352941, 1, 0, 1,
-0.9290258, 0.08272998, -1.809072, 0.8313726, 1, 0, 1,
-0.9274834, -0.9231521, 0.2886776, 0.8235294, 1, 0, 1,
-0.9217906, -0.05104841, -2.093859, 0.8196079, 1, 0, 1,
-0.9216247, 0.05767347, -1.667111, 0.8117647, 1, 0, 1,
-0.9148909, -1.798892, -1.559911, 0.8078431, 1, 0, 1,
-0.9131842, 0.8673401, -0.9367384, 0.8, 1, 0, 1,
-0.9125355, 0.8518717, -2.048359, 0.7921569, 1, 0, 1,
-0.9120838, 0.5396473, -1.970479, 0.7882353, 1, 0, 1,
-0.9110504, -0.8932814, -3.211514, 0.7803922, 1, 0, 1,
-0.900843, 1.346701, -0.9341585, 0.7764706, 1, 0, 1,
-0.9008256, 1.755929, -2.304035, 0.7686275, 1, 0, 1,
-0.8961223, 0.532878, -2.332655, 0.7647059, 1, 0, 1,
-0.8940091, 0.8211746, -0.3089083, 0.7568628, 1, 0, 1,
-0.8887332, 0.06412137, -1.944374, 0.7529412, 1, 0, 1,
-0.888592, 0.8447292, -3.954273, 0.7450981, 1, 0, 1,
-0.8812566, -0.5922811, -2.395549, 0.7411765, 1, 0, 1,
-0.8680306, -1.45216, -2.196137, 0.7333333, 1, 0, 1,
-0.8669318, -0.8272989, -2.623938, 0.7294118, 1, 0, 1,
-0.8619354, -1.166637, -3.044712, 0.7215686, 1, 0, 1,
-0.8594645, -0.1983056, -1.804927, 0.7176471, 1, 0, 1,
-0.8566963, 0.3368084, -1.512417, 0.7098039, 1, 0, 1,
-0.8560783, -0.1701455, -0.6528154, 0.7058824, 1, 0, 1,
-0.8538265, 0.2535959, -1.257246, 0.6980392, 1, 0, 1,
-0.8537058, -0.3228046, -0.5434715, 0.6901961, 1, 0, 1,
-0.8487444, 1.943217, 1.411262, 0.6862745, 1, 0, 1,
-0.848033, 1.763221, -0.9050677, 0.6784314, 1, 0, 1,
-0.8411875, 0.3242599, -0.7996504, 0.6745098, 1, 0, 1,
-0.8306208, 1.624428, 0.7420759, 0.6666667, 1, 0, 1,
-0.8246971, 0.3694745, -0.8870431, 0.6627451, 1, 0, 1,
-0.819842, -0.5246488, -2.559274, 0.654902, 1, 0, 1,
-0.8132165, 1.061505, -0.3286141, 0.6509804, 1, 0, 1,
-0.8079385, -0.1028318, -2.709298, 0.6431373, 1, 0, 1,
-0.8030493, 0.605733, -1.937143, 0.6392157, 1, 0, 1,
-0.8018973, 1.501103, 1.569057, 0.6313726, 1, 0, 1,
-0.7958981, -0.2399924, -2.574337, 0.627451, 1, 0, 1,
-0.7951007, -0.7711185, -3.841888, 0.6196079, 1, 0, 1,
-0.7950965, 0.4048862, -0.1460989, 0.6156863, 1, 0, 1,
-0.7940971, 0.0642191, -2.110307, 0.6078432, 1, 0, 1,
-0.7891301, -1.328179, -2.061929, 0.6039216, 1, 0, 1,
-0.7846548, 0.4938408, 0.4437918, 0.5960785, 1, 0, 1,
-0.7830732, -1.295871, -4.099998, 0.5882353, 1, 0, 1,
-0.7807136, 0.6639577, -1.85369, 0.5843138, 1, 0, 1,
-0.7799316, 0.1357809, 0.2727374, 0.5764706, 1, 0, 1,
-0.7715272, 0.7902817, -1.670612, 0.572549, 1, 0, 1,
-0.7666398, 0.552004, -0.007198753, 0.5647059, 1, 0, 1,
-0.7653902, -0.4165474, -2.159768, 0.5607843, 1, 0, 1,
-0.7617855, -1.968095, -3.524451, 0.5529412, 1, 0, 1,
-0.7442315, 1.465553, -1.014928, 0.5490196, 1, 0, 1,
-0.7430996, -0.9750835, -2.908237, 0.5411765, 1, 0, 1,
-0.7430887, -0.3205758, -2.602018, 0.5372549, 1, 0, 1,
-0.7421799, -0.7238989, -0.4529226, 0.5294118, 1, 0, 1,
-0.740169, 0.1104037, -0.9337268, 0.5254902, 1, 0, 1,
-0.7401603, 0.1043683, 0.6944133, 0.5176471, 1, 0, 1,
-0.7326766, -0.4402331, -3.989982, 0.5137255, 1, 0, 1,
-0.7307863, 0.1878895, -1.179887, 0.5058824, 1, 0, 1,
-0.7306074, 0.3279189, -2.160561, 0.5019608, 1, 0, 1,
-0.7239321, 1.360656, 0.3196722, 0.4941176, 1, 0, 1,
-0.7191541, 0.385617, -1.586635, 0.4862745, 1, 0, 1,
-0.7160053, 0.8006074, -3.496034, 0.4823529, 1, 0, 1,
-0.7129259, -1.087409, -1.726025, 0.4745098, 1, 0, 1,
-0.7120508, 0.6518826, -1.216924, 0.4705882, 1, 0, 1,
-0.7096415, -0.2230916, -2.027198, 0.4627451, 1, 0, 1,
-0.7075313, -1.27813, -3.234066, 0.4588235, 1, 0, 1,
-0.7072626, 0.7330337, -0.2913753, 0.4509804, 1, 0, 1,
-0.6979837, 0.07253674, -1.734328, 0.4470588, 1, 0, 1,
-0.6907828, 2.288291, 0.8446358, 0.4392157, 1, 0, 1,
-0.6850564, -1.185982, -2.719533, 0.4352941, 1, 0, 1,
-0.6795635, 1.136706, -1.041482, 0.427451, 1, 0, 1,
-0.6785349, -0.2095663, -0.9246029, 0.4235294, 1, 0, 1,
-0.6772446, 0.7455473, -1.069275, 0.4156863, 1, 0, 1,
-0.6766635, 1.903364, 1.849704, 0.4117647, 1, 0, 1,
-0.6645358, -0.1244058, -2.283568, 0.4039216, 1, 0, 1,
-0.6643392, 1.117621, -1.222316, 0.3960784, 1, 0, 1,
-0.6629781, 1.461931, -0.5556699, 0.3921569, 1, 0, 1,
-0.6627362, -0.7709642, -2.355435, 0.3843137, 1, 0, 1,
-0.6588517, 1.832459, -0.06652854, 0.3803922, 1, 0, 1,
-0.6572556, -0.2058766, -1.638998, 0.372549, 1, 0, 1,
-0.6551427, 0.9432587, -1.913099, 0.3686275, 1, 0, 1,
-0.6548472, -1.419119, -3.200797, 0.3607843, 1, 0, 1,
-0.6543948, -0.2328273, -1.13265, 0.3568628, 1, 0, 1,
-0.6509886, -0.6339537, -1.224001, 0.3490196, 1, 0, 1,
-0.6404064, -0.8073626, -2.451314, 0.345098, 1, 0, 1,
-0.6387292, -2.240121, -2.437191, 0.3372549, 1, 0, 1,
-0.6372154, 0.9298007, -0.2002752, 0.3333333, 1, 0, 1,
-0.6346694, -0.4088505, -2.437991, 0.3254902, 1, 0, 1,
-0.6334733, 1.039206, 0.6406865, 0.3215686, 1, 0, 1,
-0.6334464, -0.238402, -0.5724329, 0.3137255, 1, 0, 1,
-0.6258422, -0.8115441, -3.538152, 0.3098039, 1, 0, 1,
-0.6169544, 0.2338543, -3.415248, 0.3019608, 1, 0, 1,
-0.6151885, -1.152283, -3.035448, 0.2941177, 1, 0, 1,
-0.6144544, 1.24045, 0.5042421, 0.2901961, 1, 0, 1,
-0.6098427, -0.3710594, 0.2552533, 0.282353, 1, 0, 1,
-0.6080877, -1.037471, -1.551318, 0.2784314, 1, 0, 1,
-0.6064358, -2.349195, -3.186875, 0.2705882, 1, 0, 1,
-0.6053873, -0.1668184, -0.953379, 0.2666667, 1, 0, 1,
-0.6045958, 0.4303025, -0.7177522, 0.2588235, 1, 0, 1,
-0.6017784, 0.1892149, -0.6551406, 0.254902, 1, 0, 1,
-0.5991026, 0.8670123, -1.170605, 0.2470588, 1, 0, 1,
-0.5976217, 1.168433, 0.4418247, 0.2431373, 1, 0, 1,
-0.5975772, 0.1642889, -3.83493, 0.2352941, 1, 0, 1,
-0.591809, 0.5013891, 0.30265, 0.2313726, 1, 0, 1,
-0.5874186, -1.70076, -2.923541, 0.2235294, 1, 0, 1,
-0.5872977, -0.2028197, -2.606598, 0.2196078, 1, 0, 1,
-0.5814631, 0.9036297, -1.021382, 0.2117647, 1, 0, 1,
-0.5772273, 0.7002118, -0.5204716, 0.2078431, 1, 0, 1,
-0.5728166, -1.07228, -2.870667, 0.2, 1, 0, 1,
-0.5689831, -1.46439, -1.646921, 0.1921569, 1, 0, 1,
-0.5629495, -1.133517, -2.917505, 0.1882353, 1, 0, 1,
-0.5609785, -0.6290756, -2.683246, 0.1803922, 1, 0, 1,
-0.560864, -0.5048519, -1.602371, 0.1764706, 1, 0, 1,
-0.559429, 1.484436, -0.1546401, 0.1686275, 1, 0, 1,
-0.5559712, 0.8589944, 0.02902003, 0.1647059, 1, 0, 1,
-0.5508667, -0.5693956, -1.596245, 0.1568628, 1, 0, 1,
-0.5503401, -0.5698165, -3.293006, 0.1529412, 1, 0, 1,
-0.5482275, -1.872791, -2.907559, 0.145098, 1, 0, 1,
-0.5453725, -0.2496379, -2.076165, 0.1411765, 1, 0, 1,
-0.5444931, 1.007531, -0.7361137, 0.1333333, 1, 0, 1,
-0.542642, 0.8460812, 0.7061497, 0.1294118, 1, 0, 1,
-0.5379445, 0.03687733, -3.941113, 0.1215686, 1, 0, 1,
-0.533816, -0.8576462, -2.973307, 0.1176471, 1, 0, 1,
-0.5325624, 0.4440125, -2.626344, 0.1098039, 1, 0, 1,
-0.5302094, -0.4272257, -1.57769, 0.1058824, 1, 0, 1,
-0.5273365, -0.2209014, -1.53002, 0.09803922, 1, 0, 1,
-0.5265987, -0.6043876, -0.0685781, 0.09019608, 1, 0, 1,
-0.5164238, -0.007076717, -2.69909, 0.08627451, 1, 0, 1,
-0.5155213, 1.822841, 0.2261837, 0.07843138, 1, 0, 1,
-0.5107974, 1.207407, -1.081275, 0.07450981, 1, 0, 1,
-0.508593, -2.266968, -3.647141, 0.06666667, 1, 0, 1,
-0.5085248, 0.02875432, 0.4916359, 0.0627451, 1, 0, 1,
-0.5032716, -2.359109, -3.600221, 0.05490196, 1, 0, 1,
-0.4937905, -0.3493137, -2.309034, 0.05098039, 1, 0, 1,
-0.4934036, 0.5318296, -1.382365, 0.04313726, 1, 0, 1,
-0.490611, 0.3396491, -0.9498621, 0.03921569, 1, 0, 1,
-0.4857051, -1.051977, -2.357286, 0.03137255, 1, 0, 1,
-0.4850639, -0.4084073, -3.152728, 0.02745098, 1, 0, 1,
-0.4778765, -0.4683027, -2.936941, 0.01960784, 1, 0, 1,
-0.477055, 0.7302547, 0.2474192, 0.01568628, 1, 0, 1,
-0.4658854, 0.07500122, -1.535805, 0.007843138, 1, 0, 1,
-0.4626049, -0.3606372, -1.006301, 0.003921569, 1, 0, 1,
-0.4579253, -1.193306, -3.757532, 0, 1, 0.003921569, 1,
-0.4544275, -0.2309245, -2.603305, 0, 1, 0.01176471, 1,
-0.4486465, 0.2118546, -0.4440555, 0, 1, 0.01568628, 1,
-0.4479635, 1.875529, -0.0104487, 0, 1, 0.02352941, 1,
-0.4443564, 1.081693, -0.5457764, 0, 1, 0.02745098, 1,
-0.4423348, 1.300193, 0.1238917, 0, 1, 0.03529412, 1,
-0.4420818, -0.53096, -1.813871, 0, 1, 0.03921569, 1,
-0.4414847, -0.5854735, -4.414936, 0, 1, 0.04705882, 1,
-0.4408554, -0.2203328, 0.03686969, 0, 1, 0.05098039, 1,
-0.4398681, -2.449536, -4.601988, 0, 1, 0.05882353, 1,
-0.4349436, -0.5126228, -2.509363, 0, 1, 0.0627451, 1,
-0.4346146, -0.7426304, -2.715115, 0, 1, 0.07058824, 1,
-0.4326473, 0.07689256, -1.288865, 0, 1, 0.07450981, 1,
-0.4184143, -0.2433582, -2.18824, 0, 1, 0.08235294, 1,
-0.399388, -1.467721, -3.204932, 0, 1, 0.08627451, 1,
-0.3986154, 0.4118496, 0.116135, 0, 1, 0.09411765, 1,
-0.3964183, -2.038984, -3.269838, 0, 1, 0.1019608, 1,
-0.3873549, 0.3578768, -1.579671, 0, 1, 0.1058824, 1,
-0.3870456, 0.1018436, -0.896452, 0, 1, 0.1137255, 1,
-0.3862408, -0.6263109, -2.759504, 0, 1, 0.1176471, 1,
-0.3760155, 0.2722196, -2.076116, 0, 1, 0.1254902, 1,
-0.3688727, -1.039326, -3.561227, 0, 1, 0.1294118, 1,
-0.365035, -0.2523271, -1.780449, 0, 1, 0.1372549, 1,
-0.3638691, 0.2949017, -1.148481, 0, 1, 0.1411765, 1,
-0.3613754, 0.8677374, 0.3478496, 0, 1, 0.1490196, 1,
-0.3604447, 1.535838, 0.3176319, 0, 1, 0.1529412, 1,
-0.3592345, 0.4031636, 0.3988317, 0, 1, 0.1607843, 1,
-0.3577504, 1.218387, 1.122763, 0, 1, 0.1647059, 1,
-0.3557282, -0.02493028, -0.9989968, 0, 1, 0.172549, 1,
-0.3536774, 0.5614517, -0.1483713, 0, 1, 0.1764706, 1,
-0.351605, -0.8769836, -4.174631, 0, 1, 0.1843137, 1,
-0.3481482, -0.03533133, -0.2543699, 0, 1, 0.1882353, 1,
-0.345387, -1.703491, -2.077384, 0, 1, 0.1960784, 1,
-0.3432809, -0.5722589, -3.168102, 0, 1, 0.2039216, 1,
-0.3413985, 1.795655, -0.7066209, 0, 1, 0.2078431, 1,
-0.3403824, 0.9993162, 0.7970699, 0, 1, 0.2156863, 1,
-0.3315091, -0.2258614, -0.7311899, 0, 1, 0.2196078, 1,
-0.3278764, -1.244117, -2.974825, 0, 1, 0.227451, 1,
-0.3276661, -2.047568, -1.711387, 0, 1, 0.2313726, 1,
-0.3259998, -2.092137, -2.865103, 0, 1, 0.2392157, 1,
-0.3251931, -0.0988342, 0.9918519, 0, 1, 0.2431373, 1,
-0.3245089, -0.7244148, -2.116993, 0, 1, 0.2509804, 1,
-0.321025, -2.052998, -1.287484, 0, 1, 0.254902, 1,
-0.315731, 0.6214115, 0.2056745, 0, 1, 0.2627451, 1,
-0.3118241, 1.157658, 0.407483, 0, 1, 0.2666667, 1,
-0.3082074, 0.2252054, -1.16485, 0, 1, 0.2745098, 1,
-0.3029794, 0.02334051, -0.22582, 0, 1, 0.2784314, 1,
-0.3020612, -0.1044113, -2.664315, 0, 1, 0.2862745, 1,
-0.2971254, -0.9964304, -0.8956385, 0, 1, 0.2901961, 1,
-0.2893556, -1.034073, -0.9095336, 0, 1, 0.2980392, 1,
-0.2828157, 0.1663736, -1.289663, 0, 1, 0.3058824, 1,
-0.2739406, 0.4375246, -0.4196503, 0, 1, 0.3098039, 1,
-0.2731642, 1.436747, -0.6441088, 0, 1, 0.3176471, 1,
-0.271763, -0.6788778, -0.6405914, 0, 1, 0.3215686, 1,
-0.2669097, -0.3249117, -3.260095, 0, 1, 0.3294118, 1,
-0.2621691, 1.008086, -1.159124, 0, 1, 0.3333333, 1,
-0.2609243, -0.6350073, -3.568349, 0, 1, 0.3411765, 1,
-0.2579165, 1.572572, -0.6843421, 0, 1, 0.345098, 1,
-0.251422, -0.9221244, -1.728067, 0, 1, 0.3529412, 1,
-0.2513122, 0.8150046, -1.033507, 0, 1, 0.3568628, 1,
-0.2503228, 0.08416208, -0.5310655, 0, 1, 0.3647059, 1,
-0.2497234, -0.8735436, -2.598205, 0, 1, 0.3686275, 1,
-0.2490672, -1.61732, -2.442373, 0, 1, 0.3764706, 1,
-0.2485342, -0.1277223, -1.789675, 0, 1, 0.3803922, 1,
-0.2469268, 1.30038, -0.7405613, 0, 1, 0.3882353, 1,
-0.2437758, 0.2565231, -0.5121736, 0, 1, 0.3921569, 1,
-0.2417249, -0.2276141, -2.744447, 0, 1, 0.4, 1,
-0.2414098, -0.9406263, -2.356648, 0, 1, 0.4078431, 1,
-0.2370337, -2.365315, -3.020521, 0, 1, 0.4117647, 1,
-0.2369, 1.351536, -0.5073649, 0, 1, 0.4196078, 1,
-0.2359277, -0.09741688, -2.423644, 0, 1, 0.4235294, 1,
-0.2291908, 2.044572, -0.537659, 0, 1, 0.4313726, 1,
-0.2290797, 0.3702094, -0.01078871, 0, 1, 0.4352941, 1,
-0.2254606, -0.3690963, -2.19987, 0, 1, 0.4431373, 1,
-0.22522, -0.8882029, -2.31961, 0, 1, 0.4470588, 1,
-0.2240605, -0.7371806, -4.276191, 0, 1, 0.454902, 1,
-0.2182692, 0.01136761, -0.2517934, 0, 1, 0.4588235, 1,
-0.2161516, 2.307546, -0.2806392, 0, 1, 0.4666667, 1,
-0.2129014, -0.2637876, -1.176688, 0, 1, 0.4705882, 1,
-0.2122255, 1.786914, 0.04437855, 0, 1, 0.4784314, 1,
-0.211833, -1.319764, -5.916008, 0, 1, 0.4823529, 1,
-0.2109575, -0.01301268, -2.19229, 0, 1, 0.4901961, 1,
-0.2096007, -0.7002138, -1.94564, 0, 1, 0.4941176, 1,
-0.2079205, 1.127289, 1.00128, 0, 1, 0.5019608, 1,
-0.2057846, 1.985286, 0.5538522, 0, 1, 0.509804, 1,
-0.2044988, -0.3987558, -4.692306, 0, 1, 0.5137255, 1,
-0.1974571, -0.315944, -2.535915, 0, 1, 0.5215687, 1,
-0.1953101, -0.07054348, -1.202418, 0, 1, 0.5254902, 1,
-0.1926959, -0.5717196, -2.63742, 0, 1, 0.5333334, 1,
-0.1909442, 1.607214, -0.4899276, 0, 1, 0.5372549, 1,
-0.1892739, -1.257591, -1.97529, 0, 1, 0.5450981, 1,
-0.1875207, -0.4319397, -2.382763, 0, 1, 0.5490196, 1,
-0.1863348, -1.047261, -2.070725, 0, 1, 0.5568628, 1,
-0.1848693, -1.004114, -3.501019, 0, 1, 0.5607843, 1,
-0.180845, 0.03940448, -1.442801, 0, 1, 0.5686275, 1,
-0.179104, -1.398464, -1.631043, 0, 1, 0.572549, 1,
-0.1672959, 1.205857, -1.675916, 0, 1, 0.5803922, 1,
-0.1667397, -1.321423, -4.810114, 0, 1, 0.5843138, 1,
-0.1664133, -1.348589, -2.164913, 0, 1, 0.5921569, 1,
-0.1647137, -1.599555, -2.135233, 0, 1, 0.5960785, 1,
-0.1644413, -1.678549, -1.547319, 0, 1, 0.6039216, 1,
-0.1622197, 1.363024, -0.7498327, 0, 1, 0.6117647, 1,
-0.1612922, -0.1021278, -1.745158, 0, 1, 0.6156863, 1,
-0.158626, -0.1456585, -0.5174793, 0, 1, 0.6235294, 1,
-0.157225, 0.7646213, -0.6178294, 0, 1, 0.627451, 1,
-0.1570518, -0.2185831, -2.384382, 0, 1, 0.6352941, 1,
-0.1540277, 1.81373, -1.030329, 0, 1, 0.6392157, 1,
-0.1521087, -0.7532383, -2.88414, 0, 1, 0.6470588, 1,
-0.1516348, 0.7027369, 0.4761997, 0, 1, 0.6509804, 1,
-0.1516156, -0.4070358, -3.786906, 0, 1, 0.6588235, 1,
-0.1449369, 0.5245084, 0.2444472, 0, 1, 0.6627451, 1,
-0.1436783, -1.77711, -4.160019, 0, 1, 0.6705883, 1,
-0.1376596, -1.658481, -4.768764, 0, 1, 0.6745098, 1,
-0.1351016, 0.4393768, 0.6653999, 0, 1, 0.682353, 1,
-0.1340765, 0.6194677, -1.799305, 0, 1, 0.6862745, 1,
-0.1304184, 0.7506301, -1.605716, 0, 1, 0.6941177, 1,
-0.1289046, -0.121968, -0.8426836, 0, 1, 0.7019608, 1,
-0.1285096, -0.4471324, -4.282636, 0, 1, 0.7058824, 1,
-0.1269432, -1.27117, -1.818033, 0, 1, 0.7137255, 1,
-0.1234523, 0.4406053, 0.5720028, 0, 1, 0.7176471, 1,
-0.1208135, -0.09019002, -3.463295, 0, 1, 0.7254902, 1,
-0.1205705, -1.161142, -3.303197, 0, 1, 0.7294118, 1,
-0.1181612, -0.5100068, -3.673365, 0, 1, 0.7372549, 1,
-0.1083538, -1.772931, -3.58374, 0, 1, 0.7411765, 1,
-0.105935, -0.2102588, -3.070605, 0, 1, 0.7490196, 1,
-0.1055192, -0.1059662, -4.25165, 0, 1, 0.7529412, 1,
-0.1050245, 0.02138266, -1.116158, 0, 1, 0.7607843, 1,
-0.104926, -0.5432439, -3.465231, 0, 1, 0.7647059, 1,
-0.1046947, -0.7004604, -3.251517, 0, 1, 0.772549, 1,
-0.1040007, 1.958775, 1.269509, 0, 1, 0.7764706, 1,
-0.1035407, -0.7555996, -2.990977, 0, 1, 0.7843137, 1,
-0.1031577, -0.06874765, -2.995794, 0, 1, 0.7882353, 1,
-0.1027886, -0.0600442, -3.128996, 0, 1, 0.7960784, 1,
-0.1018164, -0.2565422, -1.274385, 0, 1, 0.8039216, 1,
-0.09420554, 0.8804052, -0.8290146, 0, 1, 0.8078431, 1,
-0.08922896, -0.9619814, -3.641895, 0, 1, 0.8156863, 1,
-0.08354326, 0.2345802, -0.2191733, 0, 1, 0.8196079, 1,
-0.08274643, 0.9736847, -0.05124271, 0, 1, 0.827451, 1,
-0.0795161, -0.6466126, -4.380672, 0, 1, 0.8313726, 1,
-0.07848103, 0.6933938, 0.6885388, 0, 1, 0.8392157, 1,
-0.07653978, 0.0301496, -1.123536, 0, 1, 0.8431373, 1,
-0.07615438, -0.521321, -3.05635, 0, 1, 0.8509804, 1,
-0.07542953, -1.214845, -4.041807, 0, 1, 0.854902, 1,
-0.07442206, -0.7407811, -2.181265, 0, 1, 0.8627451, 1,
-0.07169061, -0.5318904, -2.288082, 0, 1, 0.8666667, 1,
-0.06798562, 0.3583811, 1.692517, 0, 1, 0.8745098, 1,
-0.06624268, 0.6572024, -0.7855359, 0, 1, 0.8784314, 1,
-0.06419531, -0.6428745, -3.535268, 0, 1, 0.8862745, 1,
-0.06328432, 0.9392042, 0.9897288, 0, 1, 0.8901961, 1,
-0.05752962, -0.5984471, -2.751467, 0, 1, 0.8980392, 1,
-0.0574379, -0.3421387, -3.308486, 0, 1, 0.9058824, 1,
-0.05717928, -0.2604235, -3.567541, 0, 1, 0.9098039, 1,
-0.05693291, 1.040465, 1.004807, 0, 1, 0.9176471, 1,
-0.05602865, 0.3119135, -2.238554, 0, 1, 0.9215686, 1,
-0.05492306, 0.9110174, -0.6783977, 0, 1, 0.9294118, 1,
-0.05247783, -0.7188017, -2.442179, 0, 1, 0.9333333, 1,
-0.0523879, 0.154897, -0.70789, 0, 1, 0.9411765, 1,
-0.05006712, 0.9150413, 1.151787, 0, 1, 0.945098, 1,
-0.04973896, -1.502707, -2.905722, 0, 1, 0.9529412, 1,
-0.04684561, -2.000777, -2.16355, 0, 1, 0.9568627, 1,
-0.04438671, -0.343263, -3.039052, 0, 1, 0.9647059, 1,
-0.04066669, -0.4966843, -3.784257, 0, 1, 0.9686275, 1,
-0.03921125, -0.04203624, -2.560515, 0, 1, 0.9764706, 1,
-0.03897312, 0.1109182, -1.11713, 0, 1, 0.9803922, 1,
-0.03893435, 0.3725509, 0.2131667, 0, 1, 0.9882353, 1,
-0.0373784, -2.218551, -3.992864, 0, 1, 0.9921569, 1,
-0.03580781, 0.8803832, -0.5357595, 0, 1, 1, 1,
-0.02745438, -0.4716902, -2.879995, 0, 0.9921569, 1, 1,
-0.02419866, 0.1175921, 0.08617485, 0, 0.9882353, 1, 1,
-0.02028429, -0.03117538, -2.349792, 0, 0.9803922, 1, 1,
-0.01600295, 0.5966144, -1.65415, 0, 0.9764706, 1, 1,
-0.01346233, -1.664915, -2.509664, 0, 0.9686275, 1, 1,
-0.01003046, 1.165988, 1.445914, 0, 0.9647059, 1, 1,
-0.00895878, -0.3138493, -1.892062, 0, 0.9568627, 1, 1,
-0.006752017, 0.2106479, 1.030413, 0, 0.9529412, 1, 1,
-0.005587302, 1.533968, -0.7761379, 0, 0.945098, 1, 1,
-0.00354962, -0.4716457, -2.907068, 0, 0.9411765, 1, 1,
-0.003080521, -0.4531727, -2.166124, 0, 0.9333333, 1, 1,
-0.0028551, -1.825858, -3.603239, 0, 0.9294118, 1, 1,
0.003667363, 0.1555313, 1.132305, 0, 0.9215686, 1, 1,
0.007396572, -2.038653, 3.319574, 0, 0.9176471, 1, 1,
0.007889546, -0.7284435, 4.146765, 0, 0.9098039, 1, 1,
0.008853936, -0.7345139, 5.266615, 0, 0.9058824, 1, 1,
0.009799984, -1.549032, 3.556489, 0, 0.8980392, 1, 1,
0.009887968, 1.722382, 0.07632987, 0, 0.8901961, 1, 1,
0.01434106, 0.7695055, 0.1891045, 0, 0.8862745, 1, 1,
0.01683647, -0.5833539, 5.435643, 0, 0.8784314, 1, 1,
0.01763892, -0.002861555, 1.7997, 0, 0.8745098, 1, 1,
0.01871057, 0.5863405, 0.2567068, 0, 0.8666667, 1, 1,
0.01904443, 0.5388246, 0.5511866, 0, 0.8627451, 1, 1,
0.01927361, -0.9825274, 3.746242, 0, 0.854902, 1, 1,
0.02129731, 0.293256, -0.6751935, 0, 0.8509804, 1, 1,
0.02352151, -0.9745278, 2.372654, 0, 0.8431373, 1, 1,
0.02700423, -0.01149898, 2.527952, 0, 0.8392157, 1, 1,
0.03402378, 0.9218801, -0.889298, 0, 0.8313726, 1, 1,
0.03519472, -0.8707317, 1.89894, 0, 0.827451, 1, 1,
0.03677598, -1.496032, 3.006698, 0, 0.8196079, 1, 1,
0.04046956, 1.380637, -0.1298168, 0, 0.8156863, 1, 1,
0.04774655, -0.6019195, 3.744869, 0, 0.8078431, 1, 1,
0.0481206, -1.156692, 1.498968, 0, 0.8039216, 1, 1,
0.04823338, -0.2481025, 1.079314, 0, 0.7960784, 1, 1,
0.0498267, -0.8467671, 2.524218, 0, 0.7882353, 1, 1,
0.05244193, -0.09377348, 2.491347, 0, 0.7843137, 1, 1,
0.05412149, 0.1840113, 0.9128129, 0, 0.7764706, 1, 1,
0.05506586, 0.8053098, 0.1638649, 0, 0.772549, 1, 1,
0.05846057, 1.326646, 0.9568488, 0, 0.7647059, 1, 1,
0.05930015, 0.45485, -1.117701, 0, 0.7607843, 1, 1,
0.05954634, -0.3922933, 3.280148, 0, 0.7529412, 1, 1,
0.06020072, -1.295282, 3.275016, 0, 0.7490196, 1, 1,
0.06091907, 1.847022, 1.664399, 0, 0.7411765, 1, 1,
0.06203546, -0.2351872, 4.226233, 0, 0.7372549, 1, 1,
0.0622851, 0.5931912, 1.205906, 0, 0.7294118, 1, 1,
0.06292358, -0.1269825, 2.022416, 0, 0.7254902, 1, 1,
0.06403451, 1.19633, -0.09720009, 0, 0.7176471, 1, 1,
0.06877873, 0.440764, -1.088366, 0, 0.7137255, 1, 1,
0.0688938, 0.5961605, -0.3018543, 0, 0.7058824, 1, 1,
0.07070225, 0.4172377, -1.078757, 0, 0.6980392, 1, 1,
0.07210341, -0.9575573, 3.315687, 0, 0.6941177, 1, 1,
0.07216867, 0.7819701, -0.7977229, 0, 0.6862745, 1, 1,
0.07506502, -0.3746558, 3.758768, 0, 0.682353, 1, 1,
0.07769004, 0.8612693, 1.059528, 0, 0.6745098, 1, 1,
0.0777385, -1.676916, 2.542197, 0, 0.6705883, 1, 1,
0.08916728, -1.088891, 2.378608, 0, 0.6627451, 1, 1,
0.09410942, -0.8587732, 2.565208, 0, 0.6588235, 1, 1,
0.09836975, -0.2342949, 3.124564, 0, 0.6509804, 1, 1,
0.098737, 0.2824524, -0.3650526, 0, 0.6470588, 1, 1,
0.09977136, 0.7164418, 0.9079884, 0, 0.6392157, 1, 1,
0.1107491, -0.4480303, 2.005566, 0, 0.6352941, 1, 1,
0.1115682, -0.4154842, 1.237551, 0, 0.627451, 1, 1,
0.1142327, -0.3754583, 3.557, 0, 0.6235294, 1, 1,
0.1201479, 1.03838, 1.339896, 0, 0.6156863, 1, 1,
0.1258087, -0.2499845, 3.429094, 0, 0.6117647, 1, 1,
0.126209, -0.7350066, 5.243021, 0, 0.6039216, 1, 1,
0.1274005, -1.305407, 2.652894, 0, 0.5960785, 1, 1,
0.1301749, 1.717888, 0.6610177, 0, 0.5921569, 1, 1,
0.1314127, -0.465656, 3.703648, 0, 0.5843138, 1, 1,
0.1318486, 1.646314, -0.7969466, 0, 0.5803922, 1, 1,
0.1356984, 0.1961357, 0.05557917, 0, 0.572549, 1, 1,
0.1359197, 1.120919, -1.967851, 0, 0.5686275, 1, 1,
0.1367582, 0.8607141, 0.5341674, 0, 0.5607843, 1, 1,
0.1390926, 1.290543, 1.273967, 0, 0.5568628, 1, 1,
0.1405825, 0.03862478, 1.332847, 0, 0.5490196, 1, 1,
0.1440428, -1.454217, 2.23701, 0, 0.5450981, 1, 1,
0.1495987, 0.5872051, 0.4444967, 0, 0.5372549, 1, 1,
0.1562873, -1.294448, 1.512443, 0, 0.5333334, 1, 1,
0.1662811, 0.1628085, 1.282331, 0, 0.5254902, 1, 1,
0.1669646, -0.7263223, 2.188157, 0, 0.5215687, 1, 1,
0.1670384, -0.8170211, 3.238473, 0, 0.5137255, 1, 1,
0.1673496, -0.6340392, 3.136952, 0, 0.509804, 1, 1,
0.170076, 1.694348, -1.491223, 0, 0.5019608, 1, 1,
0.174216, -0.01189159, 3.115726, 0, 0.4941176, 1, 1,
0.1770482, 2.732276, 1.38221, 0, 0.4901961, 1, 1,
0.1838005, -0.7166553, 3.012882, 0, 0.4823529, 1, 1,
0.1842045, -0.8258905, 3.348646, 0, 0.4784314, 1, 1,
0.1910895, -3.027574, 5.148056, 0, 0.4705882, 1, 1,
0.1913742, -1.092747, 2.531272, 0, 0.4666667, 1, 1,
0.1932628, -0.7533517, 2.779287, 0, 0.4588235, 1, 1,
0.1958352, -0.533846, 3.262931, 0, 0.454902, 1, 1,
0.1982196, -1.589415, 2.467478, 0, 0.4470588, 1, 1,
0.2017669, 0.2772402, 0.8915724, 0, 0.4431373, 1, 1,
0.2140013, 0.4250141, -1.173868, 0, 0.4352941, 1, 1,
0.2163731, -0.9555358, 3.43059, 0, 0.4313726, 1, 1,
0.2210581, -1.591895, 2.383405, 0, 0.4235294, 1, 1,
0.222139, -0.4151529, 2.274353, 0, 0.4196078, 1, 1,
0.2287255, -0.06614088, 0.4328347, 0, 0.4117647, 1, 1,
0.2308889, 1.016108, -0.7493969, 0, 0.4078431, 1, 1,
0.2352136, 0.3359448, -0.990752, 0, 0.4, 1, 1,
0.2391535, -1.064844, 1.534487, 0, 0.3921569, 1, 1,
0.2406849, -0.1525052, 0.5316246, 0, 0.3882353, 1, 1,
0.2447229, -0.8026212, 2.703267, 0, 0.3803922, 1, 1,
0.2493886, -1.873389, 2.289014, 0, 0.3764706, 1, 1,
0.2496025, 1.598763, 1.941273, 0, 0.3686275, 1, 1,
0.2497689, -0.9332932, 3.214972, 0, 0.3647059, 1, 1,
0.2501259, -1.849036, 4.750321, 0, 0.3568628, 1, 1,
0.2508121, 1.14776, 0.08871793, 0, 0.3529412, 1, 1,
0.2543768, -0.5935937, 1.98616, 0, 0.345098, 1, 1,
0.258486, -0.6374842, 1.58496, 0, 0.3411765, 1, 1,
0.2629701, 0.1574028, -0.7063178, 0, 0.3333333, 1, 1,
0.2639857, -0.97844, 3.972988, 0, 0.3294118, 1, 1,
0.2641466, -1.135137, 5.419512, 0, 0.3215686, 1, 1,
0.2646956, 1.227754, -0.2369201, 0, 0.3176471, 1, 1,
0.2650033, 1.578825, -0.5010632, 0, 0.3098039, 1, 1,
0.2651998, -0.6511024, 1.191392, 0, 0.3058824, 1, 1,
0.2661953, -0.5425677, 3.366389, 0, 0.2980392, 1, 1,
0.2669329, 0.07758598, 0.7782373, 0, 0.2901961, 1, 1,
0.2712319, -0.7443292, 4.066455, 0, 0.2862745, 1, 1,
0.271301, -0.6362389, 3.816081, 0, 0.2784314, 1, 1,
0.2724305, 2.505971, -0.4553389, 0, 0.2745098, 1, 1,
0.2753956, 0.564606, 2.358407, 0, 0.2666667, 1, 1,
0.2760938, -1.146205, 2.297183, 0, 0.2627451, 1, 1,
0.27831, -2.925172, 2.790692, 0, 0.254902, 1, 1,
0.2800379, 0.4363693, -1.465122, 0, 0.2509804, 1, 1,
0.282804, -0.01884861, 0.4473493, 0, 0.2431373, 1, 1,
0.2833694, 1.173054, 1.421471, 0, 0.2392157, 1, 1,
0.2861029, 0.5080654, -1.139855, 0, 0.2313726, 1, 1,
0.2862068, 0.319295, 0.5353501, 0, 0.227451, 1, 1,
0.290409, -0.6678444, 3.75629, 0, 0.2196078, 1, 1,
0.2957498, 0.419476, 0.7071149, 0, 0.2156863, 1, 1,
0.2995722, 1.366018, 1.70161, 0, 0.2078431, 1, 1,
0.3058214, -0.9799572, 1.835253, 0, 0.2039216, 1, 1,
0.3069631, -0.8823745, 2.639006, 0, 0.1960784, 1, 1,
0.3079209, -0.1787352, 2.076327, 0, 0.1882353, 1, 1,
0.3098203, 0.8499354, -0.5191391, 0, 0.1843137, 1, 1,
0.3135723, 0.9889277, 1.560365, 0, 0.1764706, 1, 1,
0.3168531, 1.394393, 1.184587, 0, 0.172549, 1, 1,
0.3169539, -0.2416273, 1.625754, 0, 0.1647059, 1, 1,
0.3179002, 0.3731543, 1.243147, 0, 0.1607843, 1, 1,
0.3189576, -1.230888, 2.408316, 0, 0.1529412, 1, 1,
0.3198109, 1.551836, 0.3166953, 0, 0.1490196, 1, 1,
0.3211451, -0.9030564, 4.652419, 0, 0.1411765, 1, 1,
0.3235538, -0.879823, 3.746418, 0, 0.1372549, 1, 1,
0.3236279, -0.9814279, 3.343888, 0, 0.1294118, 1, 1,
0.325274, 0.09223442, 3.816803, 0, 0.1254902, 1, 1,
0.3312873, -0.1997704, 1.093807, 0, 0.1176471, 1, 1,
0.331378, -0.7338434, 4.309884, 0, 0.1137255, 1, 1,
0.3331459, 1.265816, -0.09817728, 0, 0.1058824, 1, 1,
0.3336506, 0.4419322, 0.6305612, 0, 0.09803922, 1, 1,
0.3343341, 1.092633, -0.6446433, 0, 0.09411765, 1, 1,
0.334476, -1.134117, 2.72153, 0, 0.08627451, 1, 1,
0.3351907, 0.2513777, 1.807012, 0, 0.08235294, 1, 1,
0.3359576, -1.029118, 2.277404, 0, 0.07450981, 1, 1,
0.3380697, 1.360871, 1.758671, 0, 0.07058824, 1, 1,
0.3444798, -0.5194851, 1.668362, 0, 0.0627451, 1, 1,
0.3489014, 1.251583, 0.9584689, 0, 0.05882353, 1, 1,
0.3545216, 0.6817307, 2.466643, 0, 0.05098039, 1, 1,
0.3559182, -1.421579, 4.374258, 0, 0.04705882, 1, 1,
0.3582987, -1.124076, 4.923827, 0, 0.03921569, 1, 1,
0.3617747, -0.4362275, 3.712004, 0, 0.03529412, 1, 1,
0.3637258, -1.913924, 2.888311, 0, 0.02745098, 1, 1,
0.3697838, 0.3672903, 1.968714, 0, 0.02352941, 1, 1,
0.372837, -1.222605, 4.095748, 0, 0.01568628, 1, 1,
0.3745191, 0.2397199, 0.2002461, 0, 0.01176471, 1, 1,
0.3749084, 0.1301723, 0.9556079, 0, 0.003921569, 1, 1,
0.3772609, -1.182024, 1.390503, 0.003921569, 0, 1, 1,
0.3819506, 1.104638, 0.4998535, 0.007843138, 0, 1, 1,
0.3871829, 0.2156008, 3.247095, 0.01568628, 0, 1, 1,
0.390888, -0.6164773, 3.32082, 0.01960784, 0, 1, 1,
0.3910132, 0.8183558, 1.830261, 0.02745098, 0, 1, 1,
0.3943595, 0.9156998, 0.5126924, 0.03137255, 0, 1, 1,
0.3981384, 1.782125, 0.5052961, 0.03921569, 0, 1, 1,
0.4016898, 1.471804, 0.3814327, 0.04313726, 0, 1, 1,
0.4023549, -0.6836934, 3.274433, 0.05098039, 0, 1, 1,
0.4082045, -0.2253512, 1.827215, 0.05490196, 0, 1, 1,
0.4102226, 0.884734, 0.3505784, 0.0627451, 0, 1, 1,
0.410909, -1.805982, 4.199534, 0.06666667, 0, 1, 1,
0.4172175, 0.8617147, -1.207054, 0.07450981, 0, 1, 1,
0.4181136, -0.1326557, 3.66369, 0.07843138, 0, 1, 1,
0.4216862, 0.3273575, 1.12103, 0.08627451, 0, 1, 1,
0.428855, -0.2754913, 1.956589, 0.09019608, 0, 1, 1,
0.4363146, -0.8344629, 3.803109, 0.09803922, 0, 1, 1,
0.4433826, 0.006488807, 1.11141, 0.1058824, 0, 1, 1,
0.4509777, -0.789399, 3.518182, 0.1098039, 0, 1, 1,
0.4528714, -2.177014, 2.44633, 0.1176471, 0, 1, 1,
0.4529094, 1.243648, 1.003833, 0.1215686, 0, 1, 1,
0.4547672, -0.09080229, -0.2069843, 0.1294118, 0, 1, 1,
0.4566225, -1.038203, 2.418805, 0.1333333, 0, 1, 1,
0.4636869, 1.048949, 0.02433444, 0.1411765, 0, 1, 1,
0.4672867, 1.059133, 0.8296611, 0.145098, 0, 1, 1,
0.4724681, -0.3355673, 1.149062, 0.1529412, 0, 1, 1,
0.4736231, 0.2826325, 2.625139, 0.1568628, 0, 1, 1,
0.4775821, -0.2188441, 2.686137, 0.1647059, 0, 1, 1,
0.478838, 0.2852004, 0.4036324, 0.1686275, 0, 1, 1,
0.4825373, 0.2627715, 2.435559, 0.1764706, 0, 1, 1,
0.4835525, 0.4669518, 0.4420217, 0.1803922, 0, 1, 1,
0.4865531, 1.965864, -0.9759855, 0.1882353, 0, 1, 1,
0.49013, 1.364817, 0.369955, 0.1921569, 0, 1, 1,
0.4933099, -0.1800712, 2.616934, 0.2, 0, 1, 1,
0.4935914, 1.061636, 0.3546216, 0.2078431, 0, 1, 1,
0.4951069, -0.4906576, 2.053949, 0.2117647, 0, 1, 1,
0.4951663, -0.7117232, 3.059901, 0.2196078, 0, 1, 1,
0.4963694, 0.6750587, -0.424251, 0.2235294, 0, 1, 1,
0.4988135, 0.2617227, 2.22425, 0.2313726, 0, 1, 1,
0.5029489, -1.709437, 2.764296, 0.2352941, 0, 1, 1,
0.505308, 0.3138599, 0.3551602, 0.2431373, 0, 1, 1,
0.5101959, -0.4703146, 3.13185, 0.2470588, 0, 1, 1,
0.5132976, 0.5218682, 2.04846, 0.254902, 0, 1, 1,
0.5180118, 0.5615433, 1.102766, 0.2588235, 0, 1, 1,
0.5195038, -0.7909511, 1.976913, 0.2666667, 0, 1, 1,
0.5249294, -0.4563323, 1.990835, 0.2705882, 0, 1, 1,
0.5275939, -0.2521394, 1.284213, 0.2784314, 0, 1, 1,
0.5276933, 0.2228641, 1.312129, 0.282353, 0, 1, 1,
0.5300697, 0.7333214, 0.7508305, 0.2901961, 0, 1, 1,
0.5316882, -0.5211551, 4.086791, 0.2941177, 0, 1, 1,
0.5337984, -0.5611111, 0.9484602, 0.3019608, 0, 1, 1,
0.5350149, -1.795928, 3.886878, 0.3098039, 0, 1, 1,
0.5410612, 0.04139145, 1.89808, 0.3137255, 0, 1, 1,
0.5559981, 1.128457, 1.649328, 0.3215686, 0, 1, 1,
0.5622579, 0.138424, -0.6807256, 0.3254902, 0, 1, 1,
0.5641584, 0.2696527, 0.007643434, 0.3333333, 0, 1, 1,
0.5674303, -0.7386894, 1.974599, 0.3372549, 0, 1, 1,
0.5679199, 1.121866, -1.527173, 0.345098, 0, 1, 1,
0.5770734, 1.007245, 0.2534576, 0.3490196, 0, 1, 1,
0.5785231, -0.8270873, 2.918455, 0.3568628, 0, 1, 1,
0.581341, -0.05322668, 1.300923, 0.3607843, 0, 1, 1,
0.5827494, -0.6128763, 2.314562, 0.3686275, 0, 1, 1,
0.5835041, -0.8044384, 2.381465, 0.372549, 0, 1, 1,
0.5840616, -1.422, 2.833791, 0.3803922, 0, 1, 1,
0.5849913, -1.537589, 1.333813, 0.3843137, 0, 1, 1,
0.5883885, -2.227142, 1.632794, 0.3921569, 0, 1, 1,
0.589257, -0.8261801, -0.2003661, 0.3960784, 0, 1, 1,
0.5966513, -0.7469467, 2.571555, 0.4039216, 0, 1, 1,
0.5967168, 0.5506801, 1.859436, 0.4117647, 0, 1, 1,
0.6023208, -1.175968, 2.372468, 0.4156863, 0, 1, 1,
0.6033781, -0.4507885, 0.4847218, 0.4235294, 0, 1, 1,
0.6091635, -0.4948544, 2.425512, 0.427451, 0, 1, 1,
0.6106985, -0.7803377, -0.05690416, 0.4352941, 0, 1, 1,
0.6112966, 0.3290398, 0.5632613, 0.4392157, 0, 1, 1,
0.6122961, 0.2822477, 1.065774, 0.4470588, 0, 1, 1,
0.6202154, -0.8144882, 2.86985, 0.4509804, 0, 1, 1,
0.624117, 1.671728, 0.1727768, 0.4588235, 0, 1, 1,
0.6252064, -0.02595844, 1.270455, 0.4627451, 0, 1, 1,
0.6273426, 0.006493992, 0.8334203, 0.4705882, 0, 1, 1,
0.6324089, 0.7892672, 0.7566153, 0.4745098, 0, 1, 1,
0.6324615, 1.942492, -1.513093, 0.4823529, 0, 1, 1,
0.6341473, 0.8314062, -0.2189482, 0.4862745, 0, 1, 1,
0.6371278, 1.40799, -1.218167, 0.4941176, 0, 1, 1,
0.6409197, -0.4387244, 1.414305, 0.5019608, 0, 1, 1,
0.6478254, -1.208296, 3.100472, 0.5058824, 0, 1, 1,
0.6512146, 0.1505679, 0.9435356, 0.5137255, 0, 1, 1,
0.6541215, -1.510291, 3.968725, 0.5176471, 0, 1, 1,
0.6549024, 1.04064, 1.024515, 0.5254902, 0, 1, 1,
0.6561998, 0.05385771, 3.027599, 0.5294118, 0, 1, 1,
0.6572118, 1.010736, -0.5522828, 0.5372549, 0, 1, 1,
0.6584843, -1.72805, 5.034116, 0.5411765, 0, 1, 1,
0.6591482, 1.497671, 1.35306, 0.5490196, 0, 1, 1,
0.6622931, 0.9590048, 0.7900863, 0.5529412, 0, 1, 1,
0.6629739, -0.3625029, 3.153946, 0.5607843, 0, 1, 1,
0.6646891, 0.7396016, 1.218362, 0.5647059, 0, 1, 1,
0.6683214, -1.1089, 2.986922, 0.572549, 0, 1, 1,
0.6700664, 2.771313, 1.97125, 0.5764706, 0, 1, 1,
0.6729956, -0.9463135, 1.598097, 0.5843138, 0, 1, 1,
0.6758625, -0.1875812, 2.553254, 0.5882353, 0, 1, 1,
0.6793345, 0.215344, 1.701293, 0.5960785, 0, 1, 1,
0.6803005, 0.8607137, 1.894915, 0.6039216, 0, 1, 1,
0.6821263, 0.4636605, 2.42165, 0.6078432, 0, 1, 1,
0.6827492, -0.7343147, 5.219549, 0.6156863, 0, 1, 1,
0.6900802, -1.364927, 2.838943, 0.6196079, 0, 1, 1,
0.6906089, -0.3347433, 1.692343, 0.627451, 0, 1, 1,
0.6966131, -2.359661, 0.8434139, 0.6313726, 0, 1, 1,
0.7003877, 1.414297, -0.1878479, 0.6392157, 0, 1, 1,
0.7034945, 0.001326288, 3.270134, 0.6431373, 0, 1, 1,
0.7065276, -1.111071, 1.842076, 0.6509804, 0, 1, 1,
0.7078939, -0.738565, 2.70247, 0.654902, 0, 1, 1,
0.7135057, -0.2800593, -0.0990317, 0.6627451, 0, 1, 1,
0.7139359, -0.3185444, 0.2258357, 0.6666667, 0, 1, 1,
0.7189519, 0.3122373, 2.140294, 0.6745098, 0, 1, 1,
0.7274995, 0.8136471, 1.718912, 0.6784314, 0, 1, 1,
0.7281097, 0.7364966, -1.128618, 0.6862745, 0, 1, 1,
0.7353711, 1.456346, 1.597471, 0.6901961, 0, 1, 1,
0.7356664, -1.284112, 2.094039, 0.6980392, 0, 1, 1,
0.7520342, 0.1909857, 0.5752346, 0.7058824, 0, 1, 1,
0.7541146, -0.1185694, 0.2537862, 0.7098039, 0, 1, 1,
0.7601781, 1.443726, -0.5801856, 0.7176471, 0, 1, 1,
0.7603956, -0.7852718, 1.383513, 0.7215686, 0, 1, 1,
0.7629853, 1.800126, -0.4392242, 0.7294118, 0, 1, 1,
0.7673486, -0.07760306, 1.645626, 0.7333333, 0, 1, 1,
0.7731393, -0.0256464, 0.994129, 0.7411765, 0, 1, 1,
0.7796941, -0.4231383, 2.214965, 0.7450981, 0, 1, 1,
0.7801953, 0.6089357, 2.091674, 0.7529412, 0, 1, 1,
0.7802768, -0.738588, 2.893576, 0.7568628, 0, 1, 1,
0.7854709, -1.64127, 3.47897, 0.7647059, 0, 1, 1,
0.7875009, 1.147165, 1.937779, 0.7686275, 0, 1, 1,
0.791575, -0.6151462, 1.216324, 0.7764706, 0, 1, 1,
0.7919127, 0.2642407, 0.220178, 0.7803922, 0, 1, 1,
0.7922529, -1.063606, 3.547328, 0.7882353, 0, 1, 1,
0.7962903, -0.3986367, 1.497506, 0.7921569, 0, 1, 1,
0.8071754, -0.814997, 1.504391, 0.8, 0, 1, 1,
0.8079112, -1.003507, 1.137551, 0.8078431, 0, 1, 1,
0.8182287, 0.5071872, 2.550713, 0.8117647, 0, 1, 1,
0.821403, 1.224344, -0.154239, 0.8196079, 0, 1, 1,
0.8215886, 0.3157243, 0.7157321, 0.8235294, 0, 1, 1,
0.8223413, 1.405852, 1.280019, 0.8313726, 0, 1, 1,
0.8244881, -0.8425463, 2.966216, 0.8352941, 0, 1, 1,
0.8253979, 0.4271624, 2.630672, 0.8431373, 0, 1, 1,
0.830199, -1.35236, 4.375623, 0.8470588, 0, 1, 1,
0.8359605, 1.249341, 2.156857, 0.854902, 0, 1, 1,
0.8407204, -0.6106378, 1.564923, 0.8588235, 0, 1, 1,
0.8560312, 0.1223395, 0.05353794, 0.8666667, 0, 1, 1,
0.8638662, -0.8159024, 2.293757, 0.8705882, 0, 1, 1,
0.8642508, 0.732203, 0.1755536, 0.8784314, 0, 1, 1,
0.8669404, -1.190283, 1.080651, 0.8823529, 0, 1, 1,
0.8705768, -0.7168934, 2.737819, 0.8901961, 0, 1, 1,
0.871976, -0.7487779, 1.485592, 0.8941177, 0, 1, 1,
0.8729544, 0.2688091, 1.789534, 0.9019608, 0, 1, 1,
0.8746, -0.2248109, 1.907504, 0.9098039, 0, 1, 1,
0.8758982, 2.598147, 1.07916, 0.9137255, 0, 1, 1,
0.8795682, -0.042239, 2.689485, 0.9215686, 0, 1, 1,
0.893434, -0.4737465, 1.941952, 0.9254902, 0, 1, 1,
0.8954906, -0.3126215, 1.417109, 0.9333333, 0, 1, 1,
0.8972828, -0.200597, 1.294939, 0.9372549, 0, 1, 1,
0.8973085, -0.8828948, 1.133407, 0.945098, 0, 1, 1,
0.9024397, 0.3828088, 2.361311, 0.9490196, 0, 1, 1,
0.9042709, 0.06975345, 0.7198433, 0.9568627, 0, 1, 1,
0.908069, -1.3575, 3.411472, 0.9607843, 0, 1, 1,
0.9280026, -1.797739, 3.626495, 0.9686275, 0, 1, 1,
0.9351879, 0.5381088, 0.7398453, 0.972549, 0, 1, 1,
0.9374454, -0.8872892, 2.383816, 0.9803922, 0, 1, 1,
0.9397628, -0.6967153, 2.786474, 0.9843137, 0, 1, 1,
0.9398004, -0.3031753, 3.876016, 0.9921569, 0, 1, 1,
0.9437648, 0.5159757, -0.564398, 0.9960784, 0, 1, 1,
0.9458513, 0.3541799, 2.667636, 1, 0, 0.9960784, 1,
0.9507405, -0.7302409, 2.091106, 1, 0, 0.9882353, 1,
0.9702854, -1.702937, 2.844723, 1, 0, 0.9843137, 1,
0.9734929, 0.5850038, 2.598467, 1, 0, 0.9764706, 1,
0.9735979, 1.863324, 0.1172976, 1, 0, 0.972549, 1,
0.9744663, -0.6522653, 2.835779, 1, 0, 0.9647059, 1,
0.9811898, 0.3331417, 0.8094101, 1, 0, 0.9607843, 1,
1.005305, 0.6724181, 0.5295848, 1, 0, 0.9529412, 1,
1.010635, -0.982836, 2.214838, 1, 0, 0.9490196, 1,
1.010952, -0.1109027, 1.146285, 1, 0, 0.9411765, 1,
1.016926, 1.670524, 0.9750187, 1, 0, 0.9372549, 1,
1.018247, 1.178364, -1.586945, 1, 0, 0.9294118, 1,
1.019366, -0.8857714, 1.371511, 1, 0, 0.9254902, 1,
1.01974, -0.07353618, 1.464541, 1, 0, 0.9176471, 1,
1.020959, -0.6536943, 1.612921, 1, 0, 0.9137255, 1,
1.020986, 0.4035718, 1.270154, 1, 0, 0.9058824, 1,
1.027463, 0.03467201, 1.299359, 1, 0, 0.9019608, 1,
1.0305, -0.09138664, 0.9048051, 1, 0, 0.8941177, 1,
1.036958, 0.2790082, 3.157071, 1, 0, 0.8862745, 1,
1.03853, 1.835343, 0.2360465, 1, 0, 0.8823529, 1,
1.042801, -1.280269, 2.041281, 1, 0, 0.8745098, 1,
1.060157, 0.9330894, 1.188927, 1, 0, 0.8705882, 1,
1.06843, 0.004809851, 0.787134, 1, 0, 0.8627451, 1,
1.07252, 0.2128435, 0.4765677, 1, 0, 0.8588235, 1,
1.073912, 0.7218144, 1.170288, 1, 0, 0.8509804, 1,
1.079612, 2.36111, 1.729781, 1, 0, 0.8470588, 1,
1.085291, 0.3359417, 1.170464, 1, 0, 0.8392157, 1,
1.090517, -1.726212, 2.430626, 1, 0, 0.8352941, 1,
1.092866, 0.01548651, 1.685789, 1, 0, 0.827451, 1,
1.093194, 0.01904112, 0.5262951, 1, 0, 0.8235294, 1,
1.097233, 0.6801131, 0.4596086, 1, 0, 0.8156863, 1,
1.112021, -1.590988, 3.509802, 1, 0, 0.8117647, 1,
1.115652, -0.9714553, 2.56688, 1, 0, 0.8039216, 1,
1.120796, 0.1553395, 2.261888, 1, 0, 0.7960784, 1,
1.122721, 0.5401924, 0.9903199, 1, 0, 0.7921569, 1,
1.127642, -0.2122628, 0.7333239, 1, 0, 0.7843137, 1,
1.127731, 0.4779049, 0.6966885, 1, 0, 0.7803922, 1,
1.129702, -0.4314613, 1.294792, 1, 0, 0.772549, 1,
1.138762, 0.5206318, -0.8980174, 1, 0, 0.7686275, 1,
1.144533, 0.4100534, 2.38778, 1, 0, 0.7607843, 1,
1.148647, -1.930106, 1.967264, 1, 0, 0.7568628, 1,
1.15028, -1.121442, 2.353846, 1, 0, 0.7490196, 1,
1.157757, -0.4528539, 2.767135, 1, 0, 0.7450981, 1,
1.160347, 0.7208055, -0.634099, 1, 0, 0.7372549, 1,
1.16115, 0.4117907, 1.507337, 1, 0, 0.7333333, 1,
1.167229, -0.4463742, 0.6695026, 1, 0, 0.7254902, 1,
1.176056, -0.5789469, 3.208, 1, 0, 0.7215686, 1,
1.187256, 1.026597, 1.228499, 1, 0, 0.7137255, 1,
1.209441, -1.930479, 2.332538, 1, 0, 0.7098039, 1,
1.209891, 0.1682232, 1.758291, 1, 0, 0.7019608, 1,
1.210471, -0.4761572, 3.757177, 1, 0, 0.6941177, 1,
1.212787, 0.04140142, 1.985651, 1, 0, 0.6901961, 1,
1.213977, 2.061965, 1.396561, 1, 0, 0.682353, 1,
1.216222, 1.068183, 0.09307349, 1, 0, 0.6784314, 1,
1.220842, 0.1322284, 1.454457, 1, 0, 0.6705883, 1,
1.228049, 0.7011728, 1.151975, 1, 0, 0.6666667, 1,
1.237583, -0.2021672, 3.423065, 1, 0, 0.6588235, 1,
1.241043, 0.6472652, 0.9587833, 1, 0, 0.654902, 1,
1.247274, 0.7764251, 1.329912, 1, 0, 0.6470588, 1,
1.247756, 0.06638217, 1.569146, 1, 0, 0.6431373, 1,
1.254418, -0.3809252, 2.778102, 1, 0, 0.6352941, 1,
1.26182, -0.02076254, 2.131465, 1, 0, 0.6313726, 1,
1.267198, 0.09365657, 1.039266, 1, 0, 0.6235294, 1,
1.276873, -0.4769823, 2.727443, 1, 0, 0.6196079, 1,
1.281757, 0.7705252, -0.06684502, 1, 0, 0.6117647, 1,
1.293764, -0.6570125, 2.007685, 1, 0, 0.6078432, 1,
1.301456, -1.580707, 2.857321, 1, 0, 0.6, 1,
1.303486, 1.532333, 0.557018, 1, 0, 0.5921569, 1,
1.309229, 0.3639217, 0.708333, 1, 0, 0.5882353, 1,
1.310029, 1.90179, -0.7134658, 1, 0, 0.5803922, 1,
1.317017, -0.2080337, 2.000002, 1, 0, 0.5764706, 1,
1.329045, 0.7243822, 0.1366482, 1, 0, 0.5686275, 1,
1.330347, 1.688366, 0.8910576, 1, 0, 0.5647059, 1,
1.33616, 0.1869234, 0.2967332, 1, 0, 0.5568628, 1,
1.342749, 1.128939, 2.735608, 1, 0, 0.5529412, 1,
1.345319, -0.064737, 1.913769, 1, 0, 0.5450981, 1,
1.363731, 0.7825083, -0.9866654, 1, 0, 0.5411765, 1,
1.365444, -1.524989, 3.119617, 1, 0, 0.5333334, 1,
1.367689, -0.6537482, 2.514552, 1, 0, 0.5294118, 1,
1.371129, -0.1867618, 3.294989, 1, 0, 0.5215687, 1,
1.376149, -0.9663418, 1.860793, 1, 0, 0.5176471, 1,
1.387207, 0.04347989, 2.401073, 1, 0, 0.509804, 1,
1.390448, 1.582982, 1.414927, 1, 0, 0.5058824, 1,
1.391047, 0.4099777, 1.754715, 1, 0, 0.4980392, 1,
1.40338, -1.665555, 4.343189, 1, 0, 0.4901961, 1,
1.406021, 0.149483, 1.396249, 1, 0, 0.4862745, 1,
1.407725, -0.1654763, 1.983385, 1, 0, 0.4784314, 1,
1.410589, -1.163002, 3.609741, 1, 0, 0.4745098, 1,
1.419134, -0.8971483, 0.3476176, 1, 0, 0.4666667, 1,
1.419899, 0.1883946, 2.397402, 1, 0, 0.4627451, 1,
1.434927, 0.2092621, 1.630252, 1, 0, 0.454902, 1,
1.436462, 0.1180116, 0.5992867, 1, 0, 0.4509804, 1,
1.442225, 1.602825, 1.016546, 1, 0, 0.4431373, 1,
1.444745, 1.630038, 1.545713, 1, 0, 0.4392157, 1,
1.45387, 1.234574, 0.5831217, 1, 0, 0.4313726, 1,
1.46696, -0.4611043, 0.5266442, 1, 0, 0.427451, 1,
1.470691, -1.209239, 2.347329, 1, 0, 0.4196078, 1,
1.473473, -1.184944, 1.690287, 1, 0, 0.4156863, 1,
1.481357, 0.2357918, 1.74992, 1, 0, 0.4078431, 1,
1.506865, 1.597411, 0.6004629, 1, 0, 0.4039216, 1,
1.506921, -1.557806, -0.02207884, 1, 0, 0.3960784, 1,
1.510343, 0.8471341, 0.8173164, 1, 0, 0.3882353, 1,
1.529022, 0.03179288, 2.113179, 1, 0, 0.3843137, 1,
1.529739, 0.05782056, 2.287018, 1, 0, 0.3764706, 1,
1.544877, 0.5808037, 0.09519026, 1, 0, 0.372549, 1,
1.546369, -0.8260028, 2.099698, 1, 0, 0.3647059, 1,
1.548227, -0.3978076, 0.6670598, 1, 0, 0.3607843, 1,
1.558272, 0.4546422, -0.305104, 1, 0, 0.3529412, 1,
1.562626, -1.845013, 2.560583, 1, 0, 0.3490196, 1,
1.564198, -0.1095878, 1.095028, 1, 0, 0.3411765, 1,
1.571193, -0.7117883, 3.059583, 1, 0, 0.3372549, 1,
1.579824, -0.1217713, 2.103442, 1, 0, 0.3294118, 1,
1.581383, 0.008381935, 1.549191, 1, 0, 0.3254902, 1,
1.582369, -1.068716, 2.637138, 1, 0, 0.3176471, 1,
1.585989, 0.6822473, 0.7608015, 1, 0, 0.3137255, 1,
1.588258, -0.4169768, 2.847427, 1, 0, 0.3058824, 1,
1.604685, -1.453959, 3.487814, 1, 0, 0.2980392, 1,
1.616177, -1.069356, 2.860697, 1, 0, 0.2941177, 1,
1.627733, -0.112023, 2.077222, 1, 0, 0.2862745, 1,
1.640843, -1.244722, 4.027828, 1, 0, 0.282353, 1,
1.658528, 0.8350955, -0.1788925, 1, 0, 0.2745098, 1,
1.667939, -0.9537447, 1.676037, 1, 0, 0.2705882, 1,
1.679288, -2.872396, 0.5086719, 1, 0, 0.2627451, 1,
1.68513, 0.2374264, 0.2011659, 1, 0, 0.2588235, 1,
1.694185, -1.542747, 1.635, 1, 0, 0.2509804, 1,
1.70444, 1.075599, 1.349699, 1, 0, 0.2470588, 1,
1.706009, 0.07932092, 1.349653, 1, 0, 0.2392157, 1,
1.718632, -0.1070407, 2.569565, 1, 0, 0.2352941, 1,
1.738559, 1.313976, -1.349718, 1, 0, 0.227451, 1,
1.742569, 1.138862, 0.4539428, 1, 0, 0.2235294, 1,
1.751731, -0.6849509, 1.388061, 1, 0, 0.2156863, 1,
1.752095, -0.6862727, 2.975237, 1, 0, 0.2117647, 1,
1.767523, -0.1597193, 1.431423, 1, 0, 0.2039216, 1,
1.773683, -0.6201141, 3.919356, 1, 0, 0.1960784, 1,
1.786093, -0.1552516, 1.915695, 1, 0, 0.1921569, 1,
1.789903, 0.455258, 1.355243, 1, 0, 0.1843137, 1,
1.791721, 0.5971578, 0.9562021, 1, 0, 0.1803922, 1,
1.794563, 1.179712, 0.5992118, 1, 0, 0.172549, 1,
1.794708, -1.24495, 2.47822, 1, 0, 0.1686275, 1,
1.843069, 0.1299674, 1.057879, 1, 0, 0.1607843, 1,
1.861765, 0.7051395, 1.885082, 1, 0, 0.1568628, 1,
1.861778, -1.158246, 2.673275, 1, 0, 0.1490196, 1,
1.880372, -0.9712651, 0.7117167, 1, 0, 0.145098, 1,
1.885504, -0.002160202, 0.9456769, 1, 0, 0.1372549, 1,
1.914874, 0.6141285, 1.69878, 1, 0, 0.1333333, 1,
1.995943, -0.1630163, 1.942062, 1, 0, 0.1254902, 1,
1.999807, -0.173667, 2.166308, 1, 0, 0.1215686, 1,
2.098218, -0.9021634, 3.635755, 1, 0, 0.1137255, 1,
2.099217, -0.8351524, 2.734851, 1, 0, 0.1098039, 1,
2.145049, -0.8245122, 2.354059, 1, 0, 0.1019608, 1,
2.163098, 0.4158379, 2.543963, 1, 0, 0.09411765, 1,
2.18982, 0.3784495, -0.2522615, 1, 0, 0.09019608, 1,
2.229534, -0.04369145, 1.901171, 1, 0, 0.08235294, 1,
2.232851, -0.06278978, 1.89194, 1, 0, 0.07843138, 1,
2.258512, 2.887982, 1.123434, 1, 0, 0.07058824, 1,
2.295599, -3.326006, 2.085643, 1, 0, 0.06666667, 1,
2.295693, 0.3609973, 1.328375, 1, 0, 0.05882353, 1,
2.303399, -0.3707127, 1.389774, 1, 0, 0.05490196, 1,
2.334778, -0.1387419, 1.632195, 1, 0, 0.04705882, 1,
2.432263, -0.9023015, 1.163972, 1, 0, 0.04313726, 1,
2.447155, -0.6703281, 1.781642, 1, 0, 0.03529412, 1,
2.467528, -0.9701065, 1.040582, 1, 0, 0.03137255, 1,
2.473584, -0.2273796, 0.7913457, 1, 0, 0.02352941, 1,
2.476276, -0.03886441, 2.23169, 1, 0, 0.01960784, 1,
2.589931, 0.2305684, 1.575978, 1, 0, 0.01176471, 1,
2.624419, 0.7593352, 1.975331, 1, 0, 0.007843138, 1
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
-0.5452604, -4.379277, -7.840114, 0, -0.5, 0.5, 0.5,
-0.5452604, -4.379277, -7.840114, 1, -0.5, 0.5, 0.5,
-0.5452604, -4.379277, -7.840114, 1, 1.5, 0.5, 0.5,
-0.5452604, -4.379277, -7.840114, 0, 1.5, 0.5, 0.5
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
-4.789462, -0.2190119, -7.840114, 0, -0.5, 0.5, 0.5,
-4.789462, -0.2190119, -7.840114, 1, -0.5, 0.5, 0.5,
-4.789462, -0.2190119, -7.840114, 1, 1.5, 0.5, 0.5,
-4.789462, -0.2190119, -7.840114, 0, 1.5, 0.5, 0.5
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
-4.789462, -4.379277, -0.2401826, 0, -0.5, 0.5, 0.5,
-4.789462, -4.379277, -0.2401826, 1, -0.5, 0.5, 0.5,
-4.789462, -4.379277, -0.2401826, 1, 1.5, 0.5, 0.5,
-4.789462, -4.379277, -0.2401826, 0, 1.5, 0.5, 0.5
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
-3, -3.419215, -6.086283,
2, -3.419215, -6.086283,
-3, -3.419215, -6.086283,
-3, -3.579226, -6.378588,
-2, -3.419215, -6.086283,
-2, -3.579226, -6.378588,
-1, -3.419215, -6.086283,
-1, -3.579226, -6.378588,
0, -3.419215, -6.086283,
0, -3.579226, -6.378588,
1, -3.419215, -6.086283,
1, -3.579226, -6.378588,
2, -3.419215, -6.086283,
2, -3.579226, -6.378588
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
"2"
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
-3, -3.899246, -6.963198, 0, -0.5, 0.5, 0.5,
-3, -3.899246, -6.963198, 1, -0.5, 0.5, 0.5,
-3, -3.899246, -6.963198, 1, 1.5, 0.5, 0.5,
-3, -3.899246, -6.963198, 0, 1.5, 0.5, 0.5,
-2, -3.899246, -6.963198, 0, -0.5, 0.5, 0.5,
-2, -3.899246, -6.963198, 1, -0.5, 0.5, 0.5,
-2, -3.899246, -6.963198, 1, 1.5, 0.5, 0.5,
-2, -3.899246, -6.963198, 0, 1.5, 0.5, 0.5,
-1, -3.899246, -6.963198, 0, -0.5, 0.5, 0.5,
-1, -3.899246, -6.963198, 1, -0.5, 0.5, 0.5,
-1, -3.899246, -6.963198, 1, 1.5, 0.5, 0.5,
-1, -3.899246, -6.963198, 0, 1.5, 0.5, 0.5,
0, -3.899246, -6.963198, 0, -0.5, 0.5, 0.5,
0, -3.899246, -6.963198, 1, -0.5, 0.5, 0.5,
0, -3.899246, -6.963198, 1, 1.5, 0.5, 0.5,
0, -3.899246, -6.963198, 0, 1.5, 0.5, 0.5,
1, -3.899246, -6.963198, 0, -0.5, 0.5, 0.5,
1, -3.899246, -6.963198, 1, -0.5, 0.5, 0.5,
1, -3.899246, -6.963198, 1, 1.5, 0.5, 0.5,
1, -3.899246, -6.963198, 0, 1.5, 0.5, 0.5,
2, -3.899246, -6.963198, 0, -0.5, 0.5, 0.5,
2, -3.899246, -6.963198, 1, -0.5, 0.5, 0.5,
2, -3.899246, -6.963198, 1, 1.5, 0.5, 0.5,
2, -3.899246, -6.963198, 0, 1.5, 0.5, 0.5
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
-3.81003, -3, -6.086283,
-3.81003, 2, -6.086283,
-3.81003, -3, -6.086283,
-3.973269, -3, -6.378588,
-3.81003, -2, -6.086283,
-3.973269, -2, -6.378588,
-3.81003, -1, -6.086283,
-3.973269, -1, -6.378588,
-3.81003, 0, -6.086283,
-3.973269, 0, -6.378588,
-3.81003, 1, -6.086283,
-3.973269, 1, -6.378588,
-3.81003, 2, -6.086283,
-3.973269, 2, -6.378588
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
-4.299746, -3, -6.963198, 0, -0.5, 0.5, 0.5,
-4.299746, -3, -6.963198, 1, -0.5, 0.5, 0.5,
-4.299746, -3, -6.963198, 1, 1.5, 0.5, 0.5,
-4.299746, -3, -6.963198, 0, 1.5, 0.5, 0.5,
-4.299746, -2, -6.963198, 0, -0.5, 0.5, 0.5,
-4.299746, -2, -6.963198, 1, -0.5, 0.5, 0.5,
-4.299746, -2, -6.963198, 1, 1.5, 0.5, 0.5,
-4.299746, -2, -6.963198, 0, 1.5, 0.5, 0.5,
-4.299746, -1, -6.963198, 0, -0.5, 0.5, 0.5,
-4.299746, -1, -6.963198, 1, -0.5, 0.5, 0.5,
-4.299746, -1, -6.963198, 1, 1.5, 0.5, 0.5,
-4.299746, -1, -6.963198, 0, 1.5, 0.5, 0.5,
-4.299746, 0, -6.963198, 0, -0.5, 0.5, 0.5,
-4.299746, 0, -6.963198, 1, -0.5, 0.5, 0.5,
-4.299746, 0, -6.963198, 1, 1.5, 0.5, 0.5,
-4.299746, 0, -6.963198, 0, 1.5, 0.5, 0.5,
-4.299746, 1, -6.963198, 0, -0.5, 0.5, 0.5,
-4.299746, 1, -6.963198, 1, -0.5, 0.5, 0.5,
-4.299746, 1, -6.963198, 1, 1.5, 0.5, 0.5,
-4.299746, 1, -6.963198, 0, 1.5, 0.5, 0.5,
-4.299746, 2, -6.963198, 0, -0.5, 0.5, 0.5,
-4.299746, 2, -6.963198, 1, -0.5, 0.5, 0.5,
-4.299746, 2, -6.963198, 1, 1.5, 0.5, 0.5,
-4.299746, 2, -6.963198, 0, 1.5, 0.5, 0.5
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
-3.81003, -3.419215, -4,
-3.81003, -3.419215, 4,
-3.81003, -3.419215, -4,
-3.973269, -3.579226, -4,
-3.81003, -3.419215, -2,
-3.973269, -3.579226, -2,
-3.81003, -3.419215, 0,
-3.973269, -3.579226, 0,
-3.81003, -3.419215, 2,
-3.973269, -3.579226, 2,
-3.81003, -3.419215, 4,
-3.973269, -3.579226, 4
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
-4.299746, -3.899246, -4, 0, -0.5, 0.5, 0.5,
-4.299746, -3.899246, -4, 1, -0.5, 0.5, 0.5,
-4.299746, -3.899246, -4, 1, 1.5, 0.5, 0.5,
-4.299746, -3.899246, -4, 0, 1.5, 0.5, 0.5,
-4.299746, -3.899246, -2, 0, -0.5, 0.5, 0.5,
-4.299746, -3.899246, -2, 1, -0.5, 0.5, 0.5,
-4.299746, -3.899246, -2, 1, 1.5, 0.5, 0.5,
-4.299746, -3.899246, -2, 0, 1.5, 0.5, 0.5,
-4.299746, -3.899246, 0, 0, -0.5, 0.5, 0.5,
-4.299746, -3.899246, 0, 1, -0.5, 0.5, 0.5,
-4.299746, -3.899246, 0, 1, 1.5, 0.5, 0.5,
-4.299746, -3.899246, 0, 0, 1.5, 0.5, 0.5,
-4.299746, -3.899246, 2, 0, -0.5, 0.5, 0.5,
-4.299746, -3.899246, 2, 1, -0.5, 0.5, 0.5,
-4.299746, -3.899246, 2, 1, 1.5, 0.5, 0.5,
-4.299746, -3.899246, 2, 0, 1.5, 0.5, 0.5,
-4.299746, -3.899246, 4, 0, -0.5, 0.5, 0.5,
-4.299746, -3.899246, 4, 1, -0.5, 0.5, 0.5,
-4.299746, -3.899246, 4, 1, 1.5, 0.5, 0.5,
-4.299746, -3.899246, 4, 0, 1.5, 0.5, 0.5
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
-3.81003, -3.419215, -6.086283,
-3.81003, 2.981192, -6.086283,
-3.81003, -3.419215, 5.605918,
-3.81003, 2.981192, 5.605918,
-3.81003, -3.419215, -6.086283,
-3.81003, -3.419215, 5.605918,
-3.81003, 2.981192, -6.086283,
-3.81003, 2.981192, 5.605918,
-3.81003, -3.419215, -6.086283,
2.71951, -3.419215, -6.086283,
-3.81003, -3.419215, 5.605918,
2.71951, -3.419215, 5.605918,
-3.81003, 2.981192, -6.086283,
2.71951, 2.981192, -6.086283,
-3.81003, 2.981192, 5.605918,
2.71951, 2.981192, 5.605918,
2.71951, -3.419215, -6.086283,
2.71951, 2.981192, -6.086283,
2.71951, -3.419215, 5.605918,
2.71951, 2.981192, 5.605918,
2.71951, -3.419215, -6.086283,
2.71951, -3.419215, 5.605918,
2.71951, 2.981192, -6.086283,
2.71951, 2.981192, 5.605918
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
var radius = 7.925748;
var distance = 35.26255;
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
mvMatrix.translate( 0.5452604, 0.2190119, 0.2401826 );
mvMatrix.scale( 1.312416, 1.338895, 0.7329223 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.26255);
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
diazenesulfonate<-read.table("diazenesulfonate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diazenesulfonate$V2
```

```
## Error in eval(expr, envir, enclos): object 'diazenesulfonate' not found
```

```r
y<-diazenesulfonate$V3
```

```
## Error in eval(expr, envir, enclos): object 'diazenesulfonate' not found
```

```r
z<-diazenesulfonate$V4
```

```
## Error in eval(expr, envir, enclos): object 'diazenesulfonate' not found
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
-3.71494, -1.565829, -1.955449, 0, 0, 1, 1, 1,
-3.186288, -1.173498, -3.7315, 1, 0, 0, 1, 1,
-3.05819, 1.282463, -1.09391, 1, 0, 0, 1, 1,
-2.938862, -0.1578609, -2.58196, 1, 0, 0, 1, 1,
-2.866979, 0.2127728, -1.810292, 1, 0, 0, 1, 1,
-2.846402, 0.2189907, -1.391937, 1, 0, 0, 1, 1,
-2.771473, 0.3851713, -0.06773382, 0, 0, 0, 1, 1,
-2.635476, 0.3885518, -1.37551, 0, 0, 0, 1, 1,
-2.57439, 0.4989446, -3.68479, 0, 0, 0, 1, 1,
-2.514603, -0.9849137, -0.6729884, 0, 0, 0, 1, 1,
-2.430918, 1.223545, -1.924752, 0, 0, 0, 1, 1,
-2.379601, -0.3464168, -1.464653, 0, 0, 0, 1, 1,
-2.302099, 1.508176, -0.3638952, 0, 0, 0, 1, 1,
-2.278064, -0.5378973, -3.658996, 1, 1, 1, 1, 1,
-2.220198, 1.255733, -0.8198431, 1, 1, 1, 1, 1,
-2.214559, 1.827735, -1.402654, 1, 1, 1, 1, 1,
-2.181988, 0.5466237, -1.56867, 1, 1, 1, 1, 1,
-2.177684, -0.297824, -2.421122, 1, 1, 1, 1, 1,
-2.15031, 0.3060178, -2.530001, 1, 1, 1, 1, 1,
-2.149897, -0.7211981, -3.299281, 1, 1, 1, 1, 1,
-2.141423, -1.941149, -1.434734, 1, 1, 1, 1, 1,
-2.11557, 1.79435, -0.9846564, 1, 1, 1, 1, 1,
-2.106253, 0.4997954, -0.5971872, 1, 1, 1, 1, 1,
-2.056069, -0.711204, -1.223871, 1, 1, 1, 1, 1,
-2.049591, -1.835158, -3.841094, 1, 1, 1, 1, 1,
-2.04938, -1.962168, -2.553208, 1, 1, 1, 1, 1,
-2.040805, 1.174796, -1.772248, 1, 1, 1, 1, 1,
-2.031704, -2.607319, -0.336703, 1, 1, 1, 1, 1,
-2.008605, -2.496003, -2.7632, 0, 0, 1, 1, 1,
-1.976929, -0.4161471, 0.5292432, 1, 0, 0, 1, 1,
-1.954281, -0.02201758, -2.13473, 1, 0, 0, 1, 1,
-1.947505, -0.8421638, -1.146163, 1, 0, 0, 1, 1,
-1.921493, -0.7918001, -2.856478, 1, 0, 0, 1, 1,
-1.919776, 1.35728, 1.360701, 1, 0, 0, 1, 1,
-1.904131, 1.230706, -3.0715, 0, 0, 0, 1, 1,
-1.898217, -0.3681928, -0.8518499, 0, 0, 0, 1, 1,
-1.896932, 0.09599092, -1.253638, 0, 0, 0, 1, 1,
-1.873833, 0.6247228, -2.809182, 0, 0, 0, 1, 1,
-1.870978, 0.3147281, -2.420889, 0, 0, 0, 1, 1,
-1.867473, 1.373815, -0.7857132, 0, 0, 0, 1, 1,
-1.865814, 1.240486, -0.9921044, 0, 0, 0, 1, 1,
-1.845894, -0.4088738, -3.002956, 1, 1, 1, 1, 1,
-1.837437, -0.03503594, -1.434076, 1, 1, 1, 1, 1,
-1.835404, 0.3261622, -1.44472, 1, 1, 1, 1, 1,
-1.819414, -1.022044, -0.8413983, 1, 1, 1, 1, 1,
-1.816292, -0.3394943, -3.868719, 1, 1, 1, 1, 1,
-1.813301, -0.2850849, -1.852741, 1, 1, 1, 1, 1,
-1.811324, -2.162784, -2.848087, 1, 1, 1, 1, 1,
-1.805588, -0.221906, -2.322583, 1, 1, 1, 1, 1,
-1.784753, -0.5504944, -0.05994877, 1, 1, 1, 1, 1,
-1.761215, -1.447353, -3.821804, 1, 1, 1, 1, 1,
-1.7527, 0.1803517, 0.3639095, 1, 1, 1, 1, 1,
-1.7501, -0.04963772, -0.3148684, 1, 1, 1, 1, 1,
-1.738587, -0.003149685, -3.646358, 1, 1, 1, 1, 1,
-1.730077, -0.139626, -0.8339425, 1, 1, 1, 1, 1,
-1.707731, 0.8144583, -0.2761571, 1, 1, 1, 1, 1,
-1.702946, -0.5008559, -1.488841, 0, 0, 1, 1, 1,
-1.701815, 0.4505459, 0.08478377, 1, 0, 0, 1, 1,
-1.670859, -0.0589618, -0.2581974, 1, 0, 0, 1, 1,
-1.6413, 0.08648656, -0.9580438, 1, 0, 0, 1, 1,
-1.641231, -0.08521187, -2.95493, 1, 0, 0, 1, 1,
-1.639217, 1.578612, -3.219961, 1, 0, 0, 1, 1,
-1.637204, -1.135627, -2.282212, 0, 0, 0, 1, 1,
-1.624591, 0.6430386, 0.2725217, 0, 0, 0, 1, 1,
-1.61439, -1.789964, -2.464392, 0, 0, 0, 1, 1,
-1.608312, 0.8032561, -1.060301, 0, 0, 0, 1, 1,
-1.588757, 1.550747, 1.055366, 0, 0, 0, 1, 1,
-1.576915, -1.503221, -4.887412, 0, 0, 0, 1, 1,
-1.574192, -0.3695827, -2.043308, 0, 0, 0, 1, 1,
-1.568193, 1.066091, -0.5518513, 1, 1, 1, 1, 1,
-1.553419, -0.4669512, -2.701339, 1, 1, 1, 1, 1,
-1.551727, -0.05020459, -1.639867, 1, 1, 1, 1, 1,
-1.516865, -1.09191, -1.864901, 1, 1, 1, 1, 1,
-1.510517, 0.09321587, -2.117261, 1, 1, 1, 1, 1,
-1.503093, -1.300374, -2.19983, 1, 1, 1, 1, 1,
-1.495798, 0.5278642, -0.6505408, 1, 1, 1, 1, 1,
-1.482822, 0.09545388, -1.351517, 1, 1, 1, 1, 1,
-1.473105, 0.1260959, 0.16994, 1, 1, 1, 1, 1,
-1.470072, 0.5707989, 0.5854862, 1, 1, 1, 1, 1,
-1.463977, 0.7192639, 0.2812431, 1, 1, 1, 1, 1,
-1.459671, -0.6824819, -1.556201, 1, 1, 1, 1, 1,
-1.452292, 0.1991252, -1.5694, 1, 1, 1, 1, 1,
-1.450409, -0.4995562, -2.229282, 1, 1, 1, 1, 1,
-1.4439, 0.1185707, -3.265496, 1, 1, 1, 1, 1,
-1.426524, -0.8647335, -1.112315, 0, 0, 1, 1, 1,
-1.411272, -0.2512273, -0.6172311, 1, 0, 0, 1, 1,
-1.410426, 0.4880585, 0.6654797, 1, 0, 0, 1, 1,
-1.404575, 0.1153313, -0.8946087, 1, 0, 0, 1, 1,
-1.397558, 0.6963699, -1.31212, 1, 0, 0, 1, 1,
-1.386291, 0.1216589, -0.1091163, 1, 0, 0, 1, 1,
-1.384123, 0.3160011, -0.1758171, 0, 0, 0, 1, 1,
-1.383565, 1.359159, -3.136483, 0, 0, 0, 1, 1,
-1.376766, 1.742215, -0.4960547, 0, 0, 0, 1, 1,
-1.366137, 0.2656665, -1.382267, 0, 0, 0, 1, 1,
-1.350915, -0.1770928, -1.165609, 0, 0, 0, 1, 1,
-1.332987, 0.6193705, -3.028307, 0, 0, 0, 1, 1,
-1.320393, 0.6481564, -3.124998, 0, 0, 0, 1, 1,
-1.316619, 1.497778, -0.8083105, 1, 1, 1, 1, 1,
-1.315965, 0.3117991, -2.007411, 1, 1, 1, 1, 1,
-1.309524, -1.126072, -0.9635427, 1, 1, 1, 1, 1,
-1.306511, -0.807521, -2.796177, 1, 1, 1, 1, 1,
-1.306395, 0.385714, -1.016897, 1, 1, 1, 1, 1,
-1.287975, 2.131366, 0.02068747, 1, 1, 1, 1, 1,
-1.282019, -0.1769729, -1.625438, 1, 1, 1, 1, 1,
-1.281934, 0.5474346, -1.552042, 1, 1, 1, 1, 1,
-1.271107, 0.4032922, 0.2225564, 1, 1, 1, 1, 1,
-1.264813, 0.2098688, -0.9841331, 1, 1, 1, 1, 1,
-1.260567, 1.368898, -0.6283816, 1, 1, 1, 1, 1,
-1.258241, -1.839282, -2.698548, 1, 1, 1, 1, 1,
-1.258017, 0.8573355, -1.4438, 1, 1, 1, 1, 1,
-1.253762, 0.2116657, -1.489806, 1, 1, 1, 1, 1,
-1.245352, 0.9547139, -0.4559379, 1, 1, 1, 1, 1,
-1.240283, -0.8637075, -0.669454, 0, 0, 1, 1, 1,
-1.225523, 0.3896112, -0.995802, 1, 0, 0, 1, 1,
-1.222131, -0.7781352, -4.179348, 1, 0, 0, 1, 1,
-1.221222, 0.9548317, -1.570904, 1, 0, 0, 1, 1,
-1.210473, 1.638026, 0.3543486, 1, 0, 0, 1, 1,
-1.209352, 1.007645, -2.048561, 1, 0, 0, 1, 1,
-1.206226, -0.3780687, -2.426057, 0, 0, 0, 1, 1,
-1.204035, -1.83095, -3.909984, 0, 0, 0, 1, 1,
-1.201557, 0.2114483, -1.03219, 0, 0, 0, 1, 1,
-1.199237, 0.4122287, -1.134293, 0, 0, 0, 1, 1,
-1.186462, -0.9256921, -3.402144, 0, 0, 0, 1, 1,
-1.182128, -1.112131, -2.314866, 0, 0, 0, 1, 1,
-1.179665, -0.3745347, -0.9013089, 0, 0, 0, 1, 1,
-1.176979, 0.1120355, -1.596896, 1, 1, 1, 1, 1,
-1.174366, -0.2295777, -2.149986, 1, 1, 1, 1, 1,
-1.170278, -2.070142, -1.077276, 1, 1, 1, 1, 1,
-1.166644, -1.147675, -2.508098, 1, 1, 1, 1, 1,
-1.164111, -0.1464006, -2.203224, 1, 1, 1, 1, 1,
-1.159675, -0.4685328, -2.993562, 1, 1, 1, 1, 1,
-1.153563, 0.1279236, -2.928147, 1, 1, 1, 1, 1,
-1.147006, 0.2546059, -2.807063, 1, 1, 1, 1, 1,
-1.137063, -0.8905659, -1.535818, 1, 1, 1, 1, 1,
-1.137059, -0.2738617, -1.901627, 1, 1, 1, 1, 1,
-1.131585, 0.1206364, -2.61019, 1, 1, 1, 1, 1,
-1.128518, 0.9997416, -0.3594007, 1, 1, 1, 1, 1,
-1.121959, 0.105927, 0.3972769, 1, 1, 1, 1, 1,
-1.121015, -1.923491, -1.751144, 1, 1, 1, 1, 1,
-1.120605, 0.3077023, -0.6727736, 1, 1, 1, 1, 1,
-1.117954, 0.501527, -1.267166, 0, 0, 1, 1, 1,
-1.117781, -0.2434869, -2.449503, 1, 0, 0, 1, 1,
-1.116421, -0.9397373, -1.641009, 1, 0, 0, 1, 1,
-1.116073, -0.8632352, -2.128297, 1, 0, 0, 1, 1,
-1.113424, -0.5864449, -1.198399, 1, 0, 0, 1, 1,
-1.100534, 0.00938303, -2.367074, 1, 0, 0, 1, 1,
-1.093997, 0.8761169, -1.982286, 0, 0, 0, 1, 1,
-1.089042, -0.9037092, -4.257964, 0, 0, 0, 1, 1,
-1.087219, -0.5367206, -1.919239, 0, 0, 0, 1, 1,
-1.081209, -0.1187257, -2.162654, 0, 0, 0, 1, 1,
-1.080076, -1.092966, 0.4060632, 0, 0, 0, 1, 1,
-1.077541, 1.519167, 0.8619618, 0, 0, 0, 1, 1,
-1.074243, -0.8875169, -2.811782, 0, 0, 0, 1, 1,
-1.072574, 1.214684, 0.2179679, 1, 1, 1, 1, 1,
-1.068749, -0.003961653, -2.398336, 1, 1, 1, 1, 1,
-1.066187, 1.705778, -1.52596, 1, 1, 1, 1, 1,
-1.065521, 0.127207, -0.04846737, 1, 1, 1, 1, 1,
-1.064625, -0.7534257, -0.7422565, 1, 1, 1, 1, 1,
-1.062769, 1.086627, -0.5547532, 1, 1, 1, 1, 1,
-1.062157, 1.184975, -0.4598161, 1, 1, 1, 1, 1,
-1.054361, 1.300222, -0.9739137, 1, 1, 1, 1, 1,
-1.046444, 0.4243384, -1.606845, 1, 1, 1, 1, 1,
-1.043109, 1.352145, -0.2656787, 1, 1, 1, 1, 1,
-1.040282, 0.9088871, -1.613342, 1, 1, 1, 1, 1,
-1.029543, -0.6676126, -2.239876, 1, 1, 1, 1, 1,
-1.020689, 1.175549, 0.7809091, 1, 1, 1, 1, 1,
-1.018302, 0.2521657, -2.431559, 1, 1, 1, 1, 1,
-1.01821, -0.4632137, -2.933757, 1, 1, 1, 1, 1,
-1.017233, -1.189697, -2.956497, 0, 0, 1, 1, 1,
-1.012847, -2.143093, -2.751221, 1, 0, 0, 1, 1,
-1.008782, -1.20849, -3.169008, 1, 0, 0, 1, 1,
-0.988889, -2.244843, -1.615793, 1, 0, 0, 1, 1,
-0.9878466, 0.2332725, -1.166106, 1, 0, 0, 1, 1,
-0.9872201, 1.426783, -1.11125, 1, 0, 0, 1, 1,
-0.9817625, -0.5448468, -1.965564, 0, 0, 0, 1, 1,
-0.977522, -1.897319, -3.567858, 0, 0, 0, 1, 1,
-0.9747211, 1.22237, -0.603847, 0, 0, 0, 1, 1,
-0.9731201, 1.496399, -1.570995, 0, 0, 0, 1, 1,
-0.9728606, -1.126842, -2.5204, 0, 0, 0, 1, 1,
-0.972452, -0.01936934, -1.139044, 0, 0, 0, 1, 1,
-0.9693358, 0.4096064, -1.308244, 0, 0, 0, 1, 1,
-0.9639311, -1.206296, -1.389705, 1, 1, 1, 1, 1,
-0.9625525, -2.04373, -3.897313, 1, 1, 1, 1, 1,
-0.9613252, 1.079606, -0.910006, 1, 1, 1, 1, 1,
-0.9595498, 0.0733426, -1.310302, 1, 1, 1, 1, 1,
-0.9592882, -0.207789, -1.588164, 1, 1, 1, 1, 1,
-0.9553863, -0.2842817, -0.801155, 1, 1, 1, 1, 1,
-0.9473184, -0.04295582, -2.849477, 1, 1, 1, 1, 1,
-0.9467106, -1.010339, -1.673587, 1, 1, 1, 1, 1,
-0.9451981, -0.2020717, -3.091057, 1, 1, 1, 1, 1,
-0.9397038, -0.08612681, -2.610873, 1, 1, 1, 1, 1,
-0.9393486, 0.4513, -0.3103964, 1, 1, 1, 1, 1,
-0.9369145, -0.2171185, -1.903003, 1, 1, 1, 1, 1,
-0.9354013, -0.5726602, -2.076742, 1, 1, 1, 1, 1,
-0.9305885, 0.958351, -0.3230495, 1, 1, 1, 1, 1,
-0.9290258, 0.08272998, -1.809072, 1, 1, 1, 1, 1,
-0.9274834, -0.9231521, 0.2886776, 0, 0, 1, 1, 1,
-0.9217906, -0.05104841, -2.093859, 1, 0, 0, 1, 1,
-0.9216247, 0.05767347, -1.667111, 1, 0, 0, 1, 1,
-0.9148909, -1.798892, -1.559911, 1, 0, 0, 1, 1,
-0.9131842, 0.8673401, -0.9367384, 1, 0, 0, 1, 1,
-0.9125355, 0.8518717, -2.048359, 1, 0, 0, 1, 1,
-0.9120838, 0.5396473, -1.970479, 0, 0, 0, 1, 1,
-0.9110504, -0.8932814, -3.211514, 0, 0, 0, 1, 1,
-0.900843, 1.346701, -0.9341585, 0, 0, 0, 1, 1,
-0.9008256, 1.755929, -2.304035, 0, 0, 0, 1, 1,
-0.8961223, 0.532878, -2.332655, 0, 0, 0, 1, 1,
-0.8940091, 0.8211746, -0.3089083, 0, 0, 0, 1, 1,
-0.8887332, 0.06412137, -1.944374, 0, 0, 0, 1, 1,
-0.888592, 0.8447292, -3.954273, 1, 1, 1, 1, 1,
-0.8812566, -0.5922811, -2.395549, 1, 1, 1, 1, 1,
-0.8680306, -1.45216, -2.196137, 1, 1, 1, 1, 1,
-0.8669318, -0.8272989, -2.623938, 1, 1, 1, 1, 1,
-0.8619354, -1.166637, -3.044712, 1, 1, 1, 1, 1,
-0.8594645, -0.1983056, -1.804927, 1, 1, 1, 1, 1,
-0.8566963, 0.3368084, -1.512417, 1, 1, 1, 1, 1,
-0.8560783, -0.1701455, -0.6528154, 1, 1, 1, 1, 1,
-0.8538265, 0.2535959, -1.257246, 1, 1, 1, 1, 1,
-0.8537058, -0.3228046, -0.5434715, 1, 1, 1, 1, 1,
-0.8487444, 1.943217, 1.411262, 1, 1, 1, 1, 1,
-0.848033, 1.763221, -0.9050677, 1, 1, 1, 1, 1,
-0.8411875, 0.3242599, -0.7996504, 1, 1, 1, 1, 1,
-0.8306208, 1.624428, 0.7420759, 1, 1, 1, 1, 1,
-0.8246971, 0.3694745, -0.8870431, 1, 1, 1, 1, 1,
-0.819842, -0.5246488, -2.559274, 0, 0, 1, 1, 1,
-0.8132165, 1.061505, -0.3286141, 1, 0, 0, 1, 1,
-0.8079385, -0.1028318, -2.709298, 1, 0, 0, 1, 1,
-0.8030493, 0.605733, -1.937143, 1, 0, 0, 1, 1,
-0.8018973, 1.501103, 1.569057, 1, 0, 0, 1, 1,
-0.7958981, -0.2399924, -2.574337, 1, 0, 0, 1, 1,
-0.7951007, -0.7711185, -3.841888, 0, 0, 0, 1, 1,
-0.7950965, 0.4048862, -0.1460989, 0, 0, 0, 1, 1,
-0.7940971, 0.0642191, -2.110307, 0, 0, 0, 1, 1,
-0.7891301, -1.328179, -2.061929, 0, 0, 0, 1, 1,
-0.7846548, 0.4938408, 0.4437918, 0, 0, 0, 1, 1,
-0.7830732, -1.295871, -4.099998, 0, 0, 0, 1, 1,
-0.7807136, 0.6639577, -1.85369, 0, 0, 0, 1, 1,
-0.7799316, 0.1357809, 0.2727374, 1, 1, 1, 1, 1,
-0.7715272, 0.7902817, -1.670612, 1, 1, 1, 1, 1,
-0.7666398, 0.552004, -0.007198753, 1, 1, 1, 1, 1,
-0.7653902, -0.4165474, -2.159768, 1, 1, 1, 1, 1,
-0.7617855, -1.968095, -3.524451, 1, 1, 1, 1, 1,
-0.7442315, 1.465553, -1.014928, 1, 1, 1, 1, 1,
-0.7430996, -0.9750835, -2.908237, 1, 1, 1, 1, 1,
-0.7430887, -0.3205758, -2.602018, 1, 1, 1, 1, 1,
-0.7421799, -0.7238989, -0.4529226, 1, 1, 1, 1, 1,
-0.740169, 0.1104037, -0.9337268, 1, 1, 1, 1, 1,
-0.7401603, 0.1043683, 0.6944133, 1, 1, 1, 1, 1,
-0.7326766, -0.4402331, -3.989982, 1, 1, 1, 1, 1,
-0.7307863, 0.1878895, -1.179887, 1, 1, 1, 1, 1,
-0.7306074, 0.3279189, -2.160561, 1, 1, 1, 1, 1,
-0.7239321, 1.360656, 0.3196722, 1, 1, 1, 1, 1,
-0.7191541, 0.385617, -1.586635, 0, 0, 1, 1, 1,
-0.7160053, 0.8006074, -3.496034, 1, 0, 0, 1, 1,
-0.7129259, -1.087409, -1.726025, 1, 0, 0, 1, 1,
-0.7120508, 0.6518826, -1.216924, 1, 0, 0, 1, 1,
-0.7096415, -0.2230916, -2.027198, 1, 0, 0, 1, 1,
-0.7075313, -1.27813, -3.234066, 1, 0, 0, 1, 1,
-0.7072626, 0.7330337, -0.2913753, 0, 0, 0, 1, 1,
-0.6979837, 0.07253674, -1.734328, 0, 0, 0, 1, 1,
-0.6907828, 2.288291, 0.8446358, 0, 0, 0, 1, 1,
-0.6850564, -1.185982, -2.719533, 0, 0, 0, 1, 1,
-0.6795635, 1.136706, -1.041482, 0, 0, 0, 1, 1,
-0.6785349, -0.2095663, -0.9246029, 0, 0, 0, 1, 1,
-0.6772446, 0.7455473, -1.069275, 0, 0, 0, 1, 1,
-0.6766635, 1.903364, 1.849704, 1, 1, 1, 1, 1,
-0.6645358, -0.1244058, -2.283568, 1, 1, 1, 1, 1,
-0.6643392, 1.117621, -1.222316, 1, 1, 1, 1, 1,
-0.6629781, 1.461931, -0.5556699, 1, 1, 1, 1, 1,
-0.6627362, -0.7709642, -2.355435, 1, 1, 1, 1, 1,
-0.6588517, 1.832459, -0.06652854, 1, 1, 1, 1, 1,
-0.6572556, -0.2058766, -1.638998, 1, 1, 1, 1, 1,
-0.6551427, 0.9432587, -1.913099, 1, 1, 1, 1, 1,
-0.6548472, -1.419119, -3.200797, 1, 1, 1, 1, 1,
-0.6543948, -0.2328273, -1.13265, 1, 1, 1, 1, 1,
-0.6509886, -0.6339537, -1.224001, 1, 1, 1, 1, 1,
-0.6404064, -0.8073626, -2.451314, 1, 1, 1, 1, 1,
-0.6387292, -2.240121, -2.437191, 1, 1, 1, 1, 1,
-0.6372154, 0.9298007, -0.2002752, 1, 1, 1, 1, 1,
-0.6346694, -0.4088505, -2.437991, 1, 1, 1, 1, 1,
-0.6334733, 1.039206, 0.6406865, 0, 0, 1, 1, 1,
-0.6334464, -0.238402, -0.5724329, 1, 0, 0, 1, 1,
-0.6258422, -0.8115441, -3.538152, 1, 0, 0, 1, 1,
-0.6169544, 0.2338543, -3.415248, 1, 0, 0, 1, 1,
-0.6151885, -1.152283, -3.035448, 1, 0, 0, 1, 1,
-0.6144544, 1.24045, 0.5042421, 1, 0, 0, 1, 1,
-0.6098427, -0.3710594, 0.2552533, 0, 0, 0, 1, 1,
-0.6080877, -1.037471, -1.551318, 0, 0, 0, 1, 1,
-0.6064358, -2.349195, -3.186875, 0, 0, 0, 1, 1,
-0.6053873, -0.1668184, -0.953379, 0, 0, 0, 1, 1,
-0.6045958, 0.4303025, -0.7177522, 0, 0, 0, 1, 1,
-0.6017784, 0.1892149, -0.6551406, 0, 0, 0, 1, 1,
-0.5991026, 0.8670123, -1.170605, 0, 0, 0, 1, 1,
-0.5976217, 1.168433, 0.4418247, 1, 1, 1, 1, 1,
-0.5975772, 0.1642889, -3.83493, 1, 1, 1, 1, 1,
-0.591809, 0.5013891, 0.30265, 1, 1, 1, 1, 1,
-0.5874186, -1.70076, -2.923541, 1, 1, 1, 1, 1,
-0.5872977, -0.2028197, -2.606598, 1, 1, 1, 1, 1,
-0.5814631, 0.9036297, -1.021382, 1, 1, 1, 1, 1,
-0.5772273, 0.7002118, -0.5204716, 1, 1, 1, 1, 1,
-0.5728166, -1.07228, -2.870667, 1, 1, 1, 1, 1,
-0.5689831, -1.46439, -1.646921, 1, 1, 1, 1, 1,
-0.5629495, -1.133517, -2.917505, 1, 1, 1, 1, 1,
-0.5609785, -0.6290756, -2.683246, 1, 1, 1, 1, 1,
-0.560864, -0.5048519, -1.602371, 1, 1, 1, 1, 1,
-0.559429, 1.484436, -0.1546401, 1, 1, 1, 1, 1,
-0.5559712, 0.8589944, 0.02902003, 1, 1, 1, 1, 1,
-0.5508667, -0.5693956, -1.596245, 1, 1, 1, 1, 1,
-0.5503401, -0.5698165, -3.293006, 0, 0, 1, 1, 1,
-0.5482275, -1.872791, -2.907559, 1, 0, 0, 1, 1,
-0.5453725, -0.2496379, -2.076165, 1, 0, 0, 1, 1,
-0.5444931, 1.007531, -0.7361137, 1, 0, 0, 1, 1,
-0.542642, 0.8460812, 0.7061497, 1, 0, 0, 1, 1,
-0.5379445, 0.03687733, -3.941113, 1, 0, 0, 1, 1,
-0.533816, -0.8576462, -2.973307, 0, 0, 0, 1, 1,
-0.5325624, 0.4440125, -2.626344, 0, 0, 0, 1, 1,
-0.5302094, -0.4272257, -1.57769, 0, 0, 0, 1, 1,
-0.5273365, -0.2209014, -1.53002, 0, 0, 0, 1, 1,
-0.5265987, -0.6043876, -0.0685781, 0, 0, 0, 1, 1,
-0.5164238, -0.007076717, -2.69909, 0, 0, 0, 1, 1,
-0.5155213, 1.822841, 0.2261837, 0, 0, 0, 1, 1,
-0.5107974, 1.207407, -1.081275, 1, 1, 1, 1, 1,
-0.508593, -2.266968, -3.647141, 1, 1, 1, 1, 1,
-0.5085248, 0.02875432, 0.4916359, 1, 1, 1, 1, 1,
-0.5032716, -2.359109, -3.600221, 1, 1, 1, 1, 1,
-0.4937905, -0.3493137, -2.309034, 1, 1, 1, 1, 1,
-0.4934036, 0.5318296, -1.382365, 1, 1, 1, 1, 1,
-0.490611, 0.3396491, -0.9498621, 1, 1, 1, 1, 1,
-0.4857051, -1.051977, -2.357286, 1, 1, 1, 1, 1,
-0.4850639, -0.4084073, -3.152728, 1, 1, 1, 1, 1,
-0.4778765, -0.4683027, -2.936941, 1, 1, 1, 1, 1,
-0.477055, 0.7302547, 0.2474192, 1, 1, 1, 1, 1,
-0.4658854, 0.07500122, -1.535805, 1, 1, 1, 1, 1,
-0.4626049, -0.3606372, -1.006301, 1, 1, 1, 1, 1,
-0.4579253, -1.193306, -3.757532, 1, 1, 1, 1, 1,
-0.4544275, -0.2309245, -2.603305, 1, 1, 1, 1, 1,
-0.4486465, 0.2118546, -0.4440555, 0, 0, 1, 1, 1,
-0.4479635, 1.875529, -0.0104487, 1, 0, 0, 1, 1,
-0.4443564, 1.081693, -0.5457764, 1, 0, 0, 1, 1,
-0.4423348, 1.300193, 0.1238917, 1, 0, 0, 1, 1,
-0.4420818, -0.53096, -1.813871, 1, 0, 0, 1, 1,
-0.4414847, -0.5854735, -4.414936, 1, 0, 0, 1, 1,
-0.4408554, -0.2203328, 0.03686969, 0, 0, 0, 1, 1,
-0.4398681, -2.449536, -4.601988, 0, 0, 0, 1, 1,
-0.4349436, -0.5126228, -2.509363, 0, 0, 0, 1, 1,
-0.4346146, -0.7426304, -2.715115, 0, 0, 0, 1, 1,
-0.4326473, 0.07689256, -1.288865, 0, 0, 0, 1, 1,
-0.4184143, -0.2433582, -2.18824, 0, 0, 0, 1, 1,
-0.399388, -1.467721, -3.204932, 0, 0, 0, 1, 1,
-0.3986154, 0.4118496, 0.116135, 1, 1, 1, 1, 1,
-0.3964183, -2.038984, -3.269838, 1, 1, 1, 1, 1,
-0.3873549, 0.3578768, -1.579671, 1, 1, 1, 1, 1,
-0.3870456, 0.1018436, -0.896452, 1, 1, 1, 1, 1,
-0.3862408, -0.6263109, -2.759504, 1, 1, 1, 1, 1,
-0.3760155, 0.2722196, -2.076116, 1, 1, 1, 1, 1,
-0.3688727, -1.039326, -3.561227, 1, 1, 1, 1, 1,
-0.365035, -0.2523271, -1.780449, 1, 1, 1, 1, 1,
-0.3638691, 0.2949017, -1.148481, 1, 1, 1, 1, 1,
-0.3613754, 0.8677374, 0.3478496, 1, 1, 1, 1, 1,
-0.3604447, 1.535838, 0.3176319, 1, 1, 1, 1, 1,
-0.3592345, 0.4031636, 0.3988317, 1, 1, 1, 1, 1,
-0.3577504, 1.218387, 1.122763, 1, 1, 1, 1, 1,
-0.3557282, -0.02493028, -0.9989968, 1, 1, 1, 1, 1,
-0.3536774, 0.5614517, -0.1483713, 1, 1, 1, 1, 1,
-0.351605, -0.8769836, -4.174631, 0, 0, 1, 1, 1,
-0.3481482, -0.03533133, -0.2543699, 1, 0, 0, 1, 1,
-0.345387, -1.703491, -2.077384, 1, 0, 0, 1, 1,
-0.3432809, -0.5722589, -3.168102, 1, 0, 0, 1, 1,
-0.3413985, 1.795655, -0.7066209, 1, 0, 0, 1, 1,
-0.3403824, 0.9993162, 0.7970699, 1, 0, 0, 1, 1,
-0.3315091, -0.2258614, -0.7311899, 0, 0, 0, 1, 1,
-0.3278764, -1.244117, -2.974825, 0, 0, 0, 1, 1,
-0.3276661, -2.047568, -1.711387, 0, 0, 0, 1, 1,
-0.3259998, -2.092137, -2.865103, 0, 0, 0, 1, 1,
-0.3251931, -0.0988342, 0.9918519, 0, 0, 0, 1, 1,
-0.3245089, -0.7244148, -2.116993, 0, 0, 0, 1, 1,
-0.321025, -2.052998, -1.287484, 0, 0, 0, 1, 1,
-0.315731, 0.6214115, 0.2056745, 1, 1, 1, 1, 1,
-0.3118241, 1.157658, 0.407483, 1, 1, 1, 1, 1,
-0.3082074, 0.2252054, -1.16485, 1, 1, 1, 1, 1,
-0.3029794, 0.02334051, -0.22582, 1, 1, 1, 1, 1,
-0.3020612, -0.1044113, -2.664315, 1, 1, 1, 1, 1,
-0.2971254, -0.9964304, -0.8956385, 1, 1, 1, 1, 1,
-0.2893556, -1.034073, -0.9095336, 1, 1, 1, 1, 1,
-0.2828157, 0.1663736, -1.289663, 1, 1, 1, 1, 1,
-0.2739406, 0.4375246, -0.4196503, 1, 1, 1, 1, 1,
-0.2731642, 1.436747, -0.6441088, 1, 1, 1, 1, 1,
-0.271763, -0.6788778, -0.6405914, 1, 1, 1, 1, 1,
-0.2669097, -0.3249117, -3.260095, 1, 1, 1, 1, 1,
-0.2621691, 1.008086, -1.159124, 1, 1, 1, 1, 1,
-0.2609243, -0.6350073, -3.568349, 1, 1, 1, 1, 1,
-0.2579165, 1.572572, -0.6843421, 1, 1, 1, 1, 1,
-0.251422, -0.9221244, -1.728067, 0, 0, 1, 1, 1,
-0.2513122, 0.8150046, -1.033507, 1, 0, 0, 1, 1,
-0.2503228, 0.08416208, -0.5310655, 1, 0, 0, 1, 1,
-0.2497234, -0.8735436, -2.598205, 1, 0, 0, 1, 1,
-0.2490672, -1.61732, -2.442373, 1, 0, 0, 1, 1,
-0.2485342, -0.1277223, -1.789675, 1, 0, 0, 1, 1,
-0.2469268, 1.30038, -0.7405613, 0, 0, 0, 1, 1,
-0.2437758, 0.2565231, -0.5121736, 0, 0, 0, 1, 1,
-0.2417249, -0.2276141, -2.744447, 0, 0, 0, 1, 1,
-0.2414098, -0.9406263, -2.356648, 0, 0, 0, 1, 1,
-0.2370337, -2.365315, -3.020521, 0, 0, 0, 1, 1,
-0.2369, 1.351536, -0.5073649, 0, 0, 0, 1, 1,
-0.2359277, -0.09741688, -2.423644, 0, 0, 0, 1, 1,
-0.2291908, 2.044572, -0.537659, 1, 1, 1, 1, 1,
-0.2290797, 0.3702094, -0.01078871, 1, 1, 1, 1, 1,
-0.2254606, -0.3690963, -2.19987, 1, 1, 1, 1, 1,
-0.22522, -0.8882029, -2.31961, 1, 1, 1, 1, 1,
-0.2240605, -0.7371806, -4.276191, 1, 1, 1, 1, 1,
-0.2182692, 0.01136761, -0.2517934, 1, 1, 1, 1, 1,
-0.2161516, 2.307546, -0.2806392, 1, 1, 1, 1, 1,
-0.2129014, -0.2637876, -1.176688, 1, 1, 1, 1, 1,
-0.2122255, 1.786914, 0.04437855, 1, 1, 1, 1, 1,
-0.211833, -1.319764, -5.916008, 1, 1, 1, 1, 1,
-0.2109575, -0.01301268, -2.19229, 1, 1, 1, 1, 1,
-0.2096007, -0.7002138, -1.94564, 1, 1, 1, 1, 1,
-0.2079205, 1.127289, 1.00128, 1, 1, 1, 1, 1,
-0.2057846, 1.985286, 0.5538522, 1, 1, 1, 1, 1,
-0.2044988, -0.3987558, -4.692306, 1, 1, 1, 1, 1,
-0.1974571, -0.315944, -2.535915, 0, 0, 1, 1, 1,
-0.1953101, -0.07054348, -1.202418, 1, 0, 0, 1, 1,
-0.1926959, -0.5717196, -2.63742, 1, 0, 0, 1, 1,
-0.1909442, 1.607214, -0.4899276, 1, 0, 0, 1, 1,
-0.1892739, -1.257591, -1.97529, 1, 0, 0, 1, 1,
-0.1875207, -0.4319397, -2.382763, 1, 0, 0, 1, 1,
-0.1863348, -1.047261, -2.070725, 0, 0, 0, 1, 1,
-0.1848693, -1.004114, -3.501019, 0, 0, 0, 1, 1,
-0.180845, 0.03940448, -1.442801, 0, 0, 0, 1, 1,
-0.179104, -1.398464, -1.631043, 0, 0, 0, 1, 1,
-0.1672959, 1.205857, -1.675916, 0, 0, 0, 1, 1,
-0.1667397, -1.321423, -4.810114, 0, 0, 0, 1, 1,
-0.1664133, -1.348589, -2.164913, 0, 0, 0, 1, 1,
-0.1647137, -1.599555, -2.135233, 1, 1, 1, 1, 1,
-0.1644413, -1.678549, -1.547319, 1, 1, 1, 1, 1,
-0.1622197, 1.363024, -0.7498327, 1, 1, 1, 1, 1,
-0.1612922, -0.1021278, -1.745158, 1, 1, 1, 1, 1,
-0.158626, -0.1456585, -0.5174793, 1, 1, 1, 1, 1,
-0.157225, 0.7646213, -0.6178294, 1, 1, 1, 1, 1,
-0.1570518, -0.2185831, -2.384382, 1, 1, 1, 1, 1,
-0.1540277, 1.81373, -1.030329, 1, 1, 1, 1, 1,
-0.1521087, -0.7532383, -2.88414, 1, 1, 1, 1, 1,
-0.1516348, 0.7027369, 0.4761997, 1, 1, 1, 1, 1,
-0.1516156, -0.4070358, -3.786906, 1, 1, 1, 1, 1,
-0.1449369, 0.5245084, 0.2444472, 1, 1, 1, 1, 1,
-0.1436783, -1.77711, -4.160019, 1, 1, 1, 1, 1,
-0.1376596, -1.658481, -4.768764, 1, 1, 1, 1, 1,
-0.1351016, 0.4393768, 0.6653999, 1, 1, 1, 1, 1,
-0.1340765, 0.6194677, -1.799305, 0, 0, 1, 1, 1,
-0.1304184, 0.7506301, -1.605716, 1, 0, 0, 1, 1,
-0.1289046, -0.121968, -0.8426836, 1, 0, 0, 1, 1,
-0.1285096, -0.4471324, -4.282636, 1, 0, 0, 1, 1,
-0.1269432, -1.27117, -1.818033, 1, 0, 0, 1, 1,
-0.1234523, 0.4406053, 0.5720028, 1, 0, 0, 1, 1,
-0.1208135, -0.09019002, -3.463295, 0, 0, 0, 1, 1,
-0.1205705, -1.161142, -3.303197, 0, 0, 0, 1, 1,
-0.1181612, -0.5100068, -3.673365, 0, 0, 0, 1, 1,
-0.1083538, -1.772931, -3.58374, 0, 0, 0, 1, 1,
-0.105935, -0.2102588, -3.070605, 0, 0, 0, 1, 1,
-0.1055192, -0.1059662, -4.25165, 0, 0, 0, 1, 1,
-0.1050245, 0.02138266, -1.116158, 0, 0, 0, 1, 1,
-0.104926, -0.5432439, -3.465231, 1, 1, 1, 1, 1,
-0.1046947, -0.7004604, -3.251517, 1, 1, 1, 1, 1,
-0.1040007, 1.958775, 1.269509, 1, 1, 1, 1, 1,
-0.1035407, -0.7555996, -2.990977, 1, 1, 1, 1, 1,
-0.1031577, -0.06874765, -2.995794, 1, 1, 1, 1, 1,
-0.1027886, -0.0600442, -3.128996, 1, 1, 1, 1, 1,
-0.1018164, -0.2565422, -1.274385, 1, 1, 1, 1, 1,
-0.09420554, 0.8804052, -0.8290146, 1, 1, 1, 1, 1,
-0.08922896, -0.9619814, -3.641895, 1, 1, 1, 1, 1,
-0.08354326, 0.2345802, -0.2191733, 1, 1, 1, 1, 1,
-0.08274643, 0.9736847, -0.05124271, 1, 1, 1, 1, 1,
-0.0795161, -0.6466126, -4.380672, 1, 1, 1, 1, 1,
-0.07848103, 0.6933938, 0.6885388, 1, 1, 1, 1, 1,
-0.07653978, 0.0301496, -1.123536, 1, 1, 1, 1, 1,
-0.07615438, -0.521321, -3.05635, 1, 1, 1, 1, 1,
-0.07542953, -1.214845, -4.041807, 0, 0, 1, 1, 1,
-0.07442206, -0.7407811, -2.181265, 1, 0, 0, 1, 1,
-0.07169061, -0.5318904, -2.288082, 1, 0, 0, 1, 1,
-0.06798562, 0.3583811, 1.692517, 1, 0, 0, 1, 1,
-0.06624268, 0.6572024, -0.7855359, 1, 0, 0, 1, 1,
-0.06419531, -0.6428745, -3.535268, 1, 0, 0, 1, 1,
-0.06328432, 0.9392042, 0.9897288, 0, 0, 0, 1, 1,
-0.05752962, -0.5984471, -2.751467, 0, 0, 0, 1, 1,
-0.0574379, -0.3421387, -3.308486, 0, 0, 0, 1, 1,
-0.05717928, -0.2604235, -3.567541, 0, 0, 0, 1, 1,
-0.05693291, 1.040465, 1.004807, 0, 0, 0, 1, 1,
-0.05602865, 0.3119135, -2.238554, 0, 0, 0, 1, 1,
-0.05492306, 0.9110174, -0.6783977, 0, 0, 0, 1, 1,
-0.05247783, -0.7188017, -2.442179, 1, 1, 1, 1, 1,
-0.0523879, 0.154897, -0.70789, 1, 1, 1, 1, 1,
-0.05006712, 0.9150413, 1.151787, 1, 1, 1, 1, 1,
-0.04973896, -1.502707, -2.905722, 1, 1, 1, 1, 1,
-0.04684561, -2.000777, -2.16355, 1, 1, 1, 1, 1,
-0.04438671, -0.343263, -3.039052, 1, 1, 1, 1, 1,
-0.04066669, -0.4966843, -3.784257, 1, 1, 1, 1, 1,
-0.03921125, -0.04203624, -2.560515, 1, 1, 1, 1, 1,
-0.03897312, 0.1109182, -1.11713, 1, 1, 1, 1, 1,
-0.03893435, 0.3725509, 0.2131667, 1, 1, 1, 1, 1,
-0.0373784, -2.218551, -3.992864, 1, 1, 1, 1, 1,
-0.03580781, 0.8803832, -0.5357595, 1, 1, 1, 1, 1,
-0.02745438, -0.4716902, -2.879995, 1, 1, 1, 1, 1,
-0.02419866, 0.1175921, 0.08617485, 1, 1, 1, 1, 1,
-0.02028429, -0.03117538, -2.349792, 1, 1, 1, 1, 1,
-0.01600295, 0.5966144, -1.65415, 0, 0, 1, 1, 1,
-0.01346233, -1.664915, -2.509664, 1, 0, 0, 1, 1,
-0.01003046, 1.165988, 1.445914, 1, 0, 0, 1, 1,
-0.00895878, -0.3138493, -1.892062, 1, 0, 0, 1, 1,
-0.006752017, 0.2106479, 1.030413, 1, 0, 0, 1, 1,
-0.005587302, 1.533968, -0.7761379, 1, 0, 0, 1, 1,
-0.00354962, -0.4716457, -2.907068, 0, 0, 0, 1, 1,
-0.003080521, -0.4531727, -2.166124, 0, 0, 0, 1, 1,
-0.0028551, -1.825858, -3.603239, 0, 0, 0, 1, 1,
0.003667363, 0.1555313, 1.132305, 0, 0, 0, 1, 1,
0.007396572, -2.038653, 3.319574, 0, 0, 0, 1, 1,
0.007889546, -0.7284435, 4.146765, 0, 0, 0, 1, 1,
0.008853936, -0.7345139, 5.266615, 0, 0, 0, 1, 1,
0.009799984, -1.549032, 3.556489, 1, 1, 1, 1, 1,
0.009887968, 1.722382, 0.07632987, 1, 1, 1, 1, 1,
0.01434106, 0.7695055, 0.1891045, 1, 1, 1, 1, 1,
0.01683647, -0.5833539, 5.435643, 1, 1, 1, 1, 1,
0.01763892, -0.002861555, 1.7997, 1, 1, 1, 1, 1,
0.01871057, 0.5863405, 0.2567068, 1, 1, 1, 1, 1,
0.01904443, 0.5388246, 0.5511866, 1, 1, 1, 1, 1,
0.01927361, -0.9825274, 3.746242, 1, 1, 1, 1, 1,
0.02129731, 0.293256, -0.6751935, 1, 1, 1, 1, 1,
0.02352151, -0.9745278, 2.372654, 1, 1, 1, 1, 1,
0.02700423, -0.01149898, 2.527952, 1, 1, 1, 1, 1,
0.03402378, 0.9218801, -0.889298, 1, 1, 1, 1, 1,
0.03519472, -0.8707317, 1.89894, 1, 1, 1, 1, 1,
0.03677598, -1.496032, 3.006698, 1, 1, 1, 1, 1,
0.04046956, 1.380637, -0.1298168, 1, 1, 1, 1, 1,
0.04774655, -0.6019195, 3.744869, 0, 0, 1, 1, 1,
0.0481206, -1.156692, 1.498968, 1, 0, 0, 1, 1,
0.04823338, -0.2481025, 1.079314, 1, 0, 0, 1, 1,
0.0498267, -0.8467671, 2.524218, 1, 0, 0, 1, 1,
0.05244193, -0.09377348, 2.491347, 1, 0, 0, 1, 1,
0.05412149, 0.1840113, 0.9128129, 1, 0, 0, 1, 1,
0.05506586, 0.8053098, 0.1638649, 0, 0, 0, 1, 1,
0.05846057, 1.326646, 0.9568488, 0, 0, 0, 1, 1,
0.05930015, 0.45485, -1.117701, 0, 0, 0, 1, 1,
0.05954634, -0.3922933, 3.280148, 0, 0, 0, 1, 1,
0.06020072, -1.295282, 3.275016, 0, 0, 0, 1, 1,
0.06091907, 1.847022, 1.664399, 0, 0, 0, 1, 1,
0.06203546, -0.2351872, 4.226233, 0, 0, 0, 1, 1,
0.0622851, 0.5931912, 1.205906, 1, 1, 1, 1, 1,
0.06292358, -0.1269825, 2.022416, 1, 1, 1, 1, 1,
0.06403451, 1.19633, -0.09720009, 1, 1, 1, 1, 1,
0.06877873, 0.440764, -1.088366, 1, 1, 1, 1, 1,
0.0688938, 0.5961605, -0.3018543, 1, 1, 1, 1, 1,
0.07070225, 0.4172377, -1.078757, 1, 1, 1, 1, 1,
0.07210341, -0.9575573, 3.315687, 1, 1, 1, 1, 1,
0.07216867, 0.7819701, -0.7977229, 1, 1, 1, 1, 1,
0.07506502, -0.3746558, 3.758768, 1, 1, 1, 1, 1,
0.07769004, 0.8612693, 1.059528, 1, 1, 1, 1, 1,
0.0777385, -1.676916, 2.542197, 1, 1, 1, 1, 1,
0.08916728, -1.088891, 2.378608, 1, 1, 1, 1, 1,
0.09410942, -0.8587732, 2.565208, 1, 1, 1, 1, 1,
0.09836975, -0.2342949, 3.124564, 1, 1, 1, 1, 1,
0.098737, 0.2824524, -0.3650526, 1, 1, 1, 1, 1,
0.09977136, 0.7164418, 0.9079884, 0, 0, 1, 1, 1,
0.1107491, -0.4480303, 2.005566, 1, 0, 0, 1, 1,
0.1115682, -0.4154842, 1.237551, 1, 0, 0, 1, 1,
0.1142327, -0.3754583, 3.557, 1, 0, 0, 1, 1,
0.1201479, 1.03838, 1.339896, 1, 0, 0, 1, 1,
0.1258087, -0.2499845, 3.429094, 1, 0, 0, 1, 1,
0.126209, -0.7350066, 5.243021, 0, 0, 0, 1, 1,
0.1274005, -1.305407, 2.652894, 0, 0, 0, 1, 1,
0.1301749, 1.717888, 0.6610177, 0, 0, 0, 1, 1,
0.1314127, -0.465656, 3.703648, 0, 0, 0, 1, 1,
0.1318486, 1.646314, -0.7969466, 0, 0, 0, 1, 1,
0.1356984, 0.1961357, 0.05557917, 0, 0, 0, 1, 1,
0.1359197, 1.120919, -1.967851, 0, 0, 0, 1, 1,
0.1367582, 0.8607141, 0.5341674, 1, 1, 1, 1, 1,
0.1390926, 1.290543, 1.273967, 1, 1, 1, 1, 1,
0.1405825, 0.03862478, 1.332847, 1, 1, 1, 1, 1,
0.1440428, -1.454217, 2.23701, 1, 1, 1, 1, 1,
0.1495987, 0.5872051, 0.4444967, 1, 1, 1, 1, 1,
0.1562873, -1.294448, 1.512443, 1, 1, 1, 1, 1,
0.1662811, 0.1628085, 1.282331, 1, 1, 1, 1, 1,
0.1669646, -0.7263223, 2.188157, 1, 1, 1, 1, 1,
0.1670384, -0.8170211, 3.238473, 1, 1, 1, 1, 1,
0.1673496, -0.6340392, 3.136952, 1, 1, 1, 1, 1,
0.170076, 1.694348, -1.491223, 1, 1, 1, 1, 1,
0.174216, -0.01189159, 3.115726, 1, 1, 1, 1, 1,
0.1770482, 2.732276, 1.38221, 1, 1, 1, 1, 1,
0.1838005, -0.7166553, 3.012882, 1, 1, 1, 1, 1,
0.1842045, -0.8258905, 3.348646, 1, 1, 1, 1, 1,
0.1910895, -3.027574, 5.148056, 0, 0, 1, 1, 1,
0.1913742, -1.092747, 2.531272, 1, 0, 0, 1, 1,
0.1932628, -0.7533517, 2.779287, 1, 0, 0, 1, 1,
0.1958352, -0.533846, 3.262931, 1, 0, 0, 1, 1,
0.1982196, -1.589415, 2.467478, 1, 0, 0, 1, 1,
0.2017669, 0.2772402, 0.8915724, 1, 0, 0, 1, 1,
0.2140013, 0.4250141, -1.173868, 0, 0, 0, 1, 1,
0.2163731, -0.9555358, 3.43059, 0, 0, 0, 1, 1,
0.2210581, -1.591895, 2.383405, 0, 0, 0, 1, 1,
0.222139, -0.4151529, 2.274353, 0, 0, 0, 1, 1,
0.2287255, -0.06614088, 0.4328347, 0, 0, 0, 1, 1,
0.2308889, 1.016108, -0.7493969, 0, 0, 0, 1, 1,
0.2352136, 0.3359448, -0.990752, 0, 0, 0, 1, 1,
0.2391535, -1.064844, 1.534487, 1, 1, 1, 1, 1,
0.2406849, -0.1525052, 0.5316246, 1, 1, 1, 1, 1,
0.2447229, -0.8026212, 2.703267, 1, 1, 1, 1, 1,
0.2493886, -1.873389, 2.289014, 1, 1, 1, 1, 1,
0.2496025, 1.598763, 1.941273, 1, 1, 1, 1, 1,
0.2497689, -0.9332932, 3.214972, 1, 1, 1, 1, 1,
0.2501259, -1.849036, 4.750321, 1, 1, 1, 1, 1,
0.2508121, 1.14776, 0.08871793, 1, 1, 1, 1, 1,
0.2543768, -0.5935937, 1.98616, 1, 1, 1, 1, 1,
0.258486, -0.6374842, 1.58496, 1, 1, 1, 1, 1,
0.2629701, 0.1574028, -0.7063178, 1, 1, 1, 1, 1,
0.2639857, -0.97844, 3.972988, 1, 1, 1, 1, 1,
0.2641466, -1.135137, 5.419512, 1, 1, 1, 1, 1,
0.2646956, 1.227754, -0.2369201, 1, 1, 1, 1, 1,
0.2650033, 1.578825, -0.5010632, 1, 1, 1, 1, 1,
0.2651998, -0.6511024, 1.191392, 0, 0, 1, 1, 1,
0.2661953, -0.5425677, 3.366389, 1, 0, 0, 1, 1,
0.2669329, 0.07758598, 0.7782373, 1, 0, 0, 1, 1,
0.2712319, -0.7443292, 4.066455, 1, 0, 0, 1, 1,
0.271301, -0.6362389, 3.816081, 1, 0, 0, 1, 1,
0.2724305, 2.505971, -0.4553389, 1, 0, 0, 1, 1,
0.2753956, 0.564606, 2.358407, 0, 0, 0, 1, 1,
0.2760938, -1.146205, 2.297183, 0, 0, 0, 1, 1,
0.27831, -2.925172, 2.790692, 0, 0, 0, 1, 1,
0.2800379, 0.4363693, -1.465122, 0, 0, 0, 1, 1,
0.282804, -0.01884861, 0.4473493, 0, 0, 0, 1, 1,
0.2833694, 1.173054, 1.421471, 0, 0, 0, 1, 1,
0.2861029, 0.5080654, -1.139855, 0, 0, 0, 1, 1,
0.2862068, 0.319295, 0.5353501, 1, 1, 1, 1, 1,
0.290409, -0.6678444, 3.75629, 1, 1, 1, 1, 1,
0.2957498, 0.419476, 0.7071149, 1, 1, 1, 1, 1,
0.2995722, 1.366018, 1.70161, 1, 1, 1, 1, 1,
0.3058214, -0.9799572, 1.835253, 1, 1, 1, 1, 1,
0.3069631, -0.8823745, 2.639006, 1, 1, 1, 1, 1,
0.3079209, -0.1787352, 2.076327, 1, 1, 1, 1, 1,
0.3098203, 0.8499354, -0.5191391, 1, 1, 1, 1, 1,
0.3135723, 0.9889277, 1.560365, 1, 1, 1, 1, 1,
0.3168531, 1.394393, 1.184587, 1, 1, 1, 1, 1,
0.3169539, -0.2416273, 1.625754, 1, 1, 1, 1, 1,
0.3179002, 0.3731543, 1.243147, 1, 1, 1, 1, 1,
0.3189576, -1.230888, 2.408316, 1, 1, 1, 1, 1,
0.3198109, 1.551836, 0.3166953, 1, 1, 1, 1, 1,
0.3211451, -0.9030564, 4.652419, 1, 1, 1, 1, 1,
0.3235538, -0.879823, 3.746418, 0, 0, 1, 1, 1,
0.3236279, -0.9814279, 3.343888, 1, 0, 0, 1, 1,
0.325274, 0.09223442, 3.816803, 1, 0, 0, 1, 1,
0.3312873, -0.1997704, 1.093807, 1, 0, 0, 1, 1,
0.331378, -0.7338434, 4.309884, 1, 0, 0, 1, 1,
0.3331459, 1.265816, -0.09817728, 1, 0, 0, 1, 1,
0.3336506, 0.4419322, 0.6305612, 0, 0, 0, 1, 1,
0.3343341, 1.092633, -0.6446433, 0, 0, 0, 1, 1,
0.334476, -1.134117, 2.72153, 0, 0, 0, 1, 1,
0.3351907, 0.2513777, 1.807012, 0, 0, 0, 1, 1,
0.3359576, -1.029118, 2.277404, 0, 0, 0, 1, 1,
0.3380697, 1.360871, 1.758671, 0, 0, 0, 1, 1,
0.3444798, -0.5194851, 1.668362, 0, 0, 0, 1, 1,
0.3489014, 1.251583, 0.9584689, 1, 1, 1, 1, 1,
0.3545216, 0.6817307, 2.466643, 1, 1, 1, 1, 1,
0.3559182, -1.421579, 4.374258, 1, 1, 1, 1, 1,
0.3582987, -1.124076, 4.923827, 1, 1, 1, 1, 1,
0.3617747, -0.4362275, 3.712004, 1, 1, 1, 1, 1,
0.3637258, -1.913924, 2.888311, 1, 1, 1, 1, 1,
0.3697838, 0.3672903, 1.968714, 1, 1, 1, 1, 1,
0.372837, -1.222605, 4.095748, 1, 1, 1, 1, 1,
0.3745191, 0.2397199, 0.2002461, 1, 1, 1, 1, 1,
0.3749084, 0.1301723, 0.9556079, 1, 1, 1, 1, 1,
0.3772609, -1.182024, 1.390503, 1, 1, 1, 1, 1,
0.3819506, 1.104638, 0.4998535, 1, 1, 1, 1, 1,
0.3871829, 0.2156008, 3.247095, 1, 1, 1, 1, 1,
0.390888, -0.6164773, 3.32082, 1, 1, 1, 1, 1,
0.3910132, 0.8183558, 1.830261, 1, 1, 1, 1, 1,
0.3943595, 0.9156998, 0.5126924, 0, 0, 1, 1, 1,
0.3981384, 1.782125, 0.5052961, 1, 0, 0, 1, 1,
0.4016898, 1.471804, 0.3814327, 1, 0, 0, 1, 1,
0.4023549, -0.6836934, 3.274433, 1, 0, 0, 1, 1,
0.4082045, -0.2253512, 1.827215, 1, 0, 0, 1, 1,
0.4102226, 0.884734, 0.3505784, 1, 0, 0, 1, 1,
0.410909, -1.805982, 4.199534, 0, 0, 0, 1, 1,
0.4172175, 0.8617147, -1.207054, 0, 0, 0, 1, 1,
0.4181136, -0.1326557, 3.66369, 0, 0, 0, 1, 1,
0.4216862, 0.3273575, 1.12103, 0, 0, 0, 1, 1,
0.428855, -0.2754913, 1.956589, 0, 0, 0, 1, 1,
0.4363146, -0.8344629, 3.803109, 0, 0, 0, 1, 1,
0.4433826, 0.006488807, 1.11141, 0, 0, 0, 1, 1,
0.4509777, -0.789399, 3.518182, 1, 1, 1, 1, 1,
0.4528714, -2.177014, 2.44633, 1, 1, 1, 1, 1,
0.4529094, 1.243648, 1.003833, 1, 1, 1, 1, 1,
0.4547672, -0.09080229, -0.2069843, 1, 1, 1, 1, 1,
0.4566225, -1.038203, 2.418805, 1, 1, 1, 1, 1,
0.4636869, 1.048949, 0.02433444, 1, 1, 1, 1, 1,
0.4672867, 1.059133, 0.8296611, 1, 1, 1, 1, 1,
0.4724681, -0.3355673, 1.149062, 1, 1, 1, 1, 1,
0.4736231, 0.2826325, 2.625139, 1, 1, 1, 1, 1,
0.4775821, -0.2188441, 2.686137, 1, 1, 1, 1, 1,
0.478838, 0.2852004, 0.4036324, 1, 1, 1, 1, 1,
0.4825373, 0.2627715, 2.435559, 1, 1, 1, 1, 1,
0.4835525, 0.4669518, 0.4420217, 1, 1, 1, 1, 1,
0.4865531, 1.965864, -0.9759855, 1, 1, 1, 1, 1,
0.49013, 1.364817, 0.369955, 1, 1, 1, 1, 1,
0.4933099, -0.1800712, 2.616934, 0, 0, 1, 1, 1,
0.4935914, 1.061636, 0.3546216, 1, 0, 0, 1, 1,
0.4951069, -0.4906576, 2.053949, 1, 0, 0, 1, 1,
0.4951663, -0.7117232, 3.059901, 1, 0, 0, 1, 1,
0.4963694, 0.6750587, -0.424251, 1, 0, 0, 1, 1,
0.4988135, 0.2617227, 2.22425, 1, 0, 0, 1, 1,
0.5029489, -1.709437, 2.764296, 0, 0, 0, 1, 1,
0.505308, 0.3138599, 0.3551602, 0, 0, 0, 1, 1,
0.5101959, -0.4703146, 3.13185, 0, 0, 0, 1, 1,
0.5132976, 0.5218682, 2.04846, 0, 0, 0, 1, 1,
0.5180118, 0.5615433, 1.102766, 0, 0, 0, 1, 1,
0.5195038, -0.7909511, 1.976913, 0, 0, 0, 1, 1,
0.5249294, -0.4563323, 1.990835, 0, 0, 0, 1, 1,
0.5275939, -0.2521394, 1.284213, 1, 1, 1, 1, 1,
0.5276933, 0.2228641, 1.312129, 1, 1, 1, 1, 1,
0.5300697, 0.7333214, 0.7508305, 1, 1, 1, 1, 1,
0.5316882, -0.5211551, 4.086791, 1, 1, 1, 1, 1,
0.5337984, -0.5611111, 0.9484602, 1, 1, 1, 1, 1,
0.5350149, -1.795928, 3.886878, 1, 1, 1, 1, 1,
0.5410612, 0.04139145, 1.89808, 1, 1, 1, 1, 1,
0.5559981, 1.128457, 1.649328, 1, 1, 1, 1, 1,
0.5622579, 0.138424, -0.6807256, 1, 1, 1, 1, 1,
0.5641584, 0.2696527, 0.007643434, 1, 1, 1, 1, 1,
0.5674303, -0.7386894, 1.974599, 1, 1, 1, 1, 1,
0.5679199, 1.121866, -1.527173, 1, 1, 1, 1, 1,
0.5770734, 1.007245, 0.2534576, 1, 1, 1, 1, 1,
0.5785231, -0.8270873, 2.918455, 1, 1, 1, 1, 1,
0.581341, -0.05322668, 1.300923, 1, 1, 1, 1, 1,
0.5827494, -0.6128763, 2.314562, 0, 0, 1, 1, 1,
0.5835041, -0.8044384, 2.381465, 1, 0, 0, 1, 1,
0.5840616, -1.422, 2.833791, 1, 0, 0, 1, 1,
0.5849913, -1.537589, 1.333813, 1, 0, 0, 1, 1,
0.5883885, -2.227142, 1.632794, 1, 0, 0, 1, 1,
0.589257, -0.8261801, -0.2003661, 1, 0, 0, 1, 1,
0.5966513, -0.7469467, 2.571555, 0, 0, 0, 1, 1,
0.5967168, 0.5506801, 1.859436, 0, 0, 0, 1, 1,
0.6023208, -1.175968, 2.372468, 0, 0, 0, 1, 1,
0.6033781, -0.4507885, 0.4847218, 0, 0, 0, 1, 1,
0.6091635, -0.4948544, 2.425512, 0, 0, 0, 1, 1,
0.6106985, -0.7803377, -0.05690416, 0, 0, 0, 1, 1,
0.6112966, 0.3290398, 0.5632613, 0, 0, 0, 1, 1,
0.6122961, 0.2822477, 1.065774, 1, 1, 1, 1, 1,
0.6202154, -0.8144882, 2.86985, 1, 1, 1, 1, 1,
0.624117, 1.671728, 0.1727768, 1, 1, 1, 1, 1,
0.6252064, -0.02595844, 1.270455, 1, 1, 1, 1, 1,
0.6273426, 0.006493992, 0.8334203, 1, 1, 1, 1, 1,
0.6324089, 0.7892672, 0.7566153, 1, 1, 1, 1, 1,
0.6324615, 1.942492, -1.513093, 1, 1, 1, 1, 1,
0.6341473, 0.8314062, -0.2189482, 1, 1, 1, 1, 1,
0.6371278, 1.40799, -1.218167, 1, 1, 1, 1, 1,
0.6409197, -0.4387244, 1.414305, 1, 1, 1, 1, 1,
0.6478254, -1.208296, 3.100472, 1, 1, 1, 1, 1,
0.6512146, 0.1505679, 0.9435356, 1, 1, 1, 1, 1,
0.6541215, -1.510291, 3.968725, 1, 1, 1, 1, 1,
0.6549024, 1.04064, 1.024515, 1, 1, 1, 1, 1,
0.6561998, 0.05385771, 3.027599, 1, 1, 1, 1, 1,
0.6572118, 1.010736, -0.5522828, 0, 0, 1, 1, 1,
0.6584843, -1.72805, 5.034116, 1, 0, 0, 1, 1,
0.6591482, 1.497671, 1.35306, 1, 0, 0, 1, 1,
0.6622931, 0.9590048, 0.7900863, 1, 0, 0, 1, 1,
0.6629739, -0.3625029, 3.153946, 1, 0, 0, 1, 1,
0.6646891, 0.7396016, 1.218362, 1, 0, 0, 1, 1,
0.6683214, -1.1089, 2.986922, 0, 0, 0, 1, 1,
0.6700664, 2.771313, 1.97125, 0, 0, 0, 1, 1,
0.6729956, -0.9463135, 1.598097, 0, 0, 0, 1, 1,
0.6758625, -0.1875812, 2.553254, 0, 0, 0, 1, 1,
0.6793345, 0.215344, 1.701293, 0, 0, 0, 1, 1,
0.6803005, 0.8607137, 1.894915, 0, 0, 0, 1, 1,
0.6821263, 0.4636605, 2.42165, 0, 0, 0, 1, 1,
0.6827492, -0.7343147, 5.219549, 1, 1, 1, 1, 1,
0.6900802, -1.364927, 2.838943, 1, 1, 1, 1, 1,
0.6906089, -0.3347433, 1.692343, 1, 1, 1, 1, 1,
0.6966131, -2.359661, 0.8434139, 1, 1, 1, 1, 1,
0.7003877, 1.414297, -0.1878479, 1, 1, 1, 1, 1,
0.7034945, 0.001326288, 3.270134, 1, 1, 1, 1, 1,
0.7065276, -1.111071, 1.842076, 1, 1, 1, 1, 1,
0.7078939, -0.738565, 2.70247, 1, 1, 1, 1, 1,
0.7135057, -0.2800593, -0.0990317, 1, 1, 1, 1, 1,
0.7139359, -0.3185444, 0.2258357, 1, 1, 1, 1, 1,
0.7189519, 0.3122373, 2.140294, 1, 1, 1, 1, 1,
0.7274995, 0.8136471, 1.718912, 1, 1, 1, 1, 1,
0.7281097, 0.7364966, -1.128618, 1, 1, 1, 1, 1,
0.7353711, 1.456346, 1.597471, 1, 1, 1, 1, 1,
0.7356664, -1.284112, 2.094039, 1, 1, 1, 1, 1,
0.7520342, 0.1909857, 0.5752346, 0, 0, 1, 1, 1,
0.7541146, -0.1185694, 0.2537862, 1, 0, 0, 1, 1,
0.7601781, 1.443726, -0.5801856, 1, 0, 0, 1, 1,
0.7603956, -0.7852718, 1.383513, 1, 0, 0, 1, 1,
0.7629853, 1.800126, -0.4392242, 1, 0, 0, 1, 1,
0.7673486, -0.07760306, 1.645626, 1, 0, 0, 1, 1,
0.7731393, -0.0256464, 0.994129, 0, 0, 0, 1, 1,
0.7796941, -0.4231383, 2.214965, 0, 0, 0, 1, 1,
0.7801953, 0.6089357, 2.091674, 0, 0, 0, 1, 1,
0.7802768, -0.738588, 2.893576, 0, 0, 0, 1, 1,
0.7854709, -1.64127, 3.47897, 0, 0, 0, 1, 1,
0.7875009, 1.147165, 1.937779, 0, 0, 0, 1, 1,
0.791575, -0.6151462, 1.216324, 0, 0, 0, 1, 1,
0.7919127, 0.2642407, 0.220178, 1, 1, 1, 1, 1,
0.7922529, -1.063606, 3.547328, 1, 1, 1, 1, 1,
0.7962903, -0.3986367, 1.497506, 1, 1, 1, 1, 1,
0.8071754, -0.814997, 1.504391, 1, 1, 1, 1, 1,
0.8079112, -1.003507, 1.137551, 1, 1, 1, 1, 1,
0.8182287, 0.5071872, 2.550713, 1, 1, 1, 1, 1,
0.821403, 1.224344, -0.154239, 1, 1, 1, 1, 1,
0.8215886, 0.3157243, 0.7157321, 1, 1, 1, 1, 1,
0.8223413, 1.405852, 1.280019, 1, 1, 1, 1, 1,
0.8244881, -0.8425463, 2.966216, 1, 1, 1, 1, 1,
0.8253979, 0.4271624, 2.630672, 1, 1, 1, 1, 1,
0.830199, -1.35236, 4.375623, 1, 1, 1, 1, 1,
0.8359605, 1.249341, 2.156857, 1, 1, 1, 1, 1,
0.8407204, -0.6106378, 1.564923, 1, 1, 1, 1, 1,
0.8560312, 0.1223395, 0.05353794, 1, 1, 1, 1, 1,
0.8638662, -0.8159024, 2.293757, 0, 0, 1, 1, 1,
0.8642508, 0.732203, 0.1755536, 1, 0, 0, 1, 1,
0.8669404, -1.190283, 1.080651, 1, 0, 0, 1, 1,
0.8705768, -0.7168934, 2.737819, 1, 0, 0, 1, 1,
0.871976, -0.7487779, 1.485592, 1, 0, 0, 1, 1,
0.8729544, 0.2688091, 1.789534, 1, 0, 0, 1, 1,
0.8746, -0.2248109, 1.907504, 0, 0, 0, 1, 1,
0.8758982, 2.598147, 1.07916, 0, 0, 0, 1, 1,
0.8795682, -0.042239, 2.689485, 0, 0, 0, 1, 1,
0.893434, -0.4737465, 1.941952, 0, 0, 0, 1, 1,
0.8954906, -0.3126215, 1.417109, 0, 0, 0, 1, 1,
0.8972828, -0.200597, 1.294939, 0, 0, 0, 1, 1,
0.8973085, -0.8828948, 1.133407, 0, 0, 0, 1, 1,
0.9024397, 0.3828088, 2.361311, 1, 1, 1, 1, 1,
0.9042709, 0.06975345, 0.7198433, 1, 1, 1, 1, 1,
0.908069, -1.3575, 3.411472, 1, 1, 1, 1, 1,
0.9280026, -1.797739, 3.626495, 1, 1, 1, 1, 1,
0.9351879, 0.5381088, 0.7398453, 1, 1, 1, 1, 1,
0.9374454, -0.8872892, 2.383816, 1, 1, 1, 1, 1,
0.9397628, -0.6967153, 2.786474, 1, 1, 1, 1, 1,
0.9398004, -0.3031753, 3.876016, 1, 1, 1, 1, 1,
0.9437648, 0.5159757, -0.564398, 1, 1, 1, 1, 1,
0.9458513, 0.3541799, 2.667636, 1, 1, 1, 1, 1,
0.9507405, -0.7302409, 2.091106, 1, 1, 1, 1, 1,
0.9702854, -1.702937, 2.844723, 1, 1, 1, 1, 1,
0.9734929, 0.5850038, 2.598467, 1, 1, 1, 1, 1,
0.9735979, 1.863324, 0.1172976, 1, 1, 1, 1, 1,
0.9744663, -0.6522653, 2.835779, 1, 1, 1, 1, 1,
0.9811898, 0.3331417, 0.8094101, 0, 0, 1, 1, 1,
1.005305, 0.6724181, 0.5295848, 1, 0, 0, 1, 1,
1.010635, -0.982836, 2.214838, 1, 0, 0, 1, 1,
1.010952, -0.1109027, 1.146285, 1, 0, 0, 1, 1,
1.016926, 1.670524, 0.9750187, 1, 0, 0, 1, 1,
1.018247, 1.178364, -1.586945, 1, 0, 0, 1, 1,
1.019366, -0.8857714, 1.371511, 0, 0, 0, 1, 1,
1.01974, -0.07353618, 1.464541, 0, 0, 0, 1, 1,
1.020959, -0.6536943, 1.612921, 0, 0, 0, 1, 1,
1.020986, 0.4035718, 1.270154, 0, 0, 0, 1, 1,
1.027463, 0.03467201, 1.299359, 0, 0, 0, 1, 1,
1.0305, -0.09138664, 0.9048051, 0, 0, 0, 1, 1,
1.036958, 0.2790082, 3.157071, 0, 0, 0, 1, 1,
1.03853, 1.835343, 0.2360465, 1, 1, 1, 1, 1,
1.042801, -1.280269, 2.041281, 1, 1, 1, 1, 1,
1.060157, 0.9330894, 1.188927, 1, 1, 1, 1, 1,
1.06843, 0.004809851, 0.787134, 1, 1, 1, 1, 1,
1.07252, 0.2128435, 0.4765677, 1, 1, 1, 1, 1,
1.073912, 0.7218144, 1.170288, 1, 1, 1, 1, 1,
1.079612, 2.36111, 1.729781, 1, 1, 1, 1, 1,
1.085291, 0.3359417, 1.170464, 1, 1, 1, 1, 1,
1.090517, -1.726212, 2.430626, 1, 1, 1, 1, 1,
1.092866, 0.01548651, 1.685789, 1, 1, 1, 1, 1,
1.093194, 0.01904112, 0.5262951, 1, 1, 1, 1, 1,
1.097233, 0.6801131, 0.4596086, 1, 1, 1, 1, 1,
1.112021, -1.590988, 3.509802, 1, 1, 1, 1, 1,
1.115652, -0.9714553, 2.56688, 1, 1, 1, 1, 1,
1.120796, 0.1553395, 2.261888, 1, 1, 1, 1, 1,
1.122721, 0.5401924, 0.9903199, 0, 0, 1, 1, 1,
1.127642, -0.2122628, 0.7333239, 1, 0, 0, 1, 1,
1.127731, 0.4779049, 0.6966885, 1, 0, 0, 1, 1,
1.129702, -0.4314613, 1.294792, 1, 0, 0, 1, 1,
1.138762, 0.5206318, -0.8980174, 1, 0, 0, 1, 1,
1.144533, 0.4100534, 2.38778, 1, 0, 0, 1, 1,
1.148647, -1.930106, 1.967264, 0, 0, 0, 1, 1,
1.15028, -1.121442, 2.353846, 0, 0, 0, 1, 1,
1.157757, -0.4528539, 2.767135, 0, 0, 0, 1, 1,
1.160347, 0.7208055, -0.634099, 0, 0, 0, 1, 1,
1.16115, 0.4117907, 1.507337, 0, 0, 0, 1, 1,
1.167229, -0.4463742, 0.6695026, 0, 0, 0, 1, 1,
1.176056, -0.5789469, 3.208, 0, 0, 0, 1, 1,
1.187256, 1.026597, 1.228499, 1, 1, 1, 1, 1,
1.209441, -1.930479, 2.332538, 1, 1, 1, 1, 1,
1.209891, 0.1682232, 1.758291, 1, 1, 1, 1, 1,
1.210471, -0.4761572, 3.757177, 1, 1, 1, 1, 1,
1.212787, 0.04140142, 1.985651, 1, 1, 1, 1, 1,
1.213977, 2.061965, 1.396561, 1, 1, 1, 1, 1,
1.216222, 1.068183, 0.09307349, 1, 1, 1, 1, 1,
1.220842, 0.1322284, 1.454457, 1, 1, 1, 1, 1,
1.228049, 0.7011728, 1.151975, 1, 1, 1, 1, 1,
1.237583, -0.2021672, 3.423065, 1, 1, 1, 1, 1,
1.241043, 0.6472652, 0.9587833, 1, 1, 1, 1, 1,
1.247274, 0.7764251, 1.329912, 1, 1, 1, 1, 1,
1.247756, 0.06638217, 1.569146, 1, 1, 1, 1, 1,
1.254418, -0.3809252, 2.778102, 1, 1, 1, 1, 1,
1.26182, -0.02076254, 2.131465, 1, 1, 1, 1, 1,
1.267198, 0.09365657, 1.039266, 0, 0, 1, 1, 1,
1.276873, -0.4769823, 2.727443, 1, 0, 0, 1, 1,
1.281757, 0.7705252, -0.06684502, 1, 0, 0, 1, 1,
1.293764, -0.6570125, 2.007685, 1, 0, 0, 1, 1,
1.301456, -1.580707, 2.857321, 1, 0, 0, 1, 1,
1.303486, 1.532333, 0.557018, 1, 0, 0, 1, 1,
1.309229, 0.3639217, 0.708333, 0, 0, 0, 1, 1,
1.310029, 1.90179, -0.7134658, 0, 0, 0, 1, 1,
1.317017, -0.2080337, 2.000002, 0, 0, 0, 1, 1,
1.329045, 0.7243822, 0.1366482, 0, 0, 0, 1, 1,
1.330347, 1.688366, 0.8910576, 0, 0, 0, 1, 1,
1.33616, 0.1869234, 0.2967332, 0, 0, 0, 1, 1,
1.342749, 1.128939, 2.735608, 0, 0, 0, 1, 1,
1.345319, -0.064737, 1.913769, 1, 1, 1, 1, 1,
1.363731, 0.7825083, -0.9866654, 1, 1, 1, 1, 1,
1.365444, -1.524989, 3.119617, 1, 1, 1, 1, 1,
1.367689, -0.6537482, 2.514552, 1, 1, 1, 1, 1,
1.371129, -0.1867618, 3.294989, 1, 1, 1, 1, 1,
1.376149, -0.9663418, 1.860793, 1, 1, 1, 1, 1,
1.387207, 0.04347989, 2.401073, 1, 1, 1, 1, 1,
1.390448, 1.582982, 1.414927, 1, 1, 1, 1, 1,
1.391047, 0.4099777, 1.754715, 1, 1, 1, 1, 1,
1.40338, -1.665555, 4.343189, 1, 1, 1, 1, 1,
1.406021, 0.149483, 1.396249, 1, 1, 1, 1, 1,
1.407725, -0.1654763, 1.983385, 1, 1, 1, 1, 1,
1.410589, -1.163002, 3.609741, 1, 1, 1, 1, 1,
1.419134, -0.8971483, 0.3476176, 1, 1, 1, 1, 1,
1.419899, 0.1883946, 2.397402, 1, 1, 1, 1, 1,
1.434927, 0.2092621, 1.630252, 0, 0, 1, 1, 1,
1.436462, 0.1180116, 0.5992867, 1, 0, 0, 1, 1,
1.442225, 1.602825, 1.016546, 1, 0, 0, 1, 1,
1.444745, 1.630038, 1.545713, 1, 0, 0, 1, 1,
1.45387, 1.234574, 0.5831217, 1, 0, 0, 1, 1,
1.46696, -0.4611043, 0.5266442, 1, 0, 0, 1, 1,
1.470691, -1.209239, 2.347329, 0, 0, 0, 1, 1,
1.473473, -1.184944, 1.690287, 0, 0, 0, 1, 1,
1.481357, 0.2357918, 1.74992, 0, 0, 0, 1, 1,
1.506865, 1.597411, 0.6004629, 0, 0, 0, 1, 1,
1.506921, -1.557806, -0.02207884, 0, 0, 0, 1, 1,
1.510343, 0.8471341, 0.8173164, 0, 0, 0, 1, 1,
1.529022, 0.03179288, 2.113179, 0, 0, 0, 1, 1,
1.529739, 0.05782056, 2.287018, 1, 1, 1, 1, 1,
1.544877, 0.5808037, 0.09519026, 1, 1, 1, 1, 1,
1.546369, -0.8260028, 2.099698, 1, 1, 1, 1, 1,
1.548227, -0.3978076, 0.6670598, 1, 1, 1, 1, 1,
1.558272, 0.4546422, -0.305104, 1, 1, 1, 1, 1,
1.562626, -1.845013, 2.560583, 1, 1, 1, 1, 1,
1.564198, -0.1095878, 1.095028, 1, 1, 1, 1, 1,
1.571193, -0.7117883, 3.059583, 1, 1, 1, 1, 1,
1.579824, -0.1217713, 2.103442, 1, 1, 1, 1, 1,
1.581383, 0.008381935, 1.549191, 1, 1, 1, 1, 1,
1.582369, -1.068716, 2.637138, 1, 1, 1, 1, 1,
1.585989, 0.6822473, 0.7608015, 1, 1, 1, 1, 1,
1.588258, -0.4169768, 2.847427, 1, 1, 1, 1, 1,
1.604685, -1.453959, 3.487814, 1, 1, 1, 1, 1,
1.616177, -1.069356, 2.860697, 1, 1, 1, 1, 1,
1.627733, -0.112023, 2.077222, 0, 0, 1, 1, 1,
1.640843, -1.244722, 4.027828, 1, 0, 0, 1, 1,
1.658528, 0.8350955, -0.1788925, 1, 0, 0, 1, 1,
1.667939, -0.9537447, 1.676037, 1, 0, 0, 1, 1,
1.679288, -2.872396, 0.5086719, 1, 0, 0, 1, 1,
1.68513, 0.2374264, 0.2011659, 1, 0, 0, 1, 1,
1.694185, -1.542747, 1.635, 0, 0, 0, 1, 1,
1.70444, 1.075599, 1.349699, 0, 0, 0, 1, 1,
1.706009, 0.07932092, 1.349653, 0, 0, 0, 1, 1,
1.718632, -0.1070407, 2.569565, 0, 0, 0, 1, 1,
1.738559, 1.313976, -1.349718, 0, 0, 0, 1, 1,
1.742569, 1.138862, 0.4539428, 0, 0, 0, 1, 1,
1.751731, -0.6849509, 1.388061, 0, 0, 0, 1, 1,
1.752095, -0.6862727, 2.975237, 1, 1, 1, 1, 1,
1.767523, -0.1597193, 1.431423, 1, 1, 1, 1, 1,
1.773683, -0.6201141, 3.919356, 1, 1, 1, 1, 1,
1.786093, -0.1552516, 1.915695, 1, 1, 1, 1, 1,
1.789903, 0.455258, 1.355243, 1, 1, 1, 1, 1,
1.791721, 0.5971578, 0.9562021, 1, 1, 1, 1, 1,
1.794563, 1.179712, 0.5992118, 1, 1, 1, 1, 1,
1.794708, -1.24495, 2.47822, 1, 1, 1, 1, 1,
1.843069, 0.1299674, 1.057879, 1, 1, 1, 1, 1,
1.861765, 0.7051395, 1.885082, 1, 1, 1, 1, 1,
1.861778, -1.158246, 2.673275, 1, 1, 1, 1, 1,
1.880372, -0.9712651, 0.7117167, 1, 1, 1, 1, 1,
1.885504, -0.002160202, 0.9456769, 1, 1, 1, 1, 1,
1.914874, 0.6141285, 1.69878, 1, 1, 1, 1, 1,
1.995943, -0.1630163, 1.942062, 1, 1, 1, 1, 1,
1.999807, -0.173667, 2.166308, 0, 0, 1, 1, 1,
2.098218, -0.9021634, 3.635755, 1, 0, 0, 1, 1,
2.099217, -0.8351524, 2.734851, 1, 0, 0, 1, 1,
2.145049, -0.8245122, 2.354059, 1, 0, 0, 1, 1,
2.163098, 0.4158379, 2.543963, 1, 0, 0, 1, 1,
2.18982, 0.3784495, -0.2522615, 1, 0, 0, 1, 1,
2.229534, -0.04369145, 1.901171, 0, 0, 0, 1, 1,
2.232851, -0.06278978, 1.89194, 0, 0, 0, 1, 1,
2.258512, 2.887982, 1.123434, 0, 0, 0, 1, 1,
2.295599, -3.326006, 2.085643, 0, 0, 0, 1, 1,
2.295693, 0.3609973, 1.328375, 0, 0, 0, 1, 1,
2.303399, -0.3707127, 1.389774, 0, 0, 0, 1, 1,
2.334778, -0.1387419, 1.632195, 0, 0, 0, 1, 1,
2.432263, -0.9023015, 1.163972, 1, 1, 1, 1, 1,
2.447155, -0.6703281, 1.781642, 1, 1, 1, 1, 1,
2.467528, -0.9701065, 1.040582, 1, 1, 1, 1, 1,
2.473584, -0.2273796, 0.7913457, 1, 1, 1, 1, 1,
2.476276, -0.03886441, 2.23169, 1, 1, 1, 1, 1,
2.589931, 0.2305684, 1.575978, 1, 1, 1, 1, 1,
2.624419, 0.7593352, 1.975331, 1, 1, 1, 1, 1
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
var radius = 9.765886;
var distance = 34.30226;
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
mvMatrix.translate( 0.5452604, 0.219012, 0.2401826 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.30226);
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
