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
-2.903618, 0.2657979, 0.572457, 1, 0, 0, 1,
-2.833548, -0.9325317, -1.191332, 1, 0.007843138, 0, 1,
-2.801545, 0.3710603, -0.601142, 1, 0.01176471, 0, 1,
-2.722864, -1.711821, -2.169075, 1, 0.01960784, 0, 1,
-2.692972, -1.075576, -2.161598, 1, 0.02352941, 0, 1,
-2.680678, 1.377998, -1.105257, 1, 0.03137255, 0, 1,
-2.669035, 0.3908294, -1.133221, 1, 0.03529412, 0, 1,
-2.652003, -0.5616276, -2.082585, 1, 0.04313726, 0, 1,
-2.640856, -2.073574, -2.834551, 1, 0.04705882, 0, 1,
-2.601941, 0.1280104, -2.34885, 1, 0.05490196, 0, 1,
-2.492342, 0.2182808, -3.991602, 1, 0.05882353, 0, 1,
-2.486909, -1.114371, -2.016826, 1, 0.06666667, 0, 1,
-2.46513, -0.3492394, -2.559024, 1, 0.07058824, 0, 1,
-2.416927, 1.133978, -2.030803, 1, 0.07843138, 0, 1,
-2.395272, -0.1699718, -2.754742, 1, 0.08235294, 0, 1,
-2.323233, 1.571542, -2.726957, 1, 0.09019608, 0, 1,
-2.235863, 0.2488433, -1.175001, 1, 0.09411765, 0, 1,
-2.22841, -0.9513969, -0.121117, 1, 0.1019608, 0, 1,
-2.217407, -0.863758, -1.843881, 1, 0.1098039, 0, 1,
-2.216918, 0.4264419, -0.8291478, 1, 0.1137255, 0, 1,
-2.19308, -1.673607, -3.731026, 1, 0.1215686, 0, 1,
-2.187393, 0.1128454, -1.339104, 1, 0.1254902, 0, 1,
-2.169795, -0.5194668, -1.451279, 1, 0.1333333, 0, 1,
-2.167347, -2.020024, -2.648787, 1, 0.1372549, 0, 1,
-2.139969, 0.8256661, -2.680728, 1, 0.145098, 0, 1,
-2.133843, -0.5256757, -0.9222344, 1, 0.1490196, 0, 1,
-2.124733, -0.6630193, -1.803578, 1, 0.1568628, 0, 1,
-2.079079, -0.4238971, -1.49857, 1, 0.1607843, 0, 1,
-2.068833, 0.7532442, -3.484148, 1, 0.1686275, 0, 1,
-2.058793, 1.126147, -3.070622, 1, 0.172549, 0, 1,
-2.00871, -0.9897944, -1.154263, 1, 0.1803922, 0, 1,
-1.996525, 0.3556963, -3.278174, 1, 0.1843137, 0, 1,
-1.936685, 2.433964, -0.1527181, 1, 0.1921569, 0, 1,
-1.934206, 1.194333, -0.3520802, 1, 0.1960784, 0, 1,
-1.926959, -0.4572612, -1.04405, 1, 0.2039216, 0, 1,
-1.91724, -1.757015, -1.722042, 1, 0.2117647, 0, 1,
-1.91047, -0.3643619, -0.4119142, 1, 0.2156863, 0, 1,
-1.88061, -0.1622525, -2.079465, 1, 0.2235294, 0, 1,
-1.858706, 0.180303, -2.210251, 1, 0.227451, 0, 1,
-1.853647, 1.148576, -1.165917, 1, 0.2352941, 0, 1,
-1.849968, -0.8265238, -2.604056, 1, 0.2392157, 0, 1,
-1.849103, 0.1255269, -2.727017, 1, 0.2470588, 0, 1,
-1.832919, -0.4214338, -2.428329, 1, 0.2509804, 0, 1,
-1.825897, 0.527221, -1.84349, 1, 0.2588235, 0, 1,
-1.821325, 1.421742, -2.393959, 1, 0.2627451, 0, 1,
-1.800842, -0.4561829, -1.212796, 1, 0.2705882, 0, 1,
-1.790316, -0.7103797, -2.59722, 1, 0.2745098, 0, 1,
-1.78961, -1.287127, -1.503983, 1, 0.282353, 0, 1,
-1.789127, 0.0211353, -1.491549, 1, 0.2862745, 0, 1,
-1.776565, -1.247407, -1.759291, 1, 0.2941177, 0, 1,
-1.768558, 1.575204, -0.1963647, 1, 0.3019608, 0, 1,
-1.75881, -0.6592375, -3.331814, 1, 0.3058824, 0, 1,
-1.756123, -0.05184086, -5.113878, 1, 0.3137255, 0, 1,
-1.747254, -1.26519, -1.487731, 1, 0.3176471, 0, 1,
-1.728957, -0.08131368, -1.487726, 1, 0.3254902, 0, 1,
-1.711744, 1.812083, -0.4933995, 1, 0.3294118, 0, 1,
-1.695677, 0.3861044, -0.8244305, 1, 0.3372549, 0, 1,
-1.690582, -1.369722, -3.90747, 1, 0.3411765, 0, 1,
-1.689121, -0.8044335, -2.491471, 1, 0.3490196, 0, 1,
-1.641104, -0.5712992, -0.8204783, 1, 0.3529412, 0, 1,
-1.640146, -0.9546359, -1.152033, 1, 0.3607843, 0, 1,
-1.635247, 0.2868156, -2.22718, 1, 0.3647059, 0, 1,
-1.615596, -1.786989, -3.910847, 1, 0.372549, 0, 1,
-1.60436, -2.079618, -3.538892, 1, 0.3764706, 0, 1,
-1.597513, 0.5676752, -3.561524, 1, 0.3843137, 0, 1,
-1.58954, -0.3325145, -2.294632, 1, 0.3882353, 0, 1,
-1.589409, -1.548406, -3.331856, 1, 0.3960784, 0, 1,
-1.56792, -0.1371129, -1.343737, 1, 0.4039216, 0, 1,
-1.55167, -2.635638, -2.271353, 1, 0.4078431, 0, 1,
-1.542088, 0.3530361, -1.249786, 1, 0.4156863, 0, 1,
-1.526767, -0.461083, -1.201814, 1, 0.4196078, 0, 1,
-1.523724, -1.401732, -4.115303, 1, 0.427451, 0, 1,
-1.521253, -0.486569, -0.6516126, 1, 0.4313726, 0, 1,
-1.517843, -0.5176078, -2.195663, 1, 0.4392157, 0, 1,
-1.50218, 0.1952434, -0.9623294, 1, 0.4431373, 0, 1,
-1.49935, -0.4517562, -2.28312, 1, 0.4509804, 0, 1,
-1.479054, -0.3076056, -0.03478907, 1, 0.454902, 0, 1,
-1.478266, 1.314805, 1.119523, 1, 0.4627451, 0, 1,
-1.472087, -0.9363, -1.464277, 1, 0.4666667, 0, 1,
-1.469089, -0.2284149, -0.9499181, 1, 0.4745098, 0, 1,
-1.468819, 0.451728, -2.447781, 1, 0.4784314, 0, 1,
-1.454866, 1.343012, -1.315675, 1, 0.4862745, 0, 1,
-1.452007, -1.494179, -2.634899, 1, 0.4901961, 0, 1,
-1.448312, -1.438439, -1.586532, 1, 0.4980392, 0, 1,
-1.435389, -0.4995943, -1.055255, 1, 0.5058824, 0, 1,
-1.43303, 1.662565, -0.7374338, 1, 0.509804, 0, 1,
-1.43131, 0.09005502, -1.959116, 1, 0.5176471, 0, 1,
-1.426565, -0.4441196, -2.331965, 1, 0.5215687, 0, 1,
-1.424967, 1.640121, -1.318134, 1, 0.5294118, 0, 1,
-1.42451, 0.2559781, -0.771391, 1, 0.5333334, 0, 1,
-1.421104, 0.01256557, 1.007752, 1, 0.5411765, 0, 1,
-1.415205, 1.362565, -2.323438, 1, 0.5450981, 0, 1,
-1.412226, -0.9537007, -3.696943, 1, 0.5529412, 0, 1,
-1.405032, -0.9000409, -4.016095, 1, 0.5568628, 0, 1,
-1.395971, -1.393912, -0.8623737, 1, 0.5647059, 0, 1,
-1.369264, 0.9092523, -2.005039, 1, 0.5686275, 0, 1,
-1.357969, 0.5417695, -1.620592, 1, 0.5764706, 0, 1,
-1.352615, 0.4114346, -0.815541, 1, 0.5803922, 0, 1,
-1.352315, -0.9430331, -1.528271, 1, 0.5882353, 0, 1,
-1.350058, -0.1324547, -2.941364, 1, 0.5921569, 0, 1,
-1.346484, -0.08917276, -1.342849, 1, 0.6, 0, 1,
-1.341611, 0.4582905, -2.686027, 1, 0.6078432, 0, 1,
-1.332577, 0.6709707, -1.487696, 1, 0.6117647, 0, 1,
-1.331934, -1.052701, -3.712846, 1, 0.6196079, 0, 1,
-1.326372, 1.368713, -0.4187683, 1, 0.6235294, 0, 1,
-1.325259, -0.6007118, -1.843993, 1, 0.6313726, 0, 1,
-1.321629, 0.2750718, -1.677833, 1, 0.6352941, 0, 1,
-1.317979, -0.5053977, -1.781708, 1, 0.6431373, 0, 1,
-1.313684, -0.3621477, -2.104374, 1, 0.6470588, 0, 1,
-1.300722, -2.122768, -3.607458, 1, 0.654902, 0, 1,
-1.291829, -0.5893633, -1.707894, 1, 0.6588235, 0, 1,
-1.291552, -0.5848776, -1.742064, 1, 0.6666667, 0, 1,
-1.288286, 0.4310416, -0.9507258, 1, 0.6705883, 0, 1,
-1.286926, 0.8024173, -0.6813629, 1, 0.6784314, 0, 1,
-1.28203, 0.3501925, 0.3422529, 1, 0.682353, 0, 1,
-1.271704, 0.05461635, 0.07301425, 1, 0.6901961, 0, 1,
-1.27085, 0.2001712, -1.454133, 1, 0.6941177, 0, 1,
-1.26417, 1.013942, -1.221823, 1, 0.7019608, 0, 1,
-1.263412, 0.8131039, 0.952229, 1, 0.7098039, 0, 1,
-1.251151, 0.5580641, -1.047087, 1, 0.7137255, 0, 1,
-1.245843, 1.474616, -0.719267, 1, 0.7215686, 0, 1,
-1.244086, -1.841795, -1.058339, 1, 0.7254902, 0, 1,
-1.242843, -0.3561216, -3.353603, 1, 0.7333333, 0, 1,
-1.241483, -1.577553, -2.146601, 1, 0.7372549, 0, 1,
-1.234687, 1.764697, -1.044925, 1, 0.7450981, 0, 1,
-1.234129, 0.23809, -0.3485968, 1, 0.7490196, 0, 1,
-1.22495, 0.979791, -1.562801, 1, 0.7568628, 0, 1,
-1.211951, 0.4092451, -2.199237, 1, 0.7607843, 0, 1,
-1.210434, 1.184953, -0.51851, 1, 0.7686275, 0, 1,
-1.207291, -0.8726632, -0.2531206, 1, 0.772549, 0, 1,
-1.185687, -0.1772513, -2.320855, 1, 0.7803922, 0, 1,
-1.165192, 0.4042396, -0.4792387, 1, 0.7843137, 0, 1,
-1.163571, 2.091524, -0.5881436, 1, 0.7921569, 0, 1,
-1.160372, 1.288746, -0.2069772, 1, 0.7960784, 0, 1,
-1.156681, -1.766858, -5.058224, 1, 0.8039216, 0, 1,
-1.15254, -0.1682002, 0.3615051, 1, 0.8117647, 0, 1,
-1.134764, 0.7477885, -0.841171, 1, 0.8156863, 0, 1,
-1.122295, 1.007704, 0.02918725, 1, 0.8235294, 0, 1,
-1.121396, -1.482842, -1.267237, 1, 0.827451, 0, 1,
-1.120085, -1.740631, -5.100954, 1, 0.8352941, 0, 1,
-1.119932, 2.488739, 0.07216156, 1, 0.8392157, 0, 1,
-1.119246, -0.08900901, -2.053367, 1, 0.8470588, 0, 1,
-1.118761, 0.151206, -2.367929, 1, 0.8509804, 0, 1,
-1.102206, -0.878239, -2.600684, 1, 0.8588235, 0, 1,
-1.100644, -1.223949, -2.10846, 1, 0.8627451, 0, 1,
-1.098013, -1.189727, -2.503633, 1, 0.8705882, 0, 1,
-1.096317, 0.9786875, -1.091958, 1, 0.8745098, 0, 1,
-1.093375, 0.04288965, -2.60881, 1, 0.8823529, 0, 1,
-1.092107, -0.01922848, -1.837178, 1, 0.8862745, 0, 1,
-1.091738, 0.2445776, -3.079068, 1, 0.8941177, 0, 1,
-1.090907, -0.7660522, -3.18161, 1, 0.8980392, 0, 1,
-1.087784, 0.4550371, 0.3721319, 1, 0.9058824, 0, 1,
-1.084935, 0.8000907, -2.697144, 1, 0.9137255, 0, 1,
-1.084173, 0.4170202, 0.01219582, 1, 0.9176471, 0, 1,
-1.081494, -0.3331719, -1.759946, 1, 0.9254902, 0, 1,
-1.077501, -0.02352303, -2.672617, 1, 0.9294118, 0, 1,
-1.073956, -1.992978, -2.421898, 1, 0.9372549, 0, 1,
-1.072137, -0.1491624, -2.377346, 1, 0.9411765, 0, 1,
-1.066262, -0.6562583, -0.161641, 1, 0.9490196, 0, 1,
-1.065027, -0.3069645, -1.168095, 1, 0.9529412, 0, 1,
-1.060176, -1.31548, -2.053579, 1, 0.9607843, 0, 1,
-1.059797, 0.1329703, -2.016493, 1, 0.9647059, 0, 1,
-1.056796, 0.4917328, -1.479459, 1, 0.972549, 0, 1,
-1.052791, 0.3125597, -0.3784814, 1, 0.9764706, 0, 1,
-1.052778, -0.2707458, -2.006245, 1, 0.9843137, 0, 1,
-1.052451, -0.2145794, -2.47264, 1, 0.9882353, 0, 1,
-1.052142, -2.025587, -3.406978, 1, 0.9960784, 0, 1,
-1.049658, -0.2064221, -1.827152, 0.9960784, 1, 0, 1,
-1.034211, 0.05814803, -1.830371, 0.9921569, 1, 0, 1,
-1.027409, 1.135918, -1.220602, 0.9843137, 1, 0, 1,
-1.027243, -0.7934905, -4.456445, 0.9803922, 1, 0, 1,
-1.02397, -0.1534033, -1.206554, 0.972549, 1, 0, 1,
-1.02256, -0.04241252, -0.7128904, 0.9686275, 1, 0, 1,
-1.015587, 0.8658707, -2.286441, 0.9607843, 1, 0, 1,
-1.010195, -0.2494265, -4.322386, 0.9568627, 1, 0, 1,
-1.000742, -0.7176684, -2.307244, 0.9490196, 1, 0, 1,
-0.9974099, -0.07095736, -2.390929, 0.945098, 1, 0, 1,
-0.9870465, -2.026718, -0.4724173, 0.9372549, 1, 0, 1,
-0.9807031, 2.510381, -2.892988, 0.9333333, 1, 0, 1,
-0.9806132, 1.630115, -0.03795166, 0.9254902, 1, 0, 1,
-0.9769382, -1.892172, -2.161977, 0.9215686, 1, 0, 1,
-0.9727108, 0.7728219, -3.218812, 0.9137255, 1, 0, 1,
-0.9574752, 0.1965688, -0.2077217, 0.9098039, 1, 0, 1,
-0.945716, -0.485699, -1.071621, 0.9019608, 1, 0, 1,
-0.9449773, -0.6285987, -2.191772, 0.8941177, 1, 0, 1,
-0.9379351, 1.237939, 0.5980083, 0.8901961, 1, 0, 1,
-0.9347406, 2.314916, -0.9627268, 0.8823529, 1, 0, 1,
-0.933099, 0.4644716, -1.637443, 0.8784314, 1, 0, 1,
-0.9246362, -0.5986347, -1.86317, 0.8705882, 1, 0, 1,
-0.9241978, -0.3014366, -1.701254, 0.8666667, 1, 0, 1,
-0.9205223, 1.104847, -0.2079748, 0.8588235, 1, 0, 1,
-0.9198245, -2.336454, -3.423991, 0.854902, 1, 0, 1,
-0.9117889, -0.4226624, -1.116165, 0.8470588, 1, 0, 1,
-0.901026, 0.6400003, -0.5026354, 0.8431373, 1, 0, 1,
-0.8977949, 1.212075, -0.3496965, 0.8352941, 1, 0, 1,
-0.8944251, 1.150062, -2.285815, 0.8313726, 1, 0, 1,
-0.8907212, -1.49408, -2.067076, 0.8235294, 1, 0, 1,
-0.890236, 0.5159175, -2.145419, 0.8196079, 1, 0, 1,
-0.8895134, -0.02144287, -1.605879, 0.8117647, 1, 0, 1,
-0.8879145, 0.5339245, -0.4044222, 0.8078431, 1, 0, 1,
-0.8827512, -0.6090718, -3.339818, 0.8, 1, 0, 1,
-0.8826885, -0.9766946, -2.566208, 0.7921569, 1, 0, 1,
-0.8818104, 0.3931401, -0.07647809, 0.7882353, 1, 0, 1,
-0.873882, -0.9688575, -3.802041, 0.7803922, 1, 0, 1,
-0.8694685, -0.5035116, -1.356406, 0.7764706, 1, 0, 1,
-0.8674353, -0.4930856, -1.987187, 0.7686275, 1, 0, 1,
-0.8658007, 1.765202, 0.8031172, 0.7647059, 1, 0, 1,
-0.8634943, -0.2915868, -1.777281, 0.7568628, 1, 0, 1,
-0.8595964, 0.5680919, 0.03527612, 0.7529412, 1, 0, 1,
-0.8594087, 1.330513, -0.7564815, 0.7450981, 1, 0, 1,
-0.8551456, 1.30663, 0.05945015, 0.7411765, 1, 0, 1,
-0.8462795, 0.4240091, 0.4206081, 0.7333333, 1, 0, 1,
-0.8412454, 0.6744832, -1.113986, 0.7294118, 1, 0, 1,
-0.8362919, 0.8619633, 0.5352304, 0.7215686, 1, 0, 1,
-0.8352689, -1.077274, -2.44315, 0.7176471, 1, 0, 1,
-0.8279497, 0.9217595, -1.270433, 0.7098039, 1, 0, 1,
-0.8268459, 1.184002, -0.7330629, 0.7058824, 1, 0, 1,
-0.8213247, 0.8219961, -1.101445, 0.6980392, 1, 0, 1,
-0.8134751, 0.7848324, -0.6623058, 0.6901961, 1, 0, 1,
-0.8131564, -1.005882, -0.9229611, 0.6862745, 1, 0, 1,
-0.8029287, 0.2482563, -1.131497, 0.6784314, 1, 0, 1,
-0.7935563, 0.8959785, -0.8234636, 0.6745098, 1, 0, 1,
-0.790356, -0.7583899, -1.497606, 0.6666667, 1, 0, 1,
-0.7896253, -1.433375, -1.85399, 0.6627451, 1, 0, 1,
-0.7866006, 1.820554, -0.478195, 0.654902, 1, 0, 1,
-0.7858239, -0.1725759, -1.488488, 0.6509804, 1, 0, 1,
-0.7803602, 1.268736, -1.631136, 0.6431373, 1, 0, 1,
-0.7787017, -0.449662, -0.1628607, 0.6392157, 1, 0, 1,
-0.7718099, 0.6143336, 0.4778911, 0.6313726, 1, 0, 1,
-0.7657228, 0.2250993, -2.029557, 0.627451, 1, 0, 1,
-0.7630199, 0.3658477, -0.6968621, 0.6196079, 1, 0, 1,
-0.7625799, 3.1238, -0.7564653, 0.6156863, 1, 0, 1,
-0.7581775, 1.221247, 0.05428554, 0.6078432, 1, 0, 1,
-0.7501814, -0.5031554, -2.865924, 0.6039216, 1, 0, 1,
-0.7501037, 0.3743002, -0.2222834, 0.5960785, 1, 0, 1,
-0.7448738, -0.5091845, -3.108721, 0.5882353, 1, 0, 1,
-0.7447716, -0.04654311, -0.8141772, 0.5843138, 1, 0, 1,
-0.7437063, 0.5644644, 0.5627712, 0.5764706, 1, 0, 1,
-0.7436475, 0.2251256, -1.266882, 0.572549, 1, 0, 1,
-0.7420455, -0.1212413, -2.63212, 0.5647059, 1, 0, 1,
-0.7397831, -1.176158, -1.694738, 0.5607843, 1, 0, 1,
-0.7331682, -0.3213966, -2.832388, 0.5529412, 1, 0, 1,
-0.7309154, -0.810976, -0.2159032, 0.5490196, 1, 0, 1,
-0.7298741, 0.8937833, -0.762711, 0.5411765, 1, 0, 1,
-0.723561, -0.5848961, -0.6637209, 0.5372549, 1, 0, 1,
-0.7226079, 1.120125, -1.762631, 0.5294118, 1, 0, 1,
-0.719554, 0.06947482, -0.1913306, 0.5254902, 1, 0, 1,
-0.7172816, -0.8356061, -0.8315364, 0.5176471, 1, 0, 1,
-0.7144139, -1.170824, -1.169717, 0.5137255, 1, 0, 1,
-0.7108653, 0.2551041, -1.379611, 0.5058824, 1, 0, 1,
-0.7090185, 0.4478597, -0.849233, 0.5019608, 1, 0, 1,
-0.7082901, -0.6787925, -0.8567924, 0.4941176, 1, 0, 1,
-0.7016504, -0.4146521, -1.746706, 0.4862745, 1, 0, 1,
-0.6959313, 0.911916, 0.04690881, 0.4823529, 1, 0, 1,
-0.6908281, 1.222001, -0.1164561, 0.4745098, 1, 0, 1,
-0.6848484, -0.4407348, -4.147843, 0.4705882, 1, 0, 1,
-0.6784205, -0.1924572, -1.676153, 0.4627451, 1, 0, 1,
-0.6745567, -1.272619, -4.487952, 0.4588235, 1, 0, 1,
-0.6682246, 1.434336, -0.6017818, 0.4509804, 1, 0, 1,
-0.6648577, 0.5736772, -1.122796, 0.4470588, 1, 0, 1,
-0.6646369, -0.401983, -1.792618, 0.4392157, 1, 0, 1,
-0.6576922, -1.136823, -3.441161, 0.4352941, 1, 0, 1,
-0.6555513, -0.8482387, -2.130677, 0.427451, 1, 0, 1,
-0.6533635, -0.9575387, -3.750422, 0.4235294, 1, 0, 1,
-0.6486935, -0.3160022, -2.609503, 0.4156863, 1, 0, 1,
-0.6466132, -1.39816, -2.49282, 0.4117647, 1, 0, 1,
-0.6410944, 0.2018955, -0.3057236, 0.4039216, 1, 0, 1,
-0.6409116, -0.4171853, -2.512683, 0.3960784, 1, 0, 1,
-0.6382462, -0.9834546, -4.528359, 0.3921569, 1, 0, 1,
-0.6355862, -0.5444216, -3.871556, 0.3843137, 1, 0, 1,
-0.6352137, 0.6713332, -0.1294879, 0.3803922, 1, 0, 1,
-0.6267349, -1.215198, -1.308774, 0.372549, 1, 0, 1,
-0.6220884, 0.0009018509, -3.432217, 0.3686275, 1, 0, 1,
-0.6185593, 0.6441926, -1.144907, 0.3607843, 1, 0, 1,
-0.6163253, -1.919719, -1.7882, 0.3568628, 1, 0, 1,
-0.6113601, -0.5791857, -3.727542, 0.3490196, 1, 0, 1,
-0.6106106, -2.157878, -2.891643, 0.345098, 1, 0, 1,
-0.6055902, -1.64474, -3.36759, 0.3372549, 1, 0, 1,
-0.6055156, 1.042355, 1.456144, 0.3333333, 1, 0, 1,
-0.6016738, -1.356897, -2.51284, 0.3254902, 1, 0, 1,
-0.6010122, 0.4129668, -0.03059753, 0.3215686, 1, 0, 1,
-0.5961867, -1.344232, -1.791028, 0.3137255, 1, 0, 1,
-0.5877387, -1.632506, -2.629133, 0.3098039, 1, 0, 1,
-0.5840355, -0.8577498, -2.39188, 0.3019608, 1, 0, 1,
-0.5823113, 0.3649959, -0.4952875, 0.2941177, 1, 0, 1,
-0.573965, 0.659761, -1.979878, 0.2901961, 1, 0, 1,
-0.5713068, -0.5049028, -1.436201, 0.282353, 1, 0, 1,
-0.5707207, 0.06831911, -1.513795, 0.2784314, 1, 0, 1,
-0.5685368, -1.132913, -1.958002, 0.2705882, 1, 0, 1,
-0.5629522, -0.2623969, -2.522458, 0.2666667, 1, 0, 1,
-0.5599692, -0.4113917, -1.373273, 0.2588235, 1, 0, 1,
-0.5569709, 0.4858229, -1.790158, 0.254902, 1, 0, 1,
-0.5561729, -1.608149, -2.776465, 0.2470588, 1, 0, 1,
-0.5519955, -0.1634644, -0.36015, 0.2431373, 1, 0, 1,
-0.5446873, 0.638801, 0.2384391, 0.2352941, 1, 0, 1,
-0.5440149, -0.9172656, -3.57664, 0.2313726, 1, 0, 1,
-0.542363, 0.5464911, -0.1852306, 0.2235294, 1, 0, 1,
-0.5335276, 0.7217382, 0.7065676, 0.2196078, 1, 0, 1,
-0.5312528, 1.382981, 0.08222557, 0.2117647, 1, 0, 1,
-0.5275736, -0.305735, -2.80344, 0.2078431, 1, 0, 1,
-0.5208157, -0.2541428, -4.330716, 0.2, 1, 0, 1,
-0.5191671, -0.639062, -1.203948, 0.1921569, 1, 0, 1,
-0.5176345, 0.434698, -0.4711253, 0.1882353, 1, 0, 1,
-0.5165474, 0.01861477, -1.785579, 0.1803922, 1, 0, 1,
-0.5138925, -0.3650044, -3.574429, 0.1764706, 1, 0, 1,
-0.5116644, 1.189029, 1.205071, 0.1686275, 1, 0, 1,
-0.5080233, 0.2245263, -1.392638, 0.1647059, 1, 0, 1,
-0.5052388, 0.7630053, -3.187876, 0.1568628, 1, 0, 1,
-0.5045063, -0.8283776, -2.836985, 0.1529412, 1, 0, 1,
-0.5013049, -0.4867623, -1.120409, 0.145098, 1, 0, 1,
-0.4994644, 0.1374927, -1.412607, 0.1411765, 1, 0, 1,
-0.4970489, 0.9873244, 0.2767573, 0.1333333, 1, 0, 1,
-0.4942291, 0.4366992, 0.3685031, 0.1294118, 1, 0, 1,
-0.4942116, -1.326378, -1.339655, 0.1215686, 1, 0, 1,
-0.4852348, 1.762272, 0.3158004, 0.1176471, 1, 0, 1,
-0.4844739, -2.506459, -2.211982, 0.1098039, 1, 0, 1,
-0.4783175, 3.185863, -0.6243101, 0.1058824, 1, 0, 1,
-0.4740862, -0.8102714, -3.503837, 0.09803922, 1, 0, 1,
-0.473599, -0.2412611, -2.079565, 0.09019608, 1, 0, 1,
-0.473453, 1.360922, -0.5937237, 0.08627451, 1, 0, 1,
-0.4721205, -1.310312, -4.227086, 0.07843138, 1, 0, 1,
-0.4715728, 1.41758, -0.7369261, 0.07450981, 1, 0, 1,
-0.469207, -0.4067563, -0.5539953, 0.06666667, 1, 0, 1,
-0.4668501, 0.08862792, -1.385323, 0.0627451, 1, 0, 1,
-0.4644392, -0.4348743, -1.196071, 0.05490196, 1, 0, 1,
-0.4599387, 2.018409, 1.207978, 0.05098039, 1, 0, 1,
-0.457866, -0.02241955, -1.336537, 0.04313726, 1, 0, 1,
-0.4531758, 1.464043, 0.220195, 0.03921569, 1, 0, 1,
-0.4518986, 2.267107, 0.08937037, 0.03137255, 1, 0, 1,
-0.4480093, -0.2136385, -2.299999, 0.02745098, 1, 0, 1,
-0.4462403, 0.2713163, -2.027203, 0.01960784, 1, 0, 1,
-0.4461915, 1.327962, 0.6773472, 0.01568628, 1, 0, 1,
-0.445369, -1.112529, -1.301077, 0.007843138, 1, 0, 1,
-0.4410549, 1.297631, 0.9655849, 0.003921569, 1, 0, 1,
-0.4405465, -1.449021, -4.115949, 0, 1, 0.003921569, 1,
-0.4376895, -0.9227573, -1.932825, 0, 1, 0.01176471, 1,
-0.4372109, -0.07699136, -1.43809, 0, 1, 0.01568628, 1,
-0.4353359, -1.617253, -3.179758, 0, 1, 0.02352941, 1,
-0.4344378, 1.012855, -0.3684416, 0, 1, 0.02745098, 1,
-0.4314024, 1.172854, 0.4948166, 0, 1, 0.03529412, 1,
-0.4292528, 1.965806, -1.690917, 0, 1, 0.03921569, 1,
-0.428068, 0.7968106, -1.206013, 0, 1, 0.04705882, 1,
-0.4256591, 0.5296453, -0.1140358, 0, 1, 0.05098039, 1,
-0.410719, 1.34841, -1.379364, 0, 1, 0.05882353, 1,
-0.4041177, 0.2980909, -2.481394, 0, 1, 0.0627451, 1,
-0.395867, 0.287407, -1.114578, 0, 1, 0.07058824, 1,
-0.3926131, 0.847558, 0.5126836, 0, 1, 0.07450981, 1,
-0.3866937, -1.452688, -3.264645, 0, 1, 0.08235294, 1,
-0.3814192, -1.832022, -3.367269, 0, 1, 0.08627451, 1,
-0.381123, 0.7082748, -0.4644369, 0, 1, 0.09411765, 1,
-0.3761079, -0.01131296, -2.459, 0, 1, 0.1019608, 1,
-0.3692366, -0.5831231, -2.616306, 0, 1, 0.1058824, 1,
-0.3692329, 0.1140858, -1.456724, 0, 1, 0.1137255, 1,
-0.3651828, 0.8011167, 0.7041495, 0, 1, 0.1176471, 1,
-0.3528086, 1.320187, 0.3650051, 0, 1, 0.1254902, 1,
-0.3463947, 0.8961539, 0.170689, 0, 1, 0.1294118, 1,
-0.3397119, 1.414768, -2.562832, 0, 1, 0.1372549, 1,
-0.3369875, -1.444002, -3.000904, 0, 1, 0.1411765, 1,
-0.3342011, 0.5698729, -1.961427, 0, 1, 0.1490196, 1,
-0.3340722, 1.250883, 0.3950102, 0, 1, 0.1529412, 1,
-0.3313072, -0.5759546, -1.043219, 0, 1, 0.1607843, 1,
-0.3287437, 1.789822, -0.07395779, 0, 1, 0.1647059, 1,
-0.3276375, -2.203108, -2.989064, 0, 1, 0.172549, 1,
-0.3234617, -0.2454028, -2.435536, 0, 1, 0.1764706, 1,
-0.3222572, 0.9088867, -1.810125, 0, 1, 0.1843137, 1,
-0.316767, -0.6163066, -2.063256, 0, 1, 0.1882353, 1,
-0.3157994, 1.265438, 0.2654432, 0, 1, 0.1960784, 1,
-0.3145756, 0.1807918, -1.251471, 0, 1, 0.2039216, 1,
-0.3138135, -0.799437, -3.494141, 0, 1, 0.2078431, 1,
-0.3129633, -0.2481422, -1.538567, 0, 1, 0.2156863, 1,
-0.3089373, -0.09193455, -2.225038, 0, 1, 0.2196078, 1,
-0.3045837, -0.1793027, -3.96107, 0, 1, 0.227451, 1,
-0.2934203, 2.221673, -0.3948121, 0, 1, 0.2313726, 1,
-0.288044, 0.688121, 0.8735997, 0, 1, 0.2392157, 1,
-0.2867723, 0.5032387, 0.4150845, 0, 1, 0.2431373, 1,
-0.2834624, -0.1688615, -2.813912, 0, 1, 0.2509804, 1,
-0.276529, 0.1821454, -0.974905, 0, 1, 0.254902, 1,
-0.2755228, -0.6795513, -5.06059, 0, 1, 0.2627451, 1,
-0.2754044, 0.1410453, -1.153933, 0, 1, 0.2666667, 1,
-0.2697658, -0.8253652, -2.509209, 0, 1, 0.2745098, 1,
-0.2684389, 0.1237259, -2.624844, 0, 1, 0.2784314, 1,
-0.2683774, 0.1679507, -1.196434, 0, 1, 0.2862745, 1,
-0.2676155, -0.3107463, -2.988412, 0, 1, 0.2901961, 1,
-0.2667783, 0.3917511, 0.2089778, 0, 1, 0.2980392, 1,
-0.2646653, -1.117046, -2.433582, 0, 1, 0.3058824, 1,
-0.2636522, -0.8711915, -4.05777, 0, 1, 0.3098039, 1,
-0.2606235, -0.7648889, -3.46943, 0, 1, 0.3176471, 1,
-0.2577055, -0.3038105, -2.58486, 0, 1, 0.3215686, 1,
-0.2553404, 0.4033896, -1.667152, 0, 1, 0.3294118, 1,
-0.2536496, -0.4326169, -2.620512, 0, 1, 0.3333333, 1,
-0.2510301, -2.067944, -1.281493, 0, 1, 0.3411765, 1,
-0.2505373, 1.127191, -0.4903089, 0, 1, 0.345098, 1,
-0.2494457, 1.467586, 0.2987086, 0, 1, 0.3529412, 1,
-0.2490181, 0.07545908, -0.3872558, 0, 1, 0.3568628, 1,
-0.2476539, 0.3589095, 0.4615677, 0, 1, 0.3647059, 1,
-0.2468224, -0.7549869, -2.584912, 0, 1, 0.3686275, 1,
-0.2461416, 3.104462, 0.1898753, 0, 1, 0.3764706, 1,
-0.2408518, -0.8685092, -1.54415, 0, 1, 0.3803922, 1,
-0.2385846, -0.94334, -2.911276, 0, 1, 0.3882353, 1,
-0.2383022, -0.1369781, -1.832667, 0, 1, 0.3921569, 1,
-0.2381596, 0.8559054, -1.225161, 0, 1, 0.4, 1,
-0.2372521, 1.203231, 0.3662853, 0, 1, 0.4078431, 1,
-0.2351702, 0.1183607, -0.4699399, 0, 1, 0.4117647, 1,
-0.2209904, -0.7959988, -3.447341, 0, 1, 0.4196078, 1,
-0.2199385, -0.5088319, -3.222254, 0, 1, 0.4235294, 1,
-0.2167926, -0.296136, -4.766033, 0, 1, 0.4313726, 1,
-0.2152462, 0.4734211, -0.5758183, 0, 1, 0.4352941, 1,
-0.2081269, 0.5921938, -1.019009, 0, 1, 0.4431373, 1,
-0.2076154, -2.691176, -2.394415, 0, 1, 0.4470588, 1,
-0.2073159, 0.2279848, 0.3151519, 0, 1, 0.454902, 1,
-0.205489, 0.4396615, -0.6764998, 0, 1, 0.4588235, 1,
-0.2027668, 1.113717, 0.05765388, 0, 1, 0.4666667, 1,
-0.1989255, -0.1512058, 0.07293153, 0, 1, 0.4705882, 1,
-0.1958885, -0.9426136, -1.745355, 0, 1, 0.4784314, 1,
-0.1954538, 0.421398, -1.148704, 0, 1, 0.4823529, 1,
-0.1954123, 0.3112213, -1.079306, 0, 1, 0.4901961, 1,
-0.1913269, 0.001115958, -2.284927, 0, 1, 0.4941176, 1,
-0.1908989, 1.663086, -2.372196, 0, 1, 0.5019608, 1,
-0.1906458, 0.6449341, -0.8117031, 0, 1, 0.509804, 1,
-0.1848399, 0.03297634, -2.492655, 0, 1, 0.5137255, 1,
-0.1708407, 0.0744383, -1.274796, 0, 1, 0.5215687, 1,
-0.1704615, -0.2486979, -0.3783921, 0, 1, 0.5254902, 1,
-0.1687908, -0.322863, -3.253147, 0, 1, 0.5333334, 1,
-0.1681589, -0.3243032, -3.434886, 0, 1, 0.5372549, 1,
-0.1660183, 0.3098875, 0.02230091, 0, 1, 0.5450981, 1,
-0.1616489, 0.3631063, -0.9597707, 0, 1, 0.5490196, 1,
-0.1609547, 0.639185, 1.34455, 0, 1, 0.5568628, 1,
-0.1562437, -1.087215, -1.081283, 0, 1, 0.5607843, 1,
-0.1544892, 0.5018365, 1.742268, 0, 1, 0.5686275, 1,
-0.1534423, -0.8354534, -4.32602, 0, 1, 0.572549, 1,
-0.1492841, 0.1026639, 0.3169273, 0, 1, 0.5803922, 1,
-0.1487122, 0.9714777, -0.05933842, 0, 1, 0.5843138, 1,
-0.1483445, -1.573606, -0.7219632, 0, 1, 0.5921569, 1,
-0.1481033, -0.1369963, -2.286705, 0, 1, 0.5960785, 1,
-0.1476731, 2.26493, 0.2256889, 0, 1, 0.6039216, 1,
-0.1455368, 1.660063, 0.891326, 0, 1, 0.6117647, 1,
-0.1439278, 1.201259, 0.8418395, 0, 1, 0.6156863, 1,
-0.1417668, 0.6557346, 0.7130979, 0, 1, 0.6235294, 1,
-0.1360114, 0.8234395, 0.2792402, 0, 1, 0.627451, 1,
-0.1325164, 0.6893785, -0.0660769, 0, 1, 0.6352941, 1,
-0.1293942, -1.351568, -4.739717, 0, 1, 0.6392157, 1,
-0.1293627, 0.2539037, 1.060718, 0, 1, 0.6470588, 1,
-0.1292764, 0.6499942, 1.852351, 0, 1, 0.6509804, 1,
-0.1244151, 1.03806, -1.28669, 0, 1, 0.6588235, 1,
-0.1158472, -0.2506911, -2.85523, 0, 1, 0.6627451, 1,
-0.115651, -1.466555, -3.450008, 0, 1, 0.6705883, 1,
-0.113586, -1.409281, -2.816432, 0, 1, 0.6745098, 1,
-0.110753, -1.684401, -4.881525, 0, 1, 0.682353, 1,
-0.1102806, -1.452782, -2.033857, 0, 1, 0.6862745, 1,
-0.1099063, 0.7929822, 0.0801564, 0, 1, 0.6941177, 1,
-0.1085492, -0.1764731, -0.4530748, 0, 1, 0.7019608, 1,
-0.1073596, 0.3020849, -1.328666, 0, 1, 0.7058824, 1,
-0.1069684, -1.04775, -2.190545, 0, 1, 0.7137255, 1,
-0.09841488, -1.165107, -3.238795, 0, 1, 0.7176471, 1,
-0.09637631, -1.278167, -2.465908, 0, 1, 0.7254902, 1,
-0.09158826, -0.9542556, -4.978214, 0, 1, 0.7294118, 1,
-0.0873531, 1.251739, 0.3828644, 0, 1, 0.7372549, 1,
-0.08555111, 0.4440904, 1.440519, 0, 1, 0.7411765, 1,
-0.08391938, 0.7429612, -0.1340427, 0, 1, 0.7490196, 1,
-0.08310106, -0.3161653, -2.927834, 0, 1, 0.7529412, 1,
-0.07387349, -0.8908218, -2.489076, 0, 1, 0.7607843, 1,
-0.06471568, 0.7544132, -0.3299032, 0, 1, 0.7647059, 1,
-0.06163292, 0.8893063, 0.9099429, 0, 1, 0.772549, 1,
-0.05819126, -0.7266418, -2.681157, 0, 1, 0.7764706, 1,
-0.05786744, 1.398976, 0.8896179, 0, 1, 0.7843137, 1,
-0.05572124, -2.164297, -1.659333, 0, 1, 0.7882353, 1,
-0.05368944, 0.4336173, -3.081623, 0, 1, 0.7960784, 1,
-0.04693193, 1.254834, 1.138448, 0, 1, 0.8039216, 1,
-0.03752713, -0.3299437, -1.852129, 0, 1, 0.8078431, 1,
-0.03717344, 1.197811, 0.4289077, 0, 1, 0.8156863, 1,
-0.03298761, -0.766839, -1.624855, 0, 1, 0.8196079, 1,
-0.03137402, 1.163129, -0.2839007, 0, 1, 0.827451, 1,
-0.03103733, 0.391836, 1.345879, 0, 1, 0.8313726, 1,
-0.03001321, 0.6631625, -1.446483, 0, 1, 0.8392157, 1,
-0.0279823, -0.3842218, -3.935143, 0, 1, 0.8431373, 1,
-0.02649274, -1.821978, -3.068652, 0, 1, 0.8509804, 1,
-0.02562768, -0.3542334, -3.57039, 0, 1, 0.854902, 1,
-0.0232024, 0.7905449, -0.7349733, 0, 1, 0.8627451, 1,
-0.0232, -1.690233, -2.960433, 0, 1, 0.8666667, 1,
-0.02316103, -1.595981, -1.995259, 0, 1, 0.8745098, 1,
-0.0230772, -0.6666726, -2.101207, 0, 1, 0.8784314, 1,
-0.02287774, -1.422732, -1.973626, 0, 1, 0.8862745, 1,
-0.02061166, 0.1288924, -0.9475433, 0, 1, 0.8901961, 1,
-0.02026167, 0.0001237095, -2.088411, 0, 1, 0.8980392, 1,
-0.01365243, -1.713241, -4.527097, 0, 1, 0.9058824, 1,
-0.01263844, -0.09391657, -4.359631, 0, 1, 0.9098039, 1,
-0.01122847, 0.9286189, -0.05956785, 0, 1, 0.9176471, 1,
-0.011069, 0.2104893, -0.4993857, 0, 1, 0.9215686, 1,
-0.0104101, 0.6877676, -0.8186173, 0, 1, 0.9294118, 1,
-0.01006225, 0.4409958, -0.5038689, 0, 1, 0.9333333, 1,
-0.009804347, -1.211707, -3.622539, 0, 1, 0.9411765, 1,
-0.008925241, 2.501113, -1.222418, 0, 1, 0.945098, 1,
-0.008438521, 1.875258, -0.5890169, 0, 1, 0.9529412, 1,
-0.00688502, 1.538382, 1.85417, 0, 1, 0.9568627, 1,
0.0006002834, -0.1317872, 3.865957, 0, 1, 0.9647059, 1,
0.004276774, -0.8584149, 2.845004, 0, 1, 0.9686275, 1,
0.006310156, -1.440155, 1.599659, 0, 1, 0.9764706, 1,
0.01190905, -0.5822293, 4.87461, 0, 1, 0.9803922, 1,
0.0119856, 0.595181, 1.521467, 0, 1, 0.9882353, 1,
0.01296799, 0.7544235, 0.8757076, 0, 1, 0.9921569, 1,
0.01318444, -0.6215333, 2.687996, 0, 1, 1, 1,
0.01347677, -0.1627432, 3.526426, 0, 0.9921569, 1, 1,
0.01866513, -0.7814854, 4.389098, 0, 0.9882353, 1, 1,
0.0193339, -1.062954, 3.497741, 0, 0.9803922, 1, 1,
0.0218841, 0.5669128, -2.533393, 0, 0.9764706, 1, 1,
0.02313379, 1.188023, 0.05127169, 0, 0.9686275, 1, 1,
0.03022803, -0.3600161, 3.453527, 0, 0.9647059, 1, 1,
0.03457977, 0.9373264, 1.455035, 0, 0.9568627, 1, 1,
0.04306149, -0.4765904, 0.8127678, 0, 0.9529412, 1, 1,
0.04492756, 0.224167, -0.5053453, 0, 0.945098, 1, 1,
0.04631421, -0.4467685, 3.640103, 0, 0.9411765, 1, 1,
0.04832242, 0.2828562, 0.5253088, 0, 0.9333333, 1, 1,
0.05005464, 0.9844916, 1.245627, 0, 0.9294118, 1, 1,
0.0555133, 0.6100491, -1.187433, 0, 0.9215686, 1, 1,
0.0567049, -0.9958664, 2.887854, 0, 0.9176471, 1, 1,
0.05749634, -0.8110844, 3.068442, 0, 0.9098039, 1, 1,
0.05756235, 0.3678617, -2.24785, 0, 0.9058824, 1, 1,
0.05974987, -0.3473616, 1.533669, 0, 0.8980392, 1, 1,
0.06160501, 0.1317472, -0.8730836, 0, 0.8901961, 1, 1,
0.06363917, -0.4473138, 3.315955, 0, 0.8862745, 1, 1,
0.06714623, 1.002176, -0.2685674, 0, 0.8784314, 1, 1,
0.06747577, -0.1503078, 1.239559, 0, 0.8745098, 1, 1,
0.07219612, 0.1818424, 0.3442542, 0, 0.8666667, 1, 1,
0.08055857, -0.08636837, 0.5855206, 0, 0.8627451, 1, 1,
0.08356036, -0.7087905, 2.421891, 0, 0.854902, 1, 1,
0.08463243, -2.262805, 3.780527, 0, 0.8509804, 1, 1,
0.08493935, -1.277009, 2.717993, 0, 0.8431373, 1, 1,
0.08648082, 1.187915, -0.4447886, 0, 0.8392157, 1, 1,
0.08672301, -2.129048, 2.795519, 0, 0.8313726, 1, 1,
0.08691708, 0.5622587, -1.094473, 0, 0.827451, 1, 1,
0.08704773, -0.318688, 4.716636, 0, 0.8196079, 1, 1,
0.08734445, 0.2801608, 2.906791, 0, 0.8156863, 1, 1,
0.08846904, -1.133248, 4.879595, 0, 0.8078431, 1, 1,
0.09141342, -0.2593075, 1.93029, 0, 0.8039216, 1, 1,
0.09368579, 0.5267951, 1.02276, 0, 0.7960784, 1, 1,
0.09396712, -0.0898618, 0.1781427, 0, 0.7882353, 1, 1,
0.09463447, -1.565022, 2.267706, 0, 0.7843137, 1, 1,
0.09543311, -0.2615588, 2.337469, 0, 0.7764706, 1, 1,
0.09750044, -0.3951501, 2.899724, 0, 0.772549, 1, 1,
0.1027093, -1.302713, 2.249619, 0, 0.7647059, 1, 1,
0.1032323, 1.828779, -0.1873658, 0, 0.7607843, 1, 1,
0.1080699, 1.162882, -1.089458, 0, 0.7529412, 1, 1,
0.1090755, -2.019609, 2.175742, 0, 0.7490196, 1, 1,
0.1116928, 0.3723507, 0.1053365, 0, 0.7411765, 1, 1,
0.1119299, -0.3520511, 4.610743, 0, 0.7372549, 1, 1,
0.1142465, 1.605692, 0.8429224, 0, 0.7294118, 1, 1,
0.1162837, -0.5184299, 2.368877, 0, 0.7254902, 1, 1,
0.1184068, 0.8847858, 0.1825257, 0, 0.7176471, 1, 1,
0.1192322, 1.135832, 0.5950858, 0, 0.7137255, 1, 1,
0.1219752, 0.7205988, 1.884277, 0, 0.7058824, 1, 1,
0.1256043, 0.1257353, 1.028751, 0, 0.6980392, 1, 1,
0.1256066, -0.1548574, 2.604496, 0, 0.6941177, 1, 1,
0.1257626, 0.225191, 0.07665788, 0, 0.6862745, 1, 1,
0.132933, 0.2046551, -0.5345712, 0, 0.682353, 1, 1,
0.1387452, 0.8775499, -0.3143612, 0, 0.6745098, 1, 1,
0.1404817, -0.6012643, 3.932716, 0, 0.6705883, 1, 1,
0.1406183, 0.7340281, 0.4279676, 0, 0.6627451, 1, 1,
0.140665, 0.9406196, 1.875528, 0, 0.6588235, 1, 1,
0.1407418, 2.376303, -1.151192, 0, 0.6509804, 1, 1,
0.1431578, -0.784402, 2.81168, 0, 0.6470588, 1, 1,
0.1435701, 0.3232947, -1.016055, 0, 0.6392157, 1, 1,
0.1456003, -0.4229636, 0.8393278, 0, 0.6352941, 1, 1,
0.1508603, -2.152101, 3.29587, 0, 0.627451, 1, 1,
0.1615661, 0.5941707, 1.204814, 0, 0.6235294, 1, 1,
0.1617105, 1.04462, 1.293859, 0, 0.6156863, 1, 1,
0.1637411, 1.142864, -0.3321487, 0, 0.6117647, 1, 1,
0.1649277, 0.6322639, 0.6486812, 0, 0.6039216, 1, 1,
0.1673079, -0.2822613, 1.175088, 0, 0.5960785, 1, 1,
0.1688136, -0.5499573, 2.438967, 0, 0.5921569, 1, 1,
0.1713815, 0.6092744, 1.411155, 0, 0.5843138, 1, 1,
0.1729791, 0.9619862, -1.093117, 0, 0.5803922, 1, 1,
0.1736229, -0.9720885, 3.875636, 0, 0.572549, 1, 1,
0.174889, -1.395968, 2.128584, 0, 0.5686275, 1, 1,
0.1755071, 1.959133, 0.9434432, 0, 0.5607843, 1, 1,
0.177998, -0.8080776, 1.581598, 0, 0.5568628, 1, 1,
0.1799722, 2.15596, 0.61885, 0, 0.5490196, 1, 1,
0.1807489, -0.623629, 2.368396, 0, 0.5450981, 1, 1,
0.1828112, -0.2433976, 2.107865, 0, 0.5372549, 1, 1,
0.1856578, -1.610783, 1.560821, 0, 0.5333334, 1, 1,
0.1907766, 0.5751686, 0.0705718, 0, 0.5254902, 1, 1,
0.1932366, -0.9441028, 4.230803, 0, 0.5215687, 1, 1,
0.1951575, -0.9057824, 4.423616, 0, 0.5137255, 1, 1,
0.1963951, 1.275833, -1.502855, 0, 0.509804, 1, 1,
0.1973294, -0.4605158, 3.097116, 0, 0.5019608, 1, 1,
0.2013764, -0.08308127, 1.499347, 0, 0.4941176, 1, 1,
0.201725, -0.446988, 2.53565, 0, 0.4901961, 1, 1,
0.2051241, -0.1949117, 2.33421, 0, 0.4823529, 1, 1,
0.2057689, 0.4842662, -0.08363947, 0, 0.4784314, 1, 1,
0.2067218, 0.8738236, 0.241059, 0, 0.4705882, 1, 1,
0.2138221, 0.00117715, 0.4200208, 0, 0.4666667, 1, 1,
0.2143674, 0.05122733, 1.467219, 0, 0.4588235, 1, 1,
0.2161513, -0.0007170531, 1.485757, 0, 0.454902, 1, 1,
0.2173906, -0.05090616, 3.822831, 0, 0.4470588, 1, 1,
0.2186702, 0.811697, 2.341461, 0, 0.4431373, 1, 1,
0.21896, -0.1575529, 0.4803237, 0, 0.4352941, 1, 1,
0.2195982, -0.7615525, 2.403292, 0, 0.4313726, 1, 1,
0.2232597, -1.200425, 1.952879, 0, 0.4235294, 1, 1,
0.2233043, 1.685381, -0.5130423, 0, 0.4196078, 1, 1,
0.227253, 0.459399, 0.3283859, 0, 0.4117647, 1, 1,
0.2277476, -1.167226, 2.667183, 0, 0.4078431, 1, 1,
0.2300877, 0.005469027, 3.052004, 0, 0.4, 1, 1,
0.2330265, -0.9847823, 2.288558, 0, 0.3921569, 1, 1,
0.2333373, 0.1054218, 1.923073, 0, 0.3882353, 1, 1,
0.2360959, -0.3140941, 2.531626, 0, 0.3803922, 1, 1,
0.2439007, 0.6270155, 1.274141, 0, 0.3764706, 1, 1,
0.2447698, -1.616003, 3.19192, 0, 0.3686275, 1, 1,
0.2455127, 0.1516374, 1.244591, 0, 0.3647059, 1, 1,
0.249194, 2.500104, -0.6353728, 0, 0.3568628, 1, 1,
0.250645, -0.2409649, 1.871944, 0, 0.3529412, 1, 1,
0.2506982, 0.9541028, -0.6480876, 0, 0.345098, 1, 1,
0.2566325, 0.6030216, 0.7306544, 0, 0.3411765, 1, 1,
0.2574824, -0.9246995, 3.580245, 0, 0.3333333, 1, 1,
0.2605736, 0.8993747, -0.3272348, 0, 0.3294118, 1, 1,
0.2660429, -0.337582, 3.086722, 0, 0.3215686, 1, 1,
0.2662846, 0.2535516, 0.2573555, 0, 0.3176471, 1, 1,
0.2701067, 1.094623, -0.3588043, 0, 0.3098039, 1, 1,
0.2705026, 1.333846, 0.03452277, 0, 0.3058824, 1, 1,
0.272202, 0.5357419, 0.8483045, 0, 0.2980392, 1, 1,
0.2736474, 1.542312, 0.2497758, 0, 0.2901961, 1, 1,
0.275003, 0.2165515, -0.4492951, 0, 0.2862745, 1, 1,
0.2770175, -0.1687529, 3.326706, 0, 0.2784314, 1, 1,
0.2779623, -2.70696, 4.954941, 0, 0.2745098, 1, 1,
0.2782995, -0.1916689, 0.4648515, 0, 0.2666667, 1, 1,
0.2787007, -1.255548, 2.934668, 0, 0.2627451, 1, 1,
0.2789922, 0.747922, 0.4444093, 0, 0.254902, 1, 1,
0.2800613, -1.256336, 1.687142, 0, 0.2509804, 1, 1,
0.2840433, -0.7280182, 3.652118, 0, 0.2431373, 1, 1,
0.2867707, 1.879648, -0.3950759, 0, 0.2392157, 1, 1,
0.291329, -1.289601, 4.935782, 0, 0.2313726, 1, 1,
0.2919363, 1.657518, 0.2919501, 0, 0.227451, 1, 1,
0.2959474, -0.4665558, 1.21506, 0, 0.2196078, 1, 1,
0.2980945, -0.1395355, 0.6710572, 0, 0.2156863, 1, 1,
0.3023262, 0.8089257, 0.1005955, 0, 0.2078431, 1, 1,
0.3051634, 1.374248, -2.036915, 0, 0.2039216, 1, 1,
0.3060519, 1.15987, 1.348916, 0, 0.1960784, 1, 1,
0.3080708, 1.344517, -1.285463, 0, 0.1882353, 1, 1,
0.314416, 1.581907, 1.897024, 0, 0.1843137, 1, 1,
0.3160925, 0.7949448, -0.7899565, 0, 0.1764706, 1, 1,
0.3178083, -2.165241, 3.186311, 0, 0.172549, 1, 1,
0.3194787, -0.9756154, 3.486867, 0, 0.1647059, 1, 1,
0.3201729, -1.365695, 1.991958, 0, 0.1607843, 1, 1,
0.3266175, -0.6663184, 2.010232, 0, 0.1529412, 1, 1,
0.3297244, -0.04566294, 1.480258, 0, 0.1490196, 1, 1,
0.3323042, 0.4953355, 1.683388, 0, 0.1411765, 1, 1,
0.3363079, 0.1078435, 1.076473, 0, 0.1372549, 1, 1,
0.3367414, 0.04336691, 1.346029, 0, 0.1294118, 1, 1,
0.3390717, 0.2488596, 2.063065, 0, 0.1254902, 1, 1,
0.3413491, -0.8067767, 1.861959, 0, 0.1176471, 1, 1,
0.3433452, -0.8452023, 2.696904, 0, 0.1137255, 1, 1,
0.3448206, 0.678156, -0.1733372, 0, 0.1058824, 1, 1,
0.3486455, -1.088144, 1.998262, 0, 0.09803922, 1, 1,
0.35112, 0.2996023, 0.9476689, 0, 0.09411765, 1, 1,
0.3521437, 0.4341442, 0.5529112, 0, 0.08627451, 1, 1,
0.3549438, 0.5914015, 0.7954357, 0, 0.08235294, 1, 1,
0.3583237, -0.9073387, 2.842747, 0, 0.07450981, 1, 1,
0.3590063, 1.052222, 0.08726966, 0, 0.07058824, 1, 1,
0.3599823, 0.08978825, 0.2633846, 0, 0.0627451, 1, 1,
0.3632992, -1.026066, 4.59049, 0, 0.05882353, 1, 1,
0.3767142, 0.383377, 0.8364341, 0, 0.05098039, 1, 1,
0.3771949, 0.4628511, 0.6722853, 0, 0.04705882, 1, 1,
0.3789056, 0.278042, 1.876217, 0, 0.03921569, 1, 1,
0.3796568, -0.2444285, 1.248005, 0, 0.03529412, 1, 1,
0.3800287, 0.3457476, 0.9606799, 0, 0.02745098, 1, 1,
0.3837561, -0.666669, 3.681442, 0, 0.02352941, 1, 1,
0.3849498, 0.8775586, 0.5260231, 0, 0.01568628, 1, 1,
0.3856868, 0.3115842, 2.136788, 0, 0.01176471, 1, 1,
0.3890272, 1.32385, -0.1216284, 0, 0.003921569, 1, 1,
0.3950738, 0.7554446, 1.406719, 0.003921569, 0, 1, 1,
0.3981697, 0.6103069, 2.947212, 0.007843138, 0, 1, 1,
0.4037184, -0.1314387, 1.830235, 0.01568628, 0, 1, 1,
0.4145611, 0.1556304, -0.774955, 0.01960784, 0, 1, 1,
0.4202378, -0.9495956, 3.140939, 0.02745098, 0, 1, 1,
0.4202667, 0.05502315, 1.524708, 0.03137255, 0, 1, 1,
0.4204162, 1.832159, 0.7986369, 0.03921569, 0, 1, 1,
0.421261, 0.1743394, 0.8072363, 0.04313726, 0, 1, 1,
0.4215513, 0.3949031, 0.9944311, 0.05098039, 0, 1, 1,
0.4228844, -0.0691318, 1.885521, 0.05490196, 0, 1, 1,
0.4270149, 1.429023, 1.333071, 0.0627451, 0, 1, 1,
0.4276729, -0.3682757, 2.20024, 0.06666667, 0, 1, 1,
0.4283269, -1.108026, 5.045044, 0.07450981, 0, 1, 1,
0.4283502, -0.5393552, 3.504316, 0.07843138, 0, 1, 1,
0.4367578, -0.5508415, 3.24339, 0.08627451, 0, 1, 1,
0.4406602, -0.219292, 1.77959, 0.09019608, 0, 1, 1,
0.4413296, 0.2565531, 0.2672309, 0.09803922, 0, 1, 1,
0.4470568, -0.4641823, 2.118026, 0.1058824, 0, 1, 1,
0.4475286, 0.464644, 1.801863, 0.1098039, 0, 1, 1,
0.4479702, -0.1366976, 1.142634, 0.1176471, 0, 1, 1,
0.4489132, 0.220675, 2.150861, 0.1215686, 0, 1, 1,
0.4585199, 1.118041, 0.03133602, 0.1294118, 0, 1, 1,
0.4587314, -2.866033, 3.073309, 0.1333333, 0, 1, 1,
0.4589212, 0.3160703, 0.3530013, 0.1411765, 0, 1, 1,
0.4605927, -1.239078, 3.282046, 0.145098, 0, 1, 1,
0.4634235, -0.5526937, 3.326351, 0.1529412, 0, 1, 1,
0.4635968, 0.3467163, 1.060194, 0.1568628, 0, 1, 1,
0.4655196, -0.5310212, 3.34319, 0.1647059, 0, 1, 1,
0.466178, -1.459205, 1.650318, 0.1686275, 0, 1, 1,
0.4678555, 0.4730311, 0.9187698, 0.1764706, 0, 1, 1,
0.4713284, -0.9608981, 1.818211, 0.1803922, 0, 1, 1,
0.4725114, -1.524698, 3.151846, 0.1882353, 0, 1, 1,
0.4751296, -1.300058, 2.386419, 0.1921569, 0, 1, 1,
0.4768205, -0.5386468, 4.674818, 0.2, 0, 1, 1,
0.4774213, -0.2563581, 1.560482, 0.2078431, 0, 1, 1,
0.4801577, 0.4165233, -0.3131688, 0.2117647, 0, 1, 1,
0.4810011, -1.04197, 3.965356, 0.2196078, 0, 1, 1,
0.4824809, -0.7978674, 4.658163, 0.2235294, 0, 1, 1,
0.4836834, -1.264446, 2.955408, 0.2313726, 0, 1, 1,
0.4862548, 1.082096, 1.798383, 0.2352941, 0, 1, 1,
0.4894087, -1.525267, 4.80199, 0.2431373, 0, 1, 1,
0.4900819, -0.6168213, 2.88696, 0.2470588, 0, 1, 1,
0.5002808, 0.3086495, 0.2205646, 0.254902, 0, 1, 1,
0.50045, 1.652518, 1.734637, 0.2588235, 0, 1, 1,
0.5016484, -1.252796, 3.028178, 0.2666667, 0, 1, 1,
0.5056109, -1.065925, 2.766305, 0.2705882, 0, 1, 1,
0.5084776, 1.089947, -0.2824412, 0.2784314, 0, 1, 1,
0.5161998, 1.131407, -1.368465, 0.282353, 0, 1, 1,
0.5177691, -0.8495706, 3.080485, 0.2901961, 0, 1, 1,
0.518207, 0.4269143, 0.2519667, 0.2941177, 0, 1, 1,
0.5224414, 0.7594326, 1.06554, 0.3019608, 0, 1, 1,
0.5269538, -1.500041, 0.7915935, 0.3098039, 0, 1, 1,
0.5326094, -1.161767, 3.511409, 0.3137255, 0, 1, 1,
0.5326965, -0.6683744, 1.554301, 0.3215686, 0, 1, 1,
0.5329419, 0.9720279, -1.092339, 0.3254902, 0, 1, 1,
0.534219, -0.2117339, 0.9262055, 0.3333333, 0, 1, 1,
0.5352051, 1.244408, 1.569883, 0.3372549, 0, 1, 1,
0.5370945, 0.2047201, 1.799457, 0.345098, 0, 1, 1,
0.5389883, -0.5223318, 1.758615, 0.3490196, 0, 1, 1,
0.5417802, 0.1163952, 1.955782, 0.3568628, 0, 1, 1,
0.5433525, -1.379313, 2.812315, 0.3607843, 0, 1, 1,
0.5437399, -0.2886834, 1.419051, 0.3686275, 0, 1, 1,
0.5442961, -1.427951, 0.8442174, 0.372549, 0, 1, 1,
0.55452, 1.184079, -0.2323855, 0.3803922, 0, 1, 1,
0.5684953, 0.2168842, 1.044676, 0.3843137, 0, 1, 1,
0.5700625, -1.28872, 2.542417, 0.3921569, 0, 1, 1,
0.5828134, 0.9458804, 0.1985137, 0.3960784, 0, 1, 1,
0.5857663, 0.1556839, 1.451097, 0.4039216, 0, 1, 1,
0.5897167, 1.249612, 0.4861978, 0.4117647, 0, 1, 1,
0.5953113, 0.07891468, 1.814414, 0.4156863, 0, 1, 1,
0.5983238, 1.986703, 0.3435452, 0.4235294, 0, 1, 1,
0.6132709, 0.5487749, -0.1411532, 0.427451, 0, 1, 1,
0.6142451, 0.8437857, -0.02406744, 0.4352941, 0, 1, 1,
0.6156988, -0.793213, 1.760704, 0.4392157, 0, 1, 1,
0.6195099, 0.1472871, -0.2833138, 0.4470588, 0, 1, 1,
0.6243378, -0.07222756, 2.958333, 0.4509804, 0, 1, 1,
0.6245842, -0.2149784, 0.8236713, 0.4588235, 0, 1, 1,
0.6259676, -0.2697571, 1.128967, 0.4627451, 0, 1, 1,
0.6295849, 0.6882783, -0.2414461, 0.4705882, 0, 1, 1,
0.6358576, 1.406597, -0.4838338, 0.4745098, 0, 1, 1,
0.6378343, 0.6832521, -0.7740982, 0.4823529, 0, 1, 1,
0.6394082, -0.704872, 2.061208, 0.4862745, 0, 1, 1,
0.6414029, 1.030789, 1.778174, 0.4941176, 0, 1, 1,
0.6430088, 0.3903967, 1.952022, 0.5019608, 0, 1, 1,
0.6433958, 1.379325, 0.8340481, 0.5058824, 0, 1, 1,
0.6496993, 1.938673, 0.5415835, 0.5137255, 0, 1, 1,
0.6527288, -0.995905, 1.184378, 0.5176471, 0, 1, 1,
0.6540729, 1.188784, -0.6634539, 0.5254902, 0, 1, 1,
0.6544336, 1.009599, 0.8682917, 0.5294118, 0, 1, 1,
0.6550858, -0.969301, 3.016215, 0.5372549, 0, 1, 1,
0.6577883, 0.04077046, 2.980208, 0.5411765, 0, 1, 1,
0.6585607, -0.07205756, -0.4661429, 0.5490196, 0, 1, 1,
0.661948, 2.329158, -0.1943244, 0.5529412, 0, 1, 1,
0.6657388, 1.133518, 0.1524329, 0.5607843, 0, 1, 1,
0.6677452, -0.9943818, 0.660886, 0.5647059, 0, 1, 1,
0.6682712, 0.3060683, 0.02022052, 0.572549, 0, 1, 1,
0.6687248, 0.121373, 0.3653571, 0.5764706, 0, 1, 1,
0.6697873, -0.889428, 2.971112, 0.5843138, 0, 1, 1,
0.6702359, -0.7802045, 0.8537899, 0.5882353, 0, 1, 1,
0.6740857, -0.5905812, 2.181368, 0.5960785, 0, 1, 1,
0.6923361, 0.3024127, 1.021178, 0.6039216, 0, 1, 1,
0.6932961, -0.26605, 2.003252, 0.6078432, 0, 1, 1,
0.7028267, -0.4013128, 1.282306, 0.6156863, 0, 1, 1,
0.708482, 0.02969561, -0.2549288, 0.6196079, 0, 1, 1,
0.7139329, -1.371896, 2.936895, 0.627451, 0, 1, 1,
0.7181254, 0.1201994, 1.673719, 0.6313726, 0, 1, 1,
0.7210011, 1.033318, -0.9765788, 0.6392157, 0, 1, 1,
0.7224073, -1.353902, 1.533067, 0.6431373, 0, 1, 1,
0.7229483, -1.84959, 3.286138, 0.6509804, 0, 1, 1,
0.7281178, 0.3214249, 1.380293, 0.654902, 0, 1, 1,
0.7292991, 0.2169821, 2.381738, 0.6627451, 0, 1, 1,
0.7317823, 0.8114629, 0.9228823, 0.6666667, 0, 1, 1,
0.7396032, -0.8370441, 1.650798, 0.6745098, 0, 1, 1,
0.7400693, -0.5122181, 1.359923, 0.6784314, 0, 1, 1,
0.7427853, -1.601106, 2.943675, 0.6862745, 0, 1, 1,
0.7478297, 0.8687193, 0.1283657, 0.6901961, 0, 1, 1,
0.7650466, -1.432718, 2.54962, 0.6980392, 0, 1, 1,
0.7679696, -1.289303, 3.068634, 0.7058824, 0, 1, 1,
0.7681609, 1.1383, 0.1517074, 0.7098039, 0, 1, 1,
0.7708139, -0.3447516, 1.996833, 0.7176471, 0, 1, 1,
0.7713079, 1.410283, -0.08073133, 0.7215686, 0, 1, 1,
0.7726854, -1.164258, 2.61859, 0.7294118, 0, 1, 1,
0.7763835, 0.6999837, 0.8060669, 0.7333333, 0, 1, 1,
0.7785869, -0.3563395, 1.022174, 0.7411765, 0, 1, 1,
0.7832699, 0.1138377, 0.8237407, 0.7450981, 0, 1, 1,
0.7842633, 0.9488637, 0.1469485, 0.7529412, 0, 1, 1,
0.7904018, 0.1103184, 1.929836, 0.7568628, 0, 1, 1,
0.7912103, -0.4403226, 3.675936, 0.7647059, 0, 1, 1,
0.8037089, -0.8369969, 1.900681, 0.7686275, 0, 1, 1,
0.8042222, -1.775941, 2.612813, 0.7764706, 0, 1, 1,
0.804848, 1.837834, 0.1802486, 0.7803922, 0, 1, 1,
0.8214024, 0.8993613, 0.8305256, 0.7882353, 0, 1, 1,
0.8228829, 0.3146498, 0.9742863, 0.7921569, 0, 1, 1,
0.828966, -0.4029873, 1.428042, 0.8, 0, 1, 1,
0.8348325, -0.3177082, 1.786986, 0.8078431, 0, 1, 1,
0.8356587, 1.477077, -0.8451002, 0.8117647, 0, 1, 1,
0.8415389, 0.2909479, 1.112829, 0.8196079, 0, 1, 1,
0.8501649, -1.597551, 2.175443, 0.8235294, 0, 1, 1,
0.8508875, 0.5030144, 1.062548, 0.8313726, 0, 1, 1,
0.8517247, 0.2121561, 1.585021, 0.8352941, 0, 1, 1,
0.8539692, 0.5559791, 1.087697, 0.8431373, 0, 1, 1,
0.8598834, -1.252578, 3.185775, 0.8470588, 0, 1, 1,
0.8602293, 0.4201248, 1.270301, 0.854902, 0, 1, 1,
0.8606772, -0.7717195, 2.825722, 0.8588235, 0, 1, 1,
0.8622689, 0.1147259, 1.9309, 0.8666667, 0, 1, 1,
0.8816215, 1.017993, 0.7908567, 0.8705882, 0, 1, 1,
0.8840351, -0.7504407, 0.6891579, 0.8784314, 0, 1, 1,
0.8854992, -1.18179, 2.442892, 0.8823529, 0, 1, 1,
0.8958781, -1.598251, 1.055503, 0.8901961, 0, 1, 1,
0.8995379, -0.007823279, 1.022212, 0.8941177, 0, 1, 1,
0.9000199, -1.068103, 3.845833, 0.9019608, 0, 1, 1,
0.9009048, 1.102051, -0.104717, 0.9098039, 0, 1, 1,
0.9018085, 1.309192, 0.8624223, 0.9137255, 0, 1, 1,
0.9054003, -0.5043893, 1.854088, 0.9215686, 0, 1, 1,
0.9135954, -0.4372991, 2.362607, 0.9254902, 0, 1, 1,
0.9225952, -1.108563, 4.292158, 0.9333333, 0, 1, 1,
0.9266043, 1.09621, 2.654963, 0.9372549, 0, 1, 1,
0.9267113, 0.2736305, 1.010319, 0.945098, 0, 1, 1,
0.9267586, 1.627107, 2.764152, 0.9490196, 0, 1, 1,
0.9285958, 0.7948399, 2.198834, 0.9568627, 0, 1, 1,
0.938878, -0.4918489, 1.112725, 0.9607843, 0, 1, 1,
0.9413466, 0.4892673, 0.8972549, 0.9686275, 0, 1, 1,
0.9413912, -0.7211023, 4.13752, 0.972549, 0, 1, 1,
0.9609957, 0.4206378, 3.699489, 0.9803922, 0, 1, 1,
0.9611625, 1.367339, 0.9097373, 0.9843137, 0, 1, 1,
0.9629731, -0.5221243, 1.271581, 0.9921569, 0, 1, 1,
0.9639893, 0.06426943, 2.783567, 0.9960784, 0, 1, 1,
0.9699838, 0.1822707, -0.7977459, 1, 0, 0.9960784, 1,
0.9721673, 0.5052207, 0.4061566, 1, 0, 0.9882353, 1,
0.9770603, -0.1490745, 3.087934, 1, 0, 0.9843137, 1,
0.9790729, -0.1653246, 2.720077, 1, 0, 0.9764706, 1,
0.9792728, -0.1505805, 1.567193, 1, 0, 0.972549, 1,
0.9820663, -1.39071, 1.824711, 1, 0, 0.9647059, 1,
0.9853003, 0.2819713, 0.7108647, 1, 0, 0.9607843, 1,
0.9883253, 0.6212012, -1.35713, 1, 0, 0.9529412, 1,
0.9936698, 1.439554, -0.07456733, 1, 0, 0.9490196, 1,
0.9938893, -0.1120543, 1.553913, 1, 0, 0.9411765, 1,
0.9964846, 0.9978054, 0.9997857, 1, 0, 0.9372549, 1,
0.9965818, 0.1806616, 1.229212, 1, 0, 0.9294118, 1,
0.9994277, 0.05336007, 0.4421776, 1, 0, 0.9254902, 1,
1.000282, 0.9677681, -0.240681, 1, 0, 0.9176471, 1,
1.00144, -0.7703477, 2.199672, 1, 0, 0.9137255, 1,
1.004932, -0.00769028, 0.2728257, 1, 0, 0.9058824, 1,
1.022911, -0.2438565, 0.1452335, 1, 0, 0.9019608, 1,
1.025097, -1.417268, 1.162386, 1, 0, 0.8941177, 1,
1.02666, 0.5432479, -0.3657753, 1, 0, 0.8862745, 1,
1.049859, 0.6297273, 1.413462, 1, 0, 0.8823529, 1,
1.049871, 2.050633, -0.5606081, 1, 0, 0.8745098, 1,
1.064791, 0.4104187, 0.1384396, 1, 0, 0.8705882, 1,
1.068507, 0.3422854, 1.671495, 1, 0, 0.8627451, 1,
1.07403, 0.2515129, -0.7344349, 1, 0, 0.8588235, 1,
1.075696, -0.5058379, 0.1183392, 1, 0, 0.8509804, 1,
1.077795, -0.3828792, 1.605461, 1, 0, 0.8470588, 1,
1.079447, -0.3534065, 1.447767, 1, 0, 0.8392157, 1,
1.079729, 0.4201521, 0.616133, 1, 0, 0.8352941, 1,
1.08148, -0.4263712, 1.743562, 1, 0, 0.827451, 1,
1.085871, 0.7949494, 2.659636, 1, 0, 0.8235294, 1,
1.092131, -0.5687063, 0.7856819, 1, 0, 0.8156863, 1,
1.106766, 0.8071393, 0.3457543, 1, 0, 0.8117647, 1,
1.107674, -2.206846, 1.152894, 1, 0, 0.8039216, 1,
1.108268, 0.06641657, 2.233464, 1, 0, 0.7960784, 1,
1.108676, 0.7461193, -0.4177579, 1, 0, 0.7921569, 1,
1.111835, -0.02955194, 1.118559, 1, 0, 0.7843137, 1,
1.114289, -0.181, 1.835254, 1, 0, 0.7803922, 1,
1.120715, 0.2202332, 2.744575, 1, 0, 0.772549, 1,
1.122534, -0.1635645, 1.252187, 1, 0, 0.7686275, 1,
1.122815, 1.465269, -1.052664, 1, 0, 0.7607843, 1,
1.125169, 0.3057198, 2.257654, 1, 0, 0.7568628, 1,
1.13071, -2.530958, 3.035396, 1, 0, 0.7490196, 1,
1.132766, -0.459833, 2.246667, 1, 0, 0.7450981, 1,
1.132969, -0.5922474, 2.379596, 1, 0, 0.7372549, 1,
1.139496, 0.5760518, 0.3600803, 1, 0, 0.7333333, 1,
1.1402, -0.3362552, 1.726798, 1, 0, 0.7254902, 1,
1.140388, 0.4606129, 1.427053, 1, 0, 0.7215686, 1,
1.155712, -0.7798368, 0.6601643, 1, 0, 0.7137255, 1,
1.155743, 0.9099369, -0.1647541, 1, 0, 0.7098039, 1,
1.156074, 0.1795506, 3.992088, 1, 0, 0.7019608, 1,
1.156476, -0.2768259, 2.842447, 1, 0, 0.6941177, 1,
1.161735, -1.805141, 2.004728, 1, 0, 0.6901961, 1,
1.17616, 0.6723641, -0.4508215, 1, 0, 0.682353, 1,
1.177435, 0.07374015, 0.635438, 1, 0, 0.6784314, 1,
1.177868, 1.215234, 0.5958921, 1, 0, 0.6705883, 1,
1.179913, -0.006926556, 1.821932, 1, 0, 0.6666667, 1,
1.186679, -0.2380385, 0.5192199, 1, 0, 0.6588235, 1,
1.203069, 0.7697807, -0.1520221, 1, 0, 0.654902, 1,
1.211989, -1.06642, 2.839879, 1, 0, 0.6470588, 1,
1.233496, -0.2857834, 0.07684188, 1, 0, 0.6431373, 1,
1.238198, 1.81743, 0.2640814, 1, 0, 0.6352941, 1,
1.242285, 0.5164015, 0.9521191, 1, 0, 0.6313726, 1,
1.250084, -0.3842928, 2.211027, 1, 0, 0.6235294, 1,
1.253901, -0.4111889, -1.191072, 1, 0, 0.6196079, 1,
1.25724, -0.02868297, 2.860486, 1, 0, 0.6117647, 1,
1.259821, -0.8785865, 2.258175, 1, 0, 0.6078432, 1,
1.262871, -0.6224794, 2.519789, 1, 0, 0.6, 1,
1.264611, 0.3673557, 1.784551, 1, 0, 0.5921569, 1,
1.265949, -0.5707433, 0.9874988, 1, 0, 0.5882353, 1,
1.269608, -0.03384376, 1.742652, 1, 0, 0.5803922, 1,
1.270236, -2.300485, 1.089621, 1, 0, 0.5764706, 1,
1.273083, 0.4202435, 3.2707, 1, 0, 0.5686275, 1,
1.274393, 0.4356615, 0.434301, 1, 0, 0.5647059, 1,
1.285088, 1.507778, 0.7928829, 1, 0, 0.5568628, 1,
1.286268, 0.3594813, 1.553917, 1, 0, 0.5529412, 1,
1.290084, 0.6295707, 0.3046176, 1, 0, 0.5450981, 1,
1.292509, -0.5746049, 1.351685, 1, 0, 0.5411765, 1,
1.302691, -0.7217351, 3.361154, 1, 0, 0.5333334, 1,
1.325363, -1.944296, 3.882473, 1, 0, 0.5294118, 1,
1.336601, 0.312333, 0.05220144, 1, 0, 0.5215687, 1,
1.338039, 2.416901, -0.4865239, 1, 0, 0.5176471, 1,
1.346587, 1.321146, -1.147747, 1, 0, 0.509804, 1,
1.352206, -0.6262286, 0.5751123, 1, 0, 0.5058824, 1,
1.376997, 0.6853102, 2.174266, 1, 0, 0.4980392, 1,
1.381669, 0.1960389, 2.845709, 1, 0, 0.4901961, 1,
1.386217, -0.2161832, 1.915588, 1, 0, 0.4862745, 1,
1.391795, 1.159086, 1.172639, 1, 0, 0.4784314, 1,
1.395561, -0.8607919, 0.1901319, 1, 0, 0.4745098, 1,
1.400756, -0.1750687, 3.50924, 1, 0, 0.4666667, 1,
1.423599, 1.591888, 2.73043, 1, 0, 0.4627451, 1,
1.429859, -0.265737, 2.24852, 1, 0, 0.454902, 1,
1.434599, -0.1338473, 1.759768, 1, 0, 0.4509804, 1,
1.443838, 0.2004, 2.229869, 1, 0, 0.4431373, 1,
1.463282, 0.1516081, 2.98629, 1, 0, 0.4392157, 1,
1.46711, 0.6037493, 0.2961642, 1, 0, 0.4313726, 1,
1.485267, -0.8143106, 1.81282, 1, 0, 0.427451, 1,
1.492966, -0.1552934, 1.19385, 1, 0, 0.4196078, 1,
1.510465, -1.169129, 1.482888, 1, 0, 0.4156863, 1,
1.514554, 0.4643808, 1.420448, 1, 0, 0.4078431, 1,
1.5346, 1.024754, 1.383349, 1, 0, 0.4039216, 1,
1.534982, -0.2012636, 2.04267, 1, 0, 0.3960784, 1,
1.552955, 0.6055703, 0.1889891, 1, 0, 0.3882353, 1,
1.580946, 0.5972829, 3.306229, 1, 0, 0.3843137, 1,
1.581549, 0.2307929, 1.254209, 1, 0, 0.3764706, 1,
1.590477, -1.358098, 1.150638, 1, 0, 0.372549, 1,
1.593702, 1.019092, 0.7599509, 1, 0, 0.3647059, 1,
1.594324, 0.7065955, 1.978085, 1, 0, 0.3607843, 1,
1.602662, 0.5446441, 2.6469, 1, 0, 0.3529412, 1,
1.617889, 0.05120557, 1.191805, 1, 0, 0.3490196, 1,
1.618268, 0.9352453, 1.275798, 1, 0, 0.3411765, 1,
1.637753, -0.1360886, -0.124836, 1, 0, 0.3372549, 1,
1.639938, -1.095461, -0.4315411, 1, 0, 0.3294118, 1,
1.646026, -0.5190699, 1.487438, 1, 0, 0.3254902, 1,
1.648811, -1.411892, 4.474534, 1, 0, 0.3176471, 1,
1.653134, 0.2896848, 0.8342427, 1, 0, 0.3137255, 1,
1.653315, -1.773456, 2.831934, 1, 0, 0.3058824, 1,
1.661341, 1.728258, -1.563948, 1, 0, 0.2980392, 1,
1.663492, -0.3198152, 1.160984, 1, 0, 0.2941177, 1,
1.673665, 1.007096, 1.237179, 1, 0, 0.2862745, 1,
1.707573, 1.142392, 1.31567, 1, 0, 0.282353, 1,
1.750176, 0.2491809, 1.930449, 1, 0, 0.2745098, 1,
1.758446, -0.5313975, 3.199539, 1, 0, 0.2705882, 1,
1.791159, 0.4445246, 2.202447, 1, 0, 0.2627451, 1,
1.79809, 0.04247803, 1.652014, 1, 0, 0.2588235, 1,
1.811966, -0.8986267, 1.462324, 1, 0, 0.2509804, 1,
1.828486, -0.169827, 3.397404, 1, 0, 0.2470588, 1,
1.841522, -1.332764, 1.204256, 1, 0, 0.2392157, 1,
1.846766, 1.11034, -0.8335813, 1, 0, 0.2352941, 1,
1.851153, 0.4345014, 0.3329117, 1, 0, 0.227451, 1,
1.863764, 0.5408084, 2.103552, 1, 0, 0.2235294, 1,
1.890511, -0.4419155, 2.864266, 1, 0, 0.2156863, 1,
1.899614, -0.6741019, 1.606797, 1, 0, 0.2117647, 1,
1.920638, 0.359553, 1.335251, 1, 0, 0.2039216, 1,
1.923728, -0.1691553, 3.098291, 1, 0, 0.1960784, 1,
1.944943, -0.05403789, 3.14307, 1, 0, 0.1921569, 1,
1.963623, 1.025334, 2.163532, 1, 0, 0.1843137, 1,
1.968122, 1.836888, 0.4398994, 1, 0, 0.1803922, 1,
1.970897, -0.3555237, 2.495529, 1, 0, 0.172549, 1,
1.981987, -1.012789, 2.93667, 1, 0, 0.1686275, 1,
1.985431, 0.1865985, 1.337283, 1, 0, 0.1607843, 1,
2.010943, -1.370428, 1.146453, 1, 0, 0.1568628, 1,
2.014221, -0.4360659, 1.130695, 1, 0, 0.1490196, 1,
2.044131, -0.2656168, 2.655525, 1, 0, 0.145098, 1,
2.10631, -0.9220538, 2.114173, 1, 0, 0.1372549, 1,
2.111692, 0.1032031, 0.4530597, 1, 0, 0.1333333, 1,
2.134609, 1.170064, 1.598404, 1, 0, 0.1254902, 1,
2.175992, 0.3983629, -0.3136604, 1, 0, 0.1215686, 1,
2.185535, 0.1588474, -0.5461611, 1, 0, 0.1137255, 1,
2.210066, -1.081674, 0.2624872, 1, 0, 0.1098039, 1,
2.226071, -0.5836515, 1.756295, 1, 0, 0.1019608, 1,
2.226778, 1.378955, 2.134747, 1, 0, 0.09411765, 1,
2.228029, -0.7931374, 1.600552, 1, 0, 0.09019608, 1,
2.241932, -0.2923465, 1.608572, 1, 0, 0.08235294, 1,
2.294139, -0.9057441, 2.932681, 1, 0, 0.07843138, 1,
2.311118, -0.5799521, 1.942147, 1, 0, 0.07058824, 1,
2.316893, -1.524659, 1.146231, 1, 0, 0.06666667, 1,
2.321666, 3.575432, 0.6477364, 1, 0, 0.05882353, 1,
2.335299, -0.9640646, 2.952079, 1, 0, 0.05490196, 1,
2.52918, -0.05671703, 1.598884, 1, 0, 0.04705882, 1,
2.552185, 0.9955395, 0.7129274, 1, 0, 0.04313726, 1,
2.567946, -0.03082891, 0.4875569, 1, 0, 0.03529412, 1,
2.663244, -2.241024, 1.408771, 1, 0, 0.03137255, 1,
2.735074, -1.059461, 2.063012, 1, 0, 0.02352941, 1,
2.885627, 0.3612468, 3.05477, 1, 0, 0.01960784, 1,
2.891026, -1.20561, 1.345279, 1, 0, 0.01176471, 1,
3.705856, 0.6825322, 1.589902, 1, 0, 0.007843138, 1
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
0.4011194, -3.957861, -6.835815, 0, -0.5, 0.5, 0.5,
0.4011194, -3.957861, -6.835815, 1, -0.5, 0.5, 0.5,
0.4011194, -3.957861, -6.835815, 1, 1.5, 0.5, 0.5,
0.4011194, -3.957861, -6.835815, 0, 1.5, 0.5, 0.5
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
-4.023923, 0.3546997, -6.835815, 0, -0.5, 0.5, 0.5,
-4.023923, 0.3546997, -6.835815, 1, -0.5, 0.5, 0.5,
-4.023923, 0.3546997, -6.835815, 1, 1.5, 0.5, 0.5,
-4.023923, 0.3546997, -6.835815, 0, 1.5, 0.5, 0.5
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
-4.023923, -3.957861, -0.03441668, 0, -0.5, 0.5, 0.5,
-4.023923, -3.957861, -0.03441668, 1, -0.5, 0.5, 0.5,
-4.023923, -3.957861, -0.03441668, 1, 1.5, 0.5, 0.5,
-4.023923, -3.957861, -0.03441668, 0, 1.5, 0.5, 0.5
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
-2, -2.962655, -5.266262,
3, -2.962655, -5.266262,
-2, -2.962655, -5.266262,
-2, -3.128523, -5.527854,
-1, -2.962655, -5.266262,
-1, -3.128523, -5.527854,
0, -2.962655, -5.266262,
0, -3.128523, -5.527854,
1, -2.962655, -5.266262,
1, -3.128523, -5.527854,
2, -2.962655, -5.266262,
2, -3.128523, -5.527854,
3, -2.962655, -5.266262,
3, -3.128523, -5.527854
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
-2, -3.460258, -6.051038, 0, -0.5, 0.5, 0.5,
-2, -3.460258, -6.051038, 1, -0.5, 0.5, 0.5,
-2, -3.460258, -6.051038, 1, 1.5, 0.5, 0.5,
-2, -3.460258, -6.051038, 0, 1.5, 0.5, 0.5,
-1, -3.460258, -6.051038, 0, -0.5, 0.5, 0.5,
-1, -3.460258, -6.051038, 1, -0.5, 0.5, 0.5,
-1, -3.460258, -6.051038, 1, 1.5, 0.5, 0.5,
-1, -3.460258, -6.051038, 0, 1.5, 0.5, 0.5,
0, -3.460258, -6.051038, 0, -0.5, 0.5, 0.5,
0, -3.460258, -6.051038, 1, -0.5, 0.5, 0.5,
0, -3.460258, -6.051038, 1, 1.5, 0.5, 0.5,
0, -3.460258, -6.051038, 0, 1.5, 0.5, 0.5,
1, -3.460258, -6.051038, 0, -0.5, 0.5, 0.5,
1, -3.460258, -6.051038, 1, -0.5, 0.5, 0.5,
1, -3.460258, -6.051038, 1, 1.5, 0.5, 0.5,
1, -3.460258, -6.051038, 0, 1.5, 0.5, 0.5,
2, -3.460258, -6.051038, 0, -0.5, 0.5, 0.5,
2, -3.460258, -6.051038, 1, -0.5, 0.5, 0.5,
2, -3.460258, -6.051038, 1, 1.5, 0.5, 0.5,
2, -3.460258, -6.051038, 0, 1.5, 0.5, 0.5,
3, -3.460258, -6.051038, 0, -0.5, 0.5, 0.5,
3, -3.460258, -6.051038, 1, -0.5, 0.5, 0.5,
3, -3.460258, -6.051038, 1, 1.5, 0.5, 0.5,
3, -3.460258, -6.051038, 0, 1.5, 0.5, 0.5
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
-3.00276, -2, -5.266262,
-3.00276, 3, -5.266262,
-3.00276, -2, -5.266262,
-3.172954, -2, -5.527854,
-3.00276, -1, -5.266262,
-3.172954, -1, -5.527854,
-3.00276, 0, -5.266262,
-3.172954, 0, -5.527854,
-3.00276, 1, -5.266262,
-3.172954, 1, -5.527854,
-3.00276, 2, -5.266262,
-3.172954, 2, -5.527854,
-3.00276, 3, -5.266262,
-3.172954, 3, -5.527854
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
-3.513342, -2, -6.051038, 0, -0.5, 0.5, 0.5,
-3.513342, -2, -6.051038, 1, -0.5, 0.5, 0.5,
-3.513342, -2, -6.051038, 1, 1.5, 0.5, 0.5,
-3.513342, -2, -6.051038, 0, 1.5, 0.5, 0.5,
-3.513342, -1, -6.051038, 0, -0.5, 0.5, 0.5,
-3.513342, -1, -6.051038, 1, -0.5, 0.5, 0.5,
-3.513342, -1, -6.051038, 1, 1.5, 0.5, 0.5,
-3.513342, -1, -6.051038, 0, 1.5, 0.5, 0.5,
-3.513342, 0, -6.051038, 0, -0.5, 0.5, 0.5,
-3.513342, 0, -6.051038, 1, -0.5, 0.5, 0.5,
-3.513342, 0, -6.051038, 1, 1.5, 0.5, 0.5,
-3.513342, 0, -6.051038, 0, 1.5, 0.5, 0.5,
-3.513342, 1, -6.051038, 0, -0.5, 0.5, 0.5,
-3.513342, 1, -6.051038, 1, -0.5, 0.5, 0.5,
-3.513342, 1, -6.051038, 1, 1.5, 0.5, 0.5,
-3.513342, 1, -6.051038, 0, 1.5, 0.5, 0.5,
-3.513342, 2, -6.051038, 0, -0.5, 0.5, 0.5,
-3.513342, 2, -6.051038, 1, -0.5, 0.5, 0.5,
-3.513342, 2, -6.051038, 1, 1.5, 0.5, 0.5,
-3.513342, 2, -6.051038, 0, 1.5, 0.5, 0.5,
-3.513342, 3, -6.051038, 0, -0.5, 0.5, 0.5,
-3.513342, 3, -6.051038, 1, -0.5, 0.5, 0.5,
-3.513342, 3, -6.051038, 1, 1.5, 0.5, 0.5,
-3.513342, 3, -6.051038, 0, 1.5, 0.5, 0.5
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
-3.00276, -2.962655, -4,
-3.00276, -2.962655, 4,
-3.00276, -2.962655, -4,
-3.172954, -3.128523, -4,
-3.00276, -2.962655, -2,
-3.172954, -3.128523, -2,
-3.00276, -2.962655, 0,
-3.172954, -3.128523, 0,
-3.00276, -2.962655, 2,
-3.172954, -3.128523, 2,
-3.00276, -2.962655, 4,
-3.172954, -3.128523, 4
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
-3.513342, -3.460258, -4, 0, -0.5, 0.5, 0.5,
-3.513342, -3.460258, -4, 1, -0.5, 0.5, 0.5,
-3.513342, -3.460258, -4, 1, 1.5, 0.5, 0.5,
-3.513342, -3.460258, -4, 0, 1.5, 0.5, 0.5,
-3.513342, -3.460258, -2, 0, -0.5, 0.5, 0.5,
-3.513342, -3.460258, -2, 1, -0.5, 0.5, 0.5,
-3.513342, -3.460258, -2, 1, 1.5, 0.5, 0.5,
-3.513342, -3.460258, -2, 0, 1.5, 0.5, 0.5,
-3.513342, -3.460258, 0, 0, -0.5, 0.5, 0.5,
-3.513342, -3.460258, 0, 1, -0.5, 0.5, 0.5,
-3.513342, -3.460258, 0, 1, 1.5, 0.5, 0.5,
-3.513342, -3.460258, 0, 0, 1.5, 0.5, 0.5,
-3.513342, -3.460258, 2, 0, -0.5, 0.5, 0.5,
-3.513342, -3.460258, 2, 1, -0.5, 0.5, 0.5,
-3.513342, -3.460258, 2, 1, 1.5, 0.5, 0.5,
-3.513342, -3.460258, 2, 0, 1.5, 0.5, 0.5,
-3.513342, -3.460258, 4, 0, -0.5, 0.5, 0.5,
-3.513342, -3.460258, 4, 1, -0.5, 0.5, 0.5,
-3.513342, -3.460258, 4, 1, 1.5, 0.5, 0.5,
-3.513342, -3.460258, 4, 0, 1.5, 0.5, 0.5
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
-3.00276, -2.962655, -5.266262,
-3.00276, 3.672054, -5.266262,
-3.00276, -2.962655, 5.197428,
-3.00276, 3.672054, 5.197428,
-3.00276, -2.962655, -5.266262,
-3.00276, -2.962655, 5.197428,
-3.00276, 3.672054, -5.266262,
-3.00276, 3.672054, 5.197428,
-3.00276, -2.962655, -5.266262,
3.804998, -2.962655, -5.266262,
-3.00276, -2.962655, 5.197428,
3.804998, -2.962655, 5.197428,
-3.00276, 3.672054, -5.266262,
3.804998, 3.672054, -5.266262,
-3.00276, 3.672054, 5.197428,
3.804998, 3.672054, 5.197428,
3.804998, -2.962655, -5.266262,
3.804998, 3.672054, -5.266262,
3.804998, -2.962655, 5.197428,
3.804998, 3.672054, 5.197428,
3.804998, -2.962655, -5.266262,
3.804998, -2.962655, 5.197428,
3.804998, 3.672054, -5.266262,
3.804998, 3.672054, 5.197428
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
var radius = 7.548864;
var distance = 33.58575;
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
mvMatrix.translate( -0.4011194, -0.3546997, 0.03441668 );
mvMatrix.scale( 1.198923, 1.230194, 0.7800288 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.58575);
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
fenasulam<-read.table("fenasulam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenasulam$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenasulam' not found
```

```r
y<-fenasulam$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenasulam' not found
```

```r
z<-fenasulam$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenasulam' not found
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
-2.903618, 0.2657979, 0.572457, 0, 0, 1, 1, 1,
-2.833548, -0.9325317, -1.191332, 1, 0, 0, 1, 1,
-2.801545, 0.3710603, -0.601142, 1, 0, 0, 1, 1,
-2.722864, -1.711821, -2.169075, 1, 0, 0, 1, 1,
-2.692972, -1.075576, -2.161598, 1, 0, 0, 1, 1,
-2.680678, 1.377998, -1.105257, 1, 0, 0, 1, 1,
-2.669035, 0.3908294, -1.133221, 0, 0, 0, 1, 1,
-2.652003, -0.5616276, -2.082585, 0, 0, 0, 1, 1,
-2.640856, -2.073574, -2.834551, 0, 0, 0, 1, 1,
-2.601941, 0.1280104, -2.34885, 0, 0, 0, 1, 1,
-2.492342, 0.2182808, -3.991602, 0, 0, 0, 1, 1,
-2.486909, -1.114371, -2.016826, 0, 0, 0, 1, 1,
-2.46513, -0.3492394, -2.559024, 0, 0, 0, 1, 1,
-2.416927, 1.133978, -2.030803, 1, 1, 1, 1, 1,
-2.395272, -0.1699718, -2.754742, 1, 1, 1, 1, 1,
-2.323233, 1.571542, -2.726957, 1, 1, 1, 1, 1,
-2.235863, 0.2488433, -1.175001, 1, 1, 1, 1, 1,
-2.22841, -0.9513969, -0.121117, 1, 1, 1, 1, 1,
-2.217407, -0.863758, -1.843881, 1, 1, 1, 1, 1,
-2.216918, 0.4264419, -0.8291478, 1, 1, 1, 1, 1,
-2.19308, -1.673607, -3.731026, 1, 1, 1, 1, 1,
-2.187393, 0.1128454, -1.339104, 1, 1, 1, 1, 1,
-2.169795, -0.5194668, -1.451279, 1, 1, 1, 1, 1,
-2.167347, -2.020024, -2.648787, 1, 1, 1, 1, 1,
-2.139969, 0.8256661, -2.680728, 1, 1, 1, 1, 1,
-2.133843, -0.5256757, -0.9222344, 1, 1, 1, 1, 1,
-2.124733, -0.6630193, -1.803578, 1, 1, 1, 1, 1,
-2.079079, -0.4238971, -1.49857, 1, 1, 1, 1, 1,
-2.068833, 0.7532442, -3.484148, 0, 0, 1, 1, 1,
-2.058793, 1.126147, -3.070622, 1, 0, 0, 1, 1,
-2.00871, -0.9897944, -1.154263, 1, 0, 0, 1, 1,
-1.996525, 0.3556963, -3.278174, 1, 0, 0, 1, 1,
-1.936685, 2.433964, -0.1527181, 1, 0, 0, 1, 1,
-1.934206, 1.194333, -0.3520802, 1, 0, 0, 1, 1,
-1.926959, -0.4572612, -1.04405, 0, 0, 0, 1, 1,
-1.91724, -1.757015, -1.722042, 0, 0, 0, 1, 1,
-1.91047, -0.3643619, -0.4119142, 0, 0, 0, 1, 1,
-1.88061, -0.1622525, -2.079465, 0, 0, 0, 1, 1,
-1.858706, 0.180303, -2.210251, 0, 0, 0, 1, 1,
-1.853647, 1.148576, -1.165917, 0, 0, 0, 1, 1,
-1.849968, -0.8265238, -2.604056, 0, 0, 0, 1, 1,
-1.849103, 0.1255269, -2.727017, 1, 1, 1, 1, 1,
-1.832919, -0.4214338, -2.428329, 1, 1, 1, 1, 1,
-1.825897, 0.527221, -1.84349, 1, 1, 1, 1, 1,
-1.821325, 1.421742, -2.393959, 1, 1, 1, 1, 1,
-1.800842, -0.4561829, -1.212796, 1, 1, 1, 1, 1,
-1.790316, -0.7103797, -2.59722, 1, 1, 1, 1, 1,
-1.78961, -1.287127, -1.503983, 1, 1, 1, 1, 1,
-1.789127, 0.0211353, -1.491549, 1, 1, 1, 1, 1,
-1.776565, -1.247407, -1.759291, 1, 1, 1, 1, 1,
-1.768558, 1.575204, -0.1963647, 1, 1, 1, 1, 1,
-1.75881, -0.6592375, -3.331814, 1, 1, 1, 1, 1,
-1.756123, -0.05184086, -5.113878, 1, 1, 1, 1, 1,
-1.747254, -1.26519, -1.487731, 1, 1, 1, 1, 1,
-1.728957, -0.08131368, -1.487726, 1, 1, 1, 1, 1,
-1.711744, 1.812083, -0.4933995, 1, 1, 1, 1, 1,
-1.695677, 0.3861044, -0.8244305, 0, 0, 1, 1, 1,
-1.690582, -1.369722, -3.90747, 1, 0, 0, 1, 1,
-1.689121, -0.8044335, -2.491471, 1, 0, 0, 1, 1,
-1.641104, -0.5712992, -0.8204783, 1, 0, 0, 1, 1,
-1.640146, -0.9546359, -1.152033, 1, 0, 0, 1, 1,
-1.635247, 0.2868156, -2.22718, 1, 0, 0, 1, 1,
-1.615596, -1.786989, -3.910847, 0, 0, 0, 1, 1,
-1.60436, -2.079618, -3.538892, 0, 0, 0, 1, 1,
-1.597513, 0.5676752, -3.561524, 0, 0, 0, 1, 1,
-1.58954, -0.3325145, -2.294632, 0, 0, 0, 1, 1,
-1.589409, -1.548406, -3.331856, 0, 0, 0, 1, 1,
-1.56792, -0.1371129, -1.343737, 0, 0, 0, 1, 1,
-1.55167, -2.635638, -2.271353, 0, 0, 0, 1, 1,
-1.542088, 0.3530361, -1.249786, 1, 1, 1, 1, 1,
-1.526767, -0.461083, -1.201814, 1, 1, 1, 1, 1,
-1.523724, -1.401732, -4.115303, 1, 1, 1, 1, 1,
-1.521253, -0.486569, -0.6516126, 1, 1, 1, 1, 1,
-1.517843, -0.5176078, -2.195663, 1, 1, 1, 1, 1,
-1.50218, 0.1952434, -0.9623294, 1, 1, 1, 1, 1,
-1.49935, -0.4517562, -2.28312, 1, 1, 1, 1, 1,
-1.479054, -0.3076056, -0.03478907, 1, 1, 1, 1, 1,
-1.478266, 1.314805, 1.119523, 1, 1, 1, 1, 1,
-1.472087, -0.9363, -1.464277, 1, 1, 1, 1, 1,
-1.469089, -0.2284149, -0.9499181, 1, 1, 1, 1, 1,
-1.468819, 0.451728, -2.447781, 1, 1, 1, 1, 1,
-1.454866, 1.343012, -1.315675, 1, 1, 1, 1, 1,
-1.452007, -1.494179, -2.634899, 1, 1, 1, 1, 1,
-1.448312, -1.438439, -1.586532, 1, 1, 1, 1, 1,
-1.435389, -0.4995943, -1.055255, 0, 0, 1, 1, 1,
-1.43303, 1.662565, -0.7374338, 1, 0, 0, 1, 1,
-1.43131, 0.09005502, -1.959116, 1, 0, 0, 1, 1,
-1.426565, -0.4441196, -2.331965, 1, 0, 0, 1, 1,
-1.424967, 1.640121, -1.318134, 1, 0, 0, 1, 1,
-1.42451, 0.2559781, -0.771391, 1, 0, 0, 1, 1,
-1.421104, 0.01256557, 1.007752, 0, 0, 0, 1, 1,
-1.415205, 1.362565, -2.323438, 0, 0, 0, 1, 1,
-1.412226, -0.9537007, -3.696943, 0, 0, 0, 1, 1,
-1.405032, -0.9000409, -4.016095, 0, 0, 0, 1, 1,
-1.395971, -1.393912, -0.8623737, 0, 0, 0, 1, 1,
-1.369264, 0.9092523, -2.005039, 0, 0, 0, 1, 1,
-1.357969, 0.5417695, -1.620592, 0, 0, 0, 1, 1,
-1.352615, 0.4114346, -0.815541, 1, 1, 1, 1, 1,
-1.352315, -0.9430331, -1.528271, 1, 1, 1, 1, 1,
-1.350058, -0.1324547, -2.941364, 1, 1, 1, 1, 1,
-1.346484, -0.08917276, -1.342849, 1, 1, 1, 1, 1,
-1.341611, 0.4582905, -2.686027, 1, 1, 1, 1, 1,
-1.332577, 0.6709707, -1.487696, 1, 1, 1, 1, 1,
-1.331934, -1.052701, -3.712846, 1, 1, 1, 1, 1,
-1.326372, 1.368713, -0.4187683, 1, 1, 1, 1, 1,
-1.325259, -0.6007118, -1.843993, 1, 1, 1, 1, 1,
-1.321629, 0.2750718, -1.677833, 1, 1, 1, 1, 1,
-1.317979, -0.5053977, -1.781708, 1, 1, 1, 1, 1,
-1.313684, -0.3621477, -2.104374, 1, 1, 1, 1, 1,
-1.300722, -2.122768, -3.607458, 1, 1, 1, 1, 1,
-1.291829, -0.5893633, -1.707894, 1, 1, 1, 1, 1,
-1.291552, -0.5848776, -1.742064, 1, 1, 1, 1, 1,
-1.288286, 0.4310416, -0.9507258, 0, 0, 1, 1, 1,
-1.286926, 0.8024173, -0.6813629, 1, 0, 0, 1, 1,
-1.28203, 0.3501925, 0.3422529, 1, 0, 0, 1, 1,
-1.271704, 0.05461635, 0.07301425, 1, 0, 0, 1, 1,
-1.27085, 0.2001712, -1.454133, 1, 0, 0, 1, 1,
-1.26417, 1.013942, -1.221823, 1, 0, 0, 1, 1,
-1.263412, 0.8131039, 0.952229, 0, 0, 0, 1, 1,
-1.251151, 0.5580641, -1.047087, 0, 0, 0, 1, 1,
-1.245843, 1.474616, -0.719267, 0, 0, 0, 1, 1,
-1.244086, -1.841795, -1.058339, 0, 0, 0, 1, 1,
-1.242843, -0.3561216, -3.353603, 0, 0, 0, 1, 1,
-1.241483, -1.577553, -2.146601, 0, 0, 0, 1, 1,
-1.234687, 1.764697, -1.044925, 0, 0, 0, 1, 1,
-1.234129, 0.23809, -0.3485968, 1, 1, 1, 1, 1,
-1.22495, 0.979791, -1.562801, 1, 1, 1, 1, 1,
-1.211951, 0.4092451, -2.199237, 1, 1, 1, 1, 1,
-1.210434, 1.184953, -0.51851, 1, 1, 1, 1, 1,
-1.207291, -0.8726632, -0.2531206, 1, 1, 1, 1, 1,
-1.185687, -0.1772513, -2.320855, 1, 1, 1, 1, 1,
-1.165192, 0.4042396, -0.4792387, 1, 1, 1, 1, 1,
-1.163571, 2.091524, -0.5881436, 1, 1, 1, 1, 1,
-1.160372, 1.288746, -0.2069772, 1, 1, 1, 1, 1,
-1.156681, -1.766858, -5.058224, 1, 1, 1, 1, 1,
-1.15254, -0.1682002, 0.3615051, 1, 1, 1, 1, 1,
-1.134764, 0.7477885, -0.841171, 1, 1, 1, 1, 1,
-1.122295, 1.007704, 0.02918725, 1, 1, 1, 1, 1,
-1.121396, -1.482842, -1.267237, 1, 1, 1, 1, 1,
-1.120085, -1.740631, -5.100954, 1, 1, 1, 1, 1,
-1.119932, 2.488739, 0.07216156, 0, 0, 1, 1, 1,
-1.119246, -0.08900901, -2.053367, 1, 0, 0, 1, 1,
-1.118761, 0.151206, -2.367929, 1, 0, 0, 1, 1,
-1.102206, -0.878239, -2.600684, 1, 0, 0, 1, 1,
-1.100644, -1.223949, -2.10846, 1, 0, 0, 1, 1,
-1.098013, -1.189727, -2.503633, 1, 0, 0, 1, 1,
-1.096317, 0.9786875, -1.091958, 0, 0, 0, 1, 1,
-1.093375, 0.04288965, -2.60881, 0, 0, 0, 1, 1,
-1.092107, -0.01922848, -1.837178, 0, 0, 0, 1, 1,
-1.091738, 0.2445776, -3.079068, 0, 0, 0, 1, 1,
-1.090907, -0.7660522, -3.18161, 0, 0, 0, 1, 1,
-1.087784, 0.4550371, 0.3721319, 0, 0, 0, 1, 1,
-1.084935, 0.8000907, -2.697144, 0, 0, 0, 1, 1,
-1.084173, 0.4170202, 0.01219582, 1, 1, 1, 1, 1,
-1.081494, -0.3331719, -1.759946, 1, 1, 1, 1, 1,
-1.077501, -0.02352303, -2.672617, 1, 1, 1, 1, 1,
-1.073956, -1.992978, -2.421898, 1, 1, 1, 1, 1,
-1.072137, -0.1491624, -2.377346, 1, 1, 1, 1, 1,
-1.066262, -0.6562583, -0.161641, 1, 1, 1, 1, 1,
-1.065027, -0.3069645, -1.168095, 1, 1, 1, 1, 1,
-1.060176, -1.31548, -2.053579, 1, 1, 1, 1, 1,
-1.059797, 0.1329703, -2.016493, 1, 1, 1, 1, 1,
-1.056796, 0.4917328, -1.479459, 1, 1, 1, 1, 1,
-1.052791, 0.3125597, -0.3784814, 1, 1, 1, 1, 1,
-1.052778, -0.2707458, -2.006245, 1, 1, 1, 1, 1,
-1.052451, -0.2145794, -2.47264, 1, 1, 1, 1, 1,
-1.052142, -2.025587, -3.406978, 1, 1, 1, 1, 1,
-1.049658, -0.2064221, -1.827152, 1, 1, 1, 1, 1,
-1.034211, 0.05814803, -1.830371, 0, 0, 1, 1, 1,
-1.027409, 1.135918, -1.220602, 1, 0, 0, 1, 1,
-1.027243, -0.7934905, -4.456445, 1, 0, 0, 1, 1,
-1.02397, -0.1534033, -1.206554, 1, 0, 0, 1, 1,
-1.02256, -0.04241252, -0.7128904, 1, 0, 0, 1, 1,
-1.015587, 0.8658707, -2.286441, 1, 0, 0, 1, 1,
-1.010195, -0.2494265, -4.322386, 0, 0, 0, 1, 1,
-1.000742, -0.7176684, -2.307244, 0, 0, 0, 1, 1,
-0.9974099, -0.07095736, -2.390929, 0, 0, 0, 1, 1,
-0.9870465, -2.026718, -0.4724173, 0, 0, 0, 1, 1,
-0.9807031, 2.510381, -2.892988, 0, 0, 0, 1, 1,
-0.9806132, 1.630115, -0.03795166, 0, 0, 0, 1, 1,
-0.9769382, -1.892172, -2.161977, 0, 0, 0, 1, 1,
-0.9727108, 0.7728219, -3.218812, 1, 1, 1, 1, 1,
-0.9574752, 0.1965688, -0.2077217, 1, 1, 1, 1, 1,
-0.945716, -0.485699, -1.071621, 1, 1, 1, 1, 1,
-0.9449773, -0.6285987, -2.191772, 1, 1, 1, 1, 1,
-0.9379351, 1.237939, 0.5980083, 1, 1, 1, 1, 1,
-0.9347406, 2.314916, -0.9627268, 1, 1, 1, 1, 1,
-0.933099, 0.4644716, -1.637443, 1, 1, 1, 1, 1,
-0.9246362, -0.5986347, -1.86317, 1, 1, 1, 1, 1,
-0.9241978, -0.3014366, -1.701254, 1, 1, 1, 1, 1,
-0.9205223, 1.104847, -0.2079748, 1, 1, 1, 1, 1,
-0.9198245, -2.336454, -3.423991, 1, 1, 1, 1, 1,
-0.9117889, -0.4226624, -1.116165, 1, 1, 1, 1, 1,
-0.901026, 0.6400003, -0.5026354, 1, 1, 1, 1, 1,
-0.8977949, 1.212075, -0.3496965, 1, 1, 1, 1, 1,
-0.8944251, 1.150062, -2.285815, 1, 1, 1, 1, 1,
-0.8907212, -1.49408, -2.067076, 0, 0, 1, 1, 1,
-0.890236, 0.5159175, -2.145419, 1, 0, 0, 1, 1,
-0.8895134, -0.02144287, -1.605879, 1, 0, 0, 1, 1,
-0.8879145, 0.5339245, -0.4044222, 1, 0, 0, 1, 1,
-0.8827512, -0.6090718, -3.339818, 1, 0, 0, 1, 1,
-0.8826885, -0.9766946, -2.566208, 1, 0, 0, 1, 1,
-0.8818104, 0.3931401, -0.07647809, 0, 0, 0, 1, 1,
-0.873882, -0.9688575, -3.802041, 0, 0, 0, 1, 1,
-0.8694685, -0.5035116, -1.356406, 0, 0, 0, 1, 1,
-0.8674353, -0.4930856, -1.987187, 0, 0, 0, 1, 1,
-0.8658007, 1.765202, 0.8031172, 0, 0, 0, 1, 1,
-0.8634943, -0.2915868, -1.777281, 0, 0, 0, 1, 1,
-0.8595964, 0.5680919, 0.03527612, 0, 0, 0, 1, 1,
-0.8594087, 1.330513, -0.7564815, 1, 1, 1, 1, 1,
-0.8551456, 1.30663, 0.05945015, 1, 1, 1, 1, 1,
-0.8462795, 0.4240091, 0.4206081, 1, 1, 1, 1, 1,
-0.8412454, 0.6744832, -1.113986, 1, 1, 1, 1, 1,
-0.8362919, 0.8619633, 0.5352304, 1, 1, 1, 1, 1,
-0.8352689, -1.077274, -2.44315, 1, 1, 1, 1, 1,
-0.8279497, 0.9217595, -1.270433, 1, 1, 1, 1, 1,
-0.8268459, 1.184002, -0.7330629, 1, 1, 1, 1, 1,
-0.8213247, 0.8219961, -1.101445, 1, 1, 1, 1, 1,
-0.8134751, 0.7848324, -0.6623058, 1, 1, 1, 1, 1,
-0.8131564, -1.005882, -0.9229611, 1, 1, 1, 1, 1,
-0.8029287, 0.2482563, -1.131497, 1, 1, 1, 1, 1,
-0.7935563, 0.8959785, -0.8234636, 1, 1, 1, 1, 1,
-0.790356, -0.7583899, -1.497606, 1, 1, 1, 1, 1,
-0.7896253, -1.433375, -1.85399, 1, 1, 1, 1, 1,
-0.7866006, 1.820554, -0.478195, 0, 0, 1, 1, 1,
-0.7858239, -0.1725759, -1.488488, 1, 0, 0, 1, 1,
-0.7803602, 1.268736, -1.631136, 1, 0, 0, 1, 1,
-0.7787017, -0.449662, -0.1628607, 1, 0, 0, 1, 1,
-0.7718099, 0.6143336, 0.4778911, 1, 0, 0, 1, 1,
-0.7657228, 0.2250993, -2.029557, 1, 0, 0, 1, 1,
-0.7630199, 0.3658477, -0.6968621, 0, 0, 0, 1, 1,
-0.7625799, 3.1238, -0.7564653, 0, 0, 0, 1, 1,
-0.7581775, 1.221247, 0.05428554, 0, 0, 0, 1, 1,
-0.7501814, -0.5031554, -2.865924, 0, 0, 0, 1, 1,
-0.7501037, 0.3743002, -0.2222834, 0, 0, 0, 1, 1,
-0.7448738, -0.5091845, -3.108721, 0, 0, 0, 1, 1,
-0.7447716, -0.04654311, -0.8141772, 0, 0, 0, 1, 1,
-0.7437063, 0.5644644, 0.5627712, 1, 1, 1, 1, 1,
-0.7436475, 0.2251256, -1.266882, 1, 1, 1, 1, 1,
-0.7420455, -0.1212413, -2.63212, 1, 1, 1, 1, 1,
-0.7397831, -1.176158, -1.694738, 1, 1, 1, 1, 1,
-0.7331682, -0.3213966, -2.832388, 1, 1, 1, 1, 1,
-0.7309154, -0.810976, -0.2159032, 1, 1, 1, 1, 1,
-0.7298741, 0.8937833, -0.762711, 1, 1, 1, 1, 1,
-0.723561, -0.5848961, -0.6637209, 1, 1, 1, 1, 1,
-0.7226079, 1.120125, -1.762631, 1, 1, 1, 1, 1,
-0.719554, 0.06947482, -0.1913306, 1, 1, 1, 1, 1,
-0.7172816, -0.8356061, -0.8315364, 1, 1, 1, 1, 1,
-0.7144139, -1.170824, -1.169717, 1, 1, 1, 1, 1,
-0.7108653, 0.2551041, -1.379611, 1, 1, 1, 1, 1,
-0.7090185, 0.4478597, -0.849233, 1, 1, 1, 1, 1,
-0.7082901, -0.6787925, -0.8567924, 1, 1, 1, 1, 1,
-0.7016504, -0.4146521, -1.746706, 0, 0, 1, 1, 1,
-0.6959313, 0.911916, 0.04690881, 1, 0, 0, 1, 1,
-0.6908281, 1.222001, -0.1164561, 1, 0, 0, 1, 1,
-0.6848484, -0.4407348, -4.147843, 1, 0, 0, 1, 1,
-0.6784205, -0.1924572, -1.676153, 1, 0, 0, 1, 1,
-0.6745567, -1.272619, -4.487952, 1, 0, 0, 1, 1,
-0.6682246, 1.434336, -0.6017818, 0, 0, 0, 1, 1,
-0.6648577, 0.5736772, -1.122796, 0, 0, 0, 1, 1,
-0.6646369, -0.401983, -1.792618, 0, 0, 0, 1, 1,
-0.6576922, -1.136823, -3.441161, 0, 0, 0, 1, 1,
-0.6555513, -0.8482387, -2.130677, 0, 0, 0, 1, 1,
-0.6533635, -0.9575387, -3.750422, 0, 0, 0, 1, 1,
-0.6486935, -0.3160022, -2.609503, 0, 0, 0, 1, 1,
-0.6466132, -1.39816, -2.49282, 1, 1, 1, 1, 1,
-0.6410944, 0.2018955, -0.3057236, 1, 1, 1, 1, 1,
-0.6409116, -0.4171853, -2.512683, 1, 1, 1, 1, 1,
-0.6382462, -0.9834546, -4.528359, 1, 1, 1, 1, 1,
-0.6355862, -0.5444216, -3.871556, 1, 1, 1, 1, 1,
-0.6352137, 0.6713332, -0.1294879, 1, 1, 1, 1, 1,
-0.6267349, -1.215198, -1.308774, 1, 1, 1, 1, 1,
-0.6220884, 0.0009018509, -3.432217, 1, 1, 1, 1, 1,
-0.6185593, 0.6441926, -1.144907, 1, 1, 1, 1, 1,
-0.6163253, -1.919719, -1.7882, 1, 1, 1, 1, 1,
-0.6113601, -0.5791857, -3.727542, 1, 1, 1, 1, 1,
-0.6106106, -2.157878, -2.891643, 1, 1, 1, 1, 1,
-0.6055902, -1.64474, -3.36759, 1, 1, 1, 1, 1,
-0.6055156, 1.042355, 1.456144, 1, 1, 1, 1, 1,
-0.6016738, -1.356897, -2.51284, 1, 1, 1, 1, 1,
-0.6010122, 0.4129668, -0.03059753, 0, 0, 1, 1, 1,
-0.5961867, -1.344232, -1.791028, 1, 0, 0, 1, 1,
-0.5877387, -1.632506, -2.629133, 1, 0, 0, 1, 1,
-0.5840355, -0.8577498, -2.39188, 1, 0, 0, 1, 1,
-0.5823113, 0.3649959, -0.4952875, 1, 0, 0, 1, 1,
-0.573965, 0.659761, -1.979878, 1, 0, 0, 1, 1,
-0.5713068, -0.5049028, -1.436201, 0, 0, 0, 1, 1,
-0.5707207, 0.06831911, -1.513795, 0, 0, 0, 1, 1,
-0.5685368, -1.132913, -1.958002, 0, 0, 0, 1, 1,
-0.5629522, -0.2623969, -2.522458, 0, 0, 0, 1, 1,
-0.5599692, -0.4113917, -1.373273, 0, 0, 0, 1, 1,
-0.5569709, 0.4858229, -1.790158, 0, 0, 0, 1, 1,
-0.5561729, -1.608149, -2.776465, 0, 0, 0, 1, 1,
-0.5519955, -0.1634644, -0.36015, 1, 1, 1, 1, 1,
-0.5446873, 0.638801, 0.2384391, 1, 1, 1, 1, 1,
-0.5440149, -0.9172656, -3.57664, 1, 1, 1, 1, 1,
-0.542363, 0.5464911, -0.1852306, 1, 1, 1, 1, 1,
-0.5335276, 0.7217382, 0.7065676, 1, 1, 1, 1, 1,
-0.5312528, 1.382981, 0.08222557, 1, 1, 1, 1, 1,
-0.5275736, -0.305735, -2.80344, 1, 1, 1, 1, 1,
-0.5208157, -0.2541428, -4.330716, 1, 1, 1, 1, 1,
-0.5191671, -0.639062, -1.203948, 1, 1, 1, 1, 1,
-0.5176345, 0.434698, -0.4711253, 1, 1, 1, 1, 1,
-0.5165474, 0.01861477, -1.785579, 1, 1, 1, 1, 1,
-0.5138925, -0.3650044, -3.574429, 1, 1, 1, 1, 1,
-0.5116644, 1.189029, 1.205071, 1, 1, 1, 1, 1,
-0.5080233, 0.2245263, -1.392638, 1, 1, 1, 1, 1,
-0.5052388, 0.7630053, -3.187876, 1, 1, 1, 1, 1,
-0.5045063, -0.8283776, -2.836985, 0, 0, 1, 1, 1,
-0.5013049, -0.4867623, -1.120409, 1, 0, 0, 1, 1,
-0.4994644, 0.1374927, -1.412607, 1, 0, 0, 1, 1,
-0.4970489, 0.9873244, 0.2767573, 1, 0, 0, 1, 1,
-0.4942291, 0.4366992, 0.3685031, 1, 0, 0, 1, 1,
-0.4942116, -1.326378, -1.339655, 1, 0, 0, 1, 1,
-0.4852348, 1.762272, 0.3158004, 0, 0, 0, 1, 1,
-0.4844739, -2.506459, -2.211982, 0, 0, 0, 1, 1,
-0.4783175, 3.185863, -0.6243101, 0, 0, 0, 1, 1,
-0.4740862, -0.8102714, -3.503837, 0, 0, 0, 1, 1,
-0.473599, -0.2412611, -2.079565, 0, 0, 0, 1, 1,
-0.473453, 1.360922, -0.5937237, 0, 0, 0, 1, 1,
-0.4721205, -1.310312, -4.227086, 0, 0, 0, 1, 1,
-0.4715728, 1.41758, -0.7369261, 1, 1, 1, 1, 1,
-0.469207, -0.4067563, -0.5539953, 1, 1, 1, 1, 1,
-0.4668501, 0.08862792, -1.385323, 1, 1, 1, 1, 1,
-0.4644392, -0.4348743, -1.196071, 1, 1, 1, 1, 1,
-0.4599387, 2.018409, 1.207978, 1, 1, 1, 1, 1,
-0.457866, -0.02241955, -1.336537, 1, 1, 1, 1, 1,
-0.4531758, 1.464043, 0.220195, 1, 1, 1, 1, 1,
-0.4518986, 2.267107, 0.08937037, 1, 1, 1, 1, 1,
-0.4480093, -0.2136385, -2.299999, 1, 1, 1, 1, 1,
-0.4462403, 0.2713163, -2.027203, 1, 1, 1, 1, 1,
-0.4461915, 1.327962, 0.6773472, 1, 1, 1, 1, 1,
-0.445369, -1.112529, -1.301077, 1, 1, 1, 1, 1,
-0.4410549, 1.297631, 0.9655849, 1, 1, 1, 1, 1,
-0.4405465, -1.449021, -4.115949, 1, 1, 1, 1, 1,
-0.4376895, -0.9227573, -1.932825, 1, 1, 1, 1, 1,
-0.4372109, -0.07699136, -1.43809, 0, 0, 1, 1, 1,
-0.4353359, -1.617253, -3.179758, 1, 0, 0, 1, 1,
-0.4344378, 1.012855, -0.3684416, 1, 0, 0, 1, 1,
-0.4314024, 1.172854, 0.4948166, 1, 0, 0, 1, 1,
-0.4292528, 1.965806, -1.690917, 1, 0, 0, 1, 1,
-0.428068, 0.7968106, -1.206013, 1, 0, 0, 1, 1,
-0.4256591, 0.5296453, -0.1140358, 0, 0, 0, 1, 1,
-0.410719, 1.34841, -1.379364, 0, 0, 0, 1, 1,
-0.4041177, 0.2980909, -2.481394, 0, 0, 0, 1, 1,
-0.395867, 0.287407, -1.114578, 0, 0, 0, 1, 1,
-0.3926131, 0.847558, 0.5126836, 0, 0, 0, 1, 1,
-0.3866937, -1.452688, -3.264645, 0, 0, 0, 1, 1,
-0.3814192, -1.832022, -3.367269, 0, 0, 0, 1, 1,
-0.381123, 0.7082748, -0.4644369, 1, 1, 1, 1, 1,
-0.3761079, -0.01131296, -2.459, 1, 1, 1, 1, 1,
-0.3692366, -0.5831231, -2.616306, 1, 1, 1, 1, 1,
-0.3692329, 0.1140858, -1.456724, 1, 1, 1, 1, 1,
-0.3651828, 0.8011167, 0.7041495, 1, 1, 1, 1, 1,
-0.3528086, 1.320187, 0.3650051, 1, 1, 1, 1, 1,
-0.3463947, 0.8961539, 0.170689, 1, 1, 1, 1, 1,
-0.3397119, 1.414768, -2.562832, 1, 1, 1, 1, 1,
-0.3369875, -1.444002, -3.000904, 1, 1, 1, 1, 1,
-0.3342011, 0.5698729, -1.961427, 1, 1, 1, 1, 1,
-0.3340722, 1.250883, 0.3950102, 1, 1, 1, 1, 1,
-0.3313072, -0.5759546, -1.043219, 1, 1, 1, 1, 1,
-0.3287437, 1.789822, -0.07395779, 1, 1, 1, 1, 1,
-0.3276375, -2.203108, -2.989064, 1, 1, 1, 1, 1,
-0.3234617, -0.2454028, -2.435536, 1, 1, 1, 1, 1,
-0.3222572, 0.9088867, -1.810125, 0, 0, 1, 1, 1,
-0.316767, -0.6163066, -2.063256, 1, 0, 0, 1, 1,
-0.3157994, 1.265438, 0.2654432, 1, 0, 0, 1, 1,
-0.3145756, 0.1807918, -1.251471, 1, 0, 0, 1, 1,
-0.3138135, -0.799437, -3.494141, 1, 0, 0, 1, 1,
-0.3129633, -0.2481422, -1.538567, 1, 0, 0, 1, 1,
-0.3089373, -0.09193455, -2.225038, 0, 0, 0, 1, 1,
-0.3045837, -0.1793027, -3.96107, 0, 0, 0, 1, 1,
-0.2934203, 2.221673, -0.3948121, 0, 0, 0, 1, 1,
-0.288044, 0.688121, 0.8735997, 0, 0, 0, 1, 1,
-0.2867723, 0.5032387, 0.4150845, 0, 0, 0, 1, 1,
-0.2834624, -0.1688615, -2.813912, 0, 0, 0, 1, 1,
-0.276529, 0.1821454, -0.974905, 0, 0, 0, 1, 1,
-0.2755228, -0.6795513, -5.06059, 1, 1, 1, 1, 1,
-0.2754044, 0.1410453, -1.153933, 1, 1, 1, 1, 1,
-0.2697658, -0.8253652, -2.509209, 1, 1, 1, 1, 1,
-0.2684389, 0.1237259, -2.624844, 1, 1, 1, 1, 1,
-0.2683774, 0.1679507, -1.196434, 1, 1, 1, 1, 1,
-0.2676155, -0.3107463, -2.988412, 1, 1, 1, 1, 1,
-0.2667783, 0.3917511, 0.2089778, 1, 1, 1, 1, 1,
-0.2646653, -1.117046, -2.433582, 1, 1, 1, 1, 1,
-0.2636522, -0.8711915, -4.05777, 1, 1, 1, 1, 1,
-0.2606235, -0.7648889, -3.46943, 1, 1, 1, 1, 1,
-0.2577055, -0.3038105, -2.58486, 1, 1, 1, 1, 1,
-0.2553404, 0.4033896, -1.667152, 1, 1, 1, 1, 1,
-0.2536496, -0.4326169, -2.620512, 1, 1, 1, 1, 1,
-0.2510301, -2.067944, -1.281493, 1, 1, 1, 1, 1,
-0.2505373, 1.127191, -0.4903089, 1, 1, 1, 1, 1,
-0.2494457, 1.467586, 0.2987086, 0, 0, 1, 1, 1,
-0.2490181, 0.07545908, -0.3872558, 1, 0, 0, 1, 1,
-0.2476539, 0.3589095, 0.4615677, 1, 0, 0, 1, 1,
-0.2468224, -0.7549869, -2.584912, 1, 0, 0, 1, 1,
-0.2461416, 3.104462, 0.1898753, 1, 0, 0, 1, 1,
-0.2408518, -0.8685092, -1.54415, 1, 0, 0, 1, 1,
-0.2385846, -0.94334, -2.911276, 0, 0, 0, 1, 1,
-0.2383022, -0.1369781, -1.832667, 0, 0, 0, 1, 1,
-0.2381596, 0.8559054, -1.225161, 0, 0, 0, 1, 1,
-0.2372521, 1.203231, 0.3662853, 0, 0, 0, 1, 1,
-0.2351702, 0.1183607, -0.4699399, 0, 0, 0, 1, 1,
-0.2209904, -0.7959988, -3.447341, 0, 0, 0, 1, 1,
-0.2199385, -0.5088319, -3.222254, 0, 0, 0, 1, 1,
-0.2167926, -0.296136, -4.766033, 1, 1, 1, 1, 1,
-0.2152462, 0.4734211, -0.5758183, 1, 1, 1, 1, 1,
-0.2081269, 0.5921938, -1.019009, 1, 1, 1, 1, 1,
-0.2076154, -2.691176, -2.394415, 1, 1, 1, 1, 1,
-0.2073159, 0.2279848, 0.3151519, 1, 1, 1, 1, 1,
-0.205489, 0.4396615, -0.6764998, 1, 1, 1, 1, 1,
-0.2027668, 1.113717, 0.05765388, 1, 1, 1, 1, 1,
-0.1989255, -0.1512058, 0.07293153, 1, 1, 1, 1, 1,
-0.1958885, -0.9426136, -1.745355, 1, 1, 1, 1, 1,
-0.1954538, 0.421398, -1.148704, 1, 1, 1, 1, 1,
-0.1954123, 0.3112213, -1.079306, 1, 1, 1, 1, 1,
-0.1913269, 0.001115958, -2.284927, 1, 1, 1, 1, 1,
-0.1908989, 1.663086, -2.372196, 1, 1, 1, 1, 1,
-0.1906458, 0.6449341, -0.8117031, 1, 1, 1, 1, 1,
-0.1848399, 0.03297634, -2.492655, 1, 1, 1, 1, 1,
-0.1708407, 0.0744383, -1.274796, 0, 0, 1, 1, 1,
-0.1704615, -0.2486979, -0.3783921, 1, 0, 0, 1, 1,
-0.1687908, -0.322863, -3.253147, 1, 0, 0, 1, 1,
-0.1681589, -0.3243032, -3.434886, 1, 0, 0, 1, 1,
-0.1660183, 0.3098875, 0.02230091, 1, 0, 0, 1, 1,
-0.1616489, 0.3631063, -0.9597707, 1, 0, 0, 1, 1,
-0.1609547, 0.639185, 1.34455, 0, 0, 0, 1, 1,
-0.1562437, -1.087215, -1.081283, 0, 0, 0, 1, 1,
-0.1544892, 0.5018365, 1.742268, 0, 0, 0, 1, 1,
-0.1534423, -0.8354534, -4.32602, 0, 0, 0, 1, 1,
-0.1492841, 0.1026639, 0.3169273, 0, 0, 0, 1, 1,
-0.1487122, 0.9714777, -0.05933842, 0, 0, 0, 1, 1,
-0.1483445, -1.573606, -0.7219632, 0, 0, 0, 1, 1,
-0.1481033, -0.1369963, -2.286705, 1, 1, 1, 1, 1,
-0.1476731, 2.26493, 0.2256889, 1, 1, 1, 1, 1,
-0.1455368, 1.660063, 0.891326, 1, 1, 1, 1, 1,
-0.1439278, 1.201259, 0.8418395, 1, 1, 1, 1, 1,
-0.1417668, 0.6557346, 0.7130979, 1, 1, 1, 1, 1,
-0.1360114, 0.8234395, 0.2792402, 1, 1, 1, 1, 1,
-0.1325164, 0.6893785, -0.0660769, 1, 1, 1, 1, 1,
-0.1293942, -1.351568, -4.739717, 1, 1, 1, 1, 1,
-0.1293627, 0.2539037, 1.060718, 1, 1, 1, 1, 1,
-0.1292764, 0.6499942, 1.852351, 1, 1, 1, 1, 1,
-0.1244151, 1.03806, -1.28669, 1, 1, 1, 1, 1,
-0.1158472, -0.2506911, -2.85523, 1, 1, 1, 1, 1,
-0.115651, -1.466555, -3.450008, 1, 1, 1, 1, 1,
-0.113586, -1.409281, -2.816432, 1, 1, 1, 1, 1,
-0.110753, -1.684401, -4.881525, 1, 1, 1, 1, 1,
-0.1102806, -1.452782, -2.033857, 0, 0, 1, 1, 1,
-0.1099063, 0.7929822, 0.0801564, 1, 0, 0, 1, 1,
-0.1085492, -0.1764731, -0.4530748, 1, 0, 0, 1, 1,
-0.1073596, 0.3020849, -1.328666, 1, 0, 0, 1, 1,
-0.1069684, -1.04775, -2.190545, 1, 0, 0, 1, 1,
-0.09841488, -1.165107, -3.238795, 1, 0, 0, 1, 1,
-0.09637631, -1.278167, -2.465908, 0, 0, 0, 1, 1,
-0.09158826, -0.9542556, -4.978214, 0, 0, 0, 1, 1,
-0.0873531, 1.251739, 0.3828644, 0, 0, 0, 1, 1,
-0.08555111, 0.4440904, 1.440519, 0, 0, 0, 1, 1,
-0.08391938, 0.7429612, -0.1340427, 0, 0, 0, 1, 1,
-0.08310106, -0.3161653, -2.927834, 0, 0, 0, 1, 1,
-0.07387349, -0.8908218, -2.489076, 0, 0, 0, 1, 1,
-0.06471568, 0.7544132, -0.3299032, 1, 1, 1, 1, 1,
-0.06163292, 0.8893063, 0.9099429, 1, 1, 1, 1, 1,
-0.05819126, -0.7266418, -2.681157, 1, 1, 1, 1, 1,
-0.05786744, 1.398976, 0.8896179, 1, 1, 1, 1, 1,
-0.05572124, -2.164297, -1.659333, 1, 1, 1, 1, 1,
-0.05368944, 0.4336173, -3.081623, 1, 1, 1, 1, 1,
-0.04693193, 1.254834, 1.138448, 1, 1, 1, 1, 1,
-0.03752713, -0.3299437, -1.852129, 1, 1, 1, 1, 1,
-0.03717344, 1.197811, 0.4289077, 1, 1, 1, 1, 1,
-0.03298761, -0.766839, -1.624855, 1, 1, 1, 1, 1,
-0.03137402, 1.163129, -0.2839007, 1, 1, 1, 1, 1,
-0.03103733, 0.391836, 1.345879, 1, 1, 1, 1, 1,
-0.03001321, 0.6631625, -1.446483, 1, 1, 1, 1, 1,
-0.0279823, -0.3842218, -3.935143, 1, 1, 1, 1, 1,
-0.02649274, -1.821978, -3.068652, 1, 1, 1, 1, 1,
-0.02562768, -0.3542334, -3.57039, 0, 0, 1, 1, 1,
-0.0232024, 0.7905449, -0.7349733, 1, 0, 0, 1, 1,
-0.0232, -1.690233, -2.960433, 1, 0, 0, 1, 1,
-0.02316103, -1.595981, -1.995259, 1, 0, 0, 1, 1,
-0.0230772, -0.6666726, -2.101207, 1, 0, 0, 1, 1,
-0.02287774, -1.422732, -1.973626, 1, 0, 0, 1, 1,
-0.02061166, 0.1288924, -0.9475433, 0, 0, 0, 1, 1,
-0.02026167, 0.0001237095, -2.088411, 0, 0, 0, 1, 1,
-0.01365243, -1.713241, -4.527097, 0, 0, 0, 1, 1,
-0.01263844, -0.09391657, -4.359631, 0, 0, 0, 1, 1,
-0.01122847, 0.9286189, -0.05956785, 0, 0, 0, 1, 1,
-0.011069, 0.2104893, -0.4993857, 0, 0, 0, 1, 1,
-0.0104101, 0.6877676, -0.8186173, 0, 0, 0, 1, 1,
-0.01006225, 0.4409958, -0.5038689, 1, 1, 1, 1, 1,
-0.009804347, -1.211707, -3.622539, 1, 1, 1, 1, 1,
-0.008925241, 2.501113, -1.222418, 1, 1, 1, 1, 1,
-0.008438521, 1.875258, -0.5890169, 1, 1, 1, 1, 1,
-0.00688502, 1.538382, 1.85417, 1, 1, 1, 1, 1,
0.0006002834, -0.1317872, 3.865957, 1, 1, 1, 1, 1,
0.004276774, -0.8584149, 2.845004, 1, 1, 1, 1, 1,
0.006310156, -1.440155, 1.599659, 1, 1, 1, 1, 1,
0.01190905, -0.5822293, 4.87461, 1, 1, 1, 1, 1,
0.0119856, 0.595181, 1.521467, 1, 1, 1, 1, 1,
0.01296799, 0.7544235, 0.8757076, 1, 1, 1, 1, 1,
0.01318444, -0.6215333, 2.687996, 1, 1, 1, 1, 1,
0.01347677, -0.1627432, 3.526426, 1, 1, 1, 1, 1,
0.01866513, -0.7814854, 4.389098, 1, 1, 1, 1, 1,
0.0193339, -1.062954, 3.497741, 1, 1, 1, 1, 1,
0.0218841, 0.5669128, -2.533393, 0, 0, 1, 1, 1,
0.02313379, 1.188023, 0.05127169, 1, 0, 0, 1, 1,
0.03022803, -0.3600161, 3.453527, 1, 0, 0, 1, 1,
0.03457977, 0.9373264, 1.455035, 1, 0, 0, 1, 1,
0.04306149, -0.4765904, 0.8127678, 1, 0, 0, 1, 1,
0.04492756, 0.224167, -0.5053453, 1, 0, 0, 1, 1,
0.04631421, -0.4467685, 3.640103, 0, 0, 0, 1, 1,
0.04832242, 0.2828562, 0.5253088, 0, 0, 0, 1, 1,
0.05005464, 0.9844916, 1.245627, 0, 0, 0, 1, 1,
0.0555133, 0.6100491, -1.187433, 0, 0, 0, 1, 1,
0.0567049, -0.9958664, 2.887854, 0, 0, 0, 1, 1,
0.05749634, -0.8110844, 3.068442, 0, 0, 0, 1, 1,
0.05756235, 0.3678617, -2.24785, 0, 0, 0, 1, 1,
0.05974987, -0.3473616, 1.533669, 1, 1, 1, 1, 1,
0.06160501, 0.1317472, -0.8730836, 1, 1, 1, 1, 1,
0.06363917, -0.4473138, 3.315955, 1, 1, 1, 1, 1,
0.06714623, 1.002176, -0.2685674, 1, 1, 1, 1, 1,
0.06747577, -0.1503078, 1.239559, 1, 1, 1, 1, 1,
0.07219612, 0.1818424, 0.3442542, 1, 1, 1, 1, 1,
0.08055857, -0.08636837, 0.5855206, 1, 1, 1, 1, 1,
0.08356036, -0.7087905, 2.421891, 1, 1, 1, 1, 1,
0.08463243, -2.262805, 3.780527, 1, 1, 1, 1, 1,
0.08493935, -1.277009, 2.717993, 1, 1, 1, 1, 1,
0.08648082, 1.187915, -0.4447886, 1, 1, 1, 1, 1,
0.08672301, -2.129048, 2.795519, 1, 1, 1, 1, 1,
0.08691708, 0.5622587, -1.094473, 1, 1, 1, 1, 1,
0.08704773, -0.318688, 4.716636, 1, 1, 1, 1, 1,
0.08734445, 0.2801608, 2.906791, 1, 1, 1, 1, 1,
0.08846904, -1.133248, 4.879595, 0, 0, 1, 1, 1,
0.09141342, -0.2593075, 1.93029, 1, 0, 0, 1, 1,
0.09368579, 0.5267951, 1.02276, 1, 0, 0, 1, 1,
0.09396712, -0.0898618, 0.1781427, 1, 0, 0, 1, 1,
0.09463447, -1.565022, 2.267706, 1, 0, 0, 1, 1,
0.09543311, -0.2615588, 2.337469, 1, 0, 0, 1, 1,
0.09750044, -0.3951501, 2.899724, 0, 0, 0, 1, 1,
0.1027093, -1.302713, 2.249619, 0, 0, 0, 1, 1,
0.1032323, 1.828779, -0.1873658, 0, 0, 0, 1, 1,
0.1080699, 1.162882, -1.089458, 0, 0, 0, 1, 1,
0.1090755, -2.019609, 2.175742, 0, 0, 0, 1, 1,
0.1116928, 0.3723507, 0.1053365, 0, 0, 0, 1, 1,
0.1119299, -0.3520511, 4.610743, 0, 0, 0, 1, 1,
0.1142465, 1.605692, 0.8429224, 1, 1, 1, 1, 1,
0.1162837, -0.5184299, 2.368877, 1, 1, 1, 1, 1,
0.1184068, 0.8847858, 0.1825257, 1, 1, 1, 1, 1,
0.1192322, 1.135832, 0.5950858, 1, 1, 1, 1, 1,
0.1219752, 0.7205988, 1.884277, 1, 1, 1, 1, 1,
0.1256043, 0.1257353, 1.028751, 1, 1, 1, 1, 1,
0.1256066, -0.1548574, 2.604496, 1, 1, 1, 1, 1,
0.1257626, 0.225191, 0.07665788, 1, 1, 1, 1, 1,
0.132933, 0.2046551, -0.5345712, 1, 1, 1, 1, 1,
0.1387452, 0.8775499, -0.3143612, 1, 1, 1, 1, 1,
0.1404817, -0.6012643, 3.932716, 1, 1, 1, 1, 1,
0.1406183, 0.7340281, 0.4279676, 1, 1, 1, 1, 1,
0.140665, 0.9406196, 1.875528, 1, 1, 1, 1, 1,
0.1407418, 2.376303, -1.151192, 1, 1, 1, 1, 1,
0.1431578, -0.784402, 2.81168, 1, 1, 1, 1, 1,
0.1435701, 0.3232947, -1.016055, 0, 0, 1, 1, 1,
0.1456003, -0.4229636, 0.8393278, 1, 0, 0, 1, 1,
0.1508603, -2.152101, 3.29587, 1, 0, 0, 1, 1,
0.1615661, 0.5941707, 1.204814, 1, 0, 0, 1, 1,
0.1617105, 1.04462, 1.293859, 1, 0, 0, 1, 1,
0.1637411, 1.142864, -0.3321487, 1, 0, 0, 1, 1,
0.1649277, 0.6322639, 0.6486812, 0, 0, 0, 1, 1,
0.1673079, -0.2822613, 1.175088, 0, 0, 0, 1, 1,
0.1688136, -0.5499573, 2.438967, 0, 0, 0, 1, 1,
0.1713815, 0.6092744, 1.411155, 0, 0, 0, 1, 1,
0.1729791, 0.9619862, -1.093117, 0, 0, 0, 1, 1,
0.1736229, -0.9720885, 3.875636, 0, 0, 0, 1, 1,
0.174889, -1.395968, 2.128584, 0, 0, 0, 1, 1,
0.1755071, 1.959133, 0.9434432, 1, 1, 1, 1, 1,
0.177998, -0.8080776, 1.581598, 1, 1, 1, 1, 1,
0.1799722, 2.15596, 0.61885, 1, 1, 1, 1, 1,
0.1807489, -0.623629, 2.368396, 1, 1, 1, 1, 1,
0.1828112, -0.2433976, 2.107865, 1, 1, 1, 1, 1,
0.1856578, -1.610783, 1.560821, 1, 1, 1, 1, 1,
0.1907766, 0.5751686, 0.0705718, 1, 1, 1, 1, 1,
0.1932366, -0.9441028, 4.230803, 1, 1, 1, 1, 1,
0.1951575, -0.9057824, 4.423616, 1, 1, 1, 1, 1,
0.1963951, 1.275833, -1.502855, 1, 1, 1, 1, 1,
0.1973294, -0.4605158, 3.097116, 1, 1, 1, 1, 1,
0.2013764, -0.08308127, 1.499347, 1, 1, 1, 1, 1,
0.201725, -0.446988, 2.53565, 1, 1, 1, 1, 1,
0.2051241, -0.1949117, 2.33421, 1, 1, 1, 1, 1,
0.2057689, 0.4842662, -0.08363947, 1, 1, 1, 1, 1,
0.2067218, 0.8738236, 0.241059, 0, 0, 1, 1, 1,
0.2138221, 0.00117715, 0.4200208, 1, 0, 0, 1, 1,
0.2143674, 0.05122733, 1.467219, 1, 0, 0, 1, 1,
0.2161513, -0.0007170531, 1.485757, 1, 0, 0, 1, 1,
0.2173906, -0.05090616, 3.822831, 1, 0, 0, 1, 1,
0.2186702, 0.811697, 2.341461, 1, 0, 0, 1, 1,
0.21896, -0.1575529, 0.4803237, 0, 0, 0, 1, 1,
0.2195982, -0.7615525, 2.403292, 0, 0, 0, 1, 1,
0.2232597, -1.200425, 1.952879, 0, 0, 0, 1, 1,
0.2233043, 1.685381, -0.5130423, 0, 0, 0, 1, 1,
0.227253, 0.459399, 0.3283859, 0, 0, 0, 1, 1,
0.2277476, -1.167226, 2.667183, 0, 0, 0, 1, 1,
0.2300877, 0.005469027, 3.052004, 0, 0, 0, 1, 1,
0.2330265, -0.9847823, 2.288558, 1, 1, 1, 1, 1,
0.2333373, 0.1054218, 1.923073, 1, 1, 1, 1, 1,
0.2360959, -0.3140941, 2.531626, 1, 1, 1, 1, 1,
0.2439007, 0.6270155, 1.274141, 1, 1, 1, 1, 1,
0.2447698, -1.616003, 3.19192, 1, 1, 1, 1, 1,
0.2455127, 0.1516374, 1.244591, 1, 1, 1, 1, 1,
0.249194, 2.500104, -0.6353728, 1, 1, 1, 1, 1,
0.250645, -0.2409649, 1.871944, 1, 1, 1, 1, 1,
0.2506982, 0.9541028, -0.6480876, 1, 1, 1, 1, 1,
0.2566325, 0.6030216, 0.7306544, 1, 1, 1, 1, 1,
0.2574824, -0.9246995, 3.580245, 1, 1, 1, 1, 1,
0.2605736, 0.8993747, -0.3272348, 1, 1, 1, 1, 1,
0.2660429, -0.337582, 3.086722, 1, 1, 1, 1, 1,
0.2662846, 0.2535516, 0.2573555, 1, 1, 1, 1, 1,
0.2701067, 1.094623, -0.3588043, 1, 1, 1, 1, 1,
0.2705026, 1.333846, 0.03452277, 0, 0, 1, 1, 1,
0.272202, 0.5357419, 0.8483045, 1, 0, 0, 1, 1,
0.2736474, 1.542312, 0.2497758, 1, 0, 0, 1, 1,
0.275003, 0.2165515, -0.4492951, 1, 0, 0, 1, 1,
0.2770175, -0.1687529, 3.326706, 1, 0, 0, 1, 1,
0.2779623, -2.70696, 4.954941, 1, 0, 0, 1, 1,
0.2782995, -0.1916689, 0.4648515, 0, 0, 0, 1, 1,
0.2787007, -1.255548, 2.934668, 0, 0, 0, 1, 1,
0.2789922, 0.747922, 0.4444093, 0, 0, 0, 1, 1,
0.2800613, -1.256336, 1.687142, 0, 0, 0, 1, 1,
0.2840433, -0.7280182, 3.652118, 0, 0, 0, 1, 1,
0.2867707, 1.879648, -0.3950759, 0, 0, 0, 1, 1,
0.291329, -1.289601, 4.935782, 0, 0, 0, 1, 1,
0.2919363, 1.657518, 0.2919501, 1, 1, 1, 1, 1,
0.2959474, -0.4665558, 1.21506, 1, 1, 1, 1, 1,
0.2980945, -0.1395355, 0.6710572, 1, 1, 1, 1, 1,
0.3023262, 0.8089257, 0.1005955, 1, 1, 1, 1, 1,
0.3051634, 1.374248, -2.036915, 1, 1, 1, 1, 1,
0.3060519, 1.15987, 1.348916, 1, 1, 1, 1, 1,
0.3080708, 1.344517, -1.285463, 1, 1, 1, 1, 1,
0.314416, 1.581907, 1.897024, 1, 1, 1, 1, 1,
0.3160925, 0.7949448, -0.7899565, 1, 1, 1, 1, 1,
0.3178083, -2.165241, 3.186311, 1, 1, 1, 1, 1,
0.3194787, -0.9756154, 3.486867, 1, 1, 1, 1, 1,
0.3201729, -1.365695, 1.991958, 1, 1, 1, 1, 1,
0.3266175, -0.6663184, 2.010232, 1, 1, 1, 1, 1,
0.3297244, -0.04566294, 1.480258, 1, 1, 1, 1, 1,
0.3323042, 0.4953355, 1.683388, 1, 1, 1, 1, 1,
0.3363079, 0.1078435, 1.076473, 0, 0, 1, 1, 1,
0.3367414, 0.04336691, 1.346029, 1, 0, 0, 1, 1,
0.3390717, 0.2488596, 2.063065, 1, 0, 0, 1, 1,
0.3413491, -0.8067767, 1.861959, 1, 0, 0, 1, 1,
0.3433452, -0.8452023, 2.696904, 1, 0, 0, 1, 1,
0.3448206, 0.678156, -0.1733372, 1, 0, 0, 1, 1,
0.3486455, -1.088144, 1.998262, 0, 0, 0, 1, 1,
0.35112, 0.2996023, 0.9476689, 0, 0, 0, 1, 1,
0.3521437, 0.4341442, 0.5529112, 0, 0, 0, 1, 1,
0.3549438, 0.5914015, 0.7954357, 0, 0, 0, 1, 1,
0.3583237, -0.9073387, 2.842747, 0, 0, 0, 1, 1,
0.3590063, 1.052222, 0.08726966, 0, 0, 0, 1, 1,
0.3599823, 0.08978825, 0.2633846, 0, 0, 0, 1, 1,
0.3632992, -1.026066, 4.59049, 1, 1, 1, 1, 1,
0.3767142, 0.383377, 0.8364341, 1, 1, 1, 1, 1,
0.3771949, 0.4628511, 0.6722853, 1, 1, 1, 1, 1,
0.3789056, 0.278042, 1.876217, 1, 1, 1, 1, 1,
0.3796568, -0.2444285, 1.248005, 1, 1, 1, 1, 1,
0.3800287, 0.3457476, 0.9606799, 1, 1, 1, 1, 1,
0.3837561, -0.666669, 3.681442, 1, 1, 1, 1, 1,
0.3849498, 0.8775586, 0.5260231, 1, 1, 1, 1, 1,
0.3856868, 0.3115842, 2.136788, 1, 1, 1, 1, 1,
0.3890272, 1.32385, -0.1216284, 1, 1, 1, 1, 1,
0.3950738, 0.7554446, 1.406719, 1, 1, 1, 1, 1,
0.3981697, 0.6103069, 2.947212, 1, 1, 1, 1, 1,
0.4037184, -0.1314387, 1.830235, 1, 1, 1, 1, 1,
0.4145611, 0.1556304, -0.774955, 1, 1, 1, 1, 1,
0.4202378, -0.9495956, 3.140939, 1, 1, 1, 1, 1,
0.4202667, 0.05502315, 1.524708, 0, 0, 1, 1, 1,
0.4204162, 1.832159, 0.7986369, 1, 0, 0, 1, 1,
0.421261, 0.1743394, 0.8072363, 1, 0, 0, 1, 1,
0.4215513, 0.3949031, 0.9944311, 1, 0, 0, 1, 1,
0.4228844, -0.0691318, 1.885521, 1, 0, 0, 1, 1,
0.4270149, 1.429023, 1.333071, 1, 0, 0, 1, 1,
0.4276729, -0.3682757, 2.20024, 0, 0, 0, 1, 1,
0.4283269, -1.108026, 5.045044, 0, 0, 0, 1, 1,
0.4283502, -0.5393552, 3.504316, 0, 0, 0, 1, 1,
0.4367578, -0.5508415, 3.24339, 0, 0, 0, 1, 1,
0.4406602, -0.219292, 1.77959, 0, 0, 0, 1, 1,
0.4413296, 0.2565531, 0.2672309, 0, 0, 0, 1, 1,
0.4470568, -0.4641823, 2.118026, 0, 0, 0, 1, 1,
0.4475286, 0.464644, 1.801863, 1, 1, 1, 1, 1,
0.4479702, -0.1366976, 1.142634, 1, 1, 1, 1, 1,
0.4489132, 0.220675, 2.150861, 1, 1, 1, 1, 1,
0.4585199, 1.118041, 0.03133602, 1, 1, 1, 1, 1,
0.4587314, -2.866033, 3.073309, 1, 1, 1, 1, 1,
0.4589212, 0.3160703, 0.3530013, 1, 1, 1, 1, 1,
0.4605927, -1.239078, 3.282046, 1, 1, 1, 1, 1,
0.4634235, -0.5526937, 3.326351, 1, 1, 1, 1, 1,
0.4635968, 0.3467163, 1.060194, 1, 1, 1, 1, 1,
0.4655196, -0.5310212, 3.34319, 1, 1, 1, 1, 1,
0.466178, -1.459205, 1.650318, 1, 1, 1, 1, 1,
0.4678555, 0.4730311, 0.9187698, 1, 1, 1, 1, 1,
0.4713284, -0.9608981, 1.818211, 1, 1, 1, 1, 1,
0.4725114, -1.524698, 3.151846, 1, 1, 1, 1, 1,
0.4751296, -1.300058, 2.386419, 1, 1, 1, 1, 1,
0.4768205, -0.5386468, 4.674818, 0, 0, 1, 1, 1,
0.4774213, -0.2563581, 1.560482, 1, 0, 0, 1, 1,
0.4801577, 0.4165233, -0.3131688, 1, 0, 0, 1, 1,
0.4810011, -1.04197, 3.965356, 1, 0, 0, 1, 1,
0.4824809, -0.7978674, 4.658163, 1, 0, 0, 1, 1,
0.4836834, -1.264446, 2.955408, 1, 0, 0, 1, 1,
0.4862548, 1.082096, 1.798383, 0, 0, 0, 1, 1,
0.4894087, -1.525267, 4.80199, 0, 0, 0, 1, 1,
0.4900819, -0.6168213, 2.88696, 0, 0, 0, 1, 1,
0.5002808, 0.3086495, 0.2205646, 0, 0, 0, 1, 1,
0.50045, 1.652518, 1.734637, 0, 0, 0, 1, 1,
0.5016484, -1.252796, 3.028178, 0, 0, 0, 1, 1,
0.5056109, -1.065925, 2.766305, 0, 0, 0, 1, 1,
0.5084776, 1.089947, -0.2824412, 1, 1, 1, 1, 1,
0.5161998, 1.131407, -1.368465, 1, 1, 1, 1, 1,
0.5177691, -0.8495706, 3.080485, 1, 1, 1, 1, 1,
0.518207, 0.4269143, 0.2519667, 1, 1, 1, 1, 1,
0.5224414, 0.7594326, 1.06554, 1, 1, 1, 1, 1,
0.5269538, -1.500041, 0.7915935, 1, 1, 1, 1, 1,
0.5326094, -1.161767, 3.511409, 1, 1, 1, 1, 1,
0.5326965, -0.6683744, 1.554301, 1, 1, 1, 1, 1,
0.5329419, 0.9720279, -1.092339, 1, 1, 1, 1, 1,
0.534219, -0.2117339, 0.9262055, 1, 1, 1, 1, 1,
0.5352051, 1.244408, 1.569883, 1, 1, 1, 1, 1,
0.5370945, 0.2047201, 1.799457, 1, 1, 1, 1, 1,
0.5389883, -0.5223318, 1.758615, 1, 1, 1, 1, 1,
0.5417802, 0.1163952, 1.955782, 1, 1, 1, 1, 1,
0.5433525, -1.379313, 2.812315, 1, 1, 1, 1, 1,
0.5437399, -0.2886834, 1.419051, 0, 0, 1, 1, 1,
0.5442961, -1.427951, 0.8442174, 1, 0, 0, 1, 1,
0.55452, 1.184079, -0.2323855, 1, 0, 0, 1, 1,
0.5684953, 0.2168842, 1.044676, 1, 0, 0, 1, 1,
0.5700625, -1.28872, 2.542417, 1, 0, 0, 1, 1,
0.5828134, 0.9458804, 0.1985137, 1, 0, 0, 1, 1,
0.5857663, 0.1556839, 1.451097, 0, 0, 0, 1, 1,
0.5897167, 1.249612, 0.4861978, 0, 0, 0, 1, 1,
0.5953113, 0.07891468, 1.814414, 0, 0, 0, 1, 1,
0.5983238, 1.986703, 0.3435452, 0, 0, 0, 1, 1,
0.6132709, 0.5487749, -0.1411532, 0, 0, 0, 1, 1,
0.6142451, 0.8437857, -0.02406744, 0, 0, 0, 1, 1,
0.6156988, -0.793213, 1.760704, 0, 0, 0, 1, 1,
0.6195099, 0.1472871, -0.2833138, 1, 1, 1, 1, 1,
0.6243378, -0.07222756, 2.958333, 1, 1, 1, 1, 1,
0.6245842, -0.2149784, 0.8236713, 1, 1, 1, 1, 1,
0.6259676, -0.2697571, 1.128967, 1, 1, 1, 1, 1,
0.6295849, 0.6882783, -0.2414461, 1, 1, 1, 1, 1,
0.6358576, 1.406597, -0.4838338, 1, 1, 1, 1, 1,
0.6378343, 0.6832521, -0.7740982, 1, 1, 1, 1, 1,
0.6394082, -0.704872, 2.061208, 1, 1, 1, 1, 1,
0.6414029, 1.030789, 1.778174, 1, 1, 1, 1, 1,
0.6430088, 0.3903967, 1.952022, 1, 1, 1, 1, 1,
0.6433958, 1.379325, 0.8340481, 1, 1, 1, 1, 1,
0.6496993, 1.938673, 0.5415835, 1, 1, 1, 1, 1,
0.6527288, -0.995905, 1.184378, 1, 1, 1, 1, 1,
0.6540729, 1.188784, -0.6634539, 1, 1, 1, 1, 1,
0.6544336, 1.009599, 0.8682917, 1, 1, 1, 1, 1,
0.6550858, -0.969301, 3.016215, 0, 0, 1, 1, 1,
0.6577883, 0.04077046, 2.980208, 1, 0, 0, 1, 1,
0.6585607, -0.07205756, -0.4661429, 1, 0, 0, 1, 1,
0.661948, 2.329158, -0.1943244, 1, 0, 0, 1, 1,
0.6657388, 1.133518, 0.1524329, 1, 0, 0, 1, 1,
0.6677452, -0.9943818, 0.660886, 1, 0, 0, 1, 1,
0.6682712, 0.3060683, 0.02022052, 0, 0, 0, 1, 1,
0.6687248, 0.121373, 0.3653571, 0, 0, 0, 1, 1,
0.6697873, -0.889428, 2.971112, 0, 0, 0, 1, 1,
0.6702359, -0.7802045, 0.8537899, 0, 0, 0, 1, 1,
0.6740857, -0.5905812, 2.181368, 0, 0, 0, 1, 1,
0.6923361, 0.3024127, 1.021178, 0, 0, 0, 1, 1,
0.6932961, -0.26605, 2.003252, 0, 0, 0, 1, 1,
0.7028267, -0.4013128, 1.282306, 1, 1, 1, 1, 1,
0.708482, 0.02969561, -0.2549288, 1, 1, 1, 1, 1,
0.7139329, -1.371896, 2.936895, 1, 1, 1, 1, 1,
0.7181254, 0.1201994, 1.673719, 1, 1, 1, 1, 1,
0.7210011, 1.033318, -0.9765788, 1, 1, 1, 1, 1,
0.7224073, -1.353902, 1.533067, 1, 1, 1, 1, 1,
0.7229483, -1.84959, 3.286138, 1, 1, 1, 1, 1,
0.7281178, 0.3214249, 1.380293, 1, 1, 1, 1, 1,
0.7292991, 0.2169821, 2.381738, 1, 1, 1, 1, 1,
0.7317823, 0.8114629, 0.9228823, 1, 1, 1, 1, 1,
0.7396032, -0.8370441, 1.650798, 1, 1, 1, 1, 1,
0.7400693, -0.5122181, 1.359923, 1, 1, 1, 1, 1,
0.7427853, -1.601106, 2.943675, 1, 1, 1, 1, 1,
0.7478297, 0.8687193, 0.1283657, 1, 1, 1, 1, 1,
0.7650466, -1.432718, 2.54962, 1, 1, 1, 1, 1,
0.7679696, -1.289303, 3.068634, 0, 0, 1, 1, 1,
0.7681609, 1.1383, 0.1517074, 1, 0, 0, 1, 1,
0.7708139, -0.3447516, 1.996833, 1, 0, 0, 1, 1,
0.7713079, 1.410283, -0.08073133, 1, 0, 0, 1, 1,
0.7726854, -1.164258, 2.61859, 1, 0, 0, 1, 1,
0.7763835, 0.6999837, 0.8060669, 1, 0, 0, 1, 1,
0.7785869, -0.3563395, 1.022174, 0, 0, 0, 1, 1,
0.7832699, 0.1138377, 0.8237407, 0, 0, 0, 1, 1,
0.7842633, 0.9488637, 0.1469485, 0, 0, 0, 1, 1,
0.7904018, 0.1103184, 1.929836, 0, 0, 0, 1, 1,
0.7912103, -0.4403226, 3.675936, 0, 0, 0, 1, 1,
0.8037089, -0.8369969, 1.900681, 0, 0, 0, 1, 1,
0.8042222, -1.775941, 2.612813, 0, 0, 0, 1, 1,
0.804848, 1.837834, 0.1802486, 1, 1, 1, 1, 1,
0.8214024, 0.8993613, 0.8305256, 1, 1, 1, 1, 1,
0.8228829, 0.3146498, 0.9742863, 1, 1, 1, 1, 1,
0.828966, -0.4029873, 1.428042, 1, 1, 1, 1, 1,
0.8348325, -0.3177082, 1.786986, 1, 1, 1, 1, 1,
0.8356587, 1.477077, -0.8451002, 1, 1, 1, 1, 1,
0.8415389, 0.2909479, 1.112829, 1, 1, 1, 1, 1,
0.8501649, -1.597551, 2.175443, 1, 1, 1, 1, 1,
0.8508875, 0.5030144, 1.062548, 1, 1, 1, 1, 1,
0.8517247, 0.2121561, 1.585021, 1, 1, 1, 1, 1,
0.8539692, 0.5559791, 1.087697, 1, 1, 1, 1, 1,
0.8598834, -1.252578, 3.185775, 1, 1, 1, 1, 1,
0.8602293, 0.4201248, 1.270301, 1, 1, 1, 1, 1,
0.8606772, -0.7717195, 2.825722, 1, 1, 1, 1, 1,
0.8622689, 0.1147259, 1.9309, 1, 1, 1, 1, 1,
0.8816215, 1.017993, 0.7908567, 0, 0, 1, 1, 1,
0.8840351, -0.7504407, 0.6891579, 1, 0, 0, 1, 1,
0.8854992, -1.18179, 2.442892, 1, 0, 0, 1, 1,
0.8958781, -1.598251, 1.055503, 1, 0, 0, 1, 1,
0.8995379, -0.007823279, 1.022212, 1, 0, 0, 1, 1,
0.9000199, -1.068103, 3.845833, 1, 0, 0, 1, 1,
0.9009048, 1.102051, -0.104717, 0, 0, 0, 1, 1,
0.9018085, 1.309192, 0.8624223, 0, 0, 0, 1, 1,
0.9054003, -0.5043893, 1.854088, 0, 0, 0, 1, 1,
0.9135954, -0.4372991, 2.362607, 0, 0, 0, 1, 1,
0.9225952, -1.108563, 4.292158, 0, 0, 0, 1, 1,
0.9266043, 1.09621, 2.654963, 0, 0, 0, 1, 1,
0.9267113, 0.2736305, 1.010319, 0, 0, 0, 1, 1,
0.9267586, 1.627107, 2.764152, 1, 1, 1, 1, 1,
0.9285958, 0.7948399, 2.198834, 1, 1, 1, 1, 1,
0.938878, -0.4918489, 1.112725, 1, 1, 1, 1, 1,
0.9413466, 0.4892673, 0.8972549, 1, 1, 1, 1, 1,
0.9413912, -0.7211023, 4.13752, 1, 1, 1, 1, 1,
0.9609957, 0.4206378, 3.699489, 1, 1, 1, 1, 1,
0.9611625, 1.367339, 0.9097373, 1, 1, 1, 1, 1,
0.9629731, -0.5221243, 1.271581, 1, 1, 1, 1, 1,
0.9639893, 0.06426943, 2.783567, 1, 1, 1, 1, 1,
0.9699838, 0.1822707, -0.7977459, 1, 1, 1, 1, 1,
0.9721673, 0.5052207, 0.4061566, 1, 1, 1, 1, 1,
0.9770603, -0.1490745, 3.087934, 1, 1, 1, 1, 1,
0.9790729, -0.1653246, 2.720077, 1, 1, 1, 1, 1,
0.9792728, -0.1505805, 1.567193, 1, 1, 1, 1, 1,
0.9820663, -1.39071, 1.824711, 1, 1, 1, 1, 1,
0.9853003, 0.2819713, 0.7108647, 0, 0, 1, 1, 1,
0.9883253, 0.6212012, -1.35713, 1, 0, 0, 1, 1,
0.9936698, 1.439554, -0.07456733, 1, 0, 0, 1, 1,
0.9938893, -0.1120543, 1.553913, 1, 0, 0, 1, 1,
0.9964846, 0.9978054, 0.9997857, 1, 0, 0, 1, 1,
0.9965818, 0.1806616, 1.229212, 1, 0, 0, 1, 1,
0.9994277, 0.05336007, 0.4421776, 0, 0, 0, 1, 1,
1.000282, 0.9677681, -0.240681, 0, 0, 0, 1, 1,
1.00144, -0.7703477, 2.199672, 0, 0, 0, 1, 1,
1.004932, -0.00769028, 0.2728257, 0, 0, 0, 1, 1,
1.022911, -0.2438565, 0.1452335, 0, 0, 0, 1, 1,
1.025097, -1.417268, 1.162386, 0, 0, 0, 1, 1,
1.02666, 0.5432479, -0.3657753, 0, 0, 0, 1, 1,
1.049859, 0.6297273, 1.413462, 1, 1, 1, 1, 1,
1.049871, 2.050633, -0.5606081, 1, 1, 1, 1, 1,
1.064791, 0.4104187, 0.1384396, 1, 1, 1, 1, 1,
1.068507, 0.3422854, 1.671495, 1, 1, 1, 1, 1,
1.07403, 0.2515129, -0.7344349, 1, 1, 1, 1, 1,
1.075696, -0.5058379, 0.1183392, 1, 1, 1, 1, 1,
1.077795, -0.3828792, 1.605461, 1, 1, 1, 1, 1,
1.079447, -0.3534065, 1.447767, 1, 1, 1, 1, 1,
1.079729, 0.4201521, 0.616133, 1, 1, 1, 1, 1,
1.08148, -0.4263712, 1.743562, 1, 1, 1, 1, 1,
1.085871, 0.7949494, 2.659636, 1, 1, 1, 1, 1,
1.092131, -0.5687063, 0.7856819, 1, 1, 1, 1, 1,
1.106766, 0.8071393, 0.3457543, 1, 1, 1, 1, 1,
1.107674, -2.206846, 1.152894, 1, 1, 1, 1, 1,
1.108268, 0.06641657, 2.233464, 1, 1, 1, 1, 1,
1.108676, 0.7461193, -0.4177579, 0, 0, 1, 1, 1,
1.111835, -0.02955194, 1.118559, 1, 0, 0, 1, 1,
1.114289, -0.181, 1.835254, 1, 0, 0, 1, 1,
1.120715, 0.2202332, 2.744575, 1, 0, 0, 1, 1,
1.122534, -0.1635645, 1.252187, 1, 0, 0, 1, 1,
1.122815, 1.465269, -1.052664, 1, 0, 0, 1, 1,
1.125169, 0.3057198, 2.257654, 0, 0, 0, 1, 1,
1.13071, -2.530958, 3.035396, 0, 0, 0, 1, 1,
1.132766, -0.459833, 2.246667, 0, 0, 0, 1, 1,
1.132969, -0.5922474, 2.379596, 0, 0, 0, 1, 1,
1.139496, 0.5760518, 0.3600803, 0, 0, 0, 1, 1,
1.1402, -0.3362552, 1.726798, 0, 0, 0, 1, 1,
1.140388, 0.4606129, 1.427053, 0, 0, 0, 1, 1,
1.155712, -0.7798368, 0.6601643, 1, 1, 1, 1, 1,
1.155743, 0.9099369, -0.1647541, 1, 1, 1, 1, 1,
1.156074, 0.1795506, 3.992088, 1, 1, 1, 1, 1,
1.156476, -0.2768259, 2.842447, 1, 1, 1, 1, 1,
1.161735, -1.805141, 2.004728, 1, 1, 1, 1, 1,
1.17616, 0.6723641, -0.4508215, 1, 1, 1, 1, 1,
1.177435, 0.07374015, 0.635438, 1, 1, 1, 1, 1,
1.177868, 1.215234, 0.5958921, 1, 1, 1, 1, 1,
1.179913, -0.006926556, 1.821932, 1, 1, 1, 1, 1,
1.186679, -0.2380385, 0.5192199, 1, 1, 1, 1, 1,
1.203069, 0.7697807, -0.1520221, 1, 1, 1, 1, 1,
1.211989, -1.06642, 2.839879, 1, 1, 1, 1, 1,
1.233496, -0.2857834, 0.07684188, 1, 1, 1, 1, 1,
1.238198, 1.81743, 0.2640814, 1, 1, 1, 1, 1,
1.242285, 0.5164015, 0.9521191, 1, 1, 1, 1, 1,
1.250084, -0.3842928, 2.211027, 0, 0, 1, 1, 1,
1.253901, -0.4111889, -1.191072, 1, 0, 0, 1, 1,
1.25724, -0.02868297, 2.860486, 1, 0, 0, 1, 1,
1.259821, -0.8785865, 2.258175, 1, 0, 0, 1, 1,
1.262871, -0.6224794, 2.519789, 1, 0, 0, 1, 1,
1.264611, 0.3673557, 1.784551, 1, 0, 0, 1, 1,
1.265949, -0.5707433, 0.9874988, 0, 0, 0, 1, 1,
1.269608, -0.03384376, 1.742652, 0, 0, 0, 1, 1,
1.270236, -2.300485, 1.089621, 0, 0, 0, 1, 1,
1.273083, 0.4202435, 3.2707, 0, 0, 0, 1, 1,
1.274393, 0.4356615, 0.434301, 0, 0, 0, 1, 1,
1.285088, 1.507778, 0.7928829, 0, 0, 0, 1, 1,
1.286268, 0.3594813, 1.553917, 0, 0, 0, 1, 1,
1.290084, 0.6295707, 0.3046176, 1, 1, 1, 1, 1,
1.292509, -0.5746049, 1.351685, 1, 1, 1, 1, 1,
1.302691, -0.7217351, 3.361154, 1, 1, 1, 1, 1,
1.325363, -1.944296, 3.882473, 1, 1, 1, 1, 1,
1.336601, 0.312333, 0.05220144, 1, 1, 1, 1, 1,
1.338039, 2.416901, -0.4865239, 1, 1, 1, 1, 1,
1.346587, 1.321146, -1.147747, 1, 1, 1, 1, 1,
1.352206, -0.6262286, 0.5751123, 1, 1, 1, 1, 1,
1.376997, 0.6853102, 2.174266, 1, 1, 1, 1, 1,
1.381669, 0.1960389, 2.845709, 1, 1, 1, 1, 1,
1.386217, -0.2161832, 1.915588, 1, 1, 1, 1, 1,
1.391795, 1.159086, 1.172639, 1, 1, 1, 1, 1,
1.395561, -0.8607919, 0.1901319, 1, 1, 1, 1, 1,
1.400756, -0.1750687, 3.50924, 1, 1, 1, 1, 1,
1.423599, 1.591888, 2.73043, 1, 1, 1, 1, 1,
1.429859, -0.265737, 2.24852, 0, 0, 1, 1, 1,
1.434599, -0.1338473, 1.759768, 1, 0, 0, 1, 1,
1.443838, 0.2004, 2.229869, 1, 0, 0, 1, 1,
1.463282, 0.1516081, 2.98629, 1, 0, 0, 1, 1,
1.46711, 0.6037493, 0.2961642, 1, 0, 0, 1, 1,
1.485267, -0.8143106, 1.81282, 1, 0, 0, 1, 1,
1.492966, -0.1552934, 1.19385, 0, 0, 0, 1, 1,
1.510465, -1.169129, 1.482888, 0, 0, 0, 1, 1,
1.514554, 0.4643808, 1.420448, 0, 0, 0, 1, 1,
1.5346, 1.024754, 1.383349, 0, 0, 0, 1, 1,
1.534982, -0.2012636, 2.04267, 0, 0, 0, 1, 1,
1.552955, 0.6055703, 0.1889891, 0, 0, 0, 1, 1,
1.580946, 0.5972829, 3.306229, 0, 0, 0, 1, 1,
1.581549, 0.2307929, 1.254209, 1, 1, 1, 1, 1,
1.590477, -1.358098, 1.150638, 1, 1, 1, 1, 1,
1.593702, 1.019092, 0.7599509, 1, 1, 1, 1, 1,
1.594324, 0.7065955, 1.978085, 1, 1, 1, 1, 1,
1.602662, 0.5446441, 2.6469, 1, 1, 1, 1, 1,
1.617889, 0.05120557, 1.191805, 1, 1, 1, 1, 1,
1.618268, 0.9352453, 1.275798, 1, 1, 1, 1, 1,
1.637753, -0.1360886, -0.124836, 1, 1, 1, 1, 1,
1.639938, -1.095461, -0.4315411, 1, 1, 1, 1, 1,
1.646026, -0.5190699, 1.487438, 1, 1, 1, 1, 1,
1.648811, -1.411892, 4.474534, 1, 1, 1, 1, 1,
1.653134, 0.2896848, 0.8342427, 1, 1, 1, 1, 1,
1.653315, -1.773456, 2.831934, 1, 1, 1, 1, 1,
1.661341, 1.728258, -1.563948, 1, 1, 1, 1, 1,
1.663492, -0.3198152, 1.160984, 1, 1, 1, 1, 1,
1.673665, 1.007096, 1.237179, 0, 0, 1, 1, 1,
1.707573, 1.142392, 1.31567, 1, 0, 0, 1, 1,
1.750176, 0.2491809, 1.930449, 1, 0, 0, 1, 1,
1.758446, -0.5313975, 3.199539, 1, 0, 0, 1, 1,
1.791159, 0.4445246, 2.202447, 1, 0, 0, 1, 1,
1.79809, 0.04247803, 1.652014, 1, 0, 0, 1, 1,
1.811966, -0.8986267, 1.462324, 0, 0, 0, 1, 1,
1.828486, -0.169827, 3.397404, 0, 0, 0, 1, 1,
1.841522, -1.332764, 1.204256, 0, 0, 0, 1, 1,
1.846766, 1.11034, -0.8335813, 0, 0, 0, 1, 1,
1.851153, 0.4345014, 0.3329117, 0, 0, 0, 1, 1,
1.863764, 0.5408084, 2.103552, 0, 0, 0, 1, 1,
1.890511, -0.4419155, 2.864266, 0, 0, 0, 1, 1,
1.899614, -0.6741019, 1.606797, 1, 1, 1, 1, 1,
1.920638, 0.359553, 1.335251, 1, 1, 1, 1, 1,
1.923728, -0.1691553, 3.098291, 1, 1, 1, 1, 1,
1.944943, -0.05403789, 3.14307, 1, 1, 1, 1, 1,
1.963623, 1.025334, 2.163532, 1, 1, 1, 1, 1,
1.968122, 1.836888, 0.4398994, 1, 1, 1, 1, 1,
1.970897, -0.3555237, 2.495529, 1, 1, 1, 1, 1,
1.981987, -1.012789, 2.93667, 1, 1, 1, 1, 1,
1.985431, 0.1865985, 1.337283, 1, 1, 1, 1, 1,
2.010943, -1.370428, 1.146453, 1, 1, 1, 1, 1,
2.014221, -0.4360659, 1.130695, 1, 1, 1, 1, 1,
2.044131, -0.2656168, 2.655525, 1, 1, 1, 1, 1,
2.10631, -0.9220538, 2.114173, 1, 1, 1, 1, 1,
2.111692, 0.1032031, 0.4530597, 1, 1, 1, 1, 1,
2.134609, 1.170064, 1.598404, 1, 1, 1, 1, 1,
2.175992, 0.3983629, -0.3136604, 0, 0, 1, 1, 1,
2.185535, 0.1588474, -0.5461611, 1, 0, 0, 1, 1,
2.210066, -1.081674, 0.2624872, 1, 0, 0, 1, 1,
2.226071, -0.5836515, 1.756295, 1, 0, 0, 1, 1,
2.226778, 1.378955, 2.134747, 1, 0, 0, 1, 1,
2.228029, -0.7931374, 1.600552, 1, 0, 0, 1, 1,
2.241932, -0.2923465, 1.608572, 0, 0, 0, 1, 1,
2.294139, -0.9057441, 2.932681, 0, 0, 0, 1, 1,
2.311118, -0.5799521, 1.942147, 0, 0, 0, 1, 1,
2.316893, -1.524659, 1.146231, 0, 0, 0, 1, 1,
2.321666, 3.575432, 0.6477364, 0, 0, 0, 1, 1,
2.335299, -0.9640646, 2.952079, 0, 0, 0, 1, 1,
2.52918, -0.05671703, 1.598884, 0, 0, 0, 1, 1,
2.552185, 0.9955395, 0.7129274, 1, 1, 1, 1, 1,
2.567946, -0.03082891, 0.4875569, 1, 1, 1, 1, 1,
2.663244, -2.241024, 1.408771, 1, 1, 1, 1, 1,
2.735074, -1.059461, 2.063012, 1, 1, 1, 1, 1,
2.885627, 0.3612468, 3.05477, 1, 1, 1, 1, 1,
2.891026, -1.20561, 1.345279, 1, 1, 1, 1, 1,
3.705856, 0.6825322, 1.589902, 1, 1, 1, 1, 1
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
var radius = 9.41803;
var distance = 33.08043;
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
mvMatrix.translate( -0.4011194, -0.3546997, 0.03441668 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.08043);
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
