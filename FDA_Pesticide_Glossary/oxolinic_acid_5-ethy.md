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
-3.463386, -1.169844, -0.9242866, 1, 0, 0, 1,
-3.105878, -2.17994, -3.935726, 1, 0.007843138, 0, 1,
-2.871637, -1.469122, -2.812384, 1, 0.01176471, 0, 1,
-2.847086, 0.9033788, -2.423639, 1, 0.01960784, 0, 1,
-2.767378, -0.8181708, -1.614491, 1, 0.02352941, 0, 1,
-2.694989, 0.8855573, -0.2363263, 1, 0.03137255, 0, 1,
-2.68202, -0.5574239, -1.816468, 1, 0.03529412, 0, 1,
-2.658441, -0.002557149, -1.937819, 1, 0.04313726, 0, 1,
-2.59992, 2.090604, 0.6863425, 1, 0.04705882, 0, 1,
-2.582047, -1.433124, -2.230333, 1, 0.05490196, 0, 1,
-2.564027, -1.604426, -1.965153, 1, 0.05882353, 0, 1,
-2.555536, 0.5322658, -2.587843, 1, 0.06666667, 0, 1,
-2.335049, -0.2825115, -2.414469, 1, 0.07058824, 0, 1,
-2.328671, -0.3845997, -0.6086099, 1, 0.07843138, 0, 1,
-2.305589, -1.248518, -2.298035, 1, 0.08235294, 0, 1,
-2.282608, 1.369747, -1.374014, 1, 0.09019608, 0, 1,
-2.269973, -1.142485, -2.577721, 1, 0.09411765, 0, 1,
-2.243354, 0.04901532, -0.9873057, 1, 0.1019608, 0, 1,
-2.226721, -0.5585163, -1.79512, 1, 0.1098039, 0, 1,
-2.164808, 1.081643, 0.5211717, 1, 0.1137255, 0, 1,
-2.164557, 0.1415657, -0.6454198, 1, 0.1215686, 0, 1,
-2.087927, -0.8465934, -1.476824, 1, 0.1254902, 0, 1,
-2.064686, -0.8886167, -2.496496, 1, 0.1333333, 0, 1,
-2.026916, 1.592861, -0.2398853, 1, 0.1372549, 0, 1,
-2.005296, 1.473514, -1.030467, 1, 0.145098, 0, 1,
-1.985023, -0.8976668, -2.46555, 1, 0.1490196, 0, 1,
-1.97466, 0.3766415, -1.376917, 1, 0.1568628, 0, 1,
-1.941783, 1.533699, -0.2578031, 1, 0.1607843, 0, 1,
-1.929293, -0.8974721, -1.301182, 1, 0.1686275, 0, 1,
-1.905739, 0.8352214, -2.527288, 1, 0.172549, 0, 1,
-1.889758, 1.721522, -1.393213, 1, 0.1803922, 0, 1,
-1.880876, 0.4441778, -0.2854578, 1, 0.1843137, 0, 1,
-1.869164, 1.046097, -1.105618, 1, 0.1921569, 0, 1,
-1.857246, -0.1754694, -2.323492, 1, 0.1960784, 0, 1,
-1.837666, -0.9395425, -1.991538, 1, 0.2039216, 0, 1,
-1.836051, 0.3627265, -1.519595, 1, 0.2117647, 0, 1,
-1.815277, 1.072981, -0.8288814, 1, 0.2156863, 0, 1,
-1.813499, -0.5161846, -1.604064, 1, 0.2235294, 0, 1,
-1.798563, 0.645848, -0.9205564, 1, 0.227451, 0, 1,
-1.783914, 0.3689613, -0.7068375, 1, 0.2352941, 0, 1,
-1.783754, -0.8745609, -0.9101135, 1, 0.2392157, 0, 1,
-1.781782, 0.5892152, -1.365619, 1, 0.2470588, 0, 1,
-1.779962, 2.854507, 0.7456513, 1, 0.2509804, 0, 1,
-1.778898, -1.467722, -3.215541, 1, 0.2588235, 0, 1,
-1.777815, -0.5929306, -3.693025, 1, 0.2627451, 0, 1,
-1.777393, 0.8795486, -1.43507, 1, 0.2705882, 0, 1,
-1.773088, 0.1572059, -1.145705, 1, 0.2745098, 0, 1,
-1.75069, -0.4020697, -2.392653, 1, 0.282353, 0, 1,
-1.73478, 0.09266668, -0.3450993, 1, 0.2862745, 0, 1,
-1.729643, 1.37592, -2.836428, 1, 0.2941177, 0, 1,
-1.70042, 0.4422269, -1.174424, 1, 0.3019608, 0, 1,
-1.690877, 1.172553, -1.230488, 1, 0.3058824, 0, 1,
-1.683597, -0.1203585, -2.67935, 1, 0.3137255, 0, 1,
-1.658083, 1.783662, 1.598122, 1, 0.3176471, 0, 1,
-1.635819, -0.07785095, -1.122071, 1, 0.3254902, 0, 1,
-1.635789, -0.6690984, -1.156527, 1, 0.3294118, 0, 1,
-1.633785, -0.7309129, -3.045088, 1, 0.3372549, 0, 1,
-1.602384, 0.1111983, -2.503464, 1, 0.3411765, 0, 1,
-1.582313, 1.048606, -0.9617274, 1, 0.3490196, 0, 1,
-1.573001, 0.9854925, 0.5686146, 1, 0.3529412, 0, 1,
-1.570037, -1.427648, -0.4924344, 1, 0.3607843, 0, 1,
-1.566723, -0.9749517, -2.225836, 1, 0.3647059, 0, 1,
-1.530716, -0.5445418, -2.382343, 1, 0.372549, 0, 1,
-1.527248, 0.4220656, -1.692379, 1, 0.3764706, 0, 1,
-1.520017, -0.7239304, -2.808508, 1, 0.3843137, 0, 1,
-1.517271, 1.354896, -0.07772134, 1, 0.3882353, 0, 1,
-1.508928, 0.9464504, -2.204074, 1, 0.3960784, 0, 1,
-1.499189, -1.126725, -2.663924, 1, 0.4039216, 0, 1,
-1.479977, -0.9996932, -4.113212, 1, 0.4078431, 0, 1,
-1.470384, 0.6415353, -1.838084, 1, 0.4156863, 0, 1,
-1.458925, 0.1435379, -1.961215, 1, 0.4196078, 0, 1,
-1.452267, 0.3554145, -0.413667, 1, 0.427451, 0, 1,
-1.448534, 0.02023501, -1.308602, 1, 0.4313726, 0, 1,
-1.439816, -0.09157395, -2.97916, 1, 0.4392157, 0, 1,
-1.434126, 0.8217527, -1.906066, 1, 0.4431373, 0, 1,
-1.432253, -1.141852, -1.744204, 1, 0.4509804, 0, 1,
-1.421164, -0.5052653, -1.600141, 1, 0.454902, 0, 1,
-1.406443, 0.3467332, -0.1268592, 1, 0.4627451, 0, 1,
-1.404328, -1.470354, -3.906528, 1, 0.4666667, 0, 1,
-1.400801, 0.7534647, -2.672143, 1, 0.4745098, 0, 1,
-1.36287, -0.5449766, -1.624084, 1, 0.4784314, 0, 1,
-1.358969, -1.337321, -2.842866, 1, 0.4862745, 0, 1,
-1.350938, -0.2303361, -1.434359, 1, 0.4901961, 0, 1,
-1.346122, 0.2174556, -1.006467, 1, 0.4980392, 0, 1,
-1.345074, 1.479511, -0.4586077, 1, 0.5058824, 0, 1,
-1.332849, -0.9719946, -2.55277, 1, 0.509804, 0, 1,
-1.324082, 2.244359, -1.156187, 1, 0.5176471, 0, 1,
-1.32392, 0.2019404, -1.065698, 1, 0.5215687, 0, 1,
-1.320175, 1.171783, -1.268569, 1, 0.5294118, 0, 1,
-1.318072, -0.1263599, -1.617404, 1, 0.5333334, 0, 1,
-1.315988, -0.8534135, 0.3057496, 1, 0.5411765, 0, 1,
-1.308592, -1.588072, -0.6731732, 1, 0.5450981, 0, 1,
-1.302245, -0.30705, -1.187308, 1, 0.5529412, 0, 1,
-1.298427, -0.8704107, -2.797293, 1, 0.5568628, 0, 1,
-1.295698, -0.06963411, -2.433382, 1, 0.5647059, 0, 1,
-1.281973, 0.4470531, -1.414279, 1, 0.5686275, 0, 1,
-1.278118, -0.8742493, -2.310993, 1, 0.5764706, 0, 1,
-1.270215, -0.3604856, -0.8382612, 1, 0.5803922, 0, 1,
-1.262641, 1.048089, -0.864773, 1, 0.5882353, 0, 1,
-1.261876, -0.9424191, -5.244613, 1, 0.5921569, 0, 1,
-1.256648, 0.08817111, -1.79179, 1, 0.6, 0, 1,
-1.250987, 0.1933616, -2.102254, 1, 0.6078432, 0, 1,
-1.24069, -1.256702, -3.056383, 1, 0.6117647, 0, 1,
-1.23684, 0.469981, -0.7775986, 1, 0.6196079, 0, 1,
-1.235533, -1.803729, -1.689381, 1, 0.6235294, 0, 1,
-1.233925, -0.7118703, -2.673189, 1, 0.6313726, 0, 1,
-1.224106, 0.3636934, -0.9970611, 1, 0.6352941, 0, 1,
-1.215757, 2.57747, -1.255037, 1, 0.6431373, 0, 1,
-1.207258, -0.3175052, -3.376862, 1, 0.6470588, 0, 1,
-1.195672, 1.35677, 0.4007978, 1, 0.654902, 0, 1,
-1.188575, 0.2829769, -2.277132, 1, 0.6588235, 0, 1,
-1.175926, 0.3888738, -3.339783, 1, 0.6666667, 0, 1,
-1.173057, 0.2726475, -0.4727351, 1, 0.6705883, 0, 1,
-1.171886, 0.02510286, -2.43595, 1, 0.6784314, 0, 1,
-1.168558, -1.220842, -2.978065, 1, 0.682353, 0, 1,
-1.168326, 0.6926011, -1.623116, 1, 0.6901961, 0, 1,
-1.153585, -1.267378, -4.994799, 1, 0.6941177, 0, 1,
-1.145634, -1.001929, -1.691463, 1, 0.7019608, 0, 1,
-1.144992, -1.476108, -3.219245, 1, 0.7098039, 0, 1,
-1.132723, 0.5669114, -3.02361, 1, 0.7137255, 0, 1,
-1.129345, 0.190848, -2.265759, 1, 0.7215686, 0, 1,
-1.129319, 0.3039228, -2.723122, 1, 0.7254902, 0, 1,
-1.127175, 0.9734093, -0.5075776, 1, 0.7333333, 0, 1,
-1.123753, -1.799932, -1.807562, 1, 0.7372549, 0, 1,
-1.11516, -2.507024, -3.878953, 1, 0.7450981, 0, 1,
-1.114812, -0.3068153, -3.732877, 1, 0.7490196, 0, 1,
-1.10761, -2.204966, -2.497922, 1, 0.7568628, 0, 1,
-1.101533, 1.239287, -1.942672, 1, 0.7607843, 0, 1,
-1.101224, 1.043954, -1.489239, 1, 0.7686275, 0, 1,
-1.099693, -0.7449422, -2.175448, 1, 0.772549, 0, 1,
-1.099547, 2.016437, -0.1909189, 1, 0.7803922, 0, 1,
-1.092649, -1.129246, -1.798711, 1, 0.7843137, 0, 1,
-1.08948, 0.7963925, -0.7192, 1, 0.7921569, 0, 1,
-1.088344, 0.5243767, -0.2821205, 1, 0.7960784, 0, 1,
-1.085874, 0.3071877, -2.741038, 1, 0.8039216, 0, 1,
-1.081966, 1.634162, -0.5668231, 1, 0.8117647, 0, 1,
-1.075331, -1.124103, -2.158996, 1, 0.8156863, 0, 1,
-1.069594, 1.737735, -1.541174, 1, 0.8235294, 0, 1,
-1.069186, -2.248718, -2.21359, 1, 0.827451, 0, 1,
-1.06303, 2.258585, -0.710258, 1, 0.8352941, 0, 1,
-1.062992, -1.228147, -2.111028, 1, 0.8392157, 0, 1,
-1.06235, 0.953015, -1.628218, 1, 0.8470588, 0, 1,
-1.058699, -0.6107044, -1.058501, 1, 0.8509804, 0, 1,
-1.057182, 0.3380816, -0.2399295, 1, 0.8588235, 0, 1,
-1.054847, -0.4494437, -1.155557, 1, 0.8627451, 0, 1,
-1.053064, -1.374222, -2.912946, 1, 0.8705882, 0, 1,
-1.03389, 0.506557, -0.9476361, 1, 0.8745098, 0, 1,
-1.032865, 1.990683, 0.3836456, 1, 0.8823529, 0, 1,
-1.031299, 0.1325656, -2.536798, 1, 0.8862745, 0, 1,
-1.030701, 0.2221548, -3.4463, 1, 0.8941177, 0, 1,
-1.024823, -2.151969, -2.274927, 1, 0.8980392, 0, 1,
-1.019858, -0.745527, -4.645793, 1, 0.9058824, 0, 1,
-1.019387, 0.8747287, -1.500132, 1, 0.9137255, 0, 1,
-1.019245, 0.04059187, -2.064424, 1, 0.9176471, 0, 1,
-1.017762, 1.758887, -1.164753, 1, 0.9254902, 0, 1,
-1.016457, 0.2790212, -1.716717, 1, 0.9294118, 0, 1,
-1.013698, -0.03032718, -2.844208, 1, 0.9372549, 0, 1,
-1.003725, -0.6490319, -0.9663281, 1, 0.9411765, 0, 1,
-1.003601, -1.702552, -3.248121, 1, 0.9490196, 0, 1,
-1.000817, 0.7936583, 1.253373, 1, 0.9529412, 0, 1,
-0.9994607, 1.062721, -0.5944303, 1, 0.9607843, 0, 1,
-0.9883454, -2.4718, -3.738396, 1, 0.9647059, 0, 1,
-0.9774249, 1.053733, -0.5200382, 1, 0.972549, 0, 1,
-0.9734256, 1.344997, 1.241899, 1, 0.9764706, 0, 1,
-0.9720434, -0.3559862, -0.2427897, 1, 0.9843137, 0, 1,
-0.9692443, -0.008939972, -1.13995, 1, 0.9882353, 0, 1,
-0.9671027, 0.6303772, -1.000411, 1, 0.9960784, 0, 1,
-0.9663576, -0.5641875, -1.328219, 0.9960784, 1, 0, 1,
-0.9651675, 1.073179, -0.8255304, 0.9921569, 1, 0, 1,
-0.95968, -0.3183194, -2.234558, 0.9843137, 1, 0, 1,
-0.9510714, 1.005301, -1.344329, 0.9803922, 1, 0, 1,
-0.9491805, 1.402314, -0.7303458, 0.972549, 1, 0, 1,
-0.9456391, 1.617211, 1.476248, 0.9686275, 1, 0, 1,
-0.9419659, -0.1429411, -2.319663, 0.9607843, 1, 0, 1,
-0.9406297, -0.6073065, -3.269943, 0.9568627, 1, 0, 1,
-0.9390462, 1.13031, -1.731369, 0.9490196, 1, 0, 1,
-0.9386135, 0.773246, -2.057811, 0.945098, 1, 0, 1,
-0.9373935, 1.079526, -0.1817058, 0.9372549, 1, 0, 1,
-0.9280276, 0.6739324, -1.1481, 0.9333333, 1, 0, 1,
-0.924705, 0.3893558, 0.049752, 0.9254902, 1, 0, 1,
-0.9202041, 0.313773, -2.009883, 0.9215686, 1, 0, 1,
-0.9131671, 0.3125449, -0.3863007, 0.9137255, 1, 0, 1,
-0.9114131, -1.66494, -2.988313, 0.9098039, 1, 0, 1,
-0.9101868, 0.8964161, -1.019147, 0.9019608, 1, 0, 1,
-0.9047779, 1.635851, -0.5791545, 0.8941177, 1, 0, 1,
-0.9023481, -1.159145, -1.769436, 0.8901961, 1, 0, 1,
-0.9017326, -0.5037751, -0.6175758, 0.8823529, 1, 0, 1,
-0.9001245, -1.298091, -0.9916773, 0.8784314, 1, 0, 1,
-0.8939824, 1.014412, -1.883091, 0.8705882, 1, 0, 1,
-0.8923781, 0.5156832, -1.124904, 0.8666667, 1, 0, 1,
-0.8891802, -0.05669088, -1.289664, 0.8588235, 1, 0, 1,
-0.8891282, -2.263229, -4.039567, 0.854902, 1, 0, 1,
-0.8842531, -1.66468, -2.104455, 0.8470588, 1, 0, 1,
-0.8840143, -1.268634, -3.322789, 0.8431373, 1, 0, 1,
-0.8798997, 0.8394419, -2.736908, 0.8352941, 1, 0, 1,
-0.8793101, 0.7940367, -0.3049949, 0.8313726, 1, 0, 1,
-0.8792093, -0.4251267, -1.575263, 0.8235294, 1, 0, 1,
-0.8743711, 1.391086, 0.6077481, 0.8196079, 1, 0, 1,
-0.8742433, 0.1043264, 0.06381939, 0.8117647, 1, 0, 1,
-0.8729299, -0.8560883, -2.366738, 0.8078431, 1, 0, 1,
-0.8685983, -0.4993647, -2.497079, 0.8, 1, 0, 1,
-0.8678038, 0.539903, -0.389838, 0.7921569, 1, 0, 1,
-0.8666549, -0.9568567, -2.670496, 0.7882353, 1, 0, 1,
-0.8640696, 0.7210756, -2.445653, 0.7803922, 1, 0, 1,
-0.8639327, 0.9160844, 0.3116027, 0.7764706, 1, 0, 1,
-0.8584851, -1.507423, -0.9933585, 0.7686275, 1, 0, 1,
-0.8576607, 1.196916, -1.553432, 0.7647059, 1, 0, 1,
-0.8549114, 1.193618, 0.4331858, 0.7568628, 1, 0, 1,
-0.8538348, 0.8954927, -0.7066457, 0.7529412, 1, 0, 1,
-0.8477917, 0.1706325, -2.409092, 0.7450981, 1, 0, 1,
-0.8459461, 0.07482068, -0.9325159, 0.7411765, 1, 0, 1,
-0.8454499, -0.532743, -2.653606, 0.7333333, 1, 0, 1,
-0.8444035, 0.2030851, 1.474047, 0.7294118, 1, 0, 1,
-0.8441125, 0.3930727, -2.017679, 0.7215686, 1, 0, 1,
-0.8401768, 0.5234235, -1.499069, 0.7176471, 1, 0, 1,
-0.8348818, -0.17608, -1.498588, 0.7098039, 1, 0, 1,
-0.8300869, -0.6741375, -0.9354856, 0.7058824, 1, 0, 1,
-0.822105, -0.1878459, -3.258332, 0.6980392, 1, 0, 1,
-0.8115914, -0.739782, -1.163049, 0.6901961, 1, 0, 1,
-0.808709, 0.7584541, 1.005832, 0.6862745, 1, 0, 1,
-0.80752, 0.3677934, -3.164574, 0.6784314, 1, 0, 1,
-0.8061616, 0.08001835, -2.042601, 0.6745098, 1, 0, 1,
-0.804422, 1.509534, 0.5811315, 0.6666667, 1, 0, 1,
-0.801704, -0.01959525, -1.179079, 0.6627451, 1, 0, 1,
-0.7984687, -0.4743484, -2.587652, 0.654902, 1, 0, 1,
-0.7983593, 1.022197, -0.1404549, 0.6509804, 1, 0, 1,
-0.7951034, 0.2882673, -2.441839, 0.6431373, 1, 0, 1,
-0.7926773, -0.1121489, -1.077231, 0.6392157, 1, 0, 1,
-0.790624, 0.6636227, -0.09943533, 0.6313726, 1, 0, 1,
-0.7896249, 0.007015096, -0.4617245, 0.627451, 1, 0, 1,
-0.7825912, -0.3035474, -2.580544, 0.6196079, 1, 0, 1,
-0.7741359, 0.2354624, -1.706436, 0.6156863, 1, 0, 1,
-0.7731265, -0.5845982, -2.971034, 0.6078432, 1, 0, 1,
-0.7713057, 0.8116214, -1.39927, 0.6039216, 1, 0, 1,
-0.7698402, 1.263659, 0.478005, 0.5960785, 1, 0, 1,
-0.7679396, -1.935177, -2.535707, 0.5882353, 1, 0, 1,
-0.7674186, -0.9137556, -2.598312, 0.5843138, 1, 0, 1,
-0.7637647, -1.797219, -1.419691, 0.5764706, 1, 0, 1,
-0.7550882, -0.9571574, -2.820421, 0.572549, 1, 0, 1,
-0.7522023, 0.9179991, -0.3365295, 0.5647059, 1, 0, 1,
-0.7508628, 0.2676565, -1.873258, 0.5607843, 1, 0, 1,
-0.7358194, -0.4495921, -1.865075, 0.5529412, 1, 0, 1,
-0.7297293, 1.096085, -1.617373, 0.5490196, 1, 0, 1,
-0.7292807, -0.2023588, -0.4847938, 0.5411765, 1, 0, 1,
-0.7292311, -0.4359115, -0.4636055, 0.5372549, 1, 0, 1,
-0.7120072, -0.5716842, -3.058758, 0.5294118, 1, 0, 1,
-0.7107397, -0.8887668, -1.390711, 0.5254902, 1, 0, 1,
-0.7103217, 0.1453846, -0.176681, 0.5176471, 1, 0, 1,
-0.7075391, 1.480837, -0.004914638, 0.5137255, 1, 0, 1,
-0.7053322, -0.5146683, -2.754475, 0.5058824, 1, 0, 1,
-0.7027208, -0.1441656, -0.9476702, 0.5019608, 1, 0, 1,
-0.7025347, -1.666564, -4.418658, 0.4941176, 1, 0, 1,
-0.7003884, 0.1073753, -1.343593, 0.4862745, 1, 0, 1,
-0.6963241, 0.9464751, -0.05774319, 0.4823529, 1, 0, 1,
-0.6833957, 0.4639515, -0.1272923, 0.4745098, 1, 0, 1,
-0.6776108, 1.190979, -2.632779, 0.4705882, 1, 0, 1,
-0.6705317, 0.8864381, -1.304474, 0.4627451, 1, 0, 1,
-0.6641961, -1.429564, -0.8982727, 0.4588235, 1, 0, 1,
-0.6596629, 1.008398, 1.178929, 0.4509804, 1, 0, 1,
-0.6565287, -0.0589022, -2.593855, 0.4470588, 1, 0, 1,
-0.6504744, 0.7794188, -1.784479, 0.4392157, 1, 0, 1,
-0.6504194, -1.074044, -4.092785, 0.4352941, 1, 0, 1,
-0.6496437, -0.9046882, -1.94268, 0.427451, 1, 0, 1,
-0.6465715, 1.738064, 1.554175, 0.4235294, 1, 0, 1,
-0.6449411, 1.396951, -1.149002, 0.4156863, 1, 0, 1,
-0.6411539, -0.5075958, -1.49933, 0.4117647, 1, 0, 1,
-0.639624, -0.1211784, -1.498834, 0.4039216, 1, 0, 1,
-0.6384067, -0.5774891, -2.172466, 0.3960784, 1, 0, 1,
-0.636364, -0.5109327, -3.367046, 0.3921569, 1, 0, 1,
-0.6331258, 1.76499, 0.5782567, 0.3843137, 1, 0, 1,
-0.6288794, -1.491051, -2.309322, 0.3803922, 1, 0, 1,
-0.6285502, 0.03987721, 0.2022415, 0.372549, 1, 0, 1,
-0.6278478, 0.8127332, -0.7595375, 0.3686275, 1, 0, 1,
-0.6256581, 0.4746079, 0.03426027, 0.3607843, 1, 0, 1,
-0.6167563, -0.7187766, -2.140973, 0.3568628, 1, 0, 1,
-0.608285, -0.4474845, -3.525605, 0.3490196, 1, 0, 1,
-0.6077939, 0.03617755, -2.579457, 0.345098, 1, 0, 1,
-0.6072133, 0.4847714, 0.09683973, 0.3372549, 1, 0, 1,
-0.6067383, 1.603324, -1.081981, 0.3333333, 1, 0, 1,
-0.6001089, 1.229988, 0.1557065, 0.3254902, 1, 0, 1,
-0.5956557, 1.037204, 0.1177686, 0.3215686, 1, 0, 1,
-0.5893965, 1.54011, -1.097645, 0.3137255, 1, 0, 1,
-0.5869239, 0.1232238, -2.20056, 0.3098039, 1, 0, 1,
-0.5805843, -2.090155, -4.019389, 0.3019608, 1, 0, 1,
-0.5773397, -0.02258692, -1.218833, 0.2941177, 1, 0, 1,
-0.5743942, -1.568673, -3.145523, 0.2901961, 1, 0, 1,
-0.5726655, -1.606226, -3.060015, 0.282353, 1, 0, 1,
-0.572634, 0.6192931, -0.3607904, 0.2784314, 1, 0, 1,
-0.5701007, 3.051816, -1.543224, 0.2705882, 1, 0, 1,
-0.5700806, 0.3739356, -0.6863359, 0.2666667, 1, 0, 1,
-0.5684908, 2.156717, 0.9174073, 0.2588235, 1, 0, 1,
-0.5623313, 0.5994408, 1.229863, 0.254902, 1, 0, 1,
-0.5618988, 0.08089326, -1.655086, 0.2470588, 1, 0, 1,
-0.555302, -0.8990533, -1.717804, 0.2431373, 1, 0, 1,
-0.5541804, 0.3611132, 0.3809794, 0.2352941, 1, 0, 1,
-0.5492, -1.266304, -0.6789541, 0.2313726, 1, 0, 1,
-0.5485682, -0.36686, -2.737788, 0.2235294, 1, 0, 1,
-0.5480067, 0.6914064, -0.8536007, 0.2196078, 1, 0, 1,
-0.540064, -2.417803, -3.42768, 0.2117647, 1, 0, 1,
-0.5276932, -0.9403697, -2.864719, 0.2078431, 1, 0, 1,
-0.5258278, 0.2945026, -1.541934, 0.2, 1, 0, 1,
-0.525066, 0.006669178, -1.805267, 0.1921569, 1, 0, 1,
-0.5214996, -0.5758197, -2.963703, 0.1882353, 1, 0, 1,
-0.520531, -1.050802, -1.217528, 0.1803922, 1, 0, 1,
-0.519935, 0.7968608, -3.653661, 0.1764706, 1, 0, 1,
-0.5184186, -0.5297632, -3.457082, 0.1686275, 1, 0, 1,
-0.5160718, -1.094629, -2.110211, 0.1647059, 1, 0, 1,
-0.5152223, -0.7729607, -2.960639, 0.1568628, 1, 0, 1,
-0.5147107, -2.548866, -3.519085, 0.1529412, 1, 0, 1,
-0.5125776, -0.05302756, -1.079708, 0.145098, 1, 0, 1,
-0.5116996, -1.295909, -3.407263, 0.1411765, 1, 0, 1,
-0.5080831, 0.05028034, -1.269425, 0.1333333, 1, 0, 1,
-0.4966821, -1.567942, -0.3108525, 0.1294118, 1, 0, 1,
-0.4955544, 1.110296, 0.3760881, 0.1215686, 1, 0, 1,
-0.4817745, -0.8075652, -4.057372, 0.1176471, 1, 0, 1,
-0.4745361, 1.966866, 0.8787078, 0.1098039, 1, 0, 1,
-0.4743601, 1.00226, 0.5366109, 0.1058824, 1, 0, 1,
-0.4727259, 0.6245894, -2.369724, 0.09803922, 1, 0, 1,
-0.4717675, 0.7728646, -1.46248, 0.09019608, 1, 0, 1,
-0.4717602, -1.253114, -2.376089, 0.08627451, 1, 0, 1,
-0.4681981, 1.516994, -0.7550999, 0.07843138, 1, 0, 1,
-0.4660026, -0.1272439, -3.332599, 0.07450981, 1, 0, 1,
-0.4657665, -0.02423927, -1.938849, 0.06666667, 1, 0, 1,
-0.4645458, 0.7543516, 1.440444, 0.0627451, 1, 0, 1,
-0.4635522, 0.5188703, 0.01561932, 0.05490196, 1, 0, 1,
-0.462602, 0.06712986, -1.490832, 0.05098039, 1, 0, 1,
-0.456426, 2.364401, 0.2535104, 0.04313726, 1, 0, 1,
-0.4544304, -0.332793, -1.62339, 0.03921569, 1, 0, 1,
-0.4534805, 0.2713985, 1.745037, 0.03137255, 1, 0, 1,
-0.4534524, -0.1292309, -1.49474, 0.02745098, 1, 0, 1,
-0.4534223, 1.726208, -0.3607927, 0.01960784, 1, 0, 1,
-0.4470645, -1.674957, -3.440118, 0.01568628, 1, 0, 1,
-0.4467287, 0.8366033, -1.3428, 0.007843138, 1, 0, 1,
-0.4447595, -2.521883, -1.028446, 0.003921569, 1, 0, 1,
-0.4444162, -0.2585866, -1.084672, 0, 1, 0.003921569, 1,
-0.4443128, 0.5325207, 0.9218806, 0, 1, 0.01176471, 1,
-0.43909, 0.5994807, 0.8151798, 0, 1, 0.01568628, 1,
-0.4378746, 0.973788, 0.8064293, 0, 1, 0.02352941, 1,
-0.4337678, -0.8349933, -2.292522, 0, 1, 0.02745098, 1,
-0.4325819, 1.768937, -1.740815, 0, 1, 0.03529412, 1,
-0.4318549, 1.216271, -0.7075503, 0, 1, 0.03921569, 1,
-0.4299331, 0.7635072, 0.482219, 0, 1, 0.04705882, 1,
-0.4278584, -0.4016739, -2.219181, 0, 1, 0.05098039, 1,
-0.4210595, -1.082827, -1.827064, 0, 1, 0.05882353, 1,
-0.4204388, -0.8850954, -0.9545196, 0, 1, 0.0627451, 1,
-0.418155, 1.347118, -0.02779716, 0, 1, 0.07058824, 1,
-0.4162956, 0.8413781, 0.5258479, 0, 1, 0.07450981, 1,
-0.4108612, -0.5406381, -2.887768, 0, 1, 0.08235294, 1,
-0.4056786, 0.2246109, -1.516744, 0, 1, 0.08627451, 1,
-0.4009364, 1.940169, 0.007047991, 0, 1, 0.09411765, 1,
-0.3932568, -0.6456723, -3.30155, 0, 1, 0.1019608, 1,
-0.3909906, -0.1157068, -3.909533, 0, 1, 0.1058824, 1,
-0.386723, -2.55139, -4.060838, 0, 1, 0.1137255, 1,
-0.3854321, 0.05057541, -4.121072, 0, 1, 0.1176471, 1,
-0.3850218, 0.402047, -0.6564916, 0, 1, 0.1254902, 1,
-0.3802604, 1.7699, -0.7959961, 0, 1, 0.1294118, 1,
-0.3797923, 1.471479, 0.1071405, 0, 1, 0.1372549, 1,
-0.3774288, -1.825083, -1.861502, 0, 1, 0.1411765, 1,
-0.3762076, -0.1906191, -1.778811, 0, 1, 0.1490196, 1,
-0.3740831, -1.218703, -3.96281, 0, 1, 0.1529412, 1,
-0.3726938, 0.8701556, -0.4750347, 0, 1, 0.1607843, 1,
-0.3709527, -0.2613705, -0.6108115, 0, 1, 0.1647059, 1,
-0.3704737, -1.036014, -1.339509, 0, 1, 0.172549, 1,
-0.3699838, 0.1132405, -0.06942449, 0, 1, 0.1764706, 1,
-0.3665203, 0.7404568, -0.1917856, 0, 1, 0.1843137, 1,
-0.3660914, -0.8204366, -2.820042, 0, 1, 0.1882353, 1,
-0.3652825, 1.136959, -1.048345, 0, 1, 0.1960784, 1,
-0.3649662, -1.197955, -3.623006, 0, 1, 0.2039216, 1,
-0.3641801, -0.9673743, -2.851446, 0, 1, 0.2078431, 1,
-0.3636922, -0.9728202, -4.177735, 0, 1, 0.2156863, 1,
-0.362552, -0.6647442, -1.878417, 0, 1, 0.2196078, 1,
-0.3584897, 1.239614, -0.3128328, 0, 1, 0.227451, 1,
-0.3565579, 1.901157, -1.068768, 0, 1, 0.2313726, 1,
-0.3561356, 0.788975, -0.873073, 0, 1, 0.2392157, 1,
-0.3546692, 0.9629956, 0.6475009, 0, 1, 0.2431373, 1,
-0.3541835, -0.305036, -2.38864, 0, 1, 0.2509804, 1,
-0.351116, -0.1577269, -2.524364, 0, 1, 0.254902, 1,
-0.3511033, -1.875359, -4.220294, 0, 1, 0.2627451, 1,
-0.347946, 1.054186, 0.2546484, 0, 1, 0.2666667, 1,
-0.3453439, -0.3783695, -3.881979, 0, 1, 0.2745098, 1,
-0.3435116, -0.5711214, -3.139232, 0, 1, 0.2784314, 1,
-0.3412076, -0.6221984, -3.134669, 0, 1, 0.2862745, 1,
-0.3408511, 0.2467727, -0.484748, 0, 1, 0.2901961, 1,
-0.337639, -0.1338525, -3.178821, 0, 1, 0.2980392, 1,
-0.3355612, 2.804653, 1.996832, 0, 1, 0.3058824, 1,
-0.3339469, -0.04503011, -0.7988047, 0, 1, 0.3098039, 1,
-0.3311439, 0.1664339, -0.9449694, 0, 1, 0.3176471, 1,
-0.3296096, -1.068021, -1.427671, 0, 1, 0.3215686, 1,
-0.3272439, -0.1683967, -1.323446, 0, 1, 0.3294118, 1,
-0.3241583, 0.2741205, -2.673564, 0, 1, 0.3333333, 1,
-0.3224778, 0.4005495, 1.995908, 0, 1, 0.3411765, 1,
-0.3214517, -1.352477, -3.762148, 0, 1, 0.345098, 1,
-0.3205826, 0.5368969, -0.1759744, 0, 1, 0.3529412, 1,
-0.3204776, 0.9153326, -0.06700008, 0, 1, 0.3568628, 1,
-0.320417, -1.440202, -3.569271, 0, 1, 0.3647059, 1,
-0.3181269, -0.4047009, -2.062846, 0, 1, 0.3686275, 1,
-0.3142538, 1.415595, -0.2751081, 0, 1, 0.3764706, 1,
-0.3017261, -1.045662, -3.687473, 0, 1, 0.3803922, 1,
-0.299902, 0.5485635, -1.390321, 0, 1, 0.3882353, 1,
-0.2990997, -2.128851, -2.641054, 0, 1, 0.3921569, 1,
-0.2984209, -1.348165, -3.735275, 0, 1, 0.4, 1,
-0.2974863, -0.08688975, -2.718037, 0, 1, 0.4078431, 1,
-0.2923632, -0.8602333, -1.691536, 0, 1, 0.4117647, 1,
-0.2882996, 0.8782979, 1.876539, 0, 1, 0.4196078, 1,
-0.285047, 0.5377455, 0.9589465, 0, 1, 0.4235294, 1,
-0.2847496, -0.1039796, 0.5186526, 0, 1, 0.4313726, 1,
-0.2832662, 0.901275, 0.1302873, 0, 1, 0.4352941, 1,
-0.2820917, 1.848416, 0.2857634, 0, 1, 0.4431373, 1,
-0.279011, 1.83242, -2.632732, 0, 1, 0.4470588, 1,
-0.27447, 0.03812158, -0.8173004, 0, 1, 0.454902, 1,
-0.2683586, -0.001221185, -0.616836, 0, 1, 0.4588235, 1,
-0.2667313, 0.0138005, -3.161851, 0, 1, 0.4666667, 1,
-0.2567611, -0.3092263, -1.443282, 0, 1, 0.4705882, 1,
-0.2553724, 1.52839, -0.868134, 0, 1, 0.4784314, 1,
-0.2502099, -0.9653077, -2.598367, 0, 1, 0.4823529, 1,
-0.2499631, 1.334171, 2.113062, 0, 1, 0.4901961, 1,
-0.2485105, 1.384471, 0.4221414, 0, 1, 0.4941176, 1,
-0.2456152, -1.075307, -2.501105, 0, 1, 0.5019608, 1,
-0.2383496, -0.2046921, -1.480769, 0, 1, 0.509804, 1,
-0.2355944, -0.213732, -1.193681, 0, 1, 0.5137255, 1,
-0.2274932, -0.4590343, -2.768801, 0, 1, 0.5215687, 1,
-0.2268156, 0.8488319, 0.02283285, 0, 1, 0.5254902, 1,
-0.2259703, 1.215567, -1.265019, 0, 1, 0.5333334, 1,
-0.2247664, -0.6046689, -4.216281, 0, 1, 0.5372549, 1,
-0.2106965, 0.8887143, 1.188953, 0, 1, 0.5450981, 1,
-0.203166, 0.02953268, 0.5069477, 0, 1, 0.5490196, 1,
-0.2025514, -0.9113014, -2.31545, 0, 1, 0.5568628, 1,
-0.1906824, -1.472964, -2.477119, 0, 1, 0.5607843, 1,
-0.1891065, -0.578672, -1.563357, 0, 1, 0.5686275, 1,
-0.1809224, 2.183151, 0.5714805, 0, 1, 0.572549, 1,
-0.1788369, 0.9013858, -0.8902505, 0, 1, 0.5803922, 1,
-0.1785059, -0.6550715, -3.896689, 0, 1, 0.5843138, 1,
-0.1775211, -0.6468298, -2.215967, 0, 1, 0.5921569, 1,
-0.1752375, 1.369218, 0.2456988, 0, 1, 0.5960785, 1,
-0.1732819, -0.1790385, -1.369431, 0, 1, 0.6039216, 1,
-0.1729582, 1.171815, -1.268715, 0, 1, 0.6117647, 1,
-0.171827, -0.1830026, -2.726117, 0, 1, 0.6156863, 1,
-0.1665445, -0.1624127, -0.963881, 0, 1, 0.6235294, 1,
-0.1645433, 1.396872, -0.4681179, 0, 1, 0.627451, 1,
-0.1634285, -0.5647576, -3.792446, 0, 1, 0.6352941, 1,
-0.1621633, 2.05998, 1.603539, 0, 1, 0.6392157, 1,
-0.1614212, -1.538265, -3.735457, 0, 1, 0.6470588, 1,
-0.1596089, 1.720898, -1.456607, 0, 1, 0.6509804, 1,
-0.1557884, -1.161166, -3.333254, 0, 1, 0.6588235, 1,
-0.1525777, -0.3065325, -3.847557, 0, 1, 0.6627451, 1,
-0.1524355, 1.142757, 2.105819, 0, 1, 0.6705883, 1,
-0.1505158, 1.477296, 1.082832, 0, 1, 0.6745098, 1,
-0.1503881, -2.059359, -1.590799, 0, 1, 0.682353, 1,
-0.1431252, -1.101463, -2.275102, 0, 1, 0.6862745, 1,
-0.1398812, 2.061835, 0.9892662, 0, 1, 0.6941177, 1,
-0.1381111, 0.1063875, -0.5139207, 0, 1, 0.7019608, 1,
-0.136911, -0.2177443, -1.917278, 0, 1, 0.7058824, 1,
-0.1368939, 0.6592458, -0.1660488, 0, 1, 0.7137255, 1,
-0.1311026, -1.438858, -4.524372, 0, 1, 0.7176471, 1,
-0.1261112, -0.4544099, -1.938, 0, 1, 0.7254902, 1,
-0.1232097, 0.5296199, -1.43719, 0, 1, 0.7294118, 1,
-0.1135803, 0.1070165, -0.7783452, 0, 1, 0.7372549, 1,
-0.1134865, -0.4050801, -1.151347, 0, 1, 0.7411765, 1,
-0.1118179, -0.6178383, -3.677075, 0, 1, 0.7490196, 1,
-0.111628, 0.2402709, 0.2365519, 0, 1, 0.7529412, 1,
-0.1105212, -0.1562422, -3.947042, 0, 1, 0.7607843, 1,
-0.1080467, 0.01678536, -2.26566, 0, 1, 0.7647059, 1,
-0.1070579, 0.7354325, 0.2626603, 0, 1, 0.772549, 1,
-0.104482, -0.5582136, -2.752444, 0, 1, 0.7764706, 1,
-0.1036023, 1.243886, 1.445627, 0, 1, 0.7843137, 1,
-0.1034573, 0.6828586, 0.03669118, 0, 1, 0.7882353, 1,
-0.1033351, -1.091068, -3.178987, 0, 1, 0.7960784, 1,
-0.1019619, -0.1706187, -2.05073, 0, 1, 0.8039216, 1,
-0.09996068, -0.4364421, -2.843067, 0, 1, 0.8078431, 1,
-0.09827536, 0.5401045, -0.431704, 0, 1, 0.8156863, 1,
-0.09822337, 0.162928, -1.639336, 0, 1, 0.8196079, 1,
-0.09569088, -0.1034449, -2.811188, 0, 1, 0.827451, 1,
-0.0948845, -0.6783923, -3.510901, 0, 1, 0.8313726, 1,
-0.09173083, -0.2361358, -1.985557, 0, 1, 0.8392157, 1,
-0.0870485, 0.3790123, -3.274493, 0, 1, 0.8431373, 1,
-0.08621723, 0.6200262, 0.2747897, 0, 1, 0.8509804, 1,
-0.0844443, 1.439119, 0.05372233, 0, 1, 0.854902, 1,
-0.08013871, -0.2881348, -2.471815, 0, 1, 0.8627451, 1,
-0.07989427, -0.793478, -3.437345, 0, 1, 0.8666667, 1,
-0.07836814, 1.286441, 0.4332106, 0, 1, 0.8745098, 1,
-0.07654145, 2.07581, -0.1494313, 0, 1, 0.8784314, 1,
-0.07542724, -0.7569357, -1.975611, 0, 1, 0.8862745, 1,
-0.07361611, -1.565045, -3.459733, 0, 1, 0.8901961, 1,
-0.07198408, 0.9354976, 0.3869559, 0, 1, 0.8980392, 1,
-0.07026272, -0.269906, -4.114571, 0, 1, 0.9058824, 1,
-0.06563733, -0.3215368, -4.188152, 0, 1, 0.9098039, 1,
-0.06526767, -0.7666669, -2.653949, 0, 1, 0.9176471, 1,
-0.06498059, 0.7182345, -0.4453209, 0, 1, 0.9215686, 1,
-0.06228093, 1.136953, 0.7937891, 0, 1, 0.9294118, 1,
-0.06184974, 0.8760519, 0.8044853, 0, 1, 0.9333333, 1,
-0.05440134, 1.17475, -0.119635, 0, 1, 0.9411765, 1,
-0.0500231, 0.09179934, -0.3008087, 0, 1, 0.945098, 1,
-0.0468768, 0.1693833, 0.1854452, 0, 1, 0.9529412, 1,
-0.04544228, -1.169208, -2.979114, 0, 1, 0.9568627, 1,
-0.03790046, 0.925084, -0.52985, 0, 1, 0.9647059, 1,
-0.0326064, -0.2784586, -1.978708, 0, 1, 0.9686275, 1,
-0.03253318, -0.1046952, -2.627848, 0, 1, 0.9764706, 1,
-0.03193048, 0.4701188, -0.6804565, 0, 1, 0.9803922, 1,
-0.03180753, -0.09043565, -2.752758, 0, 1, 0.9882353, 1,
-0.02687906, -0.1458325, -2.364349, 0, 1, 0.9921569, 1,
-0.02530369, 0.5273041, -1.264769, 0, 1, 1, 1,
-0.02183337, 0.04893384, -0.4821722, 0, 0.9921569, 1, 1,
-0.01820033, -0.3010267, -1.83787, 0, 0.9882353, 1, 1,
-0.01608795, -1.770669, -2.940285, 0, 0.9803922, 1, 1,
-0.01381262, 0.1823595, -0.8223278, 0, 0.9764706, 1, 1,
-0.01320228, -0.7981153, -5.217132, 0, 0.9686275, 1, 1,
-0.01045098, 0.3756068, 1.102014, 0, 0.9647059, 1, 1,
-0.00319014, 1.580969, 0.6788669, 0, 0.9568627, 1, 1,
-0.002261188, -0.5094488, -2.923211, 0, 0.9529412, 1, 1,
-0.001544108, 0.2456407, 0.9738544, 0, 0.945098, 1, 1,
-0.001528442, 0.4553822, -0.3025792, 0, 0.9411765, 1, 1,
-0.001387819, 0.3567523, 0.8122267, 0, 0.9333333, 1, 1,
-0.000320828, -0.8547698, -1.439816, 0, 0.9294118, 1, 1,
0.001580871, -0.9181088, 2.999396, 0, 0.9215686, 1, 1,
0.002840865, 1.263077, -1.272606, 0, 0.9176471, 1, 1,
0.003058837, 0.5188881, 2.370808, 0, 0.9098039, 1, 1,
0.009843289, 0.667275, 1.048769, 0, 0.9058824, 1, 1,
0.01287118, 0.4606824, 0.6568487, 0, 0.8980392, 1, 1,
0.0130842, 0.07927008, 0.7389855, 0, 0.8901961, 1, 1,
0.01476422, 1.251191, -0.564954, 0, 0.8862745, 1, 1,
0.01684773, -1.857408, 3.534801, 0, 0.8784314, 1, 1,
0.01785579, 0.9632162, -0.7985355, 0, 0.8745098, 1, 1,
0.01822391, 0.7063156, -1.179412, 0, 0.8666667, 1, 1,
0.02026984, -0.2640781, 3.443769, 0, 0.8627451, 1, 1,
0.02329842, 0.2939875, -0.1587846, 0, 0.854902, 1, 1,
0.02369222, -0.2388178, 2.611666, 0, 0.8509804, 1, 1,
0.02616781, -0.5745447, 3.778042, 0, 0.8431373, 1, 1,
0.02633307, 0.06809291, 0.4374467, 0, 0.8392157, 1, 1,
0.03320939, -2.163171, 2.083587, 0, 0.8313726, 1, 1,
0.0345874, -0.2931635, 2.161439, 0, 0.827451, 1, 1,
0.03522065, -2.330514, 3.710146, 0, 0.8196079, 1, 1,
0.03533302, -0.4265994, 2.318301, 0, 0.8156863, 1, 1,
0.03575593, -2.001191, 4.388744, 0, 0.8078431, 1, 1,
0.03678427, -0.06708422, 2.579765, 0, 0.8039216, 1, 1,
0.03760054, 1.328319, 1.678148, 0, 0.7960784, 1, 1,
0.04149462, 0.449753, 1.566291, 0, 0.7882353, 1, 1,
0.04302945, 0.4013515, 2.006332, 0, 0.7843137, 1, 1,
0.04543487, 0.5487466, 0.6870803, 0, 0.7764706, 1, 1,
0.04854009, -0.7429587, 1.698878, 0, 0.772549, 1, 1,
0.04870325, -1.228133, 4.011872, 0, 0.7647059, 1, 1,
0.05216944, 0.2848156, -0.1896224, 0, 0.7607843, 1, 1,
0.05246244, 0.2246515, 0.1100639, 0, 0.7529412, 1, 1,
0.05729976, 2.299882, 0.04940984, 0, 0.7490196, 1, 1,
0.06411337, 0.2033718, 2.607413, 0, 0.7411765, 1, 1,
0.0763962, 0.4815118, 1.415166, 0, 0.7372549, 1, 1,
0.08166187, 0.1096724, -1.078991, 0, 0.7294118, 1, 1,
0.08553026, 0.1972373, 0.1844826, 0, 0.7254902, 1, 1,
0.08561987, -0.7175818, 2.872983, 0, 0.7176471, 1, 1,
0.09023059, -0.07523815, 1.729169, 0, 0.7137255, 1, 1,
0.09140401, 0.7439675, 2.71792, 0, 0.7058824, 1, 1,
0.09459911, 1.949958, 1.189445, 0, 0.6980392, 1, 1,
0.09696987, -0.51231, 2.337557, 0, 0.6941177, 1, 1,
0.100667, -0.3118199, 1.904342, 0, 0.6862745, 1, 1,
0.1017189, -0.2391879, 3.362449, 0, 0.682353, 1, 1,
0.1070246, -0.3327561, 2.811081, 0, 0.6745098, 1, 1,
0.1142287, 0.1746618, 0.5894917, 0, 0.6705883, 1, 1,
0.1159505, -0.6477655, 2.258694, 0, 0.6627451, 1, 1,
0.1262904, 0.5500631, 0.06637434, 0, 0.6588235, 1, 1,
0.1279301, -0.2248995, 2.847454, 0, 0.6509804, 1, 1,
0.1330395, -0.6420866, 2.348265, 0, 0.6470588, 1, 1,
0.1357558, 0.2530481, -0.7833287, 0, 0.6392157, 1, 1,
0.1429203, 0.5764301, 1.172633, 0, 0.6352941, 1, 1,
0.1439632, -0.4560754, 4.429872, 0, 0.627451, 1, 1,
0.1442377, -0.6460078, 2.106164, 0, 0.6235294, 1, 1,
0.1518151, -0.757813, 2.12573, 0, 0.6156863, 1, 1,
0.1527408, 0.2481893, -0.1711111, 0, 0.6117647, 1, 1,
0.1537816, -0.7099608, 5.317475, 0, 0.6039216, 1, 1,
0.1548767, 2.473958, 0.7954, 0, 0.5960785, 1, 1,
0.1557106, -0.311734, 3.753659, 0, 0.5921569, 1, 1,
0.1605552, -0.2387391, 1.90941, 0, 0.5843138, 1, 1,
0.1608258, -2.06166, 2.390795, 0, 0.5803922, 1, 1,
0.1622231, 2.173038, 0.827859, 0, 0.572549, 1, 1,
0.1753349, -2.247134, 3.806054, 0, 0.5686275, 1, 1,
0.177731, 0.7278571, 0.4784265, 0, 0.5607843, 1, 1,
0.1781758, 0.1645618, 0.9876624, 0, 0.5568628, 1, 1,
0.1848516, 0.2001205, 3.884086, 0, 0.5490196, 1, 1,
0.1899528, 0.7246199, -0.09014858, 0, 0.5450981, 1, 1,
0.190544, 0.1957656, 0.672551, 0, 0.5372549, 1, 1,
0.1923124, 0.5271547, -0.5245423, 0, 0.5333334, 1, 1,
0.2023146, -1.39601, 2.674697, 0, 0.5254902, 1, 1,
0.2108412, 0.3981306, 0.9663936, 0, 0.5215687, 1, 1,
0.2109665, 0.03683234, 0.6867865, 0, 0.5137255, 1, 1,
0.2139582, 1.140573, -0.3921792, 0, 0.509804, 1, 1,
0.2172882, -1.011535, 2.594543, 0, 0.5019608, 1, 1,
0.2177028, 2.067665, 0.4289117, 0, 0.4941176, 1, 1,
0.2229179, -1.301793, 3.195963, 0, 0.4901961, 1, 1,
0.2246221, -0.2207436, 1.790082, 0, 0.4823529, 1, 1,
0.2256837, 1.579581, 0.6436957, 0, 0.4784314, 1, 1,
0.2267679, 0.7855937, -2.365065, 0, 0.4705882, 1, 1,
0.2297177, -0.178556, 2.590133, 0, 0.4666667, 1, 1,
0.2298016, 1.31039, 1.767617, 0, 0.4588235, 1, 1,
0.2305921, 0.2702492, 0.7968414, 0, 0.454902, 1, 1,
0.2323447, 0.527338, -0.2358995, 0, 0.4470588, 1, 1,
0.2345869, 0.6596273, 0.02678006, 0, 0.4431373, 1, 1,
0.2358756, 1.332174, -0.5373666, 0, 0.4352941, 1, 1,
0.2381214, 0.6976533, -1.272626, 0, 0.4313726, 1, 1,
0.2398693, -0.4460442, 3.141817, 0, 0.4235294, 1, 1,
0.2399545, 0.5474129, 1.748171, 0, 0.4196078, 1, 1,
0.248615, 0.4967447, 1.815253, 0, 0.4117647, 1, 1,
0.255893, 0.5382645, -0.3432762, 0, 0.4078431, 1, 1,
0.2596942, -0.2260509, 2.49262, 0, 0.4, 1, 1,
0.2609353, -1.240576, 3.189315, 0, 0.3921569, 1, 1,
0.2650247, -0.1960608, 2.249331, 0, 0.3882353, 1, 1,
0.2710537, -0.9413276, 3.367705, 0, 0.3803922, 1, 1,
0.2713929, -0.7190746, 2.428286, 0, 0.3764706, 1, 1,
0.2714216, 0.3649863, 2.376381, 0, 0.3686275, 1, 1,
0.2737046, 0.3675489, -0.7533177, 0, 0.3647059, 1, 1,
0.2788965, 0.4069814, 1.8418, 0, 0.3568628, 1, 1,
0.2823589, -0.5543091, 1.853151, 0, 0.3529412, 1, 1,
0.2841131, 0.1942443, 0.2344756, 0, 0.345098, 1, 1,
0.2847924, -1.84507, 2.966534, 0, 0.3411765, 1, 1,
0.2854237, -1.645483, 3.374636, 0, 0.3333333, 1, 1,
0.285476, 1.609496, -0.1518979, 0, 0.3294118, 1, 1,
0.285919, 0.2263537, 1.657533, 0, 0.3215686, 1, 1,
0.2876174, -0.6648527, 3.070625, 0, 0.3176471, 1, 1,
0.2900936, 1.377254, 0.1788226, 0, 0.3098039, 1, 1,
0.2901749, 1.054103, -1.57495, 0, 0.3058824, 1, 1,
0.290444, 0.2333659, 0.5487552, 0, 0.2980392, 1, 1,
0.2907767, 0.3368412, 0.4034318, 0, 0.2901961, 1, 1,
0.2915624, 0.09063035, 0.03717465, 0, 0.2862745, 1, 1,
0.2927533, 0.9819452, -0.6698866, 0, 0.2784314, 1, 1,
0.294885, -1.177377, 1.654792, 0, 0.2745098, 1, 1,
0.2950186, 1.321614, 1.097703, 0, 0.2666667, 1, 1,
0.3071896, 0.4145886, 0.6264676, 0, 0.2627451, 1, 1,
0.315443, 0.7611873, 0.6399477, 0, 0.254902, 1, 1,
0.3195579, 1.473849, 0.4144376, 0, 0.2509804, 1, 1,
0.3247482, 1.84966, -0.7898928, 0, 0.2431373, 1, 1,
0.3256618, 0.457124, 0.7304351, 0, 0.2392157, 1, 1,
0.3272972, -0.9004812, 2.345453, 0, 0.2313726, 1, 1,
0.3278442, -0.8405554, 3.484758, 0, 0.227451, 1, 1,
0.3280178, 0.8527254, 0.3649977, 0, 0.2196078, 1, 1,
0.3332889, -0.7082678, 2.717926, 0, 0.2156863, 1, 1,
0.3410424, 0.5858445, -1.628866, 0, 0.2078431, 1, 1,
0.34953, 0.0413744, 1.405442, 0, 0.2039216, 1, 1,
0.3520893, -0.3510184, 3.631621, 0, 0.1960784, 1, 1,
0.3528734, 0.09521195, 3.547062, 0, 0.1882353, 1, 1,
0.353624, -0.1423396, 2.348184, 0, 0.1843137, 1, 1,
0.3551977, 1.442364, 0.4867657, 0, 0.1764706, 1, 1,
0.3595303, 0.6534505, 1.841044, 0, 0.172549, 1, 1,
0.3626757, -0.360961, 2.070718, 0, 0.1647059, 1, 1,
0.3672786, -0.6874016, 1.428944, 0, 0.1607843, 1, 1,
0.3673885, -0.6597103, 2.95018, 0, 0.1529412, 1, 1,
0.3684068, -1.325104, 2.916597, 0, 0.1490196, 1, 1,
0.3772191, -0.9784129, 3.434762, 0, 0.1411765, 1, 1,
0.3776439, 1.221447, 0.2119577, 0, 0.1372549, 1, 1,
0.379046, -0.1429147, 1.766198, 0, 0.1294118, 1, 1,
0.3837363, -0.2753097, 2.466582, 0, 0.1254902, 1, 1,
0.3839809, -0.264507, 0.7082867, 0, 0.1176471, 1, 1,
0.3843498, 0.3507139, 0.5143022, 0, 0.1137255, 1, 1,
0.3846384, 0.3858421, 0.1594872, 0, 0.1058824, 1, 1,
0.3992417, -1.324874, 2.387029, 0, 0.09803922, 1, 1,
0.4006827, 0.2670074, 0.1208074, 0, 0.09411765, 1, 1,
0.4043531, 0.9321693, -1.278789, 0, 0.08627451, 1, 1,
0.4058122, 2.325395, 0.717062, 0, 0.08235294, 1, 1,
0.4085892, 0.8168371, -0.1170124, 0, 0.07450981, 1, 1,
0.4137032, 1.108884, 1.231634, 0, 0.07058824, 1, 1,
0.4184471, -0.8527114, 2.485662, 0, 0.0627451, 1, 1,
0.4187815, -0.5030972, 3.192249, 0, 0.05882353, 1, 1,
0.4198395, -0.1076851, 2.808071, 0, 0.05098039, 1, 1,
0.4217443, 0.9453408, 0.2417457, 0, 0.04705882, 1, 1,
0.4389471, -1.065951, 3.515661, 0, 0.03921569, 1, 1,
0.4400594, -0.1650685, 1.711628, 0, 0.03529412, 1, 1,
0.4414396, 1.115212, 0.5526659, 0, 0.02745098, 1, 1,
0.4417736, -1.361899, 2.438731, 0, 0.02352941, 1, 1,
0.443799, 0.7770637, -0.5494171, 0, 0.01568628, 1, 1,
0.4443964, -0.9253229, 1.70115, 0, 0.01176471, 1, 1,
0.4494186, -0.2442531, 3.751016, 0, 0.003921569, 1, 1,
0.4508651, 0.352514, -0.04174305, 0.003921569, 0, 1, 1,
0.4519249, -0.01362585, 1.262762, 0.007843138, 0, 1, 1,
0.453845, 1.673637, -2.675728, 0.01568628, 0, 1, 1,
0.4570597, -0.1729664, 2.92566, 0.01960784, 0, 1, 1,
0.4599351, -1.155367, 3.597542, 0.02745098, 0, 1, 1,
0.4605921, 0.02148871, 1.972474, 0.03137255, 0, 1, 1,
0.4626503, 0.8167637, 2.028382, 0.03921569, 0, 1, 1,
0.4642082, -0.4779792, 0.4724007, 0.04313726, 0, 1, 1,
0.4662932, 0.1464263, 1.101297, 0.05098039, 0, 1, 1,
0.4666972, -0.2354974, 0.3742964, 0.05490196, 0, 1, 1,
0.4690815, -0.1794211, 1.018757, 0.0627451, 0, 1, 1,
0.4770147, -0.07323624, 0.7842802, 0.06666667, 0, 1, 1,
0.4798596, -0.9649465, 2.61459, 0.07450981, 0, 1, 1,
0.4824651, -0.6342911, 2.295062, 0.07843138, 0, 1, 1,
0.4831159, 0.03476845, 1.510921, 0.08627451, 0, 1, 1,
0.4886617, -1.002049, 3.00213, 0.09019608, 0, 1, 1,
0.4933253, 0.9366702, 0.7272572, 0.09803922, 0, 1, 1,
0.4933253, -1.007976, 1.930934, 0.1058824, 0, 1, 1,
0.4972371, 0.848411, -0.8818098, 0.1098039, 0, 1, 1,
0.5010183, -0.0372371, 1.866606, 0.1176471, 0, 1, 1,
0.5048082, -0.5280397, 4.058815, 0.1215686, 0, 1, 1,
0.5088204, 1.10821, 0.1582334, 0.1294118, 0, 1, 1,
0.5096447, 0.9913993, 0.3205763, 0.1333333, 0, 1, 1,
0.5122621, 1.484907, 1.494355, 0.1411765, 0, 1, 1,
0.5252076, -0.8818562, 2.945372, 0.145098, 0, 1, 1,
0.5297946, -0.9716425, 4.141167, 0.1529412, 0, 1, 1,
0.5361066, -0.2295336, 2.669734, 0.1568628, 0, 1, 1,
0.5364256, -1.238175, 2.590469, 0.1647059, 0, 1, 1,
0.5390112, -0.5739142, 3.100304, 0.1686275, 0, 1, 1,
0.5401024, -1.074742, 1.775601, 0.1764706, 0, 1, 1,
0.5413736, 0.6755679, -0.3450461, 0.1803922, 0, 1, 1,
0.5415582, 1.184717, 0.4247105, 0.1882353, 0, 1, 1,
0.5423381, 0.1878678, 1.723347, 0.1921569, 0, 1, 1,
0.5441802, -0.8449815, 2.265473, 0.2, 0, 1, 1,
0.5449138, 0.9246171, 0.9439192, 0.2078431, 0, 1, 1,
0.5483882, 0.6360289, 1.236237, 0.2117647, 0, 1, 1,
0.5487, 1.37358, 1.620141, 0.2196078, 0, 1, 1,
0.5512157, -0.5575303, 3.391566, 0.2235294, 0, 1, 1,
0.554018, -2.491167, 2.059369, 0.2313726, 0, 1, 1,
0.5575212, 0.009306959, 2.300176, 0.2352941, 0, 1, 1,
0.5590971, -0.3359103, 1.139764, 0.2431373, 0, 1, 1,
0.5594313, 0.3561307, 1.694665, 0.2470588, 0, 1, 1,
0.560067, 1.440054, -0.05196025, 0.254902, 0, 1, 1,
0.5616376, -0.7538617, 1.478921, 0.2588235, 0, 1, 1,
0.5647973, 0.9271498, 0.4979393, 0.2666667, 0, 1, 1,
0.5650572, 0.1633693, -1.337311, 0.2705882, 0, 1, 1,
0.5690761, 0.3858663, 1.138874, 0.2784314, 0, 1, 1,
0.571134, -0.7718072, 1.161835, 0.282353, 0, 1, 1,
0.571241, -1.850835, 1.435755, 0.2901961, 0, 1, 1,
0.5755655, 0.9406807, 0.3660508, 0.2941177, 0, 1, 1,
0.5841539, -0.8714502, 1.302002, 0.3019608, 0, 1, 1,
0.5878066, -0.4742157, 1.830525, 0.3098039, 0, 1, 1,
0.5916613, 0.3724122, 3.530735, 0.3137255, 0, 1, 1,
0.5940531, 1.318665, -0.2623667, 0.3215686, 0, 1, 1,
0.59722, -0.6892215, 4.20267, 0.3254902, 0, 1, 1,
0.5979666, 0.3901418, 2.286605, 0.3333333, 0, 1, 1,
0.5993066, 0.9017437, 0.6387372, 0.3372549, 0, 1, 1,
0.6023038, 0.5616224, -0.06850623, 0.345098, 0, 1, 1,
0.6040635, 1.661169, -0.8577015, 0.3490196, 0, 1, 1,
0.607011, -0.5913745, 4.220288, 0.3568628, 0, 1, 1,
0.6111836, 1.024976, -0.6435885, 0.3607843, 0, 1, 1,
0.6127491, -2.641896, 3.590033, 0.3686275, 0, 1, 1,
0.6156729, 0.0518798, 2.017415, 0.372549, 0, 1, 1,
0.6178229, 0.02858922, 3.693754, 0.3803922, 0, 1, 1,
0.6195893, 1.045407, 0.382139, 0.3843137, 0, 1, 1,
0.6214284, 1.698045, -0.3760656, 0.3921569, 0, 1, 1,
0.6216691, 0.1376607, 0.7046329, 0.3960784, 0, 1, 1,
0.6256418, 0.5346565, 0.8094482, 0.4039216, 0, 1, 1,
0.6261293, -2.288067, 2.214515, 0.4117647, 0, 1, 1,
0.6275851, 1.782127, 0.03878699, 0.4156863, 0, 1, 1,
0.6295913, 1.236091, 0.4429294, 0.4235294, 0, 1, 1,
0.6312189, -1.358973, 1.726857, 0.427451, 0, 1, 1,
0.6335194, -1.112994, 1.884301, 0.4352941, 0, 1, 1,
0.6337436, -0.7121696, 1.620086, 0.4392157, 0, 1, 1,
0.6352583, -0.5538308, 3.777893, 0.4470588, 0, 1, 1,
0.642952, -0.8944693, 0.7827531, 0.4509804, 0, 1, 1,
0.6468146, 0.366393, 0.7619841, 0.4588235, 0, 1, 1,
0.6479629, -0.9870747, 2.300791, 0.4627451, 0, 1, 1,
0.6486017, 2.127241, -1.052377, 0.4705882, 0, 1, 1,
0.6547608, -0.9471648, 1.860165, 0.4745098, 0, 1, 1,
0.6580375, 0.07728042, 0.6740326, 0.4823529, 0, 1, 1,
0.6648213, -0.01242382, 0.6435708, 0.4862745, 0, 1, 1,
0.6670108, 1.359675, 0.8671482, 0.4941176, 0, 1, 1,
0.6696494, 0.1507078, 1.765795, 0.5019608, 0, 1, 1,
0.6730267, -0.05203317, 1.607982, 0.5058824, 0, 1, 1,
0.6747492, 0.1509261, 2.172988, 0.5137255, 0, 1, 1,
0.6779984, -1.409659, 1.623845, 0.5176471, 0, 1, 1,
0.6789324, -0.232579, 0.7837093, 0.5254902, 0, 1, 1,
0.6806939, -1.04092, 2.614383, 0.5294118, 0, 1, 1,
0.6826905, 1.598686, 1.257575, 0.5372549, 0, 1, 1,
0.6842784, 1.092232, 1.666355, 0.5411765, 0, 1, 1,
0.6882583, -0.1799348, 2.198613, 0.5490196, 0, 1, 1,
0.6890038, 0.8585548, 1.012338, 0.5529412, 0, 1, 1,
0.6925905, -1.851941, 3.414448, 0.5607843, 0, 1, 1,
0.6940889, 0.4990155, 1.527506, 0.5647059, 0, 1, 1,
0.6981193, -0.5903795, 1.449543, 0.572549, 0, 1, 1,
0.7065971, -0.4555109, 2.878658, 0.5764706, 0, 1, 1,
0.7105323, 1.206051, 2.492095, 0.5843138, 0, 1, 1,
0.7145384, -2.066646, 3.33819, 0.5882353, 0, 1, 1,
0.717934, -0.1989768, 1.821392, 0.5960785, 0, 1, 1,
0.7221278, -1.028303, 2.720593, 0.6039216, 0, 1, 1,
0.7259745, 0.03478922, 3.01197, 0.6078432, 0, 1, 1,
0.7324213, 0.8108858, 2.203245, 0.6156863, 0, 1, 1,
0.7347696, 1.291339, 1.628903, 0.6196079, 0, 1, 1,
0.7409619, 1.297865, 0.08201148, 0.627451, 0, 1, 1,
0.751588, -3.424141, 2.178307, 0.6313726, 0, 1, 1,
0.7553527, 0.0724913, 1.535846, 0.6392157, 0, 1, 1,
0.7559488, -1.133377, 2.183577, 0.6431373, 0, 1, 1,
0.7573915, -0.6094106, 2.126904, 0.6509804, 0, 1, 1,
0.7617142, 0.560655, 0.2103468, 0.654902, 0, 1, 1,
0.7651794, 0.4668513, 1.745133, 0.6627451, 0, 1, 1,
0.7659786, 0.07861395, 0.8934554, 0.6666667, 0, 1, 1,
0.766524, 2.239036, -1.085183, 0.6745098, 0, 1, 1,
0.7740369, 0.0577006, 1.724446, 0.6784314, 0, 1, 1,
0.7865742, -0.3989637, 1.760779, 0.6862745, 0, 1, 1,
0.7892052, -0.9895139, 2.867504, 0.6901961, 0, 1, 1,
0.7912733, 0.8067869, 0.8259987, 0.6980392, 0, 1, 1,
0.7921888, -1.749671, 2.143059, 0.7058824, 0, 1, 1,
0.7943668, 0.02354041, 2.493468, 0.7098039, 0, 1, 1,
0.806493, -0.5501961, 1.947975, 0.7176471, 0, 1, 1,
0.8131323, -1.155235, 1.625294, 0.7215686, 0, 1, 1,
0.8189135, -1.660544, 2.38964, 0.7294118, 0, 1, 1,
0.8190969, -0.7776866, 2.585176, 0.7333333, 0, 1, 1,
0.8207391, -0.1732577, 2.068101, 0.7411765, 0, 1, 1,
0.8215454, -0.2385262, 1.14996, 0.7450981, 0, 1, 1,
0.8218167, -0.459282, 3.067795, 0.7529412, 0, 1, 1,
0.8227608, -1.401966, 2.892235, 0.7568628, 0, 1, 1,
0.8232852, 1.506534, 0.2283799, 0.7647059, 0, 1, 1,
0.8251802, -0.2858247, 1.177172, 0.7686275, 0, 1, 1,
0.8268517, 1.025938, 1.132056, 0.7764706, 0, 1, 1,
0.8355376, 0.9663109, 0.5519643, 0.7803922, 0, 1, 1,
0.8362246, -1.80468, 2.468246, 0.7882353, 0, 1, 1,
0.8403543, 1.70358, 1.290172, 0.7921569, 0, 1, 1,
0.8499408, -2.517058, 5.188969, 0.8, 0, 1, 1,
0.8503608, -0.3879783, 3.124433, 0.8078431, 0, 1, 1,
0.8549923, -0.231598, 2.761565, 0.8117647, 0, 1, 1,
0.8595015, -1.735129, 1.767935, 0.8196079, 0, 1, 1,
0.8605186, 1.607806, 0.2415944, 0.8235294, 0, 1, 1,
0.8617893, -1.263466, 3.587938, 0.8313726, 0, 1, 1,
0.8640833, -0.3767383, 0.9828622, 0.8352941, 0, 1, 1,
0.8687441, 0.7316753, -0.2122238, 0.8431373, 0, 1, 1,
0.8719834, -0.3604247, 0.5237547, 0.8470588, 0, 1, 1,
0.8720154, -0.5989389, 1.640456, 0.854902, 0, 1, 1,
0.8788586, 0.4408036, 1.09756, 0.8588235, 0, 1, 1,
0.8841626, -0.4535831, 2.368663, 0.8666667, 0, 1, 1,
0.8874573, -0.03915658, 2.364757, 0.8705882, 0, 1, 1,
0.8881174, 1.275705, 2.311331, 0.8784314, 0, 1, 1,
0.8924803, -1.240874, 3.56459, 0.8823529, 0, 1, 1,
0.8930318, -0.5579756, 2.984998, 0.8901961, 0, 1, 1,
0.898745, -1.079134, 0.711888, 0.8941177, 0, 1, 1,
0.9029394, -1.740115, 1.090379, 0.9019608, 0, 1, 1,
0.903338, -0.3414745, 1.558219, 0.9098039, 0, 1, 1,
0.9036086, -0.08248782, 2.909809, 0.9137255, 0, 1, 1,
0.9063927, -0.4136818, 1.755491, 0.9215686, 0, 1, 1,
0.9088063, -0.8302845, 4.976641, 0.9254902, 0, 1, 1,
0.9105258, 1.2255, 1.333185, 0.9333333, 0, 1, 1,
0.9153856, 0.0854553, 2.978824, 0.9372549, 0, 1, 1,
0.9168978, 2.801878, 0.1745503, 0.945098, 0, 1, 1,
0.9208788, -0.7331915, 1.830685, 0.9490196, 0, 1, 1,
0.9212211, -0.3475685, 2.684872, 0.9568627, 0, 1, 1,
0.9217182, 0.6809193, 0.1122409, 0.9607843, 0, 1, 1,
0.9254645, -0.4180823, 2.969161, 0.9686275, 0, 1, 1,
0.9305319, -0.1907204, 2.293717, 0.972549, 0, 1, 1,
0.9328102, 0.2754045, 1.0358, 0.9803922, 0, 1, 1,
0.9348479, -2.53531, 3.086412, 0.9843137, 0, 1, 1,
0.9361747, -0.5517002, 2.14517, 0.9921569, 0, 1, 1,
0.9485972, 1.784946, 1.096839, 0.9960784, 0, 1, 1,
0.9537453, -2.022007, 3.813733, 1, 0, 0.9960784, 1,
0.9591153, 0.2474738, -0.1612934, 1, 0, 0.9882353, 1,
0.9644976, -0.5096409, 1.076662, 1, 0, 0.9843137, 1,
0.9648211, 0.7831227, 3.033821, 1, 0, 0.9764706, 1,
0.9664231, -1.100874, 4.252786, 1, 0, 0.972549, 1,
0.9679531, 0.6010347, -0.04701368, 1, 0, 0.9647059, 1,
0.9684208, 0.7545367, 2.08529, 1, 0, 0.9607843, 1,
0.9698399, 0.130589, 0.9365311, 1, 0, 0.9529412, 1,
0.9834343, -0.5648215, 2.526114, 1, 0, 0.9490196, 1,
0.990754, 1.275957, 1.180236, 1, 0, 0.9411765, 1,
0.9976114, -1.75897, 3.277909, 1, 0, 0.9372549, 1,
1.001572, 0.02936705, 0.9271926, 1, 0, 0.9294118, 1,
1.005085, -1.244612, 3.430649, 1, 0, 0.9254902, 1,
1.007794, 0.7154813, 0.5336912, 1, 0, 0.9176471, 1,
1.014606, -1.394353, 0.1326767, 1, 0, 0.9137255, 1,
1.021293, 0.09079175, 0.7655485, 1, 0, 0.9058824, 1,
1.021923, 0.03610186, 1.605135, 1, 0, 0.9019608, 1,
1.030296, -1.859217, 3.667818, 1, 0, 0.8941177, 1,
1.031935, 0.4862903, 1.304471, 1, 0, 0.8862745, 1,
1.03451, -1.561082, 3.395817, 1, 0, 0.8823529, 1,
1.036526, -0.7299674, 2.143549, 1, 0, 0.8745098, 1,
1.036825, -0.5622999, 3.055517, 1, 0, 0.8705882, 1,
1.050956, -0.2979278, 0.8129796, 1, 0, 0.8627451, 1,
1.051615, 0.03905236, 1.48147, 1, 0, 0.8588235, 1,
1.05615, 0.4465089, -0.3632847, 1, 0, 0.8509804, 1,
1.065694, 0.4266858, 1.033955, 1, 0, 0.8470588, 1,
1.077942, 0.3374743, 2.206936, 1, 0, 0.8392157, 1,
1.08047, -0.7001007, 2.649482, 1, 0, 0.8352941, 1,
1.081705, 1.543838, 0.1664126, 1, 0, 0.827451, 1,
1.082043, -1.065747, 3.662233, 1, 0, 0.8235294, 1,
1.083927, -1.10878, 1.194143, 1, 0, 0.8156863, 1,
1.094567, 1.024569, 0.006177482, 1, 0, 0.8117647, 1,
1.095615, -1.851963, 3.437476, 1, 0, 0.8039216, 1,
1.096064, 0.5057805, 0.7861279, 1, 0, 0.7960784, 1,
1.097996, 0.912237, 0.8468139, 1, 0, 0.7921569, 1,
1.10181, -0.5368286, 4.698201, 1, 0, 0.7843137, 1,
1.112715, 2.51952, -0.7342833, 1, 0, 0.7803922, 1,
1.114597, 0.2620335, 1.160321, 1, 0, 0.772549, 1,
1.114629, 0.6252086, 0.5710645, 1, 0, 0.7686275, 1,
1.118212, 0.8009685, -0.174676, 1, 0, 0.7607843, 1,
1.119315, 1.54692, 0.1012879, 1, 0, 0.7568628, 1,
1.129921, 1.36451, -0.04614224, 1, 0, 0.7490196, 1,
1.131444, -1.08482, 2.561764, 1, 0, 0.7450981, 1,
1.137678, -1.491526, 2.35227, 1, 0, 0.7372549, 1,
1.142792, 0.2152515, 2.562897, 1, 0, 0.7333333, 1,
1.143907, 0.3029889, 3.128998, 1, 0, 0.7254902, 1,
1.14891, 0.03789177, 1.573489, 1, 0, 0.7215686, 1,
1.149116, 1.5276, 2.099615, 1, 0, 0.7137255, 1,
1.153628, -0.3870056, 1.359615, 1, 0, 0.7098039, 1,
1.153887, 1.691804, -0.9708007, 1, 0, 0.7019608, 1,
1.155943, -0.4077781, 2.997336, 1, 0, 0.6941177, 1,
1.163794, -0.8380368, 1.864833, 1, 0, 0.6901961, 1,
1.170905, -0.6441234, 1.139779, 1, 0, 0.682353, 1,
1.182519, -0.01082571, 0.3063573, 1, 0, 0.6784314, 1,
1.186492, -1.074393, 3.197331, 1, 0, 0.6705883, 1,
1.192296, 1.31156, 0.9470302, 1, 0, 0.6666667, 1,
1.200991, 1.498899, -0.7094544, 1, 0, 0.6588235, 1,
1.21178, -0.6866778, 1.971889, 1, 0, 0.654902, 1,
1.221306, 0.1409202, 2.670514, 1, 0, 0.6470588, 1,
1.223473, 0.0939671, 2.158651, 1, 0, 0.6431373, 1,
1.224145, 0.2580816, 1.510959, 1, 0, 0.6352941, 1,
1.246315, 1.044455, 2.037292, 1, 0, 0.6313726, 1,
1.248961, -1.686813, 4.192554, 1, 0, 0.6235294, 1,
1.253865, 1.177662, 0.8948299, 1, 0, 0.6196079, 1,
1.254104, -0.2852419, 3.449458, 1, 0, 0.6117647, 1,
1.261997, 1.27156, -1.147247, 1, 0, 0.6078432, 1,
1.265818, -0.8680672, 2.596756, 1, 0, 0.6, 1,
1.26705, 0.7520745, 1.252076, 1, 0, 0.5921569, 1,
1.26725, 0.7137318, 0.9593213, 1, 0, 0.5882353, 1,
1.27264, 0.7936877, 0.5020338, 1, 0, 0.5803922, 1,
1.276283, -0.0951769, 1.860904, 1, 0, 0.5764706, 1,
1.277083, 0.8537518, 1.900799, 1, 0, 0.5686275, 1,
1.283151, 1.353558, 2.855547, 1, 0, 0.5647059, 1,
1.28386, -2.042442, 2.235929, 1, 0, 0.5568628, 1,
1.285748, -0.6081793, 3.364112, 1, 0, 0.5529412, 1,
1.301547, -1.2466, 4.008101, 1, 0, 0.5450981, 1,
1.310669, -0.1282758, 1.779937, 1, 0, 0.5411765, 1,
1.313978, -0.1820231, 2.447891, 1, 0, 0.5333334, 1,
1.320262, -0.2557631, 1.31642, 1, 0, 0.5294118, 1,
1.33594, 0.3059627, 0.9370421, 1, 0, 0.5215687, 1,
1.341615, 0.002365628, 2.495107, 1, 0, 0.5176471, 1,
1.341959, 1.919614, 0.4848914, 1, 0, 0.509804, 1,
1.354487, -0.1801105, 0.9988304, 1, 0, 0.5058824, 1,
1.357232, -0.5964832, 2.654462, 1, 0, 0.4980392, 1,
1.366483, -1.635152, 2.996877, 1, 0, 0.4901961, 1,
1.368184, 0.01306628, 2.264432, 1, 0, 0.4862745, 1,
1.373455, -0.7432743, 2.606341, 1, 0, 0.4784314, 1,
1.373593, -0.467845, 2.575779, 1, 0, 0.4745098, 1,
1.380011, -0.253606, 1.735338, 1, 0, 0.4666667, 1,
1.39355, 0.6405256, -0.4444979, 1, 0, 0.4627451, 1,
1.397376, -0.6584044, 1.33469, 1, 0, 0.454902, 1,
1.407474, -1.873755, 2.394605, 1, 0, 0.4509804, 1,
1.410891, -0.9413497, 3.222101, 1, 0, 0.4431373, 1,
1.419277, -0.9403713, 2.500725, 1, 0, 0.4392157, 1,
1.429492, -1.040741, 2.943465, 1, 0, 0.4313726, 1,
1.434026, 2.018559, 0.5625606, 1, 0, 0.427451, 1,
1.434635, 0.5212328, 0.3740802, 1, 0, 0.4196078, 1,
1.437448, -1.318875, 0.7121217, 1, 0, 0.4156863, 1,
1.446027, -0.1428094, 0.6278383, 1, 0, 0.4078431, 1,
1.452813, -0.4346789, 2.994503, 1, 0, 0.4039216, 1,
1.455624, -1.004527, 0.5587114, 1, 0, 0.3960784, 1,
1.468679, -1.039504, 3.322641, 1, 0, 0.3882353, 1,
1.471903, -0.587667, 1.796616, 1, 0, 0.3843137, 1,
1.485953, 0.4210731, 1.917019, 1, 0, 0.3764706, 1,
1.503566, 0.5128264, 0.520267, 1, 0, 0.372549, 1,
1.503824, 1.209256, -0.6688375, 1, 0, 0.3647059, 1,
1.526843, 0.4745401, 2.752221, 1, 0, 0.3607843, 1,
1.527661, -0.1576606, 2.010906, 1, 0, 0.3529412, 1,
1.53359, 0.9798973, 0.8029129, 1, 0, 0.3490196, 1,
1.547696, -0.8631034, 3.24178, 1, 0, 0.3411765, 1,
1.555608, 0.6407834, 1.275224, 1, 0, 0.3372549, 1,
1.556149, 0.6169788, 1.256465, 1, 0, 0.3294118, 1,
1.574793, -1.648572, 1.208454, 1, 0, 0.3254902, 1,
1.576056, -0.5607914, 2.365205, 1, 0, 0.3176471, 1,
1.576336, 0.22942, 1.336788, 1, 0, 0.3137255, 1,
1.578483, -0.728128, 0.1786031, 1, 0, 0.3058824, 1,
1.582241, 0.2499416, 2.200311, 1, 0, 0.2980392, 1,
1.597962, 0.08121546, 2.78572, 1, 0, 0.2941177, 1,
1.60328, -1.05643, 1.078339, 1, 0, 0.2862745, 1,
1.609948, 0.7633492, 1.00685, 1, 0, 0.282353, 1,
1.617044, -1.608554, 3.147011, 1, 0, 0.2745098, 1,
1.619598, 0.04530862, 1.988216, 1, 0, 0.2705882, 1,
1.624204, -0.7474829, 3.029524, 1, 0, 0.2627451, 1,
1.624516, 0.7272852, 1.720253, 1, 0, 0.2588235, 1,
1.668034, 0.2493547, 1.496286, 1, 0, 0.2509804, 1,
1.670338, -0.1240509, 1.725013, 1, 0, 0.2470588, 1,
1.682573, 1.216633, 0.2078169, 1, 0, 0.2392157, 1,
1.700499, -0.8794226, 1.219002, 1, 0, 0.2352941, 1,
1.704001, -0.3970731, 1.993695, 1, 0, 0.227451, 1,
1.705265, -0.3175011, 1.431623, 1, 0, 0.2235294, 1,
1.7119, 0.08909611, 2.615986, 1, 0, 0.2156863, 1,
1.717178, -1.083373, 2.59228, 1, 0, 0.2117647, 1,
1.751326, 0.5215856, 0.9070909, 1, 0, 0.2039216, 1,
1.799497, 0.2476263, 0.8636333, 1, 0, 0.1960784, 1,
1.800079, -0.8959988, 3.217383, 1, 0, 0.1921569, 1,
1.801849, 1.189269, -0.5074178, 1, 0, 0.1843137, 1,
1.832478, 1.828053, 0.5673725, 1, 0, 0.1803922, 1,
1.834954, 1.56076, 1.070944, 1, 0, 0.172549, 1,
1.857718, 0.1583673, -0.245311, 1, 0, 0.1686275, 1,
1.871628, -0.04540094, 0.961, 1, 0, 0.1607843, 1,
1.873164, -0.3405107, 1.548651, 1, 0, 0.1568628, 1,
1.91829, 0.9918547, 1.514268, 1, 0, 0.1490196, 1,
1.919624, 0.5720999, 0.4560109, 1, 0, 0.145098, 1,
1.951424, 0.3741526, 1.4729, 1, 0, 0.1372549, 1,
1.970754, 1.864165, 1.423282, 1, 0, 0.1333333, 1,
1.996042, -0.3692463, 1.230898, 1, 0, 0.1254902, 1,
2.009629, -2.042916, 4.373322, 1, 0, 0.1215686, 1,
2.018494, 1.363724, 0.4382966, 1, 0, 0.1137255, 1,
2.02375, 0.5439689, 1.720384, 1, 0, 0.1098039, 1,
2.038981, -0.3459038, 1.209205, 1, 0, 0.1019608, 1,
2.041599, -0.6369429, 0.3489023, 1, 0, 0.09411765, 1,
2.088402, 0.5717095, 2.27871, 1, 0, 0.09019608, 1,
2.098481, 0.5597709, 2.824785, 1, 0, 0.08235294, 1,
2.100613, 1.620298, 0.8837098, 1, 0, 0.07843138, 1,
2.137955, 0.2872233, 2.075985, 1, 0, 0.07058824, 1,
2.268032, 1.576846, 1.478254, 1, 0, 0.06666667, 1,
2.275458, -0.7706058, 2.37483, 1, 0, 0.05882353, 1,
2.39256, 1.19263, -0.3479525, 1, 0, 0.05490196, 1,
2.412858, 0.1066076, 2.819936, 1, 0, 0.04705882, 1,
2.430496, -0.4726596, 1.720669, 1, 0, 0.04313726, 1,
2.484573, 0.9993993, 1.268013, 1, 0, 0.03529412, 1,
2.500026, -1.181653, 0.4239554, 1, 0, 0.03137255, 1,
2.503592, 0.1884481, 2.912657, 1, 0, 0.02352941, 1,
2.831182, -0.7526867, 4.030254, 1, 0, 0.01960784, 1,
2.922228, -1.548415, 1.983411, 1, 0, 0.01176471, 1,
2.925767, -0.3553503, 1.041879, 1, 0, 0.007843138, 1
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
-0.2688091, -4.521815, -7.034886, 0, -0.5, 0.5, 0.5,
-0.2688091, -4.521815, -7.034886, 1, -0.5, 0.5, 0.5,
-0.2688091, -4.521815, -7.034886, 1, 1.5, 0.5, 0.5,
-0.2688091, -4.521815, -7.034886, 0, 1.5, 0.5, 0.5
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
-4.546347, -0.1861622, -7.034886, 0, -0.5, 0.5, 0.5,
-4.546347, -0.1861622, -7.034886, 1, -0.5, 0.5, 0.5,
-4.546347, -0.1861622, -7.034886, 1, 1.5, 0.5, 0.5,
-4.546347, -0.1861622, -7.034886, 0, 1.5, 0.5, 0.5
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
-4.546347, -4.521815, 0.03643107, 0, -0.5, 0.5, 0.5,
-4.546347, -4.521815, 0.03643107, 1, -0.5, 0.5, 0.5,
-4.546347, -4.521815, 0.03643107, 1, 1.5, 0.5, 0.5,
-4.546347, -4.521815, 0.03643107, 0, 1.5, 0.5, 0.5
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
-3, -3.52128, -5.403044,
2, -3.52128, -5.403044,
-3, -3.52128, -5.403044,
-3, -3.688036, -5.675018,
-2, -3.52128, -5.403044,
-2, -3.688036, -5.675018,
-1, -3.52128, -5.403044,
-1, -3.688036, -5.675018,
0, -3.52128, -5.403044,
0, -3.688036, -5.675018,
1, -3.52128, -5.403044,
1, -3.688036, -5.675018,
2, -3.52128, -5.403044,
2, -3.688036, -5.675018
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
-3, -4.021548, -6.218965, 0, -0.5, 0.5, 0.5,
-3, -4.021548, -6.218965, 1, -0.5, 0.5, 0.5,
-3, -4.021548, -6.218965, 1, 1.5, 0.5, 0.5,
-3, -4.021548, -6.218965, 0, 1.5, 0.5, 0.5,
-2, -4.021548, -6.218965, 0, -0.5, 0.5, 0.5,
-2, -4.021548, -6.218965, 1, -0.5, 0.5, 0.5,
-2, -4.021548, -6.218965, 1, 1.5, 0.5, 0.5,
-2, -4.021548, -6.218965, 0, 1.5, 0.5, 0.5,
-1, -4.021548, -6.218965, 0, -0.5, 0.5, 0.5,
-1, -4.021548, -6.218965, 1, -0.5, 0.5, 0.5,
-1, -4.021548, -6.218965, 1, 1.5, 0.5, 0.5,
-1, -4.021548, -6.218965, 0, 1.5, 0.5, 0.5,
0, -4.021548, -6.218965, 0, -0.5, 0.5, 0.5,
0, -4.021548, -6.218965, 1, -0.5, 0.5, 0.5,
0, -4.021548, -6.218965, 1, 1.5, 0.5, 0.5,
0, -4.021548, -6.218965, 0, 1.5, 0.5, 0.5,
1, -4.021548, -6.218965, 0, -0.5, 0.5, 0.5,
1, -4.021548, -6.218965, 1, -0.5, 0.5, 0.5,
1, -4.021548, -6.218965, 1, 1.5, 0.5, 0.5,
1, -4.021548, -6.218965, 0, 1.5, 0.5, 0.5,
2, -4.021548, -6.218965, 0, -0.5, 0.5, 0.5,
2, -4.021548, -6.218965, 1, -0.5, 0.5, 0.5,
2, -4.021548, -6.218965, 1, 1.5, 0.5, 0.5,
2, -4.021548, -6.218965, 0, 1.5, 0.5, 0.5
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
-3.559223, -3, -5.403044,
-3.559223, 3, -5.403044,
-3.559223, -3, -5.403044,
-3.723744, -3, -5.675018,
-3.559223, -2, -5.403044,
-3.723744, -2, -5.675018,
-3.559223, -1, -5.403044,
-3.723744, -1, -5.675018,
-3.559223, 0, -5.403044,
-3.723744, 0, -5.675018,
-3.559223, 1, -5.403044,
-3.723744, 1, -5.675018,
-3.559223, 2, -5.403044,
-3.723744, 2, -5.675018,
-3.559223, 3, -5.403044,
-3.723744, 3, -5.675018
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
-4.052785, -3, -6.218965, 0, -0.5, 0.5, 0.5,
-4.052785, -3, -6.218965, 1, -0.5, 0.5, 0.5,
-4.052785, -3, -6.218965, 1, 1.5, 0.5, 0.5,
-4.052785, -3, -6.218965, 0, 1.5, 0.5, 0.5,
-4.052785, -2, -6.218965, 0, -0.5, 0.5, 0.5,
-4.052785, -2, -6.218965, 1, -0.5, 0.5, 0.5,
-4.052785, -2, -6.218965, 1, 1.5, 0.5, 0.5,
-4.052785, -2, -6.218965, 0, 1.5, 0.5, 0.5,
-4.052785, -1, -6.218965, 0, -0.5, 0.5, 0.5,
-4.052785, -1, -6.218965, 1, -0.5, 0.5, 0.5,
-4.052785, -1, -6.218965, 1, 1.5, 0.5, 0.5,
-4.052785, -1, -6.218965, 0, 1.5, 0.5, 0.5,
-4.052785, 0, -6.218965, 0, -0.5, 0.5, 0.5,
-4.052785, 0, -6.218965, 1, -0.5, 0.5, 0.5,
-4.052785, 0, -6.218965, 1, 1.5, 0.5, 0.5,
-4.052785, 0, -6.218965, 0, 1.5, 0.5, 0.5,
-4.052785, 1, -6.218965, 0, -0.5, 0.5, 0.5,
-4.052785, 1, -6.218965, 1, -0.5, 0.5, 0.5,
-4.052785, 1, -6.218965, 1, 1.5, 0.5, 0.5,
-4.052785, 1, -6.218965, 0, 1.5, 0.5, 0.5,
-4.052785, 2, -6.218965, 0, -0.5, 0.5, 0.5,
-4.052785, 2, -6.218965, 1, -0.5, 0.5, 0.5,
-4.052785, 2, -6.218965, 1, 1.5, 0.5, 0.5,
-4.052785, 2, -6.218965, 0, 1.5, 0.5, 0.5,
-4.052785, 3, -6.218965, 0, -0.5, 0.5, 0.5,
-4.052785, 3, -6.218965, 1, -0.5, 0.5, 0.5,
-4.052785, 3, -6.218965, 1, 1.5, 0.5, 0.5,
-4.052785, 3, -6.218965, 0, 1.5, 0.5, 0.5
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
-3.559223, -3.52128, -4,
-3.559223, -3.52128, 4,
-3.559223, -3.52128, -4,
-3.723744, -3.688036, -4,
-3.559223, -3.52128, -2,
-3.723744, -3.688036, -2,
-3.559223, -3.52128, 0,
-3.723744, -3.688036, 0,
-3.559223, -3.52128, 2,
-3.723744, -3.688036, 2,
-3.559223, -3.52128, 4,
-3.723744, -3.688036, 4
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
-4.052785, -4.021548, -4, 0, -0.5, 0.5, 0.5,
-4.052785, -4.021548, -4, 1, -0.5, 0.5, 0.5,
-4.052785, -4.021548, -4, 1, 1.5, 0.5, 0.5,
-4.052785, -4.021548, -4, 0, 1.5, 0.5, 0.5,
-4.052785, -4.021548, -2, 0, -0.5, 0.5, 0.5,
-4.052785, -4.021548, -2, 1, -0.5, 0.5, 0.5,
-4.052785, -4.021548, -2, 1, 1.5, 0.5, 0.5,
-4.052785, -4.021548, -2, 0, 1.5, 0.5, 0.5,
-4.052785, -4.021548, 0, 0, -0.5, 0.5, 0.5,
-4.052785, -4.021548, 0, 1, -0.5, 0.5, 0.5,
-4.052785, -4.021548, 0, 1, 1.5, 0.5, 0.5,
-4.052785, -4.021548, 0, 0, 1.5, 0.5, 0.5,
-4.052785, -4.021548, 2, 0, -0.5, 0.5, 0.5,
-4.052785, -4.021548, 2, 1, -0.5, 0.5, 0.5,
-4.052785, -4.021548, 2, 1, 1.5, 0.5, 0.5,
-4.052785, -4.021548, 2, 0, 1.5, 0.5, 0.5,
-4.052785, -4.021548, 4, 0, -0.5, 0.5, 0.5,
-4.052785, -4.021548, 4, 1, -0.5, 0.5, 0.5,
-4.052785, -4.021548, 4, 1, 1.5, 0.5, 0.5,
-4.052785, -4.021548, 4, 0, 1.5, 0.5, 0.5
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
-3.559223, -3.52128, -5.403044,
-3.559223, 3.148956, -5.403044,
-3.559223, -3.52128, 5.475906,
-3.559223, 3.148956, 5.475906,
-3.559223, -3.52128, -5.403044,
-3.559223, -3.52128, 5.475906,
-3.559223, 3.148956, -5.403044,
-3.559223, 3.148956, 5.475906,
-3.559223, -3.52128, -5.403044,
3.021605, -3.52128, -5.403044,
-3.559223, -3.52128, 5.475906,
3.021605, -3.52128, 5.475906,
-3.559223, 3.148956, -5.403044,
3.021605, 3.148956, -5.403044,
-3.559223, 3.148956, 5.475906,
3.021605, 3.148956, 5.475906,
3.021605, -3.52128, -5.403044,
3.021605, 3.148956, -5.403044,
3.021605, -3.52128, 5.475906,
3.021605, 3.148956, 5.475906,
3.021605, -3.52128, -5.403044,
3.021605, -3.52128, 5.475906,
3.021605, 3.148956, -5.403044,
3.021605, 3.148956, 5.475906
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
var radius = 7.666869;
var distance = 34.11077;
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
mvMatrix.translate( 0.2688091, 0.1861622, -0.03643107 );
mvMatrix.scale( 1.259655, 1.24277, 0.7619825 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.11077);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
oxolinic_acid_5-ethy<-read.table("oxolinic_acid_5-ethy.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 5 elements
```

```r
x<-oxolinic_acid_5-ethy$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxolinic_acid_5' not found
```

```r
y<-oxolinic_acid_5-ethy$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxolinic_acid_5' not found
```

```r
z<-oxolinic_acid_5-ethy$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxolinic_acid_5' not found
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
-3.463386, -1.169844, -0.9242866, 0, 0, 1, 1, 1,
-3.105878, -2.17994, -3.935726, 1, 0, 0, 1, 1,
-2.871637, -1.469122, -2.812384, 1, 0, 0, 1, 1,
-2.847086, 0.9033788, -2.423639, 1, 0, 0, 1, 1,
-2.767378, -0.8181708, -1.614491, 1, 0, 0, 1, 1,
-2.694989, 0.8855573, -0.2363263, 1, 0, 0, 1, 1,
-2.68202, -0.5574239, -1.816468, 0, 0, 0, 1, 1,
-2.658441, -0.002557149, -1.937819, 0, 0, 0, 1, 1,
-2.59992, 2.090604, 0.6863425, 0, 0, 0, 1, 1,
-2.582047, -1.433124, -2.230333, 0, 0, 0, 1, 1,
-2.564027, -1.604426, -1.965153, 0, 0, 0, 1, 1,
-2.555536, 0.5322658, -2.587843, 0, 0, 0, 1, 1,
-2.335049, -0.2825115, -2.414469, 0, 0, 0, 1, 1,
-2.328671, -0.3845997, -0.6086099, 1, 1, 1, 1, 1,
-2.305589, -1.248518, -2.298035, 1, 1, 1, 1, 1,
-2.282608, 1.369747, -1.374014, 1, 1, 1, 1, 1,
-2.269973, -1.142485, -2.577721, 1, 1, 1, 1, 1,
-2.243354, 0.04901532, -0.9873057, 1, 1, 1, 1, 1,
-2.226721, -0.5585163, -1.79512, 1, 1, 1, 1, 1,
-2.164808, 1.081643, 0.5211717, 1, 1, 1, 1, 1,
-2.164557, 0.1415657, -0.6454198, 1, 1, 1, 1, 1,
-2.087927, -0.8465934, -1.476824, 1, 1, 1, 1, 1,
-2.064686, -0.8886167, -2.496496, 1, 1, 1, 1, 1,
-2.026916, 1.592861, -0.2398853, 1, 1, 1, 1, 1,
-2.005296, 1.473514, -1.030467, 1, 1, 1, 1, 1,
-1.985023, -0.8976668, -2.46555, 1, 1, 1, 1, 1,
-1.97466, 0.3766415, -1.376917, 1, 1, 1, 1, 1,
-1.941783, 1.533699, -0.2578031, 1, 1, 1, 1, 1,
-1.929293, -0.8974721, -1.301182, 0, 0, 1, 1, 1,
-1.905739, 0.8352214, -2.527288, 1, 0, 0, 1, 1,
-1.889758, 1.721522, -1.393213, 1, 0, 0, 1, 1,
-1.880876, 0.4441778, -0.2854578, 1, 0, 0, 1, 1,
-1.869164, 1.046097, -1.105618, 1, 0, 0, 1, 1,
-1.857246, -0.1754694, -2.323492, 1, 0, 0, 1, 1,
-1.837666, -0.9395425, -1.991538, 0, 0, 0, 1, 1,
-1.836051, 0.3627265, -1.519595, 0, 0, 0, 1, 1,
-1.815277, 1.072981, -0.8288814, 0, 0, 0, 1, 1,
-1.813499, -0.5161846, -1.604064, 0, 0, 0, 1, 1,
-1.798563, 0.645848, -0.9205564, 0, 0, 0, 1, 1,
-1.783914, 0.3689613, -0.7068375, 0, 0, 0, 1, 1,
-1.783754, -0.8745609, -0.9101135, 0, 0, 0, 1, 1,
-1.781782, 0.5892152, -1.365619, 1, 1, 1, 1, 1,
-1.779962, 2.854507, 0.7456513, 1, 1, 1, 1, 1,
-1.778898, -1.467722, -3.215541, 1, 1, 1, 1, 1,
-1.777815, -0.5929306, -3.693025, 1, 1, 1, 1, 1,
-1.777393, 0.8795486, -1.43507, 1, 1, 1, 1, 1,
-1.773088, 0.1572059, -1.145705, 1, 1, 1, 1, 1,
-1.75069, -0.4020697, -2.392653, 1, 1, 1, 1, 1,
-1.73478, 0.09266668, -0.3450993, 1, 1, 1, 1, 1,
-1.729643, 1.37592, -2.836428, 1, 1, 1, 1, 1,
-1.70042, 0.4422269, -1.174424, 1, 1, 1, 1, 1,
-1.690877, 1.172553, -1.230488, 1, 1, 1, 1, 1,
-1.683597, -0.1203585, -2.67935, 1, 1, 1, 1, 1,
-1.658083, 1.783662, 1.598122, 1, 1, 1, 1, 1,
-1.635819, -0.07785095, -1.122071, 1, 1, 1, 1, 1,
-1.635789, -0.6690984, -1.156527, 1, 1, 1, 1, 1,
-1.633785, -0.7309129, -3.045088, 0, 0, 1, 1, 1,
-1.602384, 0.1111983, -2.503464, 1, 0, 0, 1, 1,
-1.582313, 1.048606, -0.9617274, 1, 0, 0, 1, 1,
-1.573001, 0.9854925, 0.5686146, 1, 0, 0, 1, 1,
-1.570037, -1.427648, -0.4924344, 1, 0, 0, 1, 1,
-1.566723, -0.9749517, -2.225836, 1, 0, 0, 1, 1,
-1.530716, -0.5445418, -2.382343, 0, 0, 0, 1, 1,
-1.527248, 0.4220656, -1.692379, 0, 0, 0, 1, 1,
-1.520017, -0.7239304, -2.808508, 0, 0, 0, 1, 1,
-1.517271, 1.354896, -0.07772134, 0, 0, 0, 1, 1,
-1.508928, 0.9464504, -2.204074, 0, 0, 0, 1, 1,
-1.499189, -1.126725, -2.663924, 0, 0, 0, 1, 1,
-1.479977, -0.9996932, -4.113212, 0, 0, 0, 1, 1,
-1.470384, 0.6415353, -1.838084, 1, 1, 1, 1, 1,
-1.458925, 0.1435379, -1.961215, 1, 1, 1, 1, 1,
-1.452267, 0.3554145, -0.413667, 1, 1, 1, 1, 1,
-1.448534, 0.02023501, -1.308602, 1, 1, 1, 1, 1,
-1.439816, -0.09157395, -2.97916, 1, 1, 1, 1, 1,
-1.434126, 0.8217527, -1.906066, 1, 1, 1, 1, 1,
-1.432253, -1.141852, -1.744204, 1, 1, 1, 1, 1,
-1.421164, -0.5052653, -1.600141, 1, 1, 1, 1, 1,
-1.406443, 0.3467332, -0.1268592, 1, 1, 1, 1, 1,
-1.404328, -1.470354, -3.906528, 1, 1, 1, 1, 1,
-1.400801, 0.7534647, -2.672143, 1, 1, 1, 1, 1,
-1.36287, -0.5449766, -1.624084, 1, 1, 1, 1, 1,
-1.358969, -1.337321, -2.842866, 1, 1, 1, 1, 1,
-1.350938, -0.2303361, -1.434359, 1, 1, 1, 1, 1,
-1.346122, 0.2174556, -1.006467, 1, 1, 1, 1, 1,
-1.345074, 1.479511, -0.4586077, 0, 0, 1, 1, 1,
-1.332849, -0.9719946, -2.55277, 1, 0, 0, 1, 1,
-1.324082, 2.244359, -1.156187, 1, 0, 0, 1, 1,
-1.32392, 0.2019404, -1.065698, 1, 0, 0, 1, 1,
-1.320175, 1.171783, -1.268569, 1, 0, 0, 1, 1,
-1.318072, -0.1263599, -1.617404, 1, 0, 0, 1, 1,
-1.315988, -0.8534135, 0.3057496, 0, 0, 0, 1, 1,
-1.308592, -1.588072, -0.6731732, 0, 0, 0, 1, 1,
-1.302245, -0.30705, -1.187308, 0, 0, 0, 1, 1,
-1.298427, -0.8704107, -2.797293, 0, 0, 0, 1, 1,
-1.295698, -0.06963411, -2.433382, 0, 0, 0, 1, 1,
-1.281973, 0.4470531, -1.414279, 0, 0, 0, 1, 1,
-1.278118, -0.8742493, -2.310993, 0, 0, 0, 1, 1,
-1.270215, -0.3604856, -0.8382612, 1, 1, 1, 1, 1,
-1.262641, 1.048089, -0.864773, 1, 1, 1, 1, 1,
-1.261876, -0.9424191, -5.244613, 1, 1, 1, 1, 1,
-1.256648, 0.08817111, -1.79179, 1, 1, 1, 1, 1,
-1.250987, 0.1933616, -2.102254, 1, 1, 1, 1, 1,
-1.24069, -1.256702, -3.056383, 1, 1, 1, 1, 1,
-1.23684, 0.469981, -0.7775986, 1, 1, 1, 1, 1,
-1.235533, -1.803729, -1.689381, 1, 1, 1, 1, 1,
-1.233925, -0.7118703, -2.673189, 1, 1, 1, 1, 1,
-1.224106, 0.3636934, -0.9970611, 1, 1, 1, 1, 1,
-1.215757, 2.57747, -1.255037, 1, 1, 1, 1, 1,
-1.207258, -0.3175052, -3.376862, 1, 1, 1, 1, 1,
-1.195672, 1.35677, 0.4007978, 1, 1, 1, 1, 1,
-1.188575, 0.2829769, -2.277132, 1, 1, 1, 1, 1,
-1.175926, 0.3888738, -3.339783, 1, 1, 1, 1, 1,
-1.173057, 0.2726475, -0.4727351, 0, 0, 1, 1, 1,
-1.171886, 0.02510286, -2.43595, 1, 0, 0, 1, 1,
-1.168558, -1.220842, -2.978065, 1, 0, 0, 1, 1,
-1.168326, 0.6926011, -1.623116, 1, 0, 0, 1, 1,
-1.153585, -1.267378, -4.994799, 1, 0, 0, 1, 1,
-1.145634, -1.001929, -1.691463, 1, 0, 0, 1, 1,
-1.144992, -1.476108, -3.219245, 0, 0, 0, 1, 1,
-1.132723, 0.5669114, -3.02361, 0, 0, 0, 1, 1,
-1.129345, 0.190848, -2.265759, 0, 0, 0, 1, 1,
-1.129319, 0.3039228, -2.723122, 0, 0, 0, 1, 1,
-1.127175, 0.9734093, -0.5075776, 0, 0, 0, 1, 1,
-1.123753, -1.799932, -1.807562, 0, 0, 0, 1, 1,
-1.11516, -2.507024, -3.878953, 0, 0, 0, 1, 1,
-1.114812, -0.3068153, -3.732877, 1, 1, 1, 1, 1,
-1.10761, -2.204966, -2.497922, 1, 1, 1, 1, 1,
-1.101533, 1.239287, -1.942672, 1, 1, 1, 1, 1,
-1.101224, 1.043954, -1.489239, 1, 1, 1, 1, 1,
-1.099693, -0.7449422, -2.175448, 1, 1, 1, 1, 1,
-1.099547, 2.016437, -0.1909189, 1, 1, 1, 1, 1,
-1.092649, -1.129246, -1.798711, 1, 1, 1, 1, 1,
-1.08948, 0.7963925, -0.7192, 1, 1, 1, 1, 1,
-1.088344, 0.5243767, -0.2821205, 1, 1, 1, 1, 1,
-1.085874, 0.3071877, -2.741038, 1, 1, 1, 1, 1,
-1.081966, 1.634162, -0.5668231, 1, 1, 1, 1, 1,
-1.075331, -1.124103, -2.158996, 1, 1, 1, 1, 1,
-1.069594, 1.737735, -1.541174, 1, 1, 1, 1, 1,
-1.069186, -2.248718, -2.21359, 1, 1, 1, 1, 1,
-1.06303, 2.258585, -0.710258, 1, 1, 1, 1, 1,
-1.062992, -1.228147, -2.111028, 0, 0, 1, 1, 1,
-1.06235, 0.953015, -1.628218, 1, 0, 0, 1, 1,
-1.058699, -0.6107044, -1.058501, 1, 0, 0, 1, 1,
-1.057182, 0.3380816, -0.2399295, 1, 0, 0, 1, 1,
-1.054847, -0.4494437, -1.155557, 1, 0, 0, 1, 1,
-1.053064, -1.374222, -2.912946, 1, 0, 0, 1, 1,
-1.03389, 0.506557, -0.9476361, 0, 0, 0, 1, 1,
-1.032865, 1.990683, 0.3836456, 0, 0, 0, 1, 1,
-1.031299, 0.1325656, -2.536798, 0, 0, 0, 1, 1,
-1.030701, 0.2221548, -3.4463, 0, 0, 0, 1, 1,
-1.024823, -2.151969, -2.274927, 0, 0, 0, 1, 1,
-1.019858, -0.745527, -4.645793, 0, 0, 0, 1, 1,
-1.019387, 0.8747287, -1.500132, 0, 0, 0, 1, 1,
-1.019245, 0.04059187, -2.064424, 1, 1, 1, 1, 1,
-1.017762, 1.758887, -1.164753, 1, 1, 1, 1, 1,
-1.016457, 0.2790212, -1.716717, 1, 1, 1, 1, 1,
-1.013698, -0.03032718, -2.844208, 1, 1, 1, 1, 1,
-1.003725, -0.6490319, -0.9663281, 1, 1, 1, 1, 1,
-1.003601, -1.702552, -3.248121, 1, 1, 1, 1, 1,
-1.000817, 0.7936583, 1.253373, 1, 1, 1, 1, 1,
-0.9994607, 1.062721, -0.5944303, 1, 1, 1, 1, 1,
-0.9883454, -2.4718, -3.738396, 1, 1, 1, 1, 1,
-0.9774249, 1.053733, -0.5200382, 1, 1, 1, 1, 1,
-0.9734256, 1.344997, 1.241899, 1, 1, 1, 1, 1,
-0.9720434, -0.3559862, -0.2427897, 1, 1, 1, 1, 1,
-0.9692443, -0.008939972, -1.13995, 1, 1, 1, 1, 1,
-0.9671027, 0.6303772, -1.000411, 1, 1, 1, 1, 1,
-0.9663576, -0.5641875, -1.328219, 1, 1, 1, 1, 1,
-0.9651675, 1.073179, -0.8255304, 0, 0, 1, 1, 1,
-0.95968, -0.3183194, -2.234558, 1, 0, 0, 1, 1,
-0.9510714, 1.005301, -1.344329, 1, 0, 0, 1, 1,
-0.9491805, 1.402314, -0.7303458, 1, 0, 0, 1, 1,
-0.9456391, 1.617211, 1.476248, 1, 0, 0, 1, 1,
-0.9419659, -0.1429411, -2.319663, 1, 0, 0, 1, 1,
-0.9406297, -0.6073065, -3.269943, 0, 0, 0, 1, 1,
-0.9390462, 1.13031, -1.731369, 0, 0, 0, 1, 1,
-0.9386135, 0.773246, -2.057811, 0, 0, 0, 1, 1,
-0.9373935, 1.079526, -0.1817058, 0, 0, 0, 1, 1,
-0.9280276, 0.6739324, -1.1481, 0, 0, 0, 1, 1,
-0.924705, 0.3893558, 0.049752, 0, 0, 0, 1, 1,
-0.9202041, 0.313773, -2.009883, 0, 0, 0, 1, 1,
-0.9131671, 0.3125449, -0.3863007, 1, 1, 1, 1, 1,
-0.9114131, -1.66494, -2.988313, 1, 1, 1, 1, 1,
-0.9101868, 0.8964161, -1.019147, 1, 1, 1, 1, 1,
-0.9047779, 1.635851, -0.5791545, 1, 1, 1, 1, 1,
-0.9023481, -1.159145, -1.769436, 1, 1, 1, 1, 1,
-0.9017326, -0.5037751, -0.6175758, 1, 1, 1, 1, 1,
-0.9001245, -1.298091, -0.9916773, 1, 1, 1, 1, 1,
-0.8939824, 1.014412, -1.883091, 1, 1, 1, 1, 1,
-0.8923781, 0.5156832, -1.124904, 1, 1, 1, 1, 1,
-0.8891802, -0.05669088, -1.289664, 1, 1, 1, 1, 1,
-0.8891282, -2.263229, -4.039567, 1, 1, 1, 1, 1,
-0.8842531, -1.66468, -2.104455, 1, 1, 1, 1, 1,
-0.8840143, -1.268634, -3.322789, 1, 1, 1, 1, 1,
-0.8798997, 0.8394419, -2.736908, 1, 1, 1, 1, 1,
-0.8793101, 0.7940367, -0.3049949, 1, 1, 1, 1, 1,
-0.8792093, -0.4251267, -1.575263, 0, 0, 1, 1, 1,
-0.8743711, 1.391086, 0.6077481, 1, 0, 0, 1, 1,
-0.8742433, 0.1043264, 0.06381939, 1, 0, 0, 1, 1,
-0.8729299, -0.8560883, -2.366738, 1, 0, 0, 1, 1,
-0.8685983, -0.4993647, -2.497079, 1, 0, 0, 1, 1,
-0.8678038, 0.539903, -0.389838, 1, 0, 0, 1, 1,
-0.8666549, -0.9568567, -2.670496, 0, 0, 0, 1, 1,
-0.8640696, 0.7210756, -2.445653, 0, 0, 0, 1, 1,
-0.8639327, 0.9160844, 0.3116027, 0, 0, 0, 1, 1,
-0.8584851, -1.507423, -0.9933585, 0, 0, 0, 1, 1,
-0.8576607, 1.196916, -1.553432, 0, 0, 0, 1, 1,
-0.8549114, 1.193618, 0.4331858, 0, 0, 0, 1, 1,
-0.8538348, 0.8954927, -0.7066457, 0, 0, 0, 1, 1,
-0.8477917, 0.1706325, -2.409092, 1, 1, 1, 1, 1,
-0.8459461, 0.07482068, -0.9325159, 1, 1, 1, 1, 1,
-0.8454499, -0.532743, -2.653606, 1, 1, 1, 1, 1,
-0.8444035, 0.2030851, 1.474047, 1, 1, 1, 1, 1,
-0.8441125, 0.3930727, -2.017679, 1, 1, 1, 1, 1,
-0.8401768, 0.5234235, -1.499069, 1, 1, 1, 1, 1,
-0.8348818, -0.17608, -1.498588, 1, 1, 1, 1, 1,
-0.8300869, -0.6741375, -0.9354856, 1, 1, 1, 1, 1,
-0.822105, -0.1878459, -3.258332, 1, 1, 1, 1, 1,
-0.8115914, -0.739782, -1.163049, 1, 1, 1, 1, 1,
-0.808709, 0.7584541, 1.005832, 1, 1, 1, 1, 1,
-0.80752, 0.3677934, -3.164574, 1, 1, 1, 1, 1,
-0.8061616, 0.08001835, -2.042601, 1, 1, 1, 1, 1,
-0.804422, 1.509534, 0.5811315, 1, 1, 1, 1, 1,
-0.801704, -0.01959525, -1.179079, 1, 1, 1, 1, 1,
-0.7984687, -0.4743484, -2.587652, 0, 0, 1, 1, 1,
-0.7983593, 1.022197, -0.1404549, 1, 0, 0, 1, 1,
-0.7951034, 0.2882673, -2.441839, 1, 0, 0, 1, 1,
-0.7926773, -0.1121489, -1.077231, 1, 0, 0, 1, 1,
-0.790624, 0.6636227, -0.09943533, 1, 0, 0, 1, 1,
-0.7896249, 0.007015096, -0.4617245, 1, 0, 0, 1, 1,
-0.7825912, -0.3035474, -2.580544, 0, 0, 0, 1, 1,
-0.7741359, 0.2354624, -1.706436, 0, 0, 0, 1, 1,
-0.7731265, -0.5845982, -2.971034, 0, 0, 0, 1, 1,
-0.7713057, 0.8116214, -1.39927, 0, 0, 0, 1, 1,
-0.7698402, 1.263659, 0.478005, 0, 0, 0, 1, 1,
-0.7679396, -1.935177, -2.535707, 0, 0, 0, 1, 1,
-0.7674186, -0.9137556, -2.598312, 0, 0, 0, 1, 1,
-0.7637647, -1.797219, -1.419691, 1, 1, 1, 1, 1,
-0.7550882, -0.9571574, -2.820421, 1, 1, 1, 1, 1,
-0.7522023, 0.9179991, -0.3365295, 1, 1, 1, 1, 1,
-0.7508628, 0.2676565, -1.873258, 1, 1, 1, 1, 1,
-0.7358194, -0.4495921, -1.865075, 1, 1, 1, 1, 1,
-0.7297293, 1.096085, -1.617373, 1, 1, 1, 1, 1,
-0.7292807, -0.2023588, -0.4847938, 1, 1, 1, 1, 1,
-0.7292311, -0.4359115, -0.4636055, 1, 1, 1, 1, 1,
-0.7120072, -0.5716842, -3.058758, 1, 1, 1, 1, 1,
-0.7107397, -0.8887668, -1.390711, 1, 1, 1, 1, 1,
-0.7103217, 0.1453846, -0.176681, 1, 1, 1, 1, 1,
-0.7075391, 1.480837, -0.004914638, 1, 1, 1, 1, 1,
-0.7053322, -0.5146683, -2.754475, 1, 1, 1, 1, 1,
-0.7027208, -0.1441656, -0.9476702, 1, 1, 1, 1, 1,
-0.7025347, -1.666564, -4.418658, 1, 1, 1, 1, 1,
-0.7003884, 0.1073753, -1.343593, 0, 0, 1, 1, 1,
-0.6963241, 0.9464751, -0.05774319, 1, 0, 0, 1, 1,
-0.6833957, 0.4639515, -0.1272923, 1, 0, 0, 1, 1,
-0.6776108, 1.190979, -2.632779, 1, 0, 0, 1, 1,
-0.6705317, 0.8864381, -1.304474, 1, 0, 0, 1, 1,
-0.6641961, -1.429564, -0.8982727, 1, 0, 0, 1, 1,
-0.6596629, 1.008398, 1.178929, 0, 0, 0, 1, 1,
-0.6565287, -0.0589022, -2.593855, 0, 0, 0, 1, 1,
-0.6504744, 0.7794188, -1.784479, 0, 0, 0, 1, 1,
-0.6504194, -1.074044, -4.092785, 0, 0, 0, 1, 1,
-0.6496437, -0.9046882, -1.94268, 0, 0, 0, 1, 1,
-0.6465715, 1.738064, 1.554175, 0, 0, 0, 1, 1,
-0.6449411, 1.396951, -1.149002, 0, 0, 0, 1, 1,
-0.6411539, -0.5075958, -1.49933, 1, 1, 1, 1, 1,
-0.639624, -0.1211784, -1.498834, 1, 1, 1, 1, 1,
-0.6384067, -0.5774891, -2.172466, 1, 1, 1, 1, 1,
-0.636364, -0.5109327, -3.367046, 1, 1, 1, 1, 1,
-0.6331258, 1.76499, 0.5782567, 1, 1, 1, 1, 1,
-0.6288794, -1.491051, -2.309322, 1, 1, 1, 1, 1,
-0.6285502, 0.03987721, 0.2022415, 1, 1, 1, 1, 1,
-0.6278478, 0.8127332, -0.7595375, 1, 1, 1, 1, 1,
-0.6256581, 0.4746079, 0.03426027, 1, 1, 1, 1, 1,
-0.6167563, -0.7187766, -2.140973, 1, 1, 1, 1, 1,
-0.608285, -0.4474845, -3.525605, 1, 1, 1, 1, 1,
-0.6077939, 0.03617755, -2.579457, 1, 1, 1, 1, 1,
-0.6072133, 0.4847714, 0.09683973, 1, 1, 1, 1, 1,
-0.6067383, 1.603324, -1.081981, 1, 1, 1, 1, 1,
-0.6001089, 1.229988, 0.1557065, 1, 1, 1, 1, 1,
-0.5956557, 1.037204, 0.1177686, 0, 0, 1, 1, 1,
-0.5893965, 1.54011, -1.097645, 1, 0, 0, 1, 1,
-0.5869239, 0.1232238, -2.20056, 1, 0, 0, 1, 1,
-0.5805843, -2.090155, -4.019389, 1, 0, 0, 1, 1,
-0.5773397, -0.02258692, -1.218833, 1, 0, 0, 1, 1,
-0.5743942, -1.568673, -3.145523, 1, 0, 0, 1, 1,
-0.5726655, -1.606226, -3.060015, 0, 0, 0, 1, 1,
-0.572634, 0.6192931, -0.3607904, 0, 0, 0, 1, 1,
-0.5701007, 3.051816, -1.543224, 0, 0, 0, 1, 1,
-0.5700806, 0.3739356, -0.6863359, 0, 0, 0, 1, 1,
-0.5684908, 2.156717, 0.9174073, 0, 0, 0, 1, 1,
-0.5623313, 0.5994408, 1.229863, 0, 0, 0, 1, 1,
-0.5618988, 0.08089326, -1.655086, 0, 0, 0, 1, 1,
-0.555302, -0.8990533, -1.717804, 1, 1, 1, 1, 1,
-0.5541804, 0.3611132, 0.3809794, 1, 1, 1, 1, 1,
-0.5492, -1.266304, -0.6789541, 1, 1, 1, 1, 1,
-0.5485682, -0.36686, -2.737788, 1, 1, 1, 1, 1,
-0.5480067, 0.6914064, -0.8536007, 1, 1, 1, 1, 1,
-0.540064, -2.417803, -3.42768, 1, 1, 1, 1, 1,
-0.5276932, -0.9403697, -2.864719, 1, 1, 1, 1, 1,
-0.5258278, 0.2945026, -1.541934, 1, 1, 1, 1, 1,
-0.525066, 0.006669178, -1.805267, 1, 1, 1, 1, 1,
-0.5214996, -0.5758197, -2.963703, 1, 1, 1, 1, 1,
-0.520531, -1.050802, -1.217528, 1, 1, 1, 1, 1,
-0.519935, 0.7968608, -3.653661, 1, 1, 1, 1, 1,
-0.5184186, -0.5297632, -3.457082, 1, 1, 1, 1, 1,
-0.5160718, -1.094629, -2.110211, 1, 1, 1, 1, 1,
-0.5152223, -0.7729607, -2.960639, 1, 1, 1, 1, 1,
-0.5147107, -2.548866, -3.519085, 0, 0, 1, 1, 1,
-0.5125776, -0.05302756, -1.079708, 1, 0, 0, 1, 1,
-0.5116996, -1.295909, -3.407263, 1, 0, 0, 1, 1,
-0.5080831, 0.05028034, -1.269425, 1, 0, 0, 1, 1,
-0.4966821, -1.567942, -0.3108525, 1, 0, 0, 1, 1,
-0.4955544, 1.110296, 0.3760881, 1, 0, 0, 1, 1,
-0.4817745, -0.8075652, -4.057372, 0, 0, 0, 1, 1,
-0.4745361, 1.966866, 0.8787078, 0, 0, 0, 1, 1,
-0.4743601, 1.00226, 0.5366109, 0, 0, 0, 1, 1,
-0.4727259, 0.6245894, -2.369724, 0, 0, 0, 1, 1,
-0.4717675, 0.7728646, -1.46248, 0, 0, 0, 1, 1,
-0.4717602, -1.253114, -2.376089, 0, 0, 0, 1, 1,
-0.4681981, 1.516994, -0.7550999, 0, 0, 0, 1, 1,
-0.4660026, -0.1272439, -3.332599, 1, 1, 1, 1, 1,
-0.4657665, -0.02423927, -1.938849, 1, 1, 1, 1, 1,
-0.4645458, 0.7543516, 1.440444, 1, 1, 1, 1, 1,
-0.4635522, 0.5188703, 0.01561932, 1, 1, 1, 1, 1,
-0.462602, 0.06712986, -1.490832, 1, 1, 1, 1, 1,
-0.456426, 2.364401, 0.2535104, 1, 1, 1, 1, 1,
-0.4544304, -0.332793, -1.62339, 1, 1, 1, 1, 1,
-0.4534805, 0.2713985, 1.745037, 1, 1, 1, 1, 1,
-0.4534524, -0.1292309, -1.49474, 1, 1, 1, 1, 1,
-0.4534223, 1.726208, -0.3607927, 1, 1, 1, 1, 1,
-0.4470645, -1.674957, -3.440118, 1, 1, 1, 1, 1,
-0.4467287, 0.8366033, -1.3428, 1, 1, 1, 1, 1,
-0.4447595, -2.521883, -1.028446, 1, 1, 1, 1, 1,
-0.4444162, -0.2585866, -1.084672, 1, 1, 1, 1, 1,
-0.4443128, 0.5325207, 0.9218806, 1, 1, 1, 1, 1,
-0.43909, 0.5994807, 0.8151798, 0, 0, 1, 1, 1,
-0.4378746, 0.973788, 0.8064293, 1, 0, 0, 1, 1,
-0.4337678, -0.8349933, -2.292522, 1, 0, 0, 1, 1,
-0.4325819, 1.768937, -1.740815, 1, 0, 0, 1, 1,
-0.4318549, 1.216271, -0.7075503, 1, 0, 0, 1, 1,
-0.4299331, 0.7635072, 0.482219, 1, 0, 0, 1, 1,
-0.4278584, -0.4016739, -2.219181, 0, 0, 0, 1, 1,
-0.4210595, -1.082827, -1.827064, 0, 0, 0, 1, 1,
-0.4204388, -0.8850954, -0.9545196, 0, 0, 0, 1, 1,
-0.418155, 1.347118, -0.02779716, 0, 0, 0, 1, 1,
-0.4162956, 0.8413781, 0.5258479, 0, 0, 0, 1, 1,
-0.4108612, -0.5406381, -2.887768, 0, 0, 0, 1, 1,
-0.4056786, 0.2246109, -1.516744, 0, 0, 0, 1, 1,
-0.4009364, 1.940169, 0.007047991, 1, 1, 1, 1, 1,
-0.3932568, -0.6456723, -3.30155, 1, 1, 1, 1, 1,
-0.3909906, -0.1157068, -3.909533, 1, 1, 1, 1, 1,
-0.386723, -2.55139, -4.060838, 1, 1, 1, 1, 1,
-0.3854321, 0.05057541, -4.121072, 1, 1, 1, 1, 1,
-0.3850218, 0.402047, -0.6564916, 1, 1, 1, 1, 1,
-0.3802604, 1.7699, -0.7959961, 1, 1, 1, 1, 1,
-0.3797923, 1.471479, 0.1071405, 1, 1, 1, 1, 1,
-0.3774288, -1.825083, -1.861502, 1, 1, 1, 1, 1,
-0.3762076, -0.1906191, -1.778811, 1, 1, 1, 1, 1,
-0.3740831, -1.218703, -3.96281, 1, 1, 1, 1, 1,
-0.3726938, 0.8701556, -0.4750347, 1, 1, 1, 1, 1,
-0.3709527, -0.2613705, -0.6108115, 1, 1, 1, 1, 1,
-0.3704737, -1.036014, -1.339509, 1, 1, 1, 1, 1,
-0.3699838, 0.1132405, -0.06942449, 1, 1, 1, 1, 1,
-0.3665203, 0.7404568, -0.1917856, 0, 0, 1, 1, 1,
-0.3660914, -0.8204366, -2.820042, 1, 0, 0, 1, 1,
-0.3652825, 1.136959, -1.048345, 1, 0, 0, 1, 1,
-0.3649662, -1.197955, -3.623006, 1, 0, 0, 1, 1,
-0.3641801, -0.9673743, -2.851446, 1, 0, 0, 1, 1,
-0.3636922, -0.9728202, -4.177735, 1, 0, 0, 1, 1,
-0.362552, -0.6647442, -1.878417, 0, 0, 0, 1, 1,
-0.3584897, 1.239614, -0.3128328, 0, 0, 0, 1, 1,
-0.3565579, 1.901157, -1.068768, 0, 0, 0, 1, 1,
-0.3561356, 0.788975, -0.873073, 0, 0, 0, 1, 1,
-0.3546692, 0.9629956, 0.6475009, 0, 0, 0, 1, 1,
-0.3541835, -0.305036, -2.38864, 0, 0, 0, 1, 1,
-0.351116, -0.1577269, -2.524364, 0, 0, 0, 1, 1,
-0.3511033, -1.875359, -4.220294, 1, 1, 1, 1, 1,
-0.347946, 1.054186, 0.2546484, 1, 1, 1, 1, 1,
-0.3453439, -0.3783695, -3.881979, 1, 1, 1, 1, 1,
-0.3435116, -0.5711214, -3.139232, 1, 1, 1, 1, 1,
-0.3412076, -0.6221984, -3.134669, 1, 1, 1, 1, 1,
-0.3408511, 0.2467727, -0.484748, 1, 1, 1, 1, 1,
-0.337639, -0.1338525, -3.178821, 1, 1, 1, 1, 1,
-0.3355612, 2.804653, 1.996832, 1, 1, 1, 1, 1,
-0.3339469, -0.04503011, -0.7988047, 1, 1, 1, 1, 1,
-0.3311439, 0.1664339, -0.9449694, 1, 1, 1, 1, 1,
-0.3296096, -1.068021, -1.427671, 1, 1, 1, 1, 1,
-0.3272439, -0.1683967, -1.323446, 1, 1, 1, 1, 1,
-0.3241583, 0.2741205, -2.673564, 1, 1, 1, 1, 1,
-0.3224778, 0.4005495, 1.995908, 1, 1, 1, 1, 1,
-0.3214517, -1.352477, -3.762148, 1, 1, 1, 1, 1,
-0.3205826, 0.5368969, -0.1759744, 0, 0, 1, 1, 1,
-0.3204776, 0.9153326, -0.06700008, 1, 0, 0, 1, 1,
-0.320417, -1.440202, -3.569271, 1, 0, 0, 1, 1,
-0.3181269, -0.4047009, -2.062846, 1, 0, 0, 1, 1,
-0.3142538, 1.415595, -0.2751081, 1, 0, 0, 1, 1,
-0.3017261, -1.045662, -3.687473, 1, 0, 0, 1, 1,
-0.299902, 0.5485635, -1.390321, 0, 0, 0, 1, 1,
-0.2990997, -2.128851, -2.641054, 0, 0, 0, 1, 1,
-0.2984209, -1.348165, -3.735275, 0, 0, 0, 1, 1,
-0.2974863, -0.08688975, -2.718037, 0, 0, 0, 1, 1,
-0.2923632, -0.8602333, -1.691536, 0, 0, 0, 1, 1,
-0.2882996, 0.8782979, 1.876539, 0, 0, 0, 1, 1,
-0.285047, 0.5377455, 0.9589465, 0, 0, 0, 1, 1,
-0.2847496, -0.1039796, 0.5186526, 1, 1, 1, 1, 1,
-0.2832662, 0.901275, 0.1302873, 1, 1, 1, 1, 1,
-0.2820917, 1.848416, 0.2857634, 1, 1, 1, 1, 1,
-0.279011, 1.83242, -2.632732, 1, 1, 1, 1, 1,
-0.27447, 0.03812158, -0.8173004, 1, 1, 1, 1, 1,
-0.2683586, -0.001221185, -0.616836, 1, 1, 1, 1, 1,
-0.2667313, 0.0138005, -3.161851, 1, 1, 1, 1, 1,
-0.2567611, -0.3092263, -1.443282, 1, 1, 1, 1, 1,
-0.2553724, 1.52839, -0.868134, 1, 1, 1, 1, 1,
-0.2502099, -0.9653077, -2.598367, 1, 1, 1, 1, 1,
-0.2499631, 1.334171, 2.113062, 1, 1, 1, 1, 1,
-0.2485105, 1.384471, 0.4221414, 1, 1, 1, 1, 1,
-0.2456152, -1.075307, -2.501105, 1, 1, 1, 1, 1,
-0.2383496, -0.2046921, -1.480769, 1, 1, 1, 1, 1,
-0.2355944, -0.213732, -1.193681, 1, 1, 1, 1, 1,
-0.2274932, -0.4590343, -2.768801, 0, 0, 1, 1, 1,
-0.2268156, 0.8488319, 0.02283285, 1, 0, 0, 1, 1,
-0.2259703, 1.215567, -1.265019, 1, 0, 0, 1, 1,
-0.2247664, -0.6046689, -4.216281, 1, 0, 0, 1, 1,
-0.2106965, 0.8887143, 1.188953, 1, 0, 0, 1, 1,
-0.203166, 0.02953268, 0.5069477, 1, 0, 0, 1, 1,
-0.2025514, -0.9113014, -2.31545, 0, 0, 0, 1, 1,
-0.1906824, -1.472964, -2.477119, 0, 0, 0, 1, 1,
-0.1891065, -0.578672, -1.563357, 0, 0, 0, 1, 1,
-0.1809224, 2.183151, 0.5714805, 0, 0, 0, 1, 1,
-0.1788369, 0.9013858, -0.8902505, 0, 0, 0, 1, 1,
-0.1785059, -0.6550715, -3.896689, 0, 0, 0, 1, 1,
-0.1775211, -0.6468298, -2.215967, 0, 0, 0, 1, 1,
-0.1752375, 1.369218, 0.2456988, 1, 1, 1, 1, 1,
-0.1732819, -0.1790385, -1.369431, 1, 1, 1, 1, 1,
-0.1729582, 1.171815, -1.268715, 1, 1, 1, 1, 1,
-0.171827, -0.1830026, -2.726117, 1, 1, 1, 1, 1,
-0.1665445, -0.1624127, -0.963881, 1, 1, 1, 1, 1,
-0.1645433, 1.396872, -0.4681179, 1, 1, 1, 1, 1,
-0.1634285, -0.5647576, -3.792446, 1, 1, 1, 1, 1,
-0.1621633, 2.05998, 1.603539, 1, 1, 1, 1, 1,
-0.1614212, -1.538265, -3.735457, 1, 1, 1, 1, 1,
-0.1596089, 1.720898, -1.456607, 1, 1, 1, 1, 1,
-0.1557884, -1.161166, -3.333254, 1, 1, 1, 1, 1,
-0.1525777, -0.3065325, -3.847557, 1, 1, 1, 1, 1,
-0.1524355, 1.142757, 2.105819, 1, 1, 1, 1, 1,
-0.1505158, 1.477296, 1.082832, 1, 1, 1, 1, 1,
-0.1503881, -2.059359, -1.590799, 1, 1, 1, 1, 1,
-0.1431252, -1.101463, -2.275102, 0, 0, 1, 1, 1,
-0.1398812, 2.061835, 0.9892662, 1, 0, 0, 1, 1,
-0.1381111, 0.1063875, -0.5139207, 1, 0, 0, 1, 1,
-0.136911, -0.2177443, -1.917278, 1, 0, 0, 1, 1,
-0.1368939, 0.6592458, -0.1660488, 1, 0, 0, 1, 1,
-0.1311026, -1.438858, -4.524372, 1, 0, 0, 1, 1,
-0.1261112, -0.4544099, -1.938, 0, 0, 0, 1, 1,
-0.1232097, 0.5296199, -1.43719, 0, 0, 0, 1, 1,
-0.1135803, 0.1070165, -0.7783452, 0, 0, 0, 1, 1,
-0.1134865, -0.4050801, -1.151347, 0, 0, 0, 1, 1,
-0.1118179, -0.6178383, -3.677075, 0, 0, 0, 1, 1,
-0.111628, 0.2402709, 0.2365519, 0, 0, 0, 1, 1,
-0.1105212, -0.1562422, -3.947042, 0, 0, 0, 1, 1,
-0.1080467, 0.01678536, -2.26566, 1, 1, 1, 1, 1,
-0.1070579, 0.7354325, 0.2626603, 1, 1, 1, 1, 1,
-0.104482, -0.5582136, -2.752444, 1, 1, 1, 1, 1,
-0.1036023, 1.243886, 1.445627, 1, 1, 1, 1, 1,
-0.1034573, 0.6828586, 0.03669118, 1, 1, 1, 1, 1,
-0.1033351, -1.091068, -3.178987, 1, 1, 1, 1, 1,
-0.1019619, -0.1706187, -2.05073, 1, 1, 1, 1, 1,
-0.09996068, -0.4364421, -2.843067, 1, 1, 1, 1, 1,
-0.09827536, 0.5401045, -0.431704, 1, 1, 1, 1, 1,
-0.09822337, 0.162928, -1.639336, 1, 1, 1, 1, 1,
-0.09569088, -0.1034449, -2.811188, 1, 1, 1, 1, 1,
-0.0948845, -0.6783923, -3.510901, 1, 1, 1, 1, 1,
-0.09173083, -0.2361358, -1.985557, 1, 1, 1, 1, 1,
-0.0870485, 0.3790123, -3.274493, 1, 1, 1, 1, 1,
-0.08621723, 0.6200262, 0.2747897, 1, 1, 1, 1, 1,
-0.0844443, 1.439119, 0.05372233, 0, 0, 1, 1, 1,
-0.08013871, -0.2881348, -2.471815, 1, 0, 0, 1, 1,
-0.07989427, -0.793478, -3.437345, 1, 0, 0, 1, 1,
-0.07836814, 1.286441, 0.4332106, 1, 0, 0, 1, 1,
-0.07654145, 2.07581, -0.1494313, 1, 0, 0, 1, 1,
-0.07542724, -0.7569357, -1.975611, 1, 0, 0, 1, 1,
-0.07361611, -1.565045, -3.459733, 0, 0, 0, 1, 1,
-0.07198408, 0.9354976, 0.3869559, 0, 0, 0, 1, 1,
-0.07026272, -0.269906, -4.114571, 0, 0, 0, 1, 1,
-0.06563733, -0.3215368, -4.188152, 0, 0, 0, 1, 1,
-0.06526767, -0.7666669, -2.653949, 0, 0, 0, 1, 1,
-0.06498059, 0.7182345, -0.4453209, 0, 0, 0, 1, 1,
-0.06228093, 1.136953, 0.7937891, 0, 0, 0, 1, 1,
-0.06184974, 0.8760519, 0.8044853, 1, 1, 1, 1, 1,
-0.05440134, 1.17475, -0.119635, 1, 1, 1, 1, 1,
-0.0500231, 0.09179934, -0.3008087, 1, 1, 1, 1, 1,
-0.0468768, 0.1693833, 0.1854452, 1, 1, 1, 1, 1,
-0.04544228, -1.169208, -2.979114, 1, 1, 1, 1, 1,
-0.03790046, 0.925084, -0.52985, 1, 1, 1, 1, 1,
-0.0326064, -0.2784586, -1.978708, 1, 1, 1, 1, 1,
-0.03253318, -0.1046952, -2.627848, 1, 1, 1, 1, 1,
-0.03193048, 0.4701188, -0.6804565, 1, 1, 1, 1, 1,
-0.03180753, -0.09043565, -2.752758, 1, 1, 1, 1, 1,
-0.02687906, -0.1458325, -2.364349, 1, 1, 1, 1, 1,
-0.02530369, 0.5273041, -1.264769, 1, 1, 1, 1, 1,
-0.02183337, 0.04893384, -0.4821722, 1, 1, 1, 1, 1,
-0.01820033, -0.3010267, -1.83787, 1, 1, 1, 1, 1,
-0.01608795, -1.770669, -2.940285, 1, 1, 1, 1, 1,
-0.01381262, 0.1823595, -0.8223278, 0, 0, 1, 1, 1,
-0.01320228, -0.7981153, -5.217132, 1, 0, 0, 1, 1,
-0.01045098, 0.3756068, 1.102014, 1, 0, 0, 1, 1,
-0.00319014, 1.580969, 0.6788669, 1, 0, 0, 1, 1,
-0.002261188, -0.5094488, -2.923211, 1, 0, 0, 1, 1,
-0.001544108, 0.2456407, 0.9738544, 1, 0, 0, 1, 1,
-0.001528442, 0.4553822, -0.3025792, 0, 0, 0, 1, 1,
-0.001387819, 0.3567523, 0.8122267, 0, 0, 0, 1, 1,
-0.000320828, -0.8547698, -1.439816, 0, 0, 0, 1, 1,
0.001580871, -0.9181088, 2.999396, 0, 0, 0, 1, 1,
0.002840865, 1.263077, -1.272606, 0, 0, 0, 1, 1,
0.003058837, 0.5188881, 2.370808, 0, 0, 0, 1, 1,
0.009843289, 0.667275, 1.048769, 0, 0, 0, 1, 1,
0.01287118, 0.4606824, 0.6568487, 1, 1, 1, 1, 1,
0.0130842, 0.07927008, 0.7389855, 1, 1, 1, 1, 1,
0.01476422, 1.251191, -0.564954, 1, 1, 1, 1, 1,
0.01684773, -1.857408, 3.534801, 1, 1, 1, 1, 1,
0.01785579, 0.9632162, -0.7985355, 1, 1, 1, 1, 1,
0.01822391, 0.7063156, -1.179412, 1, 1, 1, 1, 1,
0.02026984, -0.2640781, 3.443769, 1, 1, 1, 1, 1,
0.02329842, 0.2939875, -0.1587846, 1, 1, 1, 1, 1,
0.02369222, -0.2388178, 2.611666, 1, 1, 1, 1, 1,
0.02616781, -0.5745447, 3.778042, 1, 1, 1, 1, 1,
0.02633307, 0.06809291, 0.4374467, 1, 1, 1, 1, 1,
0.03320939, -2.163171, 2.083587, 1, 1, 1, 1, 1,
0.0345874, -0.2931635, 2.161439, 1, 1, 1, 1, 1,
0.03522065, -2.330514, 3.710146, 1, 1, 1, 1, 1,
0.03533302, -0.4265994, 2.318301, 1, 1, 1, 1, 1,
0.03575593, -2.001191, 4.388744, 0, 0, 1, 1, 1,
0.03678427, -0.06708422, 2.579765, 1, 0, 0, 1, 1,
0.03760054, 1.328319, 1.678148, 1, 0, 0, 1, 1,
0.04149462, 0.449753, 1.566291, 1, 0, 0, 1, 1,
0.04302945, 0.4013515, 2.006332, 1, 0, 0, 1, 1,
0.04543487, 0.5487466, 0.6870803, 1, 0, 0, 1, 1,
0.04854009, -0.7429587, 1.698878, 0, 0, 0, 1, 1,
0.04870325, -1.228133, 4.011872, 0, 0, 0, 1, 1,
0.05216944, 0.2848156, -0.1896224, 0, 0, 0, 1, 1,
0.05246244, 0.2246515, 0.1100639, 0, 0, 0, 1, 1,
0.05729976, 2.299882, 0.04940984, 0, 0, 0, 1, 1,
0.06411337, 0.2033718, 2.607413, 0, 0, 0, 1, 1,
0.0763962, 0.4815118, 1.415166, 0, 0, 0, 1, 1,
0.08166187, 0.1096724, -1.078991, 1, 1, 1, 1, 1,
0.08553026, 0.1972373, 0.1844826, 1, 1, 1, 1, 1,
0.08561987, -0.7175818, 2.872983, 1, 1, 1, 1, 1,
0.09023059, -0.07523815, 1.729169, 1, 1, 1, 1, 1,
0.09140401, 0.7439675, 2.71792, 1, 1, 1, 1, 1,
0.09459911, 1.949958, 1.189445, 1, 1, 1, 1, 1,
0.09696987, -0.51231, 2.337557, 1, 1, 1, 1, 1,
0.100667, -0.3118199, 1.904342, 1, 1, 1, 1, 1,
0.1017189, -0.2391879, 3.362449, 1, 1, 1, 1, 1,
0.1070246, -0.3327561, 2.811081, 1, 1, 1, 1, 1,
0.1142287, 0.1746618, 0.5894917, 1, 1, 1, 1, 1,
0.1159505, -0.6477655, 2.258694, 1, 1, 1, 1, 1,
0.1262904, 0.5500631, 0.06637434, 1, 1, 1, 1, 1,
0.1279301, -0.2248995, 2.847454, 1, 1, 1, 1, 1,
0.1330395, -0.6420866, 2.348265, 1, 1, 1, 1, 1,
0.1357558, 0.2530481, -0.7833287, 0, 0, 1, 1, 1,
0.1429203, 0.5764301, 1.172633, 1, 0, 0, 1, 1,
0.1439632, -0.4560754, 4.429872, 1, 0, 0, 1, 1,
0.1442377, -0.6460078, 2.106164, 1, 0, 0, 1, 1,
0.1518151, -0.757813, 2.12573, 1, 0, 0, 1, 1,
0.1527408, 0.2481893, -0.1711111, 1, 0, 0, 1, 1,
0.1537816, -0.7099608, 5.317475, 0, 0, 0, 1, 1,
0.1548767, 2.473958, 0.7954, 0, 0, 0, 1, 1,
0.1557106, -0.311734, 3.753659, 0, 0, 0, 1, 1,
0.1605552, -0.2387391, 1.90941, 0, 0, 0, 1, 1,
0.1608258, -2.06166, 2.390795, 0, 0, 0, 1, 1,
0.1622231, 2.173038, 0.827859, 0, 0, 0, 1, 1,
0.1753349, -2.247134, 3.806054, 0, 0, 0, 1, 1,
0.177731, 0.7278571, 0.4784265, 1, 1, 1, 1, 1,
0.1781758, 0.1645618, 0.9876624, 1, 1, 1, 1, 1,
0.1848516, 0.2001205, 3.884086, 1, 1, 1, 1, 1,
0.1899528, 0.7246199, -0.09014858, 1, 1, 1, 1, 1,
0.190544, 0.1957656, 0.672551, 1, 1, 1, 1, 1,
0.1923124, 0.5271547, -0.5245423, 1, 1, 1, 1, 1,
0.2023146, -1.39601, 2.674697, 1, 1, 1, 1, 1,
0.2108412, 0.3981306, 0.9663936, 1, 1, 1, 1, 1,
0.2109665, 0.03683234, 0.6867865, 1, 1, 1, 1, 1,
0.2139582, 1.140573, -0.3921792, 1, 1, 1, 1, 1,
0.2172882, -1.011535, 2.594543, 1, 1, 1, 1, 1,
0.2177028, 2.067665, 0.4289117, 1, 1, 1, 1, 1,
0.2229179, -1.301793, 3.195963, 1, 1, 1, 1, 1,
0.2246221, -0.2207436, 1.790082, 1, 1, 1, 1, 1,
0.2256837, 1.579581, 0.6436957, 1, 1, 1, 1, 1,
0.2267679, 0.7855937, -2.365065, 0, 0, 1, 1, 1,
0.2297177, -0.178556, 2.590133, 1, 0, 0, 1, 1,
0.2298016, 1.31039, 1.767617, 1, 0, 0, 1, 1,
0.2305921, 0.2702492, 0.7968414, 1, 0, 0, 1, 1,
0.2323447, 0.527338, -0.2358995, 1, 0, 0, 1, 1,
0.2345869, 0.6596273, 0.02678006, 1, 0, 0, 1, 1,
0.2358756, 1.332174, -0.5373666, 0, 0, 0, 1, 1,
0.2381214, 0.6976533, -1.272626, 0, 0, 0, 1, 1,
0.2398693, -0.4460442, 3.141817, 0, 0, 0, 1, 1,
0.2399545, 0.5474129, 1.748171, 0, 0, 0, 1, 1,
0.248615, 0.4967447, 1.815253, 0, 0, 0, 1, 1,
0.255893, 0.5382645, -0.3432762, 0, 0, 0, 1, 1,
0.2596942, -0.2260509, 2.49262, 0, 0, 0, 1, 1,
0.2609353, -1.240576, 3.189315, 1, 1, 1, 1, 1,
0.2650247, -0.1960608, 2.249331, 1, 1, 1, 1, 1,
0.2710537, -0.9413276, 3.367705, 1, 1, 1, 1, 1,
0.2713929, -0.7190746, 2.428286, 1, 1, 1, 1, 1,
0.2714216, 0.3649863, 2.376381, 1, 1, 1, 1, 1,
0.2737046, 0.3675489, -0.7533177, 1, 1, 1, 1, 1,
0.2788965, 0.4069814, 1.8418, 1, 1, 1, 1, 1,
0.2823589, -0.5543091, 1.853151, 1, 1, 1, 1, 1,
0.2841131, 0.1942443, 0.2344756, 1, 1, 1, 1, 1,
0.2847924, -1.84507, 2.966534, 1, 1, 1, 1, 1,
0.2854237, -1.645483, 3.374636, 1, 1, 1, 1, 1,
0.285476, 1.609496, -0.1518979, 1, 1, 1, 1, 1,
0.285919, 0.2263537, 1.657533, 1, 1, 1, 1, 1,
0.2876174, -0.6648527, 3.070625, 1, 1, 1, 1, 1,
0.2900936, 1.377254, 0.1788226, 1, 1, 1, 1, 1,
0.2901749, 1.054103, -1.57495, 0, 0, 1, 1, 1,
0.290444, 0.2333659, 0.5487552, 1, 0, 0, 1, 1,
0.2907767, 0.3368412, 0.4034318, 1, 0, 0, 1, 1,
0.2915624, 0.09063035, 0.03717465, 1, 0, 0, 1, 1,
0.2927533, 0.9819452, -0.6698866, 1, 0, 0, 1, 1,
0.294885, -1.177377, 1.654792, 1, 0, 0, 1, 1,
0.2950186, 1.321614, 1.097703, 0, 0, 0, 1, 1,
0.3071896, 0.4145886, 0.6264676, 0, 0, 0, 1, 1,
0.315443, 0.7611873, 0.6399477, 0, 0, 0, 1, 1,
0.3195579, 1.473849, 0.4144376, 0, 0, 0, 1, 1,
0.3247482, 1.84966, -0.7898928, 0, 0, 0, 1, 1,
0.3256618, 0.457124, 0.7304351, 0, 0, 0, 1, 1,
0.3272972, -0.9004812, 2.345453, 0, 0, 0, 1, 1,
0.3278442, -0.8405554, 3.484758, 1, 1, 1, 1, 1,
0.3280178, 0.8527254, 0.3649977, 1, 1, 1, 1, 1,
0.3332889, -0.7082678, 2.717926, 1, 1, 1, 1, 1,
0.3410424, 0.5858445, -1.628866, 1, 1, 1, 1, 1,
0.34953, 0.0413744, 1.405442, 1, 1, 1, 1, 1,
0.3520893, -0.3510184, 3.631621, 1, 1, 1, 1, 1,
0.3528734, 0.09521195, 3.547062, 1, 1, 1, 1, 1,
0.353624, -0.1423396, 2.348184, 1, 1, 1, 1, 1,
0.3551977, 1.442364, 0.4867657, 1, 1, 1, 1, 1,
0.3595303, 0.6534505, 1.841044, 1, 1, 1, 1, 1,
0.3626757, -0.360961, 2.070718, 1, 1, 1, 1, 1,
0.3672786, -0.6874016, 1.428944, 1, 1, 1, 1, 1,
0.3673885, -0.6597103, 2.95018, 1, 1, 1, 1, 1,
0.3684068, -1.325104, 2.916597, 1, 1, 1, 1, 1,
0.3772191, -0.9784129, 3.434762, 1, 1, 1, 1, 1,
0.3776439, 1.221447, 0.2119577, 0, 0, 1, 1, 1,
0.379046, -0.1429147, 1.766198, 1, 0, 0, 1, 1,
0.3837363, -0.2753097, 2.466582, 1, 0, 0, 1, 1,
0.3839809, -0.264507, 0.7082867, 1, 0, 0, 1, 1,
0.3843498, 0.3507139, 0.5143022, 1, 0, 0, 1, 1,
0.3846384, 0.3858421, 0.1594872, 1, 0, 0, 1, 1,
0.3992417, -1.324874, 2.387029, 0, 0, 0, 1, 1,
0.4006827, 0.2670074, 0.1208074, 0, 0, 0, 1, 1,
0.4043531, 0.9321693, -1.278789, 0, 0, 0, 1, 1,
0.4058122, 2.325395, 0.717062, 0, 0, 0, 1, 1,
0.4085892, 0.8168371, -0.1170124, 0, 0, 0, 1, 1,
0.4137032, 1.108884, 1.231634, 0, 0, 0, 1, 1,
0.4184471, -0.8527114, 2.485662, 0, 0, 0, 1, 1,
0.4187815, -0.5030972, 3.192249, 1, 1, 1, 1, 1,
0.4198395, -0.1076851, 2.808071, 1, 1, 1, 1, 1,
0.4217443, 0.9453408, 0.2417457, 1, 1, 1, 1, 1,
0.4389471, -1.065951, 3.515661, 1, 1, 1, 1, 1,
0.4400594, -0.1650685, 1.711628, 1, 1, 1, 1, 1,
0.4414396, 1.115212, 0.5526659, 1, 1, 1, 1, 1,
0.4417736, -1.361899, 2.438731, 1, 1, 1, 1, 1,
0.443799, 0.7770637, -0.5494171, 1, 1, 1, 1, 1,
0.4443964, -0.9253229, 1.70115, 1, 1, 1, 1, 1,
0.4494186, -0.2442531, 3.751016, 1, 1, 1, 1, 1,
0.4508651, 0.352514, -0.04174305, 1, 1, 1, 1, 1,
0.4519249, -0.01362585, 1.262762, 1, 1, 1, 1, 1,
0.453845, 1.673637, -2.675728, 1, 1, 1, 1, 1,
0.4570597, -0.1729664, 2.92566, 1, 1, 1, 1, 1,
0.4599351, -1.155367, 3.597542, 1, 1, 1, 1, 1,
0.4605921, 0.02148871, 1.972474, 0, 0, 1, 1, 1,
0.4626503, 0.8167637, 2.028382, 1, 0, 0, 1, 1,
0.4642082, -0.4779792, 0.4724007, 1, 0, 0, 1, 1,
0.4662932, 0.1464263, 1.101297, 1, 0, 0, 1, 1,
0.4666972, -0.2354974, 0.3742964, 1, 0, 0, 1, 1,
0.4690815, -0.1794211, 1.018757, 1, 0, 0, 1, 1,
0.4770147, -0.07323624, 0.7842802, 0, 0, 0, 1, 1,
0.4798596, -0.9649465, 2.61459, 0, 0, 0, 1, 1,
0.4824651, -0.6342911, 2.295062, 0, 0, 0, 1, 1,
0.4831159, 0.03476845, 1.510921, 0, 0, 0, 1, 1,
0.4886617, -1.002049, 3.00213, 0, 0, 0, 1, 1,
0.4933253, 0.9366702, 0.7272572, 0, 0, 0, 1, 1,
0.4933253, -1.007976, 1.930934, 0, 0, 0, 1, 1,
0.4972371, 0.848411, -0.8818098, 1, 1, 1, 1, 1,
0.5010183, -0.0372371, 1.866606, 1, 1, 1, 1, 1,
0.5048082, -0.5280397, 4.058815, 1, 1, 1, 1, 1,
0.5088204, 1.10821, 0.1582334, 1, 1, 1, 1, 1,
0.5096447, 0.9913993, 0.3205763, 1, 1, 1, 1, 1,
0.5122621, 1.484907, 1.494355, 1, 1, 1, 1, 1,
0.5252076, -0.8818562, 2.945372, 1, 1, 1, 1, 1,
0.5297946, -0.9716425, 4.141167, 1, 1, 1, 1, 1,
0.5361066, -0.2295336, 2.669734, 1, 1, 1, 1, 1,
0.5364256, -1.238175, 2.590469, 1, 1, 1, 1, 1,
0.5390112, -0.5739142, 3.100304, 1, 1, 1, 1, 1,
0.5401024, -1.074742, 1.775601, 1, 1, 1, 1, 1,
0.5413736, 0.6755679, -0.3450461, 1, 1, 1, 1, 1,
0.5415582, 1.184717, 0.4247105, 1, 1, 1, 1, 1,
0.5423381, 0.1878678, 1.723347, 1, 1, 1, 1, 1,
0.5441802, -0.8449815, 2.265473, 0, 0, 1, 1, 1,
0.5449138, 0.9246171, 0.9439192, 1, 0, 0, 1, 1,
0.5483882, 0.6360289, 1.236237, 1, 0, 0, 1, 1,
0.5487, 1.37358, 1.620141, 1, 0, 0, 1, 1,
0.5512157, -0.5575303, 3.391566, 1, 0, 0, 1, 1,
0.554018, -2.491167, 2.059369, 1, 0, 0, 1, 1,
0.5575212, 0.009306959, 2.300176, 0, 0, 0, 1, 1,
0.5590971, -0.3359103, 1.139764, 0, 0, 0, 1, 1,
0.5594313, 0.3561307, 1.694665, 0, 0, 0, 1, 1,
0.560067, 1.440054, -0.05196025, 0, 0, 0, 1, 1,
0.5616376, -0.7538617, 1.478921, 0, 0, 0, 1, 1,
0.5647973, 0.9271498, 0.4979393, 0, 0, 0, 1, 1,
0.5650572, 0.1633693, -1.337311, 0, 0, 0, 1, 1,
0.5690761, 0.3858663, 1.138874, 1, 1, 1, 1, 1,
0.571134, -0.7718072, 1.161835, 1, 1, 1, 1, 1,
0.571241, -1.850835, 1.435755, 1, 1, 1, 1, 1,
0.5755655, 0.9406807, 0.3660508, 1, 1, 1, 1, 1,
0.5841539, -0.8714502, 1.302002, 1, 1, 1, 1, 1,
0.5878066, -0.4742157, 1.830525, 1, 1, 1, 1, 1,
0.5916613, 0.3724122, 3.530735, 1, 1, 1, 1, 1,
0.5940531, 1.318665, -0.2623667, 1, 1, 1, 1, 1,
0.59722, -0.6892215, 4.20267, 1, 1, 1, 1, 1,
0.5979666, 0.3901418, 2.286605, 1, 1, 1, 1, 1,
0.5993066, 0.9017437, 0.6387372, 1, 1, 1, 1, 1,
0.6023038, 0.5616224, -0.06850623, 1, 1, 1, 1, 1,
0.6040635, 1.661169, -0.8577015, 1, 1, 1, 1, 1,
0.607011, -0.5913745, 4.220288, 1, 1, 1, 1, 1,
0.6111836, 1.024976, -0.6435885, 1, 1, 1, 1, 1,
0.6127491, -2.641896, 3.590033, 0, 0, 1, 1, 1,
0.6156729, 0.0518798, 2.017415, 1, 0, 0, 1, 1,
0.6178229, 0.02858922, 3.693754, 1, 0, 0, 1, 1,
0.6195893, 1.045407, 0.382139, 1, 0, 0, 1, 1,
0.6214284, 1.698045, -0.3760656, 1, 0, 0, 1, 1,
0.6216691, 0.1376607, 0.7046329, 1, 0, 0, 1, 1,
0.6256418, 0.5346565, 0.8094482, 0, 0, 0, 1, 1,
0.6261293, -2.288067, 2.214515, 0, 0, 0, 1, 1,
0.6275851, 1.782127, 0.03878699, 0, 0, 0, 1, 1,
0.6295913, 1.236091, 0.4429294, 0, 0, 0, 1, 1,
0.6312189, -1.358973, 1.726857, 0, 0, 0, 1, 1,
0.6335194, -1.112994, 1.884301, 0, 0, 0, 1, 1,
0.6337436, -0.7121696, 1.620086, 0, 0, 0, 1, 1,
0.6352583, -0.5538308, 3.777893, 1, 1, 1, 1, 1,
0.642952, -0.8944693, 0.7827531, 1, 1, 1, 1, 1,
0.6468146, 0.366393, 0.7619841, 1, 1, 1, 1, 1,
0.6479629, -0.9870747, 2.300791, 1, 1, 1, 1, 1,
0.6486017, 2.127241, -1.052377, 1, 1, 1, 1, 1,
0.6547608, -0.9471648, 1.860165, 1, 1, 1, 1, 1,
0.6580375, 0.07728042, 0.6740326, 1, 1, 1, 1, 1,
0.6648213, -0.01242382, 0.6435708, 1, 1, 1, 1, 1,
0.6670108, 1.359675, 0.8671482, 1, 1, 1, 1, 1,
0.6696494, 0.1507078, 1.765795, 1, 1, 1, 1, 1,
0.6730267, -0.05203317, 1.607982, 1, 1, 1, 1, 1,
0.6747492, 0.1509261, 2.172988, 1, 1, 1, 1, 1,
0.6779984, -1.409659, 1.623845, 1, 1, 1, 1, 1,
0.6789324, -0.232579, 0.7837093, 1, 1, 1, 1, 1,
0.6806939, -1.04092, 2.614383, 1, 1, 1, 1, 1,
0.6826905, 1.598686, 1.257575, 0, 0, 1, 1, 1,
0.6842784, 1.092232, 1.666355, 1, 0, 0, 1, 1,
0.6882583, -0.1799348, 2.198613, 1, 0, 0, 1, 1,
0.6890038, 0.8585548, 1.012338, 1, 0, 0, 1, 1,
0.6925905, -1.851941, 3.414448, 1, 0, 0, 1, 1,
0.6940889, 0.4990155, 1.527506, 1, 0, 0, 1, 1,
0.6981193, -0.5903795, 1.449543, 0, 0, 0, 1, 1,
0.7065971, -0.4555109, 2.878658, 0, 0, 0, 1, 1,
0.7105323, 1.206051, 2.492095, 0, 0, 0, 1, 1,
0.7145384, -2.066646, 3.33819, 0, 0, 0, 1, 1,
0.717934, -0.1989768, 1.821392, 0, 0, 0, 1, 1,
0.7221278, -1.028303, 2.720593, 0, 0, 0, 1, 1,
0.7259745, 0.03478922, 3.01197, 0, 0, 0, 1, 1,
0.7324213, 0.8108858, 2.203245, 1, 1, 1, 1, 1,
0.7347696, 1.291339, 1.628903, 1, 1, 1, 1, 1,
0.7409619, 1.297865, 0.08201148, 1, 1, 1, 1, 1,
0.751588, -3.424141, 2.178307, 1, 1, 1, 1, 1,
0.7553527, 0.0724913, 1.535846, 1, 1, 1, 1, 1,
0.7559488, -1.133377, 2.183577, 1, 1, 1, 1, 1,
0.7573915, -0.6094106, 2.126904, 1, 1, 1, 1, 1,
0.7617142, 0.560655, 0.2103468, 1, 1, 1, 1, 1,
0.7651794, 0.4668513, 1.745133, 1, 1, 1, 1, 1,
0.7659786, 0.07861395, 0.8934554, 1, 1, 1, 1, 1,
0.766524, 2.239036, -1.085183, 1, 1, 1, 1, 1,
0.7740369, 0.0577006, 1.724446, 1, 1, 1, 1, 1,
0.7865742, -0.3989637, 1.760779, 1, 1, 1, 1, 1,
0.7892052, -0.9895139, 2.867504, 1, 1, 1, 1, 1,
0.7912733, 0.8067869, 0.8259987, 1, 1, 1, 1, 1,
0.7921888, -1.749671, 2.143059, 0, 0, 1, 1, 1,
0.7943668, 0.02354041, 2.493468, 1, 0, 0, 1, 1,
0.806493, -0.5501961, 1.947975, 1, 0, 0, 1, 1,
0.8131323, -1.155235, 1.625294, 1, 0, 0, 1, 1,
0.8189135, -1.660544, 2.38964, 1, 0, 0, 1, 1,
0.8190969, -0.7776866, 2.585176, 1, 0, 0, 1, 1,
0.8207391, -0.1732577, 2.068101, 0, 0, 0, 1, 1,
0.8215454, -0.2385262, 1.14996, 0, 0, 0, 1, 1,
0.8218167, -0.459282, 3.067795, 0, 0, 0, 1, 1,
0.8227608, -1.401966, 2.892235, 0, 0, 0, 1, 1,
0.8232852, 1.506534, 0.2283799, 0, 0, 0, 1, 1,
0.8251802, -0.2858247, 1.177172, 0, 0, 0, 1, 1,
0.8268517, 1.025938, 1.132056, 0, 0, 0, 1, 1,
0.8355376, 0.9663109, 0.5519643, 1, 1, 1, 1, 1,
0.8362246, -1.80468, 2.468246, 1, 1, 1, 1, 1,
0.8403543, 1.70358, 1.290172, 1, 1, 1, 1, 1,
0.8499408, -2.517058, 5.188969, 1, 1, 1, 1, 1,
0.8503608, -0.3879783, 3.124433, 1, 1, 1, 1, 1,
0.8549923, -0.231598, 2.761565, 1, 1, 1, 1, 1,
0.8595015, -1.735129, 1.767935, 1, 1, 1, 1, 1,
0.8605186, 1.607806, 0.2415944, 1, 1, 1, 1, 1,
0.8617893, -1.263466, 3.587938, 1, 1, 1, 1, 1,
0.8640833, -0.3767383, 0.9828622, 1, 1, 1, 1, 1,
0.8687441, 0.7316753, -0.2122238, 1, 1, 1, 1, 1,
0.8719834, -0.3604247, 0.5237547, 1, 1, 1, 1, 1,
0.8720154, -0.5989389, 1.640456, 1, 1, 1, 1, 1,
0.8788586, 0.4408036, 1.09756, 1, 1, 1, 1, 1,
0.8841626, -0.4535831, 2.368663, 1, 1, 1, 1, 1,
0.8874573, -0.03915658, 2.364757, 0, 0, 1, 1, 1,
0.8881174, 1.275705, 2.311331, 1, 0, 0, 1, 1,
0.8924803, -1.240874, 3.56459, 1, 0, 0, 1, 1,
0.8930318, -0.5579756, 2.984998, 1, 0, 0, 1, 1,
0.898745, -1.079134, 0.711888, 1, 0, 0, 1, 1,
0.9029394, -1.740115, 1.090379, 1, 0, 0, 1, 1,
0.903338, -0.3414745, 1.558219, 0, 0, 0, 1, 1,
0.9036086, -0.08248782, 2.909809, 0, 0, 0, 1, 1,
0.9063927, -0.4136818, 1.755491, 0, 0, 0, 1, 1,
0.9088063, -0.8302845, 4.976641, 0, 0, 0, 1, 1,
0.9105258, 1.2255, 1.333185, 0, 0, 0, 1, 1,
0.9153856, 0.0854553, 2.978824, 0, 0, 0, 1, 1,
0.9168978, 2.801878, 0.1745503, 0, 0, 0, 1, 1,
0.9208788, -0.7331915, 1.830685, 1, 1, 1, 1, 1,
0.9212211, -0.3475685, 2.684872, 1, 1, 1, 1, 1,
0.9217182, 0.6809193, 0.1122409, 1, 1, 1, 1, 1,
0.9254645, -0.4180823, 2.969161, 1, 1, 1, 1, 1,
0.9305319, -0.1907204, 2.293717, 1, 1, 1, 1, 1,
0.9328102, 0.2754045, 1.0358, 1, 1, 1, 1, 1,
0.9348479, -2.53531, 3.086412, 1, 1, 1, 1, 1,
0.9361747, -0.5517002, 2.14517, 1, 1, 1, 1, 1,
0.9485972, 1.784946, 1.096839, 1, 1, 1, 1, 1,
0.9537453, -2.022007, 3.813733, 1, 1, 1, 1, 1,
0.9591153, 0.2474738, -0.1612934, 1, 1, 1, 1, 1,
0.9644976, -0.5096409, 1.076662, 1, 1, 1, 1, 1,
0.9648211, 0.7831227, 3.033821, 1, 1, 1, 1, 1,
0.9664231, -1.100874, 4.252786, 1, 1, 1, 1, 1,
0.9679531, 0.6010347, -0.04701368, 1, 1, 1, 1, 1,
0.9684208, 0.7545367, 2.08529, 0, 0, 1, 1, 1,
0.9698399, 0.130589, 0.9365311, 1, 0, 0, 1, 1,
0.9834343, -0.5648215, 2.526114, 1, 0, 0, 1, 1,
0.990754, 1.275957, 1.180236, 1, 0, 0, 1, 1,
0.9976114, -1.75897, 3.277909, 1, 0, 0, 1, 1,
1.001572, 0.02936705, 0.9271926, 1, 0, 0, 1, 1,
1.005085, -1.244612, 3.430649, 0, 0, 0, 1, 1,
1.007794, 0.7154813, 0.5336912, 0, 0, 0, 1, 1,
1.014606, -1.394353, 0.1326767, 0, 0, 0, 1, 1,
1.021293, 0.09079175, 0.7655485, 0, 0, 0, 1, 1,
1.021923, 0.03610186, 1.605135, 0, 0, 0, 1, 1,
1.030296, -1.859217, 3.667818, 0, 0, 0, 1, 1,
1.031935, 0.4862903, 1.304471, 0, 0, 0, 1, 1,
1.03451, -1.561082, 3.395817, 1, 1, 1, 1, 1,
1.036526, -0.7299674, 2.143549, 1, 1, 1, 1, 1,
1.036825, -0.5622999, 3.055517, 1, 1, 1, 1, 1,
1.050956, -0.2979278, 0.8129796, 1, 1, 1, 1, 1,
1.051615, 0.03905236, 1.48147, 1, 1, 1, 1, 1,
1.05615, 0.4465089, -0.3632847, 1, 1, 1, 1, 1,
1.065694, 0.4266858, 1.033955, 1, 1, 1, 1, 1,
1.077942, 0.3374743, 2.206936, 1, 1, 1, 1, 1,
1.08047, -0.7001007, 2.649482, 1, 1, 1, 1, 1,
1.081705, 1.543838, 0.1664126, 1, 1, 1, 1, 1,
1.082043, -1.065747, 3.662233, 1, 1, 1, 1, 1,
1.083927, -1.10878, 1.194143, 1, 1, 1, 1, 1,
1.094567, 1.024569, 0.006177482, 1, 1, 1, 1, 1,
1.095615, -1.851963, 3.437476, 1, 1, 1, 1, 1,
1.096064, 0.5057805, 0.7861279, 1, 1, 1, 1, 1,
1.097996, 0.912237, 0.8468139, 0, 0, 1, 1, 1,
1.10181, -0.5368286, 4.698201, 1, 0, 0, 1, 1,
1.112715, 2.51952, -0.7342833, 1, 0, 0, 1, 1,
1.114597, 0.2620335, 1.160321, 1, 0, 0, 1, 1,
1.114629, 0.6252086, 0.5710645, 1, 0, 0, 1, 1,
1.118212, 0.8009685, -0.174676, 1, 0, 0, 1, 1,
1.119315, 1.54692, 0.1012879, 0, 0, 0, 1, 1,
1.129921, 1.36451, -0.04614224, 0, 0, 0, 1, 1,
1.131444, -1.08482, 2.561764, 0, 0, 0, 1, 1,
1.137678, -1.491526, 2.35227, 0, 0, 0, 1, 1,
1.142792, 0.2152515, 2.562897, 0, 0, 0, 1, 1,
1.143907, 0.3029889, 3.128998, 0, 0, 0, 1, 1,
1.14891, 0.03789177, 1.573489, 0, 0, 0, 1, 1,
1.149116, 1.5276, 2.099615, 1, 1, 1, 1, 1,
1.153628, -0.3870056, 1.359615, 1, 1, 1, 1, 1,
1.153887, 1.691804, -0.9708007, 1, 1, 1, 1, 1,
1.155943, -0.4077781, 2.997336, 1, 1, 1, 1, 1,
1.163794, -0.8380368, 1.864833, 1, 1, 1, 1, 1,
1.170905, -0.6441234, 1.139779, 1, 1, 1, 1, 1,
1.182519, -0.01082571, 0.3063573, 1, 1, 1, 1, 1,
1.186492, -1.074393, 3.197331, 1, 1, 1, 1, 1,
1.192296, 1.31156, 0.9470302, 1, 1, 1, 1, 1,
1.200991, 1.498899, -0.7094544, 1, 1, 1, 1, 1,
1.21178, -0.6866778, 1.971889, 1, 1, 1, 1, 1,
1.221306, 0.1409202, 2.670514, 1, 1, 1, 1, 1,
1.223473, 0.0939671, 2.158651, 1, 1, 1, 1, 1,
1.224145, 0.2580816, 1.510959, 1, 1, 1, 1, 1,
1.246315, 1.044455, 2.037292, 1, 1, 1, 1, 1,
1.248961, -1.686813, 4.192554, 0, 0, 1, 1, 1,
1.253865, 1.177662, 0.8948299, 1, 0, 0, 1, 1,
1.254104, -0.2852419, 3.449458, 1, 0, 0, 1, 1,
1.261997, 1.27156, -1.147247, 1, 0, 0, 1, 1,
1.265818, -0.8680672, 2.596756, 1, 0, 0, 1, 1,
1.26705, 0.7520745, 1.252076, 1, 0, 0, 1, 1,
1.26725, 0.7137318, 0.9593213, 0, 0, 0, 1, 1,
1.27264, 0.7936877, 0.5020338, 0, 0, 0, 1, 1,
1.276283, -0.0951769, 1.860904, 0, 0, 0, 1, 1,
1.277083, 0.8537518, 1.900799, 0, 0, 0, 1, 1,
1.283151, 1.353558, 2.855547, 0, 0, 0, 1, 1,
1.28386, -2.042442, 2.235929, 0, 0, 0, 1, 1,
1.285748, -0.6081793, 3.364112, 0, 0, 0, 1, 1,
1.301547, -1.2466, 4.008101, 1, 1, 1, 1, 1,
1.310669, -0.1282758, 1.779937, 1, 1, 1, 1, 1,
1.313978, -0.1820231, 2.447891, 1, 1, 1, 1, 1,
1.320262, -0.2557631, 1.31642, 1, 1, 1, 1, 1,
1.33594, 0.3059627, 0.9370421, 1, 1, 1, 1, 1,
1.341615, 0.002365628, 2.495107, 1, 1, 1, 1, 1,
1.341959, 1.919614, 0.4848914, 1, 1, 1, 1, 1,
1.354487, -0.1801105, 0.9988304, 1, 1, 1, 1, 1,
1.357232, -0.5964832, 2.654462, 1, 1, 1, 1, 1,
1.366483, -1.635152, 2.996877, 1, 1, 1, 1, 1,
1.368184, 0.01306628, 2.264432, 1, 1, 1, 1, 1,
1.373455, -0.7432743, 2.606341, 1, 1, 1, 1, 1,
1.373593, -0.467845, 2.575779, 1, 1, 1, 1, 1,
1.380011, -0.253606, 1.735338, 1, 1, 1, 1, 1,
1.39355, 0.6405256, -0.4444979, 1, 1, 1, 1, 1,
1.397376, -0.6584044, 1.33469, 0, 0, 1, 1, 1,
1.407474, -1.873755, 2.394605, 1, 0, 0, 1, 1,
1.410891, -0.9413497, 3.222101, 1, 0, 0, 1, 1,
1.419277, -0.9403713, 2.500725, 1, 0, 0, 1, 1,
1.429492, -1.040741, 2.943465, 1, 0, 0, 1, 1,
1.434026, 2.018559, 0.5625606, 1, 0, 0, 1, 1,
1.434635, 0.5212328, 0.3740802, 0, 0, 0, 1, 1,
1.437448, -1.318875, 0.7121217, 0, 0, 0, 1, 1,
1.446027, -0.1428094, 0.6278383, 0, 0, 0, 1, 1,
1.452813, -0.4346789, 2.994503, 0, 0, 0, 1, 1,
1.455624, -1.004527, 0.5587114, 0, 0, 0, 1, 1,
1.468679, -1.039504, 3.322641, 0, 0, 0, 1, 1,
1.471903, -0.587667, 1.796616, 0, 0, 0, 1, 1,
1.485953, 0.4210731, 1.917019, 1, 1, 1, 1, 1,
1.503566, 0.5128264, 0.520267, 1, 1, 1, 1, 1,
1.503824, 1.209256, -0.6688375, 1, 1, 1, 1, 1,
1.526843, 0.4745401, 2.752221, 1, 1, 1, 1, 1,
1.527661, -0.1576606, 2.010906, 1, 1, 1, 1, 1,
1.53359, 0.9798973, 0.8029129, 1, 1, 1, 1, 1,
1.547696, -0.8631034, 3.24178, 1, 1, 1, 1, 1,
1.555608, 0.6407834, 1.275224, 1, 1, 1, 1, 1,
1.556149, 0.6169788, 1.256465, 1, 1, 1, 1, 1,
1.574793, -1.648572, 1.208454, 1, 1, 1, 1, 1,
1.576056, -0.5607914, 2.365205, 1, 1, 1, 1, 1,
1.576336, 0.22942, 1.336788, 1, 1, 1, 1, 1,
1.578483, -0.728128, 0.1786031, 1, 1, 1, 1, 1,
1.582241, 0.2499416, 2.200311, 1, 1, 1, 1, 1,
1.597962, 0.08121546, 2.78572, 1, 1, 1, 1, 1,
1.60328, -1.05643, 1.078339, 0, 0, 1, 1, 1,
1.609948, 0.7633492, 1.00685, 1, 0, 0, 1, 1,
1.617044, -1.608554, 3.147011, 1, 0, 0, 1, 1,
1.619598, 0.04530862, 1.988216, 1, 0, 0, 1, 1,
1.624204, -0.7474829, 3.029524, 1, 0, 0, 1, 1,
1.624516, 0.7272852, 1.720253, 1, 0, 0, 1, 1,
1.668034, 0.2493547, 1.496286, 0, 0, 0, 1, 1,
1.670338, -0.1240509, 1.725013, 0, 0, 0, 1, 1,
1.682573, 1.216633, 0.2078169, 0, 0, 0, 1, 1,
1.700499, -0.8794226, 1.219002, 0, 0, 0, 1, 1,
1.704001, -0.3970731, 1.993695, 0, 0, 0, 1, 1,
1.705265, -0.3175011, 1.431623, 0, 0, 0, 1, 1,
1.7119, 0.08909611, 2.615986, 0, 0, 0, 1, 1,
1.717178, -1.083373, 2.59228, 1, 1, 1, 1, 1,
1.751326, 0.5215856, 0.9070909, 1, 1, 1, 1, 1,
1.799497, 0.2476263, 0.8636333, 1, 1, 1, 1, 1,
1.800079, -0.8959988, 3.217383, 1, 1, 1, 1, 1,
1.801849, 1.189269, -0.5074178, 1, 1, 1, 1, 1,
1.832478, 1.828053, 0.5673725, 1, 1, 1, 1, 1,
1.834954, 1.56076, 1.070944, 1, 1, 1, 1, 1,
1.857718, 0.1583673, -0.245311, 1, 1, 1, 1, 1,
1.871628, -0.04540094, 0.961, 1, 1, 1, 1, 1,
1.873164, -0.3405107, 1.548651, 1, 1, 1, 1, 1,
1.91829, 0.9918547, 1.514268, 1, 1, 1, 1, 1,
1.919624, 0.5720999, 0.4560109, 1, 1, 1, 1, 1,
1.951424, 0.3741526, 1.4729, 1, 1, 1, 1, 1,
1.970754, 1.864165, 1.423282, 1, 1, 1, 1, 1,
1.996042, -0.3692463, 1.230898, 1, 1, 1, 1, 1,
2.009629, -2.042916, 4.373322, 0, 0, 1, 1, 1,
2.018494, 1.363724, 0.4382966, 1, 0, 0, 1, 1,
2.02375, 0.5439689, 1.720384, 1, 0, 0, 1, 1,
2.038981, -0.3459038, 1.209205, 1, 0, 0, 1, 1,
2.041599, -0.6369429, 0.3489023, 1, 0, 0, 1, 1,
2.088402, 0.5717095, 2.27871, 1, 0, 0, 1, 1,
2.098481, 0.5597709, 2.824785, 0, 0, 0, 1, 1,
2.100613, 1.620298, 0.8837098, 0, 0, 0, 1, 1,
2.137955, 0.2872233, 2.075985, 0, 0, 0, 1, 1,
2.268032, 1.576846, 1.478254, 0, 0, 0, 1, 1,
2.275458, -0.7706058, 2.37483, 0, 0, 0, 1, 1,
2.39256, 1.19263, -0.3479525, 0, 0, 0, 1, 1,
2.412858, 0.1066076, 2.819936, 0, 0, 0, 1, 1,
2.430496, -0.4726596, 1.720669, 1, 1, 1, 1, 1,
2.484573, 0.9993993, 1.268013, 1, 1, 1, 1, 1,
2.500026, -1.181653, 0.4239554, 1, 1, 1, 1, 1,
2.503592, 0.1884481, 2.912657, 1, 1, 1, 1, 1,
2.831182, -0.7526867, 4.030254, 1, 1, 1, 1, 1,
2.922228, -1.548415, 1.983411, 1, 1, 1, 1, 1,
2.925767, -0.3553503, 1.041879, 1, 1, 1, 1, 1
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
var radius = 9.526689;
var distance = 33.46209;
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
mvMatrix.translate( 0.2688091, 0.1861625, -0.03643107 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.46209);
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
