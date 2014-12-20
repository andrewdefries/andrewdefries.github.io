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
-2.746807, -0.0993766, -0.6577508, 1, 0, 0, 1,
-2.584346, -0.5463874, -1.860206, 1, 0.007843138, 0, 1,
-2.499284, 1.504392, -1.870486, 1, 0.01176471, 0, 1,
-2.426794, -0.5223656, -0.6239518, 1, 0.01960784, 0, 1,
-2.395911, 0.3764398, 0.2739452, 1, 0.02352941, 0, 1,
-2.371077, 0.2303565, -1.644142, 1, 0.03137255, 0, 1,
-2.325539, -0.3756725, -3.064372, 1, 0.03529412, 0, 1,
-2.316256, 0.2135525, -0.8749211, 1, 0.04313726, 0, 1,
-2.286748, -0.828586, -2.655349, 1, 0.04705882, 0, 1,
-2.279858, -1.489545, -1.568377, 1, 0.05490196, 0, 1,
-2.266, -1.622136, -1.861314, 1, 0.05882353, 0, 1,
-2.259661, -1.086575, -1.326711, 1, 0.06666667, 0, 1,
-2.25248, 0.8738608, -1.531471, 1, 0.07058824, 0, 1,
-2.247544, -0.06361564, -1.566329, 1, 0.07843138, 0, 1,
-2.223853, -0.5847552, -3.380283, 1, 0.08235294, 0, 1,
-2.22189, -0.07609002, 0.01622971, 1, 0.09019608, 0, 1,
-2.196722, 0.1287784, 0.1790891, 1, 0.09411765, 0, 1,
-2.096996, -1.110507, -3.847246, 1, 0.1019608, 0, 1,
-2.094341, -1.264206, -3.294738, 1, 0.1098039, 0, 1,
-2.035678, 0.4744711, -1.188981, 1, 0.1137255, 0, 1,
-2.023731, -0.1290469, -0.1617958, 1, 0.1215686, 0, 1,
-2.016744, 0.1242452, -1.001352, 1, 0.1254902, 0, 1,
-2.003848, -2.282195, -5.072012, 1, 0.1333333, 0, 1,
-1.997781, 0.8554347, 0.3323478, 1, 0.1372549, 0, 1,
-1.990911, -0.7800753, -3.777617, 1, 0.145098, 0, 1,
-1.981412, 1.013797, -0.8500643, 1, 0.1490196, 0, 1,
-1.975356, 0.08691296, -0.6297069, 1, 0.1568628, 0, 1,
-1.945747, 0.6790721, -0.6495644, 1, 0.1607843, 0, 1,
-1.942141, -0.6171195, -1.983512, 1, 0.1686275, 0, 1,
-1.941088, -0.5080835, -0.8357046, 1, 0.172549, 0, 1,
-1.939494, -1.242028, -2.486736, 1, 0.1803922, 0, 1,
-1.93186, -0.005756515, -1.202487, 1, 0.1843137, 0, 1,
-1.916325, 0.8643364, -0.1651481, 1, 0.1921569, 0, 1,
-1.908441, 0.08580456, -2.968609, 1, 0.1960784, 0, 1,
-1.889176, -0.3794521, -2.763678, 1, 0.2039216, 0, 1,
-1.8849, -0.8845649, -0.7082513, 1, 0.2117647, 0, 1,
-1.879871, 1.438389, -1.41188, 1, 0.2156863, 0, 1,
-1.872788, -1.553612, -2.278711, 1, 0.2235294, 0, 1,
-1.844965, -0.9210313, -3.479834, 1, 0.227451, 0, 1,
-1.838587, -0.01883574, -2.291604, 1, 0.2352941, 0, 1,
-1.831071, 0.1677991, -1.963491, 1, 0.2392157, 0, 1,
-1.825071, 0.06578226, -0.8242202, 1, 0.2470588, 0, 1,
-1.824861, -0.0412611, -1.607099, 1, 0.2509804, 0, 1,
-1.818905, -1.331401, -1.86927, 1, 0.2588235, 0, 1,
-1.801212, 0.9424468, -2.289539, 1, 0.2627451, 0, 1,
-1.786567, -0.4998649, -3.066527, 1, 0.2705882, 0, 1,
-1.774531, 0.4945723, -1.130622, 1, 0.2745098, 0, 1,
-1.766601, -0.3736488, -0.8655726, 1, 0.282353, 0, 1,
-1.76349, 1.39812, -2.520709, 1, 0.2862745, 0, 1,
-1.729612, 0.5857188, -2.311984, 1, 0.2941177, 0, 1,
-1.723695, -0.4851544, -0.8176446, 1, 0.3019608, 0, 1,
-1.698575, -0.6102105, -1.49484, 1, 0.3058824, 0, 1,
-1.692869, -0.6146722, -0.4208108, 1, 0.3137255, 0, 1,
-1.681245, 0.4425106, -2.62299, 1, 0.3176471, 0, 1,
-1.678538, -0.5469001, -3.701564, 1, 0.3254902, 0, 1,
-1.675303, -0.3000504, 0.46705, 1, 0.3294118, 0, 1,
-1.670041, -0.02755054, 1.013695, 1, 0.3372549, 0, 1,
-1.666105, -0.1962182, -0.7857129, 1, 0.3411765, 0, 1,
-1.655185, -1.198335, -1.214584, 1, 0.3490196, 0, 1,
-1.651649, -1.959346, -1.751347, 1, 0.3529412, 0, 1,
-1.651073, 1.852146, -1.440652, 1, 0.3607843, 0, 1,
-1.636736, 0.7603732, 0.4568138, 1, 0.3647059, 0, 1,
-1.636636, -1.292477, -2.655757, 1, 0.372549, 0, 1,
-1.632901, -1.491358, -2.6913, 1, 0.3764706, 0, 1,
-1.630168, -1.406781, -0.4096241, 1, 0.3843137, 0, 1,
-1.618116, -1.980639, -3.229964, 1, 0.3882353, 0, 1,
-1.608037, 1.328214, -1.170778, 1, 0.3960784, 0, 1,
-1.599879, -0.4480311, -0.7294455, 1, 0.4039216, 0, 1,
-1.588966, 0.8350561, -2.310966, 1, 0.4078431, 0, 1,
-1.575073, 0.4177904, -2.120621, 1, 0.4156863, 0, 1,
-1.565303, 0.03828444, -1.812056, 1, 0.4196078, 0, 1,
-1.559909, -0.5379069, -3.257311, 1, 0.427451, 0, 1,
-1.546415, 0.8317119, -2.46748, 1, 0.4313726, 0, 1,
-1.538172, -0.2471197, -0.6839759, 1, 0.4392157, 0, 1,
-1.537175, -0.5222694, -0.428569, 1, 0.4431373, 0, 1,
-1.529574, -1.809935, -3.301366, 1, 0.4509804, 0, 1,
-1.52375, -1.056264, -1.800481, 1, 0.454902, 0, 1,
-1.522451, -0.7772492, -3.177657, 1, 0.4627451, 0, 1,
-1.518785, -0.3466123, -1.684409, 1, 0.4666667, 0, 1,
-1.518307, 1.16859, -0.9193106, 1, 0.4745098, 0, 1,
-1.49756, -1.166857, -3.784561, 1, 0.4784314, 0, 1,
-1.492286, -0.7306805, -1.593237, 1, 0.4862745, 0, 1,
-1.486155, 1.229876, -1.108023, 1, 0.4901961, 0, 1,
-1.471651, 0.7753279, 0.5182192, 1, 0.4980392, 0, 1,
-1.43645, 1.057346, -2.520855, 1, 0.5058824, 0, 1,
-1.435923, -0.4885449, -1.20621, 1, 0.509804, 0, 1,
-1.431699, 0.5719864, -1.25404, 1, 0.5176471, 0, 1,
-1.430707, 0.09562719, -2.010026, 1, 0.5215687, 0, 1,
-1.427059, 0.3899545, 0.2762489, 1, 0.5294118, 0, 1,
-1.424122, 0.6751801, -0.804429, 1, 0.5333334, 0, 1,
-1.42077, 0.1002033, -1.777852, 1, 0.5411765, 0, 1,
-1.416021, -1.312794, -3.004213, 1, 0.5450981, 0, 1,
-1.412108, 0.1595884, -1.30173, 1, 0.5529412, 0, 1,
-1.39972, 0.7709728, -1.354711, 1, 0.5568628, 0, 1,
-1.394437, 0.6166502, -0.45537, 1, 0.5647059, 0, 1,
-1.390195, -0.5594746, -1.265812, 1, 0.5686275, 0, 1,
-1.384508, -0.11525, -2.645579, 1, 0.5764706, 0, 1,
-1.381878, 0.279555, -0.5074724, 1, 0.5803922, 0, 1,
-1.381382, -1.926276, -3.021948, 1, 0.5882353, 0, 1,
-1.370424, 0.3093722, -1.890928, 1, 0.5921569, 0, 1,
-1.368196, -2.656348, -1.463097, 1, 0.6, 0, 1,
-1.365579, -1.960719, -3.006616, 1, 0.6078432, 0, 1,
-1.360486, -2.199857, -1.472999, 1, 0.6117647, 0, 1,
-1.344761, -0.401083, -2.37299, 1, 0.6196079, 0, 1,
-1.343294, -0.06306388, -1.531764, 1, 0.6235294, 0, 1,
-1.328079, 0.33743, -2.058406, 1, 0.6313726, 0, 1,
-1.314822, 1.178518, -0.8000119, 1, 0.6352941, 0, 1,
-1.30821, -0.6705749, -2.558825, 1, 0.6431373, 0, 1,
-1.307924, -0.5066925, -2.532874, 1, 0.6470588, 0, 1,
-1.307787, -0.3964809, -1.321169, 1, 0.654902, 0, 1,
-1.291723, -0.4779927, -1.802551, 1, 0.6588235, 0, 1,
-1.271276, 0.519155, -0.7627977, 1, 0.6666667, 0, 1,
-1.268379, -1.224482, -0.8287663, 1, 0.6705883, 0, 1,
-1.267943, 0.3520222, 0.4568021, 1, 0.6784314, 0, 1,
-1.262349, 0.9658888, -1.851557, 1, 0.682353, 0, 1,
-1.248443, -1.04353, -3.609717, 1, 0.6901961, 0, 1,
-1.242185, -0.05167153, -1.096182, 1, 0.6941177, 0, 1,
-1.237348, 1.375822, -0.4341118, 1, 0.7019608, 0, 1,
-1.223524, 0.4888994, -2.554796, 1, 0.7098039, 0, 1,
-1.214507, 0.7344452, 0.4730765, 1, 0.7137255, 0, 1,
-1.21436, -0.3752024, -2.593662, 1, 0.7215686, 0, 1,
-1.211324, -1.060377, -2.55559, 1, 0.7254902, 0, 1,
-1.209548, -0.5044113, -2.286062, 1, 0.7333333, 0, 1,
-1.188542, -0.184238, -1.351143, 1, 0.7372549, 0, 1,
-1.162442, 1.24305, -1.682133, 1, 0.7450981, 0, 1,
-1.150563, -0.9201942, -3.083065, 1, 0.7490196, 0, 1,
-1.149395, 0.3108885, -0.6186656, 1, 0.7568628, 0, 1,
-1.143056, -1.561521, -3.027419, 1, 0.7607843, 0, 1,
-1.138104, 0.9365022, -2.616516, 1, 0.7686275, 0, 1,
-1.13511, 1.302729, -3.068381, 1, 0.772549, 0, 1,
-1.130567, 0.04743284, -1.341724, 1, 0.7803922, 0, 1,
-1.128461, -0.3563606, -2.072281, 1, 0.7843137, 0, 1,
-1.127403, 0.2871742, 0.01282188, 1, 0.7921569, 0, 1,
-1.124053, -1.072583, -2.209452, 1, 0.7960784, 0, 1,
-1.1185, -0.01857062, -2.128838, 1, 0.8039216, 0, 1,
-1.117593, -0.6267233, -1.715684, 1, 0.8117647, 0, 1,
-1.110467, -1.522147, -3.526999, 1, 0.8156863, 0, 1,
-1.108411, -0.4955935, -2.51792, 1, 0.8235294, 0, 1,
-1.102207, -0.1672717, -2.919879, 1, 0.827451, 0, 1,
-1.099153, 0.4165469, -2.130517, 1, 0.8352941, 0, 1,
-1.096096, -0.4688017, -2.613234, 1, 0.8392157, 0, 1,
-1.088549, 1.596066, 0.2696872, 1, 0.8470588, 0, 1,
-1.076085, 0.04403703, -3.038147, 1, 0.8509804, 0, 1,
-1.075541, -0.4927101, -0.7877653, 1, 0.8588235, 0, 1,
-1.065313, 1.28862, -0.06112317, 1, 0.8627451, 0, 1,
-1.064498, 2.245248, -1.248268, 1, 0.8705882, 0, 1,
-1.064476, -1.590762, -3.037953, 1, 0.8745098, 0, 1,
-1.06225, -0.1250631, -0.4460964, 1, 0.8823529, 0, 1,
-1.05612, 0.4030757, -1.652431, 1, 0.8862745, 0, 1,
-1.051102, 0.2781505, -1.477549, 1, 0.8941177, 0, 1,
-1.048013, -0.9324328, -2.028575, 1, 0.8980392, 0, 1,
-1.047524, 0.34384, -3.645883, 1, 0.9058824, 0, 1,
-1.04618, -0.241184, -0.6716233, 1, 0.9137255, 0, 1,
-1.029033, -0.6065293, -2.046744, 1, 0.9176471, 0, 1,
-1.020507, 0.9143572, 0.9616067, 1, 0.9254902, 0, 1,
-1.012173, 1.339346, -0.5582955, 1, 0.9294118, 0, 1,
-1.011674, 0.671846, 0.3924214, 1, 0.9372549, 0, 1,
-1.007174, 1.252273, -2.301218, 1, 0.9411765, 0, 1,
-1.007065, -0.7062681, -4.536778, 1, 0.9490196, 0, 1,
-1.005976, 1.371759, -0.1818834, 1, 0.9529412, 0, 1,
-0.9911944, 0.5998371, -0.6848492, 1, 0.9607843, 0, 1,
-0.9835904, -1.752642, -2.81741, 1, 0.9647059, 0, 1,
-0.9808663, -1.503734, -1.794732, 1, 0.972549, 0, 1,
-0.9802483, 0.1247031, -0.4964554, 1, 0.9764706, 0, 1,
-0.9796866, -0.2656627, -1.514447, 1, 0.9843137, 0, 1,
-0.9757, -0.2553954, -1.385964, 1, 0.9882353, 0, 1,
-0.9717719, -1.474688, -3.320435, 1, 0.9960784, 0, 1,
-0.9700814, 0.2473172, -2.123525, 0.9960784, 1, 0, 1,
-0.9642696, -0.3060284, 0.3310769, 0.9921569, 1, 0, 1,
-0.9618225, 0.4727824, -2.5123, 0.9843137, 1, 0, 1,
-0.9566036, 1.18045, -0.3317878, 0.9803922, 1, 0, 1,
-0.9542205, 0.04479374, -2.40078, 0.972549, 1, 0, 1,
-0.95096, 0.6330429, 0.6564724, 0.9686275, 1, 0, 1,
-0.9504297, 1.200343, -0.4682497, 0.9607843, 1, 0, 1,
-0.9384038, 1.211568, -0.2137239, 0.9568627, 1, 0, 1,
-0.9310753, 0.1572141, -2.125457, 0.9490196, 1, 0, 1,
-0.9304166, -2.195181, -3.323164, 0.945098, 1, 0, 1,
-0.9149654, 0.05957732, -2.854302, 0.9372549, 1, 0, 1,
-0.9122187, -1.135995, -1.807822, 0.9333333, 1, 0, 1,
-0.9094597, 1.199331, 1.366958, 0.9254902, 1, 0, 1,
-0.9021576, -0.2727598, -1.429581, 0.9215686, 1, 0, 1,
-0.8978351, 0.8630813, -1.475627, 0.9137255, 1, 0, 1,
-0.8973327, -0.3890074, -2.704805, 0.9098039, 1, 0, 1,
-0.8954732, 0.5786797, -0.6348621, 0.9019608, 1, 0, 1,
-0.8878385, 0.280506, -2.990806, 0.8941177, 1, 0, 1,
-0.8875971, 0.6893356, 0.05771877, 0.8901961, 1, 0, 1,
-0.8803236, 0.03910881, -1.033816, 0.8823529, 1, 0, 1,
-0.8779231, -1.264751, -2.699299, 0.8784314, 1, 0, 1,
-0.8754052, -0.2551701, -2.931347, 0.8705882, 1, 0, 1,
-0.874923, -0.3621011, -1.870765, 0.8666667, 1, 0, 1,
-0.8733948, 1.343972, -0.9958715, 0.8588235, 1, 0, 1,
-0.8730717, -0.7261182, -2.134175, 0.854902, 1, 0, 1,
-0.871659, -0.3424065, -1.066917, 0.8470588, 1, 0, 1,
-0.8703005, 1.650647, -0.6068994, 0.8431373, 1, 0, 1,
-0.8697317, 0.05610033, -2.082884, 0.8352941, 1, 0, 1,
-0.8683412, -0.3915138, -2.646557, 0.8313726, 1, 0, 1,
-0.8681306, 1.626182, -1.787416, 0.8235294, 1, 0, 1,
-0.8630517, 0.2077169, -1.924826, 0.8196079, 1, 0, 1,
-0.8629091, -1.299903, -2.098814, 0.8117647, 1, 0, 1,
-0.8550414, 0.2609893, -0.3572649, 0.8078431, 1, 0, 1,
-0.8464864, 0.3643118, -2.380463, 0.8, 1, 0, 1,
-0.8437606, -0.7860054, -3.063653, 0.7921569, 1, 0, 1,
-0.8396287, 0.089946, -1.18647, 0.7882353, 1, 0, 1,
-0.8389758, 0.6559536, 0.5252296, 0.7803922, 1, 0, 1,
-0.8387559, -0.6296791, -2.303413, 0.7764706, 1, 0, 1,
-0.8347237, 0.1895861, -1.449644, 0.7686275, 1, 0, 1,
-0.8336287, -1.2027, -2.06869, 0.7647059, 1, 0, 1,
-0.8304942, -0.5656735, -2.476249, 0.7568628, 1, 0, 1,
-0.8304916, -1.003726, -4.150219, 0.7529412, 1, 0, 1,
-0.828851, -0.9607963, -2.788585, 0.7450981, 1, 0, 1,
-0.8275998, -0.3628987, -1.980445, 0.7411765, 1, 0, 1,
-0.8238893, -1.48445, -2.616044, 0.7333333, 1, 0, 1,
-0.812219, -0.07242297, -0.8452134, 0.7294118, 1, 0, 1,
-0.7980904, 2.252073, 2.220033, 0.7215686, 1, 0, 1,
-0.7834779, 0.5869833, -1.166697, 0.7176471, 1, 0, 1,
-0.7680647, 0.3119903, 1.084754, 0.7098039, 1, 0, 1,
-0.7627453, 0.06141584, -3.157969, 0.7058824, 1, 0, 1,
-0.7549496, 0.6043155, -0.1581642, 0.6980392, 1, 0, 1,
-0.7537976, -0.2121414, -1.699475, 0.6901961, 1, 0, 1,
-0.7518722, 0.5023138, -0.7289378, 0.6862745, 1, 0, 1,
-0.75093, 0.2673424, -1.913863, 0.6784314, 1, 0, 1,
-0.7495704, 0.6050066, -1.8553, 0.6745098, 1, 0, 1,
-0.7454009, 0.4057694, -1.488934, 0.6666667, 1, 0, 1,
-0.7451003, -0.5201086, -3.345854, 0.6627451, 1, 0, 1,
-0.7402334, 0.03586808, -1.398063, 0.654902, 1, 0, 1,
-0.7393323, -0.413059, -1.173835, 0.6509804, 1, 0, 1,
-0.7328095, 0.5301393, -1.65384, 0.6431373, 1, 0, 1,
-0.7293273, -0.4817385, -1.283671, 0.6392157, 1, 0, 1,
-0.7280914, 0.03760741, -2.561316, 0.6313726, 1, 0, 1,
-0.7239369, 0.06708837, 0.7607881, 0.627451, 1, 0, 1,
-0.7201417, -0.3257179, -3.664974, 0.6196079, 1, 0, 1,
-0.7169931, -1.513761, -1.309599, 0.6156863, 1, 0, 1,
-0.7144874, 0.5197741, -0.3320962, 0.6078432, 1, 0, 1,
-0.713374, -0.6884583, -3.148311, 0.6039216, 1, 0, 1,
-0.7129235, 0.01569324, -1.709488, 0.5960785, 1, 0, 1,
-0.7045694, 0.3333731, -0.09267469, 0.5882353, 1, 0, 1,
-0.7019079, -0.9901926, -2.722125, 0.5843138, 1, 0, 1,
-0.6995928, -1.458503, -4.003113, 0.5764706, 1, 0, 1,
-0.6933851, 0.0182712, -2.287124, 0.572549, 1, 0, 1,
-0.6923228, 2.272739, 0.7152631, 0.5647059, 1, 0, 1,
-0.681453, 0.9055, -0.3233024, 0.5607843, 1, 0, 1,
-0.6792077, -0.04521547, -2.809524, 0.5529412, 1, 0, 1,
-0.6782792, 0.5663328, -1.045376, 0.5490196, 1, 0, 1,
-0.6772031, -0.2491962, -1.510453, 0.5411765, 1, 0, 1,
-0.6760986, 0.9449229, -0.6783036, 0.5372549, 1, 0, 1,
-0.6657671, 0.3116578, -1.297998, 0.5294118, 1, 0, 1,
-0.6619226, -0.4280295, -2.064543, 0.5254902, 1, 0, 1,
-0.6574059, 1.461578, -2.399482, 0.5176471, 1, 0, 1,
-0.6491144, -1.511328, -2.458612, 0.5137255, 1, 0, 1,
-0.6471378, -0.5080807, -2.209582, 0.5058824, 1, 0, 1,
-0.6469913, -1.14274, -1.60226, 0.5019608, 1, 0, 1,
-0.6404695, 0.1637351, 0.2267112, 0.4941176, 1, 0, 1,
-0.6383979, 0.174989, 0.01338778, 0.4862745, 1, 0, 1,
-0.6323192, 0.3262533, -1.676375, 0.4823529, 1, 0, 1,
-0.6304268, -0.4093165, 0.3654632, 0.4745098, 1, 0, 1,
-0.6303622, -0.9030892, -2.61378, 0.4705882, 1, 0, 1,
-0.6253335, -1.713822, -1.379976, 0.4627451, 1, 0, 1,
-0.6178336, -0.7842745, -1.949543, 0.4588235, 1, 0, 1,
-0.6176784, 0.1652135, -1.752679, 0.4509804, 1, 0, 1,
-0.615138, 1.287957, -0.4234044, 0.4470588, 1, 0, 1,
-0.6139834, -1.087611, -3.293081, 0.4392157, 1, 0, 1,
-0.6105066, 0.8372553, -1.871317, 0.4352941, 1, 0, 1,
-0.6091709, 1.092168, -2.75212, 0.427451, 1, 0, 1,
-0.6091238, 1.053327, -3.625354, 0.4235294, 1, 0, 1,
-0.6049243, 1.691348, -1.032555, 0.4156863, 1, 0, 1,
-0.6033663, -0.5400608, -1.100325, 0.4117647, 1, 0, 1,
-0.6025013, -0.1847678, -1.176245, 0.4039216, 1, 0, 1,
-0.6024278, 0.08054413, -3.01069, 0.3960784, 1, 0, 1,
-0.5910128, 0.4669592, -1.96458, 0.3921569, 1, 0, 1,
-0.5854845, 0.05957237, -1.292377, 0.3843137, 1, 0, 1,
-0.5854059, 1.441674, -0.4849274, 0.3803922, 1, 0, 1,
-0.579783, 0.371813, -0.2451387, 0.372549, 1, 0, 1,
-0.5771682, -1.818508, -4.084154, 0.3686275, 1, 0, 1,
-0.5763972, 2.12945, -0.4883561, 0.3607843, 1, 0, 1,
-0.5760217, -0.6300229, -2.367786, 0.3568628, 1, 0, 1,
-0.5734069, -0.3259353, -2.630325, 0.3490196, 1, 0, 1,
-0.5642215, -0.4286385, -2.838709, 0.345098, 1, 0, 1,
-0.563455, -1.427466, -3.122623, 0.3372549, 1, 0, 1,
-0.5551828, 1.786994, -2.048804, 0.3333333, 1, 0, 1,
-0.5518135, -0.9872288, -1.294384, 0.3254902, 1, 0, 1,
-0.549166, 0.7722107, -0.7694419, 0.3215686, 1, 0, 1,
-0.5452402, -1.854075, -2.995239, 0.3137255, 1, 0, 1,
-0.5445453, 1.19905, 2.546382, 0.3098039, 1, 0, 1,
-0.5433467, -0.3834746, -0.9857636, 0.3019608, 1, 0, 1,
-0.5401338, 0.1961215, -2.27848, 0.2941177, 1, 0, 1,
-0.5379325, -1.781104, -2.12388, 0.2901961, 1, 0, 1,
-0.5344958, -1.098633, -2.836873, 0.282353, 1, 0, 1,
-0.531535, -0.1493704, -0.0596749, 0.2784314, 1, 0, 1,
-0.5310758, 1.221611, -0.5095636, 0.2705882, 1, 0, 1,
-0.524066, 0.4828482, 0.01421854, 0.2666667, 1, 0, 1,
-0.52189, -2.158641, -3.901275, 0.2588235, 1, 0, 1,
-0.5200617, -1.254657, -2.056392, 0.254902, 1, 0, 1,
-0.5164724, 0.3823978, -4.187006, 0.2470588, 1, 0, 1,
-0.5146757, 0.3389033, -1.148495, 0.2431373, 1, 0, 1,
-0.5141057, 0.5953586, -0.7255262, 0.2352941, 1, 0, 1,
-0.506408, -1.338297, -2.77908, 0.2313726, 1, 0, 1,
-0.5034043, -0.291804, -1.774975, 0.2235294, 1, 0, 1,
-0.5003575, 1.427541, -0.3916636, 0.2196078, 1, 0, 1,
-0.4983094, 1.667511, -0.564774, 0.2117647, 1, 0, 1,
-0.4893033, -0.2411723, -0.7168766, 0.2078431, 1, 0, 1,
-0.4875242, -0.005492518, -1.8237, 0.2, 1, 0, 1,
-0.4841211, -0.09627622, -1.098786, 0.1921569, 1, 0, 1,
-0.4765637, -0.7562236, -2.807235, 0.1882353, 1, 0, 1,
-0.474122, 1.152443, -0.5105812, 0.1803922, 1, 0, 1,
-0.4724972, 0.3439153, -0.1870633, 0.1764706, 1, 0, 1,
-0.4719534, 0.03798351, -2.27496, 0.1686275, 1, 0, 1,
-0.4709597, -1.483013, -2.60117, 0.1647059, 1, 0, 1,
-0.4692846, 1.141759, -0.3003888, 0.1568628, 1, 0, 1,
-0.4680989, -1.018014, -2.20455, 0.1529412, 1, 0, 1,
-0.4673642, 1.101919, 0.2779939, 0.145098, 1, 0, 1,
-0.4564222, -1.093972, -2.020501, 0.1411765, 1, 0, 1,
-0.4517784, 0.4128751, -1.448511, 0.1333333, 1, 0, 1,
-0.4516702, -1.862126, -1.870827, 0.1294118, 1, 0, 1,
-0.4494579, 1.239713, -0.8093728, 0.1215686, 1, 0, 1,
-0.4481933, 1.009521, -0.07423364, 0.1176471, 1, 0, 1,
-0.4460531, 1.177731, -0.9487851, 0.1098039, 1, 0, 1,
-0.4443836, 0.3751265, -1.324362, 0.1058824, 1, 0, 1,
-0.4432833, 0.1033856, -1.674197, 0.09803922, 1, 0, 1,
-0.4319718, 0.07439896, -2.092659, 0.09019608, 1, 0, 1,
-0.4248435, -0.08992656, -1.845994, 0.08627451, 1, 0, 1,
-0.4218928, -0.847571, -2.225826, 0.07843138, 1, 0, 1,
-0.4209981, 0.3752167, -0.2380842, 0.07450981, 1, 0, 1,
-0.4205497, -1.881525, -3.508774, 0.06666667, 1, 0, 1,
-0.4202031, -0.2221086, -1.328303, 0.0627451, 1, 0, 1,
-0.4045476, 0.9741507, -0.6211665, 0.05490196, 1, 0, 1,
-0.4012355, -0.7575399, -1.735906, 0.05098039, 1, 0, 1,
-0.4007796, 1.015078, -0.3664505, 0.04313726, 1, 0, 1,
-0.4007016, 0.7218593, 0.6743279, 0.03921569, 1, 0, 1,
-0.3968884, 0.5020398, 0.4628527, 0.03137255, 1, 0, 1,
-0.3965848, 0.1870014, -1.119397, 0.02745098, 1, 0, 1,
-0.3943411, -0.02398639, -2.30206, 0.01960784, 1, 0, 1,
-0.3913905, -0.3538193, -2.442324, 0.01568628, 1, 0, 1,
-0.3875945, 1.812079, 0.3680586, 0.007843138, 1, 0, 1,
-0.386503, 0.1936401, -0.9547394, 0.003921569, 1, 0, 1,
-0.3863902, 0.4856817, 0.109794, 0, 1, 0.003921569, 1,
-0.3843251, -1.334048, -4.462486, 0, 1, 0.01176471, 1,
-0.3799241, -1.082188, -2.590252, 0, 1, 0.01568628, 1,
-0.3786316, -0.1071783, -2.119442, 0, 1, 0.02352941, 1,
-0.378461, 1.193853, 0.7439771, 0, 1, 0.02745098, 1,
-0.3783405, -0.4459363, -1.217842, 0, 1, 0.03529412, 1,
-0.3734892, 0.1488513, -1.700968, 0, 1, 0.03921569, 1,
-0.3732705, -1.289027, -3.126461, 0, 1, 0.04705882, 1,
-0.3692529, -0.3638536, -1.617048, 0, 1, 0.05098039, 1,
-0.3663026, -0.6165369, -2.539587, 0, 1, 0.05882353, 1,
-0.3654936, -0.3429263, -4.571858, 0, 1, 0.0627451, 1,
-0.3637446, -1.083273, -2.082695, 0, 1, 0.07058824, 1,
-0.3616018, -1.630766, -2.182524, 0, 1, 0.07450981, 1,
-0.3604822, 0.4185611, 0.07879192, 0, 1, 0.08235294, 1,
-0.3593814, 0.4452475, -1.674323, 0, 1, 0.08627451, 1,
-0.3586481, -0.7576725, -2.248732, 0, 1, 0.09411765, 1,
-0.3532398, 0.9780599, 0.2792946, 0, 1, 0.1019608, 1,
-0.3517371, 0.1802, -1.387617, 0, 1, 0.1058824, 1,
-0.3490164, 0.440666, -0.8194126, 0, 1, 0.1137255, 1,
-0.348419, -0.09955152, -0.168544, 0, 1, 0.1176471, 1,
-0.3447624, 0.2076171, -1.262764, 0, 1, 0.1254902, 1,
-0.3444593, -0.3500083, -2.789246, 0, 1, 0.1294118, 1,
-0.3349487, 0.6178051, -0.3313533, 0, 1, 0.1372549, 1,
-0.330613, -0.02423764, 0.4521294, 0, 1, 0.1411765, 1,
-0.3289123, -2.076707, -3.046317, 0, 1, 0.1490196, 1,
-0.3285981, 0.1674438, -0.6700184, 0, 1, 0.1529412, 1,
-0.3275248, -0.1562836, -0.2188005, 0, 1, 0.1607843, 1,
-0.3219474, -0.9344578, -4.302167, 0, 1, 0.1647059, 1,
-0.3142622, 1.576378, 0.8327124, 0, 1, 0.172549, 1,
-0.3106332, 0.158934, 0.5672574, 0, 1, 0.1764706, 1,
-0.3097588, 0.3571542, -0.331166, 0, 1, 0.1843137, 1,
-0.3091981, 0.113997, 0.617839, 0, 1, 0.1882353, 1,
-0.3039345, -0.1356712, -2.100306, 0, 1, 0.1960784, 1,
-0.3005778, 0.1693005, 0.099375, 0, 1, 0.2039216, 1,
-0.3002346, 0.5623018, -1.637733, 0, 1, 0.2078431, 1,
-0.2976102, 0.3224384, 0.03381131, 0, 1, 0.2156863, 1,
-0.2949842, 1.339768, 1.127931, 0, 1, 0.2196078, 1,
-0.2946787, 0.251766, -0.8519319, 0, 1, 0.227451, 1,
-0.2935916, -0.01329019, -0.9075032, 0, 1, 0.2313726, 1,
-0.2878686, -1.061935, -3.044089, 0, 1, 0.2392157, 1,
-0.2842117, -0.157612, -4.149963, 0, 1, 0.2431373, 1,
-0.2812698, 1.754034, -1.278663, 0, 1, 0.2509804, 1,
-0.2758713, 1.253047, -0.546218, 0, 1, 0.254902, 1,
-0.2753527, -0.6639693, -1.978002, 0, 1, 0.2627451, 1,
-0.2731704, 0.6204227, -1.719511, 0, 1, 0.2666667, 1,
-0.2721078, 1.692063, 0.0732542, 0, 1, 0.2745098, 1,
-0.2702293, 2.423467, -1.003284, 0, 1, 0.2784314, 1,
-0.2677885, -0.579869, -1.483018, 0, 1, 0.2862745, 1,
-0.2669694, -0.7364582, -1.701488, 0, 1, 0.2901961, 1,
-0.2653581, 0.8705304, -0.6652374, 0, 1, 0.2980392, 1,
-0.2650436, -0.2392176, -2.032459, 0, 1, 0.3058824, 1,
-0.2645385, -0.3923075, -1.625773, 0, 1, 0.3098039, 1,
-0.2639008, 2.167416, -0.2056352, 0, 1, 0.3176471, 1,
-0.254919, 0.4350617, 2.424362, 0, 1, 0.3215686, 1,
-0.2515198, -0.02872412, -0.9297391, 0, 1, 0.3294118, 1,
-0.2497134, -0.05094118, 0.03401334, 0, 1, 0.3333333, 1,
-0.2488572, -0.807754, -3.15291, 0, 1, 0.3411765, 1,
-0.2466203, -0.8532466, -1.90502, 0, 1, 0.345098, 1,
-0.2420182, 0.4753469, -1.568582, 0, 1, 0.3529412, 1,
-0.2408897, 0.2214015, -1.784154, 0, 1, 0.3568628, 1,
-0.2391042, 0.4494036, -0.1606688, 0, 1, 0.3647059, 1,
-0.2384769, 0.3982312, -0.2674989, 0, 1, 0.3686275, 1,
-0.2378738, 0.813278, -1.185144, 0, 1, 0.3764706, 1,
-0.2336794, 0.2804341, 0.5651535, 0, 1, 0.3803922, 1,
-0.2246855, 0.8211965, 0.1071397, 0, 1, 0.3882353, 1,
-0.2206115, -1.993984, -4.258548, 0, 1, 0.3921569, 1,
-0.2195088, 1.565161, -0.6311181, 0, 1, 0.4, 1,
-0.2152029, 0.4190798, 0.8651369, 0, 1, 0.4078431, 1,
-0.2112937, 1.429921, 0.04742117, 0, 1, 0.4117647, 1,
-0.2092686, 0.365561, -0.08511423, 0, 1, 0.4196078, 1,
-0.2075219, 0.5009291, -0.3760893, 0, 1, 0.4235294, 1,
-0.2021612, 0.7650006, -1.139985, 0, 1, 0.4313726, 1,
-0.1986189, -0.1928682, -2.347385, 0, 1, 0.4352941, 1,
-0.1964457, -1.026102, -3.75433, 0, 1, 0.4431373, 1,
-0.1934234, -0.6829512, -2.300867, 0, 1, 0.4470588, 1,
-0.1910182, 0.3629529, 0.4247217, 0, 1, 0.454902, 1,
-0.1893691, 1.002249, -0.7623144, 0, 1, 0.4588235, 1,
-0.1857074, -0.2691855, -4.627138, 0, 1, 0.4666667, 1,
-0.184785, 0.6303731, 0.08971939, 0, 1, 0.4705882, 1,
-0.1847754, -0.477124, -3.287262, 0, 1, 0.4784314, 1,
-0.1846562, 0.2999126, -0.8919483, 0, 1, 0.4823529, 1,
-0.1838828, -1.386021, -3.344915, 0, 1, 0.4901961, 1,
-0.182386, -0.1094939, -2.050289, 0, 1, 0.4941176, 1,
-0.1820504, -1.70688, -2.696129, 0, 1, 0.5019608, 1,
-0.1807743, -0.8700199, -1.674017, 0, 1, 0.509804, 1,
-0.1796416, 1.223133, 0.3971111, 0, 1, 0.5137255, 1,
-0.1776817, -1.378863, -3.444283, 0, 1, 0.5215687, 1,
-0.175411, 0.7162383, -1.068769, 0, 1, 0.5254902, 1,
-0.1726586, 0.9403911, -0.04713083, 0, 1, 0.5333334, 1,
-0.1703056, 1.068816, 2.700162, 0, 1, 0.5372549, 1,
-0.1685288, -0.01465205, -2.306732, 0, 1, 0.5450981, 1,
-0.1624627, 1.175789, -0.08130768, 0, 1, 0.5490196, 1,
-0.161501, -0.7005998, -2.935199, 0, 1, 0.5568628, 1,
-0.16136, 2.706582, 0.6003782, 0, 1, 0.5607843, 1,
-0.160495, -0.4536605, -1.083822, 0, 1, 0.5686275, 1,
-0.1582158, -1.545566, -1.349014, 0, 1, 0.572549, 1,
-0.1502661, 0.7981919, -1.421982, 0, 1, 0.5803922, 1,
-0.1457908, 1.772158, 0.8612262, 0, 1, 0.5843138, 1,
-0.1450053, -1.519733, -4.071169, 0, 1, 0.5921569, 1,
-0.1429663, 1.481249, 0.3827782, 0, 1, 0.5960785, 1,
-0.1401749, -1.768414, -3.507307, 0, 1, 0.6039216, 1,
-0.1375345, -0.06709248, -0.8180856, 0, 1, 0.6117647, 1,
-0.1352155, -0.3767925, -2.902422, 0, 1, 0.6156863, 1,
-0.1351022, -0.3776716, -1.920922, 0, 1, 0.6235294, 1,
-0.1332829, 0.1360155, -0.8135217, 0, 1, 0.627451, 1,
-0.1243907, -0.9228535, -1.467406, 0, 1, 0.6352941, 1,
-0.1217052, 0.5061656, 0.5894571, 0, 1, 0.6392157, 1,
-0.1215352, 0.6063945, -1.086452, 0, 1, 0.6470588, 1,
-0.1204297, 1.145604, 0.3576933, 0, 1, 0.6509804, 1,
-0.1175732, -0.1155423, -2.461342, 0, 1, 0.6588235, 1,
-0.1158309, -0.1928942, -1.662197, 0, 1, 0.6627451, 1,
-0.1150551, 0.4173011, 0.6732736, 0, 1, 0.6705883, 1,
-0.1120678, -0.4934635, -1.728817, 0, 1, 0.6745098, 1,
-0.1099652, 0.02040953, -1.740977, 0, 1, 0.682353, 1,
-0.1045931, 0.7133355, 0.5266898, 0, 1, 0.6862745, 1,
-0.1031507, 0.4470472, -0.4348348, 0, 1, 0.6941177, 1,
-0.1019787, 0.2107602, -0.4166534, 0, 1, 0.7019608, 1,
-0.09430149, 0.6011952, -1.626414, 0, 1, 0.7058824, 1,
-0.0863764, -0.1386041, -1.006224, 0, 1, 0.7137255, 1,
-0.08489884, -0.8992714, -1.340815, 0, 1, 0.7176471, 1,
-0.08131772, -0.4556701, -3.192306, 0, 1, 0.7254902, 1,
-0.0808956, 0.08730373, -0.6504085, 0, 1, 0.7294118, 1,
-0.07967927, -2.13793, -5.007489, 0, 1, 0.7372549, 1,
-0.07760636, -1.91676, -0.7334569, 0, 1, 0.7411765, 1,
-0.07403138, 1.076128, 1.558585, 0, 1, 0.7490196, 1,
-0.07144971, -0.178757, -3.002146, 0, 1, 0.7529412, 1,
-0.06578015, 1.005509, 0.1389252, 0, 1, 0.7607843, 1,
-0.06329797, -1.383859, -4.391106, 0, 1, 0.7647059, 1,
-0.06058064, 0.8112381, -0.4616405, 0, 1, 0.772549, 1,
-0.05998164, 0.03395649, -1.186189, 0, 1, 0.7764706, 1,
-0.05734557, 0.5482237, -1.852924, 0, 1, 0.7843137, 1,
-0.05525845, 0.3394955, -0.612647, 0, 1, 0.7882353, 1,
-0.05274282, 0.6825093, -0.7205736, 0, 1, 0.7960784, 1,
-0.05071761, -0.1339833, -1.879735, 0, 1, 0.8039216, 1,
-0.04560574, -1.13961, -4.337543, 0, 1, 0.8078431, 1,
-0.0436302, 0.818769, -1.068167, 0, 1, 0.8156863, 1,
-0.04215622, 1.265048, 0.9068384, 0, 1, 0.8196079, 1,
-0.04033559, -0.6712182, -4.98605, 0, 1, 0.827451, 1,
-0.0390184, -1.036471, -3.273077, 0, 1, 0.8313726, 1,
-0.03780697, 0.5977749, -0.4303454, 0, 1, 0.8392157, 1,
-0.03697851, -0.1295373, -2.983325, 0, 1, 0.8431373, 1,
-0.03129656, 1.567004, -0.09762235, 0, 1, 0.8509804, 1,
-0.02937375, -0.67837, -3.001544, 0, 1, 0.854902, 1,
-0.0288244, 1.390576, -1.507059, 0, 1, 0.8627451, 1,
-0.02757076, 0.7283379, 0.3511548, 0, 1, 0.8666667, 1,
-0.02639532, 0.3622589, -2.110013, 0, 1, 0.8745098, 1,
-0.02569615, 0.4857551, -1.437091, 0, 1, 0.8784314, 1,
-0.02415234, -2.248864, -2.965357, 0, 1, 0.8862745, 1,
-0.0197447, -0.4284724, -4.243788, 0, 1, 0.8901961, 1,
-0.01662713, 0.04690642, 0.3704813, 0, 1, 0.8980392, 1,
-0.01424564, 0.7557864, 0.09345596, 0, 1, 0.9058824, 1,
-0.01265001, -0.2922404, -3.483205, 0, 1, 0.9098039, 1,
-0.01259258, 0.3052031, 0.3301013, 0, 1, 0.9176471, 1,
-0.008961163, 1.058069, 0.6487998, 0, 1, 0.9215686, 1,
-0.008926684, -0.1194643, -3.205987, 0, 1, 0.9294118, 1,
-0.00669805, 0.7832459, 0.4528722, 0, 1, 0.9333333, 1,
-0.0043275, -0.5444617, -3.612198, 0, 1, 0.9411765, 1,
-0.002745875, 1.071162, -0.2295566, 0, 1, 0.945098, 1,
-0.002260116, -1.349761, -2.238885, 0, 1, 0.9529412, 1,
-0.0022207, -1.432278, -2.128377, 0, 1, 0.9568627, 1,
0.0009361948, -1.184135, 1.765083, 0, 1, 0.9647059, 1,
0.002491264, -0.3613759, 3.128287, 0, 1, 0.9686275, 1,
0.004982468, -0.3419146, 3.434356, 0, 1, 0.9764706, 1,
0.006574874, -0.7671601, 5.018878, 0, 1, 0.9803922, 1,
0.01306665, -0.441349, 2.225745, 0, 1, 0.9882353, 1,
0.01859623, 0.1589131, -0.9541286, 0, 1, 0.9921569, 1,
0.01982222, 0.002563926, 2.809261, 0, 1, 1, 1,
0.03042094, -1.111174, 1.161924, 0, 0.9921569, 1, 1,
0.03392321, 1.99955, -0.3251231, 0, 0.9882353, 1, 1,
0.03504052, 0.6647674, -0.8344638, 0, 0.9803922, 1, 1,
0.03602199, 0.3906908, 1.076759, 0, 0.9764706, 1, 1,
0.04163859, -1.583992, 2.671073, 0, 0.9686275, 1, 1,
0.05146376, 0.9511097, -1.632367, 0, 0.9647059, 1, 1,
0.05577864, 0.1652419, 1.211636, 0, 0.9568627, 1, 1,
0.0557829, -0.586926, 1.084771, 0, 0.9529412, 1, 1,
0.05628988, 0.7591944, -0.7827272, 0, 0.945098, 1, 1,
0.0565167, -1.433053, 3.245867, 0, 0.9411765, 1, 1,
0.05756803, -1.084782, 1.068348, 0, 0.9333333, 1, 1,
0.0591637, 0.6050631, -0.1876598, 0, 0.9294118, 1, 1,
0.06066154, -0.6352844, 2.33471, 0, 0.9215686, 1, 1,
0.06086121, 0.7538067, -0.7953482, 0, 0.9176471, 1, 1,
0.06156273, 0.4061586, 0.7153622, 0, 0.9098039, 1, 1,
0.06356307, -0.03176622, 3.232488, 0, 0.9058824, 1, 1,
0.06676709, -0.8957984, 3.777194, 0, 0.8980392, 1, 1,
0.06781866, 0.225729, -0.9920723, 0, 0.8901961, 1, 1,
0.0698079, 0.7758402, -0.1278687, 0, 0.8862745, 1, 1,
0.06983036, -1.97682, 4.815595, 0, 0.8784314, 1, 1,
0.07068229, -0.9998906, 2.249491, 0, 0.8745098, 1, 1,
0.07284636, 0.4717325, -0.1196086, 0, 0.8666667, 1, 1,
0.07626577, -0.7785265, 2.370998, 0, 0.8627451, 1, 1,
0.07681647, -0.4946781, 3.328682, 0, 0.854902, 1, 1,
0.08102106, -0.3664233, 1.137033, 0, 0.8509804, 1, 1,
0.081398, -0.05354497, 1.730757, 0, 0.8431373, 1, 1,
0.08295097, -0.5853409, 2.438333, 0, 0.8392157, 1, 1,
0.08574156, -0.1955433, 2.984916, 0, 0.8313726, 1, 1,
0.0901778, 0.05717325, 2.58919, 0, 0.827451, 1, 1,
0.09168992, 0.7053754, -0.5276794, 0, 0.8196079, 1, 1,
0.09427491, 0.4241616, 2.811382, 0, 0.8156863, 1, 1,
0.09594689, -1.364729, 2.711161, 0, 0.8078431, 1, 1,
0.09621186, -1.200505, 4.771812, 0, 0.8039216, 1, 1,
0.09651088, -0.8068238, 4.207548, 0, 0.7960784, 1, 1,
0.1011548, -0.2327872, 2.419942, 0, 0.7882353, 1, 1,
0.1038705, 0.6847299, -0.1192489, 0, 0.7843137, 1, 1,
0.1092024, 0.5133753, 0.6511368, 0, 0.7764706, 1, 1,
0.1100839, 0.4855975, 0.7459016, 0, 0.772549, 1, 1,
0.1123737, 0.7712013, -0.0245887, 0, 0.7647059, 1, 1,
0.12117, 1.282337, 1.206955, 0, 0.7607843, 1, 1,
0.1243988, 1.29714, 0.4389322, 0, 0.7529412, 1, 1,
0.1257069, 0.1199446, 1.724681, 0, 0.7490196, 1, 1,
0.1267576, 1.516968, -0.6016789, 0, 0.7411765, 1, 1,
0.1288505, -2.640946, 3.45876, 0, 0.7372549, 1, 1,
0.129023, -0.4960549, 2.498771, 0, 0.7294118, 1, 1,
0.1299816, -0.03868318, 2.562793, 0, 0.7254902, 1, 1,
0.1305105, -0.8072013, 3.171528, 0, 0.7176471, 1, 1,
0.1347893, -1.463902, 3.559062, 0, 0.7137255, 1, 1,
0.135984, -0.5325376, 2.807563, 0, 0.7058824, 1, 1,
0.1365793, 0.4506, -0.0369267, 0, 0.6980392, 1, 1,
0.144168, 0.7078357, -0.2059366, 0, 0.6941177, 1, 1,
0.1449476, 0.1690371, 1.308252, 0, 0.6862745, 1, 1,
0.1463231, 0.1982113, -0.000234905, 0, 0.682353, 1, 1,
0.1470672, -0.1073841, 4.636115, 0, 0.6745098, 1, 1,
0.1500942, 0.3690831, 0.5386119, 0, 0.6705883, 1, 1,
0.1527293, -0.433962, 3.567091, 0, 0.6627451, 1, 1,
0.1555308, 0.01279022, 2.269621, 0, 0.6588235, 1, 1,
0.1595161, 0.8119296, 1.629427, 0, 0.6509804, 1, 1,
0.1599668, -0.7182069, 3.440196, 0, 0.6470588, 1, 1,
0.1610297, 1.354726, 0.4687797, 0, 0.6392157, 1, 1,
0.1635364, -0.6217515, 3.074648, 0, 0.6352941, 1, 1,
0.1655328, 0.2259324, 0.03336691, 0, 0.627451, 1, 1,
0.170272, 0.7108374, 1.50826, 0, 0.6235294, 1, 1,
0.1705881, -0.6146783, 3.993357, 0, 0.6156863, 1, 1,
0.1710498, 0.9629714, -0.343482, 0, 0.6117647, 1, 1,
0.1780554, 0.1467743, 2.743484, 0, 0.6039216, 1, 1,
0.1822963, 1.64924, -1.027653, 0, 0.5960785, 1, 1,
0.1823708, -0.02269722, 1.831969, 0, 0.5921569, 1, 1,
0.1849914, -0.306535, 2.958139, 0, 0.5843138, 1, 1,
0.1865613, 0.7527046, 0.4441339, 0, 0.5803922, 1, 1,
0.1980504, -0.4012146, 1.713988, 0, 0.572549, 1, 1,
0.2010817, -0.7180406, 5.658173, 0, 0.5686275, 1, 1,
0.2025166, -0.9627813, 3.582931, 0, 0.5607843, 1, 1,
0.2061615, -0.6473799, 0.4260961, 0, 0.5568628, 1, 1,
0.2081476, -0.9774772, 2.455025, 0, 0.5490196, 1, 1,
0.2083796, 0.2395462, -1.847888, 0, 0.5450981, 1, 1,
0.2125219, -0.07940155, 2.357489, 0, 0.5372549, 1, 1,
0.2164185, 0.608498, 0.8047525, 0, 0.5333334, 1, 1,
0.2183103, -1.567318, 5.184854, 0, 0.5254902, 1, 1,
0.2214417, -2.111762, 3.602235, 0, 0.5215687, 1, 1,
0.2247061, -1.83467, 3.777244, 0, 0.5137255, 1, 1,
0.2259736, 1.516277, 0.2701915, 0, 0.509804, 1, 1,
0.2307925, 1.663785, -0.6873353, 0, 0.5019608, 1, 1,
0.2414228, 0.4815721, 0.7752843, 0, 0.4941176, 1, 1,
0.242541, 1.056633, 0.4968515, 0, 0.4901961, 1, 1,
0.2430061, 0.01943245, 2.380402, 0, 0.4823529, 1, 1,
0.2442311, 0.2610343, 0.6793457, 0, 0.4784314, 1, 1,
0.2451404, -0.9480342, 3.60093, 0, 0.4705882, 1, 1,
0.2482315, -0.5820854, 2.587214, 0, 0.4666667, 1, 1,
0.2486606, 0.5345361, 1.071877, 0, 0.4588235, 1, 1,
0.2533472, -0.1560241, 1.732089, 0, 0.454902, 1, 1,
0.2533659, -0.8601953, 1.384387, 0, 0.4470588, 1, 1,
0.2542478, 0.9636026, 0.3077078, 0, 0.4431373, 1, 1,
0.256702, 2.018225, 0.2065781, 0, 0.4352941, 1, 1,
0.2578293, -0.3142745, 0.7547152, 0, 0.4313726, 1, 1,
0.2611071, 0.7618538, 1.764087, 0, 0.4235294, 1, 1,
0.2620089, -1.118156, 3.429264, 0, 0.4196078, 1, 1,
0.2646239, -0.4099322, 1.797299, 0, 0.4117647, 1, 1,
0.2647839, 1.389522, -0.6756822, 0, 0.4078431, 1, 1,
0.2728225, -0.2979883, 2.980934, 0, 0.4, 1, 1,
0.2779164, 0.3852567, 0.8697102, 0, 0.3921569, 1, 1,
0.2789577, -1.090306, 3.292665, 0, 0.3882353, 1, 1,
0.2894574, -0.1062226, 2.261439, 0, 0.3803922, 1, 1,
0.2900641, 0.8052358, -0.5396246, 0, 0.3764706, 1, 1,
0.2924919, 1.407697, 0.9737236, 0, 0.3686275, 1, 1,
0.292853, 0.05764253, 1.632722, 0, 0.3647059, 1, 1,
0.2936312, -1.614786, 1.70176, 0, 0.3568628, 1, 1,
0.2943844, -1.869158, 4.039073, 0, 0.3529412, 1, 1,
0.2960618, -1.189296, 1.925462, 0, 0.345098, 1, 1,
0.2977714, 1.777807, -0.5625387, 0, 0.3411765, 1, 1,
0.3025849, 0.04222703, 1.908211, 0, 0.3333333, 1, 1,
0.3026855, -0.9634711, 2.752513, 0, 0.3294118, 1, 1,
0.305667, -0.868602, 3.067328, 0, 0.3215686, 1, 1,
0.3159093, 1.650032, 0.1333527, 0, 0.3176471, 1, 1,
0.3174999, 0.5657951, -0.1753741, 0, 0.3098039, 1, 1,
0.3217008, -0.9002224, 3.802627, 0, 0.3058824, 1, 1,
0.3222094, -0.07108985, 3.921892, 0, 0.2980392, 1, 1,
0.3228691, 0.4540967, 1.998702, 0, 0.2901961, 1, 1,
0.3249475, -0.7366573, 0.4708232, 0, 0.2862745, 1, 1,
0.3260633, -0.001979392, 2.969903, 0, 0.2784314, 1, 1,
0.3360673, -0.5983383, 1.165162, 0, 0.2745098, 1, 1,
0.3376572, 1.160052, 1.348775, 0, 0.2666667, 1, 1,
0.3394153, -0.2676914, 2.201639, 0, 0.2627451, 1, 1,
0.3394876, 1.129716, -0.4006684, 0, 0.254902, 1, 1,
0.3395461, -0.01216914, 1.640202, 0, 0.2509804, 1, 1,
0.339913, 0.6199656, 0.7673423, 0, 0.2431373, 1, 1,
0.3424764, -1.233109, 2.323603, 0, 0.2392157, 1, 1,
0.3433855, -0.8755908, 2.953903, 0, 0.2313726, 1, 1,
0.3445412, -0.5238362, 2.173569, 0, 0.227451, 1, 1,
0.3446235, 0.9983639, 0.3401961, 0, 0.2196078, 1, 1,
0.3465945, 1.404487, 1.606631, 0, 0.2156863, 1, 1,
0.3467036, -2.215589, 2.548842, 0, 0.2078431, 1, 1,
0.3529394, 0.7192869, -1.076758, 0, 0.2039216, 1, 1,
0.355991, 1.253309, -0.1443978, 0, 0.1960784, 1, 1,
0.3579744, -0.1349414, 2.047252, 0, 0.1882353, 1, 1,
0.3588358, -1.448811, 5.000045, 0, 0.1843137, 1, 1,
0.3588871, -0.5309551, 2.909591, 0, 0.1764706, 1, 1,
0.3621081, 0.8162136, 1.656416, 0, 0.172549, 1, 1,
0.3637533, 0.003828254, 1.87182, 0, 0.1647059, 1, 1,
0.3648275, 1.04405, -0.574745, 0, 0.1607843, 1, 1,
0.3651499, 0.4254528, 1.340169, 0, 0.1529412, 1, 1,
0.3658011, -0.6167735, 2.823024, 0, 0.1490196, 1, 1,
0.3682672, 0.3104016, 1.962848, 0, 0.1411765, 1, 1,
0.3690104, 0.797869, 1.182516, 0, 0.1372549, 1, 1,
0.3760563, 0.5790164, 0.694914, 0, 0.1294118, 1, 1,
0.3763796, 1.268346, 0.05009868, 0, 0.1254902, 1, 1,
0.3793106, 0.1126504, 1.399207, 0, 0.1176471, 1, 1,
0.3809255, -0.1779929, 2.506818, 0, 0.1137255, 1, 1,
0.3830914, 0.3276142, 1.791547, 0, 0.1058824, 1, 1,
0.3834508, 0.851779, 0.6733296, 0, 0.09803922, 1, 1,
0.3858427, -0.514627, 3.433988, 0, 0.09411765, 1, 1,
0.3919306, 0.5164725, 1.785525, 0, 0.08627451, 1, 1,
0.393984, 1.577891, 0.990384, 0, 0.08235294, 1, 1,
0.3969428, -0.3185387, 2.573685, 0, 0.07450981, 1, 1,
0.3999217, -0.9674997, 2.087733, 0, 0.07058824, 1, 1,
0.4013927, -2.840435, 3.126558, 0, 0.0627451, 1, 1,
0.4049518, -0.1929168, 3.108369, 0, 0.05882353, 1, 1,
0.411195, -0.01109037, 2.669064, 0, 0.05098039, 1, 1,
0.4147839, -0.5650588, 4.158702, 0, 0.04705882, 1, 1,
0.415718, 1.512315, -0.1407297, 0, 0.03921569, 1, 1,
0.4169059, -0.1378885, 2.278015, 0, 0.03529412, 1, 1,
0.4183246, 0.07156201, 2.001947, 0, 0.02745098, 1, 1,
0.4207994, 0.3939232, 1.665578, 0, 0.02352941, 1, 1,
0.4230721, -0.08762547, 2.326637, 0, 0.01568628, 1, 1,
0.4235169, 1.581791, 0.3648373, 0, 0.01176471, 1, 1,
0.4249341, -0.563904, 4.103195, 0, 0.003921569, 1, 1,
0.4261502, 2.679621, 0.03601096, 0.003921569, 0, 1, 1,
0.4273526, -1.121351, 3.702843, 0.007843138, 0, 1, 1,
0.4408668, 0.01193698, 3.094274, 0.01568628, 0, 1, 1,
0.4495839, -1.684101, 1.506554, 0.01960784, 0, 1, 1,
0.452433, 2.848763, -1.161059, 0.02745098, 0, 1, 1,
0.4550309, -0.4136709, 2.886807, 0.03137255, 0, 1, 1,
0.4579391, 0.5042121, 3.222529, 0.03921569, 0, 1, 1,
0.4621771, -1.054581, 2.35819, 0.04313726, 0, 1, 1,
0.4727191, 1.042009, -1.01035, 0.05098039, 0, 1, 1,
0.4741384, -1.149377, 1.448055, 0.05490196, 0, 1, 1,
0.4744822, -0.9634424, 3.578145, 0.0627451, 0, 1, 1,
0.4768516, 0.0774026, 0.5208418, 0.06666667, 0, 1, 1,
0.4783964, 0.5791033, 1.782914, 0.07450981, 0, 1, 1,
0.4785929, 2.490345, 0.7801561, 0.07843138, 0, 1, 1,
0.4798021, -2.61576, 1.869841, 0.08627451, 0, 1, 1,
0.4883409, 1.931448, -0.3445876, 0.09019608, 0, 1, 1,
0.4904461, -1.519182, 3.150028, 0.09803922, 0, 1, 1,
0.4921188, -0.6913334, 2.693851, 0.1058824, 0, 1, 1,
0.4935955, -1.382763, 1.360109, 0.1098039, 0, 1, 1,
0.4936509, 0.01758943, 3.377587, 0.1176471, 0, 1, 1,
0.5009101, 0.07674906, 2.859436, 0.1215686, 0, 1, 1,
0.5014957, -0.3620135, 2.264531, 0.1294118, 0, 1, 1,
0.5044379, 1.069887, -0.2215778, 0.1333333, 0, 1, 1,
0.5074387, -0.3504304, 1.213818, 0.1411765, 0, 1, 1,
0.5102847, -0.4664952, 2.535944, 0.145098, 0, 1, 1,
0.5113299, 2.054911, 0.08728778, 0.1529412, 0, 1, 1,
0.513977, -1.658627, 3.521455, 0.1568628, 0, 1, 1,
0.5141774, 0.5660458, 0.7161811, 0.1647059, 0, 1, 1,
0.5186154, -0.8413401, 2.737613, 0.1686275, 0, 1, 1,
0.5227112, 0.4917525, 2.642914, 0.1764706, 0, 1, 1,
0.5230808, -0.4760268, 3.37129, 0.1803922, 0, 1, 1,
0.5249433, 0.4760879, 2.517689, 0.1882353, 0, 1, 1,
0.5274093, 1.747917, 1.320852, 0.1921569, 0, 1, 1,
0.5362714, -0.5215953, 3.703014, 0.2, 0, 1, 1,
0.5386068, 0.2542939, 0.4333117, 0.2078431, 0, 1, 1,
0.5472494, -0.7983273, 2.956532, 0.2117647, 0, 1, 1,
0.5532367, 1.166924, 1.072955, 0.2196078, 0, 1, 1,
0.5554464, 0.4040938, 0.7489522, 0.2235294, 0, 1, 1,
0.5580253, -0.8803681, 2.466313, 0.2313726, 0, 1, 1,
0.5705719, 0.3994345, 3.332996, 0.2352941, 0, 1, 1,
0.5715172, -0.3933668, 0.6262996, 0.2431373, 0, 1, 1,
0.5794247, -0.599192, 0.8029777, 0.2470588, 0, 1, 1,
0.579524, 0.418554, 1.925888, 0.254902, 0, 1, 1,
0.5795454, 1.122224, 0.8792769, 0.2588235, 0, 1, 1,
0.5807306, 0.661122, -0.01168876, 0.2666667, 0, 1, 1,
0.5811778, -0.9033378, 2.105098, 0.2705882, 0, 1, 1,
0.5825123, 0.7977825, 1.108079, 0.2784314, 0, 1, 1,
0.5832547, -0.9517123, 1.796845, 0.282353, 0, 1, 1,
0.5875896, -1.801546, -0.009086103, 0.2901961, 0, 1, 1,
0.5926846, 0.7647985, -0.3729058, 0.2941177, 0, 1, 1,
0.600861, 0.3956713, 2.074214, 0.3019608, 0, 1, 1,
0.6053736, -0.03998583, 1.366426, 0.3098039, 0, 1, 1,
0.6054401, 0.7988136, -0.2669402, 0.3137255, 0, 1, 1,
0.6061346, -2.194112, 1.48125, 0.3215686, 0, 1, 1,
0.6068693, 1.815133, 0.2331623, 0.3254902, 0, 1, 1,
0.6091149, -0.3361269, 3.55106, 0.3333333, 0, 1, 1,
0.609217, -0.2395175, 2.643601, 0.3372549, 0, 1, 1,
0.6139223, -0.8946708, 1.787026, 0.345098, 0, 1, 1,
0.6218631, -0.308706, 1.296853, 0.3490196, 0, 1, 1,
0.6232741, 0.384077, 2.342088, 0.3568628, 0, 1, 1,
0.6299421, 0.8426986, -1.14329, 0.3607843, 0, 1, 1,
0.6318185, -0.4933046, 4.140065, 0.3686275, 0, 1, 1,
0.6327831, 1.241233, 0.1633218, 0.372549, 0, 1, 1,
0.6422615, 0.01482754, 3.560204, 0.3803922, 0, 1, 1,
0.6455116, 0.5396903, 0.1482038, 0.3843137, 0, 1, 1,
0.6467316, 0.4527451, 3.148493, 0.3921569, 0, 1, 1,
0.6476342, 0.4872399, -0.2809561, 0.3960784, 0, 1, 1,
0.6545889, 0.33272, 3.508531, 0.4039216, 0, 1, 1,
0.6577851, -1.016297, 1.661151, 0.4117647, 0, 1, 1,
0.6586799, 0.1411445, 1.821787, 0.4156863, 0, 1, 1,
0.6648492, 0.6952783, 1.020803, 0.4235294, 0, 1, 1,
0.6656687, -0.4890885, 2.141656, 0.427451, 0, 1, 1,
0.6709149, 0.05214692, 1.342917, 0.4352941, 0, 1, 1,
0.6735001, 1.223009, -0.8580633, 0.4392157, 0, 1, 1,
0.6750073, 0.3730024, 2.896982, 0.4470588, 0, 1, 1,
0.6818409, 0.2671264, 1.165826, 0.4509804, 0, 1, 1,
0.6855609, -0.3300589, 3.56748, 0.4588235, 0, 1, 1,
0.688364, 0.7940975, -0.1389263, 0.4627451, 0, 1, 1,
0.6884853, 1.221539, -0.5881265, 0.4705882, 0, 1, 1,
0.6895239, -0.3134181, 1.828989, 0.4745098, 0, 1, 1,
0.6914307, -0.3822244, 1.217555, 0.4823529, 0, 1, 1,
0.6968258, 1.120475, -0.09541984, 0.4862745, 0, 1, 1,
0.7006225, 0.8234136, 0.366037, 0.4941176, 0, 1, 1,
0.7038979, -2.266658, 2.555496, 0.5019608, 0, 1, 1,
0.7081684, 0.4676663, 0.9822184, 0.5058824, 0, 1, 1,
0.7085392, -0.6725919, 2.219163, 0.5137255, 0, 1, 1,
0.70906, 0.392946, 1.091066, 0.5176471, 0, 1, 1,
0.7132849, 0.540193, 1.359875, 0.5254902, 0, 1, 1,
0.7136085, 0.2426758, 0.4988408, 0.5294118, 0, 1, 1,
0.7144485, -1.094706, 3.64374, 0.5372549, 0, 1, 1,
0.72029, 0.5128816, 2.502924, 0.5411765, 0, 1, 1,
0.7324042, 0.6640981, 1.485592, 0.5490196, 0, 1, 1,
0.7400144, -0.4707135, 4.257979, 0.5529412, 0, 1, 1,
0.7407283, -0.7661478, 2.594601, 0.5607843, 0, 1, 1,
0.7450517, -1.219553, 0.6156067, 0.5647059, 0, 1, 1,
0.7466342, 0.6178073, 0.3447443, 0.572549, 0, 1, 1,
0.7494268, 1.283618, -0.2202288, 0.5764706, 0, 1, 1,
0.7511572, -0.003899411, 0.1434598, 0.5843138, 0, 1, 1,
0.7517447, 1.624686, -0.3654316, 0.5882353, 0, 1, 1,
0.7523569, 0.119288, 1.540895, 0.5960785, 0, 1, 1,
0.7549877, -0.3479635, 0.8914608, 0.6039216, 0, 1, 1,
0.7637183, 1.624289, -1.326306, 0.6078432, 0, 1, 1,
0.7695299, 0.4313436, 1.62569, 0.6156863, 0, 1, 1,
0.773862, -0.02767758, 1.011559, 0.6196079, 0, 1, 1,
0.7776449, -0.3624634, 1.148673, 0.627451, 0, 1, 1,
0.7809917, -0.1838843, 2.012051, 0.6313726, 0, 1, 1,
0.7816768, 0.5862299, 1.522271, 0.6392157, 0, 1, 1,
0.7851731, 0.535377, 2.386599, 0.6431373, 0, 1, 1,
0.7858067, -0.3986163, 1.975439, 0.6509804, 0, 1, 1,
0.7888936, -1.588681, 3.106304, 0.654902, 0, 1, 1,
0.7896858, 2.376771, 0.8112552, 0.6627451, 0, 1, 1,
0.7898222, 0.1632277, 0.9754255, 0.6666667, 0, 1, 1,
0.7905732, -0.03406468, 1.484486, 0.6745098, 0, 1, 1,
0.7906317, 0.8798717, 0.8692513, 0.6784314, 0, 1, 1,
0.7950384, 0.2423643, 1.627641, 0.6862745, 0, 1, 1,
0.7972985, -0.6019899, 3.952173, 0.6901961, 0, 1, 1,
0.7992624, 0.8088371, 0.6148467, 0.6980392, 0, 1, 1,
0.7997491, 0.8986106, 0.627882, 0.7058824, 0, 1, 1,
0.8024173, 1.80878, 2.454934, 0.7098039, 0, 1, 1,
0.8110281, 1.105619, 1.638768, 0.7176471, 0, 1, 1,
0.8155734, 0.06751192, 0.9472641, 0.7215686, 0, 1, 1,
0.8214836, -0.4873705, 2.111488, 0.7294118, 0, 1, 1,
0.8222483, 0.01356637, 2.130068, 0.7333333, 0, 1, 1,
0.8232949, -0.566266, 1.196284, 0.7411765, 0, 1, 1,
0.8261802, 0.04681012, 3.138957, 0.7450981, 0, 1, 1,
0.826837, -0.6938414, 3.503453, 0.7529412, 0, 1, 1,
0.8303508, 0.7503644, 1.191295, 0.7568628, 0, 1, 1,
0.8328746, 0.2267529, 2.276212, 0.7647059, 0, 1, 1,
0.8338419, 1.656548, 1.125689, 0.7686275, 0, 1, 1,
0.838987, 1.007574, 0.1708154, 0.7764706, 0, 1, 1,
0.8398663, 0.194866, 0.0399776, 0.7803922, 0, 1, 1,
0.8433245, -0.3450488, 2.440896, 0.7882353, 0, 1, 1,
0.8520166, -0.7117224, -0.2757617, 0.7921569, 0, 1, 1,
0.8669859, 1.301243, 1.063416, 0.8, 0, 1, 1,
0.8673989, 0.4070981, 2.117315, 0.8078431, 0, 1, 1,
0.8720796, -0.9374017, 1.791972, 0.8117647, 0, 1, 1,
0.8784515, -1.345378, 0.8180201, 0.8196079, 0, 1, 1,
0.8851554, -1.177568, 2.760076, 0.8235294, 0, 1, 1,
0.8865488, -0.5286621, 2.605962, 0.8313726, 0, 1, 1,
0.8874635, -1.035389, 3.222153, 0.8352941, 0, 1, 1,
0.891353, -1.081974, 1.84123, 0.8431373, 0, 1, 1,
0.8917226, -1.060771, 3.455861, 0.8470588, 0, 1, 1,
0.8924108, 0.03636849, 2.395806, 0.854902, 0, 1, 1,
0.8979508, -2.134859, 2.510506, 0.8588235, 0, 1, 1,
0.9003177, -1.136416, 2.623292, 0.8666667, 0, 1, 1,
0.9051709, -0.3520773, 2.759401, 0.8705882, 0, 1, 1,
0.9115254, 1.563815, 1.928716, 0.8784314, 0, 1, 1,
0.9130093, -0.4552005, 1.232166, 0.8823529, 0, 1, 1,
0.9147134, -0.3429744, 2.991035, 0.8901961, 0, 1, 1,
0.9184729, -0.0506193, 1.716125, 0.8941177, 0, 1, 1,
0.9200529, 0.1097025, 2.182082, 0.9019608, 0, 1, 1,
0.9222455, 0.8620192, 1.807612, 0.9098039, 0, 1, 1,
0.9230962, 1.511132, -0.1962973, 0.9137255, 0, 1, 1,
0.9241735, -2.252125, 3.032535, 0.9215686, 0, 1, 1,
0.9261447, -0.7221808, 0.7342239, 0.9254902, 0, 1, 1,
0.9269436, 1.483289, 1.145318, 0.9333333, 0, 1, 1,
0.9326224, 0.6114125, 0.2707116, 0.9372549, 0, 1, 1,
0.9384249, 1.378223, 0.4653823, 0.945098, 0, 1, 1,
0.9421382, 0.6317732, 0.8806164, 0.9490196, 0, 1, 1,
0.942378, 0.6619542, 1.433208, 0.9568627, 0, 1, 1,
0.9484293, 1.159906, 0.3051451, 0.9607843, 0, 1, 1,
0.9486908, -0.5523497, 2.924967, 0.9686275, 0, 1, 1,
0.9518335, 0.9154054, 0.3798779, 0.972549, 0, 1, 1,
0.9539395, 0.09542183, 1.244877, 0.9803922, 0, 1, 1,
0.9607297, 0.7636462, 1.144579, 0.9843137, 0, 1, 1,
0.9638211, 0.5703439, 1.75648, 0.9921569, 0, 1, 1,
0.9773515, -0.920756, 2.485814, 0.9960784, 0, 1, 1,
0.9893286, 0.3657288, 2.366114, 1, 0, 0.9960784, 1,
0.9905091, -1.689153, 4.398686, 1, 0, 0.9882353, 1,
0.9906133, 0.2930777, 1.524146, 1, 0, 0.9843137, 1,
0.9931604, 1.326021, 1.538515, 1, 0, 0.9764706, 1,
1.000435, 1.75183, 1.037736, 1, 0, 0.972549, 1,
1.007173, -0.2388918, 0.8046915, 1, 0, 0.9647059, 1,
1.011374, 0.5006574, 1.448787, 1, 0, 0.9607843, 1,
1.018118, 0.126159, 0.1832219, 1, 0, 0.9529412, 1,
1.01959, 0.06919014, 1.037529, 1, 0, 0.9490196, 1,
1.02863, -1.05109, 3.111803, 1, 0, 0.9411765, 1,
1.037556, 0.2066711, 1.802544, 1, 0, 0.9372549, 1,
1.044219, 0.09567447, 1.774902, 1, 0, 0.9294118, 1,
1.049857, 0.3807324, 2.513894, 1, 0, 0.9254902, 1,
1.055977, -2.056235, 3.42178, 1, 0, 0.9176471, 1,
1.056427, -0.8381243, 1.8852, 1, 0, 0.9137255, 1,
1.058824, 0.5729135, 0.8909248, 1, 0, 0.9058824, 1,
1.059552, 0.9388108, 0.5672134, 1, 0, 0.9019608, 1,
1.06552, -0.4080864, 3.885859, 1, 0, 0.8941177, 1,
1.069523, 0.2403455, 2.401617, 1, 0, 0.8862745, 1,
1.0808, 0.6573487, 1.533053, 1, 0, 0.8823529, 1,
1.106952, 0.6752169, 1.695302, 1, 0, 0.8745098, 1,
1.108338, 0.5178939, -0.009691498, 1, 0, 0.8705882, 1,
1.10909, -0.3649642, 2.126711, 1, 0, 0.8627451, 1,
1.114632, 0.133439, 1.250002, 1, 0, 0.8588235, 1,
1.117504, 0.5062953, 3.205738, 1, 0, 0.8509804, 1,
1.119218, -0.9816731, 0.1614373, 1, 0, 0.8470588, 1,
1.123429, 0.8518698, 3.531765, 1, 0, 0.8392157, 1,
1.124364, 2.303195, 0.2381038, 1, 0, 0.8352941, 1,
1.124669, 1.674321, 1.911584, 1, 0, 0.827451, 1,
1.126004, -0.1327567, 1.347886, 1, 0, 0.8235294, 1,
1.128013, 0.4385537, 2.337352, 1, 0, 0.8156863, 1,
1.131574, 0.5955428, 0.8387348, 1, 0, 0.8117647, 1,
1.13679, 0.5896239, 0.3989682, 1, 0, 0.8039216, 1,
1.138514, -0.7272754, 1.239002, 1, 0, 0.7960784, 1,
1.139521, -0.8662233, 2.552565, 1, 0, 0.7921569, 1,
1.143199, 1.145495, 0.2821728, 1, 0, 0.7843137, 1,
1.145383, 1.02942, 0.1625086, 1, 0, 0.7803922, 1,
1.156405, 0.3321151, 0.6578064, 1, 0, 0.772549, 1,
1.168091, -0.1306775, 2.676999, 1, 0, 0.7686275, 1,
1.170774, -1.564953, 2.670556, 1, 0, 0.7607843, 1,
1.175567, -0.6899475, 0.917024, 1, 0, 0.7568628, 1,
1.182098, -1.283371, 1.473904, 1, 0, 0.7490196, 1,
1.184466, 2.519179, 1.007526, 1, 0, 0.7450981, 1,
1.189358, 0.9499146, 1.497435, 1, 0, 0.7372549, 1,
1.191961, 0.01495026, 0.9507104, 1, 0, 0.7333333, 1,
1.203687, -0.07298139, 1.185228, 1, 0, 0.7254902, 1,
1.210152, 0.1039417, 2.88781, 1, 0, 0.7215686, 1,
1.215089, 0.6315061, 0.06600579, 1, 0, 0.7137255, 1,
1.216601, -0.3746928, 2.782958, 1, 0, 0.7098039, 1,
1.222744, 0.2021037, 1.264465, 1, 0, 0.7019608, 1,
1.223517, -1.693943, 2.443142, 1, 0, 0.6941177, 1,
1.234659, -0.2226361, 2.266937, 1, 0, 0.6901961, 1,
1.244155, -1.013869, 2.794618, 1, 0, 0.682353, 1,
1.244955, 0.8142713, 0.8516788, 1, 0, 0.6784314, 1,
1.249267, -0.08239129, 2.120452, 1, 0, 0.6705883, 1,
1.249449, 0.5823635, 1.044227, 1, 0, 0.6666667, 1,
1.250017, 2.7055, -0.1689952, 1, 0, 0.6588235, 1,
1.25033, -0.1804766, 1.670946, 1, 0, 0.654902, 1,
1.253161, -0.921441, 2.072873, 1, 0, 0.6470588, 1,
1.265211, 1.285235, 1.356393, 1, 0, 0.6431373, 1,
1.27233, -0.3680833, 1.139406, 1, 0, 0.6352941, 1,
1.275185, 0.3119166, 0.3770224, 1, 0, 0.6313726, 1,
1.275907, -0.3682937, 2.512956, 1, 0, 0.6235294, 1,
1.280731, -0.2228341, 2.162583, 1, 0, 0.6196079, 1,
1.288, 0.3629685, -0.4821212, 1, 0, 0.6117647, 1,
1.290853, -1.849889, 1.432843, 1, 0, 0.6078432, 1,
1.296748, -0.9643572, 0.911825, 1, 0, 0.6, 1,
1.299861, -0.05768326, 4.94935, 1, 0, 0.5921569, 1,
1.304287, -0.09681782, 2.263189, 1, 0, 0.5882353, 1,
1.310423, -0.847383, 3.568907, 1, 0, 0.5803922, 1,
1.31678, 1.010141, 1.622267, 1, 0, 0.5764706, 1,
1.317519, 2.983163, 2.71773, 1, 0, 0.5686275, 1,
1.319033, 1.012031, -1.13853, 1, 0, 0.5647059, 1,
1.322304, -0.7458494, 2.739024, 1, 0, 0.5568628, 1,
1.323366, -2.246723, 1.690127, 1, 0, 0.5529412, 1,
1.324291, -0.4544981, 2.890133, 1, 0, 0.5450981, 1,
1.326035, 0.9665419, 2.072285, 1, 0, 0.5411765, 1,
1.329823, 0.635052, -0.5170248, 1, 0, 0.5333334, 1,
1.331604, 0.2352187, 1.20035, 1, 0, 0.5294118, 1,
1.333404, -0.3382272, 3.186768, 1, 0, 0.5215687, 1,
1.346542, -1.389574, 3.334707, 1, 0, 0.5176471, 1,
1.350149, -0.10553, 1.842073, 1, 0, 0.509804, 1,
1.357239, -1.279415, 1.583191, 1, 0, 0.5058824, 1,
1.361323, 0.3501175, 1.342372, 1, 0, 0.4980392, 1,
1.372223, -0.4431562, 1.471531, 1, 0, 0.4901961, 1,
1.374935, 0.1013519, 1.786349, 1, 0, 0.4862745, 1,
1.375076, 0.8972843, 0.7266869, 1, 0, 0.4784314, 1,
1.375088, 1.180455, 2.609826, 1, 0, 0.4745098, 1,
1.397934, 0.1839806, 2.335486, 1, 0, 0.4666667, 1,
1.40266, -0.6519306, 2.814095, 1, 0, 0.4627451, 1,
1.414716, -2.223112, 2.883442, 1, 0, 0.454902, 1,
1.420629, -0.006094773, 2.30159, 1, 0, 0.4509804, 1,
1.427391, -0.2508842, 4.218922, 1, 0, 0.4431373, 1,
1.436205, 0.6873792, 0.1804602, 1, 0, 0.4392157, 1,
1.438969, 0.6679351, 0.3894416, 1, 0, 0.4313726, 1,
1.446451, -0.5332569, 0.5147617, 1, 0, 0.427451, 1,
1.452297, -0.2854717, 1.823854, 1, 0, 0.4196078, 1,
1.458565, 1.153903, -0.4601083, 1, 0, 0.4156863, 1,
1.460858, 0.1692509, 0.5607811, 1, 0, 0.4078431, 1,
1.46103, -0.1123923, 2.043816, 1, 0, 0.4039216, 1,
1.462295, -0.7898061, 2.685572, 1, 0, 0.3960784, 1,
1.464622, -0.6676896, 3.317153, 1, 0, 0.3882353, 1,
1.479244, -1.406608, 2.976462, 1, 0, 0.3843137, 1,
1.484331, -0.6301644, 1.45557, 1, 0, 0.3764706, 1,
1.48589, 0.07153297, 1.996981, 1, 0, 0.372549, 1,
1.492151, 0.9044892, -0.1117613, 1, 0, 0.3647059, 1,
1.494351, 0.1113453, -0.1710628, 1, 0, 0.3607843, 1,
1.500223, -1.305885, 1.767083, 1, 0, 0.3529412, 1,
1.503735, -0.7518947, 3.496295, 1, 0, 0.3490196, 1,
1.504106, -0.1472976, 2.124979, 1, 0, 0.3411765, 1,
1.517952, 0.5880476, 1.348797, 1, 0, 0.3372549, 1,
1.519184, 0.3995909, 2.372192, 1, 0, 0.3294118, 1,
1.527116, -1.323184, 2.50949, 1, 0, 0.3254902, 1,
1.527694, -0.1193989, 0.7135485, 1, 0, 0.3176471, 1,
1.536116, 0.5228528, 2.406535, 1, 0, 0.3137255, 1,
1.542482, -0.00322128, 2.948196, 1, 0, 0.3058824, 1,
1.542714, 1.344042, 1.044801, 1, 0, 0.2980392, 1,
1.544505, 1.764784, 1.027389, 1, 0, 0.2941177, 1,
1.561342, -0.3222711, 1.458648, 1, 0, 0.2862745, 1,
1.567843, -0.5856059, 1.78989, 1, 0, 0.282353, 1,
1.592379, -0.2193969, 2.922708, 1, 0, 0.2745098, 1,
1.593027, 0.3337527, 0.9880813, 1, 0, 0.2705882, 1,
1.621317, 0.4695396, 2.073274, 1, 0, 0.2627451, 1,
1.63155, 0.4508127, -1.072937, 1, 0, 0.2588235, 1,
1.641599, -0.4930081, 0.2555062, 1, 0, 0.2509804, 1,
1.650902, -0.04998929, 1.716188, 1, 0, 0.2470588, 1,
1.670413, -0.7596934, 1.5277, 1, 0, 0.2392157, 1,
1.67399, 1.434641, 1.723886, 1, 0, 0.2352941, 1,
1.681224, -1.376952, 2.867322, 1, 0, 0.227451, 1,
1.682638, -0.993832, 2.971108, 1, 0, 0.2235294, 1,
1.683737, -0.8475406, 0.5119963, 1, 0, 0.2156863, 1,
1.689619, -0.259603, 1.306579, 1, 0, 0.2117647, 1,
1.692829, -0.392496, 0.2080657, 1, 0, 0.2039216, 1,
1.713414, -0.07614499, 3.215192, 1, 0, 0.1960784, 1,
1.716044, -0.3105804, 2.252479, 1, 0, 0.1921569, 1,
1.733055, 0.2712405, 3.06131, 1, 0, 0.1843137, 1,
1.737414, 0.2405226, 1.608136, 1, 0, 0.1803922, 1,
1.779022, -0.5776572, 2.377594, 1, 0, 0.172549, 1,
1.800637, -0.6839105, 0.1837067, 1, 0, 0.1686275, 1,
1.838154, 0.04790894, -0.6479458, 1, 0, 0.1607843, 1,
1.857502, -0.1880622, 2.364725, 1, 0, 0.1568628, 1,
1.866024, 1.116785, 1.626139, 1, 0, 0.1490196, 1,
1.900911, 0.001960401, 2.151324, 1, 0, 0.145098, 1,
2.011329, 1.021106, 1.388173, 1, 0, 0.1372549, 1,
2.021394, 0.5195438, 0.2851136, 1, 0, 0.1333333, 1,
2.037704, 0.1941513, 1.028016, 1, 0, 0.1254902, 1,
2.057762, 1.235614, 0.56311, 1, 0, 0.1215686, 1,
2.084426, -0.04876246, 2.645761, 1, 0, 0.1137255, 1,
2.102661, 0.6860636, -0.2195534, 1, 0, 0.1098039, 1,
2.140701, 1.358321, 0.7397237, 1, 0, 0.1019608, 1,
2.144141, 0.3793039, 0.267336, 1, 0, 0.09411765, 1,
2.229929, 0.1110957, 2.080415, 1, 0, 0.09019608, 1,
2.327312, -1.237791, 2.409311, 1, 0, 0.08235294, 1,
2.329581, 0.982747, 1.464342, 1, 0, 0.07843138, 1,
2.330821, -1.798006, 2.143032, 1, 0, 0.07058824, 1,
2.363071, -0.8284434, 2.610797, 1, 0, 0.06666667, 1,
2.367165, 1.255639, 0.07597072, 1, 0, 0.05882353, 1,
2.374931, 1.336766, 1.910818, 1, 0, 0.05490196, 1,
2.377126, -1.358376, 2.910432, 1, 0, 0.04705882, 1,
2.400259, 1.020167, 1.706095, 1, 0, 0.04313726, 1,
2.4868, 0.8976429, 1.321394, 1, 0, 0.03529412, 1,
2.63103, -1.608034, 1.612975, 1, 0, 0.03137255, 1,
2.644505, 0.8555678, 2.348181, 1, 0, 0.02352941, 1,
2.645689, -0.0332152, 0.8164363, 1, 0, 0.01960784, 1,
2.700714, 0.9625075, 0.8726454, 1, 0, 0.01176471, 1,
3.550892, -0.1680567, 2.124107, 1, 0, 0.007843138, 1
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
0.4020425, -3.827534, -6.890778, 0, -0.5, 0.5, 0.5,
0.4020425, -3.827534, -6.890778, 1, -0.5, 0.5, 0.5,
0.4020425, -3.827534, -6.890778, 1, 1.5, 0.5, 0.5,
0.4020425, -3.827534, -6.890778, 0, 1.5, 0.5, 0.5
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
-3.814267, 0.07136416, -6.890778, 0, -0.5, 0.5, 0.5,
-3.814267, 0.07136416, -6.890778, 1, -0.5, 0.5, 0.5,
-3.814267, 0.07136416, -6.890778, 1, 1.5, 0.5, 0.5,
-3.814267, 0.07136416, -6.890778, 0, 1.5, 0.5, 0.5
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
-3.814267, -3.827534, 0.2930803, 0, -0.5, 0.5, 0.5,
-3.814267, -3.827534, 0.2930803, 1, -0.5, 0.5, 0.5,
-3.814267, -3.827534, 0.2930803, 1, 1.5, 0.5, 0.5,
-3.814267, -3.827534, 0.2930803, 0, 1.5, 0.5, 0.5
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
-2, -2.927788, -5.232965,
3, -2.927788, -5.232965,
-2, -2.927788, -5.232965,
-2, -3.077746, -5.509267,
-1, -2.927788, -5.232965,
-1, -3.077746, -5.509267,
0, -2.927788, -5.232965,
0, -3.077746, -5.509267,
1, -2.927788, -5.232965,
1, -3.077746, -5.509267,
2, -2.927788, -5.232965,
2, -3.077746, -5.509267,
3, -2.927788, -5.232965,
3, -3.077746, -5.509267
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
-2, -3.377661, -6.061872, 0, -0.5, 0.5, 0.5,
-2, -3.377661, -6.061872, 1, -0.5, 0.5, 0.5,
-2, -3.377661, -6.061872, 1, 1.5, 0.5, 0.5,
-2, -3.377661, -6.061872, 0, 1.5, 0.5, 0.5,
-1, -3.377661, -6.061872, 0, -0.5, 0.5, 0.5,
-1, -3.377661, -6.061872, 1, -0.5, 0.5, 0.5,
-1, -3.377661, -6.061872, 1, 1.5, 0.5, 0.5,
-1, -3.377661, -6.061872, 0, 1.5, 0.5, 0.5,
0, -3.377661, -6.061872, 0, -0.5, 0.5, 0.5,
0, -3.377661, -6.061872, 1, -0.5, 0.5, 0.5,
0, -3.377661, -6.061872, 1, 1.5, 0.5, 0.5,
0, -3.377661, -6.061872, 0, 1.5, 0.5, 0.5,
1, -3.377661, -6.061872, 0, -0.5, 0.5, 0.5,
1, -3.377661, -6.061872, 1, -0.5, 0.5, 0.5,
1, -3.377661, -6.061872, 1, 1.5, 0.5, 0.5,
1, -3.377661, -6.061872, 0, 1.5, 0.5, 0.5,
2, -3.377661, -6.061872, 0, -0.5, 0.5, 0.5,
2, -3.377661, -6.061872, 1, -0.5, 0.5, 0.5,
2, -3.377661, -6.061872, 1, 1.5, 0.5, 0.5,
2, -3.377661, -6.061872, 0, 1.5, 0.5, 0.5,
3, -3.377661, -6.061872, 0, -0.5, 0.5, 0.5,
3, -3.377661, -6.061872, 1, -0.5, 0.5, 0.5,
3, -3.377661, -6.061872, 1, 1.5, 0.5, 0.5,
3, -3.377661, -6.061872, 0, 1.5, 0.5, 0.5
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
-2.841272, -2, -5.232965,
-2.841272, 2, -5.232965,
-2.841272, -2, -5.232965,
-3.003438, -2, -5.509267,
-2.841272, -1, -5.232965,
-3.003438, -1, -5.509267,
-2.841272, 0, -5.232965,
-3.003438, 0, -5.509267,
-2.841272, 1, -5.232965,
-3.003438, 1, -5.509267,
-2.841272, 2, -5.232965,
-3.003438, 2, -5.509267
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
-3.32777, -2, -6.061872, 0, -0.5, 0.5, 0.5,
-3.32777, -2, -6.061872, 1, -0.5, 0.5, 0.5,
-3.32777, -2, -6.061872, 1, 1.5, 0.5, 0.5,
-3.32777, -2, -6.061872, 0, 1.5, 0.5, 0.5,
-3.32777, -1, -6.061872, 0, -0.5, 0.5, 0.5,
-3.32777, -1, -6.061872, 1, -0.5, 0.5, 0.5,
-3.32777, -1, -6.061872, 1, 1.5, 0.5, 0.5,
-3.32777, -1, -6.061872, 0, 1.5, 0.5, 0.5,
-3.32777, 0, -6.061872, 0, -0.5, 0.5, 0.5,
-3.32777, 0, -6.061872, 1, -0.5, 0.5, 0.5,
-3.32777, 0, -6.061872, 1, 1.5, 0.5, 0.5,
-3.32777, 0, -6.061872, 0, 1.5, 0.5, 0.5,
-3.32777, 1, -6.061872, 0, -0.5, 0.5, 0.5,
-3.32777, 1, -6.061872, 1, -0.5, 0.5, 0.5,
-3.32777, 1, -6.061872, 1, 1.5, 0.5, 0.5,
-3.32777, 1, -6.061872, 0, 1.5, 0.5, 0.5,
-3.32777, 2, -6.061872, 0, -0.5, 0.5, 0.5,
-3.32777, 2, -6.061872, 1, -0.5, 0.5, 0.5,
-3.32777, 2, -6.061872, 1, 1.5, 0.5, 0.5,
-3.32777, 2, -6.061872, 0, 1.5, 0.5, 0.5
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
-2.841272, -2.927788, -4,
-2.841272, -2.927788, 4,
-2.841272, -2.927788, -4,
-3.003438, -3.077746, -4,
-2.841272, -2.927788, -2,
-3.003438, -3.077746, -2,
-2.841272, -2.927788, 0,
-3.003438, -3.077746, 0,
-2.841272, -2.927788, 2,
-3.003438, -3.077746, 2,
-2.841272, -2.927788, 4,
-3.003438, -3.077746, 4
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
-3.32777, -3.377661, -4, 0, -0.5, 0.5, 0.5,
-3.32777, -3.377661, -4, 1, -0.5, 0.5, 0.5,
-3.32777, -3.377661, -4, 1, 1.5, 0.5, 0.5,
-3.32777, -3.377661, -4, 0, 1.5, 0.5, 0.5,
-3.32777, -3.377661, -2, 0, -0.5, 0.5, 0.5,
-3.32777, -3.377661, -2, 1, -0.5, 0.5, 0.5,
-3.32777, -3.377661, -2, 1, 1.5, 0.5, 0.5,
-3.32777, -3.377661, -2, 0, 1.5, 0.5, 0.5,
-3.32777, -3.377661, 0, 0, -0.5, 0.5, 0.5,
-3.32777, -3.377661, 0, 1, -0.5, 0.5, 0.5,
-3.32777, -3.377661, 0, 1, 1.5, 0.5, 0.5,
-3.32777, -3.377661, 0, 0, 1.5, 0.5, 0.5,
-3.32777, -3.377661, 2, 0, -0.5, 0.5, 0.5,
-3.32777, -3.377661, 2, 1, -0.5, 0.5, 0.5,
-3.32777, -3.377661, 2, 1, 1.5, 0.5, 0.5,
-3.32777, -3.377661, 2, 0, 1.5, 0.5, 0.5,
-3.32777, -3.377661, 4, 0, -0.5, 0.5, 0.5,
-3.32777, -3.377661, 4, 1, -0.5, 0.5, 0.5,
-3.32777, -3.377661, 4, 1, 1.5, 0.5, 0.5,
-3.32777, -3.377661, 4, 0, 1.5, 0.5, 0.5
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
-2.841272, -2.927788, -5.232965,
-2.841272, 3.070517, -5.232965,
-2.841272, -2.927788, 5.819125,
-2.841272, 3.070517, 5.819125,
-2.841272, -2.927788, -5.232965,
-2.841272, -2.927788, 5.819125,
-2.841272, 3.070517, -5.232965,
-2.841272, 3.070517, 5.819125,
-2.841272, -2.927788, -5.232965,
3.645357, -2.927788, -5.232965,
-2.841272, -2.927788, 5.819125,
3.645357, -2.927788, 5.819125,
-2.841272, 3.070517, -5.232965,
3.645357, 3.070517, -5.232965,
-2.841272, 3.070517, 5.819125,
3.645357, 3.070517, 5.819125,
3.645357, -2.927788, -5.232965,
3.645357, 3.070517, -5.232965,
3.645357, -2.927788, 5.819125,
3.645357, 3.070517, 5.819125,
3.645357, -2.927788, -5.232965,
3.645357, -2.927788, 5.819125,
3.645357, 3.070517, -5.232965,
3.645357, 3.070517, 5.819125
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
var radius = 7.55549;
var distance = 33.61523;
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
mvMatrix.translate( -0.4020425, -0.07136416, -0.2930803 );
mvMatrix.scale( 1.259382, 1.361909, 0.7391492 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.61523);
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
perfluidone<-read.table("perfluidone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-perfluidone$V2
```

```
## Error in eval(expr, envir, enclos): object 'perfluidone' not found
```

```r
y<-perfluidone$V3
```

```
## Error in eval(expr, envir, enclos): object 'perfluidone' not found
```

```r
z<-perfluidone$V4
```

```
## Error in eval(expr, envir, enclos): object 'perfluidone' not found
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
-2.746807, -0.0993766, -0.6577508, 0, 0, 1, 1, 1,
-2.584346, -0.5463874, -1.860206, 1, 0, 0, 1, 1,
-2.499284, 1.504392, -1.870486, 1, 0, 0, 1, 1,
-2.426794, -0.5223656, -0.6239518, 1, 0, 0, 1, 1,
-2.395911, 0.3764398, 0.2739452, 1, 0, 0, 1, 1,
-2.371077, 0.2303565, -1.644142, 1, 0, 0, 1, 1,
-2.325539, -0.3756725, -3.064372, 0, 0, 0, 1, 1,
-2.316256, 0.2135525, -0.8749211, 0, 0, 0, 1, 1,
-2.286748, -0.828586, -2.655349, 0, 0, 0, 1, 1,
-2.279858, -1.489545, -1.568377, 0, 0, 0, 1, 1,
-2.266, -1.622136, -1.861314, 0, 0, 0, 1, 1,
-2.259661, -1.086575, -1.326711, 0, 0, 0, 1, 1,
-2.25248, 0.8738608, -1.531471, 0, 0, 0, 1, 1,
-2.247544, -0.06361564, -1.566329, 1, 1, 1, 1, 1,
-2.223853, -0.5847552, -3.380283, 1, 1, 1, 1, 1,
-2.22189, -0.07609002, 0.01622971, 1, 1, 1, 1, 1,
-2.196722, 0.1287784, 0.1790891, 1, 1, 1, 1, 1,
-2.096996, -1.110507, -3.847246, 1, 1, 1, 1, 1,
-2.094341, -1.264206, -3.294738, 1, 1, 1, 1, 1,
-2.035678, 0.4744711, -1.188981, 1, 1, 1, 1, 1,
-2.023731, -0.1290469, -0.1617958, 1, 1, 1, 1, 1,
-2.016744, 0.1242452, -1.001352, 1, 1, 1, 1, 1,
-2.003848, -2.282195, -5.072012, 1, 1, 1, 1, 1,
-1.997781, 0.8554347, 0.3323478, 1, 1, 1, 1, 1,
-1.990911, -0.7800753, -3.777617, 1, 1, 1, 1, 1,
-1.981412, 1.013797, -0.8500643, 1, 1, 1, 1, 1,
-1.975356, 0.08691296, -0.6297069, 1, 1, 1, 1, 1,
-1.945747, 0.6790721, -0.6495644, 1, 1, 1, 1, 1,
-1.942141, -0.6171195, -1.983512, 0, 0, 1, 1, 1,
-1.941088, -0.5080835, -0.8357046, 1, 0, 0, 1, 1,
-1.939494, -1.242028, -2.486736, 1, 0, 0, 1, 1,
-1.93186, -0.005756515, -1.202487, 1, 0, 0, 1, 1,
-1.916325, 0.8643364, -0.1651481, 1, 0, 0, 1, 1,
-1.908441, 0.08580456, -2.968609, 1, 0, 0, 1, 1,
-1.889176, -0.3794521, -2.763678, 0, 0, 0, 1, 1,
-1.8849, -0.8845649, -0.7082513, 0, 0, 0, 1, 1,
-1.879871, 1.438389, -1.41188, 0, 0, 0, 1, 1,
-1.872788, -1.553612, -2.278711, 0, 0, 0, 1, 1,
-1.844965, -0.9210313, -3.479834, 0, 0, 0, 1, 1,
-1.838587, -0.01883574, -2.291604, 0, 0, 0, 1, 1,
-1.831071, 0.1677991, -1.963491, 0, 0, 0, 1, 1,
-1.825071, 0.06578226, -0.8242202, 1, 1, 1, 1, 1,
-1.824861, -0.0412611, -1.607099, 1, 1, 1, 1, 1,
-1.818905, -1.331401, -1.86927, 1, 1, 1, 1, 1,
-1.801212, 0.9424468, -2.289539, 1, 1, 1, 1, 1,
-1.786567, -0.4998649, -3.066527, 1, 1, 1, 1, 1,
-1.774531, 0.4945723, -1.130622, 1, 1, 1, 1, 1,
-1.766601, -0.3736488, -0.8655726, 1, 1, 1, 1, 1,
-1.76349, 1.39812, -2.520709, 1, 1, 1, 1, 1,
-1.729612, 0.5857188, -2.311984, 1, 1, 1, 1, 1,
-1.723695, -0.4851544, -0.8176446, 1, 1, 1, 1, 1,
-1.698575, -0.6102105, -1.49484, 1, 1, 1, 1, 1,
-1.692869, -0.6146722, -0.4208108, 1, 1, 1, 1, 1,
-1.681245, 0.4425106, -2.62299, 1, 1, 1, 1, 1,
-1.678538, -0.5469001, -3.701564, 1, 1, 1, 1, 1,
-1.675303, -0.3000504, 0.46705, 1, 1, 1, 1, 1,
-1.670041, -0.02755054, 1.013695, 0, 0, 1, 1, 1,
-1.666105, -0.1962182, -0.7857129, 1, 0, 0, 1, 1,
-1.655185, -1.198335, -1.214584, 1, 0, 0, 1, 1,
-1.651649, -1.959346, -1.751347, 1, 0, 0, 1, 1,
-1.651073, 1.852146, -1.440652, 1, 0, 0, 1, 1,
-1.636736, 0.7603732, 0.4568138, 1, 0, 0, 1, 1,
-1.636636, -1.292477, -2.655757, 0, 0, 0, 1, 1,
-1.632901, -1.491358, -2.6913, 0, 0, 0, 1, 1,
-1.630168, -1.406781, -0.4096241, 0, 0, 0, 1, 1,
-1.618116, -1.980639, -3.229964, 0, 0, 0, 1, 1,
-1.608037, 1.328214, -1.170778, 0, 0, 0, 1, 1,
-1.599879, -0.4480311, -0.7294455, 0, 0, 0, 1, 1,
-1.588966, 0.8350561, -2.310966, 0, 0, 0, 1, 1,
-1.575073, 0.4177904, -2.120621, 1, 1, 1, 1, 1,
-1.565303, 0.03828444, -1.812056, 1, 1, 1, 1, 1,
-1.559909, -0.5379069, -3.257311, 1, 1, 1, 1, 1,
-1.546415, 0.8317119, -2.46748, 1, 1, 1, 1, 1,
-1.538172, -0.2471197, -0.6839759, 1, 1, 1, 1, 1,
-1.537175, -0.5222694, -0.428569, 1, 1, 1, 1, 1,
-1.529574, -1.809935, -3.301366, 1, 1, 1, 1, 1,
-1.52375, -1.056264, -1.800481, 1, 1, 1, 1, 1,
-1.522451, -0.7772492, -3.177657, 1, 1, 1, 1, 1,
-1.518785, -0.3466123, -1.684409, 1, 1, 1, 1, 1,
-1.518307, 1.16859, -0.9193106, 1, 1, 1, 1, 1,
-1.49756, -1.166857, -3.784561, 1, 1, 1, 1, 1,
-1.492286, -0.7306805, -1.593237, 1, 1, 1, 1, 1,
-1.486155, 1.229876, -1.108023, 1, 1, 1, 1, 1,
-1.471651, 0.7753279, 0.5182192, 1, 1, 1, 1, 1,
-1.43645, 1.057346, -2.520855, 0, 0, 1, 1, 1,
-1.435923, -0.4885449, -1.20621, 1, 0, 0, 1, 1,
-1.431699, 0.5719864, -1.25404, 1, 0, 0, 1, 1,
-1.430707, 0.09562719, -2.010026, 1, 0, 0, 1, 1,
-1.427059, 0.3899545, 0.2762489, 1, 0, 0, 1, 1,
-1.424122, 0.6751801, -0.804429, 1, 0, 0, 1, 1,
-1.42077, 0.1002033, -1.777852, 0, 0, 0, 1, 1,
-1.416021, -1.312794, -3.004213, 0, 0, 0, 1, 1,
-1.412108, 0.1595884, -1.30173, 0, 0, 0, 1, 1,
-1.39972, 0.7709728, -1.354711, 0, 0, 0, 1, 1,
-1.394437, 0.6166502, -0.45537, 0, 0, 0, 1, 1,
-1.390195, -0.5594746, -1.265812, 0, 0, 0, 1, 1,
-1.384508, -0.11525, -2.645579, 0, 0, 0, 1, 1,
-1.381878, 0.279555, -0.5074724, 1, 1, 1, 1, 1,
-1.381382, -1.926276, -3.021948, 1, 1, 1, 1, 1,
-1.370424, 0.3093722, -1.890928, 1, 1, 1, 1, 1,
-1.368196, -2.656348, -1.463097, 1, 1, 1, 1, 1,
-1.365579, -1.960719, -3.006616, 1, 1, 1, 1, 1,
-1.360486, -2.199857, -1.472999, 1, 1, 1, 1, 1,
-1.344761, -0.401083, -2.37299, 1, 1, 1, 1, 1,
-1.343294, -0.06306388, -1.531764, 1, 1, 1, 1, 1,
-1.328079, 0.33743, -2.058406, 1, 1, 1, 1, 1,
-1.314822, 1.178518, -0.8000119, 1, 1, 1, 1, 1,
-1.30821, -0.6705749, -2.558825, 1, 1, 1, 1, 1,
-1.307924, -0.5066925, -2.532874, 1, 1, 1, 1, 1,
-1.307787, -0.3964809, -1.321169, 1, 1, 1, 1, 1,
-1.291723, -0.4779927, -1.802551, 1, 1, 1, 1, 1,
-1.271276, 0.519155, -0.7627977, 1, 1, 1, 1, 1,
-1.268379, -1.224482, -0.8287663, 0, 0, 1, 1, 1,
-1.267943, 0.3520222, 0.4568021, 1, 0, 0, 1, 1,
-1.262349, 0.9658888, -1.851557, 1, 0, 0, 1, 1,
-1.248443, -1.04353, -3.609717, 1, 0, 0, 1, 1,
-1.242185, -0.05167153, -1.096182, 1, 0, 0, 1, 1,
-1.237348, 1.375822, -0.4341118, 1, 0, 0, 1, 1,
-1.223524, 0.4888994, -2.554796, 0, 0, 0, 1, 1,
-1.214507, 0.7344452, 0.4730765, 0, 0, 0, 1, 1,
-1.21436, -0.3752024, -2.593662, 0, 0, 0, 1, 1,
-1.211324, -1.060377, -2.55559, 0, 0, 0, 1, 1,
-1.209548, -0.5044113, -2.286062, 0, 0, 0, 1, 1,
-1.188542, -0.184238, -1.351143, 0, 0, 0, 1, 1,
-1.162442, 1.24305, -1.682133, 0, 0, 0, 1, 1,
-1.150563, -0.9201942, -3.083065, 1, 1, 1, 1, 1,
-1.149395, 0.3108885, -0.6186656, 1, 1, 1, 1, 1,
-1.143056, -1.561521, -3.027419, 1, 1, 1, 1, 1,
-1.138104, 0.9365022, -2.616516, 1, 1, 1, 1, 1,
-1.13511, 1.302729, -3.068381, 1, 1, 1, 1, 1,
-1.130567, 0.04743284, -1.341724, 1, 1, 1, 1, 1,
-1.128461, -0.3563606, -2.072281, 1, 1, 1, 1, 1,
-1.127403, 0.2871742, 0.01282188, 1, 1, 1, 1, 1,
-1.124053, -1.072583, -2.209452, 1, 1, 1, 1, 1,
-1.1185, -0.01857062, -2.128838, 1, 1, 1, 1, 1,
-1.117593, -0.6267233, -1.715684, 1, 1, 1, 1, 1,
-1.110467, -1.522147, -3.526999, 1, 1, 1, 1, 1,
-1.108411, -0.4955935, -2.51792, 1, 1, 1, 1, 1,
-1.102207, -0.1672717, -2.919879, 1, 1, 1, 1, 1,
-1.099153, 0.4165469, -2.130517, 1, 1, 1, 1, 1,
-1.096096, -0.4688017, -2.613234, 0, 0, 1, 1, 1,
-1.088549, 1.596066, 0.2696872, 1, 0, 0, 1, 1,
-1.076085, 0.04403703, -3.038147, 1, 0, 0, 1, 1,
-1.075541, -0.4927101, -0.7877653, 1, 0, 0, 1, 1,
-1.065313, 1.28862, -0.06112317, 1, 0, 0, 1, 1,
-1.064498, 2.245248, -1.248268, 1, 0, 0, 1, 1,
-1.064476, -1.590762, -3.037953, 0, 0, 0, 1, 1,
-1.06225, -0.1250631, -0.4460964, 0, 0, 0, 1, 1,
-1.05612, 0.4030757, -1.652431, 0, 0, 0, 1, 1,
-1.051102, 0.2781505, -1.477549, 0, 0, 0, 1, 1,
-1.048013, -0.9324328, -2.028575, 0, 0, 0, 1, 1,
-1.047524, 0.34384, -3.645883, 0, 0, 0, 1, 1,
-1.04618, -0.241184, -0.6716233, 0, 0, 0, 1, 1,
-1.029033, -0.6065293, -2.046744, 1, 1, 1, 1, 1,
-1.020507, 0.9143572, 0.9616067, 1, 1, 1, 1, 1,
-1.012173, 1.339346, -0.5582955, 1, 1, 1, 1, 1,
-1.011674, 0.671846, 0.3924214, 1, 1, 1, 1, 1,
-1.007174, 1.252273, -2.301218, 1, 1, 1, 1, 1,
-1.007065, -0.7062681, -4.536778, 1, 1, 1, 1, 1,
-1.005976, 1.371759, -0.1818834, 1, 1, 1, 1, 1,
-0.9911944, 0.5998371, -0.6848492, 1, 1, 1, 1, 1,
-0.9835904, -1.752642, -2.81741, 1, 1, 1, 1, 1,
-0.9808663, -1.503734, -1.794732, 1, 1, 1, 1, 1,
-0.9802483, 0.1247031, -0.4964554, 1, 1, 1, 1, 1,
-0.9796866, -0.2656627, -1.514447, 1, 1, 1, 1, 1,
-0.9757, -0.2553954, -1.385964, 1, 1, 1, 1, 1,
-0.9717719, -1.474688, -3.320435, 1, 1, 1, 1, 1,
-0.9700814, 0.2473172, -2.123525, 1, 1, 1, 1, 1,
-0.9642696, -0.3060284, 0.3310769, 0, 0, 1, 1, 1,
-0.9618225, 0.4727824, -2.5123, 1, 0, 0, 1, 1,
-0.9566036, 1.18045, -0.3317878, 1, 0, 0, 1, 1,
-0.9542205, 0.04479374, -2.40078, 1, 0, 0, 1, 1,
-0.95096, 0.6330429, 0.6564724, 1, 0, 0, 1, 1,
-0.9504297, 1.200343, -0.4682497, 1, 0, 0, 1, 1,
-0.9384038, 1.211568, -0.2137239, 0, 0, 0, 1, 1,
-0.9310753, 0.1572141, -2.125457, 0, 0, 0, 1, 1,
-0.9304166, -2.195181, -3.323164, 0, 0, 0, 1, 1,
-0.9149654, 0.05957732, -2.854302, 0, 0, 0, 1, 1,
-0.9122187, -1.135995, -1.807822, 0, 0, 0, 1, 1,
-0.9094597, 1.199331, 1.366958, 0, 0, 0, 1, 1,
-0.9021576, -0.2727598, -1.429581, 0, 0, 0, 1, 1,
-0.8978351, 0.8630813, -1.475627, 1, 1, 1, 1, 1,
-0.8973327, -0.3890074, -2.704805, 1, 1, 1, 1, 1,
-0.8954732, 0.5786797, -0.6348621, 1, 1, 1, 1, 1,
-0.8878385, 0.280506, -2.990806, 1, 1, 1, 1, 1,
-0.8875971, 0.6893356, 0.05771877, 1, 1, 1, 1, 1,
-0.8803236, 0.03910881, -1.033816, 1, 1, 1, 1, 1,
-0.8779231, -1.264751, -2.699299, 1, 1, 1, 1, 1,
-0.8754052, -0.2551701, -2.931347, 1, 1, 1, 1, 1,
-0.874923, -0.3621011, -1.870765, 1, 1, 1, 1, 1,
-0.8733948, 1.343972, -0.9958715, 1, 1, 1, 1, 1,
-0.8730717, -0.7261182, -2.134175, 1, 1, 1, 1, 1,
-0.871659, -0.3424065, -1.066917, 1, 1, 1, 1, 1,
-0.8703005, 1.650647, -0.6068994, 1, 1, 1, 1, 1,
-0.8697317, 0.05610033, -2.082884, 1, 1, 1, 1, 1,
-0.8683412, -0.3915138, -2.646557, 1, 1, 1, 1, 1,
-0.8681306, 1.626182, -1.787416, 0, 0, 1, 1, 1,
-0.8630517, 0.2077169, -1.924826, 1, 0, 0, 1, 1,
-0.8629091, -1.299903, -2.098814, 1, 0, 0, 1, 1,
-0.8550414, 0.2609893, -0.3572649, 1, 0, 0, 1, 1,
-0.8464864, 0.3643118, -2.380463, 1, 0, 0, 1, 1,
-0.8437606, -0.7860054, -3.063653, 1, 0, 0, 1, 1,
-0.8396287, 0.089946, -1.18647, 0, 0, 0, 1, 1,
-0.8389758, 0.6559536, 0.5252296, 0, 0, 0, 1, 1,
-0.8387559, -0.6296791, -2.303413, 0, 0, 0, 1, 1,
-0.8347237, 0.1895861, -1.449644, 0, 0, 0, 1, 1,
-0.8336287, -1.2027, -2.06869, 0, 0, 0, 1, 1,
-0.8304942, -0.5656735, -2.476249, 0, 0, 0, 1, 1,
-0.8304916, -1.003726, -4.150219, 0, 0, 0, 1, 1,
-0.828851, -0.9607963, -2.788585, 1, 1, 1, 1, 1,
-0.8275998, -0.3628987, -1.980445, 1, 1, 1, 1, 1,
-0.8238893, -1.48445, -2.616044, 1, 1, 1, 1, 1,
-0.812219, -0.07242297, -0.8452134, 1, 1, 1, 1, 1,
-0.7980904, 2.252073, 2.220033, 1, 1, 1, 1, 1,
-0.7834779, 0.5869833, -1.166697, 1, 1, 1, 1, 1,
-0.7680647, 0.3119903, 1.084754, 1, 1, 1, 1, 1,
-0.7627453, 0.06141584, -3.157969, 1, 1, 1, 1, 1,
-0.7549496, 0.6043155, -0.1581642, 1, 1, 1, 1, 1,
-0.7537976, -0.2121414, -1.699475, 1, 1, 1, 1, 1,
-0.7518722, 0.5023138, -0.7289378, 1, 1, 1, 1, 1,
-0.75093, 0.2673424, -1.913863, 1, 1, 1, 1, 1,
-0.7495704, 0.6050066, -1.8553, 1, 1, 1, 1, 1,
-0.7454009, 0.4057694, -1.488934, 1, 1, 1, 1, 1,
-0.7451003, -0.5201086, -3.345854, 1, 1, 1, 1, 1,
-0.7402334, 0.03586808, -1.398063, 0, 0, 1, 1, 1,
-0.7393323, -0.413059, -1.173835, 1, 0, 0, 1, 1,
-0.7328095, 0.5301393, -1.65384, 1, 0, 0, 1, 1,
-0.7293273, -0.4817385, -1.283671, 1, 0, 0, 1, 1,
-0.7280914, 0.03760741, -2.561316, 1, 0, 0, 1, 1,
-0.7239369, 0.06708837, 0.7607881, 1, 0, 0, 1, 1,
-0.7201417, -0.3257179, -3.664974, 0, 0, 0, 1, 1,
-0.7169931, -1.513761, -1.309599, 0, 0, 0, 1, 1,
-0.7144874, 0.5197741, -0.3320962, 0, 0, 0, 1, 1,
-0.713374, -0.6884583, -3.148311, 0, 0, 0, 1, 1,
-0.7129235, 0.01569324, -1.709488, 0, 0, 0, 1, 1,
-0.7045694, 0.3333731, -0.09267469, 0, 0, 0, 1, 1,
-0.7019079, -0.9901926, -2.722125, 0, 0, 0, 1, 1,
-0.6995928, -1.458503, -4.003113, 1, 1, 1, 1, 1,
-0.6933851, 0.0182712, -2.287124, 1, 1, 1, 1, 1,
-0.6923228, 2.272739, 0.7152631, 1, 1, 1, 1, 1,
-0.681453, 0.9055, -0.3233024, 1, 1, 1, 1, 1,
-0.6792077, -0.04521547, -2.809524, 1, 1, 1, 1, 1,
-0.6782792, 0.5663328, -1.045376, 1, 1, 1, 1, 1,
-0.6772031, -0.2491962, -1.510453, 1, 1, 1, 1, 1,
-0.6760986, 0.9449229, -0.6783036, 1, 1, 1, 1, 1,
-0.6657671, 0.3116578, -1.297998, 1, 1, 1, 1, 1,
-0.6619226, -0.4280295, -2.064543, 1, 1, 1, 1, 1,
-0.6574059, 1.461578, -2.399482, 1, 1, 1, 1, 1,
-0.6491144, -1.511328, -2.458612, 1, 1, 1, 1, 1,
-0.6471378, -0.5080807, -2.209582, 1, 1, 1, 1, 1,
-0.6469913, -1.14274, -1.60226, 1, 1, 1, 1, 1,
-0.6404695, 0.1637351, 0.2267112, 1, 1, 1, 1, 1,
-0.6383979, 0.174989, 0.01338778, 0, 0, 1, 1, 1,
-0.6323192, 0.3262533, -1.676375, 1, 0, 0, 1, 1,
-0.6304268, -0.4093165, 0.3654632, 1, 0, 0, 1, 1,
-0.6303622, -0.9030892, -2.61378, 1, 0, 0, 1, 1,
-0.6253335, -1.713822, -1.379976, 1, 0, 0, 1, 1,
-0.6178336, -0.7842745, -1.949543, 1, 0, 0, 1, 1,
-0.6176784, 0.1652135, -1.752679, 0, 0, 0, 1, 1,
-0.615138, 1.287957, -0.4234044, 0, 0, 0, 1, 1,
-0.6139834, -1.087611, -3.293081, 0, 0, 0, 1, 1,
-0.6105066, 0.8372553, -1.871317, 0, 0, 0, 1, 1,
-0.6091709, 1.092168, -2.75212, 0, 0, 0, 1, 1,
-0.6091238, 1.053327, -3.625354, 0, 0, 0, 1, 1,
-0.6049243, 1.691348, -1.032555, 0, 0, 0, 1, 1,
-0.6033663, -0.5400608, -1.100325, 1, 1, 1, 1, 1,
-0.6025013, -0.1847678, -1.176245, 1, 1, 1, 1, 1,
-0.6024278, 0.08054413, -3.01069, 1, 1, 1, 1, 1,
-0.5910128, 0.4669592, -1.96458, 1, 1, 1, 1, 1,
-0.5854845, 0.05957237, -1.292377, 1, 1, 1, 1, 1,
-0.5854059, 1.441674, -0.4849274, 1, 1, 1, 1, 1,
-0.579783, 0.371813, -0.2451387, 1, 1, 1, 1, 1,
-0.5771682, -1.818508, -4.084154, 1, 1, 1, 1, 1,
-0.5763972, 2.12945, -0.4883561, 1, 1, 1, 1, 1,
-0.5760217, -0.6300229, -2.367786, 1, 1, 1, 1, 1,
-0.5734069, -0.3259353, -2.630325, 1, 1, 1, 1, 1,
-0.5642215, -0.4286385, -2.838709, 1, 1, 1, 1, 1,
-0.563455, -1.427466, -3.122623, 1, 1, 1, 1, 1,
-0.5551828, 1.786994, -2.048804, 1, 1, 1, 1, 1,
-0.5518135, -0.9872288, -1.294384, 1, 1, 1, 1, 1,
-0.549166, 0.7722107, -0.7694419, 0, 0, 1, 1, 1,
-0.5452402, -1.854075, -2.995239, 1, 0, 0, 1, 1,
-0.5445453, 1.19905, 2.546382, 1, 0, 0, 1, 1,
-0.5433467, -0.3834746, -0.9857636, 1, 0, 0, 1, 1,
-0.5401338, 0.1961215, -2.27848, 1, 0, 0, 1, 1,
-0.5379325, -1.781104, -2.12388, 1, 0, 0, 1, 1,
-0.5344958, -1.098633, -2.836873, 0, 0, 0, 1, 1,
-0.531535, -0.1493704, -0.0596749, 0, 0, 0, 1, 1,
-0.5310758, 1.221611, -0.5095636, 0, 0, 0, 1, 1,
-0.524066, 0.4828482, 0.01421854, 0, 0, 0, 1, 1,
-0.52189, -2.158641, -3.901275, 0, 0, 0, 1, 1,
-0.5200617, -1.254657, -2.056392, 0, 0, 0, 1, 1,
-0.5164724, 0.3823978, -4.187006, 0, 0, 0, 1, 1,
-0.5146757, 0.3389033, -1.148495, 1, 1, 1, 1, 1,
-0.5141057, 0.5953586, -0.7255262, 1, 1, 1, 1, 1,
-0.506408, -1.338297, -2.77908, 1, 1, 1, 1, 1,
-0.5034043, -0.291804, -1.774975, 1, 1, 1, 1, 1,
-0.5003575, 1.427541, -0.3916636, 1, 1, 1, 1, 1,
-0.4983094, 1.667511, -0.564774, 1, 1, 1, 1, 1,
-0.4893033, -0.2411723, -0.7168766, 1, 1, 1, 1, 1,
-0.4875242, -0.005492518, -1.8237, 1, 1, 1, 1, 1,
-0.4841211, -0.09627622, -1.098786, 1, 1, 1, 1, 1,
-0.4765637, -0.7562236, -2.807235, 1, 1, 1, 1, 1,
-0.474122, 1.152443, -0.5105812, 1, 1, 1, 1, 1,
-0.4724972, 0.3439153, -0.1870633, 1, 1, 1, 1, 1,
-0.4719534, 0.03798351, -2.27496, 1, 1, 1, 1, 1,
-0.4709597, -1.483013, -2.60117, 1, 1, 1, 1, 1,
-0.4692846, 1.141759, -0.3003888, 1, 1, 1, 1, 1,
-0.4680989, -1.018014, -2.20455, 0, 0, 1, 1, 1,
-0.4673642, 1.101919, 0.2779939, 1, 0, 0, 1, 1,
-0.4564222, -1.093972, -2.020501, 1, 0, 0, 1, 1,
-0.4517784, 0.4128751, -1.448511, 1, 0, 0, 1, 1,
-0.4516702, -1.862126, -1.870827, 1, 0, 0, 1, 1,
-0.4494579, 1.239713, -0.8093728, 1, 0, 0, 1, 1,
-0.4481933, 1.009521, -0.07423364, 0, 0, 0, 1, 1,
-0.4460531, 1.177731, -0.9487851, 0, 0, 0, 1, 1,
-0.4443836, 0.3751265, -1.324362, 0, 0, 0, 1, 1,
-0.4432833, 0.1033856, -1.674197, 0, 0, 0, 1, 1,
-0.4319718, 0.07439896, -2.092659, 0, 0, 0, 1, 1,
-0.4248435, -0.08992656, -1.845994, 0, 0, 0, 1, 1,
-0.4218928, -0.847571, -2.225826, 0, 0, 0, 1, 1,
-0.4209981, 0.3752167, -0.2380842, 1, 1, 1, 1, 1,
-0.4205497, -1.881525, -3.508774, 1, 1, 1, 1, 1,
-0.4202031, -0.2221086, -1.328303, 1, 1, 1, 1, 1,
-0.4045476, 0.9741507, -0.6211665, 1, 1, 1, 1, 1,
-0.4012355, -0.7575399, -1.735906, 1, 1, 1, 1, 1,
-0.4007796, 1.015078, -0.3664505, 1, 1, 1, 1, 1,
-0.4007016, 0.7218593, 0.6743279, 1, 1, 1, 1, 1,
-0.3968884, 0.5020398, 0.4628527, 1, 1, 1, 1, 1,
-0.3965848, 0.1870014, -1.119397, 1, 1, 1, 1, 1,
-0.3943411, -0.02398639, -2.30206, 1, 1, 1, 1, 1,
-0.3913905, -0.3538193, -2.442324, 1, 1, 1, 1, 1,
-0.3875945, 1.812079, 0.3680586, 1, 1, 1, 1, 1,
-0.386503, 0.1936401, -0.9547394, 1, 1, 1, 1, 1,
-0.3863902, 0.4856817, 0.109794, 1, 1, 1, 1, 1,
-0.3843251, -1.334048, -4.462486, 1, 1, 1, 1, 1,
-0.3799241, -1.082188, -2.590252, 0, 0, 1, 1, 1,
-0.3786316, -0.1071783, -2.119442, 1, 0, 0, 1, 1,
-0.378461, 1.193853, 0.7439771, 1, 0, 0, 1, 1,
-0.3783405, -0.4459363, -1.217842, 1, 0, 0, 1, 1,
-0.3734892, 0.1488513, -1.700968, 1, 0, 0, 1, 1,
-0.3732705, -1.289027, -3.126461, 1, 0, 0, 1, 1,
-0.3692529, -0.3638536, -1.617048, 0, 0, 0, 1, 1,
-0.3663026, -0.6165369, -2.539587, 0, 0, 0, 1, 1,
-0.3654936, -0.3429263, -4.571858, 0, 0, 0, 1, 1,
-0.3637446, -1.083273, -2.082695, 0, 0, 0, 1, 1,
-0.3616018, -1.630766, -2.182524, 0, 0, 0, 1, 1,
-0.3604822, 0.4185611, 0.07879192, 0, 0, 0, 1, 1,
-0.3593814, 0.4452475, -1.674323, 0, 0, 0, 1, 1,
-0.3586481, -0.7576725, -2.248732, 1, 1, 1, 1, 1,
-0.3532398, 0.9780599, 0.2792946, 1, 1, 1, 1, 1,
-0.3517371, 0.1802, -1.387617, 1, 1, 1, 1, 1,
-0.3490164, 0.440666, -0.8194126, 1, 1, 1, 1, 1,
-0.348419, -0.09955152, -0.168544, 1, 1, 1, 1, 1,
-0.3447624, 0.2076171, -1.262764, 1, 1, 1, 1, 1,
-0.3444593, -0.3500083, -2.789246, 1, 1, 1, 1, 1,
-0.3349487, 0.6178051, -0.3313533, 1, 1, 1, 1, 1,
-0.330613, -0.02423764, 0.4521294, 1, 1, 1, 1, 1,
-0.3289123, -2.076707, -3.046317, 1, 1, 1, 1, 1,
-0.3285981, 0.1674438, -0.6700184, 1, 1, 1, 1, 1,
-0.3275248, -0.1562836, -0.2188005, 1, 1, 1, 1, 1,
-0.3219474, -0.9344578, -4.302167, 1, 1, 1, 1, 1,
-0.3142622, 1.576378, 0.8327124, 1, 1, 1, 1, 1,
-0.3106332, 0.158934, 0.5672574, 1, 1, 1, 1, 1,
-0.3097588, 0.3571542, -0.331166, 0, 0, 1, 1, 1,
-0.3091981, 0.113997, 0.617839, 1, 0, 0, 1, 1,
-0.3039345, -0.1356712, -2.100306, 1, 0, 0, 1, 1,
-0.3005778, 0.1693005, 0.099375, 1, 0, 0, 1, 1,
-0.3002346, 0.5623018, -1.637733, 1, 0, 0, 1, 1,
-0.2976102, 0.3224384, 0.03381131, 1, 0, 0, 1, 1,
-0.2949842, 1.339768, 1.127931, 0, 0, 0, 1, 1,
-0.2946787, 0.251766, -0.8519319, 0, 0, 0, 1, 1,
-0.2935916, -0.01329019, -0.9075032, 0, 0, 0, 1, 1,
-0.2878686, -1.061935, -3.044089, 0, 0, 0, 1, 1,
-0.2842117, -0.157612, -4.149963, 0, 0, 0, 1, 1,
-0.2812698, 1.754034, -1.278663, 0, 0, 0, 1, 1,
-0.2758713, 1.253047, -0.546218, 0, 0, 0, 1, 1,
-0.2753527, -0.6639693, -1.978002, 1, 1, 1, 1, 1,
-0.2731704, 0.6204227, -1.719511, 1, 1, 1, 1, 1,
-0.2721078, 1.692063, 0.0732542, 1, 1, 1, 1, 1,
-0.2702293, 2.423467, -1.003284, 1, 1, 1, 1, 1,
-0.2677885, -0.579869, -1.483018, 1, 1, 1, 1, 1,
-0.2669694, -0.7364582, -1.701488, 1, 1, 1, 1, 1,
-0.2653581, 0.8705304, -0.6652374, 1, 1, 1, 1, 1,
-0.2650436, -0.2392176, -2.032459, 1, 1, 1, 1, 1,
-0.2645385, -0.3923075, -1.625773, 1, 1, 1, 1, 1,
-0.2639008, 2.167416, -0.2056352, 1, 1, 1, 1, 1,
-0.254919, 0.4350617, 2.424362, 1, 1, 1, 1, 1,
-0.2515198, -0.02872412, -0.9297391, 1, 1, 1, 1, 1,
-0.2497134, -0.05094118, 0.03401334, 1, 1, 1, 1, 1,
-0.2488572, -0.807754, -3.15291, 1, 1, 1, 1, 1,
-0.2466203, -0.8532466, -1.90502, 1, 1, 1, 1, 1,
-0.2420182, 0.4753469, -1.568582, 0, 0, 1, 1, 1,
-0.2408897, 0.2214015, -1.784154, 1, 0, 0, 1, 1,
-0.2391042, 0.4494036, -0.1606688, 1, 0, 0, 1, 1,
-0.2384769, 0.3982312, -0.2674989, 1, 0, 0, 1, 1,
-0.2378738, 0.813278, -1.185144, 1, 0, 0, 1, 1,
-0.2336794, 0.2804341, 0.5651535, 1, 0, 0, 1, 1,
-0.2246855, 0.8211965, 0.1071397, 0, 0, 0, 1, 1,
-0.2206115, -1.993984, -4.258548, 0, 0, 0, 1, 1,
-0.2195088, 1.565161, -0.6311181, 0, 0, 0, 1, 1,
-0.2152029, 0.4190798, 0.8651369, 0, 0, 0, 1, 1,
-0.2112937, 1.429921, 0.04742117, 0, 0, 0, 1, 1,
-0.2092686, 0.365561, -0.08511423, 0, 0, 0, 1, 1,
-0.2075219, 0.5009291, -0.3760893, 0, 0, 0, 1, 1,
-0.2021612, 0.7650006, -1.139985, 1, 1, 1, 1, 1,
-0.1986189, -0.1928682, -2.347385, 1, 1, 1, 1, 1,
-0.1964457, -1.026102, -3.75433, 1, 1, 1, 1, 1,
-0.1934234, -0.6829512, -2.300867, 1, 1, 1, 1, 1,
-0.1910182, 0.3629529, 0.4247217, 1, 1, 1, 1, 1,
-0.1893691, 1.002249, -0.7623144, 1, 1, 1, 1, 1,
-0.1857074, -0.2691855, -4.627138, 1, 1, 1, 1, 1,
-0.184785, 0.6303731, 0.08971939, 1, 1, 1, 1, 1,
-0.1847754, -0.477124, -3.287262, 1, 1, 1, 1, 1,
-0.1846562, 0.2999126, -0.8919483, 1, 1, 1, 1, 1,
-0.1838828, -1.386021, -3.344915, 1, 1, 1, 1, 1,
-0.182386, -0.1094939, -2.050289, 1, 1, 1, 1, 1,
-0.1820504, -1.70688, -2.696129, 1, 1, 1, 1, 1,
-0.1807743, -0.8700199, -1.674017, 1, 1, 1, 1, 1,
-0.1796416, 1.223133, 0.3971111, 1, 1, 1, 1, 1,
-0.1776817, -1.378863, -3.444283, 0, 0, 1, 1, 1,
-0.175411, 0.7162383, -1.068769, 1, 0, 0, 1, 1,
-0.1726586, 0.9403911, -0.04713083, 1, 0, 0, 1, 1,
-0.1703056, 1.068816, 2.700162, 1, 0, 0, 1, 1,
-0.1685288, -0.01465205, -2.306732, 1, 0, 0, 1, 1,
-0.1624627, 1.175789, -0.08130768, 1, 0, 0, 1, 1,
-0.161501, -0.7005998, -2.935199, 0, 0, 0, 1, 1,
-0.16136, 2.706582, 0.6003782, 0, 0, 0, 1, 1,
-0.160495, -0.4536605, -1.083822, 0, 0, 0, 1, 1,
-0.1582158, -1.545566, -1.349014, 0, 0, 0, 1, 1,
-0.1502661, 0.7981919, -1.421982, 0, 0, 0, 1, 1,
-0.1457908, 1.772158, 0.8612262, 0, 0, 0, 1, 1,
-0.1450053, -1.519733, -4.071169, 0, 0, 0, 1, 1,
-0.1429663, 1.481249, 0.3827782, 1, 1, 1, 1, 1,
-0.1401749, -1.768414, -3.507307, 1, 1, 1, 1, 1,
-0.1375345, -0.06709248, -0.8180856, 1, 1, 1, 1, 1,
-0.1352155, -0.3767925, -2.902422, 1, 1, 1, 1, 1,
-0.1351022, -0.3776716, -1.920922, 1, 1, 1, 1, 1,
-0.1332829, 0.1360155, -0.8135217, 1, 1, 1, 1, 1,
-0.1243907, -0.9228535, -1.467406, 1, 1, 1, 1, 1,
-0.1217052, 0.5061656, 0.5894571, 1, 1, 1, 1, 1,
-0.1215352, 0.6063945, -1.086452, 1, 1, 1, 1, 1,
-0.1204297, 1.145604, 0.3576933, 1, 1, 1, 1, 1,
-0.1175732, -0.1155423, -2.461342, 1, 1, 1, 1, 1,
-0.1158309, -0.1928942, -1.662197, 1, 1, 1, 1, 1,
-0.1150551, 0.4173011, 0.6732736, 1, 1, 1, 1, 1,
-0.1120678, -0.4934635, -1.728817, 1, 1, 1, 1, 1,
-0.1099652, 0.02040953, -1.740977, 1, 1, 1, 1, 1,
-0.1045931, 0.7133355, 0.5266898, 0, 0, 1, 1, 1,
-0.1031507, 0.4470472, -0.4348348, 1, 0, 0, 1, 1,
-0.1019787, 0.2107602, -0.4166534, 1, 0, 0, 1, 1,
-0.09430149, 0.6011952, -1.626414, 1, 0, 0, 1, 1,
-0.0863764, -0.1386041, -1.006224, 1, 0, 0, 1, 1,
-0.08489884, -0.8992714, -1.340815, 1, 0, 0, 1, 1,
-0.08131772, -0.4556701, -3.192306, 0, 0, 0, 1, 1,
-0.0808956, 0.08730373, -0.6504085, 0, 0, 0, 1, 1,
-0.07967927, -2.13793, -5.007489, 0, 0, 0, 1, 1,
-0.07760636, -1.91676, -0.7334569, 0, 0, 0, 1, 1,
-0.07403138, 1.076128, 1.558585, 0, 0, 0, 1, 1,
-0.07144971, -0.178757, -3.002146, 0, 0, 0, 1, 1,
-0.06578015, 1.005509, 0.1389252, 0, 0, 0, 1, 1,
-0.06329797, -1.383859, -4.391106, 1, 1, 1, 1, 1,
-0.06058064, 0.8112381, -0.4616405, 1, 1, 1, 1, 1,
-0.05998164, 0.03395649, -1.186189, 1, 1, 1, 1, 1,
-0.05734557, 0.5482237, -1.852924, 1, 1, 1, 1, 1,
-0.05525845, 0.3394955, -0.612647, 1, 1, 1, 1, 1,
-0.05274282, 0.6825093, -0.7205736, 1, 1, 1, 1, 1,
-0.05071761, -0.1339833, -1.879735, 1, 1, 1, 1, 1,
-0.04560574, -1.13961, -4.337543, 1, 1, 1, 1, 1,
-0.0436302, 0.818769, -1.068167, 1, 1, 1, 1, 1,
-0.04215622, 1.265048, 0.9068384, 1, 1, 1, 1, 1,
-0.04033559, -0.6712182, -4.98605, 1, 1, 1, 1, 1,
-0.0390184, -1.036471, -3.273077, 1, 1, 1, 1, 1,
-0.03780697, 0.5977749, -0.4303454, 1, 1, 1, 1, 1,
-0.03697851, -0.1295373, -2.983325, 1, 1, 1, 1, 1,
-0.03129656, 1.567004, -0.09762235, 1, 1, 1, 1, 1,
-0.02937375, -0.67837, -3.001544, 0, 0, 1, 1, 1,
-0.0288244, 1.390576, -1.507059, 1, 0, 0, 1, 1,
-0.02757076, 0.7283379, 0.3511548, 1, 0, 0, 1, 1,
-0.02639532, 0.3622589, -2.110013, 1, 0, 0, 1, 1,
-0.02569615, 0.4857551, -1.437091, 1, 0, 0, 1, 1,
-0.02415234, -2.248864, -2.965357, 1, 0, 0, 1, 1,
-0.0197447, -0.4284724, -4.243788, 0, 0, 0, 1, 1,
-0.01662713, 0.04690642, 0.3704813, 0, 0, 0, 1, 1,
-0.01424564, 0.7557864, 0.09345596, 0, 0, 0, 1, 1,
-0.01265001, -0.2922404, -3.483205, 0, 0, 0, 1, 1,
-0.01259258, 0.3052031, 0.3301013, 0, 0, 0, 1, 1,
-0.008961163, 1.058069, 0.6487998, 0, 0, 0, 1, 1,
-0.008926684, -0.1194643, -3.205987, 0, 0, 0, 1, 1,
-0.00669805, 0.7832459, 0.4528722, 1, 1, 1, 1, 1,
-0.0043275, -0.5444617, -3.612198, 1, 1, 1, 1, 1,
-0.002745875, 1.071162, -0.2295566, 1, 1, 1, 1, 1,
-0.002260116, -1.349761, -2.238885, 1, 1, 1, 1, 1,
-0.0022207, -1.432278, -2.128377, 1, 1, 1, 1, 1,
0.0009361948, -1.184135, 1.765083, 1, 1, 1, 1, 1,
0.002491264, -0.3613759, 3.128287, 1, 1, 1, 1, 1,
0.004982468, -0.3419146, 3.434356, 1, 1, 1, 1, 1,
0.006574874, -0.7671601, 5.018878, 1, 1, 1, 1, 1,
0.01306665, -0.441349, 2.225745, 1, 1, 1, 1, 1,
0.01859623, 0.1589131, -0.9541286, 1, 1, 1, 1, 1,
0.01982222, 0.002563926, 2.809261, 1, 1, 1, 1, 1,
0.03042094, -1.111174, 1.161924, 1, 1, 1, 1, 1,
0.03392321, 1.99955, -0.3251231, 1, 1, 1, 1, 1,
0.03504052, 0.6647674, -0.8344638, 1, 1, 1, 1, 1,
0.03602199, 0.3906908, 1.076759, 0, 0, 1, 1, 1,
0.04163859, -1.583992, 2.671073, 1, 0, 0, 1, 1,
0.05146376, 0.9511097, -1.632367, 1, 0, 0, 1, 1,
0.05577864, 0.1652419, 1.211636, 1, 0, 0, 1, 1,
0.0557829, -0.586926, 1.084771, 1, 0, 0, 1, 1,
0.05628988, 0.7591944, -0.7827272, 1, 0, 0, 1, 1,
0.0565167, -1.433053, 3.245867, 0, 0, 0, 1, 1,
0.05756803, -1.084782, 1.068348, 0, 0, 0, 1, 1,
0.0591637, 0.6050631, -0.1876598, 0, 0, 0, 1, 1,
0.06066154, -0.6352844, 2.33471, 0, 0, 0, 1, 1,
0.06086121, 0.7538067, -0.7953482, 0, 0, 0, 1, 1,
0.06156273, 0.4061586, 0.7153622, 0, 0, 0, 1, 1,
0.06356307, -0.03176622, 3.232488, 0, 0, 0, 1, 1,
0.06676709, -0.8957984, 3.777194, 1, 1, 1, 1, 1,
0.06781866, 0.225729, -0.9920723, 1, 1, 1, 1, 1,
0.0698079, 0.7758402, -0.1278687, 1, 1, 1, 1, 1,
0.06983036, -1.97682, 4.815595, 1, 1, 1, 1, 1,
0.07068229, -0.9998906, 2.249491, 1, 1, 1, 1, 1,
0.07284636, 0.4717325, -0.1196086, 1, 1, 1, 1, 1,
0.07626577, -0.7785265, 2.370998, 1, 1, 1, 1, 1,
0.07681647, -0.4946781, 3.328682, 1, 1, 1, 1, 1,
0.08102106, -0.3664233, 1.137033, 1, 1, 1, 1, 1,
0.081398, -0.05354497, 1.730757, 1, 1, 1, 1, 1,
0.08295097, -0.5853409, 2.438333, 1, 1, 1, 1, 1,
0.08574156, -0.1955433, 2.984916, 1, 1, 1, 1, 1,
0.0901778, 0.05717325, 2.58919, 1, 1, 1, 1, 1,
0.09168992, 0.7053754, -0.5276794, 1, 1, 1, 1, 1,
0.09427491, 0.4241616, 2.811382, 1, 1, 1, 1, 1,
0.09594689, -1.364729, 2.711161, 0, 0, 1, 1, 1,
0.09621186, -1.200505, 4.771812, 1, 0, 0, 1, 1,
0.09651088, -0.8068238, 4.207548, 1, 0, 0, 1, 1,
0.1011548, -0.2327872, 2.419942, 1, 0, 0, 1, 1,
0.1038705, 0.6847299, -0.1192489, 1, 0, 0, 1, 1,
0.1092024, 0.5133753, 0.6511368, 1, 0, 0, 1, 1,
0.1100839, 0.4855975, 0.7459016, 0, 0, 0, 1, 1,
0.1123737, 0.7712013, -0.0245887, 0, 0, 0, 1, 1,
0.12117, 1.282337, 1.206955, 0, 0, 0, 1, 1,
0.1243988, 1.29714, 0.4389322, 0, 0, 0, 1, 1,
0.1257069, 0.1199446, 1.724681, 0, 0, 0, 1, 1,
0.1267576, 1.516968, -0.6016789, 0, 0, 0, 1, 1,
0.1288505, -2.640946, 3.45876, 0, 0, 0, 1, 1,
0.129023, -0.4960549, 2.498771, 1, 1, 1, 1, 1,
0.1299816, -0.03868318, 2.562793, 1, 1, 1, 1, 1,
0.1305105, -0.8072013, 3.171528, 1, 1, 1, 1, 1,
0.1347893, -1.463902, 3.559062, 1, 1, 1, 1, 1,
0.135984, -0.5325376, 2.807563, 1, 1, 1, 1, 1,
0.1365793, 0.4506, -0.0369267, 1, 1, 1, 1, 1,
0.144168, 0.7078357, -0.2059366, 1, 1, 1, 1, 1,
0.1449476, 0.1690371, 1.308252, 1, 1, 1, 1, 1,
0.1463231, 0.1982113, -0.000234905, 1, 1, 1, 1, 1,
0.1470672, -0.1073841, 4.636115, 1, 1, 1, 1, 1,
0.1500942, 0.3690831, 0.5386119, 1, 1, 1, 1, 1,
0.1527293, -0.433962, 3.567091, 1, 1, 1, 1, 1,
0.1555308, 0.01279022, 2.269621, 1, 1, 1, 1, 1,
0.1595161, 0.8119296, 1.629427, 1, 1, 1, 1, 1,
0.1599668, -0.7182069, 3.440196, 1, 1, 1, 1, 1,
0.1610297, 1.354726, 0.4687797, 0, 0, 1, 1, 1,
0.1635364, -0.6217515, 3.074648, 1, 0, 0, 1, 1,
0.1655328, 0.2259324, 0.03336691, 1, 0, 0, 1, 1,
0.170272, 0.7108374, 1.50826, 1, 0, 0, 1, 1,
0.1705881, -0.6146783, 3.993357, 1, 0, 0, 1, 1,
0.1710498, 0.9629714, -0.343482, 1, 0, 0, 1, 1,
0.1780554, 0.1467743, 2.743484, 0, 0, 0, 1, 1,
0.1822963, 1.64924, -1.027653, 0, 0, 0, 1, 1,
0.1823708, -0.02269722, 1.831969, 0, 0, 0, 1, 1,
0.1849914, -0.306535, 2.958139, 0, 0, 0, 1, 1,
0.1865613, 0.7527046, 0.4441339, 0, 0, 0, 1, 1,
0.1980504, -0.4012146, 1.713988, 0, 0, 0, 1, 1,
0.2010817, -0.7180406, 5.658173, 0, 0, 0, 1, 1,
0.2025166, -0.9627813, 3.582931, 1, 1, 1, 1, 1,
0.2061615, -0.6473799, 0.4260961, 1, 1, 1, 1, 1,
0.2081476, -0.9774772, 2.455025, 1, 1, 1, 1, 1,
0.2083796, 0.2395462, -1.847888, 1, 1, 1, 1, 1,
0.2125219, -0.07940155, 2.357489, 1, 1, 1, 1, 1,
0.2164185, 0.608498, 0.8047525, 1, 1, 1, 1, 1,
0.2183103, -1.567318, 5.184854, 1, 1, 1, 1, 1,
0.2214417, -2.111762, 3.602235, 1, 1, 1, 1, 1,
0.2247061, -1.83467, 3.777244, 1, 1, 1, 1, 1,
0.2259736, 1.516277, 0.2701915, 1, 1, 1, 1, 1,
0.2307925, 1.663785, -0.6873353, 1, 1, 1, 1, 1,
0.2414228, 0.4815721, 0.7752843, 1, 1, 1, 1, 1,
0.242541, 1.056633, 0.4968515, 1, 1, 1, 1, 1,
0.2430061, 0.01943245, 2.380402, 1, 1, 1, 1, 1,
0.2442311, 0.2610343, 0.6793457, 1, 1, 1, 1, 1,
0.2451404, -0.9480342, 3.60093, 0, 0, 1, 1, 1,
0.2482315, -0.5820854, 2.587214, 1, 0, 0, 1, 1,
0.2486606, 0.5345361, 1.071877, 1, 0, 0, 1, 1,
0.2533472, -0.1560241, 1.732089, 1, 0, 0, 1, 1,
0.2533659, -0.8601953, 1.384387, 1, 0, 0, 1, 1,
0.2542478, 0.9636026, 0.3077078, 1, 0, 0, 1, 1,
0.256702, 2.018225, 0.2065781, 0, 0, 0, 1, 1,
0.2578293, -0.3142745, 0.7547152, 0, 0, 0, 1, 1,
0.2611071, 0.7618538, 1.764087, 0, 0, 0, 1, 1,
0.2620089, -1.118156, 3.429264, 0, 0, 0, 1, 1,
0.2646239, -0.4099322, 1.797299, 0, 0, 0, 1, 1,
0.2647839, 1.389522, -0.6756822, 0, 0, 0, 1, 1,
0.2728225, -0.2979883, 2.980934, 0, 0, 0, 1, 1,
0.2779164, 0.3852567, 0.8697102, 1, 1, 1, 1, 1,
0.2789577, -1.090306, 3.292665, 1, 1, 1, 1, 1,
0.2894574, -0.1062226, 2.261439, 1, 1, 1, 1, 1,
0.2900641, 0.8052358, -0.5396246, 1, 1, 1, 1, 1,
0.2924919, 1.407697, 0.9737236, 1, 1, 1, 1, 1,
0.292853, 0.05764253, 1.632722, 1, 1, 1, 1, 1,
0.2936312, -1.614786, 1.70176, 1, 1, 1, 1, 1,
0.2943844, -1.869158, 4.039073, 1, 1, 1, 1, 1,
0.2960618, -1.189296, 1.925462, 1, 1, 1, 1, 1,
0.2977714, 1.777807, -0.5625387, 1, 1, 1, 1, 1,
0.3025849, 0.04222703, 1.908211, 1, 1, 1, 1, 1,
0.3026855, -0.9634711, 2.752513, 1, 1, 1, 1, 1,
0.305667, -0.868602, 3.067328, 1, 1, 1, 1, 1,
0.3159093, 1.650032, 0.1333527, 1, 1, 1, 1, 1,
0.3174999, 0.5657951, -0.1753741, 1, 1, 1, 1, 1,
0.3217008, -0.9002224, 3.802627, 0, 0, 1, 1, 1,
0.3222094, -0.07108985, 3.921892, 1, 0, 0, 1, 1,
0.3228691, 0.4540967, 1.998702, 1, 0, 0, 1, 1,
0.3249475, -0.7366573, 0.4708232, 1, 0, 0, 1, 1,
0.3260633, -0.001979392, 2.969903, 1, 0, 0, 1, 1,
0.3360673, -0.5983383, 1.165162, 1, 0, 0, 1, 1,
0.3376572, 1.160052, 1.348775, 0, 0, 0, 1, 1,
0.3394153, -0.2676914, 2.201639, 0, 0, 0, 1, 1,
0.3394876, 1.129716, -0.4006684, 0, 0, 0, 1, 1,
0.3395461, -0.01216914, 1.640202, 0, 0, 0, 1, 1,
0.339913, 0.6199656, 0.7673423, 0, 0, 0, 1, 1,
0.3424764, -1.233109, 2.323603, 0, 0, 0, 1, 1,
0.3433855, -0.8755908, 2.953903, 0, 0, 0, 1, 1,
0.3445412, -0.5238362, 2.173569, 1, 1, 1, 1, 1,
0.3446235, 0.9983639, 0.3401961, 1, 1, 1, 1, 1,
0.3465945, 1.404487, 1.606631, 1, 1, 1, 1, 1,
0.3467036, -2.215589, 2.548842, 1, 1, 1, 1, 1,
0.3529394, 0.7192869, -1.076758, 1, 1, 1, 1, 1,
0.355991, 1.253309, -0.1443978, 1, 1, 1, 1, 1,
0.3579744, -0.1349414, 2.047252, 1, 1, 1, 1, 1,
0.3588358, -1.448811, 5.000045, 1, 1, 1, 1, 1,
0.3588871, -0.5309551, 2.909591, 1, 1, 1, 1, 1,
0.3621081, 0.8162136, 1.656416, 1, 1, 1, 1, 1,
0.3637533, 0.003828254, 1.87182, 1, 1, 1, 1, 1,
0.3648275, 1.04405, -0.574745, 1, 1, 1, 1, 1,
0.3651499, 0.4254528, 1.340169, 1, 1, 1, 1, 1,
0.3658011, -0.6167735, 2.823024, 1, 1, 1, 1, 1,
0.3682672, 0.3104016, 1.962848, 1, 1, 1, 1, 1,
0.3690104, 0.797869, 1.182516, 0, 0, 1, 1, 1,
0.3760563, 0.5790164, 0.694914, 1, 0, 0, 1, 1,
0.3763796, 1.268346, 0.05009868, 1, 0, 0, 1, 1,
0.3793106, 0.1126504, 1.399207, 1, 0, 0, 1, 1,
0.3809255, -0.1779929, 2.506818, 1, 0, 0, 1, 1,
0.3830914, 0.3276142, 1.791547, 1, 0, 0, 1, 1,
0.3834508, 0.851779, 0.6733296, 0, 0, 0, 1, 1,
0.3858427, -0.514627, 3.433988, 0, 0, 0, 1, 1,
0.3919306, 0.5164725, 1.785525, 0, 0, 0, 1, 1,
0.393984, 1.577891, 0.990384, 0, 0, 0, 1, 1,
0.3969428, -0.3185387, 2.573685, 0, 0, 0, 1, 1,
0.3999217, -0.9674997, 2.087733, 0, 0, 0, 1, 1,
0.4013927, -2.840435, 3.126558, 0, 0, 0, 1, 1,
0.4049518, -0.1929168, 3.108369, 1, 1, 1, 1, 1,
0.411195, -0.01109037, 2.669064, 1, 1, 1, 1, 1,
0.4147839, -0.5650588, 4.158702, 1, 1, 1, 1, 1,
0.415718, 1.512315, -0.1407297, 1, 1, 1, 1, 1,
0.4169059, -0.1378885, 2.278015, 1, 1, 1, 1, 1,
0.4183246, 0.07156201, 2.001947, 1, 1, 1, 1, 1,
0.4207994, 0.3939232, 1.665578, 1, 1, 1, 1, 1,
0.4230721, -0.08762547, 2.326637, 1, 1, 1, 1, 1,
0.4235169, 1.581791, 0.3648373, 1, 1, 1, 1, 1,
0.4249341, -0.563904, 4.103195, 1, 1, 1, 1, 1,
0.4261502, 2.679621, 0.03601096, 1, 1, 1, 1, 1,
0.4273526, -1.121351, 3.702843, 1, 1, 1, 1, 1,
0.4408668, 0.01193698, 3.094274, 1, 1, 1, 1, 1,
0.4495839, -1.684101, 1.506554, 1, 1, 1, 1, 1,
0.452433, 2.848763, -1.161059, 1, 1, 1, 1, 1,
0.4550309, -0.4136709, 2.886807, 0, 0, 1, 1, 1,
0.4579391, 0.5042121, 3.222529, 1, 0, 0, 1, 1,
0.4621771, -1.054581, 2.35819, 1, 0, 0, 1, 1,
0.4727191, 1.042009, -1.01035, 1, 0, 0, 1, 1,
0.4741384, -1.149377, 1.448055, 1, 0, 0, 1, 1,
0.4744822, -0.9634424, 3.578145, 1, 0, 0, 1, 1,
0.4768516, 0.0774026, 0.5208418, 0, 0, 0, 1, 1,
0.4783964, 0.5791033, 1.782914, 0, 0, 0, 1, 1,
0.4785929, 2.490345, 0.7801561, 0, 0, 0, 1, 1,
0.4798021, -2.61576, 1.869841, 0, 0, 0, 1, 1,
0.4883409, 1.931448, -0.3445876, 0, 0, 0, 1, 1,
0.4904461, -1.519182, 3.150028, 0, 0, 0, 1, 1,
0.4921188, -0.6913334, 2.693851, 0, 0, 0, 1, 1,
0.4935955, -1.382763, 1.360109, 1, 1, 1, 1, 1,
0.4936509, 0.01758943, 3.377587, 1, 1, 1, 1, 1,
0.5009101, 0.07674906, 2.859436, 1, 1, 1, 1, 1,
0.5014957, -0.3620135, 2.264531, 1, 1, 1, 1, 1,
0.5044379, 1.069887, -0.2215778, 1, 1, 1, 1, 1,
0.5074387, -0.3504304, 1.213818, 1, 1, 1, 1, 1,
0.5102847, -0.4664952, 2.535944, 1, 1, 1, 1, 1,
0.5113299, 2.054911, 0.08728778, 1, 1, 1, 1, 1,
0.513977, -1.658627, 3.521455, 1, 1, 1, 1, 1,
0.5141774, 0.5660458, 0.7161811, 1, 1, 1, 1, 1,
0.5186154, -0.8413401, 2.737613, 1, 1, 1, 1, 1,
0.5227112, 0.4917525, 2.642914, 1, 1, 1, 1, 1,
0.5230808, -0.4760268, 3.37129, 1, 1, 1, 1, 1,
0.5249433, 0.4760879, 2.517689, 1, 1, 1, 1, 1,
0.5274093, 1.747917, 1.320852, 1, 1, 1, 1, 1,
0.5362714, -0.5215953, 3.703014, 0, 0, 1, 1, 1,
0.5386068, 0.2542939, 0.4333117, 1, 0, 0, 1, 1,
0.5472494, -0.7983273, 2.956532, 1, 0, 0, 1, 1,
0.5532367, 1.166924, 1.072955, 1, 0, 0, 1, 1,
0.5554464, 0.4040938, 0.7489522, 1, 0, 0, 1, 1,
0.5580253, -0.8803681, 2.466313, 1, 0, 0, 1, 1,
0.5705719, 0.3994345, 3.332996, 0, 0, 0, 1, 1,
0.5715172, -0.3933668, 0.6262996, 0, 0, 0, 1, 1,
0.5794247, -0.599192, 0.8029777, 0, 0, 0, 1, 1,
0.579524, 0.418554, 1.925888, 0, 0, 0, 1, 1,
0.5795454, 1.122224, 0.8792769, 0, 0, 0, 1, 1,
0.5807306, 0.661122, -0.01168876, 0, 0, 0, 1, 1,
0.5811778, -0.9033378, 2.105098, 0, 0, 0, 1, 1,
0.5825123, 0.7977825, 1.108079, 1, 1, 1, 1, 1,
0.5832547, -0.9517123, 1.796845, 1, 1, 1, 1, 1,
0.5875896, -1.801546, -0.009086103, 1, 1, 1, 1, 1,
0.5926846, 0.7647985, -0.3729058, 1, 1, 1, 1, 1,
0.600861, 0.3956713, 2.074214, 1, 1, 1, 1, 1,
0.6053736, -0.03998583, 1.366426, 1, 1, 1, 1, 1,
0.6054401, 0.7988136, -0.2669402, 1, 1, 1, 1, 1,
0.6061346, -2.194112, 1.48125, 1, 1, 1, 1, 1,
0.6068693, 1.815133, 0.2331623, 1, 1, 1, 1, 1,
0.6091149, -0.3361269, 3.55106, 1, 1, 1, 1, 1,
0.609217, -0.2395175, 2.643601, 1, 1, 1, 1, 1,
0.6139223, -0.8946708, 1.787026, 1, 1, 1, 1, 1,
0.6218631, -0.308706, 1.296853, 1, 1, 1, 1, 1,
0.6232741, 0.384077, 2.342088, 1, 1, 1, 1, 1,
0.6299421, 0.8426986, -1.14329, 1, 1, 1, 1, 1,
0.6318185, -0.4933046, 4.140065, 0, 0, 1, 1, 1,
0.6327831, 1.241233, 0.1633218, 1, 0, 0, 1, 1,
0.6422615, 0.01482754, 3.560204, 1, 0, 0, 1, 1,
0.6455116, 0.5396903, 0.1482038, 1, 0, 0, 1, 1,
0.6467316, 0.4527451, 3.148493, 1, 0, 0, 1, 1,
0.6476342, 0.4872399, -0.2809561, 1, 0, 0, 1, 1,
0.6545889, 0.33272, 3.508531, 0, 0, 0, 1, 1,
0.6577851, -1.016297, 1.661151, 0, 0, 0, 1, 1,
0.6586799, 0.1411445, 1.821787, 0, 0, 0, 1, 1,
0.6648492, 0.6952783, 1.020803, 0, 0, 0, 1, 1,
0.6656687, -0.4890885, 2.141656, 0, 0, 0, 1, 1,
0.6709149, 0.05214692, 1.342917, 0, 0, 0, 1, 1,
0.6735001, 1.223009, -0.8580633, 0, 0, 0, 1, 1,
0.6750073, 0.3730024, 2.896982, 1, 1, 1, 1, 1,
0.6818409, 0.2671264, 1.165826, 1, 1, 1, 1, 1,
0.6855609, -0.3300589, 3.56748, 1, 1, 1, 1, 1,
0.688364, 0.7940975, -0.1389263, 1, 1, 1, 1, 1,
0.6884853, 1.221539, -0.5881265, 1, 1, 1, 1, 1,
0.6895239, -0.3134181, 1.828989, 1, 1, 1, 1, 1,
0.6914307, -0.3822244, 1.217555, 1, 1, 1, 1, 1,
0.6968258, 1.120475, -0.09541984, 1, 1, 1, 1, 1,
0.7006225, 0.8234136, 0.366037, 1, 1, 1, 1, 1,
0.7038979, -2.266658, 2.555496, 1, 1, 1, 1, 1,
0.7081684, 0.4676663, 0.9822184, 1, 1, 1, 1, 1,
0.7085392, -0.6725919, 2.219163, 1, 1, 1, 1, 1,
0.70906, 0.392946, 1.091066, 1, 1, 1, 1, 1,
0.7132849, 0.540193, 1.359875, 1, 1, 1, 1, 1,
0.7136085, 0.2426758, 0.4988408, 1, 1, 1, 1, 1,
0.7144485, -1.094706, 3.64374, 0, 0, 1, 1, 1,
0.72029, 0.5128816, 2.502924, 1, 0, 0, 1, 1,
0.7324042, 0.6640981, 1.485592, 1, 0, 0, 1, 1,
0.7400144, -0.4707135, 4.257979, 1, 0, 0, 1, 1,
0.7407283, -0.7661478, 2.594601, 1, 0, 0, 1, 1,
0.7450517, -1.219553, 0.6156067, 1, 0, 0, 1, 1,
0.7466342, 0.6178073, 0.3447443, 0, 0, 0, 1, 1,
0.7494268, 1.283618, -0.2202288, 0, 0, 0, 1, 1,
0.7511572, -0.003899411, 0.1434598, 0, 0, 0, 1, 1,
0.7517447, 1.624686, -0.3654316, 0, 0, 0, 1, 1,
0.7523569, 0.119288, 1.540895, 0, 0, 0, 1, 1,
0.7549877, -0.3479635, 0.8914608, 0, 0, 0, 1, 1,
0.7637183, 1.624289, -1.326306, 0, 0, 0, 1, 1,
0.7695299, 0.4313436, 1.62569, 1, 1, 1, 1, 1,
0.773862, -0.02767758, 1.011559, 1, 1, 1, 1, 1,
0.7776449, -0.3624634, 1.148673, 1, 1, 1, 1, 1,
0.7809917, -0.1838843, 2.012051, 1, 1, 1, 1, 1,
0.7816768, 0.5862299, 1.522271, 1, 1, 1, 1, 1,
0.7851731, 0.535377, 2.386599, 1, 1, 1, 1, 1,
0.7858067, -0.3986163, 1.975439, 1, 1, 1, 1, 1,
0.7888936, -1.588681, 3.106304, 1, 1, 1, 1, 1,
0.7896858, 2.376771, 0.8112552, 1, 1, 1, 1, 1,
0.7898222, 0.1632277, 0.9754255, 1, 1, 1, 1, 1,
0.7905732, -0.03406468, 1.484486, 1, 1, 1, 1, 1,
0.7906317, 0.8798717, 0.8692513, 1, 1, 1, 1, 1,
0.7950384, 0.2423643, 1.627641, 1, 1, 1, 1, 1,
0.7972985, -0.6019899, 3.952173, 1, 1, 1, 1, 1,
0.7992624, 0.8088371, 0.6148467, 1, 1, 1, 1, 1,
0.7997491, 0.8986106, 0.627882, 0, 0, 1, 1, 1,
0.8024173, 1.80878, 2.454934, 1, 0, 0, 1, 1,
0.8110281, 1.105619, 1.638768, 1, 0, 0, 1, 1,
0.8155734, 0.06751192, 0.9472641, 1, 0, 0, 1, 1,
0.8214836, -0.4873705, 2.111488, 1, 0, 0, 1, 1,
0.8222483, 0.01356637, 2.130068, 1, 0, 0, 1, 1,
0.8232949, -0.566266, 1.196284, 0, 0, 0, 1, 1,
0.8261802, 0.04681012, 3.138957, 0, 0, 0, 1, 1,
0.826837, -0.6938414, 3.503453, 0, 0, 0, 1, 1,
0.8303508, 0.7503644, 1.191295, 0, 0, 0, 1, 1,
0.8328746, 0.2267529, 2.276212, 0, 0, 0, 1, 1,
0.8338419, 1.656548, 1.125689, 0, 0, 0, 1, 1,
0.838987, 1.007574, 0.1708154, 0, 0, 0, 1, 1,
0.8398663, 0.194866, 0.0399776, 1, 1, 1, 1, 1,
0.8433245, -0.3450488, 2.440896, 1, 1, 1, 1, 1,
0.8520166, -0.7117224, -0.2757617, 1, 1, 1, 1, 1,
0.8669859, 1.301243, 1.063416, 1, 1, 1, 1, 1,
0.8673989, 0.4070981, 2.117315, 1, 1, 1, 1, 1,
0.8720796, -0.9374017, 1.791972, 1, 1, 1, 1, 1,
0.8784515, -1.345378, 0.8180201, 1, 1, 1, 1, 1,
0.8851554, -1.177568, 2.760076, 1, 1, 1, 1, 1,
0.8865488, -0.5286621, 2.605962, 1, 1, 1, 1, 1,
0.8874635, -1.035389, 3.222153, 1, 1, 1, 1, 1,
0.891353, -1.081974, 1.84123, 1, 1, 1, 1, 1,
0.8917226, -1.060771, 3.455861, 1, 1, 1, 1, 1,
0.8924108, 0.03636849, 2.395806, 1, 1, 1, 1, 1,
0.8979508, -2.134859, 2.510506, 1, 1, 1, 1, 1,
0.9003177, -1.136416, 2.623292, 1, 1, 1, 1, 1,
0.9051709, -0.3520773, 2.759401, 0, 0, 1, 1, 1,
0.9115254, 1.563815, 1.928716, 1, 0, 0, 1, 1,
0.9130093, -0.4552005, 1.232166, 1, 0, 0, 1, 1,
0.9147134, -0.3429744, 2.991035, 1, 0, 0, 1, 1,
0.9184729, -0.0506193, 1.716125, 1, 0, 0, 1, 1,
0.9200529, 0.1097025, 2.182082, 1, 0, 0, 1, 1,
0.9222455, 0.8620192, 1.807612, 0, 0, 0, 1, 1,
0.9230962, 1.511132, -0.1962973, 0, 0, 0, 1, 1,
0.9241735, -2.252125, 3.032535, 0, 0, 0, 1, 1,
0.9261447, -0.7221808, 0.7342239, 0, 0, 0, 1, 1,
0.9269436, 1.483289, 1.145318, 0, 0, 0, 1, 1,
0.9326224, 0.6114125, 0.2707116, 0, 0, 0, 1, 1,
0.9384249, 1.378223, 0.4653823, 0, 0, 0, 1, 1,
0.9421382, 0.6317732, 0.8806164, 1, 1, 1, 1, 1,
0.942378, 0.6619542, 1.433208, 1, 1, 1, 1, 1,
0.9484293, 1.159906, 0.3051451, 1, 1, 1, 1, 1,
0.9486908, -0.5523497, 2.924967, 1, 1, 1, 1, 1,
0.9518335, 0.9154054, 0.3798779, 1, 1, 1, 1, 1,
0.9539395, 0.09542183, 1.244877, 1, 1, 1, 1, 1,
0.9607297, 0.7636462, 1.144579, 1, 1, 1, 1, 1,
0.9638211, 0.5703439, 1.75648, 1, 1, 1, 1, 1,
0.9773515, -0.920756, 2.485814, 1, 1, 1, 1, 1,
0.9893286, 0.3657288, 2.366114, 1, 1, 1, 1, 1,
0.9905091, -1.689153, 4.398686, 1, 1, 1, 1, 1,
0.9906133, 0.2930777, 1.524146, 1, 1, 1, 1, 1,
0.9931604, 1.326021, 1.538515, 1, 1, 1, 1, 1,
1.000435, 1.75183, 1.037736, 1, 1, 1, 1, 1,
1.007173, -0.2388918, 0.8046915, 1, 1, 1, 1, 1,
1.011374, 0.5006574, 1.448787, 0, 0, 1, 1, 1,
1.018118, 0.126159, 0.1832219, 1, 0, 0, 1, 1,
1.01959, 0.06919014, 1.037529, 1, 0, 0, 1, 1,
1.02863, -1.05109, 3.111803, 1, 0, 0, 1, 1,
1.037556, 0.2066711, 1.802544, 1, 0, 0, 1, 1,
1.044219, 0.09567447, 1.774902, 1, 0, 0, 1, 1,
1.049857, 0.3807324, 2.513894, 0, 0, 0, 1, 1,
1.055977, -2.056235, 3.42178, 0, 0, 0, 1, 1,
1.056427, -0.8381243, 1.8852, 0, 0, 0, 1, 1,
1.058824, 0.5729135, 0.8909248, 0, 0, 0, 1, 1,
1.059552, 0.9388108, 0.5672134, 0, 0, 0, 1, 1,
1.06552, -0.4080864, 3.885859, 0, 0, 0, 1, 1,
1.069523, 0.2403455, 2.401617, 0, 0, 0, 1, 1,
1.0808, 0.6573487, 1.533053, 1, 1, 1, 1, 1,
1.106952, 0.6752169, 1.695302, 1, 1, 1, 1, 1,
1.108338, 0.5178939, -0.009691498, 1, 1, 1, 1, 1,
1.10909, -0.3649642, 2.126711, 1, 1, 1, 1, 1,
1.114632, 0.133439, 1.250002, 1, 1, 1, 1, 1,
1.117504, 0.5062953, 3.205738, 1, 1, 1, 1, 1,
1.119218, -0.9816731, 0.1614373, 1, 1, 1, 1, 1,
1.123429, 0.8518698, 3.531765, 1, 1, 1, 1, 1,
1.124364, 2.303195, 0.2381038, 1, 1, 1, 1, 1,
1.124669, 1.674321, 1.911584, 1, 1, 1, 1, 1,
1.126004, -0.1327567, 1.347886, 1, 1, 1, 1, 1,
1.128013, 0.4385537, 2.337352, 1, 1, 1, 1, 1,
1.131574, 0.5955428, 0.8387348, 1, 1, 1, 1, 1,
1.13679, 0.5896239, 0.3989682, 1, 1, 1, 1, 1,
1.138514, -0.7272754, 1.239002, 1, 1, 1, 1, 1,
1.139521, -0.8662233, 2.552565, 0, 0, 1, 1, 1,
1.143199, 1.145495, 0.2821728, 1, 0, 0, 1, 1,
1.145383, 1.02942, 0.1625086, 1, 0, 0, 1, 1,
1.156405, 0.3321151, 0.6578064, 1, 0, 0, 1, 1,
1.168091, -0.1306775, 2.676999, 1, 0, 0, 1, 1,
1.170774, -1.564953, 2.670556, 1, 0, 0, 1, 1,
1.175567, -0.6899475, 0.917024, 0, 0, 0, 1, 1,
1.182098, -1.283371, 1.473904, 0, 0, 0, 1, 1,
1.184466, 2.519179, 1.007526, 0, 0, 0, 1, 1,
1.189358, 0.9499146, 1.497435, 0, 0, 0, 1, 1,
1.191961, 0.01495026, 0.9507104, 0, 0, 0, 1, 1,
1.203687, -0.07298139, 1.185228, 0, 0, 0, 1, 1,
1.210152, 0.1039417, 2.88781, 0, 0, 0, 1, 1,
1.215089, 0.6315061, 0.06600579, 1, 1, 1, 1, 1,
1.216601, -0.3746928, 2.782958, 1, 1, 1, 1, 1,
1.222744, 0.2021037, 1.264465, 1, 1, 1, 1, 1,
1.223517, -1.693943, 2.443142, 1, 1, 1, 1, 1,
1.234659, -0.2226361, 2.266937, 1, 1, 1, 1, 1,
1.244155, -1.013869, 2.794618, 1, 1, 1, 1, 1,
1.244955, 0.8142713, 0.8516788, 1, 1, 1, 1, 1,
1.249267, -0.08239129, 2.120452, 1, 1, 1, 1, 1,
1.249449, 0.5823635, 1.044227, 1, 1, 1, 1, 1,
1.250017, 2.7055, -0.1689952, 1, 1, 1, 1, 1,
1.25033, -0.1804766, 1.670946, 1, 1, 1, 1, 1,
1.253161, -0.921441, 2.072873, 1, 1, 1, 1, 1,
1.265211, 1.285235, 1.356393, 1, 1, 1, 1, 1,
1.27233, -0.3680833, 1.139406, 1, 1, 1, 1, 1,
1.275185, 0.3119166, 0.3770224, 1, 1, 1, 1, 1,
1.275907, -0.3682937, 2.512956, 0, 0, 1, 1, 1,
1.280731, -0.2228341, 2.162583, 1, 0, 0, 1, 1,
1.288, 0.3629685, -0.4821212, 1, 0, 0, 1, 1,
1.290853, -1.849889, 1.432843, 1, 0, 0, 1, 1,
1.296748, -0.9643572, 0.911825, 1, 0, 0, 1, 1,
1.299861, -0.05768326, 4.94935, 1, 0, 0, 1, 1,
1.304287, -0.09681782, 2.263189, 0, 0, 0, 1, 1,
1.310423, -0.847383, 3.568907, 0, 0, 0, 1, 1,
1.31678, 1.010141, 1.622267, 0, 0, 0, 1, 1,
1.317519, 2.983163, 2.71773, 0, 0, 0, 1, 1,
1.319033, 1.012031, -1.13853, 0, 0, 0, 1, 1,
1.322304, -0.7458494, 2.739024, 0, 0, 0, 1, 1,
1.323366, -2.246723, 1.690127, 0, 0, 0, 1, 1,
1.324291, -0.4544981, 2.890133, 1, 1, 1, 1, 1,
1.326035, 0.9665419, 2.072285, 1, 1, 1, 1, 1,
1.329823, 0.635052, -0.5170248, 1, 1, 1, 1, 1,
1.331604, 0.2352187, 1.20035, 1, 1, 1, 1, 1,
1.333404, -0.3382272, 3.186768, 1, 1, 1, 1, 1,
1.346542, -1.389574, 3.334707, 1, 1, 1, 1, 1,
1.350149, -0.10553, 1.842073, 1, 1, 1, 1, 1,
1.357239, -1.279415, 1.583191, 1, 1, 1, 1, 1,
1.361323, 0.3501175, 1.342372, 1, 1, 1, 1, 1,
1.372223, -0.4431562, 1.471531, 1, 1, 1, 1, 1,
1.374935, 0.1013519, 1.786349, 1, 1, 1, 1, 1,
1.375076, 0.8972843, 0.7266869, 1, 1, 1, 1, 1,
1.375088, 1.180455, 2.609826, 1, 1, 1, 1, 1,
1.397934, 0.1839806, 2.335486, 1, 1, 1, 1, 1,
1.40266, -0.6519306, 2.814095, 1, 1, 1, 1, 1,
1.414716, -2.223112, 2.883442, 0, 0, 1, 1, 1,
1.420629, -0.006094773, 2.30159, 1, 0, 0, 1, 1,
1.427391, -0.2508842, 4.218922, 1, 0, 0, 1, 1,
1.436205, 0.6873792, 0.1804602, 1, 0, 0, 1, 1,
1.438969, 0.6679351, 0.3894416, 1, 0, 0, 1, 1,
1.446451, -0.5332569, 0.5147617, 1, 0, 0, 1, 1,
1.452297, -0.2854717, 1.823854, 0, 0, 0, 1, 1,
1.458565, 1.153903, -0.4601083, 0, 0, 0, 1, 1,
1.460858, 0.1692509, 0.5607811, 0, 0, 0, 1, 1,
1.46103, -0.1123923, 2.043816, 0, 0, 0, 1, 1,
1.462295, -0.7898061, 2.685572, 0, 0, 0, 1, 1,
1.464622, -0.6676896, 3.317153, 0, 0, 0, 1, 1,
1.479244, -1.406608, 2.976462, 0, 0, 0, 1, 1,
1.484331, -0.6301644, 1.45557, 1, 1, 1, 1, 1,
1.48589, 0.07153297, 1.996981, 1, 1, 1, 1, 1,
1.492151, 0.9044892, -0.1117613, 1, 1, 1, 1, 1,
1.494351, 0.1113453, -0.1710628, 1, 1, 1, 1, 1,
1.500223, -1.305885, 1.767083, 1, 1, 1, 1, 1,
1.503735, -0.7518947, 3.496295, 1, 1, 1, 1, 1,
1.504106, -0.1472976, 2.124979, 1, 1, 1, 1, 1,
1.517952, 0.5880476, 1.348797, 1, 1, 1, 1, 1,
1.519184, 0.3995909, 2.372192, 1, 1, 1, 1, 1,
1.527116, -1.323184, 2.50949, 1, 1, 1, 1, 1,
1.527694, -0.1193989, 0.7135485, 1, 1, 1, 1, 1,
1.536116, 0.5228528, 2.406535, 1, 1, 1, 1, 1,
1.542482, -0.00322128, 2.948196, 1, 1, 1, 1, 1,
1.542714, 1.344042, 1.044801, 1, 1, 1, 1, 1,
1.544505, 1.764784, 1.027389, 1, 1, 1, 1, 1,
1.561342, -0.3222711, 1.458648, 0, 0, 1, 1, 1,
1.567843, -0.5856059, 1.78989, 1, 0, 0, 1, 1,
1.592379, -0.2193969, 2.922708, 1, 0, 0, 1, 1,
1.593027, 0.3337527, 0.9880813, 1, 0, 0, 1, 1,
1.621317, 0.4695396, 2.073274, 1, 0, 0, 1, 1,
1.63155, 0.4508127, -1.072937, 1, 0, 0, 1, 1,
1.641599, -0.4930081, 0.2555062, 0, 0, 0, 1, 1,
1.650902, -0.04998929, 1.716188, 0, 0, 0, 1, 1,
1.670413, -0.7596934, 1.5277, 0, 0, 0, 1, 1,
1.67399, 1.434641, 1.723886, 0, 0, 0, 1, 1,
1.681224, -1.376952, 2.867322, 0, 0, 0, 1, 1,
1.682638, -0.993832, 2.971108, 0, 0, 0, 1, 1,
1.683737, -0.8475406, 0.5119963, 0, 0, 0, 1, 1,
1.689619, -0.259603, 1.306579, 1, 1, 1, 1, 1,
1.692829, -0.392496, 0.2080657, 1, 1, 1, 1, 1,
1.713414, -0.07614499, 3.215192, 1, 1, 1, 1, 1,
1.716044, -0.3105804, 2.252479, 1, 1, 1, 1, 1,
1.733055, 0.2712405, 3.06131, 1, 1, 1, 1, 1,
1.737414, 0.2405226, 1.608136, 1, 1, 1, 1, 1,
1.779022, -0.5776572, 2.377594, 1, 1, 1, 1, 1,
1.800637, -0.6839105, 0.1837067, 1, 1, 1, 1, 1,
1.838154, 0.04790894, -0.6479458, 1, 1, 1, 1, 1,
1.857502, -0.1880622, 2.364725, 1, 1, 1, 1, 1,
1.866024, 1.116785, 1.626139, 1, 1, 1, 1, 1,
1.900911, 0.001960401, 2.151324, 1, 1, 1, 1, 1,
2.011329, 1.021106, 1.388173, 1, 1, 1, 1, 1,
2.021394, 0.5195438, 0.2851136, 1, 1, 1, 1, 1,
2.037704, 0.1941513, 1.028016, 1, 1, 1, 1, 1,
2.057762, 1.235614, 0.56311, 0, 0, 1, 1, 1,
2.084426, -0.04876246, 2.645761, 1, 0, 0, 1, 1,
2.102661, 0.6860636, -0.2195534, 1, 0, 0, 1, 1,
2.140701, 1.358321, 0.7397237, 1, 0, 0, 1, 1,
2.144141, 0.3793039, 0.267336, 1, 0, 0, 1, 1,
2.229929, 0.1110957, 2.080415, 1, 0, 0, 1, 1,
2.327312, -1.237791, 2.409311, 0, 0, 0, 1, 1,
2.329581, 0.982747, 1.464342, 0, 0, 0, 1, 1,
2.330821, -1.798006, 2.143032, 0, 0, 0, 1, 1,
2.363071, -0.8284434, 2.610797, 0, 0, 0, 1, 1,
2.367165, 1.255639, 0.07597072, 0, 0, 0, 1, 1,
2.374931, 1.336766, 1.910818, 0, 0, 0, 1, 1,
2.377126, -1.358376, 2.910432, 0, 0, 0, 1, 1,
2.400259, 1.020167, 1.706095, 1, 1, 1, 1, 1,
2.4868, 0.8976429, 1.321394, 1, 1, 1, 1, 1,
2.63103, -1.608034, 1.612975, 1, 1, 1, 1, 1,
2.644505, 0.8555678, 2.348181, 1, 1, 1, 1, 1,
2.645689, -0.0332152, 0.8164363, 1, 1, 1, 1, 1,
2.700714, 0.9625075, 0.8726454, 1, 1, 1, 1, 1,
3.550892, -0.1680567, 2.124107, 1, 1, 1, 1, 1
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
var radius = 9.400304;
var distance = 33.01817;
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
mvMatrix.translate( -0.4020425, -0.07136416, -0.2930803 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.01817);
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
