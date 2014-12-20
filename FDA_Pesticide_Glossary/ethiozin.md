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
-2.887416, -0.7927091, -1.819529, 1, 0, 0, 1,
-2.832557, -0.06098541, -2.058326, 1, 0.007843138, 0, 1,
-2.814707, -0.8344485, -2.266036, 1, 0.01176471, 0, 1,
-2.744725, -0.8843397, -0.8443354, 1, 0.01960784, 0, 1,
-2.686454, 1.628028, -1.990087, 1, 0.02352941, 0, 1,
-2.646356, -0.7748751, -1.743686, 1, 0.03137255, 0, 1,
-2.638262, 0.4831161, -2.397781, 1, 0.03529412, 0, 1,
-2.504858, 2.162812, -1.300442, 1, 0.04313726, 0, 1,
-2.496869, 0.8339726, -0.01795885, 1, 0.04705882, 0, 1,
-2.481469, 0.6032146, -1.106815, 1, 0.05490196, 0, 1,
-2.42078, -1.222043, -3.191941, 1, 0.05882353, 0, 1,
-2.3278, -0.8247159, -1.344007, 1, 0.06666667, 0, 1,
-2.198758, 0.574662, -1.503521, 1, 0.07058824, 0, 1,
-2.145107, -0.2711586, -1.844722, 1, 0.07843138, 0, 1,
-2.140016, 0.6462484, -1.150805, 1, 0.08235294, 0, 1,
-2.132771, 0.8392366, -0.03425123, 1, 0.09019608, 0, 1,
-2.075492, -0.4794713, -2.195049, 1, 0.09411765, 0, 1,
-2.038301, -0.8617128, -1.768322, 1, 0.1019608, 0, 1,
-2.020413, -2.236211, -0.648527, 1, 0.1098039, 0, 1,
-1.999092, -0.5002047, -2.380655, 1, 0.1137255, 0, 1,
-1.98535, -1.363648, -2.033825, 1, 0.1215686, 0, 1,
-1.965853, 1.129353, -0.8833672, 1, 0.1254902, 0, 1,
-1.928247, -0.2608046, -0.5446125, 1, 0.1333333, 0, 1,
-1.91633, -1.309586, -4.371686, 1, 0.1372549, 0, 1,
-1.912937, -0.3466079, -1.159827, 1, 0.145098, 0, 1,
-1.909093, -1.370311, -2.557729, 1, 0.1490196, 0, 1,
-1.899907, 1.494027, 1.567241, 1, 0.1568628, 0, 1,
-1.893201, -0.384524, -2.985917, 1, 0.1607843, 0, 1,
-1.89071, -0.5036817, -0.1098617, 1, 0.1686275, 0, 1,
-1.858648, -0.1858484, -2.438607, 1, 0.172549, 0, 1,
-1.857724, -0.02746114, -3.160348, 1, 0.1803922, 0, 1,
-1.857453, 0.1660091, -2.307639, 1, 0.1843137, 0, 1,
-1.841516, -0.3125544, -0.5835656, 1, 0.1921569, 0, 1,
-1.824985, 1.90208, -0.3171544, 1, 0.1960784, 0, 1,
-1.804662, 0.64169, -1.696477, 1, 0.2039216, 0, 1,
-1.79918, -1.348023, -2.465058, 1, 0.2117647, 0, 1,
-1.763957, -2.302595, -2.259507, 1, 0.2156863, 0, 1,
-1.761528, -0.9525905, -3.452315, 1, 0.2235294, 0, 1,
-1.758863, 0.6236957, -0.2472307, 1, 0.227451, 0, 1,
-1.75789, -2.13779, -3.208105, 1, 0.2352941, 0, 1,
-1.718245, -0.3265658, -1.941376, 1, 0.2392157, 0, 1,
-1.714391, 0.7508135, -2.399488, 1, 0.2470588, 0, 1,
-1.711915, -1.068748, -3.640173, 1, 0.2509804, 0, 1,
-1.67472, 0.7249489, -1.607672, 1, 0.2588235, 0, 1,
-1.659814, 0.2535181, 0.9337003, 1, 0.2627451, 0, 1,
-1.655716, 0.2767158, -2.52459, 1, 0.2705882, 0, 1,
-1.629278, -0.1535357, -0.5868587, 1, 0.2745098, 0, 1,
-1.628622, -0.4305215, -2.921147, 1, 0.282353, 0, 1,
-1.619913, 0.08834925, -1.104131, 1, 0.2862745, 0, 1,
-1.608732, 1.153297, -1.800552, 1, 0.2941177, 0, 1,
-1.597678, -1.111692, -1.269512, 1, 0.3019608, 0, 1,
-1.593564, 0.3610082, -2.722317, 1, 0.3058824, 0, 1,
-1.572739, -1.583948, -2.142824, 1, 0.3137255, 0, 1,
-1.57139, -0.5851109, -2.816493, 1, 0.3176471, 0, 1,
-1.563836, -1.958722, -3.291036, 1, 0.3254902, 0, 1,
-1.563256, 1.751218, -2.487006, 1, 0.3294118, 0, 1,
-1.559001, 0.3660129, 0.2776611, 1, 0.3372549, 0, 1,
-1.549394, -0.7787596, -1.84859, 1, 0.3411765, 0, 1,
-1.519781, -1.701131, -2.557729, 1, 0.3490196, 0, 1,
-1.516536, -1.420381, -3.690966, 1, 0.3529412, 0, 1,
-1.509723, 1.98217, -1.782787, 1, 0.3607843, 0, 1,
-1.508682, -0.2989429, -5.077772, 1, 0.3647059, 0, 1,
-1.501681, -1.380199, -3.785039, 1, 0.372549, 0, 1,
-1.49949, -0.7440309, -1.135564, 1, 0.3764706, 0, 1,
-1.495289, -0.9014117, -2.477875, 1, 0.3843137, 0, 1,
-1.48593, 0.3382097, 0.1295142, 1, 0.3882353, 0, 1,
-1.485634, 0.4842422, -2.47964, 1, 0.3960784, 0, 1,
-1.480283, -0.02035186, -2.210021, 1, 0.4039216, 0, 1,
-1.468672, -0.7844643, -1.556099, 1, 0.4078431, 0, 1,
-1.460063, 0.01609474, -1.433839, 1, 0.4156863, 0, 1,
-1.454685, 1.290357, -0.78764, 1, 0.4196078, 0, 1,
-1.454208, -0.5245299, -2.06352, 1, 0.427451, 0, 1,
-1.450906, 1.571493, -1.570326, 1, 0.4313726, 0, 1,
-1.44672, 0.955487, -1.685144, 1, 0.4392157, 0, 1,
-1.446543, 1.59797, -1.861555, 1, 0.4431373, 0, 1,
-1.443852, -0.7109013, -3.102753, 1, 0.4509804, 0, 1,
-1.433794, 0.6617196, -2.314353, 1, 0.454902, 0, 1,
-1.420883, 0.3854494, -1.395353, 1, 0.4627451, 0, 1,
-1.387876, -1.585416, -2.679348, 1, 0.4666667, 0, 1,
-1.38389, -0.1555578, -3.113697, 1, 0.4745098, 0, 1,
-1.383805, 1.556716, 0.3491089, 1, 0.4784314, 0, 1,
-1.371659, 0.7981896, -0.8414857, 1, 0.4862745, 0, 1,
-1.35742, 1.585588, -1.102481, 1, 0.4901961, 0, 1,
-1.347209, 0.5822312, -2.3275, 1, 0.4980392, 0, 1,
-1.343943, 1.461288, -0.3392068, 1, 0.5058824, 0, 1,
-1.339613, 0.4843431, -0.395831, 1, 0.509804, 0, 1,
-1.336802, 0.7962505, 0.06324726, 1, 0.5176471, 0, 1,
-1.336404, -0.7012565, -2.008209, 1, 0.5215687, 0, 1,
-1.335469, 2.072065, -1.179896, 1, 0.5294118, 0, 1,
-1.33226, -1.080584, -2.342656, 1, 0.5333334, 0, 1,
-1.328606, -1.323798, -2.524058, 1, 0.5411765, 0, 1,
-1.322722, 0.1560497, -1.024344, 1, 0.5450981, 0, 1,
-1.298691, 0.3442654, -1.458006, 1, 0.5529412, 0, 1,
-1.298255, -0.149488, -0.8770937, 1, 0.5568628, 0, 1,
-1.296501, 0.4285817, -1.373505, 1, 0.5647059, 0, 1,
-1.294163, 1.085373, -0.1714288, 1, 0.5686275, 0, 1,
-1.289371, -0.4983183, -2.78372, 1, 0.5764706, 0, 1,
-1.288151, -0.644409, -2.467618, 1, 0.5803922, 0, 1,
-1.28797, 1.065948, -2.556186, 1, 0.5882353, 0, 1,
-1.287894, 0.3532614, -0.2713507, 1, 0.5921569, 0, 1,
-1.282749, -0.2670759, -2.474563, 1, 0.6, 0, 1,
-1.267187, -0.1630008, -1.296265, 1, 0.6078432, 0, 1,
-1.262424, -1.899303, -2.314652, 1, 0.6117647, 0, 1,
-1.253469, -0.3086667, -2.140825, 1, 0.6196079, 0, 1,
-1.239711, 1.582878, -0.5423476, 1, 0.6235294, 0, 1,
-1.23931, 0.2421375, -1.474684, 1, 0.6313726, 0, 1,
-1.234091, 0.3600487, -0.8108878, 1, 0.6352941, 0, 1,
-1.22898, -0.3727841, -1.454856, 1, 0.6431373, 0, 1,
-1.225716, -0.3368675, -0.8980231, 1, 0.6470588, 0, 1,
-1.223358, 0.6025261, -1.236144, 1, 0.654902, 0, 1,
-1.220291, 0.4524327, -1.528307, 1, 0.6588235, 0, 1,
-1.214693, -1.418757, -1.246686, 1, 0.6666667, 0, 1,
-1.214126, -0.08524314, -2.049939, 1, 0.6705883, 0, 1,
-1.214097, -0.6526765, -0.881421, 1, 0.6784314, 0, 1,
-1.212552, 1.523702, -1.180657, 1, 0.682353, 0, 1,
-1.202058, -1.774737, -3.870482, 1, 0.6901961, 0, 1,
-1.199036, -0.2676757, -2.872129, 1, 0.6941177, 0, 1,
-1.188669, -0.4349545, -1.636187, 1, 0.7019608, 0, 1,
-1.177796, -0.1471993, -0.9268913, 1, 0.7098039, 0, 1,
-1.176997, 0.287539, -1.173406, 1, 0.7137255, 0, 1,
-1.175133, -0.8189762, -0.5735912, 1, 0.7215686, 0, 1,
-1.173242, -0.1470546, -2.979689, 1, 0.7254902, 0, 1,
-1.171365, -0.2739486, -1.95522, 1, 0.7333333, 0, 1,
-1.16704, -0.2478893, -1.822579, 1, 0.7372549, 0, 1,
-1.16142, 0.9507987, -1.488898, 1, 0.7450981, 0, 1,
-1.152018, 0.9323137, -0.5055767, 1, 0.7490196, 0, 1,
-1.135763, 0.3407134, -0.6390516, 1, 0.7568628, 0, 1,
-1.118038, 0.6309532, 0.189013, 1, 0.7607843, 0, 1,
-1.11288, -0.01750611, -1.167194, 1, 0.7686275, 0, 1,
-1.091946, -0.4438436, -2.357424, 1, 0.772549, 0, 1,
-1.088346, 0.8857098, -2.069827, 1, 0.7803922, 0, 1,
-1.086548, -0.4930949, -2.613465, 1, 0.7843137, 0, 1,
-1.08307, 1.184827, -1.490546, 1, 0.7921569, 0, 1,
-1.082631, -0.2012556, -1.512981, 1, 0.7960784, 0, 1,
-1.079962, -1.173274, -2.576004, 1, 0.8039216, 0, 1,
-1.077306, 1.750669, 0.9784764, 1, 0.8117647, 0, 1,
-1.069781, 0.942742, -1.673804, 1, 0.8156863, 0, 1,
-1.065967, -0.4483956, -1.378447, 1, 0.8235294, 0, 1,
-1.062162, 1.129561, -2.430983, 1, 0.827451, 0, 1,
-1.059981, -0.004859147, -2.213384, 1, 0.8352941, 0, 1,
-1.055058, 1.05509, -1.140436, 1, 0.8392157, 0, 1,
-1.046445, -1.273357, -0.8335354, 1, 0.8470588, 0, 1,
-1.046242, 0.07048139, -1.942494, 1, 0.8509804, 0, 1,
-1.040175, -1.061474, -2.448972, 1, 0.8588235, 0, 1,
-1.037812, 1.298234, -0.3771494, 1, 0.8627451, 0, 1,
-1.035066, 0.9242653, 0.06657188, 1, 0.8705882, 0, 1,
-1.031099, -0.221217, -0.3897174, 1, 0.8745098, 0, 1,
-1.027848, 0.2561692, -3.712889, 1, 0.8823529, 0, 1,
-1.02642, 0.7803735, -1.121012, 1, 0.8862745, 0, 1,
-1.026279, 0.8122412, -2.221986, 1, 0.8941177, 0, 1,
-1.019237, 0.6587574, -1.781103, 1, 0.8980392, 0, 1,
-1.012013, 0.2122729, -0.1356932, 1, 0.9058824, 0, 1,
-1.011252, 0.01034031, -1.136109, 1, 0.9137255, 0, 1,
-1.009451, -0.5356405, -0.9178354, 1, 0.9176471, 0, 1,
-1.007836, -0.4935135, -2.415508, 1, 0.9254902, 0, 1,
-1.004854, 0.7464681, -1.307852, 1, 0.9294118, 0, 1,
-0.9963666, 0.2499324, -1.178906, 1, 0.9372549, 0, 1,
-0.9922013, 0.7790495, -0.9721248, 1, 0.9411765, 0, 1,
-0.9921435, 0.7356704, -0.4018396, 1, 0.9490196, 0, 1,
-0.9892377, -2.11351, -1.808816, 1, 0.9529412, 0, 1,
-0.9877713, 0.1039061, -1.068431, 1, 0.9607843, 0, 1,
-0.9831404, -0.88199, -2.471526, 1, 0.9647059, 0, 1,
-0.9744182, -2.154088, -3.516677, 1, 0.972549, 0, 1,
-0.9736234, -1.559875, -4.177033, 1, 0.9764706, 0, 1,
-0.9716182, 1.045105, 0.5449671, 1, 0.9843137, 0, 1,
-0.9706239, 0.7170885, -1.761849, 1, 0.9882353, 0, 1,
-0.9648046, 1.338635, -0.1299525, 1, 0.9960784, 0, 1,
-0.9642981, 0.8995534, -0.3232887, 0.9960784, 1, 0, 1,
-0.9632989, 0.7502294, -1.637698, 0.9921569, 1, 0, 1,
-0.9594955, 1.125593, -0.04911388, 0.9843137, 1, 0, 1,
-0.9553586, -1.014889, -2.524474, 0.9803922, 1, 0, 1,
-0.9528994, -0.6499082, -1.871842, 0.972549, 1, 0, 1,
-0.9527466, -0.9410551, -3.403781, 0.9686275, 1, 0, 1,
-0.9475634, 0.1202321, -0.7296553, 0.9607843, 1, 0, 1,
-0.944743, 0.05944388, -1.380364, 0.9568627, 1, 0, 1,
-0.9445741, -0.6913632, -2.610243, 0.9490196, 1, 0, 1,
-0.9316454, 1.304039, -2.691286, 0.945098, 1, 0, 1,
-0.931065, 0.3728795, -1.503166, 0.9372549, 1, 0, 1,
-0.925786, 0.05941453, 0.3703659, 0.9333333, 1, 0, 1,
-0.9175187, -0.3540748, -2.224908, 0.9254902, 1, 0, 1,
-0.9171344, 0.8717769, -0.6285563, 0.9215686, 1, 0, 1,
-0.9103527, 0.6585184, -4.082385, 0.9137255, 1, 0, 1,
-0.9082514, -0.3802519, -0.2912931, 0.9098039, 1, 0, 1,
-0.9063684, -0.6855125, -2.724525, 0.9019608, 1, 0, 1,
-0.9043145, -0.5209875, -3.848921, 0.8941177, 1, 0, 1,
-0.9042547, -0.2682645, -2.170331, 0.8901961, 1, 0, 1,
-0.9026182, -0.3952398, -1.512074, 0.8823529, 1, 0, 1,
-0.8996277, -1.171932, -5.026013, 0.8784314, 1, 0, 1,
-0.8931326, 0.4253574, -0.8518619, 0.8705882, 1, 0, 1,
-0.8851192, 2.36601, -1.348291, 0.8666667, 1, 0, 1,
-0.8838897, -0.02144415, -1.703939, 0.8588235, 1, 0, 1,
-0.8837475, 1.322413, -0.02878439, 0.854902, 1, 0, 1,
-0.8834976, 0.8309987, 1.989294, 0.8470588, 1, 0, 1,
-0.8769931, -1.74613, -2.433949, 0.8431373, 1, 0, 1,
-0.876635, 2.778423, -1.171755, 0.8352941, 1, 0, 1,
-0.8734025, 0.03462849, -1.473344, 0.8313726, 1, 0, 1,
-0.8678293, -0.4083843, -1.984522, 0.8235294, 1, 0, 1,
-0.8625364, -0.5846882, -2.343286, 0.8196079, 1, 0, 1,
-0.8612142, -0.6918042, -2.500651, 0.8117647, 1, 0, 1,
-0.8536656, -0.3921501, -1.969824, 0.8078431, 1, 0, 1,
-0.8443975, -1.574897, -1.707263, 0.8, 1, 0, 1,
-0.8395765, 1.443917, -0.5757303, 0.7921569, 1, 0, 1,
-0.8337661, 0.08641343, -0.7095253, 0.7882353, 1, 0, 1,
-0.8335972, -1.054613, -4.62037, 0.7803922, 1, 0, 1,
-0.8299685, -0.1684652, -2.326079, 0.7764706, 1, 0, 1,
-0.8298638, 0.7141712, -0.3917034, 0.7686275, 1, 0, 1,
-0.829734, -1.327402, -2.989357, 0.7647059, 1, 0, 1,
-0.8243359, -1.967196, -2.860063, 0.7568628, 1, 0, 1,
-0.8224296, -0.7063629, -1.525671, 0.7529412, 1, 0, 1,
-0.8151871, 1.042444, -0.7038767, 0.7450981, 1, 0, 1,
-0.8136883, 1.656139, 1.383714, 0.7411765, 1, 0, 1,
-0.8093481, 0.724026, 0.02616535, 0.7333333, 1, 0, 1,
-0.7980433, 0.7601397, -1.789362, 0.7294118, 1, 0, 1,
-0.7978233, 2.261088, 0.07759699, 0.7215686, 1, 0, 1,
-0.7961714, -0.9336767, -1.456543, 0.7176471, 1, 0, 1,
-0.7958673, 0.105744, -0.5798777, 0.7098039, 1, 0, 1,
-0.794144, 0.7578071, -0.7034277, 0.7058824, 1, 0, 1,
-0.7926653, 0.3249507, -1.028879, 0.6980392, 1, 0, 1,
-0.7923736, -1.42007, -2.509323, 0.6901961, 1, 0, 1,
-0.7920832, -0.3800759, -5.161961, 0.6862745, 1, 0, 1,
-0.7917861, -1.019455, -1.606269, 0.6784314, 1, 0, 1,
-0.7838072, -0.4886015, -2.305476, 0.6745098, 1, 0, 1,
-0.7820109, -1.027517, -0.3504252, 0.6666667, 1, 0, 1,
-0.7690797, -0.08251053, -1.031623, 0.6627451, 1, 0, 1,
-0.7665174, -0.2635138, -1.829545, 0.654902, 1, 0, 1,
-0.7484924, 1.807206, 0.5831175, 0.6509804, 1, 0, 1,
-0.7458876, -1.428416, -4.391056, 0.6431373, 1, 0, 1,
-0.7387499, 0.07321036, -1.945717, 0.6392157, 1, 0, 1,
-0.7382718, 1.283111, -0.8371237, 0.6313726, 1, 0, 1,
-0.7375951, -1.077293, -1.016597, 0.627451, 1, 0, 1,
-0.7363101, 1.075354, -0.8909183, 0.6196079, 1, 0, 1,
-0.729166, 0.5117221, -1.767705, 0.6156863, 1, 0, 1,
-0.7287781, -0.05654984, -2.299267, 0.6078432, 1, 0, 1,
-0.722235, 0.7122269, -0.4342689, 0.6039216, 1, 0, 1,
-0.7193037, 0.09844839, -2.544637, 0.5960785, 1, 0, 1,
-0.7184523, 0.2853153, -0.8650046, 0.5882353, 1, 0, 1,
-0.7164031, -1.52246, -3.066417, 0.5843138, 1, 0, 1,
-0.7154254, 1.193286, 1.018412, 0.5764706, 1, 0, 1,
-0.7103775, -0.8805863, -2.769554, 0.572549, 1, 0, 1,
-0.7031847, 0.133804, -1.461694, 0.5647059, 1, 0, 1,
-0.7027628, 0.5589753, -1.714231, 0.5607843, 1, 0, 1,
-0.6957337, 0.08036494, -2.144706, 0.5529412, 1, 0, 1,
-0.6890475, -0.2212521, -2.052903, 0.5490196, 1, 0, 1,
-0.6837643, -0.4740659, -1.497517, 0.5411765, 1, 0, 1,
-0.6832193, -1.484937, -5.217819, 0.5372549, 1, 0, 1,
-0.6828193, 0.5277819, 0.6323882, 0.5294118, 1, 0, 1,
-0.682065, -0.3117272, -2.155657, 0.5254902, 1, 0, 1,
-0.6811342, -0.9197773, -4.171686, 0.5176471, 1, 0, 1,
-0.6779466, 0.2065211, -0.1030775, 0.5137255, 1, 0, 1,
-0.677911, 1.216289, -0.2799133, 0.5058824, 1, 0, 1,
-0.6753782, 0.07173465, -2.940361, 0.5019608, 1, 0, 1,
-0.6748768, 0.4851834, 0.7425373, 0.4941176, 1, 0, 1,
-0.6732063, -0.8148769, -1.377095, 0.4862745, 1, 0, 1,
-0.6726276, 0.07440592, -0.9129786, 0.4823529, 1, 0, 1,
-0.672618, -1.670247, -2.187255, 0.4745098, 1, 0, 1,
-0.6685144, 0.5759894, 1.235953, 0.4705882, 1, 0, 1,
-0.6497694, 0.4069084, -0.8541986, 0.4627451, 1, 0, 1,
-0.6492792, -0.2882525, -1.201288, 0.4588235, 1, 0, 1,
-0.6443438, -0.6612923, -2.233764, 0.4509804, 1, 0, 1,
-0.6430529, 1.012871, -0.5796752, 0.4470588, 1, 0, 1,
-0.6423, 0.8139234, 1.58272, 0.4392157, 1, 0, 1,
-0.6420717, 1.943764, -0.5949345, 0.4352941, 1, 0, 1,
-0.6403209, 0.1736333, -0.5687391, 0.427451, 1, 0, 1,
-0.6360588, 0.4860234, 0.7759101, 0.4235294, 1, 0, 1,
-0.6254088, 0.6403534, -0.4471287, 0.4156863, 1, 0, 1,
-0.6101193, 0.02927816, -1.192119, 0.4117647, 1, 0, 1,
-0.6093212, -0.7522318, -3.678612, 0.4039216, 1, 0, 1,
-0.6048597, 0.8341591, -1.259517, 0.3960784, 1, 0, 1,
-0.5981221, 0.4230089, -0.3723961, 0.3921569, 1, 0, 1,
-0.5949808, 0.4870253, -0.3494648, 0.3843137, 1, 0, 1,
-0.5892273, -1.060837, -2.482136, 0.3803922, 1, 0, 1,
-0.5883336, -1.015407, -1.931026, 0.372549, 1, 0, 1,
-0.5772628, -2.233008, -2.336716, 0.3686275, 1, 0, 1,
-0.5769861, -0.9647714, -0.6800756, 0.3607843, 1, 0, 1,
-0.5711935, -0.5978692, -2.560248, 0.3568628, 1, 0, 1,
-0.5703104, -1.677219, -3.892862, 0.3490196, 1, 0, 1,
-0.5679235, 0.5786078, -2.311298, 0.345098, 1, 0, 1,
-0.5648723, -2.484255, -3.802336, 0.3372549, 1, 0, 1,
-0.5635604, 0.1197119, -2.218362, 0.3333333, 1, 0, 1,
-0.5594023, 0.2971754, -0.6821454, 0.3254902, 1, 0, 1,
-0.5591658, 1.217985, -0.1482389, 0.3215686, 1, 0, 1,
-0.5538496, -0.8038774, -2.491641, 0.3137255, 1, 0, 1,
-0.5516282, 0.6966305, -0.07246721, 0.3098039, 1, 0, 1,
-0.5507271, -0.7746441, -0.9699786, 0.3019608, 1, 0, 1,
-0.5454307, -0.3256151, -0.9574159, 0.2941177, 1, 0, 1,
-0.5453301, 1.263014, -0.3083263, 0.2901961, 1, 0, 1,
-0.5447299, 1.492211, -0.07937535, 0.282353, 1, 0, 1,
-0.5441676, 1.285879, -1.231477, 0.2784314, 1, 0, 1,
-0.543961, -0.4281935, 0.1108976, 0.2705882, 1, 0, 1,
-0.5417166, 1.651619, -0.5182873, 0.2666667, 1, 0, 1,
-0.5366053, -1.985724, -3.229145, 0.2588235, 1, 0, 1,
-0.5278888, 1.354082, 0.4318576, 0.254902, 1, 0, 1,
-0.5271112, -2.371914, -2.746137, 0.2470588, 1, 0, 1,
-0.5263278, 0.0613068, -2.039089, 0.2431373, 1, 0, 1,
-0.5260433, -0.126312, -3.450013, 0.2352941, 1, 0, 1,
-0.5245288, 0.3108805, -0.605036, 0.2313726, 1, 0, 1,
-0.5182821, 0.5037552, -0.952202, 0.2235294, 1, 0, 1,
-0.5159726, 0.4059246, -0.8070729, 0.2196078, 1, 0, 1,
-0.5151145, 1.072909, -1.54266, 0.2117647, 1, 0, 1,
-0.5103924, -1.015764, -3.985147, 0.2078431, 1, 0, 1,
-0.5098097, 1.061504, -2.149278, 0.2, 1, 0, 1,
-0.5073636, -0.5434721, -3.567311, 0.1921569, 1, 0, 1,
-0.5071691, -0.5091743, -1.649252, 0.1882353, 1, 0, 1,
-0.5030092, -1.714621, -2.278131, 0.1803922, 1, 0, 1,
-0.4990596, 1.618545, -0.8643994, 0.1764706, 1, 0, 1,
-0.4982396, 0.3862887, -0.2612838, 0.1686275, 1, 0, 1,
-0.4951066, 0.242066, -2.066711, 0.1647059, 1, 0, 1,
-0.4920572, 0.3781457, -0.5798687, 0.1568628, 1, 0, 1,
-0.4916135, -2.102773, -2.640524, 0.1529412, 1, 0, 1,
-0.4911231, 1.358331, -0.919514, 0.145098, 1, 0, 1,
-0.4900808, 0.02058973, -2.059719, 0.1411765, 1, 0, 1,
-0.4889214, -0.05846187, -1.738814, 0.1333333, 1, 0, 1,
-0.4871094, -1.885556, -3.072954, 0.1294118, 1, 0, 1,
-0.4861239, -0.3309803, -1.676045, 0.1215686, 1, 0, 1,
-0.4844947, -0.6390851, -2.820982, 0.1176471, 1, 0, 1,
-0.48399, -0.9415378, -2.930432, 0.1098039, 1, 0, 1,
-0.4795561, 0.3509254, 0.1297194, 0.1058824, 1, 0, 1,
-0.4774729, -1.146295, -0.4600666, 0.09803922, 1, 0, 1,
-0.4750727, -0.7913361, -2.699378, 0.09019608, 1, 0, 1,
-0.4744017, -0.3992033, -3.747059, 0.08627451, 1, 0, 1,
-0.4742028, -1.827592, -3.441258, 0.07843138, 1, 0, 1,
-0.467535, -0.9585893, -4.628855, 0.07450981, 1, 0, 1,
-0.4602215, -0.046437, -0.5776424, 0.06666667, 1, 0, 1,
-0.4599645, 1.402858, -1.218692, 0.0627451, 1, 0, 1,
-0.4547846, -1.022673, -1.569815, 0.05490196, 1, 0, 1,
-0.451763, 0.1768062, -3.151927, 0.05098039, 1, 0, 1,
-0.4512049, 0.3359465, -0.9619421, 0.04313726, 1, 0, 1,
-0.4470841, -1.707028, -2.5863, 0.03921569, 1, 0, 1,
-0.446395, -1.454349, -3.672364, 0.03137255, 1, 0, 1,
-0.4462199, 0.01054385, -2.547973, 0.02745098, 1, 0, 1,
-0.4427926, -1.559567, -1.595132, 0.01960784, 1, 0, 1,
-0.4374194, -0.9732823, -2.580294, 0.01568628, 1, 0, 1,
-0.4361393, 0.5388783, -0.4598403, 0.007843138, 1, 0, 1,
-0.4356959, -0.1528921, -4.103173, 0.003921569, 1, 0, 1,
-0.4354592, 1.025477, -2.523245, 0, 1, 0.003921569, 1,
-0.4342769, 0.2279444, -3.418949, 0, 1, 0.01176471, 1,
-0.4323726, 2.287494, 0.3644873, 0, 1, 0.01568628, 1,
-0.432099, -0.2974478, -2.427193, 0, 1, 0.02352941, 1,
-0.4288542, 1.080113, 2.017561, 0, 1, 0.02745098, 1,
-0.4265656, 0.3341973, -1.420942, 0, 1, 0.03529412, 1,
-0.4248258, 0.9633642, 0.4551391, 0, 1, 0.03921569, 1,
-0.4232405, -0.7890557, -3.996543, 0, 1, 0.04705882, 1,
-0.4226073, 1.547048, -0.02602386, 0, 1, 0.05098039, 1,
-0.4220514, -0.5274668, -3.206413, 0, 1, 0.05882353, 1,
-0.421906, -0.3211674, -1.741744, 0, 1, 0.0627451, 1,
-0.4154988, -1.150164, -1.99291, 0, 1, 0.07058824, 1,
-0.4128769, 1.359627, -0.0507374, 0, 1, 0.07450981, 1,
-0.4094263, 1.39488, 0.8396299, 0, 1, 0.08235294, 1,
-0.409312, -0.132712, -1.932449, 0, 1, 0.08627451, 1,
-0.4020998, -0.5496296, -2.41237, 0, 1, 0.09411765, 1,
-0.4011887, 0.1391064, -1.377029, 0, 1, 0.1019608, 1,
-0.4005392, -1.113282, -3.222164, 0, 1, 0.1058824, 1,
-0.3974807, 0.1724122, -0.9069883, 0, 1, 0.1137255, 1,
-0.396264, 0.5220216, -1.222479, 0, 1, 0.1176471, 1,
-0.3896273, -0.9321074, -2.774429, 0, 1, 0.1254902, 1,
-0.3891393, -1.544036, -3.436339, 0, 1, 0.1294118, 1,
-0.3853315, 1.258981, 1.414821, 0, 1, 0.1372549, 1,
-0.3762985, 0.6607748, 0.7197746, 0, 1, 0.1411765, 1,
-0.3677246, -0.7830662, -4.26854, 0, 1, 0.1490196, 1,
-0.359734, -0.1617028, -2.797258, 0, 1, 0.1529412, 1,
-0.3547374, -1.902976, -1.601956, 0, 1, 0.1607843, 1,
-0.351049, 0.6670712, 1.429909, 0, 1, 0.1647059, 1,
-0.3427089, 0.1178402, -2.56256, 0, 1, 0.172549, 1,
-0.3391936, 1.654027, 0.350126, 0, 1, 0.1764706, 1,
-0.3355955, 1.368828, -0.4587255, 0, 1, 0.1843137, 1,
-0.3337582, -0.755357, -3.148138, 0, 1, 0.1882353, 1,
-0.3316842, -1.237043, -3.164068, 0, 1, 0.1960784, 1,
-0.3301468, 0.2175551, -1.29021, 0, 1, 0.2039216, 1,
-0.3274137, 1.202563, -0.6435366, 0, 1, 0.2078431, 1,
-0.3264215, 0.08860306, -1.522552, 0, 1, 0.2156863, 1,
-0.3258495, -1.830678, -4.138591, 0, 1, 0.2196078, 1,
-0.3234322, -0.1640868, -3.045914, 0, 1, 0.227451, 1,
-0.3233694, -1.503432, -3.05685, 0, 1, 0.2313726, 1,
-0.3201672, 1.326088, -0.2587301, 0, 1, 0.2392157, 1,
-0.3163182, -0.5300168, -2.229204, 0, 1, 0.2431373, 1,
-0.3114257, -0.5510458, -2.572567, 0, 1, 0.2509804, 1,
-0.3085465, -0.150747, 0.5309671, 0, 1, 0.254902, 1,
-0.3070543, -2.032788, -3.17286, 0, 1, 0.2627451, 1,
-0.2966247, -1.814973, -4.890089, 0, 1, 0.2666667, 1,
-0.2946338, 0.5735438, -0.8360429, 0, 1, 0.2745098, 1,
-0.2944984, -0.01434261, -2.289495, 0, 1, 0.2784314, 1,
-0.2935253, -0.8785077, -2.8904, 0, 1, 0.2862745, 1,
-0.2930794, -0.3283101, -1.905574, 0, 1, 0.2901961, 1,
-0.2909777, -0.161301, -3.409328, 0, 1, 0.2980392, 1,
-0.2899747, 0.002829844, -1.198737, 0, 1, 0.3058824, 1,
-0.288349, 1.545471, 0.4749846, 0, 1, 0.3098039, 1,
-0.2880878, -0.07722925, -0.9438976, 0, 1, 0.3176471, 1,
-0.2830994, -0.02759335, -2.078443, 0, 1, 0.3215686, 1,
-0.2814836, -0.3360034, -2.497559, 0, 1, 0.3294118, 1,
-0.2805791, -0.6695349, -2.556972, 0, 1, 0.3333333, 1,
-0.2771684, 0.9909867, -0.4658519, 0, 1, 0.3411765, 1,
-0.2759024, -1.370166, -4.076174, 0, 1, 0.345098, 1,
-0.2747877, -0.1153172, -2.014847, 0, 1, 0.3529412, 1,
-0.273131, 1.333906, 0.3312344, 0, 1, 0.3568628, 1,
-0.2730782, 1.952358, 0.4414838, 0, 1, 0.3647059, 1,
-0.2703765, 0.2000659, -1.574775, 0, 1, 0.3686275, 1,
-0.2696168, -0.1578477, -1.844601, 0, 1, 0.3764706, 1,
-0.257638, 0.3677469, -1.66002, 0, 1, 0.3803922, 1,
-0.2532087, 0.1217982, 0.04187702, 0, 1, 0.3882353, 1,
-0.2531388, 2.438596, -1.005315, 0, 1, 0.3921569, 1,
-0.2420314, 1.824699, 0.1832314, 0, 1, 0.4, 1,
-0.2402185, 0.8492402, 0.468797, 0, 1, 0.4078431, 1,
-0.2383686, 0.2156662, -1.849508, 0, 1, 0.4117647, 1,
-0.2380905, 0.04833028, -0.9766784, 0, 1, 0.4196078, 1,
-0.2370769, -1.174439, -3.319462, 0, 1, 0.4235294, 1,
-0.2332265, -1.202645, -4.926204, 0, 1, 0.4313726, 1,
-0.2320867, 0.3791995, -0.1280536, 0, 1, 0.4352941, 1,
-0.2235044, -0.2427673, -2.837945, 0, 1, 0.4431373, 1,
-0.223042, 0.07331245, -0.6973944, 0, 1, 0.4470588, 1,
-0.2204208, -0.5443641, -1.543901, 0, 1, 0.454902, 1,
-0.2183664, 0.2751903, -0.6459637, 0, 1, 0.4588235, 1,
-0.2118969, -0.04657595, -1.038172, 0, 1, 0.4666667, 1,
-0.2104153, 0.6958508, 1.605721, 0, 1, 0.4705882, 1,
-0.210201, 0.01340863, -1.296997, 0, 1, 0.4784314, 1,
-0.2079029, -1.441725, -3.054411, 0, 1, 0.4823529, 1,
-0.205324, 0.2876139, -1.123631, 0, 1, 0.4901961, 1,
-0.2047853, -0.4364183, -3.385551, 0, 1, 0.4941176, 1,
-0.2040277, -0.2509605, -2.200505, 0, 1, 0.5019608, 1,
-0.2034866, 0.2070079, 0.6943218, 0, 1, 0.509804, 1,
-0.1986555, -0.4504156, -1.790131, 0, 1, 0.5137255, 1,
-0.1957336, -1.352271, -3.930488, 0, 1, 0.5215687, 1,
-0.1917826, -0.3414023, -2.166949, 0, 1, 0.5254902, 1,
-0.1915199, -0.1102135, -1.417017, 0, 1, 0.5333334, 1,
-0.1914136, -1.057323, -2.764584, 0, 1, 0.5372549, 1,
-0.1880267, -1.337903, -1.607352, 0, 1, 0.5450981, 1,
-0.1835755, 0.02923752, -2.128671, 0, 1, 0.5490196, 1,
-0.1835106, -0.3538459, -2.595916, 0, 1, 0.5568628, 1,
-0.181144, -0.4628915, -3.065716, 0, 1, 0.5607843, 1,
-0.1798666, 1.054717, -1.084202, 0, 1, 0.5686275, 1,
-0.1757358, -1.119387, -1.89478, 0, 1, 0.572549, 1,
-0.1717322, -1.212575, -3.473234, 0, 1, 0.5803922, 1,
-0.1662399, -0.9410287, -2.709018, 0, 1, 0.5843138, 1,
-0.1625045, 0.9093468, -0.8100314, 0, 1, 0.5921569, 1,
-0.1561866, -0.6958914, -2.269125, 0, 1, 0.5960785, 1,
-0.1556919, 0.5227945, 1.51419, 0, 1, 0.6039216, 1,
-0.1554895, 1.828938, -1.501885, 0, 1, 0.6117647, 1,
-0.1506078, -0.7979224, -3.124717, 0, 1, 0.6156863, 1,
-0.1491845, 1.426133, -1.219356, 0, 1, 0.6235294, 1,
-0.1475764, 0.2262361, -0.4325626, 0, 1, 0.627451, 1,
-0.1466011, 0.2057803, -0.4894435, 0, 1, 0.6352941, 1,
-0.1437896, 0.392221, -0.07951728, 0, 1, 0.6392157, 1,
-0.1327194, -0.07778387, -2.112673, 0, 1, 0.6470588, 1,
-0.1321659, -1.25562, -2.387751, 0, 1, 0.6509804, 1,
-0.1312927, -0.1450572, -1.598069, 0, 1, 0.6588235, 1,
-0.1303671, 0.1927396, 0.8624123, 0, 1, 0.6627451, 1,
-0.1302111, -0.4188623, -3.545465, 0, 1, 0.6705883, 1,
-0.1298987, -1.0412, -3.533217, 0, 1, 0.6745098, 1,
-0.1290147, -0.5102419, -2.919758, 0, 1, 0.682353, 1,
-0.128733, 0.2820105, 0.02550003, 0, 1, 0.6862745, 1,
-0.1268656, -0.8935748, -3.424323, 0, 1, 0.6941177, 1,
-0.1254894, -1.060071, -3.109524, 0, 1, 0.7019608, 1,
-0.1236724, 0.1881676, -1.225935, 0, 1, 0.7058824, 1,
-0.1228587, -1.568804, -2.66375, 0, 1, 0.7137255, 1,
-0.1223879, 0.8922262, -1.256113, 0, 1, 0.7176471, 1,
-0.1164979, 1.377803, 0.3686543, 0, 1, 0.7254902, 1,
-0.1124775, 0.409028, -1.134251, 0, 1, 0.7294118, 1,
-0.1120836, 2.447311, 1.436173, 0, 1, 0.7372549, 1,
-0.1112464, 0.7635275, 0.3631742, 0, 1, 0.7411765, 1,
-0.1095357, 0.1590601, 0.2985554, 0, 1, 0.7490196, 1,
-0.1075641, -0.4642209, -1.312419, 0, 1, 0.7529412, 1,
-0.1073476, -0.03483091, -1.014967, 0, 1, 0.7607843, 1,
-0.1065323, -0.1853892, -2.860176, 0, 1, 0.7647059, 1,
-0.1060233, -0.4410696, -3.129983, 0, 1, 0.772549, 1,
-0.1018618, -0.9744611, -2.238129, 0, 1, 0.7764706, 1,
-0.09538066, 0.1994122, -0.4268147, 0, 1, 0.7843137, 1,
-0.09325383, 0.8785574, -1.211399, 0, 1, 0.7882353, 1,
-0.09225427, 0.8532404, -0.8386677, 0, 1, 0.7960784, 1,
-0.08833224, 1.121547, -1.07144, 0, 1, 0.8039216, 1,
-0.08537583, -0.2803394, -3.182083, 0, 1, 0.8078431, 1,
-0.08239768, 1.112347, -0.7683992, 0, 1, 0.8156863, 1,
-0.08121526, -0.6329259, -3.231347, 0, 1, 0.8196079, 1,
-0.07836389, 0.4022076, 0.3325938, 0, 1, 0.827451, 1,
-0.0762345, 0.7552925, 1.722443, 0, 1, 0.8313726, 1,
-0.07116366, 0.5578563, -1.236166, 0, 1, 0.8392157, 1,
-0.06664851, -2.369978, -3.395126, 0, 1, 0.8431373, 1,
-0.06313844, 0.212101, -0.4650871, 0, 1, 0.8509804, 1,
-0.05789234, -0.8949232, -3.434486, 0, 1, 0.854902, 1,
-0.05598577, 0.2344113, -1.797538, 0, 1, 0.8627451, 1,
-0.05276679, -1.089562, -3.033371, 0, 1, 0.8666667, 1,
-0.04728375, -0.6857036, -1.498756, 0, 1, 0.8745098, 1,
-0.04559295, 0.299156, -1.777784, 0, 1, 0.8784314, 1,
-0.0449901, -1.05402, -3.614609, 0, 1, 0.8862745, 1,
-0.0438417, -0.9745537, -2.863404, 0, 1, 0.8901961, 1,
-0.04044909, 0.5986243, 0.8732994, 0, 1, 0.8980392, 1,
-0.03779175, 0.352664, 2.041882, 0, 1, 0.9058824, 1,
-0.03232426, -0.4915214, -4.620886, 0, 1, 0.9098039, 1,
-0.0306001, 0.4279487, 0.9702868, 0, 1, 0.9176471, 1,
-0.02976447, 0.7436218, 0.03919535, 0, 1, 0.9215686, 1,
-0.02812575, 0.06338457, -1.746863, 0, 1, 0.9294118, 1,
-0.02570248, 0.1205033, -0.0171556, 0, 1, 0.9333333, 1,
-0.02174005, -0.1137476, -0.5363125, 0, 1, 0.9411765, 1,
-0.01699584, 0.4466308, 0.8678111, 0, 1, 0.945098, 1,
-0.0152986, -1.51688, -4.397419, 0, 1, 0.9529412, 1,
-0.008592412, -0.6417917, -2.065345, 0, 1, 0.9568627, 1,
-0.006180222, -0.1282055, -3.83922, 0, 1, 0.9647059, 1,
0.008267594, -1.478431, 1.702446, 0, 1, 0.9686275, 1,
0.01462027, 0.2620199, -0.04157464, 0, 1, 0.9764706, 1,
0.01667511, 0.8394068, 0.3608672, 0, 1, 0.9803922, 1,
0.02719384, 1.295053, -1.172927, 0, 1, 0.9882353, 1,
0.0279055, 0.9941955, 0.8293181, 0, 1, 0.9921569, 1,
0.03414977, 0.2182798, 0.02358156, 0, 1, 1, 1,
0.03660008, 0.1072151, 2.536265, 0, 0.9921569, 1, 1,
0.04553111, 1.063943, 1.927221, 0, 0.9882353, 1, 1,
0.05128663, 1.10451, 0.3779017, 0, 0.9803922, 1, 1,
0.05376157, 0.1090691, 1.198173, 0, 0.9764706, 1, 1,
0.05586921, -0.973162, 3.230653, 0, 0.9686275, 1, 1,
0.05726285, -1.230632, 4.065376, 0, 0.9647059, 1, 1,
0.05899498, 0.2705568, 0.1983422, 0, 0.9568627, 1, 1,
0.06261685, -0.03671708, 3.106406, 0, 0.9529412, 1, 1,
0.06455708, 1.224217, 1.674583, 0, 0.945098, 1, 1,
0.06857255, 0.5581736, -1.101412, 0, 0.9411765, 1, 1,
0.07316283, 0.1313434, 1.364452, 0, 0.9333333, 1, 1,
0.07715922, 1.358066, -2.007761, 0, 0.9294118, 1, 1,
0.07752914, -0.8424038, 3.464785, 0, 0.9215686, 1, 1,
0.08409449, -0.1395057, 2.445361, 0, 0.9176471, 1, 1,
0.08452408, -0.1662357, 3.889524, 0, 0.9098039, 1, 1,
0.09136458, 1.755195, -0.06677105, 0, 0.9058824, 1, 1,
0.09143963, 0.9945941, -0.9820294, 0, 0.8980392, 1, 1,
0.09219007, 1.029068, 0.2929385, 0, 0.8901961, 1, 1,
0.09287494, -0.8956832, 2.6869, 0, 0.8862745, 1, 1,
0.09377358, 0.6656452, -0.217216, 0, 0.8784314, 1, 1,
0.09439792, 0.3953817, -0.6165347, 0, 0.8745098, 1, 1,
0.09604552, 0.5710973, -0.06911325, 0, 0.8666667, 1, 1,
0.09664841, 0.3838373, 0.3477097, 0, 0.8627451, 1, 1,
0.101051, -1.067488, 2.348957, 0, 0.854902, 1, 1,
0.101324, 0.603161, 0.4168617, 0, 0.8509804, 1, 1,
0.1048054, 1.352236, 3.14658, 0, 0.8431373, 1, 1,
0.1151791, 0.9939306, 1.252052, 0, 0.8392157, 1, 1,
0.1166225, 1.909744, -0.3815526, 0, 0.8313726, 1, 1,
0.1191583, -1.528404, 3.100902, 0, 0.827451, 1, 1,
0.119726, -1.120201, 2.36429, 0, 0.8196079, 1, 1,
0.1245248, 0.0165735, 1.291677, 0, 0.8156863, 1, 1,
0.1261763, 0.4673846, 0.9247229, 0, 0.8078431, 1, 1,
0.1275526, 1.349318, -0.1775089, 0, 0.8039216, 1, 1,
0.1339251, 0.5405739, -0.5343412, 0, 0.7960784, 1, 1,
0.1346112, -0.1029933, 1.141305, 0, 0.7882353, 1, 1,
0.1372627, 1.558849, 0.1844247, 0, 0.7843137, 1, 1,
0.1373421, -0.244181, 3.016907, 0, 0.7764706, 1, 1,
0.1395544, -1.102478, 2.058404, 0, 0.772549, 1, 1,
0.1465115, 1.778099, -0.8462502, 0, 0.7647059, 1, 1,
0.1478331, -1.306961, 1.89874, 0, 0.7607843, 1, 1,
0.1559703, -0.9235529, 4.761126, 0, 0.7529412, 1, 1,
0.1561197, -0.3057782, 2.083616, 0, 0.7490196, 1, 1,
0.1581389, -0.7619165, 1.499712, 0, 0.7411765, 1, 1,
0.1594855, 0.3478552, -0.8437128, 0, 0.7372549, 1, 1,
0.1631083, -0.798104, 4.70063, 0, 0.7294118, 1, 1,
0.164046, -0.3043504, 4.066842, 0, 0.7254902, 1, 1,
0.1661859, -0.2427212, 1.765447, 0, 0.7176471, 1, 1,
0.1822811, 0.8036864, 0.06162036, 0, 0.7137255, 1, 1,
0.1857839, 0.04897486, 0.889226, 0, 0.7058824, 1, 1,
0.1885563, -0.4301334, 3.378299, 0, 0.6980392, 1, 1,
0.2055255, 0.05327463, 1.850171, 0, 0.6941177, 1, 1,
0.2075239, -1.19661, 2.248201, 0, 0.6862745, 1, 1,
0.2079822, -1.085642, 3.339717, 0, 0.682353, 1, 1,
0.2094888, 1.661057, 0.952406, 0, 0.6745098, 1, 1,
0.2129543, 0.530973, -0.2152805, 0, 0.6705883, 1, 1,
0.216965, 1.375764, 0.429142, 0, 0.6627451, 1, 1,
0.2182845, -0.01261133, 2.30588, 0, 0.6588235, 1, 1,
0.221681, 0.1279377, 0.04238391, 0, 0.6509804, 1, 1,
0.239038, 0.8999649, 0.6212599, 0, 0.6470588, 1, 1,
0.2404242, 1.219478, -0.165838, 0, 0.6392157, 1, 1,
0.2411024, -0.5165912, 2.183472, 0, 0.6352941, 1, 1,
0.2428984, -0.8690481, 1.691483, 0, 0.627451, 1, 1,
0.2441496, 0.2554861, 2.521588, 0, 0.6235294, 1, 1,
0.2469676, 0.1471203, 1.145481, 0, 0.6156863, 1, 1,
0.24937, -2.0128, 3.830103, 0, 0.6117647, 1, 1,
0.2501426, -0.7430163, 1.905276, 0, 0.6039216, 1, 1,
0.2505714, -0.1681011, 1.2461, 0, 0.5960785, 1, 1,
0.2514762, 0.6484647, 0.03601525, 0, 0.5921569, 1, 1,
0.2542395, 0.2753708, 2.037269, 0, 0.5843138, 1, 1,
0.2570708, -1.480596, 3.375898, 0, 0.5803922, 1, 1,
0.2588188, 0.5008896, 1.699654, 0, 0.572549, 1, 1,
0.2597589, -0.6346411, 2.672584, 0, 0.5686275, 1, 1,
0.2616273, -0.09364117, 2.887802, 0, 0.5607843, 1, 1,
0.2626949, -0.4686748, 1.013854, 0, 0.5568628, 1, 1,
0.2636539, -1.16085, 1.847599, 0, 0.5490196, 1, 1,
0.2644137, 0.474662, 1.038403, 0, 0.5450981, 1, 1,
0.2667783, -0.003972652, 2.194574, 0, 0.5372549, 1, 1,
0.2677672, -1.23786, 1.138183, 0, 0.5333334, 1, 1,
0.27294, 0.981006, 2.12055, 0, 0.5254902, 1, 1,
0.2732292, -0.829859, 1.637512, 0, 0.5215687, 1, 1,
0.2763828, -0.3606191, 3.948743, 0, 0.5137255, 1, 1,
0.276391, -0.1241101, 3.284335, 0, 0.509804, 1, 1,
0.2770558, -1.129645, 3.650124, 0, 0.5019608, 1, 1,
0.2790602, -0.5895111, 3.054796, 0, 0.4941176, 1, 1,
0.2945963, 1.000561, -0.5154436, 0, 0.4901961, 1, 1,
0.294899, -2.073237, 2.413945, 0, 0.4823529, 1, 1,
0.2969801, -1.195429, 2.832829, 0, 0.4784314, 1, 1,
0.2979196, 0.8610243, 1.210759, 0, 0.4705882, 1, 1,
0.2988259, -0.952207, 2.39646, 0, 0.4666667, 1, 1,
0.2999576, -1.659745, 3.795398, 0, 0.4588235, 1, 1,
0.3022682, -1.893625, 0.9844823, 0, 0.454902, 1, 1,
0.3085595, -0.6290442, 4.609376, 0, 0.4470588, 1, 1,
0.3094029, -0.5887114, 2.271442, 0, 0.4431373, 1, 1,
0.313432, -0.122654, 2.972503, 0, 0.4352941, 1, 1,
0.3147641, -0.8698077, 2.425753, 0, 0.4313726, 1, 1,
0.3164485, 0.2695407, 1.082245, 0, 0.4235294, 1, 1,
0.320889, 1.51844, 0.03109084, 0, 0.4196078, 1, 1,
0.3218859, 0.09508823, 0.07782988, 0, 0.4117647, 1, 1,
0.3234624, -0.1143239, 2.721756, 0, 0.4078431, 1, 1,
0.3263747, -1.038579, 3.260539, 0, 0.4, 1, 1,
0.3309524, 0.8970091, 1.809029, 0, 0.3921569, 1, 1,
0.336826, 0.1077779, 0.6525428, 0, 0.3882353, 1, 1,
0.3386935, -1.140453, 3.444847, 0, 0.3803922, 1, 1,
0.3431097, -0.4467158, 3.717985, 0, 0.3764706, 1, 1,
0.3455055, 0.2826285, -0.0960652, 0, 0.3686275, 1, 1,
0.3465169, 0.9422107, 0.5617042, 0, 0.3647059, 1, 1,
0.346546, 0.370255, -0.2603131, 0, 0.3568628, 1, 1,
0.3465579, 0.1931997, 0.3540487, 0, 0.3529412, 1, 1,
0.3498397, -0.2354922, 2.492801, 0, 0.345098, 1, 1,
0.3562343, -1.601105, 3.084589, 0, 0.3411765, 1, 1,
0.3571752, -0.5676076, 3.746747, 0, 0.3333333, 1, 1,
0.3590794, 0.1775742, -1.02175, 0, 0.3294118, 1, 1,
0.359749, 0.3261137, -0.06657756, 0, 0.3215686, 1, 1,
0.3628993, 0.7052975, 0.928039, 0, 0.3176471, 1, 1,
0.3675897, -1.130375, 2.732084, 0, 0.3098039, 1, 1,
0.3684124, -0.4259464, 4.407197, 0, 0.3058824, 1, 1,
0.3711012, 1.973651, -1.936431, 0, 0.2980392, 1, 1,
0.3730425, 0.6166767, -1.143721, 0, 0.2901961, 1, 1,
0.3758166, -1.101859, 1.538935, 0, 0.2862745, 1, 1,
0.3795019, 1.035378, -0.1611429, 0, 0.2784314, 1, 1,
0.3803858, 0.8839335, -1.957571, 0, 0.2745098, 1, 1,
0.3833802, -0.8609114, 3.441012, 0, 0.2666667, 1, 1,
0.3842962, 0.0548909, 0.2114373, 0, 0.2627451, 1, 1,
0.3854948, 0.6138665, 0.9342965, 0, 0.254902, 1, 1,
0.387063, -0.8933455, 2.474038, 0, 0.2509804, 1, 1,
0.3886927, -1.431322, 2.742866, 0, 0.2431373, 1, 1,
0.3921321, 0.9313821, 0.660338, 0, 0.2392157, 1, 1,
0.3933675, -0.2816586, 2.988463, 0, 0.2313726, 1, 1,
0.3956901, 0.4990578, 0.2049908, 0, 0.227451, 1, 1,
0.3989138, 0.3561018, -0.1950326, 0, 0.2196078, 1, 1,
0.4006751, -0.9192904, 2.581195, 0, 0.2156863, 1, 1,
0.4031371, 0.129256, 2.290336, 0, 0.2078431, 1, 1,
0.4048005, 1.157355, 1.215068, 0, 0.2039216, 1, 1,
0.4056595, 0.5241466, 1.435466, 0, 0.1960784, 1, 1,
0.4060906, 0.8181342, -0.4302976, 0, 0.1882353, 1, 1,
0.4090011, 1.144986, 0.06641617, 0, 0.1843137, 1, 1,
0.4112064, -0.6870059, 2.922434, 0, 0.1764706, 1, 1,
0.4177487, -0.05546226, 1.257335, 0, 0.172549, 1, 1,
0.4184211, -0.3353296, 2.585413, 0, 0.1647059, 1, 1,
0.4223785, 0.915347, 0.4423236, 0, 0.1607843, 1, 1,
0.4249857, -0.07198978, 1.228751, 0, 0.1529412, 1, 1,
0.4267858, 0.01013436, 1.169922, 0, 0.1490196, 1, 1,
0.4350635, 0.4759219, 0.3308991, 0, 0.1411765, 1, 1,
0.4433274, -0.6888267, 3.735323, 0, 0.1372549, 1, 1,
0.4459263, -1.592348, 2.814204, 0, 0.1294118, 1, 1,
0.4482643, 0.4582962, 0.9102711, 0, 0.1254902, 1, 1,
0.4524986, -0.3481371, 1.94253, 0, 0.1176471, 1, 1,
0.4527871, -2.307494, 3.185015, 0, 0.1137255, 1, 1,
0.4611752, -0.3482931, 2.555849, 0, 0.1058824, 1, 1,
0.4612863, -1.396481, 2.735514, 0, 0.09803922, 1, 1,
0.4614727, 0.3079464, 0.6356497, 0, 0.09411765, 1, 1,
0.4635631, 0.642267, -0.09799303, 0, 0.08627451, 1, 1,
0.4636165, 1.845715, 1.291814, 0, 0.08235294, 1, 1,
0.4661216, -0.8462189, 2.458239, 0, 0.07450981, 1, 1,
0.4775107, 0.6635125, 0.2067324, 0, 0.07058824, 1, 1,
0.4830962, 0.1705094, 1.714586, 0, 0.0627451, 1, 1,
0.4849223, 0.2102285, 0.8838593, 0, 0.05882353, 1, 1,
0.4858932, 0.1808407, -0.2360982, 0, 0.05098039, 1, 1,
0.4874809, 1.200324, 2.329959, 0, 0.04705882, 1, 1,
0.4884374, -1.187884, 2.322086, 0, 0.03921569, 1, 1,
0.4921598, -1.288271, 2.664031, 0, 0.03529412, 1, 1,
0.4959285, -0.1583073, 4.087642, 0, 0.02745098, 1, 1,
0.4977802, -0.4269516, 3.720661, 0, 0.02352941, 1, 1,
0.5075744, 1.104195, 0.3561091, 0, 0.01568628, 1, 1,
0.5098913, 0.3716832, 0.3205883, 0, 0.01176471, 1, 1,
0.5141045, 0.4078912, 1.12731, 0, 0.003921569, 1, 1,
0.5183091, -0.7392692, 2.01317, 0.003921569, 0, 1, 1,
0.5185289, -0.2864501, 1.053532, 0.007843138, 0, 1, 1,
0.5218647, -0.9115053, 3.318914, 0.01568628, 0, 1, 1,
0.5345693, -0.1291415, 2.243926, 0.01960784, 0, 1, 1,
0.5373757, -0.635094, 1.492265, 0.02745098, 0, 1, 1,
0.5395067, -0.3839988, 3.002288, 0.03137255, 0, 1, 1,
0.5434425, 0.603189, -0.5344884, 0.03921569, 0, 1, 1,
0.5440379, -0.3636623, 2.281157, 0.04313726, 0, 1, 1,
0.544065, 1.41147, -1.178214, 0.05098039, 0, 1, 1,
0.5489675, -1.009071, 3.889103, 0.05490196, 0, 1, 1,
0.5522773, 0.3031271, 2.054065, 0.0627451, 0, 1, 1,
0.5527804, -0.0478264, 1.221344, 0.06666667, 0, 1, 1,
0.5543503, 0.6890222, 1.469669, 0.07450981, 0, 1, 1,
0.5546717, 1.287279, 0.6548306, 0.07843138, 0, 1, 1,
0.562543, 1.108193, 2.120275, 0.08627451, 0, 1, 1,
0.5660101, 0.7575946, -0.1639402, 0.09019608, 0, 1, 1,
0.5679408, -1.295431, 2.912355, 0.09803922, 0, 1, 1,
0.5687627, 1.488664, 0.4608878, 0.1058824, 0, 1, 1,
0.569221, -0.06133644, 0.3809975, 0.1098039, 0, 1, 1,
0.5706278, -0.5740235, 1.191209, 0.1176471, 0, 1, 1,
0.5708464, 0.4161615, 1.279921, 0.1215686, 0, 1, 1,
0.574263, -1.396525, 3.526692, 0.1294118, 0, 1, 1,
0.5749964, -0.1171821, 2.618496, 0.1333333, 0, 1, 1,
0.5767149, -0.1729289, 1.201485, 0.1411765, 0, 1, 1,
0.5770696, 0.8934854, 2.455684, 0.145098, 0, 1, 1,
0.5787525, -0.8375278, 3.923911, 0.1529412, 0, 1, 1,
0.5809566, 1.013493, 1.767011, 0.1568628, 0, 1, 1,
0.5815272, -1.718866, 2.046918, 0.1647059, 0, 1, 1,
0.58605, 0.166182, 1.513076, 0.1686275, 0, 1, 1,
0.5869339, 1.371741, -0.4054474, 0.1764706, 0, 1, 1,
0.5907294, -0.7564551, 3.300946, 0.1803922, 0, 1, 1,
0.5931925, -0.600714, 1.910012, 0.1882353, 0, 1, 1,
0.5940775, 1.5483, -0.02450808, 0.1921569, 0, 1, 1,
0.5945567, 0.2869973, 2.095303, 0.2, 0, 1, 1,
0.5946915, -0.1822481, 4.017129, 0.2078431, 0, 1, 1,
0.5964504, 1.595875, 2.679492, 0.2117647, 0, 1, 1,
0.6045865, 0.1954166, 1.987099, 0.2196078, 0, 1, 1,
0.6055792, -1.173207, 1.224863, 0.2235294, 0, 1, 1,
0.6068344, -0.2860157, 2.521598, 0.2313726, 0, 1, 1,
0.6081923, -0.2414214, 1.425516, 0.2352941, 0, 1, 1,
0.6094527, 0.9440972, 2.313442, 0.2431373, 0, 1, 1,
0.6202925, 0.7705272, -0.4720435, 0.2470588, 0, 1, 1,
0.6235681, 1.350686, 1.010025, 0.254902, 0, 1, 1,
0.6288896, -1.049462, 2.38124, 0.2588235, 0, 1, 1,
0.6313466, 0.7051595, -0.06226872, 0.2666667, 0, 1, 1,
0.6313659, -0.9786664, 2.098183, 0.2705882, 0, 1, 1,
0.6319135, -2.272801, 4.781209, 0.2784314, 0, 1, 1,
0.6319658, -0.1991314, 2.145082, 0.282353, 0, 1, 1,
0.639601, 0.324299, -0.07193244, 0.2901961, 0, 1, 1,
0.6424434, -0.4915899, 1.354394, 0.2941177, 0, 1, 1,
0.6424547, -0.5471802, 0.528837, 0.3019608, 0, 1, 1,
0.6425558, 0.795369, -0.4132121, 0.3098039, 0, 1, 1,
0.6438451, -1.147499, 4.129121, 0.3137255, 0, 1, 1,
0.6463878, 0.2701619, 2.419906, 0.3215686, 0, 1, 1,
0.6465781, -1.778987, -1.124407, 0.3254902, 0, 1, 1,
0.6503258, 1.310224, -0.3045039, 0.3333333, 0, 1, 1,
0.6523966, 0.344197, 0.9088091, 0.3372549, 0, 1, 1,
0.6525677, -0.1973714, 2.528419, 0.345098, 0, 1, 1,
0.6537517, -0.5101779, 2.827787, 0.3490196, 0, 1, 1,
0.6547996, -0.50212, 2.112415, 0.3568628, 0, 1, 1,
0.6561301, -0.3692957, 2.209898, 0.3607843, 0, 1, 1,
0.6592128, 0.3311297, 1.398068, 0.3686275, 0, 1, 1,
0.6653936, 0.533384, 0.6622828, 0.372549, 0, 1, 1,
0.665543, -0.5356748, 1.666835, 0.3803922, 0, 1, 1,
0.6680086, -0.7721612, 0.836784, 0.3843137, 0, 1, 1,
0.6724759, 1.950234, 0.164199, 0.3921569, 0, 1, 1,
0.6736381, -1.581774, 1.117304, 0.3960784, 0, 1, 1,
0.6757172, -0.05730342, 2.158999, 0.4039216, 0, 1, 1,
0.6781813, -0.978826, 3.909228, 0.4117647, 0, 1, 1,
0.6788837, -0.04489923, 2.218144, 0.4156863, 0, 1, 1,
0.6801459, -0.03137204, 1.849969, 0.4235294, 0, 1, 1,
0.681084, -0.1605821, 1.926114, 0.427451, 0, 1, 1,
0.6841684, -1.197474, 2.06917, 0.4352941, 0, 1, 1,
0.6875751, -0.7078976, 2.156991, 0.4392157, 0, 1, 1,
0.6895406, -0.3139755, 3.199284, 0.4470588, 0, 1, 1,
0.6899928, 1.444048, 0.2529247, 0.4509804, 0, 1, 1,
0.6907135, 0.6634893, -0.5644763, 0.4588235, 0, 1, 1,
0.6944737, 0.3455541, 1.100618, 0.4627451, 0, 1, 1,
0.6984249, -1.21256, 2.582539, 0.4705882, 0, 1, 1,
0.70261, 0.1988993, 4.063337, 0.4745098, 0, 1, 1,
0.7047991, 3.159059, 0.2983832, 0.4823529, 0, 1, 1,
0.7085338, -1.664195, 5.363865, 0.4862745, 0, 1, 1,
0.7118601, 2.839224, 0.6500007, 0.4941176, 0, 1, 1,
0.7132739, -0.5558538, 1.297053, 0.5019608, 0, 1, 1,
0.7157781, -0.9037791, 1.55916, 0.5058824, 0, 1, 1,
0.7169544, -0.387155, 1.718135, 0.5137255, 0, 1, 1,
0.7192412, -0.126816, 2.423491, 0.5176471, 0, 1, 1,
0.7206053, -0.4289119, 2.931776, 0.5254902, 0, 1, 1,
0.7226262, 0.01878988, 2.195997, 0.5294118, 0, 1, 1,
0.725038, 0.2488626, 1.204138, 0.5372549, 0, 1, 1,
0.7365252, 0.3426764, 0.3840408, 0.5411765, 0, 1, 1,
0.7378235, -1.873912, 4.39732, 0.5490196, 0, 1, 1,
0.7385232, 0.1488379, 1.836865, 0.5529412, 0, 1, 1,
0.7476985, -1.329206, 2.808068, 0.5607843, 0, 1, 1,
0.7486469, 1.042526, 1.132058, 0.5647059, 0, 1, 1,
0.7517646, 0.4014283, 1.308506, 0.572549, 0, 1, 1,
0.7533494, -0.2314089, 1.524972, 0.5764706, 0, 1, 1,
0.7540843, -0.9056734, 2.592891, 0.5843138, 0, 1, 1,
0.7590317, -0.3795584, 2.987861, 0.5882353, 0, 1, 1,
0.7600588, -0.6243019, 3.402149, 0.5960785, 0, 1, 1,
0.7616791, 0.3194598, 1.010466, 0.6039216, 0, 1, 1,
0.7649143, 0.6674221, 1.116808, 0.6078432, 0, 1, 1,
0.7654407, 1.732978, -0.6890444, 0.6156863, 0, 1, 1,
0.7670323, 1.637437, 0.722796, 0.6196079, 0, 1, 1,
0.7680577, 1.887248, 0.02814272, 0.627451, 0, 1, 1,
0.7701133, 0.5209956, 1.482661, 0.6313726, 0, 1, 1,
0.7711982, -0.9953495, 4.181624, 0.6392157, 0, 1, 1,
0.7740936, -0.03650371, 1.560294, 0.6431373, 0, 1, 1,
0.7751318, -0.08962752, 0.5946986, 0.6509804, 0, 1, 1,
0.7803512, 0.1729515, 0.3847986, 0.654902, 0, 1, 1,
0.7814141, 0.05418967, 0.5653344, 0.6627451, 0, 1, 1,
0.7833768, -0.6310173, 2.171993, 0.6666667, 0, 1, 1,
0.786976, -1.257713, 1.46733, 0.6745098, 0, 1, 1,
0.7906955, 1.249281, 1.263958, 0.6784314, 0, 1, 1,
0.7925346, -0.759528, 3.757745, 0.6862745, 0, 1, 1,
0.796572, -0.8303188, 3.750461, 0.6901961, 0, 1, 1,
0.8129229, 0.8785529, 1.972444, 0.6980392, 0, 1, 1,
0.8220717, 0.9309871, 0.3499469, 0.7058824, 0, 1, 1,
0.8245113, -0.6368779, 3.305855, 0.7098039, 0, 1, 1,
0.8253642, 1.108626, -1.635304, 0.7176471, 0, 1, 1,
0.8270091, -0.01346369, 1.508315, 0.7215686, 0, 1, 1,
0.8372692, -0.1510677, 0.02348457, 0.7294118, 0, 1, 1,
0.8437116, 0.7765476, 0.3585085, 0.7333333, 0, 1, 1,
0.8471061, 1.25559, -0.9154192, 0.7411765, 0, 1, 1,
0.8524169, -0.8741053, 2.764651, 0.7450981, 0, 1, 1,
0.8530867, 0.09405845, 2.175026, 0.7529412, 0, 1, 1,
0.8574004, 0.8495759, 1.003324, 0.7568628, 0, 1, 1,
0.8589225, 0.9009051, 1.323425, 0.7647059, 0, 1, 1,
0.8606884, 1.093037, -1.906203, 0.7686275, 0, 1, 1,
0.8647525, -0.3414526, 1.589971, 0.7764706, 0, 1, 1,
0.8665079, -0.9685037, 2.175267, 0.7803922, 0, 1, 1,
0.8695568, 0.8184376, 1.332755, 0.7882353, 0, 1, 1,
0.8710757, -0.1427783, 0.9033631, 0.7921569, 0, 1, 1,
0.8721607, 0.6737844, 1.041778, 0.8, 0, 1, 1,
0.8726674, -0.1906022, 3.288449, 0.8078431, 0, 1, 1,
0.8780162, -1.032051, 2.262574, 0.8117647, 0, 1, 1,
0.8790585, 0.2532996, 2.504221, 0.8196079, 0, 1, 1,
0.8792798, 0.8313194, 1.320974, 0.8235294, 0, 1, 1,
0.8875327, 0.250967, 1.215629, 0.8313726, 0, 1, 1,
0.8882731, 0.752338, -0.7707314, 0.8352941, 0, 1, 1,
0.9067092, 1.070251, 1.004952, 0.8431373, 0, 1, 1,
0.9070204, 0.5146403, 1.501783, 0.8470588, 0, 1, 1,
0.9076464, 0.349158, 0.8086138, 0.854902, 0, 1, 1,
0.9111378, -0.3883566, 0.2098964, 0.8588235, 0, 1, 1,
0.9247544, -0.6209627, 3.013342, 0.8666667, 0, 1, 1,
0.9292395, -0.9328425, 2.846409, 0.8705882, 0, 1, 1,
0.9310606, -1.79685, 1.864868, 0.8784314, 0, 1, 1,
0.931439, 1.805314, 0.6468921, 0.8823529, 0, 1, 1,
0.9328022, -0.1730613, 1.891005, 0.8901961, 0, 1, 1,
0.9395701, 0.3314633, 1.004391, 0.8941177, 0, 1, 1,
0.9395798, -0.7108292, 2.404464, 0.9019608, 0, 1, 1,
0.9557691, 0.1107411, 2.376965, 0.9098039, 0, 1, 1,
0.9580776, 0.9703056, 1.09188, 0.9137255, 0, 1, 1,
0.9607636, -0.4083222, 1.471371, 0.9215686, 0, 1, 1,
0.9637373, 0.7800658, 0.09470178, 0.9254902, 0, 1, 1,
0.9643226, 1.54087, -0.8607116, 0.9333333, 0, 1, 1,
0.9675356, 1.243719, -0.7350975, 0.9372549, 0, 1, 1,
0.9744758, -0.1258456, 3.127624, 0.945098, 0, 1, 1,
0.9776781, -0.1448268, 1.452565, 0.9490196, 0, 1, 1,
0.9900895, -0.2683059, 2.437338, 0.9568627, 0, 1, 1,
0.9914114, 0.6581035, 1.570506, 0.9607843, 0, 1, 1,
0.9927378, 0.5537367, 0.786448, 0.9686275, 0, 1, 1,
0.9942114, 0.452977, 0.2930538, 0.972549, 0, 1, 1,
1.003656, 0.1859196, 2.150291, 0.9803922, 0, 1, 1,
1.008685, -0.2161108, 1.305402, 0.9843137, 0, 1, 1,
1.012329, 0.3026305, 1.361169, 0.9921569, 0, 1, 1,
1.012643, 0.3843082, 1.537443, 0.9960784, 0, 1, 1,
1.012934, -0.4182635, 2.130447, 1, 0, 0.9960784, 1,
1.020076, 0.9175403, 2.583212, 1, 0, 0.9882353, 1,
1.020083, 0.2644641, 1.582377, 1, 0, 0.9843137, 1,
1.020601, 1.203439, -0.01103957, 1, 0, 0.9764706, 1,
1.030834, -0.01995439, 1.946347, 1, 0, 0.972549, 1,
1.032956, 0.4801717, 0.9550434, 1, 0, 0.9647059, 1,
1.03906, -0.3230487, 2.73108, 1, 0, 0.9607843, 1,
1.045674, -0.1277501, 1.652909, 1, 0, 0.9529412, 1,
1.046873, 0.8429524, 2.355294, 1, 0, 0.9490196, 1,
1.049601, -0.2283274, 1.257471, 1, 0, 0.9411765, 1,
1.050183, -0.6142598, 2.585713, 1, 0, 0.9372549, 1,
1.060669, 0.4347281, 0.9739386, 1, 0, 0.9294118, 1,
1.061919, -1.12549, 3.465542, 1, 0, 0.9254902, 1,
1.070575, 0.7502392, 1.028215, 1, 0, 0.9176471, 1,
1.08063, -1.350233, 3.270035, 1, 0, 0.9137255, 1,
1.082105, -0.275746, 1.145953, 1, 0, 0.9058824, 1,
1.082404, 0.1581786, 2.161985, 1, 0, 0.9019608, 1,
1.094496, -0.8955736, 2.680467, 1, 0, 0.8941177, 1,
1.096396, 1.860362, 0.6169975, 1, 0, 0.8862745, 1,
1.103676, -0.1966876, 1.569287, 1, 0, 0.8823529, 1,
1.103761, 0.9375105, 0.95617, 1, 0, 0.8745098, 1,
1.107923, -1.406997, 2.164162, 1, 0, 0.8705882, 1,
1.109423, 0.7012932, 1.59418, 1, 0, 0.8627451, 1,
1.110337, 0.6326789, 0.6336817, 1, 0, 0.8588235, 1,
1.113807, -0.9187008, 2.472526, 1, 0, 0.8509804, 1,
1.121354, -1.184094, 2.58194, 1, 0, 0.8470588, 1,
1.132352, 2.484755, -0.3037609, 1, 0, 0.8392157, 1,
1.136613, 0.1379251, 2.21563, 1, 0, 0.8352941, 1,
1.136632, -0.6268512, 2.779623, 1, 0, 0.827451, 1,
1.137342, 2.42171, 1.479091, 1, 0, 0.8235294, 1,
1.14059, -0.2656516, 1.450399, 1, 0, 0.8156863, 1,
1.143768, -0.4106026, 1.520778, 1, 0, 0.8117647, 1,
1.163302, 0.7849428, 0.6674948, 1, 0, 0.8039216, 1,
1.164218, 0.4351543, 0.9190609, 1, 0, 0.7960784, 1,
1.166637, -0.576436, 3.546185, 1, 0, 0.7921569, 1,
1.167123, -0.2523373, -1.463317, 1, 0, 0.7843137, 1,
1.174486, 0.3835919, 1.106971, 1, 0, 0.7803922, 1,
1.182184, 0.335728, 1.88354, 1, 0, 0.772549, 1,
1.182583, 0.06098488, 2.70469, 1, 0, 0.7686275, 1,
1.18472, 1.975724, -0.266212, 1, 0, 0.7607843, 1,
1.184896, 0.3553472, 0.6561093, 1, 0, 0.7568628, 1,
1.205211, -1.096554, 3.067139, 1, 0, 0.7490196, 1,
1.206668, 0.07341143, 1.025022, 1, 0, 0.7450981, 1,
1.207939, -0.564966, 1.779816, 1, 0, 0.7372549, 1,
1.213294, 1.916377, 0.4930799, 1, 0, 0.7333333, 1,
1.214528, 1.508768, 0.5206629, 1, 0, 0.7254902, 1,
1.217212, 2.388525, 1.370753, 1, 0, 0.7215686, 1,
1.220314, 0.1928494, 0.2760287, 1, 0, 0.7137255, 1,
1.237758, -1.70771, 3.129704, 1, 0, 0.7098039, 1,
1.239672, -0.8536593, 2.149485, 1, 0, 0.7019608, 1,
1.257671, 0.80426, 1.59051, 1, 0, 0.6941177, 1,
1.261314, 1.17332, 0.7149497, 1, 0, 0.6901961, 1,
1.262502, -1.31204, 3.076272, 1, 0, 0.682353, 1,
1.271377, 0.9409961, -0.01574879, 1, 0, 0.6784314, 1,
1.27254, 0.3573581, 1.007333, 1, 0, 0.6705883, 1,
1.273179, -0.0593922, 2.503018, 1, 0, 0.6666667, 1,
1.289166, 0.4257668, 1.949576, 1, 0, 0.6588235, 1,
1.29077, 0.2416453, 3.090862, 1, 0, 0.654902, 1,
1.298066, -0.01621213, 0.7094404, 1, 0, 0.6470588, 1,
1.300203, -0.369831, 1.223459, 1, 0, 0.6431373, 1,
1.308542, 1.171288, 0.1161456, 1, 0, 0.6352941, 1,
1.330922, 1.99587, 2.614257, 1, 0, 0.6313726, 1,
1.334557, 0.4821723, 0.2881833, 1, 0, 0.6235294, 1,
1.348691, -0.9407387, 0.603559, 1, 0, 0.6196079, 1,
1.361683, 0.2689813, 1.11836, 1, 0, 0.6117647, 1,
1.361802, -0.4754719, 2.415514, 1, 0, 0.6078432, 1,
1.380815, -0.6199939, 2.784879, 1, 0, 0.6, 1,
1.392449, -0.7385615, 3.585965, 1, 0, 0.5921569, 1,
1.397032, 1.59158, 0.9815302, 1, 0, 0.5882353, 1,
1.40491, 1.965982, 0.6905541, 1, 0, 0.5803922, 1,
1.40741, 1.58706, 3.734876, 1, 0, 0.5764706, 1,
1.418479, -0.5447549, 2.588506, 1, 0, 0.5686275, 1,
1.418625, -0.4185275, 2.056633, 1, 0, 0.5647059, 1,
1.421103, 0.2700242, 2.120067, 1, 0, 0.5568628, 1,
1.423841, 0.7501817, 0.5681589, 1, 0, 0.5529412, 1,
1.42899, 0.4029728, 3.405393, 1, 0, 0.5450981, 1,
1.437658, -0.8191746, 1.454769, 1, 0, 0.5411765, 1,
1.444678, -0.05729991, 0.8157085, 1, 0, 0.5333334, 1,
1.446236, 0.7352139, 1.249995, 1, 0, 0.5294118, 1,
1.449587, -0.6215773, 0.7733171, 1, 0, 0.5215687, 1,
1.453761, 0.4112574, 3.085529, 1, 0, 0.5176471, 1,
1.457461, -0.5623073, 2.51399, 1, 0, 0.509804, 1,
1.484631, -0.2064018, -0.1332105, 1, 0, 0.5058824, 1,
1.485128, 0.3146289, 2.02059, 1, 0, 0.4980392, 1,
1.485876, -1.468961, 1.96313, 1, 0, 0.4901961, 1,
1.489601, -0.4015797, 3.173846, 1, 0, 0.4862745, 1,
1.492609, 0.2116285, 0.9484293, 1, 0, 0.4784314, 1,
1.494112, -0.27379, 0.6268638, 1, 0, 0.4745098, 1,
1.498504, 0.2378145, 1.625848, 1, 0, 0.4666667, 1,
1.505571, 0.2084816, 1.376631, 1, 0, 0.4627451, 1,
1.51368, -0.9030817, 4.469036, 1, 0, 0.454902, 1,
1.52666, 1.806345, 1.223634, 1, 0, 0.4509804, 1,
1.538659, -2.064154, 2.669443, 1, 0, 0.4431373, 1,
1.538729, 0.1334042, 0.4857928, 1, 0, 0.4392157, 1,
1.548262, -0.07701321, -0.08405083, 1, 0, 0.4313726, 1,
1.555698, 0.5864047, 0.3343548, 1, 0, 0.427451, 1,
1.56705, 0.6433266, 1.666622, 1, 0, 0.4196078, 1,
1.567104, -0.3871579, 2.072521, 1, 0, 0.4156863, 1,
1.57982, -0.2387583, 1.348964, 1, 0, 0.4078431, 1,
1.582102, 1.665171, 0.7050532, 1, 0, 0.4039216, 1,
1.595143, -1.406758, 1.978116, 1, 0, 0.3960784, 1,
1.613132, 0.7441152, 0.5754691, 1, 0, 0.3882353, 1,
1.621748, -0.06897552, 1.242622, 1, 0, 0.3843137, 1,
1.623033, -0.3031047, 3.940959, 1, 0, 0.3764706, 1,
1.635335, -0.3107271, 1.931872, 1, 0, 0.372549, 1,
1.639414, 0.9620211, 2.024678, 1, 0, 0.3647059, 1,
1.640385, 0.02216422, 2.171696, 1, 0, 0.3607843, 1,
1.641999, 0.3799989, 1.519841, 1, 0, 0.3529412, 1,
1.643567, -2.734273, 2.768755, 1, 0, 0.3490196, 1,
1.651145, -0.9082026, 3.162874, 1, 0, 0.3411765, 1,
1.653836, 1.114535, 0.7216101, 1, 0, 0.3372549, 1,
1.66104, -0.09753803, 1.39292, 1, 0, 0.3294118, 1,
1.671354, 1.218493, 0.3664677, 1, 0, 0.3254902, 1,
1.678014, 0.8422689, 1.36775, 1, 0, 0.3176471, 1,
1.723345, 0.659907, 2.564642, 1, 0, 0.3137255, 1,
1.74784, 0.343083, 0.684447, 1, 0, 0.3058824, 1,
1.764053, 0.2017137, 1.255576, 1, 0, 0.2980392, 1,
1.772616, -0.4840609, 2.192823, 1, 0, 0.2941177, 1,
1.791988, 1.101265, 0.8812839, 1, 0, 0.2862745, 1,
1.809232, -0.159411, 2.242281, 1, 0, 0.282353, 1,
1.811527, 0.9067194, 2.724272, 1, 0, 0.2745098, 1,
1.822382, 0.390561, 0.2238467, 1, 0, 0.2705882, 1,
1.83014, -0.414023, -0.07587007, 1, 0, 0.2627451, 1,
1.839467, -1.255047, 3.602846, 1, 0, 0.2588235, 1,
1.84169, 1.292388, 1.708573, 1, 0, 0.2509804, 1,
1.845971, 0.267638, 2.675038, 1, 0, 0.2470588, 1,
1.851354, -0.9967024, 2.86403, 1, 0, 0.2392157, 1,
1.861943, -0.9771926, 1.199322, 1, 0, 0.2352941, 1,
1.864228, -0.3426531, -0.7428648, 1, 0, 0.227451, 1,
1.894736, -0.6223716, 3.247421, 1, 0, 0.2235294, 1,
1.90103, 2.618572, 0.419911, 1, 0, 0.2156863, 1,
1.908672, -0.2014456, 1.799645, 1, 0, 0.2117647, 1,
1.918378, 0.8012465, 0.4859425, 1, 0, 0.2039216, 1,
1.922724, -0.08440251, 1.360887, 1, 0, 0.1960784, 1,
1.934277, -1.370902, 2.231289, 1, 0, 0.1921569, 1,
1.934819, 0.02409085, 0.714868, 1, 0, 0.1843137, 1,
1.95864, 0.1070991, 0.8639348, 1, 0, 0.1803922, 1,
1.961626, -0.5450648, 2.57153, 1, 0, 0.172549, 1,
1.980762, 1.074735, 0.2336404, 1, 0, 0.1686275, 1,
1.982731, -1.53476, 2.689441, 1, 0, 0.1607843, 1,
1.983183, 0.08563088, 0.6338645, 1, 0, 0.1568628, 1,
2.017752, 0.9896778, 1.735062, 1, 0, 0.1490196, 1,
2.02037, 0.1876187, 1.269382, 1, 0, 0.145098, 1,
2.044202, 1.797737, 0.186858, 1, 0, 0.1372549, 1,
2.045785, -0.3143381, -0.3103561, 1, 0, 0.1333333, 1,
2.046005, -0.594488, 0.3986017, 1, 0, 0.1254902, 1,
2.065608, 0.5308178, 2.057952, 1, 0, 0.1215686, 1,
2.066171, 2.158881, 1.327664, 1, 0, 0.1137255, 1,
2.068889, -0.246409, 0.2832162, 1, 0, 0.1098039, 1,
2.074792, -0.7147723, 2.350787, 1, 0, 0.1019608, 1,
2.075526, 1.017907, 0.5865898, 1, 0, 0.09411765, 1,
2.103455, -0.8982224, 1.681297, 1, 0, 0.09019608, 1,
2.139054, 0.2086049, -0.04981146, 1, 0, 0.08235294, 1,
2.154609, 1.279849, 1.904129, 1, 0, 0.07843138, 1,
2.188384, 0.8346125, 0.3669051, 1, 0, 0.07058824, 1,
2.211927, 1.053208, -0.4295621, 1, 0, 0.06666667, 1,
2.275412, -2.857231, 1.960006, 1, 0, 0.05882353, 1,
2.302923, -0.9428411, 2.741979, 1, 0, 0.05490196, 1,
2.320469, -0.2169586, 2.274291, 1, 0, 0.04705882, 1,
2.354587, -0.3315678, 0.3158728, 1, 0, 0.04313726, 1,
2.515762, 0.09136424, 2.230887, 1, 0, 0.03529412, 1,
2.52151, 0.1828257, 3.620282, 1, 0, 0.03137255, 1,
2.541199, -0.546804, 2.107965, 1, 0, 0.02352941, 1,
2.564487, 1.271003, 0.7017602, 1, 0, 0.01960784, 1,
2.758575, 0.3391767, 0.7685151, 1, 0, 0.01176471, 1,
2.764018, -2.0272, 2.403488, 1, 0, 0.007843138, 1
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
-0.06169939, -3.876993, -7.011415, 0, -0.5, 0.5, 0.5,
-0.06169939, -3.876993, -7.011415, 1, -0.5, 0.5, 0.5,
-0.06169939, -3.876993, -7.011415, 1, 1.5, 0.5, 0.5,
-0.06169939, -3.876993, -7.011415, 0, 1.5, 0.5, 0.5
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
-3.845335, 0.1509138, -7.011415, 0, -0.5, 0.5, 0.5,
-3.845335, 0.1509138, -7.011415, 1, -0.5, 0.5, 0.5,
-3.845335, 0.1509138, -7.011415, 1, 1.5, 0.5, 0.5,
-3.845335, 0.1509138, -7.011415, 0, 1.5, 0.5, 0.5
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
-3.845335, -3.876993, 0.07302284, 0, -0.5, 0.5, 0.5,
-3.845335, -3.876993, 0.07302284, 1, -0.5, 0.5, 0.5,
-3.845335, -3.876993, 0.07302284, 1, 1.5, 0.5, 0.5,
-3.845335, -3.876993, 0.07302284, 0, 1.5, 0.5, 0.5
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
-2, -2.947476, -5.376544,
2, -2.947476, -5.376544,
-2, -2.947476, -5.376544,
-2, -3.102395, -5.649023,
-1, -2.947476, -5.376544,
-1, -3.102395, -5.649023,
0, -2.947476, -5.376544,
0, -3.102395, -5.649023,
1, -2.947476, -5.376544,
1, -3.102395, -5.649023,
2, -2.947476, -5.376544,
2, -3.102395, -5.649023
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
-2, -3.412234, -6.19398, 0, -0.5, 0.5, 0.5,
-2, -3.412234, -6.19398, 1, -0.5, 0.5, 0.5,
-2, -3.412234, -6.19398, 1, 1.5, 0.5, 0.5,
-2, -3.412234, -6.19398, 0, 1.5, 0.5, 0.5,
-1, -3.412234, -6.19398, 0, -0.5, 0.5, 0.5,
-1, -3.412234, -6.19398, 1, -0.5, 0.5, 0.5,
-1, -3.412234, -6.19398, 1, 1.5, 0.5, 0.5,
-1, -3.412234, -6.19398, 0, 1.5, 0.5, 0.5,
0, -3.412234, -6.19398, 0, -0.5, 0.5, 0.5,
0, -3.412234, -6.19398, 1, -0.5, 0.5, 0.5,
0, -3.412234, -6.19398, 1, 1.5, 0.5, 0.5,
0, -3.412234, -6.19398, 0, 1.5, 0.5, 0.5,
1, -3.412234, -6.19398, 0, -0.5, 0.5, 0.5,
1, -3.412234, -6.19398, 1, -0.5, 0.5, 0.5,
1, -3.412234, -6.19398, 1, 1.5, 0.5, 0.5,
1, -3.412234, -6.19398, 0, 1.5, 0.5, 0.5,
2, -3.412234, -6.19398, 0, -0.5, 0.5, 0.5,
2, -3.412234, -6.19398, 1, -0.5, 0.5, 0.5,
2, -3.412234, -6.19398, 1, 1.5, 0.5, 0.5,
2, -3.412234, -6.19398, 0, 1.5, 0.5, 0.5
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
-2.972188, -2, -5.376544,
-2.972188, 3, -5.376544,
-2.972188, -2, -5.376544,
-3.117712, -2, -5.649023,
-2.972188, -1, -5.376544,
-3.117712, -1, -5.649023,
-2.972188, 0, -5.376544,
-3.117712, 0, -5.649023,
-2.972188, 1, -5.376544,
-3.117712, 1, -5.649023,
-2.972188, 2, -5.376544,
-3.117712, 2, -5.649023,
-2.972188, 3, -5.376544,
-3.117712, 3, -5.649023
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
-3.408761, -2, -6.19398, 0, -0.5, 0.5, 0.5,
-3.408761, -2, -6.19398, 1, -0.5, 0.5, 0.5,
-3.408761, -2, -6.19398, 1, 1.5, 0.5, 0.5,
-3.408761, -2, -6.19398, 0, 1.5, 0.5, 0.5,
-3.408761, -1, -6.19398, 0, -0.5, 0.5, 0.5,
-3.408761, -1, -6.19398, 1, -0.5, 0.5, 0.5,
-3.408761, -1, -6.19398, 1, 1.5, 0.5, 0.5,
-3.408761, -1, -6.19398, 0, 1.5, 0.5, 0.5,
-3.408761, 0, -6.19398, 0, -0.5, 0.5, 0.5,
-3.408761, 0, -6.19398, 1, -0.5, 0.5, 0.5,
-3.408761, 0, -6.19398, 1, 1.5, 0.5, 0.5,
-3.408761, 0, -6.19398, 0, 1.5, 0.5, 0.5,
-3.408761, 1, -6.19398, 0, -0.5, 0.5, 0.5,
-3.408761, 1, -6.19398, 1, -0.5, 0.5, 0.5,
-3.408761, 1, -6.19398, 1, 1.5, 0.5, 0.5,
-3.408761, 1, -6.19398, 0, 1.5, 0.5, 0.5,
-3.408761, 2, -6.19398, 0, -0.5, 0.5, 0.5,
-3.408761, 2, -6.19398, 1, -0.5, 0.5, 0.5,
-3.408761, 2, -6.19398, 1, 1.5, 0.5, 0.5,
-3.408761, 2, -6.19398, 0, 1.5, 0.5, 0.5,
-3.408761, 3, -6.19398, 0, -0.5, 0.5, 0.5,
-3.408761, 3, -6.19398, 1, -0.5, 0.5, 0.5,
-3.408761, 3, -6.19398, 1, 1.5, 0.5, 0.5,
-3.408761, 3, -6.19398, 0, 1.5, 0.5, 0.5
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
-2.972188, -2.947476, -4,
-2.972188, -2.947476, 4,
-2.972188, -2.947476, -4,
-3.117712, -3.102395, -4,
-2.972188, -2.947476, -2,
-3.117712, -3.102395, -2,
-2.972188, -2.947476, 0,
-3.117712, -3.102395, 0,
-2.972188, -2.947476, 2,
-3.117712, -3.102395, 2,
-2.972188, -2.947476, 4,
-3.117712, -3.102395, 4
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
-3.408761, -3.412234, -4, 0, -0.5, 0.5, 0.5,
-3.408761, -3.412234, -4, 1, -0.5, 0.5, 0.5,
-3.408761, -3.412234, -4, 1, 1.5, 0.5, 0.5,
-3.408761, -3.412234, -4, 0, 1.5, 0.5, 0.5,
-3.408761, -3.412234, -2, 0, -0.5, 0.5, 0.5,
-3.408761, -3.412234, -2, 1, -0.5, 0.5, 0.5,
-3.408761, -3.412234, -2, 1, 1.5, 0.5, 0.5,
-3.408761, -3.412234, -2, 0, 1.5, 0.5, 0.5,
-3.408761, -3.412234, 0, 0, -0.5, 0.5, 0.5,
-3.408761, -3.412234, 0, 1, -0.5, 0.5, 0.5,
-3.408761, -3.412234, 0, 1, 1.5, 0.5, 0.5,
-3.408761, -3.412234, 0, 0, 1.5, 0.5, 0.5,
-3.408761, -3.412234, 2, 0, -0.5, 0.5, 0.5,
-3.408761, -3.412234, 2, 1, -0.5, 0.5, 0.5,
-3.408761, -3.412234, 2, 1, 1.5, 0.5, 0.5,
-3.408761, -3.412234, 2, 0, 1.5, 0.5, 0.5,
-3.408761, -3.412234, 4, 0, -0.5, 0.5, 0.5,
-3.408761, -3.412234, 4, 1, -0.5, 0.5, 0.5,
-3.408761, -3.412234, 4, 1, 1.5, 0.5, 0.5,
-3.408761, -3.412234, 4, 0, 1.5, 0.5, 0.5
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
-2.972188, -2.947476, -5.376544,
-2.972188, 3.249303, -5.376544,
-2.972188, -2.947476, 5.52259,
-2.972188, 3.249303, 5.52259,
-2.972188, -2.947476, -5.376544,
-2.972188, -2.947476, 5.52259,
-2.972188, 3.249303, -5.376544,
-2.972188, 3.249303, 5.52259,
-2.972188, -2.947476, -5.376544,
2.848789, -2.947476, -5.376544,
-2.972188, -2.947476, 5.52259,
2.848789, -2.947476, 5.52259,
-2.972188, 3.249303, -5.376544,
2.848789, 3.249303, -5.376544,
-2.972188, 3.249303, 5.52259,
2.848789, 3.249303, 5.52259,
2.848789, -2.947476, -5.376544,
2.848789, 3.249303, -5.376544,
2.848789, -2.947476, 5.52259,
2.848789, 3.249303, 5.52259,
2.848789, -2.947476, -5.376544,
2.848789, -2.947476, 5.52259,
2.848789, 3.249303, -5.376544,
2.848789, 3.249303, 5.52259
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
var radius = 7.381207;
var distance = 32.83982;
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
mvMatrix.translate( 0.06169939, -0.1509138, -0.07302284 );
mvMatrix.scale( 1.371025, 1.28788, 0.7322329 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.83982);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
ethiozin<-read.table("ethiozin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethiozin$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethiozin' not found
```

```r
y<-ethiozin$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethiozin' not found
```

```r
z<-ethiozin$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethiozin' not found
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
-2.887416, -0.7927091, -1.819529, 0, 0, 1, 1, 1,
-2.832557, -0.06098541, -2.058326, 1, 0, 0, 1, 1,
-2.814707, -0.8344485, -2.266036, 1, 0, 0, 1, 1,
-2.744725, -0.8843397, -0.8443354, 1, 0, 0, 1, 1,
-2.686454, 1.628028, -1.990087, 1, 0, 0, 1, 1,
-2.646356, -0.7748751, -1.743686, 1, 0, 0, 1, 1,
-2.638262, 0.4831161, -2.397781, 0, 0, 0, 1, 1,
-2.504858, 2.162812, -1.300442, 0, 0, 0, 1, 1,
-2.496869, 0.8339726, -0.01795885, 0, 0, 0, 1, 1,
-2.481469, 0.6032146, -1.106815, 0, 0, 0, 1, 1,
-2.42078, -1.222043, -3.191941, 0, 0, 0, 1, 1,
-2.3278, -0.8247159, -1.344007, 0, 0, 0, 1, 1,
-2.198758, 0.574662, -1.503521, 0, 0, 0, 1, 1,
-2.145107, -0.2711586, -1.844722, 1, 1, 1, 1, 1,
-2.140016, 0.6462484, -1.150805, 1, 1, 1, 1, 1,
-2.132771, 0.8392366, -0.03425123, 1, 1, 1, 1, 1,
-2.075492, -0.4794713, -2.195049, 1, 1, 1, 1, 1,
-2.038301, -0.8617128, -1.768322, 1, 1, 1, 1, 1,
-2.020413, -2.236211, -0.648527, 1, 1, 1, 1, 1,
-1.999092, -0.5002047, -2.380655, 1, 1, 1, 1, 1,
-1.98535, -1.363648, -2.033825, 1, 1, 1, 1, 1,
-1.965853, 1.129353, -0.8833672, 1, 1, 1, 1, 1,
-1.928247, -0.2608046, -0.5446125, 1, 1, 1, 1, 1,
-1.91633, -1.309586, -4.371686, 1, 1, 1, 1, 1,
-1.912937, -0.3466079, -1.159827, 1, 1, 1, 1, 1,
-1.909093, -1.370311, -2.557729, 1, 1, 1, 1, 1,
-1.899907, 1.494027, 1.567241, 1, 1, 1, 1, 1,
-1.893201, -0.384524, -2.985917, 1, 1, 1, 1, 1,
-1.89071, -0.5036817, -0.1098617, 0, 0, 1, 1, 1,
-1.858648, -0.1858484, -2.438607, 1, 0, 0, 1, 1,
-1.857724, -0.02746114, -3.160348, 1, 0, 0, 1, 1,
-1.857453, 0.1660091, -2.307639, 1, 0, 0, 1, 1,
-1.841516, -0.3125544, -0.5835656, 1, 0, 0, 1, 1,
-1.824985, 1.90208, -0.3171544, 1, 0, 0, 1, 1,
-1.804662, 0.64169, -1.696477, 0, 0, 0, 1, 1,
-1.79918, -1.348023, -2.465058, 0, 0, 0, 1, 1,
-1.763957, -2.302595, -2.259507, 0, 0, 0, 1, 1,
-1.761528, -0.9525905, -3.452315, 0, 0, 0, 1, 1,
-1.758863, 0.6236957, -0.2472307, 0, 0, 0, 1, 1,
-1.75789, -2.13779, -3.208105, 0, 0, 0, 1, 1,
-1.718245, -0.3265658, -1.941376, 0, 0, 0, 1, 1,
-1.714391, 0.7508135, -2.399488, 1, 1, 1, 1, 1,
-1.711915, -1.068748, -3.640173, 1, 1, 1, 1, 1,
-1.67472, 0.7249489, -1.607672, 1, 1, 1, 1, 1,
-1.659814, 0.2535181, 0.9337003, 1, 1, 1, 1, 1,
-1.655716, 0.2767158, -2.52459, 1, 1, 1, 1, 1,
-1.629278, -0.1535357, -0.5868587, 1, 1, 1, 1, 1,
-1.628622, -0.4305215, -2.921147, 1, 1, 1, 1, 1,
-1.619913, 0.08834925, -1.104131, 1, 1, 1, 1, 1,
-1.608732, 1.153297, -1.800552, 1, 1, 1, 1, 1,
-1.597678, -1.111692, -1.269512, 1, 1, 1, 1, 1,
-1.593564, 0.3610082, -2.722317, 1, 1, 1, 1, 1,
-1.572739, -1.583948, -2.142824, 1, 1, 1, 1, 1,
-1.57139, -0.5851109, -2.816493, 1, 1, 1, 1, 1,
-1.563836, -1.958722, -3.291036, 1, 1, 1, 1, 1,
-1.563256, 1.751218, -2.487006, 1, 1, 1, 1, 1,
-1.559001, 0.3660129, 0.2776611, 0, 0, 1, 1, 1,
-1.549394, -0.7787596, -1.84859, 1, 0, 0, 1, 1,
-1.519781, -1.701131, -2.557729, 1, 0, 0, 1, 1,
-1.516536, -1.420381, -3.690966, 1, 0, 0, 1, 1,
-1.509723, 1.98217, -1.782787, 1, 0, 0, 1, 1,
-1.508682, -0.2989429, -5.077772, 1, 0, 0, 1, 1,
-1.501681, -1.380199, -3.785039, 0, 0, 0, 1, 1,
-1.49949, -0.7440309, -1.135564, 0, 0, 0, 1, 1,
-1.495289, -0.9014117, -2.477875, 0, 0, 0, 1, 1,
-1.48593, 0.3382097, 0.1295142, 0, 0, 0, 1, 1,
-1.485634, 0.4842422, -2.47964, 0, 0, 0, 1, 1,
-1.480283, -0.02035186, -2.210021, 0, 0, 0, 1, 1,
-1.468672, -0.7844643, -1.556099, 0, 0, 0, 1, 1,
-1.460063, 0.01609474, -1.433839, 1, 1, 1, 1, 1,
-1.454685, 1.290357, -0.78764, 1, 1, 1, 1, 1,
-1.454208, -0.5245299, -2.06352, 1, 1, 1, 1, 1,
-1.450906, 1.571493, -1.570326, 1, 1, 1, 1, 1,
-1.44672, 0.955487, -1.685144, 1, 1, 1, 1, 1,
-1.446543, 1.59797, -1.861555, 1, 1, 1, 1, 1,
-1.443852, -0.7109013, -3.102753, 1, 1, 1, 1, 1,
-1.433794, 0.6617196, -2.314353, 1, 1, 1, 1, 1,
-1.420883, 0.3854494, -1.395353, 1, 1, 1, 1, 1,
-1.387876, -1.585416, -2.679348, 1, 1, 1, 1, 1,
-1.38389, -0.1555578, -3.113697, 1, 1, 1, 1, 1,
-1.383805, 1.556716, 0.3491089, 1, 1, 1, 1, 1,
-1.371659, 0.7981896, -0.8414857, 1, 1, 1, 1, 1,
-1.35742, 1.585588, -1.102481, 1, 1, 1, 1, 1,
-1.347209, 0.5822312, -2.3275, 1, 1, 1, 1, 1,
-1.343943, 1.461288, -0.3392068, 0, 0, 1, 1, 1,
-1.339613, 0.4843431, -0.395831, 1, 0, 0, 1, 1,
-1.336802, 0.7962505, 0.06324726, 1, 0, 0, 1, 1,
-1.336404, -0.7012565, -2.008209, 1, 0, 0, 1, 1,
-1.335469, 2.072065, -1.179896, 1, 0, 0, 1, 1,
-1.33226, -1.080584, -2.342656, 1, 0, 0, 1, 1,
-1.328606, -1.323798, -2.524058, 0, 0, 0, 1, 1,
-1.322722, 0.1560497, -1.024344, 0, 0, 0, 1, 1,
-1.298691, 0.3442654, -1.458006, 0, 0, 0, 1, 1,
-1.298255, -0.149488, -0.8770937, 0, 0, 0, 1, 1,
-1.296501, 0.4285817, -1.373505, 0, 0, 0, 1, 1,
-1.294163, 1.085373, -0.1714288, 0, 0, 0, 1, 1,
-1.289371, -0.4983183, -2.78372, 0, 0, 0, 1, 1,
-1.288151, -0.644409, -2.467618, 1, 1, 1, 1, 1,
-1.28797, 1.065948, -2.556186, 1, 1, 1, 1, 1,
-1.287894, 0.3532614, -0.2713507, 1, 1, 1, 1, 1,
-1.282749, -0.2670759, -2.474563, 1, 1, 1, 1, 1,
-1.267187, -0.1630008, -1.296265, 1, 1, 1, 1, 1,
-1.262424, -1.899303, -2.314652, 1, 1, 1, 1, 1,
-1.253469, -0.3086667, -2.140825, 1, 1, 1, 1, 1,
-1.239711, 1.582878, -0.5423476, 1, 1, 1, 1, 1,
-1.23931, 0.2421375, -1.474684, 1, 1, 1, 1, 1,
-1.234091, 0.3600487, -0.8108878, 1, 1, 1, 1, 1,
-1.22898, -0.3727841, -1.454856, 1, 1, 1, 1, 1,
-1.225716, -0.3368675, -0.8980231, 1, 1, 1, 1, 1,
-1.223358, 0.6025261, -1.236144, 1, 1, 1, 1, 1,
-1.220291, 0.4524327, -1.528307, 1, 1, 1, 1, 1,
-1.214693, -1.418757, -1.246686, 1, 1, 1, 1, 1,
-1.214126, -0.08524314, -2.049939, 0, 0, 1, 1, 1,
-1.214097, -0.6526765, -0.881421, 1, 0, 0, 1, 1,
-1.212552, 1.523702, -1.180657, 1, 0, 0, 1, 1,
-1.202058, -1.774737, -3.870482, 1, 0, 0, 1, 1,
-1.199036, -0.2676757, -2.872129, 1, 0, 0, 1, 1,
-1.188669, -0.4349545, -1.636187, 1, 0, 0, 1, 1,
-1.177796, -0.1471993, -0.9268913, 0, 0, 0, 1, 1,
-1.176997, 0.287539, -1.173406, 0, 0, 0, 1, 1,
-1.175133, -0.8189762, -0.5735912, 0, 0, 0, 1, 1,
-1.173242, -0.1470546, -2.979689, 0, 0, 0, 1, 1,
-1.171365, -0.2739486, -1.95522, 0, 0, 0, 1, 1,
-1.16704, -0.2478893, -1.822579, 0, 0, 0, 1, 1,
-1.16142, 0.9507987, -1.488898, 0, 0, 0, 1, 1,
-1.152018, 0.9323137, -0.5055767, 1, 1, 1, 1, 1,
-1.135763, 0.3407134, -0.6390516, 1, 1, 1, 1, 1,
-1.118038, 0.6309532, 0.189013, 1, 1, 1, 1, 1,
-1.11288, -0.01750611, -1.167194, 1, 1, 1, 1, 1,
-1.091946, -0.4438436, -2.357424, 1, 1, 1, 1, 1,
-1.088346, 0.8857098, -2.069827, 1, 1, 1, 1, 1,
-1.086548, -0.4930949, -2.613465, 1, 1, 1, 1, 1,
-1.08307, 1.184827, -1.490546, 1, 1, 1, 1, 1,
-1.082631, -0.2012556, -1.512981, 1, 1, 1, 1, 1,
-1.079962, -1.173274, -2.576004, 1, 1, 1, 1, 1,
-1.077306, 1.750669, 0.9784764, 1, 1, 1, 1, 1,
-1.069781, 0.942742, -1.673804, 1, 1, 1, 1, 1,
-1.065967, -0.4483956, -1.378447, 1, 1, 1, 1, 1,
-1.062162, 1.129561, -2.430983, 1, 1, 1, 1, 1,
-1.059981, -0.004859147, -2.213384, 1, 1, 1, 1, 1,
-1.055058, 1.05509, -1.140436, 0, 0, 1, 1, 1,
-1.046445, -1.273357, -0.8335354, 1, 0, 0, 1, 1,
-1.046242, 0.07048139, -1.942494, 1, 0, 0, 1, 1,
-1.040175, -1.061474, -2.448972, 1, 0, 0, 1, 1,
-1.037812, 1.298234, -0.3771494, 1, 0, 0, 1, 1,
-1.035066, 0.9242653, 0.06657188, 1, 0, 0, 1, 1,
-1.031099, -0.221217, -0.3897174, 0, 0, 0, 1, 1,
-1.027848, 0.2561692, -3.712889, 0, 0, 0, 1, 1,
-1.02642, 0.7803735, -1.121012, 0, 0, 0, 1, 1,
-1.026279, 0.8122412, -2.221986, 0, 0, 0, 1, 1,
-1.019237, 0.6587574, -1.781103, 0, 0, 0, 1, 1,
-1.012013, 0.2122729, -0.1356932, 0, 0, 0, 1, 1,
-1.011252, 0.01034031, -1.136109, 0, 0, 0, 1, 1,
-1.009451, -0.5356405, -0.9178354, 1, 1, 1, 1, 1,
-1.007836, -0.4935135, -2.415508, 1, 1, 1, 1, 1,
-1.004854, 0.7464681, -1.307852, 1, 1, 1, 1, 1,
-0.9963666, 0.2499324, -1.178906, 1, 1, 1, 1, 1,
-0.9922013, 0.7790495, -0.9721248, 1, 1, 1, 1, 1,
-0.9921435, 0.7356704, -0.4018396, 1, 1, 1, 1, 1,
-0.9892377, -2.11351, -1.808816, 1, 1, 1, 1, 1,
-0.9877713, 0.1039061, -1.068431, 1, 1, 1, 1, 1,
-0.9831404, -0.88199, -2.471526, 1, 1, 1, 1, 1,
-0.9744182, -2.154088, -3.516677, 1, 1, 1, 1, 1,
-0.9736234, -1.559875, -4.177033, 1, 1, 1, 1, 1,
-0.9716182, 1.045105, 0.5449671, 1, 1, 1, 1, 1,
-0.9706239, 0.7170885, -1.761849, 1, 1, 1, 1, 1,
-0.9648046, 1.338635, -0.1299525, 1, 1, 1, 1, 1,
-0.9642981, 0.8995534, -0.3232887, 1, 1, 1, 1, 1,
-0.9632989, 0.7502294, -1.637698, 0, 0, 1, 1, 1,
-0.9594955, 1.125593, -0.04911388, 1, 0, 0, 1, 1,
-0.9553586, -1.014889, -2.524474, 1, 0, 0, 1, 1,
-0.9528994, -0.6499082, -1.871842, 1, 0, 0, 1, 1,
-0.9527466, -0.9410551, -3.403781, 1, 0, 0, 1, 1,
-0.9475634, 0.1202321, -0.7296553, 1, 0, 0, 1, 1,
-0.944743, 0.05944388, -1.380364, 0, 0, 0, 1, 1,
-0.9445741, -0.6913632, -2.610243, 0, 0, 0, 1, 1,
-0.9316454, 1.304039, -2.691286, 0, 0, 0, 1, 1,
-0.931065, 0.3728795, -1.503166, 0, 0, 0, 1, 1,
-0.925786, 0.05941453, 0.3703659, 0, 0, 0, 1, 1,
-0.9175187, -0.3540748, -2.224908, 0, 0, 0, 1, 1,
-0.9171344, 0.8717769, -0.6285563, 0, 0, 0, 1, 1,
-0.9103527, 0.6585184, -4.082385, 1, 1, 1, 1, 1,
-0.9082514, -0.3802519, -0.2912931, 1, 1, 1, 1, 1,
-0.9063684, -0.6855125, -2.724525, 1, 1, 1, 1, 1,
-0.9043145, -0.5209875, -3.848921, 1, 1, 1, 1, 1,
-0.9042547, -0.2682645, -2.170331, 1, 1, 1, 1, 1,
-0.9026182, -0.3952398, -1.512074, 1, 1, 1, 1, 1,
-0.8996277, -1.171932, -5.026013, 1, 1, 1, 1, 1,
-0.8931326, 0.4253574, -0.8518619, 1, 1, 1, 1, 1,
-0.8851192, 2.36601, -1.348291, 1, 1, 1, 1, 1,
-0.8838897, -0.02144415, -1.703939, 1, 1, 1, 1, 1,
-0.8837475, 1.322413, -0.02878439, 1, 1, 1, 1, 1,
-0.8834976, 0.8309987, 1.989294, 1, 1, 1, 1, 1,
-0.8769931, -1.74613, -2.433949, 1, 1, 1, 1, 1,
-0.876635, 2.778423, -1.171755, 1, 1, 1, 1, 1,
-0.8734025, 0.03462849, -1.473344, 1, 1, 1, 1, 1,
-0.8678293, -0.4083843, -1.984522, 0, 0, 1, 1, 1,
-0.8625364, -0.5846882, -2.343286, 1, 0, 0, 1, 1,
-0.8612142, -0.6918042, -2.500651, 1, 0, 0, 1, 1,
-0.8536656, -0.3921501, -1.969824, 1, 0, 0, 1, 1,
-0.8443975, -1.574897, -1.707263, 1, 0, 0, 1, 1,
-0.8395765, 1.443917, -0.5757303, 1, 0, 0, 1, 1,
-0.8337661, 0.08641343, -0.7095253, 0, 0, 0, 1, 1,
-0.8335972, -1.054613, -4.62037, 0, 0, 0, 1, 1,
-0.8299685, -0.1684652, -2.326079, 0, 0, 0, 1, 1,
-0.8298638, 0.7141712, -0.3917034, 0, 0, 0, 1, 1,
-0.829734, -1.327402, -2.989357, 0, 0, 0, 1, 1,
-0.8243359, -1.967196, -2.860063, 0, 0, 0, 1, 1,
-0.8224296, -0.7063629, -1.525671, 0, 0, 0, 1, 1,
-0.8151871, 1.042444, -0.7038767, 1, 1, 1, 1, 1,
-0.8136883, 1.656139, 1.383714, 1, 1, 1, 1, 1,
-0.8093481, 0.724026, 0.02616535, 1, 1, 1, 1, 1,
-0.7980433, 0.7601397, -1.789362, 1, 1, 1, 1, 1,
-0.7978233, 2.261088, 0.07759699, 1, 1, 1, 1, 1,
-0.7961714, -0.9336767, -1.456543, 1, 1, 1, 1, 1,
-0.7958673, 0.105744, -0.5798777, 1, 1, 1, 1, 1,
-0.794144, 0.7578071, -0.7034277, 1, 1, 1, 1, 1,
-0.7926653, 0.3249507, -1.028879, 1, 1, 1, 1, 1,
-0.7923736, -1.42007, -2.509323, 1, 1, 1, 1, 1,
-0.7920832, -0.3800759, -5.161961, 1, 1, 1, 1, 1,
-0.7917861, -1.019455, -1.606269, 1, 1, 1, 1, 1,
-0.7838072, -0.4886015, -2.305476, 1, 1, 1, 1, 1,
-0.7820109, -1.027517, -0.3504252, 1, 1, 1, 1, 1,
-0.7690797, -0.08251053, -1.031623, 1, 1, 1, 1, 1,
-0.7665174, -0.2635138, -1.829545, 0, 0, 1, 1, 1,
-0.7484924, 1.807206, 0.5831175, 1, 0, 0, 1, 1,
-0.7458876, -1.428416, -4.391056, 1, 0, 0, 1, 1,
-0.7387499, 0.07321036, -1.945717, 1, 0, 0, 1, 1,
-0.7382718, 1.283111, -0.8371237, 1, 0, 0, 1, 1,
-0.7375951, -1.077293, -1.016597, 1, 0, 0, 1, 1,
-0.7363101, 1.075354, -0.8909183, 0, 0, 0, 1, 1,
-0.729166, 0.5117221, -1.767705, 0, 0, 0, 1, 1,
-0.7287781, -0.05654984, -2.299267, 0, 0, 0, 1, 1,
-0.722235, 0.7122269, -0.4342689, 0, 0, 0, 1, 1,
-0.7193037, 0.09844839, -2.544637, 0, 0, 0, 1, 1,
-0.7184523, 0.2853153, -0.8650046, 0, 0, 0, 1, 1,
-0.7164031, -1.52246, -3.066417, 0, 0, 0, 1, 1,
-0.7154254, 1.193286, 1.018412, 1, 1, 1, 1, 1,
-0.7103775, -0.8805863, -2.769554, 1, 1, 1, 1, 1,
-0.7031847, 0.133804, -1.461694, 1, 1, 1, 1, 1,
-0.7027628, 0.5589753, -1.714231, 1, 1, 1, 1, 1,
-0.6957337, 0.08036494, -2.144706, 1, 1, 1, 1, 1,
-0.6890475, -0.2212521, -2.052903, 1, 1, 1, 1, 1,
-0.6837643, -0.4740659, -1.497517, 1, 1, 1, 1, 1,
-0.6832193, -1.484937, -5.217819, 1, 1, 1, 1, 1,
-0.6828193, 0.5277819, 0.6323882, 1, 1, 1, 1, 1,
-0.682065, -0.3117272, -2.155657, 1, 1, 1, 1, 1,
-0.6811342, -0.9197773, -4.171686, 1, 1, 1, 1, 1,
-0.6779466, 0.2065211, -0.1030775, 1, 1, 1, 1, 1,
-0.677911, 1.216289, -0.2799133, 1, 1, 1, 1, 1,
-0.6753782, 0.07173465, -2.940361, 1, 1, 1, 1, 1,
-0.6748768, 0.4851834, 0.7425373, 1, 1, 1, 1, 1,
-0.6732063, -0.8148769, -1.377095, 0, 0, 1, 1, 1,
-0.6726276, 0.07440592, -0.9129786, 1, 0, 0, 1, 1,
-0.672618, -1.670247, -2.187255, 1, 0, 0, 1, 1,
-0.6685144, 0.5759894, 1.235953, 1, 0, 0, 1, 1,
-0.6497694, 0.4069084, -0.8541986, 1, 0, 0, 1, 1,
-0.6492792, -0.2882525, -1.201288, 1, 0, 0, 1, 1,
-0.6443438, -0.6612923, -2.233764, 0, 0, 0, 1, 1,
-0.6430529, 1.012871, -0.5796752, 0, 0, 0, 1, 1,
-0.6423, 0.8139234, 1.58272, 0, 0, 0, 1, 1,
-0.6420717, 1.943764, -0.5949345, 0, 0, 0, 1, 1,
-0.6403209, 0.1736333, -0.5687391, 0, 0, 0, 1, 1,
-0.6360588, 0.4860234, 0.7759101, 0, 0, 0, 1, 1,
-0.6254088, 0.6403534, -0.4471287, 0, 0, 0, 1, 1,
-0.6101193, 0.02927816, -1.192119, 1, 1, 1, 1, 1,
-0.6093212, -0.7522318, -3.678612, 1, 1, 1, 1, 1,
-0.6048597, 0.8341591, -1.259517, 1, 1, 1, 1, 1,
-0.5981221, 0.4230089, -0.3723961, 1, 1, 1, 1, 1,
-0.5949808, 0.4870253, -0.3494648, 1, 1, 1, 1, 1,
-0.5892273, -1.060837, -2.482136, 1, 1, 1, 1, 1,
-0.5883336, -1.015407, -1.931026, 1, 1, 1, 1, 1,
-0.5772628, -2.233008, -2.336716, 1, 1, 1, 1, 1,
-0.5769861, -0.9647714, -0.6800756, 1, 1, 1, 1, 1,
-0.5711935, -0.5978692, -2.560248, 1, 1, 1, 1, 1,
-0.5703104, -1.677219, -3.892862, 1, 1, 1, 1, 1,
-0.5679235, 0.5786078, -2.311298, 1, 1, 1, 1, 1,
-0.5648723, -2.484255, -3.802336, 1, 1, 1, 1, 1,
-0.5635604, 0.1197119, -2.218362, 1, 1, 1, 1, 1,
-0.5594023, 0.2971754, -0.6821454, 1, 1, 1, 1, 1,
-0.5591658, 1.217985, -0.1482389, 0, 0, 1, 1, 1,
-0.5538496, -0.8038774, -2.491641, 1, 0, 0, 1, 1,
-0.5516282, 0.6966305, -0.07246721, 1, 0, 0, 1, 1,
-0.5507271, -0.7746441, -0.9699786, 1, 0, 0, 1, 1,
-0.5454307, -0.3256151, -0.9574159, 1, 0, 0, 1, 1,
-0.5453301, 1.263014, -0.3083263, 1, 0, 0, 1, 1,
-0.5447299, 1.492211, -0.07937535, 0, 0, 0, 1, 1,
-0.5441676, 1.285879, -1.231477, 0, 0, 0, 1, 1,
-0.543961, -0.4281935, 0.1108976, 0, 0, 0, 1, 1,
-0.5417166, 1.651619, -0.5182873, 0, 0, 0, 1, 1,
-0.5366053, -1.985724, -3.229145, 0, 0, 0, 1, 1,
-0.5278888, 1.354082, 0.4318576, 0, 0, 0, 1, 1,
-0.5271112, -2.371914, -2.746137, 0, 0, 0, 1, 1,
-0.5263278, 0.0613068, -2.039089, 1, 1, 1, 1, 1,
-0.5260433, -0.126312, -3.450013, 1, 1, 1, 1, 1,
-0.5245288, 0.3108805, -0.605036, 1, 1, 1, 1, 1,
-0.5182821, 0.5037552, -0.952202, 1, 1, 1, 1, 1,
-0.5159726, 0.4059246, -0.8070729, 1, 1, 1, 1, 1,
-0.5151145, 1.072909, -1.54266, 1, 1, 1, 1, 1,
-0.5103924, -1.015764, -3.985147, 1, 1, 1, 1, 1,
-0.5098097, 1.061504, -2.149278, 1, 1, 1, 1, 1,
-0.5073636, -0.5434721, -3.567311, 1, 1, 1, 1, 1,
-0.5071691, -0.5091743, -1.649252, 1, 1, 1, 1, 1,
-0.5030092, -1.714621, -2.278131, 1, 1, 1, 1, 1,
-0.4990596, 1.618545, -0.8643994, 1, 1, 1, 1, 1,
-0.4982396, 0.3862887, -0.2612838, 1, 1, 1, 1, 1,
-0.4951066, 0.242066, -2.066711, 1, 1, 1, 1, 1,
-0.4920572, 0.3781457, -0.5798687, 1, 1, 1, 1, 1,
-0.4916135, -2.102773, -2.640524, 0, 0, 1, 1, 1,
-0.4911231, 1.358331, -0.919514, 1, 0, 0, 1, 1,
-0.4900808, 0.02058973, -2.059719, 1, 0, 0, 1, 1,
-0.4889214, -0.05846187, -1.738814, 1, 0, 0, 1, 1,
-0.4871094, -1.885556, -3.072954, 1, 0, 0, 1, 1,
-0.4861239, -0.3309803, -1.676045, 1, 0, 0, 1, 1,
-0.4844947, -0.6390851, -2.820982, 0, 0, 0, 1, 1,
-0.48399, -0.9415378, -2.930432, 0, 0, 0, 1, 1,
-0.4795561, 0.3509254, 0.1297194, 0, 0, 0, 1, 1,
-0.4774729, -1.146295, -0.4600666, 0, 0, 0, 1, 1,
-0.4750727, -0.7913361, -2.699378, 0, 0, 0, 1, 1,
-0.4744017, -0.3992033, -3.747059, 0, 0, 0, 1, 1,
-0.4742028, -1.827592, -3.441258, 0, 0, 0, 1, 1,
-0.467535, -0.9585893, -4.628855, 1, 1, 1, 1, 1,
-0.4602215, -0.046437, -0.5776424, 1, 1, 1, 1, 1,
-0.4599645, 1.402858, -1.218692, 1, 1, 1, 1, 1,
-0.4547846, -1.022673, -1.569815, 1, 1, 1, 1, 1,
-0.451763, 0.1768062, -3.151927, 1, 1, 1, 1, 1,
-0.4512049, 0.3359465, -0.9619421, 1, 1, 1, 1, 1,
-0.4470841, -1.707028, -2.5863, 1, 1, 1, 1, 1,
-0.446395, -1.454349, -3.672364, 1, 1, 1, 1, 1,
-0.4462199, 0.01054385, -2.547973, 1, 1, 1, 1, 1,
-0.4427926, -1.559567, -1.595132, 1, 1, 1, 1, 1,
-0.4374194, -0.9732823, -2.580294, 1, 1, 1, 1, 1,
-0.4361393, 0.5388783, -0.4598403, 1, 1, 1, 1, 1,
-0.4356959, -0.1528921, -4.103173, 1, 1, 1, 1, 1,
-0.4354592, 1.025477, -2.523245, 1, 1, 1, 1, 1,
-0.4342769, 0.2279444, -3.418949, 1, 1, 1, 1, 1,
-0.4323726, 2.287494, 0.3644873, 0, 0, 1, 1, 1,
-0.432099, -0.2974478, -2.427193, 1, 0, 0, 1, 1,
-0.4288542, 1.080113, 2.017561, 1, 0, 0, 1, 1,
-0.4265656, 0.3341973, -1.420942, 1, 0, 0, 1, 1,
-0.4248258, 0.9633642, 0.4551391, 1, 0, 0, 1, 1,
-0.4232405, -0.7890557, -3.996543, 1, 0, 0, 1, 1,
-0.4226073, 1.547048, -0.02602386, 0, 0, 0, 1, 1,
-0.4220514, -0.5274668, -3.206413, 0, 0, 0, 1, 1,
-0.421906, -0.3211674, -1.741744, 0, 0, 0, 1, 1,
-0.4154988, -1.150164, -1.99291, 0, 0, 0, 1, 1,
-0.4128769, 1.359627, -0.0507374, 0, 0, 0, 1, 1,
-0.4094263, 1.39488, 0.8396299, 0, 0, 0, 1, 1,
-0.409312, -0.132712, -1.932449, 0, 0, 0, 1, 1,
-0.4020998, -0.5496296, -2.41237, 1, 1, 1, 1, 1,
-0.4011887, 0.1391064, -1.377029, 1, 1, 1, 1, 1,
-0.4005392, -1.113282, -3.222164, 1, 1, 1, 1, 1,
-0.3974807, 0.1724122, -0.9069883, 1, 1, 1, 1, 1,
-0.396264, 0.5220216, -1.222479, 1, 1, 1, 1, 1,
-0.3896273, -0.9321074, -2.774429, 1, 1, 1, 1, 1,
-0.3891393, -1.544036, -3.436339, 1, 1, 1, 1, 1,
-0.3853315, 1.258981, 1.414821, 1, 1, 1, 1, 1,
-0.3762985, 0.6607748, 0.7197746, 1, 1, 1, 1, 1,
-0.3677246, -0.7830662, -4.26854, 1, 1, 1, 1, 1,
-0.359734, -0.1617028, -2.797258, 1, 1, 1, 1, 1,
-0.3547374, -1.902976, -1.601956, 1, 1, 1, 1, 1,
-0.351049, 0.6670712, 1.429909, 1, 1, 1, 1, 1,
-0.3427089, 0.1178402, -2.56256, 1, 1, 1, 1, 1,
-0.3391936, 1.654027, 0.350126, 1, 1, 1, 1, 1,
-0.3355955, 1.368828, -0.4587255, 0, 0, 1, 1, 1,
-0.3337582, -0.755357, -3.148138, 1, 0, 0, 1, 1,
-0.3316842, -1.237043, -3.164068, 1, 0, 0, 1, 1,
-0.3301468, 0.2175551, -1.29021, 1, 0, 0, 1, 1,
-0.3274137, 1.202563, -0.6435366, 1, 0, 0, 1, 1,
-0.3264215, 0.08860306, -1.522552, 1, 0, 0, 1, 1,
-0.3258495, -1.830678, -4.138591, 0, 0, 0, 1, 1,
-0.3234322, -0.1640868, -3.045914, 0, 0, 0, 1, 1,
-0.3233694, -1.503432, -3.05685, 0, 0, 0, 1, 1,
-0.3201672, 1.326088, -0.2587301, 0, 0, 0, 1, 1,
-0.3163182, -0.5300168, -2.229204, 0, 0, 0, 1, 1,
-0.3114257, -0.5510458, -2.572567, 0, 0, 0, 1, 1,
-0.3085465, -0.150747, 0.5309671, 0, 0, 0, 1, 1,
-0.3070543, -2.032788, -3.17286, 1, 1, 1, 1, 1,
-0.2966247, -1.814973, -4.890089, 1, 1, 1, 1, 1,
-0.2946338, 0.5735438, -0.8360429, 1, 1, 1, 1, 1,
-0.2944984, -0.01434261, -2.289495, 1, 1, 1, 1, 1,
-0.2935253, -0.8785077, -2.8904, 1, 1, 1, 1, 1,
-0.2930794, -0.3283101, -1.905574, 1, 1, 1, 1, 1,
-0.2909777, -0.161301, -3.409328, 1, 1, 1, 1, 1,
-0.2899747, 0.002829844, -1.198737, 1, 1, 1, 1, 1,
-0.288349, 1.545471, 0.4749846, 1, 1, 1, 1, 1,
-0.2880878, -0.07722925, -0.9438976, 1, 1, 1, 1, 1,
-0.2830994, -0.02759335, -2.078443, 1, 1, 1, 1, 1,
-0.2814836, -0.3360034, -2.497559, 1, 1, 1, 1, 1,
-0.2805791, -0.6695349, -2.556972, 1, 1, 1, 1, 1,
-0.2771684, 0.9909867, -0.4658519, 1, 1, 1, 1, 1,
-0.2759024, -1.370166, -4.076174, 1, 1, 1, 1, 1,
-0.2747877, -0.1153172, -2.014847, 0, 0, 1, 1, 1,
-0.273131, 1.333906, 0.3312344, 1, 0, 0, 1, 1,
-0.2730782, 1.952358, 0.4414838, 1, 0, 0, 1, 1,
-0.2703765, 0.2000659, -1.574775, 1, 0, 0, 1, 1,
-0.2696168, -0.1578477, -1.844601, 1, 0, 0, 1, 1,
-0.257638, 0.3677469, -1.66002, 1, 0, 0, 1, 1,
-0.2532087, 0.1217982, 0.04187702, 0, 0, 0, 1, 1,
-0.2531388, 2.438596, -1.005315, 0, 0, 0, 1, 1,
-0.2420314, 1.824699, 0.1832314, 0, 0, 0, 1, 1,
-0.2402185, 0.8492402, 0.468797, 0, 0, 0, 1, 1,
-0.2383686, 0.2156662, -1.849508, 0, 0, 0, 1, 1,
-0.2380905, 0.04833028, -0.9766784, 0, 0, 0, 1, 1,
-0.2370769, -1.174439, -3.319462, 0, 0, 0, 1, 1,
-0.2332265, -1.202645, -4.926204, 1, 1, 1, 1, 1,
-0.2320867, 0.3791995, -0.1280536, 1, 1, 1, 1, 1,
-0.2235044, -0.2427673, -2.837945, 1, 1, 1, 1, 1,
-0.223042, 0.07331245, -0.6973944, 1, 1, 1, 1, 1,
-0.2204208, -0.5443641, -1.543901, 1, 1, 1, 1, 1,
-0.2183664, 0.2751903, -0.6459637, 1, 1, 1, 1, 1,
-0.2118969, -0.04657595, -1.038172, 1, 1, 1, 1, 1,
-0.2104153, 0.6958508, 1.605721, 1, 1, 1, 1, 1,
-0.210201, 0.01340863, -1.296997, 1, 1, 1, 1, 1,
-0.2079029, -1.441725, -3.054411, 1, 1, 1, 1, 1,
-0.205324, 0.2876139, -1.123631, 1, 1, 1, 1, 1,
-0.2047853, -0.4364183, -3.385551, 1, 1, 1, 1, 1,
-0.2040277, -0.2509605, -2.200505, 1, 1, 1, 1, 1,
-0.2034866, 0.2070079, 0.6943218, 1, 1, 1, 1, 1,
-0.1986555, -0.4504156, -1.790131, 1, 1, 1, 1, 1,
-0.1957336, -1.352271, -3.930488, 0, 0, 1, 1, 1,
-0.1917826, -0.3414023, -2.166949, 1, 0, 0, 1, 1,
-0.1915199, -0.1102135, -1.417017, 1, 0, 0, 1, 1,
-0.1914136, -1.057323, -2.764584, 1, 0, 0, 1, 1,
-0.1880267, -1.337903, -1.607352, 1, 0, 0, 1, 1,
-0.1835755, 0.02923752, -2.128671, 1, 0, 0, 1, 1,
-0.1835106, -0.3538459, -2.595916, 0, 0, 0, 1, 1,
-0.181144, -0.4628915, -3.065716, 0, 0, 0, 1, 1,
-0.1798666, 1.054717, -1.084202, 0, 0, 0, 1, 1,
-0.1757358, -1.119387, -1.89478, 0, 0, 0, 1, 1,
-0.1717322, -1.212575, -3.473234, 0, 0, 0, 1, 1,
-0.1662399, -0.9410287, -2.709018, 0, 0, 0, 1, 1,
-0.1625045, 0.9093468, -0.8100314, 0, 0, 0, 1, 1,
-0.1561866, -0.6958914, -2.269125, 1, 1, 1, 1, 1,
-0.1556919, 0.5227945, 1.51419, 1, 1, 1, 1, 1,
-0.1554895, 1.828938, -1.501885, 1, 1, 1, 1, 1,
-0.1506078, -0.7979224, -3.124717, 1, 1, 1, 1, 1,
-0.1491845, 1.426133, -1.219356, 1, 1, 1, 1, 1,
-0.1475764, 0.2262361, -0.4325626, 1, 1, 1, 1, 1,
-0.1466011, 0.2057803, -0.4894435, 1, 1, 1, 1, 1,
-0.1437896, 0.392221, -0.07951728, 1, 1, 1, 1, 1,
-0.1327194, -0.07778387, -2.112673, 1, 1, 1, 1, 1,
-0.1321659, -1.25562, -2.387751, 1, 1, 1, 1, 1,
-0.1312927, -0.1450572, -1.598069, 1, 1, 1, 1, 1,
-0.1303671, 0.1927396, 0.8624123, 1, 1, 1, 1, 1,
-0.1302111, -0.4188623, -3.545465, 1, 1, 1, 1, 1,
-0.1298987, -1.0412, -3.533217, 1, 1, 1, 1, 1,
-0.1290147, -0.5102419, -2.919758, 1, 1, 1, 1, 1,
-0.128733, 0.2820105, 0.02550003, 0, 0, 1, 1, 1,
-0.1268656, -0.8935748, -3.424323, 1, 0, 0, 1, 1,
-0.1254894, -1.060071, -3.109524, 1, 0, 0, 1, 1,
-0.1236724, 0.1881676, -1.225935, 1, 0, 0, 1, 1,
-0.1228587, -1.568804, -2.66375, 1, 0, 0, 1, 1,
-0.1223879, 0.8922262, -1.256113, 1, 0, 0, 1, 1,
-0.1164979, 1.377803, 0.3686543, 0, 0, 0, 1, 1,
-0.1124775, 0.409028, -1.134251, 0, 0, 0, 1, 1,
-0.1120836, 2.447311, 1.436173, 0, 0, 0, 1, 1,
-0.1112464, 0.7635275, 0.3631742, 0, 0, 0, 1, 1,
-0.1095357, 0.1590601, 0.2985554, 0, 0, 0, 1, 1,
-0.1075641, -0.4642209, -1.312419, 0, 0, 0, 1, 1,
-0.1073476, -0.03483091, -1.014967, 0, 0, 0, 1, 1,
-0.1065323, -0.1853892, -2.860176, 1, 1, 1, 1, 1,
-0.1060233, -0.4410696, -3.129983, 1, 1, 1, 1, 1,
-0.1018618, -0.9744611, -2.238129, 1, 1, 1, 1, 1,
-0.09538066, 0.1994122, -0.4268147, 1, 1, 1, 1, 1,
-0.09325383, 0.8785574, -1.211399, 1, 1, 1, 1, 1,
-0.09225427, 0.8532404, -0.8386677, 1, 1, 1, 1, 1,
-0.08833224, 1.121547, -1.07144, 1, 1, 1, 1, 1,
-0.08537583, -0.2803394, -3.182083, 1, 1, 1, 1, 1,
-0.08239768, 1.112347, -0.7683992, 1, 1, 1, 1, 1,
-0.08121526, -0.6329259, -3.231347, 1, 1, 1, 1, 1,
-0.07836389, 0.4022076, 0.3325938, 1, 1, 1, 1, 1,
-0.0762345, 0.7552925, 1.722443, 1, 1, 1, 1, 1,
-0.07116366, 0.5578563, -1.236166, 1, 1, 1, 1, 1,
-0.06664851, -2.369978, -3.395126, 1, 1, 1, 1, 1,
-0.06313844, 0.212101, -0.4650871, 1, 1, 1, 1, 1,
-0.05789234, -0.8949232, -3.434486, 0, 0, 1, 1, 1,
-0.05598577, 0.2344113, -1.797538, 1, 0, 0, 1, 1,
-0.05276679, -1.089562, -3.033371, 1, 0, 0, 1, 1,
-0.04728375, -0.6857036, -1.498756, 1, 0, 0, 1, 1,
-0.04559295, 0.299156, -1.777784, 1, 0, 0, 1, 1,
-0.0449901, -1.05402, -3.614609, 1, 0, 0, 1, 1,
-0.0438417, -0.9745537, -2.863404, 0, 0, 0, 1, 1,
-0.04044909, 0.5986243, 0.8732994, 0, 0, 0, 1, 1,
-0.03779175, 0.352664, 2.041882, 0, 0, 0, 1, 1,
-0.03232426, -0.4915214, -4.620886, 0, 0, 0, 1, 1,
-0.0306001, 0.4279487, 0.9702868, 0, 0, 0, 1, 1,
-0.02976447, 0.7436218, 0.03919535, 0, 0, 0, 1, 1,
-0.02812575, 0.06338457, -1.746863, 0, 0, 0, 1, 1,
-0.02570248, 0.1205033, -0.0171556, 1, 1, 1, 1, 1,
-0.02174005, -0.1137476, -0.5363125, 1, 1, 1, 1, 1,
-0.01699584, 0.4466308, 0.8678111, 1, 1, 1, 1, 1,
-0.0152986, -1.51688, -4.397419, 1, 1, 1, 1, 1,
-0.008592412, -0.6417917, -2.065345, 1, 1, 1, 1, 1,
-0.006180222, -0.1282055, -3.83922, 1, 1, 1, 1, 1,
0.008267594, -1.478431, 1.702446, 1, 1, 1, 1, 1,
0.01462027, 0.2620199, -0.04157464, 1, 1, 1, 1, 1,
0.01667511, 0.8394068, 0.3608672, 1, 1, 1, 1, 1,
0.02719384, 1.295053, -1.172927, 1, 1, 1, 1, 1,
0.0279055, 0.9941955, 0.8293181, 1, 1, 1, 1, 1,
0.03414977, 0.2182798, 0.02358156, 1, 1, 1, 1, 1,
0.03660008, 0.1072151, 2.536265, 1, 1, 1, 1, 1,
0.04553111, 1.063943, 1.927221, 1, 1, 1, 1, 1,
0.05128663, 1.10451, 0.3779017, 1, 1, 1, 1, 1,
0.05376157, 0.1090691, 1.198173, 0, 0, 1, 1, 1,
0.05586921, -0.973162, 3.230653, 1, 0, 0, 1, 1,
0.05726285, -1.230632, 4.065376, 1, 0, 0, 1, 1,
0.05899498, 0.2705568, 0.1983422, 1, 0, 0, 1, 1,
0.06261685, -0.03671708, 3.106406, 1, 0, 0, 1, 1,
0.06455708, 1.224217, 1.674583, 1, 0, 0, 1, 1,
0.06857255, 0.5581736, -1.101412, 0, 0, 0, 1, 1,
0.07316283, 0.1313434, 1.364452, 0, 0, 0, 1, 1,
0.07715922, 1.358066, -2.007761, 0, 0, 0, 1, 1,
0.07752914, -0.8424038, 3.464785, 0, 0, 0, 1, 1,
0.08409449, -0.1395057, 2.445361, 0, 0, 0, 1, 1,
0.08452408, -0.1662357, 3.889524, 0, 0, 0, 1, 1,
0.09136458, 1.755195, -0.06677105, 0, 0, 0, 1, 1,
0.09143963, 0.9945941, -0.9820294, 1, 1, 1, 1, 1,
0.09219007, 1.029068, 0.2929385, 1, 1, 1, 1, 1,
0.09287494, -0.8956832, 2.6869, 1, 1, 1, 1, 1,
0.09377358, 0.6656452, -0.217216, 1, 1, 1, 1, 1,
0.09439792, 0.3953817, -0.6165347, 1, 1, 1, 1, 1,
0.09604552, 0.5710973, -0.06911325, 1, 1, 1, 1, 1,
0.09664841, 0.3838373, 0.3477097, 1, 1, 1, 1, 1,
0.101051, -1.067488, 2.348957, 1, 1, 1, 1, 1,
0.101324, 0.603161, 0.4168617, 1, 1, 1, 1, 1,
0.1048054, 1.352236, 3.14658, 1, 1, 1, 1, 1,
0.1151791, 0.9939306, 1.252052, 1, 1, 1, 1, 1,
0.1166225, 1.909744, -0.3815526, 1, 1, 1, 1, 1,
0.1191583, -1.528404, 3.100902, 1, 1, 1, 1, 1,
0.119726, -1.120201, 2.36429, 1, 1, 1, 1, 1,
0.1245248, 0.0165735, 1.291677, 1, 1, 1, 1, 1,
0.1261763, 0.4673846, 0.9247229, 0, 0, 1, 1, 1,
0.1275526, 1.349318, -0.1775089, 1, 0, 0, 1, 1,
0.1339251, 0.5405739, -0.5343412, 1, 0, 0, 1, 1,
0.1346112, -0.1029933, 1.141305, 1, 0, 0, 1, 1,
0.1372627, 1.558849, 0.1844247, 1, 0, 0, 1, 1,
0.1373421, -0.244181, 3.016907, 1, 0, 0, 1, 1,
0.1395544, -1.102478, 2.058404, 0, 0, 0, 1, 1,
0.1465115, 1.778099, -0.8462502, 0, 0, 0, 1, 1,
0.1478331, -1.306961, 1.89874, 0, 0, 0, 1, 1,
0.1559703, -0.9235529, 4.761126, 0, 0, 0, 1, 1,
0.1561197, -0.3057782, 2.083616, 0, 0, 0, 1, 1,
0.1581389, -0.7619165, 1.499712, 0, 0, 0, 1, 1,
0.1594855, 0.3478552, -0.8437128, 0, 0, 0, 1, 1,
0.1631083, -0.798104, 4.70063, 1, 1, 1, 1, 1,
0.164046, -0.3043504, 4.066842, 1, 1, 1, 1, 1,
0.1661859, -0.2427212, 1.765447, 1, 1, 1, 1, 1,
0.1822811, 0.8036864, 0.06162036, 1, 1, 1, 1, 1,
0.1857839, 0.04897486, 0.889226, 1, 1, 1, 1, 1,
0.1885563, -0.4301334, 3.378299, 1, 1, 1, 1, 1,
0.2055255, 0.05327463, 1.850171, 1, 1, 1, 1, 1,
0.2075239, -1.19661, 2.248201, 1, 1, 1, 1, 1,
0.2079822, -1.085642, 3.339717, 1, 1, 1, 1, 1,
0.2094888, 1.661057, 0.952406, 1, 1, 1, 1, 1,
0.2129543, 0.530973, -0.2152805, 1, 1, 1, 1, 1,
0.216965, 1.375764, 0.429142, 1, 1, 1, 1, 1,
0.2182845, -0.01261133, 2.30588, 1, 1, 1, 1, 1,
0.221681, 0.1279377, 0.04238391, 1, 1, 1, 1, 1,
0.239038, 0.8999649, 0.6212599, 1, 1, 1, 1, 1,
0.2404242, 1.219478, -0.165838, 0, 0, 1, 1, 1,
0.2411024, -0.5165912, 2.183472, 1, 0, 0, 1, 1,
0.2428984, -0.8690481, 1.691483, 1, 0, 0, 1, 1,
0.2441496, 0.2554861, 2.521588, 1, 0, 0, 1, 1,
0.2469676, 0.1471203, 1.145481, 1, 0, 0, 1, 1,
0.24937, -2.0128, 3.830103, 1, 0, 0, 1, 1,
0.2501426, -0.7430163, 1.905276, 0, 0, 0, 1, 1,
0.2505714, -0.1681011, 1.2461, 0, 0, 0, 1, 1,
0.2514762, 0.6484647, 0.03601525, 0, 0, 0, 1, 1,
0.2542395, 0.2753708, 2.037269, 0, 0, 0, 1, 1,
0.2570708, -1.480596, 3.375898, 0, 0, 0, 1, 1,
0.2588188, 0.5008896, 1.699654, 0, 0, 0, 1, 1,
0.2597589, -0.6346411, 2.672584, 0, 0, 0, 1, 1,
0.2616273, -0.09364117, 2.887802, 1, 1, 1, 1, 1,
0.2626949, -0.4686748, 1.013854, 1, 1, 1, 1, 1,
0.2636539, -1.16085, 1.847599, 1, 1, 1, 1, 1,
0.2644137, 0.474662, 1.038403, 1, 1, 1, 1, 1,
0.2667783, -0.003972652, 2.194574, 1, 1, 1, 1, 1,
0.2677672, -1.23786, 1.138183, 1, 1, 1, 1, 1,
0.27294, 0.981006, 2.12055, 1, 1, 1, 1, 1,
0.2732292, -0.829859, 1.637512, 1, 1, 1, 1, 1,
0.2763828, -0.3606191, 3.948743, 1, 1, 1, 1, 1,
0.276391, -0.1241101, 3.284335, 1, 1, 1, 1, 1,
0.2770558, -1.129645, 3.650124, 1, 1, 1, 1, 1,
0.2790602, -0.5895111, 3.054796, 1, 1, 1, 1, 1,
0.2945963, 1.000561, -0.5154436, 1, 1, 1, 1, 1,
0.294899, -2.073237, 2.413945, 1, 1, 1, 1, 1,
0.2969801, -1.195429, 2.832829, 1, 1, 1, 1, 1,
0.2979196, 0.8610243, 1.210759, 0, 0, 1, 1, 1,
0.2988259, -0.952207, 2.39646, 1, 0, 0, 1, 1,
0.2999576, -1.659745, 3.795398, 1, 0, 0, 1, 1,
0.3022682, -1.893625, 0.9844823, 1, 0, 0, 1, 1,
0.3085595, -0.6290442, 4.609376, 1, 0, 0, 1, 1,
0.3094029, -0.5887114, 2.271442, 1, 0, 0, 1, 1,
0.313432, -0.122654, 2.972503, 0, 0, 0, 1, 1,
0.3147641, -0.8698077, 2.425753, 0, 0, 0, 1, 1,
0.3164485, 0.2695407, 1.082245, 0, 0, 0, 1, 1,
0.320889, 1.51844, 0.03109084, 0, 0, 0, 1, 1,
0.3218859, 0.09508823, 0.07782988, 0, 0, 0, 1, 1,
0.3234624, -0.1143239, 2.721756, 0, 0, 0, 1, 1,
0.3263747, -1.038579, 3.260539, 0, 0, 0, 1, 1,
0.3309524, 0.8970091, 1.809029, 1, 1, 1, 1, 1,
0.336826, 0.1077779, 0.6525428, 1, 1, 1, 1, 1,
0.3386935, -1.140453, 3.444847, 1, 1, 1, 1, 1,
0.3431097, -0.4467158, 3.717985, 1, 1, 1, 1, 1,
0.3455055, 0.2826285, -0.0960652, 1, 1, 1, 1, 1,
0.3465169, 0.9422107, 0.5617042, 1, 1, 1, 1, 1,
0.346546, 0.370255, -0.2603131, 1, 1, 1, 1, 1,
0.3465579, 0.1931997, 0.3540487, 1, 1, 1, 1, 1,
0.3498397, -0.2354922, 2.492801, 1, 1, 1, 1, 1,
0.3562343, -1.601105, 3.084589, 1, 1, 1, 1, 1,
0.3571752, -0.5676076, 3.746747, 1, 1, 1, 1, 1,
0.3590794, 0.1775742, -1.02175, 1, 1, 1, 1, 1,
0.359749, 0.3261137, -0.06657756, 1, 1, 1, 1, 1,
0.3628993, 0.7052975, 0.928039, 1, 1, 1, 1, 1,
0.3675897, -1.130375, 2.732084, 1, 1, 1, 1, 1,
0.3684124, -0.4259464, 4.407197, 0, 0, 1, 1, 1,
0.3711012, 1.973651, -1.936431, 1, 0, 0, 1, 1,
0.3730425, 0.6166767, -1.143721, 1, 0, 0, 1, 1,
0.3758166, -1.101859, 1.538935, 1, 0, 0, 1, 1,
0.3795019, 1.035378, -0.1611429, 1, 0, 0, 1, 1,
0.3803858, 0.8839335, -1.957571, 1, 0, 0, 1, 1,
0.3833802, -0.8609114, 3.441012, 0, 0, 0, 1, 1,
0.3842962, 0.0548909, 0.2114373, 0, 0, 0, 1, 1,
0.3854948, 0.6138665, 0.9342965, 0, 0, 0, 1, 1,
0.387063, -0.8933455, 2.474038, 0, 0, 0, 1, 1,
0.3886927, -1.431322, 2.742866, 0, 0, 0, 1, 1,
0.3921321, 0.9313821, 0.660338, 0, 0, 0, 1, 1,
0.3933675, -0.2816586, 2.988463, 0, 0, 0, 1, 1,
0.3956901, 0.4990578, 0.2049908, 1, 1, 1, 1, 1,
0.3989138, 0.3561018, -0.1950326, 1, 1, 1, 1, 1,
0.4006751, -0.9192904, 2.581195, 1, 1, 1, 1, 1,
0.4031371, 0.129256, 2.290336, 1, 1, 1, 1, 1,
0.4048005, 1.157355, 1.215068, 1, 1, 1, 1, 1,
0.4056595, 0.5241466, 1.435466, 1, 1, 1, 1, 1,
0.4060906, 0.8181342, -0.4302976, 1, 1, 1, 1, 1,
0.4090011, 1.144986, 0.06641617, 1, 1, 1, 1, 1,
0.4112064, -0.6870059, 2.922434, 1, 1, 1, 1, 1,
0.4177487, -0.05546226, 1.257335, 1, 1, 1, 1, 1,
0.4184211, -0.3353296, 2.585413, 1, 1, 1, 1, 1,
0.4223785, 0.915347, 0.4423236, 1, 1, 1, 1, 1,
0.4249857, -0.07198978, 1.228751, 1, 1, 1, 1, 1,
0.4267858, 0.01013436, 1.169922, 1, 1, 1, 1, 1,
0.4350635, 0.4759219, 0.3308991, 1, 1, 1, 1, 1,
0.4433274, -0.6888267, 3.735323, 0, 0, 1, 1, 1,
0.4459263, -1.592348, 2.814204, 1, 0, 0, 1, 1,
0.4482643, 0.4582962, 0.9102711, 1, 0, 0, 1, 1,
0.4524986, -0.3481371, 1.94253, 1, 0, 0, 1, 1,
0.4527871, -2.307494, 3.185015, 1, 0, 0, 1, 1,
0.4611752, -0.3482931, 2.555849, 1, 0, 0, 1, 1,
0.4612863, -1.396481, 2.735514, 0, 0, 0, 1, 1,
0.4614727, 0.3079464, 0.6356497, 0, 0, 0, 1, 1,
0.4635631, 0.642267, -0.09799303, 0, 0, 0, 1, 1,
0.4636165, 1.845715, 1.291814, 0, 0, 0, 1, 1,
0.4661216, -0.8462189, 2.458239, 0, 0, 0, 1, 1,
0.4775107, 0.6635125, 0.2067324, 0, 0, 0, 1, 1,
0.4830962, 0.1705094, 1.714586, 0, 0, 0, 1, 1,
0.4849223, 0.2102285, 0.8838593, 1, 1, 1, 1, 1,
0.4858932, 0.1808407, -0.2360982, 1, 1, 1, 1, 1,
0.4874809, 1.200324, 2.329959, 1, 1, 1, 1, 1,
0.4884374, -1.187884, 2.322086, 1, 1, 1, 1, 1,
0.4921598, -1.288271, 2.664031, 1, 1, 1, 1, 1,
0.4959285, -0.1583073, 4.087642, 1, 1, 1, 1, 1,
0.4977802, -0.4269516, 3.720661, 1, 1, 1, 1, 1,
0.5075744, 1.104195, 0.3561091, 1, 1, 1, 1, 1,
0.5098913, 0.3716832, 0.3205883, 1, 1, 1, 1, 1,
0.5141045, 0.4078912, 1.12731, 1, 1, 1, 1, 1,
0.5183091, -0.7392692, 2.01317, 1, 1, 1, 1, 1,
0.5185289, -0.2864501, 1.053532, 1, 1, 1, 1, 1,
0.5218647, -0.9115053, 3.318914, 1, 1, 1, 1, 1,
0.5345693, -0.1291415, 2.243926, 1, 1, 1, 1, 1,
0.5373757, -0.635094, 1.492265, 1, 1, 1, 1, 1,
0.5395067, -0.3839988, 3.002288, 0, 0, 1, 1, 1,
0.5434425, 0.603189, -0.5344884, 1, 0, 0, 1, 1,
0.5440379, -0.3636623, 2.281157, 1, 0, 0, 1, 1,
0.544065, 1.41147, -1.178214, 1, 0, 0, 1, 1,
0.5489675, -1.009071, 3.889103, 1, 0, 0, 1, 1,
0.5522773, 0.3031271, 2.054065, 1, 0, 0, 1, 1,
0.5527804, -0.0478264, 1.221344, 0, 0, 0, 1, 1,
0.5543503, 0.6890222, 1.469669, 0, 0, 0, 1, 1,
0.5546717, 1.287279, 0.6548306, 0, 0, 0, 1, 1,
0.562543, 1.108193, 2.120275, 0, 0, 0, 1, 1,
0.5660101, 0.7575946, -0.1639402, 0, 0, 0, 1, 1,
0.5679408, -1.295431, 2.912355, 0, 0, 0, 1, 1,
0.5687627, 1.488664, 0.4608878, 0, 0, 0, 1, 1,
0.569221, -0.06133644, 0.3809975, 1, 1, 1, 1, 1,
0.5706278, -0.5740235, 1.191209, 1, 1, 1, 1, 1,
0.5708464, 0.4161615, 1.279921, 1, 1, 1, 1, 1,
0.574263, -1.396525, 3.526692, 1, 1, 1, 1, 1,
0.5749964, -0.1171821, 2.618496, 1, 1, 1, 1, 1,
0.5767149, -0.1729289, 1.201485, 1, 1, 1, 1, 1,
0.5770696, 0.8934854, 2.455684, 1, 1, 1, 1, 1,
0.5787525, -0.8375278, 3.923911, 1, 1, 1, 1, 1,
0.5809566, 1.013493, 1.767011, 1, 1, 1, 1, 1,
0.5815272, -1.718866, 2.046918, 1, 1, 1, 1, 1,
0.58605, 0.166182, 1.513076, 1, 1, 1, 1, 1,
0.5869339, 1.371741, -0.4054474, 1, 1, 1, 1, 1,
0.5907294, -0.7564551, 3.300946, 1, 1, 1, 1, 1,
0.5931925, -0.600714, 1.910012, 1, 1, 1, 1, 1,
0.5940775, 1.5483, -0.02450808, 1, 1, 1, 1, 1,
0.5945567, 0.2869973, 2.095303, 0, 0, 1, 1, 1,
0.5946915, -0.1822481, 4.017129, 1, 0, 0, 1, 1,
0.5964504, 1.595875, 2.679492, 1, 0, 0, 1, 1,
0.6045865, 0.1954166, 1.987099, 1, 0, 0, 1, 1,
0.6055792, -1.173207, 1.224863, 1, 0, 0, 1, 1,
0.6068344, -0.2860157, 2.521598, 1, 0, 0, 1, 1,
0.6081923, -0.2414214, 1.425516, 0, 0, 0, 1, 1,
0.6094527, 0.9440972, 2.313442, 0, 0, 0, 1, 1,
0.6202925, 0.7705272, -0.4720435, 0, 0, 0, 1, 1,
0.6235681, 1.350686, 1.010025, 0, 0, 0, 1, 1,
0.6288896, -1.049462, 2.38124, 0, 0, 0, 1, 1,
0.6313466, 0.7051595, -0.06226872, 0, 0, 0, 1, 1,
0.6313659, -0.9786664, 2.098183, 0, 0, 0, 1, 1,
0.6319135, -2.272801, 4.781209, 1, 1, 1, 1, 1,
0.6319658, -0.1991314, 2.145082, 1, 1, 1, 1, 1,
0.639601, 0.324299, -0.07193244, 1, 1, 1, 1, 1,
0.6424434, -0.4915899, 1.354394, 1, 1, 1, 1, 1,
0.6424547, -0.5471802, 0.528837, 1, 1, 1, 1, 1,
0.6425558, 0.795369, -0.4132121, 1, 1, 1, 1, 1,
0.6438451, -1.147499, 4.129121, 1, 1, 1, 1, 1,
0.6463878, 0.2701619, 2.419906, 1, 1, 1, 1, 1,
0.6465781, -1.778987, -1.124407, 1, 1, 1, 1, 1,
0.6503258, 1.310224, -0.3045039, 1, 1, 1, 1, 1,
0.6523966, 0.344197, 0.9088091, 1, 1, 1, 1, 1,
0.6525677, -0.1973714, 2.528419, 1, 1, 1, 1, 1,
0.6537517, -0.5101779, 2.827787, 1, 1, 1, 1, 1,
0.6547996, -0.50212, 2.112415, 1, 1, 1, 1, 1,
0.6561301, -0.3692957, 2.209898, 1, 1, 1, 1, 1,
0.6592128, 0.3311297, 1.398068, 0, 0, 1, 1, 1,
0.6653936, 0.533384, 0.6622828, 1, 0, 0, 1, 1,
0.665543, -0.5356748, 1.666835, 1, 0, 0, 1, 1,
0.6680086, -0.7721612, 0.836784, 1, 0, 0, 1, 1,
0.6724759, 1.950234, 0.164199, 1, 0, 0, 1, 1,
0.6736381, -1.581774, 1.117304, 1, 0, 0, 1, 1,
0.6757172, -0.05730342, 2.158999, 0, 0, 0, 1, 1,
0.6781813, -0.978826, 3.909228, 0, 0, 0, 1, 1,
0.6788837, -0.04489923, 2.218144, 0, 0, 0, 1, 1,
0.6801459, -0.03137204, 1.849969, 0, 0, 0, 1, 1,
0.681084, -0.1605821, 1.926114, 0, 0, 0, 1, 1,
0.6841684, -1.197474, 2.06917, 0, 0, 0, 1, 1,
0.6875751, -0.7078976, 2.156991, 0, 0, 0, 1, 1,
0.6895406, -0.3139755, 3.199284, 1, 1, 1, 1, 1,
0.6899928, 1.444048, 0.2529247, 1, 1, 1, 1, 1,
0.6907135, 0.6634893, -0.5644763, 1, 1, 1, 1, 1,
0.6944737, 0.3455541, 1.100618, 1, 1, 1, 1, 1,
0.6984249, -1.21256, 2.582539, 1, 1, 1, 1, 1,
0.70261, 0.1988993, 4.063337, 1, 1, 1, 1, 1,
0.7047991, 3.159059, 0.2983832, 1, 1, 1, 1, 1,
0.7085338, -1.664195, 5.363865, 1, 1, 1, 1, 1,
0.7118601, 2.839224, 0.6500007, 1, 1, 1, 1, 1,
0.7132739, -0.5558538, 1.297053, 1, 1, 1, 1, 1,
0.7157781, -0.9037791, 1.55916, 1, 1, 1, 1, 1,
0.7169544, -0.387155, 1.718135, 1, 1, 1, 1, 1,
0.7192412, -0.126816, 2.423491, 1, 1, 1, 1, 1,
0.7206053, -0.4289119, 2.931776, 1, 1, 1, 1, 1,
0.7226262, 0.01878988, 2.195997, 1, 1, 1, 1, 1,
0.725038, 0.2488626, 1.204138, 0, 0, 1, 1, 1,
0.7365252, 0.3426764, 0.3840408, 1, 0, 0, 1, 1,
0.7378235, -1.873912, 4.39732, 1, 0, 0, 1, 1,
0.7385232, 0.1488379, 1.836865, 1, 0, 0, 1, 1,
0.7476985, -1.329206, 2.808068, 1, 0, 0, 1, 1,
0.7486469, 1.042526, 1.132058, 1, 0, 0, 1, 1,
0.7517646, 0.4014283, 1.308506, 0, 0, 0, 1, 1,
0.7533494, -0.2314089, 1.524972, 0, 0, 0, 1, 1,
0.7540843, -0.9056734, 2.592891, 0, 0, 0, 1, 1,
0.7590317, -0.3795584, 2.987861, 0, 0, 0, 1, 1,
0.7600588, -0.6243019, 3.402149, 0, 0, 0, 1, 1,
0.7616791, 0.3194598, 1.010466, 0, 0, 0, 1, 1,
0.7649143, 0.6674221, 1.116808, 0, 0, 0, 1, 1,
0.7654407, 1.732978, -0.6890444, 1, 1, 1, 1, 1,
0.7670323, 1.637437, 0.722796, 1, 1, 1, 1, 1,
0.7680577, 1.887248, 0.02814272, 1, 1, 1, 1, 1,
0.7701133, 0.5209956, 1.482661, 1, 1, 1, 1, 1,
0.7711982, -0.9953495, 4.181624, 1, 1, 1, 1, 1,
0.7740936, -0.03650371, 1.560294, 1, 1, 1, 1, 1,
0.7751318, -0.08962752, 0.5946986, 1, 1, 1, 1, 1,
0.7803512, 0.1729515, 0.3847986, 1, 1, 1, 1, 1,
0.7814141, 0.05418967, 0.5653344, 1, 1, 1, 1, 1,
0.7833768, -0.6310173, 2.171993, 1, 1, 1, 1, 1,
0.786976, -1.257713, 1.46733, 1, 1, 1, 1, 1,
0.7906955, 1.249281, 1.263958, 1, 1, 1, 1, 1,
0.7925346, -0.759528, 3.757745, 1, 1, 1, 1, 1,
0.796572, -0.8303188, 3.750461, 1, 1, 1, 1, 1,
0.8129229, 0.8785529, 1.972444, 1, 1, 1, 1, 1,
0.8220717, 0.9309871, 0.3499469, 0, 0, 1, 1, 1,
0.8245113, -0.6368779, 3.305855, 1, 0, 0, 1, 1,
0.8253642, 1.108626, -1.635304, 1, 0, 0, 1, 1,
0.8270091, -0.01346369, 1.508315, 1, 0, 0, 1, 1,
0.8372692, -0.1510677, 0.02348457, 1, 0, 0, 1, 1,
0.8437116, 0.7765476, 0.3585085, 1, 0, 0, 1, 1,
0.8471061, 1.25559, -0.9154192, 0, 0, 0, 1, 1,
0.8524169, -0.8741053, 2.764651, 0, 0, 0, 1, 1,
0.8530867, 0.09405845, 2.175026, 0, 0, 0, 1, 1,
0.8574004, 0.8495759, 1.003324, 0, 0, 0, 1, 1,
0.8589225, 0.9009051, 1.323425, 0, 0, 0, 1, 1,
0.8606884, 1.093037, -1.906203, 0, 0, 0, 1, 1,
0.8647525, -0.3414526, 1.589971, 0, 0, 0, 1, 1,
0.8665079, -0.9685037, 2.175267, 1, 1, 1, 1, 1,
0.8695568, 0.8184376, 1.332755, 1, 1, 1, 1, 1,
0.8710757, -0.1427783, 0.9033631, 1, 1, 1, 1, 1,
0.8721607, 0.6737844, 1.041778, 1, 1, 1, 1, 1,
0.8726674, -0.1906022, 3.288449, 1, 1, 1, 1, 1,
0.8780162, -1.032051, 2.262574, 1, 1, 1, 1, 1,
0.8790585, 0.2532996, 2.504221, 1, 1, 1, 1, 1,
0.8792798, 0.8313194, 1.320974, 1, 1, 1, 1, 1,
0.8875327, 0.250967, 1.215629, 1, 1, 1, 1, 1,
0.8882731, 0.752338, -0.7707314, 1, 1, 1, 1, 1,
0.9067092, 1.070251, 1.004952, 1, 1, 1, 1, 1,
0.9070204, 0.5146403, 1.501783, 1, 1, 1, 1, 1,
0.9076464, 0.349158, 0.8086138, 1, 1, 1, 1, 1,
0.9111378, -0.3883566, 0.2098964, 1, 1, 1, 1, 1,
0.9247544, -0.6209627, 3.013342, 1, 1, 1, 1, 1,
0.9292395, -0.9328425, 2.846409, 0, 0, 1, 1, 1,
0.9310606, -1.79685, 1.864868, 1, 0, 0, 1, 1,
0.931439, 1.805314, 0.6468921, 1, 0, 0, 1, 1,
0.9328022, -0.1730613, 1.891005, 1, 0, 0, 1, 1,
0.9395701, 0.3314633, 1.004391, 1, 0, 0, 1, 1,
0.9395798, -0.7108292, 2.404464, 1, 0, 0, 1, 1,
0.9557691, 0.1107411, 2.376965, 0, 0, 0, 1, 1,
0.9580776, 0.9703056, 1.09188, 0, 0, 0, 1, 1,
0.9607636, -0.4083222, 1.471371, 0, 0, 0, 1, 1,
0.9637373, 0.7800658, 0.09470178, 0, 0, 0, 1, 1,
0.9643226, 1.54087, -0.8607116, 0, 0, 0, 1, 1,
0.9675356, 1.243719, -0.7350975, 0, 0, 0, 1, 1,
0.9744758, -0.1258456, 3.127624, 0, 0, 0, 1, 1,
0.9776781, -0.1448268, 1.452565, 1, 1, 1, 1, 1,
0.9900895, -0.2683059, 2.437338, 1, 1, 1, 1, 1,
0.9914114, 0.6581035, 1.570506, 1, 1, 1, 1, 1,
0.9927378, 0.5537367, 0.786448, 1, 1, 1, 1, 1,
0.9942114, 0.452977, 0.2930538, 1, 1, 1, 1, 1,
1.003656, 0.1859196, 2.150291, 1, 1, 1, 1, 1,
1.008685, -0.2161108, 1.305402, 1, 1, 1, 1, 1,
1.012329, 0.3026305, 1.361169, 1, 1, 1, 1, 1,
1.012643, 0.3843082, 1.537443, 1, 1, 1, 1, 1,
1.012934, -0.4182635, 2.130447, 1, 1, 1, 1, 1,
1.020076, 0.9175403, 2.583212, 1, 1, 1, 1, 1,
1.020083, 0.2644641, 1.582377, 1, 1, 1, 1, 1,
1.020601, 1.203439, -0.01103957, 1, 1, 1, 1, 1,
1.030834, -0.01995439, 1.946347, 1, 1, 1, 1, 1,
1.032956, 0.4801717, 0.9550434, 1, 1, 1, 1, 1,
1.03906, -0.3230487, 2.73108, 0, 0, 1, 1, 1,
1.045674, -0.1277501, 1.652909, 1, 0, 0, 1, 1,
1.046873, 0.8429524, 2.355294, 1, 0, 0, 1, 1,
1.049601, -0.2283274, 1.257471, 1, 0, 0, 1, 1,
1.050183, -0.6142598, 2.585713, 1, 0, 0, 1, 1,
1.060669, 0.4347281, 0.9739386, 1, 0, 0, 1, 1,
1.061919, -1.12549, 3.465542, 0, 0, 0, 1, 1,
1.070575, 0.7502392, 1.028215, 0, 0, 0, 1, 1,
1.08063, -1.350233, 3.270035, 0, 0, 0, 1, 1,
1.082105, -0.275746, 1.145953, 0, 0, 0, 1, 1,
1.082404, 0.1581786, 2.161985, 0, 0, 0, 1, 1,
1.094496, -0.8955736, 2.680467, 0, 0, 0, 1, 1,
1.096396, 1.860362, 0.6169975, 0, 0, 0, 1, 1,
1.103676, -0.1966876, 1.569287, 1, 1, 1, 1, 1,
1.103761, 0.9375105, 0.95617, 1, 1, 1, 1, 1,
1.107923, -1.406997, 2.164162, 1, 1, 1, 1, 1,
1.109423, 0.7012932, 1.59418, 1, 1, 1, 1, 1,
1.110337, 0.6326789, 0.6336817, 1, 1, 1, 1, 1,
1.113807, -0.9187008, 2.472526, 1, 1, 1, 1, 1,
1.121354, -1.184094, 2.58194, 1, 1, 1, 1, 1,
1.132352, 2.484755, -0.3037609, 1, 1, 1, 1, 1,
1.136613, 0.1379251, 2.21563, 1, 1, 1, 1, 1,
1.136632, -0.6268512, 2.779623, 1, 1, 1, 1, 1,
1.137342, 2.42171, 1.479091, 1, 1, 1, 1, 1,
1.14059, -0.2656516, 1.450399, 1, 1, 1, 1, 1,
1.143768, -0.4106026, 1.520778, 1, 1, 1, 1, 1,
1.163302, 0.7849428, 0.6674948, 1, 1, 1, 1, 1,
1.164218, 0.4351543, 0.9190609, 1, 1, 1, 1, 1,
1.166637, -0.576436, 3.546185, 0, 0, 1, 1, 1,
1.167123, -0.2523373, -1.463317, 1, 0, 0, 1, 1,
1.174486, 0.3835919, 1.106971, 1, 0, 0, 1, 1,
1.182184, 0.335728, 1.88354, 1, 0, 0, 1, 1,
1.182583, 0.06098488, 2.70469, 1, 0, 0, 1, 1,
1.18472, 1.975724, -0.266212, 1, 0, 0, 1, 1,
1.184896, 0.3553472, 0.6561093, 0, 0, 0, 1, 1,
1.205211, -1.096554, 3.067139, 0, 0, 0, 1, 1,
1.206668, 0.07341143, 1.025022, 0, 0, 0, 1, 1,
1.207939, -0.564966, 1.779816, 0, 0, 0, 1, 1,
1.213294, 1.916377, 0.4930799, 0, 0, 0, 1, 1,
1.214528, 1.508768, 0.5206629, 0, 0, 0, 1, 1,
1.217212, 2.388525, 1.370753, 0, 0, 0, 1, 1,
1.220314, 0.1928494, 0.2760287, 1, 1, 1, 1, 1,
1.237758, -1.70771, 3.129704, 1, 1, 1, 1, 1,
1.239672, -0.8536593, 2.149485, 1, 1, 1, 1, 1,
1.257671, 0.80426, 1.59051, 1, 1, 1, 1, 1,
1.261314, 1.17332, 0.7149497, 1, 1, 1, 1, 1,
1.262502, -1.31204, 3.076272, 1, 1, 1, 1, 1,
1.271377, 0.9409961, -0.01574879, 1, 1, 1, 1, 1,
1.27254, 0.3573581, 1.007333, 1, 1, 1, 1, 1,
1.273179, -0.0593922, 2.503018, 1, 1, 1, 1, 1,
1.289166, 0.4257668, 1.949576, 1, 1, 1, 1, 1,
1.29077, 0.2416453, 3.090862, 1, 1, 1, 1, 1,
1.298066, -0.01621213, 0.7094404, 1, 1, 1, 1, 1,
1.300203, -0.369831, 1.223459, 1, 1, 1, 1, 1,
1.308542, 1.171288, 0.1161456, 1, 1, 1, 1, 1,
1.330922, 1.99587, 2.614257, 1, 1, 1, 1, 1,
1.334557, 0.4821723, 0.2881833, 0, 0, 1, 1, 1,
1.348691, -0.9407387, 0.603559, 1, 0, 0, 1, 1,
1.361683, 0.2689813, 1.11836, 1, 0, 0, 1, 1,
1.361802, -0.4754719, 2.415514, 1, 0, 0, 1, 1,
1.380815, -0.6199939, 2.784879, 1, 0, 0, 1, 1,
1.392449, -0.7385615, 3.585965, 1, 0, 0, 1, 1,
1.397032, 1.59158, 0.9815302, 0, 0, 0, 1, 1,
1.40491, 1.965982, 0.6905541, 0, 0, 0, 1, 1,
1.40741, 1.58706, 3.734876, 0, 0, 0, 1, 1,
1.418479, -0.5447549, 2.588506, 0, 0, 0, 1, 1,
1.418625, -0.4185275, 2.056633, 0, 0, 0, 1, 1,
1.421103, 0.2700242, 2.120067, 0, 0, 0, 1, 1,
1.423841, 0.7501817, 0.5681589, 0, 0, 0, 1, 1,
1.42899, 0.4029728, 3.405393, 1, 1, 1, 1, 1,
1.437658, -0.8191746, 1.454769, 1, 1, 1, 1, 1,
1.444678, -0.05729991, 0.8157085, 1, 1, 1, 1, 1,
1.446236, 0.7352139, 1.249995, 1, 1, 1, 1, 1,
1.449587, -0.6215773, 0.7733171, 1, 1, 1, 1, 1,
1.453761, 0.4112574, 3.085529, 1, 1, 1, 1, 1,
1.457461, -0.5623073, 2.51399, 1, 1, 1, 1, 1,
1.484631, -0.2064018, -0.1332105, 1, 1, 1, 1, 1,
1.485128, 0.3146289, 2.02059, 1, 1, 1, 1, 1,
1.485876, -1.468961, 1.96313, 1, 1, 1, 1, 1,
1.489601, -0.4015797, 3.173846, 1, 1, 1, 1, 1,
1.492609, 0.2116285, 0.9484293, 1, 1, 1, 1, 1,
1.494112, -0.27379, 0.6268638, 1, 1, 1, 1, 1,
1.498504, 0.2378145, 1.625848, 1, 1, 1, 1, 1,
1.505571, 0.2084816, 1.376631, 1, 1, 1, 1, 1,
1.51368, -0.9030817, 4.469036, 0, 0, 1, 1, 1,
1.52666, 1.806345, 1.223634, 1, 0, 0, 1, 1,
1.538659, -2.064154, 2.669443, 1, 0, 0, 1, 1,
1.538729, 0.1334042, 0.4857928, 1, 0, 0, 1, 1,
1.548262, -0.07701321, -0.08405083, 1, 0, 0, 1, 1,
1.555698, 0.5864047, 0.3343548, 1, 0, 0, 1, 1,
1.56705, 0.6433266, 1.666622, 0, 0, 0, 1, 1,
1.567104, -0.3871579, 2.072521, 0, 0, 0, 1, 1,
1.57982, -0.2387583, 1.348964, 0, 0, 0, 1, 1,
1.582102, 1.665171, 0.7050532, 0, 0, 0, 1, 1,
1.595143, -1.406758, 1.978116, 0, 0, 0, 1, 1,
1.613132, 0.7441152, 0.5754691, 0, 0, 0, 1, 1,
1.621748, -0.06897552, 1.242622, 0, 0, 0, 1, 1,
1.623033, -0.3031047, 3.940959, 1, 1, 1, 1, 1,
1.635335, -0.3107271, 1.931872, 1, 1, 1, 1, 1,
1.639414, 0.9620211, 2.024678, 1, 1, 1, 1, 1,
1.640385, 0.02216422, 2.171696, 1, 1, 1, 1, 1,
1.641999, 0.3799989, 1.519841, 1, 1, 1, 1, 1,
1.643567, -2.734273, 2.768755, 1, 1, 1, 1, 1,
1.651145, -0.9082026, 3.162874, 1, 1, 1, 1, 1,
1.653836, 1.114535, 0.7216101, 1, 1, 1, 1, 1,
1.66104, -0.09753803, 1.39292, 1, 1, 1, 1, 1,
1.671354, 1.218493, 0.3664677, 1, 1, 1, 1, 1,
1.678014, 0.8422689, 1.36775, 1, 1, 1, 1, 1,
1.723345, 0.659907, 2.564642, 1, 1, 1, 1, 1,
1.74784, 0.343083, 0.684447, 1, 1, 1, 1, 1,
1.764053, 0.2017137, 1.255576, 1, 1, 1, 1, 1,
1.772616, -0.4840609, 2.192823, 1, 1, 1, 1, 1,
1.791988, 1.101265, 0.8812839, 0, 0, 1, 1, 1,
1.809232, -0.159411, 2.242281, 1, 0, 0, 1, 1,
1.811527, 0.9067194, 2.724272, 1, 0, 0, 1, 1,
1.822382, 0.390561, 0.2238467, 1, 0, 0, 1, 1,
1.83014, -0.414023, -0.07587007, 1, 0, 0, 1, 1,
1.839467, -1.255047, 3.602846, 1, 0, 0, 1, 1,
1.84169, 1.292388, 1.708573, 0, 0, 0, 1, 1,
1.845971, 0.267638, 2.675038, 0, 0, 0, 1, 1,
1.851354, -0.9967024, 2.86403, 0, 0, 0, 1, 1,
1.861943, -0.9771926, 1.199322, 0, 0, 0, 1, 1,
1.864228, -0.3426531, -0.7428648, 0, 0, 0, 1, 1,
1.894736, -0.6223716, 3.247421, 0, 0, 0, 1, 1,
1.90103, 2.618572, 0.419911, 0, 0, 0, 1, 1,
1.908672, -0.2014456, 1.799645, 1, 1, 1, 1, 1,
1.918378, 0.8012465, 0.4859425, 1, 1, 1, 1, 1,
1.922724, -0.08440251, 1.360887, 1, 1, 1, 1, 1,
1.934277, -1.370902, 2.231289, 1, 1, 1, 1, 1,
1.934819, 0.02409085, 0.714868, 1, 1, 1, 1, 1,
1.95864, 0.1070991, 0.8639348, 1, 1, 1, 1, 1,
1.961626, -0.5450648, 2.57153, 1, 1, 1, 1, 1,
1.980762, 1.074735, 0.2336404, 1, 1, 1, 1, 1,
1.982731, -1.53476, 2.689441, 1, 1, 1, 1, 1,
1.983183, 0.08563088, 0.6338645, 1, 1, 1, 1, 1,
2.017752, 0.9896778, 1.735062, 1, 1, 1, 1, 1,
2.02037, 0.1876187, 1.269382, 1, 1, 1, 1, 1,
2.044202, 1.797737, 0.186858, 1, 1, 1, 1, 1,
2.045785, -0.3143381, -0.3103561, 1, 1, 1, 1, 1,
2.046005, -0.594488, 0.3986017, 1, 1, 1, 1, 1,
2.065608, 0.5308178, 2.057952, 0, 0, 1, 1, 1,
2.066171, 2.158881, 1.327664, 1, 0, 0, 1, 1,
2.068889, -0.246409, 0.2832162, 1, 0, 0, 1, 1,
2.074792, -0.7147723, 2.350787, 1, 0, 0, 1, 1,
2.075526, 1.017907, 0.5865898, 1, 0, 0, 1, 1,
2.103455, -0.8982224, 1.681297, 1, 0, 0, 1, 1,
2.139054, 0.2086049, -0.04981146, 0, 0, 0, 1, 1,
2.154609, 1.279849, 1.904129, 0, 0, 0, 1, 1,
2.188384, 0.8346125, 0.3669051, 0, 0, 0, 1, 1,
2.211927, 1.053208, -0.4295621, 0, 0, 0, 1, 1,
2.275412, -2.857231, 1.960006, 0, 0, 0, 1, 1,
2.302923, -0.9428411, 2.741979, 0, 0, 0, 1, 1,
2.320469, -0.2169586, 2.274291, 0, 0, 0, 1, 1,
2.354587, -0.3315678, 0.3158728, 1, 1, 1, 1, 1,
2.515762, 0.09136424, 2.230887, 1, 1, 1, 1, 1,
2.52151, 0.1828257, 3.620282, 1, 1, 1, 1, 1,
2.541199, -0.546804, 2.107965, 1, 1, 1, 1, 1,
2.564487, 1.271003, 0.7017602, 1, 1, 1, 1, 1,
2.758575, 0.3391767, 0.7685151, 1, 1, 1, 1, 1,
2.764018, -2.0272, 2.403488, 1, 1, 1, 1, 1
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
var radius = 9.221388;
var distance = 32.38974;
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
mvMatrix.translate( 0.06169939, -0.1509138, -0.07302284 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.38974);
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
