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
-3.156045, 0.8051891, 0.1677583, 1, 0, 0, 1,
-3.016117, 0.2174819, -3.113881, 1, 0.007843138, 0, 1,
-2.877327, -1.981999, -2.008228, 1, 0.01176471, 0, 1,
-2.765093, 0.2107739, -0.1094479, 1, 0.01960784, 0, 1,
-2.683811, 0.9618169, -0.6719931, 1, 0.02352941, 0, 1,
-2.634847, 0.2907575, -1.910455, 1, 0.03137255, 0, 1,
-2.546345, 0.9350559, -2.279575, 1, 0.03529412, 0, 1,
-2.460861, -0.1953781, -2.325238, 1, 0.04313726, 0, 1,
-2.439591, -0.2076373, -2.835761, 1, 0.04705882, 0, 1,
-2.363567, -0.2295243, -1.813305, 1, 0.05490196, 0, 1,
-2.321846, 1.699645, -1.457898, 1, 0.05882353, 0, 1,
-2.299406, 1.500077, -0.3972225, 1, 0.06666667, 0, 1,
-2.29732, -0.1852273, -2.801634, 1, 0.07058824, 0, 1,
-2.28428, 0.3907177, -1.262487, 1, 0.07843138, 0, 1,
-2.161212, 0.7627474, -1.13106, 1, 0.08235294, 0, 1,
-2.141932, 0.7041521, -0.7843983, 1, 0.09019608, 0, 1,
-2.090383, 1.11029, -1.83597, 1, 0.09411765, 0, 1,
-2.079066, -0.4195119, -0.3841432, 1, 0.1019608, 0, 1,
-1.993004, 1.204594, -1.300555, 1, 0.1098039, 0, 1,
-1.98612, -0.2274228, -0.01751969, 1, 0.1137255, 0, 1,
-1.9829, 1.499009, -0.009796342, 1, 0.1215686, 0, 1,
-1.98021, 0.4277331, -1.477883, 1, 0.1254902, 0, 1,
-1.949284, -1.005794, -1.148935, 1, 0.1333333, 0, 1,
-1.947048, 0.4443334, -3.29011, 1, 0.1372549, 0, 1,
-1.935201, 1.157623, -1.095954, 1, 0.145098, 0, 1,
-1.908263, -1.652365, -3.7254, 1, 0.1490196, 0, 1,
-1.90053, 0.08377504, -1.160696, 1, 0.1568628, 0, 1,
-1.900167, -1.03835, -2.34784, 1, 0.1607843, 0, 1,
-1.878503, 1.734488, 0.1948419, 1, 0.1686275, 0, 1,
-1.877947, 1.32746, -1.009705, 1, 0.172549, 0, 1,
-1.876245, -0.6507086, -3.995744, 1, 0.1803922, 0, 1,
-1.855024, 0.919297, -0.9937042, 1, 0.1843137, 0, 1,
-1.850994, -0.3335827, -1.51753, 1, 0.1921569, 0, 1,
-1.849571, -2.109189, -3.018199, 1, 0.1960784, 0, 1,
-1.841903, -0.4120096, -2.985164, 1, 0.2039216, 0, 1,
-1.823115, 0.7233384, -0.1388031, 1, 0.2117647, 0, 1,
-1.803284, 1.711684, -0.5695751, 1, 0.2156863, 0, 1,
-1.798262, 0.4015163, -0.8055928, 1, 0.2235294, 0, 1,
-1.787416, -1.016285, -1.245327, 1, 0.227451, 0, 1,
-1.783018, 0.6062245, -2.113475, 1, 0.2352941, 0, 1,
-1.778283, -0.627202, -2.067898, 1, 0.2392157, 0, 1,
-1.759937, -0.4620233, -4.190703, 1, 0.2470588, 0, 1,
-1.753642, 0.6468772, 0.4953619, 1, 0.2509804, 0, 1,
-1.727961, 1.034834, -1.795506, 1, 0.2588235, 0, 1,
-1.692983, -0.7295571, -2.159532, 1, 0.2627451, 0, 1,
-1.66718, -0.5297832, -3.958025, 1, 0.2705882, 0, 1,
-1.654833, 0.4096493, -2.239709, 1, 0.2745098, 0, 1,
-1.653294, -0.715055, -2.702233, 1, 0.282353, 0, 1,
-1.639757, 0.9156297, -2.232771, 1, 0.2862745, 0, 1,
-1.639719, -0.2154986, -3.345262, 1, 0.2941177, 0, 1,
-1.629099, -3.248324, -0.9196028, 1, 0.3019608, 0, 1,
-1.627252, -0.9442907, -2.280668, 1, 0.3058824, 0, 1,
-1.624425, -0.7478971, -2.107316, 1, 0.3137255, 0, 1,
-1.62245, 1.019378, -1.727521, 1, 0.3176471, 0, 1,
-1.607762, -0.2270141, -0.5848751, 1, 0.3254902, 0, 1,
-1.605796, 0.3471527, -0.3393807, 1, 0.3294118, 0, 1,
-1.591079, -0.5780345, -1.993791, 1, 0.3372549, 0, 1,
-1.589295, 0.4616271, 0.3049451, 1, 0.3411765, 0, 1,
-1.58862, -0.5499439, -2.044566, 1, 0.3490196, 0, 1,
-1.584028, -0.60906, -1.348344, 1, 0.3529412, 0, 1,
-1.577979, 0.306496, -1.321592, 1, 0.3607843, 0, 1,
-1.562598, -2.074648, -2.494967, 1, 0.3647059, 0, 1,
-1.557907, 0.783263, -2.408344, 1, 0.372549, 0, 1,
-1.556513, 0.1546796, 0.1377143, 1, 0.3764706, 0, 1,
-1.553709, -0.723602, -3.121197, 1, 0.3843137, 0, 1,
-1.553624, 0.04191434, -0.9180565, 1, 0.3882353, 0, 1,
-1.508559, 0.9107131, -0.2580768, 1, 0.3960784, 0, 1,
-1.504898, -1.078931, -3.30872, 1, 0.4039216, 0, 1,
-1.501865, -1.31034, -1.068243, 1, 0.4078431, 0, 1,
-1.501298, 0.3970943, -1.214057, 1, 0.4156863, 0, 1,
-1.49493, -0.3695657, -1.855445, 1, 0.4196078, 0, 1,
-1.486243, -1.497456, -1.234797, 1, 0.427451, 0, 1,
-1.470754, 1.322605, 0.4963357, 1, 0.4313726, 0, 1,
-1.462501, -0.1979067, -0.9419848, 1, 0.4392157, 0, 1,
-1.458388, -0.7480726, -0.618984, 1, 0.4431373, 0, 1,
-1.443136, -0.1885809, -1.894269, 1, 0.4509804, 0, 1,
-1.440952, 0.6496696, -2.850731, 1, 0.454902, 0, 1,
-1.440831, 1.030967, -3.562887, 1, 0.4627451, 0, 1,
-1.433703, -0.1048966, -0.3571058, 1, 0.4666667, 0, 1,
-1.422303, -0.6520792, -1.643114, 1, 0.4745098, 0, 1,
-1.402121, -0.3714016, -0.8690573, 1, 0.4784314, 0, 1,
-1.381099, -1.006635, -2.055932, 1, 0.4862745, 0, 1,
-1.352034, 0.5702448, -3.293245, 1, 0.4901961, 0, 1,
-1.347826, -0.4288055, -0.3558624, 1, 0.4980392, 0, 1,
-1.346576, -1.426936, -2.682524, 1, 0.5058824, 0, 1,
-1.334033, 1.532148, -0.5717613, 1, 0.509804, 0, 1,
-1.327947, 1.337717, -0.6595317, 1, 0.5176471, 0, 1,
-1.327368, 0.03817494, -2.68177, 1, 0.5215687, 0, 1,
-1.317044, 0.159279, -2.626388, 1, 0.5294118, 0, 1,
-1.315381, -0.9652721, -1.07964, 1, 0.5333334, 0, 1,
-1.310688, -1.581902, -2.733259, 1, 0.5411765, 0, 1,
-1.30822, -0.4111443, -2.459182, 1, 0.5450981, 0, 1,
-1.296917, 0.03976132, -2.665461, 1, 0.5529412, 0, 1,
-1.29664, -0.4639837, -1.479701, 1, 0.5568628, 0, 1,
-1.29491, 0.987218, -0.711368, 1, 0.5647059, 0, 1,
-1.287844, 0.4228254, -1.802375, 1, 0.5686275, 0, 1,
-1.285296, 0.09702557, -2.916013, 1, 0.5764706, 0, 1,
-1.284761, 1.105914, -0.7014972, 1, 0.5803922, 0, 1,
-1.278802, -2.933495, -1.697138, 1, 0.5882353, 0, 1,
-1.276809, 0.4538391, -0.05271119, 1, 0.5921569, 0, 1,
-1.275669, 0.5987337, -2.948554, 1, 0.6, 0, 1,
-1.272548, -1.379641, -4.478589, 1, 0.6078432, 0, 1,
-1.270766, -0.5201982, -2.944174, 1, 0.6117647, 0, 1,
-1.266436, 0.1171823, -1.497357, 1, 0.6196079, 0, 1,
-1.261058, 0.5421203, -1.843646, 1, 0.6235294, 0, 1,
-1.258853, 0.2757675, -0.7565462, 1, 0.6313726, 0, 1,
-1.233372, -0.5886714, -3.294585, 1, 0.6352941, 0, 1,
-1.228633, 1.389112, 0.2223828, 1, 0.6431373, 0, 1,
-1.227165, 0.02003147, -3.667391, 1, 0.6470588, 0, 1,
-1.220469, 3.154066, -0.199219, 1, 0.654902, 0, 1,
-1.219563, -0.9475417, -3.685673, 1, 0.6588235, 0, 1,
-1.217323, 1.46003, -0.5024488, 1, 0.6666667, 0, 1,
-1.215307, -1.052141, -1.8203, 1, 0.6705883, 0, 1,
-1.181318, -2.216793, -3.108773, 1, 0.6784314, 0, 1,
-1.180544, 0.8190688, -0.2946842, 1, 0.682353, 0, 1,
-1.169615, -0.4679666, -2.464523, 1, 0.6901961, 0, 1,
-1.167889, -0.4916206, -1.497265, 1, 0.6941177, 0, 1,
-1.162688, 1.309713, -0.6428954, 1, 0.7019608, 0, 1,
-1.157216, -1.356248, -2.199212, 1, 0.7098039, 0, 1,
-1.151293, 0.5667006, -2.373651, 1, 0.7137255, 0, 1,
-1.149784, -0.4487541, -1.643264, 1, 0.7215686, 0, 1,
-1.13391, -0.315538, -3.502929, 1, 0.7254902, 0, 1,
-1.124519, 0.9170655, -0.9553058, 1, 0.7333333, 0, 1,
-1.124085, 0.6330906, -1.647854, 1, 0.7372549, 0, 1,
-1.120832, -0.4788501, -2.021778, 1, 0.7450981, 0, 1,
-1.119992, 0.0701737, -0.002605719, 1, 0.7490196, 0, 1,
-1.115186, 0.5325574, 0.4050534, 1, 0.7568628, 0, 1,
-1.112664, 1.232421, -0.2120604, 1, 0.7607843, 0, 1,
-1.099966, -0.6066005, -2.784156, 1, 0.7686275, 0, 1,
-1.097479, -0.6785039, -0.6942779, 1, 0.772549, 0, 1,
-1.095943, -1.917876, -4.504831, 1, 0.7803922, 0, 1,
-1.091658, 1.001536, -0.5726702, 1, 0.7843137, 0, 1,
-1.089686, 1.958815, 0.1272037, 1, 0.7921569, 0, 1,
-1.088505, 0.9582735, -1.828082, 1, 0.7960784, 0, 1,
-1.086564, -0.1989565, -2.085291, 1, 0.8039216, 0, 1,
-1.082806, 1.485325, -0.9429357, 1, 0.8117647, 0, 1,
-1.079644, -1.469975, -3.273189, 1, 0.8156863, 0, 1,
-1.07748, 1.002325, -2.773134, 1, 0.8235294, 0, 1,
-1.075227, -1.057426, -2.323524, 1, 0.827451, 0, 1,
-1.072692, 0.389693, -0.8006573, 1, 0.8352941, 0, 1,
-1.067514, -0.2010559, -2.277627, 1, 0.8392157, 0, 1,
-1.054373, 0.5975627, -1.491806, 1, 0.8470588, 0, 1,
-1.051159, 0.07827332, -1.724519, 1, 0.8509804, 0, 1,
-1.049798, 0.558557, -1.17459, 1, 0.8588235, 0, 1,
-1.042797, 0.6590087, -1.689509, 1, 0.8627451, 0, 1,
-1.038939, 1.360294, -0.9491395, 1, 0.8705882, 0, 1,
-1.036196, -1.572219, -0.832432, 1, 0.8745098, 0, 1,
-1.032922, 0.9174383, 0.362056, 1, 0.8823529, 0, 1,
-1.023424, 1.012668, -1.600423, 1, 0.8862745, 0, 1,
-1.012642, -0.7368529, -2.324971, 1, 0.8941177, 0, 1,
-1.010232, -0.5788257, -2.97165, 1, 0.8980392, 0, 1,
-1.009987, -0.8287683, -2.925923, 1, 0.9058824, 0, 1,
-1.009875, -0.05716834, -3.227493, 1, 0.9137255, 0, 1,
-1.006761, -0.6179404, -1.996454, 1, 0.9176471, 0, 1,
-1.004756, 0.05012555, 0.2383109, 1, 0.9254902, 0, 1,
-1.003076, 1.589371, -0.3996557, 1, 0.9294118, 0, 1,
-0.999056, 0.0193765, -2.585211, 1, 0.9372549, 0, 1,
-0.9978381, -0.5997248, -3.859886, 1, 0.9411765, 0, 1,
-0.9970623, -0.2589855, -3.774657, 1, 0.9490196, 0, 1,
-0.9894902, 0.7836834, -0.9281458, 1, 0.9529412, 0, 1,
-0.9854305, 0.9486844, -2.808749, 1, 0.9607843, 0, 1,
-0.9839373, 0.008118521, -1.12657, 1, 0.9647059, 0, 1,
-0.9838991, -0.3736972, -2.842011, 1, 0.972549, 0, 1,
-0.9818168, 0.5426753, -1.048322, 1, 0.9764706, 0, 1,
-0.9815226, 0.009074787, -1.869182, 1, 0.9843137, 0, 1,
-0.9773297, 0.2134517, -2.147094, 1, 0.9882353, 0, 1,
-0.9769912, -1.018229, -0.9510923, 1, 0.9960784, 0, 1,
-0.9762167, 0.1413339, -1.229641, 0.9960784, 1, 0, 1,
-0.9756906, -1.915539, -4.292217, 0.9921569, 1, 0, 1,
-0.9746006, -1.030673, -1.47832, 0.9843137, 1, 0, 1,
-0.9508516, -1.234696, -3.134005, 0.9803922, 1, 0, 1,
-0.9440509, 0.582239, -1.232541, 0.972549, 1, 0, 1,
-0.9407914, 0.141908, -1.993643, 0.9686275, 1, 0, 1,
-0.9357896, 0.1111523, -1.376375, 0.9607843, 1, 0, 1,
-0.9288116, -0.5408763, -2.899862, 0.9568627, 1, 0, 1,
-0.9124693, 0.06948328, -1.415233, 0.9490196, 1, 0, 1,
-0.9112015, 1.00474, 0.2619437, 0.945098, 1, 0, 1,
-0.9058167, -0.00285747, -2.026116, 0.9372549, 1, 0, 1,
-0.9048978, 0.5520045, -1.226995, 0.9333333, 1, 0, 1,
-0.9038263, -1.464676, -0.8278483, 0.9254902, 1, 0, 1,
-0.9030074, 0.1586102, -1.706383, 0.9215686, 1, 0, 1,
-0.9030019, -1.207824, -2.846259, 0.9137255, 1, 0, 1,
-0.9010126, -1.717294, -4.158653, 0.9098039, 1, 0, 1,
-0.8981965, -1.323747, -2.967253, 0.9019608, 1, 0, 1,
-0.8950737, 1.340332, -0.1594191, 0.8941177, 1, 0, 1,
-0.8946702, 0.5879931, -1.631703, 0.8901961, 1, 0, 1,
-0.8937199, 0.4313936, -2.262547, 0.8823529, 1, 0, 1,
-0.8918487, -0.6221319, -1.609853, 0.8784314, 1, 0, 1,
-0.8875625, 0.07964487, -1.104267, 0.8705882, 1, 0, 1,
-0.8779394, 0.3203106, 0.1019472, 0.8666667, 1, 0, 1,
-0.8738846, 0.03408107, -2.122691, 0.8588235, 1, 0, 1,
-0.870761, -0.3308844, -1.639041, 0.854902, 1, 0, 1,
-0.8694398, -0.3586092, -1.54192, 0.8470588, 1, 0, 1,
-0.8662511, -0.7332842, -1.600802, 0.8431373, 1, 0, 1,
-0.866124, 1.736978, 0.129655, 0.8352941, 1, 0, 1,
-0.8574471, 1.099808, -1.517771, 0.8313726, 1, 0, 1,
-0.8552262, 0.4715172, -0.2828814, 0.8235294, 1, 0, 1,
-0.8547019, 0.8290966, 0.008732833, 0.8196079, 1, 0, 1,
-0.8507273, -1.211829, -2.959476, 0.8117647, 1, 0, 1,
-0.8489707, 1.031716, -2.584027, 0.8078431, 1, 0, 1,
-0.8488482, 1.224394, -1.959306, 0.8, 1, 0, 1,
-0.8488042, 0.2901465, -0.8292168, 0.7921569, 1, 0, 1,
-0.8487177, 0.3730645, -1.882155, 0.7882353, 1, 0, 1,
-0.8444265, 0.7191932, 0.3705668, 0.7803922, 1, 0, 1,
-0.8436946, -1.69128, -2.025459, 0.7764706, 1, 0, 1,
-0.8413224, -0.8985539, -3.201886, 0.7686275, 1, 0, 1,
-0.8385453, 0.07867962, -1.210025, 0.7647059, 1, 0, 1,
-0.8354042, 0.08519403, -1.320443, 0.7568628, 1, 0, 1,
-0.8223079, 0.5924045, -2.183102, 0.7529412, 1, 0, 1,
-0.8211367, 0.764605, -1.096314, 0.7450981, 1, 0, 1,
-0.8189465, 0.06208428, -0.4898085, 0.7411765, 1, 0, 1,
-0.8158387, 1.981441, -1.366541, 0.7333333, 1, 0, 1,
-0.8142201, 0.2374721, 1.494984, 0.7294118, 1, 0, 1,
-0.8089009, -0.3367446, -1.781963, 0.7215686, 1, 0, 1,
-0.8084356, 1.40024, -0.2817267, 0.7176471, 1, 0, 1,
-0.8074499, -0.2231117, -1.244203, 0.7098039, 1, 0, 1,
-0.7999068, 0.132676, -0.651051, 0.7058824, 1, 0, 1,
-0.7988333, 1.229455, 0.1742585, 0.6980392, 1, 0, 1,
-0.796568, -0.0006523076, -0.8474737, 0.6901961, 1, 0, 1,
-0.791997, -0.9002038, -1.757686, 0.6862745, 1, 0, 1,
-0.7899235, 1.150967, -0.4133745, 0.6784314, 1, 0, 1,
-0.7850603, 0.13719, -1.525183, 0.6745098, 1, 0, 1,
-0.7831842, -2.039244, -1.830726, 0.6666667, 1, 0, 1,
-0.7807068, 0.9811069, -1.033884, 0.6627451, 1, 0, 1,
-0.7677707, -0.5101414, -1.829611, 0.654902, 1, 0, 1,
-0.766234, 0.7812236, 1.504796, 0.6509804, 1, 0, 1,
-0.7661304, 0.5710185, -1.262, 0.6431373, 1, 0, 1,
-0.7622883, -1.153676, -2.062714, 0.6392157, 1, 0, 1,
-0.7592126, -1.497422, -0.4708008, 0.6313726, 1, 0, 1,
-0.7590719, 0.6811886, -0.8921344, 0.627451, 1, 0, 1,
-0.7545223, 0.5475807, -1.277961, 0.6196079, 1, 0, 1,
-0.7521756, 1.062901, -0.7058545, 0.6156863, 1, 0, 1,
-0.7514111, 0.847393, -0.6851854, 0.6078432, 1, 0, 1,
-0.7495722, 0.6566099, -1.061064, 0.6039216, 1, 0, 1,
-0.7388703, 1.95196, 0.1404629, 0.5960785, 1, 0, 1,
-0.737371, -2.622907, -0.8353004, 0.5882353, 1, 0, 1,
-0.7358998, -1.02132, -3.442562, 0.5843138, 1, 0, 1,
-0.7342377, -2.267941, -2.408299, 0.5764706, 1, 0, 1,
-0.7340831, -0.4517778, -0.828577, 0.572549, 1, 0, 1,
-0.7330891, -0.5460008, -0.7741954, 0.5647059, 1, 0, 1,
-0.7329401, -0.6357341, -2.790853, 0.5607843, 1, 0, 1,
-0.7326017, 0.2634288, -2.119718, 0.5529412, 1, 0, 1,
-0.7321024, -0.5659677, -3.576514, 0.5490196, 1, 0, 1,
-0.7285493, 0.3882416, -1.113646, 0.5411765, 1, 0, 1,
-0.7271409, 0.2579397, -1.689497, 0.5372549, 1, 0, 1,
-0.7226281, 1.187365, -0.3568658, 0.5294118, 1, 0, 1,
-0.7213605, -1.264822, -2.142592, 0.5254902, 1, 0, 1,
-0.716944, 1.551329, -0.9572939, 0.5176471, 1, 0, 1,
-0.7097248, -0.612817, -1.355605, 0.5137255, 1, 0, 1,
-0.7089972, 0.651495, -0.1316205, 0.5058824, 1, 0, 1,
-0.7083053, 0.9925234, -0.2660479, 0.5019608, 1, 0, 1,
-0.7075287, 0.03382106, -2.529826, 0.4941176, 1, 0, 1,
-0.7034241, 0.01026081, -2.513943, 0.4862745, 1, 0, 1,
-0.7032819, 1.737834, -0.5419163, 0.4823529, 1, 0, 1,
-0.7026399, 0.008483418, 0.1363431, 0.4745098, 1, 0, 1,
-0.6994532, -0.8825794, -2.841038, 0.4705882, 1, 0, 1,
-0.69394, -0.3280182, -0.2987178, 0.4627451, 1, 0, 1,
-0.6904444, 0.6493371, -0.2354372, 0.4588235, 1, 0, 1,
-0.6902081, 1.846576, -0.361146, 0.4509804, 1, 0, 1,
-0.6778562, 1.505503, 1.117447, 0.4470588, 1, 0, 1,
-0.6772827, -2.29611, -2.999556, 0.4392157, 1, 0, 1,
-0.6772532, 0.06036367, -0.864605, 0.4352941, 1, 0, 1,
-0.6717897, -0.5972843, -4.796026, 0.427451, 1, 0, 1,
-0.6712836, -0.7272587, -2.568166, 0.4235294, 1, 0, 1,
-0.6706307, -0.4449898, -1.86235, 0.4156863, 1, 0, 1,
-0.6676272, 0.649739, -0.870912, 0.4117647, 1, 0, 1,
-0.6610715, -0.1245398, -1.242563, 0.4039216, 1, 0, 1,
-0.6590049, -0.5825902, -2.658285, 0.3960784, 1, 0, 1,
-0.6490573, 0.04873817, 1.161946, 0.3921569, 1, 0, 1,
-0.6450775, -1.220935, -0.7989728, 0.3843137, 1, 0, 1,
-0.6425894, -0.8353392, -1.994918, 0.3803922, 1, 0, 1,
-0.642142, 0.5761116, -0.2895622, 0.372549, 1, 0, 1,
-0.6385244, -0.03888829, -3.288691, 0.3686275, 1, 0, 1,
-0.6341218, 0.6149692, -1.439249, 0.3607843, 1, 0, 1,
-0.6328906, 1.381746, 0.2256691, 0.3568628, 1, 0, 1,
-0.6301616, 0.4668209, -1.151489, 0.3490196, 1, 0, 1,
-0.6263418, -0.1458088, -2.771148, 0.345098, 1, 0, 1,
-0.6146061, 0.8904303, -1.417184, 0.3372549, 1, 0, 1,
-0.6101103, 0.5326025, -0.1490984, 0.3333333, 1, 0, 1,
-0.6079906, 0.5259688, -0.414015, 0.3254902, 1, 0, 1,
-0.6074011, 1.105506, -1.500041, 0.3215686, 1, 0, 1,
-0.6033987, -0.2441705, -2.746612, 0.3137255, 1, 0, 1,
-0.6028405, -0.7929966, -2.912169, 0.3098039, 1, 0, 1,
-0.600755, 1.056424, -0.1798454, 0.3019608, 1, 0, 1,
-0.5946005, -0.1112246, -1.275822, 0.2941177, 1, 0, 1,
-0.5911869, -0.07037097, -3.021729, 0.2901961, 1, 0, 1,
-0.5771892, 1.163998, -0.5536162, 0.282353, 1, 0, 1,
-0.567184, -0.9206718, 0.08466504, 0.2784314, 1, 0, 1,
-0.5613492, 0.8339726, -0.01732733, 0.2705882, 1, 0, 1,
-0.5588527, 0.07076872, 0.1469551, 0.2666667, 1, 0, 1,
-0.5558684, -0.1402718, -0.3882877, 0.2588235, 1, 0, 1,
-0.5496082, 0.2432318, -1.3537, 0.254902, 1, 0, 1,
-0.5460352, 0.8323684, 0.5385069, 0.2470588, 1, 0, 1,
-0.5414896, 0.6191949, -0.5207846, 0.2431373, 1, 0, 1,
-0.5365788, 0.1392566, -0.4211515, 0.2352941, 1, 0, 1,
-0.5361627, 1.059067, 0.01309508, 0.2313726, 1, 0, 1,
-0.5355716, -0.2523242, -1.530792, 0.2235294, 1, 0, 1,
-0.5311549, 1.528655, -0.7007721, 0.2196078, 1, 0, 1,
-0.5223988, -0.5693122, -3.403076, 0.2117647, 1, 0, 1,
-0.5201827, 1.832108, 0.9105548, 0.2078431, 1, 0, 1,
-0.5200093, -0.1559405, -1.73802, 0.2, 1, 0, 1,
-0.517745, 0.3654191, -1.502099, 0.1921569, 1, 0, 1,
-0.5159371, 0.8572165, -1.502765, 0.1882353, 1, 0, 1,
-0.5093566, 0.3184921, -1.078072, 0.1803922, 1, 0, 1,
-0.5077994, -1.186948, -1.919027, 0.1764706, 1, 0, 1,
-0.504559, 2.52369, 1.152635, 0.1686275, 1, 0, 1,
-0.4994976, -1.012738, -1.382176, 0.1647059, 1, 0, 1,
-0.4985215, -1.394466, -2.807666, 0.1568628, 1, 0, 1,
-0.4952958, 0.9815548, 0.4178532, 0.1529412, 1, 0, 1,
-0.4946673, 1.430694, -0.04836067, 0.145098, 1, 0, 1,
-0.49277, 0.6630523, -1.919481, 0.1411765, 1, 0, 1,
-0.4924762, 0.1420932, -1.666246, 0.1333333, 1, 0, 1,
-0.4922176, -0.02901827, -1.742281, 0.1294118, 1, 0, 1,
-0.4913817, -1.452323, -3.156868, 0.1215686, 1, 0, 1,
-0.4906016, -2.083153, -1.528934, 0.1176471, 1, 0, 1,
-0.4900264, -0.4892657, -3.034256, 0.1098039, 1, 0, 1,
-0.488973, 0.4424118, -0.4837801, 0.1058824, 1, 0, 1,
-0.4873009, 0.4008826, -1.529299, 0.09803922, 1, 0, 1,
-0.487176, -0.8870308, -4.707117, 0.09019608, 1, 0, 1,
-0.4845679, -1.379768, -1.647708, 0.08627451, 1, 0, 1,
-0.4819792, 0.07345729, -1.569283, 0.07843138, 1, 0, 1,
-0.4802654, -1.011661, -1.643836, 0.07450981, 1, 0, 1,
-0.4789542, -0.1108824, -1.047139, 0.06666667, 1, 0, 1,
-0.4785862, 0.1347646, -0.1469781, 0.0627451, 1, 0, 1,
-0.4770782, -0.5902587, -2.846529, 0.05490196, 1, 0, 1,
-0.4770595, -0.6498924, -3.425365, 0.05098039, 1, 0, 1,
-0.4738185, 0.2372051, 0.6522474, 0.04313726, 1, 0, 1,
-0.4736907, 0.7678015, -0.03078668, 0.03921569, 1, 0, 1,
-0.473085, -0.6975049, -0.4780807, 0.03137255, 1, 0, 1,
-0.473066, 0.4036148, 0.1131324, 0.02745098, 1, 0, 1,
-0.4713209, 0.4029935, -1.396439, 0.01960784, 1, 0, 1,
-0.4688185, -0.6084411, -2.377556, 0.01568628, 1, 0, 1,
-0.468349, -1.629392, -2.721636, 0.007843138, 1, 0, 1,
-0.4669869, 0.7400572, -0.08739763, 0.003921569, 1, 0, 1,
-0.4646383, -0.3955809, -3.742511, 0, 1, 0.003921569, 1,
-0.4628454, -1.403547, -3.448272, 0, 1, 0.01176471, 1,
-0.4603723, 1.417678, -0.2761088, 0, 1, 0.01568628, 1,
-0.4594847, -0.3570334, -0.7773253, 0, 1, 0.02352941, 1,
-0.4522794, 0.3229432, 0.2114785, 0, 1, 0.02745098, 1,
-0.4522791, 0.4163603, -0.7487566, 0, 1, 0.03529412, 1,
-0.4522359, -0.180925, -1.397739, 0, 1, 0.03921569, 1,
-0.4516276, -0.8761274, -2.198531, 0, 1, 0.04705882, 1,
-0.4476355, 0.6209893, -0.3666936, 0, 1, 0.05098039, 1,
-0.4462198, 1.241579, -0.5158145, 0, 1, 0.05882353, 1,
-0.4443196, -0.5554265, -2.887104, 0, 1, 0.0627451, 1,
-0.4408362, 0.2815196, -1.696237, 0, 1, 0.07058824, 1,
-0.4337713, -1.911474, -3.722124, 0, 1, 0.07450981, 1,
-0.4321085, -0.5974815, -3.00586, 0, 1, 0.08235294, 1,
-0.430437, -2.409001, -2.258267, 0, 1, 0.08627451, 1,
-0.4300251, -0.2296032, -2.185075, 0, 1, 0.09411765, 1,
-0.4277333, 1.588305, 2.053972, 0, 1, 0.1019608, 1,
-0.4214731, -0.4537044, -2.528162, 0, 1, 0.1058824, 1,
-0.4212582, 2.155728, -0.99166, 0, 1, 0.1137255, 1,
-0.417105, 1.00797, -2.98093, 0, 1, 0.1176471, 1,
-0.4140612, 0.1500118, 0.2803527, 0, 1, 0.1254902, 1,
-0.4110568, 1.575084, -0.3832596, 0, 1, 0.1294118, 1,
-0.4016927, 0.4495526, 1.563212, 0, 1, 0.1372549, 1,
-0.400039, 0.2115402, 0.908261, 0, 1, 0.1411765, 1,
-0.3985987, 2.424773, 1.301489, 0, 1, 0.1490196, 1,
-0.3949706, -1.112238, -3.661751, 0, 1, 0.1529412, 1,
-0.3924623, 0.2312498, 0.05962186, 0, 1, 0.1607843, 1,
-0.3920122, 0.472502, 0.2844695, 0, 1, 0.1647059, 1,
-0.3908695, -0.7435717, -1.861051, 0, 1, 0.172549, 1,
-0.3894128, -1.06886, -2.972724, 0, 1, 0.1764706, 1,
-0.3870378, 0.03004663, -1.550629, 0, 1, 0.1843137, 1,
-0.3833423, 1.129669, 1.441071, 0, 1, 0.1882353, 1,
-0.3831538, 0.1366145, -1.659272, 0, 1, 0.1960784, 1,
-0.3786503, 0.6841903, -0.3925436, 0, 1, 0.2039216, 1,
-0.3689862, -1.128984, -1.026093, 0, 1, 0.2078431, 1,
-0.3638687, 0.6529244, -2.494593, 0, 1, 0.2156863, 1,
-0.3570269, 1.038749, -1.345343, 0, 1, 0.2196078, 1,
-0.3418869, -0.162411, -0.391528, 0, 1, 0.227451, 1,
-0.3379338, -0.04222687, -1.156156, 0, 1, 0.2313726, 1,
-0.3377836, -1.479774, -2.89527, 0, 1, 0.2392157, 1,
-0.337386, -0.3935467, -2.623999, 0, 1, 0.2431373, 1,
-0.3370125, 0.8522341, 0.7745158, 0, 1, 0.2509804, 1,
-0.3284003, 0.917831, -0.9842243, 0, 1, 0.254902, 1,
-0.3277667, 0.947937, -0.3115736, 0, 1, 0.2627451, 1,
-0.3235106, -0.8825005, -1.617289, 0, 1, 0.2666667, 1,
-0.3227383, -0.8581778, -1.644299, 0, 1, 0.2745098, 1,
-0.3212267, 2.122751, 0.08169089, 0, 1, 0.2784314, 1,
-0.3207783, -2.178682, -3.528931, 0, 1, 0.2862745, 1,
-0.3132804, -0.9887087, -2.687912, 0, 1, 0.2901961, 1,
-0.3117763, -0.7981067, -4.092166, 0, 1, 0.2980392, 1,
-0.3114207, -0.5481396, -2.985726, 0, 1, 0.3058824, 1,
-0.3110464, -1.434164, -4.334688, 0, 1, 0.3098039, 1,
-0.3098726, 0.2500887, -1.588471, 0, 1, 0.3176471, 1,
-0.3071663, -0.5950466, -2.060604, 0, 1, 0.3215686, 1,
-0.3030074, 1.268322, -1.387375, 0, 1, 0.3294118, 1,
-0.3010242, 1.279209, -0.07176616, 0, 1, 0.3333333, 1,
-0.2960582, 0.3534864, -1.9334, 0, 1, 0.3411765, 1,
-0.2952065, -0.9230856, -1.93064, 0, 1, 0.345098, 1,
-0.294247, 0.5166013, -2.312262, 0, 1, 0.3529412, 1,
-0.2935502, -0.3606525, -2.076355, 0, 1, 0.3568628, 1,
-0.2905889, 0.3235539, -1.501873, 0, 1, 0.3647059, 1,
-0.2869211, -1.907868, -1.977325, 0, 1, 0.3686275, 1,
-0.281592, 1.079418, 0.4582977, 0, 1, 0.3764706, 1,
-0.2799281, -1.429236, -1.838979, 0, 1, 0.3803922, 1,
-0.2697085, -1.287763, -2.841953, 0, 1, 0.3882353, 1,
-0.26631, 0.3910798, 0.5848106, 0, 1, 0.3921569, 1,
-0.2660299, -1.440499, -2.091763, 0, 1, 0.4, 1,
-0.2653132, -0.04961282, 0.06423354, 0, 1, 0.4078431, 1,
-0.2564614, 2.137584, 0.2710685, 0, 1, 0.4117647, 1,
-0.2563106, -2.687158, -2.731849, 0, 1, 0.4196078, 1,
-0.2510636, -0.1754361, -1.357247, 0, 1, 0.4235294, 1,
-0.2472948, -0.3029947, -4.720742, 0, 1, 0.4313726, 1,
-0.2452333, -0.9923629, -4.914313, 0, 1, 0.4352941, 1,
-0.2429319, -1.387937, -4.348166, 0, 1, 0.4431373, 1,
-0.2383563, 0.489621, -0.9091132, 0, 1, 0.4470588, 1,
-0.2381088, -0.6056788, -0.9543387, 0, 1, 0.454902, 1,
-0.2322174, 0.2671195, -1.437341, 0, 1, 0.4588235, 1,
-0.2316346, -0.8568719, -3.401112, 0, 1, 0.4666667, 1,
-0.2294703, -0.9491969, -4.942189, 0, 1, 0.4705882, 1,
-0.2282961, -1.632778, -3.420838, 0, 1, 0.4784314, 1,
-0.2190908, 0.02861294, -2.089869, 0, 1, 0.4823529, 1,
-0.215982, -0.05142681, 0.3836454, 0, 1, 0.4901961, 1,
-0.2079353, -1.20702, -2.926341, 0, 1, 0.4941176, 1,
-0.2008469, -0.3937641, -2.389656, 0, 1, 0.5019608, 1,
-0.1900911, 0.7407232, -0.2745209, 0, 1, 0.509804, 1,
-0.1887888, -0.8511387, -3.68679, 0, 1, 0.5137255, 1,
-0.1818852, 0.4120132, -0.41937, 0, 1, 0.5215687, 1,
-0.1808194, -1.187248, -2.683342, 0, 1, 0.5254902, 1,
-0.1792077, -0.1832542, -3.137462, 0, 1, 0.5333334, 1,
-0.1773831, -0.1892883, -3.116801, 0, 1, 0.5372549, 1,
-0.1743833, 0.1829266, -0.04873648, 0, 1, 0.5450981, 1,
-0.1730259, 2.625113, -0.3912988, 0, 1, 0.5490196, 1,
-0.1721763, 1.254914, -0.648739, 0, 1, 0.5568628, 1,
-0.1653517, -1.095727, -2.076963, 0, 1, 0.5607843, 1,
-0.1630075, -0.1406627, -0.4145616, 0, 1, 0.5686275, 1,
-0.1626912, -1.228962, -2.260134, 0, 1, 0.572549, 1,
-0.1626121, -0.008942266, -0.7887597, 0, 1, 0.5803922, 1,
-0.1623997, 0.0161685, -1.790058, 0, 1, 0.5843138, 1,
-0.1610288, -0.1143683, -2.478701, 0, 1, 0.5921569, 1,
-0.1567526, 0.7394913, 0.1186606, 0, 1, 0.5960785, 1,
-0.1496729, 1.26443, -0.9612802, 0, 1, 0.6039216, 1,
-0.1464085, -0.2694062, -4.300833, 0, 1, 0.6117647, 1,
-0.1446498, -0.3001056, -2.31861, 0, 1, 0.6156863, 1,
-0.1429965, 0.2113012, -2.231579, 0, 1, 0.6235294, 1,
-0.1412358, -1.038189, -2.098845, 0, 1, 0.627451, 1,
-0.1352799, 0.3387281, -1.325592, 0, 1, 0.6352941, 1,
-0.1351504, -0.270075, -1.810897, 0, 1, 0.6392157, 1,
-0.1341895, 0.3239212, 1.977633, 0, 1, 0.6470588, 1,
-0.132766, -0.8354167, -4.306305, 0, 1, 0.6509804, 1,
-0.1306074, -0.540556, -3.987377, 0, 1, 0.6588235, 1,
-0.1297538, -0.09957018, -1.877379, 0, 1, 0.6627451, 1,
-0.1266517, -0.4312542, -2.003077, 0, 1, 0.6705883, 1,
-0.1266399, -0.9278364, -1.61006, 0, 1, 0.6745098, 1,
-0.1263358, 0.4391271, -0.4950086, 0, 1, 0.682353, 1,
-0.1241341, 0.391645, 0.2733062, 0, 1, 0.6862745, 1,
-0.1237614, 0.5365716, 0.4204104, 0, 1, 0.6941177, 1,
-0.1233524, -0.04441956, -2.118468, 0, 1, 0.7019608, 1,
-0.1216533, -0.1838214, -2.619378, 0, 1, 0.7058824, 1,
-0.1202584, -0.3399588, -2.229948, 0, 1, 0.7137255, 1,
-0.1201884, -1.521285, -3.288631, 0, 1, 0.7176471, 1,
-0.1200089, 0.1418433, 0.514725, 0, 1, 0.7254902, 1,
-0.1181112, -0.9754698, -1.304652, 0, 1, 0.7294118, 1,
-0.1178324, 0.2924486, -0.3595116, 0, 1, 0.7372549, 1,
-0.1152056, 0.8588769, 1.164484, 0, 1, 0.7411765, 1,
-0.1137343, 0.9319347, -0.003731821, 0, 1, 0.7490196, 1,
-0.1110972, -0.348875, -2.117302, 0, 1, 0.7529412, 1,
-0.1090018, 1.1308, -0.8701932, 0, 1, 0.7607843, 1,
-0.1064115, -0.1214692, -2.159825, 0, 1, 0.7647059, 1,
-0.105999, 0.2268256, -0.1293396, 0, 1, 0.772549, 1,
-0.0981878, -1.885992, -2.44366, 0, 1, 0.7764706, 1,
-0.0953285, -1.603241, -3.035058, 0, 1, 0.7843137, 1,
-0.09315262, -0.3535596, -4.765234, 0, 1, 0.7882353, 1,
-0.09090646, -1.209845, -3.248434, 0, 1, 0.7960784, 1,
-0.08688527, 0.6769111, -0.682242, 0, 1, 0.8039216, 1,
-0.08651485, 0.3510868, -0.1935549, 0, 1, 0.8078431, 1,
-0.08623575, -0.6107376, -3.13301, 0, 1, 0.8156863, 1,
-0.08299376, -1.314276, -4.168818, 0, 1, 0.8196079, 1,
-0.07752255, -1.109645, -2.359738, 0, 1, 0.827451, 1,
-0.07661702, -0.2469955, -1.822536, 0, 1, 0.8313726, 1,
-0.07509961, 0.9335682, 0.1539636, 0, 1, 0.8392157, 1,
-0.07428703, 0.1452603, -0.2407961, 0, 1, 0.8431373, 1,
-0.07302476, -0.994901, -5.427132, 0, 1, 0.8509804, 1,
-0.06686803, -0.6751087, -5.56109, 0, 1, 0.854902, 1,
-0.06152755, 1.655293, -0.8739744, 0, 1, 0.8627451, 1,
-0.06142228, 0.2821719, -0.7076993, 0, 1, 0.8666667, 1,
-0.05198652, -0.5156861, -5.784603, 0, 1, 0.8745098, 1,
-0.04939594, 0.3138548, 1.394972, 0, 1, 0.8784314, 1,
-0.04932798, 1.656887, 0.9071965, 0, 1, 0.8862745, 1,
-0.04913633, -0.3549481, -2.837972, 0, 1, 0.8901961, 1,
-0.04812728, 1.149048, -0.9337388, 0, 1, 0.8980392, 1,
-0.04463107, -0.5338019, -3.949902, 0, 1, 0.9058824, 1,
-0.04334514, -0.4874884, -2.494117, 0, 1, 0.9098039, 1,
-0.04331917, -0.9776198, -5.006729, 0, 1, 0.9176471, 1,
-0.03788113, 1.437089, 1.120031, 0, 1, 0.9215686, 1,
-0.024342, 0.704209, -0.1469002, 0, 1, 0.9294118, 1,
-0.02196647, -1.469958, -3.678627, 0, 1, 0.9333333, 1,
-0.01714348, 0.5239509, -1.50876, 0, 1, 0.9411765, 1,
-0.01282999, -1.12877, -2.672444, 0, 1, 0.945098, 1,
-0.0118864, -0.5739464, -1.923611, 0, 1, 0.9529412, 1,
-0.01086257, 0.4820256, -1.408971, 0, 1, 0.9568627, 1,
-0.009638894, -0.4309254, -3.323694, 0, 1, 0.9647059, 1,
-0.007981319, 0.745407, -0.8079263, 0, 1, 0.9686275, 1,
-0.006197242, -0.9993718, -2.765263, 0, 1, 0.9764706, 1,
-0.004313971, 0.4853973, -1.199188, 0, 1, 0.9803922, 1,
-0.003007548, 1.059719, 0.4568248, 0, 1, 0.9882353, 1,
0.007771418, 0.3492453, -1.900748, 0, 1, 0.9921569, 1,
0.008918649, -0.2022247, 5.448838, 0, 1, 1, 1,
0.0101675, -0.08229253, 4.3908, 0, 0.9921569, 1, 1,
0.01019721, 1.045578, -1.129155, 0, 0.9882353, 1, 1,
0.01447483, -0.318123, 1.735219, 0, 0.9803922, 1, 1,
0.01793775, -1.655244, 2.68904, 0, 0.9764706, 1, 1,
0.01903793, 1.08889, 0.8493496, 0, 0.9686275, 1, 1,
0.019968, -0.003791816, -0.9590784, 0, 0.9647059, 1, 1,
0.02621956, 0.95631, -0.8800274, 0, 0.9568627, 1, 1,
0.0310747, -0.4602742, 4.082725, 0, 0.9529412, 1, 1,
0.03500383, -0.532794, 3.635703, 0, 0.945098, 1, 1,
0.03565301, -0.1701438, 2.399709, 0, 0.9411765, 1, 1,
0.03612712, 0.6855514, 0.6517352, 0, 0.9333333, 1, 1,
0.03672744, -0.305523, 1.560821, 0, 0.9294118, 1, 1,
0.03848088, 0.201632, 0.06108159, 0, 0.9215686, 1, 1,
0.03969178, 1.253107, -1.586251, 0, 0.9176471, 1, 1,
0.0405531, -1.497092, 1.233754, 0, 0.9098039, 1, 1,
0.04295117, -1.31298, 1.61654, 0, 0.9058824, 1, 1,
0.04991424, -1.174881, 2.490871, 0, 0.8980392, 1, 1,
0.04997395, -0.9584814, 3.413036, 0, 0.8901961, 1, 1,
0.05431272, -0.5340465, 1.754167, 0, 0.8862745, 1, 1,
0.05444475, -1.518289, 3.989142, 0, 0.8784314, 1, 1,
0.05488919, 1.065226, 0.7966451, 0, 0.8745098, 1, 1,
0.05804275, 0.2061137, -0.09029502, 0, 0.8666667, 1, 1,
0.0589318, 0.7590349, 0.3779019, 0, 0.8627451, 1, 1,
0.06018777, 0.9371262, 0.05729103, 0, 0.854902, 1, 1,
0.06092526, 2.358649, 1.301295, 0, 0.8509804, 1, 1,
0.06206979, 0.229084, 0.5583934, 0, 0.8431373, 1, 1,
0.06371081, 1.331539, -0.2072675, 0, 0.8392157, 1, 1,
0.06674838, 0.62433, -0.5918358, 0, 0.8313726, 1, 1,
0.06943004, -0.2942265, 3.667071, 0, 0.827451, 1, 1,
0.07683209, -0.8543302, 2.870626, 0, 0.8196079, 1, 1,
0.07695678, 0.6125581, -0.05159037, 0, 0.8156863, 1, 1,
0.07751216, 0.1413908, -0.9907423, 0, 0.8078431, 1, 1,
0.08075387, -1.484734, 2.707179, 0, 0.8039216, 1, 1,
0.0810259, -1.057922, 3.026749, 0, 0.7960784, 1, 1,
0.09224774, 0.03419139, 1.33277, 0, 0.7882353, 1, 1,
0.0931858, -1.89273, 3.071994, 0, 0.7843137, 1, 1,
0.09444922, 1.434883, 0.002603138, 0, 0.7764706, 1, 1,
0.1005713, -0.3799659, 2.563878, 0, 0.772549, 1, 1,
0.1032935, 0.3468169, -0.755714, 0, 0.7647059, 1, 1,
0.1038896, -1.014315, 2.42028, 0, 0.7607843, 1, 1,
0.1039802, 0.009944591, 0.8187553, 0, 0.7529412, 1, 1,
0.1045355, 0.02608749, 2.608039, 0, 0.7490196, 1, 1,
0.1055914, 0.2678053, 0.02879933, 0, 0.7411765, 1, 1,
0.1062985, 0.854879, -0.2188111, 0, 0.7372549, 1, 1,
0.1108107, -1.355923, 2.838323, 0, 0.7294118, 1, 1,
0.1139528, -2.302893, 3.711745, 0, 0.7254902, 1, 1,
0.1147762, -2.439931, 3.209938, 0, 0.7176471, 1, 1,
0.1219308, -0.5999953, 4.150511, 0, 0.7137255, 1, 1,
0.1265405, 0.2518453, 0.7605907, 0, 0.7058824, 1, 1,
0.1269872, 0.003218224, 1.975, 0, 0.6980392, 1, 1,
0.1279676, -0.5319185, 4.835907, 0, 0.6941177, 1, 1,
0.1348576, 0.59901, -0.8521684, 0, 0.6862745, 1, 1,
0.1354919, -0.07156815, 0.726486, 0, 0.682353, 1, 1,
0.1387577, 0.6703205, -0.01089255, 0, 0.6745098, 1, 1,
0.1422743, 1.455487, 0.6207881, 0, 0.6705883, 1, 1,
0.1429483, -0.4937927, 3.264969, 0, 0.6627451, 1, 1,
0.1471111, 1.140417, 0.8205616, 0, 0.6588235, 1, 1,
0.1476513, -0.3440731, 2.080806, 0, 0.6509804, 1, 1,
0.1483786, -1.814355, 1.797808, 0, 0.6470588, 1, 1,
0.1497897, -0.2523663, 2.077734, 0, 0.6392157, 1, 1,
0.151394, -1.643196, 2.504869, 0, 0.6352941, 1, 1,
0.155653, -0.2573098, 1.997217, 0, 0.627451, 1, 1,
0.1574374, -0.3408112, 1.086838, 0, 0.6235294, 1, 1,
0.1594753, -0.3462171, 3.1477, 0, 0.6156863, 1, 1,
0.1595353, 0.8903561, 0.5966783, 0, 0.6117647, 1, 1,
0.1628125, -0.9152939, 3.61816, 0, 0.6039216, 1, 1,
0.1633283, -0.9344968, 5.305791, 0, 0.5960785, 1, 1,
0.1639698, -1.526573, 0.3421264, 0, 0.5921569, 1, 1,
0.1649177, -0.532032, 3.265022, 0, 0.5843138, 1, 1,
0.1660231, 0.3769873, 2.119662, 0, 0.5803922, 1, 1,
0.1665301, -1.096202, 4.464372, 0, 0.572549, 1, 1,
0.17045, -1.252828, 3.600863, 0, 0.5686275, 1, 1,
0.1709588, -1.940705, 1.977719, 0, 0.5607843, 1, 1,
0.1732179, 0.1369389, -0.561198, 0, 0.5568628, 1, 1,
0.1748783, 1.503653, 0.125125, 0, 0.5490196, 1, 1,
0.1779275, 1.410309, -0.3734286, 0, 0.5450981, 1, 1,
0.1800677, -1.402924, 4.337427, 0, 0.5372549, 1, 1,
0.1810578, -0.03249093, 1.815004, 0, 0.5333334, 1, 1,
0.1835445, 1.222582, 1.271425, 0, 0.5254902, 1, 1,
0.1853737, -0.09768843, 0.3814215, 0, 0.5215687, 1, 1,
0.1870915, -0.3325184, 1.567469, 0, 0.5137255, 1, 1,
0.1897324, 0.1363744, 1.229409, 0, 0.509804, 1, 1,
0.1926428, -0.8587766, 2.128957, 0, 0.5019608, 1, 1,
0.1929217, -2.343668, 2.682168, 0, 0.4941176, 1, 1,
0.19411, 0.09807421, 1.26173, 0, 0.4901961, 1, 1,
0.1964453, -0.3089764, 2.260122, 0, 0.4823529, 1, 1,
0.1992814, 1.630968, 1.034683, 0, 0.4784314, 1, 1,
0.2011714, 0.8186346, 1.370943, 0, 0.4705882, 1, 1,
0.2013208, 0.5970506, 2.177649, 0, 0.4666667, 1, 1,
0.2024829, 1.423949, -0.1568536, 0, 0.4588235, 1, 1,
0.2052266, 0.6058051, -1.907815, 0, 0.454902, 1, 1,
0.2083295, 0.4476597, -0.8697564, 0, 0.4470588, 1, 1,
0.2108188, 0.05052425, -0.05739596, 0, 0.4431373, 1, 1,
0.2121446, 0.03344651, 0.3418244, 0, 0.4352941, 1, 1,
0.2153025, -0.3703167, 3.357561, 0, 0.4313726, 1, 1,
0.2181592, 1.064237, -0.5409592, 0, 0.4235294, 1, 1,
0.219109, 2.484966, 1.820184, 0, 0.4196078, 1, 1,
0.2205901, -0.8824973, 2.395889, 0, 0.4117647, 1, 1,
0.221037, 0.570564, -1.087014, 0, 0.4078431, 1, 1,
0.2212542, -2.203228, 3.171508, 0, 0.4, 1, 1,
0.2214728, -0.3638523, 2.685645, 0, 0.3921569, 1, 1,
0.2287302, 0.05208057, 1.200862, 0, 0.3882353, 1, 1,
0.2351941, -0.03407717, 1.356159, 0, 0.3803922, 1, 1,
0.2369854, -0.262462, 3.232826, 0, 0.3764706, 1, 1,
0.2383044, -0.3667363, 3.533911, 0, 0.3686275, 1, 1,
0.2404418, -0.7833644, 2.319763, 0, 0.3647059, 1, 1,
0.2443217, 0.0207528, 1.003554, 0, 0.3568628, 1, 1,
0.2496285, -1.344614, 2.318457, 0, 0.3529412, 1, 1,
0.2590077, -0.5662013, 2.415459, 0, 0.345098, 1, 1,
0.2593248, 1.400423, 0.4613072, 0, 0.3411765, 1, 1,
0.260411, 0.3553109, 1.032354, 0, 0.3333333, 1, 1,
0.2618517, -2.077743, 2.708215, 0, 0.3294118, 1, 1,
0.2645888, 1.171225, 0.1663913, 0, 0.3215686, 1, 1,
0.2690772, 0.9890733, -0.6440412, 0, 0.3176471, 1, 1,
0.271408, -0.5655285, 3.448823, 0, 0.3098039, 1, 1,
0.2716758, -0.5008907, 1.317769, 0, 0.3058824, 1, 1,
0.2758989, 0.4285027, 0.6112905, 0, 0.2980392, 1, 1,
0.2762901, -0.03367379, 0.2897622, 0, 0.2901961, 1, 1,
0.2807562, -0.9369038, 3.436857, 0, 0.2862745, 1, 1,
0.2830127, 0.1273286, 2.620814, 0, 0.2784314, 1, 1,
0.2933099, 1.315203, -0.1331238, 0, 0.2745098, 1, 1,
0.2934393, -0.475293, 1.40582, 0, 0.2666667, 1, 1,
0.2968768, 1.309996, -0.1173886, 0, 0.2627451, 1, 1,
0.2991266, -0.7897869, 3.71607, 0, 0.254902, 1, 1,
0.3022243, 1.691516, 0.7053625, 0, 0.2509804, 1, 1,
0.3153281, 0.4551198, 1.567925, 0, 0.2431373, 1, 1,
0.3184816, -1.454489, 3.443341, 0, 0.2392157, 1, 1,
0.3197548, 0.8978554, 1.830724, 0, 0.2313726, 1, 1,
0.3213958, 1.359469, 0.3811564, 0, 0.227451, 1, 1,
0.3214454, 2.055891, -2.483471, 0, 0.2196078, 1, 1,
0.3217989, 0.7094438, 0.6868526, 0, 0.2156863, 1, 1,
0.3230647, -1.907328, 4.700305, 0, 0.2078431, 1, 1,
0.323716, 0.2498118, 1.40132, 0, 0.2039216, 1, 1,
0.3246333, 0.6324118, -0.6341456, 0, 0.1960784, 1, 1,
0.3262662, -0.5185407, 2.384484, 0, 0.1882353, 1, 1,
0.3324816, -1.479932, 3.508308, 0, 0.1843137, 1, 1,
0.3338072, 0.1889812, -0.07307114, 0, 0.1764706, 1, 1,
0.3356605, 0.4724365, 0.7966525, 0, 0.172549, 1, 1,
0.3365881, 1.065924, 0.4647485, 0, 0.1647059, 1, 1,
0.3384472, -0.2530679, 2.275271, 0, 0.1607843, 1, 1,
0.3385169, -1.921937, 2.896096, 0, 0.1529412, 1, 1,
0.3401595, 1.767752, -1.400187, 0, 0.1490196, 1, 1,
0.340895, 0.8083769, 0.1841246, 0, 0.1411765, 1, 1,
0.3410231, -0.4405748, 1.885313, 0, 0.1372549, 1, 1,
0.3451311, 0.6340337, 1.997095, 0, 0.1294118, 1, 1,
0.345998, 0.1805443, 1.135663, 0, 0.1254902, 1, 1,
0.3464786, 0.2724903, 1.151431, 0, 0.1176471, 1, 1,
0.3468233, -1.404404, 2.671146, 0, 0.1137255, 1, 1,
0.3492253, -1.973158, 2.923971, 0, 0.1058824, 1, 1,
0.3511831, 1.175097, -0.4067051, 0, 0.09803922, 1, 1,
0.3522273, 0.4178073, 0.4948901, 0, 0.09411765, 1, 1,
0.3544016, -2.115428, 2.476046, 0, 0.08627451, 1, 1,
0.3545548, -0.04587869, 2.675606, 0, 0.08235294, 1, 1,
0.3563159, -0.3847112, 2.078817, 0, 0.07450981, 1, 1,
0.3564727, 0.3306, 0.9317462, 0, 0.07058824, 1, 1,
0.3580062, -0.5386007, 1.323725, 0, 0.0627451, 1, 1,
0.3601203, -1.45185, 4.302632, 0, 0.05882353, 1, 1,
0.361618, 0.2494219, 0.4433878, 0, 0.05098039, 1, 1,
0.3655923, -0.2022024, 1.848545, 0, 0.04705882, 1, 1,
0.3665206, 1.74322, 2.135015, 0, 0.03921569, 1, 1,
0.3691217, -0.3487191, 3.448265, 0, 0.03529412, 1, 1,
0.3695596, -0.02837507, 2.076908, 0, 0.02745098, 1, 1,
0.3702244, -1.521527, 2.247723, 0, 0.02352941, 1, 1,
0.3709075, 0.715622, -0.0495359, 0, 0.01568628, 1, 1,
0.3726472, -1.035127, 2.670638, 0, 0.01176471, 1, 1,
0.3737616, -0.3702434, 4.511055, 0, 0.003921569, 1, 1,
0.3742954, 1.702595, -1.287178, 0.003921569, 0, 1, 1,
0.3758828, 0.496005, 1.099748, 0.007843138, 0, 1, 1,
0.3824042, 0.2958704, 2.147498, 0.01568628, 0, 1, 1,
0.3855151, 0.9676997, 1.537375, 0.01960784, 0, 1, 1,
0.3859481, -2.120071, 2.468627, 0.02745098, 0, 1, 1,
0.3881724, 0.7148082, 0.3336782, 0.03137255, 0, 1, 1,
0.3891878, 0.5680218, 0.9151561, 0.03921569, 0, 1, 1,
0.3932835, -0.5690228, 1.328224, 0.04313726, 0, 1, 1,
0.3933829, 0.3474805, 1.916281, 0.05098039, 0, 1, 1,
0.3940804, -0.6151556, 2.4031, 0.05490196, 0, 1, 1,
0.4011106, 0.4376409, 0.4290726, 0.0627451, 0, 1, 1,
0.4018143, 0.6863416, 1.291247, 0.06666667, 0, 1, 1,
0.4024635, -0.6037304, 2.828405, 0.07450981, 0, 1, 1,
0.4079481, 0.355894, 2.587, 0.07843138, 0, 1, 1,
0.415934, 0.1286346, 3.066742, 0.08627451, 0, 1, 1,
0.4229479, -0.4836448, 1.115869, 0.09019608, 0, 1, 1,
0.4240405, 0.1661606, 0.2671621, 0.09803922, 0, 1, 1,
0.4267042, 0.4601677, -0.2273688, 0.1058824, 0, 1, 1,
0.4320767, 0.2568275, 0.7254412, 0.1098039, 0, 1, 1,
0.4340439, 0.0306471, 0.3761282, 0.1176471, 0, 1, 1,
0.4411815, 0.9496793, -0.2774822, 0.1215686, 0, 1, 1,
0.4450817, 1.188988, 1.967972, 0.1294118, 0, 1, 1,
0.4489199, -0.4196533, 2.434111, 0.1333333, 0, 1, 1,
0.4553984, 0.629905, -0.342188, 0.1411765, 0, 1, 1,
0.4575457, -0.9466926, 4.190008, 0.145098, 0, 1, 1,
0.4627861, -0.6006578, 3.965297, 0.1529412, 0, 1, 1,
0.4666384, 0.1114385, 2.567525, 0.1568628, 0, 1, 1,
0.4727423, 0.2256422, 1.074445, 0.1647059, 0, 1, 1,
0.4749949, 0.9562563, 0.9827974, 0.1686275, 0, 1, 1,
0.4766274, -0.7081682, 3.073725, 0.1764706, 0, 1, 1,
0.4769691, -0.838431, 3.053617, 0.1803922, 0, 1, 1,
0.4779799, 0.9282381, -0.2988352, 0.1882353, 0, 1, 1,
0.478541, 0.0290476, 1.132211, 0.1921569, 0, 1, 1,
0.4787823, -2.258975, 4.052969, 0.2, 0, 1, 1,
0.4809106, 0.4269275, 1.494788, 0.2078431, 0, 1, 1,
0.4858551, -0.8536622, 3.730519, 0.2117647, 0, 1, 1,
0.4933105, -1.547142, 3.410998, 0.2196078, 0, 1, 1,
0.4969157, -0.1612273, 0.3409727, 0.2235294, 0, 1, 1,
0.500611, -0.7228189, 2.858589, 0.2313726, 0, 1, 1,
0.5038412, 0.6137431, 1.467112, 0.2352941, 0, 1, 1,
0.5081528, -0.2020262, 1.702812, 0.2431373, 0, 1, 1,
0.511951, -0.005791173, 2.702663, 0.2470588, 0, 1, 1,
0.5135981, 0.7583179, 0.04482724, 0.254902, 0, 1, 1,
0.5180609, 0.3715198, -0.4362389, 0.2588235, 0, 1, 1,
0.5229528, 0.2808834, 0.9439027, 0.2666667, 0, 1, 1,
0.5250724, 0.3694477, 0.5334773, 0.2705882, 0, 1, 1,
0.5277924, -0.01345652, 1.732081, 0.2784314, 0, 1, 1,
0.5316693, -0.356487, 2.85125, 0.282353, 0, 1, 1,
0.5342288, -0.1370402, 3.007666, 0.2901961, 0, 1, 1,
0.5392249, 0.5785243, 0.7657536, 0.2941177, 0, 1, 1,
0.5406061, 0.2942523, 2.779505, 0.3019608, 0, 1, 1,
0.5419616, 0.5370783, 1.12531, 0.3098039, 0, 1, 1,
0.5483953, -1.959251, 1.612066, 0.3137255, 0, 1, 1,
0.5491685, 1.766258, -0.2717288, 0.3215686, 0, 1, 1,
0.5492887, 1.605095, 0.4352588, 0.3254902, 0, 1, 1,
0.5494526, -0.3349302, 1.109381, 0.3333333, 0, 1, 1,
0.5515147, -0.3039282, 1.059493, 0.3372549, 0, 1, 1,
0.5572249, 0.5350876, -0.8199051, 0.345098, 0, 1, 1,
0.5582644, -1.268514, 2.183978, 0.3490196, 0, 1, 1,
0.5587633, -1.283771, 3.011194, 0.3568628, 0, 1, 1,
0.5603076, -1.731535, 3.396981, 0.3607843, 0, 1, 1,
0.5657077, 0.00932095, 1.911632, 0.3686275, 0, 1, 1,
0.5686761, -0.6971771, 3.162449, 0.372549, 0, 1, 1,
0.569204, -1.83899, 3.334079, 0.3803922, 0, 1, 1,
0.5699337, 1.57499, -0.01630111, 0.3843137, 0, 1, 1,
0.5717952, 0.4193318, 0.2003746, 0.3921569, 0, 1, 1,
0.5766496, 1.052662, 0.1900729, 0.3960784, 0, 1, 1,
0.5813637, -2.352368, 3.074066, 0.4039216, 0, 1, 1,
0.5841286, 1.251929, 1.235396, 0.4117647, 0, 1, 1,
0.5841408, -1.845759, 4.484884, 0.4156863, 0, 1, 1,
0.5865057, -1.444431, 1.881076, 0.4235294, 0, 1, 1,
0.5872715, 0.6257042, 0.6763084, 0.427451, 0, 1, 1,
0.5903344, 0.3921104, 0.119903, 0.4352941, 0, 1, 1,
0.5907475, 0.4395391, 0.7360215, 0.4392157, 0, 1, 1,
0.5936822, 1.55227, -0.292776, 0.4470588, 0, 1, 1,
0.5955172, 2.206572, -0.5276079, 0.4509804, 0, 1, 1,
0.59726, -0.4248597, 1.102166, 0.4588235, 0, 1, 1,
0.5983818, 0.1327308, 2.737251, 0.4627451, 0, 1, 1,
0.6068488, 0.9316618, 1.405481, 0.4705882, 0, 1, 1,
0.6096357, 0.5460553, 2.41965, 0.4745098, 0, 1, 1,
0.61239, -0.9886395, 4.157109, 0.4823529, 0, 1, 1,
0.612435, 0.4562378, 1.450301, 0.4862745, 0, 1, 1,
0.6126591, -0.533234, 2.738449, 0.4941176, 0, 1, 1,
0.6294416, 0.09863438, 0.08709363, 0.5019608, 0, 1, 1,
0.6338797, -0.07972406, 2.054949, 0.5058824, 0, 1, 1,
0.641119, 0.9473129, -0.2323276, 0.5137255, 0, 1, 1,
0.6414567, -1.274203, 1.846801, 0.5176471, 0, 1, 1,
0.646114, 2.655112, 2.476938, 0.5254902, 0, 1, 1,
0.6496443, 0.8119646, 1.638585, 0.5294118, 0, 1, 1,
0.6508799, 0.5326342, 0.738781, 0.5372549, 0, 1, 1,
0.6653001, 1.2132, 1.741965, 0.5411765, 0, 1, 1,
0.6660625, 1.226537, -1.333047, 0.5490196, 0, 1, 1,
0.66819, 1.401432, -0.02984271, 0.5529412, 0, 1, 1,
0.6694834, -0.3392296, 1.466384, 0.5607843, 0, 1, 1,
0.6722515, -2.076235, 4.747929, 0.5647059, 0, 1, 1,
0.6722826, 0.02709277, 0.5284379, 0.572549, 0, 1, 1,
0.6767719, 0.1860719, 0.5530257, 0.5764706, 0, 1, 1,
0.6808619, 0.4933299, 1.503779, 0.5843138, 0, 1, 1,
0.6817563, 1.993685, 1.195835, 0.5882353, 0, 1, 1,
0.6835334, 0.2897964, 2.486708, 0.5960785, 0, 1, 1,
0.6838511, 1.017801, 0.4446359, 0.6039216, 0, 1, 1,
0.6863095, -0.5772372, 1.910674, 0.6078432, 0, 1, 1,
0.7011008, 1.579841, -1.555728, 0.6156863, 0, 1, 1,
0.7021956, -1.669729, 3.376378, 0.6196079, 0, 1, 1,
0.7096842, 0.2023768, 0.5543042, 0.627451, 0, 1, 1,
0.7109734, -0.4702288, 1.89059, 0.6313726, 0, 1, 1,
0.7120891, 0.9307449, 1.015425, 0.6392157, 0, 1, 1,
0.71311, 0.1943404, 0.9424405, 0.6431373, 0, 1, 1,
0.7209888, -1.92756, 3.097798, 0.6509804, 0, 1, 1,
0.7244077, -2.352346, 2.029902, 0.654902, 0, 1, 1,
0.7253559, 0.8998801, -0.01980973, 0.6627451, 0, 1, 1,
0.7258791, 0.02250319, 3.093398, 0.6666667, 0, 1, 1,
0.7294296, 0.1086497, 2.176398, 0.6745098, 0, 1, 1,
0.7348928, -0.6571983, 1.592514, 0.6784314, 0, 1, 1,
0.7350208, 1.290317, 0.6288469, 0.6862745, 0, 1, 1,
0.7352002, -0.4459372, 0.9335091, 0.6901961, 0, 1, 1,
0.7365069, -1.618628, 1.57529, 0.6980392, 0, 1, 1,
0.7381179, 1.197192, 3.132629, 0.7058824, 0, 1, 1,
0.73949, 0.1564948, 0.1566667, 0.7098039, 0, 1, 1,
0.7409909, -0.7811964, 1.957862, 0.7176471, 0, 1, 1,
0.7453994, -1.204138, 2.655581, 0.7215686, 0, 1, 1,
0.7534781, -0.4490736, 1.055677, 0.7294118, 0, 1, 1,
0.7547536, 0.6083844, 2.001177, 0.7333333, 0, 1, 1,
0.7593183, -1.07883, 1.589207, 0.7411765, 0, 1, 1,
0.7621871, -0.4300757, 1.599167, 0.7450981, 0, 1, 1,
0.772267, -1.109887, 2.986502, 0.7529412, 0, 1, 1,
0.7749019, -0.403327, 1.561821, 0.7568628, 0, 1, 1,
0.7826756, -0.6210046, 4.418452, 0.7647059, 0, 1, 1,
0.7892826, 0.4173453, -0.1073765, 0.7686275, 0, 1, 1,
0.7958984, -0.741156, 0.6518188, 0.7764706, 0, 1, 1,
0.7985185, -0.6881222, 1.679738, 0.7803922, 0, 1, 1,
0.8023875, -0.5690024, -0.1118822, 0.7882353, 0, 1, 1,
0.8034549, -0.8258709, 3.804292, 0.7921569, 0, 1, 1,
0.8118438, -2.048788, 2.103221, 0.8, 0, 1, 1,
0.812826, 1.39577, 1.619319, 0.8078431, 0, 1, 1,
0.8150489, 0.2168719, 1.153877, 0.8117647, 0, 1, 1,
0.8161541, 1.104109, 1.772907, 0.8196079, 0, 1, 1,
0.818005, 0.9185212, -0.5857992, 0.8235294, 0, 1, 1,
0.8193006, -0.213247, 5.315583, 0.8313726, 0, 1, 1,
0.8210505, 0.9589183, 0.3903195, 0.8352941, 0, 1, 1,
0.8274045, 0.2400584, 3.080011, 0.8431373, 0, 1, 1,
0.8344859, -0.8456858, 1.984342, 0.8470588, 0, 1, 1,
0.8359275, 0.6875491, 0.1207665, 0.854902, 0, 1, 1,
0.8388409, -0.2003599, 0.1981433, 0.8588235, 0, 1, 1,
0.8436614, -0.5457469, 2.191026, 0.8666667, 0, 1, 1,
0.845681, 2.326672, 0.07575539, 0.8705882, 0, 1, 1,
0.8514317, -1.024952, 2.453952, 0.8784314, 0, 1, 1,
0.8607278, 0.8710632, 1.606206, 0.8823529, 0, 1, 1,
0.864956, -0.5094296, 2.398486, 0.8901961, 0, 1, 1,
0.8654506, -0.1825659, 1.972567, 0.8941177, 0, 1, 1,
0.8659031, -0.7967116, 1.736788, 0.9019608, 0, 1, 1,
0.866461, -1.929555, 4.041795, 0.9098039, 0, 1, 1,
0.8691152, 0.6191937, 1.673089, 0.9137255, 0, 1, 1,
0.8694454, -0.3181792, 1.754485, 0.9215686, 0, 1, 1,
0.8702928, 0.3930049, 0.779735, 0.9254902, 0, 1, 1,
0.8711608, 0.4493321, 0.9062293, 0.9333333, 0, 1, 1,
0.8716111, 0.9444271, 1.547112, 0.9372549, 0, 1, 1,
0.8754269, 0.6666598, 0.8892819, 0.945098, 0, 1, 1,
0.8773299, 0.06271166, 2.862075, 0.9490196, 0, 1, 1,
0.8807276, 0.8079965, 0.2550226, 0.9568627, 0, 1, 1,
0.8921366, 1.535574, -0.05292119, 0.9607843, 0, 1, 1,
0.8995221, 0.3077369, 0.8349884, 0.9686275, 0, 1, 1,
0.8997279, -0.2767238, 1.74088, 0.972549, 0, 1, 1,
0.9062396, 1.398873, 1.145003, 0.9803922, 0, 1, 1,
0.9118605, -0.6268693, 2.157434, 0.9843137, 0, 1, 1,
0.9125863, 1.192253, 1.486284, 0.9921569, 0, 1, 1,
0.9194683, -1.23689, 1.121145, 0.9960784, 0, 1, 1,
0.9198946, -0.3670987, 1.412674, 1, 0, 0.9960784, 1,
0.9223055, -0.09752694, 2.863015, 1, 0, 0.9882353, 1,
0.9256378, 0.8704619, 1.069973, 1, 0, 0.9843137, 1,
0.9257692, -0.001864765, 2.972327, 1, 0, 0.9764706, 1,
0.9287062, -0.1791291, 1.100539, 1, 0, 0.972549, 1,
0.932859, -2.425452, 2.051497, 1, 0, 0.9647059, 1,
0.9432197, -0.4612655, 3.796384, 1, 0, 0.9607843, 1,
0.9435811, 0.07006527, 1.782807, 1, 0, 0.9529412, 1,
0.9468322, -0.203912, 3.189169, 1, 0, 0.9490196, 1,
0.962464, -0.1066127, 1.536156, 1, 0, 0.9411765, 1,
0.9790477, -0.8579927, 3.176133, 1, 0, 0.9372549, 1,
0.9797215, 0.3503785, 0.5995492, 1, 0, 0.9294118, 1,
0.9823906, -0.1528753, 2.4862, 1, 0, 0.9254902, 1,
0.9826964, -0.09028219, 1.528374, 1, 0, 0.9176471, 1,
0.9938194, -0.3785692, 1.276691, 1, 0, 0.9137255, 1,
1.001022, -1.143053, -1.241948, 1, 0, 0.9058824, 1,
1.005587, -0.325502, 3.491501, 1, 0, 0.9019608, 1,
1.005683, 0.1620833, 0.7672679, 1, 0, 0.8941177, 1,
1.007827, 0.6812944, 1.453876, 1, 0, 0.8862745, 1,
1.013864, 0.368031, 1.240585, 1, 0, 0.8823529, 1,
1.018477, 0.9373841, -1.31393, 1, 0, 0.8745098, 1,
1.019004, -2.03466, 2.43451, 1, 0, 0.8705882, 1,
1.019452, -1.146071, 2.776557, 1, 0, 0.8627451, 1,
1.022832, 0.2101612, 2.215237, 1, 0, 0.8588235, 1,
1.024817, -0.4788215, 1.361694, 1, 0, 0.8509804, 1,
1.025319, 0.7924206, 0.8273966, 1, 0, 0.8470588, 1,
1.026294, -0.2918771, 1.959166, 1, 0, 0.8392157, 1,
1.027318, -0.4005252, 0.894372, 1, 0, 0.8352941, 1,
1.031206, -0.4860182, 1.704285, 1, 0, 0.827451, 1,
1.034582, 0.06149194, 1.137593, 1, 0, 0.8235294, 1,
1.035772, -0.7343105, 1.681284, 1, 0, 0.8156863, 1,
1.036588, -0.1550738, 2.265758, 1, 0, 0.8117647, 1,
1.045145, 0.4926075, 1.236128, 1, 0, 0.8039216, 1,
1.052263, 0.3984471, 1.40807, 1, 0, 0.7960784, 1,
1.052788, 0.7215466, -0.4022733, 1, 0, 0.7921569, 1,
1.057024, 1.73449, 0.5966038, 1, 0, 0.7843137, 1,
1.064315, 0.4531446, 0.3117628, 1, 0, 0.7803922, 1,
1.069953, -0.60942, 1.777727, 1, 0, 0.772549, 1,
1.07107, 1.156115, 0.6695706, 1, 0, 0.7686275, 1,
1.082626, 1.660722, 0.4142685, 1, 0, 0.7607843, 1,
1.088669, -0.009928342, 1.468948, 1, 0, 0.7568628, 1,
1.093783, -0.2202056, 1.281178, 1, 0, 0.7490196, 1,
1.096542, -0.100307, 1.043478, 1, 0, 0.7450981, 1,
1.126456, -0.1723886, 1.199907, 1, 0, 0.7372549, 1,
1.130056, -0.006733616, 2.438823, 1, 0, 0.7333333, 1,
1.145633, 0.2917086, 0.6856548, 1, 0, 0.7254902, 1,
1.145763, 0.7549327, 0.8353269, 1, 0, 0.7215686, 1,
1.153343, -0.1077044, 1.482311, 1, 0, 0.7137255, 1,
1.159418, -1.581801, 4.960072, 1, 0, 0.7098039, 1,
1.175864, 0.3585308, 2.351922, 1, 0, 0.7019608, 1,
1.177888, -0.05427453, 1.20255, 1, 0, 0.6941177, 1,
1.184709, -0.387029, 1.569325, 1, 0, 0.6901961, 1,
1.187415, -0.03871211, 1.32161, 1, 0, 0.682353, 1,
1.189934, 0.8254846, 1.600131, 1, 0, 0.6784314, 1,
1.200856, 1.139557, 1.30631, 1, 0, 0.6705883, 1,
1.201829, -0.5759722, 2.854529, 1, 0, 0.6666667, 1,
1.203221, -0.7313054, 2.199368, 1, 0, 0.6588235, 1,
1.207448, -0.3553787, 0.9789286, 1, 0, 0.654902, 1,
1.2081, -1.862964, 2.288608, 1, 0, 0.6470588, 1,
1.210884, 1.029936, -0.9024974, 1, 0, 0.6431373, 1,
1.224321, 0.2744155, 0.9595468, 1, 0, 0.6352941, 1,
1.22635, 1.102878, 1.395916, 1, 0, 0.6313726, 1,
1.228746, 1.21817, 1.044039, 1, 0, 0.6235294, 1,
1.238982, 2.460753, 0.4957856, 1, 0, 0.6196079, 1,
1.239362, -1.479645, 3.24363, 1, 0, 0.6117647, 1,
1.241554, 0.5143865, -0.0490016, 1, 0, 0.6078432, 1,
1.278227, 0.0222596, 2.084712, 1, 0, 0.6, 1,
1.290161, -0.4167424, 3.783775, 1, 0, 0.5921569, 1,
1.311964, 0.687617, -1.616674, 1, 0, 0.5882353, 1,
1.317092, 0.005070227, 0.8853254, 1, 0, 0.5803922, 1,
1.318232, 0.8008108, 0.8148479, 1, 0, 0.5764706, 1,
1.322401, -1.150094, 1.838403, 1, 0, 0.5686275, 1,
1.328258, -0.3330492, 2.180285, 1, 0, 0.5647059, 1,
1.339872, -0.3173274, 1.92535, 1, 0, 0.5568628, 1,
1.345132, 2.110913, 0.7414812, 1, 0, 0.5529412, 1,
1.363786, 1.217978, 2.2505, 1, 0, 0.5450981, 1,
1.373325, 1.045832, 0.6506435, 1, 0, 0.5411765, 1,
1.374498, 2.776437, 0.1163258, 1, 0, 0.5333334, 1,
1.374771, -0.8896302, 1.638983, 1, 0, 0.5294118, 1,
1.376333, -1.355132, 2.603709, 1, 0, 0.5215687, 1,
1.38291, -0.6143718, 1.36364, 1, 0, 0.5176471, 1,
1.396059, -2.015608, 1.408599, 1, 0, 0.509804, 1,
1.419344, 0.9078836, 0.61644, 1, 0, 0.5058824, 1,
1.436456, -0.3380431, 1.17192, 1, 0, 0.4980392, 1,
1.445393, 1.242554, 2.056234, 1, 0, 0.4901961, 1,
1.447294, 1.72711, -0.8855763, 1, 0, 0.4862745, 1,
1.449361, -0.1368356, 2.422278, 1, 0, 0.4784314, 1,
1.455902, 0.2132312, -0.01836164, 1, 0, 0.4745098, 1,
1.460436, 1.090558, 0.2950106, 1, 0, 0.4666667, 1,
1.466299, 0.2350141, -1.214183, 1, 0, 0.4627451, 1,
1.469279, 1.405415, -1.230317, 1, 0, 0.454902, 1,
1.475142, 0.5382269, 3.922176, 1, 0, 0.4509804, 1,
1.481778, 1.4362, 1.102502, 1, 0, 0.4431373, 1,
1.494232, -0.9799464, 2.653272, 1, 0, 0.4392157, 1,
1.496254, 0.8925081, 0.9394394, 1, 0, 0.4313726, 1,
1.498846, 1.256672, -0.3584445, 1, 0, 0.427451, 1,
1.503792, 1.006405, 0.9259881, 1, 0, 0.4196078, 1,
1.506961, -0.0515652, 2.930766, 1, 0, 0.4156863, 1,
1.507335, 0.2395706, 2.149369, 1, 0, 0.4078431, 1,
1.514581, 1.093881, -1.08224, 1, 0, 0.4039216, 1,
1.515839, 0.7111154, 1.778403, 1, 0, 0.3960784, 1,
1.517308, -1.662067, 1.921857, 1, 0, 0.3882353, 1,
1.520602, 1.665861, -0.583549, 1, 0, 0.3843137, 1,
1.529771, -0.276667, 3.93417, 1, 0, 0.3764706, 1,
1.537986, 1.387263, -0.6767084, 1, 0, 0.372549, 1,
1.590147, -1.095521, 2.044294, 1, 0, 0.3647059, 1,
1.590497, -0.4748505, -0.2425051, 1, 0, 0.3607843, 1,
1.605516, -0.3493941, 1.100475, 1, 0, 0.3529412, 1,
1.607186, -0.9709079, 1.873378, 1, 0, 0.3490196, 1,
1.611003, 1.523313, 2.688445, 1, 0, 0.3411765, 1,
1.614961, -0.8976043, 3.038786, 1, 0, 0.3372549, 1,
1.635214, -0.04081942, 3.127606, 1, 0, 0.3294118, 1,
1.635236, 0.8669841, 2.477016, 1, 0, 0.3254902, 1,
1.636166, -0.453748, 1.735621, 1, 0, 0.3176471, 1,
1.643539, -0.3483019, 0.6560865, 1, 0, 0.3137255, 1,
1.645688, -0.5242954, 1.125856, 1, 0, 0.3058824, 1,
1.649962, -1.889789, 2.735841, 1, 0, 0.2980392, 1,
1.651001, -0.1562666, 2.863107, 1, 0, 0.2941177, 1,
1.680284, -0.3731946, 1.546512, 1, 0, 0.2862745, 1,
1.706498, -0.5207788, 0.6942313, 1, 0, 0.282353, 1,
1.722609, 0.6446671, 0.8881866, 1, 0, 0.2745098, 1,
1.725838, -1.141707, 2.807009, 1, 0, 0.2705882, 1,
1.735429, -1.492849, 3.123414, 1, 0, 0.2627451, 1,
1.738514, -0.5747424, 4.050111, 1, 0, 0.2588235, 1,
1.763364, 0.3583054, 0.7197508, 1, 0, 0.2509804, 1,
1.767682, -2.2558, 4.89188, 1, 0, 0.2470588, 1,
1.769175, 1.345783, -0.9917123, 1, 0, 0.2392157, 1,
1.769179, -1.57912, 1.581373, 1, 0, 0.2352941, 1,
1.770844, 0.5230404, 0.3234046, 1, 0, 0.227451, 1,
1.787566, 0.5143652, 1.4695, 1, 0, 0.2235294, 1,
1.787958, 0.5347441, 0.9131325, 1, 0, 0.2156863, 1,
1.800927, 0.9500419, 0.8568801, 1, 0, 0.2117647, 1,
1.807377, -1.570411, 2.844181, 1, 0, 0.2039216, 1,
1.820351, 1.081595, 1.412067, 1, 0, 0.1960784, 1,
1.837642, -0.7161486, 1.69696, 1, 0, 0.1921569, 1,
1.840322, 2.787078, -0.8255535, 1, 0, 0.1843137, 1,
1.841647, 0.483084, -0.2812963, 1, 0, 0.1803922, 1,
1.84691, -1.128092, 3.008552, 1, 0, 0.172549, 1,
1.885608, -1.848171, 2.358252, 1, 0, 0.1686275, 1,
1.924668, -0.8848076, 1.281795, 1, 0, 0.1607843, 1,
1.940716, -1.184704, 2.049749, 1, 0, 0.1568628, 1,
1.941936, -0.3947591, 2.693112, 1, 0, 0.1490196, 1,
1.948852, -1.700026, 4.637048, 1, 0, 0.145098, 1,
1.951569, 0.4175166, 1.53272, 1, 0, 0.1372549, 1,
1.985505, 0.3489101, 2.148247, 1, 0, 0.1333333, 1,
2.058891, 0.7467294, 2.340594, 1, 0, 0.1254902, 1,
2.089987, 0.3805511, 1.997616, 1, 0, 0.1215686, 1,
2.093848, 1.60967, 0.4138127, 1, 0, 0.1137255, 1,
2.10772, 1.004081, 0.5052224, 1, 0, 0.1098039, 1,
2.109798, 0.744138, -0.3249606, 1, 0, 0.1019608, 1,
2.143514, -1.723199, 2.020326, 1, 0, 0.09411765, 1,
2.153135, 1.653605, 0.2055326, 1, 0, 0.09019608, 1,
2.166977, -0.9058986, 2.036199, 1, 0, 0.08235294, 1,
2.220598, 0.4836163, 2.089887, 1, 0, 0.07843138, 1,
2.243031, -0.6862484, 1.203263, 1, 0, 0.07058824, 1,
2.309622, 0.920595, 1.183939, 1, 0, 0.06666667, 1,
2.352798, -0.07387598, 2.129535, 1, 0, 0.05882353, 1,
2.358782, 1.389723, 1.346235, 1, 0, 0.05490196, 1,
2.43066, -0.9602442, 1.695947, 1, 0, 0.04705882, 1,
2.472622, 0.695271, 1.186586, 1, 0, 0.04313726, 1,
2.514121, -1.508389, 4.065229, 1, 0, 0.03529412, 1,
2.534264, -1.575131, 1.897673, 1, 0, 0.03137255, 1,
2.721664, -0.3381366, 1.093071, 1, 0, 0.02352941, 1,
2.735784, 0.5515853, 1.222698, 1, 0, 0.01960784, 1,
2.820671, -0.4637102, 3.026855, 1, 0, 0.01176471, 1,
2.943014, -0.09725605, 1.803434, 1, 0, 0.007843138, 1
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
-0.1065156, -4.333529, -7.688671, 0, -0.5, 0.5, 0.5,
-0.1065156, -4.333529, -7.688671, 1, -0.5, 0.5, 0.5,
-0.1065156, -4.333529, -7.688671, 1, 1.5, 0.5, 0.5,
-0.1065156, -4.333529, -7.688671, 0, 1.5, 0.5, 0.5
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
-4.189836, -0.04712892, -7.688671, 0, -0.5, 0.5, 0.5,
-4.189836, -0.04712892, -7.688671, 1, -0.5, 0.5, 0.5,
-4.189836, -0.04712892, -7.688671, 1, 1.5, 0.5, 0.5,
-4.189836, -0.04712892, -7.688671, 0, 1.5, 0.5, 0.5
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
-4.189836, -4.333529, -0.1678827, 0, -0.5, 0.5, 0.5,
-4.189836, -4.333529, -0.1678827, 1, -0.5, 0.5, 0.5,
-4.189836, -4.333529, -0.1678827, 1, 1.5, 0.5, 0.5,
-4.189836, -4.333529, -0.1678827, 0, 1.5, 0.5, 0.5
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
-3, -3.34436, -5.953104,
2, -3.34436, -5.953104,
-3, -3.34436, -5.953104,
-3, -3.509221, -6.242366,
-2, -3.34436, -5.953104,
-2, -3.509221, -6.242366,
-1, -3.34436, -5.953104,
-1, -3.509221, -6.242366,
0, -3.34436, -5.953104,
0, -3.509221, -6.242366,
1, -3.34436, -5.953104,
1, -3.509221, -6.242366,
2, -3.34436, -5.953104,
2, -3.509221, -6.242366
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
-3, -3.838944, -6.820888, 0, -0.5, 0.5, 0.5,
-3, -3.838944, -6.820888, 1, -0.5, 0.5, 0.5,
-3, -3.838944, -6.820888, 1, 1.5, 0.5, 0.5,
-3, -3.838944, -6.820888, 0, 1.5, 0.5, 0.5,
-2, -3.838944, -6.820888, 0, -0.5, 0.5, 0.5,
-2, -3.838944, -6.820888, 1, -0.5, 0.5, 0.5,
-2, -3.838944, -6.820888, 1, 1.5, 0.5, 0.5,
-2, -3.838944, -6.820888, 0, 1.5, 0.5, 0.5,
-1, -3.838944, -6.820888, 0, -0.5, 0.5, 0.5,
-1, -3.838944, -6.820888, 1, -0.5, 0.5, 0.5,
-1, -3.838944, -6.820888, 1, 1.5, 0.5, 0.5,
-1, -3.838944, -6.820888, 0, 1.5, 0.5, 0.5,
0, -3.838944, -6.820888, 0, -0.5, 0.5, 0.5,
0, -3.838944, -6.820888, 1, -0.5, 0.5, 0.5,
0, -3.838944, -6.820888, 1, 1.5, 0.5, 0.5,
0, -3.838944, -6.820888, 0, 1.5, 0.5, 0.5,
1, -3.838944, -6.820888, 0, -0.5, 0.5, 0.5,
1, -3.838944, -6.820888, 1, -0.5, 0.5, 0.5,
1, -3.838944, -6.820888, 1, 1.5, 0.5, 0.5,
1, -3.838944, -6.820888, 0, 1.5, 0.5, 0.5,
2, -3.838944, -6.820888, 0, -0.5, 0.5, 0.5,
2, -3.838944, -6.820888, 1, -0.5, 0.5, 0.5,
2, -3.838944, -6.820888, 1, 1.5, 0.5, 0.5,
2, -3.838944, -6.820888, 0, 1.5, 0.5, 0.5
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
-3.247531, -3, -5.953104,
-3.247531, 3, -5.953104,
-3.247531, -3, -5.953104,
-3.404582, -3, -6.242366,
-3.247531, -2, -5.953104,
-3.404582, -2, -6.242366,
-3.247531, -1, -5.953104,
-3.404582, -1, -6.242366,
-3.247531, 0, -5.953104,
-3.404582, 0, -6.242366,
-3.247531, 1, -5.953104,
-3.404582, 1, -6.242366,
-3.247531, 2, -5.953104,
-3.404582, 2, -6.242366,
-3.247531, 3, -5.953104,
-3.404582, 3, -6.242366
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
-3.718683, -3, -6.820888, 0, -0.5, 0.5, 0.5,
-3.718683, -3, -6.820888, 1, -0.5, 0.5, 0.5,
-3.718683, -3, -6.820888, 1, 1.5, 0.5, 0.5,
-3.718683, -3, -6.820888, 0, 1.5, 0.5, 0.5,
-3.718683, -2, -6.820888, 0, -0.5, 0.5, 0.5,
-3.718683, -2, -6.820888, 1, -0.5, 0.5, 0.5,
-3.718683, -2, -6.820888, 1, 1.5, 0.5, 0.5,
-3.718683, -2, -6.820888, 0, 1.5, 0.5, 0.5,
-3.718683, -1, -6.820888, 0, -0.5, 0.5, 0.5,
-3.718683, -1, -6.820888, 1, -0.5, 0.5, 0.5,
-3.718683, -1, -6.820888, 1, 1.5, 0.5, 0.5,
-3.718683, -1, -6.820888, 0, 1.5, 0.5, 0.5,
-3.718683, 0, -6.820888, 0, -0.5, 0.5, 0.5,
-3.718683, 0, -6.820888, 1, -0.5, 0.5, 0.5,
-3.718683, 0, -6.820888, 1, 1.5, 0.5, 0.5,
-3.718683, 0, -6.820888, 0, 1.5, 0.5, 0.5,
-3.718683, 1, -6.820888, 0, -0.5, 0.5, 0.5,
-3.718683, 1, -6.820888, 1, -0.5, 0.5, 0.5,
-3.718683, 1, -6.820888, 1, 1.5, 0.5, 0.5,
-3.718683, 1, -6.820888, 0, 1.5, 0.5, 0.5,
-3.718683, 2, -6.820888, 0, -0.5, 0.5, 0.5,
-3.718683, 2, -6.820888, 1, -0.5, 0.5, 0.5,
-3.718683, 2, -6.820888, 1, 1.5, 0.5, 0.5,
-3.718683, 2, -6.820888, 0, 1.5, 0.5, 0.5,
-3.718683, 3, -6.820888, 0, -0.5, 0.5, 0.5,
-3.718683, 3, -6.820888, 1, -0.5, 0.5, 0.5,
-3.718683, 3, -6.820888, 1, 1.5, 0.5, 0.5,
-3.718683, 3, -6.820888, 0, 1.5, 0.5, 0.5
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
-3.247531, -3.34436, -4,
-3.247531, -3.34436, 4,
-3.247531, -3.34436, -4,
-3.404582, -3.509221, -4,
-3.247531, -3.34436, -2,
-3.404582, -3.509221, -2,
-3.247531, -3.34436, 0,
-3.404582, -3.509221, 0,
-3.247531, -3.34436, 2,
-3.404582, -3.509221, 2,
-3.247531, -3.34436, 4,
-3.404582, -3.509221, 4
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
-3.718683, -3.838944, -4, 0, -0.5, 0.5, 0.5,
-3.718683, -3.838944, -4, 1, -0.5, 0.5, 0.5,
-3.718683, -3.838944, -4, 1, 1.5, 0.5, 0.5,
-3.718683, -3.838944, -4, 0, 1.5, 0.5, 0.5,
-3.718683, -3.838944, -2, 0, -0.5, 0.5, 0.5,
-3.718683, -3.838944, -2, 1, -0.5, 0.5, 0.5,
-3.718683, -3.838944, -2, 1, 1.5, 0.5, 0.5,
-3.718683, -3.838944, -2, 0, 1.5, 0.5, 0.5,
-3.718683, -3.838944, 0, 0, -0.5, 0.5, 0.5,
-3.718683, -3.838944, 0, 1, -0.5, 0.5, 0.5,
-3.718683, -3.838944, 0, 1, 1.5, 0.5, 0.5,
-3.718683, -3.838944, 0, 0, 1.5, 0.5, 0.5,
-3.718683, -3.838944, 2, 0, -0.5, 0.5, 0.5,
-3.718683, -3.838944, 2, 1, -0.5, 0.5, 0.5,
-3.718683, -3.838944, 2, 1, 1.5, 0.5, 0.5,
-3.718683, -3.838944, 2, 0, 1.5, 0.5, 0.5,
-3.718683, -3.838944, 4, 0, -0.5, 0.5, 0.5,
-3.718683, -3.838944, 4, 1, -0.5, 0.5, 0.5,
-3.718683, -3.838944, 4, 1, 1.5, 0.5, 0.5,
-3.718683, -3.838944, 4, 0, 1.5, 0.5, 0.5
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
-3.247531, -3.34436, -5.953104,
-3.247531, 3.250102, -5.953104,
-3.247531, -3.34436, 5.617339,
-3.247531, 3.250102, 5.617339,
-3.247531, -3.34436, -5.953104,
-3.247531, -3.34436, 5.617339,
-3.247531, 3.250102, -5.953104,
-3.247531, 3.250102, 5.617339,
-3.247531, -3.34436, -5.953104,
3.0345, -3.34436, -5.953104,
-3.247531, -3.34436, 5.617339,
3.0345, -3.34436, 5.617339,
-3.247531, 3.250102, -5.953104,
3.0345, 3.250102, -5.953104,
-3.247531, 3.250102, 5.617339,
3.0345, 3.250102, 5.617339,
3.0345, -3.34436, -5.953104,
3.0345, 3.250102, -5.953104,
3.0345, -3.34436, 5.617339,
3.0345, 3.250102, 5.617339,
3.0345, -3.34436, -5.953104,
3.0345, -3.34436, 5.617339,
3.0345, 3.250102, -5.953104,
3.0345, 3.250102, 5.617339
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
var radius = 7.862871;
var distance = 34.9828;
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
mvMatrix.translate( 0.1065156, 0.04712892, 0.1678827 );
mvMatrix.scale( 1.353303, 1.289186, 0.7347592 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.9828);
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


