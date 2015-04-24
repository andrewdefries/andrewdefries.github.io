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
-3.692926, 0.3891069, -2.444925, 1, 0, 0, 1,
-3.136712, -1.24079, -1.766239, 1, 0.007843138, 0, 1,
-2.804379, -2.807894, -2.752416, 1, 0.01176471, 0, 1,
-2.797935, -0.02527532, -0.01949313, 1, 0.01960784, 0, 1,
-2.785709, 2.161628, -1.6169, 1, 0.02352941, 0, 1,
-2.780479, 1.036972, -0.8034483, 1, 0.03137255, 0, 1,
-2.759976, 0.4798279, -0.3805742, 1, 0.03529412, 0, 1,
-2.534081, -1.58766, -1.11644, 1, 0.04313726, 0, 1,
-2.528261, -0.2910293, -1.338143, 1, 0.04705882, 0, 1,
-2.522853, -0.4968808, -2.616058, 1, 0.05490196, 0, 1,
-2.493216, 0.3330309, -2.203652, 1, 0.05882353, 0, 1,
-2.481669, -0.2221659, -0.9408429, 1, 0.06666667, 0, 1,
-2.449064, -0.9886644, -5.084925, 1, 0.07058824, 0, 1,
-2.436509, 0.5947105, -1.295188, 1, 0.07843138, 0, 1,
-2.356968, 0.6828052, -1.336128, 1, 0.08235294, 0, 1,
-2.316525, -0.2964132, -1.415016, 1, 0.09019608, 0, 1,
-2.241212, -0.2941084, -1.651093, 1, 0.09411765, 0, 1,
-2.115022, 0.3983583, -2.186754, 1, 0.1019608, 0, 1,
-2.106369, -0.8788126, -1.968282, 1, 0.1098039, 0, 1,
-2.059986, -0.6839893, -1.961009, 1, 0.1137255, 0, 1,
-2.042259, 1.254985, -1.782167, 1, 0.1215686, 0, 1,
-2.004574, -0.2238448, -0.7774706, 1, 0.1254902, 0, 1,
-1.983038, 0.678766, -0.4266769, 1, 0.1333333, 0, 1,
-1.954734, 3.61251, -2.096554, 1, 0.1372549, 0, 1,
-1.947087, 0.7765682, -0.1783701, 1, 0.145098, 0, 1,
-1.929293, 0.2174544, -3.460695, 1, 0.1490196, 0, 1,
-1.913736, 0.2384404, -2.94089, 1, 0.1568628, 0, 1,
-1.908762, 1.173706, -0.691237, 1, 0.1607843, 0, 1,
-1.887402, 0.3631555, -1.402283, 1, 0.1686275, 0, 1,
-1.886637, -1.144785, -0.1424855, 1, 0.172549, 0, 1,
-1.850585, 0.8447674, -1.811477, 1, 0.1803922, 0, 1,
-1.840949, -1.492176, -2.745328, 1, 0.1843137, 0, 1,
-1.836034, 0.1068667, -2.634017, 1, 0.1921569, 0, 1,
-1.833575, -0.6860866, -0.8215551, 1, 0.1960784, 0, 1,
-1.831686, 0.2706216, -1.106647, 1, 0.2039216, 0, 1,
-1.82145, 0.799048, -3.258376, 1, 0.2117647, 0, 1,
-1.818676, -0.7109564, -2.169363, 1, 0.2156863, 0, 1,
-1.802141, 0.9510993, 0.8433241, 1, 0.2235294, 0, 1,
-1.795977, 0.8722292, -1.196902, 1, 0.227451, 0, 1,
-1.791329, -0.7761735, -1.489878, 1, 0.2352941, 0, 1,
-1.790753, 1.329298, -2.210594, 1, 0.2392157, 0, 1,
-1.788734, 1.599708, -1.032168, 1, 0.2470588, 0, 1,
-1.785238, -0.3545327, -2.134494, 1, 0.2509804, 0, 1,
-1.778681, 1.02816, 0.7608312, 1, 0.2588235, 0, 1,
-1.774514, 1.107384, -0.540294, 1, 0.2627451, 0, 1,
-1.772912, 1.576764, 0.8808539, 1, 0.2705882, 0, 1,
-1.753012, -1.577565, -2.857738, 1, 0.2745098, 0, 1,
-1.752305, -0.6599782, -2.37327, 1, 0.282353, 0, 1,
-1.723399, -0.7514932, -1.164882, 1, 0.2862745, 0, 1,
-1.722562, 0.8619108, -3.420897, 1, 0.2941177, 0, 1,
-1.706621, 1.34454, -0.6928777, 1, 0.3019608, 0, 1,
-1.69781, 1.369557, 0.4175459, 1, 0.3058824, 0, 1,
-1.691092, -0.4740056, -1.848453, 1, 0.3137255, 0, 1,
-1.689977, -0.3443736, -4.006914, 1, 0.3176471, 0, 1,
-1.684482, 1.667198, -0.05722735, 1, 0.3254902, 0, 1,
-1.674713, 0.7315725, -1.302842, 1, 0.3294118, 0, 1,
-1.65942, -0.5819898, -2.791984, 1, 0.3372549, 0, 1,
-1.650376, 0.637181, -0.4994581, 1, 0.3411765, 0, 1,
-1.645494, -1.03641, -4.377123, 1, 0.3490196, 0, 1,
-1.644884, 1.427694, -1.81573, 1, 0.3529412, 0, 1,
-1.638832, 1.081769, -0.8172644, 1, 0.3607843, 0, 1,
-1.635219, -0.2771575, -2.673044, 1, 0.3647059, 0, 1,
-1.624711, -0.06556443, -0.2628445, 1, 0.372549, 0, 1,
-1.614153, 0.2092825, -0.6519459, 1, 0.3764706, 0, 1,
-1.610778, 0.4485402, -0.438812, 1, 0.3843137, 0, 1,
-1.588366, -1.489977, -3.724891, 1, 0.3882353, 0, 1,
-1.583117, -1.941099, -2.808377, 1, 0.3960784, 0, 1,
-1.579777, 0.604126, -1.198323, 1, 0.4039216, 0, 1,
-1.567992, 1.134824, -0.8155975, 1, 0.4078431, 0, 1,
-1.545166, 0.3780189, -2.290996, 1, 0.4156863, 0, 1,
-1.532862, 0.7322901, -2.43778, 1, 0.4196078, 0, 1,
-1.515671, -1.068262, -1.273159, 1, 0.427451, 0, 1,
-1.496721, -2.310601, -3.106545, 1, 0.4313726, 0, 1,
-1.477726, -0.6157686, -2.338289, 1, 0.4392157, 0, 1,
-1.475106, 1.23353, 0.5050325, 1, 0.4431373, 0, 1,
-1.471541, 0.4013714, -3.092499, 1, 0.4509804, 0, 1,
-1.428585, -1.824337, -2.236555, 1, 0.454902, 0, 1,
-1.421701, -0.8077053, -0.7783606, 1, 0.4627451, 0, 1,
-1.41943, -0.4530391, -2.863549, 1, 0.4666667, 0, 1,
-1.407068, 0.8706299, -0.9454957, 1, 0.4745098, 0, 1,
-1.396357, -0.1530561, -4.176132, 1, 0.4784314, 0, 1,
-1.391802, 1.342707, 1.469533, 1, 0.4862745, 0, 1,
-1.389422, 1.987887, 0.3633775, 1, 0.4901961, 0, 1,
-1.371751, -0.2241916, -2.552338, 1, 0.4980392, 0, 1,
-1.364485, -0.9176635, -4.110572, 1, 0.5058824, 0, 1,
-1.361496, -0.9246494, -3.409698, 1, 0.509804, 0, 1,
-1.352497, 0.7711957, 0.1263363, 1, 0.5176471, 0, 1,
-1.347566, 1.310665, -0.6256806, 1, 0.5215687, 0, 1,
-1.338591, 0.009494996, -3.096818, 1, 0.5294118, 0, 1,
-1.330413, -0.2736557, -3.023082, 1, 0.5333334, 0, 1,
-1.326975, 0.2426655, -0.946402, 1, 0.5411765, 0, 1,
-1.311392, 0.1720393, -1.799797, 1, 0.5450981, 0, 1,
-1.287034, -0.7056121, -3.081489, 1, 0.5529412, 0, 1,
-1.284492, 0.2512129, -2.46449, 1, 0.5568628, 0, 1,
-1.275698, 0.1683008, -2.077274, 1, 0.5647059, 0, 1,
-1.267494, -1.340018, -1.616204, 1, 0.5686275, 0, 1,
-1.252353, 3.038392, 0.9960856, 1, 0.5764706, 0, 1,
-1.246356, -0.4498576, -2.196262, 1, 0.5803922, 0, 1,
-1.244261, -0.9460808, -3.481317, 1, 0.5882353, 0, 1,
-1.231777, 1.177828, -3.956445, 1, 0.5921569, 0, 1,
-1.218959, 0.6119825, 0.8255722, 1, 0.6, 0, 1,
-1.213548, 0.5406478, 0.08939371, 1, 0.6078432, 0, 1,
-1.212634, 1.347714, -0.6875157, 1, 0.6117647, 0, 1,
-1.210438, -0.4467906, -1.852022, 1, 0.6196079, 0, 1,
-1.209508, 1.764569, -0.2571009, 1, 0.6235294, 0, 1,
-1.204525, 0.03543739, -1.955958, 1, 0.6313726, 0, 1,
-1.202671, -0.2126615, -0.1287279, 1, 0.6352941, 0, 1,
-1.198718, -1.492598, -1.916628, 1, 0.6431373, 0, 1,
-1.197215, -0.5296211, -1.693134, 1, 0.6470588, 0, 1,
-1.192944, -1.310372, -0.7573112, 1, 0.654902, 0, 1,
-1.19203, 0.5677939, -1.102856, 1, 0.6588235, 0, 1,
-1.191639, -0.6281353, -1.91729, 1, 0.6666667, 0, 1,
-1.183163, 0.5514725, -1.637953, 1, 0.6705883, 0, 1,
-1.182094, -0.4444683, -2.038294, 1, 0.6784314, 0, 1,
-1.178492, -0.4967744, 0.07603125, 1, 0.682353, 0, 1,
-1.177194, -1.622836, -1.506974, 1, 0.6901961, 0, 1,
-1.176982, -1.295752, -2.405113, 1, 0.6941177, 0, 1,
-1.169, -0.5609164, -2.398232, 1, 0.7019608, 0, 1,
-1.167093, -1.915289, -4.523451, 1, 0.7098039, 0, 1,
-1.161773, 1.37072, 0.2845995, 1, 0.7137255, 0, 1,
-1.15423, -0.1979369, -2.304818, 1, 0.7215686, 0, 1,
-1.153831, 1.361608, 1.215077, 1, 0.7254902, 0, 1,
-1.149409, -0.9419534, -2.983075, 1, 0.7333333, 0, 1,
-1.139534, 0.8895851, -0.8155593, 1, 0.7372549, 0, 1,
-1.138462, 0.4547987, -2.141805, 1, 0.7450981, 0, 1,
-1.136873, 0.1432976, -1.176956, 1, 0.7490196, 0, 1,
-1.134895, -0.5621521, -2.841712, 1, 0.7568628, 0, 1,
-1.116768, 0.9779328, -0.9205341, 1, 0.7607843, 0, 1,
-1.109261, 1.163385, -1.1769, 1, 0.7686275, 0, 1,
-1.106674, -0.5467013, -2.186003, 1, 0.772549, 0, 1,
-1.104433, 1.005388, 0.3660443, 1, 0.7803922, 0, 1,
-1.102838, 0.9837658, -0.8378372, 1, 0.7843137, 0, 1,
-1.101703, -0.8410321, -2.60862, 1, 0.7921569, 0, 1,
-1.089968, 0.7335295, -0.6010366, 1, 0.7960784, 0, 1,
-1.088156, 1.184867, 0.2468586, 1, 0.8039216, 0, 1,
-1.083536, 0.8154594, -0.8977234, 1, 0.8117647, 0, 1,
-1.078951, 0.6048748, 0.8135242, 1, 0.8156863, 0, 1,
-1.073269, 0.9979997, -0.6440793, 1, 0.8235294, 0, 1,
-1.069176, -0.2153354, -2.573904, 1, 0.827451, 0, 1,
-1.06383, -0.08943907, -1.957509, 1, 0.8352941, 0, 1,
-1.057736, 0.218139, -1.606351, 1, 0.8392157, 0, 1,
-1.04637, -0.8819646, 0.005022532, 1, 0.8470588, 0, 1,
-1.043619, -0.05773908, -1.34194, 1, 0.8509804, 0, 1,
-1.039467, -1.081684, -0.8042162, 1, 0.8588235, 0, 1,
-1.03818, -0.8628756, -2.714761, 1, 0.8627451, 0, 1,
-1.037622, -1.266143, -2.358716, 1, 0.8705882, 0, 1,
-1.032955, -0.5048637, -2.953557, 1, 0.8745098, 0, 1,
-1.030034, 2.734519, -1.087429, 1, 0.8823529, 0, 1,
-1.026806, 1.399557, 1.475404, 1, 0.8862745, 0, 1,
-1.023446, 0.5696673, -0.4430337, 1, 0.8941177, 0, 1,
-1.02343, -1.924492, -4.539151, 1, 0.8980392, 0, 1,
-1.017051, 0.02241975, -0.4634089, 1, 0.9058824, 0, 1,
-1.009293, 0.519222, 0.1979236, 1, 0.9137255, 0, 1,
-1.005315, -0.5458171, -2.711649, 1, 0.9176471, 0, 1,
-1.004312, -1.487366, -1.405768, 1, 0.9254902, 0, 1,
-1.00335, -0.02739398, -1.920883, 1, 0.9294118, 0, 1,
-0.9942876, 0.3861529, -1.703418, 1, 0.9372549, 0, 1,
-0.9845434, -0.3627175, -2.748682, 1, 0.9411765, 0, 1,
-0.9835503, 0.03102741, -2.473593, 1, 0.9490196, 0, 1,
-0.9805526, 1.164973, 0.5716177, 1, 0.9529412, 0, 1,
-0.9786608, 1.168228, 0.4156, 1, 0.9607843, 0, 1,
-0.9730525, 1.170926, 0.602456, 1, 0.9647059, 0, 1,
-0.9726918, -1.417067, -2.120659, 1, 0.972549, 0, 1,
-0.966029, -1.919196, -1.321191, 1, 0.9764706, 0, 1,
-0.9639955, -1.527907, -1.918218, 1, 0.9843137, 0, 1,
-0.9545028, -0.08117685, -1.415887, 1, 0.9882353, 0, 1,
-0.9452813, 0.3276941, -1.686046, 1, 0.9960784, 0, 1,
-0.9418654, 0.5289991, -0.8927188, 0.9960784, 1, 0, 1,
-0.9414661, -0.9627221, -4.532573, 0.9921569, 1, 0, 1,
-0.9397179, 0.005438176, -2.181162, 0.9843137, 1, 0, 1,
-0.9342017, 0.2365404, -1.291469, 0.9803922, 1, 0, 1,
-0.9309719, -0.5257556, -2.349322, 0.972549, 1, 0, 1,
-0.9293111, 0.8212204, -1.398934, 0.9686275, 1, 0, 1,
-0.9255198, 0.863474, -2.525863, 0.9607843, 1, 0, 1,
-0.9239877, 1.035317, -1.262205, 0.9568627, 1, 0, 1,
-0.9236118, -0.7215496, -3.173851, 0.9490196, 1, 0, 1,
-0.9224898, -0.0121119, -0.6206521, 0.945098, 1, 0, 1,
-0.9199858, 0.6426272, -3.009555, 0.9372549, 1, 0, 1,
-0.9163404, -1.656871, -4.456135, 0.9333333, 1, 0, 1,
-0.9144076, -0.1575975, -2.777227, 0.9254902, 1, 0, 1,
-0.9141359, 0.1324766, -2.392964, 0.9215686, 1, 0, 1,
-0.911405, 0.03261425, -1.393405, 0.9137255, 1, 0, 1,
-0.9085844, -0.6785514, -3.258989, 0.9098039, 1, 0, 1,
-0.9051396, 0.5781555, -0.2890232, 0.9019608, 1, 0, 1,
-0.9031743, 0.8423567, -0.7165229, 0.8941177, 1, 0, 1,
-0.897957, 0.3656887, -0.4369596, 0.8901961, 1, 0, 1,
-0.8914684, 1.873643, -1.825808, 0.8823529, 1, 0, 1,
-0.8867484, 1.58286, -0.5747279, 0.8784314, 1, 0, 1,
-0.8863782, -0.7587935, -3.369957, 0.8705882, 1, 0, 1,
-0.8737494, 2.226415, -2.106782, 0.8666667, 1, 0, 1,
-0.8683775, -1.010242, -1.268179, 0.8588235, 1, 0, 1,
-0.8646468, -0.7544608, -2.563003, 0.854902, 1, 0, 1,
-0.8607174, 0.1141274, -1.080962, 0.8470588, 1, 0, 1,
-0.8596045, 0.4061578, -4.181284, 0.8431373, 1, 0, 1,
-0.8466572, -0.9054341, -2.037005, 0.8352941, 1, 0, 1,
-0.8420028, -1.100302, -3.283219, 0.8313726, 1, 0, 1,
-0.8348191, 0.7222621, -1.446206, 0.8235294, 1, 0, 1,
-0.8238767, -0.2650493, -0.5595972, 0.8196079, 1, 0, 1,
-0.8221032, -0.1481901, -1.267162, 0.8117647, 1, 0, 1,
-0.8220628, 0.2428436, -0.5723016, 0.8078431, 1, 0, 1,
-0.8214684, 1.697316, -1.606068, 0.8, 1, 0, 1,
-0.8044056, -0.7236713, -1.705942, 0.7921569, 1, 0, 1,
-0.8038056, 1.409293, -0.008237967, 0.7882353, 1, 0, 1,
-0.803281, -0.4566318, -1.527962, 0.7803922, 1, 0, 1,
-0.7998833, -1.353506, -4.929962, 0.7764706, 1, 0, 1,
-0.7957569, 1.679352, 0.103007, 0.7686275, 1, 0, 1,
-0.7873667, -0.08818749, -0.1929135, 0.7647059, 1, 0, 1,
-0.7854494, -0.04183153, -1.879727, 0.7568628, 1, 0, 1,
-0.7842046, -1.11303, -2.545624, 0.7529412, 1, 0, 1,
-0.7841799, -1.915672, -2.927955, 0.7450981, 1, 0, 1,
-0.7791772, -0.8959868, -2.163567, 0.7411765, 1, 0, 1,
-0.7747169, -0.783653, -1.966797, 0.7333333, 1, 0, 1,
-0.7737131, 2.110811, 1.854748, 0.7294118, 1, 0, 1,
-0.7728662, 0.6500583, -0.2781559, 0.7215686, 1, 0, 1,
-0.7690004, 0.03684241, -0.3477822, 0.7176471, 1, 0, 1,
-0.7650697, -0.8047166, -2.496474, 0.7098039, 1, 0, 1,
-0.7616296, 0.1299775, -3.753618, 0.7058824, 1, 0, 1,
-0.7567069, -0.9330758, -1.699174, 0.6980392, 1, 0, 1,
-0.7509127, 0.5708915, 0.1950238, 0.6901961, 1, 0, 1,
-0.7504098, 0.01619438, -1.279087, 0.6862745, 1, 0, 1,
-0.7497311, 0.9709279, 0.1113992, 0.6784314, 1, 0, 1,
-0.7470428, -0.8155113, -1.842391, 0.6745098, 1, 0, 1,
-0.7421225, -1.371675, -2.453654, 0.6666667, 1, 0, 1,
-0.7320979, 1.036588, -2.708756, 0.6627451, 1, 0, 1,
-0.7316821, 1.449966, -0.4168884, 0.654902, 1, 0, 1,
-0.7311631, -0.3465616, -3.394739, 0.6509804, 1, 0, 1,
-0.72979, -0.7933536, -2.212459, 0.6431373, 1, 0, 1,
-0.7279266, 0.2023556, -1.906474, 0.6392157, 1, 0, 1,
-0.7265106, 1.175761, -0.1363711, 0.6313726, 1, 0, 1,
-0.719658, 0.3287594, -2.476668, 0.627451, 1, 0, 1,
-0.7192123, -0.1663494, -1.404426, 0.6196079, 1, 0, 1,
-0.6895348, -0.1068112, -0.4574116, 0.6156863, 1, 0, 1,
-0.6854218, 0.9299902, -0.3083863, 0.6078432, 1, 0, 1,
-0.6811232, 0.9062838, -1.525954, 0.6039216, 1, 0, 1,
-0.6787559, -0.589224, -1.334976, 0.5960785, 1, 0, 1,
-0.675014, -1.570775, -2.750213, 0.5882353, 1, 0, 1,
-0.6747357, 1.908118, -1.061353, 0.5843138, 1, 0, 1,
-0.6687248, -0.4577223, -2.002155, 0.5764706, 1, 0, 1,
-0.6677595, 0.01731298, -2.395358, 0.572549, 1, 0, 1,
-0.6655142, -1.28074, -3.73989, 0.5647059, 1, 0, 1,
-0.6638525, -1.058084, -2.795164, 0.5607843, 1, 0, 1,
-0.6634491, 0.9455088, -1.739885, 0.5529412, 1, 0, 1,
-0.6597818, -0.4540761, -1.804516, 0.5490196, 1, 0, 1,
-0.6541055, -0.3051222, -1.782468, 0.5411765, 1, 0, 1,
-0.6473342, 0.5648504, 0.2359572, 0.5372549, 1, 0, 1,
-0.6430001, -1.271545, -2.402607, 0.5294118, 1, 0, 1,
-0.6415815, 0.1838953, 0.8988791, 0.5254902, 1, 0, 1,
-0.6408824, 1.24847, -0.3498307, 0.5176471, 1, 0, 1,
-0.6368436, -0.02028453, -1.641039, 0.5137255, 1, 0, 1,
-0.6363112, -0.4569591, -2.194523, 0.5058824, 1, 0, 1,
-0.6349256, 1.394882, -1.437537, 0.5019608, 1, 0, 1,
-0.6292861, -1.015334, -4.196724, 0.4941176, 1, 0, 1,
-0.6276218, -1.404497, -3.371286, 0.4862745, 1, 0, 1,
-0.6253104, -0.3055852, -1.588602, 0.4823529, 1, 0, 1,
-0.6242996, -0.8371775, -1.756147, 0.4745098, 1, 0, 1,
-0.6241043, -0.2025967, -3.100078, 0.4705882, 1, 0, 1,
-0.6234534, -0.3825041, -0.97089, 0.4627451, 1, 0, 1,
-0.6229515, 0.0690975, -2.750096, 0.4588235, 1, 0, 1,
-0.6181421, 0.5465205, -0.9767075, 0.4509804, 1, 0, 1,
-0.6169339, 0.9125761, -0.01223501, 0.4470588, 1, 0, 1,
-0.6148248, -0.3256027, -0.8674473, 0.4392157, 1, 0, 1,
-0.6121677, 0.4325933, -2.097152, 0.4352941, 1, 0, 1,
-0.6115721, -0.4696269, -3.067191, 0.427451, 1, 0, 1,
-0.6114353, 1.635674, 0.9264979, 0.4235294, 1, 0, 1,
-0.6035705, -0.1776946, -1.441148, 0.4156863, 1, 0, 1,
-0.6033034, 0.001055393, -0.2813462, 0.4117647, 1, 0, 1,
-0.6019649, 0.1168589, -2.293558, 0.4039216, 1, 0, 1,
-0.5864318, 0.3015478, 0.003774032, 0.3960784, 1, 0, 1,
-0.5848559, 0.2299428, -2.336121, 0.3921569, 1, 0, 1,
-0.5804281, 0.5035647, -1.971781, 0.3843137, 1, 0, 1,
-0.5793524, 0.903487, -0.8575357, 0.3803922, 1, 0, 1,
-0.5748628, -0.2137346, -1.316234, 0.372549, 1, 0, 1,
-0.5709925, 1.696137, -1.132071, 0.3686275, 1, 0, 1,
-0.5706086, 0.574782, 0.1236966, 0.3607843, 1, 0, 1,
-0.5640786, 0.6584306, -0.195954, 0.3568628, 1, 0, 1,
-0.5631919, 0.7864049, 1.402086, 0.3490196, 1, 0, 1,
-0.5599207, 1.938778, 2.07208, 0.345098, 1, 0, 1,
-0.5584806, 0.9607159, 1.154411, 0.3372549, 1, 0, 1,
-0.5578828, -0.3706006, -0.7321216, 0.3333333, 1, 0, 1,
-0.5544931, 1.595798, -1.345681, 0.3254902, 1, 0, 1,
-0.5496687, 0.2855363, -2.097486, 0.3215686, 1, 0, 1,
-0.5485045, 0.8367805, -1.73053, 0.3137255, 1, 0, 1,
-0.5482641, -0.251968, -2.060198, 0.3098039, 1, 0, 1,
-0.5372874, 1.034985, 1.62068, 0.3019608, 1, 0, 1,
-0.5349003, 0.7588598, -1.487104, 0.2941177, 1, 0, 1,
-0.534871, -0.156957, -0.9743432, 0.2901961, 1, 0, 1,
-0.5274922, -0.2436401, -2.919147, 0.282353, 1, 0, 1,
-0.5250554, 1.050503, -2.694355, 0.2784314, 1, 0, 1,
-0.5227457, 0.5456486, 1.429791, 0.2705882, 1, 0, 1,
-0.5174941, 0.5451104, 0.2875539, 0.2666667, 1, 0, 1,
-0.5167757, 1.355268, -0.8257564, 0.2588235, 1, 0, 1,
-0.5130341, 0.1640977, -0.7402744, 0.254902, 1, 0, 1,
-0.5116212, 0.09397911, -2.21231, 0.2470588, 1, 0, 1,
-0.5112081, 1.533919, 0.3475515, 0.2431373, 1, 0, 1,
-0.5086896, -0.5438233, -4.312223, 0.2352941, 1, 0, 1,
-0.5076307, 0.1916457, -1.218131, 0.2313726, 1, 0, 1,
-0.501574, -0.3541341, -3.723658, 0.2235294, 1, 0, 1,
-0.5001477, -0.2393115, -1.12679, 0.2196078, 1, 0, 1,
-0.4959145, -0.1326854, -1.54568, 0.2117647, 1, 0, 1,
-0.4938971, 0.7178938, -0.1020196, 0.2078431, 1, 0, 1,
-0.4872818, -0.2575227, -0.8618023, 0.2, 1, 0, 1,
-0.4858884, 0.1789335, -0.8247979, 0.1921569, 1, 0, 1,
-0.4821843, 1.327941, 0.2306592, 0.1882353, 1, 0, 1,
-0.4800277, 0.2683487, -1.790611, 0.1803922, 1, 0, 1,
-0.4797301, 0.8632569, -1.072706, 0.1764706, 1, 0, 1,
-0.4732864, -1.882703, -2.213297, 0.1686275, 1, 0, 1,
-0.4719521, -0.05529779, -3.4185, 0.1647059, 1, 0, 1,
-0.4695636, 1.382571, -0.8201173, 0.1568628, 1, 0, 1,
-0.4671088, -0.12605, -2.416941, 0.1529412, 1, 0, 1,
-0.4633459, 0.4199629, -2.056359, 0.145098, 1, 0, 1,
-0.4558519, 1.056877, -0.05698394, 0.1411765, 1, 0, 1,
-0.4558029, 0.4359249, -2.117472, 0.1333333, 1, 0, 1,
-0.4509341, -1.709072, -3.497093, 0.1294118, 1, 0, 1,
-0.4496102, -0.3685674, -1.831061, 0.1215686, 1, 0, 1,
-0.4488063, -1.494992, -2.547208, 0.1176471, 1, 0, 1,
-0.4487514, 0.7461174, -0.9998904, 0.1098039, 1, 0, 1,
-0.4477288, -0.3743238, -1.538844, 0.1058824, 1, 0, 1,
-0.4460254, 0.7121701, -0.7703673, 0.09803922, 1, 0, 1,
-0.4459344, -0.8141788, -1.904744, 0.09019608, 1, 0, 1,
-0.4410269, -2.429815, -2.053906, 0.08627451, 1, 0, 1,
-0.438627, 1.554273, -1.079288, 0.07843138, 1, 0, 1,
-0.4364873, 2.032062, -0.4698463, 0.07450981, 1, 0, 1,
-0.4240288, 0.1000449, -1.669864, 0.06666667, 1, 0, 1,
-0.4118796, 0.1632273, 0.00941431, 0.0627451, 1, 0, 1,
-0.4108154, 0.4114915, -1.323854, 0.05490196, 1, 0, 1,
-0.4100606, 0.7923624, -0.6326892, 0.05098039, 1, 0, 1,
-0.4088814, -0.8299032, -4.168255, 0.04313726, 1, 0, 1,
-0.4058661, 1.521319, -0.7557721, 0.03921569, 1, 0, 1,
-0.4004953, 0.2182939, 0.05073673, 0.03137255, 1, 0, 1,
-0.3988731, 0.5155684, -1.299635, 0.02745098, 1, 0, 1,
-0.3945656, 0.6133414, 0.1739374, 0.01960784, 1, 0, 1,
-0.3944493, -0.5170875, -1.8968, 0.01568628, 1, 0, 1,
-0.3935513, 0.9225255, 1.704327, 0.007843138, 1, 0, 1,
-0.393135, -0.1574994, -2.51738, 0.003921569, 1, 0, 1,
-0.3930099, 0.1959617, -1.803872, 0, 1, 0.003921569, 1,
-0.3914951, -1.254357, -2.075555, 0, 1, 0.01176471, 1,
-0.3885402, 0.1194904, 0.1257647, 0, 1, 0.01568628, 1,
-0.3851141, 1.337209, 0.01790589, 0, 1, 0.02352941, 1,
-0.3838303, 1.277843, 1.206991, 0, 1, 0.02745098, 1,
-0.3822665, 0.3197807, -0.6802105, 0, 1, 0.03529412, 1,
-0.3750338, -1.035906, -4.086955, 0, 1, 0.03921569, 1,
-0.3747116, -0.1540188, -1.145198, 0, 1, 0.04705882, 1,
-0.3672083, -1.518597, -2.804172, 0, 1, 0.05098039, 1,
-0.3660257, -0.1482665, -3.057768, 0, 1, 0.05882353, 1,
-0.3647734, 0.1476737, -0.2424192, 0, 1, 0.0627451, 1,
-0.362877, 0.5266199, 0.3173607, 0, 1, 0.07058824, 1,
-0.3622737, 0.4370806, 0.2373539, 0, 1, 0.07450981, 1,
-0.3614839, -0.571842, -3.784226, 0, 1, 0.08235294, 1,
-0.3588889, 2.608833, -1.486138, 0, 1, 0.08627451, 1,
-0.3586301, 0.4717472, 0.8061644, 0, 1, 0.09411765, 1,
-0.3558684, 0.1437262, -0.8302963, 0, 1, 0.1019608, 1,
-0.3541329, 1.298701, -0.4901332, 0, 1, 0.1058824, 1,
-0.3522862, 1.316292, -0.722616, 0, 1, 0.1137255, 1,
-0.3476613, 0.6225142, -0.08301582, 0, 1, 0.1176471, 1,
-0.3445784, 0.03517675, -3.231104, 0, 1, 0.1254902, 1,
-0.3420833, 0.315247, -1.452496, 0, 1, 0.1294118, 1,
-0.3415091, 0.3238068, 1.039484, 0, 1, 0.1372549, 1,
-0.3395409, -0.2506854, -1.53423, 0, 1, 0.1411765, 1,
-0.3373452, -0.8348422, -3.267612, 0, 1, 0.1490196, 1,
-0.3362574, -0.9624395, -1.96252, 0, 1, 0.1529412, 1,
-0.3282509, 1.144709, -1.486436, 0, 1, 0.1607843, 1,
-0.3245307, 0.180852, -0.8653485, 0, 1, 0.1647059, 1,
-0.3242676, -0.5474928, -1.439263, 0, 1, 0.172549, 1,
-0.3229721, -0.4276118, -2.423932, 0, 1, 0.1764706, 1,
-0.3226275, 0.05296344, -2.814924, 0, 1, 0.1843137, 1,
-0.3210193, -0.5703065, -2.068525, 0, 1, 0.1882353, 1,
-0.320887, 0.3402812, -0.110544, 0, 1, 0.1960784, 1,
-0.3200525, 0.3733152, -0.8873588, 0, 1, 0.2039216, 1,
-0.3192108, -0.3374364, -1.362671, 0, 1, 0.2078431, 1,
-0.3139051, 1.299815, -0.3261671, 0, 1, 0.2156863, 1,
-0.3045247, 0.4192338, -2.194677, 0, 1, 0.2196078, 1,
-0.3041627, -0.6280885, -1.620757, 0, 1, 0.227451, 1,
-0.3005832, -1.56466, -4.525422, 0, 1, 0.2313726, 1,
-0.298411, -0.5348982, -0.1331741, 0, 1, 0.2392157, 1,
-0.297517, -0.1588686, -2.81585, 0, 1, 0.2431373, 1,
-0.2963508, -1.696592, -3.689908, 0, 1, 0.2509804, 1,
-0.2909309, -1.464648, 0.1864034, 0, 1, 0.254902, 1,
-0.2907178, 0.6687718, -0.5421727, 0, 1, 0.2627451, 1,
-0.2847582, -1.119767, -2.468261, 0, 1, 0.2666667, 1,
-0.2754041, -0.4989626, -2.311442, 0, 1, 0.2745098, 1,
-0.2723024, 0.5237373, 0.4199483, 0, 1, 0.2784314, 1,
-0.2663313, -0.9176104, -3.851398, 0, 1, 0.2862745, 1,
-0.2660982, -0.4932167, -1.583859, 0, 1, 0.2901961, 1,
-0.261502, -1.289043, -2.58558, 0, 1, 0.2980392, 1,
-0.2590494, -1.185832, -3.052361, 0, 1, 0.3058824, 1,
-0.257264, 1.26378, 0.5425216, 0, 1, 0.3098039, 1,
-0.2507065, -1.419863, -2.881095, 0, 1, 0.3176471, 1,
-0.2474514, -1.602446, -1.608691, 0, 1, 0.3215686, 1,
-0.243551, -0.7375675, -2.919867, 0, 1, 0.3294118, 1,
-0.2347268, -1.051749, -2.899766, 0, 1, 0.3333333, 1,
-0.2258154, -1.04716, -2.734838, 0, 1, 0.3411765, 1,
-0.2249187, 0.2451933, -0.5771272, 0, 1, 0.345098, 1,
-0.2230738, -0.2142553, -1.367958, 0, 1, 0.3529412, 1,
-0.2222882, -0.7866259, -3.683531, 0, 1, 0.3568628, 1,
-0.2208423, 0.06794254, -2.653165, 0, 1, 0.3647059, 1,
-0.2183245, -0.7738265, -3.200322, 0, 1, 0.3686275, 1,
-0.2167648, 1.827808, 0.3155583, 0, 1, 0.3764706, 1,
-0.2147015, 0.2365584, -0.5043654, 0, 1, 0.3803922, 1,
-0.2141383, 0.249004, -0.2732329, 0, 1, 0.3882353, 1,
-0.2109145, -0.2711733, -2.623016, 0, 1, 0.3921569, 1,
-0.2101572, -0.1669925, -2.154309, 0, 1, 0.4, 1,
-0.2099619, 0.5686876, 0.2726943, 0, 1, 0.4078431, 1,
-0.202778, -1.717123, -2.776417, 0, 1, 0.4117647, 1,
-0.2014219, 1.186036, -0.8976808, 0, 1, 0.4196078, 1,
-0.1977184, 0.7273511, 0.03385615, 0, 1, 0.4235294, 1,
-0.1976181, -1.910326, -0.3476816, 0, 1, 0.4313726, 1,
-0.1972998, -0.06798489, -2.378812, 0, 1, 0.4352941, 1,
-0.1907813, 0.1226157, -2.751127, 0, 1, 0.4431373, 1,
-0.1899752, -1.084805, -1.085746, 0, 1, 0.4470588, 1,
-0.1821734, 0.3749352, 0.8298033, 0, 1, 0.454902, 1,
-0.1772877, 0.4441204, 0.4284769, 0, 1, 0.4588235, 1,
-0.1771657, -1.145947, -2.31254, 0, 1, 0.4666667, 1,
-0.174764, 0.09134107, -1.766382, 0, 1, 0.4705882, 1,
-0.1705576, 0.2324577, -0.3125673, 0, 1, 0.4784314, 1,
-0.1691457, -0.5125846, -2.342282, 0, 1, 0.4823529, 1,
-0.1668687, -0.2540549, -2.164432, 0, 1, 0.4901961, 1,
-0.1656929, 1.59607, 0.1201685, 0, 1, 0.4941176, 1,
-0.1633442, -1.578016, -4.124972, 0, 1, 0.5019608, 1,
-0.162137, -0.3667742, -3.744297, 0, 1, 0.509804, 1,
-0.1621082, 0.1768054, -0.5874957, 0, 1, 0.5137255, 1,
-0.1616028, -0.03255354, -0.3237835, 0, 1, 0.5215687, 1,
-0.1599053, 0.3409364, -1.010349, 0, 1, 0.5254902, 1,
-0.1584864, -0.2461934, -0.7999845, 0, 1, 0.5333334, 1,
-0.157653, 0.479522, -0.5230244, 0, 1, 0.5372549, 1,
-0.1574425, -0.06330219, -2.510053, 0, 1, 0.5450981, 1,
-0.1566775, -0.4669442, -2.142818, 0, 1, 0.5490196, 1,
-0.1558415, 0.2785535, -0.7765396, 0, 1, 0.5568628, 1,
-0.1541522, -0.0146292, -2.223061, 0, 1, 0.5607843, 1,
-0.1494911, -2.07463, -2.570277, 0, 1, 0.5686275, 1,
-0.1479584, 0.3955171, -0.7141142, 0, 1, 0.572549, 1,
-0.147838, -1.28954, -2.673435, 0, 1, 0.5803922, 1,
-0.1460145, -0.2740223, -1.252718, 0, 1, 0.5843138, 1,
-0.1411391, -1.271524, -2.849511, 0, 1, 0.5921569, 1,
-0.1381624, 0.1971073, 0.1659989, 0, 1, 0.5960785, 1,
-0.1351308, 0.2114877, 0.3543082, 0, 1, 0.6039216, 1,
-0.1342361, 0.832772, 0.4388262, 0, 1, 0.6117647, 1,
-0.1294546, -0.401609, -2.013022, 0, 1, 0.6156863, 1,
-0.128997, -0.477114, -3.321846, 0, 1, 0.6235294, 1,
-0.1286656, -1.754928, -2.670279, 0, 1, 0.627451, 1,
-0.1251448, -1.068958, -2.69275, 0, 1, 0.6352941, 1,
-0.1212597, 1.038311, -0.772509, 0, 1, 0.6392157, 1,
-0.1185886, 0.08103702, -3.076561, 0, 1, 0.6470588, 1,
-0.1169239, 0.2531137, 0.2487912, 0, 1, 0.6509804, 1,
-0.115375, -1.30657, -1.704506, 0, 1, 0.6588235, 1,
-0.1101478, 1.316799, 1.043027, 0, 1, 0.6627451, 1,
-0.1043993, 0.8162469, 0.5708967, 0, 1, 0.6705883, 1,
-0.1033015, 0.3525417, 0.3563603, 0, 1, 0.6745098, 1,
-0.09964486, 0.3897448, 0.5476775, 0, 1, 0.682353, 1,
-0.09837691, -1.21871, -3.797163, 0, 1, 0.6862745, 1,
-0.09469083, 0.0307972, -0.1660487, 0, 1, 0.6941177, 1,
-0.09236068, -0.7430077, -2.927841, 0, 1, 0.7019608, 1,
-0.0894438, 0.0983827, 0.3782908, 0, 1, 0.7058824, 1,
-0.07318266, -0.09963591, -1.566398, 0, 1, 0.7137255, 1,
-0.06798701, -0.966024, -2.254056, 0, 1, 0.7176471, 1,
-0.06737051, -0.8748185, -4.122084, 0, 1, 0.7254902, 1,
-0.06492104, -0.4573765, -1.501437, 0, 1, 0.7294118, 1,
-0.06404123, 0.04187451, -0.2432395, 0, 1, 0.7372549, 1,
-0.06358049, -0.8445141, -2.764781, 0, 1, 0.7411765, 1,
-0.05986898, 0.9614885, 0.3022905, 0, 1, 0.7490196, 1,
-0.05893649, -0.5568787, -4.245657, 0, 1, 0.7529412, 1,
-0.05891529, -2.008877, -1.903831, 0, 1, 0.7607843, 1,
-0.0566683, -1.196336, -2.991865, 0, 1, 0.7647059, 1,
-0.05660536, 1.380199, 1.727216, 0, 1, 0.772549, 1,
-0.05534905, 0.9780661, 0.1714272, 0, 1, 0.7764706, 1,
-0.05515801, 1.014734, 0.9951048, 0, 1, 0.7843137, 1,
-0.05168643, -0.1867533, -3.50635, 0, 1, 0.7882353, 1,
-0.04534124, -1.466398, -4.415637, 0, 1, 0.7960784, 1,
-0.04509162, -1.485412, -1.646027, 0, 1, 0.8039216, 1,
-0.03189001, 0.3900074, 1.341575, 0, 1, 0.8078431, 1,
-0.03156447, 1.213489, 1.015197, 0, 1, 0.8156863, 1,
-0.03151179, -0.04766867, -1.15235, 0, 1, 0.8196079, 1,
-0.0290021, -0.4208662, -4.100505, 0, 1, 0.827451, 1,
-0.02225959, 0.2709424, -0.1688638, 0, 1, 0.8313726, 1,
-0.01834353, -0.3200646, -3.656388, 0, 1, 0.8392157, 1,
-0.0159799, 0.1882477, 0.03695453, 0, 1, 0.8431373, 1,
-0.01401274, -1.278684, -1.105123, 0, 1, 0.8509804, 1,
-0.01375883, -0.04378961, -4.233409, 0, 1, 0.854902, 1,
-0.013569, 0.1809428, 2.038866, 0, 1, 0.8627451, 1,
-0.01101456, 0.9705755, 1.016846, 0, 1, 0.8666667, 1,
-0.01090104, -0.1381243, -2.479701, 0, 1, 0.8745098, 1,
-0.008514599, 0.6844732, 0.4320787, 0, 1, 0.8784314, 1,
-0.007844706, 0.4621633, 0.592486, 0, 1, 0.8862745, 1,
-0.006085747, -0.4050263, -3.476058, 0, 1, 0.8901961, 1,
-0.003758371, -0.9987881, -4.422634, 0, 1, 0.8980392, 1,
-0.003377852, -0.9208182, -2.790159, 0, 1, 0.9058824, 1,
-0.002371879, -1.96194, -3.818812, 0, 1, 0.9098039, 1,
-0.001851209, 0.6811819, 0.1344413, 0, 1, 0.9176471, 1,
0.001011004, -0.319244, 4.663227, 0, 1, 0.9215686, 1,
0.00154799, 2.790576, -1.153705, 0, 1, 0.9294118, 1,
0.001711311, -1.961117, 2.999153, 0, 1, 0.9333333, 1,
0.002379587, -0.8316447, 2.238776, 0, 1, 0.9411765, 1,
0.003835845, -2.181676, 3.368327, 0, 1, 0.945098, 1,
0.009040105, -1.911196, 4.285651, 0, 1, 0.9529412, 1,
0.01368606, -0.02612595, 3.92463, 0, 1, 0.9568627, 1,
0.01514568, -1.985772, 4.410282, 0, 1, 0.9647059, 1,
0.01714354, -0.2458223, 1.380699, 0, 1, 0.9686275, 1,
0.01762214, -0.2972598, 2.523463, 0, 1, 0.9764706, 1,
0.02005949, -1.696395, 4.002848, 0, 1, 0.9803922, 1,
0.02200104, -1.128937, 1.626577, 0, 1, 0.9882353, 1,
0.02878984, -1.290474, 3.275448, 0, 1, 0.9921569, 1,
0.02893327, -0.5365973, 2.681105, 0, 1, 1, 1,
0.03077277, 1.334214, 0.8610065, 0, 0.9921569, 1, 1,
0.03517016, 0.2134922, -0.4301327, 0, 0.9882353, 1, 1,
0.03537429, -0.7092332, 4.42613, 0, 0.9803922, 1, 1,
0.03630173, -0.315866, 2.891847, 0, 0.9764706, 1, 1,
0.03649399, -1.498429, 3.397185, 0, 0.9686275, 1, 1,
0.0470513, 1.728513, -0.1670126, 0, 0.9647059, 1, 1,
0.05157566, 0.5823154, -0.5957076, 0, 0.9568627, 1, 1,
0.05179248, -0.8491004, 2.927221, 0, 0.9529412, 1, 1,
0.05257663, 1.696435, -1.705996, 0, 0.945098, 1, 1,
0.05997499, -0.7894007, 4.961487, 0, 0.9411765, 1, 1,
0.06391313, 0.3587365, 1.197037, 0, 0.9333333, 1, 1,
0.06542169, -1.528102, 2.067408, 0, 0.9294118, 1, 1,
0.06679807, -1.017877, 2.431956, 0, 0.9215686, 1, 1,
0.06713922, 0.1217436, 0.6965479, 0, 0.9176471, 1, 1,
0.06820319, -0.2872866, 2.934616, 0, 0.9098039, 1, 1,
0.06839561, 0.543987, 0.1709201, 0, 0.9058824, 1, 1,
0.06988042, -0.298109, 3.739336, 0, 0.8980392, 1, 1,
0.07200577, 0.1797373, 2.404702, 0, 0.8901961, 1, 1,
0.0738517, -0.4238558, 3.264388, 0, 0.8862745, 1, 1,
0.07789248, 0.02436891, 2.760421, 0, 0.8784314, 1, 1,
0.08194078, -1.849018, 4.358574, 0, 0.8745098, 1, 1,
0.08368154, -0.3048579, 3.320045, 0, 0.8666667, 1, 1,
0.0888771, 0.9207261, 0.05739897, 0, 0.8627451, 1, 1,
0.09366094, 1.749795, -0.2734186, 0, 0.854902, 1, 1,
0.09606041, -0.6713358, 4.146261, 0, 0.8509804, 1, 1,
0.09630369, 0.3625225, -1.743852, 0, 0.8431373, 1, 1,
0.09680507, 1.902478, -0.4605043, 0, 0.8392157, 1, 1,
0.09831888, 0.8552125, 0.091731, 0, 0.8313726, 1, 1,
0.09960484, -1.169712, 3.562496, 0, 0.827451, 1, 1,
0.100493, 1.102015, 1.036205, 0, 0.8196079, 1, 1,
0.1011054, 0.01171244, 0.7298728, 0, 0.8156863, 1, 1,
0.1020463, -0.9538954, 2.345486, 0, 0.8078431, 1, 1,
0.1063328, -0.02339138, -0.1477552, 0, 0.8039216, 1, 1,
0.1068787, -0.1984134, 2.850535, 0, 0.7960784, 1, 1,
0.1073574, 0.7434244, 1.173605, 0, 0.7882353, 1, 1,
0.1105438, 1.086721, -0.6693321, 0, 0.7843137, 1, 1,
0.1130709, -2.602071, 3.230675, 0, 0.7764706, 1, 1,
0.1182132, 0.7451181, -0.4050511, 0, 0.772549, 1, 1,
0.1230029, 0.3199973, 2.520813, 0, 0.7647059, 1, 1,
0.1275019, 0.7542081, 1.513498, 0, 0.7607843, 1, 1,
0.1324506, -0.07252953, 0.6715567, 0, 0.7529412, 1, 1,
0.1343967, -1.025582, 3.066023, 0, 0.7490196, 1, 1,
0.1362409, -1.472235, 2.771039, 0, 0.7411765, 1, 1,
0.1362979, 0.2153859, 2.275196, 0, 0.7372549, 1, 1,
0.1437255, -1.139086, 2.725715, 0, 0.7294118, 1, 1,
0.1458068, 0.1398664, 0.331028, 0, 0.7254902, 1, 1,
0.147079, -1.300194, 4.779709, 0, 0.7176471, 1, 1,
0.148286, -1.083126, 4.037747, 0, 0.7137255, 1, 1,
0.1506435, 0.5345995, 0.6964469, 0, 0.7058824, 1, 1,
0.1512737, 0.2053191, 0.6651291, 0, 0.6980392, 1, 1,
0.1572108, -0.7408763, 5.382566, 0, 0.6941177, 1, 1,
0.1599063, -0.8751339, 1.078733, 0, 0.6862745, 1, 1,
0.1614397, -0.1285501, 2.791392, 0, 0.682353, 1, 1,
0.1617643, 0.565497, 1.565515, 0, 0.6745098, 1, 1,
0.1661839, -2.979018, 3.417284, 0, 0.6705883, 1, 1,
0.1662984, 0.6731164, -0.5298418, 0, 0.6627451, 1, 1,
0.176303, -0.6657168, 2.624289, 0, 0.6588235, 1, 1,
0.1766407, -0.6711027, 3.113864, 0, 0.6509804, 1, 1,
0.1795491, -0.08273963, 3.004769, 0, 0.6470588, 1, 1,
0.179656, -1.080775, 2.723262, 0, 0.6392157, 1, 1,
0.1907707, 0.08337571, 0.5603241, 0, 0.6352941, 1, 1,
0.1911465, 0.7598017, -0.2710008, 0, 0.627451, 1, 1,
0.1919571, -1.444036, 3.853058, 0, 0.6235294, 1, 1,
0.2001274, 0.6940956, -0.8676962, 0, 0.6156863, 1, 1,
0.2001659, -0.3168146, 2.516232, 0, 0.6117647, 1, 1,
0.203202, 0.5496804, 0.7922238, 0, 0.6039216, 1, 1,
0.2070503, 0.6339171, 0.05114115, 0, 0.5960785, 1, 1,
0.2077646, -0.05953931, 2.140935, 0, 0.5921569, 1, 1,
0.2082388, 1.175395, 0.1320313, 0, 0.5843138, 1, 1,
0.2157048, -0.632956, 3.239324, 0, 0.5803922, 1, 1,
0.2199549, -1.39635, 5.608495, 0, 0.572549, 1, 1,
0.2213832, -0.9669356, 2.055783, 0, 0.5686275, 1, 1,
0.223267, 0.2359431, 1.257648, 0, 0.5607843, 1, 1,
0.2277993, -0.2523515, 0.4984647, 0, 0.5568628, 1, 1,
0.230356, -1.870892, 1.136301, 0, 0.5490196, 1, 1,
0.2334345, -0.1264943, 2.577209, 0, 0.5450981, 1, 1,
0.2359227, 0.433214, 0.8942045, 0, 0.5372549, 1, 1,
0.2368405, 1.792044, 0.00634655, 0, 0.5333334, 1, 1,
0.2394882, 0.1605474, 1.506164, 0, 0.5254902, 1, 1,
0.241326, -0.7959297, 2.09642, 0, 0.5215687, 1, 1,
0.2494018, 2.133113, -1.364125, 0, 0.5137255, 1, 1,
0.250735, 0.4130896, 0.05586072, 0, 0.509804, 1, 1,
0.261915, -0.578643, 2.581388, 0, 0.5019608, 1, 1,
0.2697816, -0.6577305, 2.863473, 0, 0.4941176, 1, 1,
0.2729727, -0.5824043, 2.524485, 0, 0.4901961, 1, 1,
0.273687, -0.9772735, 1.550684, 0, 0.4823529, 1, 1,
0.2744092, 0.2932484, 1.529802, 0, 0.4784314, 1, 1,
0.2745447, -0.06065443, 1.928062, 0, 0.4705882, 1, 1,
0.2764652, 1.459605, -1.114905, 0, 0.4666667, 1, 1,
0.2781005, 0.1043945, 1.716642, 0, 0.4588235, 1, 1,
0.2792274, -1.217865, 2.379203, 0, 0.454902, 1, 1,
0.2842602, 1.648261, 0.8968274, 0, 0.4470588, 1, 1,
0.2862515, -0.02853695, 2.576391, 0, 0.4431373, 1, 1,
0.2904719, 0.3451155, 1.28898, 0, 0.4352941, 1, 1,
0.2915571, 0.8419536, -0.494636, 0, 0.4313726, 1, 1,
0.2916172, 0.9598213, -0.5610538, 0, 0.4235294, 1, 1,
0.2964287, -0.5583105, 2.827777, 0, 0.4196078, 1, 1,
0.2988631, -0.1276958, 1.976529, 0, 0.4117647, 1, 1,
0.3021456, -0.6841927, 3.681712, 0, 0.4078431, 1, 1,
0.3032277, -1.270233, 3.495744, 0, 0.4, 1, 1,
0.3036436, -0.5451674, 2.963878, 0, 0.3921569, 1, 1,
0.307961, -0.5422701, 2.277573, 0, 0.3882353, 1, 1,
0.3110264, -0.237039, 2.177139, 0, 0.3803922, 1, 1,
0.3134771, -0.2627838, 2.12895, 0, 0.3764706, 1, 1,
0.3199719, -0.950085, 2.360863, 0, 0.3686275, 1, 1,
0.3211699, -0.3161564, 2.579573, 0, 0.3647059, 1, 1,
0.3245471, -0.7903661, 1.640366, 0, 0.3568628, 1, 1,
0.3281592, -0.7403454, 3.224186, 0, 0.3529412, 1, 1,
0.3340669, -1.126624, 2.651007, 0, 0.345098, 1, 1,
0.3349596, -0.6339185, 2.012505, 0, 0.3411765, 1, 1,
0.336279, -1.578576, 3.492632, 0, 0.3333333, 1, 1,
0.3362837, -0.7625809, 2.604644, 0, 0.3294118, 1, 1,
0.3375553, 0.1580647, -0.1998379, 0, 0.3215686, 1, 1,
0.3393833, -1.342367, 2.869069, 0, 0.3176471, 1, 1,
0.344806, -2.062402, 2.453287, 0, 0.3098039, 1, 1,
0.3449431, 0.080236, 1.723836, 0, 0.3058824, 1, 1,
0.3451532, 0.3586413, 0.4629243, 0, 0.2980392, 1, 1,
0.3459683, -2.573595, 2.098733, 0, 0.2901961, 1, 1,
0.3478372, 1.044651, -0.6029793, 0, 0.2862745, 1, 1,
0.3505673, -0.2419703, 2.965723, 0, 0.2784314, 1, 1,
0.3518242, 0.0706166, 1.329323, 0, 0.2745098, 1, 1,
0.3593659, 1.874254, -1.621173, 0, 0.2666667, 1, 1,
0.3625143, -0.9938684, 1.496704, 0, 0.2627451, 1, 1,
0.3626464, 0.4124649, 0.6395311, 0, 0.254902, 1, 1,
0.3739468, -0.752745, 3.074783, 0, 0.2509804, 1, 1,
0.3748116, 0.4997098, 0.9360311, 0, 0.2431373, 1, 1,
0.3776937, -1.304591, 2.608188, 0, 0.2392157, 1, 1,
0.3799452, 2.044491, -0.3887816, 0, 0.2313726, 1, 1,
0.383033, -1.542892, 2.369399, 0, 0.227451, 1, 1,
0.3834468, 0.7413466, 0.640074, 0, 0.2196078, 1, 1,
0.3912258, 1.349938, 0.5765477, 0, 0.2156863, 1, 1,
0.3938067, 1.546878, 2.195225, 0, 0.2078431, 1, 1,
0.398362, -0.7939903, 2.23242, 0, 0.2039216, 1, 1,
0.402403, -0.008515675, 0.7324576, 0, 0.1960784, 1, 1,
0.408697, -0.5949747, 3.852277, 0, 0.1882353, 1, 1,
0.4129398, 0.4779541, 0.6108252, 0, 0.1843137, 1, 1,
0.4200064, -0.2742676, 2.957416, 0, 0.1764706, 1, 1,
0.4251273, 0.8458306, 0.9746572, 0, 0.172549, 1, 1,
0.4254555, -0.07447791, 0.1904108, 0, 0.1647059, 1, 1,
0.4274608, -0.641156, 3.811532, 0, 0.1607843, 1, 1,
0.4332037, 1.51844, 1.183619, 0, 0.1529412, 1, 1,
0.437457, 2.248694, -0.1012894, 0, 0.1490196, 1, 1,
0.437951, 0.2009496, 0.881448, 0, 0.1411765, 1, 1,
0.4381306, -1.692772, 2.31386, 0, 0.1372549, 1, 1,
0.438513, -1.153186, 1.818658, 0, 0.1294118, 1, 1,
0.4397428, 0.1221743, 1.091005, 0, 0.1254902, 1, 1,
0.4607122, -0.8272386, 2.281709, 0, 0.1176471, 1, 1,
0.4628061, 0.2598622, 2.319667, 0, 0.1137255, 1, 1,
0.4631394, -0.1733187, 2.842153, 0, 0.1058824, 1, 1,
0.4640478, 0.4594541, 0.1841136, 0, 0.09803922, 1, 1,
0.4677877, 0.07605159, 1.102585, 0, 0.09411765, 1, 1,
0.4716014, 0.4088011, -0.4580176, 0, 0.08627451, 1, 1,
0.4796626, -1.335103, 4.023668, 0, 0.08235294, 1, 1,
0.4853955, -0.1229709, 0.1709621, 0, 0.07450981, 1, 1,
0.4875745, -0.811678, 0.6514372, 0, 0.07058824, 1, 1,
0.4887596, -0.2974799, 2.762275, 0, 0.0627451, 1, 1,
0.4893533, 0.6525073, -0.5170942, 0, 0.05882353, 1, 1,
0.4941561, -0.2574754, 0.7546291, 0, 0.05098039, 1, 1,
0.4968507, 0.07359503, 0.3592896, 0, 0.04705882, 1, 1,
0.4972292, 0.2013041, 1.763201, 0, 0.03921569, 1, 1,
0.501603, 0.3981121, 0.130854, 0, 0.03529412, 1, 1,
0.5018727, 0.3423312, 1.31719, 0, 0.02745098, 1, 1,
0.5036409, 0.8200084, -0.6444212, 0, 0.02352941, 1, 1,
0.505786, 1.07795, 1.328004, 0, 0.01568628, 1, 1,
0.5079654, 0.6568827, 1.189815, 0, 0.01176471, 1, 1,
0.5121078, 1.166834, 1.595682, 0, 0.003921569, 1, 1,
0.5172605, -0.4409818, 2.824854, 0.003921569, 0, 1, 1,
0.5188774, -0.2773145, 1.074429, 0.007843138, 0, 1, 1,
0.5209544, -0.595001, 1.407431, 0.01568628, 0, 1, 1,
0.5231485, -0.7522152, 3.598901, 0.01960784, 0, 1, 1,
0.5233222, 1.128796, 2.054652, 0.02745098, 0, 1, 1,
0.5240308, -0.7470005, 2.69119, 0.03137255, 0, 1, 1,
0.5251464, -0.6638287, 2.8804, 0.03921569, 0, 1, 1,
0.525866, -0.2459203, 1.48793, 0.04313726, 0, 1, 1,
0.5296325, 0.2359342, 1.120483, 0.05098039, 0, 1, 1,
0.5326065, -0.08924735, 1.672852, 0.05490196, 0, 1, 1,
0.534982, 0.4297853, 0.5315567, 0.0627451, 0, 1, 1,
0.53536, -0.7038442, 3.105407, 0.06666667, 0, 1, 1,
0.5358762, -0.7849039, 2.946733, 0.07450981, 0, 1, 1,
0.5447785, 0.03800518, 1.42412, 0.07843138, 0, 1, 1,
0.550532, -1.68105, 3.566305, 0.08627451, 0, 1, 1,
0.5517334, 0.713763, 2.258435, 0.09019608, 0, 1, 1,
0.5522384, -0.7058797, 2.151791, 0.09803922, 0, 1, 1,
0.5562018, 0.1785919, 1.90907, 0.1058824, 0, 1, 1,
0.5562099, -0.3891252, 2.232143, 0.1098039, 0, 1, 1,
0.5583723, 0.7970415, 0.5084649, 0.1176471, 0, 1, 1,
0.5592846, 1.072556, 1.47032, 0.1215686, 0, 1, 1,
0.5609679, -0.8339832, 1.966419, 0.1294118, 0, 1, 1,
0.564818, -0.647156, 3.310774, 0.1333333, 0, 1, 1,
0.5683343, -0.4054354, 3.665621, 0.1411765, 0, 1, 1,
0.5700464, -0.6001899, 1.917064, 0.145098, 0, 1, 1,
0.5713521, 0.7140282, 0.1221726, 0.1529412, 0, 1, 1,
0.5727534, 0.316652, 0.8532431, 0.1568628, 0, 1, 1,
0.5758405, 0.5382559, 0.08431584, 0.1647059, 0, 1, 1,
0.577311, 0.2974077, 2.29226, 0.1686275, 0, 1, 1,
0.5774747, -0.02933623, 3.575142, 0.1764706, 0, 1, 1,
0.5787826, -0.02940422, 3.072184, 0.1803922, 0, 1, 1,
0.581686, -1.297622, 3.187734, 0.1882353, 0, 1, 1,
0.5820305, -0.001642849, 1.29766, 0.1921569, 0, 1, 1,
0.5841873, 0.8767912, 1.269799, 0.2, 0, 1, 1,
0.587566, 0.3953158, 0.006075293, 0.2078431, 0, 1, 1,
0.588762, -1.353728, 2.591035, 0.2117647, 0, 1, 1,
0.5892669, -1.944381, 2.284497, 0.2196078, 0, 1, 1,
0.5930192, -0.5924357, 3.495052, 0.2235294, 0, 1, 1,
0.5974981, -0.2218424, 2.766487, 0.2313726, 0, 1, 1,
0.5986504, 0.697739, -0.06701342, 0.2352941, 0, 1, 1,
0.6006473, -2.235765, 2.089622, 0.2431373, 0, 1, 1,
0.6034052, -1.778895, 2.374932, 0.2470588, 0, 1, 1,
0.6040015, 0.9830783, -1.273429, 0.254902, 0, 1, 1,
0.6063463, 0.2058027, 1.732973, 0.2588235, 0, 1, 1,
0.611778, -0.559292, 2.271509, 0.2666667, 0, 1, 1,
0.6134546, -0.3229814, 3.125295, 0.2705882, 0, 1, 1,
0.6138868, 0.9822223, 1.020172, 0.2784314, 0, 1, 1,
0.6149037, -0.6854293, 4.89743, 0.282353, 0, 1, 1,
0.6166999, -1.9551, 2.534641, 0.2901961, 0, 1, 1,
0.6183305, -0.7525814, 2.141929, 0.2941177, 0, 1, 1,
0.6190162, 0.8832281, 2.042556, 0.3019608, 0, 1, 1,
0.6196678, 0.05359243, 1.469483, 0.3098039, 0, 1, 1,
0.6211058, 0.4646076, 2.614901, 0.3137255, 0, 1, 1,
0.6241359, -0.3762976, 3.088436, 0.3215686, 0, 1, 1,
0.6288027, -0.5050925, 2.030039, 0.3254902, 0, 1, 1,
0.6288589, 0.131756, 1.470438, 0.3333333, 0, 1, 1,
0.6296743, -1.16828, 2.894089, 0.3372549, 0, 1, 1,
0.6302292, 0.8959636, 0.833904, 0.345098, 0, 1, 1,
0.6376475, -1.436246, 3.185824, 0.3490196, 0, 1, 1,
0.6399097, 0.0382112, 2.404866, 0.3568628, 0, 1, 1,
0.6401169, -0.8204233, 2.381371, 0.3607843, 0, 1, 1,
0.6419999, 0.1620487, 1.662261, 0.3686275, 0, 1, 1,
0.6434174, -1.385849, 2.391891, 0.372549, 0, 1, 1,
0.6439981, 0.5295817, 1.855668, 0.3803922, 0, 1, 1,
0.6533172, -1.968701, 3.955332, 0.3843137, 0, 1, 1,
0.6575179, 0.4557259, 0.8528205, 0.3921569, 0, 1, 1,
0.663644, -0.1109687, 0.5129167, 0.3960784, 0, 1, 1,
0.6653681, -0.7693095, 1.605079, 0.4039216, 0, 1, 1,
0.6680736, 0.4416458, 0.8163517, 0.4117647, 0, 1, 1,
0.6695666, -0.5523312, 2.641784, 0.4156863, 0, 1, 1,
0.6703817, -1.334829, 1.494978, 0.4235294, 0, 1, 1,
0.6771243, -0.4465053, 0.4887854, 0.427451, 0, 1, 1,
0.6784966, 1.690633, -0.3816039, 0.4352941, 0, 1, 1,
0.6805912, 1.287229, 0.3559455, 0.4392157, 0, 1, 1,
0.6825437, 0.1465819, 1.057486, 0.4470588, 0, 1, 1,
0.6831471, -0.8857496, 2.796729, 0.4509804, 0, 1, 1,
0.6900833, 1.09178, 0.3313671, 0.4588235, 0, 1, 1,
0.6909369, 1.881338, -1.783214, 0.4627451, 0, 1, 1,
0.6914815, -0.4590413, 1.658803, 0.4705882, 0, 1, 1,
0.692843, 1.350814, 0.4248861, 0.4745098, 0, 1, 1,
0.6968156, 0.3382997, 1.744594, 0.4823529, 0, 1, 1,
0.6995326, -0.3848659, 1.181722, 0.4862745, 0, 1, 1,
0.7028752, -0.9327599, 3.598618, 0.4941176, 0, 1, 1,
0.709437, 0.4962512, 2.028447, 0.5019608, 0, 1, 1,
0.7097294, -0.6092794, 2.617289, 0.5058824, 0, 1, 1,
0.7148553, -0.4718139, 2.75759, 0.5137255, 0, 1, 1,
0.7176603, 0.4253516, 0.672296, 0.5176471, 0, 1, 1,
0.7181965, -0.6915395, 3.191824, 0.5254902, 0, 1, 1,
0.7230709, 0.03724043, 0.4102667, 0.5294118, 0, 1, 1,
0.7236639, -0.8793295, 4.131659, 0.5372549, 0, 1, 1,
0.7299091, -0.03715353, 0.1630799, 0.5411765, 0, 1, 1,
0.730593, -1.058923, 1.326759, 0.5490196, 0, 1, 1,
0.7307185, 0.4762879, 0.4349677, 0.5529412, 0, 1, 1,
0.7318665, 0.5454381, -0.9821769, 0.5607843, 0, 1, 1,
0.7323062, -1.614024, 1.864524, 0.5647059, 0, 1, 1,
0.7370608, 0.3656449, 0.6076815, 0.572549, 0, 1, 1,
0.7381175, 1.074145, -1.145324, 0.5764706, 0, 1, 1,
0.7455868, -0.1268698, 1.151497, 0.5843138, 0, 1, 1,
0.7461863, 0.3903447, 1.510776, 0.5882353, 0, 1, 1,
0.747088, 0.7399899, 0.579508, 0.5960785, 0, 1, 1,
0.7476423, -0.3273346, 0.1754884, 0.6039216, 0, 1, 1,
0.7519318, 0.2912451, -0.008358263, 0.6078432, 0, 1, 1,
0.754594, 1.447496, -0.4571805, 0.6156863, 0, 1, 1,
0.760487, 1.280615, 1.490506, 0.6196079, 0, 1, 1,
0.7605315, -0.3190159, 0.5774599, 0.627451, 0, 1, 1,
0.7664071, -0.02363021, 1.911455, 0.6313726, 0, 1, 1,
0.7747646, -0.4557097, 3.041316, 0.6392157, 0, 1, 1,
0.7771544, 1.15709, 1.254593, 0.6431373, 0, 1, 1,
0.7780066, 1.363175, -0.8151909, 0.6509804, 0, 1, 1,
0.786761, -0.1315421, 2.030625, 0.654902, 0, 1, 1,
0.7895724, -0.2128865, -0.348875, 0.6627451, 0, 1, 1,
0.7929914, -0.7905356, 2.003778, 0.6666667, 0, 1, 1,
0.7959955, 0.4610259, 2.722018, 0.6745098, 0, 1, 1,
0.7970408, -0.07389931, 0.3997342, 0.6784314, 0, 1, 1,
0.798524, -0.3940316, 1.599733, 0.6862745, 0, 1, 1,
0.8003084, -0.2572098, 3.840567, 0.6901961, 0, 1, 1,
0.80036, -0.7618611, 3.684964, 0.6980392, 0, 1, 1,
0.8034882, -0.08442134, 2.118435, 0.7058824, 0, 1, 1,
0.8079463, 1.228334, 1.897415, 0.7098039, 0, 1, 1,
0.811362, 0.07244413, 1.449046, 0.7176471, 0, 1, 1,
0.8192397, 0.02176632, -0.00277246, 0.7215686, 0, 1, 1,
0.8199354, 1.52846, -0.241576, 0.7294118, 0, 1, 1,
0.8279735, 0.424843, 0.7053191, 0.7333333, 0, 1, 1,
0.8286617, 0.9196369, 2.335529, 0.7411765, 0, 1, 1,
0.8292211, 1.245941, 0.6772072, 0.7450981, 0, 1, 1,
0.8328565, -0.9630738, 2.739849, 0.7529412, 0, 1, 1,
0.8341418, -0.6751904, 0.7161489, 0.7568628, 0, 1, 1,
0.8418863, 0.5558559, 1.070809, 0.7647059, 0, 1, 1,
0.8467387, 1.507131, -1.411712, 0.7686275, 0, 1, 1,
0.8472623, -1.251416, 3.002367, 0.7764706, 0, 1, 1,
0.8474771, -0.1789549, 2.561436, 0.7803922, 0, 1, 1,
0.8553773, 0.5779885, -1.675002, 0.7882353, 0, 1, 1,
0.8608381, 0.6247275, -1.135172, 0.7921569, 0, 1, 1,
0.868917, 0.3331684, 1.921667, 0.8, 0, 1, 1,
0.869006, 0.4617417, -0.01776932, 0.8078431, 0, 1, 1,
0.8757044, -0.9471812, 2.298307, 0.8117647, 0, 1, 1,
0.8809233, -2.006633, 2.829828, 0.8196079, 0, 1, 1,
0.8890792, -1.847101, 1.814481, 0.8235294, 0, 1, 1,
0.8938808, -0.8855445, 2.725998, 0.8313726, 0, 1, 1,
0.8974307, 0.3983553, 0.2612292, 0.8352941, 0, 1, 1,
0.9006053, 1.547114, -0.4177513, 0.8431373, 0, 1, 1,
0.9045063, 0.3096372, 1.181829, 0.8470588, 0, 1, 1,
0.9197873, -1.150456, 3.164197, 0.854902, 0, 1, 1,
0.9214078, 1.177469, 3.74963, 0.8588235, 0, 1, 1,
0.9219602, -0.6078256, 2.427605, 0.8666667, 0, 1, 1,
0.9243634, 1.01202, -0.2091436, 0.8705882, 0, 1, 1,
0.9243993, 0.7077801, 0.69737, 0.8784314, 0, 1, 1,
0.924472, 1.331426, -0.7421976, 0.8823529, 0, 1, 1,
0.9412941, -0.3651885, 3.70762, 0.8901961, 0, 1, 1,
0.9460962, 1.883853, 1.082514, 0.8941177, 0, 1, 1,
0.9481962, -0.9680856, 3.854528, 0.9019608, 0, 1, 1,
0.9542314, 0.8657541, 1.31125, 0.9098039, 0, 1, 1,
0.9546937, -1.090443, 3.641891, 0.9137255, 0, 1, 1,
0.9563258, 0.3660241, 1.509113, 0.9215686, 0, 1, 1,
0.9674928, -0.2462852, 2.275847, 0.9254902, 0, 1, 1,
0.96803, -0.07946593, 0.607752, 0.9333333, 0, 1, 1,
0.9695879, 0.7856887, 0.365535, 0.9372549, 0, 1, 1,
0.9740475, -0.3540689, 2.239767, 0.945098, 0, 1, 1,
0.9764837, -0.5994053, 3.539065, 0.9490196, 0, 1, 1,
0.9871059, -0.700909, 2.551151, 0.9568627, 0, 1, 1,
0.9915023, 0.4903031, 2.110861, 0.9607843, 0, 1, 1,
0.9940634, 2.009963, -1.128077, 0.9686275, 0, 1, 1,
0.9987062, -0.4008494, 2.292899, 0.972549, 0, 1, 1,
1.001929, -1.44442, 2.013829, 0.9803922, 0, 1, 1,
1.003215, 0.05033382, 1.301651, 0.9843137, 0, 1, 1,
1.005288, 0.6216451, 2.644036, 0.9921569, 0, 1, 1,
1.005609, 1.212878, 0.6149558, 0.9960784, 0, 1, 1,
1.005685, -1.139814, 1.61948, 1, 0, 0.9960784, 1,
1.009734, 0.4369513, 2.260947, 1, 0, 0.9882353, 1,
1.012153, -2.304785, 2.151656, 1, 0, 0.9843137, 1,
1.019935, -0.1525472, 0.8345779, 1, 0, 0.9764706, 1,
1.020122, -1.525599, 2.631207, 1, 0, 0.972549, 1,
1.021917, -0.2905923, 0.651808, 1, 0, 0.9647059, 1,
1.022112, -1.068344, 2.940158, 1, 0, 0.9607843, 1,
1.023332, 0.2530431, 2.213574, 1, 0, 0.9529412, 1,
1.032931, -0.06412515, 1.850364, 1, 0, 0.9490196, 1,
1.036628, 0.5123124, 0.4229999, 1, 0, 0.9411765, 1,
1.038921, 1.057002, -0.9737004, 1, 0, 0.9372549, 1,
1.039194, -0.1862432, 1.892827, 1, 0, 0.9294118, 1,
1.040606, -1.450749, 1.905266, 1, 0, 0.9254902, 1,
1.042939, 1.650038, -1.129751, 1, 0, 0.9176471, 1,
1.046126, 0.5276505, 1.651759, 1, 0, 0.9137255, 1,
1.052344, 0.07437426, 2.619141, 1, 0, 0.9058824, 1,
1.053035, -0.6180902, 3.218556, 1, 0, 0.9019608, 1,
1.05782, 0.06943771, 3.776108, 1, 0, 0.8941177, 1,
1.060788, -0.6829432, 1.68247, 1, 0, 0.8862745, 1,
1.072865, -0.6409782, 1.112305, 1, 0, 0.8823529, 1,
1.074973, -0.09860436, 0.5608432, 1, 0, 0.8745098, 1,
1.075966, -0.5201002, 4.839867, 1, 0, 0.8705882, 1,
1.076428, -0.5863069, 1.398712, 1, 0, 0.8627451, 1,
1.083255, -0.6629182, 0.7067636, 1, 0, 0.8588235, 1,
1.089509, 0.4138308, 1.274376, 1, 0, 0.8509804, 1,
1.09098, 1.173327, 1.719564, 1, 0, 0.8470588, 1,
1.092938, 0.02962022, 2.222617, 1, 0, 0.8392157, 1,
1.115036, 1.42542, 1.321654, 1, 0, 0.8352941, 1,
1.116269, 0.3277068, 1.86602, 1, 0, 0.827451, 1,
1.116656, -1.044787, 1.976222, 1, 0, 0.8235294, 1,
1.116929, -0.4361791, 0.2526917, 1, 0, 0.8156863, 1,
1.11753, 0.06615386, 2.311218, 1, 0, 0.8117647, 1,
1.118022, 0.8321927, 1.302406, 1, 0, 0.8039216, 1,
1.119226, 1.01567, 0.8185462, 1, 0, 0.7960784, 1,
1.120409, 0.6293062, 1.694034, 1, 0, 0.7921569, 1,
1.121091, 2.351804, 2.055271, 1, 0, 0.7843137, 1,
1.122498, -0.7577885, 2.890336, 1, 0, 0.7803922, 1,
1.125778, 0.1177948, 0.8380116, 1, 0, 0.772549, 1,
1.134762, 0.7408854, -0.9515938, 1, 0, 0.7686275, 1,
1.134997, 0.7301973, 0.4968882, 1, 0, 0.7607843, 1,
1.144964, -0.0602791, 0.3229913, 1, 0, 0.7568628, 1,
1.158049, -1.046437, 1.291337, 1, 0, 0.7490196, 1,
1.159655, 0.1407388, 1.690081, 1, 0, 0.7450981, 1,
1.163335, 1.608124, 1.245911, 1, 0, 0.7372549, 1,
1.167857, -0.2120462, 1.97017, 1, 0, 0.7333333, 1,
1.171957, 0.6793895, 1.037075, 1, 0, 0.7254902, 1,
1.183365, -1.607262, 1.1761, 1, 0, 0.7215686, 1,
1.188872, -0.8757463, 1.087108, 1, 0, 0.7137255, 1,
1.189068, -0.1487403, 1.139482, 1, 0, 0.7098039, 1,
1.202089, -0.05539222, 2.281708, 1, 0, 0.7019608, 1,
1.231219, 0.4954709, 0.6941417, 1, 0, 0.6941177, 1,
1.233124, -0.4005711, 2.5303, 1, 0, 0.6901961, 1,
1.241695, 0.7531475, 1.781661, 1, 0, 0.682353, 1,
1.245954, -0.008359686, 2.754737, 1, 0, 0.6784314, 1,
1.249159, 0.7955811, 2.487858, 1, 0, 0.6705883, 1,
1.249974, -0.5381081, 2.413521, 1, 0, 0.6666667, 1,
1.251487, 0.879302, 1.037448, 1, 0, 0.6588235, 1,
1.252687, 0.8699603, 0.2586686, 1, 0, 0.654902, 1,
1.259741, -0.8044204, 1.967774, 1, 0, 0.6470588, 1,
1.262937, 0.03509028, 0.9488032, 1, 0, 0.6431373, 1,
1.267246, 0.4753458, 0.1554205, 1, 0, 0.6352941, 1,
1.267891, -2.273314, 3.8692, 1, 0, 0.6313726, 1,
1.268782, -1.391575, 1.218126, 1, 0, 0.6235294, 1,
1.276468, 2.302781, 1.940427, 1, 0, 0.6196079, 1,
1.27696, 0.7508633, 0.3857448, 1, 0, 0.6117647, 1,
1.27978, 1.9654, -0.03182148, 1, 0, 0.6078432, 1,
1.281454, -1.814512, 2.21364, 1, 0, 0.6, 1,
1.28872, -0.813053, 3.260145, 1, 0, 0.5921569, 1,
1.293315, -0.8077815, 3.218836, 1, 0, 0.5882353, 1,
1.296272, 2.021945, 0.6467363, 1, 0, 0.5803922, 1,
1.296376, 0.9684561, 0.3081798, 1, 0, 0.5764706, 1,
1.302702, 2.202729, 0.7481858, 1, 0, 0.5686275, 1,
1.302755, 0.6307975, 0.8010459, 1, 0, 0.5647059, 1,
1.309946, -0.4072092, 0.662076, 1, 0, 0.5568628, 1,
1.314941, 0.8416269, -0.2294876, 1, 0, 0.5529412, 1,
1.321691, -0.6297393, 2.0232, 1, 0, 0.5450981, 1,
1.324773, 0.6155232, 3.014908, 1, 0, 0.5411765, 1,
1.332297, -0.4979019, 0.1642901, 1, 0, 0.5333334, 1,
1.332946, 1.720335, 1.646828, 1, 0, 0.5294118, 1,
1.334774, -0.5582107, 2.179183, 1, 0, 0.5215687, 1,
1.335796, 0.9452201, 0.8758099, 1, 0, 0.5176471, 1,
1.339647, -0.5384834, 0.5731224, 1, 0, 0.509804, 1,
1.341555, 1.633581, 2.283731, 1, 0, 0.5058824, 1,
1.342065, 0.1351497, 0.331577, 1, 0, 0.4980392, 1,
1.346699, 0.1605339, -0.3263737, 1, 0, 0.4901961, 1,
1.362598, 2.345783, 1.446285, 1, 0, 0.4862745, 1,
1.365054, -1.103516, 1.982373, 1, 0, 0.4784314, 1,
1.372941, -1.188064, 2.832042, 1, 0, 0.4745098, 1,
1.376171, 0.8220754, 2.110374, 1, 0, 0.4666667, 1,
1.377867, -0.7624259, 0.6887165, 1, 0, 0.4627451, 1,
1.397676, 1.049034, 2.753841, 1, 0, 0.454902, 1,
1.399466, 0.3154348, 2.235042, 1, 0, 0.4509804, 1,
1.406693, 0.01385612, 0.7303885, 1, 0, 0.4431373, 1,
1.418442, -0.7999757, 2.85198, 1, 0, 0.4392157, 1,
1.427423, -0.8589544, 4.286376, 1, 0, 0.4313726, 1,
1.433743, -0.8515406, 3.87863, 1, 0, 0.427451, 1,
1.445285, 1.318233, 0.9187825, 1, 0, 0.4196078, 1,
1.455772, -0.01129982, 0.1731169, 1, 0, 0.4156863, 1,
1.473259, -0.5000084, 2.754613, 1, 0, 0.4078431, 1,
1.474708, 0.3866936, 1.793149, 1, 0, 0.4039216, 1,
1.478578, 0.139532, 1.23198, 1, 0, 0.3960784, 1,
1.479724, 0.3559366, 2.212075, 1, 0, 0.3882353, 1,
1.480111, 0.4429541, 3.035839, 1, 0, 0.3843137, 1,
1.489572, -2.016462, 1.67018, 1, 0, 0.3764706, 1,
1.489815, 0.08182855, 1.983207, 1, 0, 0.372549, 1,
1.49312, -1.075044, 3.109107, 1, 0, 0.3647059, 1,
1.521642, -0.9026642, 2.456471, 1, 0, 0.3607843, 1,
1.522184, 0.8940401, 0.4706641, 1, 0, 0.3529412, 1,
1.531328, 0.5319073, 0.7797953, 1, 0, 0.3490196, 1,
1.5318, -1.424634, 0.9501004, 1, 0, 0.3411765, 1,
1.532868, -1.215716, 0.6882771, 1, 0, 0.3372549, 1,
1.541654, -2.169625, 3.272814, 1, 0, 0.3294118, 1,
1.548995, -2.09762, 3.112819, 1, 0, 0.3254902, 1,
1.552639, -0.8641871, 1.469839, 1, 0, 0.3176471, 1,
1.555645, 0.5759701, 1.766466, 1, 0, 0.3137255, 1,
1.557202, 0.6256462, 1.528411, 1, 0, 0.3058824, 1,
1.562383, -0.764104, 0.8384011, 1, 0, 0.2980392, 1,
1.566811, -0.4291569, 1.660687, 1, 0, 0.2941177, 1,
1.573317, 1.117619, 2.73422, 1, 0, 0.2862745, 1,
1.573484, -0.934709, 1.972904, 1, 0, 0.282353, 1,
1.587453, -0.0704367, 1.236732, 1, 0, 0.2745098, 1,
1.590171, -2.007115, 2.431869, 1, 0, 0.2705882, 1,
1.590365, 1.27129, 1.893431, 1, 0, 0.2627451, 1,
1.606725, 0.3667565, 2.16124, 1, 0, 0.2588235, 1,
1.61631, -1.167506, 1.519269, 1, 0, 0.2509804, 1,
1.616595, -1.993035, 2.349735, 1, 0, 0.2470588, 1,
1.618672, 1.648571, 1.807509, 1, 0, 0.2392157, 1,
1.622825, -1.260117, 1.93376, 1, 0, 0.2352941, 1,
1.653628, -2.216273, 0.3122166, 1, 0, 0.227451, 1,
1.673364, 0.01342392, 0.1006766, 1, 0, 0.2235294, 1,
1.719783, -1.208682, 2.257879, 1, 0, 0.2156863, 1,
1.728128, -0.2119209, 0.733162, 1, 0, 0.2117647, 1,
1.73525, 0.9506399, -0.1386177, 1, 0, 0.2039216, 1,
1.761907, -0.5184585, 1.435932, 1, 0, 0.1960784, 1,
1.770081, -0.7789838, 0.940492, 1, 0, 0.1921569, 1,
1.795875, -0.4531559, 2.431483, 1, 0, 0.1843137, 1,
1.803853, 0.6878124, 1.457334, 1, 0, 0.1803922, 1,
1.809509, 1.185547, 2.882112, 1, 0, 0.172549, 1,
1.84048, 1.145099, 1.971413, 1, 0, 0.1686275, 1,
1.910007, -0.441486, 3.074838, 1, 0, 0.1607843, 1,
1.92161, -0.3270212, 2.539355, 1, 0, 0.1568628, 1,
1.949669, -0.500513, 1.256534, 1, 0, 0.1490196, 1,
1.971042, -0.3462375, 2.629667, 1, 0, 0.145098, 1,
2.013269, -2.127104, 3.206819, 1, 0, 0.1372549, 1,
2.031306, 1.170182, 0.8568898, 1, 0, 0.1333333, 1,
2.031657, 1.296842, 0.797089, 1, 0, 0.1254902, 1,
2.052978, 0.06796318, 1.46026, 1, 0, 0.1215686, 1,
2.086558, -1.784774, 1.702072, 1, 0, 0.1137255, 1,
2.109332, 0.9789928, 1.002229, 1, 0, 0.1098039, 1,
2.122695, 0.3550055, 2.042168, 1, 0, 0.1019608, 1,
2.133632, -2.569504, 2.08305, 1, 0, 0.09411765, 1,
2.149545, -0.22561, 2.822462, 1, 0, 0.09019608, 1,
2.158391, -0.06884085, 1.542437, 1, 0, 0.08235294, 1,
2.194458, -1.461196, 1.88828, 1, 0, 0.07843138, 1,
2.222611, -1.814696, 2.253557, 1, 0, 0.07058824, 1,
2.282085, -1.376213, 1.775007, 1, 0, 0.06666667, 1,
2.299988, -2.507529, 4.040184, 1, 0, 0.05882353, 1,
2.304826, 1.582033, 0.7041079, 1, 0, 0.05490196, 1,
2.3202, -0.1108683, 2.413877, 1, 0, 0.04705882, 1,
2.377929, 0.2748387, 1.248863, 1, 0, 0.04313726, 1,
2.412635, 0.7915497, 1.915062, 1, 0, 0.03529412, 1,
2.764851, -0.4871032, 1.567738, 1, 0, 0.03137255, 1,
2.773382, -1.475372, 0.8835927, 1, 0, 0.02352941, 1,
2.874811, 0.4154928, 2.656816, 1, 0, 0.01960784, 1,
3.73162, 0.8199576, 1.990234, 1, 0, 0.01176471, 1,
3.83151, 0.3459887, 2.453111, 1, 0, 0.007843138, 1
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
0.06929183, -4.096282, -6.89746, 0, -0.5, 0.5, 0.5,
0.06929183, -4.096282, -6.89746, 1, -0.5, 0.5, 0.5,
0.06929183, -4.096282, -6.89746, 1, 1.5, 0.5, 0.5,
0.06929183, -4.096282, -6.89746, 0, 1.5, 0.5, 0.5
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
-4.968318, 0.3167458, -6.89746, 0, -0.5, 0.5, 0.5,
-4.968318, 0.3167458, -6.89746, 1, -0.5, 0.5, 0.5,
-4.968318, 0.3167458, -6.89746, 1, 1.5, 0.5, 0.5,
-4.968318, 0.3167458, -6.89746, 0, 1.5, 0.5, 0.5
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
-4.968318, -4.096282, 0.2617853, 0, -0.5, 0.5, 0.5,
-4.968318, -4.096282, 0.2617853, 1, -0.5, 0.5, 0.5,
-4.968318, -4.096282, 0.2617853, 1, 1.5, 0.5, 0.5,
-4.968318, -4.096282, 0.2617853, 0, 1.5, 0.5, 0.5
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
-2, -3.077891, -5.245326,
2, -3.077891, -5.245326,
-2, -3.077891, -5.245326,
-2, -3.247623, -5.520681,
0, -3.077891, -5.245326,
0, -3.247623, -5.520681,
2, -3.077891, -5.245326,
2, -3.247623, -5.520681
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
-2, -3.587087, -6.071393, 0, -0.5, 0.5, 0.5,
-2, -3.587087, -6.071393, 1, -0.5, 0.5, 0.5,
-2, -3.587087, -6.071393, 1, 1.5, 0.5, 0.5,
-2, -3.587087, -6.071393, 0, 1.5, 0.5, 0.5,
0, -3.587087, -6.071393, 0, -0.5, 0.5, 0.5,
0, -3.587087, -6.071393, 1, -0.5, 0.5, 0.5,
0, -3.587087, -6.071393, 1, 1.5, 0.5, 0.5,
0, -3.587087, -6.071393, 0, 1.5, 0.5, 0.5,
2, -3.587087, -6.071393, 0, -0.5, 0.5, 0.5,
2, -3.587087, -6.071393, 1, -0.5, 0.5, 0.5,
2, -3.587087, -6.071393, 1, 1.5, 0.5, 0.5,
2, -3.587087, -6.071393, 0, 1.5, 0.5, 0.5
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
-3.805793, -2, -5.245326,
-3.805793, 3, -5.245326,
-3.805793, -2, -5.245326,
-3.999547, -2, -5.520681,
-3.805793, -1, -5.245326,
-3.999547, -1, -5.520681,
-3.805793, 0, -5.245326,
-3.999547, 0, -5.520681,
-3.805793, 1, -5.245326,
-3.999547, 1, -5.520681,
-3.805793, 2, -5.245326,
-3.999547, 2, -5.520681,
-3.805793, 3, -5.245326,
-3.999547, 3, -5.520681
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
-4.387055, -2, -6.071393, 0, -0.5, 0.5, 0.5,
-4.387055, -2, -6.071393, 1, -0.5, 0.5, 0.5,
-4.387055, -2, -6.071393, 1, 1.5, 0.5, 0.5,
-4.387055, -2, -6.071393, 0, 1.5, 0.5, 0.5,
-4.387055, -1, -6.071393, 0, -0.5, 0.5, 0.5,
-4.387055, -1, -6.071393, 1, -0.5, 0.5, 0.5,
-4.387055, -1, -6.071393, 1, 1.5, 0.5, 0.5,
-4.387055, -1, -6.071393, 0, 1.5, 0.5, 0.5,
-4.387055, 0, -6.071393, 0, -0.5, 0.5, 0.5,
-4.387055, 0, -6.071393, 1, -0.5, 0.5, 0.5,
-4.387055, 0, -6.071393, 1, 1.5, 0.5, 0.5,
-4.387055, 0, -6.071393, 0, 1.5, 0.5, 0.5,
-4.387055, 1, -6.071393, 0, -0.5, 0.5, 0.5,
-4.387055, 1, -6.071393, 1, -0.5, 0.5, 0.5,
-4.387055, 1, -6.071393, 1, 1.5, 0.5, 0.5,
-4.387055, 1, -6.071393, 0, 1.5, 0.5, 0.5,
-4.387055, 2, -6.071393, 0, -0.5, 0.5, 0.5,
-4.387055, 2, -6.071393, 1, -0.5, 0.5, 0.5,
-4.387055, 2, -6.071393, 1, 1.5, 0.5, 0.5,
-4.387055, 2, -6.071393, 0, 1.5, 0.5, 0.5,
-4.387055, 3, -6.071393, 0, -0.5, 0.5, 0.5,
-4.387055, 3, -6.071393, 1, -0.5, 0.5, 0.5,
-4.387055, 3, -6.071393, 1, 1.5, 0.5, 0.5,
-4.387055, 3, -6.071393, 0, 1.5, 0.5, 0.5
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
-3.805793, -3.077891, -4,
-3.805793, -3.077891, 4,
-3.805793, -3.077891, -4,
-3.999547, -3.247623, -4,
-3.805793, -3.077891, -2,
-3.999547, -3.247623, -2,
-3.805793, -3.077891, 0,
-3.999547, -3.247623, 0,
-3.805793, -3.077891, 2,
-3.999547, -3.247623, 2,
-3.805793, -3.077891, 4,
-3.999547, -3.247623, 4
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
-4.387055, -3.587087, -4, 0, -0.5, 0.5, 0.5,
-4.387055, -3.587087, -4, 1, -0.5, 0.5, 0.5,
-4.387055, -3.587087, -4, 1, 1.5, 0.5, 0.5,
-4.387055, -3.587087, -4, 0, 1.5, 0.5, 0.5,
-4.387055, -3.587087, -2, 0, -0.5, 0.5, 0.5,
-4.387055, -3.587087, -2, 1, -0.5, 0.5, 0.5,
-4.387055, -3.587087, -2, 1, 1.5, 0.5, 0.5,
-4.387055, -3.587087, -2, 0, 1.5, 0.5, 0.5,
-4.387055, -3.587087, 0, 0, -0.5, 0.5, 0.5,
-4.387055, -3.587087, 0, 1, -0.5, 0.5, 0.5,
-4.387055, -3.587087, 0, 1, 1.5, 0.5, 0.5,
-4.387055, -3.587087, 0, 0, 1.5, 0.5, 0.5,
-4.387055, -3.587087, 2, 0, -0.5, 0.5, 0.5,
-4.387055, -3.587087, 2, 1, -0.5, 0.5, 0.5,
-4.387055, -3.587087, 2, 1, 1.5, 0.5, 0.5,
-4.387055, -3.587087, 2, 0, 1.5, 0.5, 0.5,
-4.387055, -3.587087, 4, 0, -0.5, 0.5, 0.5,
-4.387055, -3.587087, 4, 1, -0.5, 0.5, 0.5,
-4.387055, -3.587087, 4, 1, 1.5, 0.5, 0.5,
-4.387055, -3.587087, 4, 0, 1.5, 0.5, 0.5
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
-3.805793, -3.077891, -5.245326,
-3.805793, 3.711383, -5.245326,
-3.805793, -3.077891, 5.768897,
-3.805793, 3.711383, 5.768897,
-3.805793, -3.077891, -5.245326,
-3.805793, -3.077891, 5.768897,
-3.805793, 3.711383, -5.245326,
-3.805793, 3.711383, 5.768897,
-3.805793, -3.077891, -5.245326,
3.944376, -3.077891, -5.245326,
-3.805793, -3.077891, 5.768897,
3.944376, -3.077891, 5.768897,
-3.805793, 3.711383, -5.245326,
3.944376, 3.711383, -5.245326,
-3.805793, 3.711383, 5.768897,
3.944376, 3.711383, 5.768897,
3.944376, -3.077891, -5.245326,
3.944376, 3.711383, -5.245326,
3.944376, -3.077891, 5.768897,
3.944376, 3.711383, 5.768897,
3.944376, -3.077891, -5.245326,
3.944376, -3.077891, 5.768897,
3.944376, 3.711383, -5.245326,
3.944376, 3.711383, 5.768897
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
var radius = 8.053597;
var distance = 35.83136;
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
mvMatrix.translate( -0.06929183, -0.3167458, -0.2617853 );
mvMatrix.scale( 1.123551, 1.282568, 0.7905875 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.83136);
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
imiprothrin<-read.table("imiprothrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imiprothrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'imiprothrin' not found
```

```r
y<-imiprothrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'imiprothrin' not found
```

```r
z<-imiprothrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'imiprothrin' not found
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
-3.692926, 0.3891069, -2.444925, 0, 0, 1, 1, 1,
-3.136712, -1.24079, -1.766239, 1, 0, 0, 1, 1,
-2.804379, -2.807894, -2.752416, 1, 0, 0, 1, 1,
-2.797935, -0.02527532, -0.01949313, 1, 0, 0, 1, 1,
-2.785709, 2.161628, -1.6169, 1, 0, 0, 1, 1,
-2.780479, 1.036972, -0.8034483, 1, 0, 0, 1, 1,
-2.759976, 0.4798279, -0.3805742, 0, 0, 0, 1, 1,
-2.534081, -1.58766, -1.11644, 0, 0, 0, 1, 1,
-2.528261, -0.2910293, -1.338143, 0, 0, 0, 1, 1,
-2.522853, -0.4968808, -2.616058, 0, 0, 0, 1, 1,
-2.493216, 0.3330309, -2.203652, 0, 0, 0, 1, 1,
-2.481669, -0.2221659, -0.9408429, 0, 0, 0, 1, 1,
-2.449064, -0.9886644, -5.084925, 0, 0, 0, 1, 1,
-2.436509, 0.5947105, -1.295188, 1, 1, 1, 1, 1,
-2.356968, 0.6828052, -1.336128, 1, 1, 1, 1, 1,
-2.316525, -0.2964132, -1.415016, 1, 1, 1, 1, 1,
-2.241212, -0.2941084, -1.651093, 1, 1, 1, 1, 1,
-2.115022, 0.3983583, -2.186754, 1, 1, 1, 1, 1,
-2.106369, -0.8788126, -1.968282, 1, 1, 1, 1, 1,
-2.059986, -0.6839893, -1.961009, 1, 1, 1, 1, 1,
-2.042259, 1.254985, -1.782167, 1, 1, 1, 1, 1,
-2.004574, -0.2238448, -0.7774706, 1, 1, 1, 1, 1,
-1.983038, 0.678766, -0.4266769, 1, 1, 1, 1, 1,
-1.954734, 3.61251, -2.096554, 1, 1, 1, 1, 1,
-1.947087, 0.7765682, -0.1783701, 1, 1, 1, 1, 1,
-1.929293, 0.2174544, -3.460695, 1, 1, 1, 1, 1,
-1.913736, 0.2384404, -2.94089, 1, 1, 1, 1, 1,
-1.908762, 1.173706, -0.691237, 1, 1, 1, 1, 1,
-1.887402, 0.3631555, -1.402283, 0, 0, 1, 1, 1,
-1.886637, -1.144785, -0.1424855, 1, 0, 0, 1, 1,
-1.850585, 0.8447674, -1.811477, 1, 0, 0, 1, 1,
-1.840949, -1.492176, -2.745328, 1, 0, 0, 1, 1,
-1.836034, 0.1068667, -2.634017, 1, 0, 0, 1, 1,
-1.833575, -0.6860866, -0.8215551, 1, 0, 0, 1, 1,
-1.831686, 0.2706216, -1.106647, 0, 0, 0, 1, 1,
-1.82145, 0.799048, -3.258376, 0, 0, 0, 1, 1,
-1.818676, -0.7109564, -2.169363, 0, 0, 0, 1, 1,
-1.802141, 0.9510993, 0.8433241, 0, 0, 0, 1, 1,
-1.795977, 0.8722292, -1.196902, 0, 0, 0, 1, 1,
-1.791329, -0.7761735, -1.489878, 0, 0, 0, 1, 1,
-1.790753, 1.329298, -2.210594, 0, 0, 0, 1, 1,
-1.788734, 1.599708, -1.032168, 1, 1, 1, 1, 1,
-1.785238, -0.3545327, -2.134494, 1, 1, 1, 1, 1,
-1.778681, 1.02816, 0.7608312, 1, 1, 1, 1, 1,
-1.774514, 1.107384, -0.540294, 1, 1, 1, 1, 1,
-1.772912, 1.576764, 0.8808539, 1, 1, 1, 1, 1,
-1.753012, -1.577565, -2.857738, 1, 1, 1, 1, 1,
-1.752305, -0.6599782, -2.37327, 1, 1, 1, 1, 1,
-1.723399, -0.7514932, -1.164882, 1, 1, 1, 1, 1,
-1.722562, 0.8619108, -3.420897, 1, 1, 1, 1, 1,
-1.706621, 1.34454, -0.6928777, 1, 1, 1, 1, 1,
-1.69781, 1.369557, 0.4175459, 1, 1, 1, 1, 1,
-1.691092, -0.4740056, -1.848453, 1, 1, 1, 1, 1,
-1.689977, -0.3443736, -4.006914, 1, 1, 1, 1, 1,
-1.684482, 1.667198, -0.05722735, 1, 1, 1, 1, 1,
-1.674713, 0.7315725, -1.302842, 1, 1, 1, 1, 1,
-1.65942, -0.5819898, -2.791984, 0, 0, 1, 1, 1,
-1.650376, 0.637181, -0.4994581, 1, 0, 0, 1, 1,
-1.645494, -1.03641, -4.377123, 1, 0, 0, 1, 1,
-1.644884, 1.427694, -1.81573, 1, 0, 0, 1, 1,
-1.638832, 1.081769, -0.8172644, 1, 0, 0, 1, 1,
-1.635219, -0.2771575, -2.673044, 1, 0, 0, 1, 1,
-1.624711, -0.06556443, -0.2628445, 0, 0, 0, 1, 1,
-1.614153, 0.2092825, -0.6519459, 0, 0, 0, 1, 1,
-1.610778, 0.4485402, -0.438812, 0, 0, 0, 1, 1,
-1.588366, -1.489977, -3.724891, 0, 0, 0, 1, 1,
-1.583117, -1.941099, -2.808377, 0, 0, 0, 1, 1,
-1.579777, 0.604126, -1.198323, 0, 0, 0, 1, 1,
-1.567992, 1.134824, -0.8155975, 0, 0, 0, 1, 1,
-1.545166, 0.3780189, -2.290996, 1, 1, 1, 1, 1,
-1.532862, 0.7322901, -2.43778, 1, 1, 1, 1, 1,
-1.515671, -1.068262, -1.273159, 1, 1, 1, 1, 1,
-1.496721, -2.310601, -3.106545, 1, 1, 1, 1, 1,
-1.477726, -0.6157686, -2.338289, 1, 1, 1, 1, 1,
-1.475106, 1.23353, 0.5050325, 1, 1, 1, 1, 1,
-1.471541, 0.4013714, -3.092499, 1, 1, 1, 1, 1,
-1.428585, -1.824337, -2.236555, 1, 1, 1, 1, 1,
-1.421701, -0.8077053, -0.7783606, 1, 1, 1, 1, 1,
-1.41943, -0.4530391, -2.863549, 1, 1, 1, 1, 1,
-1.407068, 0.8706299, -0.9454957, 1, 1, 1, 1, 1,
-1.396357, -0.1530561, -4.176132, 1, 1, 1, 1, 1,
-1.391802, 1.342707, 1.469533, 1, 1, 1, 1, 1,
-1.389422, 1.987887, 0.3633775, 1, 1, 1, 1, 1,
-1.371751, -0.2241916, -2.552338, 1, 1, 1, 1, 1,
-1.364485, -0.9176635, -4.110572, 0, 0, 1, 1, 1,
-1.361496, -0.9246494, -3.409698, 1, 0, 0, 1, 1,
-1.352497, 0.7711957, 0.1263363, 1, 0, 0, 1, 1,
-1.347566, 1.310665, -0.6256806, 1, 0, 0, 1, 1,
-1.338591, 0.009494996, -3.096818, 1, 0, 0, 1, 1,
-1.330413, -0.2736557, -3.023082, 1, 0, 0, 1, 1,
-1.326975, 0.2426655, -0.946402, 0, 0, 0, 1, 1,
-1.311392, 0.1720393, -1.799797, 0, 0, 0, 1, 1,
-1.287034, -0.7056121, -3.081489, 0, 0, 0, 1, 1,
-1.284492, 0.2512129, -2.46449, 0, 0, 0, 1, 1,
-1.275698, 0.1683008, -2.077274, 0, 0, 0, 1, 1,
-1.267494, -1.340018, -1.616204, 0, 0, 0, 1, 1,
-1.252353, 3.038392, 0.9960856, 0, 0, 0, 1, 1,
-1.246356, -0.4498576, -2.196262, 1, 1, 1, 1, 1,
-1.244261, -0.9460808, -3.481317, 1, 1, 1, 1, 1,
-1.231777, 1.177828, -3.956445, 1, 1, 1, 1, 1,
-1.218959, 0.6119825, 0.8255722, 1, 1, 1, 1, 1,
-1.213548, 0.5406478, 0.08939371, 1, 1, 1, 1, 1,
-1.212634, 1.347714, -0.6875157, 1, 1, 1, 1, 1,
-1.210438, -0.4467906, -1.852022, 1, 1, 1, 1, 1,
-1.209508, 1.764569, -0.2571009, 1, 1, 1, 1, 1,
-1.204525, 0.03543739, -1.955958, 1, 1, 1, 1, 1,
-1.202671, -0.2126615, -0.1287279, 1, 1, 1, 1, 1,
-1.198718, -1.492598, -1.916628, 1, 1, 1, 1, 1,
-1.197215, -0.5296211, -1.693134, 1, 1, 1, 1, 1,
-1.192944, -1.310372, -0.7573112, 1, 1, 1, 1, 1,
-1.19203, 0.5677939, -1.102856, 1, 1, 1, 1, 1,
-1.191639, -0.6281353, -1.91729, 1, 1, 1, 1, 1,
-1.183163, 0.5514725, -1.637953, 0, 0, 1, 1, 1,
-1.182094, -0.4444683, -2.038294, 1, 0, 0, 1, 1,
-1.178492, -0.4967744, 0.07603125, 1, 0, 0, 1, 1,
-1.177194, -1.622836, -1.506974, 1, 0, 0, 1, 1,
-1.176982, -1.295752, -2.405113, 1, 0, 0, 1, 1,
-1.169, -0.5609164, -2.398232, 1, 0, 0, 1, 1,
-1.167093, -1.915289, -4.523451, 0, 0, 0, 1, 1,
-1.161773, 1.37072, 0.2845995, 0, 0, 0, 1, 1,
-1.15423, -0.1979369, -2.304818, 0, 0, 0, 1, 1,
-1.153831, 1.361608, 1.215077, 0, 0, 0, 1, 1,
-1.149409, -0.9419534, -2.983075, 0, 0, 0, 1, 1,
-1.139534, 0.8895851, -0.8155593, 0, 0, 0, 1, 1,
-1.138462, 0.4547987, -2.141805, 0, 0, 0, 1, 1,
-1.136873, 0.1432976, -1.176956, 1, 1, 1, 1, 1,
-1.134895, -0.5621521, -2.841712, 1, 1, 1, 1, 1,
-1.116768, 0.9779328, -0.9205341, 1, 1, 1, 1, 1,
-1.109261, 1.163385, -1.1769, 1, 1, 1, 1, 1,
-1.106674, -0.5467013, -2.186003, 1, 1, 1, 1, 1,
-1.104433, 1.005388, 0.3660443, 1, 1, 1, 1, 1,
-1.102838, 0.9837658, -0.8378372, 1, 1, 1, 1, 1,
-1.101703, -0.8410321, -2.60862, 1, 1, 1, 1, 1,
-1.089968, 0.7335295, -0.6010366, 1, 1, 1, 1, 1,
-1.088156, 1.184867, 0.2468586, 1, 1, 1, 1, 1,
-1.083536, 0.8154594, -0.8977234, 1, 1, 1, 1, 1,
-1.078951, 0.6048748, 0.8135242, 1, 1, 1, 1, 1,
-1.073269, 0.9979997, -0.6440793, 1, 1, 1, 1, 1,
-1.069176, -0.2153354, -2.573904, 1, 1, 1, 1, 1,
-1.06383, -0.08943907, -1.957509, 1, 1, 1, 1, 1,
-1.057736, 0.218139, -1.606351, 0, 0, 1, 1, 1,
-1.04637, -0.8819646, 0.005022532, 1, 0, 0, 1, 1,
-1.043619, -0.05773908, -1.34194, 1, 0, 0, 1, 1,
-1.039467, -1.081684, -0.8042162, 1, 0, 0, 1, 1,
-1.03818, -0.8628756, -2.714761, 1, 0, 0, 1, 1,
-1.037622, -1.266143, -2.358716, 1, 0, 0, 1, 1,
-1.032955, -0.5048637, -2.953557, 0, 0, 0, 1, 1,
-1.030034, 2.734519, -1.087429, 0, 0, 0, 1, 1,
-1.026806, 1.399557, 1.475404, 0, 0, 0, 1, 1,
-1.023446, 0.5696673, -0.4430337, 0, 0, 0, 1, 1,
-1.02343, -1.924492, -4.539151, 0, 0, 0, 1, 1,
-1.017051, 0.02241975, -0.4634089, 0, 0, 0, 1, 1,
-1.009293, 0.519222, 0.1979236, 0, 0, 0, 1, 1,
-1.005315, -0.5458171, -2.711649, 1, 1, 1, 1, 1,
-1.004312, -1.487366, -1.405768, 1, 1, 1, 1, 1,
-1.00335, -0.02739398, -1.920883, 1, 1, 1, 1, 1,
-0.9942876, 0.3861529, -1.703418, 1, 1, 1, 1, 1,
-0.9845434, -0.3627175, -2.748682, 1, 1, 1, 1, 1,
-0.9835503, 0.03102741, -2.473593, 1, 1, 1, 1, 1,
-0.9805526, 1.164973, 0.5716177, 1, 1, 1, 1, 1,
-0.9786608, 1.168228, 0.4156, 1, 1, 1, 1, 1,
-0.9730525, 1.170926, 0.602456, 1, 1, 1, 1, 1,
-0.9726918, -1.417067, -2.120659, 1, 1, 1, 1, 1,
-0.966029, -1.919196, -1.321191, 1, 1, 1, 1, 1,
-0.9639955, -1.527907, -1.918218, 1, 1, 1, 1, 1,
-0.9545028, -0.08117685, -1.415887, 1, 1, 1, 1, 1,
-0.9452813, 0.3276941, -1.686046, 1, 1, 1, 1, 1,
-0.9418654, 0.5289991, -0.8927188, 1, 1, 1, 1, 1,
-0.9414661, -0.9627221, -4.532573, 0, 0, 1, 1, 1,
-0.9397179, 0.005438176, -2.181162, 1, 0, 0, 1, 1,
-0.9342017, 0.2365404, -1.291469, 1, 0, 0, 1, 1,
-0.9309719, -0.5257556, -2.349322, 1, 0, 0, 1, 1,
-0.9293111, 0.8212204, -1.398934, 1, 0, 0, 1, 1,
-0.9255198, 0.863474, -2.525863, 1, 0, 0, 1, 1,
-0.9239877, 1.035317, -1.262205, 0, 0, 0, 1, 1,
-0.9236118, -0.7215496, -3.173851, 0, 0, 0, 1, 1,
-0.9224898, -0.0121119, -0.6206521, 0, 0, 0, 1, 1,
-0.9199858, 0.6426272, -3.009555, 0, 0, 0, 1, 1,
-0.9163404, -1.656871, -4.456135, 0, 0, 0, 1, 1,
-0.9144076, -0.1575975, -2.777227, 0, 0, 0, 1, 1,
-0.9141359, 0.1324766, -2.392964, 0, 0, 0, 1, 1,
-0.911405, 0.03261425, -1.393405, 1, 1, 1, 1, 1,
-0.9085844, -0.6785514, -3.258989, 1, 1, 1, 1, 1,
-0.9051396, 0.5781555, -0.2890232, 1, 1, 1, 1, 1,
-0.9031743, 0.8423567, -0.7165229, 1, 1, 1, 1, 1,
-0.897957, 0.3656887, -0.4369596, 1, 1, 1, 1, 1,
-0.8914684, 1.873643, -1.825808, 1, 1, 1, 1, 1,
-0.8867484, 1.58286, -0.5747279, 1, 1, 1, 1, 1,
-0.8863782, -0.7587935, -3.369957, 1, 1, 1, 1, 1,
-0.8737494, 2.226415, -2.106782, 1, 1, 1, 1, 1,
-0.8683775, -1.010242, -1.268179, 1, 1, 1, 1, 1,
-0.8646468, -0.7544608, -2.563003, 1, 1, 1, 1, 1,
-0.8607174, 0.1141274, -1.080962, 1, 1, 1, 1, 1,
-0.8596045, 0.4061578, -4.181284, 1, 1, 1, 1, 1,
-0.8466572, -0.9054341, -2.037005, 1, 1, 1, 1, 1,
-0.8420028, -1.100302, -3.283219, 1, 1, 1, 1, 1,
-0.8348191, 0.7222621, -1.446206, 0, 0, 1, 1, 1,
-0.8238767, -0.2650493, -0.5595972, 1, 0, 0, 1, 1,
-0.8221032, -0.1481901, -1.267162, 1, 0, 0, 1, 1,
-0.8220628, 0.2428436, -0.5723016, 1, 0, 0, 1, 1,
-0.8214684, 1.697316, -1.606068, 1, 0, 0, 1, 1,
-0.8044056, -0.7236713, -1.705942, 1, 0, 0, 1, 1,
-0.8038056, 1.409293, -0.008237967, 0, 0, 0, 1, 1,
-0.803281, -0.4566318, -1.527962, 0, 0, 0, 1, 1,
-0.7998833, -1.353506, -4.929962, 0, 0, 0, 1, 1,
-0.7957569, 1.679352, 0.103007, 0, 0, 0, 1, 1,
-0.7873667, -0.08818749, -0.1929135, 0, 0, 0, 1, 1,
-0.7854494, -0.04183153, -1.879727, 0, 0, 0, 1, 1,
-0.7842046, -1.11303, -2.545624, 0, 0, 0, 1, 1,
-0.7841799, -1.915672, -2.927955, 1, 1, 1, 1, 1,
-0.7791772, -0.8959868, -2.163567, 1, 1, 1, 1, 1,
-0.7747169, -0.783653, -1.966797, 1, 1, 1, 1, 1,
-0.7737131, 2.110811, 1.854748, 1, 1, 1, 1, 1,
-0.7728662, 0.6500583, -0.2781559, 1, 1, 1, 1, 1,
-0.7690004, 0.03684241, -0.3477822, 1, 1, 1, 1, 1,
-0.7650697, -0.8047166, -2.496474, 1, 1, 1, 1, 1,
-0.7616296, 0.1299775, -3.753618, 1, 1, 1, 1, 1,
-0.7567069, -0.9330758, -1.699174, 1, 1, 1, 1, 1,
-0.7509127, 0.5708915, 0.1950238, 1, 1, 1, 1, 1,
-0.7504098, 0.01619438, -1.279087, 1, 1, 1, 1, 1,
-0.7497311, 0.9709279, 0.1113992, 1, 1, 1, 1, 1,
-0.7470428, -0.8155113, -1.842391, 1, 1, 1, 1, 1,
-0.7421225, -1.371675, -2.453654, 1, 1, 1, 1, 1,
-0.7320979, 1.036588, -2.708756, 1, 1, 1, 1, 1,
-0.7316821, 1.449966, -0.4168884, 0, 0, 1, 1, 1,
-0.7311631, -0.3465616, -3.394739, 1, 0, 0, 1, 1,
-0.72979, -0.7933536, -2.212459, 1, 0, 0, 1, 1,
-0.7279266, 0.2023556, -1.906474, 1, 0, 0, 1, 1,
-0.7265106, 1.175761, -0.1363711, 1, 0, 0, 1, 1,
-0.719658, 0.3287594, -2.476668, 1, 0, 0, 1, 1,
-0.7192123, -0.1663494, -1.404426, 0, 0, 0, 1, 1,
-0.6895348, -0.1068112, -0.4574116, 0, 0, 0, 1, 1,
-0.6854218, 0.9299902, -0.3083863, 0, 0, 0, 1, 1,
-0.6811232, 0.9062838, -1.525954, 0, 0, 0, 1, 1,
-0.6787559, -0.589224, -1.334976, 0, 0, 0, 1, 1,
-0.675014, -1.570775, -2.750213, 0, 0, 0, 1, 1,
-0.6747357, 1.908118, -1.061353, 0, 0, 0, 1, 1,
-0.6687248, -0.4577223, -2.002155, 1, 1, 1, 1, 1,
-0.6677595, 0.01731298, -2.395358, 1, 1, 1, 1, 1,
-0.6655142, -1.28074, -3.73989, 1, 1, 1, 1, 1,
-0.6638525, -1.058084, -2.795164, 1, 1, 1, 1, 1,
-0.6634491, 0.9455088, -1.739885, 1, 1, 1, 1, 1,
-0.6597818, -0.4540761, -1.804516, 1, 1, 1, 1, 1,
-0.6541055, -0.3051222, -1.782468, 1, 1, 1, 1, 1,
-0.6473342, 0.5648504, 0.2359572, 1, 1, 1, 1, 1,
-0.6430001, -1.271545, -2.402607, 1, 1, 1, 1, 1,
-0.6415815, 0.1838953, 0.8988791, 1, 1, 1, 1, 1,
-0.6408824, 1.24847, -0.3498307, 1, 1, 1, 1, 1,
-0.6368436, -0.02028453, -1.641039, 1, 1, 1, 1, 1,
-0.6363112, -0.4569591, -2.194523, 1, 1, 1, 1, 1,
-0.6349256, 1.394882, -1.437537, 1, 1, 1, 1, 1,
-0.6292861, -1.015334, -4.196724, 1, 1, 1, 1, 1,
-0.6276218, -1.404497, -3.371286, 0, 0, 1, 1, 1,
-0.6253104, -0.3055852, -1.588602, 1, 0, 0, 1, 1,
-0.6242996, -0.8371775, -1.756147, 1, 0, 0, 1, 1,
-0.6241043, -0.2025967, -3.100078, 1, 0, 0, 1, 1,
-0.6234534, -0.3825041, -0.97089, 1, 0, 0, 1, 1,
-0.6229515, 0.0690975, -2.750096, 1, 0, 0, 1, 1,
-0.6181421, 0.5465205, -0.9767075, 0, 0, 0, 1, 1,
-0.6169339, 0.9125761, -0.01223501, 0, 0, 0, 1, 1,
-0.6148248, -0.3256027, -0.8674473, 0, 0, 0, 1, 1,
-0.6121677, 0.4325933, -2.097152, 0, 0, 0, 1, 1,
-0.6115721, -0.4696269, -3.067191, 0, 0, 0, 1, 1,
-0.6114353, 1.635674, 0.9264979, 0, 0, 0, 1, 1,
-0.6035705, -0.1776946, -1.441148, 0, 0, 0, 1, 1,
-0.6033034, 0.001055393, -0.2813462, 1, 1, 1, 1, 1,
-0.6019649, 0.1168589, -2.293558, 1, 1, 1, 1, 1,
-0.5864318, 0.3015478, 0.003774032, 1, 1, 1, 1, 1,
-0.5848559, 0.2299428, -2.336121, 1, 1, 1, 1, 1,
-0.5804281, 0.5035647, -1.971781, 1, 1, 1, 1, 1,
-0.5793524, 0.903487, -0.8575357, 1, 1, 1, 1, 1,
-0.5748628, -0.2137346, -1.316234, 1, 1, 1, 1, 1,
-0.5709925, 1.696137, -1.132071, 1, 1, 1, 1, 1,
-0.5706086, 0.574782, 0.1236966, 1, 1, 1, 1, 1,
-0.5640786, 0.6584306, -0.195954, 1, 1, 1, 1, 1,
-0.5631919, 0.7864049, 1.402086, 1, 1, 1, 1, 1,
-0.5599207, 1.938778, 2.07208, 1, 1, 1, 1, 1,
-0.5584806, 0.9607159, 1.154411, 1, 1, 1, 1, 1,
-0.5578828, -0.3706006, -0.7321216, 1, 1, 1, 1, 1,
-0.5544931, 1.595798, -1.345681, 1, 1, 1, 1, 1,
-0.5496687, 0.2855363, -2.097486, 0, 0, 1, 1, 1,
-0.5485045, 0.8367805, -1.73053, 1, 0, 0, 1, 1,
-0.5482641, -0.251968, -2.060198, 1, 0, 0, 1, 1,
-0.5372874, 1.034985, 1.62068, 1, 0, 0, 1, 1,
-0.5349003, 0.7588598, -1.487104, 1, 0, 0, 1, 1,
-0.534871, -0.156957, -0.9743432, 1, 0, 0, 1, 1,
-0.5274922, -0.2436401, -2.919147, 0, 0, 0, 1, 1,
-0.5250554, 1.050503, -2.694355, 0, 0, 0, 1, 1,
-0.5227457, 0.5456486, 1.429791, 0, 0, 0, 1, 1,
-0.5174941, 0.5451104, 0.2875539, 0, 0, 0, 1, 1,
-0.5167757, 1.355268, -0.8257564, 0, 0, 0, 1, 1,
-0.5130341, 0.1640977, -0.7402744, 0, 0, 0, 1, 1,
-0.5116212, 0.09397911, -2.21231, 0, 0, 0, 1, 1,
-0.5112081, 1.533919, 0.3475515, 1, 1, 1, 1, 1,
-0.5086896, -0.5438233, -4.312223, 1, 1, 1, 1, 1,
-0.5076307, 0.1916457, -1.218131, 1, 1, 1, 1, 1,
-0.501574, -0.3541341, -3.723658, 1, 1, 1, 1, 1,
-0.5001477, -0.2393115, -1.12679, 1, 1, 1, 1, 1,
-0.4959145, -0.1326854, -1.54568, 1, 1, 1, 1, 1,
-0.4938971, 0.7178938, -0.1020196, 1, 1, 1, 1, 1,
-0.4872818, -0.2575227, -0.8618023, 1, 1, 1, 1, 1,
-0.4858884, 0.1789335, -0.8247979, 1, 1, 1, 1, 1,
-0.4821843, 1.327941, 0.2306592, 1, 1, 1, 1, 1,
-0.4800277, 0.2683487, -1.790611, 1, 1, 1, 1, 1,
-0.4797301, 0.8632569, -1.072706, 1, 1, 1, 1, 1,
-0.4732864, -1.882703, -2.213297, 1, 1, 1, 1, 1,
-0.4719521, -0.05529779, -3.4185, 1, 1, 1, 1, 1,
-0.4695636, 1.382571, -0.8201173, 1, 1, 1, 1, 1,
-0.4671088, -0.12605, -2.416941, 0, 0, 1, 1, 1,
-0.4633459, 0.4199629, -2.056359, 1, 0, 0, 1, 1,
-0.4558519, 1.056877, -0.05698394, 1, 0, 0, 1, 1,
-0.4558029, 0.4359249, -2.117472, 1, 0, 0, 1, 1,
-0.4509341, -1.709072, -3.497093, 1, 0, 0, 1, 1,
-0.4496102, -0.3685674, -1.831061, 1, 0, 0, 1, 1,
-0.4488063, -1.494992, -2.547208, 0, 0, 0, 1, 1,
-0.4487514, 0.7461174, -0.9998904, 0, 0, 0, 1, 1,
-0.4477288, -0.3743238, -1.538844, 0, 0, 0, 1, 1,
-0.4460254, 0.7121701, -0.7703673, 0, 0, 0, 1, 1,
-0.4459344, -0.8141788, -1.904744, 0, 0, 0, 1, 1,
-0.4410269, -2.429815, -2.053906, 0, 0, 0, 1, 1,
-0.438627, 1.554273, -1.079288, 0, 0, 0, 1, 1,
-0.4364873, 2.032062, -0.4698463, 1, 1, 1, 1, 1,
-0.4240288, 0.1000449, -1.669864, 1, 1, 1, 1, 1,
-0.4118796, 0.1632273, 0.00941431, 1, 1, 1, 1, 1,
-0.4108154, 0.4114915, -1.323854, 1, 1, 1, 1, 1,
-0.4100606, 0.7923624, -0.6326892, 1, 1, 1, 1, 1,
-0.4088814, -0.8299032, -4.168255, 1, 1, 1, 1, 1,
-0.4058661, 1.521319, -0.7557721, 1, 1, 1, 1, 1,
-0.4004953, 0.2182939, 0.05073673, 1, 1, 1, 1, 1,
-0.3988731, 0.5155684, -1.299635, 1, 1, 1, 1, 1,
-0.3945656, 0.6133414, 0.1739374, 1, 1, 1, 1, 1,
-0.3944493, -0.5170875, -1.8968, 1, 1, 1, 1, 1,
-0.3935513, 0.9225255, 1.704327, 1, 1, 1, 1, 1,
-0.393135, -0.1574994, -2.51738, 1, 1, 1, 1, 1,
-0.3930099, 0.1959617, -1.803872, 1, 1, 1, 1, 1,
-0.3914951, -1.254357, -2.075555, 1, 1, 1, 1, 1,
-0.3885402, 0.1194904, 0.1257647, 0, 0, 1, 1, 1,
-0.3851141, 1.337209, 0.01790589, 1, 0, 0, 1, 1,
-0.3838303, 1.277843, 1.206991, 1, 0, 0, 1, 1,
-0.3822665, 0.3197807, -0.6802105, 1, 0, 0, 1, 1,
-0.3750338, -1.035906, -4.086955, 1, 0, 0, 1, 1,
-0.3747116, -0.1540188, -1.145198, 1, 0, 0, 1, 1,
-0.3672083, -1.518597, -2.804172, 0, 0, 0, 1, 1,
-0.3660257, -0.1482665, -3.057768, 0, 0, 0, 1, 1,
-0.3647734, 0.1476737, -0.2424192, 0, 0, 0, 1, 1,
-0.362877, 0.5266199, 0.3173607, 0, 0, 0, 1, 1,
-0.3622737, 0.4370806, 0.2373539, 0, 0, 0, 1, 1,
-0.3614839, -0.571842, -3.784226, 0, 0, 0, 1, 1,
-0.3588889, 2.608833, -1.486138, 0, 0, 0, 1, 1,
-0.3586301, 0.4717472, 0.8061644, 1, 1, 1, 1, 1,
-0.3558684, 0.1437262, -0.8302963, 1, 1, 1, 1, 1,
-0.3541329, 1.298701, -0.4901332, 1, 1, 1, 1, 1,
-0.3522862, 1.316292, -0.722616, 1, 1, 1, 1, 1,
-0.3476613, 0.6225142, -0.08301582, 1, 1, 1, 1, 1,
-0.3445784, 0.03517675, -3.231104, 1, 1, 1, 1, 1,
-0.3420833, 0.315247, -1.452496, 1, 1, 1, 1, 1,
-0.3415091, 0.3238068, 1.039484, 1, 1, 1, 1, 1,
-0.3395409, -0.2506854, -1.53423, 1, 1, 1, 1, 1,
-0.3373452, -0.8348422, -3.267612, 1, 1, 1, 1, 1,
-0.3362574, -0.9624395, -1.96252, 1, 1, 1, 1, 1,
-0.3282509, 1.144709, -1.486436, 1, 1, 1, 1, 1,
-0.3245307, 0.180852, -0.8653485, 1, 1, 1, 1, 1,
-0.3242676, -0.5474928, -1.439263, 1, 1, 1, 1, 1,
-0.3229721, -0.4276118, -2.423932, 1, 1, 1, 1, 1,
-0.3226275, 0.05296344, -2.814924, 0, 0, 1, 1, 1,
-0.3210193, -0.5703065, -2.068525, 1, 0, 0, 1, 1,
-0.320887, 0.3402812, -0.110544, 1, 0, 0, 1, 1,
-0.3200525, 0.3733152, -0.8873588, 1, 0, 0, 1, 1,
-0.3192108, -0.3374364, -1.362671, 1, 0, 0, 1, 1,
-0.3139051, 1.299815, -0.3261671, 1, 0, 0, 1, 1,
-0.3045247, 0.4192338, -2.194677, 0, 0, 0, 1, 1,
-0.3041627, -0.6280885, -1.620757, 0, 0, 0, 1, 1,
-0.3005832, -1.56466, -4.525422, 0, 0, 0, 1, 1,
-0.298411, -0.5348982, -0.1331741, 0, 0, 0, 1, 1,
-0.297517, -0.1588686, -2.81585, 0, 0, 0, 1, 1,
-0.2963508, -1.696592, -3.689908, 0, 0, 0, 1, 1,
-0.2909309, -1.464648, 0.1864034, 0, 0, 0, 1, 1,
-0.2907178, 0.6687718, -0.5421727, 1, 1, 1, 1, 1,
-0.2847582, -1.119767, -2.468261, 1, 1, 1, 1, 1,
-0.2754041, -0.4989626, -2.311442, 1, 1, 1, 1, 1,
-0.2723024, 0.5237373, 0.4199483, 1, 1, 1, 1, 1,
-0.2663313, -0.9176104, -3.851398, 1, 1, 1, 1, 1,
-0.2660982, -0.4932167, -1.583859, 1, 1, 1, 1, 1,
-0.261502, -1.289043, -2.58558, 1, 1, 1, 1, 1,
-0.2590494, -1.185832, -3.052361, 1, 1, 1, 1, 1,
-0.257264, 1.26378, 0.5425216, 1, 1, 1, 1, 1,
-0.2507065, -1.419863, -2.881095, 1, 1, 1, 1, 1,
-0.2474514, -1.602446, -1.608691, 1, 1, 1, 1, 1,
-0.243551, -0.7375675, -2.919867, 1, 1, 1, 1, 1,
-0.2347268, -1.051749, -2.899766, 1, 1, 1, 1, 1,
-0.2258154, -1.04716, -2.734838, 1, 1, 1, 1, 1,
-0.2249187, 0.2451933, -0.5771272, 1, 1, 1, 1, 1,
-0.2230738, -0.2142553, -1.367958, 0, 0, 1, 1, 1,
-0.2222882, -0.7866259, -3.683531, 1, 0, 0, 1, 1,
-0.2208423, 0.06794254, -2.653165, 1, 0, 0, 1, 1,
-0.2183245, -0.7738265, -3.200322, 1, 0, 0, 1, 1,
-0.2167648, 1.827808, 0.3155583, 1, 0, 0, 1, 1,
-0.2147015, 0.2365584, -0.5043654, 1, 0, 0, 1, 1,
-0.2141383, 0.249004, -0.2732329, 0, 0, 0, 1, 1,
-0.2109145, -0.2711733, -2.623016, 0, 0, 0, 1, 1,
-0.2101572, -0.1669925, -2.154309, 0, 0, 0, 1, 1,
-0.2099619, 0.5686876, 0.2726943, 0, 0, 0, 1, 1,
-0.202778, -1.717123, -2.776417, 0, 0, 0, 1, 1,
-0.2014219, 1.186036, -0.8976808, 0, 0, 0, 1, 1,
-0.1977184, 0.7273511, 0.03385615, 0, 0, 0, 1, 1,
-0.1976181, -1.910326, -0.3476816, 1, 1, 1, 1, 1,
-0.1972998, -0.06798489, -2.378812, 1, 1, 1, 1, 1,
-0.1907813, 0.1226157, -2.751127, 1, 1, 1, 1, 1,
-0.1899752, -1.084805, -1.085746, 1, 1, 1, 1, 1,
-0.1821734, 0.3749352, 0.8298033, 1, 1, 1, 1, 1,
-0.1772877, 0.4441204, 0.4284769, 1, 1, 1, 1, 1,
-0.1771657, -1.145947, -2.31254, 1, 1, 1, 1, 1,
-0.174764, 0.09134107, -1.766382, 1, 1, 1, 1, 1,
-0.1705576, 0.2324577, -0.3125673, 1, 1, 1, 1, 1,
-0.1691457, -0.5125846, -2.342282, 1, 1, 1, 1, 1,
-0.1668687, -0.2540549, -2.164432, 1, 1, 1, 1, 1,
-0.1656929, 1.59607, 0.1201685, 1, 1, 1, 1, 1,
-0.1633442, -1.578016, -4.124972, 1, 1, 1, 1, 1,
-0.162137, -0.3667742, -3.744297, 1, 1, 1, 1, 1,
-0.1621082, 0.1768054, -0.5874957, 1, 1, 1, 1, 1,
-0.1616028, -0.03255354, -0.3237835, 0, 0, 1, 1, 1,
-0.1599053, 0.3409364, -1.010349, 1, 0, 0, 1, 1,
-0.1584864, -0.2461934, -0.7999845, 1, 0, 0, 1, 1,
-0.157653, 0.479522, -0.5230244, 1, 0, 0, 1, 1,
-0.1574425, -0.06330219, -2.510053, 1, 0, 0, 1, 1,
-0.1566775, -0.4669442, -2.142818, 1, 0, 0, 1, 1,
-0.1558415, 0.2785535, -0.7765396, 0, 0, 0, 1, 1,
-0.1541522, -0.0146292, -2.223061, 0, 0, 0, 1, 1,
-0.1494911, -2.07463, -2.570277, 0, 0, 0, 1, 1,
-0.1479584, 0.3955171, -0.7141142, 0, 0, 0, 1, 1,
-0.147838, -1.28954, -2.673435, 0, 0, 0, 1, 1,
-0.1460145, -0.2740223, -1.252718, 0, 0, 0, 1, 1,
-0.1411391, -1.271524, -2.849511, 0, 0, 0, 1, 1,
-0.1381624, 0.1971073, 0.1659989, 1, 1, 1, 1, 1,
-0.1351308, 0.2114877, 0.3543082, 1, 1, 1, 1, 1,
-0.1342361, 0.832772, 0.4388262, 1, 1, 1, 1, 1,
-0.1294546, -0.401609, -2.013022, 1, 1, 1, 1, 1,
-0.128997, -0.477114, -3.321846, 1, 1, 1, 1, 1,
-0.1286656, -1.754928, -2.670279, 1, 1, 1, 1, 1,
-0.1251448, -1.068958, -2.69275, 1, 1, 1, 1, 1,
-0.1212597, 1.038311, -0.772509, 1, 1, 1, 1, 1,
-0.1185886, 0.08103702, -3.076561, 1, 1, 1, 1, 1,
-0.1169239, 0.2531137, 0.2487912, 1, 1, 1, 1, 1,
-0.115375, -1.30657, -1.704506, 1, 1, 1, 1, 1,
-0.1101478, 1.316799, 1.043027, 1, 1, 1, 1, 1,
-0.1043993, 0.8162469, 0.5708967, 1, 1, 1, 1, 1,
-0.1033015, 0.3525417, 0.3563603, 1, 1, 1, 1, 1,
-0.09964486, 0.3897448, 0.5476775, 1, 1, 1, 1, 1,
-0.09837691, -1.21871, -3.797163, 0, 0, 1, 1, 1,
-0.09469083, 0.0307972, -0.1660487, 1, 0, 0, 1, 1,
-0.09236068, -0.7430077, -2.927841, 1, 0, 0, 1, 1,
-0.0894438, 0.0983827, 0.3782908, 1, 0, 0, 1, 1,
-0.07318266, -0.09963591, -1.566398, 1, 0, 0, 1, 1,
-0.06798701, -0.966024, -2.254056, 1, 0, 0, 1, 1,
-0.06737051, -0.8748185, -4.122084, 0, 0, 0, 1, 1,
-0.06492104, -0.4573765, -1.501437, 0, 0, 0, 1, 1,
-0.06404123, 0.04187451, -0.2432395, 0, 0, 0, 1, 1,
-0.06358049, -0.8445141, -2.764781, 0, 0, 0, 1, 1,
-0.05986898, 0.9614885, 0.3022905, 0, 0, 0, 1, 1,
-0.05893649, -0.5568787, -4.245657, 0, 0, 0, 1, 1,
-0.05891529, -2.008877, -1.903831, 0, 0, 0, 1, 1,
-0.0566683, -1.196336, -2.991865, 1, 1, 1, 1, 1,
-0.05660536, 1.380199, 1.727216, 1, 1, 1, 1, 1,
-0.05534905, 0.9780661, 0.1714272, 1, 1, 1, 1, 1,
-0.05515801, 1.014734, 0.9951048, 1, 1, 1, 1, 1,
-0.05168643, -0.1867533, -3.50635, 1, 1, 1, 1, 1,
-0.04534124, -1.466398, -4.415637, 1, 1, 1, 1, 1,
-0.04509162, -1.485412, -1.646027, 1, 1, 1, 1, 1,
-0.03189001, 0.3900074, 1.341575, 1, 1, 1, 1, 1,
-0.03156447, 1.213489, 1.015197, 1, 1, 1, 1, 1,
-0.03151179, -0.04766867, -1.15235, 1, 1, 1, 1, 1,
-0.0290021, -0.4208662, -4.100505, 1, 1, 1, 1, 1,
-0.02225959, 0.2709424, -0.1688638, 1, 1, 1, 1, 1,
-0.01834353, -0.3200646, -3.656388, 1, 1, 1, 1, 1,
-0.0159799, 0.1882477, 0.03695453, 1, 1, 1, 1, 1,
-0.01401274, -1.278684, -1.105123, 1, 1, 1, 1, 1,
-0.01375883, -0.04378961, -4.233409, 0, 0, 1, 1, 1,
-0.013569, 0.1809428, 2.038866, 1, 0, 0, 1, 1,
-0.01101456, 0.9705755, 1.016846, 1, 0, 0, 1, 1,
-0.01090104, -0.1381243, -2.479701, 1, 0, 0, 1, 1,
-0.008514599, 0.6844732, 0.4320787, 1, 0, 0, 1, 1,
-0.007844706, 0.4621633, 0.592486, 1, 0, 0, 1, 1,
-0.006085747, -0.4050263, -3.476058, 0, 0, 0, 1, 1,
-0.003758371, -0.9987881, -4.422634, 0, 0, 0, 1, 1,
-0.003377852, -0.9208182, -2.790159, 0, 0, 0, 1, 1,
-0.002371879, -1.96194, -3.818812, 0, 0, 0, 1, 1,
-0.001851209, 0.6811819, 0.1344413, 0, 0, 0, 1, 1,
0.001011004, -0.319244, 4.663227, 0, 0, 0, 1, 1,
0.00154799, 2.790576, -1.153705, 0, 0, 0, 1, 1,
0.001711311, -1.961117, 2.999153, 1, 1, 1, 1, 1,
0.002379587, -0.8316447, 2.238776, 1, 1, 1, 1, 1,
0.003835845, -2.181676, 3.368327, 1, 1, 1, 1, 1,
0.009040105, -1.911196, 4.285651, 1, 1, 1, 1, 1,
0.01368606, -0.02612595, 3.92463, 1, 1, 1, 1, 1,
0.01514568, -1.985772, 4.410282, 1, 1, 1, 1, 1,
0.01714354, -0.2458223, 1.380699, 1, 1, 1, 1, 1,
0.01762214, -0.2972598, 2.523463, 1, 1, 1, 1, 1,
0.02005949, -1.696395, 4.002848, 1, 1, 1, 1, 1,
0.02200104, -1.128937, 1.626577, 1, 1, 1, 1, 1,
0.02878984, -1.290474, 3.275448, 1, 1, 1, 1, 1,
0.02893327, -0.5365973, 2.681105, 1, 1, 1, 1, 1,
0.03077277, 1.334214, 0.8610065, 1, 1, 1, 1, 1,
0.03517016, 0.2134922, -0.4301327, 1, 1, 1, 1, 1,
0.03537429, -0.7092332, 4.42613, 1, 1, 1, 1, 1,
0.03630173, -0.315866, 2.891847, 0, 0, 1, 1, 1,
0.03649399, -1.498429, 3.397185, 1, 0, 0, 1, 1,
0.0470513, 1.728513, -0.1670126, 1, 0, 0, 1, 1,
0.05157566, 0.5823154, -0.5957076, 1, 0, 0, 1, 1,
0.05179248, -0.8491004, 2.927221, 1, 0, 0, 1, 1,
0.05257663, 1.696435, -1.705996, 1, 0, 0, 1, 1,
0.05997499, -0.7894007, 4.961487, 0, 0, 0, 1, 1,
0.06391313, 0.3587365, 1.197037, 0, 0, 0, 1, 1,
0.06542169, -1.528102, 2.067408, 0, 0, 0, 1, 1,
0.06679807, -1.017877, 2.431956, 0, 0, 0, 1, 1,
0.06713922, 0.1217436, 0.6965479, 0, 0, 0, 1, 1,
0.06820319, -0.2872866, 2.934616, 0, 0, 0, 1, 1,
0.06839561, 0.543987, 0.1709201, 0, 0, 0, 1, 1,
0.06988042, -0.298109, 3.739336, 1, 1, 1, 1, 1,
0.07200577, 0.1797373, 2.404702, 1, 1, 1, 1, 1,
0.0738517, -0.4238558, 3.264388, 1, 1, 1, 1, 1,
0.07789248, 0.02436891, 2.760421, 1, 1, 1, 1, 1,
0.08194078, -1.849018, 4.358574, 1, 1, 1, 1, 1,
0.08368154, -0.3048579, 3.320045, 1, 1, 1, 1, 1,
0.0888771, 0.9207261, 0.05739897, 1, 1, 1, 1, 1,
0.09366094, 1.749795, -0.2734186, 1, 1, 1, 1, 1,
0.09606041, -0.6713358, 4.146261, 1, 1, 1, 1, 1,
0.09630369, 0.3625225, -1.743852, 1, 1, 1, 1, 1,
0.09680507, 1.902478, -0.4605043, 1, 1, 1, 1, 1,
0.09831888, 0.8552125, 0.091731, 1, 1, 1, 1, 1,
0.09960484, -1.169712, 3.562496, 1, 1, 1, 1, 1,
0.100493, 1.102015, 1.036205, 1, 1, 1, 1, 1,
0.1011054, 0.01171244, 0.7298728, 1, 1, 1, 1, 1,
0.1020463, -0.9538954, 2.345486, 0, 0, 1, 1, 1,
0.1063328, -0.02339138, -0.1477552, 1, 0, 0, 1, 1,
0.1068787, -0.1984134, 2.850535, 1, 0, 0, 1, 1,
0.1073574, 0.7434244, 1.173605, 1, 0, 0, 1, 1,
0.1105438, 1.086721, -0.6693321, 1, 0, 0, 1, 1,
0.1130709, -2.602071, 3.230675, 1, 0, 0, 1, 1,
0.1182132, 0.7451181, -0.4050511, 0, 0, 0, 1, 1,
0.1230029, 0.3199973, 2.520813, 0, 0, 0, 1, 1,
0.1275019, 0.7542081, 1.513498, 0, 0, 0, 1, 1,
0.1324506, -0.07252953, 0.6715567, 0, 0, 0, 1, 1,
0.1343967, -1.025582, 3.066023, 0, 0, 0, 1, 1,
0.1362409, -1.472235, 2.771039, 0, 0, 0, 1, 1,
0.1362979, 0.2153859, 2.275196, 0, 0, 0, 1, 1,
0.1437255, -1.139086, 2.725715, 1, 1, 1, 1, 1,
0.1458068, 0.1398664, 0.331028, 1, 1, 1, 1, 1,
0.147079, -1.300194, 4.779709, 1, 1, 1, 1, 1,
0.148286, -1.083126, 4.037747, 1, 1, 1, 1, 1,
0.1506435, 0.5345995, 0.6964469, 1, 1, 1, 1, 1,
0.1512737, 0.2053191, 0.6651291, 1, 1, 1, 1, 1,
0.1572108, -0.7408763, 5.382566, 1, 1, 1, 1, 1,
0.1599063, -0.8751339, 1.078733, 1, 1, 1, 1, 1,
0.1614397, -0.1285501, 2.791392, 1, 1, 1, 1, 1,
0.1617643, 0.565497, 1.565515, 1, 1, 1, 1, 1,
0.1661839, -2.979018, 3.417284, 1, 1, 1, 1, 1,
0.1662984, 0.6731164, -0.5298418, 1, 1, 1, 1, 1,
0.176303, -0.6657168, 2.624289, 1, 1, 1, 1, 1,
0.1766407, -0.6711027, 3.113864, 1, 1, 1, 1, 1,
0.1795491, -0.08273963, 3.004769, 1, 1, 1, 1, 1,
0.179656, -1.080775, 2.723262, 0, 0, 1, 1, 1,
0.1907707, 0.08337571, 0.5603241, 1, 0, 0, 1, 1,
0.1911465, 0.7598017, -0.2710008, 1, 0, 0, 1, 1,
0.1919571, -1.444036, 3.853058, 1, 0, 0, 1, 1,
0.2001274, 0.6940956, -0.8676962, 1, 0, 0, 1, 1,
0.2001659, -0.3168146, 2.516232, 1, 0, 0, 1, 1,
0.203202, 0.5496804, 0.7922238, 0, 0, 0, 1, 1,
0.2070503, 0.6339171, 0.05114115, 0, 0, 0, 1, 1,
0.2077646, -0.05953931, 2.140935, 0, 0, 0, 1, 1,
0.2082388, 1.175395, 0.1320313, 0, 0, 0, 1, 1,
0.2157048, -0.632956, 3.239324, 0, 0, 0, 1, 1,
0.2199549, -1.39635, 5.608495, 0, 0, 0, 1, 1,
0.2213832, -0.9669356, 2.055783, 0, 0, 0, 1, 1,
0.223267, 0.2359431, 1.257648, 1, 1, 1, 1, 1,
0.2277993, -0.2523515, 0.4984647, 1, 1, 1, 1, 1,
0.230356, -1.870892, 1.136301, 1, 1, 1, 1, 1,
0.2334345, -0.1264943, 2.577209, 1, 1, 1, 1, 1,
0.2359227, 0.433214, 0.8942045, 1, 1, 1, 1, 1,
0.2368405, 1.792044, 0.00634655, 1, 1, 1, 1, 1,
0.2394882, 0.1605474, 1.506164, 1, 1, 1, 1, 1,
0.241326, -0.7959297, 2.09642, 1, 1, 1, 1, 1,
0.2494018, 2.133113, -1.364125, 1, 1, 1, 1, 1,
0.250735, 0.4130896, 0.05586072, 1, 1, 1, 1, 1,
0.261915, -0.578643, 2.581388, 1, 1, 1, 1, 1,
0.2697816, -0.6577305, 2.863473, 1, 1, 1, 1, 1,
0.2729727, -0.5824043, 2.524485, 1, 1, 1, 1, 1,
0.273687, -0.9772735, 1.550684, 1, 1, 1, 1, 1,
0.2744092, 0.2932484, 1.529802, 1, 1, 1, 1, 1,
0.2745447, -0.06065443, 1.928062, 0, 0, 1, 1, 1,
0.2764652, 1.459605, -1.114905, 1, 0, 0, 1, 1,
0.2781005, 0.1043945, 1.716642, 1, 0, 0, 1, 1,
0.2792274, -1.217865, 2.379203, 1, 0, 0, 1, 1,
0.2842602, 1.648261, 0.8968274, 1, 0, 0, 1, 1,
0.2862515, -0.02853695, 2.576391, 1, 0, 0, 1, 1,
0.2904719, 0.3451155, 1.28898, 0, 0, 0, 1, 1,
0.2915571, 0.8419536, -0.494636, 0, 0, 0, 1, 1,
0.2916172, 0.9598213, -0.5610538, 0, 0, 0, 1, 1,
0.2964287, -0.5583105, 2.827777, 0, 0, 0, 1, 1,
0.2988631, -0.1276958, 1.976529, 0, 0, 0, 1, 1,
0.3021456, -0.6841927, 3.681712, 0, 0, 0, 1, 1,
0.3032277, -1.270233, 3.495744, 0, 0, 0, 1, 1,
0.3036436, -0.5451674, 2.963878, 1, 1, 1, 1, 1,
0.307961, -0.5422701, 2.277573, 1, 1, 1, 1, 1,
0.3110264, -0.237039, 2.177139, 1, 1, 1, 1, 1,
0.3134771, -0.2627838, 2.12895, 1, 1, 1, 1, 1,
0.3199719, -0.950085, 2.360863, 1, 1, 1, 1, 1,
0.3211699, -0.3161564, 2.579573, 1, 1, 1, 1, 1,
0.3245471, -0.7903661, 1.640366, 1, 1, 1, 1, 1,
0.3281592, -0.7403454, 3.224186, 1, 1, 1, 1, 1,
0.3340669, -1.126624, 2.651007, 1, 1, 1, 1, 1,
0.3349596, -0.6339185, 2.012505, 1, 1, 1, 1, 1,
0.336279, -1.578576, 3.492632, 1, 1, 1, 1, 1,
0.3362837, -0.7625809, 2.604644, 1, 1, 1, 1, 1,
0.3375553, 0.1580647, -0.1998379, 1, 1, 1, 1, 1,
0.3393833, -1.342367, 2.869069, 1, 1, 1, 1, 1,
0.344806, -2.062402, 2.453287, 1, 1, 1, 1, 1,
0.3449431, 0.080236, 1.723836, 0, 0, 1, 1, 1,
0.3451532, 0.3586413, 0.4629243, 1, 0, 0, 1, 1,
0.3459683, -2.573595, 2.098733, 1, 0, 0, 1, 1,
0.3478372, 1.044651, -0.6029793, 1, 0, 0, 1, 1,
0.3505673, -0.2419703, 2.965723, 1, 0, 0, 1, 1,
0.3518242, 0.0706166, 1.329323, 1, 0, 0, 1, 1,
0.3593659, 1.874254, -1.621173, 0, 0, 0, 1, 1,
0.3625143, -0.9938684, 1.496704, 0, 0, 0, 1, 1,
0.3626464, 0.4124649, 0.6395311, 0, 0, 0, 1, 1,
0.3739468, -0.752745, 3.074783, 0, 0, 0, 1, 1,
0.3748116, 0.4997098, 0.9360311, 0, 0, 0, 1, 1,
0.3776937, -1.304591, 2.608188, 0, 0, 0, 1, 1,
0.3799452, 2.044491, -0.3887816, 0, 0, 0, 1, 1,
0.383033, -1.542892, 2.369399, 1, 1, 1, 1, 1,
0.3834468, 0.7413466, 0.640074, 1, 1, 1, 1, 1,
0.3912258, 1.349938, 0.5765477, 1, 1, 1, 1, 1,
0.3938067, 1.546878, 2.195225, 1, 1, 1, 1, 1,
0.398362, -0.7939903, 2.23242, 1, 1, 1, 1, 1,
0.402403, -0.008515675, 0.7324576, 1, 1, 1, 1, 1,
0.408697, -0.5949747, 3.852277, 1, 1, 1, 1, 1,
0.4129398, 0.4779541, 0.6108252, 1, 1, 1, 1, 1,
0.4200064, -0.2742676, 2.957416, 1, 1, 1, 1, 1,
0.4251273, 0.8458306, 0.9746572, 1, 1, 1, 1, 1,
0.4254555, -0.07447791, 0.1904108, 1, 1, 1, 1, 1,
0.4274608, -0.641156, 3.811532, 1, 1, 1, 1, 1,
0.4332037, 1.51844, 1.183619, 1, 1, 1, 1, 1,
0.437457, 2.248694, -0.1012894, 1, 1, 1, 1, 1,
0.437951, 0.2009496, 0.881448, 1, 1, 1, 1, 1,
0.4381306, -1.692772, 2.31386, 0, 0, 1, 1, 1,
0.438513, -1.153186, 1.818658, 1, 0, 0, 1, 1,
0.4397428, 0.1221743, 1.091005, 1, 0, 0, 1, 1,
0.4607122, -0.8272386, 2.281709, 1, 0, 0, 1, 1,
0.4628061, 0.2598622, 2.319667, 1, 0, 0, 1, 1,
0.4631394, -0.1733187, 2.842153, 1, 0, 0, 1, 1,
0.4640478, 0.4594541, 0.1841136, 0, 0, 0, 1, 1,
0.4677877, 0.07605159, 1.102585, 0, 0, 0, 1, 1,
0.4716014, 0.4088011, -0.4580176, 0, 0, 0, 1, 1,
0.4796626, -1.335103, 4.023668, 0, 0, 0, 1, 1,
0.4853955, -0.1229709, 0.1709621, 0, 0, 0, 1, 1,
0.4875745, -0.811678, 0.6514372, 0, 0, 0, 1, 1,
0.4887596, -0.2974799, 2.762275, 0, 0, 0, 1, 1,
0.4893533, 0.6525073, -0.5170942, 1, 1, 1, 1, 1,
0.4941561, -0.2574754, 0.7546291, 1, 1, 1, 1, 1,
0.4968507, 0.07359503, 0.3592896, 1, 1, 1, 1, 1,
0.4972292, 0.2013041, 1.763201, 1, 1, 1, 1, 1,
0.501603, 0.3981121, 0.130854, 1, 1, 1, 1, 1,
0.5018727, 0.3423312, 1.31719, 1, 1, 1, 1, 1,
0.5036409, 0.8200084, -0.6444212, 1, 1, 1, 1, 1,
0.505786, 1.07795, 1.328004, 1, 1, 1, 1, 1,
0.5079654, 0.6568827, 1.189815, 1, 1, 1, 1, 1,
0.5121078, 1.166834, 1.595682, 1, 1, 1, 1, 1,
0.5172605, -0.4409818, 2.824854, 1, 1, 1, 1, 1,
0.5188774, -0.2773145, 1.074429, 1, 1, 1, 1, 1,
0.5209544, -0.595001, 1.407431, 1, 1, 1, 1, 1,
0.5231485, -0.7522152, 3.598901, 1, 1, 1, 1, 1,
0.5233222, 1.128796, 2.054652, 1, 1, 1, 1, 1,
0.5240308, -0.7470005, 2.69119, 0, 0, 1, 1, 1,
0.5251464, -0.6638287, 2.8804, 1, 0, 0, 1, 1,
0.525866, -0.2459203, 1.48793, 1, 0, 0, 1, 1,
0.5296325, 0.2359342, 1.120483, 1, 0, 0, 1, 1,
0.5326065, -0.08924735, 1.672852, 1, 0, 0, 1, 1,
0.534982, 0.4297853, 0.5315567, 1, 0, 0, 1, 1,
0.53536, -0.7038442, 3.105407, 0, 0, 0, 1, 1,
0.5358762, -0.7849039, 2.946733, 0, 0, 0, 1, 1,
0.5447785, 0.03800518, 1.42412, 0, 0, 0, 1, 1,
0.550532, -1.68105, 3.566305, 0, 0, 0, 1, 1,
0.5517334, 0.713763, 2.258435, 0, 0, 0, 1, 1,
0.5522384, -0.7058797, 2.151791, 0, 0, 0, 1, 1,
0.5562018, 0.1785919, 1.90907, 0, 0, 0, 1, 1,
0.5562099, -0.3891252, 2.232143, 1, 1, 1, 1, 1,
0.5583723, 0.7970415, 0.5084649, 1, 1, 1, 1, 1,
0.5592846, 1.072556, 1.47032, 1, 1, 1, 1, 1,
0.5609679, -0.8339832, 1.966419, 1, 1, 1, 1, 1,
0.564818, -0.647156, 3.310774, 1, 1, 1, 1, 1,
0.5683343, -0.4054354, 3.665621, 1, 1, 1, 1, 1,
0.5700464, -0.6001899, 1.917064, 1, 1, 1, 1, 1,
0.5713521, 0.7140282, 0.1221726, 1, 1, 1, 1, 1,
0.5727534, 0.316652, 0.8532431, 1, 1, 1, 1, 1,
0.5758405, 0.5382559, 0.08431584, 1, 1, 1, 1, 1,
0.577311, 0.2974077, 2.29226, 1, 1, 1, 1, 1,
0.5774747, -0.02933623, 3.575142, 1, 1, 1, 1, 1,
0.5787826, -0.02940422, 3.072184, 1, 1, 1, 1, 1,
0.581686, -1.297622, 3.187734, 1, 1, 1, 1, 1,
0.5820305, -0.001642849, 1.29766, 1, 1, 1, 1, 1,
0.5841873, 0.8767912, 1.269799, 0, 0, 1, 1, 1,
0.587566, 0.3953158, 0.006075293, 1, 0, 0, 1, 1,
0.588762, -1.353728, 2.591035, 1, 0, 0, 1, 1,
0.5892669, -1.944381, 2.284497, 1, 0, 0, 1, 1,
0.5930192, -0.5924357, 3.495052, 1, 0, 0, 1, 1,
0.5974981, -0.2218424, 2.766487, 1, 0, 0, 1, 1,
0.5986504, 0.697739, -0.06701342, 0, 0, 0, 1, 1,
0.6006473, -2.235765, 2.089622, 0, 0, 0, 1, 1,
0.6034052, -1.778895, 2.374932, 0, 0, 0, 1, 1,
0.6040015, 0.9830783, -1.273429, 0, 0, 0, 1, 1,
0.6063463, 0.2058027, 1.732973, 0, 0, 0, 1, 1,
0.611778, -0.559292, 2.271509, 0, 0, 0, 1, 1,
0.6134546, -0.3229814, 3.125295, 0, 0, 0, 1, 1,
0.6138868, 0.9822223, 1.020172, 1, 1, 1, 1, 1,
0.6149037, -0.6854293, 4.89743, 1, 1, 1, 1, 1,
0.6166999, -1.9551, 2.534641, 1, 1, 1, 1, 1,
0.6183305, -0.7525814, 2.141929, 1, 1, 1, 1, 1,
0.6190162, 0.8832281, 2.042556, 1, 1, 1, 1, 1,
0.6196678, 0.05359243, 1.469483, 1, 1, 1, 1, 1,
0.6211058, 0.4646076, 2.614901, 1, 1, 1, 1, 1,
0.6241359, -0.3762976, 3.088436, 1, 1, 1, 1, 1,
0.6288027, -0.5050925, 2.030039, 1, 1, 1, 1, 1,
0.6288589, 0.131756, 1.470438, 1, 1, 1, 1, 1,
0.6296743, -1.16828, 2.894089, 1, 1, 1, 1, 1,
0.6302292, 0.8959636, 0.833904, 1, 1, 1, 1, 1,
0.6376475, -1.436246, 3.185824, 1, 1, 1, 1, 1,
0.6399097, 0.0382112, 2.404866, 1, 1, 1, 1, 1,
0.6401169, -0.8204233, 2.381371, 1, 1, 1, 1, 1,
0.6419999, 0.1620487, 1.662261, 0, 0, 1, 1, 1,
0.6434174, -1.385849, 2.391891, 1, 0, 0, 1, 1,
0.6439981, 0.5295817, 1.855668, 1, 0, 0, 1, 1,
0.6533172, -1.968701, 3.955332, 1, 0, 0, 1, 1,
0.6575179, 0.4557259, 0.8528205, 1, 0, 0, 1, 1,
0.663644, -0.1109687, 0.5129167, 1, 0, 0, 1, 1,
0.6653681, -0.7693095, 1.605079, 0, 0, 0, 1, 1,
0.6680736, 0.4416458, 0.8163517, 0, 0, 0, 1, 1,
0.6695666, -0.5523312, 2.641784, 0, 0, 0, 1, 1,
0.6703817, -1.334829, 1.494978, 0, 0, 0, 1, 1,
0.6771243, -0.4465053, 0.4887854, 0, 0, 0, 1, 1,
0.6784966, 1.690633, -0.3816039, 0, 0, 0, 1, 1,
0.6805912, 1.287229, 0.3559455, 0, 0, 0, 1, 1,
0.6825437, 0.1465819, 1.057486, 1, 1, 1, 1, 1,
0.6831471, -0.8857496, 2.796729, 1, 1, 1, 1, 1,
0.6900833, 1.09178, 0.3313671, 1, 1, 1, 1, 1,
0.6909369, 1.881338, -1.783214, 1, 1, 1, 1, 1,
0.6914815, -0.4590413, 1.658803, 1, 1, 1, 1, 1,
0.692843, 1.350814, 0.4248861, 1, 1, 1, 1, 1,
0.6968156, 0.3382997, 1.744594, 1, 1, 1, 1, 1,
0.6995326, -0.3848659, 1.181722, 1, 1, 1, 1, 1,
0.7028752, -0.9327599, 3.598618, 1, 1, 1, 1, 1,
0.709437, 0.4962512, 2.028447, 1, 1, 1, 1, 1,
0.7097294, -0.6092794, 2.617289, 1, 1, 1, 1, 1,
0.7148553, -0.4718139, 2.75759, 1, 1, 1, 1, 1,
0.7176603, 0.4253516, 0.672296, 1, 1, 1, 1, 1,
0.7181965, -0.6915395, 3.191824, 1, 1, 1, 1, 1,
0.7230709, 0.03724043, 0.4102667, 1, 1, 1, 1, 1,
0.7236639, -0.8793295, 4.131659, 0, 0, 1, 1, 1,
0.7299091, -0.03715353, 0.1630799, 1, 0, 0, 1, 1,
0.730593, -1.058923, 1.326759, 1, 0, 0, 1, 1,
0.7307185, 0.4762879, 0.4349677, 1, 0, 0, 1, 1,
0.7318665, 0.5454381, -0.9821769, 1, 0, 0, 1, 1,
0.7323062, -1.614024, 1.864524, 1, 0, 0, 1, 1,
0.7370608, 0.3656449, 0.6076815, 0, 0, 0, 1, 1,
0.7381175, 1.074145, -1.145324, 0, 0, 0, 1, 1,
0.7455868, -0.1268698, 1.151497, 0, 0, 0, 1, 1,
0.7461863, 0.3903447, 1.510776, 0, 0, 0, 1, 1,
0.747088, 0.7399899, 0.579508, 0, 0, 0, 1, 1,
0.7476423, -0.3273346, 0.1754884, 0, 0, 0, 1, 1,
0.7519318, 0.2912451, -0.008358263, 0, 0, 0, 1, 1,
0.754594, 1.447496, -0.4571805, 1, 1, 1, 1, 1,
0.760487, 1.280615, 1.490506, 1, 1, 1, 1, 1,
0.7605315, -0.3190159, 0.5774599, 1, 1, 1, 1, 1,
0.7664071, -0.02363021, 1.911455, 1, 1, 1, 1, 1,
0.7747646, -0.4557097, 3.041316, 1, 1, 1, 1, 1,
0.7771544, 1.15709, 1.254593, 1, 1, 1, 1, 1,
0.7780066, 1.363175, -0.8151909, 1, 1, 1, 1, 1,
0.786761, -0.1315421, 2.030625, 1, 1, 1, 1, 1,
0.7895724, -0.2128865, -0.348875, 1, 1, 1, 1, 1,
0.7929914, -0.7905356, 2.003778, 1, 1, 1, 1, 1,
0.7959955, 0.4610259, 2.722018, 1, 1, 1, 1, 1,
0.7970408, -0.07389931, 0.3997342, 1, 1, 1, 1, 1,
0.798524, -0.3940316, 1.599733, 1, 1, 1, 1, 1,
0.8003084, -0.2572098, 3.840567, 1, 1, 1, 1, 1,
0.80036, -0.7618611, 3.684964, 1, 1, 1, 1, 1,
0.8034882, -0.08442134, 2.118435, 0, 0, 1, 1, 1,
0.8079463, 1.228334, 1.897415, 1, 0, 0, 1, 1,
0.811362, 0.07244413, 1.449046, 1, 0, 0, 1, 1,
0.8192397, 0.02176632, -0.00277246, 1, 0, 0, 1, 1,
0.8199354, 1.52846, -0.241576, 1, 0, 0, 1, 1,
0.8279735, 0.424843, 0.7053191, 1, 0, 0, 1, 1,
0.8286617, 0.9196369, 2.335529, 0, 0, 0, 1, 1,
0.8292211, 1.245941, 0.6772072, 0, 0, 0, 1, 1,
0.8328565, -0.9630738, 2.739849, 0, 0, 0, 1, 1,
0.8341418, -0.6751904, 0.7161489, 0, 0, 0, 1, 1,
0.8418863, 0.5558559, 1.070809, 0, 0, 0, 1, 1,
0.8467387, 1.507131, -1.411712, 0, 0, 0, 1, 1,
0.8472623, -1.251416, 3.002367, 0, 0, 0, 1, 1,
0.8474771, -0.1789549, 2.561436, 1, 1, 1, 1, 1,
0.8553773, 0.5779885, -1.675002, 1, 1, 1, 1, 1,
0.8608381, 0.6247275, -1.135172, 1, 1, 1, 1, 1,
0.868917, 0.3331684, 1.921667, 1, 1, 1, 1, 1,
0.869006, 0.4617417, -0.01776932, 1, 1, 1, 1, 1,
0.8757044, -0.9471812, 2.298307, 1, 1, 1, 1, 1,
0.8809233, -2.006633, 2.829828, 1, 1, 1, 1, 1,
0.8890792, -1.847101, 1.814481, 1, 1, 1, 1, 1,
0.8938808, -0.8855445, 2.725998, 1, 1, 1, 1, 1,
0.8974307, 0.3983553, 0.2612292, 1, 1, 1, 1, 1,
0.9006053, 1.547114, -0.4177513, 1, 1, 1, 1, 1,
0.9045063, 0.3096372, 1.181829, 1, 1, 1, 1, 1,
0.9197873, -1.150456, 3.164197, 1, 1, 1, 1, 1,
0.9214078, 1.177469, 3.74963, 1, 1, 1, 1, 1,
0.9219602, -0.6078256, 2.427605, 1, 1, 1, 1, 1,
0.9243634, 1.01202, -0.2091436, 0, 0, 1, 1, 1,
0.9243993, 0.7077801, 0.69737, 1, 0, 0, 1, 1,
0.924472, 1.331426, -0.7421976, 1, 0, 0, 1, 1,
0.9412941, -0.3651885, 3.70762, 1, 0, 0, 1, 1,
0.9460962, 1.883853, 1.082514, 1, 0, 0, 1, 1,
0.9481962, -0.9680856, 3.854528, 1, 0, 0, 1, 1,
0.9542314, 0.8657541, 1.31125, 0, 0, 0, 1, 1,
0.9546937, -1.090443, 3.641891, 0, 0, 0, 1, 1,
0.9563258, 0.3660241, 1.509113, 0, 0, 0, 1, 1,
0.9674928, -0.2462852, 2.275847, 0, 0, 0, 1, 1,
0.96803, -0.07946593, 0.607752, 0, 0, 0, 1, 1,
0.9695879, 0.7856887, 0.365535, 0, 0, 0, 1, 1,
0.9740475, -0.3540689, 2.239767, 0, 0, 0, 1, 1,
0.9764837, -0.5994053, 3.539065, 1, 1, 1, 1, 1,
0.9871059, -0.700909, 2.551151, 1, 1, 1, 1, 1,
0.9915023, 0.4903031, 2.110861, 1, 1, 1, 1, 1,
0.9940634, 2.009963, -1.128077, 1, 1, 1, 1, 1,
0.9987062, -0.4008494, 2.292899, 1, 1, 1, 1, 1,
1.001929, -1.44442, 2.013829, 1, 1, 1, 1, 1,
1.003215, 0.05033382, 1.301651, 1, 1, 1, 1, 1,
1.005288, 0.6216451, 2.644036, 1, 1, 1, 1, 1,
1.005609, 1.212878, 0.6149558, 1, 1, 1, 1, 1,
1.005685, -1.139814, 1.61948, 1, 1, 1, 1, 1,
1.009734, 0.4369513, 2.260947, 1, 1, 1, 1, 1,
1.012153, -2.304785, 2.151656, 1, 1, 1, 1, 1,
1.019935, -0.1525472, 0.8345779, 1, 1, 1, 1, 1,
1.020122, -1.525599, 2.631207, 1, 1, 1, 1, 1,
1.021917, -0.2905923, 0.651808, 1, 1, 1, 1, 1,
1.022112, -1.068344, 2.940158, 0, 0, 1, 1, 1,
1.023332, 0.2530431, 2.213574, 1, 0, 0, 1, 1,
1.032931, -0.06412515, 1.850364, 1, 0, 0, 1, 1,
1.036628, 0.5123124, 0.4229999, 1, 0, 0, 1, 1,
1.038921, 1.057002, -0.9737004, 1, 0, 0, 1, 1,
1.039194, -0.1862432, 1.892827, 1, 0, 0, 1, 1,
1.040606, -1.450749, 1.905266, 0, 0, 0, 1, 1,
1.042939, 1.650038, -1.129751, 0, 0, 0, 1, 1,
1.046126, 0.5276505, 1.651759, 0, 0, 0, 1, 1,
1.052344, 0.07437426, 2.619141, 0, 0, 0, 1, 1,
1.053035, -0.6180902, 3.218556, 0, 0, 0, 1, 1,
1.05782, 0.06943771, 3.776108, 0, 0, 0, 1, 1,
1.060788, -0.6829432, 1.68247, 0, 0, 0, 1, 1,
1.072865, -0.6409782, 1.112305, 1, 1, 1, 1, 1,
1.074973, -0.09860436, 0.5608432, 1, 1, 1, 1, 1,
1.075966, -0.5201002, 4.839867, 1, 1, 1, 1, 1,
1.076428, -0.5863069, 1.398712, 1, 1, 1, 1, 1,
1.083255, -0.6629182, 0.7067636, 1, 1, 1, 1, 1,
1.089509, 0.4138308, 1.274376, 1, 1, 1, 1, 1,
1.09098, 1.173327, 1.719564, 1, 1, 1, 1, 1,
1.092938, 0.02962022, 2.222617, 1, 1, 1, 1, 1,
1.115036, 1.42542, 1.321654, 1, 1, 1, 1, 1,
1.116269, 0.3277068, 1.86602, 1, 1, 1, 1, 1,
1.116656, -1.044787, 1.976222, 1, 1, 1, 1, 1,
1.116929, -0.4361791, 0.2526917, 1, 1, 1, 1, 1,
1.11753, 0.06615386, 2.311218, 1, 1, 1, 1, 1,
1.118022, 0.8321927, 1.302406, 1, 1, 1, 1, 1,
1.119226, 1.01567, 0.8185462, 1, 1, 1, 1, 1,
1.120409, 0.6293062, 1.694034, 0, 0, 1, 1, 1,
1.121091, 2.351804, 2.055271, 1, 0, 0, 1, 1,
1.122498, -0.7577885, 2.890336, 1, 0, 0, 1, 1,
1.125778, 0.1177948, 0.8380116, 1, 0, 0, 1, 1,
1.134762, 0.7408854, -0.9515938, 1, 0, 0, 1, 1,
1.134997, 0.7301973, 0.4968882, 1, 0, 0, 1, 1,
1.144964, -0.0602791, 0.3229913, 0, 0, 0, 1, 1,
1.158049, -1.046437, 1.291337, 0, 0, 0, 1, 1,
1.159655, 0.1407388, 1.690081, 0, 0, 0, 1, 1,
1.163335, 1.608124, 1.245911, 0, 0, 0, 1, 1,
1.167857, -0.2120462, 1.97017, 0, 0, 0, 1, 1,
1.171957, 0.6793895, 1.037075, 0, 0, 0, 1, 1,
1.183365, -1.607262, 1.1761, 0, 0, 0, 1, 1,
1.188872, -0.8757463, 1.087108, 1, 1, 1, 1, 1,
1.189068, -0.1487403, 1.139482, 1, 1, 1, 1, 1,
1.202089, -0.05539222, 2.281708, 1, 1, 1, 1, 1,
1.231219, 0.4954709, 0.6941417, 1, 1, 1, 1, 1,
1.233124, -0.4005711, 2.5303, 1, 1, 1, 1, 1,
1.241695, 0.7531475, 1.781661, 1, 1, 1, 1, 1,
1.245954, -0.008359686, 2.754737, 1, 1, 1, 1, 1,
1.249159, 0.7955811, 2.487858, 1, 1, 1, 1, 1,
1.249974, -0.5381081, 2.413521, 1, 1, 1, 1, 1,
1.251487, 0.879302, 1.037448, 1, 1, 1, 1, 1,
1.252687, 0.8699603, 0.2586686, 1, 1, 1, 1, 1,
1.259741, -0.8044204, 1.967774, 1, 1, 1, 1, 1,
1.262937, 0.03509028, 0.9488032, 1, 1, 1, 1, 1,
1.267246, 0.4753458, 0.1554205, 1, 1, 1, 1, 1,
1.267891, -2.273314, 3.8692, 1, 1, 1, 1, 1,
1.268782, -1.391575, 1.218126, 0, 0, 1, 1, 1,
1.276468, 2.302781, 1.940427, 1, 0, 0, 1, 1,
1.27696, 0.7508633, 0.3857448, 1, 0, 0, 1, 1,
1.27978, 1.9654, -0.03182148, 1, 0, 0, 1, 1,
1.281454, -1.814512, 2.21364, 1, 0, 0, 1, 1,
1.28872, -0.813053, 3.260145, 1, 0, 0, 1, 1,
1.293315, -0.8077815, 3.218836, 0, 0, 0, 1, 1,
1.296272, 2.021945, 0.6467363, 0, 0, 0, 1, 1,
1.296376, 0.9684561, 0.3081798, 0, 0, 0, 1, 1,
1.302702, 2.202729, 0.7481858, 0, 0, 0, 1, 1,
1.302755, 0.6307975, 0.8010459, 0, 0, 0, 1, 1,
1.309946, -0.4072092, 0.662076, 0, 0, 0, 1, 1,
1.314941, 0.8416269, -0.2294876, 0, 0, 0, 1, 1,
1.321691, -0.6297393, 2.0232, 1, 1, 1, 1, 1,
1.324773, 0.6155232, 3.014908, 1, 1, 1, 1, 1,
1.332297, -0.4979019, 0.1642901, 1, 1, 1, 1, 1,
1.332946, 1.720335, 1.646828, 1, 1, 1, 1, 1,
1.334774, -0.5582107, 2.179183, 1, 1, 1, 1, 1,
1.335796, 0.9452201, 0.8758099, 1, 1, 1, 1, 1,
1.339647, -0.5384834, 0.5731224, 1, 1, 1, 1, 1,
1.341555, 1.633581, 2.283731, 1, 1, 1, 1, 1,
1.342065, 0.1351497, 0.331577, 1, 1, 1, 1, 1,
1.346699, 0.1605339, -0.3263737, 1, 1, 1, 1, 1,
1.362598, 2.345783, 1.446285, 1, 1, 1, 1, 1,
1.365054, -1.103516, 1.982373, 1, 1, 1, 1, 1,
1.372941, -1.188064, 2.832042, 1, 1, 1, 1, 1,
1.376171, 0.8220754, 2.110374, 1, 1, 1, 1, 1,
1.377867, -0.7624259, 0.6887165, 1, 1, 1, 1, 1,
1.397676, 1.049034, 2.753841, 0, 0, 1, 1, 1,
1.399466, 0.3154348, 2.235042, 1, 0, 0, 1, 1,
1.406693, 0.01385612, 0.7303885, 1, 0, 0, 1, 1,
1.418442, -0.7999757, 2.85198, 1, 0, 0, 1, 1,
1.427423, -0.8589544, 4.286376, 1, 0, 0, 1, 1,
1.433743, -0.8515406, 3.87863, 1, 0, 0, 1, 1,
1.445285, 1.318233, 0.9187825, 0, 0, 0, 1, 1,
1.455772, -0.01129982, 0.1731169, 0, 0, 0, 1, 1,
1.473259, -0.5000084, 2.754613, 0, 0, 0, 1, 1,
1.474708, 0.3866936, 1.793149, 0, 0, 0, 1, 1,
1.478578, 0.139532, 1.23198, 0, 0, 0, 1, 1,
1.479724, 0.3559366, 2.212075, 0, 0, 0, 1, 1,
1.480111, 0.4429541, 3.035839, 0, 0, 0, 1, 1,
1.489572, -2.016462, 1.67018, 1, 1, 1, 1, 1,
1.489815, 0.08182855, 1.983207, 1, 1, 1, 1, 1,
1.49312, -1.075044, 3.109107, 1, 1, 1, 1, 1,
1.521642, -0.9026642, 2.456471, 1, 1, 1, 1, 1,
1.522184, 0.8940401, 0.4706641, 1, 1, 1, 1, 1,
1.531328, 0.5319073, 0.7797953, 1, 1, 1, 1, 1,
1.5318, -1.424634, 0.9501004, 1, 1, 1, 1, 1,
1.532868, -1.215716, 0.6882771, 1, 1, 1, 1, 1,
1.541654, -2.169625, 3.272814, 1, 1, 1, 1, 1,
1.548995, -2.09762, 3.112819, 1, 1, 1, 1, 1,
1.552639, -0.8641871, 1.469839, 1, 1, 1, 1, 1,
1.555645, 0.5759701, 1.766466, 1, 1, 1, 1, 1,
1.557202, 0.6256462, 1.528411, 1, 1, 1, 1, 1,
1.562383, -0.764104, 0.8384011, 1, 1, 1, 1, 1,
1.566811, -0.4291569, 1.660687, 1, 1, 1, 1, 1,
1.573317, 1.117619, 2.73422, 0, 0, 1, 1, 1,
1.573484, -0.934709, 1.972904, 1, 0, 0, 1, 1,
1.587453, -0.0704367, 1.236732, 1, 0, 0, 1, 1,
1.590171, -2.007115, 2.431869, 1, 0, 0, 1, 1,
1.590365, 1.27129, 1.893431, 1, 0, 0, 1, 1,
1.606725, 0.3667565, 2.16124, 1, 0, 0, 1, 1,
1.61631, -1.167506, 1.519269, 0, 0, 0, 1, 1,
1.616595, -1.993035, 2.349735, 0, 0, 0, 1, 1,
1.618672, 1.648571, 1.807509, 0, 0, 0, 1, 1,
1.622825, -1.260117, 1.93376, 0, 0, 0, 1, 1,
1.653628, -2.216273, 0.3122166, 0, 0, 0, 1, 1,
1.673364, 0.01342392, 0.1006766, 0, 0, 0, 1, 1,
1.719783, -1.208682, 2.257879, 0, 0, 0, 1, 1,
1.728128, -0.2119209, 0.733162, 1, 1, 1, 1, 1,
1.73525, 0.9506399, -0.1386177, 1, 1, 1, 1, 1,
1.761907, -0.5184585, 1.435932, 1, 1, 1, 1, 1,
1.770081, -0.7789838, 0.940492, 1, 1, 1, 1, 1,
1.795875, -0.4531559, 2.431483, 1, 1, 1, 1, 1,
1.803853, 0.6878124, 1.457334, 1, 1, 1, 1, 1,
1.809509, 1.185547, 2.882112, 1, 1, 1, 1, 1,
1.84048, 1.145099, 1.971413, 1, 1, 1, 1, 1,
1.910007, -0.441486, 3.074838, 1, 1, 1, 1, 1,
1.92161, -0.3270212, 2.539355, 1, 1, 1, 1, 1,
1.949669, -0.500513, 1.256534, 1, 1, 1, 1, 1,
1.971042, -0.3462375, 2.629667, 1, 1, 1, 1, 1,
2.013269, -2.127104, 3.206819, 1, 1, 1, 1, 1,
2.031306, 1.170182, 0.8568898, 1, 1, 1, 1, 1,
2.031657, 1.296842, 0.797089, 1, 1, 1, 1, 1,
2.052978, 0.06796318, 1.46026, 0, 0, 1, 1, 1,
2.086558, -1.784774, 1.702072, 1, 0, 0, 1, 1,
2.109332, 0.9789928, 1.002229, 1, 0, 0, 1, 1,
2.122695, 0.3550055, 2.042168, 1, 0, 0, 1, 1,
2.133632, -2.569504, 2.08305, 1, 0, 0, 1, 1,
2.149545, -0.22561, 2.822462, 1, 0, 0, 1, 1,
2.158391, -0.06884085, 1.542437, 0, 0, 0, 1, 1,
2.194458, -1.461196, 1.88828, 0, 0, 0, 1, 1,
2.222611, -1.814696, 2.253557, 0, 0, 0, 1, 1,
2.282085, -1.376213, 1.775007, 0, 0, 0, 1, 1,
2.299988, -2.507529, 4.040184, 0, 0, 0, 1, 1,
2.304826, 1.582033, 0.7041079, 0, 0, 0, 1, 1,
2.3202, -0.1108683, 2.413877, 0, 0, 0, 1, 1,
2.377929, 0.2748387, 1.248863, 1, 1, 1, 1, 1,
2.412635, 0.7915497, 1.915062, 1, 1, 1, 1, 1,
2.764851, -0.4871032, 1.567738, 1, 1, 1, 1, 1,
2.773382, -1.475372, 0.8835927, 1, 1, 1, 1, 1,
2.874811, 0.4154928, 2.656816, 1, 1, 1, 1, 1,
3.73162, 0.8199576, 1.990234, 1, 1, 1, 1, 1,
3.83151, 0.3459887, 2.453111, 1, 1, 1, 1, 1
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
var radius = 9.925209;
var distance = 34.86188;
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
mvMatrix.translate( -0.06929159, -0.3167456, -0.2617853 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.86188);
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