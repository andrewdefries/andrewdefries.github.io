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
-3.904981, 1.817676, -1.580631, 1, 0, 0, 1,
-3.174426, -0.04658743, -2.025987, 1, 0.007843138, 0, 1,
-2.779979, 0.1025871, -1.211031, 1, 0.01176471, 0, 1,
-2.695488, 0.3112074, -3.390932, 1, 0.01960784, 0, 1,
-2.588808, 1.436766, -0.9941195, 1, 0.02352941, 0, 1,
-2.571217, 0.9208523, -0.9315872, 1, 0.03137255, 0, 1,
-2.477956, 2.212169, -1.176219, 1, 0.03529412, 0, 1,
-2.451481, 0.6790059, 0.05536211, 1, 0.04313726, 0, 1,
-2.334146, -1.057392, -2.073467, 1, 0.04705882, 0, 1,
-2.171368, 0.7592626, -0.5028246, 1, 0.05490196, 0, 1,
-2.167563, 0.7637993, -2.939595, 1, 0.05882353, 0, 1,
-2.131563, -1.79121, -1.997188, 1, 0.06666667, 0, 1,
-2.121128, 1.753603, 0.8421086, 1, 0.07058824, 0, 1,
-2.100586, 1.114893, -1.481536, 1, 0.07843138, 0, 1,
-2.098494, -0.7322636, -1.88716, 1, 0.08235294, 0, 1,
-2.088954, -0.3629453, -0.1575353, 1, 0.09019608, 0, 1,
-2.088411, 1.079918, -1.349429, 1, 0.09411765, 0, 1,
-2.087531, 0.5729178, -2.055973, 1, 0.1019608, 0, 1,
-2.081559, 0.3764377, 0.03945434, 1, 0.1098039, 0, 1,
-2.076863, 3.115582, -1.831801, 1, 0.1137255, 0, 1,
-2.071339, 0.3168224, -1.481667, 1, 0.1215686, 0, 1,
-2.027194, -0.06803834, -4.325302, 1, 0.1254902, 0, 1,
-2.022115, 1.161934, -0.9486765, 1, 0.1333333, 0, 1,
-2.016705, 0.7764472, 0.1271371, 1, 0.1372549, 0, 1,
-1.987039, 0.1283171, -2.529989, 1, 0.145098, 0, 1,
-1.970563, -0.1696552, -1.359656, 1, 0.1490196, 0, 1,
-1.95978, 0.557626, -2.557514, 1, 0.1568628, 0, 1,
-1.955056, -0.4205841, -1.091898, 1, 0.1607843, 0, 1,
-1.938135, -1.384254, -2.472675, 1, 0.1686275, 0, 1,
-1.920378, 1.301673, -4.092208, 1, 0.172549, 0, 1,
-1.903828, 0.75068, -0.4765791, 1, 0.1803922, 0, 1,
-1.878051, 1.346792, -3.45603, 1, 0.1843137, 0, 1,
-1.863134, -0.9139358, -1.980735, 1, 0.1921569, 0, 1,
-1.859531, -0.6690599, -2.703437, 1, 0.1960784, 0, 1,
-1.850647, 0.79857, 0.9483153, 1, 0.2039216, 0, 1,
-1.845207, 0.1800365, -0.3631716, 1, 0.2117647, 0, 1,
-1.796902, 2.300547, 1.335224, 1, 0.2156863, 0, 1,
-1.749956, 1.534586, -0.6017048, 1, 0.2235294, 0, 1,
-1.718293, -0.5944805, -2.421103, 1, 0.227451, 0, 1,
-1.707535, 0.02879161, -0.8116085, 1, 0.2352941, 0, 1,
-1.701101, 0.6144589, -0.7286713, 1, 0.2392157, 0, 1,
-1.692738, -1.778809, -0.8667762, 1, 0.2470588, 0, 1,
-1.684914, 2.387219, -0.2691873, 1, 0.2509804, 0, 1,
-1.661391, -1.797793, -1.753682, 1, 0.2588235, 0, 1,
-1.628023, 0.6272946, -1.333968, 1, 0.2627451, 0, 1,
-1.625041, 0.1824436, -1.148509, 1, 0.2705882, 0, 1,
-1.60779, 0.4590149, -0.7461684, 1, 0.2745098, 0, 1,
-1.603792, -0.76931, -2.909874, 1, 0.282353, 0, 1,
-1.603052, -1.627698, -1.436896, 1, 0.2862745, 0, 1,
-1.594921, 0.4397628, -2.54362, 1, 0.2941177, 0, 1,
-1.590486, -0.3255034, 0.9199049, 1, 0.3019608, 0, 1,
-1.586089, -0.9477156, -3.411272, 1, 0.3058824, 0, 1,
-1.581843, 0.1849575, -1.80954, 1, 0.3137255, 0, 1,
-1.572014, -1.177772, -0.7569072, 1, 0.3176471, 0, 1,
-1.547266, -0.6499732, -1.953961, 1, 0.3254902, 0, 1,
-1.546126, 0.06956, -0.5323923, 1, 0.3294118, 0, 1,
-1.542894, -0.4619585, -2.210792, 1, 0.3372549, 0, 1,
-1.542407, -0.1334015, -1.687789, 1, 0.3411765, 0, 1,
-1.540076, 0.8378684, 0.4922166, 1, 0.3490196, 0, 1,
-1.539535, 0.2633463, -2.771433, 1, 0.3529412, 0, 1,
-1.534869, 0.7133373, -2.731823, 1, 0.3607843, 0, 1,
-1.53057, -0.09227598, 0.04188401, 1, 0.3647059, 0, 1,
-1.52852, -0.8330827, -1.856275, 1, 0.372549, 0, 1,
-1.51576, 0.7823251, -3.565499, 1, 0.3764706, 0, 1,
-1.500968, -0.846927, -1.523781, 1, 0.3843137, 0, 1,
-1.500353, 0.8410459, 0.2717435, 1, 0.3882353, 0, 1,
-1.496942, -0.2455998, -3.021301, 1, 0.3960784, 0, 1,
-1.474808, -0.6478289, -3.749279, 1, 0.4039216, 0, 1,
-1.474055, -1.459242, -1.389463, 1, 0.4078431, 0, 1,
-1.458895, 0.5698723, -0.229994, 1, 0.4156863, 0, 1,
-1.434753, 0.3559023, -2.420549, 1, 0.4196078, 0, 1,
-1.434501, 2.008147, -1.34109, 1, 0.427451, 0, 1,
-1.414751, -0.157216, -1.200388, 1, 0.4313726, 0, 1,
-1.410465, -0.5246978, -2.378697, 1, 0.4392157, 0, 1,
-1.409653, -1.993282, -1.500661, 1, 0.4431373, 0, 1,
-1.405985, -0.6506134, -2.321261, 1, 0.4509804, 0, 1,
-1.405771, 0.5647895, 0.606771, 1, 0.454902, 0, 1,
-1.399117, 0.1058843, -1.159524, 1, 0.4627451, 0, 1,
-1.397065, -0.05686547, -1.982772, 1, 0.4666667, 0, 1,
-1.395519, 2.680474, 1.157426, 1, 0.4745098, 0, 1,
-1.368693, 0.9525368, -0.8572655, 1, 0.4784314, 0, 1,
-1.36817, 0.2345307, -0.7438686, 1, 0.4862745, 0, 1,
-1.368076, -0.6211836, -1.927842, 1, 0.4901961, 0, 1,
-1.357808, 1.345012, 0.4191159, 1, 0.4980392, 0, 1,
-1.353991, 1.376463, -0.3340508, 1, 0.5058824, 0, 1,
-1.352125, 0.2417873, -1.809975, 1, 0.509804, 0, 1,
-1.350857, 0.7258943, -0.469114, 1, 0.5176471, 0, 1,
-1.346924, -1.125192, -3.132146, 1, 0.5215687, 0, 1,
-1.343049, 1.146675, -1.397985, 1, 0.5294118, 0, 1,
-1.342178, -1.326553, -2.665774, 1, 0.5333334, 0, 1,
-1.336621, 1.093718, -0.4184745, 1, 0.5411765, 0, 1,
-1.333067, 2.334071, 0.6479886, 1, 0.5450981, 0, 1,
-1.319401, 0.09020154, -2.005307, 1, 0.5529412, 0, 1,
-1.316704, 0.9315284, -0.001542092, 1, 0.5568628, 0, 1,
-1.309363, -0.5755711, -1.566226, 1, 0.5647059, 0, 1,
-1.302881, 1.470775, -0.115953, 1, 0.5686275, 0, 1,
-1.300132, -0.3391039, -2.827063, 1, 0.5764706, 0, 1,
-1.293773, -1.204033, -2.540635, 1, 0.5803922, 0, 1,
-1.29073, 0.5406354, -2.636939, 1, 0.5882353, 0, 1,
-1.290593, -1.356787, -3.212306, 1, 0.5921569, 0, 1,
-1.282906, -1.090858, -2.436861, 1, 0.6, 0, 1,
-1.278896, -0.1441046, -0.6069872, 1, 0.6078432, 0, 1,
-1.267849, 0.1114946, -0.605846, 1, 0.6117647, 0, 1,
-1.266136, 1.812884, 1.724722, 1, 0.6196079, 0, 1,
-1.24719, 0.7627048, -0.5547495, 1, 0.6235294, 0, 1,
-1.236574, -0.2161403, -0.8723086, 1, 0.6313726, 0, 1,
-1.235755, 0.8022585, -0.9878691, 1, 0.6352941, 0, 1,
-1.234818, -0.6914569, -2.627562, 1, 0.6431373, 0, 1,
-1.231834, 1.994363, 0.1597222, 1, 0.6470588, 0, 1,
-1.225458, 0.5802346, -1.955633, 1, 0.654902, 0, 1,
-1.203338, -0.7243667, -1.260095, 1, 0.6588235, 0, 1,
-1.202107, -0.0220685, -1.511838, 1, 0.6666667, 0, 1,
-1.19914, -0.3590886, 0.1722202, 1, 0.6705883, 0, 1,
-1.190379, 0.7755499, 0.4079576, 1, 0.6784314, 0, 1,
-1.187942, -0.6713848, -3.39696, 1, 0.682353, 0, 1,
-1.183782, 1.028031, -0.5305082, 1, 0.6901961, 0, 1,
-1.157272, -0.8678066, -3.085097, 1, 0.6941177, 0, 1,
-1.156606, 0.132595, -0.450777, 1, 0.7019608, 0, 1,
-1.152303, -0.408336, -2.518996, 1, 0.7098039, 0, 1,
-1.152046, 0.6050414, -1.353751, 1, 0.7137255, 0, 1,
-1.147672, 1.38333, 0.1874329, 1, 0.7215686, 0, 1,
-1.136833, 0.01738892, -2.584919, 1, 0.7254902, 0, 1,
-1.133823, 1.680786, -0.402134, 1, 0.7333333, 0, 1,
-1.132123, -0.670825, -2.054839, 1, 0.7372549, 0, 1,
-1.127926, 0.7730981, -0.4572664, 1, 0.7450981, 0, 1,
-1.124897, 0.3575886, -1.511873, 1, 0.7490196, 0, 1,
-1.124386, 0.3710237, -0.8426958, 1, 0.7568628, 0, 1,
-1.122294, 0.1937567, 0.6415079, 1, 0.7607843, 0, 1,
-1.12142, -1.274005, 1.107626, 1, 0.7686275, 0, 1,
-1.117736, -0.8347446, -2.097213, 1, 0.772549, 0, 1,
-1.109279, -0.199959, -0.2118298, 1, 0.7803922, 0, 1,
-1.106047, 0.6510388, -2.123616, 1, 0.7843137, 0, 1,
-1.104774, 0.3054058, -1.918083, 1, 0.7921569, 0, 1,
-1.09834, -1.353556, -4.265416, 1, 0.7960784, 0, 1,
-1.09418, 0.07713158, -0.6870709, 1, 0.8039216, 0, 1,
-1.092874, -0.5267567, -2.786419, 1, 0.8117647, 0, 1,
-1.090764, -0.8945475, -2.915144, 1, 0.8156863, 0, 1,
-1.079817, -0.554033, -2.050963, 1, 0.8235294, 0, 1,
-1.073054, 0.7283086, -1.273118, 1, 0.827451, 0, 1,
-1.057659, 0.4276754, -1.671328, 1, 0.8352941, 0, 1,
-1.054709, -0.2045829, -2.168907, 1, 0.8392157, 0, 1,
-1.048452, 0.02305523, -1.037863, 1, 0.8470588, 0, 1,
-1.045613, -0.797509, -2.217954, 1, 0.8509804, 0, 1,
-1.045566, 0.5488074, -0.3264555, 1, 0.8588235, 0, 1,
-1.043051, -0.9993533, -0.359817, 1, 0.8627451, 0, 1,
-1.038833, -1.193987, -1.621449, 1, 0.8705882, 0, 1,
-1.037571, 0.8568305, -1.513221, 1, 0.8745098, 0, 1,
-1.037097, -1.272115, -3.680618, 1, 0.8823529, 0, 1,
-1.034418, -0.8994274, -3.011649, 1, 0.8862745, 0, 1,
-1.032645, -1.000914, -1.418904, 1, 0.8941177, 0, 1,
-1.032438, 0.8414258, -1.932344, 1, 0.8980392, 0, 1,
-1.020783, -2.285273, -2.205588, 1, 0.9058824, 0, 1,
-1.01983, 0.5064827, -1.100561, 1, 0.9137255, 0, 1,
-1.018648, 1.298785, 0.7144164, 1, 0.9176471, 0, 1,
-1.010985, 0.4823093, -1.519971, 1, 0.9254902, 0, 1,
-1.004881, -0.429866, -0.6053792, 1, 0.9294118, 0, 1,
-1.003611, 0.3489545, -0.2149916, 1, 0.9372549, 0, 1,
-1.001441, 0.5599008, -1.797944, 1, 0.9411765, 0, 1,
-1.001436, 0.3855613, -1.910332, 1, 0.9490196, 0, 1,
-0.9946771, -0.6355584, -1.19592, 1, 0.9529412, 0, 1,
-0.992231, 1.757857, -1.599132, 1, 0.9607843, 0, 1,
-0.9908676, 0.2156015, -0.6335223, 1, 0.9647059, 0, 1,
-0.9907014, 0.003124541, -1.992576, 1, 0.972549, 0, 1,
-0.985846, -0.5097433, -1.363279, 1, 0.9764706, 0, 1,
-0.9848353, -0.2342367, -2.621579, 1, 0.9843137, 0, 1,
-0.9787726, 0.1102516, -1.076216, 1, 0.9882353, 0, 1,
-0.9774414, -0.3674082, -2.485882, 1, 0.9960784, 0, 1,
-0.9735613, -0.551405, -3.268085, 0.9960784, 1, 0, 1,
-0.9652028, 1.408301, -0.1834727, 0.9921569, 1, 0, 1,
-0.9647235, 1.263082, -2.716869, 0.9843137, 1, 0, 1,
-0.9597418, -0.2702821, -1.02961, 0.9803922, 1, 0, 1,
-0.9592404, -0.7963817, -1.23162, 0.972549, 1, 0, 1,
-0.9514837, 2.029967, -0.2702933, 0.9686275, 1, 0, 1,
-0.9500102, -0.8522353, -1.391416, 0.9607843, 1, 0, 1,
-0.9392703, -1.808797, -1.316161, 0.9568627, 1, 0, 1,
-0.9373593, -0.9695597, -2.190674, 0.9490196, 1, 0, 1,
-0.9373147, 3.192723, 0.06241167, 0.945098, 1, 0, 1,
-0.9350535, 1.085113, -1.098063, 0.9372549, 1, 0, 1,
-0.9347883, 1.207361, -1.147878, 0.9333333, 1, 0, 1,
-0.9342219, 0.2182467, -0.7916775, 0.9254902, 1, 0, 1,
-0.9281616, -0.1082731, -0.8377159, 0.9215686, 1, 0, 1,
-0.9216383, 0.1806643, 0.4031405, 0.9137255, 1, 0, 1,
-0.9120261, -0.1704094, -2.023826, 0.9098039, 1, 0, 1,
-0.9089131, 0.04062399, -1.032478, 0.9019608, 1, 0, 1,
-0.9068231, 0.8864229, -0.2875518, 0.8941177, 1, 0, 1,
-0.9058248, -0.1147958, -2.134336, 0.8901961, 1, 0, 1,
-0.9021078, -0.4310701, -1.97662, 0.8823529, 1, 0, 1,
-0.9019612, -1.653996, -2.968791, 0.8784314, 1, 0, 1,
-0.8968462, 0.04606532, -1.658352, 0.8705882, 1, 0, 1,
-0.8937756, -0.08403495, -1.780075, 0.8666667, 1, 0, 1,
-0.8856542, -1.709864, -3.16158, 0.8588235, 1, 0, 1,
-0.8811162, 0.1209974, -1.042511, 0.854902, 1, 0, 1,
-0.8786633, -1.911914, -2.769356, 0.8470588, 1, 0, 1,
-0.8735055, 1.957622, 0.531074, 0.8431373, 1, 0, 1,
-0.8720495, 1.781471, -1.593874, 0.8352941, 1, 0, 1,
-0.8699102, 0.2823114, -1.247008, 0.8313726, 1, 0, 1,
-0.8689654, -0.07717057, -2.2587, 0.8235294, 1, 0, 1,
-0.8687476, -0.05168032, -1.501428, 0.8196079, 1, 0, 1,
-0.8668643, -0.2045337, -1.134541, 0.8117647, 1, 0, 1,
-0.8650097, -0.4460626, -3.008449, 0.8078431, 1, 0, 1,
-0.8554021, -0.6302691, -1.770033, 0.8, 1, 0, 1,
-0.8500805, -0.6282759, -1.372295, 0.7921569, 1, 0, 1,
-0.8424709, 0.3252091, -0.5710911, 0.7882353, 1, 0, 1,
-0.839099, 0.4975717, -1.775775, 0.7803922, 1, 0, 1,
-0.8234737, 0.7915598, -0.7364337, 0.7764706, 1, 0, 1,
-0.82262, -0.08581183, -0.1524607, 0.7686275, 1, 0, 1,
-0.8216223, 0.08757209, -1.598286, 0.7647059, 1, 0, 1,
-0.7997656, 0.6007804, -0.7259573, 0.7568628, 1, 0, 1,
-0.7989189, 0.2866758, -2.309067, 0.7529412, 1, 0, 1,
-0.7950852, -0.4414417, -2.552048, 0.7450981, 1, 0, 1,
-0.7928244, -0.4298862, -2.968698, 0.7411765, 1, 0, 1,
-0.7889384, 0.2251461, -3.278276, 0.7333333, 1, 0, 1,
-0.7876382, -0.2322485, -2.380947, 0.7294118, 1, 0, 1,
-0.7737059, -0.9254566, -3.932774, 0.7215686, 1, 0, 1,
-0.7706369, -0.7701563, -3.702745, 0.7176471, 1, 0, 1,
-0.770186, -0.3822771, -0.9260793, 0.7098039, 1, 0, 1,
-0.7679347, 2.418116, -0.3971286, 0.7058824, 1, 0, 1,
-0.7617334, -1.924926, -3.845615, 0.6980392, 1, 0, 1,
-0.7523015, 0.1337527, -1.642082, 0.6901961, 1, 0, 1,
-0.7496943, -0.4114286, -3.546753, 0.6862745, 1, 0, 1,
-0.748926, 2.661242, -0.2712511, 0.6784314, 1, 0, 1,
-0.7472873, -0.7520636, -0.9245547, 0.6745098, 1, 0, 1,
-0.7464615, -0.5655041, -0.8847349, 0.6666667, 1, 0, 1,
-0.7463734, -0.2929886, -2.014824, 0.6627451, 1, 0, 1,
-0.7450647, -0.559917, -3.005318, 0.654902, 1, 0, 1,
-0.7427528, -1.063146, -2.765271, 0.6509804, 1, 0, 1,
-0.7422132, 0.09355812, -0.973749, 0.6431373, 1, 0, 1,
-0.7418143, 0.8506159, 0.3631888, 0.6392157, 1, 0, 1,
-0.7413265, -1.049938, -1.798935, 0.6313726, 1, 0, 1,
-0.7394937, 1.023253, -0.2640262, 0.627451, 1, 0, 1,
-0.7361836, -0.5072842, -2.725443, 0.6196079, 1, 0, 1,
-0.7303202, -0.64184, -2.295156, 0.6156863, 1, 0, 1,
-0.7250518, 0.1345388, 0.2432659, 0.6078432, 1, 0, 1,
-0.7244786, -2.916224, -1.861753, 0.6039216, 1, 0, 1,
-0.7194116, 0.9962752, -0.2482626, 0.5960785, 1, 0, 1,
-0.7192248, 1.75203, -1.25888, 0.5882353, 1, 0, 1,
-0.7176911, -0.05271659, -1.309096, 0.5843138, 1, 0, 1,
-0.7133483, 1.727018, -0.7509471, 0.5764706, 1, 0, 1,
-0.7130401, -0.4108783, -1.087071, 0.572549, 1, 0, 1,
-0.7092769, -1.941587, -3.904034, 0.5647059, 1, 0, 1,
-0.7084955, 1.15628, -0.5315121, 0.5607843, 1, 0, 1,
-0.7008656, 0.645229, -2.008522, 0.5529412, 1, 0, 1,
-0.6995026, -1.576209, -3.063867, 0.5490196, 1, 0, 1,
-0.6971002, -0.6296304, -2.378237, 0.5411765, 1, 0, 1,
-0.6937807, -0.05752779, 0.6729422, 0.5372549, 1, 0, 1,
-0.6906413, 0.7216449, -3.003513, 0.5294118, 1, 0, 1,
-0.6872104, 1.386771, 0.256842, 0.5254902, 1, 0, 1,
-0.6865575, -1.790735, -2.645878, 0.5176471, 1, 0, 1,
-0.6863494, 1.799834, -0.5965534, 0.5137255, 1, 0, 1,
-0.6783305, -0.8530692, -2.895535, 0.5058824, 1, 0, 1,
-0.6778587, 1.927874, 0.5611162, 0.5019608, 1, 0, 1,
-0.6772289, 0.7138245, -0.3713265, 0.4941176, 1, 0, 1,
-0.6763974, -0.06920651, -1.58821, 0.4862745, 1, 0, 1,
-0.6702982, 0.167326, -1.270064, 0.4823529, 1, 0, 1,
-0.6699223, 1.404899, 0.2735418, 0.4745098, 1, 0, 1,
-0.6692346, -0.1114594, -3.113225, 0.4705882, 1, 0, 1,
-0.666517, -0.3428417, -0.5629727, 0.4627451, 1, 0, 1,
-0.6629083, -0.2448121, -2.330161, 0.4588235, 1, 0, 1,
-0.6606529, 0.5874149, -1.105798, 0.4509804, 1, 0, 1,
-0.6586462, 0.937922, 1.617205, 0.4470588, 1, 0, 1,
-0.6523095, 0.2197474, -0.3518701, 0.4392157, 1, 0, 1,
-0.6517649, 0.3013346, -1.9496, 0.4352941, 1, 0, 1,
-0.630969, -0.06922483, -0.4659838, 0.427451, 1, 0, 1,
-0.6301581, -1.950918, -1.642739, 0.4235294, 1, 0, 1,
-0.6283516, 0.5360284, -0.4435159, 0.4156863, 1, 0, 1,
-0.618068, 0.07454342, -2.058935, 0.4117647, 1, 0, 1,
-0.6172183, 0.2744899, -0.7480114, 0.4039216, 1, 0, 1,
-0.616514, 0.313543, -2.271585, 0.3960784, 1, 0, 1,
-0.6146975, -0.5848251, -3.723521, 0.3921569, 1, 0, 1,
-0.6047479, 1.040584, -0.3583256, 0.3843137, 1, 0, 1,
-0.6034578, -0.2964027, -2.405308, 0.3803922, 1, 0, 1,
-0.6014761, 1.113588, -1.444079, 0.372549, 1, 0, 1,
-0.5972911, 1.148613, -0.4669169, 0.3686275, 1, 0, 1,
-0.5948564, -0.1239073, -3.066829, 0.3607843, 1, 0, 1,
-0.5927696, 1.221813, 0.5533203, 0.3568628, 1, 0, 1,
-0.5912712, -0.8962073, -2.814982, 0.3490196, 1, 0, 1,
-0.5892516, 0.3968859, 1.416639, 0.345098, 1, 0, 1,
-0.5888712, 0.3052334, -4.270422, 0.3372549, 1, 0, 1,
-0.5870298, -0.4476128, -0.8596267, 0.3333333, 1, 0, 1,
-0.5867093, 0.517791, -1.442517, 0.3254902, 1, 0, 1,
-0.5845373, 0.02092817, -1.73615, 0.3215686, 1, 0, 1,
-0.5819201, -2.22924, -3.496658, 0.3137255, 1, 0, 1,
-0.5813217, 0.9188802, -0.5114409, 0.3098039, 1, 0, 1,
-0.5797045, 0.8815347, -1.541506, 0.3019608, 1, 0, 1,
-0.579209, 2.728006, 1.541583, 0.2941177, 1, 0, 1,
-0.5781578, -1.619578, -2.871865, 0.2901961, 1, 0, 1,
-0.5595813, -0.1960664, -1.133378, 0.282353, 1, 0, 1,
-0.559351, -0.9618654, -3.87648, 0.2784314, 1, 0, 1,
-0.5584569, -0.160942, -1.19039, 0.2705882, 1, 0, 1,
-0.5566626, 1.497056, -0.5516884, 0.2666667, 1, 0, 1,
-0.5563774, 0.9909265, -0.4875015, 0.2588235, 1, 0, 1,
-0.5560885, -0.6850347, -2.058279, 0.254902, 1, 0, 1,
-0.5475834, -0.4911051, -2.015625, 0.2470588, 1, 0, 1,
-0.5466887, -1.224926, -2.879374, 0.2431373, 1, 0, 1,
-0.5441598, 1.309557, -0.5837676, 0.2352941, 1, 0, 1,
-0.5440191, 0.3563058, -0.4761716, 0.2313726, 1, 0, 1,
-0.543667, 1.591751, -0.2628875, 0.2235294, 1, 0, 1,
-0.5435757, -0.409938, -2.135839, 0.2196078, 1, 0, 1,
-0.5417042, 1.496879, -1.226523, 0.2117647, 1, 0, 1,
-0.5412821, -1.340868, -3.387549, 0.2078431, 1, 0, 1,
-0.5408838, -2.28306, -3.640158, 0.2, 1, 0, 1,
-0.5334916, -0.1926345, -1.45529, 0.1921569, 1, 0, 1,
-0.5173932, 0.9143185, -0.7563024, 0.1882353, 1, 0, 1,
-0.5162527, -1.204457, -1.944373, 0.1803922, 1, 0, 1,
-0.513445, -1.487877, -2.374374, 0.1764706, 1, 0, 1,
-0.5131854, -0.780486, -1.884562, 0.1686275, 1, 0, 1,
-0.5062639, 1.421045, 1.362102, 0.1647059, 1, 0, 1,
-0.5042354, 1.993381, 0.1104378, 0.1568628, 1, 0, 1,
-0.5036939, 0.3718617, -1.344239, 0.1529412, 1, 0, 1,
-0.5033417, -0.8463986, -1.163248, 0.145098, 1, 0, 1,
-0.5020272, 0.7203069, 1.002554, 0.1411765, 1, 0, 1,
-0.5017477, -0.2707514, -0.6874815, 0.1333333, 1, 0, 1,
-0.4994383, 0.4691413, -0.8310363, 0.1294118, 1, 0, 1,
-0.4991337, -0.9000819, -2.737471, 0.1215686, 1, 0, 1,
-0.4971045, -0.6492143, -3.716965, 0.1176471, 1, 0, 1,
-0.492818, -0.03131547, -0.8033162, 0.1098039, 1, 0, 1,
-0.4913476, 0.1631011, -0.683554, 0.1058824, 1, 0, 1,
-0.4910273, -3.068236, -3.73985, 0.09803922, 1, 0, 1,
-0.4893806, 0.2894288, -0.2264826, 0.09019608, 1, 0, 1,
-0.487195, 1.814111, -0.03133642, 0.08627451, 1, 0, 1,
-0.4831741, -1.124781, -0.1955549, 0.07843138, 1, 0, 1,
-0.482166, -0.8601621, -3.571109, 0.07450981, 1, 0, 1,
-0.4702213, -1.142905, -3.153423, 0.06666667, 1, 0, 1,
-0.4683575, 1.791295, -0.6395736, 0.0627451, 1, 0, 1,
-0.4671627, 0.3863901, -1.376002, 0.05490196, 1, 0, 1,
-0.4616515, -0.4337431, -2.311951, 0.05098039, 1, 0, 1,
-0.4604835, -0.1292489, -3.664691, 0.04313726, 1, 0, 1,
-0.4588334, 0.913359, -1.090925, 0.03921569, 1, 0, 1,
-0.4576553, -1.308854, -2.659913, 0.03137255, 1, 0, 1,
-0.4540079, -1.510964, -2.004376, 0.02745098, 1, 0, 1,
-0.4522385, 0.5744761, -1.960805, 0.01960784, 1, 0, 1,
-0.450899, 0.7899815, 0.7293963, 0.01568628, 1, 0, 1,
-0.4490496, 0.2311838, -0.8329836, 0.007843138, 1, 0, 1,
-0.4487173, -1.549549, -3.758495, 0.003921569, 1, 0, 1,
-0.4458313, 0.5137642, -1.494282, 0, 1, 0.003921569, 1,
-0.4456686, -0.05560435, -2.573647, 0, 1, 0.01176471, 1,
-0.4448083, -3.133906, -2.597553, 0, 1, 0.01568628, 1,
-0.4379901, 0.4792519, -1.021609, 0, 1, 0.02352941, 1,
-0.4357297, -1.280091, -2.52761, 0, 1, 0.02745098, 1,
-0.430501, 0.6500206, -1.346761, 0, 1, 0.03529412, 1,
-0.4295735, 1.932152, -0.2235926, 0, 1, 0.03921569, 1,
-0.4258184, 0.5373991, -1.335861, 0, 1, 0.04705882, 1,
-0.4251211, 0.9849647, -0.6482646, 0, 1, 0.05098039, 1,
-0.4235547, -1.329927, -1.210959, 0, 1, 0.05882353, 1,
-0.4235069, -0.1516484, -0.008938784, 0, 1, 0.0627451, 1,
-0.4204108, -0.1258433, -0.2147173, 0, 1, 0.07058824, 1,
-0.419359, -0.3085866, -0.8989663, 0, 1, 0.07450981, 1,
-0.4190321, -1.376875, -2.057039, 0, 1, 0.08235294, 1,
-0.4162919, -0.892827, -2.535446, 0, 1, 0.08627451, 1,
-0.414718, -0.02737789, -2.764922, 0, 1, 0.09411765, 1,
-0.4133366, 1.018157, -0.4030377, 0, 1, 0.1019608, 1,
-0.4090045, -0.8236949, -2.541804, 0, 1, 0.1058824, 1,
-0.4054581, -0.3931659, -0.046929, 0, 1, 0.1137255, 1,
-0.403938, -1.008789, -2.649195, 0, 1, 0.1176471, 1,
-0.4014402, 1.673342, 0.2861506, 0, 1, 0.1254902, 1,
-0.4006377, -0.2453129, -1.316642, 0, 1, 0.1294118, 1,
-0.3986558, -0.4932723, -1.988158, 0, 1, 0.1372549, 1,
-0.3945375, 0.7316987, 0.03259174, 0, 1, 0.1411765, 1,
-0.3944371, -0.02908549, -3.160404, 0, 1, 0.1490196, 1,
-0.3943362, -1.004259, -3.182925, 0, 1, 0.1529412, 1,
-0.3929359, 0.4499786, -2.35911, 0, 1, 0.1607843, 1,
-0.3917716, -1.725817, -3.285271, 0, 1, 0.1647059, 1,
-0.3865715, 1.361056, 0.6932779, 0, 1, 0.172549, 1,
-0.3813907, -0.351167, -1.775398, 0, 1, 0.1764706, 1,
-0.3769497, -0.05299218, -1.7293, 0, 1, 0.1843137, 1,
-0.3767197, 1.625615, -1.711461, 0, 1, 0.1882353, 1,
-0.3763885, -0.3732322, -1.195431, 0, 1, 0.1960784, 1,
-0.3742556, -0.2779738, -1.515065, 0, 1, 0.2039216, 1,
-0.3742436, -0.3784478, -0.3366274, 0, 1, 0.2078431, 1,
-0.3664249, -0.8539191, -2.640874, 0, 1, 0.2156863, 1,
-0.3654839, -0.474673, -3.205461, 0, 1, 0.2196078, 1,
-0.3645622, 0.2278439, -1.89794, 0, 1, 0.227451, 1,
-0.3603017, -1.597648, -2.040069, 0, 1, 0.2313726, 1,
-0.3598254, 0.09005766, -2.442151, 0, 1, 0.2392157, 1,
-0.3492974, 0.8071141, -1.142295, 0, 1, 0.2431373, 1,
-0.3489155, -0.6926991, -1.215742, 0, 1, 0.2509804, 1,
-0.3379063, 0.383852, -2.441584, 0, 1, 0.254902, 1,
-0.336156, 0.6077418, 0.219409, 0, 1, 0.2627451, 1,
-0.3342108, 1.664895, 0.2671676, 0, 1, 0.2666667, 1,
-0.3220153, -0.6142309, -4.432814, 0, 1, 0.2745098, 1,
-0.3216179, -0.6770934, -3.04516, 0, 1, 0.2784314, 1,
-0.3209194, 0.5279424, -0.7300452, 0, 1, 0.2862745, 1,
-0.3203001, 1.331959, -1.501498, 0, 1, 0.2901961, 1,
-0.3187514, -0.09920211, -2.393363, 0, 1, 0.2980392, 1,
-0.3167863, 1.868619, 0.1841886, 0, 1, 0.3058824, 1,
-0.3157461, -1.175204, -2.219652, 0, 1, 0.3098039, 1,
-0.3132643, 0.5188184, -0.589272, 0, 1, 0.3176471, 1,
-0.3116115, 0.5407261, -0.07921164, 0, 1, 0.3215686, 1,
-0.3097794, -1.644228, -3.537271, 0, 1, 0.3294118, 1,
-0.3060132, -0.1114554, -0.8979124, 0, 1, 0.3333333, 1,
-0.3039146, -0.9112802, -3.381482, 0, 1, 0.3411765, 1,
-0.3016628, 0.1277093, -0.6759501, 0, 1, 0.345098, 1,
-0.300778, -0.6602743, -2.778799, 0, 1, 0.3529412, 1,
-0.2973403, 0.06086959, -1.662403, 0, 1, 0.3568628, 1,
-0.2894904, -0.8302716, -2.367901, 0, 1, 0.3647059, 1,
-0.2893615, 0.3671261, 0.3834123, 0, 1, 0.3686275, 1,
-0.289279, -1.159834, -2.914028, 0, 1, 0.3764706, 1,
-0.2890444, -2.347597, -1.197613, 0, 1, 0.3803922, 1,
-0.2866079, -1.141267, -1.838756, 0, 1, 0.3882353, 1,
-0.2842481, -0.3760889, -2.482625, 0, 1, 0.3921569, 1,
-0.2840246, 2.02926, 0.9831536, 0, 1, 0.4, 1,
-0.2826423, 0.4427308, -3.215393, 0, 1, 0.4078431, 1,
-0.2814701, 0.1237114, -0.04717028, 0, 1, 0.4117647, 1,
-0.2812616, -1.100413, -2.248327, 0, 1, 0.4196078, 1,
-0.2804036, 1.225183, -1.313678, 0, 1, 0.4235294, 1,
-0.2798635, -0.7046892, -1.744012, 0, 1, 0.4313726, 1,
-0.2794664, 1.154962, 0.7007962, 0, 1, 0.4352941, 1,
-0.2770617, -1.339853, -1.691043, 0, 1, 0.4431373, 1,
-0.2720935, -0.09626123, -1.608545, 0, 1, 0.4470588, 1,
-0.2677977, -0.40733, -1.356405, 0, 1, 0.454902, 1,
-0.267635, 1.086746, -0.551098, 0, 1, 0.4588235, 1,
-0.2620964, 0.03824751, -1.538691, 0, 1, 0.4666667, 1,
-0.2590906, -0.3274757, -2.396451, 0, 1, 0.4705882, 1,
-0.2547139, 0.1974346, 0.8160833, 0, 1, 0.4784314, 1,
-0.2509127, 1.156095, -0.7915159, 0, 1, 0.4823529, 1,
-0.2496282, -1.313365, -3.325397, 0, 1, 0.4901961, 1,
-0.2473132, -1.868399, -2.068738, 0, 1, 0.4941176, 1,
-0.2468779, -0.7539304, -3.420728, 0, 1, 0.5019608, 1,
-0.2431112, 0.1757165, -1.42081, 0, 1, 0.509804, 1,
-0.2364382, 1.619045, -0.5788941, 0, 1, 0.5137255, 1,
-0.23139, 0.404654, -0.3011532, 0, 1, 0.5215687, 1,
-0.2309875, -1.01864, -3.429369, 0, 1, 0.5254902, 1,
-0.2303162, 0.1666554, -0.9042852, 0, 1, 0.5333334, 1,
-0.2287049, -1.811264, -2.60649, 0, 1, 0.5372549, 1,
-0.2258617, 0.6362379, -0.2096322, 0, 1, 0.5450981, 1,
-0.2249901, 0.4663299, -0.6874712, 0, 1, 0.5490196, 1,
-0.2205597, 0.1368684, 0.04041984, 0, 1, 0.5568628, 1,
-0.2185734, 0.0450645, -1.006826, 0, 1, 0.5607843, 1,
-0.2133547, -0.1876981, -0.3132655, 0, 1, 0.5686275, 1,
-0.2117278, 1.335031, 0.8217759, 0, 1, 0.572549, 1,
-0.2093451, 0.5379389, 0.2318476, 0, 1, 0.5803922, 1,
-0.2059833, 0.8934793, -2.065925, 0, 1, 0.5843138, 1,
-0.2052399, -1.160238, -1.845977, 0, 1, 0.5921569, 1,
-0.2040473, 0.2731693, -1.769174, 0, 1, 0.5960785, 1,
-0.2037751, -0.1110036, -1.442259, 0, 1, 0.6039216, 1,
-0.2009013, 1.024897, -0.4622739, 0, 1, 0.6117647, 1,
-0.1994339, -1.451013, -4.33262, 0, 1, 0.6156863, 1,
-0.196978, -0.4471028, -4.103549, 0, 1, 0.6235294, 1,
-0.1959254, -2.010288, -2.471167, 0, 1, 0.627451, 1,
-0.1937301, -1.364948, -2.582153, 0, 1, 0.6352941, 1,
-0.1918939, 0.2588255, -0.5679938, 0, 1, 0.6392157, 1,
-0.1917004, -1.894857, -3.401167, 0, 1, 0.6470588, 1,
-0.1880848, -0.9171369, -2.238414, 0, 1, 0.6509804, 1,
-0.1859022, -0.8827227, -0.4321411, 0, 1, 0.6588235, 1,
-0.1846078, 0.1434452, 0.464644, 0, 1, 0.6627451, 1,
-0.1841982, -0.5792822, -2.520028, 0, 1, 0.6705883, 1,
-0.1799092, 0.8129376, 1.3777, 0, 1, 0.6745098, 1,
-0.1762229, -1.276286, -2.585855, 0, 1, 0.682353, 1,
-0.171872, -1.203851, -3.891488, 0, 1, 0.6862745, 1,
-0.1710841, 0.03531875, -0.776787, 0, 1, 0.6941177, 1,
-0.1676917, -0.6808435, -2.661449, 0, 1, 0.7019608, 1,
-0.1661706, 1.702238, -0.7142268, 0, 1, 0.7058824, 1,
-0.1642724, 0.7039298, -0.3153561, 0, 1, 0.7137255, 1,
-0.1632363, 0.1834053, -1.303471, 0, 1, 0.7176471, 1,
-0.1599943, -1.334721, -4.360952, 0, 1, 0.7254902, 1,
-0.1581447, -0.2100617, -1.241012, 0, 1, 0.7294118, 1,
-0.1572642, 1.320561, 0.0202176, 0, 1, 0.7372549, 1,
-0.1569316, -0.2129663, -3.160254, 0, 1, 0.7411765, 1,
-0.1563243, -0.7972916, -1.115785, 0, 1, 0.7490196, 1,
-0.1553389, -0.8597551, -3.824746, 0, 1, 0.7529412, 1,
-0.1518331, -1.41182, -3.208078, 0, 1, 0.7607843, 1,
-0.1476272, 1.48443, -0.4813916, 0, 1, 0.7647059, 1,
-0.147208, 1.442456, 0.2913212, 0, 1, 0.772549, 1,
-0.1434262, -1.553583, -3.26888, 0, 1, 0.7764706, 1,
-0.1430158, -0.4645832, -4.408741, 0, 1, 0.7843137, 1,
-0.1429635, -0.2995635, -1.129324, 0, 1, 0.7882353, 1,
-0.1429237, 0.6088362, -0.5486343, 0, 1, 0.7960784, 1,
-0.1422509, 1.695438, -0.3151886, 0, 1, 0.8039216, 1,
-0.1416326, -0.5461618, -1.204204, 0, 1, 0.8078431, 1,
-0.1383349, 0.7652081, -0.5107105, 0, 1, 0.8156863, 1,
-0.1374459, -1.237151, -3.363444, 0, 1, 0.8196079, 1,
-0.1373999, -0.2290507, -4.34655, 0, 1, 0.827451, 1,
-0.1364713, 0.1004337, -0.008750563, 0, 1, 0.8313726, 1,
-0.1357849, 0.5601831, 0.1335621, 0, 1, 0.8392157, 1,
-0.134303, -0.7165884, -2.13661, 0, 1, 0.8431373, 1,
-0.1324053, 1.581669, -1.242025, 0, 1, 0.8509804, 1,
-0.1317107, -1.969618, -2.088151, 0, 1, 0.854902, 1,
-0.1272646, 0.5644651, 0.1841887, 0, 1, 0.8627451, 1,
-0.1211514, -0.0421995, -2.389914, 0, 1, 0.8666667, 1,
-0.1176942, -0.2267522, -3.37855, 0, 1, 0.8745098, 1,
-0.1150405, -0.6739961, -2.061482, 0, 1, 0.8784314, 1,
-0.1146316, 0.3089562, -0.008881868, 0, 1, 0.8862745, 1,
-0.1139232, 1.004394, 0.03641072, 0, 1, 0.8901961, 1,
-0.11042, 0.6834632, 1.042516, 0, 1, 0.8980392, 1,
-0.1102244, -0.3786112, -3.199519, 0, 1, 0.9058824, 1,
-0.1013728, 0.9868171, 0.5772411, 0, 1, 0.9098039, 1,
-0.09729071, 0.6705936, 0.2609529, 0, 1, 0.9176471, 1,
-0.09276964, -0.3726579, -1.94753, 0, 1, 0.9215686, 1,
-0.07590366, 0.2460117, -0.5398251, 0, 1, 0.9294118, 1,
-0.07567736, 0.2480139, -1.212251, 0, 1, 0.9333333, 1,
-0.06458052, 0.8276182, 0.5747809, 0, 1, 0.9411765, 1,
-0.0612745, 1.017361, -1.851409, 0, 1, 0.945098, 1,
-0.05607834, -0.6321957, -2.830943, 0, 1, 0.9529412, 1,
-0.05569703, 1.212411, 0.4130468, 0, 1, 0.9568627, 1,
-0.05450139, 0.7159007, 0.03571554, 0, 1, 0.9647059, 1,
-0.05052392, 0.5740653, 0.2544524, 0, 1, 0.9686275, 1,
-0.04989564, -1.191302, -3.610665, 0, 1, 0.9764706, 1,
-0.04919881, 0.9190577, 1.154503, 0, 1, 0.9803922, 1,
-0.04617222, 0.4853626, -0.7650358, 0, 1, 0.9882353, 1,
-0.04573435, 1.518426, -0.5719606, 0, 1, 0.9921569, 1,
-0.04540017, -0.687151, -2.406079, 0, 1, 1, 1,
-0.04494156, -2.257696, -3.084982, 0, 0.9921569, 1, 1,
-0.04210774, -0.5177758, -1.160109, 0, 0.9882353, 1, 1,
-0.0413059, 1.145085, 0.06345117, 0, 0.9803922, 1, 1,
-0.03727891, -1.67784, -4.140193, 0, 0.9764706, 1, 1,
-0.03570564, -0.03907953, -2.223996, 0, 0.9686275, 1, 1,
-0.03512988, -1.677937, -4.532369, 0, 0.9647059, 1, 1,
-0.02925571, -1.777795, -3.932504, 0, 0.9568627, 1, 1,
-0.01969806, -0.1985967, -4.397548, 0, 0.9529412, 1, 1,
-0.01817323, -2.06487, -2.440017, 0, 0.945098, 1, 1,
-0.01813869, -0.8820461, -4.194129, 0, 0.9411765, 1, 1,
-0.01550271, 0.09982631, -1.491513, 0, 0.9333333, 1, 1,
-0.0153272, -0.7557222, -3.19513, 0, 0.9294118, 1, 1,
-0.01293994, -0.9139894, -3.702937, 0, 0.9215686, 1, 1,
-0.009843281, -0.3693854, -2.434867, 0, 0.9176471, 1, 1,
-0.008946803, -1.217849, -2.00894, 0, 0.9098039, 1, 1,
-0.0004751197, 0.5244849, 0.9878379, 0, 0.9058824, 1, 1,
0.003658093, 1.836051, 0.2767674, 0, 0.8980392, 1, 1,
0.006851529, 0.1308884, 1.262446, 0, 0.8901961, 1, 1,
0.007714284, 0.9598544, -1.584642, 0, 0.8862745, 1, 1,
0.01309754, -0.7925945, 5.118078, 0, 0.8784314, 1, 1,
0.01729403, 0.9339854, 1.944425, 0, 0.8745098, 1, 1,
0.02089707, 0.817445, -1.211191, 0, 0.8666667, 1, 1,
0.02405406, -1.696652, 3.966791, 0, 0.8627451, 1, 1,
0.02547505, -0.359024, 3.237866, 0, 0.854902, 1, 1,
0.02598689, -0.1316268, 3.192696, 0, 0.8509804, 1, 1,
0.03223941, -1.342553, 5.20689, 0, 0.8431373, 1, 1,
0.03307942, -1.092425, 2.801812, 0, 0.8392157, 1, 1,
0.03465337, -0.2957885, 5.491722, 0, 0.8313726, 1, 1,
0.03587279, 0.84531, 0.5533397, 0, 0.827451, 1, 1,
0.03676608, -1.42283, 3.54911, 0, 0.8196079, 1, 1,
0.03954494, 2.727454, -0.1188069, 0, 0.8156863, 1, 1,
0.04011247, 1.479681, -0.6255041, 0, 0.8078431, 1, 1,
0.04289301, 0.2788925, 0.2728543, 0, 0.8039216, 1, 1,
0.04380039, 0.05303478, 0.5157665, 0, 0.7960784, 1, 1,
0.04471197, 0.5518441, 0.4128726, 0, 0.7882353, 1, 1,
0.04783811, 1.551854, 0.03282919, 0, 0.7843137, 1, 1,
0.0528885, 0.09395256, 0.358209, 0, 0.7764706, 1, 1,
0.06031554, -0.4372303, 3.71836, 0, 0.772549, 1, 1,
0.06431896, 0.4262215, 0.7027302, 0, 0.7647059, 1, 1,
0.06619728, -1.924692, 2.410421, 0, 0.7607843, 1, 1,
0.07009499, 1.159941, -0.01368043, 0, 0.7529412, 1, 1,
0.07524785, -0.6440838, 3.418017, 0, 0.7490196, 1, 1,
0.07564449, -0.1984172, 1.774191, 0, 0.7411765, 1, 1,
0.08403231, -0.18355, 1.573806, 0, 0.7372549, 1, 1,
0.08752723, -0.1365146, 4.189678, 0, 0.7294118, 1, 1,
0.08963303, 0.8512607, 1.033042, 0, 0.7254902, 1, 1,
0.0943365, -1.79625, 3.017382, 0, 0.7176471, 1, 1,
0.09587549, 0.2896369, -0.930949, 0, 0.7137255, 1, 1,
0.09896789, 0.5522839, -0.9662676, 0, 0.7058824, 1, 1,
0.100058, 0.3658755, 0.177763, 0, 0.6980392, 1, 1,
0.1019971, -0.9183702, 1.794003, 0, 0.6941177, 1, 1,
0.1042062, 0.8297583, 0.0791648, 0, 0.6862745, 1, 1,
0.1046719, 0.7458817, 0.153879, 0, 0.682353, 1, 1,
0.1059335, -2.362471, 3.390654, 0, 0.6745098, 1, 1,
0.1106943, -0.001205749, 3.25298, 0, 0.6705883, 1, 1,
0.1180509, -1.433714, 1.884515, 0, 0.6627451, 1, 1,
0.1198443, 0.8160917, 0.5935723, 0, 0.6588235, 1, 1,
0.1230648, 0.8420966, -0.9994553, 0, 0.6509804, 1, 1,
0.1249758, -0.5038845, 3.027235, 0, 0.6470588, 1, 1,
0.1287608, 1.118991, -0.4103465, 0, 0.6392157, 1, 1,
0.1288376, -0.8880449, 2.354109, 0, 0.6352941, 1, 1,
0.1298188, -0.970857, 3.57069, 0, 0.627451, 1, 1,
0.1303522, -0.2560739, 2.012299, 0, 0.6235294, 1, 1,
0.1337774, 0.114186, 1.67956, 0, 0.6156863, 1, 1,
0.1370738, -0.6864587, 2.633368, 0, 0.6117647, 1, 1,
0.1377556, -1.332742, 2.00059, 0, 0.6039216, 1, 1,
0.1397932, 0.4549062, 0.248181, 0, 0.5960785, 1, 1,
0.1415244, 1.128614, -0.05881426, 0, 0.5921569, 1, 1,
0.1419956, 0.2054441, 0.3729542, 0, 0.5843138, 1, 1,
0.1449526, -0.9220827, -0.2521507, 0, 0.5803922, 1, 1,
0.1454456, -0.06616525, 1.985927, 0, 0.572549, 1, 1,
0.1499305, 1.489436, 1.672716, 0, 0.5686275, 1, 1,
0.1512845, -0.6512066, 0.3380937, 0, 0.5607843, 1, 1,
0.151526, 0.9817467, 0.378852, 0, 0.5568628, 1, 1,
0.1527182, -1.079459, 0.8078299, 0, 0.5490196, 1, 1,
0.1530133, 0.3976813, -0.926973, 0, 0.5450981, 1, 1,
0.1647362, 1.134598, 0.4948023, 0, 0.5372549, 1, 1,
0.1650968, -1.128384, 3.231084, 0, 0.5333334, 1, 1,
0.1687949, 0.2722557, 1.43426, 0, 0.5254902, 1, 1,
0.1708458, -0.5809771, 3.242451, 0, 0.5215687, 1, 1,
0.183985, 0.3860417, -0.2406888, 0, 0.5137255, 1, 1,
0.1840237, 2.447735, 1.730129, 0, 0.509804, 1, 1,
0.1840864, -1.245846, 3.631608, 0, 0.5019608, 1, 1,
0.1854137, -0.7616345, 1.706944, 0, 0.4941176, 1, 1,
0.1932965, 1.208727, 0.08868524, 0, 0.4901961, 1, 1,
0.1935535, -0.4259252, 1.513077, 0, 0.4823529, 1, 1,
0.1968108, 0.2288153, 1.575999, 0, 0.4784314, 1, 1,
0.2033719, 1.62024, 1.033794, 0, 0.4705882, 1, 1,
0.2062057, 0.3317011, 1.943292, 0, 0.4666667, 1, 1,
0.2064285, 2.368436, -0.7381836, 0, 0.4588235, 1, 1,
0.2115714, 2.246008, 0.5701747, 0, 0.454902, 1, 1,
0.2158487, 1.348125, 2.122021, 0, 0.4470588, 1, 1,
0.2237466, 1.19823, 0.05670629, 0, 0.4431373, 1, 1,
0.2243272, -1.770801, 2.807203, 0, 0.4352941, 1, 1,
0.2273093, 0.7228765, 0.7895152, 0, 0.4313726, 1, 1,
0.2295756, -2.149926, 3.549015, 0, 0.4235294, 1, 1,
0.2320001, 0.286655, 0.782531, 0, 0.4196078, 1, 1,
0.2353251, -0.291301, 3.761187, 0, 0.4117647, 1, 1,
0.2360556, 0.1758801, 1.784364, 0, 0.4078431, 1, 1,
0.2381378, 1.749755, -1.518826, 0, 0.4, 1, 1,
0.2425478, 1.447342, -0.2185746, 0, 0.3921569, 1, 1,
0.2458199, -1.333864, 3.475651, 0, 0.3882353, 1, 1,
0.2480879, -0.6780099, 2.528111, 0, 0.3803922, 1, 1,
0.248181, -2.025665, 3.730544, 0, 0.3764706, 1, 1,
0.2493631, -2.324649, 3.422533, 0, 0.3686275, 1, 1,
0.2509368, -1.665397, 3.705558, 0, 0.3647059, 1, 1,
0.2636467, -0.6937785, 2.419247, 0, 0.3568628, 1, 1,
0.2662559, 1.169255, 1.102094, 0, 0.3529412, 1, 1,
0.2675006, -0.2927412, 1.425672, 0, 0.345098, 1, 1,
0.2729636, -1.658916, 1.512514, 0, 0.3411765, 1, 1,
0.2786357, -0.199121, 1.187534, 0, 0.3333333, 1, 1,
0.2796052, 2.112401, 1.533091, 0, 0.3294118, 1, 1,
0.2807124, 1.618029, -0.4161102, 0, 0.3215686, 1, 1,
0.2860039, -1.789673, 4.737687, 0, 0.3176471, 1, 1,
0.2890702, 0.9396768, 1.969867, 0, 0.3098039, 1, 1,
0.29241, -0.7837432, 1.538219, 0, 0.3058824, 1, 1,
0.2936468, 1.509818, -0.4367899, 0, 0.2980392, 1, 1,
0.2960708, 0.4726554, 0.4058407, 0, 0.2901961, 1, 1,
0.2967118, 0.03564704, 2.512996, 0, 0.2862745, 1, 1,
0.2975898, 0.2076916, 1.72705, 0, 0.2784314, 1, 1,
0.2997442, -0.9895176, 0.8657157, 0, 0.2745098, 1, 1,
0.3008548, 0.6769374, 0.05310304, 0, 0.2666667, 1, 1,
0.3013556, -1.639643, 2.273565, 0, 0.2627451, 1, 1,
0.3021189, -1.782875, 1.317547, 0, 0.254902, 1, 1,
0.3057438, 2.382201, 0.1449618, 0, 0.2509804, 1, 1,
0.3152428, -0.9707481, 0.230376, 0, 0.2431373, 1, 1,
0.3176557, 0.1452916, 0.7536722, 0, 0.2392157, 1, 1,
0.3238836, -0.6323613, 3.801996, 0, 0.2313726, 1, 1,
0.3252863, -0.2244695, 1.931122, 0, 0.227451, 1, 1,
0.3296915, -0.3392052, 2.77183, 0, 0.2196078, 1, 1,
0.3371874, -0.7885004, 3.533665, 0, 0.2156863, 1, 1,
0.3377773, -0.1573302, 2.252358, 0, 0.2078431, 1, 1,
0.3397118, 1.263611, -1.476155, 0, 0.2039216, 1, 1,
0.3407631, 0.9443951, -1.012476, 0, 0.1960784, 1, 1,
0.3433949, 0.3351257, 2.027652, 0, 0.1882353, 1, 1,
0.3436023, 1.875999, 2.485581, 0, 0.1843137, 1, 1,
0.3448631, -0.2072414, 3.468021, 0, 0.1764706, 1, 1,
0.3455468, -0.3553651, 3.637408, 0, 0.172549, 1, 1,
0.3469734, 1.88517, 0.517923, 0, 0.1647059, 1, 1,
0.3546429, 0.7100464, 1.791884, 0, 0.1607843, 1, 1,
0.3551691, -2.088793, 3.063227, 0, 0.1529412, 1, 1,
0.3586388, -1.749971, 3.075027, 0, 0.1490196, 1, 1,
0.3623173, 0.2789307, 0.6456279, 0, 0.1411765, 1, 1,
0.3624894, 0.3022546, 0.5261719, 0, 0.1372549, 1, 1,
0.3679666, -0.1258053, 2.086601, 0, 0.1294118, 1, 1,
0.3702056, -1.295848, 1.396062, 0, 0.1254902, 1, 1,
0.3767053, -0.07129785, 2.633484, 0, 0.1176471, 1, 1,
0.377331, 0.162283, 0.9753559, 0, 0.1137255, 1, 1,
0.3774051, -1.634278, 2.823822, 0, 0.1058824, 1, 1,
0.3800724, 0.1675353, 1.148335, 0, 0.09803922, 1, 1,
0.3804812, 0.6997625, 0.4816452, 0, 0.09411765, 1, 1,
0.3817199, -0.3622872, 1.662239, 0, 0.08627451, 1, 1,
0.3857379, -0.04975654, 2.767478, 0, 0.08235294, 1, 1,
0.3862284, -0.7309897, 1.322868, 0, 0.07450981, 1, 1,
0.3872433, -1.488171, 3.274464, 0, 0.07058824, 1, 1,
0.3910854, 0.1074958, 0.9134048, 0, 0.0627451, 1, 1,
0.3960372, -0.7094243, 5.324436, 0, 0.05882353, 1, 1,
0.4009941, 0.8914645, -0.8013466, 0, 0.05098039, 1, 1,
0.4084898, -1.406137, 3.138907, 0, 0.04705882, 1, 1,
0.4101186, 1.022219, -0.694007, 0, 0.03921569, 1, 1,
0.4166288, 0.8130566, 1.040178, 0, 0.03529412, 1, 1,
0.4175401, 0.2388598, 0.8563114, 0, 0.02745098, 1, 1,
0.4184211, 0.9757608, 2.70127, 0, 0.02352941, 1, 1,
0.4190732, -0.6128113, 3.533714, 0, 0.01568628, 1, 1,
0.426113, 1.283618, 0.9375213, 0, 0.01176471, 1, 1,
0.427859, -0.0854362, 1.881614, 0, 0.003921569, 1, 1,
0.4281658, 0.06503106, 0.3905745, 0.003921569, 0, 1, 1,
0.4332391, 0.9125007, 1.635486, 0.007843138, 0, 1, 1,
0.4370503, 1.095567, 1.21927, 0.01568628, 0, 1, 1,
0.4421925, 0.3148551, 0.5043453, 0.01960784, 0, 1, 1,
0.4435357, -0.08044061, 1.681306, 0.02745098, 0, 1, 1,
0.4435945, -1.4909, 3.8577, 0.03137255, 0, 1, 1,
0.4504188, 0.02713137, 1.259927, 0.03921569, 0, 1, 1,
0.4531846, -0.1552869, 0.560872, 0.04313726, 0, 1, 1,
0.4542289, -0.942956, 2.588256, 0.05098039, 0, 1, 1,
0.4544219, -0.6432447, 3.295807, 0.05490196, 0, 1, 1,
0.4566683, 1.048768, -0.1044551, 0.0627451, 0, 1, 1,
0.4576788, 0.2222779, 1.167805, 0.06666667, 0, 1, 1,
0.4619507, 1.351088, 0.7386007, 0.07450981, 0, 1, 1,
0.4667408, 2.838772, -0.08626692, 0.07843138, 0, 1, 1,
0.4689479, -0.8320084, 1.817542, 0.08627451, 0, 1, 1,
0.4709696, -0.35762, 0.5592352, 0.09019608, 0, 1, 1,
0.4711349, -0.02999029, 3.082335, 0.09803922, 0, 1, 1,
0.4762688, 1.084089, -1.06636, 0.1058824, 0, 1, 1,
0.478043, -0.7384104, 2.480314, 0.1098039, 0, 1, 1,
0.4820229, -0.1370838, 2.414194, 0.1176471, 0, 1, 1,
0.4827028, 0.5650108, 2.712479, 0.1215686, 0, 1, 1,
0.4836105, 0.843013, 0.4277931, 0.1294118, 0, 1, 1,
0.4860072, 0.8369668, 0.3693396, 0.1333333, 0, 1, 1,
0.4862248, 0.8977148, 0.3231516, 0.1411765, 0, 1, 1,
0.4868065, 0.6014545, -0.7380965, 0.145098, 0, 1, 1,
0.4898874, 1.672665, -0.05982668, 0.1529412, 0, 1, 1,
0.4940329, -1.259275, 4.432017, 0.1568628, 0, 1, 1,
0.4968978, 0.2748505, 1.085074, 0.1647059, 0, 1, 1,
0.4980291, 0.1513358, 0.08576088, 0.1686275, 0, 1, 1,
0.4992554, 1.105424, -0.09962125, 0.1764706, 0, 1, 1,
0.5006132, 1.411215, 1.002293, 0.1803922, 0, 1, 1,
0.5042059, -1.778919, 3.02152, 0.1882353, 0, 1, 1,
0.5100255, 0.1205451, 2.278349, 0.1921569, 0, 1, 1,
0.5134621, -0.1228861, 2.665125, 0.2, 0, 1, 1,
0.5152309, 0.4076876, 1.600815, 0.2078431, 0, 1, 1,
0.5188276, 0.002961269, 0.4373704, 0.2117647, 0, 1, 1,
0.5215359, -1.867917, 2.451387, 0.2196078, 0, 1, 1,
0.5222682, -1.870441, 2.364211, 0.2235294, 0, 1, 1,
0.5232621, 0.1286997, 0.4848354, 0.2313726, 0, 1, 1,
0.5279952, 0.09556198, 0.8811007, 0.2352941, 0, 1, 1,
0.5282598, -0.1759112, 1.897119, 0.2431373, 0, 1, 1,
0.5284455, 0.06710713, 1.545688, 0.2470588, 0, 1, 1,
0.5292568, 0.6108184, 1.213633, 0.254902, 0, 1, 1,
0.5335894, -1.038542, 2.163286, 0.2588235, 0, 1, 1,
0.5338291, 0.1572063, 2.291198, 0.2666667, 0, 1, 1,
0.5344374, 0.8669333, 1.753559, 0.2705882, 0, 1, 1,
0.5348436, -1.965169, 4.674797, 0.2784314, 0, 1, 1,
0.5361473, 0.316056, 0.9755563, 0.282353, 0, 1, 1,
0.5366454, 2.73629, 1.169771, 0.2901961, 0, 1, 1,
0.538126, -0.9570345, 3.284222, 0.2941177, 0, 1, 1,
0.5503353, 1.097967, 0.06548642, 0.3019608, 0, 1, 1,
0.5527322, 0.9202499, 2.248287, 0.3098039, 0, 1, 1,
0.5597593, 0.05232332, 0.2767864, 0.3137255, 0, 1, 1,
0.5665334, -0.02486585, 2.051338, 0.3215686, 0, 1, 1,
0.570244, 0.6156436, 2.678257, 0.3254902, 0, 1, 1,
0.5706372, 0.8184652, -0.4563625, 0.3333333, 0, 1, 1,
0.5731214, 0.6838976, -0.09016841, 0.3372549, 0, 1, 1,
0.5795997, -0.026412, 2.93152, 0.345098, 0, 1, 1,
0.5851814, 0.4221644, 2.038948, 0.3490196, 0, 1, 1,
0.5874404, 0.7967539, 0.03602624, 0.3568628, 0, 1, 1,
0.5877105, -0.02086984, 1.857572, 0.3607843, 0, 1, 1,
0.5909155, 0.6708105, 0.5006346, 0.3686275, 0, 1, 1,
0.5912449, -0.2564364, 1.033845, 0.372549, 0, 1, 1,
0.6049301, -0.0692422, 2.347165, 0.3803922, 0, 1, 1,
0.6099313, 2.422827, 0.3390582, 0.3843137, 0, 1, 1,
0.6106905, 1.329052, -1.230029, 0.3921569, 0, 1, 1,
0.6127864, -0.2627619, 1.570589, 0.3960784, 0, 1, 1,
0.6130467, 0.1623195, 1.61796, 0.4039216, 0, 1, 1,
0.6201808, 0.8779325, -0.8093776, 0.4117647, 0, 1, 1,
0.6261165, 0.1178724, 1.36978, 0.4156863, 0, 1, 1,
0.6301392, -0.1917674, 0.7828366, 0.4235294, 0, 1, 1,
0.6377937, -0.4671493, 0.9610826, 0.427451, 0, 1, 1,
0.6385867, -1.164558, 1.386586, 0.4352941, 0, 1, 1,
0.6431475, -0.6592723, 2.125333, 0.4392157, 0, 1, 1,
0.6465228, 1.889906, 0.3818732, 0.4470588, 0, 1, 1,
0.6515969, -0.6877446, 0.9386784, 0.4509804, 0, 1, 1,
0.656303, 0.7669102, 0.0432485, 0.4588235, 0, 1, 1,
0.6580654, -0.5634575, 3.203935, 0.4627451, 0, 1, 1,
0.6665439, 1.007472, 0.7083927, 0.4705882, 0, 1, 1,
0.6678104, 1.635595, 0.7923165, 0.4745098, 0, 1, 1,
0.6716035, 2.03898, -0.8238605, 0.4823529, 0, 1, 1,
0.6773422, 1.680754, 1.547349, 0.4862745, 0, 1, 1,
0.6802477, -2.124351, 2.460917, 0.4941176, 0, 1, 1,
0.6808547, -0.5198521, 2.97686, 0.5019608, 0, 1, 1,
0.6813736, 1.740561, -0.1463188, 0.5058824, 0, 1, 1,
0.6823574, 0.4314369, 0.1565939, 0.5137255, 0, 1, 1,
0.6823941, -0.05416319, 1.789466, 0.5176471, 0, 1, 1,
0.685973, 1.631266, 0.8164845, 0.5254902, 0, 1, 1,
0.6870329, -0.02887218, 2.158867, 0.5294118, 0, 1, 1,
0.6913487, 0.5547675, 2.012558, 0.5372549, 0, 1, 1,
0.6964465, -1.518831, 2.006228, 0.5411765, 0, 1, 1,
0.6974572, -0.3555649, 0.1504843, 0.5490196, 0, 1, 1,
0.7087348, -0.2331506, 0.4080559, 0.5529412, 0, 1, 1,
0.7097802, -0.9343126, 2.006178, 0.5607843, 0, 1, 1,
0.7155094, 0.8408814, 2.819928, 0.5647059, 0, 1, 1,
0.7206129, 0.262314, 1.055676, 0.572549, 0, 1, 1,
0.7217305, -0.7884675, 1.919536, 0.5764706, 0, 1, 1,
0.7260284, 0.05158015, 1.98492, 0.5843138, 0, 1, 1,
0.7268115, 0.7456586, -0.1499888, 0.5882353, 0, 1, 1,
0.7272561, -1.01082, 3.171191, 0.5960785, 0, 1, 1,
0.728632, -0.4773572, 2.249233, 0.6039216, 0, 1, 1,
0.7312472, 0.3489149, 0.8929989, 0.6078432, 0, 1, 1,
0.736549, 0.21523, 0.2341751, 0.6156863, 0, 1, 1,
0.737019, -0.5421495, 2.346457, 0.6196079, 0, 1, 1,
0.7421137, 0.1793812, 0.1521135, 0.627451, 0, 1, 1,
0.749322, 1.174969, -0.5389816, 0.6313726, 0, 1, 1,
0.7530133, -1.174774, 1.13983, 0.6392157, 0, 1, 1,
0.7542627, 1.009575, 1.683809, 0.6431373, 0, 1, 1,
0.7549596, 1.912428, 2.645827, 0.6509804, 0, 1, 1,
0.762133, 0.1644545, -0.1333162, 0.654902, 0, 1, 1,
0.7648128, 0.4347428, 1.863719, 0.6627451, 0, 1, 1,
0.7673435, 0.8082792, -1.566873, 0.6666667, 0, 1, 1,
0.7676245, 0.6276428, 2.457062, 0.6745098, 0, 1, 1,
0.7734007, 0.9991915, -0.04596199, 0.6784314, 0, 1, 1,
0.7775832, -0.8456414, 2.782926, 0.6862745, 0, 1, 1,
0.7803632, -1.35785, 2.317262, 0.6901961, 0, 1, 1,
0.7870619, -1.037125, 3.062474, 0.6980392, 0, 1, 1,
0.7905635, 1.121699, 2.041546, 0.7058824, 0, 1, 1,
0.792876, -0.01634859, 0.7749452, 0.7098039, 0, 1, 1,
0.7951318, 0.5289899, 1.204803, 0.7176471, 0, 1, 1,
0.7957662, -0.1378554, 2.21033, 0.7215686, 0, 1, 1,
0.796939, 0.6573119, 1.550121, 0.7294118, 0, 1, 1,
0.7975146, 0.7892622, 1.155156, 0.7333333, 0, 1, 1,
0.7982727, 0.7488948, -1.353305, 0.7411765, 0, 1, 1,
0.8014219, -0.5249978, 1.995923, 0.7450981, 0, 1, 1,
0.8074601, -1.992851, 3.991673, 0.7529412, 0, 1, 1,
0.8090245, 0.4014411, 2.09866, 0.7568628, 0, 1, 1,
0.8145581, -1.567044, 3.655964, 0.7647059, 0, 1, 1,
0.814664, -1.247749, 3.565667, 0.7686275, 0, 1, 1,
0.8156945, -0.06178422, 2.262569, 0.7764706, 0, 1, 1,
0.8166786, 1.399576, 0.709835, 0.7803922, 0, 1, 1,
0.8248909, -1.396262, 2.578908, 0.7882353, 0, 1, 1,
0.8312622, -0.1362465, 3.033502, 0.7921569, 0, 1, 1,
0.8356048, 1.532837, -0.5476273, 0.8, 0, 1, 1,
0.8433874, 0.5045708, 0.8262784, 0.8078431, 0, 1, 1,
0.8456221, 0.7429225, 0.02656096, 0.8117647, 0, 1, 1,
0.8543312, -0.001694584, 2.170968, 0.8196079, 0, 1, 1,
0.8573214, -0.07673247, 1.631868, 0.8235294, 0, 1, 1,
0.8632455, 1.565831, 0.6464043, 0.8313726, 0, 1, 1,
0.8633318, -0.4448344, 0.0975005, 0.8352941, 0, 1, 1,
0.8721569, 0.2527252, 2.462956, 0.8431373, 0, 1, 1,
0.8760281, 0.3904864, 1.832753, 0.8470588, 0, 1, 1,
0.87616, -0.845081, 3.941991, 0.854902, 0, 1, 1,
0.8787717, -0.2822199, 0.9692425, 0.8588235, 0, 1, 1,
0.8795396, -0.2468173, 2.226952, 0.8666667, 0, 1, 1,
0.8810467, -0.1926474, 2.14869, 0.8705882, 0, 1, 1,
0.8880097, -0.2776436, 0.5048462, 0.8784314, 0, 1, 1,
0.8887802, -0.4114814, 0.9296251, 0.8823529, 0, 1, 1,
0.8912398, -0.9822254, 3.260869, 0.8901961, 0, 1, 1,
0.8948644, 0.04875983, 2.989614, 0.8941177, 0, 1, 1,
0.8958934, -0.6015151, 2.507658, 0.9019608, 0, 1, 1,
0.8982078, 0.7702633, 0.8986647, 0.9098039, 0, 1, 1,
0.9026026, 0.2710089, 2.548692, 0.9137255, 0, 1, 1,
0.9079269, -0.3473707, 1.89588, 0.9215686, 0, 1, 1,
0.9153206, 0.02631122, 3.04254, 0.9254902, 0, 1, 1,
0.9167016, -0.7800213, 1.531767, 0.9333333, 0, 1, 1,
0.9173981, 0.7348099, 2.737288, 0.9372549, 0, 1, 1,
0.9210657, 0.2052624, 2.117833, 0.945098, 0, 1, 1,
0.9223204, 1.078401, 0.4784161, 0.9490196, 0, 1, 1,
0.9229259, 1.061792, -1.598356, 0.9568627, 0, 1, 1,
0.9329987, 1.401513, 0.8923956, 0.9607843, 0, 1, 1,
0.9336383, -1.076171, 2.428681, 0.9686275, 0, 1, 1,
0.9364609, -0.2516017, 2.312396, 0.972549, 0, 1, 1,
0.9373487, -0.0745681, 1.039744, 0.9803922, 0, 1, 1,
0.939797, -0.1288954, 1.695131, 0.9843137, 0, 1, 1,
0.946249, -0.04267326, 2.114764, 0.9921569, 0, 1, 1,
0.9520169, 0.2341227, 0.7664897, 0.9960784, 0, 1, 1,
0.9544662, 1.040023, -0.06382322, 1, 0, 0.9960784, 1,
0.9569142, -0.3078404, 2.437569, 1, 0, 0.9882353, 1,
0.956958, 0.3977439, 1.694521, 1, 0, 0.9843137, 1,
0.9584019, -1.735641, 2.395024, 1, 0, 0.9764706, 1,
0.960144, 1.022854, -1.442046, 1, 0, 0.972549, 1,
0.9659927, 1.998624, 0.4992661, 1, 0, 0.9647059, 1,
0.966598, 0.0353776, 2.1537, 1, 0, 0.9607843, 1,
0.9698468, 2.497105, 2.008204, 1, 0, 0.9529412, 1,
0.9701346, 1.147071, 0.307509, 1, 0, 0.9490196, 1,
0.970807, -1.248788, 2.625113, 1, 0, 0.9411765, 1,
0.9779385, 0.4952965, 0.9099854, 1, 0, 0.9372549, 1,
0.9794705, 1.406073, -0.6872036, 1, 0, 0.9294118, 1,
0.9823282, 0.6893896, 3.077884, 1, 0, 0.9254902, 1,
0.9863374, -0.2309337, 0.668483, 1, 0, 0.9176471, 1,
0.9871674, -0.5975587, 1.887811, 1, 0, 0.9137255, 1,
0.9943898, -0.5229795, 4.172038, 1, 0, 0.9058824, 1,
0.9969051, 0.4071382, 1.37632, 1, 0, 0.9019608, 1,
0.9973579, 0.7719883, 1.580985, 1, 0, 0.8941177, 1,
1.00045, 0.8240334, 1.140913, 1, 0, 0.8862745, 1,
1.007592, -3.031658, 3.313545, 1, 0, 0.8823529, 1,
1.01428, 1.956751, 1.002532, 1, 0, 0.8745098, 1,
1.014879, -0.8015042, 0.9623494, 1, 0, 0.8705882, 1,
1.035344, 0.02061196, 0.9733469, 1, 0, 0.8627451, 1,
1.045352, -1.093221, 3.209342, 1, 0, 0.8588235, 1,
1.04696, -0.5239998, 1.760464, 1, 0, 0.8509804, 1,
1.049083, 0.13059, 0.2678886, 1, 0, 0.8470588, 1,
1.057804, -1.375448, 3.120118, 1, 0, 0.8392157, 1,
1.076565, -0.5475677, 1.967237, 1, 0, 0.8352941, 1,
1.085416, 1.253656, 2.270551, 1, 0, 0.827451, 1,
1.090333, -0.6799412, -0.1414703, 1, 0, 0.8235294, 1,
1.100958, 0.1264207, 0.9790365, 1, 0, 0.8156863, 1,
1.103616, -0.0515152, 1.386934, 1, 0, 0.8117647, 1,
1.107477, 1.05607, 0.7688962, 1, 0, 0.8039216, 1,
1.112292, 1.774894, -0.4990244, 1, 0, 0.7960784, 1,
1.123294, -0.4564152, 2.497988, 1, 0, 0.7921569, 1,
1.127034, 0.2379651, -0.03676598, 1, 0, 0.7843137, 1,
1.127736, -0.1397301, -0.9875026, 1, 0, 0.7803922, 1,
1.131912, -1.575333, 2.056179, 1, 0, 0.772549, 1,
1.133917, 1.2807, 0.2541562, 1, 0, 0.7686275, 1,
1.138991, -1.154825, 2.242426, 1, 0, 0.7607843, 1,
1.149109, -0.09313671, 1.769956, 1, 0, 0.7568628, 1,
1.153123, 1.2041, -0.9695916, 1, 0, 0.7490196, 1,
1.164672, 1.3225, 1.289134, 1, 0, 0.7450981, 1,
1.165434, -1.327147, 2.874731, 1, 0, 0.7372549, 1,
1.166513, 0.7082468, 0.8473936, 1, 0, 0.7333333, 1,
1.19853, -0.3807104, 2.867188, 1, 0, 0.7254902, 1,
1.199975, 0.4014906, 3.932017, 1, 0, 0.7215686, 1,
1.2049, -1.693868, 1.201376, 1, 0, 0.7137255, 1,
1.212707, -0.5967029, 3.371591, 1, 0, 0.7098039, 1,
1.213558, 1.340382, 0.7961584, 1, 0, 0.7019608, 1,
1.214433, 1.78095, 1.037031, 1, 0, 0.6941177, 1,
1.21483, 1.020391, 0.4449174, 1, 0, 0.6901961, 1,
1.220402, 0.2370208, 2.29545, 1, 0, 0.682353, 1,
1.221856, -0.2068721, 1.209087, 1, 0, 0.6784314, 1,
1.229685, -0.3813915, 2.908356, 1, 0, 0.6705883, 1,
1.229794, 0.3349867, 0.1532752, 1, 0, 0.6666667, 1,
1.237755, -1.031403, 2.742799, 1, 0, 0.6588235, 1,
1.238571, -0.6487567, 3.421989, 1, 0, 0.654902, 1,
1.24986, -0.5855222, 0.9319305, 1, 0, 0.6470588, 1,
1.250001, 3.115111, -0.02150783, 1, 0, 0.6431373, 1,
1.265139, 1.806062, -1.175922, 1, 0, 0.6352941, 1,
1.269366, -0.5317706, 2.850961, 1, 0, 0.6313726, 1,
1.271313, 0.07375708, 2.06732, 1, 0, 0.6235294, 1,
1.276295, 0.3038977, -0.1386324, 1, 0, 0.6196079, 1,
1.282755, 0.8205198, 0.4771376, 1, 0, 0.6117647, 1,
1.30623, -0.3863449, 1.821035, 1, 0, 0.6078432, 1,
1.306802, -0.09158908, 0.8738362, 1, 0, 0.6, 1,
1.323605, -1.965099, 4.017585, 1, 0, 0.5921569, 1,
1.3332, -0.87991, 1.748762, 1, 0, 0.5882353, 1,
1.339769, 0.702382, 2.946477, 1, 0, 0.5803922, 1,
1.345783, -0.5183071, 2.065058, 1, 0, 0.5764706, 1,
1.348393, 0.1848723, 1.818599, 1, 0, 0.5686275, 1,
1.349925, 0.1416293, 1.61839, 1, 0, 0.5647059, 1,
1.35036, -0.9784243, 2.397314, 1, 0, 0.5568628, 1,
1.355651, 1.367996, -1.439859, 1, 0, 0.5529412, 1,
1.35643, -1.116017, 2.547688, 1, 0, 0.5450981, 1,
1.377082, 0.2663996, -0.267489, 1, 0, 0.5411765, 1,
1.379439, 0.2577708, 2.627902, 1, 0, 0.5333334, 1,
1.381762, -0.7520643, 1.981915, 1, 0, 0.5294118, 1,
1.387026, -0.3568349, 1.869741, 1, 0, 0.5215687, 1,
1.396896, -1.67958, 3.930481, 1, 0, 0.5176471, 1,
1.397118, 0.0006421967, 1.072658, 1, 0, 0.509804, 1,
1.410787, -1.987102, 3.69837, 1, 0, 0.5058824, 1,
1.420212, -0.7754374, 2.198832, 1, 0, 0.4980392, 1,
1.426234, 0.6484898, 2.110527, 1, 0, 0.4901961, 1,
1.432444, -1.178756, 1.693979, 1, 0, 0.4862745, 1,
1.435062, 1.301364, 0.7000275, 1, 0, 0.4784314, 1,
1.435217, -1.66113, 2.094882, 1, 0, 0.4745098, 1,
1.443763, 1.0582, 0.1539063, 1, 0, 0.4666667, 1,
1.44553, -2.454382, 3.493123, 1, 0, 0.4627451, 1,
1.449819, -1.072528, 4.239697, 1, 0, 0.454902, 1,
1.451829, 1.102067, 1.013384, 1, 0, 0.4509804, 1,
1.453905, -0.4024987, 2.642344, 1, 0, 0.4431373, 1,
1.454504, 0.92162, 1.081765, 1, 0, 0.4392157, 1,
1.47653, -0.04082349, -0.3548426, 1, 0, 0.4313726, 1,
1.485316, -0.993344, 2.221721, 1, 0, 0.427451, 1,
1.492336, 0.6940194, 0.03552045, 1, 0, 0.4196078, 1,
1.494601, -0.3592076, 1.392368, 1, 0, 0.4156863, 1,
1.497126, 1.428403, 0.5278648, 1, 0, 0.4078431, 1,
1.515648, -0.370963, 1.133075, 1, 0, 0.4039216, 1,
1.520247, 1.212719, 0.339688, 1, 0, 0.3960784, 1,
1.529678, -0.7891074, 2.262433, 1, 0, 0.3882353, 1,
1.532517, 0.2871484, 1.385283, 1, 0, 0.3843137, 1,
1.549989, 0.3205589, 2.383793, 1, 0, 0.3764706, 1,
1.553339, 0.08338341, 1.712134, 1, 0, 0.372549, 1,
1.553677, 1.281871, -1.170891, 1, 0, 0.3647059, 1,
1.561861, 0.5192213, 1.483932, 1, 0, 0.3607843, 1,
1.565195, 1.21726, 1.60445, 1, 0, 0.3529412, 1,
1.574604, 0.05463133, 2.411767, 1, 0, 0.3490196, 1,
1.575759, 0.193206, 1.873622, 1, 0, 0.3411765, 1,
1.575819, -1.175089, 4.625755, 1, 0, 0.3372549, 1,
1.584614, 1.75722, 0.8937831, 1, 0, 0.3294118, 1,
1.595157, 1.686465, 2.950925, 1, 0, 0.3254902, 1,
1.596468, -0.7081687, 3.650833, 1, 0, 0.3176471, 1,
1.599547, 0.3895484, 0.3443641, 1, 0, 0.3137255, 1,
1.628048, -0.5983428, 2.82594, 1, 0, 0.3058824, 1,
1.630853, 1.240559, 0.9118201, 1, 0, 0.2980392, 1,
1.634703, -0.08597133, 3.374736, 1, 0, 0.2941177, 1,
1.639269, 1.656446, 1.113948, 1, 0, 0.2862745, 1,
1.641654, 0.3330193, 1.143367, 1, 0, 0.282353, 1,
1.657498, 1.491072, 1.377325, 1, 0, 0.2745098, 1,
1.671857, -0.2874486, 1.730136, 1, 0, 0.2705882, 1,
1.674312, -0.3466442, 3.318426, 1, 0, 0.2627451, 1,
1.676871, 0.190005, 3.004836, 1, 0, 0.2588235, 1,
1.67866, 0.4248071, 2.236623, 1, 0, 0.2509804, 1,
1.700299, -0.3673151, 0.8643654, 1, 0, 0.2470588, 1,
1.757476, 0.6749101, 1.069474, 1, 0, 0.2392157, 1,
1.810891, -0.6314709, 1.75462, 1, 0, 0.2352941, 1,
1.828881, -0.8014873, 1.846168, 1, 0, 0.227451, 1,
1.845279, -1.522303, 1.755497, 1, 0, 0.2235294, 1,
1.859568, -2.699444, 2.650692, 1, 0, 0.2156863, 1,
1.863845, -0.8463024, 3.60773, 1, 0, 0.2117647, 1,
1.881784, 0.5674433, 1.99329, 1, 0, 0.2039216, 1,
1.90394, -1.994128, 2.262504, 1, 0, 0.1960784, 1,
1.910715, 0.05958369, 0.5792421, 1, 0, 0.1921569, 1,
1.912277, -0.08068994, 1.908995, 1, 0, 0.1843137, 1,
1.915785, -1.764034, 0.2854855, 1, 0, 0.1803922, 1,
1.917745, -0.2819116, 1.723911, 1, 0, 0.172549, 1,
1.929307, -1.64889, 3.578644, 1, 0, 0.1686275, 1,
1.949865, -1.846938, 1.194646, 1, 0, 0.1607843, 1,
1.959634, 1.274594, -0.5968864, 1, 0, 0.1568628, 1,
2.012458, -0.241328, 0.944313, 1, 0, 0.1490196, 1,
2.027457, 0.6000782, 1.014752, 1, 0, 0.145098, 1,
2.034255, -0.4304248, 2.243912, 1, 0, 0.1372549, 1,
2.039884, 0.6877833, 2.018716, 1, 0, 0.1333333, 1,
2.07581, -1.177737, 3.464408, 1, 0, 0.1254902, 1,
2.115603, -0.00669079, 2.857696, 1, 0, 0.1215686, 1,
2.178884, -0.4555727, 1.459004, 1, 0, 0.1137255, 1,
2.192365, 0.8366756, 2.539001, 1, 0, 0.1098039, 1,
2.240073, 0.7799817, 1.426313, 1, 0, 0.1019608, 1,
2.243084, -0.1489411, 2.385442, 1, 0, 0.09411765, 1,
2.278994, -0.6762661, 2.171734, 1, 0, 0.09019608, 1,
2.333576, 0.3846781, 1.789216, 1, 0, 0.08235294, 1,
2.378895, 0.09953409, 0.8379487, 1, 0, 0.07843138, 1,
2.386817, -0.5878444, 2.417308, 1, 0, 0.07058824, 1,
2.402098, 1.101116, 1.90539, 1, 0, 0.06666667, 1,
2.410958, -1.312381, 1.992556, 1, 0, 0.05882353, 1,
2.452915, -0.1603526, 2.001806, 1, 0, 0.05490196, 1,
2.482323, -1.294923, 1.006734, 1, 0, 0.04705882, 1,
2.485816, 0.26784, 1.846536, 1, 0, 0.04313726, 1,
2.497682, 0.5647479, 0.3841821, 1, 0, 0.03529412, 1,
2.524526, -0.08290005, 1.59843, 1, 0, 0.03137255, 1,
2.557176, -0.6863289, 2.064487, 1, 0, 0.02352941, 1,
2.771645, 1.509023, 1.922887, 1, 0, 0.01960784, 1,
2.849278, -0.7877232, 2.770699, 1, 0, 0.01176471, 1,
3.424566, 0.5304722, 2.299024, 1, 0, 0.007843138, 1
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
-0.2402076, -4.206269, -6.231452, 0, -0.5, 0.5, 0.5,
-0.2402076, -4.206269, -6.231452, 1, -0.5, 0.5, 0.5,
-0.2402076, -4.206269, -6.231452, 1, 1.5, 0.5, 0.5,
-0.2402076, -4.206269, -6.231452, 0, 1.5, 0.5, 0.5
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
-5.147339, 0.02940845, -6.231452, 0, -0.5, 0.5, 0.5,
-5.147339, 0.02940845, -6.231452, 1, -0.5, 0.5, 0.5,
-5.147339, 0.02940845, -6.231452, 1, 1.5, 0.5, 0.5,
-5.147339, 0.02940845, -6.231452, 0, 1.5, 0.5, 0.5
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
-5.147339, -4.206269, 0.4796767, 0, -0.5, 0.5, 0.5,
-5.147339, -4.206269, 0.4796767, 1, -0.5, 0.5, 0.5,
-5.147339, -4.206269, 0.4796767, 1, 1.5, 0.5, 0.5,
-5.147339, -4.206269, 0.4796767, 0, 1.5, 0.5, 0.5
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
-2, -3.228805, -4.68273,
2, -3.228805, -4.68273,
-2, -3.228805, -4.68273,
-2, -3.391716, -4.94085,
0, -3.228805, -4.68273,
0, -3.391716, -4.94085,
2, -3.228805, -4.68273,
2, -3.391716, -4.94085
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
-2, -3.717537, -5.457091, 0, -0.5, 0.5, 0.5,
-2, -3.717537, -5.457091, 1, -0.5, 0.5, 0.5,
-2, -3.717537, -5.457091, 1, 1.5, 0.5, 0.5,
-2, -3.717537, -5.457091, 0, 1.5, 0.5, 0.5,
0, -3.717537, -5.457091, 0, -0.5, 0.5, 0.5,
0, -3.717537, -5.457091, 1, -0.5, 0.5, 0.5,
0, -3.717537, -5.457091, 1, 1.5, 0.5, 0.5,
0, -3.717537, -5.457091, 0, 1.5, 0.5, 0.5,
2, -3.717537, -5.457091, 0, -0.5, 0.5, 0.5,
2, -3.717537, -5.457091, 1, -0.5, 0.5, 0.5,
2, -3.717537, -5.457091, 1, 1.5, 0.5, 0.5,
2, -3.717537, -5.457091, 0, 1.5, 0.5, 0.5
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
-4.014924, -3, -4.68273,
-4.014924, 3, -4.68273,
-4.014924, -3, -4.68273,
-4.20366, -3, -4.94085,
-4.014924, -2, -4.68273,
-4.20366, -2, -4.94085,
-4.014924, -1, -4.68273,
-4.20366, -1, -4.94085,
-4.014924, 0, -4.68273,
-4.20366, 0, -4.94085,
-4.014924, 1, -4.68273,
-4.20366, 1, -4.94085,
-4.014924, 2, -4.68273,
-4.20366, 2, -4.94085,
-4.014924, 3, -4.68273,
-4.20366, 3, -4.94085
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
-4.581131, -3, -5.457091, 0, -0.5, 0.5, 0.5,
-4.581131, -3, -5.457091, 1, -0.5, 0.5, 0.5,
-4.581131, -3, -5.457091, 1, 1.5, 0.5, 0.5,
-4.581131, -3, -5.457091, 0, 1.5, 0.5, 0.5,
-4.581131, -2, -5.457091, 0, -0.5, 0.5, 0.5,
-4.581131, -2, -5.457091, 1, -0.5, 0.5, 0.5,
-4.581131, -2, -5.457091, 1, 1.5, 0.5, 0.5,
-4.581131, -2, -5.457091, 0, 1.5, 0.5, 0.5,
-4.581131, -1, -5.457091, 0, -0.5, 0.5, 0.5,
-4.581131, -1, -5.457091, 1, -0.5, 0.5, 0.5,
-4.581131, -1, -5.457091, 1, 1.5, 0.5, 0.5,
-4.581131, -1, -5.457091, 0, 1.5, 0.5, 0.5,
-4.581131, 0, -5.457091, 0, -0.5, 0.5, 0.5,
-4.581131, 0, -5.457091, 1, -0.5, 0.5, 0.5,
-4.581131, 0, -5.457091, 1, 1.5, 0.5, 0.5,
-4.581131, 0, -5.457091, 0, 1.5, 0.5, 0.5,
-4.581131, 1, -5.457091, 0, -0.5, 0.5, 0.5,
-4.581131, 1, -5.457091, 1, -0.5, 0.5, 0.5,
-4.581131, 1, -5.457091, 1, 1.5, 0.5, 0.5,
-4.581131, 1, -5.457091, 0, 1.5, 0.5, 0.5,
-4.581131, 2, -5.457091, 0, -0.5, 0.5, 0.5,
-4.581131, 2, -5.457091, 1, -0.5, 0.5, 0.5,
-4.581131, 2, -5.457091, 1, 1.5, 0.5, 0.5,
-4.581131, 2, -5.457091, 0, 1.5, 0.5, 0.5,
-4.581131, 3, -5.457091, 0, -0.5, 0.5, 0.5,
-4.581131, 3, -5.457091, 1, -0.5, 0.5, 0.5,
-4.581131, 3, -5.457091, 1, 1.5, 0.5, 0.5,
-4.581131, 3, -5.457091, 0, 1.5, 0.5, 0.5
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
-4.014924, -3.228805, -4,
-4.014924, -3.228805, 4,
-4.014924, -3.228805, -4,
-4.20366, -3.391716, -4,
-4.014924, -3.228805, -2,
-4.20366, -3.391716, -2,
-4.014924, -3.228805, 0,
-4.20366, -3.391716, 0,
-4.014924, -3.228805, 2,
-4.20366, -3.391716, 2,
-4.014924, -3.228805, 4,
-4.20366, -3.391716, 4
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
-4.581131, -3.717537, -4, 0, -0.5, 0.5, 0.5,
-4.581131, -3.717537, -4, 1, -0.5, 0.5, 0.5,
-4.581131, -3.717537, -4, 1, 1.5, 0.5, 0.5,
-4.581131, -3.717537, -4, 0, 1.5, 0.5, 0.5,
-4.581131, -3.717537, -2, 0, -0.5, 0.5, 0.5,
-4.581131, -3.717537, -2, 1, -0.5, 0.5, 0.5,
-4.581131, -3.717537, -2, 1, 1.5, 0.5, 0.5,
-4.581131, -3.717537, -2, 0, 1.5, 0.5, 0.5,
-4.581131, -3.717537, 0, 0, -0.5, 0.5, 0.5,
-4.581131, -3.717537, 0, 1, -0.5, 0.5, 0.5,
-4.581131, -3.717537, 0, 1, 1.5, 0.5, 0.5,
-4.581131, -3.717537, 0, 0, 1.5, 0.5, 0.5,
-4.581131, -3.717537, 2, 0, -0.5, 0.5, 0.5,
-4.581131, -3.717537, 2, 1, -0.5, 0.5, 0.5,
-4.581131, -3.717537, 2, 1, 1.5, 0.5, 0.5,
-4.581131, -3.717537, 2, 0, 1.5, 0.5, 0.5,
-4.581131, -3.717537, 4, 0, -0.5, 0.5, 0.5,
-4.581131, -3.717537, 4, 1, -0.5, 0.5, 0.5,
-4.581131, -3.717537, 4, 1, 1.5, 0.5, 0.5,
-4.581131, -3.717537, 4, 0, 1.5, 0.5, 0.5
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
-4.014924, -3.228805, -4.68273,
-4.014924, 3.287622, -4.68273,
-4.014924, -3.228805, 5.642084,
-4.014924, 3.287622, 5.642084,
-4.014924, -3.228805, -4.68273,
-4.014924, -3.228805, 5.642084,
-4.014924, 3.287622, -4.68273,
-4.014924, 3.287622, 5.642084,
-4.014924, -3.228805, -4.68273,
3.534509, -3.228805, -4.68273,
-4.014924, -3.228805, 5.642084,
3.534509, -3.228805, 5.642084,
-4.014924, 3.287622, -4.68273,
3.534509, 3.287622, -4.68273,
-4.014924, 3.287622, 5.642084,
3.534509, 3.287622, 5.642084,
3.534509, -3.228805, -4.68273,
3.534509, 3.287622, -4.68273,
3.534509, -3.228805, 5.642084,
3.534509, 3.287622, 5.642084,
3.534509, -3.228805, -4.68273,
3.534509, -3.228805, 5.642084,
3.534509, 3.287622, -4.68273,
3.534509, 3.287622, 5.642084
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
var radius = 7.665171;
var distance = 34.10321;
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
mvMatrix.translate( 0.2402076, -0.02940845, -0.4796767 );
mvMatrix.scale( 1.097795, 1.271821, 0.8027005 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.10321);
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
isopropylammonium<-read.table("isopropylammonium.xyz")
```

```
## Error in read.table("isopropylammonium.xyz"): no lines available in input
```

```r
x<-isopropylammonium$V2
```

```
## Error in eval(expr, envir, enclos): object 'isopropylammonium' not found
```

```r
y<-isopropylammonium$V3
```

```
## Error in eval(expr, envir, enclos): object 'isopropylammonium' not found
```

```r
z<-isopropylammonium$V4
```

```
## Error in eval(expr, envir, enclos): object 'isopropylammonium' not found
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
-3.904981, 1.817676, -1.580631, 0, 0, 1, 1, 1,
-3.174426, -0.04658743, -2.025987, 1, 0, 0, 1, 1,
-2.779979, 0.1025871, -1.211031, 1, 0, 0, 1, 1,
-2.695488, 0.3112074, -3.390932, 1, 0, 0, 1, 1,
-2.588808, 1.436766, -0.9941195, 1, 0, 0, 1, 1,
-2.571217, 0.9208523, -0.9315872, 1, 0, 0, 1, 1,
-2.477956, 2.212169, -1.176219, 0, 0, 0, 1, 1,
-2.451481, 0.6790059, 0.05536211, 0, 0, 0, 1, 1,
-2.334146, -1.057392, -2.073467, 0, 0, 0, 1, 1,
-2.171368, 0.7592626, -0.5028246, 0, 0, 0, 1, 1,
-2.167563, 0.7637993, -2.939595, 0, 0, 0, 1, 1,
-2.131563, -1.79121, -1.997188, 0, 0, 0, 1, 1,
-2.121128, 1.753603, 0.8421086, 0, 0, 0, 1, 1,
-2.100586, 1.114893, -1.481536, 1, 1, 1, 1, 1,
-2.098494, -0.7322636, -1.88716, 1, 1, 1, 1, 1,
-2.088954, -0.3629453, -0.1575353, 1, 1, 1, 1, 1,
-2.088411, 1.079918, -1.349429, 1, 1, 1, 1, 1,
-2.087531, 0.5729178, -2.055973, 1, 1, 1, 1, 1,
-2.081559, 0.3764377, 0.03945434, 1, 1, 1, 1, 1,
-2.076863, 3.115582, -1.831801, 1, 1, 1, 1, 1,
-2.071339, 0.3168224, -1.481667, 1, 1, 1, 1, 1,
-2.027194, -0.06803834, -4.325302, 1, 1, 1, 1, 1,
-2.022115, 1.161934, -0.9486765, 1, 1, 1, 1, 1,
-2.016705, 0.7764472, 0.1271371, 1, 1, 1, 1, 1,
-1.987039, 0.1283171, -2.529989, 1, 1, 1, 1, 1,
-1.970563, -0.1696552, -1.359656, 1, 1, 1, 1, 1,
-1.95978, 0.557626, -2.557514, 1, 1, 1, 1, 1,
-1.955056, -0.4205841, -1.091898, 1, 1, 1, 1, 1,
-1.938135, -1.384254, -2.472675, 0, 0, 1, 1, 1,
-1.920378, 1.301673, -4.092208, 1, 0, 0, 1, 1,
-1.903828, 0.75068, -0.4765791, 1, 0, 0, 1, 1,
-1.878051, 1.346792, -3.45603, 1, 0, 0, 1, 1,
-1.863134, -0.9139358, -1.980735, 1, 0, 0, 1, 1,
-1.859531, -0.6690599, -2.703437, 1, 0, 0, 1, 1,
-1.850647, 0.79857, 0.9483153, 0, 0, 0, 1, 1,
-1.845207, 0.1800365, -0.3631716, 0, 0, 0, 1, 1,
-1.796902, 2.300547, 1.335224, 0, 0, 0, 1, 1,
-1.749956, 1.534586, -0.6017048, 0, 0, 0, 1, 1,
-1.718293, -0.5944805, -2.421103, 0, 0, 0, 1, 1,
-1.707535, 0.02879161, -0.8116085, 0, 0, 0, 1, 1,
-1.701101, 0.6144589, -0.7286713, 0, 0, 0, 1, 1,
-1.692738, -1.778809, -0.8667762, 1, 1, 1, 1, 1,
-1.684914, 2.387219, -0.2691873, 1, 1, 1, 1, 1,
-1.661391, -1.797793, -1.753682, 1, 1, 1, 1, 1,
-1.628023, 0.6272946, -1.333968, 1, 1, 1, 1, 1,
-1.625041, 0.1824436, -1.148509, 1, 1, 1, 1, 1,
-1.60779, 0.4590149, -0.7461684, 1, 1, 1, 1, 1,
-1.603792, -0.76931, -2.909874, 1, 1, 1, 1, 1,
-1.603052, -1.627698, -1.436896, 1, 1, 1, 1, 1,
-1.594921, 0.4397628, -2.54362, 1, 1, 1, 1, 1,
-1.590486, -0.3255034, 0.9199049, 1, 1, 1, 1, 1,
-1.586089, -0.9477156, -3.411272, 1, 1, 1, 1, 1,
-1.581843, 0.1849575, -1.80954, 1, 1, 1, 1, 1,
-1.572014, -1.177772, -0.7569072, 1, 1, 1, 1, 1,
-1.547266, -0.6499732, -1.953961, 1, 1, 1, 1, 1,
-1.546126, 0.06956, -0.5323923, 1, 1, 1, 1, 1,
-1.542894, -0.4619585, -2.210792, 0, 0, 1, 1, 1,
-1.542407, -0.1334015, -1.687789, 1, 0, 0, 1, 1,
-1.540076, 0.8378684, 0.4922166, 1, 0, 0, 1, 1,
-1.539535, 0.2633463, -2.771433, 1, 0, 0, 1, 1,
-1.534869, 0.7133373, -2.731823, 1, 0, 0, 1, 1,
-1.53057, -0.09227598, 0.04188401, 1, 0, 0, 1, 1,
-1.52852, -0.8330827, -1.856275, 0, 0, 0, 1, 1,
-1.51576, 0.7823251, -3.565499, 0, 0, 0, 1, 1,
-1.500968, -0.846927, -1.523781, 0, 0, 0, 1, 1,
-1.500353, 0.8410459, 0.2717435, 0, 0, 0, 1, 1,
-1.496942, -0.2455998, -3.021301, 0, 0, 0, 1, 1,
-1.474808, -0.6478289, -3.749279, 0, 0, 0, 1, 1,
-1.474055, -1.459242, -1.389463, 0, 0, 0, 1, 1,
-1.458895, 0.5698723, -0.229994, 1, 1, 1, 1, 1,
-1.434753, 0.3559023, -2.420549, 1, 1, 1, 1, 1,
-1.434501, 2.008147, -1.34109, 1, 1, 1, 1, 1,
-1.414751, -0.157216, -1.200388, 1, 1, 1, 1, 1,
-1.410465, -0.5246978, -2.378697, 1, 1, 1, 1, 1,
-1.409653, -1.993282, -1.500661, 1, 1, 1, 1, 1,
-1.405985, -0.6506134, -2.321261, 1, 1, 1, 1, 1,
-1.405771, 0.5647895, 0.606771, 1, 1, 1, 1, 1,
-1.399117, 0.1058843, -1.159524, 1, 1, 1, 1, 1,
-1.397065, -0.05686547, -1.982772, 1, 1, 1, 1, 1,
-1.395519, 2.680474, 1.157426, 1, 1, 1, 1, 1,
-1.368693, 0.9525368, -0.8572655, 1, 1, 1, 1, 1,
-1.36817, 0.2345307, -0.7438686, 1, 1, 1, 1, 1,
-1.368076, -0.6211836, -1.927842, 1, 1, 1, 1, 1,
-1.357808, 1.345012, 0.4191159, 1, 1, 1, 1, 1,
-1.353991, 1.376463, -0.3340508, 0, 0, 1, 1, 1,
-1.352125, 0.2417873, -1.809975, 1, 0, 0, 1, 1,
-1.350857, 0.7258943, -0.469114, 1, 0, 0, 1, 1,
-1.346924, -1.125192, -3.132146, 1, 0, 0, 1, 1,
-1.343049, 1.146675, -1.397985, 1, 0, 0, 1, 1,
-1.342178, -1.326553, -2.665774, 1, 0, 0, 1, 1,
-1.336621, 1.093718, -0.4184745, 0, 0, 0, 1, 1,
-1.333067, 2.334071, 0.6479886, 0, 0, 0, 1, 1,
-1.319401, 0.09020154, -2.005307, 0, 0, 0, 1, 1,
-1.316704, 0.9315284, -0.001542092, 0, 0, 0, 1, 1,
-1.309363, -0.5755711, -1.566226, 0, 0, 0, 1, 1,
-1.302881, 1.470775, -0.115953, 0, 0, 0, 1, 1,
-1.300132, -0.3391039, -2.827063, 0, 0, 0, 1, 1,
-1.293773, -1.204033, -2.540635, 1, 1, 1, 1, 1,
-1.29073, 0.5406354, -2.636939, 1, 1, 1, 1, 1,
-1.290593, -1.356787, -3.212306, 1, 1, 1, 1, 1,
-1.282906, -1.090858, -2.436861, 1, 1, 1, 1, 1,
-1.278896, -0.1441046, -0.6069872, 1, 1, 1, 1, 1,
-1.267849, 0.1114946, -0.605846, 1, 1, 1, 1, 1,
-1.266136, 1.812884, 1.724722, 1, 1, 1, 1, 1,
-1.24719, 0.7627048, -0.5547495, 1, 1, 1, 1, 1,
-1.236574, -0.2161403, -0.8723086, 1, 1, 1, 1, 1,
-1.235755, 0.8022585, -0.9878691, 1, 1, 1, 1, 1,
-1.234818, -0.6914569, -2.627562, 1, 1, 1, 1, 1,
-1.231834, 1.994363, 0.1597222, 1, 1, 1, 1, 1,
-1.225458, 0.5802346, -1.955633, 1, 1, 1, 1, 1,
-1.203338, -0.7243667, -1.260095, 1, 1, 1, 1, 1,
-1.202107, -0.0220685, -1.511838, 1, 1, 1, 1, 1,
-1.19914, -0.3590886, 0.1722202, 0, 0, 1, 1, 1,
-1.190379, 0.7755499, 0.4079576, 1, 0, 0, 1, 1,
-1.187942, -0.6713848, -3.39696, 1, 0, 0, 1, 1,
-1.183782, 1.028031, -0.5305082, 1, 0, 0, 1, 1,
-1.157272, -0.8678066, -3.085097, 1, 0, 0, 1, 1,
-1.156606, 0.132595, -0.450777, 1, 0, 0, 1, 1,
-1.152303, -0.408336, -2.518996, 0, 0, 0, 1, 1,
-1.152046, 0.6050414, -1.353751, 0, 0, 0, 1, 1,
-1.147672, 1.38333, 0.1874329, 0, 0, 0, 1, 1,
-1.136833, 0.01738892, -2.584919, 0, 0, 0, 1, 1,
-1.133823, 1.680786, -0.402134, 0, 0, 0, 1, 1,
-1.132123, -0.670825, -2.054839, 0, 0, 0, 1, 1,
-1.127926, 0.7730981, -0.4572664, 0, 0, 0, 1, 1,
-1.124897, 0.3575886, -1.511873, 1, 1, 1, 1, 1,
-1.124386, 0.3710237, -0.8426958, 1, 1, 1, 1, 1,
-1.122294, 0.1937567, 0.6415079, 1, 1, 1, 1, 1,
-1.12142, -1.274005, 1.107626, 1, 1, 1, 1, 1,
-1.117736, -0.8347446, -2.097213, 1, 1, 1, 1, 1,
-1.109279, -0.199959, -0.2118298, 1, 1, 1, 1, 1,
-1.106047, 0.6510388, -2.123616, 1, 1, 1, 1, 1,
-1.104774, 0.3054058, -1.918083, 1, 1, 1, 1, 1,
-1.09834, -1.353556, -4.265416, 1, 1, 1, 1, 1,
-1.09418, 0.07713158, -0.6870709, 1, 1, 1, 1, 1,
-1.092874, -0.5267567, -2.786419, 1, 1, 1, 1, 1,
-1.090764, -0.8945475, -2.915144, 1, 1, 1, 1, 1,
-1.079817, -0.554033, -2.050963, 1, 1, 1, 1, 1,
-1.073054, 0.7283086, -1.273118, 1, 1, 1, 1, 1,
-1.057659, 0.4276754, -1.671328, 1, 1, 1, 1, 1,
-1.054709, -0.2045829, -2.168907, 0, 0, 1, 1, 1,
-1.048452, 0.02305523, -1.037863, 1, 0, 0, 1, 1,
-1.045613, -0.797509, -2.217954, 1, 0, 0, 1, 1,
-1.045566, 0.5488074, -0.3264555, 1, 0, 0, 1, 1,
-1.043051, -0.9993533, -0.359817, 1, 0, 0, 1, 1,
-1.038833, -1.193987, -1.621449, 1, 0, 0, 1, 1,
-1.037571, 0.8568305, -1.513221, 0, 0, 0, 1, 1,
-1.037097, -1.272115, -3.680618, 0, 0, 0, 1, 1,
-1.034418, -0.8994274, -3.011649, 0, 0, 0, 1, 1,
-1.032645, -1.000914, -1.418904, 0, 0, 0, 1, 1,
-1.032438, 0.8414258, -1.932344, 0, 0, 0, 1, 1,
-1.020783, -2.285273, -2.205588, 0, 0, 0, 1, 1,
-1.01983, 0.5064827, -1.100561, 0, 0, 0, 1, 1,
-1.018648, 1.298785, 0.7144164, 1, 1, 1, 1, 1,
-1.010985, 0.4823093, -1.519971, 1, 1, 1, 1, 1,
-1.004881, -0.429866, -0.6053792, 1, 1, 1, 1, 1,
-1.003611, 0.3489545, -0.2149916, 1, 1, 1, 1, 1,
-1.001441, 0.5599008, -1.797944, 1, 1, 1, 1, 1,
-1.001436, 0.3855613, -1.910332, 1, 1, 1, 1, 1,
-0.9946771, -0.6355584, -1.19592, 1, 1, 1, 1, 1,
-0.992231, 1.757857, -1.599132, 1, 1, 1, 1, 1,
-0.9908676, 0.2156015, -0.6335223, 1, 1, 1, 1, 1,
-0.9907014, 0.003124541, -1.992576, 1, 1, 1, 1, 1,
-0.985846, -0.5097433, -1.363279, 1, 1, 1, 1, 1,
-0.9848353, -0.2342367, -2.621579, 1, 1, 1, 1, 1,
-0.9787726, 0.1102516, -1.076216, 1, 1, 1, 1, 1,
-0.9774414, -0.3674082, -2.485882, 1, 1, 1, 1, 1,
-0.9735613, -0.551405, -3.268085, 1, 1, 1, 1, 1,
-0.9652028, 1.408301, -0.1834727, 0, 0, 1, 1, 1,
-0.9647235, 1.263082, -2.716869, 1, 0, 0, 1, 1,
-0.9597418, -0.2702821, -1.02961, 1, 0, 0, 1, 1,
-0.9592404, -0.7963817, -1.23162, 1, 0, 0, 1, 1,
-0.9514837, 2.029967, -0.2702933, 1, 0, 0, 1, 1,
-0.9500102, -0.8522353, -1.391416, 1, 0, 0, 1, 1,
-0.9392703, -1.808797, -1.316161, 0, 0, 0, 1, 1,
-0.9373593, -0.9695597, -2.190674, 0, 0, 0, 1, 1,
-0.9373147, 3.192723, 0.06241167, 0, 0, 0, 1, 1,
-0.9350535, 1.085113, -1.098063, 0, 0, 0, 1, 1,
-0.9347883, 1.207361, -1.147878, 0, 0, 0, 1, 1,
-0.9342219, 0.2182467, -0.7916775, 0, 0, 0, 1, 1,
-0.9281616, -0.1082731, -0.8377159, 0, 0, 0, 1, 1,
-0.9216383, 0.1806643, 0.4031405, 1, 1, 1, 1, 1,
-0.9120261, -0.1704094, -2.023826, 1, 1, 1, 1, 1,
-0.9089131, 0.04062399, -1.032478, 1, 1, 1, 1, 1,
-0.9068231, 0.8864229, -0.2875518, 1, 1, 1, 1, 1,
-0.9058248, -0.1147958, -2.134336, 1, 1, 1, 1, 1,
-0.9021078, -0.4310701, -1.97662, 1, 1, 1, 1, 1,
-0.9019612, -1.653996, -2.968791, 1, 1, 1, 1, 1,
-0.8968462, 0.04606532, -1.658352, 1, 1, 1, 1, 1,
-0.8937756, -0.08403495, -1.780075, 1, 1, 1, 1, 1,
-0.8856542, -1.709864, -3.16158, 1, 1, 1, 1, 1,
-0.8811162, 0.1209974, -1.042511, 1, 1, 1, 1, 1,
-0.8786633, -1.911914, -2.769356, 1, 1, 1, 1, 1,
-0.8735055, 1.957622, 0.531074, 1, 1, 1, 1, 1,
-0.8720495, 1.781471, -1.593874, 1, 1, 1, 1, 1,
-0.8699102, 0.2823114, -1.247008, 1, 1, 1, 1, 1,
-0.8689654, -0.07717057, -2.2587, 0, 0, 1, 1, 1,
-0.8687476, -0.05168032, -1.501428, 1, 0, 0, 1, 1,
-0.8668643, -0.2045337, -1.134541, 1, 0, 0, 1, 1,
-0.8650097, -0.4460626, -3.008449, 1, 0, 0, 1, 1,
-0.8554021, -0.6302691, -1.770033, 1, 0, 0, 1, 1,
-0.8500805, -0.6282759, -1.372295, 1, 0, 0, 1, 1,
-0.8424709, 0.3252091, -0.5710911, 0, 0, 0, 1, 1,
-0.839099, 0.4975717, -1.775775, 0, 0, 0, 1, 1,
-0.8234737, 0.7915598, -0.7364337, 0, 0, 0, 1, 1,
-0.82262, -0.08581183, -0.1524607, 0, 0, 0, 1, 1,
-0.8216223, 0.08757209, -1.598286, 0, 0, 0, 1, 1,
-0.7997656, 0.6007804, -0.7259573, 0, 0, 0, 1, 1,
-0.7989189, 0.2866758, -2.309067, 0, 0, 0, 1, 1,
-0.7950852, -0.4414417, -2.552048, 1, 1, 1, 1, 1,
-0.7928244, -0.4298862, -2.968698, 1, 1, 1, 1, 1,
-0.7889384, 0.2251461, -3.278276, 1, 1, 1, 1, 1,
-0.7876382, -0.2322485, -2.380947, 1, 1, 1, 1, 1,
-0.7737059, -0.9254566, -3.932774, 1, 1, 1, 1, 1,
-0.7706369, -0.7701563, -3.702745, 1, 1, 1, 1, 1,
-0.770186, -0.3822771, -0.9260793, 1, 1, 1, 1, 1,
-0.7679347, 2.418116, -0.3971286, 1, 1, 1, 1, 1,
-0.7617334, -1.924926, -3.845615, 1, 1, 1, 1, 1,
-0.7523015, 0.1337527, -1.642082, 1, 1, 1, 1, 1,
-0.7496943, -0.4114286, -3.546753, 1, 1, 1, 1, 1,
-0.748926, 2.661242, -0.2712511, 1, 1, 1, 1, 1,
-0.7472873, -0.7520636, -0.9245547, 1, 1, 1, 1, 1,
-0.7464615, -0.5655041, -0.8847349, 1, 1, 1, 1, 1,
-0.7463734, -0.2929886, -2.014824, 1, 1, 1, 1, 1,
-0.7450647, -0.559917, -3.005318, 0, 0, 1, 1, 1,
-0.7427528, -1.063146, -2.765271, 1, 0, 0, 1, 1,
-0.7422132, 0.09355812, -0.973749, 1, 0, 0, 1, 1,
-0.7418143, 0.8506159, 0.3631888, 1, 0, 0, 1, 1,
-0.7413265, -1.049938, -1.798935, 1, 0, 0, 1, 1,
-0.7394937, 1.023253, -0.2640262, 1, 0, 0, 1, 1,
-0.7361836, -0.5072842, -2.725443, 0, 0, 0, 1, 1,
-0.7303202, -0.64184, -2.295156, 0, 0, 0, 1, 1,
-0.7250518, 0.1345388, 0.2432659, 0, 0, 0, 1, 1,
-0.7244786, -2.916224, -1.861753, 0, 0, 0, 1, 1,
-0.7194116, 0.9962752, -0.2482626, 0, 0, 0, 1, 1,
-0.7192248, 1.75203, -1.25888, 0, 0, 0, 1, 1,
-0.7176911, -0.05271659, -1.309096, 0, 0, 0, 1, 1,
-0.7133483, 1.727018, -0.7509471, 1, 1, 1, 1, 1,
-0.7130401, -0.4108783, -1.087071, 1, 1, 1, 1, 1,
-0.7092769, -1.941587, -3.904034, 1, 1, 1, 1, 1,
-0.7084955, 1.15628, -0.5315121, 1, 1, 1, 1, 1,
-0.7008656, 0.645229, -2.008522, 1, 1, 1, 1, 1,
-0.6995026, -1.576209, -3.063867, 1, 1, 1, 1, 1,
-0.6971002, -0.6296304, -2.378237, 1, 1, 1, 1, 1,
-0.6937807, -0.05752779, 0.6729422, 1, 1, 1, 1, 1,
-0.6906413, 0.7216449, -3.003513, 1, 1, 1, 1, 1,
-0.6872104, 1.386771, 0.256842, 1, 1, 1, 1, 1,
-0.6865575, -1.790735, -2.645878, 1, 1, 1, 1, 1,
-0.6863494, 1.799834, -0.5965534, 1, 1, 1, 1, 1,
-0.6783305, -0.8530692, -2.895535, 1, 1, 1, 1, 1,
-0.6778587, 1.927874, 0.5611162, 1, 1, 1, 1, 1,
-0.6772289, 0.7138245, -0.3713265, 1, 1, 1, 1, 1,
-0.6763974, -0.06920651, -1.58821, 0, 0, 1, 1, 1,
-0.6702982, 0.167326, -1.270064, 1, 0, 0, 1, 1,
-0.6699223, 1.404899, 0.2735418, 1, 0, 0, 1, 1,
-0.6692346, -0.1114594, -3.113225, 1, 0, 0, 1, 1,
-0.666517, -0.3428417, -0.5629727, 1, 0, 0, 1, 1,
-0.6629083, -0.2448121, -2.330161, 1, 0, 0, 1, 1,
-0.6606529, 0.5874149, -1.105798, 0, 0, 0, 1, 1,
-0.6586462, 0.937922, 1.617205, 0, 0, 0, 1, 1,
-0.6523095, 0.2197474, -0.3518701, 0, 0, 0, 1, 1,
-0.6517649, 0.3013346, -1.9496, 0, 0, 0, 1, 1,
-0.630969, -0.06922483, -0.4659838, 0, 0, 0, 1, 1,
-0.6301581, -1.950918, -1.642739, 0, 0, 0, 1, 1,
-0.6283516, 0.5360284, -0.4435159, 0, 0, 0, 1, 1,
-0.618068, 0.07454342, -2.058935, 1, 1, 1, 1, 1,
-0.6172183, 0.2744899, -0.7480114, 1, 1, 1, 1, 1,
-0.616514, 0.313543, -2.271585, 1, 1, 1, 1, 1,
-0.6146975, -0.5848251, -3.723521, 1, 1, 1, 1, 1,
-0.6047479, 1.040584, -0.3583256, 1, 1, 1, 1, 1,
-0.6034578, -0.2964027, -2.405308, 1, 1, 1, 1, 1,
-0.6014761, 1.113588, -1.444079, 1, 1, 1, 1, 1,
-0.5972911, 1.148613, -0.4669169, 1, 1, 1, 1, 1,
-0.5948564, -0.1239073, -3.066829, 1, 1, 1, 1, 1,
-0.5927696, 1.221813, 0.5533203, 1, 1, 1, 1, 1,
-0.5912712, -0.8962073, -2.814982, 1, 1, 1, 1, 1,
-0.5892516, 0.3968859, 1.416639, 1, 1, 1, 1, 1,
-0.5888712, 0.3052334, -4.270422, 1, 1, 1, 1, 1,
-0.5870298, -0.4476128, -0.8596267, 1, 1, 1, 1, 1,
-0.5867093, 0.517791, -1.442517, 1, 1, 1, 1, 1,
-0.5845373, 0.02092817, -1.73615, 0, 0, 1, 1, 1,
-0.5819201, -2.22924, -3.496658, 1, 0, 0, 1, 1,
-0.5813217, 0.9188802, -0.5114409, 1, 0, 0, 1, 1,
-0.5797045, 0.8815347, -1.541506, 1, 0, 0, 1, 1,
-0.579209, 2.728006, 1.541583, 1, 0, 0, 1, 1,
-0.5781578, -1.619578, -2.871865, 1, 0, 0, 1, 1,
-0.5595813, -0.1960664, -1.133378, 0, 0, 0, 1, 1,
-0.559351, -0.9618654, -3.87648, 0, 0, 0, 1, 1,
-0.5584569, -0.160942, -1.19039, 0, 0, 0, 1, 1,
-0.5566626, 1.497056, -0.5516884, 0, 0, 0, 1, 1,
-0.5563774, 0.9909265, -0.4875015, 0, 0, 0, 1, 1,
-0.5560885, -0.6850347, -2.058279, 0, 0, 0, 1, 1,
-0.5475834, -0.4911051, -2.015625, 0, 0, 0, 1, 1,
-0.5466887, -1.224926, -2.879374, 1, 1, 1, 1, 1,
-0.5441598, 1.309557, -0.5837676, 1, 1, 1, 1, 1,
-0.5440191, 0.3563058, -0.4761716, 1, 1, 1, 1, 1,
-0.543667, 1.591751, -0.2628875, 1, 1, 1, 1, 1,
-0.5435757, -0.409938, -2.135839, 1, 1, 1, 1, 1,
-0.5417042, 1.496879, -1.226523, 1, 1, 1, 1, 1,
-0.5412821, -1.340868, -3.387549, 1, 1, 1, 1, 1,
-0.5408838, -2.28306, -3.640158, 1, 1, 1, 1, 1,
-0.5334916, -0.1926345, -1.45529, 1, 1, 1, 1, 1,
-0.5173932, 0.9143185, -0.7563024, 1, 1, 1, 1, 1,
-0.5162527, -1.204457, -1.944373, 1, 1, 1, 1, 1,
-0.513445, -1.487877, -2.374374, 1, 1, 1, 1, 1,
-0.5131854, -0.780486, -1.884562, 1, 1, 1, 1, 1,
-0.5062639, 1.421045, 1.362102, 1, 1, 1, 1, 1,
-0.5042354, 1.993381, 0.1104378, 1, 1, 1, 1, 1,
-0.5036939, 0.3718617, -1.344239, 0, 0, 1, 1, 1,
-0.5033417, -0.8463986, -1.163248, 1, 0, 0, 1, 1,
-0.5020272, 0.7203069, 1.002554, 1, 0, 0, 1, 1,
-0.5017477, -0.2707514, -0.6874815, 1, 0, 0, 1, 1,
-0.4994383, 0.4691413, -0.8310363, 1, 0, 0, 1, 1,
-0.4991337, -0.9000819, -2.737471, 1, 0, 0, 1, 1,
-0.4971045, -0.6492143, -3.716965, 0, 0, 0, 1, 1,
-0.492818, -0.03131547, -0.8033162, 0, 0, 0, 1, 1,
-0.4913476, 0.1631011, -0.683554, 0, 0, 0, 1, 1,
-0.4910273, -3.068236, -3.73985, 0, 0, 0, 1, 1,
-0.4893806, 0.2894288, -0.2264826, 0, 0, 0, 1, 1,
-0.487195, 1.814111, -0.03133642, 0, 0, 0, 1, 1,
-0.4831741, -1.124781, -0.1955549, 0, 0, 0, 1, 1,
-0.482166, -0.8601621, -3.571109, 1, 1, 1, 1, 1,
-0.4702213, -1.142905, -3.153423, 1, 1, 1, 1, 1,
-0.4683575, 1.791295, -0.6395736, 1, 1, 1, 1, 1,
-0.4671627, 0.3863901, -1.376002, 1, 1, 1, 1, 1,
-0.4616515, -0.4337431, -2.311951, 1, 1, 1, 1, 1,
-0.4604835, -0.1292489, -3.664691, 1, 1, 1, 1, 1,
-0.4588334, 0.913359, -1.090925, 1, 1, 1, 1, 1,
-0.4576553, -1.308854, -2.659913, 1, 1, 1, 1, 1,
-0.4540079, -1.510964, -2.004376, 1, 1, 1, 1, 1,
-0.4522385, 0.5744761, -1.960805, 1, 1, 1, 1, 1,
-0.450899, 0.7899815, 0.7293963, 1, 1, 1, 1, 1,
-0.4490496, 0.2311838, -0.8329836, 1, 1, 1, 1, 1,
-0.4487173, -1.549549, -3.758495, 1, 1, 1, 1, 1,
-0.4458313, 0.5137642, -1.494282, 1, 1, 1, 1, 1,
-0.4456686, -0.05560435, -2.573647, 1, 1, 1, 1, 1,
-0.4448083, -3.133906, -2.597553, 0, 0, 1, 1, 1,
-0.4379901, 0.4792519, -1.021609, 1, 0, 0, 1, 1,
-0.4357297, -1.280091, -2.52761, 1, 0, 0, 1, 1,
-0.430501, 0.6500206, -1.346761, 1, 0, 0, 1, 1,
-0.4295735, 1.932152, -0.2235926, 1, 0, 0, 1, 1,
-0.4258184, 0.5373991, -1.335861, 1, 0, 0, 1, 1,
-0.4251211, 0.9849647, -0.6482646, 0, 0, 0, 1, 1,
-0.4235547, -1.329927, -1.210959, 0, 0, 0, 1, 1,
-0.4235069, -0.1516484, -0.008938784, 0, 0, 0, 1, 1,
-0.4204108, -0.1258433, -0.2147173, 0, 0, 0, 1, 1,
-0.419359, -0.3085866, -0.8989663, 0, 0, 0, 1, 1,
-0.4190321, -1.376875, -2.057039, 0, 0, 0, 1, 1,
-0.4162919, -0.892827, -2.535446, 0, 0, 0, 1, 1,
-0.414718, -0.02737789, -2.764922, 1, 1, 1, 1, 1,
-0.4133366, 1.018157, -0.4030377, 1, 1, 1, 1, 1,
-0.4090045, -0.8236949, -2.541804, 1, 1, 1, 1, 1,
-0.4054581, -0.3931659, -0.046929, 1, 1, 1, 1, 1,
-0.403938, -1.008789, -2.649195, 1, 1, 1, 1, 1,
-0.4014402, 1.673342, 0.2861506, 1, 1, 1, 1, 1,
-0.4006377, -0.2453129, -1.316642, 1, 1, 1, 1, 1,
-0.3986558, -0.4932723, -1.988158, 1, 1, 1, 1, 1,
-0.3945375, 0.7316987, 0.03259174, 1, 1, 1, 1, 1,
-0.3944371, -0.02908549, -3.160404, 1, 1, 1, 1, 1,
-0.3943362, -1.004259, -3.182925, 1, 1, 1, 1, 1,
-0.3929359, 0.4499786, -2.35911, 1, 1, 1, 1, 1,
-0.3917716, -1.725817, -3.285271, 1, 1, 1, 1, 1,
-0.3865715, 1.361056, 0.6932779, 1, 1, 1, 1, 1,
-0.3813907, -0.351167, -1.775398, 1, 1, 1, 1, 1,
-0.3769497, -0.05299218, -1.7293, 0, 0, 1, 1, 1,
-0.3767197, 1.625615, -1.711461, 1, 0, 0, 1, 1,
-0.3763885, -0.3732322, -1.195431, 1, 0, 0, 1, 1,
-0.3742556, -0.2779738, -1.515065, 1, 0, 0, 1, 1,
-0.3742436, -0.3784478, -0.3366274, 1, 0, 0, 1, 1,
-0.3664249, -0.8539191, -2.640874, 1, 0, 0, 1, 1,
-0.3654839, -0.474673, -3.205461, 0, 0, 0, 1, 1,
-0.3645622, 0.2278439, -1.89794, 0, 0, 0, 1, 1,
-0.3603017, -1.597648, -2.040069, 0, 0, 0, 1, 1,
-0.3598254, 0.09005766, -2.442151, 0, 0, 0, 1, 1,
-0.3492974, 0.8071141, -1.142295, 0, 0, 0, 1, 1,
-0.3489155, -0.6926991, -1.215742, 0, 0, 0, 1, 1,
-0.3379063, 0.383852, -2.441584, 0, 0, 0, 1, 1,
-0.336156, 0.6077418, 0.219409, 1, 1, 1, 1, 1,
-0.3342108, 1.664895, 0.2671676, 1, 1, 1, 1, 1,
-0.3220153, -0.6142309, -4.432814, 1, 1, 1, 1, 1,
-0.3216179, -0.6770934, -3.04516, 1, 1, 1, 1, 1,
-0.3209194, 0.5279424, -0.7300452, 1, 1, 1, 1, 1,
-0.3203001, 1.331959, -1.501498, 1, 1, 1, 1, 1,
-0.3187514, -0.09920211, -2.393363, 1, 1, 1, 1, 1,
-0.3167863, 1.868619, 0.1841886, 1, 1, 1, 1, 1,
-0.3157461, -1.175204, -2.219652, 1, 1, 1, 1, 1,
-0.3132643, 0.5188184, -0.589272, 1, 1, 1, 1, 1,
-0.3116115, 0.5407261, -0.07921164, 1, 1, 1, 1, 1,
-0.3097794, -1.644228, -3.537271, 1, 1, 1, 1, 1,
-0.3060132, -0.1114554, -0.8979124, 1, 1, 1, 1, 1,
-0.3039146, -0.9112802, -3.381482, 1, 1, 1, 1, 1,
-0.3016628, 0.1277093, -0.6759501, 1, 1, 1, 1, 1,
-0.300778, -0.6602743, -2.778799, 0, 0, 1, 1, 1,
-0.2973403, 0.06086959, -1.662403, 1, 0, 0, 1, 1,
-0.2894904, -0.8302716, -2.367901, 1, 0, 0, 1, 1,
-0.2893615, 0.3671261, 0.3834123, 1, 0, 0, 1, 1,
-0.289279, -1.159834, -2.914028, 1, 0, 0, 1, 1,
-0.2890444, -2.347597, -1.197613, 1, 0, 0, 1, 1,
-0.2866079, -1.141267, -1.838756, 0, 0, 0, 1, 1,
-0.2842481, -0.3760889, -2.482625, 0, 0, 0, 1, 1,
-0.2840246, 2.02926, 0.9831536, 0, 0, 0, 1, 1,
-0.2826423, 0.4427308, -3.215393, 0, 0, 0, 1, 1,
-0.2814701, 0.1237114, -0.04717028, 0, 0, 0, 1, 1,
-0.2812616, -1.100413, -2.248327, 0, 0, 0, 1, 1,
-0.2804036, 1.225183, -1.313678, 0, 0, 0, 1, 1,
-0.2798635, -0.7046892, -1.744012, 1, 1, 1, 1, 1,
-0.2794664, 1.154962, 0.7007962, 1, 1, 1, 1, 1,
-0.2770617, -1.339853, -1.691043, 1, 1, 1, 1, 1,
-0.2720935, -0.09626123, -1.608545, 1, 1, 1, 1, 1,
-0.2677977, -0.40733, -1.356405, 1, 1, 1, 1, 1,
-0.267635, 1.086746, -0.551098, 1, 1, 1, 1, 1,
-0.2620964, 0.03824751, -1.538691, 1, 1, 1, 1, 1,
-0.2590906, -0.3274757, -2.396451, 1, 1, 1, 1, 1,
-0.2547139, 0.1974346, 0.8160833, 1, 1, 1, 1, 1,
-0.2509127, 1.156095, -0.7915159, 1, 1, 1, 1, 1,
-0.2496282, -1.313365, -3.325397, 1, 1, 1, 1, 1,
-0.2473132, -1.868399, -2.068738, 1, 1, 1, 1, 1,
-0.2468779, -0.7539304, -3.420728, 1, 1, 1, 1, 1,
-0.2431112, 0.1757165, -1.42081, 1, 1, 1, 1, 1,
-0.2364382, 1.619045, -0.5788941, 1, 1, 1, 1, 1,
-0.23139, 0.404654, -0.3011532, 0, 0, 1, 1, 1,
-0.2309875, -1.01864, -3.429369, 1, 0, 0, 1, 1,
-0.2303162, 0.1666554, -0.9042852, 1, 0, 0, 1, 1,
-0.2287049, -1.811264, -2.60649, 1, 0, 0, 1, 1,
-0.2258617, 0.6362379, -0.2096322, 1, 0, 0, 1, 1,
-0.2249901, 0.4663299, -0.6874712, 1, 0, 0, 1, 1,
-0.2205597, 0.1368684, 0.04041984, 0, 0, 0, 1, 1,
-0.2185734, 0.0450645, -1.006826, 0, 0, 0, 1, 1,
-0.2133547, -0.1876981, -0.3132655, 0, 0, 0, 1, 1,
-0.2117278, 1.335031, 0.8217759, 0, 0, 0, 1, 1,
-0.2093451, 0.5379389, 0.2318476, 0, 0, 0, 1, 1,
-0.2059833, 0.8934793, -2.065925, 0, 0, 0, 1, 1,
-0.2052399, -1.160238, -1.845977, 0, 0, 0, 1, 1,
-0.2040473, 0.2731693, -1.769174, 1, 1, 1, 1, 1,
-0.2037751, -0.1110036, -1.442259, 1, 1, 1, 1, 1,
-0.2009013, 1.024897, -0.4622739, 1, 1, 1, 1, 1,
-0.1994339, -1.451013, -4.33262, 1, 1, 1, 1, 1,
-0.196978, -0.4471028, -4.103549, 1, 1, 1, 1, 1,
-0.1959254, -2.010288, -2.471167, 1, 1, 1, 1, 1,
-0.1937301, -1.364948, -2.582153, 1, 1, 1, 1, 1,
-0.1918939, 0.2588255, -0.5679938, 1, 1, 1, 1, 1,
-0.1917004, -1.894857, -3.401167, 1, 1, 1, 1, 1,
-0.1880848, -0.9171369, -2.238414, 1, 1, 1, 1, 1,
-0.1859022, -0.8827227, -0.4321411, 1, 1, 1, 1, 1,
-0.1846078, 0.1434452, 0.464644, 1, 1, 1, 1, 1,
-0.1841982, -0.5792822, -2.520028, 1, 1, 1, 1, 1,
-0.1799092, 0.8129376, 1.3777, 1, 1, 1, 1, 1,
-0.1762229, -1.276286, -2.585855, 1, 1, 1, 1, 1,
-0.171872, -1.203851, -3.891488, 0, 0, 1, 1, 1,
-0.1710841, 0.03531875, -0.776787, 1, 0, 0, 1, 1,
-0.1676917, -0.6808435, -2.661449, 1, 0, 0, 1, 1,
-0.1661706, 1.702238, -0.7142268, 1, 0, 0, 1, 1,
-0.1642724, 0.7039298, -0.3153561, 1, 0, 0, 1, 1,
-0.1632363, 0.1834053, -1.303471, 1, 0, 0, 1, 1,
-0.1599943, -1.334721, -4.360952, 0, 0, 0, 1, 1,
-0.1581447, -0.2100617, -1.241012, 0, 0, 0, 1, 1,
-0.1572642, 1.320561, 0.0202176, 0, 0, 0, 1, 1,
-0.1569316, -0.2129663, -3.160254, 0, 0, 0, 1, 1,
-0.1563243, -0.7972916, -1.115785, 0, 0, 0, 1, 1,
-0.1553389, -0.8597551, -3.824746, 0, 0, 0, 1, 1,
-0.1518331, -1.41182, -3.208078, 0, 0, 0, 1, 1,
-0.1476272, 1.48443, -0.4813916, 1, 1, 1, 1, 1,
-0.147208, 1.442456, 0.2913212, 1, 1, 1, 1, 1,
-0.1434262, -1.553583, -3.26888, 1, 1, 1, 1, 1,
-0.1430158, -0.4645832, -4.408741, 1, 1, 1, 1, 1,
-0.1429635, -0.2995635, -1.129324, 1, 1, 1, 1, 1,
-0.1429237, 0.6088362, -0.5486343, 1, 1, 1, 1, 1,
-0.1422509, 1.695438, -0.3151886, 1, 1, 1, 1, 1,
-0.1416326, -0.5461618, -1.204204, 1, 1, 1, 1, 1,
-0.1383349, 0.7652081, -0.5107105, 1, 1, 1, 1, 1,
-0.1374459, -1.237151, -3.363444, 1, 1, 1, 1, 1,
-0.1373999, -0.2290507, -4.34655, 1, 1, 1, 1, 1,
-0.1364713, 0.1004337, -0.008750563, 1, 1, 1, 1, 1,
-0.1357849, 0.5601831, 0.1335621, 1, 1, 1, 1, 1,
-0.134303, -0.7165884, -2.13661, 1, 1, 1, 1, 1,
-0.1324053, 1.581669, -1.242025, 1, 1, 1, 1, 1,
-0.1317107, -1.969618, -2.088151, 0, 0, 1, 1, 1,
-0.1272646, 0.5644651, 0.1841887, 1, 0, 0, 1, 1,
-0.1211514, -0.0421995, -2.389914, 1, 0, 0, 1, 1,
-0.1176942, -0.2267522, -3.37855, 1, 0, 0, 1, 1,
-0.1150405, -0.6739961, -2.061482, 1, 0, 0, 1, 1,
-0.1146316, 0.3089562, -0.008881868, 1, 0, 0, 1, 1,
-0.1139232, 1.004394, 0.03641072, 0, 0, 0, 1, 1,
-0.11042, 0.6834632, 1.042516, 0, 0, 0, 1, 1,
-0.1102244, -0.3786112, -3.199519, 0, 0, 0, 1, 1,
-0.1013728, 0.9868171, 0.5772411, 0, 0, 0, 1, 1,
-0.09729071, 0.6705936, 0.2609529, 0, 0, 0, 1, 1,
-0.09276964, -0.3726579, -1.94753, 0, 0, 0, 1, 1,
-0.07590366, 0.2460117, -0.5398251, 0, 0, 0, 1, 1,
-0.07567736, 0.2480139, -1.212251, 1, 1, 1, 1, 1,
-0.06458052, 0.8276182, 0.5747809, 1, 1, 1, 1, 1,
-0.0612745, 1.017361, -1.851409, 1, 1, 1, 1, 1,
-0.05607834, -0.6321957, -2.830943, 1, 1, 1, 1, 1,
-0.05569703, 1.212411, 0.4130468, 1, 1, 1, 1, 1,
-0.05450139, 0.7159007, 0.03571554, 1, 1, 1, 1, 1,
-0.05052392, 0.5740653, 0.2544524, 1, 1, 1, 1, 1,
-0.04989564, -1.191302, -3.610665, 1, 1, 1, 1, 1,
-0.04919881, 0.9190577, 1.154503, 1, 1, 1, 1, 1,
-0.04617222, 0.4853626, -0.7650358, 1, 1, 1, 1, 1,
-0.04573435, 1.518426, -0.5719606, 1, 1, 1, 1, 1,
-0.04540017, -0.687151, -2.406079, 1, 1, 1, 1, 1,
-0.04494156, -2.257696, -3.084982, 1, 1, 1, 1, 1,
-0.04210774, -0.5177758, -1.160109, 1, 1, 1, 1, 1,
-0.0413059, 1.145085, 0.06345117, 1, 1, 1, 1, 1,
-0.03727891, -1.67784, -4.140193, 0, 0, 1, 1, 1,
-0.03570564, -0.03907953, -2.223996, 1, 0, 0, 1, 1,
-0.03512988, -1.677937, -4.532369, 1, 0, 0, 1, 1,
-0.02925571, -1.777795, -3.932504, 1, 0, 0, 1, 1,
-0.01969806, -0.1985967, -4.397548, 1, 0, 0, 1, 1,
-0.01817323, -2.06487, -2.440017, 1, 0, 0, 1, 1,
-0.01813869, -0.8820461, -4.194129, 0, 0, 0, 1, 1,
-0.01550271, 0.09982631, -1.491513, 0, 0, 0, 1, 1,
-0.0153272, -0.7557222, -3.19513, 0, 0, 0, 1, 1,
-0.01293994, -0.9139894, -3.702937, 0, 0, 0, 1, 1,
-0.009843281, -0.3693854, -2.434867, 0, 0, 0, 1, 1,
-0.008946803, -1.217849, -2.00894, 0, 0, 0, 1, 1,
-0.0004751197, 0.5244849, 0.9878379, 0, 0, 0, 1, 1,
0.003658093, 1.836051, 0.2767674, 1, 1, 1, 1, 1,
0.006851529, 0.1308884, 1.262446, 1, 1, 1, 1, 1,
0.007714284, 0.9598544, -1.584642, 1, 1, 1, 1, 1,
0.01309754, -0.7925945, 5.118078, 1, 1, 1, 1, 1,
0.01729403, 0.9339854, 1.944425, 1, 1, 1, 1, 1,
0.02089707, 0.817445, -1.211191, 1, 1, 1, 1, 1,
0.02405406, -1.696652, 3.966791, 1, 1, 1, 1, 1,
0.02547505, -0.359024, 3.237866, 1, 1, 1, 1, 1,
0.02598689, -0.1316268, 3.192696, 1, 1, 1, 1, 1,
0.03223941, -1.342553, 5.20689, 1, 1, 1, 1, 1,
0.03307942, -1.092425, 2.801812, 1, 1, 1, 1, 1,
0.03465337, -0.2957885, 5.491722, 1, 1, 1, 1, 1,
0.03587279, 0.84531, 0.5533397, 1, 1, 1, 1, 1,
0.03676608, -1.42283, 3.54911, 1, 1, 1, 1, 1,
0.03954494, 2.727454, -0.1188069, 1, 1, 1, 1, 1,
0.04011247, 1.479681, -0.6255041, 0, 0, 1, 1, 1,
0.04289301, 0.2788925, 0.2728543, 1, 0, 0, 1, 1,
0.04380039, 0.05303478, 0.5157665, 1, 0, 0, 1, 1,
0.04471197, 0.5518441, 0.4128726, 1, 0, 0, 1, 1,
0.04783811, 1.551854, 0.03282919, 1, 0, 0, 1, 1,
0.0528885, 0.09395256, 0.358209, 1, 0, 0, 1, 1,
0.06031554, -0.4372303, 3.71836, 0, 0, 0, 1, 1,
0.06431896, 0.4262215, 0.7027302, 0, 0, 0, 1, 1,
0.06619728, -1.924692, 2.410421, 0, 0, 0, 1, 1,
0.07009499, 1.159941, -0.01368043, 0, 0, 0, 1, 1,
0.07524785, -0.6440838, 3.418017, 0, 0, 0, 1, 1,
0.07564449, -0.1984172, 1.774191, 0, 0, 0, 1, 1,
0.08403231, -0.18355, 1.573806, 0, 0, 0, 1, 1,
0.08752723, -0.1365146, 4.189678, 1, 1, 1, 1, 1,
0.08963303, 0.8512607, 1.033042, 1, 1, 1, 1, 1,
0.0943365, -1.79625, 3.017382, 1, 1, 1, 1, 1,
0.09587549, 0.2896369, -0.930949, 1, 1, 1, 1, 1,
0.09896789, 0.5522839, -0.9662676, 1, 1, 1, 1, 1,
0.100058, 0.3658755, 0.177763, 1, 1, 1, 1, 1,
0.1019971, -0.9183702, 1.794003, 1, 1, 1, 1, 1,
0.1042062, 0.8297583, 0.0791648, 1, 1, 1, 1, 1,
0.1046719, 0.7458817, 0.153879, 1, 1, 1, 1, 1,
0.1059335, -2.362471, 3.390654, 1, 1, 1, 1, 1,
0.1106943, -0.001205749, 3.25298, 1, 1, 1, 1, 1,
0.1180509, -1.433714, 1.884515, 1, 1, 1, 1, 1,
0.1198443, 0.8160917, 0.5935723, 1, 1, 1, 1, 1,
0.1230648, 0.8420966, -0.9994553, 1, 1, 1, 1, 1,
0.1249758, -0.5038845, 3.027235, 1, 1, 1, 1, 1,
0.1287608, 1.118991, -0.4103465, 0, 0, 1, 1, 1,
0.1288376, -0.8880449, 2.354109, 1, 0, 0, 1, 1,
0.1298188, -0.970857, 3.57069, 1, 0, 0, 1, 1,
0.1303522, -0.2560739, 2.012299, 1, 0, 0, 1, 1,
0.1337774, 0.114186, 1.67956, 1, 0, 0, 1, 1,
0.1370738, -0.6864587, 2.633368, 1, 0, 0, 1, 1,
0.1377556, -1.332742, 2.00059, 0, 0, 0, 1, 1,
0.1397932, 0.4549062, 0.248181, 0, 0, 0, 1, 1,
0.1415244, 1.128614, -0.05881426, 0, 0, 0, 1, 1,
0.1419956, 0.2054441, 0.3729542, 0, 0, 0, 1, 1,
0.1449526, -0.9220827, -0.2521507, 0, 0, 0, 1, 1,
0.1454456, -0.06616525, 1.985927, 0, 0, 0, 1, 1,
0.1499305, 1.489436, 1.672716, 0, 0, 0, 1, 1,
0.1512845, -0.6512066, 0.3380937, 1, 1, 1, 1, 1,
0.151526, 0.9817467, 0.378852, 1, 1, 1, 1, 1,
0.1527182, -1.079459, 0.8078299, 1, 1, 1, 1, 1,
0.1530133, 0.3976813, -0.926973, 1, 1, 1, 1, 1,
0.1647362, 1.134598, 0.4948023, 1, 1, 1, 1, 1,
0.1650968, -1.128384, 3.231084, 1, 1, 1, 1, 1,
0.1687949, 0.2722557, 1.43426, 1, 1, 1, 1, 1,
0.1708458, -0.5809771, 3.242451, 1, 1, 1, 1, 1,
0.183985, 0.3860417, -0.2406888, 1, 1, 1, 1, 1,
0.1840237, 2.447735, 1.730129, 1, 1, 1, 1, 1,
0.1840864, -1.245846, 3.631608, 1, 1, 1, 1, 1,
0.1854137, -0.7616345, 1.706944, 1, 1, 1, 1, 1,
0.1932965, 1.208727, 0.08868524, 1, 1, 1, 1, 1,
0.1935535, -0.4259252, 1.513077, 1, 1, 1, 1, 1,
0.1968108, 0.2288153, 1.575999, 1, 1, 1, 1, 1,
0.2033719, 1.62024, 1.033794, 0, 0, 1, 1, 1,
0.2062057, 0.3317011, 1.943292, 1, 0, 0, 1, 1,
0.2064285, 2.368436, -0.7381836, 1, 0, 0, 1, 1,
0.2115714, 2.246008, 0.5701747, 1, 0, 0, 1, 1,
0.2158487, 1.348125, 2.122021, 1, 0, 0, 1, 1,
0.2237466, 1.19823, 0.05670629, 1, 0, 0, 1, 1,
0.2243272, -1.770801, 2.807203, 0, 0, 0, 1, 1,
0.2273093, 0.7228765, 0.7895152, 0, 0, 0, 1, 1,
0.2295756, -2.149926, 3.549015, 0, 0, 0, 1, 1,
0.2320001, 0.286655, 0.782531, 0, 0, 0, 1, 1,
0.2353251, -0.291301, 3.761187, 0, 0, 0, 1, 1,
0.2360556, 0.1758801, 1.784364, 0, 0, 0, 1, 1,
0.2381378, 1.749755, -1.518826, 0, 0, 0, 1, 1,
0.2425478, 1.447342, -0.2185746, 1, 1, 1, 1, 1,
0.2458199, -1.333864, 3.475651, 1, 1, 1, 1, 1,
0.2480879, -0.6780099, 2.528111, 1, 1, 1, 1, 1,
0.248181, -2.025665, 3.730544, 1, 1, 1, 1, 1,
0.2493631, -2.324649, 3.422533, 1, 1, 1, 1, 1,
0.2509368, -1.665397, 3.705558, 1, 1, 1, 1, 1,
0.2636467, -0.6937785, 2.419247, 1, 1, 1, 1, 1,
0.2662559, 1.169255, 1.102094, 1, 1, 1, 1, 1,
0.2675006, -0.2927412, 1.425672, 1, 1, 1, 1, 1,
0.2729636, -1.658916, 1.512514, 1, 1, 1, 1, 1,
0.2786357, -0.199121, 1.187534, 1, 1, 1, 1, 1,
0.2796052, 2.112401, 1.533091, 1, 1, 1, 1, 1,
0.2807124, 1.618029, -0.4161102, 1, 1, 1, 1, 1,
0.2860039, -1.789673, 4.737687, 1, 1, 1, 1, 1,
0.2890702, 0.9396768, 1.969867, 1, 1, 1, 1, 1,
0.29241, -0.7837432, 1.538219, 0, 0, 1, 1, 1,
0.2936468, 1.509818, -0.4367899, 1, 0, 0, 1, 1,
0.2960708, 0.4726554, 0.4058407, 1, 0, 0, 1, 1,
0.2967118, 0.03564704, 2.512996, 1, 0, 0, 1, 1,
0.2975898, 0.2076916, 1.72705, 1, 0, 0, 1, 1,
0.2997442, -0.9895176, 0.8657157, 1, 0, 0, 1, 1,
0.3008548, 0.6769374, 0.05310304, 0, 0, 0, 1, 1,
0.3013556, -1.639643, 2.273565, 0, 0, 0, 1, 1,
0.3021189, -1.782875, 1.317547, 0, 0, 0, 1, 1,
0.3057438, 2.382201, 0.1449618, 0, 0, 0, 1, 1,
0.3152428, -0.9707481, 0.230376, 0, 0, 0, 1, 1,
0.3176557, 0.1452916, 0.7536722, 0, 0, 0, 1, 1,
0.3238836, -0.6323613, 3.801996, 0, 0, 0, 1, 1,
0.3252863, -0.2244695, 1.931122, 1, 1, 1, 1, 1,
0.3296915, -0.3392052, 2.77183, 1, 1, 1, 1, 1,
0.3371874, -0.7885004, 3.533665, 1, 1, 1, 1, 1,
0.3377773, -0.1573302, 2.252358, 1, 1, 1, 1, 1,
0.3397118, 1.263611, -1.476155, 1, 1, 1, 1, 1,
0.3407631, 0.9443951, -1.012476, 1, 1, 1, 1, 1,
0.3433949, 0.3351257, 2.027652, 1, 1, 1, 1, 1,
0.3436023, 1.875999, 2.485581, 1, 1, 1, 1, 1,
0.3448631, -0.2072414, 3.468021, 1, 1, 1, 1, 1,
0.3455468, -0.3553651, 3.637408, 1, 1, 1, 1, 1,
0.3469734, 1.88517, 0.517923, 1, 1, 1, 1, 1,
0.3546429, 0.7100464, 1.791884, 1, 1, 1, 1, 1,
0.3551691, -2.088793, 3.063227, 1, 1, 1, 1, 1,
0.3586388, -1.749971, 3.075027, 1, 1, 1, 1, 1,
0.3623173, 0.2789307, 0.6456279, 1, 1, 1, 1, 1,
0.3624894, 0.3022546, 0.5261719, 0, 0, 1, 1, 1,
0.3679666, -0.1258053, 2.086601, 1, 0, 0, 1, 1,
0.3702056, -1.295848, 1.396062, 1, 0, 0, 1, 1,
0.3767053, -0.07129785, 2.633484, 1, 0, 0, 1, 1,
0.377331, 0.162283, 0.9753559, 1, 0, 0, 1, 1,
0.3774051, -1.634278, 2.823822, 1, 0, 0, 1, 1,
0.3800724, 0.1675353, 1.148335, 0, 0, 0, 1, 1,
0.3804812, 0.6997625, 0.4816452, 0, 0, 0, 1, 1,
0.3817199, -0.3622872, 1.662239, 0, 0, 0, 1, 1,
0.3857379, -0.04975654, 2.767478, 0, 0, 0, 1, 1,
0.3862284, -0.7309897, 1.322868, 0, 0, 0, 1, 1,
0.3872433, -1.488171, 3.274464, 0, 0, 0, 1, 1,
0.3910854, 0.1074958, 0.9134048, 0, 0, 0, 1, 1,
0.3960372, -0.7094243, 5.324436, 1, 1, 1, 1, 1,
0.4009941, 0.8914645, -0.8013466, 1, 1, 1, 1, 1,
0.4084898, -1.406137, 3.138907, 1, 1, 1, 1, 1,
0.4101186, 1.022219, -0.694007, 1, 1, 1, 1, 1,
0.4166288, 0.8130566, 1.040178, 1, 1, 1, 1, 1,
0.4175401, 0.2388598, 0.8563114, 1, 1, 1, 1, 1,
0.4184211, 0.9757608, 2.70127, 1, 1, 1, 1, 1,
0.4190732, -0.6128113, 3.533714, 1, 1, 1, 1, 1,
0.426113, 1.283618, 0.9375213, 1, 1, 1, 1, 1,
0.427859, -0.0854362, 1.881614, 1, 1, 1, 1, 1,
0.4281658, 0.06503106, 0.3905745, 1, 1, 1, 1, 1,
0.4332391, 0.9125007, 1.635486, 1, 1, 1, 1, 1,
0.4370503, 1.095567, 1.21927, 1, 1, 1, 1, 1,
0.4421925, 0.3148551, 0.5043453, 1, 1, 1, 1, 1,
0.4435357, -0.08044061, 1.681306, 1, 1, 1, 1, 1,
0.4435945, -1.4909, 3.8577, 0, 0, 1, 1, 1,
0.4504188, 0.02713137, 1.259927, 1, 0, 0, 1, 1,
0.4531846, -0.1552869, 0.560872, 1, 0, 0, 1, 1,
0.4542289, -0.942956, 2.588256, 1, 0, 0, 1, 1,
0.4544219, -0.6432447, 3.295807, 1, 0, 0, 1, 1,
0.4566683, 1.048768, -0.1044551, 1, 0, 0, 1, 1,
0.4576788, 0.2222779, 1.167805, 0, 0, 0, 1, 1,
0.4619507, 1.351088, 0.7386007, 0, 0, 0, 1, 1,
0.4667408, 2.838772, -0.08626692, 0, 0, 0, 1, 1,
0.4689479, -0.8320084, 1.817542, 0, 0, 0, 1, 1,
0.4709696, -0.35762, 0.5592352, 0, 0, 0, 1, 1,
0.4711349, -0.02999029, 3.082335, 0, 0, 0, 1, 1,
0.4762688, 1.084089, -1.06636, 0, 0, 0, 1, 1,
0.478043, -0.7384104, 2.480314, 1, 1, 1, 1, 1,
0.4820229, -0.1370838, 2.414194, 1, 1, 1, 1, 1,
0.4827028, 0.5650108, 2.712479, 1, 1, 1, 1, 1,
0.4836105, 0.843013, 0.4277931, 1, 1, 1, 1, 1,
0.4860072, 0.8369668, 0.3693396, 1, 1, 1, 1, 1,
0.4862248, 0.8977148, 0.3231516, 1, 1, 1, 1, 1,
0.4868065, 0.6014545, -0.7380965, 1, 1, 1, 1, 1,
0.4898874, 1.672665, -0.05982668, 1, 1, 1, 1, 1,
0.4940329, -1.259275, 4.432017, 1, 1, 1, 1, 1,
0.4968978, 0.2748505, 1.085074, 1, 1, 1, 1, 1,
0.4980291, 0.1513358, 0.08576088, 1, 1, 1, 1, 1,
0.4992554, 1.105424, -0.09962125, 1, 1, 1, 1, 1,
0.5006132, 1.411215, 1.002293, 1, 1, 1, 1, 1,
0.5042059, -1.778919, 3.02152, 1, 1, 1, 1, 1,
0.5100255, 0.1205451, 2.278349, 1, 1, 1, 1, 1,
0.5134621, -0.1228861, 2.665125, 0, 0, 1, 1, 1,
0.5152309, 0.4076876, 1.600815, 1, 0, 0, 1, 1,
0.5188276, 0.002961269, 0.4373704, 1, 0, 0, 1, 1,
0.5215359, -1.867917, 2.451387, 1, 0, 0, 1, 1,
0.5222682, -1.870441, 2.364211, 1, 0, 0, 1, 1,
0.5232621, 0.1286997, 0.4848354, 1, 0, 0, 1, 1,
0.5279952, 0.09556198, 0.8811007, 0, 0, 0, 1, 1,
0.5282598, -0.1759112, 1.897119, 0, 0, 0, 1, 1,
0.5284455, 0.06710713, 1.545688, 0, 0, 0, 1, 1,
0.5292568, 0.6108184, 1.213633, 0, 0, 0, 1, 1,
0.5335894, -1.038542, 2.163286, 0, 0, 0, 1, 1,
0.5338291, 0.1572063, 2.291198, 0, 0, 0, 1, 1,
0.5344374, 0.8669333, 1.753559, 0, 0, 0, 1, 1,
0.5348436, -1.965169, 4.674797, 1, 1, 1, 1, 1,
0.5361473, 0.316056, 0.9755563, 1, 1, 1, 1, 1,
0.5366454, 2.73629, 1.169771, 1, 1, 1, 1, 1,
0.538126, -0.9570345, 3.284222, 1, 1, 1, 1, 1,
0.5503353, 1.097967, 0.06548642, 1, 1, 1, 1, 1,
0.5527322, 0.9202499, 2.248287, 1, 1, 1, 1, 1,
0.5597593, 0.05232332, 0.2767864, 1, 1, 1, 1, 1,
0.5665334, -0.02486585, 2.051338, 1, 1, 1, 1, 1,
0.570244, 0.6156436, 2.678257, 1, 1, 1, 1, 1,
0.5706372, 0.8184652, -0.4563625, 1, 1, 1, 1, 1,
0.5731214, 0.6838976, -0.09016841, 1, 1, 1, 1, 1,
0.5795997, -0.026412, 2.93152, 1, 1, 1, 1, 1,
0.5851814, 0.4221644, 2.038948, 1, 1, 1, 1, 1,
0.5874404, 0.7967539, 0.03602624, 1, 1, 1, 1, 1,
0.5877105, -0.02086984, 1.857572, 1, 1, 1, 1, 1,
0.5909155, 0.6708105, 0.5006346, 0, 0, 1, 1, 1,
0.5912449, -0.2564364, 1.033845, 1, 0, 0, 1, 1,
0.6049301, -0.0692422, 2.347165, 1, 0, 0, 1, 1,
0.6099313, 2.422827, 0.3390582, 1, 0, 0, 1, 1,
0.6106905, 1.329052, -1.230029, 1, 0, 0, 1, 1,
0.6127864, -0.2627619, 1.570589, 1, 0, 0, 1, 1,
0.6130467, 0.1623195, 1.61796, 0, 0, 0, 1, 1,
0.6201808, 0.8779325, -0.8093776, 0, 0, 0, 1, 1,
0.6261165, 0.1178724, 1.36978, 0, 0, 0, 1, 1,
0.6301392, -0.1917674, 0.7828366, 0, 0, 0, 1, 1,
0.6377937, -0.4671493, 0.9610826, 0, 0, 0, 1, 1,
0.6385867, -1.164558, 1.386586, 0, 0, 0, 1, 1,
0.6431475, -0.6592723, 2.125333, 0, 0, 0, 1, 1,
0.6465228, 1.889906, 0.3818732, 1, 1, 1, 1, 1,
0.6515969, -0.6877446, 0.9386784, 1, 1, 1, 1, 1,
0.656303, 0.7669102, 0.0432485, 1, 1, 1, 1, 1,
0.6580654, -0.5634575, 3.203935, 1, 1, 1, 1, 1,
0.6665439, 1.007472, 0.7083927, 1, 1, 1, 1, 1,
0.6678104, 1.635595, 0.7923165, 1, 1, 1, 1, 1,
0.6716035, 2.03898, -0.8238605, 1, 1, 1, 1, 1,
0.6773422, 1.680754, 1.547349, 1, 1, 1, 1, 1,
0.6802477, -2.124351, 2.460917, 1, 1, 1, 1, 1,
0.6808547, -0.5198521, 2.97686, 1, 1, 1, 1, 1,
0.6813736, 1.740561, -0.1463188, 1, 1, 1, 1, 1,
0.6823574, 0.4314369, 0.1565939, 1, 1, 1, 1, 1,
0.6823941, -0.05416319, 1.789466, 1, 1, 1, 1, 1,
0.685973, 1.631266, 0.8164845, 1, 1, 1, 1, 1,
0.6870329, -0.02887218, 2.158867, 1, 1, 1, 1, 1,
0.6913487, 0.5547675, 2.012558, 0, 0, 1, 1, 1,
0.6964465, -1.518831, 2.006228, 1, 0, 0, 1, 1,
0.6974572, -0.3555649, 0.1504843, 1, 0, 0, 1, 1,
0.7087348, -0.2331506, 0.4080559, 1, 0, 0, 1, 1,
0.7097802, -0.9343126, 2.006178, 1, 0, 0, 1, 1,
0.7155094, 0.8408814, 2.819928, 1, 0, 0, 1, 1,
0.7206129, 0.262314, 1.055676, 0, 0, 0, 1, 1,
0.7217305, -0.7884675, 1.919536, 0, 0, 0, 1, 1,
0.7260284, 0.05158015, 1.98492, 0, 0, 0, 1, 1,
0.7268115, 0.7456586, -0.1499888, 0, 0, 0, 1, 1,
0.7272561, -1.01082, 3.171191, 0, 0, 0, 1, 1,
0.728632, -0.4773572, 2.249233, 0, 0, 0, 1, 1,
0.7312472, 0.3489149, 0.8929989, 0, 0, 0, 1, 1,
0.736549, 0.21523, 0.2341751, 1, 1, 1, 1, 1,
0.737019, -0.5421495, 2.346457, 1, 1, 1, 1, 1,
0.7421137, 0.1793812, 0.1521135, 1, 1, 1, 1, 1,
0.749322, 1.174969, -0.5389816, 1, 1, 1, 1, 1,
0.7530133, -1.174774, 1.13983, 1, 1, 1, 1, 1,
0.7542627, 1.009575, 1.683809, 1, 1, 1, 1, 1,
0.7549596, 1.912428, 2.645827, 1, 1, 1, 1, 1,
0.762133, 0.1644545, -0.1333162, 1, 1, 1, 1, 1,
0.7648128, 0.4347428, 1.863719, 1, 1, 1, 1, 1,
0.7673435, 0.8082792, -1.566873, 1, 1, 1, 1, 1,
0.7676245, 0.6276428, 2.457062, 1, 1, 1, 1, 1,
0.7734007, 0.9991915, -0.04596199, 1, 1, 1, 1, 1,
0.7775832, -0.8456414, 2.782926, 1, 1, 1, 1, 1,
0.7803632, -1.35785, 2.317262, 1, 1, 1, 1, 1,
0.7870619, -1.037125, 3.062474, 1, 1, 1, 1, 1,
0.7905635, 1.121699, 2.041546, 0, 0, 1, 1, 1,
0.792876, -0.01634859, 0.7749452, 1, 0, 0, 1, 1,
0.7951318, 0.5289899, 1.204803, 1, 0, 0, 1, 1,
0.7957662, -0.1378554, 2.21033, 1, 0, 0, 1, 1,
0.796939, 0.6573119, 1.550121, 1, 0, 0, 1, 1,
0.7975146, 0.7892622, 1.155156, 1, 0, 0, 1, 1,
0.7982727, 0.7488948, -1.353305, 0, 0, 0, 1, 1,
0.8014219, -0.5249978, 1.995923, 0, 0, 0, 1, 1,
0.8074601, -1.992851, 3.991673, 0, 0, 0, 1, 1,
0.8090245, 0.4014411, 2.09866, 0, 0, 0, 1, 1,
0.8145581, -1.567044, 3.655964, 0, 0, 0, 1, 1,
0.814664, -1.247749, 3.565667, 0, 0, 0, 1, 1,
0.8156945, -0.06178422, 2.262569, 0, 0, 0, 1, 1,
0.8166786, 1.399576, 0.709835, 1, 1, 1, 1, 1,
0.8248909, -1.396262, 2.578908, 1, 1, 1, 1, 1,
0.8312622, -0.1362465, 3.033502, 1, 1, 1, 1, 1,
0.8356048, 1.532837, -0.5476273, 1, 1, 1, 1, 1,
0.8433874, 0.5045708, 0.8262784, 1, 1, 1, 1, 1,
0.8456221, 0.7429225, 0.02656096, 1, 1, 1, 1, 1,
0.8543312, -0.001694584, 2.170968, 1, 1, 1, 1, 1,
0.8573214, -0.07673247, 1.631868, 1, 1, 1, 1, 1,
0.8632455, 1.565831, 0.6464043, 1, 1, 1, 1, 1,
0.8633318, -0.4448344, 0.0975005, 1, 1, 1, 1, 1,
0.8721569, 0.2527252, 2.462956, 1, 1, 1, 1, 1,
0.8760281, 0.3904864, 1.832753, 1, 1, 1, 1, 1,
0.87616, -0.845081, 3.941991, 1, 1, 1, 1, 1,
0.8787717, -0.2822199, 0.9692425, 1, 1, 1, 1, 1,
0.8795396, -0.2468173, 2.226952, 1, 1, 1, 1, 1,
0.8810467, -0.1926474, 2.14869, 0, 0, 1, 1, 1,
0.8880097, -0.2776436, 0.5048462, 1, 0, 0, 1, 1,
0.8887802, -0.4114814, 0.9296251, 1, 0, 0, 1, 1,
0.8912398, -0.9822254, 3.260869, 1, 0, 0, 1, 1,
0.8948644, 0.04875983, 2.989614, 1, 0, 0, 1, 1,
0.8958934, -0.6015151, 2.507658, 1, 0, 0, 1, 1,
0.8982078, 0.7702633, 0.8986647, 0, 0, 0, 1, 1,
0.9026026, 0.2710089, 2.548692, 0, 0, 0, 1, 1,
0.9079269, -0.3473707, 1.89588, 0, 0, 0, 1, 1,
0.9153206, 0.02631122, 3.04254, 0, 0, 0, 1, 1,
0.9167016, -0.7800213, 1.531767, 0, 0, 0, 1, 1,
0.9173981, 0.7348099, 2.737288, 0, 0, 0, 1, 1,
0.9210657, 0.2052624, 2.117833, 0, 0, 0, 1, 1,
0.9223204, 1.078401, 0.4784161, 1, 1, 1, 1, 1,
0.9229259, 1.061792, -1.598356, 1, 1, 1, 1, 1,
0.9329987, 1.401513, 0.8923956, 1, 1, 1, 1, 1,
0.9336383, -1.076171, 2.428681, 1, 1, 1, 1, 1,
0.9364609, -0.2516017, 2.312396, 1, 1, 1, 1, 1,
0.9373487, -0.0745681, 1.039744, 1, 1, 1, 1, 1,
0.939797, -0.1288954, 1.695131, 1, 1, 1, 1, 1,
0.946249, -0.04267326, 2.114764, 1, 1, 1, 1, 1,
0.9520169, 0.2341227, 0.7664897, 1, 1, 1, 1, 1,
0.9544662, 1.040023, -0.06382322, 1, 1, 1, 1, 1,
0.9569142, -0.3078404, 2.437569, 1, 1, 1, 1, 1,
0.956958, 0.3977439, 1.694521, 1, 1, 1, 1, 1,
0.9584019, -1.735641, 2.395024, 1, 1, 1, 1, 1,
0.960144, 1.022854, -1.442046, 1, 1, 1, 1, 1,
0.9659927, 1.998624, 0.4992661, 1, 1, 1, 1, 1,
0.966598, 0.0353776, 2.1537, 0, 0, 1, 1, 1,
0.9698468, 2.497105, 2.008204, 1, 0, 0, 1, 1,
0.9701346, 1.147071, 0.307509, 1, 0, 0, 1, 1,
0.970807, -1.248788, 2.625113, 1, 0, 0, 1, 1,
0.9779385, 0.4952965, 0.9099854, 1, 0, 0, 1, 1,
0.9794705, 1.406073, -0.6872036, 1, 0, 0, 1, 1,
0.9823282, 0.6893896, 3.077884, 0, 0, 0, 1, 1,
0.9863374, -0.2309337, 0.668483, 0, 0, 0, 1, 1,
0.9871674, -0.5975587, 1.887811, 0, 0, 0, 1, 1,
0.9943898, -0.5229795, 4.172038, 0, 0, 0, 1, 1,
0.9969051, 0.4071382, 1.37632, 0, 0, 0, 1, 1,
0.9973579, 0.7719883, 1.580985, 0, 0, 0, 1, 1,
1.00045, 0.8240334, 1.140913, 0, 0, 0, 1, 1,
1.007592, -3.031658, 3.313545, 1, 1, 1, 1, 1,
1.01428, 1.956751, 1.002532, 1, 1, 1, 1, 1,
1.014879, -0.8015042, 0.9623494, 1, 1, 1, 1, 1,
1.035344, 0.02061196, 0.9733469, 1, 1, 1, 1, 1,
1.045352, -1.093221, 3.209342, 1, 1, 1, 1, 1,
1.04696, -0.5239998, 1.760464, 1, 1, 1, 1, 1,
1.049083, 0.13059, 0.2678886, 1, 1, 1, 1, 1,
1.057804, -1.375448, 3.120118, 1, 1, 1, 1, 1,
1.076565, -0.5475677, 1.967237, 1, 1, 1, 1, 1,
1.085416, 1.253656, 2.270551, 1, 1, 1, 1, 1,
1.090333, -0.6799412, -0.1414703, 1, 1, 1, 1, 1,
1.100958, 0.1264207, 0.9790365, 1, 1, 1, 1, 1,
1.103616, -0.0515152, 1.386934, 1, 1, 1, 1, 1,
1.107477, 1.05607, 0.7688962, 1, 1, 1, 1, 1,
1.112292, 1.774894, -0.4990244, 1, 1, 1, 1, 1,
1.123294, -0.4564152, 2.497988, 0, 0, 1, 1, 1,
1.127034, 0.2379651, -0.03676598, 1, 0, 0, 1, 1,
1.127736, -0.1397301, -0.9875026, 1, 0, 0, 1, 1,
1.131912, -1.575333, 2.056179, 1, 0, 0, 1, 1,
1.133917, 1.2807, 0.2541562, 1, 0, 0, 1, 1,
1.138991, -1.154825, 2.242426, 1, 0, 0, 1, 1,
1.149109, -0.09313671, 1.769956, 0, 0, 0, 1, 1,
1.153123, 1.2041, -0.9695916, 0, 0, 0, 1, 1,
1.164672, 1.3225, 1.289134, 0, 0, 0, 1, 1,
1.165434, -1.327147, 2.874731, 0, 0, 0, 1, 1,
1.166513, 0.7082468, 0.8473936, 0, 0, 0, 1, 1,
1.19853, -0.3807104, 2.867188, 0, 0, 0, 1, 1,
1.199975, 0.4014906, 3.932017, 0, 0, 0, 1, 1,
1.2049, -1.693868, 1.201376, 1, 1, 1, 1, 1,
1.212707, -0.5967029, 3.371591, 1, 1, 1, 1, 1,
1.213558, 1.340382, 0.7961584, 1, 1, 1, 1, 1,
1.214433, 1.78095, 1.037031, 1, 1, 1, 1, 1,
1.21483, 1.020391, 0.4449174, 1, 1, 1, 1, 1,
1.220402, 0.2370208, 2.29545, 1, 1, 1, 1, 1,
1.221856, -0.2068721, 1.209087, 1, 1, 1, 1, 1,
1.229685, -0.3813915, 2.908356, 1, 1, 1, 1, 1,
1.229794, 0.3349867, 0.1532752, 1, 1, 1, 1, 1,
1.237755, -1.031403, 2.742799, 1, 1, 1, 1, 1,
1.238571, -0.6487567, 3.421989, 1, 1, 1, 1, 1,
1.24986, -0.5855222, 0.9319305, 1, 1, 1, 1, 1,
1.250001, 3.115111, -0.02150783, 1, 1, 1, 1, 1,
1.265139, 1.806062, -1.175922, 1, 1, 1, 1, 1,
1.269366, -0.5317706, 2.850961, 1, 1, 1, 1, 1,
1.271313, 0.07375708, 2.06732, 0, 0, 1, 1, 1,
1.276295, 0.3038977, -0.1386324, 1, 0, 0, 1, 1,
1.282755, 0.8205198, 0.4771376, 1, 0, 0, 1, 1,
1.30623, -0.3863449, 1.821035, 1, 0, 0, 1, 1,
1.306802, -0.09158908, 0.8738362, 1, 0, 0, 1, 1,
1.323605, -1.965099, 4.017585, 1, 0, 0, 1, 1,
1.3332, -0.87991, 1.748762, 0, 0, 0, 1, 1,
1.339769, 0.702382, 2.946477, 0, 0, 0, 1, 1,
1.345783, -0.5183071, 2.065058, 0, 0, 0, 1, 1,
1.348393, 0.1848723, 1.818599, 0, 0, 0, 1, 1,
1.349925, 0.1416293, 1.61839, 0, 0, 0, 1, 1,
1.35036, -0.9784243, 2.397314, 0, 0, 0, 1, 1,
1.355651, 1.367996, -1.439859, 0, 0, 0, 1, 1,
1.35643, -1.116017, 2.547688, 1, 1, 1, 1, 1,
1.377082, 0.2663996, -0.267489, 1, 1, 1, 1, 1,
1.379439, 0.2577708, 2.627902, 1, 1, 1, 1, 1,
1.381762, -0.7520643, 1.981915, 1, 1, 1, 1, 1,
1.387026, -0.3568349, 1.869741, 1, 1, 1, 1, 1,
1.396896, -1.67958, 3.930481, 1, 1, 1, 1, 1,
1.397118, 0.0006421967, 1.072658, 1, 1, 1, 1, 1,
1.410787, -1.987102, 3.69837, 1, 1, 1, 1, 1,
1.420212, -0.7754374, 2.198832, 1, 1, 1, 1, 1,
1.426234, 0.6484898, 2.110527, 1, 1, 1, 1, 1,
1.432444, -1.178756, 1.693979, 1, 1, 1, 1, 1,
1.435062, 1.301364, 0.7000275, 1, 1, 1, 1, 1,
1.435217, -1.66113, 2.094882, 1, 1, 1, 1, 1,
1.443763, 1.0582, 0.1539063, 1, 1, 1, 1, 1,
1.44553, -2.454382, 3.493123, 1, 1, 1, 1, 1,
1.449819, -1.072528, 4.239697, 0, 0, 1, 1, 1,
1.451829, 1.102067, 1.013384, 1, 0, 0, 1, 1,
1.453905, -0.4024987, 2.642344, 1, 0, 0, 1, 1,
1.454504, 0.92162, 1.081765, 1, 0, 0, 1, 1,
1.47653, -0.04082349, -0.3548426, 1, 0, 0, 1, 1,
1.485316, -0.993344, 2.221721, 1, 0, 0, 1, 1,
1.492336, 0.6940194, 0.03552045, 0, 0, 0, 1, 1,
1.494601, -0.3592076, 1.392368, 0, 0, 0, 1, 1,
1.497126, 1.428403, 0.5278648, 0, 0, 0, 1, 1,
1.515648, -0.370963, 1.133075, 0, 0, 0, 1, 1,
1.520247, 1.212719, 0.339688, 0, 0, 0, 1, 1,
1.529678, -0.7891074, 2.262433, 0, 0, 0, 1, 1,
1.532517, 0.2871484, 1.385283, 0, 0, 0, 1, 1,
1.549989, 0.3205589, 2.383793, 1, 1, 1, 1, 1,
1.553339, 0.08338341, 1.712134, 1, 1, 1, 1, 1,
1.553677, 1.281871, -1.170891, 1, 1, 1, 1, 1,
1.561861, 0.5192213, 1.483932, 1, 1, 1, 1, 1,
1.565195, 1.21726, 1.60445, 1, 1, 1, 1, 1,
1.574604, 0.05463133, 2.411767, 1, 1, 1, 1, 1,
1.575759, 0.193206, 1.873622, 1, 1, 1, 1, 1,
1.575819, -1.175089, 4.625755, 1, 1, 1, 1, 1,
1.584614, 1.75722, 0.8937831, 1, 1, 1, 1, 1,
1.595157, 1.686465, 2.950925, 1, 1, 1, 1, 1,
1.596468, -0.7081687, 3.650833, 1, 1, 1, 1, 1,
1.599547, 0.3895484, 0.3443641, 1, 1, 1, 1, 1,
1.628048, -0.5983428, 2.82594, 1, 1, 1, 1, 1,
1.630853, 1.240559, 0.9118201, 1, 1, 1, 1, 1,
1.634703, -0.08597133, 3.374736, 1, 1, 1, 1, 1,
1.639269, 1.656446, 1.113948, 0, 0, 1, 1, 1,
1.641654, 0.3330193, 1.143367, 1, 0, 0, 1, 1,
1.657498, 1.491072, 1.377325, 1, 0, 0, 1, 1,
1.671857, -0.2874486, 1.730136, 1, 0, 0, 1, 1,
1.674312, -0.3466442, 3.318426, 1, 0, 0, 1, 1,
1.676871, 0.190005, 3.004836, 1, 0, 0, 1, 1,
1.67866, 0.4248071, 2.236623, 0, 0, 0, 1, 1,
1.700299, -0.3673151, 0.8643654, 0, 0, 0, 1, 1,
1.757476, 0.6749101, 1.069474, 0, 0, 0, 1, 1,
1.810891, -0.6314709, 1.75462, 0, 0, 0, 1, 1,
1.828881, -0.8014873, 1.846168, 0, 0, 0, 1, 1,
1.845279, -1.522303, 1.755497, 0, 0, 0, 1, 1,
1.859568, -2.699444, 2.650692, 0, 0, 0, 1, 1,
1.863845, -0.8463024, 3.60773, 1, 1, 1, 1, 1,
1.881784, 0.5674433, 1.99329, 1, 1, 1, 1, 1,
1.90394, -1.994128, 2.262504, 1, 1, 1, 1, 1,
1.910715, 0.05958369, 0.5792421, 1, 1, 1, 1, 1,
1.912277, -0.08068994, 1.908995, 1, 1, 1, 1, 1,
1.915785, -1.764034, 0.2854855, 1, 1, 1, 1, 1,
1.917745, -0.2819116, 1.723911, 1, 1, 1, 1, 1,
1.929307, -1.64889, 3.578644, 1, 1, 1, 1, 1,
1.949865, -1.846938, 1.194646, 1, 1, 1, 1, 1,
1.959634, 1.274594, -0.5968864, 1, 1, 1, 1, 1,
2.012458, -0.241328, 0.944313, 1, 1, 1, 1, 1,
2.027457, 0.6000782, 1.014752, 1, 1, 1, 1, 1,
2.034255, -0.4304248, 2.243912, 1, 1, 1, 1, 1,
2.039884, 0.6877833, 2.018716, 1, 1, 1, 1, 1,
2.07581, -1.177737, 3.464408, 1, 1, 1, 1, 1,
2.115603, -0.00669079, 2.857696, 0, 0, 1, 1, 1,
2.178884, -0.4555727, 1.459004, 1, 0, 0, 1, 1,
2.192365, 0.8366756, 2.539001, 1, 0, 0, 1, 1,
2.240073, 0.7799817, 1.426313, 1, 0, 0, 1, 1,
2.243084, -0.1489411, 2.385442, 1, 0, 0, 1, 1,
2.278994, -0.6762661, 2.171734, 1, 0, 0, 1, 1,
2.333576, 0.3846781, 1.789216, 0, 0, 0, 1, 1,
2.378895, 0.09953409, 0.8379487, 0, 0, 0, 1, 1,
2.386817, -0.5878444, 2.417308, 0, 0, 0, 1, 1,
2.402098, 1.101116, 1.90539, 0, 0, 0, 1, 1,
2.410958, -1.312381, 1.992556, 0, 0, 0, 1, 1,
2.452915, -0.1603526, 2.001806, 0, 0, 0, 1, 1,
2.482323, -1.294923, 1.006734, 0, 0, 0, 1, 1,
2.485816, 0.26784, 1.846536, 1, 1, 1, 1, 1,
2.497682, 0.5647479, 0.3841821, 1, 1, 1, 1, 1,
2.524526, -0.08290005, 1.59843, 1, 1, 1, 1, 1,
2.557176, -0.6863289, 2.064487, 1, 1, 1, 1, 1,
2.771645, 1.509023, 1.922887, 1, 1, 1, 1, 1,
2.849278, -0.7877232, 2.770699, 1, 1, 1, 1, 1,
3.424566, 0.5304722, 2.299024, 1, 1, 1, 1, 1
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
var radius = 9.541381;
var distance = 33.5137;
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
mvMatrix.translate( 0.2402077, -0.02940845, -0.4796767 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.5137);
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
