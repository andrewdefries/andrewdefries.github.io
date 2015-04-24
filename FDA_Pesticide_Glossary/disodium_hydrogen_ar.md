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
-3.240112, 0.7637716, -2.658542, 1, 0, 0, 1,
-2.542366, 0.5155751, -1.038423, 1, 0.007843138, 0, 1,
-2.522121, -0.3139056, -0.9667116, 1, 0.01176471, 0, 1,
-2.467754, 2.938033, -0.7028902, 1, 0.01960784, 0, 1,
-2.422626, 0.3506503, -2.209092, 1, 0.02352941, 0, 1,
-2.323924, 0.03814029, -0.954298, 1, 0.03137255, 0, 1,
-2.242095, 1.162561, 1.14878, 1, 0.03529412, 0, 1,
-2.228491, 1.46686, 0.2434812, 1, 0.04313726, 0, 1,
-2.223686, 1.588906, -0.2803447, 1, 0.04705882, 0, 1,
-2.220799, -0.4372835, -1.939746, 1, 0.05490196, 0, 1,
-2.172505, 0.1140611, 0.4913964, 1, 0.05882353, 0, 1,
-2.167511, 0.3016477, -2.728106, 1, 0.06666667, 0, 1,
-2.163067, -1.552463, -2.077233, 1, 0.07058824, 0, 1,
-2.161592, 1.362171, -3.332181, 1, 0.07843138, 0, 1,
-2.139668, 0.6634893, -1.3783, 1, 0.08235294, 0, 1,
-2.108448, 2.638723, -0.5837395, 1, 0.09019608, 0, 1,
-2.079276, 0.4298314, -1.220591, 1, 0.09411765, 0, 1,
-2.062175, 0.5059931, -2.995642, 1, 0.1019608, 0, 1,
-2.05278, -1.108063, -3.190601, 1, 0.1098039, 0, 1,
-1.98665, 1.225471, -1.676846, 1, 0.1137255, 0, 1,
-1.974511, -1.43242, -1.790908, 1, 0.1215686, 0, 1,
-1.967239, 0.06751388, -0.6071437, 1, 0.1254902, 0, 1,
-1.953729, -2.138276, -2.891576, 1, 0.1333333, 0, 1,
-1.941433, 2.146506, -0.7655035, 1, 0.1372549, 0, 1,
-1.933578, -0.728245, -1.590092, 1, 0.145098, 0, 1,
-1.913284, 1.90351, -1.126704, 1, 0.1490196, 0, 1,
-1.912952, -1.828475, -2.435727, 1, 0.1568628, 0, 1,
-1.874392, 0.4525176, -2.413793, 1, 0.1607843, 0, 1,
-1.865153, 0.9907179, -0.6211211, 1, 0.1686275, 0, 1,
-1.854981, -1.02211, -3.14658, 1, 0.172549, 0, 1,
-1.82559, 0.133219, -1.8438, 1, 0.1803922, 0, 1,
-1.823385, -0.9503529, -2.760789, 1, 0.1843137, 0, 1,
-1.816105, 0.8337551, -0.2256156, 1, 0.1921569, 0, 1,
-1.808895, -0.7477854, -2.479451, 1, 0.1960784, 0, 1,
-1.8062, 0.3601823, -1.464121, 1, 0.2039216, 0, 1,
-1.802312, 0.5596482, -1.368746, 1, 0.2117647, 0, 1,
-1.754325, -0.5397532, -1.622054, 1, 0.2156863, 0, 1,
-1.752437, -0.9419311, -0.9478152, 1, 0.2235294, 0, 1,
-1.749385, 1.022161, -0.9610573, 1, 0.227451, 0, 1,
-1.745614, -0.7466334, -0.4325102, 1, 0.2352941, 0, 1,
-1.7401, -1.176141, -3.197647, 1, 0.2392157, 0, 1,
-1.72366, -0.14021, -2.408811, 1, 0.2470588, 0, 1,
-1.720533, -1.40456, -3.655179, 1, 0.2509804, 0, 1,
-1.710599, -0.5392447, -0.6894872, 1, 0.2588235, 0, 1,
-1.710588, -0.4027272, -2.245155, 1, 0.2627451, 0, 1,
-1.698712, 0.1694735, -1.629261, 1, 0.2705882, 0, 1,
-1.698606, -0.6886295, -1.594687, 1, 0.2745098, 0, 1,
-1.697831, -1.062256, -3.21897, 1, 0.282353, 0, 1,
-1.684333, 1.795273, -1.158034, 1, 0.2862745, 0, 1,
-1.682011, -0.6192514, -1.893934, 1, 0.2941177, 0, 1,
-1.670081, -0.4775894, -2.696105, 1, 0.3019608, 0, 1,
-1.658101, 1.167185, -1.587387, 1, 0.3058824, 0, 1,
-1.635928, -0.6014327, 0.6474426, 1, 0.3137255, 0, 1,
-1.630619, -0.1068598, -1.82614, 1, 0.3176471, 0, 1,
-1.629662, -1.015407, -2.190268, 1, 0.3254902, 0, 1,
-1.626317, 0.6920313, -2.471045, 1, 0.3294118, 0, 1,
-1.625967, 0.608996, 1.178316, 1, 0.3372549, 0, 1,
-1.623475, -0.581799, -2.123954, 1, 0.3411765, 0, 1,
-1.617927, -0.5658313, 1.134346, 1, 0.3490196, 0, 1,
-1.596672, 0.8435678, 0.01815521, 1, 0.3529412, 0, 1,
-1.596596, 0.2971423, -1.898908, 1, 0.3607843, 0, 1,
-1.583831, -0.7365751, 0.8982137, 1, 0.3647059, 0, 1,
-1.572866, -0.2171339, -1.750278, 1, 0.372549, 0, 1,
-1.563431, -0.3942616, -3.405603, 1, 0.3764706, 0, 1,
-1.56309, 0.6135433, -2.68898, 1, 0.3843137, 0, 1,
-1.562135, -0.7504525, -0.5076272, 1, 0.3882353, 0, 1,
-1.553988, 0.386972, -1.265994, 1, 0.3960784, 0, 1,
-1.547755, -0.6305053, -2.875199, 1, 0.4039216, 0, 1,
-1.534245, 0.05741791, 0.2757377, 1, 0.4078431, 0, 1,
-1.531388, -0.009318573, -0.9280192, 1, 0.4156863, 0, 1,
-1.527487, -1.079992, -1.981862, 1, 0.4196078, 0, 1,
-1.526328, 0.9320007, -3.601429, 1, 0.427451, 0, 1,
-1.49693, -0.2064652, -0.4229315, 1, 0.4313726, 0, 1,
-1.495065, -0.9478869, -4.161484, 1, 0.4392157, 0, 1,
-1.492125, -1.113194, -3.2518, 1, 0.4431373, 0, 1,
-1.488771, 1.55379, -1.589656, 1, 0.4509804, 0, 1,
-1.473412, -0.5462182, -1.663954, 1, 0.454902, 0, 1,
-1.472852, 0.2841873, -2.04826, 1, 0.4627451, 0, 1,
-1.46848, -0.5084344, -1.357308, 1, 0.4666667, 0, 1,
-1.458461, 0.2606976, -2.183068, 1, 0.4745098, 0, 1,
-1.458075, -0.3073148, -2.42006, 1, 0.4784314, 0, 1,
-1.446167, 0.5481258, 0.09779811, 1, 0.4862745, 0, 1,
-1.44488, -0.07313727, -1.865714, 1, 0.4901961, 0, 1,
-1.438281, -1.212721, -3.599406, 1, 0.4980392, 0, 1,
-1.436625, -0.5881457, -1.004821, 1, 0.5058824, 0, 1,
-1.414299, -0.6961551, -4.241547, 1, 0.509804, 0, 1,
-1.413754, -0.6829516, -2.272051, 1, 0.5176471, 0, 1,
-1.402128, 1.079873, 0.5594712, 1, 0.5215687, 0, 1,
-1.395432, 1.335355, 0.7206589, 1, 0.5294118, 0, 1,
-1.384143, 1.447224, -0.2823562, 1, 0.5333334, 0, 1,
-1.38332, 1.341089, 0.4832043, 1, 0.5411765, 0, 1,
-1.383176, -0.1916858, -2.247706, 1, 0.5450981, 0, 1,
-1.371605, -1.231955, -1.388219, 1, 0.5529412, 0, 1,
-1.371478, 0.688678, -0.9253185, 1, 0.5568628, 0, 1,
-1.370694, -0.5471924, -2.351729, 1, 0.5647059, 0, 1,
-1.36018, -0.5032763, -1.622454, 1, 0.5686275, 0, 1,
-1.357587, -1.422134, -2.023468, 1, 0.5764706, 0, 1,
-1.357018, -0.5667074, -0.3971204, 1, 0.5803922, 0, 1,
-1.35559, -1.976135, -1.320748, 1, 0.5882353, 0, 1,
-1.351338, 1.606197, -1.171172, 1, 0.5921569, 0, 1,
-1.329699, -0.22656, -2.702101, 1, 0.6, 0, 1,
-1.328531, 1.165643, -0.07407239, 1, 0.6078432, 0, 1,
-1.326759, -0.7194474, -1.29774, 1, 0.6117647, 0, 1,
-1.326013, 0.5039443, -1.186737, 1, 0.6196079, 0, 1,
-1.317428, 0.2094732, 0.2028704, 1, 0.6235294, 0, 1,
-1.317149, 0.3144588, -2.382071, 1, 0.6313726, 0, 1,
-1.312191, 0.3040743, -1.61237, 1, 0.6352941, 0, 1,
-1.31129, 1.233906, -0.5911192, 1, 0.6431373, 0, 1,
-1.303938, 0.2944875, -1.450956, 1, 0.6470588, 0, 1,
-1.303163, 0.01931157, -0.7662054, 1, 0.654902, 0, 1,
-1.298685, 0.5254098, -1.805754, 1, 0.6588235, 0, 1,
-1.29186, 0.3969477, -1.594426, 1, 0.6666667, 0, 1,
-1.288592, -1.112154, -3.446507, 1, 0.6705883, 0, 1,
-1.284838, 0.2438617, -2.403123, 1, 0.6784314, 0, 1,
-1.280517, 0.6825014, 0.6881219, 1, 0.682353, 0, 1,
-1.280269, 0.3307771, -1.798508, 1, 0.6901961, 0, 1,
-1.279801, -0.5672481, -2.282562, 1, 0.6941177, 0, 1,
-1.27851, -0.2202211, -2.546537, 1, 0.7019608, 0, 1,
-1.274146, 0.7684312, -0.701056, 1, 0.7098039, 0, 1,
-1.273456, -1.743288, -3.477088, 1, 0.7137255, 0, 1,
-1.269026, -0.1405725, -2.62877, 1, 0.7215686, 0, 1,
-1.26614, -0.5245202, -2.591278, 1, 0.7254902, 0, 1,
-1.264944, -2.187862, -1.196125, 1, 0.7333333, 0, 1,
-1.256308, -0.7163817, -0.9433914, 1, 0.7372549, 0, 1,
-1.255733, -0.488699, -2.726388, 1, 0.7450981, 0, 1,
-1.253174, 0.647618, 0.6915712, 1, 0.7490196, 0, 1,
-1.251544, 0.8461784, -0.4494486, 1, 0.7568628, 0, 1,
-1.247058, 0.06057882, -1.284204, 1, 0.7607843, 0, 1,
-1.245877, 0.1721359, -0.08542915, 1, 0.7686275, 0, 1,
-1.234737, 0.7915006, -3.78565, 1, 0.772549, 0, 1,
-1.228569, -1.258288, -2.994635, 1, 0.7803922, 0, 1,
-1.224381, -0.6215696, -2.89262, 1, 0.7843137, 0, 1,
-1.219846, -0.9424459, -1.060971, 1, 0.7921569, 0, 1,
-1.21418, -0.1052624, -0.8766336, 1, 0.7960784, 0, 1,
-1.207877, 2.022036, -1.213367, 1, 0.8039216, 0, 1,
-1.17021, -1.608437, -3.429923, 1, 0.8117647, 0, 1,
-1.166271, -0.726232, -2.890511, 1, 0.8156863, 0, 1,
-1.151547, -0.1806645, -1.420726, 1, 0.8235294, 0, 1,
-1.150692, -0.02029806, -1.85817, 1, 0.827451, 0, 1,
-1.141563, -0.5396441, -3.326379, 1, 0.8352941, 0, 1,
-1.135768, -0.652223, -1.921836, 1, 0.8392157, 0, 1,
-1.133031, 1.231283, -0.3006288, 1, 0.8470588, 0, 1,
-1.118184, -0.1254378, -2.877724, 1, 0.8509804, 0, 1,
-1.109469, -1.093889, -2.255921, 1, 0.8588235, 0, 1,
-1.100022, -1.648584, -3.200199, 1, 0.8627451, 0, 1,
-1.086557, -0.02359381, -0.2968353, 1, 0.8705882, 0, 1,
-1.082464, -0.2923717, -1.66338, 1, 0.8745098, 0, 1,
-1.079599, 0.2804666, -2.197268, 1, 0.8823529, 0, 1,
-1.076676, -0.289003, -2.341395, 1, 0.8862745, 0, 1,
-1.074309, 0.2109933, -1.83567, 1, 0.8941177, 0, 1,
-1.071945, -0.03597856, -1.806538, 1, 0.8980392, 0, 1,
-1.071932, 1.315146, -1.050391, 1, 0.9058824, 0, 1,
-1.066763, -0.3316409, -0.3435926, 1, 0.9137255, 0, 1,
-1.061965, 0.246173, -1.086713, 1, 0.9176471, 0, 1,
-1.058335, -1.91013, -3.526988, 1, 0.9254902, 0, 1,
-1.057872, -2.422263, -2.167069, 1, 0.9294118, 0, 1,
-1.053996, 0.7649282, -0.6710687, 1, 0.9372549, 0, 1,
-1.048456, 1.1794, -1.300667, 1, 0.9411765, 0, 1,
-1.045553, -0.3557418, -2.319474, 1, 0.9490196, 0, 1,
-1.044683, 0.9619244, -1.095117, 1, 0.9529412, 0, 1,
-1.04406, 2.549595, -0.6208042, 1, 0.9607843, 0, 1,
-1.03517, -1.243047, -2.733848, 1, 0.9647059, 0, 1,
-1.034888, 2.010391, -0.7211905, 1, 0.972549, 0, 1,
-1.032848, 1.889554, 0.4562088, 1, 0.9764706, 0, 1,
-1.03153, 0.9116076, -0.4333549, 1, 0.9843137, 0, 1,
-1.027212, 1.084222, 1.372028, 1, 0.9882353, 0, 1,
-1.022926, -0.4522555, -1.199887, 1, 0.9960784, 0, 1,
-1.016516, -1.184856, -3.492389, 0.9960784, 1, 0, 1,
-1.014107, -0.4842685, -1.829313, 0.9921569, 1, 0, 1,
-1.011569, 0.9652953, -1.263886, 0.9843137, 1, 0, 1,
-0.9990722, -2.04181, -3.00511, 0.9803922, 1, 0, 1,
-0.9933906, -0.701869, -1.535201, 0.972549, 1, 0, 1,
-0.991659, -0.18975, -2.351285, 0.9686275, 1, 0, 1,
-0.9892376, -1.478724, -0.7708863, 0.9607843, 1, 0, 1,
-0.9858547, 0.2802926, -0.4592722, 0.9568627, 1, 0, 1,
-0.9805924, 0.6935025, -1.425415, 0.9490196, 1, 0, 1,
-0.9767894, -0.7291865, -2.881507, 0.945098, 1, 0, 1,
-0.9752519, -0.565565, -2.020702, 0.9372549, 1, 0, 1,
-0.9711132, 0.8106735, -0.7831589, 0.9333333, 1, 0, 1,
-0.9685234, -0.8366484, -2.967076, 0.9254902, 1, 0, 1,
-0.9656101, 0.8200454, -0.1641967, 0.9215686, 1, 0, 1,
-0.9644043, 0.1449238, -3.178702, 0.9137255, 1, 0, 1,
-0.9595473, -0.3591349, -2.765046, 0.9098039, 1, 0, 1,
-0.9535659, 0.8630558, -0.2918021, 0.9019608, 1, 0, 1,
-0.9529482, 0.838761, -1.666299, 0.8941177, 1, 0, 1,
-0.9513314, -0.2031941, -1.987046, 0.8901961, 1, 0, 1,
-0.9392473, 0.911189, -1.483193, 0.8823529, 1, 0, 1,
-0.9325927, -0.670379, -2.667974, 0.8784314, 1, 0, 1,
-0.9294717, 0.606263, -1.321827, 0.8705882, 1, 0, 1,
-0.9231991, 0.2255861, -0.9331721, 0.8666667, 1, 0, 1,
-0.9224098, -0.4416975, -1.545766, 0.8588235, 1, 0, 1,
-0.921738, -0.3127532, -2.58537, 0.854902, 1, 0, 1,
-0.9198125, 1.430608, -1.666187, 0.8470588, 1, 0, 1,
-0.910635, -0.1142577, -2.094563, 0.8431373, 1, 0, 1,
-0.9082921, -0.5757893, -2.064213, 0.8352941, 1, 0, 1,
-0.8952468, -0.9580864, -3.077248, 0.8313726, 1, 0, 1,
-0.8869575, -1.830888, -2.123497, 0.8235294, 1, 0, 1,
-0.8864245, 0.9401651, 0.1700153, 0.8196079, 1, 0, 1,
-0.8837654, -1.416847, -3.526917, 0.8117647, 1, 0, 1,
-0.8771131, -1.394124, -4.323568, 0.8078431, 1, 0, 1,
-0.8712146, 0.4282062, -0.371707, 0.8, 1, 0, 1,
-0.8686032, 0.4452992, -2.546855, 0.7921569, 1, 0, 1,
-0.8661473, -3.080423, -2.232772, 0.7882353, 1, 0, 1,
-0.8590734, -2.384148, -2.682943, 0.7803922, 1, 0, 1,
-0.8532224, 2.054693, 0.5077755, 0.7764706, 1, 0, 1,
-0.850275, 0.3867228, -2.075685, 0.7686275, 1, 0, 1,
-0.849728, 1.379686, -1.445345, 0.7647059, 1, 0, 1,
-0.8466779, 0.2067132, -1.660244, 0.7568628, 1, 0, 1,
-0.8405024, -0.3216909, -1.288541, 0.7529412, 1, 0, 1,
-0.8393632, 0.5403036, -2.204022, 0.7450981, 1, 0, 1,
-0.8367344, -1.233451, -3.81004, 0.7411765, 1, 0, 1,
-0.8309692, 0.1929708, -1.041927, 0.7333333, 1, 0, 1,
-0.8308819, 0.2116659, -1.850048, 0.7294118, 1, 0, 1,
-0.8275162, 0.3557355, -4.491374, 0.7215686, 1, 0, 1,
-0.824521, 1.116209, -1.136874, 0.7176471, 1, 0, 1,
-0.8225648, -1.76181, -2.405041, 0.7098039, 1, 0, 1,
-0.8223294, 0.4461284, -2.420919, 0.7058824, 1, 0, 1,
-0.817772, -0.147784, -3.561356, 0.6980392, 1, 0, 1,
-0.8147207, -2.002941, -2.773496, 0.6901961, 1, 0, 1,
-0.8146166, 1.235991, -1.219246, 0.6862745, 1, 0, 1,
-0.802946, 0.4423334, -0.4478958, 0.6784314, 1, 0, 1,
-0.8024755, 1.128046, -0.8972522, 0.6745098, 1, 0, 1,
-0.8009301, -0.008701673, -1.802997, 0.6666667, 1, 0, 1,
-0.7978136, 0.6584282, -0.6515587, 0.6627451, 1, 0, 1,
-0.7869178, 0.8154678, -2.190625, 0.654902, 1, 0, 1,
-0.778403, -0.6000125, -1.986053, 0.6509804, 1, 0, 1,
-0.7739449, 0.8911645, 0.07975547, 0.6431373, 1, 0, 1,
-0.7691816, -0.4146679, -2.830384, 0.6392157, 1, 0, 1,
-0.7651381, 2.116515, 0.845216, 0.6313726, 1, 0, 1,
-0.7553154, 0.7959197, -0.8830907, 0.627451, 1, 0, 1,
-0.7511458, 1.154023, -0.1075717, 0.6196079, 1, 0, 1,
-0.7504553, 0.8227982, -1.115885, 0.6156863, 1, 0, 1,
-0.7504405, 0.559894, -0.1702177, 0.6078432, 1, 0, 1,
-0.7421793, 1.061261, 0.8705894, 0.6039216, 1, 0, 1,
-0.7413501, 0.2565068, -1.435374, 0.5960785, 1, 0, 1,
-0.7284499, 1.059981, -0.4438053, 0.5882353, 1, 0, 1,
-0.7264926, -0.8540932, -0.9268778, 0.5843138, 1, 0, 1,
-0.7254552, -0.5369331, -2.656048, 0.5764706, 1, 0, 1,
-0.725068, -0.7997919, -2.064129, 0.572549, 1, 0, 1,
-0.722195, 0.09857167, -1.748715, 0.5647059, 1, 0, 1,
-0.7216623, 0.1774893, -2.535161, 0.5607843, 1, 0, 1,
-0.7204666, 0.5439392, -0.5086668, 0.5529412, 1, 0, 1,
-0.7194849, 0.1748246, -1.747558, 0.5490196, 1, 0, 1,
-0.7097256, 0.3121358, -0.1541478, 0.5411765, 1, 0, 1,
-0.6956816, 0.08035792, -2.537405, 0.5372549, 1, 0, 1,
-0.6956624, 1.213754, -1.256196, 0.5294118, 1, 0, 1,
-0.6946436, 0.1338021, -1.787197, 0.5254902, 1, 0, 1,
-0.69311, -1.014245, -4.253453, 0.5176471, 1, 0, 1,
-0.6911788, 0.7377785, 0.4627905, 0.5137255, 1, 0, 1,
-0.6901722, 0.2765203, -0.8420584, 0.5058824, 1, 0, 1,
-0.6900235, -0.1027075, -1.153236, 0.5019608, 1, 0, 1,
-0.6852559, 1.418761, -0.8983085, 0.4941176, 1, 0, 1,
-0.683831, -0.522742, -3.302808, 0.4862745, 1, 0, 1,
-0.6781771, -0.8079493, -2.317202, 0.4823529, 1, 0, 1,
-0.6751442, 0.4487593, -2.150401, 0.4745098, 1, 0, 1,
-0.6704125, -0.8156122, -2.29458, 0.4705882, 1, 0, 1,
-0.6614778, 0.6462395, 0.6875701, 0.4627451, 1, 0, 1,
-0.6558242, -2.030407, -2.411422, 0.4588235, 1, 0, 1,
-0.6554661, 0.00923123, -0.9097874, 0.4509804, 1, 0, 1,
-0.6514827, 1.461737, -1.141767, 0.4470588, 1, 0, 1,
-0.6491662, -0.17012, -1.749087, 0.4392157, 1, 0, 1,
-0.6482438, 1.293515, 0.5342774, 0.4352941, 1, 0, 1,
-0.6474845, -2.136587, -2.312839, 0.427451, 1, 0, 1,
-0.6423965, -0.4291418, -4.106249, 0.4235294, 1, 0, 1,
-0.6366516, 0.3232872, -0.01160666, 0.4156863, 1, 0, 1,
-0.6349136, -0.6533114, -3.295303, 0.4117647, 1, 0, 1,
-0.6273026, -0.06593087, -2.008837, 0.4039216, 1, 0, 1,
-0.6270103, 0.05778822, -1.018372, 0.3960784, 1, 0, 1,
-0.6231758, -0.3366254, -0.8946849, 0.3921569, 1, 0, 1,
-0.6212174, 0.4545618, 0.1767506, 0.3843137, 1, 0, 1,
-0.6201689, 0.5099996, 1.642428, 0.3803922, 1, 0, 1,
-0.6187131, 0.1706864, -1.750843, 0.372549, 1, 0, 1,
-0.6186498, 1.832005, 0.2391584, 0.3686275, 1, 0, 1,
-0.6160914, -0.1598362, -1.196814, 0.3607843, 1, 0, 1,
-0.6035156, -0.1150328, -0.1723777, 0.3568628, 1, 0, 1,
-0.6017521, 0.7100387, -2.608218, 0.3490196, 1, 0, 1,
-0.6016532, 1.192973, 0.3105119, 0.345098, 1, 0, 1,
-0.6001346, 0.7753862, -1.104544, 0.3372549, 1, 0, 1,
-0.5975277, -1.065611, -2.315643, 0.3333333, 1, 0, 1,
-0.5960755, 0.6150508, -0.8924497, 0.3254902, 1, 0, 1,
-0.5899259, -0.1201261, -1.268272, 0.3215686, 1, 0, 1,
-0.5884674, -0.9509321, -0.9385116, 0.3137255, 1, 0, 1,
-0.5883281, 0.5609506, -0.03045569, 0.3098039, 1, 0, 1,
-0.5880696, -1.063231, -1.281255, 0.3019608, 1, 0, 1,
-0.5868257, -1.884504, -4.005191, 0.2941177, 1, 0, 1,
-0.5809942, -0.2052322, -2.74947, 0.2901961, 1, 0, 1,
-0.5769531, 0.1696818, -1.680677, 0.282353, 1, 0, 1,
-0.5762783, 0.2666029, -1.429351, 0.2784314, 1, 0, 1,
-0.5702831, 0.4057959, -0.7138261, 0.2705882, 1, 0, 1,
-0.5700718, -0.2345158, 0.3196101, 0.2666667, 1, 0, 1,
-0.5636114, -1.2457, -3.682848, 0.2588235, 1, 0, 1,
-0.5626653, -0.01564234, -0.4201177, 0.254902, 1, 0, 1,
-0.5559602, -0.5312458, -2.606326, 0.2470588, 1, 0, 1,
-0.5532801, 1.966369, 0.01406579, 0.2431373, 1, 0, 1,
-0.5512297, -0.1223513, -1.773678, 0.2352941, 1, 0, 1,
-0.5488067, 0.5914823, -1.354317, 0.2313726, 1, 0, 1,
-0.5430011, -1.712905, -1.673213, 0.2235294, 1, 0, 1,
-0.5396025, 0.5811752, -0.7448688, 0.2196078, 1, 0, 1,
-0.5346427, 0.6177702, -0.6476365, 0.2117647, 1, 0, 1,
-0.533982, 0.451332, 0.6097997, 0.2078431, 1, 0, 1,
-0.5331623, 0.8600926, 1.562742, 0.2, 1, 0, 1,
-0.5326054, -0.5714256, -2.352558, 0.1921569, 1, 0, 1,
-0.5266016, -0.1054263, -2.297373, 0.1882353, 1, 0, 1,
-0.5251163, 0.7407002, -0.8652854, 0.1803922, 1, 0, 1,
-0.5248041, -0.204721, -2.370569, 0.1764706, 1, 0, 1,
-0.5174776, -0.4117624, -1.506401, 0.1686275, 1, 0, 1,
-0.5156229, 0.810222, -2.211377, 0.1647059, 1, 0, 1,
-0.5149682, -0.2443506, -2.149608, 0.1568628, 1, 0, 1,
-0.5142572, 1.192408, -0.3933446, 0.1529412, 1, 0, 1,
-0.5141029, 1.170459, -0.6139162, 0.145098, 1, 0, 1,
-0.5118031, 0.2688426, -1.916128, 0.1411765, 1, 0, 1,
-0.5090031, 0.07066652, -2.101795, 0.1333333, 1, 0, 1,
-0.5076429, 0.2295032, 0.9363939, 0.1294118, 1, 0, 1,
-0.5070095, 0.8252812, -0.628889, 0.1215686, 1, 0, 1,
-0.5061186, 0.8938255, -1.215253, 0.1176471, 1, 0, 1,
-0.5056155, 0.3440764, -0.4036566, 0.1098039, 1, 0, 1,
-0.5032834, 0.5920708, 0.6981847, 0.1058824, 1, 0, 1,
-0.5015414, -2.197741, -4.679127, 0.09803922, 1, 0, 1,
-0.5005953, 0.4277883, -0.5807181, 0.09019608, 1, 0, 1,
-0.5000837, -0.1618131, -3.074389, 0.08627451, 1, 0, 1,
-0.4989878, -0.2858742, -2.384001, 0.07843138, 1, 0, 1,
-0.4939452, -1.617187, -1.005065, 0.07450981, 1, 0, 1,
-0.4910325, -0.4178272, -2.162699, 0.06666667, 1, 0, 1,
-0.4889712, -0.974297, -4.015626, 0.0627451, 1, 0, 1,
-0.48505, 0.2612841, -0.7212909, 0.05490196, 1, 0, 1,
-0.4836027, 0.5462568, -1.649757, 0.05098039, 1, 0, 1,
-0.4782567, 0.0282104, -1.940941, 0.04313726, 1, 0, 1,
-0.4782387, 0.9809698, -0.5232443, 0.03921569, 1, 0, 1,
-0.4761178, -0.1914203, -0.7499335, 0.03137255, 1, 0, 1,
-0.4719405, -0.1015461, -3.101906, 0.02745098, 1, 0, 1,
-0.4718286, 0.3267104, -0.9489736, 0.01960784, 1, 0, 1,
-0.4707029, -0.05014154, -4.250423, 0.01568628, 1, 0, 1,
-0.4688852, -0.7518556, -2.722711, 0.007843138, 1, 0, 1,
-0.4648035, -0.7375108, -1.91813, 0.003921569, 1, 0, 1,
-0.4614065, -0.4405417, -3.370064, 0, 1, 0.003921569, 1,
-0.4611392, -0.02361399, 0.3891236, 0, 1, 0.01176471, 1,
-0.4562764, 2.000056, -0.9166577, 0, 1, 0.01568628, 1,
-0.456262, 0.3481905, -0.5164716, 0, 1, 0.02352941, 1,
-0.4503955, -0.5215861, -1.901857, 0, 1, 0.02745098, 1,
-0.4411476, -0.509747, -3.2763, 0, 1, 0.03529412, 1,
-0.4408464, -0.744183, -3.106412, 0, 1, 0.03921569, 1,
-0.4406089, 0.2405449, -2.250464, 0, 1, 0.04705882, 1,
-0.4394979, -0.7773538, -2.122752, 0, 1, 0.05098039, 1,
-0.43448, -1.00118, -2.632302, 0, 1, 0.05882353, 1,
-0.4299667, 0.02490907, -1.263979, 0, 1, 0.0627451, 1,
-0.4281662, 0.8752196, 1.992778, 0, 1, 0.07058824, 1,
-0.4274327, 0.8888865, -0.1956157, 0, 1, 0.07450981, 1,
-0.4253459, 0.4633774, -0.9461483, 0, 1, 0.08235294, 1,
-0.4238918, -0.1164358, 0.06455193, 0, 1, 0.08627451, 1,
-0.4236797, -0.6203097, -2.367748, 0, 1, 0.09411765, 1,
-0.4211242, 0.1504013, -2.300829, 0, 1, 0.1019608, 1,
-0.4209319, -1.495686, -2.256634, 0, 1, 0.1058824, 1,
-0.4194261, -1.436924, -1.288531, 0, 1, 0.1137255, 1,
-0.4192089, -1.024432, -2.325025, 0, 1, 0.1176471, 1,
-0.4188609, 0.565078, -1.500705, 0, 1, 0.1254902, 1,
-0.4163289, -1.964734, -3.296973, 0, 1, 0.1294118, 1,
-0.4152689, 1.076329, -1.014701, 0, 1, 0.1372549, 1,
-0.4101839, 1.372984, -1.599325, 0, 1, 0.1411765, 1,
-0.4096701, 0.1439156, -1.646707, 0, 1, 0.1490196, 1,
-0.4052423, -0.2289748, -2.063118, 0, 1, 0.1529412, 1,
-0.4051788, -0.9585945, -3.504058, 0, 1, 0.1607843, 1,
-0.4006129, -1.808408, -2.463685, 0, 1, 0.1647059, 1,
-0.397485, 0.111916, 0.04771096, 0, 1, 0.172549, 1,
-0.3950527, -0.03586154, -1.670397, 0, 1, 0.1764706, 1,
-0.3911284, 0.7559377, -0.3672521, 0, 1, 0.1843137, 1,
-0.3887855, 0.08648562, -2.856095, 0, 1, 0.1882353, 1,
-0.3860085, -0.2278796, -5.151033, 0, 1, 0.1960784, 1,
-0.3811329, -0.8573522, -4.305706, 0, 1, 0.2039216, 1,
-0.3760605, 0.1593726, -1.720246, 0, 1, 0.2078431, 1,
-0.3732109, -2.253777, -2.026372, 0, 1, 0.2156863, 1,
-0.3697141, 0.04635684, -2.403683, 0, 1, 0.2196078, 1,
-0.3679852, 0.5205877, -1.588568, 0, 1, 0.227451, 1,
-0.3664795, 0.03802943, 1.307479, 0, 1, 0.2313726, 1,
-0.3664649, -0.3298958, -1.301012, 0, 1, 0.2392157, 1,
-0.3644339, -0.2140083, -0.4503665, 0, 1, 0.2431373, 1,
-0.3644114, 0.7656241, -0.8477371, 0, 1, 0.2509804, 1,
-0.3635754, -0.6009065, -2.4315, 0, 1, 0.254902, 1,
-0.3635023, -0.582148, -2.471979, 0, 1, 0.2627451, 1,
-0.3621213, 0.4440716, -1.087533, 0, 1, 0.2666667, 1,
-0.3586532, -0.4170577, -3.277, 0, 1, 0.2745098, 1,
-0.3572003, 0.4659001, -0.2925894, 0, 1, 0.2784314, 1,
-0.3530696, 1.706103, 1.130676, 0, 1, 0.2862745, 1,
-0.3523818, -0.4990285, -3.090712, 0, 1, 0.2901961, 1,
-0.3446555, 0.1214707, -0.557807, 0, 1, 0.2980392, 1,
-0.3443727, 0.1692596, 0.736591, 0, 1, 0.3058824, 1,
-0.3442067, -0.6374209, -3.392592, 0, 1, 0.3098039, 1,
-0.3423382, -0.1184361, -1.950479, 0, 1, 0.3176471, 1,
-0.3418275, -0.9488146, -2.272244, 0, 1, 0.3215686, 1,
-0.3414423, 0.6212353, -1.265486, 0, 1, 0.3294118, 1,
-0.3412504, -0.2199515, -1.33939, 0, 1, 0.3333333, 1,
-0.3412071, -0.2817235, -2.024879, 0, 1, 0.3411765, 1,
-0.3411985, -0.6253971, -2.790823, 0, 1, 0.345098, 1,
-0.3390549, 1.628629, -0.1393519, 0, 1, 0.3529412, 1,
-0.3379384, -0.5615376, -2.765147, 0, 1, 0.3568628, 1,
-0.3232628, 1.710944, 0.7626468, 0, 1, 0.3647059, 1,
-0.3195508, -0.9112881, -2.624317, 0, 1, 0.3686275, 1,
-0.3190607, -0.2561867, -2.265328, 0, 1, 0.3764706, 1,
-0.3069577, 0.1431152, 0.5301756, 0, 1, 0.3803922, 1,
-0.3060912, -1.238192, -4.074326, 0, 1, 0.3882353, 1,
-0.3038759, -0.8632857, -2.789735, 0, 1, 0.3921569, 1,
-0.3036532, -1.641691, -3.449808, 0, 1, 0.4, 1,
-0.3027, -0.4313548, -1.997601, 0, 1, 0.4078431, 1,
-0.2982, 0.4042264, -0.7312309, 0, 1, 0.4117647, 1,
-0.2979059, -0.226878, -3.360481, 0, 1, 0.4196078, 1,
-0.2971896, -0.5812585, -2.050585, 0, 1, 0.4235294, 1,
-0.2943709, -0.2097272, -1.415665, 0, 1, 0.4313726, 1,
-0.2927455, -0.2859672, -2.517496, 0, 1, 0.4352941, 1,
-0.2912194, 2.803694, -0.08924003, 0, 1, 0.4431373, 1,
-0.2888273, 0.2090338, -1.780661, 0, 1, 0.4470588, 1,
-0.2770067, -0.07699637, -2.870436, 0, 1, 0.454902, 1,
-0.2766079, -1.436541, -2.452337, 0, 1, 0.4588235, 1,
-0.2717474, 0.3734695, 0.07039615, 0, 1, 0.4666667, 1,
-0.2708867, 0.04391049, -2.018967, 0, 1, 0.4705882, 1,
-0.269161, -1.880195, -3.601925, 0, 1, 0.4784314, 1,
-0.265819, 0.04256623, -3.562819, 0, 1, 0.4823529, 1,
-0.2655363, -2.584259, -2.32251, 0, 1, 0.4901961, 1,
-0.2610795, 0.515249, -0.8590081, 0, 1, 0.4941176, 1,
-0.2605768, -0.3684896, -4.336897, 0, 1, 0.5019608, 1,
-0.2521182, -0.9741023, -1.908443, 0, 1, 0.509804, 1,
-0.2519357, -0.4493993, -1.793889, 0, 1, 0.5137255, 1,
-0.2505515, 2.098916, -0.1660274, 0, 1, 0.5215687, 1,
-0.249481, -0.1472519, -1.725532, 0, 1, 0.5254902, 1,
-0.2485066, 0.07810206, -0.787451, 0, 1, 0.5333334, 1,
-0.2480037, 0.5802028, 0.1070742, 0, 1, 0.5372549, 1,
-0.2464703, 0.9328238, 0.1056237, 0, 1, 0.5450981, 1,
-0.2454154, -0.1111263, -2.296397, 0, 1, 0.5490196, 1,
-0.2436199, 0.6363667, 0.527279, 0, 1, 0.5568628, 1,
-0.2434268, 0.5503473, -1.200534, 0, 1, 0.5607843, 1,
-0.2347659, 0.1201327, -1.542831, 0, 1, 0.5686275, 1,
-0.2339077, -0.3428794, -1.794475, 0, 1, 0.572549, 1,
-0.2313313, -0.203372, -1.956649, 0, 1, 0.5803922, 1,
-0.2230109, -1.622658, -1.964986, 0, 1, 0.5843138, 1,
-0.2220899, 0.1336149, 0.5024006, 0, 1, 0.5921569, 1,
-0.2183518, 0.1037575, -1.764454, 0, 1, 0.5960785, 1,
-0.2133467, 0.0339551, -2.03825, 0, 1, 0.6039216, 1,
-0.2130615, -1.404251, -2.913566, 0, 1, 0.6117647, 1,
-0.2078664, -1.121317, -2.393423, 0, 1, 0.6156863, 1,
-0.2075669, 0.9840118, 0.09672469, 0, 1, 0.6235294, 1,
-0.2062574, 1.596652, -0.203369, 0, 1, 0.627451, 1,
-0.2024492, -0.398011, -3.205905, 0, 1, 0.6352941, 1,
-0.2019639, 0.4902382, -1.06496, 0, 1, 0.6392157, 1,
-0.2014923, 0.6812197, -1.307428, 0, 1, 0.6470588, 1,
-0.2004783, -0.4185283, -3.232021, 0, 1, 0.6509804, 1,
-0.1998786, 1.543523, -0.1885718, 0, 1, 0.6588235, 1,
-0.1924411, 1.413709, 0.4607196, 0, 1, 0.6627451, 1,
-0.1909371, 0.4421733, 1.545925, 0, 1, 0.6705883, 1,
-0.1906929, 0.1197481, -0.5445952, 0, 1, 0.6745098, 1,
-0.1873808, -0.8852395, -0.9722626, 0, 1, 0.682353, 1,
-0.1873103, 0.7897173, -0.3287461, 0, 1, 0.6862745, 1,
-0.1837296, -1.426781, -3.205306, 0, 1, 0.6941177, 1,
-0.1803019, -0.4134634, -1.944211, 0, 1, 0.7019608, 1,
-0.1759496, -1.271084, -2.260227, 0, 1, 0.7058824, 1,
-0.1714863, -1.465687, -3.323888, 0, 1, 0.7137255, 1,
-0.1600198, -0.4149446, -4.617997, 0, 1, 0.7176471, 1,
-0.1578607, 1.289273, 0.793427, 0, 1, 0.7254902, 1,
-0.1575246, 0.8052201, 1.365868, 0, 1, 0.7294118, 1,
-0.1558015, -0.1577093, -0.9368509, 0, 1, 0.7372549, 1,
-0.1502253, -1.063827, -3.301857, 0, 1, 0.7411765, 1,
-0.1500879, 0.5508963, -1.144965, 0, 1, 0.7490196, 1,
-0.1493309, -0.7939343, -2.977276, 0, 1, 0.7529412, 1,
-0.1449562, 0.4151476, -0.193158, 0, 1, 0.7607843, 1,
-0.1448583, 0.1922032, 0.2232318, 0, 1, 0.7647059, 1,
-0.1378546, -0.1688433, -3.566587, 0, 1, 0.772549, 1,
-0.1371073, -1.155874, -3.372672, 0, 1, 0.7764706, 1,
-0.1350472, 0.01764609, -3.13811, 0, 1, 0.7843137, 1,
-0.1337408, 0.1438514, -0.3203851, 0, 1, 0.7882353, 1,
-0.1299776, -1.676867, -2.496077, 0, 1, 0.7960784, 1,
-0.1276898, 0.8422793, -1.039418, 0, 1, 0.8039216, 1,
-0.1244559, -0.3643142, -3.509916, 0, 1, 0.8078431, 1,
-0.1237165, 0.1698406, -0.02805782, 0, 1, 0.8156863, 1,
-0.1183385, -1.57275, -2.670056, 0, 1, 0.8196079, 1,
-0.116797, -0.426836, -3.587729, 0, 1, 0.827451, 1,
-0.1161225, 0.3738483, -0.6014263, 0, 1, 0.8313726, 1,
-0.1093855, -0.2963032, -3.039084, 0, 1, 0.8392157, 1,
-0.103591, 1.035824, 0.4777659, 0, 1, 0.8431373, 1,
-0.1035427, -0.3629027, -4.132919, 0, 1, 0.8509804, 1,
-0.102008, 0.1930053, -1.212726, 0, 1, 0.854902, 1,
-0.09947646, 1.271023, 0.7231754, 0, 1, 0.8627451, 1,
-0.09811494, -1.25064, -3.378381, 0, 1, 0.8666667, 1,
-0.09524718, -0.1375619, -1.904877, 0, 1, 0.8745098, 1,
-0.09427544, -0.5128538, -2.309616, 0, 1, 0.8784314, 1,
-0.09328362, -1.396925, -2.765633, 0, 1, 0.8862745, 1,
-0.09319185, 1.83037, 0.2039566, 0, 1, 0.8901961, 1,
-0.08937436, -1.093361, -2.435066, 0, 1, 0.8980392, 1,
-0.08665025, 0.08803561, -0.07282043, 0, 1, 0.9058824, 1,
-0.08374406, -0.813316, -2.919438, 0, 1, 0.9098039, 1,
-0.08252467, 0.1460763, 0.05973805, 0, 1, 0.9176471, 1,
-0.07932559, 0.1538093, 0.4384806, 0, 1, 0.9215686, 1,
-0.07905114, 0.1834629, -0.2595525, 0, 1, 0.9294118, 1,
-0.07884441, 1.544785, 0.2965412, 0, 1, 0.9333333, 1,
-0.07733434, -0.5861619, -2.360998, 0, 1, 0.9411765, 1,
-0.0770206, -1.741824, -0.9519337, 0, 1, 0.945098, 1,
-0.07283354, -0.5966618, -3.565508, 0, 1, 0.9529412, 1,
-0.07122844, 2.073299, -0.5891415, 0, 1, 0.9568627, 1,
-0.06768674, 0.5371096, -0.36928, 0, 1, 0.9647059, 1,
-0.06595622, -1.403346, -3.361843, 0, 1, 0.9686275, 1,
-0.06454939, -0.06109216, -1.044958, 0, 1, 0.9764706, 1,
-0.06114705, -1.360039, -2.322675, 0, 1, 0.9803922, 1,
-0.06017723, 0.6530892, -0.7362791, 0, 1, 0.9882353, 1,
-0.05583821, 0.9997234, 0.6885773, 0, 1, 0.9921569, 1,
-0.04974636, -0.6504999, -0.1689093, 0, 1, 1, 1,
-0.04732921, 0.753451, -1.764391, 0, 0.9921569, 1, 1,
-0.04720961, 1.647511, -1.171386, 0, 0.9882353, 1, 1,
-0.02764925, -1.053502, -2.744085, 0, 0.9803922, 1, 1,
-0.0261481, -0.4505042, -2.246855, 0, 0.9764706, 1, 1,
-0.02485576, 1.380754, 0.1737192, 0, 0.9686275, 1, 1,
-0.01645688, 1.762021, 1.885664, 0, 0.9647059, 1, 1,
-0.0143821, 1.273089, -0.4413947, 0, 0.9568627, 1, 1,
-0.009807094, 0.8722134, -0.3494299, 0, 0.9529412, 1, 1,
-0.008566827, -0.3138435, -2.876961, 0, 0.945098, 1, 1,
-0.004736418, 1.072604, 0.05408369, 0, 0.9411765, 1, 1,
-0.004661271, 0.1485358, -0.5194522, 0, 0.9333333, 1, 1,
-0.003306336, 0.7559974, 0.2299685, 0, 0.9294118, 1, 1,
0.001252573, -1.439503, 3.376113, 0, 0.9215686, 1, 1,
0.004790492, 0.9364886, -1.196177, 0, 0.9176471, 1, 1,
0.006891771, -2.985584, 4.517094, 0, 0.9098039, 1, 1,
0.008713032, -0.1640546, 4.114498, 0, 0.9058824, 1, 1,
0.01843444, -2.173024, 2.641779, 0, 0.8980392, 1, 1,
0.01850926, 0.9975299, -1.070004, 0, 0.8901961, 1, 1,
0.02406501, -0.259131, 3.610337, 0, 0.8862745, 1, 1,
0.03351731, -0.9126795, 2.319618, 0, 0.8784314, 1, 1,
0.03386006, 1.930216, -0.7506279, 0, 0.8745098, 1, 1,
0.03622946, 0.5178366, -1.176318, 0, 0.8666667, 1, 1,
0.03838298, 0.9049541, -0.05023894, 0, 0.8627451, 1, 1,
0.03875862, -0.6916996, 3.036542, 0, 0.854902, 1, 1,
0.04133349, -0.8295815, 2.707231, 0, 0.8509804, 1, 1,
0.0425532, -0.7219524, 4.516147, 0, 0.8431373, 1, 1,
0.04337571, 0.4971949, -0.1356546, 0, 0.8392157, 1, 1,
0.04345582, 0.8058627, 0.3493511, 0, 0.8313726, 1, 1,
0.04360345, 1.762828, -0.7941043, 0, 0.827451, 1, 1,
0.04424065, -1.064588, 3.867024, 0, 0.8196079, 1, 1,
0.04523871, -0.04430155, 1.853179, 0, 0.8156863, 1, 1,
0.05242955, 1.658056, -0.6163318, 0, 0.8078431, 1, 1,
0.05549651, -0.1872233, 3.863331, 0, 0.8039216, 1, 1,
0.05592936, -0.3183064, 3.546698, 0, 0.7960784, 1, 1,
0.06896848, 0.05226452, -0.8967403, 0, 0.7882353, 1, 1,
0.06944445, -0.198723, 4.550913, 0, 0.7843137, 1, 1,
0.06958524, 0.03713144, 1.897202, 0, 0.7764706, 1, 1,
0.07242643, -1.142592, 3.653221, 0, 0.772549, 1, 1,
0.07285149, -0.1883669, 2.221025, 0, 0.7647059, 1, 1,
0.0745518, -1.128703, 4.042024, 0, 0.7607843, 1, 1,
0.07467242, -0.9904872, 3.211152, 0, 0.7529412, 1, 1,
0.07640038, 0.3516114, -2.353466, 0, 0.7490196, 1, 1,
0.07738277, 1.396745, -1.658975, 0, 0.7411765, 1, 1,
0.07904366, 0.4706332, 0.1378769, 0, 0.7372549, 1, 1,
0.08022593, -0.3548703, 3.232342, 0, 0.7294118, 1, 1,
0.08173289, 0.2518622, 0.007028696, 0, 0.7254902, 1, 1,
0.08198689, -1.21074, 4.361076, 0, 0.7176471, 1, 1,
0.08359219, -0.211251, 2.983171, 0, 0.7137255, 1, 1,
0.08502609, 0.1779073, -0.09272004, 0, 0.7058824, 1, 1,
0.08600575, 0.8744429, -0.6377203, 0, 0.6980392, 1, 1,
0.0860596, 1.213148, 0.337898, 0, 0.6941177, 1, 1,
0.09090038, -0.2689874, 3.866176, 0, 0.6862745, 1, 1,
0.1024676, -0.05050423, 2.382311, 0, 0.682353, 1, 1,
0.1081354, 1.736952, 0.5788338, 0, 0.6745098, 1, 1,
0.1125585, 1.143206, 0.3349681, 0, 0.6705883, 1, 1,
0.1131978, 0.08712703, 0.8959, 0, 0.6627451, 1, 1,
0.1158919, -1.048027, 3.035802, 0, 0.6588235, 1, 1,
0.119571, 0.3169319, 0.4188014, 0, 0.6509804, 1, 1,
0.1217466, -0.2141878, 3.443657, 0, 0.6470588, 1, 1,
0.1228277, -1.07169, 2.020649, 0, 0.6392157, 1, 1,
0.1236687, -0.6010789, 2.574682, 0, 0.6352941, 1, 1,
0.1244206, 0.8728444, 0.09843818, 0, 0.627451, 1, 1,
0.1252336, 0.4162258, 0.2846349, 0, 0.6235294, 1, 1,
0.126146, 1.436625, -0.02580419, 0, 0.6156863, 1, 1,
0.1295739, 0.3848521, -1.950098, 0, 0.6117647, 1, 1,
0.1356125, -1.564487, 2.157926, 0, 0.6039216, 1, 1,
0.138514, -0.6212047, 2.721074, 0, 0.5960785, 1, 1,
0.1385573, -1.593609, 1.972084, 0, 0.5921569, 1, 1,
0.144978, -1.214026, 1.449834, 0, 0.5843138, 1, 1,
0.147567, 1.770223, 0.1451109, 0, 0.5803922, 1, 1,
0.1485844, -2.166365, 0.9500079, 0, 0.572549, 1, 1,
0.1514835, -0.2565664, 2.571672, 0, 0.5686275, 1, 1,
0.1519107, 1.029228, 1.034653, 0, 0.5607843, 1, 1,
0.1626178, 1.040244, 0.958764, 0, 0.5568628, 1, 1,
0.1641072, 0.5298282, 1.398561, 0, 0.5490196, 1, 1,
0.1655445, -0.5176981, 1.453475, 0, 0.5450981, 1, 1,
0.1657594, -1.42941, 2.796367, 0, 0.5372549, 1, 1,
0.1679461, 0.7723999, -0.3144381, 0, 0.5333334, 1, 1,
0.1702622, 0.1448691, 1.439042, 0, 0.5254902, 1, 1,
0.1754571, 0.302501, 0.5220484, 0, 0.5215687, 1, 1,
0.1762824, -0.2398893, 1.616623, 0, 0.5137255, 1, 1,
0.1774171, -2.162823, 2.311156, 0, 0.509804, 1, 1,
0.1780173, -0.256417, 3.050646, 0, 0.5019608, 1, 1,
0.1785298, -0.3576886, 3.2235, 0, 0.4941176, 1, 1,
0.1851157, 0.4214478, -0.07008696, 0, 0.4901961, 1, 1,
0.1872737, -2.279212, 1.671641, 0, 0.4823529, 1, 1,
0.1898862, 0.9823645, 3.350032, 0, 0.4784314, 1, 1,
0.1920099, 0.6105062, -0.453742, 0, 0.4705882, 1, 1,
0.1933293, 1.29378, -1.061507, 0, 0.4666667, 1, 1,
0.19349, -0.9421976, 2.590333, 0, 0.4588235, 1, 1,
0.2006407, 0.7164792, 0.4926958, 0, 0.454902, 1, 1,
0.2009706, -1.28152, 3.083858, 0, 0.4470588, 1, 1,
0.203001, -1.591187, 0.7568808, 0, 0.4431373, 1, 1,
0.2057105, -0.8377731, 3.023306, 0, 0.4352941, 1, 1,
0.2171775, 1.058613, 0.206851, 0, 0.4313726, 1, 1,
0.2233921, 0.6327716, -0.06556159, 0, 0.4235294, 1, 1,
0.2344057, 0.3598466, 0.6761757, 0, 0.4196078, 1, 1,
0.2375451, -0.2799617, 2.507534, 0, 0.4117647, 1, 1,
0.2378838, -0.08004147, 1.057029, 0, 0.4078431, 1, 1,
0.2414256, 0.1004583, 0.05219129, 0, 0.4, 1, 1,
0.2444126, -0.1245616, 2.315346, 0, 0.3921569, 1, 1,
0.2453664, -1.391965, 3.537565, 0, 0.3882353, 1, 1,
0.2490118, 0.00215862, 0.01738034, 0, 0.3803922, 1, 1,
0.251315, 1.235201, 0.8513398, 0, 0.3764706, 1, 1,
0.2538246, -0.2576525, 2.937928, 0, 0.3686275, 1, 1,
0.2564082, 0.9124803, 0.7726074, 0, 0.3647059, 1, 1,
0.2580059, -1.18282, 3.967319, 0, 0.3568628, 1, 1,
0.2606658, 1.685226, 0.3758883, 0, 0.3529412, 1, 1,
0.2638319, 0.2971252, -0.3003283, 0, 0.345098, 1, 1,
0.2655161, 0.8088352, 1.164344, 0, 0.3411765, 1, 1,
0.2673095, 1.630931, 1.094654, 0, 0.3333333, 1, 1,
0.2749931, -0.644744, 2.217552, 0, 0.3294118, 1, 1,
0.2755451, -0.147605, 2.568341, 0, 0.3215686, 1, 1,
0.2756362, -0.4100517, 3.239338, 0, 0.3176471, 1, 1,
0.2773328, 1.000675, 0.0301638, 0, 0.3098039, 1, 1,
0.2798057, -0.3175681, 2.601078, 0, 0.3058824, 1, 1,
0.2814412, -1.19448, 3.234414, 0, 0.2980392, 1, 1,
0.2818995, -0.09991025, 2.770695, 0, 0.2901961, 1, 1,
0.282746, -0.3252803, 2.787893, 0, 0.2862745, 1, 1,
0.2958806, 0.3748862, 0.1116915, 0, 0.2784314, 1, 1,
0.2983238, 0.524743, 0.7435598, 0, 0.2745098, 1, 1,
0.303546, 1.18672, 1.902379, 0, 0.2666667, 1, 1,
0.3073743, 2.118843, 0.2821655, 0, 0.2627451, 1, 1,
0.3107348, -0.2400642, 0.5036041, 0, 0.254902, 1, 1,
0.3109482, 0.6002337, 1.029098, 0, 0.2509804, 1, 1,
0.3149641, -0.4819804, 4.700276, 0, 0.2431373, 1, 1,
0.3152039, -0.2517244, 1.449016, 0, 0.2392157, 1, 1,
0.3175294, 1.50535, -1.472418, 0, 0.2313726, 1, 1,
0.318266, -1.066377, 3.07025, 0, 0.227451, 1, 1,
0.3188795, 0.6394501, -0.166009, 0, 0.2196078, 1, 1,
0.3198732, 0.1222189, 0.4930698, 0, 0.2156863, 1, 1,
0.3213047, -1.121566, 4.803964, 0, 0.2078431, 1, 1,
0.3236246, 0.6426463, 0.575094, 0, 0.2039216, 1, 1,
0.3264782, -0.3515776, 3.741496, 0, 0.1960784, 1, 1,
0.3325899, -1.00376, 1.659519, 0, 0.1882353, 1, 1,
0.3348006, -0.6767899, 2.807749, 0, 0.1843137, 1, 1,
0.3380973, 1.656186, -1.141659, 0, 0.1764706, 1, 1,
0.3394085, 0.4602183, -0.6105905, 0, 0.172549, 1, 1,
0.3424533, 0.3433834, 3.76201, 0, 0.1647059, 1, 1,
0.3425032, 0.3749073, 0.5469372, 0, 0.1607843, 1, 1,
0.3460483, 0.09180294, 1.329728, 0, 0.1529412, 1, 1,
0.3467551, 1.677372, 1.106182, 0, 0.1490196, 1, 1,
0.3481446, -1.216985, 2.389357, 0, 0.1411765, 1, 1,
0.3536014, -0.0322942, 1.80404, 0, 0.1372549, 1, 1,
0.3595757, -0.1064811, 3.305998, 0, 0.1294118, 1, 1,
0.3634374, -0.009844315, 0.9335694, 0, 0.1254902, 1, 1,
0.3640096, 0.2063138, 2.430475, 0, 0.1176471, 1, 1,
0.364055, -0.3175177, 2.977719, 0, 0.1137255, 1, 1,
0.3660025, 0.3038532, -0.338576, 0, 0.1058824, 1, 1,
0.3671633, -0.3479927, 1.85678, 0, 0.09803922, 1, 1,
0.3695012, -0.3994943, 3.267607, 0, 0.09411765, 1, 1,
0.371102, -1.282696, 1.0653, 0, 0.08627451, 1, 1,
0.3723791, -1.285069, 2.734575, 0, 0.08235294, 1, 1,
0.3766043, -0.1959396, 3.024433, 0, 0.07450981, 1, 1,
0.3797842, -1.144841, 1.821031, 0, 0.07058824, 1, 1,
0.3806915, -0.9689375, 2.655128, 0, 0.0627451, 1, 1,
0.3816286, -0.04759979, 2.345927, 0, 0.05882353, 1, 1,
0.3837393, 2.345316, 0.1862234, 0, 0.05098039, 1, 1,
0.3838183, 0.8648886, 0.4833108, 0, 0.04705882, 1, 1,
0.3864751, -0.2739753, 1.357906, 0, 0.03921569, 1, 1,
0.3864806, 0.6292887, 1.18444, 0, 0.03529412, 1, 1,
0.3871815, 0.07213937, 0.3850761, 0, 0.02745098, 1, 1,
0.3895038, -0.06884537, 0.8849717, 0, 0.02352941, 1, 1,
0.3898978, -1.317583, 3.179558, 0, 0.01568628, 1, 1,
0.3919166, -1.59695, 2.807807, 0, 0.01176471, 1, 1,
0.3926101, 0.5727715, -0.5310755, 0, 0.003921569, 1, 1,
0.3926677, -0.972068, 2.455013, 0.003921569, 0, 1, 1,
0.3946349, -0.4917379, 3.102245, 0.007843138, 0, 1, 1,
0.3957037, -1.352672, 1.478962, 0.01568628, 0, 1, 1,
0.3965195, 0.2475114, 1.01124, 0.01960784, 0, 1, 1,
0.3987569, 0.9750451, 1.320175, 0.02745098, 0, 1, 1,
0.4042585, -0.9280995, 1.491556, 0.03137255, 0, 1, 1,
0.4050703, 0.0272937, 0.7094409, 0.03921569, 0, 1, 1,
0.4103064, -0.6010259, 1.550037, 0.04313726, 0, 1, 1,
0.4178723, -0.05789534, 0.426488, 0.05098039, 0, 1, 1,
0.418985, -0.2303896, 2.382569, 0.05490196, 0, 1, 1,
0.4215508, 0.5027902, 2.452955, 0.0627451, 0, 1, 1,
0.4215748, -1.145613, 2.785129, 0.06666667, 0, 1, 1,
0.4219713, 0.9896977, 0.4416793, 0.07450981, 0, 1, 1,
0.423957, -0.2406402, 1.058013, 0.07843138, 0, 1, 1,
0.4281659, 0.3844096, -0.1018352, 0.08627451, 0, 1, 1,
0.4299716, 0.5276503, 1.14648, 0.09019608, 0, 1, 1,
0.4317434, -0.9552816, 1.090929, 0.09803922, 0, 1, 1,
0.4323199, -0.05095113, 0.6589123, 0.1058824, 0, 1, 1,
0.4339483, -0.9030021, 5.027386, 0.1098039, 0, 1, 1,
0.4387301, -0.3961645, 1.669992, 0.1176471, 0, 1, 1,
0.4437431, 0.2308792, 1.117833, 0.1215686, 0, 1, 1,
0.4450462, 1.981373, 0.7966686, 0.1294118, 0, 1, 1,
0.4523364, 1.357319, 3.650924, 0.1333333, 0, 1, 1,
0.4530655, 0.7361648, 2.390562, 0.1411765, 0, 1, 1,
0.4567855, -0.0517649, 0.1787166, 0.145098, 0, 1, 1,
0.4575363, 1.346391, 1.023712, 0.1529412, 0, 1, 1,
0.4638587, -2.257993, 3.765454, 0.1568628, 0, 1, 1,
0.4661005, 0.760583, 1.710838, 0.1647059, 0, 1, 1,
0.470551, 2.172899, -1.186729, 0.1686275, 0, 1, 1,
0.4743544, -1.689454, 4.002733, 0.1764706, 0, 1, 1,
0.4752288, 0.1741278, 1.167857, 0.1803922, 0, 1, 1,
0.4764006, -0.3180362, 0.3598036, 0.1882353, 0, 1, 1,
0.4770911, -0.3146481, 1.390329, 0.1921569, 0, 1, 1,
0.4797336, -1.187705, 2.530679, 0.2, 0, 1, 1,
0.4814415, 0.6637619, 2.022171, 0.2078431, 0, 1, 1,
0.4821749, -0.3132122, 2.441065, 0.2117647, 0, 1, 1,
0.4845207, 0.4194925, 1.240069, 0.2196078, 0, 1, 1,
0.4874397, 1.621727, 0.5613837, 0.2235294, 0, 1, 1,
0.4912525, 0.04044586, 2.394437, 0.2313726, 0, 1, 1,
0.5017893, -0.295561, 1.706791, 0.2352941, 0, 1, 1,
0.5042753, -0.45947, 2.251396, 0.2431373, 0, 1, 1,
0.5051275, 0.9029492, 0.8128603, 0.2470588, 0, 1, 1,
0.505129, -1.141346, 3.450989, 0.254902, 0, 1, 1,
0.5102671, -1.231885, 1.275728, 0.2588235, 0, 1, 1,
0.5117004, -0.2290749, 2.282754, 0.2666667, 0, 1, 1,
0.5141092, -0.1067702, 2.60239, 0.2705882, 0, 1, 1,
0.5170178, 0.2295076, 0.5502034, 0.2784314, 0, 1, 1,
0.5243114, -0.6240639, 2.487891, 0.282353, 0, 1, 1,
0.5246373, 0.3343927, 1.693943, 0.2901961, 0, 1, 1,
0.5291777, -0.3993492, 1.513292, 0.2941177, 0, 1, 1,
0.5295901, -0.2750842, 2.105501, 0.3019608, 0, 1, 1,
0.5387895, -0.5007714, 3.28511, 0.3098039, 0, 1, 1,
0.5445276, -0.2920776, 1.867437, 0.3137255, 0, 1, 1,
0.5480021, -1.724581, 1.168563, 0.3215686, 0, 1, 1,
0.5518228, -1.267113, 2.403928, 0.3254902, 0, 1, 1,
0.558003, -1.565474, 2.925431, 0.3333333, 0, 1, 1,
0.5656975, 2.40981, -0.5994418, 0.3372549, 0, 1, 1,
0.5665696, 0.6977661, 0.3326392, 0.345098, 0, 1, 1,
0.5695555, 0.5980572, -0.8487196, 0.3490196, 0, 1, 1,
0.5697857, 1.015359, -0.9335932, 0.3568628, 0, 1, 1,
0.5706367, 1.435368, 1.370509, 0.3607843, 0, 1, 1,
0.5718571, -1.560812, 3.121625, 0.3686275, 0, 1, 1,
0.5725861, -0.9623323, 1.910552, 0.372549, 0, 1, 1,
0.5733265, 0.3679248, 1.323747, 0.3803922, 0, 1, 1,
0.5747523, 0.6361014, 0.9641709, 0.3843137, 0, 1, 1,
0.5758043, -0.8619496, 1.221923, 0.3921569, 0, 1, 1,
0.5774092, 0.8069739, 0.2319627, 0.3960784, 0, 1, 1,
0.5784684, 0.2955857, 0.9087182, 0.4039216, 0, 1, 1,
0.5808987, -0.1956758, 3.303425, 0.4117647, 0, 1, 1,
0.5813681, -0.8329813, 3.272802, 0.4156863, 0, 1, 1,
0.5869089, -1.194748, 0.9919082, 0.4235294, 0, 1, 1,
0.5870819, 0.9994805, 2.346944, 0.427451, 0, 1, 1,
0.5915433, 0.07067227, 0.7781325, 0.4352941, 0, 1, 1,
0.5930075, -1.096347, 1.542634, 0.4392157, 0, 1, 1,
0.5979731, -0.4643509, 3.389018, 0.4470588, 0, 1, 1,
0.5991914, -0.7130017, 3.68779, 0.4509804, 0, 1, 1,
0.6049107, 0.4440253, 3.106, 0.4588235, 0, 1, 1,
0.6092156, -0.1041921, 1.92444, 0.4627451, 0, 1, 1,
0.6234251, 2.036515, 0.1370484, 0.4705882, 0, 1, 1,
0.6330161, 0.2479647, 0.9805943, 0.4745098, 0, 1, 1,
0.6341696, -1.363558, 2.9571, 0.4823529, 0, 1, 1,
0.6367202, -0.8113475, 1.854641, 0.4862745, 0, 1, 1,
0.6380777, -1.109634, 1.84371, 0.4941176, 0, 1, 1,
0.6383187, -0.5454443, 0.2997027, 0.5019608, 0, 1, 1,
0.6416232, 0.3142399, 0.684462, 0.5058824, 0, 1, 1,
0.6435224, -0.3716072, 2.463277, 0.5137255, 0, 1, 1,
0.6464151, -0.5539157, 4.086004, 0.5176471, 0, 1, 1,
0.6475948, 0.009883173, 2.586132, 0.5254902, 0, 1, 1,
0.6482925, 1.586245, -0.8956168, 0.5294118, 0, 1, 1,
0.6516405, 0.883766, 0.612538, 0.5372549, 0, 1, 1,
0.6579193, -0.6962706, 1.865164, 0.5411765, 0, 1, 1,
0.6582955, -2.079598, 3.01846, 0.5490196, 0, 1, 1,
0.6643444, 1.188386, -0.5051838, 0.5529412, 0, 1, 1,
0.6671847, -0.255491, 0.7181301, 0.5607843, 0, 1, 1,
0.6683233, 0.1656031, 1.564195, 0.5647059, 0, 1, 1,
0.6773652, 0.760836, 1.353276, 0.572549, 0, 1, 1,
0.6779096, -0.5451297, 1.48088, 0.5764706, 0, 1, 1,
0.6849374, -0.5248321, 2.675472, 0.5843138, 0, 1, 1,
0.6849609, 0.9977095, -0.08269022, 0.5882353, 0, 1, 1,
0.700838, 2.352853, -1.894574, 0.5960785, 0, 1, 1,
0.7022989, 1.13789, 1.256154, 0.6039216, 0, 1, 1,
0.7027339, -0.8531913, 1.140597, 0.6078432, 0, 1, 1,
0.7044614, -2.213169, 2.858234, 0.6156863, 0, 1, 1,
0.7152395, -0.0676801, 3.656657, 0.6196079, 0, 1, 1,
0.716, 0.7054691, 0.4339121, 0.627451, 0, 1, 1,
0.718068, -1.065, 3.484603, 0.6313726, 0, 1, 1,
0.7222738, -1.439022, 4.293067, 0.6392157, 0, 1, 1,
0.7240923, 1.167563, 1.501929, 0.6431373, 0, 1, 1,
0.7333943, -0.7299035, 3.876555, 0.6509804, 0, 1, 1,
0.7426462, -1.409369, 1.301916, 0.654902, 0, 1, 1,
0.7551864, 0.5198572, -0.0092393, 0.6627451, 0, 1, 1,
0.7564946, 1.623278, 0.6874027, 0.6666667, 0, 1, 1,
0.7579829, 0.9306447, 0.500663, 0.6745098, 0, 1, 1,
0.7592217, 0.6178833, 0.5293878, 0.6784314, 0, 1, 1,
0.7609019, -0.1193084, 2.260441, 0.6862745, 0, 1, 1,
0.7662637, 0.2161566, 1.363765, 0.6901961, 0, 1, 1,
0.7674491, -0.1934304, 1.046242, 0.6980392, 0, 1, 1,
0.7689024, -0.09077112, 1.780909, 0.7058824, 0, 1, 1,
0.7715343, -0.7468776, 1.669453, 0.7098039, 0, 1, 1,
0.7787825, -0.4648542, 2.63217, 0.7176471, 0, 1, 1,
0.7821944, -0.6354061, 1.931141, 0.7215686, 0, 1, 1,
0.7822787, -1.052495, -0.06861318, 0.7294118, 0, 1, 1,
0.7856035, -1.828753, 1.903836, 0.7333333, 0, 1, 1,
0.7888497, 0.5847111, 1.030291, 0.7411765, 0, 1, 1,
0.7907782, 1.262766, 0.6132945, 0.7450981, 0, 1, 1,
0.7922469, -1.482431, 1.351684, 0.7529412, 0, 1, 1,
0.7945872, 0.05664054, 0.9001284, 0.7568628, 0, 1, 1,
0.7959624, -0.3741086, 1.993622, 0.7647059, 0, 1, 1,
0.7973231, 0.8903557, 2.005507, 0.7686275, 0, 1, 1,
0.7987498, -0.3937073, 2.302711, 0.7764706, 0, 1, 1,
0.7990439, 0.8633775, 1.029859, 0.7803922, 0, 1, 1,
0.8018702, 1.78686, -0.5441098, 0.7882353, 0, 1, 1,
0.8023551, 0.1394752, -0.6165782, 0.7921569, 0, 1, 1,
0.8128017, 0.6026255, 0.5235897, 0.8, 0, 1, 1,
0.8165632, 2.083667, 0.4851036, 0.8078431, 0, 1, 1,
0.8187112, 0.2897468, 2.710266, 0.8117647, 0, 1, 1,
0.8201069, 1.355164, 0.2657821, 0.8196079, 0, 1, 1,
0.8202315, -0.3899967, -0.1104746, 0.8235294, 0, 1, 1,
0.8244093, -0.969162, 4.06961, 0.8313726, 0, 1, 1,
0.8275582, 2.430818, -0.327303, 0.8352941, 0, 1, 1,
0.8390166, -0.9014509, 2.177122, 0.8431373, 0, 1, 1,
0.8489284, 0.452718, 1.316252, 0.8470588, 0, 1, 1,
0.8493313, 0.3511815, 0.2352548, 0.854902, 0, 1, 1,
0.8590767, -0.1208018, 3.425675, 0.8588235, 0, 1, 1,
0.8637705, -1.48203, 3.125128, 0.8666667, 0, 1, 1,
0.8737887, 0.3925452, 1.351972, 0.8705882, 0, 1, 1,
0.8739328, 1.098592, -0.7424825, 0.8784314, 0, 1, 1,
0.8828644, -1.136394, 2.423265, 0.8823529, 0, 1, 1,
0.8844866, -1.055481, 1.520945, 0.8901961, 0, 1, 1,
0.8853511, -0.2826705, 2.570528, 0.8941177, 0, 1, 1,
0.8856784, 0.397878, 1.5609, 0.9019608, 0, 1, 1,
0.890855, -0.1346268, 1.584207, 0.9098039, 0, 1, 1,
0.8990617, 1.117619, -0.03555358, 0.9137255, 0, 1, 1,
0.8995755, 0.3704899, 2.793769, 0.9215686, 0, 1, 1,
0.9032433, -0.6133698, 1.436729, 0.9254902, 0, 1, 1,
0.9050784, 0.007967881, 2.804167, 0.9333333, 0, 1, 1,
0.9062196, 0.4650866, 1.716862, 0.9372549, 0, 1, 1,
0.9114804, 0.6722178, 1.302223, 0.945098, 0, 1, 1,
0.9118708, -0.2975307, 1.851845, 0.9490196, 0, 1, 1,
0.9171755, -0.8345855, 1.905754, 0.9568627, 0, 1, 1,
0.9201949, 1.266729, 1.029582, 0.9607843, 0, 1, 1,
0.9202784, -0.5256797, 3.182232, 0.9686275, 0, 1, 1,
0.9209474, 0.3711596, 1.450829, 0.972549, 0, 1, 1,
0.9244248, -0.8260863, 3.250453, 0.9803922, 0, 1, 1,
0.924749, 0.06737821, 1.598402, 0.9843137, 0, 1, 1,
0.9263736, -0.3631133, 1.630638, 0.9921569, 0, 1, 1,
0.9273772, 1.204014, 1.006335, 0.9960784, 0, 1, 1,
0.941258, 0.07515123, 0.5460253, 1, 0, 0.9960784, 1,
0.9468867, 1.218457, 0.8001264, 1, 0, 0.9882353, 1,
0.9477046, -0.649502, 2.152214, 1, 0, 0.9843137, 1,
0.9544693, -0.6644508, 3.914572, 1, 0, 0.9764706, 1,
0.9556037, -2.498247, 2.671348, 1, 0, 0.972549, 1,
0.9558238, 0.8761504, 0.03781597, 1, 0, 0.9647059, 1,
0.9571629, -0.7554574, 2.968586, 1, 0, 0.9607843, 1,
0.9641367, 0.4032032, -0.5325639, 1, 0, 0.9529412, 1,
0.9650025, -0.3573732, 1.392569, 1, 0, 0.9490196, 1,
0.9669452, -0.2825886, 2.50629, 1, 0, 0.9411765, 1,
0.9673232, -0.1062463, 1.235955, 1, 0, 0.9372549, 1,
0.9679952, 2.147824, 2.223695, 1, 0, 0.9294118, 1,
0.9742793, -0.9672592, 3.982399, 1, 0, 0.9254902, 1,
0.9808848, -0.6993765, 2.994267, 1, 0, 0.9176471, 1,
0.9902961, -0.732187, 2.674957, 1, 0, 0.9137255, 1,
0.9919764, 0.1112874, 2.327578, 1, 0, 0.9058824, 1,
0.9924104, 0.1746143, 1.415467, 1, 0, 0.9019608, 1,
0.9970888, -1.985347, 2.317532, 1, 0, 0.8941177, 1,
1.002845, 1.333759, 2.193991, 1, 0, 0.8862745, 1,
1.006061, 1.055018, 0.5922457, 1, 0, 0.8823529, 1,
1.006068, -0.4709189, 1.620809, 1, 0, 0.8745098, 1,
1.010497, -1.691043, 3.633698, 1, 0, 0.8705882, 1,
1.011222, 0.3629821, 2.241159, 1, 0, 0.8627451, 1,
1.018774, -0.1025733, 1.454087, 1, 0, 0.8588235, 1,
1.020864, -0.004197266, 0.7442971, 1, 0, 0.8509804, 1,
1.029149, -1.916018, 2.760342, 1, 0, 0.8470588, 1,
1.033578, 0.1143057, 0.8078103, 1, 0, 0.8392157, 1,
1.033764, 0.8139037, 1.303904, 1, 0, 0.8352941, 1,
1.034033, 0.6277406, 0.9226372, 1, 0, 0.827451, 1,
1.037328, -1.090352, 2.356005, 1, 0, 0.8235294, 1,
1.042087, 0.1087053, 0.7637003, 1, 0, 0.8156863, 1,
1.045343, -1.053878, 2.910795, 1, 0, 0.8117647, 1,
1.046949, 0.3659306, 2.620029, 1, 0, 0.8039216, 1,
1.052683, -0.2851108, 1.870813, 1, 0, 0.7960784, 1,
1.060343, -0.3533175, 0.9812997, 1, 0, 0.7921569, 1,
1.060513, 0.1571756, 2.833505, 1, 0, 0.7843137, 1,
1.066823, -0.431782, 1.302913, 1, 0, 0.7803922, 1,
1.06963, 1.131248, 2.034372, 1, 0, 0.772549, 1,
1.072971, -0.001371571, -0.1395115, 1, 0, 0.7686275, 1,
1.078109, 0.9498038, 0.2182826, 1, 0, 0.7607843, 1,
1.085626, -0.6399606, 4.16255, 1, 0, 0.7568628, 1,
1.085749, -0.4412956, 2.823542, 1, 0, 0.7490196, 1,
1.098812, 1.123581, 2.52327, 1, 0, 0.7450981, 1,
1.099837, 0.1263438, 1.435695, 1, 0, 0.7372549, 1,
1.101975, -0.1909893, 3.229108, 1, 0, 0.7333333, 1,
1.102732, -1.837178, 1.54319, 1, 0, 0.7254902, 1,
1.107457, 1.167919, 0.9518158, 1, 0, 0.7215686, 1,
1.122862, 0.06405316, 2.74481, 1, 0, 0.7137255, 1,
1.124562, 0.1120145, 0.3673059, 1, 0, 0.7098039, 1,
1.12676, 1.242452, -0.6271935, 1, 0, 0.7019608, 1,
1.133304, -0.3172574, 2.315967, 1, 0, 0.6941177, 1,
1.133324, -1.53933, 2.785831, 1, 0, 0.6901961, 1,
1.139259, -1.160963, 0.5312045, 1, 0, 0.682353, 1,
1.14395, 0.9901241, 0.1628278, 1, 0, 0.6784314, 1,
1.153379, -0.004891896, 2.845112, 1, 0, 0.6705883, 1,
1.163293, 0.5947506, 1.395407, 1, 0, 0.6666667, 1,
1.164816, 1.338511, 3.089342, 1, 0, 0.6588235, 1,
1.167755, 0.805594, 1.253711, 1, 0, 0.654902, 1,
1.169526, -0.05868067, 1.498246, 1, 0, 0.6470588, 1,
1.172918, 1.100784, 1.393888, 1, 0, 0.6431373, 1,
1.173548, 0.4192682, 1.511388, 1, 0, 0.6352941, 1,
1.174266, 0.1583249, 3.235858, 1, 0, 0.6313726, 1,
1.193276, 1.014564, 1.445371, 1, 0, 0.6235294, 1,
1.196607, -1.174855, 3.059885, 1, 0, 0.6196079, 1,
1.199381, 0.9991984, -0.1004654, 1, 0, 0.6117647, 1,
1.209488, 0.2042918, 3.382942, 1, 0, 0.6078432, 1,
1.215287, -0.1127544, 3.016051, 1, 0, 0.6, 1,
1.217132, 0.3801767, 2.428486, 1, 0, 0.5921569, 1,
1.223202, -0.5927854, 2.719465, 1, 0, 0.5882353, 1,
1.225893, 1.22315, 2.18239, 1, 0, 0.5803922, 1,
1.231608, 0.205525, 2.092781, 1, 0, 0.5764706, 1,
1.23433, 1.56127, 0.3927298, 1, 0, 0.5686275, 1,
1.234904, 0.1263459, 0.9534857, 1, 0, 0.5647059, 1,
1.23587, -0.2747551, 0.1139921, 1, 0, 0.5568628, 1,
1.240492, -0.6152678, 2.041447, 1, 0, 0.5529412, 1,
1.247562, 0.4107111, 3.862202, 1, 0, 0.5450981, 1,
1.251905, -0.5521491, 1.660478, 1, 0, 0.5411765, 1,
1.255355, -1.000593, 3.317905, 1, 0, 0.5333334, 1,
1.264309, 0.1468493, 2.255219, 1, 0, 0.5294118, 1,
1.281852, 0.9622413, 0.387551, 1, 0, 0.5215687, 1,
1.286987, -0.6904161, 2.78645, 1, 0, 0.5176471, 1,
1.292125, -0.07086159, 2.094773, 1, 0, 0.509804, 1,
1.293003, 1.21288, 0.8686487, 1, 0, 0.5058824, 1,
1.301797, 0.6523151, 2.104424, 1, 0, 0.4980392, 1,
1.303266, -0.4455844, 3.189392, 1, 0, 0.4901961, 1,
1.323401, 0.810834, -0.4095369, 1, 0, 0.4862745, 1,
1.33251, -0.09428192, 0.7538608, 1, 0, 0.4784314, 1,
1.333276, -0.5632691, 1.600761, 1, 0, 0.4745098, 1,
1.347158, -0.16028, 0.4629658, 1, 0, 0.4666667, 1,
1.34737, -0.9660808, 3.410744, 1, 0, 0.4627451, 1,
1.354926, 0.8158764, 3.215435, 1, 0, 0.454902, 1,
1.359073, 1.414788, 1.691494, 1, 0, 0.4509804, 1,
1.394536, -1.246676, 0.4736931, 1, 0, 0.4431373, 1,
1.408668, 0.4117276, 1.606266, 1, 0, 0.4392157, 1,
1.409842, 0.1960503, 1.209149, 1, 0, 0.4313726, 1,
1.421021, -0.4392999, 0.7911201, 1, 0, 0.427451, 1,
1.429416, 0.1642273, 1.405094, 1, 0, 0.4196078, 1,
1.449686, -0.2011321, 0.1668391, 1, 0, 0.4156863, 1,
1.450263, -0.535888, 3.639767, 1, 0, 0.4078431, 1,
1.456064, 0.6174775, 0.805499, 1, 0, 0.4039216, 1,
1.4639, 0.4283657, 2.913022, 1, 0, 0.3960784, 1,
1.46858, -1.382209, 2.806646, 1, 0, 0.3882353, 1,
1.470896, -0.9352466, 2.451433, 1, 0, 0.3843137, 1,
1.48038, -0.1541563, 2.04634, 1, 0, 0.3764706, 1,
1.494722, 0.008684227, 0.5207032, 1, 0, 0.372549, 1,
1.498746, -0.5040941, 1.261506, 1, 0, 0.3647059, 1,
1.510163, 0.5825037, 0.9670603, 1, 0, 0.3607843, 1,
1.517528, 0.2333295, 2.678689, 1, 0, 0.3529412, 1,
1.518759, 1.269165, 1.047159, 1, 0, 0.3490196, 1,
1.527155, -0.3734799, 2.7805, 1, 0, 0.3411765, 1,
1.533655, -0.1160236, -0.08625919, 1, 0, 0.3372549, 1,
1.534531, -0.1865459, 1.687242, 1, 0, 0.3294118, 1,
1.534998, 1.026236, 0.7403412, 1, 0, 0.3254902, 1,
1.536964, -0.3684164, 2.790616, 1, 0, 0.3176471, 1,
1.537084, -1.212115, 1.716416, 1, 0, 0.3137255, 1,
1.543176, 0.1656489, 0.867955, 1, 0, 0.3058824, 1,
1.550888, -0.4692909, 5.208208, 1, 0, 0.2980392, 1,
1.565212, -1.005242, 3.798942, 1, 0, 0.2941177, 1,
1.618983, 0.4654351, 1.586813, 1, 0, 0.2862745, 1,
1.62319, 1.644536, 1.26049, 1, 0, 0.282353, 1,
1.628642, 0.2184458, 1.5762, 1, 0, 0.2745098, 1,
1.631402, -0.851052, 1.147835, 1, 0, 0.2705882, 1,
1.635463, 0.7904257, 3.416043, 1, 0, 0.2627451, 1,
1.647581, 0.1427771, 1.68071, 1, 0, 0.2588235, 1,
1.647767, -0.03152794, 1.676638, 1, 0, 0.2509804, 1,
1.670982, -0.9029503, 3.637402, 1, 0, 0.2470588, 1,
1.671637, -0.7502674, 2.965654, 1, 0, 0.2392157, 1,
1.687793, -0.7005024, 1.742123, 1, 0, 0.2352941, 1,
1.690343, 0.5743936, -0.2561427, 1, 0, 0.227451, 1,
1.718943, 0.4664376, 1.808958, 1, 0, 0.2235294, 1,
1.779311, 0.4034224, 0.08531908, 1, 0, 0.2156863, 1,
1.81443, -1.279088, 2.047864, 1, 0, 0.2117647, 1,
1.815266, -1.151434, 1.045386, 1, 0, 0.2039216, 1,
1.817531, 0.7773759, 1.631549, 1, 0, 0.1960784, 1,
1.820839, 0.7969309, -1.28741, 1, 0, 0.1921569, 1,
1.843112, 0.4454855, 0.5742511, 1, 0, 0.1843137, 1,
1.8699, 1.209932, 2.426798, 1, 0, 0.1803922, 1,
1.887647, 1.733427, 0.6859223, 1, 0, 0.172549, 1,
1.901133, 0.216653, 2.595881, 1, 0, 0.1686275, 1,
1.908672, -0.03586515, 0.4386185, 1, 0, 0.1607843, 1,
1.91519, -0.2869119, 2.35222, 1, 0, 0.1568628, 1,
1.917498, 0.1615761, 1.444102, 1, 0, 0.1490196, 1,
1.930174, -0.2272508, 2.900108, 1, 0, 0.145098, 1,
1.930346, 1.042585, 1.622495, 1, 0, 0.1372549, 1,
1.934655, 0.2814721, 0.4387583, 1, 0, 0.1333333, 1,
1.939952, 0.6533237, 1.813303, 1, 0, 0.1254902, 1,
1.946739, -1.289181, 1.179416, 1, 0, 0.1215686, 1,
1.975479, -0.0919058, 0.8150277, 1, 0, 0.1137255, 1,
1.98166, -0.07757215, 0.8372284, 1, 0, 0.1098039, 1,
1.985687, 0.04167084, -0.4445901, 1, 0, 0.1019608, 1,
1.987875, -1.347549, 1.287239, 1, 0, 0.09411765, 1,
2.081388, -1.177536, 2.421885, 1, 0, 0.09019608, 1,
2.083688, 2.65748, 0.2052523, 1, 0, 0.08235294, 1,
2.122696, -0.5746799, 1.751334, 1, 0, 0.07843138, 1,
2.133517, 0.2153308, -0.07710678, 1, 0, 0.07058824, 1,
2.175746, -1.182034, 3.462959, 1, 0, 0.06666667, 1,
2.211416, 0.03539487, -0.3586266, 1, 0, 0.05882353, 1,
2.238461, 0.2679754, 0.5188692, 1, 0, 0.05490196, 1,
2.329369, -0.6098418, 2.449597, 1, 0, 0.04705882, 1,
2.371966, -1.667881, 0.2170533, 1, 0, 0.04313726, 1,
2.390828, -1.93136, 1.993905, 1, 0, 0.03529412, 1,
2.43457, 0.8899324, 1.763926, 1, 0, 0.03137255, 1,
2.557991, -1.118755, 1.29461, 1, 0, 0.02352941, 1,
2.604247, -0.5272002, 2.670957, 1, 0, 0.01960784, 1,
2.646053, -0.7679347, 0.2810541, 1, 0, 0.01176471, 1,
2.729958, -1.827811, 3.216285, 1, 0, 0.007843138, 1
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
-0.255077, -4.100551, -6.906925, 0, -0.5, 0.5, 0.5,
-0.255077, -4.100551, -6.906925, 1, -0.5, 0.5, 0.5,
-0.255077, -4.100551, -6.906925, 1, 1.5, 0.5, 0.5,
-0.255077, -4.100551, -6.906925, 0, 1.5, 0.5, 0.5
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
-4.252038, -0.07119477, -6.906925, 0, -0.5, 0.5, 0.5,
-4.252038, -0.07119477, -6.906925, 1, -0.5, 0.5, 0.5,
-4.252038, -0.07119477, -6.906925, 1, 1.5, 0.5, 0.5,
-4.252038, -0.07119477, -6.906925, 0, 1.5, 0.5, 0.5
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
-4.252038, -4.100551, 0.0285871, 0, -0.5, 0.5, 0.5,
-4.252038, -4.100551, 0.0285871, 1, -0.5, 0.5, 0.5,
-4.252038, -4.100551, 0.0285871, 1, 1.5, 0.5, 0.5,
-4.252038, -4.100551, 0.0285871, 0, 1.5, 0.5, 0.5
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
-3, -3.170699, -5.306422,
2, -3.170699, -5.306422,
-3, -3.170699, -5.306422,
-3, -3.325675, -5.573173,
-2, -3.170699, -5.306422,
-2, -3.325675, -5.573173,
-1, -3.170699, -5.306422,
-1, -3.325675, -5.573173,
0, -3.170699, -5.306422,
0, -3.325675, -5.573173,
1, -3.170699, -5.306422,
1, -3.325675, -5.573173,
2, -3.170699, -5.306422,
2, -3.325675, -5.573173
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
-3, -3.635625, -6.106673, 0, -0.5, 0.5, 0.5,
-3, -3.635625, -6.106673, 1, -0.5, 0.5, 0.5,
-3, -3.635625, -6.106673, 1, 1.5, 0.5, 0.5,
-3, -3.635625, -6.106673, 0, 1.5, 0.5, 0.5,
-2, -3.635625, -6.106673, 0, -0.5, 0.5, 0.5,
-2, -3.635625, -6.106673, 1, -0.5, 0.5, 0.5,
-2, -3.635625, -6.106673, 1, 1.5, 0.5, 0.5,
-2, -3.635625, -6.106673, 0, 1.5, 0.5, 0.5,
-1, -3.635625, -6.106673, 0, -0.5, 0.5, 0.5,
-1, -3.635625, -6.106673, 1, -0.5, 0.5, 0.5,
-1, -3.635625, -6.106673, 1, 1.5, 0.5, 0.5,
-1, -3.635625, -6.106673, 0, 1.5, 0.5, 0.5,
0, -3.635625, -6.106673, 0, -0.5, 0.5, 0.5,
0, -3.635625, -6.106673, 1, -0.5, 0.5, 0.5,
0, -3.635625, -6.106673, 1, 1.5, 0.5, 0.5,
0, -3.635625, -6.106673, 0, 1.5, 0.5, 0.5,
1, -3.635625, -6.106673, 0, -0.5, 0.5, 0.5,
1, -3.635625, -6.106673, 1, -0.5, 0.5, 0.5,
1, -3.635625, -6.106673, 1, 1.5, 0.5, 0.5,
1, -3.635625, -6.106673, 0, 1.5, 0.5, 0.5,
2, -3.635625, -6.106673, 0, -0.5, 0.5, 0.5,
2, -3.635625, -6.106673, 1, -0.5, 0.5, 0.5,
2, -3.635625, -6.106673, 1, 1.5, 0.5, 0.5,
2, -3.635625, -6.106673, 0, 1.5, 0.5, 0.5
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
-3.329663, -3, -5.306422,
-3.329663, 2, -5.306422,
-3.329663, -3, -5.306422,
-3.483392, -3, -5.573173,
-3.329663, -2, -5.306422,
-3.483392, -2, -5.573173,
-3.329663, -1, -5.306422,
-3.483392, -1, -5.573173,
-3.329663, 0, -5.306422,
-3.483392, 0, -5.573173,
-3.329663, 1, -5.306422,
-3.483392, 1, -5.573173,
-3.329663, 2, -5.306422,
-3.483392, 2, -5.573173
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
-3.79085, -3, -6.106673, 0, -0.5, 0.5, 0.5,
-3.79085, -3, -6.106673, 1, -0.5, 0.5, 0.5,
-3.79085, -3, -6.106673, 1, 1.5, 0.5, 0.5,
-3.79085, -3, -6.106673, 0, 1.5, 0.5, 0.5,
-3.79085, -2, -6.106673, 0, -0.5, 0.5, 0.5,
-3.79085, -2, -6.106673, 1, -0.5, 0.5, 0.5,
-3.79085, -2, -6.106673, 1, 1.5, 0.5, 0.5,
-3.79085, -2, -6.106673, 0, 1.5, 0.5, 0.5,
-3.79085, -1, -6.106673, 0, -0.5, 0.5, 0.5,
-3.79085, -1, -6.106673, 1, -0.5, 0.5, 0.5,
-3.79085, -1, -6.106673, 1, 1.5, 0.5, 0.5,
-3.79085, -1, -6.106673, 0, 1.5, 0.5, 0.5,
-3.79085, 0, -6.106673, 0, -0.5, 0.5, 0.5,
-3.79085, 0, -6.106673, 1, -0.5, 0.5, 0.5,
-3.79085, 0, -6.106673, 1, 1.5, 0.5, 0.5,
-3.79085, 0, -6.106673, 0, 1.5, 0.5, 0.5,
-3.79085, 1, -6.106673, 0, -0.5, 0.5, 0.5,
-3.79085, 1, -6.106673, 1, -0.5, 0.5, 0.5,
-3.79085, 1, -6.106673, 1, 1.5, 0.5, 0.5,
-3.79085, 1, -6.106673, 0, 1.5, 0.5, 0.5,
-3.79085, 2, -6.106673, 0, -0.5, 0.5, 0.5,
-3.79085, 2, -6.106673, 1, -0.5, 0.5, 0.5,
-3.79085, 2, -6.106673, 1, 1.5, 0.5, 0.5,
-3.79085, 2, -6.106673, 0, 1.5, 0.5, 0.5
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
-3.329663, -3.170699, -4,
-3.329663, -3.170699, 4,
-3.329663, -3.170699, -4,
-3.483392, -3.325675, -4,
-3.329663, -3.170699, -2,
-3.483392, -3.325675, -2,
-3.329663, -3.170699, 0,
-3.483392, -3.325675, 0,
-3.329663, -3.170699, 2,
-3.483392, -3.325675, 2,
-3.329663, -3.170699, 4,
-3.483392, -3.325675, 4
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
-3.79085, -3.635625, -4, 0, -0.5, 0.5, 0.5,
-3.79085, -3.635625, -4, 1, -0.5, 0.5, 0.5,
-3.79085, -3.635625, -4, 1, 1.5, 0.5, 0.5,
-3.79085, -3.635625, -4, 0, 1.5, 0.5, 0.5,
-3.79085, -3.635625, -2, 0, -0.5, 0.5, 0.5,
-3.79085, -3.635625, -2, 1, -0.5, 0.5, 0.5,
-3.79085, -3.635625, -2, 1, 1.5, 0.5, 0.5,
-3.79085, -3.635625, -2, 0, 1.5, 0.5, 0.5,
-3.79085, -3.635625, 0, 0, -0.5, 0.5, 0.5,
-3.79085, -3.635625, 0, 1, -0.5, 0.5, 0.5,
-3.79085, -3.635625, 0, 1, 1.5, 0.5, 0.5,
-3.79085, -3.635625, 0, 0, 1.5, 0.5, 0.5,
-3.79085, -3.635625, 2, 0, -0.5, 0.5, 0.5,
-3.79085, -3.635625, 2, 1, -0.5, 0.5, 0.5,
-3.79085, -3.635625, 2, 1, 1.5, 0.5, 0.5,
-3.79085, -3.635625, 2, 0, 1.5, 0.5, 0.5,
-3.79085, -3.635625, 4, 0, -0.5, 0.5, 0.5,
-3.79085, -3.635625, 4, 1, -0.5, 0.5, 0.5,
-3.79085, -3.635625, 4, 1, 1.5, 0.5, 0.5,
-3.79085, -3.635625, 4, 0, 1.5, 0.5, 0.5
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
-3.329663, -3.170699, -5.306422,
-3.329663, 3.02831, -5.306422,
-3.329663, -3.170699, 5.363596,
-3.329663, 3.02831, 5.363596,
-3.329663, -3.170699, -5.306422,
-3.329663, -3.170699, 5.363596,
-3.329663, 3.02831, -5.306422,
-3.329663, 3.02831, 5.363596,
-3.329663, -3.170699, -5.306422,
2.819509, -3.170699, -5.306422,
-3.329663, -3.170699, 5.363596,
2.819509, -3.170699, 5.363596,
-3.329663, 3.02831, -5.306422,
2.819509, 3.02831, -5.306422,
-3.329663, 3.02831, 5.363596,
2.819509, 3.02831, 5.363596,
2.819509, -3.170699, -5.306422,
2.819509, 3.02831, -5.306422,
2.819509, -3.170699, 5.363596,
2.819509, 3.02831, 5.363596,
2.819509, -3.170699, -5.306422,
2.819509, -3.170699, 5.363596,
2.819509, 3.02831, -5.306422,
2.819509, 3.02831, 5.363596
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
var radius = 7.362144;
var distance = 32.75501;
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
mvMatrix.translate( 0.255077, 0.07119477, -0.0285871 );
mvMatrix.scale( 1.294499, 1.284091, 0.7460244 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.75501);
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
disodium_hydrogen_ar<-read.table("disodium_hydrogen_ar.xyz", skip=1)
```

```
## Error in read.table("disodium_hydrogen_ar.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-disodium_hydrogen_ar$V2
```

```
## Error in eval(expr, envir, enclos): object 'disodium_hydrogen_ar' not found
```

```r
y<-disodium_hydrogen_ar$V3
```

```
## Error in eval(expr, envir, enclos): object 'disodium_hydrogen_ar' not found
```

```r
z<-disodium_hydrogen_ar$V4
```

```
## Error in eval(expr, envir, enclos): object 'disodium_hydrogen_ar' not found
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
-3.240112, 0.7637716, -2.658542, 0, 0, 1, 1, 1,
-2.542366, 0.5155751, -1.038423, 1, 0, 0, 1, 1,
-2.522121, -0.3139056, -0.9667116, 1, 0, 0, 1, 1,
-2.467754, 2.938033, -0.7028902, 1, 0, 0, 1, 1,
-2.422626, 0.3506503, -2.209092, 1, 0, 0, 1, 1,
-2.323924, 0.03814029, -0.954298, 1, 0, 0, 1, 1,
-2.242095, 1.162561, 1.14878, 0, 0, 0, 1, 1,
-2.228491, 1.46686, 0.2434812, 0, 0, 0, 1, 1,
-2.223686, 1.588906, -0.2803447, 0, 0, 0, 1, 1,
-2.220799, -0.4372835, -1.939746, 0, 0, 0, 1, 1,
-2.172505, 0.1140611, 0.4913964, 0, 0, 0, 1, 1,
-2.167511, 0.3016477, -2.728106, 0, 0, 0, 1, 1,
-2.163067, -1.552463, -2.077233, 0, 0, 0, 1, 1,
-2.161592, 1.362171, -3.332181, 1, 1, 1, 1, 1,
-2.139668, 0.6634893, -1.3783, 1, 1, 1, 1, 1,
-2.108448, 2.638723, -0.5837395, 1, 1, 1, 1, 1,
-2.079276, 0.4298314, -1.220591, 1, 1, 1, 1, 1,
-2.062175, 0.5059931, -2.995642, 1, 1, 1, 1, 1,
-2.05278, -1.108063, -3.190601, 1, 1, 1, 1, 1,
-1.98665, 1.225471, -1.676846, 1, 1, 1, 1, 1,
-1.974511, -1.43242, -1.790908, 1, 1, 1, 1, 1,
-1.967239, 0.06751388, -0.6071437, 1, 1, 1, 1, 1,
-1.953729, -2.138276, -2.891576, 1, 1, 1, 1, 1,
-1.941433, 2.146506, -0.7655035, 1, 1, 1, 1, 1,
-1.933578, -0.728245, -1.590092, 1, 1, 1, 1, 1,
-1.913284, 1.90351, -1.126704, 1, 1, 1, 1, 1,
-1.912952, -1.828475, -2.435727, 1, 1, 1, 1, 1,
-1.874392, 0.4525176, -2.413793, 1, 1, 1, 1, 1,
-1.865153, 0.9907179, -0.6211211, 0, 0, 1, 1, 1,
-1.854981, -1.02211, -3.14658, 1, 0, 0, 1, 1,
-1.82559, 0.133219, -1.8438, 1, 0, 0, 1, 1,
-1.823385, -0.9503529, -2.760789, 1, 0, 0, 1, 1,
-1.816105, 0.8337551, -0.2256156, 1, 0, 0, 1, 1,
-1.808895, -0.7477854, -2.479451, 1, 0, 0, 1, 1,
-1.8062, 0.3601823, -1.464121, 0, 0, 0, 1, 1,
-1.802312, 0.5596482, -1.368746, 0, 0, 0, 1, 1,
-1.754325, -0.5397532, -1.622054, 0, 0, 0, 1, 1,
-1.752437, -0.9419311, -0.9478152, 0, 0, 0, 1, 1,
-1.749385, 1.022161, -0.9610573, 0, 0, 0, 1, 1,
-1.745614, -0.7466334, -0.4325102, 0, 0, 0, 1, 1,
-1.7401, -1.176141, -3.197647, 0, 0, 0, 1, 1,
-1.72366, -0.14021, -2.408811, 1, 1, 1, 1, 1,
-1.720533, -1.40456, -3.655179, 1, 1, 1, 1, 1,
-1.710599, -0.5392447, -0.6894872, 1, 1, 1, 1, 1,
-1.710588, -0.4027272, -2.245155, 1, 1, 1, 1, 1,
-1.698712, 0.1694735, -1.629261, 1, 1, 1, 1, 1,
-1.698606, -0.6886295, -1.594687, 1, 1, 1, 1, 1,
-1.697831, -1.062256, -3.21897, 1, 1, 1, 1, 1,
-1.684333, 1.795273, -1.158034, 1, 1, 1, 1, 1,
-1.682011, -0.6192514, -1.893934, 1, 1, 1, 1, 1,
-1.670081, -0.4775894, -2.696105, 1, 1, 1, 1, 1,
-1.658101, 1.167185, -1.587387, 1, 1, 1, 1, 1,
-1.635928, -0.6014327, 0.6474426, 1, 1, 1, 1, 1,
-1.630619, -0.1068598, -1.82614, 1, 1, 1, 1, 1,
-1.629662, -1.015407, -2.190268, 1, 1, 1, 1, 1,
-1.626317, 0.6920313, -2.471045, 1, 1, 1, 1, 1,
-1.625967, 0.608996, 1.178316, 0, 0, 1, 1, 1,
-1.623475, -0.581799, -2.123954, 1, 0, 0, 1, 1,
-1.617927, -0.5658313, 1.134346, 1, 0, 0, 1, 1,
-1.596672, 0.8435678, 0.01815521, 1, 0, 0, 1, 1,
-1.596596, 0.2971423, -1.898908, 1, 0, 0, 1, 1,
-1.583831, -0.7365751, 0.8982137, 1, 0, 0, 1, 1,
-1.572866, -0.2171339, -1.750278, 0, 0, 0, 1, 1,
-1.563431, -0.3942616, -3.405603, 0, 0, 0, 1, 1,
-1.56309, 0.6135433, -2.68898, 0, 0, 0, 1, 1,
-1.562135, -0.7504525, -0.5076272, 0, 0, 0, 1, 1,
-1.553988, 0.386972, -1.265994, 0, 0, 0, 1, 1,
-1.547755, -0.6305053, -2.875199, 0, 0, 0, 1, 1,
-1.534245, 0.05741791, 0.2757377, 0, 0, 0, 1, 1,
-1.531388, -0.009318573, -0.9280192, 1, 1, 1, 1, 1,
-1.527487, -1.079992, -1.981862, 1, 1, 1, 1, 1,
-1.526328, 0.9320007, -3.601429, 1, 1, 1, 1, 1,
-1.49693, -0.2064652, -0.4229315, 1, 1, 1, 1, 1,
-1.495065, -0.9478869, -4.161484, 1, 1, 1, 1, 1,
-1.492125, -1.113194, -3.2518, 1, 1, 1, 1, 1,
-1.488771, 1.55379, -1.589656, 1, 1, 1, 1, 1,
-1.473412, -0.5462182, -1.663954, 1, 1, 1, 1, 1,
-1.472852, 0.2841873, -2.04826, 1, 1, 1, 1, 1,
-1.46848, -0.5084344, -1.357308, 1, 1, 1, 1, 1,
-1.458461, 0.2606976, -2.183068, 1, 1, 1, 1, 1,
-1.458075, -0.3073148, -2.42006, 1, 1, 1, 1, 1,
-1.446167, 0.5481258, 0.09779811, 1, 1, 1, 1, 1,
-1.44488, -0.07313727, -1.865714, 1, 1, 1, 1, 1,
-1.438281, -1.212721, -3.599406, 1, 1, 1, 1, 1,
-1.436625, -0.5881457, -1.004821, 0, 0, 1, 1, 1,
-1.414299, -0.6961551, -4.241547, 1, 0, 0, 1, 1,
-1.413754, -0.6829516, -2.272051, 1, 0, 0, 1, 1,
-1.402128, 1.079873, 0.5594712, 1, 0, 0, 1, 1,
-1.395432, 1.335355, 0.7206589, 1, 0, 0, 1, 1,
-1.384143, 1.447224, -0.2823562, 1, 0, 0, 1, 1,
-1.38332, 1.341089, 0.4832043, 0, 0, 0, 1, 1,
-1.383176, -0.1916858, -2.247706, 0, 0, 0, 1, 1,
-1.371605, -1.231955, -1.388219, 0, 0, 0, 1, 1,
-1.371478, 0.688678, -0.9253185, 0, 0, 0, 1, 1,
-1.370694, -0.5471924, -2.351729, 0, 0, 0, 1, 1,
-1.36018, -0.5032763, -1.622454, 0, 0, 0, 1, 1,
-1.357587, -1.422134, -2.023468, 0, 0, 0, 1, 1,
-1.357018, -0.5667074, -0.3971204, 1, 1, 1, 1, 1,
-1.35559, -1.976135, -1.320748, 1, 1, 1, 1, 1,
-1.351338, 1.606197, -1.171172, 1, 1, 1, 1, 1,
-1.329699, -0.22656, -2.702101, 1, 1, 1, 1, 1,
-1.328531, 1.165643, -0.07407239, 1, 1, 1, 1, 1,
-1.326759, -0.7194474, -1.29774, 1, 1, 1, 1, 1,
-1.326013, 0.5039443, -1.186737, 1, 1, 1, 1, 1,
-1.317428, 0.2094732, 0.2028704, 1, 1, 1, 1, 1,
-1.317149, 0.3144588, -2.382071, 1, 1, 1, 1, 1,
-1.312191, 0.3040743, -1.61237, 1, 1, 1, 1, 1,
-1.31129, 1.233906, -0.5911192, 1, 1, 1, 1, 1,
-1.303938, 0.2944875, -1.450956, 1, 1, 1, 1, 1,
-1.303163, 0.01931157, -0.7662054, 1, 1, 1, 1, 1,
-1.298685, 0.5254098, -1.805754, 1, 1, 1, 1, 1,
-1.29186, 0.3969477, -1.594426, 1, 1, 1, 1, 1,
-1.288592, -1.112154, -3.446507, 0, 0, 1, 1, 1,
-1.284838, 0.2438617, -2.403123, 1, 0, 0, 1, 1,
-1.280517, 0.6825014, 0.6881219, 1, 0, 0, 1, 1,
-1.280269, 0.3307771, -1.798508, 1, 0, 0, 1, 1,
-1.279801, -0.5672481, -2.282562, 1, 0, 0, 1, 1,
-1.27851, -0.2202211, -2.546537, 1, 0, 0, 1, 1,
-1.274146, 0.7684312, -0.701056, 0, 0, 0, 1, 1,
-1.273456, -1.743288, -3.477088, 0, 0, 0, 1, 1,
-1.269026, -0.1405725, -2.62877, 0, 0, 0, 1, 1,
-1.26614, -0.5245202, -2.591278, 0, 0, 0, 1, 1,
-1.264944, -2.187862, -1.196125, 0, 0, 0, 1, 1,
-1.256308, -0.7163817, -0.9433914, 0, 0, 0, 1, 1,
-1.255733, -0.488699, -2.726388, 0, 0, 0, 1, 1,
-1.253174, 0.647618, 0.6915712, 1, 1, 1, 1, 1,
-1.251544, 0.8461784, -0.4494486, 1, 1, 1, 1, 1,
-1.247058, 0.06057882, -1.284204, 1, 1, 1, 1, 1,
-1.245877, 0.1721359, -0.08542915, 1, 1, 1, 1, 1,
-1.234737, 0.7915006, -3.78565, 1, 1, 1, 1, 1,
-1.228569, -1.258288, -2.994635, 1, 1, 1, 1, 1,
-1.224381, -0.6215696, -2.89262, 1, 1, 1, 1, 1,
-1.219846, -0.9424459, -1.060971, 1, 1, 1, 1, 1,
-1.21418, -0.1052624, -0.8766336, 1, 1, 1, 1, 1,
-1.207877, 2.022036, -1.213367, 1, 1, 1, 1, 1,
-1.17021, -1.608437, -3.429923, 1, 1, 1, 1, 1,
-1.166271, -0.726232, -2.890511, 1, 1, 1, 1, 1,
-1.151547, -0.1806645, -1.420726, 1, 1, 1, 1, 1,
-1.150692, -0.02029806, -1.85817, 1, 1, 1, 1, 1,
-1.141563, -0.5396441, -3.326379, 1, 1, 1, 1, 1,
-1.135768, -0.652223, -1.921836, 0, 0, 1, 1, 1,
-1.133031, 1.231283, -0.3006288, 1, 0, 0, 1, 1,
-1.118184, -0.1254378, -2.877724, 1, 0, 0, 1, 1,
-1.109469, -1.093889, -2.255921, 1, 0, 0, 1, 1,
-1.100022, -1.648584, -3.200199, 1, 0, 0, 1, 1,
-1.086557, -0.02359381, -0.2968353, 1, 0, 0, 1, 1,
-1.082464, -0.2923717, -1.66338, 0, 0, 0, 1, 1,
-1.079599, 0.2804666, -2.197268, 0, 0, 0, 1, 1,
-1.076676, -0.289003, -2.341395, 0, 0, 0, 1, 1,
-1.074309, 0.2109933, -1.83567, 0, 0, 0, 1, 1,
-1.071945, -0.03597856, -1.806538, 0, 0, 0, 1, 1,
-1.071932, 1.315146, -1.050391, 0, 0, 0, 1, 1,
-1.066763, -0.3316409, -0.3435926, 0, 0, 0, 1, 1,
-1.061965, 0.246173, -1.086713, 1, 1, 1, 1, 1,
-1.058335, -1.91013, -3.526988, 1, 1, 1, 1, 1,
-1.057872, -2.422263, -2.167069, 1, 1, 1, 1, 1,
-1.053996, 0.7649282, -0.6710687, 1, 1, 1, 1, 1,
-1.048456, 1.1794, -1.300667, 1, 1, 1, 1, 1,
-1.045553, -0.3557418, -2.319474, 1, 1, 1, 1, 1,
-1.044683, 0.9619244, -1.095117, 1, 1, 1, 1, 1,
-1.04406, 2.549595, -0.6208042, 1, 1, 1, 1, 1,
-1.03517, -1.243047, -2.733848, 1, 1, 1, 1, 1,
-1.034888, 2.010391, -0.7211905, 1, 1, 1, 1, 1,
-1.032848, 1.889554, 0.4562088, 1, 1, 1, 1, 1,
-1.03153, 0.9116076, -0.4333549, 1, 1, 1, 1, 1,
-1.027212, 1.084222, 1.372028, 1, 1, 1, 1, 1,
-1.022926, -0.4522555, -1.199887, 1, 1, 1, 1, 1,
-1.016516, -1.184856, -3.492389, 1, 1, 1, 1, 1,
-1.014107, -0.4842685, -1.829313, 0, 0, 1, 1, 1,
-1.011569, 0.9652953, -1.263886, 1, 0, 0, 1, 1,
-0.9990722, -2.04181, -3.00511, 1, 0, 0, 1, 1,
-0.9933906, -0.701869, -1.535201, 1, 0, 0, 1, 1,
-0.991659, -0.18975, -2.351285, 1, 0, 0, 1, 1,
-0.9892376, -1.478724, -0.7708863, 1, 0, 0, 1, 1,
-0.9858547, 0.2802926, -0.4592722, 0, 0, 0, 1, 1,
-0.9805924, 0.6935025, -1.425415, 0, 0, 0, 1, 1,
-0.9767894, -0.7291865, -2.881507, 0, 0, 0, 1, 1,
-0.9752519, -0.565565, -2.020702, 0, 0, 0, 1, 1,
-0.9711132, 0.8106735, -0.7831589, 0, 0, 0, 1, 1,
-0.9685234, -0.8366484, -2.967076, 0, 0, 0, 1, 1,
-0.9656101, 0.8200454, -0.1641967, 0, 0, 0, 1, 1,
-0.9644043, 0.1449238, -3.178702, 1, 1, 1, 1, 1,
-0.9595473, -0.3591349, -2.765046, 1, 1, 1, 1, 1,
-0.9535659, 0.8630558, -0.2918021, 1, 1, 1, 1, 1,
-0.9529482, 0.838761, -1.666299, 1, 1, 1, 1, 1,
-0.9513314, -0.2031941, -1.987046, 1, 1, 1, 1, 1,
-0.9392473, 0.911189, -1.483193, 1, 1, 1, 1, 1,
-0.9325927, -0.670379, -2.667974, 1, 1, 1, 1, 1,
-0.9294717, 0.606263, -1.321827, 1, 1, 1, 1, 1,
-0.9231991, 0.2255861, -0.9331721, 1, 1, 1, 1, 1,
-0.9224098, -0.4416975, -1.545766, 1, 1, 1, 1, 1,
-0.921738, -0.3127532, -2.58537, 1, 1, 1, 1, 1,
-0.9198125, 1.430608, -1.666187, 1, 1, 1, 1, 1,
-0.910635, -0.1142577, -2.094563, 1, 1, 1, 1, 1,
-0.9082921, -0.5757893, -2.064213, 1, 1, 1, 1, 1,
-0.8952468, -0.9580864, -3.077248, 1, 1, 1, 1, 1,
-0.8869575, -1.830888, -2.123497, 0, 0, 1, 1, 1,
-0.8864245, 0.9401651, 0.1700153, 1, 0, 0, 1, 1,
-0.8837654, -1.416847, -3.526917, 1, 0, 0, 1, 1,
-0.8771131, -1.394124, -4.323568, 1, 0, 0, 1, 1,
-0.8712146, 0.4282062, -0.371707, 1, 0, 0, 1, 1,
-0.8686032, 0.4452992, -2.546855, 1, 0, 0, 1, 1,
-0.8661473, -3.080423, -2.232772, 0, 0, 0, 1, 1,
-0.8590734, -2.384148, -2.682943, 0, 0, 0, 1, 1,
-0.8532224, 2.054693, 0.5077755, 0, 0, 0, 1, 1,
-0.850275, 0.3867228, -2.075685, 0, 0, 0, 1, 1,
-0.849728, 1.379686, -1.445345, 0, 0, 0, 1, 1,
-0.8466779, 0.2067132, -1.660244, 0, 0, 0, 1, 1,
-0.8405024, -0.3216909, -1.288541, 0, 0, 0, 1, 1,
-0.8393632, 0.5403036, -2.204022, 1, 1, 1, 1, 1,
-0.8367344, -1.233451, -3.81004, 1, 1, 1, 1, 1,
-0.8309692, 0.1929708, -1.041927, 1, 1, 1, 1, 1,
-0.8308819, 0.2116659, -1.850048, 1, 1, 1, 1, 1,
-0.8275162, 0.3557355, -4.491374, 1, 1, 1, 1, 1,
-0.824521, 1.116209, -1.136874, 1, 1, 1, 1, 1,
-0.8225648, -1.76181, -2.405041, 1, 1, 1, 1, 1,
-0.8223294, 0.4461284, -2.420919, 1, 1, 1, 1, 1,
-0.817772, -0.147784, -3.561356, 1, 1, 1, 1, 1,
-0.8147207, -2.002941, -2.773496, 1, 1, 1, 1, 1,
-0.8146166, 1.235991, -1.219246, 1, 1, 1, 1, 1,
-0.802946, 0.4423334, -0.4478958, 1, 1, 1, 1, 1,
-0.8024755, 1.128046, -0.8972522, 1, 1, 1, 1, 1,
-0.8009301, -0.008701673, -1.802997, 1, 1, 1, 1, 1,
-0.7978136, 0.6584282, -0.6515587, 1, 1, 1, 1, 1,
-0.7869178, 0.8154678, -2.190625, 0, 0, 1, 1, 1,
-0.778403, -0.6000125, -1.986053, 1, 0, 0, 1, 1,
-0.7739449, 0.8911645, 0.07975547, 1, 0, 0, 1, 1,
-0.7691816, -0.4146679, -2.830384, 1, 0, 0, 1, 1,
-0.7651381, 2.116515, 0.845216, 1, 0, 0, 1, 1,
-0.7553154, 0.7959197, -0.8830907, 1, 0, 0, 1, 1,
-0.7511458, 1.154023, -0.1075717, 0, 0, 0, 1, 1,
-0.7504553, 0.8227982, -1.115885, 0, 0, 0, 1, 1,
-0.7504405, 0.559894, -0.1702177, 0, 0, 0, 1, 1,
-0.7421793, 1.061261, 0.8705894, 0, 0, 0, 1, 1,
-0.7413501, 0.2565068, -1.435374, 0, 0, 0, 1, 1,
-0.7284499, 1.059981, -0.4438053, 0, 0, 0, 1, 1,
-0.7264926, -0.8540932, -0.9268778, 0, 0, 0, 1, 1,
-0.7254552, -0.5369331, -2.656048, 1, 1, 1, 1, 1,
-0.725068, -0.7997919, -2.064129, 1, 1, 1, 1, 1,
-0.722195, 0.09857167, -1.748715, 1, 1, 1, 1, 1,
-0.7216623, 0.1774893, -2.535161, 1, 1, 1, 1, 1,
-0.7204666, 0.5439392, -0.5086668, 1, 1, 1, 1, 1,
-0.7194849, 0.1748246, -1.747558, 1, 1, 1, 1, 1,
-0.7097256, 0.3121358, -0.1541478, 1, 1, 1, 1, 1,
-0.6956816, 0.08035792, -2.537405, 1, 1, 1, 1, 1,
-0.6956624, 1.213754, -1.256196, 1, 1, 1, 1, 1,
-0.6946436, 0.1338021, -1.787197, 1, 1, 1, 1, 1,
-0.69311, -1.014245, -4.253453, 1, 1, 1, 1, 1,
-0.6911788, 0.7377785, 0.4627905, 1, 1, 1, 1, 1,
-0.6901722, 0.2765203, -0.8420584, 1, 1, 1, 1, 1,
-0.6900235, -0.1027075, -1.153236, 1, 1, 1, 1, 1,
-0.6852559, 1.418761, -0.8983085, 1, 1, 1, 1, 1,
-0.683831, -0.522742, -3.302808, 0, 0, 1, 1, 1,
-0.6781771, -0.8079493, -2.317202, 1, 0, 0, 1, 1,
-0.6751442, 0.4487593, -2.150401, 1, 0, 0, 1, 1,
-0.6704125, -0.8156122, -2.29458, 1, 0, 0, 1, 1,
-0.6614778, 0.6462395, 0.6875701, 1, 0, 0, 1, 1,
-0.6558242, -2.030407, -2.411422, 1, 0, 0, 1, 1,
-0.6554661, 0.00923123, -0.9097874, 0, 0, 0, 1, 1,
-0.6514827, 1.461737, -1.141767, 0, 0, 0, 1, 1,
-0.6491662, -0.17012, -1.749087, 0, 0, 0, 1, 1,
-0.6482438, 1.293515, 0.5342774, 0, 0, 0, 1, 1,
-0.6474845, -2.136587, -2.312839, 0, 0, 0, 1, 1,
-0.6423965, -0.4291418, -4.106249, 0, 0, 0, 1, 1,
-0.6366516, 0.3232872, -0.01160666, 0, 0, 0, 1, 1,
-0.6349136, -0.6533114, -3.295303, 1, 1, 1, 1, 1,
-0.6273026, -0.06593087, -2.008837, 1, 1, 1, 1, 1,
-0.6270103, 0.05778822, -1.018372, 1, 1, 1, 1, 1,
-0.6231758, -0.3366254, -0.8946849, 1, 1, 1, 1, 1,
-0.6212174, 0.4545618, 0.1767506, 1, 1, 1, 1, 1,
-0.6201689, 0.5099996, 1.642428, 1, 1, 1, 1, 1,
-0.6187131, 0.1706864, -1.750843, 1, 1, 1, 1, 1,
-0.6186498, 1.832005, 0.2391584, 1, 1, 1, 1, 1,
-0.6160914, -0.1598362, -1.196814, 1, 1, 1, 1, 1,
-0.6035156, -0.1150328, -0.1723777, 1, 1, 1, 1, 1,
-0.6017521, 0.7100387, -2.608218, 1, 1, 1, 1, 1,
-0.6016532, 1.192973, 0.3105119, 1, 1, 1, 1, 1,
-0.6001346, 0.7753862, -1.104544, 1, 1, 1, 1, 1,
-0.5975277, -1.065611, -2.315643, 1, 1, 1, 1, 1,
-0.5960755, 0.6150508, -0.8924497, 1, 1, 1, 1, 1,
-0.5899259, -0.1201261, -1.268272, 0, 0, 1, 1, 1,
-0.5884674, -0.9509321, -0.9385116, 1, 0, 0, 1, 1,
-0.5883281, 0.5609506, -0.03045569, 1, 0, 0, 1, 1,
-0.5880696, -1.063231, -1.281255, 1, 0, 0, 1, 1,
-0.5868257, -1.884504, -4.005191, 1, 0, 0, 1, 1,
-0.5809942, -0.2052322, -2.74947, 1, 0, 0, 1, 1,
-0.5769531, 0.1696818, -1.680677, 0, 0, 0, 1, 1,
-0.5762783, 0.2666029, -1.429351, 0, 0, 0, 1, 1,
-0.5702831, 0.4057959, -0.7138261, 0, 0, 0, 1, 1,
-0.5700718, -0.2345158, 0.3196101, 0, 0, 0, 1, 1,
-0.5636114, -1.2457, -3.682848, 0, 0, 0, 1, 1,
-0.5626653, -0.01564234, -0.4201177, 0, 0, 0, 1, 1,
-0.5559602, -0.5312458, -2.606326, 0, 0, 0, 1, 1,
-0.5532801, 1.966369, 0.01406579, 1, 1, 1, 1, 1,
-0.5512297, -0.1223513, -1.773678, 1, 1, 1, 1, 1,
-0.5488067, 0.5914823, -1.354317, 1, 1, 1, 1, 1,
-0.5430011, -1.712905, -1.673213, 1, 1, 1, 1, 1,
-0.5396025, 0.5811752, -0.7448688, 1, 1, 1, 1, 1,
-0.5346427, 0.6177702, -0.6476365, 1, 1, 1, 1, 1,
-0.533982, 0.451332, 0.6097997, 1, 1, 1, 1, 1,
-0.5331623, 0.8600926, 1.562742, 1, 1, 1, 1, 1,
-0.5326054, -0.5714256, -2.352558, 1, 1, 1, 1, 1,
-0.5266016, -0.1054263, -2.297373, 1, 1, 1, 1, 1,
-0.5251163, 0.7407002, -0.8652854, 1, 1, 1, 1, 1,
-0.5248041, -0.204721, -2.370569, 1, 1, 1, 1, 1,
-0.5174776, -0.4117624, -1.506401, 1, 1, 1, 1, 1,
-0.5156229, 0.810222, -2.211377, 1, 1, 1, 1, 1,
-0.5149682, -0.2443506, -2.149608, 1, 1, 1, 1, 1,
-0.5142572, 1.192408, -0.3933446, 0, 0, 1, 1, 1,
-0.5141029, 1.170459, -0.6139162, 1, 0, 0, 1, 1,
-0.5118031, 0.2688426, -1.916128, 1, 0, 0, 1, 1,
-0.5090031, 0.07066652, -2.101795, 1, 0, 0, 1, 1,
-0.5076429, 0.2295032, 0.9363939, 1, 0, 0, 1, 1,
-0.5070095, 0.8252812, -0.628889, 1, 0, 0, 1, 1,
-0.5061186, 0.8938255, -1.215253, 0, 0, 0, 1, 1,
-0.5056155, 0.3440764, -0.4036566, 0, 0, 0, 1, 1,
-0.5032834, 0.5920708, 0.6981847, 0, 0, 0, 1, 1,
-0.5015414, -2.197741, -4.679127, 0, 0, 0, 1, 1,
-0.5005953, 0.4277883, -0.5807181, 0, 0, 0, 1, 1,
-0.5000837, -0.1618131, -3.074389, 0, 0, 0, 1, 1,
-0.4989878, -0.2858742, -2.384001, 0, 0, 0, 1, 1,
-0.4939452, -1.617187, -1.005065, 1, 1, 1, 1, 1,
-0.4910325, -0.4178272, -2.162699, 1, 1, 1, 1, 1,
-0.4889712, -0.974297, -4.015626, 1, 1, 1, 1, 1,
-0.48505, 0.2612841, -0.7212909, 1, 1, 1, 1, 1,
-0.4836027, 0.5462568, -1.649757, 1, 1, 1, 1, 1,
-0.4782567, 0.0282104, -1.940941, 1, 1, 1, 1, 1,
-0.4782387, 0.9809698, -0.5232443, 1, 1, 1, 1, 1,
-0.4761178, -0.1914203, -0.7499335, 1, 1, 1, 1, 1,
-0.4719405, -0.1015461, -3.101906, 1, 1, 1, 1, 1,
-0.4718286, 0.3267104, -0.9489736, 1, 1, 1, 1, 1,
-0.4707029, -0.05014154, -4.250423, 1, 1, 1, 1, 1,
-0.4688852, -0.7518556, -2.722711, 1, 1, 1, 1, 1,
-0.4648035, -0.7375108, -1.91813, 1, 1, 1, 1, 1,
-0.4614065, -0.4405417, -3.370064, 1, 1, 1, 1, 1,
-0.4611392, -0.02361399, 0.3891236, 1, 1, 1, 1, 1,
-0.4562764, 2.000056, -0.9166577, 0, 0, 1, 1, 1,
-0.456262, 0.3481905, -0.5164716, 1, 0, 0, 1, 1,
-0.4503955, -0.5215861, -1.901857, 1, 0, 0, 1, 1,
-0.4411476, -0.509747, -3.2763, 1, 0, 0, 1, 1,
-0.4408464, -0.744183, -3.106412, 1, 0, 0, 1, 1,
-0.4406089, 0.2405449, -2.250464, 1, 0, 0, 1, 1,
-0.4394979, -0.7773538, -2.122752, 0, 0, 0, 1, 1,
-0.43448, -1.00118, -2.632302, 0, 0, 0, 1, 1,
-0.4299667, 0.02490907, -1.263979, 0, 0, 0, 1, 1,
-0.4281662, 0.8752196, 1.992778, 0, 0, 0, 1, 1,
-0.4274327, 0.8888865, -0.1956157, 0, 0, 0, 1, 1,
-0.4253459, 0.4633774, -0.9461483, 0, 0, 0, 1, 1,
-0.4238918, -0.1164358, 0.06455193, 0, 0, 0, 1, 1,
-0.4236797, -0.6203097, -2.367748, 1, 1, 1, 1, 1,
-0.4211242, 0.1504013, -2.300829, 1, 1, 1, 1, 1,
-0.4209319, -1.495686, -2.256634, 1, 1, 1, 1, 1,
-0.4194261, -1.436924, -1.288531, 1, 1, 1, 1, 1,
-0.4192089, -1.024432, -2.325025, 1, 1, 1, 1, 1,
-0.4188609, 0.565078, -1.500705, 1, 1, 1, 1, 1,
-0.4163289, -1.964734, -3.296973, 1, 1, 1, 1, 1,
-0.4152689, 1.076329, -1.014701, 1, 1, 1, 1, 1,
-0.4101839, 1.372984, -1.599325, 1, 1, 1, 1, 1,
-0.4096701, 0.1439156, -1.646707, 1, 1, 1, 1, 1,
-0.4052423, -0.2289748, -2.063118, 1, 1, 1, 1, 1,
-0.4051788, -0.9585945, -3.504058, 1, 1, 1, 1, 1,
-0.4006129, -1.808408, -2.463685, 1, 1, 1, 1, 1,
-0.397485, 0.111916, 0.04771096, 1, 1, 1, 1, 1,
-0.3950527, -0.03586154, -1.670397, 1, 1, 1, 1, 1,
-0.3911284, 0.7559377, -0.3672521, 0, 0, 1, 1, 1,
-0.3887855, 0.08648562, -2.856095, 1, 0, 0, 1, 1,
-0.3860085, -0.2278796, -5.151033, 1, 0, 0, 1, 1,
-0.3811329, -0.8573522, -4.305706, 1, 0, 0, 1, 1,
-0.3760605, 0.1593726, -1.720246, 1, 0, 0, 1, 1,
-0.3732109, -2.253777, -2.026372, 1, 0, 0, 1, 1,
-0.3697141, 0.04635684, -2.403683, 0, 0, 0, 1, 1,
-0.3679852, 0.5205877, -1.588568, 0, 0, 0, 1, 1,
-0.3664795, 0.03802943, 1.307479, 0, 0, 0, 1, 1,
-0.3664649, -0.3298958, -1.301012, 0, 0, 0, 1, 1,
-0.3644339, -0.2140083, -0.4503665, 0, 0, 0, 1, 1,
-0.3644114, 0.7656241, -0.8477371, 0, 0, 0, 1, 1,
-0.3635754, -0.6009065, -2.4315, 0, 0, 0, 1, 1,
-0.3635023, -0.582148, -2.471979, 1, 1, 1, 1, 1,
-0.3621213, 0.4440716, -1.087533, 1, 1, 1, 1, 1,
-0.3586532, -0.4170577, -3.277, 1, 1, 1, 1, 1,
-0.3572003, 0.4659001, -0.2925894, 1, 1, 1, 1, 1,
-0.3530696, 1.706103, 1.130676, 1, 1, 1, 1, 1,
-0.3523818, -0.4990285, -3.090712, 1, 1, 1, 1, 1,
-0.3446555, 0.1214707, -0.557807, 1, 1, 1, 1, 1,
-0.3443727, 0.1692596, 0.736591, 1, 1, 1, 1, 1,
-0.3442067, -0.6374209, -3.392592, 1, 1, 1, 1, 1,
-0.3423382, -0.1184361, -1.950479, 1, 1, 1, 1, 1,
-0.3418275, -0.9488146, -2.272244, 1, 1, 1, 1, 1,
-0.3414423, 0.6212353, -1.265486, 1, 1, 1, 1, 1,
-0.3412504, -0.2199515, -1.33939, 1, 1, 1, 1, 1,
-0.3412071, -0.2817235, -2.024879, 1, 1, 1, 1, 1,
-0.3411985, -0.6253971, -2.790823, 1, 1, 1, 1, 1,
-0.3390549, 1.628629, -0.1393519, 0, 0, 1, 1, 1,
-0.3379384, -0.5615376, -2.765147, 1, 0, 0, 1, 1,
-0.3232628, 1.710944, 0.7626468, 1, 0, 0, 1, 1,
-0.3195508, -0.9112881, -2.624317, 1, 0, 0, 1, 1,
-0.3190607, -0.2561867, -2.265328, 1, 0, 0, 1, 1,
-0.3069577, 0.1431152, 0.5301756, 1, 0, 0, 1, 1,
-0.3060912, -1.238192, -4.074326, 0, 0, 0, 1, 1,
-0.3038759, -0.8632857, -2.789735, 0, 0, 0, 1, 1,
-0.3036532, -1.641691, -3.449808, 0, 0, 0, 1, 1,
-0.3027, -0.4313548, -1.997601, 0, 0, 0, 1, 1,
-0.2982, 0.4042264, -0.7312309, 0, 0, 0, 1, 1,
-0.2979059, -0.226878, -3.360481, 0, 0, 0, 1, 1,
-0.2971896, -0.5812585, -2.050585, 0, 0, 0, 1, 1,
-0.2943709, -0.2097272, -1.415665, 1, 1, 1, 1, 1,
-0.2927455, -0.2859672, -2.517496, 1, 1, 1, 1, 1,
-0.2912194, 2.803694, -0.08924003, 1, 1, 1, 1, 1,
-0.2888273, 0.2090338, -1.780661, 1, 1, 1, 1, 1,
-0.2770067, -0.07699637, -2.870436, 1, 1, 1, 1, 1,
-0.2766079, -1.436541, -2.452337, 1, 1, 1, 1, 1,
-0.2717474, 0.3734695, 0.07039615, 1, 1, 1, 1, 1,
-0.2708867, 0.04391049, -2.018967, 1, 1, 1, 1, 1,
-0.269161, -1.880195, -3.601925, 1, 1, 1, 1, 1,
-0.265819, 0.04256623, -3.562819, 1, 1, 1, 1, 1,
-0.2655363, -2.584259, -2.32251, 1, 1, 1, 1, 1,
-0.2610795, 0.515249, -0.8590081, 1, 1, 1, 1, 1,
-0.2605768, -0.3684896, -4.336897, 1, 1, 1, 1, 1,
-0.2521182, -0.9741023, -1.908443, 1, 1, 1, 1, 1,
-0.2519357, -0.4493993, -1.793889, 1, 1, 1, 1, 1,
-0.2505515, 2.098916, -0.1660274, 0, 0, 1, 1, 1,
-0.249481, -0.1472519, -1.725532, 1, 0, 0, 1, 1,
-0.2485066, 0.07810206, -0.787451, 1, 0, 0, 1, 1,
-0.2480037, 0.5802028, 0.1070742, 1, 0, 0, 1, 1,
-0.2464703, 0.9328238, 0.1056237, 1, 0, 0, 1, 1,
-0.2454154, -0.1111263, -2.296397, 1, 0, 0, 1, 1,
-0.2436199, 0.6363667, 0.527279, 0, 0, 0, 1, 1,
-0.2434268, 0.5503473, -1.200534, 0, 0, 0, 1, 1,
-0.2347659, 0.1201327, -1.542831, 0, 0, 0, 1, 1,
-0.2339077, -0.3428794, -1.794475, 0, 0, 0, 1, 1,
-0.2313313, -0.203372, -1.956649, 0, 0, 0, 1, 1,
-0.2230109, -1.622658, -1.964986, 0, 0, 0, 1, 1,
-0.2220899, 0.1336149, 0.5024006, 0, 0, 0, 1, 1,
-0.2183518, 0.1037575, -1.764454, 1, 1, 1, 1, 1,
-0.2133467, 0.0339551, -2.03825, 1, 1, 1, 1, 1,
-0.2130615, -1.404251, -2.913566, 1, 1, 1, 1, 1,
-0.2078664, -1.121317, -2.393423, 1, 1, 1, 1, 1,
-0.2075669, 0.9840118, 0.09672469, 1, 1, 1, 1, 1,
-0.2062574, 1.596652, -0.203369, 1, 1, 1, 1, 1,
-0.2024492, -0.398011, -3.205905, 1, 1, 1, 1, 1,
-0.2019639, 0.4902382, -1.06496, 1, 1, 1, 1, 1,
-0.2014923, 0.6812197, -1.307428, 1, 1, 1, 1, 1,
-0.2004783, -0.4185283, -3.232021, 1, 1, 1, 1, 1,
-0.1998786, 1.543523, -0.1885718, 1, 1, 1, 1, 1,
-0.1924411, 1.413709, 0.4607196, 1, 1, 1, 1, 1,
-0.1909371, 0.4421733, 1.545925, 1, 1, 1, 1, 1,
-0.1906929, 0.1197481, -0.5445952, 1, 1, 1, 1, 1,
-0.1873808, -0.8852395, -0.9722626, 1, 1, 1, 1, 1,
-0.1873103, 0.7897173, -0.3287461, 0, 0, 1, 1, 1,
-0.1837296, -1.426781, -3.205306, 1, 0, 0, 1, 1,
-0.1803019, -0.4134634, -1.944211, 1, 0, 0, 1, 1,
-0.1759496, -1.271084, -2.260227, 1, 0, 0, 1, 1,
-0.1714863, -1.465687, -3.323888, 1, 0, 0, 1, 1,
-0.1600198, -0.4149446, -4.617997, 1, 0, 0, 1, 1,
-0.1578607, 1.289273, 0.793427, 0, 0, 0, 1, 1,
-0.1575246, 0.8052201, 1.365868, 0, 0, 0, 1, 1,
-0.1558015, -0.1577093, -0.9368509, 0, 0, 0, 1, 1,
-0.1502253, -1.063827, -3.301857, 0, 0, 0, 1, 1,
-0.1500879, 0.5508963, -1.144965, 0, 0, 0, 1, 1,
-0.1493309, -0.7939343, -2.977276, 0, 0, 0, 1, 1,
-0.1449562, 0.4151476, -0.193158, 0, 0, 0, 1, 1,
-0.1448583, 0.1922032, 0.2232318, 1, 1, 1, 1, 1,
-0.1378546, -0.1688433, -3.566587, 1, 1, 1, 1, 1,
-0.1371073, -1.155874, -3.372672, 1, 1, 1, 1, 1,
-0.1350472, 0.01764609, -3.13811, 1, 1, 1, 1, 1,
-0.1337408, 0.1438514, -0.3203851, 1, 1, 1, 1, 1,
-0.1299776, -1.676867, -2.496077, 1, 1, 1, 1, 1,
-0.1276898, 0.8422793, -1.039418, 1, 1, 1, 1, 1,
-0.1244559, -0.3643142, -3.509916, 1, 1, 1, 1, 1,
-0.1237165, 0.1698406, -0.02805782, 1, 1, 1, 1, 1,
-0.1183385, -1.57275, -2.670056, 1, 1, 1, 1, 1,
-0.116797, -0.426836, -3.587729, 1, 1, 1, 1, 1,
-0.1161225, 0.3738483, -0.6014263, 1, 1, 1, 1, 1,
-0.1093855, -0.2963032, -3.039084, 1, 1, 1, 1, 1,
-0.103591, 1.035824, 0.4777659, 1, 1, 1, 1, 1,
-0.1035427, -0.3629027, -4.132919, 1, 1, 1, 1, 1,
-0.102008, 0.1930053, -1.212726, 0, 0, 1, 1, 1,
-0.09947646, 1.271023, 0.7231754, 1, 0, 0, 1, 1,
-0.09811494, -1.25064, -3.378381, 1, 0, 0, 1, 1,
-0.09524718, -0.1375619, -1.904877, 1, 0, 0, 1, 1,
-0.09427544, -0.5128538, -2.309616, 1, 0, 0, 1, 1,
-0.09328362, -1.396925, -2.765633, 1, 0, 0, 1, 1,
-0.09319185, 1.83037, 0.2039566, 0, 0, 0, 1, 1,
-0.08937436, -1.093361, -2.435066, 0, 0, 0, 1, 1,
-0.08665025, 0.08803561, -0.07282043, 0, 0, 0, 1, 1,
-0.08374406, -0.813316, -2.919438, 0, 0, 0, 1, 1,
-0.08252467, 0.1460763, 0.05973805, 0, 0, 0, 1, 1,
-0.07932559, 0.1538093, 0.4384806, 0, 0, 0, 1, 1,
-0.07905114, 0.1834629, -0.2595525, 0, 0, 0, 1, 1,
-0.07884441, 1.544785, 0.2965412, 1, 1, 1, 1, 1,
-0.07733434, -0.5861619, -2.360998, 1, 1, 1, 1, 1,
-0.0770206, -1.741824, -0.9519337, 1, 1, 1, 1, 1,
-0.07283354, -0.5966618, -3.565508, 1, 1, 1, 1, 1,
-0.07122844, 2.073299, -0.5891415, 1, 1, 1, 1, 1,
-0.06768674, 0.5371096, -0.36928, 1, 1, 1, 1, 1,
-0.06595622, -1.403346, -3.361843, 1, 1, 1, 1, 1,
-0.06454939, -0.06109216, -1.044958, 1, 1, 1, 1, 1,
-0.06114705, -1.360039, -2.322675, 1, 1, 1, 1, 1,
-0.06017723, 0.6530892, -0.7362791, 1, 1, 1, 1, 1,
-0.05583821, 0.9997234, 0.6885773, 1, 1, 1, 1, 1,
-0.04974636, -0.6504999, -0.1689093, 1, 1, 1, 1, 1,
-0.04732921, 0.753451, -1.764391, 1, 1, 1, 1, 1,
-0.04720961, 1.647511, -1.171386, 1, 1, 1, 1, 1,
-0.02764925, -1.053502, -2.744085, 1, 1, 1, 1, 1,
-0.0261481, -0.4505042, -2.246855, 0, 0, 1, 1, 1,
-0.02485576, 1.380754, 0.1737192, 1, 0, 0, 1, 1,
-0.01645688, 1.762021, 1.885664, 1, 0, 0, 1, 1,
-0.0143821, 1.273089, -0.4413947, 1, 0, 0, 1, 1,
-0.009807094, 0.8722134, -0.3494299, 1, 0, 0, 1, 1,
-0.008566827, -0.3138435, -2.876961, 1, 0, 0, 1, 1,
-0.004736418, 1.072604, 0.05408369, 0, 0, 0, 1, 1,
-0.004661271, 0.1485358, -0.5194522, 0, 0, 0, 1, 1,
-0.003306336, 0.7559974, 0.2299685, 0, 0, 0, 1, 1,
0.001252573, -1.439503, 3.376113, 0, 0, 0, 1, 1,
0.004790492, 0.9364886, -1.196177, 0, 0, 0, 1, 1,
0.006891771, -2.985584, 4.517094, 0, 0, 0, 1, 1,
0.008713032, -0.1640546, 4.114498, 0, 0, 0, 1, 1,
0.01843444, -2.173024, 2.641779, 1, 1, 1, 1, 1,
0.01850926, 0.9975299, -1.070004, 1, 1, 1, 1, 1,
0.02406501, -0.259131, 3.610337, 1, 1, 1, 1, 1,
0.03351731, -0.9126795, 2.319618, 1, 1, 1, 1, 1,
0.03386006, 1.930216, -0.7506279, 1, 1, 1, 1, 1,
0.03622946, 0.5178366, -1.176318, 1, 1, 1, 1, 1,
0.03838298, 0.9049541, -0.05023894, 1, 1, 1, 1, 1,
0.03875862, -0.6916996, 3.036542, 1, 1, 1, 1, 1,
0.04133349, -0.8295815, 2.707231, 1, 1, 1, 1, 1,
0.0425532, -0.7219524, 4.516147, 1, 1, 1, 1, 1,
0.04337571, 0.4971949, -0.1356546, 1, 1, 1, 1, 1,
0.04345582, 0.8058627, 0.3493511, 1, 1, 1, 1, 1,
0.04360345, 1.762828, -0.7941043, 1, 1, 1, 1, 1,
0.04424065, -1.064588, 3.867024, 1, 1, 1, 1, 1,
0.04523871, -0.04430155, 1.853179, 1, 1, 1, 1, 1,
0.05242955, 1.658056, -0.6163318, 0, 0, 1, 1, 1,
0.05549651, -0.1872233, 3.863331, 1, 0, 0, 1, 1,
0.05592936, -0.3183064, 3.546698, 1, 0, 0, 1, 1,
0.06896848, 0.05226452, -0.8967403, 1, 0, 0, 1, 1,
0.06944445, -0.198723, 4.550913, 1, 0, 0, 1, 1,
0.06958524, 0.03713144, 1.897202, 1, 0, 0, 1, 1,
0.07242643, -1.142592, 3.653221, 0, 0, 0, 1, 1,
0.07285149, -0.1883669, 2.221025, 0, 0, 0, 1, 1,
0.0745518, -1.128703, 4.042024, 0, 0, 0, 1, 1,
0.07467242, -0.9904872, 3.211152, 0, 0, 0, 1, 1,
0.07640038, 0.3516114, -2.353466, 0, 0, 0, 1, 1,
0.07738277, 1.396745, -1.658975, 0, 0, 0, 1, 1,
0.07904366, 0.4706332, 0.1378769, 0, 0, 0, 1, 1,
0.08022593, -0.3548703, 3.232342, 1, 1, 1, 1, 1,
0.08173289, 0.2518622, 0.007028696, 1, 1, 1, 1, 1,
0.08198689, -1.21074, 4.361076, 1, 1, 1, 1, 1,
0.08359219, -0.211251, 2.983171, 1, 1, 1, 1, 1,
0.08502609, 0.1779073, -0.09272004, 1, 1, 1, 1, 1,
0.08600575, 0.8744429, -0.6377203, 1, 1, 1, 1, 1,
0.0860596, 1.213148, 0.337898, 1, 1, 1, 1, 1,
0.09090038, -0.2689874, 3.866176, 1, 1, 1, 1, 1,
0.1024676, -0.05050423, 2.382311, 1, 1, 1, 1, 1,
0.1081354, 1.736952, 0.5788338, 1, 1, 1, 1, 1,
0.1125585, 1.143206, 0.3349681, 1, 1, 1, 1, 1,
0.1131978, 0.08712703, 0.8959, 1, 1, 1, 1, 1,
0.1158919, -1.048027, 3.035802, 1, 1, 1, 1, 1,
0.119571, 0.3169319, 0.4188014, 1, 1, 1, 1, 1,
0.1217466, -0.2141878, 3.443657, 1, 1, 1, 1, 1,
0.1228277, -1.07169, 2.020649, 0, 0, 1, 1, 1,
0.1236687, -0.6010789, 2.574682, 1, 0, 0, 1, 1,
0.1244206, 0.8728444, 0.09843818, 1, 0, 0, 1, 1,
0.1252336, 0.4162258, 0.2846349, 1, 0, 0, 1, 1,
0.126146, 1.436625, -0.02580419, 1, 0, 0, 1, 1,
0.1295739, 0.3848521, -1.950098, 1, 0, 0, 1, 1,
0.1356125, -1.564487, 2.157926, 0, 0, 0, 1, 1,
0.138514, -0.6212047, 2.721074, 0, 0, 0, 1, 1,
0.1385573, -1.593609, 1.972084, 0, 0, 0, 1, 1,
0.144978, -1.214026, 1.449834, 0, 0, 0, 1, 1,
0.147567, 1.770223, 0.1451109, 0, 0, 0, 1, 1,
0.1485844, -2.166365, 0.9500079, 0, 0, 0, 1, 1,
0.1514835, -0.2565664, 2.571672, 0, 0, 0, 1, 1,
0.1519107, 1.029228, 1.034653, 1, 1, 1, 1, 1,
0.1626178, 1.040244, 0.958764, 1, 1, 1, 1, 1,
0.1641072, 0.5298282, 1.398561, 1, 1, 1, 1, 1,
0.1655445, -0.5176981, 1.453475, 1, 1, 1, 1, 1,
0.1657594, -1.42941, 2.796367, 1, 1, 1, 1, 1,
0.1679461, 0.7723999, -0.3144381, 1, 1, 1, 1, 1,
0.1702622, 0.1448691, 1.439042, 1, 1, 1, 1, 1,
0.1754571, 0.302501, 0.5220484, 1, 1, 1, 1, 1,
0.1762824, -0.2398893, 1.616623, 1, 1, 1, 1, 1,
0.1774171, -2.162823, 2.311156, 1, 1, 1, 1, 1,
0.1780173, -0.256417, 3.050646, 1, 1, 1, 1, 1,
0.1785298, -0.3576886, 3.2235, 1, 1, 1, 1, 1,
0.1851157, 0.4214478, -0.07008696, 1, 1, 1, 1, 1,
0.1872737, -2.279212, 1.671641, 1, 1, 1, 1, 1,
0.1898862, 0.9823645, 3.350032, 1, 1, 1, 1, 1,
0.1920099, 0.6105062, -0.453742, 0, 0, 1, 1, 1,
0.1933293, 1.29378, -1.061507, 1, 0, 0, 1, 1,
0.19349, -0.9421976, 2.590333, 1, 0, 0, 1, 1,
0.2006407, 0.7164792, 0.4926958, 1, 0, 0, 1, 1,
0.2009706, -1.28152, 3.083858, 1, 0, 0, 1, 1,
0.203001, -1.591187, 0.7568808, 1, 0, 0, 1, 1,
0.2057105, -0.8377731, 3.023306, 0, 0, 0, 1, 1,
0.2171775, 1.058613, 0.206851, 0, 0, 0, 1, 1,
0.2233921, 0.6327716, -0.06556159, 0, 0, 0, 1, 1,
0.2344057, 0.3598466, 0.6761757, 0, 0, 0, 1, 1,
0.2375451, -0.2799617, 2.507534, 0, 0, 0, 1, 1,
0.2378838, -0.08004147, 1.057029, 0, 0, 0, 1, 1,
0.2414256, 0.1004583, 0.05219129, 0, 0, 0, 1, 1,
0.2444126, -0.1245616, 2.315346, 1, 1, 1, 1, 1,
0.2453664, -1.391965, 3.537565, 1, 1, 1, 1, 1,
0.2490118, 0.00215862, 0.01738034, 1, 1, 1, 1, 1,
0.251315, 1.235201, 0.8513398, 1, 1, 1, 1, 1,
0.2538246, -0.2576525, 2.937928, 1, 1, 1, 1, 1,
0.2564082, 0.9124803, 0.7726074, 1, 1, 1, 1, 1,
0.2580059, -1.18282, 3.967319, 1, 1, 1, 1, 1,
0.2606658, 1.685226, 0.3758883, 1, 1, 1, 1, 1,
0.2638319, 0.2971252, -0.3003283, 1, 1, 1, 1, 1,
0.2655161, 0.8088352, 1.164344, 1, 1, 1, 1, 1,
0.2673095, 1.630931, 1.094654, 1, 1, 1, 1, 1,
0.2749931, -0.644744, 2.217552, 1, 1, 1, 1, 1,
0.2755451, -0.147605, 2.568341, 1, 1, 1, 1, 1,
0.2756362, -0.4100517, 3.239338, 1, 1, 1, 1, 1,
0.2773328, 1.000675, 0.0301638, 1, 1, 1, 1, 1,
0.2798057, -0.3175681, 2.601078, 0, 0, 1, 1, 1,
0.2814412, -1.19448, 3.234414, 1, 0, 0, 1, 1,
0.2818995, -0.09991025, 2.770695, 1, 0, 0, 1, 1,
0.282746, -0.3252803, 2.787893, 1, 0, 0, 1, 1,
0.2958806, 0.3748862, 0.1116915, 1, 0, 0, 1, 1,
0.2983238, 0.524743, 0.7435598, 1, 0, 0, 1, 1,
0.303546, 1.18672, 1.902379, 0, 0, 0, 1, 1,
0.3073743, 2.118843, 0.2821655, 0, 0, 0, 1, 1,
0.3107348, -0.2400642, 0.5036041, 0, 0, 0, 1, 1,
0.3109482, 0.6002337, 1.029098, 0, 0, 0, 1, 1,
0.3149641, -0.4819804, 4.700276, 0, 0, 0, 1, 1,
0.3152039, -0.2517244, 1.449016, 0, 0, 0, 1, 1,
0.3175294, 1.50535, -1.472418, 0, 0, 0, 1, 1,
0.318266, -1.066377, 3.07025, 1, 1, 1, 1, 1,
0.3188795, 0.6394501, -0.166009, 1, 1, 1, 1, 1,
0.3198732, 0.1222189, 0.4930698, 1, 1, 1, 1, 1,
0.3213047, -1.121566, 4.803964, 1, 1, 1, 1, 1,
0.3236246, 0.6426463, 0.575094, 1, 1, 1, 1, 1,
0.3264782, -0.3515776, 3.741496, 1, 1, 1, 1, 1,
0.3325899, -1.00376, 1.659519, 1, 1, 1, 1, 1,
0.3348006, -0.6767899, 2.807749, 1, 1, 1, 1, 1,
0.3380973, 1.656186, -1.141659, 1, 1, 1, 1, 1,
0.3394085, 0.4602183, -0.6105905, 1, 1, 1, 1, 1,
0.3424533, 0.3433834, 3.76201, 1, 1, 1, 1, 1,
0.3425032, 0.3749073, 0.5469372, 1, 1, 1, 1, 1,
0.3460483, 0.09180294, 1.329728, 1, 1, 1, 1, 1,
0.3467551, 1.677372, 1.106182, 1, 1, 1, 1, 1,
0.3481446, -1.216985, 2.389357, 1, 1, 1, 1, 1,
0.3536014, -0.0322942, 1.80404, 0, 0, 1, 1, 1,
0.3595757, -0.1064811, 3.305998, 1, 0, 0, 1, 1,
0.3634374, -0.009844315, 0.9335694, 1, 0, 0, 1, 1,
0.3640096, 0.2063138, 2.430475, 1, 0, 0, 1, 1,
0.364055, -0.3175177, 2.977719, 1, 0, 0, 1, 1,
0.3660025, 0.3038532, -0.338576, 1, 0, 0, 1, 1,
0.3671633, -0.3479927, 1.85678, 0, 0, 0, 1, 1,
0.3695012, -0.3994943, 3.267607, 0, 0, 0, 1, 1,
0.371102, -1.282696, 1.0653, 0, 0, 0, 1, 1,
0.3723791, -1.285069, 2.734575, 0, 0, 0, 1, 1,
0.3766043, -0.1959396, 3.024433, 0, 0, 0, 1, 1,
0.3797842, -1.144841, 1.821031, 0, 0, 0, 1, 1,
0.3806915, -0.9689375, 2.655128, 0, 0, 0, 1, 1,
0.3816286, -0.04759979, 2.345927, 1, 1, 1, 1, 1,
0.3837393, 2.345316, 0.1862234, 1, 1, 1, 1, 1,
0.3838183, 0.8648886, 0.4833108, 1, 1, 1, 1, 1,
0.3864751, -0.2739753, 1.357906, 1, 1, 1, 1, 1,
0.3864806, 0.6292887, 1.18444, 1, 1, 1, 1, 1,
0.3871815, 0.07213937, 0.3850761, 1, 1, 1, 1, 1,
0.3895038, -0.06884537, 0.8849717, 1, 1, 1, 1, 1,
0.3898978, -1.317583, 3.179558, 1, 1, 1, 1, 1,
0.3919166, -1.59695, 2.807807, 1, 1, 1, 1, 1,
0.3926101, 0.5727715, -0.5310755, 1, 1, 1, 1, 1,
0.3926677, -0.972068, 2.455013, 1, 1, 1, 1, 1,
0.3946349, -0.4917379, 3.102245, 1, 1, 1, 1, 1,
0.3957037, -1.352672, 1.478962, 1, 1, 1, 1, 1,
0.3965195, 0.2475114, 1.01124, 1, 1, 1, 1, 1,
0.3987569, 0.9750451, 1.320175, 1, 1, 1, 1, 1,
0.4042585, -0.9280995, 1.491556, 0, 0, 1, 1, 1,
0.4050703, 0.0272937, 0.7094409, 1, 0, 0, 1, 1,
0.4103064, -0.6010259, 1.550037, 1, 0, 0, 1, 1,
0.4178723, -0.05789534, 0.426488, 1, 0, 0, 1, 1,
0.418985, -0.2303896, 2.382569, 1, 0, 0, 1, 1,
0.4215508, 0.5027902, 2.452955, 1, 0, 0, 1, 1,
0.4215748, -1.145613, 2.785129, 0, 0, 0, 1, 1,
0.4219713, 0.9896977, 0.4416793, 0, 0, 0, 1, 1,
0.423957, -0.2406402, 1.058013, 0, 0, 0, 1, 1,
0.4281659, 0.3844096, -0.1018352, 0, 0, 0, 1, 1,
0.4299716, 0.5276503, 1.14648, 0, 0, 0, 1, 1,
0.4317434, -0.9552816, 1.090929, 0, 0, 0, 1, 1,
0.4323199, -0.05095113, 0.6589123, 0, 0, 0, 1, 1,
0.4339483, -0.9030021, 5.027386, 1, 1, 1, 1, 1,
0.4387301, -0.3961645, 1.669992, 1, 1, 1, 1, 1,
0.4437431, 0.2308792, 1.117833, 1, 1, 1, 1, 1,
0.4450462, 1.981373, 0.7966686, 1, 1, 1, 1, 1,
0.4523364, 1.357319, 3.650924, 1, 1, 1, 1, 1,
0.4530655, 0.7361648, 2.390562, 1, 1, 1, 1, 1,
0.4567855, -0.0517649, 0.1787166, 1, 1, 1, 1, 1,
0.4575363, 1.346391, 1.023712, 1, 1, 1, 1, 1,
0.4638587, -2.257993, 3.765454, 1, 1, 1, 1, 1,
0.4661005, 0.760583, 1.710838, 1, 1, 1, 1, 1,
0.470551, 2.172899, -1.186729, 1, 1, 1, 1, 1,
0.4743544, -1.689454, 4.002733, 1, 1, 1, 1, 1,
0.4752288, 0.1741278, 1.167857, 1, 1, 1, 1, 1,
0.4764006, -0.3180362, 0.3598036, 1, 1, 1, 1, 1,
0.4770911, -0.3146481, 1.390329, 1, 1, 1, 1, 1,
0.4797336, -1.187705, 2.530679, 0, 0, 1, 1, 1,
0.4814415, 0.6637619, 2.022171, 1, 0, 0, 1, 1,
0.4821749, -0.3132122, 2.441065, 1, 0, 0, 1, 1,
0.4845207, 0.4194925, 1.240069, 1, 0, 0, 1, 1,
0.4874397, 1.621727, 0.5613837, 1, 0, 0, 1, 1,
0.4912525, 0.04044586, 2.394437, 1, 0, 0, 1, 1,
0.5017893, -0.295561, 1.706791, 0, 0, 0, 1, 1,
0.5042753, -0.45947, 2.251396, 0, 0, 0, 1, 1,
0.5051275, 0.9029492, 0.8128603, 0, 0, 0, 1, 1,
0.505129, -1.141346, 3.450989, 0, 0, 0, 1, 1,
0.5102671, -1.231885, 1.275728, 0, 0, 0, 1, 1,
0.5117004, -0.2290749, 2.282754, 0, 0, 0, 1, 1,
0.5141092, -0.1067702, 2.60239, 0, 0, 0, 1, 1,
0.5170178, 0.2295076, 0.5502034, 1, 1, 1, 1, 1,
0.5243114, -0.6240639, 2.487891, 1, 1, 1, 1, 1,
0.5246373, 0.3343927, 1.693943, 1, 1, 1, 1, 1,
0.5291777, -0.3993492, 1.513292, 1, 1, 1, 1, 1,
0.5295901, -0.2750842, 2.105501, 1, 1, 1, 1, 1,
0.5387895, -0.5007714, 3.28511, 1, 1, 1, 1, 1,
0.5445276, -0.2920776, 1.867437, 1, 1, 1, 1, 1,
0.5480021, -1.724581, 1.168563, 1, 1, 1, 1, 1,
0.5518228, -1.267113, 2.403928, 1, 1, 1, 1, 1,
0.558003, -1.565474, 2.925431, 1, 1, 1, 1, 1,
0.5656975, 2.40981, -0.5994418, 1, 1, 1, 1, 1,
0.5665696, 0.6977661, 0.3326392, 1, 1, 1, 1, 1,
0.5695555, 0.5980572, -0.8487196, 1, 1, 1, 1, 1,
0.5697857, 1.015359, -0.9335932, 1, 1, 1, 1, 1,
0.5706367, 1.435368, 1.370509, 1, 1, 1, 1, 1,
0.5718571, -1.560812, 3.121625, 0, 0, 1, 1, 1,
0.5725861, -0.9623323, 1.910552, 1, 0, 0, 1, 1,
0.5733265, 0.3679248, 1.323747, 1, 0, 0, 1, 1,
0.5747523, 0.6361014, 0.9641709, 1, 0, 0, 1, 1,
0.5758043, -0.8619496, 1.221923, 1, 0, 0, 1, 1,
0.5774092, 0.8069739, 0.2319627, 1, 0, 0, 1, 1,
0.5784684, 0.2955857, 0.9087182, 0, 0, 0, 1, 1,
0.5808987, -0.1956758, 3.303425, 0, 0, 0, 1, 1,
0.5813681, -0.8329813, 3.272802, 0, 0, 0, 1, 1,
0.5869089, -1.194748, 0.9919082, 0, 0, 0, 1, 1,
0.5870819, 0.9994805, 2.346944, 0, 0, 0, 1, 1,
0.5915433, 0.07067227, 0.7781325, 0, 0, 0, 1, 1,
0.5930075, -1.096347, 1.542634, 0, 0, 0, 1, 1,
0.5979731, -0.4643509, 3.389018, 1, 1, 1, 1, 1,
0.5991914, -0.7130017, 3.68779, 1, 1, 1, 1, 1,
0.6049107, 0.4440253, 3.106, 1, 1, 1, 1, 1,
0.6092156, -0.1041921, 1.92444, 1, 1, 1, 1, 1,
0.6234251, 2.036515, 0.1370484, 1, 1, 1, 1, 1,
0.6330161, 0.2479647, 0.9805943, 1, 1, 1, 1, 1,
0.6341696, -1.363558, 2.9571, 1, 1, 1, 1, 1,
0.6367202, -0.8113475, 1.854641, 1, 1, 1, 1, 1,
0.6380777, -1.109634, 1.84371, 1, 1, 1, 1, 1,
0.6383187, -0.5454443, 0.2997027, 1, 1, 1, 1, 1,
0.6416232, 0.3142399, 0.684462, 1, 1, 1, 1, 1,
0.6435224, -0.3716072, 2.463277, 1, 1, 1, 1, 1,
0.6464151, -0.5539157, 4.086004, 1, 1, 1, 1, 1,
0.6475948, 0.009883173, 2.586132, 1, 1, 1, 1, 1,
0.6482925, 1.586245, -0.8956168, 1, 1, 1, 1, 1,
0.6516405, 0.883766, 0.612538, 0, 0, 1, 1, 1,
0.6579193, -0.6962706, 1.865164, 1, 0, 0, 1, 1,
0.6582955, -2.079598, 3.01846, 1, 0, 0, 1, 1,
0.6643444, 1.188386, -0.5051838, 1, 0, 0, 1, 1,
0.6671847, -0.255491, 0.7181301, 1, 0, 0, 1, 1,
0.6683233, 0.1656031, 1.564195, 1, 0, 0, 1, 1,
0.6773652, 0.760836, 1.353276, 0, 0, 0, 1, 1,
0.6779096, -0.5451297, 1.48088, 0, 0, 0, 1, 1,
0.6849374, -0.5248321, 2.675472, 0, 0, 0, 1, 1,
0.6849609, 0.9977095, -0.08269022, 0, 0, 0, 1, 1,
0.700838, 2.352853, -1.894574, 0, 0, 0, 1, 1,
0.7022989, 1.13789, 1.256154, 0, 0, 0, 1, 1,
0.7027339, -0.8531913, 1.140597, 0, 0, 0, 1, 1,
0.7044614, -2.213169, 2.858234, 1, 1, 1, 1, 1,
0.7152395, -0.0676801, 3.656657, 1, 1, 1, 1, 1,
0.716, 0.7054691, 0.4339121, 1, 1, 1, 1, 1,
0.718068, -1.065, 3.484603, 1, 1, 1, 1, 1,
0.7222738, -1.439022, 4.293067, 1, 1, 1, 1, 1,
0.7240923, 1.167563, 1.501929, 1, 1, 1, 1, 1,
0.7333943, -0.7299035, 3.876555, 1, 1, 1, 1, 1,
0.7426462, -1.409369, 1.301916, 1, 1, 1, 1, 1,
0.7551864, 0.5198572, -0.0092393, 1, 1, 1, 1, 1,
0.7564946, 1.623278, 0.6874027, 1, 1, 1, 1, 1,
0.7579829, 0.9306447, 0.500663, 1, 1, 1, 1, 1,
0.7592217, 0.6178833, 0.5293878, 1, 1, 1, 1, 1,
0.7609019, -0.1193084, 2.260441, 1, 1, 1, 1, 1,
0.7662637, 0.2161566, 1.363765, 1, 1, 1, 1, 1,
0.7674491, -0.1934304, 1.046242, 1, 1, 1, 1, 1,
0.7689024, -0.09077112, 1.780909, 0, 0, 1, 1, 1,
0.7715343, -0.7468776, 1.669453, 1, 0, 0, 1, 1,
0.7787825, -0.4648542, 2.63217, 1, 0, 0, 1, 1,
0.7821944, -0.6354061, 1.931141, 1, 0, 0, 1, 1,
0.7822787, -1.052495, -0.06861318, 1, 0, 0, 1, 1,
0.7856035, -1.828753, 1.903836, 1, 0, 0, 1, 1,
0.7888497, 0.5847111, 1.030291, 0, 0, 0, 1, 1,
0.7907782, 1.262766, 0.6132945, 0, 0, 0, 1, 1,
0.7922469, -1.482431, 1.351684, 0, 0, 0, 1, 1,
0.7945872, 0.05664054, 0.9001284, 0, 0, 0, 1, 1,
0.7959624, -0.3741086, 1.993622, 0, 0, 0, 1, 1,
0.7973231, 0.8903557, 2.005507, 0, 0, 0, 1, 1,
0.7987498, -0.3937073, 2.302711, 0, 0, 0, 1, 1,
0.7990439, 0.8633775, 1.029859, 1, 1, 1, 1, 1,
0.8018702, 1.78686, -0.5441098, 1, 1, 1, 1, 1,
0.8023551, 0.1394752, -0.6165782, 1, 1, 1, 1, 1,
0.8128017, 0.6026255, 0.5235897, 1, 1, 1, 1, 1,
0.8165632, 2.083667, 0.4851036, 1, 1, 1, 1, 1,
0.8187112, 0.2897468, 2.710266, 1, 1, 1, 1, 1,
0.8201069, 1.355164, 0.2657821, 1, 1, 1, 1, 1,
0.8202315, -0.3899967, -0.1104746, 1, 1, 1, 1, 1,
0.8244093, -0.969162, 4.06961, 1, 1, 1, 1, 1,
0.8275582, 2.430818, -0.327303, 1, 1, 1, 1, 1,
0.8390166, -0.9014509, 2.177122, 1, 1, 1, 1, 1,
0.8489284, 0.452718, 1.316252, 1, 1, 1, 1, 1,
0.8493313, 0.3511815, 0.2352548, 1, 1, 1, 1, 1,
0.8590767, -0.1208018, 3.425675, 1, 1, 1, 1, 1,
0.8637705, -1.48203, 3.125128, 1, 1, 1, 1, 1,
0.8737887, 0.3925452, 1.351972, 0, 0, 1, 1, 1,
0.8739328, 1.098592, -0.7424825, 1, 0, 0, 1, 1,
0.8828644, -1.136394, 2.423265, 1, 0, 0, 1, 1,
0.8844866, -1.055481, 1.520945, 1, 0, 0, 1, 1,
0.8853511, -0.2826705, 2.570528, 1, 0, 0, 1, 1,
0.8856784, 0.397878, 1.5609, 1, 0, 0, 1, 1,
0.890855, -0.1346268, 1.584207, 0, 0, 0, 1, 1,
0.8990617, 1.117619, -0.03555358, 0, 0, 0, 1, 1,
0.8995755, 0.3704899, 2.793769, 0, 0, 0, 1, 1,
0.9032433, -0.6133698, 1.436729, 0, 0, 0, 1, 1,
0.9050784, 0.007967881, 2.804167, 0, 0, 0, 1, 1,
0.9062196, 0.4650866, 1.716862, 0, 0, 0, 1, 1,
0.9114804, 0.6722178, 1.302223, 0, 0, 0, 1, 1,
0.9118708, -0.2975307, 1.851845, 1, 1, 1, 1, 1,
0.9171755, -0.8345855, 1.905754, 1, 1, 1, 1, 1,
0.9201949, 1.266729, 1.029582, 1, 1, 1, 1, 1,
0.9202784, -0.5256797, 3.182232, 1, 1, 1, 1, 1,
0.9209474, 0.3711596, 1.450829, 1, 1, 1, 1, 1,
0.9244248, -0.8260863, 3.250453, 1, 1, 1, 1, 1,
0.924749, 0.06737821, 1.598402, 1, 1, 1, 1, 1,
0.9263736, -0.3631133, 1.630638, 1, 1, 1, 1, 1,
0.9273772, 1.204014, 1.006335, 1, 1, 1, 1, 1,
0.941258, 0.07515123, 0.5460253, 1, 1, 1, 1, 1,
0.9468867, 1.218457, 0.8001264, 1, 1, 1, 1, 1,
0.9477046, -0.649502, 2.152214, 1, 1, 1, 1, 1,
0.9544693, -0.6644508, 3.914572, 1, 1, 1, 1, 1,
0.9556037, -2.498247, 2.671348, 1, 1, 1, 1, 1,
0.9558238, 0.8761504, 0.03781597, 1, 1, 1, 1, 1,
0.9571629, -0.7554574, 2.968586, 0, 0, 1, 1, 1,
0.9641367, 0.4032032, -0.5325639, 1, 0, 0, 1, 1,
0.9650025, -0.3573732, 1.392569, 1, 0, 0, 1, 1,
0.9669452, -0.2825886, 2.50629, 1, 0, 0, 1, 1,
0.9673232, -0.1062463, 1.235955, 1, 0, 0, 1, 1,
0.9679952, 2.147824, 2.223695, 1, 0, 0, 1, 1,
0.9742793, -0.9672592, 3.982399, 0, 0, 0, 1, 1,
0.9808848, -0.6993765, 2.994267, 0, 0, 0, 1, 1,
0.9902961, -0.732187, 2.674957, 0, 0, 0, 1, 1,
0.9919764, 0.1112874, 2.327578, 0, 0, 0, 1, 1,
0.9924104, 0.1746143, 1.415467, 0, 0, 0, 1, 1,
0.9970888, -1.985347, 2.317532, 0, 0, 0, 1, 1,
1.002845, 1.333759, 2.193991, 0, 0, 0, 1, 1,
1.006061, 1.055018, 0.5922457, 1, 1, 1, 1, 1,
1.006068, -0.4709189, 1.620809, 1, 1, 1, 1, 1,
1.010497, -1.691043, 3.633698, 1, 1, 1, 1, 1,
1.011222, 0.3629821, 2.241159, 1, 1, 1, 1, 1,
1.018774, -0.1025733, 1.454087, 1, 1, 1, 1, 1,
1.020864, -0.004197266, 0.7442971, 1, 1, 1, 1, 1,
1.029149, -1.916018, 2.760342, 1, 1, 1, 1, 1,
1.033578, 0.1143057, 0.8078103, 1, 1, 1, 1, 1,
1.033764, 0.8139037, 1.303904, 1, 1, 1, 1, 1,
1.034033, 0.6277406, 0.9226372, 1, 1, 1, 1, 1,
1.037328, -1.090352, 2.356005, 1, 1, 1, 1, 1,
1.042087, 0.1087053, 0.7637003, 1, 1, 1, 1, 1,
1.045343, -1.053878, 2.910795, 1, 1, 1, 1, 1,
1.046949, 0.3659306, 2.620029, 1, 1, 1, 1, 1,
1.052683, -0.2851108, 1.870813, 1, 1, 1, 1, 1,
1.060343, -0.3533175, 0.9812997, 0, 0, 1, 1, 1,
1.060513, 0.1571756, 2.833505, 1, 0, 0, 1, 1,
1.066823, -0.431782, 1.302913, 1, 0, 0, 1, 1,
1.06963, 1.131248, 2.034372, 1, 0, 0, 1, 1,
1.072971, -0.001371571, -0.1395115, 1, 0, 0, 1, 1,
1.078109, 0.9498038, 0.2182826, 1, 0, 0, 1, 1,
1.085626, -0.6399606, 4.16255, 0, 0, 0, 1, 1,
1.085749, -0.4412956, 2.823542, 0, 0, 0, 1, 1,
1.098812, 1.123581, 2.52327, 0, 0, 0, 1, 1,
1.099837, 0.1263438, 1.435695, 0, 0, 0, 1, 1,
1.101975, -0.1909893, 3.229108, 0, 0, 0, 1, 1,
1.102732, -1.837178, 1.54319, 0, 0, 0, 1, 1,
1.107457, 1.167919, 0.9518158, 0, 0, 0, 1, 1,
1.122862, 0.06405316, 2.74481, 1, 1, 1, 1, 1,
1.124562, 0.1120145, 0.3673059, 1, 1, 1, 1, 1,
1.12676, 1.242452, -0.6271935, 1, 1, 1, 1, 1,
1.133304, -0.3172574, 2.315967, 1, 1, 1, 1, 1,
1.133324, -1.53933, 2.785831, 1, 1, 1, 1, 1,
1.139259, -1.160963, 0.5312045, 1, 1, 1, 1, 1,
1.14395, 0.9901241, 0.1628278, 1, 1, 1, 1, 1,
1.153379, -0.004891896, 2.845112, 1, 1, 1, 1, 1,
1.163293, 0.5947506, 1.395407, 1, 1, 1, 1, 1,
1.164816, 1.338511, 3.089342, 1, 1, 1, 1, 1,
1.167755, 0.805594, 1.253711, 1, 1, 1, 1, 1,
1.169526, -0.05868067, 1.498246, 1, 1, 1, 1, 1,
1.172918, 1.100784, 1.393888, 1, 1, 1, 1, 1,
1.173548, 0.4192682, 1.511388, 1, 1, 1, 1, 1,
1.174266, 0.1583249, 3.235858, 1, 1, 1, 1, 1,
1.193276, 1.014564, 1.445371, 0, 0, 1, 1, 1,
1.196607, -1.174855, 3.059885, 1, 0, 0, 1, 1,
1.199381, 0.9991984, -0.1004654, 1, 0, 0, 1, 1,
1.209488, 0.2042918, 3.382942, 1, 0, 0, 1, 1,
1.215287, -0.1127544, 3.016051, 1, 0, 0, 1, 1,
1.217132, 0.3801767, 2.428486, 1, 0, 0, 1, 1,
1.223202, -0.5927854, 2.719465, 0, 0, 0, 1, 1,
1.225893, 1.22315, 2.18239, 0, 0, 0, 1, 1,
1.231608, 0.205525, 2.092781, 0, 0, 0, 1, 1,
1.23433, 1.56127, 0.3927298, 0, 0, 0, 1, 1,
1.234904, 0.1263459, 0.9534857, 0, 0, 0, 1, 1,
1.23587, -0.2747551, 0.1139921, 0, 0, 0, 1, 1,
1.240492, -0.6152678, 2.041447, 0, 0, 0, 1, 1,
1.247562, 0.4107111, 3.862202, 1, 1, 1, 1, 1,
1.251905, -0.5521491, 1.660478, 1, 1, 1, 1, 1,
1.255355, -1.000593, 3.317905, 1, 1, 1, 1, 1,
1.264309, 0.1468493, 2.255219, 1, 1, 1, 1, 1,
1.281852, 0.9622413, 0.387551, 1, 1, 1, 1, 1,
1.286987, -0.6904161, 2.78645, 1, 1, 1, 1, 1,
1.292125, -0.07086159, 2.094773, 1, 1, 1, 1, 1,
1.293003, 1.21288, 0.8686487, 1, 1, 1, 1, 1,
1.301797, 0.6523151, 2.104424, 1, 1, 1, 1, 1,
1.303266, -0.4455844, 3.189392, 1, 1, 1, 1, 1,
1.323401, 0.810834, -0.4095369, 1, 1, 1, 1, 1,
1.33251, -0.09428192, 0.7538608, 1, 1, 1, 1, 1,
1.333276, -0.5632691, 1.600761, 1, 1, 1, 1, 1,
1.347158, -0.16028, 0.4629658, 1, 1, 1, 1, 1,
1.34737, -0.9660808, 3.410744, 1, 1, 1, 1, 1,
1.354926, 0.8158764, 3.215435, 0, 0, 1, 1, 1,
1.359073, 1.414788, 1.691494, 1, 0, 0, 1, 1,
1.394536, -1.246676, 0.4736931, 1, 0, 0, 1, 1,
1.408668, 0.4117276, 1.606266, 1, 0, 0, 1, 1,
1.409842, 0.1960503, 1.209149, 1, 0, 0, 1, 1,
1.421021, -0.4392999, 0.7911201, 1, 0, 0, 1, 1,
1.429416, 0.1642273, 1.405094, 0, 0, 0, 1, 1,
1.449686, -0.2011321, 0.1668391, 0, 0, 0, 1, 1,
1.450263, -0.535888, 3.639767, 0, 0, 0, 1, 1,
1.456064, 0.6174775, 0.805499, 0, 0, 0, 1, 1,
1.4639, 0.4283657, 2.913022, 0, 0, 0, 1, 1,
1.46858, -1.382209, 2.806646, 0, 0, 0, 1, 1,
1.470896, -0.9352466, 2.451433, 0, 0, 0, 1, 1,
1.48038, -0.1541563, 2.04634, 1, 1, 1, 1, 1,
1.494722, 0.008684227, 0.5207032, 1, 1, 1, 1, 1,
1.498746, -0.5040941, 1.261506, 1, 1, 1, 1, 1,
1.510163, 0.5825037, 0.9670603, 1, 1, 1, 1, 1,
1.517528, 0.2333295, 2.678689, 1, 1, 1, 1, 1,
1.518759, 1.269165, 1.047159, 1, 1, 1, 1, 1,
1.527155, -0.3734799, 2.7805, 1, 1, 1, 1, 1,
1.533655, -0.1160236, -0.08625919, 1, 1, 1, 1, 1,
1.534531, -0.1865459, 1.687242, 1, 1, 1, 1, 1,
1.534998, 1.026236, 0.7403412, 1, 1, 1, 1, 1,
1.536964, -0.3684164, 2.790616, 1, 1, 1, 1, 1,
1.537084, -1.212115, 1.716416, 1, 1, 1, 1, 1,
1.543176, 0.1656489, 0.867955, 1, 1, 1, 1, 1,
1.550888, -0.4692909, 5.208208, 1, 1, 1, 1, 1,
1.565212, -1.005242, 3.798942, 1, 1, 1, 1, 1,
1.618983, 0.4654351, 1.586813, 0, 0, 1, 1, 1,
1.62319, 1.644536, 1.26049, 1, 0, 0, 1, 1,
1.628642, 0.2184458, 1.5762, 1, 0, 0, 1, 1,
1.631402, -0.851052, 1.147835, 1, 0, 0, 1, 1,
1.635463, 0.7904257, 3.416043, 1, 0, 0, 1, 1,
1.647581, 0.1427771, 1.68071, 1, 0, 0, 1, 1,
1.647767, -0.03152794, 1.676638, 0, 0, 0, 1, 1,
1.670982, -0.9029503, 3.637402, 0, 0, 0, 1, 1,
1.671637, -0.7502674, 2.965654, 0, 0, 0, 1, 1,
1.687793, -0.7005024, 1.742123, 0, 0, 0, 1, 1,
1.690343, 0.5743936, -0.2561427, 0, 0, 0, 1, 1,
1.718943, 0.4664376, 1.808958, 0, 0, 0, 1, 1,
1.779311, 0.4034224, 0.08531908, 0, 0, 0, 1, 1,
1.81443, -1.279088, 2.047864, 1, 1, 1, 1, 1,
1.815266, -1.151434, 1.045386, 1, 1, 1, 1, 1,
1.817531, 0.7773759, 1.631549, 1, 1, 1, 1, 1,
1.820839, 0.7969309, -1.28741, 1, 1, 1, 1, 1,
1.843112, 0.4454855, 0.5742511, 1, 1, 1, 1, 1,
1.8699, 1.209932, 2.426798, 1, 1, 1, 1, 1,
1.887647, 1.733427, 0.6859223, 1, 1, 1, 1, 1,
1.901133, 0.216653, 2.595881, 1, 1, 1, 1, 1,
1.908672, -0.03586515, 0.4386185, 1, 1, 1, 1, 1,
1.91519, -0.2869119, 2.35222, 1, 1, 1, 1, 1,
1.917498, 0.1615761, 1.444102, 1, 1, 1, 1, 1,
1.930174, -0.2272508, 2.900108, 1, 1, 1, 1, 1,
1.930346, 1.042585, 1.622495, 1, 1, 1, 1, 1,
1.934655, 0.2814721, 0.4387583, 1, 1, 1, 1, 1,
1.939952, 0.6533237, 1.813303, 1, 1, 1, 1, 1,
1.946739, -1.289181, 1.179416, 0, 0, 1, 1, 1,
1.975479, -0.0919058, 0.8150277, 1, 0, 0, 1, 1,
1.98166, -0.07757215, 0.8372284, 1, 0, 0, 1, 1,
1.985687, 0.04167084, -0.4445901, 1, 0, 0, 1, 1,
1.987875, -1.347549, 1.287239, 1, 0, 0, 1, 1,
2.081388, -1.177536, 2.421885, 1, 0, 0, 1, 1,
2.083688, 2.65748, 0.2052523, 0, 0, 0, 1, 1,
2.122696, -0.5746799, 1.751334, 0, 0, 0, 1, 1,
2.133517, 0.2153308, -0.07710678, 0, 0, 0, 1, 1,
2.175746, -1.182034, 3.462959, 0, 0, 0, 1, 1,
2.211416, 0.03539487, -0.3586266, 0, 0, 0, 1, 1,
2.238461, 0.2679754, 0.5188692, 0, 0, 0, 1, 1,
2.329369, -0.6098418, 2.449597, 0, 0, 0, 1, 1,
2.371966, -1.667881, 0.2170533, 1, 1, 1, 1, 1,
2.390828, -1.93136, 1.993905, 1, 1, 1, 1, 1,
2.43457, 0.8899324, 1.763926, 1, 1, 1, 1, 1,
2.557991, -1.118755, 1.29461, 1, 1, 1, 1, 1,
2.604247, -0.5272002, 2.670957, 1, 1, 1, 1, 1,
2.646053, -0.7679347, 0.2810541, 1, 1, 1, 1, 1,
2.729958, -1.827811, 3.216285, 1, 1, 1, 1, 1
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
var radius = 9.212598;
var distance = 32.35886;
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
mvMatrix.translate( 0.2550769, 0.07119465, -0.0285871 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.35886);
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