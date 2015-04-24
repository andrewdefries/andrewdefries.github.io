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
-3.424574, -2.203132, -2.160259, 1, 0, 0, 1,
-3.091358, 0.6875923, -0.3220259, 1, 0.007843138, 0, 1,
-2.973946, -1.144901, -1.972492, 1, 0.01176471, 0, 1,
-2.859641, 1.018482, -0.9298545, 1, 0.01960784, 0, 1,
-2.853639, -2.203774, -2.457169, 1, 0.02352941, 0, 1,
-2.747739, -1.21764, -1.358446, 1, 0.03137255, 0, 1,
-2.681977, 2.024164, -1.15929, 1, 0.03529412, 0, 1,
-2.643869, 0.3236535, -2.370906, 1, 0.04313726, 0, 1,
-2.543411, 0.6608249, -1.747635, 1, 0.04705882, 0, 1,
-2.494937, 0.1266142, -1.13769, 1, 0.05490196, 0, 1,
-2.457209, 0.3754027, -0.7585648, 1, 0.05882353, 0, 1,
-2.437309, 0.3646988, -0.4605381, 1, 0.06666667, 0, 1,
-2.376483, -1.275332, -1.655551, 1, 0.07058824, 0, 1,
-2.292367, -0.4455405, -1.525325, 1, 0.07843138, 0, 1,
-2.290559, 0.4521261, -0.9412823, 1, 0.08235294, 0, 1,
-2.246308, 0.3068569, -2.364054, 1, 0.09019608, 0, 1,
-2.23666, -0.6140921, -2.638386, 1, 0.09411765, 0, 1,
-2.214039, -0.5208046, -1.891145, 1, 0.1019608, 0, 1,
-2.178555, -1.961438, -2.406744, 1, 0.1098039, 0, 1,
-2.152087, 1.183783, -0.06261055, 1, 0.1137255, 0, 1,
-2.15029, -1.401746, -1.971796, 1, 0.1215686, 0, 1,
-2.082468, -0.09452473, -0.09862759, 1, 0.1254902, 0, 1,
-2.066282, 1.081609, -2.693849, 1, 0.1333333, 0, 1,
-2.061534, -0.7491477, -2.087351, 1, 0.1372549, 0, 1,
-2.044583, 1.217191, -1.416436, 1, 0.145098, 0, 1,
-1.994621, -0.6572759, -4.336706, 1, 0.1490196, 0, 1,
-1.98363, -0.4773248, -2.428506, 1, 0.1568628, 0, 1,
-1.960804, -0.5607614, -3.018573, 1, 0.1607843, 0, 1,
-1.960731, -0.383918, -3.573342, 1, 0.1686275, 0, 1,
-1.953887, 1.3035, -1.831056, 1, 0.172549, 0, 1,
-1.944148, -0.9920079, -2.586799, 1, 0.1803922, 0, 1,
-1.929678, 0.2860841, -1.749922, 1, 0.1843137, 0, 1,
-1.88695, -0.9802917, -2.671638, 1, 0.1921569, 0, 1,
-1.871801, -0.4575128, -1.178834, 1, 0.1960784, 0, 1,
-1.844961, 0.2502824, -0.6058727, 1, 0.2039216, 0, 1,
-1.839229, -0.6267539, -2.326478, 1, 0.2117647, 0, 1,
-1.835015, -0.2616369, -1.425406, 1, 0.2156863, 0, 1,
-1.805533, -0.5409351, -1.8286, 1, 0.2235294, 0, 1,
-1.802626, -1.101551, -1.387825, 1, 0.227451, 0, 1,
-1.790646, -1.641185, -2.812322, 1, 0.2352941, 0, 1,
-1.755381, 0.7415507, -3.023663, 1, 0.2392157, 0, 1,
-1.750583, 0.272662, -0.9550737, 1, 0.2470588, 0, 1,
-1.725078, -2.245674, -4.175876, 1, 0.2509804, 0, 1,
-1.722181, -0.1848759, -3.335412, 1, 0.2588235, 0, 1,
-1.712662, -0.205481, -1.02512, 1, 0.2627451, 0, 1,
-1.694156, -0.4745087, -3.03218, 1, 0.2705882, 0, 1,
-1.683244, -0.56921, -0.4599201, 1, 0.2745098, 0, 1,
-1.678313, 0.5540156, -2.062057, 1, 0.282353, 0, 1,
-1.659309, 0.5123197, -0.98298, 1, 0.2862745, 0, 1,
-1.642754, -2.156946, -3.268998, 1, 0.2941177, 0, 1,
-1.638456, 1.508021, -0.3525713, 1, 0.3019608, 0, 1,
-1.629008, -0.0742851, -2.846789, 1, 0.3058824, 0, 1,
-1.627304, -1.07008, -2.107554, 1, 0.3137255, 0, 1,
-1.607397, 1.384103, -1.999145, 1, 0.3176471, 0, 1,
-1.603889, 0.3869018, -2.110618, 1, 0.3254902, 0, 1,
-1.597929, -1.867391, -1.845338, 1, 0.3294118, 0, 1,
-1.593275, -0.1307394, -1.036059, 1, 0.3372549, 0, 1,
-1.588338, -1.669902, -2.846951, 1, 0.3411765, 0, 1,
-1.577721, 2.187053, -1.504358, 1, 0.3490196, 0, 1,
-1.573409, -0.2043379, -0.548408, 1, 0.3529412, 0, 1,
-1.556259, 0.6489784, -0.1491504, 1, 0.3607843, 0, 1,
-1.541044, -0.9816709, -3.915212, 1, 0.3647059, 0, 1,
-1.528208, 1.211614, 0.345026, 1, 0.372549, 0, 1,
-1.518975, 1.019827, -2.528241, 1, 0.3764706, 0, 1,
-1.498556, 0.9582841, -1.165309, 1, 0.3843137, 0, 1,
-1.460369, -1.859775, -2.402249, 1, 0.3882353, 0, 1,
-1.459563, 2.353333, -1.977269, 1, 0.3960784, 0, 1,
-1.458458, -0.6148961, -3.044621, 1, 0.4039216, 0, 1,
-1.457444, -0.5082755, -1.111204, 1, 0.4078431, 0, 1,
-1.4551, 1.855134, 0.5522572, 1, 0.4156863, 0, 1,
-1.450379, 1.805938, -1.61265, 1, 0.4196078, 0, 1,
-1.440915, -0.1253865, -2.325329, 1, 0.427451, 0, 1,
-1.435554, -0.4379678, -1.359568, 1, 0.4313726, 0, 1,
-1.433997, -0.5135434, -0.9159206, 1, 0.4392157, 0, 1,
-1.419276, -0.07330947, -1.288054, 1, 0.4431373, 0, 1,
-1.396892, 0.2548581, -0.8002833, 1, 0.4509804, 0, 1,
-1.362847, 1.054667, 0.1964588, 1, 0.454902, 0, 1,
-1.360629, -0.708753, -2.517327, 1, 0.4627451, 0, 1,
-1.359915, 1.067183, -1.144973, 1, 0.4666667, 0, 1,
-1.354191, 0.488798, -0.6128232, 1, 0.4745098, 0, 1,
-1.349337, 0.3918653, -2.534622, 1, 0.4784314, 0, 1,
-1.345876, -1.394512, -3.335984, 1, 0.4862745, 0, 1,
-1.338378, 2.475904, -0.5642758, 1, 0.4901961, 0, 1,
-1.333335, 1.14928, -0.8915443, 1, 0.4980392, 0, 1,
-1.320108, 0.9418988, -0.9464569, 1, 0.5058824, 0, 1,
-1.31723, 0.5215927, 1.017104, 1, 0.509804, 0, 1,
-1.316732, -0.2874272, -2.217371, 1, 0.5176471, 0, 1,
-1.316526, -1.15217, -1.564227, 1, 0.5215687, 0, 1,
-1.316484, -1.097835, -1.154403, 1, 0.5294118, 0, 1,
-1.315663, -1.524328, -3.829113, 1, 0.5333334, 0, 1,
-1.313798, 0.5576371, -0.8051555, 1, 0.5411765, 0, 1,
-1.305861, 0.4562013, -2.352709, 1, 0.5450981, 0, 1,
-1.300886, -0.3684013, -1.871884, 1, 0.5529412, 0, 1,
-1.295165, -0.5535074, -3.57273, 1, 0.5568628, 0, 1,
-1.294161, -0.666291, -2.930497, 1, 0.5647059, 0, 1,
-1.294078, 0.9233222, -1.889478, 1, 0.5686275, 0, 1,
-1.29076, -0.2615291, -2.023281, 1, 0.5764706, 0, 1,
-1.290648, 0.05456745, -1.640556, 1, 0.5803922, 0, 1,
-1.287132, -1.467197, -4.622905, 1, 0.5882353, 0, 1,
-1.275613, 0.4441121, -1.469686, 1, 0.5921569, 0, 1,
-1.261247, 0.8185573, -1.475647, 1, 0.6, 0, 1,
-1.256905, -0.008867186, -1.077659, 1, 0.6078432, 0, 1,
-1.255848, 1.641314, -0.2902116, 1, 0.6117647, 0, 1,
-1.254455, 0.0896382, -2.07765, 1, 0.6196079, 0, 1,
-1.2515, -1.533637, -1.089143, 1, 0.6235294, 0, 1,
-1.237941, 0.5717984, -1.861237, 1, 0.6313726, 0, 1,
-1.225783, -1.229627, 0.5373319, 1, 0.6352941, 0, 1,
-1.213101, 1.173317, -1.709685, 1, 0.6431373, 0, 1,
-1.20498, -1.454038, -4.696023, 1, 0.6470588, 0, 1,
-1.203953, -0.3998056, -2.157221, 1, 0.654902, 0, 1,
-1.202711, -0.1461648, -2.361382, 1, 0.6588235, 0, 1,
-1.194915, 1.406539, -2.330578, 1, 0.6666667, 0, 1,
-1.185763, -1.320337, -2.078243, 1, 0.6705883, 0, 1,
-1.179226, 0.004596997, -1.908559, 1, 0.6784314, 0, 1,
-1.174797, -0.4536905, -2.222202, 1, 0.682353, 0, 1,
-1.17339, -0.8807968, -3.841568, 1, 0.6901961, 0, 1,
-1.165543, 0.2784439, -0.8114016, 1, 0.6941177, 0, 1,
-1.16443, -0.01999621, -1.133891, 1, 0.7019608, 0, 1,
-1.163525, 2.68662, -1.053965, 1, 0.7098039, 0, 1,
-1.152695, 0.7886131, -1.610709, 1, 0.7137255, 0, 1,
-1.14823, 0.4612769, -0.4601006, 1, 0.7215686, 0, 1,
-1.13942, -1.320378, -2.609611, 1, 0.7254902, 0, 1,
-1.135709, -1.62744, -2.233678, 1, 0.7333333, 0, 1,
-1.131977, 0.5717102, -1.76169, 1, 0.7372549, 0, 1,
-1.118791, 1.661586, 0.681765, 1, 0.7450981, 0, 1,
-1.117866, -0.8995126, -2.382509, 1, 0.7490196, 0, 1,
-1.114386, 0.3347145, 0.1204466, 1, 0.7568628, 0, 1,
-1.113705, 0.05458138, -0.565653, 1, 0.7607843, 0, 1,
-1.105639, -0.7545235, -1.328197, 1, 0.7686275, 0, 1,
-1.104285, 1.660872, 0.9875931, 1, 0.772549, 0, 1,
-1.103564, -1.018807, -2.960061, 1, 0.7803922, 0, 1,
-1.100129, -1.054046, -2.280748, 1, 0.7843137, 0, 1,
-1.098809, 0.1554368, -2.571093, 1, 0.7921569, 0, 1,
-1.094317, -2.073815, -1.710142, 1, 0.7960784, 0, 1,
-1.093426, 0.6660668, -0.4068321, 1, 0.8039216, 0, 1,
-1.087617, -0.2652296, -2.466984, 1, 0.8117647, 0, 1,
-1.080418, 0.3374406, 0.04129561, 1, 0.8156863, 0, 1,
-1.077332, 0.1585663, -2.027719, 1, 0.8235294, 0, 1,
-1.075282, -1.785196, -3.954651, 1, 0.827451, 0, 1,
-1.074119, -0.6316615, -2.926172, 1, 0.8352941, 0, 1,
-1.07239, 0.7766907, -1.958623, 1, 0.8392157, 0, 1,
-1.069248, 1.389434, 0.5871876, 1, 0.8470588, 0, 1,
-1.068613, 0.4188345, 1.049813, 1, 0.8509804, 0, 1,
-1.067019, -1.154677, -0.7142334, 1, 0.8588235, 0, 1,
-1.056639, 0.4145454, -1.653345, 1, 0.8627451, 0, 1,
-1.049798, 2.003056, -1.438599, 1, 0.8705882, 0, 1,
-1.042572, -2.598714, -3.089024, 1, 0.8745098, 0, 1,
-1.033303, -0.3412751, -1.989754, 1, 0.8823529, 0, 1,
-1.028951, -0.6351794, -1.999831, 1, 0.8862745, 0, 1,
-1.026537, 0.3286718, -0.7304136, 1, 0.8941177, 0, 1,
-1.019573, -0.3612909, -2.33095, 1, 0.8980392, 0, 1,
-1.019374, 1.000263, -1.462906, 1, 0.9058824, 0, 1,
-1.008966, -0.6600825, -2.871788, 1, 0.9137255, 0, 1,
-1.00333, -0.7053143, -2.598933, 1, 0.9176471, 0, 1,
-1.001131, -0.6523241, -1.927669, 1, 0.9254902, 0, 1,
-1.000084, -0.4554698, -0.615905, 1, 0.9294118, 0, 1,
-0.9959189, -0.1529304, -2.825094, 1, 0.9372549, 0, 1,
-0.9887848, -2.521589, -2.508506, 1, 0.9411765, 0, 1,
-0.9757482, 0.6481324, -2.725961, 1, 0.9490196, 0, 1,
-0.9751325, 1.262686, 0.1675278, 1, 0.9529412, 0, 1,
-0.9712864, 1.337395, -0.9333624, 1, 0.9607843, 0, 1,
-0.9712613, -0.2421811, -1.617841, 1, 0.9647059, 0, 1,
-0.968553, -0.8702809, -2.997266, 1, 0.972549, 0, 1,
-0.9659564, 0.5248712, -1.830166, 1, 0.9764706, 0, 1,
-0.9608732, -2.511056, -2.96152, 1, 0.9843137, 0, 1,
-0.9586852, -0.0971365, -1.679898, 1, 0.9882353, 0, 1,
-0.9510724, -0.1937276, -3.357666, 1, 0.9960784, 0, 1,
-0.9484982, 1.301574, -1.352936, 0.9960784, 1, 0, 1,
-0.9455088, 1.121504, -0.3527809, 0.9921569, 1, 0, 1,
-0.9396824, 0.6947094, -1.212727, 0.9843137, 1, 0, 1,
-0.9372367, -0.3191925, -0.9369634, 0.9803922, 1, 0, 1,
-0.9334144, 1.777498, -0.9448773, 0.972549, 1, 0, 1,
-0.9321326, -1.270393, -2.999692, 0.9686275, 1, 0, 1,
-0.9319708, -1.330417, -2.590223, 0.9607843, 1, 0, 1,
-0.9273783, -1.793225, -2.504798, 0.9568627, 1, 0, 1,
-0.9265924, 0.8127763, -0.5264764, 0.9490196, 1, 0, 1,
-0.9048455, -1.488149, -1.183519, 0.945098, 1, 0, 1,
-0.901596, 1.037998, 1.066849, 0.9372549, 1, 0, 1,
-0.8956925, -0.878307, -2.219197, 0.9333333, 1, 0, 1,
-0.894203, -0.216212, -2.68711, 0.9254902, 1, 0, 1,
-0.8911279, 0.369914, -1.163193, 0.9215686, 1, 0, 1,
-0.8844689, -0.6878083, -1.814204, 0.9137255, 1, 0, 1,
-0.884231, -0.177489, -0.9570916, 0.9098039, 1, 0, 1,
-0.8841991, -0.6777177, -1.412734, 0.9019608, 1, 0, 1,
-0.8835424, 0.9880506, 0.01742367, 0.8941177, 1, 0, 1,
-0.8806257, 0.5127761, -0.4928899, 0.8901961, 1, 0, 1,
-0.8766679, 0.3307423, -1.785276, 0.8823529, 1, 0, 1,
-0.8748693, 0.4606298, -1.972335, 0.8784314, 1, 0, 1,
-0.8691868, -1.350219, -3.451466, 0.8705882, 1, 0, 1,
-0.861335, -0.4350482, -2.014021, 0.8666667, 1, 0, 1,
-0.8560682, 0.9897757, -1.804955, 0.8588235, 1, 0, 1,
-0.8551009, -0.3940749, -2.942524, 0.854902, 1, 0, 1,
-0.8450319, -0.246702, -3.73803, 0.8470588, 1, 0, 1,
-0.8442627, -0.1269944, -2.781807, 0.8431373, 1, 0, 1,
-0.8386419, -0.4787222, -2.33362, 0.8352941, 1, 0, 1,
-0.8341267, 0.07263939, -1.679699, 0.8313726, 1, 0, 1,
-0.8338497, -1.139692, -1.747535, 0.8235294, 1, 0, 1,
-0.8314645, 0.6959516, -2.325146, 0.8196079, 1, 0, 1,
-0.826502, -0.5473137, -2.670829, 0.8117647, 1, 0, 1,
-0.8239401, -1.729361, -2.779886, 0.8078431, 1, 0, 1,
-0.8231016, 0.9676715, 0.1075943, 0.8, 1, 0, 1,
-0.8197793, 0.2132449, -1.10443, 0.7921569, 1, 0, 1,
-0.8184282, 0.4057226, -0.7520958, 0.7882353, 1, 0, 1,
-0.8171991, 0.01304749, -0.9247201, 0.7803922, 1, 0, 1,
-0.8093993, -0.1544911, -2.768085, 0.7764706, 1, 0, 1,
-0.8077172, 1.473053, -0.3229954, 0.7686275, 1, 0, 1,
-0.8057303, 1.056982, -2.14611, 0.7647059, 1, 0, 1,
-0.8041013, 0.7735342, 1.277909, 0.7568628, 1, 0, 1,
-0.8020199, -1.081674, -2.186847, 0.7529412, 1, 0, 1,
-0.7977329, 0.9148368, -0.5664368, 0.7450981, 1, 0, 1,
-0.7915011, 1.199817, 0.08242284, 0.7411765, 1, 0, 1,
-0.7821796, -1.061215, -3.207635, 0.7333333, 1, 0, 1,
-0.7807512, 1.20956, 0.02430234, 0.7294118, 1, 0, 1,
-0.7801906, -0.4436276, -3.907913, 0.7215686, 1, 0, 1,
-0.7781334, -0.4264451, -2.760537, 0.7176471, 1, 0, 1,
-0.7754993, 0.6740197, -0.4448901, 0.7098039, 1, 0, 1,
-0.7720377, 0.3120852, -2.454364, 0.7058824, 1, 0, 1,
-0.7707167, -0.5780868, -1.400979, 0.6980392, 1, 0, 1,
-0.7701734, -0.3015815, -2.527233, 0.6901961, 1, 0, 1,
-0.764248, 0.5404398, -0.3649344, 0.6862745, 1, 0, 1,
-0.7614291, -0.5201263, -2.780162, 0.6784314, 1, 0, 1,
-0.7600981, -0.1937855, -3.266834, 0.6745098, 1, 0, 1,
-0.7553734, 1.249414, 0.8695447, 0.6666667, 1, 0, 1,
-0.7547581, 0.4522657, -0.8808851, 0.6627451, 1, 0, 1,
-0.7497149, -0.8559904, -1.253616, 0.654902, 1, 0, 1,
-0.7496376, 0.6868985, -1.287526, 0.6509804, 1, 0, 1,
-0.7495539, 1.328268, -0.3222133, 0.6431373, 1, 0, 1,
-0.7478071, 0.2250387, -1.449228, 0.6392157, 1, 0, 1,
-0.7468883, 1.284343, -1.051799, 0.6313726, 1, 0, 1,
-0.7450433, -1.691741, -2.555604, 0.627451, 1, 0, 1,
-0.7441648, 0.2833045, -2.383639, 0.6196079, 1, 0, 1,
-0.7379042, 1.344099, -2.162796, 0.6156863, 1, 0, 1,
-0.7357002, 0.5220534, -1.557682, 0.6078432, 1, 0, 1,
-0.7352503, -0.3474884, -4.762761, 0.6039216, 1, 0, 1,
-0.7339303, 0.4177649, -1.934848, 0.5960785, 1, 0, 1,
-0.7308444, -0.448713, -2.089874, 0.5882353, 1, 0, 1,
-0.719772, 0.3341267, -1.194923, 0.5843138, 1, 0, 1,
-0.7119067, -1.453817, -2.148355, 0.5764706, 1, 0, 1,
-0.7076517, -0.9602848, -2.351707, 0.572549, 1, 0, 1,
-0.7072669, 0.001871672, 0.05833746, 0.5647059, 1, 0, 1,
-0.7051168, 0.1928524, -3.087144, 0.5607843, 1, 0, 1,
-0.700265, -0.2293881, -2.688404, 0.5529412, 1, 0, 1,
-0.6973537, 0.214334, -0.7628539, 0.5490196, 1, 0, 1,
-0.6924525, -1.015594, -1.805071, 0.5411765, 1, 0, 1,
-0.6924451, -0.8115299, -2.855095, 0.5372549, 1, 0, 1,
-0.6920155, 0.1264709, -0.9754664, 0.5294118, 1, 0, 1,
-0.6758295, -0.0630132, -1.808775, 0.5254902, 1, 0, 1,
-0.6727846, 0.3508687, -1.098172, 0.5176471, 1, 0, 1,
-0.6701522, -1.088552, -2.744514, 0.5137255, 1, 0, 1,
-0.6687127, -0.6101359, -2.488672, 0.5058824, 1, 0, 1,
-0.6661221, -0.02706075, -1.471141, 0.5019608, 1, 0, 1,
-0.6522959, 1.28061, -1.824103, 0.4941176, 1, 0, 1,
-0.6376309, 0.2643502, -0.7846611, 0.4862745, 1, 0, 1,
-0.6369654, -0.07246686, -2.232507, 0.4823529, 1, 0, 1,
-0.6349788, -0.7652546, -1.040573, 0.4745098, 1, 0, 1,
-0.6322445, -0.3464571, -1.795584, 0.4705882, 1, 0, 1,
-0.6290563, -0.6800647, -2.295208, 0.4627451, 1, 0, 1,
-0.627381, -0.1839977, -2.971002, 0.4588235, 1, 0, 1,
-0.6236448, 0.05566667, 0.6034665, 0.4509804, 1, 0, 1,
-0.6196848, -0.2084737, -2.217582, 0.4470588, 1, 0, 1,
-0.6187184, 0.01716303, -0.6731511, 0.4392157, 1, 0, 1,
-0.6168393, -0.9984156, -5.251023, 0.4352941, 1, 0, 1,
-0.6156743, -0.809869, -4.289063, 0.427451, 1, 0, 1,
-0.6027783, -0.5044075, -0.7301829, 0.4235294, 1, 0, 1,
-0.6018111, -0.1044462, 0.1593186, 0.4156863, 1, 0, 1,
-0.5961199, -0.06429576, -1.01984, 0.4117647, 1, 0, 1,
-0.5952911, -1.169532, -3.111975, 0.4039216, 1, 0, 1,
-0.5921459, -0.1267591, -2.642343, 0.3960784, 1, 0, 1,
-0.5885557, 0.614759, 0.04310131, 0.3921569, 1, 0, 1,
-0.5884798, 0.5485438, 0.2280653, 0.3843137, 1, 0, 1,
-0.585777, 0.4688271, -2.462062, 0.3803922, 1, 0, 1,
-0.5844175, 0.1563352, -1.508695, 0.372549, 1, 0, 1,
-0.5823999, 0.8562949, 0.354215, 0.3686275, 1, 0, 1,
-0.5809196, -1.349242, -2.591049, 0.3607843, 1, 0, 1,
-0.5785555, -2.141395, -1.801509, 0.3568628, 1, 0, 1,
-0.5782536, 0.0690283, -1.826625, 0.3490196, 1, 0, 1,
-0.576794, 0.5524213, -0.1124503, 0.345098, 1, 0, 1,
-0.5749174, -0.6864589, -0.8473694, 0.3372549, 1, 0, 1,
-0.5730814, 1.791629, -0.1896484, 0.3333333, 1, 0, 1,
-0.5714905, 1.168559, 0.5653784, 0.3254902, 1, 0, 1,
-0.5704341, 0.3330974, -0.5164899, 0.3215686, 1, 0, 1,
-0.5685238, -0.4378415, -3.827313, 0.3137255, 1, 0, 1,
-0.568464, 2.02934, -1.119592, 0.3098039, 1, 0, 1,
-0.5661795, -0.103889, -2.942987, 0.3019608, 1, 0, 1,
-0.5597141, 0.8463585, -1.806906, 0.2941177, 1, 0, 1,
-0.5562604, 1.143065, 0.2969283, 0.2901961, 1, 0, 1,
-0.5523213, -0.5277491, -2.99744, 0.282353, 1, 0, 1,
-0.5496091, 0.03161527, -0.8010974, 0.2784314, 1, 0, 1,
-0.5479328, -0.6026003, -1.777472, 0.2705882, 1, 0, 1,
-0.5448584, 1.152512, 0.02883467, 0.2666667, 1, 0, 1,
-0.5445966, -0.2028223, -3.545788, 0.2588235, 1, 0, 1,
-0.5441833, 1.711284, 1.150003, 0.254902, 1, 0, 1,
-0.538218, 1.687606, -0.03468338, 0.2470588, 1, 0, 1,
-0.5370787, -0.497159, -3.693009, 0.2431373, 1, 0, 1,
-0.5299669, 1.934924, 0.5514328, 0.2352941, 1, 0, 1,
-0.5292327, 0.6757174, -2.314045, 0.2313726, 1, 0, 1,
-0.5259816, -0.2345411, -1.602573, 0.2235294, 1, 0, 1,
-0.5255011, 0.7681304, -0.7624988, 0.2196078, 1, 0, 1,
-0.5234508, -0.9628494, -2.301138, 0.2117647, 1, 0, 1,
-0.5201008, -2.144578, -3.365841, 0.2078431, 1, 0, 1,
-0.5148748, 1.246132, -0.4943908, 0.2, 1, 0, 1,
-0.5121122, 1.249301, 0.5680236, 0.1921569, 1, 0, 1,
-0.5087932, 0.7556046, -0.3716427, 0.1882353, 1, 0, 1,
-0.503645, -0.1859571, -2.129726, 0.1803922, 1, 0, 1,
-0.4976862, 0.9287304, 0.3078453, 0.1764706, 1, 0, 1,
-0.4950214, 0.9254711, 0.9378176, 0.1686275, 1, 0, 1,
-0.4938748, -0.6774926, -2.914992, 0.1647059, 1, 0, 1,
-0.493239, -0.5763912, -1.839532, 0.1568628, 1, 0, 1,
-0.4903198, -0.6386109, -2.529483, 0.1529412, 1, 0, 1,
-0.4895839, 2.241655, 0.3813122, 0.145098, 1, 0, 1,
-0.4892308, -0.6577129, -1.681534, 0.1411765, 1, 0, 1,
-0.4852732, 0.09492456, -3.264354, 0.1333333, 1, 0, 1,
-0.4849245, -0.59754, -1.870689, 0.1294118, 1, 0, 1,
-0.4789237, -0.8496252, -2.10211, 0.1215686, 1, 0, 1,
-0.4738353, 0.7891535, -1.213236, 0.1176471, 1, 0, 1,
-0.4715163, -0.1135895, -0.222095, 0.1098039, 1, 0, 1,
-0.4670953, -0.2500984, -3.063893, 0.1058824, 1, 0, 1,
-0.4670725, -1.950231, -2.758662, 0.09803922, 1, 0, 1,
-0.4632511, -1.59646, -1.842524, 0.09019608, 1, 0, 1,
-0.461141, -0.8271006, -2.979614, 0.08627451, 1, 0, 1,
-0.459133, -0.544939, -2.766966, 0.07843138, 1, 0, 1,
-0.4583901, -0.1573059, 1.050887, 0.07450981, 1, 0, 1,
-0.4560042, 1.234652, 0.2061643, 0.06666667, 1, 0, 1,
-0.4542941, -1.623203, -3.326678, 0.0627451, 1, 0, 1,
-0.4443832, 0.7605596, -1.362112, 0.05490196, 1, 0, 1,
-0.4387483, -1.147044, -0.1795497, 0.05098039, 1, 0, 1,
-0.4382966, -0.7491583, -0.2921331, 0.04313726, 1, 0, 1,
-0.43709, 1.470371, -0.7918162, 0.03921569, 1, 0, 1,
-0.4324361, -0.02934806, -0.6482705, 0.03137255, 1, 0, 1,
-0.4317325, -1.186955, -2.860331, 0.02745098, 1, 0, 1,
-0.4297238, -0.4924047, -3.442139, 0.01960784, 1, 0, 1,
-0.4243614, 0.3734102, -2.055229, 0.01568628, 1, 0, 1,
-0.4202427, -0.3719279, -1.289374, 0.007843138, 1, 0, 1,
-0.4199789, -0.5075352, -2.183902, 0.003921569, 1, 0, 1,
-0.4177414, -0.5165901, -1.799525, 0, 1, 0.003921569, 1,
-0.4176946, -1.312539, -3.060975, 0, 1, 0.01176471, 1,
-0.4159646, 0.001470774, 0.6281719, 0, 1, 0.01568628, 1,
-0.4136481, 0.3719997, -1.290715, 0, 1, 0.02352941, 1,
-0.405823, -0.5556734, -3.139068, 0, 1, 0.02745098, 1,
-0.4057638, 0.2530528, -1.356299, 0, 1, 0.03529412, 1,
-0.4057565, 2.209809, -0.7832131, 0, 1, 0.03921569, 1,
-0.4054363, 0.3292197, -1.256004, 0, 1, 0.04705882, 1,
-0.4028388, -0.8616942, -1.761438, 0, 1, 0.05098039, 1,
-0.3984679, -0.7953665, -2.251116, 0, 1, 0.05882353, 1,
-0.3979031, -0.6149687, -3.262903, 0, 1, 0.0627451, 1,
-0.3977397, -0.2473283, -2.717466, 0, 1, 0.07058824, 1,
-0.3941995, 2.087198, 0.4477693, 0, 1, 0.07450981, 1,
-0.3903123, 0.9748683, -0.8253861, 0, 1, 0.08235294, 1,
-0.38814, -0.1927515, -2.037028, 0, 1, 0.08627451, 1,
-0.3877376, -0.4959913, -2.900331, 0, 1, 0.09411765, 1,
-0.3870732, 0.6160749, -0.4073572, 0, 1, 0.1019608, 1,
-0.3864896, 0.06960766, -2.597209, 0, 1, 0.1058824, 1,
-0.3825697, -0.1969907, -2.378633, 0, 1, 0.1137255, 1,
-0.3820653, -1.85432, -2.451396, 0, 1, 0.1176471, 1,
-0.3819028, 0.4665171, 0.2639238, 0, 1, 0.1254902, 1,
-0.3740017, 0.3532163, 1.47505, 0, 1, 0.1294118, 1,
-0.371029, -0.02920979, -1.920937, 0, 1, 0.1372549, 1,
-0.3689444, 0.2144983, -0.9122854, 0, 1, 0.1411765, 1,
-0.3679007, 1.419408, 0.3215946, 0, 1, 0.1490196, 1,
-0.3622921, 0.9290477, -0.6660124, 0, 1, 0.1529412, 1,
-0.3597518, 0.2706098, -0.4137481, 0, 1, 0.1607843, 1,
-0.3559108, -0.06039256, -2.49759, 0, 1, 0.1647059, 1,
-0.3520441, -1.26127, -3.637001, 0, 1, 0.172549, 1,
-0.3425852, -0.227068, -1.835659, 0, 1, 0.1764706, 1,
-0.3398671, -1.196297, -3.370814, 0, 1, 0.1843137, 1,
-0.3396684, 0.06856872, -0.8648593, 0, 1, 0.1882353, 1,
-0.3363033, 0.5967394, 0.7797211, 0, 1, 0.1960784, 1,
-0.3340814, -0.6791887, -2.780073, 0, 1, 0.2039216, 1,
-0.3340282, 0.8845814, -0.05746746, 0, 1, 0.2078431, 1,
-0.3293418, 0.6720778, -1.390425, 0, 1, 0.2156863, 1,
-0.3277921, 0.5537496, 0.451241, 0, 1, 0.2196078, 1,
-0.3256507, 1.094559, -1.190294, 0, 1, 0.227451, 1,
-0.3253362, -1.017703, -1.847633, 0, 1, 0.2313726, 1,
-0.3244819, -0.1807067, 0.4097739, 0, 1, 0.2392157, 1,
-0.3224488, 0.8786235, 0.6435644, 0, 1, 0.2431373, 1,
-0.3176991, -0.6400907, -4.458589, 0, 1, 0.2509804, 1,
-0.3149222, 0.4649206, -1.351846, 0, 1, 0.254902, 1,
-0.313179, 1.381001, 0.5945811, 0, 1, 0.2627451, 1,
-0.3116115, -0.8855337, -5.369976, 0, 1, 0.2666667, 1,
-0.3070643, -0.8268819, -2.323855, 0, 1, 0.2745098, 1,
-0.3055344, -0.7072406, -2.525256, 0, 1, 0.2784314, 1,
-0.3047535, 0.2563401, 0.8549792, 0, 1, 0.2862745, 1,
-0.3024134, -0.8315177, -4.11735, 0, 1, 0.2901961, 1,
-0.29959, 0.5681747, -0.03966493, 0, 1, 0.2980392, 1,
-0.2974525, 2.276651, -0.6148557, 0, 1, 0.3058824, 1,
-0.290992, -0.515622, -2.819136, 0, 1, 0.3098039, 1,
-0.2877168, 1.033885, 1.007643, 0, 1, 0.3176471, 1,
-0.2821817, 0.8246876, -0.1294138, 0, 1, 0.3215686, 1,
-0.2810783, 0.9933521, -1.131052, 0, 1, 0.3294118, 1,
-0.279676, 0.6701459, -0.805346, 0, 1, 0.3333333, 1,
-0.2785433, -0.08722796, -1.723653, 0, 1, 0.3411765, 1,
-0.2761167, 1.360584, -1.435871, 0, 1, 0.345098, 1,
-0.2746554, 0.2572132, -1.544414, 0, 1, 0.3529412, 1,
-0.2736566, 0.4467701, -1.674289, 0, 1, 0.3568628, 1,
-0.2731008, 1.528019, -1.526975, 0, 1, 0.3647059, 1,
-0.2720107, -0.6825829, -3.274967, 0, 1, 0.3686275, 1,
-0.2662629, -0.6273646, -2.265124, 0, 1, 0.3764706, 1,
-0.2655001, -0.3240342, -2.967203, 0, 1, 0.3803922, 1,
-0.2653719, 1.067105, -0.2163315, 0, 1, 0.3882353, 1,
-0.262972, -0.372714, -2.128198, 0, 1, 0.3921569, 1,
-0.2529326, 0.1814556, -1.144623, 0, 1, 0.4, 1,
-0.2493862, 0.4422184, 0.03825182, 0, 1, 0.4078431, 1,
-0.240119, 0.115557, -1.500135, 0, 1, 0.4117647, 1,
-0.2348933, -0.6510537, -1.812196, 0, 1, 0.4196078, 1,
-0.2342824, 0.5134299, -0.8637055, 0, 1, 0.4235294, 1,
-0.2336352, 0.3136017, -0.7168151, 0, 1, 0.4313726, 1,
-0.2334549, -1.865964, -2.869238, 0, 1, 0.4352941, 1,
-0.2334246, -1.195689, -1.880465, 0, 1, 0.4431373, 1,
-0.2252807, -0.4035134, -2.445635, 0, 1, 0.4470588, 1,
-0.21976, -0.4795274, -3.68222, 0, 1, 0.454902, 1,
-0.2128614, -1.22544, -1.454139, 0, 1, 0.4588235, 1,
-0.2075097, 1.096208, 0.4218773, 0, 1, 0.4666667, 1,
-0.1982677, 0.2949356, -0.5762325, 0, 1, 0.4705882, 1,
-0.1966665, 0.0848007, -0.2204233, 0, 1, 0.4784314, 1,
-0.1965197, 0.03976969, -1.392542, 0, 1, 0.4823529, 1,
-0.1963001, -0.944275, -2.938487, 0, 1, 0.4901961, 1,
-0.1946291, 1.254404, -0.05680526, 0, 1, 0.4941176, 1,
-0.1908603, 0.4785476, 1.234374, 0, 1, 0.5019608, 1,
-0.1880993, 1.359404, -0.5398591, 0, 1, 0.509804, 1,
-0.1866569, 0.7505351, -1.251892, 0, 1, 0.5137255, 1,
-0.1823543, -0.9236083, -4.790732, 0, 1, 0.5215687, 1,
-0.182054, 0.4863561, -0.8779468, 0, 1, 0.5254902, 1,
-0.181097, -0.4029802, -4.366766, 0, 1, 0.5333334, 1,
-0.1791542, 0.6465198, -0.7256486, 0, 1, 0.5372549, 1,
-0.1724392, -2.227703, -1.580983, 0, 1, 0.5450981, 1,
-0.1719588, 1.909581, 1.454316, 0, 1, 0.5490196, 1,
-0.1712305, -1.133252, -3.804165, 0, 1, 0.5568628, 1,
-0.170416, -0.0687481, -3.308496, 0, 1, 0.5607843, 1,
-0.1698746, -0.9339738, -0.6054906, 0, 1, 0.5686275, 1,
-0.1685994, 0.2882246, -0.5825472, 0, 1, 0.572549, 1,
-0.1674959, -0.1624737, -1.793269, 0, 1, 0.5803922, 1,
-0.1672262, 0.1337323, -0.3940227, 0, 1, 0.5843138, 1,
-0.1661901, 0.09274299, 0.8134944, 0, 1, 0.5921569, 1,
-0.1638065, 0.5973342, -0.4307427, 0, 1, 0.5960785, 1,
-0.1596781, 0.5770633, -1.807477, 0, 1, 0.6039216, 1,
-0.1587892, 1.533476, 0.9123778, 0, 1, 0.6117647, 1,
-0.1480399, -0.2903867, -2.896052, 0, 1, 0.6156863, 1,
-0.1425912, -0.5580257, -3.460896, 0, 1, 0.6235294, 1,
-0.1384999, 0.3488264, 0.8881423, 0, 1, 0.627451, 1,
-0.1381161, -2.144198, -2.77655, 0, 1, 0.6352941, 1,
-0.1374106, -0.9785302, -2.661822, 0, 1, 0.6392157, 1,
-0.1372362, 0.2535375, 0.3023193, 0, 1, 0.6470588, 1,
-0.1354265, 0.5726188, -0.9140132, 0, 1, 0.6509804, 1,
-0.1331576, -0.4175875, -2.294541, 0, 1, 0.6588235, 1,
-0.1293739, -1.769612, -2.673452, 0, 1, 0.6627451, 1,
-0.1167103, 0.2120848, 0.151268, 0, 1, 0.6705883, 1,
-0.1155371, 0.1031703, -1.600235, 0, 1, 0.6745098, 1,
-0.1106861, 1.559947, -1.611039, 0, 1, 0.682353, 1,
-0.1054176, 1.004836, 0.249765, 0, 1, 0.6862745, 1,
-0.1052215, 0.3877151, -1.377477, 0, 1, 0.6941177, 1,
-0.1050105, -0.4493294, -3.241045, 0, 1, 0.7019608, 1,
-0.1043933, 0.1795966, 1.56085, 0, 1, 0.7058824, 1,
-0.1010933, -0.3082523, -1.815497, 0, 1, 0.7137255, 1,
-0.09996643, -0.1182775, -2.633875, 0, 1, 0.7176471, 1,
-0.09875666, 0.9136814, -0.07492304, 0, 1, 0.7254902, 1,
-0.09595133, -0.1014882, -2.696218, 0, 1, 0.7294118, 1,
-0.0943759, 0.6204638, -0.2217942, 0, 1, 0.7372549, 1,
-0.09372161, 0.4698799, -1.911764, 0, 1, 0.7411765, 1,
-0.08822279, -1.724215, -1.91379, 0, 1, 0.7490196, 1,
-0.07879665, 0.4148186, -1.88924, 0, 1, 0.7529412, 1,
-0.07755967, -0.5097229, -3.970566, 0, 1, 0.7607843, 1,
-0.07201462, -0.1699017, -1.959931, 0, 1, 0.7647059, 1,
-0.06863401, -0.2103614, -4.122424, 0, 1, 0.772549, 1,
-0.06004148, 1.636154, -0.7240957, 0, 1, 0.7764706, 1,
-0.05895061, 1.170833, -0.5848075, 0, 1, 0.7843137, 1,
-0.05750359, 0.03704149, -0.9970966, 0, 1, 0.7882353, 1,
-0.05172513, -0.1623467, -1.6931, 0, 1, 0.7960784, 1,
-0.05087742, -0.2049454, -2.449636, 0, 1, 0.8039216, 1,
-0.04984769, -0.7049664, -2.554821, 0, 1, 0.8078431, 1,
-0.04747449, -0.5961092, -2.141424, 0, 1, 0.8156863, 1,
-0.04687802, -0.03809674, -3.807539, 0, 1, 0.8196079, 1,
-0.04501142, 0.6193802, -0.8969061, 0, 1, 0.827451, 1,
-0.04417254, -0.906173, -3.424062, 0, 1, 0.8313726, 1,
-0.0423155, -0.3569989, -2.881507, 0, 1, 0.8392157, 1,
-0.04203121, -1.912957, -1.906936, 0, 1, 0.8431373, 1,
-0.03509793, 0.1952916, -1.43769, 0, 1, 0.8509804, 1,
-0.03378507, -2.592272, -3.003221, 0, 1, 0.854902, 1,
-0.0306006, 1.770425, 0.4280499, 0, 1, 0.8627451, 1,
-0.03016417, 0.548883, -1.232634, 0, 1, 0.8666667, 1,
-0.02961107, -0.1429355, -2.605296, 0, 1, 0.8745098, 1,
-0.02526672, 0.3657446, -0.6725856, 0, 1, 0.8784314, 1,
-0.01621101, -0.8964477, -1.787496, 0, 1, 0.8862745, 1,
-0.01274541, 0.5824327, 0.1458892, 0, 1, 0.8901961, 1,
-0.01173718, 0.01920491, -2.229372, 0, 1, 0.8980392, 1,
-0.01133245, -0.5234438, -3.020153, 0, 1, 0.9058824, 1,
-0.007230891, 0.2916283, -0.7158716, 0, 1, 0.9098039, 1,
-0.006192513, 0.09898974, 0.5415909, 0, 1, 0.9176471, 1,
-0.005768042, -0.2645423, -1.94625, 0, 1, 0.9215686, 1,
-0.0001659932, 0.07146921, -0.2210741, 0, 1, 0.9294118, 1,
0.002755842, -1.068075, 3.200572, 0, 1, 0.9333333, 1,
0.004674085, -2.783892, 2.21698, 0, 1, 0.9411765, 1,
0.007958429, 0.02385322, -3.039056, 0, 1, 0.945098, 1,
0.00867968, -0.3845213, 2.80963, 0, 1, 0.9529412, 1,
0.00962964, 0.5440229, -0.144503, 0, 1, 0.9568627, 1,
0.01009309, 1.244526, 0.238238, 0, 1, 0.9647059, 1,
0.01428782, -0.07057917, 2.932745, 0, 1, 0.9686275, 1,
0.01443876, -0.5786543, 2.293067, 0, 1, 0.9764706, 1,
0.0153078, -1.606228, 4.769772, 0, 1, 0.9803922, 1,
0.01647519, -0.1953695, 3.704623, 0, 1, 0.9882353, 1,
0.01822453, 1.836026, -1.445066, 0, 1, 0.9921569, 1,
0.02123497, -1.898076, 4.153062, 0, 1, 1, 1,
0.02874562, -1.653035, 2.400872, 0, 0.9921569, 1, 1,
0.02886428, -1.346338, 4.334373, 0, 0.9882353, 1, 1,
0.03372097, 1.666778, -0.9101884, 0, 0.9803922, 1, 1,
0.04036225, -1.524832, 4.135592, 0, 0.9764706, 1, 1,
0.04038816, 0.5885175, -0.5123036, 0, 0.9686275, 1, 1,
0.04196022, -0.2328479, 2.20621, 0, 0.9647059, 1, 1,
0.04198314, 0.2023316, -1.308099, 0, 0.9568627, 1, 1,
0.04378545, -0.3976663, 3.418484, 0, 0.9529412, 1, 1,
0.04503514, 1.073391, -0.07432649, 0, 0.945098, 1, 1,
0.0486572, 0.339257, 0.7724751, 0, 0.9411765, 1, 1,
0.05636718, 0.6372315, 0.3992471, 0, 0.9333333, 1, 1,
0.05636735, 1.401169, 0.097759, 0, 0.9294118, 1, 1,
0.05876545, -0.845038, 3.944127, 0, 0.9215686, 1, 1,
0.06080389, 1.835612, -1.490882, 0, 0.9176471, 1, 1,
0.06522178, 1.474827, 0.5081393, 0, 0.9098039, 1, 1,
0.06858054, -0.01718035, 1.703429, 0, 0.9058824, 1, 1,
0.07035803, 1.637956, 0.2583374, 0, 0.8980392, 1, 1,
0.07068985, -0.08906236, 2.136188, 0, 0.8901961, 1, 1,
0.0744536, 0.5328859, -1.391353, 0, 0.8862745, 1, 1,
0.07652518, -1.520652, 5.227757, 0, 0.8784314, 1, 1,
0.08526742, 0.5143965, -0.09753838, 0, 0.8745098, 1, 1,
0.08553063, -0.5539879, 3.815455, 0, 0.8666667, 1, 1,
0.0884326, -1.203412, 3.852861, 0, 0.8627451, 1, 1,
0.09486903, 1.343113, -0.9967331, 0, 0.854902, 1, 1,
0.09541932, 2.382522, 0.00898848, 0, 0.8509804, 1, 1,
0.09665751, 0.03675359, 1.091883, 0, 0.8431373, 1, 1,
0.1071625, -0.4754807, 2.280619, 0, 0.8392157, 1, 1,
0.1104599, 0.2708814, 0.3210586, 0, 0.8313726, 1, 1,
0.1209427, 0.3438314, 2.258741, 0, 0.827451, 1, 1,
0.1233456, -0.1746754, 2.86014, 0, 0.8196079, 1, 1,
0.128423, 1.543025, 1.724835, 0, 0.8156863, 1, 1,
0.1295842, -0.1980082, 2.310889, 0, 0.8078431, 1, 1,
0.1325377, 0.247412, 0.6361336, 0, 0.8039216, 1, 1,
0.1330413, -1.259692, 3.842684, 0, 0.7960784, 1, 1,
0.1354553, -0.1318753, 2.502439, 0, 0.7882353, 1, 1,
0.1436966, 1.890651, 1.081912, 0, 0.7843137, 1, 1,
0.1441019, -0.9921595, 1.612568, 0, 0.7764706, 1, 1,
0.1447459, 1.145993, -0.3398876, 0, 0.772549, 1, 1,
0.1456422, 0.06853447, 1.835387, 0, 0.7647059, 1, 1,
0.1462728, 1.578213, 0.1701892, 0, 0.7607843, 1, 1,
0.146982, 0.6964287, -0.2571309, 0, 0.7529412, 1, 1,
0.1476522, -1.655497, 2.909764, 0, 0.7490196, 1, 1,
0.1487033, 0.1769424, 0.8423417, 0, 0.7411765, 1, 1,
0.1617424, -0.2169235, 1.928093, 0, 0.7372549, 1, 1,
0.1622539, 1.66975, 0.1478364, 0, 0.7294118, 1, 1,
0.1640059, -0.8098855, 4.31339, 0, 0.7254902, 1, 1,
0.1656892, -0.1327447, 2.937559, 0, 0.7176471, 1, 1,
0.167294, 2.190669, -0.4657623, 0, 0.7137255, 1, 1,
0.1676549, -1.448285, 4.279364, 0, 0.7058824, 1, 1,
0.1690444, 0.6225665, -0.6607279, 0, 0.6980392, 1, 1,
0.1703023, -0.3359312, 4.134141, 0, 0.6941177, 1, 1,
0.1716944, 0.06048696, 1.060988, 0, 0.6862745, 1, 1,
0.1772013, 0.2915208, 0.6896256, 0, 0.682353, 1, 1,
0.1791232, 0.03001103, 3.495159, 0, 0.6745098, 1, 1,
0.1811809, -0.4448109, 2.020458, 0, 0.6705883, 1, 1,
0.1829715, 0.1803256, 1.43929, 0, 0.6627451, 1, 1,
0.1846488, 1.769766, -1.565932, 0, 0.6588235, 1, 1,
0.1881967, 0.2983964, -0.1603862, 0, 0.6509804, 1, 1,
0.1886828, 0.3022981, 1.90616, 0, 0.6470588, 1, 1,
0.1910017, 1.356784, -0.5146818, 0, 0.6392157, 1, 1,
0.192019, -0.2606745, 2.738052, 0, 0.6352941, 1, 1,
0.1928235, 0.2749201, 0.7988223, 0, 0.627451, 1, 1,
0.1947132, 0.4881833, 0.1154241, 0, 0.6235294, 1, 1,
0.1974796, 0.1142827, 0.754041, 0, 0.6156863, 1, 1,
0.2003929, -1.192968, 3.014072, 0, 0.6117647, 1, 1,
0.2008002, -0.9163471, 2.392317, 0, 0.6039216, 1, 1,
0.2041118, 1.12113, -1.736149, 0, 0.5960785, 1, 1,
0.2069769, 0.7799314, -0.2964698, 0, 0.5921569, 1, 1,
0.2093963, -1.024575, 4.106255, 0, 0.5843138, 1, 1,
0.2118261, 0.3639357, -0.4922667, 0, 0.5803922, 1, 1,
0.2129904, 1.20065, -0.6146755, 0, 0.572549, 1, 1,
0.2181486, -1.273721, 1.901997, 0, 0.5686275, 1, 1,
0.2218352, -0.6315893, 1.269818, 0, 0.5607843, 1, 1,
0.2231287, 0.6275488, -0.7091452, 0, 0.5568628, 1, 1,
0.225477, 0.1275786, 0.9719733, 0, 0.5490196, 1, 1,
0.2290902, -1.45047, 2.579215, 0, 0.5450981, 1, 1,
0.2298847, 0.007575093, 3.243947, 0, 0.5372549, 1, 1,
0.2299245, -1.72442, 3.031508, 0, 0.5333334, 1, 1,
0.2347709, -0.2180859, 3.043085, 0, 0.5254902, 1, 1,
0.2420501, -0.4554453, 2.581046, 0, 0.5215687, 1, 1,
0.2450047, 0.266601, 1.479491, 0, 0.5137255, 1, 1,
0.2491619, -0.04693228, 0.7334257, 0, 0.509804, 1, 1,
0.2501384, -0.204499, 3.09531, 0, 0.5019608, 1, 1,
0.253167, -0.8923013, 3.328959, 0, 0.4941176, 1, 1,
0.255641, 1.235796, -1.565561, 0, 0.4901961, 1, 1,
0.2569041, 0.1283868, 2.687462, 0, 0.4823529, 1, 1,
0.2649883, -1.069861, 2.826648, 0, 0.4784314, 1, 1,
0.2740877, -1.137536, 3.771245, 0, 0.4705882, 1, 1,
0.2743675, -0.7026228, 3.329903, 0, 0.4666667, 1, 1,
0.2768801, -1.342114, 1.835991, 0, 0.4588235, 1, 1,
0.2784384, 2.238229, -1.16776, 0, 0.454902, 1, 1,
0.2788552, 0.3200409, 0.6541412, 0, 0.4470588, 1, 1,
0.2824176, 1.018291, 0.8079939, 0, 0.4431373, 1, 1,
0.2838823, -1.229978, 3.443146, 0, 0.4352941, 1, 1,
0.2889204, 0.5802977, 0.8046516, 0, 0.4313726, 1, 1,
0.2896507, -1.115425, 2.150312, 0, 0.4235294, 1, 1,
0.290808, -0.2257593, 2.607363, 0, 0.4196078, 1, 1,
0.2927634, -0.7279101, 2.938297, 0, 0.4117647, 1, 1,
0.2941649, 0.9302095, -0.2703438, 0, 0.4078431, 1, 1,
0.295716, -0.8146845, 0.8036704, 0, 0.4, 1, 1,
0.2962093, -0.6617694, 2.558148, 0, 0.3921569, 1, 1,
0.3037159, -0.8860533, 3.60146, 0, 0.3882353, 1, 1,
0.3077751, -0.4719203, 1.248575, 0, 0.3803922, 1, 1,
0.3113471, 1.021962, 0.0429898, 0, 0.3764706, 1, 1,
0.3115861, 0.6985473, 0.7173771, 0, 0.3686275, 1, 1,
0.3148889, 0.3774559, 0.5845562, 0, 0.3647059, 1, 1,
0.3152241, -1.054265, 4.407864, 0, 0.3568628, 1, 1,
0.3185463, -0.7380233, 1.977091, 0, 0.3529412, 1, 1,
0.3319445, -0.5309896, 3.428543, 0, 0.345098, 1, 1,
0.3378641, -0.4116491, 2.074122, 0, 0.3411765, 1, 1,
0.3410029, 1.657751, -0.50971, 0, 0.3333333, 1, 1,
0.344698, -0.8417045, 2.805299, 0, 0.3294118, 1, 1,
0.3458983, 0.8314104, -3.218868, 0, 0.3215686, 1, 1,
0.3478067, 0.08648755, 0.5779768, 0, 0.3176471, 1, 1,
0.3496773, -0.9030291, 3.040139, 0, 0.3098039, 1, 1,
0.3529153, 0.2639771, 1.200315, 0, 0.3058824, 1, 1,
0.353686, 0.08142362, 2.79641, 0, 0.2980392, 1, 1,
0.3538457, 0.4141669, -1.154381, 0, 0.2901961, 1, 1,
0.3539639, -0.2355379, 1.145478, 0, 0.2862745, 1, 1,
0.3579522, 0.06580338, 3.461382, 0, 0.2784314, 1, 1,
0.3588825, 1.679585, 0.8632216, 0, 0.2745098, 1, 1,
0.3637698, 0.4085715, 0.9067715, 0, 0.2666667, 1, 1,
0.3650075, -1.832087, 3.340719, 0, 0.2627451, 1, 1,
0.371333, -0.5041156, 3.487678, 0, 0.254902, 1, 1,
0.3747337, 0.8198869, 0.9774026, 0, 0.2509804, 1, 1,
0.375789, 0.2094992, -0.07275722, 0, 0.2431373, 1, 1,
0.3772272, 0.1434272, 3.146053, 0, 0.2392157, 1, 1,
0.3787878, 0.1073904, 1.453335, 0, 0.2313726, 1, 1,
0.3790242, 1.150738, -0.07145941, 0, 0.227451, 1, 1,
0.3855028, 0.6012321, 1.51368, 0, 0.2196078, 1, 1,
0.391554, -1.406868, 2.205577, 0, 0.2156863, 1, 1,
0.3956188, -1.92142, 4.029702, 0, 0.2078431, 1, 1,
0.3992897, 1.458987, 1.100699, 0, 0.2039216, 1, 1,
0.4005516, 0.5496584, 1.215557, 0, 0.1960784, 1, 1,
0.4036434, 0.8828736, 1.087433, 0, 0.1882353, 1, 1,
0.4085014, 1.052457, 1.093565, 0, 0.1843137, 1, 1,
0.4090867, -0.9390469, 3.225695, 0, 0.1764706, 1, 1,
0.4108086, -0.08463388, 1.388271, 0, 0.172549, 1, 1,
0.4110376, -0.5635658, 2.443702, 0, 0.1647059, 1, 1,
0.418975, 0.1439659, -0.430023, 0, 0.1607843, 1, 1,
0.4208003, -1.099384, 4.26923, 0, 0.1529412, 1, 1,
0.4267768, -0.1436786, 1.771121, 0, 0.1490196, 1, 1,
0.4269731, -0.3949514, 1.937683, 0, 0.1411765, 1, 1,
0.4275417, 1.0329, 0.1452933, 0, 0.1372549, 1, 1,
0.4355162, -0.7829989, 1.542535, 0, 0.1294118, 1, 1,
0.4372748, -1.122518, 2.605518, 0, 0.1254902, 1, 1,
0.4375605, 0.4859091, 0.5956274, 0, 0.1176471, 1, 1,
0.4399968, 0.4795159, -0.1048006, 0, 0.1137255, 1, 1,
0.4425739, -0.03731391, 1.620027, 0, 0.1058824, 1, 1,
0.4438418, 1.155728, 0.5755203, 0, 0.09803922, 1, 1,
0.4439731, -1.294838, 1.999957, 0, 0.09411765, 1, 1,
0.4448015, 0.5420996, 1.559487, 0, 0.08627451, 1, 1,
0.4461374, -1.261685, 3.177634, 0, 0.08235294, 1, 1,
0.4491738, 0.5396591, 1.955582, 0, 0.07450981, 1, 1,
0.451866, -2.501331, 2.639234, 0, 0.07058824, 1, 1,
0.4527514, -1.1465, 4.110861, 0, 0.0627451, 1, 1,
0.4538211, 1.044572, 0.4976373, 0, 0.05882353, 1, 1,
0.4540941, 0.2834283, 1.424979, 0, 0.05098039, 1, 1,
0.4550147, -0.4080404, 3.569328, 0, 0.04705882, 1, 1,
0.4599664, -0.864715, 3.76378, 0, 0.03921569, 1, 1,
0.4679077, -0.8688865, 2.441824, 0, 0.03529412, 1, 1,
0.4688655, 2.052146, -0.3804302, 0, 0.02745098, 1, 1,
0.470203, -0.291164, -0.09520258, 0, 0.02352941, 1, 1,
0.4713236, -0.6952361, 2.810829, 0, 0.01568628, 1, 1,
0.4738268, -1.185369, 1.531503, 0, 0.01176471, 1, 1,
0.474492, 1.273836, 1.049401, 0, 0.003921569, 1, 1,
0.4759734, -1.18127, 2.619115, 0.003921569, 0, 1, 1,
0.4790867, -0.1420411, 1.816449, 0.007843138, 0, 1, 1,
0.4799178, -0.1688641, 2.599167, 0.01568628, 0, 1, 1,
0.4802846, 1.915658, -0.2982183, 0.01960784, 0, 1, 1,
0.4843733, 1.659143, 0.2958915, 0.02745098, 0, 1, 1,
0.4909139, 0.3010724, -0.2191759, 0.03137255, 0, 1, 1,
0.4918771, 1.238175, -0.2323835, 0.03921569, 0, 1, 1,
0.4960959, -1.327845, 4.733028, 0.04313726, 0, 1, 1,
0.4968991, -1.402148, 1.341166, 0.05098039, 0, 1, 1,
0.4995414, -0.5327467, 5.064058, 0.05490196, 0, 1, 1,
0.5011276, 0.7506974, -0.502884, 0.0627451, 0, 1, 1,
0.5049054, -0.3949849, 2.797952, 0.06666667, 0, 1, 1,
0.5058894, -3.456789, 0.5585868, 0.07450981, 0, 1, 1,
0.5070977, -0.9462948, 0.9528427, 0.07843138, 0, 1, 1,
0.5141648, -1.891868, 3.598232, 0.08627451, 0, 1, 1,
0.5151696, 0.3233065, 2.331944, 0.09019608, 0, 1, 1,
0.5154163, 1.718815, -0.7022347, 0.09803922, 0, 1, 1,
0.5171311, -0.9185907, 0.6227589, 0.1058824, 0, 1, 1,
0.5184583, 0.8960938, 1.460335, 0.1098039, 0, 1, 1,
0.5216259, -1.311489, 2.953128, 0.1176471, 0, 1, 1,
0.5234643, -0.002561196, 1.878104, 0.1215686, 0, 1, 1,
0.52452, 0.08823762, 0.3567685, 0.1294118, 0, 1, 1,
0.5246251, 1.375537, -0.08971626, 0.1333333, 0, 1, 1,
0.5253944, -2.077642, 3.857397, 0.1411765, 0, 1, 1,
0.5268075, 0.3392688, 0.08616894, 0.145098, 0, 1, 1,
0.527456, -1.049559, 3.433481, 0.1529412, 0, 1, 1,
0.5291978, 0.170523, 2.069391, 0.1568628, 0, 1, 1,
0.5334813, -0.8137556, 1.978219, 0.1647059, 0, 1, 1,
0.5348841, 0.2217642, 0.5596012, 0.1686275, 0, 1, 1,
0.5351256, 0.2861112, 1.857525, 0.1764706, 0, 1, 1,
0.5359767, 1.046147, 0.7784074, 0.1803922, 0, 1, 1,
0.5420674, 2.354776, 1.128683, 0.1882353, 0, 1, 1,
0.5433304, -0.4907154, 1.096462, 0.1921569, 0, 1, 1,
0.5440173, 0.427544, 0.6067711, 0.2, 0, 1, 1,
0.5497577, -0.05803257, 0.8463846, 0.2078431, 0, 1, 1,
0.5590693, 1.228387, -1.273623, 0.2117647, 0, 1, 1,
0.5640404, 0.5777985, -0.2535951, 0.2196078, 0, 1, 1,
0.5645103, -0.2208059, 1.749941, 0.2235294, 0, 1, 1,
0.5678874, -0.4329581, 1.676725, 0.2313726, 0, 1, 1,
0.575816, -1.299874, 1.498312, 0.2352941, 0, 1, 1,
0.5788087, 1.108085, 0.8264462, 0.2431373, 0, 1, 1,
0.5791013, -0.1452754, 1.086689, 0.2470588, 0, 1, 1,
0.5844402, 0.3984974, 1.898407, 0.254902, 0, 1, 1,
0.60245, 0.8606573, 0.4062919, 0.2588235, 0, 1, 1,
0.6077299, -1.430643, 4.450643, 0.2666667, 0, 1, 1,
0.6117679, -2.21789, 3.536879, 0.2705882, 0, 1, 1,
0.6170276, -0.09607905, 1.923725, 0.2784314, 0, 1, 1,
0.6185479, 1.66504, -1.19108, 0.282353, 0, 1, 1,
0.6222717, 0.9611199, 1.049976, 0.2901961, 0, 1, 1,
0.6261439, 1.387998, -1.56266, 0.2941177, 0, 1, 1,
0.6264593, 0.8040347, 2.249032, 0.3019608, 0, 1, 1,
0.628906, -0.1422145, 3.039205, 0.3098039, 0, 1, 1,
0.631703, -1.174588, 1.794483, 0.3137255, 0, 1, 1,
0.6433295, 1.294026, 1.028976, 0.3215686, 0, 1, 1,
0.6444545, 0.4211926, 2.262166, 0.3254902, 0, 1, 1,
0.6459749, 0.7606942, 2.156168, 0.3333333, 0, 1, 1,
0.6460536, 1.250582, 0.05480487, 0.3372549, 0, 1, 1,
0.6476513, 1.221885, 0.8523606, 0.345098, 0, 1, 1,
0.6496187, -1.898597, 2.771182, 0.3490196, 0, 1, 1,
0.6531838, 0.07368065, 2.417418, 0.3568628, 0, 1, 1,
0.6537684, 1.434621, 0.3663289, 0.3607843, 0, 1, 1,
0.6540966, 2.287564, 0.1728169, 0.3686275, 0, 1, 1,
0.6549031, -1.763045, 4.173309, 0.372549, 0, 1, 1,
0.657376, -0.07464788, 0.3807005, 0.3803922, 0, 1, 1,
0.662304, -1.355995, 0.5640571, 0.3843137, 0, 1, 1,
0.6624562, 0.9427088, -0.775462, 0.3921569, 0, 1, 1,
0.665081, 0.2496422, 0.1734424, 0.3960784, 0, 1, 1,
0.6658228, -0.7850506, 2.737213, 0.4039216, 0, 1, 1,
0.669513, 0.936588, 0.6510924, 0.4117647, 0, 1, 1,
0.6736366, 0.1584847, 1.387749, 0.4156863, 0, 1, 1,
0.6838124, 0.1516329, 0.6837195, 0.4235294, 0, 1, 1,
0.6850131, -0.6096728, 2.032962, 0.427451, 0, 1, 1,
0.6877836, -0.85458, 1.481768, 0.4352941, 0, 1, 1,
0.6890677, -0.5680477, 1.930067, 0.4392157, 0, 1, 1,
0.6910474, -0.1675773, 3.369994, 0.4470588, 0, 1, 1,
0.6910488, 0.8464128, 1.919789, 0.4509804, 0, 1, 1,
0.6937577, 0.4282608, 2.031678, 0.4588235, 0, 1, 1,
0.6976171, 1.072581, -0.9456075, 0.4627451, 0, 1, 1,
0.7000005, -0.3026036, 1.040869, 0.4705882, 0, 1, 1,
0.7001632, -0.7913414, 1.334981, 0.4745098, 0, 1, 1,
0.7058586, -0.01445395, -0.1977224, 0.4823529, 0, 1, 1,
0.708537, 0.1317034, 1.78587, 0.4862745, 0, 1, 1,
0.7085632, -0.7120163, 4.181243, 0.4941176, 0, 1, 1,
0.7096503, -2.1951, 3.22374, 0.5019608, 0, 1, 1,
0.7098454, 1.233111, 1.840874, 0.5058824, 0, 1, 1,
0.7187883, 0.1422004, 3.998178, 0.5137255, 0, 1, 1,
0.7249081, -1.289379, 2.588247, 0.5176471, 0, 1, 1,
0.7280576, 1.110542, 0.7037128, 0.5254902, 0, 1, 1,
0.7281889, 1.661234, -1.378762, 0.5294118, 0, 1, 1,
0.7391654, -2.351756, 2.635713, 0.5372549, 0, 1, 1,
0.7404057, 0.1838183, 0.6487959, 0.5411765, 0, 1, 1,
0.7416888, -0.5132583, 1.580953, 0.5490196, 0, 1, 1,
0.7434729, -0.510134, 2.221727, 0.5529412, 0, 1, 1,
0.744552, 1.1182, 0.6854998, 0.5607843, 0, 1, 1,
0.7491029, -0.9378952, 2.271401, 0.5647059, 0, 1, 1,
0.7506955, 0.1969576, 2.689005, 0.572549, 0, 1, 1,
0.7538154, -0.6636884, 1.473994, 0.5764706, 0, 1, 1,
0.7626404, -0.7712516, 1.881229, 0.5843138, 0, 1, 1,
0.7631616, 0.4230211, 2.292066, 0.5882353, 0, 1, 1,
0.7639756, -0.1231864, 2.316041, 0.5960785, 0, 1, 1,
0.764002, 0.8513539, -0.0631093, 0.6039216, 0, 1, 1,
0.7676646, -0.06935377, 1.395519, 0.6078432, 0, 1, 1,
0.77352, 1.504521, -0.1635519, 0.6156863, 0, 1, 1,
0.7750139, 0.105564, 1.71107, 0.6196079, 0, 1, 1,
0.7809399, 0.09590222, 1.590017, 0.627451, 0, 1, 1,
0.7840643, -1.642592, 3.006822, 0.6313726, 0, 1, 1,
0.7893995, -1.034639, 1.755242, 0.6392157, 0, 1, 1,
0.7978581, 0.2652701, 2.343819, 0.6431373, 0, 1, 1,
0.7986814, -1.341504, 4.003569, 0.6509804, 0, 1, 1,
0.8017405, 0.1916512, 1.596206, 0.654902, 0, 1, 1,
0.8092873, 0.4476065, 1.213498, 0.6627451, 0, 1, 1,
0.8095032, 0.2248659, -0.7269297, 0.6666667, 0, 1, 1,
0.8102963, 0.6644251, 1.10707, 0.6745098, 0, 1, 1,
0.8123543, 0.1761218, 0.4006755, 0.6784314, 0, 1, 1,
0.822745, 0.7652657, 0.296539, 0.6862745, 0, 1, 1,
0.8353108, -0.3834102, 0.3800749, 0.6901961, 0, 1, 1,
0.8376287, -0.7106978, 1.616651, 0.6980392, 0, 1, 1,
0.8398111, -0.6923003, 2.368697, 0.7058824, 0, 1, 1,
0.8403612, 0.269508, 0.001828974, 0.7098039, 0, 1, 1,
0.8415672, -0.1197148, 1.60584, 0.7176471, 0, 1, 1,
0.8417488, -1.889421, 3.824866, 0.7215686, 0, 1, 1,
0.8527287, 1.541069, 1.583887, 0.7294118, 0, 1, 1,
0.8550615, -0.7867843, 3.500065, 0.7333333, 0, 1, 1,
0.8659526, 1.09138, 0.3206868, 0.7411765, 0, 1, 1,
0.8665391, -0.7162091, 1.936321, 0.7450981, 0, 1, 1,
0.869118, 1.136832, 0.8604081, 0.7529412, 0, 1, 1,
0.8698581, -0.2015852, 0.8415289, 0.7568628, 0, 1, 1,
0.8700838, -1.149414, 2.71555, 0.7647059, 0, 1, 1,
0.8725655, 0.4384091, 2.134374, 0.7686275, 0, 1, 1,
0.8753517, -0.5285814, 2.966429, 0.7764706, 0, 1, 1,
0.8776133, -2.07701, 0.3933603, 0.7803922, 0, 1, 1,
0.879198, -0.08015006, 2.006771, 0.7882353, 0, 1, 1,
0.8795463, 0.6405205, -0.5747616, 0.7921569, 0, 1, 1,
0.8809295, -0.6559186, 2.07653, 0.8, 0, 1, 1,
0.8845295, -1.394845, 3.471745, 0.8078431, 0, 1, 1,
0.8857663, 0.2486818, -0.4901744, 0.8117647, 0, 1, 1,
0.8860767, -0.6399061, 3.349849, 0.8196079, 0, 1, 1,
0.8881266, -0.4344457, 1.583874, 0.8235294, 0, 1, 1,
0.8891767, -0.3876408, 1.31257, 0.8313726, 0, 1, 1,
0.898756, 0.4204453, 2.243495, 0.8352941, 0, 1, 1,
0.9006007, -0.5393504, 2.712013, 0.8431373, 0, 1, 1,
0.9045332, 0.6466452, -0.08514141, 0.8470588, 0, 1, 1,
0.9054726, 0.2743476, 0.7571212, 0.854902, 0, 1, 1,
0.9057326, 0.6661196, 1.696386, 0.8588235, 0, 1, 1,
0.9066325, -0.1628965, 0.8945725, 0.8666667, 0, 1, 1,
0.9171219, 0.92443, -0.1356689, 0.8705882, 0, 1, 1,
0.918098, -0.5336518, 1.162883, 0.8784314, 0, 1, 1,
0.9246355, -1.054029, 1.156174, 0.8823529, 0, 1, 1,
0.9272305, -0.9086675, 2.084262, 0.8901961, 0, 1, 1,
0.9276394, 0.3494034, 0.5256429, 0.8941177, 0, 1, 1,
0.9291784, 0.03997194, 2.924924, 0.9019608, 0, 1, 1,
0.9295919, 0.4496441, -0.1108059, 0.9098039, 0, 1, 1,
0.9324182, -1.566352, 3.205044, 0.9137255, 0, 1, 1,
0.9403895, 0.6670653, 0.5353929, 0.9215686, 0, 1, 1,
0.9405991, -1.68265, 3.279926, 0.9254902, 0, 1, 1,
0.9406337, -1.919369, 4.421814, 0.9333333, 0, 1, 1,
0.9430699, 0.07363729, 3.987532, 0.9372549, 0, 1, 1,
0.9601127, 0.9016386, 1.297179, 0.945098, 0, 1, 1,
0.9664096, -0.6128349, 2.146151, 0.9490196, 0, 1, 1,
0.9729031, -0.6284646, 3.248633, 0.9568627, 0, 1, 1,
0.9754496, 1.327448, -0.7438073, 0.9607843, 0, 1, 1,
0.9785356, -1.168455, 0.4206311, 0.9686275, 0, 1, 1,
0.9883762, 0.4425694, 1.104854, 0.972549, 0, 1, 1,
0.9981881, 1.797654, 0.4739104, 0.9803922, 0, 1, 1,
0.9997014, 0.08505449, 1.791809, 0.9843137, 0, 1, 1,
1.000916, -1.184149, 1.669523, 0.9921569, 0, 1, 1,
1.001825, 0.539924, 1.509292, 0.9960784, 0, 1, 1,
1.002944, 0.1789141, 3.463572, 1, 0, 0.9960784, 1,
1.003763, 0.999105, 1.144732, 1, 0, 0.9882353, 1,
1.004629, -0.2359607, 0.5447822, 1, 0, 0.9843137, 1,
1.006558, -0.3846431, 2.03939, 1, 0, 0.9764706, 1,
1.014257, 0.2781332, 1.17268, 1, 0, 0.972549, 1,
1.017186, 1.363329, -0.3464907, 1, 0, 0.9647059, 1,
1.017231, -0.07001054, 0.1633998, 1, 0, 0.9607843, 1,
1.02088, 0.4715727, 0.3471488, 1, 0, 0.9529412, 1,
1.025657, 0.1798191, 0.878961, 1, 0, 0.9490196, 1,
1.027882, 1.319466, 1.101569, 1, 0, 0.9411765, 1,
1.033749, 1.698609, 1.540792, 1, 0, 0.9372549, 1,
1.046719, 0.4520742, 0.6900037, 1, 0, 0.9294118, 1,
1.048242, 0.3044758, -0.5381521, 1, 0, 0.9254902, 1,
1.048907, -2.350251, 0.6437802, 1, 0, 0.9176471, 1,
1.051887, 0.7261003, 0.3524644, 1, 0, 0.9137255, 1,
1.062072, 1.06682, 0.4921849, 1, 0, 0.9058824, 1,
1.062649, -0.3107736, 0.1244855, 1, 0, 0.9019608, 1,
1.06912, -0.9102883, 3.472021, 1, 0, 0.8941177, 1,
1.072734, -2.061767, 2.657156, 1, 0, 0.8862745, 1,
1.074527, 0.172103, 1.864483, 1, 0, 0.8823529, 1,
1.081541, 0.8709394, 1.41457, 1, 0, 0.8745098, 1,
1.082738, 0.297309, -0.4474242, 1, 0, 0.8705882, 1,
1.084098, 0.1728193, 2.984472, 1, 0, 0.8627451, 1,
1.087099, -0.01252068, 0.5787039, 1, 0, 0.8588235, 1,
1.089061, -0.5070698, 1.262132, 1, 0, 0.8509804, 1,
1.097842, -1.126001, 3.516106, 1, 0, 0.8470588, 1,
1.098128, -1.061962, 1.344042, 1, 0, 0.8392157, 1,
1.098343, -0.700677, 1.98806, 1, 0, 0.8352941, 1,
1.101938, -1.335145, 2.248525, 1, 0, 0.827451, 1,
1.104394, -1.191489, 1.206952, 1, 0, 0.8235294, 1,
1.108028, 0.6762423, 2.003803, 1, 0, 0.8156863, 1,
1.113707, -1.064641, 2.046989, 1, 0, 0.8117647, 1,
1.125022, 0.9544299, -0.1009402, 1, 0, 0.8039216, 1,
1.131845, -0.9863234, 2.841785, 1, 0, 0.7960784, 1,
1.132174, -1.729229, 0.736048, 1, 0, 0.7921569, 1,
1.132535, -0.2993984, 1.723978, 1, 0, 0.7843137, 1,
1.138493, 0.1252267, -0.3511873, 1, 0, 0.7803922, 1,
1.139187, -0.9984536, 3.049832, 1, 0, 0.772549, 1,
1.145929, -0.7122759, 1.869829, 1, 0, 0.7686275, 1,
1.152484, 0.9605672, -0.1177111, 1, 0, 0.7607843, 1,
1.153243, 0.3968782, 1.381216, 1, 0, 0.7568628, 1,
1.156372, -0.3561656, 2.062599, 1, 0, 0.7490196, 1,
1.157108, 0.3084775, 0.5468867, 1, 0, 0.7450981, 1,
1.157632, 1.047563, -0.2927717, 1, 0, 0.7372549, 1,
1.160949, -0.8119308, 1.850765, 1, 0, 0.7333333, 1,
1.164537, -0.1619318, 1.876524, 1, 0, 0.7254902, 1,
1.16669, 1.381132, 1.840833, 1, 0, 0.7215686, 1,
1.171007, 2.090251, 0.8071234, 1, 0, 0.7137255, 1,
1.179029, 0.6635329, 1.701114, 1, 0, 0.7098039, 1,
1.180659, 0.2615289, 1.518674, 1, 0, 0.7019608, 1,
1.183378, 0.6699842, 1.87851, 1, 0, 0.6941177, 1,
1.192743, 1.302384, -1.636611, 1, 0, 0.6901961, 1,
1.193097, 0.6718399, 1.176236, 1, 0, 0.682353, 1,
1.197347, -0.1745478, 2.140443, 1, 0, 0.6784314, 1,
1.197644, -0.07413842, 3.345606, 1, 0, 0.6705883, 1,
1.198357, 0.1089121, -0.01763562, 1, 0, 0.6666667, 1,
1.202598, 2.560658, 0.6695763, 1, 0, 0.6588235, 1,
1.211918, 1.21659, 0.4184974, 1, 0, 0.654902, 1,
1.216029, 1.36388, 1.305467, 1, 0, 0.6470588, 1,
1.220169, -0.4631957, 2.418578, 1, 0, 0.6431373, 1,
1.223151, 0.2624938, 0.4809077, 1, 0, 0.6352941, 1,
1.225731, -0.3641524, 2.017574, 1, 0, 0.6313726, 1,
1.232557, -1.353693, 2.283202, 1, 0, 0.6235294, 1,
1.238534, 0.829256, 0.5427294, 1, 0, 0.6196079, 1,
1.245129, 0.7433597, 1.401715, 1, 0, 0.6117647, 1,
1.256496, 0.4207252, 0.6272161, 1, 0, 0.6078432, 1,
1.260978, 0.3470485, 3.792812, 1, 0, 0.6, 1,
1.268496, -0.95847, 1.600398, 1, 0, 0.5921569, 1,
1.278593, 0.1090452, 2.457165, 1, 0, 0.5882353, 1,
1.27907, 0.6466416, 1.414692, 1, 0, 0.5803922, 1,
1.28021, -0.5127119, 1.863449, 1, 0, 0.5764706, 1,
1.289994, -0.1735552, 0.1230248, 1, 0, 0.5686275, 1,
1.291655, 1.147473, 1.876485, 1, 0, 0.5647059, 1,
1.29171, 0.5106605, 3.36977, 1, 0, 0.5568628, 1,
1.29287, 1.213269, 1.040726, 1, 0, 0.5529412, 1,
1.298084, -0.4764881, 2.867145, 1, 0, 0.5450981, 1,
1.298317, 0.2723744, 1.551812, 1, 0, 0.5411765, 1,
1.303825, -1.095077, 1.140518, 1, 0, 0.5333334, 1,
1.308565, -1.547268, 0.8531027, 1, 0, 0.5294118, 1,
1.31126, -0.6449099, 2.342217, 1, 0, 0.5215687, 1,
1.311452, -0.1930624, 0.4594014, 1, 0, 0.5176471, 1,
1.319797, -0.5094905, 2.616841, 1, 0, 0.509804, 1,
1.346633, -1.518207, 3.451937, 1, 0, 0.5058824, 1,
1.352734, -0.1409991, 1.111416, 1, 0, 0.4980392, 1,
1.3649, 0.9017141, 2.161195, 1, 0, 0.4901961, 1,
1.367277, -0.2408599, 0.9321551, 1, 0, 0.4862745, 1,
1.370086, 0.4736963, 1.053963, 1, 0, 0.4784314, 1,
1.374322, 0.1039443, 1.002813, 1, 0, 0.4745098, 1,
1.387311, 0.9047608, 0.4366489, 1, 0, 0.4666667, 1,
1.389851, -0.8694211, 2.561789, 1, 0, 0.4627451, 1,
1.390671, -0.9585674, 1.540185, 1, 0, 0.454902, 1,
1.393981, 0.3050836, 1.943962, 1, 0, 0.4509804, 1,
1.400611, 0.07982998, 0.08659694, 1, 0, 0.4431373, 1,
1.404408, -0.06019939, 0.8515821, 1, 0, 0.4392157, 1,
1.406019, 0.8116108, 1.470574, 1, 0, 0.4313726, 1,
1.407479, -0.2141818, 1.538513, 1, 0, 0.427451, 1,
1.410058, -0.9645481, 1.180884, 1, 0, 0.4196078, 1,
1.427389, -1.733006, 3.887395, 1, 0, 0.4156863, 1,
1.433722, 1.14378, 1.675341, 1, 0, 0.4078431, 1,
1.434945, -2.299753, 3.610401, 1, 0, 0.4039216, 1,
1.435125, 0.3463748, 2.292615, 1, 0, 0.3960784, 1,
1.436492, -0.06611133, 0.4683987, 1, 0, 0.3882353, 1,
1.442686, -1.260462, 0.1429424, 1, 0, 0.3843137, 1,
1.456553, 1.77718, 0.5798158, 1, 0, 0.3764706, 1,
1.458794, 0.9404616, -0.6083645, 1, 0, 0.372549, 1,
1.467171, 1.134224, 2.467853, 1, 0, 0.3647059, 1,
1.475592, -0.5039381, 3.418317, 1, 0, 0.3607843, 1,
1.498971, -1.357373, 4.026482, 1, 0, 0.3529412, 1,
1.510203, 0.8641163, 1.948342, 1, 0, 0.3490196, 1,
1.519934, -0.1530818, 2.564183, 1, 0, 0.3411765, 1,
1.530165, -0.3477961, 2.011675, 1, 0, 0.3372549, 1,
1.536919, -0.02029267, 2.720246, 1, 0, 0.3294118, 1,
1.541972, 0.9431422, 2.238333, 1, 0, 0.3254902, 1,
1.548785, -0.4321853, 1.661301, 1, 0, 0.3176471, 1,
1.55967, 0.9939085, 0.3314482, 1, 0, 0.3137255, 1,
1.579336, 0.8821269, -0.3387112, 1, 0, 0.3058824, 1,
1.581525, 0.1973286, 2.109851, 1, 0, 0.2980392, 1,
1.590356, -0.3254818, 1.605801, 1, 0, 0.2941177, 1,
1.592884, -0.9472943, 1.591182, 1, 0, 0.2862745, 1,
1.596207, 0.3386562, 0.9056862, 1, 0, 0.282353, 1,
1.601488, -1.612438, 2.768336, 1, 0, 0.2745098, 1,
1.605257, -0.6208473, 1.833876, 1, 0, 0.2705882, 1,
1.607725, -0.840359, 0.9595916, 1, 0, 0.2627451, 1,
1.613319, -0.1006792, 1.014657, 1, 0, 0.2588235, 1,
1.613434, 1.337221, 0.6066595, 1, 0, 0.2509804, 1,
1.616813, -0.1931343, 2.005934, 1, 0, 0.2470588, 1,
1.624681, 1.392529, 1.234719, 1, 0, 0.2392157, 1,
1.630278, -0.06681353, 3.008988, 1, 0, 0.2352941, 1,
1.636075, -0.6459488, 1.144866, 1, 0, 0.227451, 1,
1.652713, -1.546746, 1.739612, 1, 0, 0.2235294, 1,
1.70453, 0.04552264, 1.041802, 1, 0, 0.2156863, 1,
1.725458, 0.6117231, 3.245067, 1, 0, 0.2117647, 1,
1.774943, 0.6085947, 1.776321, 1, 0, 0.2039216, 1,
1.781309, 1.719554, 0.9022623, 1, 0, 0.1960784, 1,
1.789241, -1.148504, 0.6920449, 1, 0, 0.1921569, 1,
1.799098, 1.169817, 0.1104943, 1, 0, 0.1843137, 1,
1.800509, 1.308402, -0.07753419, 1, 0, 0.1803922, 1,
1.807583, -0.7577308, 2.562897, 1, 0, 0.172549, 1,
1.816966, 1.092453, 1.744832, 1, 0, 0.1686275, 1,
1.818579, 0.01205314, 0.6212501, 1, 0, 0.1607843, 1,
1.86048, 2.31873, 0.6224405, 1, 0, 0.1568628, 1,
1.871687, 0.2098498, 0.2788907, 1, 0, 0.1490196, 1,
1.881919, 0.9803577, 1.433968, 1, 0, 0.145098, 1,
1.886262, -1.131394, 2.450542, 1, 0, 0.1372549, 1,
1.912502, 0.4268652, -0.1323401, 1, 0, 0.1333333, 1,
1.949073, 0.08708125, -0.2081729, 1, 0, 0.1254902, 1,
1.958118, 0.6430446, 1.919304, 1, 0, 0.1215686, 1,
1.975571, 0.9329488, 2.162313, 1, 0, 0.1137255, 1,
1.977163, -0.3031314, -0.4604644, 1, 0, 0.1098039, 1,
1.977914, 0.5682437, 1.993309, 1, 0, 0.1019608, 1,
1.996997, -1.067183, 1.834183, 1, 0, 0.09411765, 1,
2.094761, -0.1144754, 1.625947, 1, 0, 0.09019608, 1,
2.121689, 0.6432824, 1.115648, 1, 0, 0.08235294, 1,
2.165738, -1.11138, 0.9499924, 1, 0, 0.07843138, 1,
2.168459, -0.06406789, 0.4679266, 1, 0, 0.07058824, 1,
2.18244, 0.5434726, 0.8066299, 1, 0, 0.06666667, 1,
2.19066, -1.892419, 4.074883, 1, 0, 0.05882353, 1,
2.378862, 1.670736, -0.7532942, 1, 0, 0.05490196, 1,
2.45565, 0.01777728, 2.075869, 1, 0, 0.04705882, 1,
2.503211, 1.49, 0.5656542, 1, 0, 0.04313726, 1,
2.522258, -1.81652, 1.398282, 1, 0, 0.03529412, 1,
2.555764, 1.265259, 0.3023276, 1, 0, 0.03137255, 1,
2.85025, -0.9115335, 0.9724303, 1, 0, 0.02352941, 1,
2.982649, 0.6501186, 1.217405, 1, 0, 0.01960784, 1,
3.017655, -0.4551164, 2.658779, 1, 0, 0.01176471, 1,
3.272924, 1.68416, 2.521687, 1, 0, 0.007843138, 1
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
-0.07582498, -4.498096, -7.166292, 0, -0.5, 0.5, 0.5,
-0.07582498, -4.498096, -7.166292, 1, -0.5, 0.5, 0.5,
-0.07582498, -4.498096, -7.166292, 1, 1.5, 0.5, 0.5,
-0.07582498, -4.498096, -7.166292, 0, 1.5, 0.5, 0.5
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
-4.5598, -0.3850845, -7.166292, 0, -0.5, 0.5, 0.5,
-4.5598, -0.3850845, -7.166292, 1, -0.5, 0.5, 0.5,
-4.5598, -0.3850845, -7.166292, 1, 1.5, 0.5, 0.5,
-4.5598, -0.3850845, -7.166292, 0, 1.5, 0.5, 0.5
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
-4.5598, -4.498096, -0.07110977, 0, -0.5, 0.5, 0.5,
-4.5598, -4.498096, -0.07110977, 1, -0.5, 0.5, 0.5,
-4.5598, -4.498096, -0.07110977, 1, 1.5, 0.5, 0.5,
-4.5598, -4.498096, -0.07110977, 0, 1.5, 0.5, 0.5
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
-3, -3.54894, -5.528942,
3, -3.54894, -5.528942,
-3, -3.54894, -5.528942,
-3, -3.707133, -5.801834,
-2, -3.54894, -5.528942,
-2, -3.707133, -5.801834,
-1, -3.54894, -5.528942,
-1, -3.707133, -5.801834,
0, -3.54894, -5.528942,
0, -3.707133, -5.801834,
1, -3.54894, -5.528942,
1, -3.707133, -5.801834,
2, -3.54894, -5.528942,
2, -3.707133, -5.801834,
3, -3.54894, -5.528942,
3, -3.707133, -5.801834
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
-3, -4.023518, -6.347617, 0, -0.5, 0.5, 0.5,
-3, -4.023518, -6.347617, 1, -0.5, 0.5, 0.5,
-3, -4.023518, -6.347617, 1, 1.5, 0.5, 0.5,
-3, -4.023518, -6.347617, 0, 1.5, 0.5, 0.5,
-2, -4.023518, -6.347617, 0, -0.5, 0.5, 0.5,
-2, -4.023518, -6.347617, 1, -0.5, 0.5, 0.5,
-2, -4.023518, -6.347617, 1, 1.5, 0.5, 0.5,
-2, -4.023518, -6.347617, 0, 1.5, 0.5, 0.5,
-1, -4.023518, -6.347617, 0, -0.5, 0.5, 0.5,
-1, -4.023518, -6.347617, 1, -0.5, 0.5, 0.5,
-1, -4.023518, -6.347617, 1, 1.5, 0.5, 0.5,
-1, -4.023518, -6.347617, 0, 1.5, 0.5, 0.5,
0, -4.023518, -6.347617, 0, -0.5, 0.5, 0.5,
0, -4.023518, -6.347617, 1, -0.5, 0.5, 0.5,
0, -4.023518, -6.347617, 1, 1.5, 0.5, 0.5,
0, -4.023518, -6.347617, 0, 1.5, 0.5, 0.5,
1, -4.023518, -6.347617, 0, -0.5, 0.5, 0.5,
1, -4.023518, -6.347617, 1, -0.5, 0.5, 0.5,
1, -4.023518, -6.347617, 1, 1.5, 0.5, 0.5,
1, -4.023518, -6.347617, 0, 1.5, 0.5, 0.5,
2, -4.023518, -6.347617, 0, -0.5, 0.5, 0.5,
2, -4.023518, -6.347617, 1, -0.5, 0.5, 0.5,
2, -4.023518, -6.347617, 1, 1.5, 0.5, 0.5,
2, -4.023518, -6.347617, 0, 1.5, 0.5, 0.5,
3, -4.023518, -6.347617, 0, -0.5, 0.5, 0.5,
3, -4.023518, -6.347617, 1, -0.5, 0.5, 0.5,
3, -4.023518, -6.347617, 1, 1.5, 0.5, 0.5,
3, -4.023518, -6.347617, 0, 1.5, 0.5, 0.5
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
-3.525036, -3, -5.528942,
-3.525036, 2, -5.528942,
-3.525036, -3, -5.528942,
-3.697497, -3, -5.801834,
-3.525036, -2, -5.528942,
-3.697497, -2, -5.801834,
-3.525036, -1, -5.528942,
-3.697497, -1, -5.801834,
-3.525036, 0, -5.528942,
-3.697497, 0, -5.801834,
-3.525036, 1, -5.528942,
-3.697497, 1, -5.801834,
-3.525036, 2, -5.528942,
-3.697497, 2, -5.801834
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
-4.042418, -3, -6.347617, 0, -0.5, 0.5, 0.5,
-4.042418, -3, -6.347617, 1, -0.5, 0.5, 0.5,
-4.042418, -3, -6.347617, 1, 1.5, 0.5, 0.5,
-4.042418, -3, -6.347617, 0, 1.5, 0.5, 0.5,
-4.042418, -2, -6.347617, 0, -0.5, 0.5, 0.5,
-4.042418, -2, -6.347617, 1, -0.5, 0.5, 0.5,
-4.042418, -2, -6.347617, 1, 1.5, 0.5, 0.5,
-4.042418, -2, -6.347617, 0, 1.5, 0.5, 0.5,
-4.042418, -1, -6.347617, 0, -0.5, 0.5, 0.5,
-4.042418, -1, -6.347617, 1, -0.5, 0.5, 0.5,
-4.042418, -1, -6.347617, 1, 1.5, 0.5, 0.5,
-4.042418, -1, -6.347617, 0, 1.5, 0.5, 0.5,
-4.042418, 0, -6.347617, 0, -0.5, 0.5, 0.5,
-4.042418, 0, -6.347617, 1, -0.5, 0.5, 0.5,
-4.042418, 0, -6.347617, 1, 1.5, 0.5, 0.5,
-4.042418, 0, -6.347617, 0, 1.5, 0.5, 0.5,
-4.042418, 1, -6.347617, 0, -0.5, 0.5, 0.5,
-4.042418, 1, -6.347617, 1, -0.5, 0.5, 0.5,
-4.042418, 1, -6.347617, 1, 1.5, 0.5, 0.5,
-4.042418, 1, -6.347617, 0, 1.5, 0.5, 0.5,
-4.042418, 2, -6.347617, 0, -0.5, 0.5, 0.5,
-4.042418, 2, -6.347617, 1, -0.5, 0.5, 0.5,
-4.042418, 2, -6.347617, 1, 1.5, 0.5, 0.5,
-4.042418, 2, -6.347617, 0, 1.5, 0.5, 0.5
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
-3.525036, -3.54894, -4,
-3.525036, -3.54894, 4,
-3.525036, -3.54894, -4,
-3.697497, -3.707133, -4,
-3.525036, -3.54894, -2,
-3.697497, -3.707133, -2,
-3.525036, -3.54894, 0,
-3.697497, -3.707133, 0,
-3.525036, -3.54894, 2,
-3.697497, -3.707133, 2,
-3.525036, -3.54894, 4,
-3.697497, -3.707133, 4
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
-4.042418, -4.023518, -4, 0, -0.5, 0.5, 0.5,
-4.042418, -4.023518, -4, 1, -0.5, 0.5, 0.5,
-4.042418, -4.023518, -4, 1, 1.5, 0.5, 0.5,
-4.042418, -4.023518, -4, 0, 1.5, 0.5, 0.5,
-4.042418, -4.023518, -2, 0, -0.5, 0.5, 0.5,
-4.042418, -4.023518, -2, 1, -0.5, 0.5, 0.5,
-4.042418, -4.023518, -2, 1, 1.5, 0.5, 0.5,
-4.042418, -4.023518, -2, 0, 1.5, 0.5, 0.5,
-4.042418, -4.023518, 0, 0, -0.5, 0.5, 0.5,
-4.042418, -4.023518, 0, 1, -0.5, 0.5, 0.5,
-4.042418, -4.023518, 0, 1, 1.5, 0.5, 0.5,
-4.042418, -4.023518, 0, 0, 1.5, 0.5, 0.5,
-4.042418, -4.023518, 2, 0, -0.5, 0.5, 0.5,
-4.042418, -4.023518, 2, 1, -0.5, 0.5, 0.5,
-4.042418, -4.023518, 2, 1, 1.5, 0.5, 0.5,
-4.042418, -4.023518, 2, 0, 1.5, 0.5, 0.5,
-4.042418, -4.023518, 4, 0, -0.5, 0.5, 0.5,
-4.042418, -4.023518, 4, 1, -0.5, 0.5, 0.5,
-4.042418, -4.023518, 4, 1, 1.5, 0.5, 0.5,
-4.042418, -4.023518, 4, 0, 1.5, 0.5, 0.5
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
-3.525036, -3.54894, -5.528942,
-3.525036, 2.778771, -5.528942,
-3.525036, -3.54894, 5.386723,
-3.525036, 2.778771, 5.386723,
-3.525036, -3.54894, -5.528942,
-3.525036, -3.54894, 5.386723,
-3.525036, 2.778771, -5.528942,
-3.525036, 2.778771, 5.386723,
-3.525036, -3.54894, -5.528942,
3.373386, -3.54894, -5.528942,
-3.525036, -3.54894, 5.386723,
3.373386, -3.54894, 5.386723,
-3.525036, 2.778771, -5.528942,
3.373386, 2.778771, -5.528942,
-3.525036, 2.778771, 5.386723,
3.373386, 2.778771, 5.386723,
3.373386, -3.54894, -5.528942,
3.373386, 2.778771, -5.528942,
3.373386, -3.54894, 5.386723,
3.373386, 2.778771, 5.386723,
3.373386, -3.54894, -5.528942,
3.373386, -3.54894, 5.386723,
3.373386, 2.778771, -5.528942,
3.373386, 2.778771, 5.386723
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
var radius = 7.678557;
var distance = 34.16277;
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
mvMatrix.translate( 0.07582498, 0.3850845, 0.07110977 );
mvMatrix.scale( 1.203493, 1.312039, 0.7605773 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.16277);
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
levamisole<-read.table("levamisole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-levamisole$V2
```

```
## Error in eval(expr, envir, enclos): object 'levamisole' not found
```

```r
y<-levamisole$V3
```

```
## Error in eval(expr, envir, enclos): object 'levamisole' not found
```

```r
z<-levamisole$V4
```

```
## Error in eval(expr, envir, enclos): object 'levamisole' not found
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
-3.424574, -2.203132, -2.160259, 0, 0, 1, 1, 1,
-3.091358, 0.6875923, -0.3220259, 1, 0, 0, 1, 1,
-2.973946, -1.144901, -1.972492, 1, 0, 0, 1, 1,
-2.859641, 1.018482, -0.9298545, 1, 0, 0, 1, 1,
-2.853639, -2.203774, -2.457169, 1, 0, 0, 1, 1,
-2.747739, -1.21764, -1.358446, 1, 0, 0, 1, 1,
-2.681977, 2.024164, -1.15929, 0, 0, 0, 1, 1,
-2.643869, 0.3236535, -2.370906, 0, 0, 0, 1, 1,
-2.543411, 0.6608249, -1.747635, 0, 0, 0, 1, 1,
-2.494937, 0.1266142, -1.13769, 0, 0, 0, 1, 1,
-2.457209, 0.3754027, -0.7585648, 0, 0, 0, 1, 1,
-2.437309, 0.3646988, -0.4605381, 0, 0, 0, 1, 1,
-2.376483, -1.275332, -1.655551, 0, 0, 0, 1, 1,
-2.292367, -0.4455405, -1.525325, 1, 1, 1, 1, 1,
-2.290559, 0.4521261, -0.9412823, 1, 1, 1, 1, 1,
-2.246308, 0.3068569, -2.364054, 1, 1, 1, 1, 1,
-2.23666, -0.6140921, -2.638386, 1, 1, 1, 1, 1,
-2.214039, -0.5208046, -1.891145, 1, 1, 1, 1, 1,
-2.178555, -1.961438, -2.406744, 1, 1, 1, 1, 1,
-2.152087, 1.183783, -0.06261055, 1, 1, 1, 1, 1,
-2.15029, -1.401746, -1.971796, 1, 1, 1, 1, 1,
-2.082468, -0.09452473, -0.09862759, 1, 1, 1, 1, 1,
-2.066282, 1.081609, -2.693849, 1, 1, 1, 1, 1,
-2.061534, -0.7491477, -2.087351, 1, 1, 1, 1, 1,
-2.044583, 1.217191, -1.416436, 1, 1, 1, 1, 1,
-1.994621, -0.6572759, -4.336706, 1, 1, 1, 1, 1,
-1.98363, -0.4773248, -2.428506, 1, 1, 1, 1, 1,
-1.960804, -0.5607614, -3.018573, 1, 1, 1, 1, 1,
-1.960731, -0.383918, -3.573342, 0, 0, 1, 1, 1,
-1.953887, 1.3035, -1.831056, 1, 0, 0, 1, 1,
-1.944148, -0.9920079, -2.586799, 1, 0, 0, 1, 1,
-1.929678, 0.2860841, -1.749922, 1, 0, 0, 1, 1,
-1.88695, -0.9802917, -2.671638, 1, 0, 0, 1, 1,
-1.871801, -0.4575128, -1.178834, 1, 0, 0, 1, 1,
-1.844961, 0.2502824, -0.6058727, 0, 0, 0, 1, 1,
-1.839229, -0.6267539, -2.326478, 0, 0, 0, 1, 1,
-1.835015, -0.2616369, -1.425406, 0, 0, 0, 1, 1,
-1.805533, -0.5409351, -1.8286, 0, 0, 0, 1, 1,
-1.802626, -1.101551, -1.387825, 0, 0, 0, 1, 1,
-1.790646, -1.641185, -2.812322, 0, 0, 0, 1, 1,
-1.755381, 0.7415507, -3.023663, 0, 0, 0, 1, 1,
-1.750583, 0.272662, -0.9550737, 1, 1, 1, 1, 1,
-1.725078, -2.245674, -4.175876, 1, 1, 1, 1, 1,
-1.722181, -0.1848759, -3.335412, 1, 1, 1, 1, 1,
-1.712662, -0.205481, -1.02512, 1, 1, 1, 1, 1,
-1.694156, -0.4745087, -3.03218, 1, 1, 1, 1, 1,
-1.683244, -0.56921, -0.4599201, 1, 1, 1, 1, 1,
-1.678313, 0.5540156, -2.062057, 1, 1, 1, 1, 1,
-1.659309, 0.5123197, -0.98298, 1, 1, 1, 1, 1,
-1.642754, -2.156946, -3.268998, 1, 1, 1, 1, 1,
-1.638456, 1.508021, -0.3525713, 1, 1, 1, 1, 1,
-1.629008, -0.0742851, -2.846789, 1, 1, 1, 1, 1,
-1.627304, -1.07008, -2.107554, 1, 1, 1, 1, 1,
-1.607397, 1.384103, -1.999145, 1, 1, 1, 1, 1,
-1.603889, 0.3869018, -2.110618, 1, 1, 1, 1, 1,
-1.597929, -1.867391, -1.845338, 1, 1, 1, 1, 1,
-1.593275, -0.1307394, -1.036059, 0, 0, 1, 1, 1,
-1.588338, -1.669902, -2.846951, 1, 0, 0, 1, 1,
-1.577721, 2.187053, -1.504358, 1, 0, 0, 1, 1,
-1.573409, -0.2043379, -0.548408, 1, 0, 0, 1, 1,
-1.556259, 0.6489784, -0.1491504, 1, 0, 0, 1, 1,
-1.541044, -0.9816709, -3.915212, 1, 0, 0, 1, 1,
-1.528208, 1.211614, 0.345026, 0, 0, 0, 1, 1,
-1.518975, 1.019827, -2.528241, 0, 0, 0, 1, 1,
-1.498556, 0.9582841, -1.165309, 0, 0, 0, 1, 1,
-1.460369, -1.859775, -2.402249, 0, 0, 0, 1, 1,
-1.459563, 2.353333, -1.977269, 0, 0, 0, 1, 1,
-1.458458, -0.6148961, -3.044621, 0, 0, 0, 1, 1,
-1.457444, -0.5082755, -1.111204, 0, 0, 0, 1, 1,
-1.4551, 1.855134, 0.5522572, 1, 1, 1, 1, 1,
-1.450379, 1.805938, -1.61265, 1, 1, 1, 1, 1,
-1.440915, -0.1253865, -2.325329, 1, 1, 1, 1, 1,
-1.435554, -0.4379678, -1.359568, 1, 1, 1, 1, 1,
-1.433997, -0.5135434, -0.9159206, 1, 1, 1, 1, 1,
-1.419276, -0.07330947, -1.288054, 1, 1, 1, 1, 1,
-1.396892, 0.2548581, -0.8002833, 1, 1, 1, 1, 1,
-1.362847, 1.054667, 0.1964588, 1, 1, 1, 1, 1,
-1.360629, -0.708753, -2.517327, 1, 1, 1, 1, 1,
-1.359915, 1.067183, -1.144973, 1, 1, 1, 1, 1,
-1.354191, 0.488798, -0.6128232, 1, 1, 1, 1, 1,
-1.349337, 0.3918653, -2.534622, 1, 1, 1, 1, 1,
-1.345876, -1.394512, -3.335984, 1, 1, 1, 1, 1,
-1.338378, 2.475904, -0.5642758, 1, 1, 1, 1, 1,
-1.333335, 1.14928, -0.8915443, 1, 1, 1, 1, 1,
-1.320108, 0.9418988, -0.9464569, 0, 0, 1, 1, 1,
-1.31723, 0.5215927, 1.017104, 1, 0, 0, 1, 1,
-1.316732, -0.2874272, -2.217371, 1, 0, 0, 1, 1,
-1.316526, -1.15217, -1.564227, 1, 0, 0, 1, 1,
-1.316484, -1.097835, -1.154403, 1, 0, 0, 1, 1,
-1.315663, -1.524328, -3.829113, 1, 0, 0, 1, 1,
-1.313798, 0.5576371, -0.8051555, 0, 0, 0, 1, 1,
-1.305861, 0.4562013, -2.352709, 0, 0, 0, 1, 1,
-1.300886, -0.3684013, -1.871884, 0, 0, 0, 1, 1,
-1.295165, -0.5535074, -3.57273, 0, 0, 0, 1, 1,
-1.294161, -0.666291, -2.930497, 0, 0, 0, 1, 1,
-1.294078, 0.9233222, -1.889478, 0, 0, 0, 1, 1,
-1.29076, -0.2615291, -2.023281, 0, 0, 0, 1, 1,
-1.290648, 0.05456745, -1.640556, 1, 1, 1, 1, 1,
-1.287132, -1.467197, -4.622905, 1, 1, 1, 1, 1,
-1.275613, 0.4441121, -1.469686, 1, 1, 1, 1, 1,
-1.261247, 0.8185573, -1.475647, 1, 1, 1, 1, 1,
-1.256905, -0.008867186, -1.077659, 1, 1, 1, 1, 1,
-1.255848, 1.641314, -0.2902116, 1, 1, 1, 1, 1,
-1.254455, 0.0896382, -2.07765, 1, 1, 1, 1, 1,
-1.2515, -1.533637, -1.089143, 1, 1, 1, 1, 1,
-1.237941, 0.5717984, -1.861237, 1, 1, 1, 1, 1,
-1.225783, -1.229627, 0.5373319, 1, 1, 1, 1, 1,
-1.213101, 1.173317, -1.709685, 1, 1, 1, 1, 1,
-1.20498, -1.454038, -4.696023, 1, 1, 1, 1, 1,
-1.203953, -0.3998056, -2.157221, 1, 1, 1, 1, 1,
-1.202711, -0.1461648, -2.361382, 1, 1, 1, 1, 1,
-1.194915, 1.406539, -2.330578, 1, 1, 1, 1, 1,
-1.185763, -1.320337, -2.078243, 0, 0, 1, 1, 1,
-1.179226, 0.004596997, -1.908559, 1, 0, 0, 1, 1,
-1.174797, -0.4536905, -2.222202, 1, 0, 0, 1, 1,
-1.17339, -0.8807968, -3.841568, 1, 0, 0, 1, 1,
-1.165543, 0.2784439, -0.8114016, 1, 0, 0, 1, 1,
-1.16443, -0.01999621, -1.133891, 1, 0, 0, 1, 1,
-1.163525, 2.68662, -1.053965, 0, 0, 0, 1, 1,
-1.152695, 0.7886131, -1.610709, 0, 0, 0, 1, 1,
-1.14823, 0.4612769, -0.4601006, 0, 0, 0, 1, 1,
-1.13942, -1.320378, -2.609611, 0, 0, 0, 1, 1,
-1.135709, -1.62744, -2.233678, 0, 0, 0, 1, 1,
-1.131977, 0.5717102, -1.76169, 0, 0, 0, 1, 1,
-1.118791, 1.661586, 0.681765, 0, 0, 0, 1, 1,
-1.117866, -0.8995126, -2.382509, 1, 1, 1, 1, 1,
-1.114386, 0.3347145, 0.1204466, 1, 1, 1, 1, 1,
-1.113705, 0.05458138, -0.565653, 1, 1, 1, 1, 1,
-1.105639, -0.7545235, -1.328197, 1, 1, 1, 1, 1,
-1.104285, 1.660872, 0.9875931, 1, 1, 1, 1, 1,
-1.103564, -1.018807, -2.960061, 1, 1, 1, 1, 1,
-1.100129, -1.054046, -2.280748, 1, 1, 1, 1, 1,
-1.098809, 0.1554368, -2.571093, 1, 1, 1, 1, 1,
-1.094317, -2.073815, -1.710142, 1, 1, 1, 1, 1,
-1.093426, 0.6660668, -0.4068321, 1, 1, 1, 1, 1,
-1.087617, -0.2652296, -2.466984, 1, 1, 1, 1, 1,
-1.080418, 0.3374406, 0.04129561, 1, 1, 1, 1, 1,
-1.077332, 0.1585663, -2.027719, 1, 1, 1, 1, 1,
-1.075282, -1.785196, -3.954651, 1, 1, 1, 1, 1,
-1.074119, -0.6316615, -2.926172, 1, 1, 1, 1, 1,
-1.07239, 0.7766907, -1.958623, 0, 0, 1, 1, 1,
-1.069248, 1.389434, 0.5871876, 1, 0, 0, 1, 1,
-1.068613, 0.4188345, 1.049813, 1, 0, 0, 1, 1,
-1.067019, -1.154677, -0.7142334, 1, 0, 0, 1, 1,
-1.056639, 0.4145454, -1.653345, 1, 0, 0, 1, 1,
-1.049798, 2.003056, -1.438599, 1, 0, 0, 1, 1,
-1.042572, -2.598714, -3.089024, 0, 0, 0, 1, 1,
-1.033303, -0.3412751, -1.989754, 0, 0, 0, 1, 1,
-1.028951, -0.6351794, -1.999831, 0, 0, 0, 1, 1,
-1.026537, 0.3286718, -0.7304136, 0, 0, 0, 1, 1,
-1.019573, -0.3612909, -2.33095, 0, 0, 0, 1, 1,
-1.019374, 1.000263, -1.462906, 0, 0, 0, 1, 1,
-1.008966, -0.6600825, -2.871788, 0, 0, 0, 1, 1,
-1.00333, -0.7053143, -2.598933, 1, 1, 1, 1, 1,
-1.001131, -0.6523241, -1.927669, 1, 1, 1, 1, 1,
-1.000084, -0.4554698, -0.615905, 1, 1, 1, 1, 1,
-0.9959189, -0.1529304, -2.825094, 1, 1, 1, 1, 1,
-0.9887848, -2.521589, -2.508506, 1, 1, 1, 1, 1,
-0.9757482, 0.6481324, -2.725961, 1, 1, 1, 1, 1,
-0.9751325, 1.262686, 0.1675278, 1, 1, 1, 1, 1,
-0.9712864, 1.337395, -0.9333624, 1, 1, 1, 1, 1,
-0.9712613, -0.2421811, -1.617841, 1, 1, 1, 1, 1,
-0.968553, -0.8702809, -2.997266, 1, 1, 1, 1, 1,
-0.9659564, 0.5248712, -1.830166, 1, 1, 1, 1, 1,
-0.9608732, -2.511056, -2.96152, 1, 1, 1, 1, 1,
-0.9586852, -0.0971365, -1.679898, 1, 1, 1, 1, 1,
-0.9510724, -0.1937276, -3.357666, 1, 1, 1, 1, 1,
-0.9484982, 1.301574, -1.352936, 1, 1, 1, 1, 1,
-0.9455088, 1.121504, -0.3527809, 0, 0, 1, 1, 1,
-0.9396824, 0.6947094, -1.212727, 1, 0, 0, 1, 1,
-0.9372367, -0.3191925, -0.9369634, 1, 0, 0, 1, 1,
-0.9334144, 1.777498, -0.9448773, 1, 0, 0, 1, 1,
-0.9321326, -1.270393, -2.999692, 1, 0, 0, 1, 1,
-0.9319708, -1.330417, -2.590223, 1, 0, 0, 1, 1,
-0.9273783, -1.793225, -2.504798, 0, 0, 0, 1, 1,
-0.9265924, 0.8127763, -0.5264764, 0, 0, 0, 1, 1,
-0.9048455, -1.488149, -1.183519, 0, 0, 0, 1, 1,
-0.901596, 1.037998, 1.066849, 0, 0, 0, 1, 1,
-0.8956925, -0.878307, -2.219197, 0, 0, 0, 1, 1,
-0.894203, -0.216212, -2.68711, 0, 0, 0, 1, 1,
-0.8911279, 0.369914, -1.163193, 0, 0, 0, 1, 1,
-0.8844689, -0.6878083, -1.814204, 1, 1, 1, 1, 1,
-0.884231, -0.177489, -0.9570916, 1, 1, 1, 1, 1,
-0.8841991, -0.6777177, -1.412734, 1, 1, 1, 1, 1,
-0.8835424, 0.9880506, 0.01742367, 1, 1, 1, 1, 1,
-0.8806257, 0.5127761, -0.4928899, 1, 1, 1, 1, 1,
-0.8766679, 0.3307423, -1.785276, 1, 1, 1, 1, 1,
-0.8748693, 0.4606298, -1.972335, 1, 1, 1, 1, 1,
-0.8691868, -1.350219, -3.451466, 1, 1, 1, 1, 1,
-0.861335, -0.4350482, -2.014021, 1, 1, 1, 1, 1,
-0.8560682, 0.9897757, -1.804955, 1, 1, 1, 1, 1,
-0.8551009, -0.3940749, -2.942524, 1, 1, 1, 1, 1,
-0.8450319, -0.246702, -3.73803, 1, 1, 1, 1, 1,
-0.8442627, -0.1269944, -2.781807, 1, 1, 1, 1, 1,
-0.8386419, -0.4787222, -2.33362, 1, 1, 1, 1, 1,
-0.8341267, 0.07263939, -1.679699, 1, 1, 1, 1, 1,
-0.8338497, -1.139692, -1.747535, 0, 0, 1, 1, 1,
-0.8314645, 0.6959516, -2.325146, 1, 0, 0, 1, 1,
-0.826502, -0.5473137, -2.670829, 1, 0, 0, 1, 1,
-0.8239401, -1.729361, -2.779886, 1, 0, 0, 1, 1,
-0.8231016, 0.9676715, 0.1075943, 1, 0, 0, 1, 1,
-0.8197793, 0.2132449, -1.10443, 1, 0, 0, 1, 1,
-0.8184282, 0.4057226, -0.7520958, 0, 0, 0, 1, 1,
-0.8171991, 0.01304749, -0.9247201, 0, 0, 0, 1, 1,
-0.8093993, -0.1544911, -2.768085, 0, 0, 0, 1, 1,
-0.8077172, 1.473053, -0.3229954, 0, 0, 0, 1, 1,
-0.8057303, 1.056982, -2.14611, 0, 0, 0, 1, 1,
-0.8041013, 0.7735342, 1.277909, 0, 0, 0, 1, 1,
-0.8020199, -1.081674, -2.186847, 0, 0, 0, 1, 1,
-0.7977329, 0.9148368, -0.5664368, 1, 1, 1, 1, 1,
-0.7915011, 1.199817, 0.08242284, 1, 1, 1, 1, 1,
-0.7821796, -1.061215, -3.207635, 1, 1, 1, 1, 1,
-0.7807512, 1.20956, 0.02430234, 1, 1, 1, 1, 1,
-0.7801906, -0.4436276, -3.907913, 1, 1, 1, 1, 1,
-0.7781334, -0.4264451, -2.760537, 1, 1, 1, 1, 1,
-0.7754993, 0.6740197, -0.4448901, 1, 1, 1, 1, 1,
-0.7720377, 0.3120852, -2.454364, 1, 1, 1, 1, 1,
-0.7707167, -0.5780868, -1.400979, 1, 1, 1, 1, 1,
-0.7701734, -0.3015815, -2.527233, 1, 1, 1, 1, 1,
-0.764248, 0.5404398, -0.3649344, 1, 1, 1, 1, 1,
-0.7614291, -0.5201263, -2.780162, 1, 1, 1, 1, 1,
-0.7600981, -0.1937855, -3.266834, 1, 1, 1, 1, 1,
-0.7553734, 1.249414, 0.8695447, 1, 1, 1, 1, 1,
-0.7547581, 0.4522657, -0.8808851, 1, 1, 1, 1, 1,
-0.7497149, -0.8559904, -1.253616, 0, 0, 1, 1, 1,
-0.7496376, 0.6868985, -1.287526, 1, 0, 0, 1, 1,
-0.7495539, 1.328268, -0.3222133, 1, 0, 0, 1, 1,
-0.7478071, 0.2250387, -1.449228, 1, 0, 0, 1, 1,
-0.7468883, 1.284343, -1.051799, 1, 0, 0, 1, 1,
-0.7450433, -1.691741, -2.555604, 1, 0, 0, 1, 1,
-0.7441648, 0.2833045, -2.383639, 0, 0, 0, 1, 1,
-0.7379042, 1.344099, -2.162796, 0, 0, 0, 1, 1,
-0.7357002, 0.5220534, -1.557682, 0, 0, 0, 1, 1,
-0.7352503, -0.3474884, -4.762761, 0, 0, 0, 1, 1,
-0.7339303, 0.4177649, -1.934848, 0, 0, 0, 1, 1,
-0.7308444, -0.448713, -2.089874, 0, 0, 0, 1, 1,
-0.719772, 0.3341267, -1.194923, 0, 0, 0, 1, 1,
-0.7119067, -1.453817, -2.148355, 1, 1, 1, 1, 1,
-0.7076517, -0.9602848, -2.351707, 1, 1, 1, 1, 1,
-0.7072669, 0.001871672, 0.05833746, 1, 1, 1, 1, 1,
-0.7051168, 0.1928524, -3.087144, 1, 1, 1, 1, 1,
-0.700265, -0.2293881, -2.688404, 1, 1, 1, 1, 1,
-0.6973537, 0.214334, -0.7628539, 1, 1, 1, 1, 1,
-0.6924525, -1.015594, -1.805071, 1, 1, 1, 1, 1,
-0.6924451, -0.8115299, -2.855095, 1, 1, 1, 1, 1,
-0.6920155, 0.1264709, -0.9754664, 1, 1, 1, 1, 1,
-0.6758295, -0.0630132, -1.808775, 1, 1, 1, 1, 1,
-0.6727846, 0.3508687, -1.098172, 1, 1, 1, 1, 1,
-0.6701522, -1.088552, -2.744514, 1, 1, 1, 1, 1,
-0.6687127, -0.6101359, -2.488672, 1, 1, 1, 1, 1,
-0.6661221, -0.02706075, -1.471141, 1, 1, 1, 1, 1,
-0.6522959, 1.28061, -1.824103, 1, 1, 1, 1, 1,
-0.6376309, 0.2643502, -0.7846611, 0, 0, 1, 1, 1,
-0.6369654, -0.07246686, -2.232507, 1, 0, 0, 1, 1,
-0.6349788, -0.7652546, -1.040573, 1, 0, 0, 1, 1,
-0.6322445, -0.3464571, -1.795584, 1, 0, 0, 1, 1,
-0.6290563, -0.6800647, -2.295208, 1, 0, 0, 1, 1,
-0.627381, -0.1839977, -2.971002, 1, 0, 0, 1, 1,
-0.6236448, 0.05566667, 0.6034665, 0, 0, 0, 1, 1,
-0.6196848, -0.2084737, -2.217582, 0, 0, 0, 1, 1,
-0.6187184, 0.01716303, -0.6731511, 0, 0, 0, 1, 1,
-0.6168393, -0.9984156, -5.251023, 0, 0, 0, 1, 1,
-0.6156743, -0.809869, -4.289063, 0, 0, 0, 1, 1,
-0.6027783, -0.5044075, -0.7301829, 0, 0, 0, 1, 1,
-0.6018111, -0.1044462, 0.1593186, 0, 0, 0, 1, 1,
-0.5961199, -0.06429576, -1.01984, 1, 1, 1, 1, 1,
-0.5952911, -1.169532, -3.111975, 1, 1, 1, 1, 1,
-0.5921459, -0.1267591, -2.642343, 1, 1, 1, 1, 1,
-0.5885557, 0.614759, 0.04310131, 1, 1, 1, 1, 1,
-0.5884798, 0.5485438, 0.2280653, 1, 1, 1, 1, 1,
-0.585777, 0.4688271, -2.462062, 1, 1, 1, 1, 1,
-0.5844175, 0.1563352, -1.508695, 1, 1, 1, 1, 1,
-0.5823999, 0.8562949, 0.354215, 1, 1, 1, 1, 1,
-0.5809196, -1.349242, -2.591049, 1, 1, 1, 1, 1,
-0.5785555, -2.141395, -1.801509, 1, 1, 1, 1, 1,
-0.5782536, 0.0690283, -1.826625, 1, 1, 1, 1, 1,
-0.576794, 0.5524213, -0.1124503, 1, 1, 1, 1, 1,
-0.5749174, -0.6864589, -0.8473694, 1, 1, 1, 1, 1,
-0.5730814, 1.791629, -0.1896484, 1, 1, 1, 1, 1,
-0.5714905, 1.168559, 0.5653784, 1, 1, 1, 1, 1,
-0.5704341, 0.3330974, -0.5164899, 0, 0, 1, 1, 1,
-0.5685238, -0.4378415, -3.827313, 1, 0, 0, 1, 1,
-0.568464, 2.02934, -1.119592, 1, 0, 0, 1, 1,
-0.5661795, -0.103889, -2.942987, 1, 0, 0, 1, 1,
-0.5597141, 0.8463585, -1.806906, 1, 0, 0, 1, 1,
-0.5562604, 1.143065, 0.2969283, 1, 0, 0, 1, 1,
-0.5523213, -0.5277491, -2.99744, 0, 0, 0, 1, 1,
-0.5496091, 0.03161527, -0.8010974, 0, 0, 0, 1, 1,
-0.5479328, -0.6026003, -1.777472, 0, 0, 0, 1, 1,
-0.5448584, 1.152512, 0.02883467, 0, 0, 0, 1, 1,
-0.5445966, -0.2028223, -3.545788, 0, 0, 0, 1, 1,
-0.5441833, 1.711284, 1.150003, 0, 0, 0, 1, 1,
-0.538218, 1.687606, -0.03468338, 0, 0, 0, 1, 1,
-0.5370787, -0.497159, -3.693009, 1, 1, 1, 1, 1,
-0.5299669, 1.934924, 0.5514328, 1, 1, 1, 1, 1,
-0.5292327, 0.6757174, -2.314045, 1, 1, 1, 1, 1,
-0.5259816, -0.2345411, -1.602573, 1, 1, 1, 1, 1,
-0.5255011, 0.7681304, -0.7624988, 1, 1, 1, 1, 1,
-0.5234508, -0.9628494, -2.301138, 1, 1, 1, 1, 1,
-0.5201008, -2.144578, -3.365841, 1, 1, 1, 1, 1,
-0.5148748, 1.246132, -0.4943908, 1, 1, 1, 1, 1,
-0.5121122, 1.249301, 0.5680236, 1, 1, 1, 1, 1,
-0.5087932, 0.7556046, -0.3716427, 1, 1, 1, 1, 1,
-0.503645, -0.1859571, -2.129726, 1, 1, 1, 1, 1,
-0.4976862, 0.9287304, 0.3078453, 1, 1, 1, 1, 1,
-0.4950214, 0.9254711, 0.9378176, 1, 1, 1, 1, 1,
-0.4938748, -0.6774926, -2.914992, 1, 1, 1, 1, 1,
-0.493239, -0.5763912, -1.839532, 1, 1, 1, 1, 1,
-0.4903198, -0.6386109, -2.529483, 0, 0, 1, 1, 1,
-0.4895839, 2.241655, 0.3813122, 1, 0, 0, 1, 1,
-0.4892308, -0.6577129, -1.681534, 1, 0, 0, 1, 1,
-0.4852732, 0.09492456, -3.264354, 1, 0, 0, 1, 1,
-0.4849245, -0.59754, -1.870689, 1, 0, 0, 1, 1,
-0.4789237, -0.8496252, -2.10211, 1, 0, 0, 1, 1,
-0.4738353, 0.7891535, -1.213236, 0, 0, 0, 1, 1,
-0.4715163, -0.1135895, -0.222095, 0, 0, 0, 1, 1,
-0.4670953, -0.2500984, -3.063893, 0, 0, 0, 1, 1,
-0.4670725, -1.950231, -2.758662, 0, 0, 0, 1, 1,
-0.4632511, -1.59646, -1.842524, 0, 0, 0, 1, 1,
-0.461141, -0.8271006, -2.979614, 0, 0, 0, 1, 1,
-0.459133, -0.544939, -2.766966, 0, 0, 0, 1, 1,
-0.4583901, -0.1573059, 1.050887, 1, 1, 1, 1, 1,
-0.4560042, 1.234652, 0.2061643, 1, 1, 1, 1, 1,
-0.4542941, -1.623203, -3.326678, 1, 1, 1, 1, 1,
-0.4443832, 0.7605596, -1.362112, 1, 1, 1, 1, 1,
-0.4387483, -1.147044, -0.1795497, 1, 1, 1, 1, 1,
-0.4382966, -0.7491583, -0.2921331, 1, 1, 1, 1, 1,
-0.43709, 1.470371, -0.7918162, 1, 1, 1, 1, 1,
-0.4324361, -0.02934806, -0.6482705, 1, 1, 1, 1, 1,
-0.4317325, -1.186955, -2.860331, 1, 1, 1, 1, 1,
-0.4297238, -0.4924047, -3.442139, 1, 1, 1, 1, 1,
-0.4243614, 0.3734102, -2.055229, 1, 1, 1, 1, 1,
-0.4202427, -0.3719279, -1.289374, 1, 1, 1, 1, 1,
-0.4199789, -0.5075352, -2.183902, 1, 1, 1, 1, 1,
-0.4177414, -0.5165901, -1.799525, 1, 1, 1, 1, 1,
-0.4176946, -1.312539, -3.060975, 1, 1, 1, 1, 1,
-0.4159646, 0.001470774, 0.6281719, 0, 0, 1, 1, 1,
-0.4136481, 0.3719997, -1.290715, 1, 0, 0, 1, 1,
-0.405823, -0.5556734, -3.139068, 1, 0, 0, 1, 1,
-0.4057638, 0.2530528, -1.356299, 1, 0, 0, 1, 1,
-0.4057565, 2.209809, -0.7832131, 1, 0, 0, 1, 1,
-0.4054363, 0.3292197, -1.256004, 1, 0, 0, 1, 1,
-0.4028388, -0.8616942, -1.761438, 0, 0, 0, 1, 1,
-0.3984679, -0.7953665, -2.251116, 0, 0, 0, 1, 1,
-0.3979031, -0.6149687, -3.262903, 0, 0, 0, 1, 1,
-0.3977397, -0.2473283, -2.717466, 0, 0, 0, 1, 1,
-0.3941995, 2.087198, 0.4477693, 0, 0, 0, 1, 1,
-0.3903123, 0.9748683, -0.8253861, 0, 0, 0, 1, 1,
-0.38814, -0.1927515, -2.037028, 0, 0, 0, 1, 1,
-0.3877376, -0.4959913, -2.900331, 1, 1, 1, 1, 1,
-0.3870732, 0.6160749, -0.4073572, 1, 1, 1, 1, 1,
-0.3864896, 0.06960766, -2.597209, 1, 1, 1, 1, 1,
-0.3825697, -0.1969907, -2.378633, 1, 1, 1, 1, 1,
-0.3820653, -1.85432, -2.451396, 1, 1, 1, 1, 1,
-0.3819028, 0.4665171, 0.2639238, 1, 1, 1, 1, 1,
-0.3740017, 0.3532163, 1.47505, 1, 1, 1, 1, 1,
-0.371029, -0.02920979, -1.920937, 1, 1, 1, 1, 1,
-0.3689444, 0.2144983, -0.9122854, 1, 1, 1, 1, 1,
-0.3679007, 1.419408, 0.3215946, 1, 1, 1, 1, 1,
-0.3622921, 0.9290477, -0.6660124, 1, 1, 1, 1, 1,
-0.3597518, 0.2706098, -0.4137481, 1, 1, 1, 1, 1,
-0.3559108, -0.06039256, -2.49759, 1, 1, 1, 1, 1,
-0.3520441, -1.26127, -3.637001, 1, 1, 1, 1, 1,
-0.3425852, -0.227068, -1.835659, 1, 1, 1, 1, 1,
-0.3398671, -1.196297, -3.370814, 0, 0, 1, 1, 1,
-0.3396684, 0.06856872, -0.8648593, 1, 0, 0, 1, 1,
-0.3363033, 0.5967394, 0.7797211, 1, 0, 0, 1, 1,
-0.3340814, -0.6791887, -2.780073, 1, 0, 0, 1, 1,
-0.3340282, 0.8845814, -0.05746746, 1, 0, 0, 1, 1,
-0.3293418, 0.6720778, -1.390425, 1, 0, 0, 1, 1,
-0.3277921, 0.5537496, 0.451241, 0, 0, 0, 1, 1,
-0.3256507, 1.094559, -1.190294, 0, 0, 0, 1, 1,
-0.3253362, -1.017703, -1.847633, 0, 0, 0, 1, 1,
-0.3244819, -0.1807067, 0.4097739, 0, 0, 0, 1, 1,
-0.3224488, 0.8786235, 0.6435644, 0, 0, 0, 1, 1,
-0.3176991, -0.6400907, -4.458589, 0, 0, 0, 1, 1,
-0.3149222, 0.4649206, -1.351846, 0, 0, 0, 1, 1,
-0.313179, 1.381001, 0.5945811, 1, 1, 1, 1, 1,
-0.3116115, -0.8855337, -5.369976, 1, 1, 1, 1, 1,
-0.3070643, -0.8268819, -2.323855, 1, 1, 1, 1, 1,
-0.3055344, -0.7072406, -2.525256, 1, 1, 1, 1, 1,
-0.3047535, 0.2563401, 0.8549792, 1, 1, 1, 1, 1,
-0.3024134, -0.8315177, -4.11735, 1, 1, 1, 1, 1,
-0.29959, 0.5681747, -0.03966493, 1, 1, 1, 1, 1,
-0.2974525, 2.276651, -0.6148557, 1, 1, 1, 1, 1,
-0.290992, -0.515622, -2.819136, 1, 1, 1, 1, 1,
-0.2877168, 1.033885, 1.007643, 1, 1, 1, 1, 1,
-0.2821817, 0.8246876, -0.1294138, 1, 1, 1, 1, 1,
-0.2810783, 0.9933521, -1.131052, 1, 1, 1, 1, 1,
-0.279676, 0.6701459, -0.805346, 1, 1, 1, 1, 1,
-0.2785433, -0.08722796, -1.723653, 1, 1, 1, 1, 1,
-0.2761167, 1.360584, -1.435871, 1, 1, 1, 1, 1,
-0.2746554, 0.2572132, -1.544414, 0, 0, 1, 1, 1,
-0.2736566, 0.4467701, -1.674289, 1, 0, 0, 1, 1,
-0.2731008, 1.528019, -1.526975, 1, 0, 0, 1, 1,
-0.2720107, -0.6825829, -3.274967, 1, 0, 0, 1, 1,
-0.2662629, -0.6273646, -2.265124, 1, 0, 0, 1, 1,
-0.2655001, -0.3240342, -2.967203, 1, 0, 0, 1, 1,
-0.2653719, 1.067105, -0.2163315, 0, 0, 0, 1, 1,
-0.262972, -0.372714, -2.128198, 0, 0, 0, 1, 1,
-0.2529326, 0.1814556, -1.144623, 0, 0, 0, 1, 1,
-0.2493862, 0.4422184, 0.03825182, 0, 0, 0, 1, 1,
-0.240119, 0.115557, -1.500135, 0, 0, 0, 1, 1,
-0.2348933, -0.6510537, -1.812196, 0, 0, 0, 1, 1,
-0.2342824, 0.5134299, -0.8637055, 0, 0, 0, 1, 1,
-0.2336352, 0.3136017, -0.7168151, 1, 1, 1, 1, 1,
-0.2334549, -1.865964, -2.869238, 1, 1, 1, 1, 1,
-0.2334246, -1.195689, -1.880465, 1, 1, 1, 1, 1,
-0.2252807, -0.4035134, -2.445635, 1, 1, 1, 1, 1,
-0.21976, -0.4795274, -3.68222, 1, 1, 1, 1, 1,
-0.2128614, -1.22544, -1.454139, 1, 1, 1, 1, 1,
-0.2075097, 1.096208, 0.4218773, 1, 1, 1, 1, 1,
-0.1982677, 0.2949356, -0.5762325, 1, 1, 1, 1, 1,
-0.1966665, 0.0848007, -0.2204233, 1, 1, 1, 1, 1,
-0.1965197, 0.03976969, -1.392542, 1, 1, 1, 1, 1,
-0.1963001, -0.944275, -2.938487, 1, 1, 1, 1, 1,
-0.1946291, 1.254404, -0.05680526, 1, 1, 1, 1, 1,
-0.1908603, 0.4785476, 1.234374, 1, 1, 1, 1, 1,
-0.1880993, 1.359404, -0.5398591, 1, 1, 1, 1, 1,
-0.1866569, 0.7505351, -1.251892, 1, 1, 1, 1, 1,
-0.1823543, -0.9236083, -4.790732, 0, 0, 1, 1, 1,
-0.182054, 0.4863561, -0.8779468, 1, 0, 0, 1, 1,
-0.181097, -0.4029802, -4.366766, 1, 0, 0, 1, 1,
-0.1791542, 0.6465198, -0.7256486, 1, 0, 0, 1, 1,
-0.1724392, -2.227703, -1.580983, 1, 0, 0, 1, 1,
-0.1719588, 1.909581, 1.454316, 1, 0, 0, 1, 1,
-0.1712305, -1.133252, -3.804165, 0, 0, 0, 1, 1,
-0.170416, -0.0687481, -3.308496, 0, 0, 0, 1, 1,
-0.1698746, -0.9339738, -0.6054906, 0, 0, 0, 1, 1,
-0.1685994, 0.2882246, -0.5825472, 0, 0, 0, 1, 1,
-0.1674959, -0.1624737, -1.793269, 0, 0, 0, 1, 1,
-0.1672262, 0.1337323, -0.3940227, 0, 0, 0, 1, 1,
-0.1661901, 0.09274299, 0.8134944, 0, 0, 0, 1, 1,
-0.1638065, 0.5973342, -0.4307427, 1, 1, 1, 1, 1,
-0.1596781, 0.5770633, -1.807477, 1, 1, 1, 1, 1,
-0.1587892, 1.533476, 0.9123778, 1, 1, 1, 1, 1,
-0.1480399, -0.2903867, -2.896052, 1, 1, 1, 1, 1,
-0.1425912, -0.5580257, -3.460896, 1, 1, 1, 1, 1,
-0.1384999, 0.3488264, 0.8881423, 1, 1, 1, 1, 1,
-0.1381161, -2.144198, -2.77655, 1, 1, 1, 1, 1,
-0.1374106, -0.9785302, -2.661822, 1, 1, 1, 1, 1,
-0.1372362, 0.2535375, 0.3023193, 1, 1, 1, 1, 1,
-0.1354265, 0.5726188, -0.9140132, 1, 1, 1, 1, 1,
-0.1331576, -0.4175875, -2.294541, 1, 1, 1, 1, 1,
-0.1293739, -1.769612, -2.673452, 1, 1, 1, 1, 1,
-0.1167103, 0.2120848, 0.151268, 1, 1, 1, 1, 1,
-0.1155371, 0.1031703, -1.600235, 1, 1, 1, 1, 1,
-0.1106861, 1.559947, -1.611039, 1, 1, 1, 1, 1,
-0.1054176, 1.004836, 0.249765, 0, 0, 1, 1, 1,
-0.1052215, 0.3877151, -1.377477, 1, 0, 0, 1, 1,
-0.1050105, -0.4493294, -3.241045, 1, 0, 0, 1, 1,
-0.1043933, 0.1795966, 1.56085, 1, 0, 0, 1, 1,
-0.1010933, -0.3082523, -1.815497, 1, 0, 0, 1, 1,
-0.09996643, -0.1182775, -2.633875, 1, 0, 0, 1, 1,
-0.09875666, 0.9136814, -0.07492304, 0, 0, 0, 1, 1,
-0.09595133, -0.1014882, -2.696218, 0, 0, 0, 1, 1,
-0.0943759, 0.6204638, -0.2217942, 0, 0, 0, 1, 1,
-0.09372161, 0.4698799, -1.911764, 0, 0, 0, 1, 1,
-0.08822279, -1.724215, -1.91379, 0, 0, 0, 1, 1,
-0.07879665, 0.4148186, -1.88924, 0, 0, 0, 1, 1,
-0.07755967, -0.5097229, -3.970566, 0, 0, 0, 1, 1,
-0.07201462, -0.1699017, -1.959931, 1, 1, 1, 1, 1,
-0.06863401, -0.2103614, -4.122424, 1, 1, 1, 1, 1,
-0.06004148, 1.636154, -0.7240957, 1, 1, 1, 1, 1,
-0.05895061, 1.170833, -0.5848075, 1, 1, 1, 1, 1,
-0.05750359, 0.03704149, -0.9970966, 1, 1, 1, 1, 1,
-0.05172513, -0.1623467, -1.6931, 1, 1, 1, 1, 1,
-0.05087742, -0.2049454, -2.449636, 1, 1, 1, 1, 1,
-0.04984769, -0.7049664, -2.554821, 1, 1, 1, 1, 1,
-0.04747449, -0.5961092, -2.141424, 1, 1, 1, 1, 1,
-0.04687802, -0.03809674, -3.807539, 1, 1, 1, 1, 1,
-0.04501142, 0.6193802, -0.8969061, 1, 1, 1, 1, 1,
-0.04417254, -0.906173, -3.424062, 1, 1, 1, 1, 1,
-0.0423155, -0.3569989, -2.881507, 1, 1, 1, 1, 1,
-0.04203121, -1.912957, -1.906936, 1, 1, 1, 1, 1,
-0.03509793, 0.1952916, -1.43769, 1, 1, 1, 1, 1,
-0.03378507, -2.592272, -3.003221, 0, 0, 1, 1, 1,
-0.0306006, 1.770425, 0.4280499, 1, 0, 0, 1, 1,
-0.03016417, 0.548883, -1.232634, 1, 0, 0, 1, 1,
-0.02961107, -0.1429355, -2.605296, 1, 0, 0, 1, 1,
-0.02526672, 0.3657446, -0.6725856, 1, 0, 0, 1, 1,
-0.01621101, -0.8964477, -1.787496, 1, 0, 0, 1, 1,
-0.01274541, 0.5824327, 0.1458892, 0, 0, 0, 1, 1,
-0.01173718, 0.01920491, -2.229372, 0, 0, 0, 1, 1,
-0.01133245, -0.5234438, -3.020153, 0, 0, 0, 1, 1,
-0.007230891, 0.2916283, -0.7158716, 0, 0, 0, 1, 1,
-0.006192513, 0.09898974, 0.5415909, 0, 0, 0, 1, 1,
-0.005768042, -0.2645423, -1.94625, 0, 0, 0, 1, 1,
-0.0001659932, 0.07146921, -0.2210741, 0, 0, 0, 1, 1,
0.002755842, -1.068075, 3.200572, 1, 1, 1, 1, 1,
0.004674085, -2.783892, 2.21698, 1, 1, 1, 1, 1,
0.007958429, 0.02385322, -3.039056, 1, 1, 1, 1, 1,
0.00867968, -0.3845213, 2.80963, 1, 1, 1, 1, 1,
0.00962964, 0.5440229, -0.144503, 1, 1, 1, 1, 1,
0.01009309, 1.244526, 0.238238, 1, 1, 1, 1, 1,
0.01428782, -0.07057917, 2.932745, 1, 1, 1, 1, 1,
0.01443876, -0.5786543, 2.293067, 1, 1, 1, 1, 1,
0.0153078, -1.606228, 4.769772, 1, 1, 1, 1, 1,
0.01647519, -0.1953695, 3.704623, 1, 1, 1, 1, 1,
0.01822453, 1.836026, -1.445066, 1, 1, 1, 1, 1,
0.02123497, -1.898076, 4.153062, 1, 1, 1, 1, 1,
0.02874562, -1.653035, 2.400872, 1, 1, 1, 1, 1,
0.02886428, -1.346338, 4.334373, 1, 1, 1, 1, 1,
0.03372097, 1.666778, -0.9101884, 1, 1, 1, 1, 1,
0.04036225, -1.524832, 4.135592, 0, 0, 1, 1, 1,
0.04038816, 0.5885175, -0.5123036, 1, 0, 0, 1, 1,
0.04196022, -0.2328479, 2.20621, 1, 0, 0, 1, 1,
0.04198314, 0.2023316, -1.308099, 1, 0, 0, 1, 1,
0.04378545, -0.3976663, 3.418484, 1, 0, 0, 1, 1,
0.04503514, 1.073391, -0.07432649, 1, 0, 0, 1, 1,
0.0486572, 0.339257, 0.7724751, 0, 0, 0, 1, 1,
0.05636718, 0.6372315, 0.3992471, 0, 0, 0, 1, 1,
0.05636735, 1.401169, 0.097759, 0, 0, 0, 1, 1,
0.05876545, -0.845038, 3.944127, 0, 0, 0, 1, 1,
0.06080389, 1.835612, -1.490882, 0, 0, 0, 1, 1,
0.06522178, 1.474827, 0.5081393, 0, 0, 0, 1, 1,
0.06858054, -0.01718035, 1.703429, 0, 0, 0, 1, 1,
0.07035803, 1.637956, 0.2583374, 1, 1, 1, 1, 1,
0.07068985, -0.08906236, 2.136188, 1, 1, 1, 1, 1,
0.0744536, 0.5328859, -1.391353, 1, 1, 1, 1, 1,
0.07652518, -1.520652, 5.227757, 1, 1, 1, 1, 1,
0.08526742, 0.5143965, -0.09753838, 1, 1, 1, 1, 1,
0.08553063, -0.5539879, 3.815455, 1, 1, 1, 1, 1,
0.0884326, -1.203412, 3.852861, 1, 1, 1, 1, 1,
0.09486903, 1.343113, -0.9967331, 1, 1, 1, 1, 1,
0.09541932, 2.382522, 0.00898848, 1, 1, 1, 1, 1,
0.09665751, 0.03675359, 1.091883, 1, 1, 1, 1, 1,
0.1071625, -0.4754807, 2.280619, 1, 1, 1, 1, 1,
0.1104599, 0.2708814, 0.3210586, 1, 1, 1, 1, 1,
0.1209427, 0.3438314, 2.258741, 1, 1, 1, 1, 1,
0.1233456, -0.1746754, 2.86014, 1, 1, 1, 1, 1,
0.128423, 1.543025, 1.724835, 1, 1, 1, 1, 1,
0.1295842, -0.1980082, 2.310889, 0, 0, 1, 1, 1,
0.1325377, 0.247412, 0.6361336, 1, 0, 0, 1, 1,
0.1330413, -1.259692, 3.842684, 1, 0, 0, 1, 1,
0.1354553, -0.1318753, 2.502439, 1, 0, 0, 1, 1,
0.1436966, 1.890651, 1.081912, 1, 0, 0, 1, 1,
0.1441019, -0.9921595, 1.612568, 1, 0, 0, 1, 1,
0.1447459, 1.145993, -0.3398876, 0, 0, 0, 1, 1,
0.1456422, 0.06853447, 1.835387, 0, 0, 0, 1, 1,
0.1462728, 1.578213, 0.1701892, 0, 0, 0, 1, 1,
0.146982, 0.6964287, -0.2571309, 0, 0, 0, 1, 1,
0.1476522, -1.655497, 2.909764, 0, 0, 0, 1, 1,
0.1487033, 0.1769424, 0.8423417, 0, 0, 0, 1, 1,
0.1617424, -0.2169235, 1.928093, 0, 0, 0, 1, 1,
0.1622539, 1.66975, 0.1478364, 1, 1, 1, 1, 1,
0.1640059, -0.8098855, 4.31339, 1, 1, 1, 1, 1,
0.1656892, -0.1327447, 2.937559, 1, 1, 1, 1, 1,
0.167294, 2.190669, -0.4657623, 1, 1, 1, 1, 1,
0.1676549, -1.448285, 4.279364, 1, 1, 1, 1, 1,
0.1690444, 0.6225665, -0.6607279, 1, 1, 1, 1, 1,
0.1703023, -0.3359312, 4.134141, 1, 1, 1, 1, 1,
0.1716944, 0.06048696, 1.060988, 1, 1, 1, 1, 1,
0.1772013, 0.2915208, 0.6896256, 1, 1, 1, 1, 1,
0.1791232, 0.03001103, 3.495159, 1, 1, 1, 1, 1,
0.1811809, -0.4448109, 2.020458, 1, 1, 1, 1, 1,
0.1829715, 0.1803256, 1.43929, 1, 1, 1, 1, 1,
0.1846488, 1.769766, -1.565932, 1, 1, 1, 1, 1,
0.1881967, 0.2983964, -0.1603862, 1, 1, 1, 1, 1,
0.1886828, 0.3022981, 1.90616, 1, 1, 1, 1, 1,
0.1910017, 1.356784, -0.5146818, 0, 0, 1, 1, 1,
0.192019, -0.2606745, 2.738052, 1, 0, 0, 1, 1,
0.1928235, 0.2749201, 0.7988223, 1, 0, 0, 1, 1,
0.1947132, 0.4881833, 0.1154241, 1, 0, 0, 1, 1,
0.1974796, 0.1142827, 0.754041, 1, 0, 0, 1, 1,
0.2003929, -1.192968, 3.014072, 1, 0, 0, 1, 1,
0.2008002, -0.9163471, 2.392317, 0, 0, 0, 1, 1,
0.2041118, 1.12113, -1.736149, 0, 0, 0, 1, 1,
0.2069769, 0.7799314, -0.2964698, 0, 0, 0, 1, 1,
0.2093963, -1.024575, 4.106255, 0, 0, 0, 1, 1,
0.2118261, 0.3639357, -0.4922667, 0, 0, 0, 1, 1,
0.2129904, 1.20065, -0.6146755, 0, 0, 0, 1, 1,
0.2181486, -1.273721, 1.901997, 0, 0, 0, 1, 1,
0.2218352, -0.6315893, 1.269818, 1, 1, 1, 1, 1,
0.2231287, 0.6275488, -0.7091452, 1, 1, 1, 1, 1,
0.225477, 0.1275786, 0.9719733, 1, 1, 1, 1, 1,
0.2290902, -1.45047, 2.579215, 1, 1, 1, 1, 1,
0.2298847, 0.007575093, 3.243947, 1, 1, 1, 1, 1,
0.2299245, -1.72442, 3.031508, 1, 1, 1, 1, 1,
0.2347709, -0.2180859, 3.043085, 1, 1, 1, 1, 1,
0.2420501, -0.4554453, 2.581046, 1, 1, 1, 1, 1,
0.2450047, 0.266601, 1.479491, 1, 1, 1, 1, 1,
0.2491619, -0.04693228, 0.7334257, 1, 1, 1, 1, 1,
0.2501384, -0.204499, 3.09531, 1, 1, 1, 1, 1,
0.253167, -0.8923013, 3.328959, 1, 1, 1, 1, 1,
0.255641, 1.235796, -1.565561, 1, 1, 1, 1, 1,
0.2569041, 0.1283868, 2.687462, 1, 1, 1, 1, 1,
0.2649883, -1.069861, 2.826648, 1, 1, 1, 1, 1,
0.2740877, -1.137536, 3.771245, 0, 0, 1, 1, 1,
0.2743675, -0.7026228, 3.329903, 1, 0, 0, 1, 1,
0.2768801, -1.342114, 1.835991, 1, 0, 0, 1, 1,
0.2784384, 2.238229, -1.16776, 1, 0, 0, 1, 1,
0.2788552, 0.3200409, 0.6541412, 1, 0, 0, 1, 1,
0.2824176, 1.018291, 0.8079939, 1, 0, 0, 1, 1,
0.2838823, -1.229978, 3.443146, 0, 0, 0, 1, 1,
0.2889204, 0.5802977, 0.8046516, 0, 0, 0, 1, 1,
0.2896507, -1.115425, 2.150312, 0, 0, 0, 1, 1,
0.290808, -0.2257593, 2.607363, 0, 0, 0, 1, 1,
0.2927634, -0.7279101, 2.938297, 0, 0, 0, 1, 1,
0.2941649, 0.9302095, -0.2703438, 0, 0, 0, 1, 1,
0.295716, -0.8146845, 0.8036704, 0, 0, 0, 1, 1,
0.2962093, -0.6617694, 2.558148, 1, 1, 1, 1, 1,
0.3037159, -0.8860533, 3.60146, 1, 1, 1, 1, 1,
0.3077751, -0.4719203, 1.248575, 1, 1, 1, 1, 1,
0.3113471, 1.021962, 0.0429898, 1, 1, 1, 1, 1,
0.3115861, 0.6985473, 0.7173771, 1, 1, 1, 1, 1,
0.3148889, 0.3774559, 0.5845562, 1, 1, 1, 1, 1,
0.3152241, -1.054265, 4.407864, 1, 1, 1, 1, 1,
0.3185463, -0.7380233, 1.977091, 1, 1, 1, 1, 1,
0.3319445, -0.5309896, 3.428543, 1, 1, 1, 1, 1,
0.3378641, -0.4116491, 2.074122, 1, 1, 1, 1, 1,
0.3410029, 1.657751, -0.50971, 1, 1, 1, 1, 1,
0.344698, -0.8417045, 2.805299, 1, 1, 1, 1, 1,
0.3458983, 0.8314104, -3.218868, 1, 1, 1, 1, 1,
0.3478067, 0.08648755, 0.5779768, 1, 1, 1, 1, 1,
0.3496773, -0.9030291, 3.040139, 1, 1, 1, 1, 1,
0.3529153, 0.2639771, 1.200315, 0, 0, 1, 1, 1,
0.353686, 0.08142362, 2.79641, 1, 0, 0, 1, 1,
0.3538457, 0.4141669, -1.154381, 1, 0, 0, 1, 1,
0.3539639, -0.2355379, 1.145478, 1, 0, 0, 1, 1,
0.3579522, 0.06580338, 3.461382, 1, 0, 0, 1, 1,
0.3588825, 1.679585, 0.8632216, 1, 0, 0, 1, 1,
0.3637698, 0.4085715, 0.9067715, 0, 0, 0, 1, 1,
0.3650075, -1.832087, 3.340719, 0, 0, 0, 1, 1,
0.371333, -0.5041156, 3.487678, 0, 0, 0, 1, 1,
0.3747337, 0.8198869, 0.9774026, 0, 0, 0, 1, 1,
0.375789, 0.2094992, -0.07275722, 0, 0, 0, 1, 1,
0.3772272, 0.1434272, 3.146053, 0, 0, 0, 1, 1,
0.3787878, 0.1073904, 1.453335, 0, 0, 0, 1, 1,
0.3790242, 1.150738, -0.07145941, 1, 1, 1, 1, 1,
0.3855028, 0.6012321, 1.51368, 1, 1, 1, 1, 1,
0.391554, -1.406868, 2.205577, 1, 1, 1, 1, 1,
0.3956188, -1.92142, 4.029702, 1, 1, 1, 1, 1,
0.3992897, 1.458987, 1.100699, 1, 1, 1, 1, 1,
0.4005516, 0.5496584, 1.215557, 1, 1, 1, 1, 1,
0.4036434, 0.8828736, 1.087433, 1, 1, 1, 1, 1,
0.4085014, 1.052457, 1.093565, 1, 1, 1, 1, 1,
0.4090867, -0.9390469, 3.225695, 1, 1, 1, 1, 1,
0.4108086, -0.08463388, 1.388271, 1, 1, 1, 1, 1,
0.4110376, -0.5635658, 2.443702, 1, 1, 1, 1, 1,
0.418975, 0.1439659, -0.430023, 1, 1, 1, 1, 1,
0.4208003, -1.099384, 4.26923, 1, 1, 1, 1, 1,
0.4267768, -0.1436786, 1.771121, 1, 1, 1, 1, 1,
0.4269731, -0.3949514, 1.937683, 1, 1, 1, 1, 1,
0.4275417, 1.0329, 0.1452933, 0, 0, 1, 1, 1,
0.4355162, -0.7829989, 1.542535, 1, 0, 0, 1, 1,
0.4372748, -1.122518, 2.605518, 1, 0, 0, 1, 1,
0.4375605, 0.4859091, 0.5956274, 1, 0, 0, 1, 1,
0.4399968, 0.4795159, -0.1048006, 1, 0, 0, 1, 1,
0.4425739, -0.03731391, 1.620027, 1, 0, 0, 1, 1,
0.4438418, 1.155728, 0.5755203, 0, 0, 0, 1, 1,
0.4439731, -1.294838, 1.999957, 0, 0, 0, 1, 1,
0.4448015, 0.5420996, 1.559487, 0, 0, 0, 1, 1,
0.4461374, -1.261685, 3.177634, 0, 0, 0, 1, 1,
0.4491738, 0.5396591, 1.955582, 0, 0, 0, 1, 1,
0.451866, -2.501331, 2.639234, 0, 0, 0, 1, 1,
0.4527514, -1.1465, 4.110861, 0, 0, 0, 1, 1,
0.4538211, 1.044572, 0.4976373, 1, 1, 1, 1, 1,
0.4540941, 0.2834283, 1.424979, 1, 1, 1, 1, 1,
0.4550147, -0.4080404, 3.569328, 1, 1, 1, 1, 1,
0.4599664, -0.864715, 3.76378, 1, 1, 1, 1, 1,
0.4679077, -0.8688865, 2.441824, 1, 1, 1, 1, 1,
0.4688655, 2.052146, -0.3804302, 1, 1, 1, 1, 1,
0.470203, -0.291164, -0.09520258, 1, 1, 1, 1, 1,
0.4713236, -0.6952361, 2.810829, 1, 1, 1, 1, 1,
0.4738268, -1.185369, 1.531503, 1, 1, 1, 1, 1,
0.474492, 1.273836, 1.049401, 1, 1, 1, 1, 1,
0.4759734, -1.18127, 2.619115, 1, 1, 1, 1, 1,
0.4790867, -0.1420411, 1.816449, 1, 1, 1, 1, 1,
0.4799178, -0.1688641, 2.599167, 1, 1, 1, 1, 1,
0.4802846, 1.915658, -0.2982183, 1, 1, 1, 1, 1,
0.4843733, 1.659143, 0.2958915, 1, 1, 1, 1, 1,
0.4909139, 0.3010724, -0.2191759, 0, 0, 1, 1, 1,
0.4918771, 1.238175, -0.2323835, 1, 0, 0, 1, 1,
0.4960959, -1.327845, 4.733028, 1, 0, 0, 1, 1,
0.4968991, -1.402148, 1.341166, 1, 0, 0, 1, 1,
0.4995414, -0.5327467, 5.064058, 1, 0, 0, 1, 1,
0.5011276, 0.7506974, -0.502884, 1, 0, 0, 1, 1,
0.5049054, -0.3949849, 2.797952, 0, 0, 0, 1, 1,
0.5058894, -3.456789, 0.5585868, 0, 0, 0, 1, 1,
0.5070977, -0.9462948, 0.9528427, 0, 0, 0, 1, 1,
0.5141648, -1.891868, 3.598232, 0, 0, 0, 1, 1,
0.5151696, 0.3233065, 2.331944, 0, 0, 0, 1, 1,
0.5154163, 1.718815, -0.7022347, 0, 0, 0, 1, 1,
0.5171311, -0.9185907, 0.6227589, 0, 0, 0, 1, 1,
0.5184583, 0.8960938, 1.460335, 1, 1, 1, 1, 1,
0.5216259, -1.311489, 2.953128, 1, 1, 1, 1, 1,
0.5234643, -0.002561196, 1.878104, 1, 1, 1, 1, 1,
0.52452, 0.08823762, 0.3567685, 1, 1, 1, 1, 1,
0.5246251, 1.375537, -0.08971626, 1, 1, 1, 1, 1,
0.5253944, -2.077642, 3.857397, 1, 1, 1, 1, 1,
0.5268075, 0.3392688, 0.08616894, 1, 1, 1, 1, 1,
0.527456, -1.049559, 3.433481, 1, 1, 1, 1, 1,
0.5291978, 0.170523, 2.069391, 1, 1, 1, 1, 1,
0.5334813, -0.8137556, 1.978219, 1, 1, 1, 1, 1,
0.5348841, 0.2217642, 0.5596012, 1, 1, 1, 1, 1,
0.5351256, 0.2861112, 1.857525, 1, 1, 1, 1, 1,
0.5359767, 1.046147, 0.7784074, 1, 1, 1, 1, 1,
0.5420674, 2.354776, 1.128683, 1, 1, 1, 1, 1,
0.5433304, -0.4907154, 1.096462, 1, 1, 1, 1, 1,
0.5440173, 0.427544, 0.6067711, 0, 0, 1, 1, 1,
0.5497577, -0.05803257, 0.8463846, 1, 0, 0, 1, 1,
0.5590693, 1.228387, -1.273623, 1, 0, 0, 1, 1,
0.5640404, 0.5777985, -0.2535951, 1, 0, 0, 1, 1,
0.5645103, -0.2208059, 1.749941, 1, 0, 0, 1, 1,
0.5678874, -0.4329581, 1.676725, 1, 0, 0, 1, 1,
0.575816, -1.299874, 1.498312, 0, 0, 0, 1, 1,
0.5788087, 1.108085, 0.8264462, 0, 0, 0, 1, 1,
0.5791013, -0.1452754, 1.086689, 0, 0, 0, 1, 1,
0.5844402, 0.3984974, 1.898407, 0, 0, 0, 1, 1,
0.60245, 0.8606573, 0.4062919, 0, 0, 0, 1, 1,
0.6077299, -1.430643, 4.450643, 0, 0, 0, 1, 1,
0.6117679, -2.21789, 3.536879, 0, 0, 0, 1, 1,
0.6170276, -0.09607905, 1.923725, 1, 1, 1, 1, 1,
0.6185479, 1.66504, -1.19108, 1, 1, 1, 1, 1,
0.6222717, 0.9611199, 1.049976, 1, 1, 1, 1, 1,
0.6261439, 1.387998, -1.56266, 1, 1, 1, 1, 1,
0.6264593, 0.8040347, 2.249032, 1, 1, 1, 1, 1,
0.628906, -0.1422145, 3.039205, 1, 1, 1, 1, 1,
0.631703, -1.174588, 1.794483, 1, 1, 1, 1, 1,
0.6433295, 1.294026, 1.028976, 1, 1, 1, 1, 1,
0.6444545, 0.4211926, 2.262166, 1, 1, 1, 1, 1,
0.6459749, 0.7606942, 2.156168, 1, 1, 1, 1, 1,
0.6460536, 1.250582, 0.05480487, 1, 1, 1, 1, 1,
0.6476513, 1.221885, 0.8523606, 1, 1, 1, 1, 1,
0.6496187, -1.898597, 2.771182, 1, 1, 1, 1, 1,
0.6531838, 0.07368065, 2.417418, 1, 1, 1, 1, 1,
0.6537684, 1.434621, 0.3663289, 1, 1, 1, 1, 1,
0.6540966, 2.287564, 0.1728169, 0, 0, 1, 1, 1,
0.6549031, -1.763045, 4.173309, 1, 0, 0, 1, 1,
0.657376, -0.07464788, 0.3807005, 1, 0, 0, 1, 1,
0.662304, -1.355995, 0.5640571, 1, 0, 0, 1, 1,
0.6624562, 0.9427088, -0.775462, 1, 0, 0, 1, 1,
0.665081, 0.2496422, 0.1734424, 1, 0, 0, 1, 1,
0.6658228, -0.7850506, 2.737213, 0, 0, 0, 1, 1,
0.669513, 0.936588, 0.6510924, 0, 0, 0, 1, 1,
0.6736366, 0.1584847, 1.387749, 0, 0, 0, 1, 1,
0.6838124, 0.1516329, 0.6837195, 0, 0, 0, 1, 1,
0.6850131, -0.6096728, 2.032962, 0, 0, 0, 1, 1,
0.6877836, -0.85458, 1.481768, 0, 0, 0, 1, 1,
0.6890677, -0.5680477, 1.930067, 0, 0, 0, 1, 1,
0.6910474, -0.1675773, 3.369994, 1, 1, 1, 1, 1,
0.6910488, 0.8464128, 1.919789, 1, 1, 1, 1, 1,
0.6937577, 0.4282608, 2.031678, 1, 1, 1, 1, 1,
0.6976171, 1.072581, -0.9456075, 1, 1, 1, 1, 1,
0.7000005, -0.3026036, 1.040869, 1, 1, 1, 1, 1,
0.7001632, -0.7913414, 1.334981, 1, 1, 1, 1, 1,
0.7058586, -0.01445395, -0.1977224, 1, 1, 1, 1, 1,
0.708537, 0.1317034, 1.78587, 1, 1, 1, 1, 1,
0.7085632, -0.7120163, 4.181243, 1, 1, 1, 1, 1,
0.7096503, -2.1951, 3.22374, 1, 1, 1, 1, 1,
0.7098454, 1.233111, 1.840874, 1, 1, 1, 1, 1,
0.7187883, 0.1422004, 3.998178, 1, 1, 1, 1, 1,
0.7249081, -1.289379, 2.588247, 1, 1, 1, 1, 1,
0.7280576, 1.110542, 0.7037128, 1, 1, 1, 1, 1,
0.7281889, 1.661234, -1.378762, 1, 1, 1, 1, 1,
0.7391654, -2.351756, 2.635713, 0, 0, 1, 1, 1,
0.7404057, 0.1838183, 0.6487959, 1, 0, 0, 1, 1,
0.7416888, -0.5132583, 1.580953, 1, 0, 0, 1, 1,
0.7434729, -0.510134, 2.221727, 1, 0, 0, 1, 1,
0.744552, 1.1182, 0.6854998, 1, 0, 0, 1, 1,
0.7491029, -0.9378952, 2.271401, 1, 0, 0, 1, 1,
0.7506955, 0.1969576, 2.689005, 0, 0, 0, 1, 1,
0.7538154, -0.6636884, 1.473994, 0, 0, 0, 1, 1,
0.7626404, -0.7712516, 1.881229, 0, 0, 0, 1, 1,
0.7631616, 0.4230211, 2.292066, 0, 0, 0, 1, 1,
0.7639756, -0.1231864, 2.316041, 0, 0, 0, 1, 1,
0.764002, 0.8513539, -0.0631093, 0, 0, 0, 1, 1,
0.7676646, -0.06935377, 1.395519, 0, 0, 0, 1, 1,
0.77352, 1.504521, -0.1635519, 1, 1, 1, 1, 1,
0.7750139, 0.105564, 1.71107, 1, 1, 1, 1, 1,
0.7809399, 0.09590222, 1.590017, 1, 1, 1, 1, 1,
0.7840643, -1.642592, 3.006822, 1, 1, 1, 1, 1,
0.7893995, -1.034639, 1.755242, 1, 1, 1, 1, 1,
0.7978581, 0.2652701, 2.343819, 1, 1, 1, 1, 1,
0.7986814, -1.341504, 4.003569, 1, 1, 1, 1, 1,
0.8017405, 0.1916512, 1.596206, 1, 1, 1, 1, 1,
0.8092873, 0.4476065, 1.213498, 1, 1, 1, 1, 1,
0.8095032, 0.2248659, -0.7269297, 1, 1, 1, 1, 1,
0.8102963, 0.6644251, 1.10707, 1, 1, 1, 1, 1,
0.8123543, 0.1761218, 0.4006755, 1, 1, 1, 1, 1,
0.822745, 0.7652657, 0.296539, 1, 1, 1, 1, 1,
0.8353108, -0.3834102, 0.3800749, 1, 1, 1, 1, 1,
0.8376287, -0.7106978, 1.616651, 1, 1, 1, 1, 1,
0.8398111, -0.6923003, 2.368697, 0, 0, 1, 1, 1,
0.8403612, 0.269508, 0.001828974, 1, 0, 0, 1, 1,
0.8415672, -0.1197148, 1.60584, 1, 0, 0, 1, 1,
0.8417488, -1.889421, 3.824866, 1, 0, 0, 1, 1,
0.8527287, 1.541069, 1.583887, 1, 0, 0, 1, 1,
0.8550615, -0.7867843, 3.500065, 1, 0, 0, 1, 1,
0.8659526, 1.09138, 0.3206868, 0, 0, 0, 1, 1,
0.8665391, -0.7162091, 1.936321, 0, 0, 0, 1, 1,
0.869118, 1.136832, 0.8604081, 0, 0, 0, 1, 1,
0.8698581, -0.2015852, 0.8415289, 0, 0, 0, 1, 1,
0.8700838, -1.149414, 2.71555, 0, 0, 0, 1, 1,
0.8725655, 0.4384091, 2.134374, 0, 0, 0, 1, 1,
0.8753517, -0.5285814, 2.966429, 0, 0, 0, 1, 1,
0.8776133, -2.07701, 0.3933603, 1, 1, 1, 1, 1,
0.879198, -0.08015006, 2.006771, 1, 1, 1, 1, 1,
0.8795463, 0.6405205, -0.5747616, 1, 1, 1, 1, 1,
0.8809295, -0.6559186, 2.07653, 1, 1, 1, 1, 1,
0.8845295, -1.394845, 3.471745, 1, 1, 1, 1, 1,
0.8857663, 0.2486818, -0.4901744, 1, 1, 1, 1, 1,
0.8860767, -0.6399061, 3.349849, 1, 1, 1, 1, 1,
0.8881266, -0.4344457, 1.583874, 1, 1, 1, 1, 1,
0.8891767, -0.3876408, 1.31257, 1, 1, 1, 1, 1,
0.898756, 0.4204453, 2.243495, 1, 1, 1, 1, 1,
0.9006007, -0.5393504, 2.712013, 1, 1, 1, 1, 1,
0.9045332, 0.6466452, -0.08514141, 1, 1, 1, 1, 1,
0.9054726, 0.2743476, 0.7571212, 1, 1, 1, 1, 1,
0.9057326, 0.6661196, 1.696386, 1, 1, 1, 1, 1,
0.9066325, -0.1628965, 0.8945725, 1, 1, 1, 1, 1,
0.9171219, 0.92443, -0.1356689, 0, 0, 1, 1, 1,
0.918098, -0.5336518, 1.162883, 1, 0, 0, 1, 1,
0.9246355, -1.054029, 1.156174, 1, 0, 0, 1, 1,
0.9272305, -0.9086675, 2.084262, 1, 0, 0, 1, 1,
0.9276394, 0.3494034, 0.5256429, 1, 0, 0, 1, 1,
0.9291784, 0.03997194, 2.924924, 1, 0, 0, 1, 1,
0.9295919, 0.4496441, -0.1108059, 0, 0, 0, 1, 1,
0.9324182, -1.566352, 3.205044, 0, 0, 0, 1, 1,
0.9403895, 0.6670653, 0.5353929, 0, 0, 0, 1, 1,
0.9405991, -1.68265, 3.279926, 0, 0, 0, 1, 1,
0.9406337, -1.919369, 4.421814, 0, 0, 0, 1, 1,
0.9430699, 0.07363729, 3.987532, 0, 0, 0, 1, 1,
0.9601127, 0.9016386, 1.297179, 0, 0, 0, 1, 1,
0.9664096, -0.6128349, 2.146151, 1, 1, 1, 1, 1,
0.9729031, -0.6284646, 3.248633, 1, 1, 1, 1, 1,
0.9754496, 1.327448, -0.7438073, 1, 1, 1, 1, 1,
0.9785356, -1.168455, 0.4206311, 1, 1, 1, 1, 1,
0.9883762, 0.4425694, 1.104854, 1, 1, 1, 1, 1,
0.9981881, 1.797654, 0.4739104, 1, 1, 1, 1, 1,
0.9997014, 0.08505449, 1.791809, 1, 1, 1, 1, 1,
1.000916, -1.184149, 1.669523, 1, 1, 1, 1, 1,
1.001825, 0.539924, 1.509292, 1, 1, 1, 1, 1,
1.002944, 0.1789141, 3.463572, 1, 1, 1, 1, 1,
1.003763, 0.999105, 1.144732, 1, 1, 1, 1, 1,
1.004629, -0.2359607, 0.5447822, 1, 1, 1, 1, 1,
1.006558, -0.3846431, 2.03939, 1, 1, 1, 1, 1,
1.014257, 0.2781332, 1.17268, 1, 1, 1, 1, 1,
1.017186, 1.363329, -0.3464907, 1, 1, 1, 1, 1,
1.017231, -0.07001054, 0.1633998, 0, 0, 1, 1, 1,
1.02088, 0.4715727, 0.3471488, 1, 0, 0, 1, 1,
1.025657, 0.1798191, 0.878961, 1, 0, 0, 1, 1,
1.027882, 1.319466, 1.101569, 1, 0, 0, 1, 1,
1.033749, 1.698609, 1.540792, 1, 0, 0, 1, 1,
1.046719, 0.4520742, 0.6900037, 1, 0, 0, 1, 1,
1.048242, 0.3044758, -0.5381521, 0, 0, 0, 1, 1,
1.048907, -2.350251, 0.6437802, 0, 0, 0, 1, 1,
1.051887, 0.7261003, 0.3524644, 0, 0, 0, 1, 1,
1.062072, 1.06682, 0.4921849, 0, 0, 0, 1, 1,
1.062649, -0.3107736, 0.1244855, 0, 0, 0, 1, 1,
1.06912, -0.9102883, 3.472021, 0, 0, 0, 1, 1,
1.072734, -2.061767, 2.657156, 0, 0, 0, 1, 1,
1.074527, 0.172103, 1.864483, 1, 1, 1, 1, 1,
1.081541, 0.8709394, 1.41457, 1, 1, 1, 1, 1,
1.082738, 0.297309, -0.4474242, 1, 1, 1, 1, 1,
1.084098, 0.1728193, 2.984472, 1, 1, 1, 1, 1,
1.087099, -0.01252068, 0.5787039, 1, 1, 1, 1, 1,
1.089061, -0.5070698, 1.262132, 1, 1, 1, 1, 1,
1.097842, -1.126001, 3.516106, 1, 1, 1, 1, 1,
1.098128, -1.061962, 1.344042, 1, 1, 1, 1, 1,
1.098343, -0.700677, 1.98806, 1, 1, 1, 1, 1,
1.101938, -1.335145, 2.248525, 1, 1, 1, 1, 1,
1.104394, -1.191489, 1.206952, 1, 1, 1, 1, 1,
1.108028, 0.6762423, 2.003803, 1, 1, 1, 1, 1,
1.113707, -1.064641, 2.046989, 1, 1, 1, 1, 1,
1.125022, 0.9544299, -0.1009402, 1, 1, 1, 1, 1,
1.131845, -0.9863234, 2.841785, 1, 1, 1, 1, 1,
1.132174, -1.729229, 0.736048, 0, 0, 1, 1, 1,
1.132535, -0.2993984, 1.723978, 1, 0, 0, 1, 1,
1.138493, 0.1252267, -0.3511873, 1, 0, 0, 1, 1,
1.139187, -0.9984536, 3.049832, 1, 0, 0, 1, 1,
1.145929, -0.7122759, 1.869829, 1, 0, 0, 1, 1,
1.152484, 0.9605672, -0.1177111, 1, 0, 0, 1, 1,
1.153243, 0.3968782, 1.381216, 0, 0, 0, 1, 1,
1.156372, -0.3561656, 2.062599, 0, 0, 0, 1, 1,
1.157108, 0.3084775, 0.5468867, 0, 0, 0, 1, 1,
1.157632, 1.047563, -0.2927717, 0, 0, 0, 1, 1,
1.160949, -0.8119308, 1.850765, 0, 0, 0, 1, 1,
1.164537, -0.1619318, 1.876524, 0, 0, 0, 1, 1,
1.16669, 1.381132, 1.840833, 0, 0, 0, 1, 1,
1.171007, 2.090251, 0.8071234, 1, 1, 1, 1, 1,
1.179029, 0.6635329, 1.701114, 1, 1, 1, 1, 1,
1.180659, 0.2615289, 1.518674, 1, 1, 1, 1, 1,
1.183378, 0.6699842, 1.87851, 1, 1, 1, 1, 1,
1.192743, 1.302384, -1.636611, 1, 1, 1, 1, 1,
1.193097, 0.6718399, 1.176236, 1, 1, 1, 1, 1,
1.197347, -0.1745478, 2.140443, 1, 1, 1, 1, 1,
1.197644, -0.07413842, 3.345606, 1, 1, 1, 1, 1,
1.198357, 0.1089121, -0.01763562, 1, 1, 1, 1, 1,
1.202598, 2.560658, 0.6695763, 1, 1, 1, 1, 1,
1.211918, 1.21659, 0.4184974, 1, 1, 1, 1, 1,
1.216029, 1.36388, 1.305467, 1, 1, 1, 1, 1,
1.220169, -0.4631957, 2.418578, 1, 1, 1, 1, 1,
1.223151, 0.2624938, 0.4809077, 1, 1, 1, 1, 1,
1.225731, -0.3641524, 2.017574, 1, 1, 1, 1, 1,
1.232557, -1.353693, 2.283202, 0, 0, 1, 1, 1,
1.238534, 0.829256, 0.5427294, 1, 0, 0, 1, 1,
1.245129, 0.7433597, 1.401715, 1, 0, 0, 1, 1,
1.256496, 0.4207252, 0.6272161, 1, 0, 0, 1, 1,
1.260978, 0.3470485, 3.792812, 1, 0, 0, 1, 1,
1.268496, -0.95847, 1.600398, 1, 0, 0, 1, 1,
1.278593, 0.1090452, 2.457165, 0, 0, 0, 1, 1,
1.27907, 0.6466416, 1.414692, 0, 0, 0, 1, 1,
1.28021, -0.5127119, 1.863449, 0, 0, 0, 1, 1,
1.289994, -0.1735552, 0.1230248, 0, 0, 0, 1, 1,
1.291655, 1.147473, 1.876485, 0, 0, 0, 1, 1,
1.29171, 0.5106605, 3.36977, 0, 0, 0, 1, 1,
1.29287, 1.213269, 1.040726, 0, 0, 0, 1, 1,
1.298084, -0.4764881, 2.867145, 1, 1, 1, 1, 1,
1.298317, 0.2723744, 1.551812, 1, 1, 1, 1, 1,
1.303825, -1.095077, 1.140518, 1, 1, 1, 1, 1,
1.308565, -1.547268, 0.8531027, 1, 1, 1, 1, 1,
1.31126, -0.6449099, 2.342217, 1, 1, 1, 1, 1,
1.311452, -0.1930624, 0.4594014, 1, 1, 1, 1, 1,
1.319797, -0.5094905, 2.616841, 1, 1, 1, 1, 1,
1.346633, -1.518207, 3.451937, 1, 1, 1, 1, 1,
1.352734, -0.1409991, 1.111416, 1, 1, 1, 1, 1,
1.3649, 0.9017141, 2.161195, 1, 1, 1, 1, 1,
1.367277, -0.2408599, 0.9321551, 1, 1, 1, 1, 1,
1.370086, 0.4736963, 1.053963, 1, 1, 1, 1, 1,
1.374322, 0.1039443, 1.002813, 1, 1, 1, 1, 1,
1.387311, 0.9047608, 0.4366489, 1, 1, 1, 1, 1,
1.389851, -0.8694211, 2.561789, 1, 1, 1, 1, 1,
1.390671, -0.9585674, 1.540185, 0, 0, 1, 1, 1,
1.393981, 0.3050836, 1.943962, 1, 0, 0, 1, 1,
1.400611, 0.07982998, 0.08659694, 1, 0, 0, 1, 1,
1.404408, -0.06019939, 0.8515821, 1, 0, 0, 1, 1,
1.406019, 0.8116108, 1.470574, 1, 0, 0, 1, 1,
1.407479, -0.2141818, 1.538513, 1, 0, 0, 1, 1,
1.410058, -0.9645481, 1.180884, 0, 0, 0, 1, 1,
1.427389, -1.733006, 3.887395, 0, 0, 0, 1, 1,
1.433722, 1.14378, 1.675341, 0, 0, 0, 1, 1,
1.434945, -2.299753, 3.610401, 0, 0, 0, 1, 1,
1.435125, 0.3463748, 2.292615, 0, 0, 0, 1, 1,
1.436492, -0.06611133, 0.4683987, 0, 0, 0, 1, 1,
1.442686, -1.260462, 0.1429424, 0, 0, 0, 1, 1,
1.456553, 1.77718, 0.5798158, 1, 1, 1, 1, 1,
1.458794, 0.9404616, -0.6083645, 1, 1, 1, 1, 1,
1.467171, 1.134224, 2.467853, 1, 1, 1, 1, 1,
1.475592, -0.5039381, 3.418317, 1, 1, 1, 1, 1,
1.498971, -1.357373, 4.026482, 1, 1, 1, 1, 1,
1.510203, 0.8641163, 1.948342, 1, 1, 1, 1, 1,
1.519934, -0.1530818, 2.564183, 1, 1, 1, 1, 1,
1.530165, -0.3477961, 2.011675, 1, 1, 1, 1, 1,
1.536919, -0.02029267, 2.720246, 1, 1, 1, 1, 1,
1.541972, 0.9431422, 2.238333, 1, 1, 1, 1, 1,
1.548785, -0.4321853, 1.661301, 1, 1, 1, 1, 1,
1.55967, 0.9939085, 0.3314482, 1, 1, 1, 1, 1,
1.579336, 0.8821269, -0.3387112, 1, 1, 1, 1, 1,
1.581525, 0.1973286, 2.109851, 1, 1, 1, 1, 1,
1.590356, -0.3254818, 1.605801, 1, 1, 1, 1, 1,
1.592884, -0.9472943, 1.591182, 0, 0, 1, 1, 1,
1.596207, 0.3386562, 0.9056862, 1, 0, 0, 1, 1,
1.601488, -1.612438, 2.768336, 1, 0, 0, 1, 1,
1.605257, -0.6208473, 1.833876, 1, 0, 0, 1, 1,
1.607725, -0.840359, 0.9595916, 1, 0, 0, 1, 1,
1.613319, -0.1006792, 1.014657, 1, 0, 0, 1, 1,
1.613434, 1.337221, 0.6066595, 0, 0, 0, 1, 1,
1.616813, -0.1931343, 2.005934, 0, 0, 0, 1, 1,
1.624681, 1.392529, 1.234719, 0, 0, 0, 1, 1,
1.630278, -0.06681353, 3.008988, 0, 0, 0, 1, 1,
1.636075, -0.6459488, 1.144866, 0, 0, 0, 1, 1,
1.652713, -1.546746, 1.739612, 0, 0, 0, 1, 1,
1.70453, 0.04552264, 1.041802, 0, 0, 0, 1, 1,
1.725458, 0.6117231, 3.245067, 1, 1, 1, 1, 1,
1.774943, 0.6085947, 1.776321, 1, 1, 1, 1, 1,
1.781309, 1.719554, 0.9022623, 1, 1, 1, 1, 1,
1.789241, -1.148504, 0.6920449, 1, 1, 1, 1, 1,
1.799098, 1.169817, 0.1104943, 1, 1, 1, 1, 1,
1.800509, 1.308402, -0.07753419, 1, 1, 1, 1, 1,
1.807583, -0.7577308, 2.562897, 1, 1, 1, 1, 1,
1.816966, 1.092453, 1.744832, 1, 1, 1, 1, 1,
1.818579, 0.01205314, 0.6212501, 1, 1, 1, 1, 1,
1.86048, 2.31873, 0.6224405, 1, 1, 1, 1, 1,
1.871687, 0.2098498, 0.2788907, 1, 1, 1, 1, 1,
1.881919, 0.9803577, 1.433968, 1, 1, 1, 1, 1,
1.886262, -1.131394, 2.450542, 1, 1, 1, 1, 1,
1.912502, 0.4268652, -0.1323401, 1, 1, 1, 1, 1,
1.949073, 0.08708125, -0.2081729, 1, 1, 1, 1, 1,
1.958118, 0.6430446, 1.919304, 0, 0, 1, 1, 1,
1.975571, 0.9329488, 2.162313, 1, 0, 0, 1, 1,
1.977163, -0.3031314, -0.4604644, 1, 0, 0, 1, 1,
1.977914, 0.5682437, 1.993309, 1, 0, 0, 1, 1,
1.996997, -1.067183, 1.834183, 1, 0, 0, 1, 1,
2.094761, -0.1144754, 1.625947, 1, 0, 0, 1, 1,
2.121689, 0.6432824, 1.115648, 0, 0, 0, 1, 1,
2.165738, -1.11138, 0.9499924, 0, 0, 0, 1, 1,
2.168459, -0.06406789, 0.4679266, 0, 0, 0, 1, 1,
2.18244, 0.5434726, 0.8066299, 0, 0, 0, 1, 1,
2.19066, -1.892419, 4.074883, 0, 0, 0, 1, 1,
2.378862, 1.670736, -0.7532942, 0, 0, 0, 1, 1,
2.45565, 0.01777728, 2.075869, 0, 0, 0, 1, 1,
2.503211, 1.49, 0.5656542, 1, 1, 1, 1, 1,
2.522258, -1.81652, 1.398282, 1, 1, 1, 1, 1,
2.555764, 1.265259, 0.3023276, 1, 1, 1, 1, 1,
2.85025, -0.9115335, 0.9724303, 1, 1, 1, 1, 1,
2.982649, 0.6501186, 1.217405, 1, 1, 1, 1, 1,
3.017655, -0.4551164, 2.658779, 1, 1, 1, 1, 1,
3.272924, 1.68416, 2.521687, 1, 1, 1, 1, 1
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
var radius = 9.536823;
var distance = 33.49768;
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
mvMatrix.translate( 0.07582521, 0.3850846, 0.07110977 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.49768);
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