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
-3.068134, 0.6766239, -1.922155, 1, 0, 0, 1,
-2.976122, 0.5621782, -2.048886, 1, 0.007843138, 0, 1,
-2.889324, 0.1793756, -0.8970654, 1, 0.01176471, 0, 1,
-2.806875, 2.554526, 0.3201678, 1, 0.01960784, 0, 1,
-2.698064, 0.5033523, -0.507704, 1, 0.02352941, 0, 1,
-2.685317, 0.08859213, -0.8448014, 1, 0.03137255, 0, 1,
-2.575138, -0.2061139, 0.5803847, 1, 0.03529412, 0, 1,
-2.516528, -0.9892687, -1.556803, 1, 0.04313726, 0, 1,
-2.443986, -0.8276735, -1.708084, 1, 0.04705882, 0, 1,
-2.398604, -0.1843977, -2.84314, 1, 0.05490196, 0, 1,
-2.368749, 0.2576329, -0.1387247, 1, 0.05882353, 0, 1,
-2.336634, -1.389614, -1.046971, 1, 0.06666667, 0, 1,
-2.28779, -1.057375, -0.2064271, 1, 0.07058824, 0, 1,
-2.252645, 0.2015889, -1.605712, 1, 0.07843138, 0, 1,
-2.192446, 0.3843302, -2.201485, 1, 0.08235294, 0, 1,
-2.123589, -0.5510411, -0.3034745, 1, 0.09019608, 0, 1,
-2.109951, 0.5019238, -0.2223301, 1, 0.09411765, 0, 1,
-2.07324, 0.009933555, -1.569241, 1, 0.1019608, 0, 1,
-2.064491, -0.7648044, -2.523609, 1, 0.1098039, 0, 1,
-2.03721, 0.5530447, -2.248003, 1, 0.1137255, 0, 1,
-2.014184, -0.8481278, -3.511069, 1, 0.1215686, 0, 1,
-1.978342, -1.155123, -3.201795, 1, 0.1254902, 0, 1,
-1.953597, -0.2429351, -0.9100937, 1, 0.1333333, 0, 1,
-1.939081, 0.9340646, -2.367322, 1, 0.1372549, 0, 1,
-1.927649, -0.6205746, -4.395382, 1, 0.145098, 0, 1,
-1.913529, -1.397241, -2.261229, 1, 0.1490196, 0, 1,
-1.903127, -0.1554364, -1.347316, 1, 0.1568628, 0, 1,
-1.877184, 0.2255775, -2.749385, 1, 0.1607843, 0, 1,
-1.811064, -0.1595606, -1.130054, 1, 0.1686275, 0, 1,
-1.791154, -0.1291442, -3.015483, 1, 0.172549, 0, 1,
-1.773693, -2.036571, -3.381982, 1, 0.1803922, 0, 1,
-1.750719, -1.44794, -4.878508, 1, 0.1843137, 0, 1,
-1.72936, 1.372738, -0.9631832, 1, 0.1921569, 0, 1,
-1.729167, -1.37018, -2.993142, 1, 0.1960784, 0, 1,
-1.715626, -2.6844, -0.927853, 1, 0.2039216, 0, 1,
-1.706703, -0.6104363, -3.901949, 1, 0.2117647, 0, 1,
-1.705299, 0.9300329, -1.025849, 1, 0.2156863, 0, 1,
-1.697791, 0.7770291, -0.365797, 1, 0.2235294, 0, 1,
-1.689249, -1.218606, -2.269396, 1, 0.227451, 0, 1,
-1.669927, -0.0285597, -2.060746, 1, 0.2352941, 0, 1,
-1.669473, -2.304243, -2.603028, 1, 0.2392157, 0, 1,
-1.667297, 0.6180151, -0.4990405, 1, 0.2470588, 0, 1,
-1.652002, -2.071167, -2.048762, 1, 0.2509804, 0, 1,
-1.64744, -0.2176562, -0.7902198, 1, 0.2588235, 0, 1,
-1.63885, 0.03678278, -2.720951, 1, 0.2627451, 0, 1,
-1.61803, -0.01939083, -2.933334, 1, 0.2705882, 0, 1,
-1.614039, -0.1576304, -0.9420584, 1, 0.2745098, 0, 1,
-1.601551, 0.4551495, -1.962151, 1, 0.282353, 0, 1,
-1.596739, -0.2375158, -2.27699, 1, 0.2862745, 0, 1,
-1.594248, 1.631795, -0.5056503, 1, 0.2941177, 0, 1,
-1.593251, -1.13322, -0.9474217, 1, 0.3019608, 0, 1,
-1.591581, 0.8503709, -1.121655, 1, 0.3058824, 0, 1,
-1.585118, -0.7895837, -0.5343005, 1, 0.3137255, 0, 1,
-1.582087, -0.09894828, -1.443696, 1, 0.3176471, 0, 1,
-1.580561, -1.62692, -2.086255, 1, 0.3254902, 0, 1,
-1.577758, 1.313401, -1.731841, 1, 0.3294118, 0, 1,
-1.577484, 2.242372, -1.860239, 1, 0.3372549, 0, 1,
-1.573216, 1.754356, 0.07680786, 1, 0.3411765, 0, 1,
-1.569066, 0.1612808, -1.019245, 1, 0.3490196, 0, 1,
-1.566544, -0.9021306, -3.380079, 1, 0.3529412, 0, 1,
-1.552425, -0.9108565, -2.224131, 1, 0.3607843, 0, 1,
-1.528003, -0.3147494, -2.592009, 1, 0.3647059, 0, 1,
-1.523033, -1.431916, -2.800316, 1, 0.372549, 0, 1,
-1.515487, 0.5171117, -2.242106, 1, 0.3764706, 0, 1,
-1.514157, -0.1894701, -2.258747, 1, 0.3843137, 0, 1,
-1.51114, 1.52889, -1.378633, 1, 0.3882353, 0, 1,
-1.502971, -1.056632, -1.612083, 1, 0.3960784, 0, 1,
-1.490277, -2.886385, -2.23458, 1, 0.4039216, 0, 1,
-1.488224, 1.464582, -0.588577, 1, 0.4078431, 0, 1,
-1.486539, 0.4795158, -1.353812, 1, 0.4156863, 0, 1,
-1.483996, 0.5828573, -1.870509, 1, 0.4196078, 0, 1,
-1.477661, 0.5357916, 0.1168405, 1, 0.427451, 0, 1,
-1.468677, -1.187533, -2.514972, 1, 0.4313726, 0, 1,
-1.465669, -0.5665389, -2.174446, 1, 0.4392157, 0, 1,
-1.44792, 0.7619295, -0.747739, 1, 0.4431373, 0, 1,
-1.440796, -0.4277339, -0.7407489, 1, 0.4509804, 0, 1,
-1.437658, -0.7060766, -2.841263, 1, 0.454902, 0, 1,
-1.436152, 0.4138138, -3.081402, 1, 0.4627451, 0, 1,
-1.435816, -0.9953547, -0.4530175, 1, 0.4666667, 0, 1,
-1.426284, 0.5651349, -1.049462, 1, 0.4745098, 0, 1,
-1.420482, 0.0414749, -1.375022, 1, 0.4784314, 0, 1,
-1.40279, -0.02375937, 0.2554471, 1, 0.4862745, 0, 1,
-1.386067, -1.88108, -2.509511, 1, 0.4901961, 0, 1,
-1.37162, -0.5951331, -2.031963, 1, 0.4980392, 0, 1,
-1.370106, 1.673471, 0.3050893, 1, 0.5058824, 0, 1,
-1.359654, -1.149278, -1.422493, 1, 0.509804, 0, 1,
-1.356814, -0.9886628, -2.244803, 1, 0.5176471, 0, 1,
-1.354948, -0.1299805, -1.848245, 1, 0.5215687, 0, 1,
-1.334121, -1.418284, -2.117353, 1, 0.5294118, 0, 1,
-1.301598, -1.589154, -3.959163, 1, 0.5333334, 0, 1,
-1.299593, -0.755963, -2.852939, 1, 0.5411765, 0, 1,
-1.284616, -1.101731, -1.420669, 1, 0.5450981, 0, 1,
-1.283335, 1.601348, -1.030389, 1, 0.5529412, 0, 1,
-1.270239, -0.2686513, -2.234787, 1, 0.5568628, 0, 1,
-1.264297, 1.015631, -1.536041, 1, 0.5647059, 0, 1,
-1.256767, -0.7364909, -2.368814, 1, 0.5686275, 0, 1,
-1.251514, 0.1574306, -0.6651936, 1, 0.5764706, 0, 1,
-1.250574, -2.067297, -2.166104, 1, 0.5803922, 0, 1,
-1.250416, 0.2212048, -1.640537, 1, 0.5882353, 0, 1,
-1.247771, -0.5148575, -1.637933, 1, 0.5921569, 0, 1,
-1.245963, 0.7624316, -2.280238, 1, 0.6, 0, 1,
-1.244761, -0.6486026, -1.551955, 1, 0.6078432, 0, 1,
-1.240702, 0.1862374, -0.1042319, 1, 0.6117647, 0, 1,
-1.232039, -1.543841, -3.046469, 1, 0.6196079, 0, 1,
-1.218825, 1.649721, -1.054583, 1, 0.6235294, 0, 1,
-1.2187, -0.3385669, -2.821399, 1, 0.6313726, 0, 1,
-1.213929, -0.7568297, -2.672094, 1, 0.6352941, 0, 1,
-1.212634, -1.737162, -2.520571, 1, 0.6431373, 0, 1,
-1.195145, -1.566675, -2.485708, 1, 0.6470588, 0, 1,
-1.19319, 1.606429, -0.4901866, 1, 0.654902, 0, 1,
-1.154643, 1.4951, 0.3525875, 1, 0.6588235, 0, 1,
-1.149879, 1.155233, -1.248726, 1, 0.6666667, 0, 1,
-1.142003, 0.8354063, -0.37587, 1, 0.6705883, 0, 1,
-1.135314, -0.3560552, -1.665212, 1, 0.6784314, 0, 1,
-1.128834, 0.7901017, -1.047282, 1, 0.682353, 0, 1,
-1.128146, 0.6863841, -0.1765672, 1, 0.6901961, 0, 1,
-1.12292, -0.1289299, -1.910642, 1, 0.6941177, 0, 1,
-1.120635, -1.893659, -2.122053, 1, 0.7019608, 0, 1,
-1.116592, 1.587281, 0.7835747, 1, 0.7098039, 0, 1,
-1.114872, 0.52754, -2.032646, 1, 0.7137255, 0, 1,
-1.108755, -0.2032232, -0.9760903, 1, 0.7215686, 0, 1,
-1.108503, -0.3891152, -1.581387, 1, 0.7254902, 0, 1,
-1.105966, 0.511574, -2.287404, 1, 0.7333333, 0, 1,
-1.10377, -1.040266, -3.178663, 1, 0.7372549, 0, 1,
-1.099184, 0.6605204, -1.867926, 1, 0.7450981, 0, 1,
-1.096117, -0.6919506, -1.967777, 1, 0.7490196, 0, 1,
-1.078288, -0.6716442, -0.8878018, 1, 0.7568628, 0, 1,
-1.074385, 0.1454895, -3.019731, 1, 0.7607843, 0, 1,
-1.073365, -1.600774, -1.920025, 1, 0.7686275, 0, 1,
-1.063809, -1.481348, -1.174795, 1, 0.772549, 0, 1,
-1.058749, -2.356698, -3.328459, 1, 0.7803922, 0, 1,
-1.058492, -0.02583932, -0.8479141, 1, 0.7843137, 0, 1,
-1.057594, 1.093397, -1.491678, 1, 0.7921569, 0, 1,
-1.056135, -1.463038, -3.260604, 1, 0.7960784, 0, 1,
-1.055824, -1.219193, -2.258419, 1, 0.8039216, 0, 1,
-1.054627, 1.139706, -0.05173975, 1, 0.8117647, 0, 1,
-1.049233, 0.0644003, -1.183215, 1, 0.8156863, 0, 1,
-1.03515, -0.1605764, -0.9634064, 1, 0.8235294, 0, 1,
-1.033316, 1.848641, -0.1399245, 1, 0.827451, 0, 1,
-1.029338, 2.549809, -0.2529618, 1, 0.8352941, 0, 1,
-1.028326, -2.135509, -4.513058, 1, 0.8392157, 0, 1,
-1.027665, -1.537376, -1.731426, 1, 0.8470588, 0, 1,
-1.026296, 0.1905047, 0.4164944, 1, 0.8509804, 0, 1,
-1.026178, -0.06915276, -1.177911, 1, 0.8588235, 0, 1,
-1.024218, -0.8151493, -0.1538359, 1, 0.8627451, 0, 1,
-1.024021, -1.066451, -3.373592, 1, 0.8705882, 0, 1,
-1.018992, 0.4461779, -2.515738, 1, 0.8745098, 0, 1,
-1.01411, 2.55319, 1.353096, 1, 0.8823529, 0, 1,
-1.013696, -1.086467, -2.334644, 1, 0.8862745, 0, 1,
-1.012009, 0.2087779, -1.134453, 1, 0.8941177, 0, 1,
-1.004948, -0.2303538, -1.162127, 1, 0.8980392, 0, 1,
-0.9998437, -0.4819896, -2.992686, 1, 0.9058824, 0, 1,
-0.9974286, 0.6709362, -0.4076358, 1, 0.9137255, 0, 1,
-0.9913269, 0.1109028, 0.1666398, 1, 0.9176471, 0, 1,
-0.988989, 2.335156, -0.07545011, 1, 0.9254902, 0, 1,
-0.9886872, -0.4709777, -3.763227, 1, 0.9294118, 0, 1,
-0.988215, -0.3172034, -2.388747, 1, 0.9372549, 0, 1,
-0.9853752, -0.1438066, -1.025135, 1, 0.9411765, 0, 1,
-0.9786264, -0.7661835, -1.411358, 1, 0.9490196, 0, 1,
-0.9779558, 0.5485727, 1.010574, 1, 0.9529412, 0, 1,
-0.9759521, 0.384337, -1.270329, 1, 0.9607843, 0, 1,
-0.9726472, -0.06207068, -1.575702, 1, 0.9647059, 0, 1,
-0.9700007, -0.1965283, -1.014984, 1, 0.972549, 0, 1,
-0.9579117, -0.6779004, -2.437021, 1, 0.9764706, 0, 1,
-0.9574944, 0.2296153, -2.843838, 1, 0.9843137, 0, 1,
-0.9568372, -0.943411, -1.82961, 1, 0.9882353, 0, 1,
-0.9552577, -0.2506593, -0.9784364, 1, 0.9960784, 0, 1,
-0.9528263, -0.1659842, -1.341007, 0.9960784, 1, 0, 1,
-0.9493289, 0.048728, -2.184823, 0.9921569, 1, 0, 1,
-0.9412509, -0.02396741, -3.299853, 0.9843137, 1, 0, 1,
-0.9410799, 1.335739, 0.4347705, 0.9803922, 1, 0, 1,
-0.9402938, -0.77505, -1.796242, 0.972549, 1, 0, 1,
-0.9361779, -0.1374461, -0.4994845, 0.9686275, 1, 0, 1,
-0.9295213, 0.3194247, 0.1750447, 0.9607843, 1, 0, 1,
-0.9293409, -1.608239, -2.696065, 0.9568627, 1, 0, 1,
-0.9275274, -0.9429743, -2.616525, 0.9490196, 1, 0, 1,
-0.926052, 0.2478387, -0.6587334, 0.945098, 1, 0, 1,
-0.9121889, -0.4237798, -1.169347, 0.9372549, 1, 0, 1,
-0.9096096, -0.5733957, 0.6693891, 0.9333333, 1, 0, 1,
-0.8909704, -2.128417, -2.503319, 0.9254902, 1, 0, 1,
-0.8902862, -0.8982913, -1.934207, 0.9215686, 1, 0, 1,
-0.8849247, -0.5178174, -2.970761, 0.9137255, 1, 0, 1,
-0.8835662, -1.124529, -1.069019, 0.9098039, 1, 0, 1,
-0.8790225, 1.761056, -0.4362671, 0.9019608, 1, 0, 1,
-0.8768616, 0.1989982, -2.202269, 0.8941177, 1, 0, 1,
-0.8758605, -0.5301654, -3.024116, 0.8901961, 1, 0, 1,
-0.8732052, -0.5309733, -2.866077, 0.8823529, 1, 0, 1,
-0.8666288, 1.54158, -0.8499762, 0.8784314, 1, 0, 1,
-0.8665325, -0.5953532, -2.483948, 0.8705882, 1, 0, 1,
-0.8646688, 1.899209, 0.0229616, 0.8666667, 1, 0, 1,
-0.864352, 0.3931553, -0.7248701, 0.8588235, 1, 0, 1,
-0.8629407, -0.4923782, -2.112711, 0.854902, 1, 0, 1,
-0.8610616, -0.03007023, 0.4190294, 0.8470588, 1, 0, 1,
-0.8576817, 0.6934783, -1.915483, 0.8431373, 1, 0, 1,
-0.8465335, -1.15299, -2.946818, 0.8352941, 1, 0, 1,
-0.8442214, -0.2806315, 0.4154463, 0.8313726, 1, 0, 1,
-0.8426005, 1.453133, 0.6662297, 0.8235294, 1, 0, 1,
-0.8410798, -0.8758829, -1.642199, 0.8196079, 1, 0, 1,
-0.8341907, 0.9837415, 0.1263751, 0.8117647, 1, 0, 1,
-0.8318301, 1.987762, -2.67499, 0.8078431, 1, 0, 1,
-0.8308512, 0.3354513, -2.207823, 0.8, 1, 0, 1,
-0.83073, 1.074781, -1.878588, 0.7921569, 1, 0, 1,
-0.8240515, -0.7035519, -2.181284, 0.7882353, 1, 0, 1,
-0.8227053, -0.1823641, -1.498446, 0.7803922, 1, 0, 1,
-0.8188192, 0.8987057, 0.0288373, 0.7764706, 1, 0, 1,
-0.8169087, 0.5545845, -0.8727535, 0.7686275, 1, 0, 1,
-0.8165397, -1.717472, -2.735069, 0.7647059, 1, 0, 1,
-0.809008, -0.7645961, -1.788393, 0.7568628, 1, 0, 1,
-0.8073993, -1.097517, -1.593004, 0.7529412, 1, 0, 1,
-0.8069712, 0.1286696, 0.5706149, 0.7450981, 1, 0, 1,
-0.8047699, 0.7134823, -1.13933, 0.7411765, 1, 0, 1,
-0.7964685, -1.482035, -2.790611, 0.7333333, 1, 0, 1,
-0.795724, 0.1597675, -1.067068, 0.7294118, 1, 0, 1,
-0.7902392, 0.9323798, 1.220495, 0.7215686, 1, 0, 1,
-0.7859151, 0.3652665, -1.386523, 0.7176471, 1, 0, 1,
-0.7851816, -0.2708624, -3.36037, 0.7098039, 1, 0, 1,
-0.7836161, 0.02314225, -0.2888071, 0.7058824, 1, 0, 1,
-0.7798471, -0.5223422, -2.413714, 0.6980392, 1, 0, 1,
-0.7750335, -0.7228695, -2.647909, 0.6901961, 1, 0, 1,
-0.773633, 0.8242512, -0.8344747, 0.6862745, 1, 0, 1,
-0.7703989, 0.5072609, -0.9173846, 0.6784314, 1, 0, 1,
-0.7680867, 0.7438237, -1.148656, 0.6745098, 1, 0, 1,
-0.7622062, -0.2816976, -2.375561, 0.6666667, 1, 0, 1,
-0.7610035, -0.5445996, -0.8769206, 0.6627451, 1, 0, 1,
-0.7602552, -0.2416764, -3.163085, 0.654902, 1, 0, 1,
-0.7503131, -0.2699023, -1.2277, 0.6509804, 1, 0, 1,
-0.7349496, -0.358022, 0.1803782, 0.6431373, 1, 0, 1,
-0.7348388, 2.668531, 1.872772, 0.6392157, 1, 0, 1,
-0.7297428, -1.74414, -1.942654, 0.6313726, 1, 0, 1,
-0.7296835, 0.4624375, -1.600624, 0.627451, 1, 0, 1,
-0.7275751, 1.329979, -1.541902, 0.6196079, 1, 0, 1,
-0.7265694, -1.342376, -5.150396, 0.6156863, 1, 0, 1,
-0.7251152, 0.9809018, -0.9983644, 0.6078432, 1, 0, 1,
-0.7220037, -1.136301, -2.874067, 0.6039216, 1, 0, 1,
-0.7218336, -0.0867566, -0.9265003, 0.5960785, 1, 0, 1,
-0.716213, -1.521451, -2.00831, 0.5882353, 1, 0, 1,
-0.715021, -0.6137772, -4.127903, 0.5843138, 1, 0, 1,
-0.7124969, 1.79781, -0.3944138, 0.5764706, 1, 0, 1,
-0.7097116, -1.291191, -1.831564, 0.572549, 1, 0, 1,
-0.7077463, 0.3200463, -1.929253, 0.5647059, 1, 0, 1,
-0.7039182, 0.2572604, -0.2574975, 0.5607843, 1, 0, 1,
-0.7031139, 0.3709797, -2.548816, 0.5529412, 1, 0, 1,
-0.7005636, 0.6657846, -0.8205982, 0.5490196, 1, 0, 1,
-0.6997371, -0.4741704, -2.20907, 0.5411765, 1, 0, 1,
-0.6973277, -1.221581, -1.004437, 0.5372549, 1, 0, 1,
-0.6925305, 0.4006974, -1.968488, 0.5294118, 1, 0, 1,
-0.6839286, 0.7141889, 0.836726, 0.5254902, 1, 0, 1,
-0.6813589, 1.977483, -1.298351, 0.5176471, 1, 0, 1,
-0.6800396, -1.3621, -4.507421, 0.5137255, 1, 0, 1,
-0.679812, 0.3609657, 0.2078628, 0.5058824, 1, 0, 1,
-0.6783442, 0.3728674, -1.663638, 0.5019608, 1, 0, 1,
-0.6774371, 1.777275, 1.197274, 0.4941176, 1, 0, 1,
-0.6759505, 0.6445546, -2.37372, 0.4862745, 1, 0, 1,
-0.6757576, -1.173042, -2.594031, 0.4823529, 1, 0, 1,
-0.6739064, 0.001336366, -1.433096, 0.4745098, 1, 0, 1,
-0.6701446, -1.107749, -2.343597, 0.4705882, 1, 0, 1,
-0.6669665, -0.4395478, -1.170581, 0.4627451, 1, 0, 1,
-0.6591435, 0.7565001, -0.1964209, 0.4588235, 1, 0, 1,
-0.6530744, 0.03496087, -2.300182, 0.4509804, 1, 0, 1,
-0.644975, 0.362337, 0.1427177, 0.4470588, 1, 0, 1,
-0.6429353, 0.5025269, -0.716676, 0.4392157, 1, 0, 1,
-0.6411967, 1.220591, 0.3251575, 0.4352941, 1, 0, 1,
-0.634976, 0.3648394, -2.676326, 0.427451, 1, 0, 1,
-0.6328152, -0.0492178, -1.857946, 0.4235294, 1, 0, 1,
-0.6318853, -0.01592826, -1.068809, 0.4156863, 1, 0, 1,
-0.6317965, 2.976955, -0.02703825, 0.4117647, 1, 0, 1,
-0.6245341, -2.09678, -4.532737, 0.4039216, 1, 0, 1,
-0.6240703, -0.1342857, -1.767724, 0.3960784, 1, 0, 1,
-0.6220515, -0.9671732, -2.622181, 0.3921569, 1, 0, 1,
-0.620391, -0.1603398, -1.229817, 0.3843137, 1, 0, 1,
-0.6091492, -0.4118109, -2.255655, 0.3803922, 1, 0, 1,
-0.6061898, 0.1896297, -2.435704, 0.372549, 1, 0, 1,
-0.6059922, -0.8603354, -3.258806, 0.3686275, 1, 0, 1,
-0.5976715, 0.4533935, -2.97619, 0.3607843, 1, 0, 1,
-0.5973195, -0.01182119, -2.006981, 0.3568628, 1, 0, 1,
-0.5934334, -0.5783472, -1.519524, 0.3490196, 1, 0, 1,
-0.592531, -0.5310052, -1.938469, 0.345098, 1, 0, 1,
-0.5911675, 1.509216, -1.281797, 0.3372549, 1, 0, 1,
-0.5882803, 1.351611, -0.6620113, 0.3333333, 1, 0, 1,
-0.5862793, 0.07759134, -0.4262289, 0.3254902, 1, 0, 1,
-0.5825353, -1.159241, -3.251197, 0.3215686, 1, 0, 1,
-0.5813492, -0.3262864, -2.39293, 0.3137255, 1, 0, 1,
-0.5806594, 1.462835, -0.631076, 0.3098039, 1, 0, 1,
-0.5787788, 0.6831694, -0.2578053, 0.3019608, 1, 0, 1,
-0.5765575, 1.19111, 1.747453, 0.2941177, 1, 0, 1,
-0.5746721, 0.5802148, -1.456487, 0.2901961, 1, 0, 1,
-0.5659642, -1.313947, -2.644747, 0.282353, 1, 0, 1,
-0.5643505, -0.3330365, -2.451798, 0.2784314, 1, 0, 1,
-0.5569955, -1.246854, -4.224842, 0.2705882, 1, 0, 1,
-0.5557549, -0.525251, -0.9157138, 0.2666667, 1, 0, 1,
-0.5537362, 1.644104, 0.1157924, 0.2588235, 1, 0, 1,
-0.5535666, 1.782144, -0.2544475, 0.254902, 1, 0, 1,
-0.5508726, 0.8877211, 0.5731237, 0.2470588, 1, 0, 1,
-0.5503859, -1.353993, -3.315289, 0.2431373, 1, 0, 1,
-0.5495099, -0.05070449, -1.52931, 0.2352941, 1, 0, 1,
-0.5492684, 0.9290125, -1.146164, 0.2313726, 1, 0, 1,
-0.5440748, 1.8042, -1.853786, 0.2235294, 1, 0, 1,
-0.5438451, -0.8982078, -3.304275, 0.2196078, 1, 0, 1,
-0.52679, -0.6285343, -3.507835, 0.2117647, 1, 0, 1,
-0.5218713, -1.249866, -4.124228, 0.2078431, 1, 0, 1,
-0.5180165, -0.5387667, -3.655697, 0.2, 1, 0, 1,
-0.5176995, 0.9828975, 0.3730352, 0.1921569, 1, 0, 1,
-0.5144582, 0.1399996, -0.3473183, 0.1882353, 1, 0, 1,
-0.5139018, 0.2624731, -1.818226, 0.1803922, 1, 0, 1,
-0.5133334, 1.879033, 1.387062, 0.1764706, 1, 0, 1,
-0.5093173, 0.3785186, -0.21398, 0.1686275, 1, 0, 1,
-0.5033864, 1.307359, 0.001721367, 0.1647059, 1, 0, 1,
-0.5024568, 0.1029477, -1.940458, 0.1568628, 1, 0, 1,
-0.5022889, 1.529105, 0.9774855, 0.1529412, 1, 0, 1,
-0.490663, 0.7786881, -0.2677996, 0.145098, 1, 0, 1,
-0.4858497, -0.9640502, -1.597153, 0.1411765, 1, 0, 1,
-0.4848925, -0.7375741, -2.402512, 0.1333333, 1, 0, 1,
-0.4800298, -0.1342983, -0.8363219, 0.1294118, 1, 0, 1,
-0.4789239, 1.814278, -2.292521, 0.1215686, 1, 0, 1,
-0.4707691, 0.2468782, -1.482031, 0.1176471, 1, 0, 1,
-0.4699839, 1.554199, -0.5171399, 0.1098039, 1, 0, 1,
-0.4686195, 1.560795, 0.1814898, 0.1058824, 1, 0, 1,
-0.4669228, -0.6600555, -4.777734, 0.09803922, 1, 0, 1,
-0.4660998, -0.05342653, 0.7015979, 0.09019608, 1, 0, 1,
-0.4642421, 0.1232696, -2.284756, 0.08627451, 1, 0, 1,
-0.4638067, 0.1545529, 0.08508939, 0.07843138, 1, 0, 1,
-0.4615545, -1.890147, -1.443811, 0.07450981, 1, 0, 1,
-0.4558868, 0.3980598, -1.887314, 0.06666667, 1, 0, 1,
-0.4534627, 0.293273, -0.9111307, 0.0627451, 1, 0, 1,
-0.4509415, -0.4188228, -1.994764, 0.05490196, 1, 0, 1,
-0.4504143, 0.3222871, -1.434216, 0.05098039, 1, 0, 1,
-0.4502153, -0.4158981, -0.8528929, 0.04313726, 1, 0, 1,
-0.4487574, 0.8601421, 0.2197606, 0.03921569, 1, 0, 1,
-0.4413691, 1.309108, -0.8857905, 0.03137255, 1, 0, 1,
-0.4402689, 0.05073013, -1.755561, 0.02745098, 1, 0, 1,
-0.4355595, 1.197532, -2.650281, 0.01960784, 1, 0, 1,
-0.4343856, 0.2524046, -1.681661, 0.01568628, 1, 0, 1,
-0.4341081, 0.1373454, -0.5554123, 0.007843138, 1, 0, 1,
-0.4318819, -0.3633469, -0.860905, 0.003921569, 1, 0, 1,
-0.4312904, 0.01302957, -4.310386, 0, 1, 0.003921569, 1,
-0.4300605, -0.7761834, -4.341722, 0, 1, 0.01176471, 1,
-0.4287523, -0.9903393, -3.96142, 0, 1, 0.01568628, 1,
-0.424784, 0.5104663, -0.7647318, 0, 1, 0.02352941, 1,
-0.4223157, -0.5565257, -2.144149, 0, 1, 0.02745098, 1,
-0.4169545, 0.7373232, 0.2911946, 0, 1, 0.03529412, 1,
-0.4025018, 0.03279595, -2.12213, 0, 1, 0.03921569, 1,
-0.3998615, -0.0907888, 0.01774658, 0, 1, 0.04705882, 1,
-0.3960803, -0.9017775, -4.015437, 0, 1, 0.05098039, 1,
-0.3919663, 0.4994347, 1.190865, 0, 1, 0.05882353, 1,
-0.3835095, 0.8536205, -1.883808, 0, 1, 0.0627451, 1,
-0.3815075, 0.4381862, -1.503389, 0, 1, 0.07058824, 1,
-0.381354, 0.211766, -1.787117, 0, 1, 0.07450981, 1,
-0.3796883, -0.5953091, -3.137486, 0, 1, 0.08235294, 1,
-0.3723191, -0.6831554, -1.25351, 0, 1, 0.08627451, 1,
-0.3673037, -0.1879184, -1.256271, 0, 1, 0.09411765, 1,
-0.3653697, -0.8606007, -1.937721, 0, 1, 0.1019608, 1,
-0.3646389, -1.104627, -4.25432, 0, 1, 0.1058824, 1,
-0.3584083, 0.155387, 1.231081, 0, 1, 0.1137255, 1,
-0.3569437, -0.3411501, -3.088763, 0, 1, 0.1176471, 1,
-0.3556379, -0.6906046, -2.416827, 0, 1, 0.1254902, 1,
-0.3540022, 1.108023, -0.9644549, 0, 1, 0.1294118, 1,
-0.353171, -0.808112, -2.749062, 0, 1, 0.1372549, 1,
-0.3478378, 1.812064, 0.6666679, 0, 1, 0.1411765, 1,
-0.3448128, -0.2433175, -3.585342, 0, 1, 0.1490196, 1,
-0.3430972, 0.1649861, -0.9555244, 0, 1, 0.1529412, 1,
-0.3407624, 0.2377069, -2.483462, 0, 1, 0.1607843, 1,
-0.3393341, -0.314927, -3.862438, 0, 1, 0.1647059, 1,
-0.3386263, -0.6546935, -1.604184, 0, 1, 0.172549, 1,
-0.3363388, -1.606294, -2.869993, 0, 1, 0.1764706, 1,
-0.3357074, -0.2964242, -1.63637, 0, 1, 0.1843137, 1,
-0.3308578, -1.647167, -3.71177, 0, 1, 0.1882353, 1,
-0.329661, -0.08856004, -2.463852, 0, 1, 0.1960784, 1,
-0.3287167, 0.3247175, -2.584904, 0, 1, 0.2039216, 1,
-0.3276841, 0.4374707, -2.360456, 0, 1, 0.2078431, 1,
-0.3246641, 0.3832966, 0.03672587, 0, 1, 0.2156863, 1,
-0.3216936, 2.41924, -0.2222366, 0, 1, 0.2196078, 1,
-0.3198366, -0.7781855, -3.136274, 0, 1, 0.227451, 1,
-0.3129737, 0.02756873, -1.259674, 0, 1, 0.2313726, 1,
-0.3125059, -1.194191, -3.033359, 0, 1, 0.2392157, 1,
-0.3051284, -0.7742341, -2.312691, 0, 1, 0.2431373, 1,
-0.3026315, -1.050622, -1.52297, 0, 1, 0.2509804, 1,
-0.2998878, 0.5254263, 1.015895, 0, 1, 0.254902, 1,
-0.2943393, 0.9801329, -0.4830881, 0, 1, 0.2627451, 1,
-0.2933997, 1.709275, -1.036591, 0, 1, 0.2666667, 1,
-0.2914581, 0.6791871, -1.675227, 0, 1, 0.2745098, 1,
-0.2886638, 0.118058, -2.117814, 0, 1, 0.2784314, 1,
-0.2878584, 1.481693, -1.935526, 0, 1, 0.2862745, 1,
-0.277947, 0.947876, 1.112799, 0, 1, 0.2901961, 1,
-0.2753771, -1.08958, -4.053185, 0, 1, 0.2980392, 1,
-0.2738312, 0.3558258, -1.576252, 0, 1, 0.3058824, 1,
-0.2660067, -0.4339414, -2.932816, 0, 1, 0.3098039, 1,
-0.2656446, 0.8005486, -0.4196866, 0, 1, 0.3176471, 1,
-0.2636943, -0.003598902, -0.8863046, 0, 1, 0.3215686, 1,
-0.2631969, 0.4717185, -0.09006467, 0, 1, 0.3294118, 1,
-0.2576034, -1.418974, -2.312878, 0, 1, 0.3333333, 1,
-0.2561323, -1.196944, -4.686084, 0, 1, 0.3411765, 1,
-0.2558797, 0.4009954, 0.1981872, 0, 1, 0.345098, 1,
-0.2546477, 0.9803234, 1.300728, 0, 1, 0.3529412, 1,
-0.249324, 0.9853024, 0.4625067, 0, 1, 0.3568628, 1,
-0.2480854, -0.1536095, -2.028477, 0, 1, 0.3647059, 1,
-0.246633, 0.6096472, -0.0243448, 0, 1, 0.3686275, 1,
-0.2447323, 0.1701374, 0.5182359, 0, 1, 0.3764706, 1,
-0.2333735, -0.09769382, -2.180794, 0, 1, 0.3803922, 1,
-0.2318247, 0.4834608, 1.596655, 0, 1, 0.3882353, 1,
-0.2292799, -2.132724, -3.363945, 0, 1, 0.3921569, 1,
-0.2282565, -1.526861, -1.403726, 0, 1, 0.4, 1,
-0.2258303, -0.8741777, -2.945062, 0, 1, 0.4078431, 1,
-0.2252199, 0.3717631, 1.07176, 0, 1, 0.4117647, 1,
-0.2247394, 0.32767, -1.561646, 0, 1, 0.4196078, 1,
-0.2228309, 0.9183453, -1.107442, 0, 1, 0.4235294, 1,
-0.2225047, -0.4862807, -2.572794, 0, 1, 0.4313726, 1,
-0.2211716, 1.704609, -0.3483394, 0, 1, 0.4352941, 1,
-0.2162997, -1.003578, -3.974898, 0, 1, 0.4431373, 1,
-0.2150748, 1.38679, -1.937924, 0, 1, 0.4470588, 1,
-0.2104167, 1.366846, 0.6533474, 0, 1, 0.454902, 1,
-0.2096308, -0.3398779, -2.937241, 0, 1, 0.4588235, 1,
-0.2094894, -0.969251, -2.212016, 0, 1, 0.4666667, 1,
-0.20489, -0.04820822, -2.460614, 0, 1, 0.4705882, 1,
-0.2039876, 2.348264, 2.557204, 0, 1, 0.4784314, 1,
-0.2019713, 0.05751621, -0.9560876, 0, 1, 0.4823529, 1,
-0.2005138, -0.729561, -4.428214, 0, 1, 0.4901961, 1,
-0.1921933, -0.3030687, -1.140208, 0, 1, 0.4941176, 1,
-0.192192, 1.895235, 0.7028049, 0, 1, 0.5019608, 1,
-0.1908423, 0.2202573, -1.142535, 0, 1, 0.509804, 1,
-0.1903645, -0.9293218, -1.647376, 0, 1, 0.5137255, 1,
-0.1901531, -0.8929737, -2.530895, 0, 1, 0.5215687, 1,
-0.1901301, 1.347683, -0.7352802, 0, 1, 0.5254902, 1,
-0.1894903, 1.696827, -0.7755278, 0, 1, 0.5333334, 1,
-0.1858805, 0.4584791, -0.8314337, 0, 1, 0.5372549, 1,
-0.185438, 0.4387578, 2.288099, 0, 1, 0.5450981, 1,
-0.1837177, -1.615279, -3.147802, 0, 1, 0.5490196, 1,
-0.1818593, 1.375142, 0.3062281, 0, 1, 0.5568628, 1,
-0.1809997, -1.494513, -2.596277, 0, 1, 0.5607843, 1,
-0.1775299, -0.4924592, -2.602287, 0, 1, 0.5686275, 1,
-0.1769849, -0.5609506, -3.512429, 0, 1, 0.572549, 1,
-0.1716981, -0.8534881, -3.701594, 0, 1, 0.5803922, 1,
-0.1698333, 0.8423143, 0.06362957, 0, 1, 0.5843138, 1,
-0.1644785, 0.4207439, 0.02672788, 0, 1, 0.5921569, 1,
-0.1601164, 0.006444448, -1.817675, 0, 1, 0.5960785, 1,
-0.1584522, -0.1778443, -1.680423, 0, 1, 0.6039216, 1,
-0.1578483, 0.6053318, -0.1077365, 0, 1, 0.6117647, 1,
-0.1470054, 0.9889896, 1.741581, 0, 1, 0.6156863, 1,
-0.1386238, -0.563514, -2.929292, 0, 1, 0.6235294, 1,
-0.1370938, -1.427959, -2.18427, 0, 1, 0.627451, 1,
-0.1326763, 0.220092, -0.5199336, 0, 1, 0.6352941, 1,
-0.1299308, 1.668371, -0.6495118, 0, 1, 0.6392157, 1,
-0.1298508, 0.4557454, -1.280866, 0, 1, 0.6470588, 1,
-0.1275775, -0.3210067, -2.229203, 0, 1, 0.6509804, 1,
-0.1270677, -0.8662075, -3.326637, 0, 1, 0.6588235, 1,
-0.1254366, 1.135367, -0.3503753, 0, 1, 0.6627451, 1,
-0.1230069, 0.1751697, -1.716076, 0, 1, 0.6705883, 1,
-0.1228976, -1.481415, -4.19464, 0, 1, 0.6745098, 1,
-0.121602, -0.1692269, -3.628149, 0, 1, 0.682353, 1,
-0.1203532, 0.377812, -0.1641991, 0, 1, 0.6862745, 1,
-0.1202513, 0.548388, 0.4777951, 0, 1, 0.6941177, 1,
-0.1198922, -1.798238, -4.374638, 0, 1, 0.7019608, 1,
-0.1169626, -0.329174, -3.978785, 0, 1, 0.7058824, 1,
-0.1153914, -1.242458, -1.633547, 0, 1, 0.7137255, 1,
-0.113556, 0.7983478, 0.006385837, 0, 1, 0.7176471, 1,
-0.1134038, -0.6612097, -3.874437, 0, 1, 0.7254902, 1,
-0.1097886, -0.219116, -2.65642, 0, 1, 0.7294118, 1,
-0.1046429, -1.031514, -3.017019, 0, 1, 0.7372549, 1,
-0.1004987, 1.329511, -1.418243, 0, 1, 0.7411765, 1,
-0.09854222, 0.2348637, 0.2905977, 0, 1, 0.7490196, 1,
-0.09691196, 0.1837409, 0.6225556, 0, 1, 0.7529412, 1,
-0.09136168, -0.9577915, -3.324907, 0, 1, 0.7607843, 1,
-0.09001854, -0.2543403, -3.518905, 0, 1, 0.7647059, 1,
-0.08685753, 0.4154465, 1.023026, 0, 1, 0.772549, 1,
-0.0815393, -0.4923764, -3.058706, 0, 1, 0.7764706, 1,
-0.07285504, -0.7507897, -1.944061, 0, 1, 0.7843137, 1,
-0.06993888, -0.4112296, -1.242076, 0, 1, 0.7882353, 1,
-0.0630056, -0.1216768, -2.291952, 0, 1, 0.7960784, 1,
-0.0593868, -0.7110095, -3.403506, 0, 1, 0.8039216, 1,
-0.05249831, -0.05291302, -2.996756, 0, 1, 0.8078431, 1,
-0.05146875, -0.9678129, -2.585738, 0, 1, 0.8156863, 1,
-0.04898864, -0.2635426, -2.880537, 0, 1, 0.8196079, 1,
-0.04691545, 0.9597936, -0.5168702, 0, 1, 0.827451, 1,
-0.04468659, 0.1994474, -0.9276306, 0, 1, 0.8313726, 1,
-0.04157699, -0.5520338, -2.517118, 0, 1, 0.8392157, 1,
-0.04117757, 0.8757558, 1.088064, 0, 1, 0.8431373, 1,
-0.04035551, 1.345998, 0.1751539, 0, 1, 0.8509804, 1,
-0.03433252, -0.8904763, -4.716693, 0, 1, 0.854902, 1,
-0.02965789, 0.4332539, 0.292134, 0, 1, 0.8627451, 1,
-0.02526316, 1.007642, 0.8314683, 0, 1, 0.8666667, 1,
-0.02438337, -0.5190476, -3.567201, 0, 1, 0.8745098, 1,
-0.0235495, -1.495268, -2.847498, 0, 1, 0.8784314, 1,
-0.02238562, -0.8928493, -4.678209, 0, 1, 0.8862745, 1,
-0.02222962, -0.3234194, -1.819746, 0, 1, 0.8901961, 1,
-0.01757559, -0.9199763, -1.96159, 0, 1, 0.8980392, 1,
-0.01434807, -1.615241, -2.214252, 0, 1, 0.9058824, 1,
-0.01329502, -0.6250289, -4.648323, 0, 1, 0.9098039, 1,
-0.01182207, 0.06248992, 0.1796902, 0, 1, 0.9176471, 1,
0.002918925, 0.8288479, 1.049469, 0, 1, 0.9215686, 1,
0.004925358, 1.504744, 0.6416488, 0, 1, 0.9294118, 1,
0.007887871, -0.268161, 3.194463, 0, 1, 0.9333333, 1,
0.009623878, 0.7542537, -1.089361, 0, 1, 0.9411765, 1,
0.01345673, 0.7734077, -0.08554445, 0, 1, 0.945098, 1,
0.01356426, 0.2891496, 0.4499429, 0, 1, 0.9529412, 1,
0.01570915, 0.01289308, 2.834265, 0, 1, 0.9568627, 1,
0.01621404, 0.3204633, 1.615057, 0, 1, 0.9647059, 1,
0.01840397, -2.163793, 4.371415, 0, 1, 0.9686275, 1,
0.01844438, 0.7572768, -1.172056, 0, 1, 0.9764706, 1,
0.01977764, 0.8003137, -0.9827951, 0, 1, 0.9803922, 1,
0.02779963, 0.6833317, 0.2122937, 0, 1, 0.9882353, 1,
0.02789865, -0.4455746, 2.967437, 0, 1, 0.9921569, 1,
0.02819256, 0.05938098, 1.415589, 0, 1, 1, 1,
0.0306932, 0.6864613, -0.07406572, 0, 0.9921569, 1, 1,
0.03113861, -0.2311667, 1.891868, 0, 0.9882353, 1, 1,
0.03270063, -1.655837, 1.618954, 0, 0.9803922, 1, 1,
0.03331262, 1.023119, 0.2847812, 0, 0.9764706, 1, 1,
0.03447811, 2.282268, 1.56427, 0, 0.9686275, 1, 1,
0.04186042, -0.7126777, 3.802891, 0, 0.9647059, 1, 1,
0.04729519, 1.149833, -0.1173153, 0, 0.9568627, 1, 1,
0.05144041, 0.03653493, 2.324109, 0, 0.9529412, 1, 1,
0.052093, -0.2902083, 1.778915, 0, 0.945098, 1, 1,
0.05235628, 0.03622056, 1.198922, 0, 0.9411765, 1, 1,
0.05277621, 1.02776, 1.190423, 0, 0.9333333, 1, 1,
0.05329914, 0.2274947, 1.474079, 0, 0.9294118, 1, 1,
0.05464018, 1.305575, -1.144136, 0, 0.9215686, 1, 1,
0.0615769, -0.2627747, 4.358785, 0, 0.9176471, 1, 1,
0.06237861, -0.6860749, 1.006669, 0, 0.9098039, 1, 1,
0.06377684, -0.5793839, 1.854167, 0, 0.9058824, 1, 1,
0.06529434, -0.09801316, 1.658589, 0, 0.8980392, 1, 1,
0.06579118, 1.122267, -1.871165, 0, 0.8901961, 1, 1,
0.06715833, 1.26983, 0.5045195, 0, 0.8862745, 1, 1,
0.08589526, 0.686986, 1.091974, 0, 0.8784314, 1, 1,
0.08723886, -0.3012598, 3.633368, 0, 0.8745098, 1, 1,
0.08777905, -2.627867, 3.132889, 0, 0.8666667, 1, 1,
0.08871204, 0.6159276, 0.1933152, 0, 0.8627451, 1, 1,
0.09089825, 0.003453366, 1.248377, 0, 0.854902, 1, 1,
0.09307996, -0.6475672, 3.258076, 0, 0.8509804, 1, 1,
0.09404087, 1.388114, -1.525038, 0, 0.8431373, 1, 1,
0.09436186, 0.2235397, 1.448972, 0, 0.8392157, 1, 1,
0.1003236, -1.451295, 2.39605, 0, 0.8313726, 1, 1,
0.1013237, -0.8949584, 1.260499, 0, 0.827451, 1, 1,
0.1050428, -0.7081827, 2.756375, 0, 0.8196079, 1, 1,
0.1114303, 0.1297839, 1.961438, 0, 0.8156863, 1, 1,
0.1173065, 1.40406, -0.1532172, 0, 0.8078431, 1, 1,
0.1173313, -0.8942909, 2.77296, 0, 0.8039216, 1, 1,
0.123321, -0.8972861, 2.258066, 0, 0.7960784, 1, 1,
0.1336215, -0.6463789, 1.86763, 0, 0.7882353, 1, 1,
0.1370913, 0.6539991, 1.368682, 0, 0.7843137, 1, 1,
0.1377835, -0.7213104, 1.782968, 0, 0.7764706, 1, 1,
0.1387337, 0.2665093, -0.1069031, 0, 0.772549, 1, 1,
0.1396494, -0.4717431, 1.695377, 0, 0.7647059, 1, 1,
0.1422138, -1.528145, 2.053887, 0, 0.7607843, 1, 1,
0.143542, 3.301255, 0.4448269, 0, 0.7529412, 1, 1,
0.1440155, -0.1564503, 1.619097, 0, 0.7490196, 1, 1,
0.1460173, 0.9404962, 0.786184, 0, 0.7411765, 1, 1,
0.1490368, -1.375681, 1.288546, 0, 0.7372549, 1, 1,
0.1494033, -2.210988, 2.859523, 0, 0.7294118, 1, 1,
0.1514178, 0.8910787, 0.166773, 0, 0.7254902, 1, 1,
0.1534307, -1.203811, 3.571334, 0, 0.7176471, 1, 1,
0.1540197, 0.7685912, 0.4271155, 0, 0.7137255, 1, 1,
0.1542777, 1.033335, -0.7084438, 0, 0.7058824, 1, 1,
0.1599213, -0.2045584, 0.9679508, 0, 0.6980392, 1, 1,
0.1648835, -1.561268, 2.125538, 0, 0.6941177, 1, 1,
0.1660786, 0.6698448, -1.282612, 0, 0.6862745, 1, 1,
0.1666797, -0.2780387, 2.014545, 0, 0.682353, 1, 1,
0.1688416, -0.2262553, 3.704137, 0, 0.6745098, 1, 1,
0.1722227, 0.8047337, 0.970013, 0, 0.6705883, 1, 1,
0.1858089, -0.3173239, 3.362644, 0, 0.6627451, 1, 1,
0.1865033, -0.01534123, 0.8589638, 0, 0.6588235, 1, 1,
0.1874075, 0.4032999, -0.1737374, 0, 0.6509804, 1, 1,
0.188862, 2.043102, -0.1708071, 0, 0.6470588, 1, 1,
0.1990471, -0.6202647, 4.020196, 0, 0.6392157, 1, 1,
0.2021266, 1.964111, -0.3661372, 0, 0.6352941, 1, 1,
0.2050819, 0.3390939, 1.416887, 0, 0.627451, 1, 1,
0.2102561, -2.355388, 3.108557, 0, 0.6235294, 1, 1,
0.2147801, -0.655187, 3.739415, 0, 0.6156863, 1, 1,
0.2155602, 0.2223448, 1.301011, 0, 0.6117647, 1, 1,
0.2176652, 1.318604, -1.75375, 0, 0.6039216, 1, 1,
0.2204264, 1.118151, 1.063377, 0, 0.5960785, 1, 1,
0.2249551, 0.008460443, 0.7007761, 0, 0.5921569, 1, 1,
0.2264453, 0.2990266, -1.02569, 0, 0.5843138, 1, 1,
0.230023, -0.9771636, 2.053962, 0, 0.5803922, 1, 1,
0.2377275, -0.4671034, 1.372642, 0, 0.572549, 1, 1,
0.2390396, -0.3798506, 4.664351, 0, 0.5686275, 1, 1,
0.2391604, 0.007909136, 1.635231, 0, 0.5607843, 1, 1,
0.242282, 0.9367716, 0.4644482, 0, 0.5568628, 1, 1,
0.2432076, -0.2557992, 3.772276, 0, 0.5490196, 1, 1,
0.2465939, 0.03589361, 3.458898, 0, 0.5450981, 1, 1,
0.2472336, -0.5484133, 2.53626, 0, 0.5372549, 1, 1,
0.2495011, -0.4398808, 1.649674, 0, 0.5333334, 1, 1,
0.2527514, 1.906814, 1.695741, 0, 0.5254902, 1, 1,
0.2557115, 0.04572542, 1.85121, 0, 0.5215687, 1, 1,
0.2594097, 1.775181, -0.4365872, 0, 0.5137255, 1, 1,
0.2595449, 0.6237704, 2.721546, 0, 0.509804, 1, 1,
0.2603082, 0.8673631, -0.1955636, 0, 0.5019608, 1, 1,
0.2609996, 1.738466, -0.3411952, 0, 0.4941176, 1, 1,
0.2610289, -1.07573, 3.256546, 0, 0.4901961, 1, 1,
0.2655831, 0.9715445, -0.1336844, 0, 0.4823529, 1, 1,
0.2697391, -2.415998, 4.132238, 0, 0.4784314, 1, 1,
0.2716339, 0.3107593, 0.548031, 0, 0.4705882, 1, 1,
0.2734592, -2.51285, 2.588854, 0, 0.4666667, 1, 1,
0.2767181, -0.7083415, 1.247634, 0, 0.4588235, 1, 1,
0.2769121, 0.474987, 0.1900397, 0, 0.454902, 1, 1,
0.2776156, -0.3545425, 1.914745, 0, 0.4470588, 1, 1,
0.2789334, -1.121831, 3.221034, 0, 0.4431373, 1, 1,
0.2825912, -0.3374313, 2.310279, 0, 0.4352941, 1, 1,
0.2854573, 0.9216147, -0.3392831, 0, 0.4313726, 1, 1,
0.2863445, -1.82171, 1.381853, 0, 0.4235294, 1, 1,
0.2889414, -0.468194, 2.669512, 0, 0.4196078, 1, 1,
0.2890074, -0.1270108, 3.706978, 0, 0.4117647, 1, 1,
0.2910338, -0.09204727, 2.856013, 0, 0.4078431, 1, 1,
0.2915623, 0.3454712, 0.2127395, 0, 0.4, 1, 1,
0.292887, 0.3810049, -1.35125, 0, 0.3921569, 1, 1,
0.2938509, 0.3257472, -0.1796685, 0, 0.3882353, 1, 1,
0.2943199, 0.8705145, 1.31477, 0, 0.3803922, 1, 1,
0.2949195, -1.013725, 3.455234, 0, 0.3764706, 1, 1,
0.2950422, 0.1249545, 0.7061303, 0, 0.3686275, 1, 1,
0.2951455, -0.7269949, 2.888073, 0, 0.3647059, 1, 1,
0.2965475, 0.8707249, -0.006830535, 0, 0.3568628, 1, 1,
0.2992141, 0.9378244, 0.0146512, 0, 0.3529412, 1, 1,
0.3015574, 0.4714562, 1.779552, 0, 0.345098, 1, 1,
0.3044797, -0.282656, 2.841534, 0, 0.3411765, 1, 1,
0.3048377, -0.2016893, 3.350754, 0, 0.3333333, 1, 1,
0.3057709, -0.964965, 3.442644, 0, 0.3294118, 1, 1,
0.3067315, -0.4806938, 2.99472, 0, 0.3215686, 1, 1,
0.3090378, -0.3102302, 2.007637, 0, 0.3176471, 1, 1,
0.3091048, -0.8847378, 2.787924, 0, 0.3098039, 1, 1,
0.3132049, 0.7925407, 0.1168748, 0, 0.3058824, 1, 1,
0.3142159, 0.5495832, -0.4812688, 0, 0.2980392, 1, 1,
0.3152634, 0.5341441, 2.737016, 0, 0.2901961, 1, 1,
0.3188599, 1.842598, 0.5918523, 0, 0.2862745, 1, 1,
0.3197461, 0.3455177, 0.071114, 0, 0.2784314, 1, 1,
0.3234936, 0.0806556, 1.289879, 0, 0.2745098, 1, 1,
0.3272408, 0.8329238, 0.6498021, 0, 0.2666667, 1, 1,
0.3273503, 0.7079037, 1.787131, 0, 0.2627451, 1, 1,
0.3336782, -0.2328049, 3.379607, 0, 0.254902, 1, 1,
0.3354949, -0.6735007, 1.191729, 0, 0.2509804, 1, 1,
0.3390446, 1.119997, 0.7247554, 0, 0.2431373, 1, 1,
0.3429466, 0.001827947, 2.327458, 0, 0.2392157, 1, 1,
0.3461135, -1.137575, 1.381788, 0, 0.2313726, 1, 1,
0.3463672, -0.1159404, 3.494161, 0, 0.227451, 1, 1,
0.3471998, 1.526706, -1.833271, 0, 0.2196078, 1, 1,
0.3491363, 0.1271094, 2.346366, 0, 0.2156863, 1, 1,
0.3494639, 0.2429027, 2.273044, 0, 0.2078431, 1, 1,
0.3497171, -1.164604, 3.063618, 0, 0.2039216, 1, 1,
0.3499741, 0.3977175, -0.720495, 0, 0.1960784, 1, 1,
0.3510017, 0.1009687, 2.45782, 0, 0.1882353, 1, 1,
0.3538352, -0.7932203, 3.08595, 0, 0.1843137, 1, 1,
0.3617605, 0.4255513, 0.2473694, 0, 0.1764706, 1, 1,
0.3656059, 0.9363712, 1.262764, 0, 0.172549, 1, 1,
0.3667978, -0.5951729, 2.285246, 0, 0.1647059, 1, 1,
0.3698104, 0.5462573, 0.5959725, 0, 0.1607843, 1, 1,
0.375915, 0.9003397, 0.583993, 0, 0.1529412, 1, 1,
0.3770077, 2.450085, 0.8831661, 0, 0.1490196, 1, 1,
0.3809343, -1.492779, 1.802627, 0, 0.1411765, 1, 1,
0.3868358, 1.566754, 1.265821, 0, 0.1372549, 1, 1,
0.3915731, 1.457843, 0.6176972, 0, 0.1294118, 1, 1,
0.3944584, 2.018083, 1.008932, 0, 0.1254902, 1, 1,
0.3957848, -0.7541103, 2.478854, 0, 0.1176471, 1, 1,
0.3962214, -0.5251638, 3.308944, 0, 0.1137255, 1, 1,
0.3974798, -1.084955, 3.559871, 0, 0.1058824, 1, 1,
0.4054569, 0.247232, 1.841664, 0, 0.09803922, 1, 1,
0.4067027, -1.81814, 2.337368, 0, 0.09411765, 1, 1,
0.4137196, 0.2344301, 1.481794, 0, 0.08627451, 1, 1,
0.4193489, -0.7184277, 4.199165, 0, 0.08235294, 1, 1,
0.4221289, 0.4275476, 1.994215, 0, 0.07450981, 1, 1,
0.4224757, 0.7044569, 0.83525, 0, 0.07058824, 1, 1,
0.4252553, -0.02741714, 0.2368938, 0, 0.0627451, 1, 1,
0.427381, 1.659116, 0.7234384, 0, 0.05882353, 1, 1,
0.4276434, 0.390719, 1.989731, 0, 0.05098039, 1, 1,
0.4288727, 1.420845, -0.265188, 0, 0.04705882, 1, 1,
0.4339648, -0.2561188, 2.304396, 0, 0.03921569, 1, 1,
0.4423778, 0.3857487, -0.06726736, 0, 0.03529412, 1, 1,
0.4447801, -0.2067644, 2.224761, 0, 0.02745098, 1, 1,
0.4453928, 0.7128348, -0.2555822, 0, 0.02352941, 1, 1,
0.4516557, 1.012829, 0.1668897, 0, 0.01568628, 1, 1,
0.4531912, -0.6787936, 0.3721958, 0, 0.01176471, 1, 1,
0.4597677, -0.6940725, 4.415788, 0, 0.003921569, 1, 1,
0.4617493, 0.1600321, 1.370197, 0.003921569, 0, 1, 1,
0.4635848, -1.308931, 3.625632, 0.007843138, 0, 1, 1,
0.463925, 0.7789532, -0.4651694, 0.01568628, 0, 1, 1,
0.4666784, -0.5748768, -0.2839998, 0.01960784, 0, 1, 1,
0.4669955, -0.1141386, 1.084541, 0.02745098, 0, 1, 1,
0.467645, -1.161197, 2.089307, 0.03137255, 0, 1, 1,
0.4696488, -0.2407943, 2.648553, 0.03921569, 0, 1, 1,
0.4698116, 0.02162571, 1.189008, 0.04313726, 0, 1, 1,
0.4712057, -0.05990271, 0.5801841, 0.05098039, 0, 1, 1,
0.4741262, 0.6571403, 0.7829331, 0.05490196, 0, 1, 1,
0.4742406, 1.584131, 0.6031803, 0.0627451, 0, 1, 1,
0.4757424, 0.03275779, 2.19564, 0.06666667, 0, 1, 1,
0.486475, -0.390773, 1.643372, 0.07450981, 0, 1, 1,
0.4886894, 0.2416879, 0.9531037, 0.07843138, 0, 1, 1,
0.4888506, 1.560478, 1.60739, 0.08627451, 0, 1, 1,
0.4897431, 1.17311, 0.4637864, 0.09019608, 0, 1, 1,
0.496713, -0.3539808, 4.497677, 0.09803922, 0, 1, 1,
0.4985889, -0.6986364, 4.043843, 0.1058824, 0, 1, 1,
0.4991714, 2.128252, -0.2438186, 0.1098039, 0, 1, 1,
0.5014304, -0.9273195, 1.990634, 0.1176471, 0, 1, 1,
0.501664, -0.7329484, 1.503047, 0.1215686, 0, 1, 1,
0.5037097, -0.1231743, 2.276188, 0.1294118, 0, 1, 1,
0.5042029, 0.2118195, 1.897943, 0.1333333, 0, 1, 1,
0.5104467, 1.6091, 0.3506247, 0.1411765, 0, 1, 1,
0.5174764, 1.084797, 1.421028, 0.145098, 0, 1, 1,
0.5179909, -0.2052565, 2.003452, 0.1529412, 0, 1, 1,
0.5208274, 1.152884, 0.814528, 0.1568628, 0, 1, 1,
0.5270947, -0.1380216, 2.848263, 0.1647059, 0, 1, 1,
0.5275772, -1.062181, 2.790628, 0.1686275, 0, 1, 1,
0.5285358, -1.31734, 3.814297, 0.1764706, 0, 1, 1,
0.5325661, 0.7537915, 1.769866, 0.1803922, 0, 1, 1,
0.5350222, 0.2385037, 0.9814341, 0.1882353, 0, 1, 1,
0.5378299, -0.844136, 4.496485, 0.1921569, 0, 1, 1,
0.5393849, 0.5261983, 1.046959, 0.2, 0, 1, 1,
0.53985, 1.783818, -0.6231912, 0.2078431, 0, 1, 1,
0.5398892, 0.5348356, -0.6614679, 0.2117647, 0, 1, 1,
0.5405595, -0.6847968, 0.7996202, 0.2196078, 0, 1, 1,
0.5415972, -0.3510507, 3.57483, 0.2235294, 0, 1, 1,
0.5511577, -0.8341818, 2.751752, 0.2313726, 0, 1, 1,
0.5559406, -1.305571, 3.402686, 0.2352941, 0, 1, 1,
0.5589157, -0.6523486, 0.3431458, 0.2431373, 0, 1, 1,
0.5635456, 0.8521442, 1.865212, 0.2470588, 0, 1, 1,
0.5653622, -0.8579981, 1.778397, 0.254902, 0, 1, 1,
0.5690073, 0.6480823, 3.27236, 0.2588235, 0, 1, 1,
0.5703579, -1.051238, 2.289358, 0.2666667, 0, 1, 1,
0.5707167, 0.3301729, 2.462269, 0.2705882, 0, 1, 1,
0.5786126, 2.527203, -0.5501891, 0.2784314, 0, 1, 1,
0.5792431, -1.619359, 2.979694, 0.282353, 0, 1, 1,
0.5859296, 0.7747812, 0.4218803, 0.2901961, 0, 1, 1,
0.5898933, -0.3316076, 1.878666, 0.2941177, 0, 1, 1,
0.590457, -1.387853, 2.401723, 0.3019608, 0, 1, 1,
0.5956708, 1.97168, 1.318539, 0.3098039, 0, 1, 1,
0.6014187, 0.2506919, 1.970242, 0.3137255, 0, 1, 1,
0.6037064, -1.086844, 3.931853, 0.3215686, 0, 1, 1,
0.6045329, 1.340305, -0.1021389, 0.3254902, 0, 1, 1,
0.604623, 0.4403843, 0.04933263, 0.3333333, 0, 1, 1,
0.6059577, -1.290489, 2.188901, 0.3372549, 0, 1, 1,
0.6096337, 0.5178816, 0.6666515, 0.345098, 0, 1, 1,
0.6148807, -0.1056082, 2.703658, 0.3490196, 0, 1, 1,
0.6153017, -1.313874, 2.304545, 0.3568628, 0, 1, 1,
0.6161038, 1.452822, -0.3379794, 0.3607843, 0, 1, 1,
0.6220564, -0.5568663, -0.3669399, 0.3686275, 0, 1, 1,
0.6224728, 0.115315, -0.7223424, 0.372549, 0, 1, 1,
0.6237088, 0.3354211, 1.664546, 0.3803922, 0, 1, 1,
0.6302137, -0.3125891, 1.566172, 0.3843137, 0, 1, 1,
0.6302346, -1.169279, 2.14933, 0.3921569, 0, 1, 1,
0.6309528, 0.3843895, -1.439878, 0.3960784, 0, 1, 1,
0.631046, 0.8120034, 1.647915, 0.4039216, 0, 1, 1,
0.6472528, -0.6189809, 3.300024, 0.4117647, 0, 1, 1,
0.6480926, 0.9154469, 0.1467746, 0.4156863, 0, 1, 1,
0.6540738, 0.1980756, -0.05587771, 0.4235294, 0, 1, 1,
0.6620656, 0.3423042, 0.9339433, 0.427451, 0, 1, 1,
0.6677836, -1.562513, 2.326058, 0.4352941, 0, 1, 1,
0.6714045, 1.258272, 1.833461, 0.4392157, 0, 1, 1,
0.6794642, 0.7702104, 0.3681981, 0.4470588, 0, 1, 1,
0.6796534, 0.1699765, 1.509338, 0.4509804, 0, 1, 1,
0.680034, -0.196466, 2.218926, 0.4588235, 0, 1, 1,
0.6814861, -0.2421456, 0.3803465, 0.4627451, 0, 1, 1,
0.6833684, 0.482072, -0.2406348, 0.4705882, 0, 1, 1,
0.6843817, 0.2876801, -0.2729262, 0.4745098, 0, 1, 1,
0.6845904, -1.2039, 4.197262, 0.4823529, 0, 1, 1,
0.6852769, -0.4109766, 0.5896116, 0.4862745, 0, 1, 1,
0.6921479, 0.06852365, 3.372357, 0.4941176, 0, 1, 1,
0.693337, 0.9972189, 1.004682, 0.5019608, 0, 1, 1,
0.6952859, -0.4441983, 3.123331, 0.5058824, 0, 1, 1,
0.7006962, 0.5417385, 2.37765, 0.5137255, 0, 1, 1,
0.7041937, -0.01971794, 1.993243, 0.5176471, 0, 1, 1,
0.7043643, -0.08481633, 0.1980141, 0.5254902, 0, 1, 1,
0.7073519, -0.5391434, 2.714785, 0.5294118, 0, 1, 1,
0.7086298, 0.6259342, -0.3238837, 0.5372549, 0, 1, 1,
0.7109377, -1.231695, 2.110751, 0.5411765, 0, 1, 1,
0.7134606, -0.2336956, -0.09687325, 0.5490196, 0, 1, 1,
0.7178865, 0.2787602, 1.90907, 0.5529412, 0, 1, 1,
0.7237049, -0.1226116, 0.2211178, 0.5607843, 0, 1, 1,
0.7287228, 1.042455, 1.503203, 0.5647059, 0, 1, 1,
0.7358618, -0.2502825, 1.675081, 0.572549, 0, 1, 1,
0.7457653, -0.5647682, 1.896831, 0.5764706, 0, 1, 1,
0.7467518, 0.4926094, 1.560216, 0.5843138, 0, 1, 1,
0.7469257, 1.618085, -0.1242472, 0.5882353, 0, 1, 1,
0.7535719, -0.744778, 2.684278, 0.5960785, 0, 1, 1,
0.7585865, -0.4788473, 3.178529, 0.6039216, 0, 1, 1,
0.7604828, -1.475632, 5.304619, 0.6078432, 0, 1, 1,
0.7616463, 0.7326554, -0.09132505, 0.6156863, 0, 1, 1,
0.7617789, -1.35649, 1.978575, 0.6196079, 0, 1, 1,
0.7651666, 1.80041, 1.382129, 0.627451, 0, 1, 1,
0.7731196, 0.09450982, 1.066057, 0.6313726, 0, 1, 1,
0.7738602, 0.5108629, 3.294804, 0.6392157, 0, 1, 1,
0.778756, -0.3340012, 3.414631, 0.6431373, 0, 1, 1,
0.7850693, 0.5413051, 2.259376, 0.6509804, 0, 1, 1,
0.7863721, -0.6411788, 1.924829, 0.654902, 0, 1, 1,
0.7909205, 0.6243351, -0.0171249, 0.6627451, 0, 1, 1,
0.7960517, -0.3727273, 1.533167, 0.6666667, 0, 1, 1,
0.8005186, 0.8150951, 1.748379, 0.6745098, 0, 1, 1,
0.810797, -0.2337062, 1.913461, 0.6784314, 0, 1, 1,
0.8119432, 1.039118, 1.307933, 0.6862745, 0, 1, 1,
0.8123935, 0.9829258, 3.025138, 0.6901961, 0, 1, 1,
0.8135337, 0.435793, 0.1791377, 0.6980392, 0, 1, 1,
0.8170483, 0.7087216, 0.5960242, 0.7058824, 0, 1, 1,
0.8185742, 0.669049, -1.120414, 0.7098039, 0, 1, 1,
0.8207128, -1.411224, 2.349988, 0.7176471, 0, 1, 1,
0.8218273, 0.03382787, 1.215618, 0.7215686, 0, 1, 1,
0.8223774, -0.3317517, 2.284804, 0.7294118, 0, 1, 1,
0.8232081, 1.416909, 1.757923, 0.7333333, 0, 1, 1,
0.8301894, -1.616032, 3.168948, 0.7411765, 0, 1, 1,
0.8310965, 0.536075, 2.980872, 0.7450981, 0, 1, 1,
0.8353059, 1.449343, 0.3882369, 0.7529412, 0, 1, 1,
0.8398342, 0.6122158, 0.3421101, 0.7568628, 0, 1, 1,
0.8408853, 0.656067, 0.2485453, 0.7647059, 0, 1, 1,
0.8416411, -0.6362213, 2.709963, 0.7686275, 0, 1, 1,
0.8421968, 0.9639503, 0.9622444, 0.7764706, 0, 1, 1,
0.8465155, -0.4017905, 2.869303, 0.7803922, 0, 1, 1,
0.8465767, 4.76462, 1.851575, 0.7882353, 0, 1, 1,
0.8475912, 0.1559721, 2.80128, 0.7921569, 0, 1, 1,
0.847905, -0.3436844, 1.562806, 0.8, 0, 1, 1,
0.8526467, -1.193676, 1.409339, 0.8078431, 0, 1, 1,
0.8532656, -0.6808983, 3.00836, 0.8117647, 0, 1, 1,
0.8559224, -0.531367, 1.195205, 0.8196079, 0, 1, 1,
0.856589, 2.665696, 0.6634431, 0.8235294, 0, 1, 1,
0.8597288, 1.243308, 2.338281, 0.8313726, 0, 1, 1,
0.8616248, -0.2976145, 2.999911, 0.8352941, 0, 1, 1,
0.8618773, 0.3947538, 1.644281, 0.8431373, 0, 1, 1,
0.8795062, -1.933563, 2.282868, 0.8470588, 0, 1, 1,
0.8820022, 0.3428339, 0.2876129, 0.854902, 0, 1, 1,
0.8859865, -0.04017156, 1.427544, 0.8588235, 0, 1, 1,
0.8901165, 0.5037135, 2.740587, 0.8666667, 0, 1, 1,
0.8991154, -0.9416865, 4.218055, 0.8705882, 0, 1, 1,
0.9013942, 0.6778519, -0.3478971, 0.8784314, 0, 1, 1,
0.9082911, -0.8388234, 3.115305, 0.8823529, 0, 1, 1,
0.9128329, 0.0647325, 1.479534, 0.8901961, 0, 1, 1,
0.9206583, -1.378585, 2.83026, 0.8941177, 0, 1, 1,
0.9238585, -1.256258, 1.116714, 0.9019608, 0, 1, 1,
0.9239061, -0.2844037, 0.8789242, 0.9098039, 0, 1, 1,
0.9250076, 0.2275661, 2.325115, 0.9137255, 0, 1, 1,
0.9297352, 0.5546314, 2.230526, 0.9215686, 0, 1, 1,
0.9309246, -0.407796, 0.4465835, 0.9254902, 0, 1, 1,
0.9346913, -1.337702, 0.2651311, 0.9333333, 0, 1, 1,
0.939418, 1.124066, 1.18507, 0.9372549, 0, 1, 1,
0.9420453, -1.139392, 3.391866, 0.945098, 0, 1, 1,
0.9426796, 1.62886, -0.8417755, 0.9490196, 0, 1, 1,
0.9433451, -1.087561, 3.205832, 0.9568627, 0, 1, 1,
0.9439412, -0.3770309, 2.158006, 0.9607843, 0, 1, 1,
0.9551175, -0.9263241, 1.896589, 0.9686275, 0, 1, 1,
0.9676398, -0.6754797, 1.597626, 0.972549, 0, 1, 1,
0.968733, -0.2041283, 2.734241, 0.9803922, 0, 1, 1,
0.9695886, 0.6488833, 1.931511, 0.9843137, 0, 1, 1,
0.9766535, -0.7458798, 2.783406, 0.9921569, 0, 1, 1,
0.9809421, 0.1969248, 1.78336, 0.9960784, 0, 1, 1,
0.9834828, 1.103761, 0.04194559, 1, 0, 0.9960784, 1,
0.9902253, 0.0235266, 1.47312, 1, 0, 0.9882353, 1,
0.9964349, -1.914515, 3.32917, 1, 0, 0.9843137, 1,
1.00011, 0.4742984, 1.43529, 1, 0, 0.9764706, 1,
1.001086, -0.7277919, 2.54466, 1, 0, 0.972549, 1,
1.002133, -0.04447898, 2.118823, 1, 0, 0.9647059, 1,
1.005106, -1.317111, 3.791166, 1, 0, 0.9607843, 1,
1.005951, 1.585653, 1.278417, 1, 0, 0.9529412, 1,
1.012501, -0.7361273, 1.595232, 1, 0, 0.9490196, 1,
1.012752, 0.1281533, 1.782282, 1, 0, 0.9411765, 1,
1.018031, -0.1951815, 3.546298, 1, 0, 0.9372549, 1,
1.025606, 0.1888435, 0.8148032, 1, 0, 0.9294118, 1,
1.027498, 1.494055, 1.010105, 1, 0, 0.9254902, 1,
1.030913, 1.199829, 0.3731998, 1, 0, 0.9176471, 1,
1.035197, 0.4117201, -0.03130715, 1, 0, 0.9137255, 1,
1.04601, 0.006066652, 0.9508535, 1, 0, 0.9058824, 1,
1.049895, 1.169517, 0.381423, 1, 0, 0.9019608, 1,
1.058397, -0.8575318, 3.271655, 1, 0, 0.8941177, 1,
1.060394, 1.320877, 0.8629355, 1, 0, 0.8862745, 1,
1.063628, -1.025047, 3.530187, 1, 0, 0.8823529, 1,
1.065838, 0.4675403, 2.880561, 1, 0, 0.8745098, 1,
1.068067, -0.174805, 0.7162211, 1, 0, 0.8705882, 1,
1.077873, -0.1154853, 1.960249, 1, 0, 0.8627451, 1,
1.083538, -1.59857, 2.712631, 1, 0, 0.8588235, 1,
1.083719, 1.643059, -0.305078, 1, 0, 0.8509804, 1,
1.084401, -2.3451, 4.88343, 1, 0, 0.8470588, 1,
1.084825, 0.5846061, 2.410182, 1, 0, 0.8392157, 1,
1.088908, 0.586435, 0.9074407, 1, 0, 0.8352941, 1,
1.096627, 0.4166807, 1.13216, 1, 0, 0.827451, 1,
1.101369, 0.6642341, 0.2260232, 1, 0, 0.8235294, 1,
1.103335, -0.6409021, 3.338645, 1, 0, 0.8156863, 1,
1.105757, 1.098679, 1.772965, 1, 0, 0.8117647, 1,
1.108253, -1.898654, 2.262506, 1, 0, 0.8039216, 1,
1.108694, -0.6138185, 2.635573, 1, 0, 0.7960784, 1,
1.109957, -0.1490936, 2.905064, 1, 0, 0.7921569, 1,
1.123039, 0.5078663, 2.859427, 1, 0, 0.7843137, 1,
1.129135, -0.1497916, 1.234908, 1, 0, 0.7803922, 1,
1.130791, 0.1573803, 1.663695, 1, 0, 0.772549, 1,
1.134162, 0.5275722, 1.827739, 1, 0, 0.7686275, 1,
1.140956, 0.7299572, 3.675859, 1, 0, 0.7607843, 1,
1.141493, -0.714689, 3.5242, 1, 0, 0.7568628, 1,
1.142623, 0.3326585, 1.551568, 1, 0, 0.7490196, 1,
1.148748, 0.895456, 1.545802, 1, 0, 0.7450981, 1,
1.15027, -0.1257848, 0.2699035, 1, 0, 0.7372549, 1,
1.156609, 0.7022746, 0.9729325, 1, 0, 0.7333333, 1,
1.158314, -0.5457832, 1.130502, 1, 0, 0.7254902, 1,
1.161233, -0.4474273, 2.719465, 1, 0, 0.7215686, 1,
1.165188, 2.127955, 1.377313, 1, 0, 0.7137255, 1,
1.175335, -1.839705, 1.611261, 1, 0, 0.7098039, 1,
1.191503, -0.9855665, 4.010187, 1, 0, 0.7019608, 1,
1.193771, -0.3172259, 1.00862, 1, 0, 0.6941177, 1,
1.196795, -0.04242319, 1.055033, 1, 0, 0.6901961, 1,
1.197885, -3.324121, 4.007927, 1, 0, 0.682353, 1,
1.19908, -0.6785268, 2.690915, 1, 0, 0.6784314, 1,
1.199699, -0.5781593, 1.610128, 1, 0, 0.6705883, 1,
1.219027, -0.1501064, 1.427222, 1, 0, 0.6666667, 1,
1.2314, 2.294723, 0.6155325, 1, 0, 0.6588235, 1,
1.241553, 0.64858, -0.2433205, 1, 0, 0.654902, 1,
1.243277, 0.7326549, 0.441999, 1, 0, 0.6470588, 1,
1.247958, 0.5403451, 2.251498, 1, 0, 0.6431373, 1,
1.252095, 0.2878325, 1.315974, 1, 0, 0.6352941, 1,
1.25647, 0.4057117, 1.23744, 1, 0, 0.6313726, 1,
1.264594, -0.3439218, 0.5384592, 1, 0, 0.6235294, 1,
1.270712, -1.736277, 2.39261, 1, 0, 0.6196079, 1,
1.272295, 0.06569718, 0.504747, 1, 0, 0.6117647, 1,
1.279482, 0.03657538, -0.04103774, 1, 0, 0.6078432, 1,
1.281518, -0.8801289, 0.9926613, 1, 0, 0.6, 1,
1.294359, 2.0388, -0.1919912, 1, 0, 0.5921569, 1,
1.295186, -0.7129202, 3.070206, 1, 0, 0.5882353, 1,
1.295929, -0.4058278, 2.581815, 1, 0, 0.5803922, 1,
1.296077, -0.6125847, 1.863738, 1, 0, 0.5764706, 1,
1.305, -1.380371, 1.340567, 1, 0, 0.5686275, 1,
1.305196, 0.4745283, 2.980207, 1, 0, 0.5647059, 1,
1.306655, -0.8960937, 2.913086, 1, 0, 0.5568628, 1,
1.314494, 0.1653423, 2.184204, 1, 0, 0.5529412, 1,
1.326398, 0.6515418, 3.356553, 1, 0, 0.5450981, 1,
1.340057, -0.3081228, 0.9342579, 1, 0, 0.5411765, 1,
1.345745, 0.8410166, 0.846085, 1, 0, 0.5333334, 1,
1.346451, -1.103201, 2.284254, 1, 0, 0.5294118, 1,
1.354127, 0.1687533, -0.00131568, 1, 0, 0.5215687, 1,
1.359688, 0.6308188, 1.529542, 1, 0, 0.5176471, 1,
1.362325, -0.06730358, 1.384408, 1, 0, 0.509804, 1,
1.368146, -0.8939582, 0.918991, 1, 0, 0.5058824, 1,
1.36943, 0.05570576, 0.00488949, 1, 0, 0.4980392, 1,
1.37843, 1.324396, 0.5545854, 1, 0, 0.4901961, 1,
1.380028, 0.4542767, 0.475408, 1, 0, 0.4862745, 1,
1.384602, 2.206834, 2.391828, 1, 0, 0.4784314, 1,
1.444178, 2.356672, 0.6591997, 1, 0, 0.4745098, 1,
1.446089, 0.3825502, 3.280471, 1, 0, 0.4666667, 1,
1.448353, -0.7496589, 0.2930711, 1, 0, 0.4627451, 1,
1.451426, 0.1860588, 2.07881, 1, 0, 0.454902, 1,
1.454273, 1.255232, -0.3315323, 1, 0, 0.4509804, 1,
1.456597, 1.044543, -0.1913681, 1, 0, 0.4431373, 1,
1.459745, 0.2834878, 1.588126, 1, 0, 0.4392157, 1,
1.46208, -1.187351, 2.866683, 1, 0, 0.4313726, 1,
1.463845, -1.821979, 1.550212, 1, 0, 0.427451, 1,
1.471294, -0.387193, 0.5879644, 1, 0, 0.4196078, 1,
1.478459, 0.1930641, 2.924174, 1, 0, 0.4156863, 1,
1.48157, -0.7816191, 1.920866, 1, 0, 0.4078431, 1,
1.495796, 1.551104, -0.3139217, 1, 0, 0.4039216, 1,
1.497898, 0.04572497, 0.3042262, 1, 0, 0.3960784, 1,
1.519927, 0.8872475, -0.4495712, 1, 0, 0.3882353, 1,
1.526586, 0.6594989, 0.1229355, 1, 0, 0.3843137, 1,
1.532438, 0.190973, 1.98844, 1, 0, 0.3764706, 1,
1.534246, 0.09586585, 0.3298087, 1, 0, 0.372549, 1,
1.534681, -2.014452, 2.204257, 1, 0, 0.3647059, 1,
1.543615, 0.4997804, 1.143828, 1, 0, 0.3607843, 1,
1.548301, -1.636051, 0.2212033, 1, 0, 0.3529412, 1,
1.557538, -0.9760447, 2.245861, 1, 0, 0.3490196, 1,
1.559378, -0.174885, -0.420242, 1, 0, 0.3411765, 1,
1.559903, 1.830218, 1.001127, 1, 0, 0.3372549, 1,
1.566786, 1.653473, 0.5558047, 1, 0, 0.3294118, 1,
1.574188, -0.09042751, 2.03267, 1, 0, 0.3254902, 1,
1.585792, 0.1818719, 0.3253097, 1, 0, 0.3176471, 1,
1.595498, -0.4199837, 3.226578, 1, 0, 0.3137255, 1,
1.599139, -0.2745179, 1.792364, 1, 0, 0.3058824, 1,
1.60228, 0.9076277, -0.1015777, 1, 0, 0.2980392, 1,
1.612919, 0.07748222, 1.055197, 1, 0, 0.2941177, 1,
1.615234, -0.9690744, 1.380845, 1, 0, 0.2862745, 1,
1.617371, -0.6724666, 1.420547, 1, 0, 0.282353, 1,
1.632596, -0.09317658, -0.05969531, 1, 0, 0.2745098, 1,
1.633462, -0.2257298, 1.918858, 1, 0, 0.2705882, 1,
1.63612, 0.2730556, -0.607848, 1, 0, 0.2627451, 1,
1.644576, 1.1518, -0.06215382, 1, 0, 0.2588235, 1,
1.64511, 0.7377506, 0.9353201, 1, 0, 0.2509804, 1,
1.648171, 2.135649, 0.9749578, 1, 0, 0.2470588, 1,
1.648197, -0.2055942, 2.417719, 1, 0, 0.2392157, 1,
1.66738, -0.6705059, 3.513566, 1, 0, 0.2352941, 1,
1.676684, 2.324954, 0.6457028, 1, 0, 0.227451, 1,
1.680758, -0.6706764, 1.042469, 1, 0, 0.2235294, 1,
1.684222, 0.2496776, 2.808898, 1, 0, 0.2156863, 1,
1.686832, -1.299721, 3.301075, 1, 0, 0.2117647, 1,
1.710372, 1.522019, 2.372148, 1, 0, 0.2039216, 1,
1.71805, 0.05002375, 1.532791, 1, 0, 0.1960784, 1,
1.729753, 0.9163874, 1.45948, 1, 0, 0.1921569, 1,
1.731694, 0.821478, 2.90041, 1, 0, 0.1843137, 1,
1.732329, -0.161479, 2.425437, 1, 0, 0.1803922, 1,
1.747567, 0.5714393, 2.089717, 1, 0, 0.172549, 1,
1.769778, -0.8723518, 3.358186, 1, 0, 0.1686275, 1,
1.782845, 0.5191674, -1.2074, 1, 0, 0.1607843, 1,
1.785701, -1.11274, 1.935923, 1, 0, 0.1568628, 1,
1.787229, -0.6646824, 3.212588, 1, 0, 0.1490196, 1,
1.794574, 1.027069, 1.484726, 1, 0, 0.145098, 1,
1.795474, -0.2024233, 2.384508, 1, 0, 0.1372549, 1,
1.796954, 0.8556795, 0.3357452, 1, 0, 0.1333333, 1,
1.803725, -1.758403, 3.79586, 1, 0, 0.1254902, 1,
1.822219, -0.5842027, 2.087072, 1, 0, 0.1215686, 1,
1.854829, 2.071037, 1.795403, 1, 0, 0.1137255, 1,
1.884476, -1.383925, 1.940044, 1, 0, 0.1098039, 1,
1.897038, -0.301383, 2.67037, 1, 0, 0.1019608, 1,
1.897404, 0.0283269, 2.472949, 1, 0, 0.09411765, 1,
1.897624, 0.5083216, 1.999467, 1, 0, 0.09019608, 1,
1.910414, -1.063478, 2.454472, 1, 0, 0.08235294, 1,
1.965567, -0.7611585, 1.850684, 1, 0, 0.07843138, 1,
1.989168, 0.6706685, 1.210679, 1, 0, 0.07058824, 1,
2.024808, -0.6303399, 2.550614, 1, 0, 0.06666667, 1,
2.038628, -0.2917962, 1.436251, 1, 0, 0.05882353, 1,
2.066684, 0.4113333, 1.448365, 1, 0, 0.05490196, 1,
2.100976, -0.1226227, 2.059042, 1, 0, 0.04705882, 1,
2.174104, -0.7699877, 1.230268, 1, 0, 0.04313726, 1,
2.381793, -1.107435, 3.843467, 1, 0, 0.03529412, 1,
2.454988, 0.56218, 2.048021, 1, 0, 0.03137255, 1,
2.462072, -0.6561277, 1.011702, 1, 0, 0.02352941, 1,
2.502631, -0.07981975, 2.570742, 1, 0, 0.01960784, 1,
2.701514, 1.485228, 0.8279469, 1, 0, 0.01176471, 1,
2.833546, -0.6667527, 0.04896845, 1, 0, 0.007843138, 1
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
-0.1172938, -4.695163, -6.922521, 0, -0.5, 0.5, 0.5,
-0.1172938, -4.695163, -6.922521, 1, -0.5, 0.5, 0.5,
-0.1172938, -4.695163, -6.922521, 1, 1.5, 0.5, 0.5,
-0.1172938, -4.695163, -6.922521, 0, 1.5, 0.5, 0.5
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
-4.068468, 0.7202494, -6.922521, 0, -0.5, 0.5, 0.5,
-4.068468, 0.7202494, -6.922521, 1, -0.5, 0.5, 0.5,
-4.068468, 0.7202494, -6.922521, 1, 1.5, 0.5, 0.5,
-4.068468, 0.7202494, -6.922521, 0, 1.5, 0.5, 0.5
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
-4.068468, -4.695163, 0.07711148, 0, -0.5, 0.5, 0.5,
-4.068468, -4.695163, 0.07711148, 1, -0.5, 0.5, 0.5,
-4.068468, -4.695163, 0.07711148, 1, 1.5, 0.5, 0.5,
-4.068468, -4.695163, 0.07711148, 0, 1.5, 0.5, 0.5
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
-3, -3.445453, -5.307221,
2, -3.445453, -5.307221,
-3, -3.445453, -5.307221,
-3, -3.653738, -5.576438,
-2, -3.445453, -5.307221,
-2, -3.653738, -5.576438,
-1, -3.445453, -5.307221,
-1, -3.653738, -5.576438,
0, -3.445453, -5.307221,
0, -3.653738, -5.576438,
1, -3.445453, -5.307221,
1, -3.653738, -5.576438,
2, -3.445453, -5.307221,
2, -3.653738, -5.576438
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
-3, -4.070308, -6.114871, 0, -0.5, 0.5, 0.5,
-3, -4.070308, -6.114871, 1, -0.5, 0.5, 0.5,
-3, -4.070308, -6.114871, 1, 1.5, 0.5, 0.5,
-3, -4.070308, -6.114871, 0, 1.5, 0.5, 0.5,
-2, -4.070308, -6.114871, 0, -0.5, 0.5, 0.5,
-2, -4.070308, -6.114871, 1, -0.5, 0.5, 0.5,
-2, -4.070308, -6.114871, 1, 1.5, 0.5, 0.5,
-2, -4.070308, -6.114871, 0, 1.5, 0.5, 0.5,
-1, -4.070308, -6.114871, 0, -0.5, 0.5, 0.5,
-1, -4.070308, -6.114871, 1, -0.5, 0.5, 0.5,
-1, -4.070308, -6.114871, 1, 1.5, 0.5, 0.5,
-1, -4.070308, -6.114871, 0, 1.5, 0.5, 0.5,
0, -4.070308, -6.114871, 0, -0.5, 0.5, 0.5,
0, -4.070308, -6.114871, 1, -0.5, 0.5, 0.5,
0, -4.070308, -6.114871, 1, 1.5, 0.5, 0.5,
0, -4.070308, -6.114871, 0, 1.5, 0.5, 0.5,
1, -4.070308, -6.114871, 0, -0.5, 0.5, 0.5,
1, -4.070308, -6.114871, 1, -0.5, 0.5, 0.5,
1, -4.070308, -6.114871, 1, 1.5, 0.5, 0.5,
1, -4.070308, -6.114871, 0, 1.5, 0.5, 0.5,
2, -4.070308, -6.114871, 0, -0.5, 0.5, 0.5,
2, -4.070308, -6.114871, 1, -0.5, 0.5, 0.5,
2, -4.070308, -6.114871, 1, 1.5, 0.5, 0.5,
2, -4.070308, -6.114871, 0, 1.5, 0.5, 0.5
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
-3.156659, -2, -5.307221,
-3.156659, 4, -5.307221,
-3.156659, -2, -5.307221,
-3.308627, -2, -5.576438,
-3.156659, 0, -5.307221,
-3.308627, 0, -5.576438,
-3.156659, 2, -5.307221,
-3.308627, 2, -5.576438,
-3.156659, 4, -5.307221,
-3.308627, 4, -5.576438
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
"2",
"4"
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
-3.612564, -2, -6.114871, 0, -0.5, 0.5, 0.5,
-3.612564, -2, -6.114871, 1, -0.5, 0.5, 0.5,
-3.612564, -2, -6.114871, 1, 1.5, 0.5, 0.5,
-3.612564, -2, -6.114871, 0, 1.5, 0.5, 0.5,
-3.612564, 0, -6.114871, 0, -0.5, 0.5, 0.5,
-3.612564, 0, -6.114871, 1, -0.5, 0.5, 0.5,
-3.612564, 0, -6.114871, 1, 1.5, 0.5, 0.5,
-3.612564, 0, -6.114871, 0, 1.5, 0.5, 0.5,
-3.612564, 2, -6.114871, 0, -0.5, 0.5, 0.5,
-3.612564, 2, -6.114871, 1, -0.5, 0.5, 0.5,
-3.612564, 2, -6.114871, 1, 1.5, 0.5, 0.5,
-3.612564, 2, -6.114871, 0, 1.5, 0.5, 0.5,
-3.612564, 4, -6.114871, 0, -0.5, 0.5, 0.5,
-3.612564, 4, -6.114871, 1, -0.5, 0.5, 0.5,
-3.612564, 4, -6.114871, 1, 1.5, 0.5, 0.5,
-3.612564, 4, -6.114871, 0, 1.5, 0.5, 0.5
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
-3.156659, -3.445453, -4,
-3.156659, -3.445453, 4,
-3.156659, -3.445453, -4,
-3.308627, -3.653738, -4,
-3.156659, -3.445453, -2,
-3.308627, -3.653738, -2,
-3.156659, -3.445453, 0,
-3.308627, -3.653738, 0,
-3.156659, -3.445453, 2,
-3.308627, -3.653738, 2,
-3.156659, -3.445453, 4,
-3.308627, -3.653738, 4
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
-3.612564, -4.070308, -4, 0, -0.5, 0.5, 0.5,
-3.612564, -4.070308, -4, 1, -0.5, 0.5, 0.5,
-3.612564, -4.070308, -4, 1, 1.5, 0.5, 0.5,
-3.612564, -4.070308, -4, 0, 1.5, 0.5, 0.5,
-3.612564, -4.070308, -2, 0, -0.5, 0.5, 0.5,
-3.612564, -4.070308, -2, 1, -0.5, 0.5, 0.5,
-3.612564, -4.070308, -2, 1, 1.5, 0.5, 0.5,
-3.612564, -4.070308, -2, 0, 1.5, 0.5, 0.5,
-3.612564, -4.070308, 0, 0, -0.5, 0.5, 0.5,
-3.612564, -4.070308, 0, 1, -0.5, 0.5, 0.5,
-3.612564, -4.070308, 0, 1, 1.5, 0.5, 0.5,
-3.612564, -4.070308, 0, 0, 1.5, 0.5, 0.5,
-3.612564, -4.070308, 2, 0, -0.5, 0.5, 0.5,
-3.612564, -4.070308, 2, 1, -0.5, 0.5, 0.5,
-3.612564, -4.070308, 2, 1, 1.5, 0.5, 0.5,
-3.612564, -4.070308, 2, 0, 1.5, 0.5, 0.5,
-3.612564, -4.070308, 4, 0, -0.5, 0.5, 0.5,
-3.612564, -4.070308, 4, 1, -0.5, 0.5, 0.5,
-3.612564, -4.070308, 4, 1, 1.5, 0.5, 0.5,
-3.612564, -4.070308, 4, 0, 1.5, 0.5, 0.5
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
-3.156659, -3.445453, -5.307221,
-3.156659, 4.885952, -5.307221,
-3.156659, -3.445453, 5.461444,
-3.156659, 4.885952, 5.461444,
-3.156659, -3.445453, -5.307221,
-3.156659, -3.445453, 5.461444,
-3.156659, 4.885952, -5.307221,
-3.156659, 4.885952, 5.461444,
-3.156659, -3.445453, -5.307221,
2.922071, -3.445453, -5.307221,
-3.156659, -3.445453, 5.461444,
2.922071, -3.445453, 5.461444,
-3.156659, 4.885952, -5.307221,
2.922071, 4.885952, -5.307221,
-3.156659, 4.885952, 5.461444,
2.922071, 4.885952, 5.461444,
2.922071, -3.445453, -5.307221,
2.922071, 4.885952, -5.307221,
2.922071, -3.445453, 5.461444,
2.922071, 4.885952, 5.461444,
2.922071, -3.445453, -5.307221,
2.922071, -3.445453, 5.461444,
2.922071, 4.885952, -5.307221,
2.922071, 4.885952, 5.461444
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
var radius = 7.961996;
var distance = 35.42382;
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
mvMatrix.translate( 0.1172938, -0.7202494, -0.07711148 );
mvMatrix.scale( 1.416195, 1.033279, 0.7994182 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.42382);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


