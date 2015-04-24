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
-3.617232, -1.206073, -1.81818, 1, 0, 0, 1,
-3.00633, -1.064472, -0.9400215, 1, 0.007843138, 0, 1,
-2.678859, -0.1436398, -1.00363, 1, 0.01176471, 0, 1,
-2.641375, -0.7801729, -2.104444, 1, 0.01960784, 0, 1,
-2.575676, 0.06300902, -1.850341, 1, 0.02352941, 0, 1,
-2.46164, 0.5753554, -1.409539, 1, 0.03137255, 0, 1,
-2.401649, -0.1548875, -1.207345, 1, 0.03529412, 0, 1,
-2.357718, 1.292982, -0.3573118, 1, 0.04313726, 0, 1,
-2.341865, -0.4132758, -1.707497, 1, 0.04705882, 0, 1,
-2.330058, -1.476947, -1.492335, 1, 0.05490196, 0, 1,
-2.314404, -0.08365272, -0.9249571, 1, 0.05882353, 0, 1,
-2.308707, -1.549854, -2.974292, 1, 0.06666667, 0, 1,
-2.183721, -0.1253891, -2.62075, 1, 0.07058824, 0, 1,
-2.173293, -0.1290782, -1.804439, 1, 0.07843138, 0, 1,
-2.115921, -0.5464866, -1.362252, 1, 0.08235294, 0, 1,
-2.101503, 1.281874, -2.02438, 1, 0.09019608, 0, 1,
-2.099907, 1.547293, -0.8502983, 1, 0.09411765, 0, 1,
-2.090102, 0.2322333, -1.825352, 1, 0.1019608, 0, 1,
-2.079444, -1.652999, -2.296095, 1, 0.1098039, 0, 1,
-2.03442, 1.825963, -0.8546083, 1, 0.1137255, 0, 1,
-1.98803, -1.629966, -2.99305, 1, 0.1215686, 0, 1,
-1.977659, 1.265877, -3.10952, 1, 0.1254902, 0, 1,
-1.971031, -1.08627, -2.902672, 1, 0.1333333, 0, 1,
-1.909296, -0.1392776, -1.359373, 1, 0.1372549, 0, 1,
-1.893714, 1.624186, -2.200645, 1, 0.145098, 0, 1,
-1.86705, -0.3764273, -1.496998, 1, 0.1490196, 0, 1,
-1.817358, 2.451912, -0.6712751, 1, 0.1568628, 0, 1,
-1.811072, 1.385894, -1.791628, 1, 0.1607843, 0, 1,
-1.804116, -0.3641217, -2.390351, 1, 0.1686275, 0, 1,
-1.764527, 1.188185, -0.04293568, 1, 0.172549, 0, 1,
-1.748486, -0.002390699, -4.015663, 1, 0.1803922, 0, 1,
-1.736282, -0.1165439, -1.858774, 1, 0.1843137, 0, 1,
-1.725627, -0.3311214, -2.554107, 1, 0.1921569, 0, 1,
-1.706296, -0.7032102, -1.452703, 1, 0.1960784, 0, 1,
-1.703556, -0.6109068, -0.6059667, 1, 0.2039216, 0, 1,
-1.698166, 0.1499592, -3.106812, 1, 0.2117647, 0, 1,
-1.692143, 0.6682865, -0.3016571, 1, 0.2156863, 0, 1,
-1.685949, 0.04082365, -0.6123825, 1, 0.2235294, 0, 1,
-1.666212, 0.2326307, -1.987776, 1, 0.227451, 0, 1,
-1.666192, 1.247626, -2.694128, 1, 0.2352941, 0, 1,
-1.638429, 0.04314401, -1.781707, 1, 0.2392157, 0, 1,
-1.632477, 0.7513224, 1.58843, 1, 0.2470588, 0, 1,
-1.61965, -0.9404649, -2.592471, 1, 0.2509804, 0, 1,
-1.604293, 0.0583137, -1.062333, 1, 0.2588235, 0, 1,
-1.593027, 0.4643939, -0.1891617, 1, 0.2627451, 0, 1,
-1.577804, -0.8398541, -2.161931, 1, 0.2705882, 0, 1,
-1.576173, -0.7770949, -1.346692, 1, 0.2745098, 0, 1,
-1.572649, 0.1106315, -1.107979, 1, 0.282353, 0, 1,
-1.557946, -0.4724423, -2.084959, 1, 0.2862745, 0, 1,
-1.55749, 1.539053, -2.17273, 1, 0.2941177, 0, 1,
-1.548376, 1.678867, -0.0004649007, 1, 0.3019608, 0, 1,
-1.529127, -0.7220705, -1.949562, 1, 0.3058824, 0, 1,
-1.528479, 0.3268584, -0.6792234, 1, 0.3137255, 0, 1,
-1.523955, 0.4150287, -1.459711, 1, 0.3176471, 0, 1,
-1.508093, -0.6455438, -2.367412, 1, 0.3254902, 0, 1,
-1.50045, -0.3597022, -1.89327, 1, 0.3294118, 0, 1,
-1.496106, 1.380461, 0.0994225, 1, 0.3372549, 0, 1,
-1.492224, 0.6300442, -1.355535, 1, 0.3411765, 0, 1,
-1.485323, 1.718577, -0.7642621, 1, 0.3490196, 0, 1,
-1.482928, -1.457788, -0.09491086, 1, 0.3529412, 0, 1,
-1.48056, -0.8309785, -2.25675, 1, 0.3607843, 0, 1,
-1.47439, -0.3134112, -0.9885558, 1, 0.3647059, 0, 1,
-1.473897, -0.468713, -0.7405576, 1, 0.372549, 0, 1,
-1.470687, -1.439595, -3.01183, 1, 0.3764706, 0, 1,
-1.461258, -0.0438715, -2.823249, 1, 0.3843137, 0, 1,
-1.460243, 0.1676486, -3.277052, 1, 0.3882353, 0, 1,
-1.454959, 1.65817, 0.5272325, 1, 0.3960784, 0, 1,
-1.445346, 1.47235, -2.150136, 1, 0.4039216, 0, 1,
-1.443471, -1.02586, -1.203456, 1, 0.4078431, 0, 1,
-1.443285, 0.8304367, -0.3178945, 1, 0.4156863, 0, 1,
-1.439024, -0.1995017, -2.644083, 1, 0.4196078, 0, 1,
-1.438834, -0.7227367, -3.620929, 1, 0.427451, 0, 1,
-1.426509, -0.7789531, -0.02521954, 1, 0.4313726, 0, 1,
-1.410806, 0.278928, -1.567303, 1, 0.4392157, 0, 1,
-1.406626, -0.6874128, -4.018559, 1, 0.4431373, 0, 1,
-1.406242, -0.6983678, -1.812121, 1, 0.4509804, 0, 1,
-1.400597, 1.020526, 1.486743, 1, 0.454902, 0, 1,
-1.396927, 0.05778737, -2.913483, 1, 0.4627451, 0, 1,
-1.395171, 0.5513647, -2.885935, 1, 0.4666667, 0, 1,
-1.390699, 1.372546, -1.026963, 1, 0.4745098, 0, 1,
-1.389315, 1.371101, -1.636265, 1, 0.4784314, 0, 1,
-1.383385, -0.4747157, -3.624624, 1, 0.4862745, 0, 1,
-1.373387, -0.5819186, -1.935605, 1, 0.4901961, 0, 1,
-1.366045, 1.257003, -1.011938, 1, 0.4980392, 0, 1,
-1.362584, 0.8776812, -1.933084, 1, 0.5058824, 0, 1,
-1.360704, 1.097082, -0.5658695, 1, 0.509804, 0, 1,
-1.345756, -0.9002083, -0.268354, 1, 0.5176471, 0, 1,
-1.343879, 0.5071233, -0.1682231, 1, 0.5215687, 0, 1,
-1.336829, 2.550584, -0.4517973, 1, 0.5294118, 0, 1,
-1.330769, -0.6337686, -1.122491, 1, 0.5333334, 0, 1,
-1.329602, 0.2673278, -2.663344, 1, 0.5411765, 0, 1,
-1.320775, 0.09843954, -1.540587, 1, 0.5450981, 0, 1,
-1.319179, 0.03532945, -0.7245, 1, 0.5529412, 0, 1,
-1.317276, 0.05331207, -2.989338, 1, 0.5568628, 0, 1,
-1.307816, 0.2030097, 0.2608881, 1, 0.5647059, 0, 1,
-1.299614, -0.0167198, -0.2357215, 1, 0.5686275, 0, 1,
-1.291937, 0.02670901, -4.491334, 1, 0.5764706, 0, 1,
-1.284735, -1.232909, -2.039142, 1, 0.5803922, 0, 1,
-1.282813, 0.489704, -2.405551, 1, 0.5882353, 0, 1,
-1.276957, 0.1535139, -2.278174, 1, 0.5921569, 0, 1,
-1.273186, -0.4927287, -0.6919829, 1, 0.6, 0, 1,
-1.271219, -0.6374291, -2.275725, 1, 0.6078432, 0, 1,
-1.261416, -1.248129, -2.477197, 1, 0.6117647, 0, 1,
-1.256683, -0.07085273, -0.7386647, 1, 0.6196079, 0, 1,
-1.249353, 0.5204431, -1.644132, 1, 0.6235294, 0, 1,
-1.246914, -0.006935056, -1.680189, 1, 0.6313726, 0, 1,
-1.241999, -0.09593572, -0.04497378, 1, 0.6352941, 0, 1,
-1.219032, 1.242981, -1.047587, 1, 0.6431373, 0, 1,
-1.218856, -1.860393, -2.340687, 1, 0.6470588, 0, 1,
-1.212135, 0.1505896, -0.2037005, 1, 0.654902, 0, 1,
-1.197863, -1.555366, -2.532737, 1, 0.6588235, 0, 1,
-1.197198, -0.9286969, -1.419233, 1, 0.6666667, 0, 1,
-1.19585, -0.05451286, -1.086626, 1, 0.6705883, 0, 1,
-1.193807, -0.2870595, -0.7761461, 1, 0.6784314, 0, 1,
-1.190546, 1.101795, -0.9544235, 1, 0.682353, 0, 1,
-1.189738, 0.3483179, -3.015007, 1, 0.6901961, 0, 1,
-1.18469, 0.9796659, -1.036724, 1, 0.6941177, 0, 1,
-1.174748, -0.5257506, -3.848509, 1, 0.7019608, 0, 1,
-1.172904, 1.524047, -1.785704, 1, 0.7098039, 0, 1,
-1.172544, -2.190183, -2.980052, 1, 0.7137255, 0, 1,
-1.17168, -1.746516, -1.692797, 1, 0.7215686, 0, 1,
-1.170484, 0.6587119, -0.5401042, 1, 0.7254902, 0, 1,
-1.163732, 0.06838449, 0.04717223, 1, 0.7333333, 0, 1,
-1.1613, 1.231012, -1.236657, 1, 0.7372549, 0, 1,
-1.160344, -0.1579387, -3.169432, 1, 0.7450981, 0, 1,
-1.157648, 0.2380834, -2.523262, 1, 0.7490196, 0, 1,
-1.155578, 0.002207429, -0.3257722, 1, 0.7568628, 0, 1,
-1.148381, -0.1108466, -3.059848, 1, 0.7607843, 0, 1,
-1.148198, -0.03853355, 0.04161353, 1, 0.7686275, 0, 1,
-1.145535, -0.4888594, -2.052533, 1, 0.772549, 0, 1,
-1.14006, -0.07226166, -1.132597, 1, 0.7803922, 0, 1,
-1.140006, -0.04365284, -0.5062163, 1, 0.7843137, 0, 1,
-1.137912, 0.02365075, -1.629143, 1, 0.7921569, 0, 1,
-1.1369, -1.032705, -2.570812, 1, 0.7960784, 0, 1,
-1.135546, 1.932286, -0.6080055, 1, 0.8039216, 0, 1,
-1.123666, 0.2096963, -1.901827, 1, 0.8117647, 0, 1,
-1.121714, 1.338985, -0.5484374, 1, 0.8156863, 0, 1,
-1.117555, -0.08436859, -0.67578, 1, 0.8235294, 0, 1,
-1.116167, 0.1414037, -1.881526, 1, 0.827451, 0, 1,
-1.103903, -0.2524691, -1.849867, 1, 0.8352941, 0, 1,
-1.098808, 0.3050905, 0.4272004, 1, 0.8392157, 0, 1,
-1.098619, -0.7205266, -2.34981, 1, 0.8470588, 0, 1,
-1.093187, -0.1895009, -3.020588, 1, 0.8509804, 0, 1,
-1.090687, 0.416737, -0.534002, 1, 0.8588235, 0, 1,
-1.087994, -0.3917131, -2.174188, 1, 0.8627451, 0, 1,
-1.087337, 0.9281617, -1.191966, 1, 0.8705882, 0, 1,
-1.086047, -0.4774468, -1.770743, 1, 0.8745098, 0, 1,
-1.085692, 0.2438306, -0.3841152, 1, 0.8823529, 0, 1,
-1.078904, 1.466636, 0.5604957, 1, 0.8862745, 0, 1,
-1.071827, -0.4663156, -1.361644, 1, 0.8941177, 0, 1,
-1.062961, -1.878393, -3.284873, 1, 0.8980392, 0, 1,
-1.057573, -0.8925734, -2.026744, 1, 0.9058824, 0, 1,
-1.05579, 1.033486, -0.8859099, 1, 0.9137255, 0, 1,
-1.05493, 0.8019421, -1.840003, 1, 0.9176471, 0, 1,
-1.053985, -0.1523536, -3.144819, 1, 0.9254902, 0, 1,
-1.04838, -0.9228461, -3.786967, 1, 0.9294118, 0, 1,
-1.04157, -0.6038269, -1.539671, 1, 0.9372549, 0, 1,
-1.037645, -0.3525698, -0.5736202, 1, 0.9411765, 0, 1,
-1.035732, -1.348075, -0.4830309, 1, 0.9490196, 0, 1,
-1.035591, 0.4845978, -0.2187533, 1, 0.9529412, 0, 1,
-1.018212, -0.1926428, -1.768059, 1, 0.9607843, 0, 1,
-1.015818, -1.535531, -1.827354, 1, 0.9647059, 0, 1,
-1.014035, 0.2426066, 1.003169, 1, 0.972549, 0, 1,
-1.013816, -0.6197816, -3.716477, 1, 0.9764706, 0, 1,
-1.01255, -0.7619951, -3.340611, 1, 0.9843137, 0, 1,
-1.009646, 0.5173085, -0.9581497, 1, 0.9882353, 0, 1,
-1.007097, 1.382606, -1.167554, 1, 0.9960784, 0, 1,
-1.006966, 0.4234394, -0.7096487, 0.9960784, 1, 0, 1,
-0.9987682, 0.213861, -1.567862, 0.9921569, 1, 0, 1,
-0.9906596, -1.869702, -0.2620552, 0.9843137, 1, 0, 1,
-0.9858488, 0.3918904, -1.297686, 0.9803922, 1, 0, 1,
-0.9857066, 2.109745, 0.05550247, 0.972549, 1, 0, 1,
-0.9856563, 0.3762032, -1.404714, 0.9686275, 1, 0, 1,
-0.9826929, 0.8714901, 0.497804, 0.9607843, 1, 0, 1,
-0.9745781, 1.198142, -0.759683, 0.9568627, 1, 0, 1,
-0.9699611, 0.3945008, -3.233374, 0.9490196, 1, 0, 1,
-0.9687722, 1.503854, -1.593363, 0.945098, 1, 0, 1,
-0.9660589, 0.9790968, -0.04575529, 0.9372549, 1, 0, 1,
-0.9543251, 0.03011381, -2.634665, 0.9333333, 1, 0, 1,
-0.9478818, -1.754868, -2.686967, 0.9254902, 1, 0, 1,
-0.9421996, 0.1563225, -1.033528, 0.9215686, 1, 0, 1,
-0.9389433, -0.3273982, -3.620199, 0.9137255, 1, 0, 1,
-0.9346115, 0.7071007, -2.2957, 0.9098039, 1, 0, 1,
-0.9339119, 0.02786391, -1.275212, 0.9019608, 1, 0, 1,
-0.9333491, 1.395712, -1.699728, 0.8941177, 1, 0, 1,
-0.9260418, 0.1047032, -1.550211, 0.8901961, 1, 0, 1,
-0.9205295, 0.5125438, -2.673017, 0.8823529, 1, 0, 1,
-0.9192744, 0.3747521, -2.655669, 0.8784314, 1, 0, 1,
-0.9119531, 0.2549506, -1.178215, 0.8705882, 1, 0, 1,
-0.911698, 0.3512524, -0.41109, 0.8666667, 1, 0, 1,
-0.9067027, 0.6766248, -1.785702, 0.8588235, 1, 0, 1,
-0.8837672, 0.6732016, -0.4778221, 0.854902, 1, 0, 1,
-0.8824073, 0.5590459, -2.111117, 0.8470588, 1, 0, 1,
-0.8811647, 1.680377, -0.4212584, 0.8431373, 1, 0, 1,
-0.8800758, -0.8603374, -2.094309, 0.8352941, 1, 0, 1,
-0.8720592, 1.226466, 0.3070599, 0.8313726, 1, 0, 1,
-0.8719075, -1.531947, -3.176286, 0.8235294, 1, 0, 1,
-0.855185, -3.406099, -2.874117, 0.8196079, 1, 0, 1,
-0.8508606, 1.380335, 1.259868, 0.8117647, 1, 0, 1,
-0.8504429, -0.2733834, -1.584403, 0.8078431, 1, 0, 1,
-0.8452337, 0.8337804, -0.3099201, 0.8, 1, 0, 1,
-0.8411963, -0.9583033, -2.010898, 0.7921569, 1, 0, 1,
-0.8391132, -0.6868925, -1.721112, 0.7882353, 1, 0, 1,
-0.8386744, -0.7983228, -3.685394, 0.7803922, 1, 0, 1,
-0.8330236, -0.09910721, -1.830196, 0.7764706, 1, 0, 1,
-0.8313313, 0.6672381, -2.43568, 0.7686275, 1, 0, 1,
-0.8310746, -0.1015881, -2.026375, 0.7647059, 1, 0, 1,
-0.8303749, 0.3929811, -1.067856, 0.7568628, 1, 0, 1,
-0.8270335, -0.09730687, -0.2112733, 0.7529412, 1, 0, 1,
-0.8214314, 0.07285876, -2.909645, 0.7450981, 1, 0, 1,
-0.820148, 1.179687, 0.08075388, 0.7411765, 1, 0, 1,
-0.8149682, 0.77544, -0.3323337, 0.7333333, 1, 0, 1,
-0.8088192, -0.1510039, -1.219082, 0.7294118, 1, 0, 1,
-0.807221, -0.3722235, -2.218503, 0.7215686, 1, 0, 1,
-0.8015561, 0.6573266, -1.665378, 0.7176471, 1, 0, 1,
-0.7937829, -0.02806342, -1.023737, 0.7098039, 1, 0, 1,
-0.7931075, 0.4703618, -0.9024337, 0.7058824, 1, 0, 1,
-0.7929248, 1.353975, 0.2096604, 0.6980392, 1, 0, 1,
-0.7917935, -0.8255964, -3.964806, 0.6901961, 1, 0, 1,
-0.7890165, 1.105824, 0.3223813, 0.6862745, 1, 0, 1,
-0.7854119, -0.4267505, -2.278204, 0.6784314, 1, 0, 1,
-0.7819127, 0.09807834, -1.528304, 0.6745098, 1, 0, 1,
-0.7793078, -0.05899631, -0.8844047, 0.6666667, 1, 0, 1,
-0.7741011, -1.06154, -1.965533, 0.6627451, 1, 0, 1,
-0.7648492, 1.166737, -0.6375768, 0.654902, 1, 0, 1,
-0.7635739, -0.2365613, -1.50159, 0.6509804, 1, 0, 1,
-0.7630028, 1.333889, 0.1494981, 0.6431373, 1, 0, 1,
-0.7626621, 1.15373, 1.095868, 0.6392157, 1, 0, 1,
-0.7607442, -1.341418, -2.491466, 0.6313726, 1, 0, 1,
-0.73836, 0.4227861, -1.589159, 0.627451, 1, 0, 1,
-0.737966, 0.1659551, -0.6053097, 0.6196079, 1, 0, 1,
-0.7363489, -0.2621575, -3.781497, 0.6156863, 1, 0, 1,
-0.7265269, -0.3567211, -2.13924, 0.6078432, 1, 0, 1,
-0.7255316, 0.4488161, -2.057304, 0.6039216, 1, 0, 1,
-0.7254326, 0.6305138, -1.017745, 0.5960785, 1, 0, 1,
-0.7123612, 0.9784954, -0.3535309, 0.5882353, 1, 0, 1,
-0.7095906, -0.2969694, -1.389422, 0.5843138, 1, 0, 1,
-0.7046906, -0.5720643, -0.6416009, 0.5764706, 1, 0, 1,
-0.7016387, 0.09563962, -0.7095803, 0.572549, 1, 0, 1,
-0.6932394, 1.116007, -1.036624, 0.5647059, 1, 0, 1,
-0.6919191, 0.1858866, -0.4896562, 0.5607843, 1, 0, 1,
-0.6916363, 0.9302651, -0.5448403, 0.5529412, 1, 0, 1,
-0.6888475, 0.8117003, -0.630215, 0.5490196, 1, 0, 1,
-0.6852535, 1.486183, -0.8276377, 0.5411765, 1, 0, 1,
-0.6832719, 0.02609874, -0.8744812, 0.5372549, 1, 0, 1,
-0.6801541, 1.587982, 0.2602519, 0.5294118, 1, 0, 1,
-0.6795425, -1.098239, -4.204482, 0.5254902, 1, 0, 1,
-0.6793487, -0.3013401, -1.55423, 0.5176471, 1, 0, 1,
-0.6763598, 0.1798126, -3.022687, 0.5137255, 1, 0, 1,
-0.6735502, 1.549242, -1.497765, 0.5058824, 1, 0, 1,
-0.6734742, 0.7733141, -0.2380662, 0.5019608, 1, 0, 1,
-0.6657979, 0.2531989, -1.377609, 0.4941176, 1, 0, 1,
-0.6652268, -0.9805955, -2.261388, 0.4862745, 1, 0, 1,
-0.6640719, -0.5359775, -1.625548, 0.4823529, 1, 0, 1,
-0.6628445, -1.273654, -4.390231, 0.4745098, 1, 0, 1,
-0.653492, -0.1628372, -2.188814, 0.4705882, 1, 0, 1,
-0.6474327, 1.564049, 0.3473239, 0.4627451, 1, 0, 1,
-0.6456057, -0.6434729, -1.506688, 0.4588235, 1, 0, 1,
-0.6440768, 0.07346983, -0.08917012, 0.4509804, 1, 0, 1,
-0.6292751, 0.1618429, -0.3453159, 0.4470588, 1, 0, 1,
-0.6224716, 0.5105667, -0.90534, 0.4392157, 1, 0, 1,
-0.6163178, 0.6199121, -1.692274, 0.4352941, 1, 0, 1,
-0.6142414, -2.447038, -3.03317, 0.427451, 1, 0, 1,
-0.6131065, 0.1766509, 0.1612319, 0.4235294, 1, 0, 1,
-0.6108672, -0.3749496, -1.135313, 0.4156863, 1, 0, 1,
-0.6106786, -1.066726, -2.15626, 0.4117647, 1, 0, 1,
-0.6088763, -0.6066254, -3.689029, 0.4039216, 1, 0, 1,
-0.6077914, -1.34008, -0.9627894, 0.3960784, 1, 0, 1,
-0.6072121, -0.4992771, -2.29542, 0.3921569, 1, 0, 1,
-0.6068289, 0.7183306, -0.2868587, 0.3843137, 1, 0, 1,
-0.6050435, -0.6670163, -1.618205, 0.3803922, 1, 0, 1,
-0.5985034, -0.7316878, -2.682482, 0.372549, 1, 0, 1,
-0.5975092, -0.3065149, -0.6487371, 0.3686275, 1, 0, 1,
-0.5924385, 0.899394, -0.4216338, 0.3607843, 1, 0, 1,
-0.5923033, 0.2422307, -1.936879, 0.3568628, 1, 0, 1,
-0.5913084, -0.9548442, -2.102748, 0.3490196, 1, 0, 1,
-0.5911635, 1.914072, -1.438845, 0.345098, 1, 0, 1,
-0.5890853, 1.672925, -0.4833671, 0.3372549, 1, 0, 1,
-0.5877137, -0.149069, -1.956877, 0.3333333, 1, 0, 1,
-0.5862164, 0.8833995, -0.9950598, 0.3254902, 1, 0, 1,
-0.586199, -1.171605, -2.591163, 0.3215686, 1, 0, 1,
-0.5812452, 0.2563559, -1.275952, 0.3137255, 1, 0, 1,
-0.5756609, -0.9022266, -3.629401, 0.3098039, 1, 0, 1,
-0.5575969, 0.3694564, -1.665993, 0.3019608, 1, 0, 1,
-0.5489722, 0.8660309, 0.4895557, 0.2941177, 1, 0, 1,
-0.5414033, -0.4006036, -3.520686, 0.2901961, 1, 0, 1,
-0.5409274, 2.064494, -2.512898, 0.282353, 1, 0, 1,
-0.5407823, -1.910492, -2.523181, 0.2784314, 1, 0, 1,
-0.5384957, 1.387452, 0.07691474, 0.2705882, 1, 0, 1,
-0.5380018, 0.4690663, -0.2857814, 0.2666667, 1, 0, 1,
-0.5355264, 0.4028087, -1.527387, 0.2588235, 1, 0, 1,
-0.5252326, -0.8050607, -2.463979, 0.254902, 1, 0, 1,
-0.5233073, -0.7660877, -0.1622915, 0.2470588, 1, 0, 1,
-0.5190452, 1.264004, -1.76601, 0.2431373, 1, 0, 1,
-0.518411, 2.822558, 0.7749443, 0.2352941, 1, 0, 1,
-0.516475, 0.4744418, -1.600365, 0.2313726, 1, 0, 1,
-0.5140938, -1.873655, -1.592283, 0.2235294, 1, 0, 1,
-0.5127528, -0.7172641, -2.505305, 0.2196078, 1, 0, 1,
-0.5104094, 0.5574457, 2.213169, 0.2117647, 1, 0, 1,
-0.5087841, -1.536239, -1.674567, 0.2078431, 1, 0, 1,
-0.4902594, 0.5833247, 0.8392817, 0.2, 1, 0, 1,
-0.4876247, 0.9296649, -1.161788, 0.1921569, 1, 0, 1,
-0.4809959, -0.8210316, -4.458239, 0.1882353, 1, 0, 1,
-0.4807643, 1.063191, -1.071683, 0.1803922, 1, 0, 1,
-0.4791315, 0.006892397, -0.241706, 0.1764706, 1, 0, 1,
-0.4784304, 0.4303345, 0.03181822, 0.1686275, 1, 0, 1,
-0.4734163, 0.7439771, -0.373533, 0.1647059, 1, 0, 1,
-0.470143, -1.138099, -2.771713, 0.1568628, 1, 0, 1,
-0.4690241, 0.2850578, 0.1551874, 0.1529412, 1, 0, 1,
-0.4676552, 0.9968449, -0.1547349, 0.145098, 1, 0, 1,
-0.4599181, 1.44447, -0.9901032, 0.1411765, 1, 0, 1,
-0.4568972, 1.879592, -1.031865, 0.1333333, 1, 0, 1,
-0.4542445, 0.0170708, -2.223192, 0.1294118, 1, 0, 1,
-0.4508645, -0.3844271, -3.48024, 0.1215686, 1, 0, 1,
-0.4503761, 0.4863453, 0.2685362, 0.1176471, 1, 0, 1,
-0.4459826, -0.9042385, -2.502013, 0.1098039, 1, 0, 1,
-0.4440336, 1.053368, 0.1441304, 0.1058824, 1, 0, 1,
-0.4417537, 1.888661, -1.214055, 0.09803922, 1, 0, 1,
-0.4333355, 0.657663, -0.6219749, 0.09019608, 1, 0, 1,
-0.4298064, 0.5646729, -0.01779274, 0.08627451, 1, 0, 1,
-0.4271636, 0.3509182, -1.688362, 0.07843138, 1, 0, 1,
-0.4269635, -0.08919664, -0.6910077, 0.07450981, 1, 0, 1,
-0.4263193, -0.1669852, -3.005618, 0.06666667, 1, 0, 1,
-0.4254188, 1.840896, -1.125699, 0.0627451, 1, 0, 1,
-0.4239668, -1.185859, -3.484387, 0.05490196, 1, 0, 1,
-0.4218938, -0.6421464, -2.674287, 0.05098039, 1, 0, 1,
-0.4140319, -0.3591846, -4.376598, 0.04313726, 1, 0, 1,
-0.4095108, 1.035166, 0.6604027, 0.03921569, 1, 0, 1,
-0.4083897, -1.224147, -1.489453, 0.03137255, 1, 0, 1,
-0.4066203, -0.9453465, -2.484318, 0.02745098, 1, 0, 1,
-0.4053336, -0.1013155, -0.6573548, 0.01960784, 1, 0, 1,
-0.4022724, -1.731059, -2.573096, 0.01568628, 1, 0, 1,
-0.4004194, 0.7101564, -0.9064966, 0.007843138, 1, 0, 1,
-0.4001223, 0.4014066, -1.127826, 0.003921569, 1, 0, 1,
-0.3871394, -2.618903, -2.091706, 0, 1, 0.003921569, 1,
-0.3862819, -0.9740833, -1.465603, 0, 1, 0.01176471, 1,
-0.3812897, -1.342764, -1.164518, 0, 1, 0.01568628, 1,
-0.3781879, -0.5485083, -2.61922, 0, 1, 0.02352941, 1,
-0.3779539, 1.999584, -0.3783391, 0, 1, 0.02745098, 1,
-0.3761671, -0.1003921, -1.294568, 0, 1, 0.03529412, 1,
-0.3667403, 0.8605283, -1.586278, 0, 1, 0.03921569, 1,
-0.3656433, 0.8741468, -1.478959, 0, 1, 0.04705882, 1,
-0.3610188, -1.707698, -3.553415, 0, 1, 0.05098039, 1,
-0.3595794, 0.7780742, -1.467968, 0, 1, 0.05882353, 1,
-0.3527761, -0.02706143, -0.9391701, 0, 1, 0.0627451, 1,
-0.3519884, -0.2448542, -2.087976, 0, 1, 0.07058824, 1,
-0.3503117, 0.8390996, -0.4137229, 0, 1, 0.07450981, 1,
-0.3492602, 0.5520419, -0.2968003, 0, 1, 0.08235294, 1,
-0.3477937, -1.133817, -2.522236, 0, 1, 0.08627451, 1,
-0.3426296, -0.3554062, -2.195889, 0, 1, 0.09411765, 1,
-0.3374301, 0.3685986, -0.1564351, 0, 1, 0.1019608, 1,
-0.3358411, -1.103842, -2.781917, 0, 1, 0.1058824, 1,
-0.3331211, 1.245748, -0.8603027, 0, 1, 0.1137255, 1,
-0.3315301, 0.6237314, -1.112198, 0, 1, 0.1176471, 1,
-0.3246176, -1.290009, -1.898004, 0, 1, 0.1254902, 1,
-0.3227109, -0.007723929, -1.11931, 0, 1, 0.1294118, 1,
-0.3225588, 0.3775766, 1.825955, 0, 1, 0.1372549, 1,
-0.3225139, 0.6113328, -0.3105616, 0, 1, 0.1411765, 1,
-0.3192378, 0.6513742, -1.532051, 0, 1, 0.1490196, 1,
-0.3174466, -1.449195, -3.800325, 0, 1, 0.1529412, 1,
-0.3147066, -1.375754, -2.042632, 0, 1, 0.1607843, 1,
-0.3143623, -2.130058, -4.363592, 0, 1, 0.1647059, 1,
-0.3124816, -0.423766, -3.261913, 0, 1, 0.172549, 1,
-0.3124637, 1.086625, -0.7306691, 0, 1, 0.1764706, 1,
-0.3106945, 0.3150828, -1.391399, 0, 1, 0.1843137, 1,
-0.310085, 0.3469597, 0.5969611, 0, 1, 0.1882353, 1,
-0.3083593, -1.147883, -2.311433, 0, 1, 0.1960784, 1,
-0.3069918, -0.3990642, -2.474426, 0, 1, 0.2039216, 1,
-0.3060082, -0.1913614, -1.828429, 0, 1, 0.2078431, 1,
-0.2994989, 0.3248149, -0.08635787, 0, 1, 0.2156863, 1,
-0.2802302, -0.809218, -1.408628, 0, 1, 0.2196078, 1,
-0.2791983, 1.412584, 0.2833305, 0, 1, 0.227451, 1,
-0.2773167, -0.315512, -2.455496, 0, 1, 0.2313726, 1,
-0.2768899, -1.460984, -4.88343, 0, 1, 0.2392157, 1,
-0.2726043, -2.340055, -2.622497, 0, 1, 0.2431373, 1,
-0.2704371, 0.5357367, -0.2507262, 0, 1, 0.2509804, 1,
-0.2570685, -1.168376, -1.410988, 0, 1, 0.254902, 1,
-0.2507093, 1.686204, -0.09825627, 0, 1, 0.2627451, 1,
-0.2452985, -0.1013216, -1.435353, 0, 1, 0.2666667, 1,
-0.2422877, -0.1501903, -2.678373, 0, 1, 0.2745098, 1,
-0.2400259, 0.5126432, -0.6753534, 0, 1, 0.2784314, 1,
-0.2393804, 0.1112341, -1.569692, 0, 1, 0.2862745, 1,
-0.2378045, -1.091845, -3.508944, 0, 1, 0.2901961, 1,
-0.2370494, 0.9597691, -0.2767033, 0, 1, 0.2980392, 1,
-0.2304359, 1.272835, -0.1296045, 0, 1, 0.3058824, 1,
-0.2293062, 0.1849895, -1.717477, 0, 1, 0.3098039, 1,
-0.2291854, -0.2642618, -0.7304479, 0, 1, 0.3176471, 1,
-0.2281346, 0.856765, 0.9998906, 0, 1, 0.3215686, 1,
-0.2185692, 0.04675532, -0.5809625, 0, 1, 0.3294118, 1,
-0.2169388, 1.515104, 2.017045, 0, 1, 0.3333333, 1,
-0.2156846, 0.5685368, 0.9467677, 0, 1, 0.3411765, 1,
-0.2147456, -1.220775, -3.960554, 0, 1, 0.345098, 1,
-0.214143, 0.2092799, -1.887909, 0, 1, 0.3529412, 1,
-0.2089678, -0.4979871, -0.7467437, 0, 1, 0.3568628, 1,
-0.2032796, 0.349713, -0.02352395, 0, 1, 0.3647059, 1,
-0.2018192, -0.1028079, -1.233992, 0, 1, 0.3686275, 1,
-0.1917857, -0.04911428, -1.733004, 0, 1, 0.3764706, 1,
-0.1893248, -0.7677832, -2.267776, 0, 1, 0.3803922, 1,
-0.1855803, 0.9604462, -0.5775575, 0, 1, 0.3882353, 1,
-0.1853284, 0.6009484, 0.5139227, 0, 1, 0.3921569, 1,
-0.1790441, 1.556139, 0.9546996, 0, 1, 0.4, 1,
-0.173555, -0.5211816, -2.686676, 0, 1, 0.4078431, 1,
-0.1724512, 0.09782422, -1.55311, 0, 1, 0.4117647, 1,
-0.1713234, 1.681499, -1.681326, 0, 1, 0.4196078, 1,
-0.1702105, 0.7299629, 0.1242996, 0, 1, 0.4235294, 1,
-0.1697067, -0.4409239, -3.029552, 0, 1, 0.4313726, 1,
-0.1650437, -0.7749093, -2.024452, 0, 1, 0.4352941, 1,
-0.1625715, -0.1906227, -2.331877, 0, 1, 0.4431373, 1,
-0.1599245, 1.048421, -1.435073, 0, 1, 0.4470588, 1,
-0.1590016, 1.365038, 1.400826, 0, 1, 0.454902, 1,
-0.1565305, -1.282322, -1.4969, 0, 1, 0.4588235, 1,
-0.1560428, -0.4248275, -3.532623, 0, 1, 0.4666667, 1,
-0.153241, 0.5485185, -1.31709, 0, 1, 0.4705882, 1,
-0.1486805, -1.22017, -2.189482, 0, 1, 0.4784314, 1,
-0.1486033, 0.001905177, -2.25454, 0, 1, 0.4823529, 1,
-0.1356116, -0.2672239, -4.539563, 0, 1, 0.4901961, 1,
-0.1330482, 3.409044, 0.4789672, 0, 1, 0.4941176, 1,
-0.1288435, -1.68961, -2.371498, 0, 1, 0.5019608, 1,
-0.1286176, -0.7497746, -4.756869, 0, 1, 0.509804, 1,
-0.1263534, 0.4603496, -0.5092649, 0, 1, 0.5137255, 1,
-0.1254766, -0.04873138, -2.261659, 0, 1, 0.5215687, 1,
-0.1219447, -1.405894, -1.714477, 0, 1, 0.5254902, 1,
-0.1218413, -0.2428809, -2.924277, 0, 1, 0.5333334, 1,
-0.1207913, -1.503142, -2.945776, 0, 1, 0.5372549, 1,
-0.1170965, 1.894746, -0.4109066, 0, 1, 0.5450981, 1,
-0.1139331, -1.330452, -4.86455, 0, 1, 0.5490196, 1,
-0.1124785, 0.07850599, -0.4361142, 0, 1, 0.5568628, 1,
-0.1083351, -1.550107, -2.19367, 0, 1, 0.5607843, 1,
-0.1070753, -1.506865, -4.369392, 0, 1, 0.5686275, 1,
-0.1016789, 0.612628, -0.276837, 0, 1, 0.572549, 1,
-0.0985575, 0.5885417, -0.4839694, 0, 1, 0.5803922, 1,
-0.09765685, 0.3866731, 0.2058418, 0, 1, 0.5843138, 1,
-0.09538103, 0.2103162, 0.2338251, 0, 1, 0.5921569, 1,
-0.09240758, 2.042599, -0.3267863, 0, 1, 0.5960785, 1,
-0.09237392, -0.333213, -1.928454, 0, 1, 0.6039216, 1,
-0.09018595, -0.6290373, -3.990224, 0, 1, 0.6117647, 1,
-0.08530004, -0.4958452, -2.484047, 0, 1, 0.6156863, 1,
-0.08250446, 0.3553854, 0.03722223, 0, 1, 0.6235294, 1,
-0.07754482, 0.1771595, -0.1657053, 0, 1, 0.627451, 1,
-0.07624883, -0.3773954, -3.041637, 0, 1, 0.6352941, 1,
-0.07086854, -0.2884445, -3.173885, 0, 1, 0.6392157, 1,
-0.0686681, -0.406895, -3.047898, 0, 1, 0.6470588, 1,
-0.06532585, -1.186927, -2.518814, 0, 1, 0.6509804, 1,
-0.06379349, 0.1440874, 0.3413292, 0, 1, 0.6588235, 1,
-0.05795238, -1.082823, -5.173052, 0, 1, 0.6627451, 1,
-0.05646978, -2.035714, -1.805214, 0, 1, 0.6705883, 1,
-0.05543803, -0.898762, -2.237699, 0, 1, 0.6745098, 1,
-0.05434076, -0.49523, -2.920365, 0, 1, 0.682353, 1,
-0.05146539, 0.436593, -0.3199036, 0, 1, 0.6862745, 1,
-0.04618011, 0.7711144, 0.278531, 0, 1, 0.6941177, 1,
-0.04128028, 0.8596391, -1.00953, 0, 1, 0.7019608, 1,
-0.04103972, 0.3453582, -0.2183269, 0, 1, 0.7058824, 1,
-0.03622222, -0.007898394, -0.2268408, 0, 1, 0.7137255, 1,
-0.0354629, 0.2286794, -1.856271, 0, 1, 0.7176471, 1,
-0.0342771, 0.5461495, 0.3869218, 0, 1, 0.7254902, 1,
-0.03257986, -2.655932, -4.715796, 0, 1, 0.7294118, 1,
-0.02984431, -0.4531268, -1.1741, 0, 1, 0.7372549, 1,
-0.02520289, 1.255667, -2.507338, 0, 1, 0.7411765, 1,
-0.02329321, 0.6532511, -0.5745038, 0, 1, 0.7490196, 1,
-0.02076389, 0.493356, -1.181871, 0, 1, 0.7529412, 1,
-0.01827286, 0.850188, -0.03360217, 0, 1, 0.7607843, 1,
-0.01723956, -0.2105968, -1.88245, 0, 1, 0.7647059, 1,
-0.01585758, -0.651401, -2.427471, 0, 1, 0.772549, 1,
-0.009009585, 0.316385, -1.377848, 0, 1, 0.7764706, 1,
-0.006623213, 0.9323199, 0.8492253, 0, 1, 0.7843137, 1,
-0.006379106, -0.7694671, -2.457732, 0, 1, 0.7882353, 1,
-0.006035551, 1.009525, -1.517084, 0, 1, 0.7960784, 1,
0.001021771, 0.8185301, 1.89103, 0, 1, 0.8039216, 1,
0.00500549, -1.163176, 3.014576, 0, 1, 0.8078431, 1,
0.007285064, 1.590674, -1.314098, 0, 1, 0.8156863, 1,
0.00929419, 1.256914, -0.4135022, 0, 1, 0.8196079, 1,
0.01526916, -1.323638, 0.5397803, 0, 1, 0.827451, 1,
0.01557954, 2.540559, -0.9206473, 0, 1, 0.8313726, 1,
0.01665163, -0.3980014, 3.385638, 0, 1, 0.8392157, 1,
0.01932634, -3.265708, 2.647417, 0, 1, 0.8431373, 1,
0.02431197, -2.641461, 3.080404, 0, 1, 0.8509804, 1,
0.02846894, -1.007964, 4.029487, 0, 1, 0.854902, 1,
0.02921654, -0.158712, 2.276023, 0, 1, 0.8627451, 1,
0.03390241, -0.1350839, 1.524552, 0, 1, 0.8666667, 1,
0.03804341, -1.890294, 3.230364, 0, 1, 0.8745098, 1,
0.0417558, 0.171725, 0.1466928, 0, 1, 0.8784314, 1,
0.04803799, 1.061471, -0.7152723, 0, 1, 0.8862745, 1,
0.05050527, 0.9231189, 0.4339491, 0, 1, 0.8901961, 1,
0.05066827, 0.589821, -0.7876298, 0, 1, 0.8980392, 1,
0.05117983, 1.713989, -1.823449, 0, 1, 0.9058824, 1,
0.05271586, 0.09852611, 0.129749, 0, 1, 0.9098039, 1,
0.05279614, -0.666118, 4.684272, 0, 1, 0.9176471, 1,
0.05725378, 0.3423803, 0.5529041, 0, 1, 0.9215686, 1,
0.05866209, -0.3630483, 4.052987, 0, 1, 0.9294118, 1,
0.05974359, -0.525602, 3.129358, 0, 1, 0.9333333, 1,
0.06785167, 2.217923, -0.09023421, 0, 1, 0.9411765, 1,
0.06833774, 1.371322, 0.5209131, 0, 1, 0.945098, 1,
0.07210674, 1.25412, -1.077433, 0, 1, 0.9529412, 1,
0.0738169, 0.6165034, 1.380847, 0, 1, 0.9568627, 1,
0.07462327, -0.3775829, 2.366691, 0, 1, 0.9647059, 1,
0.07837077, 0.5595757, 0.7012635, 0, 1, 0.9686275, 1,
0.08126134, 1.289722, 0.2207911, 0, 1, 0.9764706, 1,
0.08358029, -1.795131, 3.541224, 0, 1, 0.9803922, 1,
0.09756143, 0.6165709, 1.148468, 0, 1, 0.9882353, 1,
0.1016838, -0.1441613, 2.347525, 0, 1, 0.9921569, 1,
0.1059684, -0.1406284, 1.546196, 0, 1, 1, 1,
0.1059937, -0.4009314, 2.300311, 0, 0.9921569, 1, 1,
0.1068176, -0.5548701, 2.501843, 0, 0.9882353, 1, 1,
0.1173143, -0.1126273, 3.104243, 0, 0.9803922, 1, 1,
0.1174682, -0.1252263, 2.036427, 0, 0.9764706, 1, 1,
0.1198022, -1.185246, 2.370302, 0, 0.9686275, 1, 1,
0.1217599, -1.302176, 1.352031, 0, 0.9647059, 1, 1,
0.1243962, -0.5021342, 3.13431, 0, 0.9568627, 1, 1,
0.1299738, -0.2426405, 1.711066, 0, 0.9529412, 1, 1,
0.1310932, -0.6421672, 3.068911, 0, 0.945098, 1, 1,
0.1331599, -0.0531412, 2.204238, 0, 0.9411765, 1, 1,
0.1343548, -1.272909, 1.662151, 0, 0.9333333, 1, 1,
0.1344118, -0.611267, 3.110961, 0, 0.9294118, 1, 1,
0.1350714, 0.2981389, 0.5256592, 0, 0.9215686, 1, 1,
0.1358019, 0.5706275, 0.6111039, 0, 0.9176471, 1, 1,
0.1364729, -0.948256, 4.114388, 0, 0.9098039, 1, 1,
0.1423965, -0.6648709, 4.375863, 0, 0.9058824, 1, 1,
0.1427643, -1.258002, 4.830382, 0, 0.8980392, 1, 1,
0.146301, 2.138965, -0.1622164, 0, 0.8901961, 1, 1,
0.1503884, -0.946461, 5.414301, 0, 0.8862745, 1, 1,
0.1545932, 0.4610033, -0.3777671, 0, 0.8784314, 1, 1,
0.1559934, 0.2623982, 0.8538177, 0, 0.8745098, 1, 1,
0.156887, -1.503655, 3.038065, 0, 0.8666667, 1, 1,
0.162217, 0.8926595, -0.1639378, 0, 0.8627451, 1, 1,
0.1742367, 0.7050625, -0.693395, 0, 0.854902, 1, 1,
0.1753484, 0.6299668, 0.2718662, 0, 0.8509804, 1, 1,
0.1813688, 1.969258, 0.5787564, 0, 0.8431373, 1, 1,
0.1912451, -0.1340319, 4.006326, 0, 0.8392157, 1, 1,
0.1916499, -1.324728, 3.384307, 0, 0.8313726, 1, 1,
0.1939024, 1.256008, 0.0965635, 0, 0.827451, 1, 1,
0.1951341, 0.7192522, 0.3267497, 0, 0.8196079, 1, 1,
0.1956442, 0.4201925, 0.2622401, 0, 0.8156863, 1, 1,
0.1970177, -1.15131, 4.334068, 0, 0.8078431, 1, 1,
0.1982859, 1.90547, -0.4621377, 0, 0.8039216, 1, 1,
0.2019854, -1.054005, 2.65742, 0, 0.7960784, 1, 1,
0.2048581, -0.6081285, 2.43559, 0, 0.7882353, 1, 1,
0.208267, -0.6470346, 4.064922, 0, 0.7843137, 1, 1,
0.2093699, -1.217811, 3.441713, 0, 0.7764706, 1, 1,
0.2161678, -0.3287934, 1.907416, 0, 0.772549, 1, 1,
0.216637, -0.09222627, 2.03693, 0, 0.7647059, 1, 1,
0.2187607, -1.711691, 2.861564, 0, 0.7607843, 1, 1,
0.2220555, 0.7846938, 2.650122, 0, 0.7529412, 1, 1,
0.2222954, 0.3312613, -0.2429613, 0, 0.7490196, 1, 1,
0.2226709, 1.226895, -0.406446, 0, 0.7411765, 1, 1,
0.2260452, 0.721427, 0.7212925, 0, 0.7372549, 1, 1,
0.2311599, 0.01620952, 3.121058, 0, 0.7294118, 1, 1,
0.2339106, 0.5654024, -2.503795, 0, 0.7254902, 1, 1,
0.2353927, 0.5866899, 0.770561, 0, 0.7176471, 1, 1,
0.23545, -1.165814, 3.04129, 0, 0.7137255, 1, 1,
0.2400979, 0.08547131, 1.844694, 0, 0.7058824, 1, 1,
0.2406349, 0.09440943, 1.232632, 0, 0.6980392, 1, 1,
0.2422058, 0.5770739, 1.252536, 0, 0.6941177, 1, 1,
0.2436271, -0.2817627, 3.21526, 0, 0.6862745, 1, 1,
0.2440938, -0.9621282, 4.670413, 0, 0.682353, 1, 1,
0.2442145, 0.8879624, -1.048747, 0, 0.6745098, 1, 1,
0.2450013, 0.1397514, 1.380806, 0, 0.6705883, 1, 1,
0.2489238, -0.7996389, 1.882002, 0, 0.6627451, 1, 1,
0.2495662, -0.472514, 2.928727, 0, 0.6588235, 1, 1,
0.2501393, 1.640565, -0.4336239, 0, 0.6509804, 1, 1,
0.2510457, -1.868972, 3.34095, 0, 0.6470588, 1, 1,
0.2515952, -0.4018178, 2.339741, 0, 0.6392157, 1, 1,
0.2536613, 1.187362, -1.826462, 0, 0.6352941, 1, 1,
0.2587492, 1.169001, -0.01310641, 0, 0.627451, 1, 1,
0.2651977, -1.536795, 2.403634, 0, 0.6235294, 1, 1,
0.26711, 1.433558, 0.4614988, 0, 0.6156863, 1, 1,
0.2674239, -0.8100212, 3.885216, 0, 0.6117647, 1, 1,
0.2694312, 0.1758035, 1.659292, 0, 0.6039216, 1, 1,
0.2723918, 2.058517, -0.3314845, 0, 0.5960785, 1, 1,
0.2755617, -1.563962, 2.284971, 0, 0.5921569, 1, 1,
0.2758994, 0.1001713, 2.102992, 0, 0.5843138, 1, 1,
0.2767511, 0.8670554, -0.9838485, 0, 0.5803922, 1, 1,
0.2795917, 0.2050054, -1.13319, 0, 0.572549, 1, 1,
0.2799239, 1.337461, 0.7025897, 0, 0.5686275, 1, 1,
0.2808821, 1.99323, 0.8118751, 0, 0.5607843, 1, 1,
0.2813925, 0.6801618, -0.7595811, 0, 0.5568628, 1, 1,
0.2819099, 0.6184625, -0.8380507, 0, 0.5490196, 1, 1,
0.2838115, 1.529032, -0.08179633, 0, 0.5450981, 1, 1,
0.287309, 0.1985983, 1.581231, 0, 0.5372549, 1, 1,
0.2941621, -0.1700985, 2.333395, 0, 0.5333334, 1, 1,
0.2954133, -0.670014, 3.214252, 0, 0.5254902, 1, 1,
0.2967482, -0.6138582, 3.486253, 0, 0.5215687, 1, 1,
0.2976811, 0.424221, 1.996214, 0, 0.5137255, 1, 1,
0.3008254, -0.4797879, 2.053766, 0, 0.509804, 1, 1,
0.3044456, -0.3989469, 3.652399, 0, 0.5019608, 1, 1,
0.3065255, -0.1575472, 0.9530385, 0, 0.4941176, 1, 1,
0.3084427, 0.4659844, 0.1264733, 0, 0.4901961, 1, 1,
0.3085912, 0.3705424, 1.607913, 0, 0.4823529, 1, 1,
0.3112204, 0.3848552, 1.802176, 0, 0.4784314, 1, 1,
0.3115209, -0.1017716, 2.039694, 0, 0.4705882, 1, 1,
0.312893, 1.475991, -0.01501306, 0, 0.4666667, 1, 1,
0.3190805, -0.3463914, 2.848615, 0, 0.4588235, 1, 1,
0.3190994, 0.8466411, 0.9358872, 0, 0.454902, 1, 1,
0.3206969, -0.9850665, 3.104442, 0, 0.4470588, 1, 1,
0.3243364, -1.002784, 3.165341, 0, 0.4431373, 1, 1,
0.324823, -0.4615191, 2.748276, 0, 0.4352941, 1, 1,
0.3255721, -0.9576885, 4.574094, 0, 0.4313726, 1, 1,
0.3300021, 1.145535, 0.4684511, 0, 0.4235294, 1, 1,
0.3300156, -0.2636744, 2.04016, 0, 0.4196078, 1, 1,
0.3311329, 0.3789178, 0.2757634, 0, 0.4117647, 1, 1,
0.3326761, 1.740481, -1.02008, 0, 0.4078431, 1, 1,
0.3332528, 0.8478417, 0.8960847, 0, 0.4, 1, 1,
0.3366286, 0.2225599, 0.8574943, 0, 0.3921569, 1, 1,
0.3379877, 1.075719, -0.2473228, 0, 0.3882353, 1, 1,
0.3435958, 1.44132, 1.095338, 0, 0.3803922, 1, 1,
0.3449425, 0.1870064, 1.453133, 0, 0.3764706, 1, 1,
0.3451011, -1.376344, 4.121279, 0, 0.3686275, 1, 1,
0.3482352, 0.1375941, 1.166989, 0, 0.3647059, 1, 1,
0.3482551, 0.59429, 0.1469422, 0, 0.3568628, 1, 1,
0.3515306, 0.7095474, 0.5870237, 0, 0.3529412, 1, 1,
0.3519261, 0.7679814, 2.412119, 0, 0.345098, 1, 1,
0.352215, 0.32592, -0.1343201, 0, 0.3411765, 1, 1,
0.3544215, 0.9206719, 0.4466963, 0, 0.3333333, 1, 1,
0.3555751, 0.5056093, -0.4633062, 0, 0.3294118, 1, 1,
0.3582179, -0.402151, 1.455634, 0, 0.3215686, 1, 1,
0.3593568, -0.7280885, 1.789195, 0, 0.3176471, 1, 1,
0.3674617, 0.1470262, 1.275425, 0, 0.3098039, 1, 1,
0.3681414, 0.4854684, 0.6972626, 0, 0.3058824, 1, 1,
0.3715395, -1.193323, 3.479611, 0, 0.2980392, 1, 1,
0.377203, -0.8948693, 3.251193, 0, 0.2901961, 1, 1,
0.3804577, 0.04672654, 0.2353209, 0, 0.2862745, 1, 1,
0.3805075, -0.7794259, 2.129782, 0, 0.2784314, 1, 1,
0.3882055, -1.265681, 4.978411, 0, 0.2745098, 1, 1,
0.3973779, 1.172541, 0.574645, 0, 0.2666667, 1, 1,
0.3987555, 1.60264, 0.349374, 0, 0.2627451, 1, 1,
0.3999456, -0.216385, 2.32258, 0, 0.254902, 1, 1,
0.4002063, -0.6644759, 4.470062, 0, 0.2509804, 1, 1,
0.4033943, -1.421408, 1.319517, 0, 0.2431373, 1, 1,
0.4048652, -0.5523669, 3.303004, 0, 0.2392157, 1, 1,
0.4080251, -0.7372949, 2.888591, 0, 0.2313726, 1, 1,
0.4112027, 0.2857749, 0.4171221, 0, 0.227451, 1, 1,
0.4122624, 0.1499141, 2.057321, 0, 0.2196078, 1, 1,
0.4123046, 0.2406229, 0.9332349, 0, 0.2156863, 1, 1,
0.4153828, 1.905723, 1.582916, 0, 0.2078431, 1, 1,
0.4177207, 0.05469894, 1.25836, 0, 0.2039216, 1, 1,
0.4189696, -0.1280491, 2.268365, 0, 0.1960784, 1, 1,
0.4194764, 0.2745977, 0.1799009, 0, 0.1882353, 1, 1,
0.423304, 0.7917868, 0.8118066, 0, 0.1843137, 1, 1,
0.4282854, 0.2606993, 1.619035, 0, 0.1764706, 1, 1,
0.4319061, 2.142319, 1.140852, 0, 0.172549, 1, 1,
0.4333307, -1.707767, 3.081472, 0, 0.1647059, 1, 1,
0.4336016, -0.4151933, 0.7611543, 0, 0.1607843, 1, 1,
0.4409841, 0.3125232, 0.6522996, 0, 0.1529412, 1, 1,
0.4426341, 1.99109, 0.2089706, 0, 0.1490196, 1, 1,
0.4440316, -0.7276395, 2.448452, 0, 0.1411765, 1, 1,
0.4457757, -1.14733, 4.073654, 0, 0.1372549, 1, 1,
0.4466866, 0.7477408, 0.5332088, 0, 0.1294118, 1, 1,
0.4525685, 0.2860372, 0.1483652, 0, 0.1254902, 1, 1,
0.4531063, -1.026017, 2.971205, 0, 0.1176471, 1, 1,
0.4537046, 1.57408, 1.054245, 0, 0.1137255, 1, 1,
0.4571467, -1.232269, 2.367111, 0, 0.1058824, 1, 1,
0.4594399, -0.3682218, 0.6948317, 0, 0.09803922, 1, 1,
0.4626023, 0.08209658, 0.8461871, 0, 0.09411765, 1, 1,
0.4630903, 0.9472957, 0.05198291, 0, 0.08627451, 1, 1,
0.4657592, -0.2685285, 1.158228, 0, 0.08235294, 1, 1,
0.4675106, -0.3602714, 1.793486, 0, 0.07450981, 1, 1,
0.4758002, 0.1714184, 1.902102, 0, 0.07058824, 1, 1,
0.4763717, -0.3100487, 1.850426, 0, 0.0627451, 1, 1,
0.4777179, 0.285446, 0.1607581, 0, 0.05882353, 1, 1,
0.4777355, -1.081102, 4.590685, 0, 0.05098039, 1, 1,
0.478311, 0.5397395, -0.2960405, 0, 0.04705882, 1, 1,
0.4794704, -1.960125, 2.555076, 0, 0.03921569, 1, 1,
0.4847791, 0.2695654, 1.639339, 0, 0.03529412, 1, 1,
0.4873971, -0.494221, 2.278378, 0, 0.02745098, 1, 1,
0.4895157, -1.423629, 3.357272, 0, 0.02352941, 1, 1,
0.4900328, -0.6619265, 2.936937, 0, 0.01568628, 1, 1,
0.4904497, 0.4220723, 0.4044487, 0, 0.01176471, 1, 1,
0.4943493, 0.7963577, 0.6801665, 0, 0.003921569, 1, 1,
0.4955316, -0.05291107, 3.772972, 0.003921569, 0, 1, 1,
0.4981397, 1.691287, -1.033462, 0.007843138, 0, 1, 1,
0.4983859, 0.7035583, -1.135068, 0.01568628, 0, 1, 1,
0.5078222, 0.1489935, 0.9761197, 0.01960784, 0, 1, 1,
0.5080566, 1.778791, 0.5216842, 0.02745098, 0, 1, 1,
0.5081792, 1.089745, 0.7920475, 0.03137255, 0, 1, 1,
0.5123257, -0.8716041, 1.723232, 0.03921569, 0, 1, 1,
0.5125279, 0.3723855, 2.579133, 0.04313726, 0, 1, 1,
0.519141, 0.6803782, 1.616049, 0.05098039, 0, 1, 1,
0.5206773, -0.7989939, 1.536814, 0.05490196, 0, 1, 1,
0.5215592, 2.041521, -1.346302, 0.0627451, 0, 1, 1,
0.5216828, -0.1440136, 2.346863, 0.06666667, 0, 1, 1,
0.5223019, -0.1190843, 0.2102847, 0.07450981, 0, 1, 1,
0.5229222, 1.26362, 0.2535512, 0.07843138, 0, 1, 1,
0.5368022, 0.3513677, 0.01048181, 0.08627451, 0, 1, 1,
0.5420313, -0.5536749, 2.964645, 0.09019608, 0, 1, 1,
0.5438607, 1.288557, 0.8620275, 0.09803922, 0, 1, 1,
0.5440551, -0.3000974, 2.035213, 0.1058824, 0, 1, 1,
0.5502742, 0.1463086, -0.5808005, 0.1098039, 0, 1, 1,
0.5527362, 0.1200242, -0.2549563, 0.1176471, 0, 1, 1,
0.5529147, -0.1049499, 0.8658041, 0.1215686, 0, 1, 1,
0.5529709, -1.208611, 2.784939, 0.1294118, 0, 1, 1,
0.5562868, -0.6010228, 3.794822, 0.1333333, 0, 1, 1,
0.5615909, -0.399916, 1.393211, 0.1411765, 0, 1, 1,
0.5627099, 0.5924682, -0.3580862, 0.145098, 0, 1, 1,
0.5652171, -1.655957, 2.056577, 0.1529412, 0, 1, 1,
0.5656646, -0.02000075, -0.9657719, 0.1568628, 0, 1, 1,
0.5665687, 2.371281, 1.459858, 0.1647059, 0, 1, 1,
0.5683837, -2.494808, 2.834708, 0.1686275, 0, 1, 1,
0.5686024, 0.6086752, 0.0441974, 0.1764706, 0, 1, 1,
0.5718679, -1.091657, 2.756675, 0.1803922, 0, 1, 1,
0.5751601, -0.4498219, 2.210165, 0.1882353, 0, 1, 1,
0.5800747, 0.6499597, 0.7873713, 0.1921569, 0, 1, 1,
0.5806559, -0.4453156, 2.130311, 0.2, 0, 1, 1,
0.5832351, -0.2182797, 2.283163, 0.2078431, 0, 1, 1,
0.5863571, -0.4615486, 3.6302, 0.2117647, 0, 1, 1,
0.5880176, 0.8278, 1.423555, 0.2196078, 0, 1, 1,
0.5883672, 0.2776303, 1.155596, 0.2235294, 0, 1, 1,
0.5883704, 0.2944597, 0.2384956, 0.2313726, 0, 1, 1,
0.5905861, 0.7190346, 1.473028, 0.2352941, 0, 1, 1,
0.5916988, -0.7816437, 3.946983, 0.2431373, 0, 1, 1,
0.5919896, 1.423612, -0.32025, 0.2470588, 0, 1, 1,
0.6024379, -2.080472, 3.626968, 0.254902, 0, 1, 1,
0.6040346, -0.2826912, 1.187629, 0.2588235, 0, 1, 1,
0.6059381, -0.3503998, 2.629833, 0.2666667, 0, 1, 1,
0.60766, 0.3139607, 2.224695, 0.2705882, 0, 1, 1,
0.6112236, 0.581706, -0.6644257, 0.2784314, 0, 1, 1,
0.613521, 0.08045717, 0.6784469, 0.282353, 0, 1, 1,
0.6141976, -0.2418941, 1.915907, 0.2901961, 0, 1, 1,
0.616596, 1.806562, 1.363858, 0.2941177, 0, 1, 1,
0.6206406, -0.571043, 3.108854, 0.3019608, 0, 1, 1,
0.6215063, -0.3700676, 1.89562, 0.3098039, 0, 1, 1,
0.6240044, 2.346259, 1.282529, 0.3137255, 0, 1, 1,
0.6268983, -1.097333, 3.52574, 0.3215686, 0, 1, 1,
0.6302601, -1.019009, 2.483411, 0.3254902, 0, 1, 1,
0.6321335, 0.5891709, 3.585234, 0.3333333, 0, 1, 1,
0.633837, 0.01765207, 1.758784, 0.3372549, 0, 1, 1,
0.6348387, 0.8305871, -0.5535318, 0.345098, 0, 1, 1,
0.6387706, 0.1724847, 2.040115, 0.3490196, 0, 1, 1,
0.6388505, -0.3946328, 0.7517205, 0.3568628, 0, 1, 1,
0.6396461, 0.7888011, 0.8488506, 0.3607843, 0, 1, 1,
0.6425171, -1.355304, 3.653043, 0.3686275, 0, 1, 1,
0.6453508, -2.304981, 4.262088, 0.372549, 0, 1, 1,
0.6480405, 0.6607246, 0.9379256, 0.3803922, 0, 1, 1,
0.6570752, -0.5076961, 2.442812, 0.3843137, 0, 1, 1,
0.6677237, -2.373924, 3.349233, 0.3921569, 0, 1, 1,
0.6684065, 0.3089897, -0.1367317, 0.3960784, 0, 1, 1,
0.6716765, -0.3829382, 3.549768, 0.4039216, 0, 1, 1,
0.6726691, 0.2505591, 2.5428, 0.4117647, 0, 1, 1,
0.6751699, -0.410263, 2.532045, 0.4156863, 0, 1, 1,
0.6753572, -1.064287, 1.848169, 0.4235294, 0, 1, 1,
0.6788013, 0.6176313, 1.262514, 0.427451, 0, 1, 1,
0.6812266, -0.453049, 3.033745, 0.4352941, 0, 1, 1,
0.6822791, -1.463255, 2.02261, 0.4392157, 0, 1, 1,
0.6830634, 0.4577851, -1.39619, 0.4470588, 0, 1, 1,
0.6843745, -1.285225, 2.935148, 0.4509804, 0, 1, 1,
0.6871518, 0.9643528, -1.37169, 0.4588235, 0, 1, 1,
0.6879603, -0.2008952, 3.309401, 0.4627451, 0, 1, 1,
0.6979914, -0.006203288, 1.536257, 0.4705882, 0, 1, 1,
0.6991389, 0.6194788, 1.0283, 0.4745098, 0, 1, 1,
0.699971, 0.7613605, 1.008111, 0.4823529, 0, 1, 1,
0.7011118, 0.3787341, 2.470778, 0.4862745, 0, 1, 1,
0.7012092, 0.4278485, 1.183963, 0.4941176, 0, 1, 1,
0.7015826, 1.607747, 0.9337933, 0.5019608, 0, 1, 1,
0.7040725, 1.36922, -0.2508131, 0.5058824, 0, 1, 1,
0.7050631, 1.222762, -0.2157209, 0.5137255, 0, 1, 1,
0.7109915, 1.080738, 1.501453, 0.5176471, 0, 1, 1,
0.7110231, -0.170307, 2.076744, 0.5254902, 0, 1, 1,
0.7132486, -0.6264617, 0.8798605, 0.5294118, 0, 1, 1,
0.7140995, -0.3203248, 2.253788, 0.5372549, 0, 1, 1,
0.7173001, -0.8401905, 3.992116, 0.5411765, 0, 1, 1,
0.7182214, 1.070989, 0.5178747, 0.5490196, 0, 1, 1,
0.7199582, 0.2056085, 0.8839105, 0.5529412, 0, 1, 1,
0.7204703, -0.6592656, 3.061496, 0.5607843, 0, 1, 1,
0.7217116, 1.59481, 0.4750778, 0.5647059, 0, 1, 1,
0.7326912, -0.2542033, 2.185646, 0.572549, 0, 1, 1,
0.7348128, 1.510159, 0.7159849, 0.5764706, 0, 1, 1,
0.7394655, -0.6277329, 3.162865, 0.5843138, 0, 1, 1,
0.7425117, 0.688678, -0.5458854, 0.5882353, 0, 1, 1,
0.745144, 0.9879299, 1.002712, 0.5960785, 0, 1, 1,
0.7529542, -2.897798, 2.018615, 0.6039216, 0, 1, 1,
0.7613673, 0.2238731, 0.752296, 0.6078432, 0, 1, 1,
0.761862, -1.872907, 2.009009, 0.6156863, 0, 1, 1,
0.7691822, -0.03250869, 2.287558, 0.6196079, 0, 1, 1,
0.7715089, -0.1565371, 2.029729, 0.627451, 0, 1, 1,
0.7729498, 3.038832, -0.6485043, 0.6313726, 0, 1, 1,
0.7730826, 1.692186, 0.4152227, 0.6392157, 0, 1, 1,
0.7799944, -0.3192539, 2.327023, 0.6431373, 0, 1, 1,
0.7822946, 0.5814291, 0.6637332, 0.6509804, 0, 1, 1,
0.7906771, -1.739035, 3.675208, 0.654902, 0, 1, 1,
0.7914358, 0.2084967, 0.9072647, 0.6627451, 0, 1, 1,
0.7941226, 0.5523325, 1.128663, 0.6666667, 0, 1, 1,
0.7967856, 0.4103089, 1.673251, 0.6745098, 0, 1, 1,
0.7976152, 1.914062, 2.423696, 0.6784314, 0, 1, 1,
0.8046393, -0.0262622, 1.592208, 0.6862745, 0, 1, 1,
0.8103766, -1.191248, 1.686725, 0.6901961, 0, 1, 1,
0.8141301, -1.9548, 2.479779, 0.6980392, 0, 1, 1,
0.8148816, -1.732597, 3.532511, 0.7058824, 0, 1, 1,
0.8163326, 1.536247, 1.865572, 0.7098039, 0, 1, 1,
0.822794, -0.184667, 1.93758, 0.7176471, 0, 1, 1,
0.823855, -0.9472305, 2.559088, 0.7215686, 0, 1, 1,
0.8299545, 0.5713995, 0.8907565, 0.7294118, 0, 1, 1,
0.8327486, -0.74411, 2.063649, 0.7333333, 0, 1, 1,
0.834065, -0.7960615, 2.704071, 0.7411765, 0, 1, 1,
0.8342316, 0.054374, 4.482977, 0.7450981, 0, 1, 1,
0.8355887, 0.7017277, 3.455583, 0.7529412, 0, 1, 1,
0.8389897, -0.1814136, 3.428244, 0.7568628, 0, 1, 1,
0.8437073, 0.5529607, 0.4682972, 0.7647059, 0, 1, 1,
0.8492299, -0.9347379, 3.721881, 0.7686275, 0, 1, 1,
0.8512607, 1.087956, -0.2176745, 0.7764706, 0, 1, 1,
0.8611379, 0.2044819, 2.187989, 0.7803922, 0, 1, 1,
0.8656278, -0.3782468, 1.860161, 0.7882353, 0, 1, 1,
0.8690194, 1.067619, 0.3479258, 0.7921569, 0, 1, 1,
0.869846, -1.047032, 3.634001, 0.8, 0, 1, 1,
0.8700082, -2.992702, 1.840618, 0.8078431, 0, 1, 1,
0.8709379, -0.8181949, 2.199671, 0.8117647, 0, 1, 1,
0.8729087, -0.3093486, 3.142194, 0.8196079, 0, 1, 1,
0.8788193, 0.9079095, 1.075762, 0.8235294, 0, 1, 1,
0.8868635, 1.798793, 0.6742832, 0.8313726, 0, 1, 1,
0.9014827, 0.3348678, 1.0397, 0.8352941, 0, 1, 1,
0.904633, 0.2371719, 0.5716962, 0.8431373, 0, 1, 1,
0.9102212, -0.06968538, 1.485083, 0.8470588, 0, 1, 1,
0.911556, -0.6725817, 1.245237, 0.854902, 0, 1, 1,
0.9143055, 1.03222, -0.1194578, 0.8588235, 0, 1, 1,
0.9182144, -0.4012162, 0.7096362, 0.8666667, 0, 1, 1,
0.9202647, -0.7956106, 2.742275, 0.8705882, 0, 1, 1,
0.9303807, -0.38322, 1.732143, 0.8784314, 0, 1, 1,
0.9313753, 1.025697, 1.034535, 0.8823529, 0, 1, 1,
0.9401954, 0.5297152, 1.802426, 0.8901961, 0, 1, 1,
0.9415236, -0.1843011, 0.9683099, 0.8941177, 0, 1, 1,
0.9457726, 0.7630949, 0.03775144, 0.9019608, 0, 1, 1,
0.9497682, -0.4474382, 1.424989, 0.9098039, 0, 1, 1,
0.9499551, 1.280552, 2.136177, 0.9137255, 0, 1, 1,
0.9514767, 1.103318, -1.916939, 0.9215686, 0, 1, 1,
0.9572593, 0.4775166, 0.700227, 0.9254902, 0, 1, 1,
0.9574057, 0.1924304, 2.290687, 0.9333333, 0, 1, 1,
0.9593788, -0.1664283, 1.424496, 0.9372549, 0, 1, 1,
0.9600884, -0.9008797, 2.542596, 0.945098, 0, 1, 1,
0.9622963, -0.9443236, 3.999934, 0.9490196, 0, 1, 1,
0.9625351, -0.3902279, 2.779686, 0.9568627, 0, 1, 1,
0.9634893, 1.056927, -0.5094783, 0.9607843, 0, 1, 1,
0.9661376, 2.529811, 1.820812, 0.9686275, 0, 1, 1,
0.9699146, 0.09546994, 3.014396, 0.972549, 0, 1, 1,
0.9711532, 0.4443928, -0.1407202, 0.9803922, 0, 1, 1,
0.9797463, 0.03306315, 1.856362, 0.9843137, 0, 1, 1,
0.9822538, 0.08503416, 1.59828, 0.9921569, 0, 1, 1,
0.9833925, -0.5905398, 1.968221, 0.9960784, 0, 1, 1,
0.9854624, -0.346813, 4.603915, 1, 0, 0.9960784, 1,
0.9871368, -0.0222432, 1.382828, 1, 0, 0.9882353, 1,
0.9878553, 1.814569, -1.533103, 1, 0, 0.9843137, 1,
0.9902588, 0.3291138, 0.6469076, 1, 0, 0.9764706, 1,
0.993025, -0.5980536, 1.387359, 1, 0, 0.972549, 1,
0.9983732, -1.219183, 2.780166, 1, 0, 0.9647059, 1,
0.9994931, -1.829443, 2.11117, 1, 0, 0.9607843, 1,
1.001684, -1.66591, 1.055762, 1, 0, 0.9529412, 1,
1.003164, 0.1201425, 1.065162, 1, 0, 0.9490196, 1,
1.003956, 0.1585862, 1.672752, 1, 0, 0.9411765, 1,
1.004202, 0.3518642, 0.415819, 1, 0, 0.9372549, 1,
1.004525, 0.8900312, 2.279666, 1, 0, 0.9294118, 1,
1.005571, -1.795432, 2.071815, 1, 0, 0.9254902, 1,
1.006476, -0.2868462, 1.837716, 1, 0, 0.9176471, 1,
1.006504, -0.3457419, 0.1320364, 1, 0, 0.9137255, 1,
1.009953, -1.425999, 2.451764, 1, 0, 0.9058824, 1,
1.009998, -0.4927981, -0.3425972, 1, 0, 0.9019608, 1,
1.011549, 0.2645505, 2.016328, 1, 0, 0.8941177, 1,
1.044681, 0.5875956, 2.599246, 1, 0, 0.8862745, 1,
1.04595, -1.016347, 5.009118, 1, 0, 0.8823529, 1,
1.046189, 0.7563374, -0.9437252, 1, 0, 0.8745098, 1,
1.047959, 1.109462, 1.447431, 1, 0, 0.8705882, 1,
1.061217, 0.6120576, 3.354965, 1, 0, 0.8627451, 1,
1.062261, 0.1674092, 0.3447164, 1, 0, 0.8588235, 1,
1.064813, -0.3592158, 1.664131, 1, 0, 0.8509804, 1,
1.065336, 1.96348, -0.3799897, 1, 0, 0.8470588, 1,
1.06801, -1.492334, 1.514567, 1, 0, 0.8392157, 1,
1.068875, 0.4386907, 1.454725, 1, 0, 0.8352941, 1,
1.074749, -1.757406, 2.046024, 1, 0, 0.827451, 1,
1.078794, 0.1306408, 0.6231018, 1, 0, 0.8235294, 1,
1.079342, 1.128649, 1.494137, 1, 0, 0.8156863, 1,
1.089002, 2.282535, 0.1574948, 1, 0, 0.8117647, 1,
1.091558, 1.599487, -0.4228693, 1, 0, 0.8039216, 1,
1.093973, 0.5934175, 1.003762, 1, 0, 0.7960784, 1,
1.094374, 1.417518, 1.552577, 1, 0, 0.7921569, 1,
1.098639, -0.3057171, 2.924312, 1, 0, 0.7843137, 1,
1.100513, 0.4302495, 0.3916355, 1, 0, 0.7803922, 1,
1.103611, -0.08670149, 0.9348052, 1, 0, 0.772549, 1,
1.108021, -0.7767667, 1.840866, 1, 0, 0.7686275, 1,
1.111822, 1.228457, 1.467122, 1, 0, 0.7607843, 1,
1.112263, -0.9259779, 2.356251, 1, 0, 0.7568628, 1,
1.114456, -1.086228, 2.333402, 1, 0, 0.7490196, 1,
1.118355, -1.05211, 1.806538, 1, 0, 0.7450981, 1,
1.126523, 1.298888, 0.0723377, 1, 0, 0.7372549, 1,
1.137301, -0.879111, 1.749436, 1, 0, 0.7333333, 1,
1.138384, -0.2477663, 0.3383441, 1, 0, 0.7254902, 1,
1.139457, 1.976131, -1.842126, 1, 0, 0.7215686, 1,
1.144074, -0.1510073, 1.620727, 1, 0, 0.7137255, 1,
1.150772, 0.05185939, 1.26443, 1, 0, 0.7098039, 1,
1.150841, 1.268396, 1.425666, 1, 0, 0.7019608, 1,
1.151317, 0.5679181, -0.5686354, 1, 0, 0.6941177, 1,
1.165453, -0.4815591, 2.210672, 1, 0, 0.6901961, 1,
1.168925, 0.850819, 1.444596, 1, 0, 0.682353, 1,
1.182382, 0.7795725, -0.2407199, 1, 0, 0.6784314, 1,
1.192361, -0.0745017, 2.478499, 1, 0, 0.6705883, 1,
1.195548, -0.7641202, 1.783777, 1, 0, 0.6666667, 1,
1.197567, 0.5609126, -0.941151, 1, 0, 0.6588235, 1,
1.19878, 0.3425438, 1.693116, 1, 0, 0.654902, 1,
1.203965, 1.246363, 1.087714, 1, 0, 0.6470588, 1,
1.20514, 1.275632, 0.6109182, 1, 0, 0.6431373, 1,
1.206858, -2.045513, 4.59169, 1, 0, 0.6352941, 1,
1.208047, -0.4658186, 3.043907, 1, 0, 0.6313726, 1,
1.208885, -0.7286761, 1.152339, 1, 0, 0.6235294, 1,
1.213032, -0.883875, 1.440947, 1, 0, 0.6196079, 1,
1.216552, 1.887647, 0.6165032, 1, 0, 0.6117647, 1,
1.220021, -0.1830587, 1.098451, 1, 0, 0.6078432, 1,
1.225694, 0.2949686, 0.6108593, 1, 0, 0.6, 1,
1.226058, 0.3287395, 2.138624, 1, 0, 0.5921569, 1,
1.251736, -1.211257, 2.786039, 1, 0, 0.5882353, 1,
1.256779, -0.6633353, 0.9998066, 1, 0, 0.5803922, 1,
1.259227, -0.4856877, 2.353969, 1, 0, 0.5764706, 1,
1.260975, 1.167847, 0.5089485, 1, 0, 0.5686275, 1,
1.274932, 0.6314133, 1.862628, 1, 0, 0.5647059, 1,
1.286805, 0.2791238, 1.130057, 1, 0, 0.5568628, 1,
1.300094, -0.9166497, 1.440528, 1, 0, 0.5529412, 1,
1.307776, -0.3478222, 1.525541, 1, 0, 0.5450981, 1,
1.3082, 0.1178703, 0.8619523, 1, 0, 0.5411765, 1,
1.311067, -1.612758, 1.97131, 1, 0, 0.5333334, 1,
1.318615, 1.210142, 0.3700949, 1, 0, 0.5294118, 1,
1.327729, -0.02062194, 1.340704, 1, 0, 0.5215687, 1,
1.330071, -0.06343801, 3.591597, 1, 0, 0.5176471, 1,
1.332683, 1.605487, 2.463399, 1, 0, 0.509804, 1,
1.339458, -0.07368127, 2.444116, 1, 0, 0.5058824, 1,
1.34955, -0.4912285, 4.025801, 1, 0, 0.4980392, 1,
1.353886, -0.5072389, 1.198806, 1, 0, 0.4901961, 1,
1.353979, 1.646058, 1.048604, 1, 0, 0.4862745, 1,
1.359332, 0.3378281, 3.431587, 1, 0, 0.4784314, 1,
1.361258, 0.9955947, -2.177979, 1, 0, 0.4745098, 1,
1.367794, 0.05849196, 0.6050649, 1, 0, 0.4666667, 1,
1.376965, -0.447587, 3.393273, 1, 0, 0.4627451, 1,
1.37908, -0.3379335, 1.486607, 1, 0, 0.454902, 1,
1.393405, -1.942947, 1.73392, 1, 0, 0.4509804, 1,
1.404553, 1.343611, 0.8743773, 1, 0, 0.4431373, 1,
1.40904, -1.391981, 2.018478, 1, 0, 0.4392157, 1,
1.417047, -0.4031896, -0.03474214, 1, 0, 0.4313726, 1,
1.417087, -0.8363048, 2.119843, 1, 0, 0.427451, 1,
1.420518, 1.331893, 0.7935986, 1, 0, 0.4196078, 1,
1.421827, -0.4635303, 2.808315, 1, 0, 0.4156863, 1,
1.446293, 0.2065877, -0.09597334, 1, 0, 0.4078431, 1,
1.446805, -0.2594115, 2.146804, 1, 0, 0.4039216, 1,
1.453088, -0.02093131, 2.777964, 1, 0, 0.3960784, 1,
1.49567, -1.101297, 3.525501, 1, 0, 0.3882353, 1,
1.52406, -0.6706918, -0.1912858, 1, 0, 0.3843137, 1,
1.52638, 0.009715214, 2.160255, 1, 0, 0.3764706, 1,
1.533965, -0.5491319, 3.658871, 1, 0, 0.372549, 1,
1.538032, -0.5446507, 1.246904, 1, 0, 0.3647059, 1,
1.543295, -1.308131, -0.1130469, 1, 0, 0.3607843, 1,
1.548687, -0.09102021, 1.537442, 1, 0, 0.3529412, 1,
1.555993, -0.6143138, 2.395857, 1, 0, 0.3490196, 1,
1.557683, -0.8716008, 2.572524, 1, 0, 0.3411765, 1,
1.564266, -0.6396824, -0.1901307, 1, 0, 0.3372549, 1,
1.572341, -0.222253, 0.02113738, 1, 0, 0.3294118, 1,
1.573748, 0.1682324, 0.7408776, 1, 0, 0.3254902, 1,
1.586476, 1.367904, 1.763699, 1, 0, 0.3176471, 1,
1.631603, 1.208174, 0.6204847, 1, 0, 0.3137255, 1,
1.659511, 0.8950893, 2.812714, 1, 0, 0.3058824, 1,
1.669382, 0.02838336, -0.273506, 1, 0, 0.2980392, 1,
1.673595, -0.8728771, 0.9246166, 1, 0, 0.2941177, 1,
1.675534, 0.9752449, 0.9748631, 1, 0, 0.2862745, 1,
1.676106, 1.44309, -0.6474827, 1, 0, 0.282353, 1,
1.676927, 0.1768121, 1.510951, 1, 0, 0.2745098, 1,
1.693853, -0.1352511, 1.197043, 1, 0, 0.2705882, 1,
1.695756, 1.430561, 1.062529, 1, 0, 0.2627451, 1,
1.718101, -0.3755493, 2.472082, 1, 0, 0.2588235, 1,
1.730075, 1.94453, 0.4267474, 1, 0, 0.2509804, 1,
1.740554, -0.1323577, 0.6532117, 1, 0, 0.2470588, 1,
1.746483, 1.518963, 0.01623186, 1, 0, 0.2392157, 1,
1.752549, 0.1549652, 0.1751142, 1, 0, 0.2352941, 1,
1.773949, 2.342643, -0.4979012, 1, 0, 0.227451, 1,
1.784562, 0.7272186, 3.133379, 1, 0, 0.2235294, 1,
1.795318, 0.1275594, 1.2558, 1, 0, 0.2156863, 1,
1.834021, 0.1315276, 2.587435, 1, 0, 0.2117647, 1,
1.84343, 0.3067555, 1.286552, 1, 0, 0.2039216, 1,
1.843952, 0.4677977, 2.477592, 1, 0, 0.1960784, 1,
1.853072, -0.05326254, 0.3432956, 1, 0, 0.1921569, 1,
1.858224, -1.577956, 1.861987, 1, 0, 0.1843137, 1,
1.87884, -0.1439112, 0.2048614, 1, 0, 0.1803922, 1,
1.884121, -1.452419, 3.977736, 1, 0, 0.172549, 1,
1.929357, 0.9059186, 1.212539, 1, 0, 0.1686275, 1,
1.9347, -0.7226574, 0.8081909, 1, 0, 0.1607843, 1,
1.937353, 0.4789067, 1.204813, 1, 0, 0.1568628, 1,
1.957913, 0.5330823, 0.3178754, 1, 0, 0.1490196, 1,
1.959887, 0.09385552, 1.368888, 1, 0, 0.145098, 1,
1.961793, -0.1681359, 1.864846, 1, 0, 0.1372549, 1,
2.013013, -0.04842898, 1.715997, 1, 0, 0.1333333, 1,
2.033544, -0.4994735, 1.282184, 1, 0, 0.1254902, 1,
2.045624, -0.5018927, 1.864709, 1, 0, 0.1215686, 1,
2.080709, 1.056528, 2.022374, 1, 0, 0.1137255, 1,
2.135511, 0.5287551, 1.669329, 1, 0, 0.1098039, 1,
2.171271, -0.7474464, 0.4961824, 1, 0, 0.1019608, 1,
2.204774, -0.4648184, 0.06178952, 1, 0, 0.09411765, 1,
2.208583, -1.279713, 2.776109, 1, 0, 0.09019608, 1,
2.241019, -0.2240921, 1.338397, 1, 0, 0.08235294, 1,
2.311028, -0.4925295, 1.629459, 1, 0, 0.07843138, 1,
2.325844, 0.7118632, 0.9928855, 1, 0, 0.07058824, 1,
2.359432, 0.1185982, 1.167574, 1, 0, 0.06666667, 1,
2.396391, -0.7942997, 1.925231, 1, 0, 0.05882353, 1,
2.447877, -0.8809143, 2.923901, 1, 0, 0.05490196, 1,
2.472213, 0.1894327, 1.586657, 1, 0, 0.04705882, 1,
2.525614, -1.330345, 2.49137, 1, 0, 0.04313726, 1,
2.684083, -0.07514738, 4.502254, 1, 0, 0.03529412, 1,
2.750305, -0.9067625, 1.652133, 1, 0, 0.03137255, 1,
2.791772, -1.293827, 2.347613, 1, 0, 0.02352941, 1,
2.828578, 0.5374765, 0.7769354, 1, 0, 0.01960784, 1,
3.09169, -0.1128016, 0.05394626, 1, 0, 0.01176471, 1,
3.421382, 0.3463854, 1.878255, 1, 0, 0.007843138, 1
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
-0.09792483, -4.561265, -6.967609, 0, -0.5, 0.5, 0.5,
-0.09792483, -4.561265, -6.967609, 1, -0.5, 0.5, 0.5,
-0.09792483, -4.561265, -6.967609, 1, 1.5, 0.5, 0.5,
-0.09792483, -4.561265, -6.967609, 0, 1.5, 0.5, 0.5
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
-4.810277, 0.001472712, -6.967609, 0, -0.5, 0.5, 0.5,
-4.810277, 0.001472712, -6.967609, 1, -0.5, 0.5, 0.5,
-4.810277, 0.001472712, -6.967609, 1, 1.5, 0.5, 0.5,
-4.810277, 0.001472712, -6.967609, 0, 1.5, 0.5, 0.5
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
-4.810277, -4.561265, 0.1206245, 0, -0.5, 0.5, 0.5,
-4.810277, -4.561265, 0.1206245, 1, -0.5, 0.5, 0.5,
-4.810277, -4.561265, 0.1206245, 1, 1.5, 0.5, 0.5,
-4.810277, -4.561265, 0.1206245, 0, 1.5, 0.5, 0.5
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
-2, -3.508326, -5.331862,
2, -3.508326, -5.331862,
-2, -3.508326, -5.331862,
-2, -3.683816, -5.604487,
0, -3.508326, -5.331862,
0, -3.683816, -5.604487,
2, -3.508326, -5.331862,
2, -3.683816, -5.604487
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
-2, -4.034795, -6.149736, 0, -0.5, 0.5, 0.5,
-2, -4.034795, -6.149736, 1, -0.5, 0.5, 0.5,
-2, -4.034795, -6.149736, 1, 1.5, 0.5, 0.5,
-2, -4.034795, -6.149736, 0, 1.5, 0.5, 0.5,
0, -4.034795, -6.149736, 0, -0.5, 0.5, 0.5,
0, -4.034795, -6.149736, 1, -0.5, 0.5, 0.5,
0, -4.034795, -6.149736, 1, 1.5, 0.5, 0.5,
0, -4.034795, -6.149736, 0, 1.5, 0.5, 0.5,
2, -4.034795, -6.149736, 0, -0.5, 0.5, 0.5,
2, -4.034795, -6.149736, 1, -0.5, 0.5, 0.5,
2, -4.034795, -6.149736, 1, 1.5, 0.5, 0.5,
2, -4.034795, -6.149736, 0, 1.5, 0.5, 0.5
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
-3.722811, -3, -5.331862,
-3.722811, 3, -5.331862,
-3.722811, -3, -5.331862,
-3.904055, -3, -5.604487,
-3.722811, -2, -5.331862,
-3.904055, -2, -5.604487,
-3.722811, -1, -5.331862,
-3.904055, -1, -5.604487,
-3.722811, 0, -5.331862,
-3.904055, 0, -5.604487,
-3.722811, 1, -5.331862,
-3.904055, 1, -5.604487,
-3.722811, 2, -5.331862,
-3.904055, 2, -5.604487,
-3.722811, 3, -5.331862,
-3.904055, 3, -5.604487
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
-4.266544, -3, -6.149736, 0, -0.5, 0.5, 0.5,
-4.266544, -3, -6.149736, 1, -0.5, 0.5, 0.5,
-4.266544, -3, -6.149736, 1, 1.5, 0.5, 0.5,
-4.266544, -3, -6.149736, 0, 1.5, 0.5, 0.5,
-4.266544, -2, -6.149736, 0, -0.5, 0.5, 0.5,
-4.266544, -2, -6.149736, 1, -0.5, 0.5, 0.5,
-4.266544, -2, -6.149736, 1, 1.5, 0.5, 0.5,
-4.266544, -2, -6.149736, 0, 1.5, 0.5, 0.5,
-4.266544, -1, -6.149736, 0, -0.5, 0.5, 0.5,
-4.266544, -1, -6.149736, 1, -0.5, 0.5, 0.5,
-4.266544, -1, -6.149736, 1, 1.5, 0.5, 0.5,
-4.266544, -1, -6.149736, 0, 1.5, 0.5, 0.5,
-4.266544, 0, -6.149736, 0, -0.5, 0.5, 0.5,
-4.266544, 0, -6.149736, 1, -0.5, 0.5, 0.5,
-4.266544, 0, -6.149736, 1, 1.5, 0.5, 0.5,
-4.266544, 0, -6.149736, 0, 1.5, 0.5, 0.5,
-4.266544, 1, -6.149736, 0, -0.5, 0.5, 0.5,
-4.266544, 1, -6.149736, 1, -0.5, 0.5, 0.5,
-4.266544, 1, -6.149736, 1, 1.5, 0.5, 0.5,
-4.266544, 1, -6.149736, 0, 1.5, 0.5, 0.5,
-4.266544, 2, -6.149736, 0, -0.5, 0.5, 0.5,
-4.266544, 2, -6.149736, 1, -0.5, 0.5, 0.5,
-4.266544, 2, -6.149736, 1, 1.5, 0.5, 0.5,
-4.266544, 2, -6.149736, 0, 1.5, 0.5, 0.5,
-4.266544, 3, -6.149736, 0, -0.5, 0.5, 0.5,
-4.266544, 3, -6.149736, 1, -0.5, 0.5, 0.5,
-4.266544, 3, -6.149736, 1, 1.5, 0.5, 0.5,
-4.266544, 3, -6.149736, 0, 1.5, 0.5, 0.5
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
-3.722811, -3.508326, -4,
-3.722811, -3.508326, 4,
-3.722811, -3.508326, -4,
-3.904055, -3.683816, -4,
-3.722811, -3.508326, -2,
-3.904055, -3.683816, -2,
-3.722811, -3.508326, 0,
-3.904055, -3.683816, 0,
-3.722811, -3.508326, 2,
-3.904055, -3.683816, 2,
-3.722811, -3.508326, 4,
-3.904055, -3.683816, 4
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
-4.266544, -4.034795, -4, 0, -0.5, 0.5, 0.5,
-4.266544, -4.034795, -4, 1, -0.5, 0.5, 0.5,
-4.266544, -4.034795, -4, 1, 1.5, 0.5, 0.5,
-4.266544, -4.034795, -4, 0, 1.5, 0.5, 0.5,
-4.266544, -4.034795, -2, 0, -0.5, 0.5, 0.5,
-4.266544, -4.034795, -2, 1, -0.5, 0.5, 0.5,
-4.266544, -4.034795, -2, 1, 1.5, 0.5, 0.5,
-4.266544, -4.034795, -2, 0, 1.5, 0.5, 0.5,
-4.266544, -4.034795, 0, 0, -0.5, 0.5, 0.5,
-4.266544, -4.034795, 0, 1, -0.5, 0.5, 0.5,
-4.266544, -4.034795, 0, 1, 1.5, 0.5, 0.5,
-4.266544, -4.034795, 0, 0, 1.5, 0.5, 0.5,
-4.266544, -4.034795, 2, 0, -0.5, 0.5, 0.5,
-4.266544, -4.034795, 2, 1, -0.5, 0.5, 0.5,
-4.266544, -4.034795, 2, 1, 1.5, 0.5, 0.5,
-4.266544, -4.034795, 2, 0, 1.5, 0.5, 0.5,
-4.266544, -4.034795, 4, 0, -0.5, 0.5, 0.5,
-4.266544, -4.034795, 4, 1, -0.5, 0.5, 0.5,
-4.266544, -4.034795, 4, 1, 1.5, 0.5, 0.5,
-4.266544, -4.034795, 4, 0, 1.5, 0.5, 0.5
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
-3.722811, -3.508326, -5.331862,
-3.722811, 3.511271, -5.331862,
-3.722811, -3.508326, 5.573112,
-3.722811, 3.511271, 5.573112,
-3.722811, -3.508326, -5.331862,
-3.722811, -3.508326, 5.573112,
-3.722811, 3.511271, -5.331862,
-3.722811, 3.511271, 5.573112,
-3.722811, -3.508326, -5.331862,
3.526961, -3.508326, -5.331862,
-3.722811, -3.508326, 5.573112,
3.526961, -3.508326, 5.573112,
-3.722811, 3.511271, -5.331862,
3.526961, 3.511271, -5.331862,
-3.722811, 3.511271, 5.573112,
3.526961, 3.511271, 5.573112,
3.526961, -3.508326, -5.331862,
3.526961, 3.511271, -5.331862,
3.526961, -3.508326, 5.573112,
3.526961, 3.511271, 5.573112,
3.526961, -3.508326, -5.331862,
3.526961, -3.508326, 5.573112,
3.526961, 3.511271, -5.331862,
3.526961, 3.511271, 5.573112
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
var radius = 7.933744;
var distance = 35.29813;
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
mvMatrix.translate( 0.09792483, -0.001472712, -0.1206245 );
mvMatrix.scale( 1.183226, 1.222025, 0.7866244 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.29813);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
diethyl_thiophosphat<-read.table("diethyl_thiophosphat.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diethyl_thiophosphat$V2
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_thiophosphat' not found
```

```r
y<-diethyl_thiophosphat$V3
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_thiophosphat' not found
```

```r
z<-diethyl_thiophosphat$V4
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_thiophosphat' not found
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
-3.617232, -1.206073, -1.81818, 0, 0, 1, 1, 1,
-3.00633, -1.064472, -0.9400215, 1, 0, 0, 1, 1,
-2.678859, -0.1436398, -1.00363, 1, 0, 0, 1, 1,
-2.641375, -0.7801729, -2.104444, 1, 0, 0, 1, 1,
-2.575676, 0.06300902, -1.850341, 1, 0, 0, 1, 1,
-2.46164, 0.5753554, -1.409539, 1, 0, 0, 1, 1,
-2.401649, -0.1548875, -1.207345, 0, 0, 0, 1, 1,
-2.357718, 1.292982, -0.3573118, 0, 0, 0, 1, 1,
-2.341865, -0.4132758, -1.707497, 0, 0, 0, 1, 1,
-2.330058, -1.476947, -1.492335, 0, 0, 0, 1, 1,
-2.314404, -0.08365272, -0.9249571, 0, 0, 0, 1, 1,
-2.308707, -1.549854, -2.974292, 0, 0, 0, 1, 1,
-2.183721, -0.1253891, -2.62075, 0, 0, 0, 1, 1,
-2.173293, -0.1290782, -1.804439, 1, 1, 1, 1, 1,
-2.115921, -0.5464866, -1.362252, 1, 1, 1, 1, 1,
-2.101503, 1.281874, -2.02438, 1, 1, 1, 1, 1,
-2.099907, 1.547293, -0.8502983, 1, 1, 1, 1, 1,
-2.090102, 0.2322333, -1.825352, 1, 1, 1, 1, 1,
-2.079444, -1.652999, -2.296095, 1, 1, 1, 1, 1,
-2.03442, 1.825963, -0.8546083, 1, 1, 1, 1, 1,
-1.98803, -1.629966, -2.99305, 1, 1, 1, 1, 1,
-1.977659, 1.265877, -3.10952, 1, 1, 1, 1, 1,
-1.971031, -1.08627, -2.902672, 1, 1, 1, 1, 1,
-1.909296, -0.1392776, -1.359373, 1, 1, 1, 1, 1,
-1.893714, 1.624186, -2.200645, 1, 1, 1, 1, 1,
-1.86705, -0.3764273, -1.496998, 1, 1, 1, 1, 1,
-1.817358, 2.451912, -0.6712751, 1, 1, 1, 1, 1,
-1.811072, 1.385894, -1.791628, 1, 1, 1, 1, 1,
-1.804116, -0.3641217, -2.390351, 0, 0, 1, 1, 1,
-1.764527, 1.188185, -0.04293568, 1, 0, 0, 1, 1,
-1.748486, -0.002390699, -4.015663, 1, 0, 0, 1, 1,
-1.736282, -0.1165439, -1.858774, 1, 0, 0, 1, 1,
-1.725627, -0.3311214, -2.554107, 1, 0, 0, 1, 1,
-1.706296, -0.7032102, -1.452703, 1, 0, 0, 1, 1,
-1.703556, -0.6109068, -0.6059667, 0, 0, 0, 1, 1,
-1.698166, 0.1499592, -3.106812, 0, 0, 0, 1, 1,
-1.692143, 0.6682865, -0.3016571, 0, 0, 0, 1, 1,
-1.685949, 0.04082365, -0.6123825, 0, 0, 0, 1, 1,
-1.666212, 0.2326307, -1.987776, 0, 0, 0, 1, 1,
-1.666192, 1.247626, -2.694128, 0, 0, 0, 1, 1,
-1.638429, 0.04314401, -1.781707, 0, 0, 0, 1, 1,
-1.632477, 0.7513224, 1.58843, 1, 1, 1, 1, 1,
-1.61965, -0.9404649, -2.592471, 1, 1, 1, 1, 1,
-1.604293, 0.0583137, -1.062333, 1, 1, 1, 1, 1,
-1.593027, 0.4643939, -0.1891617, 1, 1, 1, 1, 1,
-1.577804, -0.8398541, -2.161931, 1, 1, 1, 1, 1,
-1.576173, -0.7770949, -1.346692, 1, 1, 1, 1, 1,
-1.572649, 0.1106315, -1.107979, 1, 1, 1, 1, 1,
-1.557946, -0.4724423, -2.084959, 1, 1, 1, 1, 1,
-1.55749, 1.539053, -2.17273, 1, 1, 1, 1, 1,
-1.548376, 1.678867, -0.0004649007, 1, 1, 1, 1, 1,
-1.529127, -0.7220705, -1.949562, 1, 1, 1, 1, 1,
-1.528479, 0.3268584, -0.6792234, 1, 1, 1, 1, 1,
-1.523955, 0.4150287, -1.459711, 1, 1, 1, 1, 1,
-1.508093, -0.6455438, -2.367412, 1, 1, 1, 1, 1,
-1.50045, -0.3597022, -1.89327, 1, 1, 1, 1, 1,
-1.496106, 1.380461, 0.0994225, 0, 0, 1, 1, 1,
-1.492224, 0.6300442, -1.355535, 1, 0, 0, 1, 1,
-1.485323, 1.718577, -0.7642621, 1, 0, 0, 1, 1,
-1.482928, -1.457788, -0.09491086, 1, 0, 0, 1, 1,
-1.48056, -0.8309785, -2.25675, 1, 0, 0, 1, 1,
-1.47439, -0.3134112, -0.9885558, 1, 0, 0, 1, 1,
-1.473897, -0.468713, -0.7405576, 0, 0, 0, 1, 1,
-1.470687, -1.439595, -3.01183, 0, 0, 0, 1, 1,
-1.461258, -0.0438715, -2.823249, 0, 0, 0, 1, 1,
-1.460243, 0.1676486, -3.277052, 0, 0, 0, 1, 1,
-1.454959, 1.65817, 0.5272325, 0, 0, 0, 1, 1,
-1.445346, 1.47235, -2.150136, 0, 0, 0, 1, 1,
-1.443471, -1.02586, -1.203456, 0, 0, 0, 1, 1,
-1.443285, 0.8304367, -0.3178945, 1, 1, 1, 1, 1,
-1.439024, -0.1995017, -2.644083, 1, 1, 1, 1, 1,
-1.438834, -0.7227367, -3.620929, 1, 1, 1, 1, 1,
-1.426509, -0.7789531, -0.02521954, 1, 1, 1, 1, 1,
-1.410806, 0.278928, -1.567303, 1, 1, 1, 1, 1,
-1.406626, -0.6874128, -4.018559, 1, 1, 1, 1, 1,
-1.406242, -0.6983678, -1.812121, 1, 1, 1, 1, 1,
-1.400597, 1.020526, 1.486743, 1, 1, 1, 1, 1,
-1.396927, 0.05778737, -2.913483, 1, 1, 1, 1, 1,
-1.395171, 0.5513647, -2.885935, 1, 1, 1, 1, 1,
-1.390699, 1.372546, -1.026963, 1, 1, 1, 1, 1,
-1.389315, 1.371101, -1.636265, 1, 1, 1, 1, 1,
-1.383385, -0.4747157, -3.624624, 1, 1, 1, 1, 1,
-1.373387, -0.5819186, -1.935605, 1, 1, 1, 1, 1,
-1.366045, 1.257003, -1.011938, 1, 1, 1, 1, 1,
-1.362584, 0.8776812, -1.933084, 0, 0, 1, 1, 1,
-1.360704, 1.097082, -0.5658695, 1, 0, 0, 1, 1,
-1.345756, -0.9002083, -0.268354, 1, 0, 0, 1, 1,
-1.343879, 0.5071233, -0.1682231, 1, 0, 0, 1, 1,
-1.336829, 2.550584, -0.4517973, 1, 0, 0, 1, 1,
-1.330769, -0.6337686, -1.122491, 1, 0, 0, 1, 1,
-1.329602, 0.2673278, -2.663344, 0, 0, 0, 1, 1,
-1.320775, 0.09843954, -1.540587, 0, 0, 0, 1, 1,
-1.319179, 0.03532945, -0.7245, 0, 0, 0, 1, 1,
-1.317276, 0.05331207, -2.989338, 0, 0, 0, 1, 1,
-1.307816, 0.2030097, 0.2608881, 0, 0, 0, 1, 1,
-1.299614, -0.0167198, -0.2357215, 0, 0, 0, 1, 1,
-1.291937, 0.02670901, -4.491334, 0, 0, 0, 1, 1,
-1.284735, -1.232909, -2.039142, 1, 1, 1, 1, 1,
-1.282813, 0.489704, -2.405551, 1, 1, 1, 1, 1,
-1.276957, 0.1535139, -2.278174, 1, 1, 1, 1, 1,
-1.273186, -0.4927287, -0.6919829, 1, 1, 1, 1, 1,
-1.271219, -0.6374291, -2.275725, 1, 1, 1, 1, 1,
-1.261416, -1.248129, -2.477197, 1, 1, 1, 1, 1,
-1.256683, -0.07085273, -0.7386647, 1, 1, 1, 1, 1,
-1.249353, 0.5204431, -1.644132, 1, 1, 1, 1, 1,
-1.246914, -0.006935056, -1.680189, 1, 1, 1, 1, 1,
-1.241999, -0.09593572, -0.04497378, 1, 1, 1, 1, 1,
-1.219032, 1.242981, -1.047587, 1, 1, 1, 1, 1,
-1.218856, -1.860393, -2.340687, 1, 1, 1, 1, 1,
-1.212135, 0.1505896, -0.2037005, 1, 1, 1, 1, 1,
-1.197863, -1.555366, -2.532737, 1, 1, 1, 1, 1,
-1.197198, -0.9286969, -1.419233, 1, 1, 1, 1, 1,
-1.19585, -0.05451286, -1.086626, 0, 0, 1, 1, 1,
-1.193807, -0.2870595, -0.7761461, 1, 0, 0, 1, 1,
-1.190546, 1.101795, -0.9544235, 1, 0, 0, 1, 1,
-1.189738, 0.3483179, -3.015007, 1, 0, 0, 1, 1,
-1.18469, 0.9796659, -1.036724, 1, 0, 0, 1, 1,
-1.174748, -0.5257506, -3.848509, 1, 0, 0, 1, 1,
-1.172904, 1.524047, -1.785704, 0, 0, 0, 1, 1,
-1.172544, -2.190183, -2.980052, 0, 0, 0, 1, 1,
-1.17168, -1.746516, -1.692797, 0, 0, 0, 1, 1,
-1.170484, 0.6587119, -0.5401042, 0, 0, 0, 1, 1,
-1.163732, 0.06838449, 0.04717223, 0, 0, 0, 1, 1,
-1.1613, 1.231012, -1.236657, 0, 0, 0, 1, 1,
-1.160344, -0.1579387, -3.169432, 0, 0, 0, 1, 1,
-1.157648, 0.2380834, -2.523262, 1, 1, 1, 1, 1,
-1.155578, 0.002207429, -0.3257722, 1, 1, 1, 1, 1,
-1.148381, -0.1108466, -3.059848, 1, 1, 1, 1, 1,
-1.148198, -0.03853355, 0.04161353, 1, 1, 1, 1, 1,
-1.145535, -0.4888594, -2.052533, 1, 1, 1, 1, 1,
-1.14006, -0.07226166, -1.132597, 1, 1, 1, 1, 1,
-1.140006, -0.04365284, -0.5062163, 1, 1, 1, 1, 1,
-1.137912, 0.02365075, -1.629143, 1, 1, 1, 1, 1,
-1.1369, -1.032705, -2.570812, 1, 1, 1, 1, 1,
-1.135546, 1.932286, -0.6080055, 1, 1, 1, 1, 1,
-1.123666, 0.2096963, -1.901827, 1, 1, 1, 1, 1,
-1.121714, 1.338985, -0.5484374, 1, 1, 1, 1, 1,
-1.117555, -0.08436859, -0.67578, 1, 1, 1, 1, 1,
-1.116167, 0.1414037, -1.881526, 1, 1, 1, 1, 1,
-1.103903, -0.2524691, -1.849867, 1, 1, 1, 1, 1,
-1.098808, 0.3050905, 0.4272004, 0, 0, 1, 1, 1,
-1.098619, -0.7205266, -2.34981, 1, 0, 0, 1, 1,
-1.093187, -0.1895009, -3.020588, 1, 0, 0, 1, 1,
-1.090687, 0.416737, -0.534002, 1, 0, 0, 1, 1,
-1.087994, -0.3917131, -2.174188, 1, 0, 0, 1, 1,
-1.087337, 0.9281617, -1.191966, 1, 0, 0, 1, 1,
-1.086047, -0.4774468, -1.770743, 0, 0, 0, 1, 1,
-1.085692, 0.2438306, -0.3841152, 0, 0, 0, 1, 1,
-1.078904, 1.466636, 0.5604957, 0, 0, 0, 1, 1,
-1.071827, -0.4663156, -1.361644, 0, 0, 0, 1, 1,
-1.062961, -1.878393, -3.284873, 0, 0, 0, 1, 1,
-1.057573, -0.8925734, -2.026744, 0, 0, 0, 1, 1,
-1.05579, 1.033486, -0.8859099, 0, 0, 0, 1, 1,
-1.05493, 0.8019421, -1.840003, 1, 1, 1, 1, 1,
-1.053985, -0.1523536, -3.144819, 1, 1, 1, 1, 1,
-1.04838, -0.9228461, -3.786967, 1, 1, 1, 1, 1,
-1.04157, -0.6038269, -1.539671, 1, 1, 1, 1, 1,
-1.037645, -0.3525698, -0.5736202, 1, 1, 1, 1, 1,
-1.035732, -1.348075, -0.4830309, 1, 1, 1, 1, 1,
-1.035591, 0.4845978, -0.2187533, 1, 1, 1, 1, 1,
-1.018212, -0.1926428, -1.768059, 1, 1, 1, 1, 1,
-1.015818, -1.535531, -1.827354, 1, 1, 1, 1, 1,
-1.014035, 0.2426066, 1.003169, 1, 1, 1, 1, 1,
-1.013816, -0.6197816, -3.716477, 1, 1, 1, 1, 1,
-1.01255, -0.7619951, -3.340611, 1, 1, 1, 1, 1,
-1.009646, 0.5173085, -0.9581497, 1, 1, 1, 1, 1,
-1.007097, 1.382606, -1.167554, 1, 1, 1, 1, 1,
-1.006966, 0.4234394, -0.7096487, 1, 1, 1, 1, 1,
-0.9987682, 0.213861, -1.567862, 0, 0, 1, 1, 1,
-0.9906596, -1.869702, -0.2620552, 1, 0, 0, 1, 1,
-0.9858488, 0.3918904, -1.297686, 1, 0, 0, 1, 1,
-0.9857066, 2.109745, 0.05550247, 1, 0, 0, 1, 1,
-0.9856563, 0.3762032, -1.404714, 1, 0, 0, 1, 1,
-0.9826929, 0.8714901, 0.497804, 1, 0, 0, 1, 1,
-0.9745781, 1.198142, -0.759683, 0, 0, 0, 1, 1,
-0.9699611, 0.3945008, -3.233374, 0, 0, 0, 1, 1,
-0.9687722, 1.503854, -1.593363, 0, 0, 0, 1, 1,
-0.9660589, 0.9790968, -0.04575529, 0, 0, 0, 1, 1,
-0.9543251, 0.03011381, -2.634665, 0, 0, 0, 1, 1,
-0.9478818, -1.754868, -2.686967, 0, 0, 0, 1, 1,
-0.9421996, 0.1563225, -1.033528, 0, 0, 0, 1, 1,
-0.9389433, -0.3273982, -3.620199, 1, 1, 1, 1, 1,
-0.9346115, 0.7071007, -2.2957, 1, 1, 1, 1, 1,
-0.9339119, 0.02786391, -1.275212, 1, 1, 1, 1, 1,
-0.9333491, 1.395712, -1.699728, 1, 1, 1, 1, 1,
-0.9260418, 0.1047032, -1.550211, 1, 1, 1, 1, 1,
-0.9205295, 0.5125438, -2.673017, 1, 1, 1, 1, 1,
-0.9192744, 0.3747521, -2.655669, 1, 1, 1, 1, 1,
-0.9119531, 0.2549506, -1.178215, 1, 1, 1, 1, 1,
-0.911698, 0.3512524, -0.41109, 1, 1, 1, 1, 1,
-0.9067027, 0.6766248, -1.785702, 1, 1, 1, 1, 1,
-0.8837672, 0.6732016, -0.4778221, 1, 1, 1, 1, 1,
-0.8824073, 0.5590459, -2.111117, 1, 1, 1, 1, 1,
-0.8811647, 1.680377, -0.4212584, 1, 1, 1, 1, 1,
-0.8800758, -0.8603374, -2.094309, 1, 1, 1, 1, 1,
-0.8720592, 1.226466, 0.3070599, 1, 1, 1, 1, 1,
-0.8719075, -1.531947, -3.176286, 0, 0, 1, 1, 1,
-0.855185, -3.406099, -2.874117, 1, 0, 0, 1, 1,
-0.8508606, 1.380335, 1.259868, 1, 0, 0, 1, 1,
-0.8504429, -0.2733834, -1.584403, 1, 0, 0, 1, 1,
-0.8452337, 0.8337804, -0.3099201, 1, 0, 0, 1, 1,
-0.8411963, -0.9583033, -2.010898, 1, 0, 0, 1, 1,
-0.8391132, -0.6868925, -1.721112, 0, 0, 0, 1, 1,
-0.8386744, -0.7983228, -3.685394, 0, 0, 0, 1, 1,
-0.8330236, -0.09910721, -1.830196, 0, 0, 0, 1, 1,
-0.8313313, 0.6672381, -2.43568, 0, 0, 0, 1, 1,
-0.8310746, -0.1015881, -2.026375, 0, 0, 0, 1, 1,
-0.8303749, 0.3929811, -1.067856, 0, 0, 0, 1, 1,
-0.8270335, -0.09730687, -0.2112733, 0, 0, 0, 1, 1,
-0.8214314, 0.07285876, -2.909645, 1, 1, 1, 1, 1,
-0.820148, 1.179687, 0.08075388, 1, 1, 1, 1, 1,
-0.8149682, 0.77544, -0.3323337, 1, 1, 1, 1, 1,
-0.8088192, -0.1510039, -1.219082, 1, 1, 1, 1, 1,
-0.807221, -0.3722235, -2.218503, 1, 1, 1, 1, 1,
-0.8015561, 0.6573266, -1.665378, 1, 1, 1, 1, 1,
-0.7937829, -0.02806342, -1.023737, 1, 1, 1, 1, 1,
-0.7931075, 0.4703618, -0.9024337, 1, 1, 1, 1, 1,
-0.7929248, 1.353975, 0.2096604, 1, 1, 1, 1, 1,
-0.7917935, -0.8255964, -3.964806, 1, 1, 1, 1, 1,
-0.7890165, 1.105824, 0.3223813, 1, 1, 1, 1, 1,
-0.7854119, -0.4267505, -2.278204, 1, 1, 1, 1, 1,
-0.7819127, 0.09807834, -1.528304, 1, 1, 1, 1, 1,
-0.7793078, -0.05899631, -0.8844047, 1, 1, 1, 1, 1,
-0.7741011, -1.06154, -1.965533, 1, 1, 1, 1, 1,
-0.7648492, 1.166737, -0.6375768, 0, 0, 1, 1, 1,
-0.7635739, -0.2365613, -1.50159, 1, 0, 0, 1, 1,
-0.7630028, 1.333889, 0.1494981, 1, 0, 0, 1, 1,
-0.7626621, 1.15373, 1.095868, 1, 0, 0, 1, 1,
-0.7607442, -1.341418, -2.491466, 1, 0, 0, 1, 1,
-0.73836, 0.4227861, -1.589159, 1, 0, 0, 1, 1,
-0.737966, 0.1659551, -0.6053097, 0, 0, 0, 1, 1,
-0.7363489, -0.2621575, -3.781497, 0, 0, 0, 1, 1,
-0.7265269, -0.3567211, -2.13924, 0, 0, 0, 1, 1,
-0.7255316, 0.4488161, -2.057304, 0, 0, 0, 1, 1,
-0.7254326, 0.6305138, -1.017745, 0, 0, 0, 1, 1,
-0.7123612, 0.9784954, -0.3535309, 0, 0, 0, 1, 1,
-0.7095906, -0.2969694, -1.389422, 0, 0, 0, 1, 1,
-0.7046906, -0.5720643, -0.6416009, 1, 1, 1, 1, 1,
-0.7016387, 0.09563962, -0.7095803, 1, 1, 1, 1, 1,
-0.6932394, 1.116007, -1.036624, 1, 1, 1, 1, 1,
-0.6919191, 0.1858866, -0.4896562, 1, 1, 1, 1, 1,
-0.6916363, 0.9302651, -0.5448403, 1, 1, 1, 1, 1,
-0.6888475, 0.8117003, -0.630215, 1, 1, 1, 1, 1,
-0.6852535, 1.486183, -0.8276377, 1, 1, 1, 1, 1,
-0.6832719, 0.02609874, -0.8744812, 1, 1, 1, 1, 1,
-0.6801541, 1.587982, 0.2602519, 1, 1, 1, 1, 1,
-0.6795425, -1.098239, -4.204482, 1, 1, 1, 1, 1,
-0.6793487, -0.3013401, -1.55423, 1, 1, 1, 1, 1,
-0.6763598, 0.1798126, -3.022687, 1, 1, 1, 1, 1,
-0.6735502, 1.549242, -1.497765, 1, 1, 1, 1, 1,
-0.6734742, 0.7733141, -0.2380662, 1, 1, 1, 1, 1,
-0.6657979, 0.2531989, -1.377609, 1, 1, 1, 1, 1,
-0.6652268, -0.9805955, -2.261388, 0, 0, 1, 1, 1,
-0.6640719, -0.5359775, -1.625548, 1, 0, 0, 1, 1,
-0.6628445, -1.273654, -4.390231, 1, 0, 0, 1, 1,
-0.653492, -0.1628372, -2.188814, 1, 0, 0, 1, 1,
-0.6474327, 1.564049, 0.3473239, 1, 0, 0, 1, 1,
-0.6456057, -0.6434729, -1.506688, 1, 0, 0, 1, 1,
-0.6440768, 0.07346983, -0.08917012, 0, 0, 0, 1, 1,
-0.6292751, 0.1618429, -0.3453159, 0, 0, 0, 1, 1,
-0.6224716, 0.5105667, -0.90534, 0, 0, 0, 1, 1,
-0.6163178, 0.6199121, -1.692274, 0, 0, 0, 1, 1,
-0.6142414, -2.447038, -3.03317, 0, 0, 0, 1, 1,
-0.6131065, 0.1766509, 0.1612319, 0, 0, 0, 1, 1,
-0.6108672, -0.3749496, -1.135313, 0, 0, 0, 1, 1,
-0.6106786, -1.066726, -2.15626, 1, 1, 1, 1, 1,
-0.6088763, -0.6066254, -3.689029, 1, 1, 1, 1, 1,
-0.6077914, -1.34008, -0.9627894, 1, 1, 1, 1, 1,
-0.6072121, -0.4992771, -2.29542, 1, 1, 1, 1, 1,
-0.6068289, 0.7183306, -0.2868587, 1, 1, 1, 1, 1,
-0.6050435, -0.6670163, -1.618205, 1, 1, 1, 1, 1,
-0.5985034, -0.7316878, -2.682482, 1, 1, 1, 1, 1,
-0.5975092, -0.3065149, -0.6487371, 1, 1, 1, 1, 1,
-0.5924385, 0.899394, -0.4216338, 1, 1, 1, 1, 1,
-0.5923033, 0.2422307, -1.936879, 1, 1, 1, 1, 1,
-0.5913084, -0.9548442, -2.102748, 1, 1, 1, 1, 1,
-0.5911635, 1.914072, -1.438845, 1, 1, 1, 1, 1,
-0.5890853, 1.672925, -0.4833671, 1, 1, 1, 1, 1,
-0.5877137, -0.149069, -1.956877, 1, 1, 1, 1, 1,
-0.5862164, 0.8833995, -0.9950598, 1, 1, 1, 1, 1,
-0.586199, -1.171605, -2.591163, 0, 0, 1, 1, 1,
-0.5812452, 0.2563559, -1.275952, 1, 0, 0, 1, 1,
-0.5756609, -0.9022266, -3.629401, 1, 0, 0, 1, 1,
-0.5575969, 0.3694564, -1.665993, 1, 0, 0, 1, 1,
-0.5489722, 0.8660309, 0.4895557, 1, 0, 0, 1, 1,
-0.5414033, -0.4006036, -3.520686, 1, 0, 0, 1, 1,
-0.5409274, 2.064494, -2.512898, 0, 0, 0, 1, 1,
-0.5407823, -1.910492, -2.523181, 0, 0, 0, 1, 1,
-0.5384957, 1.387452, 0.07691474, 0, 0, 0, 1, 1,
-0.5380018, 0.4690663, -0.2857814, 0, 0, 0, 1, 1,
-0.5355264, 0.4028087, -1.527387, 0, 0, 0, 1, 1,
-0.5252326, -0.8050607, -2.463979, 0, 0, 0, 1, 1,
-0.5233073, -0.7660877, -0.1622915, 0, 0, 0, 1, 1,
-0.5190452, 1.264004, -1.76601, 1, 1, 1, 1, 1,
-0.518411, 2.822558, 0.7749443, 1, 1, 1, 1, 1,
-0.516475, 0.4744418, -1.600365, 1, 1, 1, 1, 1,
-0.5140938, -1.873655, -1.592283, 1, 1, 1, 1, 1,
-0.5127528, -0.7172641, -2.505305, 1, 1, 1, 1, 1,
-0.5104094, 0.5574457, 2.213169, 1, 1, 1, 1, 1,
-0.5087841, -1.536239, -1.674567, 1, 1, 1, 1, 1,
-0.4902594, 0.5833247, 0.8392817, 1, 1, 1, 1, 1,
-0.4876247, 0.9296649, -1.161788, 1, 1, 1, 1, 1,
-0.4809959, -0.8210316, -4.458239, 1, 1, 1, 1, 1,
-0.4807643, 1.063191, -1.071683, 1, 1, 1, 1, 1,
-0.4791315, 0.006892397, -0.241706, 1, 1, 1, 1, 1,
-0.4784304, 0.4303345, 0.03181822, 1, 1, 1, 1, 1,
-0.4734163, 0.7439771, -0.373533, 1, 1, 1, 1, 1,
-0.470143, -1.138099, -2.771713, 1, 1, 1, 1, 1,
-0.4690241, 0.2850578, 0.1551874, 0, 0, 1, 1, 1,
-0.4676552, 0.9968449, -0.1547349, 1, 0, 0, 1, 1,
-0.4599181, 1.44447, -0.9901032, 1, 0, 0, 1, 1,
-0.4568972, 1.879592, -1.031865, 1, 0, 0, 1, 1,
-0.4542445, 0.0170708, -2.223192, 1, 0, 0, 1, 1,
-0.4508645, -0.3844271, -3.48024, 1, 0, 0, 1, 1,
-0.4503761, 0.4863453, 0.2685362, 0, 0, 0, 1, 1,
-0.4459826, -0.9042385, -2.502013, 0, 0, 0, 1, 1,
-0.4440336, 1.053368, 0.1441304, 0, 0, 0, 1, 1,
-0.4417537, 1.888661, -1.214055, 0, 0, 0, 1, 1,
-0.4333355, 0.657663, -0.6219749, 0, 0, 0, 1, 1,
-0.4298064, 0.5646729, -0.01779274, 0, 0, 0, 1, 1,
-0.4271636, 0.3509182, -1.688362, 0, 0, 0, 1, 1,
-0.4269635, -0.08919664, -0.6910077, 1, 1, 1, 1, 1,
-0.4263193, -0.1669852, -3.005618, 1, 1, 1, 1, 1,
-0.4254188, 1.840896, -1.125699, 1, 1, 1, 1, 1,
-0.4239668, -1.185859, -3.484387, 1, 1, 1, 1, 1,
-0.4218938, -0.6421464, -2.674287, 1, 1, 1, 1, 1,
-0.4140319, -0.3591846, -4.376598, 1, 1, 1, 1, 1,
-0.4095108, 1.035166, 0.6604027, 1, 1, 1, 1, 1,
-0.4083897, -1.224147, -1.489453, 1, 1, 1, 1, 1,
-0.4066203, -0.9453465, -2.484318, 1, 1, 1, 1, 1,
-0.4053336, -0.1013155, -0.6573548, 1, 1, 1, 1, 1,
-0.4022724, -1.731059, -2.573096, 1, 1, 1, 1, 1,
-0.4004194, 0.7101564, -0.9064966, 1, 1, 1, 1, 1,
-0.4001223, 0.4014066, -1.127826, 1, 1, 1, 1, 1,
-0.3871394, -2.618903, -2.091706, 1, 1, 1, 1, 1,
-0.3862819, -0.9740833, -1.465603, 1, 1, 1, 1, 1,
-0.3812897, -1.342764, -1.164518, 0, 0, 1, 1, 1,
-0.3781879, -0.5485083, -2.61922, 1, 0, 0, 1, 1,
-0.3779539, 1.999584, -0.3783391, 1, 0, 0, 1, 1,
-0.3761671, -0.1003921, -1.294568, 1, 0, 0, 1, 1,
-0.3667403, 0.8605283, -1.586278, 1, 0, 0, 1, 1,
-0.3656433, 0.8741468, -1.478959, 1, 0, 0, 1, 1,
-0.3610188, -1.707698, -3.553415, 0, 0, 0, 1, 1,
-0.3595794, 0.7780742, -1.467968, 0, 0, 0, 1, 1,
-0.3527761, -0.02706143, -0.9391701, 0, 0, 0, 1, 1,
-0.3519884, -0.2448542, -2.087976, 0, 0, 0, 1, 1,
-0.3503117, 0.8390996, -0.4137229, 0, 0, 0, 1, 1,
-0.3492602, 0.5520419, -0.2968003, 0, 0, 0, 1, 1,
-0.3477937, -1.133817, -2.522236, 0, 0, 0, 1, 1,
-0.3426296, -0.3554062, -2.195889, 1, 1, 1, 1, 1,
-0.3374301, 0.3685986, -0.1564351, 1, 1, 1, 1, 1,
-0.3358411, -1.103842, -2.781917, 1, 1, 1, 1, 1,
-0.3331211, 1.245748, -0.8603027, 1, 1, 1, 1, 1,
-0.3315301, 0.6237314, -1.112198, 1, 1, 1, 1, 1,
-0.3246176, -1.290009, -1.898004, 1, 1, 1, 1, 1,
-0.3227109, -0.007723929, -1.11931, 1, 1, 1, 1, 1,
-0.3225588, 0.3775766, 1.825955, 1, 1, 1, 1, 1,
-0.3225139, 0.6113328, -0.3105616, 1, 1, 1, 1, 1,
-0.3192378, 0.6513742, -1.532051, 1, 1, 1, 1, 1,
-0.3174466, -1.449195, -3.800325, 1, 1, 1, 1, 1,
-0.3147066, -1.375754, -2.042632, 1, 1, 1, 1, 1,
-0.3143623, -2.130058, -4.363592, 1, 1, 1, 1, 1,
-0.3124816, -0.423766, -3.261913, 1, 1, 1, 1, 1,
-0.3124637, 1.086625, -0.7306691, 1, 1, 1, 1, 1,
-0.3106945, 0.3150828, -1.391399, 0, 0, 1, 1, 1,
-0.310085, 0.3469597, 0.5969611, 1, 0, 0, 1, 1,
-0.3083593, -1.147883, -2.311433, 1, 0, 0, 1, 1,
-0.3069918, -0.3990642, -2.474426, 1, 0, 0, 1, 1,
-0.3060082, -0.1913614, -1.828429, 1, 0, 0, 1, 1,
-0.2994989, 0.3248149, -0.08635787, 1, 0, 0, 1, 1,
-0.2802302, -0.809218, -1.408628, 0, 0, 0, 1, 1,
-0.2791983, 1.412584, 0.2833305, 0, 0, 0, 1, 1,
-0.2773167, -0.315512, -2.455496, 0, 0, 0, 1, 1,
-0.2768899, -1.460984, -4.88343, 0, 0, 0, 1, 1,
-0.2726043, -2.340055, -2.622497, 0, 0, 0, 1, 1,
-0.2704371, 0.5357367, -0.2507262, 0, 0, 0, 1, 1,
-0.2570685, -1.168376, -1.410988, 0, 0, 0, 1, 1,
-0.2507093, 1.686204, -0.09825627, 1, 1, 1, 1, 1,
-0.2452985, -0.1013216, -1.435353, 1, 1, 1, 1, 1,
-0.2422877, -0.1501903, -2.678373, 1, 1, 1, 1, 1,
-0.2400259, 0.5126432, -0.6753534, 1, 1, 1, 1, 1,
-0.2393804, 0.1112341, -1.569692, 1, 1, 1, 1, 1,
-0.2378045, -1.091845, -3.508944, 1, 1, 1, 1, 1,
-0.2370494, 0.9597691, -0.2767033, 1, 1, 1, 1, 1,
-0.2304359, 1.272835, -0.1296045, 1, 1, 1, 1, 1,
-0.2293062, 0.1849895, -1.717477, 1, 1, 1, 1, 1,
-0.2291854, -0.2642618, -0.7304479, 1, 1, 1, 1, 1,
-0.2281346, 0.856765, 0.9998906, 1, 1, 1, 1, 1,
-0.2185692, 0.04675532, -0.5809625, 1, 1, 1, 1, 1,
-0.2169388, 1.515104, 2.017045, 1, 1, 1, 1, 1,
-0.2156846, 0.5685368, 0.9467677, 1, 1, 1, 1, 1,
-0.2147456, -1.220775, -3.960554, 1, 1, 1, 1, 1,
-0.214143, 0.2092799, -1.887909, 0, 0, 1, 1, 1,
-0.2089678, -0.4979871, -0.7467437, 1, 0, 0, 1, 1,
-0.2032796, 0.349713, -0.02352395, 1, 0, 0, 1, 1,
-0.2018192, -0.1028079, -1.233992, 1, 0, 0, 1, 1,
-0.1917857, -0.04911428, -1.733004, 1, 0, 0, 1, 1,
-0.1893248, -0.7677832, -2.267776, 1, 0, 0, 1, 1,
-0.1855803, 0.9604462, -0.5775575, 0, 0, 0, 1, 1,
-0.1853284, 0.6009484, 0.5139227, 0, 0, 0, 1, 1,
-0.1790441, 1.556139, 0.9546996, 0, 0, 0, 1, 1,
-0.173555, -0.5211816, -2.686676, 0, 0, 0, 1, 1,
-0.1724512, 0.09782422, -1.55311, 0, 0, 0, 1, 1,
-0.1713234, 1.681499, -1.681326, 0, 0, 0, 1, 1,
-0.1702105, 0.7299629, 0.1242996, 0, 0, 0, 1, 1,
-0.1697067, -0.4409239, -3.029552, 1, 1, 1, 1, 1,
-0.1650437, -0.7749093, -2.024452, 1, 1, 1, 1, 1,
-0.1625715, -0.1906227, -2.331877, 1, 1, 1, 1, 1,
-0.1599245, 1.048421, -1.435073, 1, 1, 1, 1, 1,
-0.1590016, 1.365038, 1.400826, 1, 1, 1, 1, 1,
-0.1565305, -1.282322, -1.4969, 1, 1, 1, 1, 1,
-0.1560428, -0.4248275, -3.532623, 1, 1, 1, 1, 1,
-0.153241, 0.5485185, -1.31709, 1, 1, 1, 1, 1,
-0.1486805, -1.22017, -2.189482, 1, 1, 1, 1, 1,
-0.1486033, 0.001905177, -2.25454, 1, 1, 1, 1, 1,
-0.1356116, -0.2672239, -4.539563, 1, 1, 1, 1, 1,
-0.1330482, 3.409044, 0.4789672, 1, 1, 1, 1, 1,
-0.1288435, -1.68961, -2.371498, 1, 1, 1, 1, 1,
-0.1286176, -0.7497746, -4.756869, 1, 1, 1, 1, 1,
-0.1263534, 0.4603496, -0.5092649, 1, 1, 1, 1, 1,
-0.1254766, -0.04873138, -2.261659, 0, 0, 1, 1, 1,
-0.1219447, -1.405894, -1.714477, 1, 0, 0, 1, 1,
-0.1218413, -0.2428809, -2.924277, 1, 0, 0, 1, 1,
-0.1207913, -1.503142, -2.945776, 1, 0, 0, 1, 1,
-0.1170965, 1.894746, -0.4109066, 1, 0, 0, 1, 1,
-0.1139331, -1.330452, -4.86455, 1, 0, 0, 1, 1,
-0.1124785, 0.07850599, -0.4361142, 0, 0, 0, 1, 1,
-0.1083351, -1.550107, -2.19367, 0, 0, 0, 1, 1,
-0.1070753, -1.506865, -4.369392, 0, 0, 0, 1, 1,
-0.1016789, 0.612628, -0.276837, 0, 0, 0, 1, 1,
-0.0985575, 0.5885417, -0.4839694, 0, 0, 0, 1, 1,
-0.09765685, 0.3866731, 0.2058418, 0, 0, 0, 1, 1,
-0.09538103, 0.2103162, 0.2338251, 0, 0, 0, 1, 1,
-0.09240758, 2.042599, -0.3267863, 1, 1, 1, 1, 1,
-0.09237392, -0.333213, -1.928454, 1, 1, 1, 1, 1,
-0.09018595, -0.6290373, -3.990224, 1, 1, 1, 1, 1,
-0.08530004, -0.4958452, -2.484047, 1, 1, 1, 1, 1,
-0.08250446, 0.3553854, 0.03722223, 1, 1, 1, 1, 1,
-0.07754482, 0.1771595, -0.1657053, 1, 1, 1, 1, 1,
-0.07624883, -0.3773954, -3.041637, 1, 1, 1, 1, 1,
-0.07086854, -0.2884445, -3.173885, 1, 1, 1, 1, 1,
-0.0686681, -0.406895, -3.047898, 1, 1, 1, 1, 1,
-0.06532585, -1.186927, -2.518814, 1, 1, 1, 1, 1,
-0.06379349, 0.1440874, 0.3413292, 1, 1, 1, 1, 1,
-0.05795238, -1.082823, -5.173052, 1, 1, 1, 1, 1,
-0.05646978, -2.035714, -1.805214, 1, 1, 1, 1, 1,
-0.05543803, -0.898762, -2.237699, 1, 1, 1, 1, 1,
-0.05434076, -0.49523, -2.920365, 1, 1, 1, 1, 1,
-0.05146539, 0.436593, -0.3199036, 0, 0, 1, 1, 1,
-0.04618011, 0.7711144, 0.278531, 1, 0, 0, 1, 1,
-0.04128028, 0.8596391, -1.00953, 1, 0, 0, 1, 1,
-0.04103972, 0.3453582, -0.2183269, 1, 0, 0, 1, 1,
-0.03622222, -0.007898394, -0.2268408, 1, 0, 0, 1, 1,
-0.0354629, 0.2286794, -1.856271, 1, 0, 0, 1, 1,
-0.0342771, 0.5461495, 0.3869218, 0, 0, 0, 1, 1,
-0.03257986, -2.655932, -4.715796, 0, 0, 0, 1, 1,
-0.02984431, -0.4531268, -1.1741, 0, 0, 0, 1, 1,
-0.02520289, 1.255667, -2.507338, 0, 0, 0, 1, 1,
-0.02329321, 0.6532511, -0.5745038, 0, 0, 0, 1, 1,
-0.02076389, 0.493356, -1.181871, 0, 0, 0, 1, 1,
-0.01827286, 0.850188, -0.03360217, 0, 0, 0, 1, 1,
-0.01723956, -0.2105968, -1.88245, 1, 1, 1, 1, 1,
-0.01585758, -0.651401, -2.427471, 1, 1, 1, 1, 1,
-0.009009585, 0.316385, -1.377848, 1, 1, 1, 1, 1,
-0.006623213, 0.9323199, 0.8492253, 1, 1, 1, 1, 1,
-0.006379106, -0.7694671, -2.457732, 1, 1, 1, 1, 1,
-0.006035551, 1.009525, -1.517084, 1, 1, 1, 1, 1,
0.001021771, 0.8185301, 1.89103, 1, 1, 1, 1, 1,
0.00500549, -1.163176, 3.014576, 1, 1, 1, 1, 1,
0.007285064, 1.590674, -1.314098, 1, 1, 1, 1, 1,
0.00929419, 1.256914, -0.4135022, 1, 1, 1, 1, 1,
0.01526916, -1.323638, 0.5397803, 1, 1, 1, 1, 1,
0.01557954, 2.540559, -0.9206473, 1, 1, 1, 1, 1,
0.01665163, -0.3980014, 3.385638, 1, 1, 1, 1, 1,
0.01932634, -3.265708, 2.647417, 1, 1, 1, 1, 1,
0.02431197, -2.641461, 3.080404, 1, 1, 1, 1, 1,
0.02846894, -1.007964, 4.029487, 0, 0, 1, 1, 1,
0.02921654, -0.158712, 2.276023, 1, 0, 0, 1, 1,
0.03390241, -0.1350839, 1.524552, 1, 0, 0, 1, 1,
0.03804341, -1.890294, 3.230364, 1, 0, 0, 1, 1,
0.0417558, 0.171725, 0.1466928, 1, 0, 0, 1, 1,
0.04803799, 1.061471, -0.7152723, 1, 0, 0, 1, 1,
0.05050527, 0.9231189, 0.4339491, 0, 0, 0, 1, 1,
0.05066827, 0.589821, -0.7876298, 0, 0, 0, 1, 1,
0.05117983, 1.713989, -1.823449, 0, 0, 0, 1, 1,
0.05271586, 0.09852611, 0.129749, 0, 0, 0, 1, 1,
0.05279614, -0.666118, 4.684272, 0, 0, 0, 1, 1,
0.05725378, 0.3423803, 0.5529041, 0, 0, 0, 1, 1,
0.05866209, -0.3630483, 4.052987, 0, 0, 0, 1, 1,
0.05974359, -0.525602, 3.129358, 1, 1, 1, 1, 1,
0.06785167, 2.217923, -0.09023421, 1, 1, 1, 1, 1,
0.06833774, 1.371322, 0.5209131, 1, 1, 1, 1, 1,
0.07210674, 1.25412, -1.077433, 1, 1, 1, 1, 1,
0.0738169, 0.6165034, 1.380847, 1, 1, 1, 1, 1,
0.07462327, -0.3775829, 2.366691, 1, 1, 1, 1, 1,
0.07837077, 0.5595757, 0.7012635, 1, 1, 1, 1, 1,
0.08126134, 1.289722, 0.2207911, 1, 1, 1, 1, 1,
0.08358029, -1.795131, 3.541224, 1, 1, 1, 1, 1,
0.09756143, 0.6165709, 1.148468, 1, 1, 1, 1, 1,
0.1016838, -0.1441613, 2.347525, 1, 1, 1, 1, 1,
0.1059684, -0.1406284, 1.546196, 1, 1, 1, 1, 1,
0.1059937, -0.4009314, 2.300311, 1, 1, 1, 1, 1,
0.1068176, -0.5548701, 2.501843, 1, 1, 1, 1, 1,
0.1173143, -0.1126273, 3.104243, 1, 1, 1, 1, 1,
0.1174682, -0.1252263, 2.036427, 0, 0, 1, 1, 1,
0.1198022, -1.185246, 2.370302, 1, 0, 0, 1, 1,
0.1217599, -1.302176, 1.352031, 1, 0, 0, 1, 1,
0.1243962, -0.5021342, 3.13431, 1, 0, 0, 1, 1,
0.1299738, -0.2426405, 1.711066, 1, 0, 0, 1, 1,
0.1310932, -0.6421672, 3.068911, 1, 0, 0, 1, 1,
0.1331599, -0.0531412, 2.204238, 0, 0, 0, 1, 1,
0.1343548, -1.272909, 1.662151, 0, 0, 0, 1, 1,
0.1344118, -0.611267, 3.110961, 0, 0, 0, 1, 1,
0.1350714, 0.2981389, 0.5256592, 0, 0, 0, 1, 1,
0.1358019, 0.5706275, 0.6111039, 0, 0, 0, 1, 1,
0.1364729, -0.948256, 4.114388, 0, 0, 0, 1, 1,
0.1423965, -0.6648709, 4.375863, 0, 0, 0, 1, 1,
0.1427643, -1.258002, 4.830382, 1, 1, 1, 1, 1,
0.146301, 2.138965, -0.1622164, 1, 1, 1, 1, 1,
0.1503884, -0.946461, 5.414301, 1, 1, 1, 1, 1,
0.1545932, 0.4610033, -0.3777671, 1, 1, 1, 1, 1,
0.1559934, 0.2623982, 0.8538177, 1, 1, 1, 1, 1,
0.156887, -1.503655, 3.038065, 1, 1, 1, 1, 1,
0.162217, 0.8926595, -0.1639378, 1, 1, 1, 1, 1,
0.1742367, 0.7050625, -0.693395, 1, 1, 1, 1, 1,
0.1753484, 0.6299668, 0.2718662, 1, 1, 1, 1, 1,
0.1813688, 1.969258, 0.5787564, 1, 1, 1, 1, 1,
0.1912451, -0.1340319, 4.006326, 1, 1, 1, 1, 1,
0.1916499, -1.324728, 3.384307, 1, 1, 1, 1, 1,
0.1939024, 1.256008, 0.0965635, 1, 1, 1, 1, 1,
0.1951341, 0.7192522, 0.3267497, 1, 1, 1, 1, 1,
0.1956442, 0.4201925, 0.2622401, 1, 1, 1, 1, 1,
0.1970177, -1.15131, 4.334068, 0, 0, 1, 1, 1,
0.1982859, 1.90547, -0.4621377, 1, 0, 0, 1, 1,
0.2019854, -1.054005, 2.65742, 1, 0, 0, 1, 1,
0.2048581, -0.6081285, 2.43559, 1, 0, 0, 1, 1,
0.208267, -0.6470346, 4.064922, 1, 0, 0, 1, 1,
0.2093699, -1.217811, 3.441713, 1, 0, 0, 1, 1,
0.2161678, -0.3287934, 1.907416, 0, 0, 0, 1, 1,
0.216637, -0.09222627, 2.03693, 0, 0, 0, 1, 1,
0.2187607, -1.711691, 2.861564, 0, 0, 0, 1, 1,
0.2220555, 0.7846938, 2.650122, 0, 0, 0, 1, 1,
0.2222954, 0.3312613, -0.2429613, 0, 0, 0, 1, 1,
0.2226709, 1.226895, -0.406446, 0, 0, 0, 1, 1,
0.2260452, 0.721427, 0.7212925, 0, 0, 0, 1, 1,
0.2311599, 0.01620952, 3.121058, 1, 1, 1, 1, 1,
0.2339106, 0.5654024, -2.503795, 1, 1, 1, 1, 1,
0.2353927, 0.5866899, 0.770561, 1, 1, 1, 1, 1,
0.23545, -1.165814, 3.04129, 1, 1, 1, 1, 1,
0.2400979, 0.08547131, 1.844694, 1, 1, 1, 1, 1,
0.2406349, 0.09440943, 1.232632, 1, 1, 1, 1, 1,
0.2422058, 0.5770739, 1.252536, 1, 1, 1, 1, 1,
0.2436271, -0.2817627, 3.21526, 1, 1, 1, 1, 1,
0.2440938, -0.9621282, 4.670413, 1, 1, 1, 1, 1,
0.2442145, 0.8879624, -1.048747, 1, 1, 1, 1, 1,
0.2450013, 0.1397514, 1.380806, 1, 1, 1, 1, 1,
0.2489238, -0.7996389, 1.882002, 1, 1, 1, 1, 1,
0.2495662, -0.472514, 2.928727, 1, 1, 1, 1, 1,
0.2501393, 1.640565, -0.4336239, 1, 1, 1, 1, 1,
0.2510457, -1.868972, 3.34095, 1, 1, 1, 1, 1,
0.2515952, -0.4018178, 2.339741, 0, 0, 1, 1, 1,
0.2536613, 1.187362, -1.826462, 1, 0, 0, 1, 1,
0.2587492, 1.169001, -0.01310641, 1, 0, 0, 1, 1,
0.2651977, -1.536795, 2.403634, 1, 0, 0, 1, 1,
0.26711, 1.433558, 0.4614988, 1, 0, 0, 1, 1,
0.2674239, -0.8100212, 3.885216, 1, 0, 0, 1, 1,
0.2694312, 0.1758035, 1.659292, 0, 0, 0, 1, 1,
0.2723918, 2.058517, -0.3314845, 0, 0, 0, 1, 1,
0.2755617, -1.563962, 2.284971, 0, 0, 0, 1, 1,
0.2758994, 0.1001713, 2.102992, 0, 0, 0, 1, 1,
0.2767511, 0.8670554, -0.9838485, 0, 0, 0, 1, 1,
0.2795917, 0.2050054, -1.13319, 0, 0, 0, 1, 1,
0.2799239, 1.337461, 0.7025897, 0, 0, 0, 1, 1,
0.2808821, 1.99323, 0.8118751, 1, 1, 1, 1, 1,
0.2813925, 0.6801618, -0.7595811, 1, 1, 1, 1, 1,
0.2819099, 0.6184625, -0.8380507, 1, 1, 1, 1, 1,
0.2838115, 1.529032, -0.08179633, 1, 1, 1, 1, 1,
0.287309, 0.1985983, 1.581231, 1, 1, 1, 1, 1,
0.2941621, -0.1700985, 2.333395, 1, 1, 1, 1, 1,
0.2954133, -0.670014, 3.214252, 1, 1, 1, 1, 1,
0.2967482, -0.6138582, 3.486253, 1, 1, 1, 1, 1,
0.2976811, 0.424221, 1.996214, 1, 1, 1, 1, 1,
0.3008254, -0.4797879, 2.053766, 1, 1, 1, 1, 1,
0.3044456, -0.3989469, 3.652399, 1, 1, 1, 1, 1,
0.3065255, -0.1575472, 0.9530385, 1, 1, 1, 1, 1,
0.3084427, 0.4659844, 0.1264733, 1, 1, 1, 1, 1,
0.3085912, 0.3705424, 1.607913, 1, 1, 1, 1, 1,
0.3112204, 0.3848552, 1.802176, 1, 1, 1, 1, 1,
0.3115209, -0.1017716, 2.039694, 0, 0, 1, 1, 1,
0.312893, 1.475991, -0.01501306, 1, 0, 0, 1, 1,
0.3190805, -0.3463914, 2.848615, 1, 0, 0, 1, 1,
0.3190994, 0.8466411, 0.9358872, 1, 0, 0, 1, 1,
0.3206969, -0.9850665, 3.104442, 1, 0, 0, 1, 1,
0.3243364, -1.002784, 3.165341, 1, 0, 0, 1, 1,
0.324823, -0.4615191, 2.748276, 0, 0, 0, 1, 1,
0.3255721, -0.9576885, 4.574094, 0, 0, 0, 1, 1,
0.3300021, 1.145535, 0.4684511, 0, 0, 0, 1, 1,
0.3300156, -0.2636744, 2.04016, 0, 0, 0, 1, 1,
0.3311329, 0.3789178, 0.2757634, 0, 0, 0, 1, 1,
0.3326761, 1.740481, -1.02008, 0, 0, 0, 1, 1,
0.3332528, 0.8478417, 0.8960847, 0, 0, 0, 1, 1,
0.3366286, 0.2225599, 0.8574943, 1, 1, 1, 1, 1,
0.3379877, 1.075719, -0.2473228, 1, 1, 1, 1, 1,
0.3435958, 1.44132, 1.095338, 1, 1, 1, 1, 1,
0.3449425, 0.1870064, 1.453133, 1, 1, 1, 1, 1,
0.3451011, -1.376344, 4.121279, 1, 1, 1, 1, 1,
0.3482352, 0.1375941, 1.166989, 1, 1, 1, 1, 1,
0.3482551, 0.59429, 0.1469422, 1, 1, 1, 1, 1,
0.3515306, 0.7095474, 0.5870237, 1, 1, 1, 1, 1,
0.3519261, 0.7679814, 2.412119, 1, 1, 1, 1, 1,
0.352215, 0.32592, -0.1343201, 1, 1, 1, 1, 1,
0.3544215, 0.9206719, 0.4466963, 1, 1, 1, 1, 1,
0.3555751, 0.5056093, -0.4633062, 1, 1, 1, 1, 1,
0.3582179, -0.402151, 1.455634, 1, 1, 1, 1, 1,
0.3593568, -0.7280885, 1.789195, 1, 1, 1, 1, 1,
0.3674617, 0.1470262, 1.275425, 1, 1, 1, 1, 1,
0.3681414, 0.4854684, 0.6972626, 0, 0, 1, 1, 1,
0.3715395, -1.193323, 3.479611, 1, 0, 0, 1, 1,
0.377203, -0.8948693, 3.251193, 1, 0, 0, 1, 1,
0.3804577, 0.04672654, 0.2353209, 1, 0, 0, 1, 1,
0.3805075, -0.7794259, 2.129782, 1, 0, 0, 1, 1,
0.3882055, -1.265681, 4.978411, 1, 0, 0, 1, 1,
0.3973779, 1.172541, 0.574645, 0, 0, 0, 1, 1,
0.3987555, 1.60264, 0.349374, 0, 0, 0, 1, 1,
0.3999456, -0.216385, 2.32258, 0, 0, 0, 1, 1,
0.4002063, -0.6644759, 4.470062, 0, 0, 0, 1, 1,
0.4033943, -1.421408, 1.319517, 0, 0, 0, 1, 1,
0.4048652, -0.5523669, 3.303004, 0, 0, 0, 1, 1,
0.4080251, -0.7372949, 2.888591, 0, 0, 0, 1, 1,
0.4112027, 0.2857749, 0.4171221, 1, 1, 1, 1, 1,
0.4122624, 0.1499141, 2.057321, 1, 1, 1, 1, 1,
0.4123046, 0.2406229, 0.9332349, 1, 1, 1, 1, 1,
0.4153828, 1.905723, 1.582916, 1, 1, 1, 1, 1,
0.4177207, 0.05469894, 1.25836, 1, 1, 1, 1, 1,
0.4189696, -0.1280491, 2.268365, 1, 1, 1, 1, 1,
0.4194764, 0.2745977, 0.1799009, 1, 1, 1, 1, 1,
0.423304, 0.7917868, 0.8118066, 1, 1, 1, 1, 1,
0.4282854, 0.2606993, 1.619035, 1, 1, 1, 1, 1,
0.4319061, 2.142319, 1.140852, 1, 1, 1, 1, 1,
0.4333307, -1.707767, 3.081472, 1, 1, 1, 1, 1,
0.4336016, -0.4151933, 0.7611543, 1, 1, 1, 1, 1,
0.4409841, 0.3125232, 0.6522996, 1, 1, 1, 1, 1,
0.4426341, 1.99109, 0.2089706, 1, 1, 1, 1, 1,
0.4440316, -0.7276395, 2.448452, 1, 1, 1, 1, 1,
0.4457757, -1.14733, 4.073654, 0, 0, 1, 1, 1,
0.4466866, 0.7477408, 0.5332088, 1, 0, 0, 1, 1,
0.4525685, 0.2860372, 0.1483652, 1, 0, 0, 1, 1,
0.4531063, -1.026017, 2.971205, 1, 0, 0, 1, 1,
0.4537046, 1.57408, 1.054245, 1, 0, 0, 1, 1,
0.4571467, -1.232269, 2.367111, 1, 0, 0, 1, 1,
0.4594399, -0.3682218, 0.6948317, 0, 0, 0, 1, 1,
0.4626023, 0.08209658, 0.8461871, 0, 0, 0, 1, 1,
0.4630903, 0.9472957, 0.05198291, 0, 0, 0, 1, 1,
0.4657592, -0.2685285, 1.158228, 0, 0, 0, 1, 1,
0.4675106, -0.3602714, 1.793486, 0, 0, 0, 1, 1,
0.4758002, 0.1714184, 1.902102, 0, 0, 0, 1, 1,
0.4763717, -0.3100487, 1.850426, 0, 0, 0, 1, 1,
0.4777179, 0.285446, 0.1607581, 1, 1, 1, 1, 1,
0.4777355, -1.081102, 4.590685, 1, 1, 1, 1, 1,
0.478311, 0.5397395, -0.2960405, 1, 1, 1, 1, 1,
0.4794704, -1.960125, 2.555076, 1, 1, 1, 1, 1,
0.4847791, 0.2695654, 1.639339, 1, 1, 1, 1, 1,
0.4873971, -0.494221, 2.278378, 1, 1, 1, 1, 1,
0.4895157, -1.423629, 3.357272, 1, 1, 1, 1, 1,
0.4900328, -0.6619265, 2.936937, 1, 1, 1, 1, 1,
0.4904497, 0.4220723, 0.4044487, 1, 1, 1, 1, 1,
0.4943493, 0.7963577, 0.6801665, 1, 1, 1, 1, 1,
0.4955316, -0.05291107, 3.772972, 1, 1, 1, 1, 1,
0.4981397, 1.691287, -1.033462, 1, 1, 1, 1, 1,
0.4983859, 0.7035583, -1.135068, 1, 1, 1, 1, 1,
0.5078222, 0.1489935, 0.9761197, 1, 1, 1, 1, 1,
0.5080566, 1.778791, 0.5216842, 1, 1, 1, 1, 1,
0.5081792, 1.089745, 0.7920475, 0, 0, 1, 1, 1,
0.5123257, -0.8716041, 1.723232, 1, 0, 0, 1, 1,
0.5125279, 0.3723855, 2.579133, 1, 0, 0, 1, 1,
0.519141, 0.6803782, 1.616049, 1, 0, 0, 1, 1,
0.5206773, -0.7989939, 1.536814, 1, 0, 0, 1, 1,
0.5215592, 2.041521, -1.346302, 1, 0, 0, 1, 1,
0.5216828, -0.1440136, 2.346863, 0, 0, 0, 1, 1,
0.5223019, -0.1190843, 0.2102847, 0, 0, 0, 1, 1,
0.5229222, 1.26362, 0.2535512, 0, 0, 0, 1, 1,
0.5368022, 0.3513677, 0.01048181, 0, 0, 0, 1, 1,
0.5420313, -0.5536749, 2.964645, 0, 0, 0, 1, 1,
0.5438607, 1.288557, 0.8620275, 0, 0, 0, 1, 1,
0.5440551, -0.3000974, 2.035213, 0, 0, 0, 1, 1,
0.5502742, 0.1463086, -0.5808005, 1, 1, 1, 1, 1,
0.5527362, 0.1200242, -0.2549563, 1, 1, 1, 1, 1,
0.5529147, -0.1049499, 0.8658041, 1, 1, 1, 1, 1,
0.5529709, -1.208611, 2.784939, 1, 1, 1, 1, 1,
0.5562868, -0.6010228, 3.794822, 1, 1, 1, 1, 1,
0.5615909, -0.399916, 1.393211, 1, 1, 1, 1, 1,
0.5627099, 0.5924682, -0.3580862, 1, 1, 1, 1, 1,
0.5652171, -1.655957, 2.056577, 1, 1, 1, 1, 1,
0.5656646, -0.02000075, -0.9657719, 1, 1, 1, 1, 1,
0.5665687, 2.371281, 1.459858, 1, 1, 1, 1, 1,
0.5683837, -2.494808, 2.834708, 1, 1, 1, 1, 1,
0.5686024, 0.6086752, 0.0441974, 1, 1, 1, 1, 1,
0.5718679, -1.091657, 2.756675, 1, 1, 1, 1, 1,
0.5751601, -0.4498219, 2.210165, 1, 1, 1, 1, 1,
0.5800747, 0.6499597, 0.7873713, 1, 1, 1, 1, 1,
0.5806559, -0.4453156, 2.130311, 0, 0, 1, 1, 1,
0.5832351, -0.2182797, 2.283163, 1, 0, 0, 1, 1,
0.5863571, -0.4615486, 3.6302, 1, 0, 0, 1, 1,
0.5880176, 0.8278, 1.423555, 1, 0, 0, 1, 1,
0.5883672, 0.2776303, 1.155596, 1, 0, 0, 1, 1,
0.5883704, 0.2944597, 0.2384956, 1, 0, 0, 1, 1,
0.5905861, 0.7190346, 1.473028, 0, 0, 0, 1, 1,
0.5916988, -0.7816437, 3.946983, 0, 0, 0, 1, 1,
0.5919896, 1.423612, -0.32025, 0, 0, 0, 1, 1,
0.6024379, -2.080472, 3.626968, 0, 0, 0, 1, 1,
0.6040346, -0.2826912, 1.187629, 0, 0, 0, 1, 1,
0.6059381, -0.3503998, 2.629833, 0, 0, 0, 1, 1,
0.60766, 0.3139607, 2.224695, 0, 0, 0, 1, 1,
0.6112236, 0.581706, -0.6644257, 1, 1, 1, 1, 1,
0.613521, 0.08045717, 0.6784469, 1, 1, 1, 1, 1,
0.6141976, -0.2418941, 1.915907, 1, 1, 1, 1, 1,
0.616596, 1.806562, 1.363858, 1, 1, 1, 1, 1,
0.6206406, -0.571043, 3.108854, 1, 1, 1, 1, 1,
0.6215063, -0.3700676, 1.89562, 1, 1, 1, 1, 1,
0.6240044, 2.346259, 1.282529, 1, 1, 1, 1, 1,
0.6268983, -1.097333, 3.52574, 1, 1, 1, 1, 1,
0.6302601, -1.019009, 2.483411, 1, 1, 1, 1, 1,
0.6321335, 0.5891709, 3.585234, 1, 1, 1, 1, 1,
0.633837, 0.01765207, 1.758784, 1, 1, 1, 1, 1,
0.6348387, 0.8305871, -0.5535318, 1, 1, 1, 1, 1,
0.6387706, 0.1724847, 2.040115, 1, 1, 1, 1, 1,
0.6388505, -0.3946328, 0.7517205, 1, 1, 1, 1, 1,
0.6396461, 0.7888011, 0.8488506, 1, 1, 1, 1, 1,
0.6425171, -1.355304, 3.653043, 0, 0, 1, 1, 1,
0.6453508, -2.304981, 4.262088, 1, 0, 0, 1, 1,
0.6480405, 0.6607246, 0.9379256, 1, 0, 0, 1, 1,
0.6570752, -0.5076961, 2.442812, 1, 0, 0, 1, 1,
0.6677237, -2.373924, 3.349233, 1, 0, 0, 1, 1,
0.6684065, 0.3089897, -0.1367317, 1, 0, 0, 1, 1,
0.6716765, -0.3829382, 3.549768, 0, 0, 0, 1, 1,
0.6726691, 0.2505591, 2.5428, 0, 0, 0, 1, 1,
0.6751699, -0.410263, 2.532045, 0, 0, 0, 1, 1,
0.6753572, -1.064287, 1.848169, 0, 0, 0, 1, 1,
0.6788013, 0.6176313, 1.262514, 0, 0, 0, 1, 1,
0.6812266, -0.453049, 3.033745, 0, 0, 0, 1, 1,
0.6822791, -1.463255, 2.02261, 0, 0, 0, 1, 1,
0.6830634, 0.4577851, -1.39619, 1, 1, 1, 1, 1,
0.6843745, -1.285225, 2.935148, 1, 1, 1, 1, 1,
0.6871518, 0.9643528, -1.37169, 1, 1, 1, 1, 1,
0.6879603, -0.2008952, 3.309401, 1, 1, 1, 1, 1,
0.6979914, -0.006203288, 1.536257, 1, 1, 1, 1, 1,
0.6991389, 0.6194788, 1.0283, 1, 1, 1, 1, 1,
0.699971, 0.7613605, 1.008111, 1, 1, 1, 1, 1,
0.7011118, 0.3787341, 2.470778, 1, 1, 1, 1, 1,
0.7012092, 0.4278485, 1.183963, 1, 1, 1, 1, 1,
0.7015826, 1.607747, 0.9337933, 1, 1, 1, 1, 1,
0.7040725, 1.36922, -0.2508131, 1, 1, 1, 1, 1,
0.7050631, 1.222762, -0.2157209, 1, 1, 1, 1, 1,
0.7109915, 1.080738, 1.501453, 1, 1, 1, 1, 1,
0.7110231, -0.170307, 2.076744, 1, 1, 1, 1, 1,
0.7132486, -0.6264617, 0.8798605, 1, 1, 1, 1, 1,
0.7140995, -0.3203248, 2.253788, 0, 0, 1, 1, 1,
0.7173001, -0.8401905, 3.992116, 1, 0, 0, 1, 1,
0.7182214, 1.070989, 0.5178747, 1, 0, 0, 1, 1,
0.7199582, 0.2056085, 0.8839105, 1, 0, 0, 1, 1,
0.7204703, -0.6592656, 3.061496, 1, 0, 0, 1, 1,
0.7217116, 1.59481, 0.4750778, 1, 0, 0, 1, 1,
0.7326912, -0.2542033, 2.185646, 0, 0, 0, 1, 1,
0.7348128, 1.510159, 0.7159849, 0, 0, 0, 1, 1,
0.7394655, -0.6277329, 3.162865, 0, 0, 0, 1, 1,
0.7425117, 0.688678, -0.5458854, 0, 0, 0, 1, 1,
0.745144, 0.9879299, 1.002712, 0, 0, 0, 1, 1,
0.7529542, -2.897798, 2.018615, 0, 0, 0, 1, 1,
0.7613673, 0.2238731, 0.752296, 0, 0, 0, 1, 1,
0.761862, -1.872907, 2.009009, 1, 1, 1, 1, 1,
0.7691822, -0.03250869, 2.287558, 1, 1, 1, 1, 1,
0.7715089, -0.1565371, 2.029729, 1, 1, 1, 1, 1,
0.7729498, 3.038832, -0.6485043, 1, 1, 1, 1, 1,
0.7730826, 1.692186, 0.4152227, 1, 1, 1, 1, 1,
0.7799944, -0.3192539, 2.327023, 1, 1, 1, 1, 1,
0.7822946, 0.5814291, 0.6637332, 1, 1, 1, 1, 1,
0.7906771, -1.739035, 3.675208, 1, 1, 1, 1, 1,
0.7914358, 0.2084967, 0.9072647, 1, 1, 1, 1, 1,
0.7941226, 0.5523325, 1.128663, 1, 1, 1, 1, 1,
0.7967856, 0.4103089, 1.673251, 1, 1, 1, 1, 1,
0.7976152, 1.914062, 2.423696, 1, 1, 1, 1, 1,
0.8046393, -0.0262622, 1.592208, 1, 1, 1, 1, 1,
0.8103766, -1.191248, 1.686725, 1, 1, 1, 1, 1,
0.8141301, -1.9548, 2.479779, 1, 1, 1, 1, 1,
0.8148816, -1.732597, 3.532511, 0, 0, 1, 1, 1,
0.8163326, 1.536247, 1.865572, 1, 0, 0, 1, 1,
0.822794, -0.184667, 1.93758, 1, 0, 0, 1, 1,
0.823855, -0.9472305, 2.559088, 1, 0, 0, 1, 1,
0.8299545, 0.5713995, 0.8907565, 1, 0, 0, 1, 1,
0.8327486, -0.74411, 2.063649, 1, 0, 0, 1, 1,
0.834065, -0.7960615, 2.704071, 0, 0, 0, 1, 1,
0.8342316, 0.054374, 4.482977, 0, 0, 0, 1, 1,
0.8355887, 0.7017277, 3.455583, 0, 0, 0, 1, 1,
0.8389897, -0.1814136, 3.428244, 0, 0, 0, 1, 1,
0.8437073, 0.5529607, 0.4682972, 0, 0, 0, 1, 1,
0.8492299, -0.9347379, 3.721881, 0, 0, 0, 1, 1,
0.8512607, 1.087956, -0.2176745, 0, 0, 0, 1, 1,
0.8611379, 0.2044819, 2.187989, 1, 1, 1, 1, 1,
0.8656278, -0.3782468, 1.860161, 1, 1, 1, 1, 1,
0.8690194, 1.067619, 0.3479258, 1, 1, 1, 1, 1,
0.869846, -1.047032, 3.634001, 1, 1, 1, 1, 1,
0.8700082, -2.992702, 1.840618, 1, 1, 1, 1, 1,
0.8709379, -0.8181949, 2.199671, 1, 1, 1, 1, 1,
0.8729087, -0.3093486, 3.142194, 1, 1, 1, 1, 1,
0.8788193, 0.9079095, 1.075762, 1, 1, 1, 1, 1,
0.8868635, 1.798793, 0.6742832, 1, 1, 1, 1, 1,
0.9014827, 0.3348678, 1.0397, 1, 1, 1, 1, 1,
0.904633, 0.2371719, 0.5716962, 1, 1, 1, 1, 1,
0.9102212, -0.06968538, 1.485083, 1, 1, 1, 1, 1,
0.911556, -0.6725817, 1.245237, 1, 1, 1, 1, 1,
0.9143055, 1.03222, -0.1194578, 1, 1, 1, 1, 1,
0.9182144, -0.4012162, 0.7096362, 1, 1, 1, 1, 1,
0.9202647, -0.7956106, 2.742275, 0, 0, 1, 1, 1,
0.9303807, -0.38322, 1.732143, 1, 0, 0, 1, 1,
0.9313753, 1.025697, 1.034535, 1, 0, 0, 1, 1,
0.9401954, 0.5297152, 1.802426, 1, 0, 0, 1, 1,
0.9415236, -0.1843011, 0.9683099, 1, 0, 0, 1, 1,
0.9457726, 0.7630949, 0.03775144, 1, 0, 0, 1, 1,
0.9497682, -0.4474382, 1.424989, 0, 0, 0, 1, 1,
0.9499551, 1.280552, 2.136177, 0, 0, 0, 1, 1,
0.9514767, 1.103318, -1.916939, 0, 0, 0, 1, 1,
0.9572593, 0.4775166, 0.700227, 0, 0, 0, 1, 1,
0.9574057, 0.1924304, 2.290687, 0, 0, 0, 1, 1,
0.9593788, -0.1664283, 1.424496, 0, 0, 0, 1, 1,
0.9600884, -0.9008797, 2.542596, 0, 0, 0, 1, 1,
0.9622963, -0.9443236, 3.999934, 1, 1, 1, 1, 1,
0.9625351, -0.3902279, 2.779686, 1, 1, 1, 1, 1,
0.9634893, 1.056927, -0.5094783, 1, 1, 1, 1, 1,
0.9661376, 2.529811, 1.820812, 1, 1, 1, 1, 1,
0.9699146, 0.09546994, 3.014396, 1, 1, 1, 1, 1,
0.9711532, 0.4443928, -0.1407202, 1, 1, 1, 1, 1,
0.9797463, 0.03306315, 1.856362, 1, 1, 1, 1, 1,
0.9822538, 0.08503416, 1.59828, 1, 1, 1, 1, 1,
0.9833925, -0.5905398, 1.968221, 1, 1, 1, 1, 1,
0.9854624, -0.346813, 4.603915, 1, 1, 1, 1, 1,
0.9871368, -0.0222432, 1.382828, 1, 1, 1, 1, 1,
0.9878553, 1.814569, -1.533103, 1, 1, 1, 1, 1,
0.9902588, 0.3291138, 0.6469076, 1, 1, 1, 1, 1,
0.993025, -0.5980536, 1.387359, 1, 1, 1, 1, 1,
0.9983732, -1.219183, 2.780166, 1, 1, 1, 1, 1,
0.9994931, -1.829443, 2.11117, 0, 0, 1, 1, 1,
1.001684, -1.66591, 1.055762, 1, 0, 0, 1, 1,
1.003164, 0.1201425, 1.065162, 1, 0, 0, 1, 1,
1.003956, 0.1585862, 1.672752, 1, 0, 0, 1, 1,
1.004202, 0.3518642, 0.415819, 1, 0, 0, 1, 1,
1.004525, 0.8900312, 2.279666, 1, 0, 0, 1, 1,
1.005571, -1.795432, 2.071815, 0, 0, 0, 1, 1,
1.006476, -0.2868462, 1.837716, 0, 0, 0, 1, 1,
1.006504, -0.3457419, 0.1320364, 0, 0, 0, 1, 1,
1.009953, -1.425999, 2.451764, 0, 0, 0, 1, 1,
1.009998, -0.4927981, -0.3425972, 0, 0, 0, 1, 1,
1.011549, 0.2645505, 2.016328, 0, 0, 0, 1, 1,
1.044681, 0.5875956, 2.599246, 0, 0, 0, 1, 1,
1.04595, -1.016347, 5.009118, 1, 1, 1, 1, 1,
1.046189, 0.7563374, -0.9437252, 1, 1, 1, 1, 1,
1.047959, 1.109462, 1.447431, 1, 1, 1, 1, 1,
1.061217, 0.6120576, 3.354965, 1, 1, 1, 1, 1,
1.062261, 0.1674092, 0.3447164, 1, 1, 1, 1, 1,
1.064813, -0.3592158, 1.664131, 1, 1, 1, 1, 1,
1.065336, 1.96348, -0.3799897, 1, 1, 1, 1, 1,
1.06801, -1.492334, 1.514567, 1, 1, 1, 1, 1,
1.068875, 0.4386907, 1.454725, 1, 1, 1, 1, 1,
1.074749, -1.757406, 2.046024, 1, 1, 1, 1, 1,
1.078794, 0.1306408, 0.6231018, 1, 1, 1, 1, 1,
1.079342, 1.128649, 1.494137, 1, 1, 1, 1, 1,
1.089002, 2.282535, 0.1574948, 1, 1, 1, 1, 1,
1.091558, 1.599487, -0.4228693, 1, 1, 1, 1, 1,
1.093973, 0.5934175, 1.003762, 1, 1, 1, 1, 1,
1.094374, 1.417518, 1.552577, 0, 0, 1, 1, 1,
1.098639, -0.3057171, 2.924312, 1, 0, 0, 1, 1,
1.100513, 0.4302495, 0.3916355, 1, 0, 0, 1, 1,
1.103611, -0.08670149, 0.9348052, 1, 0, 0, 1, 1,
1.108021, -0.7767667, 1.840866, 1, 0, 0, 1, 1,
1.111822, 1.228457, 1.467122, 1, 0, 0, 1, 1,
1.112263, -0.9259779, 2.356251, 0, 0, 0, 1, 1,
1.114456, -1.086228, 2.333402, 0, 0, 0, 1, 1,
1.118355, -1.05211, 1.806538, 0, 0, 0, 1, 1,
1.126523, 1.298888, 0.0723377, 0, 0, 0, 1, 1,
1.137301, -0.879111, 1.749436, 0, 0, 0, 1, 1,
1.138384, -0.2477663, 0.3383441, 0, 0, 0, 1, 1,
1.139457, 1.976131, -1.842126, 0, 0, 0, 1, 1,
1.144074, -0.1510073, 1.620727, 1, 1, 1, 1, 1,
1.150772, 0.05185939, 1.26443, 1, 1, 1, 1, 1,
1.150841, 1.268396, 1.425666, 1, 1, 1, 1, 1,
1.151317, 0.5679181, -0.5686354, 1, 1, 1, 1, 1,
1.165453, -0.4815591, 2.210672, 1, 1, 1, 1, 1,
1.168925, 0.850819, 1.444596, 1, 1, 1, 1, 1,
1.182382, 0.7795725, -0.2407199, 1, 1, 1, 1, 1,
1.192361, -0.0745017, 2.478499, 1, 1, 1, 1, 1,
1.195548, -0.7641202, 1.783777, 1, 1, 1, 1, 1,
1.197567, 0.5609126, -0.941151, 1, 1, 1, 1, 1,
1.19878, 0.3425438, 1.693116, 1, 1, 1, 1, 1,
1.203965, 1.246363, 1.087714, 1, 1, 1, 1, 1,
1.20514, 1.275632, 0.6109182, 1, 1, 1, 1, 1,
1.206858, -2.045513, 4.59169, 1, 1, 1, 1, 1,
1.208047, -0.4658186, 3.043907, 1, 1, 1, 1, 1,
1.208885, -0.7286761, 1.152339, 0, 0, 1, 1, 1,
1.213032, -0.883875, 1.440947, 1, 0, 0, 1, 1,
1.216552, 1.887647, 0.6165032, 1, 0, 0, 1, 1,
1.220021, -0.1830587, 1.098451, 1, 0, 0, 1, 1,
1.225694, 0.2949686, 0.6108593, 1, 0, 0, 1, 1,
1.226058, 0.3287395, 2.138624, 1, 0, 0, 1, 1,
1.251736, -1.211257, 2.786039, 0, 0, 0, 1, 1,
1.256779, -0.6633353, 0.9998066, 0, 0, 0, 1, 1,
1.259227, -0.4856877, 2.353969, 0, 0, 0, 1, 1,
1.260975, 1.167847, 0.5089485, 0, 0, 0, 1, 1,
1.274932, 0.6314133, 1.862628, 0, 0, 0, 1, 1,
1.286805, 0.2791238, 1.130057, 0, 0, 0, 1, 1,
1.300094, -0.9166497, 1.440528, 0, 0, 0, 1, 1,
1.307776, -0.3478222, 1.525541, 1, 1, 1, 1, 1,
1.3082, 0.1178703, 0.8619523, 1, 1, 1, 1, 1,
1.311067, -1.612758, 1.97131, 1, 1, 1, 1, 1,
1.318615, 1.210142, 0.3700949, 1, 1, 1, 1, 1,
1.327729, -0.02062194, 1.340704, 1, 1, 1, 1, 1,
1.330071, -0.06343801, 3.591597, 1, 1, 1, 1, 1,
1.332683, 1.605487, 2.463399, 1, 1, 1, 1, 1,
1.339458, -0.07368127, 2.444116, 1, 1, 1, 1, 1,
1.34955, -0.4912285, 4.025801, 1, 1, 1, 1, 1,
1.353886, -0.5072389, 1.198806, 1, 1, 1, 1, 1,
1.353979, 1.646058, 1.048604, 1, 1, 1, 1, 1,
1.359332, 0.3378281, 3.431587, 1, 1, 1, 1, 1,
1.361258, 0.9955947, -2.177979, 1, 1, 1, 1, 1,
1.367794, 0.05849196, 0.6050649, 1, 1, 1, 1, 1,
1.376965, -0.447587, 3.393273, 1, 1, 1, 1, 1,
1.37908, -0.3379335, 1.486607, 0, 0, 1, 1, 1,
1.393405, -1.942947, 1.73392, 1, 0, 0, 1, 1,
1.404553, 1.343611, 0.8743773, 1, 0, 0, 1, 1,
1.40904, -1.391981, 2.018478, 1, 0, 0, 1, 1,
1.417047, -0.4031896, -0.03474214, 1, 0, 0, 1, 1,
1.417087, -0.8363048, 2.119843, 1, 0, 0, 1, 1,
1.420518, 1.331893, 0.7935986, 0, 0, 0, 1, 1,
1.421827, -0.4635303, 2.808315, 0, 0, 0, 1, 1,
1.446293, 0.2065877, -0.09597334, 0, 0, 0, 1, 1,
1.446805, -0.2594115, 2.146804, 0, 0, 0, 1, 1,
1.453088, -0.02093131, 2.777964, 0, 0, 0, 1, 1,
1.49567, -1.101297, 3.525501, 0, 0, 0, 1, 1,
1.52406, -0.6706918, -0.1912858, 0, 0, 0, 1, 1,
1.52638, 0.009715214, 2.160255, 1, 1, 1, 1, 1,
1.533965, -0.5491319, 3.658871, 1, 1, 1, 1, 1,
1.538032, -0.5446507, 1.246904, 1, 1, 1, 1, 1,
1.543295, -1.308131, -0.1130469, 1, 1, 1, 1, 1,
1.548687, -0.09102021, 1.537442, 1, 1, 1, 1, 1,
1.555993, -0.6143138, 2.395857, 1, 1, 1, 1, 1,
1.557683, -0.8716008, 2.572524, 1, 1, 1, 1, 1,
1.564266, -0.6396824, -0.1901307, 1, 1, 1, 1, 1,
1.572341, -0.222253, 0.02113738, 1, 1, 1, 1, 1,
1.573748, 0.1682324, 0.7408776, 1, 1, 1, 1, 1,
1.586476, 1.367904, 1.763699, 1, 1, 1, 1, 1,
1.631603, 1.208174, 0.6204847, 1, 1, 1, 1, 1,
1.659511, 0.8950893, 2.812714, 1, 1, 1, 1, 1,
1.669382, 0.02838336, -0.273506, 1, 1, 1, 1, 1,
1.673595, -0.8728771, 0.9246166, 1, 1, 1, 1, 1,
1.675534, 0.9752449, 0.9748631, 0, 0, 1, 1, 1,
1.676106, 1.44309, -0.6474827, 1, 0, 0, 1, 1,
1.676927, 0.1768121, 1.510951, 1, 0, 0, 1, 1,
1.693853, -0.1352511, 1.197043, 1, 0, 0, 1, 1,
1.695756, 1.430561, 1.062529, 1, 0, 0, 1, 1,
1.718101, -0.3755493, 2.472082, 1, 0, 0, 1, 1,
1.730075, 1.94453, 0.4267474, 0, 0, 0, 1, 1,
1.740554, -0.1323577, 0.6532117, 0, 0, 0, 1, 1,
1.746483, 1.518963, 0.01623186, 0, 0, 0, 1, 1,
1.752549, 0.1549652, 0.1751142, 0, 0, 0, 1, 1,
1.773949, 2.342643, -0.4979012, 0, 0, 0, 1, 1,
1.784562, 0.7272186, 3.133379, 0, 0, 0, 1, 1,
1.795318, 0.1275594, 1.2558, 0, 0, 0, 1, 1,
1.834021, 0.1315276, 2.587435, 1, 1, 1, 1, 1,
1.84343, 0.3067555, 1.286552, 1, 1, 1, 1, 1,
1.843952, 0.4677977, 2.477592, 1, 1, 1, 1, 1,
1.853072, -0.05326254, 0.3432956, 1, 1, 1, 1, 1,
1.858224, -1.577956, 1.861987, 1, 1, 1, 1, 1,
1.87884, -0.1439112, 0.2048614, 1, 1, 1, 1, 1,
1.884121, -1.452419, 3.977736, 1, 1, 1, 1, 1,
1.929357, 0.9059186, 1.212539, 1, 1, 1, 1, 1,
1.9347, -0.7226574, 0.8081909, 1, 1, 1, 1, 1,
1.937353, 0.4789067, 1.204813, 1, 1, 1, 1, 1,
1.957913, 0.5330823, 0.3178754, 1, 1, 1, 1, 1,
1.959887, 0.09385552, 1.368888, 1, 1, 1, 1, 1,
1.961793, -0.1681359, 1.864846, 1, 1, 1, 1, 1,
2.013013, -0.04842898, 1.715997, 1, 1, 1, 1, 1,
2.033544, -0.4994735, 1.282184, 1, 1, 1, 1, 1,
2.045624, -0.5018927, 1.864709, 0, 0, 1, 1, 1,
2.080709, 1.056528, 2.022374, 1, 0, 0, 1, 1,
2.135511, 0.5287551, 1.669329, 1, 0, 0, 1, 1,
2.171271, -0.7474464, 0.4961824, 1, 0, 0, 1, 1,
2.204774, -0.4648184, 0.06178952, 1, 0, 0, 1, 1,
2.208583, -1.279713, 2.776109, 1, 0, 0, 1, 1,
2.241019, -0.2240921, 1.338397, 0, 0, 0, 1, 1,
2.311028, -0.4925295, 1.629459, 0, 0, 0, 1, 1,
2.325844, 0.7118632, 0.9928855, 0, 0, 0, 1, 1,
2.359432, 0.1185982, 1.167574, 0, 0, 0, 1, 1,
2.396391, -0.7942997, 1.925231, 0, 0, 0, 1, 1,
2.447877, -0.8809143, 2.923901, 0, 0, 0, 1, 1,
2.472213, 0.1894327, 1.586657, 0, 0, 0, 1, 1,
2.525614, -1.330345, 2.49137, 1, 1, 1, 1, 1,
2.684083, -0.07514738, 4.502254, 1, 1, 1, 1, 1,
2.750305, -0.9067625, 1.652133, 1, 1, 1, 1, 1,
2.791772, -1.293827, 2.347613, 1, 1, 1, 1, 1,
2.828578, 0.5374765, 0.7769354, 1, 1, 1, 1, 1,
3.09169, -0.1128016, 0.05394626, 1, 1, 1, 1, 1,
3.421382, 0.3463854, 1.878255, 1, 1, 1, 1, 1
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
var radius = 9.80551;
var distance = 34.44144;
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
mvMatrix.translate( 0.09792471, -0.00147295, -0.1206245 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.44144);
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