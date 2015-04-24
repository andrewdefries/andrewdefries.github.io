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
-3.000339, 0.06384526, -1.896773, 1, 0, 0, 1,
-2.84653, 1.202624, -1.927629, 1, 0.007843138, 0, 1,
-2.801497, 0.1070256, -2.216614, 1, 0.01176471, 0, 1,
-2.786618, 2.01499, -0.07188998, 1, 0.01960784, 0, 1,
-2.755344, 0.9045958, -0.6261562, 1, 0.02352941, 0, 1,
-2.582499, 0.008286558, -1.447429, 1, 0.03137255, 0, 1,
-2.571488, 0.286204, -1.216698, 1, 0.03529412, 0, 1,
-2.501418, -1.865367, -1.817655, 1, 0.04313726, 0, 1,
-2.488583, -0.626463, -1.982937, 1, 0.04705882, 0, 1,
-2.484312, 1.808147, -0.9893556, 1, 0.05490196, 0, 1,
-2.458509, 0.6443408, -2.150241, 1, 0.05882353, 0, 1,
-2.385003, 0.9603937, -1.111342, 1, 0.06666667, 0, 1,
-2.319362, 1.023383, -1.796534, 1, 0.07058824, 0, 1,
-2.136712, -0.1502632, -1.140763, 1, 0.07843138, 0, 1,
-2.117861, 0.2592699, -0.781377, 1, 0.08235294, 0, 1,
-2.099477, 1.675872, 0.6647686, 1, 0.09019608, 0, 1,
-2.099241, -0.8247613, -0.006825903, 1, 0.09411765, 0, 1,
-2.098215, -2.585449, -3.94561, 1, 0.1019608, 0, 1,
-2.067621, -0.1560676, -4.039266, 1, 0.1098039, 0, 1,
-2.044161, 0.4076649, -1.836704, 1, 0.1137255, 0, 1,
-2.042941, -0.4011086, -2.079685, 1, 0.1215686, 0, 1,
-1.992225, -1.72504, -2.114527, 1, 0.1254902, 0, 1,
-1.98776, -0.1120807, -1.939348, 1, 0.1333333, 0, 1,
-1.97528, -2.649159, -1.073887, 1, 0.1372549, 0, 1,
-1.965479, -0.1933074, -1.315798, 1, 0.145098, 0, 1,
-1.947358, 1.079434, -2.193877, 1, 0.1490196, 0, 1,
-1.943025, -0.2476733, -0.6662022, 1, 0.1568628, 0, 1,
-1.928843, -0.8642101, -1.921048, 1, 0.1607843, 0, 1,
-1.91376, 0.157856, -2.032638, 1, 0.1686275, 0, 1,
-1.893074, 1.105457, -1.914035, 1, 0.172549, 0, 1,
-1.864711, 0.4671777, -2.175449, 1, 0.1803922, 0, 1,
-1.853825, -0.712771, -3.463753, 1, 0.1843137, 0, 1,
-1.852424, -1.216622, -1.477608, 1, 0.1921569, 0, 1,
-1.842099, -0.4208386, -1.240195, 1, 0.1960784, 0, 1,
-1.823942, 0.2073681, -1.040375, 1, 0.2039216, 0, 1,
-1.811247, 0.3822413, -0.595549, 1, 0.2117647, 0, 1,
-1.804822, 0.1821471, -0.7083931, 1, 0.2156863, 0, 1,
-1.795235, -0.9009286, -3.706077, 1, 0.2235294, 0, 1,
-1.794653, 0.1788257, -2.682499, 1, 0.227451, 0, 1,
-1.793957, 0.9372021, 0.3650731, 1, 0.2352941, 0, 1,
-1.78542, -0.5696582, -1.218782, 1, 0.2392157, 0, 1,
-1.770416, -0.4852569, -2.397813, 1, 0.2470588, 0, 1,
-1.757992, -0.3345514, -2.463496, 1, 0.2509804, 0, 1,
-1.757965, -0.4309185, -2.482362, 1, 0.2588235, 0, 1,
-1.732754, -0.02557076, -0.8731951, 1, 0.2627451, 0, 1,
-1.715135, 1.728867, -0.329378, 1, 0.2705882, 0, 1,
-1.712592, -0.7443255, -2.385314, 1, 0.2745098, 0, 1,
-1.687111, 1.101257, -1.087967, 1, 0.282353, 0, 1,
-1.682788, 0.05424483, -1.90306, 1, 0.2862745, 0, 1,
-1.681635, 0.6070614, 0.8442799, 1, 0.2941177, 0, 1,
-1.676332, -0.3912969, -2.412112, 1, 0.3019608, 0, 1,
-1.651254, 0.009520352, -0.4160668, 1, 0.3058824, 0, 1,
-1.649988, -2.56951, -4.154647, 1, 0.3137255, 0, 1,
-1.646384, 0.1213526, -1.747509, 1, 0.3176471, 0, 1,
-1.637732, -1.09133, -2.419108, 1, 0.3254902, 0, 1,
-1.63531, -1.492673, -2.934867, 1, 0.3294118, 0, 1,
-1.630418, 0.3972873, -0.3839476, 1, 0.3372549, 0, 1,
-1.619598, 1.649494, -0.8571979, 1, 0.3411765, 0, 1,
-1.617847, -1.496053, -3.035967, 1, 0.3490196, 0, 1,
-1.613559, -1.178899, -3.002563, 1, 0.3529412, 0, 1,
-1.60866, -1.530567, -1.950336, 1, 0.3607843, 0, 1,
-1.588339, -0.06031435, -0.5940959, 1, 0.3647059, 0, 1,
-1.58163, -0.05209148, -1.197706, 1, 0.372549, 0, 1,
-1.578233, 0.8107597, -2.002023, 1, 0.3764706, 0, 1,
-1.577654, 0.718056, -2.325995, 1, 0.3843137, 0, 1,
-1.577283, -0.5801405, -1.192581, 1, 0.3882353, 0, 1,
-1.576989, 0.2500933, -1.372429, 1, 0.3960784, 0, 1,
-1.559561, 0.2097477, -2.466673, 1, 0.4039216, 0, 1,
-1.551336, -0.6563104, -1.670564, 1, 0.4078431, 0, 1,
-1.54951, 0.3098195, -2.37614, 1, 0.4156863, 0, 1,
-1.528177, -0.4372061, -1.760205, 1, 0.4196078, 0, 1,
-1.527571, -1.92285, -2.132082, 1, 0.427451, 0, 1,
-1.52197, -1.066233, -3.073845, 1, 0.4313726, 0, 1,
-1.504077, -0.9180641, -1.265844, 1, 0.4392157, 0, 1,
-1.499178, -0.7901854, -3.37744, 1, 0.4431373, 0, 1,
-1.49023, -0.2990387, -0.4634022, 1, 0.4509804, 0, 1,
-1.478499, -0.1265885, -2.946126, 1, 0.454902, 0, 1,
-1.475374, -0.2425736, -1.154568, 1, 0.4627451, 0, 1,
-1.463143, -0.7512758, 0.4417221, 1, 0.4666667, 0, 1,
-1.46025, -0.8375878, -2.401531, 1, 0.4745098, 0, 1,
-1.452176, 0.003682981, -2.461743, 1, 0.4784314, 0, 1,
-1.432866, -1.33443, -2.71873, 1, 0.4862745, 0, 1,
-1.431423, -0.6438932, -2.458839, 1, 0.4901961, 0, 1,
-1.429225, 0.3475, -0.5085158, 1, 0.4980392, 0, 1,
-1.415773, 1.237778, -0.9634292, 1, 0.5058824, 0, 1,
-1.410173, -1.409614, -3.292671, 1, 0.509804, 0, 1,
-1.399982, 1.534235, 1.414405, 1, 0.5176471, 0, 1,
-1.399609, -1.314015, -1.536447, 1, 0.5215687, 0, 1,
-1.393415, 0.855118, -0.9120838, 1, 0.5294118, 0, 1,
-1.393155, 1.883777, -2.085627, 1, 0.5333334, 0, 1,
-1.380777, -1.192498, -4.652201, 1, 0.5411765, 0, 1,
-1.376051, -0.2044595, -1.492923, 1, 0.5450981, 0, 1,
-1.373306, -0.3452171, -2.533149, 1, 0.5529412, 0, 1,
-1.35328, -0.3644326, -1.99689, 1, 0.5568628, 0, 1,
-1.351777, -0.8843154, -1.735054, 1, 0.5647059, 0, 1,
-1.343381, 1.967616, -1.04061, 1, 0.5686275, 0, 1,
-1.343237, 0.771392, -0.4898906, 1, 0.5764706, 0, 1,
-1.31999, -0.7932971, -2.019457, 1, 0.5803922, 0, 1,
-1.317973, -0.4761343, -1.460835, 1, 0.5882353, 0, 1,
-1.309444, 0.396182, -2.427204, 1, 0.5921569, 0, 1,
-1.309145, -0.9324524, -2.429447, 1, 0.6, 0, 1,
-1.299667, -0.697202, -2.438341, 1, 0.6078432, 0, 1,
-1.285928, -1.121141, -1.416907, 1, 0.6117647, 0, 1,
-1.27934, 0.7148764, -0.5246398, 1, 0.6196079, 0, 1,
-1.27914, -0.3085897, -0.2060329, 1, 0.6235294, 0, 1,
-1.274912, -0.5130973, -1.474402, 1, 0.6313726, 0, 1,
-1.26697, 1.570692, 1.222902, 1, 0.6352941, 0, 1,
-1.257881, -0.1694028, 1.53826, 1, 0.6431373, 0, 1,
-1.236399, 0.952824, -1.306439, 1, 0.6470588, 0, 1,
-1.225131, 1.065583, -1.80342, 1, 0.654902, 0, 1,
-1.219879, 1.755856, 0.4632332, 1, 0.6588235, 0, 1,
-1.219274, -1.26752, -2.875086, 1, 0.6666667, 0, 1,
-1.205185, -1.178532, -1.152453, 1, 0.6705883, 0, 1,
-1.198539, -0.9249364, -2.410533, 1, 0.6784314, 0, 1,
-1.197762, 0.1525277, 0.8820664, 1, 0.682353, 0, 1,
-1.196741, -0.03423012, -1.534765, 1, 0.6901961, 0, 1,
-1.19597, 0.6191797, 0.0272839, 1, 0.6941177, 0, 1,
-1.194832, 0.9655918, -0.7871176, 1, 0.7019608, 0, 1,
-1.181124, 0.216896, -2.082335, 1, 0.7098039, 0, 1,
-1.180356, -1.150245, -0.443264, 1, 0.7137255, 0, 1,
-1.176789, -0.004187325, -1.387766, 1, 0.7215686, 0, 1,
-1.173553, -0.9327486, -0.2442598, 1, 0.7254902, 0, 1,
-1.173363, -1.993812, -1.315592, 1, 0.7333333, 0, 1,
-1.163458, 1.505326, 1.049241, 1, 0.7372549, 0, 1,
-1.160814, 1.838077, -0.8739578, 1, 0.7450981, 0, 1,
-1.156963, 0.4640446, -2.415636, 1, 0.7490196, 0, 1,
-1.147827, 1.476954, -1.734626, 1, 0.7568628, 0, 1,
-1.138934, -1.197824, -1.607102, 1, 0.7607843, 0, 1,
-1.137964, -1.07167, -4.79368, 1, 0.7686275, 0, 1,
-1.132932, 0.05977246, -1.650589, 1, 0.772549, 0, 1,
-1.129999, -0.302852, -2.075955, 1, 0.7803922, 0, 1,
-1.128612, 1.247658, -0.345466, 1, 0.7843137, 0, 1,
-1.127126, 0.8672572, -0.6480095, 1, 0.7921569, 0, 1,
-1.126118, -0.3617511, -0.9773835, 1, 0.7960784, 0, 1,
-1.114817, -2.001299, -2.460275, 1, 0.8039216, 0, 1,
-1.11354, 0.4905103, -1.273108, 1, 0.8117647, 0, 1,
-1.1072, -0.4290152, -4.13755, 1, 0.8156863, 0, 1,
-1.089347, 0.7743879, -1.931148, 1, 0.8235294, 0, 1,
-1.086683, -0.2032478, -1.107395, 1, 0.827451, 0, 1,
-1.076436, -0.6067713, -4.340429, 1, 0.8352941, 0, 1,
-1.072621, -0.4930404, -1.252648, 1, 0.8392157, 0, 1,
-1.070167, 1.191738, -0.929957, 1, 0.8470588, 0, 1,
-1.069495, -0.1657726, -1.544513, 1, 0.8509804, 0, 1,
-1.068378, 0.3442413, 0.6870474, 1, 0.8588235, 0, 1,
-1.066501, -0.08577754, -4.204968, 1, 0.8627451, 0, 1,
-1.064626, -1.949347, -1.926843, 1, 0.8705882, 0, 1,
-1.056077, -0.1645334, -1.639294, 1, 0.8745098, 0, 1,
-1.053519, 1.061437, -0.9199228, 1, 0.8823529, 0, 1,
-1.052113, -0.661979, -3.479341, 1, 0.8862745, 0, 1,
-1.043553, -0.2427041, -1.338213, 1, 0.8941177, 0, 1,
-1.041943, -0.2836951, -0.723331, 1, 0.8980392, 0, 1,
-1.041414, -0.02893448, -2.799188, 1, 0.9058824, 0, 1,
-1.039451, 0.4135277, -0.6304665, 1, 0.9137255, 0, 1,
-1.038722, -0.637743, -2.840326, 1, 0.9176471, 0, 1,
-1.037391, 0.4304341, -0.3827895, 1, 0.9254902, 0, 1,
-1.035252, -0.1462899, -2.204193, 1, 0.9294118, 0, 1,
-1.034519, -0.1996142, -1.930905, 1, 0.9372549, 0, 1,
-1.021602, 0.7223833, -1.125025, 1, 0.9411765, 0, 1,
-1.019896, -1.569243, -3.142856, 1, 0.9490196, 0, 1,
-1.017582, -1.208564, -2.087313, 1, 0.9529412, 0, 1,
-1.016861, 0.8434575, -1.597447, 1, 0.9607843, 0, 1,
-1.014327, 0.06788526, -0.7190365, 1, 0.9647059, 0, 1,
-1.013135, 0.3944658, -1.018182, 1, 0.972549, 0, 1,
-0.9989641, -0.934171, -2.95306, 1, 0.9764706, 0, 1,
-0.9903293, 1.287541, -0.03843795, 1, 0.9843137, 0, 1,
-0.9898832, 1.555769, 0.3556745, 1, 0.9882353, 0, 1,
-0.9891084, -1.842899, -1.410341, 1, 0.9960784, 0, 1,
-0.9856663, 0.382788, -0.7107795, 0.9960784, 1, 0, 1,
-0.9831927, -0.7718213, -3.479413, 0.9921569, 1, 0, 1,
-0.9826622, 0.4105244, -0.9232956, 0.9843137, 1, 0, 1,
-0.9808469, -0.2556881, -2.026929, 0.9803922, 1, 0, 1,
-0.9728781, 0.9357485, -1.907083, 0.972549, 1, 0, 1,
-0.9717834, 0.625679, 0.3531273, 0.9686275, 1, 0, 1,
-0.9704382, 1.252965, -1.02793, 0.9607843, 1, 0, 1,
-0.9691682, 1.075051, -0.5194125, 0.9568627, 1, 0, 1,
-0.9684692, 0.7168004, -1.04689, 0.9490196, 1, 0, 1,
-0.9638767, 0.2705335, -2.559952, 0.945098, 1, 0, 1,
-0.9517648, -0.9242554, -0.3816578, 0.9372549, 1, 0, 1,
-0.951165, 0.1771936, 0.2133628, 0.9333333, 1, 0, 1,
-0.9494619, -0.9615294, -1.446668, 0.9254902, 1, 0, 1,
-0.9480794, -2.216571, -3.432604, 0.9215686, 1, 0, 1,
-0.9475254, -1.026612, -3.86914, 0.9137255, 1, 0, 1,
-0.9470006, 0.1416793, -1.710934, 0.9098039, 1, 0, 1,
-0.946687, 1.509517, -1.791624, 0.9019608, 1, 0, 1,
-0.945271, -0.3069417, -2.604127, 0.8941177, 1, 0, 1,
-0.9452228, 0.4572123, -0.9765444, 0.8901961, 1, 0, 1,
-0.9443815, 0.3855229, -2.601011, 0.8823529, 1, 0, 1,
-0.9417052, -0.5948774, -2.993905, 0.8784314, 1, 0, 1,
-0.9336384, 0.3569341, -1.153138, 0.8705882, 1, 0, 1,
-0.9321912, -1.14951, -0.9926948, 0.8666667, 1, 0, 1,
-0.9294009, 0.7543819, 0.4250696, 0.8588235, 1, 0, 1,
-0.929229, 0.1626226, -2.97806, 0.854902, 1, 0, 1,
-0.9266496, -2.444438, -2.25563, 0.8470588, 1, 0, 1,
-0.9249352, -0.4750035, -3.560823, 0.8431373, 1, 0, 1,
-0.9198608, -0.1858912, -1.343438, 0.8352941, 1, 0, 1,
-0.9193285, -1.598742, -3.295326, 0.8313726, 1, 0, 1,
-0.9175949, -0.8393796, -0.3832898, 0.8235294, 1, 0, 1,
-0.9152704, 0.5332549, -2.04076, 0.8196079, 1, 0, 1,
-0.9110805, -0.2673602, -0.4515979, 0.8117647, 1, 0, 1,
-0.9051899, -0.8385442, -4.382627, 0.8078431, 1, 0, 1,
-0.89864, -0.1047013, -2.597997, 0.8, 1, 0, 1,
-0.8984812, 1.156466, 0.1233808, 0.7921569, 1, 0, 1,
-0.896839, 0.3374313, -0.1777312, 0.7882353, 1, 0, 1,
-0.8966672, 0.2741147, -0.108914, 0.7803922, 1, 0, 1,
-0.8889915, 0.2147491, -0.4316263, 0.7764706, 1, 0, 1,
-0.8849878, 0.2191503, -0.4801123, 0.7686275, 1, 0, 1,
-0.8804353, 0.4319097, -1.893675, 0.7647059, 1, 0, 1,
-0.8786722, -0.7359798, -1.594918, 0.7568628, 1, 0, 1,
-0.8772333, -1.729721, -4.359598, 0.7529412, 1, 0, 1,
-0.8763004, 0.634258, -2.199817, 0.7450981, 1, 0, 1,
-0.8746108, -1.634618, -2.688883, 0.7411765, 1, 0, 1,
-0.8740627, -0.2777159, -1.138736, 0.7333333, 1, 0, 1,
-0.8689615, 0.9072857, -0.5468965, 0.7294118, 1, 0, 1,
-0.8686109, -0.4196033, -3.257659, 0.7215686, 1, 0, 1,
-0.866908, 1.024876, -1.839499, 0.7176471, 1, 0, 1,
-0.8605388, -0.6183218, -3.009445, 0.7098039, 1, 0, 1,
-0.8595474, -0.01498913, -2.422385, 0.7058824, 1, 0, 1,
-0.8557932, 0.266197, -0.639763, 0.6980392, 1, 0, 1,
-0.848768, -1.134669, -2.709508, 0.6901961, 1, 0, 1,
-0.8483478, 0.1692767, -0.5996194, 0.6862745, 1, 0, 1,
-0.8446369, -0.9802305, -2.950062, 0.6784314, 1, 0, 1,
-0.8415855, 0.5088223, -0.6301386, 0.6745098, 1, 0, 1,
-0.8415803, -0.6331863, -1.820576, 0.6666667, 1, 0, 1,
-0.8402388, -0.7516001, -2.659678, 0.6627451, 1, 0, 1,
-0.833573, -1.985875, -3.675726, 0.654902, 1, 0, 1,
-0.831709, 0.5157019, -2.231053, 0.6509804, 1, 0, 1,
-0.830908, 0.5417436, -0.6965699, 0.6431373, 1, 0, 1,
-0.8275935, 0.3765747, -0.3301437, 0.6392157, 1, 0, 1,
-0.8198836, -0.9140606, -3.520879, 0.6313726, 1, 0, 1,
-0.816446, 0.4831037, -1.346346, 0.627451, 1, 0, 1,
-0.8141878, 2.497597, 0.2450068, 0.6196079, 1, 0, 1,
-0.8127729, -0.4661278, -2.070726, 0.6156863, 1, 0, 1,
-0.8109542, 0.7438301, -2.008763, 0.6078432, 1, 0, 1,
-0.807947, 2.041386, 0.6559134, 0.6039216, 1, 0, 1,
-0.8021274, 0.2043695, -1.931059, 0.5960785, 1, 0, 1,
-0.8004942, 0.305656, -3.472444, 0.5882353, 1, 0, 1,
-0.797678, 1.062218, -1.042092, 0.5843138, 1, 0, 1,
-0.7960631, 0.9813958, -0.7758806, 0.5764706, 1, 0, 1,
-0.7941241, 0.9173106, -0.6825863, 0.572549, 1, 0, 1,
-0.7877996, -0.004526828, 0.0167185, 0.5647059, 1, 0, 1,
-0.7864196, 0.3101361, 0.9203184, 0.5607843, 1, 0, 1,
-0.786155, -0.4238092, -3.299175, 0.5529412, 1, 0, 1,
-0.7799394, -1.017734, -2.199873, 0.5490196, 1, 0, 1,
-0.7785971, 0.5258063, -0.2469269, 0.5411765, 1, 0, 1,
-0.7758615, -0.637503, -0.6206917, 0.5372549, 1, 0, 1,
-0.7665864, 0.3435866, -1.643171, 0.5294118, 1, 0, 1,
-0.7662508, -1.270816, -2.513198, 0.5254902, 1, 0, 1,
-0.7562872, -0.5985516, -2.59524, 0.5176471, 1, 0, 1,
-0.755518, -0.469753, -2.268842, 0.5137255, 1, 0, 1,
-0.7540249, -0.8789161, -1.966368, 0.5058824, 1, 0, 1,
-0.7481104, 2.173073, -0.3060369, 0.5019608, 1, 0, 1,
-0.7424521, 0.5602472, -2.113363, 0.4941176, 1, 0, 1,
-0.7379294, -0.003709342, -1.60873, 0.4862745, 1, 0, 1,
-0.7346107, -0.4913701, -1.847165, 0.4823529, 1, 0, 1,
-0.7309526, -0.01097267, -1.811581, 0.4745098, 1, 0, 1,
-0.7287446, 0.5949526, -1.73462, 0.4705882, 1, 0, 1,
-0.7286257, -0.3236934, -2.618271, 0.4627451, 1, 0, 1,
-0.7266926, -0.4994064, -2.573436, 0.4588235, 1, 0, 1,
-0.7255812, -0.7762169, -3.225703, 0.4509804, 1, 0, 1,
-0.7232299, 0.8324067, -0.3976816, 0.4470588, 1, 0, 1,
-0.7172831, -0.8739382, -1.654387, 0.4392157, 1, 0, 1,
-0.7172415, -1.384846, -0.8660334, 0.4352941, 1, 0, 1,
-0.7160785, 0.008083444, -0.5969266, 0.427451, 1, 0, 1,
-0.7140982, -0.393359, -0.9174697, 0.4235294, 1, 0, 1,
-0.706466, 1.360835, 1.219308, 0.4156863, 1, 0, 1,
-0.7064234, 0.4159153, -0.8353062, 0.4117647, 1, 0, 1,
-0.6997781, -0.8871098, -2.117064, 0.4039216, 1, 0, 1,
-0.6984113, 0.3692302, -1.58584, 0.3960784, 1, 0, 1,
-0.6984029, 0.1740108, -0.7571566, 0.3921569, 1, 0, 1,
-0.6981593, -0.9468467, -2.051996, 0.3843137, 1, 0, 1,
-0.6907138, 0.4137809, -1.802631, 0.3803922, 1, 0, 1,
-0.6904152, 0.6602007, -0.08679381, 0.372549, 1, 0, 1,
-0.6862668, 1.880801, 0.7043542, 0.3686275, 1, 0, 1,
-0.6838096, -2.437978, -2.685609, 0.3607843, 1, 0, 1,
-0.6733355, -0.8283244, -3.405679, 0.3568628, 1, 0, 1,
-0.6728045, -0.0948289, -2.302715, 0.3490196, 1, 0, 1,
-0.6679479, 0.6491342, -0.1143563, 0.345098, 1, 0, 1,
-0.6658649, 2.125079, -1.923789, 0.3372549, 1, 0, 1,
-0.6517909, 0.4981714, -0.8744148, 0.3333333, 1, 0, 1,
-0.6484311, -0.5753632, -2.314686, 0.3254902, 1, 0, 1,
-0.6460895, -0.8282523, -2.29287, 0.3215686, 1, 0, 1,
-0.6407283, 1.486046, 0.2389802, 0.3137255, 1, 0, 1,
-0.6406263, -0.6608909, -1.24242, 0.3098039, 1, 0, 1,
-0.6400608, 1.480933, -0.3601252, 0.3019608, 1, 0, 1,
-0.6371189, -1.071128, -2.060097, 0.2941177, 1, 0, 1,
-0.6331433, 0.1647894, -1.789338, 0.2901961, 1, 0, 1,
-0.6329389, -0.5339249, -1.566905, 0.282353, 1, 0, 1,
-0.6234888, -2.182113, -2.026403, 0.2784314, 1, 0, 1,
-0.6164897, -0.3918924, -2.58456, 0.2705882, 1, 0, 1,
-0.6125255, -0.3085931, -0.4617836, 0.2666667, 1, 0, 1,
-0.6114466, 0.02873752, -0.4528984, 0.2588235, 1, 0, 1,
-0.610958, 0.6398759, 0.4287986, 0.254902, 1, 0, 1,
-0.608519, -0.2383023, -3.403903, 0.2470588, 1, 0, 1,
-0.6002305, -1.874657, -3.307137, 0.2431373, 1, 0, 1,
-0.5984958, -0.2098575, -2.524862, 0.2352941, 1, 0, 1,
-0.5944955, 0.589855, 0.8479815, 0.2313726, 1, 0, 1,
-0.587473, -0.9576999, -1.916079, 0.2235294, 1, 0, 1,
-0.5851803, -0.65234, -2.721386, 0.2196078, 1, 0, 1,
-0.5803144, -0.1258297, -3.234659, 0.2117647, 1, 0, 1,
-0.5779033, -1.885393, -4.037273, 0.2078431, 1, 0, 1,
-0.5739119, -0.2562176, -0.946619, 0.2, 1, 0, 1,
-0.571358, -1.920478, -3.531886, 0.1921569, 1, 0, 1,
-0.5644999, 0.4739383, -2.04126, 0.1882353, 1, 0, 1,
-0.5636373, 0.1290154, 0.3891178, 0.1803922, 1, 0, 1,
-0.5611789, 1.873111, 0.5602664, 0.1764706, 1, 0, 1,
-0.5600986, 0.6513521, 0.3236972, 0.1686275, 1, 0, 1,
-0.559481, 0.9779546, -0.6594172, 0.1647059, 1, 0, 1,
-0.5521336, 0.3252091, -1.645208, 0.1568628, 1, 0, 1,
-0.5473293, -0.1190797, -2.344692, 0.1529412, 1, 0, 1,
-0.5420167, 0.3867683, -1.171332, 0.145098, 1, 0, 1,
-0.539777, 1.134526, -0.7678439, 0.1411765, 1, 0, 1,
-0.5385037, 0.3677448, -0.6430713, 0.1333333, 1, 0, 1,
-0.5382078, -0.075813, -2.472027, 0.1294118, 1, 0, 1,
-0.5381244, -2.493601, -3.724157, 0.1215686, 1, 0, 1,
-0.5377772, -0.7610847, -2.889305, 0.1176471, 1, 0, 1,
-0.5354149, 0.2022721, -1.646868, 0.1098039, 1, 0, 1,
-0.5328408, -0.7642636, -0.4517435, 0.1058824, 1, 0, 1,
-0.531456, 0.3233518, -1.461792, 0.09803922, 1, 0, 1,
-0.5312505, 0.7035004, 0.4664636, 0.09019608, 1, 0, 1,
-0.5283561, -0.05219119, -2.082225, 0.08627451, 1, 0, 1,
-0.5232812, -1.62476, -1.793585, 0.07843138, 1, 0, 1,
-0.5211417, 0.1109577, -1.361012, 0.07450981, 1, 0, 1,
-0.5162299, -0.2111183, -3.747248, 0.06666667, 1, 0, 1,
-0.513899, 0.7757286, -0.4344595, 0.0627451, 1, 0, 1,
-0.5091785, -0.1358171, -1.038175, 0.05490196, 1, 0, 1,
-0.5037079, -1.845368, -3.849994, 0.05098039, 1, 0, 1,
-0.5033922, 0.2548961, -0.9169747, 0.04313726, 1, 0, 1,
-0.5026976, -0.1068997, -2.165815, 0.03921569, 1, 0, 1,
-0.5020775, -0.3107845, -1.369683, 0.03137255, 1, 0, 1,
-0.5011867, 0.1114491, -0.9535978, 0.02745098, 1, 0, 1,
-0.4986582, 0.7414113, 1.167462, 0.01960784, 1, 0, 1,
-0.4981652, -0.04442598, -0.7512196, 0.01568628, 1, 0, 1,
-0.4981637, 0.4996399, 0.4996568, 0.007843138, 1, 0, 1,
-0.4967169, -1.334594, -2.02356, 0.003921569, 1, 0, 1,
-0.4957106, -0.4020614, -1.492883, 0, 1, 0.003921569, 1,
-0.491946, -1.971872, -3.40935, 0, 1, 0.01176471, 1,
-0.4909267, 1.890775, -1.111579, 0, 1, 0.01568628, 1,
-0.4878025, 0.7495449, -2.664872, 0, 1, 0.02352941, 1,
-0.4870343, -0.7072089, -4.070186, 0, 1, 0.02745098, 1,
-0.4867148, 0.4511733, -1.951729, 0, 1, 0.03529412, 1,
-0.4790384, -0.2277908, -2.04525, 0, 1, 0.03921569, 1,
-0.4781051, 0.5090876, -2.508835, 0, 1, 0.04705882, 1,
-0.4726276, -2.425848, -3.74121, 0, 1, 0.05098039, 1,
-0.4715957, -0.08321182, -0.7683604, 0, 1, 0.05882353, 1,
-0.4713037, 0.2255775, -1.161016, 0, 1, 0.0627451, 1,
-0.4709992, 1.285791, -1.333158, 0, 1, 0.07058824, 1,
-0.4684431, -0.3265938, -3.290147, 0, 1, 0.07450981, 1,
-0.4668945, 0.9137113, 0.007485934, 0, 1, 0.08235294, 1,
-0.4566138, -0.5122303, -2.286434, 0, 1, 0.08627451, 1,
-0.454609, -1.475802, -1.818267, 0, 1, 0.09411765, 1,
-0.454102, 1.361379, -0.8805516, 0, 1, 0.1019608, 1,
-0.4520691, -1.182775, -2.375796, 0, 1, 0.1058824, 1,
-0.4518622, 1.657773, 0.3060906, 0, 1, 0.1137255, 1,
-0.4499946, -0.5859686, -2.660654, 0, 1, 0.1176471, 1,
-0.4424925, -1.106638, -2.747997, 0, 1, 0.1254902, 1,
-0.4407591, -0.8718305, -2.448917, 0, 1, 0.1294118, 1,
-0.4392577, 1.189792, -1.392438, 0, 1, 0.1372549, 1,
-0.4354576, -0.5574979, -2.966033, 0, 1, 0.1411765, 1,
-0.4334228, 0.7053966, -0.3461241, 0, 1, 0.1490196, 1,
-0.4309794, 0.4010345, -0.3407203, 0, 1, 0.1529412, 1,
-0.4290428, 0.4097933, -1.107069, 0, 1, 0.1607843, 1,
-0.4265909, -1.836682, -3.264311, 0, 1, 0.1647059, 1,
-0.4265448, 1.981993, 1.508025, 0, 1, 0.172549, 1,
-0.4242445, 0.8387901, -0.971984, 0, 1, 0.1764706, 1,
-0.4162837, -0.1272235, -1.50154, 0, 1, 0.1843137, 1,
-0.4157842, 0.5870183, -0.4461227, 0, 1, 0.1882353, 1,
-0.4123962, -0.3273202, -2.076899, 0, 1, 0.1960784, 1,
-0.4113884, -0.6310439, -4.661318, 0, 1, 0.2039216, 1,
-0.4110875, 0.5692428, -0.2461334, 0, 1, 0.2078431, 1,
-0.4107247, 0.4096819, 0.2997956, 0, 1, 0.2156863, 1,
-0.4093972, 0.414281, -2.394103, 0, 1, 0.2196078, 1,
-0.407707, 0.7957557, -0.8295047, 0, 1, 0.227451, 1,
-0.4073589, 0.06261548, -1.2934, 0, 1, 0.2313726, 1,
-0.4064073, 0.1218631, -1.059906, 0, 1, 0.2392157, 1,
-0.4041, 0.4829511, -0.5404646, 0, 1, 0.2431373, 1,
-0.403991, 0.9106701, -2.089095, 0, 1, 0.2509804, 1,
-0.4030977, 0.9836307, 1.274888, 0, 1, 0.254902, 1,
-0.3963524, -0.4468493, -3.756748, 0, 1, 0.2627451, 1,
-0.3930819, -0.6457189, -2.776275, 0, 1, 0.2666667, 1,
-0.3929562, 1.60603, 1.528877, 0, 1, 0.2745098, 1,
-0.3927709, -1.995881, -4.108844, 0, 1, 0.2784314, 1,
-0.3926581, 0.1684181, -0.9304816, 0, 1, 0.2862745, 1,
-0.3899481, -0.5699216, -2.729017, 0, 1, 0.2901961, 1,
-0.3882601, -1.081167, -4.172701, 0, 1, 0.2980392, 1,
-0.381139, 0.9785498, 0.05974751, 0, 1, 0.3058824, 1,
-0.3781898, -0.6922474, -1.177032, 0, 1, 0.3098039, 1,
-0.3766071, -0.3677138, -2.709019, 0, 1, 0.3176471, 1,
-0.3761785, -0.5782149, -2.51931, 0, 1, 0.3215686, 1,
-0.3591409, -0.6369559, -2.97616, 0, 1, 0.3294118, 1,
-0.35727, 0.03848203, -1.227277, 0, 1, 0.3333333, 1,
-0.3555536, -1.712626, -1.186171, 0, 1, 0.3411765, 1,
-0.3552381, -0.7049406, -5.159079, 0, 1, 0.345098, 1,
-0.3540905, 1.218582, -2.062383, 0, 1, 0.3529412, 1,
-0.3526704, 0.1068736, -2.935863, 0, 1, 0.3568628, 1,
-0.3505513, -0.8455023, -4.161613, 0, 1, 0.3647059, 1,
-0.3474924, 0.5210847, -1.347903, 0, 1, 0.3686275, 1,
-0.3470289, 0.606817, -1.777877, 0, 1, 0.3764706, 1,
-0.3466291, -0.4098848, -0.9972066, 0, 1, 0.3803922, 1,
-0.3457956, -0.594142, -2.173152, 0, 1, 0.3882353, 1,
-0.3428608, 0.9248706, -0.7029738, 0, 1, 0.3921569, 1,
-0.3403518, 0.6998276, -1.500367, 0, 1, 0.4, 1,
-0.3357864, -1.504295, -0.931254, 0, 1, 0.4078431, 1,
-0.3324077, 0.8333551, -1.043162, 0, 1, 0.4117647, 1,
-0.3321253, -0.2850597, -1.841739, 0, 1, 0.4196078, 1,
-0.328929, -0.2655278, -0.5586094, 0, 1, 0.4235294, 1,
-0.3272914, -0.8055483, -2.791956, 0, 1, 0.4313726, 1,
-0.3218337, 1.1494, 0.1067053, 0, 1, 0.4352941, 1,
-0.3171035, 0.6637366, -0.3448618, 0, 1, 0.4431373, 1,
-0.3106005, -0.1213513, -1.877772, 0, 1, 0.4470588, 1,
-0.3100043, 1.092752, 0.2419633, 0, 1, 0.454902, 1,
-0.3061228, -1.023358, -1.48997, 0, 1, 0.4588235, 1,
-0.3006028, 1.582191, -1.128125, 0, 1, 0.4666667, 1,
-0.3004257, 0.1105536, 0.070868, 0, 1, 0.4705882, 1,
-0.3003386, 0.788633, 1.762472, 0, 1, 0.4784314, 1,
-0.2977492, 0.518299, -0.8880683, 0, 1, 0.4823529, 1,
-0.2971665, -0.396842, -2.436168, 0, 1, 0.4901961, 1,
-0.2937886, 0.4776783, 0.6849973, 0, 1, 0.4941176, 1,
-0.2920845, -1.057594, -3.231601, 0, 1, 0.5019608, 1,
-0.2894597, -0.6788525, -2.175695, 0, 1, 0.509804, 1,
-0.2892202, 0.4974391, -1.328544, 0, 1, 0.5137255, 1,
-0.2852248, 1.854637, 0.4246102, 0, 1, 0.5215687, 1,
-0.2815647, -0.3871022, -3.949024, 0, 1, 0.5254902, 1,
-0.278646, 1.767544, -0.7549005, 0, 1, 0.5333334, 1,
-0.2715118, -0.2136193, -2.276562, 0, 1, 0.5372549, 1,
-0.2710866, -0.5606411, -2.155023, 0, 1, 0.5450981, 1,
-0.2684655, -1.145901, -3.627976, 0, 1, 0.5490196, 1,
-0.268187, 0.08261422, -2.850159, 0, 1, 0.5568628, 1,
-0.2666266, 2.144906, -2.398595, 0, 1, 0.5607843, 1,
-0.2649744, -0.8022047, -4.675297, 0, 1, 0.5686275, 1,
-0.2610517, 0.3258111, -1.974524, 0, 1, 0.572549, 1,
-0.2510117, -1.468156, -2.140501, 0, 1, 0.5803922, 1,
-0.2487535, -0.7696899, -1.913346, 0, 1, 0.5843138, 1,
-0.2472729, 1.555365, -0.9891818, 0, 1, 0.5921569, 1,
-0.2466689, 0.5789742, -1.516255, 0, 1, 0.5960785, 1,
-0.2417164, -0.5922356, -4.525595, 0, 1, 0.6039216, 1,
-0.2362422, 0.8852403, -2.747375, 0, 1, 0.6117647, 1,
-0.2330502, -0.5556323, -3.972417, 0, 1, 0.6156863, 1,
-0.2329525, -2.846622, -1.418535, 0, 1, 0.6235294, 1,
-0.2326561, 1.099266, -1.537623, 0, 1, 0.627451, 1,
-0.231012, -0.1614919, -2.153584, 0, 1, 0.6352941, 1,
-0.2294952, -0.67895, -2.677606, 0, 1, 0.6392157, 1,
-0.2289594, 1.708776, 0.8048552, 0, 1, 0.6470588, 1,
-0.2238183, -1.132656, -4.832041, 0, 1, 0.6509804, 1,
-0.2220395, -0.9642007, -2.758294, 0, 1, 0.6588235, 1,
-0.2200811, -1.735518, -2.21249, 0, 1, 0.6627451, 1,
-0.2152926, -1.346149, -2.977175, 0, 1, 0.6705883, 1,
-0.2086978, -1.681785, -2.793071, 0, 1, 0.6745098, 1,
-0.2083748, -0.8372484, -2.725887, 0, 1, 0.682353, 1,
-0.2064687, 0.30614, -1.010427, 0, 1, 0.6862745, 1,
-0.2060356, -0.5441224, -4.428956, 0, 1, 0.6941177, 1,
-0.2031295, -0.8668078, -4.260766, 0, 1, 0.7019608, 1,
-0.2025843, -2.135291, -2.470264, 0, 1, 0.7058824, 1,
-0.2020979, -0.7162882, -2.26862, 0, 1, 0.7137255, 1,
-0.2019799, 0.05317685, -0.7991067, 0, 1, 0.7176471, 1,
-0.2014765, -0.5766262, -2.999356, 0, 1, 0.7254902, 1,
-0.1984289, 0.7265102, -0.2804406, 0, 1, 0.7294118, 1,
-0.198124, 0.6324794, 0.06481179, 0, 1, 0.7372549, 1,
-0.1935335, -1.621081, -4.312821, 0, 1, 0.7411765, 1,
-0.1922981, -0.001362753, -2.803475, 0, 1, 0.7490196, 1,
-0.1916979, -1.080973, -1.089864, 0, 1, 0.7529412, 1,
-0.1853594, 0.07251754, -1.578801, 0, 1, 0.7607843, 1,
-0.1838439, -1.451496, -3.488451, 0, 1, 0.7647059, 1,
-0.1812332, -0.4559568, -2.992836, 0, 1, 0.772549, 1,
-0.1796281, 2.641622, -2.202514, 0, 1, 0.7764706, 1,
-0.1752755, -0.3665518, -2.405592, 0, 1, 0.7843137, 1,
-0.1746467, -0.2393675, -2.732879, 0, 1, 0.7882353, 1,
-0.1705509, -2.259505, -3.384411, 0, 1, 0.7960784, 1,
-0.1688983, -0.06444632, -1.843747, 0, 1, 0.8039216, 1,
-0.1659605, 0.3660789, 1.586208, 0, 1, 0.8078431, 1,
-0.1602077, -0.3709178, -2.824175, 0, 1, 0.8156863, 1,
-0.1506663, -2.842122, -1.233924, 0, 1, 0.8196079, 1,
-0.1506416, -0.8718356, -1.750016, 0, 1, 0.827451, 1,
-0.1439322, -0.9292928, 0.006042065, 0, 1, 0.8313726, 1,
-0.1392129, -1.750904, -3.111858, 0, 1, 0.8392157, 1,
-0.1383424, 1.66082, 0.3810546, 0, 1, 0.8431373, 1,
-0.135739, 0.8253481, -0.2996875, 0, 1, 0.8509804, 1,
-0.1294773, -0.9098912, -4.835308, 0, 1, 0.854902, 1,
-0.1286156, -1.455132, -4.337587, 0, 1, 0.8627451, 1,
-0.1276481, 1.287453, 0.8372206, 0, 1, 0.8666667, 1,
-0.1203061, -0.4890338, -3.684876, 0, 1, 0.8745098, 1,
-0.1201133, 0.3207881, 0.5536671, 0, 1, 0.8784314, 1,
-0.1196453, 0.7128591, 0.8404166, 0, 1, 0.8862745, 1,
-0.1185979, 0.4081555, 1.052069, 0, 1, 0.8901961, 1,
-0.117375, 1.12543, -0.5937187, 0, 1, 0.8980392, 1,
-0.1162593, 0.9316767, -0.605973, 0, 1, 0.9058824, 1,
-0.1143232, 0.5558315, 0.2400153, 0, 1, 0.9098039, 1,
-0.104075, -1.879472, -3.360861, 0, 1, 0.9176471, 1,
-0.1034112, 0.8537132, -0.04688166, 0, 1, 0.9215686, 1,
-0.09455539, -0.276141, -2.25003, 0, 1, 0.9294118, 1,
-0.09167118, 0.1672923, -1.60058, 0, 1, 0.9333333, 1,
-0.08966889, 0.2792164, -0.3797349, 0, 1, 0.9411765, 1,
-0.0869647, 0.5925395, 0.1613493, 0, 1, 0.945098, 1,
-0.08484422, 0.562602, -1.291149, 0, 1, 0.9529412, 1,
-0.0815611, -2.04683, -1.83849, 0, 1, 0.9568627, 1,
-0.07466038, -0.4863906, -2.185281, 0, 1, 0.9647059, 1,
-0.07053179, -0.1345235, -1.142685, 0, 1, 0.9686275, 1,
-0.06957246, 0.8732334, -1.40384, 0, 1, 0.9764706, 1,
-0.06927414, -0.3634143, -0.774572, 0, 1, 0.9803922, 1,
-0.06601499, 0.08186018, -0.2716537, 0, 1, 0.9882353, 1,
-0.06025972, -0.8012022, -3.350849, 0, 1, 0.9921569, 1,
-0.05496622, 0.199609, 0.6010756, 0, 1, 1, 1,
-0.05072113, 0.6639456, -0.2096295, 0, 0.9921569, 1, 1,
-0.04689678, 0.898698, -1.40477, 0, 0.9882353, 1, 1,
-0.04480737, 0.8784363, -0.4310504, 0, 0.9803922, 1, 1,
-0.03667165, -0.4642029, -2.20302, 0, 0.9764706, 1, 1,
-0.0349017, 0.1510782, 0.2217246, 0, 0.9686275, 1, 1,
-0.03384535, -0.2289485, -1.807193, 0, 0.9647059, 1, 1,
-0.03173994, 0.7176003, 1.383616, 0, 0.9568627, 1, 1,
-0.03145995, 2.005333, 0.4677552, 0, 0.9529412, 1, 1,
-0.02823082, -1.000672, -3.831528, 0, 0.945098, 1, 1,
-0.02820498, 2.297293, -0.7689022, 0, 0.9411765, 1, 1,
-0.02809774, 0.5499279, -0.4300265, 0, 0.9333333, 1, 1,
-0.02719125, -0.3923282, -3.862349, 0, 0.9294118, 1, 1,
-0.02688418, 1.937114, -2.215123, 0, 0.9215686, 1, 1,
-0.02537893, -0.8883628, -4.055445, 0, 0.9176471, 1, 1,
-0.02509547, -0.9922936, -3.727129, 0, 0.9098039, 1, 1,
-0.0247637, 0.4295064, -0.5622405, 0, 0.9058824, 1, 1,
-0.0229718, -0.4972682, -2.911525, 0, 0.8980392, 1, 1,
-0.02152118, -1.462536, -0.6175948, 0, 0.8901961, 1, 1,
-0.01915145, 1.183482, 0.1851746, 0, 0.8862745, 1, 1,
-0.01686797, -0.5498672, -3.440081, 0, 0.8784314, 1, 1,
-0.01604593, -0.4880129, -2.888385, 0, 0.8745098, 1, 1,
-0.01436519, 1.248137, 1.469841, 0, 0.8666667, 1, 1,
-0.01264909, -1.858024, -2.919016, 0, 0.8627451, 1, 1,
-0.01173626, -0.4352283, -2.774113, 0, 0.854902, 1, 1,
-0.008737745, 0.2680603, 2.514537, 0, 0.8509804, 1, 1,
-0.005794181, -0.6320996, -2.092478, 0, 0.8431373, 1, 1,
-0.004843864, -1.144565, -2.601719, 0, 0.8392157, 1, 1,
-0.004114899, -0.03438729, -2.169502, 0, 0.8313726, 1, 1,
-0.00372147, -0.1690203, -3.242972, 0, 0.827451, 1, 1,
0.006040075, 0.3184049, -0.107786, 0, 0.8196079, 1, 1,
0.008281698, 0.8297475, 1.498979, 0, 0.8156863, 1, 1,
0.009436245, 1.414956, 0.05350712, 0, 0.8078431, 1, 1,
0.01072343, 0.5593399, 0.6874757, 0, 0.8039216, 1, 1,
0.01253951, -0.4288961, 3.765674, 0, 0.7960784, 1, 1,
0.01657493, 0.3099992, 1.34889, 0, 0.7882353, 1, 1,
0.02572205, 0.1447206, -1.271927, 0, 0.7843137, 1, 1,
0.03471623, 1.094617, -0.2192826, 0, 0.7764706, 1, 1,
0.03969068, -2.244612, 2.715547, 0, 0.772549, 1, 1,
0.03974618, 0.7484354, 1.038508, 0, 0.7647059, 1, 1,
0.04206122, -2.232277, 2.342724, 0, 0.7607843, 1, 1,
0.04316258, 0.4783024, 0.2518863, 0, 0.7529412, 1, 1,
0.04564157, -1.179002, 3.472943, 0, 0.7490196, 1, 1,
0.04979447, 0.5185953, 1.236179, 0, 0.7411765, 1, 1,
0.05381048, 0.501844, -0.6831849, 0, 0.7372549, 1, 1,
0.05868692, -0.5440407, 3.100283, 0, 0.7294118, 1, 1,
0.06206992, 0.3542896, 0.1277892, 0, 0.7254902, 1, 1,
0.06740576, -1.701565, 1.970848, 0, 0.7176471, 1, 1,
0.06907926, 1.199914, 0.7722725, 0, 0.7137255, 1, 1,
0.07014037, 1.028877, 0.9864627, 0, 0.7058824, 1, 1,
0.07151715, 1.075586, 1.142625, 0, 0.6980392, 1, 1,
0.07526892, 0.2628998, 0.4482946, 0, 0.6941177, 1, 1,
0.07541931, -0.41357, 1.773775, 0, 0.6862745, 1, 1,
0.07826345, 1.163617, 1.565619, 0, 0.682353, 1, 1,
0.07975152, -0.140913, 4.112585, 0, 0.6745098, 1, 1,
0.07996651, -1.855622, 2.877454, 0, 0.6705883, 1, 1,
0.08134923, 0.0006342274, 1.65077, 0, 0.6627451, 1, 1,
0.08401229, -1.421383, 3.600667, 0, 0.6588235, 1, 1,
0.08834405, 0.9044334, -1.453818, 0, 0.6509804, 1, 1,
0.08842951, 0.8015514, -0.06657461, 0, 0.6470588, 1, 1,
0.09152286, -2.042464, 4.572228, 0, 0.6392157, 1, 1,
0.09805463, 0.4737537, -0.04890575, 0, 0.6352941, 1, 1,
0.1076255, -0.4876706, 3.08868, 0, 0.627451, 1, 1,
0.1079376, -0.8313615, 2.438001, 0, 0.6235294, 1, 1,
0.1103313, 1.413705, -0.739751, 0, 0.6156863, 1, 1,
0.1110172, -1.044091, 3.342591, 0, 0.6117647, 1, 1,
0.1183246, 0.9081857, 0.2268168, 0, 0.6039216, 1, 1,
0.1227755, -0.1984441, 2.154643, 0, 0.5960785, 1, 1,
0.1264453, 1.30198, -0.3808347, 0, 0.5921569, 1, 1,
0.1297153, 1.10908, 1.140166, 0, 0.5843138, 1, 1,
0.1309928, -0.3804755, 2.23723, 0, 0.5803922, 1, 1,
0.1315061, 0.1000781, 0.3142259, 0, 0.572549, 1, 1,
0.1361392, -0.9761992, 2.150562, 0, 0.5686275, 1, 1,
0.1370444, -0.2804088, 2.66389, 0, 0.5607843, 1, 1,
0.1404729, -0.9299313, 3.315265, 0, 0.5568628, 1, 1,
0.1422969, -0.6194692, 2.724595, 0, 0.5490196, 1, 1,
0.1489925, -0.1888437, 2.675119, 0, 0.5450981, 1, 1,
0.157094, -0.9268073, 2.898663, 0, 0.5372549, 1, 1,
0.1578447, -0.6480093, 2.604592, 0, 0.5333334, 1, 1,
0.1596171, 1.090283, -0.2297521, 0, 0.5254902, 1, 1,
0.1617109, 0.09845742, 0.8184196, 0, 0.5215687, 1, 1,
0.1623268, 1.305226, 1.940882, 0, 0.5137255, 1, 1,
0.1658129, -0.8448727, 3.68854, 0, 0.509804, 1, 1,
0.170573, 0.2834197, 0.3213796, 0, 0.5019608, 1, 1,
0.1720913, 0.5369017, 3.496078, 0, 0.4941176, 1, 1,
0.1728626, 0.6543202, -0.2176645, 0, 0.4901961, 1, 1,
0.1754013, -1.895898, -0.3297864, 0, 0.4823529, 1, 1,
0.1767709, 0.2140006, -0.9497426, 0, 0.4784314, 1, 1,
0.1774232, -0.5656465, 3.341792, 0, 0.4705882, 1, 1,
0.1796727, -1.126957, 3.417743, 0, 0.4666667, 1, 1,
0.1831961, -1.215864, 1.70951, 0, 0.4588235, 1, 1,
0.1905762, 3.088753, -0.8703231, 0, 0.454902, 1, 1,
0.1907462, -0.02487855, 0.1757538, 0, 0.4470588, 1, 1,
0.1927352, 0.8037434, -0.8020402, 0, 0.4431373, 1, 1,
0.1984937, -0.1335555, 2.372214, 0, 0.4352941, 1, 1,
0.1987328, 0.2075346, 1.22249, 0, 0.4313726, 1, 1,
0.2024288, 2.146646, 0.5923648, 0, 0.4235294, 1, 1,
0.2036816, -0.275366, 1.226939, 0, 0.4196078, 1, 1,
0.2053911, 0.870053, 0.1185373, 0, 0.4117647, 1, 1,
0.2092178, 0.1562746, 1.014615, 0, 0.4078431, 1, 1,
0.2093123, 0.03442691, 2.782526, 0, 0.4, 1, 1,
0.2096495, 0.1366843, 1.722335, 0, 0.3921569, 1, 1,
0.2112594, -0.332404, 1.423135, 0, 0.3882353, 1, 1,
0.2148345, 0.9964753, 0.1710192, 0, 0.3803922, 1, 1,
0.2200373, 0.404684, 0.007993024, 0, 0.3764706, 1, 1,
0.2232469, -0.9258379, 3.283379, 0, 0.3686275, 1, 1,
0.2263487, 1.664258, 0.1986251, 0, 0.3647059, 1, 1,
0.2275555, 0.8166811, -0.2434992, 0, 0.3568628, 1, 1,
0.2287819, -0.01704524, 1.464387, 0, 0.3529412, 1, 1,
0.2451688, -2.11826, 1.448243, 0, 0.345098, 1, 1,
0.2473723, -0.8749821, 0.8934034, 0, 0.3411765, 1, 1,
0.2510078, -0.1334051, 3.047971, 0, 0.3333333, 1, 1,
0.2576392, 0.9543613, 0.8630906, 0, 0.3294118, 1, 1,
0.2597204, -0.4517489, 2.966646, 0, 0.3215686, 1, 1,
0.2612476, 0.3726653, -0.7025161, 0, 0.3176471, 1, 1,
0.2672787, 1.482607, -1.586704, 0, 0.3098039, 1, 1,
0.2681998, 1.390261, -0.7234895, 0, 0.3058824, 1, 1,
0.2682813, 0.8942496, -0.1794274, 0, 0.2980392, 1, 1,
0.2686501, 0.4727305, 1.367597, 0, 0.2901961, 1, 1,
0.2686567, 1.506553, -0.5020508, 0, 0.2862745, 1, 1,
0.2747475, -0.1292992, 1.690729, 0, 0.2784314, 1, 1,
0.2787844, -0.2354934, 2.67324, 0, 0.2745098, 1, 1,
0.2788989, 0.4563517, 2.189057, 0, 0.2666667, 1, 1,
0.283692, 0.2911855, 2.152641, 0, 0.2627451, 1, 1,
0.2856965, -0.7049494, 2.012133, 0, 0.254902, 1, 1,
0.2872032, -0.2590867, 1.777976, 0, 0.2509804, 1, 1,
0.2876603, -0.8305399, 1.92624, 0, 0.2431373, 1, 1,
0.2877386, -0.1826892, 2.638261, 0, 0.2392157, 1, 1,
0.2961049, 0.2766534, 0.9510197, 0, 0.2313726, 1, 1,
0.2985432, 0.5511296, 0.4322205, 0, 0.227451, 1, 1,
0.2999786, 1.546277, 2.115535, 0, 0.2196078, 1, 1,
0.3026619, 0.01680543, 1.549353, 0, 0.2156863, 1, 1,
0.3053467, -0.539578, 2.561162, 0, 0.2078431, 1, 1,
0.3095282, -0.4723914, 2.044489, 0, 0.2039216, 1, 1,
0.3140856, 0.8720406, 0.1624876, 0, 0.1960784, 1, 1,
0.3166462, -0.1003239, 0.567985, 0, 0.1882353, 1, 1,
0.3193815, 0.357094, 0.6612076, 0, 0.1843137, 1, 1,
0.3221473, 2.152664, -0.8082338, 0, 0.1764706, 1, 1,
0.3223865, -0.318538, 2.721159, 0, 0.172549, 1, 1,
0.3303415, -1.919874, 1.526914, 0, 0.1647059, 1, 1,
0.3307834, 1.416124, 0.867247, 0, 0.1607843, 1, 1,
0.3349947, -0.7164192, 2.296636, 0, 0.1529412, 1, 1,
0.335409, -0.2196876, 1.060907, 0, 0.1490196, 1, 1,
0.3361661, -1.609919, 3.547295, 0, 0.1411765, 1, 1,
0.3443698, 0.4735344, -1.268054, 0, 0.1372549, 1, 1,
0.3444583, 0.9226936, 0.3613804, 0, 0.1294118, 1, 1,
0.3446183, 0.9416066, 1.047362, 0, 0.1254902, 1, 1,
0.345893, 0.6953799, 0.8284159, 0, 0.1176471, 1, 1,
0.3485217, -0.2328624, 1.710795, 0, 0.1137255, 1, 1,
0.348696, -0.3349318, 2.697181, 0, 0.1058824, 1, 1,
0.3508601, -0.4253452, 3.637314, 0, 0.09803922, 1, 1,
0.3522166, -0.3026743, 2.464866, 0, 0.09411765, 1, 1,
0.3542816, 0.9463415, 0.6416854, 0, 0.08627451, 1, 1,
0.3547291, 1.167894, 0.2762513, 0, 0.08235294, 1, 1,
0.356136, 1.950475, 0.7439049, 0, 0.07450981, 1, 1,
0.3637113, -1.954252, 2.127683, 0, 0.07058824, 1, 1,
0.3637453, -0.2452102, 3.599271, 0, 0.0627451, 1, 1,
0.3684669, -0.2395492, 1.075864, 0, 0.05882353, 1, 1,
0.3746617, 0.007405767, 1.276966, 0, 0.05098039, 1, 1,
0.3790719, -0.9782171, 1.182402, 0, 0.04705882, 1, 1,
0.3841931, 1.764271, 0.7070032, 0, 0.03921569, 1, 1,
0.3921737, -0.8996385, 2.599867, 0, 0.03529412, 1, 1,
0.3984887, 0.2197816, 1.856732, 0, 0.02745098, 1, 1,
0.4033548, 0.2242456, 2.527629, 0, 0.02352941, 1, 1,
0.4056993, 0.4768735, 1.730207, 0, 0.01568628, 1, 1,
0.408979, 0.4057528, -1.06548, 0, 0.01176471, 1, 1,
0.4102899, 0.7250896, 1.934794, 0, 0.003921569, 1, 1,
0.412116, 0.8245884, 1.295733, 0.003921569, 0, 1, 1,
0.4123957, 0.613007, 2.600287, 0.007843138, 0, 1, 1,
0.4133775, -1.678129, 3.662882, 0.01568628, 0, 1, 1,
0.4161631, -0.3699293, 2.664996, 0.01960784, 0, 1, 1,
0.4176536, 0.2637114, -1.381826, 0.02745098, 0, 1, 1,
0.4192458, 0.3773941, 1.702702, 0.03137255, 0, 1, 1,
0.423987, -1.038063, 2.811854, 0.03921569, 0, 1, 1,
0.4269068, 2.278259, 1.298869, 0.04313726, 0, 1, 1,
0.4271251, 0.04387087, 2.025804, 0.05098039, 0, 1, 1,
0.4290196, 0.2440984, 0.2588539, 0.05490196, 0, 1, 1,
0.4303067, -0.7253354, 2.9763, 0.0627451, 0, 1, 1,
0.4349963, -1.022596, 2.049307, 0.06666667, 0, 1, 1,
0.438493, -0.4930915, 2.103817, 0.07450981, 0, 1, 1,
0.4387516, 0.8801901, 1.261124, 0.07843138, 0, 1, 1,
0.4393177, 1.682748, 0.465768, 0.08627451, 0, 1, 1,
0.4394399, -3.54379, 4.072896, 0.09019608, 0, 1, 1,
0.4414124, -1.107028, 2.883784, 0.09803922, 0, 1, 1,
0.4517263, -1.442233, 3.020794, 0.1058824, 0, 1, 1,
0.4578737, -0.1401042, 2.294051, 0.1098039, 0, 1, 1,
0.4581692, -0.7567294, 0.7902513, 0.1176471, 0, 1, 1,
0.4598046, -0.3542078, 2.249115, 0.1215686, 0, 1, 1,
0.4618843, 0.3321645, 1.116559, 0.1294118, 0, 1, 1,
0.4627165, -1.7363, 2.459663, 0.1333333, 0, 1, 1,
0.4727085, -1.66736, 3.044179, 0.1411765, 0, 1, 1,
0.4756048, -0.0647556, 1.328509, 0.145098, 0, 1, 1,
0.4768052, 0.7027026, 0.4875787, 0.1529412, 0, 1, 1,
0.4803599, 2.281834, -0.01470125, 0.1568628, 0, 1, 1,
0.4804492, 1.504749, 1.85875, 0.1647059, 0, 1, 1,
0.4817725, 0.2223281, 1.561251, 0.1686275, 0, 1, 1,
0.4837977, 0.8573698, 2.518033, 0.1764706, 0, 1, 1,
0.4859148, 1.652746, -0.2051649, 0.1803922, 0, 1, 1,
0.5091679, 0.08235138, 2.603916, 0.1882353, 0, 1, 1,
0.516302, -0.2238883, 2.67591, 0.1921569, 0, 1, 1,
0.5186244, -1.231176, 1.567726, 0.2, 0, 1, 1,
0.5236421, 0.1172393, 1.717719, 0.2078431, 0, 1, 1,
0.5259328, -0.3788003, 0.311914, 0.2117647, 0, 1, 1,
0.5259695, 0.1988044, 0.5673996, 0.2196078, 0, 1, 1,
0.5275129, -0.2288704, 1.675786, 0.2235294, 0, 1, 1,
0.5285095, -0.4777466, 2.450145, 0.2313726, 0, 1, 1,
0.5334657, 0.2580186, -0.8825858, 0.2352941, 0, 1, 1,
0.5334886, 1.194712, 0.4580985, 0.2431373, 0, 1, 1,
0.538075, 0.6716259, 1.209632, 0.2470588, 0, 1, 1,
0.5405516, 0.5888765, 1.325155, 0.254902, 0, 1, 1,
0.5434435, 1.401461, 2.580709, 0.2588235, 0, 1, 1,
0.5448607, 1.458008, 0.4020987, 0.2666667, 0, 1, 1,
0.5476235, 1.182955, -0.9270044, 0.2705882, 0, 1, 1,
0.5580296, 0.1228389, 1.636398, 0.2784314, 0, 1, 1,
0.5607638, 1.265329, -2.516515, 0.282353, 0, 1, 1,
0.5717787, -1.225314, 2.368056, 0.2901961, 0, 1, 1,
0.5719445, 0.2660389, 2.386404, 0.2941177, 0, 1, 1,
0.5738611, -1.072115, 2.638353, 0.3019608, 0, 1, 1,
0.5774237, 1.634845, 0.9631038, 0.3098039, 0, 1, 1,
0.5777296, -0.5672646, 1.716597, 0.3137255, 0, 1, 1,
0.5793855, -1.344028, 2.761217, 0.3215686, 0, 1, 1,
0.5807379, -0.1958262, 2.614536, 0.3254902, 0, 1, 1,
0.5855461, -0.6174859, 2.28151, 0.3333333, 0, 1, 1,
0.5856149, -0.823586, 2.750855, 0.3372549, 0, 1, 1,
0.5934374, -0.9008102, 2.223333, 0.345098, 0, 1, 1,
0.5990489, 1.395138, 1.34544, 0.3490196, 0, 1, 1,
0.6015013, 1.138537, -0.1519827, 0.3568628, 0, 1, 1,
0.6042293, -0.09834597, -0.2702415, 0.3607843, 0, 1, 1,
0.6074507, -1.071961, 3.615822, 0.3686275, 0, 1, 1,
0.6132459, 1.247884, -1.322395, 0.372549, 0, 1, 1,
0.6138235, -0.7698733, 3.316713, 0.3803922, 0, 1, 1,
0.6212467, -1.187951, 3.108423, 0.3843137, 0, 1, 1,
0.6262428, 1.094337, 1.012684, 0.3921569, 0, 1, 1,
0.6281685, -0.5513134, 1.493076, 0.3960784, 0, 1, 1,
0.6331066, -0.01456646, 1.660399, 0.4039216, 0, 1, 1,
0.6360639, -0.2914571, 3.053173, 0.4117647, 0, 1, 1,
0.6400107, 0.5356771, 2.245223, 0.4156863, 0, 1, 1,
0.6421206, -1.114363, 3.745132, 0.4235294, 0, 1, 1,
0.6424679, 0.8548378, 0.1208607, 0.427451, 0, 1, 1,
0.6445207, -0.2121262, 1.169086, 0.4352941, 0, 1, 1,
0.6458732, -2.043773, 2.651777, 0.4392157, 0, 1, 1,
0.6504832, -0.635705, 3.118112, 0.4470588, 0, 1, 1,
0.6545504, 0.2412121, 1.497234, 0.4509804, 0, 1, 1,
0.666969, -0.917415, 1.984566, 0.4588235, 0, 1, 1,
0.667296, -1.039504, 2.979985, 0.4627451, 0, 1, 1,
0.674975, -1.629669, 2.034116, 0.4705882, 0, 1, 1,
0.6779925, -0.2543222, 0.4689356, 0.4745098, 0, 1, 1,
0.6796777, 1.606509, 1.2121, 0.4823529, 0, 1, 1,
0.6799667, 0.941697, 2.989156, 0.4862745, 0, 1, 1,
0.6800221, -0.08451325, 1.551267, 0.4941176, 0, 1, 1,
0.6919619, 0.7126102, 0.5026749, 0.5019608, 0, 1, 1,
0.6926109, 1.162103, 0.8041428, 0.5058824, 0, 1, 1,
0.6933073, 0.6833156, 1.404426, 0.5137255, 0, 1, 1,
0.6954949, 2.032446, 0.3194658, 0.5176471, 0, 1, 1,
0.6986762, 1.361033, 2.304485, 0.5254902, 0, 1, 1,
0.6999916, -0.7616277, 0.6753055, 0.5294118, 0, 1, 1,
0.7044492, -0.6965027, 3.678832, 0.5372549, 0, 1, 1,
0.7074486, -1.068615, 0.5487032, 0.5411765, 0, 1, 1,
0.7089444, 0.2997551, 1.67227, 0.5490196, 0, 1, 1,
0.7100605, -1.323938, 2.650755, 0.5529412, 0, 1, 1,
0.711469, 0.7994727, 1.728222, 0.5607843, 0, 1, 1,
0.7139262, 0.4309099, 2.18056, 0.5647059, 0, 1, 1,
0.7237515, -1.105221, 2.612051, 0.572549, 0, 1, 1,
0.7255942, -0.3787133, 0.48338, 0.5764706, 0, 1, 1,
0.726023, 1.398357, 1.138498, 0.5843138, 0, 1, 1,
0.7324992, -0.3731167, 1.579773, 0.5882353, 0, 1, 1,
0.7367786, 0.8816168, 2.030485, 0.5960785, 0, 1, 1,
0.7374236, -0.5483934, 2.379551, 0.6039216, 0, 1, 1,
0.7375848, 1.285552, 0.934064, 0.6078432, 0, 1, 1,
0.7391913, 0.8298792, 1.131416, 0.6156863, 0, 1, 1,
0.7401927, -0.1446043, 0.6795395, 0.6196079, 0, 1, 1,
0.7404355, -1.028187, 3.564909, 0.627451, 0, 1, 1,
0.7505845, 1.589323, -0.4107741, 0.6313726, 0, 1, 1,
0.7564868, -0.01887526, 0.7201576, 0.6392157, 0, 1, 1,
0.7578609, -0.1091956, 1.154365, 0.6431373, 0, 1, 1,
0.7737672, -1.372525, 2.040514, 0.6509804, 0, 1, 1,
0.7783447, 0.6959227, -1.402271, 0.654902, 0, 1, 1,
0.7783905, 1.048647, 1.84447, 0.6627451, 0, 1, 1,
0.7792608, 0.0346332, 2.837499, 0.6666667, 0, 1, 1,
0.7809591, -1.093246, 1.797096, 0.6745098, 0, 1, 1,
0.7825207, -0.5985282, 2.809144, 0.6784314, 0, 1, 1,
0.7865062, -1.517078, 1.913793, 0.6862745, 0, 1, 1,
0.7896155, 0.9949203, 0.5638602, 0.6901961, 0, 1, 1,
0.8009335, -0.4371645, 0.891287, 0.6980392, 0, 1, 1,
0.802495, 0.5487318, 0.6069099, 0.7058824, 0, 1, 1,
0.8094631, -0.3454057, 0.2871042, 0.7098039, 0, 1, 1,
0.8133336, 0.7031297, 0.866886, 0.7176471, 0, 1, 1,
0.8194495, 1.035614, -0.5975899, 0.7215686, 0, 1, 1,
0.8203176, -2.023752, 3.14085, 0.7294118, 0, 1, 1,
0.8255877, -0.5258081, 2.136332, 0.7333333, 0, 1, 1,
0.826252, -0.542175, 1.247544, 0.7411765, 0, 1, 1,
0.8283644, 0.5120183, 0.7282093, 0.7450981, 0, 1, 1,
0.8301798, -0.1012813, 2.016415, 0.7529412, 0, 1, 1,
0.8341936, 1.164416, 0.3864476, 0.7568628, 0, 1, 1,
0.8422278, -0.9376374, 1.156333, 0.7647059, 0, 1, 1,
0.8433858, -0.06331126, 0.3712393, 0.7686275, 0, 1, 1,
0.848929, -0.2150456, 0.8269408, 0.7764706, 0, 1, 1,
0.870858, 0.6883017, 0.3209188, 0.7803922, 0, 1, 1,
0.8737398, -1.576473, 4.503433, 0.7882353, 0, 1, 1,
0.8738119, 0.6749848, 0.3739739, 0.7921569, 0, 1, 1,
0.8766965, 1.487028, -1.897456, 0.8, 0, 1, 1,
0.877252, 0.8631192, -0.1084727, 0.8078431, 0, 1, 1,
0.880285, 1.141296, 1.706131, 0.8117647, 0, 1, 1,
0.8813666, 1.057629, 0.8369341, 0.8196079, 0, 1, 1,
0.8819985, -0.5715544, 2.071979, 0.8235294, 0, 1, 1,
0.8886253, -0.8356022, 1.492857, 0.8313726, 0, 1, 1,
0.8927603, -0.09338245, 2.327527, 0.8352941, 0, 1, 1,
0.8935997, 0.1837703, 1.80459, 0.8431373, 0, 1, 1,
0.9035546, 0.550421, 2.414572, 0.8470588, 0, 1, 1,
0.9037647, 0.4816664, 2.017131, 0.854902, 0, 1, 1,
0.9038131, 0.325612, 2.45868, 0.8588235, 0, 1, 1,
0.9063749, -0.4810945, 0.9641054, 0.8666667, 0, 1, 1,
0.9070163, -0.6326061, 2.548904, 0.8705882, 0, 1, 1,
0.9078993, -0.264804, 0.944911, 0.8784314, 0, 1, 1,
0.9101103, -0.629578, 3.032773, 0.8823529, 0, 1, 1,
0.9110261, -1.363306, 3.602279, 0.8901961, 0, 1, 1,
0.9155906, -0.8699074, 2.330584, 0.8941177, 0, 1, 1,
0.9244767, -2.014151, 2.486493, 0.9019608, 0, 1, 1,
0.9337287, -0.5767019, 3.829154, 0.9098039, 0, 1, 1,
0.9346564, 0.9674448, 0.8504782, 0.9137255, 0, 1, 1,
0.9357409, -1.114778, 2.232352, 0.9215686, 0, 1, 1,
0.9383093, 0.5726834, 0.9309421, 0.9254902, 0, 1, 1,
0.940798, -1.04388, 3.2615, 0.9333333, 0, 1, 1,
0.9453933, -0.1498599, 1.072257, 0.9372549, 0, 1, 1,
0.9468591, -0.8130078, 1.225968, 0.945098, 0, 1, 1,
0.9489059, 1.045837, -0.01488248, 0.9490196, 0, 1, 1,
0.9495021, 0.7501085, -0.1410044, 0.9568627, 0, 1, 1,
0.9540581, 1.140365, 1.655107, 0.9607843, 0, 1, 1,
0.9613588, 0.6704296, 1.176177, 0.9686275, 0, 1, 1,
0.9636915, 0.2186901, 0.4860372, 0.972549, 0, 1, 1,
0.9667451, 0.01326815, 2.514312, 0.9803922, 0, 1, 1,
0.9792123, -0.7408677, 3.25587, 0.9843137, 0, 1, 1,
0.9874436, 1.146959, 1.40307, 0.9921569, 0, 1, 1,
0.9904242, 3.005031, -0.1849064, 0.9960784, 0, 1, 1,
0.9942646, -1.073474, 2.074512, 1, 0, 0.9960784, 1,
0.9943982, -0.05485269, 1.836466, 1, 0, 0.9882353, 1,
0.9962569, 0.08707936, 0.6897669, 1, 0, 0.9843137, 1,
0.9987767, 1.088585, 0.791516, 1, 0, 0.9764706, 1,
1.008894, -0.7139218, 2.832772, 1, 0, 0.972549, 1,
1.016744, -0.4623156, 1.016262, 1, 0, 0.9647059, 1,
1.022785, -0.6226049, 3.00072, 1, 0, 0.9607843, 1,
1.028339, 0.7588164, 0.8833189, 1, 0, 0.9529412, 1,
1.032218, 1.320873, 2.00909, 1, 0, 0.9490196, 1,
1.039966, -1.659285, 0.8929584, 1, 0, 0.9411765, 1,
1.040011, -0.5114679, 0.9757065, 1, 0, 0.9372549, 1,
1.042917, -0.175899, 2.110579, 1, 0, 0.9294118, 1,
1.046312, -0.6103075, -0.09721889, 1, 0, 0.9254902, 1,
1.046363, -0.220673, 1.700799, 1, 0, 0.9176471, 1,
1.047748, 0.8129749, -0.0003432879, 1, 0, 0.9137255, 1,
1.049889, -1.494653, 2.83042, 1, 0, 0.9058824, 1,
1.052091, 0.9598972, 0.8006119, 1, 0, 0.9019608, 1,
1.053878, 1.543386, 0.6960821, 1, 0, 0.8941177, 1,
1.054564, -1.219679, 4.156607, 1, 0, 0.8862745, 1,
1.055121, 0.6349913, 1.113483, 1, 0, 0.8823529, 1,
1.067263, 0.4207103, 1.237434, 1, 0, 0.8745098, 1,
1.067693, -0.6754872, 3.16852, 1, 0, 0.8705882, 1,
1.088736, 1.554102, -0.109073, 1, 0, 0.8627451, 1,
1.089715, 0.3409539, 0.9603379, 1, 0, 0.8588235, 1,
1.090809, 0.4266102, -0.4976755, 1, 0, 0.8509804, 1,
1.091274, 1.45782, -0.6118733, 1, 0, 0.8470588, 1,
1.09757, -0.3871457, 2.918992, 1, 0, 0.8392157, 1,
1.10436, -0.2507035, 0.3581303, 1, 0, 0.8352941, 1,
1.105178, 0.2373071, 2.486262, 1, 0, 0.827451, 1,
1.10524, -0.1720569, 1.556743, 1, 0, 0.8235294, 1,
1.107779, -1.017833, 2.019837, 1, 0, 0.8156863, 1,
1.115205, -0.2304216, 1.621207, 1, 0, 0.8117647, 1,
1.121262, 0.298241, 0.457778, 1, 0, 0.8039216, 1,
1.125122, 0.3769699, 2.082172, 1, 0, 0.7960784, 1,
1.125955, 2.129601, 1.797591, 1, 0, 0.7921569, 1,
1.127032, 1.551601, -0.87447, 1, 0, 0.7843137, 1,
1.127465, 1.202196, -0.6174214, 1, 0, 0.7803922, 1,
1.135006, -0.305212, 1.568331, 1, 0, 0.772549, 1,
1.136636, 2.925821, 2.284459, 1, 0, 0.7686275, 1,
1.141453, 0.3287991, 2.861259, 1, 0, 0.7607843, 1,
1.145838, -0.4156083, 1.05678, 1, 0, 0.7568628, 1,
1.147684, 1.724526, 0.227497, 1, 0, 0.7490196, 1,
1.147788, -0.4942338, 3.07135, 1, 0, 0.7450981, 1,
1.149634, -1.008594, 1.626166, 1, 0, 0.7372549, 1,
1.1584, -0.2527938, 1.750067, 1, 0, 0.7333333, 1,
1.160889, -0.4627896, 3.044819, 1, 0, 0.7254902, 1,
1.165654, -0.5766479, 2.678359, 1, 0, 0.7215686, 1,
1.165712, 0.2854147, 1.186951, 1, 0, 0.7137255, 1,
1.171228, 1.777154, -1.163627, 1, 0, 0.7098039, 1,
1.171699, 0.5212393, 1.285283, 1, 0, 0.7019608, 1,
1.173307, 1.052697, 1.479941, 1, 0, 0.6941177, 1,
1.176134, -0.497493, 1.798078, 1, 0, 0.6901961, 1,
1.181933, 0.9801708, 2.674416, 1, 0, 0.682353, 1,
1.183714, 2.097801, -0.07687019, 1, 0, 0.6784314, 1,
1.185155, 0.8197924, 2.534928, 1, 0, 0.6705883, 1,
1.19164, 1.338774, -1.060019, 1, 0, 0.6666667, 1,
1.205484, 0.8549024, 0.6212274, 1, 0, 0.6588235, 1,
1.212873, -0.7965995, 2.542734, 1, 0, 0.654902, 1,
1.213045, -0.6720841, 3.594543, 1, 0, 0.6470588, 1,
1.217464, 0.284616, 0.7912188, 1, 0, 0.6431373, 1,
1.219442, 0.7242518, 0.8848742, 1, 0, 0.6352941, 1,
1.220617, 1.509032, 0.4157893, 1, 0, 0.6313726, 1,
1.22517, -0.9305538, 2.312583, 1, 0, 0.6235294, 1,
1.22629, -1.044204, 1.342103, 1, 0, 0.6196079, 1,
1.24797, -0.283265, 3.10975, 1, 0, 0.6117647, 1,
1.256223, 1.127153, 0.7840931, 1, 0, 0.6078432, 1,
1.256974, -2.817709, 2.96418, 1, 0, 0.6, 1,
1.257038, -2.274158, 4.390954, 1, 0, 0.5921569, 1,
1.259208, -1.636301, 2.533767, 1, 0, 0.5882353, 1,
1.265293, -1.447773, 1.827065, 1, 0, 0.5803922, 1,
1.266021, -0.4985309, 0.730763, 1, 0, 0.5764706, 1,
1.267631, 1.141136, 1.71346, 1, 0, 0.5686275, 1,
1.277049, -0.9009865, 3.544156, 1, 0, 0.5647059, 1,
1.278663, 1.350526, 1.664034, 1, 0, 0.5568628, 1,
1.283077, 0.6379121, 1.898168, 1, 0, 0.5529412, 1,
1.283628, 1.092783, 0.9934477, 1, 0, 0.5450981, 1,
1.289585, -1.173702, 3.229002, 1, 0, 0.5411765, 1,
1.310411, 0.6328062, 2.433141, 1, 0, 0.5333334, 1,
1.312705, -0.5762658, 1.453466, 1, 0, 0.5294118, 1,
1.317839, 0.5465295, 1.867245, 1, 0, 0.5215687, 1,
1.333846, -0.8522455, 0.6265307, 1, 0, 0.5176471, 1,
1.338736, 2.147077, -0.5357674, 1, 0, 0.509804, 1,
1.344466, 0.07431541, 2.711133, 1, 0, 0.5058824, 1,
1.354489, -2.559017, 3.143625, 1, 0, 0.4980392, 1,
1.358517, -0.8580038, 1.849493, 1, 0, 0.4901961, 1,
1.362778, -1.179183, 1.013865, 1, 0, 0.4862745, 1,
1.372706, -0.3591224, 2.185221, 1, 0, 0.4784314, 1,
1.379027, 0.01157404, 1.009391, 1, 0, 0.4745098, 1,
1.379681, 0.3606499, 1.426765, 1, 0, 0.4666667, 1,
1.397686, -0.2033881, 2.604775, 1, 0, 0.4627451, 1,
1.407344, 0.02752442, 1.937722, 1, 0, 0.454902, 1,
1.413128, -0.264512, 0.536463, 1, 0, 0.4509804, 1,
1.41475, 0.5934491, 1.505714, 1, 0, 0.4431373, 1,
1.419924, 1.240372, -0.3074084, 1, 0, 0.4392157, 1,
1.422495, 0.8657438, 0.745204, 1, 0, 0.4313726, 1,
1.423479, 0.8144056, 1.147066, 1, 0, 0.427451, 1,
1.426636, -0.3823655, 0.6400074, 1, 0, 0.4196078, 1,
1.435261, -0.07866737, 2.138336, 1, 0, 0.4156863, 1,
1.435498, -1.552537, 3.596068, 1, 0, 0.4078431, 1,
1.442097, 0.9030449, -1.167246, 1, 0, 0.4039216, 1,
1.457691, -0.2165408, 0.2356969, 1, 0, 0.3960784, 1,
1.474158, -0.1423098, 2.691036, 1, 0, 0.3882353, 1,
1.474881, -0.2286879, 1.713032, 1, 0, 0.3843137, 1,
1.47591, 1.138479, 1.099133, 1, 0, 0.3764706, 1,
1.480288, 1.969296, 0.5050579, 1, 0, 0.372549, 1,
1.533916, 0.0305635, 0.8050734, 1, 0, 0.3647059, 1,
1.537462, -0.3706196, 0.8920049, 1, 0, 0.3607843, 1,
1.539491, 0.5994835, 2.819817, 1, 0, 0.3529412, 1,
1.554311, -0.07577885, 1.875026, 1, 0, 0.3490196, 1,
1.577136, -0.9097278, 1.4983, 1, 0, 0.3411765, 1,
1.584769, 0.495759, 0.327242, 1, 0, 0.3372549, 1,
1.620643, 1.460561, 2.000891, 1, 0, 0.3294118, 1,
1.62165, -0.2640845, 2.416488, 1, 0, 0.3254902, 1,
1.624375, 0.8681974, -0.1041376, 1, 0, 0.3176471, 1,
1.63742, 0.9045469, 0.8248975, 1, 0, 0.3137255, 1,
1.639778, 0.9329283, 2.310101, 1, 0, 0.3058824, 1,
1.640142, 0.3468762, 1.64229, 1, 0, 0.2980392, 1,
1.664486, -1.127253, 1.914165, 1, 0, 0.2941177, 1,
1.667492, 0.204421, 0.6600548, 1, 0, 0.2862745, 1,
1.690757, -0.3229843, 1.486666, 1, 0, 0.282353, 1,
1.69078, 1.966625, 1.645479, 1, 0, 0.2745098, 1,
1.692847, -0.8846669, 2.500879, 1, 0, 0.2705882, 1,
1.693026, -0.4038691, 0.6888557, 1, 0, 0.2627451, 1,
1.696985, 1.32609, 0.7595118, 1, 0, 0.2588235, 1,
1.706833, -0.1414648, 0.3989095, 1, 0, 0.2509804, 1,
1.710579, -0.02151606, 2.684737, 1, 0, 0.2470588, 1,
1.715034, -0.01800494, 1.407759, 1, 0, 0.2392157, 1,
1.718349, 1.554323, 1.378026, 1, 0, 0.2352941, 1,
1.720817, -0.4701475, 0.8762377, 1, 0, 0.227451, 1,
1.724978, 1.033988, 0.4144302, 1, 0, 0.2235294, 1,
1.733178, -0.3952326, 1.06978, 1, 0, 0.2156863, 1,
1.760376, -0.7855631, 2.929374, 1, 0, 0.2117647, 1,
1.762714, 1.640858, 0.3970456, 1, 0, 0.2039216, 1,
1.769693, -0.4953307, 1.108158, 1, 0, 0.1960784, 1,
1.804763, 0.00181, 1.914216, 1, 0, 0.1921569, 1,
1.806293, 0.7677056, 0.5370328, 1, 0, 0.1843137, 1,
1.814653, 1.393646, -0.0677334, 1, 0, 0.1803922, 1,
1.816061, -0.3810787, 2.069533, 1, 0, 0.172549, 1,
1.817918, -0.4393526, 0.6410536, 1, 0, 0.1686275, 1,
1.819862, 0.8140738, -0.2264197, 1, 0, 0.1607843, 1,
1.874636, 0.5194939, 0.2686906, 1, 0, 0.1568628, 1,
1.875056, -1.404912, 2.101392, 1, 0, 0.1490196, 1,
1.878604, -1.400291, 4.194234, 1, 0, 0.145098, 1,
1.908558, -1.113245, 1.934533, 1, 0, 0.1372549, 1,
1.908926, -1.306808, 2.46088, 1, 0, 0.1333333, 1,
1.995104, 2.955839, -0.5885063, 1, 0, 0.1254902, 1,
2.013835, -0.4845959, 0.2055432, 1, 0, 0.1215686, 1,
2.020508, 0.5119736, 1.464943, 1, 0, 0.1137255, 1,
2.095063, 1.853065, -0.5622609, 1, 0, 0.1098039, 1,
2.110279, -0.8039851, 2.878775, 1, 0, 0.1019608, 1,
2.13343, -0.7263263, 0.6825638, 1, 0, 0.09411765, 1,
2.24285, 1.687589, 0.0319357, 1, 0, 0.09019608, 1,
2.263217, 0.3704425, 0.7320487, 1, 0, 0.08235294, 1,
2.266968, 0.6806476, 1.59464, 1, 0, 0.07843138, 1,
2.275844, 0.2950308, 1.294808, 1, 0, 0.07058824, 1,
2.337285, -0.4768473, 0.6217612, 1, 0, 0.06666667, 1,
2.358592, 0.280102, 2.444583, 1, 0, 0.05882353, 1,
2.379584, -0.8065436, 1.877933, 1, 0, 0.05490196, 1,
2.395575, -1.733815, 3.271605, 1, 0, 0.04705882, 1,
2.395787, 0.392902, 2.779353, 1, 0, 0.04313726, 1,
2.44541, 0.06218366, 0.1030863, 1, 0, 0.03529412, 1,
2.636817, -0.363706, 1.235288, 1, 0, 0.03137255, 1,
2.727586, 0.6393473, 1.636658, 1, 0, 0.02352941, 1,
2.780275, 0.4564602, 1.817381, 1, 0, 0.01960784, 1,
2.800881, -0.5184613, 1.972942, 1, 0, 0.01176471, 1,
3.267442, -1.873686, 2.653315, 1, 0, 0.007843138, 1
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
0.1335515, -4.668006, -6.808535, 0, -0.5, 0.5, 0.5,
0.1335515, -4.668006, -6.808535, 1, -0.5, 0.5, 0.5,
0.1335515, -4.668006, -6.808535, 1, 1.5, 0.5, 0.5,
0.1335515, -4.668006, -6.808535, 0, 1.5, 0.5, 0.5
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
-4.062727, -0.2275186, -6.808535, 0, -0.5, 0.5, 0.5,
-4.062727, -0.2275186, -6.808535, 1, -0.5, 0.5, 0.5,
-4.062727, -0.2275186, -6.808535, 1, 1.5, 0.5, 0.5,
-4.062727, -0.2275186, -6.808535, 0, 1.5, 0.5, 0.5
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
-4.062727, -4.668006, -0.2934251, 0, -0.5, 0.5, 0.5,
-4.062727, -4.668006, -0.2934251, 1, -0.5, 0.5, 0.5,
-4.062727, -4.668006, -0.2934251, 1, 1.5, 0.5, 0.5,
-4.062727, -4.668006, -0.2934251, 0, 1.5, 0.5, 0.5
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
-3, -3.643279, -5.305048,
3, -3.643279, -5.305048,
-3, -3.643279, -5.305048,
-3, -3.814066, -5.555629,
-2, -3.643279, -5.305048,
-2, -3.814066, -5.555629,
-1, -3.643279, -5.305048,
-1, -3.814066, -5.555629,
0, -3.643279, -5.305048,
0, -3.814066, -5.555629,
1, -3.643279, -5.305048,
1, -3.814066, -5.555629,
2, -3.643279, -5.305048,
2, -3.814066, -5.555629,
3, -3.643279, -5.305048,
3, -3.814066, -5.555629
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
-3, -4.155643, -6.056792, 0, -0.5, 0.5, 0.5,
-3, -4.155643, -6.056792, 1, -0.5, 0.5, 0.5,
-3, -4.155643, -6.056792, 1, 1.5, 0.5, 0.5,
-3, -4.155643, -6.056792, 0, 1.5, 0.5, 0.5,
-2, -4.155643, -6.056792, 0, -0.5, 0.5, 0.5,
-2, -4.155643, -6.056792, 1, -0.5, 0.5, 0.5,
-2, -4.155643, -6.056792, 1, 1.5, 0.5, 0.5,
-2, -4.155643, -6.056792, 0, 1.5, 0.5, 0.5,
-1, -4.155643, -6.056792, 0, -0.5, 0.5, 0.5,
-1, -4.155643, -6.056792, 1, -0.5, 0.5, 0.5,
-1, -4.155643, -6.056792, 1, 1.5, 0.5, 0.5,
-1, -4.155643, -6.056792, 0, 1.5, 0.5, 0.5,
0, -4.155643, -6.056792, 0, -0.5, 0.5, 0.5,
0, -4.155643, -6.056792, 1, -0.5, 0.5, 0.5,
0, -4.155643, -6.056792, 1, 1.5, 0.5, 0.5,
0, -4.155643, -6.056792, 0, 1.5, 0.5, 0.5,
1, -4.155643, -6.056792, 0, -0.5, 0.5, 0.5,
1, -4.155643, -6.056792, 1, -0.5, 0.5, 0.5,
1, -4.155643, -6.056792, 1, 1.5, 0.5, 0.5,
1, -4.155643, -6.056792, 0, 1.5, 0.5, 0.5,
2, -4.155643, -6.056792, 0, -0.5, 0.5, 0.5,
2, -4.155643, -6.056792, 1, -0.5, 0.5, 0.5,
2, -4.155643, -6.056792, 1, 1.5, 0.5, 0.5,
2, -4.155643, -6.056792, 0, 1.5, 0.5, 0.5,
3, -4.155643, -6.056792, 0, -0.5, 0.5, 0.5,
3, -4.155643, -6.056792, 1, -0.5, 0.5, 0.5,
3, -4.155643, -6.056792, 1, 1.5, 0.5, 0.5,
3, -4.155643, -6.056792, 0, 1.5, 0.5, 0.5
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
-3.094355, -3, -5.305048,
-3.094355, 3, -5.305048,
-3.094355, -3, -5.305048,
-3.255751, -3, -5.555629,
-3.094355, -2, -5.305048,
-3.255751, -2, -5.555629,
-3.094355, -1, -5.305048,
-3.255751, -1, -5.555629,
-3.094355, 0, -5.305048,
-3.255751, 0, -5.555629,
-3.094355, 1, -5.305048,
-3.255751, 1, -5.555629,
-3.094355, 2, -5.305048,
-3.255751, 2, -5.555629,
-3.094355, 3, -5.305048,
-3.255751, 3, -5.555629
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
-3.578541, -3, -6.056792, 0, -0.5, 0.5, 0.5,
-3.578541, -3, -6.056792, 1, -0.5, 0.5, 0.5,
-3.578541, -3, -6.056792, 1, 1.5, 0.5, 0.5,
-3.578541, -3, -6.056792, 0, 1.5, 0.5, 0.5,
-3.578541, -2, -6.056792, 0, -0.5, 0.5, 0.5,
-3.578541, -2, -6.056792, 1, -0.5, 0.5, 0.5,
-3.578541, -2, -6.056792, 1, 1.5, 0.5, 0.5,
-3.578541, -2, -6.056792, 0, 1.5, 0.5, 0.5,
-3.578541, -1, -6.056792, 0, -0.5, 0.5, 0.5,
-3.578541, -1, -6.056792, 1, -0.5, 0.5, 0.5,
-3.578541, -1, -6.056792, 1, 1.5, 0.5, 0.5,
-3.578541, -1, -6.056792, 0, 1.5, 0.5, 0.5,
-3.578541, 0, -6.056792, 0, -0.5, 0.5, 0.5,
-3.578541, 0, -6.056792, 1, -0.5, 0.5, 0.5,
-3.578541, 0, -6.056792, 1, 1.5, 0.5, 0.5,
-3.578541, 0, -6.056792, 0, 1.5, 0.5, 0.5,
-3.578541, 1, -6.056792, 0, -0.5, 0.5, 0.5,
-3.578541, 1, -6.056792, 1, -0.5, 0.5, 0.5,
-3.578541, 1, -6.056792, 1, 1.5, 0.5, 0.5,
-3.578541, 1, -6.056792, 0, 1.5, 0.5, 0.5,
-3.578541, 2, -6.056792, 0, -0.5, 0.5, 0.5,
-3.578541, 2, -6.056792, 1, -0.5, 0.5, 0.5,
-3.578541, 2, -6.056792, 1, 1.5, 0.5, 0.5,
-3.578541, 2, -6.056792, 0, 1.5, 0.5, 0.5,
-3.578541, 3, -6.056792, 0, -0.5, 0.5, 0.5,
-3.578541, 3, -6.056792, 1, -0.5, 0.5, 0.5,
-3.578541, 3, -6.056792, 1, 1.5, 0.5, 0.5,
-3.578541, 3, -6.056792, 0, 1.5, 0.5, 0.5
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
-3.094355, -3.643279, -4,
-3.094355, -3.643279, 4,
-3.094355, -3.643279, -4,
-3.255751, -3.814066, -4,
-3.094355, -3.643279, -2,
-3.255751, -3.814066, -2,
-3.094355, -3.643279, 0,
-3.255751, -3.814066, 0,
-3.094355, -3.643279, 2,
-3.255751, -3.814066, 2,
-3.094355, -3.643279, 4,
-3.255751, -3.814066, 4
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
-3.578541, -4.155643, -4, 0, -0.5, 0.5, 0.5,
-3.578541, -4.155643, -4, 1, -0.5, 0.5, 0.5,
-3.578541, -4.155643, -4, 1, 1.5, 0.5, 0.5,
-3.578541, -4.155643, -4, 0, 1.5, 0.5, 0.5,
-3.578541, -4.155643, -2, 0, -0.5, 0.5, 0.5,
-3.578541, -4.155643, -2, 1, -0.5, 0.5, 0.5,
-3.578541, -4.155643, -2, 1, 1.5, 0.5, 0.5,
-3.578541, -4.155643, -2, 0, 1.5, 0.5, 0.5,
-3.578541, -4.155643, 0, 0, -0.5, 0.5, 0.5,
-3.578541, -4.155643, 0, 1, -0.5, 0.5, 0.5,
-3.578541, -4.155643, 0, 1, 1.5, 0.5, 0.5,
-3.578541, -4.155643, 0, 0, 1.5, 0.5, 0.5,
-3.578541, -4.155643, 2, 0, -0.5, 0.5, 0.5,
-3.578541, -4.155643, 2, 1, -0.5, 0.5, 0.5,
-3.578541, -4.155643, 2, 1, 1.5, 0.5, 0.5,
-3.578541, -4.155643, 2, 0, 1.5, 0.5, 0.5,
-3.578541, -4.155643, 4, 0, -0.5, 0.5, 0.5,
-3.578541, -4.155643, 4, 1, -0.5, 0.5, 0.5,
-3.578541, -4.155643, 4, 1, 1.5, 0.5, 0.5,
-3.578541, -4.155643, 4, 0, 1.5, 0.5, 0.5
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
-3.094355, -3.643279, -5.305048,
-3.094355, 3.188241, -5.305048,
-3.094355, -3.643279, 4.718198,
-3.094355, 3.188241, 4.718198,
-3.094355, -3.643279, -5.305048,
-3.094355, -3.643279, 4.718198,
-3.094355, 3.188241, -5.305048,
-3.094355, 3.188241, 4.718198,
-3.094355, -3.643279, -5.305048,
3.361458, -3.643279, -5.305048,
-3.094355, -3.643279, 4.718198,
3.361458, -3.643279, 4.718198,
-3.094355, 3.188241, -5.305048,
3.361458, 3.188241, -5.305048,
-3.094355, 3.188241, 4.718198,
3.361458, 3.188241, 4.718198,
3.361458, -3.643279, -5.305048,
3.361458, 3.188241, -5.305048,
3.361458, -3.643279, 4.718198,
3.361458, 3.188241, 4.718198,
3.361458, -3.643279, -5.305048,
3.361458, -3.643279, 4.718198,
3.361458, 3.188241, -5.305048,
3.361458, 3.188241, 4.718198
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
var radius = 7.33738;
var distance = 32.64483;
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
mvMatrix.translate( -0.1335515, 0.2275186, 0.2934251 );
mvMatrix.scale( 1.228864, 1.161282, 0.791492 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.64483);
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
flufenoxuron<-read.table("flufenoxuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flufenoxuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'flufenoxuron' not found
```

```r
y<-flufenoxuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'flufenoxuron' not found
```

```r
z<-flufenoxuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'flufenoxuron' not found
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
-3.000339, 0.06384526, -1.896773, 0, 0, 1, 1, 1,
-2.84653, 1.202624, -1.927629, 1, 0, 0, 1, 1,
-2.801497, 0.1070256, -2.216614, 1, 0, 0, 1, 1,
-2.786618, 2.01499, -0.07188998, 1, 0, 0, 1, 1,
-2.755344, 0.9045958, -0.6261562, 1, 0, 0, 1, 1,
-2.582499, 0.008286558, -1.447429, 1, 0, 0, 1, 1,
-2.571488, 0.286204, -1.216698, 0, 0, 0, 1, 1,
-2.501418, -1.865367, -1.817655, 0, 0, 0, 1, 1,
-2.488583, -0.626463, -1.982937, 0, 0, 0, 1, 1,
-2.484312, 1.808147, -0.9893556, 0, 0, 0, 1, 1,
-2.458509, 0.6443408, -2.150241, 0, 0, 0, 1, 1,
-2.385003, 0.9603937, -1.111342, 0, 0, 0, 1, 1,
-2.319362, 1.023383, -1.796534, 0, 0, 0, 1, 1,
-2.136712, -0.1502632, -1.140763, 1, 1, 1, 1, 1,
-2.117861, 0.2592699, -0.781377, 1, 1, 1, 1, 1,
-2.099477, 1.675872, 0.6647686, 1, 1, 1, 1, 1,
-2.099241, -0.8247613, -0.006825903, 1, 1, 1, 1, 1,
-2.098215, -2.585449, -3.94561, 1, 1, 1, 1, 1,
-2.067621, -0.1560676, -4.039266, 1, 1, 1, 1, 1,
-2.044161, 0.4076649, -1.836704, 1, 1, 1, 1, 1,
-2.042941, -0.4011086, -2.079685, 1, 1, 1, 1, 1,
-1.992225, -1.72504, -2.114527, 1, 1, 1, 1, 1,
-1.98776, -0.1120807, -1.939348, 1, 1, 1, 1, 1,
-1.97528, -2.649159, -1.073887, 1, 1, 1, 1, 1,
-1.965479, -0.1933074, -1.315798, 1, 1, 1, 1, 1,
-1.947358, 1.079434, -2.193877, 1, 1, 1, 1, 1,
-1.943025, -0.2476733, -0.6662022, 1, 1, 1, 1, 1,
-1.928843, -0.8642101, -1.921048, 1, 1, 1, 1, 1,
-1.91376, 0.157856, -2.032638, 0, 0, 1, 1, 1,
-1.893074, 1.105457, -1.914035, 1, 0, 0, 1, 1,
-1.864711, 0.4671777, -2.175449, 1, 0, 0, 1, 1,
-1.853825, -0.712771, -3.463753, 1, 0, 0, 1, 1,
-1.852424, -1.216622, -1.477608, 1, 0, 0, 1, 1,
-1.842099, -0.4208386, -1.240195, 1, 0, 0, 1, 1,
-1.823942, 0.2073681, -1.040375, 0, 0, 0, 1, 1,
-1.811247, 0.3822413, -0.595549, 0, 0, 0, 1, 1,
-1.804822, 0.1821471, -0.7083931, 0, 0, 0, 1, 1,
-1.795235, -0.9009286, -3.706077, 0, 0, 0, 1, 1,
-1.794653, 0.1788257, -2.682499, 0, 0, 0, 1, 1,
-1.793957, 0.9372021, 0.3650731, 0, 0, 0, 1, 1,
-1.78542, -0.5696582, -1.218782, 0, 0, 0, 1, 1,
-1.770416, -0.4852569, -2.397813, 1, 1, 1, 1, 1,
-1.757992, -0.3345514, -2.463496, 1, 1, 1, 1, 1,
-1.757965, -0.4309185, -2.482362, 1, 1, 1, 1, 1,
-1.732754, -0.02557076, -0.8731951, 1, 1, 1, 1, 1,
-1.715135, 1.728867, -0.329378, 1, 1, 1, 1, 1,
-1.712592, -0.7443255, -2.385314, 1, 1, 1, 1, 1,
-1.687111, 1.101257, -1.087967, 1, 1, 1, 1, 1,
-1.682788, 0.05424483, -1.90306, 1, 1, 1, 1, 1,
-1.681635, 0.6070614, 0.8442799, 1, 1, 1, 1, 1,
-1.676332, -0.3912969, -2.412112, 1, 1, 1, 1, 1,
-1.651254, 0.009520352, -0.4160668, 1, 1, 1, 1, 1,
-1.649988, -2.56951, -4.154647, 1, 1, 1, 1, 1,
-1.646384, 0.1213526, -1.747509, 1, 1, 1, 1, 1,
-1.637732, -1.09133, -2.419108, 1, 1, 1, 1, 1,
-1.63531, -1.492673, -2.934867, 1, 1, 1, 1, 1,
-1.630418, 0.3972873, -0.3839476, 0, 0, 1, 1, 1,
-1.619598, 1.649494, -0.8571979, 1, 0, 0, 1, 1,
-1.617847, -1.496053, -3.035967, 1, 0, 0, 1, 1,
-1.613559, -1.178899, -3.002563, 1, 0, 0, 1, 1,
-1.60866, -1.530567, -1.950336, 1, 0, 0, 1, 1,
-1.588339, -0.06031435, -0.5940959, 1, 0, 0, 1, 1,
-1.58163, -0.05209148, -1.197706, 0, 0, 0, 1, 1,
-1.578233, 0.8107597, -2.002023, 0, 0, 0, 1, 1,
-1.577654, 0.718056, -2.325995, 0, 0, 0, 1, 1,
-1.577283, -0.5801405, -1.192581, 0, 0, 0, 1, 1,
-1.576989, 0.2500933, -1.372429, 0, 0, 0, 1, 1,
-1.559561, 0.2097477, -2.466673, 0, 0, 0, 1, 1,
-1.551336, -0.6563104, -1.670564, 0, 0, 0, 1, 1,
-1.54951, 0.3098195, -2.37614, 1, 1, 1, 1, 1,
-1.528177, -0.4372061, -1.760205, 1, 1, 1, 1, 1,
-1.527571, -1.92285, -2.132082, 1, 1, 1, 1, 1,
-1.52197, -1.066233, -3.073845, 1, 1, 1, 1, 1,
-1.504077, -0.9180641, -1.265844, 1, 1, 1, 1, 1,
-1.499178, -0.7901854, -3.37744, 1, 1, 1, 1, 1,
-1.49023, -0.2990387, -0.4634022, 1, 1, 1, 1, 1,
-1.478499, -0.1265885, -2.946126, 1, 1, 1, 1, 1,
-1.475374, -0.2425736, -1.154568, 1, 1, 1, 1, 1,
-1.463143, -0.7512758, 0.4417221, 1, 1, 1, 1, 1,
-1.46025, -0.8375878, -2.401531, 1, 1, 1, 1, 1,
-1.452176, 0.003682981, -2.461743, 1, 1, 1, 1, 1,
-1.432866, -1.33443, -2.71873, 1, 1, 1, 1, 1,
-1.431423, -0.6438932, -2.458839, 1, 1, 1, 1, 1,
-1.429225, 0.3475, -0.5085158, 1, 1, 1, 1, 1,
-1.415773, 1.237778, -0.9634292, 0, 0, 1, 1, 1,
-1.410173, -1.409614, -3.292671, 1, 0, 0, 1, 1,
-1.399982, 1.534235, 1.414405, 1, 0, 0, 1, 1,
-1.399609, -1.314015, -1.536447, 1, 0, 0, 1, 1,
-1.393415, 0.855118, -0.9120838, 1, 0, 0, 1, 1,
-1.393155, 1.883777, -2.085627, 1, 0, 0, 1, 1,
-1.380777, -1.192498, -4.652201, 0, 0, 0, 1, 1,
-1.376051, -0.2044595, -1.492923, 0, 0, 0, 1, 1,
-1.373306, -0.3452171, -2.533149, 0, 0, 0, 1, 1,
-1.35328, -0.3644326, -1.99689, 0, 0, 0, 1, 1,
-1.351777, -0.8843154, -1.735054, 0, 0, 0, 1, 1,
-1.343381, 1.967616, -1.04061, 0, 0, 0, 1, 1,
-1.343237, 0.771392, -0.4898906, 0, 0, 0, 1, 1,
-1.31999, -0.7932971, -2.019457, 1, 1, 1, 1, 1,
-1.317973, -0.4761343, -1.460835, 1, 1, 1, 1, 1,
-1.309444, 0.396182, -2.427204, 1, 1, 1, 1, 1,
-1.309145, -0.9324524, -2.429447, 1, 1, 1, 1, 1,
-1.299667, -0.697202, -2.438341, 1, 1, 1, 1, 1,
-1.285928, -1.121141, -1.416907, 1, 1, 1, 1, 1,
-1.27934, 0.7148764, -0.5246398, 1, 1, 1, 1, 1,
-1.27914, -0.3085897, -0.2060329, 1, 1, 1, 1, 1,
-1.274912, -0.5130973, -1.474402, 1, 1, 1, 1, 1,
-1.26697, 1.570692, 1.222902, 1, 1, 1, 1, 1,
-1.257881, -0.1694028, 1.53826, 1, 1, 1, 1, 1,
-1.236399, 0.952824, -1.306439, 1, 1, 1, 1, 1,
-1.225131, 1.065583, -1.80342, 1, 1, 1, 1, 1,
-1.219879, 1.755856, 0.4632332, 1, 1, 1, 1, 1,
-1.219274, -1.26752, -2.875086, 1, 1, 1, 1, 1,
-1.205185, -1.178532, -1.152453, 0, 0, 1, 1, 1,
-1.198539, -0.9249364, -2.410533, 1, 0, 0, 1, 1,
-1.197762, 0.1525277, 0.8820664, 1, 0, 0, 1, 1,
-1.196741, -0.03423012, -1.534765, 1, 0, 0, 1, 1,
-1.19597, 0.6191797, 0.0272839, 1, 0, 0, 1, 1,
-1.194832, 0.9655918, -0.7871176, 1, 0, 0, 1, 1,
-1.181124, 0.216896, -2.082335, 0, 0, 0, 1, 1,
-1.180356, -1.150245, -0.443264, 0, 0, 0, 1, 1,
-1.176789, -0.004187325, -1.387766, 0, 0, 0, 1, 1,
-1.173553, -0.9327486, -0.2442598, 0, 0, 0, 1, 1,
-1.173363, -1.993812, -1.315592, 0, 0, 0, 1, 1,
-1.163458, 1.505326, 1.049241, 0, 0, 0, 1, 1,
-1.160814, 1.838077, -0.8739578, 0, 0, 0, 1, 1,
-1.156963, 0.4640446, -2.415636, 1, 1, 1, 1, 1,
-1.147827, 1.476954, -1.734626, 1, 1, 1, 1, 1,
-1.138934, -1.197824, -1.607102, 1, 1, 1, 1, 1,
-1.137964, -1.07167, -4.79368, 1, 1, 1, 1, 1,
-1.132932, 0.05977246, -1.650589, 1, 1, 1, 1, 1,
-1.129999, -0.302852, -2.075955, 1, 1, 1, 1, 1,
-1.128612, 1.247658, -0.345466, 1, 1, 1, 1, 1,
-1.127126, 0.8672572, -0.6480095, 1, 1, 1, 1, 1,
-1.126118, -0.3617511, -0.9773835, 1, 1, 1, 1, 1,
-1.114817, -2.001299, -2.460275, 1, 1, 1, 1, 1,
-1.11354, 0.4905103, -1.273108, 1, 1, 1, 1, 1,
-1.1072, -0.4290152, -4.13755, 1, 1, 1, 1, 1,
-1.089347, 0.7743879, -1.931148, 1, 1, 1, 1, 1,
-1.086683, -0.2032478, -1.107395, 1, 1, 1, 1, 1,
-1.076436, -0.6067713, -4.340429, 1, 1, 1, 1, 1,
-1.072621, -0.4930404, -1.252648, 0, 0, 1, 1, 1,
-1.070167, 1.191738, -0.929957, 1, 0, 0, 1, 1,
-1.069495, -0.1657726, -1.544513, 1, 0, 0, 1, 1,
-1.068378, 0.3442413, 0.6870474, 1, 0, 0, 1, 1,
-1.066501, -0.08577754, -4.204968, 1, 0, 0, 1, 1,
-1.064626, -1.949347, -1.926843, 1, 0, 0, 1, 1,
-1.056077, -0.1645334, -1.639294, 0, 0, 0, 1, 1,
-1.053519, 1.061437, -0.9199228, 0, 0, 0, 1, 1,
-1.052113, -0.661979, -3.479341, 0, 0, 0, 1, 1,
-1.043553, -0.2427041, -1.338213, 0, 0, 0, 1, 1,
-1.041943, -0.2836951, -0.723331, 0, 0, 0, 1, 1,
-1.041414, -0.02893448, -2.799188, 0, 0, 0, 1, 1,
-1.039451, 0.4135277, -0.6304665, 0, 0, 0, 1, 1,
-1.038722, -0.637743, -2.840326, 1, 1, 1, 1, 1,
-1.037391, 0.4304341, -0.3827895, 1, 1, 1, 1, 1,
-1.035252, -0.1462899, -2.204193, 1, 1, 1, 1, 1,
-1.034519, -0.1996142, -1.930905, 1, 1, 1, 1, 1,
-1.021602, 0.7223833, -1.125025, 1, 1, 1, 1, 1,
-1.019896, -1.569243, -3.142856, 1, 1, 1, 1, 1,
-1.017582, -1.208564, -2.087313, 1, 1, 1, 1, 1,
-1.016861, 0.8434575, -1.597447, 1, 1, 1, 1, 1,
-1.014327, 0.06788526, -0.7190365, 1, 1, 1, 1, 1,
-1.013135, 0.3944658, -1.018182, 1, 1, 1, 1, 1,
-0.9989641, -0.934171, -2.95306, 1, 1, 1, 1, 1,
-0.9903293, 1.287541, -0.03843795, 1, 1, 1, 1, 1,
-0.9898832, 1.555769, 0.3556745, 1, 1, 1, 1, 1,
-0.9891084, -1.842899, -1.410341, 1, 1, 1, 1, 1,
-0.9856663, 0.382788, -0.7107795, 1, 1, 1, 1, 1,
-0.9831927, -0.7718213, -3.479413, 0, 0, 1, 1, 1,
-0.9826622, 0.4105244, -0.9232956, 1, 0, 0, 1, 1,
-0.9808469, -0.2556881, -2.026929, 1, 0, 0, 1, 1,
-0.9728781, 0.9357485, -1.907083, 1, 0, 0, 1, 1,
-0.9717834, 0.625679, 0.3531273, 1, 0, 0, 1, 1,
-0.9704382, 1.252965, -1.02793, 1, 0, 0, 1, 1,
-0.9691682, 1.075051, -0.5194125, 0, 0, 0, 1, 1,
-0.9684692, 0.7168004, -1.04689, 0, 0, 0, 1, 1,
-0.9638767, 0.2705335, -2.559952, 0, 0, 0, 1, 1,
-0.9517648, -0.9242554, -0.3816578, 0, 0, 0, 1, 1,
-0.951165, 0.1771936, 0.2133628, 0, 0, 0, 1, 1,
-0.9494619, -0.9615294, -1.446668, 0, 0, 0, 1, 1,
-0.9480794, -2.216571, -3.432604, 0, 0, 0, 1, 1,
-0.9475254, -1.026612, -3.86914, 1, 1, 1, 1, 1,
-0.9470006, 0.1416793, -1.710934, 1, 1, 1, 1, 1,
-0.946687, 1.509517, -1.791624, 1, 1, 1, 1, 1,
-0.945271, -0.3069417, -2.604127, 1, 1, 1, 1, 1,
-0.9452228, 0.4572123, -0.9765444, 1, 1, 1, 1, 1,
-0.9443815, 0.3855229, -2.601011, 1, 1, 1, 1, 1,
-0.9417052, -0.5948774, -2.993905, 1, 1, 1, 1, 1,
-0.9336384, 0.3569341, -1.153138, 1, 1, 1, 1, 1,
-0.9321912, -1.14951, -0.9926948, 1, 1, 1, 1, 1,
-0.9294009, 0.7543819, 0.4250696, 1, 1, 1, 1, 1,
-0.929229, 0.1626226, -2.97806, 1, 1, 1, 1, 1,
-0.9266496, -2.444438, -2.25563, 1, 1, 1, 1, 1,
-0.9249352, -0.4750035, -3.560823, 1, 1, 1, 1, 1,
-0.9198608, -0.1858912, -1.343438, 1, 1, 1, 1, 1,
-0.9193285, -1.598742, -3.295326, 1, 1, 1, 1, 1,
-0.9175949, -0.8393796, -0.3832898, 0, 0, 1, 1, 1,
-0.9152704, 0.5332549, -2.04076, 1, 0, 0, 1, 1,
-0.9110805, -0.2673602, -0.4515979, 1, 0, 0, 1, 1,
-0.9051899, -0.8385442, -4.382627, 1, 0, 0, 1, 1,
-0.89864, -0.1047013, -2.597997, 1, 0, 0, 1, 1,
-0.8984812, 1.156466, 0.1233808, 1, 0, 0, 1, 1,
-0.896839, 0.3374313, -0.1777312, 0, 0, 0, 1, 1,
-0.8966672, 0.2741147, -0.108914, 0, 0, 0, 1, 1,
-0.8889915, 0.2147491, -0.4316263, 0, 0, 0, 1, 1,
-0.8849878, 0.2191503, -0.4801123, 0, 0, 0, 1, 1,
-0.8804353, 0.4319097, -1.893675, 0, 0, 0, 1, 1,
-0.8786722, -0.7359798, -1.594918, 0, 0, 0, 1, 1,
-0.8772333, -1.729721, -4.359598, 0, 0, 0, 1, 1,
-0.8763004, 0.634258, -2.199817, 1, 1, 1, 1, 1,
-0.8746108, -1.634618, -2.688883, 1, 1, 1, 1, 1,
-0.8740627, -0.2777159, -1.138736, 1, 1, 1, 1, 1,
-0.8689615, 0.9072857, -0.5468965, 1, 1, 1, 1, 1,
-0.8686109, -0.4196033, -3.257659, 1, 1, 1, 1, 1,
-0.866908, 1.024876, -1.839499, 1, 1, 1, 1, 1,
-0.8605388, -0.6183218, -3.009445, 1, 1, 1, 1, 1,
-0.8595474, -0.01498913, -2.422385, 1, 1, 1, 1, 1,
-0.8557932, 0.266197, -0.639763, 1, 1, 1, 1, 1,
-0.848768, -1.134669, -2.709508, 1, 1, 1, 1, 1,
-0.8483478, 0.1692767, -0.5996194, 1, 1, 1, 1, 1,
-0.8446369, -0.9802305, -2.950062, 1, 1, 1, 1, 1,
-0.8415855, 0.5088223, -0.6301386, 1, 1, 1, 1, 1,
-0.8415803, -0.6331863, -1.820576, 1, 1, 1, 1, 1,
-0.8402388, -0.7516001, -2.659678, 1, 1, 1, 1, 1,
-0.833573, -1.985875, -3.675726, 0, 0, 1, 1, 1,
-0.831709, 0.5157019, -2.231053, 1, 0, 0, 1, 1,
-0.830908, 0.5417436, -0.6965699, 1, 0, 0, 1, 1,
-0.8275935, 0.3765747, -0.3301437, 1, 0, 0, 1, 1,
-0.8198836, -0.9140606, -3.520879, 1, 0, 0, 1, 1,
-0.816446, 0.4831037, -1.346346, 1, 0, 0, 1, 1,
-0.8141878, 2.497597, 0.2450068, 0, 0, 0, 1, 1,
-0.8127729, -0.4661278, -2.070726, 0, 0, 0, 1, 1,
-0.8109542, 0.7438301, -2.008763, 0, 0, 0, 1, 1,
-0.807947, 2.041386, 0.6559134, 0, 0, 0, 1, 1,
-0.8021274, 0.2043695, -1.931059, 0, 0, 0, 1, 1,
-0.8004942, 0.305656, -3.472444, 0, 0, 0, 1, 1,
-0.797678, 1.062218, -1.042092, 0, 0, 0, 1, 1,
-0.7960631, 0.9813958, -0.7758806, 1, 1, 1, 1, 1,
-0.7941241, 0.9173106, -0.6825863, 1, 1, 1, 1, 1,
-0.7877996, -0.004526828, 0.0167185, 1, 1, 1, 1, 1,
-0.7864196, 0.3101361, 0.9203184, 1, 1, 1, 1, 1,
-0.786155, -0.4238092, -3.299175, 1, 1, 1, 1, 1,
-0.7799394, -1.017734, -2.199873, 1, 1, 1, 1, 1,
-0.7785971, 0.5258063, -0.2469269, 1, 1, 1, 1, 1,
-0.7758615, -0.637503, -0.6206917, 1, 1, 1, 1, 1,
-0.7665864, 0.3435866, -1.643171, 1, 1, 1, 1, 1,
-0.7662508, -1.270816, -2.513198, 1, 1, 1, 1, 1,
-0.7562872, -0.5985516, -2.59524, 1, 1, 1, 1, 1,
-0.755518, -0.469753, -2.268842, 1, 1, 1, 1, 1,
-0.7540249, -0.8789161, -1.966368, 1, 1, 1, 1, 1,
-0.7481104, 2.173073, -0.3060369, 1, 1, 1, 1, 1,
-0.7424521, 0.5602472, -2.113363, 1, 1, 1, 1, 1,
-0.7379294, -0.003709342, -1.60873, 0, 0, 1, 1, 1,
-0.7346107, -0.4913701, -1.847165, 1, 0, 0, 1, 1,
-0.7309526, -0.01097267, -1.811581, 1, 0, 0, 1, 1,
-0.7287446, 0.5949526, -1.73462, 1, 0, 0, 1, 1,
-0.7286257, -0.3236934, -2.618271, 1, 0, 0, 1, 1,
-0.7266926, -0.4994064, -2.573436, 1, 0, 0, 1, 1,
-0.7255812, -0.7762169, -3.225703, 0, 0, 0, 1, 1,
-0.7232299, 0.8324067, -0.3976816, 0, 0, 0, 1, 1,
-0.7172831, -0.8739382, -1.654387, 0, 0, 0, 1, 1,
-0.7172415, -1.384846, -0.8660334, 0, 0, 0, 1, 1,
-0.7160785, 0.008083444, -0.5969266, 0, 0, 0, 1, 1,
-0.7140982, -0.393359, -0.9174697, 0, 0, 0, 1, 1,
-0.706466, 1.360835, 1.219308, 0, 0, 0, 1, 1,
-0.7064234, 0.4159153, -0.8353062, 1, 1, 1, 1, 1,
-0.6997781, -0.8871098, -2.117064, 1, 1, 1, 1, 1,
-0.6984113, 0.3692302, -1.58584, 1, 1, 1, 1, 1,
-0.6984029, 0.1740108, -0.7571566, 1, 1, 1, 1, 1,
-0.6981593, -0.9468467, -2.051996, 1, 1, 1, 1, 1,
-0.6907138, 0.4137809, -1.802631, 1, 1, 1, 1, 1,
-0.6904152, 0.6602007, -0.08679381, 1, 1, 1, 1, 1,
-0.6862668, 1.880801, 0.7043542, 1, 1, 1, 1, 1,
-0.6838096, -2.437978, -2.685609, 1, 1, 1, 1, 1,
-0.6733355, -0.8283244, -3.405679, 1, 1, 1, 1, 1,
-0.6728045, -0.0948289, -2.302715, 1, 1, 1, 1, 1,
-0.6679479, 0.6491342, -0.1143563, 1, 1, 1, 1, 1,
-0.6658649, 2.125079, -1.923789, 1, 1, 1, 1, 1,
-0.6517909, 0.4981714, -0.8744148, 1, 1, 1, 1, 1,
-0.6484311, -0.5753632, -2.314686, 1, 1, 1, 1, 1,
-0.6460895, -0.8282523, -2.29287, 0, 0, 1, 1, 1,
-0.6407283, 1.486046, 0.2389802, 1, 0, 0, 1, 1,
-0.6406263, -0.6608909, -1.24242, 1, 0, 0, 1, 1,
-0.6400608, 1.480933, -0.3601252, 1, 0, 0, 1, 1,
-0.6371189, -1.071128, -2.060097, 1, 0, 0, 1, 1,
-0.6331433, 0.1647894, -1.789338, 1, 0, 0, 1, 1,
-0.6329389, -0.5339249, -1.566905, 0, 0, 0, 1, 1,
-0.6234888, -2.182113, -2.026403, 0, 0, 0, 1, 1,
-0.6164897, -0.3918924, -2.58456, 0, 0, 0, 1, 1,
-0.6125255, -0.3085931, -0.4617836, 0, 0, 0, 1, 1,
-0.6114466, 0.02873752, -0.4528984, 0, 0, 0, 1, 1,
-0.610958, 0.6398759, 0.4287986, 0, 0, 0, 1, 1,
-0.608519, -0.2383023, -3.403903, 0, 0, 0, 1, 1,
-0.6002305, -1.874657, -3.307137, 1, 1, 1, 1, 1,
-0.5984958, -0.2098575, -2.524862, 1, 1, 1, 1, 1,
-0.5944955, 0.589855, 0.8479815, 1, 1, 1, 1, 1,
-0.587473, -0.9576999, -1.916079, 1, 1, 1, 1, 1,
-0.5851803, -0.65234, -2.721386, 1, 1, 1, 1, 1,
-0.5803144, -0.1258297, -3.234659, 1, 1, 1, 1, 1,
-0.5779033, -1.885393, -4.037273, 1, 1, 1, 1, 1,
-0.5739119, -0.2562176, -0.946619, 1, 1, 1, 1, 1,
-0.571358, -1.920478, -3.531886, 1, 1, 1, 1, 1,
-0.5644999, 0.4739383, -2.04126, 1, 1, 1, 1, 1,
-0.5636373, 0.1290154, 0.3891178, 1, 1, 1, 1, 1,
-0.5611789, 1.873111, 0.5602664, 1, 1, 1, 1, 1,
-0.5600986, 0.6513521, 0.3236972, 1, 1, 1, 1, 1,
-0.559481, 0.9779546, -0.6594172, 1, 1, 1, 1, 1,
-0.5521336, 0.3252091, -1.645208, 1, 1, 1, 1, 1,
-0.5473293, -0.1190797, -2.344692, 0, 0, 1, 1, 1,
-0.5420167, 0.3867683, -1.171332, 1, 0, 0, 1, 1,
-0.539777, 1.134526, -0.7678439, 1, 0, 0, 1, 1,
-0.5385037, 0.3677448, -0.6430713, 1, 0, 0, 1, 1,
-0.5382078, -0.075813, -2.472027, 1, 0, 0, 1, 1,
-0.5381244, -2.493601, -3.724157, 1, 0, 0, 1, 1,
-0.5377772, -0.7610847, -2.889305, 0, 0, 0, 1, 1,
-0.5354149, 0.2022721, -1.646868, 0, 0, 0, 1, 1,
-0.5328408, -0.7642636, -0.4517435, 0, 0, 0, 1, 1,
-0.531456, 0.3233518, -1.461792, 0, 0, 0, 1, 1,
-0.5312505, 0.7035004, 0.4664636, 0, 0, 0, 1, 1,
-0.5283561, -0.05219119, -2.082225, 0, 0, 0, 1, 1,
-0.5232812, -1.62476, -1.793585, 0, 0, 0, 1, 1,
-0.5211417, 0.1109577, -1.361012, 1, 1, 1, 1, 1,
-0.5162299, -0.2111183, -3.747248, 1, 1, 1, 1, 1,
-0.513899, 0.7757286, -0.4344595, 1, 1, 1, 1, 1,
-0.5091785, -0.1358171, -1.038175, 1, 1, 1, 1, 1,
-0.5037079, -1.845368, -3.849994, 1, 1, 1, 1, 1,
-0.5033922, 0.2548961, -0.9169747, 1, 1, 1, 1, 1,
-0.5026976, -0.1068997, -2.165815, 1, 1, 1, 1, 1,
-0.5020775, -0.3107845, -1.369683, 1, 1, 1, 1, 1,
-0.5011867, 0.1114491, -0.9535978, 1, 1, 1, 1, 1,
-0.4986582, 0.7414113, 1.167462, 1, 1, 1, 1, 1,
-0.4981652, -0.04442598, -0.7512196, 1, 1, 1, 1, 1,
-0.4981637, 0.4996399, 0.4996568, 1, 1, 1, 1, 1,
-0.4967169, -1.334594, -2.02356, 1, 1, 1, 1, 1,
-0.4957106, -0.4020614, -1.492883, 1, 1, 1, 1, 1,
-0.491946, -1.971872, -3.40935, 1, 1, 1, 1, 1,
-0.4909267, 1.890775, -1.111579, 0, 0, 1, 1, 1,
-0.4878025, 0.7495449, -2.664872, 1, 0, 0, 1, 1,
-0.4870343, -0.7072089, -4.070186, 1, 0, 0, 1, 1,
-0.4867148, 0.4511733, -1.951729, 1, 0, 0, 1, 1,
-0.4790384, -0.2277908, -2.04525, 1, 0, 0, 1, 1,
-0.4781051, 0.5090876, -2.508835, 1, 0, 0, 1, 1,
-0.4726276, -2.425848, -3.74121, 0, 0, 0, 1, 1,
-0.4715957, -0.08321182, -0.7683604, 0, 0, 0, 1, 1,
-0.4713037, 0.2255775, -1.161016, 0, 0, 0, 1, 1,
-0.4709992, 1.285791, -1.333158, 0, 0, 0, 1, 1,
-0.4684431, -0.3265938, -3.290147, 0, 0, 0, 1, 1,
-0.4668945, 0.9137113, 0.007485934, 0, 0, 0, 1, 1,
-0.4566138, -0.5122303, -2.286434, 0, 0, 0, 1, 1,
-0.454609, -1.475802, -1.818267, 1, 1, 1, 1, 1,
-0.454102, 1.361379, -0.8805516, 1, 1, 1, 1, 1,
-0.4520691, -1.182775, -2.375796, 1, 1, 1, 1, 1,
-0.4518622, 1.657773, 0.3060906, 1, 1, 1, 1, 1,
-0.4499946, -0.5859686, -2.660654, 1, 1, 1, 1, 1,
-0.4424925, -1.106638, -2.747997, 1, 1, 1, 1, 1,
-0.4407591, -0.8718305, -2.448917, 1, 1, 1, 1, 1,
-0.4392577, 1.189792, -1.392438, 1, 1, 1, 1, 1,
-0.4354576, -0.5574979, -2.966033, 1, 1, 1, 1, 1,
-0.4334228, 0.7053966, -0.3461241, 1, 1, 1, 1, 1,
-0.4309794, 0.4010345, -0.3407203, 1, 1, 1, 1, 1,
-0.4290428, 0.4097933, -1.107069, 1, 1, 1, 1, 1,
-0.4265909, -1.836682, -3.264311, 1, 1, 1, 1, 1,
-0.4265448, 1.981993, 1.508025, 1, 1, 1, 1, 1,
-0.4242445, 0.8387901, -0.971984, 1, 1, 1, 1, 1,
-0.4162837, -0.1272235, -1.50154, 0, 0, 1, 1, 1,
-0.4157842, 0.5870183, -0.4461227, 1, 0, 0, 1, 1,
-0.4123962, -0.3273202, -2.076899, 1, 0, 0, 1, 1,
-0.4113884, -0.6310439, -4.661318, 1, 0, 0, 1, 1,
-0.4110875, 0.5692428, -0.2461334, 1, 0, 0, 1, 1,
-0.4107247, 0.4096819, 0.2997956, 1, 0, 0, 1, 1,
-0.4093972, 0.414281, -2.394103, 0, 0, 0, 1, 1,
-0.407707, 0.7957557, -0.8295047, 0, 0, 0, 1, 1,
-0.4073589, 0.06261548, -1.2934, 0, 0, 0, 1, 1,
-0.4064073, 0.1218631, -1.059906, 0, 0, 0, 1, 1,
-0.4041, 0.4829511, -0.5404646, 0, 0, 0, 1, 1,
-0.403991, 0.9106701, -2.089095, 0, 0, 0, 1, 1,
-0.4030977, 0.9836307, 1.274888, 0, 0, 0, 1, 1,
-0.3963524, -0.4468493, -3.756748, 1, 1, 1, 1, 1,
-0.3930819, -0.6457189, -2.776275, 1, 1, 1, 1, 1,
-0.3929562, 1.60603, 1.528877, 1, 1, 1, 1, 1,
-0.3927709, -1.995881, -4.108844, 1, 1, 1, 1, 1,
-0.3926581, 0.1684181, -0.9304816, 1, 1, 1, 1, 1,
-0.3899481, -0.5699216, -2.729017, 1, 1, 1, 1, 1,
-0.3882601, -1.081167, -4.172701, 1, 1, 1, 1, 1,
-0.381139, 0.9785498, 0.05974751, 1, 1, 1, 1, 1,
-0.3781898, -0.6922474, -1.177032, 1, 1, 1, 1, 1,
-0.3766071, -0.3677138, -2.709019, 1, 1, 1, 1, 1,
-0.3761785, -0.5782149, -2.51931, 1, 1, 1, 1, 1,
-0.3591409, -0.6369559, -2.97616, 1, 1, 1, 1, 1,
-0.35727, 0.03848203, -1.227277, 1, 1, 1, 1, 1,
-0.3555536, -1.712626, -1.186171, 1, 1, 1, 1, 1,
-0.3552381, -0.7049406, -5.159079, 1, 1, 1, 1, 1,
-0.3540905, 1.218582, -2.062383, 0, 0, 1, 1, 1,
-0.3526704, 0.1068736, -2.935863, 1, 0, 0, 1, 1,
-0.3505513, -0.8455023, -4.161613, 1, 0, 0, 1, 1,
-0.3474924, 0.5210847, -1.347903, 1, 0, 0, 1, 1,
-0.3470289, 0.606817, -1.777877, 1, 0, 0, 1, 1,
-0.3466291, -0.4098848, -0.9972066, 1, 0, 0, 1, 1,
-0.3457956, -0.594142, -2.173152, 0, 0, 0, 1, 1,
-0.3428608, 0.9248706, -0.7029738, 0, 0, 0, 1, 1,
-0.3403518, 0.6998276, -1.500367, 0, 0, 0, 1, 1,
-0.3357864, -1.504295, -0.931254, 0, 0, 0, 1, 1,
-0.3324077, 0.8333551, -1.043162, 0, 0, 0, 1, 1,
-0.3321253, -0.2850597, -1.841739, 0, 0, 0, 1, 1,
-0.328929, -0.2655278, -0.5586094, 0, 0, 0, 1, 1,
-0.3272914, -0.8055483, -2.791956, 1, 1, 1, 1, 1,
-0.3218337, 1.1494, 0.1067053, 1, 1, 1, 1, 1,
-0.3171035, 0.6637366, -0.3448618, 1, 1, 1, 1, 1,
-0.3106005, -0.1213513, -1.877772, 1, 1, 1, 1, 1,
-0.3100043, 1.092752, 0.2419633, 1, 1, 1, 1, 1,
-0.3061228, -1.023358, -1.48997, 1, 1, 1, 1, 1,
-0.3006028, 1.582191, -1.128125, 1, 1, 1, 1, 1,
-0.3004257, 0.1105536, 0.070868, 1, 1, 1, 1, 1,
-0.3003386, 0.788633, 1.762472, 1, 1, 1, 1, 1,
-0.2977492, 0.518299, -0.8880683, 1, 1, 1, 1, 1,
-0.2971665, -0.396842, -2.436168, 1, 1, 1, 1, 1,
-0.2937886, 0.4776783, 0.6849973, 1, 1, 1, 1, 1,
-0.2920845, -1.057594, -3.231601, 1, 1, 1, 1, 1,
-0.2894597, -0.6788525, -2.175695, 1, 1, 1, 1, 1,
-0.2892202, 0.4974391, -1.328544, 1, 1, 1, 1, 1,
-0.2852248, 1.854637, 0.4246102, 0, 0, 1, 1, 1,
-0.2815647, -0.3871022, -3.949024, 1, 0, 0, 1, 1,
-0.278646, 1.767544, -0.7549005, 1, 0, 0, 1, 1,
-0.2715118, -0.2136193, -2.276562, 1, 0, 0, 1, 1,
-0.2710866, -0.5606411, -2.155023, 1, 0, 0, 1, 1,
-0.2684655, -1.145901, -3.627976, 1, 0, 0, 1, 1,
-0.268187, 0.08261422, -2.850159, 0, 0, 0, 1, 1,
-0.2666266, 2.144906, -2.398595, 0, 0, 0, 1, 1,
-0.2649744, -0.8022047, -4.675297, 0, 0, 0, 1, 1,
-0.2610517, 0.3258111, -1.974524, 0, 0, 0, 1, 1,
-0.2510117, -1.468156, -2.140501, 0, 0, 0, 1, 1,
-0.2487535, -0.7696899, -1.913346, 0, 0, 0, 1, 1,
-0.2472729, 1.555365, -0.9891818, 0, 0, 0, 1, 1,
-0.2466689, 0.5789742, -1.516255, 1, 1, 1, 1, 1,
-0.2417164, -0.5922356, -4.525595, 1, 1, 1, 1, 1,
-0.2362422, 0.8852403, -2.747375, 1, 1, 1, 1, 1,
-0.2330502, -0.5556323, -3.972417, 1, 1, 1, 1, 1,
-0.2329525, -2.846622, -1.418535, 1, 1, 1, 1, 1,
-0.2326561, 1.099266, -1.537623, 1, 1, 1, 1, 1,
-0.231012, -0.1614919, -2.153584, 1, 1, 1, 1, 1,
-0.2294952, -0.67895, -2.677606, 1, 1, 1, 1, 1,
-0.2289594, 1.708776, 0.8048552, 1, 1, 1, 1, 1,
-0.2238183, -1.132656, -4.832041, 1, 1, 1, 1, 1,
-0.2220395, -0.9642007, -2.758294, 1, 1, 1, 1, 1,
-0.2200811, -1.735518, -2.21249, 1, 1, 1, 1, 1,
-0.2152926, -1.346149, -2.977175, 1, 1, 1, 1, 1,
-0.2086978, -1.681785, -2.793071, 1, 1, 1, 1, 1,
-0.2083748, -0.8372484, -2.725887, 1, 1, 1, 1, 1,
-0.2064687, 0.30614, -1.010427, 0, 0, 1, 1, 1,
-0.2060356, -0.5441224, -4.428956, 1, 0, 0, 1, 1,
-0.2031295, -0.8668078, -4.260766, 1, 0, 0, 1, 1,
-0.2025843, -2.135291, -2.470264, 1, 0, 0, 1, 1,
-0.2020979, -0.7162882, -2.26862, 1, 0, 0, 1, 1,
-0.2019799, 0.05317685, -0.7991067, 1, 0, 0, 1, 1,
-0.2014765, -0.5766262, -2.999356, 0, 0, 0, 1, 1,
-0.1984289, 0.7265102, -0.2804406, 0, 0, 0, 1, 1,
-0.198124, 0.6324794, 0.06481179, 0, 0, 0, 1, 1,
-0.1935335, -1.621081, -4.312821, 0, 0, 0, 1, 1,
-0.1922981, -0.001362753, -2.803475, 0, 0, 0, 1, 1,
-0.1916979, -1.080973, -1.089864, 0, 0, 0, 1, 1,
-0.1853594, 0.07251754, -1.578801, 0, 0, 0, 1, 1,
-0.1838439, -1.451496, -3.488451, 1, 1, 1, 1, 1,
-0.1812332, -0.4559568, -2.992836, 1, 1, 1, 1, 1,
-0.1796281, 2.641622, -2.202514, 1, 1, 1, 1, 1,
-0.1752755, -0.3665518, -2.405592, 1, 1, 1, 1, 1,
-0.1746467, -0.2393675, -2.732879, 1, 1, 1, 1, 1,
-0.1705509, -2.259505, -3.384411, 1, 1, 1, 1, 1,
-0.1688983, -0.06444632, -1.843747, 1, 1, 1, 1, 1,
-0.1659605, 0.3660789, 1.586208, 1, 1, 1, 1, 1,
-0.1602077, -0.3709178, -2.824175, 1, 1, 1, 1, 1,
-0.1506663, -2.842122, -1.233924, 1, 1, 1, 1, 1,
-0.1506416, -0.8718356, -1.750016, 1, 1, 1, 1, 1,
-0.1439322, -0.9292928, 0.006042065, 1, 1, 1, 1, 1,
-0.1392129, -1.750904, -3.111858, 1, 1, 1, 1, 1,
-0.1383424, 1.66082, 0.3810546, 1, 1, 1, 1, 1,
-0.135739, 0.8253481, -0.2996875, 1, 1, 1, 1, 1,
-0.1294773, -0.9098912, -4.835308, 0, 0, 1, 1, 1,
-0.1286156, -1.455132, -4.337587, 1, 0, 0, 1, 1,
-0.1276481, 1.287453, 0.8372206, 1, 0, 0, 1, 1,
-0.1203061, -0.4890338, -3.684876, 1, 0, 0, 1, 1,
-0.1201133, 0.3207881, 0.5536671, 1, 0, 0, 1, 1,
-0.1196453, 0.7128591, 0.8404166, 1, 0, 0, 1, 1,
-0.1185979, 0.4081555, 1.052069, 0, 0, 0, 1, 1,
-0.117375, 1.12543, -0.5937187, 0, 0, 0, 1, 1,
-0.1162593, 0.9316767, -0.605973, 0, 0, 0, 1, 1,
-0.1143232, 0.5558315, 0.2400153, 0, 0, 0, 1, 1,
-0.104075, -1.879472, -3.360861, 0, 0, 0, 1, 1,
-0.1034112, 0.8537132, -0.04688166, 0, 0, 0, 1, 1,
-0.09455539, -0.276141, -2.25003, 0, 0, 0, 1, 1,
-0.09167118, 0.1672923, -1.60058, 1, 1, 1, 1, 1,
-0.08966889, 0.2792164, -0.3797349, 1, 1, 1, 1, 1,
-0.0869647, 0.5925395, 0.1613493, 1, 1, 1, 1, 1,
-0.08484422, 0.562602, -1.291149, 1, 1, 1, 1, 1,
-0.0815611, -2.04683, -1.83849, 1, 1, 1, 1, 1,
-0.07466038, -0.4863906, -2.185281, 1, 1, 1, 1, 1,
-0.07053179, -0.1345235, -1.142685, 1, 1, 1, 1, 1,
-0.06957246, 0.8732334, -1.40384, 1, 1, 1, 1, 1,
-0.06927414, -0.3634143, -0.774572, 1, 1, 1, 1, 1,
-0.06601499, 0.08186018, -0.2716537, 1, 1, 1, 1, 1,
-0.06025972, -0.8012022, -3.350849, 1, 1, 1, 1, 1,
-0.05496622, 0.199609, 0.6010756, 1, 1, 1, 1, 1,
-0.05072113, 0.6639456, -0.2096295, 1, 1, 1, 1, 1,
-0.04689678, 0.898698, -1.40477, 1, 1, 1, 1, 1,
-0.04480737, 0.8784363, -0.4310504, 1, 1, 1, 1, 1,
-0.03667165, -0.4642029, -2.20302, 0, 0, 1, 1, 1,
-0.0349017, 0.1510782, 0.2217246, 1, 0, 0, 1, 1,
-0.03384535, -0.2289485, -1.807193, 1, 0, 0, 1, 1,
-0.03173994, 0.7176003, 1.383616, 1, 0, 0, 1, 1,
-0.03145995, 2.005333, 0.4677552, 1, 0, 0, 1, 1,
-0.02823082, -1.000672, -3.831528, 1, 0, 0, 1, 1,
-0.02820498, 2.297293, -0.7689022, 0, 0, 0, 1, 1,
-0.02809774, 0.5499279, -0.4300265, 0, 0, 0, 1, 1,
-0.02719125, -0.3923282, -3.862349, 0, 0, 0, 1, 1,
-0.02688418, 1.937114, -2.215123, 0, 0, 0, 1, 1,
-0.02537893, -0.8883628, -4.055445, 0, 0, 0, 1, 1,
-0.02509547, -0.9922936, -3.727129, 0, 0, 0, 1, 1,
-0.0247637, 0.4295064, -0.5622405, 0, 0, 0, 1, 1,
-0.0229718, -0.4972682, -2.911525, 1, 1, 1, 1, 1,
-0.02152118, -1.462536, -0.6175948, 1, 1, 1, 1, 1,
-0.01915145, 1.183482, 0.1851746, 1, 1, 1, 1, 1,
-0.01686797, -0.5498672, -3.440081, 1, 1, 1, 1, 1,
-0.01604593, -0.4880129, -2.888385, 1, 1, 1, 1, 1,
-0.01436519, 1.248137, 1.469841, 1, 1, 1, 1, 1,
-0.01264909, -1.858024, -2.919016, 1, 1, 1, 1, 1,
-0.01173626, -0.4352283, -2.774113, 1, 1, 1, 1, 1,
-0.008737745, 0.2680603, 2.514537, 1, 1, 1, 1, 1,
-0.005794181, -0.6320996, -2.092478, 1, 1, 1, 1, 1,
-0.004843864, -1.144565, -2.601719, 1, 1, 1, 1, 1,
-0.004114899, -0.03438729, -2.169502, 1, 1, 1, 1, 1,
-0.00372147, -0.1690203, -3.242972, 1, 1, 1, 1, 1,
0.006040075, 0.3184049, -0.107786, 1, 1, 1, 1, 1,
0.008281698, 0.8297475, 1.498979, 1, 1, 1, 1, 1,
0.009436245, 1.414956, 0.05350712, 0, 0, 1, 1, 1,
0.01072343, 0.5593399, 0.6874757, 1, 0, 0, 1, 1,
0.01253951, -0.4288961, 3.765674, 1, 0, 0, 1, 1,
0.01657493, 0.3099992, 1.34889, 1, 0, 0, 1, 1,
0.02572205, 0.1447206, -1.271927, 1, 0, 0, 1, 1,
0.03471623, 1.094617, -0.2192826, 1, 0, 0, 1, 1,
0.03969068, -2.244612, 2.715547, 0, 0, 0, 1, 1,
0.03974618, 0.7484354, 1.038508, 0, 0, 0, 1, 1,
0.04206122, -2.232277, 2.342724, 0, 0, 0, 1, 1,
0.04316258, 0.4783024, 0.2518863, 0, 0, 0, 1, 1,
0.04564157, -1.179002, 3.472943, 0, 0, 0, 1, 1,
0.04979447, 0.5185953, 1.236179, 0, 0, 0, 1, 1,
0.05381048, 0.501844, -0.6831849, 0, 0, 0, 1, 1,
0.05868692, -0.5440407, 3.100283, 1, 1, 1, 1, 1,
0.06206992, 0.3542896, 0.1277892, 1, 1, 1, 1, 1,
0.06740576, -1.701565, 1.970848, 1, 1, 1, 1, 1,
0.06907926, 1.199914, 0.7722725, 1, 1, 1, 1, 1,
0.07014037, 1.028877, 0.9864627, 1, 1, 1, 1, 1,
0.07151715, 1.075586, 1.142625, 1, 1, 1, 1, 1,
0.07526892, 0.2628998, 0.4482946, 1, 1, 1, 1, 1,
0.07541931, -0.41357, 1.773775, 1, 1, 1, 1, 1,
0.07826345, 1.163617, 1.565619, 1, 1, 1, 1, 1,
0.07975152, -0.140913, 4.112585, 1, 1, 1, 1, 1,
0.07996651, -1.855622, 2.877454, 1, 1, 1, 1, 1,
0.08134923, 0.0006342274, 1.65077, 1, 1, 1, 1, 1,
0.08401229, -1.421383, 3.600667, 1, 1, 1, 1, 1,
0.08834405, 0.9044334, -1.453818, 1, 1, 1, 1, 1,
0.08842951, 0.8015514, -0.06657461, 1, 1, 1, 1, 1,
0.09152286, -2.042464, 4.572228, 0, 0, 1, 1, 1,
0.09805463, 0.4737537, -0.04890575, 1, 0, 0, 1, 1,
0.1076255, -0.4876706, 3.08868, 1, 0, 0, 1, 1,
0.1079376, -0.8313615, 2.438001, 1, 0, 0, 1, 1,
0.1103313, 1.413705, -0.739751, 1, 0, 0, 1, 1,
0.1110172, -1.044091, 3.342591, 1, 0, 0, 1, 1,
0.1183246, 0.9081857, 0.2268168, 0, 0, 0, 1, 1,
0.1227755, -0.1984441, 2.154643, 0, 0, 0, 1, 1,
0.1264453, 1.30198, -0.3808347, 0, 0, 0, 1, 1,
0.1297153, 1.10908, 1.140166, 0, 0, 0, 1, 1,
0.1309928, -0.3804755, 2.23723, 0, 0, 0, 1, 1,
0.1315061, 0.1000781, 0.3142259, 0, 0, 0, 1, 1,
0.1361392, -0.9761992, 2.150562, 0, 0, 0, 1, 1,
0.1370444, -0.2804088, 2.66389, 1, 1, 1, 1, 1,
0.1404729, -0.9299313, 3.315265, 1, 1, 1, 1, 1,
0.1422969, -0.6194692, 2.724595, 1, 1, 1, 1, 1,
0.1489925, -0.1888437, 2.675119, 1, 1, 1, 1, 1,
0.157094, -0.9268073, 2.898663, 1, 1, 1, 1, 1,
0.1578447, -0.6480093, 2.604592, 1, 1, 1, 1, 1,
0.1596171, 1.090283, -0.2297521, 1, 1, 1, 1, 1,
0.1617109, 0.09845742, 0.8184196, 1, 1, 1, 1, 1,
0.1623268, 1.305226, 1.940882, 1, 1, 1, 1, 1,
0.1658129, -0.8448727, 3.68854, 1, 1, 1, 1, 1,
0.170573, 0.2834197, 0.3213796, 1, 1, 1, 1, 1,
0.1720913, 0.5369017, 3.496078, 1, 1, 1, 1, 1,
0.1728626, 0.6543202, -0.2176645, 1, 1, 1, 1, 1,
0.1754013, -1.895898, -0.3297864, 1, 1, 1, 1, 1,
0.1767709, 0.2140006, -0.9497426, 1, 1, 1, 1, 1,
0.1774232, -0.5656465, 3.341792, 0, 0, 1, 1, 1,
0.1796727, -1.126957, 3.417743, 1, 0, 0, 1, 1,
0.1831961, -1.215864, 1.70951, 1, 0, 0, 1, 1,
0.1905762, 3.088753, -0.8703231, 1, 0, 0, 1, 1,
0.1907462, -0.02487855, 0.1757538, 1, 0, 0, 1, 1,
0.1927352, 0.8037434, -0.8020402, 1, 0, 0, 1, 1,
0.1984937, -0.1335555, 2.372214, 0, 0, 0, 1, 1,
0.1987328, 0.2075346, 1.22249, 0, 0, 0, 1, 1,
0.2024288, 2.146646, 0.5923648, 0, 0, 0, 1, 1,
0.2036816, -0.275366, 1.226939, 0, 0, 0, 1, 1,
0.2053911, 0.870053, 0.1185373, 0, 0, 0, 1, 1,
0.2092178, 0.1562746, 1.014615, 0, 0, 0, 1, 1,
0.2093123, 0.03442691, 2.782526, 0, 0, 0, 1, 1,
0.2096495, 0.1366843, 1.722335, 1, 1, 1, 1, 1,
0.2112594, -0.332404, 1.423135, 1, 1, 1, 1, 1,
0.2148345, 0.9964753, 0.1710192, 1, 1, 1, 1, 1,
0.2200373, 0.404684, 0.007993024, 1, 1, 1, 1, 1,
0.2232469, -0.9258379, 3.283379, 1, 1, 1, 1, 1,
0.2263487, 1.664258, 0.1986251, 1, 1, 1, 1, 1,
0.2275555, 0.8166811, -0.2434992, 1, 1, 1, 1, 1,
0.2287819, -0.01704524, 1.464387, 1, 1, 1, 1, 1,
0.2451688, -2.11826, 1.448243, 1, 1, 1, 1, 1,
0.2473723, -0.8749821, 0.8934034, 1, 1, 1, 1, 1,
0.2510078, -0.1334051, 3.047971, 1, 1, 1, 1, 1,
0.2576392, 0.9543613, 0.8630906, 1, 1, 1, 1, 1,
0.2597204, -0.4517489, 2.966646, 1, 1, 1, 1, 1,
0.2612476, 0.3726653, -0.7025161, 1, 1, 1, 1, 1,
0.2672787, 1.482607, -1.586704, 1, 1, 1, 1, 1,
0.2681998, 1.390261, -0.7234895, 0, 0, 1, 1, 1,
0.2682813, 0.8942496, -0.1794274, 1, 0, 0, 1, 1,
0.2686501, 0.4727305, 1.367597, 1, 0, 0, 1, 1,
0.2686567, 1.506553, -0.5020508, 1, 0, 0, 1, 1,
0.2747475, -0.1292992, 1.690729, 1, 0, 0, 1, 1,
0.2787844, -0.2354934, 2.67324, 1, 0, 0, 1, 1,
0.2788989, 0.4563517, 2.189057, 0, 0, 0, 1, 1,
0.283692, 0.2911855, 2.152641, 0, 0, 0, 1, 1,
0.2856965, -0.7049494, 2.012133, 0, 0, 0, 1, 1,
0.2872032, -0.2590867, 1.777976, 0, 0, 0, 1, 1,
0.2876603, -0.8305399, 1.92624, 0, 0, 0, 1, 1,
0.2877386, -0.1826892, 2.638261, 0, 0, 0, 1, 1,
0.2961049, 0.2766534, 0.9510197, 0, 0, 0, 1, 1,
0.2985432, 0.5511296, 0.4322205, 1, 1, 1, 1, 1,
0.2999786, 1.546277, 2.115535, 1, 1, 1, 1, 1,
0.3026619, 0.01680543, 1.549353, 1, 1, 1, 1, 1,
0.3053467, -0.539578, 2.561162, 1, 1, 1, 1, 1,
0.3095282, -0.4723914, 2.044489, 1, 1, 1, 1, 1,
0.3140856, 0.8720406, 0.1624876, 1, 1, 1, 1, 1,
0.3166462, -0.1003239, 0.567985, 1, 1, 1, 1, 1,
0.3193815, 0.357094, 0.6612076, 1, 1, 1, 1, 1,
0.3221473, 2.152664, -0.8082338, 1, 1, 1, 1, 1,
0.3223865, -0.318538, 2.721159, 1, 1, 1, 1, 1,
0.3303415, -1.919874, 1.526914, 1, 1, 1, 1, 1,
0.3307834, 1.416124, 0.867247, 1, 1, 1, 1, 1,
0.3349947, -0.7164192, 2.296636, 1, 1, 1, 1, 1,
0.335409, -0.2196876, 1.060907, 1, 1, 1, 1, 1,
0.3361661, -1.609919, 3.547295, 1, 1, 1, 1, 1,
0.3443698, 0.4735344, -1.268054, 0, 0, 1, 1, 1,
0.3444583, 0.9226936, 0.3613804, 1, 0, 0, 1, 1,
0.3446183, 0.9416066, 1.047362, 1, 0, 0, 1, 1,
0.345893, 0.6953799, 0.8284159, 1, 0, 0, 1, 1,
0.3485217, -0.2328624, 1.710795, 1, 0, 0, 1, 1,
0.348696, -0.3349318, 2.697181, 1, 0, 0, 1, 1,
0.3508601, -0.4253452, 3.637314, 0, 0, 0, 1, 1,
0.3522166, -0.3026743, 2.464866, 0, 0, 0, 1, 1,
0.3542816, 0.9463415, 0.6416854, 0, 0, 0, 1, 1,
0.3547291, 1.167894, 0.2762513, 0, 0, 0, 1, 1,
0.356136, 1.950475, 0.7439049, 0, 0, 0, 1, 1,
0.3637113, -1.954252, 2.127683, 0, 0, 0, 1, 1,
0.3637453, -0.2452102, 3.599271, 0, 0, 0, 1, 1,
0.3684669, -0.2395492, 1.075864, 1, 1, 1, 1, 1,
0.3746617, 0.007405767, 1.276966, 1, 1, 1, 1, 1,
0.3790719, -0.9782171, 1.182402, 1, 1, 1, 1, 1,
0.3841931, 1.764271, 0.7070032, 1, 1, 1, 1, 1,
0.3921737, -0.8996385, 2.599867, 1, 1, 1, 1, 1,
0.3984887, 0.2197816, 1.856732, 1, 1, 1, 1, 1,
0.4033548, 0.2242456, 2.527629, 1, 1, 1, 1, 1,
0.4056993, 0.4768735, 1.730207, 1, 1, 1, 1, 1,
0.408979, 0.4057528, -1.06548, 1, 1, 1, 1, 1,
0.4102899, 0.7250896, 1.934794, 1, 1, 1, 1, 1,
0.412116, 0.8245884, 1.295733, 1, 1, 1, 1, 1,
0.4123957, 0.613007, 2.600287, 1, 1, 1, 1, 1,
0.4133775, -1.678129, 3.662882, 1, 1, 1, 1, 1,
0.4161631, -0.3699293, 2.664996, 1, 1, 1, 1, 1,
0.4176536, 0.2637114, -1.381826, 1, 1, 1, 1, 1,
0.4192458, 0.3773941, 1.702702, 0, 0, 1, 1, 1,
0.423987, -1.038063, 2.811854, 1, 0, 0, 1, 1,
0.4269068, 2.278259, 1.298869, 1, 0, 0, 1, 1,
0.4271251, 0.04387087, 2.025804, 1, 0, 0, 1, 1,
0.4290196, 0.2440984, 0.2588539, 1, 0, 0, 1, 1,
0.4303067, -0.7253354, 2.9763, 1, 0, 0, 1, 1,
0.4349963, -1.022596, 2.049307, 0, 0, 0, 1, 1,
0.438493, -0.4930915, 2.103817, 0, 0, 0, 1, 1,
0.4387516, 0.8801901, 1.261124, 0, 0, 0, 1, 1,
0.4393177, 1.682748, 0.465768, 0, 0, 0, 1, 1,
0.4394399, -3.54379, 4.072896, 0, 0, 0, 1, 1,
0.4414124, -1.107028, 2.883784, 0, 0, 0, 1, 1,
0.4517263, -1.442233, 3.020794, 0, 0, 0, 1, 1,
0.4578737, -0.1401042, 2.294051, 1, 1, 1, 1, 1,
0.4581692, -0.7567294, 0.7902513, 1, 1, 1, 1, 1,
0.4598046, -0.3542078, 2.249115, 1, 1, 1, 1, 1,
0.4618843, 0.3321645, 1.116559, 1, 1, 1, 1, 1,
0.4627165, -1.7363, 2.459663, 1, 1, 1, 1, 1,
0.4727085, -1.66736, 3.044179, 1, 1, 1, 1, 1,
0.4756048, -0.0647556, 1.328509, 1, 1, 1, 1, 1,
0.4768052, 0.7027026, 0.4875787, 1, 1, 1, 1, 1,
0.4803599, 2.281834, -0.01470125, 1, 1, 1, 1, 1,
0.4804492, 1.504749, 1.85875, 1, 1, 1, 1, 1,
0.4817725, 0.2223281, 1.561251, 1, 1, 1, 1, 1,
0.4837977, 0.8573698, 2.518033, 1, 1, 1, 1, 1,
0.4859148, 1.652746, -0.2051649, 1, 1, 1, 1, 1,
0.5091679, 0.08235138, 2.603916, 1, 1, 1, 1, 1,
0.516302, -0.2238883, 2.67591, 1, 1, 1, 1, 1,
0.5186244, -1.231176, 1.567726, 0, 0, 1, 1, 1,
0.5236421, 0.1172393, 1.717719, 1, 0, 0, 1, 1,
0.5259328, -0.3788003, 0.311914, 1, 0, 0, 1, 1,
0.5259695, 0.1988044, 0.5673996, 1, 0, 0, 1, 1,
0.5275129, -0.2288704, 1.675786, 1, 0, 0, 1, 1,
0.5285095, -0.4777466, 2.450145, 1, 0, 0, 1, 1,
0.5334657, 0.2580186, -0.8825858, 0, 0, 0, 1, 1,
0.5334886, 1.194712, 0.4580985, 0, 0, 0, 1, 1,
0.538075, 0.6716259, 1.209632, 0, 0, 0, 1, 1,
0.5405516, 0.5888765, 1.325155, 0, 0, 0, 1, 1,
0.5434435, 1.401461, 2.580709, 0, 0, 0, 1, 1,
0.5448607, 1.458008, 0.4020987, 0, 0, 0, 1, 1,
0.5476235, 1.182955, -0.9270044, 0, 0, 0, 1, 1,
0.5580296, 0.1228389, 1.636398, 1, 1, 1, 1, 1,
0.5607638, 1.265329, -2.516515, 1, 1, 1, 1, 1,
0.5717787, -1.225314, 2.368056, 1, 1, 1, 1, 1,
0.5719445, 0.2660389, 2.386404, 1, 1, 1, 1, 1,
0.5738611, -1.072115, 2.638353, 1, 1, 1, 1, 1,
0.5774237, 1.634845, 0.9631038, 1, 1, 1, 1, 1,
0.5777296, -0.5672646, 1.716597, 1, 1, 1, 1, 1,
0.5793855, -1.344028, 2.761217, 1, 1, 1, 1, 1,
0.5807379, -0.1958262, 2.614536, 1, 1, 1, 1, 1,
0.5855461, -0.6174859, 2.28151, 1, 1, 1, 1, 1,
0.5856149, -0.823586, 2.750855, 1, 1, 1, 1, 1,
0.5934374, -0.9008102, 2.223333, 1, 1, 1, 1, 1,
0.5990489, 1.395138, 1.34544, 1, 1, 1, 1, 1,
0.6015013, 1.138537, -0.1519827, 1, 1, 1, 1, 1,
0.6042293, -0.09834597, -0.2702415, 1, 1, 1, 1, 1,
0.6074507, -1.071961, 3.615822, 0, 0, 1, 1, 1,
0.6132459, 1.247884, -1.322395, 1, 0, 0, 1, 1,
0.6138235, -0.7698733, 3.316713, 1, 0, 0, 1, 1,
0.6212467, -1.187951, 3.108423, 1, 0, 0, 1, 1,
0.6262428, 1.094337, 1.012684, 1, 0, 0, 1, 1,
0.6281685, -0.5513134, 1.493076, 1, 0, 0, 1, 1,
0.6331066, -0.01456646, 1.660399, 0, 0, 0, 1, 1,
0.6360639, -0.2914571, 3.053173, 0, 0, 0, 1, 1,
0.6400107, 0.5356771, 2.245223, 0, 0, 0, 1, 1,
0.6421206, -1.114363, 3.745132, 0, 0, 0, 1, 1,
0.6424679, 0.8548378, 0.1208607, 0, 0, 0, 1, 1,
0.6445207, -0.2121262, 1.169086, 0, 0, 0, 1, 1,
0.6458732, -2.043773, 2.651777, 0, 0, 0, 1, 1,
0.6504832, -0.635705, 3.118112, 1, 1, 1, 1, 1,
0.6545504, 0.2412121, 1.497234, 1, 1, 1, 1, 1,
0.666969, -0.917415, 1.984566, 1, 1, 1, 1, 1,
0.667296, -1.039504, 2.979985, 1, 1, 1, 1, 1,
0.674975, -1.629669, 2.034116, 1, 1, 1, 1, 1,
0.6779925, -0.2543222, 0.4689356, 1, 1, 1, 1, 1,
0.6796777, 1.606509, 1.2121, 1, 1, 1, 1, 1,
0.6799667, 0.941697, 2.989156, 1, 1, 1, 1, 1,
0.6800221, -0.08451325, 1.551267, 1, 1, 1, 1, 1,
0.6919619, 0.7126102, 0.5026749, 1, 1, 1, 1, 1,
0.6926109, 1.162103, 0.8041428, 1, 1, 1, 1, 1,
0.6933073, 0.6833156, 1.404426, 1, 1, 1, 1, 1,
0.6954949, 2.032446, 0.3194658, 1, 1, 1, 1, 1,
0.6986762, 1.361033, 2.304485, 1, 1, 1, 1, 1,
0.6999916, -0.7616277, 0.6753055, 1, 1, 1, 1, 1,
0.7044492, -0.6965027, 3.678832, 0, 0, 1, 1, 1,
0.7074486, -1.068615, 0.5487032, 1, 0, 0, 1, 1,
0.7089444, 0.2997551, 1.67227, 1, 0, 0, 1, 1,
0.7100605, -1.323938, 2.650755, 1, 0, 0, 1, 1,
0.711469, 0.7994727, 1.728222, 1, 0, 0, 1, 1,
0.7139262, 0.4309099, 2.18056, 1, 0, 0, 1, 1,
0.7237515, -1.105221, 2.612051, 0, 0, 0, 1, 1,
0.7255942, -0.3787133, 0.48338, 0, 0, 0, 1, 1,
0.726023, 1.398357, 1.138498, 0, 0, 0, 1, 1,
0.7324992, -0.3731167, 1.579773, 0, 0, 0, 1, 1,
0.7367786, 0.8816168, 2.030485, 0, 0, 0, 1, 1,
0.7374236, -0.5483934, 2.379551, 0, 0, 0, 1, 1,
0.7375848, 1.285552, 0.934064, 0, 0, 0, 1, 1,
0.7391913, 0.8298792, 1.131416, 1, 1, 1, 1, 1,
0.7401927, -0.1446043, 0.6795395, 1, 1, 1, 1, 1,
0.7404355, -1.028187, 3.564909, 1, 1, 1, 1, 1,
0.7505845, 1.589323, -0.4107741, 1, 1, 1, 1, 1,
0.7564868, -0.01887526, 0.7201576, 1, 1, 1, 1, 1,
0.7578609, -0.1091956, 1.154365, 1, 1, 1, 1, 1,
0.7737672, -1.372525, 2.040514, 1, 1, 1, 1, 1,
0.7783447, 0.6959227, -1.402271, 1, 1, 1, 1, 1,
0.7783905, 1.048647, 1.84447, 1, 1, 1, 1, 1,
0.7792608, 0.0346332, 2.837499, 1, 1, 1, 1, 1,
0.7809591, -1.093246, 1.797096, 1, 1, 1, 1, 1,
0.7825207, -0.5985282, 2.809144, 1, 1, 1, 1, 1,
0.7865062, -1.517078, 1.913793, 1, 1, 1, 1, 1,
0.7896155, 0.9949203, 0.5638602, 1, 1, 1, 1, 1,
0.8009335, -0.4371645, 0.891287, 1, 1, 1, 1, 1,
0.802495, 0.5487318, 0.6069099, 0, 0, 1, 1, 1,
0.8094631, -0.3454057, 0.2871042, 1, 0, 0, 1, 1,
0.8133336, 0.7031297, 0.866886, 1, 0, 0, 1, 1,
0.8194495, 1.035614, -0.5975899, 1, 0, 0, 1, 1,
0.8203176, -2.023752, 3.14085, 1, 0, 0, 1, 1,
0.8255877, -0.5258081, 2.136332, 1, 0, 0, 1, 1,
0.826252, -0.542175, 1.247544, 0, 0, 0, 1, 1,
0.8283644, 0.5120183, 0.7282093, 0, 0, 0, 1, 1,
0.8301798, -0.1012813, 2.016415, 0, 0, 0, 1, 1,
0.8341936, 1.164416, 0.3864476, 0, 0, 0, 1, 1,
0.8422278, -0.9376374, 1.156333, 0, 0, 0, 1, 1,
0.8433858, -0.06331126, 0.3712393, 0, 0, 0, 1, 1,
0.848929, -0.2150456, 0.8269408, 0, 0, 0, 1, 1,
0.870858, 0.6883017, 0.3209188, 1, 1, 1, 1, 1,
0.8737398, -1.576473, 4.503433, 1, 1, 1, 1, 1,
0.8738119, 0.6749848, 0.3739739, 1, 1, 1, 1, 1,
0.8766965, 1.487028, -1.897456, 1, 1, 1, 1, 1,
0.877252, 0.8631192, -0.1084727, 1, 1, 1, 1, 1,
0.880285, 1.141296, 1.706131, 1, 1, 1, 1, 1,
0.8813666, 1.057629, 0.8369341, 1, 1, 1, 1, 1,
0.8819985, -0.5715544, 2.071979, 1, 1, 1, 1, 1,
0.8886253, -0.8356022, 1.492857, 1, 1, 1, 1, 1,
0.8927603, -0.09338245, 2.327527, 1, 1, 1, 1, 1,
0.8935997, 0.1837703, 1.80459, 1, 1, 1, 1, 1,
0.9035546, 0.550421, 2.414572, 1, 1, 1, 1, 1,
0.9037647, 0.4816664, 2.017131, 1, 1, 1, 1, 1,
0.9038131, 0.325612, 2.45868, 1, 1, 1, 1, 1,
0.9063749, -0.4810945, 0.9641054, 1, 1, 1, 1, 1,
0.9070163, -0.6326061, 2.548904, 0, 0, 1, 1, 1,
0.9078993, -0.264804, 0.944911, 1, 0, 0, 1, 1,
0.9101103, -0.629578, 3.032773, 1, 0, 0, 1, 1,
0.9110261, -1.363306, 3.602279, 1, 0, 0, 1, 1,
0.9155906, -0.8699074, 2.330584, 1, 0, 0, 1, 1,
0.9244767, -2.014151, 2.486493, 1, 0, 0, 1, 1,
0.9337287, -0.5767019, 3.829154, 0, 0, 0, 1, 1,
0.9346564, 0.9674448, 0.8504782, 0, 0, 0, 1, 1,
0.9357409, -1.114778, 2.232352, 0, 0, 0, 1, 1,
0.9383093, 0.5726834, 0.9309421, 0, 0, 0, 1, 1,
0.940798, -1.04388, 3.2615, 0, 0, 0, 1, 1,
0.9453933, -0.1498599, 1.072257, 0, 0, 0, 1, 1,
0.9468591, -0.8130078, 1.225968, 0, 0, 0, 1, 1,
0.9489059, 1.045837, -0.01488248, 1, 1, 1, 1, 1,
0.9495021, 0.7501085, -0.1410044, 1, 1, 1, 1, 1,
0.9540581, 1.140365, 1.655107, 1, 1, 1, 1, 1,
0.9613588, 0.6704296, 1.176177, 1, 1, 1, 1, 1,
0.9636915, 0.2186901, 0.4860372, 1, 1, 1, 1, 1,
0.9667451, 0.01326815, 2.514312, 1, 1, 1, 1, 1,
0.9792123, -0.7408677, 3.25587, 1, 1, 1, 1, 1,
0.9874436, 1.146959, 1.40307, 1, 1, 1, 1, 1,
0.9904242, 3.005031, -0.1849064, 1, 1, 1, 1, 1,
0.9942646, -1.073474, 2.074512, 1, 1, 1, 1, 1,
0.9943982, -0.05485269, 1.836466, 1, 1, 1, 1, 1,
0.9962569, 0.08707936, 0.6897669, 1, 1, 1, 1, 1,
0.9987767, 1.088585, 0.791516, 1, 1, 1, 1, 1,
1.008894, -0.7139218, 2.832772, 1, 1, 1, 1, 1,
1.016744, -0.4623156, 1.016262, 1, 1, 1, 1, 1,
1.022785, -0.6226049, 3.00072, 0, 0, 1, 1, 1,
1.028339, 0.7588164, 0.8833189, 1, 0, 0, 1, 1,
1.032218, 1.320873, 2.00909, 1, 0, 0, 1, 1,
1.039966, -1.659285, 0.8929584, 1, 0, 0, 1, 1,
1.040011, -0.5114679, 0.9757065, 1, 0, 0, 1, 1,
1.042917, -0.175899, 2.110579, 1, 0, 0, 1, 1,
1.046312, -0.6103075, -0.09721889, 0, 0, 0, 1, 1,
1.046363, -0.220673, 1.700799, 0, 0, 0, 1, 1,
1.047748, 0.8129749, -0.0003432879, 0, 0, 0, 1, 1,
1.049889, -1.494653, 2.83042, 0, 0, 0, 1, 1,
1.052091, 0.9598972, 0.8006119, 0, 0, 0, 1, 1,
1.053878, 1.543386, 0.6960821, 0, 0, 0, 1, 1,
1.054564, -1.219679, 4.156607, 0, 0, 0, 1, 1,
1.055121, 0.6349913, 1.113483, 1, 1, 1, 1, 1,
1.067263, 0.4207103, 1.237434, 1, 1, 1, 1, 1,
1.067693, -0.6754872, 3.16852, 1, 1, 1, 1, 1,
1.088736, 1.554102, -0.109073, 1, 1, 1, 1, 1,
1.089715, 0.3409539, 0.9603379, 1, 1, 1, 1, 1,
1.090809, 0.4266102, -0.4976755, 1, 1, 1, 1, 1,
1.091274, 1.45782, -0.6118733, 1, 1, 1, 1, 1,
1.09757, -0.3871457, 2.918992, 1, 1, 1, 1, 1,
1.10436, -0.2507035, 0.3581303, 1, 1, 1, 1, 1,
1.105178, 0.2373071, 2.486262, 1, 1, 1, 1, 1,
1.10524, -0.1720569, 1.556743, 1, 1, 1, 1, 1,
1.107779, -1.017833, 2.019837, 1, 1, 1, 1, 1,
1.115205, -0.2304216, 1.621207, 1, 1, 1, 1, 1,
1.121262, 0.298241, 0.457778, 1, 1, 1, 1, 1,
1.125122, 0.3769699, 2.082172, 1, 1, 1, 1, 1,
1.125955, 2.129601, 1.797591, 0, 0, 1, 1, 1,
1.127032, 1.551601, -0.87447, 1, 0, 0, 1, 1,
1.127465, 1.202196, -0.6174214, 1, 0, 0, 1, 1,
1.135006, -0.305212, 1.568331, 1, 0, 0, 1, 1,
1.136636, 2.925821, 2.284459, 1, 0, 0, 1, 1,
1.141453, 0.3287991, 2.861259, 1, 0, 0, 1, 1,
1.145838, -0.4156083, 1.05678, 0, 0, 0, 1, 1,
1.147684, 1.724526, 0.227497, 0, 0, 0, 1, 1,
1.147788, -0.4942338, 3.07135, 0, 0, 0, 1, 1,
1.149634, -1.008594, 1.626166, 0, 0, 0, 1, 1,
1.1584, -0.2527938, 1.750067, 0, 0, 0, 1, 1,
1.160889, -0.4627896, 3.044819, 0, 0, 0, 1, 1,
1.165654, -0.5766479, 2.678359, 0, 0, 0, 1, 1,
1.165712, 0.2854147, 1.186951, 1, 1, 1, 1, 1,
1.171228, 1.777154, -1.163627, 1, 1, 1, 1, 1,
1.171699, 0.5212393, 1.285283, 1, 1, 1, 1, 1,
1.173307, 1.052697, 1.479941, 1, 1, 1, 1, 1,
1.176134, -0.497493, 1.798078, 1, 1, 1, 1, 1,
1.181933, 0.9801708, 2.674416, 1, 1, 1, 1, 1,
1.183714, 2.097801, -0.07687019, 1, 1, 1, 1, 1,
1.185155, 0.8197924, 2.534928, 1, 1, 1, 1, 1,
1.19164, 1.338774, -1.060019, 1, 1, 1, 1, 1,
1.205484, 0.8549024, 0.6212274, 1, 1, 1, 1, 1,
1.212873, -0.7965995, 2.542734, 1, 1, 1, 1, 1,
1.213045, -0.6720841, 3.594543, 1, 1, 1, 1, 1,
1.217464, 0.284616, 0.7912188, 1, 1, 1, 1, 1,
1.219442, 0.7242518, 0.8848742, 1, 1, 1, 1, 1,
1.220617, 1.509032, 0.4157893, 1, 1, 1, 1, 1,
1.22517, -0.9305538, 2.312583, 0, 0, 1, 1, 1,
1.22629, -1.044204, 1.342103, 1, 0, 0, 1, 1,
1.24797, -0.283265, 3.10975, 1, 0, 0, 1, 1,
1.256223, 1.127153, 0.7840931, 1, 0, 0, 1, 1,
1.256974, -2.817709, 2.96418, 1, 0, 0, 1, 1,
1.257038, -2.274158, 4.390954, 1, 0, 0, 1, 1,
1.259208, -1.636301, 2.533767, 0, 0, 0, 1, 1,
1.265293, -1.447773, 1.827065, 0, 0, 0, 1, 1,
1.266021, -0.4985309, 0.730763, 0, 0, 0, 1, 1,
1.267631, 1.141136, 1.71346, 0, 0, 0, 1, 1,
1.277049, -0.9009865, 3.544156, 0, 0, 0, 1, 1,
1.278663, 1.350526, 1.664034, 0, 0, 0, 1, 1,
1.283077, 0.6379121, 1.898168, 0, 0, 0, 1, 1,
1.283628, 1.092783, 0.9934477, 1, 1, 1, 1, 1,
1.289585, -1.173702, 3.229002, 1, 1, 1, 1, 1,
1.310411, 0.6328062, 2.433141, 1, 1, 1, 1, 1,
1.312705, -0.5762658, 1.453466, 1, 1, 1, 1, 1,
1.317839, 0.5465295, 1.867245, 1, 1, 1, 1, 1,
1.333846, -0.8522455, 0.6265307, 1, 1, 1, 1, 1,
1.338736, 2.147077, -0.5357674, 1, 1, 1, 1, 1,
1.344466, 0.07431541, 2.711133, 1, 1, 1, 1, 1,
1.354489, -2.559017, 3.143625, 1, 1, 1, 1, 1,
1.358517, -0.8580038, 1.849493, 1, 1, 1, 1, 1,
1.362778, -1.179183, 1.013865, 1, 1, 1, 1, 1,
1.372706, -0.3591224, 2.185221, 1, 1, 1, 1, 1,
1.379027, 0.01157404, 1.009391, 1, 1, 1, 1, 1,
1.379681, 0.3606499, 1.426765, 1, 1, 1, 1, 1,
1.397686, -0.2033881, 2.604775, 1, 1, 1, 1, 1,
1.407344, 0.02752442, 1.937722, 0, 0, 1, 1, 1,
1.413128, -0.264512, 0.536463, 1, 0, 0, 1, 1,
1.41475, 0.5934491, 1.505714, 1, 0, 0, 1, 1,
1.419924, 1.240372, -0.3074084, 1, 0, 0, 1, 1,
1.422495, 0.8657438, 0.745204, 1, 0, 0, 1, 1,
1.423479, 0.8144056, 1.147066, 1, 0, 0, 1, 1,
1.426636, -0.3823655, 0.6400074, 0, 0, 0, 1, 1,
1.435261, -0.07866737, 2.138336, 0, 0, 0, 1, 1,
1.435498, -1.552537, 3.596068, 0, 0, 0, 1, 1,
1.442097, 0.9030449, -1.167246, 0, 0, 0, 1, 1,
1.457691, -0.2165408, 0.2356969, 0, 0, 0, 1, 1,
1.474158, -0.1423098, 2.691036, 0, 0, 0, 1, 1,
1.474881, -0.2286879, 1.713032, 0, 0, 0, 1, 1,
1.47591, 1.138479, 1.099133, 1, 1, 1, 1, 1,
1.480288, 1.969296, 0.5050579, 1, 1, 1, 1, 1,
1.533916, 0.0305635, 0.8050734, 1, 1, 1, 1, 1,
1.537462, -0.3706196, 0.8920049, 1, 1, 1, 1, 1,
1.539491, 0.5994835, 2.819817, 1, 1, 1, 1, 1,
1.554311, -0.07577885, 1.875026, 1, 1, 1, 1, 1,
1.577136, -0.9097278, 1.4983, 1, 1, 1, 1, 1,
1.584769, 0.495759, 0.327242, 1, 1, 1, 1, 1,
1.620643, 1.460561, 2.000891, 1, 1, 1, 1, 1,
1.62165, -0.2640845, 2.416488, 1, 1, 1, 1, 1,
1.624375, 0.8681974, -0.1041376, 1, 1, 1, 1, 1,
1.63742, 0.9045469, 0.8248975, 1, 1, 1, 1, 1,
1.639778, 0.9329283, 2.310101, 1, 1, 1, 1, 1,
1.640142, 0.3468762, 1.64229, 1, 1, 1, 1, 1,
1.664486, -1.127253, 1.914165, 1, 1, 1, 1, 1,
1.667492, 0.204421, 0.6600548, 0, 0, 1, 1, 1,
1.690757, -0.3229843, 1.486666, 1, 0, 0, 1, 1,
1.69078, 1.966625, 1.645479, 1, 0, 0, 1, 1,
1.692847, -0.8846669, 2.500879, 1, 0, 0, 1, 1,
1.693026, -0.4038691, 0.6888557, 1, 0, 0, 1, 1,
1.696985, 1.32609, 0.7595118, 1, 0, 0, 1, 1,
1.706833, -0.1414648, 0.3989095, 0, 0, 0, 1, 1,
1.710579, -0.02151606, 2.684737, 0, 0, 0, 1, 1,
1.715034, -0.01800494, 1.407759, 0, 0, 0, 1, 1,
1.718349, 1.554323, 1.378026, 0, 0, 0, 1, 1,
1.720817, -0.4701475, 0.8762377, 0, 0, 0, 1, 1,
1.724978, 1.033988, 0.4144302, 0, 0, 0, 1, 1,
1.733178, -0.3952326, 1.06978, 0, 0, 0, 1, 1,
1.760376, -0.7855631, 2.929374, 1, 1, 1, 1, 1,
1.762714, 1.640858, 0.3970456, 1, 1, 1, 1, 1,
1.769693, -0.4953307, 1.108158, 1, 1, 1, 1, 1,
1.804763, 0.00181, 1.914216, 1, 1, 1, 1, 1,
1.806293, 0.7677056, 0.5370328, 1, 1, 1, 1, 1,
1.814653, 1.393646, -0.0677334, 1, 1, 1, 1, 1,
1.816061, -0.3810787, 2.069533, 1, 1, 1, 1, 1,
1.817918, -0.4393526, 0.6410536, 1, 1, 1, 1, 1,
1.819862, 0.8140738, -0.2264197, 1, 1, 1, 1, 1,
1.874636, 0.5194939, 0.2686906, 1, 1, 1, 1, 1,
1.875056, -1.404912, 2.101392, 1, 1, 1, 1, 1,
1.878604, -1.400291, 4.194234, 1, 1, 1, 1, 1,
1.908558, -1.113245, 1.934533, 1, 1, 1, 1, 1,
1.908926, -1.306808, 2.46088, 1, 1, 1, 1, 1,
1.995104, 2.955839, -0.5885063, 1, 1, 1, 1, 1,
2.013835, -0.4845959, 0.2055432, 0, 0, 1, 1, 1,
2.020508, 0.5119736, 1.464943, 1, 0, 0, 1, 1,
2.095063, 1.853065, -0.5622609, 1, 0, 0, 1, 1,
2.110279, -0.8039851, 2.878775, 1, 0, 0, 1, 1,
2.13343, -0.7263263, 0.6825638, 1, 0, 0, 1, 1,
2.24285, 1.687589, 0.0319357, 1, 0, 0, 1, 1,
2.263217, 0.3704425, 0.7320487, 0, 0, 0, 1, 1,
2.266968, 0.6806476, 1.59464, 0, 0, 0, 1, 1,
2.275844, 0.2950308, 1.294808, 0, 0, 0, 1, 1,
2.337285, -0.4768473, 0.6217612, 0, 0, 0, 1, 1,
2.358592, 0.280102, 2.444583, 0, 0, 0, 1, 1,
2.379584, -0.8065436, 1.877933, 0, 0, 0, 1, 1,
2.395575, -1.733815, 3.271605, 0, 0, 0, 1, 1,
2.395787, 0.392902, 2.779353, 1, 1, 1, 1, 1,
2.44541, 0.06218366, 0.1030863, 1, 1, 1, 1, 1,
2.636817, -0.363706, 1.235288, 1, 1, 1, 1, 1,
2.727586, 0.6393473, 1.636658, 1, 1, 1, 1, 1,
2.780275, 0.4564602, 1.817381, 1, 1, 1, 1, 1,
2.800881, -0.5184613, 1.972942, 1, 1, 1, 1, 1,
3.267442, -1.873686, 2.653315, 1, 1, 1, 1, 1
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
var radius = 9.211483;
var distance = 32.35494;
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
mvMatrix.translate( -0.1335516, 0.2275186, 0.2934251 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.35494);
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