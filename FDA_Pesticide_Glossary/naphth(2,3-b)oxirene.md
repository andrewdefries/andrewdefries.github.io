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
-3.015559, 0.232232, -2.165194, 1, 0, 0, 1,
-2.969481, -0.8936826, -3.825741, 1, 0.007843138, 0, 1,
-2.938352, 0.1515092, -0.5795715, 1, 0.01176471, 0, 1,
-2.699786, 0.9966318, -0.8523786, 1, 0.01960784, 0, 1,
-2.686332, 1.200595, -2.517045, 1, 0.02352941, 0, 1,
-2.64451, -0.5913953, -0.8175712, 1, 0.03137255, 0, 1,
-2.490415, 0.628167, -1.433415, 1, 0.03529412, 0, 1,
-2.478277, 0.3652456, 0.6226224, 1, 0.04313726, 0, 1,
-2.472275, 0.1909289, -1.644294, 1, 0.04705882, 0, 1,
-2.461929, -1.175573, -1.771667, 1, 0.05490196, 0, 1,
-2.455509, 1.607987, -1.05977, 1, 0.05882353, 0, 1,
-2.445313, 0.9369597, -1.432144, 1, 0.06666667, 0, 1,
-2.282469, -1.955198, -1.623613, 1, 0.07058824, 0, 1,
-2.269296, -0.1916262, -1.155563, 1, 0.07843138, 0, 1,
-2.255445, 0.74704, -1.416101, 1, 0.08235294, 0, 1,
-2.249831, 1.058071, -0.2216899, 1, 0.09019608, 0, 1,
-2.231826, 0.4049152, -3.075179, 1, 0.09411765, 0, 1,
-2.226068, -0.0995504, -1.668352, 1, 0.1019608, 0, 1,
-2.204197, 1.072172, -0.3636748, 1, 0.1098039, 0, 1,
-2.200166, -1.051517, -2.305672, 1, 0.1137255, 0, 1,
-2.14218, 1.311514, -0.6164957, 1, 0.1215686, 0, 1,
-2.004756, 0.3260571, -0.7235837, 1, 0.1254902, 0, 1,
-2.001308, 1.136302, -1.677554, 1, 0.1333333, 0, 1,
-1.995023, -0.3347458, -2.058979, 1, 0.1372549, 0, 1,
-1.992421, 0.1349849, -1.682373, 1, 0.145098, 0, 1,
-1.980669, 0.3062457, -1.347777, 1, 0.1490196, 0, 1,
-1.957752, -0.6190003, -3.003834, 1, 0.1568628, 0, 1,
-1.949992, -1.329692, -4.393845, 1, 0.1607843, 0, 1,
-1.936543, 1.409349, 0.7759673, 1, 0.1686275, 0, 1,
-1.928542, -0.9535305, -2.10939, 1, 0.172549, 0, 1,
-1.906567, 2.278859, -1.059432, 1, 0.1803922, 0, 1,
-1.866969, -0.5178919, -1.476497, 1, 0.1843137, 0, 1,
-1.860606, 0.5277569, -2.888851, 1, 0.1921569, 0, 1,
-1.856427, 0.3471713, 0.07854817, 1, 0.1960784, 0, 1,
-1.843861, 0.01871199, -2.208158, 1, 0.2039216, 0, 1,
-1.833628, 0.3604912, 0.3289003, 1, 0.2117647, 0, 1,
-1.820248, 1.919216, 0.5660531, 1, 0.2156863, 0, 1,
-1.812644, 0.3458194, -0.5705915, 1, 0.2235294, 0, 1,
-1.793548, -0.727372, -2.021133, 1, 0.227451, 0, 1,
-1.785664, -0.768532, -1.674487, 1, 0.2352941, 0, 1,
-1.769738, -0.9751821, -2.304567, 1, 0.2392157, 0, 1,
-1.765707, 0.1556028, -0.1572482, 1, 0.2470588, 0, 1,
-1.760156, 0.0927602, -3.702107, 1, 0.2509804, 0, 1,
-1.748338, 1.209352, -2.289326, 1, 0.2588235, 0, 1,
-1.669288, 0.5072234, -0.6451483, 1, 0.2627451, 0, 1,
-1.657056, 1.594184, -0.3695186, 1, 0.2705882, 0, 1,
-1.638583, 0.3985825, -2.067238, 1, 0.2745098, 0, 1,
-1.627306, 0.3665298, -2.537517, 1, 0.282353, 0, 1,
-1.601883, -0.01636981, -0.9080896, 1, 0.2862745, 0, 1,
-1.574736, 1.535564, 1.667962, 1, 0.2941177, 0, 1,
-1.57058, 2.156348, 0.299239, 1, 0.3019608, 0, 1,
-1.569785, -0.7961218, -0.1643568, 1, 0.3058824, 0, 1,
-1.542804, -2.501, -2.738128, 1, 0.3137255, 0, 1,
-1.525152, 0.5400561, -2.49269, 1, 0.3176471, 0, 1,
-1.506134, -0.666864, -1.372903, 1, 0.3254902, 0, 1,
-1.485248, -1.662688, -3.859659, 1, 0.3294118, 0, 1,
-1.482033, -0.4999344, -2.662597, 1, 0.3372549, 0, 1,
-1.479744, 0.9869092, -0.9026416, 1, 0.3411765, 0, 1,
-1.470678, 0.2161484, -1.612706, 1, 0.3490196, 0, 1,
-1.469403, -0.3736592, -0.3296008, 1, 0.3529412, 0, 1,
-1.468281, 0.81904, -0.5435231, 1, 0.3607843, 0, 1,
-1.460678, 0.7215603, -0.7208961, 1, 0.3647059, 0, 1,
-1.447024, -1.813287, -1.961943, 1, 0.372549, 0, 1,
-1.446034, -0.7054851, -3.7577, 1, 0.3764706, 0, 1,
-1.444065, 0.5204691, -0.8792905, 1, 0.3843137, 0, 1,
-1.441863, -0.1182672, -0.5616847, 1, 0.3882353, 0, 1,
-1.419428, 0.6663944, -0.03377577, 1, 0.3960784, 0, 1,
-1.413288, -1.325081, -4.568353, 1, 0.4039216, 0, 1,
-1.396153, 2.212386, 0.0479346, 1, 0.4078431, 0, 1,
-1.394907, -0.11808, -1.164713, 1, 0.4156863, 0, 1,
-1.393362, -0.1620182, -1.265859, 1, 0.4196078, 0, 1,
-1.390439, 1.422557, -1.522224, 1, 0.427451, 0, 1,
-1.380428, -1.588079, -2.220493, 1, 0.4313726, 0, 1,
-1.373205, -0.6748, 0.813319, 1, 0.4392157, 0, 1,
-1.370852, -1.433956, -2.632496, 1, 0.4431373, 0, 1,
-1.367202, -0.5360087, -1.3369, 1, 0.4509804, 0, 1,
-1.366498, -0.06069677, -1.162069, 1, 0.454902, 0, 1,
-1.348797, 0.4575437, -1.868642, 1, 0.4627451, 0, 1,
-1.346303, 0.9583715, -0.2234717, 1, 0.4666667, 0, 1,
-1.339065, 0.0930653, -1.648994, 1, 0.4745098, 0, 1,
-1.337333, -0.259581, -1.997084, 1, 0.4784314, 0, 1,
-1.333175, -1.508587, -1.818278, 1, 0.4862745, 0, 1,
-1.323178, -1.655687, -1.354249, 1, 0.4901961, 0, 1,
-1.318112, 0.7015379, -1.399654, 1, 0.4980392, 0, 1,
-1.304592, -0.4946153, -4.1421, 1, 0.5058824, 0, 1,
-1.299177, 0.7949645, -0.06174694, 1, 0.509804, 0, 1,
-1.2985, 0.8577371, -0.5894682, 1, 0.5176471, 0, 1,
-1.294392, -0.289846, -1.313761, 1, 0.5215687, 0, 1,
-1.294103, -0.2395552, -2.082305, 1, 0.5294118, 0, 1,
-1.293739, -0.4683676, -1.536053, 1, 0.5333334, 0, 1,
-1.280361, -1.101799, -0.3491413, 1, 0.5411765, 0, 1,
-1.279306, -1.486648, -3.705677, 1, 0.5450981, 0, 1,
-1.277863, 0.3734407, -1.820244, 1, 0.5529412, 0, 1,
-1.27357, -0.5763713, -1.994422, 1, 0.5568628, 0, 1,
-1.273167, 0.6190557, -1.871935, 1, 0.5647059, 0, 1,
-1.268611, 0.4321766, -1.407152, 1, 0.5686275, 0, 1,
-1.252251, 0.03601078, -1.904177, 1, 0.5764706, 0, 1,
-1.24973, 0.2246047, -2.144771, 1, 0.5803922, 0, 1,
-1.234746, -0.3295318, -1.865604, 1, 0.5882353, 0, 1,
-1.226704, -0.9969192, -1.906569, 1, 0.5921569, 0, 1,
-1.22433, 0.5452681, 0.0005943165, 1, 0.6, 0, 1,
-1.223773, -0.01426935, -1.842517, 1, 0.6078432, 0, 1,
-1.213333, -0.1524182, -1.611309, 1, 0.6117647, 0, 1,
-1.211119, -0.337323, -1.555067, 1, 0.6196079, 0, 1,
-1.207051, -0.459634, -2.050073, 1, 0.6235294, 0, 1,
-1.190499, 1.082979, -1.672372, 1, 0.6313726, 0, 1,
-1.186041, -0.6616083, -3.272219, 1, 0.6352941, 0, 1,
-1.179194, -0.9131221, -3.336475, 1, 0.6431373, 0, 1,
-1.166388, -1.487272, -2.847132, 1, 0.6470588, 0, 1,
-1.160702, -1.325176, -2.711056, 1, 0.654902, 0, 1,
-1.152107, -0.3210103, -1.899737, 1, 0.6588235, 0, 1,
-1.150167, 0.4878799, -2.136168, 1, 0.6666667, 0, 1,
-1.139074, -0.5539185, -1.991134, 1, 0.6705883, 0, 1,
-1.12413, -0.1727817, -2.900266, 1, 0.6784314, 0, 1,
-1.122939, 0.521405, -0.7064976, 1, 0.682353, 0, 1,
-1.097448, -1.598278, -3.299573, 1, 0.6901961, 0, 1,
-1.097161, -0.6875941, -0.1883571, 1, 0.6941177, 0, 1,
-1.09564, -1.360311, -5.928527, 1, 0.7019608, 0, 1,
-1.093583, 0.2829611, -1.703638, 1, 0.7098039, 0, 1,
-1.090395, 1.011779, -0.2436836, 1, 0.7137255, 0, 1,
-1.089672, -0.1821394, -2.088804, 1, 0.7215686, 0, 1,
-1.084597, -0.3899109, -1.924415, 1, 0.7254902, 0, 1,
-1.081887, 0.1730324, -2.268399, 1, 0.7333333, 0, 1,
-1.076119, -0.5624265, -1.997846, 1, 0.7372549, 0, 1,
-1.07429, -0.6470839, -3.216389, 1, 0.7450981, 0, 1,
-1.069492, 1.620938, -0.7234299, 1, 0.7490196, 0, 1,
-1.06525, -0.3604563, -2.67, 1, 0.7568628, 0, 1,
-1.061176, -0.4347242, -4.302176, 1, 0.7607843, 0, 1,
-1.050698, -0.5270091, -1.632841, 1, 0.7686275, 0, 1,
-1.038169, -0.6704302, -0.4170343, 1, 0.772549, 0, 1,
-1.033361, 2.530913, -1.208461, 1, 0.7803922, 0, 1,
-1.031744, 1.314696, -1.379235, 1, 0.7843137, 0, 1,
-1.025878, 0.3491004, -0.1583306, 1, 0.7921569, 0, 1,
-1.024969, 1.380304, -1.165271, 1, 0.7960784, 0, 1,
-1.015609, 0.9747868, 0.2141231, 1, 0.8039216, 0, 1,
-1.013435, -0.5967999, -0.5851882, 1, 0.8117647, 0, 1,
-1.01054, -0.7404932, -3.027373, 1, 0.8156863, 0, 1,
-1.007629, -0.226163, -2.283683, 1, 0.8235294, 0, 1,
-1.005908, -0.5432348, -2.005986, 1, 0.827451, 0, 1,
-1.005016, -1.717725, -2.986944, 1, 0.8352941, 0, 1,
-0.9996238, -0.5399133, -1.843418, 1, 0.8392157, 0, 1,
-0.9962872, 1.23207, 0.1708643, 1, 0.8470588, 0, 1,
-0.9942838, -0.5377429, -1.224181, 1, 0.8509804, 0, 1,
-0.9921532, 1.065416, -1.475503, 1, 0.8588235, 0, 1,
-0.9915781, 0.9150079, -0.1866646, 1, 0.8627451, 0, 1,
-0.9871716, 0.8250504, -0.9584047, 1, 0.8705882, 0, 1,
-0.9776585, -1.097968, -1.108225, 1, 0.8745098, 0, 1,
-0.9705362, 0.1935305, -0.7911624, 1, 0.8823529, 0, 1,
-0.9681163, 0.06246613, 0.04224028, 1, 0.8862745, 0, 1,
-0.9679659, 1.824379, -1.219884, 1, 0.8941177, 0, 1,
-0.9668691, 1.70836, -1.56396, 1, 0.8980392, 0, 1,
-0.9621838, 0.7557553, -1.988935, 1, 0.9058824, 0, 1,
-0.9588404, 0.1612569, -1.3803, 1, 0.9137255, 0, 1,
-0.9564296, -2.288909, -2.30451, 1, 0.9176471, 0, 1,
-0.9463803, -1.000656, -2.737081, 1, 0.9254902, 0, 1,
-0.9462308, -0.9455422, -3.181871, 1, 0.9294118, 0, 1,
-0.9452988, -0.2461875, -2.503037, 1, 0.9372549, 0, 1,
-0.945038, 0.04467729, -3.495861, 1, 0.9411765, 0, 1,
-0.9447613, 0.3640257, -0.5233507, 1, 0.9490196, 0, 1,
-0.9386981, -0.06114368, -1.120224, 1, 0.9529412, 0, 1,
-0.936866, 0.478031, 0.2243919, 1, 0.9607843, 0, 1,
-0.933896, 0.9704625, -2.597695, 1, 0.9647059, 0, 1,
-0.9326676, -0.6335509, -3.050628, 1, 0.972549, 0, 1,
-0.923642, 0.897158, -0.5924046, 1, 0.9764706, 0, 1,
-0.9227325, 0.3259197, -1.338216, 1, 0.9843137, 0, 1,
-0.9211891, -1.156192, -2.336785, 1, 0.9882353, 0, 1,
-0.9169698, -0.6535742, -1.946596, 1, 0.9960784, 0, 1,
-0.9158401, 0.6892599, 0.1146827, 0.9960784, 1, 0, 1,
-0.9131595, -1.600691, -2.594625, 0.9921569, 1, 0, 1,
-0.9123083, -0.3114601, -1.212397, 0.9843137, 1, 0, 1,
-0.9082764, 0.8553972, -1.519312, 0.9803922, 1, 0, 1,
-0.9082011, 2.531332, 0.1173762, 0.972549, 1, 0, 1,
-0.9020142, 0.6074513, -3.098177, 0.9686275, 1, 0, 1,
-0.8929207, 0.2825821, -2.814563, 0.9607843, 1, 0, 1,
-0.887995, 0.523413, -1.242413, 0.9568627, 1, 0, 1,
-0.8781119, 0.79896, 0.08890837, 0.9490196, 1, 0, 1,
-0.8709266, -0.6575736, -2.735713, 0.945098, 1, 0, 1,
-0.8603075, 0.46545, -2.726896, 0.9372549, 1, 0, 1,
-0.8530177, 0.5801077, -1.296957, 0.9333333, 1, 0, 1,
-0.8496391, -0.4349, -3.228365, 0.9254902, 1, 0, 1,
-0.847823, -1.578357, -1.606262, 0.9215686, 1, 0, 1,
-0.8410932, -0.9432124, -2.067048, 0.9137255, 1, 0, 1,
-0.8406056, -1.415877, -0.6798118, 0.9098039, 1, 0, 1,
-0.8378909, 0.2718462, -0.9698876, 0.9019608, 1, 0, 1,
-0.8376557, 0.4278871, -1.470415, 0.8941177, 1, 0, 1,
-0.8265628, -0.2681732, -1.91856, 0.8901961, 1, 0, 1,
-0.8217443, 0.5802074, -1.854544, 0.8823529, 1, 0, 1,
-0.8150327, 0.7018497, 0.102795, 0.8784314, 1, 0, 1,
-0.8135769, 1.35953, -1.54416, 0.8705882, 1, 0, 1,
-0.8103103, -0.09639555, -1.067932, 0.8666667, 1, 0, 1,
-0.8092054, 0.08224939, -1.031811, 0.8588235, 1, 0, 1,
-0.8070853, 0.2779492, -2.790947, 0.854902, 1, 0, 1,
-0.8009149, 2.080382, -1.08243, 0.8470588, 1, 0, 1,
-0.8006956, -0.6389573, -0.1475229, 0.8431373, 1, 0, 1,
-0.7941003, 0.5915321, -0.9823737, 0.8352941, 1, 0, 1,
-0.7931612, -0.831769, -1.678403, 0.8313726, 1, 0, 1,
-0.7928141, 0.6474242, -5.434095, 0.8235294, 1, 0, 1,
-0.7898968, 0.883773, -0.4929825, 0.8196079, 1, 0, 1,
-0.787104, -1.745168, -2.679529, 0.8117647, 1, 0, 1,
-0.7862815, 1.548354, 1.108342, 0.8078431, 1, 0, 1,
-0.7820925, 0.1605699, -3.063394, 0.8, 1, 0, 1,
-0.7730253, 0.2760116, -0.9469233, 0.7921569, 1, 0, 1,
-0.77268, 2.933797, -0.9233695, 0.7882353, 1, 0, 1,
-0.7713589, 0.1394126, -1.443096, 0.7803922, 1, 0, 1,
-0.7640267, -0.3206393, -3.462413, 0.7764706, 1, 0, 1,
-0.7615173, 0.8776227, 0.7951691, 0.7686275, 1, 0, 1,
-0.7572722, 0.8435081, -0.4315262, 0.7647059, 1, 0, 1,
-0.7493861, 1.425608, 0.2793852, 0.7568628, 1, 0, 1,
-0.7484656, -0.5719446, -2.815669, 0.7529412, 1, 0, 1,
-0.7473835, 0.9638179, 0.003673798, 0.7450981, 1, 0, 1,
-0.7457581, 0.3657782, 1.145251, 0.7411765, 1, 0, 1,
-0.7387484, -0.3542969, -1.448097, 0.7333333, 1, 0, 1,
-0.7369222, -1.092239, -2.413893, 0.7294118, 1, 0, 1,
-0.7363867, -2.586384, -3.030945, 0.7215686, 1, 0, 1,
-0.7351798, -2.18202, -2.075686, 0.7176471, 1, 0, 1,
-0.7327644, 0.03902102, -2.348404, 0.7098039, 1, 0, 1,
-0.7273953, -0.7723045, -3.919238, 0.7058824, 1, 0, 1,
-0.7205484, -0.1187347, -0.2296166, 0.6980392, 1, 0, 1,
-0.7138777, -0.7755014, -1.935122, 0.6901961, 1, 0, 1,
-0.7108582, -0.6390525, -2.666562, 0.6862745, 1, 0, 1,
-0.7100718, -1.108691, -3.524727, 0.6784314, 1, 0, 1,
-0.7078835, -0.4358493, -0.3164525, 0.6745098, 1, 0, 1,
-0.7027985, 0.4085893, -2.07516, 0.6666667, 1, 0, 1,
-0.6975352, 0.05062225, -1.143485, 0.6627451, 1, 0, 1,
-0.6950976, -0.7161999, -1.304988, 0.654902, 1, 0, 1,
-0.6950032, -1.022845, -3.102726, 0.6509804, 1, 0, 1,
-0.693477, 0.2059032, -0.9838088, 0.6431373, 1, 0, 1,
-0.6888283, -0.02971135, 0.00280481, 0.6392157, 1, 0, 1,
-0.685866, -0.8287205, -3.023964, 0.6313726, 1, 0, 1,
-0.6857215, 0.9441299, -1.216441, 0.627451, 1, 0, 1,
-0.6852504, -0.04148032, -1.543993, 0.6196079, 1, 0, 1,
-0.6805589, 0.4778723, -0.02527376, 0.6156863, 1, 0, 1,
-0.6787309, 0.8879245, -0.6638828, 0.6078432, 1, 0, 1,
-0.6752098, -0.744781, -1.643106, 0.6039216, 1, 0, 1,
-0.6720768, 0.8089885, -0.5178455, 0.5960785, 1, 0, 1,
-0.6701244, 2.185314, -1.586443, 0.5882353, 1, 0, 1,
-0.6587362, -1.24081, -1.84143, 0.5843138, 1, 0, 1,
-0.6511655, -1.811962, -5.098368, 0.5764706, 1, 0, 1,
-0.6510864, 1.975281, 0.05941697, 0.572549, 1, 0, 1,
-0.6506991, -0.6094524, -2.901549, 0.5647059, 1, 0, 1,
-0.6462133, -1.348958, -2.898274, 0.5607843, 1, 0, 1,
-0.6410426, 1.454707, -0.5224149, 0.5529412, 1, 0, 1,
-0.6408936, 0.9551707, -0.3475186, 0.5490196, 1, 0, 1,
-0.6376617, 0.8868399, 0.8909645, 0.5411765, 1, 0, 1,
-0.6373925, -1.007763, -2.240615, 0.5372549, 1, 0, 1,
-0.634173, 1.172802, -0.09786116, 0.5294118, 1, 0, 1,
-0.6337962, 0.1727851, -1.374623, 0.5254902, 1, 0, 1,
-0.6268114, 1.094665, 0.6342478, 0.5176471, 1, 0, 1,
-0.6262885, 0.4082602, -1.128433, 0.5137255, 1, 0, 1,
-0.6249978, 0.1005765, -4.152273, 0.5058824, 1, 0, 1,
-0.6248412, -0.8650066, -3.154372, 0.5019608, 1, 0, 1,
-0.6245159, 0.6536651, -1.173973, 0.4941176, 1, 0, 1,
-0.6239881, -0.1748822, -2.25248, 0.4862745, 1, 0, 1,
-0.6236668, 0.3802923, -0.9338246, 0.4823529, 1, 0, 1,
-0.6183861, -0.002443512, -1.262486, 0.4745098, 1, 0, 1,
-0.6158441, -0.1932004, -0.3949484, 0.4705882, 1, 0, 1,
-0.6134881, 0.6820135, -1.259559, 0.4627451, 1, 0, 1,
-0.6131209, -0.7892287, -1.482149, 0.4588235, 1, 0, 1,
-0.6127732, 1.167178, 0.3439844, 0.4509804, 1, 0, 1,
-0.6036518, -0.9666759, -2.68588, 0.4470588, 1, 0, 1,
-0.6020623, 0.5420494, -0.9080011, 0.4392157, 1, 0, 1,
-0.5969379, 0.1339295, -1.95697, 0.4352941, 1, 0, 1,
-0.5938534, -1.302685, -2.788521, 0.427451, 1, 0, 1,
-0.5916855, -0.1841502, -2.518878, 0.4235294, 1, 0, 1,
-0.5873597, -0.2378439, -0.5995716, 0.4156863, 1, 0, 1,
-0.5870071, -1.440295, -4.544565, 0.4117647, 1, 0, 1,
-0.5850713, -0.4836417, -2.479645, 0.4039216, 1, 0, 1,
-0.5829796, -1.050616, -1.761243, 0.3960784, 1, 0, 1,
-0.5828868, 0.9934115, -0.8553976, 0.3921569, 1, 0, 1,
-0.5816007, 0.285507, -0.9878733, 0.3843137, 1, 0, 1,
-0.5811598, -1.401615, -2.730948, 0.3803922, 1, 0, 1,
-0.5797531, 1.675081, -0.05446677, 0.372549, 1, 0, 1,
-0.5795867, -0.1405984, -2.544635, 0.3686275, 1, 0, 1,
-0.5774688, 1.734574, -1.450099, 0.3607843, 1, 0, 1,
-0.5748391, 1.20913, 0.4047797, 0.3568628, 1, 0, 1,
-0.5741122, -0.6030421, -1.035525, 0.3490196, 1, 0, 1,
-0.5727596, 0.9416146, 0.2463945, 0.345098, 1, 0, 1,
-0.5701333, -0.6121422, -2.020834, 0.3372549, 1, 0, 1,
-0.5681822, 0.713591, -0.6952522, 0.3333333, 1, 0, 1,
-0.5627777, -1.892661, -2.017032, 0.3254902, 1, 0, 1,
-0.5622068, -1.461056, -4.941276, 0.3215686, 1, 0, 1,
-0.5611989, -1.825549, -1.987479, 0.3137255, 1, 0, 1,
-0.5591136, 0.6838992, -1.130504, 0.3098039, 1, 0, 1,
-0.5511761, 1.002594, -0.6806158, 0.3019608, 1, 0, 1,
-0.5422047, 1.71507, -0.363728, 0.2941177, 1, 0, 1,
-0.5391213, -0.3126975, -1.03551, 0.2901961, 1, 0, 1,
-0.5342698, -2.500703, -2.495591, 0.282353, 1, 0, 1,
-0.5296994, -0.2159207, -3.256141, 0.2784314, 1, 0, 1,
-0.5230361, -0.4327304, -2.103549, 0.2705882, 1, 0, 1,
-0.5208884, 0.3492121, -0.6684869, 0.2666667, 1, 0, 1,
-0.5202336, 0.7675912, -1.213571, 0.2588235, 1, 0, 1,
-0.5191472, -0.8546472, -3.492487, 0.254902, 1, 0, 1,
-0.5129166, 0.4332847, -0.3466713, 0.2470588, 1, 0, 1,
-0.5079758, 0.051951, -1.898873, 0.2431373, 1, 0, 1,
-0.5033982, -1.146318, -2.216828, 0.2352941, 1, 0, 1,
-0.4993134, -0.5709225, -1.531538, 0.2313726, 1, 0, 1,
-0.4991407, 2.881746, -1.120919, 0.2235294, 1, 0, 1,
-0.4970151, -1.045449, -2.186286, 0.2196078, 1, 0, 1,
-0.491757, 0.3651744, -1.171046, 0.2117647, 1, 0, 1,
-0.4858177, -2.148511, -3.311428, 0.2078431, 1, 0, 1,
-0.4853819, -1.62222, -2.191974, 0.2, 1, 0, 1,
-0.4710131, -0.2170073, -2.257437, 0.1921569, 1, 0, 1,
-0.4681149, 0.2756189, -1.177442, 0.1882353, 1, 0, 1,
-0.467614, -1.473433, -2.282238, 0.1803922, 1, 0, 1,
-0.4657597, -1.845135, -1.912486, 0.1764706, 1, 0, 1,
-0.4655228, -0.3591215, -2.064838, 0.1686275, 1, 0, 1,
-0.4649999, -0.8178537, -3.379621, 0.1647059, 1, 0, 1,
-0.4644852, -0.9685929, -2.733578, 0.1568628, 1, 0, 1,
-0.4623143, 0.1508697, -3.835949, 0.1529412, 1, 0, 1,
-0.4591661, -0.1398031, -1.89032, 0.145098, 1, 0, 1,
-0.455947, -0.8598864, -0.6261926, 0.1411765, 1, 0, 1,
-0.4558054, -1.299329, -3.457677, 0.1333333, 1, 0, 1,
-0.4501404, -0.5509589, -0.646032, 0.1294118, 1, 0, 1,
-0.4463093, -1.271849, -2.405638, 0.1215686, 1, 0, 1,
-0.4450043, -1.407061, -2.938196, 0.1176471, 1, 0, 1,
-0.443451, -0.2762889, -2.56772, 0.1098039, 1, 0, 1,
-0.4408875, -0.3174501, -1.996325, 0.1058824, 1, 0, 1,
-0.4360372, -0.6837166, -1.407264, 0.09803922, 1, 0, 1,
-0.4348563, -0.01824019, -1.638567, 0.09019608, 1, 0, 1,
-0.4335639, -0.9072427, -1.344523, 0.08627451, 1, 0, 1,
-0.4280873, 0.2696829, -1.682573, 0.07843138, 1, 0, 1,
-0.4230311, 0.5769284, -1.435886, 0.07450981, 1, 0, 1,
-0.4175846, -0.8371043, -3.91335, 0.06666667, 1, 0, 1,
-0.4160559, -0.4637825, -1.839181, 0.0627451, 1, 0, 1,
-0.4077988, 0.3462794, 0.1845596, 0.05490196, 1, 0, 1,
-0.4051404, -0.1484525, -2.285813, 0.05098039, 1, 0, 1,
-0.4039391, -0.5885722, -4.225741, 0.04313726, 1, 0, 1,
-0.4034864, -1.419097, -2.208156, 0.03921569, 1, 0, 1,
-0.400648, 0.6216097, -1.313779, 0.03137255, 1, 0, 1,
-0.3977284, 0.04878578, -0.02294465, 0.02745098, 1, 0, 1,
-0.3953487, 1.028526, -0.7431043, 0.01960784, 1, 0, 1,
-0.3918897, -1.843005, -2.289935, 0.01568628, 1, 0, 1,
-0.3914887, 0.5551378, -0.1854096, 0.007843138, 1, 0, 1,
-0.3905885, -0.05434306, -2.42657, 0.003921569, 1, 0, 1,
-0.3898443, 1.564946, 1.854869, 0, 1, 0.003921569, 1,
-0.3860919, -2.410761, -3.665167, 0, 1, 0.01176471, 1,
-0.3825517, -0.1639746, -1.795834, 0, 1, 0.01568628, 1,
-0.3819678, -0.2381188, -2.25546, 0, 1, 0.02352941, 1,
-0.370041, 0.7041283, 2.394858, 0, 1, 0.02745098, 1,
-0.3671105, 0.6689739, -1.807039, 0, 1, 0.03529412, 1,
-0.3659563, 0.59473, -2.194775, 0, 1, 0.03921569, 1,
-0.3647867, -0.3869474, -3.972988, 0, 1, 0.04705882, 1,
-0.3635824, 0.1692534, -0.9535641, 0, 1, 0.05098039, 1,
-0.3618278, 1.179082, 1.052124, 0, 1, 0.05882353, 1,
-0.3613207, 0.3042621, 1.448499, 0, 1, 0.0627451, 1,
-0.3599594, -1.437573, -3.358987, 0, 1, 0.07058824, 1,
-0.3590406, 1.548188, -0.5616983, 0, 1, 0.07450981, 1,
-0.3485619, 0.800791, 1.151815, 0, 1, 0.08235294, 1,
-0.3463646, -0.4774134, -1.280113, 0, 1, 0.08627451, 1,
-0.3447473, -0.262481, -2.900951, 0, 1, 0.09411765, 1,
-0.3447407, 0.8954087, -0.8152554, 0, 1, 0.1019608, 1,
-0.3440076, 0.002437739, -2.237327, 0, 1, 0.1058824, 1,
-0.3389888, 1.251094, 0.5919378, 0, 1, 0.1137255, 1,
-0.336356, 0.1959817, -2.932937, 0, 1, 0.1176471, 1,
-0.3343428, -0.5920893, -2.94893, 0, 1, 0.1254902, 1,
-0.3314626, -0.784739, -3.122334, 0, 1, 0.1294118, 1,
-0.331136, 1.553558, -1.294582, 0, 1, 0.1372549, 1,
-0.3309414, 0.53194, -0.7095441, 0, 1, 0.1411765, 1,
-0.3263071, 1.093996, 0.9849126, 0, 1, 0.1490196, 1,
-0.3256009, -0.7261602, -3.91278, 0, 1, 0.1529412, 1,
-0.3204407, -1.198602, -2.466478, 0, 1, 0.1607843, 1,
-0.319916, 0.3755511, -1.532622, 0, 1, 0.1647059, 1,
-0.31857, -0.464778, -2.859529, 0, 1, 0.172549, 1,
-0.3164032, 0.3327564, -1.100743, 0, 1, 0.1764706, 1,
-0.3144052, 0.3029718, -1.134471, 0, 1, 0.1843137, 1,
-0.3117274, 0.8117784, -0.7763109, 0, 1, 0.1882353, 1,
-0.3098924, -0.7815664, -3.116172, 0, 1, 0.1960784, 1,
-0.3079963, 0.0377488, -2.495046, 0, 1, 0.2039216, 1,
-0.3079416, 0.5816796, 0.1447369, 0, 1, 0.2078431, 1,
-0.3079063, 0.5364769, -0.84837, 0, 1, 0.2156863, 1,
-0.3046273, 0.2674201, -0.3756652, 0, 1, 0.2196078, 1,
-0.2975068, -0.1247793, -1.553535, 0, 1, 0.227451, 1,
-0.2904406, -0.5039318, -3.001386, 0, 1, 0.2313726, 1,
-0.285702, 0.7332491, -1.310979, 0, 1, 0.2392157, 1,
-0.2852266, -0.9147404, -2.703259, 0, 1, 0.2431373, 1,
-0.2840696, -0.8736168, -2.787147, 0, 1, 0.2509804, 1,
-0.2835931, -0.04415969, -2.214472, 0, 1, 0.254902, 1,
-0.2786353, -0.711383, -3.295372, 0, 1, 0.2627451, 1,
-0.2753462, -0.1404305, -3.060511, 0, 1, 0.2666667, 1,
-0.2746141, 0.8244069, -0.4735645, 0, 1, 0.2745098, 1,
-0.2730897, -0.5126707, -2.169163, 0, 1, 0.2784314, 1,
-0.2723557, -0.3957894, -2.550606, 0, 1, 0.2862745, 1,
-0.2698011, 0.9577872, 0.08507279, 0, 1, 0.2901961, 1,
-0.2697368, 1.633799, -0.04874168, 0, 1, 0.2980392, 1,
-0.2684599, -0.3356886, -1.203721, 0, 1, 0.3058824, 1,
-0.2653483, -0.453189, -1.001278, 0, 1, 0.3098039, 1,
-0.2577269, 1.476505, -1.002468, 0, 1, 0.3176471, 1,
-0.2541111, -1.014876, -1.546926, 0, 1, 0.3215686, 1,
-0.2500718, 0.8662178, 0.3526809, 0, 1, 0.3294118, 1,
-0.2491035, 0.37163, 0.3874861, 0, 1, 0.3333333, 1,
-0.2474357, -0.7841403, -3.33847, 0, 1, 0.3411765, 1,
-0.2466608, -1.228989, -3.86119, 0, 1, 0.345098, 1,
-0.2430111, -2.035, -3.434824, 0, 1, 0.3529412, 1,
-0.2422823, 0.09603587, -1.54798, 0, 1, 0.3568628, 1,
-0.2417959, 0.3052669, 0.4490103, 0, 1, 0.3647059, 1,
-0.2393856, 1.892442, -2.045606, 0, 1, 0.3686275, 1,
-0.2375424, 0.3372751, -2.031862, 0, 1, 0.3764706, 1,
-0.2290298, 0.2192408, -2.484072, 0, 1, 0.3803922, 1,
-0.2267457, -1.317724, -5.487402, 0, 1, 0.3882353, 1,
-0.2249759, -1.174784, -2.569917, 0, 1, 0.3921569, 1,
-0.2233394, -1.573872, -1.92772, 0, 1, 0.4, 1,
-0.2225793, 0.3170537, -0.4081325, 0, 1, 0.4078431, 1,
-0.2218102, -0.288049, -2.62681, 0, 1, 0.4117647, 1,
-0.2213166, -0.4959832, -2.581084, 0, 1, 0.4196078, 1,
-0.2196821, 0.3387847, 0.5925133, 0, 1, 0.4235294, 1,
-0.211027, 0.7217033, -0.3823454, 0, 1, 0.4313726, 1,
-0.210272, 2.339219, -0.6141733, 0, 1, 0.4352941, 1,
-0.2096018, 1.055945, -0.9320234, 0, 1, 0.4431373, 1,
-0.2065522, -0.9595441, -2.547248, 0, 1, 0.4470588, 1,
-0.2025925, -1.653081, -4.675109, 0, 1, 0.454902, 1,
-0.1971139, -1.267491, -1.904949, 0, 1, 0.4588235, 1,
-0.1887148, -0.09115609, -3.292232, 0, 1, 0.4666667, 1,
-0.1855635, 1.028533, 0.6070737, 0, 1, 0.4705882, 1,
-0.1852684, -1.713644, -3.547067, 0, 1, 0.4784314, 1,
-0.184781, -0.7610443, -2.607134, 0, 1, 0.4823529, 1,
-0.1772493, 0.07005183, -2.618915, 0, 1, 0.4901961, 1,
-0.1767694, 1.00151, -1.606837, 0, 1, 0.4941176, 1,
-0.1726124, 1.258735, -0.4285957, 0, 1, 0.5019608, 1,
-0.1650025, -0.165704, -3.545475, 0, 1, 0.509804, 1,
-0.1644315, 0.4078371, 0.8782721, 0, 1, 0.5137255, 1,
-0.1639838, -0.05679691, -1.7223, 0, 1, 0.5215687, 1,
-0.1581622, 0.8481898, -2.086189, 0, 1, 0.5254902, 1,
-0.1576154, -0.4145573, -2.042903, 0, 1, 0.5333334, 1,
-0.1542226, 0.02403219, -2.47262, 0, 1, 0.5372549, 1,
-0.1510055, -0.5989466, -3.374058, 0, 1, 0.5450981, 1,
-0.1490487, -0.495678, -2.365139, 0, 1, 0.5490196, 1,
-0.1428739, 1.283858, -1.411117, 0, 1, 0.5568628, 1,
-0.1412127, 1.157494, 1.187146, 0, 1, 0.5607843, 1,
-0.1388771, 0.9346771, 0.1434976, 0, 1, 0.5686275, 1,
-0.1376679, -0.6221085, -2.088439, 0, 1, 0.572549, 1,
-0.1366821, 0.01810059, -0.9417597, 0, 1, 0.5803922, 1,
-0.136115, 0.8496752, -1.572293, 0, 1, 0.5843138, 1,
-0.1337038, 0.4328688, -0.5489287, 0, 1, 0.5921569, 1,
-0.1321013, -0.8063362, -1.150388, 0, 1, 0.5960785, 1,
-0.1317388, -0.5335149, -1.950613, 0, 1, 0.6039216, 1,
-0.13106, -1.455092, -2.234918, 0, 1, 0.6117647, 1,
-0.1308279, -0.3785342, -4.368883, 0, 1, 0.6156863, 1,
-0.1213315, 0.4158385, 0.4640824, 0, 1, 0.6235294, 1,
-0.1200403, -0.3134594, -2.334221, 0, 1, 0.627451, 1,
-0.1147133, -0.1669422, -2.633512, 0, 1, 0.6352941, 1,
-0.1086067, -1.508962, -3.039078, 0, 1, 0.6392157, 1,
-0.106803, 0.1102468, -1.355427, 0, 1, 0.6470588, 1,
-0.1059655, 0.1477342, -2.355181, 0, 1, 0.6509804, 1,
-0.1058883, -2.046362, -3.848404, 0, 1, 0.6588235, 1,
-0.1036495, 1.105568, 0.110455, 0, 1, 0.6627451, 1,
-0.0947993, -1.116068, -2.337583, 0, 1, 0.6705883, 1,
-0.0940125, 0.3445166, 0.1945233, 0, 1, 0.6745098, 1,
-0.09151416, -1.116836, -1.592529, 0, 1, 0.682353, 1,
-0.08881988, 0.8314598, -0.8041868, 0, 1, 0.6862745, 1,
-0.08299781, -0.1354674, -3.468631, 0, 1, 0.6941177, 1,
-0.08283355, -0.2408209, -3.207995, 0, 1, 0.7019608, 1,
-0.08152651, 0.2623428, -0.8972714, 0, 1, 0.7058824, 1,
-0.07951227, -0.6693304, -4.03864, 0, 1, 0.7137255, 1,
-0.0780472, -0.4830326, -1.46789, 0, 1, 0.7176471, 1,
-0.07511443, 0.832651, -0.8502149, 0, 1, 0.7254902, 1,
-0.07464213, 0.03331988, -1.433006, 0, 1, 0.7294118, 1,
-0.07279344, -0.6148179, -3.262731, 0, 1, 0.7372549, 1,
-0.07220057, -0.6684031, -3.585683, 0, 1, 0.7411765, 1,
-0.07159379, -1.214547, -1.579403, 0, 1, 0.7490196, 1,
-0.0709177, -0.5777302, -4.38457, 0, 1, 0.7529412, 1,
-0.0707892, -0.4932102, -1.342195, 0, 1, 0.7607843, 1,
-0.07029365, 0.1450171, 1.052448, 0, 1, 0.7647059, 1,
-0.06715584, -0.9609684, -3.674632, 0, 1, 0.772549, 1,
-0.06542359, 1.038093, 0.605879, 0, 1, 0.7764706, 1,
-0.06499806, 0.8434898, -0.4863364, 0, 1, 0.7843137, 1,
-0.06477884, 2.347489, 0.5883875, 0, 1, 0.7882353, 1,
-0.06013025, 0.1115682, 1.217394, 0, 1, 0.7960784, 1,
-0.05927505, 0.05446131, -1.393402, 0, 1, 0.8039216, 1,
-0.05361267, 0.8266789, -0.6672127, 0, 1, 0.8078431, 1,
-0.05327469, -0.01429586, 0.1589023, 0, 1, 0.8156863, 1,
-0.04969324, 1.129925, 1.227466, 0, 1, 0.8196079, 1,
-0.04861004, -0.6065371, -2.230593, 0, 1, 0.827451, 1,
-0.04656228, -0.8905329, -3.049002, 0, 1, 0.8313726, 1,
-0.03694543, 0.9219419, 0.8947011, 0, 1, 0.8392157, 1,
-0.03438262, -1.035993, -1.580594, 0, 1, 0.8431373, 1,
-0.0322987, -2.079865, -3.935457, 0, 1, 0.8509804, 1,
-0.03193489, -0.5697041, -4.108362, 0, 1, 0.854902, 1,
-0.03168533, 0.3857727, 0.6711631, 0, 1, 0.8627451, 1,
-0.02950732, -2.143895, -2.319583, 0, 1, 0.8666667, 1,
-0.02417605, -0.4225886, -3.521111, 0, 1, 0.8745098, 1,
-0.02396205, 0.1270896, -0.3479182, 0, 1, 0.8784314, 1,
-0.01979758, -0.9793591, -2.410186, 0, 1, 0.8862745, 1,
-0.0176721, 2.208324, -0.6247033, 0, 1, 0.8901961, 1,
-0.01762778, 0.9481302, -1.113219, 0, 1, 0.8980392, 1,
-0.01549169, 1.575461, -0.2671011, 0, 1, 0.9058824, 1,
-0.01449404, -0.3489172, -3.237264, 0, 1, 0.9098039, 1,
-0.01174323, 1.420555, 1.497464, 0, 1, 0.9176471, 1,
-0.01143077, 0.1952, 1.609322, 0, 1, 0.9215686, 1,
-0.01111671, -0.144971, -2.141049, 0, 1, 0.9294118, 1,
-0.01100476, 0.07635057, 0.333647, 0, 1, 0.9333333, 1,
-0.008150131, -1.310318, -3.626581, 0, 1, 0.9411765, 1,
-0.007908493, 1.578402, -1.232603, 0, 1, 0.945098, 1,
-0.006680465, 0.9385297, 0.5338619, 0, 1, 0.9529412, 1,
-0.004268164, 1.634748, 0.7313679, 0, 1, 0.9568627, 1,
-0.003661227, 1.420413, 0.2355916, 0, 1, 0.9647059, 1,
0.0005999116, 0.7777709, -0.08694828, 0, 1, 0.9686275, 1,
0.01070702, 0.3873061, -0.7476786, 0, 1, 0.9764706, 1,
0.01130841, 0.7539507, 0.4080274, 0, 1, 0.9803922, 1,
0.0120661, -0.809761, 2.818301, 0, 1, 0.9882353, 1,
0.01209737, -0.4446993, 2.916066, 0, 1, 0.9921569, 1,
0.0173943, 0.1188744, 0.1145452, 0, 1, 1, 1,
0.02080064, 0.6524714, 1.954658, 0, 0.9921569, 1, 1,
0.0210823, -0.4151152, 3.06783, 0, 0.9882353, 1, 1,
0.02170769, -0.7965125, 2.390018, 0, 0.9803922, 1, 1,
0.02221951, -0.4365426, 4.000345, 0, 0.9764706, 1, 1,
0.02399942, -0.5951138, 2.986183, 0, 0.9686275, 1, 1,
0.02960324, -0.0214337, 2.792843, 0, 0.9647059, 1, 1,
0.03201197, -0.7342151, 2.866351, 0, 0.9568627, 1, 1,
0.03334102, 0.2967082, -0.04809213, 0, 0.9529412, 1, 1,
0.03355424, 1.506449, 0.7483131, 0, 0.945098, 1, 1,
0.03719688, -0.5475951, 3.015292, 0, 0.9411765, 1, 1,
0.03930646, 0.6495028, -0.02650409, 0, 0.9333333, 1, 1,
0.04247417, -0.4911597, 4.764092, 0, 0.9294118, 1, 1,
0.04448459, -0.2269763, 0.606777, 0, 0.9215686, 1, 1,
0.04544011, 1.121738, -0.9418547, 0, 0.9176471, 1, 1,
0.0494276, -0.5416147, 1.607937, 0, 0.9098039, 1, 1,
0.05828152, -0.903631, 2.006889, 0, 0.9058824, 1, 1,
0.06302644, 1.465447, 0.9592674, 0, 0.8980392, 1, 1,
0.06404625, 0.9040239, -0.8436407, 0, 0.8901961, 1, 1,
0.06699151, 0.3568086, 0.5151178, 0, 0.8862745, 1, 1,
0.06888882, -0.5963129, 3.800878, 0, 0.8784314, 1, 1,
0.07820531, 0.3814133, -0.672156, 0, 0.8745098, 1, 1,
0.0786208, 1.897515, -1.285723, 0, 0.8666667, 1, 1,
0.08301961, -0.1704608, 3.730015, 0, 0.8627451, 1, 1,
0.08412458, -1.370279, 3.681035, 0, 0.854902, 1, 1,
0.08576964, -1.013497, 2.51568, 0, 0.8509804, 1, 1,
0.08682323, 1.194316, -0.5625977, 0, 0.8431373, 1, 1,
0.09264638, 0.9125496, 0.765948, 0, 0.8392157, 1, 1,
0.0949286, 0.001880073, 1.733524, 0, 0.8313726, 1, 1,
0.09980039, -0.853514, 2.444296, 0, 0.827451, 1, 1,
0.1010101, -0.6935863, 1.936483, 0, 0.8196079, 1, 1,
0.1103067, 0.647867, 0.5792077, 0, 0.8156863, 1, 1,
0.1146296, 1.742949, 1.431203, 0, 0.8078431, 1, 1,
0.1177583, -0.6568714, 3.031859, 0, 0.8039216, 1, 1,
0.1181447, 1.815709, 0.7305083, 0, 0.7960784, 1, 1,
0.1200687, -1.074688, 1.251448, 0, 0.7882353, 1, 1,
0.1216496, -0.3913733, 2.271444, 0, 0.7843137, 1, 1,
0.1230328, 1.102662, 0.1151674, 0, 0.7764706, 1, 1,
0.1231435, -1.983507, 4.172874, 0, 0.772549, 1, 1,
0.1245061, 0.4078447, 0.1095783, 0, 0.7647059, 1, 1,
0.1279116, 1.56221, -0.2660581, 0, 0.7607843, 1, 1,
0.1302002, 0.3746786, -0.0542748, 0, 0.7529412, 1, 1,
0.1348577, -1.179184, 2.740723, 0, 0.7490196, 1, 1,
0.1359572, 0.3425902, 1.544908, 0, 0.7411765, 1, 1,
0.1373085, -0.6505236, 2.240248, 0, 0.7372549, 1, 1,
0.1392718, -0.1830957, 2.127177, 0, 0.7294118, 1, 1,
0.1487872, -0.3006616, 1.986077, 0, 0.7254902, 1, 1,
0.1545208, -1.103596, 4.463297, 0, 0.7176471, 1, 1,
0.1552122, -1.128999, 1.861827, 0, 0.7137255, 1, 1,
0.1566153, -0.351793, 3.608953, 0, 0.7058824, 1, 1,
0.1734723, -0.3130174, 4.045223, 0, 0.6980392, 1, 1,
0.1790069, 0.97464, 0.7013857, 0, 0.6941177, 1, 1,
0.1819115, -0.5333132, 2.363768, 0, 0.6862745, 1, 1,
0.1842209, 2.05631, 1.305456, 0, 0.682353, 1, 1,
0.1856554, -0.3675207, 4.686768, 0, 0.6745098, 1, 1,
0.1903719, 0.6373854, 1.826905, 0, 0.6705883, 1, 1,
0.1906752, -0.00302282, 0.03816323, 0, 0.6627451, 1, 1,
0.191145, 0.06378011, 0.5473751, 0, 0.6588235, 1, 1,
0.1918969, 0.246589, 1.397352, 0, 0.6509804, 1, 1,
0.1926529, -0.1197136, 1.65186, 0, 0.6470588, 1, 1,
0.1956197, -1.755805, 2.782416, 0, 0.6392157, 1, 1,
0.1976165, 0.06516694, 0.2840358, 0, 0.6352941, 1, 1,
0.2004137, 0.5630273, -1.808929, 0, 0.627451, 1, 1,
0.2056635, -0.002588162, 0.1611596, 0, 0.6235294, 1, 1,
0.2061667, 1.112684, 1.075909, 0, 0.6156863, 1, 1,
0.2077215, 0.5450681, 0.8602443, 0, 0.6117647, 1, 1,
0.2102051, 0.3313687, 0.4615224, 0, 0.6039216, 1, 1,
0.2126592, 0.2291069, 1.073243, 0, 0.5960785, 1, 1,
0.2172881, 0.4450755, 1.649741, 0, 0.5921569, 1, 1,
0.2187525, -0.8378121, 1.828578, 0, 0.5843138, 1, 1,
0.2203908, 0.02623276, -0.7308961, 0, 0.5803922, 1, 1,
0.2218568, 0.4623243, 0.3815883, 0, 0.572549, 1, 1,
0.2277832, -1.298332, 3.696851, 0, 0.5686275, 1, 1,
0.2281649, 0.2183198, 3.500965, 0, 0.5607843, 1, 1,
0.2329181, 0.6116288, 1.690285, 0, 0.5568628, 1, 1,
0.2352524, 0.7802819, 1.406746, 0, 0.5490196, 1, 1,
0.2376651, -0.6170985, 3.717148, 0, 0.5450981, 1, 1,
0.2378863, -0.2727444, 3.417534, 0, 0.5372549, 1, 1,
0.2406037, 0.8501331, 1.132019, 0, 0.5333334, 1, 1,
0.2421386, -0.6823618, 1.205324, 0, 0.5254902, 1, 1,
0.2490769, -0.04105034, 0.5114121, 0, 0.5215687, 1, 1,
0.2504752, 0.583455, 2.316309, 0, 0.5137255, 1, 1,
0.25371, 0.2899646, -0.90272, 0, 0.509804, 1, 1,
0.2547677, -1.072929, 1.991136, 0, 0.5019608, 1, 1,
0.255653, 0.2270249, 1.303767, 0, 0.4941176, 1, 1,
0.2574511, 2.252669, -0.4924277, 0, 0.4901961, 1, 1,
0.2581727, -0.1523579, 4.421886, 0, 0.4823529, 1, 1,
0.2635976, -0.5258297, 2.722752, 0, 0.4784314, 1, 1,
0.2691822, -1.317929, 2.597842, 0, 0.4705882, 1, 1,
0.2705241, 1.466781, 0.7393575, 0, 0.4666667, 1, 1,
0.2711049, 0.1861015, -0.8648614, 0, 0.4588235, 1, 1,
0.2719065, -1.507182, 4.190128, 0, 0.454902, 1, 1,
0.2768913, 0.7360116, 1.090139, 0, 0.4470588, 1, 1,
0.2800194, -0.1833129, 2.924528, 0, 0.4431373, 1, 1,
0.281665, -1.430344, 1.086682, 0, 0.4352941, 1, 1,
0.2821509, -0.1390099, 2.495775, 0, 0.4313726, 1, 1,
0.2822823, 1.112669, 1.596315, 0, 0.4235294, 1, 1,
0.2884829, -0.250929, 2.55524, 0, 0.4196078, 1, 1,
0.2940992, 1.034827, -0.5936812, 0, 0.4117647, 1, 1,
0.29667, 2.151372, -0.9975978, 0, 0.4078431, 1, 1,
0.2968605, -0.8554849, 4.380681, 0, 0.4, 1, 1,
0.3003435, -1.347964, 3.599259, 0, 0.3921569, 1, 1,
0.3013579, 0.1090742, -0.3590826, 0, 0.3882353, 1, 1,
0.3045091, -1.756182, 2.874698, 0, 0.3803922, 1, 1,
0.3069439, -0.2601962, 3.162166, 0, 0.3764706, 1, 1,
0.3083992, 0.4530055, -1.181981, 0, 0.3686275, 1, 1,
0.3105375, 0.6589386, -0.5458797, 0, 0.3647059, 1, 1,
0.3111961, -1.299146, 1.19423, 0, 0.3568628, 1, 1,
0.3113599, -2.159721, 2.708698, 0, 0.3529412, 1, 1,
0.3118927, 1.345978, 1.700381, 0, 0.345098, 1, 1,
0.314301, 1.221438, -0.4157852, 0, 0.3411765, 1, 1,
0.320578, -2.185644, 2.213276, 0, 0.3333333, 1, 1,
0.3212059, -0.2073564, 0.1506152, 0, 0.3294118, 1, 1,
0.3243946, 1.18054, 0.3121565, 0, 0.3215686, 1, 1,
0.324543, -1.074479, 4.767394, 0, 0.3176471, 1, 1,
0.3309401, 0.4078469, 0.07490621, 0, 0.3098039, 1, 1,
0.3343106, -0.4999633, 2.438907, 0, 0.3058824, 1, 1,
0.3344484, -0.1097499, 1.251775, 0, 0.2980392, 1, 1,
0.3390667, 0.08479009, 1.2556, 0, 0.2901961, 1, 1,
0.3447791, -0.4826705, 3.506909, 0, 0.2862745, 1, 1,
0.346825, 0.3578467, 0.3938064, 0, 0.2784314, 1, 1,
0.3501867, 0.01959936, 1.889012, 0, 0.2745098, 1, 1,
0.3544159, 0.84219, -0.4463952, 0, 0.2666667, 1, 1,
0.3553962, 0.7718971, 1.607753, 0, 0.2627451, 1, 1,
0.3577145, -0.3813805, 2.373396, 0, 0.254902, 1, 1,
0.3585516, -1.006974, 3.957673, 0, 0.2509804, 1, 1,
0.3591101, -0.7137475, 2.793746, 0, 0.2431373, 1, 1,
0.3671784, -0.57652, 2.697168, 0, 0.2392157, 1, 1,
0.3687119, 0.5180662, -0.5350072, 0, 0.2313726, 1, 1,
0.376815, -1.034051, 1.743244, 0, 0.227451, 1, 1,
0.3789883, 0.7190257, 0.5007588, 0, 0.2196078, 1, 1,
0.3811888, 0.8639606, -0.03957247, 0, 0.2156863, 1, 1,
0.3927024, -0.5622222, 2.393616, 0, 0.2078431, 1, 1,
0.3934095, -0.3425056, 2.48429, 0, 0.2039216, 1, 1,
0.3965015, -0.7626005, 0.539335, 0, 0.1960784, 1, 1,
0.3969409, -1.971468, 2.717836, 0, 0.1882353, 1, 1,
0.3981613, 1.887107, -1.209513, 0, 0.1843137, 1, 1,
0.3987696, -0.4689004, 3.760231, 0, 0.1764706, 1, 1,
0.3999547, -0.5092795, 3.095125, 0, 0.172549, 1, 1,
0.4012547, 0.7847176, 0.3564102, 0, 0.1647059, 1, 1,
0.4014178, -0.0969211, 0.3841106, 0, 0.1607843, 1, 1,
0.4059304, -0.1252021, 2.998872, 0, 0.1529412, 1, 1,
0.4100567, -0.9239563, 1.421267, 0, 0.1490196, 1, 1,
0.4115125, 1.543598, -1.205516, 0, 0.1411765, 1, 1,
0.4118776, -0.3709555, 0.1344479, 0, 0.1372549, 1, 1,
0.4127778, 1.229857, -2.161834, 0, 0.1294118, 1, 1,
0.4135866, -0.5912611, 3.149894, 0, 0.1254902, 1, 1,
0.4143181, 0.02714435, 1.928442, 0, 0.1176471, 1, 1,
0.4282078, -0.9930792, 2.639813, 0, 0.1137255, 1, 1,
0.4283767, -0.3428335, 2.51655, 0, 0.1058824, 1, 1,
0.430473, 1.586569, -0.1672145, 0, 0.09803922, 1, 1,
0.4306842, -0.348316, 2.686363, 0, 0.09411765, 1, 1,
0.4315169, 0.5562928, 0.7542129, 0, 0.08627451, 1, 1,
0.4315639, 1.364287, -1.442126, 0, 0.08235294, 1, 1,
0.4325627, -0.8746418, 2.394709, 0, 0.07450981, 1, 1,
0.4326715, 0.363013, 0.1627616, 0, 0.07058824, 1, 1,
0.4349821, 0.1185511, 2.222792, 0, 0.0627451, 1, 1,
0.4374999, -0.8716002, 3.891266, 0, 0.05882353, 1, 1,
0.4380754, -0.2225094, 1.104018, 0, 0.05098039, 1, 1,
0.4432525, 0.3572008, 1.391749, 0, 0.04705882, 1, 1,
0.44558, 0.9504932, -0.7402478, 0, 0.03921569, 1, 1,
0.445954, -1.200474, 1.944727, 0, 0.03529412, 1, 1,
0.4492005, -0.3954703, 1.49053, 0, 0.02745098, 1, 1,
0.4498642, -2.336663, 2.76678, 0, 0.02352941, 1, 1,
0.4553298, 0.745304, 0.982323, 0, 0.01568628, 1, 1,
0.4589019, -2.005196, 3.872349, 0, 0.01176471, 1, 1,
0.4642567, -0.8474675, 2.667704, 0, 0.003921569, 1, 1,
0.4701522, -0.8861427, 4.669832, 0.003921569, 0, 1, 1,
0.4706964, -1.012047, 1.037055, 0.007843138, 0, 1, 1,
0.4729231, -1.063865, 3.278627, 0.01568628, 0, 1, 1,
0.4745947, 1.570947, -1.372818, 0.01960784, 0, 1, 1,
0.477849, 0.003248271, 0.5138628, 0.02745098, 0, 1, 1,
0.4782851, 0.007639506, 1.868173, 0.03137255, 0, 1, 1,
0.4817821, 0.000815689, 1.890916, 0.03921569, 0, 1, 1,
0.4840982, 0.1116912, 0.4909573, 0.04313726, 0, 1, 1,
0.4842851, 0.2990294, 0.2075457, 0.05098039, 0, 1, 1,
0.4907089, 0.6606079, -0.006888464, 0.05490196, 0, 1, 1,
0.4912428, -0.2697246, 1.306278, 0.0627451, 0, 1, 1,
0.4915209, 0.3091874, 2.877919, 0.06666667, 0, 1, 1,
0.4933608, 1.057794, 0.5791369, 0.07450981, 0, 1, 1,
0.493773, 0.01489906, 2.057409, 0.07843138, 0, 1, 1,
0.5000505, 0.2768732, -0.01073887, 0.08627451, 0, 1, 1,
0.5027732, -1.995127, 3.646734, 0.09019608, 0, 1, 1,
0.5062381, -0.5117751, 3.146288, 0.09803922, 0, 1, 1,
0.507852, -0.5574359, 0.855436, 0.1058824, 0, 1, 1,
0.5139841, 1.150676, -0.6163635, 0.1098039, 0, 1, 1,
0.5150066, -0.20577, 1.211399, 0.1176471, 0, 1, 1,
0.5155427, -1.154727, 2.065375, 0.1215686, 0, 1, 1,
0.5164579, 0.1223892, 1.143821, 0.1294118, 0, 1, 1,
0.5179949, 1.522826, 2.098716, 0.1333333, 0, 1, 1,
0.5244226, -1.350005, 4.010612, 0.1411765, 0, 1, 1,
0.5299317, 0.05186991, 0.3002739, 0.145098, 0, 1, 1,
0.5330782, -0.4308596, 2.254748, 0.1529412, 0, 1, 1,
0.5330801, 1.645635, -0.03264862, 0.1568628, 0, 1, 1,
0.5372338, 0.925642, 0.3094428, 0.1647059, 0, 1, 1,
0.5376507, 2.506389, -1.103268, 0.1686275, 0, 1, 1,
0.5430329, -0.003676611, -1.252421, 0.1764706, 0, 1, 1,
0.5477179, -0.3929355, 0.6121019, 0.1803922, 0, 1, 1,
0.5514677, 2.004332, 1.831763, 0.1882353, 0, 1, 1,
0.5520715, -0.6388507, 2.509399, 0.1921569, 0, 1, 1,
0.5538834, -0.5236221, 3.095609, 0.2, 0, 1, 1,
0.5662144, -0.8161044, 3.301393, 0.2078431, 0, 1, 1,
0.5672835, -0.4043588, 1.370868, 0.2117647, 0, 1, 1,
0.5705225, -0.4508734, 2.152968, 0.2196078, 0, 1, 1,
0.5723303, -0.6086784, 2.099681, 0.2235294, 0, 1, 1,
0.5736533, -0.1852795, 2.244926, 0.2313726, 0, 1, 1,
0.5744747, -0.1158691, 2.517997, 0.2352941, 0, 1, 1,
0.5748729, 0.3120864, 2.327157, 0.2431373, 0, 1, 1,
0.5757174, -0.7096961, 2.275608, 0.2470588, 0, 1, 1,
0.5785095, 1.151641, 1.563878, 0.254902, 0, 1, 1,
0.5807991, -0.2251509, 1.918844, 0.2588235, 0, 1, 1,
0.5847747, 0.8067576, 1.657782, 0.2666667, 0, 1, 1,
0.585445, 0.8814694, 1.042268, 0.2705882, 0, 1, 1,
0.5928715, -0.4469391, 2.489581, 0.2784314, 0, 1, 1,
0.5948738, 1.5794, -0.3423464, 0.282353, 0, 1, 1,
0.5962652, -1.818481, 3.722788, 0.2901961, 0, 1, 1,
0.5976141, 1.817592, -0.3045935, 0.2941177, 0, 1, 1,
0.6000465, 0.7706818, 1.558099, 0.3019608, 0, 1, 1,
0.6013276, -0.5964938, 4.244925, 0.3098039, 0, 1, 1,
0.608593, 0.7318527, -0.9778213, 0.3137255, 0, 1, 1,
0.6096214, -1.897968, 3.019372, 0.3215686, 0, 1, 1,
0.6145973, 1.038136, -0.1784008, 0.3254902, 0, 1, 1,
0.6164945, 0.9929963, 2.724337, 0.3333333, 0, 1, 1,
0.6181859, -0.337159, 3.548846, 0.3372549, 0, 1, 1,
0.618284, 1.248042, 1.131763, 0.345098, 0, 1, 1,
0.6234568, -2.992069, 4.009789, 0.3490196, 0, 1, 1,
0.6234903, 0.2336851, 1.772038, 0.3568628, 0, 1, 1,
0.6242852, -0.1721992, 2.507159, 0.3607843, 0, 1, 1,
0.6273252, -0.7980599, 0.3908698, 0.3686275, 0, 1, 1,
0.6293383, -0.9356816, 1.852228, 0.372549, 0, 1, 1,
0.6334809, -0.09301468, 3.434895, 0.3803922, 0, 1, 1,
0.6345783, -0.122541, 1.244871, 0.3843137, 0, 1, 1,
0.6361758, 0.4048475, 0.6640739, 0.3921569, 0, 1, 1,
0.639811, 0.1108132, 1.97287, 0.3960784, 0, 1, 1,
0.644034, -0.1364511, 1.947353, 0.4039216, 0, 1, 1,
0.6441499, -0.7168438, 3.584437, 0.4117647, 0, 1, 1,
0.6457454, -0.9387313, 1.539348, 0.4156863, 0, 1, 1,
0.6466402, -2.504199, 3.401355, 0.4235294, 0, 1, 1,
0.6484909, -0.3971939, 0.5888787, 0.427451, 0, 1, 1,
0.6512033, -1.346472, 2.089607, 0.4352941, 0, 1, 1,
0.6613312, 0.2257286, 0.001757603, 0.4392157, 0, 1, 1,
0.6635193, -2.030698, 3.593974, 0.4470588, 0, 1, 1,
0.6659267, -0.2330789, 3.45037, 0.4509804, 0, 1, 1,
0.6675269, -0.2563034, 3.287562, 0.4588235, 0, 1, 1,
0.6699348, 0.5277894, -0.4170769, 0.4627451, 0, 1, 1,
0.6789879, -1.615216, 2.75642, 0.4705882, 0, 1, 1,
0.6799948, -0.7875113, 2.043786, 0.4745098, 0, 1, 1,
0.6855817, 0.4976546, 1.99351, 0.4823529, 0, 1, 1,
0.6871985, 0.3586089, 2.612399, 0.4862745, 0, 1, 1,
0.6919733, -0.9651023, 2.892979, 0.4941176, 0, 1, 1,
0.6958073, -0.9621575, 4.523019, 0.5019608, 0, 1, 1,
0.6977676, -0.6735345, 2.791771, 0.5058824, 0, 1, 1,
0.6993171, 1.063699, 0.03642618, 0.5137255, 0, 1, 1,
0.700047, 1.570702, 1.336347, 0.5176471, 0, 1, 1,
0.7049211, -0.8459442, 2.768843, 0.5254902, 0, 1, 1,
0.706388, 0.8984494, 0.3503586, 0.5294118, 0, 1, 1,
0.7099515, -0.2835888, 2.945999, 0.5372549, 0, 1, 1,
0.7105048, 0.6275475, 0.7307296, 0.5411765, 0, 1, 1,
0.7144599, -1.491808, 2.775405, 0.5490196, 0, 1, 1,
0.7147978, -1.306742, 3.012758, 0.5529412, 0, 1, 1,
0.7152991, 1.68112, 0.5738294, 0.5607843, 0, 1, 1,
0.7212697, 0.6835348, 0.439075, 0.5647059, 0, 1, 1,
0.7227634, 0.1848717, 0.25802, 0.572549, 0, 1, 1,
0.7229077, 0.01065246, 1.477371, 0.5764706, 0, 1, 1,
0.7253261, -0.3384203, 3.046203, 0.5843138, 0, 1, 1,
0.7256762, 1.671605, -0.4441504, 0.5882353, 0, 1, 1,
0.7295802, 0.09724583, 1.787296, 0.5960785, 0, 1, 1,
0.7366315, -0.1476991, 2.51939, 0.6039216, 0, 1, 1,
0.7367814, 0.04430504, 1.959395, 0.6078432, 0, 1, 1,
0.742906, -1.02553, 1.257489, 0.6156863, 0, 1, 1,
0.7449075, 0.6246777, 0.8824576, 0.6196079, 0, 1, 1,
0.7479061, 0.7211989, -0.3311211, 0.627451, 0, 1, 1,
0.7519206, 0.09277234, -0.1705264, 0.6313726, 0, 1, 1,
0.7524925, -0.7144491, 1.825783, 0.6392157, 0, 1, 1,
0.7588336, 2.38604, 0.7961618, 0.6431373, 0, 1, 1,
0.7631861, -0.7298877, 1.790411, 0.6509804, 0, 1, 1,
0.7663054, 1.386373, 0.1928662, 0.654902, 0, 1, 1,
0.7710974, 0.2216889, 0.9866301, 0.6627451, 0, 1, 1,
0.7742969, -0.1170571, 2.148648, 0.6666667, 0, 1, 1,
0.7773247, -1.61448, 1.70582, 0.6745098, 0, 1, 1,
0.7776473, 0.125653, 2.473999, 0.6784314, 0, 1, 1,
0.7816697, -1.246703, 2.806553, 0.6862745, 0, 1, 1,
0.7833594, 1.961682, -1.969907, 0.6901961, 0, 1, 1,
0.7862474, -0.9835777, 1.954666, 0.6980392, 0, 1, 1,
0.7896516, 0.02002961, 0.9180771, 0.7058824, 0, 1, 1,
0.7899175, -0.3111464, 3.142473, 0.7098039, 0, 1, 1,
0.7960122, -0.2851034, 0.8289633, 0.7176471, 0, 1, 1,
0.796618, -0.6065118, 0.9680467, 0.7215686, 0, 1, 1,
0.8084188, -1.554422, 1.776948, 0.7294118, 0, 1, 1,
0.8088941, -1.08903, 2.636191, 0.7333333, 0, 1, 1,
0.8096002, 0.4503041, 1.030387, 0.7411765, 0, 1, 1,
0.8180206, 0.07016858, 1.263736, 0.7450981, 0, 1, 1,
0.818116, 0.6757978, 0.4151181, 0.7529412, 0, 1, 1,
0.8245094, 0.5173491, 1.515821, 0.7568628, 0, 1, 1,
0.828355, 1.387761, 0.1105479, 0.7647059, 0, 1, 1,
0.8284629, -0.5584243, 1.657743, 0.7686275, 0, 1, 1,
0.8311788, 0.9315269, 0.4854081, 0.7764706, 0, 1, 1,
0.8345027, -0.3326501, 2.135189, 0.7803922, 0, 1, 1,
0.834747, 1.279048, 0.5976068, 0.7882353, 0, 1, 1,
0.8430604, 0.5113264, -1.119469, 0.7921569, 0, 1, 1,
0.8444526, 1.243375, 1.72344, 0.8, 0, 1, 1,
0.8458955, -0.7313161, 3.242532, 0.8078431, 0, 1, 1,
0.8501211, 1.067027, -0.6079105, 0.8117647, 0, 1, 1,
0.8560852, 0.1003811, 1.556913, 0.8196079, 0, 1, 1,
0.8562789, -0.5580468, 4.533947, 0.8235294, 0, 1, 1,
0.8566221, 1.574852, 2.755071, 0.8313726, 0, 1, 1,
0.8691466, 0.6651878, 0.112442, 0.8352941, 0, 1, 1,
0.8748287, -0.729672, 2.248731, 0.8431373, 0, 1, 1,
0.8763521, 0.09002583, 3.020667, 0.8470588, 0, 1, 1,
0.877688, -0.6431391, 0.3450124, 0.854902, 0, 1, 1,
0.8781688, -0.1078274, 1.03281, 0.8588235, 0, 1, 1,
0.8784052, -0.594587, 2.908291, 0.8666667, 0, 1, 1,
0.8799438, -0.3800701, 1.519804, 0.8705882, 0, 1, 1,
0.8799832, 1.039949, 0.3458219, 0.8784314, 0, 1, 1,
0.8833119, 0.5540502, 0.0341238, 0.8823529, 0, 1, 1,
0.8838299, 0.9607642, -0.4227212, 0.8901961, 0, 1, 1,
0.8843798, -0.05825884, 1.908718, 0.8941177, 0, 1, 1,
0.8957544, -0.06360079, 3.857959, 0.9019608, 0, 1, 1,
0.905646, -0.6390967, 2.849238, 0.9098039, 0, 1, 1,
0.9080878, -1.360386, 0.9955996, 0.9137255, 0, 1, 1,
0.9102088, 1.00521, 1.133453, 0.9215686, 0, 1, 1,
0.9178511, -0.8579392, 1.489988, 0.9254902, 0, 1, 1,
0.9203671, 1.538146, -0.02879507, 0.9333333, 0, 1, 1,
0.9232133, -0.2288214, 1.919237, 0.9372549, 0, 1, 1,
0.9232711, 0.6586896, 0.725088, 0.945098, 0, 1, 1,
0.9234052, 0.07724588, 2.473621, 0.9490196, 0, 1, 1,
0.9237933, 0.1473208, 1.754877, 0.9568627, 0, 1, 1,
0.9380837, 0.8515329, -0.6482419, 0.9607843, 0, 1, 1,
0.938332, -0.3364081, 2.748251, 0.9686275, 0, 1, 1,
0.9397944, -0.5463211, 2.780913, 0.972549, 0, 1, 1,
0.9406317, -0.084878, 0.3481712, 0.9803922, 0, 1, 1,
0.9420227, 1.258287, 0.2431518, 0.9843137, 0, 1, 1,
0.943765, 1.172324, 0.9316915, 0.9921569, 0, 1, 1,
0.9439824, -0.5824351, 4.115474, 0.9960784, 0, 1, 1,
0.9452526, 0.8984562, 1.095192, 1, 0, 0.9960784, 1,
0.9459877, -2.038742, 2.046351, 1, 0, 0.9882353, 1,
0.9500797, -0.3716976, 0.2644611, 1, 0, 0.9843137, 1,
0.9520887, 0.8087795, -0.3182287, 1, 0, 0.9764706, 1,
0.9554858, 1.00964, -0.3330815, 1, 0, 0.972549, 1,
0.9581087, -1.398423, 0.2301624, 1, 0, 0.9647059, 1,
0.9581839, -0.462707, 1.849191, 1, 0, 0.9607843, 1,
0.9754173, 0.2167652, 1.04969, 1, 0, 0.9529412, 1,
0.9804283, 0.03890754, 0.1530318, 1, 0, 0.9490196, 1,
0.9838619, 1.731976, 0.2135423, 1, 0, 0.9411765, 1,
0.9839123, 0.5895639, 0.6069571, 1, 0, 0.9372549, 1,
0.9890476, -0.02826078, -0.4258998, 1, 0, 0.9294118, 1,
0.9901683, 0.04333987, 2.493836, 1, 0, 0.9254902, 1,
0.9993181, -0.2526698, 2.438552, 1, 0, 0.9176471, 1,
1.001657, 1.363233, 1.108004, 1, 0, 0.9137255, 1,
1.003204, -0.5803581, 1.55794, 1, 0, 0.9058824, 1,
1.012784, -0.0006902379, 1.300427, 1, 0, 0.9019608, 1,
1.014147, -0.3274924, 3.579475, 1, 0, 0.8941177, 1,
1.014898, -0.2754931, 2.321602, 1, 0, 0.8862745, 1,
1.021218, -1.045641, 1.298378, 1, 0, 0.8823529, 1,
1.024593, -0.47505, 2.124588, 1, 0, 0.8745098, 1,
1.038403, 0.887378, -1.200463, 1, 0, 0.8705882, 1,
1.039308, 0.7548815, 2.085263, 1, 0, 0.8627451, 1,
1.04168, -0.4659308, 1.979229, 1, 0, 0.8588235, 1,
1.051317, -1.683429, 2.871471, 1, 0, 0.8509804, 1,
1.053073, -1.205318, 2.158971, 1, 0, 0.8470588, 1,
1.058739, 1.011538, 1.509139, 1, 0, 0.8392157, 1,
1.060317, 1.401013, 0.3043787, 1, 0, 0.8352941, 1,
1.064007, 2.343413, 0.5533904, 1, 0, 0.827451, 1,
1.072238, -0.4117615, 1.960513, 1, 0, 0.8235294, 1,
1.075668, 0.1218146, 0.5812809, 1, 0, 0.8156863, 1,
1.07662, -1.428475, 3.761819, 1, 0, 0.8117647, 1,
1.079156, -2.023879, 2.171105, 1, 0, 0.8039216, 1,
1.08522, 1.647719, 1.066269, 1, 0, 0.7960784, 1,
1.093267, 0.1570897, 0.2086767, 1, 0, 0.7921569, 1,
1.100681, 1.198417, 1.537537, 1, 0, 0.7843137, 1,
1.10362, -3.836031, 3.401552, 1, 0, 0.7803922, 1,
1.112785, 0.7730916, 0.136889, 1, 0, 0.772549, 1,
1.115638, 1.549403, 1.716397, 1, 0, 0.7686275, 1,
1.124164, 1.238026, 1.328156, 1, 0, 0.7607843, 1,
1.12554, -0.336549, 3.242791, 1, 0, 0.7568628, 1,
1.127038, -0.02011348, 2.154194, 1, 0, 0.7490196, 1,
1.131289, 1.238165, 2.811755, 1, 0, 0.7450981, 1,
1.131336, 0.01729595, 1.783902, 1, 0, 0.7372549, 1,
1.135408, 1.067906, 0.2858293, 1, 0, 0.7333333, 1,
1.14181, 0.1824753, 2.236264, 1, 0, 0.7254902, 1,
1.146884, -0.810811, 3.211223, 1, 0, 0.7215686, 1,
1.151418, -0.6511127, 2.753407, 1, 0, 0.7137255, 1,
1.160522, 0.3981349, -0.0004947324, 1, 0, 0.7098039, 1,
1.16403, 2.556799, -0.2588086, 1, 0, 0.7019608, 1,
1.171515, -1.41797, 4.484254, 1, 0, 0.6941177, 1,
1.180851, 0.1197868, 2.535706, 1, 0, 0.6901961, 1,
1.184833, -1.73413, 2.302202, 1, 0, 0.682353, 1,
1.188042, 0.6793814, 1.431129, 1, 0, 0.6784314, 1,
1.192842, 0.5037262, 0.2768199, 1, 0, 0.6705883, 1,
1.207302, 2.053986, 1.283314, 1, 0, 0.6666667, 1,
1.208789, 0.3749383, 0.9716739, 1, 0, 0.6588235, 1,
1.217901, 0.6787127, 1.746826, 1, 0, 0.654902, 1,
1.218281, -0.5170988, 3.447096, 1, 0, 0.6470588, 1,
1.22059, -1.843076, 2.238437, 1, 0, 0.6431373, 1,
1.226615, 1.919682, 1.939221, 1, 0, 0.6352941, 1,
1.235748, -0.1948015, 1.373278, 1, 0, 0.6313726, 1,
1.243965, 0.9596627, 0.8860594, 1, 0, 0.6235294, 1,
1.256242, 2.208028, 0.2142388, 1, 0, 0.6196079, 1,
1.258205, 0.05252457, -0.04773583, 1, 0, 0.6117647, 1,
1.262363, 1.355745, -0.418181, 1, 0, 0.6078432, 1,
1.264714, -0.04774399, 2.025512, 1, 0, 0.6, 1,
1.264907, -0.5038967, 2.200968, 1, 0, 0.5921569, 1,
1.271281, 0.836633, 0.590527, 1, 0, 0.5882353, 1,
1.271472, 1.209678, 1.166432, 1, 0, 0.5803922, 1,
1.27271, 0.1283306, 1.334206, 1, 0, 0.5764706, 1,
1.276511, 0.5378589, 1.237116, 1, 0, 0.5686275, 1,
1.276903, 0.7373357, 2.606367, 1, 0, 0.5647059, 1,
1.278839, 0.3257733, 1.261759, 1, 0, 0.5568628, 1,
1.281721, 0.9316873, 1.543388, 1, 0, 0.5529412, 1,
1.290097, 0.4553047, 1.805902, 1, 0, 0.5450981, 1,
1.317057, -1.115366, 4.28689, 1, 0, 0.5411765, 1,
1.327888, 0.1254948, 1.435978, 1, 0, 0.5333334, 1,
1.330192, -1.106631, 0.330525, 1, 0, 0.5294118, 1,
1.356469, -0.4402497, 0.4569321, 1, 0, 0.5215687, 1,
1.37039, -0.02996345, 1.747424, 1, 0, 0.5176471, 1,
1.380216, -1.398218, 3.600615, 1, 0, 0.509804, 1,
1.391093, 1.342292, -0.2320821, 1, 0, 0.5058824, 1,
1.395412, -0.8818578, 1.559016, 1, 0, 0.4980392, 1,
1.395722, -0.6859827, 2.84942, 1, 0, 0.4901961, 1,
1.414478, -0.4814095, 1.765719, 1, 0, 0.4862745, 1,
1.424561, -0.5198542, 2.383862, 1, 0, 0.4784314, 1,
1.436027, 1.857443, 1.651799, 1, 0, 0.4745098, 1,
1.452733, 0.2952824, 2.214932, 1, 0, 0.4666667, 1,
1.457736, -1.551441, 3.507198, 1, 0, 0.4627451, 1,
1.459495, -1.10395, 0.3643828, 1, 0, 0.454902, 1,
1.459535, -0.7412727, 2.850826, 1, 0, 0.4509804, 1,
1.477216, -0.622901, 0.9572511, 1, 0, 0.4431373, 1,
1.480421, 0.4675836, 2.27076, 1, 0, 0.4392157, 1,
1.498313, -0.3293103, 2.013972, 1, 0, 0.4313726, 1,
1.503402, -0.06360108, 1.451609, 1, 0, 0.427451, 1,
1.511059, -0.4501383, 0.2287061, 1, 0, 0.4196078, 1,
1.514798, 0.5145184, 0.2573874, 1, 0, 0.4156863, 1,
1.52001, -0.1772369, 1.971134, 1, 0, 0.4078431, 1,
1.521957, -1.214867, 2.482829, 1, 0, 0.4039216, 1,
1.532474, 0.1875023, 5.598007, 1, 0, 0.3960784, 1,
1.53416, 0.7799585, 1.260364, 1, 0, 0.3882353, 1,
1.53522, 0.1915081, 2.043192, 1, 0, 0.3843137, 1,
1.540352, 0.3500678, 0.4946813, 1, 0, 0.3764706, 1,
1.541969, 0.6096697, -0.7481623, 1, 0, 0.372549, 1,
1.549282, 0.9560878, 3.18444, 1, 0, 0.3647059, 1,
1.562075, 0.3541497, 0.826934, 1, 0, 0.3607843, 1,
1.572696, 0.05877183, -0.1119188, 1, 0, 0.3529412, 1,
1.57372, 0.242858, 0.07659217, 1, 0, 0.3490196, 1,
1.57454, -0.3182806, 1.710392, 1, 0, 0.3411765, 1,
1.586225, 2.137421, -0.6609604, 1, 0, 0.3372549, 1,
1.587625, -0.4754852, 0.6030923, 1, 0, 0.3294118, 1,
1.598903, -0.190668, 3.041222, 1, 0, 0.3254902, 1,
1.615709, 0.4267872, 1.579545, 1, 0, 0.3176471, 1,
1.63197, -0.4950426, 2.535287, 1, 0, 0.3137255, 1,
1.640871, 0.8374988, 0.8934608, 1, 0, 0.3058824, 1,
1.648123, -0.785629, 2.234324, 1, 0, 0.2980392, 1,
1.655371, 0.4460554, 2.47999, 1, 0, 0.2941177, 1,
1.677967, 1.096069, 2.344848, 1, 0, 0.2862745, 1,
1.679015, 0.962786, 1.378697, 1, 0, 0.282353, 1,
1.680786, -1.091904, 2.895836, 1, 0, 0.2745098, 1,
1.6813, -0.2806946, 1.323329, 1, 0, 0.2705882, 1,
1.682202, -0.2056906, -0.6382716, 1, 0, 0.2627451, 1,
1.69615, -0.519206, 1.99363, 1, 0, 0.2588235, 1,
1.706409, 1.106109, 2.005403, 1, 0, 0.2509804, 1,
1.711206, -0.09973668, 2.862943, 1, 0, 0.2470588, 1,
1.721187, -0.7893441, 0.929738, 1, 0, 0.2392157, 1,
1.725227, -0.7771837, 2.135792, 1, 0, 0.2352941, 1,
1.733168, -0.8661913, 3.273014, 1, 0, 0.227451, 1,
1.736533, 0.3458217, 0.597311, 1, 0, 0.2235294, 1,
1.74255, -0.5528836, 1.891715, 1, 0, 0.2156863, 1,
1.74755, 0.06404991, 1.630366, 1, 0, 0.2117647, 1,
1.759947, 1.893256, -0.1663009, 1, 0, 0.2039216, 1,
1.789733, 0.009411458, 0.1248689, 1, 0, 0.1960784, 1,
1.790514, 0.6272949, 1.268567, 1, 0, 0.1921569, 1,
1.831589, -0.1211073, 0.4916978, 1, 0, 0.1843137, 1,
1.837502, -0.5400922, 1.747048, 1, 0, 0.1803922, 1,
1.857485, -1.458018, 2.187605, 1, 0, 0.172549, 1,
1.862992, -0.8993155, 1.776666, 1, 0, 0.1686275, 1,
1.878856, 0.2646569, -0.05692071, 1, 0, 0.1607843, 1,
1.882687, -0.3943209, 0.5620477, 1, 0, 0.1568628, 1,
1.890062, -0.1763329, 1.074373, 1, 0, 0.1490196, 1,
1.900098, 1.23062, 0.06253212, 1, 0, 0.145098, 1,
1.916381, 1.675708, 0.5919489, 1, 0, 0.1372549, 1,
1.942763, 1.794255, 0.8592567, 1, 0, 0.1333333, 1,
1.964312, -2.007539, 2.376408, 1, 0, 0.1254902, 1,
1.985734, -0.6617399, 0.395695, 1, 0, 0.1215686, 1,
2.002557, -0.4748928, 0.1004137, 1, 0, 0.1137255, 1,
2.015633, 1.03476, 2.395577, 1, 0, 0.1098039, 1,
2.020474, 0.6915892, 0.6449807, 1, 0, 0.1019608, 1,
2.021223, 0.9051595, 1.710295, 1, 0, 0.09411765, 1,
2.041828, -3.184886, 3.443927, 1, 0, 0.09019608, 1,
2.098296, 1.201035, -0.2708012, 1, 0, 0.08235294, 1,
2.104827, -0.513033, 1.434738, 1, 0, 0.07843138, 1,
2.144564, -0.04867391, 1.307684, 1, 0, 0.07058824, 1,
2.144573, 0.06696321, 0.5421985, 1, 0, 0.06666667, 1,
2.199824, -0.07301033, 0.4752779, 1, 0, 0.05882353, 1,
2.262434, -1.953375, 1.218117, 1, 0, 0.05490196, 1,
2.27912, -0.9182696, 2.543175, 1, 0, 0.04705882, 1,
2.289516, -0.7222395, 1.890944, 1, 0, 0.04313726, 1,
2.379858, -1.044677, 2.811984, 1, 0, 0.03529412, 1,
2.577044, 1.365014, 2.340718, 1, 0, 0.03137255, 1,
2.59115, -0.3658845, 1.283304, 1, 0, 0.02352941, 1,
2.638288, 1.433995, 1.107026, 1, 0, 0.01960784, 1,
2.811467, -0.2609408, 0.9389852, 1, 0, 0.01176471, 1,
3.298327, -0.2154704, 2.452852, 1, 0, 0.007843138, 1
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
0.1413844, -4.983517, -7.882275, 0, -0.5, 0.5, 0.5,
0.1413844, -4.983517, -7.882275, 1, -0.5, 0.5, 0.5,
0.1413844, -4.983517, -7.882275, 1, 1.5, 0.5, 0.5,
0.1413844, -4.983517, -7.882275, 0, 1.5, 0.5, 0.5
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
-4.085763, -0.4511169, -7.882275, 0, -0.5, 0.5, 0.5,
-4.085763, -0.4511169, -7.882275, 1, -0.5, 0.5, 0.5,
-4.085763, -0.4511169, -7.882275, 1, 1.5, 0.5, 0.5,
-4.085763, -0.4511169, -7.882275, 0, 1.5, 0.5, 0.5
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
-4.085763, -4.983517, -0.1652601, 0, -0.5, 0.5, 0.5,
-4.085763, -4.983517, -0.1652601, 1, -0.5, 0.5, 0.5,
-4.085763, -4.983517, -0.1652601, 1, 1.5, 0.5, 0.5,
-4.085763, -4.983517, -0.1652601, 0, 1.5, 0.5, 0.5
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
-3, -3.937578, -6.101425,
3, -3.937578, -6.101425,
-3, -3.937578, -6.101425,
-3, -4.111901, -6.398233,
-2, -3.937578, -6.101425,
-2, -4.111901, -6.398233,
-1, -3.937578, -6.101425,
-1, -4.111901, -6.398233,
0, -3.937578, -6.101425,
0, -4.111901, -6.398233,
1, -3.937578, -6.101425,
1, -4.111901, -6.398233,
2, -3.937578, -6.101425,
2, -4.111901, -6.398233,
3, -3.937578, -6.101425,
3, -4.111901, -6.398233
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
-3, -4.460547, -6.99185, 0, -0.5, 0.5, 0.5,
-3, -4.460547, -6.99185, 1, -0.5, 0.5, 0.5,
-3, -4.460547, -6.99185, 1, 1.5, 0.5, 0.5,
-3, -4.460547, -6.99185, 0, 1.5, 0.5, 0.5,
-2, -4.460547, -6.99185, 0, -0.5, 0.5, 0.5,
-2, -4.460547, -6.99185, 1, -0.5, 0.5, 0.5,
-2, -4.460547, -6.99185, 1, 1.5, 0.5, 0.5,
-2, -4.460547, -6.99185, 0, 1.5, 0.5, 0.5,
-1, -4.460547, -6.99185, 0, -0.5, 0.5, 0.5,
-1, -4.460547, -6.99185, 1, -0.5, 0.5, 0.5,
-1, -4.460547, -6.99185, 1, 1.5, 0.5, 0.5,
-1, -4.460547, -6.99185, 0, 1.5, 0.5, 0.5,
0, -4.460547, -6.99185, 0, -0.5, 0.5, 0.5,
0, -4.460547, -6.99185, 1, -0.5, 0.5, 0.5,
0, -4.460547, -6.99185, 1, 1.5, 0.5, 0.5,
0, -4.460547, -6.99185, 0, 1.5, 0.5, 0.5,
1, -4.460547, -6.99185, 0, -0.5, 0.5, 0.5,
1, -4.460547, -6.99185, 1, -0.5, 0.5, 0.5,
1, -4.460547, -6.99185, 1, 1.5, 0.5, 0.5,
1, -4.460547, -6.99185, 0, 1.5, 0.5, 0.5,
2, -4.460547, -6.99185, 0, -0.5, 0.5, 0.5,
2, -4.460547, -6.99185, 1, -0.5, 0.5, 0.5,
2, -4.460547, -6.99185, 1, 1.5, 0.5, 0.5,
2, -4.460547, -6.99185, 0, 1.5, 0.5, 0.5,
3, -4.460547, -6.99185, 0, -0.5, 0.5, 0.5,
3, -4.460547, -6.99185, 1, -0.5, 0.5, 0.5,
3, -4.460547, -6.99185, 1, 1.5, 0.5, 0.5,
3, -4.460547, -6.99185, 0, 1.5, 0.5, 0.5
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
-3.110267, -3, -6.101425,
-3.110267, 2, -6.101425,
-3.110267, -3, -6.101425,
-3.27285, -3, -6.398233,
-3.110267, -2, -6.101425,
-3.27285, -2, -6.398233,
-3.110267, -1, -6.101425,
-3.27285, -1, -6.398233,
-3.110267, 0, -6.101425,
-3.27285, 0, -6.398233,
-3.110267, 1, -6.101425,
-3.27285, 1, -6.398233,
-3.110267, 2, -6.101425,
-3.27285, 2, -6.398233
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
-3.598015, -3, -6.99185, 0, -0.5, 0.5, 0.5,
-3.598015, -3, -6.99185, 1, -0.5, 0.5, 0.5,
-3.598015, -3, -6.99185, 1, 1.5, 0.5, 0.5,
-3.598015, -3, -6.99185, 0, 1.5, 0.5, 0.5,
-3.598015, -2, -6.99185, 0, -0.5, 0.5, 0.5,
-3.598015, -2, -6.99185, 1, -0.5, 0.5, 0.5,
-3.598015, -2, -6.99185, 1, 1.5, 0.5, 0.5,
-3.598015, -2, -6.99185, 0, 1.5, 0.5, 0.5,
-3.598015, -1, -6.99185, 0, -0.5, 0.5, 0.5,
-3.598015, -1, -6.99185, 1, -0.5, 0.5, 0.5,
-3.598015, -1, -6.99185, 1, 1.5, 0.5, 0.5,
-3.598015, -1, -6.99185, 0, 1.5, 0.5, 0.5,
-3.598015, 0, -6.99185, 0, -0.5, 0.5, 0.5,
-3.598015, 0, -6.99185, 1, -0.5, 0.5, 0.5,
-3.598015, 0, -6.99185, 1, 1.5, 0.5, 0.5,
-3.598015, 0, -6.99185, 0, 1.5, 0.5, 0.5,
-3.598015, 1, -6.99185, 0, -0.5, 0.5, 0.5,
-3.598015, 1, -6.99185, 1, -0.5, 0.5, 0.5,
-3.598015, 1, -6.99185, 1, 1.5, 0.5, 0.5,
-3.598015, 1, -6.99185, 0, 1.5, 0.5, 0.5,
-3.598015, 2, -6.99185, 0, -0.5, 0.5, 0.5,
-3.598015, 2, -6.99185, 1, -0.5, 0.5, 0.5,
-3.598015, 2, -6.99185, 1, 1.5, 0.5, 0.5,
-3.598015, 2, -6.99185, 0, 1.5, 0.5, 0.5
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
-3.110267, -3.937578, -4,
-3.110267, -3.937578, 4,
-3.110267, -3.937578, -4,
-3.27285, -4.111901, -4,
-3.110267, -3.937578, -2,
-3.27285, -4.111901, -2,
-3.110267, -3.937578, 0,
-3.27285, -4.111901, 0,
-3.110267, -3.937578, 2,
-3.27285, -4.111901, 2,
-3.110267, -3.937578, 4,
-3.27285, -4.111901, 4
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
-3.598015, -4.460547, -4, 0, -0.5, 0.5, 0.5,
-3.598015, -4.460547, -4, 1, -0.5, 0.5, 0.5,
-3.598015, -4.460547, -4, 1, 1.5, 0.5, 0.5,
-3.598015, -4.460547, -4, 0, 1.5, 0.5, 0.5,
-3.598015, -4.460547, -2, 0, -0.5, 0.5, 0.5,
-3.598015, -4.460547, -2, 1, -0.5, 0.5, 0.5,
-3.598015, -4.460547, -2, 1, 1.5, 0.5, 0.5,
-3.598015, -4.460547, -2, 0, 1.5, 0.5, 0.5,
-3.598015, -4.460547, 0, 0, -0.5, 0.5, 0.5,
-3.598015, -4.460547, 0, 1, -0.5, 0.5, 0.5,
-3.598015, -4.460547, 0, 1, 1.5, 0.5, 0.5,
-3.598015, -4.460547, 0, 0, 1.5, 0.5, 0.5,
-3.598015, -4.460547, 2, 0, -0.5, 0.5, 0.5,
-3.598015, -4.460547, 2, 1, -0.5, 0.5, 0.5,
-3.598015, -4.460547, 2, 1, 1.5, 0.5, 0.5,
-3.598015, -4.460547, 2, 0, 1.5, 0.5, 0.5,
-3.598015, -4.460547, 4, 0, -0.5, 0.5, 0.5,
-3.598015, -4.460547, 4, 1, -0.5, 0.5, 0.5,
-3.598015, -4.460547, 4, 1, 1.5, 0.5, 0.5,
-3.598015, -4.460547, 4, 0, 1.5, 0.5, 0.5
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
-3.110267, -3.937578, -6.101425,
-3.110267, 3.035344, -6.101425,
-3.110267, -3.937578, 5.770905,
-3.110267, 3.035344, 5.770905,
-3.110267, -3.937578, -6.101425,
-3.110267, -3.937578, 5.770905,
-3.110267, 3.035344, -6.101425,
-3.110267, 3.035344, 5.770905,
-3.110267, -3.937578, -6.101425,
3.393036, -3.937578, -6.101425,
-3.110267, -3.937578, 5.770905,
3.393036, -3.937578, 5.770905,
-3.110267, 3.035344, -6.101425,
3.393036, 3.035344, -6.101425,
-3.110267, 3.035344, 5.770905,
3.393036, 3.035344, 5.770905,
3.393036, -3.937578, -6.101425,
3.393036, 3.035344, -6.101425,
3.393036, -3.937578, 5.770905,
3.393036, 3.035344, 5.770905,
3.393036, -3.937578, -6.101425,
3.393036, -3.937578, 5.770905,
3.393036, 3.035344, -6.101425,
3.393036, 3.035344, 5.770905
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
var radius = 8.131015;
var distance = 36.1758;
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
mvMatrix.translate( -0.1413844, 0.4511169, 0.1652601 );
mvMatrix.scale( 1.351838, 1.260793, 0.740496 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.1758);
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


