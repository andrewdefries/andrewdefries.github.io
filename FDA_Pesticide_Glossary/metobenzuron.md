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
-3.067177, 0.07718571, 0.01974902, 1, 0, 0, 1,
-2.982555, -1.205776, -2.695407, 1, 0.007843138, 0, 1,
-2.947354, 1.034696, -0.9616153, 1, 0.01176471, 0, 1,
-2.878396, 0.5688649, 1.111643, 1, 0.01960784, 0, 1,
-2.711714, -0.8746212, -2.003048, 1, 0.02352941, 0, 1,
-2.685254, 0.02895055, -1.403996, 1, 0.03137255, 0, 1,
-2.510476, 1.35088, -1.145908, 1, 0.03529412, 0, 1,
-2.427985, 0.4138383, -0.5330848, 1, 0.04313726, 0, 1,
-2.424593, -0.3416284, -2.740097, 1, 0.04705882, 0, 1,
-2.299496, 0.9543238, 0.2940482, 1, 0.05490196, 0, 1,
-2.254485, -1.308324, -1.251274, 1, 0.05882353, 0, 1,
-2.23922, 1.6625, 0.246783, 1, 0.06666667, 0, 1,
-2.239141, 0.8260807, 1.811206, 1, 0.07058824, 0, 1,
-2.185037, 1.957119, -1.657699, 1, 0.07843138, 0, 1,
-2.184412, 0.5581228, -1.63428, 1, 0.08235294, 0, 1,
-2.169099, 0.2625417, -1.983708, 1, 0.09019608, 0, 1,
-2.149873, -0.1162957, -0.7436208, 1, 0.09411765, 0, 1,
-2.149229, -0.9796101, -0.7769103, 1, 0.1019608, 0, 1,
-2.127523, -0.3452102, -4.079169, 1, 0.1098039, 0, 1,
-2.116029, -0.1088714, -1.639859, 1, 0.1137255, 0, 1,
-2.11197, -0.1809717, -2.898996, 1, 0.1215686, 0, 1,
-2.111593, 0.5484694, -0.6515734, 1, 0.1254902, 0, 1,
-2.07943, 2.547536, -0.7593627, 1, 0.1333333, 0, 1,
-2.046578, 2.362094, -1.811152, 1, 0.1372549, 0, 1,
-2.043018, -0.6763228, -0.8769868, 1, 0.145098, 0, 1,
-2.041647, 1.097864, -1.479301, 1, 0.1490196, 0, 1,
-2.034093, -0.2260799, -1.114387, 1, 0.1568628, 0, 1,
-2.01134, -0.1822727, -1.100529, 1, 0.1607843, 0, 1,
-2.00349, -0.1036903, -1.65276, 1, 0.1686275, 0, 1,
-1.958229, 0.6119477, -0.8861006, 1, 0.172549, 0, 1,
-1.9405, -1.090327, -1.283964, 1, 0.1803922, 0, 1,
-1.903635, -0.7313985, -1.623669, 1, 0.1843137, 0, 1,
-1.903185, -1.42939, -3.052805, 1, 0.1921569, 0, 1,
-1.891949, -0.0004046024, -1.848679, 1, 0.1960784, 0, 1,
-1.885299, -1.636259, -1.887344, 1, 0.2039216, 0, 1,
-1.867603, -1.6613, -3.654237, 1, 0.2117647, 0, 1,
-1.827205, -1.609655, -1.976271, 1, 0.2156863, 0, 1,
-1.812283, 0.7588632, -2.712902, 1, 0.2235294, 0, 1,
-1.802413, -0.7125102, -0.9934156, 1, 0.227451, 0, 1,
-1.798505, 0.9778503, -1.175651, 1, 0.2352941, 0, 1,
-1.79533, 0.6188198, -1.709266, 1, 0.2392157, 0, 1,
-1.788108, -1.17995, -2.535843, 1, 0.2470588, 0, 1,
-1.786719, 0.2258728, -0.9028856, 1, 0.2509804, 0, 1,
-1.774162, 0.3336179, -1.62523, 1, 0.2588235, 0, 1,
-1.770619, 0.7798978, -0.4844194, 1, 0.2627451, 0, 1,
-1.757842, 0.4725322, -2.035482, 1, 0.2705882, 0, 1,
-1.743394, -0.5544335, -1.006846, 1, 0.2745098, 0, 1,
-1.736543, 1.114921, -1.250749, 1, 0.282353, 0, 1,
-1.732011, -0.6740553, -0.8133652, 1, 0.2862745, 0, 1,
-1.727244, -0.5532072, -1.027346, 1, 0.2941177, 0, 1,
-1.723104, -0.2288448, -1.700358, 1, 0.3019608, 0, 1,
-1.722616, -0.02660202, -1.173188, 1, 0.3058824, 0, 1,
-1.719781, 0.7475898, -1.085562, 1, 0.3137255, 0, 1,
-1.713113, -0.4351503, -0.5642458, 1, 0.3176471, 0, 1,
-1.667388, -0.8571125, -2.108629, 1, 0.3254902, 0, 1,
-1.664099, -0.04705121, -1.284893, 1, 0.3294118, 0, 1,
-1.641597, 0.7478965, -0.3713582, 1, 0.3372549, 0, 1,
-1.637874, -0.02598651, -1.599689, 1, 0.3411765, 0, 1,
-1.62215, -0.07229313, -1.047137, 1, 0.3490196, 0, 1,
-1.616581, -2.095412, -1.401554, 1, 0.3529412, 0, 1,
-1.604269, -0.7567452, -2.796516, 1, 0.3607843, 0, 1,
-1.601621, -0.4415854, -2.301363, 1, 0.3647059, 0, 1,
-1.599912, 0.2812515, -0.4670894, 1, 0.372549, 0, 1,
-1.590856, 0.1525294, -3.804974, 1, 0.3764706, 0, 1,
-1.572785, 0.2990812, -2.622773, 1, 0.3843137, 0, 1,
-1.57023, 2.34904, -0.3906926, 1, 0.3882353, 0, 1,
-1.548203, -0.9807682, -3.013125, 1, 0.3960784, 0, 1,
-1.547744, -1.981546, -1.479009, 1, 0.4039216, 0, 1,
-1.545617, -0.4291551, -3.536486, 1, 0.4078431, 0, 1,
-1.540384, 1.412632, -1.553799, 1, 0.4156863, 0, 1,
-1.537584, -0.07334498, -1.233952, 1, 0.4196078, 0, 1,
-1.537528, 0.01374682, -0.5674629, 1, 0.427451, 0, 1,
-1.526329, 1.533229, -1.928079, 1, 0.4313726, 0, 1,
-1.499682, 2.423427, -0.2962942, 1, 0.4392157, 0, 1,
-1.471424, -0.384872, -1.096639, 1, 0.4431373, 0, 1,
-1.45535, 0.7113037, -1.6656, 1, 0.4509804, 0, 1,
-1.451397, 1.113417, 0.5269328, 1, 0.454902, 0, 1,
-1.442587, 0.9276181, 1.678173, 1, 0.4627451, 0, 1,
-1.426753, 1.060865, -0.8110184, 1, 0.4666667, 0, 1,
-1.425834, 0.5847642, -0.3414237, 1, 0.4745098, 0, 1,
-1.418492, -0.4588151, -1.178645, 1, 0.4784314, 0, 1,
-1.405823, -1.029391, -2.01462, 1, 0.4862745, 0, 1,
-1.405113, -1.124121, -3.237935, 1, 0.4901961, 0, 1,
-1.398234, -0.9407945, -3.513949, 1, 0.4980392, 0, 1,
-1.395568, 0.1916988, -1.726379, 1, 0.5058824, 0, 1,
-1.393136, 0.1185001, 0.1021371, 1, 0.509804, 0, 1,
-1.367532, 1.301514, -0.02734953, 1, 0.5176471, 0, 1,
-1.360068, 0.639607, -1.327196, 1, 0.5215687, 0, 1,
-1.353574, 0.2973622, 1.244668, 1, 0.5294118, 0, 1,
-1.32688, 0.9277649, -0.234229, 1, 0.5333334, 0, 1,
-1.320135, -1.443223, -0.2163054, 1, 0.5411765, 0, 1,
-1.318651, 1.196255, -0.8212672, 1, 0.5450981, 0, 1,
-1.306525, -2.599954, -1.048845, 1, 0.5529412, 0, 1,
-1.306358, -0.3425749, -3.225655, 1, 0.5568628, 0, 1,
-1.297425, -0.8636834, -2.587147, 1, 0.5647059, 0, 1,
-1.286119, -2.328247, -2.96118, 1, 0.5686275, 0, 1,
-1.285534, 0.8542828, 0.1226644, 1, 0.5764706, 0, 1,
-1.28529, -0.7427614, -1.445862, 1, 0.5803922, 0, 1,
-1.284516, 0.9679517, -1.259432, 1, 0.5882353, 0, 1,
-1.280051, 1.67781, -0.5558104, 1, 0.5921569, 0, 1,
-1.273306, -1.553121, -2.904775, 1, 0.6, 0, 1,
-1.267003, -0.1982434, -0.1658724, 1, 0.6078432, 0, 1,
-1.262994, -2.064369, -3.009763, 1, 0.6117647, 0, 1,
-1.262238, 1.643307, 0.5948655, 1, 0.6196079, 0, 1,
-1.256181, -0.876285, -2.521973, 1, 0.6235294, 0, 1,
-1.256129, -0.1506439, -3.584118, 1, 0.6313726, 0, 1,
-1.251768, -0.1052584, -0.310255, 1, 0.6352941, 0, 1,
-1.250533, -0.587536, -2.264835, 1, 0.6431373, 0, 1,
-1.249544, 0.3721739, -1.544768, 1, 0.6470588, 0, 1,
-1.243762, 0.4478357, -2.343503, 1, 0.654902, 0, 1,
-1.23771, 0.8523978, -2.023399, 1, 0.6588235, 0, 1,
-1.233918, -0.3036034, -0.1943321, 1, 0.6666667, 0, 1,
-1.227938, -0.05162017, -1.901739, 1, 0.6705883, 0, 1,
-1.226486, 1.762273, 0.7003285, 1, 0.6784314, 0, 1,
-1.220812, 0.8447381, -1.636478, 1, 0.682353, 0, 1,
-1.212208, 1.086411, -1.57123, 1, 0.6901961, 0, 1,
-1.209103, -0.5097184, -2.084112, 1, 0.6941177, 0, 1,
-1.208623, -1.213453, -3.280366, 1, 0.7019608, 0, 1,
-1.201453, 1.032503, -1.014265, 1, 0.7098039, 0, 1,
-1.194208, -0.8129289, -3.077785, 1, 0.7137255, 0, 1,
-1.191781, -0.5281457, -1.237746, 1, 0.7215686, 0, 1,
-1.187319, 0.6606377, 0.4974497, 1, 0.7254902, 0, 1,
-1.183401, 0.06428581, -1.334712, 1, 0.7333333, 0, 1,
-1.180068, 0.6570935, -1.573031, 1, 0.7372549, 0, 1,
-1.177875, 0.972804, -1.357661, 1, 0.7450981, 0, 1,
-1.176019, 0.245709, -2.458869, 1, 0.7490196, 0, 1,
-1.165515, -1.46445, -1.966753, 1, 0.7568628, 0, 1,
-1.163649, 0.8173252, 0.6929153, 1, 0.7607843, 0, 1,
-1.160879, -0.4900493, -1.85306, 1, 0.7686275, 0, 1,
-1.156524, 1.472727, -1.322288, 1, 0.772549, 0, 1,
-1.154189, 1.196045, -1.397533, 1, 0.7803922, 0, 1,
-1.146416, 1.867159, -0.8889636, 1, 0.7843137, 0, 1,
-1.126144, 0.01555547, -0.6386122, 1, 0.7921569, 0, 1,
-1.125169, 0.5434539, -2.238643, 1, 0.7960784, 0, 1,
-1.125166, 1.301306, -0.4493017, 1, 0.8039216, 0, 1,
-1.124193, 1.244958, -1.288771, 1, 0.8117647, 0, 1,
-1.123358, 0.7027102, -0.8809558, 1, 0.8156863, 0, 1,
-1.120797, 0.7823014, -2.25349, 1, 0.8235294, 0, 1,
-1.116456, 0.8630617, -1.562877, 1, 0.827451, 0, 1,
-1.115935, -2.065281, -3.130526, 1, 0.8352941, 0, 1,
-1.10849, -0.6551903, -0.726487, 1, 0.8392157, 0, 1,
-1.100916, 1.159559, 0.2399786, 1, 0.8470588, 0, 1,
-1.096562, -0.3053796, -1.891951, 1, 0.8509804, 0, 1,
-1.0944, -0.4489709, -2.660018, 1, 0.8588235, 0, 1,
-1.093098, -0.1766927, -1.613198, 1, 0.8627451, 0, 1,
-1.080574, -1.04119, -3.370667, 1, 0.8705882, 0, 1,
-1.07449, 0.2126017, -0.2464993, 1, 0.8745098, 0, 1,
-1.072179, -0.5497511, 0.7532799, 1, 0.8823529, 0, 1,
-1.069551, -0.198996, -2.504146, 1, 0.8862745, 0, 1,
-1.065929, 1.177814, -0.3791964, 1, 0.8941177, 0, 1,
-1.055845, -0.5510588, -2.278394, 1, 0.8980392, 0, 1,
-1.055164, 0.01544506, -3.760788, 1, 0.9058824, 0, 1,
-1.052604, 0.7749155, -0.9870386, 1, 0.9137255, 0, 1,
-1.051677, -0.236387, -1.306745, 1, 0.9176471, 0, 1,
-1.051033, 0.5628031, -1.463994, 1, 0.9254902, 0, 1,
-1.050088, 1.696369, -0.2064901, 1, 0.9294118, 0, 1,
-1.039722, -0.4294931, -1.854863, 1, 0.9372549, 0, 1,
-1.029207, 0.5527074, 0.1922384, 1, 0.9411765, 0, 1,
-1.025185, -0.9304571, -1.760786, 1, 0.9490196, 0, 1,
-1.018468, 0.8861689, 0.2985519, 1, 0.9529412, 0, 1,
-1.017879, -1.186047, -1.706419, 1, 0.9607843, 0, 1,
-1.016201, -0.4416327, -1.016591, 1, 0.9647059, 0, 1,
-1.012608, 0.9443069, 1.216511, 1, 0.972549, 0, 1,
-1.006188, -1.204961, -3.678653, 1, 0.9764706, 0, 1,
-1.005514, 0.2140184, -0.1547135, 1, 0.9843137, 0, 1,
-1.002558, 1.444379, 0.9329929, 1, 0.9882353, 0, 1,
-0.9979078, -0.06037872, -0.5177296, 1, 0.9960784, 0, 1,
-0.997633, -0.6238201, -2.230247, 0.9960784, 1, 0, 1,
-0.9918937, 0.170041, -0.4759511, 0.9921569, 1, 0, 1,
-0.9896583, 2.108716, 0.3639273, 0.9843137, 1, 0, 1,
-0.9895065, 0.3492013, -2.625459, 0.9803922, 1, 0, 1,
-0.9888332, -1.608052, -2.610261, 0.972549, 1, 0, 1,
-0.9862792, -0.7826552, -2.744249, 0.9686275, 1, 0, 1,
-0.9843293, -1.46589, -5.154389, 0.9607843, 1, 0, 1,
-0.9802315, 0.1210562, -0.1518266, 0.9568627, 1, 0, 1,
-0.9778734, 0.09709572, -1.571541, 0.9490196, 1, 0, 1,
-0.9730145, -1.025491, -4.340616, 0.945098, 1, 0, 1,
-0.9718876, -0.01517015, -1.247227, 0.9372549, 1, 0, 1,
-0.9717333, 1.406786, 0.3397416, 0.9333333, 1, 0, 1,
-0.9715292, 1.145294, -1.554548, 0.9254902, 1, 0, 1,
-0.963528, -1.792979, -1.627056, 0.9215686, 1, 0, 1,
-0.962993, -3.213982, -3.145048, 0.9137255, 1, 0, 1,
-0.9581227, 0.4797203, -1.449481, 0.9098039, 1, 0, 1,
-0.9466627, 1.420805, -0.1742529, 0.9019608, 1, 0, 1,
-0.9366359, 0.3346596, -2.712816, 0.8941177, 1, 0, 1,
-0.9351758, -1.13645, -2.801857, 0.8901961, 1, 0, 1,
-0.9284163, 0.08454238, -2.168141, 0.8823529, 1, 0, 1,
-0.9283559, 0.04076904, -3.047714, 0.8784314, 1, 0, 1,
-0.927861, -0.5088951, -1.304971, 0.8705882, 1, 0, 1,
-0.9233645, -0.3403979, -1.460806, 0.8666667, 1, 0, 1,
-0.9100041, -0.234334, -2.343411, 0.8588235, 1, 0, 1,
-0.9090037, 0.2077424, 0.8917562, 0.854902, 1, 0, 1,
-0.9083617, -0.735053, -4.642724, 0.8470588, 1, 0, 1,
-0.9012935, -0.507637, -3.863539, 0.8431373, 1, 0, 1,
-0.9010053, 1.428141, -0.8083243, 0.8352941, 1, 0, 1,
-0.9004628, -0.1921855, -2.197936, 0.8313726, 1, 0, 1,
-0.8948918, -0.1575754, -1.63325, 0.8235294, 1, 0, 1,
-0.8920227, -0.4851229, -0.4801862, 0.8196079, 1, 0, 1,
-0.8897537, 0.6143981, -2.138177, 0.8117647, 1, 0, 1,
-0.8865333, -0.1299542, -2.17112, 0.8078431, 1, 0, 1,
-0.8839663, -1.971501, -2.487549, 0.8, 1, 0, 1,
-0.8806963, -1.979093, -2.933374, 0.7921569, 1, 0, 1,
-0.8792648, 0.1471441, -1.715665, 0.7882353, 1, 0, 1,
-0.8750709, -0.09834124, -1.472256, 0.7803922, 1, 0, 1,
-0.8737364, 0.6492246, 0.6136689, 0.7764706, 1, 0, 1,
-0.8714768, 1.359412, -1.319387, 0.7686275, 1, 0, 1,
-0.866033, -0.01594735, -1.860864, 0.7647059, 1, 0, 1,
-0.858282, -0.6833509, -1.777424, 0.7568628, 1, 0, 1,
-0.8575186, -0.2660113, -1.994241, 0.7529412, 1, 0, 1,
-0.8503656, -0.3999061, -2.998678, 0.7450981, 1, 0, 1,
-0.8440171, 0.41366, -0.05268165, 0.7411765, 1, 0, 1,
-0.8435246, 0.02254136, -3.290886, 0.7333333, 1, 0, 1,
-0.8433774, 0.4769197, -0.9594343, 0.7294118, 1, 0, 1,
-0.8405673, -0.5453473, -0.612264, 0.7215686, 1, 0, 1,
-0.8392062, -1.504365, -2.553139, 0.7176471, 1, 0, 1,
-0.8366776, 0.3360159, -1.252718, 0.7098039, 1, 0, 1,
-0.8307004, -0.1642291, -2.027002, 0.7058824, 1, 0, 1,
-0.8282242, 1.607818, -1.417614, 0.6980392, 1, 0, 1,
-0.8205281, 2.017662, 0.6096885, 0.6901961, 1, 0, 1,
-0.8067032, -0.4625039, -1.418747, 0.6862745, 1, 0, 1,
-0.8044255, 0.7785073, -1.749005, 0.6784314, 1, 0, 1,
-0.8028701, -1.203859, -2.522111, 0.6745098, 1, 0, 1,
-0.8023514, 1.072607, -1.822415, 0.6666667, 1, 0, 1,
-0.8021057, 0.4884913, -0.6933096, 0.6627451, 1, 0, 1,
-0.8021019, -0.1897454, -3.048619, 0.654902, 1, 0, 1,
-0.795769, -0.4731484, -1.467445, 0.6509804, 1, 0, 1,
-0.7955229, 0.9978274, -0.1096336, 0.6431373, 1, 0, 1,
-0.7939625, -0.08276025, -1.67232, 0.6392157, 1, 0, 1,
-0.7908548, 1.199407, -0.6593714, 0.6313726, 1, 0, 1,
-0.7875254, -0.9107035, -1.747463, 0.627451, 1, 0, 1,
-0.7812183, -1.086495, -2.288987, 0.6196079, 1, 0, 1,
-0.7800561, 2.313346, 0.9068025, 0.6156863, 1, 0, 1,
-0.7799419, 1.271168, -0.5821495, 0.6078432, 1, 0, 1,
-0.7672366, 0.4068742, -1.291416, 0.6039216, 1, 0, 1,
-0.763496, -0.8083299, -1.329942, 0.5960785, 1, 0, 1,
-0.7618685, 0.3308215, -0.1782888, 0.5882353, 1, 0, 1,
-0.7525367, 0.2477847, -0.2992473, 0.5843138, 1, 0, 1,
-0.7451732, 1.066847, -1.292376, 0.5764706, 1, 0, 1,
-0.7420051, 0.1368331, 0.6802169, 0.572549, 1, 0, 1,
-0.7402124, 1.946339, 0.174352, 0.5647059, 1, 0, 1,
-0.7392634, 1.447569, -0.8609495, 0.5607843, 1, 0, 1,
-0.7323144, 1.041533, -1.301681, 0.5529412, 1, 0, 1,
-0.7232457, 0.6699972, -0.2095849, 0.5490196, 1, 0, 1,
-0.7226382, 0.5253428, 0.2704683, 0.5411765, 1, 0, 1,
-0.7225081, -0.9426899, -3.367779, 0.5372549, 1, 0, 1,
-0.7221451, -1.180552, -2.649333, 0.5294118, 1, 0, 1,
-0.7219264, -0.8554246, -2.742299, 0.5254902, 1, 0, 1,
-0.7202998, 1.806428, 1.369241, 0.5176471, 1, 0, 1,
-0.7043886, 1.97489, -0.1823172, 0.5137255, 1, 0, 1,
-0.6995991, 0.6784161, -1.372727, 0.5058824, 1, 0, 1,
-0.6933277, 0.5565897, 0.2553647, 0.5019608, 1, 0, 1,
-0.6869273, -0.4153335, -2.98174, 0.4941176, 1, 0, 1,
-0.684661, -0.4423962, -1.845939, 0.4862745, 1, 0, 1,
-0.6836534, 0.2244266, -1.175666, 0.4823529, 1, 0, 1,
-0.682129, 0.1488944, -2.153503, 0.4745098, 1, 0, 1,
-0.669387, -0.5756667, -2.472661, 0.4705882, 1, 0, 1,
-0.6669436, -0.4736995, -1.575042, 0.4627451, 1, 0, 1,
-0.6610448, 0.6382448, -2.328595, 0.4588235, 1, 0, 1,
-0.6598279, -0.1901663, -3.911448, 0.4509804, 1, 0, 1,
-0.6577891, 1.164797, 1.192334, 0.4470588, 1, 0, 1,
-0.6536609, 0.8317576, -0.2705732, 0.4392157, 1, 0, 1,
-0.6532785, 0.9657895, -1.440009, 0.4352941, 1, 0, 1,
-0.652725, -1.437054, -1.641223, 0.427451, 1, 0, 1,
-0.6519731, -0.6571136, -1.620904, 0.4235294, 1, 0, 1,
-0.6488224, 1.365081, -0.3856627, 0.4156863, 1, 0, 1,
-0.6454026, 0.8737819, -0.5412793, 0.4117647, 1, 0, 1,
-0.6417317, 1.060157, -1.259197, 0.4039216, 1, 0, 1,
-0.6379335, 0.9852685, -1.297389, 0.3960784, 1, 0, 1,
-0.6350488, 0.8725346, -1.676758, 0.3921569, 1, 0, 1,
-0.6333367, -1.574078, -2.664596, 0.3843137, 1, 0, 1,
-0.6330881, -0.2776388, -1.339786, 0.3803922, 1, 0, 1,
-0.6288108, -0.9796622, -2.466549, 0.372549, 1, 0, 1,
-0.6240717, 0.156276, -1.06266, 0.3686275, 1, 0, 1,
-0.6213105, -1.511191, -3.570636, 0.3607843, 1, 0, 1,
-0.6119597, 0.3730731, -1.408696, 0.3568628, 1, 0, 1,
-0.6062184, -0.8582528, -2.798585, 0.3490196, 1, 0, 1,
-0.5971969, 1.206049, -0.2079366, 0.345098, 1, 0, 1,
-0.5814988, -0.318074, -3.798938, 0.3372549, 1, 0, 1,
-0.5766755, 1.485972, -2.14658, 0.3333333, 1, 0, 1,
-0.5719788, -0.0004985197, -1.549969, 0.3254902, 1, 0, 1,
-0.5632923, -0.4202822, -2.062701, 0.3215686, 1, 0, 1,
-0.5620489, -1.361104, -2.109702, 0.3137255, 1, 0, 1,
-0.5618966, -0.7881504, -2.531088, 0.3098039, 1, 0, 1,
-0.5570719, 1.657403, -1.216174, 0.3019608, 1, 0, 1,
-0.5560818, 0.4734868, -2.645801, 0.2941177, 1, 0, 1,
-0.5540468, 1.574435, -0.5455526, 0.2901961, 1, 0, 1,
-0.5525793, -1.707501, -0.4923487, 0.282353, 1, 0, 1,
-0.5510797, 0.2518851, -1.101393, 0.2784314, 1, 0, 1,
-0.5500576, 0.8411227, -1.362816, 0.2705882, 1, 0, 1,
-0.5466945, 0.805674, -0.6565875, 0.2666667, 1, 0, 1,
-0.5460337, 0.8131263, -1.049529, 0.2588235, 1, 0, 1,
-0.5452061, 0.7521377, -0.2044434, 0.254902, 1, 0, 1,
-0.5382833, 1.293386, 0.7894304, 0.2470588, 1, 0, 1,
-0.5338953, 1.20997, 0.02520328, 0.2431373, 1, 0, 1,
-0.5334699, -1.289059, -2.257316, 0.2352941, 1, 0, 1,
-0.5309345, 0.2030512, -0.7019866, 0.2313726, 1, 0, 1,
-0.5239866, -1.017097, -1.688324, 0.2235294, 1, 0, 1,
-0.5235357, 0.9813682, 0.4359617, 0.2196078, 1, 0, 1,
-0.522402, -0.8907991, -3.4237, 0.2117647, 1, 0, 1,
-0.5180922, -0.06071525, -1.584355, 0.2078431, 1, 0, 1,
-0.5146698, 0.2937872, -0.8587303, 0.2, 1, 0, 1,
-0.5115472, 0.5775486, -0.3319433, 0.1921569, 1, 0, 1,
-0.5098085, 1.739004, -0.5531681, 0.1882353, 1, 0, 1,
-0.5086945, -0.3765553, -3.266783, 0.1803922, 1, 0, 1,
-0.5078602, 2.509483, -0.05538912, 0.1764706, 1, 0, 1,
-0.5040225, 0.3893602, -2.512243, 0.1686275, 1, 0, 1,
-0.502452, 1.346487, -1.154212, 0.1647059, 1, 0, 1,
-0.5017388, -0.9380834, -1.821264, 0.1568628, 1, 0, 1,
-0.4980589, -0.0341294, -1.334284, 0.1529412, 1, 0, 1,
-0.4979804, 0.4190116, -0.4861069, 0.145098, 1, 0, 1,
-0.4950921, -0.9743506, -2.837943, 0.1411765, 1, 0, 1,
-0.4894131, -1.437997, -2.559193, 0.1333333, 1, 0, 1,
-0.4870922, -1.87461, -2.788641, 0.1294118, 1, 0, 1,
-0.4860728, -0.02162313, -1.943381, 0.1215686, 1, 0, 1,
-0.4759643, 0.467287, -0.3315314, 0.1176471, 1, 0, 1,
-0.4734213, -0.4791382, -3.437526, 0.1098039, 1, 0, 1,
-0.4728289, -0.8053373, -3.500708, 0.1058824, 1, 0, 1,
-0.4673908, 1.428646, -1.118201, 0.09803922, 1, 0, 1,
-0.4643932, 0.4204594, -0.9940788, 0.09019608, 1, 0, 1,
-0.4640966, 0.8525305, 0.6442632, 0.08627451, 1, 0, 1,
-0.4588304, 0.9227045, 0.7362905, 0.07843138, 1, 0, 1,
-0.4581738, -0.6428443, -3.451349, 0.07450981, 1, 0, 1,
-0.4557567, -1.091696, -2.488558, 0.06666667, 1, 0, 1,
-0.4526784, 1.665776, 0.461278, 0.0627451, 1, 0, 1,
-0.4470452, -0.7573901, -3.204138, 0.05490196, 1, 0, 1,
-0.4431956, -2.429663, -4.596062, 0.05098039, 1, 0, 1,
-0.4402123, -0.9561999, -2.674762, 0.04313726, 1, 0, 1,
-0.4385355, 1.064214, -0.6051832, 0.03921569, 1, 0, 1,
-0.4376669, -0.7229789, -0.7174175, 0.03137255, 1, 0, 1,
-0.4374557, -0.1020835, -2.951611, 0.02745098, 1, 0, 1,
-0.4366329, -0.5742426, -2.517303, 0.01960784, 1, 0, 1,
-0.435765, -0.1891272, -4.390315, 0.01568628, 1, 0, 1,
-0.4345162, 0.4959316, -1.128669, 0.007843138, 1, 0, 1,
-0.4264332, 0.0211856, -1.620585, 0.003921569, 1, 0, 1,
-0.4238876, 0.2866788, -1.36502, 0, 1, 0.003921569, 1,
-0.4234167, 0.249456, -0.1940654, 0, 1, 0.01176471, 1,
-0.4171285, -0.716989, -1.381973, 0, 1, 0.01568628, 1,
-0.4109724, 0.1595041, 0.1278833, 0, 1, 0.02352941, 1,
-0.4106831, 0.6788718, -0.909302, 0, 1, 0.02745098, 1,
-0.4104573, -0.1223724, -1.341292, 0, 1, 0.03529412, 1,
-0.4103904, 0.155205, -0.1382869, 0, 1, 0.03921569, 1,
-0.4064479, -0.4488227, -2.60042, 0, 1, 0.04705882, 1,
-0.4050095, 0.1777488, -2.371565, 0, 1, 0.05098039, 1,
-0.3983753, -1.260041, -2.65757, 0, 1, 0.05882353, 1,
-0.39649, -0.6637655, -2.307192, 0, 1, 0.0627451, 1,
-0.3877752, 1.73719, -1.652123, 0, 1, 0.07058824, 1,
-0.385478, 0.03198927, -3.014853, 0, 1, 0.07450981, 1,
-0.3847105, -0.4230098, -3.831933, 0, 1, 0.08235294, 1,
-0.3803503, -0.8778726, -2.007993, 0, 1, 0.08627451, 1,
-0.3781108, 0.07114892, -0.8017463, 0, 1, 0.09411765, 1,
-0.3756941, 0.9096028, 1.406681, 0, 1, 0.1019608, 1,
-0.3709992, -0.5487333, -2.119807, 0, 1, 0.1058824, 1,
-0.370352, 1.397685, -0.5929465, 0, 1, 0.1137255, 1,
-0.3688323, 1.410537, 1.479948, 0, 1, 0.1176471, 1,
-0.3688217, 0.3910107, -1.784699, 0, 1, 0.1254902, 1,
-0.3685322, -0.3203615, -1.524424, 0, 1, 0.1294118, 1,
-0.3662717, 0.3019032, -3.135185, 0, 1, 0.1372549, 1,
-0.3660495, 0.2015506, -0.5664591, 0, 1, 0.1411765, 1,
-0.3658535, 1.234567, 0.1332714, 0, 1, 0.1490196, 1,
-0.3596571, -1.91624, -0.9326163, 0, 1, 0.1529412, 1,
-0.3584344, -0.4704062, -3.252924, 0, 1, 0.1607843, 1,
-0.3563494, -0.3342224, -1.91385, 0, 1, 0.1647059, 1,
-0.3551997, -0.1769399, -0.2236076, 0, 1, 0.172549, 1,
-0.3479167, 1.735391, -0.8620098, 0, 1, 0.1764706, 1,
-0.3435112, 0.2992669, -1.970986, 0, 1, 0.1843137, 1,
-0.3433129, 0.5561543, -0.7140951, 0, 1, 0.1882353, 1,
-0.3423901, 0.1255013, -0.4445894, 0, 1, 0.1960784, 1,
-0.3408451, -0.3341263, -2.049035, 0, 1, 0.2039216, 1,
-0.3407638, 0.03853254, -0.626795, 0, 1, 0.2078431, 1,
-0.3383107, -0.7528651, -5.773292, 0, 1, 0.2156863, 1,
-0.3362928, -0.08532768, -1.543931, 0, 1, 0.2196078, 1,
-0.3331703, -1.383782, -0.707492, 0, 1, 0.227451, 1,
-0.3294337, 0.603658, -0.2949935, 0, 1, 0.2313726, 1,
-0.3255874, 1.11109, -0.5015796, 0, 1, 0.2392157, 1,
-0.3248861, 0.4055791, 0.9492766, 0, 1, 0.2431373, 1,
-0.323074, 1.855106, 0.4847638, 0, 1, 0.2509804, 1,
-0.3095009, 0.1377532, 0.287649, 0, 1, 0.254902, 1,
-0.3062666, 1.91086, 0.2907202, 0, 1, 0.2627451, 1,
-0.2994653, 1.43161, -0.9625909, 0, 1, 0.2666667, 1,
-0.2970993, 1.518976, 0.2005599, 0, 1, 0.2745098, 1,
-0.2954358, 0.2464603, -2.198127, 0, 1, 0.2784314, 1,
-0.2938308, -0.8544132, -2.697344, 0, 1, 0.2862745, 1,
-0.2800933, -1.412038, -2.080155, 0, 1, 0.2901961, 1,
-0.2788876, 0.2463467, -0.9238055, 0, 1, 0.2980392, 1,
-0.2758976, 0.6045589, 0.6044076, 0, 1, 0.3058824, 1,
-0.2748431, -0.1774266, -1.969196, 0, 1, 0.3098039, 1,
-0.2732203, 1.557187, 0.7057665, 0, 1, 0.3176471, 1,
-0.2703642, -0.4612074, -0.5828224, 0, 1, 0.3215686, 1,
-0.2696102, -0.3378076, -2.391913, 0, 1, 0.3294118, 1,
-0.2674214, -0.6991689, -2.689571, 0, 1, 0.3333333, 1,
-0.2661057, 0.06797224, -2.964769, 0, 1, 0.3411765, 1,
-0.2660538, -0.7836914, -3.694201, 0, 1, 0.345098, 1,
-0.263637, 0.5015476, 0.1211386, 0, 1, 0.3529412, 1,
-0.2597248, 0.03792014, -1.86857, 0, 1, 0.3568628, 1,
-0.2556075, -0.7189084, -2.773259, 0, 1, 0.3647059, 1,
-0.2550661, 0.266248, -1.823542, 0, 1, 0.3686275, 1,
-0.2506481, 2.51253, -2.374779, 0, 1, 0.3764706, 1,
-0.2495896, -0.1555209, -2.264373, 0, 1, 0.3803922, 1,
-0.248771, -1.603269, -3.505914, 0, 1, 0.3882353, 1,
-0.2483937, -1.211655, -3.732055, 0, 1, 0.3921569, 1,
-0.2413449, -0.5248728, -2.28704, 0, 1, 0.4, 1,
-0.2405956, -1.751533, -1.342107, 0, 1, 0.4078431, 1,
-0.237414, 0.6981326, -0.7714801, 0, 1, 0.4117647, 1,
-0.2362831, 1.426529, -1.172355, 0, 1, 0.4196078, 1,
-0.2344755, 0.9691333, 0.02577482, 0, 1, 0.4235294, 1,
-0.2344374, -0.9974192, -2.530148, 0, 1, 0.4313726, 1,
-0.2340389, -0.4324732, -4.161265, 0, 1, 0.4352941, 1,
-0.2321405, -0.1041834, -2.030753, 0, 1, 0.4431373, 1,
-0.2304222, 1.582521, -0.6021833, 0, 1, 0.4470588, 1,
-0.2299108, -0.02953944, -2.624836, 0, 1, 0.454902, 1,
-0.2294457, 1.026764, -0.4311706, 0, 1, 0.4588235, 1,
-0.2272657, 0.4093777, 1.440468, 0, 1, 0.4666667, 1,
-0.2204805, 0.05306344, 0.5753468, 0, 1, 0.4705882, 1,
-0.2187146, 1.584763, -0.6911096, 0, 1, 0.4784314, 1,
-0.2179237, 0.1866881, -0.6299468, 0, 1, 0.4823529, 1,
-0.216936, -0.1752369, -2.914028, 0, 1, 0.4901961, 1,
-0.2165031, 1.351648, -0.7640635, 0, 1, 0.4941176, 1,
-0.215285, 1.187598, -1.86353, 0, 1, 0.5019608, 1,
-0.2067689, 1.606125, -0.1218307, 0, 1, 0.509804, 1,
-0.2061239, -2.867719, -5.224105, 0, 1, 0.5137255, 1,
-0.1954053, 0.4140168, 1.656263, 0, 1, 0.5215687, 1,
-0.1922837, 0.2892475, 0.0003637485, 0, 1, 0.5254902, 1,
-0.1912176, -1.199962, -2.43894, 0, 1, 0.5333334, 1,
-0.1904388, -0.6785988, -2.037729, 0, 1, 0.5372549, 1,
-0.1877688, 0.4168549, -0.1512552, 0, 1, 0.5450981, 1,
-0.1876536, 0.356382, 1.359114, 0, 1, 0.5490196, 1,
-0.1853775, -0.5125442, -1.909087, 0, 1, 0.5568628, 1,
-0.183686, 0.6181973, -0.3384078, 0, 1, 0.5607843, 1,
-0.1795619, 0.572679, 1.422704, 0, 1, 0.5686275, 1,
-0.1767234, 0.1061991, -2.542073, 0, 1, 0.572549, 1,
-0.1735616, -1.288711, -3.775194, 0, 1, 0.5803922, 1,
-0.1707341, -0.9373867, -2.401443, 0, 1, 0.5843138, 1,
-0.1682922, 0.5896531, 1.375257, 0, 1, 0.5921569, 1,
-0.166323, 0.6719304, -0.5713153, 0, 1, 0.5960785, 1,
-0.1652438, 0.6045515, 0.2219185, 0, 1, 0.6039216, 1,
-0.1625748, -0.5444563, -2.153663, 0, 1, 0.6117647, 1,
-0.1622639, 0.4005179, -1.626742, 0, 1, 0.6156863, 1,
-0.1544532, -0.0758547, -2.702186, 0, 1, 0.6235294, 1,
-0.1453054, 0.7127803, 0.1492029, 0, 1, 0.627451, 1,
-0.1432001, 1.50264, -0.4892927, 0, 1, 0.6352941, 1,
-0.1423407, 1.069844, 0.3181836, 0, 1, 0.6392157, 1,
-0.1420024, 0.2047962, -1.047492, 0, 1, 0.6470588, 1,
-0.1398956, 0.9072783, 1.422492, 0, 1, 0.6509804, 1,
-0.1318398, -1.376876, -2.37753, 0, 1, 0.6588235, 1,
-0.1313443, 0.1789503, -0.03397484, 0, 1, 0.6627451, 1,
-0.131209, -1.347614, -4.082168, 0, 1, 0.6705883, 1,
-0.1307972, 1.470139, -0.07466979, 0, 1, 0.6745098, 1,
-0.1235104, 0.5633386, 0.00621805, 0, 1, 0.682353, 1,
-0.1208851, 0.4572006, -0.07731329, 0, 1, 0.6862745, 1,
-0.1203271, -0.0273956, -1.916081, 0, 1, 0.6941177, 1,
-0.1179769, 0.5304461, -0.6565057, 0, 1, 0.7019608, 1,
-0.1170955, -0.8298794, -2.404809, 0, 1, 0.7058824, 1,
-0.115909, 2.334487, 0.6691858, 0, 1, 0.7137255, 1,
-0.113917, -0.3173847, -3.632539, 0, 1, 0.7176471, 1,
-0.1092474, -0.6563693, -3.18451, 0, 1, 0.7254902, 1,
-0.1084921, 1.031393, 1.921294, 0, 1, 0.7294118, 1,
-0.1078657, -0.4535212, -3.299499, 0, 1, 0.7372549, 1,
-0.1034512, -0.3609255, -2.638783, 0, 1, 0.7411765, 1,
-0.1001761, 1.025206, -0.9948184, 0, 1, 0.7490196, 1,
-0.09971477, 0.6584007, 1.524816, 0, 1, 0.7529412, 1,
-0.09774173, -0.9671289, -2.57673, 0, 1, 0.7607843, 1,
-0.09708826, 1.764768, 0.0987165, 0, 1, 0.7647059, 1,
-0.08794581, -0.4751809, -2.32168, 0, 1, 0.772549, 1,
-0.08627149, -0.1956385, -2.955687, 0, 1, 0.7764706, 1,
-0.08379901, -1.188672, -2.866911, 0, 1, 0.7843137, 1,
-0.07491388, 0.01522767, -1.956282, 0, 1, 0.7882353, 1,
-0.07153925, 0.248961, -0.9798198, 0, 1, 0.7960784, 1,
-0.07147565, -0.3077514, -2.893097, 0, 1, 0.8039216, 1,
-0.07131727, 0.2185469, 0.4775268, 0, 1, 0.8078431, 1,
-0.06943568, 0.406858, -1.363372, 0, 1, 0.8156863, 1,
-0.06496856, 0.5431395, -0.5394212, 0, 1, 0.8196079, 1,
-0.05543358, 1.33434, 0.8477634, 0, 1, 0.827451, 1,
-0.05293586, -1.112667, -2.126638, 0, 1, 0.8313726, 1,
-0.05239372, -0.9816527, -2.717441, 0, 1, 0.8392157, 1,
-0.04471236, 0.7028402, 0.724647, 0, 1, 0.8431373, 1,
-0.04061563, 1.008056, 1.121838, 0, 1, 0.8509804, 1,
-0.03844494, 0.7424617, -0.1848341, 0, 1, 0.854902, 1,
-0.0342208, 1.049863, -1.466378, 0, 1, 0.8627451, 1,
-0.03064706, 0.4126509, -1.180125, 0, 1, 0.8666667, 1,
-0.03054342, 0.06437118, -0.3429825, 0, 1, 0.8745098, 1,
-0.03053705, 0.7651619, -1.549277, 0, 1, 0.8784314, 1,
-0.03027601, 0.1917718, -0.5878296, 0, 1, 0.8862745, 1,
-0.02872369, -0.5214133, -3.062825, 0, 1, 0.8901961, 1,
-0.02856242, -0.9586068, -3.823356, 0, 1, 0.8980392, 1,
-0.02731357, -0.5635435, -2.847647, 0, 1, 0.9058824, 1,
-0.02520557, -1.585419, -3.295996, 0, 1, 0.9098039, 1,
-0.02447548, -0.2052878, -2.935891, 0, 1, 0.9176471, 1,
-0.01969186, 2.089985, -0.820614, 0, 1, 0.9215686, 1,
-0.01552027, -0.36976, -2.160333, 0, 1, 0.9294118, 1,
-0.01333175, 0.1559148, 0.5618181, 0, 1, 0.9333333, 1,
-0.01167557, -0.5948108, -2.793962, 0, 1, 0.9411765, 1,
-0.003034916, -1.874981, -4.034214, 0, 1, 0.945098, 1,
-0.002981903, 0.9975584, 0.7980828, 0, 1, 0.9529412, 1,
0.001344247, 0.2966872, 0.065362, 0, 1, 0.9568627, 1,
0.003812709, -0.5264115, 3.845095, 0, 1, 0.9647059, 1,
0.004453945, 0.5865179, 1.622685, 0, 1, 0.9686275, 1,
0.006302865, -0.008081839, 0.478261, 0, 1, 0.9764706, 1,
0.00779691, -0.1017708, 3.927315, 0, 1, 0.9803922, 1,
0.008061993, 0.3611121, 0.04693599, 0, 1, 0.9882353, 1,
0.01498786, 0.1766192, 1.066055, 0, 1, 0.9921569, 1,
0.02041596, 0.8902329, 0.8046343, 0, 1, 1, 1,
0.02206402, -1.156543, 4.005794, 0, 0.9921569, 1, 1,
0.02284382, 0.7439394, -1.16491, 0, 0.9882353, 1, 1,
0.03073758, -0.8107585, 4.569488, 0, 0.9803922, 1, 1,
0.03139282, -0.3332314, 2.964207, 0, 0.9764706, 1, 1,
0.03452817, -1.38454, 2.92184, 0, 0.9686275, 1, 1,
0.03507074, 0.7873317, -1.241475, 0, 0.9647059, 1, 1,
0.03514124, 1.01497, -3.211167, 0, 0.9568627, 1, 1,
0.03604474, -1.226064, 0.7531495, 0, 0.9529412, 1, 1,
0.03912476, -0.975822, 3.328769, 0, 0.945098, 1, 1,
0.03985237, 0.1086214, -0.6230188, 0, 0.9411765, 1, 1,
0.04098178, 1.180492, 0.3624592, 0, 0.9333333, 1, 1,
0.04635658, -2.045027, 3.093279, 0, 0.9294118, 1, 1,
0.04851077, 0.557202, 1.074954, 0, 0.9215686, 1, 1,
0.05187306, 1.168136, 0.1004239, 0, 0.9176471, 1, 1,
0.05516634, -2.177661, 3.800822, 0, 0.9098039, 1, 1,
0.05595693, 1.256587, -0.8627352, 0, 0.9058824, 1, 1,
0.05826133, 0.601554, 0.7006446, 0, 0.8980392, 1, 1,
0.05881574, -2.323675, 3.364353, 0, 0.8901961, 1, 1,
0.0632214, 2.041474, -1.17648, 0, 0.8862745, 1, 1,
0.0655574, -0.8403842, 2.884177, 0, 0.8784314, 1, 1,
0.06671861, 0.09961189, -0.03847772, 0, 0.8745098, 1, 1,
0.07035225, -2.260311, 3.912353, 0, 0.8666667, 1, 1,
0.07686952, -1.430982, 4.143268, 0, 0.8627451, 1, 1,
0.07775982, -0.5632231, 3.619935, 0, 0.854902, 1, 1,
0.07788204, -0.9304902, 2.525529, 0, 0.8509804, 1, 1,
0.08004489, -1.610793, 3.330415, 0, 0.8431373, 1, 1,
0.08161157, 1.636785, -0.8116566, 0, 0.8392157, 1, 1,
0.08597466, -1.429521, 2.581942, 0, 0.8313726, 1, 1,
0.09241352, 0.02150619, 1.509226, 0, 0.827451, 1, 1,
0.09391347, -0.6811031, 3.189212, 0, 0.8196079, 1, 1,
0.09536715, 0.345668, -0.2588088, 0, 0.8156863, 1, 1,
0.09778421, -0.4112582, 2.114771, 0, 0.8078431, 1, 1,
0.1001774, -0.3434935, 2.956263, 0, 0.8039216, 1, 1,
0.1028287, -0.2637292, 1.718113, 0, 0.7960784, 1, 1,
0.1124619, 0.2566043, 0.4091091, 0, 0.7882353, 1, 1,
0.1128398, -1.35267, 3.263098, 0, 0.7843137, 1, 1,
0.1129585, -1.253162, 2.737545, 0, 0.7764706, 1, 1,
0.1147469, -1.851488, 4.501078, 0, 0.772549, 1, 1,
0.1166423, 1.068491, 0.1645387, 0, 0.7647059, 1, 1,
0.1174547, 0.06237264, 0.09771824, 0, 0.7607843, 1, 1,
0.1186818, -0.1173663, 4.198263, 0, 0.7529412, 1, 1,
0.1198707, -0.6050416, 2.590394, 0, 0.7490196, 1, 1,
0.1216486, 1.045617, 0.8523258, 0, 0.7411765, 1, 1,
0.1233747, 1.311349, -0.9522911, 0, 0.7372549, 1, 1,
0.1244795, 0.5800914, -1.162932, 0, 0.7294118, 1, 1,
0.1266614, 0.8703601, 0.6111055, 0, 0.7254902, 1, 1,
0.1277605, -2.137014, 3.156246, 0, 0.7176471, 1, 1,
0.1278683, 1.656911, -1.122853, 0, 0.7137255, 1, 1,
0.1280489, 2.706713, 1.722201, 0, 0.7058824, 1, 1,
0.1292182, 0.7658196, -0.2433979, 0, 0.6980392, 1, 1,
0.1299269, 0.6927817, -0.8188162, 0, 0.6941177, 1, 1,
0.1369935, -0.8665413, 3.879142, 0, 0.6862745, 1, 1,
0.1453362, -1.044638, 3.103224, 0, 0.682353, 1, 1,
0.1456344, -0.6177287, 2.200981, 0, 0.6745098, 1, 1,
0.1467363, 0.7486722, -0.315462, 0, 0.6705883, 1, 1,
0.1469211, -0.5168574, 3.088594, 0, 0.6627451, 1, 1,
0.1471227, -0.329657, 3.524131, 0, 0.6588235, 1, 1,
0.1479818, -0.5336547, 2.90347, 0, 0.6509804, 1, 1,
0.1516308, 0.7351453, 1.117885, 0, 0.6470588, 1, 1,
0.1516836, -0.4153952, 2.164792, 0, 0.6392157, 1, 1,
0.1536777, 0.03373372, 1.005356, 0, 0.6352941, 1, 1,
0.1537282, -0.0622184, 1.369006, 0, 0.627451, 1, 1,
0.153939, -0.9075921, 3.046319, 0, 0.6235294, 1, 1,
0.1553876, -2.310123, 4.724552, 0, 0.6156863, 1, 1,
0.1560597, -1.034292, 1.787289, 0, 0.6117647, 1, 1,
0.1573425, 0.1439795, 1.34344, 0, 0.6039216, 1, 1,
0.1619059, 1.598075, 0.156281, 0, 0.5960785, 1, 1,
0.1665607, -0.031591, 3.208681, 0, 0.5921569, 1, 1,
0.1672406, 0.678022, 0.4823008, 0, 0.5843138, 1, 1,
0.1673397, 0.353886, 2.200315, 0, 0.5803922, 1, 1,
0.1738525, 1.545449, 0.5434287, 0, 0.572549, 1, 1,
0.1764943, 1.156913, 0.3325881, 0, 0.5686275, 1, 1,
0.1804514, 0.7416168, -0.7220637, 0, 0.5607843, 1, 1,
0.1809379, 0.1666977, 1.186988, 0, 0.5568628, 1, 1,
0.1820891, -1.218703, 3.061369, 0, 0.5490196, 1, 1,
0.1903144, 0.1725873, 0.04131835, 0, 0.5450981, 1, 1,
0.1903926, -0.3067255, 3.380544, 0, 0.5372549, 1, 1,
0.1905292, 1.370326, 1.397062, 0, 0.5333334, 1, 1,
0.1922818, 0.2240186, -2.794403, 0, 0.5254902, 1, 1,
0.1956328, 0.2528833, 0.7423906, 0, 0.5215687, 1, 1,
0.1959743, -0.4709893, 1.679516, 0, 0.5137255, 1, 1,
0.1967249, 2.325415, 0.3347529, 0, 0.509804, 1, 1,
0.1974408, -0.4652147, 2.358193, 0, 0.5019608, 1, 1,
0.1984882, -0.3695109, 3.701127, 0, 0.4941176, 1, 1,
0.1986908, 0.6447733, -0.467094, 0, 0.4901961, 1, 1,
0.2010908, -0.7858092, 2.891952, 0, 0.4823529, 1, 1,
0.2020178, 0.3232056, 1.515746, 0, 0.4784314, 1, 1,
0.2070665, 1.360259, -1.962505, 0, 0.4705882, 1, 1,
0.2075668, 1.65653, 0.06969307, 0, 0.4666667, 1, 1,
0.2130177, -0.8865912, 3.963233, 0, 0.4588235, 1, 1,
0.2145924, -1.290646, 4.465235, 0, 0.454902, 1, 1,
0.2149376, -0.6499523, 4.581306, 0, 0.4470588, 1, 1,
0.2165917, -0.2677899, 1.312011, 0, 0.4431373, 1, 1,
0.218, 0.07769199, -0.4093925, 0, 0.4352941, 1, 1,
0.219256, -1.950902, 1.946531, 0, 0.4313726, 1, 1,
0.2243661, -1.721377, 2.517483, 0, 0.4235294, 1, 1,
0.2259938, -0.3160295, 2.997001, 0, 0.4196078, 1, 1,
0.2288372, -0.1738495, 2.764116, 0, 0.4117647, 1, 1,
0.2307297, 0.9493233, 0.6694615, 0, 0.4078431, 1, 1,
0.2338135, 0.7930648, 0.8400419, 0, 0.4, 1, 1,
0.236205, -0.8846273, 2.373143, 0, 0.3921569, 1, 1,
0.236699, -0.6033509, 2.933001, 0, 0.3882353, 1, 1,
0.238142, 1.376033, 0.4748838, 0, 0.3803922, 1, 1,
0.238856, -3.396625, 1.083781, 0, 0.3764706, 1, 1,
0.2403922, 1.691813, 0.2405001, 0, 0.3686275, 1, 1,
0.2488185, -0.9712973, 4.436869, 0, 0.3647059, 1, 1,
0.2491944, -0.9969679, 3.171723, 0, 0.3568628, 1, 1,
0.2514337, -1.323161, 1.252427, 0, 0.3529412, 1, 1,
0.2539469, -0.2555585, 3.312616, 0, 0.345098, 1, 1,
0.2561809, 0.386249, 0.7594406, 0, 0.3411765, 1, 1,
0.2573777, -0.9012324, 2.555891, 0, 0.3333333, 1, 1,
0.2577102, 0.9652818, 1.94785, 0, 0.3294118, 1, 1,
0.2589739, 0.494716, -1.24328, 0, 0.3215686, 1, 1,
0.2595374, -1.180318, 1.357202, 0, 0.3176471, 1, 1,
0.2603907, 1.045674, -1.117957, 0, 0.3098039, 1, 1,
0.2649411, -0.8356231, 3.919007, 0, 0.3058824, 1, 1,
0.2668902, 1.082364, 1.837349, 0, 0.2980392, 1, 1,
0.2744181, 0.4174348, 0.9126055, 0, 0.2901961, 1, 1,
0.2753608, 0.6446733, 0.5119799, 0, 0.2862745, 1, 1,
0.276542, 0.009951367, -0.3383283, 0, 0.2784314, 1, 1,
0.2800109, 0.09466305, 1.042236, 0, 0.2745098, 1, 1,
0.2820926, 0.07305473, 2.048773, 0, 0.2666667, 1, 1,
0.2824271, -1.262236, 3.135884, 0, 0.2627451, 1, 1,
0.2936748, -1.512722, 3.578337, 0, 0.254902, 1, 1,
0.2956884, -0.403628, 3.491774, 0, 0.2509804, 1, 1,
0.2963746, -0.5709098, 1.143978, 0, 0.2431373, 1, 1,
0.2977601, 0.1748344, 1.205353, 0, 0.2392157, 1, 1,
0.3060313, -0.5932778, 1.445738, 0, 0.2313726, 1, 1,
0.310823, 0.2435335, 2.671748, 0, 0.227451, 1, 1,
0.3108623, 0.8364641, -1.24156, 0, 0.2196078, 1, 1,
0.312595, -1.166202, 2.888049, 0, 0.2156863, 1, 1,
0.3130178, 0.7292143, 1.252983, 0, 0.2078431, 1, 1,
0.3195764, -0.3604003, 4.237965, 0, 0.2039216, 1, 1,
0.3240758, 0.4821962, -0.2723971, 0, 0.1960784, 1, 1,
0.3243514, -0.05964102, 0.5321391, 0, 0.1882353, 1, 1,
0.3288923, 0.2946801, 2.54051, 0, 0.1843137, 1, 1,
0.330527, 1.241446, -0.4462501, 0, 0.1764706, 1, 1,
0.3322896, 0.9857694, -0.2438304, 0, 0.172549, 1, 1,
0.3326974, -0.210316, 3.235994, 0, 0.1647059, 1, 1,
0.3503015, 0.6928073, -1.123336, 0, 0.1607843, 1, 1,
0.3560671, -1.431322, 0.8862757, 0, 0.1529412, 1, 1,
0.3560858, 0.03618921, 1.41456, 0, 0.1490196, 1, 1,
0.3627454, -0.8262399, 2.380371, 0, 0.1411765, 1, 1,
0.3675842, 2.566725, 2.686387, 0, 0.1372549, 1, 1,
0.3885957, 2.118248, -0.02654293, 0, 0.1294118, 1, 1,
0.3901352, 1.664968, 0.2621722, 0, 0.1254902, 1, 1,
0.3946342, -2.500984, 3.796882, 0, 0.1176471, 1, 1,
0.4018591, 0.8571877, 2.941276, 0, 0.1137255, 1, 1,
0.4052567, 0.2502062, 1.628609, 0, 0.1058824, 1, 1,
0.4063553, -0.7504471, 3.418151, 0, 0.09803922, 1, 1,
0.4105536, 0.2829968, 1.983211, 0, 0.09411765, 1, 1,
0.4132743, -0.09604343, 3.648137, 0, 0.08627451, 1, 1,
0.4212875, -0.9109266, 2.759348, 0, 0.08235294, 1, 1,
0.4234743, 1.599494, 0.4118145, 0, 0.07450981, 1, 1,
0.4281422, -0.6730465, 2.208328, 0, 0.07058824, 1, 1,
0.4323742, -0.1770834, 2.70982, 0, 0.0627451, 1, 1,
0.4329326, -0.5954524, 2.656096, 0, 0.05882353, 1, 1,
0.4338671, 1.952615, 0.5863858, 0, 0.05098039, 1, 1,
0.4346373, -1.208034, 0.2127533, 0, 0.04705882, 1, 1,
0.4451905, 2.025024, 1.645426, 0, 0.03921569, 1, 1,
0.4452487, 1.450342, 0.9163764, 0, 0.03529412, 1, 1,
0.4480444, 0.9991285, 0.9560895, 0, 0.02745098, 1, 1,
0.4508751, -0.5619593, 2.120253, 0, 0.02352941, 1, 1,
0.4527279, 0.579101, 0.36805, 0, 0.01568628, 1, 1,
0.4578195, -1.15421, 1.707082, 0, 0.01176471, 1, 1,
0.4582115, 0.0191073, 1.352937, 0, 0.003921569, 1, 1,
0.4602401, -0.3561761, 3.232341, 0.003921569, 0, 1, 1,
0.4621429, 0.7867445, 0.06860263, 0.007843138, 0, 1, 1,
0.4638604, -0.7647261, 2.150164, 0.01568628, 0, 1, 1,
0.4639706, -1.675739, 2.497901, 0.01960784, 0, 1, 1,
0.4651482, -1.011831, 2.790101, 0.02745098, 0, 1, 1,
0.4663048, -1.921146, 3.333963, 0.03137255, 0, 1, 1,
0.4738311, 0.3412557, 0.726798, 0.03921569, 0, 1, 1,
0.474957, -0.7051125, 2.845297, 0.04313726, 0, 1, 1,
0.475569, 0.4944339, 0.174326, 0.05098039, 0, 1, 1,
0.4763388, -1.126287, 1.90677, 0.05490196, 0, 1, 1,
0.4764669, -0.2643918, 2.199831, 0.0627451, 0, 1, 1,
0.4774001, -1.023009, 0.03205044, 0.06666667, 0, 1, 1,
0.4805548, 2.290939, 0.2945176, 0.07450981, 0, 1, 1,
0.4807495, 1.745414, 0.6388872, 0.07843138, 0, 1, 1,
0.4813101, -1.633231, 3.217867, 0.08627451, 0, 1, 1,
0.4828072, -0.4438505, 2.407879, 0.09019608, 0, 1, 1,
0.4845918, -0.8252198, 1.295122, 0.09803922, 0, 1, 1,
0.4896093, -0.3495771, 2.191205, 0.1058824, 0, 1, 1,
0.4943488, -1.717044, 3.091699, 0.1098039, 0, 1, 1,
0.4958801, -0.4159534, 3.154597, 0.1176471, 0, 1, 1,
0.4960141, -0.09970666, 2.349022, 0.1215686, 0, 1, 1,
0.4980096, 0.5993847, -0.7630585, 0.1294118, 0, 1, 1,
0.4993937, -0.6125337, 1.363136, 0.1333333, 0, 1, 1,
0.5041476, 0.07572883, 0.4602886, 0.1411765, 0, 1, 1,
0.5046647, -0.1412711, 1.777995, 0.145098, 0, 1, 1,
0.5120711, 1.627727, 0.1429289, 0.1529412, 0, 1, 1,
0.5129326, -0.8081188, 1.530339, 0.1568628, 0, 1, 1,
0.5135837, -0.6650584, 4.273612, 0.1647059, 0, 1, 1,
0.5177046, 0.8692002, -1.054007, 0.1686275, 0, 1, 1,
0.523197, -0.2569214, 1.40035, 0.1764706, 0, 1, 1,
0.5257325, 2.120972, 1.042071, 0.1803922, 0, 1, 1,
0.5267519, -0.4111384, 0.6269222, 0.1882353, 0, 1, 1,
0.5290145, -0.06636228, -0.02203582, 0.1921569, 0, 1, 1,
0.5317184, 0.5823698, 1.334273, 0.2, 0, 1, 1,
0.5411373, -0.6450291, 2.522445, 0.2078431, 0, 1, 1,
0.5503676, -0.4647728, 2.009555, 0.2117647, 0, 1, 1,
0.5505348, 0.7010596, 1.943791, 0.2196078, 0, 1, 1,
0.5533391, -0.3065982, -0.05280378, 0.2235294, 0, 1, 1,
0.5563719, -0.1353537, 1.495647, 0.2313726, 0, 1, 1,
0.5611087, 0.7187263, 0.5393917, 0.2352941, 0, 1, 1,
0.5658646, 0.631473, 2.070762, 0.2431373, 0, 1, 1,
0.567941, 0.06608857, 3.101154, 0.2470588, 0, 1, 1,
0.5683312, -0.4521944, 2.70644, 0.254902, 0, 1, 1,
0.5709707, -1.097876, 4.531675, 0.2588235, 0, 1, 1,
0.5865986, -0.1446832, -0.3224462, 0.2666667, 0, 1, 1,
0.5901861, 0.01005957, 3.091983, 0.2705882, 0, 1, 1,
0.5909912, 2.03636, 1.69636, 0.2784314, 0, 1, 1,
0.5913706, -1.765385, 1.921705, 0.282353, 0, 1, 1,
0.5925614, 0.8526205, -0.4253519, 0.2901961, 0, 1, 1,
0.5935643, 0.6179745, 0.2192128, 0.2941177, 0, 1, 1,
0.5936405, 0.3823851, 1.071241, 0.3019608, 0, 1, 1,
0.5937709, 0.1509639, 2.327347, 0.3098039, 0, 1, 1,
0.6033639, -0.2616023, 1.727694, 0.3137255, 0, 1, 1,
0.6041984, -1.63967, 3.235994, 0.3215686, 0, 1, 1,
0.6074032, -0.8335425, 3.686982, 0.3254902, 0, 1, 1,
0.6096782, 0.4681508, 2.083749, 0.3333333, 0, 1, 1,
0.6113265, 1.220846, 2.485375, 0.3372549, 0, 1, 1,
0.6123782, 0.7043606, 0.6602327, 0.345098, 0, 1, 1,
0.6138093, 1.2659, 1.566352, 0.3490196, 0, 1, 1,
0.619655, -0.906356, 3.17328, 0.3568628, 0, 1, 1,
0.6214662, 1.696941, 0.5294338, 0.3607843, 0, 1, 1,
0.6234958, 0.166215, 1.206303, 0.3686275, 0, 1, 1,
0.6252677, -1.537919, -0.174347, 0.372549, 0, 1, 1,
0.6254375, 0.2819884, 2.157135, 0.3803922, 0, 1, 1,
0.627343, -0.1843733, 3.001289, 0.3843137, 0, 1, 1,
0.6291277, -2.522117, 1.511939, 0.3921569, 0, 1, 1,
0.6387811, 0.08154684, 1.19081, 0.3960784, 0, 1, 1,
0.6388848, -1.144811, 4.203017, 0.4039216, 0, 1, 1,
0.6447393, 1.781116, 0.3770666, 0.4117647, 0, 1, 1,
0.6471021, -0.8441041, 2.467301, 0.4156863, 0, 1, 1,
0.6528124, -0.3244187, 1.973175, 0.4235294, 0, 1, 1,
0.654006, 0.3710257, 0.333712, 0.427451, 0, 1, 1,
0.6587798, -1.237464, 2.680976, 0.4352941, 0, 1, 1,
0.6621001, -1.125456, 3.348025, 0.4392157, 0, 1, 1,
0.6628137, 0.6168242, -0.1222979, 0.4470588, 0, 1, 1,
0.6630956, -0.2705886, 0.3745418, 0.4509804, 0, 1, 1,
0.6690857, 0.8442795, 1.073853, 0.4588235, 0, 1, 1,
0.669697, 1.672665, 0.5228841, 0.4627451, 0, 1, 1,
0.6698987, -0.2490998, 0.2973739, 0.4705882, 0, 1, 1,
0.6717488, 0.8503786, 2.190756, 0.4745098, 0, 1, 1,
0.6734417, -0.816064, 3.704332, 0.4823529, 0, 1, 1,
0.6776372, -1.537648, 2.845533, 0.4862745, 0, 1, 1,
0.6859459, 0.1308118, 1.779383, 0.4941176, 0, 1, 1,
0.6921363, -0.9004949, 0.925805, 0.5019608, 0, 1, 1,
0.6961355, 0.7597883, 0.5680444, 0.5058824, 0, 1, 1,
0.6975366, -1.639899, 2.422487, 0.5137255, 0, 1, 1,
0.6996239, 1.770573, 2.373263, 0.5176471, 0, 1, 1,
0.7038345, 0.08394273, 0.0002707769, 0.5254902, 0, 1, 1,
0.7086068, -0.02518832, 3.106334, 0.5294118, 0, 1, 1,
0.7155464, -1.174451, 4.055779, 0.5372549, 0, 1, 1,
0.7208011, -0.9089025, 3.302941, 0.5411765, 0, 1, 1,
0.7223158, -1.230701, 0.5090957, 0.5490196, 0, 1, 1,
0.7295189, 0.05935902, 3.730584, 0.5529412, 0, 1, 1,
0.7320014, -0.3474429, 2.597479, 0.5607843, 0, 1, 1,
0.7331611, 0.1827919, 2.255383, 0.5647059, 0, 1, 1,
0.7394411, 1.425244, 0.4502078, 0.572549, 0, 1, 1,
0.7428347, 0.8596025, -0.5817196, 0.5764706, 0, 1, 1,
0.7482721, -1.201786, 1.883196, 0.5843138, 0, 1, 1,
0.7515908, 0.7239563, 0.9102407, 0.5882353, 0, 1, 1,
0.7596191, -0.918878, 3.560755, 0.5960785, 0, 1, 1,
0.7597988, -0.3538805, 1.574985, 0.6039216, 0, 1, 1,
0.7603787, 0.4684125, 0.03840161, 0.6078432, 0, 1, 1,
0.7608147, 0.7841386, 0.840998, 0.6156863, 0, 1, 1,
0.7707654, 0.7434719, 0.6023812, 0.6196079, 0, 1, 1,
0.7739645, -0.4664876, 4.389974, 0.627451, 0, 1, 1,
0.7822391, -0.07293195, 1.785283, 0.6313726, 0, 1, 1,
0.783179, 0.2099566, 0.7980337, 0.6392157, 0, 1, 1,
0.7857449, 0.6525599, 1.606433, 0.6431373, 0, 1, 1,
0.7863851, 0.1111041, 1.5754, 0.6509804, 0, 1, 1,
0.7867165, -1.243945, 2.267197, 0.654902, 0, 1, 1,
0.7989148, -1.431101, 2.615759, 0.6627451, 0, 1, 1,
0.798968, -2.550408, 0.390834, 0.6666667, 0, 1, 1,
0.8000618, 0.428854, -1.147861, 0.6745098, 0, 1, 1,
0.8159704, 0.06073651, -0.495806, 0.6784314, 0, 1, 1,
0.82382, 0.4502258, -0.4569306, 0.6862745, 0, 1, 1,
0.8284016, 0.1935375, 2.223966, 0.6901961, 0, 1, 1,
0.8295862, -0.02358839, 0.1796052, 0.6980392, 0, 1, 1,
0.8301546, -1.318543, 3.838164, 0.7058824, 0, 1, 1,
0.8368761, 0.9044075, -0.0858757, 0.7098039, 0, 1, 1,
0.8465181, 1.93179, -0.3579593, 0.7176471, 0, 1, 1,
0.8500392, -0.0740741, 1.812294, 0.7215686, 0, 1, 1,
0.8503371, -1.427476, 3.312245, 0.7294118, 0, 1, 1,
0.8577896, -2.281657, 2.808986, 0.7333333, 0, 1, 1,
0.8586859, -1.042423, 1.989647, 0.7411765, 0, 1, 1,
0.8599471, 0.9281653, 0.151436, 0.7450981, 0, 1, 1,
0.8642048, 0.6641214, -0.5761399, 0.7529412, 0, 1, 1,
0.8661064, 2.003262, 1.362324, 0.7568628, 0, 1, 1,
0.8674994, -0.5828087, 2.625211, 0.7647059, 0, 1, 1,
0.8735571, 0.4664268, 2.087052, 0.7686275, 0, 1, 1,
0.8748034, -0.2581742, 1.102613, 0.7764706, 0, 1, 1,
0.8839403, -0.7198236, 2.615246, 0.7803922, 0, 1, 1,
0.8860234, 2.270854, -0.6214218, 0.7882353, 0, 1, 1,
0.8953789, 2.030452, 0.2630279, 0.7921569, 0, 1, 1,
0.8971089, 0.4676571, -0.03269472, 0.8, 0, 1, 1,
0.8985208, -0.07241919, 2.116135, 0.8078431, 0, 1, 1,
0.9046142, 2.054298, 0.7377278, 0.8117647, 0, 1, 1,
0.9097195, -0.5799943, 2.02575, 0.8196079, 0, 1, 1,
0.9099422, -1.257097, 3.599516, 0.8235294, 0, 1, 1,
0.9126599, 0.7092743, -1.391696, 0.8313726, 0, 1, 1,
0.915826, -0.7089571, 2.502276, 0.8352941, 0, 1, 1,
0.9174147, -0.5833115, 2.321942, 0.8431373, 0, 1, 1,
0.9193139, 0.05406329, 2.076983, 0.8470588, 0, 1, 1,
0.9255779, -1.600033, 2.710119, 0.854902, 0, 1, 1,
0.9321076, 0.282338, 0.1557233, 0.8588235, 0, 1, 1,
0.9330818, 2.24878, 1.544855, 0.8666667, 0, 1, 1,
0.9346888, -1.355151, 2.783314, 0.8705882, 0, 1, 1,
0.9375094, -0.1144885, 3.171213, 0.8784314, 0, 1, 1,
0.9512181, 0.3818161, 0.7514125, 0.8823529, 0, 1, 1,
0.9519554, 0.2611307, 1.198012, 0.8901961, 0, 1, 1,
0.9559824, 1.49158, 2.507971, 0.8941177, 0, 1, 1,
0.9595969, -0.6614853, 3.059698, 0.9019608, 0, 1, 1,
0.9607964, 0.3299642, 0.3518159, 0.9098039, 0, 1, 1,
0.9642634, -0.6088508, 1.609494, 0.9137255, 0, 1, 1,
0.9713882, 2.017946, 1.68302, 0.9215686, 0, 1, 1,
0.9735932, 0.1525305, 1.933699, 0.9254902, 0, 1, 1,
0.9765698, 0.6232966, 0.6265706, 0.9333333, 0, 1, 1,
0.9803756, 0.2119029, 1.172963, 0.9372549, 0, 1, 1,
0.9810703, -0.3184905, 1.698959, 0.945098, 0, 1, 1,
0.9842779, -0.8125694, 2.329507, 0.9490196, 0, 1, 1,
0.989186, 0.1706014, 0.6010308, 0.9568627, 0, 1, 1,
0.9903593, -0.9290911, 0.8271798, 0.9607843, 0, 1, 1,
0.9912043, 0.7381892, 0.3955643, 0.9686275, 0, 1, 1,
0.9913646, -0.2768641, 2.846821, 0.972549, 0, 1, 1,
0.9921447, -2.484294, 1.35737, 0.9803922, 0, 1, 1,
0.9944825, -1.479264, 2.439752, 0.9843137, 0, 1, 1,
1.002411, -0.1699138, 3.148383, 0.9921569, 0, 1, 1,
1.004344, -0.1026612, 1.131147, 0.9960784, 0, 1, 1,
1.005804, 1.577733, 1.902803, 1, 0, 0.9960784, 1,
1.006513, 0.6896468, 0.26323, 1, 0, 0.9882353, 1,
1.012274, 0.1184571, 1.047882, 1, 0, 0.9843137, 1,
1.012602, 0.8365189, -0.2530743, 1, 0, 0.9764706, 1,
1.01434, 1.128753, 1.221506, 1, 0, 0.972549, 1,
1.014753, 0.1885088, 1.633727, 1, 0, 0.9647059, 1,
1.015232, -0.837869, 2.024503, 1, 0, 0.9607843, 1,
1.018208, 1.424788, -0.8141665, 1, 0, 0.9529412, 1,
1.020525, 1.203908, 0.5565571, 1, 0, 0.9490196, 1,
1.023316, -0.362811, 2.545871, 1, 0, 0.9411765, 1,
1.025764, -0.4438666, 1.324464, 1, 0, 0.9372549, 1,
1.029646, -0.6311554, 1.666093, 1, 0, 0.9294118, 1,
1.039853, -0.4915955, 0.3393076, 1, 0, 0.9254902, 1,
1.042503, -0.3805753, 1.640137, 1, 0, 0.9176471, 1,
1.045086, -0.1205717, 1.798834, 1, 0, 0.9137255, 1,
1.045745, 0.4714567, 0.2445126, 1, 0, 0.9058824, 1,
1.051896, 0.7243283, 2.982602, 1, 0, 0.9019608, 1,
1.056788, -1.962396, 2.168287, 1, 0, 0.8941177, 1,
1.057127, 1.396442, 1.194361, 1, 0, 0.8862745, 1,
1.062778, 1.488302, -0.3708421, 1, 0, 0.8823529, 1,
1.065399, 0.1085031, 3.703605, 1, 0, 0.8745098, 1,
1.069189, 0.9465098, -0.3229935, 1, 0, 0.8705882, 1,
1.07334, 1.941564, 0.4958508, 1, 0, 0.8627451, 1,
1.081742, -0.9079955, 3.011618, 1, 0, 0.8588235, 1,
1.087556, 0.2198559, 2.085978, 1, 0, 0.8509804, 1,
1.092273, -0.178059, 0.8262124, 1, 0, 0.8470588, 1,
1.104464, -0.4552647, 1.776982, 1, 0, 0.8392157, 1,
1.10447, -1.216008, 2.50578, 1, 0, 0.8352941, 1,
1.112515, 0.2737909, 2.528227, 1, 0, 0.827451, 1,
1.113161, 0.1361689, 2.556468, 1, 0, 0.8235294, 1,
1.122222, -0.147285, 1.880296, 1, 0, 0.8156863, 1,
1.122995, -0.8267027, 3.311076, 1, 0, 0.8117647, 1,
1.123101, -1.634157, 1.621184, 1, 0, 0.8039216, 1,
1.123258, 0.18963, 3.589878, 1, 0, 0.7960784, 1,
1.126516, 0.6487585, 1.473682, 1, 0, 0.7921569, 1,
1.141256, 0.3242637, -0.4240573, 1, 0, 0.7843137, 1,
1.142256, -0.3626641, 2.329075, 1, 0, 0.7803922, 1,
1.14392, -0.8870412, 0.8675985, 1, 0, 0.772549, 1,
1.149424, -0.05222179, 1.670731, 1, 0, 0.7686275, 1,
1.152305, -0.1189888, 0.3574234, 1, 0, 0.7607843, 1,
1.158918, -1.385942, 3.124534, 1, 0, 0.7568628, 1,
1.161006, 0.4335002, 2.361863, 1, 0, 0.7490196, 1,
1.16333, 0.3139211, 1.372334, 1, 0, 0.7450981, 1,
1.16497, 0.2504468, 1.425464, 1, 0, 0.7372549, 1,
1.17309, 0.9731462, 0.8852878, 1, 0, 0.7333333, 1,
1.176088, 0.07681917, 0.6221273, 1, 0, 0.7254902, 1,
1.176299, -2.093813, 1.776015, 1, 0, 0.7215686, 1,
1.177479, 0.07486648, 3.788202, 1, 0, 0.7137255, 1,
1.178034, -0.1898752, 2.152049, 1, 0, 0.7098039, 1,
1.18539, 0.7301477, -0.02924043, 1, 0, 0.7019608, 1,
1.191761, 0.633851, 2.516711, 1, 0, 0.6941177, 1,
1.196432, -0.6679564, 1.366697, 1, 0, 0.6901961, 1,
1.198702, 0.7968507, -1.710327, 1, 0, 0.682353, 1,
1.198833, -0.0968197, 2.084763, 1, 0, 0.6784314, 1,
1.198987, 0.05304438, 0.9713564, 1, 0, 0.6705883, 1,
1.207094, -1.084285, 2.145849, 1, 0, 0.6666667, 1,
1.215542, -0.1078189, 2.311771, 1, 0, 0.6588235, 1,
1.218631, 1.161953, 0.4038053, 1, 0, 0.654902, 1,
1.21909, -2.443626, 5.266571, 1, 0, 0.6470588, 1,
1.224999, 0.4475511, 1.007238, 1, 0, 0.6431373, 1,
1.230081, 0.4986064, 0.1886251, 1, 0, 0.6352941, 1,
1.235079, 2.129731, 1.469289, 1, 0, 0.6313726, 1,
1.245783, -0.2411806, 1.03918, 1, 0, 0.6235294, 1,
1.260293, -0.8513291, 3.235587, 1, 0, 0.6196079, 1,
1.286472, 0.9640096, -1.709307, 1, 0, 0.6117647, 1,
1.287568, 0.6960575, 0.7531928, 1, 0, 0.6078432, 1,
1.287824, 1.386262, 2.376866, 1, 0, 0.6, 1,
1.299087, 0.1064263, 0.8001438, 1, 0, 0.5921569, 1,
1.300749, -0.9948635, 0.02268462, 1, 0, 0.5882353, 1,
1.304726, 1.025872, 1.668621, 1, 0, 0.5803922, 1,
1.312393, 0.05153096, 1.057595, 1, 0, 0.5764706, 1,
1.315822, -0.5325943, 3.772547, 1, 0, 0.5686275, 1,
1.327468, 0.06808187, 1.203433, 1, 0, 0.5647059, 1,
1.346792, 0.374093, 0.2460968, 1, 0, 0.5568628, 1,
1.353887, -0.7466483, 3.084291, 1, 0, 0.5529412, 1,
1.356447, 0.69103, 0.5062821, 1, 0, 0.5450981, 1,
1.359079, 0.02238298, 2.609576, 1, 0, 0.5411765, 1,
1.365655, 0.6985028, 3.368824, 1, 0, 0.5333334, 1,
1.367113, -0.8994667, 1.67276, 1, 0, 0.5294118, 1,
1.369938, -1.151938, 2.32239, 1, 0, 0.5215687, 1,
1.386417, -0.5986565, 0.04271578, 1, 0, 0.5176471, 1,
1.389563, 1.351426, 0.2810219, 1, 0, 0.509804, 1,
1.400885, -1.143431, 2.312443, 1, 0, 0.5058824, 1,
1.416162, 1.432329, 1.128241, 1, 0, 0.4980392, 1,
1.418916, 0.8258713, 1.26206, 1, 0, 0.4901961, 1,
1.421148, -0.2127105, 1.992555, 1, 0, 0.4862745, 1,
1.425605, 1.125855, 2.324035, 1, 0, 0.4784314, 1,
1.438177, -2.379123, 2.458034, 1, 0, 0.4745098, 1,
1.444533, -0.6034512, 1.323661, 1, 0, 0.4666667, 1,
1.453271, -0.5606068, 1.051002, 1, 0, 0.4627451, 1,
1.471738, 1.713596, 1.317154, 1, 0, 0.454902, 1,
1.476506, 0.3858306, 0.9850372, 1, 0, 0.4509804, 1,
1.477222, 0.06060163, 0.7850209, 1, 0, 0.4431373, 1,
1.47839, 1.65749, 0.1725743, 1, 0, 0.4392157, 1,
1.485708, -0.2792577, 1.605419, 1, 0, 0.4313726, 1,
1.500546, 0.3523544, -0.3482271, 1, 0, 0.427451, 1,
1.514401, -1.339079, 1.494986, 1, 0, 0.4196078, 1,
1.517018, -0.004412731, 2.91175, 1, 0, 0.4156863, 1,
1.520351, -1.194727, 1.744671, 1, 0, 0.4078431, 1,
1.526935, 0.6054213, 0.8660941, 1, 0, 0.4039216, 1,
1.532041, -0.02491251, 1.207656, 1, 0, 0.3960784, 1,
1.533164, 0.2370267, 0.7233317, 1, 0, 0.3882353, 1,
1.549606, -0.6320295, 0.9532359, 1, 0, 0.3843137, 1,
1.550382, -1.96823, 1.526652, 1, 0, 0.3764706, 1,
1.550493, -0.4973958, 0.7478765, 1, 0, 0.372549, 1,
1.552487, 0.9891762, 1.817199, 1, 0, 0.3647059, 1,
1.560274, 0.8758956, 0.5991491, 1, 0, 0.3607843, 1,
1.560847, -1.085483, 2.41994, 1, 0, 0.3529412, 1,
1.565498, 1.233301, 0.9858882, 1, 0, 0.3490196, 1,
1.566593, 0.3156424, 2.41851, 1, 0, 0.3411765, 1,
1.579215, -1.562172, 2.165384, 1, 0, 0.3372549, 1,
1.585811, -2.046706, 2.386366, 1, 0, 0.3294118, 1,
1.594095, 1.297967, 1.791247, 1, 0, 0.3254902, 1,
1.621748, -0.8870978, 1.408078, 1, 0, 0.3176471, 1,
1.633403, -0.1374394, 0.4428331, 1, 0, 0.3137255, 1,
1.647184, -0.2271086, 1.53288, 1, 0, 0.3058824, 1,
1.663422, 0.6189368, 0.233313, 1, 0, 0.2980392, 1,
1.670879, -0.05604194, 1.35916, 1, 0, 0.2941177, 1,
1.697608, -0.9429795, 2.785726, 1, 0, 0.2862745, 1,
1.727286, -0.5818917, 2.64243, 1, 0, 0.282353, 1,
1.73474, -0.6232188, 0.8286862, 1, 0, 0.2745098, 1,
1.735605, -1.035455, -0.4280195, 1, 0, 0.2705882, 1,
1.754129, -0.17445, 0.6509588, 1, 0, 0.2627451, 1,
1.772192, -2.474455, 1.198298, 1, 0, 0.2588235, 1,
1.802872, -0.4108016, 2.030028, 1, 0, 0.2509804, 1,
1.808065, -0.8166656, 1.540674, 1, 0, 0.2470588, 1,
1.810936, -0.6287546, 2.088023, 1, 0, 0.2392157, 1,
1.815918, 0.7508874, 0.1434027, 1, 0, 0.2352941, 1,
1.84944, 0.05016785, 1.619538, 1, 0, 0.227451, 1,
1.855094, -0.976692, 1.498178, 1, 0, 0.2235294, 1,
1.871139, 1.714196, 1.526226, 1, 0, 0.2156863, 1,
1.887212, 1.494851, 1.750906, 1, 0, 0.2117647, 1,
1.90077, 1.123355, 1.393578, 1, 0, 0.2039216, 1,
1.907223, 0.5387456, 1.697739, 1, 0, 0.1960784, 1,
1.912974, -0.6771351, 1.16817, 1, 0, 0.1921569, 1,
1.916614, -0.01172925, 0.7344174, 1, 0, 0.1843137, 1,
1.943792, -0.3776913, 2.28866, 1, 0, 0.1803922, 1,
1.955689, -0.7110728, 2.501093, 1, 0, 0.172549, 1,
1.982237, 0.7037436, 2.679787, 1, 0, 0.1686275, 1,
1.996212, -1.158821, 0.615443, 1, 0, 0.1607843, 1,
2.002729, -0.7973458, 2.063296, 1, 0, 0.1568628, 1,
2.029106, 1.177297, 1.361455, 1, 0, 0.1490196, 1,
2.049196, -1.064874, 3.485147, 1, 0, 0.145098, 1,
2.054066, -0.007114441, 0.5292957, 1, 0, 0.1372549, 1,
2.05729, 0.6013815, 1.576727, 1, 0, 0.1333333, 1,
2.095555, -0.5501857, 2.169586, 1, 0, 0.1254902, 1,
2.115341, 0.2680606, 2.100419, 1, 0, 0.1215686, 1,
2.126333, 0.04107943, 1.971335, 1, 0, 0.1137255, 1,
2.165612, 1.102594, -0.3904023, 1, 0, 0.1098039, 1,
2.185211, 0.03313832, 2.814252, 1, 0, 0.1019608, 1,
2.185717, 0.1227839, 2.011432, 1, 0, 0.09411765, 1,
2.290213, 0.05847434, 0.7088931, 1, 0, 0.09019608, 1,
2.291617, -0.003452798, 1.818847, 1, 0, 0.08235294, 1,
2.30863, 1.048491, 1.067057, 1, 0, 0.07843138, 1,
2.366908, 0.6706789, 2.356088, 1, 0, 0.07058824, 1,
2.372717, -1.678792, 1.985267, 1, 0, 0.06666667, 1,
2.501961, -1.145262, 0.9201073, 1, 0, 0.05882353, 1,
2.742154, -0.8097148, 0.1868146, 1, 0, 0.05490196, 1,
2.80092, -0.6065091, 1.176184, 1, 0, 0.04705882, 1,
2.848109, 1.720313, 1.966715, 1, 0, 0.04313726, 1,
2.869037, 2.082698, -0.07089663, 1, 0, 0.03529412, 1,
2.940769, 0.5041017, 2.040054, 1, 0, 0.03137255, 1,
3.121759, 1.352552, 1.751169, 1, 0, 0.02352941, 1,
3.156819, 0.01719639, 2.156251, 1, 0, 0.01960784, 1,
3.749521, 1.675238, 1.626277, 1, 0, 0.01176471, 1,
4.08148, 0.3150406, 0.9231185, 1, 0, 0.007843138, 1
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
0.5071514, -4.431141, -7.644549, 0, -0.5, 0.5, 0.5,
0.5071514, -4.431141, -7.644549, 1, -0.5, 0.5, 0.5,
0.5071514, -4.431141, -7.644549, 1, 1.5, 0.5, 0.5,
0.5071514, -4.431141, -7.644549, 0, 1.5, 0.5, 0.5
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
-4.278874, -0.3449558, -7.644549, 0, -0.5, 0.5, 0.5,
-4.278874, -0.3449558, -7.644549, 1, -0.5, 0.5, 0.5,
-4.278874, -0.3449558, -7.644549, 1, 1.5, 0.5, 0.5,
-4.278874, -0.3449558, -7.644549, 0, 1.5, 0.5, 0.5
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
-4.278874, -4.431141, -0.2533605, 0, -0.5, 0.5, 0.5,
-4.278874, -4.431141, -0.2533605, 1, -0.5, 0.5, 0.5,
-4.278874, -4.431141, -0.2533605, 1, 1.5, 0.5, 0.5,
-4.278874, -4.431141, -0.2533605, 0, 1.5, 0.5, 0.5
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
-2, -3.488175, -5.93889,
4, -3.488175, -5.93889,
-2, -3.488175, -5.93889,
-2, -3.645336, -6.223166,
0, -3.488175, -5.93889,
0, -3.645336, -6.223166,
2, -3.488175, -5.93889,
2, -3.645336, -6.223166,
4, -3.488175, -5.93889,
4, -3.645336, -6.223166
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
"2",
"4"
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
-2, -3.959658, -6.791719, 0, -0.5, 0.5, 0.5,
-2, -3.959658, -6.791719, 1, -0.5, 0.5, 0.5,
-2, -3.959658, -6.791719, 1, 1.5, 0.5, 0.5,
-2, -3.959658, -6.791719, 0, 1.5, 0.5, 0.5,
0, -3.959658, -6.791719, 0, -0.5, 0.5, 0.5,
0, -3.959658, -6.791719, 1, -0.5, 0.5, 0.5,
0, -3.959658, -6.791719, 1, 1.5, 0.5, 0.5,
0, -3.959658, -6.791719, 0, 1.5, 0.5, 0.5,
2, -3.959658, -6.791719, 0, -0.5, 0.5, 0.5,
2, -3.959658, -6.791719, 1, -0.5, 0.5, 0.5,
2, -3.959658, -6.791719, 1, 1.5, 0.5, 0.5,
2, -3.959658, -6.791719, 0, 1.5, 0.5, 0.5,
4, -3.959658, -6.791719, 0, -0.5, 0.5, 0.5,
4, -3.959658, -6.791719, 1, -0.5, 0.5, 0.5,
4, -3.959658, -6.791719, 1, 1.5, 0.5, 0.5,
4, -3.959658, -6.791719, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.174407, -3, -5.93889,
-3.174407, 2, -5.93889,
-3.174407, -3, -5.93889,
-3.358485, -3, -6.223166,
-3.174407, -2, -5.93889,
-3.358485, -2, -6.223166,
-3.174407, -1, -5.93889,
-3.358485, -1, -6.223166,
-3.174407, 0, -5.93889,
-3.358485, 0, -6.223166,
-3.174407, 1, -5.93889,
-3.358485, 1, -6.223166,
-3.174407, 2, -5.93889,
-3.358485, 2, -6.223166
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
-3.72664, -3, -6.791719, 0, -0.5, 0.5, 0.5,
-3.72664, -3, -6.791719, 1, -0.5, 0.5, 0.5,
-3.72664, -3, -6.791719, 1, 1.5, 0.5, 0.5,
-3.72664, -3, -6.791719, 0, 1.5, 0.5, 0.5,
-3.72664, -2, -6.791719, 0, -0.5, 0.5, 0.5,
-3.72664, -2, -6.791719, 1, -0.5, 0.5, 0.5,
-3.72664, -2, -6.791719, 1, 1.5, 0.5, 0.5,
-3.72664, -2, -6.791719, 0, 1.5, 0.5, 0.5,
-3.72664, -1, -6.791719, 0, -0.5, 0.5, 0.5,
-3.72664, -1, -6.791719, 1, -0.5, 0.5, 0.5,
-3.72664, -1, -6.791719, 1, 1.5, 0.5, 0.5,
-3.72664, -1, -6.791719, 0, 1.5, 0.5, 0.5,
-3.72664, 0, -6.791719, 0, -0.5, 0.5, 0.5,
-3.72664, 0, -6.791719, 1, -0.5, 0.5, 0.5,
-3.72664, 0, -6.791719, 1, 1.5, 0.5, 0.5,
-3.72664, 0, -6.791719, 0, 1.5, 0.5, 0.5,
-3.72664, 1, -6.791719, 0, -0.5, 0.5, 0.5,
-3.72664, 1, -6.791719, 1, -0.5, 0.5, 0.5,
-3.72664, 1, -6.791719, 1, 1.5, 0.5, 0.5,
-3.72664, 1, -6.791719, 0, 1.5, 0.5, 0.5,
-3.72664, 2, -6.791719, 0, -0.5, 0.5, 0.5,
-3.72664, 2, -6.791719, 1, -0.5, 0.5, 0.5,
-3.72664, 2, -6.791719, 1, 1.5, 0.5, 0.5,
-3.72664, 2, -6.791719, 0, 1.5, 0.5, 0.5
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
-3.174407, -3.488175, -4,
-3.174407, -3.488175, 4,
-3.174407, -3.488175, -4,
-3.358485, -3.645336, -4,
-3.174407, -3.488175, -2,
-3.358485, -3.645336, -2,
-3.174407, -3.488175, 0,
-3.358485, -3.645336, 0,
-3.174407, -3.488175, 2,
-3.358485, -3.645336, 2,
-3.174407, -3.488175, 4,
-3.358485, -3.645336, 4
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
-3.72664, -3.959658, -4, 0, -0.5, 0.5, 0.5,
-3.72664, -3.959658, -4, 1, -0.5, 0.5, 0.5,
-3.72664, -3.959658, -4, 1, 1.5, 0.5, 0.5,
-3.72664, -3.959658, -4, 0, 1.5, 0.5, 0.5,
-3.72664, -3.959658, -2, 0, -0.5, 0.5, 0.5,
-3.72664, -3.959658, -2, 1, -0.5, 0.5, 0.5,
-3.72664, -3.959658, -2, 1, 1.5, 0.5, 0.5,
-3.72664, -3.959658, -2, 0, 1.5, 0.5, 0.5,
-3.72664, -3.959658, 0, 0, -0.5, 0.5, 0.5,
-3.72664, -3.959658, 0, 1, -0.5, 0.5, 0.5,
-3.72664, -3.959658, 0, 1, 1.5, 0.5, 0.5,
-3.72664, -3.959658, 0, 0, 1.5, 0.5, 0.5,
-3.72664, -3.959658, 2, 0, -0.5, 0.5, 0.5,
-3.72664, -3.959658, 2, 1, -0.5, 0.5, 0.5,
-3.72664, -3.959658, 2, 1, 1.5, 0.5, 0.5,
-3.72664, -3.959658, 2, 0, 1.5, 0.5, 0.5,
-3.72664, -3.959658, 4, 0, -0.5, 0.5, 0.5,
-3.72664, -3.959658, 4, 1, -0.5, 0.5, 0.5,
-3.72664, -3.959658, 4, 1, 1.5, 0.5, 0.5,
-3.72664, -3.959658, 4, 0, 1.5, 0.5, 0.5
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
-3.174407, -3.488175, -5.93889,
-3.174407, 2.798264, -5.93889,
-3.174407, -3.488175, 5.432169,
-3.174407, 2.798264, 5.432169,
-3.174407, -3.488175, -5.93889,
-3.174407, -3.488175, 5.432169,
-3.174407, 2.798264, -5.93889,
-3.174407, 2.798264, 5.432169,
-3.174407, -3.488175, -5.93889,
4.188709, -3.488175, -5.93889,
-3.174407, -3.488175, 5.432169,
4.188709, -3.488175, 5.432169,
-3.174407, 2.798264, -5.93889,
4.188709, 2.798264, -5.93889,
-3.174407, 2.798264, 5.432169,
4.188709, 2.798264, 5.432169,
4.188709, -3.488175, -5.93889,
4.188709, 2.798264, -5.93889,
4.188709, -3.488175, 5.432169,
4.188709, 2.798264, 5.432169,
4.188709, -3.488175, -5.93889,
4.188709, -3.488175, 5.432169,
4.188709, 2.798264, -5.93889,
4.188709, 2.798264, 5.432169
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
var radius = 7.97467;
var distance = 35.48021;
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
mvMatrix.translate( -0.5071514, 0.3449558, 0.2533605 );
mvMatrix.scale( 1.171022, 1.371583, 0.7582732 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.48021);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
metobenzuron<-read.table("metobenzuron.xyz")
```

```
## Error in read.table("metobenzuron.xyz"): no lines available in input
```

```r
x<-metobenzuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'metobenzuron' not found
```

```r
y<-metobenzuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'metobenzuron' not found
```

```r
z<-metobenzuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'metobenzuron' not found
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
-3.067177, 0.07718571, 0.01974902, 0, 0, 1, 1, 1,
-2.982555, -1.205776, -2.695407, 1, 0, 0, 1, 1,
-2.947354, 1.034696, -0.9616153, 1, 0, 0, 1, 1,
-2.878396, 0.5688649, 1.111643, 1, 0, 0, 1, 1,
-2.711714, -0.8746212, -2.003048, 1, 0, 0, 1, 1,
-2.685254, 0.02895055, -1.403996, 1, 0, 0, 1, 1,
-2.510476, 1.35088, -1.145908, 0, 0, 0, 1, 1,
-2.427985, 0.4138383, -0.5330848, 0, 0, 0, 1, 1,
-2.424593, -0.3416284, -2.740097, 0, 0, 0, 1, 1,
-2.299496, 0.9543238, 0.2940482, 0, 0, 0, 1, 1,
-2.254485, -1.308324, -1.251274, 0, 0, 0, 1, 1,
-2.23922, 1.6625, 0.246783, 0, 0, 0, 1, 1,
-2.239141, 0.8260807, 1.811206, 0, 0, 0, 1, 1,
-2.185037, 1.957119, -1.657699, 1, 1, 1, 1, 1,
-2.184412, 0.5581228, -1.63428, 1, 1, 1, 1, 1,
-2.169099, 0.2625417, -1.983708, 1, 1, 1, 1, 1,
-2.149873, -0.1162957, -0.7436208, 1, 1, 1, 1, 1,
-2.149229, -0.9796101, -0.7769103, 1, 1, 1, 1, 1,
-2.127523, -0.3452102, -4.079169, 1, 1, 1, 1, 1,
-2.116029, -0.1088714, -1.639859, 1, 1, 1, 1, 1,
-2.11197, -0.1809717, -2.898996, 1, 1, 1, 1, 1,
-2.111593, 0.5484694, -0.6515734, 1, 1, 1, 1, 1,
-2.07943, 2.547536, -0.7593627, 1, 1, 1, 1, 1,
-2.046578, 2.362094, -1.811152, 1, 1, 1, 1, 1,
-2.043018, -0.6763228, -0.8769868, 1, 1, 1, 1, 1,
-2.041647, 1.097864, -1.479301, 1, 1, 1, 1, 1,
-2.034093, -0.2260799, -1.114387, 1, 1, 1, 1, 1,
-2.01134, -0.1822727, -1.100529, 1, 1, 1, 1, 1,
-2.00349, -0.1036903, -1.65276, 0, 0, 1, 1, 1,
-1.958229, 0.6119477, -0.8861006, 1, 0, 0, 1, 1,
-1.9405, -1.090327, -1.283964, 1, 0, 0, 1, 1,
-1.903635, -0.7313985, -1.623669, 1, 0, 0, 1, 1,
-1.903185, -1.42939, -3.052805, 1, 0, 0, 1, 1,
-1.891949, -0.0004046024, -1.848679, 1, 0, 0, 1, 1,
-1.885299, -1.636259, -1.887344, 0, 0, 0, 1, 1,
-1.867603, -1.6613, -3.654237, 0, 0, 0, 1, 1,
-1.827205, -1.609655, -1.976271, 0, 0, 0, 1, 1,
-1.812283, 0.7588632, -2.712902, 0, 0, 0, 1, 1,
-1.802413, -0.7125102, -0.9934156, 0, 0, 0, 1, 1,
-1.798505, 0.9778503, -1.175651, 0, 0, 0, 1, 1,
-1.79533, 0.6188198, -1.709266, 0, 0, 0, 1, 1,
-1.788108, -1.17995, -2.535843, 1, 1, 1, 1, 1,
-1.786719, 0.2258728, -0.9028856, 1, 1, 1, 1, 1,
-1.774162, 0.3336179, -1.62523, 1, 1, 1, 1, 1,
-1.770619, 0.7798978, -0.4844194, 1, 1, 1, 1, 1,
-1.757842, 0.4725322, -2.035482, 1, 1, 1, 1, 1,
-1.743394, -0.5544335, -1.006846, 1, 1, 1, 1, 1,
-1.736543, 1.114921, -1.250749, 1, 1, 1, 1, 1,
-1.732011, -0.6740553, -0.8133652, 1, 1, 1, 1, 1,
-1.727244, -0.5532072, -1.027346, 1, 1, 1, 1, 1,
-1.723104, -0.2288448, -1.700358, 1, 1, 1, 1, 1,
-1.722616, -0.02660202, -1.173188, 1, 1, 1, 1, 1,
-1.719781, 0.7475898, -1.085562, 1, 1, 1, 1, 1,
-1.713113, -0.4351503, -0.5642458, 1, 1, 1, 1, 1,
-1.667388, -0.8571125, -2.108629, 1, 1, 1, 1, 1,
-1.664099, -0.04705121, -1.284893, 1, 1, 1, 1, 1,
-1.641597, 0.7478965, -0.3713582, 0, 0, 1, 1, 1,
-1.637874, -0.02598651, -1.599689, 1, 0, 0, 1, 1,
-1.62215, -0.07229313, -1.047137, 1, 0, 0, 1, 1,
-1.616581, -2.095412, -1.401554, 1, 0, 0, 1, 1,
-1.604269, -0.7567452, -2.796516, 1, 0, 0, 1, 1,
-1.601621, -0.4415854, -2.301363, 1, 0, 0, 1, 1,
-1.599912, 0.2812515, -0.4670894, 0, 0, 0, 1, 1,
-1.590856, 0.1525294, -3.804974, 0, 0, 0, 1, 1,
-1.572785, 0.2990812, -2.622773, 0, 0, 0, 1, 1,
-1.57023, 2.34904, -0.3906926, 0, 0, 0, 1, 1,
-1.548203, -0.9807682, -3.013125, 0, 0, 0, 1, 1,
-1.547744, -1.981546, -1.479009, 0, 0, 0, 1, 1,
-1.545617, -0.4291551, -3.536486, 0, 0, 0, 1, 1,
-1.540384, 1.412632, -1.553799, 1, 1, 1, 1, 1,
-1.537584, -0.07334498, -1.233952, 1, 1, 1, 1, 1,
-1.537528, 0.01374682, -0.5674629, 1, 1, 1, 1, 1,
-1.526329, 1.533229, -1.928079, 1, 1, 1, 1, 1,
-1.499682, 2.423427, -0.2962942, 1, 1, 1, 1, 1,
-1.471424, -0.384872, -1.096639, 1, 1, 1, 1, 1,
-1.45535, 0.7113037, -1.6656, 1, 1, 1, 1, 1,
-1.451397, 1.113417, 0.5269328, 1, 1, 1, 1, 1,
-1.442587, 0.9276181, 1.678173, 1, 1, 1, 1, 1,
-1.426753, 1.060865, -0.8110184, 1, 1, 1, 1, 1,
-1.425834, 0.5847642, -0.3414237, 1, 1, 1, 1, 1,
-1.418492, -0.4588151, -1.178645, 1, 1, 1, 1, 1,
-1.405823, -1.029391, -2.01462, 1, 1, 1, 1, 1,
-1.405113, -1.124121, -3.237935, 1, 1, 1, 1, 1,
-1.398234, -0.9407945, -3.513949, 1, 1, 1, 1, 1,
-1.395568, 0.1916988, -1.726379, 0, 0, 1, 1, 1,
-1.393136, 0.1185001, 0.1021371, 1, 0, 0, 1, 1,
-1.367532, 1.301514, -0.02734953, 1, 0, 0, 1, 1,
-1.360068, 0.639607, -1.327196, 1, 0, 0, 1, 1,
-1.353574, 0.2973622, 1.244668, 1, 0, 0, 1, 1,
-1.32688, 0.9277649, -0.234229, 1, 0, 0, 1, 1,
-1.320135, -1.443223, -0.2163054, 0, 0, 0, 1, 1,
-1.318651, 1.196255, -0.8212672, 0, 0, 0, 1, 1,
-1.306525, -2.599954, -1.048845, 0, 0, 0, 1, 1,
-1.306358, -0.3425749, -3.225655, 0, 0, 0, 1, 1,
-1.297425, -0.8636834, -2.587147, 0, 0, 0, 1, 1,
-1.286119, -2.328247, -2.96118, 0, 0, 0, 1, 1,
-1.285534, 0.8542828, 0.1226644, 0, 0, 0, 1, 1,
-1.28529, -0.7427614, -1.445862, 1, 1, 1, 1, 1,
-1.284516, 0.9679517, -1.259432, 1, 1, 1, 1, 1,
-1.280051, 1.67781, -0.5558104, 1, 1, 1, 1, 1,
-1.273306, -1.553121, -2.904775, 1, 1, 1, 1, 1,
-1.267003, -0.1982434, -0.1658724, 1, 1, 1, 1, 1,
-1.262994, -2.064369, -3.009763, 1, 1, 1, 1, 1,
-1.262238, 1.643307, 0.5948655, 1, 1, 1, 1, 1,
-1.256181, -0.876285, -2.521973, 1, 1, 1, 1, 1,
-1.256129, -0.1506439, -3.584118, 1, 1, 1, 1, 1,
-1.251768, -0.1052584, -0.310255, 1, 1, 1, 1, 1,
-1.250533, -0.587536, -2.264835, 1, 1, 1, 1, 1,
-1.249544, 0.3721739, -1.544768, 1, 1, 1, 1, 1,
-1.243762, 0.4478357, -2.343503, 1, 1, 1, 1, 1,
-1.23771, 0.8523978, -2.023399, 1, 1, 1, 1, 1,
-1.233918, -0.3036034, -0.1943321, 1, 1, 1, 1, 1,
-1.227938, -0.05162017, -1.901739, 0, 0, 1, 1, 1,
-1.226486, 1.762273, 0.7003285, 1, 0, 0, 1, 1,
-1.220812, 0.8447381, -1.636478, 1, 0, 0, 1, 1,
-1.212208, 1.086411, -1.57123, 1, 0, 0, 1, 1,
-1.209103, -0.5097184, -2.084112, 1, 0, 0, 1, 1,
-1.208623, -1.213453, -3.280366, 1, 0, 0, 1, 1,
-1.201453, 1.032503, -1.014265, 0, 0, 0, 1, 1,
-1.194208, -0.8129289, -3.077785, 0, 0, 0, 1, 1,
-1.191781, -0.5281457, -1.237746, 0, 0, 0, 1, 1,
-1.187319, 0.6606377, 0.4974497, 0, 0, 0, 1, 1,
-1.183401, 0.06428581, -1.334712, 0, 0, 0, 1, 1,
-1.180068, 0.6570935, -1.573031, 0, 0, 0, 1, 1,
-1.177875, 0.972804, -1.357661, 0, 0, 0, 1, 1,
-1.176019, 0.245709, -2.458869, 1, 1, 1, 1, 1,
-1.165515, -1.46445, -1.966753, 1, 1, 1, 1, 1,
-1.163649, 0.8173252, 0.6929153, 1, 1, 1, 1, 1,
-1.160879, -0.4900493, -1.85306, 1, 1, 1, 1, 1,
-1.156524, 1.472727, -1.322288, 1, 1, 1, 1, 1,
-1.154189, 1.196045, -1.397533, 1, 1, 1, 1, 1,
-1.146416, 1.867159, -0.8889636, 1, 1, 1, 1, 1,
-1.126144, 0.01555547, -0.6386122, 1, 1, 1, 1, 1,
-1.125169, 0.5434539, -2.238643, 1, 1, 1, 1, 1,
-1.125166, 1.301306, -0.4493017, 1, 1, 1, 1, 1,
-1.124193, 1.244958, -1.288771, 1, 1, 1, 1, 1,
-1.123358, 0.7027102, -0.8809558, 1, 1, 1, 1, 1,
-1.120797, 0.7823014, -2.25349, 1, 1, 1, 1, 1,
-1.116456, 0.8630617, -1.562877, 1, 1, 1, 1, 1,
-1.115935, -2.065281, -3.130526, 1, 1, 1, 1, 1,
-1.10849, -0.6551903, -0.726487, 0, 0, 1, 1, 1,
-1.100916, 1.159559, 0.2399786, 1, 0, 0, 1, 1,
-1.096562, -0.3053796, -1.891951, 1, 0, 0, 1, 1,
-1.0944, -0.4489709, -2.660018, 1, 0, 0, 1, 1,
-1.093098, -0.1766927, -1.613198, 1, 0, 0, 1, 1,
-1.080574, -1.04119, -3.370667, 1, 0, 0, 1, 1,
-1.07449, 0.2126017, -0.2464993, 0, 0, 0, 1, 1,
-1.072179, -0.5497511, 0.7532799, 0, 0, 0, 1, 1,
-1.069551, -0.198996, -2.504146, 0, 0, 0, 1, 1,
-1.065929, 1.177814, -0.3791964, 0, 0, 0, 1, 1,
-1.055845, -0.5510588, -2.278394, 0, 0, 0, 1, 1,
-1.055164, 0.01544506, -3.760788, 0, 0, 0, 1, 1,
-1.052604, 0.7749155, -0.9870386, 0, 0, 0, 1, 1,
-1.051677, -0.236387, -1.306745, 1, 1, 1, 1, 1,
-1.051033, 0.5628031, -1.463994, 1, 1, 1, 1, 1,
-1.050088, 1.696369, -0.2064901, 1, 1, 1, 1, 1,
-1.039722, -0.4294931, -1.854863, 1, 1, 1, 1, 1,
-1.029207, 0.5527074, 0.1922384, 1, 1, 1, 1, 1,
-1.025185, -0.9304571, -1.760786, 1, 1, 1, 1, 1,
-1.018468, 0.8861689, 0.2985519, 1, 1, 1, 1, 1,
-1.017879, -1.186047, -1.706419, 1, 1, 1, 1, 1,
-1.016201, -0.4416327, -1.016591, 1, 1, 1, 1, 1,
-1.012608, 0.9443069, 1.216511, 1, 1, 1, 1, 1,
-1.006188, -1.204961, -3.678653, 1, 1, 1, 1, 1,
-1.005514, 0.2140184, -0.1547135, 1, 1, 1, 1, 1,
-1.002558, 1.444379, 0.9329929, 1, 1, 1, 1, 1,
-0.9979078, -0.06037872, -0.5177296, 1, 1, 1, 1, 1,
-0.997633, -0.6238201, -2.230247, 1, 1, 1, 1, 1,
-0.9918937, 0.170041, -0.4759511, 0, 0, 1, 1, 1,
-0.9896583, 2.108716, 0.3639273, 1, 0, 0, 1, 1,
-0.9895065, 0.3492013, -2.625459, 1, 0, 0, 1, 1,
-0.9888332, -1.608052, -2.610261, 1, 0, 0, 1, 1,
-0.9862792, -0.7826552, -2.744249, 1, 0, 0, 1, 1,
-0.9843293, -1.46589, -5.154389, 1, 0, 0, 1, 1,
-0.9802315, 0.1210562, -0.1518266, 0, 0, 0, 1, 1,
-0.9778734, 0.09709572, -1.571541, 0, 0, 0, 1, 1,
-0.9730145, -1.025491, -4.340616, 0, 0, 0, 1, 1,
-0.9718876, -0.01517015, -1.247227, 0, 0, 0, 1, 1,
-0.9717333, 1.406786, 0.3397416, 0, 0, 0, 1, 1,
-0.9715292, 1.145294, -1.554548, 0, 0, 0, 1, 1,
-0.963528, -1.792979, -1.627056, 0, 0, 0, 1, 1,
-0.962993, -3.213982, -3.145048, 1, 1, 1, 1, 1,
-0.9581227, 0.4797203, -1.449481, 1, 1, 1, 1, 1,
-0.9466627, 1.420805, -0.1742529, 1, 1, 1, 1, 1,
-0.9366359, 0.3346596, -2.712816, 1, 1, 1, 1, 1,
-0.9351758, -1.13645, -2.801857, 1, 1, 1, 1, 1,
-0.9284163, 0.08454238, -2.168141, 1, 1, 1, 1, 1,
-0.9283559, 0.04076904, -3.047714, 1, 1, 1, 1, 1,
-0.927861, -0.5088951, -1.304971, 1, 1, 1, 1, 1,
-0.9233645, -0.3403979, -1.460806, 1, 1, 1, 1, 1,
-0.9100041, -0.234334, -2.343411, 1, 1, 1, 1, 1,
-0.9090037, 0.2077424, 0.8917562, 1, 1, 1, 1, 1,
-0.9083617, -0.735053, -4.642724, 1, 1, 1, 1, 1,
-0.9012935, -0.507637, -3.863539, 1, 1, 1, 1, 1,
-0.9010053, 1.428141, -0.8083243, 1, 1, 1, 1, 1,
-0.9004628, -0.1921855, -2.197936, 1, 1, 1, 1, 1,
-0.8948918, -0.1575754, -1.63325, 0, 0, 1, 1, 1,
-0.8920227, -0.4851229, -0.4801862, 1, 0, 0, 1, 1,
-0.8897537, 0.6143981, -2.138177, 1, 0, 0, 1, 1,
-0.8865333, -0.1299542, -2.17112, 1, 0, 0, 1, 1,
-0.8839663, -1.971501, -2.487549, 1, 0, 0, 1, 1,
-0.8806963, -1.979093, -2.933374, 1, 0, 0, 1, 1,
-0.8792648, 0.1471441, -1.715665, 0, 0, 0, 1, 1,
-0.8750709, -0.09834124, -1.472256, 0, 0, 0, 1, 1,
-0.8737364, 0.6492246, 0.6136689, 0, 0, 0, 1, 1,
-0.8714768, 1.359412, -1.319387, 0, 0, 0, 1, 1,
-0.866033, -0.01594735, -1.860864, 0, 0, 0, 1, 1,
-0.858282, -0.6833509, -1.777424, 0, 0, 0, 1, 1,
-0.8575186, -0.2660113, -1.994241, 0, 0, 0, 1, 1,
-0.8503656, -0.3999061, -2.998678, 1, 1, 1, 1, 1,
-0.8440171, 0.41366, -0.05268165, 1, 1, 1, 1, 1,
-0.8435246, 0.02254136, -3.290886, 1, 1, 1, 1, 1,
-0.8433774, 0.4769197, -0.9594343, 1, 1, 1, 1, 1,
-0.8405673, -0.5453473, -0.612264, 1, 1, 1, 1, 1,
-0.8392062, -1.504365, -2.553139, 1, 1, 1, 1, 1,
-0.8366776, 0.3360159, -1.252718, 1, 1, 1, 1, 1,
-0.8307004, -0.1642291, -2.027002, 1, 1, 1, 1, 1,
-0.8282242, 1.607818, -1.417614, 1, 1, 1, 1, 1,
-0.8205281, 2.017662, 0.6096885, 1, 1, 1, 1, 1,
-0.8067032, -0.4625039, -1.418747, 1, 1, 1, 1, 1,
-0.8044255, 0.7785073, -1.749005, 1, 1, 1, 1, 1,
-0.8028701, -1.203859, -2.522111, 1, 1, 1, 1, 1,
-0.8023514, 1.072607, -1.822415, 1, 1, 1, 1, 1,
-0.8021057, 0.4884913, -0.6933096, 1, 1, 1, 1, 1,
-0.8021019, -0.1897454, -3.048619, 0, 0, 1, 1, 1,
-0.795769, -0.4731484, -1.467445, 1, 0, 0, 1, 1,
-0.7955229, 0.9978274, -0.1096336, 1, 0, 0, 1, 1,
-0.7939625, -0.08276025, -1.67232, 1, 0, 0, 1, 1,
-0.7908548, 1.199407, -0.6593714, 1, 0, 0, 1, 1,
-0.7875254, -0.9107035, -1.747463, 1, 0, 0, 1, 1,
-0.7812183, -1.086495, -2.288987, 0, 0, 0, 1, 1,
-0.7800561, 2.313346, 0.9068025, 0, 0, 0, 1, 1,
-0.7799419, 1.271168, -0.5821495, 0, 0, 0, 1, 1,
-0.7672366, 0.4068742, -1.291416, 0, 0, 0, 1, 1,
-0.763496, -0.8083299, -1.329942, 0, 0, 0, 1, 1,
-0.7618685, 0.3308215, -0.1782888, 0, 0, 0, 1, 1,
-0.7525367, 0.2477847, -0.2992473, 0, 0, 0, 1, 1,
-0.7451732, 1.066847, -1.292376, 1, 1, 1, 1, 1,
-0.7420051, 0.1368331, 0.6802169, 1, 1, 1, 1, 1,
-0.7402124, 1.946339, 0.174352, 1, 1, 1, 1, 1,
-0.7392634, 1.447569, -0.8609495, 1, 1, 1, 1, 1,
-0.7323144, 1.041533, -1.301681, 1, 1, 1, 1, 1,
-0.7232457, 0.6699972, -0.2095849, 1, 1, 1, 1, 1,
-0.7226382, 0.5253428, 0.2704683, 1, 1, 1, 1, 1,
-0.7225081, -0.9426899, -3.367779, 1, 1, 1, 1, 1,
-0.7221451, -1.180552, -2.649333, 1, 1, 1, 1, 1,
-0.7219264, -0.8554246, -2.742299, 1, 1, 1, 1, 1,
-0.7202998, 1.806428, 1.369241, 1, 1, 1, 1, 1,
-0.7043886, 1.97489, -0.1823172, 1, 1, 1, 1, 1,
-0.6995991, 0.6784161, -1.372727, 1, 1, 1, 1, 1,
-0.6933277, 0.5565897, 0.2553647, 1, 1, 1, 1, 1,
-0.6869273, -0.4153335, -2.98174, 1, 1, 1, 1, 1,
-0.684661, -0.4423962, -1.845939, 0, 0, 1, 1, 1,
-0.6836534, 0.2244266, -1.175666, 1, 0, 0, 1, 1,
-0.682129, 0.1488944, -2.153503, 1, 0, 0, 1, 1,
-0.669387, -0.5756667, -2.472661, 1, 0, 0, 1, 1,
-0.6669436, -0.4736995, -1.575042, 1, 0, 0, 1, 1,
-0.6610448, 0.6382448, -2.328595, 1, 0, 0, 1, 1,
-0.6598279, -0.1901663, -3.911448, 0, 0, 0, 1, 1,
-0.6577891, 1.164797, 1.192334, 0, 0, 0, 1, 1,
-0.6536609, 0.8317576, -0.2705732, 0, 0, 0, 1, 1,
-0.6532785, 0.9657895, -1.440009, 0, 0, 0, 1, 1,
-0.652725, -1.437054, -1.641223, 0, 0, 0, 1, 1,
-0.6519731, -0.6571136, -1.620904, 0, 0, 0, 1, 1,
-0.6488224, 1.365081, -0.3856627, 0, 0, 0, 1, 1,
-0.6454026, 0.8737819, -0.5412793, 1, 1, 1, 1, 1,
-0.6417317, 1.060157, -1.259197, 1, 1, 1, 1, 1,
-0.6379335, 0.9852685, -1.297389, 1, 1, 1, 1, 1,
-0.6350488, 0.8725346, -1.676758, 1, 1, 1, 1, 1,
-0.6333367, -1.574078, -2.664596, 1, 1, 1, 1, 1,
-0.6330881, -0.2776388, -1.339786, 1, 1, 1, 1, 1,
-0.6288108, -0.9796622, -2.466549, 1, 1, 1, 1, 1,
-0.6240717, 0.156276, -1.06266, 1, 1, 1, 1, 1,
-0.6213105, -1.511191, -3.570636, 1, 1, 1, 1, 1,
-0.6119597, 0.3730731, -1.408696, 1, 1, 1, 1, 1,
-0.6062184, -0.8582528, -2.798585, 1, 1, 1, 1, 1,
-0.5971969, 1.206049, -0.2079366, 1, 1, 1, 1, 1,
-0.5814988, -0.318074, -3.798938, 1, 1, 1, 1, 1,
-0.5766755, 1.485972, -2.14658, 1, 1, 1, 1, 1,
-0.5719788, -0.0004985197, -1.549969, 1, 1, 1, 1, 1,
-0.5632923, -0.4202822, -2.062701, 0, 0, 1, 1, 1,
-0.5620489, -1.361104, -2.109702, 1, 0, 0, 1, 1,
-0.5618966, -0.7881504, -2.531088, 1, 0, 0, 1, 1,
-0.5570719, 1.657403, -1.216174, 1, 0, 0, 1, 1,
-0.5560818, 0.4734868, -2.645801, 1, 0, 0, 1, 1,
-0.5540468, 1.574435, -0.5455526, 1, 0, 0, 1, 1,
-0.5525793, -1.707501, -0.4923487, 0, 0, 0, 1, 1,
-0.5510797, 0.2518851, -1.101393, 0, 0, 0, 1, 1,
-0.5500576, 0.8411227, -1.362816, 0, 0, 0, 1, 1,
-0.5466945, 0.805674, -0.6565875, 0, 0, 0, 1, 1,
-0.5460337, 0.8131263, -1.049529, 0, 0, 0, 1, 1,
-0.5452061, 0.7521377, -0.2044434, 0, 0, 0, 1, 1,
-0.5382833, 1.293386, 0.7894304, 0, 0, 0, 1, 1,
-0.5338953, 1.20997, 0.02520328, 1, 1, 1, 1, 1,
-0.5334699, -1.289059, -2.257316, 1, 1, 1, 1, 1,
-0.5309345, 0.2030512, -0.7019866, 1, 1, 1, 1, 1,
-0.5239866, -1.017097, -1.688324, 1, 1, 1, 1, 1,
-0.5235357, 0.9813682, 0.4359617, 1, 1, 1, 1, 1,
-0.522402, -0.8907991, -3.4237, 1, 1, 1, 1, 1,
-0.5180922, -0.06071525, -1.584355, 1, 1, 1, 1, 1,
-0.5146698, 0.2937872, -0.8587303, 1, 1, 1, 1, 1,
-0.5115472, 0.5775486, -0.3319433, 1, 1, 1, 1, 1,
-0.5098085, 1.739004, -0.5531681, 1, 1, 1, 1, 1,
-0.5086945, -0.3765553, -3.266783, 1, 1, 1, 1, 1,
-0.5078602, 2.509483, -0.05538912, 1, 1, 1, 1, 1,
-0.5040225, 0.3893602, -2.512243, 1, 1, 1, 1, 1,
-0.502452, 1.346487, -1.154212, 1, 1, 1, 1, 1,
-0.5017388, -0.9380834, -1.821264, 1, 1, 1, 1, 1,
-0.4980589, -0.0341294, -1.334284, 0, 0, 1, 1, 1,
-0.4979804, 0.4190116, -0.4861069, 1, 0, 0, 1, 1,
-0.4950921, -0.9743506, -2.837943, 1, 0, 0, 1, 1,
-0.4894131, -1.437997, -2.559193, 1, 0, 0, 1, 1,
-0.4870922, -1.87461, -2.788641, 1, 0, 0, 1, 1,
-0.4860728, -0.02162313, -1.943381, 1, 0, 0, 1, 1,
-0.4759643, 0.467287, -0.3315314, 0, 0, 0, 1, 1,
-0.4734213, -0.4791382, -3.437526, 0, 0, 0, 1, 1,
-0.4728289, -0.8053373, -3.500708, 0, 0, 0, 1, 1,
-0.4673908, 1.428646, -1.118201, 0, 0, 0, 1, 1,
-0.4643932, 0.4204594, -0.9940788, 0, 0, 0, 1, 1,
-0.4640966, 0.8525305, 0.6442632, 0, 0, 0, 1, 1,
-0.4588304, 0.9227045, 0.7362905, 0, 0, 0, 1, 1,
-0.4581738, -0.6428443, -3.451349, 1, 1, 1, 1, 1,
-0.4557567, -1.091696, -2.488558, 1, 1, 1, 1, 1,
-0.4526784, 1.665776, 0.461278, 1, 1, 1, 1, 1,
-0.4470452, -0.7573901, -3.204138, 1, 1, 1, 1, 1,
-0.4431956, -2.429663, -4.596062, 1, 1, 1, 1, 1,
-0.4402123, -0.9561999, -2.674762, 1, 1, 1, 1, 1,
-0.4385355, 1.064214, -0.6051832, 1, 1, 1, 1, 1,
-0.4376669, -0.7229789, -0.7174175, 1, 1, 1, 1, 1,
-0.4374557, -0.1020835, -2.951611, 1, 1, 1, 1, 1,
-0.4366329, -0.5742426, -2.517303, 1, 1, 1, 1, 1,
-0.435765, -0.1891272, -4.390315, 1, 1, 1, 1, 1,
-0.4345162, 0.4959316, -1.128669, 1, 1, 1, 1, 1,
-0.4264332, 0.0211856, -1.620585, 1, 1, 1, 1, 1,
-0.4238876, 0.2866788, -1.36502, 1, 1, 1, 1, 1,
-0.4234167, 0.249456, -0.1940654, 1, 1, 1, 1, 1,
-0.4171285, -0.716989, -1.381973, 0, 0, 1, 1, 1,
-0.4109724, 0.1595041, 0.1278833, 1, 0, 0, 1, 1,
-0.4106831, 0.6788718, -0.909302, 1, 0, 0, 1, 1,
-0.4104573, -0.1223724, -1.341292, 1, 0, 0, 1, 1,
-0.4103904, 0.155205, -0.1382869, 1, 0, 0, 1, 1,
-0.4064479, -0.4488227, -2.60042, 1, 0, 0, 1, 1,
-0.4050095, 0.1777488, -2.371565, 0, 0, 0, 1, 1,
-0.3983753, -1.260041, -2.65757, 0, 0, 0, 1, 1,
-0.39649, -0.6637655, -2.307192, 0, 0, 0, 1, 1,
-0.3877752, 1.73719, -1.652123, 0, 0, 0, 1, 1,
-0.385478, 0.03198927, -3.014853, 0, 0, 0, 1, 1,
-0.3847105, -0.4230098, -3.831933, 0, 0, 0, 1, 1,
-0.3803503, -0.8778726, -2.007993, 0, 0, 0, 1, 1,
-0.3781108, 0.07114892, -0.8017463, 1, 1, 1, 1, 1,
-0.3756941, 0.9096028, 1.406681, 1, 1, 1, 1, 1,
-0.3709992, -0.5487333, -2.119807, 1, 1, 1, 1, 1,
-0.370352, 1.397685, -0.5929465, 1, 1, 1, 1, 1,
-0.3688323, 1.410537, 1.479948, 1, 1, 1, 1, 1,
-0.3688217, 0.3910107, -1.784699, 1, 1, 1, 1, 1,
-0.3685322, -0.3203615, -1.524424, 1, 1, 1, 1, 1,
-0.3662717, 0.3019032, -3.135185, 1, 1, 1, 1, 1,
-0.3660495, 0.2015506, -0.5664591, 1, 1, 1, 1, 1,
-0.3658535, 1.234567, 0.1332714, 1, 1, 1, 1, 1,
-0.3596571, -1.91624, -0.9326163, 1, 1, 1, 1, 1,
-0.3584344, -0.4704062, -3.252924, 1, 1, 1, 1, 1,
-0.3563494, -0.3342224, -1.91385, 1, 1, 1, 1, 1,
-0.3551997, -0.1769399, -0.2236076, 1, 1, 1, 1, 1,
-0.3479167, 1.735391, -0.8620098, 1, 1, 1, 1, 1,
-0.3435112, 0.2992669, -1.970986, 0, 0, 1, 1, 1,
-0.3433129, 0.5561543, -0.7140951, 1, 0, 0, 1, 1,
-0.3423901, 0.1255013, -0.4445894, 1, 0, 0, 1, 1,
-0.3408451, -0.3341263, -2.049035, 1, 0, 0, 1, 1,
-0.3407638, 0.03853254, -0.626795, 1, 0, 0, 1, 1,
-0.3383107, -0.7528651, -5.773292, 1, 0, 0, 1, 1,
-0.3362928, -0.08532768, -1.543931, 0, 0, 0, 1, 1,
-0.3331703, -1.383782, -0.707492, 0, 0, 0, 1, 1,
-0.3294337, 0.603658, -0.2949935, 0, 0, 0, 1, 1,
-0.3255874, 1.11109, -0.5015796, 0, 0, 0, 1, 1,
-0.3248861, 0.4055791, 0.9492766, 0, 0, 0, 1, 1,
-0.323074, 1.855106, 0.4847638, 0, 0, 0, 1, 1,
-0.3095009, 0.1377532, 0.287649, 0, 0, 0, 1, 1,
-0.3062666, 1.91086, 0.2907202, 1, 1, 1, 1, 1,
-0.2994653, 1.43161, -0.9625909, 1, 1, 1, 1, 1,
-0.2970993, 1.518976, 0.2005599, 1, 1, 1, 1, 1,
-0.2954358, 0.2464603, -2.198127, 1, 1, 1, 1, 1,
-0.2938308, -0.8544132, -2.697344, 1, 1, 1, 1, 1,
-0.2800933, -1.412038, -2.080155, 1, 1, 1, 1, 1,
-0.2788876, 0.2463467, -0.9238055, 1, 1, 1, 1, 1,
-0.2758976, 0.6045589, 0.6044076, 1, 1, 1, 1, 1,
-0.2748431, -0.1774266, -1.969196, 1, 1, 1, 1, 1,
-0.2732203, 1.557187, 0.7057665, 1, 1, 1, 1, 1,
-0.2703642, -0.4612074, -0.5828224, 1, 1, 1, 1, 1,
-0.2696102, -0.3378076, -2.391913, 1, 1, 1, 1, 1,
-0.2674214, -0.6991689, -2.689571, 1, 1, 1, 1, 1,
-0.2661057, 0.06797224, -2.964769, 1, 1, 1, 1, 1,
-0.2660538, -0.7836914, -3.694201, 1, 1, 1, 1, 1,
-0.263637, 0.5015476, 0.1211386, 0, 0, 1, 1, 1,
-0.2597248, 0.03792014, -1.86857, 1, 0, 0, 1, 1,
-0.2556075, -0.7189084, -2.773259, 1, 0, 0, 1, 1,
-0.2550661, 0.266248, -1.823542, 1, 0, 0, 1, 1,
-0.2506481, 2.51253, -2.374779, 1, 0, 0, 1, 1,
-0.2495896, -0.1555209, -2.264373, 1, 0, 0, 1, 1,
-0.248771, -1.603269, -3.505914, 0, 0, 0, 1, 1,
-0.2483937, -1.211655, -3.732055, 0, 0, 0, 1, 1,
-0.2413449, -0.5248728, -2.28704, 0, 0, 0, 1, 1,
-0.2405956, -1.751533, -1.342107, 0, 0, 0, 1, 1,
-0.237414, 0.6981326, -0.7714801, 0, 0, 0, 1, 1,
-0.2362831, 1.426529, -1.172355, 0, 0, 0, 1, 1,
-0.2344755, 0.9691333, 0.02577482, 0, 0, 0, 1, 1,
-0.2344374, -0.9974192, -2.530148, 1, 1, 1, 1, 1,
-0.2340389, -0.4324732, -4.161265, 1, 1, 1, 1, 1,
-0.2321405, -0.1041834, -2.030753, 1, 1, 1, 1, 1,
-0.2304222, 1.582521, -0.6021833, 1, 1, 1, 1, 1,
-0.2299108, -0.02953944, -2.624836, 1, 1, 1, 1, 1,
-0.2294457, 1.026764, -0.4311706, 1, 1, 1, 1, 1,
-0.2272657, 0.4093777, 1.440468, 1, 1, 1, 1, 1,
-0.2204805, 0.05306344, 0.5753468, 1, 1, 1, 1, 1,
-0.2187146, 1.584763, -0.6911096, 1, 1, 1, 1, 1,
-0.2179237, 0.1866881, -0.6299468, 1, 1, 1, 1, 1,
-0.216936, -0.1752369, -2.914028, 1, 1, 1, 1, 1,
-0.2165031, 1.351648, -0.7640635, 1, 1, 1, 1, 1,
-0.215285, 1.187598, -1.86353, 1, 1, 1, 1, 1,
-0.2067689, 1.606125, -0.1218307, 1, 1, 1, 1, 1,
-0.2061239, -2.867719, -5.224105, 1, 1, 1, 1, 1,
-0.1954053, 0.4140168, 1.656263, 0, 0, 1, 1, 1,
-0.1922837, 0.2892475, 0.0003637485, 1, 0, 0, 1, 1,
-0.1912176, -1.199962, -2.43894, 1, 0, 0, 1, 1,
-0.1904388, -0.6785988, -2.037729, 1, 0, 0, 1, 1,
-0.1877688, 0.4168549, -0.1512552, 1, 0, 0, 1, 1,
-0.1876536, 0.356382, 1.359114, 1, 0, 0, 1, 1,
-0.1853775, -0.5125442, -1.909087, 0, 0, 0, 1, 1,
-0.183686, 0.6181973, -0.3384078, 0, 0, 0, 1, 1,
-0.1795619, 0.572679, 1.422704, 0, 0, 0, 1, 1,
-0.1767234, 0.1061991, -2.542073, 0, 0, 0, 1, 1,
-0.1735616, -1.288711, -3.775194, 0, 0, 0, 1, 1,
-0.1707341, -0.9373867, -2.401443, 0, 0, 0, 1, 1,
-0.1682922, 0.5896531, 1.375257, 0, 0, 0, 1, 1,
-0.166323, 0.6719304, -0.5713153, 1, 1, 1, 1, 1,
-0.1652438, 0.6045515, 0.2219185, 1, 1, 1, 1, 1,
-0.1625748, -0.5444563, -2.153663, 1, 1, 1, 1, 1,
-0.1622639, 0.4005179, -1.626742, 1, 1, 1, 1, 1,
-0.1544532, -0.0758547, -2.702186, 1, 1, 1, 1, 1,
-0.1453054, 0.7127803, 0.1492029, 1, 1, 1, 1, 1,
-0.1432001, 1.50264, -0.4892927, 1, 1, 1, 1, 1,
-0.1423407, 1.069844, 0.3181836, 1, 1, 1, 1, 1,
-0.1420024, 0.2047962, -1.047492, 1, 1, 1, 1, 1,
-0.1398956, 0.9072783, 1.422492, 1, 1, 1, 1, 1,
-0.1318398, -1.376876, -2.37753, 1, 1, 1, 1, 1,
-0.1313443, 0.1789503, -0.03397484, 1, 1, 1, 1, 1,
-0.131209, -1.347614, -4.082168, 1, 1, 1, 1, 1,
-0.1307972, 1.470139, -0.07466979, 1, 1, 1, 1, 1,
-0.1235104, 0.5633386, 0.00621805, 1, 1, 1, 1, 1,
-0.1208851, 0.4572006, -0.07731329, 0, 0, 1, 1, 1,
-0.1203271, -0.0273956, -1.916081, 1, 0, 0, 1, 1,
-0.1179769, 0.5304461, -0.6565057, 1, 0, 0, 1, 1,
-0.1170955, -0.8298794, -2.404809, 1, 0, 0, 1, 1,
-0.115909, 2.334487, 0.6691858, 1, 0, 0, 1, 1,
-0.113917, -0.3173847, -3.632539, 1, 0, 0, 1, 1,
-0.1092474, -0.6563693, -3.18451, 0, 0, 0, 1, 1,
-0.1084921, 1.031393, 1.921294, 0, 0, 0, 1, 1,
-0.1078657, -0.4535212, -3.299499, 0, 0, 0, 1, 1,
-0.1034512, -0.3609255, -2.638783, 0, 0, 0, 1, 1,
-0.1001761, 1.025206, -0.9948184, 0, 0, 0, 1, 1,
-0.09971477, 0.6584007, 1.524816, 0, 0, 0, 1, 1,
-0.09774173, -0.9671289, -2.57673, 0, 0, 0, 1, 1,
-0.09708826, 1.764768, 0.0987165, 1, 1, 1, 1, 1,
-0.08794581, -0.4751809, -2.32168, 1, 1, 1, 1, 1,
-0.08627149, -0.1956385, -2.955687, 1, 1, 1, 1, 1,
-0.08379901, -1.188672, -2.866911, 1, 1, 1, 1, 1,
-0.07491388, 0.01522767, -1.956282, 1, 1, 1, 1, 1,
-0.07153925, 0.248961, -0.9798198, 1, 1, 1, 1, 1,
-0.07147565, -0.3077514, -2.893097, 1, 1, 1, 1, 1,
-0.07131727, 0.2185469, 0.4775268, 1, 1, 1, 1, 1,
-0.06943568, 0.406858, -1.363372, 1, 1, 1, 1, 1,
-0.06496856, 0.5431395, -0.5394212, 1, 1, 1, 1, 1,
-0.05543358, 1.33434, 0.8477634, 1, 1, 1, 1, 1,
-0.05293586, -1.112667, -2.126638, 1, 1, 1, 1, 1,
-0.05239372, -0.9816527, -2.717441, 1, 1, 1, 1, 1,
-0.04471236, 0.7028402, 0.724647, 1, 1, 1, 1, 1,
-0.04061563, 1.008056, 1.121838, 1, 1, 1, 1, 1,
-0.03844494, 0.7424617, -0.1848341, 0, 0, 1, 1, 1,
-0.0342208, 1.049863, -1.466378, 1, 0, 0, 1, 1,
-0.03064706, 0.4126509, -1.180125, 1, 0, 0, 1, 1,
-0.03054342, 0.06437118, -0.3429825, 1, 0, 0, 1, 1,
-0.03053705, 0.7651619, -1.549277, 1, 0, 0, 1, 1,
-0.03027601, 0.1917718, -0.5878296, 1, 0, 0, 1, 1,
-0.02872369, -0.5214133, -3.062825, 0, 0, 0, 1, 1,
-0.02856242, -0.9586068, -3.823356, 0, 0, 0, 1, 1,
-0.02731357, -0.5635435, -2.847647, 0, 0, 0, 1, 1,
-0.02520557, -1.585419, -3.295996, 0, 0, 0, 1, 1,
-0.02447548, -0.2052878, -2.935891, 0, 0, 0, 1, 1,
-0.01969186, 2.089985, -0.820614, 0, 0, 0, 1, 1,
-0.01552027, -0.36976, -2.160333, 0, 0, 0, 1, 1,
-0.01333175, 0.1559148, 0.5618181, 1, 1, 1, 1, 1,
-0.01167557, -0.5948108, -2.793962, 1, 1, 1, 1, 1,
-0.003034916, -1.874981, -4.034214, 1, 1, 1, 1, 1,
-0.002981903, 0.9975584, 0.7980828, 1, 1, 1, 1, 1,
0.001344247, 0.2966872, 0.065362, 1, 1, 1, 1, 1,
0.003812709, -0.5264115, 3.845095, 1, 1, 1, 1, 1,
0.004453945, 0.5865179, 1.622685, 1, 1, 1, 1, 1,
0.006302865, -0.008081839, 0.478261, 1, 1, 1, 1, 1,
0.00779691, -0.1017708, 3.927315, 1, 1, 1, 1, 1,
0.008061993, 0.3611121, 0.04693599, 1, 1, 1, 1, 1,
0.01498786, 0.1766192, 1.066055, 1, 1, 1, 1, 1,
0.02041596, 0.8902329, 0.8046343, 1, 1, 1, 1, 1,
0.02206402, -1.156543, 4.005794, 1, 1, 1, 1, 1,
0.02284382, 0.7439394, -1.16491, 1, 1, 1, 1, 1,
0.03073758, -0.8107585, 4.569488, 1, 1, 1, 1, 1,
0.03139282, -0.3332314, 2.964207, 0, 0, 1, 1, 1,
0.03452817, -1.38454, 2.92184, 1, 0, 0, 1, 1,
0.03507074, 0.7873317, -1.241475, 1, 0, 0, 1, 1,
0.03514124, 1.01497, -3.211167, 1, 0, 0, 1, 1,
0.03604474, -1.226064, 0.7531495, 1, 0, 0, 1, 1,
0.03912476, -0.975822, 3.328769, 1, 0, 0, 1, 1,
0.03985237, 0.1086214, -0.6230188, 0, 0, 0, 1, 1,
0.04098178, 1.180492, 0.3624592, 0, 0, 0, 1, 1,
0.04635658, -2.045027, 3.093279, 0, 0, 0, 1, 1,
0.04851077, 0.557202, 1.074954, 0, 0, 0, 1, 1,
0.05187306, 1.168136, 0.1004239, 0, 0, 0, 1, 1,
0.05516634, -2.177661, 3.800822, 0, 0, 0, 1, 1,
0.05595693, 1.256587, -0.8627352, 0, 0, 0, 1, 1,
0.05826133, 0.601554, 0.7006446, 1, 1, 1, 1, 1,
0.05881574, -2.323675, 3.364353, 1, 1, 1, 1, 1,
0.0632214, 2.041474, -1.17648, 1, 1, 1, 1, 1,
0.0655574, -0.8403842, 2.884177, 1, 1, 1, 1, 1,
0.06671861, 0.09961189, -0.03847772, 1, 1, 1, 1, 1,
0.07035225, -2.260311, 3.912353, 1, 1, 1, 1, 1,
0.07686952, -1.430982, 4.143268, 1, 1, 1, 1, 1,
0.07775982, -0.5632231, 3.619935, 1, 1, 1, 1, 1,
0.07788204, -0.9304902, 2.525529, 1, 1, 1, 1, 1,
0.08004489, -1.610793, 3.330415, 1, 1, 1, 1, 1,
0.08161157, 1.636785, -0.8116566, 1, 1, 1, 1, 1,
0.08597466, -1.429521, 2.581942, 1, 1, 1, 1, 1,
0.09241352, 0.02150619, 1.509226, 1, 1, 1, 1, 1,
0.09391347, -0.6811031, 3.189212, 1, 1, 1, 1, 1,
0.09536715, 0.345668, -0.2588088, 1, 1, 1, 1, 1,
0.09778421, -0.4112582, 2.114771, 0, 0, 1, 1, 1,
0.1001774, -0.3434935, 2.956263, 1, 0, 0, 1, 1,
0.1028287, -0.2637292, 1.718113, 1, 0, 0, 1, 1,
0.1124619, 0.2566043, 0.4091091, 1, 0, 0, 1, 1,
0.1128398, -1.35267, 3.263098, 1, 0, 0, 1, 1,
0.1129585, -1.253162, 2.737545, 1, 0, 0, 1, 1,
0.1147469, -1.851488, 4.501078, 0, 0, 0, 1, 1,
0.1166423, 1.068491, 0.1645387, 0, 0, 0, 1, 1,
0.1174547, 0.06237264, 0.09771824, 0, 0, 0, 1, 1,
0.1186818, -0.1173663, 4.198263, 0, 0, 0, 1, 1,
0.1198707, -0.6050416, 2.590394, 0, 0, 0, 1, 1,
0.1216486, 1.045617, 0.8523258, 0, 0, 0, 1, 1,
0.1233747, 1.311349, -0.9522911, 0, 0, 0, 1, 1,
0.1244795, 0.5800914, -1.162932, 1, 1, 1, 1, 1,
0.1266614, 0.8703601, 0.6111055, 1, 1, 1, 1, 1,
0.1277605, -2.137014, 3.156246, 1, 1, 1, 1, 1,
0.1278683, 1.656911, -1.122853, 1, 1, 1, 1, 1,
0.1280489, 2.706713, 1.722201, 1, 1, 1, 1, 1,
0.1292182, 0.7658196, -0.2433979, 1, 1, 1, 1, 1,
0.1299269, 0.6927817, -0.8188162, 1, 1, 1, 1, 1,
0.1369935, -0.8665413, 3.879142, 1, 1, 1, 1, 1,
0.1453362, -1.044638, 3.103224, 1, 1, 1, 1, 1,
0.1456344, -0.6177287, 2.200981, 1, 1, 1, 1, 1,
0.1467363, 0.7486722, -0.315462, 1, 1, 1, 1, 1,
0.1469211, -0.5168574, 3.088594, 1, 1, 1, 1, 1,
0.1471227, -0.329657, 3.524131, 1, 1, 1, 1, 1,
0.1479818, -0.5336547, 2.90347, 1, 1, 1, 1, 1,
0.1516308, 0.7351453, 1.117885, 1, 1, 1, 1, 1,
0.1516836, -0.4153952, 2.164792, 0, 0, 1, 1, 1,
0.1536777, 0.03373372, 1.005356, 1, 0, 0, 1, 1,
0.1537282, -0.0622184, 1.369006, 1, 0, 0, 1, 1,
0.153939, -0.9075921, 3.046319, 1, 0, 0, 1, 1,
0.1553876, -2.310123, 4.724552, 1, 0, 0, 1, 1,
0.1560597, -1.034292, 1.787289, 1, 0, 0, 1, 1,
0.1573425, 0.1439795, 1.34344, 0, 0, 0, 1, 1,
0.1619059, 1.598075, 0.156281, 0, 0, 0, 1, 1,
0.1665607, -0.031591, 3.208681, 0, 0, 0, 1, 1,
0.1672406, 0.678022, 0.4823008, 0, 0, 0, 1, 1,
0.1673397, 0.353886, 2.200315, 0, 0, 0, 1, 1,
0.1738525, 1.545449, 0.5434287, 0, 0, 0, 1, 1,
0.1764943, 1.156913, 0.3325881, 0, 0, 0, 1, 1,
0.1804514, 0.7416168, -0.7220637, 1, 1, 1, 1, 1,
0.1809379, 0.1666977, 1.186988, 1, 1, 1, 1, 1,
0.1820891, -1.218703, 3.061369, 1, 1, 1, 1, 1,
0.1903144, 0.1725873, 0.04131835, 1, 1, 1, 1, 1,
0.1903926, -0.3067255, 3.380544, 1, 1, 1, 1, 1,
0.1905292, 1.370326, 1.397062, 1, 1, 1, 1, 1,
0.1922818, 0.2240186, -2.794403, 1, 1, 1, 1, 1,
0.1956328, 0.2528833, 0.7423906, 1, 1, 1, 1, 1,
0.1959743, -0.4709893, 1.679516, 1, 1, 1, 1, 1,
0.1967249, 2.325415, 0.3347529, 1, 1, 1, 1, 1,
0.1974408, -0.4652147, 2.358193, 1, 1, 1, 1, 1,
0.1984882, -0.3695109, 3.701127, 1, 1, 1, 1, 1,
0.1986908, 0.6447733, -0.467094, 1, 1, 1, 1, 1,
0.2010908, -0.7858092, 2.891952, 1, 1, 1, 1, 1,
0.2020178, 0.3232056, 1.515746, 1, 1, 1, 1, 1,
0.2070665, 1.360259, -1.962505, 0, 0, 1, 1, 1,
0.2075668, 1.65653, 0.06969307, 1, 0, 0, 1, 1,
0.2130177, -0.8865912, 3.963233, 1, 0, 0, 1, 1,
0.2145924, -1.290646, 4.465235, 1, 0, 0, 1, 1,
0.2149376, -0.6499523, 4.581306, 1, 0, 0, 1, 1,
0.2165917, -0.2677899, 1.312011, 1, 0, 0, 1, 1,
0.218, 0.07769199, -0.4093925, 0, 0, 0, 1, 1,
0.219256, -1.950902, 1.946531, 0, 0, 0, 1, 1,
0.2243661, -1.721377, 2.517483, 0, 0, 0, 1, 1,
0.2259938, -0.3160295, 2.997001, 0, 0, 0, 1, 1,
0.2288372, -0.1738495, 2.764116, 0, 0, 0, 1, 1,
0.2307297, 0.9493233, 0.6694615, 0, 0, 0, 1, 1,
0.2338135, 0.7930648, 0.8400419, 0, 0, 0, 1, 1,
0.236205, -0.8846273, 2.373143, 1, 1, 1, 1, 1,
0.236699, -0.6033509, 2.933001, 1, 1, 1, 1, 1,
0.238142, 1.376033, 0.4748838, 1, 1, 1, 1, 1,
0.238856, -3.396625, 1.083781, 1, 1, 1, 1, 1,
0.2403922, 1.691813, 0.2405001, 1, 1, 1, 1, 1,
0.2488185, -0.9712973, 4.436869, 1, 1, 1, 1, 1,
0.2491944, -0.9969679, 3.171723, 1, 1, 1, 1, 1,
0.2514337, -1.323161, 1.252427, 1, 1, 1, 1, 1,
0.2539469, -0.2555585, 3.312616, 1, 1, 1, 1, 1,
0.2561809, 0.386249, 0.7594406, 1, 1, 1, 1, 1,
0.2573777, -0.9012324, 2.555891, 1, 1, 1, 1, 1,
0.2577102, 0.9652818, 1.94785, 1, 1, 1, 1, 1,
0.2589739, 0.494716, -1.24328, 1, 1, 1, 1, 1,
0.2595374, -1.180318, 1.357202, 1, 1, 1, 1, 1,
0.2603907, 1.045674, -1.117957, 1, 1, 1, 1, 1,
0.2649411, -0.8356231, 3.919007, 0, 0, 1, 1, 1,
0.2668902, 1.082364, 1.837349, 1, 0, 0, 1, 1,
0.2744181, 0.4174348, 0.9126055, 1, 0, 0, 1, 1,
0.2753608, 0.6446733, 0.5119799, 1, 0, 0, 1, 1,
0.276542, 0.009951367, -0.3383283, 1, 0, 0, 1, 1,
0.2800109, 0.09466305, 1.042236, 1, 0, 0, 1, 1,
0.2820926, 0.07305473, 2.048773, 0, 0, 0, 1, 1,
0.2824271, -1.262236, 3.135884, 0, 0, 0, 1, 1,
0.2936748, -1.512722, 3.578337, 0, 0, 0, 1, 1,
0.2956884, -0.403628, 3.491774, 0, 0, 0, 1, 1,
0.2963746, -0.5709098, 1.143978, 0, 0, 0, 1, 1,
0.2977601, 0.1748344, 1.205353, 0, 0, 0, 1, 1,
0.3060313, -0.5932778, 1.445738, 0, 0, 0, 1, 1,
0.310823, 0.2435335, 2.671748, 1, 1, 1, 1, 1,
0.3108623, 0.8364641, -1.24156, 1, 1, 1, 1, 1,
0.312595, -1.166202, 2.888049, 1, 1, 1, 1, 1,
0.3130178, 0.7292143, 1.252983, 1, 1, 1, 1, 1,
0.3195764, -0.3604003, 4.237965, 1, 1, 1, 1, 1,
0.3240758, 0.4821962, -0.2723971, 1, 1, 1, 1, 1,
0.3243514, -0.05964102, 0.5321391, 1, 1, 1, 1, 1,
0.3288923, 0.2946801, 2.54051, 1, 1, 1, 1, 1,
0.330527, 1.241446, -0.4462501, 1, 1, 1, 1, 1,
0.3322896, 0.9857694, -0.2438304, 1, 1, 1, 1, 1,
0.3326974, -0.210316, 3.235994, 1, 1, 1, 1, 1,
0.3503015, 0.6928073, -1.123336, 1, 1, 1, 1, 1,
0.3560671, -1.431322, 0.8862757, 1, 1, 1, 1, 1,
0.3560858, 0.03618921, 1.41456, 1, 1, 1, 1, 1,
0.3627454, -0.8262399, 2.380371, 1, 1, 1, 1, 1,
0.3675842, 2.566725, 2.686387, 0, 0, 1, 1, 1,
0.3885957, 2.118248, -0.02654293, 1, 0, 0, 1, 1,
0.3901352, 1.664968, 0.2621722, 1, 0, 0, 1, 1,
0.3946342, -2.500984, 3.796882, 1, 0, 0, 1, 1,
0.4018591, 0.8571877, 2.941276, 1, 0, 0, 1, 1,
0.4052567, 0.2502062, 1.628609, 1, 0, 0, 1, 1,
0.4063553, -0.7504471, 3.418151, 0, 0, 0, 1, 1,
0.4105536, 0.2829968, 1.983211, 0, 0, 0, 1, 1,
0.4132743, -0.09604343, 3.648137, 0, 0, 0, 1, 1,
0.4212875, -0.9109266, 2.759348, 0, 0, 0, 1, 1,
0.4234743, 1.599494, 0.4118145, 0, 0, 0, 1, 1,
0.4281422, -0.6730465, 2.208328, 0, 0, 0, 1, 1,
0.4323742, -0.1770834, 2.70982, 0, 0, 0, 1, 1,
0.4329326, -0.5954524, 2.656096, 1, 1, 1, 1, 1,
0.4338671, 1.952615, 0.5863858, 1, 1, 1, 1, 1,
0.4346373, -1.208034, 0.2127533, 1, 1, 1, 1, 1,
0.4451905, 2.025024, 1.645426, 1, 1, 1, 1, 1,
0.4452487, 1.450342, 0.9163764, 1, 1, 1, 1, 1,
0.4480444, 0.9991285, 0.9560895, 1, 1, 1, 1, 1,
0.4508751, -0.5619593, 2.120253, 1, 1, 1, 1, 1,
0.4527279, 0.579101, 0.36805, 1, 1, 1, 1, 1,
0.4578195, -1.15421, 1.707082, 1, 1, 1, 1, 1,
0.4582115, 0.0191073, 1.352937, 1, 1, 1, 1, 1,
0.4602401, -0.3561761, 3.232341, 1, 1, 1, 1, 1,
0.4621429, 0.7867445, 0.06860263, 1, 1, 1, 1, 1,
0.4638604, -0.7647261, 2.150164, 1, 1, 1, 1, 1,
0.4639706, -1.675739, 2.497901, 1, 1, 1, 1, 1,
0.4651482, -1.011831, 2.790101, 1, 1, 1, 1, 1,
0.4663048, -1.921146, 3.333963, 0, 0, 1, 1, 1,
0.4738311, 0.3412557, 0.726798, 1, 0, 0, 1, 1,
0.474957, -0.7051125, 2.845297, 1, 0, 0, 1, 1,
0.475569, 0.4944339, 0.174326, 1, 0, 0, 1, 1,
0.4763388, -1.126287, 1.90677, 1, 0, 0, 1, 1,
0.4764669, -0.2643918, 2.199831, 1, 0, 0, 1, 1,
0.4774001, -1.023009, 0.03205044, 0, 0, 0, 1, 1,
0.4805548, 2.290939, 0.2945176, 0, 0, 0, 1, 1,
0.4807495, 1.745414, 0.6388872, 0, 0, 0, 1, 1,
0.4813101, -1.633231, 3.217867, 0, 0, 0, 1, 1,
0.4828072, -0.4438505, 2.407879, 0, 0, 0, 1, 1,
0.4845918, -0.8252198, 1.295122, 0, 0, 0, 1, 1,
0.4896093, -0.3495771, 2.191205, 0, 0, 0, 1, 1,
0.4943488, -1.717044, 3.091699, 1, 1, 1, 1, 1,
0.4958801, -0.4159534, 3.154597, 1, 1, 1, 1, 1,
0.4960141, -0.09970666, 2.349022, 1, 1, 1, 1, 1,
0.4980096, 0.5993847, -0.7630585, 1, 1, 1, 1, 1,
0.4993937, -0.6125337, 1.363136, 1, 1, 1, 1, 1,
0.5041476, 0.07572883, 0.4602886, 1, 1, 1, 1, 1,
0.5046647, -0.1412711, 1.777995, 1, 1, 1, 1, 1,
0.5120711, 1.627727, 0.1429289, 1, 1, 1, 1, 1,
0.5129326, -0.8081188, 1.530339, 1, 1, 1, 1, 1,
0.5135837, -0.6650584, 4.273612, 1, 1, 1, 1, 1,
0.5177046, 0.8692002, -1.054007, 1, 1, 1, 1, 1,
0.523197, -0.2569214, 1.40035, 1, 1, 1, 1, 1,
0.5257325, 2.120972, 1.042071, 1, 1, 1, 1, 1,
0.5267519, -0.4111384, 0.6269222, 1, 1, 1, 1, 1,
0.5290145, -0.06636228, -0.02203582, 1, 1, 1, 1, 1,
0.5317184, 0.5823698, 1.334273, 0, 0, 1, 1, 1,
0.5411373, -0.6450291, 2.522445, 1, 0, 0, 1, 1,
0.5503676, -0.4647728, 2.009555, 1, 0, 0, 1, 1,
0.5505348, 0.7010596, 1.943791, 1, 0, 0, 1, 1,
0.5533391, -0.3065982, -0.05280378, 1, 0, 0, 1, 1,
0.5563719, -0.1353537, 1.495647, 1, 0, 0, 1, 1,
0.5611087, 0.7187263, 0.5393917, 0, 0, 0, 1, 1,
0.5658646, 0.631473, 2.070762, 0, 0, 0, 1, 1,
0.567941, 0.06608857, 3.101154, 0, 0, 0, 1, 1,
0.5683312, -0.4521944, 2.70644, 0, 0, 0, 1, 1,
0.5709707, -1.097876, 4.531675, 0, 0, 0, 1, 1,
0.5865986, -0.1446832, -0.3224462, 0, 0, 0, 1, 1,
0.5901861, 0.01005957, 3.091983, 0, 0, 0, 1, 1,
0.5909912, 2.03636, 1.69636, 1, 1, 1, 1, 1,
0.5913706, -1.765385, 1.921705, 1, 1, 1, 1, 1,
0.5925614, 0.8526205, -0.4253519, 1, 1, 1, 1, 1,
0.5935643, 0.6179745, 0.2192128, 1, 1, 1, 1, 1,
0.5936405, 0.3823851, 1.071241, 1, 1, 1, 1, 1,
0.5937709, 0.1509639, 2.327347, 1, 1, 1, 1, 1,
0.6033639, -0.2616023, 1.727694, 1, 1, 1, 1, 1,
0.6041984, -1.63967, 3.235994, 1, 1, 1, 1, 1,
0.6074032, -0.8335425, 3.686982, 1, 1, 1, 1, 1,
0.6096782, 0.4681508, 2.083749, 1, 1, 1, 1, 1,
0.6113265, 1.220846, 2.485375, 1, 1, 1, 1, 1,
0.6123782, 0.7043606, 0.6602327, 1, 1, 1, 1, 1,
0.6138093, 1.2659, 1.566352, 1, 1, 1, 1, 1,
0.619655, -0.906356, 3.17328, 1, 1, 1, 1, 1,
0.6214662, 1.696941, 0.5294338, 1, 1, 1, 1, 1,
0.6234958, 0.166215, 1.206303, 0, 0, 1, 1, 1,
0.6252677, -1.537919, -0.174347, 1, 0, 0, 1, 1,
0.6254375, 0.2819884, 2.157135, 1, 0, 0, 1, 1,
0.627343, -0.1843733, 3.001289, 1, 0, 0, 1, 1,
0.6291277, -2.522117, 1.511939, 1, 0, 0, 1, 1,
0.6387811, 0.08154684, 1.19081, 1, 0, 0, 1, 1,
0.6388848, -1.144811, 4.203017, 0, 0, 0, 1, 1,
0.6447393, 1.781116, 0.3770666, 0, 0, 0, 1, 1,
0.6471021, -0.8441041, 2.467301, 0, 0, 0, 1, 1,
0.6528124, -0.3244187, 1.973175, 0, 0, 0, 1, 1,
0.654006, 0.3710257, 0.333712, 0, 0, 0, 1, 1,
0.6587798, -1.237464, 2.680976, 0, 0, 0, 1, 1,
0.6621001, -1.125456, 3.348025, 0, 0, 0, 1, 1,
0.6628137, 0.6168242, -0.1222979, 1, 1, 1, 1, 1,
0.6630956, -0.2705886, 0.3745418, 1, 1, 1, 1, 1,
0.6690857, 0.8442795, 1.073853, 1, 1, 1, 1, 1,
0.669697, 1.672665, 0.5228841, 1, 1, 1, 1, 1,
0.6698987, -0.2490998, 0.2973739, 1, 1, 1, 1, 1,
0.6717488, 0.8503786, 2.190756, 1, 1, 1, 1, 1,
0.6734417, -0.816064, 3.704332, 1, 1, 1, 1, 1,
0.6776372, -1.537648, 2.845533, 1, 1, 1, 1, 1,
0.6859459, 0.1308118, 1.779383, 1, 1, 1, 1, 1,
0.6921363, -0.9004949, 0.925805, 1, 1, 1, 1, 1,
0.6961355, 0.7597883, 0.5680444, 1, 1, 1, 1, 1,
0.6975366, -1.639899, 2.422487, 1, 1, 1, 1, 1,
0.6996239, 1.770573, 2.373263, 1, 1, 1, 1, 1,
0.7038345, 0.08394273, 0.0002707769, 1, 1, 1, 1, 1,
0.7086068, -0.02518832, 3.106334, 1, 1, 1, 1, 1,
0.7155464, -1.174451, 4.055779, 0, 0, 1, 1, 1,
0.7208011, -0.9089025, 3.302941, 1, 0, 0, 1, 1,
0.7223158, -1.230701, 0.5090957, 1, 0, 0, 1, 1,
0.7295189, 0.05935902, 3.730584, 1, 0, 0, 1, 1,
0.7320014, -0.3474429, 2.597479, 1, 0, 0, 1, 1,
0.7331611, 0.1827919, 2.255383, 1, 0, 0, 1, 1,
0.7394411, 1.425244, 0.4502078, 0, 0, 0, 1, 1,
0.7428347, 0.8596025, -0.5817196, 0, 0, 0, 1, 1,
0.7482721, -1.201786, 1.883196, 0, 0, 0, 1, 1,
0.7515908, 0.7239563, 0.9102407, 0, 0, 0, 1, 1,
0.7596191, -0.918878, 3.560755, 0, 0, 0, 1, 1,
0.7597988, -0.3538805, 1.574985, 0, 0, 0, 1, 1,
0.7603787, 0.4684125, 0.03840161, 0, 0, 0, 1, 1,
0.7608147, 0.7841386, 0.840998, 1, 1, 1, 1, 1,
0.7707654, 0.7434719, 0.6023812, 1, 1, 1, 1, 1,
0.7739645, -0.4664876, 4.389974, 1, 1, 1, 1, 1,
0.7822391, -0.07293195, 1.785283, 1, 1, 1, 1, 1,
0.783179, 0.2099566, 0.7980337, 1, 1, 1, 1, 1,
0.7857449, 0.6525599, 1.606433, 1, 1, 1, 1, 1,
0.7863851, 0.1111041, 1.5754, 1, 1, 1, 1, 1,
0.7867165, -1.243945, 2.267197, 1, 1, 1, 1, 1,
0.7989148, -1.431101, 2.615759, 1, 1, 1, 1, 1,
0.798968, -2.550408, 0.390834, 1, 1, 1, 1, 1,
0.8000618, 0.428854, -1.147861, 1, 1, 1, 1, 1,
0.8159704, 0.06073651, -0.495806, 1, 1, 1, 1, 1,
0.82382, 0.4502258, -0.4569306, 1, 1, 1, 1, 1,
0.8284016, 0.1935375, 2.223966, 1, 1, 1, 1, 1,
0.8295862, -0.02358839, 0.1796052, 1, 1, 1, 1, 1,
0.8301546, -1.318543, 3.838164, 0, 0, 1, 1, 1,
0.8368761, 0.9044075, -0.0858757, 1, 0, 0, 1, 1,
0.8465181, 1.93179, -0.3579593, 1, 0, 0, 1, 1,
0.8500392, -0.0740741, 1.812294, 1, 0, 0, 1, 1,
0.8503371, -1.427476, 3.312245, 1, 0, 0, 1, 1,
0.8577896, -2.281657, 2.808986, 1, 0, 0, 1, 1,
0.8586859, -1.042423, 1.989647, 0, 0, 0, 1, 1,
0.8599471, 0.9281653, 0.151436, 0, 0, 0, 1, 1,
0.8642048, 0.6641214, -0.5761399, 0, 0, 0, 1, 1,
0.8661064, 2.003262, 1.362324, 0, 0, 0, 1, 1,
0.8674994, -0.5828087, 2.625211, 0, 0, 0, 1, 1,
0.8735571, 0.4664268, 2.087052, 0, 0, 0, 1, 1,
0.8748034, -0.2581742, 1.102613, 0, 0, 0, 1, 1,
0.8839403, -0.7198236, 2.615246, 1, 1, 1, 1, 1,
0.8860234, 2.270854, -0.6214218, 1, 1, 1, 1, 1,
0.8953789, 2.030452, 0.2630279, 1, 1, 1, 1, 1,
0.8971089, 0.4676571, -0.03269472, 1, 1, 1, 1, 1,
0.8985208, -0.07241919, 2.116135, 1, 1, 1, 1, 1,
0.9046142, 2.054298, 0.7377278, 1, 1, 1, 1, 1,
0.9097195, -0.5799943, 2.02575, 1, 1, 1, 1, 1,
0.9099422, -1.257097, 3.599516, 1, 1, 1, 1, 1,
0.9126599, 0.7092743, -1.391696, 1, 1, 1, 1, 1,
0.915826, -0.7089571, 2.502276, 1, 1, 1, 1, 1,
0.9174147, -0.5833115, 2.321942, 1, 1, 1, 1, 1,
0.9193139, 0.05406329, 2.076983, 1, 1, 1, 1, 1,
0.9255779, -1.600033, 2.710119, 1, 1, 1, 1, 1,
0.9321076, 0.282338, 0.1557233, 1, 1, 1, 1, 1,
0.9330818, 2.24878, 1.544855, 1, 1, 1, 1, 1,
0.9346888, -1.355151, 2.783314, 0, 0, 1, 1, 1,
0.9375094, -0.1144885, 3.171213, 1, 0, 0, 1, 1,
0.9512181, 0.3818161, 0.7514125, 1, 0, 0, 1, 1,
0.9519554, 0.2611307, 1.198012, 1, 0, 0, 1, 1,
0.9559824, 1.49158, 2.507971, 1, 0, 0, 1, 1,
0.9595969, -0.6614853, 3.059698, 1, 0, 0, 1, 1,
0.9607964, 0.3299642, 0.3518159, 0, 0, 0, 1, 1,
0.9642634, -0.6088508, 1.609494, 0, 0, 0, 1, 1,
0.9713882, 2.017946, 1.68302, 0, 0, 0, 1, 1,
0.9735932, 0.1525305, 1.933699, 0, 0, 0, 1, 1,
0.9765698, 0.6232966, 0.6265706, 0, 0, 0, 1, 1,
0.9803756, 0.2119029, 1.172963, 0, 0, 0, 1, 1,
0.9810703, -0.3184905, 1.698959, 0, 0, 0, 1, 1,
0.9842779, -0.8125694, 2.329507, 1, 1, 1, 1, 1,
0.989186, 0.1706014, 0.6010308, 1, 1, 1, 1, 1,
0.9903593, -0.9290911, 0.8271798, 1, 1, 1, 1, 1,
0.9912043, 0.7381892, 0.3955643, 1, 1, 1, 1, 1,
0.9913646, -0.2768641, 2.846821, 1, 1, 1, 1, 1,
0.9921447, -2.484294, 1.35737, 1, 1, 1, 1, 1,
0.9944825, -1.479264, 2.439752, 1, 1, 1, 1, 1,
1.002411, -0.1699138, 3.148383, 1, 1, 1, 1, 1,
1.004344, -0.1026612, 1.131147, 1, 1, 1, 1, 1,
1.005804, 1.577733, 1.902803, 1, 1, 1, 1, 1,
1.006513, 0.6896468, 0.26323, 1, 1, 1, 1, 1,
1.012274, 0.1184571, 1.047882, 1, 1, 1, 1, 1,
1.012602, 0.8365189, -0.2530743, 1, 1, 1, 1, 1,
1.01434, 1.128753, 1.221506, 1, 1, 1, 1, 1,
1.014753, 0.1885088, 1.633727, 1, 1, 1, 1, 1,
1.015232, -0.837869, 2.024503, 0, 0, 1, 1, 1,
1.018208, 1.424788, -0.8141665, 1, 0, 0, 1, 1,
1.020525, 1.203908, 0.5565571, 1, 0, 0, 1, 1,
1.023316, -0.362811, 2.545871, 1, 0, 0, 1, 1,
1.025764, -0.4438666, 1.324464, 1, 0, 0, 1, 1,
1.029646, -0.6311554, 1.666093, 1, 0, 0, 1, 1,
1.039853, -0.4915955, 0.3393076, 0, 0, 0, 1, 1,
1.042503, -0.3805753, 1.640137, 0, 0, 0, 1, 1,
1.045086, -0.1205717, 1.798834, 0, 0, 0, 1, 1,
1.045745, 0.4714567, 0.2445126, 0, 0, 0, 1, 1,
1.051896, 0.7243283, 2.982602, 0, 0, 0, 1, 1,
1.056788, -1.962396, 2.168287, 0, 0, 0, 1, 1,
1.057127, 1.396442, 1.194361, 0, 0, 0, 1, 1,
1.062778, 1.488302, -0.3708421, 1, 1, 1, 1, 1,
1.065399, 0.1085031, 3.703605, 1, 1, 1, 1, 1,
1.069189, 0.9465098, -0.3229935, 1, 1, 1, 1, 1,
1.07334, 1.941564, 0.4958508, 1, 1, 1, 1, 1,
1.081742, -0.9079955, 3.011618, 1, 1, 1, 1, 1,
1.087556, 0.2198559, 2.085978, 1, 1, 1, 1, 1,
1.092273, -0.178059, 0.8262124, 1, 1, 1, 1, 1,
1.104464, -0.4552647, 1.776982, 1, 1, 1, 1, 1,
1.10447, -1.216008, 2.50578, 1, 1, 1, 1, 1,
1.112515, 0.2737909, 2.528227, 1, 1, 1, 1, 1,
1.113161, 0.1361689, 2.556468, 1, 1, 1, 1, 1,
1.122222, -0.147285, 1.880296, 1, 1, 1, 1, 1,
1.122995, -0.8267027, 3.311076, 1, 1, 1, 1, 1,
1.123101, -1.634157, 1.621184, 1, 1, 1, 1, 1,
1.123258, 0.18963, 3.589878, 1, 1, 1, 1, 1,
1.126516, 0.6487585, 1.473682, 0, 0, 1, 1, 1,
1.141256, 0.3242637, -0.4240573, 1, 0, 0, 1, 1,
1.142256, -0.3626641, 2.329075, 1, 0, 0, 1, 1,
1.14392, -0.8870412, 0.8675985, 1, 0, 0, 1, 1,
1.149424, -0.05222179, 1.670731, 1, 0, 0, 1, 1,
1.152305, -0.1189888, 0.3574234, 1, 0, 0, 1, 1,
1.158918, -1.385942, 3.124534, 0, 0, 0, 1, 1,
1.161006, 0.4335002, 2.361863, 0, 0, 0, 1, 1,
1.16333, 0.3139211, 1.372334, 0, 0, 0, 1, 1,
1.16497, 0.2504468, 1.425464, 0, 0, 0, 1, 1,
1.17309, 0.9731462, 0.8852878, 0, 0, 0, 1, 1,
1.176088, 0.07681917, 0.6221273, 0, 0, 0, 1, 1,
1.176299, -2.093813, 1.776015, 0, 0, 0, 1, 1,
1.177479, 0.07486648, 3.788202, 1, 1, 1, 1, 1,
1.178034, -0.1898752, 2.152049, 1, 1, 1, 1, 1,
1.18539, 0.7301477, -0.02924043, 1, 1, 1, 1, 1,
1.191761, 0.633851, 2.516711, 1, 1, 1, 1, 1,
1.196432, -0.6679564, 1.366697, 1, 1, 1, 1, 1,
1.198702, 0.7968507, -1.710327, 1, 1, 1, 1, 1,
1.198833, -0.0968197, 2.084763, 1, 1, 1, 1, 1,
1.198987, 0.05304438, 0.9713564, 1, 1, 1, 1, 1,
1.207094, -1.084285, 2.145849, 1, 1, 1, 1, 1,
1.215542, -0.1078189, 2.311771, 1, 1, 1, 1, 1,
1.218631, 1.161953, 0.4038053, 1, 1, 1, 1, 1,
1.21909, -2.443626, 5.266571, 1, 1, 1, 1, 1,
1.224999, 0.4475511, 1.007238, 1, 1, 1, 1, 1,
1.230081, 0.4986064, 0.1886251, 1, 1, 1, 1, 1,
1.235079, 2.129731, 1.469289, 1, 1, 1, 1, 1,
1.245783, -0.2411806, 1.03918, 0, 0, 1, 1, 1,
1.260293, -0.8513291, 3.235587, 1, 0, 0, 1, 1,
1.286472, 0.9640096, -1.709307, 1, 0, 0, 1, 1,
1.287568, 0.6960575, 0.7531928, 1, 0, 0, 1, 1,
1.287824, 1.386262, 2.376866, 1, 0, 0, 1, 1,
1.299087, 0.1064263, 0.8001438, 1, 0, 0, 1, 1,
1.300749, -0.9948635, 0.02268462, 0, 0, 0, 1, 1,
1.304726, 1.025872, 1.668621, 0, 0, 0, 1, 1,
1.312393, 0.05153096, 1.057595, 0, 0, 0, 1, 1,
1.315822, -0.5325943, 3.772547, 0, 0, 0, 1, 1,
1.327468, 0.06808187, 1.203433, 0, 0, 0, 1, 1,
1.346792, 0.374093, 0.2460968, 0, 0, 0, 1, 1,
1.353887, -0.7466483, 3.084291, 0, 0, 0, 1, 1,
1.356447, 0.69103, 0.5062821, 1, 1, 1, 1, 1,
1.359079, 0.02238298, 2.609576, 1, 1, 1, 1, 1,
1.365655, 0.6985028, 3.368824, 1, 1, 1, 1, 1,
1.367113, -0.8994667, 1.67276, 1, 1, 1, 1, 1,
1.369938, -1.151938, 2.32239, 1, 1, 1, 1, 1,
1.386417, -0.5986565, 0.04271578, 1, 1, 1, 1, 1,
1.389563, 1.351426, 0.2810219, 1, 1, 1, 1, 1,
1.400885, -1.143431, 2.312443, 1, 1, 1, 1, 1,
1.416162, 1.432329, 1.128241, 1, 1, 1, 1, 1,
1.418916, 0.8258713, 1.26206, 1, 1, 1, 1, 1,
1.421148, -0.2127105, 1.992555, 1, 1, 1, 1, 1,
1.425605, 1.125855, 2.324035, 1, 1, 1, 1, 1,
1.438177, -2.379123, 2.458034, 1, 1, 1, 1, 1,
1.444533, -0.6034512, 1.323661, 1, 1, 1, 1, 1,
1.453271, -0.5606068, 1.051002, 1, 1, 1, 1, 1,
1.471738, 1.713596, 1.317154, 0, 0, 1, 1, 1,
1.476506, 0.3858306, 0.9850372, 1, 0, 0, 1, 1,
1.477222, 0.06060163, 0.7850209, 1, 0, 0, 1, 1,
1.47839, 1.65749, 0.1725743, 1, 0, 0, 1, 1,
1.485708, -0.2792577, 1.605419, 1, 0, 0, 1, 1,
1.500546, 0.3523544, -0.3482271, 1, 0, 0, 1, 1,
1.514401, -1.339079, 1.494986, 0, 0, 0, 1, 1,
1.517018, -0.004412731, 2.91175, 0, 0, 0, 1, 1,
1.520351, -1.194727, 1.744671, 0, 0, 0, 1, 1,
1.526935, 0.6054213, 0.8660941, 0, 0, 0, 1, 1,
1.532041, -0.02491251, 1.207656, 0, 0, 0, 1, 1,
1.533164, 0.2370267, 0.7233317, 0, 0, 0, 1, 1,
1.549606, -0.6320295, 0.9532359, 0, 0, 0, 1, 1,
1.550382, -1.96823, 1.526652, 1, 1, 1, 1, 1,
1.550493, -0.4973958, 0.7478765, 1, 1, 1, 1, 1,
1.552487, 0.9891762, 1.817199, 1, 1, 1, 1, 1,
1.560274, 0.8758956, 0.5991491, 1, 1, 1, 1, 1,
1.560847, -1.085483, 2.41994, 1, 1, 1, 1, 1,
1.565498, 1.233301, 0.9858882, 1, 1, 1, 1, 1,
1.566593, 0.3156424, 2.41851, 1, 1, 1, 1, 1,
1.579215, -1.562172, 2.165384, 1, 1, 1, 1, 1,
1.585811, -2.046706, 2.386366, 1, 1, 1, 1, 1,
1.594095, 1.297967, 1.791247, 1, 1, 1, 1, 1,
1.621748, -0.8870978, 1.408078, 1, 1, 1, 1, 1,
1.633403, -0.1374394, 0.4428331, 1, 1, 1, 1, 1,
1.647184, -0.2271086, 1.53288, 1, 1, 1, 1, 1,
1.663422, 0.6189368, 0.233313, 1, 1, 1, 1, 1,
1.670879, -0.05604194, 1.35916, 1, 1, 1, 1, 1,
1.697608, -0.9429795, 2.785726, 0, 0, 1, 1, 1,
1.727286, -0.5818917, 2.64243, 1, 0, 0, 1, 1,
1.73474, -0.6232188, 0.8286862, 1, 0, 0, 1, 1,
1.735605, -1.035455, -0.4280195, 1, 0, 0, 1, 1,
1.754129, -0.17445, 0.6509588, 1, 0, 0, 1, 1,
1.772192, -2.474455, 1.198298, 1, 0, 0, 1, 1,
1.802872, -0.4108016, 2.030028, 0, 0, 0, 1, 1,
1.808065, -0.8166656, 1.540674, 0, 0, 0, 1, 1,
1.810936, -0.6287546, 2.088023, 0, 0, 0, 1, 1,
1.815918, 0.7508874, 0.1434027, 0, 0, 0, 1, 1,
1.84944, 0.05016785, 1.619538, 0, 0, 0, 1, 1,
1.855094, -0.976692, 1.498178, 0, 0, 0, 1, 1,
1.871139, 1.714196, 1.526226, 0, 0, 0, 1, 1,
1.887212, 1.494851, 1.750906, 1, 1, 1, 1, 1,
1.90077, 1.123355, 1.393578, 1, 1, 1, 1, 1,
1.907223, 0.5387456, 1.697739, 1, 1, 1, 1, 1,
1.912974, -0.6771351, 1.16817, 1, 1, 1, 1, 1,
1.916614, -0.01172925, 0.7344174, 1, 1, 1, 1, 1,
1.943792, -0.3776913, 2.28866, 1, 1, 1, 1, 1,
1.955689, -0.7110728, 2.501093, 1, 1, 1, 1, 1,
1.982237, 0.7037436, 2.679787, 1, 1, 1, 1, 1,
1.996212, -1.158821, 0.615443, 1, 1, 1, 1, 1,
2.002729, -0.7973458, 2.063296, 1, 1, 1, 1, 1,
2.029106, 1.177297, 1.361455, 1, 1, 1, 1, 1,
2.049196, -1.064874, 3.485147, 1, 1, 1, 1, 1,
2.054066, -0.007114441, 0.5292957, 1, 1, 1, 1, 1,
2.05729, 0.6013815, 1.576727, 1, 1, 1, 1, 1,
2.095555, -0.5501857, 2.169586, 1, 1, 1, 1, 1,
2.115341, 0.2680606, 2.100419, 0, 0, 1, 1, 1,
2.126333, 0.04107943, 1.971335, 1, 0, 0, 1, 1,
2.165612, 1.102594, -0.3904023, 1, 0, 0, 1, 1,
2.185211, 0.03313832, 2.814252, 1, 0, 0, 1, 1,
2.185717, 0.1227839, 2.011432, 1, 0, 0, 1, 1,
2.290213, 0.05847434, 0.7088931, 1, 0, 0, 1, 1,
2.291617, -0.003452798, 1.818847, 0, 0, 0, 1, 1,
2.30863, 1.048491, 1.067057, 0, 0, 0, 1, 1,
2.366908, 0.6706789, 2.356088, 0, 0, 0, 1, 1,
2.372717, -1.678792, 1.985267, 0, 0, 0, 1, 1,
2.501961, -1.145262, 0.9201073, 0, 0, 0, 1, 1,
2.742154, -0.8097148, 0.1868146, 0, 0, 0, 1, 1,
2.80092, -0.6065091, 1.176184, 0, 0, 0, 1, 1,
2.848109, 1.720313, 1.966715, 1, 1, 1, 1, 1,
2.869037, 2.082698, -0.07089663, 1, 1, 1, 1, 1,
2.940769, 0.5041017, 2.040054, 1, 1, 1, 1, 1,
3.121759, 1.352552, 1.751169, 1, 1, 1, 1, 1,
3.156819, 0.01719639, 2.156251, 1, 1, 1, 1, 1,
3.749521, 1.675238, 1.626277, 1, 1, 1, 1, 1,
4.08148, 0.3150406, 0.9231185, 1, 1, 1, 1, 1
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
var radius = 9.829472;
var distance = 34.5256;
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
mvMatrix.translate( -0.5071514, 0.3449558, 0.2533605 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.5256);
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
