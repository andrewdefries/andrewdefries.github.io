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
-3.075875, 0.3690785, -1.658375, 1, 0, 0, 1,
-2.662786, -0.4163626, -2.620853, 1, 0.007843138, 0, 1,
-2.58233, 0.8317804, -2.85571, 1, 0.01176471, 0, 1,
-2.554092, 0.0289115, -2.160105, 1, 0.01960784, 0, 1,
-2.554003, 0.9768627, -0.5205233, 1, 0.02352941, 0, 1,
-2.551005, -0.575478, -2.692119, 1, 0.03137255, 0, 1,
-2.536417, 0.4576595, -2.136233, 1, 0.03529412, 0, 1,
-2.4959, -0.6577897, -2.735995, 1, 0.04313726, 0, 1,
-2.373568, -1.60083, -1.113044, 1, 0.04705882, 0, 1,
-2.339512, 0.5608241, -0.9944413, 1, 0.05490196, 0, 1,
-2.32868, -0.4641264, -2.712863, 1, 0.05882353, 0, 1,
-2.319288, 0.1693106, -2.196428, 1, 0.06666667, 0, 1,
-2.279798, 1.173419, -1.124842, 1, 0.07058824, 0, 1,
-2.249781, 0.08524073, -1.354682, 1, 0.07843138, 0, 1,
-2.216549, 0.1498985, -1.70457, 1, 0.08235294, 0, 1,
-2.211945, -0.7515708, -1.576324, 1, 0.09019608, 0, 1,
-2.179022, -1.400052, -2.608931, 1, 0.09411765, 0, 1,
-2.156501, -0.5067629, -1.844468, 1, 0.1019608, 0, 1,
-2.090925, 0.5307116, 1.388808, 1, 0.1098039, 0, 1,
-2.075544, -0.9699563, -2.400003, 1, 0.1137255, 0, 1,
-2.064454, 0.6737311, -0.7857348, 1, 0.1215686, 0, 1,
-2.048442, -0.7989147, -0.9200661, 1, 0.1254902, 0, 1,
-2.015892, 0.1915174, -1.772173, 1, 0.1333333, 0, 1,
-1.990175, 1.412003, -0.8817651, 1, 0.1372549, 0, 1,
-1.980443, 0.6530379, -1.338654, 1, 0.145098, 0, 1,
-1.945938, 0.6636937, -1.234548, 1, 0.1490196, 0, 1,
-1.92392, -0.686246, -0.8514701, 1, 0.1568628, 0, 1,
-1.922278, 0.5539138, -1.968114, 1, 0.1607843, 0, 1,
-1.91362, 1.540688, 0.5585202, 1, 0.1686275, 0, 1,
-1.895633, -0.7907727, -2.08787, 1, 0.172549, 0, 1,
-1.891957, -1.208618, -3.634711, 1, 0.1803922, 0, 1,
-1.890914, 1.177595, -1.762505, 1, 0.1843137, 0, 1,
-1.890686, 0.9715071, -1.084488, 1, 0.1921569, 0, 1,
-1.862604, -0.5894128, -2.612214, 1, 0.1960784, 0, 1,
-1.85669, 0.6178769, -0.8982105, 1, 0.2039216, 0, 1,
-1.845572, -0.240444, -3.339089, 1, 0.2117647, 0, 1,
-1.830019, 1.241074, 0.8026808, 1, 0.2156863, 0, 1,
-1.826398, -1.03036, -1.048891, 1, 0.2235294, 0, 1,
-1.812748, -2.279841, -1.299054, 1, 0.227451, 0, 1,
-1.763431, -0.4653944, -0.6385518, 1, 0.2352941, 0, 1,
-1.758539, 0.610626, -1.744972, 1, 0.2392157, 0, 1,
-1.74119, -1.55743, -2.077818, 1, 0.2470588, 0, 1,
-1.734978, 0.2928183, -1.073144, 1, 0.2509804, 0, 1,
-1.723447, 0.7254996, -0.8489229, 1, 0.2588235, 0, 1,
-1.715221, 0.1660342, 1.199067, 1, 0.2627451, 0, 1,
-1.695113, -0.7126862, -2.557885, 1, 0.2705882, 0, 1,
-1.668313, -0.7009308, -1.536689, 1, 0.2745098, 0, 1,
-1.6617, -1.166601, -2.296116, 1, 0.282353, 0, 1,
-1.659544, -0.4610507, -0.5307764, 1, 0.2862745, 0, 1,
-1.643891, -0.3984649, -1.464876, 1, 0.2941177, 0, 1,
-1.641449, 1.104652, -3.163216, 1, 0.3019608, 0, 1,
-1.625331, 0.6058744, -1.299001, 1, 0.3058824, 0, 1,
-1.599396, -1.311725, -1.428468, 1, 0.3137255, 0, 1,
-1.572236, -0.3616402, -1.584459, 1, 0.3176471, 0, 1,
-1.560652, -0.2377825, -1.89176, 1, 0.3254902, 0, 1,
-1.559631, 1.20074, 0.1856492, 1, 0.3294118, 0, 1,
-1.556371, -0.326064, -1.397933, 1, 0.3372549, 0, 1,
-1.551286, -1.092478, -3.267166, 1, 0.3411765, 0, 1,
-1.516483, -0.9680714, -3.365342, 1, 0.3490196, 0, 1,
-1.51239, 0.9445771, -1.526606, 1, 0.3529412, 0, 1,
-1.512079, 1.618271, 0.4750201, 1, 0.3607843, 0, 1,
-1.489996, 0.2502653, -0.5700701, 1, 0.3647059, 0, 1,
-1.480569, -0.2949381, -1.161511, 1, 0.372549, 0, 1,
-1.474764, -0.3049972, -2.889187, 1, 0.3764706, 0, 1,
-1.46411, -2.413083, -1.564093, 1, 0.3843137, 0, 1,
-1.463829, -1.903314, -1.773099, 1, 0.3882353, 0, 1,
-1.458531, 1.14738, 0.3918568, 1, 0.3960784, 0, 1,
-1.453676, 1.336657, -0.8298303, 1, 0.4039216, 0, 1,
-1.447907, -0.1957018, -1.542368, 1, 0.4078431, 0, 1,
-1.430944, 1.156391, -1.728223, 1, 0.4156863, 0, 1,
-1.427655, -1.48781, -2.064467, 1, 0.4196078, 0, 1,
-1.415731, 0.2196217, -1.357416, 1, 0.427451, 0, 1,
-1.393917, -0.03876673, -1.235622, 1, 0.4313726, 0, 1,
-1.382038, 1.12413, -2.933077, 1, 0.4392157, 0, 1,
-1.372778, 0.04638227, -0.3307301, 1, 0.4431373, 0, 1,
-1.362639, 0.4456718, -2.266645, 1, 0.4509804, 0, 1,
-1.349104, 0.4891331, -1.696463, 1, 0.454902, 0, 1,
-1.333522, 1.151639, 0.4371737, 1, 0.4627451, 0, 1,
-1.332688, 0.2688382, -3.278918, 1, 0.4666667, 0, 1,
-1.319256, -0.7037166, -3.36523, 1, 0.4745098, 0, 1,
-1.310934, 0.5175526, -2.43504, 1, 0.4784314, 0, 1,
-1.309421, -0.5343261, -3.799111, 1, 0.4862745, 0, 1,
-1.309145, -0.3561021, -0.2918368, 1, 0.4901961, 0, 1,
-1.304345, 0.4194987, -1.58569, 1, 0.4980392, 0, 1,
-1.302366, -0.1067671, -1.358852, 1, 0.5058824, 0, 1,
-1.301358, 1.404967, 1.851338, 1, 0.509804, 0, 1,
-1.289115, -0.7943146, -0.9922532, 1, 0.5176471, 0, 1,
-1.287137, -0.6977859, -3.8697, 1, 0.5215687, 0, 1,
-1.282929, 2.098967, -0.1358974, 1, 0.5294118, 0, 1,
-1.280603, 0.1862234, 0.1080253, 1, 0.5333334, 0, 1,
-1.273741, -0.6163195, -2.908559, 1, 0.5411765, 0, 1,
-1.267784, -1.185504, -2.625782, 1, 0.5450981, 0, 1,
-1.259147, 0.1929159, -3.006866, 1, 0.5529412, 0, 1,
-1.248645, -1.835932, -3.499497, 1, 0.5568628, 0, 1,
-1.247377, -1.970136, -2.144549, 1, 0.5647059, 0, 1,
-1.247014, -0.4511411, 1.022318, 1, 0.5686275, 0, 1,
-1.24418, -0.1329211, 0.06630529, 1, 0.5764706, 0, 1,
-1.243456, 0.4730382, -0.3826959, 1, 0.5803922, 0, 1,
-1.243147, -2.462782, -3.80776, 1, 0.5882353, 0, 1,
-1.2417, 0.650011, -1.015286, 1, 0.5921569, 0, 1,
-1.225176, 1.230673, -2.248756, 1, 0.6, 0, 1,
-1.209152, -0.1654438, -1.283711, 1, 0.6078432, 0, 1,
-1.20683, -0.5464189, -2.240471, 1, 0.6117647, 0, 1,
-1.203126, -0.4893763, -2.57377, 1, 0.6196079, 0, 1,
-1.20235, 0.01397217, 0.2804109, 1, 0.6235294, 0, 1,
-1.198861, 0.1220036, -2.4033, 1, 0.6313726, 0, 1,
-1.187222, -0.5460252, -1.867222, 1, 0.6352941, 0, 1,
-1.169711, 1.105434, -2.123298, 1, 0.6431373, 0, 1,
-1.15677, 1.721944, -0.06446745, 1, 0.6470588, 0, 1,
-1.155242, -0.1052186, -1.393993, 1, 0.654902, 0, 1,
-1.153387, 1.546765, -1.03282, 1, 0.6588235, 0, 1,
-1.141996, -0.2028446, -2.495781, 1, 0.6666667, 0, 1,
-1.140406, -0.1618577, -1.846177, 1, 0.6705883, 0, 1,
-1.137088, 0.7758924, -1.630866, 1, 0.6784314, 0, 1,
-1.133976, 0.9213988, -1.659076, 1, 0.682353, 0, 1,
-1.132431, 0.2197619, -1.379306, 1, 0.6901961, 0, 1,
-1.130057, 0.06516637, -2.612492, 1, 0.6941177, 0, 1,
-1.126689, 1.69834, -0.2161977, 1, 0.7019608, 0, 1,
-1.121878, 0.6441754, 0.7479847, 1, 0.7098039, 0, 1,
-1.116167, -0.4255873, -3.748186, 1, 0.7137255, 0, 1,
-1.112893, 1.128194, -0.1690548, 1, 0.7215686, 0, 1,
-1.112568, 0.00655297, -0.8204443, 1, 0.7254902, 0, 1,
-1.109588, -0.7897775, -1.9439, 1, 0.7333333, 0, 1,
-1.108956, 0.6011159, -1.600349, 1, 0.7372549, 0, 1,
-1.101029, -0.2047189, 0.03531119, 1, 0.7450981, 0, 1,
-1.100763, 0.1462767, -2.56986, 1, 0.7490196, 0, 1,
-1.094504, 0.1570856, -2.885571, 1, 0.7568628, 0, 1,
-1.091943, 1.015801, -1.077993, 1, 0.7607843, 0, 1,
-1.075086, 0.1260393, -1.066693, 1, 0.7686275, 0, 1,
-1.069304, -1.166219, -2.958654, 1, 0.772549, 0, 1,
-1.067473, -1.489856, -2.469337, 1, 0.7803922, 0, 1,
-1.067294, -1.075752, -1.417469, 1, 0.7843137, 0, 1,
-1.063483, -0.3272144, -0.3434356, 1, 0.7921569, 0, 1,
-1.062547, 1.595951, -3.051506, 1, 0.7960784, 0, 1,
-1.059451, 0.2978431, -0.2979276, 1, 0.8039216, 0, 1,
-1.058378, 0.8534099, -1.148016, 1, 0.8117647, 0, 1,
-1.049756, 0.3546289, -1.835109, 1, 0.8156863, 0, 1,
-1.038685, 0.2326476, -0.2363665, 1, 0.8235294, 0, 1,
-1.033967, 0.159793, -2.725484, 1, 0.827451, 0, 1,
-1.028875, -1.114138, -2.144527, 1, 0.8352941, 0, 1,
-1.017182, 1.045175, 0.1067741, 1, 0.8392157, 0, 1,
-1.014686, -0.8290507, -2.427279, 1, 0.8470588, 0, 1,
-1.003968, 0.7546917, -1.205213, 1, 0.8509804, 0, 1,
-0.9962928, -2.358232, -2.54554, 1, 0.8588235, 0, 1,
-0.9948403, 0.3070125, -1.9802, 1, 0.8627451, 0, 1,
-0.9922162, -0.4265257, -2.411487, 1, 0.8705882, 0, 1,
-0.9920963, 0.02693783, -2.044195, 1, 0.8745098, 0, 1,
-0.981575, 0.04179769, -1.669608, 1, 0.8823529, 0, 1,
-0.9799796, 1.002562, -1.630834, 1, 0.8862745, 0, 1,
-0.9784902, 0.05863274, -1.902341, 1, 0.8941177, 0, 1,
-0.9649552, 0.2822073, -1.085658, 1, 0.8980392, 0, 1,
-0.9631038, 0.8859672, -0.9562368, 1, 0.9058824, 0, 1,
-0.9609324, 1.936416, 0.864912, 1, 0.9137255, 0, 1,
-0.9550144, 0.1564693, -0.89743, 1, 0.9176471, 0, 1,
-0.946539, 1.091286, -0.7846056, 1, 0.9254902, 0, 1,
-0.942764, -0.5392794, -2.924316, 1, 0.9294118, 0, 1,
-0.9402983, -0.1456518, -0.7196305, 1, 0.9372549, 0, 1,
-0.9399205, -0.09826253, -1.496404, 1, 0.9411765, 0, 1,
-0.9354475, -0.5049283, -2.952342, 1, 0.9490196, 0, 1,
-0.9334878, 1.120645, -1.032913, 1, 0.9529412, 0, 1,
-0.9292558, 0.2903793, -0.3631473, 1, 0.9607843, 0, 1,
-0.9285055, -1.252079, -1.66772, 1, 0.9647059, 0, 1,
-0.9282615, 0.1174777, -0.4445853, 1, 0.972549, 0, 1,
-0.9269456, -1.025504, -1.711326, 1, 0.9764706, 0, 1,
-0.9258884, -0.3344307, 0.009780315, 1, 0.9843137, 0, 1,
-0.925469, 0.4341109, 0.2307325, 1, 0.9882353, 0, 1,
-0.9226656, -1.276672, -1.646802, 1, 0.9960784, 0, 1,
-0.919241, 2.096082, -0.5291088, 0.9960784, 1, 0, 1,
-0.9156243, 1.476549, -1.120419, 0.9921569, 1, 0, 1,
-0.901764, 0.5239459, -1.140608, 0.9843137, 1, 0, 1,
-0.8924122, -0.9932497, -3.286922, 0.9803922, 1, 0, 1,
-0.8882126, -0.09433294, -0.86019, 0.972549, 1, 0, 1,
-0.8877476, 1.594142, -0.3465665, 0.9686275, 1, 0, 1,
-0.8820924, -0.2642713, -2.212699, 0.9607843, 1, 0, 1,
-0.8809035, 0.9932484, -1.349509, 0.9568627, 1, 0, 1,
-0.8785166, 0.4523956, -1.625759, 0.9490196, 1, 0, 1,
-0.8709542, -0.7712825, -1.79364, 0.945098, 1, 0, 1,
-0.863385, -0.7556567, -2.496501, 0.9372549, 1, 0, 1,
-0.857851, 0.8795114, -0.7294016, 0.9333333, 1, 0, 1,
-0.8578304, -1.026813, -3.75622, 0.9254902, 1, 0, 1,
-0.8549024, -1.602461, -4.236861, 0.9215686, 1, 0, 1,
-0.8543859, 1.740095, -0.6641548, 0.9137255, 1, 0, 1,
-0.8534368, -0.8551028, -2.219534, 0.9098039, 1, 0, 1,
-0.8481213, -1.020221, -0.7148678, 0.9019608, 1, 0, 1,
-0.8473576, 0.04363674, -0.1267496, 0.8941177, 1, 0, 1,
-0.847348, 0.303721, -1.286998, 0.8901961, 1, 0, 1,
-0.8421767, 0.9313244, 0.5892138, 0.8823529, 1, 0, 1,
-0.8382918, -0.7398825, -1.204275, 0.8784314, 1, 0, 1,
-0.8350527, -0.3547715, -0.7272645, 0.8705882, 1, 0, 1,
-0.8338285, -1.526046, -1.795399, 0.8666667, 1, 0, 1,
-0.8316283, 0.311327, -1.588513, 0.8588235, 1, 0, 1,
-0.815437, -0.7473444, -2.222504, 0.854902, 1, 0, 1,
-0.8099835, -0.656813, -1.976826, 0.8470588, 1, 0, 1,
-0.8098865, 0.2995961, -1.087626, 0.8431373, 1, 0, 1,
-0.8089676, -0.4989328, -0.8319479, 0.8352941, 1, 0, 1,
-0.8065089, 1.010623, -0.394004, 0.8313726, 1, 0, 1,
-0.8030387, 0.6679482, 0.1725304, 0.8235294, 1, 0, 1,
-0.7973983, -0.1519036, -0.9309782, 0.8196079, 1, 0, 1,
-0.7872339, 2.48913, 0.3180865, 0.8117647, 1, 0, 1,
-0.7839716, -0.1889185, -2.150846, 0.8078431, 1, 0, 1,
-0.7805889, -1.971425, -3.579024, 0.8, 1, 0, 1,
-0.7755171, -2.375048, -3.622883, 0.7921569, 1, 0, 1,
-0.7721359, 0.9562347, -2.439497, 0.7882353, 1, 0, 1,
-0.7705787, 0.004454237, 0.1155173, 0.7803922, 1, 0, 1,
-0.7703981, 0.2259129, -3.25687, 0.7764706, 1, 0, 1,
-0.7694284, -1.298515, -2.413109, 0.7686275, 1, 0, 1,
-0.767145, 1.501226, 0.0029977, 0.7647059, 1, 0, 1,
-0.7510309, 1.472844, -1.550959, 0.7568628, 1, 0, 1,
-0.7430202, 0.9064693, -1.447438, 0.7529412, 1, 0, 1,
-0.7416182, 1.419996, -2.228248, 0.7450981, 1, 0, 1,
-0.7400798, -1.937316, -3.23508, 0.7411765, 1, 0, 1,
-0.7323983, 0.5334092, -1.820091, 0.7333333, 1, 0, 1,
-0.7245774, 0.01733631, -1.959194, 0.7294118, 1, 0, 1,
-0.724088, -0.6603535, -1.087818, 0.7215686, 1, 0, 1,
-0.7177582, -0.4448327, -3.01587, 0.7176471, 1, 0, 1,
-0.7176576, 1.803322, -0.8334683, 0.7098039, 1, 0, 1,
-0.7168729, 0.004552113, -1.024301, 0.7058824, 1, 0, 1,
-0.7111556, 0.407344, 0.5797793, 0.6980392, 1, 0, 1,
-0.7107867, 1.550901, -0.259076, 0.6901961, 1, 0, 1,
-0.7097692, -1.727078, -3.089241, 0.6862745, 1, 0, 1,
-0.7059533, 1.019656, -1.438844, 0.6784314, 1, 0, 1,
-0.7054847, -1.572973, -0.9950692, 0.6745098, 1, 0, 1,
-0.7001482, -0.00417916, -2.074842, 0.6666667, 1, 0, 1,
-0.6994979, 2.37504, 1.501867, 0.6627451, 1, 0, 1,
-0.6977195, -1.58009, -3.546338, 0.654902, 1, 0, 1,
-0.6967701, 0.3496263, -2.163006, 0.6509804, 1, 0, 1,
-0.6948219, -0.3853812, -2.111781, 0.6431373, 1, 0, 1,
-0.6906978, 0.04681836, 0.05367246, 0.6392157, 1, 0, 1,
-0.6904096, 0.4058503, -0.6065999, 0.6313726, 1, 0, 1,
-0.6892379, 0.1745244, 0.6607611, 0.627451, 1, 0, 1,
-0.6883346, -1.051353, -3.862275, 0.6196079, 1, 0, 1,
-0.6850156, 0.1490626, -3.308148, 0.6156863, 1, 0, 1,
-0.6789911, -1.524617, -3.817332, 0.6078432, 1, 0, 1,
-0.677287, -0.2632313, -2.163806, 0.6039216, 1, 0, 1,
-0.6718285, 0.9382372, -0.9633248, 0.5960785, 1, 0, 1,
-0.666577, 0.8914531, 0.02245941, 0.5882353, 1, 0, 1,
-0.6661886, -1.043847, -3.288184, 0.5843138, 1, 0, 1,
-0.6631602, 0.8891383, -1.55248, 0.5764706, 1, 0, 1,
-0.6609938, -0.3113642, -2.624133, 0.572549, 1, 0, 1,
-0.6602471, 1.153862, 0.7299242, 0.5647059, 1, 0, 1,
-0.6597922, 0.5797049, -1.9837, 0.5607843, 1, 0, 1,
-0.6583791, -0.3655689, -1.270754, 0.5529412, 1, 0, 1,
-0.6572133, 0.02904426, -0.4694075, 0.5490196, 1, 0, 1,
-0.6568934, -0.1203837, -2.385588, 0.5411765, 1, 0, 1,
-0.6550843, -0.6134721, -0.4711925, 0.5372549, 1, 0, 1,
-0.6549569, -0.9942623, -3.906854, 0.5294118, 1, 0, 1,
-0.6491177, 0.05438244, -4.006601, 0.5254902, 1, 0, 1,
-0.6489331, 0.423707, -0.01240911, 0.5176471, 1, 0, 1,
-0.6483516, 0.1838745, -0.9610972, 0.5137255, 1, 0, 1,
-0.6358218, -1.794789, -2.752546, 0.5058824, 1, 0, 1,
-0.6353865, 0.5722123, -0.2879874, 0.5019608, 1, 0, 1,
-0.632008, 1.943044, 0.7615317, 0.4941176, 1, 0, 1,
-0.6303329, 0.6525584, -0.2070218, 0.4862745, 1, 0, 1,
-0.6300597, 1.258555, -0.4600386, 0.4823529, 1, 0, 1,
-0.6267759, -0.06660508, -2.631562, 0.4745098, 1, 0, 1,
-0.624392, 0.971875, -0.5814522, 0.4705882, 1, 0, 1,
-0.6227571, 0.6563344, -0.7010872, 0.4627451, 1, 0, 1,
-0.6170685, -0.3223539, -1.039587, 0.4588235, 1, 0, 1,
-0.6155809, -1.02881, -3.264684, 0.4509804, 1, 0, 1,
-0.6097172, 0.5502788, 0.03336275, 0.4470588, 1, 0, 1,
-0.6068035, -1.116729, -2.695199, 0.4392157, 1, 0, 1,
-0.6066064, 1.197954, -2.780645, 0.4352941, 1, 0, 1,
-0.6029401, -0.9441856, -3.811009, 0.427451, 1, 0, 1,
-0.6016012, -0.7328368, -3.387582, 0.4235294, 1, 0, 1,
-0.5958707, 0.4252236, -0.3037781, 0.4156863, 1, 0, 1,
-0.5949721, 1.117971, 0.1706958, 0.4117647, 1, 0, 1,
-0.5925624, 0.9984987, -0.5779172, 0.4039216, 1, 0, 1,
-0.591915, 0.2842802, 0.5867098, 0.3960784, 1, 0, 1,
-0.588465, -1.347931, -3.792639, 0.3921569, 1, 0, 1,
-0.5819709, 0.8969988, -0.3682711, 0.3843137, 1, 0, 1,
-0.5816829, -0.7948307, -3.249084, 0.3803922, 1, 0, 1,
-0.57908, 1.203591, -1.596824, 0.372549, 1, 0, 1,
-0.5778013, 1.222541, -0.5331839, 0.3686275, 1, 0, 1,
-0.5763839, 0.233869, -1.863232, 0.3607843, 1, 0, 1,
-0.5752252, 1.110835, 0.5337594, 0.3568628, 1, 0, 1,
-0.5731854, 0.5872641, -1.158278, 0.3490196, 1, 0, 1,
-0.5728212, -0.534701, -2.453954, 0.345098, 1, 0, 1,
-0.5721768, 0.1500421, -1.225196, 0.3372549, 1, 0, 1,
-0.567805, -1.662754, -3.594642, 0.3333333, 1, 0, 1,
-0.5628265, -1.11883, -2.992205, 0.3254902, 1, 0, 1,
-0.562748, -1.044849, -3.261397, 0.3215686, 1, 0, 1,
-0.5623882, 0.6597186, 0.9477682, 0.3137255, 1, 0, 1,
-0.5608619, -0.5115628, -3.029408, 0.3098039, 1, 0, 1,
-0.5584953, -0.1198381, -1.322975, 0.3019608, 1, 0, 1,
-0.5570696, -1.623605, -2.09071, 0.2941177, 1, 0, 1,
-0.5545533, -0.6796253, -3.202504, 0.2901961, 1, 0, 1,
-0.5469707, -0.03957301, -1.535266, 0.282353, 1, 0, 1,
-0.5455919, 0.6664569, -1.200531, 0.2784314, 1, 0, 1,
-0.5397466, -0.7738636, -2.080218, 0.2705882, 1, 0, 1,
-0.532863, 1.063264, 0.3263577, 0.2666667, 1, 0, 1,
-0.5303645, -1.147646, -3.009562, 0.2588235, 1, 0, 1,
-0.5276986, -0.3950306, -2.555752, 0.254902, 1, 0, 1,
-0.5254055, 0.9801258, 0.08060522, 0.2470588, 1, 0, 1,
-0.5190322, 0.03335494, -1.105804, 0.2431373, 1, 0, 1,
-0.5183866, -0.5305893, -3.540088, 0.2352941, 1, 0, 1,
-0.5160973, 1.528537, 0.6292281, 0.2313726, 1, 0, 1,
-0.5159405, 1.57777, -0.9159555, 0.2235294, 1, 0, 1,
-0.5147792, 0.4490891, -0.627145, 0.2196078, 1, 0, 1,
-0.5145429, -2.000932, -5.475548, 0.2117647, 1, 0, 1,
-0.5083112, -0.7963665, -4.667167, 0.2078431, 1, 0, 1,
-0.5069317, -1.595083, -4.573458, 0.2, 1, 0, 1,
-0.5053597, -1.08556, -2.516333, 0.1921569, 1, 0, 1,
-0.5041835, 1.113626, -1.129488, 0.1882353, 1, 0, 1,
-0.5031474, 1.918365, -1.737068, 0.1803922, 1, 0, 1,
-0.5004304, -0.9154176, -3.468436, 0.1764706, 1, 0, 1,
-0.4986852, -1.222804, -3.100806, 0.1686275, 1, 0, 1,
-0.4945485, -0.4845701, -2.323892, 0.1647059, 1, 0, 1,
-0.4908835, -0.02089482, -0.4926285, 0.1568628, 1, 0, 1,
-0.488425, -0.8791373, -2.549872, 0.1529412, 1, 0, 1,
-0.4854324, -0.03222283, -1.228784, 0.145098, 1, 0, 1,
-0.4809181, -1.201894, -1.894683, 0.1411765, 1, 0, 1,
-0.4796864, 0.9205538, 0.6799646, 0.1333333, 1, 0, 1,
-0.4780769, -0.7978613, -2.244282, 0.1294118, 1, 0, 1,
-0.4776834, 1.360756, -1.463829, 0.1215686, 1, 0, 1,
-0.4742402, 0.1164003, -1.90012, 0.1176471, 1, 0, 1,
-0.4735604, 1.27625, -0.2602183, 0.1098039, 1, 0, 1,
-0.4730346, 2.349114, -1.758306, 0.1058824, 1, 0, 1,
-0.4723146, -1.388996, -3.083143, 0.09803922, 1, 0, 1,
-0.4720216, -0.6158608, -0.8255349, 0.09019608, 1, 0, 1,
-0.4695801, 1.28598, -0.4439128, 0.08627451, 1, 0, 1,
-0.4637676, 0.1856566, 0.1962388, 0.07843138, 1, 0, 1,
-0.4610894, 0.7204126, -0.3984212, 0.07450981, 1, 0, 1,
-0.4570219, 0.858219, -1.253474, 0.06666667, 1, 0, 1,
-0.4564633, 0.5955681, -0.6825228, 0.0627451, 1, 0, 1,
-0.4562733, -0.9294598, -1.503442, 0.05490196, 1, 0, 1,
-0.4553435, 1.0524, -0.1227589, 0.05098039, 1, 0, 1,
-0.4468556, 0.3965479, -2.733689, 0.04313726, 1, 0, 1,
-0.4455648, 0.8329042, -0.5176064, 0.03921569, 1, 0, 1,
-0.444921, 0.719592, -1.268025, 0.03137255, 1, 0, 1,
-0.4411003, 0.9274558, 0.5876083, 0.02745098, 1, 0, 1,
-0.4382021, -0.954639, -1.657492, 0.01960784, 1, 0, 1,
-0.4378147, 0.9999657, -0.6748975, 0.01568628, 1, 0, 1,
-0.4323841, 0.03809008, -3.270365, 0.007843138, 1, 0, 1,
-0.4269678, -0.1727995, -1.946525, 0.003921569, 1, 0, 1,
-0.4254555, 0.05062142, -2.701521, 0, 1, 0.003921569, 1,
-0.4199553, -1.745649, -5.561447, 0, 1, 0.01176471, 1,
-0.4195744, -0.2351765, -1.46004, 0, 1, 0.01568628, 1,
-0.4122149, 0.756663, -2.331601, 0, 1, 0.02352941, 1,
-0.4114925, -0.7799152, -1.005738, 0, 1, 0.02745098, 1,
-0.4087774, -2.140878, -3.336169, 0, 1, 0.03529412, 1,
-0.4084918, -0.4506072, -0.7735621, 0, 1, 0.03921569, 1,
-0.4074201, -1.152012, -3.149005, 0, 1, 0.04705882, 1,
-0.4060836, 0.6981097, -0.04221384, 0, 1, 0.05098039, 1,
-0.4038817, 1.253221, 1.221047, 0, 1, 0.05882353, 1,
-0.4037099, -0.3891392, -3.010684, 0, 1, 0.0627451, 1,
-0.4035494, 0.2806783, -0.3041593, 0, 1, 0.07058824, 1,
-0.4032555, 0.192044, -0.3529949, 0, 1, 0.07450981, 1,
-0.4017032, -1.494251, -0.6756657, 0, 1, 0.08235294, 1,
-0.3985535, 0.09055094, -2.009575, 0, 1, 0.08627451, 1,
-0.3966886, 1.755458, -0.949163, 0, 1, 0.09411765, 1,
-0.3959377, 1.109165, -1.253116, 0, 1, 0.1019608, 1,
-0.3949275, 0.9979553, -0.3767557, 0, 1, 0.1058824, 1,
-0.3946187, 0.210264, -1.203837, 0, 1, 0.1137255, 1,
-0.3843534, 1.167091, -0.2115793, 0, 1, 0.1176471, 1,
-0.3833887, 1.122886, 1.036366, 0, 1, 0.1254902, 1,
-0.3760519, -0.2410778, -2.908669, 0, 1, 0.1294118, 1,
-0.3711399, 0.9693221, 0.8277605, 0, 1, 0.1372549, 1,
-0.3697206, 1.946586, -1.275736, 0, 1, 0.1411765, 1,
-0.3686517, -0.4592515, -4.958051, 0, 1, 0.1490196, 1,
-0.3675514, -1.768109, -3.617589, 0, 1, 0.1529412, 1,
-0.3673617, 1.645072, 0.4040307, 0, 1, 0.1607843, 1,
-0.3625917, 1.608217, -1.772122, 0, 1, 0.1647059, 1,
-0.3557932, 0.440202, -0.3803671, 0, 1, 0.172549, 1,
-0.3551441, -1.014255, -2.392823, 0, 1, 0.1764706, 1,
-0.3537413, -1.654138, -4.005853, 0, 1, 0.1843137, 1,
-0.3536249, 1.678715, 0.290443, 0, 1, 0.1882353, 1,
-0.351738, 1.403644, 0.8319234, 0, 1, 0.1960784, 1,
-0.3514614, 0.4844954, -0.2555305, 0, 1, 0.2039216, 1,
-0.3511513, 0.8183151, -1.871007, 0, 1, 0.2078431, 1,
-0.3497876, -1.187853, -2.651151, 0, 1, 0.2156863, 1,
-0.3476717, -1.100762, -2.82257, 0, 1, 0.2196078, 1,
-0.3472323, 0.1344204, -1.317949, 0, 1, 0.227451, 1,
-0.342471, -0.1318565, -3.750239, 0, 1, 0.2313726, 1,
-0.3390976, 0.5763382, -1.280432, 0, 1, 0.2392157, 1,
-0.3349073, -0.5809226, -1.273417, 0, 1, 0.2431373, 1,
-0.3236153, -0.7938097, -2.485205, 0, 1, 0.2509804, 1,
-0.3221932, 0.609369, -0.3081935, 0, 1, 0.254902, 1,
-0.3205671, -1.82753, -3.124304, 0, 1, 0.2627451, 1,
-0.3190067, -1.118552, -2.696292, 0, 1, 0.2666667, 1,
-0.3186007, 0.3856116, -1.666435, 0, 1, 0.2745098, 1,
-0.3115306, -0.2215562, -2.961783, 0, 1, 0.2784314, 1,
-0.3058633, 0.1988805, -1.120272, 0, 1, 0.2862745, 1,
-0.3046819, 0.3832747, -0.1408906, 0, 1, 0.2901961, 1,
-0.3038911, -0.3786026, -2.674718, 0, 1, 0.2980392, 1,
-0.2992557, -0.2135958, -2.626251, 0, 1, 0.3058824, 1,
-0.2941213, -0.1578896, -1.615116, 0, 1, 0.3098039, 1,
-0.2933088, 0.5073918, -1.422079, 0, 1, 0.3176471, 1,
-0.2929532, -0.686513, -1.742991, 0, 1, 0.3215686, 1,
-0.2925979, 2.390966, 0.5275531, 0, 1, 0.3294118, 1,
-0.29115, -0.7124837, -2.63639, 0, 1, 0.3333333, 1,
-0.2898498, -3.622901, -3.179838, 0, 1, 0.3411765, 1,
-0.2792568, 0.8735921, -0.2042594, 0, 1, 0.345098, 1,
-0.2765184, 0.381598, 1.150519, 0, 1, 0.3529412, 1,
-0.2696615, 0.6744846, -1.645167, 0, 1, 0.3568628, 1,
-0.2696212, -0.1631712, -3.128994, 0, 1, 0.3647059, 1,
-0.2674941, -0.5221462, -3.16567, 0, 1, 0.3686275, 1,
-0.2669328, -0.5634006, -2.31597, 0, 1, 0.3764706, 1,
-0.2608271, -0.8171585, -2.884522, 0, 1, 0.3803922, 1,
-0.2597909, 1.253791, 0.9760225, 0, 1, 0.3882353, 1,
-0.2577785, -0.8808179, -0.6584881, 0, 1, 0.3921569, 1,
-0.255971, -1.186192, -2.581436, 0, 1, 0.4, 1,
-0.2555289, -1.443851, -2.584352, 0, 1, 0.4078431, 1,
-0.2536302, -0.1971428, -2.518125, 0, 1, 0.4117647, 1,
-0.2499119, -0.8490611, -2.984517, 0, 1, 0.4196078, 1,
-0.2458792, 0.5025092, -0.5890706, 0, 1, 0.4235294, 1,
-0.2390029, 1.054053, -0.1687544, 0, 1, 0.4313726, 1,
-0.2368567, 1.362426, 0.7985348, 0, 1, 0.4352941, 1,
-0.2362105, -0.8303396, -3.998185, 0, 1, 0.4431373, 1,
-0.2332719, 0.7726486, 0.6273351, 0, 1, 0.4470588, 1,
-0.2250793, 0.9631481, 1.58133, 0, 1, 0.454902, 1,
-0.2237695, 0.6572124, 1.040111, 0, 1, 0.4588235, 1,
-0.2227506, 0.7388721, 1.319902, 0, 1, 0.4666667, 1,
-0.2205647, -1.681077, -3.798616, 0, 1, 0.4705882, 1,
-0.2183694, 1.118177, -0.3603247, 0, 1, 0.4784314, 1,
-0.2075999, 0.7289546, -1.366209, 0, 1, 0.4823529, 1,
-0.2030348, -1.308437, -4.083297, 0, 1, 0.4901961, 1,
-0.2028172, 0.002591954, -3.246375, 0, 1, 0.4941176, 1,
-0.1996579, 0.7720222, 0.6412265, 0, 1, 0.5019608, 1,
-0.1904343, -0.6573364, -2.728199, 0, 1, 0.509804, 1,
-0.1877593, 0.0267779, -1.77566, 0, 1, 0.5137255, 1,
-0.1875402, -0.4199926, -3.36771, 0, 1, 0.5215687, 1,
-0.1856702, 0.6970922, -0.9633937, 0, 1, 0.5254902, 1,
-0.1814437, -1.018761, -2.405788, 0, 1, 0.5333334, 1,
-0.1798412, -1.276531, -2.84714, 0, 1, 0.5372549, 1,
-0.1773499, -0.7887453, -4.188615, 0, 1, 0.5450981, 1,
-0.1763164, 0.6244981, 0.7832284, 0, 1, 0.5490196, 1,
-0.1748141, -0.17349, -1.728535, 0, 1, 0.5568628, 1,
-0.167815, 0.5974348, -1.25732, 0, 1, 0.5607843, 1,
-0.1635167, -1.090044, -3.978947, 0, 1, 0.5686275, 1,
-0.1555406, 0.6475022, -1.246131, 0, 1, 0.572549, 1,
-0.1524178, 1.269399, 1.760195, 0, 1, 0.5803922, 1,
-0.1508495, 0.3140132, -0.54874, 0, 1, 0.5843138, 1,
-0.1450923, 1.144438, 1.056222, 0, 1, 0.5921569, 1,
-0.144986, -0.7025244, -2.749593, 0, 1, 0.5960785, 1,
-0.1405954, -0.005790534, -1.499221, 0, 1, 0.6039216, 1,
-0.1393785, -1.176284, -1.731768, 0, 1, 0.6117647, 1,
-0.1374327, 1.204195, -0.4524119, 0, 1, 0.6156863, 1,
-0.1333627, -0.4065332, -4.345046, 0, 1, 0.6235294, 1,
-0.1287025, -0.6198086, -2.681895, 0, 1, 0.627451, 1,
-0.1265635, -1.748483, -2.386516, 0, 1, 0.6352941, 1,
-0.1261662, -1.800251, -4.816253, 0, 1, 0.6392157, 1,
-0.1246137, 0.2150431, 0.4297221, 0, 1, 0.6470588, 1,
-0.1184732, 1.174517, -0.07522752, 0, 1, 0.6509804, 1,
-0.1165072, -0.3886308, -2.356314, 0, 1, 0.6588235, 1,
-0.1137606, 0.3889439, 0.1122404, 0, 1, 0.6627451, 1,
-0.1128144, 0.9110504, 1.139409, 0, 1, 0.6705883, 1,
-0.1106488, 0.2424983, 0.6770595, 0, 1, 0.6745098, 1,
-0.1070952, 1.405536, 0.4228624, 0, 1, 0.682353, 1,
-0.1058422, -1.206229, -1.897971, 0, 1, 0.6862745, 1,
-0.1012667, -0.8500476, -3.872858, 0, 1, 0.6941177, 1,
-0.09482405, 0.9019957, -0.5048015, 0, 1, 0.7019608, 1,
-0.09384943, 0.4075811, -0.08172156, 0, 1, 0.7058824, 1,
-0.09362071, -0.7073511, -2.890331, 0, 1, 0.7137255, 1,
-0.08955625, -0.0005337289, -1.083975, 0, 1, 0.7176471, 1,
-0.08705842, -0.1463437, -1.296433, 0, 1, 0.7254902, 1,
-0.08646414, -0.07592721, -3.091836, 0, 1, 0.7294118, 1,
-0.08565069, 1.107783, 1.395561, 0, 1, 0.7372549, 1,
-0.084634, -0.4400051, -3.266992, 0, 1, 0.7411765, 1,
-0.08397435, 0.16141, -0.01121826, 0, 1, 0.7490196, 1,
-0.0792767, -1.058208, -4.014201, 0, 1, 0.7529412, 1,
-0.07774267, 0.5868876, 0.1769153, 0, 1, 0.7607843, 1,
-0.07614436, -0.4755476, -2.453885, 0, 1, 0.7647059, 1,
-0.07557781, 1.092759, -1.1203, 0, 1, 0.772549, 1,
-0.06739205, 1.60699, 0.2245996, 0, 1, 0.7764706, 1,
-0.06536809, -1.146346, -3.893919, 0, 1, 0.7843137, 1,
-0.06525826, -0.1830775, -2.898029, 0, 1, 0.7882353, 1,
-0.06501991, -0.008336758, -1.335439, 0, 1, 0.7960784, 1,
-0.06344499, 0.589236, -1.273931, 0, 1, 0.8039216, 1,
-0.06235607, 0.1021605, -1.255352, 0, 1, 0.8078431, 1,
-0.05604298, -1.500312, -2.99738, 0, 1, 0.8156863, 1,
-0.05282272, 1.553371, 0.1900203, 0, 1, 0.8196079, 1,
-0.0512495, 0.5032016, 0.4467494, 0, 1, 0.827451, 1,
-0.04870664, -0.9910287, -1.814797, 0, 1, 0.8313726, 1,
-0.04558958, 0.6369168, -0.631861, 0, 1, 0.8392157, 1,
-0.04403476, -1.99971, -2.134487, 0, 1, 0.8431373, 1,
-0.03619361, 1.254952, 1.167771, 0, 1, 0.8509804, 1,
-0.03618933, 0.3677776, 1.519624, 0, 1, 0.854902, 1,
-0.03460459, 0.6368678, -1.058182, 0, 1, 0.8627451, 1,
-0.03299874, -0.2386195, -3.583797, 0, 1, 0.8666667, 1,
-0.02772698, 1.351557, 1.605765, 0, 1, 0.8745098, 1,
-0.02353114, 0.5379428, 0.7426766, 0, 1, 0.8784314, 1,
-0.02234837, 2.088844, -0.8986963, 0, 1, 0.8862745, 1,
-0.02014174, -0.5251842, -2.890906, 0, 1, 0.8901961, 1,
-0.0185139, 0.1453163, -1.618244, 0, 1, 0.8980392, 1,
-0.01235502, -0.3575794, -4.524313, 0, 1, 0.9058824, 1,
-0.01114431, 0.1910914, -0.7635447, 0, 1, 0.9098039, 1,
-0.007420926, -1.192449, -4.447675, 0, 1, 0.9176471, 1,
-0.003577943, 0.9049097, -0.187418, 0, 1, 0.9215686, 1,
-0.003570684, -1.149955, -1.247722, 0, 1, 0.9294118, 1,
-0.002469762, 0.01513613, -0.6458737, 0, 1, 0.9333333, 1,
0.001280992, -0.1217321, 3.573178, 0, 1, 0.9411765, 1,
0.002337962, 0.3105284, 0.2092532, 0, 1, 0.945098, 1,
0.007039181, -0.2667183, 3.405441, 0, 1, 0.9529412, 1,
0.01468363, 2.652693, -0.7363761, 0, 1, 0.9568627, 1,
0.01674461, 1.97906, -1.873597, 0, 1, 0.9647059, 1,
0.01844865, 1.151005, 2.578416, 0, 1, 0.9686275, 1,
0.02064273, 0.529259, 0.6973847, 0, 1, 0.9764706, 1,
0.02251528, 0.8591477, 0.6239501, 0, 1, 0.9803922, 1,
0.02305565, 0.4978836, -1.243727, 0, 1, 0.9882353, 1,
0.02378394, -2.007287, 3.159956, 0, 1, 0.9921569, 1,
0.02565991, 0.9035198, -0.1824942, 0, 1, 1, 1,
0.02606942, 0.1730455, -0.08152714, 0, 0.9921569, 1, 1,
0.02832417, 0.1540622, 0.6396965, 0, 0.9882353, 1, 1,
0.02941044, 0.4949951, 0.7948294, 0, 0.9803922, 1, 1,
0.03082032, 1.103811, -1.485918, 0, 0.9764706, 1, 1,
0.03535321, 1.492029, -0.1990438, 0, 0.9686275, 1, 1,
0.03551609, -0.4909348, 3.126583, 0, 0.9647059, 1, 1,
0.03906308, 0.09890427, 0.1923474, 0, 0.9568627, 1, 1,
0.03965713, -0.01362797, 2.376214, 0, 0.9529412, 1, 1,
0.04269625, 0.05695909, 0.7347258, 0, 0.945098, 1, 1,
0.04376508, 0.4466125, 0.2115348, 0, 0.9411765, 1, 1,
0.04634826, 0.5416595, -0.06291773, 0, 0.9333333, 1, 1,
0.04959211, -0.3011371, 5.170476, 0, 0.9294118, 1, 1,
0.06194481, -1.34381, 4.523253, 0, 0.9215686, 1, 1,
0.06353823, 0.3946511, 2.397766, 0, 0.9176471, 1, 1,
0.06687715, -0.9788446, 4.167486, 0, 0.9098039, 1, 1,
0.06737814, -1.918191, 5.205353, 0, 0.9058824, 1, 1,
0.06795699, 0.8268737, 1.343649, 0, 0.8980392, 1, 1,
0.07972667, -0.2344129, 3.634861, 0, 0.8901961, 1, 1,
0.08331231, 0.9099522, 0.6374899, 0, 0.8862745, 1, 1,
0.08649791, -0.4988131, 2.175593, 0, 0.8784314, 1, 1,
0.08995862, -0.1754527, 3.388781, 0, 0.8745098, 1, 1,
0.09096898, -1.2959, 3.444664, 0, 0.8666667, 1, 1,
0.09130214, -0.5194411, 3.813773, 0, 0.8627451, 1, 1,
0.09158494, 2.005104, -1.152137, 0, 0.854902, 1, 1,
0.09221987, -1.096818, 3.667104, 0, 0.8509804, 1, 1,
0.09393744, -1.486723, 0.9788789, 0, 0.8431373, 1, 1,
0.1014666, 0.8605015, 1.341591, 0, 0.8392157, 1, 1,
0.1028462, -0.07607385, 3.147416, 0, 0.8313726, 1, 1,
0.102945, -0.1909278, 4.483023, 0, 0.827451, 1, 1,
0.1046688, 1.703923, -1.140469, 0, 0.8196079, 1, 1,
0.1146755, 1.726651, -0.529426, 0, 0.8156863, 1, 1,
0.1153581, 0.5548969, -1.605414, 0, 0.8078431, 1, 1,
0.1183931, 0.5572113, -0.1780555, 0, 0.8039216, 1, 1,
0.1189392, -0.7718624, 1.586683, 0, 0.7960784, 1, 1,
0.1209962, -0.5109271, 2.296836, 0, 0.7882353, 1, 1,
0.1221978, 0.8343866, 0.2551427, 0, 0.7843137, 1, 1,
0.1247937, 1.862934, -0.2364863, 0, 0.7764706, 1, 1,
0.1265009, 0.8754117, 0.5431271, 0, 0.772549, 1, 1,
0.130028, 1.882165, -1.179222, 0, 0.7647059, 1, 1,
0.1351632, 0.2275425, 0.6633819, 0, 0.7607843, 1, 1,
0.1368264, 0.9097025, -0.2358689, 0, 0.7529412, 1, 1,
0.138146, 0.1026378, 1.757736, 0, 0.7490196, 1, 1,
0.1442191, -0.287564, 4.859168, 0, 0.7411765, 1, 1,
0.1446296, -0.03439644, 2.131198, 0, 0.7372549, 1, 1,
0.1534171, -0.984263, 3.652408, 0, 0.7294118, 1, 1,
0.1553108, 0.2033176, 2.165017, 0, 0.7254902, 1, 1,
0.1555043, 0.2908458, 1.666764, 0, 0.7176471, 1, 1,
0.1555888, 0.6354954, -0.550912, 0, 0.7137255, 1, 1,
0.1599438, 0.6803856, 0.89944, 0, 0.7058824, 1, 1,
0.1600772, -1.211365, 4.823336, 0, 0.6980392, 1, 1,
0.1705712, -0.493307, 2.334921, 0, 0.6941177, 1, 1,
0.1708402, 0.1393668, -0.03620174, 0, 0.6862745, 1, 1,
0.1721217, 0.5180421, -0.5733975, 0, 0.682353, 1, 1,
0.1730549, -1.852578, 2.729141, 0, 0.6745098, 1, 1,
0.1736375, -1.113419, 4.267657, 0, 0.6705883, 1, 1,
0.1736732, 1.608927, -0.2236058, 0, 0.6627451, 1, 1,
0.1753575, 0.7009457, -0.8384897, 0, 0.6588235, 1, 1,
0.1846189, 0.745249, 0.8419042, 0, 0.6509804, 1, 1,
0.1881559, 0.2039487, 1.325668, 0, 0.6470588, 1, 1,
0.1904624, -0.1411115, 2.572338, 0, 0.6392157, 1, 1,
0.1917887, -1.264212, 5.19363, 0, 0.6352941, 1, 1,
0.1960688, -0.7218125, 2.203515, 0, 0.627451, 1, 1,
0.2025147, 0.2334544, -0.7129719, 0, 0.6235294, 1, 1,
0.2145156, -1.734342, 4.502323, 0, 0.6156863, 1, 1,
0.2160384, -0.3012599, 2.051264, 0, 0.6117647, 1, 1,
0.2176643, -0.8329113, 4.258889, 0, 0.6039216, 1, 1,
0.2233038, 1.545312, 0.3964902, 0, 0.5960785, 1, 1,
0.2239098, -0.716216, 3.776048, 0, 0.5921569, 1, 1,
0.2270265, -1.267676, 3.083337, 0, 0.5843138, 1, 1,
0.2294322, 0.8416106, -0.927664, 0, 0.5803922, 1, 1,
0.232123, -1.179741, 0.8363603, 0, 0.572549, 1, 1,
0.2350104, 0.1111145, 0.4129641, 0, 0.5686275, 1, 1,
0.2387277, -0.04419192, 3.35795, 0, 0.5607843, 1, 1,
0.2391008, 0.05031396, 1.280664, 0, 0.5568628, 1, 1,
0.2396847, 0.8999045, 0.672471, 0, 0.5490196, 1, 1,
0.2423495, 1.305666, 0.06310433, 0, 0.5450981, 1, 1,
0.2428163, 1.164373, -0.128025, 0, 0.5372549, 1, 1,
0.2450755, -1.400063, 1.686429, 0, 0.5333334, 1, 1,
0.2476615, 1.078301, 1.439157, 0, 0.5254902, 1, 1,
0.2476876, -1.290694, 4.495467, 0, 0.5215687, 1, 1,
0.2589819, -0.9806592, 3.480196, 0, 0.5137255, 1, 1,
0.2615972, 0.3378222, -0.2553464, 0, 0.509804, 1, 1,
0.2625459, 1.30439, -0.8596252, 0, 0.5019608, 1, 1,
0.2641137, 0.510945, 0.0217651, 0, 0.4941176, 1, 1,
0.26473, 1.273661, -0.942717, 0, 0.4901961, 1, 1,
0.2665372, -0.6032311, 3.695733, 0, 0.4823529, 1, 1,
0.2674936, -0.583495, 2.446367, 0, 0.4784314, 1, 1,
0.270241, -2.082466, 1.766321, 0, 0.4705882, 1, 1,
0.2705172, -1.727306, 1.549286, 0, 0.4666667, 1, 1,
0.2838506, 0.04262505, 0.4051611, 0, 0.4588235, 1, 1,
0.2860283, -0.5248466, 0.2010907, 0, 0.454902, 1, 1,
0.287394, 0.7348159, 0.8499668, 0, 0.4470588, 1, 1,
0.2887599, -0.4647611, 3.353717, 0, 0.4431373, 1, 1,
0.2895418, 0.6613265, -0.570566, 0, 0.4352941, 1, 1,
0.2910997, 0.4069967, -0.5115897, 0, 0.4313726, 1, 1,
0.2976239, -0.4503706, 1.976667, 0, 0.4235294, 1, 1,
0.3004252, -0.8247982, 2.49818, 0, 0.4196078, 1, 1,
0.3021575, 0.9609637, 0.2711186, 0, 0.4117647, 1, 1,
0.30321, -1.205548, 4.320043, 0, 0.4078431, 1, 1,
0.3057182, -1.37844, 4.442141, 0, 0.4, 1, 1,
0.3171311, -0.8860599, 3.809844, 0, 0.3921569, 1, 1,
0.3211711, 0.6222751, -0.1971907, 0, 0.3882353, 1, 1,
0.3215788, -0.2120401, 0.8520721, 0, 0.3803922, 1, 1,
0.3228155, 0.2319113, 0.5480782, 0, 0.3764706, 1, 1,
0.3257737, -1.539721, 4.818797, 0, 0.3686275, 1, 1,
0.3261534, 0.3753907, 0.4218583, 0, 0.3647059, 1, 1,
0.3269757, -0.1115005, 3.03168, 0, 0.3568628, 1, 1,
0.3313642, -0.1553841, 2.249077, 0, 0.3529412, 1, 1,
0.3365252, -0.1197844, -0.6365252, 0, 0.345098, 1, 1,
0.336985, 0.3105234, 1.190347, 0, 0.3411765, 1, 1,
0.3406104, -0.1440679, 1.74443, 0, 0.3333333, 1, 1,
0.3410012, -0.2365651, 1.85611, 0, 0.3294118, 1, 1,
0.3421427, 0.645065, 0.8939615, 0, 0.3215686, 1, 1,
0.3452073, 1.08651, 1.183329, 0, 0.3176471, 1, 1,
0.3488922, -0.5960805, 2.460192, 0, 0.3098039, 1, 1,
0.3496425, -0.3027565, 3.196087, 0, 0.3058824, 1, 1,
0.3507877, -0.1804132, -0.2836418, 0, 0.2980392, 1, 1,
0.3515663, 2.263071, 1.626891, 0, 0.2901961, 1, 1,
0.3536792, -0.1652154, 3.752214, 0, 0.2862745, 1, 1,
0.3542944, 0.5141107, 0.05464818, 0, 0.2784314, 1, 1,
0.3547106, 0.312023, 2.561716, 0, 0.2745098, 1, 1,
0.361513, -0.2152634, 2.774662, 0, 0.2666667, 1, 1,
0.3703156, 0.2353296, 2.648487, 0, 0.2627451, 1, 1,
0.3706017, 1.435483, 1.409256, 0, 0.254902, 1, 1,
0.3748788, -0.154385, 2.018321, 0, 0.2509804, 1, 1,
0.3769508, -0.5404856, 4.233954, 0, 0.2431373, 1, 1,
0.3807247, 0.3925041, 0.8094307, 0, 0.2392157, 1, 1,
0.3864473, -0.5890029, 2.41029, 0, 0.2313726, 1, 1,
0.3953724, 0.03794991, 0.8649418, 0, 0.227451, 1, 1,
0.4001742, 1.126178, -0.03082436, 0, 0.2196078, 1, 1,
0.4010062, 0.306032, -0.2928546, 0, 0.2156863, 1, 1,
0.4024196, 0.1481062, 0.4278877, 0, 0.2078431, 1, 1,
0.4061758, 0.532574, 1.32755, 0, 0.2039216, 1, 1,
0.4092949, 1.593612, 1.114052, 0, 0.1960784, 1, 1,
0.4103211, 1.594283, -0.3464609, 0, 0.1882353, 1, 1,
0.4130698, 0.1737925, -1.001573, 0, 0.1843137, 1, 1,
0.4161772, 0.7704393, 1.08915, 0, 0.1764706, 1, 1,
0.4181701, 0.3184137, 1.234761, 0, 0.172549, 1, 1,
0.4182233, -1.167358, 2.306028, 0, 0.1647059, 1, 1,
0.4219194, -1.668935, 1.979539, 0, 0.1607843, 1, 1,
0.4237607, 0.04344663, 3.319784, 0, 0.1529412, 1, 1,
0.424044, -1.27883, 4.353475, 0, 0.1490196, 1, 1,
0.4251442, 2.036121, 2.837063, 0, 0.1411765, 1, 1,
0.4330952, 1.183647, 0.2511337, 0, 0.1372549, 1, 1,
0.4368276, 0.5040598, 0.7326556, 0, 0.1294118, 1, 1,
0.4399879, -3.842792, 2.971284, 0, 0.1254902, 1, 1,
0.4423472, -0.1574388, 0.8908398, 0, 0.1176471, 1, 1,
0.4428563, 1.092509, 2.563834, 0, 0.1137255, 1, 1,
0.4500251, 0.2225244, 2.323466, 0, 0.1058824, 1, 1,
0.4536771, 2.106687, 0.8034206, 0, 0.09803922, 1, 1,
0.454941, 1.912313, -0.2768752, 0, 0.09411765, 1, 1,
0.4563586, 0.6958073, 1.790912, 0, 0.08627451, 1, 1,
0.4575284, 0.8868506, 0.4094271, 0, 0.08235294, 1, 1,
0.4600877, -0.9516163, 3.868512, 0, 0.07450981, 1, 1,
0.4609027, -1.260121, 3.328742, 0, 0.07058824, 1, 1,
0.4624188, -0.5343799, 4.481293, 0, 0.0627451, 1, 1,
0.4632291, 0.8932818, 2.465497, 0, 0.05882353, 1, 1,
0.4677542, 0.03458648, 1.289003, 0, 0.05098039, 1, 1,
0.468366, -1.202771, 3.59793, 0, 0.04705882, 1, 1,
0.4690232, -0.3547195, 2.745304, 0, 0.03921569, 1, 1,
0.469328, 0.5583349, 0.8734971, 0, 0.03529412, 1, 1,
0.4730211, 0.131805, 1.629394, 0, 0.02745098, 1, 1,
0.479431, -1.470436, 2.23805, 0, 0.02352941, 1, 1,
0.4814881, -1.59072, 2.515585, 0, 0.01568628, 1, 1,
0.485254, 0.2535598, 0.694537, 0, 0.01176471, 1, 1,
0.4922906, -0.2881599, 2.557676, 0, 0.003921569, 1, 1,
0.4957108, 2.44005, 0.2567503, 0.003921569, 0, 1, 1,
0.4964868, 0.145219, 2.320936, 0.007843138, 0, 1, 1,
0.5008271, 0.1465391, 0.498769, 0.01568628, 0, 1, 1,
0.5032587, 0.4964438, 1.725723, 0.01960784, 0, 1, 1,
0.5107042, 0.06315073, 1.229053, 0.02745098, 0, 1, 1,
0.5110692, -0.5960603, 2.12641, 0.03137255, 0, 1, 1,
0.5191699, 1.299378, 0.5694107, 0.03921569, 0, 1, 1,
0.5220926, -0.08896875, 2.516648, 0.04313726, 0, 1, 1,
0.5238225, -0.5912117, 1.786008, 0.05098039, 0, 1, 1,
0.5242334, -0.327187, 1.473642, 0.05490196, 0, 1, 1,
0.5283754, 1.164133, -0.2573859, 0.0627451, 0, 1, 1,
0.5285217, -0.4515752, 1.614471, 0.06666667, 0, 1, 1,
0.5286997, 0.8058698, -0.3132989, 0.07450981, 0, 1, 1,
0.5380816, -0.5276023, 1.91344, 0.07843138, 0, 1, 1,
0.543915, 0.5251166, 1.383671, 0.08627451, 0, 1, 1,
0.5450597, 2.665277, 1.612928, 0.09019608, 0, 1, 1,
0.5451245, -0.508879, 1.164561, 0.09803922, 0, 1, 1,
0.5482696, 0.9478258, 0.684563, 0.1058824, 0, 1, 1,
0.5494244, 0.194548, 1.25275, 0.1098039, 0, 1, 1,
0.5496737, 1.150582, 1.60249, 0.1176471, 0, 1, 1,
0.5548509, 0.06347198, 2.09418, 0.1215686, 0, 1, 1,
0.5576038, 0.2691498, -0.2336667, 0.1294118, 0, 1, 1,
0.5599524, 1.144773, 0.376675, 0.1333333, 0, 1, 1,
0.5618484, -0.5328783, 3.151577, 0.1411765, 0, 1, 1,
0.5636681, 0.02131068, 1.731827, 0.145098, 0, 1, 1,
0.5644739, 0.6887782, 2.337147, 0.1529412, 0, 1, 1,
0.5734816, -1.549452, 2.404196, 0.1568628, 0, 1, 1,
0.5807601, -1.019955, 1.359731, 0.1647059, 0, 1, 1,
0.583941, -1.81101, 3.564907, 0.1686275, 0, 1, 1,
0.5871428, 1.019118, 0.1903726, 0.1764706, 0, 1, 1,
0.5884611, 1.54204, -0.4332831, 0.1803922, 0, 1, 1,
0.58956, -0.8484828, 4.001453, 0.1882353, 0, 1, 1,
0.5975951, -0.05056519, 0.08168541, 0.1921569, 0, 1, 1,
0.6017468, -0.2072182, 2.966337, 0.2, 0, 1, 1,
0.6028938, 0.8885105, 0.6631725, 0.2078431, 0, 1, 1,
0.6105564, 1.186213, 1.09867, 0.2117647, 0, 1, 1,
0.612178, -0.7295871, 1.718053, 0.2196078, 0, 1, 1,
0.6125268, -0.1179212, 1.000228, 0.2235294, 0, 1, 1,
0.6145414, 1.22947, 0.5931938, 0.2313726, 0, 1, 1,
0.6217812, -0.8027875, 3.035182, 0.2352941, 0, 1, 1,
0.6231089, 1.448671, -0.203666, 0.2431373, 0, 1, 1,
0.6247308, -0.2121545, 1.911234, 0.2470588, 0, 1, 1,
0.629999, 1.138685, -0.4732209, 0.254902, 0, 1, 1,
0.6305463, 0.03455589, 2.401222, 0.2588235, 0, 1, 1,
0.6310627, 0.7982159, 0.4524051, 0.2666667, 0, 1, 1,
0.6399177, -1.615248, 2.709263, 0.2705882, 0, 1, 1,
0.6400859, 0.390413, 1.499882, 0.2784314, 0, 1, 1,
0.6408291, 0.511918, -0.2581617, 0.282353, 0, 1, 1,
0.6409795, -1.021834, 2.197249, 0.2901961, 0, 1, 1,
0.6457822, -0.351435, 2.728851, 0.2941177, 0, 1, 1,
0.646921, -0.1214735, 2.755975, 0.3019608, 0, 1, 1,
0.6575183, 0.7672868, 1.045843, 0.3098039, 0, 1, 1,
0.6601887, 0.702461, 0.329155, 0.3137255, 0, 1, 1,
0.6610149, -0.4951902, 3.117071, 0.3215686, 0, 1, 1,
0.6618289, 0.170445, 0.6274095, 0.3254902, 0, 1, 1,
0.6626954, -1.86459, 3.109066, 0.3333333, 0, 1, 1,
0.6628344, -0.7291068, 2.637091, 0.3372549, 0, 1, 1,
0.6633061, 0.8488837, 0.1654539, 0.345098, 0, 1, 1,
0.6648345, 1.001255, 0.9884595, 0.3490196, 0, 1, 1,
0.6672962, 2.923135, 1.114548, 0.3568628, 0, 1, 1,
0.6683432, -1.594627, 3.390908, 0.3607843, 0, 1, 1,
0.6693249, -1.139427, 3.378239, 0.3686275, 0, 1, 1,
0.6707829, -1.263864, 2.720926, 0.372549, 0, 1, 1,
0.6761175, 0.6625389, 2.717173, 0.3803922, 0, 1, 1,
0.6765183, 0.4343228, 0.9590516, 0.3843137, 0, 1, 1,
0.6770673, 0.2861431, 1.048447, 0.3921569, 0, 1, 1,
0.6827741, -0.8426082, 3.146836, 0.3960784, 0, 1, 1,
0.6921155, 0.07594848, 1.480834, 0.4039216, 0, 1, 1,
0.6927534, 0.2191427, 0.5886171, 0.4117647, 0, 1, 1,
0.6966253, -0.3530082, 2.927526, 0.4156863, 0, 1, 1,
0.7027711, 1.68395, -0.3960978, 0.4235294, 0, 1, 1,
0.7030653, 0.2562521, 2.437495, 0.427451, 0, 1, 1,
0.7040498, -0.1291734, 0.3538278, 0.4352941, 0, 1, 1,
0.7113217, -0.7149823, 2.513695, 0.4392157, 0, 1, 1,
0.7118193, -0.8750452, 4.21563, 0.4470588, 0, 1, 1,
0.7163397, 0.1875984, 0.3461037, 0.4509804, 0, 1, 1,
0.7174438, -1.023646, 3.031765, 0.4588235, 0, 1, 1,
0.7182984, 1.228253, 1.274512, 0.4627451, 0, 1, 1,
0.7216702, -0.6438683, 1.456822, 0.4705882, 0, 1, 1,
0.7217652, 0.7848293, 0.8267649, 0.4745098, 0, 1, 1,
0.7247359, 1.193379, 0.3390459, 0.4823529, 0, 1, 1,
0.7268906, 0.2794971, 1.429605, 0.4862745, 0, 1, 1,
0.7287946, -0.2890335, 1.424862, 0.4941176, 0, 1, 1,
0.7298957, 0.3334629, 1.265869, 0.5019608, 0, 1, 1,
0.7329426, -1.730013, 3.649826, 0.5058824, 0, 1, 1,
0.7330392, -1.217667, 4.393686, 0.5137255, 0, 1, 1,
0.7373583, -1.256375, 4.76871, 0.5176471, 0, 1, 1,
0.7376558, 0.8602455, 1.769129, 0.5254902, 0, 1, 1,
0.738995, 0.4664036, 1.315203, 0.5294118, 0, 1, 1,
0.7391176, -0.7066879, 1.539104, 0.5372549, 0, 1, 1,
0.7456106, -0.1686397, 2.339754, 0.5411765, 0, 1, 1,
0.7473992, -1.808991, 3.779817, 0.5490196, 0, 1, 1,
0.7483177, -1.322348, 1.667779, 0.5529412, 0, 1, 1,
0.750315, 0.3534066, 1.66757, 0.5607843, 0, 1, 1,
0.7514729, 0.6874512, 2.88353, 0.5647059, 0, 1, 1,
0.7537929, 0.5766686, 1.793714, 0.572549, 0, 1, 1,
0.7566414, -0.9502323, 2.758835, 0.5764706, 0, 1, 1,
0.7579289, -0.3975771, 1.947354, 0.5843138, 0, 1, 1,
0.7593808, 0.9579132, 1.023433, 0.5882353, 0, 1, 1,
0.7593963, -0.3202392, 2.089298, 0.5960785, 0, 1, 1,
0.7619821, 0.6182469, -1.004081, 0.6039216, 0, 1, 1,
0.7632005, 0.2724404, 1.549727, 0.6078432, 0, 1, 1,
0.7646235, 0.4461045, 0.3119126, 0.6156863, 0, 1, 1,
0.7717915, -0.667668, 1.342772, 0.6196079, 0, 1, 1,
0.7744145, -0.9362586, 2.477029, 0.627451, 0, 1, 1,
0.7752512, -0.5949153, 2.769716, 0.6313726, 0, 1, 1,
0.7754935, 1.019085, 1.422183, 0.6392157, 0, 1, 1,
0.7808003, -1.231332, 2.865377, 0.6431373, 0, 1, 1,
0.784656, -0.4302002, 1.218519, 0.6509804, 0, 1, 1,
0.7878003, 0.4198144, 3.007323, 0.654902, 0, 1, 1,
0.7973626, -0.01179395, 2.032962, 0.6627451, 0, 1, 1,
0.8142797, -0.9798834, 0.6920639, 0.6666667, 0, 1, 1,
0.8173586, 1.589391, 0.6751292, 0.6745098, 0, 1, 1,
0.8184986, -1.213711, 2.02681, 0.6784314, 0, 1, 1,
0.8204584, -0.5247793, 2.738902, 0.6862745, 0, 1, 1,
0.8219853, 0.6042916, -0.7077296, 0.6901961, 0, 1, 1,
0.8291079, -1.630924, 2.585324, 0.6980392, 0, 1, 1,
0.8292149, 0.2533835, 1.882559, 0.7058824, 0, 1, 1,
0.8326979, -0.8537167, 3.15299, 0.7098039, 0, 1, 1,
0.8368141, 2.70589, -1.298196, 0.7176471, 0, 1, 1,
0.8393288, -0.6875277, 1.880736, 0.7215686, 0, 1, 1,
0.8404468, 0.03351669, 1.69135, 0.7294118, 0, 1, 1,
0.8426024, -0.5563437, 1.132531, 0.7333333, 0, 1, 1,
0.8434627, -0.8329899, 2.28064, 0.7411765, 0, 1, 1,
0.8559635, 0.4347417, 1.505295, 0.7450981, 0, 1, 1,
0.8562917, -2.072228, 2.680847, 0.7529412, 0, 1, 1,
0.8576382, 0.9940968, 0.2725421, 0.7568628, 0, 1, 1,
0.8576583, 0.4474068, 1.349333, 0.7647059, 0, 1, 1,
0.8577412, -0.8401284, 1.65209, 0.7686275, 0, 1, 1,
0.8600576, -0.6398224, 3.857649, 0.7764706, 0, 1, 1,
0.8603243, 2.053627, 0.445516, 0.7803922, 0, 1, 1,
0.8629533, 1.660024, 0.1431111, 0.7882353, 0, 1, 1,
0.870501, -0.2282362, 0.8509764, 0.7921569, 0, 1, 1,
0.8751145, -0.1476909, 1.915705, 0.8, 0, 1, 1,
0.878954, 0.07039125, -0.3069948, 0.8078431, 0, 1, 1,
0.8839233, -0.9077919, 2.06866, 0.8117647, 0, 1, 1,
0.8966256, -0.1791114, 2.235439, 0.8196079, 0, 1, 1,
0.8971417, 0.5636281, 1.366333, 0.8235294, 0, 1, 1,
0.899487, -0.7898259, 3.993641, 0.8313726, 0, 1, 1,
0.8995458, -1.657076, 1.715877, 0.8352941, 0, 1, 1,
0.9013494, -0.5129107, 0.247072, 0.8431373, 0, 1, 1,
0.9037743, -0.5208275, 2.614839, 0.8470588, 0, 1, 1,
0.9163762, 0.168058, 2.260275, 0.854902, 0, 1, 1,
0.9165944, 1.526823, 1.140565, 0.8588235, 0, 1, 1,
0.9179108, -0.4955224, 1.970888, 0.8666667, 0, 1, 1,
0.9208784, 0.05166749, 1.100649, 0.8705882, 0, 1, 1,
0.923713, -0.1949839, 1.69852, 0.8784314, 0, 1, 1,
0.9258955, -0.5581102, 1.74431, 0.8823529, 0, 1, 1,
0.9293905, -0.4045436, 2.014565, 0.8901961, 0, 1, 1,
0.9309735, -0.5983762, 1.515189, 0.8941177, 0, 1, 1,
0.9318882, -0.6460288, 0.8212761, 0.9019608, 0, 1, 1,
0.9342903, -0.708494, 1.726724, 0.9098039, 0, 1, 1,
0.9352669, -1.186332, 3.349411, 0.9137255, 0, 1, 1,
0.9430177, 0.1751595, 1.443256, 0.9215686, 0, 1, 1,
0.9440563, -2.103213, 3.558764, 0.9254902, 0, 1, 1,
0.9516013, -1.093768, 0.5247847, 0.9333333, 0, 1, 1,
0.95168, 0.2441832, 2.76094, 0.9372549, 0, 1, 1,
0.9646098, -1.546284, 1.185566, 0.945098, 0, 1, 1,
0.9871647, 0.2013461, 1.214834, 0.9490196, 0, 1, 1,
0.9949176, 0.2717773, 3.337634, 0.9568627, 0, 1, 1,
0.9952449, -0.8496235, 1.425194, 0.9607843, 0, 1, 1,
1.002391, 1.923811, 1.130202, 0.9686275, 0, 1, 1,
1.00251, -0.5766435, 3.277179, 0.972549, 0, 1, 1,
1.003368, 0.4654397, -0.1522155, 0.9803922, 0, 1, 1,
1.009921, -0.4456246, 2.309799, 0.9843137, 0, 1, 1,
1.016196, -0.8087113, 2.307817, 0.9921569, 0, 1, 1,
1.019925, 1.014918, 0.05444708, 0.9960784, 0, 1, 1,
1.021651, 0.5006974, -0.2054515, 1, 0, 0.9960784, 1,
1.025734, -1.137085, 1.432678, 1, 0, 0.9882353, 1,
1.028269, 0.8559383, 2.176885, 1, 0, 0.9843137, 1,
1.029675, -0.06169849, -0.5532937, 1, 0, 0.9764706, 1,
1.034179, 0.8873862, -1.094635, 1, 0, 0.972549, 1,
1.041054, 1.253827, 0.2293558, 1, 0, 0.9647059, 1,
1.041614, 0.7833728, 0.3480321, 1, 0, 0.9607843, 1,
1.043165, 1.096681, -1.168429, 1, 0, 0.9529412, 1,
1.044576, -0.7184808, 2.533497, 1, 0, 0.9490196, 1,
1.044761, -1.040051, 1.30427, 1, 0, 0.9411765, 1,
1.046874, -0.6772977, 0.07015801, 1, 0, 0.9372549, 1,
1.048646, 1.906564, 2.30886, 1, 0, 0.9294118, 1,
1.049078, 1.516208, 1.095883, 1, 0, 0.9254902, 1,
1.061488, -0.8356664, 0.3265649, 1, 0, 0.9176471, 1,
1.065642, -0.6578584, 1.877309, 1, 0, 0.9137255, 1,
1.068731, -0.1379448, 2.93581, 1, 0, 0.9058824, 1,
1.076548, -0.6786863, 2.881681, 1, 0, 0.9019608, 1,
1.079304, 2.704127, 1.208371, 1, 0, 0.8941177, 1,
1.082054, 0.3397086, 0.7978242, 1, 0, 0.8862745, 1,
1.082979, 0.1215731, 0.6703755, 1, 0, 0.8823529, 1,
1.08746, 0.2612768, 2.182724, 1, 0, 0.8745098, 1,
1.090107, -1.28187, 2.827061, 1, 0, 0.8705882, 1,
1.094614, -0.1559159, 1.850683, 1, 0, 0.8627451, 1,
1.095486, -0.8269463, 1.131611, 1, 0, 0.8588235, 1,
1.112067, 0.08952348, 0.7461174, 1, 0, 0.8509804, 1,
1.125076, -1.223589, 3.378844, 1, 0, 0.8470588, 1,
1.132695, -1.207397, 1.459571, 1, 0, 0.8392157, 1,
1.135348, 1.8422, -1.118618, 1, 0, 0.8352941, 1,
1.146923, -0.4360937, 1.981181, 1, 0, 0.827451, 1,
1.155467, 1.989487, 2.074917, 1, 0, 0.8235294, 1,
1.158042, 1.46496, 3.263736, 1, 0, 0.8156863, 1,
1.15878, -1.64692, 3.084941, 1, 0, 0.8117647, 1,
1.160989, -0.4455887, 3.398822, 1, 0, 0.8039216, 1,
1.172199, -0.07829104, 3.155492, 1, 0, 0.7960784, 1,
1.180245, -0.4493304, 1.735999, 1, 0, 0.7921569, 1,
1.180658, -1.144522, 3.0492, 1, 0, 0.7843137, 1,
1.182576, -1.475431, 2.886954, 1, 0, 0.7803922, 1,
1.191743, -0.7308918, 0.8259103, 1, 0, 0.772549, 1,
1.192923, 1.105531, -1.279642, 1, 0, 0.7686275, 1,
1.193367, 1.234793, 0.600491, 1, 0, 0.7607843, 1,
1.196161, -1.252662, 0.758906, 1, 0, 0.7568628, 1,
1.206696, 1.422451, 2.331512, 1, 0, 0.7490196, 1,
1.213112, -0.1771308, 2.181968, 1, 0, 0.7450981, 1,
1.213951, 0.8529338, 2.235114, 1, 0, 0.7372549, 1,
1.215007, -0.6034507, 1.585774, 1, 0, 0.7333333, 1,
1.215936, -2.550308, 2.261435, 1, 0, 0.7254902, 1,
1.227502, -0.9418185, 1.228389, 1, 0, 0.7215686, 1,
1.23122, 0.03071242, 2.489601, 1, 0, 0.7137255, 1,
1.238822, -0.9296417, -0.1121564, 1, 0, 0.7098039, 1,
1.244228, 0.9590222, 0.2338484, 1, 0, 0.7019608, 1,
1.249773, -2.383207, 3.759918, 1, 0, 0.6941177, 1,
1.256337, -0.5304182, 2.011872, 1, 0, 0.6901961, 1,
1.258973, 0.3478556, 1.819842, 1, 0, 0.682353, 1,
1.2621, 0.4799827, 1.034115, 1, 0, 0.6784314, 1,
1.270297, 0.069811, 2.749259, 1, 0, 0.6705883, 1,
1.272062, -0.8375483, 3.043068, 1, 0, 0.6666667, 1,
1.27487, -0.4941496, 1.837867, 1, 0, 0.6588235, 1,
1.27517, -2.19738, 2.637422, 1, 0, 0.654902, 1,
1.275377, 1.438146, 0.4053785, 1, 0, 0.6470588, 1,
1.27961, 0.4002595, 1.246482, 1, 0, 0.6431373, 1,
1.285333, 0.9873817, 1.072575, 1, 0, 0.6352941, 1,
1.29733, 0.8233424, 1.311302, 1, 0, 0.6313726, 1,
1.299974, -0.2330854, 0.3691697, 1, 0, 0.6235294, 1,
1.300958, -0.9289068, 0.6660749, 1, 0, 0.6196079, 1,
1.303973, 1.177564, 2.93799, 1, 0, 0.6117647, 1,
1.307668, 0.4083653, 0.2402179, 1, 0, 0.6078432, 1,
1.319403, 0.265101, 1.457358, 1, 0, 0.6, 1,
1.324425, 0.8489308, 0.9118728, 1, 0, 0.5921569, 1,
1.334575, -0.04686645, 1.274689, 1, 0, 0.5882353, 1,
1.336242, -1.087898, 2.541063, 1, 0, 0.5803922, 1,
1.338617, -1.04885, 1.855072, 1, 0, 0.5764706, 1,
1.344898, 1.512781, 0.7668582, 1, 0, 0.5686275, 1,
1.348618, -0.6488314, 3.577965, 1, 0, 0.5647059, 1,
1.368182, -0.3992818, 2.067192, 1, 0, 0.5568628, 1,
1.381074, 0.1403326, 2.01889, 1, 0, 0.5529412, 1,
1.38223, 0.9168079, 0.4292471, 1, 0, 0.5450981, 1,
1.400423, 0.4679799, 1.917048, 1, 0, 0.5411765, 1,
1.407641, -0.5873732, 2.24894, 1, 0, 0.5333334, 1,
1.410309, -0.8054693, 1.968839, 1, 0, 0.5294118, 1,
1.411218, 0.3715518, 2.567568, 1, 0, 0.5215687, 1,
1.413083, -0.3794006, 1.121642, 1, 0, 0.5176471, 1,
1.422867, -1.514924, 3.270656, 1, 0, 0.509804, 1,
1.42557, 0.08329381, -0.2231974, 1, 0, 0.5058824, 1,
1.441905, -0.3926014, 1.65291, 1, 0, 0.4980392, 1,
1.447398, 0.5242837, 0.3140537, 1, 0, 0.4901961, 1,
1.449257, 1.173904, -1.555821, 1, 0, 0.4862745, 1,
1.450324, -0.9007789, 4.040068, 1, 0, 0.4784314, 1,
1.452671, 1.253905, 0.7032753, 1, 0, 0.4745098, 1,
1.460356, -1.125209, 1.831922, 1, 0, 0.4666667, 1,
1.468504, 0.236857, 2.425363, 1, 0, 0.4627451, 1,
1.482424, -0.3593169, 2.506884, 1, 0, 0.454902, 1,
1.485149, 0.641717, 1.381459, 1, 0, 0.4509804, 1,
1.494381, 0.9176117, 1.896893, 1, 0, 0.4431373, 1,
1.500413, -0.1853491, 1.531728, 1, 0, 0.4392157, 1,
1.502816, -0.2070211, 2.359315, 1, 0, 0.4313726, 1,
1.503703, -0.3151425, 0.7483065, 1, 0, 0.427451, 1,
1.504509, 0.6702534, 0.9870781, 1, 0, 0.4196078, 1,
1.505884, -0.6053003, 3.699384, 1, 0, 0.4156863, 1,
1.509118, -0.6709552, 2.2814, 1, 0, 0.4078431, 1,
1.51948, -1.170197, 2.216217, 1, 0, 0.4039216, 1,
1.534036, 1.908416, 2.21584, 1, 0, 0.3960784, 1,
1.546741, -0.5603317, 2.265512, 1, 0, 0.3882353, 1,
1.547691, 0.9591994, -0.7725607, 1, 0, 0.3843137, 1,
1.563611, 0.5504317, 1.468837, 1, 0, 0.3764706, 1,
1.573318, 0.1284828, 1.370964, 1, 0, 0.372549, 1,
1.577912, 0.8748506, 0.5379457, 1, 0, 0.3647059, 1,
1.594061, -0.5032626, 1.36515, 1, 0, 0.3607843, 1,
1.616398, -0.2056361, -0.9579765, 1, 0, 0.3529412, 1,
1.623182, 0.8534532, 1.037117, 1, 0, 0.3490196, 1,
1.63697, -1.450482, 1.665563, 1, 0, 0.3411765, 1,
1.665139, -0.2703931, 1.902635, 1, 0, 0.3372549, 1,
1.677629, 0.9942505, 0.9599151, 1, 0, 0.3294118, 1,
1.686606, -1.53165, 2.028166, 1, 0, 0.3254902, 1,
1.690341, 1.315497, 1.009818, 1, 0, 0.3176471, 1,
1.697941, -0.1133693, 2.206342, 1, 0, 0.3137255, 1,
1.706697, 1.413111, -0.8167178, 1, 0, 0.3058824, 1,
1.724361, -0.9161489, 4.601618, 1, 0, 0.2980392, 1,
1.725595, 0.1959308, 1.514599, 1, 0, 0.2941177, 1,
1.743664, -0.2575044, 2.128131, 1, 0, 0.2862745, 1,
1.747992, 0.118702, 2.129737, 1, 0, 0.282353, 1,
1.770645, -1.405035, 1.62449, 1, 0, 0.2745098, 1,
1.779389, -1.771607, 2.716209, 1, 0, 0.2705882, 1,
1.786093, -0.8298941, 1.876745, 1, 0, 0.2627451, 1,
1.788193, -0.3587689, 0.9547278, 1, 0, 0.2588235, 1,
1.797438, 1.797071, 0.5456213, 1, 0, 0.2509804, 1,
1.800094, -1.280483, 4.052052, 1, 0, 0.2470588, 1,
1.81333, -1.607117, 2.298337, 1, 0, 0.2392157, 1,
1.837278, 0.8721874, 2.084936, 1, 0, 0.2352941, 1,
1.87639, -0.265253, 2.326018, 1, 0, 0.227451, 1,
1.891328, 0.293544, 1.757061, 1, 0, 0.2235294, 1,
1.90811, -1.694485, 4.023475, 1, 0, 0.2156863, 1,
1.908355, 1.06701, -0.1484395, 1, 0, 0.2117647, 1,
1.925999, 1.417182, 0.5706461, 1, 0, 0.2039216, 1,
1.929891, -0.5868766, 1.836806, 1, 0, 0.1960784, 1,
1.931363, 0.5714435, 1.210978, 1, 0, 0.1921569, 1,
1.935028, 1.713433, 1.908114, 1, 0, 0.1843137, 1,
1.939917, -0.2046409, 2.616714, 1, 0, 0.1803922, 1,
1.945942, 1.750949, -0.2966867, 1, 0, 0.172549, 1,
1.965663, -0.9482855, 2.202133, 1, 0, 0.1686275, 1,
1.977144, -0.5175252, 0.6453452, 1, 0, 0.1607843, 1,
2.007145, 0.6384438, -0.1940488, 1, 0, 0.1568628, 1,
2.042456, 0.9679316, 1.163139, 1, 0, 0.1490196, 1,
2.062721, 2.211635, -0.02405354, 1, 0, 0.145098, 1,
2.157503, 0.3307775, 1.683904, 1, 0, 0.1372549, 1,
2.162019, 1.622507, 1.257784, 1, 0, 0.1333333, 1,
2.24507, -1.168234, 1.941226, 1, 0, 0.1254902, 1,
2.283296, 1.309182, 3.201196, 1, 0, 0.1215686, 1,
2.299373, 0.5016903, 1.579072, 1, 0, 0.1137255, 1,
2.321512, -0.2359709, 3.755054, 1, 0, 0.1098039, 1,
2.332392, -0.4854653, 1.134748, 1, 0, 0.1019608, 1,
2.34898, 0.2880916, 1.271281, 1, 0, 0.09411765, 1,
2.357844, 0.5622225, 1.204541, 1, 0, 0.09019608, 1,
2.376796, 0.1874144, 0.1216483, 1, 0, 0.08235294, 1,
2.383729, -0.7816405, 2.659194, 1, 0, 0.07843138, 1,
2.392317, 0.3585903, 1.276184, 1, 0, 0.07058824, 1,
2.440571, -2.155993, 3.491616, 1, 0, 0.06666667, 1,
2.481902, 0.2623357, 1.978108, 1, 0, 0.05882353, 1,
2.541015, -0.06376234, 2.165016, 1, 0, 0.05490196, 1,
2.567028, 1.158792, 0.5070668, 1, 0, 0.04705882, 1,
2.632811, -1.428317, 2.700313, 1, 0, 0.04313726, 1,
2.676348, 2.703595, -0.7410623, 1, 0, 0.03529412, 1,
2.750912, -0.6129731, 1.35594, 1, 0, 0.03137255, 1,
2.930968, 1.138884, 0.1075092, 1, 0, 0.02352941, 1,
2.95789, 1.555308, 0.516706, 1, 0, 0.01960784, 1,
3.031646, -2.888968, 2.846792, 1, 0, 0.01176471, 1,
3.124585, -0.3874241, 2.736166, 1, 0, 0.007843138, 1
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
0.0243547, -4.989617, -7.386419, 0, -0.5, 0.5, 0.5,
0.0243547, -4.989617, -7.386419, 1, -0.5, 0.5, 0.5,
0.0243547, -4.989617, -7.386419, 1, 1.5, 0.5, 0.5,
0.0243547, -4.989617, -7.386419, 0, 1.5, 0.5, 0.5
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
-4.126853, -0.4598286, -7.386419, 0, -0.5, 0.5, 0.5,
-4.126853, -0.4598286, -7.386419, 1, -0.5, 0.5, 0.5,
-4.126853, -0.4598286, -7.386419, 1, 1.5, 0.5, 0.5,
-4.126853, -0.4598286, -7.386419, 0, 1.5, 0.5, 0.5
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
-4.126853, -4.989617, -0.1780469, 0, -0.5, 0.5, 0.5,
-4.126853, -4.989617, -0.1780469, 1, -0.5, 0.5, 0.5,
-4.126853, -4.989617, -0.1780469, 1, 1.5, 0.5, 0.5,
-4.126853, -4.989617, -0.1780469, 0, 1.5, 0.5, 0.5
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
-3, -3.944281, -5.722949,
3, -3.944281, -5.722949,
-3, -3.944281, -5.722949,
-3, -4.118504, -6.000194,
-2, -3.944281, -5.722949,
-2, -4.118504, -6.000194,
-1, -3.944281, -5.722949,
-1, -4.118504, -6.000194,
0, -3.944281, -5.722949,
0, -4.118504, -6.000194,
1, -3.944281, -5.722949,
1, -4.118504, -6.000194,
2, -3.944281, -5.722949,
2, -4.118504, -6.000194,
3, -3.944281, -5.722949,
3, -4.118504, -6.000194
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
-3, -4.466949, -6.554684, 0, -0.5, 0.5, 0.5,
-3, -4.466949, -6.554684, 1, -0.5, 0.5, 0.5,
-3, -4.466949, -6.554684, 1, 1.5, 0.5, 0.5,
-3, -4.466949, -6.554684, 0, 1.5, 0.5, 0.5,
-2, -4.466949, -6.554684, 0, -0.5, 0.5, 0.5,
-2, -4.466949, -6.554684, 1, -0.5, 0.5, 0.5,
-2, -4.466949, -6.554684, 1, 1.5, 0.5, 0.5,
-2, -4.466949, -6.554684, 0, 1.5, 0.5, 0.5,
-1, -4.466949, -6.554684, 0, -0.5, 0.5, 0.5,
-1, -4.466949, -6.554684, 1, -0.5, 0.5, 0.5,
-1, -4.466949, -6.554684, 1, 1.5, 0.5, 0.5,
-1, -4.466949, -6.554684, 0, 1.5, 0.5, 0.5,
0, -4.466949, -6.554684, 0, -0.5, 0.5, 0.5,
0, -4.466949, -6.554684, 1, -0.5, 0.5, 0.5,
0, -4.466949, -6.554684, 1, 1.5, 0.5, 0.5,
0, -4.466949, -6.554684, 0, 1.5, 0.5, 0.5,
1, -4.466949, -6.554684, 0, -0.5, 0.5, 0.5,
1, -4.466949, -6.554684, 1, -0.5, 0.5, 0.5,
1, -4.466949, -6.554684, 1, 1.5, 0.5, 0.5,
1, -4.466949, -6.554684, 0, 1.5, 0.5, 0.5,
2, -4.466949, -6.554684, 0, -0.5, 0.5, 0.5,
2, -4.466949, -6.554684, 1, -0.5, 0.5, 0.5,
2, -4.466949, -6.554684, 1, 1.5, 0.5, 0.5,
2, -4.466949, -6.554684, 0, 1.5, 0.5, 0.5,
3, -4.466949, -6.554684, 0, -0.5, 0.5, 0.5,
3, -4.466949, -6.554684, 1, -0.5, 0.5, 0.5,
3, -4.466949, -6.554684, 1, 1.5, 0.5, 0.5,
3, -4.466949, -6.554684, 0, 1.5, 0.5, 0.5
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
-3.168882, -3, -5.722949,
-3.168882, 2, -5.722949,
-3.168882, -3, -5.722949,
-3.328544, -3, -6.000194,
-3.168882, -2, -5.722949,
-3.328544, -2, -6.000194,
-3.168882, -1, -5.722949,
-3.328544, -1, -6.000194,
-3.168882, 0, -5.722949,
-3.328544, 0, -6.000194,
-3.168882, 1, -5.722949,
-3.328544, 1, -6.000194,
-3.168882, 2, -5.722949,
-3.328544, 2, -6.000194
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
-3.647868, -3, -6.554684, 0, -0.5, 0.5, 0.5,
-3.647868, -3, -6.554684, 1, -0.5, 0.5, 0.5,
-3.647868, -3, -6.554684, 1, 1.5, 0.5, 0.5,
-3.647868, -3, -6.554684, 0, 1.5, 0.5, 0.5,
-3.647868, -2, -6.554684, 0, -0.5, 0.5, 0.5,
-3.647868, -2, -6.554684, 1, -0.5, 0.5, 0.5,
-3.647868, -2, -6.554684, 1, 1.5, 0.5, 0.5,
-3.647868, -2, -6.554684, 0, 1.5, 0.5, 0.5,
-3.647868, -1, -6.554684, 0, -0.5, 0.5, 0.5,
-3.647868, -1, -6.554684, 1, -0.5, 0.5, 0.5,
-3.647868, -1, -6.554684, 1, 1.5, 0.5, 0.5,
-3.647868, -1, -6.554684, 0, 1.5, 0.5, 0.5,
-3.647868, 0, -6.554684, 0, -0.5, 0.5, 0.5,
-3.647868, 0, -6.554684, 1, -0.5, 0.5, 0.5,
-3.647868, 0, -6.554684, 1, 1.5, 0.5, 0.5,
-3.647868, 0, -6.554684, 0, 1.5, 0.5, 0.5,
-3.647868, 1, -6.554684, 0, -0.5, 0.5, 0.5,
-3.647868, 1, -6.554684, 1, -0.5, 0.5, 0.5,
-3.647868, 1, -6.554684, 1, 1.5, 0.5, 0.5,
-3.647868, 1, -6.554684, 0, 1.5, 0.5, 0.5,
-3.647868, 2, -6.554684, 0, -0.5, 0.5, 0.5,
-3.647868, 2, -6.554684, 1, -0.5, 0.5, 0.5,
-3.647868, 2, -6.554684, 1, 1.5, 0.5, 0.5,
-3.647868, 2, -6.554684, 0, 1.5, 0.5, 0.5
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
-3.168882, -3.944281, -4,
-3.168882, -3.944281, 4,
-3.168882, -3.944281, -4,
-3.328544, -4.118504, -4,
-3.168882, -3.944281, -2,
-3.328544, -4.118504, -2,
-3.168882, -3.944281, 0,
-3.328544, -4.118504, 0,
-3.168882, -3.944281, 2,
-3.328544, -4.118504, 2,
-3.168882, -3.944281, 4,
-3.328544, -4.118504, 4
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
-3.647868, -4.466949, -4, 0, -0.5, 0.5, 0.5,
-3.647868, -4.466949, -4, 1, -0.5, 0.5, 0.5,
-3.647868, -4.466949, -4, 1, 1.5, 0.5, 0.5,
-3.647868, -4.466949, -4, 0, 1.5, 0.5, 0.5,
-3.647868, -4.466949, -2, 0, -0.5, 0.5, 0.5,
-3.647868, -4.466949, -2, 1, -0.5, 0.5, 0.5,
-3.647868, -4.466949, -2, 1, 1.5, 0.5, 0.5,
-3.647868, -4.466949, -2, 0, 1.5, 0.5, 0.5,
-3.647868, -4.466949, 0, 0, -0.5, 0.5, 0.5,
-3.647868, -4.466949, 0, 1, -0.5, 0.5, 0.5,
-3.647868, -4.466949, 0, 1, 1.5, 0.5, 0.5,
-3.647868, -4.466949, 0, 0, 1.5, 0.5, 0.5,
-3.647868, -4.466949, 2, 0, -0.5, 0.5, 0.5,
-3.647868, -4.466949, 2, 1, -0.5, 0.5, 0.5,
-3.647868, -4.466949, 2, 1, 1.5, 0.5, 0.5,
-3.647868, -4.466949, 2, 0, 1.5, 0.5, 0.5,
-3.647868, -4.466949, 4, 0, -0.5, 0.5, 0.5,
-3.647868, -4.466949, 4, 1, -0.5, 0.5, 0.5,
-3.647868, -4.466949, 4, 1, 1.5, 0.5, 0.5,
-3.647868, -4.466949, 4, 0, 1.5, 0.5, 0.5
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
-3.168882, -3.944281, -5.722949,
-3.168882, 3.024624, -5.722949,
-3.168882, -3.944281, 5.366855,
-3.168882, 3.024624, 5.366855,
-3.168882, -3.944281, -5.722949,
-3.168882, -3.944281, 5.366855,
-3.168882, 3.024624, -5.722949,
-3.168882, 3.024624, 5.366855,
-3.168882, -3.944281, -5.722949,
3.217592, -3.944281, -5.722949,
-3.168882, -3.944281, 5.366855,
3.217592, -3.944281, 5.366855,
-3.168882, 3.024624, -5.722949,
3.217592, 3.024624, -5.722949,
-3.168882, 3.024624, 5.366855,
3.217592, 3.024624, 5.366855,
3.217592, -3.944281, -5.722949,
3.217592, 3.024624, -5.722949,
3.217592, -3.944281, 5.366855,
3.217592, 3.024624, 5.366855,
3.217592, -3.944281, -5.722949,
3.217592, -3.944281, 5.366855,
3.217592, 3.024624, -5.722949,
3.217592, 3.024624, 5.366855
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
var radius = 7.781041;
var distance = 34.61873;
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
mvMatrix.translate( -0.0243547, 0.4598286, 0.1780469 );
mvMatrix.scale( 1.317318, 1.207222, 0.7586261 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.61873);
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
gamma-butyrolactone<-read.table("gamma-butyrolactone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-gamma-butyrolactone$V2
```

```
## Error in eval(expr, envir, enclos): object 'butyrolactone' not found
```

```r
y<-gamma-butyrolactone$V3
```

```
## Error in eval(expr, envir, enclos): object 'butyrolactone' not found
```

```r
z<-gamma-butyrolactone$V4
```

```
## Error in eval(expr, envir, enclos): object 'butyrolactone' not found
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
-3.075875, 0.3690785, -1.658375, 0, 0, 1, 1, 1,
-2.662786, -0.4163626, -2.620853, 1, 0, 0, 1, 1,
-2.58233, 0.8317804, -2.85571, 1, 0, 0, 1, 1,
-2.554092, 0.0289115, -2.160105, 1, 0, 0, 1, 1,
-2.554003, 0.9768627, -0.5205233, 1, 0, 0, 1, 1,
-2.551005, -0.575478, -2.692119, 1, 0, 0, 1, 1,
-2.536417, 0.4576595, -2.136233, 0, 0, 0, 1, 1,
-2.4959, -0.6577897, -2.735995, 0, 0, 0, 1, 1,
-2.373568, -1.60083, -1.113044, 0, 0, 0, 1, 1,
-2.339512, 0.5608241, -0.9944413, 0, 0, 0, 1, 1,
-2.32868, -0.4641264, -2.712863, 0, 0, 0, 1, 1,
-2.319288, 0.1693106, -2.196428, 0, 0, 0, 1, 1,
-2.279798, 1.173419, -1.124842, 0, 0, 0, 1, 1,
-2.249781, 0.08524073, -1.354682, 1, 1, 1, 1, 1,
-2.216549, 0.1498985, -1.70457, 1, 1, 1, 1, 1,
-2.211945, -0.7515708, -1.576324, 1, 1, 1, 1, 1,
-2.179022, -1.400052, -2.608931, 1, 1, 1, 1, 1,
-2.156501, -0.5067629, -1.844468, 1, 1, 1, 1, 1,
-2.090925, 0.5307116, 1.388808, 1, 1, 1, 1, 1,
-2.075544, -0.9699563, -2.400003, 1, 1, 1, 1, 1,
-2.064454, 0.6737311, -0.7857348, 1, 1, 1, 1, 1,
-2.048442, -0.7989147, -0.9200661, 1, 1, 1, 1, 1,
-2.015892, 0.1915174, -1.772173, 1, 1, 1, 1, 1,
-1.990175, 1.412003, -0.8817651, 1, 1, 1, 1, 1,
-1.980443, 0.6530379, -1.338654, 1, 1, 1, 1, 1,
-1.945938, 0.6636937, -1.234548, 1, 1, 1, 1, 1,
-1.92392, -0.686246, -0.8514701, 1, 1, 1, 1, 1,
-1.922278, 0.5539138, -1.968114, 1, 1, 1, 1, 1,
-1.91362, 1.540688, 0.5585202, 0, 0, 1, 1, 1,
-1.895633, -0.7907727, -2.08787, 1, 0, 0, 1, 1,
-1.891957, -1.208618, -3.634711, 1, 0, 0, 1, 1,
-1.890914, 1.177595, -1.762505, 1, 0, 0, 1, 1,
-1.890686, 0.9715071, -1.084488, 1, 0, 0, 1, 1,
-1.862604, -0.5894128, -2.612214, 1, 0, 0, 1, 1,
-1.85669, 0.6178769, -0.8982105, 0, 0, 0, 1, 1,
-1.845572, -0.240444, -3.339089, 0, 0, 0, 1, 1,
-1.830019, 1.241074, 0.8026808, 0, 0, 0, 1, 1,
-1.826398, -1.03036, -1.048891, 0, 0, 0, 1, 1,
-1.812748, -2.279841, -1.299054, 0, 0, 0, 1, 1,
-1.763431, -0.4653944, -0.6385518, 0, 0, 0, 1, 1,
-1.758539, 0.610626, -1.744972, 0, 0, 0, 1, 1,
-1.74119, -1.55743, -2.077818, 1, 1, 1, 1, 1,
-1.734978, 0.2928183, -1.073144, 1, 1, 1, 1, 1,
-1.723447, 0.7254996, -0.8489229, 1, 1, 1, 1, 1,
-1.715221, 0.1660342, 1.199067, 1, 1, 1, 1, 1,
-1.695113, -0.7126862, -2.557885, 1, 1, 1, 1, 1,
-1.668313, -0.7009308, -1.536689, 1, 1, 1, 1, 1,
-1.6617, -1.166601, -2.296116, 1, 1, 1, 1, 1,
-1.659544, -0.4610507, -0.5307764, 1, 1, 1, 1, 1,
-1.643891, -0.3984649, -1.464876, 1, 1, 1, 1, 1,
-1.641449, 1.104652, -3.163216, 1, 1, 1, 1, 1,
-1.625331, 0.6058744, -1.299001, 1, 1, 1, 1, 1,
-1.599396, -1.311725, -1.428468, 1, 1, 1, 1, 1,
-1.572236, -0.3616402, -1.584459, 1, 1, 1, 1, 1,
-1.560652, -0.2377825, -1.89176, 1, 1, 1, 1, 1,
-1.559631, 1.20074, 0.1856492, 1, 1, 1, 1, 1,
-1.556371, -0.326064, -1.397933, 0, 0, 1, 1, 1,
-1.551286, -1.092478, -3.267166, 1, 0, 0, 1, 1,
-1.516483, -0.9680714, -3.365342, 1, 0, 0, 1, 1,
-1.51239, 0.9445771, -1.526606, 1, 0, 0, 1, 1,
-1.512079, 1.618271, 0.4750201, 1, 0, 0, 1, 1,
-1.489996, 0.2502653, -0.5700701, 1, 0, 0, 1, 1,
-1.480569, -0.2949381, -1.161511, 0, 0, 0, 1, 1,
-1.474764, -0.3049972, -2.889187, 0, 0, 0, 1, 1,
-1.46411, -2.413083, -1.564093, 0, 0, 0, 1, 1,
-1.463829, -1.903314, -1.773099, 0, 0, 0, 1, 1,
-1.458531, 1.14738, 0.3918568, 0, 0, 0, 1, 1,
-1.453676, 1.336657, -0.8298303, 0, 0, 0, 1, 1,
-1.447907, -0.1957018, -1.542368, 0, 0, 0, 1, 1,
-1.430944, 1.156391, -1.728223, 1, 1, 1, 1, 1,
-1.427655, -1.48781, -2.064467, 1, 1, 1, 1, 1,
-1.415731, 0.2196217, -1.357416, 1, 1, 1, 1, 1,
-1.393917, -0.03876673, -1.235622, 1, 1, 1, 1, 1,
-1.382038, 1.12413, -2.933077, 1, 1, 1, 1, 1,
-1.372778, 0.04638227, -0.3307301, 1, 1, 1, 1, 1,
-1.362639, 0.4456718, -2.266645, 1, 1, 1, 1, 1,
-1.349104, 0.4891331, -1.696463, 1, 1, 1, 1, 1,
-1.333522, 1.151639, 0.4371737, 1, 1, 1, 1, 1,
-1.332688, 0.2688382, -3.278918, 1, 1, 1, 1, 1,
-1.319256, -0.7037166, -3.36523, 1, 1, 1, 1, 1,
-1.310934, 0.5175526, -2.43504, 1, 1, 1, 1, 1,
-1.309421, -0.5343261, -3.799111, 1, 1, 1, 1, 1,
-1.309145, -0.3561021, -0.2918368, 1, 1, 1, 1, 1,
-1.304345, 0.4194987, -1.58569, 1, 1, 1, 1, 1,
-1.302366, -0.1067671, -1.358852, 0, 0, 1, 1, 1,
-1.301358, 1.404967, 1.851338, 1, 0, 0, 1, 1,
-1.289115, -0.7943146, -0.9922532, 1, 0, 0, 1, 1,
-1.287137, -0.6977859, -3.8697, 1, 0, 0, 1, 1,
-1.282929, 2.098967, -0.1358974, 1, 0, 0, 1, 1,
-1.280603, 0.1862234, 0.1080253, 1, 0, 0, 1, 1,
-1.273741, -0.6163195, -2.908559, 0, 0, 0, 1, 1,
-1.267784, -1.185504, -2.625782, 0, 0, 0, 1, 1,
-1.259147, 0.1929159, -3.006866, 0, 0, 0, 1, 1,
-1.248645, -1.835932, -3.499497, 0, 0, 0, 1, 1,
-1.247377, -1.970136, -2.144549, 0, 0, 0, 1, 1,
-1.247014, -0.4511411, 1.022318, 0, 0, 0, 1, 1,
-1.24418, -0.1329211, 0.06630529, 0, 0, 0, 1, 1,
-1.243456, 0.4730382, -0.3826959, 1, 1, 1, 1, 1,
-1.243147, -2.462782, -3.80776, 1, 1, 1, 1, 1,
-1.2417, 0.650011, -1.015286, 1, 1, 1, 1, 1,
-1.225176, 1.230673, -2.248756, 1, 1, 1, 1, 1,
-1.209152, -0.1654438, -1.283711, 1, 1, 1, 1, 1,
-1.20683, -0.5464189, -2.240471, 1, 1, 1, 1, 1,
-1.203126, -0.4893763, -2.57377, 1, 1, 1, 1, 1,
-1.20235, 0.01397217, 0.2804109, 1, 1, 1, 1, 1,
-1.198861, 0.1220036, -2.4033, 1, 1, 1, 1, 1,
-1.187222, -0.5460252, -1.867222, 1, 1, 1, 1, 1,
-1.169711, 1.105434, -2.123298, 1, 1, 1, 1, 1,
-1.15677, 1.721944, -0.06446745, 1, 1, 1, 1, 1,
-1.155242, -0.1052186, -1.393993, 1, 1, 1, 1, 1,
-1.153387, 1.546765, -1.03282, 1, 1, 1, 1, 1,
-1.141996, -0.2028446, -2.495781, 1, 1, 1, 1, 1,
-1.140406, -0.1618577, -1.846177, 0, 0, 1, 1, 1,
-1.137088, 0.7758924, -1.630866, 1, 0, 0, 1, 1,
-1.133976, 0.9213988, -1.659076, 1, 0, 0, 1, 1,
-1.132431, 0.2197619, -1.379306, 1, 0, 0, 1, 1,
-1.130057, 0.06516637, -2.612492, 1, 0, 0, 1, 1,
-1.126689, 1.69834, -0.2161977, 1, 0, 0, 1, 1,
-1.121878, 0.6441754, 0.7479847, 0, 0, 0, 1, 1,
-1.116167, -0.4255873, -3.748186, 0, 0, 0, 1, 1,
-1.112893, 1.128194, -0.1690548, 0, 0, 0, 1, 1,
-1.112568, 0.00655297, -0.8204443, 0, 0, 0, 1, 1,
-1.109588, -0.7897775, -1.9439, 0, 0, 0, 1, 1,
-1.108956, 0.6011159, -1.600349, 0, 0, 0, 1, 1,
-1.101029, -0.2047189, 0.03531119, 0, 0, 0, 1, 1,
-1.100763, 0.1462767, -2.56986, 1, 1, 1, 1, 1,
-1.094504, 0.1570856, -2.885571, 1, 1, 1, 1, 1,
-1.091943, 1.015801, -1.077993, 1, 1, 1, 1, 1,
-1.075086, 0.1260393, -1.066693, 1, 1, 1, 1, 1,
-1.069304, -1.166219, -2.958654, 1, 1, 1, 1, 1,
-1.067473, -1.489856, -2.469337, 1, 1, 1, 1, 1,
-1.067294, -1.075752, -1.417469, 1, 1, 1, 1, 1,
-1.063483, -0.3272144, -0.3434356, 1, 1, 1, 1, 1,
-1.062547, 1.595951, -3.051506, 1, 1, 1, 1, 1,
-1.059451, 0.2978431, -0.2979276, 1, 1, 1, 1, 1,
-1.058378, 0.8534099, -1.148016, 1, 1, 1, 1, 1,
-1.049756, 0.3546289, -1.835109, 1, 1, 1, 1, 1,
-1.038685, 0.2326476, -0.2363665, 1, 1, 1, 1, 1,
-1.033967, 0.159793, -2.725484, 1, 1, 1, 1, 1,
-1.028875, -1.114138, -2.144527, 1, 1, 1, 1, 1,
-1.017182, 1.045175, 0.1067741, 0, 0, 1, 1, 1,
-1.014686, -0.8290507, -2.427279, 1, 0, 0, 1, 1,
-1.003968, 0.7546917, -1.205213, 1, 0, 0, 1, 1,
-0.9962928, -2.358232, -2.54554, 1, 0, 0, 1, 1,
-0.9948403, 0.3070125, -1.9802, 1, 0, 0, 1, 1,
-0.9922162, -0.4265257, -2.411487, 1, 0, 0, 1, 1,
-0.9920963, 0.02693783, -2.044195, 0, 0, 0, 1, 1,
-0.981575, 0.04179769, -1.669608, 0, 0, 0, 1, 1,
-0.9799796, 1.002562, -1.630834, 0, 0, 0, 1, 1,
-0.9784902, 0.05863274, -1.902341, 0, 0, 0, 1, 1,
-0.9649552, 0.2822073, -1.085658, 0, 0, 0, 1, 1,
-0.9631038, 0.8859672, -0.9562368, 0, 0, 0, 1, 1,
-0.9609324, 1.936416, 0.864912, 0, 0, 0, 1, 1,
-0.9550144, 0.1564693, -0.89743, 1, 1, 1, 1, 1,
-0.946539, 1.091286, -0.7846056, 1, 1, 1, 1, 1,
-0.942764, -0.5392794, -2.924316, 1, 1, 1, 1, 1,
-0.9402983, -0.1456518, -0.7196305, 1, 1, 1, 1, 1,
-0.9399205, -0.09826253, -1.496404, 1, 1, 1, 1, 1,
-0.9354475, -0.5049283, -2.952342, 1, 1, 1, 1, 1,
-0.9334878, 1.120645, -1.032913, 1, 1, 1, 1, 1,
-0.9292558, 0.2903793, -0.3631473, 1, 1, 1, 1, 1,
-0.9285055, -1.252079, -1.66772, 1, 1, 1, 1, 1,
-0.9282615, 0.1174777, -0.4445853, 1, 1, 1, 1, 1,
-0.9269456, -1.025504, -1.711326, 1, 1, 1, 1, 1,
-0.9258884, -0.3344307, 0.009780315, 1, 1, 1, 1, 1,
-0.925469, 0.4341109, 0.2307325, 1, 1, 1, 1, 1,
-0.9226656, -1.276672, -1.646802, 1, 1, 1, 1, 1,
-0.919241, 2.096082, -0.5291088, 1, 1, 1, 1, 1,
-0.9156243, 1.476549, -1.120419, 0, 0, 1, 1, 1,
-0.901764, 0.5239459, -1.140608, 1, 0, 0, 1, 1,
-0.8924122, -0.9932497, -3.286922, 1, 0, 0, 1, 1,
-0.8882126, -0.09433294, -0.86019, 1, 0, 0, 1, 1,
-0.8877476, 1.594142, -0.3465665, 1, 0, 0, 1, 1,
-0.8820924, -0.2642713, -2.212699, 1, 0, 0, 1, 1,
-0.8809035, 0.9932484, -1.349509, 0, 0, 0, 1, 1,
-0.8785166, 0.4523956, -1.625759, 0, 0, 0, 1, 1,
-0.8709542, -0.7712825, -1.79364, 0, 0, 0, 1, 1,
-0.863385, -0.7556567, -2.496501, 0, 0, 0, 1, 1,
-0.857851, 0.8795114, -0.7294016, 0, 0, 0, 1, 1,
-0.8578304, -1.026813, -3.75622, 0, 0, 0, 1, 1,
-0.8549024, -1.602461, -4.236861, 0, 0, 0, 1, 1,
-0.8543859, 1.740095, -0.6641548, 1, 1, 1, 1, 1,
-0.8534368, -0.8551028, -2.219534, 1, 1, 1, 1, 1,
-0.8481213, -1.020221, -0.7148678, 1, 1, 1, 1, 1,
-0.8473576, 0.04363674, -0.1267496, 1, 1, 1, 1, 1,
-0.847348, 0.303721, -1.286998, 1, 1, 1, 1, 1,
-0.8421767, 0.9313244, 0.5892138, 1, 1, 1, 1, 1,
-0.8382918, -0.7398825, -1.204275, 1, 1, 1, 1, 1,
-0.8350527, -0.3547715, -0.7272645, 1, 1, 1, 1, 1,
-0.8338285, -1.526046, -1.795399, 1, 1, 1, 1, 1,
-0.8316283, 0.311327, -1.588513, 1, 1, 1, 1, 1,
-0.815437, -0.7473444, -2.222504, 1, 1, 1, 1, 1,
-0.8099835, -0.656813, -1.976826, 1, 1, 1, 1, 1,
-0.8098865, 0.2995961, -1.087626, 1, 1, 1, 1, 1,
-0.8089676, -0.4989328, -0.8319479, 1, 1, 1, 1, 1,
-0.8065089, 1.010623, -0.394004, 1, 1, 1, 1, 1,
-0.8030387, 0.6679482, 0.1725304, 0, 0, 1, 1, 1,
-0.7973983, -0.1519036, -0.9309782, 1, 0, 0, 1, 1,
-0.7872339, 2.48913, 0.3180865, 1, 0, 0, 1, 1,
-0.7839716, -0.1889185, -2.150846, 1, 0, 0, 1, 1,
-0.7805889, -1.971425, -3.579024, 1, 0, 0, 1, 1,
-0.7755171, -2.375048, -3.622883, 1, 0, 0, 1, 1,
-0.7721359, 0.9562347, -2.439497, 0, 0, 0, 1, 1,
-0.7705787, 0.004454237, 0.1155173, 0, 0, 0, 1, 1,
-0.7703981, 0.2259129, -3.25687, 0, 0, 0, 1, 1,
-0.7694284, -1.298515, -2.413109, 0, 0, 0, 1, 1,
-0.767145, 1.501226, 0.0029977, 0, 0, 0, 1, 1,
-0.7510309, 1.472844, -1.550959, 0, 0, 0, 1, 1,
-0.7430202, 0.9064693, -1.447438, 0, 0, 0, 1, 1,
-0.7416182, 1.419996, -2.228248, 1, 1, 1, 1, 1,
-0.7400798, -1.937316, -3.23508, 1, 1, 1, 1, 1,
-0.7323983, 0.5334092, -1.820091, 1, 1, 1, 1, 1,
-0.7245774, 0.01733631, -1.959194, 1, 1, 1, 1, 1,
-0.724088, -0.6603535, -1.087818, 1, 1, 1, 1, 1,
-0.7177582, -0.4448327, -3.01587, 1, 1, 1, 1, 1,
-0.7176576, 1.803322, -0.8334683, 1, 1, 1, 1, 1,
-0.7168729, 0.004552113, -1.024301, 1, 1, 1, 1, 1,
-0.7111556, 0.407344, 0.5797793, 1, 1, 1, 1, 1,
-0.7107867, 1.550901, -0.259076, 1, 1, 1, 1, 1,
-0.7097692, -1.727078, -3.089241, 1, 1, 1, 1, 1,
-0.7059533, 1.019656, -1.438844, 1, 1, 1, 1, 1,
-0.7054847, -1.572973, -0.9950692, 1, 1, 1, 1, 1,
-0.7001482, -0.00417916, -2.074842, 1, 1, 1, 1, 1,
-0.6994979, 2.37504, 1.501867, 1, 1, 1, 1, 1,
-0.6977195, -1.58009, -3.546338, 0, 0, 1, 1, 1,
-0.6967701, 0.3496263, -2.163006, 1, 0, 0, 1, 1,
-0.6948219, -0.3853812, -2.111781, 1, 0, 0, 1, 1,
-0.6906978, 0.04681836, 0.05367246, 1, 0, 0, 1, 1,
-0.6904096, 0.4058503, -0.6065999, 1, 0, 0, 1, 1,
-0.6892379, 0.1745244, 0.6607611, 1, 0, 0, 1, 1,
-0.6883346, -1.051353, -3.862275, 0, 0, 0, 1, 1,
-0.6850156, 0.1490626, -3.308148, 0, 0, 0, 1, 1,
-0.6789911, -1.524617, -3.817332, 0, 0, 0, 1, 1,
-0.677287, -0.2632313, -2.163806, 0, 0, 0, 1, 1,
-0.6718285, 0.9382372, -0.9633248, 0, 0, 0, 1, 1,
-0.666577, 0.8914531, 0.02245941, 0, 0, 0, 1, 1,
-0.6661886, -1.043847, -3.288184, 0, 0, 0, 1, 1,
-0.6631602, 0.8891383, -1.55248, 1, 1, 1, 1, 1,
-0.6609938, -0.3113642, -2.624133, 1, 1, 1, 1, 1,
-0.6602471, 1.153862, 0.7299242, 1, 1, 1, 1, 1,
-0.6597922, 0.5797049, -1.9837, 1, 1, 1, 1, 1,
-0.6583791, -0.3655689, -1.270754, 1, 1, 1, 1, 1,
-0.6572133, 0.02904426, -0.4694075, 1, 1, 1, 1, 1,
-0.6568934, -0.1203837, -2.385588, 1, 1, 1, 1, 1,
-0.6550843, -0.6134721, -0.4711925, 1, 1, 1, 1, 1,
-0.6549569, -0.9942623, -3.906854, 1, 1, 1, 1, 1,
-0.6491177, 0.05438244, -4.006601, 1, 1, 1, 1, 1,
-0.6489331, 0.423707, -0.01240911, 1, 1, 1, 1, 1,
-0.6483516, 0.1838745, -0.9610972, 1, 1, 1, 1, 1,
-0.6358218, -1.794789, -2.752546, 1, 1, 1, 1, 1,
-0.6353865, 0.5722123, -0.2879874, 1, 1, 1, 1, 1,
-0.632008, 1.943044, 0.7615317, 1, 1, 1, 1, 1,
-0.6303329, 0.6525584, -0.2070218, 0, 0, 1, 1, 1,
-0.6300597, 1.258555, -0.4600386, 1, 0, 0, 1, 1,
-0.6267759, -0.06660508, -2.631562, 1, 0, 0, 1, 1,
-0.624392, 0.971875, -0.5814522, 1, 0, 0, 1, 1,
-0.6227571, 0.6563344, -0.7010872, 1, 0, 0, 1, 1,
-0.6170685, -0.3223539, -1.039587, 1, 0, 0, 1, 1,
-0.6155809, -1.02881, -3.264684, 0, 0, 0, 1, 1,
-0.6097172, 0.5502788, 0.03336275, 0, 0, 0, 1, 1,
-0.6068035, -1.116729, -2.695199, 0, 0, 0, 1, 1,
-0.6066064, 1.197954, -2.780645, 0, 0, 0, 1, 1,
-0.6029401, -0.9441856, -3.811009, 0, 0, 0, 1, 1,
-0.6016012, -0.7328368, -3.387582, 0, 0, 0, 1, 1,
-0.5958707, 0.4252236, -0.3037781, 0, 0, 0, 1, 1,
-0.5949721, 1.117971, 0.1706958, 1, 1, 1, 1, 1,
-0.5925624, 0.9984987, -0.5779172, 1, 1, 1, 1, 1,
-0.591915, 0.2842802, 0.5867098, 1, 1, 1, 1, 1,
-0.588465, -1.347931, -3.792639, 1, 1, 1, 1, 1,
-0.5819709, 0.8969988, -0.3682711, 1, 1, 1, 1, 1,
-0.5816829, -0.7948307, -3.249084, 1, 1, 1, 1, 1,
-0.57908, 1.203591, -1.596824, 1, 1, 1, 1, 1,
-0.5778013, 1.222541, -0.5331839, 1, 1, 1, 1, 1,
-0.5763839, 0.233869, -1.863232, 1, 1, 1, 1, 1,
-0.5752252, 1.110835, 0.5337594, 1, 1, 1, 1, 1,
-0.5731854, 0.5872641, -1.158278, 1, 1, 1, 1, 1,
-0.5728212, -0.534701, -2.453954, 1, 1, 1, 1, 1,
-0.5721768, 0.1500421, -1.225196, 1, 1, 1, 1, 1,
-0.567805, -1.662754, -3.594642, 1, 1, 1, 1, 1,
-0.5628265, -1.11883, -2.992205, 1, 1, 1, 1, 1,
-0.562748, -1.044849, -3.261397, 0, 0, 1, 1, 1,
-0.5623882, 0.6597186, 0.9477682, 1, 0, 0, 1, 1,
-0.5608619, -0.5115628, -3.029408, 1, 0, 0, 1, 1,
-0.5584953, -0.1198381, -1.322975, 1, 0, 0, 1, 1,
-0.5570696, -1.623605, -2.09071, 1, 0, 0, 1, 1,
-0.5545533, -0.6796253, -3.202504, 1, 0, 0, 1, 1,
-0.5469707, -0.03957301, -1.535266, 0, 0, 0, 1, 1,
-0.5455919, 0.6664569, -1.200531, 0, 0, 0, 1, 1,
-0.5397466, -0.7738636, -2.080218, 0, 0, 0, 1, 1,
-0.532863, 1.063264, 0.3263577, 0, 0, 0, 1, 1,
-0.5303645, -1.147646, -3.009562, 0, 0, 0, 1, 1,
-0.5276986, -0.3950306, -2.555752, 0, 0, 0, 1, 1,
-0.5254055, 0.9801258, 0.08060522, 0, 0, 0, 1, 1,
-0.5190322, 0.03335494, -1.105804, 1, 1, 1, 1, 1,
-0.5183866, -0.5305893, -3.540088, 1, 1, 1, 1, 1,
-0.5160973, 1.528537, 0.6292281, 1, 1, 1, 1, 1,
-0.5159405, 1.57777, -0.9159555, 1, 1, 1, 1, 1,
-0.5147792, 0.4490891, -0.627145, 1, 1, 1, 1, 1,
-0.5145429, -2.000932, -5.475548, 1, 1, 1, 1, 1,
-0.5083112, -0.7963665, -4.667167, 1, 1, 1, 1, 1,
-0.5069317, -1.595083, -4.573458, 1, 1, 1, 1, 1,
-0.5053597, -1.08556, -2.516333, 1, 1, 1, 1, 1,
-0.5041835, 1.113626, -1.129488, 1, 1, 1, 1, 1,
-0.5031474, 1.918365, -1.737068, 1, 1, 1, 1, 1,
-0.5004304, -0.9154176, -3.468436, 1, 1, 1, 1, 1,
-0.4986852, -1.222804, -3.100806, 1, 1, 1, 1, 1,
-0.4945485, -0.4845701, -2.323892, 1, 1, 1, 1, 1,
-0.4908835, -0.02089482, -0.4926285, 1, 1, 1, 1, 1,
-0.488425, -0.8791373, -2.549872, 0, 0, 1, 1, 1,
-0.4854324, -0.03222283, -1.228784, 1, 0, 0, 1, 1,
-0.4809181, -1.201894, -1.894683, 1, 0, 0, 1, 1,
-0.4796864, 0.9205538, 0.6799646, 1, 0, 0, 1, 1,
-0.4780769, -0.7978613, -2.244282, 1, 0, 0, 1, 1,
-0.4776834, 1.360756, -1.463829, 1, 0, 0, 1, 1,
-0.4742402, 0.1164003, -1.90012, 0, 0, 0, 1, 1,
-0.4735604, 1.27625, -0.2602183, 0, 0, 0, 1, 1,
-0.4730346, 2.349114, -1.758306, 0, 0, 0, 1, 1,
-0.4723146, -1.388996, -3.083143, 0, 0, 0, 1, 1,
-0.4720216, -0.6158608, -0.8255349, 0, 0, 0, 1, 1,
-0.4695801, 1.28598, -0.4439128, 0, 0, 0, 1, 1,
-0.4637676, 0.1856566, 0.1962388, 0, 0, 0, 1, 1,
-0.4610894, 0.7204126, -0.3984212, 1, 1, 1, 1, 1,
-0.4570219, 0.858219, -1.253474, 1, 1, 1, 1, 1,
-0.4564633, 0.5955681, -0.6825228, 1, 1, 1, 1, 1,
-0.4562733, -0.9294598, -1.503442, 1, 1, 1, 1, 1,
-0.4553435, 1.0524, -0.1227589, 1, 1, 1, 1, 1,
-0.4468556, 0.3965479, -2.733689, 1, 1, 1, 1, 1,
-0.4455648, 0.8329042, -0.5176064, 1, 1, 1, 1, 1,
-0.444921, 0.719592, -1.268025, 1, 1, 1, 1, 1,
-0.4411003, 0.9274558, 0.5876083, 1, 1, 1, 1, 1,
-0.4382021, -0.954639, -1.657492, 1, 1, 1, 1, 1,
-0.4378147, 0.9999657, -0.6748975, 1, 1, 1, 1, 1,
-0.4323841, 0.03809008, -3.270365, 1, 1, 1, 1, 1,
-0.4269678, -0.1727995, -1.946525, 1, 1, 1, 1, 1,
-0.4254555, 0.05062142, -2.701521, 1, 1, 1, 1, 1,
-0.4199553, -1.745649, -5.561447, 1, 1, 1, 1, 1,
-0.4195744, -0.2351765, -1.46004, 0, 0, 1, 1, 1,
-0.4122149, 0.756663, -2.331601, 1, 0, 0, 1, 1,
-0.4114925, -0.7799152, -1.005738, 1, 0, 0, 1, 1,
-0.4087774, -2.140878, -3.336169, 1, 0, 0, 1, 1,
-0.4084918, -0.4506072, -0.7735621, 1, 0, 0, 1, 1,
-0.4074201, -1.152012, -3.149005, 1, 0, 0, 1, 1,
-0.4060836, 0.6981097, -0.04221384, 0, 0, 0, 1, 1,
-0.4038817, 1.253221, 1.221047, 0, 0, 0, 1, 1,
-0.4037099, -0.3891392, -3.010684, 0, 0, 0, 1, 1,
-0.4035494, 0.2806783, -0.3041593, 0, 0, 0, 1, 1,
-0.4032555, 0.192044, -0.3529949, 0, 0, 0, 1, 1,
-0.4017032, -1.494251, -0.6756657, 0, 0, 0, 1, 1,
-0.3985535, 0.09055094, -2.009575, 0, 0, 0, 1, 1,
-0.3966886, 1.755458, -0.949163, 1, 1, 1, 1, 1,
-0.3959377, 1.109165, -1.253116, 1, 1, 1, 1, 1,
-0.3949275, 0.9979553, -0.3767557, 1, 1, 1, 1, 1,
-0.3946187, 0.210264, -1.203837, 1, 1, 1, 1, 1,
-0.3843534, 1.167091, -0.2115793, 1, 1, 1, 1, 1,
-0.3833887, 1.122886, 1.036366, 1, 1, 1, 1, 1,
-0.3760519, -0.2410778, -2.908669, 1, 1, 1, 1, 1,
-0.3711399, 0.9693221, 0.8277605, 1, 1, 1, 1, 1,
-0.3697206, 1.946586, -1.275736, 1, 1, 1, 1, 1,
-0.3686517, -0.4592515, -4.958051, 1, 1, 1, 1, 1,
-0.3675514, -1.768109, -3.617589, 1, 1, 1, 1, 1,
-0.3673617, 1.645072, 0.4040307, 1, 1, 1, 1, 1,
-0.3625917, 1.608217, -1.772122, 1, 1, 1, 1, 1,
-0.3557932, 0.440202, -0.3803671, 1, 1, 1, 1, 1,
-0.3551441, -1.014255, -2.392823, 1, 1, 1, 1, 1,
-0.3537413, -1.654138, -4.005853, 0, 0, 1, 1, 1,
-0.3536249, 1.678715, 0.290443, 1, 0, 0, 1, 1,
-0.351738, 1.403644, 0.8319234, 1, 0, 0, 1, 1,
-0.3514614, 0.4844954, -0.2555305, 1, 0, 0, 1, 1,
-0.3511513, 0.8183151, -1.871007, 1, 0, 0, 1, 1,
-0.3497876, -1.187853, -2.651151, 1, 0, 0, 1, 1,
-0.3476717, -1.100762, -2.82257, 0, 0, 0, 1, 1,
-0.3472323, 0.1344204, -1.317949, 0, 0, 0, 1, 1,
-0.342471, -0.1318565, -3.750239, 0, 0, 0, 1, 1,
-0.3390976, 0.5763382, -1.280432, 0, 0, 0, 1, 1,
-0.3349073, -0.5809226, -1.273417, 0, 0, 0, 1, 1,
-0.3236153, -0.7938097, -2.485205, 0, 0, 0, 1, 1,
-0.3221932, 0.609369, -0.3081935, 0, 0, 0, 1, 1,
-0.3205671, -1.82753, -3.124304, 1, 1, 1, 1, 1,
-0.3190067, -1.118552, -2.696292, 1, 1, 1, 1, 1,
-0.3186007, 0.3856116, -1.666435, 1, 1, 1, 1, 1,
-0.3115306, -0.2215562, -2.961783, 1, 1, 1, 1, 1,
-0.3058633, 0.1988805, -1.120272, 1, 1, 1, 1, 1,
-0.3046819, 0.3832747, -0.1408906, 1, 1, 1, 1, 1,
-0.3038911, -0.3786026, -2.674718, 1, 1, 1, 1, 1,
-0.2992557, -0.2135958, -2.626251, 1, 1, 1, 1, 1,
-0.2941213, -0.1578896, -1.615116, 1, 1, 1, 1, 1,
-0.2933088, 0.5073918, -1.422079, 1, 1, 1, 1, 1,
-0.2929532, -0.686513, -1.742991, 1, 1, 1, 1, 1,
-0.2925979, 2.390966, 0.5275531, 1, 1, 1, 1, 1,
-0.29115, -0.7124837, -2.63639, 1, 1, 1, 1, 1,
-0.2898498, -3.622901, -3.179838, 1, 1, 1, 1, 1,
-0.2792568, 0.8735921, -0.2042594, 1, 1, 1, 1, 1,
-0.2765184, 0.381598, 1.150519, 0, 0, 1, 1, 1,
-0.2696615, 0.6744846, -1.645167, 1, 0, 0, 1, 1,
-0.2696212, -0.1631712, -3.128994, 1, 0, 0, 1, 1,
-0.2674941, -0.5221462, -3.16567, 1, 0, 0, 1, 1,
-0.2669328, -0.5634006, -2.31597, 1, 0, 0, 1, 1,
-0.2608271, -0.8171585, -2.884522, 1, 0, 0, 1, 1,
-0.2597909, 1.253791, 0.9760225, 0, 0, 0, 1, 1,
-0.2577785, -0.8808179, -0.6584881, 0, 0, 0, 1, 1,
-0.255971, -1.186192, -2.581436, 0, 0, 0, 1, 1,
-0.2555289, -1.443851, -2.584352, 0, 0, 0, 1, 1,
-0.2536302, -0.1971428, -2.518125, 0, 0, 0, 1, 1,
-0.2499119, -0.8490611, -2.984517, 0, 0, 0, 1, 1,
-0.2458792, 0.5025092, -0.5890706, 0, 0, 0, 1, 1,
-0.2390029, 1.054053, -0.1687544, 1, 1, 1, 1, 1,
-0.2368567, 1.362426, 0.7985348, 1, 1, 1, 1, 1,
-0.2362105, -0.8303396, -3.998185, 1, 1, 1, 1, 1,
-0.2332719, 0.7726486, 0.6273351, 1, 1, 1, 1, 1,
-0.2250793, 0.9631481, 1.58133, 1, 1, 1, 1, 1,
-0.2237695, 0.6572124, 1.040111, 1, 1, 1, 1, 1,
-0.2227506, 0.7388721, 1.319902, 1, 1, 1, 1, 1,
-0.2205647, -1.681077, -3.798616, 1, 1, 1, 1, 1,
-0.2183694, 1.118177, -0.3603247, 1, 1, 1, 1, 1,
-0.2075999, 0.7289546, -1.366209, 1, 1, 1, 1, 1,
-0.2030348, -1.308437, -4.083297, 1, 1, 1, 1, 1,
-0.2028172, 0.002591954, -3.246375, 1, 1, 1, 1, 1,
-0.1996579, 0.7720222, 0.6412265, 1, 1, 1, 1, 1,
-0.1904343, -0.6573364, -2.728199, 1, 1, 1, 1, 1,
-0.1877593, 0.0267779, -1.77566, 1, 1, 1, 1, 1,
-0.1875402, -0.4199926, -3.36771, 0, 0, 1, 1, 1,
-0.1856702, 0.6970922, -0.9633937, 1, 0, 0, 1, 1,
-0.1814437, -1.018761, -2.405788, 1, 0, 0, 1, 1,
-0.1798412, -1.276531, -2.84714, 1, 0, 0, 1, 1,
-0.1773499, -0.7887453, -4.188615, 1, 0, 0, 1, 1,
-0.1763164, 0.6244981, 0.7832284, 1, 0, 0, 1, 1,
-0.1748141, -0.17349, -1.728535, 0, 0, 0, 1, 1,
-0.167815, 0.5974348, -1.25732, 0, 0, 0, 1, 1,
-0.1635167, -1.090044, -3.978947, 0, 0, 0, 1, 1,
-0.1555406, 0.6475022, -1.246131, 0, 0, 0, 1, 1,
-0.1524178, 1.269399, 1.760195, 0, 0, 0, 1, 1,
-0.1508495, 0.3140132, -0.54874, 0, 0, 0, 1, 1,
-0.1450923, 1.144438, 1.056222, 0, 0, 0, 1, 1,
-0.144986, -0.7025244, -2.749593, 1, 1, 1, 1, 1,
-0.1405954, -0.005790534, -1.499221, 1, 1, 1, 1, 1,
-0.1393785, -1.176284, -1.731768, 1, 1, 1, 1, 1,
-0.1374327, 1.204195, -0.4524119, 1, 1, 1, 1, 1,
-0.1333627, -0.4065332, -4.345046, 1, 1, 1, 1, 1,
-0.1287025, -0.6198086, -2.681895, 1, 1, 1, 1, 1,
-0.1265635, -1.748483, -2.386516, 1, 1, 1, 1, 1,
-0.1261662, -1.800251, -4.816253, 1, 1, 1, 1, 1,
-0.1246137, 0.2150431, 0.4297221, 1, 1, 1, 1, 1,
-0.1184732, 1.174517, -0.07522752, 1, 1, 1, 1, 1,
-0.1165072, -0.3886308, -2.356314, 1, 1, 1, 1, 1,
-0.1137606, 0.3889439, 0.1122404, 1, 1, 1, 1, 1,
-0.1128144, 0.9110504, 1.139409, 1, 1, 1, 1, 1,
-0.1106488, 0.2424983, 0.6770595, 1, 1, 1, 1, 1,
-0.1070952, 1.405536, 0.4228624, 1, 1, 1, 1, 1,
-0.1058422, -1.206229, -1.897971, 0, 0, 1, 1, 1,
-0.1012667, -0.8500476, -3.872858, 1, 0, 0, 1, 1,
-0.09482405, 0.9019957, -0.5048015, 1, 0, 0, 1, 1,
-0.09384943, 0.4075811, -0.08172156, 1, 0, 0, 1, 1,
-0.09362071, -0.7073511, -2.890331, 1, 0, 0, 1, 1,
-0.08955625, -0.0005337289, -1.083975, 1, 0, 0, 1, 1,
-0.08705842, -0.1463437, -1.296433, 0, 0, 0, 1, 1,
-0.08646414, -0.07592721, -3.091836, 0, 0, 0, 1, 1,
-0.08565069, 1.107783, 1.395561, 0, 0, 0, 1, 1,
-0.084634, -0.4400051, -3.266992, 0, 0, 0, 1, 1,
-0.08397435, 0.16141, -0.01121826, 0, 0, 0, 1, 1,
-0.0792767, -1.058208, -4.014201, 0, 0, 0, 1, 1,
-0.07774267, 0.5868876, 0.1769153, 0, 0, 0, 1, 1,
-0.07614436, -0.4755476, -2.453885, 1, 1, 1, 1, 1,
-0.07557781, 1.092759, -1.1203, 1, 1, 1, 1, 1,
-0.06739205, 1.60699, 0.2245996, 1, 1, 1, 1, 1,
-0.06536809, -1.146346, -3.893919, 1, 1, 1, 1, 1,
-0.06525826, -0.1830775, -2.898029, 1, 1, 1, 1, 1,
-0.06501991, -0.008336758, -1.335439, 1, 1, 1, 1, 1,
-0.06344499, 0.589236, -1.273931, 1, 1, 1, 1, 1,
-0.06235607, 0.1021605, -1.255352, 1, 1, 1, 1, 1,
-0.05604298, -1.500312, -2.99738, 1, 1, 1, 1, 1,
-0.05282272, 1.553371, 0.1900203, 1, 1, 1, 1, 1,
-0.0512495, 0.5032016, 0.4467494, 1, 1, 1, 1, 1,
-0.04870664, -0.9910287, -1.814797, 1, 1, 1, 1, 1,
-0.04558958, 0.6369168, -0.631861, 1, 1, 1, 1, 1,
-0.04403476, -1.99971, -2.134487, 1, 1, 1, 1, 1,
-0.03619361, 1.254952, 1.167771, 1, 1, 1, 1, 1,
-0.03618933, 0.3677776, 1.519624, 0, 0, 1, 1, 1,
-0.03460459, 0.6368678, -1.058182, 1, 0, 0, 1, 1,
-0.03299874, -0.2386195, -3.583797, 1, 0, 0, 1, 1,
-0.02772698, 1.351557, 1.605765, 1, 0, 0, 1, 1,
-0.02353114, 0.5379428, 0.7426766, 1, 0, 0, 1, 1,
-0.02234837, 2.088844, -0.8986963, 1, 0, 0, 1, 1,
-0.02014174, -0.5251842, -2.890906, 0, 0, 0, 1, 1,
-0.0185139, 0.1453163, -1.618244, 0, 0, 0, 1, 1,
-0.01235502, -0.3575794, -4.524313, 0, 0, 0, 1, 1,
-0.01114431, 0.1910914, -0.7635447, 0, 0, 0, 1, 1,
-0.007420926, -1.192449, -4.447675, 0, 0, 0, 1, 1,
-0.003577943, 0.9049097, -0.187418, 0, 0, 0, 1, 1,
-0.003570684, -1.149955, -1.247722, 0, 0, 0, 1, 1,
-0.002469762, 0.01513613, -0.6458737, 1, 1, 1, 1, 1,
0.001280992, -0.1217321, 3.573178, 1, 1, 1, 1, 1,
0.002337962, 0.3105284, 0.2092532, 1, 1, 1, 1, 1,
0.007039181, -0.2667183, 3.405441, 1, 1, 1, 1, 1,
0.01468363, 2.652693, -0.7363761, 1, 1, 1, 1, 1,
0.01674461, 1.97906, -1.873597, 1, 1, 1, 1, 1,
0.01844865, 1.151005, 2.578416, 1, 1, 1, 1, 1,
0.02064273, 0.529259, 0.6973847, 1, 1, 1, 1, 1,
0.02251528, 0.8591477, 0.6239501, 1, 1, 1, 1, 1,
0.02305565, 0.4978836, -1.243727, 1, 1, 1, 1, 1,
0.02378394, -2.007287, 3.159956, 1, 1, 1, 1, 1,
0.02565991, 0.9035198, -0.1824942, 1, 1, 1, 1, 1,
0.02606942, 0.1730455, -0.08152714, 1, 1, 1, 1, 1,
0.02832417, 0.1540622, 0.6396965, 1, 1, 1, 1, 1,
0.02941044, 0.4949951, 0.7948294, 1, 1, 1, 1, 1,
0.03082032, 1.103811, -1.485918, 0, 0, 1, 1, 1,
0.03535321, 1.492029, -0.1990438, 1, 0, 0, 1, 1,
0.03551609, -0.4909348, 3.126583, 1, 0, 0, 1, 1,
0.03906308, 0.09890427, 0.1923474, 1, 0, 0, 1, 1,
0.03965713, -0.01362797, 2.376214, 1, 0, 0, 1, 1,
0.04269625, 0.05695909, 0.7347258, 1, 0, 0, 1, 1,
0.04376508, 0.4466125, 0.2115348, 0, 0, 0, 1, 1,
0.04634826, 0.5416595, -0.06291773, 0, 0, 0, 1, 1,
0.04959211, -0.3011371, 5.170476, 0, 0, 0, 1, 1,
0.06194481, -1.34381, 4.523253, 0, 0, 0, 1, 1,
0.06353823, 0.3946511, 2.397766, 0, 0, 0, 1, 1,
0.06687715, -0.9788446, 4.167486, 0, 0, 0, 1, 1,
0.06737814, -1.918191, 5.205353, 0, 0, 0, 1, 1,
0.06795699, 0.8268737, 1.343649, 1, 1, 1, 1, 1,
0.07972667, -0.2344129, 3.634861, 1, 1, 1, 1, 1,
0.08331231, 0.9099522, 0.6374899, 1, 1, 1, 1, 1,
0.08649791, -0.4988131, 2.175593, 1, 1, 1, 1, 1,
0.08995862, -0.1754527, 3.388781, 1, 1, 1, 1, 1,
0.09096898, -1.2959, 3.444664, 1, 1, 1, 1, 1,
0.09130214, -0.5194411, 3.813773, 1, 1, 1, 1, 1,
0.09158494, 2.005104, -1.152137, 1, 1, 1, 1, 1,
0.09221987, -1.096818, 3.667104, 1, 1, 1, 1, 1,
0.09393744, -1.486723, 0.9788789, 1, 1, 1, 1, 1,
0.1014666, 0.8605015, 1.341591, 1, 1, 1, 1, 1,
0.1028462, -0.07607385, 3.147416, 1, 1, 1, 1, 1,
0.102945, -0.1909278, 4.483023, 1, 1, 1, 1, 1,
0.1046688, 1.703923, -1.140469, 1, 1, 1, 1, 1,
0.1146755, 1.726651, -0.529426, 1, 1, 1, 1, 1,
0.1153581, 0.5548969, -1.605414, 0, 0, 1, 1, 1,
0.1183931, 0.5572113, -0.1780555, 1, 0, 0, 1, 1,
0.1189392, -0.7718624, 1.586683, 1, 0, 0, 1, 1,
0.1209962, -0.5109271, 2.296836, 1, 0, 0, 1, 1,
0.1221978, 0.8343866, 0.2551427, 1, 0, 0, 1, 1,
0.1247937, 1.862934, -0.2364863, 1, 0, 0, 1, 1,
0.1265009, 0.8754117, 0.5431271, 0, 0, 0, 1, 1,
0.130028, 1.882165, -1.179222, 0, 0, 0, 1, 1,
0.1351632, 0.2275425, 0.6633819, 0, 0, 0, 1, 1,
0.1368264, 0.9097025, -0.2358689, 0, 0, 0, 1, 1,
0.138146, 0.1026378, 1.757736, 0, 0, 0, 1, 1,
0.1442191, -0.287564, 4.859168, 0, 0, 0, 1, 1,
0.1446296, -0.03439644, 2.131198, 0, 0, 0, 1, 1,
0.1534171, -0.984263, 3.652408, 1, 1, 1, 1, 1,
0.1553108, 0.2033176, 2.165017, 1, 1, 1, 1, 1,
0.1555043, 0.2908458, 1.666764, 1, 1, 1, 1, 1,
0.1555888, 0.6354954, -0.550912, 1, 1, 1, 1, 1,
0.1599438, 0.6803856, 0.89944, 1, 1, 1, 1, 1,
0.1600772, -1.211365, 4.823336, 1, 1, 1, 1, 1,
0.1705712, -0.493307, 2.334921, 1, 1, 1, 1, 1,
0.1708402, 0.1393668, -0.03620174, 1, 1, 1, 1, 1,
0.1721217, 0.5180421, -0.5733975, 1, 1, 1, 1, 1,
0.1730549, -1.852578, 2.729141, 1, 1, 1, 1, 1,
0.1736375, -1.113419, 4.267657, 1, 1, 1, 1, 1,
0.1736732, 1.608927, -0.2236058, 1, 1, 1, 1, 1,
0.1753575, 0.7009457, -0.8384897, 1, 1, 1, 1, 1,
0.1846189, 0.745249, 0.8419042, 1, 1, 1, 1, 1,
0.1881559, 0.2039487, 1.325668, 1, 1, 1, 1, 1,
0.1904624, -0.1411115, 2.572338, 0, 0, 1, 1, 1,
0.1917887, -1.264212, 5.19363, 1, 0, 0, 1, 1,
0.1960688, -0.7218125, 2.203515, 1, 0, 0, 1, 1,
0.2025147, 0.2334544, -0.7129719, 1, 0, 0, 1, 1,
0.2145156, -1.734342, 4.502323, 1, 0, 0, 1, 1,
0.2160384, -0.3012599, 2.051264, 1, 0, 0, 1, 1,
0.2176643, -0.8329113, 4.258889, 0, 0, 0, 1, 1,
0.2233038, 1.545312, 0.3964902, 0, 0, 0, 1, 1,
0.2239098, -0.716216, 3.776048, 0, 0, 0, 1, 1,
0.2270265, -1.267676, 3.083337, 0, 0, 0, 1, 1,
0.2294322, 0.8416106, -0.927664, 0, 0, 0, 1, 1,
0.232123, -1.179741, 0.8363603, 0, 0, 0, 1, 1,
0.2350104, 0.1111145, 0.4129641, 0, 0, 0, 1, 1,
0.2387277, -0.04419192, 3.35795, 1, 1, 1, 1, 1,
0.2391008, 0.05031396, 1.280664, 1, 1, 1, 1, 1,
0.2396847, 0.8999045, 0.672471, 1, 1, 1, 1, 1,
0.2423495, 1.305666, 0.06310433, 1, 1, 1, 1, 1,
0.2428163, 1.164373, -0.128025, 1, 1, 1, 1, 1,
0.2450755, -1.400063, 1.686429, 1, 1, 1, 1, 1,
0.2476615, 1.078301, 1.439157, 1, 1, 1, 1, 1,
0.2476876, -1.290694, 4.495467, 1, 1, 1, 1, 1,
0.2589819, -0.9806592, 3.480196, 1, 1, 1, 1, 1,
0.2615972, 0.3378222, -0.2553464, 1, 1, 1, 1, 1,
0.2625459, 1.30439, -0.8596252, 1, 1, 1, 1, 1,
0.2641137, 0.510945, 0.0217651, 1, 1, 1, 1, 1,
0.26473, 1.273661, -0.942717, 1, 1, 1, 1, 1,
0.2665372, -0.6032311, 3.695733, 1, 1, 1, 1, 1,
0.2674936, -0.583495, 2.446367, 1, 1, 1, 1, 1,
0.270241, -2.082466, 1.766321, 0, 0, 1, 1, 1,
0.2705172, -1.727306, 1.549286, 1, 0, 0, 1, 1,
0.2838506, 0.04262505, 0.4051611, 1, 0, 0, 1, 1,
0.2860283, -0.5248466, 0.2010907, 1, 0, 0, 1, 1,
0.287394, 0.7348159, 0.8499668, 1, 0, 0, 1, 1,
0.2887599, -0.4647611, 3.353717, 1, 0, 0, 1, 1,
0.2895418, 0.6613265, -0.570566, 0, 0, 0, 1, 1,
0.2910997, 0.4069967, -0.5115897, 0, 0, 0, 1, 1,
0.2976239, -0.4503706, 1.976667, 0, 0, 0, 1, 1,
0.3004252, -0.8247982, 2.49818, 0, 0, 0, 1, 1,
0.3021575, 0.9609637, 0.2711186, 0, 0, 0, 1, 1,
0.30321, -1.205548, 4.320043, 0, 0, 0, 1, 1,
0.3057182, -1.37844, 4.442141, 0, 0, 0, 1, 1,
0.3171311, -0.8860599, 3.809844, 1, 1, 1, 1, 1,
0.3211711, 0.6222751, -0.1971907, 1, 1, 1, 1, 1,
0.3215788, -0.2120401, 0.8520721, 1, 1, 1, 1, 1,
0.3228155, 0.2319113, 0.5480782, 1, 1, 1, 1, 1,
0.3257737, -1.539721, 4.818797, 1, 1, 1, 1, 1,
0.3261534, 0.3753907, 0.4218583, 1, 1, 1, 1, 1,
0.3269757, -0.1115005, 3.03168, 1, 1, 1, 1, 1,
0.3313642, -0.1553841, 2.249077, 1, 1, 1, 1, 1,
0.3365252, -0.1197844, -0.6365252, 1, 1, 1, 1, 1,
0.336985, 0.3105234, 1.190347, 1, 1, 1, 1, 1,
0.3406104, -0.1440679, 1.74443, 1, 1, 1, 1, 1,
0.3410012, -0.2365651, 1.85611, 1, 1, 1, 1, 1,
0.3421427, 0.645065, 0.8939615, 1, 1, 1, 1, 1,
0.3452073, 1.08651, 1.183329, 1, 1, 1, 1, 1,
0.3488922, -0.5960805, 2.460192, 1, 1, 1, 1, 1,
0.3496425, -0.3027565, 3.196087, 0, 0, 1, 1, 1,
0.3507877, -0.1804132, -0.2836418, 1, 0, 0, 1, 1,
0.3515663, 2.263071, 1.626891, 1, 0, 0, 1, 1,
0.3536792, -0.1652154, 3.752214, 1, 0, 0, 1, 1,
0.3542944, 0.5141107, 0.05464818, 1, 0, 0, 1, 1,
0.3547106, 0.312023, 2.561716, 1, 0, 0, 1, 1,
0.361513, -0.2152634, 2.774662, 0, 0, 0, 1, 1,
0.3703156, 0.2353296, 2.648487, 0, 0, 0, 1, 1,
0.3706017, 1.435483, 1.409256, 0, 0, 0, 1, 1,
0.3748788, -0.154385, 2.018321, 0, 0, 0, 1, 1,
0.3769508, -0.5404856, 4.233954, 0, 0, 0, 1, 1,
0.3807247, 0.3925041, 0.8094307, 0, 0, 0, 1, 1,
0.3864473, -0.5890029, 2.41029, 0, 0, 0, 1, 1,
0.3953724, 0.03794991, 0.8649418, 1, 1, 1, 1, 1,
0.4001742, 1.126178, -0.03082436, 1, 1, 1, 1, 1,
0.4010062, 0.306032, -0.2928546, 1, 1, 1, 1, 1,
0.4024196, 0.1481062, 0.4278877, 1, 1, 1, 1, 1,
0.4061758, 0.532574, 1.32755, 1, 1, 1, 1, 1,
0.4092949, 1.593612, 1.114052, 1, 1, 1, 1, 1,
0.4103211, 1.594283, -0.3464609, 1, 1, 1, 1, 1,
0.4130698, 0.1737925, -1.001573, 1, 1, 1, 1, 1,
0.4161772, 0.7704393, 1.08915, 1, 1, 1, 1, 1,
0.4181701, 0.3184137, 1.234761, 1, 1, 1, 1, 1,
0.4182233, -1.167358, 2.306028, 1, 1, 1, 1, 1,
0.4219194, -1.668935, 1.979539, 1, 1, 1, 1, 1,
0.4237607, 0.04344663, 3.319784, 1, 1, 1, 1, 1,
0.424044, -1.27883, 4.353475, 1, 1, 1, 1, 1,
0.4251442, 2.036121, 2.837063, 1, 1, 1, 1, 1,
0.4330952, 1.183647, 0.2511337, 0, 0, 1, 1, 1,
0.4368276, 0.5040598, 0.7326556, 1, 0, 0, 1, 1,
0.4399879, -3.842792, 2.971284, 1, 0, 0, 1, 1,
0.4423472, -0.1574388, 0.8908398, 1, 0, 0, 1, 1,
0.4428563, 1.092509, 2.563834, 1, 0, 0, 1, 1,
0.4500251, 0.2225244, 2.323466, 1, 0, 0, 1, 1,
0.4536771, 2.106687, 0.8034206, 0, 0, 0, 1, 1,
0.454941, 1.912313, -0.2768752, 0, 0, 0, 1, 1,
0.4563586, 0.6958073, 1.790912, 0, 0, 0, 1, 1,
0.4575284, 0.8868506, 0.4094271, 0, 0, 0, 1, 1,
0.4600877, -0.9516163, 3.868512, 0, 0, 0, 1, 1,
0.4609027, -1.260121, 3.328742, 0, 0, 0, 1, 1,
0.4624188, -0.5343799, 4.481293, 0, 0, 0, 1, 1,
0.4632291, 0.8932818, 2.465497, 1, 1, 1, 1, 1,
0.4677542, 0.03458648, 1.289003, 1, 1, 1, 1, 1,
0.468366, -1.202771, 3.59793, 1, 1, 1, 1, 1,
0.4690232, -0.3547195, 2.745304, 1, 1, 1, 1, 1,
0.469328, 0.5583349, 0.8734971, 1, 1, 1, 1, 1,
0.4730211, 0.131805, 1.629394, 1, 1, 1, 1, 1,
0.479431, -1.470436, 2.23805, 1, 1, 1, 1, 1,
0.4814881, -1.59072, 2.515585, 1, 1, 1, 1, 1,
0.485254, 0.2535598, 0.694537, 1, 1, 1, 1, 1,
0.4922906, -0.2881599, 2.557676, 1, 1, 1, 1, 1,
0.4957108, 2.44005, 0.2567503, 1, 1, 1, 1, 1,
0.4964868, 0.145219, 2.320936, 1, 1, 1, 1, 1,
0.5008271, 0.1465391, 0.498769, 1, 1, 1, 1, 1,
0.5032587, 0.4964438, 1.725723, 1, 1, 1, 1, 1,
0.5107042, 0.06315073, 1.229053, 1, 1, 1, 1, 1,
0.5110692, -0.5960603, 2.12641, 0, 0, 1, 1, 1,
0.5191699, 1.299378, 0.5694107, 1, 0, 0, 1, 1,
0.5220926, -0.08896875, 2.516648, 1, 0, 0, 1, 1,
0.5238225, -0.5912117, 1.786008, 1, 0, 0, 1, 1,
0.5242334, -0.327187, 1.473642, 1, 0, 0, 1, 1,
0.5283754, 1.164133, -0.2573859, 1, 0, 0, 1, 1,
0.5285217, -0.4515752, 1.614471, 0, 0, 0, 1, 1,
0.5286997, 0.8058698, -0.3132989, 0, 0, 0, 1, 1,
0.5380816, -0.5276023, 1.91344, 0, 0, 0, 1, 1,
0.543915, 0.5251166, 1.383671, 0, 0, 0, 1, 1,
0.5450597, 2.665277, 1.612928, 0, 0, 0, 1, 1,
0.5451245, -0.508879, 1.164561, 0, 0, 0, 1, 1,
0.5482696, 0.9478258, 0.684563, 0, 0, 0, 1, 1,
0.5494244, 0.194548, 1.25275, 1, 1, 1, 1, 1,
0.5496737, 1.150582, 1.60249, 1, 1, 1, 1, 1,
0.5548509, 0.06347198, 2.09418, 1, 1, 1, 1, 1,
0.5576038, 0.2691498, -0.2336667, 1, 1, 1, 1, 1,
0.5599524, 1.144773, 0.376675, 1, 1, 1, 1, 1,
0.5618484, -0.5328783, 3.151577, 1, 1, 1, 1, 1,
0.5636681, 0.02131068, 1.731827, 1, 1, 1, 1, 1,
0.5644739, 0.6887782, 2.337147, 1, 1, 1, 1, 1,
0.5734816, -1.549452, 2.404196, 1, 1, 1, 1, 1,
0.5807601, -1.019955, 1.359731, 1, 1, 1, 1, 1,
0.583941, -1.81101, 3.564907, 1, 1, 1, 1, 1,
0.5871428, 1.019118, 0.1903726, 1, 1, 1, 1, 1,
0.5884611, 1.54204, -0.4332831, 1, 1, 1, 1, 1,
0.58956, -0.8484828, 4.001453, 1, 1, 1, 1, 1,
0.5975951, -0.05056519, 0.08168541, 1, 1, 1, 1, 1,
0.6017468, -0.2072182, 2.966337, 0, 0, 1, 1, 1,
0.6028938, 0.8885105, 0.6631725, 1, 0, 0, 1, 1,
0.6105564, 1.186213, 1.09867, 1, 0, 0, 1, 1,
0.612178, -0.7295871, 1.718053, 1, 0, 0, 1, 1,
0.6125268, -0.1179212, 1.000228, 1, 0, 0, 1, 1,
0.6145414, 1.22947, 0.5931938, 1, 0, 0, 1, 1,
0.6217812, -0.8027875, 3.035182, 0, 0, 0, 1, 1,
0.6231089, 1.448671, -0.203666, 0, 0, 0, 1, 1,
0.6247308, -0.2121545, 1.911234, 0, 0, 0, 1, 1,
0.629999, 1.138685, -0.4732209, 0, 0, 0, 1, 1,
0.6305463, 0.03455589, 2.401222, 0, 0, 0, 1, 1,
0.6310627, 0.7982159, 0.4524051, 0, 0, 0, 1, 1,
0.6399177, -1.615248, 2.709263, 0, 0, 0, 1, 1,
0.6400859, 0.390413, 1.499882, 1, 1, 1, 1, 1,
0.6408291, 0.511918, -0.2581617, 1, 1, 1, 1, 1,
0.6409795, -1.021834, 2.197249, 1, 1, 1, 1, 1,
0.6457822, -0.351435, 2.728851, 1, 1, 1, 1, 1,
0.646921, -0.1214735, 2.755975, 1, 1, 1, 1, 1,
0.6575183, 0.7672868, 1.045843, 1, 1, 1, 1, 1,
0.6601887, 0.702461, 0.329155, 1, 1, 1, 1, 1,
0.6610149, -0.4951902, 3.117071, 1, 1, 1, 1, 1,
0.6618289, 0.170445, 0.6274095, 1, 1, 1, 1, 1,
0.6626954, -1.86459, 3.109066, 1, 1, 1, 1, 1,
0.6628344, -0.7291068, 2.637091, 1, 1, 1, 1, 1,
0.6633061, 0.8488837, 0.1654539, 1, 1, 1, 1, 1,
0.6648345, 1.001255, 0.9884595, 1, 1, 1, 1, 1,
0.6672962, 2.923135, 1.114548, 1, 1, 1, 1, 1,
0.6683432, -1.594627, 3.390908, 1, 1, 1, 1, 1,
0.6693249, -1.139427, 3.378239, 0, 0, 1, 1, 1,
0.6707829, -1.263864, 2.720926, 1, 0, 0, 1, 1,
0.6761175, 0.6625389, 2.717173, 1, 0, 0, 1, 1,
0.6765183, 0.4343228, 0.9590516, 1, 0, 0, 1, 1,
0.6770673, 0.2861431, 1.048447, 1, 0, 0, 1, 1,
0.6827741, -0.8426082, 3.146836, 1, 0, 0, 1, 1,
0.6921155, 0.07594848, 1.480834, 0, 0, 0, 1, 1,
0.6927534, 0.2191427, 0.5886171, 0, 0, 0, 1, 1,
0.6966253, -0.3530082, 2.927526, 0, 0, 0, 1, 1,
0.7027711, 1.68395, -0.3960978, 0, 0, 0, 1, 1,
0.7030653, 0.2562521, 2.437495, 0, 0, 0, 1, 1,
0.7040498, -0.1291734, 0.3538278, 0, 0, 0, 1, 1,
0.7113217, -0.7149823, 2.513695, 0, 0, 0, 1, 1,
0.7118193, -0.8750452, 4.21563, 1, 1, 1, 1, 1,
0.7163397, 0.1875984, 0.3461037, 1, 1, 1, 1, 1,
0.7174438, -1.023646, 3.031765, 1, 1, 1, 1, 1,
0.7182984, 1.228253, 1.274512, 1, 1, 1, 1, 1,
0.7216702, -0.6438683, 1.456822, 1, 1, 1, 1, 1,
0.7217652, 0.7848293, 0.8267649, 1, 1, 1, 1, 1,
0.7247359, 1.193379, 0.3390459, 1, 1, 1, 1, 1,
0.7268906, 0.2794971, 1.429605, 1, 1, 1, 1, 1,
0.7287946, -0.2890335, 1.424862, 1, 1, 1, 1, 1,
0.7298957, 0.3334629, 1.265869, 1, 1, 1, 1, 1,
0.7329426, -1.730013, 3.649826, 1, 1, 1, 1, 1,
0.7330392, -1.217667, 4.393686, 1, 1, 1, 1, 1,
0.7373583, -1.256375, 4.76871, 1, 1, 1, 1, 1,
0.7376558, 0.8602455, 1.769129, 1, 1, 1, 1, 1,
0.738995, 0.4664036, 1.315203, 1, 1, 1, 1, 1,
0.7391176, -0.7066879, 1.539104, 0, 0, 1, 1, 1,
0.7456106, -0.1686397, 2.339754, 1, 0, 0, 1, 1,
0.7473992, -1.808991, 3.779817, 1, 0, 0, 1, 1,
0.7483177, -1.322348, 1.667779, 1, 0, 0, 1, 1,
0.750315, 0.3534066, 1.66757, 1, 0, 0, 1, 1,
0.7514729, 0.6874512, 2.88353, 1, 0, 0, 1, 1,
0.7537929, 0.5766686, 1.793714, 0, 0, 0, 1, 1,
0.7566414, -0.9502323, 2.758835, 0, 0, 0, 1, 1,
0.7579289, -0.3975771, 1.947354, 0, 0, 0, 1, 1,
0.7593808, 0.9579132, 1.023433, 0, 0, 0, 1, 1,
0.7593963, -0.3202392, 2.089298, 0, 0, 0, 1, 1,
0.7619821, 0.6182469, -1.004081, 0, 0, 0, 1, 1,
0.7632005, 0.2724404, 1.549727, 0, 0, 0, 1, 1,
0.7646235, 0.4461045, 0.3119126, 1, 1, 1, 1, 1,
0.7717915, -0.667668, 1.342772, 1, 1, 1, 1, 1,
0.7744145, -0.9362586, 2.477029, 1, 1, 1, 1, 1,
0.7752512, -0.5949153, 2.769716, 1, 1, 1, 1, 1,
0.7754935, 1.019085, 1.422183, 1, 1, 1, 1, 1,
0.7808003, -1.231332, 2.865377, 1, 1, 1, 1, 1,
0.784656, -0.4302002, 1.218519, 1, 1, 1, 1, 1,
0.7878003, 0.4198144, 3.007323, 1, 1, 1, 1, 1,
0.7973626, -0.01179395, 2.032962, 1, 1, 1, 1, 1,
0.8142797, -0.9798834, 0.6920639, 1, 1, 1, 1, 1,
0.8173586, 1.589391, 0.6751292, 1, 1, 1, 1, 1,
0.8184986, -1.213711, 2.02681, 1, 1, 1, 1, 1,
0.8204584, -0.5247793, 2.738902, 1, 1, 1, 1, 1,
0.8219853, 0.6042916, -0.7077296, 1, 1, 1, 1, 1,
0.8291079, -1.630924, 2.585324, 1, 1, 1, 1, 1,
0.8292149, 0.2533835, 1.882559, 0, 0, 1, 1, 1,
0.8326979, -0.8537167, 3.15299, 1, 0, 0, 1, 1,
0.8368141, 2.70589, -1.298196, 1, 0, 0, 1, 1,
0.8393288, -0.6875277, 1.880736, 1, 0, 0, 1, 1,
0.8404468, 0.03351669, 1.69135, 1, 0, 0, 1, 1,
0.8426024, -0.5563437, 1.132531, 1, 0, 0, 1, 1,
0.8434627, -0.8329899, 2.28064, 0, 0, 0, 1, 1,
0.8559635, 0.4347417, 1.505295, 0, 0, 0, 1, 1,
0.8562917, -2.072228, 2.680847, 0, 0, 0, 1, 1,
0.8576382, 0.9940968, 0.2725421, 0, 0, 0, 1, 1,
0.8576583, 0.4474068, 1.349333, 0, 0, 0, 1, 1,
0.8577412, -0.8401284, 1.65209, 0, 0, 0, 1, 1,
0.8600576, -0.6398224, 3.857649, 0, 0, 0, 1, 1,
0.8603243, 2.053627, 0.445516, 1, 1, 1, 1, 1,
0.8629533, 1.660024, 0.1431111, 1, 1, 1, 1, 1,
0.870501, -0.2282362, 0.8509764, 1, 1, 1, 1, 1,
0.8751145, -0.1476909, 1.915705, 1, 1, 1, 1, 1,
0.878954, 0.07039125, -0.3069948, 1, 1, 1, 1, 1,
0.8839233, -0.9077919, 2.06866, 1, 1, 1, 1, 1,
0.8966256, -0.1791114, 2.235439, 1, 1, 1, 1, 1,
0.8971417, 0.5636281, 1.366333, 1, 1, 1, 1, 1,
0.899487, -0.7898259, 3.993641, 1, 1, 1, 1, 1,
0.8995458, -1.657076, 1.715877, 1, 1, 1, 1, 1,
0.9013494, -0.5129107, 0.247072, 1, 1, 1, 1, 1,
0.9037743, -0.5208275, 2.614839, 1, 1, 1, 1, 1,
0.9163762, 0.168058, 2.260275, 1, 1, 1, 1, 1,
0.9165944, 1.526823, 1.140565, 1, 1, 1, 1, 1,
0.9179108, -0.4955224, 1.970888, 1, 1, 1, 1, 1,
0.9208784, 0.05166749, 1.100649, 0, 0, 1, 1, 1,
0.923713, -0.1949839, 1.69852, 1, 0, 0, 1, 1,
0.9258955, -0.5581102, 1.74431, 1, 0, 0, 1, 1,
0.9293905, -0.4045436, 2.014565, 1, 0, 0, 1, 1,
0.9309735, -0.5983762, 1.515189, 1, 0, 0, 1, 1,
0.9318882, -0.6460288, 0.8212761, 1, 0, 0, 1, 1,
0.9342903, -0.708494, 1.726724, 0, 0, 0, 1, 1,
0.9352669, -1.186332, 3.349411, 0, 0, 0, 1, 1,
0.9430177, 0.1751595, 1.443256, 0, 0, 0, 1, 1,
0.9440563, -2.103213, 3.558764, 0, 0, 0, 1, 1,
0.9516013, -1.093768, 0.5247847, 0, 0, 0, 1, 1,
0.95168, 0.2441832, 2.76094, 0, 0, 0, 1, 1,
0.9646098, -1.546284, 1.185566, 0, 0, 0, 1, 1,
0.9871647, 0.2013461, 1.214834, 1, 1, 1, 1, 1,
0.9949176, 0.2717773, 3.337634, 1, 1, 1, 1, 1,
0.9952449, -0.8496235, 1.425194, 1, 1, 1, 1, 1,
1.002391, 1.923811, 1.130202, 1, 1, 1, 1, 1,
1.00251, -0.5766435, 3.277179, 1, 1, 1, 1, 1,
1.003368, 0.4654397, -0.1522155, 1, 1, 1, 1, 1,
1.009921, -0.4456246, 2.309799, 1, 1, 1, 1, 1,
1.016196, -0.8087113, 2.307817, 1, 1, 1, 1, 1,
1.019925, 1.014918, 0.05444708, 1, 1, 1, 1, 1,
1.021651, 0.5006974, -0.2054515, 1, 1, 1, 1, 1,
1.025734, -1.137085, 1.432678, 1, 1, 1, 1, 1,
1.028269, 0.8559383, 2.176885, 1, 1, 1, 1, 1,
1.029675, -0.06169849, -0.5532937, 1, 1, 1, 1, 1,
1.034179, 0.8873862, -1.094635, 1, 1, 1, 1, 1,
1.041054, 1.253827, 0.2293558, 1, 1, 1, 1, 1,
1.041614, 0.7833728, 0.3480321, 0, 0, 1, 1, 1,
1.043165, 1.096681, -1.168429, 1, 0, 0, 1, 1,
1.044576, -0.7184808, 2.533497, 1, 0, 0, 1, 1,
1.044761, -1.040051, 1.30427, 1, 0, 0, 1, 1,
1.046874, -0.6772977, 0.07015801, 1, 0, 0, 1, 1,
1.048646, 1.906564, 2.30886, 1, 0, 0, 1, 1,
1.049078, 1.516208, 1.095883, 0, 0, 0, 1, 1,
1.061488, -0.8356664, 0.3265649, 0, 0, 0, 1, 1,
1.065642, -0.6578584, 1.877309, 0, 0, 0, 1, 1,
1.068731, -0.1379448, 2.93581, 0, 0, 0, 1, 1,
1.076548, -0.6786863, 2.881681, 0, 0, 0, 1, 1,
1.079304, 2.704127, 1.208371, 0, 0, 0, 1, 1,
1.082054, 0.3397086, 0.7978242, 0, 0, 0, 1, 1,
1.082979, 0.1215731, 0.6703755, 1, 1, 1, 1, 1,
1.08746, 0.2612768, 2.182724, 1, 1, 1, 1, 1,
1.090107, -1.28187, 2.827061, 1, 1, 1, 1, 1,
1.094614, -0.1559159, 1.850683, 1, 1, 1, 1, 1,
1.095486, -0.8269463, 1.131611, 1, 1, 1, 1, 1,
1.112067, 0.08952348, 0.7461174, 1, 1, 1, 1, 1,
1.125076, -1.223589, 3.378844, 1, 1, 1, 1, 1,
1.132695, -1.207397, 1.459571, 1, 1, 1, 1, 1,
1.135348, 1.8422, -1.118618, 1, 1, 1, 1, 1,
1.146923, -0.4360937, 1.981181, 1, 1, 1, 1, 1,
1.155467, 1.989487, 2.074917, 1, 1, 1, 1, 1,
1.158042, 1.46496, 3.263736, 1, 1, 1, 1, 1,
1.15878, -1.64692, 3.084941, 1, 1, 1, 1, 1,
1.160989, -0.4455887, 3.398822, 1, 1, 1, 1, 1,
1.172199, -0.07829104, 3.155492, 1, 1, 1, 1, 1,
1.180245, -0.4493304, 1.735999, 0, 0, 1, 1, 1,
1.180658, -1.144522, 3.0492, 1, 0, 0, 1, 1,
1.182576, -1.475431, 2.886954, 1, 0, 0, 1, 1,
1.191743, -0.7308918, 0.8259103, 1, 0, 0, 1, 1,
1.192923, 1.105531, -1.279642, 1, 0, 0, 1, 1,
1.193367, 1.234793, 0.600491, 1, 0, 0, 1, 1,
1.196161, -1.252662, 0.758906, 0, 0, 0, 1, 1,
1.206696, 1.422451, 2.331512, 0, 0, 0, 1, 1,
1.213112, -0.1771308, 2.181968, 0, 0, 0, 1, 1,
1.213951, 0.8529338, 2.235114, 0, 0, 0, 1, 1,
1.215007, -0.6034507, 1.585774, 0, 0, 0, 1, 1,
1.215936, -2.550308, 2.261435, 0, 0, 0, 1, 1,
1.227502, -0.9418185, 1.228389, 0, 0, 0, 1, 1,
1.23122, 0.03071242, 2.489601, 1, 1, 1, 1, 1,
1.238822, -0.9296417, -0.1121564, 1, 1, 1, 1, 1,
1.244228, 0.9590222, 0.2338484, 1, 1, 1, 1, 1,
1.249773, -2.383207, 3.759918, 1, 1, 1, 1, 1,
1.256337, -0.5304182, 2.011872, 1, 1, 1, 1, 1,
1.258973, 0.3478556, 1.819842, 1, 1, 1, 1, 1,
1.2621, 0.4799827, 1.034115, 1, 1, 1, 1, 1,
1.270297, 0.069811, 2.749259, 1, 1, 1, 1, 1,
1.272062, -0.8375483, 3.043068, 1, 1, 1, 1, 1,
1.27487, -0.4941496, 1.837867, 1, 1, 1, 1, 1,
1.27517, -2.19738, 2.637422, 1, 1, 1, 1, 1,
1.275377, 1.438146, 0.4053785, 1, 1, 1, 1, 1,
1.27961, 0.4002595, 1.246482, 1, 1, 1, 1, 1,
1.285333, 0.9873817, 1.072575, 1, 1, 1, 1, 1,
1.29733, 0.8233424, 1.311302, 1, 1, 1, 1, 1,
1.299974, -0.2330854, 0.3691697, 0, 0, 1, 1, 1,
1.300958, -0.9289068, 0.6660749, 1, 0, 0, 1, 1,
1.303973, 1.177564, 2.93799, 1, 0, 0, 1, 1,
1.307668, 0.4083653, 0.2402179, 1, 0, 0, 1, 1,
1.319403, 0.265101, 1.457358, 1, 0, 0, 1, 1,
1.324425, 0.8489308, 0.9118728, 1, 0, 0, 1, 1,
1.334575, -0.04686645, 1.274689, 0, 0, 0, 1, 1,
1.336242, -1.087898, 2.541063, 0, 0, 0, 1, 1,
1.338617, -1.04885, 1.855072, 0, 0, 0, 1, 1,
1.344898, 1.512781, 0.7668582, 0, 0, 0, 1, 1,
1.348618, -0.6488314, 3.577965, 0, 0, 0, 1, 1,
1.368182, -0.3992818, 2.067192, 0, 0, 0, 1, 1,
1.381074, 0.1403326, 2.01889, 0, 0, 0, 1, 1,
1.38223, 0.9168079, 0.4292471, 1, 1, 1, 1, 1,
1.400423, 0.4679799, 1.917048, 1, 1, 1, 1, 1,
1.407641, -0.5873732, 2.24894, 1, 1, 1, 1, 1,
1.410309, -0.8054693, 1.968839, 1, 1, 1, 1, 1,
1.411218, 0.3715518, 2.567568, 1, 1, 1, 1, 1,
1.413083, -0.3794006, 1.121642, 1, 1, 1, 1, 1,
1.422867, -1.514924, 3.270656, 1, 1, 1, 1, 1,
1.42557, 0.08329381, -0.2231974, 1, 1, 1, 1, 1,
1.441905, -0.3926014, 1.65291, 1, 1, 1, 1, 1,
1.447398, 0.5242837, 0.3140537, 1, 1, 1, 1, 1,
1.449257, 1.173904, -1.555821, 1, 1, 1, 1, 1,
1.450324, -0.9007789, 4.040068, 1, 1, 1, 1, 1,
1.452671, 1.253905, 0.7032753, 1, 1, 1, 1, 1,
1.460356, -1.125209, 1.831922, 1, 1, 1, 1, 1,
1.468504, 0.236857, 2.425363, 1, 1, 1, 1, 1,
1.482424, -0.3593169, 2.506884, 0, 0, 1, 1, 1,
1.485149, 0.641717, 1.381459, 1, 0, 0, 1, 1,
1.494381, 0.9176117, 1.896893, 1, 0, 0, 1, 1,
1.500413, -0.1853491, 1.531728, 1, 0, 0, 1, 1,
1.502816, -0.2070211, 2.359315, 1, 0, 0, 1, 1,
1.503703, -0.3151425, 0.7483065, 1, 0, 0, 1, 1,
1.504509, 0.6702534, 0.9870781, 0, 0, 0, 1, 1,
1.505884, -0.6053003, 3.699384, 0, 0, 0, 1, 1,
1.509118, -0.6709552, 2.2814, 0, 0, 0, 1, 1,
1.51948, -1.170197, 2.216217, 0, 0, 0, 1, 1,
1.534036, 1.908416, 2.21584, 0, 0, 0, 1, 1,
1.546741, -0.5603317, 2.265512, 0, 0, 0, 1, 1,
1.547691, 0.9591994, -0.7725607, 0, 0, 0, 1, 1,
1.563611, 0.5504317, 1.468837, 1, 1, 1, 1, 1,
1.573318, 0.1284828, 1.370964, 1, 1, 1, 1, 1,
1.577912, 0.8748506, 0.5379457, 1, 1, 1, 1, 1,
1.594061, -0.5032626, 1.36515, 1, 1, 1, 1, 1,
1.616398, -0.2056361, -0.9579765, 1, 1, 1, 1, 1,
1.623182, 0.8534532, 1.037117, 1, 1, 1, 1, 1,
1.63697, -1.450482, 1.665563, 1, 1, 1, 1, 1,
1.665139, -0.2703931, 1.902635, 1, 1, 1, 1, 1,
1.677629, 0.9942505, 0.9599151, 1, 1, 1, 1, 1,
1.686606, -1.53165, 2.028166, 1, 1, 1, 1, 1,
1.690341, 1.315497, 1.009818, 1, 1, 1, 1, 1,
1.697941, -0.1133693, 2.206342, 1, 1, 1, 1, 1,
1.706697, 1.413111, -0.8167178, 1, 1, 1, 1, 1,
1.724361, -0.9161489, 4.601618, 1, 1, 1, 1, 1,
1.725595, 0.1959308, 1.514599, 1, 1, 1, 1, 1,
1.743664, -0.2575044, 2.128131, 0, 0, 1, 1, 1,
1.747992, 0.118702, 2.129737, 1, 0, 0, 1, 1,
1.770645, -1.405035, 1.62449, 1, 0, 0, 1, 1,
1.779389, -1.771607, 2.716209, 1, 0, 0, 1, 1,
1.786093, -0.8298941, 1.876745, 1, 0, 0, 1, 1,
1.788193, -0.3587689, 0.9547278, 1, 0, 0, 1, 1,
1.797438, 1.797071, 0.5456213, 0, 0, 0, 1, 1,
1.800094, -1.280483, 4.052052, 0, 0, 0, 1, 1,
1.81333, -1.607117, 2.298337, 0, 0, 0, 1, 1,
1.837278, 0.8721874, 2.084936, 0, 0, 0, 1, 1,
1.87639, -0.265253, 2.326018, 0, 0, 0, 1, 1,
1.891328, 0.293544, 1.757061, 0, 0, 0, 1, 1,
1.90811, -1.694485, 4.023475, 0, 0, 0, 1, 1,
1.908355, 1.06701, -0.1484395, 1, 1, 1, 1, 1,
1.925999, 1.417182, 0.5706461, 1, 1, 1, 1, 1,
1.929891, -0.5868766, 1.836806, 1, 1, 1, 1, 1,
1.931363, 0.5714435, 1.210978, 1, 1, 1, 1, 1,
1.935028, 1.713433, 1.908114, 1, 1, 1, 1, 1,
1.939917, -0.2046409, 2.616714, 1, 1, 1, 1, 1,
1.945942, 1.750949, -0.2966867, 1, 1, 1, 1, 1,
1.965663, -0.9482855, 2.202133, 1, 1, 1, 1, 1,
1.977144, -0.5175252, 0.6453452, 1, 1, 1, 1, 1,
2.007145, 0.6384438, -0.1940488, 1, 1, 1, 1, 1,
2.042456, 0.9679316, 1.163139, 1, 1, 1, 1, 1,
2.062721, 2.211635, -0.02405354, 1, 1, 1, 1, 1,
2.157503, 0.3307775, 1.683904, 1, 1, 1, 1, 1,
2.162019, 1.622507, 1.257784, 1, 1, 1, 1, 1,
2.24507, -1.168234, 1.941226, 1, 1, 1, 1, 1,
2.283296, 1.309182, 3.201196, 0, 0, 1, 1, 1,
2.299373, 0.5016903, 1.579072, 1, 0, 0, 1, 1,
2.321512, -0.2359709, 3.755054, 1, 0, 0, 1, 1,
2.332392, -0.4854653, 1.134748, 1, 0, 0, 1, 1,
2.34898, 0.2880916, 1.271281, 1, 0, 0, 1, 1,
2.357844, 0.5622225, 1.204541, 1, 0, 0, 1, 1,
2.376796, 0.1874144, 0.1216483, 0, 0, 0, 1, 1,
2.383729, -0.7816405, 2.659194, 0, 0, 0, 1, 1,
2.392317, 0.3585903, 1.276184, 0, 0, 0, 1, 1,
2.440571, -2.155993, 3.491616, 0, 0, 0, 1, 1,
2.481902, 0.2623357, 1.978108, 0, 0, 0, 1, 1,
2.541015, -0.06376234, 2.165016, 0, 0, 0, 1, 1,
2.567028, 1.158792, 0.5070668, 0, 0, 0, 1, 1,
2.632811, -1.428317, 2.700313, 1, 1, 1, 1, 1,
2.676348, 2.703595, -0.7410623, 1, 1, 1, 1, 1,
2.750912, -0.6129731, 1.35594, 1, 1, 1, 1, 1,
2.930968, 1.138884, 0.1075092, 1, 1, 1, 1, 1,
2.95789, 1.555308, 0.516706, 1, 1, 1, 1, 1,
3.031646, -2.888968, 2.846792, 1, 1, 1, 1, 1,
3.124585, -0.3874241, 2.736166, 1, 1, 1, 1, 1
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
var radius = 9.638037;
var distance = 33.8532;
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
mvMatrix.translate( -0.0243547, 0.4598287, 0.1780469 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.8532);
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
