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
-2.993586, 0.7343996, 0.01957612, 1, 0, 0, 1,
-2.856511, 0.04028634, -0.7266382, 1, 0.007843138, 0, 1,
-2.70809, -0.5155734, -3.498965, 1, 0.01176471, 0, 1,
-2.693754, 1.300081, -3.327535, 1, 0.01960784, 0, 1,
-2.69132, -0.3541805, -2.813594, 1, 0.02352941, 0, 1,
-2.617663, -0.4253012, -1.339607, 1, 0.03137255, 0, 1,
-2.562147, -0.7618117, -1.313003, 1, 0.03529412, 0, 1,
-2.53094, 0.444939, -1.10242, 1, 0.04313726, 0, 1,
-2.507007, 0.115407, -2.889516, 1, 0.04705882, 0, 1,
-2.303819, 0.4916241, -0.197347, 1, 0.05490196, 0, 1,
-2.280648, 1.094351, -0.02810115, 1, 0.05882353, 0, 1,
-2.278476, -0.03666322, -1.717477, 1, 0.06666667, 0, 1,
-2.273928, -2.2299, -2.193374, 1, 0.07058824, 0, 1,
-2.256356, -0.3551594, -2.797954, 1, 0.07843138, 0, 1,
-2.253629, -2.287422, -2.361391, 1, 0.08235294, 0, 1,
-2.223635, 0.7709165, -2.163144, 1, 0.09019608, 0, 1,
-2.207995, -0.7459319, -1.156424, 1, 0.09411765, 0, 1,
-2.194269, -0.2127169, -3.225902, 1, 0.1019608, 0, 1,
-2.178918, -0.428293, -2.857347, 1, 0.1098039, 0, 1,
-2.173306, 1.526969, -0.5005283, 1, 0.1137255, 0, 1,
-2.129543, -0.3707652, -1.71048, 1, 0.1215686, 0, 1,
-2.068528, 0.41956, -2.686028, 1, 0.1254902, 0, 1,
-2.045816, 1.233945, -0.9977252, 1, 0.1333333, 0, 1,
-2.027229, -0.9991951, -1.932558, 1, 0.1372549, 0, 1,
-2.013335, -0.4352286, -1.042889, 1, 0.145098, 0, 1,
-2.012021, -1.212213, -0.7380103, 1, 0.1490196, 0, 1,
-1.980271, -0.2456614, -2.289953, 1, 0.1568628, 0, 1,
-1.969164, 1.851168, 0.05182921, 1, 0.1607843, 0, 1,
-1.961087, 0.2240183, -1.718028, 1, 0.1686275, 0, 1,
-1.95001, -1.337345, -1.71586, 1, 0.172549, 0, 1,
-1.948594, -0.2606162, -3.76397, 1, 0.1803922, 0, 1,
-1.935995, 1.049933, -0.7861044, 1, 0.1843137, 0, 1,
-1.923591, -0.9993292, -2.237111, 1, 0.1921569, 0, 1,
-1.895658, 0.2254069, -2.280951, 1, 0.1960784, 0, 1,
-1.891159, -0.9672335, -3.793158, 1, 0.2039216, 0, 1,
-1.88772, 1.165651, -1.288265, 1, 0.2117647, 0, 1,
-1.873006, -1.524562, -1.855043, 1, 0.2156863, 0, 1,
-1.837058, -2.057114, -1.353642, 1, 0.2235294, 0, 1,
-1.830098, -0.832521, -1.204103, 1, 0.227451, 0, 1,
-1.814981, 0.3999684, -2.589009, 1, 0.2352941, 0, 1,
-1.81089, -1.58708, -2.674567, 1, 0.2392157, 0, 1,
-1.805962, 1.058597, -1.228908, 1, 0.2470588, 0, 1,
-1.794862, 1.158367, -0.7217993, 1, 0.2509804, 0, 1,
-1.79274, 0.2616655, -3.448729, 1, 0.2588235, 0, 1,
-1.791787, 0.4804512, -0.1833665, 1, 0.2627451, 0, 1,
-1.785032, 0.6651784, -1.15908, 1, 0.2705882, 0, 1,
-1.768763, 1.145397, -0.7250596, 1, 0.2745098, 0, 1,
-1.762657, 1.291583, -0.05259107, 1, 0.282353, 0, 1,
-1.752465, 0.2368531, -3.200295, 1, 0.2862745, 0, 1,
-1.739151, 1.098519, -0.4322946, 1, 0.2941177, 0, 1,
-1.737131, 0.9771926, -0.1061473, 1, 0.3019608, 0, 1,
-1.72662, -1.848014, -2.544228, 1, 0.3058824, 0, 1,
-1.723084, -1.365608, -2.293431, 1, 0.3137255, 0, 1,
-1.708145, 0.6058111, -2.305617, 1, 0.3176471, 0, 1,
-1.707814, 0.4402055, -0.775988, 1, 0.3254902, 0, 1,
-1.685252, -0.3755849, -0.3367113, 1, 0.3294118, 0, 1,
-1.67069, 0.1577808, -2.90066, 1, 0.3372549, 0, 1,
-1.654149, -1.369866, -2.530809, 1, 0.3411765, 0, 1,
-1.638105, 0.2845509, -4.596658, 1, 0.3490196, 0, 1,
-1.627591, 1.098642, -0.7118245, 1, 0.3529412, 0, 1,
-1.62409, 0.5524075, -1.000717, 1, 0.3607843, 0, 1,
-1.612586, 1.938326, -0.4004959, 1, 0.3647059, 0, 1,
-1.594446, -0.9106642, -2.708359, 1, 0.372549, 0, 1,
-1.580844, -0.4799273, -1.375931, 1, 0.3764706, 0, 1,
-1.577034, -0.3943842, -1.760018, 1, 0.3843137, 0, 1,
-1.559651, -1.056541, -3.609296, 1, 0.3882353, 0, 1,
-1.555992, 1.711645, 0.3268937, 1, 0.3960784, 0, 1,
-1.552181, -1.099512, -2.189221, 1, 0.4039216, 0, 1,
-1.548083, -1.45221, -2.071861, 1, 0.4078431, 0, 1,
-1.536902, 0.8368872, -3.197072, 1, 0.4156863, 0, 1,
-1.518389, 0.7363813, -0.6819052, 1, 0.4196078, 0, 1,
-1.510017, -0.7001495, -1.264196, 1, 0.427451, 0, 1,
-1.500688, -0.5074931, -1.154726, 1, 0.4313726, 0, 1,
-1.500573, 0.964515, -1.369605, 1, 0.4392157, 0, 1,
-1.499686, 0.687258, -1.015317, 1, 0.4431373, 0, 1,
-1.485182, -0.6238829, -3.085857, 1, 0.4509804, 0, 1,
-1.483055, -0.366411, -3.129975, 1, 0.454902, 0, 1,
-1.481713, -0.8946378, -2.439477, 1, 0.4627451, 0, 1,
-1.458533, -1.443883, -2.722856, 1, 0.4666667, 0, 1,
-1.458121, -0.5652731, -0.6438102, 1, 0.4745098, 0, 1,
-1.455529, 1.352518, -1.31656, 1, 0.4784314, 0, 1,
-1.427872, -1.147136, -2.515295, 1, 0.4862745, 0, 1,
-1.419066, 1.658183, -0.6063734, 1, 0.4901961, 0, 1,
-1.415757, -1.397008, -4.011323, 1, 0.4980392, 0, 1,
-1.407742, 1.140254, -2.805973, 1, 0.5058824, 0, 1,
-1.406025, 2.353281, -0.7191969, 1, 0.509804, 0, 1,
-1.391372, -0.04101838, -1.709853, 1, 0.5176471, 0, 1,
-1.390504, -0.3108156, -3.331901, 1, 0.5215687, 0, 1,
-1.385635, -0.4623945, -1.21912, 1, 0.5294118, 0, 1,
-1.376595, 1.366991, -0.8213468, 1, 0.5333334, 0, 1,
-1.374615, 0.4182961, -2.838596, 1, 0.5411765, 0, 1,
-1.364554, -1.035705, -1.988583, 1, 0.5450981, 0, 1,
-1.359354, 0.1165551, -1.570649, 1, 0.5529412, 0, 1,
-1.357076, 2.470594, -1.060075, 1, 0.5568628, 0, 1,
-1.348873, -1.191498, -4.659393, 1, 0.5647059, 0, 1,
-1.348285, 1.409296, -0.9330093, 1, 0.5686275, 0, 1,
-1.343595, -1.53623, -3.828346, 1, 0.5764706, 0, 1,
-1.339552, 0.0007773477, -3.329654, 1, 0.5803922, 0, 1,
-1.334395, -1.244683, -2.442233, 1, 0.5882353, 0, 1,
-1.333616, -0.8532978, -0.9852017, 1, 0.5921569, 0, 1,
-1.330219, -0.3095565, -1.78886, 1, 0.6, 0, 1,
-1.327245, -0.07624182, -0.2470444, 1, 0.6078432, 0, 1,
-1.323508, 0.2563781, -0.8359224, 1, 0.6117647, 0, 1,
-1.312207, -0.4594446, -3.303149, 1, 0.6196079, 0, 1,
-1.306883, -0.4735352, -0.7987276, 1, 0.6235294, 0, 1,
-1.290889, 1.287684, 0.5395874, 1, 0.6313726, 0, 1,
-1.287714, 2.824774, -0.3653684, 1, 0.6352941, 0, 1,
-1.28272, -0.3951476, -2.109495, 1, 0.6431373, 0, 1,
-1.273438, 0.8086045, -1.343542, 1, 0.6470588, 0, 1,
-1.272719, -0.2872349, -4.187849, 1, 0.654902, 0, 1,
-1.26984, -0.5853209, -2.547278, 1, 0.6588235, 0, 1,
-1.267155, 0.30843, -2.883376, 1, 0.6666667, 0, 1,
-1.263471, -1.311733, -3.091426, 1, 0.6705883, 0, 1,
-1.260754, 1.325651, -1.009533, 1, 0.6784314, 0, 1,
-1.258036, -0.1389231, -2.320195, 1, 0.682353, 0, 1,
-1.253885, -1.403274, -1.312627, 1, 0.6901961, 0, 1,
-1.253611, -0.04371855, -4.089382, 1, 0.6941177, 0, 1,
-1.251802, -0.5276579, -2.694506, 1, 0.7019608, 0, 1,
-1.244993, 0.5100895, -1.235061, 1, 0.7098039, 0, 1,
-1.241193, -0.1485408, -2.313975, 1, 0.7137255, 0, 1,
-1.235559, -0.2108509, -1.659509, 1, 0.7215686, 0, 1,
-1.232433, -1.066126, -0.7507687, 1, 0.7254902, 0, 1,
-1.228154, 0.1863276, -2.565728, 1, 0.7333333, 0, 1,
-1.225864, 1.99438, -0.491292, 1, 0.7372549, 0, 1,
-1.217849, 1.505516, 1.083989, 1, 0.7450981, 0, 1,
-1.216683, -0.8810169, -3.197634, 1, 0.7490196, 0, 1,
-1.216027, -0.04169904, -2.170966, 1, 0.7568628, 0, 1,
-1.214714, -0.6004833, -1.08659, 1, 0.7607843, 0, 1,
-1.207658, 0.2840747, -1.846043, 1, 0.7686275, 0, 1,
-1.19989, 0.4564885, -1.637172, 1, 0.772549, 0, 1,
-1.181542, 0.7925014, -1.926131, 1, 0.7803922, 0, 1,
-1.181369, -0.04316508, -3.200942, 1, 0.7843137, 0, 1,
-1.170456, -0.5175245, -3.999809, 1, 0.7921569, 0, 1,
-1.147588, 0.4056226, 0.5805197, 1, 0.7960784, 0, 1,
-1.137074, -0.1419255, -0.9561862, 1, 0.8039216, 0, 1,
-1.136587, -0.4514579, -1.91257, 1, 0.8117647, 0, 1,
-1.128135, 0.7135211, 0.2770155, 1, 0.8156863, 0, 1,
-1.124486, -0.06676839, -0.3169065, 1, 0.8235294, 0, 1,
-1.122627, -0.3096183, -2.23155, 1, 0.827451, 0, 1,
-1.115994, -1.68293, -0.07059314, 1, 0.8352941, 0, 1,
-1.114071, -0.4274093, -3.156661, 1, 0.8392157, 0, 1,
-1.111029, 0.3489828, -0.1281507, 1, 0.8470588, 0, 1,
-1.103608, -0.7911286, -2.171521, 1, 0.8509804, 0, 1,
-1.097975, -2.141432, -3.173732, 1, 0.8588235, 0, 1,
-1.093795, -0.5762441, -2.351608, 1, 0.8627451, 0, 1,
-1.092681, 0.6743558, -1.575287, 1, 0.8705882, 0, 1,
-1.088189, -0.5494109, -1.984496, 1, 0.8745098, 0, 1,
-1.084445, 0.1213414, -2.039045, 1, 0.8823529, 0, 1,
-1.082827, 0.33547, -1.648495, 1, 0.8862745, 0, 1,
-1.080481, 1.446935, 0.668126, 1, 0.8941177, 0, 1,
-1.079846, -0.2423115, -2.292594, 1, 0.8980392, 0, 1,
-1.072071, 0.5556378, 0.5362905, 1, 0.9058824, 0, 1,
-1.060621, -1.221458, -4.359643, 1, 0.9137255, 0, 1,
-1.060049, 0.8081515, -1.688295, 1, 0.9176471, 0, 1,
-1.053648, -0.01030642, -2.704606, 1, 0.9254902, 0, 1,
-1.045501, -1.453278, -1.653378, 1, 0.9294118, 0, 1,
-1.041502, -1.490993, -3.306724, 1, 0.9372549, 0, 1,
-1.037617, 1.382303, -0.3575146, 1, 0.9411765, 0, 1,
-1.037478, -0.430758, -2.032942, 1, 0.9490196, 0, 1,
-1.027105, 1.45439, -1.066285, 1, 0.9529412, 0, 1,
-1.018252, 0.234836, -2.075293, 1, 0.9607843, 0, 1,
-1.017453, 0.1616583, -1.941813, 1, 0.9647059, 0, 1,
-1.004589, 0.2466089, -0.514468, 1, 0.972549, 0, 1,
-0.9981433, 1.154322, -0.9809942, 1, 0.9764706, 0, 1,
-0.9969457, -0.1480947, -2.05427, 1, 0.9843137, 0, 1,
-0.9949699, -0.5730963, -2.455022, 1, 0.9882353, 0, 1,
-0.9944878, 0.6823736, -0.9240372, 1, 0.9960784, 0, 1,
-0.9940122, 0.2629712, -0.8795487, 0.9960784, 1, 0, 1,
-0.9901763, -0.07454026, -1.091365, 0.9921569, 1, 0, 1,
-0.984372, 0.2502369, -0.9121559, 0.9843137, 1, 0, 1,
-0.9777127, -0.628664, -1.713667, 0.9803922, 1, 0, 1,
-0.9653807, -0.9391395, -4.427781, 0.972549, 1, 0, 1,
-0.9559017, 0.5195491, 0.1872285, 0.9686275, 1, 0, 1,
-0.9526179, -0.7176317, -2.365485, 0.9607843, 1, 0, 1,
-0.9516007, 1.829213, 0.9297725, 0.9568627, 1, 0, 1,
-0.9443832, 1.39535, -2.234274, 0.9490196, 1, 0, 1,
-0.9422526, 1.865347, -0.007471909, 0.945098, 1, 0, 1,
-0.9382155, -1.083675, -2.948538, 0.9372549, 1, 0, 1,
-0.9351556, -1.275368, -3.077318, 0.9333333, 1, 0, 1,
-0.9350383, 0.6656492, -1.975277, 0.9254902, 1, 0, 1,
-0.9325078, 0.2513962, -1.253471, 0.9215686, 1, 0, 1,
-0.9220566, -2.009667, -3.938351, 0.9137255, 1, 0, 1,
-0.9105936, -0.5420536, -2.190649, 0.9098039, 1, 0, 1,
-0.9032007, 0.4223901, -1.54803, 0.9019608, 1, 0, 1,
-0.9025209, 1.095294, -0.9099615, 0.8941177, 1, 0, 1,
-0.9010577, 0.4669368, 0.4734987, 0.8901961, 1, 0, 1,
-0.8913359, 0.5149372, -1.943445, 0.8823529, 1, 0, 1,
-0.8760318, 1.604042, -2.89221, 0.8784314, 1, 0, 1,
-0.8685284, 0.547376, -2.147748, 0.8705882, 1, 0, 1,
-0.8666043, 0.1484745, -0.1862133, 0.8666667, 1, 0, 1,
-0.8625082, 0.7330081, 0.2598036, 0.8588235, 1, 0, 1,
-0.8599897, 0.6596271, -1.718966, 0.854902, 1, 0, 1,
-0.8598435, 1.097708, -1.061898, 0.8470588, 1, 0, 1,
-0.8597057, 0.7972656, -3.353418, 0.8431373, 1, 0, 1,
-0.8579155, 0.5549102, -0.7453197, 0.8352941, 1, 0, 1,
-0.8557958, 1.692991, -0.5988754, 0.8313726, 1, 0, 1,
-0.8483372, 2.021429, 1.026984, 0.8235294, 1, 0, 1,
-0.8420071, -0.8414741, -2.215266, 0.8196079, 1, 0, 1,
-0.840407, -0.7113601, -1.912225, 0.8117647, 1, 0, 1,
-0.8390476, 0.4316111, -2.126111, 0.8078431, 1, 0, 1,
-0.8376832, 0.008666471, -1.397278, 0.8, 1, 0, 1,
-0.8374485, -0.6547559, -2.933955, 0.7921569, 1, 0, 1,
-0.8370575, 1.854057, -1.492316, 0.7882353, 1, 0, 1,
-0.8356396, 0.98847, 0.0923104, 0.7803922, 1, 0, 1,
-0.8341689, -0.3244146, -2.557194, 0.7764706, 1, 0, 1,
-0.8281732, -1.033774, -4.036994, 0.7686275, 1, 0, 1,
-0.8200588, 0.8727483, -0.1372637, 0.7647059, 1, 0, 1,
-0.8188592, 0.7577088, -0.9621298, 0.7568628, 1, 0, 1,
-0.8184854, 0.8096881, -0.5288034, 0.7529412, 1, 0, 1,
-0.8158882, -1.006826, -2.730767, 0.7450981, 1, 0, 1,
-0.8136522, 0.6975142, 0.4904637, 0.7411765, 1, 0, 1,
-0.8133917, -1.018615, -1.44226, 0.7333333, 1, 0, 1,
-0.8105514, -0.07059918, -1.353544, 0.7294118, 1, 0, 1,
-0.8098255, -0.2433047, -1.373153, 0.7215686, 1, 0, 1,
-0.7992087, 1.205431, 0.05060368, 0.7176471, 1, 0, 1,
-0.7853894, 0.5126852, 0.0656781, 0.7098039, 1, 0, 1,
-0.7851722, -0.4422205, -1.092228, 0.7058824, 1, 0, 1,
-0.7848524, -0.8831009, -1.841559, 0.6980392, 1, 0, 1,
-0.7800366, -0.4474863, -2.234102, 0.6901961, 1, 0, 1,
-0.7661362, 0.3705688, -0.5527566, 0.6862745, 1, 0, 1,
-0.7647004, -1.173006, -2.97846, 0.6784314, 1, 0, 1,
-0.7633072, 1.025727, -1.33281, 0.6745098, 1, 0, 1,
-0.7608346, 0.1956046, -2.503339, 0.6666667, 1, 0, 1,
-0.7556044, 0.2281639, -1.700818, 0.6627451, 1, 0, 1,
-0.7555075, -2.041625, -1.565126, 0.654902, 1, 0, 1,
-0.7525538, 0.8532627, -2.396889, 0.6509804, 1, 0, 1,
-0.7521499, 0.1539581, -1.602444, 0.6431373, 1, 0, 1,
-0.74432, 0.415268, -1.679493, 0.6392157, 1, 0, 1,
-0.7437732, -0.0144278, 0.289019, 0.6313726, 1, 0, 1,
-0.7376423, 0.04304004, -1.411208, 0.627451, 1, 0, 1,
-0.7366873, 1.40979, -0.7606887, 0.6196079, 1, 0, 1,
-0.7280201, 0.9263644, -1.622765, 0.6156863, 1, 0, 1,
-0.7271583, -0.5099789, -1.326889, 0.6078432, 1, 0, 1,
-0.7212859, -1.459454, -1.325001, 0.6039216, 1, 0, 1,
-0.7178469, -0.8844281, -1.213007, 0.5960785, 1, 0, 1,
-0.7162833, -0.0712179, -1.120513, 0.5882353, 1, 0, 1,
-0.7142301, -0.7592472, -3.834241, 0.5843138, 1, 0, 1,
-0.7133896, -0.01983117, -2.459076, 0.5764706, 1, 0, 1,
-0.7129564, -0.8429127, -1.302978, 0.572549, 1, 0, 1,
-0.7123751, -1.178514, -1.685233, 0.5647059, 1, 0, 1,
-0.7070279, -0.639277, -3.601098, 0.5607843, 1, 0, 1,
-0.7055094, -0.6216263, -2.108296, 0.5529412, 1, 0, 1,
-0.7048293, 1.748062, 0.09701803, 0.5490196, 1, 0, 1,
-0.703311, -0.3381221, -2.766404, 0.5411765, 1, 0, 1,
-0.703205, -0.3324571, -3.316765, 0.5372549, 1, 0, 1,
-0.7019763, -0.6602757, -2.424803, 0.5294118, 1, 0, 1,
-0.6938173, -0.4464611, -5.157569, 0.5254902, 1, 0, 1,
-0.6917855, 1.936097, 0.7838284, 0.5176471, 1, 0, 1,
-0.6912336, -0.3309814, -2.644851, 0.5137255, 1, 0, 1,
-0.6909956, 0.540782, 0.1721878, 0.5058824, 1, 0, 1,
-0.6883938, -0.1545523, -0.5380459, 0.5019608, 1, 0, 1,
-0.6862235, -1.523892, -3.232412, 0.4941176, 1, 0, 1,
-0.6829713, -0.107075, -2.91505, 0.4862745, 1, 0, 1,
-0.6784557, 1.028176, -0.9808183, 0.4823529, 1, 0, 1,
-0.6701062, 1.372564, -0.4824755, 0.4745098, 1, 0, 1,
-0.66766, -1.869375, -3.958169, 0.4705882, 1, 0, 1,
-0.650459, 0.3328547, -0.2216466, 0.4627451, 1, 0, 1,
-0.6479533, 0.4117009, -2.419061, 0.4588235, 1, 0, 1,
-0.6460177, 0.7847759, -1.144823, 0.4509804, 1, 0, 1,
-0.6436574, 2.285247, -1.364267, 0.4470588, 1, 0, 1,
-0.6427078, 1.031836, -0.5549988, 0.4392157, 1, 0, 1,
-0.6423614, 1.042461, -0.5999442, 0.4352941, 1, 0, 1,
-0.642053, 0.2945321, -0.7779461, 0.427451, 1, 0, 1,
-0.640364, -0.1572216, -1.531064, 0.4235294, 1, 0, 1,
-0.6390269, 0.6062394, -0.05399648, 0.4156863, 1, 0, 1,
-0.6348422, 0.4167117, -1.693025, 0.4117647, 1, 0, 1,
-0.6323389, 1.104238, -1.811618, 0.4039216, 1, 0, 1,
-0.631974, -0.5061952, -4.112856, 0.3960784, 1, 0, 1,
-0.628207, -0.6892943, -2.174275, 0.3921569, 1, 0, 1,
-0.6276941, 0.5464607, 0.1667003, 0.3843137, 1, 0, 1,
-0.6240712, 0.2644329, -2.248431, 0.3803922, 1, 0, 1,
-0.6238034, 0.9913713, -0.6308036, 0.372549, 1, 0, 1,
-0.6193831, -0.4158282, -4.08936, 0.3686275, 1, 0, 1,
-0.6187375, 0.1247923, 0.2326962, 0.3607843, 1, 0, 1,
-0.6173985, -0.1428931, -0.633069, 0.3568628, 1, 0, 1,
-0.6164854, -2.266581, -1.185882, 0.3490196, 1, 0, 1,
-0.6121493, 0.8356459, -0.5421271, 0.345098, 1, 0, 1,
-0.6113714, -0.6983141, -1.983258, 0.3372549, 1, 0, 1,
-0.611158, -0.07530162, -1.449543, 0.3333333, 1, 0, 1,
-0.6110994, -0.6634908, -1.32353, 0.3254902, 1, 0, 1,
-0.6105146, 1.299485, -2.009257, 0.3215686, 1, 0, 1,
-0.6085429, 0.6998202, -0.8189488, 0.3137255, 1, 0, 1,
-0.6017323, -0.2285872, -1.340791, 0.3098039, 1, 0, 1,
-0.6007132, 0.3810371, -0.3796821, 0.3019608, 1, 0, 1,
-0.5992031, -0.32518, -1.618066, 0.2941177, 1, 0, 1,
-0.5991281, 0.2254429, -1.939829, 0.2901961, 1, 0, 1,
-0.599009, -0.7492893, -1.901201, 0.282353, 1, 0, 1,
-0.5970968, 0.4102042, -0.1986337, 0.2784314, 1, 0, 1,
-0.5909609, -0.3918832, -1.875673, 0.2705882, 1, 0, 1,
-0.5908906, -0.1628342, -2.332203, 0.2666667, 1, 0, 1,
-0.5897528, -0.1523178, -2.608627, 0.2588235, 1, 0, 1,
-0.5866334, 2.12105, -1.724924, 0.254902, 1, 0, 1,
-0.5836481, -0.4917728, -2.401826, 0.2470588, 1, 0, 1,
-0.5807244, 1.641053, 0.6989018, 0.2431373, 1, 0, 1,
-0.5768595, 0.5630836, -0.01138632, 0.2352941, 1, 0, 1,
-0.5728402, -0.1097183, -2.265561, 0.2313726, 1, 0, 1,
-0.5711712, -0.632427, -4.076511, 0.2235294, 1, 0, 1,
-0.5692412, 1.60906, -1.121764, 0.2196078, 1, 0, 1,
-0.5686321, -0.7002611, -3.357499, 0.2117647, 1, 0, 1,
-0.5664671, -0.5274965, -4.044514, 0.2078431, 1, 0, 1,
-0.5653539, -0.9159233, -2.800801, 0.2, 1, 0, 1,
-0.5603063, 0.2528946, -1.00096, 0.1921569, 1, 0, 1,
-0.5548367, -0.04005321, -1.875769, 0.1882353, 1, 0, 1,
-0.554202, -0.4729559, -2.109037, 0.1803922, 1, 0, 1,
-0.5513549, 0.3614424, -0.1843303, 0.1764706, 1, 0, 1,
-0.5416619, 0.6411329, -0.6749178, 0.1686275, 1, 0, 1,
-0.536921, -1.174317, -3.734396, 0.1647059, 1, 0, 1,
-0.5345951, -1.92629, -3.574442, 0.1568628, 1, 0, 1,
-0.5258844, 1.201594, 1.40303, 0.1529412, 1, 0, 1,
-0.5113126, -0.7585593, -1.750494, 0.145098, 1, 0, 1,
-0.5097016, -0.77412, -1.330663, 0.1411765, 1, 0, 1,
-0.4920746, -0.4994285, -1.175983, 0.1333333, 1, 0, 1,
-0.4888282, -0.1801118, -1.359937, 0.1294118, 1, 0, 1,
-0.4884686, 1.196256, 0.7593135, 0.1215686, 1, 0, 1,
-0.4850982, 0.9170542, -2.616566, 0.1176471, 1, 0, 1,
-0.4817459, 0.7099037, -0.8086411, 0.1098039, 1, 0, 1,
-0.4803977, -2.185287, -5.575817, 0.1058824, 1, 0, 1,
-0.4786572, -0.4388597, -4.601495, 0.09803922, 1, 0, 1,
-0.4775779, -0.4446211, -2.566542, 0.09019608, 1, 0, 1,
-0.4734979, 0.5564207, -1.47722, 0.08627451, 1, 0, 1,
-0.4727184, 0.919539, 0.6655418, 0.07843138, 1, 0, 1,
-0.4708276, 1.532416, -0.5417241, 0.07450981, 1, 0, 1,
-0.4692999, -0.759003, -1.686617, 0.06666667, 1, 0, 1,
-0.4691907, 0.3853673, -0.3853727, 0.0627451, 1, 0, 1,
-0.4686924, -0.5812022, -1.895509, 0.05490196, 1, 0, 1,
-0.4678184, 2.353856, 2.432661, 0.05098039, 1, 0, 1,
-0.4677514, -0.7921736, -1.734205, 0.04313726, 1, 0, 1,
-0.4664347, -0.435829, -2.354784, 0.03921569, 1, 0, 1,
-0.4659482, -0.254392, -2.846015, 0.03137255, 1, 0, 1,
-0.4652978, -0.6392076, -1.723042, 0.02745098, 1, 0, 1,
-0.4645102, -0.3205332, -2.733508, 0.01960784, 1, 0, 1,
-0.4643022, -0.2394624, -1.390656, 0.01568628, 1, 0, 1,
-0.4561673, 2.768055, 0.06203566, 0.007843138, 1, 0, 1,
-0.4541901, 2.289156, -0.09853335, 0.003921569, 1, 0, 1,
-0.4540513, -0.4064176, -1.870396, 0, 1, 0.003921569, 1,
-0.4535196, 1.93786, 1.734709, 0, 1, 0.01176471, 1,
-0.4521282, -0.9916352, -3.112175, 0, 1, 0.01568628, 1,
-0.4516736, -0.2947813, -1.457394, 0, 1, 0.02352941, 1,
-0.4490327, -1.252913, -3.150062, 0, 1, 0.02745098, 1,
-0.4484332, -1.501901, -3.148467, 0, 1, 0.03529412, 1,
-0.4477624, 0.02407831, 0.1619469, 0, 1, 0.03921569, 1,
-0.4476741, -1.218835, -1.79232, 0, 1, 0.04705882, 1,
-0.4470091, 0.08172867, -1.585946, 0, 1, 0.05098039, 1,
-0.4416854, 0.3607357, -0.456101, 0, 1, 0.05882353, 1,
-0.4401259, -0.3434637, -0.04024152, 0, 1, 0.0627451, 1,
-0.4387332, -0.4061668, -0.3563604, 0, 1, 0.07058824, 1,
-0.438698, -0.1015611, -1.424177, 0, 1, 0.07450981, 1,
-0.4276738, 1.750331, -0.8547171, 0, 1, 0.08235294, 1,
-0.4268184, 2.129894, -1.787243, 0, 1, 0.08627451, 1,
-0.4253533, -1.915897, -3.743151, 0, 1, 0.09411765, 1,
-0.4222704, 0.803167, -0.9697503, 0, 1, 0.1019608, 1,
-0.4217914, 2.187882, -1.405339, 0, 1, 0.1058824, 1,
-0.4205489, -2.70193, -2.176479, 0, 1, 0.1137255, 1,
-0.4180992, 0.658006, -1.45911, 0, 1, 0.1176471, 1,
-0.4180044, -0.1213883, -1.910898, 0, 1, 0.1254902, 1,
-0.4157736, -0.7594181, -1.942207, 0, 1, 0.1294118, 1,
-0.4155069, -0.4248343, -2.182247, 0, 1, 0.1372549, 1,
-0.4138901, -0.799754, -0.8834357, 0, 1, 0.1411765, 1,
-0.4096299, 1.858012, -1.921804, 0, 1, 0.1490196, 1,
-0.4021744, 0.6706003, 0.9740171, 0, 1, 0.1529412, 1,
-0.401366, -1.219986, -4.635189, 0, 1, 0.1607843, 1,
-0.3984042, 0.5187908, -1.788706, 0, 1, 0.1647059, 1,
-0.3939376, -0.6087247, -3.164192, 0, 1, 0.172549, 1,
-0.3927334, 0.7692593, 1.76204, 0, 1, 0.1764706, 1,
-0.384656, -1.213408, -3.450338, 0, 1, 0.1843137, 1,
-0.3806397, -0.04950885, -3.516865, 0, 1, 0.1882353, 1,
-0.3794803, 0.4503158, -1.077306, 0, 1, 0.1960784, 1,
-0.3736987, 0.2546372, -1.596046, 0, 1, 0.2039216, 1,
-0.3736951, -0.9473366, -2.964848, 0, 1, 0.2078431, 1,
-0.3736416, 1.288422, 0.002900803, 0, 1, 0.2156863, 1,
-0.3715193, -0.3243937, -2.50246, 0, 1, 0.2196078, 1,
-0.3663712, 0.2614598, -0.466368, 0, 1, 0.227451, 1,
-0.3653648, 0.4779288, -0.4098159, 0, 1, 0.2313726, 1,
-0.3645856, 0.5707865, -0.607003, 0, 1, 0.2392157, 1,
-0.3643488, -2.382577, -3.893689, 0, 1, 0.2431373, 1,
-0.3592034, -0.02440019, -1.904506, 0, 1, 0.2509804, 1,
-0.3591133, -0.1786541, -2.55915, 0, 1, 0.254902, 1,
-0.354321, 1.805041, -2.085299, 0, 1, 0.2627451, 1,
-0.3332697, -0.05585625, -0.9731795, 0, 1, 0.2666667, 1,
-0.32775, -0.6843867, -2.52792, 0, 1, 0.2745098, 1,
-0.3275101, 1.422975, 0.1215374, 0, 1, 0.2784314, 1,
-0.3213284, -0.5403512, -4.27849, 0, 1, 0.2862745, 1,
-0.3188777, 1.436758, -0.5215858, 0, 1, 0.2901961, 1,
-0.3180432, 2.178803, -0.7361513, 0, 1, 0.2980392, 1,
-0.3167016, -0.2963776, -2.474653, 0, 1, 0.3058824, 1,
-0.3143909, -1.451152, -1.915007, 0, 1, 0.3098039, 1,
-0.3122221, 0.6590751, -1.793624, 0, 1, 0.3176471, 1,
-0.3121336, -0.8124854, -2.185624, 0, 1, 0.3215686, 1,
-0.3065435, 0.6184647, 0.2975717, 0, 1, 0.3294118, 1,
-0.2994371, -1.959229, -3.313069, 0, 1, 0.3333333, 1,
-0.2977183, -0.5257792, -0.7452585, 0, 1, 0.3411765, 1,
-0.2972402, -0.3127757, -2.102197, 0, 1, 0.345098, 1,
-0.2968154, 1.455307, -0.8187138, 0, 1, 0.3529412, 1,
-0.2938452, -0.6453499, -2.10674, 0, 1, 0.3568628, 1,
-0.2907783, 0.5479788, -0.3389727, 0, 1, 0.3647059, 1,
-0.2892282, 0.6713309, -0.9331343, 0, 1, 0.3686275, 1,
-0.2848672, -0.632946, -1.647565, 0, 1, 0.3764706, 1,
-0.2773935, 1.054065, -1.674461, 0, 1, 0.3803922, 1,
-0.2665973, 1.488627, 0.8864452, 0, 1, 0.3882353, 1,
-0.2636596, 0.4032905, 0.006224485, 0, 1, 0.3921569, 1,
-0.2616904, -0.01846355, -2.681383, 0, 1, 0.4, 1,
-0.2543246, -0.2053338, -0.3788432, 0, 1, 0.4078431, 1,
-0.2537008, 0.4625294, -0.1266297, 0, 1, 0.4117647, 1,
-0.2527766, -0.1143028, -1.727896, 0, 1, 0.4196078, 1,
-0.2519977, -1.223878, -3.446147, 0, 1, 0.4235294, 1,
-0.248274, 0.2328231, -0.6116927, 0, 1, 0.4313726, 1,
-0.2480818, -0.2445937, -2.247981, 0, 1, 0.4352941, 1,
-0.2448021, -1.45441, -3.325315, 0, 1, 0.4431373, 1,
-0.2439218, -1.549679, -2.52978, 0, 1, 0.4470588, 1,
-0.2398543, 2.216013, 0.5820965, 0, 1, 0.454902, 1,
-0.2377814, 2.204717, -1.513163, 0, 1, 0.4588235, 1,
-0.2349186, -0.2105929, -3.215032, 0, 1, 0.4666667, 1,
-0.232741, 0.3071407, -1.554234, 0, 1, 0.4705882, 1,
-0.2302718, 1.384457, 2.775168, 0, 1, 0.4784314, 1,
-0.2299018, 0.7711126, -0.5771503, 0, 1, 0.4823529, 1,
-0.2225697, 0.1128667, -0.7916086, 0, 1, 0.4901961, 1,
-0.2223213, 0.1814161, -1.503148, 0, 1, 0.4941176, 1,
-0.2194529, -0.2705082, -4.981102, 0, 1, 0.5019608, 1,
-0.2173049, -0.5825472, -2.531618, 0, 1, 0.509804, 1,
-0.2134098, 2.257265, -1.251844, 0, 1, 0.5137255, 1,
-0.2130432, -0.9312034, -2.304356, 0, 1, 0.5215687, 1,
-0.2086859, 0.8013378, -0.7320698, 0, 1, 0.5254902, 1,
-0.207737, -0.6114659, -2.532989, 0, 1, 0.5333334, 1,
-0.2033157, 1.687165, -1.302093, 0, 1, 0.5372549, 1,
-0.2024566, -1.167061, -1.802174, 0, 1, 0.5450981, 1,
-0.2018213, 0.6106538, 0.2582935, 0, 1, 0.5490196, 1,
-0.1999431, 2.432831, -1.786179, 0, 1, 0.5568628, 1,
-0.1997516, 0.9662332, -0.9910229, 0, 1, 0.5607843, 1,
-0.1960006, 0.8250951, -1.639281, 0, 1, 0.5686275, 1,
-0.1932876, -0.8671382, -3.342745, 0, 1, 0.572549, 1,
-0.1892891, -1.468949, -1.596707, 0, 1, 0.5803922, 1,
-0.1872789, -1.022666, -3.460643, 0, 1, 0.5843138, 1,
-0.1796651, 2.274192, 1.232165, 0, 1, 0.5921569, 1,
-0.1783808, -1.284792, -2.572069, 0, 1, 0.5960785, 1,
-0.1767161, 0.8075491, 1.32775, 0, 1, 0.6039216, 1,
-0.1730266, -1.007881, -2.84707, 0, 1, 0.6117647, 1,
-0.1729612, 0.6626154, -0.7442574, 0, 1, 0.6156863, 1,
-0.167294, 1.280908, 0.06917645, 0, 1, 0.6235294, 1,
-0.1643799, -1.336601, -2.53608, 0, 1, 0.627451, 1,
-0.1582216, -0.6544084, -3.900635, 0, 1, 0.6352941, 1,
-0.1569012, -0.8688384, -3.689568, 0, 1, 0.6392157, 1,
-0.1568242, 0.425964, -1.317136, 0, 1, 0.6470588, 1,
-0.1564535, 2.608987, -0.9743438, 0, 1, 0.6509804, 1,
-0.1564472, 0.7177171, -1.194522, 0, 1, 0.6588235, 1,
-0.1531494, -0.578365, -1.209452, 0, 1, 0.6627451, 1,
-0.1506198, 0.538289, 1.090349, 0, 1, 0.6705883, 1,
-0.1503156, 0.7840157, 0.6428902, 0, 1, 0.6745098, 1,
-0.1472839, -1.290388, -2.931772, 0, 1, 0.682353, 1,
-0.139771, -0.5935287, -1.678102, 0, 1, 0.6862745, 1,
-0.1360785, 0.08019199, -0.2506412, 0, 1, 0.6941177, 1,
-0.1318064, -0.4273455, -1.071228, 0, 1, 0.7019608, 1,
-0.1305119, -0.2254735, -3.290419, 0, 1, 0.7058824, 1,
-0.1264538, 0.8314002, -0.7599396, 0, 1, 0.7137255, 1,
-0.1224233, 0.3430401, -0.1341633, 0, 1, 0.7176471, 1,
-0.1176158, -0.9921784, -3.787988, 0, 1, 0.7254902, 1,
-0.1148447, -0.2738965, -2.034186, 0, 1, 0.7294118, 1,
-0.1035396, 0.7486388, 0.2914732, 0, 1, 0.7372549, 1,
-0.1027456, -2.104921, -3.919936, 0, 1, 0.7411765, 1,
-0.1002841, 0.4217815, -0.5151519, 0, 1, 0.7490196, 1,
-0.09814032, -1.129854, -4.492873, 0, 1, 0.7529412, 1,
-0.09792254, -0.9334608, -1.982316, 0, 1, 0.7607843, 1,
-0.09537446, -0.6738449, -3.820404, 0, 1, 0.7647059, 1,
-0.09417187, -0.07676628, -2.313207, 0, 1, 0.772549, 1,
-0.09346464, 0.6990013, -1.674917, 0, 1, 0.7764706, 1,
-0.09330484, -1.302507, -2.137752, 0, 1, 0.7843137, 1,
-0.08963612, -0.3503048, -3.747204, 0, 1, 0.7882353, 1,
-0.08866206, -1.301973, -1.851654, 0, 1, 0.7960784, 1,
-0.08209598, 0.1121904, 0.3958115, 0, 1, 0.8039216, 1,
-0.07973231, -1.558096, -3.859764, 0, 1, 0.8078431, 1,
-0.07967122, -0.414832, -3.368708, 0, 1, 0.8156863, 1,
-0.07953984, -1.836562, -3.908589, 0, 1, 0.8196079, 1,
-0.07766476, 0.5532756, -0.750904, 0, 1, 0.827451, 1,
-0.07740196, 1.824235, 1.718972, 0, 1, 0.8313726, 1,
-0.06901845, -0.9772846, -3.936336, 0, 1, 0.8392157, 1,
-0.05886228, 0.05729864, -3.14641, 0, 1, 0.8431373, 1,
-0.05417306, -0.2452986, -3.84506, 0, 1, 0.8509804, 1,
-0.05346655, 0.1247122, 0.5604779, 0, 1, 0.854902, 1,
-0.05131173, 1.009114, 0.3045535, 0, 1, 0.8627451, 1,
-0.04911548, -0.05911177, -1.620707, 0, 1, 0.8666667, 1,
-0.04717421, 1.557781, -0.8881835, 0, 1, 0.8745098, 1,
-0.04622372, 3.322064, 1.167383, 0, 1, 0.8784314, 1,
-0.04025014, 0.7629818, 0.6398999, 0, 1, 0.8862745, 1,
-0.04003352, 2.014057, -0.4879221, 0, 1, 0.8901961, 1,
-0.03904792, 0.7486428, -1.148866, 0, 1, 0.8980392, 1,
-0.03134941, -0.2557857, -3.547831, 0, 1, 0.9058824, 1,
-0.02975158, -1.392063, -1.2801, 0, 1, 0.9098039, 1,
-0.0272847, -0.6315107, -2.015632, 0, 1, 0.9176471, 1,
-0.02275124, 0.3971958, 0.4477338, 0, 1, 0.9215686, 1,
-0.01999808, -0.2306483, -3.416181, 0, 1, 0.9294118, 1,
-0.01488823, -0.1202689, -2.416919, 0, 1, 0.9333333, 1,
-0.01449707, -1.277386, -4.621366, 0, 1, 0.9411765, 1,
-0.01426853, 0.4205249, -2.206601, 0, 1, 0.945098, 1,
-0.01310111, -0.6812613, -3.646835, 0, 1, 0.9529412, 1,
-0.01126838, -0.4008307, -2.943167, 0, 1, 0.9568627, 1,
-0.01089052, 0.4971197, 0.4584686, 0, 1, 0.9647059, 1,
-0.01028549, 1.110255, -1.577995, 0, 1, 0.9686275, 1,
-0.009754154, -0.2464259, -3.718296, 0, 1, 0.9764706, 1,
-0.008650837, -0.6273521, -3.57984, 0, 1, 0.9803922, 1,
-0.0080275, 1.298755, -1.589183, 0, 1, 0.9882353, 1,
-0.006780562, 0.6531991, 1.510887, 0, 1, 0.9921569, 1,
-0.00228517, 2.015665, -0.9584195, 0, 1, 1, 1,
-0.001375598, 1.630328, -0.0153508, 0, 0.9921569, 1, 1,
0.004351587, -0.359913, 4.398183, 0, 0.9882353, 1, 1,
0.004547944, -0.04982257, 5.522158, 0, 0.9803922, 1, 1,
0.006532692, 0.5634016, 0.860195, 0, 0.9764706, 1, 1,
0.01412598, 0.2422725, -0.0132816, 0, 0.9686275, 1, 1,
0.01475395, 0.2877489, 1.374826, 0, 0.9647059, 1, 1,
0.01518687, 0.3042774, -0.08012313, 0, 0.9568627, 1, 1,
0.01785405, -0.9780446, 1.995119, 0, 0.9529412, 1, 1,
0.02310708, 0.118238, -1.292726, 0, 0.945098, 1, 1,
0.02669593, -0.136654, 2.452144, 0, 0.9411765, 1, 1,
0.02925043, 0.7901268, -1.096091, 0, 0.9333333, 1, 1,
0.03165308, -0.09207297, 2.551125, 0, 0.9294118, 1, 1,
0.03230615, -2.686046, 3.661071, 0, 0.9215686, 1, 1,
0.03322896, 0.06195321, 1.823849, 0, 0.9176471, 1, 1,
0.03421094, 0.1149791, 1.146111, 0, 0.9098039, 1, 1,
0.0356635, -1.889383, 3.847581, 0, 0.9058824, 1, 1,
0.03585293, -0.5542446, 2.620956, 0, 0.8980392, 1, 1,
0.03917164, 1.641013, -3.024485, 0, 0.8901961, 1, 1,
0.04162489, 0.3195363, -2.06387, 0, 0.8862745, 1, 1,
0.04174308, -0.2354959, 1.907403, 0, 0.8784314, 1, 1,
0.04527676, 0.1715174, 1.460497, 0, 0.8745098, 1, 1,
0.04633151, -0.1037009, 2.540774, 0, 0.8666667, 1, 1,
0.05388508, 0.4618498, 1.226194, 0, 0.8627451, 1, 1,
0.05673743, -0.5831978, 1.901925, 0, 0.854902, 1, 1,
0.05764419, 0.2973681, -0.07956834, 0, 0.8509804, 1, 1,
0.0649961, -1.042546, 4.318696, 0, 0.8431373, 1, 1,
0.06950487, -0.05102492, 3.091395, 0, 0.8392157, 1, 1,
0.07542785, 0.2386156, 3.171214, 0, 0.8313726, 1, 1,
0.0769248, 0.04484335, 2.795437, 0, 0.827451, 1, 1,
0.07926708, 0.7833524, 1.101002, 0, 0.8196079, 1, 1,
0.07978464, 1.582296, -1.735323, 0, 0.8156863, 1, 1,
0.08197874, -0.7327982, 4.726744, 0, 0.8078431, 1, 1,
0.08474279, -0.08408578, 1.484331, 0, 0.8039216, 1, 1,
0.08527853, -0.2341071, 0.1485676, 0, 0.7960784, 1, 1,
0.08660478, 1.597926, 0.2644189, 0, 0.7882353, 1, 1,
0.08930268, 0.8148864, -0.214511, 0, 0.7843137, 1, 1,
0.09181829, 0.9737155, -0.3738132, 0, 0.7764706, 1, 1,
0.09385604, 0.7161258, 1.731429, 0, 0.772549, 1, 1,
0.09599346, -0.6011756, 3.883945, 0, 0.7647059, 1, 1,
0.09611703, -0.2146472, 1.795922, 0, 0.7607843, 1, 1,
0.09984031, -0.223697, 4.045485, 0, 0.7529412, 1, 1,
0.1031721, -1.263115, 3.725077, 0, 0.7490196, 1, 1,
0.1036917, -0.6066409, 3.659951, 0, 0.7411765, 1, 1,
0.1040899, -0.1151572, 3.044748, 0, 0.7372549, 1, 1,
0.1057327, -0.3389701, 0.1876562, 0, 0.7294118, 1, 1,
0.1092985, 0.1715167, 0.6550305, 0, 0.7254902, 1, 1,
0.1095715, -2.440402, 1.875808, 0, 0.7176471, 1, 1,
0.1101572, -0.9234255, 2.561936, 0, 0.7137255, 1, 1,
0.1113401, -0.3480363, 2.277719, 0, 0.7058824, 1, 1,
0.1251467, -1.289529, 2.523505, 0, 0.6980392, 1, 1,
0.1255621, -2.324096, 4.045619, 0, 0.6941177, 1, 1,
0.1256731, -0.9872726, 1.776994, 0, 0.6862745, 1, 1,
0.129685, -0.8853932, 3.593617, 0, 0.682353, 1, 1,
0.1299104, -0.2420739, 1.917648, 0, 0.6745098, 1, 1,
0.1301429, -0.2758006, 2.776584, 0, 0.6705883, 1, 1,
0.1349992, 1.222205, -0.3308768, 0, 0.6627451, 1, 1,
0.1351562, 1.47315, 0.1021722, 0, 0.6588235, 1, 1,
0.1366275, 0.3566284, -0.717916, 0, 0.6509804, 1, 1,
0.1407151, 0.1297414, 0.9125066, 0, 0.6470588, 1, 1,
0.1438496, 0.1301751, 0.4536131, 0, 0.6392157, 1, 1,
0.1442604, -0.6247707, 3.518061, 0, 0.6352941, 1, 1,
0.1446778, 1.146329, 2.756739, 0, 0.627451, 1, 1,
0.1482288, 1.715471, -0.2637236, 0, 0.6235294, 1, 1,
0.1487481, -1.047174, 3.693581, 0, 0.6156863, 1, 1,
0.1495705, 0.630706, 1.593346, 0, 0.6117647, 1, 1,
0.1529137, 0.3033195, -0.712339, 0, 0.6039216, 1, 1,
0.1541281, -0.6375983, 2.468936, 0, 0.5960785, 1, 1,
0.1555, -0.5500793, 1.942977, 0, 0.5921569, 1, 1,
0.15578, 0.6265128, 1.4494, 0, 0.5843138, 1, 1,
0.1581706, -1.830166, 4.140146, 0, 0.5803922, 1, 1,
0.1583521, -1.097348, 2.369184, 0, 0.572549, 1, 1,
0.162123, 0.04488759, 1.633998, 0, 0.5686275, 1, 1,
0.1678188, -1.484364, 2.404423, 0, 0.5607843, 1, 1,
0.1707314, 0.08821723, 1.185743, 0, 0.5568628, 1, 1,
0.1718174, -1.519732, 3.111342, 0, 0.5490196, 1, 1,
0.1737064, 0.4462483, 0.5738938, 0, 0.5450981, 1, 1,
0.1738063, -0.02728767, 3.749455, 0, 0.5372549, 1, 1,
0.1744819, -0.8782333, 3.134734, 0, 0.5333334, 1, 1,
0.1766564, -0.1469325, 3.411184, 0, 0.5254902, 1, 1,
0.1767335, -0.5087472, 3.04198, 0, 0.5215687, 1, 1,
0.1804078, 0.05326381, 0.7426166, 0, 0.5137255, 1, 1,
0.1805245, -0.6341665, 4.350443, 0, 0.509804, 1, 1,
0.1882465, 0.6999697, 0.1197208, 0, 0.5019608, 1, 1,
0.1886898, -1.151273, 2.429549, 0, 0.4941176, 1, 1,
0.1893898, -0.2620316, 2.520872, 0, 0.4901961, 1, 1,
0.1895001, -0.2790489, 2.05657, 0, 0.4823529, 1, 1,
0.1919721, -1.157939, 3.964341, 0, 0.4784314, 1, 1,
0.1935012, -0.002223597, 2.802608, 0, 0.4705882, 1, 1,
0.1970355, -0.06805969, 2.69622, 0, 0.4666667, 1, 1,
0.1983561, -1.011787, 3.675475, 0, 0.4588235, 1, 1,
0.2023672, 1.350425, 2.101877, 0, 0.454902, 1, 1,
0.2087992, 0.9378589, 0.8236003, 0, 0.4470588, 1, 1,
0.2093504, 0.7120982, -0.8503494, 0, 0.4431373, 1, 1,
0.215414, 1.074842, 1.012261, 0, 0.4352941, 1, 1,
0.2157717, -0.3449105, 2.637325, 0, 0.4313726, 1, 1,
0.2194129, -1.98109, 4.101846, 0, 0.4235294, 1, 1,
0.2207218, 0.08111773, 2.506414, 0, 0.4196078, 1, 1,
0.2238768, -1.613647, 3.834823, 0, 0.4117647, 1, 1,
0.2255803, 1.153939, 0.039252, 0, 0.4078431, 1, 1,
0.2295641, -0.2426524, 1.153369, 0, 0.4, 1, 1,
0.2319163, -0.0872154, 1.825424, 0, 0.3921569, 1, 1,
0.2321552, -0.6964225, 2.656126, 0, 0.3882353, 1, 1,
0.2338566, 1.734796, -0.914455, 0, 0.3803922, 1, 1,
0.2367613, -1.001389, 2.618905, 0, 0.3764706, 1, 1,
0.2368749, -0.8807315, 1.476508, 0, 0.3686275, 1, 1,
0.2382643, -2.006334, 2.872281, 0, 0.3647059, 1, 1,
0.2389397, -0.8742121, 2.642536, 0, 0.3568628, 1, 1,
0.2406047, -0.2590534, 1.865977, 0, 0.3529412, 1, 1,
0.2408263, -0.7436088, 3.323859, 0, 0.345098, 1, 1,
0.2422988, 1.348814, 1.007216, 0, 0.3411765, 1, 1,
0.2424378, -0.7837398, 2.455832, 0, 0.3333333, 1, 1,
0.2450134, 0.8978778, 1.81745, 0, 0.3294118, 1, 1,
0.2458606, -1.502765, 4.506924, 0, 0.3215686, 1, 1,
0.245932, 0.8778288, -1.151073, 0, 0.3176471, 1, 1,
0.2529154, 0.700122, -0.2103779, 0, 0.3098039, 1, 1,
0.2544909, -0.7430529, 3.846213, 0, 0.3058824, 1, 1,
0.2556719, -0.3184605, 1.005628, 0, 0.2980392, 1, 1,
0.2567924, 0.5847157, 1.651107, 0, 0.2901961, 1, 1,
0.261032, 0.7085013, -1.139707, 0, 0.2862745, 1, 1,
0.2615043, 0.3434764, -0.478786, 0, 0.2784314, 1, 1,
0.2615493, -0.6539468, 1.923207, 0, 0.2745098, 1, 1,
0.2689447, -1.362581, 3.836242, 0, 0.2666667, 1, 1,
0.2708423, -0.4367526, 3.583004, 0, 0.2627451, 1, 1,
0.272954, 0.7730815, -0.7008479, 0, 0.254902, 1, 1,
0.2754325, 0.1353436, 0.5814514, 0, 0.2509804, 1, 1,
0.2777437, 1.366493, 0.06288743, 0, 0.2431373, 1, 1,
0.2785618, -0.6470373, 3.08967, 0, 0.2392157, 1, 1,
0.2801694, 1.1005, 1.310791, 0, 0.2313726, 1, 1,
0.2825797, 0.4952941, 0.7314051, 0, 0.227451, 1, 1,
0.2834779, 0.3812571, 0.958742, 0, 0.2196078, 1, 1,
0.2849476, 0.3425602, -0.3496357, 0, 0.2156863, 1, 1,
0.2883294, 0.4230702, 2.269341, 0, 0.2078431, 1, 1,
0.2947487, 0.4620606, 0.8305302, 0, 0.2039216, 1, 1,
0.2968933, -1.645663, 3.392022, 0, 0.1960784, 1, 1,
0.3001243, -0.8728001, 2.364036, 0, 0.1882353, 1, 1,
0.304121, -0.5336241, 3.78182, 0, 0.1843137, 1, 1,
0.3059599, -1.108254, 2.930463, 0, 0.1764706, 1, 1,
0.3061178, 0.01832325, 0.4129598, 0, 0.172549, 1, 1,
0.3062756, 0.4012498, 0.8091787, 0, 0.1647059, 1, 1,
0.3067994, -0.4068004, 4.041932, 0, 0.1607843, 1, 1,
0.3072356, -2.034517, 4.964621, 0, 0.1529412, 1, 1,
0.3094398, 1.175289, -3.579878, 0, 0.1490196, 1, 1,
0.3189532, 1.686088, 2.229003, 0, 0.1411765, 1, 1,
0.3212576, -0.3840173, 1.401467, 0, 0.1372549, 1, 1,
0.3265023, 1.140818, 0.3081028, 0, 0.1294118, 1, 1,
0.327888, 1.299025, 1.07354, 0, 0.1254902, 1, 1,
0.3338667, 0.6626262, -0.2094248, 0, 0.1176471, 1, 1,
0.3367397, 2.231162, 0.8020826, 0, 0.1137255, 1, 1,
0.3461213, 1.718907, -0.5213377, 0, 0.1058824, 1, 1,
0.3508095, 1.388746, -0.8979951, 0, 0.09803922, 1, 1,
0.3528598, 2.303846, 1.092413, 0, 0.09411765, 1, 1,
0.3629409, 1.788238, 0.1487103, 0, 0.08627451, 1, 1,
0.3644888, 0.8885764, -1.081383, 0, 0.08235294, 1, 1,
0.3665359, -0.9529396, 1.605933, 0, 0.07450981, 1, 1,
0.3700427, 0.9427558, 2.526295, 0, 0.07058824, 1, 1,
0.3735045, 0.7844271, 0.452599, 0, 0.0627451, 1, 1,
0.3825298, -0.3455278, 2.55461, 0, 0.05882353, 1, 1,
0.3854355, -0.9098433, 2.13036, 0, 0.05098039, 1, 1,
0.3857038, -0.2807786, 3.379726, 0, 0.04705882, 1, 1,
0.3865022, -1.528698, 3.017404, 0, 0.03921569, 1, 1,
0.3873875, -1.826524, 1.866986, 0, 0.03529412, 1, 1,
0.3892021, 2.412014, -2.143936, 0, 0.02745098, 1, 1,
0.3909205, 0.9213922, -0.7210588, 0, 0.02352941, 1, 1,
0.3944187, 0.1305539, 1.737059, 0, 0.01568628, 1, 1,
0.4041915, -1.378441, 1.601741, 0, 0.01176471, 1, 1,
0.4077669, 0.4207132, 0.1452833, 0, 0.003921569, 1, 1,
0.4083509, -1.152011, 4.082868, 0.003921569, 0, 1, 1,
0.4084273, 0.6492816, 0.09533001, 0.007843138, 0, 1, 1,
0.4106845, 0.4894661, 0.6019866, 0.01568628, 0, 1, 1,
0.4120889, 0.9099665, 0.8095888, 0.01960784, 0, 1, 1,
0.4129991, 1.51805, -1.02978, 0.02745098, 0, 1, 1,
0.4217061, 0.4917077, 0.8825369, 0.03137255, 0, 1, 1,
0.4221987, -0.02344327, 1.05027, 0.03921569, 0, 1, 1,
0.4233021, 0.2862401, 0.8219814, 0.04313726, 0, 1, 1,
0.4280308, 0.4798687, 2.121803, 0.05098039, 0, 1, 1,
0.4328201, -0.5480939, 2.743716, 0.05490196, 0, 1, 1,
0.4362335, -0.9120878, 3.631407, 0.0627451, 0, 1, 1,
0.4434202, 0.6157871, 1.020143, 0.06666667, 0, 1, 1,
0.4447496, 0.4916961, 0.7073185, 0.07450981, 0, 1, 1,
0.4467427, -0.5685791, 0.1188397, 0.07843138, 0, 1, 1,
0.4475292, 0.03345484, 2.198236, 0.08627451, 0, 1, 1,
0.4492534, -0.5740799, 1.093668, 0.09019608, 0, 1, 1,
0.4529519, -1.067268, 3.671942, 0.09803922, 0, 1, 1,
0.4539087, -0.678524, 3.810842, 0.1058824, 0, 1, 1,
0.4588058, -1.333075, 3.297573, 0.1098039, 0, 1, 1,
0.464017, -0.5430415, 2.053984, 0.1176471, 0, 1, 1,
0.4640552, -1.06202, 2.42453, 0.1215686, 0, 1, 1,
0.4646521, -0.1245343, 2.297876, 0.1294118, 0, 1, 1,
0.4653545, 0.3641227, 0.6301603, 0.1333333, 0, 1, 1,
0.4661497, 2.004917, -2.458833, 0.1411765, 0, 1, 1,
0.4679045, 0.04227054, 1.686581, 0.145098, 0, 1, 1,
0.4715338, -1.823688, 2.977544, 0.1529412, 0, 1, 1,
0.4738562, -0.2047409, 2.302822, 0.1568628, 0, 1, 1,
0.4748647, 0.5834706, 0.5156772, 0.1647059, 0, 1, 1,
0.4791889, -0.1157392, 1.561454, 0.1686275, 0, 1, 1,
0.4793961, -0.3399885, 2.779445, 0.1764706, 0, 1, 1,
0.4868214, -0.3785946, 2.723001, 0.1803922, 0, 1, 1,
0.4914689, 1.443389, -0.1326609, 0.1882353, 0, 1, 1,
0.4951204, 0.6241879, 1.612825, 0.1921569, 0, 1, 1,
0.4983384, -1.340293, 4.68858, 0.2, 0, 1, 1,
0.5010533, -0.4237194, 2.843623, 0.2078431, 0, 1, 1,
0.508142, -2.317018, 3.828944, 0.2117647, 0, 1, 1,
0.5107039, 0.3259635, 0.7720118, 0.2196078, 0, 1, 1,
0.5126858, 0.8667519, -0.258042, 0.2235294, 0, 1, 1,
0.5216771, 0.1907173, 0.3382501, 0.2313726, 0, 1, 1,
0.5269228, -2.66289, 1.904021, 0.2352941, 0, 1, 1,
0.5277596, -1.282552, 0.4320413, 0.2431373, 0, 1, 1,
0.528573, 0.6394733, -0.9423466, 0.2470588, 0, 1, 1,
0.5289233, 0.475351, 1.307045, 0.254902, 0, 1, 1,
0.5310544, 0.2486781, 2.150613, 0.2588235, 0, 1, 1,
0.5338585, 0.1040953, 1.625702, 0.2666667, 0, 1, 1,
0.536669, -0.3017606, 3.362432, 0.2705882, 0, 1, 1,
0.5402234, -0.5263078, 2.224092, 0.2784314, 0, 1, 1,
0.5408947, -0.2868104, 4.281677, 0.282353, 0, 1, 1,
0.5412673, -1.452785, 2.512589, 0.2901961, 0, 1, 1,
0.5446994, -0.3881647, 1.177534, 0.2941177, 0, 1, 1,
0.5450336, -0.9258604, 2.163252, 0.3019608, 0, 1, 1,
0.5456696, -0.03630996, 0.5383362, 0.3098039, 0, 1, 1,
0.5519468, 2.483292, 0.1593107, 0.3137255, 0, 1, 1,
0.5533868, 0.1794751, -0.07762079, 0.3215686, 0, 1, 1,
0.5623547, -0.133695, 1.593785, 0.3254902, 0, 1, 1,
0.5626794, -1.341742, 2.840588, 0.3333333, 0, 1, 1,
0.5659177, 1.978318, -1.540885, 0.3372549, 0, 1, 1,
0.5692217, 0.2894497, 1.736714, 0.345098, 0, 1, 1,
0.5731912, 0.7605345, 1.448206, 0.3490196, 0, 1, 1,
0.5778241, -2.05355, 3.592188, 0.3568628, 0, 1, 1,
0.5799737, 1.782658, -0.0705795, 0.3607843, 0, 1, 1,
0.5852783, 0.01575807, 3.329828, 0.3686275, 0, 1, 1,
0.5859525, 1.28429, 1.041317, 0.372549, 0, 1, 1,
0.5873794, -0.9063691, 3.485353, 0.3803922, 0, 1, 1,
0.5909073, -0.1471761, 1.988183, 0.3843137, 0, 1, 1,
0.5937455, -0.9096682, 3.640825, 0.3921569, 0, 1, 1,
0.5943393, -1.236274, 2.613069, 0.3960784, 0, 1, 1,
0.5969181, -0.7314677, 1.534688, 0.4039216, 0, 1, 1,
0.6001714, 0.4515665, 1.063367, 0.4117647, 0, 1, 1,
0.6027552, -0.3896321, 1.198926, 0.4156863, 0, 1, 1,
0.6053655, -1.514371, 3.405972, 0.4235294, 0, 1, 1,
0.6058762, 1.536563, 2.206475, 0.427451, 0, 1, 1,
0.6069679, -1.933917, 2.783164, 0.4352941, 0, 1, 1,
0.6086729, -1.829402, 3.668221, 0.4392157, 0, 1, 1,
0.6100049, -0.8561709, 2.067826, 0.4470588, 0, 1, 1,
0.6138132, -0.2487435, 1.272477, 0.4509804, 0, 1, 1,
0.6139155, -0.000884332, 3.414589, 0.4588235, 0, 1, 1,
0.6191751, 1.230649, -0.4522917, 0.4627451, 0, 1, 1,
0.6314449, -0.1933504, 1.65368, 0.4705882, 0, 1, 1,
0.6347128, -0.3434417, 4.372683, 0.4745098, 0, 1, 1,
0.6388361, 1.064306, 0.3956941, 0.4823529, 0, 1, 1,
0.6388846, 0.6445729, 2.528515, 0.4862745, 0, 1, 1,
0.640502, -0.007091298, 1.700901, 0.4941176, 0, 1, 1,
0.6426761, -0.5358593, 2.444275, 0.5019608, 0, 1, 1,
0.6453665, 0.3471111, 0.2758523, 0.5058824, 0, 1, 1,
0.6490533, 0.4029326, 0.927448, 0.5137255, 0, 1, 1,
0.6516519, 0.835039, 0.5477292, 0.5176471, 0, 1, 1,
0.6565175, -1.663013, 3.487382, 0.5254902, 0, 1, 1,
0.6596725, 0.8899627, 0.01055185, 0.5294118, 0, 1, 1,
0.6601889, -1.246248, 0.5083967, 0.5372549, 0, 1, 1,
0.6603335, 1.38052, 1.279523, 0.5411765, 0, 1, 1,
0.6618305, -0.3584487, 2.320572, 0.5490196, 0, 1, 1,
0.6638483, -0.1589977, 1.351207, 0.5529412, 0, 1, 1,
0.6640404, 0.335391, -0.7775316, 0.5607843, 0, 1, 1,
0.6662824, -0.2471334, 2.723598, 0.5647059, 0, 1, 1,
0.6685939, 0.2700275, 2.391522, 0.572549, 0, 1, 1,
0.6695271, -2.21574e-05, -0.06505767, 0.5764706, 0, 1, 1,
0.6697309, -0.6558121, 2.400878, 0.5843138, 0, 1, 1,
0.6714411, -1.657495, 2.656583, 0.5882353, 0, 1, 1,
0.6724146, -0.1882324, 1.226808, 0.5960785, 0, 1, 1,
0.6766737, 1.420443, 0.3635494, 0.6039216, 0, 1, 1,
0.6791058, 1.198583, 0.4551819, 0.6078432, 0, 1, 1,
0.6792641, -0.2085649, 4.841173, 0.6156863, 0, 1, 1,
0.6871962, 0.6212431, -1.210203, 0.6196079, 0, 1, 1,
0.6913266, 1.737542, 0.3763756, 0.627451, 0, 1, 1,
0.6921942, -1.267499, 1.451309, 0.6313726, 0, 1, 1,
0.6932493, -0.8271887, 3.930818, 0.6392157, 0, 1, 1,
0.7047178, -0.6338708, 2.831716, 0.6431373, 0, 1, 1,
0.7058007, 0.4049118, 1.343745, 0.6509804, 0, 1, 1,
0.7069666, -0.04269092, -0.002662685, 0.654902, 0, 1, 1,
0.7102527, 1.283355, 0.6834604, 0.6627451, 0, 1, 1,
0.7158442, -1.353941, 3.314631, 0.6666667, 0, 1, 1,
0.717847, 0.225408, 2.840603, 0.6745098, 0, 1, 1,
0.7197769, 0.06661991, 3.321013, 0.6784314, 0, 1, 1,
0.7209171, 0.03481974, 1.817184, 0.6862745, 0, 1, 1,
0.726652, 0.834783, 1.544022, 0.6901961, 0, 1, 1,
0.7294695, 0.8027684, 2.754725, 0.6980392, 0, 1, 1,
0.7306463, 1.233061, 1.000899, 0.7058824, 0, 1, 1,
0.7322353, -0.7539588, 1.647635, 0.7098039, 0, 1, 1,
0.7334393, -0.2485805, 0.5016503, 0.7176471, 0, 1, 1,
0.7361597, 0.3130215, 0.5666038, 0.7215686, 0, 1, 1,
0.739402, 0.6134477, -0.347414, 0.7294118, 0, 1, 1,
0.7483727, -0.137775, -0.3449761, 0.7333333, 0, 1, 1,
0.7486259, 0.1582917, 0.8182493, 0.7411765, 0, 1, 1,
0.7607484, 0.1792935, 1.965899, 0.7450981, 0, 1, 1,
0.7665133, -1.218448, 1.507391, 0.7529412, 0, 1, 1,
0.7694761, -0.4645427, 1.050223, 0.7568628, 0, 1, 1,
0.7731716, -0.8519878, 1.457166, 0.7647059, 0, 1, 1,
0.7736023, -0.2647596, 1.52298, 0.7686275, 0, 1, 1,
0.774049, -1.755928, 3.045304, 0.7764706, 0, 1, 1,
0.7810248, 0.6159291, 0.5686677, 0.7803922, 0, 1, 1,
0.7818033, 1.201466, 1.741283, 0.7882353, 0, 1, 1,
0.7820438, -0.3359293, 3.30425, 0.7921569, 0, 1, 1,
0.7953858, -1.759588, 1.976174, 0.8, 0, 1, 1,
0.7980676, 0.09060391, 1.797539, 0.8078431, 0, 1, 1,
0.7985573, 0.737442, -1.135816, 0.8117647, 0, 1, 1,
0.8035683, 1.429788, -0.2384238, 0.8196079, 0, 1, 1,
0.8050926, -0.4259558, 0.4384264, 0.8235294, 0, 1, 1,
0.8075943, 0.3848584, 1.041991, 0.8313726, 0, 1, 1,
0.8096563, 0.2917799, 2.165908, 0.8352941, 0, 1, 1,
0.8116032, -1.370934, 1.430725, 0.8431373, 0, 1, 1,
0.8127017, 0.06937125, 0.07436036, 0.8470588, 0, 1, 1,
0.8208026, -0.569508, 1.564801, 0.854902, 0, 1, 1,
0.8268526, -0.6234434, 3.847809, 0.8588235, 0, 1, 1,
0.8283142, 1.862843, 1.397966, 0.8666667, 0, 1, 1,
0.8311868, -0.2874855, 2.782221, 0.8705882, 0, 1, 1,
0.8378317, -0.2440301, 3.294843, 0.8784314, 0, 1, 1,
0.8382915, -0.102176, 1.983655, 0.8823529, 0, 1, 1,
0.852092, 0.8699303, -0.1535299, 0.8901961, 0, 1, 1,
0.8573837, -0.4319271, 1.979618, 0.8941177, 0, 1, 1,
0.8592455, 1.154813, 0.8551726, 0.9019608, 0, 1, 1,
0.8592467, -1.503332, 2.25721, 0.9098039, 0, 1, 1,
0.8639452, 1.141563, 0.7971679, 0.9137255, 0, 1, 1,
0.86546, 0.4811454, 2.789111, 0.9215686, 0, 1, 1,
0.8690599, 0.2578481, 0.8285909, 0.9254902, 0, 1, 1,
0.8699858, 0.9774481, -0.2984056, 0.9333333, 0, 1, 1,
0.870736, 0.001984568, 1.441082, 0.9372549, 0, 1, 1,
0.8743834, -1.37323, 3.34761, 0.945098, 0, 1, 1,
0.883113, 1.444201, 0.3851797, 0.9490196, 0, 1, 1,
0.8840786, -1.045404, 3.029413, 0.9568627, 0, 1, 1,
0.8860381, -1.058225, 1.957455, 0.9607843, 0, 1, 1,
0.9034324, 0.7962144, 2.761608, 0.9686275, 0, 1, 1,
0.9056739, 0.9568946, 1.027228, 0.972549, 0, 1, 1,
0.9065062, -0.5060597, 3.226447, 0.9803922, 0, 1, 1,
0.9068618, -2.045611, 4.084676, 0.9843137, 0, 1, 1,
0.9093813, 1.290782, 0.4840644, 0.9921569, 0, 1, 1,
0.9135332, -1.275274, 2.191436, 0.9960784, 0, 1, 1,
0.9224537, -1.335797, 2.918738, 1, 0, 0.9960784, 1,
0.9294606, -0.1571498, 2.506393, 1, 0, 0.9882353, 1,
0.9367727, 1.718552, 0.1685187, 1, 0, 0.9843137, 1,
0.9469879, -1.278602, 1.919178, 1, 0, 0.9764706, 1,
0.9482893, -1.563811, 4.174724, 1, 0, 0.972549, 1,
0.9486932, -0.179351, 1.849528, 1, 0, 0.9647059, 1,
0.9523451, 0.4604982, 2.48908, 1, 0, 0.9607843, 1,
0.9549054, 0.3909716, 1.303783, 1, 0, 0.9529412, 1,
0.9598284, -0.07394253, 1.874039, 1, 0, 0.9490196, 1,
0.9630318, -0.5851359, 1.279863, 1, 0, 0.9411765, 1,
0.9637163, 0.9188204, 1.488358, 1, 0, 0.9372549, 1,
0.9825494, -0.7265595, 0.1184793, 1, 0, 0.9294118, 1,
0.9860181, 1.039807, 0.7672572, 1, 0, 0.9254902, 1,
0.9928039, 1.220268, -0.4698291, 1, 0, 0.9176471, 1,
0.9930461, -0.9450576, 1.697163, 1, 0, 0.9137255, 1,
0.996167, -0.9024705, 2.719838, 1, 0, 0.9058824, 1,
0.9982923, -0.2318278, 1.420313, 1, 0, 0.9019608, 1,
0.9996355, 2.872099, -0.9314101, 1, 0, 0.8941177, 1,
1.000144, -1.271533, 1.792826, 1, 0, 0.8862745, 1,
1.011733, 2.538648, -0.04967733, 1, 0, 0.8823529, 1,
1.015506, 1.199558, 3.244336, 1, 0, 0.8745098, 1,
1.017759, 1.421858, 1.408881, 1, 0, 0.8705882, 1,
1.019763, -0.2423455, 1.756326, 1, 0, 0.8627451, 1,
1.021106, -1.045992, 0.9337981, 1, 0, 0.8588235, 1,
1.021275, -0.1544564, 2.975782, 1, 0, 0.8509804, 1,
1.041726, 0.6292182, 1.457553, 1, 0, 0.8470588, 1,
1.049585, -0.500578, 1.49019, 1, 0, 0.8392157, 1,
1.050716, -2.031673, 3.403259, 1, 0, 0.8352941, 1,
1.051914, -0.6551697, 2.068504, 1, 0, 0.827451, 1,
1.057285, 0.5040447, 1.499723, 1, 0, 0.8235294, 1,
1.061996, -2.274828, 3.832199, 1, 0, 0.8156863, 1,
1.070043, 0.3038724, 1.292652, 1, 0, 0.8117647, 1,
1.073411, -0.311698, 2.371327, 1, 0, 0.8039216, 1,
1.074886, -0.8117221, 2.450196, 1, 0, 0.7960784, 1,
1.075911, 0.06816766, 0.7712965, 1, 0, 0.7921569, 1,
1.078165, -1.050823, 1.400023, 1, 0, 0.7843137, 1,
1.078274, -0.04101638, 0.9723296, 1, 0, 0.7803922, 1,
1.082268, 0.01233085, 1.866763, 1, 0, 0.772549, 1,
1.092815, 0.3885228, 0.4356528, 1, 0, 0.7686275, 1,
1.094082, 0.2866605, 0.4975477, 1, 0, 0.7607843, 1,
1.099273, -2.194482, 1.997625, 1, 0, 0.7568628, 1,
1.103605, -0.09699529, 1.904558, 1, 0, 0.7490196, 1,
1.107178, 0.3133602, 1.558085, 1, 0, 0.7450981, 1,
1.110631, -0.7823665, 0.3567181, 1, 0, 0.7372549, 1,
1.127689, -0.2330026, 0.2209316, 1, 0, 0.7333333, 1,
1.129628, 0.1292366, 0.5149184, 1, 0, 0.7254902, 1,
1.132357, -0.2826509, 1.990793, 1, 0, 0.7215686, 1,
1.137053, 0.563757, -0.7917707, 1, 0, 0.7137255, 1,
1.137627, -0.6950358, 0.6262043, 1, 0, 0.7098039, 1,
1.157971, 0.5467967, 0.8221127, 1, 0, 0.7019608, 1,
1.162449, 1.988069, 0.6284685, 1, 0, 0.6941177, 1,
1.178538, -0.01838684, -0.4541739, 1, 0, 0.6901961, 1,
1.187674, 1.816854, 0.2507962, 1, 0, 0.682353, 1,
1.19633, 0.6159973, 1.638726, 1, 0, 0.6784314, 1,
1.199718, 0.09659833, 1.594764, 1, 0, 0.6705883, 1,
1.200956, 1.450848, 0.836572, 1, 0, 0.6666667, 1,
1.213998, -1.646311, 2.573667, 1, 0, 0.6588235, 1,
1.219641, -1.301165, 1.510477, 1, 0, 0.654902, 1,
1.219931, 0.6882865, 0.6081202, 1, 0, 0.6470588, 1,
1.221281, 1.642197, 0.06479459, 1, 0, 0.6431373, 1,
1.224836, 1.010835, 1.288838, 1, 0, 0.6352941, 1,
1.225376, -1.43846, 2.195322, 1, 0, 0.6313726, 1,
1.230231, -1.06014, 2.263646, 1, 0, 0.6235294, 1,
1.231072, -3.115733, 3.047127, 1, 0, 0.6196079, 1,
1.233958, 0.7673049, 1.042559, 1, 0, 0.6117647, 1,
1.235877, 0.5255024, 0.9142146, 1, 0, 0.6078432, 1,
1.253973, 0.3610782, 0.2373901, 1, 0, 0.6, 1,
1.255708, 0.4980906, 1.147298, 1, 0, 0.5921569, 1,
1.256762, -0.3004273, 2.004038, 1, 0, 0.5882353, 1,
1.261349, -0.9162056, 2.141771, 1, 0, 0.5803922, 1,
1.265021, -1.344944, 1.004027, 1, 0, 0.5764706, 1,
1.269453, -0.396076, 2.931672, 1, 0, 0.5686275, 1,
1.276167, -0.1844964, 1.897883, 1, 0, 0.5647059, 1,
1.284402, 0.5259727, 0.7376246, 1, 0, 0.5568628, 1,
1.286334, -1.371, 1.288609, 1, 0, 0.5529412, 1,
1.290992, 1.482755, 0.6478618, 1, 0, 0.5450981, 1,
1.291714, 1.270757, 1.648072, 1, 0, 0.5411765, 1,
1.297106, -1.058534, 3.0261, 1, 0, 0.5333334, 1,
1.307169, -1.797836, 2.608676, 1, 0, 0.5294118, 1,
1.313336, -0.1324539, 0.4957169, 1, 0, 0.5215687, 1,
1.314433, -0.7933406, 1.322402, 1, 0, 0.5176471, 1,
1.316185, -0.3570584, 2.900442, 1, 0, 0.509804, 1,
1.318588, 0.2689763, 1.95345, 1, 0, 0.5058824, 1,
1.325003, -0.3508151, 2.559341, 1, 0, 0.4980392, 1,
1.363548, 0.5606778, 0.6949005, 1, 0, 0.4901961, 1,
1.36635, 0.2421812, 2.4946, 1, 0, 0.4862745, 1,
1.368113, 1.426192, 1.570181, 1, 0, 0.4784314, 1,
1.3748, 0.3113039, 1.7174, 1, 0, 0.4745098, 1,
1.374912, 2.048038, 2.058434, 1, 0, 0.4666667, 1,
1.375275, -0.6574581, 3.03511, 1, 0, 0.4627451, 1,
1.376378, -0.8029554, 2.137799, 1, 0, 0.454902, 1,
1.377462, -0.04725375, 2.351572, 1, 0, 0.4509804, 1,
1.382897, 0.7944053, 1.440461, 1, 0, 0.4431373, 1,
1.383327, -1.132363, 3.404571, 1, 0, 0.4392157, 1,
1.385321, -2.004344, 1.870151, 1, 0, 0.4313726, 1,
1.401447, -0.2376042, 1.37952, 1, 0, 0.427451, 1,
1.42392, -0.3860922, 2.015431, 1, 0, 0.4196078, 1,
1.44871, -0.9016954, 3.073338, 1, 0, 0.4156863, 1,
1.449373, -0.9863176, 3.486544, 1, 0, 0.4078431, 1,
1.462395, -0.4283086, 0.9282857, 1, 0, 0.4039216, 1,
1.463121, -1.44559, 2.148786, 1, 0, 0.3960784, 1,
1.465117, -0.8554469, 2.626359, 1, 0, 0.3882353, 1,
1.465509, -0.05157023, 2.383198, 1, 0, 0.3843137, 1,
1.466699, 0.3350279, 1.065079, 1, 0, 0.3764706, 1,
1.472491, 0.3959889, 0.4429955, 1, 0, 0.372549, 1,
1.491786, -0.395637, 1.345862, 1, 0, 0.3647059, 1,
1.492077, 1.002968, 1.213345, 1, 0, 0.3607843, 1,
1.498729, -1.316712, 2.634171, 1, 0, 0.3529412, 1,
1.502628, 0.4760556, 2.067607, 1, 0, 0.3490196, 1,
1.50452, 0.2134165, 2.312465, 1, 0, 0.3411765, 1,
1.521468, 2.041568, 2.055183, 1, 0, 0.3372549, 1,
1.530464, 0.02120102, 2.642808, 1, 0, 0.3294118, 1,
1.535126, 1.54511, -0.708367, 1, 0, 0.3254902, 1,
1.575901, -0.9949813, 3.28552, 1, 0, 0.3176471, 1,
1.579164, -0.650732, 3.034616, 1, 0, 0.3137255, 1,
1.594763, -1.535924, 3.258818, 1, 0, 0.3058824, 1,
1.599971, -0.7994975, 2.664681, 1, 0, 0.2980392, 1,
1.602958, -0.4526548, 0.9541012, 1, 0, 0.2941177, 1,
1.603787, 0.3205121, 1.469989, 1, 0, 0.2862745, 1,
1.61215, 0.2155848, 0.5587525, 1, 0, 0.282353, 1,
1.625276, -1.707552, 2.049439, 1, 0, 0.2745098, 1,
1.627181, 0.586334, 1.849437, 1, 0, 0.2705882, 1,
1.631946, 0.7833888, -0.2225088, 1, 0, 0.2627451, 1,
1.645954, 0.2141462, 1.182256, 1, 0, 0.2588235, 1,
1.65034, 1.489874, -1.104829, 1, 0, 0.2509804, 1,
1.688113, 0.6061088, 0.6939341, 1, 0, 0.2470588, 1,
1.695428, 1.789134, 0.8437792, 1, 0, 0.2392157, 1,
1.696891, 0.7520772, 1.672162, 1, 0, 0.2352941, 1,
1.718871, -0.01263997, 1.379533, 1, 0, 0.227451, 1,
1.726989, -0.5976942, -0.05840765, 1, 0, 0.2235294, 1,
1.7321, 1.450772, 1.633088, 1, 0, 0.2156863, 1,
1.760959, -0.4547855, 2.112722, 1, 0, 0.2117647, 1,
1.779905, -0.2370626, 2.750757, 1, 0, 0.2039216, 1,
1.781862, -0.05512814, 1.605186, 1, 0, 0.1960784, 1,
1.787709, 1.396639, 1.388001, 1, 0, 0.1921569, 1,
1.802078, -0.3042115, 2.283123, 1, 0, 0.1843137, 1,
1.81821, -0.6468468, 1.90503, 1, 0, 0.1803922, 1,
1.821601, -0.7989029, 2.914502, 1, 0, 0.172549, 1,
1.851516, -0.6043294, 2.901407, 1, 0, 0.1686275, 1,
1.878814, -0.4085262, 1.213215, 1, 0, 0.1607843, 1,
1.88845, -1.297314, 1.819824, 1, 0, 0.1568628, 1,
1.903978, 1.670454, 1.171342, 1, 0, 0.1490196, 1,
1.913644, -0.09426197, 0.6315494, 1, 0, 0.145098, 1,
1.914495, 0.4703196, -0.5865018, 1, 0, 0.1372549, 1,
1.931276, 0.06593077, 2.851868, 1, 0, 0.1333333, 1,
1.981022, -0.5494236, 2.396228, 1, 0, 0.1254902, 1,
1.982646, -0.601627, 1.303978, 1, 0, 0.1215686, 1,
1.996873, 0.1215942, 1.717076, 1, 0, 0.1137255, 1,
1.999936, 1.529912, -1.139263, 1, 0, 0.1098039, 1,
2.01918, -0.1029414, 2.225739, 1, 0, 0.1019608, 1,
2.034841, -0.7549027, 1.864188, 1, 0, 0.09411765, 1,
2.039132, 1.493102, 0.4517089, 1, 0, 0.09019608, 1,
2.070508, -0.2114437, 3.655862, 1, 0, 0.08235294, 1,
2.079993, -0.6189546, 3.009546, 1, 0, 0.07843138, 1,
2.136354, 0.229292, 1.877924, 1, 0, 0.07058824, 1,
2.185281, -0.535892, 3.63474, 1, 0, 0.06666667, 1,
2.201581, -0.3935076, 4.01649, 1, 0, 0.05882353, 1,
2.233707, -1.840991, 1.645177, 1, 0, 0.05490196, 1,
2.252584, -0.537442, 1.587533, 1, 0, 0.04705882, 1,
2.323567, 0.9156377, 1.13075, 1, 0, 0.04313726, 1,
2.340892, 1.888988, 1.565624, 1, 0, 0.03529412, 1,
2.501558, 0.2606194, 1.343242, 1, 0, 0.03137255, 1,
2.537873, -1.22597, 2.240207, 1, 0, 0.02352941, 1,
2.693075, -1.532867, 2.616513, 1, 0, 0.01960784, 1,
2.787808, 0.1702341, 0.905002, 1, 0, 0.01176471, 1,
2.791744, 0.3546141, 2.509767, 1, 0, 0.007843138, 1
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
-0.1009209, -4.20694, -7.456924, 0, -0.5, 0.5, 0.5,
-0.1009209, -4.20694, -7.456924, 1, -0.5, 0.5, 0.5,
-0.1009209, -4.20694, -7.456924, 1, 1.5, 0.5, 0.5,
-0.1009209, -4.20694, -7.456924, 0, 1.5, 0.5, 0.5
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
-3.9742, 0.1031654, -7.456924, 0, -0.5, 0.5, 0.5,
-3.9742, 0.1031654, -7.456924, 1, -0.5, 0.5, 0.5,
-3.9742, 0.1031654, -7.456924, 1, 1.5, 0.5, 0.5,
-3.9742, 0.1031654, -7.456924, 0, 1.5, 0.5, 0.5
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
-3.9742, -4.20694, -0.02682948, 0, -0.5, 0.5, 0.5,
-3.9742, -4.20694, -0.02682948, 1, -0.5, 0.5, 0.5,
-3.9742, -4.20694, -0.02682948, 1, 1.5, 0.5, 0.5,
-3.9742, -4.20694, -0.02682948, 0, 1.5, 0.5, 0.5
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
-2, -3.2123, -5.742287,
2, -3.2123, -5.742287,
-2, -3.2123, -5.742287,
-2, -3.378073, -6.028059,
-1, -3.2123, -5.742287,
-1, -3.378073, -6.028059,
0, -3.2123, -5.742287,
0, -3.378073, -6.028059,
1, -3.2123, -5.742287,
1, -3.378073, -6.028059,
2, -3.2123, -5.742287,
2, -3.378073, -6.028059
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
-2, -3.70962, -6.599606, 0, -0.5, 0.5, 0.5,
-2, -3.70962, -6.599606, 1, -0.5, 0.5, 0.5,
-2, -3.70962, -6.599606, 1, 1.5, 0.5, 0.5,
-2, -3.70962, -6.599606, 0, 1.5, 0.5, 0.5,
-1, -3.70962, -6.599606, 0, -0.5, 0.5, 0.5,
-1, -3.70962, -6.599606, 1, -0.5, 0.5, 0.5,
-1, -3.70962, -6.599606, 1, 1.5, 0.5, 0.5,
-1, -3.70962, -6.599606, 0, 1.5, 0.5, 0.5,
0, -3.70962, -6.599606, 0, -0.5, 0.5, 0.5,
0, -3.70962, -6.599606, 1, -0.5, 0.5, 0.5,
0, -3.70962, -6.599606, 1, 1.5, 0.5, 0.5,
0, -3.70962, -6.599606, 0, 1.5, 0.5, 0.5,
1, -3.70962, -6.599606, 0, -0.5, 0.5, 0.5,
1, -3.70962, -6.599606, 1, -0.5, 0.5, 0.5,
1, -3.70962, -6.599606, 1, 1.5, 0.5, 0.5,
1, -3.70962, -6.599606, 0, 1.5, 0.5, 0.5,
2, -3.70962, -6.599606, 0, -0.5, 0.5, 0.5,
2, -3.70962, -6.599606, 1, -0.5, 0.5, 0.5,
2, -3.70962, -6.599606, 1, 1.5, 0.5, 0.5,
2, -3.70962, -6.599606, 0, 1.5, 0.5, 0.5
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
-3.080366, -3, -5.742287,
-3.080366, 3, -5.742287,
-3.080366, -3, -5.742287,
-3.229338, -3, -6.028059,
-3.080366, -2, -5.742287,
-3.229338, -2, -6.028059,
-3.080366, -1, -5.742287,
-3.229338, -1, -6.028059,
-3.080366, 0, -5.742287,
-3.229338, 0, -6.028059,
-3.080366, 1, -5.742287,
-3.229338, 1, -6.028059,
-3.080366, 2, -5.742287,
-3.229338, 2, -6.028059,
-3.080366, 3, -5.742287,
-3.229338, 3, -6.028059
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
-3.527283, -3, -6.599606, 0, -0.5, 0.5, 0.5,
-3.527283, -3, -6.599606, 1, -0.5, 0.5, 0.5,
-3.527283, -3, -6.599606, 1, 1.5, 0.5, 0.5,
-3.527283, -3, -6.599606, 0, 1.5, 0.5, 0.5,
-3.527283, -2, -6.599606, 0, -0.5, 0.5, 0.5,
-3.527283, -2, -6.599606, 1, -0.5, 0.5, 0.5,
-3.527283, -2, -6.599606, 1, 1.5, 0.5, 0.5,
-3.527283, -2, -6.599606, 0, 1.5, 0.5, 0.5,
-3.527283, -1, -6.599606, 0, -0.5, 0.5, 0.5,
-3.527283, -1, -6.599606, 1, -0.5, 0.5, 0.5,
-3.527283, -1, -6.599606, 1, 1.5, 0.5, 0.5,
-3.527283, -1, -6.599606, 0, 1.5, 0.5, 0.5,
-3.527283, 0, -6.599606, 0, -0.5, 0.5, 0.5,
-3.527283, 0, -6.599606, 1, -0.5, 0.5, 0.5,
-3.527283, 0, -6.599606, 1, 1.5, 0.5, 0.5,
-3.527283, 0, -6.599606, 0, 1.5, 0.5, 0.5,
-3.527283, 1, -6.599606, 0, -0.5, 0.5, 0.5,
-3.527283, 1, -6.599606, 1, -0.5, 0.5, 0.5,
-3.527283, 1, -6.599606, 1, 1.5, 0.5, 0.5,
-3.527283, 1, -6.599606, 0, 1.5, 0.5, 0.5,
-3.527283, 2, -6.599606, 0, -0.5, 0.5, 0.5,
-3.527283, 2, -6.599606, 1, -0.5, 0.5, 0.5,
-3.527283, 2, -6.599606, 1, 1.5, 0.5, 0.5,
-3.527283, 2, -6.599606, 0, 1.5, 0.5, 0.5,
-3.527283, 3, -6.599606, 0, -0.5, 0.5, 0.5,
-3.527283, 3, -6.599606, 1, -0.5, 0.5, 0.5,
-3.527283, 3, -6.599606, 1, 1.5, 0.5, 0.5,
-3.527283, 3, -6.599606, 0, 1.5, 0.5, 0.5
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
-3.080366, -3.2123, -4,
-3.080366, -3.2123, 4,
-3.080366, -3.2123, -4,
-3.229338, -3.378073, -4,
-3.080366, -3.2123, -2,
-3.229338, -3.378073, -2,
-3.080366, -3.2123, 0,
-3.229338, -3.378073, 0,
-3.080366, -3.2123, 2,
-3.229338, -3.378073, 2,
-3.080366, -3.2123, 4,
-3.229338, -3.378073, 4
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
-3.527283, -3.70962, -4, 0, -0.5, 0.5, 0.5,
-3.527283, -3.70962, -4, 1, -0.5, 0.5, 0.5,
-3.527283, -3.70962, -4, 1, 1.5, 0.5, 0.5,
-3.527283, -3.70962, -4, 0, 1.5, 0.5, 0.5,
-3.527283, -3.70962, -2, 0, -0.5, 0.5, 0.5,
-3.527283, -3.70962, -2, 1, -0.5, 0.5, 0.5,
-3.527283, -3.70962, -2, 1, 1.5, 0.5, 0.5,
-3.527283, -3.70962, -2, 0, 1.5, 0.5, 0.5,
-3.527283, -3.70962, 0, 0, -0.5, 0.5, 0.5,
-3.527283, -3.70962, 0, 1, -0.5, 0.5, 0.5,
-3.527283, -3.70962, 0, 1, 1.5, 0.5, 0.5,
-3.527283, -3.70962, 0, 0, 1.5, 0.5, 0.5,
-3.527283, -3.70962, 2, 0, -0.5, 0.5, 0.5,
-3.527283, -3.70962, 2, 1, -0.5, 0.5, 0.5,
-3.527283, -3.70962, 2, 1, 1.5, 0.5, 0.5,
-3.527283, -3.70962, 2, 0, 1.5, 0.5, 0.5,
-3.527283, -3.70962, 4, 0, -0.5, 0.5, 0.5,
-3.527283, -3.70962, 4, 1, -0.5, 0.5, 0.5,
-3.527283, -3.70962, 4, 1, 1.5, 0.5, 0.5,
-3.527283, -3.70962, 4, 0, 1.5, 0.5, 0.5
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
-3.080366, -3.2123, -5.742287,
-3.080366, 3.418631, -5.742287,
-3.080366, -3.2123, 5.688628,
-3.080366, 3.418631, 5.688628,
-3.080366, -3.2123, -5.742287,
-3.080366, -3.2123, 5.688628,
-3.080366, 3.418631, -5.742287,
-3.080366, 3.418631, 5.688628,
-3.080366, -3.2123, -5.742287,
2.878524, -3.2123, -5.742287,
-3.080366, -3.2123, 5.688628,
2.878524, -3.2123, 5.688628,
-3.080366, 3.418631, -5.742287,
2.878524, 3.418631, -5.742287,
-3.080366, 3.418631, 5.688628,
2.878524, 3.418631, 5.688628,
2.878524, -3.2123, -5.742287,
2.878524, 3.418631, -5.742287,
2.878524, -3.2123, 5.688628,
2.878524, 3.418631, 5.688628,
2.878524, -3.2123, -5.742287,
2.878524, -3.2123, 5.688628,
2.878524, 3.418631, -5.742287,
2.878524, 3.418631, 5.688628
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
var radius = 7.740756;
var distance = 34.4395;
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
mvMatrix.translate( 0.1009209, -0.1031654, 0.02682948 );
mvMatrix.scale( 1.404533, 1.262184, 0.7321774 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.4395);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
norflurazon<-read.table("norflurazon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-norflurazon$V2
```

```
## Error in eval(expr, envir, enclos): object 'norflurazon' not found
```

```r
y<-norflurazon$V3
```

```
## Error in eval(expr, envir, enclos): object 'norflurazon' not found
```

```r
z<-norflurazon$V4
```

```
## Error in eval(expr, envir, enclos): object 'norflurazon' not found
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
-2.993586, 0.7343996, 0.01957612, 0, 0, 1, 1, 1,
-2.856511, 0.04028634, -0.7266382, 1, 0, 0, 1, 1,
-2.70809, -0.5155734, -3.498965, 1, 0, 0, 1, 1,
-2.693754, 1.300081, -3.327535, 1, 0, 0, 1, 1,
-2.69132, -0.3541805, -2.813594, 1, 0, 0, 1, 1,
-2.617663, -0.4253012, -1.339607, 1, 0, 0, 1, 1,
-2.562147, -0.7618117, -1.313003, 0, 0, 0, 1, 1,
-2.53094, 0.444939, -1.10242, 0, 0, 0, 1, 1,
-2.507007, 0.115407, -2.889516, 0, 0, 0, 1, 1,
-2.303819, 0.4916241, -0.197347, 0, 0, 0, 1, 1,
-2.280648, 1.094351, -0.02810115, 0, 0, 0, 1, 1,
-2.278476, -0.03666322, -1.717477, 0, 0, 0, 1, 1,
-2.273928, -2.2299, -2.193374, 0, 0, 0, 1, 1,
-2.256356, -0.3551594, -2.797954, 1, 1, 1, 1, 1,
-2.253629, -2.287422, -2.361391, 1, 1, 1, 1, 1,
-2.223635, 0.7709165, -2.163144, 1, 1, 1, 1, 1,
-2.207995, -0.7459319, -1.156424, 1, 1, 1, 1, 1,
-2.194269, -0.2127169, -3.225902, 1, 1, 1, 1, 1,
-2.178918, -0.428293, -2.857347, 1, 1, 1, 1, 1,
-2.173306, 1.526969, -0.5005283, 1, 1, 1, 1, 1,
-2.129543, -0.3707652, -1.71048, 1, 1, 1, 1, 1,
-2.068528, 0.41956, -2.686028, 1, 1, 1, 1, 1,
-2.045816, 1.233945, -0.9977252, 1, 1, 1, 1, 1,
-2.027229, -0.9991951, -1.932558, 1, 1, 1, 1, 1,
-2.013335, -0.4352286, -1.042889, 1, 1, 1, 1, 1,
-2.012021, -1.212213, -0.7380103, 1, 1, 1, 1, 1,
-1.980271, -0.2456614, -2.289953, 1, 1, 1, 1, 1,
-1.969164, 1.851168, 0.05182921, 1, 1, 1, 1, 1,
-1.961087, 0.2240183, -1.718028, 0, 0, 1, 1, 1,
-1.95001, -1.337345, -1.71586, 1, 0, 0, 1, 1,
-1.948594, -0.2606162, -3.76397, 1, 0, 0, 1, 1,
-1.935995, 1.049933, -0.7861044, 1, 0, 0, 1, 1,
-1.923591, -0.9993292, -2.237111, 1, 0, 0, 1, 1,
-1.895658, 0.2254069, -2.280951, 1, 0, 0, 1, 1,
-1.891159, -0.9672335, -3.793158, 0, 0, 0, 1, 1,
-1.88772, 1.165651, -1.288265, 0, 0, 0, 1, 1,
-1.873006, -1.524562, -1.855043, 0, 0, 0, 1, 1,
-1.837058, -2.057114, -1.353642, 0, 0, 0, 1, 1,
-1.830098, -0.832521, -1.204103, 0, 0, 0, 1, 1,
-1.814981, 0.3999684, -2.589009, 0, 0, 0, 1, 1,
-1.81089, -1.58708, -2.674567, 0, 0, 0, 1, 1,
-1.805962, 1.058597, -1.228908, 1, 1, 1, 1, 1,
-1.794862, 1.158367, -0.7217993, 1, 1, 1, 1, 1,
-1.79274, 0.2616655, -3.448729, 1, 1, 1, 1, 1,
-1.791787, 0.4804512, -0.1833665, 1, 1, 1, 1, 1,
-1.785032, 0.6651784, -1.15908, 1, 1, 1, 1, 1,
-1.768763, 1.145397, -0.7250596, 1, 1, 1, 1, 1,
-1.762657, 1.291583, -0.05259107, 1, 1, 1, 1, 1,
-1.752465, 0.2368531, -3.200295, 1, 1, 1, 1, 1,
-1.739151, 1.098519, -0.4322946, 1, 1, 1, 1, 1,
-1.737131, 0.9771926, -0.1061473, 1, 1, 1, 1, 1,
-1.72662, -1.848014, -2.544228, 1, 1, 1, 1, 1,
-1.723084, -1.365608, -2.293431, 1, 1, 1, 1, 1,
-1.708145, 0.6058111, -2.305617, 1, 1, 1, 1, 1,
-1.707814, 0.4402055, -0.775988, 1, 1, 1, 1, 1,
-1.685252, -0.3755849, -0.3367113, 1, 1, 1, 1, 1,
-1.67069, 0.1577808, -2.90066, 0, 0, 1, 1, 1,
-1.654149, -1.369866, -2.530809, 1, 0, 0, 1, 1,
-1.638105, 0.2845509, -4.596658, 1, 0, 0, 1, 1,
-1.627591, 1.098642, -0.7118245, 1, 0, 0, 1, 1,
-1.62409, 0.5524075, -1.000717, 1, 0, 0, 1, 1,
-1.612586, 1.938326, -0.4004959, 1, 0, 0, 1, 1,
-1.594446, -0.9106642, -2.708359, 0, 0, 0, 1, 1,
-1.580844, -0.4799273, -1.375931, 0, 0, 0, 1, 1,
-1.577034, -0.3943842, -1.760018, 0, 0, 0, 1, 1,
-1.559651, -1.056541, -3.609296, 0, 0, 0, 1, 1,
-1.555992, 1.711645, 0.3268937, 0, 0, 0, 1, 1,
-1.552181, -1.099512, -2.189221, 0, 0, 0, 1, 1,
-1.548083, -1.45221, -2.071861, 0, 0, 0, 1, 1,
-1.536902, 0.8368872, -3.197072, 1, 1, 1, 1, 1,
-1.518389, 0.7363813, -0.6819052, 1, 1, 1, 1, 1,
-1.510017, -0.7001495, -1.264196, 1, 1, 1, 1, 1,
-1.500688, -0.5074931, -1.154726, 1, 1, 1, 1, 1,
-1.500573, 0.964515, -1.369605, 1, 1, 1, 1, 1,
-1.499686, 0.687258, -1.015317, 1, 1, 1, 1, 1,
-1.485182, -0.6238829, -3.085857, 1, 1, 1, 1, 1,
-1.483055, -0.366411, -3.129975, 1, 1, 1, 1, 1,
-1.481713, -0.8946378, -2.439477, 1, 1, 1, 1, 1,
-1.458533, -1.443883, -2.722856, 1, 1, 1, 1, 1,
-1.458121, -0.5652731, -0.6438102, 1, 1, 1, 1, 1,
-1.455529, 1.352518, -1.31656, 1, 1, 1, 1, 1,
-1.427872, -1.147136, -2.515295, 1, 1, 1, 1, 1,
-1.419066, 1.658183, -0.6063734, 1, 1, 1, 1, 1,
-1.415757, -1.397008, -4.011323, 1, 1, 1, 1, 1,
-1.407742, 1.140254, -2.805973, 0, 0, 1, 1, 1,
-1.406025, 2.353281, -0.7191969, 1, 0, 0, 1, 1,
-1.391372, -0.04101838, -1.709853, 1, 0, 0, 1, 1,
-1.390504, -0.3108156, -3.331901, 1, 0, 0, 1, 1,
-1.385635, -0.4623945, -1.21912, 1, 0, 0, 1, 1,
-1.376595, 1.366991, -0.8213468, 1, 0, 0, 1, 1,
-1.374615, 0.4182961, -2.838596, 0, 0, 0, 1, 1,
-1.364554, -1.035705, -1.988583, 0, 0, 0, 1, 1,
-1.359354, 0.1165551, -1.570649, 0, 0, 0, 1, 1,
-1.357076, 2.470594, -1.060075, 0, 0, 0, 1, 1,
-1.348873, -1.191498, -4.659393, 0, 0, 0, 1, 1,
-1.348285, 1.409296, -0.9330093, 0, 0, 0, 1, 1,
-1.343595, -1.53623, -3.828346, 0, 0, 0, 1, 1,
-1.339552, 0.0007773477, -3.329654, 1, 1, 1, 1, 1,
-1.334395, -1.244683, -2.442233, 1, 1, 1, 1, 1,
-1.333616, -0.8532978, -0.9852017, 1, 1, 1, 1, 1,
-1.330219, -0.3095565, -1.78886, 1, 1, 1, 1, 1,
-1.327245, -0.07624182, -0.2470444, 1, 1, 1, 1, 1,
-1.323508, 0.2563781, -0.8359224, 1, 1, 1, 1, 1,
-1.312207, -0.4594446, -3.303149, 1, 1, 1, 1, 1,
-1.306883, -0.4735352, -0.7987276, 1, 1, 1, 1, 1,
-1.290889, 1.287684, 0.5395874, 1, 1, 1, 1, 1,
-1.287714, 2.824774, -0.3653684, 1, 1, 1, 1, 1,
-1.28272, -0.3951476, -2.109495, 1, 1, 1, 1, 1,
-1.273438, 0.8086045, -1.343542, 1, 1, 1, 1, 1,
-1.272719, -0.2872349, -4.187849, 1, 1, 1, 1, 1,
-1.26984, -0.5853209, -2.547278, 1, 1, 1, 1, 1,
-1.267155, 0.30843, -2.883376, 1, 1, 1, 1, 1,
-1.263471, -1.311733, -3.091426, 0, 0, 1, 1, 1,
-1.260754, 1.325651, -1.009533, 1, 0, 0, 1, 1,
-1.258036, -0.1389231, -2.320195, 1, 0, 0, 1, 1,
-1.253885, -1.403274, -1.312627, 1, 0, 0, 1, 1,
-1.253611, -0.04371855, -4.089382, 1, 0, 0, 1, 1,
-1.251802, -0.5276579, -2.694506, 1, 0, 0, 1, 1,
-1.244993, 0.5100895, -1.235061, 0, 0, 0, 1, 1,
-1.241193, -0.1485408, -2.313975, 0, 0, 0, 1, 1,
-1.235559, -0.2108509, -1.659509, 0, 0, 0, 1, 1,
-1.232433, -1.066126, -0.7507687, 0, 0, 0, 1, 1,
-1.228154, 0.1863276, -2.565728, 0, 0, 0, 1, 1,
-1.225864, 1.99438, -0.491292, 0, 0, 0, 1, 1,
-1.217849, 1.505516, 1.083989, 0, 0, 0, 1, 1,
-1.216683, -0.8810169, -3.197634, 1, 1, 1, 1, 1,
-1.216027, -0.04169904, -2.170966, 1, 1, 1, 1, 1,
-1.214714, -0.6004833, -1.08659, 1, 1, 1, 1, 1,
-1.207658, 0.2840747, -1.846043, 1, 1, 1, 1, 1,
-1.19989, 0.4564885, -1.637172, 1, 1, 1, 1, 1,
-1.181542, 0.7925014, -1.926131, 1, 1, 1, 1, 1,
-1.181369, -0.04316508, -3.200942, 1, 1, 1, 1, 1,
-1.170456, -0.5175245, -3.999809, 1, 1, 1, 1, 1,
-1.147588, 0.4056226, 0.5805197, 1, 1, 1, 1, 1,
-1.137074, -0.1419255, -0.9561862, 1, 1, 1, 1, 1,
-1.136587, -0.4514579, -1.91257, 1, 1, 1, 1, 1,
-1.128135, 0.7135211, 0.2770155, 1, 1, 1, 1, 1,
-1.124486, -0.06676839, -0.3169065, 1, 1, 1, 1, 1,
-1.122627, -0.3096183, -2.23155, 1, 1, 1, 1, 1,
-1.115994, -1.68293, -0.07059314, 1, 1, 1, 1, 1,
-1.114071, -0.4274093, -3.156661, 0, 0, 1, 1, 1,
-1.111029, 0.3489828, -0.1281507, 1, 0, 0, 1, 1,
-1.103608, -0.7911286, -2.171521, 1, 0, 0, 1, 1,
-1.097975, -2.141432, -3.173732, 1, 0, 0, 1, 1,
-1.093795, -0.5762441, -2.351608, 1, 0, 0, 1, 1,
-1.092681, 0.6743558, -1.575287, 1, 0, 0, 1, 1,
-1.088189, -0.5494109, -1.984496, 0, 0, 0, 1, 1,
-1.084445, 0.1213414, -2.039045, 0, 0, 0, 1, 1,
-1.082827, 0.33547, -1.648495, 0, 0, 0, 1, 1,
-1.080481, 1.446935, 0.668126, 0, 0, 0, 1, 1,
-1.079846, -0.2423115, -2.292594, 0, 0, 0, 1, 1,
-1.072071, 0.5556378, 0.5362905, 0, 0, 0, 1, 1,
-1.060621, -1.221458, -4.359643, 0, 0, 0, 1, 1,
-1.060049, 0.8081515, -1.688295, 1, 1, 1, 1, 1,
-1.053648, -0.01030642, -2.704606, 1, 1, 1, 1, 1,
-1.045501, -1.453278, -1.653378, 1, 1, 1, 1, 1,
-1.041502, -1.490993, -3.306724, 1, 1, 1, 1, 1,
-1.037617, 1.382303, -0.3575146, 1, 1, 1, 1, 1,
-1.037478, -0.430758, -2.032942, 1, 1, 1, 1, 1,
-1.027105, 1.45439, -1.066285, 1, 1, 1, 1, 1,
-1.018252, 0.234836, -2.075293, 1, 1, 1, 1, 1,
-1.017453, 0.1616583, -1.941813, 1, 1, 1, 1, 1,
-1.004589, 0.2466089, -0.514468, 1, 1, 1, 1, 1,
-0.9981433, 1.154322, -0.9809942, 1, 1, 1, 1, 1,
-0.9969457, -0.1480947, -2.05427, 1, 1, 1, 1, 1,
-0.9949699, -0.5730963, -2.455022, 1, 1, 1, 1, 1,
-0.9944878, 0.6823736, -0.9240372, 1, 1, 1, 1, 1,
-0.9940122, 0.2629712, -0.8795487, 1, 1, 1, 1, 1,
-0.9901763, -0.07454026, -1.091365, 0, 0, 1, 1, 1,
-0.984372, 0.2502369, -0.9121559, 1, 0, 0, 1, 1,
-0.9777127, -0.628664, -1.713667, 1, 0, 0, 1, 1,
-0.9653807, -0.9391395, -4.427781, 1, 0, 0, 1, 1,
-0.9559017, 0.5195491, 0.1872285, 1, 0, 0, 1, 1,
-0.9526179, -0.7176317, -2.365485, 1, 0, 0, 1, 1,
-0.9516007, 1.829213, 0.9297725, 0, 0, 0, 1, 1,
-0.9443832, 1.39535, -2.234274, 0, 0, 0, 1, 1,
-0.9422526, 1.865347, -0.007471909, 0, 0, 0, 1, 1,
-0.9382155, -1.083675, -2.948538, 0, 0, 0, 1, 1,
-0.9351556, -1.275368, -3.077318, 0, 0, 0, 1, 1,
-0.9350383, 0.6656492, -1.975277, 0, 0, 0, 1, 1,
-0.9325078, 0.2513962, -1.253471, 0, 0, 0, 1, 1,
-0.9220566, -2.009667, -3.938351, 1, 1, 1, 1, 1,
-0.9105936, -0.5420536, -2.190649, 1, 1, 1, 1, 1,
-0.9032007, 0.4223901, -1.54803, 1, 1, 1, 1, 1,
-0.9025209, 1.095294, -0.9099615, 1, 1, 1, 1, 1,
-0.9010577, 0.4669368, 0.4734987, 1, 1, 1, 1, 1,
-0.8913359, 0.5149372, -1.943445, 1, 1, 1, 1, 1,
-0.8760318, 1.604042, -2.89221, 1, 1, 1, 1, 1,
-0.8685284, 0.547376, -2.147748, 1, 1, 1, 1, 1,
-0.8666043, 0.1484745, -0.1862133, 1, 1, 1, 1, 1,
-0.8625082, 0.7330081, 0.2598036, 1, 1, 1, 1, 1,
-0.8599897, 0.6596271, -1.718966, 1, 1, 1, 1, 1,
-0.8598435, 1.097708, -1.061898, 1, 1, 1, 1, 1,
-0.8597057, 0.7972656, -3.353418, 1, 1, 1, 1, 1,
-0.8579155, 0.5549102, -0.7453197, 1, 1, 1, 1, 1,
-0.8557958, 1.692991, -0.5988754, 1, 1, 1, 1, 1,
-0.8483372, 2.021429, 1.026984, 0, 0, 1, 1, 1,
-0.8420071, -0.8414741, -2.215266, 1, 0, 0, 1, 1,
-0.840407, -0.7113601, -1.912225, 1, 0, 0, 1, 1,
-0.8390476, 0.4316111, -2.126111, 1, 0, 0, 1, 1,
-0.8376832, 0.008666471, -1.397278, 1, 0, 0, 1, 1,
-0.8374485, -0.6547559, -2.933955, 1, 0, 0, 1, 1,
-0.8370575, 1.854057, -1.492316, 0, 0, 0, 1, 1,
-0.8356396, 0.98847, 0.0923104, 0, 0, 0, 1, 1,
-0.8341689, -0.3244146, -2.557194, 0, 0, 0, 1, 1,
-0.8281732, -1.033774, -4.036994, 0, 0, 0, 1, 1,
-0.8200588, 0.8727483, -0.1372637, 0, 0, 0, 1, 1,
-0.8188592, 0.7577088, -0.9621298, 0, 0, 0, 1, 1,
-0.8184854, 0.8096881, -0.5288034, 0, 0, 0, 1, 1,
-0.8158882, -1.006826, -2.730767, 1, 1, 1, 1, 1,
-0.8136522, 0.6975142, 0.4904637, 1, 1, 1, 1, 1,
-0.8133917, -1.018615, -1.44226, 1, 1, 1, 1, 1,
-0.8105514, -0.07059918, -1.353544, 1, 1, 1, 1, 1,
-0.8098255, -0.2433047, -1.373153, 1, 1, 1, 1, 1,
-0.7992087, 1.205431, 0.05060368, 1, 1, 1, 1, 1,
-0.7853894, 0.5126852, 0.0656781, 1, 1, 1, 1, 1,
-0.7851722, -0.4422205, -1.092228, 1, 1, 1, 1, 1,
-0.7848524, -0.8831009, -1.841559, 1, 1, 1, 1, 1,
-0.7800366, -0.4474863, -2.234102, 1, 1, 1, 1, 1,
-0.7661362, 0.3705688, -0.5527566, 1, 1, 1, 1, 1,
-0.7647004, -1.173006, -2.97846, 1, 1, 1, 1, 1,
-0.7633072, 1.025727, -1.33281, 1, 1, 1, 1, 1,
-0.7608346, 0.1956046, -2.503339, 1, 1, 1, 1, 1,
-0.7556044, 0.2281639, -1.700818, 1, 1, 1, 1, 1,
-0.7555075, -2.041625, -1.565126, 0, 0, 1, 1, 1,
-0.7525538, 0.8532627, -2.396889, 1, 0, 0, 1, 1,
-0.7521499, 0.1539581, -1.602444, 1, 0, 0, 1, 1,
-0.74432, 0.415268, -1.679493, 1, 0, 0, 1, 1,
-0.7437732, -0.0144278, 0.289019, 1, 0, 0, 1, 1,
-0.7376423, 0.04304004, -1.411208, 1, 0, 0, 1, 1,
-0.7366873, 1.40979, -0.7606887, 0, 0, 0, 1, 1,
-0.7280201, 0.9263644, -1.622765, 0, 0, 0, 1, 1,
-0.7271583, -0.5099789, -1.326889, 0, 0, 0, 1, 1,
-0.7212859, -1.459454, -1.325001, 0, 0, 0, 1, 1,
-0.7178469, -0.8844281, -1.213007, 0, 0, 0, 1, 1,
-0.7162833, -0.0712179, -1.120513, 0, 0, 0, 1, 1,
-0.7142301, -0.7592472, -3.834241, 0, 0, 0, 1, 1,
-0.7133896, -0.01983117, -2.459076, 1, 1, 1, 1, 1,
-0.7129564, -0.8429127, -1.302978, 1, 1, 1, 1, 1,
-0.7123751, -1.178514, -1.685233, 1, 1, 1, 1, 1,
-0.7070279, -0.639277, -3.601098, 1, 1, 1, 1, 1,
-0.7055094, -0.6216263, -2.108296, 1, 1, 1, 1, 1,
-0.7048293, 1.748062, 0.09701803, 1, 1, 1, 1, 1,
-0.703311, -0.3381221, -2.766404, 1, 1, 1, 1, 1,
-0.703205, -0.3324571, -3.316765, 1, 1, 1, 1, 1,
-0.7019763, -0.6602757, -2.424803, 1, 1, 1, 1, 1,
-0.6938173, -0.4464611, -5.157569, 1, 1, 1, 1, 1,
-0.6917855, 1.936097, 0.7838284, 1, 1, 1, 1, 1,
-0.6912336, -0.3309814, -2.644851, 1, 1, 1, 1, 1,
-0.6909956, 0.540782, 0.1721878, 1, 1, 1, 1, 1,
-0.6883938, -0.1545523, -0.5380459, 1, 1, 1, 1, 1,
-0.6862235, -1.523892, -3.232412, 1, 1, 1, 1, 1,
-0.6829713, -0.107075, -2.91505, 0, 0, 1, 1, 1,
-0.6784557, 1.028176, -0.9808183, 1, 0, 0, 1, 1,
-0.6701062, 1.372564, -0.4824755, 1, 0, 0, 1, 1,
-0.66766, -1.869375, -3.958169, 1, 0, 0, 1, 1,
-0.650459, 0.3328547, -0.2216466, 1, 0, 0, 1, 1,
-0.6479533, 0.4117009, -2.419061, 1, 0, 0, 1, 1,
-0.6460177, 0.7847759, -1.144823, 0, 0, 0, 1, 1,
-0.6436574, 2.285247, -1.364267, 0, 0, 0, 1, 1,
-0.6427078, 1.031836, -0.5549988, 0, 0, 0, 1, 1,
-0.6423614, 1.042461, -0.5999442, 0, 0, 0, 1, 1,
-0.642053, 0.2945321, -0.7779461, 0, 0, 0, 1, 1,
-0.640364, -0.1572216, -1.531064, 0, 0, 0, 1, 1,
-0.6390269, 0.6062394, -0.05399648, 0, 0, 0, 1, 1,
-0.6348422, 0.4167117, -1.693025, 1, 1, 1, 1, 1,
-0.6323389, 1.104238, -1.811618, 1, 1, 1, 1, 1,
-0.631974, -0.5061952, -4.112856, 1, 1, 1, 1, 1,
-0.628207, -0.6892943, -2.174275, 1, 1, 1, 1, 1,
-0.6276941, 0.5464607, 0.1667003, 1, 1, 1, 1, 1,
-0.6240712, 0.2644329, -2.248431, 1, 1, 1, 1, 1,
-0.6238034, 0.9913713, -0.6308036, 1, 1, 1, 1, 1,
-0.6193831, -0.4158282, -4.08936, 1, 1, 1, 1, 1,
-0.6187375, 0.1247923, 0.2326962, 1, 1, 1, 1, 1,
-0.6173985, -0.1428931, -0.633069, 1, 1, 1, 1, 1,
-0.6164854, -2.266581, -1.185882, 1, 1, 1, 1, 1,
-0.6121493, 0.8356459, -0.5421271, 1, 1, 1, 1, 1,
-0.6113714, -0.6983141, -1.983258, 1, 1, 1, 1, 1,
-0.611158, -0.07530162, -1.449543, 1, 1, 1, 1, 1,
-0.6110994, -0.6634908, -1.32353, 1, 1, 1, 1, 1,
-0.6105146, 1.299485, -2.009257, 0, 0, 1, 1, 1,
-0.6085429, 0.6998202, -0.8189488, 1, 0, 0, 1, 1,
-0.6017323, -0.2285872, -1.340791, 1, 0, 0, 1, 1,
-0.6007132, 0.3810371, -0.3796821, 1, 0, 0, 1, 1,
-0.5992031, -0.32518, -1.618066, 1, 0, 0, 1, 1,
-0.5991281, 0.2254429, -1.939829, 1, 0, 0, 1, 1,
-0.599009, -0.7492893, -1.901201, 0, 0, 0, 1, 1,
-0.5970968, 0.4102042, -0.1986337, 0, 0, 0, 1, 1,
-0.5909609, -0.3918832, -1.875673, 0, 0, 0, 1, 1,
-0.5908906, -0.1628342, -2.332203, 0, 0, 0, 1, 1,
-0.5897528, -0.1523178, -2.608627, 0, 0, 0, 1, 1,
-0.5866334, 2.12105, -1.724924, 0, 0, 0, 1, 1,
-0.5836481, -0.4917728, -2.401826, 0, 0, 0, 1, 1,
-0.5807244, 1.641053, 0.6989018, 1, 1, 1, 1, 1,
-0.5768595, 0.5630836, -0.01138632, 1, 1, 1, 1, 1,
-0.5728402, -0.1097183, -2.265561, 1, 1, 1, 1, 1,
-0.5711712, -0.632427, -4.076511, 1, 1, 1, 1, 1,
-0.5692412, 1.60906, -1.121764, 1, 1, 1, 1, 1,
-0.5686321, -0.7002611, -3.357499, 1, 1, 1, 1, 1,
-0.5664671, -0.5274965, -4.044514, 1, 1, 1, 1, 1,
-0.5653539, -0.9159233, -2.800801, 1, 1, 1, 1, 1,
-0.5603063, 0.2528946, -1.00096, 1, 1, 1, 1, 1,
-0.5548367, -0.04005321, -1.875769, 1, 1, 1, 1, 1,
-0.554202, -0.4729559, -2.109037, 1, 1, 1, 1, 1,
-0.5513549, 0.3614424, -0.1843303, 1, 1, 1, 1, 1,
-0.5416619, 0.6411329, -0.6749178, 1, 1, 1, 1, 1,
-0.536921, -1.174317, -3.734396, 1, 1, 1, 1, 1,
-0.5345951, -1.92629, -3.574442, 1, 1, 1, 1, 1,
-0.5258844, 1.201594, 1.40303, 0, 0, 1, 1, 1,
-0.5113126, -0.7585593, -1.750494, 1, 0, 0, 1, 1,
-0.5097016, -0.77412, -1.330663, 1, 0, 0, 1, 1,
-0.4920746, -0.4994285, -1.175983, 1, 0, 0, 1, 1,
-0.4888282, -0.1801118, -1.359937, 1, 0, 0, 1, 1,
-0.4884686, 1.196256, 0.7593135, 1, 0, 0, 1, 1,
-0.4850982, 0.9170542, -2.616566, 0, 0, 0, 1, 1,
-0.4817459, 0.7099037, -0.8086411, 0, 0, 0, 1, 1,
-0.4803977, -2.185287, -5.575817, 0, 0, 0, 1, 1,
-0.4786572, -0.4388597, -4.601495, 0, 0, 0, 1, 1,
-0.4775779, -0.4446211, -2.566542, 0, 0, 0, 1, 1,
-0.4734979, 0.5564207, -1.47722, 0, 0, 0, 1, 1,
-0.4727184, 0.919539, 0.6655418, 0, 0, 0, 1, 1,
-0.4708276, 1.532416, -0.5417241, 1, 1, 1, 1, 1,
-0.4692999, -0.759003, -1.686617, 1, 1, 1, 1, 1,
-0.4691907, 0.3853673, -0.3853727, 1, 1, 1, 1, 1,
-0.4686924, -0.5812022, -1.895509, 1, 1, 1, 1, 1,
-0.4678184, 2.353856, 2.432661, 1, 1, 1, 1, 1,
-0.4677514, -0.7921736, -1.734205, 1, 1, 1, 1, 1,
-0.4664347, -0.435829, -2.354784, 1, 1, 1, 1, 1,
-0.4659482, -0.254392, -2.846015, 1, 1, 1, 1, 1,
-0.4652978, -0.6392076, -1.723042, 1, 1, 1, 1, 1,
-0.4645102, -0.3205332, -2.733508, 1, 1, 1, 1, 1,
-0.4643022, -0.2394624, -1.390656, 1, 1, 1, 1, 1,
-0.4561673, 2.768055, 0.06203566, 1, 1, 1, 1, 1,
-0.4541901, 2.289156, -0.09853335, 1, 1, 1, 1, 1,
-0.4540513, -0.4064176, -1.870396, 1, 1, 1, 1, 1,
-0.4535196, 1.93786, 1.734709, 1, 1, 1, 1, 1,
-0.4521282, -0.9916352, -3.112175, 0, 0, 1, 1, 1,
-0.4516736, -0.2947813, -1.457394, 1, 0, 0, 1, 1,
-0.4490327, -1.252913, -3.150062, 1, 0, 0, 1, 1,
-0.4484332, -1.501901, -3.148467, 1, 0, 0, 1, 1,
-0.4477624, 0.02407831, 0.1619469, 1, 0, 0, 1, 1,
-0.4476741, -1.218835, -1.79232, 1, 0, 0, 1, 1,
-0.4470091, 0.08172867, -1.585946, 0, 0, 0, 1, 1,
-0.4416854, 0.3607357, -0.456101, 0, 0, 0, 1, 1,
-0.4401259, -0.3434637, -0.04024152, 0, 0, 0, 1, 1,
-0.4387332, -0.4061668, -0.3563604, 0, 0, 0, 1, 1,
-0.438698, -0.1015611, -1.424177, 0, 0, 0, 1, 1,
-0.4276738, 1.750331, -0.8547171, 0, 0, 0, 1, 1,
-0.4268184, 2.129894, -1.787243, 0, 0, 0, 1, 1,
-0.4253533, -1.915897, -3.743151, 1, 1, 1, 1, 1,
-0.4222704, 0.803167, -0.9697503, 1, 1, 1, 1, 1,
-0.4217914, 2.187882, -1.405339, 1, 1, 1, 1, 1,
-0.4205489, -2.70193, -2.176479, 1, 1, 1, 1, 1,
-0.4180992, 0.658006, -1.45911, 1, 1, 1, 1, 1,
-0.4180044, -0.1213883, -1.910898, 1, 1, 1, 1, 1,
-0.4157736, -0.7594181, -1.942207, 1, 1, 1, 1, 1,
-0.4155069, -0.4248343, -2.182247, 1, 1, 1, 1, 1,
-0.4138901, -0.799754, -0.8834357, 1, 1, 1, 1, 1,
-0.4096299, 1.858012, -1.921804, 1, 1, 1, 1, 1,
-0.4021744, 0.6706003, 0.9740171, 1, 1, 1, 1, 1,
-0.401366, -1.219986, -4.635189, 1, 1, 1, 1, 1,
-0.3984042, 0.5187908, -1.788706, 1, 1, 1, 1, 1,
-0.3939376, -0.6087247, -3.164192, 1, 1, 1, 1, 1,
-0.3927334, 0.7692593, 1.76204, 1, 1, 1, 1, 1,
-0.384656, -1.213408, -3.450338, 0, 0, 1, 1, 1,
-0.3806397, -0.04950885, -3.516865, 1, 0, 0, 1, 1,
-0.3794803, 0.4503158, -1.077306, 1, 0, 0, 1, 1,
-0.3736987, 0.2546372, -1.596046, 1, 0, 0, 1, 1,
-0.3736951, -0.9473366, -2.964848, 1, 0, 0, 1, 1,
-0.3736416, 1.288422, 0.002900803, 1, 0, 0, 1, 1,
-0.3715193, -0.3243937, -2.50246, 0, 0, 0, 1, 1,
-0.3663712, 0.2614598, -0.466368, 0, 0, 0, 1, 1,
-0.3653648, 0.4779288, -0.4098159, 0, 0, 0, 1, 1,
-0.3645856, 0.5707865, -0.607003, 0, 0, 0, 1, 1,
-0.3643488, -2.382577, -3.893689, 0, 0, 0, 1, 1,
-0.3592034, -0.02440019, -1.904506, 0, 0, 0, 1, 1,
-0.3591133, -0.1786541, -2.55915, 0, 0, 0, 1, 1,
-0.354321, 1.805041, -2.085299, 1, 1, 1, 1, 1,
-0.3332697, -0.05585625, -0.9731795, 1, 1, 1, 1, 1,
-0.32775, -0.6843867, -2.52792, 1, 1, 1, 1, 1,
-0.3275101, 1.422975, 0.1215374, 1, 1, 1, 1, 1,
-0.3213284, -0.5403512, -4.27849, 1, 1, 1, 1, 1,
-0.3188777, 1.436758, -0.5215858, 1, 1, 1, 1, 1,
-0.3180432, 2.178803, -0.7361513, 1, 1, 1, 1, 1,
-0.3167016, -0.2963776, -2.474653, 1, 1, 1, 1, 1,
-0.3143909, -1.451152, -1.915007, 1, 1, 1, 1, 1,
-0.3122221, 0.6590751, -1.793624, 1, 1, 1, 1, 1,
-0.3121336, -0.8124854, -2.185624, 1, 1, 1, 1, 1,
-0.3065435, 0.6184647, 0.2975717, 1, 1, 1, 1, 1,
-0.2994371, -1.959229, -3.313069, 1, 1, 1, 1, 1,
-0.2977183, -0.5257792, -0.7452585, 1, 1, 1, 1, 1,
-0.2972402, -0.3127757, -2.102197, 1, 1, 1, 1, 1,
-0.2968154, 1.455307, -0.8187138, 0, 0, 1, 1, 1,
-0.2938452, -0.6453499, -2.10674, 1, 0, 0, 1, 1,
-0.2907783, 0.5479788, -0.3389727, 1, 0, 0, 1, 1,
-0.2892282, 0.6713309, -0.9331343, 1, 0, 0, 1, 1,
-0.2848672, -0.632946, -1.647565, 1, 0, 0, 1, 1,
-0.2773935, 1.054065, -1.674461, 1, 0, 0, 1, 1,
-0.2665973, 1.488627, 0.8864452, 0, 0, 0, 1, 1,
-0.2636596, 0.4032905, 0.006224485, 0, 0, 0, 1, 1,
-0.2616904, -0.01846355, -2.681383, 0, 0, 0, 1, 1,
-0.2543246, -0.2053338, -0.3788432, 0, 0, 0, 1, 1,
-0.2537008, 0.4625294, -0.1266297, 0, 0, 0, 1, 1,
-0.2527766, -0.1143028, -1.727896, 0, 0, 0, 1, 1,
-0.2519977, -1.223878, -3.446147, 0, 0, 0, 1, 1,
-0.248274, 0.2328231, -0.6116927, 1, 1, 1, 1, 1,
-0.2480818, -0.2445937, -2.247981, 1, 1, 1, 1, 1,
-0.2448021, -1.45441, -3.325315, 1, 1, 1, 1, 1,
-0.2439218, -1.549679, -2.52978, 1, 1, 1, 1, 1,
-0.2398543, 2.216013, 0.5820965, 1, 1, 1, 1, 1,
-0.2377814, 2.204717, -1.513163, 1, 1, 1, 1, 1,
-0.2349186, -0.2105929, -3.215032, 1, 1, 1, 1, 1,
-0.232741, 0.3071407, -1.554234, 1, 1, 1, 1, 1,
-0.2302718, 1.384457, 2.775168, 1, 1, 1, 1, 1,
-0.2299018, 0.7711126, -0.5771503, 1, 1, 1, 1, 1,
-0.2225697, 0.1128667, -0.7916086, 1, 1, 1, 1, 1,
-0.2223213, 0.1814161, -1.503148, 1, 1, 1, 1, 1,
-0.2194529, -0.2705082, -4.981102, 1, 1, 1, 1, 1,
-0.2173049, -0.5825472, -2.531618, 1, 1, 1, 1, 1,
-0.2134098, 2.257265, -1.251844, 1, 1, 1, 1, 1,
-0.2130432, -0.9312034, -2.304356, 0, 0, 1, 1, 1,
-0.2086859, 0.8013378, -0.7320698, 1, 0, 0, 1, 1,
-0.207737, -0.6114659, -2.532989, 1, 0, 0, 1, 1,
-0.2033157, 1.687165, -1.302093, 1, 0, 0, 1, 1,
-0.2024566, -1.167061, -1.802174, 1, 0, 0, 1, 1,
-0.2018213, 0.6106538, 0.2582935, 1, 0, 0, 1, 1,
-0.1999431, 2.432831, -1.786179, 0, 0, 0, 1, 1,
-0.1997516, 0.9662332, -0.9910229, 0, 0, 0, 1, 1,
-0.1960006, 0.8250951, -1.639281, 0, 0, 0, 1, 1,
-0.1932876, -0.8671382, -3.342745, 0, 0, 0, 1, 1,
-0.1892891, -1.468949, -1.596707, 0, 0, 0, 1, 1,
-0.1872789, -1.022666, -3.460643, 0, 0, 0, 1, 1,
-0.1796651, 2.274192, 1.232165, 0, 0, 0, 1, 1,
-0.1783808, -1.284792, -2.572069, 1, 1, 1, 1, 1,
-0.1767161, 0.8075491, 1.32775, 1, 1, 1, 1, 1,
-0.1730266, -1.007881, -2.84707, 1, 1, 1, 1, 1,
-0.1729612, 0.6626154, -0.7442574, 1, 1, 1, 1, 1,
-0.167294, 1.280908, 0.06917645, 1, 1, 1, 1, 1,
-0.1643799, -1.336601, -2.53608, 1, 1, 1, 1, 1,
-0.1582216, -0.6544084, -3.900635, 1, 1, 1, 1, 1,
-0.1569012, -0.8688384, -3.689568, 1, 1, 1, 1, 1,
-0.1568242, 0.425964, -1.317136, 1, 1, 1, 1, 1,
-0.1564535, 2.608987, -0.9743438, 1, 1, 1, 1, 1,
-0.1564472, 0.7177171, -1.194522, 1, 1, 1, 1, 1,
-0.1531494, -0.578365, -1.209452, 1, 1, 1, 1, 1,
-0.1506198, 0.538289, 1.090349, 1, 1, 1, 1, 1,
-0.1503156, 0.7840157, 0.6428902, 1, 1, 1, 1, 1,
-0.1472839, -1.290388, -2.931772, 1, 1, 1, 1, 1,
-0.139771, -0.5935287, -1.678102, 0, 0, 1, 1, 1,
-0.1360785, 0.08019199, -0.2506412, 1, 0, 0, 1, 1,
-0.1318064, -0.4273455, -1.071228, 1, 0, 0, 1, 1,
-0.1305119, -0.2254735, -3.290419, 1, 0, 0, 1, 1,
-0.1264538, 0.8314002, -0.7599396, 1, 0, 0, 1, 1,
-0.1224233, 0.3430401, -0.1341633, 1, 0, 0, 1, 1,
-0.1176158, -0.9921784, -3.787988, 0, 0, 0, 1, 1,
-0.1148447, -0.2738965, -2.034186, 0, 0, 0, 1, 1,
-0.1035396, 0.7486388, 0.2914732, 0, 0, 0, 1, 1,
-0.1027456, -2.104921, -3.919936, 0, 0, 0, 1, 1,
-0.1002841, 0.4217815, -0.5151519, 0, 0, 0, 1, 1,
-0.09814032, -1.129854, -4.492873, 0, 0, 0, 1, 1,
-0.09792254, -0.9334608, -1.982316, 0, 0, 0, 1, 1,
-0.09537446, -0.6738449, -3.820404, 1, 1, 1, 1, 1,
-0.09417187, -0.07676628, -2.313207, 1, 1, 1, 1, 1,
-0.09346464, 0.6990013, -1.674917, 1, 1, 1, 1, 1,
-0.09330484, -1.302507, -2.137752, 1, 1, 1, 1, 1,
-0.08963612, -0.3503048, -3.747204, 1, 1, 1, 1, 1,
-0.08866206, -1.301973, -1.851654, 1, 1, 1, 1, 1,
-0.08209598, 0.1121904, 0.3958115, 1, 1, 1, 1, 1,
-0.07973231, -1.558096, -3.859764, 1, 1, 1, 1, 1,
-0.07967122, -0.414832, -3.368708, 1, 1, 1, 1, 1,
-0.07953984, -1.836562, -3.908589, 1, 1, 1, 1, 1,
-0.07766476, 0.5532756, -0.750904, 1, 1, 1, 1, 1,
-0.07740196, 1.824235, 1.718972, 1, 1, 1, 1, 1,
-0.06901845, -0.9772846, -3.936336, 1, 1, 1, 1, 1,
-0.05886228, 0.05729864, -3.14641, 1, 1, 1, 1, 1,
-0.05417306, -0.2452986, -3.84506, 1, 1, 1, 1, 1,
-0.05346655, 0.1247122, 0.5604779, 0, 0, 1, 1, 1,
-0.05131173, 1.009114, 0.3045535, 1, 0, 0, 1, 1,
-0.04911548, -0.05911177, -1.620707, 1, 0, 0, 1, 1,
-0.04717421, 1.557781, -0.8881835, 1, 0, 0, 1, 1,
-0.04622372, 3.322064, 1.167383, 1, 0, 0, 1, 1,
-0.04025014, 0.7629818, 0.6398999, 1, 0, 0, 1, 1,
-0.04003352, 2.014057, -0.4879221, 0, 0, 0, 1, 1,
-0.03904792, 0.7486428, -1.148866, 0, 0, 0, 1, 1,
-0.03134941, -0.2557857, -3.547831, 0, 0, 0, 1, 1,
-0.02975158, -1.392063, -1.2801, 0, 0, 0, 1, 1,
-0.0272847, -0.6315107, -2.015632, 0, 0, 0, 1, 1,
-0.02275124, 0.3971958, 0.4477338, 0, 0, 0, 1, 1,
-0.01999808, -0.2306483, -3.416181, 0, 0, 0, 1, 1,
-0.01488823, -0.1202689, -2.416919, 1, 1, 1, 1, 1,
-0.01449707, -1.277386, -4.621366, 1, 1, 1, 1, 1,
-0.01426853, 0.4205249, -2.206601, 1, 1, 1, 1, 1,
-0.01310111, -0.6812613, -3.646835, 1, 1, 1, 1, 1,
-0.01126838, -0.4008307, -2.943167, 1, 1, 1, 1, 1,
-0.01089052, 0.4971197, 0.4584686, 1, 1, 1, 1, 1,
-0.01028549, 1.110255, -1.577995, 1, 1, 1, 1, 1,
-0.009754154, -0.2464259, -3.718296, 1, 1, 1, 1, 1,
-0.008650837, -0.6273521, -3.57984, 1, 1, 1, 1, 1,
-0.0080275, 1.298755, -1.589183, 1, 1, 1, 1, 1,
-0.006780562, 0.6531991, 1.510887, 1, 1, 1, 1, 1,
-0.00228517, 2.015665, -0.9584195, 1, 1, 1, 1, 1,
-0.001375598, 1.630328, -0.0153508, 1, 1, 1, 1, 1,
0.004351587, -0.359913, 4.398183, 1, 1, 1, 1, 1,
0.004547944, -0.04982257, 5.522158, 1, 1, 1, 1, 1,
0.006532692, 0.5634016, 0.860195, 0, 0, 1, 1, 1,
0.01412598, 0.2422725, -0.0132816, 1, 0, 0, 1, 1,
0.01475395, 0.2877489, 1.374826, 1, 0, 0, 1, 1,
0.01518687, 0.3042774, -0.08012313, 1, 0, 0, 1, 1,
0.01785405, -0.9780446, 1.995119, 1, 0, 0, 1, 1,
0.02310708, 0.118238, -1.292726, 1, 0, 0, 1, 1,
0.02669593, -0.136654, 2.452144, 0, 0, 0, 1, 1,
0.02925043, 0.7901268, -1.096091, 0, 0, 0, 1, 1,
0.03165308, -0.09207297, 2.551125, 0, 0, 0, 1, 1,
0.03230615, -2.686046, 3.661071, 0, 0, 0, 1, 1,
0.03322896, 0.06195321, 1.823849, 0, 0, 0, 1, 1,
0.03421094, 0.1149791, 1.146111, 0, 0, 0, 1, 1,
0.0356635, -1.889383, 3.847581, 0, 0, 0, 1, 1,
0.03585293, -0.5542446, 2.620956, 1, 1, 1, 1, 1,
0.03917164, 1.641013, -3.024485, 1, 1, 1, 1, 1,
0.04162489, 0.3195363, -2.06387, 1, 1, 1, 1, 1,
0.04174308, -0.2354959, 1.907403, 1, 1, 1, 1, 1,
0.04527676, 0.1715174, 1.460497, 1, 1, 1, 1, 1,
0.04633151, -0.1037009, 2.540774, 1, 1, 1, 1, 1,
0.05388508, 0.4618498, 1.226194, 1, 1, 1, 1, 1,
0.05673743, -0.5831978, 1.901925, 1, 1, 1, 1, 1,
0.05764419, 0.2973681, -0.07956834, 1, 1, 1, 1, 1,
0.0649961, -1.042546, 4.318696, 1, 1, 1, 1, 1,
0.06950487, -0.05102492, 3.091395, 1, 1, 1, 1, 1,
0.07542785, 0.2386156, 3.171214, 1, 1, 1, 1, 1,
0.0769248, 0.04484335, 2.795437, 1, 1, 1, 1, 1,
0.07926708, 0.7833524, 1.101002, 1, 1, 1, 1, 1,
0.07978464, 1.582296, -1.735323, 1, 1, 1, 1, 1,
0.08197874, -0.7327982, 4.726744, 0, 0, 1, 1, 1,
0.08474279, -0.08408578, 1.484331, 1, 0, 0, 1, 1,
0.08527853, -0.2341071, 0.1485676, 1, 0, 0, 1, 1,
0.08660478, 1.597926, 0.2644189, 1, 0, 0, 1, 1,
0.08930268, 0.8148864, -0.214511, 1, 0, 0, 1, 1,
0.09181829, 0.9737155, -0.3738132, 1, 0, 0, 1, 1,
0.09385604, 0.7161258, 1.731429, 0, 0, 0, 1, 1,
0.09599346, -0.6011756, 3.883945, 0, 0, 0, 1, 1,
0.09611703, -0.2146472, 1.795922, 0, 0, 0, 1, 1,
0.09984031, -0.223697, 4.045485, 0, 0, 0, 1, 1,
0.1031721, -1.263115, 3.725077, 0, 0, 0, 1, 1,
0.1036917, -0.6066409, 3.659951, 0, 0, 0, 1, 1,
0.1040899, -0.1151572, 3.044748, 0, 0, 0, 1, 1,
0.1057327, -0.3389701, 0.1876562, 1, 1, 1, 1, 1,
0.1092985, 0.1715167, 0.6550305, 1, 1, 1, 1, 1,
0.1095715, -2.440402, 1.875808, 1, 1, 1, 1, 1,
0.1101572, -0.9234255, 2.561936, 1, 1, 1, 1, 1,
0.1113401, -0.3480363, 2.277719, 1, 1, 1, 1, 1,
0.1251467, -1.289529, 2.523505, 1, 1, 1, 1, 1,
0.1255621, -2.324096, 4.045619, 1, 1, 1, 1, 1,
0.1256731, -0.9872726, 1.776994, 1, 1, 1, 1, 1,
0.129685, -0.8853932, 3.593617, 1, 1, 1, 1, 1,
0.1299104, -0.2420739, 1.917648, 1, 1, 1, 1, 1,
0.1301429, -0.2758006, 2.776584, 1, 1, 1, 1, 1,
0.1349992, 1.222205, -0.3308768, 1, 1, 1, 1, 1,
0.1351562, 1.47315, 0.1021722, 1, 1, 1, 1, 1,
0.1366275, 0.3566284, -0.717916, 1, 1, 1, 1, 1,
0.1407151, 0.1297414, 0.9125066, 1, 1, 1, 1, 1,
0.1438496, 0.1301751, 0.4536131, 0, 0, 1, 1, 1,
0.1442604, -0.6247707, 3.518061, 1, 0, 0, 1, 1,
0.1446778, 1.146329, 2.756739, 1, 0, 0, 1, 1,
0.1482288, 1.715471, -0.2637236, 1, 0, 0, 1, 1,
0.1487481, -1.047174, 3.693581, 1, 0, 0, 1, 1,
0.1495705, 0.630706, 1.593346, 1, 0, 0, 1, 1,
0.1529137, 0.3033195, -0.712339, 0, 0, 0, 1, 1,
0.1541281, -0.6375983, 2.468936, 0, 0, 0, 1, 1,
0.1555, -0.5500793, 1.942977, 0, 0, 0, 1, 1,
0.15578, 0.6265128, 1.4494, 0, 0, 0, 1, 1,
0.1581706, -1.830166, 4.140146, 0, 0, 0, 1, 1,
0.1583521, -1.097348, 2.369184, 0, 0, 0, 1, 1,
0.162123, 0.04488759, 1.633998, 0, 0, 0, 1, 1,
0.1678188, -1.484364, 2.404423, 1, 1, 1, 1, 1,
0.1707314, 0.08821723, 1.185743, 1, 1, 1, 1, 1,
0.1718174, -1.519732, 3.111342, 1, 1, 1, 1, 1,
0.1737064, 0.4462483, 0.5738938, 1, 1, 1, 1, 1,
0.1738063, -0.02728767, 3.749455, 1, 1, 1, 1, 1,
0.1744819, -0.8782333, 3.134734, 1, 1, 1, 1, 1,
0.1766564, -0.1469325, 3.411184, 1, 1, 1, 1, 1,
0.1767335, -0.5087472, 3.04198, 1, 1, 1, 1, 1,
0.1804078, 0.05326381, 0.7426166, 1, 1, 1, 1, 1,
0.1805245, -0.6341665, 4.350443, 1, 1, 1, 1, 1,
0.1882465, 0.6999697, 0.1197208, 1, 1, 1, 1, 1,
0.1886898, -1.151273, 2.429549, 1, 1, 1, 1, 1,
0.1893898, -0.2620316, 2.520872, 1, 1, 1, 1, 1,
0.1895001, -0.2790489, 2.05657, 1, 1, 1, 1, 1,
0.1919721, -1.157939, 3.964341, 1, 1, 1, 1, 1,
0.1935012, -0.002223597, 2.802608, 0, 0, 1, 1, 1,
0.1970355, -0.06805969, 2.69622, 1, 0, 0, 1, 1,
0.1983561, -1.011787, 3.675475, 1, 0, 0, 1, 1,
0.2023672, 1.350425, 2.101877, 1, 0, 0, 1, 1,
0.2087992, 0.9378589, 0.8236003, 1, 0, 0, 1, 1,
0.2093504, 0.7120982, -0.8503494, 1, 0, 0, 1, 1,
0.215414, 1.074842, 1.012261, 0, 0, 0, 1, 1,
0.2157717, -0.3449105, 2.637325, 0, 0, 0, 1, 1,
0.2194129, -1.98109, 4.101846, 0, 0, 0, 1, 1,
0.2207218, 0.08111773, 2.506414, 0, 0, 0, 1, 1,
0.2238768, -1.613647, 3.834823, 0, 0, 0, 1, 1,
0.2255803, 1.153939, 0.039252, 0, 0, 0, 1, 1,
0.2295641, -0.2426524, 1.153369, 0, 0, 0, 1, 1,
0.2319163, -0.0872154, 1.825424, 1, 1, 1, 1, 1,
0.2321552, -0.6964225, 2.656126, 1, 1, 1, 1, 1,
0.2338566, 1.734796, -0.914455, 1, 1, 1, 1, 1,
0.2367613, -1.001389, 2.618905, 1, 1, 1, 1, 1,
0.2368749, -0.8807315, 1.476508, 1, 1, 1, 1, 1,
0.2382643, -2.006334, 2.872281, 1, 1, 1, 1, 1,
0.2389397, -0.8742121, 2.642536, 1, 1, 1, 1, 1,
0.2406047, -0.2590534, 1.865977, 1, 1, 1, 1, 1,
0.2408263, -0.7436088, 3.323859, 1, 1, 1, 1, 1,
0.2422988, 1.348814, 1.007216, 1, 1, 1, 1, 1,
0.2424378, -0.7837398, 2.455832, 1, 1, 1, 1, 1,
0.2450134, 0.8978778, 1.81745, 1, 1, 1, 1, 1,
0.2458606, -1.502765, 4.506924, 1, 1, 1, 1, 1,
0.245932, 0.8778288, -1.151073, 1, 1, 1, 1, 1,
0.2529154, 0.700122, -0.2103779, 1, 1, 1, 1, 1,
0.2544909, -0.7430529, 3.846213, 0, 0, 1, 1, 1,
0.2556719, -0.3184605, 1.005628, 1, 0, 0, 1, 1,
0.2567924, 0.5847157, 1.651107, 1, 0, 0, 1, 1,
0.261032, 0.7085013, -1.139707, 1, 0, 0, 1, 1,
0.2615043, 0.3434764, -0.478786, 1, 0, 0, 1, 1,
0.2615493, -0.6539468, 1.923207, 1, 0, 0, 1, 1,
0.2689447, -1.362581, 3.836242, 0, 0, 0, 1, 1,
0.2708423, -0.4367526, 3.583004, 0, 0, 0, 1, 1,
0.272954, 0.7730815, -0.7008479, 0, 0, 0, 1, 1,
0.2754325, 0.1353436, 0.5814514, 0, 0, 0, 1, 1,
0.2777437, 1.366493, 0.06288743, 0, 0, 0, 1, 1,
0.2785618, -0.6470373, 3.08967, 0, 0, 0, 1, 1,
0.2801694, 1.1005, 1.310791, 0, 0, 0, 1, 1,
0.2825797, 0.4952941, 0.7314051, 1, 1, 1, 1, 1,
0.2834779, 0.3812571, 0.958742, 1, 1, 1, 1, 1,
0.2849476, 0.3425602, -0.3496357, 1, 1, 1, 1, 1,
0.2883294, 0.4230702, 2.269341, 1, 1, 1, 1, 1,
0.2947487, 0.4620606, 0.8305302, 1, 1, 1, 1, 1,
0.2968933, -1.645663, 3.392022, 1, 1, 1, 1, 1,
0.3001243, -0.8728001, 2.364036, 1, 1, 1, 1, 1,
0.304121, -0.5336241, 3.78182, 1, 1, 1, 1, 1,
0.3059599, -1.108254, 2.930463, 1, 1, 1, 1, 1,
0.3061178, 0.01832325, 0.4129598, 1, 1, 1, 1, 1,
0.3062756, 0.4012498, 0.8091787, 1, 1, 1, 1, 1,
0.3067994, -0.4068004, 4.041932, 1, 1, 1, 1, 1,
0.3072356, -2.034517, 4.964621, 1, 1, 1, 1, 1,
0.3094398, 1.175289, -3.579878, 1, 1, 1, 1, 1,
0.3189532, 1.686088, 2.229003, 1, 1, 1, 1, 1,
0.3212576, -0.3840173, 1.401467, 0, 0, 1, 1, 1,
0.3265023, 1.140818, 0.3081028, 1, 0, 0, 1, 1,
0.327888, 1.299025, 1.07354, 1, 0, 0, 1, 1,
0.3338667, 0.6626262, -0.2094248, 1, 0, 0, 1, 1,
0.3367397, 2.231162, 0.8020826, 1, 0, 0, 1, 1,
0.3461213, 1.718907, -0.5213377, 1, 0, 0, 1, 1,
0.3508095, 1.388746, -0.8979951, 0, 0, 0, 1, 1,
0.3528598, 2.303846, 1.092413, 0, 0, 0, 1, 1,
0.3629409, 1.788238, 0.1487103, 0, 0, 0, 1, 1,
0.3644888, 0.8885764, -1.081383, 0, 0, 0, 1, 1,
0.3665359, -0.9529396, 1.605933, 0, 0, 0, 1, 1,
0.3700427, 0.9427558, 2.526295, 0, 0, 0, 1, 1,
0.3735045, 0.7844271, 0.452599, 0, 0, 0, 1, 1,
0.3825298, -0.3455278, 2.55461, 1, 1, 1, 1, 1,
0.3854355, -0.9098433, 2.13036, 1, 1, 1, 1, 1,
0.3857038, -0.2807786, 3.379726, 1, 1, 1, 1, 1,
0.3865022, -1.528698, 3.017404, 1, 1, 1, 1, 1,
0.3873875, -1.826524, 1.866986, 1, 1, 1, 1, 1,
0.3892021, 2.412014, -2.143936, 1, 1, 1, 1, 1,
0.3909205, 0.9213922, -0.7210588, 1, 1, 1, 1, 1,
0.3944187, 0.1305539, 1.737059, 1, 1, 1, 1, 1,
0.4041915, -1.378441, 1.601741, 1, 1, 1, 1, 1,
0.4077669, 0.4207132, 0.1452833, 1, 1, 1, 1, 1,
0.4083509, -1.152011, 4.082868, 1, 1, 1, 1, 1,
0.4084273, 0.6492816, 0.09533001, 1, 1, 1, 1, 1,
0.4106845, 0.4894661, 0.6019866, 1, 1, 1, 1, 1,
0.4120889, 0.9099665, 0.8095888, 1, 1, 1, 1, 1,
0.4129991, 1.51805, -1.02978, 1, 1, 1, 1, 1,
0.4217061, 0.4917077, 0.8825369, 0, 0, 1, 1, 1,
0.4221987, -0.02344327, 1.05027, 1, 0, 0, 1, 1,
0.4233021, 0.2862401, 0.8219814, 1, 0, 0, 1, 1,
0.4280308, 0.4798687, 2.121803, 1, 0, 0, 1, 1,
0.4328201, -0.5480939, 2.743716, 1, 0, 0, 1, 1,
0.4362335, -0.9120878, 3.631407, 1, 0, 0, 1, 1,
0.4434202, 0.6157871, 1.020143, 0, 0, 0, 1, 1,
0.4447496, 0.4916961, 0.7073185, 0, 0, 0, 1, 1,
0.4467427, -0.5685791, 0.1188397, 0, 0, 0, 1, 1,
0.4475292, 0.03345484, 2.198236, 0, 0, 0, 1, 1,
0.4492534, -0.5740799, 1.093668, 0, 0, 0, 1, 1,
0.4529519, -1.067268, 3.671942, 0, 0, 0, 1, 1,
0.4539087, -0.678524, 3.810842, 0, 0, 0, 1, 1,
0.4588058, -1.333075, 3.297573, 1, 1, 1, 1, 1,
0.464017, -0.5430415, 2.053984, 1, 1, 1, 1, 1,
0.4640552, -1.06202, 2.42453, 1, 1, 1, 1, 1,
0.4646521, -0.1245343, 2.297876, 1, 1, 1, 1, 1,
0.4653545, 0.3641227, 0.6301603, 1, 1, 1, 1, 1,
0.4661497, 2.004917, -2.458833, 1, 1, 1, 1, 1,
0.4679045, 0.04227054, 1.686581, 1, 1, 1, 1, 1,
0.4715338, -1.823688, 2.977544, 1, 1, 1, 1, 1,
0.4738562, -0.2047409, 2.302822, 1, 1, 1, 1, 1,
0.4748647, 0.5834706, 0.5156772, 1, 1, 1, 1, 1,
0.4791889, -0.1157392, 1.561454, 1, 1, 1, 1, 1,
0.4793961, -0.3399885, 2.779445, 1, 1, 1, 1, 1,
0.4868214, -0.3785946, 2.723001, 1, 1, 1, 1, 1,
0.4914689, 1.443389, -0.1326609, 1, 1, 1, 1, 1,
0.4951204, 0.6241879, 1.612825, 1, 1, 1, 1, 1,
0.4983384, -1.340293, 4.68858, 0, 0, 1, 1, 1,
0.5010533, -0.4237194, 2.843623, 1, 0, 0, 1, 1,
0.508142, -2.317018, 3.828944, 1, 0, 0, 1, 1,
0.5107039, 0.3259635, 0.7720118, 1, 0, 0, 1, 1,
0.5126858, 0.8667519, -0.258042, 1, 0, 0, 1, 1,
0.5216771, 0.1907173, 0.3382501, 1, 0, 0, 1, 1,
0.5269228, -2.66289, 1.904021, 0, 0, 0, 1, 1,
0.5277596, -1.282552, 0.4320413, 0, 0, 0, 1, 1,
0.528573, 0.6394733, -0.9423466, 0, 0, 0, 1, 1,
0.5289233, 0.475351, 1.307045, 0, 0, 0, 1, 1,
0.5310544, 0.2486781, 2.150613, 0, 0, 0, 1, 1,
0.5338585, 0.1040953, 1.625702, 0, 0, 0, 1, 1,
0.536669, -0.3017606, 3.362432, 0, 0, 0, 1, 1,
0.5402234, -0.5263078, 2.224092, 1, 1, 1, 1, 1,
0.5408947, -0.2868104, 4.281677, 1, 1, 1, 1, 1,
0.5412673, -1.452785, 2.512589, 1, 1, 1, 1, 1,
0.5446994, -0.3881647, 1.177534, 1, 1, 1, 1, 1,
0.5450336, -0.9258604, 2.163252, 1, 1, 1, 1, 1,
0.5456696, -0.03630996, 0.5383362, 1, 1, 1, 1, 1,
0.5519468, 2.483292, 0.1593107, 1, 1, 1, 1, 1,
0.5533868, 0.1794751, -0.07762079, 1, 1, 1, 1, 1,
0.5623547, -0.133695, 1.593785, 1, 1, 1, 1, 1,
0.5626794, -1.341742, 2.840588, 1, 1, 1, 1, 1,
0.5659177, 1.978318, -1.540885, 1, 1, 1, 1, 1,
0.5692217, 0.2894497, 1.736714, 1, 1, 1, 1, 1,
0.5731912, 0.7605345, 1.448206, 1, 1, 1, 1, 1,
0.5778241, -2.05355, 3.592188, 1, 1, 1, 1, 1,
0.5799737, 1.782658, -0.0705795, 1, 1, 1, 1, 1,
0.5852783, 0.01575807, 3.329828, 0, 0, 1, 1, 1,
0.5859525, 1.28429, 1.041317, 1, 0, 0, 1, 1,
0.5873794, -0.9063691, 3.485353, 1, 0, 0, 1, 1,
0.5909073, -0.1471761, 1.988183, 1, 0, 0, 1, 1,
0.5937455, -0.9096682, 3.640825, 1, 0, 0, 1, 1,
0.5943393, -1.236274, 2.613069, 1, 0, 0, 1, 1,
0.5969181, -0.7314677, 1.534688, 0, 0, 0, 1, 1,
0.6001714, 0.4515665, 1.063367, 0, 0, 0, 1, 1,
0.6027552, -0.3896321, 1.198926, 0, 0, 0, 1, 1,
0.6053655, -1.514371, 3.405972, 0, 0, 0, 1, 1,
0.6058762, 1.536563, 2.206475, 0, 0, 0, 1, 1,
0.6069679, -1.933917, 2.783164, 0, 0, 0, 1, 1,
0.6086729, -1.829402, 3.668221, 0, 0, 0, 1, 1,
0.6100049, -0.8561709, 2.067826, 1, 1, 1, 1, 1,
0.6138132, -0.2487435, 1.272477, 1, 1, 1, 1, 1,
0.6139155, -0.000884332, 3.414589, 1, 1, 1, 1, 1,
0.6191751, 1.230649, -0.4522917, 1, 1, 1, 1, 1,
0.6314449, -0.1933504, 1.65368, 1, 1, 1, 1, 1,
0.6347128, -0.3434417, 4.372683, 1, 1, 1, 1, 1,
0.6388361, 1.064306, 0.3956941, 1, 1, 1, 1, 1,
0.6388846, 0.6445729, 2.528515, 1, 1, 1, 1, 1,
0.640502, -0.007091298, 1.700901, 1, 1, 1, 1, 1,
0.6426761, -0.5358593, 2.444275, 1, 1, 1, 1, 1,
0.6453665, 0.3471111, 0.2758523, 1, 1, 1, 1, 1,
0.6490533, 0.4029326, 0.927448, 1, 1, 1, 1, 1,
0.6516519, 0.835039, 0.5477292, 1, 1, 1, 1, 1,
0.6565175, -1.663013, 3.487382, 1, 1, 1, 1, 1,
0.6596725, 0.8899627, 0.01055185, 1, 1, 1, 1, 1,
0.6601889, -1.246248, 0.5083967, 0, 0, 1, 1, 1,
0.6603335, 1.38052, 1.279523, 1, 0, 0, 1, 1,
0.6618305, -0.3584487, 2.320572, 1, 0, 0, 1, 1,
0.6638483, -0.1589977, 1.351207, 1, 0, 0, 1, 1,
0.6640404, 0.335391, -0.7775316, 1, 0, 0, 1, 1,
0.6662824, -0.2471334, 2.723598, 1, 0, 0, 1, 1,
0.6685939, 0.2700275, 2.391522, 0, 0, 0, 1, 1,
0.6695271, -2.21574e-05, -0.06505767, 0, 0, 0, 1, 1,
0.6697309, -0.6558121, 2.400878, 0, 0, 0, 1, 1,
0.6714411, -1.657495, 2.656583, 0, 0, 0, 1, 1,
0.6724146, -0.1882324, 1.226808, 0, 0, 0, 1, 1,
0.6766737, 1.420443, 0.3635494, 0, 0, 0, 1, 1,
0.6791058, 1.198583, 0.4551819, 0, 0, 0, 1, 1,
0.6792641, -0.2085649, 4.841173, 1, 1, 1, 1, 1,
0.6871962, 0.6212431, -1.210203, 1, 1, 1, 1, 1,
0.6913266, 1.737542, 0.3763756, 1, 1, 1, 1, 1,
0.6921942, -1.267499, 1.451309, 1, 1, 1, 1, 1,
0.6932493, -0.8271887, 3.930818, 1, 1, 1, 1, 1,
0.7047178, -0.6338708, 2.831716, 1, 1, 1, 1, 1,
0.7058007, 0.4049118, 1.343745, 1, 1, 1, 1, 1,
0.7069666, -0.04269092, -0.002662685, 1, 1, 1, 1, 1,
0.7102527, 1.283355, 0.6834604, 1, 1, 1, 1, 1,
0.7158442, -1.353941, 3.314631, 1, 1, 1, 1, 1,
0.717847, 0.225408, 2.840603, 1, 1, 1, 1, 1,
0.7197769, 0.06661991, 3.321013, 1, 1, 1, 1, 1,
0.7209171, 0.03481974, 1.817184, 1, 1, 1, 1, 1,
0.726652, 0.834783, 1.544022, 1, 1, 1, 1, 1,
0.7294695, 0.8027684, 2.754725, 1, 1, 1, 1, 1,
0.7306463, 1.233061, 1.000899, 0, 0, 1, 1, 1,
0.7322353, -0.7539588, 1.647635, 1, 0, 0, 1, 1,
0.7334393, -0.2485805, 0.5016503, 1, 0, 0, 1, 1,
0.7361597, 0.3130215, 0.5666038, 1, 0, 0, 1, 1,
0.739402, 0.6134477, -0.347414, 1, 0, 0, 1, 1,
0.7483727, -0.137775, -0.3449761, 1, 0, 0, 1, 1,
0.7486259, 0.1582917, 0.8182493, 0, 0, 0, 1, 1,
0.7607484, 0.1792935, 1.965899, 0, 0, 0, 1, 1,
0.7665133, -1.218448, 1.507391, 0, 0, 0, 1, 1,
0.7694761, -0.4645427, 1.050223, 0, 0, 0, 1, 1,
0.7731716, -0.8519878, 1.457166, 0, 0, 0, 1, 1,
0.7736023, -0.2647596, 1.52298, 0, 0, 0, 1, 1,
0.774049, -1.755928, 3.045304, 0, 0, 0, 1, 1,
0.7810248, 0.6159291, 0.5686677, 1, 1, 1, 1, 1,
0.7818033, 1.201466, 1.741283, 1, 1, 1, 1, 1,
0.7820438, -0.3359293, 3.30425, 1, 1, 1, 1, 1,
0.7953858, -1.759588, 1.976174, 1, 1, 1, 1, 1,
0.7980676, 0.09060391, 1.797539, 1, 1, 1, 1, 1,
0.7985573, 0.737442, -1.135816, 1, 1, 1, 1, 1,
0.8035683, 1.429788, -0.2384238, 1, 1, 1, 1, 1,
0.8050926, -0.4259558, 0.4384264, 1, 1, 1, 1, 1,
0.8075943, 0.3848584, 1.041991, 1, 1, 1, 1, 1,
0.8096563, 0.2917799, 2.165908, 1, 1, 1, 1, 1,
0.8116032, -1.370934, 1.430725, 1, 1, 1, 1, 1,
0.8127017, 0.06937125, 0.07436036, 1, 1, 1, 1, 1,
0.8208026, -0.569508, 1.564801, 1, 1, 1, 1, 1,
0.8268526, -0.6234434, 3.847809, 1, 1, 1, 1, 1,
0.8283142, 1.862843, 1.397966, 1, 1, 1, 1, 1,
0.8311868, -0.2874855, 2.782221, 0, 0, 1, 1, 1,
0.8378317, -0.2440301, 3.294843, 1, 0, 0, 1, 1,
0.8382915, -0.102176, 1.983655, 1, 0, 0, 1, 1,
0.852092, 0.8699303, -0.1535299, 1, 0, 0, 1, 1,
0.8573837, -0.4319271, 1.979618, 1, 0, 0, 1, 1,
0.8592455, 1.154813, 0.8551726, 1, 0, 0, 1, 1,
0.8592467, -1.503332, 2.25721, 0, 0, 0, 1, 1,
0.8639452, 1.141563, 0.7971679, 0, 0, 0, 1, 1,
0.86546, 0.4811454, 2.789111, 0, 0, 0, 1, 1,
0.8690599, 0.2578481, 0.8285909, 0, 0, 0, 1, 1,
0.8699858, 0.9774481, -0.2984056, 0, 0, 0, 1, 1,
0.870736, 0.001984568, 1.441082, 0, 0, 0, 1, 1,
0.8743834, -1.37323, 3.34761, 0, 0, 0, 1, 1,
0.883113, 1.444201, 0.3851797, 1, 1, 1, 1, 1,
0.8840786, -1.045404, 3.029413, 1, 1, 1, 1, 1,
0.8860381, -1.058225, 1.957455, 1, 1, 1, 1, 1,
0.9034324, 0.7962144, 2.761608, 1, 1, 1, 1, 1,
0.9056739, 0.9568946, 1.027228, 1, 1, 1, 1, 1,
0.9065062, -0.5060597, 3.226447, 1, 1, 1, 1, 1,
0.9068618, -2.045611, 4.084676, 1, 1, 1, 1, 1,
0.9093813, 1.290782, 0.4840644, 1, 1, 1, 1, 1,
0.9135332, -1.275274, 2.191436, 1, 1, 1, 1, 1,
0.9224537, -1.335797, 2.918738, 1, 1, 1, 1, 1,
0.9294606, -0.1571498, 2.506393, 1, 1, 1, 1, 1,
0.9367727, 1.718552, 0.1685187, 1, 1, 1, 1, 1,
0.9469879, -1.278602, 1.919178, 1, 1, 1, 1, 1,
0.9482893, -1.563811, 4.174724, 1, 1, 1, 1, 1,
0.9486932, -0.179351, 1.849528, 1, 1, 1, 1, 1,
0.9523451, 0.4604982, 2.48908, 0, 0, 1, 1, 1,
0.9549054, 0.3909716, 1.303783, 1, 0, 0, 1, 1,
0.9598284, -0.07394253, 1.874039, 1, 0, 0, 1, 1,
0.9630318, -0.5851359, 1.279863, 1, 0, 0, 1, 1,
0.9637163, 0.9188204, 1.488358, 1, 0, 0, 1, 1,
0.9825494, -0.7265595, 0.1184793, 1, 0, 0, 1, 1,
0.9860181, 1.039807, 0.7672572, 0, 0, 0, 1, 1,
0.9928039, 1.220268, -0.4698291, 0, 0, 0, 1, 1,
0.9930461, -0.9450576, 1.697163, 0, 0, 0, 1, 1,
0.996167, -0.9024705, 2.719838, 0, 0, 0, 1, 1,
0.9982923, -0.2318278, 1.420313, 0, 0, 0, 1, 1,
0.9996355, 2.872099, -0.9314101, 0, 0, 0, 1, 1,
1.000144, -1.271533, 1.792826, 0, 0, 0, 1, 1,
1.011733, 2.538648, -0.04967733, 1, 1, 1, 1, 1,
1.015506, 1.199558, 3.244336, 1, 1, 1, 1, 1,
1.017759, 1.421858, 1.408881, 1, 1, 1, 1, 1,
1.019763, -0.2423455, 1.756326, 1, 1, 1, 1, 1,
1.021106, -1.045992, 0.9337981, 1, 1, 1, 1, 1,
1.021275, -0.1544564, 2.975782, 1, 1, 1, 1, 1,
1.041726, 0.6292182, 1.457553, 1, 1, 1, 1, 1,
1.049585, -0.500578, 1.49019, 1, 1, 1, 1, 1,
1.050716, -2.031673, 3.403259, 1, 1, 1, 1, 1,
1.051914, -0.6551697, 2.068504, 1, 1, 1, 1, 1,
1.057285, 0.5040447, 1.499723, 1, 1, 1, 1, 1,
1.061996, -2.274828, 3.832199, 1, 1, 1, 1, 1,
1.070043, 0.3038724, 1.292652, 1, 1, 1, 1, 1,
1.073411, -0.311698, 2.371327, 1, 1, 1, 1, 1,
1.074886, -0.8117221, 2.450196, 1, 1, 1, 1, 1,
1.075911, 0.06816766, 0.7712965, 0, 0, 1, 1, 1,
1.078165, -1.050823, 1.400023, 1, 0, 0, 1, 1,
1.078274, -0.04101638, 0.9723296, 1, 0, 0, 1, 1,
1.082268, 0.01233085, 1.866763, 1, 0, 0, 1, 1,
1.092815, 0.3885228, 0.4356528, 1, 0, 0, 1, 1,
1.094082, 0.2866605, 0.4975477, 1, 0, 0, 1, 1,
1.099273, -2.194482, 1.997625, 0, 0, 0, 1, 1,
1.103605, -0.09699529, 1.904558, 0, 0, 0, 1, 1,
1.107178, 0.3133602, 1.558085, 0, 0, 0, 1, 1,
1.110631, -0.7823665, 0.3567181, 0, 0, 0, 1, 1,
1.127689, -0.2330026, 0.2209316, 0, 0, 0, 1, 1,
1.129628, 0.1292366, 0.5149184, 0, 0, 0, 1, 1,
1.132357, -0.2826509, 1.990793, 0, 0, 0, 1, 1,
1.137053, 0.563757, -0.7917707, 1, 1, 1, 1, 1,
1.137627, -0.6950358, 0.6262043, 1, 1, 1, 1, 1,
1.157971, 0.5467967, 0.8221127, 1, 1, 1, 1, 1,
1.162449, 1.988069, 0.6284685, 1, 1, 1, 1, 1,
1.178538, -0.01838684, -0.4541739, 1, 1, 1, 1, 1,
1.187674, 1.816854, 0.2507962, 1, 1, 1, 1, 1,
1.19633, 0.6159973, 1.638726, 1, 1, 1, 1, 1,
1.199718, 0.09659833, 1.594764, 1, 1, 1, 1, 1,
1.200956, 1.450848, 0.836572, 1, 1, 1, 1, 1,
1.213998, -1.646311, 2.573667, 1, 1, 1, 1, 1,
1.219641, -1.301165, 1.510477, 1, 1, 1, 1, 1,
1.219931, 0.6882865, 0.6081202, 1, 1, 1, 1, 1,
1.221281, 1.642197, 0.06479459, 1, 1, 1, 1, 1,
1.224836, 1.010835, 1.288838, 1, 1, 1, 1, 1,
1.225376, -1.43846, 2.195322, 1, 1, 1, 1, 1,
1.230231, -1.06014, 2.263646, 0, 0, 1, 1, 1,
1.231072, -3.115733, 3.047127, 1, 0, 0, 1, 1,
1.233958, 0.7673049, 1.042559, 1, 0, 0, 1, 1,
1.235877, 0.5255024, 0.9142146, 1, 0, 0, 1, 1,
1.253973, 0.3610782, 0.2373901, 1, 0, 0, 1, 1,
1.255708, 0.4980906, 1.147298, 1, 0, 0, 1, 1,
1.256762, -0.3004273, 2.004038, 0, 0, 0, 1, 1,
1.261349, -0.9162056, 2.141771, 0, 0, 0, 1, 1,
1.265021, -1.344944, 1.004027, 0, 0, 0, 1, 1,
1.269453, -0.396076, 2.931672, 0, 0, 0, 1, 1,
1.276167, -0.1844964, 1.897883, 0, 0, 0, 1, 1,
1.284402, 0.5259727, 0.7376246, 0, 0, 0, 1, 1,
1.286334, -1.371, 1.288609, 0, 0, 0, 1, 1,
1.290992, 1.482755, 0.6478618, 1, 1, 1, 1, 1,
1.291714, 1.270757, 1.648072, 1, 1, 1, 1, 1,
1.297106, -1.058534, 3.0261, 1, 1, 1, 1, 1,
1.307169, -1.797836, 2.608676, 1, 1, 1, 1, 1,
1.313336, -0.1324539, 0.4957169, 1, 1, 1, 1, 1,
1.314433, -0.7933406, 1.322402, 1, 1, 1, 1, 1,
1.316185, -0.3570584, 2.900442, 1, 1, 1, 1, 1,
1.318588, 0.2689763, 1.95345, 1, 1, 1, 1, 1,
1.325003, -0.3508151, 2.559341, 1, 1, 1, 1, 1,
1.363548, 0.5606778, 0.6949005, 1, 1, 1, 1, 1,
1.36635, 0.2421812, 2.4946, 1, 1, 1, 1, 1,
1.368113, 1.426192, 1.570181, 1, 1, 1, 1, 1,
1.3748, 0.3113039, 1.7174, 1, 1, 1, 1, 1,
1.374912, 2.048038, 2.058434, 1, 1, 1, 1, 1,
1.375275, -0.6574581, 3.03511, 1, 1, 1, 1, 1,
1.376378, -0.8029554, 2.137799, 0, 0, 1, 1, 1,
1.377462, -0.04725375, 2.351572, 1, 0, 0, 1, 1,
1.382897, 0.7944053, 1.440461, 1, 0, 0, 1, 1,
1.383327, -1.132363, 3.404571, 1, 0, 0, 1, 1,
1.385321, -2.004344, 1.870151, 1, 0, 0, 1, 1,
1.401447, -0.2376042, 1.37952, 1, 0, 0, 1, 1,
1.42392, -0.3860922, 2.015431, 0, 0, 0, 1, 1,
1.44871, -0.9016954, 3.073338, 0, 0, 0, 1, 1,
1.449373, -0.9863176, 3.486544, 0, 0, 0, 1, 1,
1.462395, -0.4283086, 0.9282857, 0, 0, 0, 1, 1,
1.463121, -1.44559, 2.148786, 0, 0, 0, 1, 1,
1.465117, -0.8554469, 2.626359, 0, 0, 0, 1, 1,
1.465509, -0.05157023, 2.383198, 0, 0, 0, 1, 1,
1.466699, 0.3350279, 1.065079, 1, 1, 1, 1, 1,
1.472491, 0.3959889, 0.4429955, 1, 1, 1, 1, 1,
1.491786, -0.395637, 1.345862, 1, 1, 1, 1, 1,
1.492077, 1.002968, 1.213345, 1, 1, 1, 1, 1,
1.498729, -1.316712, 2.634171, 1, 1, 1, 1, 1,
1.502628, 0.4760556, 2.067607, 1, 1, 1, 1, 1,
1.50452, 0.2134165, 2.312465, 1, 1, 1, 1, 1,
1.521468, 2.041568, 2.055183, 1, 1, 1, 1, 1,
1.530464, 0.02120102, 2.642808, 1, 1, 1, 1, 1,
1.535126, 1.54511, -0.708367, 1, 1, 1, 1, 1,
1.575901, -0.9949813, 3.28552, 1, 1, 1, 1, 1,
1.579164, -0.650732, 3.034616, 1, 1, 1, 1, 1,
1.594763, -1.535924, 3.258818, 1, 1, 1, 1, 1,
1.599971, -0.7994975, 2.664681, 1, 1, 1, 1, 1,
1.602958, -0.4526548, 0.9541012, 1, 1, 1, 1, 1,
1.603787, 0.3205121, 1.469989, 0, 0, 1, 1, 1,
1.61215, 0.2155848, 0.5587525, 1, 0, 0, 1, 1,
1.625276, -1.707552, 2.049439, 1, 0, 0, 1, 1,
1.627181, 0.586334, 1.849437, 1, 0, 0, 1, 1,
1.631946, 0.7833888, -0.2225088, 1, 0, 0, 1, 1,
1.645954, 0.2141462, 1.182256, 1, 0, 0, 1, 1,
1.65034, 1.489874, -1.104829, 0, 0, 0, 1, 1,
1.688113, 0.6061088, 0.6939341, 0, 0, 0, 1, 1,
1.695428, 1.789134, 0.8437792, 0, 0, 0, 1, 1,
1.696891, 0.7520772, 1.672162, 0, 0, 0, 1, 1,
1.718871, -0.01263997, 1.379533, 0, 0, 0, 1, 1,
1.726989, -0.5976942, -0.05840765, 0, 0, 0, 1, 1,
1.7321, 1.450772, 1.633088, 0, 0, 0, 1, 1,
1.760959, -0.4547855, 2.112722, 1, 1, 1, 1, 1,
1.779905, -0.2370626, 2.750757, 1, 1, 1, 1, 1,
1.781862, -0.05512814, 1.605186, 1, 1, 1, 1, 1,
1.787709, 1.396639, 1.388001, 1, 1, 1, 1, 1,
1.802078, -0.3042115, 2.283123, 1, 1, 1, 1, 1,
1.81821, -0.6468468, 1.90503, 1, 1, 1, 1, 1,
1.821601, -0.7989029, 2.914502, 1, 1, 1, 1, 1,
1.851516, -0.6043294, 2.901407, 1, 1, 1, 1, 1,
1.878814, -0.4085262, 1.213215, 1, 1, 1, 1, 1,
1.88845, -1.297314, 1.819824, 1, 1, 1, 1, 1,
1.903978, 1.670454, 1.171342, 1, 1, 1, 1, 1,
1.913644, -0.09426197, 0.6315494, 1, 1, 1, 1, 1,
1.914495, 0.4703196, -0.5865018, 1, 1, 1, 1, 1,
1.931276, 0.06593077, 2.851868, 1, 1, 1, 1, 1,
1.981022, -0.5494236, 2.396228, 1, 1, 1, 1, 1,
1.982646, -0.601627, 1.303978, 0, 0, 1, 1, 1,
1.996873, 0.1215942, 1.717076, 1, 0, 0, 1, 1,
1.999936, 1.529912, -1.139263, 1, 0, 0, 1, 1,
2.01918, -0.1029414, 2.225739, 1, 0, 0, 1, 1,
2.034841, -0.7549027, 1.864188, 1, 0, 0, 1, 1,
2.039132, 1.493102, 0.4517089, 1, 0, 0, 1, 1,
2.070508, -0.2114437, 3.655862, 0, 0, 0, 1, 1,
2.079993, -0.6189546, 3.009546, 0, 0, 0, 1, 1,
2.136354, 0.229292, 1.877924, 0, 0, 0, 1, 1,
2.185281, -0.535892, 3.63474, 0, 0, 0, 1, 1,
2.201581, -0.3935076, 4.01649, 0, 0, 0, 1, 1,
2.233707, -1.840991, 1.645177, 0, 0, 0, 1, 1,
2.252584, -0.537442, 1.587533, 0, 0, 0, 1, 1,
2.323567, 0.9156377, 1.13075, 1, 1, 1, 1, 1,
2.340892, 1.888988, 1.565624, 1, 1, 1, 1, 1,
2.501558, 0.2606194, 1.343242, 1, 1, 1, 1, 1,
2.537873, -1.22597, 2.240207, 1, 1, 1, 1, 1,
2.693075, -1.532867, 2.616513, 1, 1, 1, 1, 1,
2.787808, 0.1702341, 0.905002, 1, 1, 1, 1, 1,
2.791744, 0.3546141, 2.509767, 1, 1, 1, 1, 1
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
var radius = 9.579553;
var distance = 33.64777;
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
mvMatrix.translate( 0.1009209, -0.1031654, 0.02682948 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.64777);
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