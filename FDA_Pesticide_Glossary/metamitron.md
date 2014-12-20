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
-2.806291, 0.6693521, -1.31523, 1, 0, 0, 1,
-2.731352, -1.32853, -0.08828048, 1, 0.007843138, 0, 1,
-2.701614, 1.442027, -1.822358, 1, 0.01176471, 0, 1,
-2.689362, 0.05351716, -2.893444, 1, 0.01960784, 0, 1,
-2.687391, -0.1922572, -1.60689, 1, 0.02352941, 0, 1,
-2.556972, -0.04896288, -2.480661, 1, 0.03137255, 0, 1,
-2.532228, 0.8781549, -2.980985, 1, 0.03529412, 0, 1,
-2.500081, 0.5892703, -3.019986, 1, 0.04313726, 0, 1,
-2.396891, -0.8786199, -3.285037, 1, 0.04705882, 0, 1,
-2.283065, -0.2504372, -4.262855, 1, 0.05490196, 0, 1,
-2.276674, 1.508422, 1.329606, 1, 0.05882353, 0, 1,
-2.248647, -0.3011785, -0.2019928, 1, 0.06666667, 0, 1,
-2.220874, -2.940065, -3.068616, 1, 0.07058824, 0, 1,
-2.190331, -0.279859, -2.719961, 1, 0.07843138, 0, 1,
-2.121518, -0.879245, -1.880384, 1, 0.08235294, 0, 1,
-2.085347, 2.191253, -0.7157832, 1, 0.09019608, 0, 1,
-2.06779, -0.3014689, -1.546059, 1, 0.09411765, 0, 1,
-2.060469, 0.7575231, -3.695211, 1, 0.1019608, 0, 1,
-2.035425, 0.6475409, -0.8765589, 1, 0.1098039, 0, 1,
-2.023487, -0.7711645, -2.300906, 1, 0.1137255, 0, 1,
-1.996153, 0.004485147, -2.716768, 1, 0.1215686, 0, 1,
-1.989265, -0.3251455, -2.211802, 1, 0.1254902, 0, 1,
-1.941426, 1.524183, -0.6641629, 1, 0.1333333, 0, 1,
-1.925882, 0.5625309, -0.5891968, 1, 0.1372549, 0, 1,
-1.875604, -1.186769, -1.391115, 1, 0.145098, 0, 1,
-1.828712, 0.7302907, -1.305102, 1, 0.1490196, 0, 1,
-1.818242, 1.395507, -2.083308, 1, 0.1568628, 0, 1,
-1.8091, 1.122919, -0.247543, 1, 0.1607843, 0, 1,
-1.796326, -0.0408725, -1.510906, 1, 0.1686275, 0, 1,
-1.765551, 0.5772841, -0.72646, 1, 0.172549, 0, 1,
-1.737965, 1.268614, 0.752762, 1, 0.1803922, 0, 1,
-1.732156, 1.523431, -0.9982336, 1, 0.1843137, 0, 1,
-1.722087, 0.948305, 0.2976292, 1, 0.1921569, 0, 1,
-1.713565, 0.1843042, -1.848241, 1, 0.1960784, 0, 1,
-1.712161, 0.57533, -1.019848, 1, 0.2039216, 0, 1,
-1.710757, -1.879374, -3.131401, 1, 0.2117647, 0, 1,
-1.664399, 0.8185514, -1.531827, 1, 0.2156863, 0, 1,
-1.66228, 0.06397795, -1.82467, 1, 0.2235294, 0, 1,
-1.658871, 1.632435, -1.229052, 1, 0.227451, 0, 1,
-1.638093, 0.8017468, -1.646153, 1, 0.2352941, 0, 1,
-1.63588, -0.8768586, -2.863006, 1, 0.2392157, 0, 1,
-1.619721, -0.7923996, -1.861978, 1, 0.2470588, 0, 1,
-1.608683, 0.1726243, -1.552332, 1, 0.2509804, 0, 1,
-1.604916, 0.689752, -0.1647046, 1, 0.2588235, 0, 1,
-1.603843, 0.1042296, -0.9081584, 1, 0.2627451, 0, 1,
-1.603774, 0.1850021, 0.4526555, 1, 0.2705882, 0, 1,
-1.591903, -0.4905396, 0.2416851, 1, 0.2745098, 0, 1,
-1.569896, -1.583397, -2.837447, 1, 0.282353, 0, 1,
-1.564591, -0.3750893, -1.426651, 1, 0.2862745, 0, 1,
-1.561059, -0.07390641, -2.862077, 1, 0.2941177, 0, 1,
-1.545116, -0.2973565, -1.024582, 1, 0.3019608, 0, 1,
-1.542894, 0.06399532, -1.639424, 1, 0.3058824, 0, 1,
-1.530988, -0.2290143, -2.180007, 1, 0.3137255, 0, 1,
-1.530774, -1.075668, -1.736464, 1, 0.3176471, 0, 1,
-1.521674, -1.170115, -0.5499669, 1, 0.3254902, 0, 1,
-1.514622, 0.2680922, -1.179422, 1, 0.3294118, 0, 1,
-1.512628, 2.441485, -0.2784637, 1, 0.3372549, 0, 1,
-1.512419, 1.439584, 0.1489526, 1, 0.3411765, 0, 1,
-1.511715, 1.769639, -0.4269412, 1, 0.3490196, 0, 1,
-1.504254, 0.5278186, -1.301093, 1, 0.3529412, 0, 1,
-1.502718, -0.2139209, -1.432547, 1, 0.3607843, 0, 1,
-1.488603, 0.7823136, -1.703014, 1, 0.3647059, 0, 1,
-1.487501, -0.4156172, -1.766989, 1, 0.372549, 0, 1,
-1.466339, -2.113427, -1.503289, 1, 0.3764706, 0, 1,
-1.452292, -1.105023, -2.69164, 1, 0.3843137, 0, 1,
-1.449869, 0.2556926, -0.9450753, 1, 0.3882353, 0, 1,
-1.441389, 2.511317, -1.346365, 1, 0.3960784, 0, 1,
-1.439415, 0.8988176, -0.5285676, 1, 0.4039216, 0, 1,
-1.425749, -1.072682, -2.945939, 1, 0.4078431, 0, 1,
-1.420081, 0.9197827, -1.935632, 1, 0.4156863, 0, 1,
-1.419123, 0.5386894, -1.135731, 1, 0.4196078, 0, 1,
-1.416953, -0.5085359, -1.979141, 1, 0.427451, 0, 1,
-1.405376, -0.5479439, -2.110292, 1, 0.4313726, 0, 1,
-1.402143, 0.6510406, -0.6049705, 1, 0.4392157, 0, 1,
-1.400665, -0.3694694, -2.092767, 1, 0.4431373, 0, 1,
-1.395178, 0.1060197, -2.114988, 1, 0.4509804, 0, 1,
-1.38725, 0.9127964, 0.2293458, 1, 0.454902, 0, 1,
-1.386549, -1.839796, -2.488417, 1, 0.4627451, 0, 1,
-1.384466, -0.5234901, -2.187267, 1, 0.4666667, 0, 1,
-1.37145, 1.154672, 0.3799996, 1, 0.4745098, 0, 1,
-1.369612, -0.4392498, -0.1732332, 1, 0.4784314, 0, 1,
-1.358824, -0.6298785, -1.420141, 1, 0.4862745, 0, 1,
-1.35727, 0.6760886, -0.5173437, 1, 0.4901961, 0, 1,
-1.356952, 0.05333679, -1.277852, 1, 0.4980392, 0, 1,
-1.346393, 0.4703259, -1.820852, 1, 0.5058824, 0, 1,
-1.342207, 0.02159212, -2.326085, 1, 0.509804, 0, 1,
-1.329379, 0.2075503, -0.8647096, 1, 0.5176471, 0, 1,
-1.326244, -0.6118711, -1.312603, 1, 0.5215687, 0, 1,
-1.321101, 0.1493226, -1.197207, 1, 0.5294118, 0, 1,
-1.319665, -1.918493, -3.338783, 1, 0.5333334, 0, 1,
-1.318353, -0.1353862, -0.8373147, 1, 0.5411765, 0, 1,
-1.316781, 0.09606916, -2.327519, 1, 0.5450981, 0, 1,
-1.315236, 1.375652, 0.3506415, 1, 0.5529412, 0, 1,
-1.311868, 0.2432462, -1.480782, 1, 0.5568628, 0, 1,
-1.299296, 1.319855, -0.2612111, 1, 0.5647059, 0, 1,
-1.29711, -0.5593697, -1.541553, 1, 0.5686275, 0, 1,
-1.293795, 0.331396, -1.032385, 1, 0.5764706, 0, 1,
-1.283811, 0.7758747, -0.9082195, 1, 0.5803922, 0, 1,
-1.282741, 2.061701, -0.5090361, 1, 0.5882353, 0, 1,
-1.280328, -0.2306174, -1.297149, 1, 0.5921569, 0, 1,
-1.273616, -0.7782431, -2.452731, 1, 0.6, 0, 1,
-1.268745, 1.06379, -2.371524, 1, 0.6078432, 0, 1,
-1.26637, 0.6532644, -1.025914, 1, 0.6117647, 0, 1,
-1.26312, 1.386094, 0.1145038, 1, 0.6196079, 0, 1,
-1.261707, 0.09690589, -0.7533688, 1, 0.6235294, 0, 1,
-1.258694, 0.02738644, -1.878939, 1, 0.6313726, 0, 1,
-1.258665, 0.9638324, -1.35488, 1, 0.6352941, 0, 1,
-1.253817, -0.04107025, -1.333068, 1, 0.6431373, 0, 1,
-1.252454, 1.251723, 0.4926454, 1, 0.6470588, 0, 1,
-1.246807, -0.4054275, -1.48622, 1, 0.654902, 0, 1,
-1.234502, 0.7529395, -1.989112, 1, 0.6588235, 0, 1,
-1.23067, -0.4508229, -2.222789, 1, 0.6666667, 0, 1,
-1.221891, 0.4562748, -1.40797, 1, 0.6705883, 0, 1,
-1.220409, -0.2487225, -1.299366, 1, 0.6784314, 0, 1,
-1.210562, -1.039161, -2.101699, 1, 0.682353, 0, 1,
-1.197733, -1.119982, -0.1965189, 1, 0.6901961, 0, 1,
-1.194874, -0.56964, -3.627296, 1, 0.6941177, 0, 1,
-1.18426, -1.435971, -4.216544, 1, 0.7019608, 0, 1,
-1.183057, -0.3238983, -0.4048472, 1, 0.7098039, 0, 1,
-1.166353, -0.3051631, -1.526812, 1, 0.7137255, 0, 1,
-1.14632, 0.4003291, -0.8775716, 1, 0.7215686, 0, 1,
-1.137798, 0.2755398, -1.493679, 1, 0.7254902, 0, 1,
-1.131346, -0.1644483, -1.853317, 1, 0.7333333, 0, 1,
-1.131261, 1.092339, 0.03783716, 1, 0.7372549, 0, 1,
-1.129064, -0.2784855, -1.714621, 1, 0.7450981, 0, 1,
-1.126195, -0.4910218, -2.382205, 1, 0.7490196, 0, 1,
-1.120607, 0.9005193, -1.109058, 1, 0.7568628, 0, 1,
-1.114268, -0.9023451, -0.696926, 1, 0.7607843, 0, 1,
-1.112438, -0.584124, -0.01265375, 1, 0.7686275, 0, 1,
-1.102839, 0.9710978, -1.099642, 1, 0.772549, 0, 1,
-1.098316, 0.453936, -3.353702, 1, 0.7803922, 0, 1,
-1.080432, -0.4308761, -3.494279, 1, 0.7843137, 0, 1,
-1.078125, -1.230167, -1.434268, 1, 0.7921569, 0, 1,
-1.06475, -0.345345, -3.243788, 1, 0.7960784, 0, 1,
-1.058623, -0.04237564, -1.378421, 1, 0.8039216, 0, 1,
-1.057811, 1.895306, -1.325744, 1, 0.8117647, 0, 1,
-1.057043, 0.6087826, -0.8842943, 1, 0.8156863, 0, 1,
-1.054627, -0.1348415, -1.480045, 1, 0.8235294, 0, 1,
-1.053689, 1.250449, 0.2357766, 1, 0.827451, 0, 1,
-1.049038, -0.7376078, -3.815729, 1, 0.8352941, 0, 1,
-1.04559, -0.3658634, -3.336743, 1, 0.8392157, 0, 1,
-1.044985, 0.07302993, -0.641333, 1, 0.8470588, 0, 1,
-1.033331, -0.9748704, -1.989432, 1, 0.8509804, 0, 1,
-1.033069, 1.115213, -1.53495, 1, 0.8588235, 0, 1,
-1.0328, 0.320355, -1.899431, 1, 0.8627451, 0, 1,
-1.024917, -0.7968923, -1.880792, 1, 0.8705882, 0, 1,
-1.02233, 0.1675339, -2.945152, 1, 0.8745098, 0, 1,
-1.018603, 0.5046487, -0.5429335, 1, 0.8823529, 0, 1,
-1.016626, 0.8007671, -1.277847, 1, 0.8862745, 0, 1,
-1.015732, -1.491317, -2.880311, 1, 0.8941177, 0, 1,
-1.009323, 1.06782, -0.4911542, 1, 0.8980392, 0, 1,
-1.008626, 0.6966802, 0.8795245, 1, 0.9058824, 0, 1,
-1.00515, 0.5187572, -2.494262, 1, 0.9137255, 0, 1,
-0.9901915, 0.06254944, -1.804279, 1, 0.9176471, 0, 1,
-0.9859648, 0.8527985, -0.801412, 1, 0.9254902, 0, 1,
-0.9805827, 0.1268145, -2.327274, 1, 0.9294118, 0, 1,
-0.9763448, -2.558346, -1.610711, 1, 0.9372549, 0, 1,
-0.973354, -1.709699, -2.509629, 1, 0.9411765, 0, 1,
-0.9712945, -0.6061871, -2.184742, 1, 0.9490196, 0, 1,
-0.9594441, 0.7838564, 0.2397556, 1, 0.9529412, 0, 1,
-0.9584286, -1.176755, -2.971383, 1, 0.9607843, 0, 1,
-0.953947, -0.8092875, -3.30408, 1, 0.9647059, 0, 1,
-0.9496596, 0.2436158, -1.597922, 1, 0.972549, 0, 1,
-0.9491507, 0.3887275, -0.9778196, 1, 0.9764706, 0, 1,
-0.9490256, 1.548616, -1.074609, 1, 0.9843137, 0, 1,
-0.9463913, -1.692952, -2.017009, 1, 0.9882353, 0, 1,
-0.9441805, 0.6808119, -2.250039, 1, 0.9960784, 0, 1,
-0.9364339, 0.3756475, -2.809388, 0.9960784, 1, 0, 1,
-0.931213, 1.627872, 0.07406292, 0.9921569, 1, 0, 1,
-0.9289209, 0.3890387, -2.136971, 0.9843137, 1, 0, 1,
-0.9245279, 0.3281912, -2.053012, 0.9803922, 1, 0, 1,
-0.9218133, -0.1474289, -2.435742, 0.972549, 1, 0, 1,
-0.9216242, 0.05064887, -1.44521, 0.9686275, 1, 0, 1,
-0.920808, -0.1915839, -2.561532, 0.9607843, 1, 0, 1,
-0.9187849, -1.099403, -2.871783, 0.9568627, 1, 0, 1,
-0.9070304, 0.6455414, -1.137797, 0.9490196, 1, 0, 1,
-0.9064961, 0.2809719, -0.7712446, 0.945098, 1, 0, 1,
-0.9054158, -0.858232, -2.039452, 0.9372549, 1, 0, 1,
-0.8990128, -0.1844948, 0.9470052, 0.9333333, 1, 0, 1,
-0.8946722, 0.7366279, 0.7457076, 0.9254902, 1, 0, 1,
-0.8944749, -0.8363975, -1.831983, 0.9215686, 1, 0, 1,
-0.8930144, -0.8400863, -2.861645, 0.9137255, 1, 0, 1,
-0.8927402, -1.074111, -2.613709, 0.9098039, 1, 0, 1,
-0.8901044, 0.1738638, -0.9306879, 0.9019608, 1, 0, 1,
-0.8873827, -0.4116023, -2.223185, 0.8941177, 1, 0, 1,
-0.8810526, 0.3538282, -1.426393, 0.8901961, 1, 0, 1,
-0.8737522, 0.564186, -0.7223996, 0.8823529, 1, 0, 1,
-0.8703476, 0.4629643, -0.6020254, 0.8784314, 1, 0, 1,
-0.8697454, 0.002268833, -0.8926547, 0.8705882, 1, 0, 1,
-0.8600245, -0.1265389, -2.72796, 0.8666667, 1, 0, 1,
-0.8586547, 0.4191099, -0.9829406, 0.8588235, 1, 0, 1,
-0.8539748, 0.2322937, -2.728, 0.854902, 1, 0, 1,
-0.853545, -1.661471, -1.957585, 0.8470588, 1, 0, 1,
-0.8521069, -0.6264032, -2.415226, 0.8431373, 1, 0, 1,
-0.8509828, -0.6478051, -2.552531, 0.8352941, 1, 0, 1,
-0.8478981, 0.04056887, -1.609692, 0.8313726, 1, 0, 1,
-0.846893, 1.795116, -0.3502254, 0.8235294, 1, 0, 1,
-0.8458732, -0.7481752, -1.001793, 0.8196079, 1, 0, 1,
-0.8440558, -0.7524967, -2.147358, 0.8117647, 1, 0, 1,
-0.8356096, -1.168956, -1.3091, 0.8078431, 1, 0, 1,
-0.8352468, 1.705097, -1.891057, 0.8, 1, 0, 1,
-0.8307924, 0.8922559, 0.2700971, 0.7921569, 1, 0, 1,
-0.8302194, 0.9479097, -0.5065839, 0.7882353, 1, 0, 1,
-0.8296923, -1.541302, -2.5422, 0.7803922, 1, 0, 1,
-0.8204307, 0.3663193, -1.088019, 0.7764706, 1, 0, 1,
-0.8174494, -0.09761025, -0.6456852, 0.7686275, 1, 0, 1,
-0.8152161, -0.1594476, -1.861144, 0.7647059, 1, 0, 1,
-0.8151696, 0.4031922, -2.737147, 0.7568628, 1, 0, 1,
-0.8137131, 0.7630726, -2.789524, 0.7529412, 1, 0, 1,
-0.8106621, 1.291245, -0.01352585, 0.7450981, 1, 0, 1,
-0.8097892, -1.340747, -1.687681, 0.7411765, 1, 0, 1,
-0.8038387, 0.05233124, -2.835089, 0.7333333, 1, 0, 1,
-0.7993243, 3.142608, 1.236698, 0.7294118, 1, 0, 1,
-0.7990816, -1.23781, -2.633589, 0.7215686, 1, 0, 1,
-0.7881917, -1.293051, -1.225319, 0.7176471, 1, 0, 1,
-0.7771519, 0.2997845, -2.547784, 0.7098039, 1, 0, 1,
-0.776772, 0.886425, -1.441705, 0.7058824, 1, 0, 1,
-0.7763785, -0.6375776, -0.8461354, 0.6980392, 1, 0, 1,
-0.7735996, 0.4724733, -1.653605, 0.6901961, 1, 0, 1,
-0.7735142, 1.151613, -2.683815, 0.6862745, 1, 0, 1,
-0.7664835, 1.101665, -0.4035573, 0.6784314, 1, 0, 1,
-0.7544263, 1.187539, -0.9658774, 0.6745098, 1, 0, 1,
-0.7480077, -0.6893007, -1.153934, 0.6666667, 1, 0, 1,
-0.7464049, 2.956343, 0.2150619, 0.6627451, 1, 0, 1,
-0.7445968, -0.612865, -2.637011, 0.654902, 1, 0, 1,
-0.7443614, -0.5679754, -2.060376, 0.6509804, 1, 0, 1,
-0.7423938, 1.425329, -1.110325, 0.6431373, 1, 0, 1,
-0.7396501, -1.062379, -3.082422, 0.6392157, 1, 0, 1,
-0.7334754, -0.8022033, -1.777036, 0.6313726, 1, 0, 1,
-0.7251759, -0.8188211, -2.123846, 0.627451, 1, 0, 1,
-0.7225493, 0.772542, -1.757851, 0.6196079, 1, 0, 1,
-0.7216716, -0.2307096, -1.64959, 0.6156863, 1, 0, 1,
-0.7215747, 0.138141, -0.7665865, 0.6078432, 1, 0, 1,
-0.7160417, -1.361193, -1.812945, 0.6039216, 1, 0, 1,
-0.7151996, 0.8243176, -0.2298461, 0.5960785, 1, 0, 1,
-0.7136651, -0.5199173, -3.223768, 0.5882353, 1, 0, 1,
-0.710853, -0.5551389, -2.555015, 0.5843138, 1, 0, 1,
-0.7090764, -0.3444646, -2.174567, 0.5764706, 1, 0, 1,
-0.7068873, 0.6941444, 0.4793551, 0.572549, 1, 0, 1,
-0.7054637, 0.4605516, -0.7982603, 0.5647059, 1, 0, 1,
-0.7038789, 1.269288, -1.077368, 0.5607843, 1, 0, 1,
-0.7035376, -0.6634187, -1.867166, 0.5529412, 1, 0, 1,
-0.6996802, -0.2576472, -4.768991, 0.5490196, 1, 0, 1,
-0.6915203, -2.259293, -2.327701, 0.5411765, 1, 0, 1,
-0.6838416, -0.6791298, -2.506216, 0.5372549, 1, 0, 1,
-0.6812605, 1.400943, -0.8384097, 0.5294118, 1, 0, 1,
-0.6810401, -0.7528909, -2.810741, 0.5254902, 1, 0, 1,
-0.6685898, 0.1622533, -0.8536547, 0.5176471, 1, 0, 1,
-0.6682867, -1.904575, -2.803391, 0.5137255, 1, 0, 1,
-0.6673019, 0.6709082, 0.03340959, 0.5058824, 1, 0, 1,
-0.6638249, 0.7439157, -1.659475, 0.5019608, 1, 0, 1,
-0.6602264, -0.09189642, -3.140008, 0.4941176, 1, 0, 1,
-0.6583132, -0.2615976, -0.8106617, 0.4862745, 1, 0, 1,
-0.6564862, 0.1134967, -2.40421, 0.4823529, 1, 0, 1,
-0.6563492, -1.189276, -2.956752, 0.4745098, 1, 0, 1,
-0.6452996, 1.065468, -0.9953764, 0.4705882, 1, 0, 1,
-0.6436258, 0.07368947, -1.879738, 0.4627451, 1, 0, 1,
-0.6402219, 0.2191816, -0.3275979, 0.4588235, 1, 0, 1,
-0.6377191, -1.038445, -2.690466, 0.4509804, 1, 0, 1,
-0.6342702, 1.505355, -0.6542437, 0.4470588, 1, 0, 1,
-0.6314649, 0.1634327, -1.030268, 0.4392157, 1, 0, 1,
-0.6292714, -1.229526, -3.534541, 0.4352941, 1, 0, 1,
-0.6273226, -1.523995, -2.181435, 0.427451, 1, 0, 1,
-0.6250077, -0.06139209, -1.955311, 0.4235294, 1, 0, 1,
-0.6237071, -0.0826043, -1.321967, 0.4156863, 1, 0, 1,
-0.6174908, -0.8505877, -4.005998, 0.4117647, 1, 0, 1,
-0.6171842, -0.9642972, -3.843343, 0.4039216, 1, 0, 1,
-0.6166567, 0.9683699, -2.329415, 0.3960784, 1, 0, 1,
-0.614916, -1.474815, -3.563191, 0.3921569, 1, 0, 1,
-0.6111881, -0.6910616, -2.97604, 0.3843137, 1, 0, 1,
-0.6078508, 0.1321978, -1.328911, 0.3803922, 1, 0, 1,
-0.6045513, -1.052932, -3.074964, 0.372549, 1, 0, 1,
-0.602331, -0.1656744, -1.817595, 0.3686275, 1, 0, 1,
-0.6011741, -1.986308, -2.763885, 0.3607843, 1, 0, 1,
-0.5964893, -0.4651551, -2.070683, 0.3568628, 1, 0, 1,
-0.590373, -0.8029403, -2.584832, 0.3490196, 1, 0, 1,
-0.5891017, -0.6937234, -2.624002, 0.345098, 1, 0, 1,
-0.5783994, 0.3401898, -0.1574167, 0.3372549, 1, 0, 1,
-0.5770652, -0.5199876, -3.094431, 0.3333333, 1, 0, 1,
-0.5762545, 0.8016791, 1.443765, 0.3254902, 1, 0, 1,
-0.5753762, -1.441287, -2.244983, 0.3215686, 1, 0, 1,
-0.5749293, -1.589166, -0.1205982, 0.3137255, 1, 0, 1,
-0.5745588, 0.9684806, -1.39517, 0.3098039, 1, 0, 1,
-0.5708433, 1.639083, 0.7284769, 0.3019608, 1, 0, 1,
-0.5686513, -0.9635274, -3.073256, 0.2941177, 1, 0, 1,
-0.5680916, -0.4407365, -1.452814, 0.2901961, 1, 0, 1,
-0.5672497, 0.6611254, -1.506734, 0.282353, 1, 0, 1,
-0.5630856, 0.7006645, -1.683223, 0.2784314, 1, 0, 1,
-0.5578005, -0.8460879, -4.1412, 0.2705882, 1, 0, 1,
-0.5572297, -0.3995192, -1.407801, 0.2666667, 1, 0, 1,
-0.5543506, 0.1088547, -2.591049, 0.2588235, 1, 0, 1,
-0.5535102, -1.160264, -2.98456, 0.254902, 1, 0, 1,
-0.552691, -1.141053, -3.531658, 0.2470588, 1, 0, 1,
-0.5478979, 1.873287, 0.006005781, 0.2431373, 1, 0, 1,
-0.5468044, -0.2516188, -2.371422, 0.2352941, 1, 0, 1,
-0.5447488, -0.9527605, -1.718184, 0.2313726, 1, 0, 1,
-0.5442508, -1.820924, -3.265658, 0.2235294, 1, 0, 1,
-0.5437826, -0.04729118, -1.733826, 0.2196078, 1, 0, 1,
-0.542629, -0.528705, -1.670672, 0.2117647, 1, 0, 1,
-0.5381911, 0.5844585, -1.367472, 0.2078431, 1, 0, 1,
-0.5358318, -0.02611111, -1.257674, 0.2, 1, 0, 1,
-0.5327062, -0.5184706, -1.573499, 0.1921569, 1, 0, 1,
-0.5303237, 0.3094415, -0.9979739, 0.1882353, 1, 0, 1,
-0.5279602, 1.472536, -0.8026946, 0.1803922, 1, 0, 1,
-0.5263696, -0.3226004, -1.961805, 0.1764706, 1, 0, 1,
-0.518953, 1.075322, 0.3030505, 0.1686275, 1, 0, 1,
-0.5167117, -0.2872802, -2.221092, 0.1647059, 1, 0, 1,
-0.5098191, -0.4629553, -2.378638, 0.1568628, 1, 0, 1,
-0.5097607, -0.3937409, -3.710119, 0.1529412, 1, 0, 1,
-0.5095569, -1.053528, -2.242326, 0.145098, 1, 0, 1,
-0.5041193, -1.015137, -1.131976, 0.1411765, 1, 0, 1,
-0.5014478, -0.4024972, -1.884645, 0.1333333, 1, 0, 1,
-0.5013436, 1.249066, 0.6813652, 0.1294118, 1, 0, 1,
-0.5007992, -1.09011, -2.443318, 0.1215686, 1, 0, 1,
-0.5003843, -1.663986, -2.706422, 0.1176471, 1, 0, 1,
-0.4985851, 0.3086136, -1.977125, 0.1098039, 1, 0, 1,
-0.4968928, 0.5593312, -0.2871431, 0.1058824, 1, 0, 1,
-0.4923083, -2.941199, -2.639534, 0.09803922, 1, 0, 1,
-0.4883555, 0.8703395, 0.5179372, 0.09019608, 1, 0, 1,
-0.4840198, 0.05607088, -0.7004636, 0.08627451, 1, 0, 1,
-0.4837647, -0.2124358, -0.4634197, 0.07843138, 1, 0, 1,
-0.4809795, -1.272904, -2.793187, 0.07450981, 1, 0, 1,
-0.4731908, -1.025015, -1.96526, 0.06666667, 1, 0, 1,
-0.4603835, -1.101142, -0.3516778, 0.0627451, 1, 0, 1,
-0.4578657, 0.4833897, -0.5433821, 0.05490196, 1, 0, 1,
-0.4568955, -1.305738, -3.655509, 0.05098039, 1, 0, 1,
-0.4506454, 0.6079386, -1.283707, 0.04313726, 1, 0, 1,
-0.4503726, -0.1963675, -2.569066, 0.03921569, 1, 0, 1,
-0.4493295, 0.8713747, -0.5545509, 0.03137255, 1, 0, 1,
-0.4401793, 0.9479081, -0.920096, 0.02745098, 1, 0, 1,
-0.4393181, -0.3287894, -2.248245, 0.01960784, 1, 0, 1,
-0.4368603, 0.7984166, -0.06074384, 0.01568628, 1, 0, 1,
-0.4352907, -1.695531, -3.030312, 0.007843138, 1, 0, 1,
-0.4304156, 1.828609, -0.815479, 0.003921569, 1, 0, 1,
-0.4262051, 0.8239233, -1.150036, 0, 1, 0.003921569, 1,
-0.4213768, 0.3380919, -1.048444, 0, 1, 0.01176471, 1,
-0.420881, -2.009781, -2.983903, 0, 1, 0.01568628, 1,
-0.4206851, -0.3270177, -3.832831, 0, 1, 0.02352941, 1,
-0.4200847, 0.09654909, -1.306715, 0, 1, 0.02745098, 1,
-0.4167554, -2.163118, -3.755442, 0, 1, 0.03529412, 1,
-0.4163723, -0.1899916, -0.9922744, 0, 1, 0.03921569, 1,
-0.4149888, 0.3584079, -1.908159, 0, 1, 0.04705882, 1,
-0.4134997, 0.5290176, -0.4379878, 0, 1, 0.05098039, 1,
-0.4133795, 0.9942076, -0.07596745, 0, 1, 0.05882353, 1,
-0.4065697, 0.1378275, -1.693699, 0, 1, 0.0627451, 1,
-0.4060216, -0.2745983, -3.057648, 0, 1, 0.07058824, 1,
-0.4046853, -0.9649656, -4.356172, 0, 1, 0.07450981, 1,
-0.4012395, 2.485883, 1.012319, 0, 1, 0.08235294, 1,
-0.3970914, 0.4846745, -1.30389, 0, 1, 0.08627451, 1,
-0.3966407, 0.6095654, -0.6129461, 0, 1, 0.09411765, 1,
-0.395434, -1.015364, -3.48594, 0, 1, 0.1019608, 1,
-0.3930654, 1.149136, 0.7080908, 0, 1, 0.1058824, 1,
-0.3928009, 0.8179047, -1.476743, 0, 1, 0.1137255, 1,
-0.3814139, -0.8852773, -3.137478, 0, 1, 0.1176471, 1,
-0.3785045, 1.421087, -0.7340971, 0, 1, 0.1254902, 1,
-0.375825, 0.7618592, 0.1720961, 0, 1, 0.1294118, 1,
-0.3746767, -1.198382, -2.355615, 0, 1, 0.1372549, 1,
-0.3738556, -0.2580977, -2.403034, 0, 1, 0.1411765, 1,
-0.3725365, -1.264748, -2.869508, 0, 1, 0.1490196, 1,
-0.3722597, 0.7299389, -2.705693, 0, 1, 0.1529412, 1,
-0.3717723, 0.4626865, -1.784757, 0, 1, 0.1607843, 1,
-0.3688414, 0.511065, -1.035928, 0, 1, 0.1647059, 1,
-0.3633718, 1.073279, -0.1342999, 0, 1, 0.172549, 1,
-0.3571464, 1.234481, -0.4795974, 0, 1, 0.1764706, 1,
-0.3535146, -0.3451214, -1.573746, 0, 1, 0.1843137, 1,
-0.3524826, 0.1974724, -0.6627088, 0, 1, 0.1882353, 1,
-0.3506668, -0.7655234, -2.442488, 0, 1, 0.1960784, 1,
-0.3495707, 0.2460642, -1.416751, 0, 1, 0.2039216, 1,
-0.3476537, 0.6983934, -0.6544023, 0, 1, 0.2078431, 1,
-0.3463257, 0.7253494, -1.06123, 0, 1, 0.2156863, 1,
-0.3448308, -0.0316437, -1.370916, 0, 1, 0.2196078, 1,
-0.3427894, -1.016998, -2.697005, 0, 1, 0.227451, 1,
-0.3413687, -0.06155322, -1.764168, 0, 1, 0.2313726, 1,
-0.3411318, 0.1082972, -1.787396, 0, 1, 0.2392157, 1,
-0.336893, 0.5140226, -0.4616753, 0, 1, 0.2431373, 1,
-0.3337173, 1.181916, 0.2019731, 0, 1, 0.2509804, 1,
-0.333414, -1.120147, -3.077492, 0, 1, 0.254902, 1,
-0.3304087, -1.326006, -1.797145, 0, 1, 0.2627451, 1,
-0.3292717, -0.195991, -0.7447338, 0, 1, 0.2666667, 1,
-0.3267034, -0.05311781, -0.6316143, 0, 1, 0.2745098, 1,
-0.3247284, 0.654218, -1.926184, 0, 1, 0.2784314, 1,
-0.3201059, -1.190402, -3.560039, 0, 1, 0.2862745, 1,
-0.3106956, 0.4205641, -0.805591, 0, 1, 0.2901961, 1,
-0.3096415, 0.432431, -1.71565, 0, 1, 0.2980392, 1,
-0.2999882, -0.3439757, -2.401604, 0, 1, 0.3058824, 1,
-0.2994836, 0.3131998, 0.9082741, 0, 1, 0.3098039, 1,
-0.2982244, -0.8093646, -1.437167, 0, 1, 0.3176471, 1,
-0.2981069, -0.353747, -3.583431, 0, 1, 0.3215686, 1,
-0.2974627, -0.3277761, -2.468179, 0, 1, 0.3294118, 1,
-0.2971085, -1.246318, -1.537738, 0, 1, 0.3333333, 1,
-0.296581, 1.314676, -2.170957, 0, 1, 0.3411765, 1,
-0.2951154, -0.1229918, -2.471503, 0, 1, 0.345098, 1,
-0.2944448, -0.2173057, -2.119131, 0, 1, 0.3529412, 1,
-0.2943303, 0.26696, -2.477856, 0, 1, 0.3568628, 1,
-0.2878096, -1.710254, -0.9493193, 0, 1, 0.3647059, 1,
-0.2859926, -0.01448324, -1.562122, 0, 1, 0.3686275, 1,
-0.2837119, 1.188302, -0.05375991, 0, 1, 0.3764706, 1,
-0.2820573, -0.7179181, -2.286281, 0, 1, 0.3803922, 1,
-0.2820214, 1.846667, -0.1943885, 0, 1, 0.3882353, 1,
-0.2786551, -0.2037434, -0.8362065, 0, 1, 0.3921569, 1,
-0.2785889, -0.9936635, -1.872779, 0, 1, 0.4, 1,
-0.2751316, 0.2547278, -0.3896837, 0, 1, 0.4078431, 1,
-0.270531, -1.286674, -5.793344, 0, 1, 0.4117647, 1,
-0.2695856, -0.2189849, -2.920817, 0, 1, 0.4196078, 1,
-0.2694263, -0.02147473, -2.240684, 0, 1, 0.4235294, 1,
-0.257771, 0.2698215, -0.9124052, 0, 1, 0.4313726, 1,
-0.2530141, 1.36952, -1.96168, 0, 1, 0.4352941, 1,
-0.2471245, -1.377257, -3.782994, 0, 1, 0.4431373, 1,
-0.2468372, 2.581043, -0.2805813, 0, 1, 0.4470588, 1,
-0.2447394, -0.07250395, -2.551243, 0, 1, 0.454902, 1,
-0.2437939, 1.135439, -2.148932, 0, 1, 0.4588235, 1,
-0.2428294, -1.028641, -2.085258, 0, 1, 0.4666667, 1,
-0.2325867, 0.1172412, -0.106594, 0, 1, 0.4705882, 1,
-0.2325061, -1.272582, -3.10813, 0, 1, 0.4784314, 1,
-0.2322166, 0.2913057, -0.238524, 0, 1, 0.4823529, 1,
-0.2301246, -0.6313668, -3.755221, 0, 1, 0.4901961, 1,
-0.2271221, 0.2852342, -0.7075025, 0, 1, 0.4941176, 1,
-0.2263105, 0.3800129, 0.5065575, 0, 1, 0.5019608, 1,
-0.2237533, -2.650261, -4.12338, 0, 1, 0.509804, 1,
-0.2236747, 0.07569641, -3.050327, 0, 1, 0.5137255, 1,
-0.2236397, 1.257488, 0.3668362, 0, 1, 0.5215687, 1,
-0.2203022, 0.7204595, -0.2017662, 0, 1, 0.5254902, 1,
-0.2185218, -1.122659, -3.766222, 0, 1, 0.5333334, 1,
-0.2097192, -0.2279945, -1.981633, 0, 1, 0.5372549, 1,
-0.2094631, -0.8749567, -3.532828, 0, 1, 0.5450981, 1,
-0.2076213, 1.199497, 0.307438, 0, 1, 0.5490196, 1,
-0.201169, -0.6456061, -3.34587, 0, 1, 0.5568628, 1,
-0.2004271, -0.6775379, -2.328623, 0, 1, 0.5607843, 1,
-0.2002778, -1.707422, -3.228626, 0, 1, 0.5686275, 1,
-0.196108, -0.6982732, -3.006298, 0, 1, 0.572549, 1,
-0.1950799, 0.8241691, 1.360294, 0, 1, 0.5803922, 1,
-0.1914196, -0.9923305, -3.56783, 0, 1, 0.5843138, 1,
-0.1909949, -0.1203505, -1.945499, 0, 1, 0.5921569, 1,
-0.1904508, 0.2446739, -1.855091, 0, 1, 0.5960785, 1,
-0.1875379, -0.7317973, -1.696451, 0, 1, 0.6039216, 1,
-0.1830761, 0.2226366, -1.841593, 0, 1, 0.6117647, 1,
-0.1794822, -0.3101086, -2.851238, 0, 1, 0.6156863, 1,
-0.1749707, -0.2705201, -3.350595, 0, 1, 0.6235294, 1,
-0.1748194, -0.3799417, -3.542822, 0, 1, 0.627451, 1,
-0.171347, 0.5334865, -0.019315, 0, 1, 0.6352941, 1,
-0.1704284, 0.9027093, -3.742424, 0, 1, 0.6392157, 1,
-0.1704077, 0.7182488, 0.6069439, 0, 1, 0.6470588, 1,
-0.168149, -0.04507264, -1.27838, 0, 1, 0.6509804, 1,
-0.166701, 0.9338979, -0.09544235, 0, 1, 0.6588235, 1,
-0.1660599, -0.4777664, -1.382751, 0, 1, 0.6627451, 1,
-0.1646703, 0.5176756, 1.101194, 0, 1, 0.6705883, 1,
-0.1645821, 0.09003155, -1.010607, 0, 1, 0.6745098, 1,
-0.1642485, -0.08342189, -2.113527, 0, 1, 0.682353, 1,
-0.1611607, 1.082407, -1.759115, 0, 1, 0.6862745, 1,
-0.154162, 0.003508682, -0.7260994, 0, 1, 0.6941177, 1,
-0.1531479, -0.3030489, -2.431754, 0, 1, 0.7019608, 1,
-0.1523485, -1.160913, -1.025241, 0, 1, 0.7058824, 1,
-0.1519017, -0.5280929, -2.488778, 0, 1, 0.7137255, 1,
-0.142196, 1.964316, 0.6737627, 0, 1, 0.7176471, 1,
-0.1361617, 0.5791814, -1.64229, 0, 1, 0.7254902, 1,
-0.135733, 1.599713, 0.348411, 0, 1, 0.7294118, 1,
-0.1350451, -0.1911483, -3.161393, 0, 1, 0.7372549, 1,
-0.1319654, 0.2326437, -0.1469459, 0, 1, 0.7411765, 1,
-0.1301371, 1.42326, -1.152363, 0, 1, 0.7490196, 1,
-0.1280682, 0.1022151, -0.612423, 0, 1, 0.7529412, 1,
-0.1252029, -0.07589805, -2.260237, 0, 1, 0.7607843, 1,
-0.1219056, 1.323216, -1.577569, 0, 1, 0.7647059, 1,
-0.1169513, -0.1160137, -0.8582151, 0, 1, 0.772549, 1,
-0.116245, -1.364841, -1.502801, 0, 1, 0.7764706, 1,
-0.1093697, -1.543193, -3.800186, 0, 1, 0.7843137, 1,
-0.1080183, -0.2483833, -1.83051, 0, 1, 0.7882353, 1,
-0.1005504, 0.3998307, 0.8474239, 0, 1, 0.7960784, 1,
-0.1003035, -0.2004614, -3.466285, 0, 1, 0.8039216, 1,
-0.09943312, -0.5659139, -2.340372, 0, 1, 0.8078431, 1,
-0.09943168, 0.03327879, -1.460809, 0, 1, 0.8156863, 1,
-0.09728793, 0.8455792, 1.311006, 0, 1, 0.8196079, 1,
-0.09720258, -0.710044, -2.730791, 0, 1, 0.827451, 1,
-0.09543155, -0.3400488, -4.068272, 0, 1, 0.8313726, 1,
-0.09372187, -0.4695935, -2.85098, 0, 1, 0.8392157, 1,
-0.08869208, -1.358847, -2.8642, 0, 1, 0.8431373, 1,
-0.08660801, -0.8283365, -3.051791, 0, 1, 0.8509804, 1,
-0.08577631, 0.2545932, -0.0687609, 0, 1, 0.854902, 1,
-0.08129502, -2.458563, -4.735839, 0, 1, 0.8627451, 1,
-0.08122122, -0.1263069, -3.50182, 0, 1, 0.8666667, 1,
-0.08001066, -0.7781503, -3.668334, 0, 1, 0.8745098, 1,
-0.07464199, 1.507763, 1.034527, 0, 1, 0.8784314, 1,
-0.0682703, -0.2698527, -2.746213, 0, 1, 0.8862745, 1,
-0.06554264, -0.9607517, -3.133928, 0, 1, 0.8901961, 1,
-0.06553638, -1.332618, -2.037819, 0, 1, 0.8980392, 1,
-0.06354595, -0.8060099, -3.701978, 0, 1, 0.9058824, 1,
-0.06272732, 0.3624706, -0.3384854, 0, 1, 0.9098039, 1,
-0.06213032, 0.1947255, -0.4223551, 0, 1, 0.9176471, 1,
-0.05965242, -0.09774766, -1.752268, 0, 1, 0.9215686, 1,
-0.05613099, -0.6778261, -3.452503, 0, 1, 0.9294118, 1,
-0.05578008, -0.1383472, -3.009464, 0, 1, 0.9333333, 1,
-0.05446637, 1.379031, -0.9896479, 0, 1, 0.9411765, 1,
-0.0534257, -0.106822, -3.229968, 0, 1, 0.945098, 1,
-0.04692436, -1.058222, -3.045559, 0, 1, 0.9529412, 1,
-0.04575574, 1.444517, -0.808293, 0, 1, 0.9568627, 1,
-0.04143659, 0.3385883, 0.5764748, 0, 1, 0.9647059, 1,
-0.03788015, -0.4725361, -5.08206, 0, 1, 0.9686275, 1,
-0.0362991, 0.2220711, 0.2074619, 0, 1, 0.9764706, 1,
-0.03624137, -0.8968992, -4.865037, 0, 1, 0.9803922, 1,
-0.03538052, 0.4348662, 0.3962075, 0, 1, 0.9882353, 1,
-0.03505452, -0.8326542, -3.178274, 0, 1, 0.9921569, 1,
-0.03321097, 0.3749597, -0.1756888, 0, 1, 1, 1,
-0.03276777, 0.1755111, -0.6261891, 0, 0.9921569, 1, 1,
-0.03194769, -0.7717424, -1.204396, 0, 0.9882353, 1, 1,
-0.02911342, -0.6863809, -2.191207, 0, 0.9803922, 1, 1,
-0.02883226, 0.3260614, 1.479804, 0, 0.9764706, 1, 1,
-0.02855862, -1.051924, -3.383616, 0, 0.9686275, 1, 1,
-0.02157984, -0.3963804, -3.520643, 0, 0.9647059, 1, 1,
-0.02130976, 0.887242, -0.8760341, 0, 0.9568627, 1, 1,
-0.0212857, 1.071168, -1.766199, 0, 0.9529412, 1, 1,
-0.02027274, 2.144025, -0.1894896, 0, 0.945098, 1, 1,
-0.01880262, 0.06832943, 2.399234, 0, 0.9411765, 1, 1,
-0.01742688, -0.2454408, -3.780648, 0, 0.9333333, 1, 1,
-0.01131029, -0.5641037, -1.774378, 0, 0.9294118, 1, 1,
-0.0004119799, -0.03779282, -2.768203, 0, 0.9215686, 1, 1,
0.004064494, -0.580736, 2.747917, 0, 0.9176471, 1, 1,
0.00488914, 1.43467, 1.322931, 0, 0.9098039, 1, 1,
0.009179913, -0.2810757, 3.970807, 0, 0.9058824, 1, 1,
0.01383065, -1.303273, 2.976388, 0, 0.8980392, 1, 1,
0.02611522, 0.9033535, 1.516071, 0, 0.8901961, 1, 1,
0.02771687, 0.2936239, 0.999186, 0, 0.8862745, 1, 1,
0.02844629, 0.1026173, -0.4578906, 0, 0.8784314, 1, 1,
0.02871101, 0.6979028, 0.08789253, 0, 0.8745098, 1, 1,
0.03030607, 2.053616, -0.6707097, 0, 0.8666667, 1, 1,
0.03085124, -0.7404835, 3.712207, 0, 0.8627451, 1, 1,
0.03170048, -0.5089552, 1.722588, 0, 0.854902, 1, 1,
0.03331818, -1.643567, 3.70011, 0, 0.8509804, 1, 1,
0.03427692, -0.3014609, 4.817922, 0, 0.8431373, 1, 1,
0.03446789, 0.2522868, 1.038846, 0, 0.8392157, 1, 1,
0.03569368, -0.6820307, 3.675094, 0, 0.8313726, 1, 1,
0.04007103, 0.6215724, -0.473147, 0, 0.827451, 1, 1,
0.05109368, 0.2023342, -0.201116, 0, 0.8196079, 1, 1,
0.05563159, 0.8977664, -1.467407, 0, 0.8156863, 1, 1,
0.05763074, 0.2282066, 1.40536, 0, 0.8078431, 1, 1,
0.0625184, -0.8665516, 5.129071, 0, 0.8039216, 1, 1,
0.06419814, -0.7315965, 2.796348, 0, 0.7960784, 1, 1,
0.06942296, 1.90384, 0.6021909, 0, 0.7882353, 1, 1,
0.07037097, 0.2612368, -2.841912, 0, 0.7843137, 1, 1,
0.07080471, -0.1877309, 3.372529, 0, 0.7764706, 1, 1,
0.07673158, -2.254525, 2.022113, 0, 0.772549, 1, 1,
0.07769993, 0.04440606, 0.4131859, 0, 0.7647059, 1, 1,
0.07852344, -0.4176725, 3.41625, 0, 0.7607843, 1, 1,
0.07897836, -0.06849223, 3.292872, 0, 0.7529412, 1, 1,
0.08418757, 1.756442, -0.1852709, 0, 0.7490196, 1, 1,
0.08424841, 0.8539963, 0.2484101, 0, 0.7411765, 1, 1,
0.08512072, -1.023502, 3.63572, 0, 0.7372549, 1, 1,
0.08571969, 0.3627649, 0.3689488, 0, 0.7294118, 1, 1,
0.08673991, -0.003276513, 2.763291, 0, 0.7254902, 1, 1,
0.09422857, -0.3022931, 2.234533, 0, 0.7176471, 1, 1,
0.1032601, -0.05224802, 0.9465417, 0, 0.7137255, 1, 1,
0.1052375, -1.055378, 2.165899, 0, 0.7058824, 1, 1,
0.1115994, 1.211494, -0.004953265, 0, 0.6980392, 1, 1,
0.1123697, 0.6813923, -0.8185496, 0, 0.6941177, 1, 1,
0.1135664, -1.698153, 4.022988, 0, 0.6862745, 1, 1,
0.114116, 0.6577911, -0.1803911, 0, 0.682353, 1, 1,
0.1158255, 0.576854, 0.3617248, 0, 0.6745098, 1, 1,
0.1187503, 0.5276316, -0.9377159, 0, 0.6705883, 1, 1,
0.1211536, -0.9265823, 3.956653, 0, 0.6627451, 1, 1,
0.1211808, -0.472439, 2.248983, 0, 0.6588235, 1, 1,
0.1241362, -0.2735714, 3.265827, 0, 0.6509804, 1, 1,
0.1254559, -1.984113, 1.936095, 0, 0.6470588, 1, 1,
0.1255652, -1.045132, 2.855603, 0, 0.6392157, 1, 1,
0.1256607, -0.7283197, 2.889918, 0, 0.6352941, 1, 1,
0.1275058, -0.5061484, 2.309704, 0, 0.627451, 1, 1,
0.1298337, 1.472436, 1.811309, 0, 0.6235294, 1, 1,
0.1323705, -0.7724532, 2.806587, 0, 0.6156863, 1, 1,
0.134225, 1.352605, -0.03975806, 0, 0.6117647, 1, 1,
0.1346879, 0.2718149, -0.9741023, 0, 0.6039216, 1, 1,
0.1363363, 1.757611, -1.275878, 0, 0.5960785, 1, 1,
0.1365067, 1.0023, -1.033077, 0, 0.5921569, 1, 1,
0.1368227, -2.290429, 3.202058, 0, 0.5843138, 1, 1,
0.1371565, 0.9774476, 0.4056322, 0, 0.5803922, 1, 1,
0.1408076, 0.2787125, 1.038235, 0, 0.572549, 1, 1,
0.1440966, 0.2728604, -0.5926955, 0, 0.5686275, 1, 1,
0.1448897, -0.3495982, 1.973082, 0, 0.5607843, 1, 1,
0.1476113, -0.4653113, 3.061822, 0, 0.5568628, 1, 1,
0.1479494, 0.5911058, -0.0009471435, 0, 0.5490196, 1, 1,
0.1493096, 0.370456, 0.8524826, 0, 0.5450981, 1, 1,
0.1495231, 1.504446, -0.7005375, 0, 0.5372549, 1, 1,
0.1507984, 1.197598, 1.1391, 0, 0.5333334, 1, 1,
0.151929, -1.25001, 1.582089, 0, 0.5254902, 1, 1,
0.15597, 0.6420789, 0.1342203, 0, 0.5215687, 1, 1,
0.1585991, 1.211676, 0.5561925, 0, 0.5137255, 1, 1,
0.1588259, -0.3819084, 4.766415, 0, 0.509804, 1, 1,
0.1648787, 0.3880644, 0.4590139, 0, 0.5019608, 1, 1,
0.1678026, -0.6452703, 2.910358, 0, 0.4941176, 1, 1,
0.1680624, -0.01370632, 2.666608, 0, 0.4901961, 1, 1,
0.1717892, -1.228673, 4.77183, 0, 0.4823529, 1, 1,
0.174372, 0.6749563, 0.3936961, 0, 0.4784314, 1, 1,
0.1779344, -2.382662, 4.000522, 0, 0.4705882, 1, 1,
0.1780288, 0.5362259, -0.3656284, 0, 0.4666667, 1, 1,
0.1786112, -0.7151759, 4.091619, 0, 0.4588235, 1, 1,
0.1818736, -1.032493, 2.094424, 0, 0.454902, 1, 1,
0.1833774, 0.2206438, 0.4029059, 0, 0.4470588, 1, 1,
0.1834394, -0.01445126, 2.196917, 0, 0.4431373, 1, 1,
0.1836315, -1.715152, 2.537085, 0, 0.4352941, 1, 1,
0.1839347, -0.2076816, 3.048375, 0, 0.4313726, 1, 1,
0.185519, 0.02471456, 0.155677, 0, 0.4235294, 1, 1,
0.1878734, -0.3827283, 1.722392, 0, 0.4196078, 1, 1,
0.1880327, -0.6146145, 3.923848, 0, 0.4117647, 1, 1,
0.1905457, 0.2104186, 0.4630314, 0, 0.4078431, 1, 1,
0.1908057, 0.7704005, 0.7178432, 0, 0.4, 1, 1,
0.1929787, 0.5355222, -1.44993, 0, 0.3921569, 1, 1,
0.1984646, 0.7323806, 0.6340834, 0, 0.3882353, 1, 1,
0.2035432, 2.22062, 2.482298e-05, 0, 0.3803922, 1, 1,
0.2041892, -1.057195, 2.871904, 0, 0.3764706, 1, 1,
0.2061557, 1.064449, -1.028701, 0, 0.3686275, 1, 1,
0.2087375, 1.272258, -0.4892458, 0, 0.3647059, 1, 1,
0.2187985, 0.15628, 2.694817, 0, 0.3568628, 1, 1,
0.2213538, 0.04083942, 3.293859, 0, 0.3529412, 1, 1,
0.224142, 1.422923, -0.9121048, 0, 0.345098, 1, 1,
0.2254857, 0.5764053, -0.4632347, 0, 0.3411765, 1, 1,
0.2258763, 0.899994, -0.02605208, 0, 0.3333333, 1, 1,
0.2264649, 0.08290979, 3.250845, 0, 0.3294118, 1, 1,
0.2306686, -0.08160223, 4.004959, 0, 0.3215686, 1, 1,
0.2330342, 0.4348601, 0.4065984, 0, 0.3176471, 1, 1,
0.2354097, 0.08480573, 0.466173, 0, 0.3098039, 1, 1,
0.2452631, -0.01520468, 1.286741, 0, 0.3058824, 1, 1,
0.2484072, 0.9467432, 2.541644, 0, 0.2980392, 1, 1,
0.2484273, 0.1042451, -0.3695346, 0, 0.2901961, 1, 1,
0.2532046, -1.986631, 4.469921, 0, 0.2862745, 1, 1,
0.2587188, 2.089106, -0.943368, 0, 0.2784314, 1, 1,
0.2591276, -0.01352498, 1.628075, 0, 0.2745098, 1, 1,
0.2663226, -1.454288, 2.95274, 0, 0.2666667, 1, 1,
0.2687374, -2.967931, 1.990526, 0, 0.2627451, 1, 1,
0.270493, -0.7833615, 3.16189, 0, 0.254902, 1, 1,
0.2719572, 0.3631184, -1.307264, 0, 0.2509804, 1, 1,
0.2726133, 1.524297, 1.192762, 0, 0.2431373, 1, 1,
0.2737905, -2.101929, 3.808856, 0, 0.2392157, 1, 1,
0.2749746, -1.180759, 2.287579, 0, 0.2313726, 1, 1,
0.2877256, -0.1472775, 0.3208743, 0, 0.227451, 1, 1,
0.2910514, 0.1769168, 1.454395, 0, 0.2196078, 1, 1,
0.2977514, 0.1664315, 0.5989181, 0, 0.2156863, 1, 1,
0.3020245, -1.250136, 1.751572, 0, 0.2078431, 1, 1,
0.302278, -1.838716, 4.373054, 0, 0.2039216, 1, 1,
0.3036776, 0.8602841, -0.4213047, 0, 0.1960784, 1, 1,
0.3047198, -1.38112, 4.129724, 0, 0.1882353, 1, 1,
0.306338, 0.3443259, 0.658184, 0, 0.1843137, 1, 1,
0.3065152, 1.469903, -0.4077698, 0, 0.1764706, 1, 1,
0.3088515, -1.482708, 0.8938404, 0, 0.172549, 1, 1,
0.3091674, 0.8295925, -1.360084, 0, 0.1647059, 1, 1,
0.3120578, 1.034858, 1.26921, 0, 0.1607843, 1, 1,
0.3159904, -0.5402108, 2.924329, 0, 0.1529412, 1, 1,
0.319737, -0.08495161, 2.244344, 0, 0.1490196, 1, 1,
0.3244802, -0.1698424, 1.628392, 0, 0.1411765, 1, 1,
0.3277211, 1.160969, -0.6908845, 0, 0.1372549, 1, 1,
0.3277653, -1.540534, 4.515953, 0, 0.1294118, 1, 1,
0.3279916, -0.5636848, 3.884738, 0, 0.1254902, 1, 1,
0.3290114, 1.238574, 0.9599459, 0, 0.1176471, 1, 1,
0.3292522, -0.4963633, 2.64988, 0, 0.1137255, 1, 1,
0.3307761, -1.240765, 2.838771, 0, 0.1058824, 1, 1,
0.3313302, 0.2871622, 1.126319, 0, 0.09803922, 1, 1,
0.3358058, 1.251009, -0.8750591, 0, 0.09411765, 1, 1,
0.3394902, -1.051956, 3.806913, 0, 0.08627451, 1, 1,
0.34141, 0.7380804, 1.291612, 0, 0.08235294, 1, 1,
0.3447157, -0.3360105, 1.536241, 0, 0.07450981, 1, 1,
0.3475652, 1.735666, -0.8093143, 0, 0.07058824, 1, 1,
0.3487722, 0.56914, 1.567832, 0, 0.0627451, 1, 1,
0.3513646, 1.41971, 0.9611145, 0, 0.05882353, 1, 1,
0.3539074, -0.7991267, 2.29129, 0, 0.05098039, 1, 1,
0.3541042, -0.3929314, 0.9050354, 0, 0.04705882, 1, 1,
0.3552602, -0.5059689, 2.616277, 0, 0.03921569, 1, 1,
0.3562172, 0.1517505, 1.446544, 0, 0.03529412, 1, 1,
0.35715, 0.9945809, 0.09300202, 0, 0.02745098, 1, 1,
0.3571664, 0.2835467, 0.1292087, 0, 0.02352941, 1, 1,
0.3655816, -0.3226183, 1.906408, 0, 0.01568628, 1, 1,
0.3656991, -0.3567477, 2.248285, 0, 0.01176471, 1, 1,
0.3683689, 0.4365036, 0.4648664, 0, 0.003921569, 1, 1,
0.3700865, -0.899881, 3.618913, 0.003921569, 0, 1, 1,
0.3703635, -0.1125237, 0.6511939, 0.007843138, 0, 1, 1,
0.3730126, 0.1379971, 0.9163559, 0.01568628, 0, 1, 1,
0.3742569, 0.5935175, -0.2406874, 0.01960784, 0, 1, 1,
0.3757479, -1.697315, 4.501054, 0.02745098, 0, 1, 1,
0.3770908, -1.055439, 3.001228, 0.03137255, 0, 1, 1,
0.3826409, 0.427231, 0.9932661, 0.03921569, 0, 1, 1,
0.392965, 0.5966513, -0.3338441, 0.04313726, 0, 1, 1,
0.3949802, -1.505564, 1.898897, 0.05098039, 0, 1, 1,
0.4026909, 1.343975, -0.1976446, 0.05490196, 0, 1, 1,
0.4083715, -0.423506, 1.749225, 0.0627451, 0, 1, 1,
0.4092872, -1.48809, 3.476394, 0.06666667, 0, 1, 1,
0.409965, -1.269411, 2.459029, 0.07450981, 0, 1, 1,
0.4100237, 0.2734564, 1.847889, 0.07843138, 0, 1, 1,
0.4161459, -0.5634816, 1.664186, 0.08627451, 0, 1, 1,
0.4210796, 0.07359223, 1.289133, 0.09019608, 0, 1, 1,
0.4211443, 2.600263, 0.2902015, 0.09803922, 0, 1, 1,
0.4211701, -0.2645562, 1.287114, 0.1058824, 0, 1, 1,
0.4214506, 0.4436183, 1.066977, 0.1098039, 0, 1, 1,
0.422884, 2.106693, -0.1467135, 0.1176471, 0, 1, 1,
0.4242537, 1.112285, 1.953333, 0.1215686, 0, 1, 1,
0.4261847, 0.6066885, -0.1014784, 0.1294118, 0, 1, 1,
0.4262745, 0.01093074, 3.03446, 0.1333333, 0, 1, 1,
0.4265513, -0.4259554, 1.357514, 0.1411765, 0, 1, 1,
0.4288834, 1.312129, 1.765677, 0.145098, 0, 1, 1,
0.4291418, -0.6725715, 2.241861, 0.1529412, 0, 1, 1,
0.4357062, 0.9949775, -1.420312, 0.1568628, 0, 1, 1,
0.4395194, 0.1440358, 0.6016963, 0.1647059, 0, 1, 1,
0.4478345, -2.503335, 1.842161, 0.1686275, 0, 1, 1,
0.449829, 0.9671605, -1.185078, 0.1764706, 0, 1, 1,
0.4591274, 0.6364722, 0.7362359, 0.1803922, 0, 1, 1,
0.460551, -0.3413399, 2.788865, 0.1882353, 0, 1, 1,
0.4606614, 1.096045, 1.230363, 0.1921569, 0, 1, 1,
0.4642431, -0.5021433, 3.23697, 0.2, 0, 1, 1,
0.4695077, -1.483407, 3.810252, 0.2078431, 0, 1, 1,
0.4778941, 0.04513621, -0.5760302, 0.2117647, 0, 1, 1,
0.4787067, 0.3907197, 2.820095, 0.2196078, 0, 1, 1,
0.4794053, -0.1026686, 1.08822, 0.2235294, 0, 1, 1,
0.4794657, -0.1236777, 0.2310112, 0.2313726, 0, 1, 1,
0.4822573, 0.839989, -0.9826262, 0.2352941, 0, 1, 1,
0.4846643, -2.051532, 2.040892, 0.2431373, 0, 1, 1,
0.488022, 0.4073901, 1.447592, 0.2470588, 0, 1, 1,
0.4922732, -0.4057459, 2.464248, 0.254902, 0, 1, 1,
0.4942427, 2.292546, 0.8238086, 0.2588235, 0, 1, 1,
0.5018635, -0.05531945, 0.590387, 0.2666667, 0, 1, 1,
0.5040823, 0.5193273, 0.6824544, 0.2705882, 0, 1, 1,
0.5141982, 0.2856942, 0.6471168, 0.2784314, 0, 1, 1,
0.5176787, 1.517298, 1.061876, 0.282353, 0, 1, 1,
0.5192729, 0.6610385, 0.995297, 0.2901961, 0, 1, 1,
0.5214367, -0.2173273, 2.636651, 0.2941177, 0, 1, 1,
0.5257332, -1.040161, 1.335772, 0.3019608, 0, 1, 1,
0.5284343, -0.7628627, 1.868921, 0.3098039, 0, 1, 1,
0.535037, 2.407462, -0.4416035, 0.3137255, 0, 1, 1,
0.5351995, -1.359809, 2.23068, 0.3215686, 0, 1, 1,
0.5356067, -2.086648, 2.826241, 0.3254902, 0, 1, 1,
0.5373533, -0.3157139, 1.838154, 0.3333333, 0, 1, 1,
0.5496958, 1.763131, -0.1185009, 0.3372549, 0, 1, 1,
0.5522777, -1.131413, 3.102852, 0.345098, 0, 1, 1,
0.5567715, -0.6290725, 2.200963, 0.3490196, 0, 1, 1,
0.5605664, 0.7009486, 0.7222037, 0.3568628, 0, 1, 1,
0.5695218, 1.149276, 1.668635, 0.3607843, 0, 1, 1,
0.5704268, -0.2103251, 2.2032, 0.3686275, 0, 1, 1,
0.570934, 1.245802, -0.5078037, 0.372549, 0, 1, 1,
0.5776821, -0.05175428, 1.643918, 0.3803922, 0, 1, 1,
0.581303, 1.332049, -0.205729, 0.3843137, 0, 1, 1,
0.5869283, 0.1856525, 2.664712, 0.3921569, 0, 1, 1,
0.5934098, -0.5503498, 2.883529, 0.3960784, 0, 1, 1,
0.5935565, -0.1042159, 3.07138, 0.4039216, 0, 1, 1,
0.595678, -0.04706713, 0.6037911, 0.4117647, 0, 1, 1,
0.5958518, -1.006495, 1.758995, 0.4156863, 0, 1, 1,
0.5986007, -0.438189, 2.572697, 0.4235294, 0, 1, 1,
0.6002461, 1.1516, 0.4522546, 0.427451, 0, 1, 1,
0.6005694, 0.1059553, 2.538317, 0.4352941, 0, 1, 1,
0.6036068, -0.8853642, 4.738256, 0.4392157, 0, 1, 1,
0.6058946, -0.2841218, 1.682997, 0.4470588, 0, 1, 1,
0.6066316, 0.14771, 1.395908, 0.4509804, 0, 1, 1,
0.6069983, -1.117946, 2.800313, 0.4588235, 0, 1, 1,
0.6080418, -0.3595969, 1.956195, 0.4627451, 0, 1, 1,
0.6197134, 0.6915604, 1.43116, 0.4705882, 0, 1, 1,
0.6230248, -1.733108, 3.662815, 0.4745098, 0, 1, 1,
0.6235918, 1.080366, -0.2794044, 0.4823529, 0, 1, 1,
0.6238832, 0.8909281, -0.8645266, 0.4862745, 0, 1, 1,
0.6257489, 0.3835073, -1.262222, 0.4941176, 0, 1, 1,
0.6272053, -1.013337, 2.34735, 0.5019608, 0, 1, 1,
0.6295359, -1.195565, 1.953403, 0.5058824, 0, 1, 1,
0.6337451, 2.213828, -0.344232, 0.5137255, 0, 1, 1,
0.6348922, 0.437098, 0.1474962, 0.5176471, 0, 1, 1,
0.635736, 0.3602695, 1.19404, 0.5254902, 0, 1, 1,
0.6429664, -0.7260772, 1.343743, 0.5294118, 0, 1, 1,
0.6469511, -0.1823528, 1.702611, 0.5372549, 0, 1, 1,
0.6480759, -0.6236307, 2.936761, 0.5411765, 0, 1, 1,
0.6492971, -0.1723469, 0.7882307, 0.5490196, 0, 1, 1,
0.6495334, 0.5396121, 0.9084647, 0.5529412, 0, 1, 1,
0.651608, 0.4068965, 1.870428, 0.5607843, 0, 1, 1,
0.6529441, -0.3766647, 1.529772, 0.5647059, 0, 1, 1,
0.653898, -0.03156992, 1.875185, 0.572549, 0, 1, 1,
0.6602969, -1.689628, 2.734783, 0.5764706, 0, 1, 1,
0.6672825, 0.3184368, 1.048202, 0.5843138, 0, 1, 1,
0.672268, 0.4976284, 1.917155, 0.5882353, 0, 1, 1,
0.6745415, 0.2351772, 0.8720351, 0.5960785, 0, 1, 1,
0.6772699, -1.266624, 4.059547, 0.6039216, 0, 1, 1,
0.6848569, -0.8280042, 0.6067155, 0.6078432, 0, 1, 1,
0.6873524, -0.3605897, 0.9975068, 0.6156863, 0, 1, 1,
0.6884741, -1.365236, 1.27464, 0.6196079, 0, 1, 1,
0.6947409, -1.047084, 4.395614, 0.627451, 0, 1, 1,
0.705909, -0.2873565, 1.476066, 0.6313726, 0, 1, 1,
0.7071462, -0.9696279, 2.538278, 0.6392157, 0, 1, 1,
0.7130503, 1.285552, -0.2530548, 0.6431373, 0, 1, 1,
0.7164789, -0.4973126, 2.716621, 0.6509804, 0, 1, 1,
0.7323958, -1.114439, 2.753518, 0.654902, 0, 1, 1,
0.7326838, -0.9671675, 2.248648, 0.6627451, 0, 1, 1,
0.7406918, 1.293566, 0.140405, 0.6666667, 0, 1, 1,
0.7419363, 1.406559, 0.9193221, 0.6745098, 0, 1, 1,
0.7431104, 0.1843722, 0.7361905, 0.6784314, 0, 1, 1,
0.7441848, -1.185002, 1.338582, 0.6862745, 0, 1, 1,
0.7465432, 0.6567575, -0.1636968, 0.6901961, 0, 1, 1,
0.7522026, 0.1785078, 0.5127735, 0.6980392, 0, 1, 1,
0.7540743, -0.9648539, 1.593259, 0.7058824, 0, 1, 1,
0.76809, -0.2134033, 2.257129, 0.7098039, 0, 1, 1,
0.7687705, 0.9294479, -0.2526079, 0.7176471, 0, 1, 1,
0.7746064, -0.147448, 1.376411, 0.7215686, 0, 1, 1,
0.7748031, -0.0309852, 1.614076, 0.7294118, 0, 1, 1,
0.7804635, 0.9107257, 1.749826, 0.7333333, 0, 1, 1,
0.780686, 0.92166, 1.616351, 0.7411765, 0, 1, 1,
0.7827894, 0.333259, 0.7925053, 0.7450981, 0, 1, 1,
0.784559, 1.835304, 0.06857239, 0.7529412, 0, 1, 1,
0.7852618, -0.8705923, 0.5720474, 0.7568628, 0, 1, 1,
0.7995261, 0.3625979, 1.199647, 0.7647059, 0, 1, 1,
0.7995265, -1.040175, 3.013953, 0.7686275, 0, 1, 1,
0.8037931, 0.1740422, 0.9818569, 0.7764706, 0, 1, 1,
0.8092667, 0.8046976, 0.3491383, 0.7803922, 0, 1, 1,
0.8269747, -0.5147501, 2.508912, 0.7882353, 0, 1, 1,
0.8291482, -0.6939251, 2.850719, 0.7921569, 0, 1, 1,
0.8464936, -0.599156, 2.416028, 0.8, 0, 1, 1,
0.8467391, 0.3258151, 1.629749, 0.8078431, 0, 1, 1,
0.8499737, -1.078198, 1.238251, 0.8117647, 0, 1, 1,
0.8519372, -0.6891538, 3.627313, 0.8196079, 0, 1, 1,
0.8528311, -0.2634518, 0.08883506, 0.8235294, 0, 1, 1,
0.8531088, -2.363019, 2.291631, 0.8313726, 0, 1, 1,
0.8552161, -1.803317, 4.400249, 0.8352941, 0, 1, 1,
0.8556978, -0.7508371, 1.692515, 0.8431373, 0, 1, 1,
0.8577773, -1.319889, 1.971622, 0.8470588, 0, 1, 1,
0.8660641, 1.95773, 0.8187964, 0.854902, 0, 1, 1,
0.8713148, -1.590446, 1.753132, 0.8588235, 0, 1, 1,
0.8748128, -1.227345, 1.336874, 0.8666667, 0, 1, 1,
0.8794447, -0.9068225, 2.330885, 0.8705882, 0, 1, 1,
0.8896375, -0.4621248, 2.655268, 0.8784314, 0, 1, 1,
0.8900503, 0.9608667, 1.385153, 0.8823529, 0, 1, 1,
0.8984477, 0.4641521, 1.233748, 0.8901961, 0, 1, 1,
0.9013215, -1.065295, 1.979624, 0.8941177, 0, 1, 1,
0.901649, -1.502086, 1.484009, 0.9019608, 0, 1, 1,
0.9046138, 2.112876, -0.4391619, 0.9098039, 0, 1, 1,
0.9054793, 0.08667254, 0.8069224, 0.9137255, 0, 1, 1,
0.9058281, -2.4563, 4.159364, 0.9215686, 0, 1, 1,
0.9118637, -0.01374382, 2.008757, 0.9254902, 0, 1, 1,
0.9146588, 0.0828727, 1.693639, 0.9333333, 0, 1, 1,
0.9149908, 0.6386846, 1.084635, 0.9372549, 0, 1, 1,
0.9167735, 1.776028, 1.520838, 0.945098, 0, 1, 1,
0.9205277, -0.5484942, 2.281758, 0.9490196, 0, 1, 1,
0.9210221, -0.3283435, 2.550182, 0.9568627, 0, 1, 1,
0.9308966, -0.5145343, 2.684202, 0.9607843, 0, 1, 1,
0.93193, 0.7112366, 2.696318, 0.9686275, 0, 1, 1,
0.9357359, 0.1849364, 0.0149503, 0.972549, 0, 1, 1,
0.9376811, -1.861667, 1.987501, 0.9803922, 0, 1, 1,
0.9412805, 1.967492, 1.507452, 0.9843137, 0, 1, 1,
0.9448186, -0.6863211, -0.9303551, 0.9921569, 0, 1, 1,
0.9459678, -2.046795, 0.8300472, 0.9960784, 0, 1, 1,
0.9486545, 0.189446, 1.636267, 1, 0, 0.9960784, 1,
0.9502758, -0.4767844, 1.920419, 1, 0, 0.9882353, 1,
0.9575012, 0.872559, -0.1109527, 1, 0, 0.9843137, 1,
0.9618886, 0.07750901, 1.552925, 1, 0, 0.9764706, 1,
0.9623488, 0.1052837, 0.5492483, 1, 0, 0.972549, 1,
0.9634752, -1.298611, 2.93422, 1, 0, 0.9647059, 1,
0.9647765, 0.105268, 1.812863, 1, 0, 0.9607843, 1,
0.9671494, -0.001703439, 2.552471, 1, 0, 0.9529412, 1,
0.9706742, 0.4624808, 0.2624029, 1, 0, 0.9490196, 1,
0.9949165, -2.432702, 5.08761, 1, 0, 0.9411765, 1,
0.9977859, -0.1173108, 1.738874, 1, 0, 0.9372549, 1,
1.00424, 0.8057799, -0.1919859, 1, 0, 0.9294118, 1,
1.015345, 0.2331988, 0.1319104, 1, 0, 0.9254902, 1,
1.017825, 0.4066328, 1.153942, 1, 0, 0.9176471, 1,
1.019524, -1.563016, 4.406406, 1, 0, 0.9137255, 1,
1.01993, -0.7542788, 2.237408, 1, 0, 0.9058824, 1,
1.026835, -0.8659909, 2.19721, 1, 0, 0.9019608, 1,
1.030663, 0.7994198, 0.8834392, 1, 0, 0.8941177, 1,
1.037681, -1.414861, 1.848709, 1, 0, 0.8862745, 1,
1.037991, -0.976655, 2.10995, 1, 0, 0.8823529, 1,
1.039268, 0.8153149, 0.1800439, 1, 0, 0.8745098, 1,
1.046075, -0.5370202, 3.225488, 1, 0, 0.8705882, 1,
1.051371, -0.9299759, 4.193305, 1, 0, 0.8627451, 1,
1.055573, 0.1017884, 0.5753098, 1, 0, 0.8588235, 1,
1.065608, -2.513714, 2.303333, 1, 0, 0.8509804, 1,
1.075606, 0.4184291, 1.8793, 1, 0, 0.8470588, 1,
1.085629, -0.9038428, 2.677254, 1, 0, 0.8392157, 1,
1.08795, 0.139991, 1.535061, 1, 0, 0.8352941, 1,
1.088132, -0.46005, 1.407435, 1, 0, 0.827451, 1,
1.093316, 2.228475, 0.4980489, 1, 0, 0.8235294, 1,
1.106867, -0.2616327, 1.185862, 1, 0, 0.8156863, 1,
1.113567, 0.4426435, 1.711002, 1, 0, 0.8117647, 1,
1.115933, -0.1363623, 1.942913, 1, 0, 0.8039216, 1,
1.118086, -0.6777198, 3.227677, 1, 0, 0.7960784, 1,
1.120909, -0.6872842, 1.719424, 1, 0, 0.7921569, 1,
1.121429, -0.01527044, 1.108349, 1, 0, 0.7843137, 1,
1.122584, -0.208898, 1.36749, 1, 0, 0.7803922, 1,
1.126542, 0.6930918, 1.212084, 1, 0, 0.772549, 1,
1.1301, 0.998117, -0.6211258, 1, 0, 0.7686275, 1,
1.14764, 1.289929, 2.090685, 1, 0, 0.7607843, 1,
1.148297, 1.779226, 1.453662, 1, 0, 0.7568628, 1,
1.150738, -1.579245, 3.211715, 1, 0, 0.7490196, 1,
1.152539, 0.01378644, 1.41072, 1, 0, 0.7450981, 1,
1.153251, -1.622141, 1.643725, 1, 0, 0.7372549, 1,
1.158482, -0.2977529, 1.560833, 1, 0, 0.7333333, 1,
1.160023, 0.2626003, 0.6045462, 1, 0, 0.7254902, 1,
1.160916, 0.1847452, 1.281933, 1, 0, 0.7215686, 1,
1.161082, 0.1696589, -0.1075248, 1, 0, 0.7137255, 1,
1.162545, 1.080367, 3.795469, 1, 0, 0.7098039, 1,
1.165237, -0.6037053, -0.4105639, 1, 0, 0.7019608, 1,
1.17554, 2.386134, -1.094856, 1, 0, 0.6941177, 1,
1.18179, 0.5764256, 1.593271, 1, 0, 0.6901961, 1,
1.184352, -2.139149, 2.043646, 1, 0, 0.682353, 1,
1.184939, 0.4739621, 1.350966, 1, 0, 0.6784314, 1,
1.200609, -0.1095362, 1.70874, 1, 0, 0.6705883, 1,
1.200863, 0.1474444, 0.4034196, 1, 0, 0.6666667, 1,
1.205298, -1.008908, 1.163836, 1, 0, 0.6588235, 1,
1.210392, -0.5335144, -0.5260677, 1, 0, 0.654902, 1,
1.215891, 0.3899077, 1.69867, 1, 0, 0.6470588, 1,
1.227216, -0.8793466, 2.865465, 1, 0, 0.6431373, 1,
1.234964, 0.3317868, 1.088867, 1, 0, 0.6352941, 1,
1.25332, 0.4822521, 2.075728, 1, 0, 0.6313726, 1,
1.256892, -1.277035, 2.438254, 1, 0, 0.6235294, 1,
1.259198, -0.2523259, 1.835526, 1, 0, 0.6196079, 1,
1.260299, 0.06567174, 0.7449601, 1, 0, 0.6117647, 1,
1.276587, 0.7004522, 2.684048, 1, 0, 0.6078432, 1,
1.289396, 0.6626035, 0.06485847, 1, 0, 0.6, 1,
1.289854, -0.5957487, 3.495166, 1, 0, 0.5921569, 1,
1.298093, -0.939718, 1.06985, 1, 0, 0.5882353, 1,
1.299552, 0.1148668, 2.015696, 1, 0, 0.5803922, 1,
1.306689, 2.105663, 0.916157, 1, 0, 0.5764706, 1,
1.314046, -0.009057138, 1.963925, 1, 0, 0.5686275, 1,
1.314084, -1.097408, 0.01116211, 1, 0, 0.5647059, 1,
1.331247, 1.157164, 1.04244, 1, 0, 0.5568628, 1,
1.333527, -2.297553, 2.607151, 1, 0, 0.5529412, 1,
1.343399, -1.012453, 2.274165, 1, 0, 0.5450981, 1,
1.347794, 1.908616, -0.331236, 1, 0, 0.5411765, 1,
1.350075, -0.487405, 2.141718, 1, 0, 0.5333334, 1,
1.353436, -0.5185693, 3.175918, 1, 0, 0.5294118, 1,
1.363933, -0.1022582, 1.648489, 1, 0, 0.5215687, 1,
1.372699, 1.498904, 0.4089975, 1, 0, 0.5176471, 1,
1.374919, 1.860476, 1.199619, 1, 0, 0.509804, 1,
1.376051, -1.23313, 3.52013, 1, 0, 0.5058824, 1,
1.385131, -0.4576962, 0.542375, 1, 0, 0.4980392, 1,
1.396559, 0.7808235, 1.31259, 1, 0, 0.4901961, 1,
1.398361, 1.630249, 1.193297, 1, 0, 0.4862745, 1,
1.39875, -0.1760087, 1.271277, 1, 0, 0.4784314, 1,
1.399166, -0.408985, 3.720835, 1, 0, 0.4745098, 1,
1.399709, 2.584, 0.002252733, 1, 0, 0.4666667, 1,
1.400989, 0.2434326, 1.969066, 1, 0, 0.4627451, 1,
1.410098, -1.804735, 2.607952, 1, 0, 0.454902, 1,
1.413143, 0.4861297, -0.6279285, 1, 0, 0.4509804, 1,
1.419901, -2.125783, 1.369163, 1, 0, 0.4431373, 1,
1.430749, 0.03129167, 2.94848, 1, 0, 0.4392157, 1,
1.434512, -1.476019, -0.04723608, 1, 0, 0.4313726, 1,
1.43908, 0.0419973, 1.777299, 1, 0, 0.427451, 1,
1.442805, -0.3355232, 2.241941, 1, 0, 0.4196078, 1,
1.447865, 0.438339, 1.227456, 1, 0, 0.4156863, 1,
1.451906, 0.1389008, 0.4928258, 1, 0, 0.4078431, 1,
1.473324, 0.8756741, 1.894003, 1, 0, 0.4039216, 1,
1.477836, 0.939765, 2.256949, 1, 0, 0.3960784, 1,
1.492977, -1.336785, 2.22481, 1, 0, 0.3882353, 1,
1.494691, 0.5670798, 2.304115, 1, 0, 0.3843137, 1,
1.498434, -1.219621, 2.395527, 1, 0, 0.3764706, 1,
1.513125, -0.4580053, 2.44027, 1, 0, 0.372549, 1,
1.515503, -0.4717043, 1.585356, 1, 0, 0.3647059, 1,
1.518662, -0.1454455, 1.911446, 1, 0, 0.3607843, 1,
1.526146, 0.07944788, 1.909729, 1, 0, 0.3529412, 1,
1.528566, 1.136636, 1.024275, 1, 0, 0.3490196, 1,
1.542727, 0.08850396, 2.322299, 1, 0, 0.3411765, 1,
1.550262, 0.09677783, 1.643869, 1, 0, 0.3372549, 1,
1.551855, 0.192556, 2.306495, 1, 0, 0.3294118, 1,
1.553364, 1.909127, -1.500525, 1, 0, 0.3254902, 1,
1.556889, -2.320866, 3.520145, 1, 0, 0.3176471, 1,
1.558483, 0.03249234, 2.127374, 1, 0, 0.3137255, 1,
1.563609, -0.5430952, 2.457915, 1, 0, 0.3058824, 1,
1.569387, -0.7210813, 1.288957, 1, 0, 0.2980392, 1,
1.574837, -1.558494, 1.834827, 1, 0, 0.2941177, 1,
1.588369, -0.328139, 2.375099, 1, 0, 0.2862745, 1,
1.59925, 0.09526074, 4.542515, 1, 0, 0.282353, 1,
1.621341, 0.8195158, 1.605533, 1, 0, 0.2745098, 1,
1.626228, -0.7625602, 2.416346, 1, 0, 0.2705882, 1,
1.628678, 0.6785618, 2.95121, 1, 0, 0.2627451, 1,
1.654225, -0.3145635, 2.033778, 1, 0, 0.2588235, 1,
1.655536, 1.727409, 1.13354, 1, 0, 0.2509804, 1,
1.664958, 1.626582, 0.7506462, 1, 0, 0.2470588, 1,
1.67068, 1.19348, 1.993073, 1, 0, 0.2392157, 1,
1.689538, 0.1187356, 0.3284247, 1, 0, 0.2352941, 1,
1.693556, -1.767763, 1.709625, 1, 0, 0.227451, 1,
1.698645, -1.489726, 1.477045, 1, 0, 0.2235294, 1,
1.716931, 0.1454667, 2.706549, 1, 0, 0.2156863, 1,
1.737816, 1.985792, -0.1090258, 1, 0, 0.2117647, 1,
1.755067, -0.1256528, 2.259095, 1, 0, 0.2039216, 1,
1.767417, -0.1165795, 2.707785, 1, 0, 0.1960784, 1,
1.7725, 1.391038, 2.573322, 1, 0, 0.1921569, 1,
1.805468, -1.05557, 2.625464, 1, 0, 0.1843137, 1,
1.810315, -0.674865, 2.659284, 1, 0, 0.1803922, 1,
1.82, 0.8063891, 0.9985532, 1, 0, 0.172549, 1,
1.838936, 0.274286, 3.093766, 1, 0, 0.1686275, 1,
1.841878, -1.374675, 2.006862, 1, 0, 0.1607843, 1,
1.843742, 0.2510848, 2.086788, 1, 0, 0.1568628, 1,
1.849212, 0.403527, 2.036266, 1, 0, 0.1490196, 1,
1.852718, -0.2912602, 1.833672, 1, 0, 0.145098, 1,
1.874187, 2.053633, 1.339481, 1, 0, 0.1372549, 1,
1.88382, -0.7128651, 1.873647, 1, 0, 0.1333333, 1,
1.889847, 0.1640627, -0.6979588, 1, 0, 0.1254902, 1,
1.951524, 0.1234655, 1.521256, 1, 0, 0.1215686, 1,
2.012659, -0.5366472, 1.941679, 1, 0, 0.1137255, 1,
2.016768, 0.1092759, 2.265473, 1, 0, 0.1098039, 1,
2.024835, 0.3048426, 1.541148, 1, 0, 0.1019608, 1,
2.133081, 0.5596777, 1.621286, 1, 0, 0.09411765, 1,
2.165315, 0.1651665, 2.69101, 1, 0, 0.09019608, 1,
2.192494, 1.772984, 1.106479, 1, 0, 0.08235294, 1,
2.220731, 0.5444374, 1.206455, 1, 0, 0.07843138, 1,
2.270846, -1.247409, 2.295777, 1, 0, 0.07058824, 1,
2.399532, 0.7408036, 0.2816961, 1, 0, 0.06666667, 1,
2.43616, 2.172568, -0.2829638, 1, 0, 0.05882353, 1,
2.456411, 0.3498082, 2.729625, 1, 0, 0.05490196, 1,
2.49763, 0.5651588, -0.2482607, 1, 0, 0.04705882, 1,
2.525608, 1.330994, 2.178411, 1, 0, 0.04313726, 1,
2.533837, 0.1938264, 0.1887483, 1, 0, 0.03529412, 1,
2.546415, 0.1403195, 2.111224, 1, 0, 0.03137255, 1,
2.55425, 1.202648, 3.078052, 1, 0, 0.02352941, 1,
2.704881, 0.2894088, 1.094853, 1, 0, 0.01960784, 1,
2.944726, -0.1352624, 3.551726, 1, 0, 0.01176471, 1,
3.204031, 0.8732973, 2.420385, 1, 0, 0.007843138, 1
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
0.1988698, -4.003667, -7.644694, 0, -0.5, 0.5, 0.5,
0.1988698, -4.003667, -7.644694, 1, -0.5, 0.5, 0.5,
0.1988698, -4.003667, -7.644694, 1, 1.5, 0.5, 0.5,
0.1988698, -4.003667, -7.644694, 0, 1.5, 0.5, 0.5
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
-3.82504, 0.08733833, -7.644694, 0, -0.5, 0.5, 0.5,
-3.82504, 0.08733833, -7.644694, 1, -0.5, 0.5, 0.5,
-3.82504, 0.08733833, -7.644694, 1, 1.5, 0.5, 0.5,
-3.82504, 0.08733833, -7.644694, 0, 1.5, 0.5, 0.5
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
-3.82504, -4.003667, -0.3321369, 0, -0.5, 0.5, 0.5,
-3.82504, -4.003667, -0.3321369, 1, -0.5, 0.5, 0.5,
-3.82504, -4.003667, -0.3321369, 1, 1.5, 0.5, 0.5,
-3.82504, -4.003667, -0.3321369, 0, 1.5, 0.5, 0.5
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
-2, -3.059589, -5.957181,
3, -3.059589, -5.957181,
-2, -3.059589, -5.957181,
-2, -3.216935, -6.238433,
-1, -3.059589, -5.957181,
-1, -3.216935, -6.238433,
0, -3.059589, -5.957181,
0, -3.216935, -6.238433,
1, -3.059589, -5.957181,
1, -3.216935, -6.238433,
2, -3.059589, -5.957181,
2, -3.216935, -6.238433,
3, -3.059589, -5.957181,
3, -3.216935, -6.238433
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
-2, -3.531628, -6.800937, 0, -0.5, 0.5, 0.5,
-2, -3.531628, -6.800937, 1, -0.5, 0.5, 0.5,
-2, -3.531628, -6.800937, 1, 1.5, 0.5, 0.5,
-2, -3.531628, -6.800937, 0, 1.5, 0.5, 0.5,
-1, -3.531628, -6.800937, 0, -0.5, 0.5, 0.5,
-1, -3.531628, -6.800937, 1, -0.5, 0.5, 0.5,
-1, -3.531628, -6.800937, 1, 1.5, 0.5, 0.5,
-1, -3.531628, -6.800937, 0, 1.5, 0.5, 0.5,
0, -3.531628, -6.800937, 0, -0.5, 0.5, 0.5,
0, -3.531628, -6.800937, 1, -0.5, 0.5, 0.5,
0, -3.531628, -6.800937, 1, 1.5, 0.5, 0.5,
0, -3.531628, -6.800937, 0, 1.5, 0.5, 0.5,
1, -3.531628, -6.800937, 0, -0.5, 0.5, 0.5,
1, -3.531628, -6.800937, 1, -0.5, 0.5, 0.5,
1, -3.531628, -6.800937, 1, 1.5, 0.5, 0.5,
1, -3.531628, -6.800937, 0, 1.5, 0.5, 0.5,
2, -3.531628, -6.800937, 0, -0.5, 0.5, 0.5,
2, -3.531628, -6.800937, 1, -0.5, 0.5, 0.5,
2, -3.531628, -6.800937, 1, 1.5, 0.5, 0.5,
2, -3.531628, -6.800937, 0, 1.5, 0.5, 0.5,
3, -3.531628, -6.800937, 0, -0.5, 0.5, 0.5,
3, -3.531628, -6.800937, 1, -0.5, 0.5, 0.5,
3, -3.531628, -6.800937, 1, 1.5, 0.5, 0.5,
3, -3.531628, -6.800937, 0, 1.5, 0.5, 0.5
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
-2.896446, -2, -5.957181,
-2.896446, 3, -5.957181,
-2.896446, -2, -5.957181,
-3.051211, -2, -6.238433,
-2.896446, -1, -5.957181,
-3.051211, -1, -6.238433,
-2.896446, 0, -5.957181,
-3.051211, 0, -6.238433,
-2.896446, 1, -5.957181,
-3.051211, 1, -6.238433,
-2.896446, 2, -5.957181,
-3.051211, 2, -6.238433,
-2.896446, 3, -5.957181,
-3.051211, 3, -6.238433
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
-3.360743, -2, -6.800937, 0, -0.5, 0.5, 0.5,
-3.360743, -2, -6.800937, 1, -0.5, 0.5, 0.5,
-3.360743, -2, -6.800937, 1, 1.5, 0.5, 0.5,
-3.360743, -2, -6.800937, 0, 1.5, 0.5, 0.5,
-3.360743, -1, -6.800937, 0, -0.5, 0.5, 0.5,
-3.360743, -1, -6.800937, 1, -0.5, 0.5, 0.5,
-3.360743, -1, -6.800937, 1, 1.5, 0.5, 0.5,
-3.360743, -1, -6.800937, 0, 1.5, 0.5, 0.5,
-3.360743, 0, -6.800937, 0, -0.5, 0.5, 0.5,
-3.360743, 0, -6.800937, 1, -0.5, 0.5, 0.5,
-3.360743, 0, -6.800937, 1, 1.5, 0.5, 0.5,
-3.360743, 0, -6.800937, 0, 1.5, 0.5, 0.5,
-3.360743, 1, -6.800937, 0, -0.5, 0.5, 0.5,
-3.360743, 1, -6.800937, 1, -0.5, 0.5, 0.5,
-3.360743, 1, -6.800937, 1, 1.5, 0.5, 0.5,
-3.360743, 1, -6.800937, 0, 1.5, 0.5, 0.5,
-3.360743, 2, -6.800937, 0, -0.5, 0.5, 0.5,
-3.360743, 2, -6.800937, 1, -0.5, 0.5, 0.5,
-3.360743, 2, -6.800937, 1, 1.5, 0.5, 0.5,
-3.360743, 2, -6.800937, 0, 1.5, 0.5, 0.5,
-3.360743, 3, -6.800937, 0, -0.5, 0.5, 0.5,
-3.360743, 3, -6.800937, 1, -0.5, 0.5, 0.5,
-3.360743, 3, -6.800937, 1, 1.5, 0.5, 0.5,
-3.360743, 3, -6.800937, 0, 1.5, 0.5, 0.5
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
-2.896446, -3.059589, -4,
-2.896446, -3.059589, 4,
-2.896446, -3.059589, -4,
-3.051211, -3.216935, -4,
-2.896446, -3.059589, -2,
-3.051211, -3.216935, -2,
-2.896446, -3.059589, 0,
-3.051211, -3.216935, 0,
-2.896446, -3.059589, 2,
-3.051211, -3.216935, 2,
-2.896446, -3.059589, 4,
-3.051211, -3.216935, 4
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
-3.360743, -3.531628, -4, 0, -0.5, 0.5, 0.5,
-3.360743, -3.531628, -4, 1, -0.5, 0.5, 0.5,
-3.360743, -3.531628, -4, 1, 1.5, 0.5, 0.5,
-3.360743, -3.531628, -4, 0, 1.5, 0.5, 0.5,
-3.360743, -3.531628, -2, 0, -0.5, 0.5, 0.5,
-3.360743, -3.531628, -2, 1, -0.5, 0.5, 0.5,
-3.360743, -3.531628, -2, 1, 1.5, 0.5, 0.5,
-3.360743, -3.531628, -2, 0, 1.5, 0.5, 0.5,
-3.360743, -3.531628, 0, 0, -0.5, 0.5, 0.5,
-3.360743, -3.531628, 0, 1, -0.5, 0.5, 0.5,
-3.360743, -3.531628, 0, 1, 1.5, 0.5, 0.5,
-3.360743, -3.531628, 0, 0, 1.5, 0.5, 0.5,
-3.360743, -3.531628, 2, 0, -0.5, 0.5, 0.5,
-3.360743, -3.531628, 2, 1, -0.5, 0.5, 0.5,
-3.360743, -3.531628, 2, 1, 1.5, 0.5, 0.5,
-3.360743, -3.531628, 2, 0, 1.5, 0.5, 0.5,
-3.360743, -3.531628, 4, 0, -0.5, 0.5, 0.5,
-3.360743, -3.531628, 4, 1, -0.5, 0.5, 0.5,
-3.360743, -3.531628, 4, 1, 1.5, 0.5, 0.5,
-3.360743, -3.531628, 4, 0, 1.5, 0.5, 0.5
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
-2.896446, -3.059589, -5.957181,
-2.896446, 3.234266, -5.957181,
-2.896446, -3.059589, 5.292907,
-2.896446, 3.234266, 5.292907,
-2.896446, -3.059589, -5.957181,
-2.896446, -3.059589, 5.292907,
-2.896446, 3.234266, -5.957181,
-2.896446, 3.234266, 5.292907,
-2.896446, -3.059589, -5.957181,
3.294185, -3.059589, -5.957181,
-2.896446, -3.059589, 5.292907,
3.294185, -3.059589, 5.292907,
-2.896446, 3.234266, -5.957181,
3.294185, 3.234266, -5.957181,
-2.896446, 3.234266, 5.292907,
3.294185, 3.234266, 5.292907,
3.294185, -3.059589, -5.957181,
3.294185, 3.234266, -5.957181,
3.294185, -3.059589, 5.292907,
3.294185, 3.234266, 5.292907,
3.294185, -3.059589, -5.957181,
3.294185, -3.059589, 5.292907,
3.294185, 3.234266, -5.957181,
3.294185, 3.234266, 5.292907
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
var radius = 7.636128;
var distance = 33.974;
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
mvMatrix.translate( -0.1988698, -0.08733833, 0.3321369 );
mvMatrix.scale( 1.333682, 1.311808, 0.7338904 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.974);
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
metamitron<-read.table("metamitron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metamitron$V2
```

```
## Error in eval(expr, envir, enclos): object 'metamitron' not found
```

```r
y<-metamitron$V3
```

```
## Error in eval(expr, envir, enclos): object 'metamitron' not found
```

```r
z<-metamitron$V4
```

```
## Error in eval(expr, envir, enclos): object 'metamitron' not found
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
-2.806291, 0.6693521, -1.31523, 0, 0, 1, 1, 1,
-2.731352, -1.32853, -0.08828048, 1, 0, 0, 1, 1,
-2.701614, 1.442027, -1.822358, 1, 0, 0, 1, 1,
-2.689362, 0.05351716, -2.893444, 1, 0, 0, 1, 1,
-2.687391, -0.1922572, -1.60689, 1, 0, 0, 1, 1,
-2.556972, -0.04896288, -2.480661, 1, 0, 0, 1, 1,
-2.532228, 0.8781549, -2.980985, 0, 0, 0, 1, 1,
-2.500081, 0.5892703, -3.019986, 0, 0, 0, 1, 1,
-2.396891, -0.8786199, -3.285037, 0, 0, 0, 1, 1,
-2.283065, -0.2504372, -4.262855, 0, 0, 0, 1, 1,
-2.276674, 1.508422, 1.329606, 0, 0, 0, 1, 1,
-2.248647, -0.3011785, -0.2019928, 0, 0, 0, 1, 1,
-2.220874, -2.940065, -3.068616, 0, 0, 0, 1, 1,
-2.190331, -0.279859, -2.719961, 1, 1, 1, 1, 1,
-2.121518, -0.879245, -1.880384, 1, 1, 1, 1, 1,
-2.085347, 2.191253, -0.7157832, 1, 1, 1, 1, 1,
-2.06779, -0.3014689, -1.546059, 1, 1, 1, 1, 1,
-2.060469, 0.7575231, -3.695211, 1, 1, 1, 1, 1,
-2.035425, 0.6475409, -0.8765589, 1, 1, 1, 1, 1,
-2.023487, -0.7711645, -2.300906, 1, 1, 1, 1, 1,
-1.996153, 0.004485147, -2.716768, 1, 1, 1, 1, 1,
-1.989265, -0.3251455, -2.211802, 1, 1, 1, 1, 1,
-1.941426, 1.524183, -0.6641629, 1, 1, 1, 1, 1,
-1.925882, 0.5625309, -0.5891968, 1, 1, 1, 1, 1,
-1.875604, -1.186769, -1.391115, 1, 1, 1, 1, 1,
-1.828712, 0.7302907, -1.305102, 1, 1, 1, 1, 1,
-1.818242, 1.395507, -2.083308, 1, 1, 1, 1, 1,
-1.8091, 1.122919, -0.247543, 1, 1, 1, 1, 1,
-1.796326, -0.0408725, -1.510906, 0, 0, 1, 1, 1,
-1.765551, 0.5772841, -0.72646, 1, 0, 0, 1, 1,
-1.737965, 1.268614, 0.752762, 1, 0, 0, 1, 1,
-1.732156, 1.523431, -0.9982336, 1, 0, 0, 1, 1,
-1.722087, 0.948305, 0.2976292, 1, 0, 0, 1, 1,
-1.713565, 0.1843042, -1.848241, 1, 0, 0, 1, 1,
-1.712161, 0.57533, -1.019848, 0, 0, 0, 1, 1,
-1.710757, -1.879374, -3.131401, 0, 0, 0, 1, 1,
-1.664399, 0.8185514, -1.531827, 0, 0, 0, 1, 1,
-1.66228, 0.06397795, -1.82467, 0, 0, 0, 1, 1,
-1.658871, 1.632435, -1.229052, 0, 0, 0, 1, 1,
-1.638093, 0.8017468, -1.646153, 0, 0, 0, 1, 1,
-1.63588, -0.8768586, -2.863006, 0, 0, 0, 1, 1,
-1.619721, -0.7923996, -1.861978, 1, 1, 1, 1, 1,
-1.608683, 0.1726243, -1.552332, 1, 1, 1, 1, 1,
-1.604916, 0.689752, -0.1647046, 1, 1, 1, 1, 1,
-1.603843, 0.1042296, -0.9081584, 1, 1, 1, 1, 1,
-1.603774, 0.1850021, 0.4526555, 1, 1, 1, 1, 1,
-1.591903, -0.4905396, 0.2416851, 1, 1, 1, 1, 1,
-1.569896, -1.583397, -2.837447, 1, 1, 1, 1, 1,
-1.564591, -0.3750893, -1.426651, 1, 1, 1, 1, 1,
-1.561059, -0.07390641, -2.862077, 1, 1, 1, 1, 1,
-1.545116, -0.2973565, -1.024582, 1, 1, 1, 1, 1,
-1.542894, 0.06399532, -1.639424, 1, 1, 1, 1, 1,
-1.530988, -0.2290143, -2.180007, 1, 1, 1, 1, 1,
-1.530774, -1.075668, -1.736464, 1, 1, 1, 1, 1,
-1.521674, -1.170115, -0.5499669, 1, 1, 1, 1, 1,
-1.514622, 0.2680922, -1.179422, 1, 1, 1, 1, 1,
-1.512628, 2.441485, -0.2784637, 0, 0, 1, 1, 1,
-1.512419, 1.439584, 0.1489526, 1, 0, 0, 1, 1,
-1.511715, 1.769639, -0.4269412, 1, 0, 0, 1, 1,
-1.504254, 0.5278186, -1.301093, 1, 0, 0, 1, 1,
-1.502718, -0.2139209, -1.432547, 1, 0, 0, 1, 1,
-1.488603, 0.7823136, -1.703014, 1, 0, 0, 1, 1,
-1.487501, -0.4156172, -1.766989, 0, 0, 0, 1, 1,
-1.466339, -2.113427, -1.503289, 0, 0, 0, 1, 1,
-1.452292, -1.105023, -2.69164, 0, 0, 0, 1, 1,
-1.449869, 0.2556926, -0.9450753, 0, 0, 0, 1, 1,
-1.441389, 2.511317, -1.346365, 0, 0, 0, 1, 1,
-1.439415, 0.8988176, -0.5285676, 0, 0, 0, 1, 1,
-1.425749, -1.072682, -2.945939, 0, 0, 0, 1, 1,
-1.420081, 0.9197827, -1.935632, 1, 1, 1, 1, 1,
-1.419123, 0.5386894, -1.135731, 1, 1, 1, 1, 1,
-1.416953, -0.5085359, -1.979141, 1, 1, 1, 1, 1,
-1.405376, -0.5479439, -2.110292, 1, 1, 1, 1, 1,
-1.402143, 0.6510406, -0.6049705, 1, 1, 1, 1, 1,
-1.400665, -0.3694694, -2.092767, 1, 1, 1, 1, 1,
-1.395178, 0.1060197, -2.114988, 1, 1, 1, 1, 1,
-1.38725, 0.9127964, 0.2293458, 1, 1, 1, 1, 1,
-1.386549, -1.839796, -2.488417, 1, 1, 1, 1, 1,
-1.384466, -0.5234901, -2.187267, 1, 1, 1, 1, 1,
-1.37145, 1.154672, 0.3799996, 1, 1, 1, 1, 1,
-1.369612, -0.4392498, -0.1732332, 1, 1, 1, 1, 1,
-1.358824, -0.6298785, -1.420141, 1, 1, 1, 1, 1,
-1.35727, 0.6760886, -0.5173437, 1, 1, 1, 1, 1,
-1.356952, 0.05333679, -1.277852, 1, 1, 1, 1, 1,
-1.346393, 0.4703259, -1.820852, 0, 0, 1, 1, 1,
-1.342207, 0.02159212, -2.326085, 1, 0, 0, 1, 1,
-1.329379, 0.2075503, -0.8647096, 1, 0, 0, 1, 1,
-1.326244, -0.6118711, -1.312603, 1, 0, 0, 1, 1,
-1.321101, 0.1493226, -1.197207, 1, 0, 0, 1, 1,
-1.319665, -1.918493, -3.338783, 1, 0, 0, 1, 1,
-1.318353, -0.1353862, -0.8373147, 0, 0, 0, 1, 1,
-1.316781, 0.09606916, -2.327519, 0, 0, 0, 1, 1,
-1.315236, 1.375652, 0.3506415, 0, 0, 0, 1, 1,
-1.311868, 0.2432462, -1.480782, 0, 0, 0, 1, 1,
-1.299296, 1.319855, -0.2612111, 0, 0, 0, 1, 1,
-1.29711, -0.5593697, -1.541553, 0, 0, 0, 1, 1,
-1.293795, 0.331396, -1.032385, 0, 0, 0, 1, 1,
-1.283811, 0.7758747, -0.9082195, 1, 1, 1, 1, 1,
-1.282741, 2.061701, -0.5090361, 1, 1, 1, 1, 1,
-1.280328, -0.2306174, -1.297149, 1, 1, 1, 1, 1,
-1.273616, -0.7782431, -2.452731, 1, 1, 1, 1, 1,
-1.268745, 1.06379, -2.371524, 1, 1, 1, 1, 1,
-1.26637, 0.6532644, -1.025914, 1, 1, 1, 1, 1,
-1.26312, 1.386094, 0.1145038, 1, 1, 1, 1, 1,
-1.261707, 0.09690589, -0.7533688, 1, 1, 1, 1, 1,
-1.258694, 0.02738644, -1.878939, 1, 1, 1, 1, 1,
-1.258665, 0.9638324, -1.35488, 1, 1, 1, 1, 1,
-1.253817, -0.04107025, -1.333068, 1, 1, 1, 1, 1,
-1.252454, 1.251723, 0.4926454, 1, 1, 1, 1, 1,
-1.246807, -0.4054275, -1.48622, 1, 1, 1, 1, 1,
-1.234502, 0.7529395, -1.989112, 1, 1, 1, 1, 1,
-1.23067, -0.4508229, -2.222789, 1, 1, 1, 1, 1,
-1.221891, 0.4562748, -1.40797, 0, 0, 1, 1, 1,
-1.220409, -0.2487225, -1.299366, 1, 0, 0, 1, 1,
-1.210562, -1.039161, -2.101699, 1, 0, 0, 1, 1,
-1.197733, -1.119982, -0.1965189, 1, 0, 0, 1, 1,
-1.194874, -0.56964, -3.627296, 1, 0, 0, 1, 1,
-1.18426, -1.435971, -4.216544, 1, 0, 0, 1, 1,
-1.183057, -0.3238983, -0.4048472, 0, 0, 0, 1, 1,
-1.166353, -0.3051631, -1.526812, 0, 0, 0, 1, 1,
-1.14632, 0.4003291, -0.8775716, 0, 0, 0, 1, 1,
-1.137798, 0.2755398, -1.493679, 0, 0, 0, 1, 1,
-1.131346, -0.1644483, -1.853317, 0, 0, 0, 1, 1,
-1.131261, 1.092339, 0.03783716, 0, 0, 0, 1, 1,
-1.129064, -0.2784855, -1.714621, 0, 0, 0, 1, 1,
-1.126195, -0.4910218, -2.382205, 1, 1, 1, 1, 1,
-1.120607, 0.9005193, -1.109058, 1, 1, 1, 1, 1,
-1.114268, -0.9023451, -0.696926, 1, 1, 1, 1, 1,
-1.112438, -0.584124, -0.01265375, 1, 1, 1, 1, 1,
-1.102839, 0.9710978, -1.099642, 1, 1, 1, 1, 1,
-1.098316, 0.453936, -3.353702, 1, 1, 1, 1, 1,
-1.080432, -0.4308761, -3.494279, 1, 1, 1, 1, 1,
-1.078125, -1.230167, -1.434268, 1, 1, 1, 1, 1,
-1.06475, -0.345345, -3.243788, 1, 1, 1, 1, 1,
-1.058623, -0.04237564, -1.378421, 1, 1, 1, 1, 1,
-1.057811, 1.895306, -1.325744, 1, 1, 1, 1, 1,
-1.057043, 0.6087826, -0.8842943, 1, 1, 1, 1, 1,
-1.054627, -0.1348415, -1.480045, 1, 1, 1, 1, 1,
-1.053689, 1.250449, 0.2357766, 1, 1, 1, 1, 1,
-1.049038, -0.7376078, -3.815729, 1, 1, 1, 1, 1,
-1.04559, -0.3658634, -3.336743, 0, 0, 1, 1, 1,
-1.044985, 0.07302993, -0.641333, 1, 0, 0, 1, 1,
-1.033331, -0.9748704, -1.989432, 1, 0, 0, 1, 1,
-1.033069, 1.115213, -1.53495, 1, 0, 0, 1, 1,
-1.0328, 0.320355, -1.899431, 1, 0, 0, 1, 1,
-1.024917, -0.7968923, -1.880792, 1, 0, 0, 1, 1,
-1.02233, 0.1675339, -2.945152, 0, 0, 0, 1, 1,
-1.018603, 0.5046487, -0.5429335, 0, 0, 0, 1, 1,
-1.016626, 0.8007671, -1.277847, 0, 0, 0, 1, 1,
-1.015732, -1.491317, -2.880311, 0, 0, 0, 1, 1,
-1.009323, 1.06782, -0.4911542, 0, 0, 0, 1, 1,
-1.008626, 0.6966802, 0.8795245, 0, 0, 0, 1, 1,
-1.00515, 0.5187572, -2.494262, 0, 0, 0, 1, 1,
-0.9901915, 0.06254944, -1.804279, 1, 1, 1, 1, 1,
-0.9859648, 0.8527985, -0.801412, 1, 1, 1, 1, 1,
-0.9805827, 0.1268145, -2.327274, 1, 1, 1, 1, 1,
-0.9763448, -2.558346, -1.610711, 1, 1, 1, 1, 1,
-0.973354, -1.709699, -2.509629, 1, 1, 1, 1, 1,
-0.9712945, -0.6061871, -2.184742, 1, 1, 1, 1, 1,
-0.9594441, 0.7838564, 0.2397556, 1, 1, 1, 1, 1,
-0.9584286, -1.176755, -2.971383, 1, 1, 1, 1, 1,
-0.953947, -0.8092875, -3.30408, 1, 1, 1, 1, 1,
-0.9496596, 0.2436158, -1.597922, 1, 1, 1, 1, 1,
-0.9491507, 0.3887275, -0.9778196, 1, 1, 1, 1, 1,
-0.9490256, 1.548616, -1.074609, 1, 1, 1, 1, 1,
-0.9463913, -1.692952, -2.017009, 1, 1, 1, 1, 1,
-0.9441805, 0.6808119, -2.250039, 1, 1, 1, 1, 1,
-0.9364339, 0.3756475, -2.809388, 1, 1, 1, 1, 1,
-0.931213, 1.627872, 0.07406292, 0, 0, 1, 1, 1,
-0.9289209, 0.3890387, -2.136971, 1, 0, 0, 1, 1,
-0.9245279, 0.3281912, -2.053012, 1, 0, 0, 1, 1,
-0.9218133, -0.1474289, -2.435742, 1, 0, 0, 1, 1,
-0.9216242, 0.05064887, -1.44521, 1, 0, 0, 1, 1,
-0.920808, -0.1915839, -2.561532, 1, 0, 0, 1, 1,
-0.9187849, -1.099403, -2.871783, 0, 0, 0, 1, 1,
-0.9070304, 0.6455414, -1.137797, 0, 0, 0, 1, 1,
-0.9064961, 0.2809719, -0.7712446, 0, 0, 0, 1, 1,
-0.9054158, -0.858232, -2.039452, 0, 0, 0, 1, 1,
-0.8990128, -0.1844948, 0.9470052, 0, 0, 0, 1, 1,
-0.8946722, 0.7366279, 0.7457076, 0, 0, 0, 1, 1,
-0.8944749, -0.8363975, -1.831983, 0, 0, 0, 1, 1,
-0.8930144, -0.8400863, -2.861645, 1, 1, 1, 1, 1,
-0.8927402, -1.074111, -2.613709, 1, 1, 1, 1, 1,
-0.8901044, 0.1738638, -0.9306879, 1, 1, 1, 1, 1,
-0.8873827, -0.4116023, -2.223185, 1, 1, 1, 1, 1,
-0.8810526, 0.3538282, -1.426393, 1, 1, 1, 1, 1,
-0.8737522, 0.564186, -0.7223996, 1, 1, 1, 1, 1,
-0.8703476, 0.4629643, -0.6020254, 1, 1, 1, 1, 1,
-0.8697454, 0.002268833, -0.8926547, 1, 1, 1, 1, 1,
-0.8600245, -0.1265389, -2.72796, 1, 1, 1, 1, 1,
-0.8586547, 0.4191099, -0.9829406, 1, 1, 1, 1, 1,
-0.8539748, 0.2322937, -2.728, 1, 1, 1, 1, 1,
-0.853545, -1.661471, -1.957585, 1, 1, 1, 1, 1,
-0.8521069, -0.6264032, -2.415226, 1, 1, 1, 1, 1,
-0.8509828, -0.6478051, -2.552531, 1, 1, 1, 1, 1,
-0.8478981, 0.04056887, -1.609692, 1, 1, 1, 1, 1,
-0.846893, 1.795116, -0.3502254, 0, 0, 1, 1, 1,
-0.8458732, -0.7481752, -1.001793, 1, 0, 0, 1, 1,
-0.8440558, -0.7524967, -2.147358, 1, 0, 0, 1, 1,
-0.8356096, -1.168956, -1.3091, 1, 0, 0, 1, 1,
-0.8352468, 1.705097, -1.891057, 1, 0, 0, 1, 1,
-0.8307924, 0.8922559, 0.2700971, 1, 0, 0, 1, 1,
-0.8302194, 0.9479097, -0.5065839, 0, 0, 0, 1, 1,
-0.8296923, -1.541302, -2.5422, 0, 0, 0, 1, 1,
-0.8204307, 0.3663193, -1.088019, 0, 0, 0, 1, 1,
-0.8174494, -0.09761025, -0.6456852, 0, 0, 0, 1, 1,
-0.8152161, -0.1594476, -1.861144, 0, 0, 0, 1, 1,
-0.8151696, 0.4031922, -2.737147, 0, 0, 0, 1, 1,
-0.8137131, 0.7630726, -2.789524, 0, 0, 0, 1, 1,
-0.8106621, 1.291245, -0.01352585, 1, 1, 1, 1, 1,
-0.8097892, -1.340747, -1.687681, 1, 1, 1, 1, 1,
-0.8038387, 0.05233124, -2.835089, 1, 1, 1, 1, 1,
-0.7993243, 3.142608, 1.236698, 1, 1, 1, 1, 1,
-0.7990816, -1.23781, -2.633589, 1, 1, 1, 1, 1,
-0.7881917, -1.293051, -1.225319, 1, 1, 1, 1, 1,
-0.7771519, 0.2997845, -2.547784, 1, 1, 1, 1, 1,
-0.776772, 0.886425, -1.441705, 1, 1, 1, 1, 1,
-0.7763785, -0.6375776, -0.8461354, 1, 1, 1, 1, 1,
-0.7735996, 0.4724733, -1.653605, 1, 1, 1, 1, 1,
-0.7735142, 1.151613, -2.683815, 1, 1, 1, 1, 1,
-0.7664835, 1.101665, -0.4035573, 1, 1, 1, 1, 1,
-0.7544263, 1.187539, -0.9658774, 1, 1, 1, 1, 1,
-0.7480077, -0.6893007, -1.153934, 1, 1, 1, 1, 1,
-0.7464049, 2.956343, 0.2150619, 1, 1, 1, 1, 1,
-0.7445968, -0.612865, -2.637011, 0, 0, 1, 1, 1,
-0.7443614, -0.5679754, -2.060376, 1, 0, 0, 1, 1,
-0.7423938, 1.425329, -1.110325, 1, 0, 0, 1, 1,
-0.7396501, -1.062379, -3.082422, 1, 0, 0, 1, 1,
-0.7334754, -0.8022033, -1.777036, 1, 0, 0, 1, 1,
-0.7251759, -0.8188211, -2.123846, 1, 0, 0, 1, 1,
-0.7225493, 0.772542, -1.757851, 0, 0, 0, 1, 1,
-0.7216716, -0.2307096, -1.64959, 0, 0, 0, 1, 1,
-0.7215747, 0.138141, -0.7665865, 0, 0, 0, 1, 1,
-0.7160417, -1.361193, -1.812945, 0, 0, 0, 1, 1,
-0.7151996, 0.8243176, -0.2298461, 0, 0, 0, 1, 1,
-0.7136651, -0.5199173, -3.223768, 0, 0, 0, 1, 1,
-0.710853, -0.5551389, -2.555015, 0, 0, 0, 1, 1,
-0.7090764, -0.3444646, -2.174567, 1, 1, 1, 1, 1,
-0.7068873, 0.6941444, 0.4793551, 1, 1, 1, 1, 1,
-0.7054637, 0.4605516, -0.7982603, 1, 1, 1, 1, 1,
-0.7038789, 1.269288, -1.077368, 1, 1, 1, 1, 1,
-0.7035376, -0.6634187, -1.867166, 1, 1, 1, 1, 1,
-0.6996802, -0.2576472, -4.768991, 1, 1, 1, 1, 1,
-0.6915203, -2.259293, -2.327701, 1, 1, 1, 1, 1,
-0.6838416, -0.6791298, -2.506216, 1, 1, 1, 1, 1,
-0.6812605, 1.400943, -0.8384097, 1, 1, 1, 1, 1,
-0.6810401, -0.7528909, -2.810741, 1, 1, 1, 1, 1,
-0.6685898, 0.1622533, -0.8536547, 1, 1, 1, 1, 1,
-0.6682867, -1.904575, -2.803391, 1, 1, 1, 1, 1,
-0.6673019, 0.6709082, 0.03340959, 1, 1, 1, 1, 1,
-0.6638249, 0.7439157, -1.659475, 1, 1, 1, 1, 1,
-0.6602264, -0.09189642, -3.140008, 1, 1, 1, 1, 1,
-0.6583132, -0.2615976, -0.8106617, 0, 0, 1, 1, 1,
-0.6564862, 0.1134967, -2.40421, 1, 0, 0, 1, 1,
-0.6563492, -1.189276, -2.956752, 1, 0, 0, 1, 1,
-0.6452996, 1.065468, -0.9953764, 1, 0, 0, 1, 1,
-0.6436258, 0.07368947, -1.879738, 1, 0, 0, 1, 1,
-0.6402219, 0.2191816, -0.3275979, 1, 0, 0, 1, 1,
-0.6377191, -1.038445, -2.690466, 0, 0, 0, 1, 1,
-0.6342702, 1.505355, -0.6542437, 0, 0, 0, 1, 1,
-0.6314649, 0.1634327, -1.030268, 0, 0, 0, 1, 1,
-0.6292714, -1.229526, -3.534541, 0, 0, 0, 1, 1,
-0.6273226, -1.523995, -2.181435, 0, 0, 0, 1, 1,
-0.6250077, -0.06139209, -1.955311, 0, 0, 0, 1, 1,
-0.6237071, -0.0826043, -1.321967, 0, 0, 0, 1, 1,
-0.6174908, -0.8505877, -4.005998, 1, 1, 1, 1, 1,
-0.6171842, -0.9642972, -3.843343, 1, 1, 1, 1, 1,
-0.6166567, 0.9683699, -2.329415, 1, 1, 1, 1, 1,
-0.614916, -1.474815, -3.563191, 1, 1, 1, 1, 1,
-0.6111881, -0.6910616, -2.97604, 1, 1, 1, 1, 1,
-0.6078508, 0.1321978, -1.328911, 1, 1, 1, 1, 1,
-0.6045513, -1.052932, -3.074964, 1, 1, 1, 1, 1,
-0.602331, -0.1656744, -1.817595, 1, 1, 1, 1, 1,
-0.6011741, -1.986308, -2.763885, 1, 1, 1, 1, 1,
-0.5964893, -0.4651551, -2.070683, 1, 1, 1, 1, 1,
-0.590373, -0.8029403, -2.584832, 1, 1, 1, 1, 1,
-0.5891017, -0.6937234, -2.624002, 1, 1, 1, 1, 1,
-0.5783994, 0.3401898, -0.1574167, 1, 1, 1, 1, 1,
-0.5770652, -0.5199876, -3.094431, 1, 1, 1, 1, 1,
-0.5762545, 0.8016791, 1.443765, 1, 1, 1, 1, 1,
-0.5753762, -1.441287, -2.244983, 0, 0, 1, 1, 1,
-0.5749293, -1.589166, -0.1205982, 1, 0, 0, 1, 1,
-0.5745588, 0.9684806, -1.39517, 1, 0, 0, 1, 1,
-0.5708433, 1.639083, 0.7284769, 1, 0, 0, 1, 1,
-0.5686513, -0.9635274, -3.073256, 1, 0, 0, 1, 1,
-0.5680916, -0.4407365, -1.452814, 1, 0, 0, 1, 1,
-0.5672497, 0.6611254, -1.506734, 0, 0, 0, 1, 1,
-0.5630856, 0.7006645, -1.683223, 0, 0, 0, 1, 1,
-0.5578005, -0.8460879, -4.1412, 0, 0, 0, 1, 1,
-0.5572297, -0.3995192, -1.407801, 0, 0, 0, 1, 1,
-0.5543506, 0.1088547, -2.591049, 0, 0, 0, 1, 1,
-0.5535102, -1.160264, -2.98456, 0, 0, 0, 1, 1,
-0.552691, -1.141053, -3.531658, 0, 0, 0, 1, 1,
-0.5478979, 1.873287, 0.006005781, 1, 1, 1, 1, 1,
-0.5468044, -0.2516188, -2.371422, 1, 1, 1, 1, 1,
-0.5447488, -0.9527605, -1.718184, 1, 1, 1, 1, 1,
-0.5442508, -1.820924, -3.265658, 1, 1, 1, 1, 1,
-0.5437826, -0.04729118, -1.733826, 1, 1, 1, 1, 1,
-0.542629, -0.528705, -1.670672, 1, 1, 1, 1, 1,
-0.5381911, 0.5844585, -1.367472, 1, 1, 1, 1, 1,
-0.5358318, -0.02611111, -1.257674, 1, 1, 1, 1, 1,
-0.5327062, -0.5184706, -1.573499, 1, 1, 1, 1, 1,
-0.5303237, 0.3094415, -0.9979739, 1, 1, 1, 1, 1,
-0.5279602, 1.472536, -0.8026946, 1, 1, 1, 1, 1,
-0.5263696, -0.3226004, -1.961805, 1, 1, 1, 1, 1,
-0.518953, 1.075322, 0.3030505, 1, 1, 1, 1, 1,
-0.5167117, -0.2872802, -2.221092, 1, 1, 1, 1, 1,
-0.5098191, -0.4629553, -2.378638, 1, 1, 1, 1, 1,
-0.5097607, -0.3937409, -3.710119, 0, 0, 1, 1, 1,
-0.5095569, -1.053528, -2.242326, 1, 0, 0, 1, 1,
-0.5041193, -1.015137, -1.131976, 1, 0, 0, 1, 1,
-0.5014478, -0.4024972, -1.884645, 1, 0, 0, 1, 1,
-0.5013436, 1.249066, 0.6813652, 1, 0, 0, 1, 1,
-0.5007992, -1.09011, -2.443318, 1, 0, 0, 1, 1,
-0.5003843, -1.663986, -2.706422, 0, 0, 0, 1, 1,
-0.4985851, 0.3086136, -1.977125, 0, 0, 0, 1, 1,
-0.4968928, 0.5593312, -0.2871431, 0, 0, 0, 1, 1,
-0.4923083, -2.941199, -2.639534, 0, 0, 0, 1, 1,
-0.4883555, 0.8703395, 0.5179372, 0, 0, 0, 1, 1,
-0.4840198, 0.05607088, -0.7004636, 0, 0, 0, 1, 1,
-0.4837647, -0.2124358, -0.4634197, 0, 0, 0, 1, 1,
-0.4809795, -1.272904, -2.793187, 1, 1, 1, 1, 1,
-0.4731908, -1.025015, -1.96526, 1, 1, 1, 1, 1,
-0.4603835, -1.101142, -0.3516778, 1, 1, 1, 1, 1,
-0.4578657, 0.4833897, -0.5433821, 1, 1, 1, 1, 1,
-0.4568955, -1.305738, -3.655509, 1, 1, 1, 1, 1,
-0.4506454, 0.6079386, -1.283707, 1, 1, 1, 1, 1,
-0.4503726, -0.1963675, -2.569066, 1, 1, 1, 1, 1,
-0.4493295, 0.8713747, -0.5545509, 1, 1, 1, 1, 1,
-0.4401793, 0.9479081, -0.920096, 1, 1, 1, 1, 1,
-0.4393181, -0.3287894, -2.248245, 1, 1, 1, 1, 1,
-0.4368603, 0.7984166, -0.06074384, 1, 1, 1, 1, 1,
-0.4352907, -1.695531, -3.030312, 1, 1, 1, 1, 1,
-0.4304156, 1.828609, -0.815479, 1, 1, 1, 1, 1,
-0.4262051, 0.8239233, -1.150036, 1, 1, 1, 1, 1,
-0.4213768, 0.3380919, -1.048444, 1, 1, 1, 1, 1,
-0.420881, -2.009781, -2.983903, 0, 0, 1, 1, 1,
-0.4206851, -0.3270177, -3.832831, 1, 0, 0, 1, 1,
-0.4200847, 0.09654909, -1.306715, 1, 0, 0, 1, 1,
-0.4167554, -2.163118, -3.755442, 1, 0, 0, 1, 1,
-0.4163723, -0.1899916, -0.9922744, 1, 0, 0, 1, 1,
-0.4149888, 0.3584079, -1.908159, 1, 0, 0, 1, 1,
-0.4134997, 0.5290176, -0.4379878, 0, 0, 0, 1, 1,
-0.4133795, 0.9942076, -0.07596745, 0, 0, 0, 1, 1,
-0.4065697, 0.1378275, -1.693699, 0, 0, 0, 1, 1,
-0.4060216, -0.2745983, -3.057648, 0, 0, 0, 1, 1,
-0.4046853, -0.9649656, -4.356172, 0, 0, 0, 1, 1,
-0.4012395, 2.485883, 1.012319, 0, 0, 0, 1, 1,
-0.3970914, 0.4846745, -1.30389, 0, 0, 0, 1, 1,
-0.3966407, 0.6095654, -0.6129461, 1, 1, 1, 1, 1,
-0.395434, -1.015364, -3.48594, 1, 1, 1, 1, 1,
-0.3930654, 1.149136, 0.7080908, 1, 1, 1, 1, 1,
-0.3928009, 0.8179047, -1.476743, 1, 1, 1, 1, 1,
-0.3814139, -0.8852773, -3.137478, 1, 1, 1, 1, 1,
-0.3785045, 1.421087, -0.7340971, 1, 1, 1, 1, 1,
-0.375825, 0.7618592, 0.1720961, 1, 1, 1, 1, 1,
-0.3746767, -1.198382, -2.355615, 1, 1, 1, 1, 1,
-0.3738556, -0.2580977, -2.403034, 1, 1, 1, 1, 1,
-0.3725365, -1.264748, -2.869508, 1, 1, 1, 1, 1,
-0.3722597, 0.7299389, -2.705693, 1, 1, 1, 1, 1,
-0.3717723, 0.4626865, -1.784757, 1, 1, 1, 1, 1,
-0.3688414, 0.511065, -1.035928, 1, 1, 1, 1, 1,
-0.3633718, 1.073279, -0.1342999, 1, 1, 1, 1, 1,
-0.3571464, 1.234481, -0.4795974, 1, 1, 1, 1, 1,
-0.3535146, -0.3451214, -1.573746, 0, 0, 1, 1, 1,
-0.3524826, 0.1974724, -0.6627088, 1, 0, 0, 1, 1,
-0.3506668, -0.7655234, -2.442488, 1, 0, 0, 1, 1,
-0.3495707, 0.2460642, -1.416751, 1, 0, 0, 1, 1,
-0.3476537, 0.6983934, -0.6544023, 1, 0, 0, 1, 1,
-0.3463257, 0.7253494, -1.06123, 1, 0, 0, 1, 1,
-0.3448308, -0.0316437, -1.370916, 0, 0, 0, 1, 1,
-0.3427894, -1.016998, -2.697005, 0, 0, 0, 1, 1,
-0.3413687, -0.06155322, -1.764168, 0, 0, 0, 1, 1,
-0.3411318, 0.1082972, -1.787396, 0, 0, 0, 1, 1,
-0.336893, 0.5140226, -0.4616753, 0, 0, 0, 1, 1,
-0.3337173, 1.181916, 0.2019731, 0, 0, 0, 1, 1,
-0.333414, -1.120147, -3.077492, 0, 0, 0, 1, 1,
-0.3304087, -1.326006, -1.797145, 1, 1, 1, 1, 1,
-0.3292717, -0.195991, -0.7447338, 1, 1, 1, 1, 1,
-0.3267034, -0.05311781, -0.6316143, 1, 1, 1, 1, 1,
-0.3247284, 0.654218, -1.926184, 1, 1, 1, 1, 1,
-0.3201059, -1.190402, -3.560039, 1, 1, 1, 1, 1,
-0.3106956, 0.4205641, -0.805591, 1, 1, 1, 1, 1,
-0.3096415, 0.432431, -1.71565, 1, 1, 1, 1, 1,
-0.2999882, -0.3439757, -2.401604, 1, 1, 1, 1, 1,
-0.2994836, 0.3131998, 0.9082741, 1, 1, 1, 1, 1,
-0.2982244, -0.8093646, -1.437167, 1, 1, 1, 1, 1,
-0.2981069, -0.353747, -3.583431, 1, 1, 1, 1, 1,
-0.2974627, -0.3277761, -2.468179, 1, 1, 1, 1, 1,
-0.2971085, -1.246318, -1.537738, 1, 1, 1, 1, 1,
-0.296581, 1.314676, -2.170957, 1, 1, 1, 1, 1,
-0.2951154, -0.1229918, -2.471503, 1, 1, 1, 1, 1,
-0.2944448, -0.2173057, -2.119131, 0, 0, 1, 1, 1,
-0.2943303, 0.26696, -2.477856, 1, 0, 0, 1, 1,
-0.2878096, -1.710254, -0.9493193, 1, 0, 0, 1, 1,
-0.2859926, -0.01448324, -1.562122, 1, 0, 0, 1, 1,
-0.2837119, 1.188302, -0.05375991, 1, 0, 0, 1, 1,
-0.2820573, -0.7179181, -2.286281, 1, 0, 0, 1, 1,
-0.2820214, 1.846667, -0.1943885, 0, 0, 0, 1, 1,
-0.2786551, -0.2037434, -0.8362065, 0, 0, 0, 1, 1,
-0.2785889, -0.9936635, -1.872779, 0, 0, 0, 1, 1,
-0.2751316, 0.2547278, -0.3896837, 0, 0, 0, 1, 1,
-0.270531, -1.286674, -5.793344, 0, 0, 0, 1, 1,
-0.2695856, -0.2189849, -2.920817, 0, 0, 0, 1, 1,
-0.2694263, -0.02147473, -2.240684, 0, 0, 0, 1, 1,
-0.257771, 0.2698215, -0.9124052, 1, 1, 1, 1, 1,
-0.2530141, 1.36952, -1.96168, 1, 1, 1, 1, 1,
-0.2471245, -1.377257, -3.782994, 1, 1, 1, 1, 1,
-0.2468372, 2.581043, -0.2805813, 1, 1, 1, 1, 1,
-0.2447394, -0.07250395, -2.551243, 1, 1, 1, 1, 1,
-0.2437939, 1.135439, -2.148932, 1, 1, 1, 1, 1,
-0.2428294, -1.028641, -2.085258, 1, 1, 1, 1, 1,
-0.2325867, 0.1172412, -0.106594, 1, 1, 1, 1, 1,
-0.2325061, -1.272582, -3.10813, 1, 1, 1, 1, 1,
-0.2322166, 0.2913057, -0.238524, 1, 1, 1, 1, 1,
-0.2301246, -0.6313668, -3.755221, 1, 1, 1, 1, 1,
-0.2271221, 0.2852342, -0.7075025, 1, 1, 1, 1, 1,
-0.2263105, 0.3800129, 0.5065575, 1, 1, 1, 1, 1,
-0.2237533, -2.650261, -4.12338, 1, 1, 1, 1, 1,
-0.2236747, 0.07569641, -3.050327, 1, 1, 1, 1, 1,
-0.2236397, 1.257488, 0.3668362, 0, 0, 1, 1, 1,
-0.2203022, 0.7204595, -0.2017662, 1, 0, 0, 1, 1,
-0.2185218, -1.122659, -3.766222, 1, 0, 0, 1, 1,
-0.2097192, -0.2279945, -1.981633, 1, 0, 0, 1, 1,
-0.2094631, -0.8749567, -3.532828, 1, 0, 0, 1, 1,
-0.2076213, 1.199497, 0.307438, 1, 0, 0, 1, 1,
-0.201169, -0.6456061, -3.34587, 0, 0, 0, 1, 1,
-0.2004271, -0.6775379, -2.328623, 0, 0, 0, 1, 1,
-0.2002778, -1.707422, -3.228626, 0, 0, 0, 1, 1,
-0.196108, -0.6982732, -3.006298, 0, 0, 0, 1, 1,
-0.1950799, 0.8241691, 1.360294, 0, 0, 0, 1, 1,
-0.1914196, -0.9923305, -3.56783, 0, 0, 0, 1, 1,
-0.1909949, -0.1203505, -1.945499, 0, 0, 0, 1, 1,
-0.1904508, 0.2446739, -1.855091, 1, 1, 1, 1, 1,
-0.1875379, -0.7317973, -1.696451, 1, 1, 1, 1, 1,
-0.1830761, 0.2226366, -1.841593, 1, 1, 1, 1, 1,
-0.1794822, -0.3101086, -2.851238, 1, 1, 1, 1, 1,
-0.1749707, -0.2705201, -3.350595, 1, 1, 1, 1, 1,
-0.1748194, -0.3799417, -3.542822, 1, 1, 1, 1, 1,
-0.171347, 0.5334865, -0.019315, 1, 1, 1, 1, 1,
-0.1704284, 0.9027093, -3.742424, 1, 1, 1, 1, 1,
-0.1704077, 0.7182488, 0.6069439, 1, 1, 1, 1, 1,
-0.168149, -0.04507264, -1.27838, 1, 1, 1, 1, 1,
-0.166701, 0.9338979, -0.09544235, 1, 1, 1, 1, 1,
-0.1660599, -0.4777664, -1.382751, 1, 1, 1, 1, 1,
-0.1646703, 0.5176756, 1.101194, 1, 1, 1, 1, 1,
-0.1645821, 0.09003155, -1.010607, 1, 1, 1, 1, 1,
-0.1642485, -0.08342189, -2.113527, 1, 1, 1, 1, 1,
-0.1611607, 1.082407, -1.759115, 0, 0, 1, 1, 1,
-0.154162, 0.003508682, -0.7260994, 1, 0, 0, 1, 1,
-0.1531479, -0.3030489, -2.431754, 1, 0, 0, 1, 1,
-0.1523485, -1.160913, -1.025241, 1, 0, 0, 1, 1,
-0.1519017, -0.5280929, -2.488778, 1, 0, 0, 1, 1,
-0.142196, 1.964316, 0.6737627, 1, 0, 0, 1, 1,
-0.1361617, 0.5791814, -1.64229, 0, 0, 0, 1, 1,
-0.135733, 1.599713, 0.348411, 0, 0, 0, 1, 1,
-0.1350451, -0.1911483, -3.161393, 0, 0, 0, 1, 1,
-0.1319654, 0.2326437, -0.1469459, 0, 0, 0, 1, 1,
-0.1301371, 1.42326, -1.152363, 0, 0, 0, 1, 1,
-0.1280682, 0.1022151, -0.612423, 0, 0, 0, 1, 1,
-0.1252029, -0.07589805, -2.260237, 0, 0, 0, 1, 1,
-0.1219056, 1.323216, -1.577569, 1, 1, 1, 1, 1,
-0.1169513, -0.1160137, -0.8582151, 1, 1, 1, 1, 1,
-0.116245, -1.364841, -1.502801, 1, 1, 1, 1, 1,
-0.1093697, -1.543193, -3.800186, 1, 1, 1, 1, 1,
-0.1080183, -0.2483833, -1.83051, 1, 1, 1, 1, 1,
-0.1005504, 0.3998307, 0.8474239, 1, 1, 1, 1, 1,
-0.1003035, -0.2004614, -3.466285, 1, 1, 1, 1, 1,
-0.09943312, -0.5659139, -2.340372, 1, 1, 1, 1, 1,
-0.09943168, 0.03327879, -1.460809, 1, 1, 1, 1, 1,
-0.09728793, 0.8455792, 1.311006, 1, 1, 1, 1, 1,
-0.09720258, -0.710044, -2.730791, 1, 1, 1, 1, 1,
-0.09543155, -0.3400488, -4.068272, 1, 1, 1, 1, 1,
-0.09372187, -0.4695935, -2.85098, 1, 1, 1, 1, 1,
-0.08869208, -1.358847, -2.8642, 1, 1, 1, 1, 1,
-0.08660801, -0.8283365, -3.051791, 1, 1, 1, 1, 1,
-0.08577631, 0.2545932, -0.0687609, 0, 0, 1, 1, 1,
-0.08129502, -2.458563, -4.735839, 1, 0, 0, 1, 1,
-0.08122122, -0.1263069, -3.50182, 1, 0, 0, 1, 1,
-0.08001066, -0.7781503, -3.668334, 1, 0, 0, 1, 1,
-0.07464199, 1.507763, 1.034527, 1, 0, 0, 1, 1,
-0.0682703, -0.2698527, -2.746213, 1, 0, 0, 1, 1,
-0.06554264, -0.9607517, -3.133928, 0, 0, 0, 1, 1,
-0.06553638, -1.332618, -2.037819, 0, 0, 0, 1, 1,
-0.06354595, -0.8060099, -3.701978, 0, 0, 0, 1, 1,
-0.06272732, 0.3624706, -0.3384854, 0, 0, 0, 1, 1,
-0.06213032, 0.1947255, -0.4223551, 0, 0, 0, 1, 1,
-0.05965242, -0.09774766, -1.752268, 0, 0, 0, 1, 1,
-0.05613099, -0.6778261, -3.452503, 0, 0, 0, 1, 1,
-0.05578008, -0.1383472, -3.009464, 1, 1, 1, 1, 1,
-0.05446637, 1.379031, -0.9896479, 1, 1, 1, 1, 1,
-0.0534257, -0.106822, -3.229968, 1, 1, 1, 1, 1,
-0.04692436, -1.058222, -3.045559, 1, 1, 1, 1, 1,
-0.04575574, 1.444517, -0.808293, 1, 1, 1, 1, 1,
-0.04143659, 0.3385883, 0.5764748, 1, 1, 1, 1, 1,
-0.03788015, -0.4725361, -5.08206, 1, 1, 1, 1, 1,
-0.0362991, 0.2220711, 0.2074619, 1, 1, 1, 1, 1,
-0.03624137, -0.8968992, -4.865037, 1, 1, 1, 1, 1,
-0.03538052, 0.4348662, 0.3962075, 1, 1, 1, 1, 1,
-0.03505452, -0.8326542, -3.178274, 1, 1, 1, 1, 1,
-0.03321097, 0.3749597, -0.1756888, 1, 1, 1, 1, 1,
-0.03276777, 0.1755111, -0.6261891, 1, 1, 1, 1, 1,
-0.03194769, -0.7717424, -1.204396, 1, 1, 1, 1, 1,
-0.02911342, -0.6863809, -2.191207, 1, 1, 1, 1, 1,
-0.02883226, 0.3260614, 1.479804, 0, 0, 1, 1, 1,
-0.02855862, -1.051924, -3.383616, 1, 0, 0, 1, 1,
-0.02157984, -0.3963804, -3.520643, 1, 0, 0, 1, 1,
-0.02130976, 0.887242, -0.8760341, 1, 0, 0, 1, 1,
-0.0212857, 1.071168, -1.766199, 1, 0, 0, 1, 1,
-0.02027274, 2.144025, -0.1894896, 1, 0, 0, 1, 1,
-0.01880262, 0.06832943, 2.399234, 0, 0, 0, 1, 1,
-0.01742688, -0.2454408, -3.780648, 0, 0, 0, 1, 1,
-0.01131029, -0.5641037, -1.774378, 0, 0, 0, 1, 1,
-0.0004119799, -0.03779282, -2.768203, 0, 0, 0, 1, 1,
0.004064494, -0.580736, 2.747917, 0, 0, 0, 1, 1,
0.00488914, 1.43467, 1.322931, 0, 0, 0, 1, 1,
0.009179913, -0.2810757, 3.970807, 0, 0, 0, 1, 1,
0.01383065, -1.303273, 2.976388, 1, 1, 1, 1, 1,
0.02611522, 0.9033535, 1.516071, 1, 1, 1, 1, 1,
0.02771687, 0.2936239, 0.999186, 1, 1, 1, 1, 1,
0.02844629, 0.1026173, -0.4578906, 1, 1, 1, 1, 1,
0.02871101, 0.6979028, 0.08789253, 1, 1, 1, 1, 1,
0.03030607, 2.053616, -0.6707097, 1, 1, 1, 1, 1,
0.03085124, -0.7404835, 3.712207, 1, 1, 1, 1, 1,
0.03170048, -0.5089552, 1.722588, 1, 1, 1, 1, 1,
0.03331818, -1.643567, 3.70011, 1, 1, 1, 1, 1,
0.03427692, -0.3014609, 4.817922, 1, 1, 1, 1, 1,
0.03446789, 0.2522868, 1.038846, 1, 1, 1, 1, 1,
0.03569368, -0.6820307, 3.675094, 1, 1, 1, 1, 1,
0.04007103, 0.6215724, -0.473147, 1, 1, 1, 1, 1,
0.05109368, 0.2023342, -0.201116, 1, 1, 1, 1, 1,
0.05563159, 0.8977664, -1.467407, 1, 1, 1, 1, 1,
0.05763074, 0.2282066, 1.40536, 0, 0, 1, 1, 1,
0.0625184, -0.8665516, 5.129071, 1, 0, 0, 1, 1,
0.06419814, -0.7315965, 2.796348, 1, 0, 0, 1, 1,
0.06942296, 1.90384, 0.6021909, 1, 0, 0, 1, 1,
0.07037097, 0.2612368, -2.841912, 1, 0, 0, 1, 1,
0.07080471, -0.1877309, 3.372529, 1, 0, 0, 1, 1,
0.07673158, -2.254525, 2.022113, 0, 0, 0, 1, 1,
0.07769993, 0.04440606, 0.4131859, 0, 0, 0, 1, 1,
0.07852344, -0.4176725, 3.41625, 0, 0, 0, 1, 1,
0.07897836, -0.06849223, 3.292872, 0, 0, 0, 1, 1,
0.08418757, 1.756442, -0.1852709, 0, 0, 0, 1, 1,
0.08424841, 0.8539963, 0.2484101, 0, 0, 0, 1, 1,
0.08512072, -1.023502, 3.63572, 0, 0, 0, 1, 1,
0.08571969, 0.3627649, 0.3689488, 1, 1, 1, 1, 1,
0.08673991, -0.003276513, 2.763291, 1, 1, 1, 1, 1,
0.09422857, -0.3022931, 2.234533, 1, 1, 1, 1, 1,
0.1032601, -0.05224802, 0.9465417, 1, 1, 1, 1, 1,
0.1052375, -1.055378, 2.165899, 1, 1, 1, 1, 1,
0.1115994, 1.211494, -0.004953265, 1, 1, 1, 1, 1,
0.1123697, 0.6813923, -0.8185496, 1, 1, 1, 1, 1,
0.1135664, -1.698153, 4.022988, 1, 1, 1, 1, 1,
0.114116, 0.6577911, -0.1803911, 1, 1, 1, 1, 1,
0.1158255, 0.576854, 0.3617248, 1, 1, 1, 1, 1,
0.1187503, 0.5276316, -0.9377159, 1, 1, 1, 1, 1,
0.1211536, -0.9265823, 3.956653, 1, 1, 1, 1, 1,
0.1211808, -0.472439, 2.248983, 1, 1, 1, 1, 1,
0.1241362, -0.2735714, 3.265827, 1, 1, 1, 1, 1,
0.1254559, -1.984113, 1.936095, 1, 1, 1, 1, 1,
0.1255652, -1.045132, 2.855603, 0, 0, 1, 1, 1,
0.1256607, -0.7283197, 2.889918, 1, 0, 0, 1, 1,
0.1275058, -0.5061484, 2.309704, 1, 0, 0, 1, 1,
0.1298337, 1.472436, 1.811309, 1, 0, 0, 1, 1,
0.1323705, -0.7724532, 2.806587, 1, 0, 0, 1, 1,
0.134225, 1.352605, -0.03975806, 1, 0, 0, 1, 1,
0.1346879, 0.2718149, -0.9741023, 0, 0, 0, 1, 1,
0.1363363, 1.757611, -1.275878, 0, 0, 0, 1, 1,
0.1365067, 1.0023, -1.033077, 0, 0, 0, 1, 1,
0.1368227, -2.290429, 3.202058, 0, 0, 0, 1, 1,
0.1371565, 0.9774476, 0.4056322, 0, 0, 0, 1, 1,
0.1408076, 0.2787125, 1.038235, 0, 0, 0, 1, 1,
0.1440966, 0.2728604, -0.5926955, 0, 0, 0, 1, 1,
0.1448897, -0.3495982, 1.973082, 1, 1, 1, 1, 1,
0.1476113, -0.4653113, 3.061822, 1, 1, 1, 1, 1,
0.1479494, 0.5911058, -0.0009471435, 1, 1, 1, 1, 1,
0.1493096, 0.370456, 0.8524826, 1, 1, 1, 1, 1,
0.1495231, 1.504446, -0.7005375, 1, 1, 1, 1, 1,
0.1507984, 1.197598, 1.1391, 1, 1, 1, 1, 1,
0.151929, -1.25001, 1.582089, 1, 1, 1, 1, 1,
0.15597, 0.6420789, 0.1342203, 1, 1, 1, 1, 1,
0.1585991, 1.211676, 0.5561925, 1, 1, 1, 1, 1,
0.1588259, -0.3819084, 4.766415, 1, 1, 1, 1, 1,
0.1648787, 0.3880644, 0.4590139, 1, 1, 1, 1, 1,
0.1678026, -0.6452703, 2.910358, 1, 1, 1, 1, 1,
0.1680624, -0.01370632, 2.666608, 1, 1, 1, 1, 1,
0.1717892, -1.228673, 4.77183, 1, 1, 1, 1, 1,
0.174372, 0.6749563, 0.3936961, 1, 1, 1, 1, 1,
0.1779344, -2.382662, 4.000522, 0, 0, 1, 1, 1,
0.1780288, 0.5362259, -0.3656284, 1, 0, 0, 1, 1,
0.1786112, -0.7151759, 4.091619, 1, 0, 0, 1, 1,
0.1818736, -1.032493, 2.094424, 1, 0, 0, 1, 1,
0.1833774, 0.2206438, 0.4029059, 1, 0, 0, 1, 1,
0.1834394, -0.01445126, 2.196917, 1, 0, 0, 1, 1,
0.1836315, -1.715152, 2.537085, 0, 0, 0, 1, 1,
0.1839347, -0.2076816, 3.048375, 0, 0, 0, 1, 1,
0.185519, 0.02471456, 0.155677, 0, 0, 0, 1, 1,
0.1878734, -0.3827283, 1.722392, 0, 0, 0, 1, 1,
0.1880327, -0.6146145, 3.923848, 0, 0, 0, 1, 1,
0.1905457, 0.2104186, 0.4630314, 0, 0, 0, 1, 1,
0.1908057, 0.7704005, 0.7178432, 0, 0, 0, 1, 1,
0.1929787, 0.5355222, -1.44993, 1, 1, 1, 1, 1,
0.1984646, 0.7323806, 0.6340834, 1, 1, 1, 1, 1,
0.2035432, 2.22062, 2.482298e-05, 1, 1, 1, 1, 1,
0.2041892, -1.057195, 2.871904, 1, 1, 1, 1, 1,
0.2061557, 1.064449, -1.028701, 1, 1, 1, 1, 1,
0.2087375, 1.272258, -0.4892458, 1, 1, 1, 1, 1,
0.2187985, 0.15628, 2.694817, 1, 1, 1, 1, 1,
0.2213538, 0.04083942, 3.293859, 1, 1, 1, 1, 1,
0.224142, 1.422923, -0.9121048, 1, 1, 1, 1, 1,
0.2254857, 0.5764053, -0.4632347, 1, 1, 1, 1, 1,
0.2258763, 0.899994, -0.02605208, 1, 1, 1, 1, 1,
0.2264649, 0.08290979, 3.250845, 1, 1, 1, 1, 1,
0.2306686, -0.08160223, 4.004959, 1, 1, 1, 1, 1,
0.2330342, 0.4348601, 0.4065984, 1, 1, 1, 1, 1,
0.2354097, 0.08480573, 0.466173, 1, 1, 1, 1, 1,
0.2452631, -0.01520468, 1.286741, 0, 0, 1, 1, 1,
0.2484072, 0.9467432, 2.541644, 1, 0, 0, 1, 1,
0.2484273, 0.1042451, -0.3695346, 1, 0, 0, 1, 1,
0.2532046, -1.986631, 4.469921, 1, 0, 0, 1, 1,
0.2587188, 2.089106, -0.943368, 1, 0, 0, 1, 1,
0.2591276, -0.01352498, 1.628075, 1, 0, 0, 1, 1,
0.2663226, -1.454288, 2.95274, 0, 0, 0, 1, 1,
0.2687374, -2.967931, 1.990526, 0, 0, 0, 1, 1,
0.270493, -0.7833615, 3.16189, 0, 0, 0, 1, 1,
0.2719572, 0.3631184, -1.307264, 0, 0, 0, 1, 1,
0.2726133, 1.524297, 1.192762, 0, 0, 0, 1, 1,
0.2737905, -2.101929, 3.808856, 0, 0, 0, 1, 1,
0.2749746, -1.180759, 2.287579, 0, 0, 0, 1, 1,
0.2877256, -0.1472775, 0.3208743, 1, 1, 1, 1, 1,
0.2910514, 0.1769168, 1.454395, 1, 1, 1, 1, 1,
0.2977514, 0.1664315, 0.5989181, 1, 1, 1, 1, 1,
0.3020245, -1.250136, 1.751572, 1, 1, 1, 1, 1,
0.302278, -1.838716, 4.373054, 1, 1, 1, 1, 1,
0.3036776, 0.8602841, -0.4213047, 1, 1, 1, 1, 1,
0.3047198, -1.38112, 4.129724, 1, 1, 1, 1, 1,
0.306338, 0.3443259, 0.658184, 1, 1, 1, 1, 1,
0.3065152, 1.469903, -0.4077698, 1, 1, 1, 1, 1,
0.3088515, -1.482708, 0.8938404, 1, 1, 1, 1, 1,
0.3091674, 0.8295925, -1.360084, 1, 1, 1, 1, 1,
0.3120578, 1.034858, 1.26921, 1, 1, 1, 1, 1,
0.3159904, -0.5402108, 2.924329, 1, 1, 1, 1, 1,
0.319737, -0.08495161, 2.244344, 1, 1, 1, 1, 1,
0.3244802, -0.1698424, 1.628392, 1, 1, 1, 1, 1,
0.3277211, 1.160969, -0.6908845, 0, 0, 1, 1, 1,
0.3277653, -1.540534, 4.515953, 1, 0, 0, 1, 1,
0.3279916, -0.5636848, 3.884738, 1, 0, 0, 1, 1,
0.3290114, 1.238574, 0.9599459, 1, 0, 0, 1, 1,
0.3292522, -0.4963633, 2.64988, 1, 0, 0, 1, 1,
0.3307761, -1.240765, 2.838771, 1, 0, 0, 1, 1,
0.3313302, 0.2871622, 1.126319, 0, 0, 0, 1, 1,
0.3358058, 1.251009, -0.8750591, 0, 0, 0, 1, 1,
0.3394902, -1.051956, 3.806913, 0, 0, 0, 1, 1,
0.34141, 0.7380804, 1.291612, 0, 0, 0, 1, 1,
0.3447157, -0.3360105, 1.536241, 0, 0, 0, 1, 1,
0.3475652, 1.735666, -0.8093143, 0, 0, 0, 1, 1,
0.3487722, 0.56914, 1.567832, 0, 0, 0, 1, 1,
0.3513646, 1.41971, 0.9611145, 1, 1, 1, 1, 1,
0.3539074, -0.7991267, 2.29129, 1, 1, 1, 1, 1,
0.3541042, -0.3929314, 0.9050354, 1, 1, 1, 1, 1,
0.3552602, -0.5059689, 2.616277, 1, 1, 1, 1, 1,
0.3562172, 0.1517505, 1.446544, 1, 1, 1, 1, 1,
0.35715, 0.9945809, 0.09300202, 1, 1, 1, 1, 1,
0.3571664, 0.2835467, 0.1292087, 1, 1, 1, 1, 1,
0.3655816, -0.3226183, 1.906408, 1, 1, 1, 1, 1,
0.3656991, -0.3567477, 2.248285, 1, 1, 1, 1, 1,
0.3683689, 0.4365036, 0.4648664, 1, 1, 1, 1, 1,
0.3700865, -0.899881, 3.618913, 1, 1, 1, 1, 1,
0.3703635, -0.1125237, 0.6511939, 1, 1, 1, 1, 1,
0.3730126, 0.1379971, 0.9163559, 1, 1, 1, 1, 1,
0.3742569, 0.5935175, -0.2406874, 1, 1, 1, 1, 1,
0.3757479, -1.697315, 4.501054, 1, 1, 1, 1, 1,
0.3770908, -1.055439, 3.001228, 0, 0, 1, 1, 1,
0.3826409, 0.427231, 0.9932661, 1, 0, 0, 1, 1,
0.392965, 0.5966513, -0.3338441, 1, 0, 0, 1, 1,
0.3949802, -1.505564, 1.898897, 1, 0, 0, 1, 1,
0.4026909, 1.343975, -0.1976446, 1, 0, 0, 1, 1,
0.4083715, -0.423506, 1.749225, 1, 0, 0, 1, 1,
0.4092872, -1.48809, 3.476394, 0, 0, 0, 1, 1,
0.409965, -1.269411, 2.459029, 0, 0, 0, 1, 1,
0.4100237, 0.2734564, 1.847889, 0, 0, 0, 1, 1,
0.4161459, -0.5634816, 1.664186, 0, 0, 0, 1, 1,
0.4210796, 0.07359223, 1.289133, 0, 0, 0, 1, 1,
0.4211443, 2.600263, 0.2902015, 0, 0, 0, 1, 1,
0.4211701, -0.2645562, 1.287114, 0, 0, 0, 1, 1,
0.4214506, 0.4436183, 1.066977, 1, 1, 1, 1, 1,
0.422884, 2.106693, -0.1467135, 1, 1, 1, 1, 1,
0.4242537, 1.112285, 1.953333, 1, 1, 1, 1, 1,
0.4261847, 0.6066885, -0.1014784, 1, 1, 1, 1, 1,
0.4262745, 0.01093074, 3.03446, 1, 1, 1, 1, 1,
0.4265513, -0.4259554, 1.357514, 1, 1, 1, 1, 1,
0.4288834, 1.312129, 1.765677, 1, 1, 1, 1, 1,
0.4291418, -0.6725715, 2.241861, 1, 1, 1, 1, 1,
0.4357062, 0.9949775, -1.420312, 1, 1, 1, 1, 1,
0.4395194, 0.1440358, 0.6016963, 1, 1, 1, 1, 1,
0.4478345, -2.503335, 1.842161, 1, 1, 1, 1, 1,
0.449829, 0.9671605, -1.185078, 1, 1, 1, 1, 1,
0.4591274, 0.6364722, 0.7362359, 1, 1, 1, 1, 1,
0.460551, -0.3413399, 2.788865, 1, 1, 1, 1, 1,
0.4606614, 1.096045, 1.230363, 1, 1, 1, 1, 1,
0.4642431, -0.5021433, 3.23697, 0, 0, 1, 1, 1,
0.4695077, -1.483407, 3.810252, 1, 0, 0, 1, 1,
0.4778941, 0.04513621, -0.5760302, 1, 0, 0, 1, 1,
0.4787067, 0.3907197, 2.820095, 1, 0, 0, 1, 1,
0.4794053, -0.1026686, 1.08822, 1, 0, 0, 1, 1,
0.4794657, -0.1236777, 0.2310112, 1, 0, 0, 1, 1,
0.4822573, 0.839989, -0.9826262, 0, 0, 0, 1, 1,
0.4846643, -2.051532, 2.040892, 0, 0, 0, 1, 1,
0.488022, 0.4073901, 1.447592, 0, 0, 0, 1, 1,
0.4922732, -0.4057459, 2.464248, 0, 0, 0, 1, 1,
0.4942427, 2.292546, 0.8238086, 0, 0, 0, 1, 1,
0.5018635, -0.05531945, 0.590387, 0, 0, 0, 1, 1,
0.5040823, 0.5193273, 0.6824544, 0, 0, 0, 1, 1,
0.5141982, 0.2856942, 0.6471168, 1, 1, 1, 1, 1,
0.5176787, 1.517298, 1.061876, 1, 1, 1, 1, 1,
0.5192729, 0.6610385, 0.995297, 1, 1, 1, 1, 1,
0.5214367, -0.2173273, 2.636651, 1, 1, 1, 1, 1,
0.5257332, -1.040161, 1.335772, 1, 1, 1, 1, 1,
0.5284343, -0.7628627, 1.868921, 1, 1, 1, 1, 1,
0.535037, 2.407462, -0.4416035, 1, 1, 1, 1, 1,
0.5351995, -1.359809, 2.23068, 1, 1, 1, 1, 1,
0.5356067, -2.086648, 2.826241, 1, 1, 1, 1, 1,
0.5373533, -0.3157139, 1.838154, 1, 1, 1, 1, 1,
0.5496958, 1.763131, -0.1185009, 1, 1, 1, 1, 1,
0.5522777, -1.131413, 3.102852, 1, 1, 1, 1, 1,
0.5567715, -0.6290725, 2.200963, 1, 1, 1, 1, 1,
0.5605664, 0.7009486, 0.7222037, 1, 1, 1, 1, 1,
0.5695218, 1.149276, 1.668635, 1, 1, 1, 1, 1,
0.5704268, -0.2103251, 2.2032, 0, 0, 1, 1, 1,
0.570934, 1.245802, -0.5078037, 1, 0, 0, 1, 1,
0.5776821, -0.05175428, 1.643918, 1, 0, 0, 1, 1,
0.581303, 1.332049, -0.205729, 1, 0, 0, 1, 1,
0.5869283, 0.1856525, 2.664712, 1, 0, 0, 1, 1,
0.5934098, -0.5503498, 2.883529, 1, 0, 0, 1, 1,
0.5935565, -0.1042159, 3.07138, 0, 0, 0, 1, 1,
0.595678, -0.04706713, 0.6037911, 0, 0, 0, 1, 1,
0.5958518, -1.006495, 1.758995, 0, 0, 0, 1, 1,
0.5986007, -0.438189, 2.572697, 0, 0, 0, 1, 1,
0.6002461, 1.1516, 0.4522546, 0, 0, 0, 1, 1,
0.6005694, 0.1059553, 2.538317, 0, 0, 0, 1, 1,
0.6036068, -0.8853642, 4.738256, 0, 0, 0, 1, 1,
0.6058946, -0.2841218, 1.682997, 1, 1, 1, 1, 1,
0.6066316, 0.14771, 1.395908, 1, 1, 1, 1, 1,
0.6069983, -1.117946, 2.800313, 1, 1, 1, 1, 1,
0.6080418, -0.3595969, 1.956195, 1, 1, 1, 1, 1,
0.6197134, 0.6915604, 1.43116, 1, 1, 1, 1, 1,
0.6230248, -1.733108, 3.662815, 1, 1, 1, 1, 1,
0.6235918, 1.080366, -0.2794044, 1, 1, 1, 1, 1,
0.6238832, 0.8909281, -0.8645266, 1, 1, 1, 1, 1,
0.6257489, 0.3835073, -1.262222, 1, 1, 1, 1, 1,
0.6272053, -1.013337, 2.34735, 1, 1, 1, 1, 1,
0.6295359, -1.195565, 1.953403, 1, 1, 1, 1, 1,
0.6337451, 2.213828, -0.344232, 1, 1, 1, 1, 1,
0.6348922, 0.437098, 0.1474962, 1, 1, 1, 1, 1,
0.635736, 0.3602695, 1.19404, 1, 1, 1, 1, 1,
0.6429664, -0.7260772, 1.343743, 1, 1, 1, 1, 1,
0.6469511, -0.1823528, 1.702611, 0, 0, 1, 1, 1,
0.6480759, -0.6236307, 2.936761, 1, 0, 0, 1, 1,
0.6492971, -0.1723469, 0.7882307, 1, 0, 0, 1, 1,
0.6495334, 0.5396121, 0.9084647, 1, 0, 0, 1, 1,
0.651608, 0.4068965, 1.870428, 1, 0, 0, 1, 1,
0.6529441, -0.3766647, 1.529772, 1, 0, 0, 1, 1,
0.653898, -0.03156992, 1.875185, 0, 0, 0, 1, 1,
0.6602969, -1.689628, 2.734783, 0, 0, 0, 1, 1,
0.6672825, 0.3184368, 1.048202, 0, 0, 0, 1, 1,
0.672268, 0.4976284, 1.917155, 0, 0, 0, 1, 1,
0.6745415, 0.2351772, 0.8720351, 0, 0, 0, 1, 1,
0.6772699, -1.266624, 4.059547, 0, 0, 0, 1, 1,
0.6848569, -0.8280042, 0.6067155, 0, 0, 0, 1, 1,
0.6873524, -0.3605897, 0.9975068, 1, 1, 1, 1, 1,
0.6884741, -1.365236, 1.27464, 1, 1, 1, 1, 1,
0.6947409, -1.047084, 4.395614, 1, 1, 1, 1, 1,
0.705909, -0.2873565, 1.476066, 1, 1, 1, 1, 1,
0.7071462, -0.9696279, 2.538278, 1, 1, 1, 1, 1,
0.7130503, 1.285552, -0.2530548, 1, 1, 1, 1, 1,
0.7164789, -0.4973126, 2.716621, 1, 1, 1, 1, 1,
0.7323958, -1.114439, 2.753518, 1, 1, 1, 1, 1,
0.7326838, -0.9671675, 2.248648, 1, 1, 1, 1, 1,
0.7406918, 1.293566, 0.140405, 1, 1, 1, 1, 1,
0.7419363, 1.406559, 0.9193221, 1, 1, 1, 1, 1,
0.7431104, 0.1843722, 0.7361905, 1, 1, 1, 1, 1,
0.7441848, -1.185002, 1.338582, 1, 1, 1, 1, 1,
0.7465432, 0.6567575, -0.1636968, 1, 1, 1, 1, 1,
0.7522026, 0.1785078, 0.5127735, 1, 1, 1, 1, 1,
0.7540743, -0.9648539, 1.593259, 0, 0, 1, 1, 1,
0.76809, -0.2134033, 2.257129, 1, 0, 0, 1, 1,
0.7687705, 0.9294479, -0.2526079, 1, 0, 0, 1, 1,
0.7746064, -0.147448, 1.376411, 1, 0, 0, 1, 1,
0.7748031, -0.0309852, 1.614076, 1, 0, 0, 1, 1,
0.7804635, 0.9107257, 1.749826, 1, 0, 0, 1, 1,
0.780686, 0.92166, 1.616351, 0, 0, 0, 1, 1,
0.7827894, 0.333259, 0.7925053, 0, 0, 0, 1, 1,
0.784559, 1.835304, 0.06857239, 0, 0, 0, 1, 1,
0.7852618, -0.8705923, 0.5720474, 0, 0, 0, 1, 1,
0.7995261, 0.3625979, 1.199647, 0, 0, 0, 1, 1,
0.7995265, -1.040175, 3.013953, 0, 0, 0, 1, 1,
0.8037931, 0.1740422, 0.9818569, 0, 0, 0, 1, 1,
0.8092667, 0.8046976, 0.3491383, 1, 1, 1, 1, 1,
0.8269747, -0.5147501, 2.508912, 1, 1, 1, 1, 1,
0.8291482, -0.6939251, 2.850719, 1, 1, 1, 1, 1,
0.8464936, -0.599156, 2.416028, 1, 1, 1, 1, 1,
0.8467391, 0.3258151, 1.629749, 1, 1, 1, 1, 1,
0.8499737, -1.078198, 1.238251, 1, 1, 1, 1, 1,
0.8519372, -0.6891538, 3.627313, 1, 1, 1, 1, 1,
0.8528311, -0.2634518, 0.08883506, 1, 1, 1, 1, 1,
0.8531088, -2.363019, 2.291631, 1, 1, 1, 1, 1,
0.8552161, -1.803317, 4.400249, 1, 1, 1, 1, 1,
0.8556978, -0.7508371, 1.692515, 1, 1, 1, 1, 1,
0.8577773, -1.319889, 1.971622, 1, 1, 1, 1, 1,
0.8660641, 1.95773, 0.8187964, 1, 1, 1, 1, 1,
0.8713148, -1.590446, 1.753132, 1, 1, 1, 1, 1,
0.8748128, -1.227345, 1.336874, 1, 1, 1, 1, 1,
0.8794447, -0.9068225, 2.330885, 0, 0, 1, 1, 1,
0.8896375, -0.4621248, 2.655268, 1, 0, 0, 1, 1,
0.8900503, 0.9608667, 1.385153, 1, 0, 0, 1, 1,
0.8984477, 0.4641521, 1.233748, 1, 0, 0, 1, 1,
0.9013215, -1.065295, 1.979624, 1, 0, 0, 1, 1,
0.901649, -1.502086, 1.484009, 1, 0, 0, 1, 1,
0.9046138, 2.112876, -0.4391619, 0, 0, 0, 1, 1,
0.9054793, 0.08667254, 0.8069224, 0, 0, 0, 1, 1,
0.9058281, -2.4563, 4.159364, 0, 0, 0, 1, 1,
0.9118637, -0.01374382, 2.008757, 0, 0, 0, 1, 1,
0.9146588, 0.0828727, 1.693639, 0, 0, 0, 1, 1,
0.9149908, 0.6386846, 1.084635, 0, 0, 0, 1, 1,
0.9167735, 1.776028, 1.520838, 0, 0, 0, 1, 1,
0.9205277, -0.5484942, 2.281758, 1, 1, 1, 1, 1,
0.9210221, -0.3283435, 2.550182, 1, 1, 1, 1, 1,
0.9308966, -0.5145343, 2.684202, 1, 1, 1, 1, 1,
0.93193, 0.7112366, 2.696318, 1, 1, 1, 1, 1,
0.9357359, 0.1849364, 0.0149503, 1, 1, 1, 1, 1,
0.9376811, -1.861667, 1.987501, 1, 1, 1, 1, 1,
0.9412805, 1.967492, 1.507452, 1, 1, 1, 1, 1,
0.9448186, -0.6863211, -0.9303551, 1, 1, 1, 1, 1,
0.9459678, -2.046795, 0.8300472, 1, 1, 1, 1, 1,
0.9486545, 0.189446, 1.636267, 1, 1, 1, 1, 1,
0.9502758, -0.4767844, 1.920419, 1, 1, 1, 1, 1,
0.9575012, 0.872559, -0.1109527, 1, 1, 1, 1, 1,
0.9618886, 0.07750901, 1.552925, 1, 1, 1, 1, 1,
0.9623488, 0.1052837, 0.5492483, 1, 1, 1, 1, 1,
0.9634752, -1.298611, 2.93422, 1, 1, 1, 1, 1,
0.9647765, 0.105268, 1.812863, 0, 0, 1, 1, 1,
0.9671494, -0.001703439, 2.552471, 1, 0, 0, 1, 1,
0.9706742, 0.4624808, 0.2624029, 1, 0, 0, 1, 1,
0.9949165, -2.432702, 5.08761, 1, 0, 0, 1, 1,
0.9977859, -0.1173108, 1.738874, 1, 0, 0, 1, 1,
1.00424, 0.8057799, -0.1919859, 1, 0, 0, 1, 1,
1.015345, 0.2331988, 0.1319104, 0, 0, 0, 1, 1,
1.017825, 0.4066328, 1.153942, 0, 0, 0, 1, 1,
1.019524, -1.563016, 4.406406, 0, 0, 0, 1, 1,
1.01993, -0.7542788, 2.237408, 0, 0, 0, 1, 1,
1.026835, -0.8659909, 2.19721, 0, 0, 0, 1, 1,
1.030663, 0.7994198, 0.8834392, 0, 0, 0, 1, 1,
1.037681, -1.414861, 1.848709, 0, 0, 0, 1, 1,
1.037991, -0.976655, 2.10995, 1, 1, 1, 1, 1,
1.039268, 0.8153149, 0.1800439, 1, 1, 1, 1, 1,
1.046075, -0.5370202, 3.225488, 1, 1, 1, 1, 1,
1.051371, -0.9299759, 4.193305, 1, 1, 1, 1, 1,
1.055573, 0.1017884, 0.5753098, 1, 1, 1, 1, 1,
1.065608, -2.513714, 2.303333, 1, 1, 1, 1, 1,
1.075606, 0.4184291, 1.8793, 1, 1, 1, 1, 1,
1.085629, -0.9038428, 2.677254, 1, 1, 1, 1, 1,
1.08795, 0.139991, 1.535061, 1, 1, 1, 1, 1,
1.088132, -0.46005, 1.407435, 1, 1, 1, 1, 1,
1.093316, 2.228475, 0.4980489, 1, 1, 1, 1, 1,
1.106867, -0.2616327, 1.185862, 1, 1, 1, 1, 1,
1.113567, 0.4426435, 1.711002, 1, 1, 1, 1, 1,
1.115933, -0.1363623, 1.942913, 1, 1, 1, 1, 1,
1.118086, -0.6777198, 3.227677, 1, 1, 1, 1, 1,
1.120909, -0.6872842, 1.719424, 0, 0, 1, 1, 1,
1.121429, -0.01527044, 1.108349, 1, 0, 0, 1, 1,
1.122584, -0.208898, 1.36749, 1, 0, 0, 1, 1,
1.126542, 0.6930918, 1.212084, 1, 0, 0, 1, 1,
1.1301, 0.998117, -0.6211258, 1, 0, 0, 1, 1,
1.14764, 1.289929, 2.090685, 1, 0, 0, 1, 1,
1.148297, 1.779226, 1.453662, 0, 0, 0, 1, 1,
1.150738, -1.579245, 3.211715, 0, 0, 0, 1, 1,
1.152539, 0.01378644, 1.41072, 0, 0, 0, 1, 1,
1.153251, -1.622141, 1.643725, 0, 0, 0, 1, 1,
1.158482, -0.2977529, 1.560833, 0, 0, 0, 1, 1,
1.160023, 0.2626003, 0.6045462, 0, 0, 0, 1, 1,
1.160916, 0.1847452, 1.281933, 0, 0, 0, 1, 1,
1.161082, 0.1696589, -0.1075248, 1, 1, 1, 1, 1,
1.162545, 1.080367, 3.795469, 1, 1, 1, 1, 1,
1.165237, -0.6037053, -0.4105639, 1, 1, 1, 1, 1,
1.17554, 2.386134, -1.094856, 1, 1, 1, 1, 1,
1.18179, 0.5764256, 1.593271, 1, 1, 1, 1, 1,
1.184352, -2.139149, 2.043646, 1, 1, 1, 1, 1,
1.184939, 0.4739621, 1.350966, 1, 1, 1, 1, 1,
1.200609, -0.1095362, 1.70874, 1, 1, 1, 1, 1,
1.200863, 0.1474444, 0.4034196, 1, 1, 1, 1, 1,
1.205298, -1.008908, 1.163836, 1, 1, 1, 1, 1,
1.210392, -0.5335144, -0.5260677, 1, 1, 1, 1, 1,
1.215891, 0.3899077, 1.69867, 1, 1, 1, 1, 1,
1.227216, -0.8793466, 2.865465, 1, 1, 1, 1, 1,
1.234964, 0.3317868, 1.088867, 1, 1, 1, 1, 1,
1.25332, 0.4822521, 2.075728, 1, 1, 1, 1, 1,
1.256892, -1.277035, 2.438254, 0, 0, 1, 1, 1,
1.259198, -0.2523259, 1.835526, 1, 0, 0, 1, 1,
1.260299, 0.06567174, 0.7449601, 1, 0, 0, 1, 1,
1.276587, 0.7004522, 2.684048, 1, 0, 0, 1, 1,
1.289396, 0.6626035, 0.06485847, 1, 0, 0, 1, 1,
1.289854, -0.5957487, 3.495166, 1, 0, 0, 1, 1,
1.298093, -0.939718, 1.06985, 0, 0, 0, 1, 1,
1.299552, 0.1148668, 2.015696, 0, 0, 0, 1, 1,
1.306689, 2.105663, 0.916157, 0, 0, 0, 1, 1,
1.314046, -0.009057138, 1.963925, 0, 0, 0, 1, 1,
1.314084, -1.097408, 0.01116211, 0, 0, 0, 1, 1,
1.331247, 1.157164, 1.04244, 0, 0, 0, 1, 1,
1.333527, -2.297553, 2.607151, 0, 0, 0, 1, 1,
1.343399, -1.012453, 2.274165, 1, 1, 1, 1, 1,
1.347794, 1.908616, -0.331236, 1, 1, 1, 1, 1,
1.350075, -0.487405, 2.141718, 1, 1, 1, 1, 1,
1.353436, -0.5185693, 3.175918, 1, 1, 1, 1, 1,
1.363933, -0.1022582, 1.648489, 1, 1, 1, 1, 1,
1.372699, 1.498904, 0.4089975, 1, 1, 1, 1, 1,
1.374919, 1.860476, 1.199619, 1, 1, 1, 1, 1,
1.376051, -1.23313, 3.52013, 1, 1, 1, 1, 1,
1.385131, -0.4576962, 0.542375, 1, 1, 1, 1, 1,
1.396559, 0.7808235, 1.31259, 1, 1, 1, 1, 1,
1.398361, 1.630249, 1.193297, 1, 1, 1, 1, 1,
1.39875, -0.1760087, 1.271277, 1, 1, 1, 1, 1,
1.399166, -0.408985, 3.720835, 1, 1, 1, 1, 1,
1.399709, 2.584, 0.002252733, 1, 1, 1, 1, 1,
1.400989, 0.2434326, 1.969066, 1, 1, 1, 1, 1,
1.410098, -1.804735, 2.607952, 0, 0, 1, 1, 1,
1.413143, 0.4861297, -0.6279285, 1, 0, 0, 1, 1,
1.419901, -2.125783, 1.369163, 1, 0, 0, 1, 1,
1.430749, 0.03129167, 2.94848, 1, 0, 0, 1, 1,
1.434512, -1.476019, -0.04723608, 1, 0, 0, 1, 1,
1.43908, 0.0419973, 1.777299, 1, 0, 0, 1, 1,
1.442805, -0.3355232, 2.241941, 0, 0, 0, 1, 1,
1.447865, 0.438339, 1.227456, 0, 0, 0, 1, 1,
1.451906, 0.1389008, 0.4928258, 0, 0, 0, 1, 1,
1.473324, 0.8756741, 1.894003, 0, 0, 0, 1, 1,
1.477836, 0.939765, 2.256949, 0, 0, 0, 1, 1,
1.492977, -1.336785, 2.22481, 0, 0, 0, 1, 1,
1.494691, 0.5670798, 2.304115, 0, 0, 0, 1, 1,
1.498434, -1.219621, 2.395527, 1, 1, 1, 1, 1,
1.513125, -0.4580053, 2.44027, 1, 1, 1, 1, 1,
1.515503, -0.4717043, 1.585356, 1, 1, 1, 1, 1,
1.518662, -0.1454455, 1.911446, 1, 1, 1, 1, 1,
1.526146, 0.07944788, 1.909729, 1, 1, 1, 1, 1,
1.528566, 1.136636, 1.024275, 1, 1, 1, 1, 1,
1.542727, 0.08850396, 2.322299, 1, 1, 1, 1, 1,
1.550262, 0.09677783, 1.643869, 1, 1, 1, 1, 1,
1.551855, 0.192556, 2.306495, 1, 1, 1, 1, 1,
1.553364, 1.909127, -1.500525, 1, 1, 1, 1, 1,
1.556889, -2.320866, 3.520145, 1, 1, 1, 1, 1,
1.558483, 0.03249234, 2.127374, 1, 1, 1, 1, 1,
1.563609, -0.5430952, 2.457915, 1, 1, 1, 1, 1,
1.569387, -0.7210813, 1.288957, 1, 1, 1, 1, 1,
1.574837, -1.558494, 1.834827, 1, 1, 1, 1, 1,
1.588369, -0.328139, 2.375099, 0, 0, 1, 1, 1,
1.59925, 0.09526074, 4.542515, 1, 0, 0, 1, 1,
1.621341, 0.8195158, 1.605533, 1, 0, 0, 1, 1,
1.626228, -0.7625602, 2.416346, 1, 0, 0, 1, 1,
1.628678, 0.6785618, 2.95121, 1, 0, 0, 1, 1,
1.654225, -0.3145635, 2.033778, 1, 0, 0, 1, 1,
1.655536, 1.727409, 1.13354, 0, 0, 0, 1, 1,
1.664958, 1.626582, 0.7506462, 0, 0, 0, 1, 1,
1.67068, 1.19348, 1.993073, 0, 0, 0, 1, 1,
1.689538, 0.1187356, 0.3284247, 0, 0, 0, 1, 1,
1.693556, -1.767763, 1.709625, 0, 0, 0, 1, 1,
1.698645, -1.489726, 1.477045, 0, 0, 0, 1, 1,
1.716931, 0.1454667, 2.706549, 0, 0, 0, 1, 1,
1.737816, 1.985792, -0.1090258, 1, 1, 1, 1, 1,
1.755067, -0.1256528, 2.259095, 1, 1, 1, 1, 1,
1.767417, -0.1165795, 2.707785, 1, 1, 1, 1, 1,
1.7725, 1.391038, 2.573322, 1, 1, 1, 1, 1,
1.805468, -1.05557, 2.625464, 1, 1, 1, 1, 1,
1.810315, -0.674865, 2.659284, 1, 1, 1, 1, 1,
1.82, 0.8063891, 0.9985532, 1, 1, 1, 1, 1,
1.838936, 0.274286, 3.093766, 1, 1, 1, 1, 1,
1.841878, -1.374675, 2.006862, 1, 1, 1, 1, 1,
1.843742, 0.2510848, 2.086788, 1, 1, 1, 1, 1,
1.849212, 0.403527, 2.036266, 1, 1, 1, 1, 1,
1.852718, -0.2912602, 1.833672, 1, 1, 1, 1, 1,
1.874187, 2.053633, 1.339481, 1, 1, 1, 1, 1,
1.88382, -0.7128651, 1.873647, 1, 1, 1, 1, 1,
1.889847, 0.1640627, -0.6979588, 1, 1, 1, 1, 1,
1.951524, 0.1234655, 1.521256, 0, 0, 1, 1, 1,
2.012659, -0.5366472, 1.941679, 1, 0, 0, 1, 1,
2.016768, 0.1092759, 2.265473, 1, 0, 0, 1, 1,
2.024835, 0.3048426, 1.541148, 1, 0, 0, 1, 1,
2.133081, 0.5596777, 1.621286, 1, 0, 0, 1, 1,
2.165315, 0.1651665, 2.69101, 1, 0, 0, 1, 1,
2.192494, 1.772984, 1.106479, 0, 0, 0, 1, 1,
2.220731, 0.5444374, 1.206455, 0, 0, 0, 1, 1,
2.270846, -1.247409, 2.295777, 0, 0, 0, 1, 1,
2.399532, 0.7408036, 0.2816961, 0, 0, 0, 1, 1,
2.43616, 2.172568, -0.2829638, 0, 0, 0, 1, 1,
2.456411, 0.3498082, 2.729625, 0, 0, 0, 1, 1,
2.49763, 0.5651588, -0.2482607, 0, 0, 0, 1, 1,
2.525608, 1.330994, 2.178411, 1, 1, 1, 1, 1,
2.533837, 0.1938264, 0.1887483, 1, 1, 1, 1, 1,
2.546415, 0.1403195, 2.111224, 1, 1, 1, 1, 1,
2.55425, 1.202648, 3.078052, 1, 1, 1, 1, 1,
2.704881, 0.2894088, 1.094853, 1, 1, 1, 1, 1,
2.944726, -0.1352624, 3.551726, 1, 1, 1, 1, 1,
3.204031, 0.8732973, 2.420385, 1, 1, 1, 1, 1
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
var radius = 9.47749;
var distance = 33.28928;
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
mvMatrix.translate( -0.1988698, -0.08733833, 0.3321369 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.28928);
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
