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
-3.247375, 0.09409721, -0.6829376, 1, 0, 0, 1,
-3.199517, 1.303383, -1.431331, 1, 0.007843138, 0, 1,
-2.690944, 1.03518, -1.904602, 1, 0.01176471, 0, 1,
-2.635574, 0.9204276, -0.4107578, 1, 0.01960784, 0, 1,
-2.512073, 0.2285309, -1.211049, 1, 0.02352941, 0, 1,
-2.414772, -0.7062106, -3.950872, 1, 0.03137255, 0, 1,
-2.265094, -0.2789736, -0.842821, 1, 0.03529412, 0, 1,
-2.171587, 0.4765925, -0.7833324, 1, 0.04313726, 0, 1,
-2.165966, -0.772936, -3.805966, 1, 0.04705882, 0, 1,
-2.165266, -1.228723, -1.849542, 1, 0.05490196, 0, 1,
-2.152901, -1.872589, -2.828468, 1, 0.05882353, 0, 1,
-2.150085, -0.5292875, -1.116646, 1, 0.06666667, 0, 1,
-2.135227, 1.456088, -0.3046806, 1, 0.07058824, 0, 1,
-2.127655, -0.3714263, -0.2780771, 1, 0.07843138, 0, 1,
-2.109971, 1.18733, -0.8656561, 1, 0.08235294, 0, 1,
-2.099108, -0.7792735, -1.398222, 1, 0.09019608, 0, 1,
-2.070044, 2.024331, 0.07446548, 1, 0.09411765, 0, 1,
-2.065383, -0.1974118, -0.7665334, 1, 0.1019608, 0, 1,
-2.011738, -0.5428237, -0.2628068, 1, 0.1098039, 0, 1,
-1.999324, 0.203437, 1.47632, 1, 0.1137255, 0, 1,
-1.989002, -2.162099, -2.027255, 1, 0.1215686, 0, 1,
-1.976912, 0.663715, -2.524026, 1, 0.1254902, 0, 1,
-1.968974, -1.55859, -1.229995, 1, 0.1333333, 0, 1,
-1.96592, -0.6249055, -1.637074, 1, 0.1372549, 0, 1,
-1.918814, -0.8025537, -2.157603, 1, 0.145098, 0, 1,
-1.890852, -0.0860739, -1.7358, 1, 0.1490196, 0, 1,
-1.882809, 0.5351838, -1.651498, 1, 0.1568628, 0, 1,
-1.879006, -0.433741, -2.639901, 1, 0.1607843, 0, 1,
-1.850989, 0.4412879, -0.9667233, 1, 0.1686275, 0, 1,
-1.834612, -0.1014156, -2.343009, 1, 0.172549, 0, 1,
-1.811613, 1.234844, -0.7248903, 1, 0.1803922, 0, 1,
-1.810309, -2.286635, -1.808435, 1, 0.1843137, 0, 1,
-1.804112, -0.2213024, -1.437595, 1, 0.1921569, 0, 1,
-1.798581, 0.03543785, -1.96609, 1, 0.1960784, 0, 1,
-1.78499, 2.264083, -0.9674047, 1, 0.2039216, 0, 1,
-1.772885, 1.1281, 0.3365032, 1, 0.2117647, 0, 1,
-1.768195, -1.780328, -3.569894, 1, 0.2156863, 0, 1,
-1.75807, -0.1365728, -3.056413, 1, 0.2235294, 0, 1,
-1.746728, -1.434769, -1.837334, 1, 0.227451, 0, 1,
-1.739758, -0.08433216, -1.035254, 1, 0.2352941, 0, 1,
-1.731665, 1.138547, -1.314693, 1, 0.2392157, 0, 1,
-1.72902, 0.2038977, -1.461907, 1, 0.2470588, 0, 1,
-1.724164, 1.141209, -1.424868, 1, 0.2509804, 0, 1,
-1.700262, 1.481008, 0.3620674, 1, 0.2588235, 0, 1,
-1.677983, -0.8149235, -2.883389, 1, 0.2627451, 0, 1,
-1.677461, 0.4974674, 0.09768907, 1, 0.2705882, 0, 1,
-1.674617, -0.3728307, -3.884913, 1, 0.2745098, 0, 1,
-1.669129, -0.7278271, -2.931247, 1, 0.282353, 0, 1,
-1.648046, 1.158912, -1.221919, 1, 0.2862745, 0, 1,
-1.645621, 0.07042767, -0.04727874, 1, 0.2941177, 0, 1,
-1.643144, -0.5028518, -0.878506, 1, 0.3019608, 0, 1,
-1.6425, -0.749295, -0.398104, 1, 0.3058824, 0, 1,
-1.63798, -0.3092657, -2.290776, 1, 0.3137255, 0, 1,
-1.62817, 0.03662375, 0.2863733, 1, 0.3176471, 0, 1,
-1.626847, 0.5466534, -1.260925, 1, 0.3254902, 0, 1,
-1.619117, 0.5199131, 0.02718536, 1, 0.3294118, 0, 1,
-1.61695, -1.175362, -1.867803, 1, 0.3372549, 0, 1,
-1.615807, 0.5682958, -1.219528, 1, 0.3411765, 0, 1,
-1.614408, -1.104849, -3.292688, 1, 0.3490196, 0, 1,
-1.600346, -0.9161588, -0.9798558, 1, 0.3529412, 0, 1,
-1.594889, -1.189724, -2.270665, 1, 0.3607843, 0, 1,
-1.583372, -0.6028225, -2.24597, 1, 0.3647059, 0, 1,
-1.578004, -1.432063, -1.336982, 1, 0.372549, 0, 1,
-1.568053, -0.06131252, -3.335575, 1, 0.3764706, 0, 1,
-1.549551, 0.227724, -1.014706, 1, 0.3843137, 0, 1,
-1.549375, 0.4130532, -0.7864088, 1, 0.3882353, 0, 1,
-1.545201, -1.771397, -1.764684, 1, 0.3960784, 0, 1,
-1.539211, 1.308162, -1.721788, 1, 0.4039216, 0, 1,
-1.493927, -1.196486, -1.226233, 1, 0.4078431, 0, 1,
-1.482964, -0.1719219, -1.043419, 1, 0.4156863, 0, 1,
-1.482041, 0.0490811, -1.176524, 1, 0.4196078, 0, 1,
-1.474851, 0.3284273, -1.950323, 1, 0.427451, 0, 1,
-1.473826, 1.390584, -1.436014, 1, 0.4313726, 0, 1,
-1.450856, 0.7190195, -2.460375, 1, 0.4392157, 0, 1,
-1.447109, 0.3177821, -1.438642, 1, 0.4431373, 0, 1,
-1.419656, -0.4227985, -2.531204, 1, 0.4509804, 0, 1,
-1.410503, -0.8529736, -1.46285, 1, 0.454902, 0, 1,
-1.403578, 0.988557, -1.478559, 1, 0.4627451, 0, 1,
-1.396096, -0.09508987, -2.368015, 1, 0.4666667, 0, 1,
-1.393866, 0.2509526, -0.6680428, 1, 0.4745098, 0, 1,
-1.387063, 0.4841765, -2.329137, 1, 0.4784314, 0, 1,
-1.384602, -1.037668, -1.449853, 1, 0.4862745, 0, 1,
-1.375532, 0.4052832, -0.4436619, 1, 0.4901961, 0, 1,
-1.375348, 0.8376917, -1.481482, 1, 0.4980392, 0, 1,
-1.369158, 0.2063589, -1.096278, 1, 0.5058824, 0, 1,
-1.362981, -0.3460711, -1.791621, 1, 0.509804, 0, 1,
-1.359917, -0.7913946, -0.8840008, 1, 0.5176471, 0, 1,
-1.359233, -0.2123444, -0.3161407, 1, 0.5215687, 0, 1,
-1.358097, -0.7470865, -2.611025, 1, 0.5294118, 0, 1,
-1.357546, -2.307752, -4.292239, 1, 0.5333334, 0, 1,
-1.35587, 0.2470553, -1.206458, 1, 0.5411765, 0, 1,
-1.343611, 0.3758493, -1.40187, 1, 0.5450981, 0, 1,
-1.336742, 0.9789841, 0.2556135, 1, 0.5529412, 0, 1,
-1.324721, -0.2484917, -0.2384188, 1, 0.5568628, 0, 1,
-1.323094, -1.260231, -2.899476, 1, 0.5647059, 0, 1,
-1.322892, -0.1360862, -0.548372, 1, 0.5686275, 0, 1,
-1.312046, 0.5393817, 0.1808922, 1, 0.5764706, 0, 1,
-1.308985, -1.539326, -0.4149998, 1, 0.5803922, 0, 1,
-1.303353, -2.160693, -2.527161, 1, 0.5882353, 0, 1,
-1.303254, 1.032291, -0.01316031, 1, 0.5921569, 0, 1,
-1.302265, -0.4708745, -0.7594762, 1, 0.6, 0, 1,
-1.30074, -1.209802, -0.8299637, 1, 0.6078432, 0, 1,
-1.288266, 0.1942049, -1.193689, 1, 0.6117647, 0, 1,
-1.287492, 0.4174291, -0.3875792, 1, 0.6196079, 0, 1,
-1.281958, 2.235141, -0.4723138, 1, 0.6235294, 0, 1,
-1.274125, 1.276114, 0.3182972, 1, 0.6313726, 0, 1,
-1.268995, -0.2449025, -1.114248, 1, 0.6352941, 0, 1,
-1.264259, 0.1480615, -0.7246075, 1, 0.6431373, 0, 1,
-1.259778, -0.1800353, -0.7770029, 1, 0.6470588, 0, 1,
-1.256698, -0.211589, -2.194025, 1, 0.654902, 0, 1,
-1.255335, 3.163712, 1.302969, 1, 0.6588235, 0, 1,
-1.253877, 1.846961, -1.269152, 1, 0.6666667, 0, 1,
-1.244747, 2.660838, -1.332833, 1, 0.6705883, 0, 1,
-1.210435, -1.215261, -4.724465, 1, 0.6784314, 0, 1,
-1.206205, 0.34233, -0.2877171, 1, 0.682353, 0, 1,
-1.201939, 1.550904, -1.474993, 1, 0.6901961, 0, 1,
-1.20038, -0.7788963, -1.297765, 1, 0.6941177, 0, 1,
-1.185096, -0.1160419, -1.885848, 1, 0.7019608, 0, 1,
-1.184815, -0.2658941, -1.407689, 1, 0.7098039, 0, 1,
-1.183942, 0.429903, -0.2988764, 1, 0.7137255, 0, 1,
-1.180202, 0.7326726, -1.576994, 1, 0.7215686, 0, 1,
-1.17997, -0.14394, -1.272318, 1, 0.7254902, 0, 1,
-1.169524, -0.6179494, -0.7469568, 1, 0.7333333, 0, 1,
-1.166835, -0.8310756, -2.230703, 1, 0.7372549, 0, 1,
-1.14705, -1.815454, -3.124148, 1, 0.7450981, 0, 1,
-1.14438, 0.1878304, -2.970109, 1, 0.7490196, 0, 1,
-1.141418, 1.274881, -2.001393, 1, 0.7568628, 0, 1,
-1.14066, -1.824772, -2.91135, 1, 0.7607843, 0, 1,
-1.140236, 1.366758, -0.9340654, 1, 0.7686275, 0, 1,
-1.136954, 0.5140493, -1.965676, 1, 0.772549, 0, 1,
-1.131728, -1.409478, -2.065264, 1, 0.7803922, 0, 1,
-1.12925, 0.4216588, -0.9627063, 1, 0.7843137, 0, 1,
-1.125588, -0.9127494, -1.835247, 1, 0.7921569, 0, 1,
-1.114246, -0.63574, -3.430712, 1, 0.7960784, 0, 1,
-1.112122, 1.065534, -1.34526, 1, 0.8039216, 0, 1,
-1.105328, -0.8450783, -2.354327, 1, 0.8117647, 0, 1,
-1.101451, -1.806202, -0.8803135, 1, 0.8156863, 0, 1,
-1.099091, 1.15055, -2.050283, 1, 0.8235294, 0, 1,
-1.096131, 0.5439461, -0.528757, 1, 0.827451, 0, 1,
-1.093408, -0.4761225, -1.69644, 1, 0.8352941, 0, 1,
-1.090418, -0.8059275, -2.557539, 1, 0.8392157, 0, 1,
-1.08924, -1.623781, -2.356213, 1, 0.8470588, 0, 1,
-1.085957, 0.1990961, -1.638137, 1, 0.8509804, 0, 1,
-1.055934, -1.188117, -2.236727, 1, 0.8588235, 0, 1,
-1.055432, 0.7668158, -0.9906066, 1, 0.8627451, 0, 1,
-1.045151, -2.071337, -0.9814071, 1, 0.8705882, 0, 1,
-1.039415, -1.273812, -2.136324, 1, 0.8745098, 0, 1,
-1.038556, -1.174683, -1.683025, 1, 0.8823529, 0, 1,
-1.028679, -0.4487605, -3.191332, 1, 0.8862745, 0, 1,
-1.025854, 2.479356, -0.1771297, 1, 0.8941177, 0, 1,
-1.018493, -0.7393081, -3.025482, 1, 0.8980392, 0, 1,
-1.017631, -1.824465, -3.374549, 1, 0.9058824, 0, 1,
-1.016703, 0.5741766, 0.6074272, 1, 0.9137255, 0, 1,
-1.008949, 1.524415, -1.914533, 1, 0.9176471, 0, 1,
-1.006416, -2.283197, -2.352677, 1, 0.9254902, 0, 1,
-1.005239, 1.176009, -0.833611, 1, 0.9294118, 0, 1,
-0.9891818, -0.5097417, -2.542902, 1, 0.9372549, 0, 1,
-0.9859252, -0.4885209, -3.738154, 1, 0.9411765, 0, 1,
-0.9760497, 0.6558525, 0.5088294, 1, 0.9490196, 0, 1,
-0.9750936, -0.1769477, -1.756083, 1, 0.9529412, 0, 1,
-0.9734965, 0.1988471, -0.7094923, 1, 0.9607843, 0, 1,
-0.9660689, -0.179885, -1.917952, 1, 0.9647059, 0, 1,
-0.9634476, 0.07741017, 1.266092, 1, 0.972549, 0, 1,
-0.9629049, -1.490175, -2.052259, 1, 0.9764706, 0, 1,
-0.960012, -1.435853, -2.065347, 1, 0.9843137, 0, 1,
-0.9599558, 0.001334402, -1.036012, 1, 0.9882353, 0, 1,
-0.9556735, -0.442047, -0.9774742, 1, 0.9960784, 0, 1,
-0.9539421, -0.2533115, -0.129498, 0.9960784, 1, 0, 1,
-0.9502308, -0.4508652, -1.948065, 0.9921569, 1, 0, 1,
-0.947231, -0.4491197, -1.32711, 0.9843137, 1, 0, 1,
-0.9431491, -1.671276, -1.946851, 0.9803922, 1, 0, 1,
-0.93528, 0.01195468, -0.7959543, 0.972549, 1, 0, 1,
-0.929913, -0.9771762, -1.715478, 0.9686275, 1, 0, 1,
-0.9279254, -0.1945098, -2.924772, 0.9607843, 1, 0, 1,
-0.9277811, -0.2865937, -0.4821884, 0.9568627, 1, 0, 1,
-0.9270424, -0.1688253, -0.9803186, 0.9490196, 1, 0, 1,
-0.9239463, 1.380401, -1.580251, 0.945098, 1, 0, 1,
-0.9231776, -2.392072, -5.149093, 0.9372549, 1, 0, 1,
-0.9230068, -0.3212577, -1.544257, 0.9333333, 1, 0, 1,
-0.9214027, 0.2034098, -0.2067194, 0.9254902, 1, 0, 1,
-0.9155049, -0.3594002, -2.365727, 0.9215686, 1, 0, 1,
-0.9081599, -1.125968, -3.10454, 0.9137255, 1, 0, 1,
-0.9044685, -0.5174542, -1.268721, 0.9098039, 1, 0, 1,
-0.9032629, -0.8999098, -0.7878888, 0.9019608, 1, 0, 1,
-0.9025774, 0.1593114, -0.906451, 0.8941177, 1, 0, 1,
-0.8894814, 0.15294, -0.7716495, 0.8901961, 1, 0, 1,
-0.8854504, 0.6854691, -0.2578589, 0.8823529, 1, 0, 1,
-0.8824684, -0.7603142, -0.9901876, 0.8784314, 1, 0, 1,
-0.8809502, -0.1515349, -2.126922, 0.8705882, 1, 0, 1,
-0.8789514, 1.152168, 0.878279, 0.8666667, 1, 0, 1,
-0.8769644, 0.248429, -1.932304, 0.8588235, 1, 0, 1,
-0.8757815, -0.4028031, -2.10955, 0.854902, 1, 0, 1,
-0.860211, 0.6142375, 0.2763587, 0.8470588, 1, 0, 1,
-0.8601009, 0.1844279, -1.720752, 0.8431373, 1, 0, 1,
-0.8583871, 0.4172942, 0.1878704, 0.8352941, 1, 0, 1,
-0.8569095, -0.4810938, -1.054786, 0.8313726, 1, 0, 1,
-0.8514031, -0.3288499, -2.977468, 0.8235294, 1, 0, 1,
-0.8486182, 1.193131, -0.7069159, 0.8196079, 1, 0, 1,
-0.8386434, -0.2526362, -1.527995, 0.8117647, 1, 0, 1,
-0.8379602, -1.272316, -2.623229, 0.8078431, 1, 0, 1,
-0.8335328, -1.401549, -3.308264, 0.8, 1, 0, 1,
-0.8323812, 1.560276, -2.311464, 0.7921569, 1, 0, 1,
-0.8256644, -2.938306, -4.326621, 0.7882353, 1, 0, 1,
-0.8151921, 0.5259209, -0.8847172, 0.7803922, 1, 0, 1,
-0.8132247, -0.5284344, -1.87805, 0.7764706, 1, 0, 1,
-0.8109141, -1.434813, -0.9878812, 0.7686275, 1, 0, 1,
-0.8108141, 2.204738, -0.9901338, 0.7647059, 1, 0, 1,
-0.8078468, -1.045183, -1.565688, 0.7568628, 1, 0, 1,
-0.8028126, -1.167747, -2.966319, 0.7529412, 1, 0, 1,
-0.8026235, 0.2233102, 0.04158796, 0.7450981, 1, 0, 1,
-0.8018315, -2.235446, -2.066512, 0.7411765, 1, 0, 1,
-0.8005605, 1.310509, -0.8417393, 0.7333333, 1, 0, 1,
-0.7994556, -1.350129, -2.896727, 0.7294118, 1, 0, 1,
-0.7978703, 1.682796, -1.043746, 0.7215686, 1, 0, 1,
-0.7928996, 0.3656745, -1.582187, 0.7176471, 1, 0, 1,
-0.7919556, -0.3274386, -2.839338, 0.7098039, 1, 0, 1,
-0.7905579, 0.9344838, 0.1545633, 0.7058824, 1, 0, 1,
-0.7904406, -0.6468121, -2.342048, 0.6980392, 1, 0, 1,
-0.7890646, 0.2227527, -2.217884, 0.6901961, 1, 0, 1,
-0.7867994, -0.1172963, -2.764663, 0.6862745, 1, 0, 1,
-0.7858235, 0.317809, -2.992661, 0.6784314, 1, 0, 1,
-0.785814, -0.8878472, -2.363207, 0.6745098, 1, 0, 1,
-0.7834671, -1.776253, -3.536484, 0.6666667, 1, 0, 1,
-0.7834668, -0.3236089, -2.540875, 0.6627451, 1, 0, 1,
-0.7744194, -0.3447354, -2.839037, 0.654902, 1, 0, 1,
-0.7716323, 0.9498022, -0.9665298, 0.6509804, 1, 0, 1,
-0.7684538, -0.2628746, 0.3000798, 0.6431373, 1, 0, 1,
-0.7661072, 1.888631, -0.4555356, 0.6392157, 1, 0, 1,
-0.7653717, -1.371608, -2.804483, 0.6313726, 1, 0, 1,
-0.7611057, 1.626828, -0.1555421, 0.627451, 1, 0, 1,
-0.7607453, -1.692183, -4.048697, 0.6196079, 1, 0, 1,
-0.7596498, -0.5067709, -2.431712, 0.6156863, 1, 0, 1,
-0.7594444, -1.642655, -2.430146, 0.6078432, 1, 0, 1,
-0.7578821, -0.3136486, -2.013619, 0.6039216, 1, 0, 1,
-0.7551202, 0.1619764, -1.643828, 0.5960785, 1, 0, 1,
-0.7547777, -0.1093583, -1.413139, 0.5882353, 1, 0, 1,
-0.7465397, -0.04816656, -0.8232751, 0.5843138, 1, 0, 1,
-0.7450734, 1.496341, 1.941189, 0.5764706, 1, 0, 1,
-0.7423481, 0.7501493, -1.394027, 0.572549, 1, 0, 1,
-0.7423084, 1.484571, -0.09568512, 0.5647059, 1, 0, 1,
-0.7365615, 0.3167504, -1.756968, 0.5607843, 1, 0, 1,
-0.7341083, -1.397827, -1.120293, 0.5529412, 1, 0, 1,
-0.7341073, -1.47036, -2.712901, 0.5490196, 1, 0, 1,
-0.7323917, 0.9598268, -0.3448094, 0.5411765, 1, 0, 1,
-0.7261626, -0.4937, -4.47763, 0.5372549, 1, 0, 1,
-0.7217947, -1.278099, -4.343979, 0.5294118, 1, 0, 1,
-0.7109336, -0.175449, -1.297172, 0.5254902, 1, 0, 1,
-0.7094318, 0.8849717, 0.6036965, 0.5176471, 1, 0, 1,
-0.6792454, -1.920651, -2.588571, 0.5137255, 1, 0, 1,
-0.6746512, 1.375222, -1.633074, 0.5058824, 1, 0, 1,
-0.6745009, 0.6830277, 0.2617514, 0.5019608, 1, 0, 1,
-0.6733097, -1.052132, -4.092265, 0.4941176, 1, 0, 1,
-0.6726426, 3.044407, 0.9249201, 0.4862745, 1, 0, 1,
-0.6698367, -0.6192604, -1.795367, 0.4823529, 1, 0, 1,
-0.6690628, -0.7163382, -2.726081, 0.4745098, 1, 0, 1,
-0.6668565, 0.4627644, 0.1591845, 0.4705882, 1, 0, 1,
-0.6604853, 1.63728, -1.249053, 0.4627451, 1, 0, 1,
-0.6535847, -0.7841638, -2.423562, 0.4588235, 1, 0, 1,
-0.6535632, 0.3261172, -0.6784485, 0.4509804, 1, 0, 1,
-0.6522266, -1.413389, -3.877328, 0.4470588, 1, 0, 1,
-0.6521319, -0.01509109, -1.000982, 0.4392157, 1, 0, 1,
-0.649657, 0.6711414, -1.32858, 0.4352941, 1, 0, 1,
-0.6485717, 1.722384, -0.1191987, 0.427451, 1, 0, 1,
-0.6482794, 0.524231, 1.115683, 0.4235294, 1, 0, 1,
-0.64627, -0.3797902, -2.473442, 0.4156863, 1, 0, 1,
-0.6451847, -1.672212, -1.497544, 0.4117647, 1, 0, 1,
-0.6451645, -0.8971886, -1.592488, 0.4039216, 1, 0, 1,
-0.6447864, 1.257314, -2.433454, 0.3960784, 1, 0, 1,
-0.6419885, -1.162565, -1.008392, 0.3921569, 1, 0, 1,
-0.6392776, -0.312496, -1.561815, 0.3843137, 1, 0, 1,
-0.6288724, -0.1875625, -0.8166867, 0.3803922, 1, 0, 1,
-0.624958, 0.4790994, -1.873363, 0.372549, 1, 0, 1,
-0.6170312, -1.598684, -3.72791, 0.3686275, 1, 0, 1,
-0.6158959, -0.2385145, -3.192518, 0.3607843, 1, 0, 1,
-0.6093737, -0.3059653, -1.905594, 0.3568628, 1, 0, 1,
-0.6075818, 1.3487, 0.2230612, 0.3490196, 1, 0, 1,
-0.6050633, -0.02366929, -0.7385904, 0.345098, 1, 0, 1,
-0.5983307, 0.1235617, -2.565006, 0.3372549, 1, 0, 1,
-0.5957701, 0.2905183, -1.27421, 0.3333333, 1, 0, 1,
-0.5931832, -0.2921195, -3.629361, 0.3254902, 1, 0, 1,
-0.5921375, 0.8125392, -1.036106, 0.3215686, 1, 0, 1,
-0.5896646, -0.3567118, -2.580705, 0.3137255, 1, 0, 1,
-0.585852, 1.036487, -0.1153537, 0.3098039, 1, 0, 1,
-0.5857721, 0.9653361, -2.661515, 0.3019608, 1, 0, 1,
-0.5799881, -0.7612153, -0.4698229, 0.2941177, 1, 0, 1,
-0.5796251, -0.4156799, -2.817143, 0.2901961, 1, 0, 1,
-0.5788937, -1.153201, -1.49967, 0.282353, 1, 0, 1,
-0.5751348, -0.929344, -2.006654, 0.2784314, 1, 0, 1,
-0.5707629, 1.136973, 0.1403102, 0.2705882, 1, 0, 1,
-0.5664653, -0.6883409, -2.18626, 0.2666667, 1, 0, 1,
-0.5626578, 0.5611085, 0.9488167, 0.2588235, 1, 0, 1,
-0.5601717, 0.5471616, 0.8235664, 0.254902, 1, 0, 1,
-0.560074, 0.1976632, -1.142256, 0.2470588, 1, 0, 1,
-0.5587229, 2.055984, -2.517451, 0.2431373, 1, 0, 1,
-0.5585631, 1.343385, -0.3117059, 0.2352941, 1, 0, 1,
-0.5576829, -1.116005, -1.805433, 0.2313726, 1, 0, 1,
-0.5561413, 1.071744, 0.583738, 0.2235294, 1, 0, 1,
-0.5520928, -1.364775, -3.52569, 0.2196078, 1, 0, 1,
-0.5490847, 0.4336902, -0.3908818, 0.2117647, 1, 0, 1,
-0.5449874, 0.5359658, -2.576605, 0.2078431, 1, 0, 1,
-0.5432162, -0.8419805, -1.137922, 0.2, 1, 0, 1,
-0.5402025, -1.231457, -3.553879, 0.1921569, 1, 0, 1,
-0.5381103, 1.750132, 0.3038037, 0.1882353, 1, 0, 1,
-0.5377057, 1.040586, -1.153872, 0.1803922, 1, 0, 1,
-0.5365404, 0.4801761, -0.7039697, 0.1764706, 1, 0, 1,
-0.5313247, -0.9919877, -4.094153, 0.1686275, 1, 0, 1,
-0.5302147, -2.53313, -4.094148, 0.1647059, 1, 0, 1,
-0.5300135, 1.253524, -0.09289632, 0.1568628, 1, 0, 1,
-0.5273349, -0.6476867, -0.9590253, 0.1529412, 1, 0, 1,
-0.5236639, -0.05094746, -3.254075, 0.145098, 1, 0, 1,
-0.519439, -0.0716769, -2.624796, 0.1411765, 1, 0, 1,
-0.5183321, 1.884959, -0.3883299, 0.1333333, 1, 0, 1,
-0.516191, -0.670625, -2.684356, 0.1294118, 1, 0, 1,
-0.513534, -1.506862, -2.753907, 0.1215686, 1, 0, 1,
-0.5085599, 0.5632085, 0.05116937, 0.1176471, 1, 0, 1,
-0.506129, -0.6299964, -2.414005, 0.1098039, 1, 0, 1,
-0.4893155, 0.05849499, -2.061668, 0.1058824, 1, 0, 1,
-0.4891031, -0.9838088, -2.109731, 0.09803922, 1, 0, 1,
-0.4870486, 0.169947, -2.214362, 0.09019608, 1, 0, 1,
-0.4858254, 0.8705234, 2.283103, 0.08627451, 1, 0, 1,
-0.4856074, 1.430189, -1.165041, 0.07843138, 1, 0, 1,
-0.4815233, -0.442028, -3.024697, 0.07450981, 1, 0, 1,
-0.4802773, -1.079685, -3.578128, 0.06666667, 1, 0, 1,
-0.4795822, -0.6945143, -1.753152, 0.0627451, 1, 0, 1,
-0.466057, -0.7884594, -2.378983, 0.05490196, 1, 0, 1,
-0.4658817, -0.1508591, -3.027519, 0.05098039, 1, 0, 1,
-0.4588282, -0.1343354, -3.992271, 0.04313726, 1, 0, 1,
-0.4581571, -0.1288336, -1.793006, 0.03921569, 1, 0, 1,
-0.4538202, 0.371653, -0.2805373, 0.03137255, 1, 0, 1,
-0.4501378, -0.4066991, -0.9601203, 0.02745098, 1, 0, 1,
-0.4487948, 0.4520468, -1.316469, 0.01960784, 1, 0, 1,
-0.4484618, -1.494739, -2.061389, 0.01568628, 1, 0, 1,
-0.4346746, 1.255784, -0.6710297, 0.007843138, 1, 0, 1,
-0.4328966, 0.6619823, -0.7036852, 0.003921569, 1, 0, 1,
-0.4305483, 0.7357878, -0.97745, 0, 1, 0.003921569, 1,
-0.4282954, 0.2406117, -1.604233, 0, 1, 0.01176471, 1,
-0.4243649, 0.4112094, 0.1171264, 0, 1, 0.01568628, 1,
-0.4236251, -0.3765389, -2.519398, 0, 1, 0.02352941, 1,
-0.4221685, 0.4206387, -0.4736316, 0, 1, 0.02745098, 1,
-0.4116117, -1.325501, -2.918329, 0, 1, 0.03529412, 1,
-0.4094565, -1.099529, -2.39093, 0, 1, 0.03921569, 1,
-0.4052297, 0.7131606, 0.3079293, 0, 1, 0.04705882, 1,
-0.4033964, 1.058487, 1.368616, 0, 1, 0.05098039, 1,
-0.3981796, 1.307917, -0.5261803, 0, 1, 0.05882353, 1,
-0.397254, -1.299201, -3.183438, 0, 1, 0.0627451, 1,
-0.3902977, -0.5076397, -3.019565, 0, 1, 0.07058824, 1,
-0.3880547, -1.070291, -3.181626, 0, 1, 0.07450981, 1,
-0.377794, 1.894498, -1.301063, 0, 1, 0.08235294, 1,
-0.3776817, 0.1245868, 0.1591088, 0, 1, 0.08627451, 1,
-0.3750557, 0.4633819, 1.291665, 0, 1, 0.09411765, 1,
-0.3693253, -0.757292, -3.15283, 0, 1, 0.1019608, 1,
-0.3666221, 1.173143, 0.4361067, 0, 1, 0.1058824, 1,
-0.3658805, -2.136298, -2.140722, 0, 1, 0.1137255, 1,
-0.3638322, 1.402864, -0.186814, 0, 1, 0.1176471, 1,
-0.361577, 0.3785708, -0.6480258, 0, 1, 0.1254902, 1,
-0.3589196, -0.1218074, -0.5949739, 0, 1, 0.1294118, 1,
-0.3588782, -0.6701905, -2.498986, 0, 1, 0.1372549, 1,
-0.3581893, -0.6773449, -3.23573, 0, 1, 0.1411765, 1,
-0.3558482, -0.1842655, -0.879717, 0, 1, 0.1490196, 1,
-0.3539809, 1.157149, 0.362857, 0, 1, 0.1529412, 1,
-0.3538202, 1.334804, 0.685896, 0, 1, 0.1607843, 1,
-0.3537935, 1.032071, 0.03085903, 0, 1, 0.1647059, 1,
-0.3514372, 0.8414271, -0.2827366, 0, 1, 0.172549, 1,
-0.3504389, -0.02065049, -2.808236, 0, 1, 0.1764706, 1,
-0.3490688, -0.8059636, -2.8477, 0, 1, 0.1843137, 1,
-0.3465071, -1.824301, -3.7252, 0, 1, 0.1882353, 1,
-0.3445013, 0.6699291, -1.147722, 0, 1, 0.1960784, 1,
-0.3441843, -0.3679559, -2.811096, 0, 1, 0.2039216, 1,
-0.34125, 0.2446499, -0.8738006, 0, 1, 0.2078431, 1,
-0.3397242, 0.3274778, -1.674772, 0, 1, 0.2156863, 1,
-0.3377084, -2.13223, -2.168421, 0, 1, 0.2196078, 1,
-0.335678, 0.03961286, -1.497349, 0, 1, 0.227451, 1,
-0.3330233, -1.23391, -3.19977, 0, 1, 0.2313726, 1,
-0.3281607, -0.04134279, -1.532823, 0, 1, 0.2392157, 1,
-0.3085033, -0.5444396, -3.637045, 0, 1, 0.2431373, 1,
-0.3061264, -0.5638524, -2.014256, 0, 1, 0.2509804, 1,
-0.3060698, -0.247126, -2.009954, 0, 1, 0.254902, 1,
-0.3054758, -1.458151, -2.038405, 0, 1, 0.2627451, 1,
-0.3050131, -0.3459882, -2.94866, 0, 1, 0.2666667, 1,
-0.2998734, 0.8532344, 0.4254651, 0, 1, 0.2745098, 1,
-0.295124, 0.2824389, 0.1391074, 0, 1, 0.2784314, 1,
-0.2912891, 0.1866502, -0.9706191, 0, 1, 0.2862745, 1,
-0.290844, -0.6268969, -4.287236, 0, 1, 0.2901961, 1,
-0.2894754, -1.615125, -2.95385, 0, 1, 0.2980392, 1,
-0.2854911, 0.2594612, -2.032149, 0, 1, 0.3058824, 1,
-0.2732358, 0.4258417, 0.1316789, 0, 1, 0.3098039, 1,
-0.2696387, -0.8114951, -4.402257, 0, 1, 0.3176471, 1,
-0.2634372, 1.119967, -0.01539323, 0, 1, 0.3215686, 1,
-0.2581672, 1.150129, -0.8005733, 0, 1, 0.3294118, 1,
-0.2538795, -0.5991987, -1.483969, 0, 1, 0.3333333, 1,
-0.2526177, 0.2148061, 0.1571285, 0, 1, 0.3411765, 1,
-0.2513933, 1.336235, 1.018747, 0, 1, 0.345098, 1,
-0.2511587, -0.8142257, -1.493238, 0, 1, 0.3529412, 1,
-0.2480977, 2.363219, 0.9495282, 0, 1, 0.3568628, 1,
-0.2454913, 0.3880162, 0.6062361, 0, 1, 0.3647059, 1,
-0.2443897, 0.2405252, -0.2332825, 0, 1, 0.3686275, 1,
-0.2425094, -1.131793, -1.69476, 0, 1, 0.3764706, 1,
-0.2347865, -0.6274731, -3.785189, 0, 1, 0.3803922, 1,
-0.2313662, 1.348208, -1.04146, 0, 1, 0.3882353, 1,
-0.2293746, 0.7550886, -1.838227, 0, 1, 0.3921569, 1,
-0.2281877, 1.87071, -1.41761, 0, 1, 0.4, 1,
-0.221981, -0.6638882, -2.335463, 0, 1, 0.4078431, 1,
-0.2214435, -0.6500778, -3.362062, 0, 1, 0.4117647, 1,
-0.2196648, -0.8089712, -2.241346, 0, 1, 0.4196078, 1,
-0.2189001, 0.5979908, -2.281531, 0, 1, 0.4235294, 1,
-0.2143417, 0.7303028, 0.4334357, 0, 1, 0.4313726, 1,
-0.2061272, 1.015176, 1.017205, 0, 1, 0.4352941, 1,
-0.2037466, -1.196217, -3.936524, 0, 1, 0.4431373, 1,
-0.2024972, -1.092578, -3.887108, 0, 1, 0.4470588, 1,
-0.1998893, -1.435399, -3.78831, 0, 1, 0.454902, 1,
-0.1956594, 0.7752568, -1.515516, 0, 1, 0.4588235, 1,
-0.1950261, -0.301296, -2.263055, 0, 1, 0.4666667, 1,
-0.1947921, -1.622215, -0.5943169, 0, 1, 0.4705882, 1,
-0.1941709, 0.5716677, 0.3196753, 0, 1, 0.4784314, 1,
-0.1899578, 0.6876232, -0.1840225, 0, 1, 0.4823529, 1,
-0.1894557, -0.04139164, -1.155837, 0, 1, 0.4901961, 1,
-0.1874383, 0.08498634, -4.272639, 0, 1, 0.4941176, 1,
-0.1849952, -0.4482866, -2.90535, 0, 1, 0.5019608, 1,
-0.1848188, -0.331816, -3.530562, 0, 1, 0.509804, 1,
-0.1847623, 0.6726689, -1.014229, 0, 1, 0.5137255, 1,
-0.1838112, 0.4115026, -1.921337, 0, 1, 0.5215687, 1,
-0.1829721, -0.5796455, -4.037676, 0, 1, 0.5254902, 1,
-0.1753475, -1.260723, -2.347064, 0, 1, 0.5333334, 1,
-0.1711609, -0.821655, -2.515236, 0, 1, 0.5372549, 1,
-0.1703915, 0.7908254, -0.3988591, 0, 1, 0.5450981, 1,
-0.1689643, 0.9131274, -0.9793066, 0, 1, 0.5490196, 1,
-0.163803, -0.01015862, -1.811565, 0, 1, 0.5568628, 1,
-0.1629324, 0.7364877, -2.256565, 0, 1, 0.5607843, 1,
-0.160639, -1.179245, -2.373878, 0, 1, 0.5686275, 1,
-0.1605076, 0.3673895, -1.899327, 0, 1, 0.572549, 1,
-0.1568679, -0.362686, -1.488884, 0, 1, 0.5803922, 1,
-0.1535512, -0.8339805, -2.515016, 0, 1, 0.5843138, 1,
-0.1518694, -0.6496837, -4.215698, 0, 1, 0.5921569, 1,
-0.1514847, 1.718658, -0.6969049, 0, 1, 0.5960785, 1,
-0.1474047, 0.5675426, 0.5389771, 0, 1, 0.6039216, 1,
-0.1470596, 0.7416554, -0.07964029, 0, 1, 0.6117647, 1,
-0.1452579, -1.402918, -2.973038, 0, 1, 0.6156863, 1,
-0.1410102, -1.717023, -2.223291, 0, 1, 0.6235294, 1,
-0.1406778, 0.8445348, -0.6724097, 0, 1, 0.627451, 1,
-0.1404064, -2.951809, -4.553043, 0, 1, 0.6352941, 1,
-0.1381496, 1.450742, 0.5688543, 0, 1, 0.6392157, 1,
-0.1329959, 0.7409262, 0.8710933, 0, 1, 0.6470588, 1,
-0.1310663, 0.297423, -0.6182808, 0, 1, 0.6509804, 1,
-0.1262744, -0.5785356, -4.176453, 0, 1, 0.6588235, 1,
-0.1229704, 0.7707927, 0.8636465, 0, 1, 0.6627451, 1,
-0.1143754, -1.505681, -3.219365, 0, 1, 0.6705883, 1,
-0.113673, 0.3123159, 0.7872853, 0, 1, 0.6745098, 1,
-0.1082231, -0.6322556, -1.967427, 0, 1, 0.682353, 1,
-0.100023, -0.1724193, -0.2027879, 0, 1, 0.6862745, 1,
-0.0971924, -1.528061, -2.614416, 0, 1, 0.6941177, 1,
-0.09453894, 0.2761918, -0.8922634, 0, 1, 0.7019608, 1,
-0.09240201, 0.3420486, 0.9799434, 0, 1, 0.7058824, 1,
-0.08889844, 0.7546486, -0.5623161, 0, 1, 0.7137255, 1,
-0.08843572, 1.519736, -0.07080506, 0, 1, 0.7176471, 1,
-0.08692154, 0.2829015, -0.5290943, 0, 1, 0.7254902, 1,
-0.08559657, 0.8998651, -0.1425554, 0, 1, 0.7294118, 1,
-0.08495136, 0.1313304, -0.3339804, 0, 1, 0.7372549, 1,
-0.07571407, -0.2392034, -3.094858, 0, 1, 0.7411765, 1,
-0.072262, -0.3498341, -3.898237, 0, 1, 0.7490196, 1,
-0.06136447, 0.2177518, 1.415807, 0, 1, 0.7529412, 1,
-0.05996342, -1.143525, -3.611511, 0, 1, 0.7607843, 1,
-0.05974971, 0.4654649, 1.681643, 0, 1, 0.7647059, 1,
-0.05729687, -1.041431, -2.337973, 0, 1, 0.772549, 1,
-0.0542402, -0.07625215, -2.760967, 0, 1, 0.7764706, 1,
-0.05375385, -0.6761432, -2.877157, 0, 1, 0.7843137, 1,
-0.05368512, 0.1419695, -1.67198, 0, 1, 0.7882353, 1,
-0.05338758, 0.7276136, 0.872423, 0, 1, 0.7960784, 1,
-0.05119773, 0.7792955, -0.6246187, 0, 1, 0.8039216, 1,
-0.0493666, 0.5433663, -1.315337, 0, 1, 0.8078431, 1,
-0.04935221, -1.535642, -2.431609, 0, 1, 0.8156863, 1,
-0.04778283, -0.4588832, 0.3123332, 0, 1, 0.8196079, 1,
-0.04670843, 0.06165352, 0.2219996, 0, 1, 0.827451, 1,
-0.04235803, -0.3533935, -3.01359, 0, 1, 0.8313726, 1,
-0.04219483, -1.375807, -2.435236, 0, 1, 0.8392157, 1,
-0.03692183, -1.092219, -4.168793, 0, 1, 0.8431373, 1,
-0.03557039, 0.23994, -0.5034394, 0, 1, 0.8509804, 1,
-0.0352416, -0.2505598, -2.371337, 0, 1, 0.854902, 1,
-0.03284324, 0.7699283, -1.303389, 0, 1, 0.8627451, 1,
-0.03182162, -1.761541, -2.889365, 0, 1, 0.8666667, 1,
-0.03062436, 0.3243231, 0.9155454, 0, 1, 0.8745098, 1,
-0.02922188, 1.198071, 0.4837707, 0, 1, 0.8784314, 1,
-0.02576518, -0.4082537, -1.987755, 0, 1, 0.8862745, 1,
-0.02565321, -0.9196807, -3.128294, 0, 1, 0.8901961, 1,
-0.02505019, 1.562909, 1.991738, 0, 1, 0.8980392, 1,
-0.02200578, 0.003549697, -0.2951075, 0, 1, 0.9058824, 1,
-0.0185478, 0.4267042, -0.8477168, 0, 1, 0.9098039, 1,
-0.0174933, 0.3930035, -0.7310478, 0, 1, 0.9176471, 1,
-0.01651861, 0.3274267, 0.09467554, 0, 1, 0.9215686, 1,
-0.01233895, -0.8656366, -2.103452, 0, 1, 0.9294118, 1,
-0.01172302, -1.287542, -3.858329, 0, 1, 0.9333333, 1,
-0.01170668, 1.366585, -0.1097677, 0, 1, 0.9411765, 1,
-0.01144233, -0.1986629, -3.018318, 0, 1, 0.945098, 1,
-0.004146887, 0.7706045, -0.179653, 0, 1, 0.9529412, 1,
-0.002760185, -1.256335, -3.747679, 0, 1, 0.9568627, 1,
-0.002439725, -0.2913755, -2.148407, 0, 1, 0.9647059, 1,
-0.002327184, -1.078592, -4.442409, 0, 1, 0.9686275, 1,
-0.0009731274, 1.25849, -1.018229, 0, 1, 0.9764706, 1,
-0.0008077198, 0.6362874, -0.4294052, 0, 1, 0.9803922, 1,
0.000239829, -0.7775864, 3.706912, 0, 1, 0.9882353, 1,
0.002597983, 0.6536635, -0.533587, 0, 1, 0.9921569, 1,
0.008015048, -1.465467, 4.203937, 0, 1, 1, 1,
0.008335423, 0.1217496, 0.3108903, 0, 0.9921569, 1, 1,
0.00868709, -0.6180938, 3.134754, 0, 0.9882353, 1, 1,
0.009916538, -0.8173139, 2.996581, 0, 0.9803922, 1, 1,
0.01052889, -1.509603, 3.075107, 0, 0.9764706, 1, 1,
0.01113729, -0.2986937, 3.291091, 0, 0.9686275, 1, 1,
0.01143793, 0.2133698, -1.127766, 0, 0.9647059, 1, 1,
0.0124001, 0.526692, -0.04807365, 0, 0.9568627, 1, 1,
0.01289992, -0.8330883, 3.478454, 0, 0.9529412, 1, 1,
0.02071839, -1.199229, 2.867736, 0, 0.945098, 1, 1,
0.02356637, -0.3135792, 2.493607, 0, 0.9411765, 1, 1,
0.02412187, 0.8596231, 0.7765983, 0, 0.9333333, 1, 1,
0.0258523, 0.1168491, 0.8017519, 0, 0.9294118, 1, 1,
0.02623841, -2.491524, 4.658455, 0, 0.9215686, 1, 1,
0.02830415, -0.9952009, 2.834506, 0, 0.9176471, 1, 1,
0.03033699, 0.2744097, 0.7960325, 0, 0.9098039, 1, 1,
0.03239076, 0.5502158, -0.9526313, 0, 0.9058824, 1, 1,
0.03281589, -0.824414, 3.882697, 0, 0.8980392, 1, 1,
0.03547588, 1.240635, 0.3090526, 0, 0.8901961, 1, 1,
0.03999543, 0.4380615, 0.6172461, 0, 0.8862745, 1, 1,
0.04001776, 1.795542, -0.2804653, 0, 0.8784314, 1, 1,
0.04208904, 0.2094026, -0.0289034, 0, 0.8745098, 1, 1,
0.04595955, 1.981853, 0.07077154, 0, 0.8666667, 1, 1,
0.04768464, 0.2791255, 0.9730921, 0, 0.8627451, 1, 1,
0.05120885, -0.03062315, 3.683059, 0, 0.854902, 1, 1,
0.05247574, 1.320755, 0.1631913, 0, 0.8509804, 1, 1,
0.0563087, -0.3748229, 2.273573, 0, 0.8431373, 1, 1,
0.0563252, 0.5475174, 0.2958881, 0, 0.8392157, 1, 1,
0.05827489, 1.109464, -0.2133335, 0, 0.8313726, 1, 1,
0.05928808, 0.07122168, 0.8666701, 0, 0.827451, 1, 1,
0.06160783, 0.6335385, -1.452628, 0, 0.8196079, 1, 1,
0.06715197, -0.5779122, 1.63136, 0, 0.8156863, 1, 1,
0.06824984, 0.113943, -0.9416357, 0, 0.8078431, 1, 1,
0.07113632, 0.4887672, 2.021515, 0, 0.8039216, 1, 1,
0.07383815, -0.6717156, 2.464712, 0, 0.7960784, 1, 1,
0.07416595, -0.7576582, 2.706992, 0, 0.7882353, 1, 1,
0.07702482, 0.06499271, -0.9290119, 0, 0.7843137, 1, 1,
0.08748213, -1.260527, 4.591409, 0, 0.7764706, 1, 1,
0.08750921, 1.246661, 0.9383491, 0, 0.772549, 1, 1,
0.09106305, -0.05332727, 1.617821, 0, 0.7647059, 1, 1,
0.09519987, 0.1658217, -0.4703141, 0, 0.7607843, 1, 1,
0.09599157, 0.1108548, 0.4436995, 0, 0.7529412, 1, 1,
0.09764918, -0.8330469, 2.742279, 0, 0.7490196, 1, 1,
0.1002105, 0.9695439, -0.4005843, 0, 0.7411765, 1, 1,
0.1006483, 1.00633, -0.6182089, 0, 0.7372549, 1, 1,
0.1010768, 1.425412, -0.7862809, 0, 0.7294118, 1, 1,
0.1085905, 0.789018, 0.963923, 0, 0.7254902, 1, 1,
0.1097458, -1.813742, 3.523733, 0, 0.7176471, 1, 1,
0.1111664, -0.2905715, 3.46318, 0, 0.7137255, 1, 1,
0.1123714, 1.610859, 1.220456, 0, 0.7058824, 1, 1,
0.1126914, -2.302726, 2.072026, 0, 0.6980392, 1, 1,
0.1133243, 0.2444546, 0.9826354, 0, 0.6941177, 1, 1,
0.114042, -0.6924656, 1.897286, 0, 0.6862745, 1, 1,
0.11991, 0.1595677, 1.460589, 0, 0.682353, 1, 1,
0.1241927, -1.079998, 3.007452, 0, 0.6745098, 1, 1,
0.1290936, -0.3098108, 3.338094, 0, 0.6705883, 1, 1,
0.1297432, 0.2140987, -0.7301837, 0, 0.6627451, 1, 1,
0.1312524, 1.446995, -1.330837, 0, 0.6588235, 1, 1,
0.1314449, -1.440454, 2.921938, 0, 0.6509804, 1, 1,
0.1328793, 1.207191, -0.3280665, 0, 0.6470588, 1, 1,
0.1348298, 0.6025709, 0.03760407, 0, 0.6392157, 1, 1,
0.1399172, 1.143383, -1.191387, 0, 0.6352941, 1, 1,
0.142725, 0.3669821, -0.8344308, 0, 0.627451, 1, 1,
0.1438422, -0.297033, 2.136702, 0, 0.6235294, 1, 1,
0.1477507, 0.7569045, 0.920198, 0, 0.6156863, 1, 1,
0.1490619, -0.1770746, -0.6553921, 0, 0.6117647, 1, 1,
0.1508662, 0.2772896, 1.409642, 0, 0.6039216, 1, 1,
0.1517014, -0.05884383, 2.526111, 0, 0.5960785, 1, 1,
0.1535611, -0.3777657, 2.434103, 0, 0.5921569, 1, 1,
0.1571498, -1.333445, 4.28988, 0, 0.5843138, 1, 1,
0.1576412, -1.983356, 4.972982, 0, 0.5803922, 1, 1,
0.1587281, -0.4960424, 3.09961, 0, 0.572549, 1, 1,
0.1587511, -0.6575851, 2.328779, 0, 0.5686275, 1, 1,
0.1613705, 2.197147, 0.2990488, 0, 0.5607843, 1, 1,
0.1695817, -0.7462794, 2.137991, 0, 0.5568628, 1, 1,
0.1701597, 1.210075, 1.918511, 0, 0.5490196, 1, 1,
0.1707219, 0.6643261, 0.4257303, 0, 0.5450981, 1, 1,
0.1728936, 2.229397, 1.220126, 0, 0.5372549, 1, 1,
0.1734453, -0.8590516, 2.504742, 0, 0.5333334, 1, 1,
0.1747415, -0.8191041, 1.455031, 0, 0.5254902, 1, 1,
0.1819478, 0.04449807, 1.94886, 0, 0.5215687, 1, 1,
0.18325, -0.8966134, 4.750851, 0, 0.5137255, 1, 1,
0.1834453, 0.02066885, 0.949611, 0, 0.509804, 1, 1,
0.1840526, -1.096888, 4.506756, 0, 0.5019608, 1, 1,
0.1852898, -0.3348436, 0.3315028, 0, 0.4941176, 1, 1,
0.1880508, 0.5198441, 0.1622162, 0, 0.4901961, 1, 1,
0.1884451, 0.4231665, 0.8799505, 0, 0.4823529, 1, 1,
0.1894609, 1.118575, 0.6260638, 0, 0.4784314, 1, 1,
0.1918877, -0.1945093, 1.091953, 0, 0.4705882, 1, 1,
0.1928496, -0.3447554, 1.978197, 0, 0.4666667, 1, 1,
0.1943026, -1.293514, 3.249551, 0, 0.4588235, 1, 1,
0.1981647, -0.6732906, 2.289855, 0, 0.454902, 1, 1,
0.2033676, 0.5047845, 2.363311, 0, 0.4470588, 1, 1,
0.2051019, -1.05267, 2.591422, 0, 0.4431373, 1, 1,
0.2059172, -1.042207, 3.21898, 0, 0.4352941, 1, 1,
0.206147, 1.821705, 0.175601, 0, 0.4313726, 1, 1,
0.2132878, -0.3755371, 1.397029, 0, 0.4235294, 1, 1,
0.2162197, 0.6364385, 1.736488, 0, 0.4196078, 1, 1,
0.2174198, -0.6111475, 4.394656, 0, 0.4117647, 1, 1,
0.2269336, -1.375381, 0.9364412, 0, 0.4078431, 1, 1,
0.2273131, 1.121617, 0.7245858, 0, 0.4, 1, 1,
0.2285701, -0.2967044, 2.449673, 0, 0.3921569, 1, 1,
0.2285948, 0.4154013, 0.1987003, 0, 0.3882353, 1, 1,
0.2305592, -0.2816328, 1.959267, 0, 0.3803922, 1, 1,
0.240154, 1.315874, 1.223237, 0, 0.3764706, 1, 1,
0.2456022, 0.1112434, 2.106933, 0, 0.3686275, 1, 1,
0.246921, -1.008856, 4.272873, 0, 0.3647059, 1, 1,
0.2502422, -0.7907342, 4.114098, 0, 0.3568628, 1, 1,
0.2522601, -0.2311367, 2.382222, 0, 0.3529412, 1, 1,
0.2544381, 1.219355, -1.825521, 0, 0.345098, 1, 1,
0.255466, -0.1380675, 2.180006, 0, 0.3411765, 1, 1,
0.2556402, 1.05699, 0.06784948, 0, 0.3333333, 1, 1,
0.2634238, -0.9974995, 3.914587, 0, 0.3294118, 1, 1,
0.2649729, -1.484814, 3.641633, 0, 0.3215686, 1, 1,
0.2670687, -0.3814667, 1.979719, 0, 0.3176471, 1, 1,
0.269905, -0.751842, 2.466532, 0, 0.3098039, 1, 1,
0.2758168, 2.717695, 0.9628534, 0, 0.3058824, 1, 1,
0.2767577, 0.3766226, -0.4698351, 0, 0.2980392, 1, 1,
0.2810733, -0.719805, 2.779779, 0, 0.2901961, 1, 1,
0.284725, 1.034696, -0.4323685, 0, 0.2862745, 1, 1,
0.2863635, -0.7079943, 2.797944, 0, 0.2784314, 1, 1,
0.2864385, 2.200833, 0.366063, 0, 0.2745098, 1, 1,
0.2937009, -0.1219436, -0.6044615, 0, 0.2666667, 1, 1,
0.2937241, -1.205979, 2.769426, 0, 0.2627451, 1, 1,
0.2948771, 0.1753399, -0.8757659, 0, 0.254902, 1, 1,
0.2965114, -0.3608115, 2.294746, 0, 0.2509804, 1, 1,
0.3081403, 0.4482399, 0.2653793, 0, 0.2431373, 1, 1,
0.308583, 0.4081185, -1.240751, 0, 0.2392157, 1, 1,
0.3086696, 0.2158683, 3.4022, 0, 0.2313726, 1, 1,
0.3111571, -0.01173693, 0.1371257, 0, 0.227451, 1, 1,
0.3117678, 0.4271705, -0.3758241, 0, 0.2196078, 1, 1,
0.3121714, -1.37687, 3.497781, 0, 0.2156863, 1, 1,
0.3132346, -0.4006169, 1.97227, 0, 0.2078431, 1, 1,
0.3141773, 0.6301993, 1.217593, 0, 0.2039216, 1, 1,
0.3145722, -0.3296821, 2.819772, 0, 0.1960784, 1, 1,
0.3161672, -0.8843228, 3.581132, 0, 0.1882353, 1, 1,
0.3172245, 1.337022, -0.2171247, 0, 0.1843137, 1, 1,
0.3188963, 0.1526842, 0.4817838, 0, 0.1764706, 1, 1,
0.3198581, 1.63397, -0.5931339, 0, 0.172549, 1, 1,
0.3318907, -0.4515707, 2.997823, 0, 0.1647059, 1, 1,
0.3346621, -0.1963147, 1.996576, 0, 0.1607843, 1, 1,
0.3351101, 1.016557, 0.9376701, 0, 0.1529412, 1, 1,
0.3374948, -0.242387, 1.820882, 0, 0.1490196, 1, 1,
0.3467163, -1.255185, 2.936335, 0, 0.1411765, 1, 1,
0.3495025, 1.032366, 0.6902683, 0, 0.1372549, 1, 1,
0.3557751, 1.702263, -0.7725198, 0, 0.1294118, 1, 1,
0.355867, 0.3920754, 1.160629, 0, 0.1254902, 1, 1,
0.3566961, -0.326034, 2.981226, 0, 0.1176471, 1, 1,
0.3569301, -1.025777, 3.477335, 0, 0.1137255, 1, 1,
0.3570836, -0.9966398, 3.290329, 0, 0.1058824, 1, 1,
0.3578638, -1.451021, 3.528706, 0, 0.09803922, 1, 1,
0.3579412, -0.7191758, 1.31817, 0, 0.09411765, 1, 1,
0.3597738, 0.6908994, 0.7595798, 0, 0.08627451, 1, 1,
0.3622517, 1.540225, 0.3556621, 0, 0.08235294, 1, 1,
0.3651367, 0.6122416, 0.1461872, 0, 0.07450981, 1, 1,
0.3681642, 0.3536364, -0.7598558, 0, 0.07058824, 1, 1,
0.3701363, -1.637212, 1.571555, 0, 0.0627451, 1, 1,
0.370254, 0.1160058, 0.8251679, 0, 0.05882353, 1, 1,
0.3755839, -0.5555372, 0.8778162, 0, 0.05098039, 1, 1,
0.3815568, -0.8367121, -0.5804622, 0, 0.04705882, 1, 1,
0.3833084, 0.1755602, -0.6143872, 0, 0.03921569, 1, 1,
0.3838185, -1.100598, 3.8613, 0, 0.03529412, 1, 1,
0.3902332, -0.4526027, 2.523372, 0, 0.02745098, 1, 1,
0.3958429, -0.1777229, 0.9881173, 0, 0.02352941, 1, 1,
0.4018259, 2.238718, -1.514549, 0, 0.01568628, 1, 1,
0.4104369, 0.7292794, -0.8660606, 0, 0.01176471, 1, 1,
0.4115763, 0.562933, 1.421394, 0, 0.003921569, 1, 1,
0.4115845, 0.3741547, 1.467708, 0.003921569, 0, 1, 1,
0.4214502, 0.815197, -1.455912, 0.007843138, 0, 1, 1,
0.4239312, -2.268224, 2.891935, 0.01568628, 0, 1, 1,
0.426501, -0.3920193, 1.523304, 0.01960784, 0, 1, 1,
0.4265929, -1.756249, 3.910944, 0.02745098, 0, 1, 1,
0.4292368, 0.5462123, 2.365105, 0.03137255, 0, 1, 1,
0.4364946, -1.860141, 2.463134, 0.03921569, 0, 1, 1,
0.4365181, 0.5012521, 0.4761873, 0.04313726, 0, 1, 1,
0.4366626, -0.8998843, 2.954787, 0.05098039, 0, 1, 1,
0.4403858, -0.6894373, 1.777674, 0.05490196, 0, 1, 1,
0.4414936, -0.3600093, 1.909675, 0.0627451, 0, 1, 1,
0.4428948, 1.528185, 1.986761, 0.06666667, 0, 1, 1,
0.4469066, -0.5981346, 4.200721, 0.07450981, 0, 1, 1,
0.4473325, -0.3934686, 1.842006, 0.07843138, 0, 1, 1,
0.4477396, 0.4815089, 1.053645, 0.08627451, 0, 1, 1,
0.4520594, 1.724187, 1.731629, 0.09019608, 0, 1, 1,
0.4527218, -1.085684, 2.089188, 0.09803922, 0, 1, 1,
0.4603666, 1.951954, -0.3915302, 0.1058824, 0, 1, 1,
0.4626191, 1.222288, 0.9758328, 0.1098039, 0, 1, 1,
0.4658372, -0.797422, 4.356467, 0.1176471, 0, 1, 1,
0.4707717, 3.019229, 0.1630112, 0.1215686, 0, 1, 1,
0.4759818, 0.5040693, 1.060981, 0.1294118, 0, 1, 1,
0.4763418, -0.2233747, 2.262099, 0.1333333, 0, 1, 1,
0.4806266, -1.107366, 3.761697, 0.1411765, 0, 1, 1,
0.48063, -1.237775, 1.612871, 0.145098, 0, 1, 1,
0.4810505, -1.014637, 4.570465, 0.1529412, 0, 1, 1,
0.4843446, -0.231873, 2.357504, 0.1568628, 0, 1, 1,
0.4845681, 0.6674669, -1.456231, 0.1647059, 0, 1, 1,
0.4867046, -0.9868748, 2.401986, 0.1686275, 0, 1, 1,
0.4879165, -2.188472, 2.021801, 0.1764706, 0, 1, 1,
0.4919517, 0.4925977, 1.589493, 0.1803922, 0, 1, 1,
0.4933355, -0.9960189, 2.377547, 0.1882353, 0, 1, 1,
0.4936974, -0.6515741, 3.300041, 0.1921569, 0, 1, 1,
0.4980631, 0.9595062, 0.7683838, 0.2, 0, 1, 1,
0.501758, 0.2502262, 0.7384886, 0.2078431, 0, 1, 1,
0.5030932, -0.1366626, 1.918785, 0.2117647, 0, 1, 1,
0.5043957, 0.7497723, 0.6050855, 0.2196078, 0, 1, 1,
0.5054975, -2.405966, 2.778207, 0.2235294, 0, 1, 1,
0.5195891, -0.8739339, 2.547866, 0.2313726, 0, 1, 1,
0.5203828, -0.3117831, 2.090253, 0.2352941, 0, 1, 1,
0.5226029, -0.3521616, 1.425886, 0.2431373, 0, 1, 1,
0.5247687, -0.3962159, 2.113201, 0.2470588, 0, 1, 1,
0.5266546, 1.02757, 1.333803, 0.254902, 0, 1, 1,
0.5288253, 1.129475, 2.603429, 0.2588235, 0, 1, 1,
0.5304921, 1.667195, -0.1088672, 0.2666667, 0, 1, 1,
0.530682, -1.683876, 2.80664, 0.2705882, 0, 1, 1,
0.5326969, 1.108098, 1.474931, 0.2784314, 0, 1, 1,
0.5340415, 0.9021048, 1.805062, 0.282353, 0, 1, 1,
0.5355561, 1.354075, 1.749782, 0.2901961, 0, 1, 1,
0.5380658, -0.7785855, 2.031435, 0.2941177, 0, 1, 1,
0.5407972, 0.6016693, -0.4148047, 0.3019608, 0, 1, 1,
0.5461555, -1.154597, 2.430726, 0.3098039, 0, 1, 1,
0.5463561, 0.9425472, -1.822916, 0.3137255, 0, 1, 1,
0.5480528, 0.1244239, 1.51564, 0.3215686, 0, 1, 1,
0.5516888, 1.136154, -0.6537093, 0.3254902, 0, 1, 1,
0.5604221, 0.04636291, 1.712817, 0.3333333, 0, 1, 1,
0.562303, -1.037177, 3.340355, 0.3372549, 0, 1, 1,
0.5672577, 0.301936, -0.2999113, 0.345098, 0, 1, 1,
0.568498, 0.008948571, 2.966815, 0.3490196, 0, 1, 1,
0.5697752, 1.99291, 1.174251, 0.3568628, 0, 1, 1,
0.5707338, -1.452967, 2.848167, 0.3607843, 0, 1, 1,
0.5716629, -0.02698422, 2.04481, 0.3686275, 0, 1, 1,
0.5729265, 1.097415, 0.3338015, 0.372549, 0, 1, 1,
0.5841511, 0.4054948, 1.378784, 0.3803922, 0, 1, 1,
0.5873342, -1.664133, 1.783188, 0.3843137, 0, 1, 1,
0.588495, -1.978527, 1.795596, 0.3921569, 0, 1, 1,
0.591334, 0.1965519, 0.6846442, 0.3960784, 0, 1, 1,
0.5925511, 0.1857291, 1.886612, 0.4039216, 0, 1, 1,
0.5962072, -1.100863, 1.836405, 0.4117647, 0, 1, 1,
0.5964093, -0.5294352, 1.958959, 0.4156863, 0, 1, 1,
0.5992647, -0.6067649, 1.250876, 0.4235294, 0, 1, 1,
0.6018336, -0.4319152, 3.033638, 0.427451, 0, 1, 1,
0.603254, 0.5492098, 0.1890152, 0.4352941, 0, 1, 1,
0.6046894, 1.689849, -0.8064272, 0.4392157, 0, 1, 1,
0.6050012, 0.8797214, 0.7096177, 0.4470588, 0, 1, 1,
0.6061454, 1.256799, 0.5628605, 0.4509804, 0, 1, 1,
0.6122797, -1.297463, 2.911698, 0.4588235, 0, 1, 1,
0.6141769, -0.1578704, 2.790005, 0.4627451, 0, 1, 1,
0.6201206, 2.280947, 0.08824708, 0.4705882, 0, 1, 1,
0.6251245, -0.4240374, 3.137585, 0.4745098, 0, 1, 1,
0.6305204, -0.2487819, 2.87261, 0.4823529, 0, 1, 1,
0.6325772, 0.6368757, -0.212163, 0.4862745, 0, 1, 1,
0.6358682, -1.791506, 2.711999, 0.4941176, 0, 1, 1,
0.639489, -0.4631094, 1.837692, 0.5019608, 0, 1, 1,
0.6433764, 0.6055451, 0.08460663, 0.5058824, 0, 1, 1,
0.6437302, 1.522882, -0.8922312, 0.5137255, 0, 1, 1,
0.6523485, -0.08208805, -0.05794244, 0.5176471, 0, 1, 1,
0.6550324, -0.3588507, 0.1445553, 0.5254902, 0, 1, 1,
0.6551728, 0.5739661, 1.384578, 0.5294118, 0, 1, 1,
0.6566275, 0.5782095, 0.5726482, 0.5372549, 0, 1, 1,
0.6570346, 0.7106441, 0.8349308, 0.5411765, 0, 1, 1,
0.6572457, 0.4308119, 2.021261, 0.5490196, 0, 1, 1,
0.6583443, 0.8424735, 0.7014065, 0.5529412, 0, 1, 1,
0.6623984, -0.4779431, 1.075711, 0.5607843, 0, 1, 1,
0.6633523, -0.9472103, 2.962188, 0.5647059, 0, 1, 1,
0.6646411, -0.9053918, 2.805085, 0.572549, 0, 1, 1,
0.6657121, -0.2945026, 2.081281, 0.5764706, 0, 1, 1,
0.6707727, -0.4671227, 3.419286, 0.5843138, 0, 1, 1,
0.6763051, 0.01516116, 2.141012, 0.5882353, 0, 1, 1,
0.6780301, 0.4535966, 0.6584888, 0.5960785, 0, 1, 1,
0.6806036, 2.11044, 0.6983572, 0.6039216, 0, 1, 1,
0.6833364, -2.474312, 2.24832, 0.6078432, 0, 1, 1,
0.6869691, -1.253432, 1.356537, 0.6156863, 0, 1, 1,
0.6899748, 0.1143957, -0.2673781, 0.6196079, 0, 1, 1,
0.6915286, -0.109835, 0.4724038, 0.627451, 0, 1, 1,
0.6936964, 0.3183795, 2.167329, 0.6313726, 0, 1, 1,
0.6954672, -0.7242861, 3.023231, 0.6392157, 0, 1, 1,
0.6987446, -0.8039145, 2.575851, 0.6431373, 0, 1, 1,
0.7030245, -0.6946848, 1.039077, 0.6509804, 0, 1, 1,
0.7031891, -0.151611, 1.157585, 0.654902, 0, 1, 1,
0.706054, -1.240339, 1.470311, 0.6627451, 0, 1, 1,
0.7123308, -0.2982298, 2.993344, 0.6666667, 0, 1, 1,
0.724906, 0.366095, 0.7399411, 0.6745098, 0, 1, 1,
0.7320219, -1.00908, 2.797761, 0.6784314, 0, 1, 1,
0.7332914, 1.017215, -0.0713264, 0.6862745, 0, 1, 1,
0.7340844, 0.2121238, 0.13916, 0.6901961, 0, 1, 1,
0.7346176, -2.339058, 3.361433, 0.6980392, 0, 1, 1,
0.7351274, 1.478545, -0.9450725, 0.7058824, 0, 1, 1,
0.738938, 0.02335858, 1.494123, 0.7098039, 0, 1, 1,
0.7459412, -0.08287834, 3.534308, 0.7176471, 0, 1, 1,
0.7545, -0.08001019, 0.8960163, 0.7215686, 0, 1, 1,
0.7598751, -0.7354501, 0.9440567, 0.7294118, 0, 1, 1,
0.7679108, -0.9165931, 3.325315, 0.7333333, 0, 1, 1,
0.7752157, 1.905371, -0.2355043, 0.7411765, 0, 1, 1,
0.7767049, -0.0651867, 0.8186647, 0.7450981, 0, 1, 1,
0.7816863, 1.52268, 0.0641157, 0.7529412, 0, 1, 1,
0.787547, 1.393197, 0.04558563, 0.7568628, 0, 1, 1,
0.7882373, 1.478971, 1.676224, 0.7647059, 0, 1, 1,
0.7893181, -1.631837, 3.674315, 0.7686275, 0, 1, 1,
0.7896085, -1.836877, 1.728291, 0.7764706, 0, 1, 1,
0.7925268, -0.3138511, 2.136144, 0.7803922, 0, 1, 1,
0.7979436, 1.186387, 1.11795, 0.7882353, 0, 1, 1,
0.801342, -0.6972743, 1.917105, 0.7921569, 0, 1, 1,
0.80144, 0.5233402, 1.772627, 0.8, 0, 1, 1,
0.8057333, -0.5951861, 1.297094, 0.8078431, 0, 1, 1,
0.8164761, 0.4704446, 2.303285, 0.8117647, 0, 1, 1,
0.8210891, -1.399017, 1.990276, 0.8196079, 0, 1, 1,
0.8270393, -0.3123894, 1.0702, 0.8235294, 0, 1, 1,
0.8309042, 0.01669003, 3.913016, 0.8313726, 0, 1, 1,
0.831469, 0.1838669, 1.172351, 0.8352941, 0, 1, 1,
0.8395415, 0.8385688, 0.4086965, 0.8431373, 0, 1, 1,
0.8418016, -0.6763304, 3.553016, 0.8470588, 0, 1, 1,
0.8422555, -1.309189, 1.49107, 0.854902, 0, 1, 1,
0.8454517, -0.9673549, 1.285424, 0.8588235, 0, 1, 1,
0.8466048, 0.8512176, 1.986322, 0.8666667, 0, 1, 1,
0.8479776, 0.9240273, 0.4012448, 0.8705882, 0, 1, 1,
0.8481077, -1.167418, 3.262257, 0.8784314, 0, 1, 1,
0.8557108, -0.4429366, 2.434569, 0.8823529, 0, 1, 1,
0.8668077, -0.06139247, 2.456866, 0.8901961, 0, 1, 1,
0.8721442, 1.403502, 0.5096993, 0.8941177, 0, 1, 1,
0.8726175, 0.04140002, -1.14563, 0.9019608, 0, 1, 1,
0.8750907, 0.311092, 1.033588, 0.9098039, 0, 1, 1,
0.8760767, 1.01712, -0.09986106, 0.9137255, 0, 1, 1,
0.8834673, 1.073138, 1.408005, 0.9215686, 0, 1, 1,
0.8869877, 0.08840579, -0.415044, 0.9254902, 0, 1, 1,
0.8896087, -1.803416, 4.28431, 0.9333333, 0, 1, 1,
0.8901225, -1.30233, 3.115225, 0.9372549, 0, 1, 1,
0.9006111, -0.4226814, 1.986774, 0.945098, 0, 1, 1,
0.9074211, -0.03721096, 1.420211, 0.9490196, 0, 1, 1,
0.9082729, -0.2414685, -0.1269671, 0.9568627, 0, 1, 1,
0.9166219, -0.5085936, 1.059035, 0.9607843, 0, 1, 1,
0.9187511, 0.8179327, 0.01389787, 0.9686275, 0, 1, 1,
0.9195603, 0.6429859, 0.4169402, 0.972549, 0, 1, 1,
0.9207823, -0.6706809, 1.389145, 0.9803922, 0, 1, 1,
0.9221143, -0.5397139, 1.33208, 0.9843137, 0, 1, 1,
0.9227633, -1.251114, 1.910201, 0.9921569, 0, 1, 1,
0.9339826, -0.6646672, 3.26456, 0.9960784, 0, 1, 1,
0.9387107, -0.4924588, 3.504134, 1, 0, 0.9960784, 1,
0.9389336, -1.281598, 3.010998, 1, 0, 0.9882353, 1,
0.9433812, 1.197047, 2.230774, 1, 0, 0.9843137, 1,
0.9445835, 0.8737276, 0.3049135, 1, 0, 0.9764706, 1,
0.9453184, 1.052872, 0.190725, 1, 0, 0.972549, 1,
0.9462869, 1.053861, 0.3441798, 1, 0, 0.9647059, 1,
0.947915, 0.2291109, 0.3235497, 1, 0, 0.9607843, 1,
0.9525016, 0.3799894, -0.04096225, 1, 0, 0.9529412, 1,
0.9591091, 0.786623, 0.8462523, 1, 0, 0.9490196, 1,
0.9602843, -0.9158053, 3.826268, 1, 0, 0.9411765, 1,
0.9605265, -0.2050746, 1.788642, 1, 0, 0.9372549, 1,
0.9652548, -0.06054538, 0.7054669, 1, 0, 0.9294118, 1,
0.9855037, -1.538151, 3.283666, 1, 0, 0.9254902, 1,
0.9859321, 0.5486682, 2.064338, 1, 0, 0.9176471, 1,
0.9951034, 0.8653516, -0.04509513, 1, 0, 0.9137255, 1,
1.002118, -1.04298, 2.581407, 1, 0, 0.9058824, 1,
1.004751, 1.824676, 0.1341588, 1, 0, 0.9019608, 1,
1.006181, 2.995098, -0.1392818, 1, 0, 0.8941177, 1,
1.006302, -0.2659059, 2.658926, 1, 0, 0.8862745, 1,
1.011821, 1.079786, 0.7897966, 1, 0, 0.8823529, 1,
1.01206, -0.0513629, 2.153088, 1, 0, 0.8745098, 1,
1.022826, -0.339503, 1.28558, 1, 0, 0.8705882, 1,
1.025216, -0.9147395, 1.235142, 1, 0, 0.8627451, 1,
1.025579, -1.335048, 2.084426, 1, 0, 0.8588235, 1,
1.028056, 0.5476242, 0.8633002, 1, 0, 0.8509804, 1,
1.030306, -1.20988, 2.669926, 1, 0, 0.8470588, 1,
1.03117, -0.4809351, 1.576439, 1, 0, 0.8392157, 1,
1.033552, 0.9088312, 1.086501, 1, 0, 0.8352941, 1,
1.039393, -0.04421758, 3.015143, 1, 0, 0.827451, 1,
1.065012, -0.2524632, 1.912464, 1, 0, 0.8235294, 1,
1.066467, -0.1279164, 0.3961172, 1, 0, 0.8156863, 1,
1.070594, -0.4539509, 1.539133, 1, 0, 0.8117647, 1,
1.074087, -0.9762589, 1.795407, 1, 0, 0.8039216, 1,
1.084492, 1.770193, 0.2703141, 1, 0, 0.7960784, 1,
1.08465, -0.5019583, 2.61438, 1, 0, 0.7921569, 1,
1.086658, 1.993581, 2.703493, 1, 0, 0.7843137, 1,
1.088582, 2.252304, 0.08256886, 1, 0, 0.7803922, 1,
1.09415, -1.359783, 2.991109, 1, 0, 0.772549, 1,
1.094619, -0.8572273, 2.741036, 1, 0, 0.7686275, 1,
1.114219, -0.6195843, 1.634533, 1, 0, 0.7607843, 1,
1.116212, 0.2775038, 1.300516, 1, 0, 0.7568628, 1,
1.129297, -0.8187689, 3.453623, 1, 0, 0.7490196, 1,
1.130607, 2.388041, -1.177225, 1, 0, 0.7450981, 1,
1.13872, 0.1342217, 0.2839083, 1, 0, 0.7372549, 1,
1.151984, -1.217291, 1.70941, 1, 0, 0.7333333, 1,
1.152544, 1.053178, 2.268471, 1, 0, 0.7254902, 1,
1.16569, -0.4070674, 1.871147, 1, 0, 0.7215686, 1,
1.167088, -0.1229642, 1.991709, 1, 0, 0.7137255, 1,
1.167188, -0.1748358, 0.7437147, 1, 0, 0.7098039, 1,
1.171603, -0.4353184, 2.13068, 1, 0, 0.7019608, 1,
1.182371, 2.252676, 0.3411395, 1, 0, 0.6941177, 1,
1.191292, -0.8671243, 1.372603, 1, 0, 0.6901961, 1,
1.191867, -0.5729698, 3.840549, 1, 0, 0.682353, 1,
1.197885, -0.8825868, 0.9231527, 1, 0, 0.6784314, 1,
1.202921, -0.7559701, 2.887869, 1, 0, 0.6705883, 1,
1.206889, 1.436063, -0.5950789, 1, 0, 0.6666667, 1,
1.208945, 0.8575702, 1.70109, 1, 0, 0.6588235, 1,
1.21181, 1.605372, 0.9424762, 1, 0, 0.654902, 1,
1.215353, -0.9057117, 2.096696, 1, 0, 0.6470588, 1,
1.215863, 0.5523269, 0.1069021, 1, 0, 0.6431373, 1,
1.219663, -0.3554369, 2.701266, 1, 0, 0.6352941, 1,
1.225118, 0.421118, 0.5956586, 1, 0, 0.6313726, 1,
1.226225, -0.7090743, 1.286689, 1, 0, 0.6235294, 1,
1.227696, -0.7161548, 0.3109812, 1, 0, 0.6196079, 1,
1.2373, -0.2790484, 2.296923, 1, 0, 0.6117647, 1,
1.239489, 1.049691, 0.1216153, 1, 0, 0.6078432, 1,
1.252349, 0.303508, 1.681104, 1, 0, 0.6, 1,
1.256409, -0.08395074, 1.907367, 1, 0, 0.5921569, 1,
1.258068, -0.6498576, 2.909227, 1, 0, 0.5882353, 1,
1.263937, 1.795051, 0.8055548, 1, 0, 0.5803922, 1,
1.268607, 0.6879914, 0.2328916, 1, 0, 0.5764706, 1,
1.270537, -0.680621, 2.531924, 1, 0, 0.5686275, 1,
1.309536, -0.4546341, 1.099594, 1, 0, 0.5647059, 1,
1.320815, 0.2478703, 1.324394, 1, 0, 0.5568628, 1,
1.324024, -0.9571927, 2.568298, 1, 0, 0.5529412, 1,
1.325494, -0.1648199, 1.970916, 1, 0, 0.5450981, 1,
1.330581, 0.6804698, -0.07625494, 1, 0, 0.5411765, 1,
1.344045, 1.017773, -0.5723137, 1, 0, 0.5333334, 1,
1.345649, 0.2942965, 0.6325592, 1, 0, 0.5294118, 1,
1.355054, 0.371499, 0.6503664, 1, 0, 0.5215687, 1,
1.355328, 0.6095527, 1.945977, 1, 0, 0.5176471, 1,
1.361655, 0.8333713, 0.5469329, 1, 0, 0.509804, 1,
1.367625, -0.4219927, 0.8450499, 1, 0, 0.5058824, 1,
1.368337, -1.037917, 2.706805, 1, 0, 0.4980392, 1,
1.368963, 0.1116675, 2.534578, 1, 0, 0.4901961, 1,
1.377548, -0.4926052, 1.213741, 1, 0, 0.4862745, 1,
1.379018, -0.3861412, 3.257337, 1, 0, 0.4784314, 1,
1.387555, 0.3355526, 1.700057, 1, 0, 0.4745098, 1,
1.391095, 0.05326516, 0.7547081, 1, 0, 0.4666667, 1,
1.397626, 1.327146, 1.676854, 1, 0, 0.4627451, 1,
1.403631, -0.5879882, 0.9174263, 1, 0, 0.454902, 1,
1.410485, -0.9813598, 3.090857, 1, 0, 0.4509804, 1,
1.417375, 1.768968, -0.3540776, 1, 0, 0.4431373, 1,
1.439019, 1.706791, 2.529185, 1, 0, 0.4392157, 1,
1.440152, -0.14224, 1.567552, 1, 0, 0.4313726, 1,
1.446004, 1.191525, 1.778077, 1, 0, 0.427451, 1,
1.448287, 0.7809438, 1.481335, 1, 0, 0.4196078, 1,
1.450599, 0.2832197, 2.088641, 1, 0, 0.4156863, 1,
1.454199, -2.304437, 3.54796, 1, 0, 0.4078431, 1,
1.463057, 0.184617, -0.5874806, 1, 0, 0.4039216, 1,
1.472177, -1.535286, 4.431556, 1, 0, 0.3960784, 1,
1.47239, 0.5962648, 0.3299704, 1, 0, 0.3882353, 1,
1.475035, -1.011843, 3.924924, 1, 0, 0.3843137, 1,
1.475816, 1.750286, 0.4754863, 1, 0, 0.3764706, 1,
1.481943, 0.5352067, 1.418382, 1, 0, 0.372549, 1,
1.482192, -0.6642194, 3.20237, 1, 0, 0.3647059, 1,
1.483811, -0.8502391, 2.460902, 1, 0, 0.3607843, 1,
1.525034, 0.03680009, 0.8210178, 1, 0, 0.3529412, 1,
1.542255, -0.7627786, 1.090928, 1, 0, 0.3490196, 1,
1.543978, 1.567524, 1.032824, 1, 0, 0.3411765, 1,
1.566186, -0.3467885, 1.965341, 1, 0, 0.3372549, 1,
1.571871, -1.703668, 2.172779, 1, 0, 0.3294118, 1,
1.61194, -0.2712405, 2.613409, 1, 0, 0.3254902, 1,
1.616003, -0.3080514, 1.312669, 1, 0, 0.3176471, 1,
1.617757, -0.2651017, 1.068834, 1, 0, 0.3137255, 1,
1.62, 1.672749, -0.7091633, 1, 0, 0.3058824, 1,
1.62585, 0.5859768, 2.782651, 1, 0, 0.2980392, 1,
1.637295, -1.640983, 0.7913261, 1, 0, 0.2941177, 1,
1.64256, 0.2886113, 2.052301, 1, 0, 0.2862745, 1,
1.653868, 0.1499523, 2.081733, 1, 0, 0.282353, 1,
1.660879, 0.9313079, 1.114207, 1, 0, 0.2745098, 1,
1.66157, 1.493395, 2.812832, 1, 0, 0.2705882, 1,
1.673401, -1.075093, 3.173431, 1, 0, 0.2627451, 1,
1.687174, -1.330052, 1.129629, 1, 0, 0.2588235, 1,
1.71233, 0.3531636, 0.5621045, 1, 0, 0.2509804, 1,
1.727847, -0.453528, 1.877413, 1, 0, 0.2470588, 1,
1.735648, 0.3780301, 0.4154116, 1, 0, 0.2392157, 1,
1.757994, -0.8047326, 1.52973, 1, 0, 0.2352941, 1,
1.761978, 1.551699, 1.474529, 1, 0, 0.227451, 1,
1.765558, -0.1193661, 0.8844545, 1, 0, 0.2235294, 1,
1.771414, 0.872056, 0.0970539, 1, 0, 0.2156863, 1,
1.77991, 1.83454, 0.3683154, 1, 0, 0.2117647, 1,
1.781038, 1.086317, -0.1122923, 1, 0, 0.2039216, 1,
1.80081, -0.7804986, -0.5082768, 1, 0, 0.1960784, 1,
1.807633, -0.13357, 2.667805, 1, 0, 0.1921569, 1,
1.820029, 0.1170249, 1.739245, 1, 0, 0.1843137, 1,
1.827578, 1.032055, 0.3674958, 1, 0, 0.1803922, 1,
1.845293, 0.4126445, 1.368054, 1, 0, 0.172549, 1,
1.848508, -1.169394, 2.802328, 1, 0, 0.1686275, 1,
1.875845, -0.7670676, 2.422968, 1, 0, 0.1607843, 1,
1.88052, 0.3566006, 2.255781, 1, 0, 0.1568628, 1,
1.885083, 0.7337116, 1.632385, 1, 0, 0.1490196, 1,
1.899785, -1.612145, 3.485737, 1, 0, 0.145098, 1,
1.903764, -1.514093, 3.066707, 1, 0, 0.1372549, 1,
1.907943, 0.6618397, 0.6741002, 1, 0, 0.1333333, 1,
1.909562, -1.266477, 1.953381, 1, 0, 0.1254902, 1,
1.914223, 1.16592, 0.8516262, 1, 0, 0.1215686, 1,
1.953021, -0.4161882, 2.015382, 1, 0, 0.1137255, 1,
1.961289, -0.2218518, 0.2738649, 1, 0, 0.1098039, 1,
1.971752, 0.8156181, 0.795837, 1, 0, 0.1019608, 1,
1.986038, -0.7808782, 3.557087, 1, 0, 0.09411765, 1,
1.996032, -0.3586288, 1.74157, 1, 0, 0.09019608, 1,
2.013898, -0.492659, 2.826351, 1, 0, 0.08235294, 1,
2.030378, 0.1763014, 3.028097, 1, 0, 0.07843138, 1,
2.055157, 0.2208876, 1.7339, 1, 0, 0.07058824, 1,
2.078545, 1.07268, 1.247562, 1, 0, 0.06666667, 1,
2.137196, 0.7181286, 1.958741, 1, 0, 0.05882353, 1,
2.143255, 0.4674835, 1.621576, 1, 0, 0.05490196, 1,
2.177787, -1.113397, 2.779802, 1, 0, 0.04705882, 1,
2.314577, 0.700412, 1.776912, 1, 0, 0.04313726, 1,
2.374355, 0.606104, 2.197505, 1, 0, 0.03529412, 1,
2.504008, -0.2254016, 1.114594, 1, 0, 0.03137255, 1,
2.507056, -0.2327977, 2.434579, 1, 0, 0.02352941, 1,
2.620021, 1.321749, 2.197684, 1, 0, 0.01960784, 1,
2.901103, -0.09796564, 3.849685, 1, 0, 0.01176471, 1,
2.908849, -0.7037131, 1.623703, 1, 0, 0.007843138, 1
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
-0.169263, -3.98839, -6.864784, 0, -0.5, 0.5, 0.5,
-0.169263, -3.98839, -6.864784, 1, -0.5, 0.5, 0.5,
-0.169263, -3.98839, -6.864784, 1, 1.5, 0.5, 0.5,
-0.169263, -3.98839, -6.864784, 0, 1.5, 0.5, 0.5
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
-4.290855, 0.1059513, -6.864784, 0, -0.5, 0.5, 0.5,
-4.290855, 0.1059513, -6.864784, 1, -0.5, 0.5, 0.5,
-4.290855, 0.1059513, -6.864784, 1, 1.5, 0.5, 0.5,
-4.290855, 0.1059513, -6.864784, 0, 1.5, 0.5, 0.5
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
-4.290855, -3.98839, -0.08805513, 0, -0.5, 0.5, 0.5,
-4.290855, -3.98839, -0.08805513, 1, -0.5, 0.5, 0.5,
-4.290855, -3.98839, -0.08805513, 1, 1.5, 0.5, 0.5,
-4.290855, -3.98839, -0.08805513, 0, 1.5, 0.5, 0.5
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
-3, -3.043542, -5.300924,
2, -3.043542, -5.300924,
-3, -3.043542, -5.300924,
-3, -3.201017, -5.561567,
-2, -3.043542, -5.300924,
-2, -3.201017, -5.561567,
-1, -3.043542, -5.300924,
-1, -3.201017, -5.561567,
0, -3.043542, -5.300924,
0, -3.201017, -5.561567,
1, -3.043542, -5.300924,
1, -3.201017, -5.561567,
2, -3.043542, -5.300924,
2, -3.201017, -5.561567
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
-3, -3.515966, -6.082854, 0, -0.5, 0.5, 0.5,
-3, -3.515966, -6.082854, 1, -0.5, 0.5, 0.5,
-3, -3.515966, -6.082854, 1, 1.5, 0.5, 0.5,
-3, -3.515966, -6.082854, 0, 1.5, 0.5, 0.5,
-2, -3.515966, -6.082854, 0, -0.5, 0.5, 0.5,
-2, -3.515966, -6.082854, 1, -0.5, 0.5, 0.5,
-2, -3.515966, -6.082854, 1, 1.5, 0.5, 0.5,
-2, -3.515966, -6.082854, 0, 1.5, 0.5, 0.5,
-1, -3.515966, -6.082854, 0, -0.5, 0.5, 0.5,
-1, -3.515966, -6.082854, 1, -0.5, 0.5, 0.5,
-1, -3.515966, -6.082854, 1, 1.5, 0.5, 0.5,
-1, -3.515966, -6.082854, 0, 1.5, 0.5, 0.5,
0, -3.515966, -6.082854, 0, -0.5, 0.5, 0.5,
0, -3.515966, -6.082854, 1, -0.5, 0.5, 0.5,
0, -3.515966, -6.082854, 1, 1.5, 0.5, 0.5,
0, -3.515966, -6.082854, 0, 1.5, 0.5, 0.5,
1, -3.515966, -6.082854, 0, -0.5, 0.5, 0.5,
1, -3.515966, -6.082854, 1, -0.5, 0.5, 0.5,
1, -3.515966, -6.082854, 1, 1.5, 0.5, 0.5,
1, -3.515966, -6.082854, 0, 1.5, 0.5, 0.5,
2, -3.515966, -6.082854, 0, -0.5, 0.5, 0.5,
2, -3.515966, -6.082854, 1, -0.5, 0.5, 0.5,
2, -3.515966, -6.082854, 1, 1.5, 0.5, 0.5,
2, -3.515966, -6.082854, 0, 1.5, 0.5, 0.5
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
-3.339719, -2, -5.300924,
-3.339719, 3, -5.300924,
-3.339719, -2, -5.300924,
-3.498241, -2, -5.561567,
-3.339719, -1, -5.300924,
-3.498241, -1, -5.561567,
-3.339719, 0, -5.300924,
-3.498241, 0, -5.561567,
-3.339719, 1, -5.300924,
-3.498241, 1, -5.561567,
-3.339719, 2, -5.300924,
-3.498241, 2, -5.561567,
-3.339719, 3, -5.300924,
-3.498241, 3, -5.561567
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
-3.815287, -2, -6.082854, 0, -0.5, 0.5, 0.5,
-3.815287, -2, -6.082854, 1, -0.5, 0.5, 0.5,
-3.815287, -2, -6.082854, 1, 1.5, 0.5, 0.5,
-3.815287, -2, -6.082854, 0, 1.5, 0.5, 0.5,
-3.815287, -1, -6.082854, 0, -0.5, 0.5, 0.5,
-3.815287, -1, -6.082854, 1, -0.5, 0.5, 0.5,
-3.815287, -1, -6.082854, 1, 1.5, 0.5, 0.5,
-3.815287, -1, -6.082854, 0, 1.5, 0.5, 0.5,
-3.815287, 0, -6.082854, 0, -0.5, 0.5, 0.5,
-3.815287, 0, -6.082854, 1, -0.5, 0.5, 0.5,
-3.815287, 0, -6.082854, 1, 1.5, 0.5, 0.5,
-3.815287, 0, -6.082854, 0, 1.5, 0.5, 0.5,
-3.815287, 1, -6.082854, 0, -0.5, 0.5, 0.5,
-3.815287, 1, -6.082854, 1, -0.5, 0.5, 0.5,
-3.815287, 1, -6.082854, 1, 1.5, 0.5, 0.5,
-3.815287, 1, -6.082854, 0, 1.5, 0.5, 0.5,
-3.815287, 2, -6.082854, 0, -0.5, 0.5, 0.5,
-3.815287, 2, -6.082854, 1, -0.5, 0.5, 0.5,
-3.815287, 2, -6.082854, 1, 1.5, 0.5, 0.5,
-3.815287, 2, -6.082854, 0, 1.5, 0.5, 0.5,
-3.815287, 3, -6.082854, 0, -0.5, 0.5, 0.5,
-3.815287, 3, -6.082854, 1, -0.5, 0.5, 0.5,
-3.815287, 3, -6.082854, 1, 1.5, 0.5, 0.5,
-3.815287, 3, -6.082854, 0, 1.5, 0.5, 0.5
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
-3.339719, -3.043542, -4,
-3.339719, -3.043542, 4,
-3.339719, -3.043542, -4,
-3.498241, -3.201017, -4,
-3.339719, -3.043542, -2,
-3.498241, -3.201017, -2,
-3.339719, -3.043542, 0,
-3.498241, -3.201017, 0,
-3.339719, -3.043542, 2,
-3.498241, -3.201017, 2,
-3.339719, -3.043542, 4,
-3.498241, -3.201017, 4
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
-3.815287, -3.515966, -4, 0, -0.5, 0.5, 0.5,
-3.815287, -3.515966, -4, 1, -0.5, 0.5, 0.5,
-3.815287, -3.515966, -4, 1, 1.5, 0.5, 0.5,
-3.815287, -3.515966, -4, 0, 1.5, 0.5, 0.5,
-3.815287, -3.515966, -2, 0, -0.5, 0.5, 0.5,
-3.815287, -3.515966, -2, 1, -0.5, 0.5, 0.5,
-3.815287, -3.515966, -2, 1, 1.5, 0.5, 0.5,
-3.815287, -3.515966, -2, 0, 1.5, 0.5, 0.5,
-3.815287, -3.515966, 0, 0, -0.5, 0.5, 0.5,
-3.815287, -3.515966, 0, 1, -0.5, 0.5, 0.5,
-3.815287, -3.515966, 0, 1, 1.5, 0.5, 0.5,
-3.815287, -3.515966, 0, 0, 1.5, 0.5, 0.5,
-3.815287, -3.515966, 2, 0, -0.5, 0.5, 0.5,
-3.815287, -3.515966, 2, 1, -0.5, 0.5, 0.5,
-3.815287, -3.515966, 2, 1, 1.5, 0.5, 0.5,
-3.815287, -3.515966, 2, 0, 1.5, 0.5, 0.5,
-3.815287, -3.515966, 4, 0, -0.5, 0.5, 0.5,
-3.815287, -3.515966, 4, 1, -0.5, 0.5, 0.5,
-3.815287, -3.515966, 4, 1, 1.5, 0.5, 0.5,
-3.815287, -3.515966, 4, 0, 1.5, 0.5, 0.5
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
-3.339719, -3.043542, -5.300924,
-3.339719, 3.255445, -5.300924,
-3.339719, -3.043542, 5.124814,
-3.339719, 3.255445, 5.124814,
-3.339719, -3.043542, -5.300924,
-3.339719, -3.043542, 5.124814,
-3.339719, 3.255445, -5.300924,
-3.339719, 3.255445, 5.124814,
-3.339719, -3.043542, -5.300924,
3.001193, -3.043542, -5.300924,
-3.339719, -3.043542, 5.124814,
3.001193, -3.043542, 5.124814,
-3.339719, 3.255445, -5.300924,
3.001193, 3.255445, -5.300924,
-3.339719, 3.255445, 5.124814,
3.001193, 3.255445, 5.124814,
3.001193, -3.043542, -5.300924,
3.001193, 3.255445, -5.300924,
3.001193, -3.043542, 5.124814,
3.001193, 3.255445, 5.124814,
3.001193, -3.043542, -5.300924,
3.001193, -3.043542, 5.124814,
3.001193, 3.255445, -5.300924,
3.001193, 3.255445, 5.124814
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
var radius = 7.332866;
var distance = 32.62475;
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
mvMatrix.translate( 0.169263, -0.1059513, 0.08805513 );
mvMatrix.scale( 1.250363, 1.258685, 0.7604678 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.62475);
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
phosphorodithioate<-read.table("phosphorodithioate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosphorodithioate$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphorodithioate' not found
```

```r
y<-phosphorodithioate$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphorodithioate' not found
```

```r
z<-phosphorodithioate$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphorodithioate' not found
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
-3.247375, 0.09409721, -0.6829376, 0, 0, 1, 1, 1,
-3.199517, 1.303383, -1.431331, 1, 0, 0, 1, 1,
-2.690944, 1.03518, -1.904602, 1, 0, 0, 1, 1,
-2.635574, 0.9204276, -0.4107578, 1, 0, 0, 1, 1,
-2.512073, 0.2285309, -1.211049, 1, 0, 0, 1, 1,
-2.414772, -0.7062106, -3.950872, 1, 0, 0, 1, 1,
-2.265094, -0.2789736, -0.842821, 0, 0, 0, 1, 1,
-2.171587, 0.4765925, -0.7833324, 0, 0, 0, 1, 1,
-2.165966, -0.772936, -3.805966, 0, 0, 0, 1, 1,
-2.165266, -1.228723, -1.849542, 0, 0, 0, 1, 1,
-2.152901, -1.872589, -2.828468, 0, 0, 0, 1, 1,
-2.150085, -0.5292875, -1.116646, 0, 0, 0, 1, 1,
-2.135227, 1.456088, -0.3046806, 0, 0, 0, 1, 1,
-2.127655, -0.3714263, -0.2780771, 1, 1, 1, 1, 1,
-2.109971, 1.18733, -0.8656561, 1, 1, 1, 1, 1,
-2.099108, -0.7792735, -1.398222, 1, 1, 1, 1, 1,
-2.070044, 2.024331, 0.07446548, 1, 1, 1, 1, 1,
-2.065383, -0.1974118, -0.7665334, 1, 1, 1, 1, 1,
-2.011738, -0.5428237, -0.2628068, 1, 1, 1, 1, 1,
-1.999324, 0.203437, 1.47632, 1, 1, 1, 1, 1,
-1.989002, -2.162099, -2.027255, 1, 1, 1, 1, 1,
-1.976912, 0.663715, -2.524026, 1, 1, 1, 1, 1,
-1.968974, -1.55859, -1.229995, 1, 1, 1, 1, 1,
-1.96592, -0.6249055, -1.637074, 1, 1, 1, 1, 1,
-1.918814, -0.8025537, -2.157603, 1, 1, 1, 1, 1,
-1.890852, -0.0860739, -1.7358, 1, 1, 1, 1, 1,
-1.882809, 0.5351838, -1.651498, 1, 1, 1, 1, 1,
-1.879006, -0.433741, -2.639901, 1, 1, 1, 1, 1,
-1.850989, 0.4412879, -0.9667233, 0, 0, 1, 1, 1,
-1.834612, -0.1014156, -2.343009, 1, 0, 0, 1, 1,
-1.811613, 1.234844, -0.7248903, 1, 0, 0, 1, 1,
-1.810309, -2.286635, -1.808435, 1, 0, 0, 1, 1,
-1.804112, -0.2213024, -1.437595, 1, 0, 0, 1, 1,
-1.798581, 0.03543785, -1.96609, 1, 0, 0, 1, 1,
-1.78499, 2.264083, -0.9674047, 0, 0, 0, 1, 1,
-1.772885, 1.1281, 0.3365032, 0, 0, 0, 1, 1,
-1.768195, -1.780328, -3.569894, 0, 0, 0, 1, 1,
-1.75807, -0.1365728, -3.056413, 0, 0, 0, 1, 1,
-1.746728, -1.434769, -1.837334, 0, 0, 0, 1, 1,
-1.739758, -0.08433216, -1.035254, 0, 0, 0, 1, 1,
-1.731665, 1.138547, -1.314693, 0, 0, 0, 1, 1,
-1.72902, 0.2038977, -1.461907, 1, 1, 1, 1, 1,
-1.724164, 1.141209, -1.424868, 1, 1, 1, 1, 1,
-1.700262, 1.481008, 0.3620674, 1, 1, 1, 1, 1,
-1.677983, -0.8149235, -2.883389, 1, 1, 1, 1, 1,
-1.677461, 0.4974674, 0.09768907, 1, 1, 1, 1, 1,
-1.674617, -0.3728307, -3.884913, 1, 1, 1, 1, 1,
-1.669129, -0.7278271, -2.931247, 1, 1, 1, 1, 1,
-1.648046, 1.158912, -1.221919, 1, 1, 1, 1, 1,
-1.645621, 0.07042767, -0.04727874, 1, 1, 1, 1, 1,
-1.643144, -0.5028518, -0.878506, 1, 1, 1, 1, 1,
-1.6425, -0.749295, -0.398104, 1, 1, 1, 1, 1,
-1.63798, -0.3092657, -2.290776, 1, 1, 1, 1, 1,
-1.62817, 0.03662375, 0.2863733, 1, 1, 1, 1, 1,
-1.626847, 0.5466534, -1.260925, 1, 1, 1, 1, 1,
-1.619117, 0.5199131, 0.02718536, 1, 1, 1, 1, 1,
-1.61695, -1.175362, -1.867803, 0, 0, 1, 1, 1,
-1.615807, 0.5682958, -1.219528, 1, 0, 0, 1, 1,
-1.614408, -1.104849, -3.292688, 1, 0, 0, 1, 1,
-1.600346, -0.9161588, -0.9798558, 1, 0, 0, 1, 1,
-1.594889, -1.189724, -2.270665, 1, 0, 0, 1, 1,
-1.583372, -0.6028225, -2.24597, 1, 0, 0, 1, 1,
-1.578004, -1.432063, -1.336982, 0, 0, 0, 1, 1,
-1.568053, -0.06131252, -3.335575, 0, 0, 0, 1, 1,
-1.549551, 0.227724, -1.014706, 0, 0, 0, 1, 1,
-1.549375, 0.4130532, -0.7864088, 0, 0, 0, 1, 1,
-1.545201, -1.771397, -1.764684, 0, 0, 0, 1, 1,
-1.539211, 1.308162, -1.721788, 0, 0, 0, 1, 1,
-1.493927, -1.196486, -1.226233, 0, 0, 0, 1, 1,
-1.482964, -0.1719219, -1.043419, 1, 1, 1, 1, 1,
-1.482041, 0.0490811, -1.176524, 1, 1, 1, 1, 1,
-1.474851, 0.3284273, -1.950323, 1, 1, 1, 1, 1,
-1.473826, 1.390584, -1.436014, 1, 1, 1, 1, 1,
-1.450856, 0.7190195, -2.460375, 1, 1, 1, 1, 1,
-1.447109, 0.3177821, -1.438642, 1, 1, 1, 1, 1,
-1.419656, -0.4227985, -2.531204, 1, 1, 1, 1, 1,
-1.410503, -0.8529736, -1.46285, 1, 1, 1, 1, 1,
-1.403578, 0.988557, -1.478559, 1, 1, 1, 1, 1,
-1.396096, -0.09508987, -2.368015, 1, 1, 1, 1, 1,
-1.393866, 0.2509526, -0.6680428, 1, 1, 1, 1, 1,
-1.387063, 0.4841765, -2.329137, 1, 1, 1, 1, 1,
-1.384602, -1.037668, -1.449853, 1, 1, 1, 1, 1,
-1.375532, 0.4052832, -0.4436619, 1, 1, 1, 1, 1,
-1.375348, 0.8376917, -1.481482, 1, 1, 1, 1, 1,
-1.369158, 0.2063589, -1.096278, 0, 0, 1, 1, 1,
-1.362981, -0.3460711, -1.791621, 1, 0, 0, 1, 1,
-1.359917, -0.7913946, -0.8840008, 1, 0, 0, 1, 1,
-1.359233, -0.2123444, -0.3161407, 1, 0, 0, 1, 1,
-1.358097, -0.7470865, -2.611025, 1, 0, 0, 1, 1,
-1.357546, -2.307752, -4.292239, 1, 0, 0, 1, 1,
-1.35587, 0.2470553, -1.206458, 0, 0, 0, 1, 1,
-1.343611, 0.3758493, -1.40187, 0, 0, 0, 1, 1,
-1.336742, 0.9789841, 0.2556135, 0, 0, 0, 1, 1,
-1.324721, -0.2484917, -0.2384188, 0, 0, 0, 1, 1,
-1.323094, -1.260231, -2.899476, 0, 0, 0, 1, 1,
-1.322892, -0.1360862, -0.548372, 0, 0, 0, 1, 1,
-1.312046, 0.5393817, 0.1808922, 0, 0, 0, 1, 1,
-1.308985, -1.539326, -0.4149998, 1, 1, 1, 1, 1,
-1.303353, -2.160693, -2.527161, 1, 1, 1, 1, 1,
-1.303254, 1.032291, -0.01316031, 1, 1, 1, 1, 1,
-1.302265, -0.4708745, -0.7594762, 1, 1, 1, 1, 1,
-1.30074, -1.209802, -0.8299637, 1, 1, 1, 1, 1,
-1.288266, 0.1942049, -1.193689, 1, 1, 1, 1, 1,
-1.287492, 0.4174291, -0.3875792, 1, 1, 1, 1, 1,
-1.281958, 2.235141, -0.4723138, 1, 1, 1, 1, 1,
-1.274125, 1.276114, 0.3182972, 1, 1, 1, 1, 1,
-1.268995, -0.2449025, -1.114248, 1, 1, 1, 1, 1,
-1.264259, 0.1480615, -0.7246075, 1, 1, 1, 1, 1,
-1.259778, -0.1800353, -0.7770029, 1, 1, 1, 1, 1,
-1.256698, -0.211589, -2.194025, 1, 1, 1, 1, 1,
-1.255335, 3.163712, 1.302969, 1, 1, 1, 1, 1,
-1.253877, 1.846961, -1.269152, 1, 1, 1, 1, 1,
-1.244747, 2.660838, -1.332833, 0, 0, 1, 1, 1,
-1.210435, -1.215261, -4.724465, 1, 0, 0, 1, 1,
-1.206205, 0.34233, -0.2877171, 1, 0, 0, 1, 1,
-1.201939, 1.550904, -1.474993, 1, 0, 0, 1, 1,
-1.20038, -0.7788963, -1.297765, 1, 0, 0, 1, 1,
-1.185096, -0.1160419, -1.885848, 1, 0, 0, 1, 1,
-1.184815, -0.2658941, -1.407689, 0, 0, 0, 1, 1,
-1.183942, 0.429903, -0.2988764, 0, 0, 0, 1, 1,
-1.180202, 0.7326726, -1.576994, 0, 0, 0, 1, 1,
-1.17997, -0.14394, -1.272318, 0, 0, 0, 1, 1,
-1.169524, -0.6179494, -0.7469568, 0, 0, 0, 1, 1,
-1.166835, -0.8310756, -2.230703, 0, 0, 0, 1, 1,
-1.14705, -1.815454, -3.124148, 0, 0, 0, 1, 1,
-1.14438, 0.1878304, -2.970109, 1, 1, 1, 1, 1,
-1.141418, 1.274881, -2.001393, 1, 1, 1, 1, 1,
-1.14066, -1.824772, -2.91135, 1, 1, 1, 1, 1,
-1.140236, 1.366758, -0.9340654, 1, 1, 1, 1, 1,
-1.136954, 0.5140493, -1.965676, 1, 1, 1, 1, 1,
-1.131728, -1.409478, -2.065264, 1, 1, 1, 1, 1,
-1.12925, 0.4216588, -0.9627063, 1, 1, 1, 1, 1,
-1.125588, -0.9127494, -1.835247, 1, 1, 1, 1, 1,
-1.114246, -0.63574, -3.430712, 1, 1, 1, 1, 1,
-1.112122, 1.065534, -1.34526, 1, 1, 1, 1, 1,
-1.105328, -0.8450783, -2.354327, 1, 1, 1, 1, 1,
-1.101451, -1.806202, -0.8803135, 1, 1, 1, 1, 1,
-1.099091, 1.15055, -2.050283, 1, 1, 1, 1, 1,
-1.096131, 0.5439461, -0.528757, 1, 1, 1, 1, 1,
-1.093408, -0.4761225, -1.69644, 1, 1, 1, 1, 1,
-1.090418, -0.8059275, -2.557539, 0, 0, 1, 1, 1,
-1.08924, -1.623781, -2.356213, 1, 0, 0, 1, 1,
-1.085957, 0.1990961, -1.638137, 1, 0, 0, 1, 1,
-1.055934, -1.188117, -2.236727, 1, 0, 0, 1, 1,
-1.055432, 0.7668158, -0.9906066, 1, 0, 0, 1, 1,
-1.045151, -2.071337, -0.9814071, 1, 0, 0, 1, 1,
-1.039415, -1.273812, -2.136324, 0, 0, 0, 1, 1,
-1.038556, -1.174683, -1.683025, 0, 0, 0, 1, 1,
-1.028679, -0.4487605, -3.191332, 0, 0, 0, 1, 1,
-1.025854, 2.479356, -0.1771297, 0, 0, 0, 1, 1,
-1.018493, -0.7393081, -3.025482, 0, 0, 0, 1, 1,
-1.017631, -1.824465, -3.374549, 0, 0, 0, 1, 1,
-1.016703, 0.5741766, 0.6074272, 0, 0, 0, 1, 1,
-1.008949, 1.524415, -1.914533, 1, 1, 1, 1, 1,
-1.006416, -2.283197, -2.352677, 1, 1, 1, 1, 1,
-1.005239, 1.176009, -0.833611, 1, 1, 1, 1, 1,
-0.9891818, -0.5097417, -2.542902, 1, 1, 1, 1, 1,
-0.9859252, -0.4885209, -3.738154, 1, 1, 1, 1, 1,
-0.9760497, 0.6558525, 0.5088294, 1, 1, 1, 1, 1,
-0.9750936, -0.1769477, -1.756083, 1, 1, 1, 1, 1,
-0.9734965, 0.1988471, -0.7094923, 1, 1, 1, 1, 1,
-0.9660689, -0.179885, -1.917952, 1, 1, 1, 1, 1,
-0.9634476, 0.07741017, 1.266092, 1, 1, 1, 1, 1,
-0.9629049, -1.490175, -2.052259, 1, 1, 1, 1, 1,
-0.960012, -1.435853, -2.065347, 1, 1, 1, 1, 1,
-0.9599558, 0.001334402, -1.036012, 1, 1, 1, 1, 1,
-0.9556735, -0.442047, -0.9774742, 1, 1, 1, 1, 1,
-0.9539421, -0.2533115, -0.129498, 1, 1, 1, 1, 1,
-0.9502308, -0.4508652, -1.948065, 0, 0, 1, 1, 1,
-0.947231, -0.4491197, -1.32711, 1, 0, 0, 1, 1,
-0.9431491, -1.671276, -1.946851, 1, 0, 0, 1, 1,
-0.93528, 0.01195468, -0.7959543, 1, 0, 0, 1, 1,
-0.929913, -0.9771762, -1.715478, 1, 0, 0, 1, 1,
-0.9279254, -0.1945098, -2.924772, 1, 0, 0, 1, 1,
-0.9277811, -0.2865937, -0.4821884, 0, 0, 0, 1, 1,
-0.9270424, -0.1688253, -0.9803186, 0, 0, 0, 1, 1,
-0.9239463, 1.380401, -1.580251, 0, 0, 0, 1, 1,
-0.9231776, -2.392072, -5.149093, 0, 0, 0, 1, 1,
-0.9230068, -0.3212577, -1.544257, 0, 0, 0, 1, 1,
-0.9214027, 0.2034098, -0.2067194, 0, 0, 0, 1, 1,
-0.9155049, -0.3594002, -2.365727, 0, 0, 0, 1, 1,
-0.9081599, -1.125968, -3.10454, 1, 1, 1, 1, 1,
-0.9044685, -0.5174542, -1.268721, 1, 1, 1, 1, 1,
-0.9032629, -0.8999098, -0.7878888, 1, 1, 1, 1, 1,
-0.9025774, 0.1593114, -0.906451, 1, 1, 1, 1, 1,
-0.8894814, 0.15294, -0.7716495, 1, 1, 1, 1, 1,
-0.8854504, 0.6854691, -0.2578589, 1, 1, 1, 1, 1,
-0.8824684, -0.7603142, -0.9901876, 1, 1, 1, 1, 1,
-0.8809502, -0.1515349, -2.126922, 1, 1, 1, 1, 1,
-0.8789514, 1.152168, 0.878279, 1, 1, 1, 1, 1,
-0.8769644, 0.248429, -1.932304, 1, 1, 1, 1, 1,
-0.8757815, -0.4028031, -2.10955, 1, 1, 1, 1, 1,
-0.860211, 0.6142375, 0.2763587, 1, 1, 1, 1, 1,
-0.8601009, 0.1844279, -1.720752, 1, 1, 1, 1, 1,
-0.8583871, 0.4172942, 0.1878704, 1, 1, 1, 1, 1,
-0.8569095, -0.4810938, -1.054786, 1, 1, 1, 1, 1,
-0.8514031, -0.3288499, -2.977468, 0, 0, 1, 1, 1,
-0.8486182, 1.193131, -0.7069159, 1, 0, 0, 1, 1,
-0.8386434, -0.2526362, -1.527995, 1, 0, 0, 1, 1,
-0.8379602, -1.272316, -2.623229, 1, 0, 0, 1, 1,
-0.8335328, -1.401549, -3.308264, 1, 0, 0, 1, 1,
-0.8323812, 1.560276, -2.311464, 1, 0, 0, 1, 1,
-0.8256644, -2.938306, -4.326621, 0, 0, 0, 1, 1,
-0.8151921, 0.5259209, -0.8847172, 0, 0, 0, 1, 1,
-0.8132247, -0.5284344, -1.87805, 0, 0, 0, 1, 1,
-0.8109141, -1.434813, -0.9878812, 0, 0, 0, 1, 1,
-0.8108141, 2.204738, -0.9901338, 0, 0, 0, 1, 1,
-0.8078468, -1.045183, -1.565688, 0, 0, 0, 1, 1,
-0.8028126, -1.167747, -2.966319, 0, 0, 0, 1, 1,
-0.8026235, 0.2233102, 0.04158796, 1, 1, 1, 1, 1,
-0.8018315, -2.235446, -2.066512, 1, 1, 1, 1, 1,
-0.8005605, 1.310509, -0.8417393, 1, 1, 1, 1, 1,
-0.7994556, -1.350129, -2.896727, 1, 1, 1, 1, 1,
-0.7978703, 1.682796, -1.043746, 1, 1, 1, 1, 1,
-0.7928996, 0.3656745, -1.582187, 1, 1, 1, 1, 1,
-0.7919556, -0.3274386, -2.839338, 1, 1, 1, 1, 1,
-0.7905579, 0.9344838, 0.1545633, 1, 1, 1, 1, 1,
-0.7904406, -0.6468121, -2.342048, 1, 1, 1, 1, 1,
-0.7890646, 0.2227527, -2.217884, 1, 1, 1, 1, 1,
-0.7867994, -0.1172963, -2.764663, 1, 1, 1, 1, 1,
-0.7858235, 0.317809, -2.992661, 1, 1, 1, 1, 1,
-0.785814, -0.8878472, -2.363207, 1, 1, 1, 1, 1,
-0.7834671, -1.776253, -3.536484, 1, 1, 1, 1, 1,
-0.7834668, -0.3236089, -2.540875, 1, 1, 1, 1, 1,
-0.7744194, -0.3447354, -2.839037, 0, 0, 1, 1, 1,
-0.7716323, 0.9498022, -0.9665298, 1, 0, 0, 1, 1,
-0.7684538, -0.2628746, 0.3000798, 1, 0, 0, 1, 1,
-0.7661072, 1.888631, -0.4555356, 1, 0, 0, 1, 1,
-0.7653717, -1.371608, -2.804483, 1, 0, 0, 1, 1,
-0.7611057, 1.626828, -0.1555421, 1, 0, 0, 1, 1,
-0.7607453, -1.692183, -4.048697, 0, 0, 0, 1, 1,
-0.7596498, -0.5067709, -2.431712, 0, 0, 0, 1, 1,
-0.7594444, -1.642655, -2.430146, 0, 0, 0, 1, 1,
-0.7578821, -0.3136486, -2.013619, 0, 0, 0, 1, 1,
-0.7551202, 0.1619764, -1.643828, 0, 0, 0, 1, 1,
-0.7547777, -0.1093583, -1.413139, 0, 0, 0, 1, 1,
-0.7465397, -0.04816656, -0.8232751, 0, 0, 0, 1, 1,
-0.7450734, 1.496341, 1.941189, 1, 1, 1, 1, 1,
-0.7423481, 0.7501493, -1.394027, 1, 1, 1, 1, 1,
-0.7423084, 1.484571, -0.09568512, 1, 1, 1, 1, 1,
-0.7365615, 0.3167504, -1.756968, 1, 1, 1, 1, 1,
-0.7341083, -1.397827, -1.120293, 1, 1, 1, 1, 1,
-0.7341073, -1.47036, -2.712901, 1, 1, 1, 1, 1,
-0.7323917, 0.9598268, -0.3448094, 1, 1, 1, 1, 1,
-0.7261626, -0.4937, -4.47763, 1, 1, 1, 1, 1,
-0.7217947, -1.278099, -4.343979, 1, 1, 1, 1, 1,
-0.7109336, -0.175449, -1.297172, 1, 1, 1, 1, 1,
-0.7094318, 0.8849717, 0.6036965, 1, 1, 1, 1, 1,
-0.6792454, -1.920651, -2.588571, 1, 1, 1, 1, 1,
-0.6746512, 1.375222, -1.633074, 1, 1, 1, 1, 1,
-0.6745009, 0.6830277, 0.2617514, 1, 1, 1, 1, 1,
-0.6733097, -1.052132, -4.092265, 1, 1, 1, 1, 1,
-0.6726426, 3.044407, 0.9249201, 0, 0, 1, 1, 1,
-0.6698367, -0.6192604, -1.795367, 1, 0, 0, 1, 1,
-0.6690628, -0.7163382, -2.726081, 1, 0, 0, 1, 1,
-0.6668565, 0.4627644, 0.1591845, 1, 0, 0, 1, 1,
-0.6604853, 1.63728, -1.249053, 1, 0, 0, 1, 1,
-0.6535847, -0.7841638, -2.423562, 1, 0, 0, 1, 1,
-0.6535632, 0.3261172, -0.6784485, 0, 0, 0, 1, 1,
-0.6522266, -1.413389, -3.877328, 0, 0, 0, 1, 1,
-0.6521319, -0.01509109, -1.000982, 0, 0, 0, 1, 1,
-0.649657, 0.6711414, -1.32858, 0, 0, 0, 1, 1,
-0.6485717, 1.722384, -0.1191987, 0, 0, 0, 1, 1,
-0.6482794, 0.524231, 1.115683, 0, 0, 0, 1, 1,
-0.64627, -0.3797902, -2.473442, 0, 0, 0, 1, 1,
-0.6451847, -1.672212, -1.497544, 1, 1, 1, 1, 1,
-0.6451645, -0.8971886, -1.592488, 1, 1, 1, 1, 1,
-0.6447864, 1.257314, -2.433454, 1, 1, 1, 1, 1,
-0.6419885, -1.162565, -1.008392, 1, 1, 1, 1, 1,
-0.6392776, -0.312496, -1.561815, 1, 1, 1, 1, 1,
-0.6288724, -0.1875625, -0.8166867, 1, 1, 1, 1, 1,
-0.624958, 0.4790994, -1.873363, 1, 1, 1, 1, 1,
-0.6170312, -1.598684, -3.72791, 1, 1, 1, 1, 1,
-0.6158959, -0.2385145, -3.192518, 1, 1, 1, 1, 1,
-0.6093737, -0.3059653, -1.905594, 1, 1, 1, 1, 1,
-0.6075818, 1.3487, 0.2230612, 1, 1, 1, 1, 1,
-0.6050633, -0.02366929, -0.7385904, 1, 1, 1, 1, 1,
-0.5983307, 0.1235617, -2.565006, 1, 1, 1, 1, 1,
-0.5957701, 0.2905183, -1.27421, 1, 1, 1, 1, 1,
-0.5931832, -0.2921195, -3.629361, 1, 1, 1, 1, 1,
-0.5921375, 0.8125392, -1.036106, 0, 0, 1, 1, 1,
-0.5896646, -0.3567118, -2.580705, 1, 0, 0, 1, 1,
-0.585852, 1.036487, -0.1153537, 1, 0, 0, 1, 1,
-0.5857721, 0.9653361, -2.661515, 1, 0, 0, 1, 1,
-0.5799881, -0.7612153, -0.4698229, 1, 0, 0, 1, 1,
-0.5796251, -0.4156799, -2.817143, 1, 0, 0, 1, 1,
-0.5788937, -1.153201, -1.49967, 0, 0, 0, 1, 1,
-0.5751348, -0.929344, -2.006654, 0, 0, 0, 1, 1,
-0.5707629, 1.136973, 0.1403102, 0, 0, 0, 1, 1,
-0.5664653, -0.6883409, -2.18626, 0, 0, 0, 1, 1,
-0.5626578, 0.5611085, 0.9488167, 0, 0, 0, 1, 1,
-0.5601717, 0.5471616, 0.8235664, 0, 0, 0, 1, 1,
-0.560074, 0.1976632, -1.142256, 0, 0, 0, 1, 1,
-0.5587229, 2.055984, -2.517451, 1, 1, 1, 1, 1,
-0.5585631, 1.343385, -0.3117059, 1, 1, 1, 1, 1,
-0.5576829, -1.116005, -1.805433, 1, 1, 1, 1, 1,
-0.5561413, 1.071744, 0.583738, 1, 1, 1, 1, 1,
-0.5520928, -1.364775, -3.52569, 1, 1, 1, 1, 1,
-0.5490847, 0.4336902, -0.3908818, 1, 1, 1, 1, 1,
-0.5449874, 0.5359658, -2.576605, 1, 1, 1, 1, 1,
-0.5432162, -0.8419805, -1.137922, 1, 1, 1, 1, 1,
-0.5402025, -1.231457, -3.553879, 1, 1, 1, 1, 1,
-0.5381103, 1.750132, 0.3038037, 1, 1, 1, 1, 1,
-0.5377057, 1.040586, -1.153872, 1, 1, 1, 1, 1,
-0.5365404, 0.4801761, -0.7039697, 1, 1, 1, 1, 1,
-0.5313247, -0.9919877, -4.094153, 1, 1, 1, 1, 1,
-0.5302147, -2.53313, -4.094148, 1, 1, 1, 1, 1,
-0.5300135, 1.253524, -0.09289632, 1, 1, 1, 1, 1,
-0.5273349, -0.6476867, -0.9590253, 0, 0, 1, 1, 1,
-0.5236639, -0.05094746, -3.254075, 1, 0, 0, 1, 1,
-0.519439, -0.0716769, -2.624796, 1, 0, 0, 1, 1,
-0.5183321, 1.884959, -0.3883299, 1, 0, 0, 1, 1,
-0.516191, -0.670625, -2.684356, 1, 0, 0, 1, 1,
-0.513534, -1.506862, -2.753907, 1, 0, 0, 1, 1,
-0.5085599, 0.5632085, 0.05116937, 0, 0, 0, 1, 1,
-0.506129, -0.6299964, -2.414005, 0, 0, 0, 1, 1,
-0.4893155, 0.05849499, -2.061668, 0, 0, 0, 1, 1,
-0.4891031, -0.9838088, -2.109731, 0, 0, 0, 1, 1,
-0.4870486, 0.169947, -2.214362, 0, 0, 0, 1, 1,
-0.4858254, 0.8705234, 2.283103, 0, 0, 0, 1, 1,
-0.4856074, 1.430189, -1.165041, 0, 0, 0, 1, 1,
-0.4815233, -0.442028, -3.024697, 1, 1, 1, 1, 1,
-0.4802773, -1.079685, -3.578128, 1, 1, 1, 1, 1,
-0.4795822, -0.6945143, -1.753152, 1, 1, 1, 1, 1,
-0.466057, -0.7884594, -2.378983, 1, 1, 1, 1, 1,
-0.4658817, -0.1508591, -3.027519, 1, 1, 1, 1, 1,
-0.4588282, -0.1343354, -3.992271, 1, 1, 1, 1, 1,
-0.4581571, -0.1288336, -1.793006, 1, 1, 1, 1, 1,
-0.4538202, 0.371653, -0.2805373, 1, 1, 1, 1, 1,
-0.4501378, -0.4066991, -0.9601203, 1, 1, 1, 1, 1,
-0.4487948, 0.4520468, -1.316469, 1, 1, 1, 1, 1,
-0.4484618, -1.494739, -2.061389, 1, 1, 1, 1, 1,
-0.4346746, 1.255784, -0.6710297, 1, 1, 1, 1, 1,
-0.4328966, 0.6619823, -0.7036852, 1, 1, 1, 1, 1,
-0.4305483, 0.7357878, -0.97745, 1, 1, 1, 1, 1,
-0.4282954, 0.2406117, -1.604233, 1, 1, 1, 1, 1,
-0.4243649, 0.4112094, 0.1171264, 0, 0, 1, 1, 1,
-0.4236251, -0.3765389, -2.519398, 1, 0, 0, 1, 1,
-0.4221685, 0.4206387, -0.4736316, 1, 0, 0, 1, 1,
-0.4116117, -1.325501, -2.918329, 1, 0, 0, 1, 1,
-0.4094565, -1.099529, -2.39093, 1, 0, 0, 1, 1,
-0.4052297, 0.7131606, 0.3079293, 1, 0, 0, 1, 1,
-0.4033964, 1.058487, 1.368616, 0, 0, 0, 1, 1,
-0.3981796, 1.307917, -0.5261803, 0, 0, 0, 1, 1,
-0.397254, -1.299201, -3.183438, 0, 0, 0, 1, 1,
-0.3902977, -0.5076397, -3.019565, 0, 0, 0, 1, 1,
-0.3880547, -1.070291, -3.181626, 0, 0, 0, 1, 1,
-0.377794, 1.894498, -1.301063, 0, 0, 0, 1, 1,
-0.3776817, 0.1245868, 0.1591088, 0, 0, 0, 1, 1,
-0.3750557, 0.4633819, 1.291665, 1, 1, 1, 1, 1,
-0.3693253, -0.757292, -3.15283, 1, 1, 1, 1, 1,
-0.3666221, 1.173143, 0.4361067, 1, 1, 1, 1, 1,
-0.3658805, -2.136298, -2.140722, 1, 1, 1, 1, 1,
-0.3638322, 1.402864, -0.186814, 1, 1, 1, 1, 1,
-0.361577, 0.3785708, -0.6480258, 1, 1, 1, 1, 1,
-0.3589196, -0.1218074, -0.5949739, 1, 1, 1, 1, 1,
-0.3588782, -0.6701905, -2.498986, 1, 1, 1, 1, 1,
-0.3581893, -0.6773449, -3.23573, 1, 1, 1, 1, 1,
-0.3558482, -0.1842655, -0.879717, 1, 1, 1, 1, 1,
-0.3539809, 1.157149, 0.362857, 1, 1, 1, 1, 1,
-0.3538202, 1.334804, 0.685896, 1, 1, 1, 1, 1,
-0.3537935, 1.032071, 0.03085903, 1, 1, 1, 1, 1,
-0.3514372, 0.8414271, -0.2827366, 1, 1, 1, 1, 1,
-0.3504389, -0.02065049, -2.808236, 1, 1, 1, 1, 1,
-0.3490688, -0.8059636, -2.8477, 0, 0, 1, 1, 1,
-0.3465071, -1.824301, -3.7252, 1, 0, 0, 1, 1,
-0.3445013, 0.6699291, -1.147722, 1, 0, 0, 1, 1,
-0.3441843, -0.3679559, -2.811096, 1, 0, 0, 1, 1,
-0.34125, 0.2446499, -0.8738006, 1, 0, 0, 1, 1,
-0.3397242, 0.3274778, -1.674772, 1, 0, 0, 1, 1,
-0.3377084, -2.13223, -2.168421, 0, 0, 0, 1, 1,
-0.335678, 0.03961286, -1.497349, 0, 0, 0, 1, 1,
-0.3330233, -1.23391, -3.19977, 0, 0, 0, 1, 1,
-0.3281607, -0.04134279, -1.532823, 0, 0, 0, 1, 1,
-0.3085033, -0.5444396, -3.637045, 0, 0, 0, 1, 1,
-0.3061264, -0.5638524, -2.014256, 0, 0, 0, 1, 1,
-0.3060698, -0.247126, -2.009954, 0, 0, 0, 1, 1,
-0.3054758, -1.458151, -2.038405, 1, 1, 1, 1, 1,
-0.3050131, -0.3459882, -2.94866, 1, 1, 1, 1, 1,
-0.2998734, 0.8532344, 0.4254651, 1, 1, 1, 1, 1,
-0.295124, 0.2824389, 0.1391074, 1, 1, 1, 1, 1,
-0.2912891, 0.1866502, -0.9706191, 1, 1, 1, 1, 1,
-0.290844, -0.6268969, -4.287236, 1, 1, 1, 1, 1,
-0.2894754, -1.615125, -2.95385, 1, 1, 1, 1, 1,
-0.2854911, 0.2594612, -2.032149, 1, 1, 1, 1, 1,
-0.2732358, 0.4258417, 0.1316789, 1, 1, 1, 1, 1,
-0.2696387, -0.8114951, -4.402257, 1, 1, 1, 1, 1,
-0.2634372, 1.119967, -0.01539323, 1, 1, 1, 1, 1,
-0.2581672, 1.150129, -0.8005733, 1, 1, 1, 1, 1,
-0.2538795, -0.5991987, -1.483969, 1, 1, 1, 1, 1,
-0.2526177, 0.2148061, 0.1571285, 1, 1, 1, 1, 1,
-0.2513933, 1.336235, 1.018747, 1, 1, 1, 1, 1,
-0.2511587, -0.8142257, -1.493238, 0, 0, 1, 1, 1,
-0.2480977, 2.363219, 0.9495282, 1, 0, 0, 1, 1,
-0.2454913, 0.3880162, 0.6062361, 1, 0, 0, 1, 1,
-0.2443897, 0.2405252, -0.2332825, 1, 0, 0, 1, 1,
-0.2425094, -1.131793, -1.69476, 1, 0, 0, 1, 1,
-0.2347865, -0.6274731, -3.785189, 1, 0, 0, 1, 1,
-0.2313662, 1.348208, -1.04146, 0, 0, 0, 1, 1,
-0.2293746, 0.7550886, -1.838227, 0, 0, 0, 1, 1,
-0.2281877, 1.87071, -1.41761, 0, 0, 0, 1, 1,
-0.221981, -0.6638882, -2.335463, 0, 0, 0, 1, 1,
-0.2214435, -0.6500778, -3.362062, 0, 0, 0, 1, 1,
-0.2196648, -0.8089712, -2.241346, 0, 0, 0, 1, 1,
-0.2189001, 0.5979908, -2.281531, 0, 0, 0, 1, 1,
-0.2143417, 0.7303028, 0.4334357, 1, 1, 1, 1, 1,
-0.2061272, 1.015176, 1.017205, 1, 1, 1, 1, 1,
-0.2037466, -1.196217, -3.936524, 1, 1, 1, 1, 1,
-0.2024972, -1.092578, -3.887108, 1, 1, 1, 1, 1,
-0.1998893, -1.435399, -3.78831, 1, 1, 1, 1, 1,
-0.1956594, 0.7752568, -1.515516, 1, 1, 1, 1, 1,
-0.1950261, -0.301296, -2.263055, 1, 1, 1, 1, 1,
-0.1947921, -1.622215, -0.5943169, 1, 1, 1, 1, 1,
-0.1941709, 0.5716677, 0.3196753, 1, 1, 1, 1, 1,
-0.1899578, 0.6876232, -0.1840225, 1, 1, 1, 1, 1,
-0.1894557, -0.04139164, -1.155837, 1, 1, 1, 1, 1,
-0.1874383, 0.08498634, -4.272639, 1, 1, 1, 1, 1,
-0.1849952, -0.4482866, -2.90535, 1, 1, 1, 1, 1,
-0.1848188, -0.331816, -3.530562, 1, 1, 1, 1, 1,
-0.1847623, 0.6726689, -1.014229, 1, 1, 1, 1, 1,
-0.1838112, 0.4115026, -1.921337, 0, 0, 1, 1, 1,
-0.1829721, -0.5796455, -4.037676, 1, 0, 0, 1, 1,
-0.1753475, -1.260723, -2.347064, 1, 0, 0, 1, 1,
-0.1711609, -0.821655, -2.515236, 1, 0, 0, 1, 1,
-0.1703915, 0.7908254, -0.3988591, 1, 0, 0, 1, 1,
-0.1689643, 0.9131274, -0.9793066, 1, 0, 0, 1, 1,
-0.163803, -0.01015862, -1.811565, 0, 0, 0, 1, 1,
-0.1629324, 0.7364877, -2.256565, 0, 0, 0, 1, 1,
-0.160639, -1.179245, -2.373878, 0, 0, 0, 1, 1,
-0.1605076, 0.3673895, -1.899327, 0, 0, 0, 1, 1,
-0.1568679, -0.362686, -1.488884, 0, 0, 0, 1, 1,
-0.1535512, -0.8339805, -2.515016, 0, 0, 0, 1, 1,
-0.1518694, -0.6496837, -4.215698, 0, 0, 0, 1, 1,
-0.1514847, 1.718658, -0.6969049, 1, 1, 1, 1, 1,
-0.1474047, 0.5675426, 0.5389771, 1, 1, 1, 1, 1,
-0.1470596, 0.7416554, -0.07964029, 1, 1, 1, 1, 1,
-0.1452579, -1.402918, -2.973038, 1, 1, 1, 1, 1,
-0.1410102, -1.717023, -2.223291, 1, 1, 1, 1, 1,
-0.1406778, 0.8445348, -0.6724097, 1, 1, 1, 1, 1,
-0.1404064, -2.951809, -4.553043, 1, 1, 1, 1, 1,
-0.1381496, 1.450742, 0.5688543, 1, 1, 1, 1, 1,
-0.1329959, 0.7409262, 0.8710933, 1, 1, 1, 1, 1,
-0.1310663, 0.297423, -0.6182808, 1, 1, 1, 1, 1,
-0.1262744, -0.5785356, -4.176453, 1, 1, 1, 1, 1,
-0.1229704, 0.7707927, 0.8636465, 1, 1, 1, 1, 1,
-0.1143754, -1.505681, -3.219365, 1, 1, 1, 1, 1,
-0.113673, 0.3123159, 0.7872853, 1, 1, 1, 1, 1,
-0.1082231, -0.6322556, -1.967427, 1, 1, 1, 1, 1,
-0.100023, -0.1724193, -0.2027879, 0, 0, 1, 1, 1,
-0.0971924, -1.528061, -2.614416, 1, 0, 0, 1, 1,
-0.09453894, 0.2761918, -0.8922634, 1, 0, 0, 1, 1,
-0.09240201, 0.3420486, 0.9799434, 1, 0, 0, 1, 1,
-0.08889844, 0.7546486, -0.5623161, 1, 0, 0, 1, 1,
-0.08843572, 1.519736, -0.07080506, 1, 0, 0, 1, 1,
-0.08692154, 0.2829015, -0.5290943, 0, 0, 0, 1, 1,
-0.08559657, 0.8998651, -0.1425554, 0, 0, 0, 1, 1,
-0.08495136, 0.1313304, -0.3339804, 0, 0, 0, 1, 1,
-0.07571407, -0.2392034, -3.094858, 0, 0, 0, 1, 1,
-0.072262, -0.3498341, -3.898237, 0, 0, 0, 1, 1,
-0.06136447, 0.2177518, 1.415807, 0, 0, 0, 1, 1,
-0.05996342, -1.143525, -3.611511, 0, 0, 0, 1, 1,
-0.05974971, 0.4654649, 1.681643, 1, 1, 1, 1, 1,
-0.05729687, -1.041431, -2.337973, 1, 1, 1, 1, 1,
-0.0542402, -0.07625215, -2.760967, 1, 1, 1, 1, 1,
-0.05375385, -0.6761432, -2.877157, 1, 1, 1, 1, 1,
-0.05368512, 0.1419695, -1.67198, 1, 1, 1, 1, 1,
-0.05338758, 0.7276136, 0.872423, 1, 1, 1, 1, 1,
-0.05119773, 0.7792955, -0.6246187, 1, 1, 1, 1, 1,
-0.0493666, 0.5433663, -1.315337, 1, 1, 1, 1, 1,
-0.04935221, -1.535642, -2.431609, 1, 1, 1, 1, 1,
-0.04778283, -0.4588832, 0.3123332, 1, 1, 1, 1, 1,
-0.04670843, 0.06165352, 0.2219996, 1, 1, 1, 1, 1,
-0.04235803, -0.3533935, -3.01359, 1, 1, 1, 1, 1,
-0.04219483, -1.375807, -2.435236, 1, 1, 1, 1, 1,
-0.03692183, -1.092219, -4.168793, 1, 1, 1, 1, 1,
-0.03557039, 0.23994, -0.5034394, 1, 1, 1, 1, 1,
-0.0352416, -0.2505598, -2.371337, 0, 0, 1, 1, 1,
-0.03284324, 0.7699283, -1.303389, 1, 0, 0, 1, 1,
-0.03182162, -1.761541, -2.889365, 1, 0, 0, 1, 1,
-0.03062436, 0.3243231, 0.9155454, 1, 0, 0, 1, 1,
-0.02922188, 1.198071, 0.4837707, 1, 0, 0, 1, 1,
-0.02576518, -0.4082537, -1.987755, 1, 0, 0, 1, 1,
-0.02565321, -0.9196807, -3.128294, 0, 0, 0, 1, 1,
-0.02505019, 1.562909, 1.991738, 0, 0, 0, 1, 1,
-0.02200578, 0.003549697, -0.2951075, 0, 0, 0, 1, 1,
-0.0185478, 0.4267042, -0.8477168, 0, 0, 0, 1, 1,
-0.0174933, 0.3930035, -0.7310478, 0, 0, 0, 1, 1,
-0.01651861, 0.3274267, 0.09467554, 0, 0, 0, 1, 1,
-0.01233895, -0.8656366, -2.103452, 0, 0, 0, 1, 1,
-0.01172302, -1.287542, -3.858329, 1, 1, 1, 1, 1,
-0.01170668, 1.366585, -0.1097677, 1, 1, 1, 1, 1,
-0.01144233, -0.1986629, -3.018318, 1, 1, 1, 1, 1,
-0.004146887, 0.7706045, -0.179653, 1, 1, 1, 1, 1,
-0.002760185, -1.256335, -3.747679, 1, 1, 1, 1, 1,
-0.002439725, -0.2913755, -2.148407, 1, 1, 1, 1, 1,
-0.002327184, -1.078592, -4.442409, 1, 1, 1, 1, 1,
-0.0009731274, 1.25849, -1.018229, 1, 1, 1, 1, 1,
-0.0008077198, 0.6362874, -0.4294052, 1, 1, 1, 1, 1,
0.000239829, -0.7775864, 3.706912, 1, 1, 1, 1, 1,
0.002597983, 0.6536635, -0.533587, 1, 1, 1, 1, 1,
0.008015048, -1.465467, 4.203937, 1, 1, 1, 1, 1,
0.008335423, 0.1217496, 0.3108903, 1, 1, 1, 1, 1,
0.00868709, -0.6180938, 3.134754, 1, 1, 1, 1, 1,
0.009916538, -0.8173139, 2.996581, 1, 1, 1, 1, 1,
0.01052889, -1.509603, 3.075107, 0, 0, 1, 1, 1,
0.01113729, -0.2986937, 3.291091, 1, 0, 0, 1, 1,
0.01143793, 0.2133698, -1.127766, 1, 0, 0, 1, 1,
0.0124001, 0.526692, -0.04807365, 1, 0, 0, 1, 1,
0.01289992, -0.8330883, 3.478454, 1, 0, 0, 1, 1,
0.02071839, -1.199229, 2.867736, 1, 0, 0, 1, 1,
0.02356637, -0.3135792, 2.493607, 0, 0, 0, 1, 1,
0.02412187, 0.8596231, 0.7765983, 0, 0, 0, 1, 1,
0.0258523, 0.1168491, 0.8017519, 0, 0, 0, 1, 1,
0.02623841, -2.491524, 4.658455, 0, 0, 0, 1, 1,
0.02830415, -0.9952009, 2.834506, 0, 0, 0, 1, 1,
0.03033699, 0.2744097, 0.7960325, 0, 0, 0, 1, 1,
0.03239076, 0.5502158, -0.9526313, 0, 0, 0, 1, 1,
0.03281589, -0.824414, 3.882697, 1, 1, 1, 1, 1,
0.03547588, 1.240635, 0.3090526, 1, 1, 1, 1, 1,
0.03999543, 0.4380615, 0.6172461, 1, 1, 1, 1, 1,
0.04001776, 1.795542, -0.2804653, 1, 1, 1, 1, 1,
0.04208904, 0.2094026, -0.0289034, 1, 1, 1, 1, 1,
0.04595955, 1.981853, 0.07077154, 1, 1, 1, 1, 1,
0.04768464, 0.2791255, 0.9730921, 1, 1, 1, 1, 1,
0.05120885, -0.03062315, 3.683059, 1, 1, 1, 1, 1,
0.05247574, 1.320755, 0.1631913, 1, 1, 1, 1, 1,
0.0563087, -0.3748229, 2.273573, 1, 1, 1, 1, 1,
0.0563252, 0.5475174, 0.2958881, 1, 1, 1, 1, 1,
0.05827489, 1.109464, -0.2133335, 1, 1, 1, 1, 1,
0.05928808, 0.07122168, 0.8666701, 1, 1, 1, 1, 1,
0.06160783, 0.6335385, -1.452628, 1, 1, 1, 1, 1,
0.06715197, -0.5779122, 1.63136, 1, 1, 1, 1, 1,
0.06824984, 0.113943, -0.9416357, 0, 0, 1, 1, 1,
0.07113632, 0.4887672, 2.021515, 1, 0, 0, 1, 1,
0.07383815, -0.6717156, 2.464712, 1, 0, 0, 1, 1,
0.07416595, -0.7576582, 2.706992, 1, 0, 0, 1, 1,
0.07702482, 0.06499271, -0.9290119, 1, 0, 0, 1, 1,
0.08748213, -1.260527, 4.591409, 1, 0, 0, 1, 1,
0.08750921, 1.246661, 0.9383491, 0, 0, 0, 1, 1,
0.09106305, -0.05332727, 1.617821, 0, 0, 0, 1, 1,
0.09519987, 0.1658217, -0.4703141, 0, 0, 0, 1, 1,
0.09599157, 0.1108548, 0.4436995, 0, 0, 0, 1, 1,
0.09764918, -0.8330469, 2.742279, 0, 0, 0, 1, 1,
0.1002105, 0.9695439, -0.4005843, 0, 0, 0, 1, 1,
0.1006483, 1.00633, -0.6182089, 0, 0, 0, 1, 1,
0.1010768, 1.425412, -0.7862809, 1, 1, 1, 1, 1,
0.1085905, 0.789018, 0.963923, 1, 1, 1, 1, 1,
0.1097458, -1.813742, 3.523733, 1, 1, 1, 1, 1,
0.1111664, -0.2905715, 3.46318, 1, 1, 1, 1, 1,
0.1123714, 1.610859, 1.220456, 1, 1, 1, 1, 1,
0.1126914, -2.302726, 2.072026, 1, 1, 1, 1, 1,
0.1133243, 0.2444546, 0.9826354, 1, 1, 1, 1, 1,
0.114042, -0.6924656, 1.897286, 1, 1, 1, 1, 1,
0.11991, 0.1595677, 1.460589, 1, 1, 1, 1, 1,
0.1241927, -1.079998, 3.007452, 1, 1, 1, 1, 1,
0.1290936, -0.3098108, 3.338094, 1, 1, 1, 1, 1,
0.1297432, 0.2140987, -0.7301837, 1, 1, 1, 1, 1,
0.1312524, 1.446995, -1.330837, 1, 1, 1, 1, 1,
0.1314449, -1.440454, 2.921938, 1, 1, 1, 1, 1,
0.1328793, 1.207191, -0.3280665, 1, 1, 1, 1, 1,
0.1348298, 0.6025709, 0.03760407, 0, 0, 1, 1, 1,
0.1399172, 1.143383, -1.191387, 1, 0, 0, 1, 1,
0.142725, 0.3669821, -0.8344308, 1, 0, 0, 1, 1,
0.1438422, -0.297033, 2.136702, 1, 0, 0, 1, 1,
0.1477507, 0.7569045, 0.920198, 1, 0, 0, 1, 1,
0.1490619, -0.1770746, -0.6553921, 1, 0, 0, 1, 1,
0.1508662, 0.2772896, 1.409642, 0, 0, 0, 1, 1,
0.1517014, -0.05884383, 2.526111, 0, 0, 0, 1, 1,
0.1535611, -0.3777657, 2.434103, 0, 0, 0, 1, 1,
0.1571498, -1.333445, 4.28988, 0, 0, 0, 1, 1,
0.1576412, -1.983356, 4.972982, 0, 0, 0, 1, 1,
0.1587281, -0.4960424, 3.09961, 0, 0, 0, 1, 1,
0.1587511, -0.6575851, 2.328779, 0, 0, 0, 1, 1,
0.1613705, 2.197147, 0.2990488, 1, 1, 1, 1, 1,
0.1695817, -0.7462794, 2.137991, 1, 1, 1, 1, 1,
0.1701597, 1.210075, 1.918511, 1, 1, 1, 1, 1,
0.1707219, 0.6643261, 0.4257303, 1, 1, 1, 1, 1,
0.1728936, 2.229397, 1.220126, 1, 1, 1, 1, 1,
0.1734453, -0.8590516, 2.504742, 1, 1, 1, 1, 1,
0.1747415, -0.8191041, 1.455031, 1, 1, 1, 1, 1,
0.1819478, 0.04449807, 1.94886, 1, 1, 1, 1, 1,
0.18325, -0.8966134, 4.750851, 1, 1, 1, 1, 1,
0.1834453, 0.02066885, 0.949611, 1, 1, 1, 1, 1,
0.1840526, -1.096888, 4.506756, 1, 1, 1, 1, 1,
0.1852898, -0.3348436, 0.3315028, 1, 1, 1, 1, 1,
0.1880508, 0.5198441, 0.1622162, 1, 1, 1, 1, 1,
0.1884451, 0.4231665, 0.8799505, 1, 1, 1, 1, 1,
0.1894609, 1.118575, 0.6260638, 1, 1, 1, 1, 1,
0.1918877, -0.1945093, 1.091953, 0, 0, 1, 1, 1,
0.1928496, -0.3447554, 1.978197, 1, 0, 0, 1, 1,
0.1943026, -1.293514, 3.249551, 1, 0, 0, 1, 1,
0.1981647, -0.6732906, 2.289855, 1, 0, 0, 1, 1,
0.2033676, 0.5047845, 2.363311, 1, 0, 0, 1, 1,
0.2051019, -1.05267, 2.591422, 1, 0, 0, 1, 1,
0.2059172, -1.042207, 3.21898, 0, 0, 0, 1, 1,
0.206147, 1.821705, 0.175601, 0, 0, 0, 1, 1,
0.2132878, -0.3755371, 1.397029, 0, 0, 0, 1, 1,
0.2162197, 0.6364385, 1.736488, 0, 0, 0, 1, 1,
0.2174198, -0.6111475, 4.394656, 0, 0, 0, 1, 1,
0.2269336, -1.375381, 0.9364412, 0, 0, 0, 1, 1,
0.2273131, 1.121617, 0.7245858, 0, 0, 0, 1, 1,
0.2285701, -0.2967044, 2.449673, 1, 1, 1, 1, 1,
0.2285948, 0.4154013, 0.1987003, 1, 1, 1, 1, 1,
0.2305592, -0.2816328, 1.959267, 1, 1, 1, 1, 1,
0.240154, 1.315874, 1.223237, 1, 1, 1, 1, 1,
0.2456022, 0.1112434, 2.106933, 1, 1, 1, 1, 1,
0.246921, -1.008856, 4.272873, 1, 1, 1, 1, 1,
0.2502422, -0.7907342, 4.114098, 1, 1, 1, 1, 1,
0.2522601, -0.2311367, 2.382222, 1, 1, 1, 1, 1,
0.2544381, 1.219355, -1.825521, 1, 1, 1, 1, 1,
0.255466, -0.1380675, 2.180006, 1, 1, 1, 1, 1,
0.2556402, 1.05699, 0.06784948, 1, 1, 1, 1, 1,
0.2634238, -0.9974995, 3.914587, 1, 1, 1, 1, 1,
0.2649729, -1.484814, 3.641633, 1, 1, 1, 1, 1,
0.2670687, -0.3814667, 1.979719, 1, 1, 1, 1, 1,
0.269905, -0.751842, 2.466532, 1, 1, 1, 1, 1,
0.2758168, 2.717695, 0.9628534, 0, 0, 1, 1, 1,
0.2767577, 0.3766226, -0.4698351, 1, 0, 0, 1, 1,
0.2810733, -0.719805, 2.779779, 1, 0, 0, 1, 1,
0.284725, 1.034696, -0.4323685, 1, 0, 0, 1, 1,
0.2863635, -0.7079943, 2.797944, 1, 0, 0, 1, 1,
0.2864385, 2.200833, 0.366063, 1, 0, 0, 1, 1,
0.2937009, -0.1219436, -0.6044615, 0, 0, 0, 1, 1,
0.2937241, -1.205979, 2.769426, 0, 0, 0, 1, 1,
0.2948771, 0.1753399, -0.8757659, 0, 0, 0, 1, 1,
0.2965114, -0.3608115, 2.294746, 0, 0, 0, 1, 1,
0.3081403, 0.4482399, 0.2653793, 0, 0, 0, 1, 1,
0.308583, 0.4081185, -1.240751, 0, 0, 0, 1, 1,
0.3086696, 0.2158683, 3.4022, 0, 0, 0, 1, 1,
0.3111571, -0.01173693, 0.1371257, 1, 1, 1, 1, 1,
0.3117678, 0.4271705, -0.3758241, 1, 1, 1, 1, 1,
0.3121714, -1.37687, 3.497781, 1, 1, 1, 1, 1,
0.3132346, -0.4006169, 1.97227, 1, 1, 1, 1, 1,
0.3141773, 0.6301993, 1.217593, 1, 1, 1, 1, 1,
0.3145722, -0.3296821, 2.819772, 1, 1, 1, 1, 1,
0.3161672, -0.8843228, 3.581132, 1, 1, 1, 1, 1,
0.3172245, 1.337022, -0.2171247, 1, 1, 1, 1, 1,
0.3188963, 0.1526842, 0.4817838, 1, 1, 1, 1, 1,
0.3198581, 1.63397, -0.5931339, 1, 1, 1, 1, 1,
0.3318907, -0.4515707, 2.997823, 1, 1, 1, 1, 1,
0.3346621, -0.1963147, 1.996576, 1, 1, 1, 1, 1,
0.3351101, 1.016557, 0.9376701, 1, 1, 1, 1, 1,
0.3374948, -0.242387, 1.820882, 1, 1, 1, 1, 1,
0.3467163, -1.255185, 2.936335, 1, 1, 1, 1, 1,
0.3495025, 1.032366, 0.6902683, 0, 0, 1, 1, 1,
0.3557751, 1.702263, -0.7725198, 1, 0, 0, 1, 1,
0.355867, 0.3920754, 1.160629, 1, 0, 0, 1, 1,
0.3566961, -0.326034, 2.981226, 1, 0, 0, 1, 1,
0.3569301, -1.025777, 3.477335, 1, 0, 0, 1, 1,
0.3570836, -0.9966398, 3.290329, 1, 0, 0, 1, 1,
0.3578638, -1.451021, 3.528706, 0, 0, 0, 1, 1,
0.3579412, -0.7191758, 1.31817, 0, 0, 0, 1, 1,
0.3597738, 0.6908994, 0.7595798, 0, 0, 0, 1, 1,
0.3622517, 1.540225, 0.3556621, 0, 0, 0, 1, 1,
0.3651367, 0.6122416, 0.1461872, 0, 0, 0, 1, 1,
0.3681642, 0.3536364, -0.7598558, 0, 0, 0, 1, 1,
0.3701363, -1.637212, 1.571555, 0, 0, 0, 1, 1,
0.370254, 0.1160058, 0.8251679, 1, 1, 1, 1, 1,
0.3755839, -0.5555372, 0.8778162, 1, 1, 1, 1, 1,
0.3815568, -0.8367121, -0.5804622, 1, 1, 1, 1, 1,
0.3833084, 0.1755602, -0.6143872, 1, 1, 1, 1, 1,
0.3838185, -1.100598, 3.8613, 1, 1, 1, 1, 1,
0.3902332, -0.4526027, 2.523372, 1, 1, 1, 1, 1,
0.3958429, -0.1777229, 0.9881173, 1, 1, 1, 1, 1,
0.4018259, 2.238718, -1.514549, 1, 1, 1, 1, 1,
0.4104369, 0.7292794, -0.8660606, 1, 1, 1, 1, 1,
0.4115763, 0.562933, 1.421394, 1, 1, 1, 1, 1,
0.4115845, 0.3741547, 1.467708, 1, 1, 1, 1, 1,
0.4214502, 0.815197, -1.455912, 1, 1, 1, 1, 1,
0.4239312, -2.268224, 2.891935, 1, 1, 1, 1, 1,
0.426501, -0.3920193, 1.523304, 1, 1, 1, 1, 1,
0.4265929, -1.756249, 3.910944, 1, 1, 1, 1, 1,
0.4292368, 0.5462123, 2.365105, 0, 0, 1, 1, 1,
0.4364946, -1.860141, 2.463134, 1, 0, 0, 1, 1,
0.4365181, 0.5012521, 0.4761873, 1, 0, 0, 1, 1,
0.4366626, -0.8998843, 2.954787, 1, 0, 0, 1, 1,
0.4403858, -0.6894373, 1.777674, 1, 0, 0, 1, 1,
0.4414936, -0.3600093, 1.909675, 1, 0, 0, 1, 1,
0.4428948, 1.528185, 1.986761, 0, 0, 0, 1, 1,
0.4469066, -0.5981346, 4.200721, 0, 0, 0, 1, 1,
0.4473325, -0.3934686, 1.842006, 0, 0, 0, 1, 1,
0.4477396, 0.4815089, 1.053645, 0, 0, 0, 1, 1,
0.4520594, 1.724187, 1.731629, 0, 0, 0, 1, 1,
0.4527218, -1.085684, 2.089188, 0, 0, 0, 1, 1,
0.4603666, 1.951954, -0.3915302, 0, 0, 0, 1, 1,
0.4626191, 1.222288, 0.9758328, 1, 1, 1, 1, 1,
0.4658372, -0.797422, 4.356467, 1, 1, 1, 1, 1,
0.4707717, 3.019229, 0.1630112, 1, 1, 1, 1, 1,
0.4759818, 0.5040693, 1.060981, 1, 1, 1, 1, 1,
0.4763418, -0.2233747, 2.262099, 1, 1, 1, 1, 1,
0.4806266, -1.107366, 3.761697, 1, 1, 1, 1, 1,
0.48063, -1.237775, 1.612871, 1, 1, 1, 1, 1,
0.4810505, -1.014637, 4.570465, 1, 1, 1, 1, 1,
0.4843446, -0.231873, 2.357504, 1, 1, 1, 1, 1,
0.4845681, 0.6674669, -1.456231, 1, 1, 1, 1, 1,
0.4867046, -0.9868748, 2.401986, 1, 1, 1, 1, 1,
0.4879165, -2.188472, 2.021801, 1, 1, 1, 1, 1,
0.4919517, 0.4925977, 1.589493, 1, 1, 1, 1, 1,
0.4933355, -0.9960189, 2.377547, 1, 1, 1, 1, 1,
0.4936974, -0.6515741, 3.300041, 1, 1, 1, 1, 1,
0.4980631, 0.9595062, 0.7683838, 0, 0, 1, 1, 1,
0.501758, 0.2502262, 0.7384886, 1, 0, 0, 1, 1,
0.5030932, -0.1366626, 1.918785, 1, 0, 0, 1, 1,
0.5043957, 0.7497723, 0.6050855, 1, 0, 0, 1, 1,
0.5054975, -2.405966, 2.778207, 1, 0, 0, 1, 1,
0.5195891, -0.8739339, 2.547866, 1, 0, 0, 1, 1,
0.5203828, -0.3117831, 2.090253, 0, 0, 0, 1, 1,
0.5226029, -0.3521616, 1.425886, 0, 0, 0, 1, 1,
0.5247687, -0.3962159, 2.113201, 0, 0, 0, 1, 1,
0.5266546, 1.02757, 1.333803, 0, 0, 0, 1, 1,
0.5288253, 1.129475, 2.603429, 0, 0, 0, 1, 1,
0.5304921, 1.667195, -0.1088672, 0, 0, 0, 1, 1,
0.530682, -1.683876, 2.80664, 0, 0, 0, 1, 1,
0.5326969, 1.108098, 1.474931, 1, 1, 1, 1, 1,
0.5340415, 0.9021048, 1.805062, 1, 1, 1, 1, 1,
0.5355561, 1.354075, 1.749782, 1, 1, 1, 1, 1,
0.5380658, -0.7785855, 2.031435, 1, 1, 1, 1, 1,
0.5407972, 0.6016693, -0.4148047, 1, 1, 1, 1, 1,
0.5461555, -1.154597, 2.430726, 1, 1, 1, 1, 1,
0.5463561, 0.9425472, -1.822916, 1, 1, 1, 1, 1,
0.5480528, 0.1244239, 1.51564, 1, 1, 1, 1, 1,
0.5516888, 1.136154, -0.6537093, 1, 1, 1, 1, 1,
0.5604221, 0.04636291, 1.712817, 1, 1, 1, 1, 1,
0.562303, -1.037177, 3.340355, 1, 1, 1, 1, 1,
0.5672577, 0.301936, -0.2999113, 1, 1, 1, 1, 1,
0.568498, 0.008948571, 2.966815, 1, 1, 1, 1, 1,
0.5697752, 1.99291, 1.174251, 1, 1, 1, 1, 1,
0.5707338, -1.452967, 2.848167, 1, 1, 1, 1, 1,
0.5716629, -0.02698422, 2.04481, 0, 0, 1, 1, 1,
0.5729265, 1.097415, 0.3338015, 1, 0, 0, 1, 1,
0.5841511, 0.4054948, 1.378784, 1, 0, 0, 1, 1,
0.5873342, -1.664133, 1.783188, 1, 0, 0, 1, 1,
0.588495, -1.978527, 1.795596, 1, 0, 0, 1, 1,
0.591334, 0.1965519, 0.6846442, 1, 0, 0, 1, 1,
0.5925511, 0.1857291, 1.886612, 0, 0, 0, 1, 1,
0.5962072, -1.100863, 1.836405, 0, 0, 0, 1, 1,
0.5964093, -0.5294352, 1.958959, 0, 0, 0, 1, 1,
0.5992647, -0.6067649, 1.250876, 0, 0, 0, 1, 1,
0.6018336, -0.4319152, 3.033638, 0, 0, 0, 1, 1,
0.603254, 0.5492098, 0.1890152, 0, 0, 0, 1, 1,
0.6046894, 1.689849, -0.8064272, 0, 0, 0, 1, 1,
0.6050012, 0.8797214, 0.7096177, 1, 1, 1, 1, 1,
0.6061454, 1.256799, 0.5628605, 1, 1, 1, 1, 1,
0.6122797, -1.297463, 2.911698, 1, 1, 1, 1, 1,
0.6141769, -0.1578704, 2.790005, 1, 1, 1, 1, 1,
0.6201206, 2.280947, 0.08824708, 1, 1, 1, 1, 1,
0.6251245, -0.4240374, 3.137585, 1, 1, 1, 1, 1,
0.6305204, -0.2487819, 2.87261, 1, 1, 1, 1, 1,
0.6325772, 0.6368757, -0.212163, 1, 1, 1, 1, 1,
0.6358682, -1.791506, 2.711999, 1, 1, 1, 1, 1,
0.639489, -0.4631094, 1.837692, 1, 1, 1, 1, 1,
0.6433764, 0.6055451, 0.08460663, 1, 1, 1, 1, 1,
0.6437302, 1.522882, -0.8922312, 1, 1, 1, 1, 1,
0.6523485, -0.08208805, -0.05794244, 1, 1, 1, 1, 1,
0.6550324, -0.3588507, 0.1445553, 1, 1, 1, 1, 1,
0.6551728, 0.5739661, 1.384578, 1, 1, 1, 1, 1,
0.6566275, 0.5782095, 0.5726482, 0, 0, 1, 1, 1,
0.6570346, 0.7106441, 0.8349308, 1, 0, 0, 1, 1,
0.6572457, 0.4308119, 2.021261, 1, 0, 0, 1, 1,
0.6583443, 0.8424735, 0.7014065, 1, 0, 0, 1, 1,
0.6623984, -0.4779431, 1.075711, 1, 0, 0, 1, 1,
0.6633523, -0.9472103, 2.962188, 1, 0, 0, 1, 1,
0.6646411, -0.9053918, 2.805085, 0, 0, 0, 1, 1,
0.6657121, -0.2945026, 2.081281, 0, 0, 0, 1, 1,
0.6707727, -0.4671227, 3.419286, 0, 0, 0, 1, 1,
0.6763051, 0.01516116, 2.141012, 0, 0, 0, 1, 1,
0.6780301, 0.4535966, 0.6584888, 0, 0, 0, 1, 1,
0.6806036, 2.11044, 0.6983572, 0, 0, 0, 1, 1,
0.6833364, -2.474312, 2.24832, 0, 0, 0, 1, 1,
0.6869691, -1.253432, 1.356537, 1, 1, 1, 1, 1,
0.6899748, 0.1143957, -0.2673781, 1, 1, 1, 1, 1,
0.6915286, -0.109835, 0.4724038, 1, 1, 1, 1, 1,
0.6936964, 0.3183795, 2.167329, 1, 1, 1, 1, 1,
0.6954672, -0.7242861, 3.023231, 1, 1, 1, 1, 1,
0.6987446, -0.8039145, 2.575851, 1, 1, 1, 1, 1,
0.7030245, -0.6946848, 1.039077, 1, 1, 1, 1, 1,
0.7031891, -0.151611, 1.157585, 1, 1, 1, 1, 1,
0.706054, -1.240339, 1.470311, 1, 1, 1, 1, 1,
0.7123308, -0.2982298, 2.993344, 1, 1, 1, 1, 1,
0.724906, 0.366095, 0.7399411, 1, 1, 1, 1, 1,
0.7320219, -1.00908, 2.797761, 1, 1, 1, 1, 1,
0.7332914, 1.017215, -0.0713264, 1, 1, 1, 1, 1,
0.7340844, 0.2121238, 0.13916, 1, 1, 1, 1, 1,
0.7346176, -2.339058, 3.361433, 1, 1, 1, 1, 1,
0.7351274, 1.478545, -0.9450725, 0, 0, 1, 1, 1,
0.738938, 0.02335858, 1.494123, 1, 0, 0, 1, 1,
0.7459412, -0.08287834, 3.534308, 1, 0, 0, 1, 1,
0.7545, -0.08001019, 0.8960163, 1, 0, 0, 1, 1,
0.7598751, -0.7354501, 0.9440567, 1, 0, 0, 1, 1,
0.7679108, -0.9165931, 3.325315, 1, 0, 0, 1, 1,
0.7752157, 1.905371, -0.2355043, 0, 0, 0, 1, 1,
0.7767049, -0.0651867, 0.8186647, 0, 0, 0, 1, 1,
0.7816863, 1.52268, 0.0641157, 0, 0, 0, 1, 1,
0.787547, 1.393197, 0.04558563, 0, 0, 0, 1, 1,
0.7882373, 1.478971, 1.676224, 0, 0, 0, 1, 1,
0.7893181, -1.631837, 3.674315, 0, 0, 0, 1, 1,
0.7896085, -1.836877, 1.728291, 0, 0, 0, 1, 1,
0.7925268, -0.3138511, 2.136144, 1, 1, 1, 1, 1,
0.7979436, 1.186387, 1.11795, 1, 1, 1, 1, 1,
0.801342, -0.6972743, 1.917105, 1, 1, 1, 1, 1,
0.80144, 0.5233402, 1.772627, 1, 1, 1, 1, 1,
0.8057333, -0.5951861, 1.297094, 1, 1, 1, 1, 1,
0.8164761, 0.4704446, 2.303285, 1, 1, 1, 1, 1,
0.8210891, -1.399017, 1.990276, 1, 1, 1, 1, 1,
0.8270393, -0.3123894, 1.0702, 1, 1, 1, 1, 1,
0.8309042, 0.01669003, 3.913016, 1, 1, 1, 1, 1,
0.831469, 0.1838669, 1.172351, 1, 1, 1, 1, 1,
0.8395415, 0.8385688, 0.4086965, 1, 1, 1, 1, 1,
0.8418016, -0.6763304, 3.553016, 1, 1, 1, 1, 1,
0.8422555, -1.309189, 1.49107, 1, 1, 1, 1, 1,
0.8454517, -0.9673549, 1.285424, 1, 1, 1, 1, 1,
0.8466048, 0.8512176, 1.986322, 1, 1, 1, 1, 1,
0.8479776, 0.9240273, 0.4012448, 0, 0, 1, 1, 1,
0.8481077, -1.167418, 3.262257, 1, 0, 0, 1, 1,
0.8557108, -0.4429366, 2.434569, 1, 0, 0, 1, 1,
0.8668077, -0.06139247, 2.456866, 1, 0, 0, 1, 1,
0.8721442, 1.403502, 0.5096993, 1, 0, 0, 1, 1,
0.8726175, 0.04140002, -1.14563, 1, 0, 0, 1, 1,
0.8750907, 0.311092, 1.033588, 0, 0, 0, 1, 1,
0.8760767, 1.01712, -0.09986106, 0, 0, 0, 1, 1,
0.8834673, 1.073138, 1.408005, 0, 0, 0, 1, 1,
0.8869877, 0.08840579, -0.415044, 0, 0, 0, 1, 1,
0.8896087, -1.803416, 4.28431, 0, 0, 0, 1, 1,
0.8901225, -1.30233, 3.115225, 0, 0, 0, 1, 1,
0.9006111, -0.4226814, 1.986774, 0, 0, 0, 1, 1,
0.9074211, -0.03721096, 1.420211, 1, 1, 1, 1, 1,
0.9082729, -0.2414685, -0.1269671, 1, 1, 1, 1, 1,
0.9166219, -0.5085936, 1.059035, 1, 1, 1, 1, 1,
0.9187511, 0.8179327, 0.01389787, 1, 1, 1, 1, 1,
0.9195603, 0.6429859, 0.4169402, 1, 1, 1, 1, 1,
0.9207823, -0.6706809, 1.389145, 1, 1, 1, 1, 1,
0.9221143, -0.5397139, 1.33208, 1, 1, 1, 1, 1,
0.9227633, -1.251114, 1.910201, 1, 1, 1, 1, 1,
0.9339826, -0.6646672, 3.26456, 1, 1, 1, 1, 1,
0.9387107, -0.4924588, 3.504134, 1, 1, 1, 1, 1,
0.9389336, -1.281598, 3.010998, 1, 1, 1, 1, 1,
0.9433812, 1.197047, 2.230774, 1, 1, 1, 1, 1,
0.9445835, 0.8737276, 0.3049135, 1, 1, 1, 1, 1,
0.9453184, 1.052872, 0.190725, 1, 1, 1, 1, 1,
0.9462869, 1.053861, 0.3441798, 1, 1, 1, 1, 1,
0.947915, 0.2291109, 0.3235497, 0, 0, 1, 1, 1,
0.9525016, 0.3799894, -0.04096225, 1, 0, 0, 1, 1,
0.9591091, 0.786623, 0.8462523, 1, 0, 0, 1, 1,
0.9602843, -0.9158053, 3.826268, 1, 0, 0, 1, 1,
0.9605265, -0.2050746, 1.788642, 1, 0, 0, 1, 1,
0.9652548, -0.06054538, 0.7054669, 1, 0, 0, 1, 1,
0.9855037, -1.538151, 3.283666, 0, 0, 0, 1, 1,
0.9859321, 0.5486682, 2.064338, 0, 0, 0, 1, 1,
0.9951034, 0.8653516, -0.04509513, 0, 0, 0, 1, 1,
1.002118, -1.04298, 2.581407, 0, 0, 0, 1, 1,
1.004751, 1.824676, 0.1341588, 0, 0, 0, 1, 1,
1.006181, 2.995098, -0.1392818, 0, 0, 0, 1, 1,
1.006302, -0.2659059, 2.658926, 0, 0, 0, 1, 1,
1.011821, 1.079786, 0.7897966, 1, 1, 1, 1, 1,
1.01206, -0.0513629, 2.153088, 1, 1, 1, 1, 1,
1.022826, -0.339503, 1.28558, 1, 1, 1, 1, 1,
1.025216, -0.9147395, 1.235142, 1, 1, 1, 1, 1,
1.025579, -1.335048, 2.084426, 1, 1, 1, 1, 1,
1.028056, 0.5476242, 0.8633002, 1, 1, 1, 1, 1,
1.030306, -1.20988, 2.669926, 1, 1, 1, 1, 1,
1.03117, -0.4809351, 1.576439, 1, 1, 1, 1, 1,
1.033552, 0.9088312, 1.086501, 1, 1, 1, 1, 1,
1.039393, -0.04421758, 3.015143, 1, 1, 1, 1, 1,
1.065012, -0.2524632, 1.912464, 1, 1, 1, 1, 1,
1.066467, -0.1279164, 0.3961172, 1, 1, 1, 1, 1,
1.070594, -0.4539509, 1.539133, 1, 1, 1, 1, 1,
1.074087, -0.9762589, 1.795407, 1, 1, 1, 1, 1,
1.084492, 1.770193, 0.2703141, 1, 1, 1, 1, 1,
1.08465, -0.5019583, 2.61438, 0, 0, 1, 1, 1,
1.086658, 1.993581, 2.703493, 1, 0, 0, 1, 1,
1.088582, 2.252304, 0.08256886, 1, 0, 0, 1, 1,
1.09415, -1.359783, 2.991109, 1, 0, 0, 1, 1,
1.094619, -0.8572273, 2.741036, 1, 0, 0, 1, 1,
1.114219, -0.6195843, 1.634533, 1, 0, 0, 1, 1,
1.116212, 0.2775038, 1.300516, 0, 0, 0, 1, 1,
1.129297, -0.8187689, 3.453623, 0, 0, 0, 1, 1,
1.130607, 2.388041, -1.177225, 0, 0, 0, 1, 1,
1.13872, 0.1342217, 0.2839083, 0, 0, 0, 1, 1,
1.151984, -1.217291, 1.70941, 0, 0, 0, 1, 1,
1.152544, 1.053178, 2.268471, 0, 0, 0, 1, 1,
1.16569, -0.4070674, 1.871147, 0, 0, 0, 1, 1,
1.167088, -0.1229642, 1.991709, 1, 1, 1, 1, 1,
1.167188, -0.1748358, 0.7437147, 1, 1, 1, 1, 1,
1.171603, -0.4353184, 2.13068, 1, 1, 1, 1, 1,
1.182371, 2.252676, 0.3411395, 1, 1, 1, 1, 1,
1.191292, -0.8671243, 1.372603, 1, 1, 1, 1, 1,
1.191867, -0.5729698, 3.840549, 1, 1, 1, 1, 1,
1.197885, -0.8825868, 0.9231527, 1, 1, 1, 1, 1,
1.202921, -0.7559701, 2.887869, 1, 1, 1, 1, 1,
1.206889, 1.436063, -0.5950789, 1, 1, 1, 1, 1,
1.208945, 0.8575702, 1.70109, 1, 1, 1, 1, 1,
1.21181, 1.605372, 0.9424762, 1, 1, 1, 1, 1,
1.215353, -0.9057117, 2.096696, 1, 1, 1, 1, 1,
1.215863, 0.5523269, 0.1069021, 1, 1, 1, 1, 1,
1.219663, -0.3554369, 2.701266, 1, 1, 1, 1, 1,
1.225118, 0.421118, 0.5956586, 1, 1, 1, 1, 1,
1.226225, -0.7090743, 1.286689, 0, 0, 1, 1, 1,
1.227696, -0.7161548, 0.3109812, 1, 0, 0, 1, 1,
1.2373, -0.2790484, 2.296923, 1, 0, 0, 1, 1,
1.239489, 1.049691, 0.1216153, 1, 0, 0, 1, 1,
1.252349, 0.303508, 1.681104, 1, 0, 0, 1, 1,
1.256409, -0.08395074, 1.907367, 1, 0, 0, 1, 1,
1.258068, -0.6498576, 2.909227, 0, 0, 0, 1, 1,
1.263937, 1.795051, 0.8055548, 0, 0, 0, 1, 1,
1.268607, 0.6879914, 0.2328916, 0, 0, 0, 1, 1,
1.270537, -0.680621, 2.531924, 0, 0, 0, 1, 1,
1.309536, -0.4546341, 1.099594, 0, 0, 0, 1, 1,
1.320815, 0.2478703, 1.324394, 0, 0, 0, 1, 1,
1.324024, -0.9571927, 2.568298, 0, 0, 0, 1, 1,
1.325494, -0.1648199, 1.970916, 1, 1, 1, 1, 1,
1.330581, 0.6804698, -0.07625494, 1, 1, 1, 1, 1,
1.344045, 1.017773, -0.5723137, 1, 1, 1, 1, 1,
1.345649, 0.2942965, 0.6325592, 1, 1, 1, 1, 1,
1.355054, 0.371499, 0.6503664, 1, 1, 1, 1, 1,
1.355328, 0.6095527, 1.945977, 1, 1, 1, 1, 1,
1.361655, 0.8333713, 0.5469329, 1, 1, 1, 1, 1,
1.367625, -0.4219927, 0.8450499, 1, 1, 1, 1, 1,
1.368337, -1.037917, 2.706805, 1, 1, 1, 1, 1,
1.368963, 0.1116675, 2.534578, 1, 1, 1, 1, 1,
1.377548, -0.4926052, 1.213741, 1, 1, 1, 1, 1,
1.379018, -0.3861412, 3.257337, 1, 1, 1, 1, 1,
1.387555, 0.3355526, 1.700057, 1, 1, 1, 1, 1,
1.391095, 0.05326516, 0.7547081, 1, 1, 1, 1, 1,
1.397626, 1.327146, 1.676854, 1, 1, 1, 1, 1,
1.403631, -0.5879882, 0.9174263, 0, 0, 1, 1, 1,
1.410485, -0.9813598, 3.090857, 1, 0, 0, 1, 1,
1.417375, 1.768968, -0.3540776, 1, 0, 0, 1, 1,
1.439019, 1.706791, 2.529185, 1, 0, 0, 1, 1,
1.440152, -0.14224, 1.567552, 1, 0, 0, 1, 1,
1.446004, 1.191525, 1.778077, 1, 0, 0, 1, 1,
1.448287, 0.7809438, 1.481335, 0, 0, 0, 1, 1,
1.450599, 0.2832197, 2.088641, 0, 0, 0, 1, 1,
1.454199, -2.304437, 3.54796, 0, 0, 0, 1, 1,
1.463057, 0.184617, -0.5874806, 0, 0, 0, 1, 1,
1.472177, -1.535286, 4.431556, 0, 0, 0, 1, 1,
1.47239, 0.5962648, 0.3299704, 0, 0, 0, 1, 1,
1.475035, -1.011843, 3.924924, 0, 0, 0, 1, 1,
1.475816, 1.750286, 0.4754863, 1, 1, 1, 1, 1,
1.481943, 0.5352067, 1.418382, 1, 1, 1, 1, 1,
1.482192, -0.6642194, 3.20237, 1, 1, 1, 1, 1,
1.483811, -0.8502391, 2.460902, 1, 1, 1, 1, 1,
1.525034, 0.03680009, 0.8210178, 1, 1, 1, 1, 1,
1.542255, -0.7627786, 1.090928, 1, 1, 1, 1, 1,
1.543978, 1.567524, 1.032824, 1, 1, 1, 1, 1,
1.566186, -0.3467885, 1.965341, 1, 1, 1, 1, 1,
1.571871, -1.703668, 2.172779, 1, 1, 1, 1, 1,
1.61194, -0.2712405, 2.613409, 1, 1, 1, 1, 1,
1.616003, -0.3080514, 1.312669, 1, 1, 1, 1, 1,
1.617757, -0.2651017, 1.068834, 1, 1, 1, 1, 1,
1.62, 1.672749, -0.7091633, 1, 1, 1, 1, 1,
1.62585, 0.5859768, 2.782651, 1, 1, 1, 1, 1,
1.637295, -1.640983, 0.7913261, 1, 1, 1, 1, 1,
1.64256, 0.2886113, 2.052301, 0, 0, 1, 1, 1,
1.653868, 0.1499523, 2.081733, 1, 0, 0, 1, 1,
1.660879, 0.9313079, 1.114207, 1, 0, 0, 1, 1,
1.66157, 1.493395, 2.812832, 1, 0, 0, 1, 1,
1.673401, -1.075093, 3.173431, 1, 0, 0, 1, 1,
1.687174, -1.330052, 1.129629, 1, 0, 0, 1, 1,
1.71233, 0.3531636, 0.5621045, 0, 0, 0, 1, 1,
1.727847, -0.453528, 1.877413, 0, 0, 0, 1, 1,
1.735648, 0.3780301, 0.4154116, 0, 0, 0, 1, 1,
1.757994, -0.8047326, 1.52973, 0, 0, 0, 1, 1,
1.761978, 1.551699, 1.474529, 0, 0, 0, 1, 1,
1.765558, -0.1193661, 0.8844545, 0, 0, 0, 1, 1,
1.771414, 0.872056, 0.0970539, 0, 0, 0, 1, 1,
1.77991, 1.83454, 0.3683154, 1, 1, 1, 1, 1,
1.781038, 1.086317, -0.1122923, 1, 1, 1, 1, 1,
1.80081, -0.7804986, -0.5082768, 1, 1, 1, 1, 1,
1.807633, -0.13357, 2.667805, 1, 1, 1, 1, 1,
1.820029, 0.1170249, 1.739245, 1, 1, 1, 1, 1,
1.827578, 1.032055, 0.3674958, 1, 1, 1, 1, 1,
1.845293, 0.4126445, 1.368054, 1, 1, 1, 1, 1,
1.848508, -1.169394, 2.802328, 1, 1, 1, 1, 1,
1.875845, -0.7670676, 2.422968, 1, 1, 1, 1, 1,
1.88052, 0.3566006, 2.255781, 1, 1, 1, 1, 1,
1.885083, 0.7337116, 1.632385, 1, 1, 1, 1, 1,
1.899785, -1.612145, 3.485737, 1, 1, 1, 1, 1,
1.903764, -1.514093, 3.066707, 1, 1, 1, 1, 1,
1.907943, 0.6618397, 0.6741002, 1, 1, 1, 1, 1,
1.909562, -1.266477, 1.953381, 1, 1, 1, 1, 1,
1.914223, 1.16592, 0.8516262, 0, 0, 1, 1, 1,
1.953021, -0.4161882, 2.015382, 1, 0, 0, 1, 1,
1.961289, -0.2218518, 0.2738649, 1, 0, 0, 1, 1,
1.971752, 0.8156181, 0.795837, 1, 0, 0, 1, 1,
1.986038, -0.7808782, 3.557087, 1, 0, 0, 1, 1,
1.996032, -0.3586288, 1.74157, 1, 0, 0, 1, 1,
2.013898, -0.492659, 2.826351, 0, 0, 0, 1, 1,
2.030378, 0.1763014, 3.028097, 0, 0, 0, 1, 1,
2.055157, 0.2208876, 1.7339, 0, 0, 0, 1, 1,
2.078545, 1.07268, 1.247562, 0, 0, 0, 1, 1,
2.137196, 0.7181286, 1.958741, 0, 0, 0, 1, 1,
2.143255, 0.4674835, 1.621576, 0, 0, 0, 1, 1,
2.177787, -1.113397, 2.779802, 0, 0, 0, 1, 1,
2.314577, 0.700412, 1.776912, 1, 1, 1, 1, 1,
2.374355, 0.606104, 2.197505, 1, 1, 1, 1, 1,
2.504008, -0.2254016, 1.114594, 1, 1, 1, 1, 1,
2.507056, -0.2327977, 2.434579, 1, 1, 1, 1, 1,
2.620021, 1.321749, 2.197684, 1, 1, 1, 1, 1,
2.901103, -0.09796564, 3.849685, 1, 1, 1, 1, 1,
2.908849, -0.7037131, 1.623703, 1, 1, 1, 1, 1
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
var radius = 9.192249;
var distance = 32.28738;
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
mvMatrix.translate( 0.1692631, -0.1059513, 0.08805513 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.28738);
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
