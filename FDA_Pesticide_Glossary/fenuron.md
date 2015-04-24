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
-3.089307, -0.2961983, -2.516775, 1, 0, 0, 1,
-2.849761, 0.09879361, -2.720392, 1, 0.007843138, 0, 1,
-2.643638, 0.1081083, -0.9234617, 1, 0.01176471, 0, 1,
-2.504112, 1.45462, 0.3443528, 1, 0.01960784, 0, 1,
-2.446149, -0.6286125, -1.201525, 1, 0.02352941, 0, 1,
-2.437191, 0.5430498, 0.03011915, 1, 0.03137255, 0, 1,
-2.414746, -0.1882802, -1.916764, 1, 0.03529412, 0, 1,
-2.274168, 1.891781, 0.5495816, 1, 0.04313726, 0, 1,
-2.270969, -0.6668038, -2.089394, 1, 0.04705882, 0, 1,
-2.256182, 2.160829, -1.242068, 1, 0.05490196, 0, 1,
-2.240559, 0.6034105, -2.535857, 1, 0.05882353, 0, 1,
-2.238054, -1.065446, -2.439775, 1, 0.06666667, 0, 1,
-2.2261, -0.465465, -0.05480765, 1, 0.07058824, 0, 1,
-2.165128, 0.8635272, -1.895512, 1, 0.07843138, 0, 1,
-2.164763, 1.463575, -1.808552, 1, 0.08235294, 0, 1,
-2.137124, -2.715249, -1.468022, 1, 0.09019608, 0, 1,
-2.086425, 1.176319, -0.8650976, 1, 0.09411765, 0, 1,
-2.08372, -1.504068, -1.170384, 1, 0.1019608, 0, 1,
-2.037496, 0.8172316, 1.340873, 1, 0.1098039, 0, 1,
-2.000966, 0.9938796, 1.103021, 1, 0.1137255, 0, 1,
-1.935243, 0.6223781, -0.0218814, 1, 0.1215686, 0, 1,
-1.924947, 0.5150855, -1.449206, 1, 0.1254902, 0, 1,
-1.879139, -0.02225695, -3.435385, 1, 0.1333333, 0, 1,
-1.876894, -0.5945729, -2.632187, 1, 0.1372549, 0, 1,
-1.870304, 0.7750688, -1.521479, 1, 0.145098, 0, 1,
-1.860099, -1.114621, -2.122409, 1, 0.1490196, 0, 1,
-1.848894, 0.04803411, -2.759908, 1, 0.1568628, 0, 1,
-1.848671, 0.218841, -1.455798, 1, 0.1607843, 0, 1,
-1.826734, 0.6752433, 0.7193477, 1, 0.1686275, 0, 1,
-1.815116, -0.2763133, -2.743116, 1, 0.172549, 0, 1,
-1.812334, -0.4256081, -0.8480285, 1, 0.1803922, 0, 1,
-1.811571, -0.4863645, -0.1254887, 1, 0.1843137, 0, 1,
-1.788858, -0.07480014, -1.690964, 1, 0.1921569, 0, 1,
-1.776208, 0.3403727, 0.4824218, 1, 0.1960784, 0, 1,
-1.765042, 1.040842, -0.9380485, 1, 0.2039216, 0, 1,
-1.762725, -0.08881849, -2.132859, 1, 0.2117647, 0, 1,
-1.726279, -0.6197203, -2.730773, 1, 0.2156863, 0, 1,
-1.717959, -0.3167019, -1.559417, 1, 0.2235294, 0, 1,
-1.701737, -0.3475496, -2.757457, 1, 0.227451, 0, 1,
-1.677082, -1.03506, 0.00791931, 1, 0.2352941, 0, 1,
-1.66957, 1.825332, -1.498435, 1, 0.2392157, 0, 1,
-1.669493, 0.145731, -2.997109, 1, 0.2470588, 0, 1,
-1.664129, 0.03793501, -1.852021, 1, 0.2509804, 0, 1,
-1.648919, -0.9875354, -3.105214, 1, 0.2588235, 0, 1,
-1.647007, -0.2793397, -2.262492, 1, 0.2627451, 0, 1,
-1.646745, 0.1274277, -1.157347, 1, 0.2705882, 0, 1,
-1.642101, -0.3018816, -0.2323365, 1, 0.2745098, 0, 1,
-1.626361, -0.07418182, -0.637446, 1, 0.282353, 0, 1,
-1.626125, 0.1770456, -4.556649, 1, 0.2862745, 0, 1,
-1.62359, 0.3844211, -0.4007016, 1, 0.2941177, 0, 1,
-1.618217, 0.6008691, -0.6217363, 1, 0.3019608, 0, 1,
-1.604837, -0.5134843, -0.4501263, 1, 0.3058824, 0, 1,
-1.592912, -1.067913, -2.319369, 1, 0.3137255, 0, 1,
-1.588302, 0.7715425, -2.163303, 1, 0.3176471, 0, 1,
-1.584969, 0.9849754, -1.482495, 1, 0.3254902, 0, 1,
-1.582322, 1.082594, -1.151825, 1, 0.3294118, 0, 1,
-1.581226, -0.1024637, -0.2208997, 1, 0.3372549, 0, 1,
-1.565981, -0.8198103, -2.145479, 1, 0.3411765, 0, 1,
-1.561885, 0.4392447, -1.109098, 1, 0.3490196, 0, 1,
-1.552767, -0.6509396, -0.5729508, 1, 0.3529412, 0, 1,
-1.547032, -1.05645, -1.2323, 1, 0.3607843, 0, 1,
-1.543437, -0.6039088, -0.7298758, 1, 0.3647059, 0, 1,
-1.541808, -0.4146687, -1.861417, 1, 0.372549, 0, 1,
-1.526895, -0.8257791, -3.607722, 1, 0.3764706, 0, 1,
-1.503888, -1.28257, -1.701626, 1, 0.3843137, 0, 1,
-1.502905, 1.059934, -2.037048, 1, 0.3882353, 0, 1,
-1.500378, -0.8414559, -3.276657, 1, 0.3960784, 0, 1,
-1.498167, 0.404028, -1.754425, 1, 0.4039216, 0, 1,
-1.494755, 0.2268712, -0.4317092, 1, 0.4078431, 0, 1,
-1.489611, 1.287756, 0.5171618, 1, 0.4156863, 0, 1,
-1.481915, -1.057157, -2.941651, 1, 0.4196078, 0, 1,
-1.480326, -0.7458674, -1.121658, 1, 0.427451, 0, 1,
-1.47881, 0.4693699, -1.397547, 1, 0.4313726, 0, 1,
-1.471496, -0.8627474, -2.785954, 1, 0.4392157, 0, 1,
-1.461004, 0.9194418, -1.681329, 1, 0.4431373, 0, 1,
-1.451823, -0.1576535, -1.536496, 1, 0.4509804, 0, 1,
-1.443505, 0.4837039, -1.650857, 1, 0.454902, 0, 1,
-1.440984, -0.8170674, -1.845169, 1, 0.4627451, 0, 1,
-1.432441, -0.6732683, -2.756872, 1, 0.4666667, 0, 1,
-1.407958, -1.538526, -1.09527, 1, 0.4745098, 0, 1,
-1.402977, 1.950333, -0.1541457, 1, 0.4784314, 0, 1,
-1.400504, -0.3243906, -3.230049, 1, 0.4862745, 0, 1,
-1.398763, -1.800316, -0.986487, 1, 0.4901961, 0, 1,
-1.39076, 1.197433, -0.3924011, 1, 0.4980392, 0, 1,
-1.376304, 1.333982, 1.463376, 1, 0.5058824, 0, 1,
-1.368104, -1.855774, -2.025636, 1, 0.509804, 0, 1,
-1.35675, 1.08996, -0.8251426, 1, 0.5176471, 0, 1,
-1.350429, -0.4115426, -1.968331, 1, 0.5215687, 0, 1,
-1.339728, -0.06896719, -3.336868, 1, 0.5294118, 0, 1,
-1.335966, -0.1673955, -1.684011, 1, 0.5333334, 0, 1,
-1.335224, 0.7835255, -1.261462, 1, 0.5411765, 0, 1,
-1.330031, -1.522165, -3.789311, 1, 0.5450981, 0, 1,
-1.319384, -0.1053772, -2.274804, 1, 0.5529412, 0, 1,
-1.316752, 0.3117684, -0.2034208, 1, 0.5568628, 0, 1,
-1.300002, 0.9171221, 1.746732, 1, 0.5647059, 0, 1,
-1.298987, 0.1582456, -1.145387, 1, 0.5686275, 0, 1,
-1.296142, 0.5800461, -2.246277, 1, 0.5764706, 0, 1,
-1.290082, 0.725116, 0.6085737, 1, 0.5803922, 0, 1,
-1.282397, -0.797673, -2.376448, 1, 0.5882353, 0, 1,
-1.276275, -1.989691, -2.886374, 1, 0.5921569, 0, 1,
-1.272115, 0.3650207, -0.8521934, 1, 0.6, 0, 1,
-1.269709, -0.06487969, -2.184159, 1, 0.6078432, 0, 1,
-1.263347, -0.7187671, -2.634484, 1, 0.6117647, 0, 1,
-1.260288, 1.040727, -0.4947229, 1, 0.6196079, 0, 1,
-1.25894, -0.6397594, -3.849383, 1, 0.6235294, 0, 1,
-1.258428, 0.7768399, -3.770236, 1, 0.6313726, 0, 1,
-1.255213, 2.126877, 0.9404128, 1, 0.6352941, 0, 1,
-1.253303, 0.7372803, -0.4189112, 1, 0.6431373, 0, 1,
-1.224102, -0.6206177, -1.486719, 1, 0.6470588, 0, 1,
-1.22186, -2.386508, -2.945646, 1, 0.654902, 0, 1,
-1.21111, -0.4024661, -3.120393, 1, 0.6588235, 0, 1,
-1.201385, 3.569327, 0.5748137, 1, 0.6666667, 0, 1,
-1.195758, -2.279849, -2.096765, 1, 0.6705883, 0, 1,
-1.183897, 1.678784, -1.312532, 1, 0.6784314, 0, 1,
-1.182734, -0.7439971, -1.496133, 1, 0.682353, 0, 1,
-1.174635, 0.7149572, -0.6478379, 1, 0.6901961, 0, 1,
-1.169756, 1.340078, -0.02072689, 1, 0.6941177, 0, 1,
-1.164769, -0.6417994, -4.198495, 1, 0.7019608, 0, 1,
-1.16159, -0.3186672, -2.093286, 1, 0.7098039, 0, 1,
-1.160511, 0.08486255, -2.872746, 1, 0.7137255, 0, 1,
-1.159743, 0.3878711, -1.377662, 1, 0.7215686, 0, 1,
-1.158279, 0.07559331, -1.41794, 1, 0.7254902, 0, 1,
-1.155607, 0.5023873, -1.107305, 1, 0.7333333, 0, 1,
-1.154496, -0.8052474, -1.985141, 1, 0.7372549, 0, 1,
-1.148491, 0.07444403, -0.893172, 1, 0.7450981, 0, 1,
-1.143625, -0.7368631, -2.688144, 1, 0.7490196, 0, 1,
-1.142799, -1.009801, -1.925235, 1, 0.7568628, 0, 1,
-1.137564, -0.3002022, -0.6889929, 1, 0.7607843, 0, 1,
-1.126916, -0.5135114, -2.83291, 1, 0.7686275, 0, 1,
-1.126807, 1.294885, -1.032635, 1, 0.772549, 0, 1,
-1.1036, 2.020363, -0.1796271, 1, 0.7803922, 0, 1,
-1.094458, -0.6982657, -3.04604, 1, 0.7843137, 0, 1,
-1.093071, 0.5681173, -1.952298, 1, 0.7921569, 0, 1,
-1.075869, -0.9551991, -2.34312, 1, 0.7960784, 0, 1,
-1.07182, 0.9970929, -1.841591, 1, 0.8039216, 0, 1,
-1.061677, 0.1327184, -2.704967, 1, 0.8117647, 0, 1,
-1.056576, -0.110363, -1.046024, 1, 0.8156863, 0, 1,
-1.047107, 0.07434193, -1.268354, 1, 0.8235294, 0, 1,
-1.046631, -0.3717378, -2.062325, 1, 0.827451, 0, 1,
-1.046305, -0.3433161, -2.987625, 1, 0.8352941, 0, 1,
-1.044065, 0.3961547, -1.757516, 1, 0.8392157, 0, 1,
-1.043649, 1.073335, -0.2835524, 1, 0.8470588, 0, 1,
-1.043112, -1.372836, -2.418015, 1, 0.8509804, 0, 1,
-1.042783, -0.6183708, -2.38735, 1, 0.8588235, 0, 1,
-1.037916, -1.400799, -2.779658, 1, 0.8627451, 0, 1,
-1.022985, -1.009288, -1.713699, 1, 0.8705882, 0, 1,
-1.008257, -0.4286058, 0.1919589, 1, 0.8745098, 0, 1,
-0.9836291, -1.283787, -4.448345, 1, 0.8823529, 0, 1,
-0.9803739, 1.649383, 0.3466972, 1, 0.8862745, 0, 1,
-0.9735204, 1.310783, -0.5286116, 1, 0.8941177, 0, 1,
-0.968641, 1.290621, -0.9174073, 1, 0.8980392, 0, 1,
-0.9685045, 2.035421, -1.001993, 1, 0.9058824, 0, 1,
-0.9668318, 0.196601, -0.15803, 1, 0.9137255, 0, 1,
-0.9662766, -1.028723, -3.090126, 1, 0.9176471, 0, 1,
-0.9629165, 0.2377574, -1.065087, 1, 0.9254902, 0, 1,
-0.9467044, -0.3551567, -3.039961, 1, 0.9294118, 0, 1,
-0.9416127, -0.3864745, -2.016242, 1, 0.9372549, 0, 1,
-0.9412602, 0.9342712, -0.5031571, 1, 0.9411765, 0, 1,
-0.9315288, 0.8036235, 0.03087696, 1, 0.9490196, 0, 1,
-0.9296958, 0.1894251, -1.622267, 1, 0.9529412, 0, 1,
-0.9261374, 0.8529086, -0.3913824, 1, 0.9607843, 0, 1,
-0.9233205, 1.082006, -0.5521351, 1, 0.9647059, 0, 1,
-0.9184378, -1.187391, -1.70405, 1, 0.972549, 0, 1,
-0.9158517, 1.278432, -2.329976, 1, 0.9764706, 0, 1,
-0.9150709, -2.166597, -4.371161, 1, 0.9843137, 0, 1,
-0.9145666, -1.728275, -3.226988, 1, 0.9882353, 0, 1,
-0.9126354, 1.83787, -2.393578, 1, 0.9960784, 0, 1,
-0.9019477, -0.7533204, -2.128702, 0.9960784, 1, 0, 1,
-0.8988318, -0.8530949, -2.80075, 0.9921569, 1, 0, 1,
-0.8988186, 0.5454021, -0.9188775, 0.9843137, 1, 0, 1,
-0.8968994, -1.308056, -5.073688, 0.9803922, 1, 0, 1,
-0.8964358, -0.8429742, -1.978899, 0.972549, 1, 0, 1,
-0.8919743, -1.20463, -2.625386, 0.9686275, 1, 0, 1,
-0.8880618, 0.1326163, -0.2257613, 0.9607843, 1, 0, 1,
-0.8863763, 0.4209559, -3.143522, 0.9568627, 1, 0, 1,
-0.8863626, 0.1507518, -2.757411, 0.9490196, 1, 0, 1,
-0.8817356, -0.6232192, -2.964739, 0.945098, 1, 0, 1,
-0.870041, -0.6322985, -1.407207, 0.9372549, 1, 0, 1,
-0.8686544, 0.3621882, 0.1881654, 0.9333333, 1, 0, 1,
-0.8671437, 0.5365313, -1.248811, 0.9254902, 1, 0, 1,
-0.864723, 1.642349, -1.159157, 0.9215686, 1, 0, 1,
-0.8626669, -0.1334588, -3.668122, 0.9137255, 1, 0, 1,
-0.8585871, 0.3403306, -0.1705041, 0.9098039, 1, 0, 1,
-0.8583494, -1.73571, -2.381496, 0.9019608, 1, 0, 1,
-0.8530465, -0.440899, -4.651779, 0.8941177, 1, 0, 1,
-0.8415251, -0.5769971, -3.793532, 0.8901961, 1, 0, 1,
-0.8350275, 1.908934, 0.1744834, 0.8823529, 1, 0, 1,
-0.8329802, 0.666104, -0.4991777, 0.8784314, 1, 0, 1,
-0.8290111, 0.06972598, -1.069915, 0.8705882, 1, 0, 1,
-0.8160932, 0.8199341, -2.215927, 0.8666667, 1, 0, 1,
-0.8151483, 1.609433, -0.2155201, 0.8588235, 1, 0, 1,
-0.8139985, 0.4803159, 0.9323352, 0.854902, 1, 0, 1,
-0.8125829, -0.5693297, -4.354587, 0.8470588, 1, 0, 1,
-0.8099272, -0.1104362, -0.3626138, 0.8431373, 1, 0, 1,
-0.8094939, -0.5213695, -3.275383, 0.8352941, 1, 0, 1,
-0.8031833, 1.412606, 0.8082149, 0.8313726, 1, 0, 1,
-0.7996153, 0.0004133909, 0.5676502, 0.8235294, 1, 0, 1,
-0.7930842, 0.4023752, -0.2187067, 0.8196079, 1, 0, 1,
-0.789211, 0.04876978, 0.6109976, 0.8117647, 1, 0, 1,
-0.7884187, -0.9657481, -3.198584, 0.8078431, 1, 0, 1,
-0.7851778, 0.7469128, -2.771761, 0.8, 1, 0, 1,
-0.7843566, -0.8130196, -3.12637, 0.7921569, 1, 0, 1,
-0.7827585, -1.048274, -4.334276, 0.7882353, 1, 0, 1,
-0.7816299, -0.02770942, -1.727065, 0.7803922, 1, 0, 1,
-0.7736426, -0.406296, -3.187754, 0.7764706, 1, 0, 1,
-0.7729437, -1.065242, -1.645621, 0.7686275, 1, 0, 1,
-0.7710015, -1.325526, -2.850198, 0.7647059, 1, 0, 1,
-0.7683391, 1.202212, 2.551589, 0.7568628, 1, 0, 1,
-0.7602482, 0.3853401, -1.116624, 0.7529412, 1, 0, 1,
-0.7582515, 0.6751311, -2.755411, 0.7450981, 1, 0, 1,
-0.7580932, 0.545339, -2.57284, 0.7411765, 1, 0, 1,
-0.7501802, 0.3397582, 0.7030433, 0.7333333, 1, 0, 1,
-0.7488919, -2.424511, -3.643946, 0.7294118, 1, 0, 1,
-0.7401389, 0.01164783, -1.137989, 0.7215686, 1, 0, 1,
-0.7347064, -0.1436471, -2.689951, 0.7176471, 1, 0, 1,
-0.7284179, 0.1267903, -0.8461496, 0.7098039, 1, 0, 1,
-0.7177738, 1.15824, -0.7679155, 0.7058824, 1, 0, 1,
-0.7163932, 1.185613, -0.446688, 0.6980392, 1, 0, 1,
-0.7158811, -0.2221735, -0.7026062, 0.6901961, 1, 0, 1,
-0.7147164, -0.05396328, -1.902424, 0.6862745, 1, 0, 1,
-0.7143933, 0.3328126, -0.6610498, 0.6784314, 1, 0, 1,
-0.714359, 0.3897484, -1.478587, 0.6745098, 1, 0, 1,
-0.7124385, 0.7464654, 0.3172027, 0.6666667, 1, 0, 1,
-0.7104475, 0.4468181, -0.5775933, 0.6627451, 1, 0, 1,
-0.7014332, -0.6433836, -2.62586, 0.654902, 1, 0, 1,
-0.7002425, -0.7894525, -2.429278, 0.6509804, 1, 0, 1,
-0.6903629, 1.536513, -1.075502, 0.6431373, 1, 0, 1,
-0.6886419, 1.671584, -0.274756, 0.6392157, 1, 0, 1,
-0.6815057, 1.10344, -1.140765, 0.6313726, 1, 0, 1,
-0.6804134, -0.840408, -0.5547718, 0.627451, 1, 0, 1,
-0.6733151, 3.425219, -1.234529, 0.6196079, 1, 0, 1,
-0.6694515, 1.873799, -1.845128, 0.6156863, 1, 0, 1,
-0.6675393, 0.9323876, 0.2288554, 0.6078432, 1, 0, 1,
-0.6673942, -0.4779158, -1.74662, 0.6039216, 1, 0, 1,
-0.6639711, -0.6353553, -1.357686, 0.5960785, 1, 0, 1,
-0.6632749, 0.5058016, -1.221145, 0.5882353, 1, 0, 1,
-0.662338, -0.8523275, -1.863997, 0.5843138, 1, 0, 1,
-0.6537679, -1.845684, -3.823447, 0.5764706, 1, 0, 1,
-0.6474067, 0.3694181, -2.567066, 0.572549, 1, 0, 1,
-0.6451713, -0.3567014, -4.619985, 0.5647059, 1, 0, 1,
-0.6439149, -1.125529, -2.702442, 0.5607843, 1, 0, 1,
-0.6343019, 1.456329, 0.3982851, 0.5529412, 1, 0, 1,
-0.6304871, 1.117716, -2.436717, 0.5490196, 1, 0, 1,
-0.625659, -0.1246345, -0.7422268, 0.5411765, 1, 0, 1,
-0.6177776, 0.85375, -0.2453963, 0.5372549, 1, 0, 1,
-0.6102406, -0.7992607, -3.326397, 0.5294118, 1, 0, 1,
-0.60829, -1.713759, -1.876481, 0.5254902, 1, 0, 1,
-0.6049004, -1.014707, -2.993342, 0.5176471, 1, 0, 1,
-0.6042827, 0.1794152, -2.799657, 0.5137255, 1, 0, 1,
-0.6021429, -0.9602631, -1.577027, 0.5058824, 1, 0, 1,
-0.5987385, 0.4370327, -0.5891395, 0.5019608, 1, 0, 1,
-0.5977894, -0.4547499, -2.244967, 0.4941176, 1, 0, 1,
-0.5950841, -0.2464075, -2.307504, 0.4862745, 1, 0, 1,
-0.5950517, 0.6918361, -0.6543756, 0.4823529, 1, 0, 1,
-0.5925619, 0.3060797, 1.015915, 0.4745098, 1, 0, 1,
-0.5903669, 1.404834, -0.6880032, 0.4705882, 1, 0, 1,
-0.5803267, -0.3942425, -1.187161, 0.4627451, 1, 0, 1,
-0.5797083, 1.167115, -0.630893, 0.4588235, 1, 0, 1,
-0.5795417, -0.2096817, -2.523694, 0.4509804, 1, 0, 1,
-0.5783994, 0.7819036, -0.3907694, 0.4470588, 1, 0, 1,
-0.5764862, 1.036178, -0.8144761, 0.4392157, 1, 0, 1,
-0.5732229, 1.842242, -0.7782291, 0.4352941, 1, 0, 1,
-0.5718676, -0.7779116, -3.651113, 0.427451, 1, 0, 1,
-0.5710913, -1.362598, -3.538991, 0.4235294, 1, 0, 1,
-0.5675679, 0.2070763, -0.8548987, 0.4156863, 1, 0, 1,
-0.5630163, -0.05936649, 0.6956199, 0.4117647, 1, 0, 1,
-0.5626944, -1.005428, -1.832124, 0.4039216, 1, 0, 1,
-0.5593399, -0.1815847, -3.039377, 0.3960784, 1, 0, 1,
-0.5580484, 0.6226841, -0.8639519, 0.3921569, 1, 0, 1,
-0.5566841, 0.3200152, -1.439446, 0.3843137, 1, 0, 1,
-0.5532418, 0.793765, 0.8613454, 0.3803922, 1, 0, 1,
-0.5384162, -0.7006618, -1.096495, 0.372549, 1, 0, 1,
-0.5367701, -0.7755494, -3.326758, 0.3686275, 1, 0, 1,
-0.5367471, -1.20654, -1.553632, 0.3607843, 1, 0, 1,
-0.5298716, -1.673182, -2.690856, 0.3568628, 1, 0, 1,
-0.5295886, -0.6516996, -2.124657, 0.3490196, 1, 0, 1,
-0.5184857, -0.4125001, -3.634703, 0.345098, 1, 0, 1,
-0.5101867, -0.5205268, -2.684578, 0.3372549, 1, 0, 1,
-0.5096721, -0.182309, -1.76592, 0.3333333, 1, 0, 1,
-0.5095527, 0.008393763, -1.8503, 0.3254902, 1, 0, 1,
-0.5092132, 0.3731064, -0.2751599, 0.3215686, 1, 0, 1,
-0.5070997, -0.1523368, -1.056777, 0.3137255, 1, 0, 1,
-0.5062069, 0.3236148, -1.589956, 0.3098039, 1, 0, 1,
-0.5041929, 0.5663168, -1.124864, 0.3019608, 1, 0, 1,
-0.5028408, 0.3174448, -1.618783, 0.2941177, 1, 0, 1,
-0.5006241, 0.5224637, -1.871225, 0.2901961, 1, 0, 1,
-0.4923343, 1.335282, 1.822628, 0.282353, 1, 0, 1,
-0.4895737, 1.045677, 1.23556, 0.2784314, 1, 0, 1,
-0.4883153, 1.026308, -1.809392, 0.2705882, 1, 0, 1,
-0.487048, -0.3735176, -2.688496, 0.2666667, 1, 0, 1,
-0.4863171, 0.7666818, -1.614467, 0.2588235, 1, 0, 1,
-0.4793001, -0.08770924, -1.685939, 0.254902, 1, 0, 1,
-0.4687636, -1.364667, -2.186885, 0.2470588, 1, 0, 1,
-0.4685764, -1.03074, -2.46191, 0.2431373, 1, 0, 1,
-0.4674477, 0.2984908, -2.021981, 0.2352941, 1, 0, 1,
-0.4654181, -0.4268318, -3.479479, 0.2313726, 1, 0, 1,
-0.4620267, -1.493911, -1.894541, 0.2235294, 1, 0, 1,
-0.4616873, 0.9044973, 0.9069723, 0.2196078, 1, 0, 1,
-0.4613529, 0.7199773, -0.3816628, 0.2117647, 1, 0, 1,
-0.4534002, -0.7532941, -4.375253, 0.2078431, 1, 0, 1,
-0.4521647, -0.02384514, -1.279587, 0.2, 1, 0, 1,
-0.4363345, 0.1267999, 0.3050122, 0.1921569, 1, 0, 1,
-0.4356349, 0.558332, -0.8011004, 0.1882353, 1, 0, 1,
-0.4348388, 0.05214101, -1.639919, 0.1803922, 1, 0, 1,
-0.4280823, -1.351844, -2.802646, 0.1764706, 1, 0, 1,
-0.4249898, 1.555279, 0.2170432, 0.1686275, 1, 0, 1,
-0.4144189, -0.04479007, -0.8423975, 0.1647059, 1, 0, 1,
-0.41282, 1.168513, -0.1420828, 0.1568628, 1, 0, 1,
-0.4128146, -1.380423, -1.064555, 0.1529412, 1, 0, 1,
-0.4074772, -0.155882, -3.995866, 0.145098, 1, 0, 1,
-0.4073515, -1.06086, -2.818216, 0.1411765, 1, 0, 1,
-0.4065195, 0.5594196, -0.3486882, 0.1333333, 1, 0, 1,
-0.4058391, 1.22615, -2.282056, 0.1294118, 1, 0, 1,
-0.4052603, -1.848337, -2.143872, 0.1215686, 1, 0, 1,
-0.40231, 1.316206, -1.004669, 0.1176471, 1, 0, 1,
-0.4001195, 0.7470279, -2.582123, 0.1098039, 1, 0, 1,
-0.3990732, -1.002347, -2.948753, 0.1058824, 1, 0, 1,
-0.3956924, -0.6555198, -1.736027, 0.09803922, 1, 0, 1,
-0.3938172, 0.0602588, -1.722568, 0.09019608, 1, 0, 1,
-0.3915637, -1.311378, -3.035741, 0.08627451, 1, 0, 1,
-0.3877118, -0.1731047, -2.243634, 0.07843138, 1, 0, 1,
-0.3852921, 1.412037, 0.7648646, 0.07450981, 1, 0, 1,
-0.3849932, 0.7372992, 0.4880119, 0.06666667, 1, 0, 1,
-0.3833757, 1.48121, -0.0607183, 0.0627451, 1, 0, 1,
-0.3825967, 0.7649468, -1.964107, 0.05490196, 1, 0, 1,
-0.3807421, -1.114721, -2.144728, 0.05098039, 1, 0, 1,
-0.3784502, -1.982437, -3.317138, 0.04313726, 1, 0, 1,
-0.3724093, 0.1336805, -3.733301, 0.03921569, 1, 0, 1,
-0.3712007, 1.193031, 0.709741, 0.03137255, 1, 0, 1,
-0.3699428, 0.4051423, 0.3039063, 0.02745098, 1, 0, 1,
-0.3688963, -0.3618453, -2.361241, 0.01960784, 1, 0, 1,
-0.3614804, 0.150888, -1.989578, 0.01568628, 1, 0, 1,
-0.361305, -0.3818577, -2.487295, 0.007843138, 1, 0, 1,
-0.3532375, 1.163976, -0.3757401, 0.003921569, 1, 0, 1,
-0.3528345, 0.8918776, -1.425425, 0, 1, 0.003921569, 1,
-0.3527424, 0.7685243, -0.4353139, 0, 1, 0.01176471, 1,
-0.351749, -1.056368, -3.351023, 0, 1, 0.01568628, 1,
-0.3446698, 0.07892376, -0.8655035, 0, 1, 0.02352941, 1,
-0.3436345, -1.08294, -3.516627, 0, 1, 0.02745098, 1,
-0.3430435, -0.5722721, -3.114915, 0, 1, 0.03529412, 1,
-0.3425614, 1.323309, -0.9340553, 0, 1, 0.03921569, 1,
-0.3414142, -0.01421716, -1.662845, 0, 1, 0.04705882, 1,
-0.3351117, -0.4848582, -4.770758, 0, 1, 0.05098039, 1,
-0.3287163, 1.049953, -0.7764127, 0, 1, 0.05882353, 1,
-0.3276094, -0.1687561, -3.302692, 0, 1, 0.0627451, 1,
-0.3242417, -1.469913, -2.963039, 0, 1, 0.07058824, 1,
-0.3235011, -1.601474, -2.904924, 0, 1, 0.07450981, 1,
-0.3200471, -1.691074, -2.557753, 0, 1, 0.08235294, 1,
-0.3175821, -0.7165077, -1.611609, 0, 1, 0.08627451, 1,
-0.3155018, 0.412956, -1.049634, 0, 1, 0.09411765, 1,
-0.3153701, -0.7813686, -3.11044, 0, 1, 0.1019608, 1,
-0.308219, 1.007432, -1.13056, 0, 1, 0.1058824, 1,
-0.3078957, -0.5257229, -4.902107, 0, 1, 0.1137255, 1,
-0.3059327, 0.3222884, 1.475937, 0, 1, 0.1176471, 1,
-0.3034774, -0.7820536, -1.824224, 0, 1, 0.1254902, 1,
-0.3025305, -0.4135986, -3.175654, 0, 1, 0.1294118, 1,
-0.3017273, -0.160465, -2.325207, 0, 1, 0.1372549, 1,
-0.3002458, 1.164225, 1.096612, 0, 1, 0.1411765, 1,
-0.297419, 0.5415609, -1.736759, 0, 1, 0.1490196, 1,
-0.2919823, -1.814522, -2.157664, 0, 1, 0.1529412, 1,
-0.2912824, 1.124437, -0.01712367, 0, 1, 0.1607843, 1,
-0.2829728, 0.6774703, -1.286638, 0, 1, 0.1647059, 1,
-0.2812218, 0.9793739, 1.377863, 0, 1, 0.172549, 1,
-0.2783197, 0.4798572, -0.9896286, 0, 1, 0.1764706, 1,
-0.2770125, 1.618707, 1.139052, 0, 1, 0.1843137, 1,
-0.2760701, -0.1259196, -1.964748, 0, 1, 0.1882353, 1,
-0.2729613, 0.08307967, -0.3062344, 0, 1, 0.1960784, 1,
-0.2715682, -0.6629621, -3.690837, 0, 1, 0.2039216, 1,
-0.2712873, 1.437933, 0.407264, 0, 1, 0.2078431, 1,
-0.2611762, -0.7912605, -1.861588, 0, 1, 0.2156863, 1,
-0.2608487, 1.080012, 0.8317035, 0, 1, 0.2196078, 1,
-0.2567905, 0.1941709, -0.08899495, 0, 1, 0.227451, 1,
-0.255493, 1.505082, -0.2971002, 0, 1, 0.2313726, 1,
-0.249495, 0.0872203, 1.300494, 0, 1, 0.2392157, 1,
-0.2438526, 0.5785135, -1.187132, 0, 1, 0.2431373, 1,
-0.2401237, -0.8320501, -2.551641, 0, 1, 0.2509804, 1,
-0.2376965, 1.107296, -0.4473202, 0, 1, 0.254902, 1,
-0.2360663, 3.052281, 0.4033912, 0, 1, 0.2627451, 1,
-0.2356584, -0.1452553, -1.123164, 0, 1, 0.2666667, 1,
-0.2342869, -1.134888, -5.614413, 0, 1, 0.2745098, 1,
-0.2324969, -1.36604, -2.876611, 0, 1, 0.2784314, 1,
-0.232174, 0.5071015, 0.3003474, 0, 1, 0.2862745, 1,
-0.2309601, 0.652581, -0.4586877, 0, 1, 0.2901961, 1,
-0.2283789, -0.873422, -3.259269, 0, 1, 0.2980392, 1,
-0.2261375, 1.313398, 0.3150333, 0, 1, 0.3058824, 1,
-0.2257318, -0.0638928, -1.10992, 0, 1, 0.3098039, 1,
-0.2221435, 0.01196176, -2.173301, 0, 1, 0.3176471, 1,
-0.2172269, 1.016473, 0.03434381, 0, 1, 0.3215686, 1,
-0.2154156, 1.604056, -0.8140337, 0, 1, 0.3294118, 1,
-0.2127027, 1.209536, -0.07939303, 0, 1, 0.3333333, 1,
-0.2106447, 0.6749484, -1.388098, 0, 1, 0.3411765, 1,
-0.2080061, 0.1971171, -2.085642, 0, 1, 0.345098, 1,
-0.2073738, -0.8741848, -3.027776, 0, 1, 0.3529412, 1,
-0.2044919, -0.3235188, -3.284552, 0, 1, 0.3568628, 1,
-0.197867, 0.8078015, -0.5844025, 0, 1, 0.3647059, 1,
-0.1924115, 0.5449002, 0.1471463, 0, 1, 0.3686275, 1,
-0.1908829, 0.1575504, 0.1493992, 0, 1, 0.3764706, 1,
-0.1892636, -0.07073404, -2.173015, 0, 1, 0.3803922, 1,
-0.1880019, -0.7226652, -2.103177, 0, 1, 0.3882353, 1,
-0.1853007, -1.665523, -2.795425, 0, 1, 0.3921569, 1,
-0.1787185, 0.9677008, -0.783973, 0, 1, 0.4, 1,
-0.1777059, 0.5934934, -0.1764915, 0, 1, 0.4078431, 1,
-0.1752624, -1.847654, -4.068703, 0, 1, 0.4117647, 1,
-0.1745009, -0.9398324, -4.294282, 0, 1, 0.4196078, 1,
-0.1736003, 1.238676, -1.414373, 0, 1, 0.4235294, 1,
-0.1703728, 1.207671, 0.1473559, 0, 1, 0.4313726, 1,
-0.1622731, 0.3980317, -0.3202886, 0, 1, 0.4352941, 1,
-0.1618157, -0.4560114, -4.177019, 0, 1, 0.4431373, 1,
-0.1615943, -0.3360606, -2.936403, 0, 1, 0.4470588, 1,
-0.1583434, -0.1956499, -2.819333, 0, 1, 0.454902, 1,
-0.1578476, 1.114023, -1.152408, 0, 1, 0.4588235, 1,
-0.1556739, 1.526606, 0.3906661, 0, 1, 0.4666667, 1,
-0.1550009, 2.488761, 0.6533086, 0, 1, 0.4705882, 1,
-0.1541414, -0.6483154, -2.301311, 0, 1, 0.4784314, 1,
-0.1529853, 0.7039853, -0.5710805, 0, 1, 0.4823529, 1,
-0.1474464, 0.2206319, 0.9775271, 0, 1, 0.4901961, 1,
-0.1456286, -1.972698, -1.758296, 0, 1, 0.4941176, 1,
-0.14502, -0.2509439, -3.638582, 0, 1, 0.5019608, 1,
-0.1441649, -0.2065312, -1.655042, 0, 1, 0.509804, 1,
-0.1417352, 2.426729, -0.3100452, 0, 1, 0.5137255, 1,
-0.1407052, 0.4859506, -0.3949931, 0, 1, 0.5215687, 1,
-0.1383674, 1.352116, -0.07064459, 0, 1, 0.5254902, 1,
-0.1374528, -0.1842364, -2.06058, 0, 1, 0.5333334, 1,
-0.1347295, 1.194073, -1.091685, 0, 1, 0.5372549, 1,
-0.132912, 0.189514, -1.253936, 0, 1, 0.5450981, 1,
-0.1283723, -1.682232, -3.224585, 0, 1, 0.5490196, 1,
-0.1265451, -0.579476, -1.825579, 0, 1, 0.5568628, 1,
-0.1262215, -0.9919756, -3.743333, 0, 1, 0.5607843, 1,
-0.1160847, -1.538631, -3.271158, 0, 1, 0.5686275, 1,
-0.1153297, 0.3552482, -0.5619143, 0, 1, 0.572549, 1,
-0.1144833, 0.1707539, -1.521638, 0, 1, 0.5803922, 1,
-0.1064121, -0.519555, -4.495416, 0, 1, 0.5843138, 1,
-0.1060969, -0.05972486, -1.296972, 0, 1, 0.5921569, 1,
-0.1033294, -1.21697, -2.194381, 0, 1, 0.5960785, 1,
-0.09537421, -0.6294882, -2.553181, 0, 1, 0.6039216, 1,
-0.08850113, 0.01580368, -1.466928, 0, 1, 0.6117647, 1,
-0.08798828, -0.9387411, -1.460236, 0, 1, 0.6156863, 1,
-0.0857418, 0.4219497, -0.8470017, 0, 1, 0.6235294, 1,
-0.08454822, 0.486749, -0.7693403, 0, 1, 0.627451, 1,
-0.08298261, -0.9886842, -2.766821, 0, 1, 0.6352941, 1,
-0.08221906, 0.1343494, -1.270646, 0, 1, 0.6392157, 1,
-0.08211046, 0.1474037, 0.1294756, 0, 1, 0.6470588, 1,
-0.0781658, 1.069029, -0.3890632, 0, 1, 0.6509804, 1,
-0.07284913, -0.217752, -3.121647, 0, 1, 0.6588235, 1,
-0.07012241, 1.827197, 0.9363803, 0, 1, 0.6627451, 1,
-0.07008442, 0.4733398, -0.2191048, 0, 1, 0.6705883, 1,
-0.0690398, 1.154714, -0.589874, 0, 1, 0.6745098, 1,
-0.06887265, 1.443455, 0.6842173, 0, 1, 0.682353, 1,
-0.0685025, 0.07176197, -0.6932035, 0, 1, 0.6862745, 1,
-0.06787867, 0.2110104, -1.689266, 0, 1, 0.6941177, 1,
-0.0675266, 1.109075, -0.3999156, 0, 1, 0.7019608, 1,
-0.06248495, 0.2685352, -1.306268, 0, 1, 0.7058824, 1,
-0.05805499, 0.2810688, 0.4869349, 0, 1, 0.7137255, 1,
-0.05770539, -0.7503555, -3.600922, 0, 1, 0.7176471, 1,
-0.05545799, 1.301739, 0.8734669, 0, 1, 0.7254902, 1,
-0.05503649, 0.7983755, 0.8175336, 0, 1, 0.7294118, 1,
-0.05481271, 0.3858293, -0.2843545, 0, 1, 0.7372549, 1,
-0.05336457, 2.203434, 1.406676, 0, 1, 0.7411765, 1,
-0.05143235, -0.2192683, -1.709526, 0, 1, 0.7490196, 1,
-0.05054091, -1.12191, -2.740405, 0, 1, 0.7529412, 1,
-0.05032253, 1.008812, -1.678631, 0, 1, 0.7607843, 1,
-0.05016625, 1.182717, 0.1827243, 0, 1, 0.7647059, 1,
-0.04806246, -0.6087325, -2.929685, 0, 1, 0.772549, 1,
-0.04371962, 0.07943748, -1.567716, 0, 1, 0.7764706, 1,
-0.04281623, -0.4973025, -4.520606, 0, 1, 0.7843137, 1,
-0.039668, 0.1008127, 1.94695, 0, 1, 0.7882353, 1,
-0.03546704, 1.021315, -0.3185199, 0, 1, 0.7960784, 1,
-0.03455302, -0.5269463, -2.283845, 0, 1, 0.8039216, 1,
-0.03433459, -0.8049171, -3.713204, 0, 1, 0.8078431, 1,
-0.03422046, -0.2435804, -3.320929, 0, 1, 0.8156863, 1,
-0.03420241, -0.2954234, -2.679306, 0, 1, 0.8196079, 1,
-0.03334443, -0.5230146, -3.76943, 0, 1, 0.827451, 1,
-0.03051929, -0.7229671, -3.267876, 0, 1, 0.8313726, 1,
-0.02570179, -1.616032, -2.621464, 0, 1, 0.8392157, 1,
-0.02412171, 1.406837, 0.3808658, 0, 1, 0.8431373, 1,
-0.02150533, 1.373087, 0.3248518, 0, 1, 0.8509804, 1,
-0.01775621, 0.3112971, 0.6112581, 0, 1, 0.854902, 1,
-0.01554473, -1.239414, -4.031447, 0, 1, 0.8627451, 1,
-0.01553358, 0.06421261, 1.41449, 0, 1, 0.8666667, 1,
-0.01458367, -0.2100936, -1.063452, 0, 1, 0.8745098, 1,
-0.01440249, 0.2677212, 0.3837988, 0, 1, 0.8784314, 1,
-0.01362545, 0.7590287, 0.03203841, 0, 1, 0.8862745, 1,
-0.01194134, 0.1925222, 0.8642853, 0, 1, 0.8901961, 1,
-0.01193106, -0.5097672, -4.733127, 0, 1, 0.8980392, 1,
-0.007228405, 0.1771106, -0.5516347, 0, 1, 0.9058824, 1,
-0.007012217, -0.1339945, -3.689867, 0, 1, 0.9098039, 1,
-0.00368914, 0.6315246, 1.07085, 0, 1, 0.9176471, 1,
-0.001002166, -2.123144, -3.261433, 0, 1, 0.9215686, 1,
-0.0008767195, -0.1330308, -2.894183, 0, 1, 0.9294118, 1,
-4.916858e-05, -0.987472, -2.761198, 0, 1, 0.9333333, 1,
0.0009740486, 1.80831, 0.2385671, 0, 1, 0.9411765, 1,
0.003719072, -0.2190976, 3.213386, 0, 1, 0.945098, 1,
0.005129458, 0.1804235, 0.4566066, 0, 1, 0.9529412, 1,
0.006299395, 1.292073, -0.3769898, 0, 1, 0.9568627, 1,
0.007304142, -1.102636, 3.506672, 0, 1, 0.9647059, 1,
0.007894878, 1.436978, -0.5896633, 0, 1, 0.9686275, 1,
0.008686043, -0.1698124, 2.394438, 0, 1, 0.9764706, 1,
0.01294476, 0.5143657, -0.2180397, 0, 1, 0.9803922, 1,
0.01660337, 0.6730501, -0.273007, 0, 1, 0.9882353, 1,
0.01830101, 1.005168, -0.6797879, 0, 1, 0.9921569, 1,
0.01853992, -0.459648, 3.63082, 0, 1, 1, 1,
0.01882147, -0.9083655, 3.543422, 0, 0.9921569, 1, 1,
0.01998051, -0.2544256, 3.263313, 0, 0.9882353, 1, 1,
0.0211043, 0.7925029, 0.6396434, 0, 0.9803922, 1, 1,
0.02656524, -1.750854, 2.384912, 0, 0.9764706, 1, 1,
0.03344063, -1.921053, 3.458178, 0, 0.9686275, 1, 1,
0.03617187, -0.8711535, 3.009673, 0, 0.9647059, 1, 1,
0.04327166, 0.4896633, -1.581644, 0, 0.9568627, 1, 1,
0.04385501, 0.7421327, 1.286113, 0, 0.9529412, 1, 1,
0.04937499, -0.6543773, 2.148604, 0, 0.945098, 1, 1,
0.05305456, -0.007328236, -0.438992, 0, 0.9411765, 1, 1,
0.05692998, 1.851962, -0.8990179, 0, 0.9333333, 1, 1,
0.06872918, 0.5830172, 1.615566, 0, 0.9294118, 1, 1,
0.06893659, -2.807583, 3.934235, 0, 0.9215686, 1, 1,
0.07109962, -0.9189005, 1.860668, 0, 0.9176471, 1, 1,
0.07512988, -0.1169823, 2.929023, 0, 0.9098039, 1, 1,
0.07698715, -0.6262634, 3.325595, 0, 0.9058824, 1, 1,
0.0772415, 2.632066, -0.6717474, 0, 0.8980392, 1, 1,
0.08159577, -0.5811576, 1.314505, 0, 0.8901961, 1, 1,
0.08443152, 0.0558594, -0.001600577, 0, 0.8862745, 1, 1,
0.08458303, -0.2089861, 2.622118, 0, 0.8784314, 1, 1,
0.0874001, -1.379171, 2.708995, 0, 0.8745098, 1, 1,
0.08807445, -0.9786322, 3.801539, 0, 0.8666667, 1, 1,
0.08812723, 0.2406798, 0.3474828, 0, 0.8627451, 1, 1,
0.08891006, 2.348788, -0.8072667, 0, 0.854902, 1, 1,
0.08956081, 0.5506425, 1.105542, 0, 0.8509804, 1, 1,
0.08981477, -0.1419414, 2.046243, 0, 0.8431373, 1, 1,
0.09001442, 0.6687646, -0.7575362, 0, 0.8392157, 1, 1,
0.09029872, 0.1039823, 1.851533, 0, 0.8313726, 1, 1,
0.09417608, -0.1853315, 2.204337, 0, 0.827451, 1, 1,
0.09700848, 0.6513564, 0.03776019, 0, 0.8196079, 1, 1,
0.09915634, -0.0006503721, 2.223725, 0, 0.8156863, 1, 1,
0.1022483, -0.1460512, 2.396384, 0, 0.8078431, 1, 1,
0.103214, -0.8934104, 2.985882, 0, 0.8039216, 1, 1,
0.1060407, -0.4900791, 2.420288, 0, 0.7960784, 1, 1,
0.1068555, -0.2615631, 3.671525, 0, 0.7882353, 1, 1,
0.109114, 0.06533958, 2.228918, 0, 0.7843137, 1, 1,
0.1112417, -0.3266668, 1.712828, 0, 0.7764706, 1, 1,
0.1132151, -0.762745, 1.876339, 0, 0.772549, 1, 1,
0.1169479, -0.9339315, 2.146118, 0, 0.7647059, 1, 1,
0.1187371, 0.6845189, 1.572905, 0, 0.7607843, 1, 1,
0.121964, -0.8761376, 3.339115, 0, 0.7529412, 1, 1,
0.1306782, 0.8610497, -0.4021253, 0, 0.7490196, 1, 1,
0.1329834, -0.4160006, 4.46869, 0, 0.7411765, 1, 1,
0.134475, 0.5929078, 0.1768289, 0, 0.7372549, 1, 1,
0.1375162, -0.08246321, 2.086703, 0, 0.7294118, 1, 1,
0.1391147, 0.08012439, 1.056421, 0, 0.7254902, 1, 1,
0.141017, 1.257654, -0.6324306, 0, 0.7176471, 1, 1,
0.1421342, 0.5444432, 0.1177465, 0, 0.7137255, 1, 1,
0.1428066, -0.1672691, 4.884528, 0, 0.7058824, 1, 1,
0.1510303, -0.278656, 2.304814, 0, 0.6980392, 1, 1,
0.151161, -1.962429, 3.552936, 0, 0.6941177, 1, 1,
0.1515148, 0.2431309, 2.030638, 0, 0.6862745, 1, 1,
0.1581336, -0.1780254, 2.325626, 0, 0.682353, 1, 1,
0.1590586, 0.2114688, 1.072579, 0, 0.6745098, 1, 1,
0.159911, 0.6526009, 0.9954025, 0, 0.6705883, 1, 1,
0.1616975, -2.276274, 3.062063, 0, 0.6627451, 1, 1,
0.1651888, -0.9465249, 3.374704, 0, 0.6588235, 1, 1,
0.1667004, -0.6091929, 2.755468, 0, 0.6509804, 1, 1,
0.1733222, 0.955465, 1.001554, 0, 0.6470588, 1, 1,
0.1741303, -0.7847322, 3.017569, 0, 0.6392157, 1, 1,
0.1773983, 0.8413427, 0.5554355, 0, 0.6352941, 1, 1,
0.1784503, 0.3743799, 0.5716213, 0, 0.627451, 1, 1,
0.1877124, -1.164289, 3.029512, 0, 0.6235294, 1, 1,
0.1900204, -0.7335765, 1.886064, 0, 0.6156863, 1, 1,
0.1924866, -0.3383385, 0.9016529, 0, 0.6117647, 1, 1,
0.1935507, 0.4268234, 0.9080732, 0, 0.6039216, 1, 1,
0.1935854, -0.5012671, 2.90542, 0, 0.5960785, 1, 1,
0.1956104, -0.1428174, 1.240636, 0, 0.5921569, 1, 1,
0.195954, 2.255253, -2.345665, 0, 0.5843138, 1, 1,
0.2005688, -1.149606, 2.160467, 0, 0.5803922, 1, 1,
0.2022955, -1.285181, 3.754989, 0, 0.572549, 1, 1,
0.2109833, 0.6462076, 0.5296601, 0, 0.5686275, 1, 1,
0.2111578, -0.04872484, 2.277233, 0, 0.5607843, 1, 1,
0.2121565, 1.4551, -0.7535588, 0, 0.5568628, 1, 1,
0.2171183, -0.08610313, 1.132467, 0, 0.5490196, 1, 1,
0.2216024, 0.7968063, -1.027048, 0, 0.5450981, 1, 1,
0.2230399, -0.1929848, 3.439554, 0, 0.5372549, 1, 1,
0.2272685, -1.120835, 2.862244, 0, 0.5333334, 1, 1,
0.2281923, 1.171809, -1.380135, 0, 0.5254902, 1, 1,
0.2281941, 1.58169, -0.1757745, 0, 0.5215687, 1, 1,
0.2321918, 0.886296, 0.7407753, 0, 0.5137255, 1, 1,
0.236093, 0.1015212, 0.7712619, 0, 0.509804, 1, 1,
0.238319, -1.043563, 3.728445, 0, 0.5019608, 1, 1,
0.2400476, -0.9504695, 2.796841, 0, 0.4941176, 1, 1,
0.2407034, -0.07198262, 2.797499, 0, 0.4901961, 1, 1,
0.2482079, 0.3301478, 2.162137, 0, 0.4823529, 1, 1,
0.2513403, 0.03233434, 3.526621, 0, 0.4784314, 1, 1,
0.2552122, -0.1391889, 1.254106, 0, 0.4705882, 1, 1,
0.2552399, -0.36058, 4.085221, 0, 0.4666667, 1, 1,
0.2589117, 0.3791455, 0.4299227, 0, 0.4588235, 1, 1,
0.26427, -0.163141, 1.18575, 0, 0.454902, 1, 1,
0.2664563, -1.708326, 2.726744, 0, 0.4470588, 1, 1,
0.2676078, 0.8826869, -0.04083433, 0, 0.4431373, 1, 1,
0.2689774, -0.3789289, 3.863308, 0, 0.4352941, 1, 1,
0.2701895, 0.8998802, 0.9600823, 0, 0.4313726, 1, 1,
0.270503, 0.6144947, 0.1781924, 0, 0.4235294, 1, 1,
0.2717389, 1.274572, -2.073488, 0, 0.4196078, 1, 1,
0.274514, -1.109044, 2.594145, 0, 0.4117647, 1, 1,
0.2794023, -1.425379, 2.903644, 0, 0.4078431, 1, 1,
0.2796321, 0.9589062, 1.674592, 0, 0.4, 1, 1,
0.282921, 0.6125911, 0.06221617, 0, 0.3921569, 1, 1,
0.286392, -0.4955139, 2.509688, 0, 0.3882353, 1, 1,
0.2888073, -0.1713585, 3.772623, 0, 0.3803922, 1, 1,
0.2891531, 0.4320563, 0.7186652, 0, 0.3764706, 1, 1,
0.2915373, 1.133587, 2.622029, 0, 0.3686275, 1, 1,
0.2933345, -0.09772541, 0.4504317, 0, 0.3647059, 1, 1,
0.2988617, 1.408015, -0.7804936, 0, 0.3568628, 1, 1,
0.305907, -1.121729, 2.854897, 0, 0.3529412, 1, 1,
0.3062411, -0.1528899, 1.827705, 0, 0.345098, 1, 1,
0.3070267, 0.6852701, -0.9088038, 0, 0.3411765, 1, 1,
0.3187942, -0.4658698, 2.175023, 0, 0.3333333, 1, 1,
0.3200456, 0.5168447, 2.462792, 0, 0.3294118, 1, 1,
0.320271, 1.091443, -1.012055, 0, 0.3215686, 1, 1,
0.3225253, -1.845311, 1.225402, 0, 0.3176471, 1, 1,
0.325624, 0.3670154, 0.2014425, 0, 0.3098039, 1, 1,
0.3257736, 1.261452, -1.757578, 0, 0.3058824, 1, 1,
0.3272722, 0.09629505, 0.1437679, 0, 0.2980392, 1, 1,
0.3301271, -0.3571702, 1.09032, 0, 0.2901961, 1, 1,
0.3306029, 0.3707471, 1.175957, 0, 0.2862745, 1, 1,
0.3307677, -0.1572466, 1.912354, 0, 0.2784314, 1, 1,
0.3319635, 0.3384963, 0.4352994, 0, 0.2745098, 1, 1,
0.3360827, -0.8457694, 3.119908, 0, 0.2666667, 1, 1,
0.3475337, 0.4682552, 1.053216, 0, 0.2627451, 1, 1,
0.3497681, 1.109753, 0.4608201, 0, 0.254902, 1, 1,
0.3590245, 0.6881461, -1.390127, 0, 0.2509804, 1, 1,
0.3634647, -0.1973175, 1.812042, 0, 0.2431373, 1, 1,
0.3640366, 1.477356, -0.01174117, 0, 0.2392157, 1, 1,
0.3669676, 1.095924, 1.026013, 0, 0.2313726, 1, 1,
0.367388, 1.083786, 1.863032, 0, 0.227451, 1, 1,
0.3708617, -0.8001855, 3.483124, 0, 0.2196078, 1, 1,
0.3746107, 0.5663061, -0.3307744, 0, 0.2156863, 1, 1,
0.3772552, -1.166479, 3.246729, 0, 0.2078431, 1, 1,
0.3779238, 0.5860012, -0.7187342, 0, 0.2039216, 1, 1,
0.3779857, -1.298011, 3.617538, 0, 0.1960784, 1, 1,
0.3787911, 0.4271148, 0.7523916, 0, 0.1882353, 1, 1,
0.3788113, 0.2192538, 1.014433, 0, 0.1843137, 1, 1,
0.3833956, 2.29742, 0.4650691, 0, 0.1764706, 1, 1,
0.390399, -0.8140598, 3.220312, 0, 0.172549, 1, 1,
0.3919018, -0.3428069, 2.799357, 0, 0.1647059, 1, 1,
0.3938218, 1.648825, -0.1487224, 0, 0.1607843, 1, 1,
0.3978854, 1.181997, -0.3581023, 0, 0.1529412, 1, 1,
0.3989881, -0.0007235303, 1.383822, 0, 0.1490196, 1, 1,
0.4018884, -0.3065266, 2.465249, 0, 0.1411765, 1, 1,
0.4058659, 0.7133669, 0.4935894, 0, 0.1372549, 1, 1,
0.4087798, 0.752446, -0.7233899, 0, 0.1294118, 1, 1,
0.4112208, -1.242571, 2.732419, 0, 0.1254902, 1, 1,
0.4114225, -0.2598208, 0.8218811, 0, 0.1176471, 1, 1,
0.4218884, 0.5709468, 0.3321064, 0, 0.1137255, 1, 1,
0.4242924, -0.1978041, 1.50867, 0, 0.1058824, 1, 1,
0.4253514, -2.172681, 3.197662, 0, 0.09803922, 1, 1,
0.4269261, -0.3713419, 3.071876, 0, 0.09411765, 1, 1,
0.427751, 0.2356489, -0.3310255, 0, 0.08627451, 1, 1,
0.4303493, -1.009997, 2.769492, 0, 0.08235294, 1, 1,
0.4323193, -0.4972839, 4.286793, 0, 0.07450981, 1, 1,
0.4346791, 0.9443145, 0.03485602, 0, 0.07058824, 1, 1,
0.435283, 0.07219897, 1.678218, 0, 0.0627451, 1, 1,
0.4453092, 0.03146206, 1.139239, 0, 0.05882353, 1, 1,
0.4469264, -0.3873974, 0.9533356, 0, 0.05098039, 1, 1,
0.4491204, -0.9917051, 2.595172, 0, 0.04705882, 1, 1,
0.4494808, -0.09714481, 2.031072, 0, 0.03921569, 1, 1,
0.4527394, -0.1620917, 1.268459, 0, 0.03529412, 1, 1,
0.4530051, 0.6569343, 0.6571451, 0, 0.02745098, 1, 1,
0.4586357, -0.1834367, 2.820308, 0, 0.02352941, 1, 1,
0.4635774, -0.5000225, 1.337013, 0, 0.01568628, 1, 1,
0.4645899, 0.6379785, -0.7442496, 0, 0.01176471, 1, 1,
0.465484, 1.310868, 0.4327876, 0, 0.003921569, 1, 1,
0.4706185, 2.43997, 0.5812114, 0.003921569, 0, 1, 1,
0.4757771, -0.7457819, 2.856963, 0.007843138, 0, 1, 1,
0.4788099, 0.06269812, 2.314617, 0.01568628, 0, 1, 1,
0.4797953, -0.3999365, 2.380369, 0.01960784, 0, 1, 1,
0.4821649, -0.1242196, -1.753708, 0.02745098, 0, 1, 1,
0.4833932, -0.1806437, 2.383318, 0.03137255, 0, 1, 1,
0.4839258, 1.02616, 1.206031, 0.03921569, 0, 1, 1,
0.4889069, 0.886793, 0.3287761, 0.04313726, 0, 1, 1,
0.4897276, 0.09312951, 0.3955452, 0.05098039, 0, 1, 1,
0.497115, -0.06655787, 2.652405, 0.05490196, 0, 1, 1,
0.5066499, 0.9994505, 0.5264578, 0.0627451, 0, 1, 1,
0.5071243, -1.866405, 3.287692, 0.06666667, 0, 1, 1,
0.5123168, 0.4240899, 1.412389, 0.07450981, 0, 1, 1,
0.512381, -0.4996901, 1.255527, 0.07843138, 0, 1, 1,
0.5131572, 0.5399955, 2.73256, 0.08627451, 0, 1, 1,
0.5134566, 0.7270253, 0.02971392, 0.09019608, 0, 1, 1,
0.5141215, -1.823935, 2.936953, 0.09803922, 0, 1, 1,
0.5158851, -0.5609657, 2.522262, 0.1058824, 0, 1, 1,
0.5197954, -0.1630883, 2.009875, 0.1098039, 0, 1, 1,
0.5202284, 0.1487858, 2.495772, 0.1176471, 0, 1, 1,
0.5217836, 0.09400158, 0.5684925, 0.1215686, 0, 1, 1,
0.5220917, 0.8562896, 2.520784, 0.1294118, 0, 1, 1,
0.5260169, -0.3278563, 0.3856505, 0.1333333, 0, 1, 1,
0.5272143, -0.7049894, 1.887617, 0.1411765, 0, 1, 1,
0.5304377, 1.158478, 0.3569232, 0.145098, 0, 1, 1,
0.5318682, 1.730724, 0.8577816, 0.1529412, 0, 1, 1,
0.5322722, 0.8881134, -1.10021, 0.1568628, 0, 1, 1,
0.5323778, 1.25551, -0.6626828, 0.1647059, 0, 1, 1,
0.5328109, 1.185059, 1.129943, 0.1686275, 0, 1, 1,
0.5428092, -0.2924125, 1.72825, 0.1764706, 0, 1, 1,
0.5437582, 0.2837656, 0.8014489, 0.1803922, 0, 1, 1,
0.5449859, 0.4231505, -1.365771, 0.1882353, 0, 1, 1,
0.5484529, 2.533134, 1.46597, 0.1921569, 0, 1, 1,
0.5490171, 1.564914, 1.95754, 0.2, 0, 1, 1,
0.5526681, 1.559523, -0.1466596, 0.2078431, 0, 1, 1,
0.5551482, 0.6834759, 1.552342, 0.2117647, 0, 1, 1,
0.5567536, 0.4342948, 1.676313, 0.2196078, 0, 1, 1,
0.5574529, -0.578617, 2.436622, 0.2235294, 0, 1, 1,
0.5587917, -0.6138239, 2.968863, 0.2313726, 0, 1, 1,
0.5607808, -1.102656, 3.610722, 0.2352941, 0, 1, 1,
0.5613545, 1.643351, -0.8578953, 0.2431373, 0, 1, 1,
0.5619673, -0.8720978, 2.31343, 0.2470588, 0, 1, 1,
0.5645997, -0.1077965, 2.502185, 0.254902, 0, 1, 1,
0.5671747, -1.849073, 1.40455, 0.2588235, 0, 1, 1,
0.5673302, 0.2496405, 1.256918, 0.2666667, 0, 1, 1,
0.5683608, -1.538944, 2.995299, 0.2705882, 0, 1, 1,
0.5697879, 1.063591, 0.8777464, 0.2784314, 0, 1, 1,
0.5763661, 0.5203295, 1.676046, 0.282353, 0, 1, 1,
0.5789904, -0.06641648, 1.196509, 0.2901961, 0, 1, 1,
0.5856797, -1.694291, 3.436094, 0.2941177, 0, 1, 1,
0.5945116, 0.7049418, 2.28413, 0.3019608, 0, 1, 1,
0.6009095, 0.7921486, 0.1721696, 0.3098039, 0, 1, 1,
0.6022427, 0.1470458, 2.046546, 0.3137255, 0, 1, 1,
0.6040501, -1.873032, 3.366234, 0.3215686, 0, 1, 1,
0.607016, 1.199155, 1.396453, 0.3254902, 0, 1, 1,
0.6098382, -0.4203025, 0.8693709, 0.3333333, 0, 1, 1,
0.6140767, -1.146113, 2.503925, 0.3372549, 0, 1, 1,
0.6161147, 1.632315, 0.06955126, 0.345098, 0, 1, 1,
0.6161919, -1.433182, 2.610505, 0.3490196, 0, 1, 1,
0.6297642, -0.9014719, 0.3200401, 0.3568628, 0, 1, 1,
0.6310366, 0.7094083, 2.01132, 0.3607843, 0, 1, 1,
0.6331903, -0.7133381, 3.003674, 0.3686275, 0, 1, 1,
0.6333902, -0.7852033, 2.444957, 0.372549, 0, 1, 1,
0.6352441, 1.419784, 1.498103, 0.3803922, 0, 1, 1,
0.6408885, 0.8320798, 1.550765, 0.3843137, 0, 1, 1,
0.6472256, 0.7860522, 1.129615, 0.3921569, 0, 1, 1,
0.6486425, -1.062466, 3.741446, 0.3960784, 0, 1, 1,
0.6514055, 0.5336452, 1.748536, 0.4039216, 0, 1, 1,
0.6515182, -0.9277982, 1.579784, 0.4117647, 0, 1, 1,
0.6525973, -1.171473, 3.327015, 0.4156863, 0, 1, 1,
0.6526055, 0.6463358, 0.089151, 0.4235294, 0, 1, 1,
0.6539227, 0.7509275, 0.1419141, 0.427451, 0, 1, 1,
0.6587662, 0.5371244, -0.2541129, 0.4352941, 0, 1, 1,
0.6690284, -0.3803325, 1.919833, 0.4392157, 0, 1, 1,
0.673521, -0.5270364, 2.389122, 0.4470588, 0, 1, 1,
0.6738636, 0.7675867, -1.063792, 0.4509804, 0, 1, 1,
0.6742305, -0.448776, 0.5593481, 0.4588235, 0, 1, 1,
0.6783559, 0.1993831, -0.08921192, 0.4627451, 0, 1, 1,
0.6784812, -0.6037408, 0.9228101, 0.4705882, 0, 1, 1,
0.6797839, -0.540714, 2.448689, 0.4745098, 0, 1, 1,
0.6806274, -2.299796, 1.965462, 0.4823529, 0, 1, 1,
0.6910558, -1.335309, 1.338525, 0.4862745, 0, 1, 1,
0.6919097, -0.3325243, 1.881645, 0.4941176, 0, 1, 1,
0.695718, 0.3900137, -0.03608138, 0.5019608, 0, 1, 1,
0.6996629, 2.546446, 1.478566, 0.5058824, 0, 1, 1,
0.6997771, 1.997659, -0.1854781, 0.5137255, 0, 1, 1,
0.7012569, -0.8347504, 2.885579, 0.5176471, 0, 1, 1,
0.7051616, -0.71364, 0.8989273, 0.5254902, 0, 1, 1,
0.7091369, -0.5036051, 1.905937, 0.5294118, 0, 1, 1,
0.7126771, -0.1859694, 2.694757, 0.5372549, 0, 1, 1,
0.7148264, 0.9343058, 1.282737, 0.5411765, 0, 1, 1,
0.7148466, -0.4198201, 1.14141, 0.5490196, 0, 1, 1,
0.7148774, -0.5972131, 2.257479, 0.5529412, 0, 1, 1,
0.7156866, -0.3091702, 2.437156, 0.5607843, 0, 1, 1,
0.7170302, -1.123235, 4.008727, 0.5647059, 0, 1, 1,
0.7189751, 1.85421, -2.148162, 0.572549, 0, 1, 1,
0.7241394, 0.1290794, 2.140317, 0.5764706, 0, 1, 1,
0.7322589, -0.1913922, 1.441222, 0.5843138, 0, 1, 1,
0.7344249, 0.4182517, -0.0582436, 0.5882353, 0, 1, 1,
0.7351598, 2.113565, -1.084282, 0.5960785, 0, 1, 1,
0.7475027, 1.047553, 0.2989349, 0.6039216, 0, 1, 1,
0.7491404, 1.090925, 1.185689, 0.6078432, 0, 1, 1,
0.7562988, 1.314865, 0.9216514, 0.6156863, 0, 1, 1,
0.7564512, -0.400491, 2.2385, 0.6196079, 0, 1, 1,
0.7595879, 1.017774, 1.540375, 0.627451, 0, 1, 1,
0.7606041, 1.204418, 1.037008, 0.6313726, 0, 1, 1,
0.7613514, 0.3053522, 0.06048388, 0.6392157, 0, 1, 1,
0.7653955, 1.540893, -0.9734125, 0.6431373, 0, 1, 1,
0.7712667, -1.020717, 0.3049698, 0.6509804, 0, 1, 1,
0.7721967, 1.431462, 0.4019698, 0.654902, 0, 1, 1,
0.7846575, 1.678183, 0.150609, 0.6627451, 0, 1, 1,
0.7863708, -0.6507487, 0.8188412, 0.6666667, 0, 1, 1,
0.7877826, -0.1949011, 1.333811, 0.6745098, 0, 1, 1,
0.7888609, -1.557285, 2.125411, 0.6784314, 0, 1, 1,
0.7899355, 1.095049, 0.2478673, 0.6862745, 0, 1, 1,
0.7917379, 0.6541278, 1.221666, 0.6901961, 0, 1, 1,
0.7995036, -0.5504668, 2.002934, 0.6980392, 0, 1, 1,
0.8115943, -0.9730966, 3.154164, 0.7058824, 0, 1, 1,
0.8139737, 0.153208, 4.307031, 0.7098039, 0, 1, 1,
0.8162598, 0.476237, 0.9383729, 0.7176471, 0, 1, 1,
0.816382, 0.5810724, 0.9518433, 0.7215686, 0, 1, 1,
0.8356178, -0.121711, 0.7289357, 0.7294118, 0, 1, 1,
0.8362921, -0.06381852, 1.921115, 0.7333333, 0, 1, 1,
0.8392824, 0.690116, 0.1985745, 0.7411765, 0, 1, 1,
0.8427436, -0.7171996, 2.051177, 0.7450981, 0, 1, 1,
0.8431706, 0.1106282, 2.680704, 0.7529412, 0, 1, 1,
0.8433101, 0.6134065, 1.083439, 0.7568628, 0, 1, 1,
0.8553513, -0.8033936, 2.680859, 0.7647059, 0, 1, 1,
0.8682416, -0.9810242, 2.521481, 0.7686275, 0, 1, 1,
0.8711759, -0.05129957, 0.6913111, 0.7764706, 0, 1, 1,
0.8726183, -0.7765235, 2.498271, 0.7803922, 0, 1, 1,
0.8750377, 1.012218, 1.377288, 0.7882353, 0, 1, 1,
0.8772725, 0.03511925, 2.774669, 0.7921569, 0, 1, 1,
0.8784491, -0.1653763, 0.4148105, 0.8, 0, 1, 1,
0.8797615, 3.339897, 1.025274, 0.8078431, 0, 1, 1,
0.8851055, -0.0710707, 3.636943, 0.8117647, 0, 1, 1,
0.8905297, -0.9203704, 3.534501, 0.8196079, 0, 1, 1,
0.8923561, 0.9436391, 0.7969736, 0.8235294, 0, 1, 1,
0.8938629, -0.6083072, 1.355324, 0.8313726, 0, 1, 1,
0.8946474, -1.12063, 2.555663, 0.8352941, 0, 1, 1,
0.9021398, -1.457166, 3.724798, 0.8431373, 0, 1, 1,
0.9040709, 1.126577, -0.3879644, 0.8470588, 0, 1, 1,
0.9157659, 1.422741, 0.1463531, 0.854902, 0, 1, 1,
0.9172829, 0.8269684, 0.2759495, 0.8588235, 0, 1, 1,
0.9246073, -0.2869568, 2.288203, 0.8666667, 0, 1, 1,
0.926041, -0.5372542, 2.070501, 0.8705882, 0, 1, 1,
0.9286867, 0.43809, 2.224864, 0.8784314, 0, 1, 1,
0.9325058, 0.02314181, 1.285455, 0.8823529, 0, 1, 1,
0.9332473, -0.9835674, 2.008938, 0.8901961, 0, 1, 1,
0.9422543, 0.1891796, 0.8565548, 0.8941177, 0, 1, 1,
0.9481087, 0.4091921, 0.4524695, 0.9019608, 0, 1, 1,
0.9504495, -1.278926, 2.981806, 0.9098039, 0, 1, 1,
0.9647327, -0.08577792, 3.031357, 0.9137255, 0, 1, 1,
0.9674558, -0.05331952, 1.316953, 0.9215686, 0, 1, 1,
0.9697995, -0.02226981, 1.683139, 0.9254902, 0, 1, 1,
0.972143, 1.077261, 1.275056, 0.9333333, 0, 1, 1,
0.9734449, 0.8606219, -0.6370153, 0.9372549, 0, 1, 1,
0.9830606, 0.07940074, 1.672912, 0.945098, 0, 1, 1,
0.9848104, 0.1063873, 3.084529, 0.9490196, 0, 1, 1,
0.9950469, -1.155354, 1.443563, 0.9568627, 0, 1, 1,
1.003126, -0.4664805, 1.279085, 0.9607843, 0, 1, 1,
1.004081, -0.5867491, 2.781117, 0.9686275, 0, 1, 1,
1.007117, -0.7290202, 1.570571, 0.972549, 0, 1, 1,
1.030203, -0.4387587, 1.166634, 0.9803922, 0, 1, 1,
1.042041, -0.7235055, 2.223544, 0.9843137, 0, 1, 1,
1.048298, -1.47681, 1.71643, 0.9921569, 0, 1, 1,
1.055204, -0.1608787, 1.933732, 0.9960784, 0, 1, 1,
1.062979, -0.6697654, 0.6896929, 1, 0, 0.9960784, 1,
1.070223, -1.391214, 0.9001632, 1, 0, 0.9882353, 1,
1.071207, -1.711198, 0.6679524, 1, 0, 0.9843137, 1,
1.079147, -0.09875114, 3.237441, 1, 0, 0.9764706, 1,
1.080026, -1.731445, 3.443712, 1, 0, 0.972549, 1,
1.080301, -0.2614885, -0.111263, 1, 0, 0.9647059, 1,
1.08228, -0.2394606, 1.767903, 1, 0, 0.9607843, 1,
1.083145, -2.155206, 2.684661, 1, 0, 0.9529412, 1,
1.090682, 0.0352127, 1.938447, 1, 0, 0.9490196, 1,
1.106212, 0.3016896, 1.554498, 1, 0, 0.9411765, 1,
1.126634, -1.280771, 1.293525, 1, 0, 0.9372549, 1,
1.129582, -0.360845, 0.5584809, 1, 0, 0.9294118, 1,
1.130427, -0.2317612, 1.402423, 1, 0, 0.9254902, 1,
1.13127, 0.2273969, 1.147678, 1, 0, 0.9176471, 1,
1.142417, 0.3465738, 1.7077, 1, 0, 0.9137255, 1,
1.144223, -0.251344, 1.081052, 1, 0, 0.9058824, 1,
1.148757, 0.08291808, 1.600609, 1, 0, 0.9019608, 1,
1.151154, 1.376308, 3.134704, 1, 0, 0.8941177, 1,
1.151796, -0.9174046, 1.028199, 1, 0, 0.8862745, 1,
1.158925, 0.8362991, 1.099309, 1, 0, 0.8823529, 1,
1.160124, -1.179471, 2.729123, 1, 0, 0.8745098, 1,
1.161947, 0.1840812, 0.6890136, 1, 0, 0.8705882, 1,
1.166955, 0.9821175, 0.9305852, 1, 0, 0.8627451, 1,
1.167227, 0.8344951, 0.117896, 1, 0, 0.8588235, 1,
1.174829, -0.3209024, 2.113069, 1, 0, 0.8509804, 1,
1.179058, 0.1611625, 0.8128646, 1, 0, 0.8470588, 1,
1.180634, -0.3947922, 0.7968072, 1, 0, 0.8392157, 1,
1.192186, -0.04728827, 1.593592, 1, 0, 0.8352941, 1,
1.199115, 0.4138305, 1.78319, 1, 0, 0.827451, 1,
1.206264, 1.346378, -0.3352094, 1, 0, 0.8235294, 1,
1.209061, -0.2240452, 1.632115, 1, 0, 0.8156863, 1,
1.214778, -0.1667588, 3.28951, 1, 0, 0.8117647, 1,
1.216508, -0.256922, 2.243832, 1, 0, 0.8039216, 1,
1.219387, 0.05073682, 2.010565, 1, 0, 0.7960784, 1,
1.22338, 1.09184, 0.435893, 1, 0, 0.7921569, 1,
1.224224, -0.1230582, 1.85211, 1, 0, 0.7843137, 1,
1.24153, 1.297784, -0.5282155, 1, 0, 0.7803922, 1,
1.244503, 0.6816539, 1.412076, 1, 0, 0.772549, 1,
1.253375, 0.5107011, 0.44535, 1, 0, 0.7686275, 1,
1.255314, -0.9242756, 2.105182, 1, 0, 0.7607843, 1,
1.272969, 0.5973277, 1.960631, 1, 0, 0.7568628, 1,
1.273183, -0.2167462, 2.919584, 1, 0, 0.7490196, 1,
1.279372, -1.206475, 2.238232, 1, 0, 0.7450981, 1,
1.285693, -0.8922042, 2.891967, 1, 0, 0.7372549, 1,
1.299621, -0.4788794, 2.570273, 1, 0, 0.7333333, 1,
1.305537, 0.01653768, 2.397859, 1, 0, 0.7254902, 1,
1.305573, 0.2950162, 0.7310402, 1, 0, 0.7215686, 1,
1.307563, 1.196534, 0.2316093, 1, 0, 0.7137255, 1,
1.319913, 0.4375949, 0.5802505, 1, 0, 0.7098039, 1,
1.323384, 0.3692247, 0.3983034, 1, 0, 0.7019608, 1,
1.326636, 0.4193066, -0.2324098, 1, 0, 0.6941177, 1,
1.329414, -0.8389937, 1.968036, 1, 0, 0.6901961, 1,
1.338423, -1.224162, 0.3565185, 1, 0, 0.682353, 1,
1.348049, 1.308857, -0.6193416, 1, 0, 0.6784314, 1,
1.353067, 0.1506866, 1.80579, 1, 0, 0.6705883, 1,
1.356146, -0.1145837, 2.076168, 1, 0, 0.6666667, 1,
1.360157, -0.1634676, 1.245586, 1, 0, 0.6588235, 1,
1.360938, 0.3756632, -0.2762284, 1, 0, 0.654902, 1,
1.364135, 0.3793116, 2.270812, 1, 0, 0.6470588, 1,
1.373042, -0.09442487, 2.008479, 1, 0, 0.6431373, 1,
1.373367, -1.500949, 2.981621, 1, 0, 0.6352941, 1,
1.373713, 1.554024, 0.3540504, 1, 0, 0.6313726, 1,
1.37464, -0.1028289, 1.015768, 1, 0, 0.6235294, 1,
1.376605, -1.874593, 2.779322, 1, 0, 0.6196079, 1,
1.378298, 0.09344902, 3.282145, 1, 0, 0.6117647, 1,
1.378308, -0.66289, 1.687792, 1, 0, 0.6078432, 1,
1.393235, -1.131541, 2.780677, 1, 0, 0.6, 1,
1.401304, 1.073792, 1.07403, 1, 0, 0.5921569, 1,
1.406688, -0.4907503, 2.232141, 1, 0, 0.5882353, 1,
1.41264, -0.3273619, 0.7982246, 1, 0, 0.5803922, 1,
1.415577, -0.8405086, 2.816442, 1, 0, 0.5764706, 1,
1.416026, 1.646211, 1.531711, 1, 0, 0.5686275, 1,
1.420921, 0.5677814, 0.9861196, 1, 0, 0.5647059, 1,
1.424397, 0.6954097, -1.251092, 1, 0, 0.5568628, 1,
1.433959, -1.469602, 3.383958, 1, 0, 0.5529412, 1,
1.438306, -0.7394459, 3.839031, 1, 0, 0.5450981, 1,
1.444925, 0.6333845, 0.3113532, 1, 0, 0.5411765, 1,
1.457775, 0.777859, 0.7351217, 1, 0, 0.5333334, 1,
1.458703, 0.3465465, 2.252091, 1, 0, 0.5294118, 1,
1.473204, 0.7037242, 0.2912724, 1, 0, 0.5215687, 1,
1.477195, -0.09706993, 2.209629, 1, 0, 0.5176471, 1,
1.483524, 1.522096, 2.270632, 1, 0, 0.509804, 1,
1.486152, 0.632678, -0.3174422, 1, 0, 0.5058824, 1,
1.493782, -0.8341704, 2.186532, 1, 0, 0.4980392, 1,
1.499251, 2.069415, 0.3200264, 1, 0, 0.4901961, 1,
1.512066, -1.006878, 0.9806378, 1, 0, 0.4862745, 1,
1.524194, 1.826408, 1.430056, 1, 0, 0.4784314, 1,
1.528104, -0.5896219, 3.174313, 1, 0, 0.4745098, 1,
1.529091, -0.4266166, 1.888256, 1, 0, 0.4666667, 1,
1.529184, -0.5036758, 2.243989, 1, 0, 0.4627451, 1,
1.538347, 1.204521, 1.966655, 1, 0, 0.454902, 1,
1.55338, -2.628663, 2.86299, 1, 0, 0.4509804, 1,
1.567448, 0.01707769, 1.043228, 1, 0, 0.4431373, 1,
1.567984, -0.2427132, 1.368816, 1, 0, 0.4392157, 1,
1.572933, 1.670842, 2.013715, 1, 0, 0.4313726, 1,
1.575558, 1.110501, 0.5391577, 1, 0, 0.427451, 1,
1.577863, -0.8750821, 1.075611, 1, 0, 0.4196078, 1,
1.578848, -1.062368, 3.953648, 1, 0, 0.4156863, 1,
1.579214, -1.392825, 1.266653, 1, 0, 0.4078431, 1,
1.580614, -0.7426968, 0.4793839, 1, 0, 0.4039216, 1,
1.588172, -1.859789, 1.230295, 1, 0, 0.3960784, 1,
1.602425, 1.948353, 1.027969, 1, 0, 0.3882353, 1,
1.617877, 1.05977, 1.480181, 1, 0, 0.3843137, 1,
1.619237, -0.2527694, 1.649152, 1, 0, 0.3764706, 1,
1.620195, -0.341975, -0.1523173, 1, 0, 0.372549, 1,
1.62244, 1.608721, 2.511337, 1, 0, 0.3647059, 1,
1.634456, 0.980803, 0.8159727, 1, 0, 0.3607843, 1,
1.682459, 0.8391937, 1.512381, 1, 0, 0.3529412, 1,
1.695554, 0.1098766, 1.741724, 1, 0, 0.3490196, 1,
1.70777, 0.1062714, 0.8097209, 1, 0, 0.3411765, 1,
1.708612, 0.2322535, 2.005599, 1, 0, 0.3372549, 1,
1.712072, 0.7352185, 2.064351, 1, 0, 0.3294118, 1,
1.723204, -1.627051, 2.443474, 1, 0, 0.3254902, 1,
1.725837, 1.47717, 0.2769828, 1, 0, 0.3176471, 1,
1.729333, -1.828273, 2.855291, 1, 0, 0.3137255, 1,
1.743912, -0.3053443, 0.2972916, 1, 0, 0.3058824, 1,
1.76489, 0.7745411, 2.137894, 1, 0, 0.2980392, 1,
1.76985, 1.562909, 1.08703, 1, 0, 0.2941177, 1,
1.784487, -0.8991076, 2.958675, 1, 0, 0.2862745, 1,
1.789628, 0.1781603, 2.127615, 1, 0, 0.282353, 1,
1.790202, -1.517434, 1.608434, 1, 0, 0.2745098, 1,
1.790407, -0.50639, 2.070206, 1, 0, 0.2705882, 1,
1.799168, -0.2720806, 1.664106, 1, 0, 0.2627451, 1,
1.838341, -1.209753, 2.68729, 1, 0, 0.2588235, 1,
1.840848, -0.4566184, 0.5202053, 1, 0, 0.2509804, 1,
1.843348, -0.9576866, 1.841141, 1, 0, 0.2470588, 1,
1.871885, -0.6673681, 2.291171, 1, 0, 0.2392157, 1,
1.877152, 1.041954, 2.563369, 1, 0, 0.2352941, 1,
1.877408, -0.792457, 1.784268, 1, 0, 0.227451, 1,
1.885519, -0.04564259, 1.04955, 1, 0, 0.2235294, 1,
1.895654, -1.609291, 2.111535, 1, 0, 0.2156863, 1,
1.905307, -1.248833, 2.060235, 1, 0, 0.2117647, 1,
1.938981, -1.654752, 3.397062, 1, 0, 0.2039216, 1,
1.969416, 0.4537195, -0.3466962, 1, 0, 0.1960784, 1,
1.972475, -0.2176999, 2.902419, 1, 0, 0.1921569, 1,
1.975239, -1.553211, 3.302389, 1, 0, 0.1843137, 1,
1.993235, 0.846073, 1.313629, 1, 0, 0.1803922, 1,
2.002627, -0.2745525, 0.4286529, 1, 0, 0.172549, 1,
2.011699, 0.03255911, 1.408538, 1, 0, 0.1686275, 1,
2.02729, -1.203021, 2.840494, 1, 0, 0.1607843, 1,
2.03672, 2.595952, 0.06868458, 1, 0, 0.1568628, 1,
2.053531, 0.9184438, 0.03985587, 1, 0, 0.1490196, 1,
2.055408, -0.2507432, 2.624838, 1, 0, 0.145098, 1,
2.059064, 1.196817, 1.314368, 1, 0, 0.1372549, 1,
2.147393, 0.9208486, 1.719017, 1, 0, 0.1333333, 1,
2.170854, 0.5479226, 1.799222, 1, 0, 0.1254902, 1,
2.19126, -0.07498579, -0.1143631, 1, 0, 0.1215686, 1,
2.234322, -1.913825, 2.424361, 1, 0, 0.1137255, 1,
2.254067, -1.891608, 1.68607, 1, 0, 0.1098039, 1,
2.281738, -2.941036, 4.83083, 1, 0, 0.1019608, 1,
2.307129, -0.08664086, 0.02881731, 1, 0, 0.09411765, 1,
2.336375, 1.504828, 3.337904, 1, 0, 0.09019608, 1,
2.35106, -0.4775198, 0.5629434, 1, 0, 0.08235294, 1,
2.443598, -1.058468, 1.830753, 1, 0, 0.07843138, 1,
2.45452, -0.3133358, 2.119105, 1, 0, 0.07058824, 1,
2.467126, 0.02792582, 0.7098239, 1, 0, 0.06666667, 1,
2.534773, -1.706049, 3.571534, 1, 0, 0.05882353, 1,
2.548748, -0.6383198, 2.631829, 1, 0, 0.05490196, 1,
2.552418, 0.1935289, 2.088819, 1, 0, 0.04705882, 1,
2.565492, -1.02825, 1.186142, 1, 0, 0.04313726, 1,
2.613225, 0.252492, 1.658653, 1, 0, 0.03529412, 1,
2.640918, -0.8181522, 2.529927, 1, 0, 0.03137255, 1,
2.742856, 0.5882561, 2.457185, 1, 0, 0.02352941, 1,
2.902261, 0.2010218, 0.9675401, 1, 0, 0.01960784, 1,
3.251455, 1.075371, 2.83328, 1, 0, 0.01176471, 1,
3.484895, -0.7012229, 0.9836438, 1, 0, 0.007843138, 1
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
0.1977938, -4.044543, -7.393983, 0, -0.5, 0.5, 0.5,
0.1977938, -4.044543, -7.393983, 1, -0.5, 0.5, 0.5,
0.1977938, -4.044543, -7.393983, 1, 1.5, 0.5, 0.5,
0.1977938, -4.044543, -7.393983, 0, 1.5, 0.5, 0.5
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
-4.203635, 0.3141453, -7.393983, 0, -0.5, 0.5, 0.5,
-4.203635, 0.3141453, -7.393983, 1, -0.5, 0.5, 0.5,
-4.203635, 0.3141453, -7.393983, 1, 1.5, 0.5, 0.5,
-4.203635, 0.3141453, -7.393983, 0, 1.5, 0.5, 0.5
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
-4.203635, -4.044543, -0.3649423, 0, -0.5, 0.5, 0.5,
-4.203635, -4.044543, -0.3649423, 1, -0.5, 0.5, 0.5,
-4.203635, -4.044543, -0.3649423, 1, 1.5, 0.5, 0.5,
-4.203635, -4.044543, -0.3649423, 0, 1.5, 0.5, 0.5
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
-3, -3.038692, -5.771897,
3, -3.038692, -5.771897,
-3, -3.038692, -5.771897,
-3, -3.206334, -6.042244,
-2, -3.038692, -5.771897,
-2, -3.206334, -6.042244,
-1, -3.038692, -5.771897,
-1, -3.206334, -6.042244,
0, -3.038692, -5.771897,
0, -3.206334, -6.042244,
1, -3.038692, -5.771897,
1, -3.206334, -6.042244,
2, -3.038692, -5.771897,
2, -3.206334, -6.042244,
3, -3.038692, -5.771897,
3, -3.206334, -6.042244
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
-3, -3.541617, -6.58294, 0, -0.5, 0.5, 0.5,
-3, -3.541617, -6.58294, 1, -0.5, 0.5, 0.5,
-3, -3.541617, -6.58294, 1, 1.5, 0.5, 0.5,
-3, -3.541617, -6.58294, 0, 1.5, 0.5, 0.5,
-2, -3.541617, -6.58294, 0, -0.5, 0.5, 0.5,
-2, -3.541617, -6.58294, 1, -0.5, 0.5, 0.5,
-2, -3.541617, -6.58294, 1, 1.5, 0.5, 0.5,
-2, -3.541617, -6.58294, 0, 1.5, 0.5, 0.5,
-1, -3.541617, -6.58294, 0, -0.5, 0.5, 0.5,
-1, -3.541617, -6.58294, 1, -0.5, 0.5, 0.5,
-1, -3.541617, -6.58294, 1, 1.5, 0.5, 0.5,
-1, -3.541617, -6.58294, 0, 1.5, 0.5, 0.5,
0, -3.541617, -6.58294, 0, -0.5, 0.5, 0.5,
0, -3.541617, -6.58294, 1, -0.5, 0.5, 0.5,
0, -3.541617, -6.58294, 1, 1.5, 0.5, 0.5,
0, -3.541617, -6.58294, 0, 1.5, 0.5, 0.5,
1, -3.541617, -6.58294, 0, -0.5, 0.5, 0.5,
1, -3.541617, -6.58294, 1, -0.5, 0.5, 0.5,
1, -3.541617, -6.58294, 1, 1.5, 0.5, 0.5,
1, -3.541617, -6.58294, 0, 1.5, 0.5, 0.5,
2, -3.541617, -6.58294, 0, -0.5, 0.5, 0.5,
2, -3.541617, -6.58294, 1, -0.5, 0.5, 0.5,
2, -3.541617, -6.58294, 1, 1.5, 0.5, 0.5,
2, -3.541617, -6.58294, 0, 1.5, 0.5, 0.5,
3, -3.541617, -6.58294, 0, -0.5, 0.5, 0.5,
3, -3.541617, -6.58294, 1, -0.5, 0.5, 0.5,
3, -3.541617, -6.58294, 1, 1.5, 0.5, 0.5,
3, -3.541617, -6.58294, 0, 1.5, 0.5, 0.5
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
-3.18792, -2, -5.771897,
-3.18792, 3, -5.771897,
-3.18792, -2, -5.771897,
-3.357206, -2, -6.042244,
-3.18792, -1, -5.771897,
-3.357206, -1, -6.042244,
-3.18792, 0, -5.771897,
-3.357206, 0, -6.042244,
-3.18792, 1, -5.771897,
-3.357206, 1, -6.042244,
-3.18792, 2, -5.771897,
-3.357206, 2, -6.042244,
-3.18792, 3, -5.771897,
-3.357206, 3, -6.042244
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
-3.695777, -2, -6.58294, 0, -0.5, 0.5, 0.5,
-3.695777, -2, -6.58294, 1, -0.5, 0.5, 0.5,
-3.695777, -2, -6.58294, 1, 1.5, 0.5, 0.5,
-3.695777, -2, -6.58294, 0, 1.5, 0.5, 0.5,
-3.695777, -1, -6.58294, 0, -0.5, 0.5, 0.5,
-3.695777, -1, -6.58294, 1, -0.5, 0.5, 0.5,
-3.695777, -1, -6.58294, 1, 1.5, 0.5, 0.5,
-3.695777, -1, -6.58294, 0, 1.5, 0.5, 0.5,
-3.695777, 0, -6.58294, 0, -0.5, 0.5, 0.5,
-3.695777, 0, -6.58294, 1, -0.5, 0.5, 0.5,
-3.695777, 0, -6.58294, 1, 1.5, 0.5, 0.5,
-3.695777, 0, -6.58294, 0, 1.5, 0.5, 0.5,
-3.695777, 1, -6.58294, 0, -0.5, 0.5, 0.5,
-3.695777, 1, -6.58294, 1, -0.5, 0.5, 0.5,
-3.695777, 1, -6.58294, 1, 1.5, 0.5, 0.5,
-3.695777, 1, -6.58294, 0, 1.5, 0.5, 0.5,
-3.695777, 2, -6.58294, 0, -0.5, 0.5, 0.5,
-3.695777, 2, -6.58294, 1, -0.5, 0.5, 0.5,
-3.695777, 2, -6.58294, 1, 1.5, 0.5, 0.5,
-3.695777, 2, -6.58294, 0, 1.5, 0.5, 0.5,
-3.695777, 3, -6.58294, 0, -0.5, 0.5, 0.5,
-3.695777, 3, -6.58294, 1, -0.5, 0.5, 0.5,
-3.695777, 3, -6.58294, 1, 1.5, 0.5, 0.5,
-3.695777, 3, -6.58294, 0, 1.5, 0.5, 0.5
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
-3.18792, -3.038692, -4,
-3.18792, -3.038692, 4,
-3.18792, -3.038692, -4,
-3.357206, -3.206334, -4,
-3.18792, -3.038692, -2,
-3.357206, -3.206334, -2,
-3.18792, -3.038692, 0,
-3.357206, -3.206334, 0,
-3.18792, -3.038692, 2,
-3.357206, -3.206334, 2,
-3.18792, -3.038692, 4,
-3.357206, -3.206334, 4
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
-3.695777, -3.541617, -4, 0, -0.5, 0.5, 0.5,
-3.695777, -3.541617, -4, 1, -0.5, 0.5, 0.5,
-3.695777, -3.541617, -4, 1, 1.5, 0.5, 0.5,
-3.695777, -3.541617, -4, 0, 1.5, 0.5, 0.5,
-3.695777, -3.541617, -2, 0, -0.5, 0.5, 0.5,
-3.695777, -3.541617, -2, 1, -0.5, 0.5, 0.5,
-3.695777, -3.541617, -2, 1, 1.5, 0.5, 0.5,
-3.695777, -3.541617, -2, 0, 1.5, 0.5, 0.5,
-3.695777, -3.541617, 0, 0, -0.5, 0.5, 0.5,
-3.695777, -3.541617, 0, 1, -0.5, 0.5, 0.5,
-3.695777, -3.541617, 0, 1, 1.5, 0.5, 0.5,
-3.695777, -3.541617, 0, 0, 1.5, 0.5, 0.5,
-3.695777, -3.541617, 2, 0, -0.5, 0.5, 0.5,
-3.695777, -3.541617, 2, 1, -0.5, 0.5, 0.5,
-3.695777, -3.541617, 2, 1, 1.5, 0.5, 0.5,
-3.695777, -3.541617, 2, 0, 1.5, 0.5, 0.5,
-3.695777, -3.541617, 4, 0, -0.5, 0.5, 0.5,
-3.695777, -3.541617, 4, 1, -0.5, 0.5, 0.5,
-3.695777, -3.541617, 4, 1, 1.5, 0.5, 0.5,
-3.695777, -3.541617, 4, 0, 1.5, 0.5, 0.5
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
-3.18792, -3.038692, -5.771897,
-3.18792, 3.666982, -5.771897,
-3.18792, -3.038692, 5.042012,
-3.18792, 3.666982, 5.042012,
-3.18792, -3.038692, -5.771897,
-3.18792, -3.038692, 5.042012,
-3.18792, 3.666982, -5.771897,
-3.18792, 3.666982, 5.042012,
-3.18792, -3.038692, -5.771897,
3.583508, -3.038692, -5.771897,
-3.18792, -3.038692, 5.042012,
3.583508, -3.038692, 5.042012,
-3.18792, 3.666982, -5.771897,
3.583508, 3.666982, -5.771897,
-3.18792, 3.666982, 5.042012,
3.583508, 3.666982, 5.042012,
3.583508, -3.038692, -5.771897,
3.583508, 3.666982, -5.771897,
3.583508, -3.038692, 5.042012,
3.583508, 3.666982, 5.042012,
3.583508, -3.038692, -5.771897,
3.583508, -3.038692, 5.042012,
3.583508, 3.666982, -5.771897,
3.583508, 3.666982, 5.042012
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
var radius = 7.696714;
var distance = 34.24355;
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
mvMatrix.translate( -0.1977938, -0.3141453, 0.3649423 );
mvMatrix.scale( 1.228963, 1.241014, 0.7695494 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.24355);
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
fenuron<-read.table("fenuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenuron' not found
```

```r
y<-fenuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenuron' not found
```

```r
z<-fenuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenuron' not found
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
-3.089307, -0.2961983, -2.516775, 0, 0, 1, 1, 1,
-2.849761, 0.09879361, -2.720392, 1, 0, 0, 1, 1,
-2.643638, 0.1081083, -0.9234617, 1, 0, 0, 1, 1,
-2.504112, 1.45462, 0.3443528, 1, 0, 0, 1, 1,
-2.446149, -0.6286125, -1.201525, 1, 0, 0, 1, 1,
-2.437191, 0.5430498, 0.03011915, 1, 0, 0, 1, 1,
-2.414746, -0.1882802, -1.916764, 0, 0, 0, 1, 1,
-2.274168, 1.891781, 0.5495816, 0, 0, 0, 1, 1,
-2.270969, -0.6668038, -2.089394, 0, 0, 0, 1, 1,
-2.256182, 2.160829, -1.242068, 0, 0, 0, 1, 1,
-2.240559, 0.6034105, -2.535857, 0, 0, 0, 1, 1,
-2.238054, -1.065446, -2.439775, 0, 0, 0, 1, 1,
-2.2261, -0.465465, -0.05480765, 0, 0, 0, 1, 1,
-2.165128, 0.8635272, -1.895512, 1, 1, 1, 1, 1,
-2.164763, 1.463575, -1.808552, 1, 1, 1, 1, 1,
-2.137124, -2.715249, -1.468022, 1, 1, 1, 1, 1,
-2.086425, 1.176319, -0.8650976, 1, 1, 1, 1, 1,
-2.08372, -1.504068, -1.170384, 1, 1, 1, 1, 1,
-2.037496, 0.8172316, 1.340873, 1, 1, 1, 1, 1,
-2.000966, 0.9938796, 1.103021, 1, 1, 1, 1, 1,
-1.935243, 0.6223781, -0.0218814, 1, 1, 1, 1, 1,
-1.924947, 0.5150855, -1.449206, 1, 1, 1, 1, 1,
-1.879139, -0.02225695, -3.435385, 1, 1, 1, 1, 1,
-1.876894, -0.5945729, -2.632187, 1, 1, 1, 1, 1,
-1.870304, 0.7750688, -1.521479, 1, 1, 1, 1, 1,
-1.860099, -1.114621, -2.122409, 1, 1, 1, 1, 1,
-1.848894, 0.04803411, -2.759908, 1, 1, 1, 1, 1,
-1.848671, 0.218841, -1.455798, 1, 1, 1, 1, 1,
-1.826734, 0.6752433, 0.7193477, 0, 0, 1, 1, 1,
-1.815116, -0.2763133, -2.743116, 1, 0, 0, 1, 1,
-1.812334, -0.4256081, -0.8480285, 1, 0, 0, 1, 1,
-1.811571, -0.4863645, -0.1254887, 1, 0, 0, 1, 1,
-1.788858, -0.07480014, -1.690964, 1, 0, 0, 1, 1,
-1.776208, 0.3403727, 0.4824218, 1, 0, 0, 1, 1,
-1.765042, 1.040842, -0.9380485, 0, 0, 0, 1, 1,
-1.762725, -0.08881849, -2.132859, 0, 0, 0, 1, 1,
-1.726279, -0.6197203, -2.730773, 0, 0, 0, 1, 1,
-1.717959, -0.3167019, -1.559417, 0, 0, 0, 1, 1,
-1.701737, -0.3475496, -2.757457, 0, 0, 0, 1, 1,
-1.677082, -1.03506, 0.00791931, 0, 0, 0, 1, 1,
-1.66957, 1.825332, -1.498435, 0, 0, 0, 1, 1,
-1.669493, 0.145731, -2.997109, 1, 1, 1, 1, 1,
-1.664129, 0.03793501, -1.852021, 1, 1, 1, 1, 1,
-1.648919, -0.9875354, -3.105214, 1, 1, 1, 1, 1,
-1.647007, -0.2793397, -2.262492, 1, 1, 1, 1, 1,
-1.646745, 0.1274277, -1.157347, 1, 1, 1, 1, 1,
-1.642101, -0.3018816, -0.2323365, 1, 1, 1, 1, 1,
-1.626361, -0.07418182, -0.637446, 1, 1, 1, 1, 1,
-1.626125, 0.1770456, -4.556649, 1, 1, 1, 1, 1,
-1.62359, 0.3844211, -0.4007016, 1, 1, 1, 1, 1,
-1.618217, 0.6008691, -0.6217363, 1, 1, 1, 1, 1,
-1.604837, -0.5134843, -0.4501263, 1, 1, 1, 1, 1,
-1.592912, -1.067913, -2.319369, 1, 1, 1, 1, 1,
-1.588302, 0.7715425, -2.163303, 1, 1, 1, 1, 1,
-1.584969, 0.9849754, -1.482495, 1, 1, 1, 1, 1,
-1.582322, 1.082594, -1.151825, 1, 1, 1, 1, 1,
-1.581226, -0.1024637, -0.2208997, 0, 0, 1, 1, 1,
-1.565981, -0.8198103, -2.145479, 1, 0, 0, 1, 1,
-1.561885, 0.4392447, -1.109098, 1, 0, 0, 1, 1,
-1.552767, -0.6509396, -0.5729508, 1, 0, 0, 1, 1,
-1.547032, -1.05645, -1.2323, 1, 0, 0, 1, 1,
-1.543437, -0.6039088, -0.7298758, 1, 0, 0, 1, 1,
-1.541808, -0.4146687, -1.861417, 0, 0, 0, 1, 1,
-1.526895, -0.8257791, -3.607722, 0, 0, 0, 1, 1,
-1.503888, -1.28257, -1.701626, 0, 0, 0, 1, 1,
-1.502905, 1.059934, -2.037048, 0, 0, 0, 1, 1,
-1.500378, -0.8414559, -3.276657, 0, 0, 0, 1, 1,
-1.498167, 0.404028, -1.754425, 0, 0, 0, 1, 1,
-1.494755, 0.2268712, -0.4317092, 0, 0, 0, 1, 1,
-1.489611, 1.287756, 0.5171618, 1, 1, 1, 1, 1,
-1.481915, -1.057157, -2.941651, 1, 1, 1, 1, 1,
-1.480326, -0.7458674, -1.121658, 1, 1, 1, 1, 1,
-1.47881, 0.4693699, -1.397547, 1, 1, 1, 1, 1,
-1.471496, -0.8627474, -2.785954, 1, 1, 1, 1, 1,
-1.461004, 0.9194418, -1.681329, 1, 1, 1, 1, 1,
-1.451823, -0.1576535, -1.536496, 1, 1, 1, 1, 1,
-1.443505, 0.4837039, -1.650857, 1, 1, 1, 1, 1,
-1.440984, -0.8170674, -1.845169, 1, 1, 1, 1, 1,
-1.432441, -0.6732683, -2.756872, 1, 1, 1, 1, 1,
-1.407958, -1.538526, -1.09527, 1, 1, 1, 1, 1,
-1.402977, 1.950333, -0.1541457, 1, 1, 1, 1, 1,
-1.400504, -0.3243906, -3.230049, 1, 1, 1, 1, 1,
-1.398763, -1.800316, -0.986487, 1, 1, 1, 1, 1,
-1.39076, 1.197433, -0.3924011, 1, 1, 1, 1, 1,
-1.376304, 1.333982, 1.463376, 0, 0, 1, 1, 1,
-1.368104, -1.855774, -2.025636, 1, 0, 0, 1, 1,
-1.35675, 1.08996, -0.8251426, 1, 0, 0, 1, 1,
-1.350429, -0.4115426, -1.968331, 1, 0, 0, 1, 1,
-1.339728, -0.06896719, -3.336868, 1, 0, 0, 1, 1,
-1.335966, -0.1673955, -1.684011, 1, 0, 0, 1, 1,
-1.335224, 0.7835255, -1.261462, 0, 0, 0, 1, 1,
-1.330031, -1.522165, -3.789311, 0, 0, 0, 1, 1,
-1.319384, -0.1053772, -2.274804, 0, 0, 0, 1, 1,
-1.316752, 0.3117684, -0.2034208, 0, 0, 0, 1, 1,
-1.300002, 0.9171221, 1.746732, 0, 0, 0, 1, 1,
-1.298987, 0.1582456, -1.145387, 0, 0, 0, 1, 1,
-1.296142, 0.5800461, -2.246277, 0, 0, 0, 1, 1,
-1.290082, 0.725116, 0.6085737, 1, 1, 1, 1, 1,
-1.282397, -0.797673, -2.376448, 1, 1, 1, 1, 1,
-1.276275, -1.989691, -2.886374, 1, 1, 1, 1, 1,
-1.272115, 0.3650207, -0.8521934, 1, 1, 1, 1, 1,
-1.269709, -0.06487969, -2.184159, 1, 1, 1, 1, 1,
-1.263347, -0.7187671, -2.634484, 1, 1, 1, 1, 1,
-1.260288, 1.040727, -0.4947229, 1, 1, 1, 1, 1,
-1.25894, -0.6397594, -3.849383, 1, 1, 1, 1, 1,
-1.258428, 0.7768399, -3.770236, 1, 1, 1, 1, 1,
-1.255213, 2.126877, 0.9404128, 1, 1, 1, 1, 1,
-1.253303, 0.7372803, -0.4189112, 1, 1, 1, 1, 1,
-1.224102, -0.6206177, -1.486719, 1, 1, 1, 1, 1,
-1.22186, -2.386508, -2.945646, 1, 1, 1, 1, 1,
-1.21111, -0.4024661, -3.120393, 1, 1, 1, 1, 1,
-1.201385, 3.569327, 0.5748137, 1, 1, 1, 1, 1,
-1.195758, -2.279849, -2.096765, 0, 0, 1, 1, 1,
-1.183897, 1.678784, -1.312532, 1, 0, 0, 1, 1,
-1.182734, -0.7439971, -1.496133, 1, 0, 0, 1, 1,
-1.174635, 0.7149572, -0.6478379, 1, 0, 0, 1, 1,
-1.169756, 1.340078, -0.02072689, 1, 0, 0, 1, 1,
-1.164769, -0.6417994, -4.198495, 1, 0, 0, 1, 1,
-1.16159, -0.3186672, -2.093286, 0, 0, 0, 1, 1,
-1.160511, 0.08486255, -2.872746, 0, 0, 0, 1, 1,
-1.159743, 0.3878711, -1.377662, 0, 0, 0, 1, 1,
-1.158279, 0.07559331, -1.41794, 0, 0, 0, 1, 1,
-1.155607, 0.5023873, -1.107305, 0, 0, 0, 1, 1,
-1.154496, -0.8052474, -1.985141, 0, 0, 0, 1, 1,
-1.148491, 0.07444403, -0.893172, 0, 0, 0, 1, 1,
-1.143625, -0.7368631, -2.688144, 1, 1, 1, 1, 1,
-1.142799, -1.009801, -1.925235, 1, 1, 1, 1, 1,
-1.137564, -0.3002022, -0.6889929, 1, 1, 1, 1, 1,
-1.126916, -0.5135114, -2.83291, 1, 1, 1, 1, 1,
-1.126807, 1.294885, -1.032635, 1, 1, 1, 1, 1,
-1.1036, 2.020363, -0.1796271, 1, 1, 1, 1, 1,
-1.094458, -0.6982657, -3.04604, 1, 1, 1, 1, 1,
-1.093071, 0.5681173, -1.952298, 1, 1, 1, 1, 1,
-1.075869, -0.9551991, -2.34312, 1, 1, 1, 1, 1,
-1.07182, 0.9970929, -1.841591, 1, 1, 1, 1, 1,
-1.061677, 0.1327184, -2.704967, 1, 1, 1, 1, 1,
-1.056576, -0.110363, -1.046024, 1, 1, 1, 1, 1,
-1.047107, 0.07434193, -1.268354, 1, 1, 1, 1, 1,
-1.046631, -0.3717378, -2.062325, 1, 1, 1, 1, 1,
-1.046305, -0.3433161, -2.987625, 1, 1, 1, 1, 1,
-1.044065, 0.3961547, -1.757516, 0, 0, 1, 1, 1,
-1.043649, 1.073335, -0.2835524, 1, 0, 0, 1, 1,
-1.043112, -1.372836, -2.418015, 1, 0, 0, 1, 1,
-1.042783, -0.6183708, -2.38735, 1, 0, 0, 1, 1,
-1.037916, -1.400799, -2.779658, 1, 0, 0, 1, 1,
-1.022985, -1.009288, -1.713699, 1, 0, 0, 1, 1,
-1.008257, -0.4286058, 0.1919589, 0, 0, 0, 1, 1,
-0.9836291, -1.283787, -4.448345, 0, 0, 0, 1, 1,
-0.9803739, 1.649383, 0.3466972, 0, 0, 0, 1, 1,
-0.9735204, 1.310783, -0.5286116, 0, 0, 0, 1, 1,
-0.968641, 1.290621, -0.9174073, 0, 0, 0, 1, 1,
-0.9685045, 2.035421, -1.001993, 0, 0, 0, 1, 1,
-0.9668318, 0.196601, -0.15803, 0, 0, 0, 1, 1,
-0.9662766, -1.028723, -3.090126, 1, 1, 1, 1, 1,
-0.9629165, 0.2377574, -1.065087, 1, 1, 1, 1, 1,
-0.9467044, -0.3551567, -3.039961, 1, 1, 1, 1, 1,
-0.9416127, -0.3864745, -2.016242, 1, 1, 1, 1, 1,
-0.9412602, 0.9342712, -0.5031571, 1, 1, 1, 1, 1,
-0.9315288, 0.8036235, 0.03087696, 1, 1, 1, 1, 1,
-0.9296958, 0.1894251, -1.622267, 1, 1, 1, 1, 1,
-0.9261374, 0.8529086, -0.3913824, 1, 1, 1, 1, 1,
-0.9233205, 1.082006, -0.5521351, 1, 1, 1, 1, 1,
-0.9184378, -1.187391, -1.70405, 1, 1, 1, 1, 1,
-0.9158517, 1.278432, -2.329976, 1, 1, 1, 1, 1,
-0.9150709, -2.166597, -4.371161, 1, 1, 1, 1, 1,
-0.9145666, -1.728275, -3.226988, 1, 1, 1, 1, 1,
-0.9126354, 1.83787, -2.393578, 1, 1, 1, 1, 1,
-0.9019477, -0.7533204, -2.128702, 1, 1, 1, 1, 1,
-0.8988318, -0.8530949, -2.80075, 0, 0, 1, 1, 1,
-0.8988186, 0.5454021, -0.9188775, 1, 0, 0, 1, 1,
-0.8968994, -1.308056, -5.073688, 1, 0, 0, 1, 1,
-0.8964358, -0.8429742, -1.978899, 1, 0, 0, 1, 1,
-0.8919743, -1.20463, -2.625386, 1, 0, 0, 1, 1,
-0.8880618, 0.1326163, -0.2257613, 1, 0, 0, 1, 1,
-0.8863763, 0.4209559, -3.143522, 0, 0, 0, 1, 1,
-0.8863626, 0.1507518, -2.757411, 0, 0, 0, 1, 1,
-0.8817356, -0.6232192, -2.964739, 0, 0, 0, 1, 1,
-0.870041, -0.6322985, -1.407207, 0, 0, 0, 1, 1,
-0.8686544, 0.3621882, 0.1881654, 0, 0, 0, 1, 1,
-0.8671437, 0.5365313, -1.248811, 0, 0, 0, 1, 1,
-0.864723, 1.642349, -1.159157, 0, 0, 0, 1, 1,
-0.8626669, -0.1334588, -3.668122, 1, 1, 1, 1, 1,
-0.8585871, 0.3403306, -0.1705041, 1, 1, 1, 1, 1,
-0.8583494, -1.73571, -2.381496, 1, 1, 1, 1, 1,
-0.8530465, -0.440899, -4.651779, 1, 1, 1, 1, 1,
-0.8415251, -0.5769971, -3.793532, 1, 1, 1, 1, 1,
-0.8350275, 1.908934, 0.1744834, 1, 1, 1, 1, 1,
-0.8329802, 0.666104, -0.4991777, 1, 1, 1, 1, 1,
-0.8290111, 0.06972598, -1.069915, 1, 1, 1, 1, 1,
-0.8160932, 0.8199341, -2.215927, 1, 1, 1, 1, 1,
-0.8151483, 1.609433, -0.2155201, 1, 1, 1, 1, 1,
-0.8139985, 0.4803159, 0.9323352, 1, 1, 1, 1, 1,
-0.8125829, -0.5693297, -4.354587, 1, 1, 1, 1, 1,
-0.8099272, -0.1104362, -0.3626138, 1, 1, 1, 1, 1,
-0.8094939, -0.5213695, -3.275383, 1, 1, 1, 1, 1,
-0.8031833, 1.412606, 0.8082149, 1, 1, 1, 1, 1,
-0.7996153, 0.0004133909, 0.5676502, 0, 0, 1, 1, 1,
-0.7930842, 0.4023752, -0.2187067, 1, 0, 0, 1, 1,
-0.789211, 0.04876978, 0.6109976, 1, 0, 0, 1, 1,
-0.7884187, -0.9657481, -3.198584, 1, 0, 0, 1, 1,
-0.7851778, 0.7469128, -2.771761, 1, 0, 0, 1, 1,
-0.7843566, -0.8130196, -3.12637, 1, 0, 0, 1, 1,
-0.7827585, -1.048274, -4.334276, 0, 0, 0, 1, 1,
-0.7816299, -0.02770942, -1.727065, 0, 0, 0, 1, 1,
-0.7736426, -0.406296, -3.187754, 0, 0, 0, 1, 1,
-0.7729437, -1.065242, -1.645621, 0, 0, 0, 1, 1,
-0.7710015, -1.325526, -2.850198, 0, 0, 0, 1, 1,
-0.7683391, 1.202212, 2.551589, 0, 0, 0, 1, 1,
-0.7602482, 0.3853401, -1.116624, 0, 0, 0, 1, 1,
-0.7582515, 0.6751311, -2.755411, 1, 1, 1, 1, 1,
-0.7580932, 0.545339, -2.57284, 1, 1, 1, 1, 1,
-0.7501802, 0.3397582, 0.7030433, 1, 1, 1, 1, 1,
-0.7488919, -2.424511, -3.643946, 1, 1, 1, 1, 1,
-0.7401389, 0.01164783, -1.137989, 1, 1, 1, 1, 1,
-0.7347064, -0.1436471, -2.689951, 1, 1, 1, 1, 1,
-0.7284179, 0.1267903, -0.8461496, 1, 1, 1, 1, 1,
-0.7177738, 1.15824, -0.7679155, 1, 1, 1, 1, 1,
-0.7163932, 1.185613, -0.446688, 1, 1, 1, 1, 1,
-0.7158811, -0.2221735, -0.7026062, 1, 1, 1, 1, 1,
-0.7147164, -0.05396328, -1.902424, 1, 1, 1, 1, 1,
-0.7143933, 0.3328126, -0.6610498, 1, 1, 1, 1, 1,
-0.714359, 0.3897484, -1.478587, 1, 1, 1, 1, 1,
-0.7124385, 0.7464654, 0.3172027, 1, 1, 1, 1, 1,
-0.7104475, 0.4468181, -0.5775933, 1, 1, 1, 1, 1,
-0.7014332, -0.6433836, -2.62586, 0, 0, 1, 1, 1,
-0.7002425, -0.7894525, -2.429278, 1, 0, 0, 1, 1,
-0.6903629, 1.536513, -1.075502, 1, 0, 0, 1, 1,
-0.6886419, 1.671584, -0.274756, 1, 0, 0, 1, 1,
-0.6815057, 1.10344, -1.140765, 1, 0, 0, 1, 1,
-0.6804134, -0.840408, -0.5547718, 1, 0, 0, 1, 1,
-0.6733151, 3.425219, -1.234529, 0, 0, 0, 1, 1,
-0.6694515, 1.873799, -1.845128, 0, 0, 0, 1, 1,
-0.6675393, 0.9323876, 0.2288554, 0, 0, 0, 1, 1,
-0.6673942, -0.4779158, -1.74662, 0, 0, 0, 1, 1,
-0.6639711, -0.6353553, -1.357686, 0, 0, 0, 1, 1,
-0.6632749, 0.5058016, -1.221145, 0, 0, 0, 1, 1,
-0.662338, -0.8523275, -1.863997, 0, 0, 0, 1, 1,
-0.6537679, -1.845684, -3.823447, 1, 1, 1, 1, 1,
-0.6474067, 0.3694181, -2.567066, 1, 1, 1, 1, 1,
-0.6451713, -0.3567014, -4.619985, 1, 1, 1, 1, 1,
-0.6439149, -1.125529, -2.702442, 1, 1, 1, 1, 1,
-0.6343019, 1.456329, 0.3982851, 1, 1, 1, 1, 1,
-0.6304871, 1.117716, -2.436717, 1, 1, 1, 1, 1,
-0.625659, -0.1246345, -0.7422268, 1, 1, 1, 1, 1,
-0.6177776, 0.85375, -0.2453963, 1, 1, 1, 1, 1,
-0.6102406, -0.7992607, -3.326397, 1, 1, 1, 1, 1,
-0.60829, -1.713759, -1.876481, 1, 1, 1, 1, 1,
-0.6049004, -1.014707, -2.993342, 1, 1, 1, 1, 1,
-0.6042827, 0.1794152, -2.799657, 1, 1, 1, 1, 1,
-0.6021429, -0.9602631, -1.577027, 1, 1, 1, 1, 1,
-0.5987385, 0.4370327, -0.5891395, 1, 1, 1, 1, 1,
-0.5977894, -0.4547499, -2.244967, 1, 1, 1, 1, 1,
-0.5950841, -0.2464075, -2.307504, 0, 0, 1, 1, 1,
-0.5950517, 0.6918361, -0.6543756, 1, 0, 0, 1, 1,
-0.5925619, 0.3060797, 1.015915, 1, 0, 0, 1, 1,
-0.5903669, 1.404834, -0.6880032, 1, 0, 0, 1, 1,
-0.5803267, -0.3942425, -1.187161, 1, 0, 0, 1, 1,
-0.5797083, 1.167115, -0.630893, 1, 0, 0, 1, 1,
-0.5795417, -0.2096817, -2.523694, 0, 0, 0, 1, 1,
-0.5783994, 0.7819036, -0.3907694, 0, 0, 0, 1, 1,
-0.5764862, 1.036178, -0.8144761, 0, 0, 0, 1, 1,
-0.5732229, 1.842242, -0.7782291, 0, 0, 0, 1, 1,
-0.5718676, -0.7779116, -3.651113, 0, 0, 0, 1, 1,
-0.5710913, -1.362598, -3.538991, 0, 0, 0, 1, 1,
-0.5675679, 0.2070763, -0.8548987, 0, 0, 0, 1, 1,
-0.5630163, -0.05936649, 0.6956199, 1, 1, 1, 1, 1,
-0.5626944, -1.005428, -1.832124, 1, 1, 1, 1, 1,
-0.5593399, -0.1815847, -3.039377, 1, 1, 1, 1, 1,
-0.5580484, 0.6226841, -0.8639519, 1, 1, 1, 1, 1,
-0.5566841, 0.3200152, -1.439446, 1, 1, 1, 1, 1,
-0.5532418, 0.793765, 0.8613454, 1, 1, 1, 1, 1,
-0.5384162, -0.7006618, -1.096495, 1, 1, 1, 1, 1,
-0.5367701, -0.7755494, -3.326758, 1, 1, 1, 1, 1,
-0.5367471, -1.20654, -1.553632, 1, 1, 1, 1, 1,
-0.5298716, -1.673182, -2.690856, 1, 1, 1, 1, 1,
-0.5295886, -0.6516996, -2.124657, 1, 1, 1, 1, 1,
-0.5184857, -0.4125001, -3.634703, 1, 1, 1, 1, 1,
-0.5101867, -0.5205268, -2.684578, 1, 1, 1, 1, 1,
-0.5096721, -0.182309, -1.76592, 1, 1, 1, 1, 1,
-0.5095527, 0.008393763, -1.8503, 1, 1, 1, 1, 1,
-0.5092132, 0.3731064, -0.2751599, 0, 0, 1, 1, 1,
-0.5070997, -0.1523368, -1.056777, 1, 0, 0, 1, 1,
-0.5062069, 0.3236148, -1.589956, 1, 0, 0, 1, 1,
-0.5041929, 0.5663168, -1.124864, 1, 0, 0, 1, 1,
-0.5028408, 0.3174448, -1.618783, 1, 0, 0, 1, 1,
-0.5006241, 0.5224637, -1.871225, 1, 0, 0, 1, 1,
-0.4923343, 1.335282, 1.822628, 0, 0, 0, 1, 1,
-0.4895737, 1.045677, 1.23556, 0, 0, 0, 1, 1,
-0.4883153, 1.026308, -1.809392, 0, 0, 0, 1, 1,
-0.487048, -0.3735176, -2.688496, 0, 0, 0, 1, 1,
-0.4863171, 0.7666818, -1.614467, 0, 0, 0, 1, 1,
-0.4793001, -0.08770924, -1.685939, 0, 0, 0, 1, 1,
-0.4687636, -1.364667, -2.186885, 0, 0, 0, 1, 1,
-0.4685764, -1.03074, -2.46191, 1, 1, 1, 1, 1,
-0.4674477, 0.2984908, -2.021981, 1, 1, 1, 1, 1,
-0.4654181, -0.4268318, -3.479479, 1, 1, 1, 1, 1,
-0.4620267, -1.493911, -1.894541, 1, 1, 1, 1, 1,
-0.4616873, 0.9044973, 0.9069723, 1, 1, 1, 1, 1,
-0.4613529, 0.7199773, -0.3816628, 1, 1, 1, 1, 1,
-0.4534002, -0.7532941, -4.375253, 1, 1, 1, 1, 1,
-0.4521647, -0.02384514, -1.279587, 1, 1, 1, 1, 1,
-0.4363345, 0.1267999, 0.3050122, 1, 1, 1, 1, 1,
-0.4356349, 0.558332, -0.8011004, 1, 1, 1, 1, 1,
-0.4348388, 0.05214101, -1.639919, 1, 1, 1, 1, 1,
-0.4280823, -1.351844, -2.802646, 1, 1, 1, 1, 1,
-0.4249898, 1.555279, 0.2170432, 1, 1, 1, 1, 1,
-0.4144189, -0.04479007, -0.8423975, 1, 1, 1, 1, 1,
-0.41282, 1.168513, -0.1420828, 1, 1, 1, 1, 1,
-0.4128146, -1.380423, -1.064555, 0, 0, 1, 1, 1,
-0.4074772, -0.155882, -3.995866, 1, 0, 0, 1, 1,
-0.4073515, -1.06086, -2.818216, 1, 0, 0, 1, 1,
-0.4065195, 0.5594196, -0.3486882, 1, 0, 0, 1, 1,
-0.4058391, 1.22615, -2.282056, 1, 0, 0, 1, 1,
-0.4052603, -1.848337, -2.143872, 1, 0, 0, 1, 1,
-0.40231, 1.316206, -1.004669, 0, 0, 0, 1, 1,
-0.4001195, 0.7470279, -2.582123, 0, 0, 0, 1, 1,
-0.3990732, -1.002347, -2.948753, 0, 0, 0, 1, 1,
-0.3956924, -0.6555198, -1.736027, 0, 0, 0, 1, 1,
-0.3938172, 0.0602588, -1.722568, 0, 0, 0, 1, 1,
-0.3915637, -1.311378, -3.035741, 0, 0, 0, 1, 1,
-0.3877118, -0.1731047, -2.243634, 0, 0, 0, 1, 1,
-0.3852921, 1.412037, 0.7648646, 1, 1, 1, 1, 1,
-0.3849932, 0.7372992, 0.4880119, 1, 1, 1, 1, 1,
-0.3833757, 1.48121, -0.0607183, 1, 1, 1, 1, 1,
-0.3825967, 0.7649468, -1.964107, 1, 1, 1, 1, 1,
-0.3807421, -1.114721, -2.144728, 1, 1, 1, 1, 1,
-0.3784502, -1.982437, -3.317138, 1, 1, 1, 1, 1,
-0.3724093, 0.1336805, -3.733301, 1, 1, 1, 1, 1,
-0.3712007, 1.193031, 0.709741, 1, 1, 1, 1, 1,
-0.3699428, 0.4051423, 0.3039063, 1, 1, 1, 1, 1,
-0.3688963, -0.3618453, -2.361241, 1, 1, 1, 1, 1,
-0.3614804, 0.150888, -1.989578, 1, 1, 1, 1, 1,
-0.361305, -0.3818577, -2.487295, 1, 1, 1, 1, 1,
-0.3532375, 1.163976, -0.3757401, 1, 1, 1, 1, 1,
-0.3528345, 0.8918776, -1.425425, 1, 1, 1, 1, 1,
-0.3527424, 0.7685243, -0.4353139, 1, 1, 1, 1, 1,
-0.351749, -1.056368, -3.351023, 0, 0, 1, 1, 1,
-0.3446698, 0.07892376, -0.8655035, 1, 0, 0, 1, 1,
-0.3436345, -1.08294, -3.516627, 1, 0, 0, 1, 1,
-0.3430435, -0.5722721, -3.114915, 1, 0, 0, 1, 1,
-0.3425614, 1.323309, -0.9340553, 1, 0, 0, 1, 1,
-0.3414142, -0.01421716, -1.662845, 1, 0, 0, 1, 1,
-0.3351117, -0.4848582, -4.770758, 0, 0, 0, 1, 1,
-0.3287163, 1.049953, -0.7764127, 0, 0, 0, 1, 1,
-0.3276094, -0.1687561, -3.302692, 0, 0, 0, 1, 1,
-0.3242417, -1.469913, -2.963039, 0, 0, 0, 1, 1,
-0.3235011, -1.601474, -2.904924, 0, 0, 0, 1, 1,
-0.3200471, -1.691074, -2.557753, 0, 0, 0, 1, 1,
-0.3175821, -0.7165077, -1.611609, 0, 0, 0, 1, 1,
-0.3155018, 0.412956, -1.049634, 1, 1, 1, 1, 1,
-0.3153701, -0.7813686, -3.11044, 1, 1, 1, 1, 1,
-0.308219, 1.007432, -1.13056, 1, 1, 1, 1, 1,
-0.3078957, -0.5257229, -4.902107, 1, 1, 1, 1, 1,
-0.3059327, 0.3222884, 1.475937, 1, 1, 1, 1, 1,
-0.3034774, -0.7820536, -1.824224, 1, 1, 1, 1, 1,
-0.3025305, -0.4135986, -3.175654, 1, 1, 1, 1, 1,
-0.3017273, -0.160465, -2.325207, 1, 1, 1, 1, 1,
-0.3002458, 1.164225, 1.096612, 1, 1, 1, 1, 1,
-0.297419, 0.5415609, -1.736759, 1, 1, 1, 1, 1,
-0.2919823, -1.814522, -2.157664, 1, 1, 1, 1, 1,
-0.2912824, 1.124437, -0.01712367, 1, 1, 1, 1, 1,
-0.2829728, 0.6774703, -1.286638, 1, 1, 1, 1, 1,
-0.2812218, 0.9793739, 1.377863, 1, 1, 1, 1, 1,
-0.2783197, 0.4798572, -0.9896286, 1, 1, 1, 1, 1,
-0.2770125, 1.618707, 1.139052, 0, 0, 1, 1, 1,
-0.2760701, -0.1259196, -1.964748, 1, 0, 0, 1, 1,
-0.2729613, 0.08307967, -0.3062344, 1, 0, 0, 1, 1,
-0.2715682, -0.6629621, -3.690837, 1, 0, 0, 1, 1,
-0.2712873, 1.437933, 0.407264, 1, 0, 0, 1, 1,
-0.2611762, -0.7912605, -1.861588, 1, 0, 0, 1, 1,
-0.2608487, 1.080012, 0.8317035, 0, 0, 0, 1, 1,
-0.2567905, 0.1941709, -0.08899495, 0, 0, 0, 1, 1,
-0.255493, 1.505082, -0.2971002, 0, 0, 0, 1, 1,
-0.249495, 0.0872203, 1.300494, 0, 0, 0, 1, 1,
-0.2438526, 0.5785135, -1.187132, 0, 0, 0, 1, 1,
-0.2401237, -0.8320501, -2.551641, 0, 0, 0, 1, 1,
-0.2376965, 1.107296, -0.4473202, 0, 0, 0, 1, 1,
-0.2360663, 3.052281, 0.4033912, 1, 1, 1, 1, 1,
-0.2356584, -0.1452553, -1.123164, 1, 1, 1, 1, 1,
-0.2342869, -1.134888, -5.614413, 1, 1, 1, 1, 1,
-0.2324969, -1.36604, -2.876611, 1, 1, 1, 1, 1,
-0.232174, 0.5071015, 0.3003474, 1, 1, 1, 1, 1,
-0.2309601, 0.652581, -0.4586877, 1, 1, 1, 1, 1,
-0.2283789, -0.873422, -3.259269, 1, 1, 1, 1, 1,
-0.2261375, 1.313398, 0.3150333, 1, 1, 1, 1, 1,
-0.2257318, -0.0638928, -1.10992, 1, 1, 1, 1, 1,
-0.2221435, 0.01196176, -2.173301, 1, 1, 1, 1, 1,
-0.2172269, 1.016473, 0.03434381, 1, 1, 1, 1, 1,
-0.2154156, 1.604056, -0.8140337, 1, 1, 1, 1, 1,
-0.2127027, 1.209536, -0.07939303, 1, 1, 1, 1, 1,
-0.2106447, 0.6749484, -1.388098, 1, 1, 1, 1, 1,
-0.2080061, 0.1971171, -2.085642, 1, 1, 1, 1, 1,
-0.2073738, -0.8741848, -3.027776, 0, 0, 1, 1, 1,
-0.2044919, -0.3235188, -3.284552, 1, 0, 0, 1, 1,
-0.197867, 0.8078015, -0.5844025, 1, 0, 0, 1, 1,
-0.1924115, 0.5449002, 0.1471463, 1, 0, 0, 1, 1,
-0.1908829, 0.1575504, 0.1493992, 1, 0, 0, 1, 1,
-0.1892636, -0.07073404, -2.173015, 1, 0, 0, 1, 1,
-0.1880019, -0.7226652, -2.103177, 0, 0, 0, 1, 1,
-0.1853007, -1.665523, -2.795425, 0, 0, 0, 1, 1,
-0.1787185, 0.9677008, -0.783973, 0, 0, 0, 1, 1,
-0.1777059, 0.5934934, -0.1764915, 0, 0, 0, 1, 1,
-0.1752624, -1.847654, -4.068703, 0, 0, 0, 1, 1,
-0.1745009, -0.9398324, -4.294282, 0, 0, 0, 1, 1,
-0.1736003, 1.238676, -1.414373, 0, 0, 0, 1, 1,
-0.1703728, 1.207671, 0.1473559, 1, 1, 1, 1, 1,
-0.1622731, 0.3980317, -0.3202886, 1, 1, 1, 1, 1,
-0.1618157, -0.4560114, -4.177019, 1, 1, 1, 1, 1,
-0.1615943, -0.3360606, -2.936403, 1, 1, 1, 1, 1,
-0.1583434, -0.1956499, -2.819333, 1, 1, 1, 1, 1,
-0.1578476, 1.114023, -1.152408, 1, 1, 1, 1, 1,
-0.1556739, 1.526606, 0.3906661, 1, 1, 1, 1, 1,
-0.1550009, 2.488761, 0.6533086, 1, 1, 1, 1, 1,
-0.1541414, -0.6483154, -2.301311, 1, 1, 1, 1, 1,
-0.1529853, 0.7039853, -0.5710805, 1, 1, 1, 1, 1,
-0.1474464, 0.2206319, 0.9775271, 1, 1, 1, 1, 1,
-0.1456286, -1.972698, -1.758296, 1, 1, 1, 1, 1,
-0.14502, -0.2509439, -3.638582, 1, 1, 1, 1, 1,
-0.1441649, -0.2065312, -1.655042, 1, 1, 1, 1, 1,
-0.1417352, 2.426729, -0.3100452, 1, 1, 1, 1, 1,
-0.1407052, 0.4859506, -0.3949931, 0, 0, 1, 1, 1,
-0.1383674, 1.352116, -0.07064459, 1, 0, 0, 1, 1,
-0.1374528, -0.1842364, -2.06058, 1, 0, 0, 1, 1,
-0.1347295, 1.194073, -1.091685, 1, 0, 0, 1, 1,
-0.132912, 0.189514, -1.253936, 1, 0, 0, 1, 1,
-0.1283723, -1.682232, -3.224585, 1, 0, 0, 1, 1,
-0.1265451, -0.579476, -1.825579, 0, 0, 0, 1, 1,
-0.1262215, -0.9919756, -3.743333, 0, 0, 0, 1, 1,
-0.1160847, -1.538631, -3.271158, 0, 0, 0, 1, 1,
-0.1153297, 0.3552482, -0.5619143, 0, 0, 0, 1, 1,
-0.1144833, 0.1707539, -1.521638, 0, 0, 0, 1, 1,
-0.1064121, -0.519555, -4.495416, 0, 0, 0, 1, 1,
-0.1060969, -0.05972486, -1.296972, 0, 0, 0, 1, 1,
-0.1033294, -1.21697, -2.194381, 1, 1, 1, 1, 1,
-0.09537421, -0.6294882, -2.553181, 1, 1, 1, 1, 1,
-0.08850113, 0.01580368, -1.466928, 1, 1, 1, 1, 1,
-0.08798828, -0.9387411, -1.460236, 1, 1, 1, 1, 1,
-0.0857418, 0.4219497, -0.8470017, 1, 1, 1, 1, 1,
-0.08454822, 0.486749, -0.7693403, 1, 1, 1, 1, 1,
-0.08298261, -0.9886842, -2.766821, 1, 1, 1, 1, 1,
-0.08221906, 0.1343494, -1.270646, 1, 1, 1, 1, 1,
-0.08211046, 0.1474037, 0.1294756, 1, 1, 1, 1, 1,
-0.0781658, 1.069029, -0.3890632, 1, 1, 1, 1, 1,
-0.07284913, -0.217752, -3.121647, 1, 1, 1, 1, 1,
-0.07012241, 1.827197, 0.9363803, 1, 1, 1, 1, 1,
-0.07008442, 0.4733398, -0.2191048, 1, 1, 1, 1, 1,
-0.0690398, 1.154714, -0.589874, 1, 1, 1, 1, 1,
-0.06887265, 1.443455, 0.6842173, 1, 1, 1, 1, 1,
-0.0685025, 0.07176197, -0.6932035, 0, 0, 1, 1, 1,
-0.06787867, 0.2110104, -1.689266, 1, 0, 0, 1, 1,
-0.0675266, 1.109075, -0.3999156, 1, 0, 0, 1, 1,
-0.06248495, 0.2685352, -1.306268, 1, 0, 0, 1, 1,
-0.05805499, 0.2810688, 0.4869349, 1, 0, 0, 1, 1,
-0.05770539, -0.7503555, -3.600922, 1, 0, 0, 1, 1,
-0.05545799, 1.301739, 0.8734669, 0, 0, 0, 1, 1,
-0.05503649, 0.7983755, 0.8175336, 0, 0, 0, 1, 1,
-0.05481271, 0.3858293, -0.2843545, 0, 0, 0, 1, 1,
-0.05336457, 2.203434, 1.406676, 0, 0, 0, 1, 1,
-0.05143235, -0.2192683, -1.709526, 0, 0, 0, 1, 1,
-0.05054091, -1.12191, -2.740405, 0, 0, 0, 1, 1,
-0.05032253, 1.008812, -1.678631, 0, 0, 0, 1, 1,
-0.05016625, 1.182717, 0.1827243, 1, 1, 1, 1, 1,
-0.04806246, -0.6087325, -2.929685, 1, 1, 1, 1, 1,
-0.04371962, 0.07943748, -1.567716, 1, 1, 1, 1, 1,
-0.04281623, -0.4973025, -4.520606, 1, 1, 1, 1, 1,
-0.039668, 0.1008127, 1.94695, 1, 1, 1, 1, 1,
-0.03546704, 1.021315, -0.3185199, 1, 1, 1, 1, 1,
-0.03455302, -0.5269463, -2.283845, 1, 1, 1, 1, 1,
-0.03433459, -0.8049171, -3.713204, 1, 1, 1, 1, 1,
-0.03422046, -0.2435804, -3.320929, 1, 1, 1, 1, 1,
-0.03420241, -0.2954234, -2.679306, 1, 1, 1, 1, 1,
-0.03334443, -0.5230146, -3.76943, 1, 1, 1, 1, 1,
-0.03051929, -0.7229671, -3.267876, 1, 1, 1, 1, 1,
-0.02570179, -1.616032, -2.621464, 1, 1, 1, 1, 1,
-0.02412171, 1.406837, 0.3808658, 1, 1, 1, 1, 1,
-0.02150533, 1.373087, 0.3248518, 1, 1, 1, 1, 1,
-0.01775621, 0.3112971, 0.6112581, 0, 0, 1, 1, 1,
-0.01554473, -1.239414, -4.031447, 1, 0, 0, 1, 1,
-0.01553358, 0.06421261, 1.41449, 1, 0, 0, 1, 1,
-0.01458367, -0.2100936, -1.063452, 1, 0, 0, 1, 1,
-0.01440249, 0.2677212, 0.3837988, 1, 0, 0, 1, 1,
-0.01362545, 0.7590287, 0.03203841, 1, 0, 0, 1, 1,
-0.01194134, 0.1925222, 0.8642853, 0, 0, 0, 1, 1,
-0.01193106, -0.5097672, -4.733127, 0, 0, 0, 1, 1,
-0.007228405, 0.1771106, -0.5516347, 0, 0, 0, 1, 1,
-0.007012217, -0.1339945, -3.689867, 0, 0, 0, 1, 1,
-0.00368914, 0.6315246, 1.07085, 0, 0, 0, 1, 1,
-0.001002166, -2.123144, -3.261433, 0, 0, 0, 1, 1,
-0.0008767195, -0.1330308, -2.894183, 0, 0, 0, 1, 1,
-4.916858e-05, -0.987472, -2.761198, 1, 1, 1, 1, 1,
0.0009740486, 1.80831, 0.2385671, 1, 1, 1, 1, 1,
0.003719072, -0.2190976, 3.213386, 1, 1, 1, 1, 1,
0.005129458, 0.1804235, 0.4566066, 1, 1, 1, 1, 1,
0.006299395, 1.292073, -0.3769898, 1, 1, 1, 1, 1,
0.007304142, -1.102636, 3.506672, 1, 1, 1, 1, 1,
0.007894878, 1.436978, -0.5896633, 1, 1, 1, 1, 1,
0.008686043, -0.1698124, 2.394438, 1, 1, 1, 1, 1,
0.01294476, 0.5143657, -0.2180397, 1, 1, 1, 1, 1,
0.01660337, 0.6730501, -0.273007, 1, 1, 1, 1, 1,
0.01830101, 1.005168, -0.6797879, 1, 1, 1, 1, 1,
0.01853992, -0.459648, 3.63082, 1, 1, 1, 1, 1,
0.01882147, -0.9083655, 3.543422, 1, 1, 1, 1, 1,
0.01998051, -0.2544256, 3.263313, 1, 1, 1, 1, 1,
0.0211043, 0.7925029, 0.6396434, 1, 1, 1, 1, 1,
0.02656524, -1.750854, 2.384912, 0, 0, 1, 1, 1,
0.03344063, -1.921053, 3.458178, 1, 0, 0, 1, 1,
0.03617187, -0.8711535, 3.009673, 1, 0, 0, 1, 1,
0.04327166, 0.4896633, -1.581644, 1, 0, 0, 1, 1,
0.04385501, 0.7421327, 1.286113, 1, 0, 0, 1, 1,
0.04937499, -0.6543773, 2.148604, 1, 0, 0, 1, 1,
0.05305456, -0.007328236, -0.438992, 0, 0, 0, 1, 1,
0.05692998, 1.851962, -0.8990179, 0, 0, 0, 1, 1,
0.06872918, 0.5830172, 1.615566, 0, 0, 0, 1, 1,
0.06893659, -2.807583, 3.934235, 0, 0, 0, 1, 1,
0.07109962, -0.9189005, 1.860668, 0, 0, 0, 1, 1,
0.07512988, -0.1169823, 2.929023, 0, 0, 0, 1, 1,
0.07698715, -0.6262634, 3.325595, 0, 0, 0, 1, 1,
0.0772415, 2.632066, -0.6717474, 1, 1, 1, 1, 1,
0.08159577, -0.5811576, 1.314505, 1, 1, 1, 1, 1,
0.08443152, 0.0558594, -0.001600577, 1, 1, 1, 1, 1,
0.08458303, -0.2089861, 2.622118, 1, 1, 1, 1, 1,
0.0874001, -1.379171, 2.708995, 1, 1, 1, 1, 1,
0.08807445, -0.9786322, 3.801539, 1, 1, 1, 1, 1,
0.08812723, 0.2406798, 0.3474828, 1, 1, 1, 1, 1,
0.08891006, 2.348788, -0.8072667, 1, 1, 1, 1, 1,
0.08956081, 0.5506425, 1.105542, 1, 1, 1, 1, 1,
0.08981477, -0.1419414, 2.046243, 1, 1, 1, 1, 1,
0.09001442, 0.6687646, -0.7575362, 1, 1, 1, 1, 1,
0.09029872, 0.1039823, 1.851533, 1, 1, 1, 1, 1,
0.09417608, -0.1853315, 2.204337, 1, 1, 1, 1, 1,
0.09700848, 0.6513564, 0.03776019, 1, 1, 1, 1, 1,
0.09915634, -0.0006503721, 2.223725, 1, 1, 1, 1, 1,
0.1022483, -0.1460512, 2.396384, 0, 0, 1, 1, 1,
0.103214, -0.8934104, 2.985882, 1, 0, 0, 1, 1,
0.1060407, -0.4900791, 2.420288, 1, 0, 0, 1, 1,
0.1068555, -0.2615631, 3.671525, 1, 0, 0, 1, 1,
0.109114, 0.06533958, 2.228918, 1, 0, 0, 1, 1,
0.1112417, -0.3266668, 1.712828, 1, 0, 0, 1, 1,
0.1132151, -0.762745, 1.876339, 0, 0, 0, 1, 1,
0.1169479, -0.9339315, 2.146118, 0, 0, 0, 1, 1,
0.1187371, 0.6845189, 1.572905, 0, 0, 0, 1, 1,
0.121964, -0.8761376, 3.339115, 0, 0, 0, 1, 1,
0.1306782, 0.8610497, -0.4021253, 0, 0, 0, 1, 1,
0.1329834, -0.4160006, 4.46869, 0, 0, 0, 1, 1,
0.134475, 0.5929078, 0.1768289, 0, 0, 0, 1, 1,
0.1375162, -0.08246321, 2.086703, 1, 1, 1, 1, 1,
0.1391147, 0.08012439, 1.056421, 1, 1, 1, 1, 1,
0.141017, 1.257654, -0.6324306, 1, 1, 1, 1, 1,
0.1421342, 0.5444432, 0.1177465, 1, 1, 1, 1, 1,
0.1428066, -0.1672691, 4.884528, 1, 1, 1, 1, 1,
0.1510303, -0.278656, 2.304814, 1, 1, 1, 1, 1,
0.151161, -1.962429, 3.552936, 1, 1, 1, 1, 1,
0.1515148, 0.2431309, 2.030638, 1, 1, 1, 1, 1,
0.1581336, -0.1780254, 2.325626, 1, 1, 1, 1, 1,
0.1590586, 0.2114688, 1.072579, 1, 1, 1, 1, 1,
0.159911, 0.6526009, 0.9954025, 1, 1, 1, 1, 1,
0.1616975, -2.276274, 3.062063, 1, 1, 1, 1, 1,
0.1651888, -0.9465249, 3.374704, 1, 1, 1, 1, 1,
0.1667004, -0.6091929, 2.755468, 1, 1, 1, 1, 1,
0.1733222, 0.955465, 1.001554, 1, 1, 1, 1, 1,
0.1741303, -0.7847322, 3.017569, 0, 0, 1, 1, 1,
0.1773983, 0.8413427, 0.5554355, 1, 0, 0, 1, 1,
0.1784503, 0.3743799, 0.5716213, 1, 0, 0, 1, 1,
0.1877124, -1.164289, 3.029512, 1, 0, 0, 1, 1,
0.1900204, -0.7335765, 1.886064, 1, 0, 0, 1, 1,
0.1924866, -0.3383385, 0.9016529, 1, 0, 0, 1, 1,
0.1935507, 0.4268234, 0.9080732, 0, 0, 0, 1, 1,
0.1935854, -0.5012671, 2.90542, 0, 0, 0, 1, 1,
0.1956104, -0.1428174, 1.240636, 0, 0, 0, 1, 1,
0.195954, 2.255253, -2.345665, 0, 0, 0, 1, 1,
0.2005688, -1.149606, 2.160467, 0, 0, 0, 1, 1,
0.2022955, -1.285181, 3.754989, 0, 0, 0, 1, 1,
0.2109833, 0.6462076, 0.5296601, 0, 0, 0, 1, 1,
0.2111578, -0.04872484, 2.277233, 1, 1, 1, 1, 1,
0.2121565, 1.4551, -0.7535588, 1, 1, 1, 1, 1,
0.2171183, -0.08610313, 1.132467, 1, 1, 1, 1, 1,
0.2216024, 0.7968063, -1.027048, 1, 1, 1, 1, 1,
0.2230399, -0.1929848, 3.439554, 1, 1, 1, 1, 1,
0.2272685, -1.120835, 2.862244, 1, 1, 1, 1, 1,
0.2281923, 1.171809, -1.380135, 1, 1, 1, 1, 1,
0.2281941, 1.58169, -0.1757745, 1, 1, 1, 1, 1,
0.2321918, 0.886296, 0.7407753, 1, 1, 1, 1, 1,
0.236093, 0.1015212, 0.7712619, 1, 1, 1, 1, 1,
0.238319, -1.043563, 3.728445, 1, 1, 1, 1, 1,
0.2400476, -0.9504695, 2.796841, 1, 1, 1, 1, 1,
0.2407034, -0.07198262, 2.797499, 1, 1, 1, 1, 1,
0.2482079, 0.3301478, 2.162137, 1, 1, 1, 1, 1,
0.2513403, 0.03233434, 3.526621, 1, 1, 1, 1, 1,
0.2552122, -0.1391889, 1.254106, 0, 0, 1, 1, 1,
0.2552399, -0.36058, 4.085221, 1, 0, 0, 1, 1,
0.2589117, 0.3791455, 0.4299227, 1, 0, 0, 1, 1,
0.26427, -0.163141, 1.18575, 1, 0, 0, 1, 1,
0.2664563, -1.708326, 2.726744, 1, 0, 0, 1, 1,
0.2676078, 0.8826869, -0.04083433, 1, 0, 0, 1, 1,
0.2689774, -0.3789289, 3.863308, 0, 0, 0, 1, 1,
0.2701895, 0.8998802, 0.9600823, 0, 0, 0, 1, 1,
0.270503, 0.6144947, 0.1781924, 0, 0, 0, 1, 1,
0.2717389, 1.274572, -2.073488, 0, 0, 0, 1, 1,
0.274514, -1.109044, 2.594145, 0, 0, 0, 1, 1,
0.2794023, -1.425379, 2.903644, 0, 0, 0, 1, 1,
0.2796321, 0.9589062, 1.674592, 0, 0, 0, 1, 1,
0.282921, 0.6125911, 0.06221617, 1, 1, 1, 1, 1,
0.286392, -0.4955139, 2.509688, 1, 1, 1, 1, 1,
0.2888073, -0.1713585, 3.772623, 1, 1, 1, 1, 1,
0.2891531, 0.4320563, 0.7186652, 1, 1, 1, 1, 1,
0.2915373, 1.133587, 2.622029, 1, 1, 1, 1, 1,
0.2933345, -0.09772541, 0.4504317, 1, 1, 1, 1, 1,
0.2988617, 1.408015, -0.7804936, 1, 1, 1, 1, 1,
0.305907, -1.121729, 2.854897, 1, 1, 1, 1, 1,
0.3062411, -0.1528899, 1.827705, 1, 1, 1, 1, 1,
0.3070267, 0.6852701, -0.9088038, 1, 1, 1, 1, 1,
0.3187942, -0.4658698, 2.175023, 1, 1, 1, 1, 1,
0.3200456, 0.5168447, 2.462792, 1, 1, 1, 1, 1,
0.320271, 1.091443, -1.012055, 1, 1, 1, 1, 1,
0.3225253, -1.845311, 1.225402, 1, 1, 1, 1, 1,
0.325624, 0.3670154, 0.2014425, 1, 1, 1, 1, 1,
0.3257736, 1.261452, -1.757578, 0, 0, 1, 1, 1,
0.3272722, 0.09629505, 0.1437679, 1, 0, 0, 1, 1,
0.3301271, -0.3571702, 1.09032, 1, 0, 0, 1, 1,
0.3306029, 0.3707471, 1.175957, 1, 0, 0, 1, 1,
0.3307677, -0.1572466, 1.912354, 1, 0, 0, 1, 1,
0.3319635, 0.3384963, 0.4352994, 1, 0, 0, 1, 1,
0.3360827, -0.8457694, 3.119908, 0, 0, 0, 1, 1,
0.3475337, 0.4682552, 1.053216, 0, 0, 0, 1, 1,
0.3497681, 1.109753, 0.4608201, 0, 0, 0, 1, 1,
0.3590245, 0.6881461, -1.390127, 0, 0, 0, 1, 1,
0.3634647, -0.1973175, 1.812042, 0, 0, 0, 1, 1,
0.3640366, 1.477356, -0.01174117, 0, 0, 0, 1, 1,
0.3669676, 1.095924, 1.026013, 0, 0, 0, 1, 1,
0.367388, 1.083786, 1.863032, 1, 1, 1, 1, 1,
0.3708617, -0.8001855, 3.483124, 1, 1, 1, 1, 1,
0.3746107, 0.5663061, -0.3307744, 1, 1, 1, 1, 1,
0.3772552, -1.166479, 3.246729, 1, 1, 1, 1, 1,
0.3779238, 0.5860012, -0.7187342, 1, 1, 1, 1, 1,
0.3779857, -1.298011, 3.617538, 1, 1, 1, 1, 1,
0.3787911, 0.4271148, 0.7523916, 1, 1, 1, 1, 1,
0.3788113, 0.2192538, 1.014433, 1, 1, 1, 1, 1,
0.3833956, 2.29742, 0.4650691, 1, 1, 1, 1, 1,
0.390399, -0.8140598, 3.220312, 1, 1, 1, 1, 1,
0.3919018, -0.3428069, 2.799357, 1, 1, 1, 1, 1,
0.3938218, 1.648825, -0.1487224, 1, 1, 1, 1, 1,
0.3978854, 1.181997, -0.3581023, 1, 1, 1, 1, 1,
0.3989881, -0.0007235303, 1.383822, 1, 1, 1, 1, 1,
0.4018884, -0.3065266, 2.465249, 1, 1, 1, 1, 1,
0.4058659, 0.7133669, 0.4935894, 0, 0, 1, 1, 1,
0.4087798, 0.752446, -0.7233899, 1, 0, 0, 1, 1,
0.4112208, -1.242571, 2.732419, 1, 0, 0, 1, 1,
0.4114225, -0.2598208, 0.8218811, 1, 0, 0, 1, 1,
0.4218884, 0.5709468, 0.3321064, 1, 0, 0, 1, 1,
0.4242924, -0.1978041, 1.50867, 1, 0, 0, 1, 1,
0.4253514, -2.172681, 3.197662, 0, 0, 0, 1, 1,
0.4269261, -0.3713419, 3.071876, 0, 0, 0, 1, 1,
0.427751, 0.2356489, -0.3310255, 0, 0, 0, 1, 1,
0.4303493, -1.009997, 2.769492, 0, 0, 0, 1, 1,
0.4323193, -0.4972839, 4.286793, 0, 0, 0, 1, 1,
0.4346791, 0.9443145, 0.03485602, 0, 0, 0, 1, 1,
0.435283, 0.07219897, 1.678218, 0, 0, 0, 1, 1,
0.4453092, 0.03146206, 1.139239, 1, 1, 1, 1, 1,
0.4469264, -0.3873974, 0.9533356, 1, 1, 1, 1, 1,
0.4491204, -0.9917051, 2.595172, 1, 1, 1, 1, 1,
0.4494808, -0.09714481, 2.031072, 1, 1, 1, 1, 1,
0.4527394, -0.1620917, 1.268459, 1, 1, 1, 1, 1,
0.4530051, 0.6569343, 0.6571451, 1, 1, 1, 1, 1,
0.4586357, -0.1834367, 2.820308, 1, 1, 1, 1, 1,
0.4635774, -0.5000225, 1.337013, 1, 1, 1, 1, 1,
0.4645899, 0.6379785, -0.7442496, 1, 1, 1, 1, 1,
0.465484, 1.310868, 0.4327876, 1, 1, 1, 1, 1,
0.4706185, 2.43997, 0.5812114, 1, 1, 1, 1, 1,
0.4757771, -0.7457819, 2.856963, 1, 1, 1, 1, 1,
0.4788099, 0.06269812, 2.314617, 1, 1, 1, 1, 1,
0.4797953, -0.3999365, 2.380369, 1, 1, 1, 1, 1,
0.4821649, -0.1242196, -1.753708, 1, 1, 1, 1, 1,
0.4833932, -0.1806437, 2.383318, 0, 0, 1, 1, 1,
0.4839258, 1.02616, 1.206031, 1, 0, 0, 1, 1,
0.4889069, 0.886793, 0.3287761, 1, 0, 0, 1, 1,
0.4897276, 0.09312951, 0.3955452, 1, 0, 0, 1, 1,
0.497115, -0.06655787, 2.652405, 1, 0, 0, 1, 1,
0.5066499, 0.9994505, 0.5264578, 1, 0, 0, 1, 1,
0.5071243, -1.866405, 3.287692, 0, 0, 0, 1, 1,
0.5123168, 0.4240899, 1.412389, 0, 0, 0, 1, 1,
0.512381, -0.4996901, 1.255527, 0, 0, 0, 1, 1,
0.5131572, 0.5399955, 2.73256, 0, 0, 0, 1, 1,
0.5134566, 0.7270253, 0.02971392, 0, 0, 0, 1, 1,
0.5141215, -1.823935, 2.936953, 0, 0, 0, 1, 1,
0.5158851, -0.5609657, 2.522262, 0, 0, 0, 1, 1,
0.5197954, -0.1630883, 2.009875, 1, 1, 1, 1, 1,
0.5202284, 0.1487858, 2.495772, 1, 1, 1, 1, 1,
0.5217836, 0.09400158, 0.5684925, 1, 1, 1, 1, 1,
0.5220917, 0.8562896, 2.520784, 1, 1, 1, 1, 1,
0.5260169, -0.3278563, 0.3856505, 1, 1, 1, 1, 1,
0.5272143, -0.7049894, 1.887617, 1, 1, 1, 1, 1,
0.5304377, 1.158478, 0.3569232, 1, 1, 1, 1, 1,
0.5318682, 1.730724, 0.8577816, 1, 1, 1, 1, 1,
0.5322722, 0.8881134, -1.10021, 1, 1, 1, 1, 1,
0.5323778, 1.25551, -0.6626828, 1, 1, 1, 1, 1,
0.5328109, 1.185059, 1.129943, 1, 1, 1, 1, 1,
0.5428092, -0.2924125, 1.72825, 1, 1, 1, 1, 1,
0.5437582, 0.2837656, 0.8014489, 1, 1, 1, 1, 1,
0.5449859, 0.4231505, -1.365771, 1, 1, 1, 1, 1,
0.5484529, 2.533134, 1.46597, 1, 1, 1, 1, 1,
0.5490171, 1.564914, 1.95754, 0, 0, 1, 1, 1,
0.5526681, 1.559523, -0.1466596, 1, 0, 0, 1, 1,
0.5551482, 0.6834759, 1.552342, 1, 0, 0, 1, 1,
0.5567536, 0.4342948, 1.676313, 1, 0, 0, 1, 1,
0.5574529, -0.578617, 2.436622, 1, 0, 0, 1, 1,
0.5587917, -0.6138239, 2.968863, 1, 0, 0, 1, 1,
0.5607808, -1.102656, 3.610722, 0, 0, 0, 1, 1,
0.5613545, 1.643351, -0.8578953, 0, 0, 0, 1, 1,
0.5619673, -0.8720978, 2.31343, 0, 0, 0, 1, 1,
0.5645997, -0.1077965, 2.502185, 0, 0, 0, 1, 1,
0.5671747, -1.849073, 1.40455, 0, 0, 0, 1, 1,
0.5673302, 0.2496405, 1.256918, 0, 0, 0, 1, 1,
0.5683608, -1.538944, 2.995299, 0, 0, 0, 1, 1,
0.5697879, 1.063591, 0.8777464, 1, 1, 1, 1, 1,
0.5763661, 0.5203295, 1.676046, 1, 1, 1, 1, 1,
0.5789904, -0.06641648, 1.196509, 1, 1, 1, 1, 1,
0.5856797, -1.694291, 3.436094, 1, 1, 1, 1, 1,
0.5945116, 0.7049418, 2.28413, 1, 1, 1, 1, 1,
0.6009095, 0.7921486, 0.1721696, 1, 1, 1, 1, 1,
0.6022427, 0.1470458, 2.046546, 1, 1, 1, 1, 1,
0.6040501, -1.873032, 3.366234, 1, 1, 1, 1, 1,
0.607016, 1.199155, 1.396453, 1, 1, 1, 1, 1,
0.6098382, -0.4203025, 0.8693709, 1, 1, 1, 1, 1,
0.6140767, -1.146113, 2.503925, 1, 1, 1, 1, 1,
0.6161147, 1.632315, 0.06955126, 1, 1, 1, 1, 1,
0.6161919, -1.433182, 2.610505, 1, 1, 1, 1, 1,
0.6297642, -0.9014719, 0.3200401, 1, 1, 1, 1, 1,
0.6310366, 0.7094083, 2.01132, 1, 1, 1, 1, 1,
0.6331903, -0.7133381, 3.003674, 0, 0, 1, 1, 1,
0.6333902, -0.7852033, 2.444957, 1, 0, 0, 1, 1,
0.6352441, 1.419784, 1.498103, 1, 0, 0, 1, 1,
0.6408885, 0.8320798, 1.550765, 1, 0, 0, 1, 1,
0.6472256, 0.7860522, 1.129615, 1, 0, 0, 1, 1,
0.6486425, -1.062466, 3.741446, 1, 0, 0, 1, 1,
0.6514055, 0.5336452, 1.748536, 0, 0, 0, 1, 1,
0.6515182, -0.9277982, 1.579784, 0, 0, 0, 1, 1,
0.6525973, -1.171473, 3.327015, 0, 0, 0, 1, 1,
0.6526055, 0.6463358, 0.089151, 0, 0, 0, 1, 1,
0.6539227, 0.7509275, 0.1419141, 0, 0, 0, 1, 1,
0.6587662, 0.5371244, -0.2541129, 0, 0, 0, 1, 1,
0.6690284, -0.3803325, 1.919833, 0, 0, 0, 1, 1,
0.673521, -0.5270364, 2.389122, 1, 1, 1, 1, 1,
0.6738636, 0.7675867, -1.063792, 1, 1, 1, 1, 1,
0.6742305, -0.448776, 0.5593481, 1, 1, 1, 1, 1,
0.6783559, 0.1993831, -0.08921192, 1, 1, 1, 1, 1,
0.6784812, -0.6037408, 0.9228101, 1, 1, 1, 1, 1,
0.6797839, -0.540714, 2.448689, 1, 1, 1, 1, 1,
0.6806274, -2.299796, 1.965462, 1, 1, 1, 1, 1,
0.6910558, -1.335309, 1.338525, 1, 1, 1, 1, 1,
0.6919097, -0.3325243, 1.881645, 1, 1, 1, 1, 1,
0.695718, 0.3900137, -0.03608138, 1, 1, 1, 1, 1,
0.6996629, 2.546446, 1.478566, 1, 1, 1, 1, 1,
0.6997771, 1.997659, -0.1854781, 1, 1, 1, 1, 1,
0.7012569, -0.8347504, 2.885579, 1, 1, 1, 1, 1,
0.7051616, -0.71364, 0.8989273, 1, 1, 1, 1, 1,
0.7091369, -0.5036051, 1.905937, 1, 1, 1, 1, 1,
0.7126771, -0.1859694, 2.694757, 0, 0, 1, 1, 1,
0.7148264, 0.9343058, 1.282737, 1, 0, 0, 1, 1,
0.7148466, -0.4198201, 1.14141, 1, 0, 0, 1, 1,
0.7148774, -0.5972131, 2.257479, 1, 0, 0, 1, 1,
0.7156866, -0.3091702, 2.437156, 1, 0, 0, 1, 1,
0.7170302, -1.123235, 4.008727, 1, 0, 0, 1, 1,
0.7189751, 1.85421, -2.148162, 0, 0, 0, 1, 1,
0.7241394, 0.1290794, 2.140317, 0, 0, 0, 1, 1,
0.7322589, -0.1913922, 1.441222, 0, 0, 0, 1, 1,
0.7344249, 0.4182517, -0.0582436, 0, 0, 0, 1, 1,
0.7351598, 2.113565, -1.084282, 0, 0, 0, 1, 1,
0.7475027, 1.047553, 0.2989349, 0, 0, 0, 1, 1,
0.7491404, 1.090925, 1.185689, 0, 0, 0, 1, 1,
0.7562988, 1.314865, 0.9216514, 1, 1, 1, 1, 1,
0.7564512, -0.400491, 2.2385, 1, 1, 1, 1, 1,
0.7595879, 1.017774, 1.540375, 1, 1, 1, 1, 1,
0.7606041, 1.204418, 1.037008, 1, 1, 1, 1, 1,
0.7613514, 0.3053522, 0.06048388, 1, 1, 1, 1, 1,
0.7653955, 1.540893, -0.9734125, 1, 1, 1, 1, 1,
0.7712667, -1.020717, 0.3049698, 1, 1, 1, 1, 1,
0.7721967, 1.431462, 0.4019698, 1, 1, 1, 1, 1,
0.7846575, 1.678183, 0.150609, 1, 1, 1, 1, 1,
0.7863708, -0.6507487, 0.8188412, 1, 1, 1, 1, 1,
0.7877826, -0.1949011, 1.333811, 1, 1, 1, 1, 1,
0.7888609, -1.557285, 2.125411, 1, 1, 1, 1, 1,
0.7899355, 1.095049, 0.2478673, 1, 1, 1, 1, 1,
0.7917379, 0.6541278, 1.221666, 1, 1, 1, 1, 1,
0.7995036, -0.5504668, 2.002934, 1, 1, 1, 1, 1,
0.8115943, -0.9730966, 3.154164, 0, 0, 1, 1, 1,
0.8139737, 0.153208, 4.307031, 1, 0, 0, 1, 1,
0.8162598, 0.476237, 0.9383729, 1, 0, 0, 1, 1,
0.816382, 0.5810724, 0.9518433, 1, 0, 0, 1, 1,
0.8356178, -0.121711, 0.7289357, 1, 0, 0, 1, 1,
0.8362921, -0.06381852, 1.921115, 1, 0, 0, 1, 1,
0.8392824, 0.690116, 0.1985745, 0, 0, 0, 1, 1,
0.8427436, -0.7171996, 2.051177, 0, 0, 0, 1, 1,
0.8431706, 0.1106282, 2.680704, 0, 0, 0, 1, 1,
0.8433101, 0.6134065, 1.083439, 0, 0, 0, 1, 1,
0.8553513, -0.8033936, 2.680859, 0, 0, 0, 1, 1,
0.8682416, -0.9810242, 2.521481, 0, 0, 0, 1, 1,
0.8711759, -0.05129957, 0.6913111, 0, 0, 0, 1, 1,
0.8726183, -0.7765235, 2.498271, 1, 1, 1, 1, 1,
0.8750377, 1.012218, 1.377288, 1, 1, 1, 1, 1,
0.8772725, 0.03511925, 2.774669, 1, 1, 1, 1, 1,
0.8784491, -0.1653763, 0.4148105, 1, 1, 1, 1, 1,
0.8797615, 3.339897, 1.025274, 1, 1, 1, 1, 1,
0.8851055, -0.0710707, 3.636943, 1, 1, 1, 1, 1,
0.8905297, -0.9203704, 3.534501, 1, 1, 1, 1, 1,
0.8923561, 0.9436391, 0.7969736, 1, 1, 1, 1, 1,
0.8938629, -0.6083072, 1.355324, 1, 1, 1, 1, 1,
0.8946474, -1.12063, 2.555663, 1, 1, 1, 1, 1,
0.9021398, -1.457166, 3.724798, 1, 1, 1, 1, 1,
0.9040709, 1.126577, -0.3879644, 1, 1, 1, 1, 1,
0.9157659, 1.422741, 0.1463531, 1, 1, 1, 1, 1,
0.9172829, 0.8269684, 0.2759495, 1, 1, 1, 1, 1,
0.9246073, -0.2869568, 2.288203, 1, 1, 1, 1, 1,
0.926041, -0.5372542, 2.070501, 0, 0, 1, 1, 1,
0.9286867, 0.43809, 2.224864, 1, 0, 0, 1, 1,
0.9325058, 0.02314181, 1.285455, 1, 0, 0, 1, 1,
0.9332473, -0.9835674, 2.008938, 1, 0, 0, 1, 1,
0.9422543, 0.1891796, 0.8565548, 1, 0, 0, 1, 1,
0.9481087, 0.4091921, 0.4524695, 1, 0, 0, 1, 1,
0.9504495, -1.278926, 2.981806, 0, 0, 0, 1, 1,
0.9647327, -0.08577792, 3.031357, 0, 0, 0, 1, 1,
0.9674558, -0.05331952, 1.316953, 0, 0, 0, 1, 1,
0.9697995, -0.02226981, 1.683139, 0, 0, 0, 1, 1,
0.972143, 1.077261, 1.275056, 0, 0, 0, 1, 1,
0.9734449, 0.8606219, -0.6370153, 0, 0, 0, 1, 1,
0.9830606, 0.07940074, 1.672912, 0, 0, 0, 1, 1,
0.9848104, 0.1063873, 3.084529, 1, 1, 1, 1, 1,
0.9950469, -1.155354, 1.443563, 1, 1, 1, 1, 1,
1.003126, -0.4664805, 1.279085, 1, 1, 1, 1, 1,
1.004081, -0.5867491, 2.781117, 1, 1, 1, 1, 1,
1.007117, -0.7290202, 1.570571, 1, 1, 1, 1, 1,
1.030203, -0.4387587, 1.166634, 1, 1, 1, 1, 1,
1.042041, -0.7235055, 2.223544, 1, 1, 1, 1, 1,
1.048298, -1.47681, 1.71643, 1, 1, 1, 1, 1,
1.055204, -0.1608787, 1.933732, 1, 1, 1, 1, 1,
1.062979, -0.6697654, 0.6896929, 1, 1, 1, 1, 1,
1.070223, -1.391214, 0.9001632, 1, 1, 1, 1, 1,
1.071207, -1.711198, 0.6679524, 1, 1, 1, 1, 1,
1.079147, -0.09875114, 3.237441, 1, 1, 1, 1, 1,
1.080026, -1.731445, 3.443712, 1, 1, 1, 1, 1,
1.080301, -0.2614885, -0.111263, 1, 1, 1, 1, 1,
1.08228, -0.2394606, 1.767903, 0, 0, 1, 1, 1,
1.083145, -2.155206, 2.684661, 1, 0, 0, 1, 1,
1.090682, 0.0352127, 1.938447, 1, 0, 0, 1, 1,
1.106212, 0.3016896, 1.554498, 1, 0, 0, 1, 1,
1.126634, -1.280771, 1.293525, 1, 0, 0, 1, 1,
1.129582, -0.360845, 0.5584809, 1, 0, 0, 1, 1,
1.130427, -0.2317612, 1.402423, 0, 0, 0, 1, 1,
1.13127, 0.2273969, 1.147678, 0, 0, 0, 1, 1,
1.142417, 0.3465738, 1.7077, 0, 0, 0, 1, 1,
1.144223, -0.251344, 1.081052, 0, 0, 0, 1, 1,
1.148757, 0.08291808, 1.600609, 0, 0, 0, 1, 1,
1.151154, 1.376308, 3.134704, 0, 0, 0, 1, 1,
1.151796, -0.9174046, 1.028199, 0, 0, 0, 1, 1,
1.158925, 0.8362991, 1.099309, 1, 1, 1, 1, 1,
1.160124, -1.179471, 2.729123, 1, 1, 1, 1, 1,
1.161947, 0.1840812, 0.6890136, 1, 1, 1, 1, 1,
1.166955, 0.9821175, 0.9305852, 1, 1, 1, 1, 1,
1.167227, 0.8344951, 0.117896, 1, 1, 1, 1, 1,
1.174829, -0.3209024, 2.113069, 1, 1, 1, 1, 1,
1.179058, 0.1611625, 0.8128646, 1, 1, 1, 1, 1,
1.180634, -0.3947922, 0.7968072, 1, 1, 1, 1, 1,
1.192186, -0.04728827, 1.593592, 1, 1, 1, 1, 1,
1.199115, 0.4138305, 1.78319, 1, 1, 1, 1, 1,
1.206264, 1.346378, -0.3352094, 1, 1, 1, 1, 1,
1.209061, -0.2240452, 1.632115, 1, 1, 1, 1, 1,
1.214778, -0.1667588, 3.28951, 1, 1, 1, 1, 1,
1.216508, -0.256922, 2.243832, 1, 1, 1, 1, 1,
1.219387, 0.05073682, 2.010565, 1, 1, 1, 1, 1,
1.22338, 1.09184, 0.435893, 0, 0, 1, 1, 1,
1.224224, -0.1230582, 1.85211, 1, 0, 0, 1, 1,
1.24153, 1.297784, -0.5282155, 1, 0, 0, 1, 1,
1.244503, 0.6816539, 1.412076, 1, 0, 0, 1, 1,
1.253375, 0.5107011, 0.44535, 1, 0, 0, 1, 1,
1.255314, -0.9242756, 2.105182, 1, 0, 0, 1, 1,
1.272969, 0.5973277, 1.960631, 0, 0, 0, 1, 1,
1.273183, -0.2167462, 2.919584, 0, 0, 0, 1, 1,
1.279372, -1.206475, 2.238232, 0, 0, 0, 1, 1,
1.285693, -0.8922042, 2.891967, 0, 0, 0, 1, 1,
1.299621, -0.4788794, 2.570273, 0, 0, 0, 1, 1,
1.305537, 0.01653768, 2.397859, 0, 0, 0, 1, 1,
1.305573, 0.2950162, 0.7310402, 0, 0, 0, 1, 1,
1.307563, 1.196534, 0.2316093, 1, 1, 1, 1, 1,
1.319913, 0.4375949, 0.5802505, 1, 1, 1, 1, 1,
1.323384, 0.3692247, 0.3983034, 1, 1, 1, 1, 1,
1.326636, 0.4193066, -0.2324098, 1, 1, 1, 1, 1,
1.329414, -0.8389937, 1.968036, 1, 1, 1, 1, 1,
1.338423, -1.224162, 0.3565185, 1, 1, 1, 1, 1,
1.348049, 1.308857, -0.6193416, 1, 1, 1, 1, 1,
1.353067, 0.1506866, 1.80579, 1, 1, 1, 1, 1,
1.356146, -0.1145837, 2.076168, 1, 1, 1, 1, 1,
1.360157, -0.1634676, 1.245586, 1, 1, 1, 1, 1,
1.360938, 0.3756632, -0.2762284, 1, 1, 1, 1, 1,
1.364135, 0.3793116, 2.270812, 1, 1, 1, 1, 1,
1.373042, -0.09442487, 2.008479, 1, 1, 1, 1, 1,
1.373367, -1.500949, 2.981621, 1, 1, 1, 1, 1,
1.373713, 1.554024, 0.3540504, 1, 1, 1, 1, 1,
1.37464, -0.1028289, 1.015768, 0, 0, 1, 1, 1,
1.376605, -1.874593, 2.779322, 1, 0, 0, 1, 1,
1.378298, 0.09344902, 3.282145, 1, 0, 0, 1, 1,
1.378308, -0.66289, 1.687792, 1, 0, 0, 1, 1,
1.393235, -1.131541, 2.780677, 1, 0, 0, 1, 1,
1.401304, 1.073792, 1.07403, 1, 0, 0, 1, 1,
1.406688, -0.4907503, 2.232141, 0, 0, 0, 1, 1,
1.41264, -0.3273619, 0.7982246, 0, 0, 0, 1, 1,
1.415577, -0.8405086, 2.816442, 0, 0, 0, 1, 1,
1.416026, 1.646211, 1.531711, 0, 0, 0, 1, 1,
1.420921, 0.5677814, 0.9861196, 0, 0, 0, 1, 1,
1.424397, 0.6954097, -1.251092, 0, 0, 0, 1, 1,
1.433959, -1.469602, 3.383958, 0, 0, 0, 1, 1,
1.438306, -0.7394459, 3.839031, 1, 1, 1, 1, 1,
1.444925, 0.6333845, 0.3113532, 1, 1, 1, 1, 1,
1.457775, 0.777859, 0.7351217, 1, 1, 1, 1, 1,
1.458703, 0.3465465, 2.252091, 1, 1, 1, 1, 1,
1.473204, 0.7037242, 0.2912724, 1, 1, 1, 1, 1,
1.477195, -0.09706993, 2.209629, 1, 1, 1, 1, 1,
1.483524, 1.522096, 2.270632, 1, 1, 1, 1, 1,
1.486152, 0.632678, -0.3174422, 1, 1, 1, 1, 1,
1.493782, -0.8341704, 2.186532, 1, 1, 1, 1, 1,
1.499251, 2.069415, 0.3200264, 1, 1, 1, 1, 1,
1.512066, -1.006878, 0.9806378, 1, 1, 1, 1, 1,
1.524194, 1.826408, 1.430056, 1, 1, 1, 1, 1,
1.528104, -0.5896219, 3.174313, 1, 1, 1, 1, 1,
1.529091, -0.4266166, 1.888256, 1, 1, 1, 1, 1,
1.529184, -0.5036758, 2.243989, 1, 1, 1, 1, 1,
1.538347, 1.204521, 1.966655, 0, 0, 1, 1, 1,
1.55338, -2.628663, 2.86299, 1, 0, 0, 1, 1,
1.567448, 0.01707769, 1.043228, 1, 0, 0, 1, 1,
1.567984, -0.2427132, 1.368816, 1, 0, 0, 1, 1,
1.572933, 1.670842, 2.013715, 1, 0, 0, 1, 1,
1.575558, 1.110501, 0.5391577, 1, 0, 0, 1, 1,
1.577863, -0.8750821, 1.075611, 0, 0, 0, 1, 1,
1.578848, -1.062368, 3.953648, 0, 0, 0, 1, 1,
1.579214, -1.392825, 1.266653, 0, 0, 0, 1, 1,
1.580614, -0.7426968, 0.4793839, 0, 0, 0, 1, 1,
1.588172, -1.859789, 1.230295, 0, 0, 0, 1, 1,
1.602425, 1.948353, 1.027969, 0, 0, 0, 1, 1,
1.617877, 1.05977, 1.480181, 0, 0, 0, 1, 1,
1.619237, -0.2527694, 1.649152, 1, 1, 1, 1, 1,
1.620195, -0.341975, -0.1523173, 1, 1, 1, 1, 1,
1.62244, 1.608721, 2.511337, 1, 1, 1, 1, 1,
1.634456, 0.980803, 0.8159727, 1, 1, 1, 1, 1,
1.682459, 0.8391937, 1.512381, 1, 1, 1, 1, 1,
1.695554, 0.1098766, 1.741724, 1, 1, 1, 1, 1,
1.70777, 0.1062714, 0.8097209, 1, 1, 1, 1, 1,
1.708612, 0.2322535, 2.005599, 1, 1, 1, 1, 1,
1.712072, 0.7352185, 2.064351, 1, 1, 1, 1, 1,
1.723204, -1.627051, 2.443474, 1, 1, 1, 1, 1,
1.725837, 1.47717, 0.2769828, 1, 1, 1, 1, 1,
1.729333, -1.828273, 2.855291, 1, 1, 1, 1, 1,
1.743912, -0.3053443, 0.2972916, 1, 1, 1, 1, 1,
1.76489, 0.7745411, 2.137894, 1, 1, 1, 1, 1,
1.76985, 1.562909, 1.08703, 1, 1, 1, 1, 1,
1.784487, -0.8991076, 2.958675, 0, 0, 1, 1, 1,
1.789628, 0.1781603, 2.127615, 1, 0, 0, 1, 1,
1.790202, -1.517434, 1.608434, 1, 0, 0, 1, 1,
1.790407, -0.50639, 2.070206, 1, 0, 0, 1, 1,
1.799168, -0.2720806, 1.664106, 1, 0, 0, 1, 1,
1.838341, -1.209753, 2.68729, 1, 0, 0, 1, 1,
1.840848, -0.4566184, 0.5202053, 0, 0, 0, 1, 1,
1.843348, -0.9576866, 1.841141, 0, 0, 0, 1, 1,
1.871885, -0.6673681, 2.291171, 0, 0, 0, 1, 1,
1.877152, 1.041954, 2.563369, 0, 0, 0, 1, 1,
1.877408, -0.792457, 1.784268, 0, 0, 0, 1, 1,
1.885519, -0.04564259, 1.04955, 0, 0, 0, 1, 1,
1.895654, -1.609291, 2.111535, 0, 0, 0, 1, 1,
1.905307, -1.248833, 2.060235, 1, 1, 1, 1, 1,
1.938981, -1.654752, 3.397062, 1, 1, 1, 1, 1,
1.969416, 0.4537195, -0.3466962, 1, 1, 1, 1, 1,
1.972475, -0.2176999, 2.902419, 1, 1, 1, 1, 1,
1.975239, -1.553211, 3.302389, 1, 1, 1, 1, 1,
1.993235, 0.846073, 1.313629, 1, 1, 1, 1, 1,
2.002627, -0.2745525, 0.4286529, 1, 1, 1, 1, 1,
2.011699, 0.03255911, 1.408538, 1, 1, 1, 1, 1,
2.02729, -1.203021, 2.840494, 1, 1, 1, 1, 1,
2.03672, 2.595952, 0.06868458, 1, 1, 1, 1, 1,
2.053531, 0.9184438, 0.03985587, 1, 1, 1, 1, 1,
2.055408, -0.2507432, 2.624838, 1, 1, 1, 1, 1,
2.059064, 1.196817, 1.314368, 1, 1, 1, 1, 1,
2.147393, 0.9208486, 1.719017, 1, 1, 1, 1, 1,
2.170854, 0.5479226, 1.799222, 1, 1, 1, 1, 1,
2.19126, -0.07498579, -0.1143631, 0, 0, 1, 1, 1,
2.234322, -1.913825, 2.424361, 1, 0, 0, 1, 1,
2.254067, -1.891608, 1.68607, 1, 0, 0, 1, 1,
2.281738, -2.941036, 4.83083, 1, 0, 0, 1, 1,
2.307129, -0.08664086, 0.02881731, 1, 0, 0, 1, 1,
2.336375, 1.504828, 3.337904, 1, 0, 0, 1, 1,
2.35106, -0.4775198, 0.5629434, 0, 0, 0, 1, 1,
2.443598, -1.058468, 1.830753, 0, 0, 0, 1, 1,
2.45452, -0.3133358, 2.119105, 0, 0, 0, 1, 1,
2.467126, 0.02792582, 0.7098239, 0, 0, 0, 1, 1,
2.534773, -1.706049, 3.571534, 0, 0, 0, 1, 1,
2.548748, -0.6383198, 2.631829, 0, 0, 0, 1, 1,
2.552418, 0.1935289, 2.088819, 0, 0, 0, 1, 1,
2.565492, -1.02825, 1.186142, 1, 1, 1, 1, 1,
2.613225, 0.252492, 1.658653, 1, 1, 1, 1, 1,
2.640918, -0.8181522, 2.529927, 1, 1, 1, 1, 1,
2.742856, 0.5882561, 2.457185, 1, 1, 1, 1, 1,
2.902261, 0.2010218, 0.9675401, 1, 1, 1, 1, 1,
3.251455, 1.075371, 2.83328, 1, 1, 1, 1, 1,
3.484895, -0.7012229, 0.9836438, 1, 1, 1, 1, 1
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
var radius = 9.560619;
var distance = 33.58127;
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
mvMatrix.translate( -0.1977937, -0.3141453, 0.3649423 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.58127);
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