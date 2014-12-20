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
-3.704825, 0.3202857, -3.135109, 1, 0, 0, 1,
-3.119009, -0.3418265, -1.385179, 1, 0.007843138, 0, 1,
-2.744926, -0.4751774, -2.594229, 1, 0.01176471, 0, 1,
-2.610677, 1.129737, -0.14762, 1, 0.01960784, 0, 1,
-2.573711, 0.4738851, -2.874541, 1, 0.02352941, 0, 1,
-2.532225, 1.332591, -0.4386635, 1, 0.03137255, 0, 1,
-2.518297, 1.543697, 0.3431618, 1, 0.03529412, 0, 1,
-2.444095, 1.231293, -1.371506, 1, 0.04313726, 0, 1,
-2.439743, 0.835111, -2.884614, 1, 0.04705882, 0, 1,
-2.413456, -0.1963621, -0.769205, 1, 0.05490196, 0, 1,
-2.410905, -1.215368, -2.050811, 1, 0.05882353, 0, 1,
-2.398951, -0.1374929, 0.06549168, 1, 0.06666667, 0, 1,
-2.307172, -0.45939, -1.329359, 1, 0.07058824, 0, 1,
-2.28543, -0.1990425, -2.562006, 1, 0.07843138, 0, 1,
-2.282708, 0.6127668, -0.3761339, 1, 0.08235294, 0, 1,
-2.260565, 0.8057764, -1.029026, 1, 0.09019608, 0, 1,
-2.259698, 2.827636, -0.6149074, 1, 0.09411765, 0, 1,
-2.234722, 1.09394, -2.585465, 1, 0.1019608, 0, 1,
-2.224932, 2.151175, -0.5201901, 1, 0.1098039, 0, 1,
-2.21114, -0.3417162, -1.958485, 1, 0.1137255, 0, 1,
-2.14465, 0.8086662, -2.029592, 1, 0.1215686, 0, 1,
-2.051715, 1.977529, 0.2056649, 1, 0.1254902, 0, 1,
-2.049284, -0.01349362, -0.5336385, 1, 0.1333333, 0, 1,
-1.996782, -0.8347871, -2.235973, 1, 0.1372549, 0, 1,
-1.982605, -0.3954645, 0.03573085, 1, 0.145098, 0, 1,
-1.977324, 0.3240129, -3.350426, 1, 0.1490196, 0, 1,
-1.95096, -0.312334, -0.4839433, 1, 0.1568628, 0, 1,
-1.937737, 1.004277, -1.05682, 1, 0.1607843, 0, 1,
-1.934489, -0.54813, -1.860387, 1, 0.1686275, 0, 1,
-1.933667, -0.5892268, -1.494798, 1, 0.172549, 0, 1,
-1.921456, -1.152865, -3.185057, 1, 0.1803922, 0, 1,
-1.910086, -0.4920236, -0.5925111, 1, 0.1843137, 0, 1,
-1.905357, -2.484952, -2.996841, 1, 0.1921569, 0, 1,
-1.904518, -0.2661715, -1.436174, 1, 0.1960784, 0, 1,
-1.888173, -0.5415095, -0.9883554, 1, 0.2039216, 0, 1,
-1.885335, -0.4635152, -1.54204, 1, 0.2117647, 0, 1,
-1.866092, -1.756963, -2.101134, 1, 0.2156863, 0, 1,
-1.863835, 0.03253658, -3.07023, 1, 0.2235294, 0, 1,
-1.851945, 0.5596244, -1.640613, 1, 0.227451, 0, 1,
-1.850251, -0.17516, -2.911464, 1, 0.2352941, 0, 1,
-1.846251, -1.031231, -0.7305911, 1, 0.2392157, 0, 1,
-1.841918, 1.031579, -2.222192, 1, 0.2470588, 0, 1,
-1.806049, 0.3786994, -0.609363, 1, 0.2509804, 0, 1,
-1.805121, 0.6980129, -1.121046, 1, 0.2588235, 0, 1,
-1.791715, -0.08556389, -1.569831, 1, 0.2627451, 0, 1,
-1.780833, -1.095857, -1.165513, 1, 0.2705882, 0, 1,
-1.776859, -1.26605, -2.24118, 1, 0.2745098, 0, 1,
-1.748672, -0.513221, -2.417504, 1, 0.282353, 0, 1,
-1.745795, 1.924843, -0.3003252, 1, 0.2862745, 0, 1,
-1.738576, 1.889571, -0.5325153, 1, 0.2941177, 0, 1,
-1.724262, -0.7757443, -3.756946, 1, 0.3019608, 0, 1,
-1.717835, 0.1953959, -1.875068, 1, 0.3058824, 0, 1,
-1.716494, 0.2785848, -1.499289, 1, 0.3137255, 0, 1,
-1.66733, -0.4870321, 0.03586147, 1, 0.3176471, 0, 1,
-1.649485, 0.1390048, -1.475471, 1, 0.3254902, 0, 1,
-1.641599, 0.1397424, -1.199437, 1, 0.3294118, 0, 1,
-1.638521, -0.9601005, -3.390177, 1, 0.3372549, 0, 1,
-1.630617, -0.3670476, -1.726151, 1, 0.3411765, 0, 1,
-1.626041, 1.078217, -1.643968, 1, 0.3490196, 0, 1,
-1.617837, 2.647295, -0.6017644, 1, 0.3529412, 0, 1,
-1.606794, -0.3646521, -2.008713, 1, 0.3607843, 0, 1,
-1.602891, -0.8614407, -1.014486, 1, 0.3647059, 0, 1,
-1.601272, 1.040166, -1.386847, 1, 0.372549, 0, 1,
-1.595841, 0.2718315, -2.219275, 1, 0.3764706, 0, 1,
-1.586295, 0.1553052, -0.7830889, 1, 0.3843137, 0, 1,
-1.584595, 0.915641, -1.221223, 1, 0.3882353, 0, 1,
-1.581848, -0.5847421, -1.84191, 1, 0.3960784, 0, 1,
-1.561384, 1.229237, -0.8856927, 1, 0.4039216, 0, 1,
-1.555851, -1.386924, -2.167521, 1, 0.4078431, 0, 1,
-1.543005, 0.8361469, -1.444696, 1, 0.4156863, 0, 1,
-1.533197, 1.38462, -0.1726309, 1, 0.4196078, 0, 1,
-1.515563, -1.433389, -2.104842, 1, 0.427451, 0, 1,
-1.511557, -0.3906664, -3.282088, 1, 0.4313726, 0, 1,
-1.510429, -1.797776, -3.574883, 1, 0.4392157, 0, 1,
-1.49555, -0.225714, -2.166087, 1, 0.4431373, 0, 1,
-1.478651, 0.04358824, -1.918886, 1, 0.4509804, 0, 1,
-1.462591, 1.093727, -0.2372824, 1, 0.454902, 0, 1,
-1.461971, 0.1805306, -0.6495726, 1, 0.4627451, 0, 1,
-1.460209, 1.162962, -0.9148819, 1, 0.4666667, 0, 1,
-1.459555, 1.079207, -0.5517418, 1, 0.4745098, 0, 1,
-1.453566, -0.3647427, -2.018273, 1, 0.4784314, 0, 1,
-1.430254, 0.08258957, -1.84943, 1, 0.4862745, 0, 1,
-1.427783, -0.8309851, -2.654307, 1, 0.4901961, 0, 1,
-1.414048, 0.8223857, -0.6846984, 1, 0.4980392, 0, 1,
-1.38509, -0.9948534, -2.716822, 1, 0.5058824, 0, 1,
-1.383402, 0.4147129, 0.7123637, 1, 0.509804, 0, 1,
-1.379354, 0.1608673, -2.40521, 1, 0.5176471, 0, 1,
-1.365889, -1.179158, -0.9983158, 1, 0.5215687, 0, 1,
-1.359692, 0.06107648, -4.052466, 1, 0.5294118, 0, 1,
-1.355808, -1.559106, -2.660469, 1, 0.5333334, 0, 1,
-1.351577, 0.3465812, -1.932303, 1, 0.5411765, 0, 1,
-1.350621, 0.3987615, -1.854548, 1, 0.5450981, 0, 1,
-1.347935, -0.7850292, -2.925437, 1, 0.5529412, 0, 1,
-1.347402, -1.050392, -3.35466, 1, 0.5568628, 0, 1,
-1.341577, 0.3315867, -2.216464, 1, 0.5647059, 0, 1,
-1.334401, -1.951158, -2.583951, 1, 0.5686275, 0, 1,
-1.319538, 0.5305293, -1.796548, 1, 0.5764706, 0, 1,
-1.310247, -0.3712955, -1.484092, 1, 0.5803922, 0, 1,
-1.309891, -1.499488, -1.417975, 1, 0.5882353, 0, 1,
-1.309834, -0.7904847, -2.402794, 1, 0.5921569, 0, 1,
-1.292588, -1.806221, -1.286814, 1, 0.6, 0, 1,
-1.281168, 0.03050858, -1.510131, 1, 0.6078432, 0, 1,
-1.268004, 0.5570166, -0.6371669, 1, 0.6117647, 0, 1,
-1.266329, 0.6908844, -3.751287, 1, 0.6196079, 0, 1,
-1.262311, 1.103681, -0.1613451, 1, 0.6235294, 0, 1,
-1.256132, -0.006094856, -2.626717, 1, 0.6313726, 0, 1,
-1.249498, 0.9068905, -0.7457466, 1, 0.6352941, 0, 1,
-1.23525, -0.5634032, -2.138347, 1, 0.6431373, 0, 1,
-1.232678, 0.2086926, -2.439967, 1, 0.6470588, 0, 1,
-1.231709, 0.4442697, -1.10125, 1, 0.654902, 0, 1,
-1.230405, -1.171452, -2.184332, 1, 0.6588235, 0, 1,
-1.229687, -0.7606351, -1.388865, 1, 0.6666667, 0, 1,
-1.225472, 0.1789237, -1.997463, 1, 0.6705883, 0, 1,
-1.223874, 2.032952, -1.039018, 1, 0.6784314, 0, 1,
-1.223321, -0.7886766, -0.9986786, 1, 0.682353, 0, 1,
-1.217355, -1.414335, -2.834786, 1, 0.6901961, 0, 1,
-1.21659, -0.1385626, -2.348159, 1, 0.6941177, 0, 1,
-1.205451, 0.6360175, -1.166559, 1, 0.7019608, 0, 1,
-1.205151, 0.7321827, -1.380758, 1, 0.7098039, 0, 1,
-1.200789, -0.9081508, -4.119241, 1, 0.7137255, 0, 1,
-1.191999, 1.003724, -0.9817823, 1, 0.7215686, 0, 1,
-1.184329, 1.510637, 0.6703566, 1, 0.7254902, 0, 1,
-1.183856, -2.446098, -2.764155, 1, 0.7333333, 0, 1,
-1.180735, -0.2114219, 0.566623, 1, 0.7372549, 0, 1,
-1.176527, -0.4626055, -2.432465, 1, 0.7450981, 0, 1,
-1.174861, -0.7511565, -2.208935, 1, 0.7490196, 0, 1,
-1.165364, 0.6747754, -1.419031, 1, 0.7568628, 0, 1,
-1.161482, 1.409525, -0.6798375, 1, 0.7607843, 0, 1,
-1.150136, -0.4638997, -2.236544, 1, 0.7686275, 0, 1,
-1.137597, 1.051747, 0.3178136, 1, 0.772549, 0, 1,
-1.13759, -1.053335, -1.066903, 1, 0.7803922, 0, 1,
-1.135328, -1.221232, -1.874144, 1, 0.7843137, 0, 1,
-1.129131, 0.9157234, 0.06342608, 1, 0.7921569, 0, 1,
-1.126698, -0.4935623, 0.6445147, 1, 0.7960784, 0, 1,
-1.125189, -0.1954153, -0.7615372, 1, 0.8039216, 0, 1,
-1.117355, 0.09536018, -2.481853, 1, 0.8117647, 0, 1,
-1.115963, 0.1265929, -1.236668, 1, 0.8156863, 0, 1,
-1.11459, -1.242585, -3.967489, 1, 0.8235294, 0, 1,
-1.103625, -0.4520889, -1.621035, 1, 0.827451, 0, 1,
-1.101833, -0.02081787, -2.084694, 1, 0.8352941, 0, 1,
-1.09499, 0.1700447, -2.123625, 1, 0.8392157, 0, 1,
-1.090484, 0.1841177, -1.246803, 1, 0.8470588, 0, 1,
-1.088018, 0.4773491, -2.220209, 1, 0.8509804, 0, 1,
-1.087886, -0.1944106, -3.114177, 1, 0.8588235, 0, 1,
-1.086825, 1.08715, 0.6770079, 1, 0.8627451, 0, 1,
-1.078693, 1.11184, -1.242606, 1, 0.8705882, 0, 1,
-1.072041, 0.3105478, 0.6624098, 1, 0.8745098, 0, 1,
-1.068407, 0.3295704, 0.6475453, 1, 0.8823529, 0, 1,
-1.059014, 1.206211, 0.4196833, 1, 0.8862745, 0, 1,
-1.053768, 0.4806884, -0.3446459, 1, 0.8941177, 0, 1,
-1.051598, 1.168873, -1.65518, 1, 0.8980392, 0, 1,
-1.047592, 0.2124545, -1.70931, 1, 0.9058824, 0, 1,
-1.047178, -0.5022909, -3.469072, 1, 0.9137255, 0, 1,
-1.040564, 1.495935, -0.7277712, 1, 0.9176471, 0, 1,
-1.038944, -0.3670395, -2.446975, 1, 0.9254902, 0, 1,
-1.038029, -0.6145784, -2.713136, 1, 0.9294118, 0, 1,
-1.03322, -0.4558272, -2.053176, 1, 0.9372549, 0, 1,
-1.023497, 1.987511, 0.7139884, 1, 0.9411765, 0, 1,
-1.023304, 0.2373457, -1.710023, 1, 0.9490196, 0, 1,
-1.01575, -0.9532921, -2.088091, 1, 0.9529412, 0, 1,
-1.010735, 0.9598645, -1.084154, 1, 0.9607843, 0, 1,
-1.009212, 0.11247, -0.009071562, 1, 0.9647059, 0, 1,
-1.006999, -0.8611991, -2.351856, 1, 0.972549, 0, 1,
-0.9936379, 2.114364, 0.6655887, 1, 0.9764706, 0, 1,
-0.9923045, 1.507784, -0.4446575, 1, 0.9843137, 0, 1,
-0.9832743, 0.3404464, -2.851397, 1, 0.9882353, 0, 1,
-0.9813828, -0.2888143, -2.62459, 1, 0.9960784, 0, 1,
-0.9592816, 0.2111835, -0.9018788, 0.9960784, 1, 0, 1,
-0.9555092, 1.909094, 0.8045673, 0.9921569, 1, 0, 1,
-0.9536512, -0.09854479, -2.932515, 0.9843137, 1, 0, 1,
-0.9499139, -0.2933454, -2.039828, 0.9803922, 1, 0, 1,
-0.9443654, 0.9390012, -0.2506958, 0.972549, 1, 0, 1,
-0.9384168, -0.283006, -2.685325, 0.9686275, 1, 0, 1,
-0.931852, -0.3226701, -1.650116, 0.9607843, 1, 0, 1,
-0.9316906, -0.3054811, -3.136014, 0.9568627, 1, 0, 1,
-0.9231904, -1.249561, -3.738256, 0.9490196, 1, 0, 1,
-0.922054, 1.198688, 0.3619295, 0.945098, 1, 0, 1,
-0.9182636, -0.140323, -0.2658174, 0.9372549, 1, 0, 1,
-0.9177341, 1.803266, -0.671535, 0.9333333, 1, 0, 1,
-0.9009895, -1.153658, -2.20042, 0.9254902, 1, 0, 1,
-0.9002121, 0.237866, -0.7122326, 0.9215686, 1, 0, 1,
-0.8978936, -0.4072897, 0.2741517, 0.9137255, 1, 0, 1,
-0.8892608, 0.7482691, 0.03886945, 0.9098039, 1, 0, 1,
-0.8652472, -0.9758908, -4.341219, 0.9019608, 1, 0, 1,
-0.8651996, -1.498428, -2.960174, 0.8941177, 1, 0, 1,
-0.8644369, 0.2943273, -2.018566, 0.8901961, 1, 0, 1,
-0.8634824, 0.5347195, -0.3961988, 0.8823529, 1, 0, 1,
-0.8465992, -2.073945, -2.984662, 0.8784314, 1, 0, 1,
-0.8465282, 0.7210441, 0.436654, 0.8705882, 1, 0, 1,
-0.8430906, -1.444432, -0.4993158, 0.8666667, 1, 0, 1,
-0.8386383, 0.4869477, -1.160695, 0.8588235, 1, 0, 1,
-0.8385847, -1.101578, -2.625834, 0.854902, 1, 0, 1,
-0.8384494, 0.2602193, -0.8834728, 0.8470588, 1, 0, 1,
-0.8380463, -0.1198423, -1.965642, 0.8431373, 1, 0, 1,
-0.8369211, 0.7589946, -1.282163, 0.8352941, 1, 0, 1,
-0.8315518, 2.056409, -0.2257549, 0.8313726, 1, 0, 1,
-0.8301072, -0.4321398, -1.820329, 0.8235294, 1, 0, 1,
-0.82208, -0.04121819, -3.252128, 0.8196079, 1, 0, 1,
-0.8144858, -1.037027, -2.738565, 0.8117647, 1, 0, 1,
-0.8076691, 1.651767, -0.7385964, 0.8078431, 1, 0, 1,
-0.8037463, -1.901766, -1.66108, 0.8, 1, 0, 1,
-0.8023938, 0.1048011, -0.5544767, 0.7921569, 1, 0, 1,
-0.7968349, 1.919584, 1.123743, 0.7882353, 1, 0, 1,
-0.7965366, -0.2097394, -3.139115, 0.7803922, 1, 0, 1,
-0.7860475, 0.4643058, -2.395957, 0.7764706, 1, 0, 1,
-0.7814333, -0.7856962, -3.200573, 0.7686275, 1, 0, 1,
-0.7800047, 0.3983877, -2.069377, 0.7647059, 1, 0, 1,
-0.7780325, -1.494936, -3.096781, 0.7568628, 1, 0, 1,
-0.7770715, -0.4304207, -1.319174, 0.7529412, 1, 0, 1,
-0.770581, 2.540085, 0.08685266, 0.7450981, 1, 0, 1,
-0.7686723, 0.513467, -0.6973013, 0.7411765, 1, 0, 1,
-0.7637636, -1.108911, -3.038317, 0.7333333, 1, 0, 1,
-0.7636756, 1.149453, -0.47197, 0.7294118, 1, 0, 1,
-0.7618714, 0.009630248, -2.551404, 0.7215686, 1, 0, 1,
-0.7536882, -1.09554, -2.671073, 0.7176471, 1, 0, 1,
-0.7535173, -0.2591189, -2.382193, 0.7098039, 1, 0, 1,
-0.7508708, 0.22473, -1.349984, 0.7058824, 1, 0, 1,
-0.740624, -1.165333, -1.670246, 0.6980392, 1, 0, 1,
-0.7395363, -0.5002692, -0.1861566, 0.6901961, 1, 0, 1,
-0.7340046, 0.01520357, -2.282049, 0.6862745, 1, 0, 1,
-0.7287771, 0.3253855, -1.893516, 0.6784314, 1, 0, 1,
-0.7171525, -0.2645375, -2.759027, 0.6745098, 1, 0, 1,
-0.7157876, 0.774269, 0.7397423, 0.6666667, 1, 0, 1,
-0.7108431, 0.841904, -0.8321933, 0.6627451, 1, 0, 1,
-0.7085633, 0.7719888, 0.05333951, 0.654902, 1, 0, 1,
-0.6992427, -2.616175, -1.440946, 0.6509804, 1, 0, 1,
-0.6935918, -2.018514, -2.643764, 0.6431373, 1, 0, 1,
-0.6935056, -1.209845, -2.80525, 0.6392157, 1, 0, 1,
-0.6921336, 1.559061, -1.230846, 0.6313726, 1, 0, 1,
-0.6842776, 1.034429, 0.04423663, 0.627451, 1, 0, 1,
-0.6829645, 0.9251842, -0.07974902, 0.6196079, 1, 0, 1,
-0.6825516, -1.274652, -2.663002, 0.6156863, 1, 0, 1,
-0.6807464, 0.4942413, -2.205507, 0.6078432, 1, 0, 1,
-0.6712589, 0.4582622, 0.2767507, 0.6039216, 1, 0, 1,
-0.6688651, -2.806956, -4.451813, 0.5960785, 1, 0, 1,
-0.6682756, 0.3521736, -2.131861, 0.5882353, 1, 0, 1,
-0.6625013, -0.2390103, 0.3946192, 0.5843138, 1, 0, 1,
-0.6586578, -0.2665283, -0.2047263, 0.5764706, 1, 0, 1,
-0.6568229, -1.750667, -1.900707, 0.572549, 1, 0, 1,
-0.6551952, 0.8305454, -0.8265526, 0.5647059, 1, 0, 1,
-0.6542711, 0.3563212, -2.023135, 0.5607843, 1, 0, 1,
-0.653578, -1.364508, -2.653327, 0.5529412, 1, 0, 1,
-0.6524022, 1.093461, -1.396137, 0.5490196, 1, 0, 1,
-0.6492921, 0.4578478, -0.5053188, 0.5411765, 1, 0, 1,
-0.6481649, -1.425808, -2.511322, 0.5372549, 1, 0, 1,
-0.6443415, 1.848601, 0.1733969, 0.5294118, 1, 0, 1,
-0.644186, 0.8026494, -0.4134112, 0.5254902, 1, 0, 1,
-0.6431757, -0.09217423, -1.075732, 0.5176471, 1, 0, 1,
-0.6359299, -0.715712, -1.572809, 0.5137255, 1, 0, 1,
-0.6282609, 0.2736131, -1.718764, 0.5058824, 1, 0, 1,
-0.6237839, 1.459274, -0.275038, 0.5019608, 1, 0, 1,
-0.6206765, -0.1667762, -3.179517, 0.4941176, 1, 0, 1,
-0.6107811, 2.546016, 0.4165427, 0.4862745, 1, 0, 1,
-0.6105325, 0.2020063, -0.8780705, 0.4823529, 1, 0, 1,
-0.6104565, -0.3196919, -2.062398, 0.4745098, 1, 0, 1,
-0.6060525, -2.346215, -3.192845, 0.4705882, 1, 0, 1,
-0.6019637, -0.2035361, -2.323946, 0.4627451, 1, 0, 1,
-0.6016843, -1.697706, -3.41493, 0.4588235, 1, 0, 1,
-0.5976585, -0.5821352, -2.68153, 0.4509804, 1, 0, 1,
-0.589855, -0.3770642, -2.212807, 0.4470588, 1, 0, 1,
-0.5877922, 1.089894, 0.0529226, 0.4392157, 1, 0, 1,
-0.5858729, -0.205777, -2.128334, 0.4352941, 1, 0, 1,
-0.5839142, 0.9020873, -2.645543, 0.427451, 1, 0, 1,
-0.5810567, -1.023359, -2.191437, 0.4235294, 1, 0, 1,
-0.579786, -0.3994865, -1.549081, 0.4156863, 1, 0, 1,
-0.5793096, -2.1061, -4.298571, 0.4117647, 1, 0, 1,
-0.5756825, -1.447685, -2.096059, 0.4039216, 1, 0, 1,
-0.5724825, 0.6607174, -0.8163507, 0.3960784, 1, 0, 1,
-0.5673012, -0.3072549, 0.2813223, 0.3921569, 1, 0, 1,
-0.5633447, -1.34443, -3.558524, 0.3843137, 1, 0, 1,
-0.5589396, 0.2434849, 0.6222148, 0.3803922, 1, 0, 1,
-0.5539162, 0.9029365, -0.03992467, 0.372549, 1, 0, 1,
-0.5537102, 0.1122371, -0.581981, 0.3686275, 1, 0, 1,
-0.5524915, 1.523723, -0.126818, 0.3607843, 1, 0, 1,
-0.5490595, -0.140525, -1.582249, 0.3568628, 1, 0, 1,
-0.545153, 1.092662, -3.522108, 0.3490196, 1, 0, 1,
-0.542663, -1.120453, -1.724701, 0.345098, 1, 0, 1,
-0.5402532, 0.7871497, -0.2052567, 0.3372549, 1, 0, 1,
-0.5385324, -0.467302, -3.394051, 0.3333333, 1, 0, 1,
-0.5358235, 1.034672, 0.7939155, 0.3254902, 1, 0, 1,
-0.5339812, 1.1489, -1.328076, 0.3215686, 1, 0, 1,
-0.5335295, 0.6054437, -0.6501046, 0.3137255, 1, 0, 1,
-0.5257151, -1.019908, -1.116233, 0.3098039, 1, 0, 1,
-0.5232234, 2.633182, -0.410954, 0.3019608, 1, 0, 1,
-0.5150501, 1.378835, -1.025421, 0.2941177, 1, 0, 1,
-0.5132976, 0.3179196, -0.7073538, 0.2901961, 1, 0, 1,
-0.5124617, 0.6604207, 0.585892, 0.282353, 1, 0, 1,
-0.5095314, -0.7595587, -3.487833, 0.2784314, 1, 0, 1,
-0.5081248, -0.9518801, -3.508521, 0.2705882, 1, 0, 1,
-0.508115, 0.9787523, -0.3099475, 0.2666667, 1, 0, 1,
-0.5041476, -0.3279209, -2.115446, 0.2588235, 1, 0, 1,
-0.5030661, 1.102074, -0.8204816, 0.254902, 1, 0, 1,
-0.495194, 0.8962178, 0.2689579, 0.2470588, 1, 0, 1,
-0.4941792, 0.8103251, -0.5807075, 0.2431373, 1, 0, 1,
-0.4926108, 0.4312125, -0.7620661, 0.2352941, 1, 0, 1,
-0.4907, 0.5743296, -0.6793647, 0.2313726, 1, 0, 1,
-0.4891154, -0.7652361, -4.123321, 0.2235294, 1, 0, 1,
-0.4872837, -1.550489, -2.431165, 0.2196078, 1, 0, 1,
-0.4806151, 1.690553, 0.9527352, 0.2117647, 1, 0, 1,
-0.4737454, -2.369849, -3.892476, 0.2078431, 1, 0, 1,
-0.473247, -0.6602378, -2.316746, 0.2, 1, 0, 1,
-0.4676436, 0.2195356, -1.397265, 0.1921569, 1, 0, 1,
-0.4654608, 0.6690907, -0.0838203, 0.1882353, 1, 0, 1,
-0.4607287, 1.19706, -0.2482004, 0.1803922, 1, 0, 1,
-0.4603468, 0.7606908, -0.8845064, 0.1764706, 1, 0, 1,
-0.4580165, -0.4209631, -0.5164675, 0.1686275, 1, 0, 1,
-0.4455422, 0.83746, 1.758701, 0.1647059, 1, 0, 1,
-0.4448738, -0.2171305, -1.529735, 0.1568628, 1, 0, 1,
-0.4419726, 0.6746306, -0.1800045, 0.1529412, 1, 0, 1,
-0.4402095, 0.2579367, -1.590146, 0.145098, 1, 0, 1,
-0.4357508, -1.52046, -3.23199, 0.1411765, 1, 0, 1,
-0.4338484, 0.4151492, -2.161092, 0.1333333, 1, 0, 1,
-0.4332373, -0.7048309, -2.903704, 0.1294118, 1, 0, 1,
-0.4330411, -0.6722851, -2.55548, 0.1215686, 1, 0, 1,
-0.4290197, 2.042542, 0.9279197, 0.1176471, 1, 0, 1,
-0.4233878, 2.117493, 0.5235533, 0.1098039, 1, 0, 1,
-0.4222566, 1.750074, 2.013517, 0.1058824, 1, 0, 1,
-0.4219488, -1.031545, -3.549028, 0.09803922, 1, 0, 1,
-0.4193394, -0.4685367, -3.702013, 0.09019608, 1, 0, 1,
-0.4158964, -0.3125645, -3.274939, 0.08627451, 1, 0, 1,
-0.4135887, -0.3283258, -1.84953, 0.07843138, 1, 0, 1,
-0.4133664, 1.025117, 1.136243, 0.07450981, 1, 0, 1,
-0.4107407, -0.7722213, -1.891042, 0.06666667, 1, 0, 1,
-0.4094087, 1.632824, 0.1949809, 0.0627451, 1, 0, 1,
-0.4068455, -0.6660979, -3.372138, 0.05490196, 1, 0, 1,
-0.4031311, -0.2393302, -2.053671, 0.05098039, 1, 0, 1,
-0.4015618, -0.1954403, -1.044013, 0.04313726, 1, 0, 1,
-0.3984108, -0.6430004, -2.173409, 0.03921569, 1, 0, 1,
-0.3971701, 0.3612798, -0.4942995, 0.03137255, 1, 0, 1,
-0.3937021, 1.215256, -1.287518, 0.02745098, 1, 0, 1,
-0.391326, -0.445136, -2.663853, 0.01960784, 1, 0, 1,
-0.383241, 0.810583, -1.471379, 0.01568628, 1, 0, 1,
-0.3815983, 0.573553, -1.140028, 0.007843138, 1, 0, 1,
-0.380987, 0.649978, 0.5382189, 0.003921569, 1, 0, 1,
-0.3796193, -0.3973543, -1.906042, 0, 1, 0.003921569, 1,
-0.3759027, -0.7253084, -1.733769, 0, 1, 0.01176471, 1,
-0.3708797, -0.4240784, -1.66089, 0, 1, 0.01568628, 1,
-0.3660785, -1.982193, -2.576562, 0, 1, 0.02352941, 1,
-0.3639081, 0.3610276, -0.03931187, 0, 1, 0.02745098, 1,
-0.3600807, -0.456919, -2.222786, 0, 1, 0.03529412, 1,
-0.3588953, -1.104689, -3.855122, 0, 1, 0.03921569, 1,
-0.3577207, -0.9257952, -3.200691, 0, 1, 0.04705882, 1,
-0.3459073, -0.2827739, -0.8186671, 0, 1, 0.05098039, 1,
-0.3456085, -1.266301, -3.277385, 0, 1, 0.05882353, 1,
-0.342342, -0.5212832, -2.200556, 0, 1, 0.0627451, 1,
-0.3371857, -0.7771057, -1.235976, 0, 1, 0.07058824, 1,
-0.3320678, 1.076623, -1.181632, 0, 1, 0.07450981, 1,
-0.3290089, -0.9446789, -1.604421, 0, 1, 0.08235294, 1,
-0.3210295, -0.1318106, -0.2591341, 0, 1, 0.08627451, 1,
-0.3204064, 0.3496787, 0.3229558, 0, 1, 0.09411765, 1,
-0.3155084, -0.5970498, -1.42722, 0, 1, 0.1019608, 1,
-0.3147026, -0.5969114, -2.410795, 0, 1, 0.1058824, 1,
-0.3142493, 0.1874724, -0.1752692, 0, 1, 0.1137255, 1,
-0.3116732, -0.3123247, -2.424494, 0, 1, 0.1176471, 1,
-0.3096083, 2.205726, 2.141096, 0, 1, 0.1254902, 1,
-0.3094918, 0.0188174, -2.86275, 0, 1, 0.1294118, 1,
-0.3088171, -1.082285, -3.771402, 0, 1, 0.1372549, 1,
-0.3009308, 0.739647, -0.9670552, 0, 1, 0.1411765, 1,
-0.2956342, -1.061197, -2.28213, 0, 1, 0.1490196, 1,
-0.2941691, -1.940824, -2.946793, 0, 1, 0.1529412, 1,
-0.2922995, 1.749264, -0.9934263, 0, 1, 0.1607843, 1,
-0.2803825, -0.4636597, -2.710982, 0, 1, 0.1647059, 1,
-0.2802379, -2.386652, -3.002201, 0, 1, 0.172549, 1,
-0.2763891, -0.6565645, -4.803469, 0, 1, 0.1764706, 1,
-0.2760302, 0.4110136, 0.1899358, 0, 1, 0.1843137, 1,
-0.2750767, 1.360994, 0.3967007, 0, 1, 0.1882353, 1,
-0.2736042, 0.02966, -1.541562, 0, 1, 0.1960784, 1,
-0.2715298, 0.4269596, -0.7055683, 0, 1, 0.2039216, 1,
-0.2701972, 1.593255, -0.1523366, 0, 1, 0.2078431, 1,
-0.2672213, 1.229615, -0.6200595, 0, 1, 0.2156863, 1,
-0.2644548, -0.1163161, -0.2280353, 0, 1, 0.2196078, 1,
-0.2617986, 1.428228, -0.9983191, 0, 1, 0.227451, 1,
-0.2437384, -0.02464558, 1.38593, 0, 1, 0.2313726, 1,
-0.2422445, -0.1663769, -1.3699, 0, 1, 0.2392157, 1,
-0.2400685, 0.8053244, 0.402123, 0, 1, 0.2431373, 1,
-0.2391959, -0.5429634, -2.446147, 0, 1, 0.2509804, 1,
-0.2378898, -0.2042018, 0.003844411, 0, 1, 0.254902, 1,
-0.2342197, -0.5121363, -3.080361, 0, 1, 0.2627451, 1,
-0.2287412, 1.261273, -0.5670888, 0, 1, 0.2666667, 1,
-0.2247562, -0.312311, -1.340608, 0, 1, 0.2745098, 1,
-0.2242478, -0.3046541, -3.304823, 0, 1, 0.2784314, 1,
-0.2223767, 1.005986, 1.446106, 0, 1, 0.2862745, 1,
-0.2216686, 0.2339457, 1.086102, 0, 1, 0.2901961, 1,
-0.2180115, 0.356326, -1.859197, 0, 1, 0.2980392, 1,
-0.2157671, 1.4162, 0.6808887, 0, 1, 0.3058824, 1,
-0.214281, 0.2362431, -0.9942415, 0, 1, 0.3098039, 1,
-0.2110884, -0.541832, -3.112349, 0, 1, 0.3176471, 1,
-0.2064745, 0.8525012, -1.730621, 0, 1, 0.3215686, 1,
-0.2026984, 0.3579006, -1.061013, 0, 1, 0.3294118, 1,
-0.2012144, 0.4529186, -0.7438906, 0, 1, 0.3333333, 1,
-0.1998553, 0.4414944, -1.168185, 0, 1, 0.3411765, 1,
-0.1883039, 0.9555928, -0.6924314, 0, 1, 0.345098, 1,
-0.1854843, -2.516202, -3.706911, 0, 1, 0.3529412, 1,
-0.1842607, 0.4632656, 1.192941, 0, 1, 0.3568628, 1,
-0.1785041, -0.9169171, -3.541324, 0, 1, 0.3647059, 1,
-0.1767908, 0.5274969, -0.928169, 0, 1, 0.3686275, 1,
-0.1745033, 0.3574609, -0.03861083, 0, 1, 0.3764706, 1,
-0.1741945, 0.3086176, -0.2303672, 0, 1, 0.3803922, 1,
-0.1707059, 0.214395, 0.9088905, 0, 1, 0.3882353, 1,
-0.1687352, -0.519393, -3.442377, 0, 1, 0.3921569, 1,
-0.1684052, -1.064419, -5.53559, 0, 1, 0.4, 1,
-0.1682798, 0.5990853, -0.1387491, 0, 1, 0.4078431, 1,
-0.1675279, -0.04563845, -1.694728, 0, 1, 0.4117647, 1,
-0.1618525, -0.01745985, -1.609545, 0, 1, 0.4196078, 1,
-0.1573371, -0.5275027, -3.298478, 0, 1, 0.4235294, 1,
-0.1547745, -0.6997871, -3.386755, 0, 1, 0.4313726, 1,
-0.1504386, -1.545137, -3.520313, 0, 1, 0.4352941, 1,
-0.145223, -0.3557083, -3.277742, 0, 1, 0.4431373, 1,
-0.1421795, -2.956252, -2.426961, 0, 1, 0.4470588, 1,
-0.1418583, 0.6280028, 0.7126599, 0, 1, 0.454902, 1,
-0.1368592, 0.7540239, 0.07458465, 0, 1, 0.4588235, 1,
-0.1337085, 0.5737095, -0.6710246, 0, 1, 0.4666667, 1,
-0.1294815, 1.022707, -2.140594, 0, 1, 0.4705882, 1,
-0.1293416, -0.001509868, -0.7097408, 0, 1, 0.4784314, 1,
-0.1272051, 0.04695703, -0.2431036, 0, 1, 0.4823529, 1,
-0.1185863, -2.43964, -3.155557, 0, 1, 0.4901961, 1,
-0.1180294, 1.480041, -0.1285731, 0, 1, 0.4941176, 1,
-0.1124078, -0.7700387, -3.041192, 0, 1, 0.5019608, 1,
-0.1107014, -1.209631, -2.243013, 0, 1, 0.509804, 1,
-0.1096916, 0.6580409, -0.1639297, 0, 1, 0.5137255, 1,
-0.1056089, -1.077584, -4.544999, 0, 1, 0.5215687, 1,
-0.1050946, -1.845001, -2.857871, 0, 1, 0.5254902, 1,
-0.1019524, 0.3127384, 0.5431889, 0, 1, 0.5333334, 1,
-0.1009952, -1.776307, -3.887307, 0, 1, 0.5372549, 1,
-0.09927084, 1.120412, 1.063008, 0, 1, 0.5450981, 1,
-0.09447436, -0.5129259, -2.468563, 0, 1, 0.5490196, 1,
-0.08521571, 0.2895377, 0.2055515, 0, 1, 0.5568628, 1,
-0.07859413, -0.4582079, -3.098, 0, 1, 0.5607843, 1,
-0.07649895, -0.297005, -2.270687, 0, 1, 0.5686275, 1,
-0.07413708, -1.261051, -4.936691, 0, 1, 0.572549, 1,
-0.07375995, -0.9731807, -2.729295, 0, 1, 0.5803922, 1,
-0.07362781, -0.5932351, -3.749449, 0, 1, 0.5843138, 1,
-0.07302801, -1.235475, -4.300802, 0, 1, 0.5921569, 1,
-0.06567806, -2.03519, -2.328069, 0, 1, 0.5960785, 1,
-0.05753497, -1.489191, -2.692014, 0, 1, 0.6039216, 1,
-0.05645895, 1.269772, 1.386366, 0, 1, 0.6117647, 1,
-0.04817536, 1.046592, -0.6696201, 0, 1, 0.6156863, 1,
-0.04654823, -0.220482, -1.535441, 0, 1, 0.6235294, 1,
-0.04254307, 0.7949873, 0.8051492, 0, 1, 0.627451, 1,
-0.04240493, 0.2199479, -0.3542133, 0, 1, 0.6352941, 1,
-0.04123697, 0.1475713, -0.1405606, 0, 1, 0.6392157, 1,
-0.03962564, 2.290961, -1.980045, 0, 1, 0.6470588, 1,
-0.03876645, -0.4627239, -3.038302, 0, 1, 0.6509804, 1,
-0.03859524, 1.506331, -0.9381595, 0, 1, 0.6588235, 1,
-0.03543535, -0.8515999, -3.740759, 0, 1, 0.6627451, 1,
-0.03540233, 0.4529866, 0.9824381, 0, 1, 0.6705883, 1,
-0.02947918, 1.830105, 0.9837617, 0, 1, 0.6745098, 1,
-0.02653176, -0.7014792, -3.058029, 0, 1, 0.682353, 1,
-0.02415758, -0.7831912, -2.780611, 0, 1, 0.6862745, 1,
-0.01743952, 1.092564, -0.5240327, 0, 1, 0.6941177, 1,
-0.01670042, 0.4468622, 0.3233585, 0, 1, 0.7019608, 1,
-0.008455452, -0.3472547, -4.050512, 0, 1, 0.7058824, 1,
-0.005039196, 0.4950166, -0.8734496, 0, 1, 0.7137255, 1,
-0.002820617, -0.6810498, -2.718034, 0, 1, 0.7176471, 1,
-0.002662845, 1.751761, -0.3132442, 0, 1, 0.7254902, 1,
0.0004659266, 2.182996, -0.5535247, 0, 1, 0.7294118, 1,
0.0009948828, 0.04221538, -1.436572, 0, 1, 0.7372549, 1,
0.003514462, 0.5012829, -1.214803, 0, 1, 0.7411765, 1,
0.007280852, -1.640286, 2.361107, 0, 1, 0.7490196, 1,
0.01123596, -0.5878284, 2.970896, 0, 1, 0.7529412, 1,
0.01149981, -1.240777, 1.523049, 0, 1, 0.7607843, 1,
0.01509118, 0.1790011, 1.054265, 0, 1, 0.7647059, 1,
0.01698224, -0.3190397, 3.388996, 0, 1, 0.772549, 1,
0.01850448, 0.3903062, 1.296339, 0, 1, 0.7764706, 1,
0.0349967, -0.6663861, 4.614085, 0, 1, 0.7843137, 1,
0.03515527, -1.093995, 2.677294, 0, 1, 0.7882353, 1,
0.03564249, 0.6292856, 0.7763664, 0, 1, 0.7960784, 1,
0.04272374, -0.159941, 2.646014, 0, 1, 0.8039216, 1,
0.04379345, -0.784573, 2.98119, 0, 1, 0.8078431, 1,
0.04431301, 0.588508, 0.08982635, 0, 1, 0.8156863, 1,
0.04958383, 0.3569075, 1.008295, 0, 1, 0.8196079, 1,
0.05142802, -0.4818859, 4.067842, 0, 1, 0.827451, 1,
0.0528275, 0.05946055, 1.1669, 0, 1, 0.8313726, 1,
0.05296493, 0.7089697, -1.499717, 0, 1, 0.8392157, 1,
0.05323319, -0.8969575, 2.436494, 0, 1, 0.8431373, 1,
0.05397015, -0.798828, 2.222162, 0, 1, 0.8509804, 1,
0.05555052, -0.1774597, 2.842842, 0, 1, 0.854902, 1,
0.05801249, 1.64039, 0.6213515, 0, 1, 0.8627451, 1,
0.05842016, -0.4850646, 2.902995, 0, 1, 0.8666667, 1,
0.06005703, -0.6575252, 2.299244, 0, 1, 0.8745098, 1,
0.06032674, 0.556904, -0.6700634, 0, 1, 0.8784314, 1,
0.06157485, 0.6945627, -0.2180023, 0, 1, 0.8862745, 1,
0.06490503, -1.030468, 4.091952, 0, 1, 0.8901961, 1,
0.06768483, -0.2233373, 2.288336, 0, 1, 0.8980392, 1,
0.06812628, -0.1311108, 2.732825, 0, 1, 0.9058824, 1,
0.07299727, 2.616169, 0.1137544, 0, 1, 0.9098039, 1,
0.07573607, 0.6432512, -1.071256, 0, 1, 0.9176471, 1,
0.07674337, -0.3239964, 1.385475, 0, 1, 0.9215686, 1,
0.07767114, 0.3108005, -0.1228864, 0, 1, 0.9294118, 1,
0.0829612, -0.1734435, 2.774445, 0, 1, 0.9333333, 1,
0.08429514, 0.4529731, 0.1212486, 0, 1, 0.9411765, 1,
0.08506387, -0.9708042, 2.142542, 0, 1, 0.945098, 1,
0.08628172, -0.1121608, 3.98723, 0, 1, 0.9529412, 1,
0.09094912, 0.3355715, 1.137588, 0, 1, 0.9568627, 1,
0.09326913, -1.030116, 3.887012, 0, 1, 0.9647059, 1,
0.09454178, 1.264301, 0.6959431, 0, 1, 0.9686275, 1,
0.09540368, 0.4232717, 1.319947, 0, 1, 0.9764706, 1,
0.09683926, 0.6343058, 0.9222115, 0, 1, 0.9803922, 1,
0.09710874, -0.6197336, 3.192214, 0, 1, 0.9882353, 1,
0.09962111, 0.7965569, -0.9225896, 0, 1, 0.9921569, 1,
0.1016527, 0.323544, 1.292464, 0, 1, 1, 1,
0.102931, -0.8076125, 4.825832, 0, 0.9921569, 1, 1,
0.104517, 0.62081, 1.498204, 0, 0.9882353, 1, 1,
0.1068307, -0.7102705, 3.605881, 0, 0.9803922, 1, 1,
0.1077253, 0.7968859, 2.276352, 0, 0.9764706, 1, 1,
0.1085756, 0.8011425, 0.1875877, 0, 0.9686275, 1, 1,
0.1093528, 0.4476125, 0.3878419, 0, 0.9647059, 1, 1,
0.1102925, 0.3603707, 0.8419056, 0, 0.9568627, 1, 1,
0.1105378, 0.1776328, 0.5315849, 0, 0.9529412, 1, 1,
0.1114874, 0.4555189, 0.2302166, 0, 0.945098, 1, 1,
0.1117447, 0.02672968, 1.313574, 0, 0.9411765, 1, 1,
0.1172627, 1.020931, -0.4216039, 0, 0.9333333, 1, 1,
0.118482, 1.021698, 0.6702384, 0, 0.9294118, 1, 1,
0.1208417, -0.005473678, 0.325298, 0, 0.9215686, 1, 1,
0.1270863, -0.499495, 2.642459, 0, 0.9176471, 1, 1,
0.1297417, 0.7539326, -0.1291665, 0, 0.9098039, 1, 1,
0.1317378, 0.2892259, -1.696454, 0, 0.9058824, 1, 1,
0.1331052, -0.2731673, 2.522296, 0, 0.8980392, 1, 1,
0.1334647, -0.5197539, 3.832471, 0, 0.8901961, 1, 1,
0.1341863, 0.3540129, 1.777445, 0, 0.8862745, 1, 1,
0.1377143, -0.858851, 4.751723, 0, 0.8784314, 1, 1,
0.1408777, -0.7003781, 4.607605, 0, 0.8745098, 1, 1,
0.1488224, 0.9916432, -0.5828639, 0, 0.8666667, 1, 1,
0.1511635, -2.351801, 2.794919, 0, 0.8627451, 1, 1,
0.1528673, -1.376237, 2.545413, 0, 0.854902, 1, 1,
0.1554182, -0.1813056, 3.534045, 0, 0.8509804, 1, 1,
0.1561721, -1.112555, 4.020618, 0, 0.8431373, 1, 1,
0.1581698, -1.070815, 4.195986, 0, 0.8392157, 1, 1,
0.1633601, -1.297202, 0.5879714, 0, 0.8313726, 1, 1,
0.1645066, -0.1235856, 1.008319, 0, 0.827451, 1, 1,
0.1662473, -1.584975, 2.955263, 0, 0.8196079, 1, 1,
0.1688062, -0.518346, 4.052781, 0, 0.8156863, 1, 1,
0.1698327, 0.6557027, 0.3486631, 0, 0.8078431, 1, 1,
0.1723273, -0.6343775, 1.673806, 0, 0.8039216, 1, 1,
0.1756836, 1.355561, -0.1001026, 0, 0.7960784, 1, 1,
0.1777887, 2.09731, -0.84126, 0, 0.7882353, 1, 1,
0.1820934, -0.5881014, 1.56281, 0, 0.7843137, 1, 1,
0.1854183, -1.004223, 2.652446, 0, 0.7764706, 1, 1,
0.1885292, -1.068257, 3.717823, 0, 0.772549, 1, 1,
0.1894598, -0.06344628, 3.511954, 0, 0.7647059, 1, 1,
0.1901309, -0.2000031, 2.468701, 0, 0.7607843, 1, 1,
0.1901874, 0.1151877, 0.3200674, 0, 0.7529412, 1, 1,
0.1910352, -1.386454, 2.479809, 0, 0.7490196, 1, 1,
0.1924812, -0.3926932, 3.528513, 0, 0.7411765, 1, 1,
0.1931244, -0.3461669, 3.959506, 0, 0.7372549, 1, 1,
0.1947319, 0.9936842, 0.8372321, 0, 0.7294118, 1, 1,
0.1951954, 0.6468366, -0.2330864, 0, 0.7254902, 1, 1,
0.1988008, -1.495106, 1.327629, 0, 0.7176471, 1, 1,
0.2007583, 0.9904604, 0.6435809, 0, 0.7137255, 1, 1,
0.2029313, -0.1018512, 2.188266, 0, 0.7058824, 1, 1,
0.2051754, 0.8210187, -0.266775, 0, 0.6980392, 1, 1,
0.2075099, 0.7066382, 1.083258, 0, 0.6941177, 1, 1,
0.2079548, 0.4270157, -0.04566519, 0, 0.6862745, 1, 1,
0.2091186, 1.77604, 0.1531025, 0, 0.682353, 1, 1,
0.2139432, 1.57527, 0.2397573, 0, 0.6745098, 1, 1,
0.214571, -0.8940057, 2.452505, 0, 0.6705883, 1, 1,
0.2197801, -0.1829001, 2.698766, 0, 0.6627451, 1, 1,
0.2200902, -1.685878, 3.241888, 0, 0.6588235, 1, 1,
0.2227799, 0.2444449, 0.6967709, 0, 0.6509804, 1, 1,
0.2234835, 1.387597, -0.01092809, 0, 0.6470588, 1, 1,
0.2278315, -0.01297563, 1.015314, 0, 0.6392157, 1, 1,
0.2325582, -2.793128, 3.435169, 0, 0.6352941, 1, 1,
0.2358142, 1.174703, 0.2333089, 0, 0.627451, 1, 1,
0.2394964, 1.172964, 0.09222363, 0, 0.6235294, 1, 1,
0.2441321, -0.8860822, 3.222547, 0, 0.6156863, 1, 1,
0.2445697, -0.6084167, 1.286822, 0, 0.6117647, 1, 1,
0.2445782, -1.685661, 3.159869, 0, 0.6039216, 1, 1,
0.2479308, -1.224071, 1.720161, 0, 0.5960785, 1, 1,
0.2480615, 2.014282, 0.7537033, 0, 0.5921569, 1, 1,
0.2505533, 0.03706287, 2.17888, 0, 0.5843138, 1, 1,
0.2528962, 0.205258, 0.3281774, 0, 0.5803922, 1, 1,
0.2537023, -1.292131, 3.278384, 0, 0.572549, 1, 1,
0.2561755, -0.09210631, 3.064749, 0, 0.5686275, 1, 1,
0.2569783, 0.04874477, 1.354862, 0, 0.5607843, 1, 1,
0.2582605, -0.2647587, 1.772258, 0, 0.5568628, 1, 1,
0.2603799, -2.255489, 3.754101, 0, 0.5490196, 1, 1,
0.2633603, -1.016146, -0.09196991, 0, 0.5450981, 1, 1,
0.267535, 1.1053, 0.8090242, 0, 0.5372549, 1, 1,
0.2682958, 1.172825, -0.05343838, 0, 0.5333334, 1, 1,
0.2703334, -1.32499, 3.896752, 0, 0.5254902, 1, 1,
0.2733932, 1.247065, 1.706536, 0, 0.5215687, 1, 1,
0.277662, -0.5720934, 3.854361, 0, 0.5137255, 1, 1,
0.2786525, -0.4207668, 2.81658, 0, 0.509804, 1, 1,
0.2845735, -0.04806762, 0.5905325, 0, 0.5019608, 1, 1,
0.2852732, -0.9136291, 2.593035, 0, 0.4941176, 1, 1,
0.287216, 0.3951287, 1.821058, 0, 0.4901961, 1, 1,
0.2937524, 0.3319691, 0.8259615, 0, 0.4823529, 1, 1,
0.2963105, -1.691358, 4.724266, 0, 0.4784314, 1, 1,
0.2986722, 0.6743007, 0.525756, 0, 0.4705882, 1, 1,
0.3021407, 2.091413, -1.49394, 0, 0.4666667, 1, 1,
0.3025191, -0.09367255, 1.34231, 0, 0.4588235, 1, 1,
0.3052417, -0.7937639, 2.588502, 0, 0.454902, 1, 1,
0.3055991, -1.144093, 1.890131, 0, 0.4470588, 1, 1,
0.3070471, 0.05028937, 2.983045, 0, 0.4431373, 1, 1,
0.3139356, 0.558462, 0.3054906, 0, 0.4352941, 1, 1,
0.3172212, 0.03895104, 2.326855, 0, 0.4313726, 1, 1,
0.3210087, 1.967564, -0.4250832, 0, 0.4235294, 1, 1,
0.3311618, 1.416783, 0.5776321, 0, 0.4196078, 1, 1,
0.3336657, 1.674011, 0.6703796, 0, 0.4117647, 1, 1,
0.3337698, -2.275289, 4.75842, 0, 0.4078431, 1, 1,
0.3340918, 0.1220388, 0.79847, 0, 0.4, 1, 1,
0.3374822, -0.6638256, 0.2468823, 0, 0.3921569, 1, 1,
0.3391087, 0.9839728, -1.606182, 0, 0.3882353, 1, 1,
0.3393086, -0.4108328, 4.149169, 0, 0.3803922, 1, 1,
0.3419945, -0.3600697, 2.892777, 0, 0.3764706, 1, 1,
0.3435439, 0.541769, 1.431871, 0, 0.3686275, 1, 1,
0.3448645, 0.3803881, 2.446359, 0, 0.3647059, 1, 1,
0.3455065, 1.186543, 1.438436, 0, 0.3568628, 1, 1,
0.3476491, -1.453971, 4.069973, 0, 0.3529412, 1, 1,
0.3491832, -0.07697007, 3.057106, 0, 0.345098, 1, 1,
0.3498118, 1.328431, 0.6483435, 0, 0.3411765, 1, 1,
0.3515861, 0.3319963, 0.6336386, 0, 0.3333333, 1, 1,
0.3639055, 0.3834287, 2.742833, 0, 0.3294118, 1, 1,
0.3654218, -0.5012394, 2.710636, 0, 0.3215686, 1, 1,
0.368506, 1.213543, 0.4904684, 0, 0.3176471, 1, 1,
0.3708463, -0.07654987, 1.432511, 0, 0.3098039, 1, 1,
0.373238, 0.1171951, 3.023752, 0, 0.3058824, 1, 1,
0.3738, 0.2545834, 0.8908952, 0, 0.2980392, 1, 1,
0.3837875, 1.31976, 1.706572, 0, 0.2901961, 1, 1,
0.3962595, -0.260684, 2.157127, 0, 0.2862745, 1, 1,
0.396646, 0.2793706, 1.790446, 0, 0.2784314, 1, 1,
0.3979083, 1.24525, -0.752137, 0, 0.2745098, 1, 1,
0.4080702, -1.042733, 3.525926, 0, 0.2666667, 1, 1,
0.4098924, -0.5026372, 3.416439, 0, 0.2627451, 1, 1,
0.4112639, -0.4102861, 4.27548, 0, 0.254902, 1, 1,
0.4167096, -0.2216251, 1.612807, 0, 0.2509804, 1, 1,
0.4176257, 1.132738, 0.3813259, 0, 0.2431373, 1, 1,
0.4184751, 0.1279772, 2.357981, 0, 0.2392157, 1, 1,
0.4223659, -2.774934, 4.04997, 0, 0.2313726, 1, 1,
0.4247025, -0.9351336, 2.363331, 0, 0.227451, 1, 1,
0.4250144, -0.4699115, 2.346535, 0, 0.2196078, 1, 1,
0.4355845, 1.623115, -0.3151008, 0, 0.2156863, 1, 1,
0.4389721, 0.3086729, 0.5562075, 0, 0.2078431, 1, 1,
0.4401059, 0.6396177, 0.1894633, 0, 0.2039216, 1, 1,
0.4409973, -0.2674976, 4.368187, 0, 0.1960784, 1, 1,
0.4434633, -0.355312, 0.7996159, 0, 0.1882353, 1, 1,
0.4437322, 0.7666702, 0.3840154, 0, 0.1843137, 1, 1,
0.4454668, -0.6802524, 1.795945, 0, 0.1764706, 1, 1,
0.4484006, -0.4569388, 2.019525, 0, 0.172549, 1, 1,
0.4545719, -0.4015477, 4.041852, 0, 0.1647059, 1, 1,
0.4583858, -0.5152389, 2.935028, 0, 0.1607843, 1, 1,
0.4627749, -0.6908672, 2.609272, 0, 0.1529412, 1, 1,
0.464875, -0.9745315, 2.98604, 0, 0.1490196, 1, 1,
0.4649991, 1.482927, -0.3842577, 0, 0.1411765, 1, 1,
0.4668477, 0.7420948, -0.8188837, 0, 0.1372549, 1, 1,
0.4673278, 1.432788, -0.02889618, 0, 0.1294118, 1, 1,
0.4681608, 0.1875422, 1.556218, 0, 0.1254902, 1, 1,
0.4694385, -0.4668919, 1.79581, 0, 0.1176471, 1, 1,
0.4763418, 0.2144365, 1.540407, 0, 0.1137255, 1, 1,
0.4771673, -0.2849044, 3.047322, 0, 0.1058824, 1, 1,
0.4779516, -0.257592, 2.112158, 0, 0.09803922, 1, 1,
0.4839514, -0.1106815, 1.406626, 0, 0.09411765, 1, 1,
0.4881477, 0.7670578, -0.3376012, 0, 0.08627451, 1, 1,
0.489464, 1.171686, -0.1701877, 0, 0.08235294, 1, 1,
0.4937463, 0.6979873, 0.6955622, 0, 0.07450981, 1, 1,
0.4955189, 0.4007777, 2.546078, 0, 0.07058824, 1, 1,
0.5016634, -1.055098, 4.102447, 0, 0.0627451, 1, 1,
0.5023397, -0.4412437, 0.63197, 0, 0.05882353, 1, 1,
0.5049965, 0.3828199, 0.9874566, 0, 0.05098039, 1, 1,
0.5070297, 0.3486322, 1.895813, 0, 0.04705882, 1, 1,
0.5087508, 0.3912529, 1.51467, 0, 0.03921569, 1, 1,
0.5105932, 0.5959029, -0.7222672, 0, 0.03529412, 1, 1,
0.5109618, -1.061339, 3.601103, 0, 0.02745098, 1, 1,
0.5132219, 0.03745762, 2.513183, 0, 0.02352941, 1, 1,
0.5135294, -1.098141, 2.7298, 0, 0.01568628, 1, 1,
0.5151635, -0.7523173, 3.151173, 0, 0.01176471, 1, 1,
0.5158201, -0.5475805, 3.600786, 0, 0.003921569, 1, 1,
0.5195091, -1.131188, 2.566075, 0.003921569, 0, 1, 1,
0.5259195, -0.5261122, 3.060008, 0.007843138, 0, 1, 1,
0.5264803, -0.1664014, 3.3231, 0.01568628, 0, 1, 1,
0.5291603, 0.2800725, 1.582435, 0.01960784, 0, 1, 1,
0.5312608, 0.00530918, 0.3897584, 0.02745098, 0, 1, 1,
0.5320111, 0.3561418, 1.661115, 0.03137255, 0, 1, 1,
0.5374486, -1.07098, 3.281326, 0.03921569, 0, 1, 1,
0.5388938, -1.338304, 3.662977, 0.04313726, 0, 1, 1,
0.5470762, -0.1251708, 1.71033, 0.05098039, 0, 1, 1,
0.5480756, -0.2585385, 1.622272, 0.05490196, 0, 1, 1,
0.5531595, 0.1045294, 0.8867629, 0.0627451, 0, 1, 1,
0.5603175, 0.7090598, -0.9176117, 0.06666667, 0, 1, 1,
0.5623431, 0.7104615, 0.880635, 0.07450981, 0, 1, 1,
0.5623693, 1.121727, 0.08219487, 0.07843138, 0, 1, 1,
0.564076, 0.1160994, 0.9137095, 0.08627451, 0, 1, 1,
0.5695935, -0.07618243, 0.922357, 0.09019608, 0, 1, 1,
0.5717661, -0.1949521, 0.4761348, 0.09803922, 0, 1, 1,
0.5720427, 0.1315378, 2.193262, 0.1058824, 0, 1, 1,
0.5735132, 1.930271, 0.7697645, 0.1098039, 0, 1, 1,
0.5754496, -0.3697785, 2.04768, 0.1176471, 0, 1, 1,
0.5830916, -0.3331136, 1.921726, 0.1215686, 0, 1, 1,
0.5922048, -0.7312187, 2.513283, 0.1294118, 0, 1, 1,
0.5932598, 0.9098063, 1.145564, 0.1333333, 0, 1, 1,
0.593613, -0.202204, 2.425618, 0.1411765, 0, 1, 1,
0.5938378, -0.7540464, 2.630555, 0.145098, 0, 1, 1,
0.5955802, 0.2676031, 0.4244865, 0.1529412, 0, 1, 1,
0.5990188, -1.070062, 3.525647, 0.1568628, 0, 1, 1,
0.6004664, -2.230752, 4.589969, 0.1647059, 0, 1, 1,
0.6022611, 0.7361307, 1.36565, 0.1686275, 0, 1, 1,
0.6148133, 0.3898387, 0.7041476, 0.1764706, 0, 1, 1,
0.619926, -1.514197, 2.424829, 0.1803922, 0, 1, 1,
0.6207914, -0.1861957, 1.308757, 0.1882353, 0, 1, 1,
0.6216763, -0.3688722, 3.132361, 0.1921569, 0, 1, 1,
0.6232559, -0.4705782, 3.744163, 0.2, 0, 1, 1,
0.6266942, 0.5301664, 0.8980465, 0.2078431, 0, 1, 1,
0.6271574, -0.9140097, 1.732806, 0.2117647, 0, 1, 1,
0.6307852, 1.736247, 1.589943, 0.2196078, 0, 1, 1,
0.63113, 0.4953221, 0.5745722, 0.2235294, 0, 1, 1,
0.6313431, 0.8793789, 0.3842903, 0.2313726, 0, 1, 1,
0.6315663, -1.355913, 3.235383, 0.2352941, 0, 1, 1,
0.6327994, 1.819355, 0.8884189, 0.2431373, 0, 1, 1,
0.6342236, 0.6586723, 1.648011, 0.2470588, 0, 1, 1,
0.6342533, 0.362776, -0.328359, 0.254902, 0, 1, 1,
0.635624, 1.007406, 1.139858, 0.2588235, 0, 1, 1,
0.6356385, 1.462206, 0.6616304, 0.2666667, 0, 1, 1,
0.6382263, -0.3999086, 3.062489, 0.2705882, 0, 1, 1,
0.6385487, 0.07920828, 1.188163, 0.2784314, 0, 1, 1,
0.6395614, 1.553961, -0.7437158, 0.282353, 0, 1, 1,
0.6433566, -0.7036321, 1.153974, 0.2901961, 0, 1, 1,
0.6459461, -2.890568, 3.621283, 0.2941177, 0, 1, 1,
0.6496119, -1.277261, 4.974027, 0.3019608, 0, 1, 1,
0.6550149, -1.140615, 3.829462, 0.3098039, 0, 1, 1,
0.6555441, 1.451842, -0.05612782, 0.3137255, 0, 1, 1,
0.6568474, 0.2929287, -0.5354701, 0.3215686, 0, 1, 1,
0.6640791, -0.3946282, 2.990713, 0.3254902, 0, 1, 1,
0.6649614, 0.2012286, 0.4460516, 0.3333333, 0, 1, 1,
0.6666349, -0.425619, 1.971413, 0.3372549, 0, 1, 1,
0.6668373, -0.2115811, 1.299008, 0.345098, 0, 1, 1,
0.6686617, -0.007230781, 2.102081, 0.3490196, 0, 1, 1,
0.6735082, 0.9991125, 0.3609361, 0.3568628, 0, 1, 1,
0.6766558, 0.1055119, 0.3583039, 0.3607843, 0, 1, 1,
0.6807541, -0.5884878, 2.742427, 0.3686275, 0, 1, 1,
0.6816185, 0.6595788, 1.187416, 0.372549, 0, 1, 1,
0.6840746, -1.483575, 3.300981, 0.3803922, 0, 1, 1,
0.6866263, -0.2316928, 1.706534, 0.3843137, 0, 1, 1,
0.6866972, 1.118328, -0.8688841, 0.3921569, 0, 1, 1,
0.6883481, 0.1558471, 0.7916352, 0.3960784, 0, 1, 1,
0.6893587, 0.140225, 1.130625, 0.4039216, 0, 1, 1,
0.6918473, 1.070885, -1.519843, 0.4117647, 0, 1, 1,
0.6935233, -1.782462, 1.999029, 0.4156863, 0, 1, 1,
0.6946298, 0.7635356, -0.1824996, 0.4235294, 0, 1, 1,
0.6948658, 0.9989415, 1.05051, 0.427451, 0, 1, 1,
0.6958314, -1.44939, 1.592718, 0.4352941, 0, 1, 1,
0.6960993, 0.7035816, 1.291742, 0.4392157, 0, 1, 1,
0.6996078, 0.5996193, 0.6639075, 0.4470588, 0, 1, 1,
0.7017585, -1.317695, 1.061924, 0.4509804, 0, 1, 1,
0.7043719, -0.5050752, 1.614143, 0.4588235, 0, 1, 1,
0.7083071, 1.028113, -0.4780754, 0.4627451, 0, 1, 1,
0.7113446, -0.2890049, -0.6921257, 0.4705882, 0, 1, 1,
0.711953, -0.08510657, 1.844568, 0.4745098, 0, 1, 1,
0.7135482, 1.308803, -0.4811973, 0.4823529, 0, 1, 1,
0.7153779, -0.7247956, 0.6707281, 0.4862745, 0, 1, 1,
0.7231343, 2.847138, -0.5239712, 0.4941176, 0, 1, 1,
0.7295904, 0.2999043, 1.281076, 0.5019608, 0, 1, 1,
0.73219, 0.2845979, 0.4838343, 0.5058824, 0, 1, 1,
0.7328097, 1.756556, -0.1245294, 0.5137255, 0, 1, 1,
0.7364326, -0.4781778, 0.1793872, 0.5176471, 0, 1, 1,
0.7415469, -0.1238786, 2.026388, 0.5254902, 0, 1, 1,
0.7424641, 0.3835507, -0.2234502, 0.5294118, 0, 1, 1,
0.7548027, 1.055723, -0.3127449, 0.5372549, 0, 1, 1,
0.7565505, -0.40233, 1.481648, 0.5411765, 0, 1, 1,
0.7605098, -0.7979094, 3.71818, 0.5490196, 0, 1, 1,
0.7634013, -3.236691, 3.950825, 0.5529412, 0, 1, 1,
0.7655342, -0.974503, 2.61159, 0.5607843, 0, 1, 1,
0.7725123, -1.212685, 2.372605, 0.5647059, 0, 1, 1,
0.7737178, 1.747205, 1.920357, 0.572549, 0, 1, 1,
0.7802441, -0.4616599, 2.984081, 0.5764706, 0, 1, 1,
0.7821884, -0.4378071, 2.580072, 0.5843138, 0, 1, 1,
0.7822579, -0.1318151, 1.78253, 0.5882353, 0, 1, 1,
0.787686, 1.975538, 0.9878931, 0.5960785, 0, 1, 1,
0.7880184, 0.9078809, 3.251885, 0.6039216, 0, 1, 1,
0.7962871, -0.09639345, 1.522542, 0.6078432, 0, 1, 1,
0.7964302, 0.5588832, 1.32439, 0.6156863, 0, 1, 1,
0.7980772, -0.2923705, 1.586944, 0.6196079, 0, 1, 1,
0.7997731, 1.288867, 0.02988427, 0.627451, 0, 1, 1,
0.800158, -0.7671015, 3.738618, 0.6313726, 0, 1, 1,
0.8002776, -0.2587381, 2.159538, 0.6392157, 0, 1, 1,
0.8006709, 1.529735, 0.4487529, 0.6431373, 0, 1, 1,
0.8018717, 1.563998, 0.4210853, 0.6509804, 0, 1, 1,
0.8054063, 0.562153, 1.704449, 0.654902, 0, 1, 1,
0.8057826, -1.016717, 1.451334, 0.6627451, 0, 1, 1,
0.8063548, -0.05971717, -0.6814472, 0.6666667, 0, 1, 1,
0.806946, 0.2761239, 2.019399, 0.6745098, 0, 1, 1,
0.810742, -1.385396, 2.208236, 0.6784314, 0, 1, 1,
0.8149287, -0.394784, 1.481491, 0.6862745, 0, 1, 1,
0.8178431, 0.01593022, 1.239987, 0.6901961, 0, 1, 1,
0.8270298, -0.9772742, 2.603432, 0.6980392, 0, 1, 1,
0.8385688, 1.621423, 1.844375, 0.7058824, 0, 1, 1,
0.8443952, 0.562736, 0.6458222, 0.7098039, 0, 1, 1,
0.8491999, -0.5118518, 2.182655, 0.7176471, 0, 1, 1,
0.8538565, -1.648524, 3.96866, 0.7215686, 0, 1, 1,
0.855723, -1.351376, 2.077729, 0.7294118, 0, 1, 1,
0.8632364, -1.921962, 4.129349, 0.7333333, 0, 1, 1,
0.8663408, 1.323832, 2.282168, 0.7411765, 0, 1, 1,
0.8685042, 1.702431, 0.09245364, 0.7450981, 0, 1, 1,
0.869953, 0.7457884, 0.3214026, 0.7529412, 0, 1, 1,
0.8732805, 0.05049524, 0.9071271, 0.7568628, 0, 1, 1,
0.8758454, 0.05103806, 1.669514, 0.7647059, 0, 1, 1,
0.8837177, -0.9598939, 2.053809, 0.7686275, 0, 1, 1,
0.8962691, -0.4165637, 1.469694, 0.7764706, 0, 1, 1,
0.8975503, 0.7941068, 1.549627, 0.7803922, 0, 1, 1,
0.8981049, 0.8135183, 0.449591, 0.7882353, 0, 1, 1,
0.8984337, -0.2384171, 2.005639, 0.7921569, 0, 1, 1,
0.9007627, 1.602903, 1.101794, 0.8, 0, 1, 1,
0.9013499, -0.9287499, 2.84683, 0.8078431, 0, 1, 1,
0.9065185, 0.8887738, 0.9197669, 0.8117647, 0, 1, 1,
0.9089995, -1.685675, 3.312028, 0.8196079, 0, 1, 1,
0.9106774, -0.233959, 1.876163, 0.8235294, 0, 1, 1,
0.911473, -0.6793696, 3.915158, 0.8313726, 0, 1, 1,
0.9270655, 1.829882, -0.657786, 0.8352941, 0, 1, 1,
0.9331836, -1.43835, 4.769143, 0.8431373, 0, 1, 1,
0.9375419, 0.8282934, 2.260106, 0.8470588, 0, 1, 1,
0.9423965, -0.6129461, 2.693691, 0.854902, 0, 1, 1,
0.9511096, 0.09999592, 1.208074, 0.8588235, 0, 1, 1,
0.9566384, -1.151045, 1.265023, 0.8666667, 0, 1, 1,
0.957415, -2.169061, 0.226041, 0.8705882, 0, 1, 1,
0.9613098, 1.783568, 1.230904, 0.8784314, 0, 1, 1,
0.9618717, -1.445417, 2.296413, 0.8823529, 0, 1, 1,
0.9621937, -0.9647231, 1.879464, 0.8901961, 0, 1, 1,
0.9663101, -0.1931819, 1.408407, 0.8941177, 0, 1, 1,
0.9689103, -1.229397, 3.693553, 0.9019608, 0, 1, 1,
0.982893, -0.00258204, 1.66286, 0.9098039, 0, 1, 1,
0.9878989, 0.09867428, 1.357337, 0.9137255, 0, 1, 1,
0.9882656, -0.94231, 2.238644, 0.9215686, 0, 1, 1,
0.9918131, -0.2348745, 2.541103, 0.9254902, 0, 1, 1,
0.9926425, -0.3746524, 1.763863, 0.9333333, 0, 1, 1,
0.9964087, 1.93315, 0.4323713, 0.9372549, 0, 1, 1,
1.007792, 0.1711651, 0.7819965, 0.945098, 0, 1, 1,
1.011284, 1.293334, -0.8367229, 0.9490196, 0, 1, 1,
1.013554, 0.08635572, -0.5457963, 0.9568627, 0, 1, 1,
1.013634, 0.8636063, 0.2852447, 0.9607843, 0, 1, 1,
1.01636, 1.888952, 0.1756116, 0.9686275, 0, 1, 1,
1.021128, 0.531682, 1.482439, 0.972549, 0, 1, 1,
1.022872, 1.293637, 0.2253425, 0.9803922, 0, 1, 1,
1.029184, 1.23763, -0.6174749, 0.9843137, 0, 1, 1,
1.029368, 0.0601825, 1.594975, 0.9921569, 0, 1, 1,
1.030169, 1.216485, 0.6307474, 0.9960784, 0, 1, 1,
1.030395, -0.3017012, 1.724033, 1, 0, 0.9960784, 1,
1.03364, 0.2479549, 1.575892, 1, 0, 0.9882353, 1,
1.033666, 1.699146, 1.312192, 1, 0, 0.9843137, 1,
1.037381, -0.7430335, 3.975166, 1, 0, 0.9764706, 1,
1.039304, 1.267043, 0.0913901, 1, 0, 0.972549, 1,
1.041281, -0.01957146, 2.211722, 1, 0, 0.9647059, 1,
1.045023, 0.8349305, 0.7124581, 1, 0, 0.9607843, 1,
1.047691, -2.167685, 0.07558254, 1, 0, 0.9529412, 1,
1.050409, -0.5447723, 2.443976, 1, 0, 0.9490196, 1,
1.059663, -1.520015, 2.62247, 1, 0, 0.9411765, 1,
1.064541, 0.5008561, 1.354183, 1, 0, 0.9372549, 1,
1.066119, 0.003897211, 1.708777, 1, 0, 0.9294118, 1,
1.071293, 2.140757, 1.054396, 1, 0, 0.9254902, 1,
1.072127, 0.09688317, -0.3233935, 1, 0, 0.9176471, 1,
1.074606, 1.143502, 1.049133, 1, 0, 0.9137255, 1,
1.077931, -0.6373961, 2.583306, 1, 0, 0.9058824, 1,
1.086793, 0.723437, 0.2451717, 1, 0, 0.9019608, 1,
1.088181, -0.2535161, 1.772971, 1, 0, 0.8941177, 1,
1.088578, -0.2971498, 3.181907, 1, 0, 0.8862745, 1,
1.102916, -0.5828521, 1.935847, 1, 0, 0.8823529, 1,
1.103145, -0.2473262, 1.681999, 1, 0, 0.8745098, 1,
1.112192, 1.974888, -2.005015, 1, 0, 0.8705882, 1,
1.120543, -0.5843228, 1.876386, 1, 0, 0.8627451, 1,
1.125112, -0.2986177, 1.474456, 1, 0, 0.8588235, 1,
1.128553, 0.2658803, 0.3137277, 1, 0, 0.8509804, 1,
1.132661, -0.4450856, 2.006865, 1, 0, 0.8470588, 1,
1.135627, -0.524218, 2.128158, 1, 0, 0.8392157, 1,
1.139766, 0.5015668, -0.1345518, 1, 0, 0.8352941, 1,
1.14338, -0.09415217, 0.3330923, 1, 0, 0.827451, 1,
1.150555, 0.2397836, 0.1770721, 1, 0, 0.8235294, 1,
1.151314, 1.012038, 2.593229, 1, 0, 0.8156863, 1,
1.160442, 0.3788933, 1.499137, 1, 0, 0.8117647, 1,
1.170245, -1.078081, 4.007788, 1, 0, 0.8039216, 1,
1.171674, -1.3463, 1.211791, 1, 0, 0.7960784, 1,
1.172123, -1.142774, 3.053149, 1, 0, 0.7921569, 1,
1.173386, -0.9415627, 1.910906, 1, 0, 0.7843137, 1,
1.173783, -1.900813, 4.227935, 1, 0, 0.7803922, 1,
1.180245, 0.6542163, -1.098758, 1, 0, 0.772549, 1,
1.181335, 1.1386, -1.453398, 1, 0, 0.7686275, 1,
1.185153, -1.183906, 2.680127, 1, 0, 0.7607843, 1,
1.187808, 1.709013, 0.4074444, 1, 0, 0.7568628, 1,
1.194449, -0.1299555, 3.029469, 1, 0, 0.7490196, 1,
1.196446, -1.063618, 3.723868, 1, 0, 0.7450981, 1,
1.19724, 1.007541, -0.1942063, 1, 0, 0.7372549, 1,
1.198237, -0.3212045, 0.8129376, 1, 0, 0.7333333, 1,
1.199848, -0.6401733, 0.07588021, 1, 0, 0.7254902, 1,
1.203841, 1.360631, -0.7082177, 1, 0, 0.7215686, 1,
1.205953, 0.483261, 2.734557, 1, 0, 0.7137255, 1,
1.211531, -2.045067, 2.171648, 1, 0, 0.7098039, 1,
1.213794, -0.9945994, 2.893316, 1, 0, 0.7019608, 1,
1.216376, -0.5650457, 3.718311, 1, 0, 0.6941177, 1,
1.216453, -0.1749365, 1.817322, 1, 0, 0.6901961, 1,
1.218463, -0.8343009, 2.621689, 1, 0, 0.682353, 1,
1.221116, -2.110003, 2.847554, 1, 0, 0.6784314, 1,
1.223466, -0.1640899, 2.595323, 1, 0, 0.6705883, 1,
1.223946, -0.685916, 4.354042, 1, 0, 0.6666667, 1,
1.224215, 0.2991712, 2.40281, 1, 0, 0.6588235, 1,
1.2304, 0.01763881, 1.900125, 1, 0, 0.654902, 1,
1.236104, -1.43461, 4.068241, 1, 0, 0.6470588, 1,
1.241084, 0.8251525, 0.7922735, 1, 0, 0.6431373, 1,
1.24235, -0.07913637, 1.092278, 1, 0, 0.6352941, 1,
1.244416, -0.7967334, 3.090559, 1, 0, 0.6313726, 1,
1.246107, 1.523801, 0.5811726, 1, 0, 0.6235294, 1,
1.252716, -2.980426, 3.347731, 1, 0, 0.6196079, 1,
1.279201, 0.7722627, 2.028727, 1, 0, 0.6117647, 1,
1.286049, -1.719136, 4.454106, 1, 0, 0.6078432, 1,
1.289459, 0.2257948, 2.89341, 1, 0, 0.6, 1,
1.293086, -1.668248, 1.836362, 1, 0, 0.5921569, 1,
1.295655, -1.058332, 2.473722, 1, 0, 0.5882353, 1,
1.304839, -0.674209, 0.3431344, 1, 0, 0.5803922, 1,
1.307489, -0.6484356, 0.7083035, 1, 0, 0.5764706, 1,
1.315842, 0.1995858, 1.150542, 1, 0, 0.5686275, 1,
1.316067, -1.380085, 0.7541155, 1, 0, 0.5647059, 1,
1.317174, -0.9329712, 2.433936, 1, 0, 0.5568628, 1,
1.330694, 1.002586, -0.7272306, 1, 0, 0.5529412, 1,
1.338407, -1.561261, 1.162927, 1, 0, 0.5450981, 1,
1.341125, -0.4936602, 1.85907, 1, 0, 0.5411765, 1,
1.342027, 0.4736241, 2.551912, 1, 0, 0.5333334, 1,
1.350405, 1.370637, 0.3840844, 1, 0, 0.5294118, 1,
1.355753, -1.904019, 2.684439, 1, 0, 0.5215687, 1,
1.374009, -0.4043449, 2.349569, 1, 0, 0.5176471, 1,
1.374252, 0.8877974, 1.300686, 1, 0, 0.509804, 1,
1.377395, 0.4140318, 0.9621921, 1, 0, 0.5058824, 1,
1.379949, 0.6598849, 1.432902, 1, 0, 0.4980392, 1,
1.387414, -0.2612411, 1.82706, 1, 0, 0.4901961, 1,
1.392326, -0.5935754, 0.7518534, 1, 0, 0.4862745, 1,
1.397362, 0.1735634, 2.319217, 1, 0, 0.4784314, 1,
1.413229, -0.4107479, 3.759637, 1, 0, 0.4745098, 1,
1.414178, -1.177611, 2.213554, 1, 0, 0.4666667, 1,
1.416251, 1.463844, 2.702253, 1, 0, 0.4627451, 1,
1.430791, 0.816654, 0.8553574, 1, 0, 0.454902, 1,
1.433162, -0.7334989, 1.883236, 1, 0, 0.4509804, 1,
1.454316, 1.123505, -0.3747748, 1, 0, 0.4431373, 1,
1.455931, -0.4044726, 1.080384, 1, 0, 0.4392157, 1,
1.49084, 0.4656307, 0.5978749, 1, 0, 0.4313726, 1,
1.498248, -1.646102, 3.528504, 1, 0, 0.427451, 1,
1.501632, 0.4322414, 1.638828, 1, 0, 0.4196078, 1,
1.513337, 0.2973117, 2.319047, 1, 0, 0.4156863, 1,
1.528978, 0.6214043, 2.1412, 1, 0, 0.4078431, 1,
1.542171, -1.298562, 1.575983, 1, 0, 0.4039216, 1,
1.542202, 0.24099, 0.4822413, 1, 0, 0.3960784, 1,
1.542776, -0.1995814, 1.559093, 1, 0, 0.3882353, 1,
1.548194, 0.6750404, 1.437948, 1, 0, 0.3843137, 1,
1.549892, 0.01872756, 3.689741, 1, 0, 0.3764706, 1,
1.555756, 0.07692739, 1.516839, 1, 0, 0.372549, 1,
1.559226, -1.716914, 1.264877, 1, 0, 0.3647059, 1,
1.560034, 1.335989, 0.768654, 1, 0, 0.3607843, 1,
1.567694, -0.256449, 0.8758118, 1, 0, 0.3529412, 1,
1.56878, 1.455074, -0.008125306, 1, 0, 0.3490196, 1,
1.569338, -0.008512228, 0.3723244, 1, 0, 0.3411765, 1,
1.576692, -0.8480961, 3.451946, 1, 0, 0.3372549, 1,
1.577195, 0.7340551, 1.000985, 1, 0, 0.3294118, 1,
1.578162, -0.2666641, 0.2926793, 1, 0, 0.3254902, 1,
1.635754, 0.4364896, 1.541877, 1, 0, 0.3176471, 1,
1.648204, 0.6386572, 1.288164, 1, 0, 0.3137255, 1,
1.655302, -1.932959, 3.741648, 1, 0, 0.3058824, 1,
1.656933, -0.916685, 1.297859, 1, 0, 0.2980392, 1,
1.664709, 1.008467, 0.3534973, 1, 0, 0.2941177, 1,
1.666394, -2.188223, 3.180956, 1, 0, 0.2862745, 1,
1.669594, -0.6430463, 1.217386, 1, 0, 0.282353, 1,
1.707296, -0.1215632, 1.179066, 1, 0, 0.2745098, 1,
1.739172, -0.3879354, 0.7713149, 1, 0, 0.2705882, 1,
1.746835, -1.462667, 2.059165, 1, 0, 0.2627451, 1,
1.74708, -1.101497, 3.007351, 1, 0, 0.2588235, 1,
1.757345, -0.8320248, 1.914015, 1, 0, 0.2509804, 1,
1.780079, 1.277845, 1.820486, 1, 0, 0.2470588, 1,
1.791116, 0.2597033, 3.073505, 1, 0, 0.2392157, 1,
1.798746, -0.3104319, 3.483141, 1, 0, 0.2352941, 1,
1.80523, 0.2978953, 1.592417, 1, 0, 0.227451, 1,
1.818194, -1.461329, 1.585237, 1, 0, 0.2235294, 1,
1.820699, -0.9100944, 2.91604, 1, 0, 0.2156863, 1,
1.826781, 1.293437, 1.221714, 1, 0, 0.2117647, 1,
1.840426, 1.127733, 1.817223, 1, 0, 0.2039216, 1,
1.875461, -0.1708483, 1.102318, 1, 0, 0.1960784, 1,
1.876362, 0.03675576, 2.331954, 1, 0, 0.1921569, 1,
1.878136, 0.1783112, 0.7688309, 1, 0, 0.1843137, 1,
1.894297, -2.689438, 2.49714, 1, 0, 0.1803922, 1,
1.901967, 0.02026486, 3.288139, 1, 0, 0.172549, 1,
1.939121, 0.07220665, 0.4203934, 1, 0, 0.1686275, 1,
1.96367, -0.8036088, 3.610082, 1, 0, 0.1607843, 1,
1.97983, 0.3532932, 0.8645996, 1, 0, 0.1568628, 1,
2.000664, 1.235176, 2.18276, 1, 0, 0.1490196, 1,
2.027446, 0.277398, 0.628643, 1, 0, 0.145098, 1,
2.049417, 0.9590298, 1.342545, 1, 0, 0.1372549, 1,
2.083596, -0.9523294, 3.363197, 1, 0, 0.1333333, 1,
2.104011, 0.1768406, 1.205214, 1, 0, 0.1254902, 1,
2.111217, 0.4927481, 2.956875, 1, 0, 0.1215686, 1,
2.129335, 0.6930044, 0.1042241, 1, 0, 0.1137255, 1,
2.133479, 1.193202, 0.9338955, 1, 0, 0.1098039, 1,
2.142861, 2.341471, 0.8822148, 1, 0, 0.1019608, 1,
2.194547, -0.3049622, 1.352952, 1, 0, 0.09411765, 1,
2.20336, 0.3724726, 0.2903071, 1, 0, 0.09019608, 1,
2.229498, 0.4461892, 2.419775, 1, 0, 0.08235294, 1,
2.24303, 0.6805531, 1.710333, 1, 0, 0.07843138, 1,
2.330793, 1.429006, 2.059606, 1, 0, 0.07058824, 1,
2.373981, 1.341135, 1.83004, 1, 0, 0.06666667, 1,
2.44619, -0.1140111, -0.9503651, 1, 0, 0.05882353, 1,
2.447539, -0.6340524, 1.939579, 1, 0, 0.05490196, 1,
2.448738, -0.4088342, 1.558113, 1, 0, 0.04705882, 1,
2.453656, 1.940138, 2.478363, 1, 0, 0.04313726, 1,
2.493252, -0.8084633, 2.156012, 1, 0, 0.03529412, 1,
2.524577, 1.203807, 0.5023771, 1, 0, 0.03137255, 1,
2.574555, -0.01254264, -0.1366532, 1, 0, 0.02352941, 1,
2.667546, -0.6606749, 0.1920458, 1, 0, 0.01960784, 1,
2.721192, -2.397324, 1.501888, 1, 0, 0.01176471, 1,
3.209664, -0.4783996, 2.209725, 1, 0, 0.007843138, 1
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
-0.2475802, -4.2679, -7.31697, 0, -0.5, 0.5, 0.5,
-0.2475802, -4.2679, -7.31697, 1, -0.5, 0.5, 0.5,
-0.2475802, -4.2679, -7.31697, 1, 1.5, 0.5, 0.5,
-0.2475802, -4.2679, -7.31697, 0, 1.5, 0.5, 0.5
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
-4.876831, -0.1947763, -7.31697, 0, -0.5, 0.5, 0.5,
-4.876831, -0.1947763, -7.31697, 1, -0.5, 0.5, 0.5,
-4.876831, -0.1947763, -7.31697, 1, 1.5, 0.5, 0.5,
-4.876831, -0.1947763, -7.31697, 0, 1.5, 0.5, 0.5
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
-4.876831, -4.2679, -0.2807815, 0, -0.5, 0.5, 0.5,
-4.876831, -4.2679, -0.2807815, 1, -0.5, 0.5, 0.5,
-4.876831, -4.2679, -0.2807815, 1, 1.5, 0.5, 0.5,
-4.876831, -4.2679, -0.2807815, 0, 1.5, 0.5, 0.5
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
-3, -3.327948, -5.693234,
3, -3.327948, -5.693234,
-3, -3.327948, -5.693234,
-3, -3.484607, -5.963857,
-2, -3.327948, -5.693234,
-2, -3.484607, -5.963857,
-1, -3.327948, -5.693234,
-1, -3.484607, -5.963857,
0, -3.327948, -5.693234,
0, -3.484607, -5.963857,
1, -3.327948, -5.693234,
1, -3.484607, -5.963857,
2, -3.327948, -5.693234,
2, -3.484607, -5.963857,
3, -3.327948, -5.693234,
3, -3.484607, -5.963857
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
-3, -3.797924, -6.505102, 0, -0.5, 0.5, 0.5,
-3, -3.797924, -6.505102, 1, -0.5, 0.5, 0.5,
-3, -3.797924, -6.505102, 1, 1.5, 0.5, 0.5,
-3, -3.797924, -6.505102, 0, 1.5, 0.5, 0.5,
-2, -3.797924, -6.505102, 0, -0.5, 0.5, 0.5,
-2, -3.797924, -6.505102, 1, -0.5, 0.5, 0.5,
-2, -3.797924, -6.505102, 1, 1.5, 0.5, 0.5,
-2, -3.797924, -6.505102, 0, 1.5, 0.5, 0.5,
-1, -3.797924, -6.505102, 0, -0.5, 0.5, 0.5,
-1, -3.797924, -6.505102, 1, -0.5, 0.5, 0.5,
-1, -3.797924, -6.505102, 1, 1.5, 0.5, 0.5,
-1, -3.797924, -6.505102, 0, 1.5, 0.5, 0.5,
0, -3.797924, -6.505102, 0, -0.5, 0.5, 0.5,
0, -3.797924, -6.505102, 1, -0.5, 0.5, 0.5,
0, -3.797924, -6.505102, 1, 1.5, 0.5, 0.5,
0, -3.797924, -6.505102, 0, 1.5, 0.5, 0.5,
1, -3.797924, -6.505102, 0, -0.5, 0.5, 0.5,
1, -3.797924, -6.505102, 1, -0.5, 0.5, 0.5,
1, -3.797924, -6.505102, 1, 1.5, 0.5, 0.5,
1, -3.797924, -6.505102, 0, 1.5, 0.5, 0.5,
2, -3.797924, -6.505102, 0, -0.5, 0.5, 0.5,
2, -3.797924, -6.505102, 1, -0.5, 0.5, 0.5,
2, -3.797924, -6.505102, 1, 1.5, 0.5, 0.5,
2, -3.797924, -6.505102, 0, 1.5, 0.5, 0.5,
3, -3.797924, -6.505102, 0, -0.5, 0.5, 0.5,
3, -3.797924, -6.505102, 1, -0.5, 0.5, 0.5,
3, -3.797924, -6.505102, 1, 1.5, 0.5, 0.5,
3, -3.797924, -6.505102, 0, 1.5, 0.5, 0.5
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
-3.808542, -3, -5.693234,
-3.808542, 2, -5.693234,
-3.808542, -3, -5.693234,
-3.98659, -3, -5.963857,
-3.808542, -2, -5.693234,
-3.98659, -2, -5.963857,
-3.808542, -1, -5.693234,
-3.98659, -1, -5.963857,
-3.808542, 0, -5.693234,
-3.98659, 0, -5.963857,
-3.808542, 1, -5.693234,
-3.98659, 1, -5.963857,
-3.808542, 2, -5.693234,
-3.98659, 2, -5.963857
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
-4.342686, -3, -6.505102, 0, -0.5, 0.5, 0.5,
-4.342686, -3, -6.505102, 1, -0.5, 0.5, 0.5,
-4.342686, -3, -6.505102, 1, 1.5, 0.5, 0.5,
-4.342686, -3, -6.505102, 0, 1.5, 0.5, 0.5,
-4.342686, -2, -6.505102, 0, -0.5, 0.5, 0.5,
-4.342686, -2, -6.505102, 1, -0.5, 0.5, 0.5,
-4.342686, -2, -6.505102, 1, 1.5, 0.5, 0.5,
-4.342686, -2, -6.505102, 0, 1.5, 0.5, 0.5,
-4.342686, -1, -6.505102, 0, -0.5, 0.5, 0.5,
-4.342686, -1, -6.505102, 1, -0.5, 0.5, 0.5,
-4.342686, -1, -6.505102, 1, 1.5, 0.5, 0.5,
-4.342686, -1, -6.505102, 0, 1.5, 0.5, 0.5,
-4.342686, 0, -6.505102, 0, -0.5, 0.5, 0.5,
-4.342686, 0, -6.505102, 1, -0.5, 0.5, 0.5,
-4.342686, 0, -6.505102, 1, 1.5, 0.5, 0.5,
-4.342686, 0, -6.505102, 0, 1.5, 0.5, 0.5,
-4.342686, 1, -6.505102, 0, -0.5, 0.5, 0.5,
-4.342686, 1, -6.505102, 1, -0.5, 0.5, 0.5,
-4.342686, 1, -6.505102, 1, 1.5, 0.5, 0.5,
-4.342686, 1, -6.505102, 0, 1.5, 0.5, 0.5,
-4.342686, 2, -6.505102, 0, -0.5, 0.5, 0.5,
-4.342686, 2, -6.505102, 1, -0.5, 0.5, 0.5,
-4.342686, 2, -6.505102, 1, 1.5, 0.5, 0.5,
-4.342686, 2, -6.505102, 0, 1.5, 0.5, 0.5
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
-3.808542, -3.327948, -4,
-3.808542, -3.327948, 4,
-3.808542, -3.327948, -4,
-3.98659, -3.484607, -4,
-3.808542, -3.327948, -2,
-3.98659, -3.484607, -2,
-3.808542, -3.327948, 0,
-3.98659, -3.484607, 0,
-3.808542, -3.327948, 2,
-3.98659, -3.484607, 2,
-3.808542, -3.327948, 4,
-3.98659, -3.484607, 4
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
-4.342686, -3.797924, -4, 0, -0.5, 0.5, 0.5,
-4.342686, -3.797924, -4, 1, -0.5, 0.5, 0.5,
-4.342686, -3.797924, -4, 1, 1.5, 0.5, 0.5,
-4.342686, -3.797924, -4, 0, 1.5, 0.5, 0.5,
-4.342686, -3.797924, -2, 0, -0.5, 0.5, 0.5,
-4.342686, -3.797924, -2, 1, -0.5, 0.5, 0.5,
-4.342686, -3.797924, -2, 1, 1.5, 0.5, 0.5,
-4.342686, -3.797924, -2, 0, 1.5, 0.5, 0.5,
-4.342686, -3.797924, 0, 0, -0.5, 0.5, 0.5,
-4.342686, -3.797924, 0, 1, -0.5, 0.5, 0.5,
-4.342686, -3.797924, 0, 1, 1.5, 0.5, 0.5,
-4.342686, -3.797924, 0, 0, 1.5, 0.5, 0.5,
-4.342686, -3.797924, 2, 0, -0.5, 0.5, 0.5,
-4.342686, -3.797924, 2, 1, -0.5, 0.5, 0.5,
-4.342686, -3.797924, 2, 1, 1.5, 0.5, 0.5,
-4.342686, -3.797924, 2, 0, 1.5, 0.5, 0.5,
-4.342686, -3.797924, 4, 0, -0.5, 0.5, 0.5,
-4.342686, -3.797924, 4, 1, -0.5, 0.5, 0.5,
-4.342686, -3.797924, 4, 1, 1.5, 0.5, 0.5,
-4.342686, -3.797924, 4, 0, 1.5, 0.5, 0.5
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
-3.808542, -3.327948, -5.693234,
-3.808542, 2.938395, -5.693234,
-3.808542, -3.327948, 5.131671,
-3.808542, 2.938395, 5.131671,
-3.808542, -3.327948, -5.693234,
-3.808542, -3.327948, 5.131671,
-3.808542, 2.938395, -5.693234,
-3.808542, 2.938395, 5.131671,
-3.808542, -3.327948, -5.693234,
3.313382, -3.327948, -5.693234,
-3.808542, -3.327948, 5.131671,
3.313382, -3.327948, 5.131671,
-3.808542, 2.938395, -5.693234,
3.313382, 2.938395, -5.693234,
-3.808542, 2.938395, 5.131671,
3.313382, 2.938395, 5.131671,
3.313382, -3.327948, -5.693234,
3.313382, 2.938395, -5.693234,
3.313382, -3.327948, 5.131671,
3.313382, 2.938395, 5.131671,
3.313382, -3.327948, -5.693234,
3.313382, -3.327948, 5.131671,
3.313382, 2.938395, -5.693234,
3.313382, 2.938395, 5.131671
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
var radius = 7.68575;
var distance = 34.19477;
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
mvMatrix.translate( 0.2475802, 0.1947763, 0.2807815 );
mvMatrix.scale( 1.166817, 1.32613, 0.7676725 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.19477);
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
flurtamone<-read.table("flurtamone.xyz")
```

```
## Error in read.table("flurtamone.xyz"): no lines available in input
```

```r
x<-flurtamone$V2
```

```
## Error in eval(expr, envir, enclos): object 'flurtamone' not found
```

```r
y<-flurtamone$V3
```

```
## Error in eval(expr, envir, enclos): object 'flurtamone' not found
```

```r
z<-flurtamone$V4
```

```
## Error in eval(expr, envir, enclos): object 'flurtamone' not found
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
-3.704825, 0.3202857, -3.135109, 0, 0, 1, 1, 1,
-3.119009, -0.3418265, -1.385179, 1, 0, 0, 1, 1,
-2.744926, -0.4751774, -2.594229, 1, 0, 0, 1, 1,
-2.610677, 1.129737, -0.14762, 1, 0, 0, 1, 1,
-2.573711, 0.4738851, -2.874541, 1, 0, 0, 1, 1,
-2.532225, 1.332591, -0.4386635, 1, 0, 0, 1, 1,
-2.518297, 1.543697, 0.3431618, 0, 0, 0, 1, 1,
-2.444095, 1.231293, -1.371506, 0, 0, 0, 1, 1,
-2.439743, 0.835111, -2.884614, 0, 0, 0, 1, 1,
-2.413456, -0.1963621, -0.769205, 0, 0, 0, 1, 1,
-2.410905, -1.215368, -2.050811, 0, 0, 0, 1, 1,
-2.398951, -0.1374929, 0.06549168, 0, 0, 0, 1, 1,
-2.307172, -0.45939, -1.329359, 0, 0, 0, 1, 1,
-2.28543, -0.1990425, -2.562006, 1, 1, 1, 1, 1,
-2.282708, 0.6127668, -0.3761339, 1, 1, 1, 1, 1,
-2.260565, 0.8057764, -1.029026, 1, 1, 1, 1, 1,
-2.259698, 2.827636, -0.6149074, 1, 1, 1, 1, 1,
-2.234722, 1.09394, -2.585465, 1, 1, 1, 1, 1,
-2.224932, 2.151175, -0.5201901, 1, 1, 1, 1, 1,
-2.21114, -0.3417162, -1.958485, 1, 1, 1, 1, 1,
-2.14465, 0.8086662, -2.029592, 1, 1, 1, 1, 1,
-2.051715, 1.977529, 0.2056649, 1, 1, 1, 1, 1,
-2.049284, -0.01349362, -0.5336385, 1, 1, 1, 1, 1,
-1.996782, -0.8347871, -2.235973, 1, 1, 1, 1, 1,
-1.982605, -0.3954645, 0.03573085, 1, 1, 1, 1, 1,
-1.977324, 0.3240129, -3.350426, 1, 1, 1, 1, 1,
-1.95096, -0.312334, -0.4839433, 1, 1, 1, 1, 1,
-1.937737, 1.004277, -1.05682, 1, 1, 1, 1, 1,
-1.934489, -0.54813, -1.860387, 0, 0, 1, 1, 1,
-1.933667, -0.5892268, -1.494798, 1, 0, 0, 1, 1,
-1.921456, -1.152865, -3.185057, 1, 0, 0, 1, 1,
-1.910086, -0.4920236, -0.5925111, 1, 0, 0, 1, 1,
-1.905357, -2.484952, -2.996841, 1, 0, 0, 1, 1,
-1.904518, -0.2661715, -1.436174, 1, 0, 0, 1, 1,
-1.888173, -0.5415095, -0.9883554, 0, 0, 0, 1, 1,
-1.885335, -0.4635152, -1.54204, 0, 0, 0, 1, 1,
-1.866092, -1.756963, -2.101134, 0, 0, 0, 1, 1,
-1.863835, 0.03253658, -3.07023, 0, 0, 0, 1, 1,
-1.851945, 0.5596244, -1.640613, 0, 0, 0, 1, 1,
-1.850251, -0.17516, -2.911464, 0, 0, 0, 1, 1,
-1.846251, -1.031231, -0.7305911, 0, 0, 0, 1, 1,
-1.841918, 1.031579, -2.222192, 1, 1, 1, 1, 1,
-1.806049, 0.3786994, -0.609363, 1, 1, 1, 1, 1,
-1.805121, 0.6980129, -1.121046, 1, 1, 1, 1, 1,
-1.791715, -0.08556389, -1.569831, 1, 1, 1, 1, 1,
-1.780833, -1.095857, -1.165513, 1, 1, 1, 1, 1,
-1.776859, -1.26605, -2.24118, 1, 1, 1, 1, 1,
-1.748672, -0.513221, -2.417504, 1, 1, 1, 1, 1,
-1.745795, 1.924843, -0.3003252, 1, 1, 1, 1, 1,
-1.738576, 1.889571, -0.5325153, 1, 1, 1, 1, 1,
-1.724262, -0.7757443, -3.756946, 1, 1, 1, 1, 1,
-1.717835, 0.1953959, -1.875068, 1, 1, 1, 1, 1,
-1.716494, 0.2785848, -1.499289, 1, 1, 1, 1, 1,
-1.66733, -0.4870321, 0.03586147, 1, 1, 1, 1, 1,
-1.649485, 0.1390048, -1.475471, 1, 1, 1, 1, 1,
-1.641599, 0.1397424, -1.199437, 1, 1, 1, 1, 1,
-1.638521, -0.9601005, -3.390177, 0, 0, 1, 1, 1,
-1.630617, -0.3670476, -1.726151, 1, 0, 0, 1, 1,
-1.626041, 1.078217, -1.643968, 1, 0, 0, 1, 1,
-1.617837, 2.647295, -0.6017644, 1, 0, 0, 1, 1,
-1.606794, -0.3646521, -2.008713, 1, 0, 0, 1, 1,
-1.602891, -0.8614407, -1.014486, 1, 0, 0, 1, 1,
-1.601272, 1.040166, -1.386847, 0, 0, 0, 1, 1,
-1.595841, 0.2718315, -2.219275, 0, 0, 0, 1, 1,
-1.586295, 0.1553052, -0.7830889, 0, 0, 0, 1, 1,
-1.584595, 0.915641, -1.221223, 0, 0, 0, 1, 1,
-1.581848, -0.5847421, -1.84191, 0, 0, 0, 1, 1,
-1.561384, 1.229237, -0.8856927, 0, 0, 0, 1, 1,
-1.555851, -1.386924, -2.167521, 0, 0, 0, 1, 1,
-1.543005, 0.8361469, -1.444696, 1, 1, 1, 1, 1,
-1.533197, 1.38462, -0.1726309, 1, 1, 1, 1, 1,
-1.515563, -1.433389, -2.104842, 1, 1, 1, 1, 1,
-1.511557, -0.3906664, -3.282088, 1, 1, 1, 1, 1,
-1.510429, -1.797776, -3.574883, 1, 1, 1, 1, 1,
-1.49555, -0.225714, -2.166087, 1, 1, 1, 1, 1,
-1.478651, 0.04358824, -1.918886, 1, 1, 1, 1, 1,
-1.462591, 1.093727, -0.2372824, 1, 1, 1, 1, 1,
-1.461971, 0.1805306, -0.6495726, 1, 1, 1, 1, 1,
-1.460209, 1.162962, -0.9148819, 1, 1, 1, 1, 1,
-1.459555, 1.079207, -0.5517418, 1, 1, 1, 1, 1,
-1.453566, -0.3647427, -2.018273, 1, 1, 1, 1, 1,
-1.430254, 0.08258957, -1.84943, 1, 1, 1, 1, 1,
-1.427783, -0.8309851, -2.654307, 1, 1, 1, 1, 1,
-1.414048, 0.8223857, -0.6846984, 1, 1, 1, 1, 1,
-1.38509, -0.9948534, -2.716822, 0, 0, 1, 1, 1,
-1.383402, 0.4147129, 0.7123637, 1, 0, 0, 1, 1,
-1.379354, 0.1608673, -2.40521, 1, 0, 0, 1, 1,
-1.365889, -1.179158, -0.9983158, 1, 0, 0, 1, 1,
-1.359692, 0.06107648, -4.052466, 1, 0, 0, 1, 1,
-1.355808, -1.559106, -2.660469, 1, 0, 0, 1, 1,
-1.351577, 0.3465812, -1.932303, 0, 0, 0, 1, 1,
-1.350621, 0.3987615, -1.854548, 0, 0, 0, 1, 1,
-1.347935, -0.7850292, -2.925437, 0, 0, 0, 1, 1,
-1.347402, -1.050392, -3.35466, 0, 0, 0, 1, 1,
-1.341577, 0.3315867, -2.216464, 0, 0, 0, 1, 1,
-1.334401, -1.951158, -2.583951, 0, 0, 0, 1, 1,
-1.319538, 0.5305293, -1.796548, 0, 0, 0, 1, 1,
-1.310247, -0.3712955, -1.484092, 1, 1, 1, 1, 1,
-1.309891, -1.499488, -1.417975, 1, 1, 1, 1, 1,
-1.309834, -0.7904847, -2.402794, 1, 1, 1, 1, 1,
-1.292588, -1.806221, -1.286814, 1, 1, 1, 1, 1,
-1.281168, 0.03050858, -1.510131, 1, 1, 1, 1, 1,
-1.268004, 0.5570166, -0.6371669, 1, 1, 1, 1, 1,
-1.266329, 0.6908844, -3.751287, 1, 1, 1, 1, 1,
-1.262311, 1.103681, -0.1613451, 1, 1, 1, 1, 1,
-1.256132, -0.006094856, -2.626717, 1, 1, 1, 1, 1,
-1.249498, 0.9068905, -0.7457466, 1, 1, 1, 1, 1,
-1.23525, -0.5634032, -2.138347, 1, 1, 1, 1, 1,
-1.232678, 0.2086926, -2.439967, 1, 1, 1, 1, 1,
-1.231709, 0.4442697, -1.10125, 1, 1, 1, 1, 1,
-1.230405, -1.171452, -2.184332, 1, 1, 1, 1, 1,
-1.229687, -0.7606351, -1.388865, 1, 1, 1, 1, 1,
-1.225472, 0.1789237, -1.997463, 0, 0, 1, 1, 1,
-1.223874, 2.032952, -1.039018, 1, 0, 0, 1, 1,
-1.223321, -0.7886766, -0.9986786, 1, 0, 0, 1, 1,
-1.217355, -1.414335, -2.834786, 1, 0, 0, 1, 1,
-1.21659, -0.1385626, -2.348159, 1, 0, 0, 1, 1,
-1.205451, 0.6360175, -1.166559, 1, 0, 0, 1, 1,
-1.205151, 0.7321827, -1.380758, 0, 0, 0, 1, 1,
-1.200789, -0.9081508, -4.119241, 0, 0, 0, 1, 1,
-1.191999, 1.003724, -0.9817823, 0, 0, 0, 1, 1,
-1.184329, 1.510637, 0.6703566, 0, 0, 0, 1, 1,
-1.183856, -2.446098, -2.764155, 0, 0, 0, 1, 1,
-1.180735, -0.2114219, 0.566623, 0, 0, 0, 1, 1,
-1.176527, -0.4626055, -2.432465, 0, 0, 0, 1, 1,
-1.174861, -0.7511565, -2.208935, 1, 1, 1, 1, 1,
-1.165364, 0.6747754, -1.419031, 1, 1, 1, 1, 1,
-1.161482, 1.409525, -0.6798375, 1, 1, 1, 1, 1,
-1.150136, -0.4638997, -2.236544, 1, 1, 1, 1, 1,
-1.137597, 1.051747, 0.3178136, 1, 1, 1, 1, 1,
-1.13759, -1.053335, -1.066903, 1, 1, 1, 1, 1,
-1.135328, -1.221232, -1.874144, 1, 1, 1, 1, 1,
-1.129131, 0.9157234, 0.06342608, 1, 1, 1, 1, 1,
-1.126698, -0.4935623, 0.6445147, 1, 1, 1, 1, 1,
-1.125189, -0.1954153, -0.7615372, 1, 1, 1, 1, 1,
-1.117355, 0.09536018, -2.481853, 1, 1, 1, 1, 1,
-1.115963, 0.1265929, -1.236668, 1, 1, 1, 1, 1,
-1.11459, -1.242585, -3.967489, 1, 1, 1, 1, 1,
-1.103625, -0.4520889, -1.621035, 1, 1, 1, 1, 1,
-1.101833, -0.02081787, -2.084694, 1, 1, 1, 1, 1,
-1.09499, 0.1700447, -2.123625, 0, 0, 1, 1, 1,
-1.090484, 0.1841177, -1.246803, 1, 0, 0, 1, 1,
-1.088018, 0.4773491, -2.220209, 1, 0, 0, 1, 1,
-1.087886, -0.1944106, -3.114177, 1, 0, 0, 1, 1,
-1.086825, 1.08715, 0.6770079, 1, 0, 0, 1, 1,
-1.078693, 1.11184, -1.242606, 1, 0, 0, 1, 1,
-1.072041, 0.3105478, 0.6624098, 0, 0, 0, 1, 1,
-1.068407, 0.3295704, 0.6475453, 0, 0, 0, 1, 1,
-1.059014, 1.206211, 0.4196833, 0, 0, 0, 1, 1,
-1.053768, 0.4806884, -0.3446459, 0, 0, 0, 1, 1,
-1.051598, 1.168873, -1.65518, 0, 0, 0, 1, 1,
-1.047592, 0.2124545, -1.70931, 0, 0, 0, 1, 1,
-1.047178, -0.5022909, -3.469072, 0, 0, 0, 1, 1,
-1.040564, 1.495935, -0.7277712, 1, 1, 1, 1, 1,
-1.038944, -0.3670395, -2.446975, 1, 1, 1, 1, 1,
-1.038029, -0.6145784, -2.713136, 1, 1, 1, 1, 1,
-1.03322, -0.4558272, -2.053176, 1, 1, 1, 1, 1,
-1.023497, 1.987511, 0.7139884, 1, 1, 1, 1, 1,
-1.023304, 0.2373457, -1.710023, 1, 1, 1, 1, 1,
-1.01575, -0.9532921, -2.088091, 1, 1, 1, 1, 1,
-1.010735, 0.9598645, -1.084154, 1, 1, 1, 1, 1,
-1.009212, 0.11247, -0.009071562, 1, 1, 1, 1, 1,
-1.006999, -0.8611991, -2.351856, 1, 1, 1, 1, 1,
-0.9936379, 2.114364, 0.6655887, 1, 1, 1, 1, 1,
-0.9923045, 1.507784, -0.4446575, 1, 1, 1, 1, 1,
-0.9832743, 0.3404464, -2.851397, 1, 1, 1, 1, 1,
-0.9813828, -0.2888143, -2.62459, 1, 1, 1, 1, 1,
-0.9592816, 0.2111835, -0.9018788, 1, 1, 1, 1, 1,
-0.9555092, 1.909094, 0.8045673, 0, 0, 1, 1, 1,
-0.9536512, -0.09854479, -2.932515, 1, 0, 0, 1, 1,
-0.9499139, -0.2933454, -2.039828, 1, 0, 0, 1, 1,
-0.9443654, 0.9390012, -0.2506958, 1, 0, 0, 1, 1,
-0.9384168, -0.283006, -2.685325, 1, 0, 0, 1, 1,
-0.931852, -0.3226701, -1.650116, 1, 0, 0, 1, 1,
-0.9316906, -0.3054811, -3.136014, 0, 0, 0, 1, 1,
-0.9231904, -1.249561, -3.738256, 0, 0, 0, 1, 1,
-0.922054, 1.198688, 0.3619295, 0, 0, 0, 1, 1,
-0.9182636, -0.140323, -0.2658174, 0, 0, 0, 1, 1,
-0.9177341, 1.803266, -0.671535, 0, 0, 0, 1, 1,
-0.9009895, -1.153658, -2.20042, 0, 0, 0, 1, 1,
-0.9002121, 0.237866, -0.7122326, 0, 0, 0, 1, 1,
-0.8978936, -0.4072897, 0.2741517, 1, 1, 1, 1, 1,
-0.8892608, 0.7482691, 0.03886945, 1, 1, 1, 1, 1,
-0.8652472, -0.9758908, -4.341219, 1, 1, 1, 1, 1,
-0.8651996, -1.498428, -2.960174, 1, 1, 1, 1, 1,
-0.8644369, 0.2943273, -2.018566, 1, 1, 1, 1, 1,
-0.8634824, 0.5347195, -0.3961988, 1, 1, 1, 1, 1,
-0.8465992, -2.073945, -2.984662, 1, 1, 1, 1, 1,
-0.8465282, 0.7210441, 0.436654, 1, 1, 1, 1, 1,
-0.8430906, -1.444432, -0.4993158, 1, 1, 1, 1, 1,
-0.8386383, 0.4869477, -1.160695, 1, 1, 1, 1, 1,
-0.8385847, -1.101578, -2.625834, 1, 1, 1, 1, 1,
-0.8384494, 0.2602193, -0.8834728, 1, 1, 1, 1, 1,
-0.8380463, -0.1198423, -1.965642, 1, 1, 1, 1, 1,
-0.8369211, 0.7589946, -1.282163, 1, 1, 1, 1, 1,
-0.8315518, 2.056409, -0.2257549, 1, 1, 1, 1, 1,
-0.8301072, -0.4321398, -1.820329, 0, 0, 1, 1, 1,
-0.82208, -0.04121819, -3.252128, 1, 0, 0, 1, 1,
-0.8144858, -1.037027, -2.738565, 1, 0, 0, 1, 1,
-0.8076691, 1.651767, -0.7385964, 1, 0, 0, 1, 1,
-0.8037463, -1.901766, -1.66108, 1, 0, 0, 1, 1,
-0.8023938, 0.1048011, -0.5544767, 1, 0, 0, 1, 1,
-0.7968349, 1.919584, 1.123743, 0, 0, 0, 1, 1,
-0.7965366, -0.2097394, -3.139115, 0, 0, 0, 1, 1,
-0.7860475, 0.4643058, -2.395957, 0, 0, 0, 1, 1,
-0.7814333, -0.7856962, -3.200573, 0, 0, 0, 1, 1,
-0.7800047, 0.3983877, -2.069377, 0, 0, 0, 1, 1,
-0.7780325, -1.494936, -3.096781, 0, 0, 0, 1, 1,
-0.7770715, -0.4304207, -1.319174, 0, 0, 0, 1, 1,
-0.770581, 2.540085, 0.08685266, 1, 1, 1, 1, 1,
-0.7686723, 0.513467, -0.6973013, 1, 1, 1, 1, 1,
-0.7637636, -1.108911, -3.038317, 1, 1, 1, 1, 1,
-0.7636756, 1.149453, -0.47197, 1, 1, 1, 1, 1,
-0.7618714, 0.009630248, -2.551404, 1, 1, 1, 1, 1,
-0.7536882, -1.09554, -2.671073, 1, 1, 1, 1, 1,
-0.7535173, -0.2591189, -2.382193, 1, 1, 1, 1, 1,
-0.7508708, 0.22473, -1.349984, 1, 1, 1, 1, 1,
-0.740624, -1.165333, -1.670246, 1, 1, 1, 1, 1,
-0.7395363, -0.5002692, -0.1861566, 1, 1, 1, 1, 1,
-0.7340046, 0.01520357, -2.282049, 1, 1, 1, 1, 1,
-0.7287771, 0.3253855, -1.893516, 1, 1, 1, 1, 1,
-0.7171525, -0.2645375, -2.759027, 1, 1, 1, 1, 1,
-0.7157876, 0.774269, 0.7397423, 1, 1, 1, 1, 1,
-0.7108431, 0.841904, -0.8321933, 1, 1, 1, 1, 1,
-0.7085633, 0.7719888, 0.05333951, 0, 0, 1, 1, 1,
-0.6992427, -2.616175, -1.440946, 1, 0, 0, 1, 1,
-0.6935918, -2.018514, -2.643764, 1, 0, 0, 1, 1,
-0.6935056, -1.209845, -2.80525, 1, 0, 0, 1, 1,
-0.6921336, 1.559061, -1.230846, 1, 0, 0, 1, 1,
-0.6842776, 1.034429, 0.04423663, 1, 0, 0, 1, 1,
-0.6829645, 0.9251842, -0.07974902, 0, 0, 0, 1, 1,
-0.6825516, -1.274652, -2.663002, 0, 0, 0, 1, 1,
-0.6807464, 0.4942413, -2.205507, 0, 0, 0, 1, 1,
-0.6712589, 0.4582622, 0.2767507, 0, 0, 0, 1, 1,
-0.6688651, -2.806956, -4.451813, 0, 0, 0, 1, 1,
-0.6682756, 0.3521736, -2.131861, 0, 0, 0, 1, 1,
-0.6625013, -0.2390103, 0.3946192, 0, 0, 0, 1, 1,
-0.6586578, -0.2665283, -0.2047263, 1, 1, 1, 1, 1,
-0.6568229, -1.750667, -1.900707, 1, 1, 1, 1, 1,
-0.6551952, 0.8305454, -0.8265526, 1, 1, 1, 1, 1,
-0.6542711, 0.3563212, -2.023135, 1, 1, 1, 1, 1,
-0.653578, -1.364508, -2.653327, 1, 1, 1, 1, 1,
-0.6524022, 1.093461, -1.396137, 1, 1, 1, 1, 1,
-0.6492921, 0.4578478, -0.5053188, 1, 1, 1, 1, 1,
-0.6481649, -1.425808, -2.511322, 1, 1, 1, 1, 1,
-0.6443415, 1.848601, 0.1733969, 1, 1, 1, 1, 1,
-0.644186, 0.8026494, -0.4134112, 1, 1, 1, 1, 1,
-0.6431757, -0.09217423, -1.075732, 1, 1, 1, 1, 1,
-0.6359299, -0.715712, -1.572809, 1, 1, 1, 1, 1,
-0.6282609, 0.2736131, -1.718764, 1, 1, 1, 1, 1,
-0.6237839, 1.459274, -0.275038, 1, 1, 1, 1, 1,
-0.6206765, -0.1667762, -3.179517, 1, 1, 1, 1, 1,
-0.6107811, 2.546016, 0.4165427, 0, 0, 1, 1, 1,
-0.6105325, 0.2020063, -0.8780705, 1, 0, 0, 1, 1,
-0.6104565, -0.3196919, -2.062398, 1, 0, 0, 1, 1,
-0.6060525, -2.346215, -3.192845, 1, 0, 0, 1, 1,
-0.6019637, -0.2035361, -2.323946, 1, 0, 0, 1, 1,
-0.6016843, -1.697706, -3.41493, 1, 0, 0, 1, 1,
-0.5976585, -0.5821352, -2.68153, 0, 0, 0, 1, 1,
-0.589855, -0.3770642, -2.212807, 0, 0, 0, 1, 1,
-0.5877922, 1.089894, 0.0529226, 0, 0, 0, 1, 1,
-0.5858729, -0.205777, -2.128334, 0, 0, 0, 1, 1,
-0.5839142, 0.9020873, -2.645543, 0, 0, 0, 1, 1,
-0.5810567, -1.023359, -2.191437, 0, 0, 0, 1, 1,
-0.579786, -0.3994865, -1.549081, 0, 0, 0, 1, 1,
-0.5793096, -2.1061, -4.298571, 1, 1, 1, 1, 1,
-0.5756825, -1.447685, -2.096059, 1, 1, 1, 1, 1,
-0.5724825, 0.6607174, -0.8163507, 1, 1, 1, 1, 1,
-0.5673012, -0.3072549, 0.2813223, 1, 1, 1, 1, 1,
-0.5633447, -1.34443, -3.558524, 1, 1, 1, 1, 1,
-0.5589396, 0.2434849, 0.6222148, 1, 1, 1, 1, 1,
-0.5539162, 0.9029365, -0.03992467, 1, 1, 1, 1, 1,
-0.5537102, 0.1122371, -0.581981, 1, 1, 1, 1, 1,
-0.5524915, 1.523723, -0.126818, 1, 1, 1, 1, 1,
-0.5490595, -0.140525, -1.582249, 1, 1, 1, 1, 1,
-0.545153, 1.092662, -3.522108, 1, 1, 1, 1, 1,
-0.542663, -1.120453, -1.724701, 1, 1, 1, 1, 1,
-0.5402532, 0.7871497, -0.2052567, 1, 1, 1, 1, 1,
-0.5385324, -0.467302, -3.394051, 1, 1, 1, 1, 1,
-0.5358235, 1.034672, 0.7939155, 1, 1, 1, 1, 1,
-0.5339812, 1.1489, -1.328076, 0, 0, 1, 1, 1,
-0.5335295, 0.6054437, -0.6501046, 1, 0, 0, 1, 1,
-0.5257151, -1.019908, -1.116233, 1, 0, 0, 1, 1,
-0.5232234, 2.633182, -0.410954, 1, 0, 0, 1, 1,
-0.5150501, 1.378835, -1.025421, 1, 0, 0, 1, 1,
-0.5132976, 0.3179196, -0.7073538, 1, 0, 0, 1, 1,
-0.5124617, 0.6604207, 0.585892, 0, 0, 0, 1, 1,
-0.5095314, -0.7595587, -3.487833, 0, 0, 0, 1, 1,
-0.5081248, -0.9518801, -3.508521, 0, 0, 0, 1, 1,
-0.508115, 0.9787523, -0.3099475, 0, 0, 0, 1, 1,
-0.5041476, -0.3279209, -2.115446, 0, 0, 0, 1, 1,
-0.5030661, 1.102074, -0.8204816, 0, 0, 0, 1, 1,
-0.495194, 0.8962178, 0.2689579, 0, 0, 0, 1, 1,
-0.4941792, 0.8103251, -0.5807075, 1, 1, 1, 1, 1,
-0.4926108, 0.4312125, -0.7620661, 1, 1, 1, 1, 1,
-0.4907, 0.5743296, -0.6793647, 1, 1, 1, 1, 1,
-0.4891154, -0.7652361, -4.123321, 1, 1, 1, 1, 1,
-0.4872837, -1.550489, -2.431165, 1, 1, 1, 1, 1,
-0.4806151, 1.690553, 0.9527352, 1, 1, 1, 1, 1,
-0.4737454, -2.369849, -3.892476, 1, 1, 1, 1, 1,
-0.473247, -0.6602378, -2.316746, 1, 1, 1, 1, 1,
-0.4676436, 0.2195356, -1.397265, 1, 1, 1, 1, 1,
-0.4654608, 0.6690907, -0.0838203, 1, 1, 1, 1, 1,
-0.4607287, 1.19706, -0.2482004, 1, 1, 1, 1, 1,
-0.4603468, 0.7606908, -0.8845064, 1, 1, 1, 1, 1,
-0.4580165, -0.4209631, -0.5164675, 1, 1, 1, 1, 1,
-0.4455422, 0.83746, 1.758701, 1, 1, 1, 1, 1,
-0.4448738, -0.2171305, -1.529735, 1, 1, 1, 1, 1,
-0.4419726, 0.6746306, -0.1800045, 0, 0, 1, 1, 1,
-0.4402095, 0.2579367, -1.590146, 1, 0, 0, 1, 1,
-0.4357508, -1.52046, -3.23199, 1, 0, 0, 1, 1,
-0.4338484, 0.4151492, -2.161092, 1, 0, 0, 1, 1,
-0.4332373, -0.7048309, -2.903704, 1, 0, 0, 1, 1,
-0.4330411, -0.6722851, -2.55548, 1, 0, 0, 1, 1,
-0.4290197, 2.042542, 0.9279197, 0, 0, 0, 1, 1,
-0.4233878, 2.117493, 0.5235533, 0, 0, 0, 1, 1,
-0.4222566, 1.750074, 2.013517, 0, 0, 0, 1, 1,
-0.4219488, -1.031545, -3.549028, 0, 0, 0, 1, 1,
-0.4193394, -0.4685367, -3.702013, 0, 0, 0, 1, 1,
-0.4158964, -0.3125645, -3.274939, 0, 0, 0, 1, 1,
-0.4135887, -0.3283258, -1.84953, 0, 0, 0, 1, 1,
-0.4133664, 1.025117, 1.136243, 1, 1, 1, 1, 1,
-0.4107407, -0.7722213, -1.891042, 1, 1, 1, 1, 1,
-0.4094087, 1.632824, 0.1949809, 1, 1, 1, 1, 1,
-0.4068455, -0.6660979, -3.372138, 1, 1, 1, 1, 1,
-0.4031311, -0.2393302, -2.053671, 1, 1, 1, 1, 1,
-0.4015618, -0.1954403, -1.044013, 1, 1, 1, 1, 1,
-0.3984108, -0.6430004, -2.173409, 1, 1, 1, 1, 1,
-0.3971701, 0.3612798, -0.4942995, 1, 1, 1, 1, 1,
-0.3937021, 1.215256, -1.287518, 1, 1, 1, 1, 1,
-0.391326, -0.445136, -2.663853, 1, 1, 1, 1, 1,
-0.383241, 0.810583, -1.471379, 1, 1, 1, 1, 1,
-0.3815983, 0.573553, -1.140028, 1, 1, 1, 1, 1,
-0.380987, 0.649978, 0.5382189, 1, 1, 1, 1, 1,
-0.3796193, -0.3973543, -1.906042, 1, 1, 1, 1, 1,
-0.3759027, -0.7253084, -1.733769, 1, 1, 1, 1, 1,
-0.3708797, -0.4240784, -1.66089, 0, 0, 1, 1, 1,
-0.3660785, -1.982193, -2.576562, 1, 0, 0, 1, 1,
-0.3639081, 0.3610276, -0.03931187, 1, 0, 0, 1, 1,
-0.3600807, -0.456919, -2.222786, 1, 0, 0, 1, 1,
-0.3588953, -1.104689, -3.855122, 1, 0, 0, 1, 1,
-0.3577207, -0.9257952, -3.200691, 1, 0, 0, 1, 1,
-0.3459073, -0.2827739, -0.8186671, 0, 0, 0, 1, 1,
-0.3456085, -1.266301, -3.277385, 0, 0, 0, 1, 1,
-0.342342, -0.5212832, -2.200556, 0, 0, 0, 1, 1,
-0.3371857, -0.7771057, -1.235976, 0, 0, 0, 1, 1,
-0.3320678, 1.076623, -1.181632, 0, 0, 0, 1, 1,
-0.3290089, -0.9446789, -1.604421, 0, 0, 0, 1, 1,
-0.3210295, -0.1318106, -0.2591341, 0, 0, 0, 1, 1,
-0.3204064, 0.3496787, 0.3229558, 1, 1, 1, 1, 1,
-0.3155084, -0.5970498, -1.42722, 1, 1, 1, 1, 1,
-0.3147026, -0.5969114, -2.410795, 1, 1, 1, 1, 1,
-0.3142493, 0.1874724, -0.1752692, 1, 1, 1, 1, 1,
-0.3116732, -0.3123247, -2.424494, 1, 1, 1, 1, 1,
-0.3096083, 2.205726, 2.141096, 1, 1, 1, 1, 1,
-0.3094918, 0.0188174, -2.86275, 1, 1, 1, 1, 1,
-0.3088171, -1.082285, -3.771402, 1, 1, 1, 1, 1,
-0.3009308, 0.739647, -0.9670552, 1, 1, 1, 1, 1,
-0.2956342, -1.061197, -2.28213, 1, 1, 1, 1, 1,
-0.2941691, -1.940824, -2.946793, 1, 1, 1, 1, 1,
-0.2922995, 1.749264, -0.9934263, 1, 1, 1, 1, 1,
-0.2803825, -0.4636597, -2.710982, 1, 1, 1, 1, 1,
-0.2802379, -2.386652, -3.002201, 1, 1, 1, 1, 1,
-0.2763891, -0.6565645, -4.803469, 1, 1, 1, 1, 1,
-0.2760302, 0.4110136, 0.1899358, 0, 0, 1, 1, 1,
-0.2750767, 1.360994, 0.3967007, 1, 0, 0, 1, 1,
-0.2736042, 0.02966, -1.541562, 1, 0, 0, 1, 1,
-0.2715298, 0.4269596, -0.7055683, 1, 0, 0, 1, 1,
-0.2701972, 1.593255, -0.1523366, 1, 0, 0, 1, 1,
-0.2672213, 1.229615, -0.6200595, 1, 0, 0, 1, 1,
-0.2644548, -0.1163161, -0.2280353, 0, 0, 0, 1, 1,
-0.2617986, 1.428228, -0.9983191, 0, 0, 0, 1, 1,
-0.2437384, -0.02464558, 1.38593, 0, 0, 0, 1, 1,
-0.2422445, -0.1663769, -1.3699, 0, 0, 0, 1, 1,
-0.2400685, 0.8053244, 0.402123, 0, 0, 0, 1, 1,
-0.2391959, -0.5429634, -2.446147, 0, 0, 0, 1, 1,
-0.2378898, -0.2042018, 0.003844411, 0, 0, 0, 1, 1,
-0.2342197, -0.5121363, -3.080361, 1, 1, 1, 1, 1,
-0.2287412, 1.261273, -0.5670888, 1, 1, 1, 1, 1,
-0.2247562, -0.312311, -1.340608, 1, 1, 1, 1, 1,
-0.2242478, -0.3046541, -3.304823, 1, 1, 1, 1, 1,
-0.2223767, 1.005986, 1.446106, 1, 1, 1, 1, 1,
-0.2216686, 0.2339457, 1.086102, 1, 1, 1, 1, 1,
-0.2180115, 0.356326, -1.859197, 1, 1, 1, 1, 1,
-0.2157671, 1.4162, 0.6808887, 1, 1, 1, 1, 1,
-0.214281, 0.2362431, -0.9942415, 1, 1, 1, 1, 1,
-0.2110884, -0.541832, -3.112349, 1, 1, 1, 1, 1,
-0.2064745, 0.8525012, -1.730621, 1, 1, 1, 1, 1,
-0.2026984, 0.3579006, -1.061013, 1, 1, 1, 1, 1,
-0.2012144, 0.4529186, -0.7438906, 1, 1, 1, 1, 1,
-0.1998553, 0.4414944, -1.168185, 1, 1, 1, 1, 1,
-0.1883039, 0.9555928, -0.6924314, 1, 1, 1, 1, 1,
-0.1854843, -2.516202, -3.706911, 0, 0, 1, 1, 1,
-0.1842607, 0.4632656, 1.192941, 1, 0, 0, 1, 1,
-0.1785041, -0.9169171, -3.541324, 1, 0, 0, 1, 1,
-0.1767908, 0.5274969, -0.928169, 1, 0, 0, 1, 1,
-0.1745033, 0.3574609, -0.03861083, 1, 0, 0, 1, 1,
-0.1741945, 0.3086176, -0.2303672, 1, 0, 0, 1, 1,
-0.1707059, 0.214395, 0.9088905, 0, 0, 0, 1, 1,
-0.1687352, -0.519393, -3.442377, 0, 0, 0, 1, 1,
-0.1684052, -1.064419, -5.53559, 0, 0, 0, 1, 1,
-0.1682798, 0.5990853, -0.1387491, 0, 0, 0, 1, 1,
-0.1675279, -0.04563845, -1.694728, 0, 0, 0, 1, 1,
-0.1618525, -0.01745985, -1.609545, 0, 0, 0, 1, 1,
-0.1573371, -0.5275027, -3.298478, 0, 0, 0, 1, 1,
-0.1547745, -0.6997871, -3.386755, 1, 1, 1, 1, 1,
-0.1504386, -1.545137, -3.520313, 1, 1, 1, 1, 1,
-0.145223, -0.3557083, -3.277742, 1, 1, 1, 1, 1,
-0.1421795, -2.956252, -2.426961, 1, 1, 1, 1, 1,
-0.1418583, 0.6280028, 0.7126599, 1, 1, 1, 1, 1,
-0.1368592, 0.7540239, 0.07458465, 1, 1, 1, 1, 1,
-0.1337085, 0.5737095, -0.6710246, 1, 1, 1, 1, 1,
-0.1294815, 1.022707, -2.140594, 1, 1, 1, 1, 1,
-0.1293416, -0.001509868, -0.7097408, 1, 1, 1, 1, 1,
-0.1272051, 0.04695703, -0.2431036, 1, 1, 1, 1, 1,
-0.1185863, -2.43964, -3.155557, 1, 1, 1, 1, 1,
-0.1180294, 1.480041, -0.1285731, 1, 1, 1, 1, 1,
-0.1124078, -0.7700387, -3.041192, 1, 1, 1, 1, 1,
-0.1107014, -1.209631, -2.243013, 1, 1, 1, 1, 1,
-0.1096916, 0.6580409, -0.1639297, 1, 1, 1, 1, 1,
-0.1056089, -1.077584, -4.544999, 0, 0, 1, 1, 1,
-0.1050946, -1.845001, -2.857871, 1, 0, 0, 1, 1,
-0.1019524, 0.3127384, 0.5431889, 1, 0, 0, 1, 1,
-0.1009952, -1.776307, -3.887307, 1, 0, 0, 1, 1,
-0.09927084, 1.120412, 1.063008, 1, 0, 0, 1, 1,
-0.09447436, -0.5129259, -2.468563, 1, 0, 0, 1, 1,
-0.08521571, 0.2895377, 0.2055515, 0, 0, 0, 1, 1,
-0.07859413, -0.4582079, -3.098, 0, 0, 0, 1, 1,
-0.07649895, -0.297005, -2.270687, 0, 0, 0, 1, 1,
-0.07413708, -1.261051, -4.936691, 0, 0, 0, 1, 1,
-0.07375995, -0.9731807, -2.729295, 0, 0, 0, 1, 1,
-0.07362781, -0.5932351, -3.749449, 0, 0, 0, 1, 1,
-0.07302801, -1.235475, -4.300802, 0, 0, 0, 1, 1,
-0.06567806, -2.03519, -2.328069, 1, 1, 1, 1, 1,
-0.05753497, -1.489191, -2.692014, 1, 1, 1, 1, 1,
-0.05645895, 1.269772, 1.386366, 1, 1, 1, 1, 1,
-0.04817536, 1.046592, -0.6696201, 1, 1, 1, 1, 1,
-0.04654823, -0.220482, -1.535441, 1, 1, 1, 1, 1,
-0.04254307, 0.7949873, 0.8051492, 1, 1, 1, 1, 1,
-0.04240493, 0.2199479, -0.3542133, 1, 1, 1, 1, 1,
-0.04123697, 0.1475713, -0.1405606, 1, 1, 1, 1, 1,
-0.03962564, 2.290961, -1.980045, 1, 1, 1, 1, 1,
-0.03876645, -0.4627239, -3.038302, 1, 1, 1, 1, 1,
-0.03859524, 1.506331, -0.9381595, 1, 1, 1, 1, 1,
-0.03543535, -0.8515999, -3.740759, 1, 1, 1, 1, 1,
-0.03540233, 0.4529866, 0.9824381, 1, 1, 1, 1, 1,
-0.02947918, 1.830105, 0.9837617, 1, 1, 1, 1, 1,
-0.02653176, -0.7014792, -3.058029, 1, 1, 1, 1, 1,
-0.02415758, -0.7831912, -2.780611, 0, 0, 1, 1, 1,
-0.01743952, 1.092564, -0.5240327, 1, 0, 0, 1, 1,
-0.01670042, 0.4468622, 0.3233585, 1, 0, 0, 1, 1,
-0.008455452, -0.3472547, -4.050512, 1, 0, 0, 1, 1,
-0.005039196, 0.4950166, -0.8734496, 1, 0, 0, 1, 1,
-0.002820617, -0.6810498, -2.718034, 1, 0, 0, 1, 1,
-0.002662845, 1.751761, -0.3132442, 0, 0, 0, 1, 1,
0.0004659266, 2.182996, -0.5535247, 0, 0, 0, 1, 1,
0.0009948828, 0.04221538, -1.436572, 0, 0, 0, 1, 1,
0.003514462, 0.5012829, -1.214803, 0, 0, 0, 1, 1,
0.007280852, -1.640286, 2.361107, 0, 0, 0, 1, 1,
0.01123596, -0.5878284, 2.970896, 0, 0, 0, 1, 1,
0.01149981, -1.240777, 1.523049, 0, 0, 0, 1, 1,
0.01509118, 0.1790011, 1.054265, 1, 1, 1, 1, 1,
0.01698224, -0.3190397, 3.388996, 1, 1, 1, 1, 1,
0.01850448, 0.3903062, 1.296339, 1, 1, 1, 1, 1,
0.0349967, -0.6663861, 4.614085, 1, 1, 1, 1, 1,
0.03515527, -1.093995, 2.677294, 1, 1, 1, 1, 1,
0.03564249, 0.6292856, 0.7763664, 1, 1, 1, 1, 1,
0.04272374, -0.159941, 2.646014, 1, 1, 1, 1, 1,
0.04379345, -0.784573, 2.98119, 1, 1, 1, 1, 1,
0.04431301, 0.588508, 0.08982635, 1, 1, 1, 1, 1,
0.04958383, 0.3569075, 1.008295, 1, 1, 1, 1, 1,
0.05142802, -0.4818859, 4.067842, 1, 1, 1, 1, 1,
0.0528275, 0.05946055, 1.1669, 1, 1, 1, 1, 1,
0.05296493, 0.7089697, -1.499717, 1, 1, 1, 1, 1,
0.05323319, -0.8969575, 2.436494, 1, 1, 1, 1, 1,
0.05397015, -0.798828, 2.222162, 1, 1, 1, 1, 1,
0.05555052, -0.1774597, 2.842842, 0, 0, 1, 1, 1,
0.05801249, 1.64039, 0.6213515, 1, 0, 0, 1, 1,
0.05842016, -0.4850646, 2.902995, 1, 0, 0, 1, 1,
0.06005703, -0.6575252, 2.299244, 1, 0, 0, 1, 1,
0.06032674, 0.556904, -0.6700634, 1, 0, 0, 1, 1,
0.06157485, 0.6945627, -0.2180023, 1, 0, 0, 1, 1,
0.06490503, -1.030468, 4.091952, 0, 0, 0, 1, 1,
0.06768483, -0.2233373, 2.288336, 0, 0, 0, 1, 1,
0.06812628, -0.1311108, 2.732825, 0, 0, 0, 1, 1,
0.07299727, 2.616169, 0.1137544, 0, 0, 0, 1, 1,
0.07573607, 0.6432512, -1.071256, 0, 0, 0, 1, 1,
0.07674337, -0.3239964, 1.385475, 0, 0, 0, 1, 1,
0.07767114, 0.3108005, -0.1228864, 0, 0, 0, 1, 1,
0.0829612, -0.1734435, 2.774445, 1, 1, 1, 1, 1,
0.08429514, 0.4529731, 0.1212486, 1, 1, 1, 1, 1,
0.08506387, -0.9708042, 2.142542, 1, 1, 1, 1, 1,
0.08628172, -0.1121608, 3.98723, 1, 1, 1, 1, 1,
0.09094912, 0.3355715, 1.137588, 1, 1, 1, 1, 1,
0.09326913, -1.030116, 3.887012, 1, 1, 1, 1, 1,
0.09454178, 1.264301, 0.6959431, 1, 1, 1, 1, 1,
0.09540368, 0.4232717, 1.319947, 1, 1, 1, 1, 1,
0.09683926, 0.6343058, 0.9222115, 1, 1, 1, 1, 1,
0.09710874, -0.6197336, 3.192214, 1, 1, 1, 1, 1,
0.09962111, 0.7965569, -0.9225896, 1, 1, 1, 1, 1,
0.1016527, 0.323544, 1.292464, 1, 1, 1, 1, 1,
0.102931, -0.8076125, 4.825832, 1, 1, 1, 1, 1,
0.104517, 0.62081, 1.498204, 1, 1, 1, 1, 1,
0.1068307, -0.7102705, 3.605881, 1, 1, 1, 1, 1,
0.1077253, 0.7968859, 2.276352, 0, 0, 1, 1, 1,
0.1085756, 0.8011425, 0.1875877, 1, 0, 0, 1, 1,
0.1093528, 0.4476125, 0.3878419, 1, 0, 0, 1, 1,
0.1102925, 0.3603707, 0.8419056, 1, 0, 0, 1, 1,
0.1105378, 0.1776328, 0.5315849, 1, 0, 0, 1, 1,
0.1114874, 0.4555189, 0.2302166, 1, 0, 0, 1, 1,
0.1117447, 0.02672968, 1.313574, 0, 0, 0, 1, 1,
0.1172627, 1.020931, -0.4216039, 0, 0, 0, 1, 1,
0.118482, 1.021698, 0.6702384, 0, 0, 0, 1, 1,
0.1208417, -0.005473678, 0.325298, 0, 0, 0, 1, 1,
0.1270863, -0.499495, 2.642459, 0, 0, 0, 1, 1,
0.1297417, 0.7539326, -0.1291665, 0, 0, 0, 1, 1,
0.1317378, 0.2892259, -1.696454, 0, 0, 0, 1, 1,
0.1331052, -0.2731673, 2.522296, 1, 1, 1, 1, 1,
0.1334647, -0.5197539, 3.832471, 1, 1, 1, 1, 1,
0.1341863, 0.3540129, 1.777445, 1, 1, 1, 1, 1,
0.1377143, -0.858851, 4.751723, 1, 1, 1, 1, 1,
0.1408777, -0.7003781, 4.607605, 1, 1, 1, 1, 1,
0.1488224, 0.9916432, -0.5828639, 1, 1, 1, 1, 1,
0.1511635, -2.351801, 2.794919, 1, 1, 1, 1, 1,
0.1528673, -1.376237, 2.545413, 1, 1, 1, 1, 1,
0.1554182, -0.1813056, 3.534045, 1, 1, 1, 1, 1,
0.1561721, -1.112555, 4.020618, 1, 1, 1, 1, 1,
0.1581698, -1.070815, 4.195986, 1, 1, 1, 1, 1,
0.1633601, -1.297202, 0.5879714, 1, 1, 1, 1, 1,
0.1645066, -0.1235856, 1.008319, 1, 1, 1, 1, 1,
0.1662473, -1.584975, 2.955263, 1, 1, 1, 1, 1,
0.1688062, -0.518346, 4.052781, 1, 1, 1, 1, 1,
0.1698327, 0.6557027, 0.3486631, 0, 0, 1, 1, 1,
0.1723273, -0.6343775, 1.673806, 1, 0, 0, 1, 1,
0.1756836, 1.355561, -0.1001026, 1, 0, 0, 1, 1,
0.1777887, 2.09731, -0.84126, 1, 0, 0, 1, 1,
0.1820934, -0.5881014, 1.56281, 1, 0, 0, 1, 1,
0.1854183, -1.004223, 2.652446, 1, 0, 0, 1, 1,
0.1885292, -1.068257, 3.717823, 0, 0, 0, 1, 1,
0.1894598, -0.06344628, 3.511954, 0, 0, 0, 1, 1,
0.1901309, -0.2000031, 2.468701, 0, 0, 0, 1, 1,
0.1901874, 0.1151877, 0.3200674, 0, 0, 0, 1, 1,
0.1910352, -1.386454, 2.479809, 0, 0, 0, 1, 1,
0.1924812, -0.3926932, 3.528513, 0, 0, 0, 1, 1,
0.1931244, -0.3461669, 3.959506, 0, 0, 0, 1, 1,
0.1947319, 0.9936842, 0.8372321, 1, 1, 1, 1, 1,
0.1951954, 0.6468366, -0.2330864, 1, 1, 1, 1, 1,
0.1988008, -1.495106, 1.327629, 1, 1, 1, 1, 1,
0.2007583, 0.9904604, 0.6435809, 1, 1, 1, 1, 1,
0.2029313, -0.1018512, 2.188266, 1, 1, 1, 1, 1,
0.2051754, 0.8210187, -0.266775, 1, 1, 1, 1, 1,
0.2075099, 0.7066382, 1.083258, 1, 1, 1, 1, 1,
0.2079548, 0.4270157, -0.04566519, 1, 1, 1, 1, 1,
0.2091186, 1.77604, 0.1531025, 1, 1, 1, 1, 1,
0.2139432, 1.57527, 0.2397573, 1, 1, 1, 1, 1,
0.214571, -0.8940057, 2.452505, 1, 1, 1, 1, 1,
0.2197801, -0.1829001, 2.698766, 1, 1, 1, 1, 1,
0.2200902, -1.685878, 3.241888, 1, 1, 1, 1, 1,
0.2227799, 0.2444449, 0.6967709, 1, 1, 1, 1, 1,
0.2234835, 1.387597, -0.01092809, 1, 1, 1, 1, 1,
0.2278315, -0.01297563, 1.015314, 0, 0, 1, 1, 1,
0.2325582, -2.793128, 3.435169, 1, 0, 0, 1, 1,
0.2358142, 1.174703, 0.2333089, 1, 0, 0, 1, 1,
0.2394964, 1.172964, 0.09222363, 1, 0, 0, 1, 1,
0.2441321, -0.8860822, 3.222547, 1, 0, 0, 1, 1,
0.2445697, -0.6084167, 1.286822, 1, 0, 0, 1, 1,
0.2445782, -1.685661, 3.159869, 0, 0, 0, 1, 1,
0.2479308, -1.224071, 1.720161, 0, 0, 0, 1, 1,
0.2480615, 2.014282, 0.7537033, 0, 0, 0, 1, 1,
0.2505533, 0.03706287, 2.17888, 0, 0, 0, 1, 1,
0.2528962, 0.205258, 0.3281774, 0, 0, 0, 1, 1,
0.2537023, -1.292131, 3.278384, 0, 0, 0, 1, 1,
0.2561755, -0.09210631, 3.064749, 0, 0, 0, 1, 1,
0.2569783, 0.04874477, 1.354862, 1, 1, 1, 1, 1,
0.2582605, -0.2647587, 1.772258, 1, 1, 1, 1, 1,
0.2603799, -2.255489, 3.754101, 1, 1, 1, 1, 1,
0.2633603, -1.016146, -0.09196991, 1, 1, 1, 1, 1,
0.267535, 1.1053, 0.8090242, 1, 1, 1, 1, 1,
0.2682958, 1.172825, -0.05343838, 1, 1, 1, 1, 1,
0.2703334, -1.32499, 3.896752, 1, 1, 1, 1, 1,
0.2733932, 1.247065, 1.706536, 1, 1, 1, 1, 1,
0.277662, -0.5720934, 3.854361, 1, 1, 1, 1, 1,
0.2786525, -0.4207668, 2.81658, 1, 1, 1, 1, 1,
0.2845735, -0.04806762, 0.5905325, 1, 1, 1, 1, 1,
0.2852732, -0.9136291, 2.593035, 1, 1, 1, 1, 1,
0.287216, 0.3951287, 1.821058, 1, 1, 1, 1, 1,
0.2937524, 0.3319691, 0.8259615, 1, 1, 1, 1, 1,
0.2963105, -1.691358, 4.724266, 1, 1, 1, 1, 1,
0.2986722, 0.6743007, 0.525756, 0, 0, 1, 1, 1,
0.3021407, 2.091413, -1.49394, 1, 0, 0, 1, 1,
0.3025191, -0.09367255, 1.34231, 1, 0, 0, 1, 1,
0.3052417, -0.7937639, 2.588502, 1, 0, 0, 1, 1,
0.3055991, -1.144093, 1.890131, 1, 0, 0, 1, 1,
0.3070471, 0.05028937, 2.983045, 1, 0, 0, 1, 1,
0.3139356, 0.558462, 0.3054906, 0, 0, 0, 1, 1,
0.3172212, 0.03895104, 2.326855, 0, 0, 0, 1, 1,
0.3210087, 1.967564, -0.4250832, 0, 0, 0, 1, 1,
0.3311618, 1.416783, 0.5776321, 0, 0, 0, 1, 1,
0.3336657, 1.674011, 0.6703796, 0, 0, 0, 1, 1,
0.3337698, -2.275289, 4.75842, 0, 0, 0, 1, 1,
0.3340918, 0.1220388, 0.79847, 0, 0, 0, 1, 1,
0.3374822, -0.6638256, 0.2468823, 1, 1, 1, 1, 1,
0.3391087, 0.9839728, -1.606182, 1, 1, 1, 1, 1,
0.3393086, -0.4108328, 4.149169, 1, 1, 1, 1, 1,
0.3419945, -0.3600697, 2.892777, 1, 1, 1, 1, 1,
0.3435439, 0.541769, 1.431871, 1, 1, 1, 1, 1,
0.3448645, 0.3803881, 2.446359, 1, 1, 1, 1, 1,
0.3455065, 1.186543, 1.438436, 1, 1, 1, 1, 1,
0.3476491, -1.453971, 4.069973, 1, 1, 1, 1, 1,
0.3491832, -0.07697007, 3.057106, 1, 1, 1, 1, 1,
0.3498118, 1.328431, 0.6483435, 1, 1, 1, 1, 1,
0.3515861, 0.3319963, 0.6336386, 1, 1, 1, 1, 1,
0.3639055, 0.3834287, 2.742833, 1, 1, 1, 1, 1,
0.3654218, -0.5012394, 2.710636, 1, 1, 1, 1, 1,
0.368506, 1.213543, 0.4904684, 1, 1, 1, 1, 1,
0.3708463, -0.07654987, 1.432511, 1, 1, 1, 1, 1,
0.373238, 0.1171951, 3.023752, 0, 0, 1, 1, 1,
0.3738, 0.2545834, 0.8908952, 1, 0, 0, 1, 1,
0.3837875, 1.31976, 1.706572, 1, 0, 0, 1, 1,
0.3962595, -0.260684, 2.157127, 1, 0, 0, 1, 1,
0.396646, 0.2793706, 1.790446, 1, 0, 0, 1, 1,
0.3979083, 1.24525, -0.752137, 1, 0, 0, 1, 1,
0.4080702, -1.042733, 3.525926, 0, 0, 0, 1, 1,
0.4098924, -0.5026372, 3.416439, 0, 0, 0, 1, 1,
0.4112639, -0.4102861, 4.27548, 0, 0, 0, 1, 1,
0.4167096, -0.2216251, 1.612807, 0, 0, 0, 1, 1,
0.4176257, 1.132738, 0.3813259, 0, 0, 0, 1, 1,
0.4184751, 0.1279772, 2.357981, 0, 0, 0, 1, 1,
0.4223659, -2.774934, 4.04997, 0, 0, 0, 1, 1,
0.4247025, -0.9351336, 2.363331, 1, 1, 1, 1, 1,
0.4250144, -0.4699115, 2.346535, 1, 1, 1, 1, 1,
0.4355845, 1.623115, -0.3151008, 1, 1, 1, 1, 1,
0.4389721, 0.3086729, 0.5562075, 1, 1, 1, 1, 1,
0.4401059, 0.6396177, 0.1894633, 1, 1, 1, 1, 1,
0.4409973, -0.2674976, 4.368187, 1, 1, 1, 1, 1,
0.4434633, -0.355312, 0.7996159, 1, 1, 1, 1, 1,
0.4437322, 0.7666702, 0.3840154, 1, 1, 1, 1, 1,
0.4454668, -0.6802524, 1.795945, 1, 1, 1, 1, 1,
0.4484006, -0.4569388, 2.019525, 1, 1, 1, 1, 1,
0.4545719, -0.4015477, 4.041852, 1, 1, 1, 1, 1,
0.4583858, -0.5152389, 2.935028, 1, 1, 1, 1, 1,
0.4627749, -0.6908672, 2.609272, 1, 1, 1, 1, 1,
0.464875, -0.9745315, 2.98604, 1, 1, 1, 1, 1,
0.4649991, 1.482927, -0.3842577, 1, 1, 1, 1, 1,
0.4668477, 0.7420948, -0.8188837, 0, 0, 1, 1, 1,
0.4673278, 1.432788, -0.02889618, 1, 0, 0, 1, 1,
0.4681608, 0.1875422, 1.556218, 1, 0, 0, 1, 1,
0.4694385, -0.4668919, 1.79581, 1, 0, 0, 1, 1,
0.4763418, 0.2144365, 1.540407, 1, 0, 0, 1, 1,
0.4771673, -0.2849044, 3.047322, 1, 0, 0, 1, 1,
0.4779516, -0.257592, 2.112158, 0, 0, 0, 1, 1,
0.4839514, -0.1106815, 1.406626, 0, 0, 0, 1, 1,
0.4881477, 0.7670578, -0.3376012, 0, 0, 0, 1, 1,
0.489464, 1.171686, -0.1701877, 0, 0, 0, 1, 1,
0.4937463, 0.6979873, 0.6955622, 0, 0, 0, 1, 1,
0.4955189, 0.4007777, 2.546078, 0, 0, 0, 1, 1,
0.5016634, -1.055098, 4.102447, 0, 0, 0, 1, 1,
0.5023397, -0.4412437, 0.63197, 1, 1, 1, 1, 1,
0.5049965, 0.3828199, 0.9874566, 1, 1, 1, 1, 1,
0.5070297, 0.3486322, 1.895813, 1, 1, 1, 1, 1,
0.5087508, 0.3912529, 1.51467, 1, 1, 1, 1, 1,
0.5105932, 0.5959029, -0.7222672, 1, 1, 1, 1, 1,
0.5109618, -1.061339, 3.601103, 1, 1, 1, 1, 1,
0.5132219, 0.03745762, 2.513183, 1, 1, 1, 1, 1,
0.5135294, -1.098141, 2.7298, 1, 1, 1, 1, 1,
0.5151635, -0.7523173, 3.151173, 1, 1, 1, 1, 1,
0.5158201, -0.5475805, 3.600786, 1, 1, 1, 1, 1,
0.5195091, -1.131188, 2.566075, 1, 1, 1, 1, 1,
0.5259195, -0.5261122, 3.060008, 1, 1, 1, 1, 1,
0.5264803, -0.1664014, 3.3231, 1, 1, 1, 1, 1,
0.5291603, 0.2800725, 1.582435, 1, 1, 1, 1, 1,
0.5312608, 0.00530918, 0.3897584, 1, 1, 1, 1, 1,
0.5320111, 0.3561418, 1.661115, 0, 0, 1, 1, 1,
0.5374486, -1.07098, 3.281326, 1, 0, 0, 1, 1,
0.5388938, -1.338304, 3.662977, 1, 0, 0, 1, 1,
0.5470762, -0.1251708, 1.71033, 1, 0, 0, 1, 1,
0.5480756, -0.2585385, 1.622272, 1, 0, 0, 1, 1,
0.5531595, 0.1045294, 0.8867629, 1, 0, 0, 1, 1,
0.5603175, 0.7090598, -0.9176117, 0, 0, 0, 1, 1,
0.5623431, 0.7104615, 0.880635, 0, 0, 0, 1, 1,
0.5623693, 1.121727, 0.08219487, 0, 0, 0, 1, 1,
0.564076, 0.1160994, 0.9137095, 0, 0, 0, 1, 1,
0.5695935, -0.07618243, 0.922357, 0, 0, 0, 1, 1,
0.5717661, -0.1949521, 0.4761348, 0, 0, 0, 1, 1,
0.5720427, 0.1315378, 2.193262, 0, 0, 0, 1, 1,
0.5735132, 1.930271, 0.7697645, 1, 1, 1, 1, 1,
0.5754496, -0.3697785, 2.04768, 1, 1, 1, 1, 1,
0.5830916, -0.3331136, 1.921726, 1, 1, 1, 1, 1,
0.5922048, -0.7312187, 2.513283, 1, 1, 1, 1, 1,
0.5932598, 0.9098063, 1.145564, 1, 1, 1, 1, 1,
0.593613, -0.202204, 2.425618, 1, 1, 1, 1, 1,
0.5938378, -0.7540464, 2.630555, 1, 1, 1, 1, 1,
0.5955802, 0.2676031, 0.4244865, 1, 1, 1, 1, 1,
0.5990188, -1.070062, 3.525647, 1, 1, 1, 1, 1,
0.6004664, -2.230752, 4.589969, 1, 1, 1, 1, 1,
0.6022611, 0.7361307, 1.36565, 1, 1, 1, 1, 1,
0.6148133, 0.3898387, 0.7041476, 1, 1, 1, 1, 1,
0.619926, -1.514197, 2.424829, 1, 1, 1, 1, 1,
0.6207914, -0.1861957, 1.308757, 1, 1, 1, 1, 1,
0.6216763, -0.3688722, 3.132361, 1, 1, 1, 1, 1,
0.6232559, -0.4705782, 3.744163, 0, 0, 1, 1, 1,
0.6266942, 0.5301664, 0.8980465, 1, 0, 0, 1, 1,
0.6271574, -0.9140097, 1.732806, 1, 0, 0, 1, 1,
0.6307852, 1.736247, 1.589943, 1, 0, 0, 1, 1,
0.63113, 0.4953221, 0.5745722, 1, 0, 0, 1, 1,
0.6313431, 0.8793789, 0.3842903, 1, 0, 0, 1, 1,
0.6315663, -1.355913, 3.235383, 0, 0, 0, 1, 1,
0.6327994, 1.819355, 0.8884189, 0, 0, 0, 1, 1,
0.6342236, 0.6586723, 1.648011, 0, 0, 0, 1, 1,
0.6342533, 0.362776, -0.328359, 0, 0, 0, 1, 1,
0.635624, 1.007406, 1.139858, 0, 0, 0, 1, 1,
0.6356385, 1.462206, 0.6616304, 0, 0, 0, 1, 1,
0.6382263, -0.3999086, 3.062489, 0, 0, 0, 1, 1,
0.6385487, 0.07920828, 1.188163, 1, 1, 1, 1, 1,
0.6395614, 1.553961, -0.7437158, 1, 1, 1, 1, 1,
0.6433566, -0.7036321, 1.153974, 1, 1, 1, 1, 1,
0.6459461, -2.890568, 3.621283, 1, 1, 1, 1, 1,
0.6496119, -1.277261, 4.974027, 1, 1, 1, 1, 1,
0.6550149, -1.140615, 3.829462, 1, 1, 1, 1, 1,
0.6555441, 1.451842, -0.05612782, 1, 1, 1, 1, 1,
0.6568474, 0.2929287, -0.5354701, 1, 1, 1, 1, 1,
0.6640791, -0.3946282, 2.990713, 1, 1, 1, 1, 1,
0.6649614, 0.2012286, 0.4460516, 1, 1, 1, 1, 1,
0.6666349, -0.425619, 1.971413, 1, 1, 1, 1, 1,
0.6668373, -0.2115811, 1.299008, 1, 1, 1, 1, 1,
0.6686617, -0.007230781, 2.102081, 1, 1, 1, 1, 1,
0.6735082, 0.9991125, 0.3609361, 1, 1, 1, 1, 1,
0.6766558, 0.1055119, 0.3583039, 1, 1, 1, 1, 1,
0.6807541, -0.5884878, 2.742427, 0, 0, 1, 1, 1,
0.6816185, 0.6595788, 1.187416, 1, 0, 0, 1, 1,
0.6840746, -1.483575, 3.300981, 1, 0, 0, 1, 1,
0.6866263, -0.2316928, 1.706534, 1, 0, 0, 1, 1,
0.6866972, 1.118328, -0.8688841, 1, 0, 0, 1, 1,
0.6883481, 0.1558471, 0.7916352, 1, 0, 0, 1, 1,
0.6893587, 0.140225, 1.130625, 0, 0, 0, 1, 1,
0.6918473, 1.070885, -1.519843, 0, 0, 0, 1, 1,
0.6935233, -1.782462, 1.999029, 0, 0, 0, 1, 1,
0.6946298, 0.7635356, -0.1824996, 0, 0, 0, 1, 1,
0.6948658, 0.9989415, 1.05051, 0, 0, 0, 1, 1,
0.6958314, -1.44939, 1.592718, 0, 0, 0, 1, 1,
0.6960993, 0.7035816, 1.291742, 0, 0, 0, 1, 1,
0.6996078, 0.5996193, 0.6639075, 1, 1, 1, 1, 1,
0.7017585, -1.317695, 1.061924, 1, 1, 1, 1, 1,
0.7043719, -0.5050752, 1.614143, 1, 1, 1, 1, 1,
0.7083071, 1.028113, -0.4780754, 1, 1, 1, 1, 1,
0.7113446, -0.2890049, -0.6921257, 1, 1, 1, 1, 1,
0.711953, -0.08510657, 1.844568, 1, 1, 1, 1, 1,
0.7135482, 1.308803, -0.4811973, 1, 1, 1, 1, 1,
0.7153779, -0.7247956, 0.6707281, 1, 1, 1, 1, 1,
0.7231343, 2.847138, -0.5239712, 1, 1, 1, 1, 1,
0.7295904, 0.2999043, 1.281076, 1, 1, 1, 1, 1,
0.73219, 0.2845979, 0.4838343, 1, 1, 1, 1, 1,
0.7328097, 1.756556, -0.1245294, 1, 1, 1, 1, 1,
0.7364326, -0.4781778, 0.1793872, 1, 1, 1, 1, 1,
0.7415469, -0.1238786, 2.026388, 1, 1, 1, 1, 1,
0.7424641, 0.3835507, -0.2234502, 1, 1, 1, 1, 1,
0.7548027, 1.055723, -0.3127449, 0, 0, 1, 1, 1,
0.7565505, -0.40233, 1.481648, 1, 0, 0, 1, 1,
0.7605098, -0.7979094, 3.71818, 1, 0, 0, 1, 1,
0.7634013, -3.236691, 3.950825, 1, 0, 0, 1, 1,
0.7655342, -0.974503, 2.61159, 1, 0, 0, 1, 1,
0.7725123, -1.212685, 2.372605, 1, 0, 0, 1, 1,
0.7737178, 1.747205, 1.920357, 0, 0, 0, 1, 1,
0.7802441, -0.4616599, 2.984081, 0, 0, 0, 1, 1,
0.7821884, -0.4378071, 2.580072, 0, 0, 0, 1, 1,
0.7822579, -0.1318151, 1.78253, 0, 0, 0, 1, 1,
0.787686, 1.975538, 0.9878931, 0, 0, 0, 1, 1,
0.7880184, 0.9078809, 3.251885, 0, 0, 0, 1, 1,
0.7962871, -0.09639345, 1.522542, 0, 0, 0, 1, 1,
0.7964302, 0.5588832, 1.32439, 1, 1, 1, 1, 1,
0.7980772, -0.2923705, 1.586944, 1, 1, 1, 1, 1,
0.7997731, 1.288867, 0.02988427, 1, 1, 1, 1, 1,
0.800158, -0.7671015, 3.738618, 1, 1, 1, 1, 1,
0.8002776, -0.2587381, 2.159538, 1, 1, 1, 1, 1,
0.8006709, 1.529735, 0.4487529, 1, 1, 1, 1, 1,
0.8018717, 1.563998, 0.4210853, 1, 1, 1, 1, 1,
0.8054063, 0.562153, 1.704449, 1, 1, 1, 1, 1,
0.8057826, -1.016717, 1.451334, 1, 1, 1, 1, 1,
0.8063548, -0.05971717, -0.6814472, 1, 1, 1, 1, 1,
0.806946, 0.2761239, 2.019399, 1, 1, 1, 1, 1,
0.810742, -1.385396, 2.208236, 1, 1, 1, 1, 1,
0.8149287, -0.394784, 1.481491, 1, 1, 1, 1, 1,
0.8178431, 0.01593022, 1.239987, 1, 1, 1, 1, 1,
0.8270298, -0.9772742, 2.603432, 1, 1, 1, 1, 1,
0.8385688, 1.621423, 1.844375, 0, 0, 1, 1, 1,
0.8443952, 0.562736, 0.6458222, 1, 0, 0, 1, 1,
0.8491999, -0.5118518, 2.182655, 1, 0, 0, 1, 1,
0.8538565, -1.648524, 3.96866, 1, 0, 0, 1, 1,
0.855723, -1.351376, 2.077729, 1, 0, 0, 1, 1,
0.8632364, -1.921962, 4.129349, 1, 0, 0, 1, 1,
0.8663408, 1.323832, 2.282168, 0, 0, 0, 1, 1,
0.8685042, 1.702431, 0.09245364, 0, 0, 0, 1, 1,
0.869953, 0.7457884, 0.3214026, 0, 0, 0, 1, 1,
0.8732805, 0.05049524, 0.9071271, 0, 0, 0, 1, 1,
0.8758454, 0.05103806, 1.669514, 0, 0, 0, 1, 1,
0.8837177, -0.9598939, 2.053809, 0, 0, 0, 1, 1,
0.8962691, -0.4165637, 1.469694, 0, 0, 0, 1, 1,
0.8975503, 0.7941068, 1.549627, 1, 1, 1, 1, 1,
0.8981049, 0.8135183, 0.449591, 1, 1, 1, 1, 1,
0.8984337, -0.2384171, 2.005639, 1, 1, 1, 1, 1,
0.9007627, 1.602903, 1.101794, 1, 1, 1, 1, 1,
0.9013499, -0.9287499, 2.84683, 1, 1, 1, 1, 1,
0.9065185, 0.8887738, 0.9197669, 1, 1, 1, 1, 1,
0.9089995, -1.685675, 3.312028, 1, 1, 1, 1, 1,
0.9106774, -0.233959, 1.876163, 1, 1, 1, 1, 1,
0.911473, -0.6793696, 3.915158, 1, 1, 1, 1, 1,
0.9270655, 1.829882, -0.657786, 1, 1, 1, 1, 1,
0.9331836, -1.43835, 4.769143, 1, 1, 1, 1, 1,
0.9375419, 0.8282934, 2.260106, 1, 1, 1, 1, 1,
0.9423965, -0.6129461, 2.693691, 1, 1, 1, 1, 1,
0.9511096, 0.09999592, 1.208074, 1, 1, 1, 1, 1,
0.9566384, -1.151045, 1.265023, 1, 1, 1, 1, 1,
0.957415, -2.169061, 0.226041, 0, 0, 1, 1, 1,
0.9613098, 1.783568, 1.230904, 1, 0, 0, 1, 1,
0.9618717, -1.445417, 2.296413, 1, 0, 0, 1, 1,
0.9621937, -0.9647231, 1.879464, 1, 0, 0, 1, 1,
0.9663101, -0.1931819, 1.408407, 1, 0, 0, 1, 1,
0.9689103, -1.229397, 3.693553, 1, 0, 0, 1, 1,
0.982893, -0.00258204, 1.66286, 0, 0, 0, 1, 1,
0.9878989, 0.09867428, 1.357337, 0, 0, 0, 1, 1,
0.9882656, -0.94231, 2.238644, 0, 0, 0, 1, 1,
0.9918131, -0.2348745, 2.541103, 0, 0, 0, 1, 1,
0.9926425, -0.3746524, 1.763863, 0, 0, 0, 1, 1,
0.9964087, 1.93315, 0.4323713, 0, 0, 0, 1, 1,
1.007792, 0.1711651, 0.7819965, 0, 0, 0, 1, 1,
1.011284, 1.293334, -0.8367229, 1, 1, 1, 1, 1,
1.013554, 0.08635572, -0.5457963, 1, 1, 1, 1, 1,
1.013634, 0.8636063, 0.2852447, 1, 1, 1, 1, 1,
1.01636, 1.888952, 0.1756116, 1, 1, 1, 1, 1,
1.021128, 0.531682, 1.482439, 1, 1, 1, 1, 1,
1.022872, 1.293637, 0.2253425, 1, 1, 1, 1, 1,
1.029184, 1.23763, -0.6174749, 1, 1, 1, 1, 1,
1.029368, 0.0601825, 1.594975, 1, 1, 1, 1, 1,
1.030169, 1.216485, 0.6307474, 1, 1, 1, 1, 1,
1.030395, -0.3017012, 1.724033, 1, 1, 1, 1, 1,
1.03364, 0.2479549, 1.575892, 1, 1, 1, 1, 1,
1.033666, 1.699146, 1.312192, 1, 1, 1, 1, 1,
1.037381, -0.7430335, 3.975166, 1, 1, 1, 1, 1,
1.039304, 1.267043, 0.0913901, 1, 1, 1, 1, 1,
1.041281, -0.01957146, 2.211722, 1, 1, 1, 1, 1,
1.045023, 0.8349305, 0.7124581, 0, 0, 1, 1, 1,
1.047691, -2.167685, 0.07558254, 1, 0, 0, 1, 1,
1.050409, -0.5447723, 2.443976, 1, 0, 0, 1, 1,
1.059663, -1.520015, 2.62247, 1, 0, 0, 1, 1,
1.064541, 0.5008561, 1.354183, 1, 0, 0, 1, 1,
1.066119, 0.003897211, 1.708777, 1, 0, 0, 1, 1,
1.071293, 2.140757, 1.054396, 0, 0, 0, 1, 1,
1.072127, 0.09688317, -0.3233935, 0, 0, 0, 1, 1,
1.074606, 1.143502, 1.049133, 0, 0, 0, 1, 1,
1.077931, -0.6373961, 2.583306, 0, 0, 0, 1, 1,
1.086793, 0.723437, 0.2451717, 0, 0, 0, 1, 1,
1.088181, -0.2535161, 1.772971, 0, 0, 0, 1, 1,
1.088578, -0.2971498, 3.181907, 0, 0, 0, 1, 1,
1.102916, -0.5828521, 1.935847, 1, 1, 1, 1, 1,
1.103145, -0.2473262, 1.681999, 1, 1, 1, 1, 1,
1.112192, 1.974888, -2.005015, 1, 1, 1, 1, 1,
1.120543, -0.5843228, 1.876386, 1, 1, 1, 1, 1,
1.125112, -0.2986177, 1.474456, 1, 1, 1, 1, 1,
1.128553, 0.2658803, 0.3137277, 1, 1, 1, 1, 1,
1.132661, -0.4450856, 2.006865, 1, 1, 1, 1, 1,
1.135627, -0.524218, 2.128158, 1, 1, 1, 1, 1,
1.139766, 0.5015668, -0.1345518, 1, 1, 1, 1, 1,
1.14338, -0.09415217, 0.3330923, 1, 1, 1, 1, 1,
1.150555, 0.2397836, 0.1770721, 1, 1, 1, 1, 1,
1.151314, 1.012038, 2.593229, 1, 1, 1, 1, 1,
1.160442, 0.3788933, 1.499137, 1, 1, 1, 1, 1,
1.170245, -1.078081, 4.007788, 1, 1, 1, 1, 1,
1.171674, -1.3463, 1.211791, 1, 1, 1, 1, 1,
1.172123, -1.142774, 3.053149, 0, 0, 1, 1, 1,
1.173386, -0.9415627, 1.910906, 1, 0, 0, 1, 1,
1.173783, -1.900813, 4.227935, 1, 0, 0, 1, 1,
1.180245, 0.6542163, -1.098758, 1, 0, 0, 1, 1,
1.181335, 1.1386, -1.453398, 1, 0, 0, 1, 1,
1.185153, -1.183906, 2.680127, 1, 0, 0, 1, 1,
1.187808, 1.709013, 0.4074444, 0, 0, 0, 1, 1,
1.194449, -0.1299555, 3.029469, 0, 0, 0, 1, 1,
1.196446, -1.063618, 3.723868, 0, 0, 0, 1, 1,
1.19724, 1.007541, -0.1942063, 0, 0, 0, 1, 1,
1.198237, -0.3212045, 0.8129376, 0, 0, 0, 1, 1,
1.199848, -0.6401733, 0.07588021, 0, 0, 0, 1, 1,
1.203841, 1.360631, -0.7082177, 0, 0, 0, 1, 1,
1.205953, 0.483261, 2.734557, 1, 1, 1, 1, 1,
1.211531, -2.045067, 2.171648, 1, 1, 1, 1, 1,
1.213794, -0.9945994, 2.893316, 1, 1, 1, 1, 1,
1.216376, -0.5650457, 3.718311, 1, 1, 1, 1, 1,
1.216453, -0.1749365, 1.817322, 1, 1, 1, 1, 1,
1.218463, -0.8343009, 2.621689, 1, 1, 1, 1, 1,
1.221116, -2.110003, 2.847554, 1, 1, 1, 1, 1,
1.223466, -0.1640899, 2.595323, 1, 1, 1, 1, 1,
1.223946, -0.685916, 4.354042, 1, 1, 1, 1, 1,
1.224215, 0.2991712, 2.40281, 1, 1, 1, 1, 1,
1.2304, 0.01763881, 1.900125, 1, 1, 1, 1, 1,
1.236104, -1.43461, 4.068241, 1, 1, 1, 1, 1,
1.241084, 0.8251525, 0.7922735, 1, 1, 1, 1, 1,
1.24235, -0.07913637, 1.092278, 1, 1, 1, 1, 1,
1.244416, -0.7967334, 3.090559, 1, 1, 1, 1, 1,
1.246107, 1.523801, 0.5811726, 0, 0, 1, 1, 1,
1.252716, -2.980426, 3.347731, 1, 0, 0, 1, 1,
1.279201, 0.7722627, 2.028727, 1, 0, 0, 1, 1,
1.286049, -1.719136, 4.454106, 1, 0, 0, 1, 1,
1.289459, 0.2257948, 2.89341, 1, 0, 0, 1, 1,
1.293086, -1.668248, 1.836362, 1, 0, 0, 1, 1,
1.295655, -1.058332, 2.473722, 0, 0, 0, 1, 1,
1.304839, -0.674209, 0.3431344, 0, 0, 0, 1, 1,
1.307489, -0.6484356, 0.7083035, 0, 0, 0, 1, 1,
1.315842, 0.1995858, 1.150542, 0, 0, 0, 1, 1,
1.316067, -1.380085, 0.7541155, 0, 0, 0, 1, 1,
1.317174, -0.9329712, 2.433936, 0, 0, 0, 1, 1,
1.330694, 1.002586, -0.7272306, 0, 0, 0, 1, 1,
1.338407, -1.561261, 1.162927, 1, 1, 1, 1, 1,
1.341125, -0.4936602, 1.85907, 1, 1, 1, 1, 1,
1.342027, 0.4736241, 2.551912, 1, 1, 1, 1, 1,
1.350405, 1.370637, 0.3840844, 1, 1, 1, 1, 1,
1.355753, -1.904019, 2.684439, 1, 1, 1, 1, 1,
1.374009, -0.4043449, 2.349569, 1, 1, 1, 1, 1,
1.374252, 0.8877974, 1.300686, 1, 1, 1, 1, 1,
1.377395, 0.4140318, 0.9621921, 1, 1, 1, 1, 1,
1.379949, 0.6598849, 1.432902, 1, 1, 1, 1, 1,
1.387414, -0.2612411, 1.82706, 1, 1, 1, 1, 1,
1.392326, -0.5935754, 0.7518534, 1, 1, 1, 1, 1,
1.397362, 0.1735634, 2.319217, 1, 1, 1, 1, 1,
1.413229, -0.4107479, 3.759637, 1, 1, 1, 1, 1,
1.414178, -1.177611, 2.213554, 1, 1, 1, 1, 1,
1.416251, 1.463844, 2.702253, 1, 1, 1, 1, 1,
1.430791, 0.816654, 0.8553574, 0, 0, 1, 1, 1,
1.433162, -0.7334989, 1.883236, 1, 0, 0, 1, 1,
1.454316, 1.123505, -0.3747748, 1, 0, 0, 1, 1,
1.455931, -0.4044726, 1.080384, 1, 0, 0, 1, 1,
1.49084, 0.4656307, 0.5978749, 1, 0, 0, 1, 1,
1.498248, -1.646102, 3.528504, 1, 0, 0, 1, 1,
1.501632, 0.4322414, 1.638828, 0, 0, 0, 1, 1,
1.513337, 0.2973117, 2.319047, 0, 0, 0, 1, 1,
1.528978, 0.6214043, 2.1412, 0, 0, 0, 1, 1,
1.542171, -1.298562, 1.575983, 0, 0, 0, 1, 1,
1.542202, 0.24099, 0.4822413, 0, 0, 0, 1, 1,
1.542776, -0.1995814, 1.559093, 0, 0, 0, 1, 1,
1.548194, 0.6750404, 1.437948, 0, 0, 0, 1, 1,
1.549892, 0.01872756, 3.689741, 1, 1, 1, 1, 1,
1.555756, 0.07692739, 1.516839, 1, 1, 1, 1, 1,
1.559226, -1.716914, 1.264877, 1, 1, 1, 1, 1,
1.560034, 1.335989, 0.768654, 1, 1, 1, 1, 1,
1.567694, -0.256449, 0.8758118, 1, 1, 1, 1, 1,
1.56878, 1.455074, -0.008125306, 1, 1, 1, 1, 1,
1.569338, -0.008512228, 0.3723244, 1, 1, 1, 1, 1,
1.576692, -0.8480961, 3.451946, 1, 1, 1, 1, 1,
1.577195, 0.7340551, 1.000985, 1, 1, 1, 1, 1,
1.578162, -0.2666641, 0.2926793, 1, 1, 1, 1, 1,
1.635754, 0.4364896, 1.541877, 1, 1, 1, 1, 1,
1.648204, 0.6386572, 1.288164, 1, 1, 1, 1, 1,
1.655302, -1.932959, 3.741648, 1, 1, 1, 1, 1,
1.656933, -0.916685, 1.297859, 1, 1, 1, 1, 1,
1.664709, 1.008467, 0.3534973, 1, 1, 1, 1, 1,
1.666394, -2.188223, 3.180956, 0, 0, 1, 1, 1,
1.669594, -0.6430463, 1.217386, 1, 0, 0, 1, 1,
1.707296, -0.1215632, 1.179066, 1, 0, 0, 1, 1,
1.739172, -0.3879354, 0.7713149, 1, 0, 0, 1, 1,
1.746835, -1.462667, 2.059165, 1, 0, 0, 1, 1,
1.74708, -1.101497, 3.007351, 1, 0, 0, 1, 1,
1.757345, -0.8320248, 1.914015, 0, 0, 0, 1, 1,
1.780079, 1.277845, 1.820486, 0, 0, 0, 1, 1,
1.791116, 0.2597033, 3.073505, 0, 0, 0, 1, 1,
1.798746, -0.3104319, 3.483141, 0, 0, 0, 1, 1,
1.80523, 0.2978953, 1.592417, 0, 0, 0, 1, 1,
1.818194, -1.461329, 1.585237, 0, 0, 0, 1, 1,
1.820699, -0.9100944, 2.91604, 0, 0, 0, 1, 1,
1.826781, 1.293437, 1.221714, 1, 1, 1, 1, 1,
1.840426, 1.127733, 1.817223, 1, 1, 1, 1, 1,
1.875461, -0.1708483, 1.102318, 1, 1, 1, 1, 1,
1.876362, 0.03675576, 2.331954, 1, 1, 1, 1, 1,
1.878136, 0.1783112, 0.7688309, 1, 1, 1, 1, 1,
1.894297, -2.689438, 2.49714, 1, 1, 1, 1, 1,
1.901967, 0.02026486, 3.288139, 1, 1, 1, 1, 1,
1.939121, 0.07220665, 0.4203934, 1, 1, 1, 1, 1,
1.96367, -0.8036088, 3.610082, 1, 1, 1, 1, 1,
1.97983, 0.3532932, 0.8645996, 1, 1, 1, 1, 1,
2.000664, 1.235176, 2.18276, 1, 1, 1, 1, 1,
2.027446, 0.277398, 0.628643, 1, 1, 1, 1, 1,
2.049417, 0.9590298, 1.342545, 1, 1, 1, 1, 1,
2.083596, -0.9523294, 3.363197, 1, 1, 1, 1, 1,
2.104011, 0.1768406, 1.205214, 1, 1, 1, 1, 1,
2.111217, 0.4927481, 2.956875, 0, 0, 1, 1, 1,
2.129335, 0.6930044, 0.1042241, 1, 0, 0, 1, 1,
2.133479, 1.193202, 0.9338955, 1, 0, 0, 1, 1,
2.142861, 2.341471, 0.8822148, 1, 0, 0, 1, 1,
2.194547, -0.3049622, 1.352952, 1, 0, 0, 1, 1,
2.20336, 0.3724726, 0.2903071, 1, 0, 0, 1, 1,
2.229498, 0.4461892, 2.419775, 0, 0, 0, 1, 1,
2.24303, 0.6805531, 1.710333, 0, 0, 0, 1, 1,
2.330793, 1.429006, 2.059606, 0, 0, 0, 1, 1,
2.373981, 1.341135, 1.83004, 0, 0, 0, 1, 1,
2.44619, -0.1140111, -0.9503651, 0, 0, 0, 1, 1,
2.447539, -0.6340524, 1.939579, 0, 0, 0, 1, 1,
2.448738, -0.4088342, 1.558113, 0, 0, 0, 1, 1,
2.453656, 1.940138, 2.478363, 1, 1, 1, 1, 1,
2.493252, -0.8084633, 2.156012, 1, 1, 1, 1, 1,
2.524577, 1.203807, 0.5023771, 1, 1, 1, 1, 1,
2.574555, -0.01254264, -0.1366532, 1, 1, 1, 1, 1,
2.667546, -0.6606749, 0.1920458, 1, 1, 1, 1, 1,
2.721192, -2.397324, 1.501888, 1, 1, 1, 1, 1,
3.209664, -0.4783996, 2.209725, 1, 1, 1, 1, 1
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
var radius = 9.547007;
var distance = 33.53345;
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
mvMatrix.translate( 0.2475801, 0.1947763, 0.2807815 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.53345);
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
