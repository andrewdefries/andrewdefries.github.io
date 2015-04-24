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
-3.057913, -1.407148, -2.629018, 1, 0, 0, 1,
-3.023915, -1.320011, -1.152151, 1, 0.007843138, 0, 1,
-2.453722, 0.3387142, -2.370665, 1, 0.01176471, 0, 1,
-2.402488, 1.747181, -1.819642, 1, 0.01960784, 0, 1,
-2.384456, 0.1818558, -1.358685, 1, 0.02352941, 0, 1,
-2.369107, -0.03771592, -1.9725, 1, 0.03137255, 0, 1,
-2.355163, -0.3039623, -1.816879, 1, 0.03529412, 0, 1,
-2.33806, -0.1690108, -1.646925, 1, 0.04313726, 0, 1,
-2.299268, -1.309953, -0.08971447, 1, 0.04705882, 0, 1,
-2.291697, 0.5926226, -1.148599, 1, 0.05490196, 0, 1,
-2.271048, -0.2691487, -0.8138636, 1, 0.05882353, 0, 1,
-2.23203, -0.8403599, -0.8022866, 1, 0.06666667, 0, 1,
-2.153512, -0.1069441, -1.739329, 1, 0.07058824, 0, 1,
-2.12642, 0.8328871, -2.672135, 1, 0.07843138, 0, 1,
-2.122428, -0.9070086, -1.54209, 1, 0.08235294, 0, 1,
-2.095319, -0.4748284, -1.534071, 1, 0.09019608, 0, 1,
-2.092451, 0.1368226, -0.5908885, 1, 0.09411765, 0, 1,
-2.079653, 0.7331555, -1.137645, 1, 0.1019608, 0, 1,
-2.07361, 0.7264388, -1.32876, 1, 0.1098039, 0, 1,
-2.064049, 0.7506697, -0.3000377, 1, 0.1137255, 0, 1,
-2.062326, 0.9041246, -2.021316, 1, 0.1215686, 0, 1,
-2.046113, 0.9392992, -1.704812, 1, 0.1254902, 0, 1,
-2.032822, 1.284287, -0.4677868, 1, 0.1333333, 0, 1,
-2.013913, -1.089564, -1.582996, 1, 0.1372549, 0, 1,
-2.000798, 1.320182, -1.957793, 1, 0.145098, 0, 1,
-1.961862, 0.861585, -0.0222461, 1, 0.1490196, 0, 1,
-1.929466, -0.7899213, -2.087801, 1, 0.1568628, 0, 1,
-1.924027, -1.086324, -1.999034, 1, 0.1607843, 0, 1,
-1.923474, 0.8704094, -2.132546, 1, 0.1686275, 0, 1,
-1.900625, -0.3320181, -2.876633, 1, 0.172549, 0, 1,
-1.880639, -0.06237076, -1.313353, 1, 0.1803922, 0, 1,
-1.872826, 1.567124, -0.7214165, 1, 0.1843137, 0, 1,
-1.85822, 0.1319668, 0.7923625, 1, 0.1921569, 0, 1,
-1.853175, -1.021755, -2.919247, 1, 0.1960784, 0, 1,
-1.851945, 1.452094, -0.01883439, 1, 0.2039216, 0, 1,
-1.835508, -0.06990542, -1.802163, 1, 0.2117647, 0, 1,
-1.833925, 0.7505254, -1.947376, 1, 0.2156863, 0, 1,
-1.832661, -0.6227948, -2.350929, 1, 0.2235294, 0, 1,
-1.820248, -1.179908, -0.1406304, 1, 0.227451, 0, 1,
-1.813179, -0.9852514, -4.407906, 1, 0.2352941, 0, 1,
-1.805681, -0.8673813, -3.261221, 1, 0.2392157, 0, 1,
-1.799505, -1.884757, -1.314677, 1, 0.2470588, 0, 1,
-1.790248, -2.038971, -2.749028, 1, 0.2509804, 0, 1,
-1.780924, -0.03194829, -1.867377, 1, 0.2588235, 0, 1,
-1.779426, 1.35559, -1.91493, 1, 0.2627451, 0, 1,
-1.77403, -0.2841943, -1.355861, 1, 0.2705882, 0, 1,
-1.771092, 0.4163507, -1.31507, 1, 0.2745098, 0, 1,
-1.759215, -1.057244, -2.383455, 1, 0.282353, 0, 1,
-1.745204, -0.09072828, -0.7258903, 1, 0.2862745, 0, 1,
-1.74434, 0.2142654, -1.045608, 1, 0.2941177, 0, 1,
-1.743349, 1.381183, -0.5532159, 1, 0.3019608, 0, 1,
-1.740642, -0.8042282, 0.1544372, 1, 0.3058824, 0, 1,
-1.710953, 1.717517, -1.26154, 1, 0.3137255, 0, 1,
-1.707382, 0.9947895, -0.1181518, 1, 0.3176471, 0, 1,
-1.6788, -1.603159, -2.169308, 1, 0.3254902, 0, 1,
-1.665326, 2.51779, 0.6032824, 1, 0.3294118, 0, 1,
-1.664098, -1.573233, -2.830193, 1, 0.3372549, 0, 1,
-1.660504, 0.2978078, -0.5121594, 1, 0.3411765, 0, 1,
-1.654066, 1.811713, -0.5834146, 1, 0.3490196, 0, 1,
-1.652975, 0.9745346, -2.206124, 1, 0.3529412, 0, 1,
-1.651622, 0.2136907, 0.5736607, 1, 0.3607843, 0, 1,
-1.648661, 0.4358247, -0.7051381, 1, 0.3647059, 0, 1,
-1.644399, -0.358999, -2.653597, 1, 0.372549, 0, 1,
-1.643661, 0.7321004, -1.638203, 1, 0.3764706, 0, 1,
-1.63372, 0.2126065, 0.5833321, 1, 0.3843137, 0, 1,
-1.587501, -0.2455857, -1.499593, 1, 0.3882353, 0, 1,
-1.583195, -0.7166082, -2.653221, 1, 0.3960784, 0, 1,
-1.564065, 1.783354, -0.8858316, 1, 0.4039216, 0, 1,
-1.560758, -1.587233, -1.044541, 1, 0.4078431, 0, 1,
-1.557234, -1.870312, -0.2900963, 1, 0.4156863, 0, 1,
-1.551437, 0.1213789, -0.1522654, 1, 0.4196078, 0, 1,
-1.5429, -0.73932, -1.928806, 1, 0.427451, 0, 1,
-1.54239, -0.8673354, -4.396186, 1, 0.4313726, 0, 1,
-1.53559, 0.7327814, -0.9301395, 1, 0.4392157, 0, 1,
-1.51037, -0.8202737, -2.513912, 1, 0.4431373, 0, 1,
-1.474922, -1.598657, -2.110155, 1, 0.4509804, 0, 1,
-1.466016, -0.8110194, 0.3206675, 1, 0.454902, 0, 1,
-1.460152, -0.4185715, -3.899261, 1, 0.4627451, 0, 1,
-1.422758, 0.002178918, -1.283986, 1, 0.4666667, 0, 1,
-1.417996, -0.9824004, -3.084398, 1, 0.4745098, 0, 1,
-1.416977, -0.4978883, -3.087025, 1, 0.4784314, 0, 1,
-1.40893, 0.8908626, -0.5890575, 1, 0.4862745, 0, 1,
-1.404803, 2.130346, 0.9944998, 1, 0.4901961, 0, 1,
-1.399197, 0.4235371, -1.709166, 1, 0.4980392, 0, 1,
-1.398879, -0.2120588, -1.569757, 1, 0.5058824, 0, 1,
-1.398835, -2.044084, -1.703091, 1, 0.509804, 0, 1,
-1.397689, -0.6678956, -1.797979, 1, 0.5176471, 0, 1,
-1.392483, -1.190161, -3.07693, 1, 0.5215687, 0, 1,
-1.38742, -0.8571153, -3.059248, 1, 0.5294118, 0, 1,
-1.384382, 0.6600599, -0.8969806, 1, 0.5333334, 0, 1,
-1.382932, 0.007735308, -0.08373819, 1, 0.5411765, 0, 1,
-1.380742, 1.441722, 1.018221, 1, 0.5450981, 0, 1,
-1.37069, -0.4399219, -2.937191, 1, 0.5529412, 0, 1,
-1.369735, 0.01327548, -1.368816, 1, 0.5568628, 0, 1,
-1.367519, 1.618364, -0.1180811, 1, 0.5647059, 0, 1,
-1.36716, 0.279707, 0.5065651, 1, 0.5686275, 0, 1,
-1.359942, -2.01559, -1.744994, 1, 0.5764706, 0, 1,
-1.356355, 1.475559, -1.622167, 1, 0.5803922, 0, 1,
-1.348739, -0.5430686, -3.055585, 1, 0.5882353, 0, 1,
-1.345495, 0.8136971, -3.287231, 1, 0.5921569, 0, 1,
-1.343489, -0.8752585, -2.695357, 1, 0.6, 0, 1,
-1.341702, 0.3603081, -1.234997, 1, 0.6078432, 0, 1,
-1.337182, 0.2581003, -0.1776272, 1, 0.6117647, 0, 1,
-1.334008, -1.623432, -3.472542, 1, 0.6196079, 0, 1,
-1.332645, 0.06734973, -3.868388, 1, 0.6235294, 0, 1,
-1.331246, 0.3766521, -1.094019, 1, 0.6313726, 0, 1,
-1.324989, -0.6513842, -1.6861, 1, 0.6352941, 0, 1,
-1.320127, 0.6049592, -1.228419, 1, 0.6431373, 0, 1,
-1.313261, -0.1991146, -1.336735, 1, 0.6470588, 0, 1,
-1.312962, -0.7136562, -2.089069, 1, 0.654902, 0, 1,
-1.299165, -1.554209, -1.619231, 1, 0.6588235, 0, 1,
-1.294076, 0.1980021, -3.985765, 1, 0.6666667, 0, 1,
-1.29333, -0.0759251, -1.169685, 1, 0.6705883, 0, 1,
-1.292642, 0.5688455, -1.212789, 1, 0.6784314, 0, 1,
-1.283681, 0.5778982, -2.188707, 1, 0.682353, 0, 1,
-1.280997, -0.2197906, -0.9486697, 1, 0.6901961, 0, 1,
-1.261902, -0.1312689, -2.527417, 1, 0.6941177, 0, 1,
-1.261747, -0.02691074, -0.3126191, 1, 0.7019608, 0, 1,
-1.252457, 0.2489231, -2.442371, 1, 0.7098039, 0, 1,
-1.246112, -0.8250425, -1.194479, 1, 0.7137255, 0, 1,
-1.233085, 0.8371296, -1.24418, 1, 0.7215686, 0, 1,
-1.229213, -1.207996, -1.551533, 1, 0.7254902, 0, 1,
-1.22581, -1.710421, -1.793826, 1, 0.7333333, 0, 1,
-1.21155, 1.052903, -0.9839422, 1, 0.7372549, 0, 1,
-1.210892, -0.4969398, -2.834847, 1, 0.7450981, 0, 1,
-1.209314, -1.111408, -2.012435, 1, 0.7490196, 0, 1,
-1.206499, 0.6878221, -2.62274, 1, 0.7568628, 0, 1,
-1.202353, 0.5343391, 0.9398921, 1, 0.7607843, 0, 1,
-1.1979, -0.5722694, -0.8940584, 1, 0.7686275, 0, 1,
-1.190143, -0.05908926, -1.977513, 1, 0.772549, 0, 1,
-1.187983, -0.6174008, -2.947991, 1, 0.7803922, 0, 1,
-1.183155, 0.1164344, -2.455812, 1, 0.7843137, 0, 1,
-1.183107, 1.588401, -0.6851171, 1, 0.7921569, 0, 1,
-1.1806, 0.2114163, -0.825663, 1, 0.7960784, 0, 1,
-1.180413, -0.4580047, -3.658503, 1, 0.8039216, 0, 1,
-1.180037, 1.318661, -0.8205183, 1, 0.8117647, 0, 1,
-1.17914, 0.831601, 1.245797, 1, 0.8156863, 0, 1,
-1.165102, 0.3415863, -1.079425, 1, 0.8235294, 0, 1,
-1.154295, -0.02766014, -2.748943, 1, 0.827451, 0, 1,
-1.140771, 0.338247, 0.2137243, 1, 0.8352941, 0, 1,
-1.140564, -0.2471949, -0.4389244, 1, 0.8392157, 0, 1,
-1.139937, 1.357587, -2.200182, 1, 0.8470588, 0, 1,
-1.137703, 1.253371, -1.223654, 1, 0.8509804, 0, 1,
-1.131776, 1.209097, -2.217192, 1, 0.8588235, 0, 1,
-1.131371, -1.521653, -2.880228, 1, 0.8627451, 0, 1,
-1.120344, -0.6259102, -2.489652, 1, 0.8705882, 0, 1,
-1.115051, 1.842148, 1.081366, 1, 0.8745098, 0, 1,
-1.108113, 2.431072, 0.8410169, 1, 0.8823529, 0, 1,
-1.105752, -0.03118403, -1.768539, 1, 0.8862745, 0, 1,
-1.104799, 1.052756, -0.4540803, 1, 0.8941177, 0, 1,
-1.10208, 1.024424, 0.8371695, 1, 0.8980392, 0, 1,
-1.101089, 0.1429371, -2.926736, 1, 0.9058824, 0, 1,
-1.081765, 0.5042561, -0.9905446, 1, 0.9137255, 0, 1,
-1.07172, -0.1944134, -1.227551, 1, 0.9176471, 0, 1,
-1.061944, -1.602495, -1.98039, 1, 0.9254902, 0, 1,
-1.0619, -0.9776124, -3.061803, 1, 0.9294118, 0, 1,
-1.05683, -1.534465, -2.064039, 1, 0.9372549, 0, 1,
-1.053621, -0.7260712, -1.776386, 1, 0.9411765, 0, 1,
-1.050575, -2.70144, -3.499784, 1, 0.9490196, 0, 1,
-1.029243, -1.32454, -2.573277, 1, 0.9529412, 0, 1,
-1.024187, -0.1523028, -2.664204, 1, 0.9607843, 0, 1,
-1.018263, 0.2689001, -0.4656552, 1, 0.9647059, 0, 1,
-1.01119, 0.09584617, -1.462432, 1, 0.972549, 0, 1,
-1.002803, 0.2869623, -1.011067, 1, 0.9764706, 0, 1,
-1.00224, -0.6513227, -1.044516, 1, 0.9843137, 0, 1,
-0.9982676, 0.6076559, -0.1569165, 1, 0.9882353, 0, 1,
-0.9967807, -0.7601596, -1.977111, 1, 0.9960784, 0, 1,
-0.99657, -0.1311803, -0.3869004, 0.9960784, 1, 0, 1,
-0.9924886, 0.2048535, -2.604916, 0.9921569, 1, 0, 1,
-0.9812192, -0.1244373, -0.9863634, 0.9843137, 1, 0, 1,
-0.9770553, 1.609419, 0.2126201, 0.9803922, 1, 0, 1,
-0.9748245, -1.843476, -2.772261, 0.972549, 1, 0, 1,
-0.9699998, 0.3653525, -1.332803, 0.9686275, 1, 0, 1,
-0.9652926, -0.9970114, -2.037587, 0.9607843, 1, 0, 1,
-0.9545909, 0.8093191, -1.810693, 0.9568627, 1, 0, 1,
-0.9499803, 0.5101371, -0.06180687, 0.9490196, 1, 0, 1,
-0.9476506, -0.07997794, -2.675972, 0.945098, 1, 0, 1,
-0.9461083, 0.5637679, -3.274642, 0.9372549, 1, 0, 1,
-0.9452311, 0.6359918, 0.1054585, 0.9333333, 1, 0, 1,
-0.9412878, 1.225822, -1.190061, 0.9254902, 1, 0, 1,
-0.9400283, -0.3782743, -1.479785, 0.9215686, 1, 0, 1,
-0.9396241, -1.978553, -1.848748, 0.9137255, 1, 0, 1,
-0.9387079, 0.4264736, -1.200352, 0.9098039, 1, 0, 1,
-0.9364537, -0.03845003, -1.90765, 0.9019608, 1, 0, 1,
-0.9198371, 0.4390875, -0.3269094, 0.8941177, 1, 0, 1,
-0.9177603, -0.005755492, -1.374218, 0.8901961, 1, 0, 1,
-0.9175536, -2.163548, -3.707824, 0.8823529, 1, 0, 1,
-0.9151293, -2.282703, -3.634884, 0.8784314, 1, 0, 1,
-0.9083797, -1.039523, -3.060944, 0.8705882, 1, 0, 1,
-0.9028288, 1.944904, -0.1191231, 0.8666667, 1, 0, 1,
-0.8986862, -0.1319236, -0.9936805, 0.8588235, 1, 0, 1,
-0.8969887, 1.232125, -1.858028, 0.854902, 1, 0, 1,
-0.8958157, 0.6804537, 0.3656664, 0.8470588, 1, 0, 1,
-0.8931111, -0.5616885, -1.64528, 0.8431373, 1, 0, 1,
-0.8694512, 1.400114, -0.3864021, 0.8352941, 1, 0, 1,
-0.8694481, 1.839423, -0.6746719, 0.8313726, 1, 0, 1,
-0.8603852, -0.09021028, -1.826677, 0.8235294, 1, 0, 1,
-0.8578865, 1.617054, -0.5714682, 0.8196079, 1, 0, 1,
-0.856521, 0.19189, -2.205944, 0.8117647, 1, 0, 1,
-0.8510116, -2.652742, -2.64046, 0.8078431, 1, 0, 1,
-0.8498119, 0.5899657, -0.954949, 0.8, 1, 0, 1,
-0.8493953, 1.239153, 0.7655363, 0.7921569, 1, 0, 1,
-0.8486487, 1.261297, -0.08861533, 0.7882353, 1, 0, 1,
-0.8483778, 0.7118041, -1.189706, 0.7803922, 1, 0, 1,
-0.8461877, -1.326851, -1.568607, 0.7764706, 1, 0, 1,
-0.8328453, 0.7641568, -1.414961, 0.7686275, 1, 0, 1,
-0.8321224, -0.2432494, -0.4199086, 0.7647059, 1, 0, 1,
-0.8316851, -1.252105, -3.065712, 0.7568628, 1, 0, 1,
-0.8316373, 1.862281, -0.4037279, 0.7529412, 1, 0, 1,
-0.8236855, -0.5499771, -1.68529, 0.7450981, 1, 0, 1,
-0.8204855, -0.3902074, -2.747587, 0.7411765, 1, 0, 1,
-0.8188381, -0.8292662, -2.332894, 0.7333333, 1, 0, 1,
-0.8172016, -0.5948349, 0.3281484, 0.7294118, 1, 0, 1,
-0.8117262, 0.2201606, -1.096631, 0.7215686, 1, 0, 1,
-0.8091514, 0.4327469, 0.2263243, 0.7176471, 1, 0, 1,
-0.8089643, 0.4158437, -0.4140674, 0.7098039, 1, 0, 1,
-0.806829, 1.207638, 0.02447841, 0.7058824, 1, 0, 1,
-0.8056046, 0.3000436, -2.277714, 0.6980392, 1, 0, 1,
-0.8039436, -0.9918376, -2.634323, 0.6901961, 1, 0, 1,
-0.7975381, -2.585106, -2.523853, 0.6862745, 1, 0, 1,
-0.7940891, 0.2777788, -1.545556, 0.6784314, 1, 0, 1,
-0.7933301, -0.5963976, -2.575268, 0.6745098, 1, 0, 1,
-0.7918054, 0.01714311, -0.7483476, 0.6666667, 1, 0, 1,
-0.7858579, 0.7068161, 0.04750173, 0.6627451, 1, 0, 1,
-0.7803622, -0.3138541, -3.591553, 0.654902, 1, 0, 1,
-0.7780084, 1.435219, -2.070903, 0.6509804, 1, 0, 1,
-0.776437, -0.6121342, -2.127546, 0.6431373, 1, 0, 1,
-0.7724851, -1.53361, -4.591866, 0.6392157, 1, 0, 1,
-0.7715946, 1.531311, -2.047643, 0.6313726, 1, 0, 1,
-0.7685232, -0.8227799, -3.415346, 0.627451, 1, 0, 1,
-0.75612, 0.4121316, 1.287434, 0.6196079, 1, 0, 1,
-0.753173, -0.04923803, -0.900539, 0.6156863, 1, 0, 1,
-0.7514797, -0.5863698, -2.614201, 0.6078432, 1, 0, 1,
-0.7482865, -0.1818679, -2.112068, 0.6039216, 1, 0, 1,
-0.7459181, -2.391747, -1.132704, 0.5960785, 1, 0, 1,
-0.7403227, 1.49792, -0.2433606, 0.5882353, 1, 0, 1,
-0.7353828, 0.9122562, -0.4859988, 0.5843138, 1, 0, 1,
-0.7337885, -0.529934, -1.988266, 0.5764706, 1, 0, 1,
-0.7324331, 0.8156999, 2.2745, 0.572549, 1, 0, 1,
-0.7292652, 0.3713074, -1.898556, 0.5647059, 1, 0, 1,
-0.7290751, -0.8378794, 0.2497785, 0.5607843, 1, 0, 1,
-0.7262892, 0.6426506, -1.856552, 0.5529412, 1, 0, 1,
-0.7249111, -0.7467778, -0.8564435, 0.5490196, 1, 0, 1,
-0.7239622, 2.072122, -0.1435805, 0.5411765, 1, 0, 1,
-0.723139, 1.066443, -0.2116337, 0.5372549, 1, 0, 1,
-0.7225958, -0.9100721, -2.72791, 0.5294118, 1, 0, 1,
-0.7144704, -1.934243, -2.670573, 0.5254902, 1, 0, 1,
-0.7013898, 1.03005, -0.1002743, 0.5176471, 1, 0, 1,
-0.6978047, -0.4595165, -1.700928, 0.5137255, 1, 0, 1,
-0.6960283, -0.4665241, -1.82541, 0.5058824, 1, 0, 1,
-0.6901567, -0.6803263, -1.233806, 0.5019608, 1, 0, 1,
-0.6854278, 2.416492, -2.001693, 0.4941176, 1, 0, 1,
-0.681053, 1.454936, -1.976775, 0.4862745, 1, 0, 1,
-0.6795442, -0.5340483, -1.153236, 0.4823529, 1, 0, 1,
-0.6768398, -1.209647, -2.154934, 0.4745098, 1, 0, 1,
-0.6669209, -0.3477613, -1.984683, 0.4705882, 1, 0, 1,
-0.6652816, 0.2727841, -0.6478388, 0.4627451, 1, 0, 1,
-0.6609495, -1.416782, -2.981134, 0.4588235, 1, 0, 1,
-0.6534492, -2.838425, -0.6559793, 0.4509804, 1, 0, 1,
-0.6529945, -0.717761, -2.361164, 0.4470588, 1, 0, 1,
-0.6505914, 1.102761, 0.4336819, 0.4392157, 1, 0, 1,
-0.6427597, 0.9195013, -2.540827, 0.4352941, 1, 0, 1,
-0.6422744, 0.7316913, 0.6194531, 0.427451, 1, 0, 1,
-0.6376346, 1.803611, -0.9773154, 0.4235294, 1, 0, 1,
-0.6368837, 2.031358, 1.207478, 0.4156863, 1, 0, 1,
-0.6356561, 0.4164376, -1.37097, 0.4117647, 1, 0, 1,
-0.6305714, 1.217171, -2.401166, 0.4039216, 1, 0, 1,
-0.6296905, -0.7073372, -2.886956, 0.3960784, 1, 0, 1,
-0.6294214, 0.7855306, -1.722936, 0.3921569, 1, 0, 1,
-0.6288276, -0.2353131, -1.714676, 0.3843137, 1, 0, 1,
-0.6286973, -0.7867625, -2.896677, 0.3803922, 1, 0, 1,
-0.6281547, -0.1856032, -2.674804, 0.372549, 1, 0, 1,
-0.6199103, -0.1293357, -1.641657, 0.3686275, 1, 0, 1,
-0.6190543, -1.519835, -0.9807621, 0.3607843, 1, 0, 1,
-0.613708, -1.226387, -3.375108, 0.3568628, 1, 0, 1,
-0.6124107, -0.2303986, -2.510778, 0.3490196, 1, 0, 1,
-0.6114774, 0.0635747, -1.620949, 0.345098, 1, 0, 1,
-0.6049632, 0.2533812, 0.2326828, 0.3372549, 1, 0, 1,
-0.5988691, -0.2465981, -1.266708, 0.3333333, 1, 0, 1,
-0.5936227, 0.6720333, -1.42297, 0.3254902, 1, 0, 1,
-0.5905698, 0.7246615, 1.265624, 0.3215686, 1, 0, 1,
-0.5884619, -0.09614584, -1.639066, 0.3137255, 1, 0, 1,
-0.5832433, 1.047107, -2.054792, 0.3098039, 1, 0, 1,
-0.5765019, 0.4399663, -0.9606184, 0.3019608, 1, 0, 1,
-0.5748872, 2.028835, -1.525789, 0.2941177, 1, 0, 1,
-0.572647, -1.4819, -3.192687, 0.2901961, 1, 0, 1,
-0.5695059, -0.4269598, -2.597289, 0.282353, 1, 0, 1,
-0.5642479, 0.8719936, -1.268869, 0.2784314, 1, 0, 1,
-0.563656, 1.906612, 0.8716997, 0.2705882, 1, 0, 1,
-0.5609884, -0.8174092, -3.375249, 0.2666667, 1, 0, 1,
-0.55289, 0.5108374, -1.325998, 0.2588235, 1, 0, 1,
-0.5527301, 0.1220428, -0.2677967, 0.254902, 1, 0, 1,
-0.5526372, -2.497804, -3.171059, 0.2470588, 1, 0, 1,
-0.5522431, 1.913586, 0.6473979, 0.2431373, 1, 0, 1,
-0.5464666, 0.8328612, -1.419354, 0.2352941, 1, 0, 1,
-0.5439612, -0.4775538, -2.217201, 0.2313726, 1, 0, 1,
-0.5432327, 0.3668261, -1.177036, 0.2235294, 1, 0, 1,
-0.542474, 1.290277, 0.3547978, 0.2196078, 1, 0, 1,
-0.5417554, -1.260452, -1.828717, 0.2117647, 1, 0, 1,
-0.5407961, -0.09911182, -3.194422, 0.2078431, 1, 0, 1,
-0.5327702, -1.805012, -3.580487, 0.2, 1, 0, 1,
-0.5269974, -2.280009, -3.07592, 0.1921569, 1, 0, 1,
-0.5220279, 0.8186309, -0.3347594, 0.1882353, 1, 0, 1,
-0.5185469, -2.025311, -4.359615, 0.1803922, 1, 0, 1,
-0.5087646, 0.8025767, 0.4546762, 0.1764706, 1, 0, 1,
-0.5016403, 0.3378973, -3.136153, 0.1686275, 1, 0, 1,
-0.5011362, -0.4380231, -1.84138, 0.1647059, 1, 0, 1,
-0.5003443, -0.2707914, -2.527529, 0.1568628, 1, 0, 1,
-0.4966495, 0.4666159, 1.262478, 0.1529412, 1, 0, 1,
-0.4871258, 0.7264189, -0.04260531, 0.145098, 1, 0, 1,
-0.487013, -1.123885, -4.123615, 0.1411765, 1, 0, 1,
-0.4839383, -0.1734248, -2.406155, 0.1333333, 1, 0, 1,
-0.4798003, 1.065632, 0.3287526, 0.1294118, 1, 0, 1,
-0.4763058, 0.3529696, -0.4635102, 0.1215686, 1, 0, 1,
-0.475565, -0.4345941, -3.277132, 0.1176471, 1, 0, 1,
-0.4737357, 0.6256742, -2.170371, 0.1098039, 1, 0, 1,
-0.4594905, -0.114049, -0.8496056, 0.1058824, 1, 0, 1,
-0.4453388, 1.269347, -0.4569063, 0.09803922, 1, 0, 1,
-0.4448129, -0.1822349, -1.435292, 0.09019608, 1, 0, 1,
-0.4441547, -0.08844402, -2.289112, 0.08627451, 1, 0, 1,
-0.441386, -0.4836609, -2.035106, 0.07843138, 1, 0, 1,
-0.4398722, -0.4110467, -2.369436, 0.07450981, 1, 0, 1,
-0.4331886, 0.02002337, 0.0754251, 0.06666667, 1, 0, 1,
-0.4311315, 0.3531118, 0.4056333, 0.0627451, 1, 0, 1,
-0.4263879, -0.5790947, -1.27419, 0.05490196, 1, 0, 1,
-0.4262618, -0.6195241, -2.960233, 0.05098039, 1, 0, 1,
-0.4166404, 1.133379, -1.135492, 0.04313726, 1, 0, 1,
-0.4149804, 0.6545094, -0.6678874, 0.03921569, 1, 0, 1,
-0.4146517, -0.2422941, -1.81151, 0.03137255, 1, 0, 1,
-0.4138022, 0.4268915, -0.9857669, 0.02745098, 1, 0, 1,
-0.4119482, 0.6221569, -0.8336306, 0.01960784, 1, 0, 1,
-0.4081231, -1.198083, -4.244273, 0.01568628, 1, 0, 1,
-0.4070746, -0.1641067, -1.412705, 0.007843138, 1, 0, 1,
-0.4057735, 2.151493, -0.2237679, 0.003921569, 1, 0, 1,
-0.4029087, -0.6951177, -2.393139, 0, 1, 0.003921569, 1,
-0.4017505, -0.7532036, -4.325115, 0, 1, 0.01176471, 1,
-0.4015736, -1.373279, -2.617625, 0, 1, 0.01568628, 1,
-0.3946427, 1.042709, -0.1408952, 0, 1, 0.02352941, 1,
-0.3919083, 0.193996, -3.232275, 0, 1, 0.02745098, 1,
-0.3902453, 0.3519257, 1.239114, 0, 1, 0.03529412, 1,
-0.3899078, 0.6748614, -0.7519435, 0, 1, 0.03921569, 1,
-0.3882355, 1.393293, 0.3984449, 0, 1, 0.04705882, 1,
-0.3861894, 0.9004102, -0.2963609, 0, 1, 0.05098039, 1,
-0.3827561, 1.416429, 1.953438, 0, 1, 0.05882353, 1,
-0.3800481, 1.344551, -0.5975437, 0, 1, 0.0627451, 1,
-0.3797873, -0.2657617, -4.441818, 0, 1, 0.07058824, 1,
-0.3779297, -2.044161, -2.808997, 0, 1, 0.07450981, 1,
-0.3778544, 0.6541104, -0.8159754, 0, 1, 0.08235294, 1,
-0.3775162, 0.3254946, 0.3545203, 0, 1, 0.08627451, 1,
-0.3717169, -0.5459397, -4.113197, 0, 1, 0.09411765, 1,
-0.3669146, 0.04215121, -1.131543, 0, 1, 0.1019608, 1,
-0.3663862, -0.03586176, -1.276605, 0, 1, 0.1058824, 1,
-0.3640099, -0.879512, -3.681445, 0, 1, 0.1137255, 1,
-0.3632175, 0.03086578, -1.148223, 0, 1, 0.1176471, 1,
-0.3573819, -0.762911, -0.9268328, 0, 1, 0.1254902, 1,
-0.3546945, -0.079993, -1.994125, 0, 1, 0.1294118, 1,
-0.3522273, -0.8933164, -3.166005, 0, 1, 0.1372549, 1,
-0.3512859, 1.971099, -0.2108669, 0, 1, 0.1411765, 1,
-0.3461691, 2.22669, -0.3313128, 0, 1, 0.1490196, 1,
-0.3453578, 0.07266962, -1.899096, 0, 1, 0.1529412, 1,
-0.3434674, 0.7140703, -0.08800452, 0, 1, 0.1607843, 1,
-0.3411118, -0.4258293, -2.184554, 0, 1, 0.1647059, 1,
-0.3409165, -0.634048, -2.162771, 0, 1, 0.172549, 1,
-0.3402084, 1.081205, -0.6903274, 0, 1, 0.1764706, 1,
-0.3352426, 1.660687, -0.9520989, 0, 1, 0.1843137, 1,
-0.3333406, -0.222176, -1.193212, 0, 1, 0.1882353, 1,
-0.3324936, -0.3357622, -2.177115, 0, 1, 0.1960784, 1,
-0.3319307, -1.350739, -3.739184, 0, 1, 0.2039216, 1,
-0.3288026, -1.023353, -1.537528, 0, 1, 0.2078431, 1,
-0.3283281, 1.42505, 0.3712578, 0, 1, 0.2156863, 1,
-0.326627, -1.015705, -1.874761, 0, 1, 0.2196078, 1,
-0.3259491, -2.205578, -1.75998, 0, 1, 0.227451, 1,
-0.3190919, 0.2406663, 0.4290361, 0, 1, 0.2313726, 1,
-0.3075612, -0.4532149, -3.319341, 0, 1, 0.2392157, 1,
-0.3070801, -0.4404336, -2.54192, 0, 1, 0.2431373, 1,
-0.3053577, 0.8129426, -1.342147, 0, 1, 0.2509804, 1,
-0.3052651, 0.7612956, -0.6689687, 0, 1, 0.254902, 1,
-0.3040007, -0.235088, -2.74466, 0, 1, 0.2627451, 1,
-0.3031513, 0.5976938, 0.5655982, 0, 1, 0.2666667, 1,
-0.3020141, -0.00306934, -1.06791, 0, 1, 0.2745098, 1,
-0.2981585, 0.3251337, 1.061908, 0, 1, 0.2784314, 1,
-0.2966395, -0.09658151, -0.1695234, 0, 1, 0.2862745, 1,
-0.2956111, 0.8032957, 0.06661371, 0, 1, 0.2901961, 1,
-0.2945369, -0.1481496, -1.400757, 0, 1, 0.2980392, 1,
-0.2926336, -0.2568916, -1.881536, 0, 1, 0.3058824, 1,
-0.2888606, 2.166835, -0.4292668, 0, 1, 0.3098039, 1,
-0.2876952, 0.7135393, -2.462759, 0, 1, 0.3176471, 1,
-0.2827233, -2.035781, -2.581954, 0, 1, 0.3215686, 1,
-0.2818822, -1.464136, -4.410742, 0, 1, 0.3294118, 1,
-0.2753222, -0.6208113, -2.894967, 0, 1, 0.3333333, 1,
-0.2738352, 1.231836, 2.669924, 0, 1, 0.3411765, 1,
-0.2738234, -1.646139, -0.9918, 0, 1, 0.345098, 1,
-0.272465, -0.8123968, -2.735358, 0, 1, 0.3529412, 1,
-0.2637211, 1.530493, 2.287544, 0, 1, 0.3568628, 1,
-0.2591557, 0.4810549, -1.984776, 0, 1, 0.3647059, 1,
-0.2582623, -0.06377971, -0.6889871, 0, 1, 0.3686275, 1,
-0.2527385, -0.8485491, -4.357787, 0, 1, 0.3764706, 1,
-0.2516775, -1.459553, -1.922701, 0, 1, 0.3803922, 1,
-0.2467112, -0.9412543, -2.609849, 0, 1, 0.3882353, 1,
-0.2461943, -0.5066607, -1.617839, 0, 1, 0.3921569, 1,
-0.2441623, -1.742046, -3.144325, 0, 1, 0.4, 1,
-0.2420134, 0.7867046, -1.274356, 0, 1, 0.4078431, 1,
-0.2376789, -0.9545643, -1.983646, 0, 1, 0.4117647, 1,
-0.235254, -0.945165, -3.417049, 0, 1, 0.4196078, 1,
-0.2302268, 0.7217214, -1.086847, 0, 1, 0.4235294, 1,
-0.2297841, -0.7231728, -2.708264, 0, 1, 0.4313726, 1,
-0.2278194, 0.06999164, -2.946244, 0, 1, 0.4352941, 1,
-0.2272284, -0.2474941, -0.8153154, 0, 1, 0.4431373, 1,
-0.2272063, 0.5382696, 0.3183298, 0, 1, 0.4470588, 1,
-0.2185542, 1.674998, -1.153324, 0, 1, 0.454902, 1,
-0.2179569, 0.799696, -1.043037, 0, 1, 0.4588235, 1,
-0.1993375, -1.205914, -2.327898, 0, 1, 0.4666667, 1,
-0.1985637, 0.6450543, -1.196614, 0, 1, 0.4705882, 1,
-0.196697, -1.314924, -2.892104, 0, 1, 0.4784314, 1,
-0.1952057, -0.1450707, -4.178414, 0, 1, 0.4823529, 1,
-0.1913894, 0.03366134, -1.243008, 0, 1, 0.4901961, 1,
-0.1903534, 0.436213, -1.659913, 0, 1, 0.4941176, 1,
-0.1900394, 1.24896, 0.01442793, 0, 1, 0.5019608, 1,
-0.1892844, -1.168962, -2.921093, 0, 1, 0.509804, 1,
-0.1879768, -0.3650754, -1.034231, 0, 1, 0.5137255, 1,
-0.1866001, -0.889806, -3.426265, 0, 1, 0.5215687, 1,
-0.1844801, -2.041718, -1.61275, 0, 1, 0.5254902, 1,
-0.1796717, -0.08457025, -3.144752, 0, 1, 0.5333334, 1,
-0.1758175, 0.08825994, 0.3735297, 0, 1, 0.5372549, 1,
-0.1740943, -0.2156065, -2.816223, 0, 1, 0.5450981, 1,
-0.1695711, 0.7372378, 0.2072961, 0, 1, 0.5490196, 1,
-0.168862, 0.6058713, 1.190832, 0, 1, 0.5568628, 1,
-0.1644696, 1.143808, 0.8120024, 0, 1, 0.5607843, 1,
-0.162246, -0.329803, -2.752962, 0, 1, 0.5686275, 1,
-0.1584488, 1.692345, 0.2930891, 0, 1, 0.572549, 1,
-0.1584217, -1.137441, -3.552191, 0, 1, 0.5803922, 1,
-0.149768, -0.4518196, -4.552931, 0, 1, 0.5843138, 1,
-0.1461786, 1.220466, -0.3473086, 0, 1, 0.5921569, 1,
-0.1457991, 0.521394, 0.4307473, 0, 1, 0.5960785, 1,
-0.1456912, 0.8012054, 0.7073211, 0, 1, 0.6039216, 1,
-0.1425033, 0.3674064, 0.591752, 0, 1, 0.6117647, 1,
-0.1349043, 0.9581902, -1.053859, 0, 1, 0.6156863, 1,
-0.1342777, 1.679297, 0.3965016, 0, 1, 0.6235294, 1,
-0.1304161, -0.3969461, -0.7809505, 0, 1, 0.627451, 1,
-0.1224516, -0.7134485, -2.33337, 0, 1, 0.6352941, 1,
-0.1204915, -1.516121, -1.904, 0, 1, 0.6392157, 1,
-0.1204777, 0.1882807, -0.3046952, 0, 1, 0.6470588, 1,
-0.1169388, 0.9341924, -1.89773, 0, 1, 0.6509804, 1,
-0.116193, 0.3280511, 0.02083047, 0, 1, 0.6588235, 1,
-0.1139085, -2.788627, -3.110018, 0, 1, 0.6627451, 1,
-0.1078086, 1.049624, -0.05696969, 0, 1, 0.6705883, 1,
-0.1042854, 1.497422, -0.2914348, 0, 1, 0.6745098, 1,
-0.100402, -0.8371078, -0.4580858, 0, 1, 0.682353, 1,
-0.09838711, 0.3221626, -0.4911954, 0, 1, 0.6862745, 1,
-0.09696262, -0.8134958, -3.389699, 0, 1, 0.6941177, 1,
-0.09493778, 0.721027, -0.02858912, 0, 1, 0.7019608, 1,
-0.09300521, 0.6865852, 0.7583187, 0, 1, 0.7058824, 1,
-0.09273499, -0.07555127, -1.093613, 0, 1, 0.7137255, 1,
-0.09213725, 0.705612, -1.151818, 0, 1, 0.7176471, 1,
-0.08951015, -0.04948574, -0.4408005, 0, 1, 0.7254902, 1,
-0.08744103, -1.166583, -2.467386, 0, 1, 0.7294118, 1,
-0.08706795, -0.4796147, -1.490754, 0, 1, 0.7372549, 1,
-0.08563328, -0.3522436, -2.467858, 0, 1, 0.7411765, 1,
-0.08513374, -0.6092202, -2.725956, 0, 1, 0.7490196, 1,
-0.08409336, -0.8733492, -2.968472, 0, 1, 0.7529412, 1,
-0.07979039, 1.138327, -1.434191, 0, 1, 0.7607843, 1,
-0.07534914, -1.232825, -2.451705, 0, 1, 0.7647059, 1,
-0.07189324, -0.8988441, -3.021642, 0, 1, 0.772549, 1,
-0.07068726, 0.6520613, 0.8684707, 0, 1, 0.7764706, 1,
-0.06706899, -1.622669, -2.817017, 0, 1, 0.7843137, 1,
-0.06694936, -0.674656, -2.227657, 0, 1, 0.7882353, 1,
-0.0656589, 0.8584241, -1.108601, 0, 1, 0.7960784, 1,
-0.06298976, -0.2664422, -3.98193, 0, 1, 0.8039216, 1,
-0.06209655, 1.02927, 1.12048, 0, 1, 0.8078431, 1,
-0.06129193, 0.02743565, -0.2918462, 0, 1, 0.8156863, 1,
-0.05490732, -1.082752, -3.207053, 0, 1, 0.8196079, 1,
-0.0541415, 1.117544, -0.4148564, 0, 1, 0.827451, 1,
-0.05283844, 0.8808671, 1.75537, 0, 1, 0.8313726, 1,
-0.04730412, -0.4893164, -3.131564, 0, 1, 0.8392157, 1,
-0.044797, -2.434507, -4.638576, 0, 1, 0.8431373, 1,
-0.04246585, 0.514001, 0.1763225, 0, 1, 0.8509804, 1,
-0.0368563, -2.027416, -3.584804, 0, 1, 0.854902, 1,
-0.03455213, -0.5089986, -0.8426098, 0, 1, 0.8627451, 1,
-0.03018742, -0.1341833, -2.014132, 0, 1, 0.8666667, 1,
-0.02565138, -0.2087745, -4.266496, 0, 1, 0.8745098, 1,
-0.02345592, 0.5269089, -0.5810242, 0, 1, 0.8784314, 1,
-0.02258863, -1.27207, -4.159296, 0, 1, 0.8862745, 1,
-0.021902, -0.8323139, -2.999512, 0, 1, 0.8901961, 1,
-0.01868135, 0.777294, 0.1282652, 0, 1, 0.8980392, 1,
-0.01421674, 2.297366, -1.48532, 0, 1, 0.9058824, 1,
-0.01337682, 1.49315, -0.1461829, 0, 1, 0.9098039, 1,
-0.01095316, 1.216671, -0.408807, 0, 1, 0.9176471, 1,
-0.01032573, -1.325328, -3.321019, 0, 1, 0.9215686, 1,
-0.009909045, 0.07175311, -0.721745, 0, 1, 0.9294118, 1,
-0.007158077, 1.780373, -0.7899171, 0, 1, 0.9333333, 1,
-0.006927028, -0.3150792, -4.021604, 0, 1, 0.9411765, 1,
-0.006071462, -0.7414544, -4.41562, 0, 1, 0.945098, 1,
0.00278894, -1.350841, 2.663032, 0, 1, 0.9529412, 1,
0.008771064, -0.7686795, 2.007401, 0, 1, 0.9568627, 1,
0.01081209, -0.6797189, 2.069955, 0, 1, 0.9647059, 1,
0.01142104, 1.499732, 0.5085143, 0, 1, 0.9686275, 1,
0.01284861, 0.7713459, 1.410982, 0, 1, 0.9764706, 1,
0.0139342, 1.144453, 1.051326, 0, 1, 0.9803922, 1,
0.01754209, 1.809348, -0.6107213, 0, 1, 0.9882353, 1,
0.01836732, 0.02082948, -0.4987229, 0, 1, 0.9921569, 1,
0.01839874, 1.894027, 0.3730615, 0, 1, 1, 1,
0.0260037, 0.07515845, 0.8775471, 0, 0.9921569, 1, 1,
0.02606452, 0.08294658, 0.8357252, 0, 0.9882353, 1, 1,
0.02666084, -1.264784, 3.275182, 0, 0.9803922, 1, 1,
0.02772477, 0.3089805, -0.02897624, 0, 0.9764706, 1, 1,
0.03483133, -0.223152, 3.669928, 0, 0.9686275, 1, 1,
0.03590022, 1.143888, 1.70684, 0, 0.9647059, 1, 1,
0.03648405, 1.115639, -0.7916682, 0, 0.9568627, 1, 1,
0.03738818, 0.3261872, 0.06562895, 0, 0.9529412, 1, 1,
0.03749965, -0.08995903, 3.606703, 0, 0.945098, 1, 1,
0.03864391, -1.378338, 2.296907, 0, 0.9411765, 1, 1,
0.04325848, 1.279785, 1.154775, 0, 0.9333333, 1, 1,
0.04490292, 0.3951126, 0.7546313, 0, 0.9294118, 1, 1,
0.04749662, -0.2313882, 3.990988, 0, 0.9215686, 1, 1,
0.05236069, 0.3546296, 1.711984, 0, 0.9176471, 1, 1,
0.06732728, -2.143198, 3.321086, 0, 0.9098039, 1, 1,
0.06939902, 0.7747604, 0.8892945, 0, 0.9058824, 1, 1,
0.07058761, 2.306442, -0.01502635, 0, 0.8980392, 1, 1,
0.07392535, 0.7249478, -1.534415, 0, 0.8901961, 1, 1,
0.07428747, 0.1909059, 0.2717165, 0, 0.8862745, 1, 1,
0.07820431, 0.8433526, -1.102426, 0, 0.8784314, 1, 1,
0.07950351, -0.9448532, 5.328168, 0, 0.8745098, 1, 1,
0.08923508, 0.6896888, -0.4174413, 0, 0.8666667, 1, 1,
0.08992419, 0.6669553, 0.2004909, 0, 0.8627451, 1, 1,
0.09186839, 0.2123882, -0.7640203, 0, 0.854902, 1, 1,
0.09566777, 1.736035, 0.2369655, 0, 0.8509804, 1, 1,
0.09756219, -0.8384333, 3.26999, 0, 0.8431373, 1, 1,
0.1031353, -0.1748745, 3.892505, 0, 0.8392157, 1, 1,
0.1067669, -0.2605318, 2.436395, 0, 0.8313726, 1, 1,
0.1071302, 0.3743915, 1.247945, 0, 0.827451, 1, 1,
0.1081729, -0.06882812, 3.001819, 0, 0.8196079, 1, 1,
0.1130781, -0.116206, 3.379058, 0, 0.8156863, 1, 1,
0.1136788, 0.2998267, -0.04537536, 0, 0.8078431, 1, 1,
0.117218, -0.1281049, 2.008401, 0, 0.8039216, 1, 1,
0.1191705, 1.620234, 0.4152808, 0, 0.7960784, 1, 1,
0.1191888, -0.313525, 3.21749, 0, 0.7882353, 1, 1,
0.1197538, 2.338641, 0.2719574, 0, 0.7843137, 1, 1,
0.1197706, 0.9490678, 0.9780754, 0, 0.7764706, 1, 1,
0.1210349, -0.04889487, 2.5631, 0, 0.772549, 1, 1,
0.1229149, 0.4054316, -1.318731, 0, 0.7647059, 1, 1,
0.1264713, 0.6770114, -0.6072471, 0, 0.7607843, 1, 1,
0.1266896, 0.5721095, -0.4574342, 0, 0.7529412, 1, 1,
0.1316379, 1.100204, -1.613107, 0, 0.7490196, 1, 1,
0.1339805, 0.08674273, -0.4840779, 0, 0.7411765, 1, 1,
0.1348996, -0.9205529, 2.85156, 0, 0.7372549, 1, 1,
0.1363176, -1.722167, 2.601175, 0, 0.7294118, 1, 1,
0.1380267, 0.2292115, -0.03516868, 0, 0.7254902, 1, 1,
0.1393667, -0.0239899, 4.245805, 0, 0.7176471, 1, 1,
0.1402947, 1.376144, 0.04497297, 0, 0.7137255, 1, 1,
0.1420404, 0.6272665, 1.378295, 0, 0.7058824, 1, 1,
0.1443981, 0.8882792, 0.02614217, 0, 0.6980392, 1, 1,
0.1574016, 0.5552239, 1.116422, 0, 0.6941177, 1, 1,
0.1582867, -0.7130132, 2.70319, 0, 0.6862745, 1, 1,
0.1592819, 0.02621925, 1.991839, 0, 0.682353, 1, 1,
0.1596809, -0.4933569, 1.224223, 0, 0.6745098, 1, 1,
0.1598311, 1.064544, -1.506398, 0, 0.6705883, 1, 1,
0.160793, 0.3180861, 0.9586876, 0, 0.6627451, 1, 1,
0.1613766, -0.8372397, 2.085122, 0, 0.6588235, 1, 1,
0.1622986, -0.01364786, 1.548174, 0, 0.6509804, 1, 1,
0.1640595, 1.83688, -1.00319, 0, 0.6470588, 1, 1,
0.1641246, 0.6998011, -1.209369, 0, 0.6392157, 1, 1,
0.1673292, -0.3167199, 3.319172, 0, 0.6352941, 1, 1,
0.1706323, 0.212941, 1.674837, 0, 0.627451, 1, 1,
0.1710154, -0.2063801, 0.4300274, 0, 0.6235294, 1, 1,
0.1732335, 0.07935163, -0.65684, 0, 0.6156863, 1, 1,
0.1746833, -0.9659491, 2.323634, 0, 0.6117647, 1, 1,
0.1763398, -0.9272326, 4.293037, 0, 0.6039216, 1, 1,
0.177768, 0.3709221, 0.7738787, 0, 0.5960785, 1, 1,
0.1799079, -0.295677, 3.445984, 0, 0.5921569, 1, 1,
0.1804637, 0.2839039, 1.053856, 0, 0.5843138, 1, 1,
0.1851441, 2.512142, 0.2102854, 0, 0.5803922, 1, 1,
0.1870835, -0.7272775, 2.37632, 0, 0.572549, 1, 1,
0.1894642, -0.9861805, 1.624526, 0, 0.5686275, 1, 1,
0.1930842, -0.8261757, 2.272719, 0, 0.5607843, 1, 1,
0.1951633, 0.643448, -0.1894922, 0, 0.5568628, 1, 1,
0.1977051, 0.6736487, 0.1674355, 0, 0.5490196, 1, 1,
0.2050372, -0.784322, 4.17747, 0, 0.5450981, 1, 1,
0.2098839, 1.068079, 0.3209483, 0, 0.5372549, 1, 1,
0.2121677, 1.593681, 0.880047, 0, 0.5333334, 1, 1,
0.2184246, 0.8581219, 0.3755564, 0, 0.5254902, 1, 1,
0.2187583, 1.886319, 0.5120201, 0, 0.5215687, 1, 1,
0.2237994, 1.148726, -0.942895, 0, 0.5137255, 1, 1,
0.2254429, -0.6363133, 2.11079, 0, 0.509804, 1, 1,
0.2263627, 0.4437551, 1.751233, 0, 0.5019608, 1, 1,
0.2270093, -1.853866, 3.727355, 0, 0.4941176, 1, 1,
0.2304983, -0.1094179, 0.4418623, 0, 0.4901961, 1, 1,
0.2319644, 0.3362344, 1.252853, 0, 0.4823529, 1, 1,
0.23241, 0.645108, 2.147141, 0, 0.4784314, 1, 1,
0.2363454, -1.19694, 1.963101, 0, 0.4705882, 1, 1,
0.2377985, 0.8054597, 0.5063483, 0, 0.4666667, 1, 1,
0.2387906, -0.4668022, 3.348645, 0, 0.4588235, 1, 1,
0.2424514, 0.8099027, 0.04161008, 0, 0.454902, 1, 1,
0.2425051, 0.6716381, 1.126014, 0, 0.4470588, 1, 1,
0.2462475, -0.03042299, -0.5444286, 0, 0.4431373, 1, 1,
0.247341, 0.7150822, -0.573695, 0, 0.4352941, 1, 1,
0.2479093, -1.632316, 1.947385, 0, 0.4313726, 1, 1,
0.248522, -0.06823358, -0.2331118, 0, 0.4235294, 1, 1,
0.2539681, 0.1812011, 1.966066, 0, 0.4196078, 1, 1,
0.2548865, 0.1668462, 0.6437866, 0, 0.4117647, 1, 1,
0.2558776, 0.9452648, -1.186877, 0, 0.4078431, 1, 1,
0.2572402, 0.6209841, -0.1958723, 0, 0.4, 1, 1,
0.2613923, -0.248568, 2.088552, 0, 0.3921569, 1, 1,
0.2678191, -0.3495704, 1.726374, 0, 0.3882353, 1, 1,
0.2681853, -0.5169668, 2.279665, 0, 0.3803922, 1, 1,
0.2705706, -0.7404184, 2.441382, 0, 0.3764706, 1, 1,
0.2765374, 0.9495084, 0.8314931, 0, 0.3686275, 1, 1,
0.2776213, 0.6870201, 1.506775, 0, 0.3647059, 1, 1,
0.2842035, -0.07730968, 1.557615, 0, 0.3568628, 1, 1,
0.2884765, -0.966477, 3.26219, 0, 0.3529412, 1, 1,
0.291416, 0.9856277, 0.5171755, 0, 0.345098, 1, 1,
0.2950855, -0.3758928, 3.142171, 0, 0.3411765, 1, 1,
0.2975669, -0.2577797, 1.31282, 0, 0.3333333, 1, 1,
0.2982153, -0.456672, 2.620372, 0, 0.3294118, 1, 1,
0.2995818, 2.063832, 1.182561, 0, 0.3215686, 1, 1,
0.3010274, 0.690845, 1.272354, 0, 0.3176471, 1, 1,
0.3015842, 1.993094, -0.8468886, 0, 0.3098039, 1, 1,
0.3030574, 1.632562, -0.07897697, 0, 0.3058824, 1, 1,
0.3051235, -1.368275, 4.434319, 0, 0.2980392, 1, 1,
0.3060499, -0.7463309, 1.398063, 0, 0.2901961, 1, 1,
0.3096426, 1.492163, 2.327311, 0, 0.2862745, 1, 1,
0.310387, 1.257421, 0.6214072, 0, 0.2784314, 1, 1,
0.3111425, 0.02204719, 0.6836255, 0, 0.2745098, 1, 1,
0.3124021, 0.6220496, 0.2610864, 0, 0.2666667, 1, 1,
0.3143479, -0.8169773, 2.57954, 0, 0.2627451, 1, 1,
0.3148631, 0.06933215, 0.6629563, 0, 0.254902, 1, 1,
0.317505, 0.2255826, 0.6630149, 0, 0.2509804, 1, 1,
0.3216897, 1.083888, -0.9925675, 0, 0.2431373, 1, 1,
0.3220586, 1.380298, 1.4115, 0, 0.2392157, 1, 1,
0.3233932, 0.3303838, 0.6839391, 0, 0.2313726, 1, 1,
0.3236913, -1.08466, 1.772041, 0, 0.227451, 1, 1,
0.324194, -0.6561727, 2.076733, 0, 0.2196078, 1, 1,
0.3255271, -0.001812093, 0.8411849, 0, 0.2156863, 1, 1,
0.3257874, 0.6162217, -0.7584192, 0, 0.2078431, 1, 1,
0.3282113, 0.7259181, 1.1586, 0, 0.2039216, 1, 1,
0.3284699, -0.3082559, 1.506851, 0, 0.1960784, 1, 1,
0.3296729, -0.03857758, 3.065185, 0, 0.1882353, 1, 1,
0.3307541, 1.226875, 2.578716, 0, 0.1843137, 1, 1,
0.3398715, -0.1708671, 3.407737, 0, 0.1764706, 1, 1,
0.3433241, -0.6960752, 3.964543, 0, 0.172549, 1, 1,
0.3438247, 0.2467482, -0.1277654, 0, 0.1647059, 1, 1,
0.3446679, -1.514929, 2.64778, 0, 0.1607843, 1, 1,
0.3476099, 0.3730733, -0.9339646, 0, 0.1529412, 1, 1,
0.3484261, -0.6046752, 3.645803, 0, 0.1490196, 1, 1,
0.3511395, 1.050468, 0.3119771, 0, 0.1411765, 1, 1,
0.3514793, -1.662819, 1.487869, 0, 0.1372549, 1, 1,
0.3559049, 0.2312782, 0.9975216, 0, 0.1294118, 1, 1,
0.3565352, 1.918861, -0.3138045, 0, 0.1254902, 1, 1,
0.3583767, -0.7404643, 4.114756, 0, 0.1176471, 1, 1,
0.3609023, 1.160917, 1.039742, 0, 0.1137255, 1, 1,
0.3631415, -1.468211, 3.180195, 0, 0.1058824, 1, 1,
0.363674, -0.3763065, 1.664424, 0, 0.09803922, 1, 1,
0.3704369, 0.2920329, 1.140448, 0, 0.09411765, 1, 1,
0.3709373, 0.707989, 0.8587234, 0, 0.08627451, 1, 1,
0.3713647, 1.691412, -0.4278781, 0, 0.08235294, 1, 1,
0.3721328, 0.08788082, 1.639196, 0, 0.07450981, 1, 1,
0.3766527, 0.5146154, 1.333211, 0, 0.07058824, 1, 1,
0.3767471, 1.801462, 0.6177258, 0, 0.0627451, 1, 1,
0.3770029, 1.939733, -0.2481964, 0, 0.05882353, 1, 1,
0.3820924, -1.049824, 3.199796, 0, 0.05098039, 1, 1,
0.3826658, -0.5312554, 2.91625, 0, 0.04705882, 1, 1,
0.3841614, -1.096305, 3.153756, 0, 0.03921569, 1, 1,
0.3849784, 1.265455, 1.429606, 0, 0.03529412, 1, 1,
0.3909875, 1.147711, 1.181872, 0, 0.02745098, 1, 1,
0.3972571, -0.05321419, 1.086148, 0, 0.02352941, 1, 1,
0.4016142, 0.2114977, 1.151016, 0, 0.01568628, 1, 1,
0.4094738, 0.6907211, -1.156476, 0, 0.01176471, 1, 1,
0.4109921, -0.1365374, 1.30113, 0, 0.003921569, 1, 1,
0.4123573, 0.06176993, 2.593154, 0.003921569, 0, 1, 1,
0.4135999, 1.619874, 0.7284379, 0.007843138, 0, 1, 1,
0.4149444, 0.1707498, 0.977201, 0.01568628, 0, 1, 1,
0.416811, 0.9716628, -1.341142, 0.01960784, 0, 1, 1,
0.4265726, -0.008052168, 2.668113, 0.02745098, 0, 1, 1,
0.4272264, -2.236721, 2.500927, 0.03137255, 0, 1, 1,
0.4287605, 1.733848, 0.2595628, 0.03921569, 0, 1, 1,
0.4312277, -0.1819057, 2.545212, 0.04313726, 0, 1, 1,
0.4320019, 0.1013678, 2.368366, 0.05098039, 0, 1, 1,
0.4329243, 1.219296, -0.3801684, 0.05490196, 0, 1, 1,
0.4367853, -0.4133632, 1.837714, 0.0627451, 0, 1, 1,
0.4391557, 0.4410301, 0.2810923, 0.06666667, 0, 1, 1,
0.4465524, -1.021161, 3.571693, 0.07450981, 0, 1, 1,
0.4507283, 1.212197, -0.3671169, 0.07843138, 0, 1, 1,
0.4518335, 0.9581818, 0.07970236, 0.08627451, 0, 1, 1,
0.4537153, 0.4507833, 1.096662, 0.09019608, 0, 1, 1,
0.4665977, -0.5574232, 1.456078, 0.09803922, 0, 1, 1,
0.4737156, 0.177462, 2.032565, 0.1058824, 0, 1, 1,
0.4762028, -0.9357615, 1.2731, 0.1098039, 0, 1, 1,
0.4786437, -0.6861997, 1.316579, 0.1176471, 0, 1, 1,
0.4801916, 0.8231609, 2.416672, 0.1215686, 0, 1, 1,
0.4848535, 0.9142642, 0.4652248, 0.1294118, 0, 1, 1,
0.4866123, -0.2439561, 2.061955, 0.1333333, 0, 1, 1,
0.4873898, -2.022113, 2.992503, 0.1411765, 0, 1, 1,
0.495739, 0.2440103, 1.299799, 0.145098, 0, 1, 1,
0.4969422, -1.115161, 2.40466, 0.1529412, 0, 1, 1,
0.4978058, -0.5980003, 1.751489, 0.1568628, 0, 1, 1,
0.4984312, 0.1171631, 2.080727, 0.1647059, 0, 1, 1,
0.4992574, -0.7046108, 3.164734, 0.1686275, 0, 1, 1,
0.506747, 1.624539, 0.9016315, 0.1764706, 0, 1, 1,
0.5067668, -0.3763983, 3.334233, 0.1803922, 0, 1, 1,
0.5089356, 1.564355, 0.1266917, 0.1882353, 0, 1, 1,
0.5110031, 2.715783, -0.5583284, 0.1921569, 0, 1, 1,
0.5113556, 0.2799929, 0.7545205, 0.2, 0, 1, 1,
0.5129563, -0.2099719, 1.242849, 0.2078431, 0, 1, 1,
0.515914, 0.6942759, 0.6191792, 0.2117647, 0, 1, 1,
0.5241211, -0.2971902, 2.188976, 0.2196078, 0, 1, 1,
0.5265112, -1.056035, 2.855699, 0.2235294, 0, 1, 1,
0.5277932, 1.002663, 1.472163, 0.2313726, 0, 1, 1,
0.5333703, 0.8273841, 1.271177, 0.2352941, 0, 1, 1,
0.5337478, -0.5644785, 2.5977, 0.2431373, 0, 1, 1,
0.5357496, -0.3289427, 0.6473576, 0.2470588, 0, 1, 1,
0.5361708, -0.2399563, 1.668109, 0.254902, 0, 1, 1,
0.5443472, 0.692259, -0.233098, 0.2588235, 0, 1, 1,
0.5484508, -0.3739883, 1.262138, 0.2666667, 0, 1, 1,
0.5495292, -1.162371, 1.390459, 0.2705882, 0, 1, 1,
0.5508854, -0.1903703, 0.05570161, 0.2784314, 0, 1, 1,
0.5548375, -0.6762451, 2.219952, 0.282353, 0, 1, 1,
0.5550272, 1.105024, -0.6037059, 0.2901961, 0, 1, 1,
0.5594631, 0.5828095, 2.191936, 0.2941177, 0, 1, 1,
0.5611572, 0.556235, -0.1453847, 0.3019608, 0, 1, 1,
0.5635739, -0.9635717, 2.015393, 0.3098039, 0, 1, 1,
0.5649195, 1.438857, 0.9153158, 0.3137255, 0, 1, 1,
0.5697268, 0.7592048, 0.7154254, 0.3215686, 0, 1, 1,
0.5736548, -0.004229604, 0.2174527, 0.3254902, 0, 1, 1,
0.5746213, 0.1541912, 0.3583711, 0.3333333, 0, 1, 1,
0.5749465, -1.184488, 3.345187, 0.3372549, 0, 1, 1,
0.5768017, -1.039472, 3.10212, 0.345098, 0, 1, 1,
0.577991, 0.5327634, -0.570357, 0.3490196, 0, 1, 1,
0.5789893, -0.534992, 1.82348, 0.3568628, 0, 1, 1,
0.5792246, 0.5871056, 1.422315, 0.3607843, 0, 1, 1,
0.5823619, -0.8569686, 2.012854, 0.3686275, 0, 1, 1,
0.5879041, -1.889941, 3.102634, 0.372549, 0, 1, 1,
0.5905827, 0.2680167, 0.4730394, 0.3803922, 0, 1, 1,
0.5956053, -0.9683385, 3.763899, 0.3843137, 0, 1, 1,
0.5984777, -0.5507682, 3.509739, 0.3921569, 0, 1, 1,
0.5999678, 0.6173034, 0.902629, 0.3960784, 0, 1, 1,
0.6000973, 1.248199, 0.6761551, 0.4039216, 0, 1, 1,
0.6055095, -0.6425456, 2.825203, 0.4117647, 0, 1, 1,
0.6078808, 1.03824, -0.8039387, 0.4156863, 0, 1, 1,
0.6145313, -1.416025, 2.734331, 0.4235294, 0, 1, 1,
0.6165823, -0.1209502, 0.3252535, 0.427451, 0, 1, 1,
0.6224771, -0.3960422, 1.116108, 0.4352941, 0, 1, 1,
0.6433335, 1.138691, 0.2357736, 0.4392157, 0, 1, 1,
0.653939, -0.167015, 2.043535, 0.4470588, 0, 1, 1,
0.6540619, 0.277131, 1.461663, 0.4509804, 0, 1, 1,
0.655466, 0.4049608, -0.4923514, 0.4588235, 0, 1, 1,
0.6573094, -0.1438738, 4.200763, 0.4627451, 0, 1, 1,
0.6655409, -1.430717, 3.991845, 0.4705882, 0, 1, 1,
0.6666315, -0.703186, 2.849481, 0.4745098, 0, 1, 1,
0.6721984, 0.6134217, -0.0351591, 0.4823529, 0, 1, 1,
0.6730738, -1.60316, 3.091161, 0.4862745, 0, 1, 1,
0.6802106, -1.013018, 1.404224, 0.4941176, 0, 1, 1,
0.6838557, 1.187898, 0.4663797, 0.5019608, 0, 1, 1,
0.6906626, -0.6317015, 2.118958, 0.5058824, 0, 1, 1,
0.6911687, -0.005978468, 0.5168114, 0.5137255, 0, 1, 1,
0.6958366, 0.3017586, 0.4830847, 0.5176471, 0, 1, 1,
0.7054657, -0.6936592, 1.060063, 0.5254902, 0, 1, 1,
0.7065795, -0.35102, 2.774581, 0.5294118, 0, 1, 1,
0.7158245, 1.69448, 0.8226358, 0.5372549, 0, 1, 1,
0.7170075, -0.3227889, 1.642122, 0.5411765, 0, 1, 1,
0.7183165, -0.4050784, 3.301352, 0.5490196, 0, 1, 1,
0.7205445, 0.6458824, -1.043227, 0.5529412, 0, 1, 1,
0.7215419, -0.5653889, 2.290884, 0.5607843, 0, 1, 1,
0.7217849, -0.2345614, 1.128546, 0.5647059, 0, 1, 1,
0.724981, 0.5902377, 0.9518293, 0.572549, 0, 1, 1,
0.7258395, 0.3986388, 0.07454792, 0.5764706, 0, 1, 1,
0.731961, 0.8886216, 0.3884512, 0.5843138, 0, 1, 1,
0.7324875, 0.2298465, 0.6669742, 0.5882353, 0, 1, 1,
0.735366, -0.2697698, 3.172787, 0.5960785, 0, 1, 1,
0.7391309, -0.9387814, 2.889435, 0.6039216, 0, 1, 1,
0.7460861, -0.284842, 2.691439, 0.6078432, 0, 1, 1,
0.74617, -0.9570549, 4.739608, 0.6156863, 0, 1, 1,
0.7485526, 1.176115, -1.655698, 0.6196079, 0, 1, 1,
0.7508459, -1.14567, 1.523559, 0.627451, 0, 1, 1,
0.7516782, 1.765492, -0.4848964, 0.6313726, 0, 1, 1,
0.7548519, 0.703238, -0.3466738, 0.6392157, 0, 1, 1,
0.7566516, -1.439605, 2.216152, 0.6431373, 0, 1, 1,
0.7633635, -1.891036, 5.457729, 0.6509804, 0, 1, 1,
0.7695711, 0.384551, 1.752209, 0.654902, 0, 1, 1,
0.7764091, 1.043942, 1.224573, 0.6627451, 0, 1, 1,
0.783404, 1.796939, 1.938649, 0.6666667, 0, 1, 1,
0.7939691, -0.4940425, 1.923187, 0.6745098, 0, 1, 1,
0.7970014, 0.5218813, 1.524471, 0.6784314, 0, 1, 1,
0.8006753, -1.142979, 3.170835, 0.6862745, 0, 1, 1,
0.8011522, -0.7099728, 3.252409, 0.6901961, 0, 1, 1,
0.809333, 0.388881, 2.316441, 0.6980392, 0, 1, 1,
0.8102309, -0.1555971, 1.43828, 0.7058824, 0, 1, 1,
0.8137893, -0.213752, 1.062008, 0.7098039, 0, 1, 1,
0.8216201, 2.246337, 0.5927274, 0.7176471, 0, 1, 1,
0.8219934, 0.7791065, 1.077192, 0.7215686, 0, 1, 1,
0.8220714, 2.121294, 1.97537, 0.7294118, 0, 1, 1,
0.8225068, -2.165192, 2.267807, 0.7333333, 0, 1, 1,
0.8282238, -1.664913, 3.140035, 0.7411765, 0, 1, 1,
0.8368091, 0.3214892, 2.633738, 0.7450981, 0, 1, 1,
0.8374023, 1.910412, -0.08847953, 0.7529412, 0, 1, 1,
0.8376446, 0.04551562, 1.163153, 0.7568628, 0, 1, 1,
0.8398341, 0.1788195, 1.55296, 0.7647059, 0, 1, 1,
0.8420255, 0.2733358, 1.792718, 0.7686275, 0, 1, 1,
0.8427146, -0.2107947, 1.307432, 0.7764706, 0, 1, 1,
0.8486589, -0.2277547, 2.055129, 0.7803922, 0, 1, 1,
0.8496862, -0.5420593, 2.524387, 0.7882353, 0, 1, 1,
0.8524129, 0.9240135, 0.1461783, 0.7921569, 0, 1, 1,
0.8696142, -0.1973401, 1.367697, 0.8, 0, 1, 1,
0.8727978, 0.6267272, 2.70666, 0.8078431, 0, 1, 1,
0.8737601, 1.123881, 0.8927169, 0.8117647, 0, 1, 1,
0.877145, -0.8011234, 0.7476686, 0.8196079, 0, 1, 1,
0.8780294, -1.215135, 2.650039, 0.8235294, 0, 1, 1,
0.880871, -0.4174148, 0.5670947, 0.8313726, 0, 1, 1,
0.8809542, 0.461906, 1.152579, 0.8352941, 0, 1, 1,
0.8810886, -0.1298162, -0.3798002, 0.8431373, 0, 1, 1,
0.8836557, 0.2518513, -0.8986377, 0.8470588, 0, 1, 1,
0.887028, 0.3157737, 0.5380248, 0.854902, 0, 1, 1,
0.8937426, 0.1330671, 1.327087, 0.8588235, 0, 1, 1,
0.8970681, -0.2336533, 0.8589926, 0.8666667, 0, 1, 1,
0.9026889, -0.1185428, 2.735174, 0.8705882, 0, 1, 1,
0.9035434, -2.291499, 2.952852, 0.8784314, 0, 1, 1,
0.9050522, -0.4210538, 1.745004, 0.8823529, 0, 1, 1,
0.9161521, -1.676433, 4.802265, 0.8901961, 0, 1, 1,
0.9168833, -0.3938829, 1.814057, 0.8941177, 0, 1, 1,
0.92617, 1.478384, 2.243402, 0.9019608, 0, 1, 1,
0.9363043, -0.9691178, 2.206406, 0.9098039, 0, 1, 1,
0.9364721, 0.8165514, 2.41555, 0.9137255, 0, 1, 1,
0.9382797, 0.318267, 2.288582, 0.9215686, 0, 1, 1,
0.9422218, -0.2686282, 1.592456, 0.9254902, 0, 1, 1,
0.9427091, -1.665119, 2.135327, 0.9333333, 0, 1, 1,
0.9495361, -0.3015127, 2.420531, 0.9372549, 0, 1, 1,
0.9506407, 0.2039824, 2.975098, 0.945098, 0, 1, 1,
0.953801, -0.7470183, 1.592258, 0.9490196, 0, 1, 1,
0.9548475, 0.2313144, 2.856785, 0.9568627, 0, 1, 1,
0.9576821, -1.624927, 2.727713, 0.9607843, 0, 1, 1,
0.9588897, -0.5512611, 2.086931, 0.9686275, 0, 1, 1,
0.9644135, -0.9339724, 0.5300028, 0.972549, 0, 1, 1,
0.9677688, 1.486658, 1.614538, 0.9803922, 0, 1, 1,
0.9684677, 0.04438703, 3.112964, 0.9843137, 0, 1, 1,
0.9718442, -1.204456, 2.952293, 0.9921569, 0, 1, 1,
0.9759883, -1.524577, 3.138834, 0.9960784, 0, 1, 1,
0.9763662, 1.186576, 1.529344, 1, 0, 0.9960784, 1,
0.9812617, -1.450318, 2.680428, 1, 0, 0.9882353, 1,
0.9816468, -0.5631781, 2.225394, 1, 0, 0.9843137, 1,
0.9833029, -0.1580111, 0.9544832, 1, 0, 0.9764706, 1,
0.9848328, 0.6319466, -0.8631819, 1, 0, 0.972549, 1,
0.9871432, -0.5023584, 3.002132, 1, 0, 0.9647059, 1,
0.9882236, -0.4533598, 0.1746303, 1, 0, 0.9607843, 1,
0.9928234, 0.2038423, 2.175314, 1, 0, 0.9529412, 1,
1.010172, -0.1786695, 2.804456, 1, 0, 0.9490196, 1,
1.010339, 0.5104446, 0.9694577, 1, 0, 0.9411765, 1,
1.011259, 1.209708, 1.875084, 1, 0, 0.9372549, 1,
1.011643, 0.05727825, 2.636777, 1, 0, 0.9294118, 1,
1.012423, 0.5092008, 2.509457, 1, 0, 0.9254902, 1,
1.014919, -1.796195, 3.736124, 1, 0, 0.9176471, 1,
1.016122, -0.8278319, 1.338825, 1, 0, 0.9137255, 1,
1.01799, -0.9253714, 1.036139, 1, 0, 0.9058824, 1,
1.023124, -1.089501, 1.33843, 1, 0, 0.9019608, 1,
1.028049, -0.6962458, 2.346432, 1, 0, 0.8941177, 1,
1.030277, -0.3863768, 0.6410241, 1, 0, 0.8862745, 1,
1.03115, -0.7916659, 2.445168, 1, 0, 0.8823529, 1,
1.036328, -0.3957282, 2.025702, 1, 0, 0.8745098, 1,
1.038063, -0.7876146, 2.104414, 1, 0, 0.8705882, 1,
1.043538, 1.890966, -0.3091466, 1, 0, 0.8627451, 1,
1.043817, -1.208685, 1.491592, 1, 0, 0.8588235, 1,
1.046316, 0.02647865, 1.358795, 1, 0, 0.8509804, 1,
1.048477, -0.5821058, 1.735785, 1, 0, 0.8470588, 1,
1.051044, -0.5286866, 1.806394, 1, 0, 0.8392157, 1,
1.053139, 0.9964079, 0.6556803, 1, 0, 0.8352941, 1,
1.053207, -1.47228, 2.808594, 1, 0, 0.827451, 1,
1.053295, -0.7639258, 2.579028, 1, 0, 0.8235294, 1,
1.062109, -0.5364894, 2.064926, 1, 0, 0.8156863, 1,
1.065957, -0.8512248, 2.448845, 1, 0, 0.8117647, 1,
1.065964, 1.485365, 0.1635929, 1, 0, 0.8039216, 1,
1.069237, -1.971703, 2.71576, 1, 0, 0.7960784, 1,
1.07359, 1.276325, 1.038728, 1, 0, 0.7921569, 1,
1.076042, -0.09767266, 1.675829, 1, 0, 0.7843137, 1,
1.085539, -1.161918, 1.923406, 1, 0, 0.7803922, 1,
1.089464, -0.9664212, 1.371548, 1, 0, 0.772549, 1,
1.094407, 0.6998145, 2.657108, 1, 0, 0.7686275, 1,
1.095443, 1.553523, 1.133838, 1, 0, 0.7607843, 1,
1.097729, -0.3996033, 3.57841, 1, 0, 0.7568628, 1,
1.106876, -1.138707, 2.266795, 1, 0, 0.7490196, 1,
1.107152, 0.4526608, 0.9307905, 1, 0, 0.7450981, 1,
1.11597, -2.513453, 1.127229, 1, 0, 0.7372549, 1,
1.132161, 0.09193233, 0.6760875, 1, 0, 0.7333333, 1,
1.144935, -2.982937, 2.044915, 1, 0, 0.7254902, 1,
1.149463, 0.628507, 1.433962, 1, 0, 0.7215686, 1,
1.151889, -2.74136, 4.77781, 1, 0, 0.7137255, 1,
1.153781, -0.3186372, 1.281092, 1, 0, 0.7098039, 1,
1.171802, -0.0497563, 1.585616, 1, 0, 0.7019608, 1,
1.174955, 0.4291124, 1.549002, 1, 0, 0.6941177, 1,
1.17638, -0.4345312, 2.45502, 1, 0, 0.6901961, 1,
1.176991, 0.7144901, 0.7184464, 1, 0, 0.682353, 1,
1.179612, -1.218232, 4.153604, 1, 0, 0.6784314, 1,
1.183917, 0.9070077, 2.250896, 1, 0, 0.6705883, 1,
1.195457, -1.492602, 3.433958, 1, 0, 0.6666667, 1,
1.196956, -0.6487967, 4.570866, 1, 0, 0.6588235, 1,
1.198381, 1.120082, 0.6924468, 1, 0, 0.654902, 1,
1.200721, -1.070905, 2.128105, 1, 0, 0.6470588, 1,
1.203356, -1.023428, 2.131235, 1, 0, 0.6431373, 1,
1.206687, -0.03534734, 3.172462, 1, 0, 0.6352941, 1,
1.208452, -0.8136289, 1.985162, 1, 0, 0.6313726, 1,
1.215395, 0.438381, 0.5220796, 1, 0, 0.6235294, 1,
1.2244, -0.5457004, 2.088466, 1, 0, 0.6196079, 1,
1.235027, -0.7554868, 2.497857, 1, 0, 0.6117647, 1,
1.235231, -0.1895391, 1.395234, 1, 0, 0.6078432, 1,
1.236867, -0.5279967, 1.256367, 1, 0, 0.6, 1,
1.244512, 0.6315431, 1.12468, 1, 0, 0.5921569, 1,
1.246809, 0.02185229, 0.6204041, 1, 0, 0.5882353, 1,
1.253792, -1.035428, 2.219628, 1, 0, 0.5803922, 1,
1.258264, -0.4891905, 0.1922109, 1, 0, 0.5764706, 1,
1.262974, -0.129898, 2.736162, 1, 0, 0.5686275, 1,
1.267505, -1.233322, 2.85575, 1, 0, 0.5647059, 1,
1.272157, 1.685865, 1.352476, 1, 0, 0.5568628, 1,
1.274249, 1.796448, 1.326665, 1, 0, 0.5529412, 1,
1.277237, 0.7527133, 1.788542, 1, 0, 0.5450981, 1,
1.290297, 0.8751725, 2.070048, 1, 0, 0.5411765, 1,
1.293708, 0.9372219, 1.221492, 1, 0, 0.5333334, 1,
1.295126, -0.3011072, -1.218656, 1, 0, 0.5294118, 1,
1.298311, -0.9745551, 3.128933, 1, 0, 0.5215687, 1,
1.304448, -0.5734673, 0.8345332, 1, 0, 0.5176471, 1,
1.306273, -0.3833278, 0.6627684, 1, 0, 0.509804, 1,
1.320554, -1.532383, 1.100122, 1, 0, 0.5058824, 1,
1.321545, 0.4514345, 0.1102534, 1, 0, 0.4980392, 1,
1.327557, 0.2578274, 2.612492, 1, 0, 0.4901961, 1,
1.333937, 0.4066625, 0.1221169, 1, 0, 0.4862745, 1,
1.340284, 0.2329866, 1.193094, 1, 0, 0.4784314, 1,
1.34382, -0.7923034, 3.127297, 1, 0, 0.4745098, 1,
1.360858, 0.08339851, -0.03168694, 1, 0, 0.4666667, 1,
1.36542, 0.05551625, 2.026849, 1, 0, 0.4627451, 1,
1.381829, -0.0186963, 0.2621169, 1, 0, 0.454902, 1,
1.382686, -1.20753, 2.760252, 1, 0, 0.4509804, 1,
1.390623, -0.08101863, 2.85632, 1, 0, 0.4431373, 1,
1.400036, 1.00274, 0.8052489, 1, 0, 0.4392157, 1,
1.404891, 0.9997166, 2.337594, 1, 0, 0.4313726, 1,
1.40521, 0.6598881, 1.469506, 1, 0, 0.427451, 1,
1.406603, -0.4746029, 2.076787, 1, 0, 0.4196078, 1,
1.409092, 0.3776573, 0.1343698, 1, 0, 0.4156863, 1,
1.410547, 0.2023696, 1.870496, 1, 0, 0.4078431, 1,
1.43056, -0.6470021, 4.419537, 1, 0, 0.4039216, 1,
1.438717, -0.3201969, 1.529134, 1, 0, 0.3960784, 1,
1.443169, -2.565154, 2.224155, 1, 0, 0.3882353, 1,
1.443905, 0.3511305, -1.082636, 1, 0, 0.3843137, 1,
1.447114, -1.362791, 1.840763, 1, 0, 0.3764706, 1,
1.460608, -1.128215, 2.547958, 1, 0, 0.372549, 1,
1.477213, -0.6689652, 2.802063, 1, 0, 0.3647059, 1,
1.491372, -0.395838, 1.630462, 1, 0, 0.3607843, 1,
1.492696, 0.08378447, 1.70818, 1, 0, 0.3529412, 1,
1.50442, 0.3644592, 1.116277, 1, 0, 0.3490196, 1,
1.520887, -1.497859, 1.877036, 1, 0, 0.3411765, 1,
1.535158, 0.3581365, 1.820252, 1, 0, 0.3372549, 1,
1.542187, 0.6445253, 1.346449, 1, 0, 0.3294118, 1,
1.543412, -0.7586757, 0.4158705, 1, 0, 0.3254902, 1,
1.545989, 1.277656, 2.475591, 1, 0, 0.3176471, 1,
1.547224, -1.805462, 2.875705, 1, 0, 0.3137255, 1,
1.550224, 1.42149, 1.962475, 1, 0, 0.3058824, 1,
1.555035, 0.2090777, -1.056515, 1, 0, 0.2980392, 1,
1.581088, 1.192359, 0.4869998, 1, 0, 0.2941177, 1,
1.593987, -1.739421, 1.572175, 1, 0, 0.2862745, 1,
1.60369, -0.595324, 1.160338, 1, 0, 0.282353, 1,
1.61282, -1.166577, 2.030428, 1, 0, 0.2745098, 1,
1.621117, -0.368036, 1.744628, 1, 0, 0.2705882, 1,
1.629777, 0.7868301, 1.612589, 1, 0, 0.2627451, 1,
1.660283, -1.33212, 0.761808, 1, 0, 0.2588235, 1,
1.682014, -0.2599846, 2.161405, 1, 0, 0.2509804, 1,
1.683962, 2.138347, -1.878278, 1, 0, 0.2470588, 1,
1.691095, -0.6433121, 1.332728, 1, 0, 0.2392157, 1,
1.692805, -0.3507697, 3.747038, 1, 0, 0.2352941, 1,
1.697085, -0.0743003, 0.3530625, 1, 0, 0.227451, 1,
1.698919, -1.614748, 2.856076, 1, 0, 0.2235294, 1,
1.705642, -0.2800707, 2.567481, 1, 0, 0.2156863, 1,
1.708198, -1.287268, 2.640506, 1, 0, 0.2117647, 1,
1.719972, 0.4548274, 2.397061, 1, 0, 0.2039216, 1,
1.745024, -0.05683502, 1.951087, 1, 0, 0.1960784, 1,
1.788712, -0.2635194, 0.6742061, 1, 0, 0.1921569, 1,
1.793264, -0.1308704, 3.311285, 1, 0, 0.1843137, 1,
1.799854, 0.501918, 1.795746, 1, 0, 0.1803922, 1,
1.827922, -0.8723043, 1.246349, 1, 0, 0.172549, 1,
1.842922, 1.450879, -1.196493, 1, 0, 0.1686275, 1,
1.926197, 0.1764212, 0.3653008, 1, 0, 0.1607843, 1,
1.947275, 0.8027958, -1.360937, 1, 0, 0.1568628, 1,
1.963555, 0.5870458, 1.76762, 1, 0, 0.1490196, 1,
1.964703, 0.7257137, 2.023412, 1, 0, 0.145098, 1,
1.96614, -0.1303779, 1.982975, 1, 0, 0.1372549, 1,
1.974147, 0.9424542, -0.2298189, 1, 0, 0.1333333, 1,
1.978502, -0.9212115, 2.947498, 1, 0, 0.1254902, 1,
2.002199, -0.7035776, 2.699475, 1, 0, 0.1215686, 1,
2.013345, 0.8520146, 1.540921, 1, 0, 0.1137255, 1,
2.031281, -0.9804124, 3.248114, 1, 0, 0.1098039, 1,
2.089349, 1.839809, 0.7159148, 1, 0, 0.1019608, 1,
2.13153, 1.000409, 1.367741, 1, 0, 0.09411765, 1,
2.154075, 1.082508, 1.064801, 1, 0, 0.09019608, 1,
2.185125, -0.3613703, 0.7567139, 1, 0, 0.08235294, 1,
2.207541, -1.991319, 3.093495, 1, 0, 0.07843138, 1,
2.209038, 0.3803914, 0.8759517, 1, 0, 0.07058824, 1,
2.280558, 2.333258, 1.439468, 1, 0, 0.06666667, 1,
2.328049, -0.4818368, 1.764357, 1, 0, 0.05882353, 1,
2.460078, 0.8490931, -0.4522889, 1, 0, 0.05490196, 1,
2.554199, 0.818985, 2.307117, 1, 0, 0.04705882, 1,
2.662132, 0.1318352, 2.357195, 1, 0, 0.04313726, 1,
2.687408, 0.08883915, 1.841631, 1, 0, 0.03529412, 1,
2.724377, -0.9986512, 2.584077, 1, 0, 0.03137255, 1,
2.724421, -0.5279899, 0.349787, 1, 0, 0.02352941, 1,
2.826486, -0.0947047, 2.089748, 1, 0, 0.01960784, 1,
2.838724, -0.5063034, 2.844418, 1, 0, 0.01176471, 1,
3.372025, 0.578958, 0.3469596, 1, 0, 0.007843138, 1
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
0.1570559, -3.94887, -6.3499, 0, -0.5, 0.5, 0.5,
0.1570559, -3.94887, -6.3499, 1, -0.5, 0.5, 0.5,
0.1570559, -3.94887, -6.3499, 1, 1.5, 0.5, 0.5,
0.1570559, -3.94887, -6.3499, 0, 1.5, 0.5, 0.5
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
-4.147788, -0.1335771, -6.3499, 0, -0.5, 0.5, 0.5,
-4.147788, -0.1335771, -6.3499, 1, -0.5, 0.5, 0.5,
-4.147788, -0.1335771, -6.3499, 1, 1.5, 0.5, 0.5,
-4.147788, -0.1335771, -6.3499, 0, 1.5, 0.5, 0.5
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
-4.147788, -3.94887, 0.4095764, 0, -0.5, 0.5, 0.5,
-4.147788, -3.94887, 0.4095764, 1, -0.5, 0.5, 0.5,
-4.147788, -3.94887, 0.4095764, 1, 1.5, 0.5, 0.5,
-4.147788, -3.94887, 0.4095764, 0, 1.5, 0.5, 0.5
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
-3, -3.068418, -4.79002,
3, -3.068418, -4.79002,
-3, -3.068418, -4.79002,
-3, -3.21516, -5.050001,
-2, -3.068418, -4.79002,
-2, -3.21516, -5.050001,
-1, -3.068418, -4.79002,
-1, -3.21516, -5.050001,
0, -3.068418, -4.79002,
0, -3.21516, -5.050001,
1, -3.068418, -4.79002,
1, -3.21516, -5.050001,
2, -3.068418, -4.79002,
2, -3.21516, -5.050001,
3, -3.068418, -4.79002,
3, -3.21516, -5.050001
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
-3, -3.508644, -5.56996, 0, -0.5, 0.5, 0.5,
-3, -3.508644, -5.56996, 1, -0.5, 0.5, 0.5,
-3, -3.508644, -5.56996, 1, 1.5, 0.5, 0.5,
-3, -3.508644, -5.56996, 0, 1.5, 0.5, 0.5,
-2, -3.508644, -5.56996, 0, -0.5, 0.5, 0.5,
-2, -3.508644, -5.56996, 1, -0.5, 0.5, 0.5,
-2, -3.508644, -5.56996, 1, 1.5, 0.5, 0.5,
-2, -3.508644, -5.56996, 0, 1.5, 0.5, 0.5,
-1, -3.508644, -5.56996, 0, -0.5, 0.5, 0.5,
-1, -3.508644, -5.56996, 1, -0.5, 0.5, 0.5,
-1, -3.508644, -5.56996, 1, 1.5, 0.5, 0.5,
-1, -3.508644, -5.56996, 0, 1.5, 0.5, 0.5,
0, -3.508644, -5.56996, 0, -0.5, 0.5, 0.5,
0, -3.508644, -5.56996, 1, -0.5, 0.5, 0.5,
0, -3.508644, -5.56996, 1, 1.5, 0.5, 0.5,
0, -3.508644, -5.56996, 0, 1.5, 0.5, 0.5,
1, -3.508644, -5.56996, 0, -0.5, 0.5, 0.5,
1, -3.508644, -5.56996, 1, -0.5, 0.5, 0.5,
1, -3.508644, -5.56996, 1, 1.5, 0.5, 0.5,
1, -3.508644, -5.56996, 0, 1.5, 0.5, 0.5,
2, -3.508644, -5.56996, 0, -0.5, 0.5, 0.5,
2, -3.508644, -5.56996, 1, -0.5, 0.5, 0.5,
2, -3.508644, -5.56996, 1, 1.5, 0.5, 0.5,
2, -3.508644, -5.56996, 0, 1.5, 0.5, 0.5,
3, -3.508644, -5.56996, 0, -0.5, 0.5, 0.5,
3, -3.508644, -5.56996, 1, -0.5, 0.5, 0.5,
3, -3.508644, -5.56996, 1, 1.5, 0.5, 0.5,
3, -3.508644, -5.56996, 0, 1.5, 0.5, 0.5
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
-3.154362, -2, -4.79002,
-3.154362, 2, -4.79002,
-3.154362, -2, -4.79002,
-3.319933, -2, -5.050001,
-3.154362, -1, -4.79002,
-3.319933, -1, -5.050001,
-3.154362, 0, -4.79002,
-3.319933, 0, -5.050001,
-3.154362, 1, -4.79002,
-3.319933, 1, -5.050001,
-3.154362, 2, -4.79002,
-3.319933, 2, -5.050001
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
-3.651075, -2, -5.56996, 0, -0.5, 0.5, 0.5,
-3.651075, -2, -5.56996, 1, -0.5, 0.5, 0.5,
-3.651075, -2, -5.56996, 1, 1.5, 0.5, 0.5,
-3.651075, -2, -5.56996, 0, 1.5, 0.5, 0.5,
-3.651075, -1, -5.56996, 0, -0.5, 0.5, 0.5,
-3.651075, -1, -5.56996, 1, -0.5, 0.5, 0.5,
-3.651075, -1, -5.56996, 1, 1.5, 0.5, 0.5,
-3.651075, -1, -5.56996, 0, 1.5, 0.5, 0.5,
-3.651075, 0, -5.56996, 0, -0.5, 0.5, 0.5,
-3.651075, 0, -5.56996, 1, -0.5, 0.5, 0.5,
-3.651075, 0, -5.56996, 1, 1.5, 0.5, 0.5,
-3.651075, 0, -5.56996, 0, 1.5, 0.5, 0.5,
-3.651075, 1, -5.56996, 0, -0.5, 0.5, 0.5,
-3.651075, 1, -5.56996, 1, -0.5, 0.5, 0.5,
-3.651075, 1, -5.56996, 1, 1.5, 0.5, 0.5,
-3.651075, 1, -5.56996, 0, 1.5, 0.5, 0.5,
-3.651075, 2, -5.56996, 0, -0.5, 0.5, 0.5,
-3.651075, 2, -5.56996, 1, -0.5, 0.5, 0.5,
-3.651075, 2, -5.56996, 1, 1.5, 0.5, 0.5,
-3.651075, 2, -5.56996, 0, 1.5, 0.5, 0.5
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
-3.154362, -3.068418, -4,
-3.154362, -3.068418, 4,
-3.154362, -3.068418, -4,
-3.319933, -3.21516, -4,
-3.154362, -3.068418, -2,
-3.319933, -3.21516, -2,
-3.154362, -3.068418, 0,
-3.319933, -3.21516, 0,
-3.154362, -3.068418, 2,
-3.319933, -3.21516, 2,
-3.154362, -3.068418, 4,
-3.319933, -3.21516, 4
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
-3.651075, -3.508644, -4, 0, -0.5, 0.5, 0.5,
-3.651075, -3.508644, -4, 1, -0.5, 0.5, 0.5,
-3.651075, -3.508644, -4, 1, 1.5, 0.5, 0.5,
-3.651075, -3.508644, -4, 0, 1.5, 0.5, 0.5,
-3.651075, -3.508644, -2, 0, -0.5, 0.5, 0.5,
-3.651075, -3.508644, -2, 1, -0.5, 0.5, 0.5,
-3.651075, -3.508644, -2, 1, 1.5, 0.5, 0.5,
-3.651075, -3.508644, -2, 0, 1.5, 0.5, 0.5,
-3.651075, -3.508644, 0, 0, -0.5, 0.5, 0.5,
-3.651075, -3.508644, 0, 1, -0.5, 0.5, 0.5,
-3.651075, -3.508644, 0, 1, 1.5, 0.5, 0.5,
-3.651075, -3.508644, 0, 0, 1.5, 0.5, 0.5,
-3.651075, -3.508644, 2, 0, -0.5, 0.5, 0.5,
-3.651075, -3.508644, 2, 1, -0.5, 0.5, 0.5,
-3.651075, -3.508644, 2, 1, 1.5, 0.5, 0.5,
-3.651075, -3.508644, 2, 0, 1.5, 0.5, 0.5,
-3.651075, -3.508644, 4, 0, -0.5, 0.5, 0.5,
-3.651075, -3.508644, 4, 1, -0.5, 0.5, 0.5,
-3.651075, -3.508644, 4, 1, 1.5, 0.5, 0.5,
-3.651075, -3.508644, 4, 0, 1.5, 0.5, 0.5
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
-3.154362, -3.068418, -4.79002,
-3.154362, 2.801263, -4.79002,
-3.154362, -3.068418, 5.609173,
-3.154362, 2.801263, 5.609173,
-3.154362, -3.068418, -4.79002,
-3.154362, -3.068418, 5.609173,
-3.154362, 2.801263, -4.79002,
-3.154362, 2.801263, 5.609173,
-3.154362, -3.068418, -4.79002,
3.468474, -3.068418, -4.79002,
-3.154362, -3.068418, 5.609173,
3.468474, -3.068418, 5.609173,
-3.154362, 2.801263, -4.79002,
3.468474, 2.801263, -4.79002,
-3.154362, 2.801263, 5.609173,
3.468474, 2.801263, 5.609173,
3.468474, -3.068418, -4.79002,
3.468474, 2.801263, -4.79002,
3.468474, -3.068418, 5.609173,
3.468474, 2.801263, 5.609173,
3.468474, -3.068418, -4.79002,
3.468474, -3.068418, 5.609173,
3.468474, 2.801263, -4.79002,
3.468474, 2.801263, 5.609173
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
var radius = 7.291492;
var distance = 32.44067;
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
mvMatrix.translate( -0.1570559, 0.1335771, -0.4095764 );
mvMatrix.scale( 1.190382, 1.343123, 0.7581072 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.44067);
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
hexythiazox<-read.table("hexythiazox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hexythiazox$V2
```

```
## Error in eval(expr, envir, enclos): object 'hexythiazox' not found
```

```r
y<-hexythiazox$V3
```

```
## Error in eval(expr, envir, enclos): object 'hexythiazox' not found
```

```r
z<-hexythiazox$V4
```

```
## Error in eval(expr, envir, enclos): object 'hexythiazox' not found
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
-3.057913, -1.407148, -2.629018, 0, 0, 1, 1, 1,
-3.023915, -1.320011, -1.152151, 1, 0, 0, 1, 1,
-2.453722, 0.3387142, -2.370665, 1, 0, 0, 1, 1,
-2.402488, 1.747181, -1.819642, 1, 0, 0, 1, 1,
-2.384456, 0.1818558, -1.358685, 1, 0, 0, 1, 1,
-2.369107, -0.03771592, -1.9725, 1, 0, 0, 1, 1,
-2.355163, -0.3039623, -1.816879, 0, 0, 0, 1, 1,
-2.33806, -0.1690108, -1.646925, 0, 0, 0, 1, 1,
-2.299268, -1.309953, -0.08971447, 0, 0, 0, 1, 1,
-2.291697, 0.5926226, -1.148599, 0, 0, 0, 1, 1,
-2.271048, -0.2691487, -0.8138636, 0, 0, 0, 1, 1,
-2.23203, -0.8403599, -0.8022866, 0, 0, 0, 1, 1,
-2.153512, -0.1069441, -1.739329, 0, 0, 0, 1, 1,
-2.12642, 0.8328871, -2.672135, 1, 1, 1, 1, 1,
-2.122428, -0.9070086, -1.54209, 1, 1, 1, 1, 1,
-2.095319, -0.4748284, -1.534071, 1, 1, 1, 1, 1,
-2.092451, 0.1368226, -0.5908885, 1, 1, 1, 1, 1,
-2.079653, 0.7331555, -1.137645, 1, 1, 1, 1, 1,
-2.07361, 0.7264388, -1.32876, 1, 1, 1, 1, 1,
-2.064049, 0.7506697, -0.3000377, 1, 1, 1, 1, 1,
-2.062326, 0.9041246, -2.021316, 1, 1, 1, 1, 1,
-2.046113, 0.9392992, -1.704812, 1, 1, 1, 1, 1,
-2.032822, 1.284287, -0.4677868, 1, 1, 1, 1, 1,
-2.013913, -1.089564, -1.582996, 1, 1, 1, 1, 1,
-2.000798, 1.320182, -1.957793, 1, 1, 1, 1, 1,
-1.961862, 0.861585, -0.0222461, 1, 1, 1, 1, 1,
-1.929466, -0.7899213, -2.087801, 1, 1, 1, 1, 1,
-1.924027, -1.086324, -1.999034, 1, 1, 1, 1, 1,
-1.923474, 0.8704094, -2.132546, 0, 0, 1, 1, 1,
-1.900625, -0.3320181, -2.876633, 1, 0, 0, 1, 1,
-1.880639, -0.06237076, -1.313353, 1, 0, 0, 1, 1,
-1.872826, 1.567124, -0.7214165, 1, 0, 0, 1, 1,
-1.85822, 0.1319668, 0.7923625, 1, 0, 0, 1, 1,
-1.853175, -1.021755, -2.919247, 1, 0, 0, 1, 1,
-1.851945, 1.452094, -0.01883439, 0, 0, 0, 1, 1,
-1.835508, -0.06990542, -1.802163, 0, 0, 0, 1, 1,
-1.833925, 0.7505254, -1.947376, 0, 0, 0, 1, 1,
-1.832661, -0.6227948, -2.350929, 0, 0, 0, 1, 1,
-1.820248, -1.179908, -0.1406304, 0, 0, 0, 1, 1,
-1.813179, -0.9852514, -4.407906, 0, 0, 0, 1, 1,
-1.805681, -0.8673813, -3.261221, 0, 0, 0, 1, 1,
-1.799505, -1.884757, -1.314677, 1, 1, 1, 1, 1,
-1.790248, -2.038971, -2.749028, 1, 1, 1, 1, 1,
-1.780924, -0.03194829, -1.867377, 1, 1, 1, 1, 1,
-1.779426, 1.35559, -1.91493, 1, 1, 1, 1, 1,
-1.77403, -0.2841943, -1.355861, 1, 1, 1, 1, 1,
-1.771092, 0.4163507, -1.31507, 1, 1, 1, 1, 1,
-1.759215, -1.057244, -2.383455, 1, 1, 1, 1, 1,
-1.745204, -0.09072828, -0.7258903, 1, 1, 1, 1, 1,
-1.74434, 0.2142654, -1.045608, 1, 1, 1, 1, 1,
-1.743349, 1.381183, -0.5532159, 1, 1, 1, 1, 1,
-1.740642, -0.8042282, 0.1544372, 1, 1, 1, 1, 1,
-1.710953, 1.717517, -1.26154, 1, 1, 1, 1, 1,
-1.707382, 0.9947895, -0.1181518, 1, 1, 1, 1, 1,
-1.6788, -1.603159, -2.169308, 1, 1, 1, 1, 1,
-1.665326, 2.51779, 0.6032824, 1, 1, 1, 1, 1,
-1.664098, -1.573233, -2.830193, 0, 0, 1, 1, 1,
-1.660504, 0.2978078, -0.5121594, 1, 0, 0, 1, 1,
-1.654066, 1.811713, -0.5834146, 1, 0, 0, 1, 1,
-1.652975, 0.9745346, -2.206124, 1, 0, 0, 1, 1,
-1.651622, 0.2136907, 0.5736607, 1, 0, 0, 1, 1,
-1.648661, 0.4358247, -0.7051381, 1, 0, 0, 1, 1,
-1.644399, -0.358999, -2.653597, 0, 0, 0, 1, 1,
-1.643661, 0.7321004, -1.638203, 0, 0, 0, 1, 1,
-1.63372, 0.2126065, 0.5833321, 0, 0, 0, 1, 1,
-1.587501, -0.2455857, -1.499593, 0, 0, 0, 1, 1,
-1.583195, -0.7166082, -2.653221, 0, 0, 0, 1, 1,
-1.564065, 1.783354, -0.8858316, 0, 0, 0, 1, 1,
-1.560758, -1.587233, -1.044541, 0, 0, 0, 1, 1,
-1.557234, -1.870312, -0.2900963, 1, 1, 1, 1, 1,
-1.551437, 0.1213789, -0.1522654, 1, 1, 1, 1, 1,
-1.5429, -0.73932, -1.928806, 1, 1, 1, 1, 1,
-1.54239, -0.8673354, -4.396186, 1, 1, 1, 1, 1,
-1.53559, 0.7327814, -0.9301395, 1, 1, 1, 1, 1,
-1.51037, -0.8202737, -2.513912, 1, 1, 1, 1, 1,
-1.474922, -1.598657, -2.110155, 1, 1, 1, 1, 1,
-1.466016, -0.8110194, 0.3206675, 1, 1, 1, 1, 1,
-1.460152, -0.4185715, -3.899261, 1, 1, 1, 1, 1,
-1.422758, 0.002178918, -1.283986, 1, 1, 1, 1, 1,
-1.417996, -0.9824004, -3.084398, 1, 1, 1, 1, 1,
-1.416977, -0.4978883, -3.087025, 1, 1, 1, 1, 1,
-1.40893, 0.8908626, -0.5890575, 1, 1, 1, 1, 1,
-1.404803, 2.130346, 0.9944998, 1, 1, 1, 1, 1,
-1.399197, 0.4235371, -1.709166, 1, 1, 1, 1, 1,
-1.398879, -0.2120588, -1.569757, 0, 0, 1, 1, 1,
-1.398835, -2.044084, -1.703091, 1, 0, 0, 1, 1,
-1.397689, -0.6678956, -1.797979, 1, 0, 0, 1, 1,
-1.392483, -1.190161, -3.07693, 1, 0, 0, 1, 1,
-1.38742, -0.8571153, -3.059248, 1, 0, 0, 1, 1,
-1.384382, 0.6600599, -0.8969806, 1, 0, 0, 1, 1,
-1.382932, 0.007735308, -0.08373819, 0, 0, 0, 1, 1,
-1.380742, 1.441722, 1.018221, 0, 0, 0, 1, 1,
-1.37069, -0.4399219, -2.937191, 0, 0, 0, 1, 1,
-1.369735, 0.01327548, -1.368816, 0, 0, 0, 1, 1,
-1.367519, 1.618364, -0.1180811, 0, 0, 0, 1, 1,
-1.36716, 0.279707, 0.5065651, 0, 0, 0, 1, 1,
-1.359942, -2.01559, -1.744994, 0, 0, 0, 1, 1,
-1.356355, 1.475559, -1.622167, 1, 1, 1, 1, 1,
-1.348739, -0.5430686, -3.055585, 1, 1, 1, 1, 1,
-1.345495, 0.8136971, -3.287231, 1, 1, 1, 1, 1,
-1.343489, -0.8752585, -2.695357, 1, 1, 1, 1, 1,
-1.341702, 0.3603081, -1.234997, 1, 1, 1, 1, 1,
-1.337182, 0.2581003, -0.1776272, 1, 1, 1, 1, 1,
-1.334008, -1.623432, -3.472542, 1, 1, 1, 1, 1,
-1.332645, 0.06734973, -3.868388, 1, 1, 1, 1, 1,
-1.331246, 0.3766521, -1.094019, 1, 1, 1, 1, 1,
-1.324989, -0.6513842, -1.6861, 1, 1, 1, 1, 1,
-1.320127, 0.6049592, -1.228419, 1, 1, 1, 1, 1,
-1.313261, -0.1991146, -1.336735, 1, 1, 1, 1, 1,
-1.312962, -0.7136562, -2.089069, 1, 1, 1, 1, 1,
-1.299165, -1.554209, -1.619231, 1, 1, 1, 1, 1,
-1.294076, 0.1980021, -3.985765, 1, 1, 1, 1, 1,
-1.29333, -0.0759251, -1.169685, 0, 0, 1, 1, 1,
-1.292642, 0.5688455, -1.212789, 1, 0, 0, 1, 1,
-1.283681, 0.5778982, -2.188707, 1, 0, 0, 1, 1,
-1.280997, -0.2197906, -0.9486697, 1, 0, 0, 1, 1,
-1.261902, -0.1312689, -2.527417, 1, 0, 0, 1, 1,
-1.261747, -0.02691074, -0.3126191, 1, 0, 0, 1, 1,
-1.252457, 0.2489231, -2.442371, 0, 0, 0, 1, 1,
-1.246112, -0.8250425, -1.194479, 0, 0, 0, 1, 1,
-1.233085, 0.8371296, -1.24418, 0, 0, 0, 1, 1,
-1.229213, -1.207996, -1.551533, 0, 0, 0, 1, 1,
-1.22581, -1.710421, -1.793826, 0, 0, 0, 1, 1,
-1.21155, 1.052903, -0.9839422, 0, 0, 0, 1, 1,
-1.210892, -0.4969398, -2.834847, 0, 0, 0, 1, 1,
-1.209314, -1.111408, -2.012435, 1, 1, 1, 1, 1,
-1.206499, 0.6878221, -2.62274, 1, 1, 1, 1, 1,
-1.202353, 0.5343391, 0.9398921, 1, 1, 1, 1, 1,
-1.1979, -0.5722694, -0.8940584, 1, 1, 1, 1, 1,
-1.190143, -0.05908926, -1.977513, 1, 1, 1, 1, 1,
-1.187983, -0.6174008, -2.947991, 1, 1, 1, 1, 1,
-1.183155, 0.1164344, -2.455812, 1, 1, 1, 1, 1,
-1.183107, 1.588401, -0.6851171, 1, 1, 1, 1, 1,
-1.1806, 0.2114163, -0.825663, 1, 1, 1, 1, 1,
-1.180413, -0.4580047, -3.658503, 1, 1, 1, 1, 1,
-1.180037, 1.318661, -0.8205183, 1, 1, 1, 1, 1,
-1.17914, 0.831601, 1.245797, 1, 1, 1, 1, 1,
-1.165102, 0.3415863, -1.079425, 1, 1, 1, 1, 1,
-1.154295, -0.02766014, -2.748943, 1, 1, 1, 1, 1,
-1.140771, 0.338247, 0.2137243, 1, 1, 1, 1, 1,
-1.140564, -0.2471949, -0.4389244, 0, 0, 1, 1, 1,
-1.139937, 1.357587, -2.200182, 1, 0, 0, 1, 1,
-1.137703, 1.253371, -1.223654, 1, 0, 0, 1, 1,
-1.131776, 1.209097, -2.217192, 1, 0, 0, 1, 1,
-1.131371, -1.521653, -2.880228, 1, 0, 0, 1, 1,
-1.120344, -0.6259102, -2.489652, 1, 0, 0, 1, 1,
-1.115051, 1.842148, 1.081366, 0, 0, 0, 1, 1,
-1.108113, 2.431072, 0.8410169, 0, 0, 0, 1, 1,
-1.105752, -0.03118403, -1.768539, 0, 0, 0, 1, 1,
-1.104799, 1.052756, -0.4540803, 0, 0, 0, 1, 1,
-1.10208, 1.024424, 0.8371695, 0, 0, 0, 1, 1,
-1.101089, 0.1429371, -2.926736, 0, 0, 0, 1, 1,
-1.081765, 0.5042561, -0.9905446, 0, 0, 0, 1, 1,
-1.07172, -0.1944134, -1.227551, 1, 1, 1, 1, 1,
-1.061944, -1.602495, -1.98039, 1, 1, 1, 1, 1,
-1.0619, -0.9776124, -3.061803, 1, 1, 1, 1, 1,
-1.05683, -1.534465, -2.064039, 1, 1, 1, 1, 1,
-1.053621, -0.7260712, -1.776386, 1, 1, 1, 1, 1,
-1.050575, -2.70144, -3.499784, 1, 1, 1, 1, 1,
-1.029243, -1.32454, -2.573277, 1, 1, 1, 1, 1,
-1.024187, -0.1523028, -2.664204, 1, 1, 1, 1, 1,
-1.018263, 0.2689001, -0.4656552, 1, 1, 1, 1, 1,
-1.01119, 0.09584617, -1.462432, 1, 1, 1, 1, 1,
-1.002803, 0.2869623, -1.011067, 1, 1, 1, 1, 1,
-1.00224, -0.6513227, -1.044516, 1, 1, 1, 1, 1,
-0.9982676, 0.6076559, -0.1569165, 1, 1, 1, 1, 1,
-0.9967807, -0.7601596, -1.977111, 1, 1, 1, 1, 1,
-0.99657, -0.1311803, -0.3869004, 1, 1, 1, 1, 1,
-0.9924886, 0.2048535, -2.604916, 0, 0, 1, 1, 1,
-0.9812192, -0.1244373, -0.9863634, 1, 0, 0, 1, 1,
-0.9770553, 1.609419, 0.2126201, 1, 0, 0, 1, 1,
-0.9748245, -1.843476, -2.772261, 1, 0, 0, 1, 1,
-0.9699998, 0.3653525, -1.332803, 1, 0, 0, 1, 1,
-0.9652926, -0.9970114, -2.037587, 1, 0, 0, 1, 1,
-0.9545909, 0.8093191, -1.810693, 0, 0, 0, 1, 1,
-0.9499803, 0.5101371, -0.06180687, 0, 0, 0, 1, 1,
-0.9476506, -0.07997794, -2.675972, 0, 0, 0, 1, 1,
-0.9461083, 0.5637679, -3.274642, 0, 0, 0, 1, 1,
-0.9452311, 0.6359918, 0.1054585, 0, 0, 0, 1, 1,
-0.9412878, 1.225822, -1.190061, 0, 0, 0, 1, 1,
-0.9400283, -0.3782743, -1.479785, 0, 0, 0, 1, 1,
-0.9396241, -1.978553, -1.848748, 1, 1, 1, 1, 1,
-0.9387079, 0.4264736, -1.200352, 1, 1, 1, 1, 1,
-0.9364537, -0.03845003, -1.90765, 1, 1, 1, 1, 1,
-0.9198371, 0.4390875, -0.3269094, 1, 1, 1, 1, 1,
-0.9177603, -0.005755492, -1.374218, 1, 1, 1, 1, 1,
-0.9175536, -2.163548, -3.707824, 1, 1, 1, 1, 1,
-0.9151293, -2.282703, -3.634884, 1, 1, 1, 1, 1,
-0.9083797, -1.039523, -3.060944, 1, 1, 1, 1, 1,
-0.9028288, 1.944904, -0.1191231, 1, 1, 1, 1, 1,
-0.8986862, -0.1319236, -0.9936805, 1, 1, 1, 1, 1,
-0.8969887, 1.232125, -1.858028, 1, 1, 1, 1, 1,
-0.8958157, 0.6804537, 0.3656664, 1, 1, 1, 1, 1,
-0.8931111, -0.5616885, -1.64528, 1, 1, 1, 1, 1,
-0.8694512, 1.400114, -0.3864021, 1, 1, 1, 1, 1,
-0.8694481, 1.839423, -0.6746719, 1, 1, 1, 1, 1,
-0.8603852, -0.09021028, -1.826677, 0, 0, 1, 1, 1,
-0.8578865, 1.617054, -0.5714682, 1, 0, 0, 1, 1,
-0.856521, 0.19189, -2.205944, 1, 0, 0, 1, 1,
-0.8510116, -2.652742, -2.64046, 1, 0, 0, 1, 1,
-0.8498119, 0.5899657, -0.954949, 1, 0, 0, 1, 1,
-0.8493953, 1.239153, 0.7655363, 1, 0, 0, 1, 1,
-0.8486487, 1.261297, -0.08861533, 0, 0, 0, 1, 1,
-0.8483778, 0.7118041, -1.189706, 0, 0, 0, 1, 1,
-0.8461877, -1.326851, -1.568607, 0, 0, 0, 1, 1,
-0.8328453, 0.7641568, -1.414961, 0, 0, 0, 1, 1,
-0.8321224, -0.2432494, -0.4199086, 0, 0, 0, 1, 1,
-0.8316851, -1.252105, -3.065712, 0, 0, 0, 1, 1,
-0.8316373, 1.862281, -0.4037279, 0, 0, 0, 1, 1,
-0.8236855, -0.5499771, -1.68529, 1, 1, 1, 1, 1,
-0.8204855, -0.3902074, -2.747587, 1, 1, 1, 1, 1,
-0.8188381, -0.8292662, -2.332894, 1, 1, 1, 1, 1,
-0.8172016, -0.5948349, 0.3281484, 1, 1, 1, 1, 1,
-0.8117262, 0.2201606, -1.096631, 1, 1, 1, 1, 1,
-0.8091514, 0.4327469, 0.2263243, 1, 1, 1, 1, 1,
-0.8089643, 0.4158437, -0.4140674, 1, 1, 1, 1, 1,
-0.806829, 1.207638, 0.02447841, 1, 1, 1, 1, 1,
-0.8056046, 0.3000436, -2.277714, 1, 1, 1, 1, 1,
-0.8039436, -0.9918376, -2.634323, 1, 1, 1, 1, 1,
-0.7975381, -2.585106, -2.523853, 1, 1, 1, 1, 1,
-0.7940891, 0.2777788, -1.545556, 1, 1, 1, 1, 1,
-0.7933301, -0.5963976, -2.575268, 1, 1, 1, 1, 1,
-0.7918054, 0.01714311, -0.7483476, 1, 1, 1, 1, 1,
-0.7858579, 0.7068161, 0.04750173, 1, 1, 1, 1, 1,
-0.7803622, -0.3138541, -3.591553, 0, 0, 1, 1, 1,
-0.7780084, 1.435219, -2.070903, 1, 0, 0, 1, 1,
-0.776437, -0.6121342, -2.127546, 1, 0, 0, 1, 1,
-0.7724851, -1.53361, -4.591866, 1, 0, 0, 1, 1,
-0.7715946, 1.531311, -2.047643, 1, 0, 0, 1, 1,
-0.7685232, -0.8227799, -3.415346, 1, 0, 0, 1, 1,
-0.75612, 0.4121316, 1.287434, 0, 0, 0, 1, 1,
-0.753173, -0.04923803, -0.900539, 0, 0, 0, 1, 1,
-0.7514797, -0.5863698, -2.614201, 0, 0, 0, 1, 1,
-0.7482865, -0.1818679, -2.112068, 0, 0, 0, 1, 1,
-0.7459181, -2.391747, -1.132704, 0, 0, 0, 1, 1,
-0.7403227, 1.49792, -0.2433606, 0, 0, 0, 1, 1,
-0.7353828, 0.9122562, -0.4859988, 0, 0, 0, 1, 1,
-0.7337885, -0.529934, -1.988266, 1, 1, 1, 1, 1,
-0.7324331, 0.8156999, 2.2745, 1, 1, 1, 1, 1,
-0.7292652, 0.3713074, -1.898556, 1, 1, 1, 1, 1,
-0.7290751, -0.8378794, 0.2497785, 1, 1, 1, 1, 1,
-0.7262892, 0.6426506, -1.856552, 1, 1, 1, 1, 1,
-0.7249111, -0.7467778, -0.8564435, 1, 1, 1, 1, 1,
-0.7239622, 2.072122, -0.1435805, 1, 1, 1, 1, 1,
-0.723139, 1.066443, -0.2116337, 1, 1, 1, 1, 1,
-0.7225958, -0.9100721, -2.72791, 1, 1, 1, 1, 1,
-0.7144704, -1.934243, -2.670573, 1, 1, 1, 1, 1,
-0.7013898, 1.03005, -0.1002743, 1, 1, 1, 1, 1,
-0.6978047, -0.4595165, -1.700928, 1, 1, 1, 1, 1,
-0.6960283, -0.4665241, -1.82541, 1, 1, 1, 1, 1,
-0.6901567, -0.6803263, -1.233806, 1, 1, 1, 1, 1,
-0.6854278, 2.416492, -2.001693, 1, 1, 1, 1, 1,
-0.681053, 1.454936, -1.976775, 0, 0, 1, 1, 1,
-0.6795442, -0.5340483, -1.153236, 1, 0, 0, 1, 1,
-0.6768398, -1.209647, -2.154934, 1, 0, 0, 1, 1,
-0.6669209, -0.3477613, -1.984683, 1, 0, 0, 1, 1,
-0.6652816, 0.2727841, -0.6478388, 1, 0, 0, 1, 1,
-0.6609495, -1.416782, -2.981134, 1, 0, 0, 1, 1,
-0.6534492, -2.838425, -0.6559793, 0, 0, 0, 1, 1,
-0.6529945, -0.717761, -2.361164, 0, 0, 0, 1, 1,
-0.6505914, 1.102761, 0.4336819, 0, 0, 0, 1, 1,
-0.6427597, 0.9195013, -2.540827, 0, 0, 0, 1, 1,
-0.6422744, 0.7316913, 0.6194531, 0, 0, 0, 1, 1,
-0.6376346, 1.803611, -0.9773154, 0, 0, 0, 1, 1,
-0.6368837, 2.031358, 1.207478, 0, 0, 0, 1, 1,
-0.6356561, 0.4164376, -1.37097, 1, 1, 1, 1, 1,
-0.6305714, 1.217171, -2.401166, 1, 1, 1, 1, 1,
-0.6296905, -0.7073372, -2.886956, 1, 1, 1, 1, 1,
-0.6294214, 0.7855306, -1.722936, 1, 1, 1, 1, 1,
-0.6288276, -0.2353131, -1.714676, 1, 1, 1, 1, 1,
-0.6286973, -0.7867625, -2.896677, 1, 1, 1, 1, 1,
-0.6281547, -0.1856032, -2.674804, 1, 1, 1, 1, 1,
-0.6199103, -0.1293357, -1.641657, 1, 1, 1, 1, 1,
-0.6190543, -1.519835, -0.9807621, 1, 1, 1, 1, 1,
-0.613708, -1.226387, -3.375108, 1, 1, 1, 1, 1,
-0.6124107, -0.2303986, -2.510778, 1, 1, 1, 1, 1,
-0.6114774, 0.0635747, -1.620949, 1, 1, 1, 1, 1,
-0.6049632, 0.2533812, 0.2326828, 1, 1, 1, 1, 1,
-0.5988691, -0.2465981, -1.266708, 1, 1, 1, 1, 1,
-0.5936227, 0.6720333, -1.42297, 1, 1, 1, 1, 1,
-0.5905698, 0.7246615, 1.265624, 0, 0, 1, 1, 1,
-0.5884619, -0.09614584, -1.639066, 1, 0, 0, 1, 1,
-0.5832433, 1.047107, -2.054792, 1, 0, 0, 1, 1,
-0.5765019, 0.4399663, -0.9606184, 1, 0, 0, 1, 1,
-0.5748872, 2.028835, -1.525789, 1, 0, 0, 1, 1,
-0.572647, -1.4819, -3.192687, 1, 0, 0, 1, 1,
-0.5695059, -0.4269598, -2.597289, 0, 0, 0, 1, 1,
-0.5642479, 0.8719936, -1.268869, 0, 0, 0, 1, 1,
-0.563656, 1.906612, 0.8716997, 0, 0, 0, 1, 1,
-0.5609884, -0.8174092, -3.375249, 0, 0, 0, 1, 1,
-0.55289, 0.5108374, -1.325998, 0, 0, 0, 1, 1,
-0.5527301, 0.1220428, -0.2677967, 0, 0, 0, 1, 1,
-0.5526372, -2.497804, -3.171059, 0, 0, 0, 1, 1,
-0.5522431, 1.913586, 0.6473979, 1, 1, 1, 1, 1,
-0.5464666, 0.8328612, -1.419354, 1, 1, 1, 1, 1,
-0.5439612, -0.4775538, -2.217201, 1, 1, 1, 1, 1,
-0.5432327, 0.3668261, -1.177036, 1, 1, 1, 1, 1,
-0.542474, 1.290277, 0.3547978, 1, 1, 1, 1, 1,
-0.5417554, -1.260452, -1.828717, 1, 1, 1, 1, 1,
-0.5407961, -0.09911182, -3.194422, 1, 1, 1, 1, 1,
-0.5327702, -1.805012, -3.580487, 1, 1, 1, 1, 1,
-0.5269974, -2.280009, -3.07592, 1, 1, 1, 1, 1,
-0.5220279, 0.8186309, -0.3347594, 1, 1, 1, 1, 1,
-0.5185469, -2.025311, -4.359615, 1, 1, 1, 1, 1,
-0.5087646, 0.8025767, 0.4546762, 1, 1, 1, 1, 1,
-0.5016403, 0.3378973, -3.136153, 1, 1, 1, 1, 1,
-0.5011362, -0.4380231, -1.84138, 1, 1, 1, 1, 1,
-0.5003443, -0.2707914, -2.527529, 1, 1, 1, 1, 1,
-0.4966495, 0.4666159, 1.262478, 0, 0, 1, 1, 1,
-0.4871258, 0.7264189, -0.04260531, 1, 0, 0, 1, 1,
-0.487013, -1.123885, -4.123615, 1, 0, 0, 1, 1,
-0.4839383, -0.1734248, -2.406155, 1, 0, 0, 1, 1,
-0.4798003, 1.065632, 0.3287526, 1, 0, 0, 1, 1,
-0.4763058, 0.3529696, -0.4635102, 1, 0, 0, 1, 1,
-0.475565, -0.4345941, -3.277132, 0, 0, 0, 1, 1,
-0.4737357, 0.6256742, -2.170371, 0, 0, 0, 1, 1,
-0.4594905, -0.114049, -0.8496056, 0, 0, 0, 1, 1,
-0.4453388, 1.269347, -0.4569063, 0, 0, 0, 1, 1,
-0.4448129, -0.1822349, -1.435292, 0, 0, 0, 1, 1,
-0.4441547, -0.08844402, -2.289112, 0, 0, 0, 1, 1,
-0.441386, -0.4836609, -2.035106, 0, 0, 0, 1, 1,
-0.4398722, -0.4110467, -2.369436, 1, 1, 1, 1, 1,
-0.4331886, 0.02002337, 0.0754251, 1, 1, 1, 1, 1,
-0.4311315, 0.3531118, 0.4056333, 1, 1, 1, 1, 1,
-0.4263879, -0.5790947, -1.27419, 1, 1, 1, 1, 1,
-0.4262618, -0.6195241, -2.960233, 1, 1, 1, 1, 1,
-0.4166404, 1.133379, -1.135492, 1, 1, 1, 1, 1,
-0.4149804, 0.6545094, -0.6678874, 1, 1, 1, 1, 1,
-0.4146517, -0.2422941, -1.81151, 1, 1, 1, 1, 1,
-0.4138022, 0.4268915, -0.9857669, 1, 1, 1, 1, 1,
-0.4119482, 0.6221569, -0.8336306, 1, 1, 1, 1, 1,
-0.4081231, -1.198083, -4.244273, 1, 1, 1, 1, 1,
-0.4070746, -0.1641067, -1.412705, 1, 1, 1, 1, 1,
-0.4057735, 2.151493, -0.2237679, 1, 1, 1, 1, 1,
-0.4029087, -0.6951177, -2.393139, 1, 1, 1, 1, 1,
-0.4017505, -0.7532036, -4.325115, 1, 1, 1, 1, 1,
-0.4015736, -1.373279, -2.617625, 0, 0, 1, 1, 1,
-0.3946427, 1.042709, -0.1408952, 1, 0, 0, 1, 1,
-0.3919083, 0.193996, -3.232275, 1, 0, 0, 1, 1,
-0.3902453, 0.3519257, 1.239114, 1, 0, 0, 1, 1,
-0.3899078, 0.6748614, -0.7519435, 1, 0, 0, 1, 1,
-0.3882355, 1.393293, 0.3984449, 1, 0, 0, 1, 1,
-0.3861894, 0.9004102, -0.2963609, 0, 0, 0, 1, 1,
-0.3827561, 1.416429, 1.953438, 0, 0, 0, 1, 1,
-0.3800481, 1.344551, -0.5975437, 0, 0, 0, 1, 1,
-0.3797873, -0.2657617, -4.441818, 0, 0, 0, 1, 1,
-0.3779297, -2.044161, -2.808997, 0, 0, 0, 1, 1,
-0.3778544, 0.6541104, -0.8159754, 0, 0, 0, 1, 1,
-0.3775162, 0.3254946, 0.3545203, 0, 0, 0, 1, 1,
-0.3717169, -0.5459397, -4.113197, 1, 1, 1, 1, 1,
-0.3669146, 0.04215121, -1.131543, 1, 1, 1, 1, 1,
-0.3663862, -0.03586176, -1.276605, 1, 1, 1, 1, 1,
-0.3640099, -0.879512, -3.681445, 1, 1, 1, 1, 1,
-0.3632175, 0.03086578, -1.148223, 1, 1, 1, 1, 1,
-0.3573819, -0.762911, -0.9268328, 1, 1, 1, 1, 1,
-0.3546945, -0.079993, -1.994125, 1, 1, 1, 1, 1,
-0.3522273, -0.8933164, -3.166005, 1, 1, 1, 1, 1,
-0.3512859, 1.971099, -0.2108669, 1, 1, 1, 1, 1,
-0.3461691, 2.22669, -0.3313128, 1, 1, 1, 1, 1,
-0.3453578, 0.07266962, -1.899096, 1, 1, 1, 1, 1,
-0.3434674, 0.7140703, -0.08800452, 1, 1, 1, 1, 1,
-0.3411118, -0.4258293, -2.184554, 1, 1, 1, 1, 1,
-0.3409165, -0.634048, -2.162771, 1, 1, 1, 1, 1,
-0.3402084, 1.081205, -0.6903274, 1, 1, 1, 1, 1,
-0.3352426, 1.660687, -0.9520989, 0, 0, 1, 1, 1,
-0.3333406, -0.222176, -1.193212, 1, 0, 0, 1, 1,
-0.3324936, -0.3357622, -2.177115, 1, 0, 0, 1, 1,
-0.3319307, -1.350739, -3.739184, 1, 0, 0, 1, 1,
-0.3288026, -1.023353, -1.537528, 1, 0, 0, 1, 1,
-0.3283281, 1.42505, 0.3712578, 1, 0, 0, 1, 1,
-0.326627, -1.015705, -1.874761, 0, 0, 0, 1, 1,
-0.3259491, -2.205578, -1.75998, 0, 0, 0, 1, 1,
-0.3190919, 0.2406663, 0.4290361, 0, 0, 0, 1, 1,
-0.3075612, -0.4532149, -3.319341, 0, 0, 0, 1, 1,
-0.3070801, -0.4404336, -2.54192, 0, 0, 0, 1, 1,
-0.3053577, 0.8129426, -1.342147, 0, 0, 0, 1, 1,
-0.3052651, 0.7612956, -0.6689687, 0, 0, 0, 1, 1,
-0.3040007, -0.235088, -2.74466, 1, 1, 1, 1, 1,
-0.3031513, 0.5976938, 0.5655982, 1, 1, 1, 1, 1,
-0.3020141, -0.00306934, -1.06791, 1, 1, 1, 1, 1,
-0.2981585, 0.3251337, 1.061908, 1, 1, 1, 1, 1,
-0.2966395, -0.09658151, -0.1695234, 1, 1, 1, 1, 1,
-0.2956111, 0.8032957, 0.06661371, 1, 1, 1, 1, 1,
-0.2945369, -0.1481496, -1.400757, 1, 1, 1, 1, 1,
-0.2926336, -0.2568916, -1.881536, 1, 1, 1, 1, 1,
-0.2888606, 2.166835, -0.4292668, 1, 1, 1, 1, 1,
-0.2876952, 0.7135393, -2.462759, 1, 1, 1, 1, 1,
-0.2827233, -2.035781, -2.581954, 1, 1, 1, 1, 1,
-0.2818822, -1.464136, -4.410742, 1, 1, 1, 1, 1,
-0.2753222, -0.6208113, -2.894967, 1, 1, 1, 1, 1,
-0.2738352, 1.231836, 2.669924, 1, 1, 1, 1, 1,
-0.2738234, -1.646139, -0.9918, 1, 1, 1, 1, 1,
-0.272465, -0.8123968, -2.735358, 0, 0, 1, 1, 1,
-0.2637211, 1.530493, 2.287544, 1, 0, 0, 1, 1,
-0.2591557, 0.4810549, -1.984776, 1, 0, 0, 1, 1,
-0.2582623, -0.06377971, -0.6889871, 1, 0, 0, 1, 1,
-0.2527385, -0.8485491, -4.357787, 1, 0, 0, 1, 1,
-0.2516775, -1.459553, -1.922701, 1, 0, 0, 1, 1,
-0.2467112, -0.9412543, -2.609849, 0, 0, 0, 1, 1,
-0.2461943, -0.5066607, -1.617839, 0, 0, 0, 1, 1,
-0.2441623, -1.742046, -3.144325, 0, 0, 0, 1, 1,
-0.2420134, 0.7867046, -1.274356, 0, 0, 0, 1, 1,
-0.2376789, -0.9545643, -1.983646, 0, 0, 0, 1, 1,
-0.235254, -0.945165, -3.417049, 0, 0, 0, 1, 1,
-0.2302268, 0.7217214, -1.086847, 0, 0, 0, 1, 1,
-0.2297841, -0.7231728, -2.708264, 1, 1, 1, 1, 1,
-0.2278194, 0.06999164, -2.946244, 1, 1, 1, 1, 1,
-0.2272284, -0.2474941, -0.8153154, 1, 1, 1, 1, 1,
-0.2272063, 0.5382696, 0.3183298, 1, 1, 1, 1, 1,
-0.2185542, 1.674998, -1.153324, 1, 1, 1, 1, 1,
-0.2179569, 0.799696, -1.043037, 1, 1, 1, 1, 1,
-0.1993375, -1.205914, -2.327898, 1, 1, 1, 1, 1,
-0.1985637, 0.6450543, -1.196614, 1, 1, 1, 1, 1,
-0.196697, -1.314924, -2.892104, 1, 1, 1, 1, 1,
-0.1952057, -0.1450707, -4.178414, 1, 1, 1, 1, 1,
-0.1913894, 0.03366134, -1.243008, 1, 1, 1, 1, 1,
-0.1903534, 0.436213, -1.659913, 1, 1, 1, 1, 1,
-0.1900394, 1.24896, 0.01442793, 1, 1, 1, 1, 1,
-0.1892844, -1.168962, -2.921093, 1, 1, 1, 1, 1,
-0.1879768, -0.3650754, -1.034231, 1, 1, 1, 1, 1,
-0.1866001, -0.889806, -3.426265, 0, 0, 1, 1, 1,
-0.1844801, -2.041718, -1.61275, 1, 0, 0, 1, 1,
-0.1796717, -0.08457025, -3.144752, 1, 0, 0, 1, 1,
-0.1758175, 0.08825994, 0.3735297, 1, 0, 0, 1, 1,
-0.1740943, -0.2156065, -2.816223, 1, 0, 0, 1, 1,
-0.1695711, 0.7372378, 0.2072961, 1, 0, 0, 1, 1,
-0.168862, 0.6058713, 1.190832, 0, 0, 0, 1, 1,
-0.1644696, 1.143808, 0.8120024, 0, 0, 0, 1, 1,
-0.162246, -0.329803, -2.752962, 0, 0, 0, 1, 1,
-0.1584488, 1.692345, 0.2930891, 0, 0, 0, 1, 1,
-0.1584217, -1.137441, -3.552191, 0, 0, 0, 1, 1,
-0.149768, -0.4518196, -4.552931, 0, 0, 0, 1, 1,
-0.1461786, 1.220466, -0.3473086, 0, 0, 0, 1, 1,
-0.1457991, 0.521394, 0.4307473, 1, 1, 1, 1, 1,
-0.1456912, 0.8012054, 0.7073211, 1, 1, 1, 1, 1,
-0.1425033, 0.3674064, 0.591752, 1, 1, 1, 1, 1,
-0.1349043, 0.9581902, -1.053859, 1, 1, 1, 1, 1,
-0.1342777, 1.679297, 0.3965016, 1, 1, 1, 1, 1,
-0.1304161, -0.3969461, -0.7809505, 1, 1, 1, 1, 1,
-0.1224516, -0.7134485, -2.33337, 1, 1, 1, 1, 1,
-0.1204915, -1.516121, -1.904, 1, 1, 1, 1, 1,
-0.1204777, 0.1882807, -0.3046952, 1, 1, 1, 1, 1,
-0.1169388, 0.9341924, -1.89773, 1, 1, 1, 1, 1,
-0.116193, 0.3280511, 0.02083047, 1, 1, 1, 1, 1,
-0.1139085, -2.788627, -3.110018, 1, 1, 1, 1, 1,
-0.1078086, 1.049624, -0.05696969, 1, 1, 1, 1, 1,
-0.1042854, 1.497422, -0.2914348, 1, 1, 1, 1, 1,
-0.100402, -0.8371078, -0.4580858, 1, 1, 1, 1, 1,
-0.09838711, 0.3221626, -0.4911954, 0, 0, 1, 1, 1,
-0.09696262, -0.8134958, -3.389699, 1, 0, 0, 1, 1,
-0.09493778, 0.721027, -0.02858912, 1, 0, 0, 1, 1,
-0.09300521, 0.6865852, 0.7583187, 1, 0, 0, 1, 1,
-0.09273499, -0.07555127, -1.093613, 1, 0, 0, 1, 1,
-0.09213725, 0.705612, -1.151818, 1, 0, 0, 1, 1,
-0.08951015, -0.04948574, -0.4408005, 0, 0, 0, 1, 1,
-0.08744103, -1.166583, -2.467386, 0, 0, 0, 1, 1,
-0.08706795, -0.4796147, -1.490754, 0, 0, 0, 1, 1,
-0.08563328, -0.3522436, -2.467858, 0, 0, 0, 1, 1,
-0.08513374, -0.6092202, -2.725956, 0, 0, 0, 1, 1,
-0.08409336, -0.8733492, -2.968472, 0, 0, 0, 1, 1,
-0.07979039, 1.138327, -1.434191, 0, 0, 0, 1, 1,
-0.07534914, -1.232825, -2.451705, 1, 1, 1, 1, 1,
-0.07189324, -0.8988441, -3.021642, 1, 1, 1, 1, 1,
-0.07068726, 0.6520613, 0.8684707, 1, 1, 1, 1, 1,
-0.06706899, -1.622669, -2.817017, 1, 1, 1, 1, 1,
-0.06694936, -0.674656, -2.227657, 1, 1, 1, 1, 1,
-0.0656589, 0.8584241, -1.108601, 1, 1, 1, 1, 1,
-0.06298976, -0.2664422, -3.98193, 1, 1, 1, 1, 1,
-0.06209655, 1.02927, 1.12048, 1, 1, 1, 1, 1,
-0.06129193, 0.02743565, -0.2918462, 1, 1, 1, 1, 1,
-0.05490732, -1.082752, -3.207053, 1, 1, 1, 1, 1,
-0.0541415, 1.117544, -0.4148564, 1, 1, 1, 1, 1,
-0.05283844, 0.8808671, 1.75537, 1, 1, 1, 1, 1,
-0.04730412, -0.4893164, -3.131564, 1, 1, 1, 1, 1,
-0.044797, -2.434507, -4.638576, 1, 1, 1, 1, 1,
-0.04246585, 0.514001, 0.1763225, 1, 1, 1, 1, 1,
-0.0368563, -2.027416, -3.584804, 0, 0, 1, 1, 1,
-0.03455213, -0.5089986, -0.8426098, 1, 0, 0, 1, 1,
-0.03018742, -0.1341833, -2.014132, 1, 0, 0, 1, 1,
-0.02565138, -0.2087745, -4.266496, 1, 0, 0, 1, 1,
-0.02345592, 0.5269089, -0.5810242, 1, 0, 0, 1, 1,
-0.02258863, -1.27207, -4.159296, 1, 0, 0, 1, 1,
-0.021902, -0.8323139, -2.999512, 0, 0, 0, 1, 1,
-0.01868135, 0.777294, 0.1282652, 0, 0, 0, 1, 1,
-0.01421674, 2.297366, -1.48532, 0, 0, 0, 1, 1,
-0.01337682, 1.49315, -0.1461829, 0, 0, 0, 1, 1,
-0.01095316, 1.216671, -0.408807, 0, 0, 0, 1, 1,
-0.01032573, -1.325328, -3.321019, 0, 0, 0, 1, 1,
-0.009909045, 0.07175311, -0.721745, 0, 0, 0, 1, 1,
-0.007158077, 1.780373, -0.7899171, 1, 1, 1, 1, 1,
-0.006927028, -0.3150792, -4.021604, 1, 1, 1, 1, 1,
-0.006071462, -0.7414544, -4.41562, 1, 1, 1, 1, 1,
0.00278894, -1.350841, 2.663032, 1, 1, 1, 1, 1,
0.008771064, -0.7686795, 2.007401, 1, 1, 1, 1, 1,
0.01081209, -0.6797189, 2.069955, 1, 1, 1, 1, 1,
0.01142104, 1.499732, 0.5085143, 1, 1, 1, 1, 1,
0.01284861, 0.7713459, 1.410982, 1, 1, 1, 1, 1,
0.0139342, 1.144453, 1.051326, 1, 1, 1, 1, 1,
0.01754209, 1.809348, -0.6107213, 1, 1, 1, 1, 1,
0.01836732, 0.02082948, -0.4987229, 1, 1, 1, 1, 1,
0.01839874, 1.894027, 0.3730615, 1, 1, 1, 1, 1,
0.0260037, 0.07515845, 0.8775471, 1, 1, 1, 1, 1,
0.02606452, 0.08294658, 0.8357252, 1, 1, 1, 1, 1,
0.02666084, -1.264784, 3.275182, 1, 1, 1, 1, 1,
0.02772477, 0.3089805, -0.02897624, 0, 0, 1, 1, 1,
0.03483133, -0.223152, 3.669928, 1, 0, 0, 1, 1,
0.03590022, 1.143888, 1.70684, 1, 0, 0, 1, 1,
0.03648405, 1.115639, -0.7916682, 1, 0, 0, 1, 1,
0.03738818, 0.3261872, 0.06562895, 1, 0, 0, 1, 1,
0.03749965, -0.08995903, 3.606703, 1, 0, 0, 1, 1,
0.03864391, -1.378338, 2.296907, 0, 0, 0, 1, 1,
0.04325848, 1.279785, 1.154775, 0, 0, 0, 1, 1,
0.04490292, 0.3951126, 0.7546313, 0, 0, 0, 1, 1,
0.04749662, -0.2313882, 3.990988, 0, 0, 0, 1, 1,
0.05236069, 0.3546296, 1.711984, 0, 0, 0, 1, 1,
0.06732728, -2.143198, 3.321086, 0, 0, 0, 1, 1,
0.06939902, 0.7747604, 0.8892945, 0, 0, 0, 1, 1,
0.07058761, 2.306442, -0.01502635, 1, 1, 1, 1, 1,
0.07392535, 0.7249478, -1.534415, 1, 1, 1, 1, 1,
0.07428747, 0.1909059, 0.2717165, 1, 1, 1, 1, 1,
0.07820431, 0.8433526, -1.102426, 1, 1, 1, 1, 1,
0.07950351, -0.9448532, 5.328168, 1, 1, 1, 1, 1,
0.08923508, 0.6896888, -0.4174413, 1, 1, 1, 1, 1,
0.08992419, 0.6669553, 0.2004909, 1, 1, 1, 1, 1,
0.09186839, 0.2123882, -0.7640203, 1, 1, 1, 1, 1,
0.09566777, 1.736035, 0.2369655, 1, 1, 1, 1, 1,
0.09756219, -0.8384333, 3.26999, 1, 1, 1, 1, 1,
0.1031353, -0.1748745, 3.892505, 1, 1, 1, 1, 1,
0.1067669, -0.2605318, 2.436395, 1, 1, 1, 1, 1,
0.1071302, 0.3743915, 1.247945, 1, 1, 1, 1, 1,
0.1081729, -0.06882812, 3.001819, 1, 1, 1, 1, 1,
0.1130781, -0.116206, 3.379058, 1, 1, 1, 1, 1,
0.1136788, 0.2998267, -0.04537536, 0, 0, 1, 1, 1,
0.117218, -0.1281049, 2.008401, 1, 0, 0, 1, 1,
0.1191705, 1.620234, 0.4152808, 1, 0, 0, 1, 1,
0.1191888, -0.313525, 3.21749, 1, 0, 0, 1, 1,
0.1197538, 2.338641, 0.2719574, 1, 0, 0, 1, 1,
0.1197706, 0.9490678, 0.9780754, 1, 0, 0, 1, 1,
0.1210349, -0.04889487, 2.5631, 0, 0, 0, 1, 1,
0.1229149, 0.4054316, -1.318731, 0, 0, 0, 1, 1,
0.1264713, 0.6770114, -0.6072471, 0, 0, 0, 1, 1,
0.1266896, 0.5721095, -0.4574342, 0, 0, 0, 1, 1,
0.1316379, 1.100204, -1.613107, 0, 0, 0, 1, 1,
0.1339805, 0.08674273, -0.4840779, 0, 0, 0, 1, 1,
0.1348996, -0.9205529, 2.85156, 0, 0, 0, 1, 1,
0.1363176, -1.722167, 2.601175, 1, 1, 1, 1, 1,
0.1380267, 0.2292115, -0.03516868, 1, 1, 1, 1, 1,
0.1393667, -0.0239899, 4.245805, 1, 1, 1, 1, 1,
0.1402947, 1.376144, 0.04497297, 1, 1, 1, 1, 1,
0.1420404, 0.6272665, 1.378295, 1, 1, 1, 1, 1,
0.1443981, 0.8882792, 0.02614217, 1, 1, 1, 1, 1,
0.1574016, 0.5552239, 1.116422, 1, 1, 1, 1, 1,
0.1582867, -0.7130132, 2.70319, 1, 1, 1, 1, 1,
0.1592819, 0.02621925, 1.991839, 1, 1, 1, 1, 1,
0.1596809, -0.4933569, 1.224223, 1, 1, 1, 1, 1,
0.1598311, 1.064544, -1.506398, 1, 1, 1, 1, 1,
0.160793, 0.3180861, 0.9586876, 1, 1, 1, 1, 1,
0.1613766, -0.8372397, 2.085122, 1, 1, 1, 1, 1,
0.1622986, -0.01364786, 1.548174, 1, 1, 1, 1, 1,
0.1640595, 1.83688, -1.00319, 1, 1, 1, 1, 1,
0.1641246, 0.6998011, -1.209369, 0, 0, 1, 1, 1,
0.1673292, -0.3167199, 3.319172, 1, 0, 0, 1, 1,
0.1706323, 0.212941, 1.674837, 1, 0, 0, 1, 1,
0.1710154, -0.2063801, 0.4300274, 1, 0, 0, 1, 1,
0.1732335, 0.07935163, -0.65684, 1, 0, 0, 1, 1,
0.1746833, -0.9659491, 2.323634, 1, 0, 0, 1, 1,
0.1763398, -0.9272326, 4.293037, 0, 0, 0, 1, 1,
0.177768, 0.3709221, 0.7738787, 0, 0, 0, 1, 1,
0.1799079, -0.295677, 3.445984, 0, 0, 0, 1, 1,
0.1804637, 0.2839039, 1.053856, 0, 0, 0, 1, 1,
0.1851441, 2.512142, 0.2102854, 0, 0, 0, 1, 1,
0.1870835, -0.7272775, 2.37632, 0, 0, 0, 1, 1,
0.1894642, -0.9861805, 1.624526, 0, 0, 0, 1, 1,
0.1930842, -0.8261757, 2.272719, 1, 1, 1, 1, 1,
0.1951633, 0.643448, -0.1894922, 1, 1, 1, 1, 1,
0.1977051, 0.6736487, 0.1674355, 1, 1, 1, 1, 1,
0.2050372, -0.784322, 4.17747, 1, 1, 1, 1, 1,
0.2098839, 1.068079, 0.3209483, 1, 1, 1, 1, 1,
0.2121677, 1.593681, 0.880047, 1, 1, 1, 1, 1,
0.2184246, 0.8581219, 0.3755564, 1, 1, 1, 1, 1,
0.2187583, 1.886319, 0.5120201, 1, 1, 1, 1, 1,
0.2237994, 1.148726, -0.942895, 1, 1, 1, 1, 1,
0.2254429, -0.6363133, 2.11079, 1, 1, 1, 1, 1,
0.2263627, 0.4437551, 1.751233, 1, 1, 1, 1, 1,
0.2270093, -1.853866, 3.727355, 1, 1, 1, 1, 1,
0.2304983, -0.1094179, 0.4418623, 1, 1, 1, 1, 1,
0.2319644, 0.3362344, 1.252853, 1, 1, 1, 1, 1,
0.23241, 0.645108, 2.147141, 1, 1, 1, 1, 1,
0.2363454, -1.19694, 1.963101, 0, 0, 1, 1, 1,
0.2377985, 0.8054597, 0.5063483, 1, 0, 0, 1, 1,
0.2387906, -0.4668022, 3.348645, 1, 0, 0, 1, 1,
0.2424514, 0.8099027, 0.04161008, 1, 0, 0, 1, 1,
0.2425051, 0.6716381, 1.126014, 1, 0, 0, 1, 1,
0.2462475, -0.03042299, -0.5444286, 1, 0, 0, 1, 1,
0.247341, 0.7150822, -0.573695, 0, 0, 0, 1, 1,
0.2479093, -1.632316, 1.947385, 0, 0, 0, 1, 1,
0.248522, -0.06823358, -0.2331118, 0, 0, 0, 1, 1,
0.2539681, 0.1812011, 1.966066, 0, 0, 0, 1, 1,
0.2548865, 0.1668462, 0.6437866, 0, 0, 0, 1, 1,
0.2558776, 0.9452648, -1.186877, 0, 0, 0, 1, 1,
0.2572402, 0.6209841, -0.1958723, 0, 0, 0, 1, 1,
0.2613923, -0.248568, 2.088552, 1, 1, 1, 1, 1,
0.2678191, -0.3495704, 1.726374, 1, 1, 1, 1, 1,
0.2681853, -0.5169668, 2.279665, 1, 1, 1, 1, 1,
0.2705706, -0.7404184, 2.441382, 1, 1, 1, 1, 1,
0.2765374, 0.9495084, 0.8314931, 1, 1, 1, 1, 1,
0.2776213, 0.6870201, 1.506775, 1, 1, 1, 1, 1,
0.2842035, -0.07730968, 1.557615, 1, 1, 1, 1, 1,
0.2884765, -0.966477, 3.26219, 1, 1, 1, 1, 1,
0.291416, 0.9856277, 0.5171755, 1, 1, 1, 1, 1,
0.2950855, -0.3758928, 3.142171, 1, 1, 1, 1, 1,
0.2975669, -0.2577797, 1.31282, 1, 1, 1, 1, 1,
0.2982153, -0.456672, 2.620372, 1, 1, 1, 1, 1,
0.2995818, 2.063832, 1.182561, 1, 1, 1, 1, 1,
0.3010274, 0.690845, 1.272354, 1, 1, 1, 1, 1,
0.3015842, 1.993094, -0.8468886, 1, 1, 1, 1, 1,
0.3030574, 1.632562, -0.07897697, 0, 0, 1, 1, 1,
0.3051235, -1.368275, 4.434319, 1, 0, 0, 1, 1,
0.3060499, -0.7463309, 1.398063, 1, 0, 0, 1, 1,
0.3096426, 1.492163, 2.327311, 1, 0, 0, 1, 1,
0.310387, 1.257421, 0.6214072, 1, 0, 0, 1, 1,
0.3111425, 0.02204719, 0.6836255, 1, 0, 0, 1, 1,
0.3124021, 0.6220496, 0.2610864, 0, 0, 0, 1, 1,
0.3143479, -0.8169773, 2.57954, 0, 0, 0, 1, 1,
0.3148631, 0.06933215, 0.6629563, 0, 0, 0, 1, 1,
0.317505, 0.2255826, 0.6630149, 0, 0, 0, 1, 1,
0.3216897, 1.083888, -0.9925675, 0, 0, 0, 1, 1,
0.3220586, 1.380298, 1.4115, 0, 0, 0, 1, 1,
0.3233932, 0.3303838, 0.6839391, 0, 0, 0, 1, 1,
0.3236913, -1.08466, 1.772041, 1, 1, 1, 1, 1,
0.324194, -0.6561727, 2.076733, 1, 1, 1, 1, 1,
0.3255271, -0.001812093, 0.8411849, 1, 1, 1, 1, 1,
0.3257874, 0.6162217, -0.7584192, 1, 1, 1, 1, 1,
0.3282113, 0.7259181, 1.1586, 1, 1, 1, 1, 1,
0.3284699, -0.3082559, 1.506851, 1, 1, 1, 1, 1,
0.3296729, -0.03857758, 3.065185, 1, 1, 1, 1, 1,
0.3307541, 1.226875, 2.578716, 1, 1, 1, 1, 1,
0.3398715, -0.1708671, 3.407737, 1, 1, 1, 1, 1,
0.3433241, -0.6960752, 3.964543, 1, 1, 1, 1, 1,
0.3438247, 0.2467482, -0.1277654, 1, 1, 1, 1, 1,
0.3446679, -1.514929, 2.64778, 1, 1, 1, 1, 1,
0.3476099, 0.3730733, -0.9339646, 1, 1, 1, 1, 1,
0.3484261, -0.6046752, 3.645803, 1, 1, 1, 1, 1,
0.3511395, 1.050468, 0.3119771, 1, 1, 1, 1, 1,
0.3514793, -1.662819, 1.487869, 0, 0, 1, 1, 1,
0.3559049, 0.2312782, 0.9975216, 1, 0, 0, 1, 1,
0.3565352, 1.918861, -0.3138045, 1, 0, 0, 1, 1,
0.3583767, -0.7404643, 4.114756, 1, 0, 0, 1, 1,
0.3609023, 1.160917, 1.039742, 1, 0, 0, 1, 1,
0.3631415, -1.468211, 3.180195, 1, 0, 0, 1, 1,
0.363674, -0.3763065, 1.664424, 0, 0, 0, 1, 1,
0.3704369, 0.2920329, 1.140448, 0, 0, 0, 1, 1,
0.3709373, 0.707989, 0.8587234, 0, 0, 0, 1, 1,
0.3713647, 1.691412, -0.4278781, 0, 0, 0, 1, 1,
0.3721328, 0.08788082, 1.639196, 0, 0, 0, 1, 1,
0.3766527, 0.5146154, 1.333211, 0, 0, 0, 1, 1,
0.3767471, 1.801462, 0.6177258, 0, 0, 0, 1, 1,
0.3770029, 1.939733, -0.2481964, 1, 1, 1, 1, 1,
0.3820924, -1.049824, 3.199796, 1, 1, 1, 1, 1,
0.3826658, -0.5312554, 2.91625, 1, 1, 1, 1, 1,
0.3841614, -1.096305, 3.153756, 1, 1, 1, 1, 1,
0.3849784, 1.265455, 1.429606, 1, 1, 1, 1, 1,
0.3909875, 1.147711, 1.181872, 1, 1, 1, 1, 1,
0.3972571, -0.05321419, 1.086148, 1, 1, 1, 1, 1,
0.4016142, 0.2114977, 1.151016, 1, 1, 1, 1, 1,
0.4094738, 0.6907211, -1.156476, 1, 1, 1, 1, 1,
0.4109921, -0.1365374, 1.30113, 1, 1, 1, 1, 1,
0.4123573, 0.06176993, 2.593154, 1, 1, 1, 1, 1,
0.4135999, 1.619874, 0.7284379, 1, 1, 1, 1, 1,
0.4149444, 0.1707498, 0.977201, 1, 1, 1, 1, 1,
0.416811, 0.9716628, -1.341142, 1, 1, 1, 1, 1,
0.4265726, -0.008052168, 2.668113, 1, 1, 1, 1, 1,
0.4272264, -2.236721, 2.500927, 0, 0, 1, 1, 1,
0.4287605, 1.733848, 0.2595628, 1, 0, 0, 1, 1,
0.4312277, -0.1819057, 2.545212, 1, 0, 0, 1, 1,
0.4320019, 0.1013678, 2.368366, 1, 0, 0, 1, 1,
0.4329243, 1.219296, -0.3801684, 1, 0, 0, 1, 1,
0.4367853, -0.4133632, 1.837714, 1, 0, 0, 1, 1,
0.4391557, 0.4410301, 0.2810923, 0, 0, 0, 1, 1,
0.4465524, -1.021161, 3.571693, 0, 0, 0, 1, 1,
0.4507283, 1.212197, -0.3671169, 0, 0, 0, 1, 1,
0.4518335, 0.9581818, 0.07970236, 0, 0, 0, 1, 1,
0.4537153, 0.4507833, 1.096662, 0, 0, 0, 1, 1,
0.4665977, -0.5574232, 1.456078, 0, 0, 0, 1, 1,
0.4737156, 0.177462, 2.032565, 0, 0, 0, 1, 1,
0.4762028, -0.9357615, 1.2731, 1, 1, 1, 1, 1,
0.4786437, -0.6861997, 1.316579, 1, 1, 1, 1, 1,
0.4801916, 0.8231609, 2.416672, 1, 1, 1, 1, 1,
0.4848535, 0.9142642, 0.4652248, 1, 1, 1, 1, 1,
0.4866123, -0.2439561, 2.061955, 1, 1, 1, 1, 1,
0.4873898, -2.022113, 2.992503, 1, 1, 1, 1, 1,
0.495739, 0.2440103, 1.299799, 1, 1, 1, 1, 1,
0.4969422, -1.115161, 2.40466, 1, 1, 1, 1, 1,
0.4978058, -0.5980003, 1.751489, 1, 1, 1, 1, 1,
0.4984312, 0.1171631, 2.080727, 1, 1, 1, 1, 1,
0.4992574, -0.7046108, 3.164734, 1, 1, 1, 1, 1,
0.506747, 1.624539, 0.9016315, 1, 1, 1, 1, 1,
0.5067668, -0.3763983, 3.334233, 1, 1, 1, 1, 1,
0.5089356, 1.564355, 0.1266917, 1, 1, 1, 1, 1,
0.5110031, 2.715783, -0.5583284, 1, 1, 1, 1, 1,
0.5113556, 0.2799929, 0.7545205, 0, 0, 1, 1, 1,
0.5129563, -0.2099719, 1.242849, 1, 0, 0, 1, 1,
0.515914, 0.6942759, 0.6191792, 1, 0, 0, 1, 1,
0.5241211, -0.2971902, 2.188976, 1, 0, 0, 1, 1,
0.5265112, -1.056035, 2.855699, 1, 0, 0, 1, 1,
0.5277932, 1.002663, 1.472163, 1, 0, 0, 1, 1,
0.5333703, 0.8273841, 1.271177, 0, 0, 0, 1, 1,
0.5337478, -0.5644785, 2.5977, 0, 0, 0, 1, 1,
0.5357496, -0.3289427, 0.6473576, 0, 0, 0, 1, 1,
0.5361708, -0.2399563, 1.668109, 0, 0, 0, 1, 1,
0.5443472, 0.692259, -0.233098, 0, 0, 0, 1, 1,
0.5484508, -0.3739883, 1.262138, 0, 0, 0, 1, 1,
0.5495292, -1.162371, 1.390459, 0, 0, 0, 1, 1,
0.5508854, -0.1903703, 0.05570161, 1, 1, 1, 1, 1,
0.5548375, -0.6762451, 2.219952, 1, 1, 1, 1, 1,
0.5550272, 1.105024, -0.6037059, 1, 1, 1, 1, 1,
0.5594631, 0.5828095, 2.191936, 1, 1, 1, 1, 1,
0.5611572, 0.556235, -0.1453847, 1, 1, 1, 1, 1,
0.5635739, -0.9635717, 2.015393, 1, 1, 1, 1, 1,
0.5649195, 1.438857, 0.9153158, 1, 1, 1, 1, 1,
0.5697268, 0.7592048, 0.7154254, 1, 1, 1, 1, 1,
0.5736548, -0.004229604, 0.2174527, 1, 1, 1, 1, 1,
0.5746213, 0.1541912, 0.3583711, 1, 1, 1, 1, 1,
0.5749465, -1.184488, 3.345187, 1, 1, 1, 1, 1,
0.5768017, -1.039472, 3.10212, 1, 1, 1, 1, 1,
0.577991, 0.5327634, -0.570357, 1, 1, 1, 1, 1,
0.5789893, -0.534992, 1.82348, 1, 1, 1, 1, 1,
0.5792246, 0.5871056, 1.422315, 1, 1, 1, 1, 1,
0.5823619, -0.8569686, 2.012854, 0, 0, 1, 1, 1,
0.5879041, -1.889941, 3.102634, 1, 0, 0, 1, 1,
0.5905827, 0.2680167, 0.4730394, 1, 0, 0, 1, 1,
0.5956053, -0.9683385, 3.763899, 1, 0, 0, 1, 1,
0.5984777, -0.5507682, 3.509739, 1, 0, 0, 1, 1,
0.5999678, 0.6173034, 0.902629, 1, 0, 0, 1, 1,
0.6000973, 1.248199, 0.6761551, 0, 0, 0, 1, 1,
0.6055095, -0.6425456, 2.825203, 0, 0, 0, 1, 1,
0.6078808, 1.03824, -0.8039387, 0, 0, 0, 1, 1,
0.6145313, -1.416025, 2.734331, 0, 0, 0, 1, 1,
0.6165823, -0.1209502, 0.3252535, 0, 0, 0, 1, 1,
0.6224771, -0.3960422, 1.116108, 0, 0, 0, 1, 1,
0.6433335, 1.138691, 0.2357736, 0, 0, 0, 1, 1,
0.653939, -0.167015, 2.043535, 1, 1, 1, 1, 1,
0.6540619, 0.277131, 1.461663, 1, 1, 1, 1, 1,
0.655466, 0.4049608, -0.4923514, 1, 1, 1, 1, 1,
0.6573094, -0.1438738, 4.200763, 1, 1, 1, 1, 1,
0.6655409, -1.430717, 3.991845, 1, 1, 1, 1, 1,
0.6666315, -0.703186, 2.849481, 1, 1, 1, 1, 1,
0.6721984, 0.6134217, -0.0351591, 1, 1, 1, 1, 1,
0.6730738, -1.60316, 3.091161, 1, 1, 1, 1, 1,
0.6802106, -1.013018, 1.404224, 1, 1, 1, 1, 1,
0.6838557, 1.187898, 0.4663797, 1, 1, 1, 1, 1,
0.6906626, -0.6317015, 2.118958, 1, 1, 1, 1, 1,
0.6911687, -0.005978468, 0.5168114, 1, 1, 1, 1, 1,
0.6958366, 0.3017586, 0.4830847, 1, 1, 1, 1, 1,
0.7054657, -0.6936592, 1.060063, 1, 1, 1, 1, 1,
0.7065795, -0.35102, 2.774581, 1, 1, 1, 1, 1,
0.7158245, 1.69448, 0.8226358, 0, 0, 1, 1, 1,
0.7170075, -0.3227889, 1.642122, 1, 0, 0, 1, 1,
0.7183165, -0.4050784, 3.301352, 1, 0, 0, 1, 1,
0.7205445, 0.6458824, -1.043227, 1, 0, 0, 1, 1,
0.7215419, -0.5653889, 2.290884, 1, 0, 0, 1, 1,
0.7217849, -0.2345614, 1.128546, 1, 0, 0, 1, 1,
0.724981, 0.5902377, 0.9518293, 0, 0, 0, 1, 1,
0.7258395, 0.3986388, 0.07454792, 0, 0, 0, 1, 1,
0.731961, 0.8886216, 0.3884512, 0, 0, 0, 1, 1,
0.7324875, 0.2298465, 0.6669742, 0, 0, 0, 1, 1,
0.735366, -0.2697698, 3.172787, 0, 0, 0, 1, 1,
0.7391309, -0.9387814, 2.889435, 0, 0, 0, 1, 1,
0.7460861, -0.284842, 2.691439, 0, 0, 0, 1, 1,
0.74617, -0.9570549, 4.739608, 1, 1, 1, 1, 1,
0.7485526, 1.176115, -1.655698, 1, 1, 1, 1, 1,
0.7508459, -1.14567, 1.523559, 1, 1, 1, 1, 1,
0.7516782, 1.765492, -0.4848964, 1, 1, 1, 1, 1,
0.7548519, 0.703238, -0.3466738, 1, 1, 1, 1, 1,
0.7566516, -1.439605, 2.216152, 1, 1, 1, 1, 1,
0.7633635, -1.891036, 5.457729, 1, 1, 1, 1, 1,
0.7695711, 0.384551, 1.752209, 1, 1, 1, 1, 1,
0.7764091, 1.043942, 1.224573, 1, 1, 1, 1, 1,
0.783404, 1.796939, 1.938649, 1, 1, 1, 1, 1,
0.7939691, -0.4940425, 1.923187, 1, 1, 1, 1, 1,
0.7970014, 0.5218813, 1.524471, 1, 1, 1, 1, 1,
0.8006753, -1.142979, 3.170835, 1, 1, 1, 1, 1,
0.8011522, -0.7099728, 3.252409, 1, 1, 1, 1, 1,
0.809333, 0.388881, 2.316441, 1, 1, 1, 1, 1,
0.8102309, -0.1555971, 1.43828, 0, 0, 1, 1, 1,
0.8137893, -0.213752, 1.062008, 1, 0, 0, 1, 1,
0.8216201, 2.246337, 0.5927274, 1, 0, 0, 1, 1,
0.8219934, 0.7791065, 1.077192, 1, 0, 0, 1, 1,
0.8220714, 2.121294, 1.97537, 1, 0, 0, 1, 1,
0.8225068, -2.165192, 2.267807, 1, 0, 0, 1, 1,
0.8282238, -1.664913, 3.140035, 0, 0, 0, 1, 1,
0.8368091, 0.3214892, 2.633738, 0, 0, 0, 1, 1,
0.8374023, 1.910412, -0.08847953, 0, 0, 0, 1, 1,
0.8376446, 0.04551562, 1.163153, 0, 0, 0, 1, 1,
0.8398341, 0.1788195, 1.55296, 0, 0, 0, 1, 1,
0.8420255, 0.2733358, 1.792718, 0, 0, 0, 1, 1,
0.8427146, -0.2107947, 1.307432, 0, 0, 0, 1, 1,
0.8486589, -0.2277547, 2.055129, 1, 1, 1, 1, 1,
0.8496862, -0.5420593, 2.524387, 1, 1, 1, 1, 1,
0.8524129, 0.9240135, 0.1461783, 1, 1, 1, 1, 1,
0.8696142, -0.1973401, 1.367697, 1, 1, 1, 1, 1,
0.8727978, 0.6267272, 2.70666, 1, 1, 1, 1, 1,
0.8737601, 1.123881, 0.8927169, 1, 1, 1, 1, 1,
0.877145, -0.8011234, 0.7476686, 1, 1, 1, 1, 1,
0.8780294, -1.215135, 2.650039, 1, 1, 1, 1, 1,
0.880871, -0.4174148, 0.5670947, 1, 1, 1, 1, 1,
0.8809542, 0.461906, 1.152579, 1, 1, 1, 1, 1,
0.8810886, -0.1298162, -0.3798002, 1, 1, 1, 1, 1,
0.8836557, 0.2518513, -0.8986377, 1, 1, 1, 1, 1,
0.887028, 0.3157737, 0.5380248, 1, 1, 1, 1, 1,
0.8937426, 0.1330671, 1.327087, 1, 1, 1, 1, 1,
0.8970681, -0.2336533, 0.8589926, 1, 1, 1, 1, 1,
0.9026889, -0.1185428, 2.735174, 0, 0, 1, 1, 1,
0.9035434, -2.291499, 2.952852, 1, 0, 0, 1, 1,
0.9050522, -0.4210538, 1.745004, 1, 0, 0, 1, 1,
0.9161521, -1.676433, 4.802265, 1, 0, 0, 1, 1,
0.9168833, -0.3938829, 1.814057, 1, 0, 0, 1, 1,
0.92617, 1.478384, 2.243402, 1, 0, 0, 1, 1,
0.9363043, -0.9691178, 2.206406, 0, 0, 0, 1, 1,
0.9364721, 0.8165514, 2.41555, 0, 0, 0, 1, 1,
0.9382797, 0.318267, 2.288582, 0, 0, 0, 1, 1,
0.9422218, -0.2686282, 1.592456, 0, 0, 0, 1, 1,
0.9427091, -1.665119, 2.135327, 0, 0, 0, 1, 1,
0.9495361, -0.3015127, 2.420531, 0, 0, 0, 1, 1,
0.9506407, 0.2039824, 2.975098, 0, 0, 0, 1, 1,
0.953801, -0.7470183, 1.592258, 1, 1, 1, 1, 1,
0.9548475, 0.2313144, 2.856785, 1, 1, 1, 1, 1,
0.9576821, -1.624927, 2.727713, 1, 1, 1, 1, 1,
0.9588897, -0.5512611, 2.086931, 1, 1, 1, 1, 1,
0.9644135, -0.9339724, 0.5300028, 1, 1, 1, 1, 1,
0.9677688, 1.486658, 1.614538, 1, 1, 1, 1, 1,
0.9684677, 0.04438703, 3.112964, 1, 1, 1, 1, 1,
0.9718442, -1.204456, 2.952293, 1, 1, 1, 1, 1,
0.9759883, -1.524577, 3.138834, 1, 1, 1, 1, 1,
0.9763662, 1.186576, 1.529344, 1, 1, 1, 1, 1,
0.9812617, -1.450318, 2.680428, 1, 1, 1, 1, 1,
0.9816468, -0.5631781, 2.225394, 1, 1, 1, 1, 1,
0.9833029, -0.1580111, 0.9544832, 1, 1, 1, 1, 1,
0.9848328, 0.6319466, -0.8631819, 1, 1, 1, 1, 1,
0.9871432, -0.5023584, 3.002132, 1, 1, 1, 1, 1,
0.9882236, -0.4533598, 0.1746303, 0, 0, 1, 1, 1,
0.9928234, 0.2038423, 2.175314, 1, 0, 0, 1, 1,
1.010172, -0.1786695, 2.804456, 1, 0, 0, 1, 1,
1.010339, 0.5104446, 0.9694577, 1, 0, 0, 1, 1,
1.011259, 1.209708, 1.875084, 1, 0, 0, 1, 1,
1.011643, 0.05727825, 2.636777, 1, 0, 0, 1, 1,
1.012423, 0.5092008, 2.509457, 0, 0, 0, 1, 1,
1.014919, -1.796195, 3.736124, 0, 0, 0, 1, 1,
1.016122, -0.8278319, 1.338825, 0, 0, 0, 1, 1,
1.01799, -0.9253714, 1.036139, 0, 0, 0, 1, 1,
1.023124, -1.089501, 1.33843, 0, 0, 0, 1, 1,
1.028049, -0.6962458, 2.346432, 0, 0, 0, 1, 1,
1.030277, -0.3863768, 0.6410241, 0, 0, 0, 1, 1,
1.03115, -0.7916659, 2.445168, 1, 1, 1, 1, 1,
1.036328, -0.3957282, 2.025702, 1, 1, 1, 1, 1,
1.038063, -0.7876146, 2.104414, 1, 1, 1, 1, 1,
1.043538, 1.890966, -0.3091466, 1, 1, 1, 1, 1,
1.043817, -1.208685, 1.491592, 1, 1, 1, 1, 1,
1.046316, 0.02647865, 1.358795, 1, 1, 1, 1, 1,
1.048477, -0.5821058, 1.735785, 1, 1, 1, 1, 1,
1.051044, -0.5286866, 1.806394, 1, 1, 1, 1, 1,
1.053139, 0.9964079, 0.6556803, 1, 1, 1, 1, 1,
1.053207, -1.47228, 2.808594, 1, 1, 1, 1, 1,
1.053295, -0.7639258, 2.579028, 1, 1, 1, 1, 1,
1.062109, -0.5364894, 2.064926, 1, 1, 1, 1, 1,
1.065957, -0.8512248, 2.448845, 1, 1, 1, 1, 1,
1.065964, 1.485365, 0.1635929, 1, 1, 1, 1, 1,
1.069237, -1.971703, 2.71576, 1, 1, 1, 1, 1,
1.07359, 1.276325, 1.038728, 0, 0, 1, 1, 1,
1.076042, -0.09767266, 1.675829, 1, 0, 0, 1, 1,
1.085539, -1.161918, 1.923406, 1, 0, 0, 1, 1,
1.089464, -0.9664212, 1.371548, 1, 0, 0, 1, 1,
1.094407, 0.6998145, 2.657108, 1, 0, 0, 1, 1,
1.095443, 1.553523, 1.133838, 1, 0, 0, 1, 1,
1.097729, -0.3996033, 3.57841, 0, 0, 0, 1, 1,
1.106876, -1.138707, 2.266795, 0, 0, 0, 1, 1,
1.107152, 0.4526608, 0.9307905, 0, 0, 0, 1, 1,
1.11597, -2.513453, 1.127229, 0, 0, 0, 1, 1,
1.132161, 0.09193233, 0.6760875, 0, 0, 0, 1, 1,
1.144935, -2.982937, 2.044915, 0, 0, 0, 1, 1,
1.149463, 0.628507, 1.433962, 0, 0, 0, 1, 1,
1.151889, -2.74136, 4.77781, 1, 1, 1, 1, 1,
1.153781, -0.3186372, 1.281092, 1, 1, 1, 1, 1,
1.171802, -0.0497563, 1.585616, 1, 1, 1, 1, 1,
1.174955, 0.4291124, 1.549002, 1, 1, 1, 1, 1,
1.17638, -0.4345312, 2.45502, 1, 1, 1, 1, 1,
1.176991, 0.7144901, 0.7184464, 1, 1, 1, 1, 1,
1.179612, -1.218232, 4.153604, 1, 1, 1, 1, 1,
1.183917, 0.9070077, 2.250896, 1, 1, 1, 1, 1,
1.195457, -1.492602, 3.433958, 1, 1, 1, 1, 1,
1.196956, -0.6487967, 4.570866, 1, 1, 1, 1, 1,
1.198381, 1.120082, 0.6924468, 1, 1, 1, 1, 1,
1.200721, -1.070905, 2.128105, 1, 1, 1, 1, 1,
1.203356, -1.023428, 2.131235, 1, 1, 1, 1, 1,
1.206687, -0.03534734, 3.172462, 1, 1, 1, 1, 1,
1.208452, -0.8136289, 1.985162, 1, 1, 1, 1, 1,
1.215395, 0.438381, 0.5220796, 0, 0, 1, 1, 1,
1.2244, -0.5457004, 2.088466, 1, 0, 0, 1, 1,
1.235027, -0.7554868, 2.497857, 1, 0, 0, 1, 1,
1.235231, -0.1895391, 1.395234, 1, 0, 0, 1, 1,
1.236867, -0.5279967, 1.256367, 1, 0, 0, 1, 1,
1.244512, 0.6315431, 1.12468, 1, 0, 0, 1, 1,
1.246809, 0.02185229, 0.6204041, 0, 0, 0, 1, 1,
1.253792, -1.035428, 2.219628, 0, 0, 0, 1, 1,
1.258264, -0.4891905, 0.1922109, 0, 0, 0, 1, 1,
1.262974, -0.129898, 2.736162, 0, 0, 0, 1, 1,
1.267505, -1.233322, 2.85575, 0, 0, 0, 1, 1,
1.272157, 1.685865, 1.352476, 0, 0, 0, 1, 1,
1.274249, 1.796448, 1.326665, 0, 0, 0, 1, 1,
1.277237, 0.7527133, 1.788542, 1, 1, 1, 1, 1,
1.290297, 0.8751725, 2.070048, 1, 1, 1, 1, 1,
1.293708, 0.9372219, 1.221492, 1, 1, 1, 1, 1,
1.295126, -0.3011072, -1.218656, 1, 1, 1, 1, 1,
1.298311, -0.9745551, 3.128933, 1, 1, 1, 1, 1,
1.304448, -0.5734673, 0.8345332, 1, 1, 1, 1, 1,
1.306273, -0.3833278, 0.6627684, 1, 1, 1, 1, 1,
1.320554, -1.532383, 1.100122, 1, 1, 1, 1, 1,
1.321545, 0.4514345, 0.1102534, 1, 1, 1, 1, 1,
1.327557, 0.2578274, 2.612492, 1, 1, 1, 1, 1,
1.333937, 0.4066625, 0.1221169, 1, 1, 1, 1, 1,
1.340284, 0.2329866, 1.193094, 1, 1, 1, 1, 1,
1.34382, -0.7923034, 3.127297, 1, 1, 1, 1, 1,
1.360858, 0.08339851, -0.03168694, 1, 1, 1, 1, 1,
1.36542, 0.05551625, 2.026849, 1, 1, 1, 1, 1,
1.381829, -0.0186963, 0.2621169, 0, 0, 1, 1, 1,
1.382686, -1.20753, 2.760252, 1, 0, 0, 1, 1,
1.390623, -0.08101863, 2.85632, 1, 0, 0, 1, 1,
1.400036, 1.00274, 0.8052489, 1, 0, 0, 1, 1,
1.404891, 0.9997166, 2.337594, 1, 0, 0, 1, 1,
1.40521, 0.6598881, 1.469506, 1, 0, 0, 1, 1,
1.406603, -0.4746029, 2.076787, 0, 0, 0, 1, 1,
1.409092, 0.3776573, 0.1343698, 0, 0, 0, 1, 1,
1.410547, 0.2023696, 1.870496, 0, 0, 0, 1, 1,
1.43056, -0.6470021, 4.419537, 0, 0, 0, 1, 1,
1.438717, -0.3201969, 1.529134, 0, 0, 0, 1, 1,
1.443169, -2.565154, 2.224155, 0, 0, 0, 1, 1,
1.443905, 0.3511305, -1.082636, 0, 0, 0, 1, 1,
1.447114, -1.362791, 1.840763, 1, 1, 1, 1, 1,
1.460608, -1.128215, 2.547958, 1, 1, 1, 1, 1,
1.477213, -0.6689652, 2.802063, 1, 1, 1, 1, 1,
1.491372, -0.395838, 1.630462, 1, 1, 1, 1, 1,
1.492696, 0.08378447, 1.70818, 1, 1, 1, 1, 1,
1.50442, 0.3644592, 1.116277, 1, 1, 1, 1, 1,
1.520887, -1.497859, 1.877036, 1, 1, 1, 1, 1,
1.535158, 0.3581365, 1.820252, 1, 1, 1, 1, 1,
1.542187, 0.6445253, 1.346449, 1, 1, 1, 1, 1,
1.543412, -0.7586757, 0.4158705, 1, 1, 1, 1, 1,
1.545989, 1.277656, 2.475591, 1, 1, 1, 1, 1,
1.547224, -1.805462, 2.875705, 1, 1, 1, 1, 1,
1.550224, 1.42149, 1.962475, 1, 1, 1, 1, 1,
1.555035, 0.2090777, -1.056515, 1, 1, 1, 1, 1,
1.581088, 1.192359, 0.4869998, 1, 1, 1, 1, 1,
1.593987, -1.739421, 1.572175, 0, 0, 1, 1, 1,
1.60369, -0.595324, 1.160338, 1, 0, 0, 1, 1,
1.61282, -1.166577, 2.030428, 1, 0, 0, 1, 1,
1.621117, -0.368036, 1.744628, 1, 0, 0, 1, 1,
1.629777, 0.7868301, 1.612589, 1, 0, 0, 1, 1,
1.660283, -1.33212, 0.761808, 1, 0, 0, 1, 1,
1.682014, -0.2599846, 2.161405, 0, 0, 0, 1, 1,
1.683962, 2.138347, -1.878278, 0, 0, 0, 1, 1,
1.691095, -0.6433121, 1.332728, 0, 0, 0, 1, 1,
1.692805, -0.3507697, 3.747038, 0, 0, 0, 1, 1,
1.697085, -0.0743003, 0.3530625, 0, 0, 0, 1, 1,
1.698919, -1.614748, 2.856076, 0, 0, 0, 1, 1,
1.705642, -0.2800707, 2.567481, 0, 0, 0, 1, 1,
1.708198, -1.287268, 2.640506, 1, 1, 1, 1, 1,
1.719972, 0.4548274, 2.397061, 1, 1, 1, 1, 1,
1.745024, -0.05683502, 1.951087, 1, 1, 1, 1, 1,
1.788712, -0.2635194, 0.6742061, 1, 1, 1, 1, 1,
1.793264, -0.1308704, 3.311285, 1, 1, 1, 1, 1,
1.799854, 0.501918, 1.795746, 1, 1, 1, 1, 1,
1.827922, -0.8723043, 1.246349, 1, 1, 1, 1, 1,
1.842922, 1.450879, -1.196493, 1, 1, 1, 1, 1,
1.926197, 0.1764212, 0.3653008, 1, 1, 1, 1, 1,
1.947275, 0.8027958, -1.360937, 1, 1, 1, 1, 1,
1.963555, 0.5870458, 1.76762, 1, 1, 1, 1, 1,
1.964703, 0.7257137, 2.023412, 1, 1, 1, 1, 1,
1.96614, -0.1303779, 1.982975, 1, 1, 1, 1, 1,
1.974147, 0.9424542, -0.2298189, 1, 1, 1, 1, 1,
1.978502, -0.9212115, 2.947498, 1, 1, 1, 1, 1,
2.002199, -0.7035776, 2.699475, 0, 0, 1, 1, 1,
2.013345, 0.8520146, 1.540921, 1, 0, 0, 1, 1,
2.031281, -0.9804124, 3.248114, 1, 0, 0, 1, 1,
2.089349, 1.839809, 0.7159148, 1, 0, 0, 1, 1,
2.13153, 1.000409, 1.367741, 1, 0, 0, 1, 1,
2.154075, 1.082508, 1.064801, 1, 0, 0, 1, 1,
2.185125, -0.3613703, 0.7567139, 0, 0, 0, 1, 1,
2.207541, -1.991319, 3.093495, 0, 0, 0, 1, 1,
2.209038, 0.3803914, 0.8759517, 0, 0, 0, 1, 1,
2.280558, 2.333258, 1.439468, 0, 0, 0, 1, 1,
2.328049, -0.4818368, 1.764357, 0, 0, 0, 1, 1,
2.460078, 0.8490931, -0.4522889, 0, 0, 0, 1, 1,
2.554199, 0.818985, 2.307117, 0, 0, 0, 1, 1,
2.662132, 0.1318352, 2.357195, 1, 1, 1, 1, 1,
2.687408, 0.08883915, 1.841631, 1, 1, 1, 1, 1,
2.724377, -0.9986512, 2.584077, 1, 1, 1, 1, 1,
2.724421, -0.5279899, 0.349787, 1, 1, 1, 1, 1,
2.826486, -0.0947047, 2.089748, 1, 1, 1, 1, 1,
2.838724, -0.5063034, 2.844418, 1, 1, 1, 1, 1,
3.372025, 0.578958, 0.3469596, 1, 1, 1, 1, 1
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
var radius = 9.148117;
var distance = 32.13237;
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
mvMatrix.translate( -0.1570559, 0.1335771, -0.4095764 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.13237);
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