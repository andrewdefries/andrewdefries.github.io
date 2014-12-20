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
-3.609048, -1.122128, -1.241367, 1, 0, 0, 1,
-3.563559, 2.463078, 0.5106508, 1, 0.007843138, 0, 1,
-3.402573, 0.854728, -1.147813, 1, 0.01176471, 0, 1,
-3.267204, 1.139377, -1.670465, 1, 0.01960784, 0, 1,
-2.901999, -0.4023201, -2.868371, 1, 0.02352941, 0, 1,
-2.868991, -0.5859082, -0.7184296, 1, 0.03137255, 0, 1,
-2.77805, 0.3549002, -1.161937, 1, 0.03529412, 0, 1,
-2.603237, -0.11686, -2.38824, 1, 0.04313726, 0, 1,
-2.601793, 1.06656, -0.7480894, 1, 0.04705882, 0, 1,
-2.581668, -0.4338112, -3.191959, 1, 0.05490196, 0, 1,
-2.489912, 1.206814, -1.464193, 1, 0.05882353, 0, 1,
-2.447303, -0.5569618, -1.065417, 1, 0.06666667, 0, 1,
-2.445151, -0.3985432, -2.890973, 1, 0.07058824, 0, 1,
-2.424457, 0.1059065, -0.9920399, 1, 0.07843138, 0, 1,
-2.377622, 0.0693829, -2.100086, 1, 0.08235294, 0, 1,
-2.289101, 0.05605637, -1.011654, 1, 0.09019608, 0, 1,
-2.263187, 0.7040013, -1.237335, 1, 0.09411765, 0, 1,
-2.244533, 1.174963, -1.029752, 1, 0.1019608, 0, 1,
-2.236681, -0.7222356, -2.662163, 1, 0.1098039, 0, 1,
-2.214656, 1.479895, -1.630909, 1, 0.1137255, 0, 1,
-2.19155, -0.9633284, -3.213725, 1, 0.1215686, 0, 1,
-2.13052, 1.517225, -1.798037, 1, 0.1254902, 0, 1,
-2.053677, 1.125934, 0.3561948, 1, 0.1333333, 0, 1,
-2.051171, 1.383034, -1.205883, 1, 0.1372549, 0, 1,
-1.927777, 0.8861829, -0.03254202, 1, 0.145098, 0, 1,
-1.89631, -0.02576692, -2.890247, 1, 0.1490196, 0, 1,
-1.892876, 0.1013556, -2.041513, 1, 0.1568628, 0, 1,
-1.861488, -0.4335135, -0.8356652, 1, 0.1607843, 0, 1,
-1.844441, 0.6436334, -1.964907, 1, 0.1686275, 0, 1,
-1.838071, 0.1009006, -1.829038, 1, 0.172549, 0, 1,
-1.812535, 1.116462, -0.6281238, 1, 0.1803922, 0, 1,
-1.80305, 1.711009, -0.6753582, 1, 0.1843137, 0, 1,
-1.80159, 0.9453304, -0.4392116, 1, 0.1921569, 0, 1,
-1.787798, 0.6510763, -2.547793, 1, 0.1960784, 0, 1,
-1.787032, 0.2484242, -0.9899561, 1, 0.2039216, 0, 1,
-1.775495, 0.5662059, -1.186843, 1, 0.2117647, 0, 1,
-1.755107, 0.1901456, -3.09903, 1, 0.2156863, 0, 1,
-1.747084, 0.3281066, -1.822858, 1, 0.2235294, 0, 1,
-1.745577, 0.1993484, -1.295062, 1, 0.227451, 0, 1,
-1.736805, -0.1032231, -0.3445582, 1, 0.2352941, 0, 1,
-1.733626, 0.07409427, -1.429185, 1, 0.2392157, 0, 1,
-1.732801, 0.9571691, -1.403594, 1, 0.2470588, 0, 1,
-1.724052, -1.386991, -1.830178, 1, 0.2509804, 0, 1,
-1.712325, 0.07948217, -1.178193, 1, 0.2588235, 0, 1,
-1.709504, -0.07629048, -2.93642, 1, 0.2627451, 0, 1,
-1.708234, -0.3397784, -1.165265, 1, 0.2705882, 0, 1,
-1.705658, 0.4952625, -1.455836, 1, 0.2745098, 0, 1,
-1.687765, 0.6528288, -1.001405, 1, 0.282353, 0, 1,
-1.668931, 1.216346, -2.633158, 1, 0.2862745, 0, 1,
-1.653275, -0.316388, -1.60739, 1, 0.2941177, 0, 1,
-1.64822, -1.70684, -1.492555, 1, 0.3019608, 0, 1,
-1.647484, -1.063535, -2.11066, 1, 0.3058824, 0, 1,
-1.627584, -1.670598, -2.092607, 1, 0.3137255, 0, 1,
-1.627028, -1.326046, -2.626641, 1, 0.3176471, 0, 1,
-1.625133, 0.7492238, -2.550927, 1, 0.3254902, 0, 1,
-1.620559, 0.7086411, -1.530845, 1, 0.3294118, 0, 1,
-1.617133, -0.431868, -0.9786018, 1, 0.3372549, 0, 1,
-1.611278, 0.6077195, -0.3111165, 1, 0.3411765, 0, 1,
-1.581288, -0.06972004, -3.802386, 1, 0.3490196, 0, 1,
-1.571976, -0.627044, -1.827836, 1, 0.3529412, 0, 1,
-1.562042, 1.086686, 0.1576119, 1, 0.3607843, 0, 1,
-1.560876, 0.05110983, -1.788804, 1, 0.3647059, 0, 1,
-1.560156, 0.6295533, -0.1721393, 1, 0.372549, 0, 1,
-1.548893, -1.56952, -1.896229, 1, 0.3764706, 0, 1,
-1.542787, -1.025254, -1.419221, 1, 0.3843137, 0, 1,
-1.531632, 0.7489972, -1.4842, 1, 0.3882353, 0, 1,
-1.530855, 1.987583, -2.03752, 1, 0.3960784, 0, 1,
-1.528144, -0.0652431, -1.925805, 1, 0.4039216, 0, 1,
-1.527663, -0.3933131, -2.683156, 1, 0.4078431, 0, 1,
-1.525621, -1.485265, -1.933097, 1, 0.4156863, 0, 1,
-1.516039, -1.059561, -0.9593921, 1, 0.4196078, 0, 1,
-1.513898, -0.2273035, -1.602706, 1, 0.427451, 0, 1,
-1.508972, 0.2539696, 2.059218, 1, 0.4313726, 0, 1,
-1.491731, -0.002814325, -1.855334, 1, 0.4392157, 0, 1,
-1.474162, 0.5021347, -0.6677487, 1, 0.4431373, 0, 1,
-1.460211, -0.3854884, -3.065297, 1, 0.4509804, 0, 1,
-1.451826, 0.9863583, -1.692814, 1, 0.454902, 0, 1,
-1.450836, -0.05007534, -2.241138, 1, 0.4627451, 0, 1,
-1.450475, 0.6453342, -2.070687, 1, 0.4666667, 0, 1,
-1.439098, -0.7388754, -4.760519, 1, 0.4745098, 0, 1,
-1.434245, -1.694568, -2.133574, 1, 0.4784314, 0, 1,
-1.43132, -0.3681043, -0.08912482, 1, 0.4862745, 0, 1,
-1.431188, 0.8296638, -3.346773, 1, 0.4901961, 0, 1,
-1.422738, -0.06942619, -2.604701, 1, 0.4980392, 0, 1,
-1.418786, -0.1242205, -2.329161, 1, 0.5058824, 0, 1,
-1.4184, 1.069994, -0.7609225, 1, 0.509804, 0, 1,
-1.417942, 1.582397, -2.320416, 1, 0.5176471, 0, 1,
-1.409676, -0.09755938, -2.360041, 1, 0.5215687, 0, 1,
-1.402966, -0.4228091, -2.054893, 1, 0.5294118, 0, 1,
-1.389408, -0.01307816, -3.776476, 1, 0.5333334, 0, 1,
-1.388838, -0.9436033, -2.469136, 1, 0.5411765, 0, 1,
-1.387396, 0.3134758, -0.4463699, 1, 0.5450981, 0, 1,
-1.382499, 0.1573613, -1.197966, 1, 0.5529412, 0, 1,
-1.382279, -0.7896352, -2.260362, 1, 0.5568628, 0, 1,
-1.37441, -2.198924, -2.351496, 1, 0.5647059, 0, 1,
-1.373242, -0.376623, -0.7638225, 1, 0.5686275, 0, 1,
-1.372431, 0.1553824, -1.974867, 1, 0.5764706, 0, 1,
-1.359241, 0.5411463, 0.5159898, 1, 0.5803922, 0, 1,
-1.349336, 0.007043429, -1.261799, 1, 0.5882353, 0, 1,
-1.347802, -1.367526, -2.322975, 1, 0.5921569, 0, 1,
-1.347801, -0.9390256, -1.271519, 1, 0.6, 0, 1,
-1.345349, -1.575939, -3.518303, 1, 0.6078432, 0, 1,
-1.338542, 0.07444186, 0.2928375, 1, 0.6117647, 0, 1,
-1.319281, -1.693873, -2.075947, 1, 0.6196079, 0, 1,
-1.317468, -0.5612853, 0.1198339, 1, 0.6235294, 0, 1,
-1.311893, -0.879041, -3.67527, 1, 0.6313726, 0, 1,
-1.298302, 0.8917987, 1.433528, 1, 0.6352941, 0, 1,
-1.297701, -0.1014317, -1.978709, 1, 0.6431373, 0, 1,
-1.287925, 0.8005502, -0.7940508, 1, 0.6470588, 0, 1,
-1.287672, 0.3966839, -0.9898425, 1, 0.654902, 0, 1,
-1.284619, -1.045649, -2.769025, 1, 0.6588235, 0, 1,
-1.275662, -0.4741728, -3.321469, 1, 0.6666667, 0, 1,
-1.264477, -0.07541478, -1.235915, 1, 0.6705883, 0, 1,
-1.259143, -2.07217, -2.965766, 1, 0.6784314, 0, 1,
-1.2508, 0.08900858, -1.127485, 1, 0.682353, 0, 1,
-1.250579, 0.5765831, -1.629982, 1, 0.6901961, 0, 1,
-1.23691, 0.9237272, -1.664892, 1, 0.6941177, 0, 1,
-1.226392, -0.8634878, -2.08924, 1, 0.7019608, 0, 1,
-1.224095, 0.05871428, -1.54177, 1, 0.7098039, 0, 1,
-1.221496, -1.840456, -2.84349, 1, 0.7137255, 0, 1,
-1.215518, 0.05629588, -2.42525, 1, 0.7215686, 0, 1,
-1.213928, 0.5184981, -1.249276, 1, 0.7254902, 0, 1,
-1.213333, 0.7018518, -0.4623402, 1, 0.7333333, 0, 1,
-1.207604, -0.5329641, -1.817282, 1, 0.7372549, 0, 1,
-1.20654, -0.83774, -1.773625, 1, 0.7450981, 0, 1,
-1.202739, 0.6040965, -1.004747, 1, 0.7490196, 0, 1,
-1.196676, 0.1515929, -2.255983, 1, 0.7568628, 0, 1,
-1.191607, 0.07157911, -0.5909888, 1, 0.7607843, 0, 1,
-1.188636, 0.6471362, -2.297534, 1, 0.7686275, 0, 1,
-1.187464, 0.099508, -1.325934, 1, 0.772549, 0, 1,
-1.174575, -0.8103176, -3.518806, 1, 0.7803922, 0, 1,
-1.158202, 0.04920847, -0.4099466, 1, 0.7843137, 0, 1,
-1.156849, 1.312166, 0.05511501, 1, 0.7921569, 0, 1,
-1.154346, 1.440593, -0.4202938, 1, 0.7960784, 0, 1,
-1.148209, 0.5807722, -2.289722, 1, 0.8039216, 0, 1,
-1.144987, -1.156192, -1.244132, 1, 0.8117647, 0, 1,
-1.134895, 0.2983817, -1.719119, 1, 0.8156863, 0, 1,
-1.133991, -0.1659966, -2.00511, 1, 0.8235294, 0, 1,
-1.128863, -2.263089, -0.7402662, 1, 0.827451, 0, 1,
-1.127336, -0.9446486, -1.704121, 1, 0.8352941, 0, 1,
-1.119896, 0.2916076, -1.513855, 1, 0.8392157, 0, 1,
-1.119476, 0.1541922, -0.06783129, 1, 0.8470588, 0, 1,
-1.114942, 0.347038, -0.9707444, 1, 0.8509804, 0, 1,
-1.112263, 0.3826954, -0.9740627, 1, 0.8588235, 0, 1,
-1.110848, -0.1613928, -1.980266, 1, 0.8627451, 0, 1,
-1.10962, -0.1294245, -0.8148134, 1, 0.8705882, 0, 1,
-1.100013, -0.9686022, -2.46487, 1, 0.8745098, 0, 1,
-1.099645, -1.266643, -2.329389, 1, 0.8823529, 0, 1,
-1.099613, 0.920972, -1.312729, 1, 0.8862745, 0, 1,
-1.099416, -1.33092, -1.340197, 1, 0.8941177, 0, 1,
-1.094691, 0.7930962, -0.5596071, 1, 0.8980392, 0, 1,
-1.090769, 0.7485557, -0.3667477, 1, 0.9058824, 0, 1,
-1.089601, -1.491609, -2.273837, 1, 0.9137255, 0, 1,
-1.082869, -1.517779, -2.516281, 1, 0.9176471, 0, 1,
-1.076196, -1.905732, -3.089564, 1, 0.9254902, 0, 1,
-1.075657, -0.2828916, -1.639703, 1, 0.9294118, 0, 1,
-1.07284, -1.26969, -2.515777, 1, 0.9372549, 0, 1,
-1.070155, -1.035569, -1.46873, 1, 0.9411765, 0, 1,
-1.068046, 0.1427968, -2.53896, 1, 0.9490196, 0, 1,
-1.066877, -0.3788297, -0.03339054, 1, 0.9529412, 0, 1,
-1.064042, 0.6614472, 0.01003049, 1, 0.9607843, 0, 1,
-1.062475, -0.4180188, -2.092187, 1, 0.9647059, 0, 1,
-1.061907, -1.294459, -2.140536, 1, 0.972549, 0, 1,
-1.058765, 0.2702159, -1.682063, 1, 0.9764706, 0, 1,
-1.057978, 0.587721, -0.8005049, 1, 0.9843137, 0, 1,
-1.057288, -0.4485044, -2.81326, 1, 0.9882353, 0, 1,
-1.056125, -0.4540639, -2.409407, 1, 0.9960784, 0, 1,
-1.045394, 0.493149, -0.9992095, 0.9960784, 1, 0, 1,
-1.042566, -2.064388, -2.746619, 0.9921569, 1, 0, 1,
-1.041285, 0.5325685, -2.399199, 0.9843137, 1, 0, 1,
-1.039176, -0.6562543, -3.091191, 0.9803922, 1, 0, 1,
-1.035862, -1.307351, -3.333532, 0.972549, 1, 0, 1,
-1.035169, 0.104449, -0.9816809, 0.9686275, 1, 0, 1,
-1.031973, -0.1712925, -2.101169, 0.9607843, 1, 0, 1,
-1.02924, 0.9566384, -1.318043, 0.9568627, 1, 0, 1,
-1.027939, -0.4859971, -1.085493, 0.9490196, 1, 0, 1,
-1.027147, -0.758509, -2.019034, 0.945098, 1, 0, 1,
-1.023047, 1.465346, -1.037945, 0.9372549, 1, 0, 1,
-1.019143, -1.014486, -0.8850043, 0.9333333, 1, 0, 1,
-1.017291, 0.3294536, -1.465478, 0.9254902, 1, 0, 1,
-1.014992, -0.6995002, -0.5853019, 0.9215686, 1, 0, 1,
-1.014807, 0.8842026, -0.07766817, 0.9137255, 1, 0, 1,
-1.008332, -0.3614655, 0.4857695, 0.9098039, 1, 0, 1,
-1.007148, 1.117975, -2.313665, 0.9019608, 1, 0, 1,
-1.000333, -1.300431, -2.13853, 0.8941177, 1, 0, 1,
-0.9992936, -0.03444247, -2.846887, 0.8901961, 1, 0, 1,
-0.9946602, -0.9114061, -1.951757, 0.8823529, 1, 0, 1,
-0.9904577, 0.8008332, 0.2731971, 0.8784314, 1, 0, 1,
-0.9892966, -2.087977, -2.065595, 0.8705882, 1, 0, 1,
-0.9818465, 1.404539, 1.896519, 0.8666667, 1, 0, 1,
-0.976715, -0.4206631, -1.287549, 0.8588235, 1, 0, 1,
-0.9760548, 1.175986, -0.3219745, 0.854902, 1, 0, 1,
-0.9692385, 1.532325, 0.1174221, 0.8470588, 1, 0, 1,
-0.9663751, -1.448533, -2.586596, 0.8431373, 1, 0, 1,
-0.9624992, -0.1752417, -3.586786, 0.8352941, 1, 0, 1,
-0.9604384, 0.6644633, -0.6198914, 0.8313726, 1, 0, 1,
-0.9565203, 1.246864, -0.8876986, 0.8235294, 1, 0, 1,
-0.9538024, 0.2238442, -1.878517, 0.8196079, 1, 0, 1,
-0.9521531, -1.852852, -3.532706, 0.8117647, 1, 0, 1,
-0.9484226, -1.978464, -4.310087, 0.8078431, 1, 0, 1,
-0.9470285, -0.2080676, -1.680176, 0.8, 1, 0, 1,
-0.9454096, -1.303203, -1.866729, 0.7921569, 1, 0, 1,
-0.9386218, 1.251004, 0.3318932, 0.7882353, 1, 0, 1,
-0.9288982, 0.02588661, -0.8538494, 0.7803922, 1, 0, 1,
-0.9267932, -0.4381202, -1.330173, 0.7764706, 1, 0, 1,
-0.9108239, 1.472383, 0.7329155, 0.7686275, 1, 0, 1,
-0.9056527, -1.240261, -4.839607, 0.7647059, 1, 0, 1,
-0.8998797, 2.75287, -0.8947541, 0.7568628, 1, 0, 1,
-0.8975282, 2.678552, 1.114126, 0.7529412, 1, 0, 1,
-0.894415, -0.3945458, -3.630972, 0.7450981, 1, 0, 1,
-0.8850156, 1.44742, -0.6513265, 0.7411765, 1, 0, 1,
-0.8800145, -0.03478495, -1.877936, 0.7333333, 1, 0, 1,
-0.8749627, -0.1821317, -3.095087, 0.7294118, 1, 0, 1,
-0.8739812, -0.03814784, -2.164438, 0.7215686, 1, 0, 1,
-0.8711821, 2.415869, -0.7411457, 0.7176471, 1, 0, 1,
-0.8700467, -1.364362, -1.782813, 0.7098039, 1, 0, 1,
-0.8678276, -0.4073245, -1.629143, 0.7058824, 1, 0, 1,
-0.8614313, -0.3542829, -3.249852, 0.6980392, 1, 0, 1,
-0.8548619, 0.4048522, -0.8997076, 0.6901961, 1, 0, 1,
-0.8545789, 0.8524145, -1.466974, 0.6862745, 1, 0, 1,
-0.8512213, -0.4408778, -0.6091898, 0.6784314, 1, 0, 1,
-0.8395885, 0.5694762, -0.5924165, 0.6745098, 1, 0, 1,
-0.8395083, 0.2511143, -1.87644, 0.6666667, 1, 0, 1,
-0.832891, 0.414451, -1.960618, 0.6627451, 1, 0, 1,
-0.8326302, -1.138899, -1.424348, 0.654902, 1, 0, 1,
-0.8308005, 0.7957288, 0.01783742, 0.6509804, 1, 0, 1,
-0.8180009, 0.0735017, -3.212167, 0.6431373, 1, 0, 1,
-0.8144602, -0.4343032, -2.034809, 0.6392157, 1, 0, 1,
-0.8135603, -1.590494, -3.002554, 0.6313726, 1, 0, 1,
-0.8000188, -2.276355, -1.733563, 0.627451, 1, 0, 1,
-0.7997428, -0.1934669, -0.05011262, 0.6196079, 1, 0, 1,
-0.7957438, 0.002317745, -1.828031, 0.6156863, 1, 0, 1,
-0.7952868, 1.827435, -1.22232, 0.6078432, 1, 0, 1,
-0.7937017, -0.8322341, -1.732968, 0.6039216, 1, 0, 1,
-0.7900774, 1.251644, -0.9568676, 0.5960785, 1, 0, 1,
-0.78629, -0.2305777, -1.062774, 0.5882353, 1, 0, 1,
-0.7808787, -0.8156186, -2.442591, 0.5843138, 1, 0, 1,
-0.7768353, 0.4488773, -2.091599, 0.5764706, 1, 0, 1,
-0.7699496, -0.7288548, -0.976452, 0.572549, 1, 0, 1,
-0.7681199, -1.476395, -2.480954, 0.5647059, 1, 0, 1,
-0.7616898, 1.405822, -1.995949, 0.5607843, 1, 0, 1,
-0.7560756, 1.238088, -2.597746, 0.5529412, 1, 0, 1,
-0.7549535, -0.06028053, -2.628566, 0.5490196, 1, 0, 1,
-0.7544441, -0.8157305, -3.477223, 0.5411765, 1, 0, 1,
-0.7468343, -0.04619968, 0.1420702, 0.5372549, 1, 0, 1,
-0.7463931, 1.10822, -1.266918, 0.5294118, 1, 0, 1,
-0.7444714, 0.3344374, -1.977821, 0.5254902, 1, 0, 1,
-0.7400614, 1.694509, -0.7233853, 0.5176471, 1, 0, 1,
-0.7390542, -0.1749872, -1.299657, 0.5137255, 1, 0, 1,
-0.7370351, 0.3664977, -1.998197, 0.5058824, 1, 0, 1,
-0.7306412, -0.8667254, -2.054606, 0.5019608, 1, 0, 1,
-0.7236004, -0.0477959, -2.261065, 0.4941176, 1, 0, 1,
-0.722035, -0.2254441, -2.375156, 0.4862745, 1, 0, 1,
-0.7198287, 0.2598933, -1.200719, 0.4823529, 1, 0, 1,
-0.7153072, 0.9460046, -0.3459665, 0.4745098, 1, 0, 1,
-0.7144231, 0.06669245, -0.3668173, 0.4705882, 1, 0, 1,
-0.6945025, 2.155391, -2.681928, 0.4627451, 1, 0, 1,
-0.6929309, 1.008133, -1.707156, 0.4588235, 1, 0, 1,
-0.6926197, -0.172587, -2.321517, 0.4509804, 1, 0, 1,
-0.6915652, -1.125077, -1.689752, 0.4470588, 1, 0, 1,
-0.6893696, 1.473851, -1.125708, 0.4392157, 1, 0, 1,
-0.6892445, -0.917272, -2.141917, 0.4352941, 1, 0, 1,
-0.6882667, 0.0240896, -0.4995571, 0.427451, 1, 0, 1,
-0.6849349, 0.6390316, -2.016533, 0.4235294, 1, 0, 1,
-0.6709528, -0.9531342, -2.096496, 0.4156863, 1, 0, 1,
-0.6609807, 0.2539751, -0.7990317, 0.4117647, 1, 0, 1,
-0.6604235, 2.382828, -1.950173, 0.4039216, 1, 0, 1,
-0.652798, -0.977167, -3.358392, 0.3960784, 1, 0, 1,
-0.6525801, 0.8156537, -0.2021451, 0.3921569, 1, 0, 1,
-0.6478601, -0.648613, -3.749405, 0.3843137, 1, 0, 1,
-0.6469641, 1.812095, -0.4976349, 0.3803922, 1, 0, 1,
-0.6461721, -0.4352341, -1.684421, 0.372549, 1, 0, 1,
-0.6438395, 1.040287, -0.8990108, 0.3686275, 1, 0, 1,
-0.6434369, -0.393426, -2.591982, 0.3607843, 1, 0, 1,
-0.6422576, 0.0923523, -1.439452, 0.3568628, 1, 0, 1,
-0.6401911, 1.169121, -1.18691, 0.3490196, 1, 0, 1,
-0.6395758, -1.360021, -2.265099, 0.345098, 1, 0, 1,
-0.6377133, 0.8937904, -0.5887902, 0.3372549, 1, 0, 1,
-0.6335561, -0.6776659, -2.843783, 0.3333333, 1, 0, 1,
-0.6307823, 0.6374582, -0.6120619, 0.3254902, 1, 0, 1,
-0.6282535, 0.6167265, -1.6095, 0.3215686, 1, 0, 1,
-0.6265895, 0.9023285, -1.114048, 0.3137255, 1, 0, 1,
-0.6247527, -0.7245218, -3.572126, 0.3098039, 1, 0, 1,
-0.6246771, -2.530804, -2.152184, 0.3019608, 1, 0, 1,
-0.620037, -0.8705989, -2.490582, 0.2941177, 1, 0, 1,
-0.6155676, -0.1904295, -2.19055, 0.2901961, 1, 0, 1,
-0.6151655, -0.2136983, -2.237419, 0.282353, 1, 0, 1,
-0.6063725, 2.294377, -1.355477, 0.2784314, 1, 0, 1,
-0.6028334, 0.5846409, 0.3766459, 0.2705882, 1, 0, 1,
-0.5980231, -0.2881249, -1.85212, 0.2666667, 1, 0, 1,
-0.5975154, -0.07978689, -0.5390445, 0.2588235, 1, 0, 1,
-0.5966955, 0.6570599, -0.1965722, 0.254902, 1, 0, 1,
-0.5961982, -0.08249295, -1.711724, 0.2470588, 1, 0, 1,
-0.5951433, 1.471922, 0.09878605, 0.2431373, 1, 0, 1,
-0.5824016, -0.01737276, -0.2237666, 0.2352941, 1, 0, 1,
-0.5804999, 0.560762, 0.6694224, 0.2313726, 1, 0, 1,
-0.5796821, 1.303997, -0.8114268, 0.2235294, 1, 0, 1,
-0.5626078, -0.8170229, -2.09543, 0.2196078, 1, 0, 1,
-0.5615361, -0.558598, -2.988737, 0.2117647, 1, 0, 1,
-0.5561225, -0.0859221, -3.174716, 0.2078431, 1, 0, 1,
-0.5559179, 0.06829125, -2.395569, 0.2, 1, 0, 1,
-0.5554391, 1.11628, -1.518923, 0.1921569, 1, 0, 1,
-0.5549416, 0.3925001, -0.05403206, 0.1882353, 1, 0, 1,
-0.5517865, -0.5344212, -1.35511, 0.1803922, 1, 0, 1,
-0.5485122, -0.7583187, -1.992983, 0.1764706, 1, 0, 1,
-0.5478189, -0.02406711, -1.481314, 0.1686275, 1, 0, 1,
-0.5464159, -0.5457671, -2.902771, 0.1647059, 1, 0, 1,
-0.5451846, 0.7729135, -0.7492267, 0.1568628, 1, 0, 1,
-0.543414, 0.6380166, -1.389119, 0.1529412, 1, 0, 1,
-0.5429268, 0.07551391, -1.46643, 0.145098, 1, 0, 1,
-0.5428756, 0.5426272, -0.1058182, 0.1411765, 1, 0, 1,
-0.5371743, 0.05259542, -1.421307, 0.1333333, 1, 0, 1,
-0.5354272, -2.403098, -2.888022, 0.1294118, 1, 0, 1,
-0.5350311, -1.262258, -3.588167, 0.1215686, 1, 0, 1,
-0.5345204, -1.495701, -2.184759, 0.1176471, 1, 0, 1,
-0.5338351, 0.327771, -0.6132823, 0.1098039, 1, 0, 1,
-0.5156581, 0.5235998, -0.2900786, 0.1058824, 1, 0, 1,
-0.5124092, 0.9732841, -0.2479571, 0.09803922, 1, 0, 1,
-0.5081648, -0.4468982, -0.9706465, 0.09019608, 1, 0, 1,
-0.5073578, -0.5953637, -1.595737, 0.08627451, 1, 0, 1,
-0.5069318, -0.2098324, -0.8818762, 0.07843138, 1, 0, 1,
-0.5059211, -0.8125072, -2.843875, 0.07450981, 1, 0, 1,
-0.4967637, 1.090567, 0.8371292, 0.06666667, 1, 0, 1,
-0.4957124, -0.9367586, -1.548542, 0.0627451, 1, 0, 1,
-0.4939678, -1.008816, -2.468079, 0.05490196, 1, 0, 1,
-0.4884858, 0.9693817, -0.3225129, 0.05098039, 1, 0, 1,
-0.4846445, -0.7824721, -4.47953, 0.04313726, 1, 0, 1,
-0.4803335, -0.3873805, -3.720323, 0.03921569, 1, 0, 1,
-0.4794968, -0.07544928, -1.207978, 0.03137255, 1, 0, 1,
-0.4781289, -0.08737714, -1.642698, 0.02745098, 1, 0, 1,
-0.4721334, 0.8669364, -0.7727611, 0.01960784, 1, 0, 1,
-0.4703534, -2.146103, -3.046052, 0.01568628, 1, 0, 1,
-0.4637856, 0.7569578, -0.4261499, 0.007843138, 1, 0, 1,
-0.4629138, -0.2825329, -0.5229855, 0.003921569, 1, 0, 1,
-0.4578147, 2.250289, 0.125152, 0, 1, 0.003921569, 1,
-0.4568491, 1.134339, -1.2592, 0, 1, 0.01176471, 1,
-0.4561914, 1.013394, 0.5652578, 0, 1, 0.01568628, 1,
-0.4561383, -0.6286704, -2.83112, 0, 1, 0.02352941, 1,
-0.4549783, -0.4658167, -1.287987, 0, 1, 0.02745098, 1,
-0.4513963, 2.252146, 0.28416, 0, 1, 0.03529412, 1,
-0.4425449, 0.2670447, -1.05234, 0, 1, 0.03921569, 1,
-0.4424479, -2.309148, -2.236733, 0, 1, 0.04705882, 1,
-0.4403746, 0.1882554, 0.1880499, 0, 1, 0.05098039, 1,
-0.4344615, -0.8116874, -2.216167, 0, 1, 0.05882353, 1,
-0.4308087, 0.4467008, -0.9480232, 0, 1, 0.0627451, 1,
-0.4306596, 1.778188, -0.6471382, 0, 1, 0.07058824, 1,
-0.4293598, -1.217575, -2.954782, 0, 1, 0.07450981, 1,
-0.4287479, 0.3293782, 0.01258916, 0, 1, 0.08235294, 1,
-0.4281186, 0.1823876, -0.03535415, 0, 1, 0.08627451, 1,
-0.4272482, 0.7214916, -1.093378, 0, 1, 0.09411765, 1,
-0.4223422, -0.4317395, -0.6650196, 0, 1, 0.1019608, 1,
-0.4202797, -0.1938485, -1.982262, 0, 1, 0.1058824, 1,
-0.4175404, 1.2232, -0.3643435, 0, 1, 0.1137255, 1,
-0.4146554, 1.831169, 0.07197816, 0, 1, 0.1176471, 1,
-0.4086025, 0.2126241, -1.835848, 0, 1, 0.1254902, 1,
-0.4051433, 0.1823408, -0.4518704, 0, 1, 0.1294118, 1,
-0.4046178, -0.8571063, -1.966962, 0, 1, 0.1372549, 1,
-0.404147, -0.2146586, -3.636434, 0, 1, 0.1411765, 1,
-0.393916, -0.9486914, -4.252432, 0, 1, 0.1490196, 1,
-0.3820473, 0.6085232, -2.004324, 0, 1, 0.1529412, 1,
-0.3794489, 0.6602149, 0.01592129, 0, 1, 0.1607843, 1,
-0.3781725, 0.4040069, -0.6710641, 0, 1, 0.1647059, 1,
-0.3767762, -0.1686937, -1.609441, 0, 1, 0.172549, 1,
-0.3741587, 1.076991, 0.1931205, 0, 1, 0.1764706, 1,
-0.3706638, -1.750226, -3.419278, 0, 1, 0.1843137, 1,
-0.3695418, -0.3348872, -2.269435, 0, 1, 0.1882353, 1,
-0.3692888, -1.590574, -1.722469, 0, 1, 0.1960784, 1,
-0.3644089, 1.720171, -1.405787, 0, 1, 0.2039216, 1,
-0.3613954, -1.368609, -3.187394, 0, 1, 0.2078431, 1,
-0.3606548, 1.053022, 0.7835088, 0, 1, 0.2156863, 1,
-0.3558856, 0.1957576, -3.743759, 0, 1, 0.2196078, 1,
-0.3553983, -1.342771, -1.876324, 0, 1, 0.227451, 1,
-0.3527555, 0.5313513, -1.308338, 0, 1, 0.2313726, 1,
-0.351369, 0.2851393, -1.843644, 0, 1, 0.2392157, 1,
-0.3501469, 0.1092509, -0.3574536, 0, 1, 0.2431373, 1,
-0.3499869, 1.590996, 1.218457, 0, 1, 0.2509804, 1,
-0.349413, -0.03323663, -1.504777, 0, 1, 0.254902, 1,
-0.3416781, 0.7208635, -0.6373725, 0, 1, 0.2627451, 1,
-0.3390922, 0.08107093, 0.6118593, 0, 1, 0.2666667, 1,
-0.3386188, 0.4027817, -0.8425443, 0, 1, 0.2745098, 1,
-0.3385811, -1.41622, -2.482248, 0, 1, 0.2784314, 1,
-0.3373973, 1.097442, -2.472355, 0, 1, 0.2862745, 1,
-0.3317159, -1.256362, -1.29029, 0, 1, 0.2901961, 1,
-0.3305021, 0.2377849, -1.436035, 0, 1, 0.2980392, 1,
-0.3258071, -0.1650821, -1.758545, 0, 1, 0.3058824, 1,
-0.3202204, 0.5479656, -0.3560319, 0, 1, 0.3098039, 1,
-0.3174788, -0.1290454, -2.605086, 0, 1, 0.3176471, 1,
-0.3152481, -0.09175227, -1.919509, 0, 1, 0.3215686, 1,
-0.3141515, -0.7055308, -2.123779, 0, 1, 0.3294118, 1,
-0.3099544, 2.221474, 0.2456433, 0, 1, 0.3333333, 1,
-0.3086481, -0.218468, -0.8535909, 0, 1, 0.3411765, 1,
-0.2996774, -1.531931, -2.90007, 0, 1, 0.345098, 1,
-0.2925893, -0.842931, -3.529197, 0, 1, 0.3529412, 1,
-0.2868799, -0.5862597, -1.292567, 0, 1, 0.3568628, 1,
-0.2850233, 0.04384356, -1.221382, 0, 1, 0.3647059, 1,
-0.2838175, 0.3275408, -1.692966, 0, 1, 0.3686275, 1,
-0.2833975, -1.524145, -3.399432, 0, 1, 0.3764706, 1,
-0.2827207, -0.08653678, -1.204292, 0, 1, 0.3803922, 1,
-0.2824886, -0.6404341, -1.229974, 0, 1, 0.3882353, 1,
-0.2811986, -1.455545, -2.680878, 0, 1, 0.3921569, 1,
-0.2759832, -0.01966883, -0.1929848, 0, 1, 0.4, 1,
-0.2750829, 0.04022543, -1.204339, 0, 1, 0.4078431, 1,
-0.2729975, 0.005461908, -2.403095, 0, 1, 0.4117647, 1,
-0.2699615, 0.732603, 0.999222, 0, 1, 0.4196078, 1,
-0.2679187, -0.7045406, -2.691591, 0, 1, 0.4235294, 1,
-0.2651887, 0.07715494, -1.505047, 0, 1, 0.4313726, 1,
-0.2631539, 0.5228504, -0.595085, 0, 1, 0.4352941, 1,
-0.2620197, 0.7953069, -0.3599358, 0, 1, 0.4431373, 1,
-0.2614216, -0.8680447, -1.08187, 0, 1, 0.4470588, 1,
-0.2571643, 0.6978249, -0.6230031, 0, 1, 0.454902, 1,
-0.2545267, 1.850933, -1.933615, 0, 1, 0.4588235, 1,
-0.2534272, 0.9805582, 1.193625, 0, 1, 0.4666667, 1,
-0.2505695, -0.001006477, -0.9244386, 0, 1, 0.4705882, 1,
-0.2505687, 1.335718, 0.6701544, 0, 1, 0.4784314, 1,
-0.2504732, 1.898836, 1.630612, 0, 1, 0.4823529, 1,
-0.2479954, -1.69336, -4.816972, 0, 1, 0.4901961, 1,
-0.2476571, -0.3731528, -3.565147, 0, 1, 0.4941176, 1,
-0.2411879, -2.015995, -2.180659, 0, 1, 0.5019608, 1,
-0.2392788, 0.2744013, -0.3919806, 0, 1, 0.509804, 1,
-0.2365039, 1.061509, -0.03313892, 0, 1, 0.5137255, 1,
-0.2341575, 0.1784869, -1.426624, 0, 1, 0.5215687, 1,
-0.2325092, -1.060354, -3.105188, 0, 1, 0.5254902, 1,
-0.2235713, -0.3062156, -2.563445, 0, 1, 0.5333334, 1,
-0.2217424, 1.119762, 0.4409647, 0, 1, 0.5372549, 1,
-0.2133774, 0.2973973, 0.8477742, 0, 1, 0.5450981, 1,
-0.2124525, -0.6599834, -1.945136, 0, 1, 0.5490196, 1,
-0.2110686, 0.8856049, 0.998443, 0, 1, 0.5568628, 1,
-0.2109546, 1.610456, -0.3080304, 0, 1, 0.5607843, 1,
-0.2077181, -0.1194857, 0.1874551, 0, 1, 0.5686275, 1,
-0.2045257, -0.2521283, -2.312724, 0, 1, 0.572549, 1,
-0.2027173, -1.014221, -0.9598808, 0, 1, 0.5803922, 1,
-0.1967938, 1.183401, -1.562895, 0, 1, 0.5843138, 1,
-0.1948695, 0.3544182, 0.08909789, 0, 1, 0.5921569, 1,
-0.1922581, -0.2277875, -2.850075, 0, 1, 0.5960785, 1,
-0.190201, -0.5854903, -4.44809, 0, 1, 0.6039216, 1,
-0.1873381, -1.050223, -3.976678, 0, 1, 0.6117647, 1,
-0.1851354, 1.972025, 0.7947602, 0, 1, 0.6156863, 1,
-0.1811581, -0.1538907, -1.616138, 0, 1, 0.6235294, 1,
-0.1756409, 0.2126135, -1.281657, 0, 1, 0.627451, 1,
-0.1753465, -0.1452921, -1.269668, 0, 1, 0.6352941, 1,
-0.1736322, 0.4605305, 0.4067629, 0, 1, 0.6392157, 1,
-0.1734989, -1.10299, -3.435865, 0, 1, 0.6470588, 1,
-0.1682972, -0.6960464, -2.328492, 0, 1, 0.6509804, 1,
-0.1589452, -0.1840651, -3.365937, 0, 1, 0.6588235, 1,
-0.1582119, -0.285034, -4.721328, 0, 1, 0.6627451, 1,
-0.1571764, -1.390454, -4.693374, 0, 1, 0.6705883, 1,
-0.1543672, 1.708746, 0.3822049, 0, 1, 0.6745098, 1,
-0.1532077, 2.808254, -2.723623, 0, 1, 0.682353, 1,
-0.1515545, -0.4751013, -3.696306, 0, 1, 0.6862745, 1,
-0.1474985, 0.9899164, 0.4730691, 0, 1, 0.6941177, 1,
-0.1435964, 1.169333, -0.8393487, 0, 1, 0.7019608, 1,
-0.1388329, 0.8505977, 1.872064, 0, 1, 0.7058824, 1,
-0.1388291, 0.8653987, -0.07846161, 0, 1, 0.7137255, 1,
-0.1230485, -1.746346, -2.299484, 0, 1, 0.7176471, 1,
-0.1230435, 0.7382017, 1.307445, 0, 1, 0.7254902, 1,
-0.1204195, -0.7800897, -3.978322, 0, 1, 0.7294118, 1,
-0.1196838, -0.9160344, -4.010504, 0, 1, 0.7372549, 1,
-0.1194973, 1.570433, -1.640651, 0, 1, 0.7411765, 1,
-0.1184144, 0.4877839, 0.06539623, 0, 1, 0.7490196, 1,
-0.1160644, -0.01009995, -2.293252, 0, 1, 0.7529412, 1,
-0.113588, 0.6003797, -0.0587777, 0, 1, 0.7607843, 1,
-0.1129331, 0.0903987, -2.134741, 0, 1, 0.7647059, 1,
-0.11011, 0.4747789, -0.4997333, 0, 1, 0.772549, 1,
-0.1093516, 0.05068399, -2.064378, 0, 1, 0.7764706, 1,
-0.1090851, 0.0912862, -2.455372, 0, 1, 0.7843137, 1,
-0.1069108, 0.6891211, -0.6689485, 0, 1, 0.7882353, 1,
-0.1066968, -0.5287516, -1.703514, 0, 1, 0.7960784, 1,
-0.102875, -0.2292658, -3.613501, 0, 1, 0.8039216, 1,
-0.1026765, -0.2976713, -3.559889, 0, 1, 0.8078431, 1,
-0.1020851, -0.06141734, -1.28847, 0, 1, 0.8156863, 1,
-0.1019097, 1.982818, -0.005863527, 0, 1, 0.8196079, 1,
-0.09630825, -1.62739, -2.946594, 0, 1, 0.827451, 1,
-0.09522195, -0.6370115, -2.883117, 0, 1, 0.8313726, 1,
-0.09264421, 0.3039219, 0.5085332, 0, 1, 0.8392157, 1,
-0.09263154, -0.239559, -4.508953, 0, 1, 0.8431373, 1,
-0.09221894, -1.320028, -3.855349, 0, 1, 0.8509804, 1,
-0.09033287, -0.6229641, -3.913945, 0, 1, 0.854902, 1,
-0.09013662, -0.6697322, -1.805167, 0, 1, 0.8627451, 1,
-0.08516955, -0.2963749, -2.047471, 0, 1, 0.8666667, 1,
-0.07900469, 0.01003794, -1.997727, 0, 1, 0.8745098, 1,
-0.07586717, 0.6870047, -0.2001238, 0, 1, 0.8784314, 1,
-0.0757722, 0.08300222, -2.222535, 0, 1, 0.8862745, 1,
-0.07436516, 0.7529192, -0.5870265, 0, 1, 0.8901961, 1,
-0.0739935, -0.5657179, -2.935473, 0, 1, 0.8980392, 1,
-0.07339442, 0.1090827, -2.207466, 0, 1, 0.9058824, 1,
-0.06979708, -0.03939452, -2.196691, 0, 1, 0.9098039, 1,
-0.06848884, -0.02080642, -1.441868, 0, 1, 0.9176471, 1,
-0.06786948, -0.2930257, -3.185808, 0, 1, 0.9215686, 1,
-0.06646264, -0.693055, -1.338904, 0, 1, 0.9294118, 1,
-0.06374554, 0.8771952, -0.7541615, 0, 1, 0.9333333, 1,
-0.06329638, -0.08074989, -3.164264, 0, 1, 0.9411765, 1,
-0.06319359, 1.325348, 1.171774, 0, 1, 0.945098, 1,
-0.06303269, -1.875955, -4.087355, 0, 1, 0.9529412, 1,
-0.06296927, 0.1344852, -0.3866265, 0, 1, 0.9568627, 1,
-0.06232053, 0.2865547, -1.478485, 0, 1, 0.9647059, 1,
-0.06071384, -0.9759974, -2.331194, 0, 1, 0.9686275, 1,
-0.05903414, -1.445433, -2.239608, 0, 1, 0.9764706, 1,
-0.05696816, -0.4728467, -2.815822, 0, 1, 0.9803922, 1,
-0.05522896, -0.01450791, -0.5040546, 0, 1, 0.9882353, 1,
-0.05451096, -1.532323, -1.666414, 0, 1, 0.9921569, 1,
-0.05411299, -1.081296, -2.234654, 0, 1, 1, 1,
-0.05228782, 0.4834828, -0.8261986, 0, 0.9921569, 1, 1,
-0.05157507, -0.992632, -3.524378, 0, 0.9882353, 1, 1,
-0.05061491, -0.1096074, -1.828796, 0, 0.9803922, 1, 1,
-0.04897077, 0.5078371, 0.7381642, 0, 0.9764706, 1, 1,
-0.04507967, -0.6693514, -2.66218, 0, 0.9686275, 1, 1,
-0.04345832, -1.993788, -1.933485, 0, 0.9647059, 1, 1,
-0.03968015, -0.1555677, -2.241885, 0, 0.9568627, 1, 1,
-0.03459123, 0.1134135, -0.63699, 0, 0.9529412, 1, 1,
-0.02900775, -0.147851, -2.038319, 0, 0.945098, 1, 1,
-0.02586646, -0.1173226, -2.310942, 0, 0.9411765, 1, 1,
-0.0252556, -0.5709138, -4.842036, 0, 0.9333333, 1, 1,
-0.02409401, 0.6531255, -0.9106917, 0, 0.9294118, 1, 1,
-0.02340345, 0.5363762, -0.7035818, 0, 0.9215686, 1, 1,
-0.020797, 0.0750336, -1.475853, 0, 0.9176471, 1, 1,
-0.02061206, -0.01128665, -1.817014, 0, 0.9098039, 1, 1,
-0.01701679, 0.9705075, 0.4616087, 0, 0.9058824, 1, 1,
-0.01176216, 0.0478178, -1.551075, 0, 0.8980392, 1, 1,
-0.01159672, -0.6439015, -3.45145, 0, 0.8901961, 1, 1,
-0.003085012, -1.475794, -4.081984, 0, 0.8862745, 1, 1,
0.001209945, -0.2023508, 4.588401, 0, 0.8784314, 1, 1,
0.002204886, 1.505561, -0.006827802, 0, 0.8745098, 1, 1,
0.005148781, -2.410211, 3.096843, 0, 0.8666667, 1, 1,
0.005811312, -1.662563, 1.637272, 0, 0.8627451, 1, 1,
0.008815221, 0.0001690447, 1.34379, 0, 0.854902, 1, 1,
0.009153211, -0.380385, 2.877956, 0, 0.8509804, 1, 1,
0.0109745, -1.656339, 2.392672, 0, 0.8431373, 1, 1,
0.01198022, 1.184928, 0.8786954, 0, 0.8392157, 1, 1,
0.01469645, -0.001441353, 1.38846, 0, 0.8313726, 1, 1,
0.01569114, 1.197918, -0.5438747, 0, 0.827451, 1, 1,
0.01815513, 0.1366967, -0.02940967, 0, 0.8196079, 1, 1,
0.019355, 1.378166, 0.08512417, 0, 0.8156863, 1, 1,
0.02160299, 0.3681843, 1.716427, 0, 0.8078431, 1, 1,
0.03014061, -0.3321787, 4.134463, 0, 0.8039216, 1, 1,
0.04230205, 1.641803, 0.21199, 0, 0.7960784, 1, 1,
0.04397261, -0.09400325, 2.518332, 0, 0.7882353, 1, 1,
0.05223627, -0.8825566, 5.381721, 0, 0.7843137, 1, 1,
0.0524476, 0.3453488, 0.4606293, 0, 0.7764706, 1, 1,
0.05655252, 0.2192803, -1.023073, 0, 0.772549, 1, 1,
0.06116379, 2.420067, 0.4591564, 0, 0.7647059, 1, 1,
0.06139851, 0.4655834, 0.6018922, 0, 0.7607843, 1, 1,
0.06215679, 0.7534671, -1.744554, 0, 0.7529412, 1, 1,
0.07191834, -1.635331, 0.6468334, 0, 0.7490196, 1, 1,
0.07363717, 0.2583215, 0.4183406, 0, 0.7411765, 1, 1,
0.07800805, -1.668322, 2.003707, 0, 0.7372549, 1, 1,
0.07805295, -0.8332356, 1.445829, 0, 0.7294118, 1, 1,
0.08600513, -0.55279, 3.721314, 0, 0.7254902, 1, 1,
0.08808749, -0.2899148, 1.664751, 0, 0.7176471, 1, 1,
0.08935913, 0.4380865, -0.4485269, 0, 0.7137255, 1, 1,
0.08958945, -1.882472, 4.313266, 0, 0.7058824, 1, 1,
0.09280562, 1.224524, 0.4090232, 0, 0.6980392, 1, 1,
0.09688294, 0.2951675, 0.7528336, 0, 0.6941177, 1, 1,
0.09704082, -0.2368186, 2.031933, 0, 0.6862745, 1, 1,
0.0977957, -1.206329, 3.640217, 0, 0.682353, 1, 1,
0.09934151, 0.2181714, -0.3600183, 0, 0.6745098, 1, 1,
0.09948786, 0.8771201, 0.5489481, 0, 0.6705883, 1, 1,
0.1001898, 0.6170694, -1.126259, 0, 0.6627451, 1, 1,
0.102572, 0.01864301, 1.622213, 0, 0.6588235, 1, 1,
0.109337, -1.073335, 2.325936, 0, 0.6509804, 1, 1,
0.1140579, -1.07191, 2.253526, 0, 0.6470588, 1, 1,
0.1158273, -0.7654423, 2.37574, 0, 0.6392157, 1, 1,
0.1166199, 0.5491012, -0.1796171, 0, 0.6352941, 1, 1,
0.1204557, -0.6977354, 2.634495, 0, 0.627451, 1, 1,
0.1226062, -1.363099, 1.955422, 0, 0.6235294, 1, 1,
0.1242218, -0.5037259, 0.9557996, 0, 0.6156863, 1, 1,
0.1254212, -0.4462465, 3.335446, 0, 0.6117647, 1, 1,
0.1292235, 0.5493637, -1.715094, 0, 0.6039216, 1, 1,
0.1307566, -1.570926, 5.539011, 0, 0.5960785, 1, 1,
0.13315, 0.08760869, 2.408446, 0, 0.5921569, 1, 1,
0.1354507, 1.839061, -0.3675557, 0, 0.5843138, 1, 1,
0.1377371, 1.264436, 0.9764366, 0, 0.5803922, 1, 1,
0.1411463, -0.5702622, 2.25739, 0, 0.572549, 1, 1,
0.1445635, 0.2515807, -1.005136, 0, 0.5686275, 1, 1,
0.1485016, -0.836147, 3.156008, 0, 0.5607843, 1, 1,
0.1485029, -0.9914245, 3.163102, 0, 0.5568628, 1, 1,
0.1485665, -1.270159, 2.796308, 0, 0.5490196, 1, 1,
0.1507158, -0.536017, 2.402435, 0, 0.5450981, 1, 1,
0.1513431, -0.7852697, 2.21923, 0, 0.5372549, 1, 1,
0.1529178, 0.4329078, -0.001824245, 0, 0.5333334, 1, 1,
0.1543365, 0.5820945, 1.206401, 0, 0.5254902, 1, 1,
0.1574149, -0.7549601, 2.782522, 0, 0.5215687, 1, 1,
0.1577227, 0.8667801, -1.392123, 0, 0.5137255, 1, 1,
0.1616372, -0.8907191, 2.837394, 0, 0.509804, 1, 1,
0.1624677, -0.9732015, 1.896269, 0, 0.5019608, 1, 1,
0.1634814, -0.8191816, 2.712128, 0, 0.4941176, 1, 1,
0.1661546, 1.780445, -0.3229451, 0, 0.4901961, 1, 1,
0.1662797, -0.1037427, 3.058955, 0, 0.4823529, 1, 1,
0.1667487, 1.295603, 0.9875157, 0, 0.4784314, 1, 1,
0.1771913, -1.573875, 3.733607, 0, 0.4705882, 1, 1,
0.1804363, 0.1973704, 0.6545286, 0, 0.4666667, 1, 1,
0.1832801, 1.765109, -1.014444, 0, 0.4588235, 1, 1,
0.1837667, 0.06647401, 0.6348143, 0, 0.454902, 1, 1,
0.1839927, -0.08722541, 0.5581012, 0, 0.4470588, 1, 1,
0.186079, -2.492276, 4.12724, 0, 0.4431373, 1, 1,
0.1871849, 1.328947, 0.7638803, 0, 0.4352941, 1, 1,
0.1893382, 0.5685447, -0.1229353, 0, 0.4313726, 1, 1,
0.1894189, 0.4423903, -1.149688, 0, 0.4235294, 1, 1,
0.1914545, -0.7531568, 2.820212, 0, 0.4196078, 1, 1,
0.1931748, 0.620218, -0.5395783, 0, 0.4117647, 1, 1,
0.1943774, 0.0304757, 1.425146, 0, 0.4078431, 1, 1,
0.196785, -0.05389719, 2.918535, 0, 0.4, 1, 1,
0.1984696, -0.5334539, 3.711868, 0, 0.3921569, 1, 1,
0.1993906, 1.213718, -2.578996, 0, 0.3882353, 1, 1,
0.1998771, 1.098538, -0.8643326, 0, 0.3803922, 1, 1,
0.2004259, -0.07515439, 1.327449, 0, 0.3764706, 1, 1,
0.2006958, 2.169118, -1.275216, 0, 0.3686275, 1, 1,
0.2013784, 1.198128, 1.864694, 0, 0.3647059, 1, 1,
0.2013785, 0.2727502, 0.0008957689, 0, 0.3568628, 1, 1,
0.2051004, -1.268063, 4.164582, 0, 0.3529412, 1, 1,
0.2079085, 0.1571845, 0.6417353, 0, 0.345098, 1, 1,
0.2100773, -0.9272124, 2.672653, 0, 0.3411765, 1, 1,
0.2103544, 0.9654659, 2.416099, 0, 0.3333333, 1, 1,
0.2168491, 1.549176, 0.08873477, 0, 0.3294118, 1, 1,
0.2181397, 0.5624363, -0.4483922, 0, 0.3215686, 1, 1,
0.2183428, 0.101245, 2.836556, 0, 0.3176471, 1, 1,
0.2190411, -0.6787625, 3.879765, 0, 0.3098039, 1, 1,
0.2201596, 0.7219236, -0.5936819, 0, 0.3058824, 1, 1,
0.223829, 1.371279, -1.010874, 0, 0.2980392, 1, 1,
0.2261378, 1.405716, -0.02435987, 0, 0.2901961, 1, 1,
0.2267869, -0.9944041, 3.733089, 0, 0.2862745, 1, 1,
0.234037, -0.03966817, 0.30313, 0, 0.2784314, 1, 1,
0.2350014, -1.426967, 4.50104, 0, 0.2745098, 1, 1,
0.2411252, 1.112259, 0.5307457, 0, 0.2666667, 1, 1,
0.2420074, -0.4613409, 2.946204, 0, 0.2627451, 1, 1,
0.2430626, -0.8785828, 2.01128, 0, 0.254902, 1, 1,
0.2437375, -0.08908592, 2.505229, 0, 0.2509804, 1, 1,
0.2439845, -1.461807, 4.370785, 0, 0.2431373, 1, 1,
0.2556853, -0.08891858, 1.046507, 0, 0.2392157, 1, 1,
0.2570177, -0.268943, 1.821159, 0, 0.2313726, 1, 1,
0.2598615, -0.07294603, 3.439601, 0, 0.227451, 1, 1,
0.2601477, 0.01655337, 2.282493, 0, 0.2196078, 1, 1,
0.261788, -0.2788668, 3.387435, 0, 0.2156863, 1, 1,
0.264091, -0.3417641, 2.288889, 0, 0.2078431, 1, 1,
0.268152, 0.8942319, -0.2498362, 0, 0.2039216, 1, 1,
0.2711914, -0.7117701, 3.755775, 0, 0.1960784, 1, 1,
0.2798393, -1.077918, 5.081673, 0, 0.1882353, 1, 1,
0.2810504, -2.229771, 1.993365, 0, 0.1843137, 1, 1,
0.2812141, 1.430162, -0.06328012, 0, 0.1764706, 1, 1,
0.2864827, -0.8509695, 1.108372, 0, 0.172549, 1, 1,
0.2896839, -1.363667, 2.733219, 0, 0.1647059, 1, 1,
0.2932037, 0.9778177, 0.9792266, 0, 0.1607843, 1, 1,
0.294593, 1.18747, 1.843938, 0, 0.1529412, 1, 1,
0.2986535, 0.02550095, 1.52081, 0, 0.1490196, 1, 1,
0.3037843, 0.8989404, -1.185284, 0, 0.1411765, 1, 1,
0.3045789, -0.5536126, 2.752938, 0, 0.1372549, 1, 1,
0.3059288, 0.04528595, 0.1214713, 0, 0.1294118, 1, 1,
0.3132896, 1.285732, -1.155918, 0, 0.1254902, 1, 1,
0.3175412, 0.9509133, -1.084871, 0, 0.1176471, 1, 1,
0.3181025, -0.8162232, 2.234013, 0, 0.1137255, 1, 1,
0.3203568, 0.1023066, 1.560417, 0, 0.1058824, 1, 1,
0.3269256, 1.309549, -0.9548313, 0, 0.09803922, 1, 1,
0.3286271, 1.410179, 0.9239399, 0, 0.09411765, 1, 1,
0.3300462, -1.384831, 2.110455, 0, 0.08627451, 1, 1,
0.3309009, 1.545848, -1.801344, 0, 0.08235294, 1, 1,
0.3334222, 0.7593763, 0.06620068, 0, 0.07450981, 1, 1,
0.3406446, -1.382818, 1.970876, 0, 0.07058824, 1, 1,
0.3541299, 0.06808039, 2.069339, 0, 0.0627451, 1, 1,
0.3570659, 0.01783936, 1.631517, 0, 0.05882353, 1, 1,
0.3600256, 1.597124, 1.313354, 0, 0.05098039, 1, 1,
0.3612157, 0.9733428, -0.1316803, 0, 0.04705882, 1, 1,
0.3704886, -0.4693135, 2.065551, 0, 0.03921569, 1, 1,
0.3724275, -0.01901757, 1.324149, 0, 0.03529412, 1, 1,
0.373928, -0.06792643, 3.068987, 0, 0.02745098, 1, 1,
0.3766851, -0.1091985, 2.559933, 0, 0.02352941, 1, 1,
0.3834161, -0.9835946, 2.561268, 0, 0.01568628, 1, 1,
0.3855611, -1.329462, 4.029298, 0, 0.01176471, 1, 1,
0.3856032, -0.3848152, 1.973644, 0, 0.003921569, 1, 1,
0.39422, 0.4229133, -0.3350633, 0.003921569, 0, 1, 1,
0.403445, 0.5331457, 0.9631711, 0.007843138, 0, 1, 1,
0.4040241, -0.1639119, 1.72245, 0.01568628, 0, 1, 1,
0.407221, -0.4542558, 3.197454, 0.01960784, 0, 1, 1,
0.4165381, -2.254601, 0.5371007, 0.02745098, 0, 1, 1,
0.4236555, -0.6938622, 2.06439, 0.03137255, 0, 1, 1,
0.4243421, -1.717588, 1.063989, 0.03921569, 0, 1, 1,
0.4291315, -0.2870748, 2.763242, 0.04313726, 0, 1, 1,
0.4322728, 0.9638495, 1.257129, 0.05098039, 0, 1, 1,
0.4358164, -0.1000383, 0.8320448, 0.05490196, 0, 1, 1,
0.4413253, 0.9832399, 0.7045609, 0.0627451, 0, 1, 1,
0.4451841, -1.031688, 1.416432, 0.06666667, 0, 1, 1,
0.4490452, 0.5767328, 1.064574, 0.07450981, 0, 1, 1,
0.452877, -0.009181807, -0.07516199, 0.07843138, 0, 1, 1,
0.4569736, -1.381837, 3.728549, 0.08627451, 0, 1, 1,
0.4591578, 0.0696663, 0.2778567, 0.09019608, 0, 1, 1,
0.4598075, -1.683972, 3.78802, 0.09803922, 0, 1, 1,
0.4610053, 0.9797157, 0.5498156, 0.1058824, 0, 1, 1,
0.4616392, -0.587152, 2.291967, 0.1098039, 0, 1, 1,
0.4625761, 0.9822319, -0.8554539, 0.1176471, 0, 1, 1,
0.4661034, 2.627401, -0.5644596, 0.1215686, 0, 1, 1,
0.4666348, 0.8651351, 1.907539, 0.1294118, 0, 1, 1,
0.4674732, 0.9909435, 0.4530146, 0.1333333, 0, 1, 1,
0.4710421, -0.5455118, 1.435428, 0.1411765, 0, 1, 1,
0.4713902, 0.7918676, 0.05203937, 0.145098, 0, 1, 1,
0.4743266, -0.2508486, 4.317066, 0.1529412, 0, 1, 1,
0.4757302, 0.2560651, -0.02757988, 0.1568628, 0, 1, 1,
0.4834119, 0.5567917, 1.233783, 0.1647059, 0, 1, 1,
0.4888526, -0.1434799, -0.3841075, 0.1686275, 0, 1, 1,
0.498145, -0.5899091, 2.554004, 0.1764706, 0, 1, 1,
0.499597, 0.3735898, 1.535753, 0.1803922, 0, 1, 1,
0.4996469, -1.102161, 2.926831, 0.1882353, 0, 1, 1,
0.5037423, -1.185799, 4.110738, 0.1921569, 0, 1, 1,
0.5054259, -0.3546953, 2.456394, 0.2, 0, 1, 1,
0.5094145, -0.0717487, 2.612796, 0.2078431, 0, 1, 1,
0.510195, -0.388649, 3.173978, 0.2117647, 0, 1, 1,
0.5137919, 1.80996, 0.08722674, 0.2196078, 0, 1, 1,
0.5142238, -0.1458164, 2.017684, 0.2235294, 0, 1, 1,
0.5168459, 0.535409, -0.06926839, 0.2313726, 0, 1, 1,
0.517405, 1.271598, 0.3649397, 0.2352941, 0, 1, 1,
0.5227401, 0.110752, 0.05514205, 0.2431373, 0, 1, 1,
0.5236952, 1.075055, 0.6504593, 0.2470588, 0, 1, 1,
0.5237697, -1.896395, 2.472176, 0.254902, 0, 1, 1,
0.5308681, -1.733601, 3.350815, 0.2588235, 0, 1, 1,
0.5310801, 0.06379622, 2.597018, 0.2666667, 0, 1, 1,
0.5414204, 0.04130868, 1.790443, 0.2705882, 0, 1, 1,
0.5431831, 0.5934252, -1.028753, 0.2784314, 0, 1, 1,
0.5444058, -0.7816951, 2.288127, 0.282353, 0, 1, 1,
0.5449881, -1.430546, 2.49665, 0.2901961, 0, 1, 1,
0.5450638, -0.09772778, 1.547128, 0.2941177, 0, 1, 1,
0.5451118, 0.7536672, -0.6118298, 0.3019608, 0, 1, 1,
0.5469741, 0.2759962, 1.846895, 0.3098039, 0, 1, 1,
0.5523466, -1.811248, 3.04469, 0.3137255, 0, 1, 1,
0.5563087, -0.1202567, 1.047515, 0.3215686, 0, 1, 1,
0.5604928, 1.741565, -1.842729, 0.3254902, 0, 1, 1,
0.5615568, -1.050698, 0.9453368, 0.3333333, 0, 1, 1,
0.5641795, -1.414234, 3.546593, 0.3372549, 0, 1, 1,
0.5677472, 0.06450547, 1.723168, 0.345098, 0, 1, 1,
0.569152, -1.706438, 3.447561, 0.3490196, 0, 1, 1,
0.5707709, 0.9113643, 0.5759632, 0.3568628, 0, 1, 1,
0.5714208, 0.4648235, 1.24311, 0.3607843, 0, 1, 1,
0.5738232, 0.9190693, 0.05626127, 0.3686275, 0, 1, 1,
0.5764839, 0.8701088, -0.3259971, 0.372549, 0, 1, 1,
0.5797731, -1.142087, 2.647891, 0.3803922, 0, 1, 1,
0.5805121, 0.7579792, 1.919609, 0.3843137, 0, 1, 1,
0.5816386, -0.8072532, 3.544623, 0.3921569, 0, 1, 1,
0.5822933, 1.809234, -1.677599, 0.3960784, 0, 1, 1,
0.5846898, -0.219876, 3.443788, 0.4039216, 0, 1, 1,
0.5871966, 0.239624, 1.347958, 0.4117647, 0, 1, 1,
0.5903062, -1.732732, 2.951605, 0.4156863, 0, 1, 1,
0.5920768, 0.01132864, 1.165657, 0.4235294, 0, 1, 1,
0.5928998, -0.9105273, 3.007924, 0.427451, 0, 1, 1,
0.5940101, 1.859223, 0.692462, 0.4352941, 0, 1, 1,
0.5945179, -0.319757, 2.038239, 0.4392157, 0, 1, 1,
0.6010828, -0.7687792, 4.159206, 0.4470588, 0, 1, 1,
0.6024871, 0.9211757, 1.828901, 0.4509804, 0, 1, 1,
0.6120182, 1.081869, 0.3241517, 0.4588235, 0, 1, 1,
0.6121461, 1.358003, -0.740739, 0.4627451, 0, 1, 1,
0.6138107, -0.6573266, 3.425201, 0.4705882, 0, 1, 1,
0.6174784, 1.035953, -1.825343, 0.4745098, 0, 1, 1,
0.6192434, -0.6623035, 4.317849, 0.4823529, 0, 1, 1,
0.6192905, 0.600113, 2.23265, 0.4862745, 0, 1, 1,
0.6196994, 0.4155055, 1.258559, 0.4941176, 0, 1, 1,
0.6200956, -0.8367671, 1.385502, 0.5019608, 0, 1, 1,
0.6334178, -0.6206828, 1.398181, 0.5058824, 0, 1, 1,
0.6341296, 0.570783, 2.313467, 0.5137255, 0, 1, 1,
0.6372129, -0.5359049, 1.755775, 0.5176471, 0, 1, 1,
0.6393345, -0.4337118, 3.050124, 0.5254902, 0, 1, 1,
0.6394228, -1.627337, 2.56634, 0.5294118, 0, 1, 1,
0.64794, 1.41952, 0.09056813, 0.5372549, 0, 1, 1,
0.6489483, 0.6063324, -0.7698104, 0.5411765, 0, 1, 1,
0.6510987, 2.030503, 0.2209365, 0.5490196, 0, 1, 1,
0.6558192, -0.8147873, 2.801235, 0.5529412, 0, 1, 1,
0.6678922, 0.6236953, 0.1537648, 0.5607843, 0, 1, 1,
0.6766021, 2.099065, 0.04781318, 0.5647059, 0, 1, 1,
0.6795911, -0.6774556, 1.944715, 0.572549, 0, 1, 1,
0.6817529, -0.3175373, 2.360274, 0.5764706, 0, 1, 1,
0.68348, -0.2436124, 2.934948, 0.5843138, 0, 1, 1,
0.6949401, -0.9886411, 2.155539, 0.5882353, 0, 1, 1,
0.6966466, 1.506531, 0.8794702, 0.5960785, 0, 1, 1,
0.7035071, 0.8350012, 0.06037189, 0.6039216, 0, 1, 1,
0.7038426, -0.3274636, 3.328119, 0.6078432, 0, 1, 1,
0.7112603, 0.6393611, 1.842709, 0.6156863, 0, 1, 1,
0.7178524, 0.08409656, 0.8736577, 0.6196079, 0, 1, 1,
0.719739, -0.0320939, -0.0653732, 0.627451, 0, 1, 1,
0.7267761, 1.555767, -0.005371379, 0.6313726, 0, 1, 1,
0.7311184, 1.80227, -0.2134871, 0.6392157, 0, 1, 1,
0.7327495, -0.4301727, 4.443079, 0.6431373, 0, 1, 1,
0.7345411, -0.05567293, 2.295868, 0.6509804, 0, 1, 1,
0.7381891, -0.5677471, 3.323852, 0.654902, 0, 1, 1,
0.7394661, -0.8521899, 2.104055, 0.6627451, 0, 1, 1,
0.7483102, -0.5090314, 2.107399, 0.6666667, 0, 1, 1,
0.7514871, -1.715773, 3.656901, 0.6745098, 0, 1, 1,
0.7521983, -1.984725, 1.859162, 0.6784314, 0, 1, 1,
0.7546416, 0.005902691, 2.964624, 0.6862745, 0, 1, 1,
0.7586746, 0.7580702, 1.47615, 0.6901961, 0, 1, 1,
0.7615841, -0.1402441, 2.300968, 0.6980392, 0, 1, 1,
0.768419, -0.4365749, 3.163671, 0.7058824, 0, 1, 1,
0.7691319, 0.8504221, 0.4513788, 0.7098039, 0, 1, 1,
0.7768359, -0.9894875, 1.292242, 0.7176471, 0, 1, 1,
0.7812216, -0.2566411, 2.051913, 0.7215686, 0, 1, 1,
0.7824581, -0.2775514, 2.462539, 0.7294118, 0, 1, 1,
0.7830256, 0.6137964, 0.2493916, 0.7333333, 0, 1, 1,
0.7942407, -0.3999499, 1.992912, 0.7411765, 0, 1, 1,
0.7997463, -0.2891877, 2.800067, 0.7450981, 0, 1, 1,
0.8002407, 0.4900268, 1.736958, 0.7529412, 0, 1, 1,
0.8040404, -0.2300101, 0.8196254, 0.7568628, 0, 1, 1,
0.8123763, 1.483699, 1.89017, 0.7647059, 0, 1, 1,
0.8143409, -0.4997846, 1.854456, 0.7686275, 0, 1, 1,
0.8213213, -1.426385, 2.307869, 0.7764706, 0, 1, 1,
0.8269762, -0.5260845, 2.378986, 0.7803922, 0, 1, 1,
0.8309737, 1.785143, 1.429194, 0.7882353, 0, 1, 1,
0.8318599, -1.559519, 3.204781, 0.7921569, 0, 1, 1,
0.8362452, -0.826659, 1.02471, 0.8, 0, 1, 1,
0.8424837, 0.4329423, -1.625625, 0.8078431, 0, 1, 1,
0.846544, -0.3085803, 0.6907279, 0.8117647, 0, 1, 1,
0.8492242, 0.5434346, 0.5586445, 0.8196079, 0, 1, 1,
0.8494126, 1.795236, 0.4818169, 0.8235294, 0, 1, 1,
0.8515212, 1.406381, 0.4506231, 0.8313726, 0, 1, 1,
0.8537725, -0.7641967, 2.437856, 0.8352941, 0, 1, 1,
0.8556469, 0.2241122, 2.781356, 0.8431373, 0, 1, 1,
0.8585782, -0.1020965, 1.247004, 0.8470588, 0, 1, 1,
0.8612942, 0.9166592, 1.955361, 0.854902, 0, 1, 1,
0.8634183, -0.7770066, 1.208609, 0.8588235, 0, 1, 1,
0.8680413, -0.7624372, 2.848962, 0.8666667, 0, 1, 1,
0.8778552, 0.02150218, 2.14407, 0.8705882, 0, 1, 1,
0.8818967, 0.8252527, 2.366583, 0.8784314, 0, 1, 1,
0.882886, 0.3019589, 1.247242, 0.8823529, 0, 1, 1,
0.896185, -0.4462111, 2.995265, 0.8901961, 0, 1, 1,
0.9004157, 0.1610346, 1.440401, 0.8941177, 0, 1, 1,
0.9035569, -0.1137272, 1.802761, 0.9019608, 0, 1, 1,
0.9052005, -0.7079509, 2.310295, 0.9098039, 0, 1, 1,
0.9141963, -0.01504467, 0.5608112, 0.9137255, 0, 1, 1,
0.9181226, 0.1620559, 0.9030216, 0.9215686, 0, 1, 1,
0.9199824, 0.784538, 0.808382, 0.9254902, 0, 1, 1,
0.9235869, -0.7593973, 1.486458, 0.9333333, 0, 1, 1,
0.9274333, -1.203379, 2.646958, 0.9372549, 0, 1, 1,
0.9279261, -0.5333192, 2.611467, 0.945098, 0, 1, 1,
0.9389375, -0.188726, 1.284309, 0.9490196, 0, 1, 1,
0.9414605, 1.047855, 0.7008712, 0.9568627, 0, 1, 1,
0.9516474, 0.5223404, 1.492468, 0.9607843, 0, 1, 1,
0.9575856, 1.77892, 1.584568, 0.9686275, 0, 1, 1,
0.9596921, 0.09451707, 0.387107, 0.972549, 0, 1, 1,
0.9624576, -1.020434, 1.85745, 0.9803922, 0, 1, 1,
0.9630008, -0.5586922, 3.113616, 0.9843137, 0, 1, 1,
0.9631292, -0.7451617, -0.2946028, 0.9921569, 0, 1, 1,
0.9642123, -1.935811, 3.483288, 0.9960784, 0, 1, 1,
0.9680471, -0.8897865, 0.9037611, 1, 0, 0.9960784, 1,
0.9704188, -1.519628, 3.995968, 1, 0, 0.9882353, 1,
0.9714018, -1.288754, 1.895776, 1, 0, 0.9843137, 1,
0.9770649, -0.1102571, 1.29832, 1, 0, 0.9764706, 1,
0.9787145, 1.477125, 0.01849097, 1, 0, 0.972549, 1,
0.9830905, 0.6989925, -0.5780347, 1, 0, 0.9647059, 1,
0.9843754, 0.285145, 1.135699, 1, 0, 0.9607843, 1,
0.9855155, 0.7417363, 0.03341747, 1, 0, 0.9529412, 1,
0.9881331, -0.02294783, 2.359212, 1, 0, 0.9490196, 1,
0.9916397, 0.2483791, 0.6339499, 1, 0, 0.9411765, 1,
1.001261, 0.7494537, 0.8639394, 1, 0, 0.9372549, 1,
1.001359, 0.7801104, 1.227695, 1, 0, 0.9294118, 1,
1.001974, 1.33887, 2.723783, 1, 0, 0.9254902, 1,
1.010884, 0.5314607, 1.029323, 1, 0, 0.9176471, 1,
1.014338, -1.935099, 1.83151, 1, 0, 0.9137255, 1,
1.02196, 0.2264151, -0.1234297, 1, 0, 0.9058824, 1,
1.023702, -1.119417, 2.529564, 1, 0, 0.9019608, 1,
1.025607, -0.1553746, 2.199259, 1, 0, 0.8941177, 1,
1.025994, -0.5636276, 2.156914, 1, 0, 0.8862745, 1,
1.029826, -1.709585, 2.428846, 1, 0, 0.8823529, 1,
1.033715, 0.8476713, 3.398872, 1, 0, 0.8745098, 1,
1.033919, 0.03084598, 2.023468, 1, 0, 0.8705882, 1,
1.036796, 0.6811884, 0.8806255, 1, 0, 0.8627451, 1,
1.03936, -2.116235, 3.917774, 1, 0, 0.8588235, 1,
1.042785, -0.3272595, 2.08787, 1, 0, 0.8509804, 1,
1.046401, -1.775765, 1.672364, 1, 0, 0.8470588, 1,
1.050382, 0.1410281, 2.130281, 1, 0, 0.8392157, 1,
1.065695, -0.192324, 0.3794087, 1, 0, 0.8352941, 1,
1.066011, 1.016667, 1.347692, 1, 0, 0.827451, 1,
1.069325, -0.2793838, 1.60211, 1, 0, 0.8235294, 1,
1.070458, 0.8784934, -0.008673068, 1, 0, 0.8156863, 1,
1.079296, -1.278143, 0.5985225, 1, 0, 0.8117647, 1,
1.080604, 0.3632774, 0.6090072, 1, 0, 0.8039216, 1,
1.081601, -0.1688909, 1.481218, 1, 0, 0.7960784, 1,
1.089154, -1.374799, 1.550125, 1, 0, 0.7921569, 1,
1.089244, 0.201001, 1.671848, 1, 0, 0.7843137, 1,
1.0913, -1.279624, 4.652659, 1, 0, 0.7803922, 1,
1.098746, -0.9269071, 1.390214, 1, 0, 0.772549, 1,
1.100914, -0.3614649, 2.162977, 1, 0, 0.7686275, 1,
1.104968, -0.02972463, 1.730986, 1, 0, 0.7607843, 1,
1.107838, 0.008084857, 2.187387, 1, 0, 0.7568628, 1,
1.110631, 0.8449663, 1.455159, 1, 0, 0.7490196, 1,
1.117035, 1.594657, -0.870473, 1, 0, 0.7450981, 1,
1.121578, 0.2800917, 1.723458, 1, 0, 0.7372549, 1,
1.123636, -0.3735972, 1.998024, 1, 0, 0.7333333, 1,
1.12632, -0.09860905, 1.724943, 1, 0, 0.7254902, 1,
1.134865, -1.116596, 2.411561, 1, 0, 0.7215686, 1,
1.165952, 0.4885879, 0.1758084, 1, 0, 0.7137255, 1,
1.182105, -0.790631, 3.37361, 1, 0, 0.7098039, 1,
1.186075, -1.301197, 2.426828, 1, 0, 0.7019608, 1,
1.187846, 1.064405, 2.387521, 1, 0, 0.6941177, 1,
1.18962, -0.4148903, 1.577674, 1, 0, 0.6901961, 1,
1.189973, -2.35328, 2.943036, 1, 0, 0.682353, 1,
1.197951, 0.05326781, 0.3364698, 1, 0, 0.6784314, 1,
1.211211, -1.57005, 2.456696, 1, 0, 0.6705883, 1,
1.226577, 0.435692, 1.872644, 1, 0, 0.6666667, 1,
1.226872, -1.08138, -0.003718911, 1, 0, 0.6588235, 1,
1.227623, 0.3311495, 3.024205, 1, 0, 0.654902, 1,
1.230842, -1.520984, 1.906533, 1, 0, 0.6470588, 1,
1.248351, 0.8777433, 1.941571, 1, 0, 0.6431373, 1,
1.256461, -0.1960535, 1.919648, 1, 0, 0.6352941, 1,
1.262657, -1.574477, 4.430586, 1, 0, 0.6313726, 1,
1.282373, 0.1699563, 1.383515, 1, 0, 0.6235294, 1,
1.28325, 1.632985, 1.264896, 1, 0, 0.6196079, 1,
1.290088, 0.260904, 1.838794, 1, 0, 0.6117647, 1,
1.290748, -0.1044905, 2.064417, 1, 0, 0.6078432, 1,
1.29386, -0.7215109, 3.504752, 1, 0, 0.6, 1,
1.297794, -0.01386147, 0.1390121, 1, 0, 0.5921569, 1,
1.303795, 0.674427, 0.04254033, 1, 0, 0.5882353, 1,
1.306136, 0.1919344, 3.536787, 1, 0, 0.5803922, 1,
1.309497, 0.07078462, 0.778937, 1, 0, 0.5764706, 1,
1.3145, -1.492694, 0.9886977, 1, 0, 0.5686275, 1,
1.320463, 0.1557547, -0.1754782, 1, 0, 0.5647059, 1,
1.321303, 0.6209542, 2.30408, 1, 0, 0.5568628, 1,
1.324717, -0.4603438, 1.270813, 1, 0, 0.5529412, 1,
1.331778, -0.548213, 2.503703, 1, 0, 0.5450981, 1,
1.36089, 0.6408856, 0.3457957, 1, 0, 0.5411765, 1,
1.361676, -1.734836, 3.969433, 1, 0, 0.5333334, 1,
1.369356, 0.1144623, 3.340341, 1, 0, 0.5294118, 1,
1.373467, -0.246153, 2.600111, 1, 0, 0.5215687, 1,
1.384266, -0.03844691, 2.618708, 1, 0, 0.5176471, 1,
1.386964, 0.002288475, 2.604468, 1, 0, 0.509804, 1,
1.387322, 0.3141875, 0.5688863, 1, 0, 0.5058824, 1,
1.389813, -0.4405171, 2.382933, 1, 0, 0.4980392, 1,
1.391183, 0.3408115, 2.183167, 1, 0, 0.4901961, 1,
1.39186, 0.9656884, 2.662025, 1, 0, 0.4862745, 1,
1.399165, 0.3492232, 2.840186, 1, 0, 0.4784314, 1,
1.403791, 0.8506374, 1.970821, 1, 0, 0.4745098, 1,
1.405323, -0.1329487, 0.4094721, 1, 0, 0.4666667, 1,
1.405929, 2.236574, -0.6152551, 1, 0, 0.4627451, 1,
1.416614, -1.513814, 2.017324, 1, 0, 0.454902, 1,
1.426943, 0.3536409, 3.050516, 1, 0, 0.4509804, 1,
1.428583, -0.9829735, 0.468295, 1, 0, 0.4431373, 1,
1.429925, -0.321591, 1.911538, 1, 0, 0.4392157, 1,
1.431585, -0.6053737, 2.24923, 1, 0, 0.4313726, 1,
1.433173, -0.4492721, 2.332088, 1, 0, 0.427451, 1,
1.435852, 0.03566734, 2.665614, 1, 0, 0.4196078, 1,
1.440664, 0.3365225, 1.210577, 1, 0, 0.4156863, 1,
1.449673, 0.8999647, 1.99216, 1, 0, 0.4078431, 1,
1.45034, -0.3241485, 1.610164, 1, 0, 0.4039216, 1,
1.450948, 0.4824825, -1.097894, 1, 0, 0.3960784, 1,
1.455452, 0.3041797, 1.738233, 1, 0, 0.3882353, 1,
1.461285, 0.6634141, 1.710452, 1, 0, 0.3843137, 1,
1.471524, 1.300857, 1.813614, 1, 0, 0.3764706, 1,
1.478927, 0.9139342, 2.407282, 1, 0, 0.372549, 1,
1.482566, -1.233436, 1.931526, 1, 0, 0.3647059, 1,
1.490471, 0.824881, 2.003311, 1, 0, 0.3607843, 1,
1.497324, -2.558532, 3.935773, 1, 0, 0.3529412, 1,
1.499653, 1.842473, 0.8607667, 1, 0, 0.3490196, 1,
1.511101, 0.1106557, 1.579509, 1, 0, 0.3411765, 1,
1.511118, 1.412795, 1.918665, 1, 0, 0.3372549, 1,
1.513851, 0.1027778, -0.6706346, 1, 0, 0.3294118, 1,
1.516682, -1.366932, 2.207207, 1, 0, 0.3254902, 1,
1.531497, 0.3408212, -0.1317031, 1, 0, 0.3176471, 1,
1.536034, 0.01513689, 0.1424923, 1, 0, 0.3137255, 1,
1.561517, 0.9539607, 2.300517, 1, 0, 0.3058824, 1,
1.566948, 0.811538, 1.545964, 1, 0, 0.2980392, 1,
1.576744, -0.5553383, 2.681571, 1, 0, 0.2941177, 1,
1.591406, -0.1532957, 2.607561, 1, 0, 0.2862745, 1,
1.59295, -0.06501272, 2.846221, 1, 0, 0.282353, 1,
1.610128, -0.1406612, 0.606038, 1, 0, 0.2745098, 1,
1.657039, 0.8494225, 2.711804, 1, 0, 0.2705882, 1,
1.657468, 0.4658206, -0.3162489, 1, 0, 0.2627451, 1,
1.670956, 1.232064, 1.631889, 1, 0, 0.2588235, 1,
1.685107, 0.3543978, 0.06231586, 1, 0, 0.2509804, 1,
1.692055, 2.62853, 1.338303, 1, 0, 0.2470588, 1,
1.694217, 0.7533496, 0.99643, 1, 0, 0.2392157, 1,
1.725105, -0.2697019, 1.354822, 1, 0, 0.2352941, 1,
1.738247, 1.144182, 1.775932, 1, 0, 0.227451, 1,
1.749163, 0.2303601, 1.036983, 1, 0, 0.2235294, 1,
1.756639, 1.37522, 1.839675, 1, 0, 0.2156863, 1,
1.760051, -0.7947907, 2.659067, 1, 0, 0.2117647, 1,
1.770128, -0.5727708, 1.394643, 1, 0, 0.2039216, 1,
1.789856, -0.6032144, 0.9125869, 1, 0, 0.1960784, 1,
1.795549, 0.5642422, 2.106536, 1, 0, 0.1921569, 1,
1.79879, 0.6722496, 0.5950142, 1, 0, 0.1843137, 1,
1.810161, 1.294139, 2.848943, 1, 0, 0.1803922, 1,
1.816687, 0.1255031, 3.821349, 1, 0, 0.172549, 1,
1.837273, -1.016, -0.1331927, 1, 0, 0.1686275, 1,
1.846041, -0.65751, 0.0008764114, 1, 0, 0.1607843, 1,
1.846647, -0.7896817, 2.340798, 1, 0, 0.1568628, 1,
1.867201, -0.1534578, 0.6739154, 1, 0, 0.1490196, 1,
1.882337, -0.6850485, 2.356367, 1, 0, 0.145098, 1,
1.886434, -1.061862, 3.034445, 1, 0, 0.1372549, 1,
1.975025, 2.076214, -0.6288723, 1, 0, 0.1333333, 1,
2.017939, 0.5730938, 1.251904, 1, 0, 0.1254902, 1,
2.027122, 0.5113558, -0.6636232, 1, 0, 0.1215686, 1,
2.048635, 0.2477669, 1.697349, 1, 0, 0.1137255, 1,
2.049431, -0.5857646, 1.939293, 1, 0, 0.1098039, 1,
2.050947, 1.10424, 0.2363634, 1, 0, 0.1019608, 1,
2.081139, -0.7288114, 0.7945111, 1, 0, 0.09411765, 1,
2.127331, -0.2678605, 0.4955526, 1, 0, 0.09019608, 1,
2.166664, -0.01751724, 1.067087, 1, 0, 0.08235294, 1,
2.177653, 1.645421, 0.9537443, 1, 0, 0.07843138, 1,
2.20275, -0.365333, 1.940552, 1, 0, 0.07058824, 1,
2.228502, -0.06583189, 2.041919, 1, 0, 0.06666667, 1,
2.274845, 0.2014255, 1.898602, 1, 0, 0.05882353, 1,
2.287484, 0.5146101, -0.4924839, 1, 0, 0.05490196, 1,
2.303356, -0.1648391, -0.04041297, 1, 0, 0.04705882, 1,
2.352682, -0.3784774, 3.802994, 1, 0, 0.04313726, 1,
2.40665, -0.7912784, 1.183304, 1, 0, 0.03529412, 1,
2.40986, 0.8262769, 1.740575, 1, 0, 0.03137255, 1,
2.469808, 0.5538071, 0.2655838, 1, 0, 0.02352941, 1,
3.072028, -0.2962433, 0.1686867, 1, 0, 0.01960784, 1,
3.227561, 0.7335981, 1.600382, 1, 0, 0.01176471, 1,
3.912841, 0.3428285, 1.018483, 1, 0, 0.007843138, 1
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
0.1518965, -3.468202, -6.601623, 0, -0.5, 0.5, 0.5,
0.1518965, -3.468202, -6.601623, 1, -0.5, 0.5, 0.5,
0.1518965, -3.468202, -6.601623, 1, 1.5, 0.5, 0.5,
0.1518965, -3.468202, -6.601623, 0, 1.5, 0.5, 0.5
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
-4.884008, 0.1248611, -6.601623, 0, -0.5, 0.5, 0.5,
-4.884008, 0.1248611, -6.601623, 1, -0.5, 0.5, 0.5,
-4.884008, 0.1248611, -6.601623, 1, 1.5, 0.5, 0.5,
-4.884008, 0.1248611, -6.601623, 0, 1.5, 0.5, 0.5
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
-4.884008, -3.468202, 0.3484876, 0, -0.5, 0.5, 0.5,
-4.884008, -3.468202, 0.3484876, 1, -0.5, 0.5, 0.5,
-4.884008, -3.468202, 0.3484876, 1, 1.5, 0.5, 0.5,
-4.884008, -3.468202, 0.3484876, 0, 1.5, 0.5, 0.5
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
-2, -2.639034, -4.997751,
2, -2.639034, -4.997751,
-2, -2.639034, -4.997751,
-2, -2.777229, -5.265063,
0, -2.639034, -4.997751,
0, -2.777229, -5.265063,
2, -2.639034, -4.997751,
2, -2.777229, -5.265063
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
-2, -3.053618, -5.799687, 0, -0.5, 0.5, 0.5,
-2, -3.053618, -5.799687, 1, -0.5, 0.5, 0.5,
-2, -3.053618, -5.799687, 1, 1.5, 0.5, 0.5,
-2, -3.053618, -5.799687, 0, 1.5, 0.5, 0.5,
0, -3.053618, -5.799687, 0, -0.5, 0.5, 0.5,
0, -3.053618, -5.799687, 1, -0.5, 0.5, 0.5,
0, -3.053618, -5.799687, 1, 1.5, 0.5, 0.5,
0, -3.053618, -5.799687, 0, 1.5, 0.5, 0.5,
2, -3.053618, -5.799687, 0, -0.5, 0.5, 0.5,
2, -3.053618, -5.799687, 1, -0.5, 0.5, 0.5,
2, -3.053618, -5.799687, 1, 1.5, 0.5, 0.5,
2, -3.053618, -5.799687, 0, 1.5, 0.5, 0.5
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
-3.721876, -2, -4.997751,
-3.721876, 2, -4.997751,
-3.721876, -2, -4.997751,
-3.915565, -2, -5.265063,
-3.721876, -1, -4.997751,
-3.915565, -1, -5.265063,
-3.721876, 0, -4.997751,
-3.915565, 0, -5.265063,
-3.721876, 1, -4.997751,
-3.915565, 1, -5.265063,
-3.721876, 2, -4.997751,
-3.915565, 2, -5.265063
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
-4.302942, -2, -5.799687, 0, -0.5, 0.5, 0.5,
-4.302942, -2, -5.799687, 1, -0.5, 0.5, 0.5,
-4.302942, -2, -5.799687, 1, 1.5, 0.5, 0.5,
-4.302942, -2, -5.799687, 0, 1.5, 0.5, 0.5,
-4.302942, -1, -5.799687, 0, -0.5, 0.5, 0.5,
-4.302942, -1, -5.799687, 1, -0.5, 0.5, 0.5,
-4.302942, -1, -5.799687, 1, 1.5, 0.5, 0.5,
-4.302942, -1, -5.799687, 0, 1.5, 0.5, 0.5,
-4.302942, 0, -5.799687, 0, -0.5, 0.5, 0.5,
-4.302942, 0, -5.799687, 1, -0.5, 0.5, 0.5,
-4.302942, 0, -5.799687, 1, 1.5, 0.5, 0.5,
-4.302942, 0, -5.799687, 0, 1.5, 0.5, 0.5,
-4.302942, 1, -5.799687, 0, -0.5, 0.5, 0.5,
-4.302942, 1, -5.799687, 1, -0.5, 0.5, 0.5,
-4.302942, 1, -5.799687, 1, 1.5, 0.5, 0.5,
-4.302942, 1, -5.799687, 0, 1.5, 0.5, 0.5,
-4.302942, 2, -5.799687, 0, -0.5, 0.5, 0.5,
-4.302942, 2, -5.799687, 1, -0.5, 0.5, 0.5,
-4.302942, 2, -5.799687, 1, 1.5, 0.5, 0.5,
-4.302942, 2, -5.799687, 0, 1.5, 0.5, 0.5
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
-3.721876, -2.639034, -4,
-3.721876, -2.639034, 4,
-3.721876, -2.639034, -4,
-3.915565, -2.777229, -4,
-3.721876, -2.639034, -2,
-3.915565, -2.777229, -2,
-3.721876, -2.639034, 0,
-3.915565, -2.777229, 0,
-3.721876, -2.639034, 2,
-3.915565, -2.777229, 2,
-3.721876, -2.639034, 4,
-3.915565, -2.777229, 4
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
-4.302942, -3.053618, -4, 0, -0.5, 0.5, 0.5,
-4.302942, -3.053618, -4, 1, -0.5, 0.5, 0.5,
-4.302942, -3.053618, -4, 1, 1.5, 0.5, 0.5,
-4.302942, -3.053618, -4, 0, 1.5, 0.5, 0.5,
-4.302942, -3.053618, -2, 0, -0.5, 0.5, 0.5,
-4.302942, -3.053618, -2, 1, -0.5, 0.5, 0.5,
-4.302942, -3.053618, -2, 1, 1.5, 0.5, 0.5,
-4.302942, -3.053618, -2, 0, 1.5, 0.5, 0.5,
-4.302942, -3.053618, 0, 0, -0.5, 0.5, 0.5,
-4.302942, -3.053618, 0, 1, -0.5, 0.5, 0.5,
-4.302942, -3.053618, 0, 1, 1.5, 0.5, 0.5,
-4.302942, -3.053618, 0, 0, 1.5, 0.5, 0.5,
-4.302942, -3.053618, 2, 0, -0.5, 0.5, 0.5,
-4.302942, -3.053618, 2, 1, -0.5, 0.5, 0.5,
-4.302942, -3.053618, 2, 1, 1.5, 0.5, 0.5,
-4.302942, -3.053618, 2, 0, 1.5, 0.5, 0.5,
-4.302942, -3.053618, 4, 0, -0.5, 0.5, 0.5,
-4.302942, -3.053618, 4, 1, -0.5, 0.5, 0.5,
-4.302942, -3.053618, 4, 1, 1.5, 0.5, 0.5,
-4.302942, -3.053618, 4, 0, 1.5, 0.5, 0.5
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
-3.721876, -2.639034, -4.997751,
-3.721876, 2.888756, -4.997751,
-3.721876, -2.639034, 5.694726,
-3.721876, 2.888756, 5.694726,
-3.721876, -2.639034, -4.997751,
-3.721876, -2.639034, 5.694726,
-3.721876, 2.888756, -4.997751,
-3.721876, 2.888756, 5.694726,
-3.721876, -2.639034, -4.997751,
4.025669, -2.639034, -4.997751,
-3.721876, -2.639034, 5.694726,
4.025669, -2.639034, 5.694726,
-3.721876, 2.888756, -4.997751,
4.025669, 2.888756, -4.997751,
-3.721876, 2.888756, 5.694726,
4.025669, 2.888756, 5.694726,
4.025669, -2.639034, -4.997751,
4.025669, 2.888756, -4.997751,
4.025669, -2.639034, 5.694726,
4.025669, 2.888756, 5.694726,
4.025669, -2.639034, -4.997751,
4.025669, -2.639034, 5.694726,
4.025669, 2.888756, -4.997751,
4.025669, 2.888756, 5.694726
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
var radius = 7.64376;
var distance = 34.00795;
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
mvMatrix.translate( -0.1518965, -0.1248611, -0.3484876 );
mvMatrix.scale( 1.066736, 1.495097, 0.7729343 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.00795);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
ethylene_chloride_et<-read.table("ethylene_chloride_et.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 6 elements
```

```r
x<-ethylene_chloride_et$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_chloride_et' not found
```

```r
y<-ethylene_chloride_et$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_chloride_et' not found
```

```r
z<-ethylene_chloride_et$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_chloride_et' not found
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
-3.609048, -1.122128, -1.241367, 0, 0, 1, 1, 1,
-3.563559, 2.463078, 0.5106508, 1, 0, 0, 1, 1,
-3.402573, 0.854728, -1.147813, 1, 0, 0, 1, 1,
-3.267204, 1.139377, -1.670465, 1, 0, 0, 1, 1,
-2.901999, -0.4023201, -2.868371, 1, 0, 0, 1, 1,
-2.868991, -0.5859082, -0.7184296, 1, 0, 0, 1, 1,
-2.77805, 0.3549002, -1.161937, 0, 0, 0, 1, 1,
-2.603237, -0.11686, -2.38824, 0, 0, 0, 1, 1,
-2.601793, 1.06656, -0.7480894, 0, 0, 0, 1, 1,
-2.581668, -0.4338112, -3.191959, 0, 0, 0, 1, 1,
-2.489912, 1.206814, -1.464193, 0, 0, 0, 1, 1,
-2.447303, -0.5569618, -1.065417, 0, 0, 0, 1, 1,
-2.445151, -0.3985432, -2.890973, 0, 0, 0, 1, 1,
-2.424457, 0.1059065, -0.9920399, 1, 1, 1, 1, 1,
-2.377622, 0.0693829, -2.100086, 1, 1, 1, 1, 1,
-2.289101, 0.05605637, -1.011654, 1, 1, 1, 1, 1,
-2.263187, 0.7040013, -1.237335, 1, 1, 1, 1, 1,
-2.244533, 1.174963, -1.029752, 1, 1, 1, 1, 1,
-2.236681, -0.7222356, -2.662163, 1, 1, 1, 1, 1,
-2.214656, 1.479895, -1.630909, 1, 1, 1, 1, 1,
-2.19155, -0.9633284, -3.213725, 1, 1, 1, 1, 1,
-2.13052, 1.517225, -1.798037, 1, 1, 1, 1, 1,
-2.053677, 1.125934, 0.3561948, 1, 1, 1, 1, 1,
-2.051171, 1.383034, -1.205883, 1, 1, 1, 1, 1,
-1.927777, 0.8861829, -0.03254202, 1, 1, 1, 1, 1,
-1.89631, -0.02576692, -2.890247, 1, 1, 1, 1, 1,
-1.892876, 0.1013556, -2.041513, 1, 1, 1, 1, 1,
-1.861488, -0.4335135, -0.8356652, 1, 1, 1, 1, 1,
-1.844441, 0.6436334, -1.964907, 0, 0, 1, 1, 1,
-1.838071, 0.1009006, -1.829038, 1, 0, 0, 1, 1,
-1.812535, 1.116462, -0.6281238, 1, 0, 0, 1, 1,
-1.80305, 1.711009, -0.6753582, 1, 0, 0, 1, 1,
-1.80159, 0.9453304, -0.4392116, 1, 0, 0, 1, 1,
-1.787798, 0.6510763, -2.547793, 1, 0, 0, 1, 1,
-1.787032, 0.2484242, -0.9899561, 0, 0, 0, 1, 1,
-1.775495, 0.5662059, -1.186843, 0, 0, 0, 1, 1,
-1.755107, 0.1901456, -3.09903, 0, 0, 0, 1, 1,
-1.747084, 0.3281066, -1.822858, 0, 0, 0, 1, 1,
-1.745577, 0.1993484, -1.295062, 0, 0, 0, 1, 1,
-1.736805, -0.1032231, -0.3445582, 0, 0, 0, 1, 1,
-1.733626, 0.07409427, -1.429185, 0, 0, 0, 1, 1,
-1.732801, 0.9571691, -1.403594, 1, 1, 1, 1, 1,
-1.724052, -1.386991, -1.830178, 1, 1, 1, 1, 1,
-1.712325, 0.07948217, -1.178193, 1, 1, 1, 1, 1,
-1.709504, -0.07629048, -2.93642, 1, 1, 1, 1, 1,
-1.708234, -0.3397784, -1.165265, 1, 1, 1, 1, 1,
-1.705658, 0.4952625, -1.455836, 1, 1, 1, 1, 1,
-1.687765, 0.6528288, -1.001405, 1, 1, 1, 1, 1,
-1.668931, 1.216346, -2.633158, 1, 1, 1, 1, 1,
-1.653275, -0.316388, -1.60739, 1, 1, 1, 1, 1,
-1.64822, -1.70684, -1.492555, 1, 1, 1, 1, 1,
-1.647484, -1.063535, -2.11066, 1, 1, 1, 1, 1,
-1.627584, -1.670598, -2.092607, 1, 1, 1, 1, 1,
-1.627028, -1.326046, -2.626641, 1, 1, 1, 1, 1,
-1.625133, 0.7492238, -2.550927, 1, 1, 1, 1, 1,
-1.620559, 0.7086411, -1.530845, 1, 1, 1, 1, 1,
-1.617133, -0.431868, -0.9786018, 0, 0, 1, 1, 1,
-1.611278, 0.6077195, -0.3111165, 1, 0, 0, 1, 1,
-1.581288, -0.06972004, -3.802386, 1, 0, 0, 1, 1,
-1.571976, -0.627044, -1.827836, 1, 0, 0, 1, 1,
-1.562042, 1.086686, 0.1576119, 1, 0, 0, 1, 1,
-1.560876, 0.05110983, -1.788804, 1, 0, 0, 1, 1,
-1.560156, 0.6295533, -0.1721393, 0, 0, 0, 1, 1,
-1.548893, -1.56952, -1.896229, 0, 0, 0, 1, 1,
-1.542787, -1.025254, -1.419221, 0, 0, 0, 1, 1,
-1.531632, 0.7489972, -1.4842, 0, 0, 0, 1, 1,
-1.530855, 1.987583, -2.03752, 0, 0, 0, 1, 1,
-1.528144, -0.0652431, -1.925805, 0, 0, 0, 1, 1,
-1.527663, -0.3933131, -2.683156, 0, 0, 0, 1, 1,
-1.525621, -1.485265, -1.933097, 1, 1, 1, 1, 1,
-1.516039, -1.059561, -0.9593921, 1, 1, 1, 1, 1,
-1.513898, -0.2273035, -1.602706, 1, 1, 1, 1, 1,
-1.508972, 0.2539696, 2.059218, 1, 1, 1, 1, 1,
-1.491731, -0.002814325, -1.855334, 1, 1, 1, 1, 1,
-1.474162, 0.5021347, -0.6677487, 1, 1, 1, 1, 1,
-1.460211, -0.3854884, -3.065297, 1, 1, 1, 1, 1,
-1.451826, 0.9863583, -1.692814, 1, 1, 1, 1, 1,
-1.450836, -0.05007534, -2.241138, 1, 1, 1, 1, 1,
-1.450475, 0.6453342, -2.070687, 1, 1, 1, 1, 1,
-1.439098, -0.7388754, -4.760519, 1, 1, 1, 1, 1,
-1.434245, -1.694568, -2.133574, 1, 1, 1, 1, 1,
-1.43132, -0.3681043, -0.08912482, 1, 1, 1, 1, 1,
-1.431188, 0.8296638, -3.346773, 1, 1, 1, 1, 1,
-1.422738, -0.06942619, -2.604701, 1, 1, 1, 1, 1,
-1.418786, -0.1242205, -2.329161, 0, 0, 1, 1, 1,
-1.4184, 1.069994, -0.7609225, 1, 0, 0, 1, 1,
-1.417942, 1.582397, -2.320416, 1, 0, 0, 1, 1,
-1.409676, -0.09755938, -2.360041, 1, 0, 0, 1, 1,
-1.402966, -0.4228091, -2.054893, 1, 0, 0, 1, 1,
-1.389408, -0.01307816, -3.776476, 1, 0, 0, 1, 1,
-1.388838, -0.9436033, -2.469136, 0, 0, 0, 1, 1,
-1.387396, 0.3134758, -0.4463699, 0, 0, 0, 1, 1,
-1.382499, 0.1573613, -1.197966, 0, 0, 0, 1, 1,
-1.382279, -0.7896352, -2.260362, 0, 0, 0, 1, 1,
-1.37441, -2.198924, -2.351496, 0, 0, 0, 1, 1,
-1.373242, -0.376623, -0.7638225, 0, 0, 0, 1, 1,
-1.372431, 0.1553824, -1.974867, 0, 0, 0, 1, 1,
-1.359241, 0.5411463, 0.5159898, 1, 1, 1, 1, 1,
-1.349336, 0.007043429, -1.261799, 1, 1, 1, 1, 1,
-1.347802, -1.367526, -2.322975, 1, 1, 1, 1, 1,
-1.347801, -0.9390256, -1.271519, 1, 1, 1, 1, 1,
-1.345349, -1.575939, -3.518303, 1, 1, 1, 1, 1,
-1.338542, 0.07444186, 0.2928375, 1, 1, 1, 1, 1,
-1.319281, -1.693873, -2.075947, 1, 1, 1, 1, 1,
-1.317468, -0.5612853, 0.1198339, 1, 1, 1, 1, 1,
-1.311893, -0.879041, -3.67527, 1, 1, 1, 1, 1,
-1.298302, 0.8917987, 1.433528, 1, 1, 1, 1, 1,
-1.297701, -0.1014317, -1.978709, 1, 1, 1, 1, 1,
-1.287925, 0.8005502, -0.7940508, 1, 1, 1, 1, 1,
-1.287672, 0.3966839, -0.9898425, 1, 1, 1, 1, 1,
-1.284619, -1.045649, -2.769025, 1, 1, 1, 1, 1,
-1.275662, -0.4741728, -3.321469, 1, 1, 1, 1, 1,
-1.264477, -0.07541478, -1.235915, 0, 0, 1, 1, 1,
-1.259143, -2.07217, -2.965766, 1, 0, 0, 1, 1,
-1.2508, 0.08900858, -1.127485, 1, 0, 0, 1, 1,
-1.250579, 0.5765831, -1.629982, 1, 0, 0, 1, 1,
-1.23691, 0.9237272, -1.664892, 1, 0, 0, 1, 1,
-1.226392, -0.8634878, -2.08924, 1, 0, 0, 1, 1,
-1.224095, 0.05871428, -1.54177, 0, 0, 0, 1, 1,
-1.221496, -1.840456, -2.84349, 0, 0, 0, 1, 1,
-1.215518, 0.05629588, -2.42525, 0, 0, 0, 1, 1,
-1.213928, 0.5184981, -1.249276, 0, 0, 0, 1, 1,
-1.213333, 0.7018518, -0.4623402, 0, 0, 0, 1, 1,
-1.207604, -0.5329641, -1.817282, 0, 0, 0, 1, 1,
-1.20654, -0.83774, -1.773625, 0, 0, 0, 1, 1,
-1.202739, 0.6040965, -1.004747, 1, 1, 1, 1, 1,
-1.196676, 0.1515929, -2.255983, 1, 1, 1, 1, 1,
-1.191607, 0.07157911, -0.5909888, 1, 1, 1, 1, 1,
-1.188636, 0.6471362, -2.297534, 1, 1, 1, 1, 1,
-1.187464, 0.099508, -1.325934, 1, 1, 1, 1, 1,
-1.174575, -0.8103176, -3.518806, 1, 1, 1, 1, 1,
-1.158202, 0.04920847, -0.4099466, 1, 1, 1, 1, 1,
-1.156849, 1.312166, 0.05511501, 1, 1, 1, 1, 1,
-1.154346, 1.440593, -0.4202938, 1, 1, 1, 1, 1,
-1.148209, 0.5807722, -2.289722, 1, 1, 1, 1, 1,
-1.144987, -1.156192, -1.244132, 1, 1, 1, 1, 1,
-1.134895, 0.2983817, -1.719119, 1, 1, 1, 1, 1,
-1.133991, -0.1659966, -2.00511, 1, 1, 1, 1, 1,
-1.128863, -2.263089, -0.7402662, 1, 1, 1, 1, 1,
-1.127336, -0.9446486, -1.704121, 1, 1, 1, 1, 1,
-1.119896, 0.2916076, -1.513855, 0, 0, 1, 1, 1,
-1.119476, 0.1541922, -0.06783129, 1, 0, 0, 1, 1,
-1.114942, 0.347038, -0.9707444, 1, 0, 0, 1, 1,
-1.112263, 0.3826954, -0.9740627, 1, 0, 0, 1, 1,
-1.110848, -0.1613928, -1.980266, 1, 0, 0, 1, 1,
-1.10962, -0.1294245, -0.8148134, 1, 0, 0, 1, 1,
-1.100013, -0.9686022, -2.46487, 0, 0, 0, 1, 1,
-1.099645, -1.266643, -2.329389, 0, 0, 0, 1, 1,
-1.099613, 0.920972, -1.312729, 0, 0, 0, 1, 1,
-1.099416, -1.33092, -1.340197, 0, 0, 0, 1, 1,
-1.094691, 0.7930962, -0.5596071, 0, 0, 0, 1, 1,
-1.090769, 0.7485557, -0.3667477, 0, 0, 0, 1, 1,
-1.089601, -1.491609, -2.273837, 0, 0, 0, 1, 1,
-1.082869, -1.517779, -2.516281, 1, 1, 1, 1, 1,
-1.076196, -1.905732, -3.089564, 1, 1, 1, 1, 1,
-1.075657, -0.2828916, -1.639703, 1, 1, 1, 1, 1,
-1.07284, -1.26969, -2.515777, 1, 1, 1, 1, 1,
-1.070155, -1.035569, -1.46873, 1, 1, 1, 1, 1,
-1.068046, 0.1427968, -2.53896, 1, 1, 1, 1, 1,
-1.066877, -0.3788297, -0.03339054, 1, 1, 1, 1, 1,
-1.064042, 0.6614472, 0.01003049, 1, 1, 1, 1, 1,
-1.062475, -0.4180188, -2.092187, 1, 1, 1, 1, 1,
-1.061907, -1.294459, -2.140536, 1, 1, 1, 1, 1,
-1.058765, 0.2702159, -1.682063, 1, 1, 1, 1, 1,
-1.057978, 0.587721, -0.8005049, 1, 1, 1, 1, 1,
-1.057288, -0.4485044, -2.81326, 1, 1, 1, 1, 1,
-1.056125, -0.4540639, -2.409407, 1, 1, 1, 1, 1,
-1.045394, 0.493149, -0.9992095, 1, 1, 1, 1, 1,
-1.042566, -2.064388, -2.746619, 0, 0, 1, 1, 1,
-1.041285, 0.5325685, -2.399199, 1, 0, 0, 1, 1,
-1.039176, -0.6562543, -3.091191, 1, 0, 0, 1, 1,
-1.035862, -1.307351, -3.333532, 1, 0, 0, 1, 1,
-1.035169, 0.104449, -0.9816809, 1, 0, 0, 1, 1,
-1.031973, -0.1712925, -2.101169, 1, 0, 0, 1, 1,
-1.02924, 0.9566384, -1.318043, 0, 0, 0, 1, 1,
-1.027939, -0.4859971, -1.085493, 0, 0, 0, 1, 1,
-1.027147, -0.758509, -2.019034, 0, 0, 0, 1, 1,
-1.023047, 1.465346, -1.037945, 0, 0, 0, 1, 1,
-1.019143, -1.014486, -0.8850043, 0, 0, 0, 1, 1,
-1.017291, 0.3294536, -1.465478, 0, 0, 0, 1, 1,
-1.014992, -0.6995002, -0.5853019, 0, 0, 0, 1, 1,
-1.014807, 0.8842026, -0.07766817, 1, 1, 1, 1, 1,
-1.008332, -0.3614655, 0.4857695, 1, 1, 1, 1, 1,
-1.007148, 1.117975, -2.313665, 1, 1, 1, 1, 1,
-1.000333, -1.300431, -2.13853, 1, 1, 1, 1, 1,
-0.9992936, -0.03444247, -2.846887, 1, 1, 1, 1, 1,
-0.9946602, -0.9114061, -1.951757, 1, 1, 1, 1, 1,
-0.9904577, 0.8008332, 0.2731971, 1, 1, 1, 1, 1,
-0.9892966, -2.087977, -2.065595, 1, 1, 1, 1, 1,
-0.9818465, 1.404539, 1.896519, 1, 1, 1, 1, 1,
-0.976715, -0.4206631, -1.287549, 1, 1, 1, 1, 1,
-0.9760548, 1.175986, -0.3219745, 1, 1, 1, 1, 1,
-0.9692385, 1.532325, 0.1174221, 1, 1, 1, 1, 1,
-0.9663751, -1.448533, -2.586596, 1, 1, 1, 1, 1,
-0.9624992, -0.1752417, -3.586786, 1, 1, 1, 1, 1,
-0.9604384, 0.6644633, -0.6198914, 1, 1, 1, 1, 1,
-0.9565203, 1.246864, -0.8876986, 0, 0, 1, 1, 1,
-0.9538024, 0.2238442, -1.878517, 1, 0, 0, 1, 1,
-0.9521531, -1.852852, -3.532706, 1, 0, 0, 1, 1,
-0.9484226, -1.978464, -4.310087, 1, 0, 0, 1, 1,
-0.9470285, -0.2080676, -1.680176, 1, 0, 0, 1, 1,
-0.9454096, -1.303203, -1.866729, 1, 0, 0, 1, 1,
-0.9386218, 1.251004, 0.3318932, 0, 0, 0, 1, 1,
-0.9288982, 0.02588661, -0.8538494, 0, 0, 0, 1, 1,
-0.9267932, -0.4381202, -1.330173, 0, 0, 0, 1, 1,
-0.9108239, 1.472383, 0.7329155, 0, 0, 0, 1, 1,
-0.9056527, -1.240261, -4.839607, 0, 0, 0, 1, 1,
-0.8998797, 2.75287, -0.8947541, 0, 0, 0, 1, 1,
-0.8975282, 2.678552, 1.114126, 0, 0, 0, 1, 1,
-0.894415, -0.3945458, -3.630972, 1, 1, 1, 1, 1,
-0.8850156, 1.44742, -0.6513265, 1, 1, 1, 1, 1,
-0.8800145, -0.03478495, -1.877936, 1, 1, 1, 1, 1,
-0.8749627, -0.1821317, -3.095087, 1, 1, 1, 1, 1,
-0.8739812, -0.03814784, -2.164438, 1, 1, 1, 1, 1,
-0.8711821, 2.415869, -0.7411457, 1, 1, 1, 1, 1,
-0.8700467, -1.364362, -1.782813, 1, 1, 1, 1, 1,
-0.8678276, -0.4073245, -1.629143, 1, 1, 1, 1, 1,
-0.8614313, -0.3542829, -3.249852, 1, 1, 1, 1, 1,
-0.8548619, 0.4048522, -0.8997076, 1, 1, 1, 1, 1,
-0.8545789, 0.8524145, -1.466974, 1, 1, 1, 1, 1,
-0.8512213, -0.4408778, -0.6091898, 1, 1, 1, 1, 1,
-0.8395885, 0.5694762, -0.5924165, 1, 1, 1, 1, 1,
-0.8395083, 0.2511143, -1.87644, 1, 1, 1, 1, 1,
-0.832891, 0.414451, -1.960618, 1, 1, 1, 1, 1,
-0.8326302, -1.138899, -1.424348, 0, 0, 1, 1, 1,
-0.8308005, 0.7957288, 0.01783742, 1, 0, 0, 1, 1,
-0.8180009, 0.0735017, -3.212167, 1, 0, 0, 1, 1,
-0.8144602, -0.4343032, -2.034809, 1, 0, 0, 1, 1,
-0.8135603, -1.590494, -3.002554, 1, 0, 0, 1, 1,
-0.8000188, -2.276355, -1.733563, 1, 0, 0, 1, 1,
-0.7997428, -0.1934669, -0.05011262, 0, 0, 0, 1, 1,
-0.7957438, 0.002317745, -1.828031, 0, 0, 0, 1, 1,
-0.7952868, 1.827435, -1.22232, 0, 0, 0, 1, 1,
-0.7937017, -0.8322341, -1.732968, 0, 0, 0, 1, 1,
-0.7900774, 1.251644, -0.9568676, 0, 0, 0, 1, 1,
-0.78629, -0.2305777, -1.062774, 0, 0, 0, 1, 1,
-0.7808787, -0.8156186, -2.442591, 0, 0, 0, 1, 1,
-0.7768353, 0.4488773, -2.091599, 1, 1, 1, 1, 1,
-0.7699496, -0.7288548, -0.976452, 1, 1, 1, 1, 1,
-0.7681199, -1.476395, -2.480954, 1, 1, 1, 1, 1,
-0.7616898, 1.405822, -1.995949, 1, 1, 1, 1, 1,
-0.7560756, 1.238088, -2.597746, 1, 1, 1, 1, 1,
-0.7549535, -0.06028053, -2.628566, 1, 1, 1, 1, 1,
-0.7544441, -0.8157305, -3.477223, 1, 1, 1, 1, 1,
-0.7468343, -0.04619968, 0.1420702, 1, 1, 1, 1, 1,
-0.7463931, 1.10822, -1.266918, 1, 1, 1, 1, 1,
-0.7444714, 0.3344374, -1.977821, 1, 1, 1, 1, 1,
-0.7400614, 1.694509, -0.7233853, 1, 1, 1, 1, 1,
-0.7390542, -0.1749872, -1.299657, 1, 1, 1, 1, 1,
-0.7370351, 0.3664977, -1.998197, 1, 1, 1, 1, 1,
-0.7306412, -0.8667254, -2.054606, 1, 1, 1, 1, 1,
-0.7236004, -0.0477959, -2.261065, 1, 1, 1, 1, 1,
-0.722035, -0.2254441, -2.375156, 0, 0, 1, 1, 1,
-0.7198287, 0.2598933, -1.200719, 1, 0, 0, 1, 1,
-0.7153072, 0.9460046, -0.3459665, 1, 0, 0, 1, 1,
-0.7144231, 0.06669245, -0.3668173, 1, 0, 0, 1, 1,
-0.6945025, 2.155391, -2.681928, 1, 0, 0, 1, 1,
-0.6929309, 1.008133, -1.707156, 1, 0, 0, 1, 1,
-0.6926197, -0.172587, -2.321517, 0, 0, 0, 1, 1,
-0.6915652, -1.125077, -1.689752, 0, 0, 0, 1, 1,
-0.6893696, 1.473851, -1.125708, 0, 0, 0, 1, 1,
-0.6892445, -0.917272, -2.141917, 0, 0, 0, 1, 1,
-0.6882667, 0.0240896, -0.4995571, 0, 0, 0, 1, 1,
-0.6849349, 0.6390316, -2.016533, 0, 0, 0, 1, 1,
-0.6709528, -0.9531342, -2.096496, 0, 0, 0, 1, 1,
-0.6609807, 0.2539751, -0.7990317, 1, 1, 1, 1, 1,
-0.6604235, 2.382828, -1.950173, 1, 1, 1, 1, 1,
-0.652798, -0.977167, -3.358392, 1, 1, 1, 1, 1,
-0.6525801, 0.8156537, -0.2021451, 1, 1, 1, 1, 1,
-0.6478601, -0.648613, -3.749405, 1, 1, 1, 1, 1,
-0.6469641, 1.812095, -0.4976349, 1, 1, 1, 1, 1,
-0.6461721, -0.4352341, -1.684421, 1, 1, 1, 1, 1,
-0.6438395, 1.040287, -0.8990108, 1, 1, 1, 1, 1,
-0.6434369, -0.393426, -2.591982, 1, 1, 1, 1, 1,
-0.6422576, 0.0923523, -1.439452, 1, 1, 1, 1, 1,
-0.6401911, 1.169121, -1.18691, 1, 1, 1, 1, 1,
-0.6395758, -1.360021, -2.265099, 1, 1, 1, 1, 1,
-0.6377133, 0.8937904, -0.5887902, 1, 1, 1, 1, 1,
-0.6335561, -0.6776659, -2.843783, 1, 1, 1, 1, 1,
-0.6307823, 0.6374582, -0.6120619, 1, 1, 1, 1, 1,
-0.6282535, 0.6167265, -1.6095, 0, 0, 1, 1, 1,
-0.6265895, 0.9023285, -1.114048, 1, 0, 0, 1, 1,
-0.6247527, -0.7245218, -3.572126, 1, 0, 0, 1, 1,
-0.6246771, -2.530804, -2.152184, 1, 0, 0, 1, 1,
-0.620037, -0.8705989, -2.490582, 1, 0, 0, 1, 1,
-0.6155676, -0.1904295, -2.19055, 1, 0, 0, 1, 1,
-0.6151655, -0.2136983, -2.237419, 0, 0, 0, 1, 1,
-0.6063725, 2.294377, -1.355477, 0, 0, 0, 1, 1,
-0.6028334, 0.5846409, 0.3766459, 0, 0, 0, 1, 1,
-0.5980231, -0.2881249, -1.85212, 0, 0, 0, 1, 1,
-0.5975154, -0.07978689, -0.5390445, 0, 0, 0, 1, 1,
-0.5966955, 0.6570599, -0.1965722, 0, 0, 0, 1, 1,
-0.5961982, -0.08249295, -1.711724, 0, 0, 0, 1, 1,
-0.5951433, 1.471922, 0.09878605, 1, 1, 1, 1, 1,
-0.5824016, -0.01737276, -0.2237666, 1, 1, 1, 1, 1,
-0.5804999, 0.560762, 0.6694224, 1, 1, 1, 1, 1,
-0.5796821, 1.303997, -0.8114268, 1, 1, 1, 1, 1,
-0.5626078, -0.8170229, -2.09543, 1, 1, 1, 1, 1,
-0.5615361, -0.558598, -2.988737, 1, 1, 1, 1, 1,
-0.5561225, -0.0859221, -3.174716, 1, 1, 1, 1, 1,
-0.5559179, 0.06829125, -2.395569, 1, 1, 1, 1, 1,
-0.5554391, 1.11628, -1.518923, 1, 1, 1, 1, 1,
-0.5549416, 0.3925001, -0.05403206, 1, 1, 1, 1, 1,
-0.5517865, -0.5344212, -1.35511, 1, 1, 1, 1, 1,
-0.5485122, -0.7583187, -1.992983, 1, 1, 1, 1, 1,
-0.5478189, -0.02406711, -1.481314, 1, 1, 1, 1, 1,
-0.5464159, -0.5457671, -2.902771, 1, 1, 1, 1, 1,
-0.5451846, 0.7729135, -0.7492267, 1, 1, 1, 1, 1,
-0.543414, 0.6380166, -1.389119, 0, 0, 1, 1, 1,
-0.5429268, 0.07551391, -1.46643, 1, 0, 0, 1, 1,
-0.5428756, 0.5426272, -0.1058182, 1, 0, 0, 1, 1,
-0.5371743, 0.05259542, -1.421307, 1, 0, 0, 1, 1,
-0.5354272, -2.403098, -2.888022, 1, 0, 0, 1, 1,
-0.5350311, -1.262258, -3.588167, 1, 0, 0, 1, 1,
-0.5345204, -1.495701, -2.184759, 0, 0, 0, 1, 1,
-0.5338351, 0.327771, -0.6132823, 0, 0, 0, 1, 1,
-0.5156581, 0.5235998, -0.2900786, 0, 0, 0, 1, 1,
-0.5124092, 0.9732841, -0.2479571, 0, 0, 0, 1, 1,
-0.5081648, -0.4468982, -0.9706465, 0, 0, 0, 1, 1,
-0.5073578, -0.5953637, -1.595737, 0, 0, 0, 1, 1,
-0.5069318, -0.2098324, -0.8818762, 0, 0, 0, 1, 1,
-0.5059211, -0.8125072, -2.843875, 1, 1, 1, 1, 1,
-0.4967637, 1.090567, 0.8371292, 1, 1, 1, 1, 1,
-0.4957124, -0.9367586, -1.548542, 1, 1, 1, 1, 1,
-0.4939678, -1.008816, -2.468079, 1, 1, 1, 1, 1,
-0.4884858, 0.9693817, -0.3225129, 1, 1, 1, 1, 1,
-0.4846445, -0.7824721, -4.47953, 1, 1, 1, 1, 1,
-0.4803335, -0.3873805, -3.720323, 1, 1, 1, 1, 1,
-0.4794968, -0.07544928, -1.207978, 1, 1, 1, 1, 1,
-0.4781289, -0.08737714, -1.642698, 1, 1, 1, 1, 1,
-0.4721334, 0.8669364, -0.7727611, 1, 1, 1, 1, 1,
-0.4703534, -2.146103, -3.046052, 1, 1, 1, 1, 1,
-0.4637856, 0.7569578, -0.4261499, 1, 1, 1, 1, 1,
-0.4629138, -0.2825329, -0.5229855, 1, 1, 1, 1, 1,
-0.4578147, 2.250289, 0.125152, 1, 1, 1, 1, 1,
-0.4568491, 1.134339, -1.2592, 1, 1, 1, 1, 1,
-0.4561914, 1.013394, 0.5652578, 0, 0, 1, 1, 1,
-0.4561383, -0.6286704, -2.83112, 1, 0, 0, 1, 1,
-0.4549783, -0.4658167, -1.287987, 1, 0, 0, 1, 1,
-0.4513963, 2.252146, 0.28416, 1, 0, 0, 1, 1,
-0.4425449, 0.2670447, -1.05234, 1, 0, 0, 1, 1,
-0.4424479, -2.309148, -2.236733, 1, 0, 0, 1, 1,
-0.4403746, 0.1882554, 0.1880499, 0, 0, 0, 1, 1,
-0.4344615, -0.8116874, -2.216167, 0, 0, 0, 1, 1,
-0.4308087, 0.4467008, -0.9480232, 0, 0, 0, 1, 1,
-0.4306596, 1.778188, -0.6471382, 0, 0, 0, 1, 1,
-0.4293598, -1.217575, -2.954782, 0, 0, 0, 1, 1,
-0.4287479, 0.3293782, 0.01258916, 0, 0, 0, 1, 1,
-0.4281186, 0.1823876, -0.03535415, 0, 0, 0, 1, 1,
-0.4272482, 0.7214916, -1.093378, 1, 1, 1, 1, 1,
-0.4223422, -0.4317395, -0.6650196, 1, 1, 1, 1, 1,
-0.4202797, -0.1938485, -1.982262, 1, 1, 1, 1, 1,
-0.4175404, 1.2232, -0.3643435, 1, 1, 1, 1, 1,
-0.4146554, 1.831169, 0.07197816, 1, 1, 1, 1, 1,
-0.4086025, 0.2126241, -1.835848, 1, 1, 1, 1, 1,
-0.4051433, 0.1823408, -0.4518704, 1, 1, 1, 1, 1,
-0.4046178, -0.8571063, -1.966962, 1, 1, 1, 1, 1,
-0.404147, -0.2146586, -3.636434, 1, 1, 1, 1, 1,
-0.393916, -0.9486914, -4.252432, 1, 1, 1, 1, 1,
-0.3820473, 0.6085232, -2.004324, 1, 1, 1, 1, 1,
-0.3794489, 0.6602149, 0.01592129, 1, 1, 1, 1, 1,
-0.3781725, 0.4040069, -0.6710641, 1, 1, 1, 1, 1,
-0.3767762, -0.1686937, -1.609441, 1, 1, 1, 1, 1,
-0.3741587, 1.076991, 0.1931205, 1, 1, 1, 1, 1,
-0.3706638, -1.750226, -3.419278, 0, 0, 1, 1, 1,
-0.3695418, -0.3348872, -2.269435, 1, 0, 0, 1, 1,
-0.3692888, -1.590574, -1.722469, 1, 0, 0, 1, 1,
-0.3644089, 1.720171, -1.405787, 1, 0, 0, 1, 1,
-0.3613954, -1.368609, -3.187394, 1, 0, 0, 1, 1,
-0.3606548, 1.053022, 0.7835088, 1, 0, 0, 1, 1,
-0.3558856, 0.1957576, -3.743759, 0, 0, 0, 1, 1,
-0.3553983, -1.342771, -1.876324, 0, 0, 0, 1, 1,
-0.3527555, 0.5313513, -1.308338, 0, 0, 0, 1, 1,
-0.351369, 0.2851393, -1.843644, 0, 0, 0, 1, 1,
-0.3501469, 0.1092509, -0.3574536, 0, 0, 0, 1, 1,
-0.3499869, 1.590996, 1.218457, 0, 0, 0, 1, 1,
-0.349413, -0.03323663, -1.504777, 0, 0, 0, 1, 1,
-0.3416781, 0.7208635, -0.6373725, 1, 1, 1, 1, 1,
-0.3390922, 0.08107093, 0.6118593, 1, 1, 1, 1, 1,
-0.3386188, 0.4027817, -0.8425443, 1, 1, 1, 1, 1,
-0.3385811, -1.41622, -2.482248, 1, 1, 1, 1, 1,
-0.3373973, 1.097442, -2.472355, 1, 1, 1, 1, 1,
-0.3317159, -1.256362, -1.29029, 1, 1, 1, 1, 1,
-0.3305021, 0.2377849, -1.436035, 1, 1, 1, 1, 1,
-0.3258071, -0.1650821, -1.758545, 1, 1, 1, 1, 1,
-0.3202204, 0.5479656, -0.3560319, 1, 1, 1, 1, 1,
-0.3174788, -0.1290454, -2.605086, 1, 1, 1, 1, 1,
-0.3152481, -0.09175227, -1.919509, 1, 1, 1, 1, 1,
-0.3141515, -0.7055308, -2.123779, 1, 1, 1, 1, 1,
-0.3099544, 2.221474, 0.2456433, 1, 1, 1, 1, 1,
-0.3086481, -0.218468, -0.8535909, 1, 1, 1, 1, 1,
-0.2996774, -1.531931, -2.90007, 1, 1, 1, 1, 1,
-0.2925893, -0.842931, -3.529197, 0, 0, 1, 1, 1,
-0.2868799, -0.5862597, -1.292567, 1, 0, 0, 1, 1,
-0.2850233, 0.04384356, -1.221382, 1, 0, 0, 1, 1,
-0.2838175, 0.3275408, -1.692966, 1, 0, 0, 1, 1,
-0.2833975, -1.524145, -3.399432, 1, 0, 0, 1, 1,
-0.2827207, -0.08653678, -1.204292, 1, 0, 0, 1, 1,
-0.2824886, -0.6404341, -1.229974, 0, 0, 0, 1, 1,
-0.2811986, -1.455545, -2.680878, 0, 0, 0, 1, 1,
-0.2759832, -0.01966883, -0.1929848, 0, 0, 0, 1, 1,
-0.2750829, 0.04022543, -1.204339, 0, 0, 0, 1, 1,
-0.2729975, 0.005461908, -2.403095, 0, 0, 0, 1, 1,
-0.2699615, 0.732603, 0.999222, 0, 0, 0, 1, 1,
-0.2679187, -0.7045406, -2.691591, 0, 0, 0, 1, 1,
-0.2651887, 0.07715494, -1.505047, 1, 1, 1, 1, 1,
-0.2631539, 0.5228504, -0.595085, 1, 1, 1, 1, 1,
-0.2620197, 0.7953069, -0.3599358, 1, 1, 1, 1, 1,
-0.2614216, -0.8680447, -1.08187, 1, 1, 1, 1, 1,
-0.2571643, 0.6978249, -0.6230031, 1, 1, 1, 1, 1,
-0.2545267, 1.850933, -1.933615, 1, 1, 1, 1, 1,
-0.2534272, 0.9805582, 1.193625, 1, 1, 1, 1, 1,
-0.2505695, -0.001006477, -0.9244386, 1, 1, 1, 1, 1,
-0.2505687, 1.335718, 0.6701544, 1, 1, 1, 1, 1,
-0.2504732, 1.898836, 1.630612, 1, 1, 1, 1, 1,
-0.2479954, -1.69336, -4.816972, 1, 1, 1, 1, 1,
-0.2476571, -0.3731528, -3.565147, 1, 1, 1, 1, 1,
-0.2411879, -2.015995, -2.180659, 1, 1, 1, 1, 1,
-0.2392788, 0.2744013, -0.3919806, 1, 1, 1, 1, 1,
-0.2365039, 1.061509, -0.03313892, 1, 1, 1, 1, 1,
-0.2341575, 0.1784869, -1.426624, 0, 0, 1, 1, 1,
-0.2325092, -1.060354, -3.105188, 1, 0, 0, 1, 1,
-0.2235713, -0.3062156, -2.563445, 1, 0, 0, 1, 1,
-0.2217424, 1.119762, 0.4409647, 1, 0, 0, 1, 1,
-0.2133774, 0.2973973, 0.8477742, 1, 0, 0, 1, 1,
-0.2124525, -0.6599834, -1.945136, 1, 0, 0, 1, 1,
-0.2110686, 0.8856049, 0.998443, 0, 0, 0, 1, 1,
-0.2109546, 1.610456, -0.3080304, 0, 0, 0, 1, 1,
-0.2077181, -0.1194857, 0.1874551, 0, 0, 0, 1, 1,
-0.2045257, -0.2521283, -2.312724, 0, 0, 0, 1, 1,
-0.2027173, -1.014221, -0.9598808, 0, 0, 0, 1, 1,
-0.1967938, 1.183401, -1.562895, 0, 0, 0, 1, 1,
-0.1948695, 0.3544182, 0.08909789, 0, 0, 0, 1, 1,
-0.1922581, -0.2277875, -2.850075, 1, 1, 1, 1, 1,
-0.190201, -0.5854903, -4.44809, 1, 1, 1, 1, 1,
-0.1873381, -1.050223, -3.976678, 1, 1, 1, 1, 1,
-0.1851354, 1.972025, 0.7947602, 1, 1, 1, 1, 1,
-0.1811581, -0.1538907, -1.616138, 1, 1, 1, 1, 1,
-0.1756409, 0.2126135, -1.281657, 1, 1, 1, 1, 1,
-0.1753465, -0.1452921, -1.269668, 1, 1, 1, 1, 1,
-0.1736322, 0.4605305, 0.4067629, 1, 1, 1, 1, 1,
-0.1734989, -1.10299, -3.435865, 1, 1, 1, 1, 1,
-0.1682972, -0.6960464, -2.328492, 1, 1, 1, 1, 1,
-0.1589452, -0.1840651, -3.365937, 1, 1, 1, 1, 1,
-0.1582119, -0.285034, -4.721328, 1, 1, 1, 1, 1,
-0.1571764, -1.390454, -4.693374, 1, 1, 1, 1, 1,
-0.1543672, 1.708746, 0.3822049, 1, 1, 1, 1, 1,
-0.1532077, 2.808254, -2.723623, 1, 1, 1, 1, 1,
-0.1515545, -0.4751013, -3.696306, 0, 0, 1, 1, 1,
-0.1474985, 0.9899164, 0.4730691, 1, 0, 0, 1, 1,
-0.1435964, 1.169333, -0.8393487, 1, 0, 0, 1, 1,
-0.1388329, 0.8505977, 1.872064, 1, 0, 0, 1, 1,
-0.1388291, 0.8653987, -0.07846161, 1, 0, 0, 1, 1,
-0.1230485, -1.746346, -2.299484, 1, 0, 0, 1, 1,
-0.1230435, 0.7382017, 1.307445, 0, 0, 0, 1, 1,
-0.1204195, -0.7800897, -3.978322, 0, 0, 0, 1, 1,
-0.1196838, -0.9160344, -4.010504, 0, 0, 0, 1, 1,
-0.1194973, 1.570433, -1.640651, 0, 0, 0, 1, 1,
-0.1184144, 0.4877839, 0.06539623, 0, 0, 0, 1, 1,
-0.1160644, -0.01009995, -2.293252, 0, 0, 0, 1, 1,
-0.113588, 0.6003797, -0.0587777, 0, 0, 0, 1, 1,
-0.1129331, 0.0903987, -2.134741, 1, 1, 1, 1, 1,
-0.11011, 0.4747789, -0.4997333, 1, 1, 1, 1, 1,
-0.1093516, 0.05068399, -2.064378, 1, 1, 1, 1, 1,
-0.1090851, 0.0912862, -2.455372, 1, 1, 1, 1, 1,
-0.1069108, 0.6891211, -0.6689485, 1, 1, 1, 1, 1,
-0.1066968, -0.5287516, -1.703514, 1, 1, 1, 1, 1,
-0.102875, -0.2292658, -3.613501, 1, 1, 1, 1, 1,
-0.1026765, -0.2976713, -3.559889, 1, 1, 1, 1, 1,
-0.1020851, -0.06141734, -1.28847, 1, 1, 1, 1, 1,
-0.1019097, 1.982818, -0.005863527, 1, 1, 1, 1, 1,
-0.09630825, -1.62739, -2.946594, 1, 1, 1, 1, 1,
-0.09522195, -0.6370115, -2.883117, 1, 1, 1, 1, 1,
-0.09264421, 0.3039219, 0.5085332, 1, 1, 1, 1, 1,
-0.09263154, -0.239559, -4.508953, 1, 1, 1, 1, 1,
-0.09221894, -1.320028, -3.855349, 1, 1, 1, 1, 1,
-0.09033287, -0.6229641, -3.913945, 0, 0, 1, 1, 1,
-0.09013662, -0.6697322, -1.805167, 1, 0, 0, 1, 1,
-0.08516955, -0.2963749, -2.047471, 1, 0, 0, 1, 1,
-0.07900469, 0.01003794, -1.997727, 1, 0, 0, 1, 1,
-0.07586717, 0.6870047, -0.2001238, 1, 0, 0, 1, 1,
-0.0757722, 0.08300222, -2.222535, 1, 0, 0, 1, 1,
-0.07436516, 0.7529192, -0.5870265, 0, 0, 0, 1, 1,
-0.0739935, -0.5657179, -2.935473, 0, 0, 0, 1, 1,
-0.07339442, 0.1090827, -2.207466, 0, 0, 0, 1, 1,
-0.06979708, -0.03939452, -2.196691, 0, 0, 0, 1, 1,
-0.06848884, -0.02080642, -1.441868, 0, 0, 0, 1, 1,
-0.06786948, -0.2930257, -3.185808, 0, 0, 0, 1, 1,
-0.06646264, -0.693055, -1.338904, 0, 0, 0, 1, 1,
-0.06374554, 0.8771952, -0.7541615, 1, 1, 1, 1, 1,
-0.06329638, -0.08074989, -3.164264, 1, 1, 1, 1, 1,
-0.06319359, 1.325348, 1.171774, 1, 1, 1, 1, 1,
-0.06303269, -1.875955, -4.087355, 1, 1, 1, 1, 1,
-0.06296927, 0.1344852, -0.3866265, 1, 1, 1, 1, 1,
-0.06232053, 0.2865547, -1.478485, 1, 1, 1, 1, 1,
-0.06071384, -0.9759974, -2.331194, 1, 1, 1, 1, 1,
-0.05903414, -1.445433, -2.239608, 1, 1, 1, 1, 1,
-0.05696816, -0.4728467, -2.815822, 1, 1, 1, 1, 1,
-0.05522896, -0.01450791, -0.5040546, 1, 1, 1, 1, 1,
-0.05451096, -1.532323, -1.666414, 1, 1, 1, 1, 1,
-0.05411299, -1.081296, -2.234654, 1, 1, 1, 1, 1,
-0.05228782, 0.4834828, -0.8261986, 1, 1, 1, 1, 1,
-0.05157507, -0.992632, -3.524378, 1, 1, 1, 1, 1,
-0.05061491, -0.1096074, -1.828796, 1, 1, 1, 1, 1,
-0.04897077, 0.5078371, 0.7381642, 0, 0, 1, 1, 1,
-0.04507967, -0.6693514, -2.66218, 1, 0, 0, 1, 1,
-0.04345832, -1.993788, -1.933485, 1, 0, 0, 1, 1,
-0.03968015, -0.1555677, -2.241885, 1, 0, 0, 1, 1,
-0.03459123, 0.1134135, -0.63699, 1, 0, 0, 1, 1,
-0.02900775, -0.147851, -2.038319, 1, 0, 0, 1, 1,
-0.02586646, -0.1173226, -2.310942, 0, 0, 0, 1, 1,
-0.0252556, -0.5709138, -4.842036, 0, 0, 0, 1, 1,
-0.02409401, 0.6531255, -0.9106917, 0, 0, 0, 1, 1,
-0.02340345, 0.5363762, -0.7035818, 0, 0, 0, 1, 1,
-0.020797, 0.0750336, -1.475853, 0, 0, 0, 1, 1,
-0.02061206, -0.01128665, -1.817014, 0, 0, 0, 1, 1,
-0.01701679, 0.9705075, 0.4616087, 0, 0, 0, 1, 1,
-0.01176216, 0.0478178, -1.551075, 1, 1, 1, 1, 1,
-0.01159672, -0.6439015, -3.45145, 1, 1, 1, 1, 1,
-0.003085012, -1.475794, -4.081984, 1, 1, 1, 1, 1,
0.001209945, -0.2023508, 4.588401, 1, 1, 1, 1, 1,
0.002204886, 1.505561, -0.006827802, 1, 1, 1, 1, 1,
0.005148781, -2.410211, 3.096843, 1, 1, 1, 1, 1,
0.005811312, -1.662563, 1.637272, 1, 1, 1, 1, 1,
0.008815221, 0.0001690447, 1.34379, 1, 1, 1, 1, 1,
0.009153211, -0.380385, 2.877956, 1, 1, 1, 1, 1,
0.0109745, -1.656339, 2.392672, 1, 1, 1, 1, 1,
0.01198022, 1.184928, 0.8786954, 1, 1, 1, 1, 1,
0.01469645, -0.001441353, 1.38846, 1, 1, 1, 1, 1,
0.01569114, 1.197918, -0.5438747, 1, 1, 1, 1, 1,
0.01815513, 0.1366967, -0.02940967, 1, 1, 1, 1, 1,
0.019355, 1.378166, 0.08512417, 1, 1, 1, 1, 1,
0.02160299, 0.3681843, 1.716427, 0, 0, 1, 1, 1,
0.03014061, -0.3321787, 4.134463, 1, 0, 0, 1, 1,
0.04230205, 1.641803, 0.21199, 1, 0, 0, 1, 1,
0.04397261, -0.09400325, 2.518332, 1, 0, 0, 1, 1,
0.05223627, -0.8825566, 5.381721, 1, 0, 0, 1, 1,
0.0524476, 0.3453488, 0.4606293, 1, 0, 0, 1, 1,
0.05655252, 0.2192803, -1.023073, 0, 0, 0, 1, 1,
0.06116379, 2.420067, 0.4591564, 0, 0, 0, 1, 1,
0.06139851, 0.4655834, 0.6018922, 0, 0, 0, 1, 1,
0.06215679, 0.7534671, -1.744554, 0, 0, 0, 1, 1,
0.07191834, -1.635331, 0.6468334, 0, 0, 0, 1, 1,
0.07363717, 0.2583215, 0.4183406, 0, 0, 0, 1, 1,
0.07800805, -1.668322, 2.003707, 0, 0, 0, 1, 1,
0.07805295, -0.8332356, 1.445829, 1, 1, 1, 1, 1,
0.08600513, -0.55279, 3.721314, 1, 1, 1, 1, 1,
0.08808749, -0.2899148, 1.664751, 1, 1, 1, 1, 1,
0.08935913, 0.4380865, -0.4485269, 1, 1, 1, 1, 1,
0.08958945, -1.882472, 4.313266, 1, 1, 1, 1, 1,
0.09280562, 1.224524, 0.4090232, 1, 1, 1, 1, 1,
0.09688294, 0.2951675, 0.7528336, 1, 1, 1, 1, 1,
0.09704082, -0.2368186, 2.031933, 1, 1, 1, 1, 1,
0.0977957, -1.206329, 3.640217, 1, 1, 1, 1, 1,
0.09934151, 0.2181714, -0.3600183, 1, 1, 1, 1, 1,
0.09948786, 0.8771201, 0.5489481, 1, 1, 1, 1, 1,
0.1001898, 0.6170694, -1.126259, 1, 1, 1, 1, 1,
0.102572, 0.01864301, 1.622213, 1, 1, 1, 1, 1,
0.109337, -1.073335, 2.325936, 1, 1, 1, 1, 1,
0.1140579, -1.07191, 2.253526, 1, 1, 1, 1, 1,
0.1158273, -0.7654423, 2.37574, 0, 0, 1, 1, 1,
0.1166199, 0.5491012, -0.1796171, 1, 0, 0, 1, 1,
0.1204557, -0.6977354, 2.634495, 1, 0, 0, 1, 1,
0.1226062, -1.363099, 1.955422, 1, 0, 0, 1, 1,
0.1242218, -0.5037259, 0.9557996, 1, 0, 0, 1, 1,
0.1254212, -0.4462465, 3.335446, 1, 0, 0, 1, 1,
0.1292235, 0.5493637, -1.715094, 0, 0, 0, 1, 1,
0.1307566, -1.570926, 5.539011, 0, 0, 0, 1, 1,
0.13315, 0.08760869, 2.408446, 0, 0, 0, 1, 1,
0.1354507, 1.839061, -0.3675557, 0, 0, 0, 1, 1,
0.1377371, 1.264436, 0.9764366, 0, 0, 0, 1, 1,
0.1411463, -0.5702622, 2.25739, 0, 0, 0, 1, 1,
0.1445635, 0.2515807, -1.005136, 0, 0, 0, 1, 1,
0.1485016, -0.836147, 3.156008, 1, 1, 1, 1, 1,
0.1485029, -0.9914245, 3.163102, 1, 1, 1, 1, 1,
0.1485665, -1.270159, 2.796308, 1, 1, 1, 1, 1,
0.1507158, -0.536017, 2.402435, 1, 1, 1, 1, 1,
0.1513431, -0.7852697, 2.21923, 1, 1, 1, 1, 1,
0.1529178, 0.4329078, -0.001824245, 1, 1, 1, 1, 1,
0.1543365, 0.5820945, 1.206401, 1, 1, 1, 1, 1,
0.1574149, -0.7549601, 2.782522, 1, 1, 1, 1, 1,
0.1577227, 0.8667801, -1.392123, 1, 1, 1, 1, 1,
0.1616372, -0.8907191, 2.837394, 1, 1, 1, 1, 1,
0.1624677, -0.9732015, 1.896269, 1, 1, 1, 1, 1,
0.1634814, -0.8191816, 2.712128, 1, 1, 1, 1, 1,
0.1661546, 1.780445, -0.3229451, 1, 1, 1, 1, 1,
0.1662797, -0.1037427, 3.058955, 1, 1, 1, 1, 1,
0.1667487, 1.295603, 0.9875157, 1, 1, 1, 1, 1,
0.1771913, -1.573875, 3.733607, 0, 0, 1, 1, 1,
0.1804363, 0.1973704, 0.6545286, 1, 0, 0, 1, 1,
0.1832801, 1.765109, -1.014444, 1, 0, 0, 1, 1,
0.1837667, 0.06647401, 0.6348143, 1, 0, 0, 1, 1,
0.1839927, -0.08722541, 0.5581012, 1, 0, 0, 1, 1,
0.186079, -2.492276, 4.12724, 1, 0, 0, 1, 1,
0.1871849, 1.328947, 0.7638803, 0, 0, 0, 1, 1,
0.1893382, 0.5685447, -0.1229353, 0, 0, 0, 1, 1,
0.1894189, 0.4423903, -1.149688, 0, 0, 0, 1, 1,
0.1914545, -0.7531568, 2.820212, 0, 0, 0, 1, 1,
0.1931748, 0.620218, -0.5395783, 0, 0, 0, 1, 1,
0.1943774, 0.0304757, 1.425146, 0, 0, 0, 1, 1,
0.196785, -0.05389719, 2.918535, 0, 0, 0, 1, 1,
0.1984696, -0.5334539, 3.711868, 1, 1, 1, 1, 1,
0.1993906, 1.213718, -2.578996, 1, 1, 1, 1, 1,
0.1998771, 1.098538, -0.8643326, 1, 1, 1, 1, 1,
0.2004259, -0.07515439, 1.327449, 1, 1, 1, 1, 1,
0.2006958, 2.169118, -1.275216, 1, 1, 1, 1, 1,
0.2013784, 1.198128, 1.864694, 1, 1, 1, 1, 1,
0.2013785, 0.2727502, 0.0008957689, 1, 1, 1, 1, 1,
0.2051004, -1.268063, 4.164582, 1, 1, 1, 1, 1,
0.2079085, 0.1571845, 0.6417353, 1, 1, 1, 1, 1,
0.2100773, -0.9272124, 2.672653, 1, 1, 1, 1, 1,
0.2103544, 0.9654659, 2.416099, 1, 1, 1, 1, 1,
0.2168491, 1.549176, 0.08873477, 1, 1, 1, 1, 1,
0.2181397, 0.5624363, -0.4483922, 1, 1, 1, 1, 1,
0.2183428, 0.101245, 2.836556, 1, 1, 1, 1, 1,
0.2190411, -0.6787625, 3.879765, 1, 1, 1, 1, 1,
0.2201596, 0.7219236, -0.5936819, 0, 0, 1, 1, 1,
0.223829, 1.371279, -1.010874, 1, 0, 0, 1, 1,
0.2261378, 1.405716, -0.02435987, 1, 0, 0, 1, 1,
0.2267869, -0.9944041, 3.733089, 1, 0, 0, 1, 1,
0.234037, -0.03966817, 0.30313, 1, 0, 0, 1, 1,
0.2350014, -1.426967, 4.50104, 1, 0, 0, 1, 1,
0.2411252, 1.112259, 0.5307457, 0, 0, 0, 1, 1,
0.2420074, -0.4613409, 2.946204, 0, 0, 0, 1, 1,
0.2430626, -0.8785828, 2.01128, 0, 0, 0, 1, 1,
0.2437375, -0.08908592, 2.505229, 0, 0, 0, 1, 1,
0.2439845, -1.461807, 4.370785, 0, 0, 0, 1, 1,
0.2556853, -0.08891858, 1.046507, 0, 0, 0, 1, 1,
0.2570177, -0.268943, 1.821159, 0, 0, 0, 1, 1,
0.2598615, -0.07294603, 3.439601, 1, 1, 1, 1, 1,
0.2601477, 0.01655337, 2.282493, 1, 1, 1, 1, 1,
0.261788, -0.2788668, 3.387435, 1, 1, 1, 1, 1,
0.264091, -0.3417641, 2.288889, 1, 1, 1, 1, 1,
0.268152, 0.8942319, -0.2498362, 1, 1, 1, 1, 1,
0.2711914, -0.7117701, 3.755775, 1, 1, 1, 1, 1,
0.2798393, -1.077918, 5.081673, 1, 1, 1, 1, 1,
0.2810504, -2.229771, 1.993365, 1, 1, 1, 1, 1,
0.2812141, 1.430162, -0.06328012, 1, 1, 1, 1, 1,
0.2864827, -0.8509695, 1.108372, 1, 1, 1, 1, 1,
0.2896839, -1.363667, 2.733219, 1, 1, 1, 1, 1,
0.2932037, 0.9778177, 0.9792266, 1, 1, 1, 1, 1,
0.294593, 1.18747, 1.843938, 1, 1, 1, 1, 1,
0.2986535, 0.02550095, 1.52081, 1, 1, 1, 1, 1,
0.3037843, 0.8989404, -1.185284, 1, 1, 1, 1, 1,
0.3045789, -0.5536126, 2.752938, 0, 0, 1, 1, 1,
0.3059288, 0.04528595, 0.1214713, 1, 0, 0, 1, 1,
0.3132896, 1.285732, -1.155918, 1, 0, 0, 1, 1,
0.3175412, 0.9509133, -1.084871, 1, 0, 0, 1, 1,
0.3181025, -0.8162232, 2.234013, 1, 0, 0, 1, 1,
0.3203568, 0.1023066, 1.560417, 1, 0, 0, 1, 1,
0.3269256, 1.309549, -0.9548313, 0, 0, 0, 1, 1,
0.3286271, 1.410179, 0.9239399, 0, 0, 0, 1, 1,
0.3300462, -1.384831, 2.110455, 0, 0, 0, 1, 1,
0.3309009, 1.545848, -1.801344, 0, 0, 0, 1, 1,
0.3334222, 0.7593763, 0.06620068, 0, 0, 0, 1, 1,
0.3406446, -1.382818, 1.970876, 0, 0, 0, 1, 1,
0.3541299, 0.06808039, 2.069339, 0, 0, 0, 1, 1,
0.3570659, 0.01783936, 1.631517, 1, 1, 1, 1, 1,
0.3600256, 1.597124, 1.313354, 1, 1, 1, 1, 1,
0.3612157, 0.9733428, -0.1316803, 1, 1, 1, 1, 1,
0.3704886, -0.4693135, 2.065551, 1, 1, 1, 1, 1,
0.3724275, -0.01901757, 1.324149, 1, 1, 1, 1, 1,
0.373928, -0.06792643, 3.068987, 1, 1, 1, 1, 1,
0.3766851, -0.1091985, 2.559933, 1, 1, 1, 1, 1,
0.3834161, -0.9835946, 2.561268, 1, 1, 1, 1, 1,
0.3855611, -1.329462, 4.029298, 1, 1, 1, 1, 1,
0.3856032, -0.3848152, 1.973644, 1, 1, 1, 1, 1,
0.39422, 0.4229133, -0.3350633, 1, 1, 1, 1, 1,
0.403445, 0.5331457, 0.9631711, 1, 1, 1, 1, 1,
0.4040241, -0.1639119, 1.72245, 1, 1, 1, 1, 1,
0.407221, -0.4542558, 3.197454, 1, 1, 1, 1, 1,
0.4165381, -2.254601, 0.5371007, 1, 1, 1, 1, 1,
0.4236555, -0.6938622, 2.06439, 0, 0, 1, 1, 1,
0.4243421, -1.717588, 1.063989, 1, 0, 0, 1, 1,
0.4291315, -0.2870748, 2.763242, 1, 0, 0, 1, 1,
0.4322728, 0.9638495, 1.257129, 1, 0, 0, 1, 1,
0.4358164, -0.1000383, 0.8320448, 1, 0, 0, 1, 1,
0.4413253, 0.9832399, 0.7045609, 1, 0, 0, 1, 1,
0.4451841, -1.031688, 1.416432, 0, 0, 0, 1, 1,
0.4490452, 0.5767328, 1.064574, 0, 0, 0, 1, 1,
0.452877, -0.009181807, -0.07516199, 0, 0, 0, 1, 1,
0.4569736, -1.381837, 3.728549, 0, 0, 0, 1, 1,
0.4591578, 0.0696663, 0.2778567, 0, 0, 0, 1, 1,
0.4598075, -1.683972, 3.78802, 0, 0, 0, 1, 1,
0.4610053, 0.9797157, 0.5498156, 0, 0, 0, 1, 1,
0.4616392, -0.587152, 2.291967, 1, 1, 1, 1, 1,
0.4625761, 0.9822319, -0.8554539, 1, 1, 1, 1, 1,
0.4661034, 2.627401, -0.5644596, 1, 1, 1, 1, 1,
0.4666348, 0.8651351, 1.907539, 1, 1, 1, 1, 1,
0.4674732, 0.9909435, 0.4530146, 1, 1, 1, 1, 1,
0.4710421, -0.5455118, 1.435428, 1, 1, 1, 1, 1,
0.4713902, 0.7918676, 0.05203937, 1, 1, 1, 1, 1,
0.4743266, -0.2508486, 4.317066, 1, 1, 1, 1, 1,
0.4757302, 0.2560651, -0.02757988, 1, 1, 1, 1, 1,
0.4834119, 0.5567917, 1.233783, 1, 1, 1, 1, 1,
0.4888526, -0.1434799, -0.3841075, 1, 1, 1, 1, 1,
0.498145, -0.5899091, 2.554004, 1, 1, 1, 1, 1,
0.499597, 0.3735898, 1.535753, 1, 1, 1, 1, 1,
0.4996469, -1.102161, 2.926831, 1, 1, 1, 1, 1,
0.5037423, -1.185799, 4.110738, 1, 1, 1, 1, 1,
0.5054259, -0.3546953, 2.456394, 0, 0, 1, 1, 1,
0.5094145, -0.0717487, 2.612796, 1, 0, 0, 1, 1,
0.510195, -0.388649, 3.173978, 1, 0, 0, 1, 1,
0.5137919, 1.80996, 0.08722674, 1, 0, 0, 1, 1,
0.5142238, -0.1458164, 2.017684, 1, 0, 0, 1, 1,
0.5168459, 0.535409, -0.06926839, 1, 0, 0, 1, 1,
0.517405, 1.271598, 0.3649397, 0, 0, 0, 1, 1,
0.5227401, 0.110752, 0.05514205, 0, 0, 0, 1, 1,
0.5236952, 1.075055, 0.6504593, 0, 0, 0, 1, 1,
0.5237697, -1.896395, 2.472176, 0, 0, 0, 1, 1,
0.5308681, -1.733601, 3.350815, 0, 0, 0, 1, 1,
0.5310801, 0.06379622, 2.597018, 0, 0, 0, 1, 1,
0.5414204, 0.04130868, 1.790443, 0, 0, 0, 1, 1,
0.5431831, 0.5934252, -1.028753, 1, 1, 1, 1, 1,
0.5444058, -0.7816951, 2.288127, 1, 1, 1, 1, 1,
0.5449881, -1.430546, 2.49665, 1, 1, 1, 1, 1,
0.5450638, -0.09772778, 1.547128, 1, 1, 1, 1, 1,
0.5451118, 0.7536672, -0.6118298, 1, 1, 1, 1, 1,
0.5469741, 0.2759962, 1.846895, 1, 1, 1, 1, 1,
0.5523466, -1.811248, 3.04469, 1, 1, 1, 1, 1,
0.5563087, -0.1202567, 1.047515, 1, 1, 1, 1, 1,
0.5604928, 1.741565, -1.842729, 1, 1, 1, 1, 1,
0.5615568, -1.050698, 0.9453368, 1, 1, 1, 1, 1,
0.5641795, -1.414234, 3.546593, 1, 1, 1, 1, 1,
0.5677472, 0.06450547, 1.723168, 1, 1, 1, 1, 1,
0.569152, -1.706438, 3.447561, 1, 1, 1, 1, 1,
0.5707709, 0.9113643, 0.5759632, 1, 1, 1, 1, 1,
0.5714208, 0.4648235, 1.24311, 1, 1, 1, 1, 1,
0.5738232, 0.9190693, 0.05626127, 0, 0, 1, 1, 1,
0.5764839, 0.8701088, -0.3259971, 1, 0, 0, 1, 1,
0.5797731, -1.142087, 2.647891, 1, 0, 0, 1, 1,
0.5805121, 0.7579792, 1.919609, 1, 0, 0, 1, 1,
0.5816386, -0.8072532, 3.544623, 1, 0, 0, 1, 1,
0.5822933, 1.809234, -1.677599, 1, 0, 0, 1, 1,
0.5846898, -0.219876, 3.443788, 0, 0, 0, 1, 1,
0.5871966, 0.239624, 1.347958, 0, 0, 0, 1, 1,
0.5903062, -1.732732, 2.951605, 0, 0, 0, 1, 1,
0.5920768, 0.01132864, 1.165657, 0, 0, 0, 1, 1,
0.5928998, -0.9105273, 3.007924, 0, 0, 0, 1, 1,
0.5940101, 1.859223, 0.692462, 0, 0, 0, 1, 1,
0.5945179, -0.319757, 2.038239, 0, 0, 0, 1, 1,
0.6010828, -0.7687792, 4.159206, 1, 1, 1, 1, 1,
0.6024871, 0.9211757, 1.828901, 1, 1, 1, 1, 1,
0.6120182, 1.081869, 0.3241517, 1, 1, 1, 1, 1,
0.6121461, 1.358003, -0.740739, 1, 1, 1, 1, 1,
0.6138107, -0.6573266, 3.425201, 1, 1, 1, 1, 1,
0.6174784, 1.035953, -1.825343, 1, 1, 1, 1, 1,
0.6192434, -0.6623035, 4.317849, 1, 1, 1, 1, 1,
0.6192905, 0.600113, 2.23265, 1, 1, 1, 1, 1,
0.6196994, 0.4155055, 1.258559, 1, 1, 1, 1, 1,
0.6200956, -0.8367671, 1.385502, 1, 1, 1, 1, 1,
0.6334178, -0.6206828, 1.398181, 1, 1, 1, 1, 1,
0.6341296, 0.570783, 2.313467, 1, 1, 1, 1, 1,
0.6372129, -0.5359049, 1.755775, 1, 1, 1, 1, 1,
0.6393345, -0.4337118, 3.050124, 1, 1, 1, 1, 1,
0.6394228, -1.627337, 2.56634, 1, 1, 1, 1, 1,
0.64794, 1.41952, 0.09056813, 0, 0, 1, 1, 1,
0.6489483, 0.6063324, -0.7698104, 1, 0, 0, 1, 1,
0.6510987, 2.030503, 0.2209365, 1, 0, 0, 1, 1,
0.6558192, -0.8147873, 2.801235, 1, 0, 0, 1, 1,
0.6678922, 0.6236953, 0.1537648, 1, 0, 0, 1, 1,
0.6766021, 2.099065, 0.04781318, 1, 0, 0, 1, 1,
0.6795911, -0.6774556, 1.944715, 0, 0, 0, 1, 1,
0.6817529, -0.3175373, 2.360274, 0, 0, 0, 1, 1,
0.68348, -0.2436124, 2.934948, 0, 0, 0, 1, 1,
0.6949401, -0.9886411, 2.155539, 0, 0, 0, 1, 1,
0.6966466, 1.506531, 0.8794702, 0, 0, 0, 1, 1,
0.7035071, 0.8350012, 0.06037189, 0, 0, 0, 1, 1,
0.7038426, -0.3274636, 3.328119, 0, 0, 0, 1, 1,
0.7112603, 0.6393611, 1.842709, 1, 1, 1, 1, 1,
0.7178524, 0.08409656, 0.8736577, 1, 1, 1, 1, 1,
0.719739, -0.0320939, -0.0653732, 1, 1, 1, 1, 1,
0.7267761, 1.555767, -0.005371379, 1, 1, 1, 1, 1,
0.7311184, 1.80227, -0.2134871, 1, 1, 1, 1, 1,
0.7327495, -0.4301727, 4.443079, 1, 1, 1, 1, 1,
0.7345411, -0.05567293, 2.295868, 1, 1, 1, 1, 1,
0.7381891, -0.5677471, 3.323852, 1, 1, 1, 1, 1,
0.7394661, -0.8521899, 2.104055, 1, 1, 1, 1, 1,
0.7483102, -0.5090314, 2.107399, 1, 1, 1, 1, 1,
0.7514871, -1.715773, 3.656901, 1, 1, 1, 1, 1,
0.7521983, -1.984725, 1.859162, 1, 1, 1, 1, 1,
0.7546416, 0.005902691, 2.964624, 1, 1, 1, 1, 1,
0.7586746, 0.7580702, 1.47615, 1, 1, 1, 1, 1,
0.7615841, -0.1402441, 2.300968, 1, 1, 1, 1, 1,
0.768419, -0.4365749, 3.163671, 0, 0, 1, 1, 1,
0.7691319, 0.8504221, 0.4513788, 1, 0, 0, 1, 1,
0.7768359, -0.9894875, 1.292242, 1, 0, 0, 1, 1,
0.7812216, -0.2566411, 2.051913, 1, 0, 0, 1, 1,
0.7824581, -0.2775514, 2.462539, 1, 0, 0, 1, 1,
0.7830256, 0.6137964, 0.2493916, 1, 0, 0, 1, 1,
0.7942407, -0.3999499, 1.992912, 0, 0, 0, 1, 1,
0.7997463, -0.2891877, 2.800067, 0, 0, 0, 1, 1,
0.8002407, 0.4900268, 1.736958, 0, 0, 0, 1, 1,
0.8040404, -0.2300101, 0.8196254, 0, 0, 0, 1, 1,
0.8123763, 1.483699, 1.89017, 0, 0, 0, 1, 1,
0.8143409, -0.4997846, 1.854456, 0, 0, 0, 1, 1,
0.8213213, -1.426385, 2.307869, 0, 0, 0, 1, 1,
0.8269762, -0.5260845, 2.378986, 1, 1, 1, 1, 1,
0.8309737, 1.785143, 1.429194, 1, 1, 1, 1, 1,
0.8318599, -1.559519, 3.204781, 1, 1, 1, 1, 1,
0.8362452, -0.826659, 1.02471, 1, 1, 1, 1, 1,
0.8424837, 0.4329423, -1.625625, 1, 1, 1, 1, 1,
0.846544, -0.3085803, 0.6907279, 1, 1, 1, 1, 1,
0.8492242, 0.5434346, 0.5586445, 1, 1, 1, 1, 1,
0.8494126, 1.795236, 0.4818169, 1, 1, 1, 1, 1,
0.8515212, 1.406381, 0.4506231, 1, 1, 1, 1, 1,
0.8537725, -0.7641967, 2.437856, 1, 1, 1, 1, 1,
0.8556469, 0.2241122, 2.781356, 1, 1, 1, 1, 1,
0.8585782, -0.1020965, 1.247004, 1, 1, 1, 1, 1,
0.8612942, 0.9166592, 1.955361, 1, 1, 1, 1, 1,
0.8634183, -0.7770066, 1.208609, 1, 1, 1, 1, 1,
0.8680413, -0.7624372, 2.848962, 1, 1, 1, 1, 1,
0.8778552, 0.02150218, 2.14407, 0, 0, 1, 1, 1,
0.8818967, 0.8252527, 2.366583, 1, 0, 0, 1, 1,
0.882886, 0.3019589, 1.247242, 1, 0, 0, 1, 1,
0.896185, -0.4462111, 2.995265, 1, 0, 0, 1, 1,
0.9004157, 0.1610346, 1.440401, 1, 0, 0, 1, 1,
0.9035569, -0.1137272, 1.802761, 1, 0, 0, 1, 1,
0.9052005, -0.7079509, 2.310295, 0, 0, 0, 1, 1,
0.9141963, -0.01504467, 0.5608112, 0, 0, 0, 1, 1,
0.9181226, 0.1620559, 0.9030216, 0, 0, 0, 1, 1,
0.9199824, 0.784538, 0.808382, 0, 0, 0, 1, 1,
0.9235869, -0.7593973, 1.486458, 0, 0, 0, 1, 1,
0.9274333, -1.203379, 2.646958, 0, 0, 0, 1, 1,
0.9279261, -0.5333192, 2.611467, 0, 0, 0, 1, 1,
0.9389375, -0.188726, 1.284309, 1, 1, 1, 1, 1,
0.9414605, 1.047855, 0.7008712, 1, 1, 1, 1, 1,
0.9516474, 0.5223404, 1.492468, 1, 1, 1, 1, 1,
0.9575856, 1.77892, 1.584568, 1, 1, 1, 1, 1,
0.9596921, 0.09451707, 0.387107, 1, 1, 1, 1, 1,
0.9624576, -1.020434, 1.85745, 1, 1, 1, 1, 1,
0.9630008, -0.5586922, 3.113616, 1, 1, 1, 1, 1,
0.9631292, -0.7451617, -0.2946028, 1, 1, 1, 1, 1,
0.9642123, -1.935811, 3.483288, 1, 1, 1, 1, 1,
0.9680471, -0.8897865, 0.9037611, 1, 1, 1, 1, 1,
0.9704188, -1.519628, 3.995968, 1, 1, 1, 1, 1,
0.9714018, -1.288754, 1.895776, 1, 1, 1, 1, 1,
0.9770649, -0.1102571, 1.29832, 1, 1, 1, 1, 1,
0.9787145, 1.477125, 0.01849097, 1, 1, 1, 1, 1,
0.9830905, 0.6989925, -0.5780347, 1, 1, 1, 1, 1,
0.9843754, 0.285145, 1.135699, 0, 0, 1, 1, 1,
0.9855155, 0.7417363, 0.03341747, 1, 0, 0, 1, 1,
0.9881331, -0.02294783, 2.359212, 1, 0, 0, 1, 1,
0.9916397, 0.2483791, 0.6339499, 1, 0, 0, 1, 1,
1.001261, 0.7494537, 0.8639394, 1, 0, 0, 1, 1,
1.001359, 0.7801104, 1.227695, 1, 0, 0, 1, 1,
1.001974, 1.33887, 2.723783, 0, 0, 0, 1, 1,
1.010884, 0.5314607, 1.029323, 0, 0, 0, 1, 1,
1.014338, -1.935099, 1.83151, 0, 0, 0, 1, 1,
1.02196, 0.2264151, -0.1234297, 0, 0, 0, 1, 1,
1.023702, -1.119417, 2.529564, 0, 0, 0, 1, 1,
1.025607, -0.1553746, 2.199259, 0, 0, 0, 1, 1,
1.025994, -0.5636276, 2.156914, 0, 0, 0, 1, 1,
1.029826, -1.709585, 2.428846, 1, 1, 1, 1, 1,
1.033715, 0.8476713, 3.398872, 1, 1, 1, 1, 1,
1.033919, 0.03084598, 2.023468, 1, 1, 1, 1, 1,
1.036796, 0.6811884, 0.8806255, 1, 1, 1, 1, 1,
1.03936, -2.116235, 3.917774, 1, 1, 1, 1, 1,
1.042785, -0.3272595, 2.08787, 1, 1, 1, 1, 1,
1.046401, -1.775765, 1.672364, 1, 1, 1, 1, 1,
1.050382, 0.1410281, 2.130281, 1, 1, 1, 1, 1,
1.065695, -0.192324, 0.3794087, 1, 1, 1, 1, 1,
1.066011, 1.016667, 1.347692, 1, 1, 1, 1, 1,
1.069325, -0.2793838, 1.60211, 1, 1, 1, 1, 1,
1.070458, 0.8784934, -0.008673068, 1, 1, 1, 1, 1,
1.079296, -1.278143, 0.5985225, 1, 1, 1, 1, 1,
1.080604, 0.3632774, 0.6090072, 1, 1, 1, 1, 1,
1.081601, -0.1688909, 1.481218, 1, 1, 1, 1, 1,
1.089154, -1.374799, 1.550125, 0, 0, 1, 1, 1,
1.089244, 0.201001, 1.671848, 1, 0, 0, 1, 1,
1.0913, -1.279624, 4.652659, 1, 0, 0, 1, 1,
1.098746, -0.9269071, 1.390214, 1, 0, 0, 1, 1,
1.100914, -0.3614649, 2.162977, 1, 0, 0, 1, 1,
1.104968, -0.02972463, 1.730986, 1, 0, 0, 1, 1,
1.107838, 0.008084857, 2.187387, 0, 0, 0, 1, 1,
1.110631, 0.8449663, 1.455159, 0, 0, 0, 1, 1,
1.117035, 1.594657, -0.870473, 0, 0, 0, 1, 1,
1.121578, 0.2800917, 1.723458, 0, 0, 0, 1, 1,
1.123636, -0.3735972, 1.998024, 0, 0, 0, 1, 1,
1.12632, -0.09860905, 1.724943, 0, 0, 0, 1, 1,
1.134865, -1.116596, 2.411561, 0, 0, 0, 1, 1,
1.165952, 0.4885879, 0.1758084, 1, 1, 1, 1, 1,
1.182105, -0.790631, 3.37361, 1, 1, 1, 1, 1,
1.186075, -1.301197, 2.426828, 1, 1, 1, 1, 1,
1.187846, 1.064405, 2.387521, 1, 1, 1, 1, 1,
1.18962, -0.4148903, 1.577674, 1, 1, 1, 1, 1,
1.189973, -2.35328, 2.943036, 1, 1, 1, 1, 1,
1.197951, 0.05326781, 0.3364698, 1, 1, 1, 1, 1,
1.211211, -1.57005, 2.456696, 1, 1, 1, 1, 1,
1.226577, 0.435692, 1.872644, 1, 1, 1, 1, 1,
1.226872, -1.08138, -0.003718911, 1, 1, 1, 1, 1,
1.227623, 0.3311495, 3.024205, 1, 1, 1, 1, 1,
1.230842, -1.520984, 1.906533, 1, 1, 1, 1, 1,
1.248351, 0.8777433, 1.941571, 1, 1, 1, 1, 1,
1.256461, -0.1960535, 1.919648, 1, 1, 1, 1, 1,
1.262657, -1.574477, 4.430586, 1, 1, 1, 1, 1,
1.282373, 0.1699563, 1.383515, 0, 0, 1, 1, 1,
1.28325, 1.632985, 1.264896, 1, 0, 0, 1, 1,
1.290088, 0.260904, 1.838794, 1, 0, 0, 1, 1,
1.290748, -0.1044905, 2.064417, 1, 0, 0, 1, 1,
1.29386, -0.7215109, 3.504752, 1, 0, 0, 1, 1,
1.297794, -0.01386147, 0.1390121, 1, 0, 0, 1, 1,
1.303795, 0.674427, 0.04254033, 0, 0, 0, 1, 1,
1.306136, 0.1919344, 3.536787, 0, 0, 0, 1, 1,
1.309497, 0.07078462, 0.778937, 0, 0, 0, 1, 1,
1.3145, -1.492694, 0.9886977, 0, 0, 0, 1, 1,
1.320463, 0.1557547, -0.1754782, 0, 0, 0, 1, 1,
1.321303, 0.6209542, 2.30408, 0, 0, 0, 1, 1,
1.324717, -0.4603438, 1.270813, 0, 0, 0, 1, 1,
1.331778, -0.548213, 2.503703, 1, 1, 1, 1, 1,
1.36089, 0.6408856, 0.3457957, 1, 1, 1, 1, 1,
1.361676, -1.734836, 3.969433, 1, 1, 1, 1, 1,
1.369356, 0.1144623, 3.340341, 1, 1, 1, 1, 1,
1.373467, -0.246153, 2.600111, 1, 1, 1, 1, 1,
1.384266, -0.03844691, 2.618708, 1, 1, 1, 1, 1,
1.386964, 0.002288475, 2.604468, 1, 1, 1, 1, 1,
1.387322, 0.3141875, 0.5688863, 1, 1, 1, 1, 1,
1.389813, -0.4405171, 2.382933, 1, 1, 1, 1, 1,
1.391183, 0.3408115, 2.183167, 1, 1, 1, 1, 1,
1.39186, 0.9656884, 2.662025, 1, 1, 1, 1, 1,
1.399165, 0.3492232, 2.840186, 1, 1, 1, 1, 1,
1.403791, 0.8506374, 1.970821, 1, 1, 1, 1, 1,
1.405323, -0.1329487, 0.4094721, 1, 1, 1, 1, 1,
1.405929, 2.236574, -0.6152551, 1, 1, 1, 1, 1,
1.416614, -1.513814, 2.017324, 0, 0, 1, 1, 1,
1.426943, 0.3536409, 3.050516, 1, 0, 0, 1, 1,
1.428583, -0.9829735, 0.468295, 1, 0, 0, 1, 1,
1.429925, -0.321591, 1.911538, 1, 0, 0, 1, 1,
1.431585, -0.6053737, 2.24923, 1, 0, 0, 1, 1,
1.433173, -0.4492721, 2.332088, 1, 0, 0, 1, 1,
1.435852, 0.03566734, 2.665614, 0, 0, 0, 1, 1,
1.440664, 0.3365225, 1.210577, 0, 0, 0, 1, 1,
1.449673, 0.8999647, 1.99216, 0, 0, 0, 1, 1,
1.45034, -0.3241485, 1.610164, 0, 0, 0, 1, 1,
1.450948, 0.4824825, -1.097894, 0, 0, 0, 1, 1,
1.455452, 0.3041797, 1.738233, 0, 0, 0, 1, 1,
1.461285, 0.6634141, 1.710452, 0, 0, 0, 1, 1,
1.471524, 1.300857, 1.813614, 1, 1, 1, 1, 1,
1.478927, 0.9139342, 2.407282, 1, 1, 1, 1, 1,
1.482566, -1.233436, 1.931526, 1, 1, 1, 1, 1,
1.490471, 0.824881, 2.003311, 1, 1, 1, 1, 1,
1.497324, -2.558532, 3.935773, 1, 1, 1, 1, 1,
1.499653, 1.842473, 0.8607667, 1, 1, 1, 1, 1,
1.511101, 0.1106557, 1.579509, 1, 1, 1, 1, 1,
1.511118, 1.412795, 1.918665, 1, 1, 1, 1, 1,
1.513851, 0.1027778, -0.6706346, 1, 1, 1, 1, 1,
1.516682, -1.366932, 2.207207, 1, 1, 1, 1, 1,
1.531497, 0.3408212, -0.1317031, 1, 1, 1, 1, 1,
1.536034, 0.01513689, 0.1424923, 1, 1, 1, 1, 1,
1.561517, 0.9539607, 2.300517, 1, 1, 1, 1, 1,
1.566948, 0.811538, 1.545964, 1, 1, 1, 1, 1,
1.576744, -0.5553383, 2.681571, 1, 1, 1, 1, 1,
1.591406, -0.1532957, 2.607561, 0, 0, 1, 1, 1,
1.59295, -0.06501272, 2.846221, 1, 0, 0, 1, 1,
1.610128, -0.1406612, 0.606038, 1, 0, 0, 1, 1,
1.657039, 0.8494225, 2.711804, 1, 0, 0, 1, 1,
1.657468, 0.4658206, -0.3162489, 1, 0, 0, 1, 1,
1.670956, 1.232064, 1.631889, 1, 0, 0, 1, 1,
1.685107, 0.3543978, 0.06231586, 0, 0, 0, 1, 1,
1.692055, 2.62853, 1.338303, 0, 0, 0, 1, 1,
1.694217, 0.7533496, 0.99643, 0, 0, 0, 1, 1,
1.725105, -0.2697019, 1.354822, 0, 0, 0, 1, 1,
1.738247, 1.144182, 1.775932, 0, 0, 0, 1, 1,
1.749163, 0.2303601, 1.036983, 0, 0, 0, 1, 1,
1.756639, 1.37522, 1.839675, 0, 0, 0, 1, 1,
1.760051, -0.7947907, 2.659067, 1, 1, 1, 1, 1,
1.770128, -0.5727708, 1.394643, 1, 1, 1, 1, 1,
1.789856, -0.6032144, 0.9125869, 1, 1, 1, 1, 1,
1.795549, 0.5642422, 2.106536, 1, 1, 1, 1, 1,
1.79879, 0.6722496, 0.5950142, 1, 1, 1, 1, 1,
1.810161, 1.294139, 2.848943, 1, 1, 1, 1, 1,
1.816687, 0.1255031, 3.821349, 1, 1, 1, 1, 1,
1.837273, -1.016, -0.1331927, 1, 1, 1, 1, 1,
1.846041, -0.65751, 0.0008764114, 1, 1, 1, 1, 1,
1.846647, -0.7896817, 2.340798, 1, 1, 1, 1, 1,
1.867201, -0.1534578, 0.6739154, 1, 1, 1, 1, 1,
1.882337, -0.6850485, 2.356367, 1, 1, 1, 1, 1,
1.886434, -1.061862, 3.034445, 1, 1, 1, 1, 1,
1.975025, 2.076214, -0.6288723, 1, 1, 1, 1, 1,
2.017939, 0.5730938, 1.251904, 1, 1, 1, 1, 1,
2.027122, 0.5113558, -0.6636232, 0, 0, 1, 1, 1,
2.048635, 0.2477669, 1.697349, 1, 0, 0, 1, 1,
2.049431, -0.5857646, 1.939293, 1, 0, 0, 1, 1,
2.050947, 1.10424, 0.2363634, 1, 0, 0, 1, 1,
2.081139, -0.7288114, 0.7945111, 1, 0, 0, 1, 1,
2.127331, -0.2678605, 0.4955526, 1, 0, 0, 1, 1,
2.166664, -0.01751724, 1.067087, 0, 0, 0, 1, 1,
2.177653, 1.645421, 0.9537443, 0, 0, 0, 1, 1,
2.20275, -0.365333, 1.940552, 0, 0, 0, 1, 1,
2.228502, -0.06583189, 2.041919, 0, 0, 0, 1, 1,
2.274845, 0.2014255, 1.898602, 0, 0, 0, 1, 1,
2.287484, 0.5146101, -0.4924839, 0, 0, 0, 1, 1,
2.303356, -0.1648391, -0.04041297, 0, 0, 0, 1, 1,
2.352682, -0.3784774, 3.802994, 1, 1, 1, 1, 1,
2.40665, -0.7912784, 1.183304, 1, 1, 1, 1, 1,
2.40986, 0.8262769, 1.740575, 1, 1, 1, 1, 1,
2.469808, 0.5538071, 0.2655838, 1, 1, 1, 1, 1,
3.072028, -0.2962433, 0.1686867, 1, 1, 1, 1, 1,
3.227561, 0.7335981, 1.600382, 1, 1, 1, 1, 1,
3.912841, 0.3428285, 1.018483, 1, 1, 1, 1, 1
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
var radius = 9.498075;
var distance = 33.36158;
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
mvMatrix.translate( -0.1518965, -0.1248611, -0.3484876 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.36158);
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
