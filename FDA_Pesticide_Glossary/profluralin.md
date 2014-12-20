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
-3.104844, 0.08927094, -1.53432, 1, 0, 0, 1,
-3.055857, 0.7999316, -2.148979, 1, 0.007843138, 0, 1,
-2.945856, 1.056091, -1.231511, 1, 0.01176471, 0, 1,
-2.857721, 0.9297007, -0.4403722, 1, 0.01960784, 0, 1,
-2.735776, -0.705999, -2.156667, 1, 0.02352941, 0, 1,
-2.715417, -0.4498128, -1.636497, 1, 0.03137255, 0, 1,
-2.693481, -0.0236599, -1.571101, 1, 0.03529412, 0, 1,
-2.680007, 1.182504, -0.5346372, 1, 0.04313726, 0, 1,
-2.66294, 1.276093, -1.946163, 1, 0.04705882, 0, 1,
-2.590204, 0.07583659, -2.286214, 1, 0.05490196, 0, 1,
-2.576681, 0.9410152, -0.6765453, 1, 0.05882353, 0, 1,
-2.514856, 0.4322908, -0.6554756, 1, 0.06666667, 0, 1,
-2.498704, -0.0581268, -3.13872, 1, 0.07058824, 0, 1,
-2.408689, 2.022813, -1.171795, 1, 0.07843138, 0, 1,
-2.378265, 0.06143381, -0.1107394, 1, 0.08235294, 0, 1,
-2.341433, 0.2808038, -2.638697, 1, 0.09019608, 0, 1,
-2.244099, -1.04182, -1.738855, 1, 0.09411765, 0, 1,
-2.243222, 0.6003741, -0.8409288, 1, 0.1019608, 0, 1,
-2.215669, -0.5125369, -3.13486, 1, 0.1098039, 0, 1,
-2.185303, -1.368654, -2.055746, 1, 0.1137255, 0, 1,
-2.128415, 1.442139, -2.253996, 1, 0.1215686, 0, 1,
-2.112572, 0.979338, -1.703885, 1, 0.1254902, 0, 1,
-2.087974, 2.351326, -1.589523, 1, 0.1333333, 0, 1,
-2.046211, -0.9248391, -2.118772, 1, 0.1372549, 0, 1,
-2.036981, -1.001592, -2.143257, 1, 0.145098, 0, 1,
-2.03454, -0.8207794, -1.731148, 1, 0.1490196, 0, 1,
-2.026457, 0.7415035, 0.5105768, 1, 0.1568628, 0, 1,
-2.007752, 0.3412857, -1.582373, 1, 0.1607843, 0, 1,
-2.00103, -1.138002, -2.926581, 1, 0.1686275, 0, 1,
-1.98988, 1.978029, -1.265359, 1, 0.172549, 0, 1,
-1.948647, 1.66607, -1.480993, 1, 0.1803922, 0, 1,
-1.938463, -0.3114392, -0.805914, 1, 0.1843137, 0, 1,
-1.918842, -0.2142326, -1.393265, 1, 0.1921569, 0, 1,
-1.915769, -0.6149325, -2.801088, 1, 0.1960784, 0, 1,
-1.912249, 1.070657, -1.316821, 1, 0.2039216, 0, 1,
-1.891609, -0.04966392, -2.268569, 1, 0.2117647, 0, 1,
-1.879674, -0.3546089, -0.9142868, 1, 0.2156863, 0, 1,
-1.861116, -0.2710088, -2.085256, 1, 0.2235294, 0, 1,
-1.831885, -0.6855041, 0.05450118, 1, 0.227451, 0, 1,
-1.812477, -0.7734817, -1.795344, 1, 0.2352941, 0, 1,
-1.792687, -0.5886983, -2.902877, 1, 0.2392157, 0, 1,
-1.755527, 0.7641489, -1.408083, 1, 0.2470588, 0, 1,
-1.748882, -2.376869, -1.976921, 1, 0.2509804, 0, 1,
-1.741072, 2.333653, -2.744926, 1, 0.2588235, 0, 1,
-1.740866, 0.6397405, -0.8512099, 1, 0.2627451, 0, 1,
-1.737621, -1.027598, -2.3213, 1, 0.2705882, 0, 1,
-1.733265, -0.3541824, -0.4110458, 1, 0.2745098, 0, 1,
-1.722065, 1.087794, -1.581657, 1, 0.282353, 0, 1,
-1.713824, 1.902983, -3.146565, 1, 0.2862745, 0, 1,
-1.699125, -0.3552426, -3.605383, 1, 0.2941177, 0, 1,
-1.682804, 0.8854858, -1.279596, 1, 0.3019608, 0, 1,
-1.671363, 1.837101, -2.200367, 1, 0.3058824, 0, 1,
-1.665932, 1.957431, 0.9649318, 1, 0.3137255, 0, 1,
-1.661705, -0.7535362, -2.629195, 1, 0.3176471, 0, 1,
-1.653408, -1.99336, -1.210394, 1, 0.3254902, 0, 1,
-1.649493, 0.744864, 1.609713, 1, 0.3294118, 0, 1,
-1.631093, 0.3166929, -0.2231769, 1, 0.3372549, 0, 1,
-1.625333, 0.9319249, -1.570821, 1, 0.3411765, 0, 1,
-1.620847, -0.004229457, -1.754624, 1, 0.3490196, 0, 1,
-1.619212, -0.1472884, -1.157668, 1, 0.3529412, 0, 1,
-1.617561, 0.6499299, -1.181775, 1, 0.3607843, 0, 1,
-1.605905, -0.3503002, 0.2216109, 1, 0.3647059, 0, 1,
-1.59934, 1.097916, 0.1739391, 1, 0.372549, 0, 1,
-1.591519, -1.662932, -1.193209, 1, 0.3764706, 0, 1,
-1.585702, 0.8256627, -0.2776046, 1, 0.3843137, 0, 1,
-1.576512, -0.3971584, -0.9167278, 1, 0.3882353, 0, 1,
-1.555173, 0.8632911, -0.5875468, 1, 0.3960784, 0, 1,
-1.554705, -0.05336288, -1.250765, 1, 0.4039216, 0, 1,
-1.552244, 0.5061591, -1.534603, 1, 0.4078431, 0, 1,
-1.549572, -0.06005932, -2.055822, 1, 0.4156863, 0, 1,
-1.548227, 1.038526, -1.584754, 1, 0.4196078, 0, 1,
-1.541073, 2.133464, -1.527175, 1, 0.427451, 0, 1,
-1.529309, 1.445178, -0.5899307, 1, 0.4313726, 0, 1,
-1.527344, 0.6570596, -1.699896, 1, 0.4392157, 0, 1,
-1.519868, 0.2806173, -1.361861, 1, 0.4431373, 0, 1,
-1.514683, 0.3497664, -1.325912, 1, 0.4509804, 0, 1,
-1.512044, 1.163487, -1.282491, 1, 0.454902, 0, 1,
-1.49459, 0.8003312, -0.4297367, 1, 0.4627451, 0, 1,
-1.492117, -0.8743851, -2.11466, 1, 0.4666667, 0, 1,
-1.474816, -0.2945451, -0.850358, 1, 0.4745098, 0, 1,
-1.456432, 2.072604, 0.2906917, 1, 0.4784314, 0, 1,
-1.44924, 1.296952, -0.2903049, 1, 0.4862745, 0, 1,
-1.433691, 1.132653, 2.252328, 1, 0.4901961, 0, 1,
-1.417055, 0.382212, -1.675338, 1, 0.4980392, 0, 1,
-1.414127, -0.4338506, 0.3849522, 1, 0.5058824, 0, 1,
-1.411911, -0.8823076, -2.727648, 1, 0.509804, 0, 1,
-1.392705, 1.815201, -1.050257, 1, 0.5176471, 0, 1,
-1.375429, 0.9588448, -1.058265, 1, 0.5215687, 0, 1,
-1.371826, -1.006793, -2.354724, 1, 0.5294118, 0, 1,
-1.369099, 1.046174, 0.4041918, 1, 0.5333334, 0, 1,
-1.36781, 0.2505619, -1.643332, 1, 0.5411765, 0, 1,
-1.367485, -0.3596165, -2.514801, 1, 0.5450981, 0, 1,
-1.367002, 0.1618731, -3.165742, 1, 0.5529412, 0, 1,
-1.365566, -2.666972, -2.561137, 1, 0.5568628, 0, 1,
-1.364399, 0.4677804, -0.9156007, 1, 0.5647059, 0, 1,
-1.348066, 0.2194504, 1.131699, 1, 0.5686275, 0, 1,
-1.341401, 0.2470697, -0.2145339, 1, 0.5764706, 0, 1,
-1.34008, 1.634885, 1.048523, 1, 0.5803922, 0, 1,
-1.33042, 1.193276, -0.5270186, 1, 0.5882353, 0, 1,
-1.329062, -0.4348279, -0.7622243, 1, 0.5921569, 0, 1,
-1.319137, 0.3347259, -0.6425085, 1, 0.6, 0, 1,
-1.314176, 0.3662916, -1.197508, 1, 0.6078432, 0, 1,
-1.313114, -1.16714, -1.73794, 1, 0.6117647, 0, 1,
-1.311702, -0.9538407, -1.761, 1, 0.6196079, 0, 1,
-1.310295, 0.113037, -2.096012, 1, 0.6235294, 0, 1,
-1.277339, 1.018949, -1.255285, 1, 0.6313726, 0, 1,
-1.270428, 0.9208075, -1.65879, 1, 0.6352941, 0, 1,
-1.261776, -1.860296, -4.062466, 1, 0.6431373, 0, 1,
-1.259851, 0.5438685, 0.8492822, 1, 0.6470588, 0, 1,
-1.259627, 0.355226, -0.6392285, 1, 0.654902, 0, 1,
-1.258439, -1.640559, -2.867455, 1, 0.6588235, 0, 1,
-1.255744, -1.18897, -2.209401, 1, 0.6666667, 0, 1,
-1.250599, 0.8427082, -0.4753827, 1, 0.6705883, 0, 1,
-1.247723, 0.0001793682, -1.684111, 1, 0.6784314, 0, 1,
-1.246735, 0.6878207, -3.790667, 1, 0.682353, 0, 1,
-1.242723, 1.06172, -2.16282, 1, 0.6901961, 0, 1,
-1.224173, 1.654313, -2.553677, 1, 0.6941177, 0, 1,
-1.22138, -0.5986211, -3.020781, 1, 0.7019608, 0, 1,
-1.219841, -0.1706545, -0.848168, 1, 0.7098039, 0, 1,
-1.212597, -2.137834, -1.636536, 1, 0.7137255, 0, 1,
-1.211156, 0.07215767, 0.08469552, 1, 0.7215686, 0, 1,
-1.210149, -0.9939662, -1.54574, 1, 0.7254902, 0, 1,
-1.210097, -0.1006843, -2.957042, 1, 0.7333333, 0, 1,
-1.208483, 0.757347, -3.025536, 1, 0.7372549, 0, 1,
-1.206906, 0.1389661, -0.7743005, 1, 0.7450981, 0, 1,
-1.20546, -1.353178, -3.550486, 1, 0.7490196, 0, 1,
-1.203105, 0.433146, -1.333494, 1, 0.7568628, 0, 1,
-1.200183, 0.1634141, -1.195213, 1, 0.7607843, 0, 1,
-1.194413, -0.2879843, -2.38444, 1, 0.7686275, 0, 1,
-1.188585, 1.329482, -0.8925089, 1, 0.772549, 0, 1,
-1.187436, 0.632534, -1.619666, 1, 0.7803922, 0, 1,
-1.176558, -0.4227505, -1.519764, 1, 0.7843137, 0, 1,
-1.176404, 0.6080273, -0.05371241, 1, 0.7921569, 0, 1,
-1.175486, -0.3708893, -1.817909, 1, 0.7960784, 0, 1,
-1.175329, 0.5373897, -0.7982504, 1, 0.8039216, 0, 1,
-1.175137, -2.512236, -2.933703, 1, 0.8117647, 0, 1,
-1.164889, -0.2880854, -1.20144, 1, 0.8156863, 0, 1,
-1.157616, -2.143783, -2.230857, 1, 0.8235294, 0, 1,
-1.138993, -0.7677097, -1.960518, 1, 0.827451, 0, 1,
-1.136997, -1.077209, -2.68113, 1, 0.8352941, 0, 1,
-1.134729, -0.05924986, -0.3512451, 1, 0.8392157, 0, 1,
-1.133393, -0.124533, -2.911365, 1, 0.8470588, 0, 1,
-1.12786, -0.1789891, -1.969228, 1, 0.8509804, 0, 1,
-1.117795, 0.599629, -1.503195, 1, 0.8588235, 0, 1,
-1.110944, 2.377934, -1.400346, 1, 0.8627451, 0, 1,
-1.109482, 0.82047, -1.857842, 1, 0.8705882, 0, 1,
-1.109029, -0.4763781, -3.275606, 1, 0.8745098, 0, 1,
-1.102899, 0.8957527, -1.580074, 1, 0.8823529, 0, 1,
-1.102796, 0.2626485, 0.03851712, 1, 0.8862745, 0, 1,
-1.101218, -0.1063617, -2.056433, 1, 0.8941177, 0, 1,
-1.100531, 0.2380608, -2.176045, 1, 0.8980392, 0, 1,
-1.098543, 0.02113174, -4.031412, 1, 0.9058824, 0, 1,
-1.09838, -1.10664, -2.521653, 1, 0.9137255, 0, 1,
-1.093775, 0.06266829, -0.7028458, 1, 0.9176471, 0, 1,
-1.090163, 1.094317, -0.05510733, 1, 0.9254902, 0, 1,
-1.084015, -0.156271, -2.453446, 1, 0.9294118, 0, 1,
-1.082852, -0.7029664, -1.191926, 1, 0.9372549, 0, 1,
-1.070547, -0.6418507, -0.9229581, 1, 0.9411765, 0, 1,
-1.065317, -2.397578, -1.9518, 1, 0.9490196, 0, 1,
-1.064115, -0.1832551, -0.4049678, 1, 0.9529412, 0, 1,
-1.055577, 1.289029, 0.1578857, 1, 0.9607843, 0, 1,
-1.043722, -1.44314, -3.795279, 1, 0.9647059, 0, 1,
-1.04245, -0.4389428, -1.74963, 1, 0.972549, 0, 1,
-1.041234, -0.03963497, -0.5257025, 1, 0.9764706, 0, 1,
-1.037695, -0.7251299, -3.103913, 1, 0.9843137, 0, 1,
-1.031296, -0.3582697, -1.314726, 1, 0.9882353, 0, 1,
-1.024413, 0.974969, -2.63925, 1, 0.9960784, 0, 1,
-1.022684, -0.2050235, -1.888724, 0.9960784, 1, 0, 1,
-1.019695, 1.973096, -1.26088, 0.9921569, 1, 0, 1,
-1.015989, 0.3624032, -0.5058711, 0.9843137, 1, 0, 1,
-1.007008, -0.3559357, -1.914818, 0.9803922, 1, 0, 1,
-0.9985214, 0.1603209, 0.4214122, 0.972549, 1, 0, 1,
-0.9962381, -1.655757, -2.992445, 0.9686275, 1, 0, 1,
-0.9931605, 0.6997011, -0.03478268, 0.9607843, 1, 0, 1,
-0.9926097, 0.4373909, -0.7931553, 0.9568627, 1, 0, 1,
-0.9837664, -0.2102564, -1.447078, 0.9490196, 1, 0, 1,
-0.9777238, -1.132532, -2.889306, 0.945098, 1, 0, 1,
-0.9579037, 0.224061, -0.3579939, 0.9372549, 1, 0, 1,
-0.9565877, -0.2876248, -1.932925, 0.9333333, 1, 0, 1,
-0.9563715, 1.182474, 3.309707, 0.9254902, 1, 0, 1,
-0.9511899, -0.4761066, -3.379425, 0.9215686, 1, 0, 1,
-0.9363429, -1.011398, -4.020229, 0.9137255, 1, 0, 1,
-0.934962, -0.7436683, 0.1793906, 0.9098039, 1, 0, 1,
-0.9332187, -1.045765, -2.52097, 0.9019608, 1, 0, 1,
-0.9315032, -0.7425053, -2.595277, 0.8941177, 1, 0, 1,
-0.9306039, 1.69968, -1.815823, 0.8901961, 1, 0, 1,
-0.9274354, -0.6360657, -1.156939, 0.8823529, 1, 0, 1,
-0.9153189, 0.1714617, -1.335922, 0.8784314, 1, 0, 1,
-0.9132738, -1.975018, -4.280684, 0.8705882, 1, 0, 1,
-0.90416, -0.6552249, -3.951343, 0.8666667, 1, 0, 1,
-0.9032928, -0.5885704, -2.87446, 0.8588235, 1, 0, 1,
-0.9027297, 0.4258033, -0.9692534, 0.854902, 1, 0, 1,
-0.8991472, -2.007802, -2.402642, 0.8470588, 1, 0, 1,
-0.8962407, -0.4012828, -2.73337, 0.8431373, 1, 0, 1,
-0.8919332, 1.303599, 0.7000638, 0.8352941, 1, 0, 1,
-0.8780506, 0.5605332, -2.332186, 0.8313726, 1, 0, 1,
-0.8764454, 1.351973, -0.8710771, 0.8235294, 1, 0, 1,
-0.8742436, -0.8856432, -3.262768, 0.8196079, 1, 0, 1,
-0.8737955, 2.152232, 1.191985, 0.8117647, 1, 0, 1,
-0.8633618, 1.111777, -0.3880586, 0.8078431, 1, 0, 1,
-0.8630036, -1.431706, -2.842003, 0.8, 1, 0, 1,
-0.8628106, 1.531046, 0.1266116, 0.7921569, 1, 0, 1,
-0.8613858, 0.3704927, -1.803423, 0.7882353, 1, 0, 1,
-0.857778, 1.03128, -1.36423, 0.7803922, 1, 0, 1,
-0.8547271, 0.06504266, -2.496395, 0.7764706, 1, 0, 1,
-0.8509173, 0.1963837, -2.467381, 0.7686275, 1, 0, 1,
-0.8464558, 0.6635093, -1.412319, 0.7647059, 1, 0, 1,
-0.8452261, -0.9628506, -2.426998, 0.7568628, 1, 0, 1,
-0.8432833, -1.990317, -2.283696, 0.7529412, 1, 0, 1,
-0.8431768, 0.5790222, -2.060983, 0.7450981, 1, 0, 1,
-0.8414751, 2.043948, -1.109635, 0.7411765, 1, 0, 1,
-0.837137, -0.79527, -4.376142, 0.7333333, 1, 0, 1,
-0.832946, 1.686286, 0.315227, 0.7294118, 1, 0, 1,
-0.8300791, -0.6636983, -1.831105, 0.7215686, 1, 0, 1,
-0.8237032, 0.7135617, -2.274719, 0.7176471, 1, 0, 1,
-0.8197201, 0.7300162, -1.20208, 0.7098039, 1, 0, 1,
-0.8154617, 0.5911466, -2.020793, 0.7058824, 1, 0, 1,
-0.8129266, 0.7193393, 0.3526287, 0.6980392, 1, 0, 1,
-0.8123664, 1.778408, -0.6103178, 0.6901961, 1, 0, 1,
-0.811694, 0.7447639, -0.01736281, 0.6862745, 1, 0, 1,
-0.8107415, -0.8019613, -1.72984, 0.6784314, 1, 0, 1,
-0.8075849, -1.659319, -3.459327, 0.6745098, 1, 0, 1,
-0.8000125, 0.9411722, 0.5692056, 0.6666667, 1, 0, 1,
-0.7990355, 0.3483581, -0.8105355, 0.6627451, 1, 0, 1,
-0.7983794, -0.0008508482, -1.141147, 0.654902, 1, 0, 1,
-0.7965031, 0.6921054, -1.8045, 0.6509804, 1, 0, 1,
-0.7848375, 2.603454, 0.1318049, 0.6431373, 1, 0, 1,
-0.7836666, 1.02462, 0.5112486, 0.6392157, 1, 0, 1,
-0.7828077, 0.5812026, -0.1312748, 0.6313726, 1, 0, 1,
-0.7826772, -0.5344271, -2.93291, 0.627451, 1, 0, 1,
-0.771778, 0.429446, 0.5383732, 0.6196079, 1, 0, 1,
-0.7695807, -1.185348, -1.566929, 0.6156863, 1, 0, 1,
-0.7693261, -0.9291345, -1.632331, 0.6078432, 1, 0, 1,
-0.7627546, 0.3402344, -1.689369, 0.6039216, 1, 0, 1,
-0.7627413, 0.1534024, -2.244374, 0.5960785, 1, 0, 1,
-0.7593829, -0.07464552, -3.188716, 0.5882353, 1, 0, 1,
-0.7557713, 0.1437039, -1.870177, 0.5843138, 1, 0, 1,
-0.7536896, -0.6889515, 0.1443111, 0.5764706, 1, 0, 1,
-0.7523327, 0.4603394, -0.1975854, 0.572549, 1, 0, 1,
-0.7510983, -0.3147577, -1.671434, 0.5647059, 1, 0, 1,
-0.7493115, 0.6097067, -0.3892451, 0.5607843, 1, 0, 1,
-0.745096, -0.1720724, -1.82992, 0.5529412, 1, 0, 1,
-0.7406868, 0.1810069, 0.5159075, 0.5490196, 1, 0, 1,
-0.7326752, 0.2427523, -1.137947, 0.5411765, 1, 0, 1,
-0.7315275, -1.403776, -3.953884, 0.5372549, 1, 0, 1,
-0.7299433, 1.185071, -1.110906, 0.5294118, 1, 0, 1,
-0.7201307, 0.9522617, -1.621522, 0.5254902, 1, 0, 1,
-0.7117406, 1.416324, 0.221839, 0.5176471, 1, 0, 1,
-0.6931442, -0.3491539, -2.148849, 0.5137255, 1, 0, 1,
-0.6916968, 1.48226, -1.246965, 0.5058824, 1, 0, 1,
-0.6882332, -1.50483, -4.219122, 0.5019608, 1, 0, 1,
-0.6880698, -0.152647, -1.677999, 0.4941176, 1, 0, 1,
-0.6858301, -0.05154983, -2.065127, 0.4862745, 1, 0, 1,
-0.6789881, 0.905994, 1.639787, 0.4823529, 1, 0, 1,
-0.676273, -0.1840254, -3.247814, 0.4745098, 1, 0, 1,
-0.675256, -0.8415051, -3.375061, 0.4705882, 1, 0, 1,
-0.6739168, 1.135294, -2.088057, 0.4627451, 1, 0, 1,
-0.6718169, -0.5222077, -1.261731, 0.4588235, 1, 0, 1,
-0.6691607, -1.332719, -2.06587, 0.4509804, 1, 0, 1,
-0.6637603, -1.467916, 0.2382501, 0.4470588, 1, 0, 1,
-0.6630238, -0.7315292, -1.743737, 0.4392157, 1, 0, 1,
-0.661319, 1.030776, -0.2103813, 0.4352941, 1, 0, 1,
-0.6561468, -1.239067, -3.208261, 0.427451, 1, 0, 1,
-0.6530757, 0.3205246, -1.273388, 0.4235294, 1, 0, 1,
-0.6524395, 0.7417777, -0.9115164, 0.4156863, 1, 0, 1,
-0.651373, 1.004678, -0.5591672, 0.4117647, 1, 0, 1,
-0.6509421, 1.067854, -1.683973, 0.4039216, 1, 0, 1,
-0.6486511, -0.865546, -2.061042, 0.3960784, 1, 0, 1,
-0.6471927, -0.2282609, -2.733598, 0.3921569, 1, 0, 1,
-0.6469334, -0.4927736, -1.448594, 0.3843137, 1, 0, 1,
-0.6320099, 0.08502747, -2.776122, 0.3803922, 1, 0, 1,
-0.6313097, 0.479833, -1.873461, 0.372549, 1, 0, 1,
-0.6241192, -0.0221844, -3.034589, 0.3686275, 1, 0, 1,
-0.6234628, -0.7477799, -2.255583, 0.3607843, 1, 0, 1,
-0.6169568, -0.7284766, -3.308089, 0.3568628, 1, 0, 1,
-0.6117142, -0.1620523, -1.969747, 0.3490196, 1, 0, 1,
-0.5990769, 0.2624876, -1.671069, 0.345098, 1, 0, 1,
-0.5973234, 1.807069, -0.3992412, 0.3372549, 1, 0, 1,
-0.5957853, 0.423257, -0.5388497, 0.3333333, 1, 0, 1,
-0.5951308, -0.9048083, -2.593854, 0.3254902, 1, 0, 1,
-0.5946336, -0.7311935, -1.721427, 0.3215686, 1, 0, 1,
-0.5945401, 1.007438, -1.150356, 0.3137255, 1, 0, 1,
-0.5921122, -1.96181, -3.387006, 0.3098039, 1, 0, 1,
-0.591709, 1.071629, 0.6189592, 0.3019608, 1, 0, 1,
-0.5914466, -1.216902, -1.677739, 0.2941177, 1, 0, 1,
-0.5910267, 0.8477612, -4.199039, 0.2901961, 1, 0, 1,
-0.5897371, -0.2318457, -1.75928, 0.282353, 1, 0, 1,
-0.5879572, 0.9578941, -1.005731, 0.2784314, 1, 0, 1,
-0.587332, -0.3994693, -2.676986, 0.2705882, 1, 0, 1,
-0.5855448, 2.2156, -0.1836948, 0.2666667, 1, 0, 1,
-0.5840255, 1.15688, -2.251054, 0.2588235, 1, 0, 1,
-0.5827651, -0.2407499, -2.028478, 0.254902, 1, 0, 1,
-0.5820659, -0.6309929, -2.198105, 0.2470588, 1, 0, 1,
-0.5796793, 0.990014, 1.953587, 0.2431373, 1, 0, 1,
-0.5758417, -0.871437, -3.462285, 0.2352941, 1, 0, 1,
-0.5751315, 1.025848, 1.098261, 0.2313726, 1, 0, 1,
-0.5740196, 0.9097901, -0.7670081, 0.2235294, 1, 0, 1,
-0.5726269, -0.0521937, -0.9167871, 0.2196078, 1, 0, 1,
-0.5725395, 0.2108758, -1.332265, 0.2117647, 1, 0, 1,
-0.5668522, 0.803294, -0.8257357, 0.2078431, 1, 0, 1,
-0.5635861, 0.320931, -2.431622, 0.2, 1, 0, 1,
-0.5631101, -0.4811453, -3.15966, 0.1921569, 1, 0, 1,
-0.5540736, -0.4562479, -4.434601, 0.1882353, 1, 0, 1,
-0.5522009, 0.8618897, -1.510678, 0.1803922, 1, 0, 1,
-0.5516032, -0.01071358, 0.4243248, 0.1764706, 1, 0, 1,
-0.5510302, -0.8891336, -2.679121, 0.1686275, 1, 0, 1,
-0.5475922, 1.349376, -1.281448, 0.1647059, 1, 0, 1,
-0.5384304, -0.736201, -2.474329, 0.1568628, 1, 0, 1,
-0.5310365, 0.4810261, -1.545341, 0.1529412, 1, 0, 1,
-0.5300977, -0.02588702, -2.998746, 0.145098, 1, 0, 1,
-0.5272956, 0.8562197, 0.08824007, 0.1411765, 1, 0, 1,
-0.5220051, 1.340755, 0.1756729, 0.1333333, 1, 0, 1,
-0.5215404, -0.6787902, -1.423158, 0.1294118, 1, 0, 1,
-0.5203056, 0.8199899, 0.7673429, 0.1215686, 1, 0, 1,
-0.5046567, 1.208892, 0.00307382, 0.1176471, 1, 0, 1,
-0.5024257, 1.536627, -3.070214, 0.1098039, 1, 0, 1,
-0.5002102, -1.56586, -2.706299, 0.1058824, 1, 0, 1,
-0.4969505, -0.9497414, -2.024721, 0.09803922, 1, 0, 1,
-0.4964465, -1.360581, -0.7133012, 0.09019608, 1, 0, 1,
-0.4954167, 0.05535443, -1.714263, 0.08627451, 1, 0, 1,
-0.4901946, -1.192814, -3.352588, 0.07843138, 1, 0, 1,
-0.4901922, 0.4060798, -1.437557, 0.07450981, 1, 0, 1,
-0.4867471, -0.183426, -0.0927588, 0.06666667, 1, 0, 1,
-0.485626, 1.156652, -0.2049999, 0.0627451, 1, 0, 1,
-0.48457, 0.2488388, -1.347971, 0.05490196, 1, 0, 1,
-0.4799488, 1.718184, -1.504059, 0.05098039, 1, 0, 1,
-0.4763331, -1.569567, -1.591346, 0.04313726, 1, 0, 1,
-0.4751172, -0.6977541, -1.771078, 0.03921569, 1, 0, 1,
-0.468199, -0.7000811, -4.374166, 0.03137255, 1, 0, 1,
-0.4667874, 0.5927976, -1.167452, 0.02745098, 1, 0, 1,
-0.4636781, 1.585717, -0.5532016, 0.01960784, 1, 0, 1,
-0.458829, 2.032079, -1.892195, 0.01568628, 1, 0, 1,
-0.4519328, 0.1318901, -1.251344, 0.007843138, 1, 0, 1,
-0.4506046, -0.07402191, 0.3198459, 0.003921569, 1, 0, 1,
-0.449615, -0.09433477, -0.9110377, 0, 1, 0.003921569, 1,
-0.4489661, -0.7690469, -1.568138, 0, 1, 0.01176471, 1,
-0.4436561, 0.1892805, -0.831264, 0, 1, 0.01568628, 1,
-0.4434525, 0.7023088, -0.274491, 0, 1, 0.02352941, 1,
-0.4405816, -0.1311146, -2.633032, 0, 1, 0.02745098, 1,
-0.4400046, -0.3603949, -2.197959, 0, 1, 0.03529412, 1,
-0.4354041, 2.153209, -0.8148043, 0, 1, 0.03921569, 1,
-0.4235436, 0.1331437, -0.6543905, 0, 1, 0.04705882, 1,
-0.4197498, -1.352195, -4.678292, 0, 1, 0.05098039, 1,
-0.4115116, -1.728886, -2.52738, 0, 1, 0.05882353, 1,
-0.4081219, -0.2178008, -1.63825, 0, 1, 0.0627451, 1,
-0.4005277, -0.5581169, -4.894946, 0, 1, 0.07058824, 1,
-0.3974605, -0.8941623, -3.308987, 0, 1, 0.07450981, 1,
-0.3947331, 0.483997, -0.8715341, 0, 1, 0.08235294, 1,
-0.3894246, 0.8956656, -0.3020797, 0, 1, 0.08627451, 1,
-0.3882853, -0.4524421, -1.124828, 0, 1, 0.09411765, 1,
-0.3874678, 0.9159123, 1.314452, 0, 1, 0.1019608, 1,
-0.3872949, 0.06454976, -1.256944, 0, 1, 0.1058824, 1,
-0.3872364, 0.6082879, -0.3022572, 0, 1, 0.1137255, 1,
-0.3869446, -0.5044289, -2.101816, 0, 1, 0.1176471, 1,
-0.3688175, -2.371894, -2.542722, 0, 1, 0.1254902, 1,
-0.3686388, 0.08800711, -2.155863, 0, 1, 0.1294118, 1,
-0.3681528, 0.9986521, 0.01587808, 0, 1, 0.1372549, 1,
-0.3674551, 0.2415949, -2.419522, 0, 1, 0.1411765, 1,
-0.3483346, -0.1746297, -3.205489, 0, 1, 0.1490196, 1,
-0.3479715, 1.246984, 0.6723998, 0, 1, 0.1529412, 1,
-0.3459108, 0.1137197, -0.8077066, 0, 1, 0.1607843, 1,
-0.3449121, -1.484974, -3.180073, 0, 1, 0.1647059, 1,
-0.3408897, 0.6565418, 0.964266, 0, 1, 0.172549, 1,
-0.3388045, 2.622173, 0.4186791, 0, 1, 0.1764706, 1,
-0.3371245, 1.131117, -0.2051372, 0, 1, 0.1843137, 1,
-0.3341364, 1.277261, 1.306777, 0, 1, 0.1882353, 1,
-0.3321961, 0.726941, 0.6318055, 0, 1, 0.1960784, 1,
-0.3316477, 1.692717, -0.2468637, 0, 1, 0.2039216, 1,
-0.3315793, -0.8797086, -2.278198, 0, 1, 0.2078431, 1,
-0.3308208, 1.756258, -0.3943732, 0, 1, 0.2156863, 1,
-0.3263099, 0.01005272, -0.7720326, 0, 1, 0.2196078, 1,
-0.3241204, 0.4407568, 0.9712007, 0, 1, 0.227451, 1,
-0.3189143, 0.7046373, 0.9300064, 0, 1, 0.2313726, 1,
-0.3187869, 1.1846, -0.2142523, 0, 1, 0.2392157, 1,
-0.3146326, -0.4131531, -0.7288724, 0, 1, 0.2431373, 1,
-0.3128547, 1.236056, -0.1989155, 0, 1, 0.2509804, 1,
-0.3061953, -0.7696825, -3.228798, 0, 1, 0.254902, 1,
-0.3059178, 0.02855559, -2.262056, 0, 1, 0.2627451, 1,
-0.3049221, 1.044141, 0.8293988, 0, 1, 0.2666667, 1,
-0.3036417, -1.516474, -3.405339, 0, 1, 0.2745098, 1,
-0.303229, -0.4144287, -1.699485, 0, 1, 0.2784314, 1,
-0.2974673, 0.07327443, -1.486728, 0, 1, 0.2862745, 1,
-0.2941685, -0.4665518, -2.430517, 0, 1, 0.2901961, 1,
-0.291099, -0.8913895, -1.555921, 0, 1, 0.2980392, 1,
-0.2910373, 2.403927, -1.247196, 0, 1, 0.3058824, 1,
-0.2904816, -2.24697, -2.424334, 0, 1, 0.3098039, 1,
-0.2830867, 1.589311, -0.8176265, 0, 1, 0.3176471, 1,
-0.2800944, -0.2716932, -2.070276, 0, 1, 0.3215686, 1,
-0.2769479, -0.611733, -2.945203, 0, 1, 0.3294118, 1,
-0.2757276, 0.6940259, -0.6363301, 0, 1, 0.3333333, 1,
-0.2744325, 0.9501404, -2.277858, 0, 1, 0.3411765, 1,
-0.2738597, -0.2233056, -1.533282, 0, 1, 0.345098, 1,
-0.2655101, 0.08997598, 0.1646117, 0, 1, 0.3529412, 1,
-0.2593479, -0.02951569, -1.779783, 0, 1, 0.3568628, 1,
-0.2574469, 1.681396, -0.3998212, 0, 1, 0.3647059, 1,
-0.2558544, 0.7172542, 0.01875713, 0, 1, 0.3686275, 1,
-0.2525979, 0.9616927, 0.9541035, 0, 1, 0.3764706, 1,
-0.2523495, -0.6648155, -2.972907, 0, 1, 0.3803922, 1,
-0.251813, 0.03564116, -1.807563, 0, 1, 0.3882353, 1,
-0.2515109, -1.173061, -3.462244, 0, 1, 0.3921569, 1,
-0.2506279, 0.6545647, -1.652219, 0, 1, 0.4, 1,
-0.2463706, -0.08782885, -1.837785, 0, 1, 0.4078431, 1,
-0.2448982, -0.3311656, -4.692973, 0, 1, 0.4117647, 1,
-0.2420942, -0.2396845, -1.169499, 0, 1, 0.4196078, 1,
-0.2417341, 0.7073022, -1.127147, 0, 1, 0.4235294, 1,
-0.240074, 0.3888085, -2.773369, 0, 1, 0.4313726, 1,
-0.2391616, 1.342647, 0.658261, 0, 1, 0.4352941, 1,
-0.2384395, -1.462113, -2.849832, 0, 1, 0.4431373, 1,
-0.2372392, 0.228789, -1.758727, 0, 1, 0.4470588, 1,
-0.2371962, -0.6088333, -2.323634, 0, 1, 0.454902, 1,
-0.234703, -0.8141132, -4.073974, 0, 1, 0.4588235, 1,
-0.2341812, -0.4254884, -4.625516, 0, 1, 0.4666667, 1,
-0.2318696, 0.2208839, -0.5376002, 0, 1, 0.4705882, 1,
-0.2285018, 0.6995113, 0.7638989, 0, 1, 0.4784314, 1,
-0.2268296, -1.423344, -3.094504, 0, 1, 0.4823529, 1,
-0.2215976, -2.098282, -2.283165, 0, 1, 0.4901961, 1,
-0.2209905, -0.3844528, -2.892012, 0, 1, 0.4941176, 1,
-0.2202245, 0.6100804, -0.3071625, 0, 1, 0.5019608, 1,
-0.2200236, 1.803353, -1.035004, 0, 1, 0.509804, 1,
-0.2180393, -0.02962955, -1.225638, 0, 1, 0.5137255, 1,
-0.2169202, 1.952474, 1.26808, 0, 1, 0.5215687, 1,
-0.2100761, 0.1408874, -1.212806, 0, 1, 0.5254902, 1,
-0.2071416, 0.2723474, 0.4081465, 0, 1, 0.5333334, 1,
-0.2023882, 1.234887, 0.002771262, 0, 1, 0.5372549, 1,
-0.2008767, 0.2494835, -1.901717, 0, 1, 0.5450981, 1,
-0.1934716, -0.7675289, -1.778796, 0, 1, 0.5490196, 1,
-0.192823, 1.645319, 0.3237863, 0, 1, 0.5568628, 1,
-0.1928224, -1.771356, -3.869971, 0, 1, 0.5607843, 1,
-0.1922056, -0.4724853, -2.748606, 0, 1, 0.5686275, 1,
-0.1887184, 0.5808322, -1.480278, 0, 1, 0.572549, 1,
-0.1817681, -0.5831671, -2.861644, 0, 1, 0.5803922, 1,
-0.176603, -1.34838, -2.522926, 0, 1, 0.5843138, 1,
-0.1746166, -0.4140608, -2.231265, 0, 1, 0.5921569, 1,
-0.1701278, -1.206991, -5.075349, 0, 1, 0.5960785, 1,
-0.1694494, 0.7476558, -0.8616424, 0, 1, 0.6039216, 1,
-0.167063, -0.9391111, -0.4861081, 0, 1, 0.6117647, 1,
-0.1668961, -1.179276, -3.665058, 0, 1, 0.6156863, 1,
-0.1649081, 1.172728, 1.487175, 0, 1, 0.6235294, 1,
-0.1589548, -1.178336, -3.638982, 0, 1, 0.627451, 1,
-0.1585095, -0.8966687, -2.018976, 0, 1, 0.6352941, 1,
-0.1573283, -0.5295662, -3.794655, 0, 1, 0.6392157, 1,
-0.1572518, -0.8795384, -3.58864, 0, 1, 0.6470588, 1,
-0.1560649, -1.113171, -2.712897, 0, 1, 0.6509804, 1,
-0.1551857, 0.01662444, -2.135412, 0, 1, 0.6588235, 1,
-0.1525165, 1.774181, -0.4778867, 0, 1, 0.6627451, 1,
-0.1479062, 0.6303177, -1.858508, 0, 1, 0.6705883, 1,
-0.1454796, 1.543451, -0.2026534, 0, 1, 0.6745098, 1,
-0.1451585, 1.141801, -0.8123599, 0, 1, 0.682353, 1,
-0.1444404, -0.545036, -1.729112, 0, 1, 0.6862745, 1,
-0.1436142, 0.2905415, -0.1438996, 0, 1, 0.6941177, 1,
-0.1428931, 0.1687887, -1.94407, 0, 1, 0.7019608, 1,
-0.1404289, 1.924918, -0.2801785, 0, 1, 0.7058824, 1,
-0.140007, 1.641401, -1.266202, 0, 1, 0.7137255, 1,
-0.1375265, 1.613295, 0.3109372, 0, 1, 0.7176471, 1,
-0.1368798, -0.6973884, -1.81781, 0, 1, 0.7254902, 1,
-0.1367976, 1.711768, 0.6990027, 0, 1, 0.7294118, 1,
-0.1339407, 2.359567, -0.6013001, 0, 1, 0.7372549, 1,
-0.1321517, 1.042858, -2.339395, 0, 1, 0.7411765, 1,
-0.1287962, -1.016591, -1.179899, 0, 1, 0.7490196, 1,
-0.1268606, -0.6074822, -2.684664, 0, 1, 0.7529412, 1,
-0.1254226, -0.09824072, -3.776957, 0, 1, 0.7607843, 1,
-0.1251192, -0.5196801, -2.60063, 0, 1, 0.7647059, 1,
-0.1236466, -0.7953174, -2.31503, 0, 1, 0.772549, 1,
-0.1234357, 0.4124945, -0.4042138, 0, 1, 0.7764706, 1,
-0.118054, 0.308064, 0.2498857, 0, 1, 0.7843137, 1,
-0.1140132, 0.7815122, -0.5856161, 0, 1, 0.7882353, 1,
-0.1113124, -1.442735, -2.873886, 0, 1, 0.7960784, 1,
-0.1108751, 0.9744307, -0.7883844, 0, 1, 0.8039216, 1,
-0.1073393, 0.890637, -0.9875049, 0, 1, 0.8078431, 1,
-0.1061476, -1.034704, -3.432188, 0, 1, 0.8156863, 1,
-0.1006034, -1.863015, -2.080714, 0, 1, 0.8196079, 1,
-0.09852425, 0.7712382, -0.3325217, 0, 1, 0.827451, 1,
-0.09536809, -0.2182899, -1.506819, 0, 1, 0.8313726, 1,
-0.09339921, 0.7871143, -1.184556, 0, 1, 0.8392157, 1,
-0.09314504, 1.438827, 0.1229455, 0, 1, 0.8431373, 1,
-0.09245906, 0.08081483, -0.06922808, 0, 1, 0.8509804, 1,
-0.08941852, -1.67758, -1.736103, 0, 1, 0.854902, 1,
-0.08668642, -0.2216044, -4.881179, 0, 1, 0.8627451, 1,
-0.08454421, -0.5947135, -3.374899, 0, 1, 0.8666667, 1,
-0.08164527, 0.1551589, -1.364119, 0, 1, 0.8745098, 1,
-0.08038221, 0.3725149, -0.3518399, 0, 1, 0.8784314, 1,
-0.07519772, 1.694837, 0.7163206, 0, 1, 0.8862745, 1,
-0.06854693, 0.9314946, -0.5402312, 0, 1, 0.8901961, 1,
-0.06835546, 1.060171, -1.208539, 0, 1, 0.8980392, 1,
-0.05825276, -1.396297, -3.488809, 0, 1, 0.9058824, 1,
-0.05403216, -2.049562, -1.955709, 0, 1, 0.9098039, 1,
-0.05391839, -0.7168906, -2.207302, 0, 1, 0.9176471, 1,
-0.05279136, -0.4735462, -2.868004, 0, 1, 0.9215686, 1,
-0.05089596, -0.1542255, -1.440525, 0, 1, 0.9294118, 1,
-0.0506191, -0.1660392, -3.147455, 0, 1, 0.9333333, 1,
-0.04737141, -0.2570477, -2.190036, 0, 1, 0.9411765, 1,
-0.04542398, 0.1988099, 1.426525, 0, 1, 0.945098, 1,
-0.04487567, 1.325325, -1.505041, 0, 1, 0.9529412, 1,
-0.04420203, 0.4210053, -0.3109204, 0, 1, 0.9568627, 1,
-0.04043191, 0.1297887, -1.59621, 0, 1, 0.9647059, 1,
-0.03937256, 0.5827147, -0.09221827, 0, 1, 0.9686275, 1,
-0.03549997, -0.3229502, -3.790659, 0, 1, 0.9764706, 1,
-0.02662074, -1.525651, -1.868244, 0, 1, 0.9803922, 1,
-0.02603465, 1.206319, 0.3349827, 0, 1, 0.9882353, 1,
-0.02585601, 1.23142, 0.5180784, 0, 1, 0.9921569, 1,
-0.02383617, -1.024078, -4.072078, 0, 1, 1, 1,
-0.02132734, 0.5742146, -0.3420881, 0, 0.9921569, 1, 1,
-0.01954553, -0.1134787, -4.160864, 0, 0.9882353, 1, 1,
-0.01795573, -1.061113, -3.218018, 0, 0.9803922, 1, 1,
-0.01695929, 0.7594309, 0.3461388, 0, 0.9764706, 1, 1,
-0.01502083, -0.3265681, -2.694093, 0, 0.9686275, 1, 1,
-0.01455786, -0.8032241, -4.219831, 0, 0.9647059, 1, 1,
-0.01455477, 1.573915, -1.298417, 0, 0.9568627, 1, 1,
-0.01421297, 0.0350306, -0.08032601, 0, 0.9529412, 1, 1,
-0.009396388, 0.3279568, 0.4054841, 0, 0.945098, 1, 1,
-0.007693977, 0.6864364, 0.2747661, 0, 0.9411765, 1, 1,
-0.007369483, 0.6444867, 0.5438203, 0, 0.9333333, 1, 1,
-0.006512188, -0.9712115, -2.724147, 0, 0.9294118, 1, 1,
-0.002423703, -0.6333482, -3.673541, 0, 0.9215686, 1, 1,
0.00345468, 1.978272, 0.6734181, 0, 0.9176471, 1, 1,
0.00934567, 0.07589546, 0.08045787, 0, 0.9098039, 1, 1,
0.01222558, 1.198863, -0.9727418, 0, 0.9058824, 1, 1,
0.01369334, -0.1704532, 3.121371, 0, 0.8980392, 1, 1,
0.01775823, 0.154569, 0.06480533, 0, 0.8901961, 1, 1,
0.01900982, -0.04417028, 3.93894, 0, 0.8862745, 1, 1,
0.02071368, 0.6556802, -1.324135, 0, 0.8784314, 1, 1,
0.02086101, -1.134895, 3.156889, 0, 0.8745098, 1, 1,
0.02418817, 0.8796249, 0.280299, 0, 0.8666667, 1, 1,
0.02576259, -1.184801, 3.968172, 0, 0.8627451, 1, 1,
0.02813087, 1.74351, -3.155272, 0, 0.854902, 1, 1,
0.02861434, 0.391495, -0.4098316, 0, 0.8509804, 1, 1,
0.03168952, -1.492932, 1.821801, 0, 0.8431373, 1, 1,
0.03375975, -0.5543031, 3.77089, 0, 0.8392157, 1, 1,
0.03829396, 0.3309175, -0.2720548, 0, 0.8313726, 1, 1,
0.03886048, -0.7174811, 3.666729, 0, 0.827451, 1, 1,
0.03994866, -0.2669905, 3.701646, 0, 0.8196079, 1, 1,
0.04190301, 0.7425026, 1.824406, 0, 0.8156863, 1, 1,
0.04713694, 1.745782, -0.5800853, 0, 0.8078431, 1, 1,
0.04764658, -1.151371, 3.523165, 0, 0.8039216, 1, 1,
0.0488737, -0.995697, 2.826844, 0, 0.7960784, 1, 1,
0.04963646, 1.258841, 1.129148, 0, 0.7882353, 1, 1,
0.05773486, 0.2503859, -0.9066986, 0, 0.7843137, 1, 1,
0.06214335, 0.6803709, 0.4241212, 0, 0.7764706, 1, 1,
0.06463964, 0.06389017, 3.57365, 0, 0.772549, 1, 1,
0.06595219, -0.009424499, 0.9121839, 0, 0.7647059, 1, 1,
0.0661839, -1.452858, 1.593937, 0, 0.7607843, 1, 1,
0.0664068, 0.6855509, 1.843132, 0, 0.7529412, 1, 1,
0.07400263, -1.037025, 5.008271, 0, 0.7490196, 1, 1,
0.07645036, 0.138249, 1.617493, 0, 0.7411765, 1, 1,
0.08344261, -0.6850178, 1.782422, 0, 0.7372549, 1, 1,
0.08398438, 2.177113, -0.6602574, 0, 0.7294118, 1, 1,
0.08549225, -0.8831586, 3.823962, 0, 0.7254902, 1, 1,
0.0865601, 0.1392694, -1.149081, 0, 0.7176471, 1, 1,
0.08724944, 1.268931, -0.3918668, 0, 0.7137255, 1, 1,
0.08923873, -0.4536933, 3.165449, 0, 0.7058824, 1, 1,
0.09248781, 0.2379309, -0.5950849, 0, 0.6980392, 1, 1,
0.09281206, 1.497736, 0.08198369, 0, 0.6941177, 1, 1,
0.1025304, -0.3899982, 1.842676, 0, 0.6862745, 1, 1,
0.1150041, 0.5799441, -0.4971544, 0, 0.682353, 1, 1,
0.118103, 1.452186, -0.7347488, 0, 0.6745098, 1, 1,
0.1209168, 0.8451083, 1.002947, 0, 0.6705883, 1, 1,
0.1226336, 0.0048433, 2.951784, 0, 0.6627451, 1, 1,
0.123055, 1.650296, -0.5740863, 0, 0.6588235, 1, 1,
0.1235495, 1.159383, 0.5050306, 0, 0.6509804, 1, 1,
0.1241102, 0.8743037, -0.08886825, 0, 0.6470588, 1, 1,
0.1254796, -1.701603, 4.055959, 0, 0.6392157, 1, 1,
0.1279372, 0.2873276, 1.194406, 0, 0.6352941, 1, 1,
0.1340198, 0.002938164, 1.316469, 0, 0.627451, 1, 1,
0.1356257, 1.109027, -1.027325, 0, 0.6235294, 1, 1,
0.1358743, -0.3932675, 4.168493, 0, 0.6156863, 1, 1,
0.1394778, -0.5763453, 2.267798, 0, 0.6117647, 1, 1,
0.1442029, 0.1786995, 1.79485, 0, 0.6039216, 1, 1,
0.1470168, 0.5160263, -0.6375789, 0, 0.5960785, 1, 1,
0.150117, 0.6948608, 1.938172, 0, 0.5921569, 1, 1,
0.1504752, 0.9751266, 0.6028752, 0, 0.5843138, 1, 1,
0.1525849, 0.3686676, -1.893059, 0, 0.5803922, 1, 1,
0.154565, -2.602504, 2.519386, 0, 0.572549, 1, 1,
0.1556844, 1.153752, -0.2169131, 0, 0.5686275, 1, 1,
0.1561887, 1.169815, 0.389085, 0, 0.5607843, 1, 1,
0.1602763, -1.555778, 1.483343, 0, 0.5568628, 1, 1,
0.1614746, 1.748306, 1.231405, 0, 0.5490196, 1, 1,
0.1627732, -0.08967865, 2.033085, 0, 0.5450981, 1, 1,
0.1651403, 0.6959321, -1.452042, 0, 0.5372549, 1, 1,
0.171409, 2.024832, 1.568342, 0, 0.5333334, 1, 1,
0.178233, 0.2477098, -0.5995649, 0, 0.5254902, 1, 1,
0.1858456, -0.5549994, 4.071174, 0, 0.5215687, 1, 1,
0.187643, 0.4747268, 0.998729, 0, 0.5137255, 1, 1,
0.1879624, -0.3112091, 0.7263744, 0, 0.509804, 1, 1,
0.1890317, 0.5280176, 1.790143, 0, 0.5019608, 1, 1,
0.1897503, 1.202135, -1.028963, 0, 0.4941176, 1, 1,
0.1941823, -1.459083, 4.911387, 0, 0.4901961, 1, 1,
0.1948391, 1.179765, -0.7233833, 0, 0.4823529, 1, 1,
0.1950167, -0.4411667, 2.7185, 0, 0.4784314, 1, 1,
0.19577, 0.9337151, -0.200355, 0, 0.4705882, 1, 1,
0.2023194, 1.098371, 0.4174971, 0, 0.4666667, 1, 1,
0.2027506, 0.7780204, 2.042617, 0, 0.4588235, 1, 1,
0.204648, 0.2191117, 1.486503, 0, 0.454902, 1, 1,
0.2048415, 1.242583, 1.335755, 0, 0.4470588, 1, 1,
0.20495, -1.438065, 1.312283, 0, 0.4431373, 1, 1,
0.2068354, -1.152849, 5.970272, 0, 0.4352941, 1, 1,
0.2118118, -1.55539, 3.158413, 0, 0.4313726, 1, 1,
0.216037, 1.046141, -0.2557261, 0, 0.4235294, 1, 1,
0.2203194, 0.9772458, -0.1649167, 0, 0.4196078, 1, 1,
0.2234188, 0.7178379, 1.155124, 0, 0.4117647, 1, 1,
0.2241941, -1.354276, 2.874354, 0, 0.4078431, 1, 1,
0.2306473, -0.05310206, 3.187363, 0, 0.4, 1, 1,
0.2309767, -0.08464414, 1.925003, 0, 0.3921569, 1, 1,
0.2328104, -0.4266248, 0.7763004, 0, 0.3882353, 1, 1,
0.2376381, -2.64322, 2.767462, 0, 0.3803922, 1, 1,
0.2379089, 0.4115841, 1.099316, 0, 0.3764706, 1, 1,
0.2380496, 1.187037, -2.421642, 0, 0.3686275, 1, 1,
0.2405674, -0.004527267, 2.61596, 0, 0.3647059, 1, 1,
0.2411543, -0.8987845, 3.058657, 0, 0.3568628, 1, 1,
0.2422434, -0.5518807, 2.54549, 0, 0.3529412, 1, 1,
0.2452235, -0.2521209, 2.289461, 0, 0.345098, 1, 1,
0.2468162, 1.341891, 1.886466, 0, 0.3411765, 1, 1,
0.2475449, -1.021414, 1.779037, 0, 0.3333333, 1, 1,
0.2476206, 0.2517439, 1.235178, 0, 0.3294118, 1, 1,
0.2481397, 1.352691, -0.2499546, 0, 0.3215686, 1, 1,
0.2495791, -1.036978, 4.180963, 0, 0.3176471, 1, 1,
0.2497967, 0.7805285, -1.602638, 0, 0.3098039, 1, 1,
0.250542, 0.5178841, 0.7498798, 0, 0.3058824, 1, 1,
0.2551531, 1.58779, 1.180949, 0, 0.2980392, 1, 1,
0.2569467, -1.637792, 1.86184, 0, 0.2901961, 1, 1,
0.2600629, 0.5190089, -0.4242301, 0, 0.2862745, 1, 1,
0.2605941, 0.2908751, -0.3891125, 0, 0.2784314, 1, 1,
0.2622959, -0.05293864, 2.158421, 0, 0.2745098, 1, 1,
0.2626729, 0.2115445, 0.5621043, 0, 0.2666667, 1, 1,
0.2673239, -0.6878458, 3.855371, 0, 0.2627451, 1, 1,
0.2761781, 0.03441043, 3.208744, 0, 0.254902, 1, 1,
0.2800141, -0.1419964, 2.535325, 0, 0.2509804, 1, 1,
0.2832353, 0.4055775, 0.0214187, 0, 0.2431373, 1, 1,
0.2841823, 0.8922745, 0.444784, 0, 0.2392157, 1, 1,
0.2867849, 1.934929, 0.8272825, 0, 0.2313726, 1, 1,
0.2884381, 0.3695931, -0.1108375, 0, 0.227451, 1, 1,
0.2896283, 1.353872, 1.444394, 0, 0.2196078, 1, 1,
0.2920967, 1.344844, 1.599602, 0, 0.2156863, 1, 1,
0.2947396, 0.1536866, -0.071567, 0, 0.2078431, 1, 1,
0.2953174, -1.937299, 1.231873, 0, 0.2039216, 1, 1,
0.297642, -0.4548548, 3.412671, 0, 0.1960784, 1, 1,
0.2976856, 0.3532487, 0.4943287, 0, 0.1882353, 1, 1,
0.2977393, -0.4475071, 1.930609, 0, 0.1843137, 1, 1,
0.2984949, -0.09343296, 3.289406, 0, 0.1764706, 1, 1,
0.2990058, 0.6877735, 0.1377967, 0, 0.172549, 1, 1,
0.3011286, 0.4095042, 1.086842, 0, 0.1647059, 1, 1,
0.3032976, -0.9308619, 3.027451, 0, 0.1607843, 1, 1,
0.303853, -1.592459, 2.288833, 0, 0.1529412, 1, 1,
0.3063036, -1.970955, 4.148551, 0, 0.1490196, 1, 1,
0.3068597, 1.323627, 0.3734322, 0, 0.1411765, 1, 1,
0.3075489, 0.07681541, 1.957767, 0, 0.1372549, 1, 1,
0.3092747, -2.071413, 3.852482, 0, 0.1294118, 1, 1,
0.3122424, -0.08578327, 1.833105, 0, 0.1254902, 1, 1,
0.3136079, 0.4330778, -0.9944817, 0, 0.1176471, 1, 1,
0.3171551, 1.185459, 1.029738, 0, 0.1137255, 1, 1,
0.3243595, -0.9965833, 3.348032, 0, 0.1058824, 1, 1,
0.3255554, -0.1534475, -0.1343721, 0, 0.09803922, 1, 1,
0.3299514, -1.180836, 3.64089, 0, 0.09411765, 1, 1,
0.3300204, 0.7980137, 0.3927629, 0, 0.08627451, 1, 1,
0.3343935, 0.962427, 0.6802909, 0, 0.08235294, 1, 1,
0.3404055, 0.868656, 1.065115, 0, 0.07450981, 1, 1,
0.3444386, 1.48354, 0.2143013, 0, 0.07058824, 1, 1,
0.3453089, 0.8381192, 0.02632679, 0, 0.0627451, 1, 1,
0.3485771, 1.62076, -0.1325598, 0, 0.05882353, 1, 1,
0.3496078, -0.9844064, 3.265439, 0, 0.05098039, 1, 1,
0.3545036, -0.4205587, 3.061251, 0, 0.04705882, 1, 1,
0.3599061, -0.1019229, 2.657918, 0, 0.03921569, 1, 1,
0.3602645, -1.0212, 5.09403, 0, 0.03529412, 1, 1,
0.3603418, -1.510674, 2.500056, 0, 0.02745098, 1, 1,
0.3618942, 1.636026, 0.1474723, 0, 0.02352941, 1, 1,
0.3629062, 0.6841139, -0.3880033, 0, 0.01568628, 1, 1,
0.3634749, 0.001910004, -1.067845, 0, 0.01176471, 1, 1,
0.3636784, -0.2970654, 4.336906, 0, 0.003921569, 1, 1,
0.3695059, 1.609521, 0.691263, 0.003921569, 0, 1, 1,
0.3698614, 0.5023044, -0.2101779, 0.007843138, 0, 1, 1,
0.3703491, 0.6742781, 0.1457155, 0.01568628, 0, 1, 1,
0.3706619, 0.6491599, 1.618321, 0.01960784, 0, 1, 1,
0.3727152, 0.7207526, 0.5243672, 0.02745098, 0, 1, 1,
0.3734922, -1.461749, 1.546358, 0.03137255, 0, 1, 1,
0.3746064, 0.3761357, 0.3255309, 0.03921569, 0, 1, 1,
0.3748277, -0.7994113, 1.010991, 0.04313726, 0, 1, 1,
0.3749625, 0.9064098, -0.1434487, 0.05098039, 0, 1, 1,
0.3765401, 0.8985628, -0.03216745, 0.05490196, 0, 1, 1,
0.3779634, -0.5222341, 2.834727, 0.0627451, 0, 1, 1,
0.3783275, -1.346006, 2.552402, 0.06666667, 0, 1, 1,
0.3829392, -0.9027254, 2.386198, 0.07450981, 0, 1, 1,
0.3850839, 0.1828952, 1.284271, 0.07843138, 0, 1, 1,
0.3904972, 0.2298909, 1.475339, 0.08627451, 0, 1, 1,
0.3909363, -1.135303, 2.964572, 0.09019608, 0, 1, 1,
0.3914436, -2.218177, 3.004352, 0.09803922, 0, 1, 1,
0.3936661, 1.454417, -1.837922, 0.1058824, 0, 1, 1,
0.3948483, 0.857481, -0.1964625, 0.1098039, 0, 1, 1,
0.4023176, 0.08718638, 0.6087998, 0.1176471, 0, 1, 1,
0.4037554, 0.5943032, -0.3606742, 0.1215686, 0, 1, 1,
0.4046141, -0.5748588, 3.455792, 0.1294118, 0, 1, 1,
0.404722, -0.6700758, 3.190775, 0.1333333, 0, 1, 1,
0.4101529, 1.3951, 0.05953595, 0.1411765, 0, 1, 1,
0.4104216, -0.4968702, 2.338357, 0.145098, 0, 1, 1,
0.4129653, 0.7618796, 1.196211, 0.1529412, 0, 1, 1,
0.4151412, 0.1755804, 1.057366, 0.1568628, 0, 1, 1,
0.4175843, -0.08632688, 1.346799, 0.1647059, 0, 1, 1,
0.4187303, -0.6749008, 1.764163, 0.1686275, 0, 1, 1,
0.4296046, 1.144333, 1.72032, 0.1764706, 0, 1, 1,
0.4313337, 0.39646, 0.9860606, 0.1803922, 0, 1, 1,
0.4339093, -1.235474, 1.777163, 0.1882353, 0, 1, 1,
0.4361602, -0.4931788, 2.440006, 0.1921569, 0, 1, 1,
0.4370136, -0.8003997, 0.8927188, 0.2, 0, 1, 1,
0.4465384, 1.822789, 1.235308, 0.2078431, 0, 1, 1,
0.4510271, -1.923906, 3.080627, 0.2117647, 0, 1, 1,
0.4512388, -1.748369, 3.640518, 0.2196078, 0, 1, 1,
0.4600386, 1.27945, 0.6117851, 0.2235294, 0, 1, 1,
0.4607094, -0.7231753, 1.768249, 0.2313726, 0, 1, 1,
0.4614797, -1.572336, 4.142861, 0.2352941, 0, 1, 1,
0.4675833, 0.3631074, 0.9053143, 0.2431373, 0, 1, 1,
0.4711961, -0.2840471, 1.622689, 0.2470588, 0, 1, 1,
0.4778133, 1.006809, 0.007677895, 0.254902, 0, 1, 1,
0.4790027, -0.7606502, 3.40979, 0.2588235, 0, 1, 1,
0.4800286, 0.7378108, -1.313936, 0.2666667, 0, 1, 1,
0.4804274, 0.1001118, 1.254345, 0.2705882, 0, 1, 1,
0.485285, 0.2163473, 1.042471, 0.2784314, 0, 1, 1,
0.4870688, -1.284536, 3.865736, 0.282353, 0, 1, 1,
0.489536, 0.173816, 0.5657166, 0.2901961, 0, 1, 1,
0.4899048, 1.647916, 0.278828, 0.2941177, 0, 1, 1,
0.4941222, -1.34224, 1.579364, 0.3019608, 0, 1, 1,
0.4951882, 0.8704588, 1.517687, 0.3098039, 0, 1, 1,
0.5024888, 0.808914, -1.068705, 0.3137255, 0, 1, 1,
0.5072601, -1.165229, 2.263754, 0.3215686, 0, 1, 1,
0.5092689, 1.924374, 1.674256, 0.3254902, 0, 1, 1,
0.512872, -0.725903, 3.101585, 0.3333333, 0, 1, 1,
0.5148183, -0.8805893, 3.221777, 0.3372549, 0, 1, 1,
0.516367, -0.7679934, 0.7213078, 0.345098, 0, 1, 1,
0.5172375, 0.08096743, 0.2513235, 0.3490196, 0, 1, 1,
0.5218275, 1.692982, 0.1784771, 0.3568628, 0, 1, 1,
0.5245032, -0.1100256, 1.484211, 0.3607843, 0, 1, 1,
0.5251315, -1.232119, 2.431206, 0.3686275, 0, 1, 1,
0.5275386, -0.2724668, 2.473835, 0.372549, 0, 1, 1,
0.529455, -0.0756586, 1.840459, 0.3803922, 0, 1, 1,
0.5298212, 0.6360447, 0.07839796, 0.3843137, 0, 1, 1,
0.5315249, -0.8731304, 2.807534, 0.3921569, 0, 1, 1,
0.5316306, 0.7019156, -0.03157549, 0.3960784, 0, 1, 1,
0.5338495, -1.355313, 1.804172, 0.4039216, 0, 1, 1,
0.5340036, 0.1597737, 2.280342, 0.4117647, 0, 1, 1,
0.5372825, -0.07773237, 2.147633, 0.4156863, 0, 1, 1,
0.5400177, 0.1965544, -0.3467544, 0.4235294, 0, 1, 1,
0.5442706, -1.104971, 2.560542, 0.427451, 0, 1, 1,
0.5449923, -0.3289645, 2.66534, 0.4352941, 0, 1, 1,
0.5498297, -1.344691, 1.823418, 0.4392157, 0, 1, 1,
0.5507242, -1.026538, 2.573643, 0.4470588, 0, 1, 1,
0.554915, -1.42955, 3.217203, 0.4509804, 0, 1, 1,
0.5589039, 0.08620239, 3.099703, 0.4588235, 0, 1, 1,
0.5599774, -0.5737762, 1.256952, 0.4627451, 0, 1, 1,
0.5619347, -1.275083, 4.092421, 0.4705882, 0, 1, 1,
0.5657595, -0.5990236, 2.812919, 0.4745098, 0, 1, 1,
0.5660551, -0.2164469, -0.2828198, 0.4823529, 0, 1, 1,
0.5750682, 0.1755558, 0.4748966, 0.4862745, 0, 1, 1,
0.5830342, -0.3286421, 2.2364, 0.4941176, 0, 1, 1,
0.5855847, -0.1628108, 2.172195, 0.5019608, 0, 1, 1,
0.5979978, 1.960416, 1.856734, 0.5058824, 0, 1, 1,
0.6002399, 0.2584072, 2.43644, 0.5137255, 0, 1, 1,
0.6011494, 1.429725, -1.093381, 0.5176471, 0, 1, 1,
0.6023087, -1.560685, 2.263974, 0.5254902, 0, 1, 1,
0.6047122, 0.3527062, 1.813469, 0.5294118, 0, 1, 1,
0.6055961, -0.06466714, 2.548363, 0.5372549, 0, 1, 1,
0.6084898, -0.4716055, 2.563413, 0.5411765, 0, 1, 1,
0.610841, 1.12677, 0.3874202, 0.5490196, 0, 1, 1,
0.6135916, 0.1820326, 0.9296328, 0.5529412, 0, 1, 1,
0.6197382, -0.6667327, 3.553898, 0.5607843, 0, 1, 1,
0.6284865, 2.02001, 0.638669, 0.5647059, 0, 1, 1,
0.6284993, -0.3368668, 1.25708, 0.572549, 0, 1, 1,
0.632108, 0.1810428, 3.474486, 0.5764706, 0, 1, 1,
0.6352346, -0.9452518, 2.235556, 0.5843138, 0, 1, 1,
0.6403626, 1.27182, 0.7905296, 0.5882353, 0, 1, 1,
0.6412825, -1.455169, 1.432716, 0.5960785, 0, 1, 1,
0.6442485, 0.3721232, -0.1100074, 0.6039216, 0, 1, 1,
0.6459242, 1.353013, -0.593623, 0.6078432, 0, 1, 1,
0.6470059, 0.6536884, 1.167629, 0.6156863, 0, 1, 1,
0.6518428, 0.3801544, -0.08720008, 0.6196079, 0, 1, 1,
0.6529046, -1.073986, 3.491314, 0.627451, 0, 1, 1,
0.6597741, -1.324378, 3.435808, 0.6313726, 0, 1, 1,
0.6627128, -0.6374434, 3.347929, 0.6392157, 0, 1, 1,
0.6635306, -0.9214845, 2.623299, 0.6431373, 0, 1, 1,
0.6780626, -0.2595874, 1.867223, 0.6509804, 0, 1, 1,
0.6835939, 0.7781892, -0.2446318, 0.654902, 0, 1, 1,
0.6922844, -0.1543181, 3.408295, 0.6627451, 0, 1, 1,
0.6929057, 0.7388864, 0.09671705, 0.6666667, 0, 1, 1,
0.6982174, -2.126664, 4.49329, 0.6745098, 0, 1, 1,
0.6982982, 0.5524196, 0.4713531, 0.6784314, 0, 1, 1,
0.6994595, 1.832444, 1.418603, 0.6862745, 0, 1, 1,
0.7066734, 0.07157135, 0.5034803, 0.6901961, 0, 1, 1,
0.7094237, 2.658163, -0.1774868, 0.6980392, 0, 1, 1,
0.7119539, 1.84765, 0.1827093, 0.7058824, 0, 1, 1,
0.714617, 0.02554667, 1.216771, 0.7098039, 0, 1, 1,
0.7180809, 0.1646794, 1.410724, 0.7176471, 0, 1, 1,
0.7243747, -1.132521, 3.225688, 0.7215686, 0, 1, 1,
0.7255433, 1.036093, -1.520916, 0.7294118, 0, 1, 1,
0.7285964, 1.483509, 1.132813, 0.7333333, 0, 1, 1,
0.7291806, -0.1635398, 2.235115, 0.7411765, 0, 1, 1,
0.7304567, -0.5025616, 1.979355, 0.7450981, 0, 1, 1,
0.7321305, 0.5955334, 1.880654, 0.7529412, 0, 1, 1,
0.7386981, -1.098668, 1.515032, 0.7568628, 0, 1, 1,
0.7415853, 0.9294149, 1.295227, 0.7647059, 0, 1, 1,
0.7452676, -0.7265242, 0.9144621, 0.7686275, 0, 1, 1,
0.7459707, -1.052158, 2.435056, 0.7764706, 0, 1, 1,
0.7532774, 0.6259814, 1.303271, 0.7803922, 0, 1, 1,
0.7560785, 1.373106, 1.084842, 0.7882353, 0, 1, 1,
0.7592477, 0.5356215, 1.023998, 0.7921569, 0, 1, 1,
0.7665964, 1.652177, 1.279423, 0.8, 0, 1, 1,
0.7707061, -0.7482215, 3.513182, 0.8078431, 0, 1, 1,
0.777504, 0.07485624, 1.195161, 0.8117647, 0, 1, 1,
0.7790393, -0.5654568, 2.599424, 0.8196079, 0, 1, 1,
0.7813398, 0.7488075, 1.28231, 0.8235294, 0, 1, 1,
0.7871938, 0.5668228, 0.09625558, 0.8313726, 0, 1, 1,
0.7898411, -0.8228219, 3.740879, 0.8352941, 0, 1, 1,
0.8045287, 1.42154, 0.7804132, 0.8431373, 0, 1, 1,
0.8068385, 0.5927388, 1.193745, 0.8470588, 0, 1, 1,
0.8171852, 1.52723, -0.5399683, 0.854902, 0, 1, 1,
0.8174221, 1.849624, 0.8928162, 0.8588235, 0, 1, 1,
0.8218968, -1.230414, 1.826964, 0.8666667, 0, 1, 1,
0.822275, 0.0135433, 0.6794927, 0.8705882, 0, 1, 1,
0.8235804, 1.210061, 2.276517, 0.8784314, 0, 1, 1,
0.8273964, 0.3108564, 1.304908, 0.8823529, 0, 1, 1,
0.8393388, -0.2404604, 0.9423519, 0.8901961, 0, 1, 1,
0.8463553, 1.537725, -1.02149, 0.8941177, 0, 1, 1,
0.8523331, -0.5942214, 1.895344, 0.9019608, 0, 1, 1,
0.8540754, -0.454389, 2.325195, 0.9098039, 0, 1, 1,
0.857714, -0.6919259, 2.59113, 0.9137255, 0, 1, 1,
0.8620861, 0.0684895, 1.697339, 0.9215686, 0, 1, 1,
0.8670764, 1.557181, 0.6513023, 0.9254902, 0, 1, 1,
0.870186, 0.2891252, 1.43722, 0.9333333, 0, 1, 1,
0.8756346, 0.1205879, 0.9165484, 0.9372549, 0, 1, 1,
0.8915022, 0.8916055, 0.1421676, 0.945098, 0, 1, 1,
0.8976211, 2.737676, 2.006381, 0.9490196, 0, 1, 1,
0.8976603, 1.462781, -0.7270411, 0.9568627, 0, 1, 1,
0.8997706, 0.3242348, 1.403039, 0.9607843, 0, 1, 1,
0.9065669, 0.4942837, 1.660999, 0.9686275, 0, 1, 1,
0.907586, 1.843171, -0.1686115, 0.972549, 0, 1, 1,
0.9077963, 0.1541661, 0.7828724, 0.9803922, 0, 1, 1,
0.9078402, -0.4613988, 1.704308, 0.9843137, 0, 1, 1,
0.9084263, -0.9578384, 3.382328, 0.9921569, 0, 1, 1,
0.9102442, 0.947376, 1.670383, 0.9960784, 0, 1, 1,
0.9109225, 1.333647, -0.04989537, 1, 0, 0.9960784, 1,
0.9153103, 0.5712889, 0.7010307, 1, 0, 0.9882353, 1,
0.9192839, 1.136169, -0.04255353, 1, 0, 0.9843137, 1,
0.9199249, -0.2016053, 2.009354, 1, 0, 0.9764706, 1,
0.9221717, 0.3187027, 2.627782, 1, 0, 0.972549, 1,
0.9228181, -1.066888, 0.4579397, 1, 0, 0.9647059, 1,
0.9236869, -1.002075, 2.394841, 1, 0, 0.9607843, 1,
0.9263467, 2.927922, 0.1455848, 1, 0, 0.9529412, 1,
0.9274539, 0.5878896, 1.433394, 1, 0, 0.9490196, 1,
0.9421147, 0.3445736, 0.8044179, 1, 0, 0.9411765, 1,
0.9469626, -1.190627, 2.245613, 1, 0, 0.9372549, 1,
0.9506798, -0.2064647, 2.652793, 1, 0, 0.9294118, 1,
0.9546179, -1.994728, 2.193724, 1, 0, 0.9254902, 1,
0.9569675, -1.013511, 3.469213, 1, 0, 0.9176471, 1,
0.9656444, -0.1710165, 1.653206, 1, 0, 0.9137255, 1,
0.9668939, 0.3786649, 1.177299, 1, 0, 0.9058824, 1,
0.9691522, -2.085011, 1.015339, 1, 0, 0.9019608, 1,
0.9699221, -1.742994, 3.207453, 1, 0, 0.8941177, 1,
0.9926251, 0.485467, 1.863088, 1, 0, 0.8862745, 1,
0.9936635, 1.009509, 1.365316, 1, 0, 0.8823529, 1,
0.9995295, 0.2986787, 1.347344, 1, 0, 0.8745098, 1,
1.003129, 0.5644743, 1.138286, 1, 0, 0.8705882, 1,
1.00372, 0.1964863, 2.193973, 1, 0, 0.8627451, 1,
1.003914, 0.2142366, 1.193711, 1, 0, 0.8588235, 1,
1.006791, 0.4069165, 2.640432, 1, 0, 0.8509804, 1,
1.009377, 0.2589227, 0.4432417, 1, 0, 0.8470588, 1,
1.01229, -0.5461555, 2.699136, 1, 0, 0.8392157, 1,
1.0162, 0.2441567, -0.2560648, 1, 0, 0.8352941, 1,
1.023019, 0.0124142, 1.027999, 1, 0, 0.827451, 1,
1.028491, 0.4738095, 1.492599, 1, 0, 0.8235294, 1,
1.030349, -0.5861028, 2.980773, 1, 0, 0.8156863, 1,
1.040334, -0.4175311, 2.200016, 1, 0, 0.8117647, 1,
1.045113, -0.6532166, 1.111889, 1, 0, 0.8039216, 1,
1.054123, 2.284018, 1.344757, 1, 0, 0.7960784, 1,
1.056415, 0.5345597, 0.4127136, 1, 0, 0.7921569, 1,
1.057914, -0.2320667, 1.048924, 1, 0, 0.7843137, 1,
1.058224, -0.271536, 2.462909, 1, 0, 0.7803922, 1,
1.062182, -0.3470232, 1.334874, 1, 0, 0.772549, 1,
1.067042, 1.945904, 0.4966002, 1, 0, 0.7686275, 1,
1.073436, 0.6990561, 2.91022, 1, 0, 0.7607843, 1,
1.075197, -0.3514672, 1.558348, 1, 0, 0.7568628, 1,
1.082713, 0.7204951, 2.449278, 1, 0, 0.7490196, 1,
1.092255, 1.707364, -0.9418755, 1, 0, 0.7450981, 1,
1.092936, 0.5487677, 0.8047101, 1, 0, 0.7372549, 1,
1.095325, -1.34439, 2.538157, 1, 0, 0.7333333, 1,
1.095457, 0.305509, 0.9873495, 1, 0, 0.7254902, 1,
1.098027, -1.335224, 1.043584, 1, 0, 0.7215686, 1,
1.102511, -0.9880323, 2.44796, 1, 0, 0.7137255, 1,
1.118531, 2.513999, -0.3751952, 1, 0, 0.7098039, 1,
1.135171, 0.4203034, 2.009972, 1, 0, 0.7019608, 1,
1.145663, 1.271251, 1.667395, 1, 0, 0.6941177, 1,
1.151822, -2.369312, 1.14676, 1, 0, 0.6901961, 1,
1.164739, -0.2082939, 1.724875, 1, 0, 0.682353, 1,
1.168879, -0.0154535, 1.332701, 1, 0, 0.6784314, 1,
1.173351, -1.537247, 1.808652, 1, 0, 0.6705883, 1,
1.174721, -0.1559153, 3.321249, 1, 0, 0.6666667, 1,
1.178824, -0.1568125, 1.877294, 1, 0, 0.6588235, 1,
1.192835, 0.7642378, 0.2285801, 1, 0, 0.654902, 1,
1.193327, -0.03630352, 2.195063, 1, 0, 0.6470588, 1,
1.194726, -0.4510304, 0.6798016, 1, 0, 0.6431373, 1,
1.196376, 0.9094218, 0.9749914, 1, 0, 0.6352941, 1,
1.198455, -0.01244266, 2.422395, 1, 0, 0.6313726, 1,
1.200248, 0.3596628, 1.174245, 1, 0, 0.6235294, 1,
1.202542, -0.3838569, 2.179338, 1, 0, 0.6196079, 1,
1.203368, 0.7585551, 1.75313, 1, 0, 0.6117647, 1,
1.203993, -0.5931821, 2.85288, 1, 0, 0.6078432, 1,
1.203998, -0.4003616, 1.562234, 1, 0, 0.6, 1,
1.208664, -1.644628, 2.557933, 1, 0, 0.5921569, 1,
1.214367, 0.4162358, 0.0686204, 1, 0, 0.5882353, 1,
1.221163, -1.696065, 2.333025, 1, 0, 0.5803922, 1,
1.228667, 0.694636, 0.2386869, 1, 0, 0.5764706, 1,
1.242464, 1.022858, -0.5401148, 1, 0, 0.5686275, 1,
1.251315, -1.004974, 3.382982, 1, 0, 0.5647059, 1,
1.26182, 0.2131967, 1.296038, 1, 0, 0.5568628, 1,
1.2652, -0.598815, 1.430083, 1, 0, 0.5529412, 1,
1.267148, 0.146743, 1.507064, 1, 0, 0.5450981, 1,
1.267731, 1.163425, 1.76719, 1, 0, 0.5411765, 1,
1.271367, -0.6455229, 1.318972, 1, 0, 0.5333334, 1,
1.277434, 0.00536747, 3.430434, 1, 0, 0.5294118, 1,
1.281597, 1.448335, 1.744683, 1, 0, 0.5215687, 1,
1.291004, -0.03310186, 1.474261, 1, 0, 0.5176471, 1,
1.299796, -0.4854305, 0.4126874, 1, 0, 0.509804, 1,
1.300205, 0.7627404, 0.7112681, 1, 0, 0.5058824, 1,
1.307113, 1.246075, 0.8570479, 1, 0, 0.4980392, 1,
1.344139, 0.07844482, 1.431335, 1, 0, 0.4901961, 1,
1.349151, 0.3707095, -0.01196681, 1, 0, 0.4862745, 1,
1.350309, -0.367016, 1.855687, 1, 0, 0.4784314, 1,
1.372278, -0.6221303, 2.585364, 1, 0, 0.4745098, 1,
1.382406, 0.9841178, 0.7235166, 1, 0, 0.4666667, 1,
1.388815, -1.110423, 0.4952456, 1, 0, 0.4627451, 1,
1.407408, -0.1491324, 1.607988, 1, 0, 0.454902, 1,
1.421484, -0.4501713, 1.787872, 1, 0, 0.4509804, 1,
1.423432, 2.09444, 2.852522, 1, 0, 0.4431373, 1,
1.43014, -0.2746157, 1.809525, 1, 0, 0.4392157, 1,
1.44066, -0.02188894, 1.80319, 1, 0, 0.4313726, 1,
1.44663, 0.8116047, 0.5954648, 1, 0, 0.427451, 1,
1.455155, -1.199566, 2.183045, 1, 0, 0.4196078, 1,
1.465184, 0.8102441, 0.5712903, 1, 0, 0.4156863, 1,
1.466516, 0.004648911, 2.223644, 1, 0, 0.4078431, 1,
1.472165, 0.6930526, 1.010344, 1, 0, 0.4039216, 1,
1.4778, 0.01804553, 3.082196, 1, 0, 0.3960784, 1,
1.492722, -0.2077848, 0.7309892, 1, 0, 0.3882353, 1,
1.503891, -0.5380226, 0.6934165, 1, 0, 0.3843137, 1,
1.504103, -0.1579986, 1.291975, 1, 0, 0.3764706, 1,
1.507213, -1.288906, 1.323357, 1, 0, 0.372549, 1,
1.540915, 1.038018, 1.84475, 1, 0, 0.3647059, 1,
1.543287, 1.039453, -0.5785124, 1, 0, 0.3607843, 1,
1.549368, 1.136225, -1.51742, 1, 0, 0.3529412, 1,
1.556626, 0.3947585, 1.16341, 1, 0, 0.3490196, 1,
1.563055, 1.579419, -1.383577, 1, 0, 0.3411765, 1,
1.586175, 0.01724176, 0.02069058, 1, 0, 0.3372549, 1,
1.586535, -0.6129108, 4.095359, 1, 0, 0.3294118, 1,
1.592696, 1.944468, 0.1453131, 1, 0, 0.3254902, 1,
1.604113, 0.9415731, 0.6290579, 1, 0, 0.3176471, 1,
1.605105, 0.7618995, 0.3601298, 1, 0, 0.3137255, 1,
1.613676, 1.488621, -0.468898, 1, 0, 0.3058824, 1,
1.616057, -0.1077704, -0.118832, 1, 0, 0.2980392, 1,
1.628153, -0.4101463, 1.970077, 1, 0, 0.2941177, 1,
1.631784, -1.461862, 1.383154, 1, 0, 0.2862745, 1,
1.642309, 0.4728238, 1.016746, 1, 0, 0.282353, 1,
1.665354, 0.9365173, -0.7561848, 1, 0, 0.2745098, 1,
1.667222, -0.005994308, 0.9145598, 1, 0, 0.2705882, 1,
1.692968, -0.3490679, 2.309267, 1, 0, 0.2627451, 1,
1.736009, -0.7246087, 0.9207347, 1, 0, 0.2588235, 1,
1.787807, -0.2474338, 1.87262, 1, 0, 0.2509804, 1,
1.791697, -1.007171, 3.726774, 1, 0, 0.2470588, 1,
1.797858, 0.7628807, 0.162661, 1, 0, 0.2392157, 1,
1.801504, -0.9373634, 2.584058, 1, 0, 0.2352941, 1,
1.810619, 0.3754762, -0.3417228, 1, 0, 0.227451, 1,
1.810684, 1.797208, 1.847542, 1, 0, 0.2235294, 1,
1.829556, -1.749304, 2.416028, 1, 0, 0.2156863, 1,
1.838457, 1.609066, 1.102282, 1, 0, 0.2117647, 1,
1.877532, 0.02081244, 2.693323, 1, 0, 0.2039216, 1,
1.880834, 0.553229, 2.041052, 1, 0, 0.1960784, 1,
1.885044, -0.142912, 2.909922, 1, 0, 0.1921569, 1,
1.893043, -1.529075, 2.207031, 1, 0, 0.1843137, 1,
1.896541, 0.4101327, 0.4759125, 1, 0, 0.1803922, 1,
1.902911, -0.3190823, 1.815569, 1, 0, 0.172549, 1,
1.947852, -1.886164, 0.0531215, 1, 0, 0.1686275, 1,
1.967409, -0.9452908, 1.356694, 1, 0, 0.1607843, 1,
1.970082, -0.1310289, 3.119827, 1, 0, 0.1568628, 1,
1.978828, 0.1123289, 0.7748041, 1, 0, 0.1490196, 1,
1.982011, 0.7285333, 1.791202, 1, 0, 0.145098, 1,
2.005705, -0.1300851, 2.259938, 1, 0, 0.1372549, 1,
2.02435, 0.7683364, 0.4672672, 1, 0, 0.1333333, 1,
2.036279, 0.3394847, 0.9227946, 1, 0, 0.1254902, 1,
2.055828, 0.008972874, 1.931944, 1, 0, 0.1215686, 1,
2.082244, -1.150853, 3.481397, 1, 0, 0.1137255, 1,
2.11902, 0.4683683, -0.06586624, 1, 0, 0.1098039, 1,
2.122548, -1.317252, 2.589732, 1, 0, 0.1019608, 1,
2.125741, -0.513285, 2.744809, 1, 0, 0.09411765, 1,
2.137386, -1.594529, 2.813614, 1, 0, 0.09019608, 1,
2.194917, -1.238864, 1.2552, 1, 0, 0.08235294, 1,
2.215983, 2.232602, 1.815025, 1, 0, 0.07843138, 1,
2.24118, 0.5370312, 0.9916524, 1, 0, 0.07058824, 1,
2.287986, -0.5878313, 0.7921594, 1, 0, 0.06666667, 1,
2.343347, -0.675374, 1.556053, 1, 0, 0.05882353, 1,
2.42241, -0.8378395, 1.379127, 1, 0, 0.05490196, 1,
2.423941, -0.628446, 1.90692, 1, 0, 0.04705882, 1,
2.431233, -0.4620657, 2.328604, 1, 0, 0.04313726, 1,
2.477467, -0.9831696, 1.191532, 1, 0, 0.03529412, 1,
2.497858, 0.05761096, 0.8621011, 1, 0, 0.03137255, 1,
2.672102, -1.638068, 1.601465, 1, 0, 0.02352941, 1,
2.728947, 0.3853826, 2.969982, 1, 0, 0.01960784, 1,
3.028986, -1.332113, 0.6402327, 1, 0, 0.01176471, 1,
3.13739, -0.7508335, 2.557473, 1, 0, 0.007843138, 1
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
0.01627278, -3.615307, -6.947581, 0, -0.5, 0.5, 0.5,
0.01627278, -3.615307, -6.947581, 1, -0.5, 0.5, 0.5,
0.01627278, -3.615307, -6.947581, 1, 1.5, 0.5, 0.5,
0.01627278, -3.615307, -6.947581, 0, 1.5, 0.5, 0.5
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
-4.162903, 0.1304747, -6.947581, 0, -0.5, 0.5, 0.5,
-4.162903, 0.1304747, -6.947581, 1, -0.5, 0.5, 0.5,
-4.162903, 0.1304747, -6.947581, 1, 1.5, 0.5, 0.5,
-4.162903, 0.1304747, -6.947581, 0, 1.5, 0.5, 0.5
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
-4.162903, -3.615307, 0.4474614, 0, -0.5, 0.5, 0.5,
-4.162903, -3.615307, 0.4474614, 1, -0.5, 0.5, 0.5,
-4.162903, -3.615307, 0.4474614, 1, 1.5, 0.5, 0.5,
-4.162903, -3.615307, 0.4474614, 0, 1.5, 0.5, 0.5
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
-3, -2.750896, -5.241033,
3, -2.750896, -5.241033,
-3, -2.750896, -5.241033,
-3, -2.894964, -5.525458,
-2, -2.750896, -5.241033,
-2, -2.894964, -5.525458,
-1, -2.750896, -5.241033,
-1, -2.894964, -5.525458,
0, -2.750896, -5.241033,
0, -2.894964, -5.525458,
1, -2.750896, -5.241033,
1, -2.894964, -5.525458,
2, -2.750896, -5.241033,
2, -2.894964, -5.525458,
3, -2.750896, -5.241033,
3, -2.894964, -5.525458
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
-3, -3.183101, -6.094307, 0, -0.5, 0.5, 0.5,
-3, -3.183101, -6.094307, 1, -0.5, 0.5, 0.5,
-3, -3.183101, -6.094307, 1, 1.5, 0.5, 0.5,
-3, -3.183101, -6.094307, 0, 1.5, 0.5, 0.5,
-2, -3.183101, -6.094307, 0, -0.5, 0.5, 0.5,
-2, -3.183101, -6.094307, 1, -0.5, 0.5, 0.5,
-2, -3.183101, -6.094307, 1, 1.5, 0.5, 0.5,
-2, -3.183101, -6.094307, 0, 1.5, 0.5, 0.5,
-1, -3.183101, -6.094307, 0, -0.5, 0.5, 0.5,
-1, -3.183101, -6.094307, 1, -0.5, 0.5, 0.5,
-1, -3.183101, -6.094307, 1, 1.5, 0.5, 0.5,
-1, -3.183101, -6.094307, 0, 1.5, 0.5, 0.5,
0, -3.183101, -6.094307, 0, -0.5, 0.5, 0.5,
0, -3.183101, -6.094307, 1, -0.5, 0.5, 0.5,
0, -3.183101, -6.094307, 1, 1.5, 0.5, 0.5,
0, -3.183101, -6.094307, 0, 1.5, 0.5, 0.5,
1, -3.183101, -6.094307, 0, -0.5, 0.5, 0.5,
1, -3.183101, -6.094307, 1, -0.5, 0.5, 0.5,
1, -3.183101, -6.094307, 1, 1.5, 0.5, 0.5,
1, -3.183101, -6.094307, 0, 1.5, 0.5, 0.5,
2, -3.183101, -6.094307, 0, -0.5, 0.5, 0.5,
2, -3.183101, -6.094307, 1, -0.5, 0.5, 0.5,
2, -3.183101, -6.094307, 1, 1.5, 0.5, 0.5,
2, -3.183101, -6.094307, 0, 1.5, 0.5, 0.5,
3, -3.183101, -6.094307, 0, -0.5, 0.5, 0.5,
3, -3.183101, -6.094307, 1, -0.5, 0.5, 0.5,
3, -3.183101, -6.094307, 1, 1.5, 0.5, 0.5,
3, -3.183101, -6.094307, 0, 1.5, 0.5, 0.5
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
-3.198478, -2, -5.241033,
-3.198478, 2, -5.241033,
-3.198478, -2, -5.241033,
-3.359215, -2, -5.525458,
-3.198478, -1, -5.241033,
-3.359215, -1, -5.525458,
-3.198478, 0, -5.241033,
-3.359215, 0, -5.525458,
-3.198478, 1, -5.241033,
-3.359215, 1, -5.525458,
-3.198478, 2, -5.241033,
-3.359215, 2, -5.525458
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
-3.68069, -2, -6.094307, 0, -0.5, 0.5, 0.5,
-3.68069, -2, -6.094307, 1, -0.5, 0.5, 0.5,
-3.68069, -2, -6.094307, 1, 1.5, 0.5, 0.5,
-3.68069, -2, -6.094307, 0, 1.5, 0.5, 0.5,
-3.68069, -1, -6.094307, 0, -0.5, 0.5, 0.5,
-3.68069, -1, -6.094307, 1, -0.5, 0.5, 0.5,
-3.68069, -1, -6.094307, 1, 1.5, 0.5, 0.5,
-3.68069, -1, -6.094307, 0, 1.5, 0.5, 0.5,
-3.68069, 0, -6.094307, 0, -0.5, 0.5, 0.5,
-3.68069, 0, -6.094307, 1, -0.5, 0.5, 0.5,
-3.68069, 0, -6.094307, 1, 1.5, 0.5, 0.5,
-3.68069, 0, -6.094307, 0, 1.5, 0.5, 0.5,
-3.68069, 1, -6.094307, 0, -0.5, 0.5, 0.5,
-3.68069, 1, -6.094307, 1, -0.5, 0.5, 0.5,
-3.68069, 1, -6.094307, 1, 1.5, 0.5, 0.5,
-3.68069, 1, -6.094307, 0, 1.5, 0.5, 0.5,
-3.68069, 2, -6.094307, 0, -0.5, 0.5, 0.5,
-3.68069, 2, -6.094307, 1, -0.5, 0.5, 0.5,
-3.68069, 2, -6.094307, 1, 1.5, 0.5, 0.5,
-3.68069, 2, -6.094307, 0, 1.5, 0.5, 0.5
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
-3.198478, -2.750896, -4,
-3.198478, -2.750896, 4,
-3.198478, -2.750896, -4,
-3.359215, -2.894964, -4,
-3.198478, -2.750896, -2,
-3.359215, -2.894964, -2,
-3.198478, -2.750896, 0,
-3.359215, -2.894964, 0,
-3.198478, -2.750896, 2,
-3.359215, -2.894964, 2,
-3.198478, -2.750896, 4,
-3.359215, -2.894964, 4
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
-3.68069, -3.183101, -4, 0, -0.5, 0.5, 0.5,
-3.68069, -3.183101, -4, 1, -0.5, 0.5, 0.5,
-3.68069, -3.183101, -4, 1, 1.5, 0.5, 0.5,
-3.68069, -3.183101, -4, 0, 1.5, 0.5, 0.5,
-3.68069, -3.183101, -2, 0, -0.5, 0.5, 0.5,
-3.68069, -3.183101, -2, 1, -0.5, 0.5, 0.5,
-3.68069, -3.183101, -2, 1, 1.5, 0.5, 0.5,
-3.68069, -3.183101, -2, 0, 1.5, 0.5, 0.5,
-3.68069, -3.183101, 0, 0, -0.5, 0.5, 0.5,
-3.68069, -3.183101, 0, 1, -0.5, 0.5, 0.5,
-3.68069, -3.183101, 0, 1, 1.5, 0.5, 0.5,
-3.68069, -3.183101, 0, 0, 1.5, 0.5, 0.5,
-3.68069, -3.183101, 2, 0, -0.5, 0.5, 0.5,
-3.68069, -3.183101, 2, 1, -0.5, 0.5, 0.5,
-3.68069, -3.183101, 2, 1, 1.5, 0.5, 0.5,
-3.68069, -3.183101, 2, 0, 1.5, 0.5, 0.5,
-3.68069, -3.183101, 4, 0, -0.5, 0.5, 0.5,
-3.68069, -3.183101, 4, 1, -0.5, 0.5, 0.5,
-3.68069, -3.183101, 4, 1, 1.5, 0.5, 0.5,
-3.68069, -3.183101, 4, 0, 1.5, 0.5, 0.5
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
-3.198478, -2.750896, -5.241033,
-3.198478, 3.011845, -5.241033,
-3.198478, -2.750896, 6.135956,
-3.198478, 3.011845, 6.135956,
-3.198478, -2.750896, -5.241033,
-3.198478, -2.750896, 6.135956,
-3.198478, 3.011845, -5.241033,
-3.198478, 3.011845, 6.135956,
-3.198478, -2.750896, -5.241033,
3.231023, -2.750896, -5.241033,
-3.198478, -2.750896, 6.135956,
3.231023, -2.750896, 6.135956,
-3.198478, 3.011845, -5.241033,
3.231023, 3.011845, -5.241033,
-3.198478, 3.011845, 6.135956,
3.231023, 3.011845, 6.135956,
3.231023, -2.750896, -5.241033,
3.231023, 3.011845, -5.241033,
3.231023, -2.750896, 6.135956,
3.231023, 3.011845, 6.135956,
3.231023, -2.750896, -5.241033,
3.231023, -2.750896, 6.135956,
3.231023, 3.011845, -5.241033,
3.231023, 3.011845, 6.135956
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
var radius = 7.626461;
var distance = 33.93098;
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
mvMatrix.translate( -0.01627278, -0.1304747, -0.4474614 );
mvMatrix.scale( 1.282507, 1.430895, 0.7247857 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.93098);
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
profluralin<-read.table("profluralin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-profluralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'profluralin' not found
```

```r
y<-profluralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'profluralin' not found
```

```r
z<-profluralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'profluralin' not found
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
-3.104844, 0.08927094, -1.53432, 0, 0, 1, 1, 1,
-3.055857, 0.7999316, -2.148979, 1, 0, 0, 1, 1,
-2.945856, 1.056091, -1.231511, 1, 0, 0, 1, 1,
-2.857721, 0.9297007, -0.4403722, 1, 0, 0, 1, 1,
-2.735776, -0.705999, -2.156667, 1, 0, 0, 1, 1,
-2.715417, -0.4498128, -1.636497, 1, 0, 0, 1, 1,
-2.693481, -0.0236599, -1.571101, 0, 0, 0, 1, 1,
-2.680007, 1.182504, -0.5346372, 0, 0, 0, 1, 1,
-2.66294, 1.276093, -1.946163, 0, 0, 0, 1, 1,
-2.590204, 0.07583659, -2.286214, 0, 0, 0, 1, 1,
-2.576681, 0.9410152, -0.6765453, 0, 0, 0, 1, 1,
-2.514856, 0.4322908, -0.6554756, 0, 0, 0, 1, 1,
-2.498704, -0.0581268, -3.13872, 0, 0, 0, 1, 1,
-2.408689, 2.022813, -1.171795, 1, 1, 1, 1, 1,
-2.378265, 0.06143381, -0.1107394, 1, 1, 1, 1, 1,
-2.341433, 0.2808038, -2.638697, 1, 1, 1, 1, 1,
-2.244099, -1.04182, -1.738855, 1, 1, 1, 1, 1,
-2.243222, 0.6003741, -0.8409288, 1, 1, 1, 1, 1,
-2.215669, -0.5125369, -3.13486, 1, 1, 1, 1, 1,
-2.185303, -1.368654, -2.055746, 1, 1, 1, 1, 1,
-2.128415, 1.442139, -2.253996, 1, 1, 1, 1, 1,
-2.112572, 0.979338, -1.703885, 1, 1, 1, 1, 1,
-2.087974, 2.351326, -1.589523, 1, 1, 1, 1, 1,
-2.046211, -0.9248391, -2.118772, 1, 1, 1, 1, 1,
-2.036981, -1.001592, -2.143257, 1, 1, 1, 1, 1,
-2.03454, -0.8207794, -1.731148, 1, 1, 1, 1, 1,
-2.026457, 0.7415035, 0.5105768, 1, 1, 1, 1, 1,
-2.007752, 0.3412857, -1.582373, 1, 1, 1, 1, 1,
-2.00103, -1.138002, -2.926581, 0, 0, 1, 1, 1,
-1.98988, 1.978029, -1.265359, 1, 0, 0, 1, 1,
-1.948647, 1.66607, -1.480993, 1, 0, 0, 1, 1,
-1.938463, -0.3114392, -0.805914, 1, 0, 0, 1, 1,
-1.918842, -0.2142326, -1.393265, 1, 0, 0, 1, 1,
-1.915769, -0.6149325, -2.801088, 1, 0, 0, 1, 1,
-1.912249, 1.070657, -1.316821, 0, 0, 0, 1, 1,
-1.891609, -0.04966392, -2.268569, 0, 0, 0, 1, 1,
-1.879674, -0.3546089, -0.9142868, 0, 0, 0, 1, 1,
-1.861116, -0.2710088, -2.085256, 0, 0, 0, 1, 1,
-1.831885, -0.6855041, 0.05450118, 0, 0, 0, 1, 1,
-1.812477, -0.7734817, -1.795344, 0, 0, 0, 1, 1,
-1.792687, -0.5886983, -2.902877, 0, 0, 0, 1, 1,
-1.755527, 0.7641489, -1.408083, 1, 1, 1, 1, 1,
-1.748882, -2.376869, -1.976921, 1, 1, 1, 1, 1,
-1.741072, 2.333653, -2.744926, 1, 1, 1, 1, 1,
-1.740866, 0.6397405, -0.8512099, 1, 1, 1, 1, 1,
-1.737621, -1.027598, -2.3213, 1, 1, 1, 1, 1,
-1.733265, -0.3541824, -0.4110458, 1, 1, 1, 1, 1,
-1.722065, 1.087794, -1.581657, 1, 1, 1, 1, 1,
-1.713824, 1.902983, -3.146565, 1, 1, 1, 1, 1,
-1.699125, -0.3552426, -3.605383, 1, 1, 1, 1, 1,
-1.682804, 0.8854858, -1.279596, 1, 1, 1, 1, 1,
-1.671363, 1.837101, -2.200367, 1, 1, 1, 1, 1,
-1.665932, 1.957431, 0.9649318, 1, 1, 1, 1, 1,
-1.661705, -0.7535362, -2.629195, 1, 1, 1, 1, 1,
-1.653408, -1.99336, -1.210394, 1, 1, 1, 1, 1,
-1.649493, 0.744864, 1.609713, 1, 1, 1, 1, 1,
-1.631093, 0.3166929, -0.2231769, 0, 0, 1, 1, 1,
-1.625333, 0.9319249, -1.570821, 1, 0, 0, 1, 1,
-1.620847, -0.004229457, -1.754624, 1, 0, 0, 1, 1,
-1.619212, -0.1472884, -1.157668, 1, 0, 0, 1, 1,
-1.617561, 0.6499299, -1.181775, 1, 0, 0, 1, 1,
-1.605905, -0.3503002, 0.2216109, 1, 0, 0, 1, 1,
-1.59934, 1.097916, 0.1739391, 0, 0, 0, 1, 1,
-1.591519, -1.662932, -1.193209, 0, 0, 0, 1, 1,
-1.585702, 0.8256627, -0.2776046, 0, 0, 0, 1, 1,
-1.576512, -0.3971584, -0.9167278, 0, 0, 0, 1, 1,
-1.555173, 0.8632911, -0.5875468, 0, 0, 0, 1, 1,
-1.554705, -0.05336288, -1.250765, 0, 0, 0, 1, 1,
-1.552244, 0.5061591, -1.534603, 0, 0, 0, 1, 1,
-1.549572, -0.06005932, -2.055822, 1, 1, 1, 1, 1,
-1.548227, 1.038526, -1.584754, 1, 1, 1, 1, 1,
-1.541073, 2.133464, -1.527175, 1, 1, 1, 1, 1,
-1.529309, 1.445178, -0.5899307, 1, 1, 1, 1, 1,
-1.527344, 0.6570596, -1.699896, 1, 1, 1, 1, 1,
-1.519868, 0.2806173, -1.361861, 1, 1, 1, 1, 1,
-1.514683, 0.3497664, -1.325912, 1, 1, 1, 1, 1,
-1.512044, 1.163487, -1.282491, 1, 1, 1, 1, 1,
-1.49459, 0.8003312, -0.4297367, 1, 1, 1, 1, 1,
-1.492117, -0.8743851, -2.11466, 1, 1, 1, 1, 1,
-1.474816, -0.2945451, -0.850358, 1, 1, 1, 1, 1,
-1.456432, 2.072604, 0.2906917, 1, 1, 1, 1, 1,
-1.44924, 1.296952, -0.2903049, 1, 1, 1, 1, 1,
-1.433691, 1.132653, 2.252328, 1, 1, 1, 1, 1,
-1.417055, 0.382212, -1.675338, 1, 1, 1, 1, 1,
-1.414127, -0.4338506, 0.3849522, 0, 0, 1, 1, 1,
-1.411911, -0.8823076, -2.727648, 1, 0, 0, 1, 1,
-1.392705, 1.815201, -1.050257, 1, 0, 0, 1, 1,
-1.375429, 0.9588448, -1.058265, 1, 0, 0, 1, 1,
-1.371826, -1.006793, -2.354724, 1, 0, 0, 1, 1,
-1.369099, 1.046174, 0.4041918, 1, 0, 0, 1, 1,
-1.36781, 0.2505619, -1.643332, 0, 0, 0, 1, 1,
-1.367485, -0.3596165, -2.514801, 0, 0, 0, 1, 1,
-1.367002, 0.1618731, -3.165742, 0, 0, 0, 1, 1,
-1.365566, -2.666972, -2.561137, 0, 0, 0, 1, 1,
-1.364399, 0.4677804, -0.9156007, 0, 0, 0, 1, 1,
-1.348066, 0.2194504, 1.131699, 0, 0, 0, 1, 1,
-1.341401, 0.2470697, -0.2145339, 0, 0, 0, 1, 1,
-1.34008, 1.634885, 1.048523, 1, 1, 1, 1, 1,
-1.33042, 1.193276, -0.5270186, 1, 1, 1, 1, 1,
-1.329062, -0.4348279, -0.7622243, 1, 1, 1, 1, 1,
-1.319137, 0.3347259, -0.6425085, 1, 1, 1, 1, 1,
-1.314176, 0.3662916, -1.197508, 1, 1, 1, 1, 1,
-1.313114, -1.16714, -1.73794, 1, 1, 1, 1, 1,
-1.311702, -0.9538407, -1.761, 1, 1, 1, 1, 1,
-1.310295, 0.113037, -2.096012, 1, 1, 1, 1, 1,
-1.277339, 1.018949, -1.255285, 1, 1, 1, 1, 1,
-1.270428, 0.9208075, -1.65879, 1, 1, 1, 1, 1,
-1.261776, -1.860296, -4.062466, 1, 1, 1, 1, 1,
-1.259851, 0.5438685, 0.8492822, 1, 1, 1, 1, 1,
-1.259627, 0.355226, -0.6392285, 1, 1, 1, 1, 1,
-1.258439, -1.640559, -2.867455, 1, 1, 1, 1, 1,
-1.255744, -1.18897, -2.209401, 1, 1, 1, 1, 1,
-1.250599, 0.8427082, -0.4753827, 0, 0, 1, 1, 1,
-1.247723, 0.0001793682, -1.684111, 1, 0, 0, 1, 1,
-1.246735, 0.6878207, -3.790667, 1, 0, 0, 1, 1,
-1.242723, 1.06172, -2.16282, 1, 0, 0, 1, 1,
-1.224173, 1.654313, -2.553677, 1, 0, 0, 1, 1,
-1.22138, -0.5986211, -3.020781, 1, 0, 0, 1, 1,
-1.219841, -0.1706545, -0.848168, 0, 0, 0, 1, 1,
-1.212597, -2.137834, -1.636536, 0, 0, 0, 1, 1,
-1.211156, 0.07215767, 0.08469552, 0, 0, 0, 1, 1,
-1.210149, -0.9939662, -1.54574, 0, 0, 0, 1, 1,
-1.210097, -0.1006843, -2.957042, 0, 0, 0, 1, 1,
-1.208483, 0.757347, -3.025536, 0, 0, 0, 1, 1,
-1.206906, 0.1389661, -0.7743005, 0, 0, 0, 1, 1,
-1.20546, -1.353178, -3.550486, 1, 1, 1, 1, 1,
-1.203105, 0.433146, -1.333494, 1, 1, 1, 1, 1,
-1.200183, 0.1634141, -1.195213, 1, 1, 1, 1, 1,
-1.194413, -0.2879843, -2.38444, 1, 1, 1, 1, 1,
-1.188585, 1.329482, -0.8925089, 1, 1, 1, 1, 1,
-1.187436, 0.632534, -1.619666, 1, 1, 1, 1, 1,
-1.176558, -0.4227505, -1.519764, 1, 1, 1, 1, 1,
-1.176404, 0.6080273, -0.05371241, 1, 1, 1, 1, 1,
-1.175486, -0.3708893, -1.817909, 1, 1, 1, 1, 1,
-1.175329, 0.5373897, -0.7982504, 1, 1, 1, 1, 1,
-1.175137, -2.512236, -2.933703, 1, 1, 1, 1, 1,
-1.164889, -0.2880854, -1.20144, 1, 1, 1, 1, 1,
-1.157616, -2.143783, -2.230857, 1, 1, 1, 1, 1,
-1.138993, -0.7677097, -1.960518, 1, 1, 1, 1, 1,
-1.136997, -1.077209, -2.68113, 1, 1, 1, 1, 1,
-1.134729, -0.05924986, -0.3512451, 0, 0, 1, 1, 1,
-1.133393, -0.124533, -2.911365, 1, 0, 0, 1, 1,
-1.12786, -0.1789891, -1.969228, 1, 0, 0, 1, 1,
-1.117795, 0.599629, -1.503195, 1, 0, 0, 1, 1,
-1.110944, 2.377934, -1.400346, 1, 0, 0, 1, 1,
-1.109482, 0.82047, -1.857842, 1, 0, 0, 1, 1,
-1.109029, -0.4763781, -3.275606, 0, 0, 0, 1, 1,
-1.102899, 0.8957527, -1.580074, 0, 0, 0, 1, 1,
-1.102796, 0.2626485, 0.03851712, 0, 0, 0, 1, 1,
-1.101218, -0.1063617, -2.056433, 0, 0, 0, 1, 1,
-1.100531, 0.2380608, -2.176045, 0, 0, 0, 1, 1,
-1.098543, 0.02113174, -4.031412, 0, 0, 0, 1, 1,
-1.09838, -1.10664, -2.521653, 0, 0, 0, 1, 1,
-1.093775, 0.06266829, -0.7028458, 1, 1, 1, 1, 1,
-1.090163, 1.094317, -0.05510733, 1, 1, 1, 1, 1,
-1.084015, -0.156271, -2.453446, 1, 1, 1, 1, 1,
-1.082852, -0.7029664, -1.191926, 1, 1, 1, 1, 1,
-1.070547, -0.6418507, -0.9229581, 1, 1, 1, 1, 1,
-1.065317, -2.397578, -1.9518, 1, 1, 1, 1, 1,
-1.064115, -0.1832551, -0.4049678, 1, 1, 1, 1, 1,
-1.055577, 1.289029, 0.1578857, 1, 1, 1, 1, 1,
-1.043722, -1.44314, -3.795279, 1, 1, 1, 1, 1,
-1.04245, -0.4389428, -1.74963, 1, 1, 1, 1, 1,
-1.041234, -0.03963497, -0.5257025, 1, 1, 1, 1, 1,
-1.037695, -0.7251299, -3.103913, 1, 1, 1, 1, 1,
-1.031296, -0.3582697, -1.314726, 1, 1, 1, 1, 1,
-1.024413, 0.974969, -2.63925, 1, 1, 1, 1, 1,
-1.022684, -0.2050235, -1.888724, 1, 1, 1, 1, 1,
-1.019695, 1.973096, -1.26088, 0, 0, 1, 1, 1,
-1.015989, 0.3624032, -0.5058711, 1, 0, 0, 1, 1,
-1.007008, -0.3559357, -1.914818, 1, 0, 0, 1, 1,
-0.9985214, 0.1603209, 0.4214122, 1, 0, 0, 1, 1,
-0.9962381, -1.655757, -2.992445, 1, 0, 0, 1, 1,
-0.9931605, 0.6997011, -0.03478268, 1, 0, 0, 1, 1,
-0.9926097, 0.4373909, -0.7931553, 0, 0, 0, 1, 1,
-0.9837664, -0.2102564, -1.447078, 0, 0, 0, 1, 1,
-0.9777238, -1.132532, -2.889306, 0, 0, 0, 1, 1,
-0.9579037, 0.224061, -0.3579939, 0, 0, 0, 1, 1,
-0.9565877, -0.2876248, -1.932925, 0, 0, 0, 1, 1,
-0.9563715, 1.182474, 3.309707, 0, 0, 0, 1, 1,
-0.9511899, -0.4761066, -3.379425, 0, 0, 0, 1, 1,
-0.9363429, -1.011398, -4.020229, 1, 1, 1, 1, 1,
-0.934962, -0.7436683, 0.1793906, 1, 1, 1, 1, 1,
-0.9332187, -1.045765, -2.52097, 1, 1, 1, 1, 1,
-0.9315032, -0.7425053, -2.595277, 1, 1, 1, 1, 1,
-0.9306039, 1.69968, -1.815823, 1, 1, 1, 1, 1,
-0.9274354, -0.6360657, -1.156939, 1, 1, 1, 1, 1,
-0.9153189, 0.1714617, -1.335922, 1, 1, 1, 1, 1,
-0.9132738, -1.975018, -4.280684, 1, 1, 1, 1, 1,
-0.90416, -0.6552249, -3.951343, 1, 1, 1, 1, 1,
-0.9032928, -0.5885704, -2.87446, 1, 1, 1, 1, 1,
-0.9027297, 0.4258033, -0.9692534, 1, 1, 1, 1, 1,
-0.8991472, -2.007802, -2.402642, 1, 1, 1, 1, 1,
-0.8962407, -0.4012828, -2.73337, 1, 1, 1, 1, 1,
-0.8919332, 1.303599, 0.7000638, 1, 1, 1, 1, 1,
-0.8780506, 0.5605332, -2.332186, 1, 1, 1, 1, 1,
-0.8764454, 1.351973, -0.8710771, 0, 0, 1, 1, 1,
-0.8742436, -0.8856432, -3.262768, 1, 0, 0, 1, 1,
-0.8737955, 2.152232, 1.191985, 1, 0, 0, 1, 1,
-0.8633618, 1.111777, -0.3880586, 1, 0, 0, 1, 1,
-0.8630036, -1.431706, -2.842003, 1, 0, 0, 1, 1,
-0.8628106, 1.531046, 0.1266116, 1, 0, 0, 1, 1,
-0.8613858, 0.3704927, -1.803423, 0, 0, 0, 1, 1,
-0.857778, 1.03128, -1.36423, 0, 0, 0, 1, 1,
-0.8547271, 0.06504266, -2.496395, 0, 0, 0, 1, 1,
-0.8509173, 0.1963837, -2.467381, 0, 0, 0, 1, 1,
-0.8464558, 0.6635093, -1.412319, 0, 0, 0, 1, 1,
-0.8452261, -0.9628506, -2.426998, 0, 0, 0, 1, 1,
-0.8432833, -1.990317, -2.283696, 0, 0, 0, 1, 1,
-0.8431768, 0.5790222, -2.060983, 1, 1, 1, 1, 1,
-0.8414751, 2.043948, -1.109635, 1, 1, 1, 1, 1,
-0.837137, -0.79527, -4.376142, 1, 1, 1, 1, 1,
-0.832946, 1.686286, 0.315227, 1, 1, 1, 1, 1,
-0.8300791, -0.6636983, -1.831105, 1, 1, 1, 1, 1,
-0.8237032, 0.7135617, -2.274719, 1, 1, 1, 1, 1,
-0.8197201, 0.7300162, -1.20208, 1, 1, 1, 1, 1,
-0.8154617, 0.5911466, -2.020793, 1, 1, 1, 1, 1,
-0.8129266, 0.7193393, 0.3526287, 1, 1, 1, 1, 1,
-0.8123664, 1.778408, -0.6103178, 1, 1, 1, 1, 1,
-0.811694, 0.7447639, -0.01736281, 1, 1, 1, 1, 1,
-0.8107415, -0.8019613, -1.72984, 1, 1, 1, 1, 1,
-0.8075849, -1.659319, -3.459327, 1, 1, 1, 1, 1,
-0.8000125, 0.9411722, 0.5692056, 1, 1, 1, 1, 1,
-0.7990355, 0.3483581, -0.8105355, 1, 1, 1, 1, 1,
-0.7983794, -0.0008508482, -1.141147, 0, 0, 1, 1, 1,
-0.7965031, 0.6921054, -1.8045, 1, 0, 0, 1, 1,
-0.7848375, 2.603454, 0.1318049, 1, 0, 0, 1, 1,
-0.7836666, 1.02462, 0.5112486, 1, 0, 0, 1, 1,
-0.7828077, 0.5812026, -0.1312748, 1, 0, 0, 1, 1,
-0.7826772, -0.5344271, -2.93291, 1, 0, 0, 1, 1,
-0.771778, 0.429446, 0.5383732, 0, 0, 0, 1, 1,
-0.7695807, -1.185348, -1.566929, 0, 0, 0, 1, 1,
-0.7693261, -0.9291345, -1.632331, 0, 0, 0, 1, 1,
-0.7627546, 0.3402344, -1.689369, 0, 0, 0, 1, 1,
-0.7627413, 0.1534024, -2.244374, 0, 0, 0, 1, 1,
-0.7593829, -0.07464552, -3.188716, 0, 0, 0, 1, 1,
-0.7557713, 0.1437039, -1.870177, 0, 0, 0, 1, 1,
-0.7536896, -0.6889515, 0.1443111, 1, 1, 1, 1, 1,
-0.7523327, 0.4603394, -0.1975854, 1, 1, 1, 1, 1,
-0.7510983, -0.3147577, -1.671434, 1, 1, 1, 1, 1,
-0.7493115, 0.6097067, -0.3892451, 1, 1, 1, 1, 1,
-0.745096, -0.1720724, -1.82992, 1, 1, 1, 1, 1,
-0.7406868, 0.1810069, 0.5159075, 1, 1, 1, 1, 1,
-0.7326752, 0.2427523, -1.137947, 1, 1, 1, 1, 1,
-0.7315275, -1.403776, -3.953884, 1, 1, 1, 1, 1,
-0.7299433, 1.185071, -1.110906, 1, 1, 1, 1, 1,
-0.7201307, 0.9522617, -1.621522, 1, 1, 1, 1, 1,
-0.7117406, 1.416324, 0.221839, 1, 1, 1, 1, 1,
-0.6931442, -0.3491539, -2.148849, 1, 1, 1, 1, 1,
-0.6916968, 1.48226, -1.246965, 1, 1, 1, 1, 1,
-0.6882332, -1.50483, -4.219122, 1, 1, 1, 1, 1,
-0.6880698, -0.152647, -1.677999, 1, 1, 1, 1, 1,
-0.6858301, -0.05154983, -2.065127, 0, 0, 1, 1, 1,
-0.6789881, 0.905994, 1.639787, 1, 0, 0, 1, 1,
-0.676273, -0.1840254, -3.247814, 1, 0, 0, 1, 1,
-0.675256, -0.8415051, -3.375061, 1, 0, 0, 1, 1,
-0.6739168, 1.135294, -2.088057, 1, 0, 0, 1, 1,
-0.6718169, -0.5222077, -1.261731, 1, 0, 0, 1, 1,
-0.6691607, -1.332719, -2.06587, 0, 0, 0, 1, 1,
-0.6637603, -1.467916, 0.2382501, 0, 0, 0, 1, 1,
-0.6630238, -0.7315292, -1.743737, 0, 0, 0, 1, 1,
-0.661319, 1.030776, -0.2103813, 0, 0, 0, 1, 1,
-0.6561468, -1.239067, -3.208261, 0, 0, 0, 1, 1,
-0.6530757, 0.3205246, -1.273388, 0, 0, 0, 1, 1,
-0.6524395, 0.7417777, -0.9115164, 0, 0, 0, 1, 1,
-0.651373, 1.004678, -0.5591672, 1, 1, 1, 1, 1,
-0.6509421, 1.067854, -1.683973, 1, 1, 1, 1, 1,
-0.6486511, -0.865546, -2.061042, 1, 1, 1, 1, 1,
-0.6471927, -0.2282609, -2.733598, 1, 1, 1, 1, 1,
-0.6469334, -0.4927736, -1.448594, 1, 1, 1, 1, 1,
-0.6320099, 0.08502747, -2.776122, 1, 1, 1, 1, 1,
-0.6313097, 0.479833, -1.873461, 1, 1, 1, 1, 1,
-0.6241192, -0.0221844, -3.034589, 1, 1, 1, 1, 1,
-0.6234628, -0.7477799, -2.255583, 1, 1, 1, 1, 1,
-0.6169568, -0.7284766, -3.308089, 1, 1, 1, 1, 1,
-0.6117142, -0.1620523, -1.969747, 1, 1, 1, 1, 1,
-0.5990769, 0.2624876, -1.671069, 1, 1, 1, 1, 1,
-0.5973234, 1.807069, -0.3992412, 1, 1, 1, 1, 1,
-0.5957853, 0.423257, -0.5388497, 1, 1, 1, 1, 1,
-0.5951308, -0.9048083, -2.593854, 1, 1, 1, 1, 1,
-0.5946336, -0.7311935, -1.721427, 0, 0, 1, 1, 1,
-0.5945401, 1.007438, -1.150356, 1, 0, 0, 1, 1,
-0.5921122, -1.96181, -3.387006, 1, 0, 0, 1, 1,
-0.591709, 1.071629, 0.6189592, 1, 0, 0, 1, 1,
-0.5914466, -1.216902, -1.677739, 1, 0, 0, 1, 1,
-0.5910267, 0.8477612, -4.199039, 1, 0, 0, 1, 1,
-0.5897371, -0.2318457, -1.75928, 0, 0, 0, 1, 1,
-0.5879572, 0.9578941, -1.005731, 0, 0, 0, 1, 1,
-0.587332, -0.3994693, -2.676986, 0, 0, 0, 1, 1,
-0.5855448, 2.2156, -0.1836948, 0, 0, 0, 1, 1,
-0.5840255, 1.15688, -2.251054, 0, 0, 0, 1, 1,
-0.5827651, -0.2407499, -2.028478, 0, 0, 0, 1, 1,
-0.5820659, -0.6309929, -2.198105, 0, 0, 0, 1, 1,
-0.5796793, 0.990014, 1.953587, 1, 1, 1, 1, 1,
-0.5758417, -0.871437, -3.462285, 1, 1, 1, 1, 1,
-0.5751315, 1.025848, 1.098261, 1, 1, 1, 1, 1,
-0.5740196, 0.9097901, -0.7670081, 1, 1, 1, 1, 1,
-0.5726269, -0.0521937, -0.9167871, 1, 1, 1, 1, 1,
-0.5725395, 0.2108758, -1.332265, 1, 1, 1, 1, 1,
-0.5668522, 0.803294, -0.8257357, 1, 1, 1, 1, 1,
-0.5635861, 0.320931, -2.431622, 1, 1, 1, 1, 1,
-0.5631101, -0.4811453, -3.15966, 1, 1, 1, 1, 1,
-0.5540736, -0.4562479, -4.434601, 1, 1, 1, 1, 1,
-0.5522009, 0.8618897, -1.510678, 1, 1, 1, 1, 1,
-0.5516032, -0.01071358, 0.4243248, 1, 1, 1, 1, 1,
-0.5510302, -0.8891336, -2.679121, 1, 1, 1, 1, 1,
-0.5475922, 1.349376, -1.281448, 1, 1, 1, 1, 1,
-0.5384304, -0.736201, -2.474329, 1, 1, 1, 1, 1,
-0.5310365, 0.4810261, -1.545341, 0, 0, 1, 1, 1,
-0.5300977, -0.02588702, -2.998746, 1, 0, 0, 1, 1,
-0.5272956, 0.8562197, 0.08824007, 1, 0, 0, 1, 1,
-0.5220051, 1.340755, 0.1756729, 1, 0, 0, 1, 1,
-0.5215404, -0.6787902, -1.423158, 1, 0, 0, 1, 1,
-0.5203056, 0.8199899, 0.7673429, 1, 0, 0, 1, 1,
-0.5046567, 1.208892, 0.00307382, 0, 0, 0, 1, 1,
-0.5024257, 1.536627, -3.070214, 0, 0, 0, 1, 1,
-0.5002102, -1.56586, -2.706299, 0, 0, 0, 1, 1,
-0.4969505, -0.9497414, -2.024721, 0, 0, 0, 1, 1,
-0.4964465, -1.360581, -0.7133012, 0, 0, 0, 1, 1,
-0.4954167, 0.05535443, -1.714263, 0, 0, 0, 1, 1,
-0.4901946, -1.192814, -3.352588, 0, 0, 0, 1, 1,
-0.4901922, 0.4060798, -1.437557, 1, 1, 1, 1, 1,
-0.4867471, -0.183426, -0.0927588, 1, 1, 1, 1, 1,
-0.485626, 1.156652, -0.2049999, 1, 1, 1, 1, 1,
-0.48457, 0.2488388, -1.347971, 1, 1, 1, 1, 1,
-0.4799488, 1.718184, -1.504059, 1, 1, 1, 1, 1,
-0.4763331, -1.569567, -1.591346, 1, 1, 1, 1, 1,
-0.4751172, -0.6977541, -1.771078, 1, 1, 1, 1, 1,
-0.468199, -0.7000811, -4.374166, 1, 1, 1, 1, 1,
-0.4667874, 0.5927976, -1.167452, 1, 1, 1, 1, 1,
-0.4636781, 1.585717, -0.5532016, 1, 1, 1, 1, 1,
-0.458829, 2.032079, -1.892195, 1, 1, 1, 1, 1,
-0.4519328, 0.1318901, -1.251344, 1, 1, 1, 1, 1,
-0.4506046, -0.07402191, 0.3198459, 1, 1, 1, 1, 1,
-0.449615, -0.09433477, -0.9110377, 1, 1, 1, 1, 1,
-0.4489661, -0.7690469, -1.568138, 1, 1, 1, 1, 1,
-0.4436561, 0.1892805, -0.831264, 0, 0, 1, 1, 1,
-0.4434525, 0.7023088, -0.274491, 1, 0, 0, 1, 1,
-0.4405816, -0.1311146, -2.633032, 1, 0, 0, 1, 1,
-0.4400046, -0.3603949, -2.197959, 1, 0, 0, 1, 1,
-0.4354041, 2.153209, -0.8148043, 1, 0, 0, 1, 1,
-0.4235436, 0.1331437, -0.6543905, 1, 0, 0, 1, 1,
-0.4197498, -1.352195, -4.678292, 0, 0, 0, 1, 1,
-0.4115116, -1.728886, -2.52738, 0, 0, 0, 1, 1,
-0.4081219, -0.2178008, -1.63825, 0, 0, 0, 1, 1,
-0.4005277, -0.5581169, -4.894946, 0, 0, 0, 1, 1,
-0.3974605, -0.8941623, -3.308987, 0, 0, 0, 1, 1,
-0.3947331, 0.483997, -0.8715341, 0, 0, 0, 1, 1,
-0.3894246, 0.8956656, -0.3020797, 0, 0, 0, 1, 1,
-0.3882853, -0.4524421, -1.124828, 1, 1, 1, 1, 1,
-0.3874678, 0.9159123, 1.314452, 1, 1, 1, 1, 1,
-0.3872949, 0.06454976, -1.256944, 1, 1, 1, 1, 1,
-0.3872364, 0.6082879, -0.3022572, 1, 1, 1, 1, 1,
-0.3869446, -0.5044289, -2.101816, 1, 1, 1, 1, 1,
-0.3688175, -2.371894, -2.542722, 1, 1, 1, 1, 1,
-0.3686388, 0.08800711, -2.155863, 1, 1, 1, 1, 1,
-0.3681528, 0.9986521, 0.01587808, 1, 1, 1, 1, 1,
-0.3674551, 0.2415949, -2.419522, 1, 1, 1, 1, 1,
-0.3483346, -0.1746297, -3.205489, 1, 1, 1, 1, 1,
-0.3479715, 1.246984, 0.6723998, 1, 1, 1, 1, 1,
-0.3459108, 0.1137197, -0.8077066, 1, 1, 1, 1, 1,
-0.3449121, -1.484974, -3.180073, 1, 1, 1, 1, 1,
-0.3408897, 0.6565418, 0.964266, 1, 1, 1, 1, 1,
-0.3388045, 2.622173, 0.4186791, 1, 1, 1, 1, 1,
-0.3371245, 1.131117, -0.2051372, 0, 0, 1, 1, 1,
-0.3341364, 1.277261, 1.306777, 1, 0, 0, 1, 1,
-0.3321961, 0.726941, 0.6318055, 1, 0, 0, 1, 1,
-0.3316477, 1.692717, -0.2468637, 1, 0, 0, 1, 1,
-0.3315793, -0.8797086, -2.278198, 1, 0, 0, 1, 1,
-0.3308208, 1.756258, -0.3943732, 1, 0, 0, 1, 1,
-0.3263099, 0.01005272, -0.7720326, 0, 0, 0, 1, 1,
-0.3241204, 0.4407568, 0.9712007, 0, 0, 0, 1, 1,
-0.3189143, 0.7046373, 0.9300064, 0, 0, 0, 1, 1,
-0.3187869, 1.1846, -0.2142523, 0, 0, 0, 1, 1,
-0.3146326, -0.4131531, -0.7288724, 0, 0, 0, 1, 1,
-0.3128547, 1.236056, -0.1989155, 0, 0, 0, 1, 1,
-0.3061953, -0.7696825, -3.228798, 0, 0, 0, 1, 1,
-0.3059178, 0.02855559, -2.262056, 1, 1, 1, 1, 1,
-0.3049221, 1.044141, 0.8293988, 1, 1, 1, 1, 1,
-0.3036417, -1.516474, -3.405339, 1, 1, 1, 1, 1,
-0.303229, -0.4144287, -1.699485, 1, 1, 1, 1, 1,
-0.2974673, 0.07327443, -1.486728, 1, 1, 1, 1, 1,
-0.2941685, -0.4665518, -2.430517, 1, 1, 1, 1, 1,
-0.291099, -0.8913895, -1.555921, 1, 1, 1, 1, 1,
-0.2910373, 2.403927, -1.247196, 1, 1, 1, 1, 1,
-0.2904816, -2.24697, -2.424334, 1, 1, 1, 1, 1,
-0.2830867, 1.589311, -0.8176265, 1, 1, 1, 1, 1,
-0.2800944, -0.2716932, -2.070276, 1, 1, 1, 1, 1,
-0.2769479, -0.611733, -2.945203, 1, 1, 1, 1, 1,
-0.2757276, 0.6940259, -0.6363301, 1, 1, 1, 1, 1,
-0.2744325, 0.9501404, -2.277858, 1, 1, 1, 1, 1,
-0.2738597, -0.2233056, -1.533282, 1, 1, 1, 1, 1,
-0.2655101, 0.08997598, 0.1646117, 0, 0, 1, 1, 1,
-0.2593479, -0.02951569, -1.779783, 1, 0, 0, 1, 1,
-0.2574469, 1.681396, -0.3998212, 1, 0, 0, 1, 1,
-0.2558544, 0.7172542, 0.01875713, 1, 0, 0, 1, 1,
-0.2525979, 0.9616927, 0.9541035, 1, 0, 0, 1, 1,
-0.2523495, -0.6648155, -2.972907, 1, 0, 0, 1, 1,
-0.251813, 0.03564116, -1.807563, 0, 0, 0, 1, 1,
-0.2515109, -1.173061, -3.462244, 0, 0, 0, 1, 1,
-0.2506279, 0.6545647, -1.652219, 0, 0, 0, 1, 1,
-0.2463706, -0.08782885, -1.837785, 0, 0, 0, 1, 1,
-0.2448982, -0.3311656, -4.692973, 0, 0, 0, 1, 1,
-0.2420942, -0.2396845, -1.169499, 0, 0, 0, 1, 1,
-0.2417341, 0.7073022, -1.127147, 0, 0, 0, 1, 1,
-0.240074, 0.3888085, -2.773369, 1, 1, 1, 1, 1,
-0.2391616, 1.342647, 0.658261, 1, 1, 1, 1, 1,
-0.2384395, -1.462113, -2.849832, 1, 1, 1, 1, 1,
-0.2372392, 0.228789, -1.758727, 1, 1, 1, 1, 1,
-0.2371962, -0.6088333, -2.323634, 1, 1, 1, 1, 1,
-0.234703, -0.8141132, -4.073974, 1, 1, 1, 1, 1,
-0.2341812, -0.4254884, -4.625516, 1, 1, 1, 1, 1,
-0.2318696, 0.2208839, -0.5376002, 1, 1, 1, 1, 1,
-0.2285018, 0.6995113, 0.7638989, 1, 1, 1, 1, 1,
-0.2268296, -1.423344, -3.094504, 1, 1, 1, 1, 1,
-0.2215976, -2.098282, -2.283165, 1, 1, 1, 1, 1,
-0.2209905, -0.3844528, -2.892012, 1, 1, 1, 1, 1,
-0.2202245, 0.6100804, -0.3071625, 1, 1, 1, 1, 1,
-0.2200236, 1.803353, -1.035004, 1, 1, 1, 1, 1,
-0.2180393, -0.02962955, -1.225638, 1, 1, 1, 1, 1,
-0.2169202, 1.952474, 1.26808, 0, 0, 1, 1, 1,
-0.2100761, 0.1408874, -1.212806, 1, 0, 0, 1, 1,
-0.2071416, 0.2723474, 0.4081465, 1, 0, 0, 1, 1,
-0.2023882, 1.234887, 0.002771262, 1, 0, 0, 1, 1,
-0.2008767, 0.2494835, -1.901717, 1, 0, 0, 1, 1,
-0.1934716, -0.7675289, -1.778796, 1, 0, 0, 1, 1,
-0.192823, 1.645319, 0.3237863, 0, 0, 0, 1, 1,
-0.1928224, -1.771356, -3.869971, 0, 0, 0, 1, 1,
-0.1922056, -0.4724853, -2.748606, 0, 0, 0, 1, 1,
-0.1887184, 0.5808322, -1.480278, 0, 0, 0, 1, 1,
-0.1817681, -0.5831671, -2.861644, 0, 0, 0, 1, 1,
-0.176603, -1.34838, -2.522926, 0, 0, 0, 1, 1,
-0.1746166, -0.4140608, -2.231265, 0, 0, 0, 1, 1,
-0.1701278, -1.206991, -5.075349, 1, 1, 1, 1, 1,
-0.1694494, 0.7476558, -0.8616424, 1, 1, 1, 1, 1,
-0.167063, -0.9391111, -0.4861081, 1, 1, 1, 1, 1,
-0.1668961, -1.179276, -3.665058, 1, 1, 1, 1, 1,
-0.1649081, 1.172728, 1.487175, 1, 1, 1, 1, 1,
-0.1589548, -1.178336, -3.638982, 1, 1, 1, 1, 1,
-0.1585095, -0.8966687, -2.018976, 1, 1, 1, 1, 1,
-0.1573283, -0.5295662, -3.794655, 1, 1, 1, 1, 1,
-0.1572518, -0.8795384, -3.58864, 1, 1, 1, 1, 1,
-0.1560649, -1.113171, -2.712897, 1, 1, 1, 1, 1,
-0.1551857, 0.01662444, -2.135412, 1, 1, 1, 1, 1,
-0.1525165, 1.774181, -0.4778867, 1, 1, 1, 1, 1,
-0.1479062, 0.6303177, -1.858508, 1, 1, 1, 1, 1,
-0.1454796, 1.543451, -0.2026534, 1, 1, 1, 1, 1,
-0.1451585, 1.141801, -0.8123599, 1, 1, 1, 1, 1,
-0.1444404, -0.545036, -1.729112, 0, 0, 1, 1, 1,
-0.1436142, 0.2905415, -0.1438996, 1, 0, 0, 1, 1,
-0.1428931, 0.1687887, -1.94407, 1, 0, 0, 1, 1,
-0.1404289, 1.924918, -0.2801785, 1, 0, 0, 1, 1,
-0.140007, 1.641401, -1.266202, 1, 0, 0, 1, 1,
-0.1375265, 1.613295, 0.3109372, 1, 0, 0, 1, 1,
-0.1368798, -0.6973884, -1.81781, 0, 0, 0, 1, 1,
-0.1367976, 1.711768, 0.6990027, 0, 0, 0, 1, 1,
-0.1339407, 2.359567, -0.6013001, 0, 0, 0, 1, 1,
-0.1321517, 1.042858, -2.339395, 0, 0, 0, 1, 1,
-0.1287962, -1.016591, -1.179899, 0, 0, 0, 1, 1,
-0.1268606, -0.6074822, -2.684664, 0, 0, 0, 1, 1,
-0.1254226, -0.09824072, -3.776957, 0, 0, 0, 1, 1,
-0.1251192, -0.5196801, -2.60063, 1, 1, 1, 1, 1,
-0.1236466, -0.7953174, -2.31503, 1, 1, 1, 1, 1,
-0.1234357, 0.4124945, -0.4042138, 1, 1, 1, 1, 1,
-0.118054, 0.308064, 0.2498857, 1, 1, 1, 1, 1,
-0.1140132, 0.7815122, -0.5856161, 1, 1, 1, 1, 1,
-0.1113124, -1.442735, -2.873886, 1, 1, 1, 1, 1,
-0.1108751, 0.9744307, -0.7883844, 1, 1, 1, 1, 1,
-0.1073393, 0.890637, -0.9875049, 1, 1, 1, 1, 1,
-0.1061476, -1.034704, -3.432188, 1, 1, 1, 1, 1,
-0.1006034, -1.863015, -2.080714, 1, 1, 1, 1, 1,
-0.09852425, 0.7712382, -0.3325217, 1, 1, 1, 1, 1,
-0.09536809, -0.2182899, -1.506819, 1, 1, 1, 1, 1,
-0.09339921, 0.7871143, -1.184556, 1, 1, 1, 1, 1,
-0.09314504, 1.438827, 0.1229455, 1, 1, 1, 1, 1,
-0.09245906, 0.08081483, -0.06922808, 1, 1, 1, 1, 1,
-0.08941852, -1.67758, -1.736103, 0, 0, 1, 1, 1,
-0.08668642, -0.2216044, -4.881179, 1, 0, 0, 1, 1,
-0.08454421, -0.5947135, -3.374899, 1, 0, 0, 1, 1,
-0.08164527, 0.1551589, -1.364119, 1, 0, 0, 1, 1,
-0.08038221, 0.3725149, -0.3518399, 1, 0, 0, 1, 1,
-0.07519772, 1.694837, 0.7163206, 1, 0, 0, 1, 1,
-0.06854693, 0.9314946, -0.5402312, 0, 0, 0, 1, 1,
-0.06835546, 1.060171, -1.208539, 0, 0, 0, 1, 1,
-0.05825276, -1.396297, -3.488809, 0, 0, 0, 1, 1,
-0.05403216, -2.049562, -1.955709, 0, 0, 0, 1, 1,
-0.05391839, -0.7168906, -2.207302, 0, 0, 0, 1, 1,
-0.05279136, -0.4735462, -2.868004, 0, 0, 0, 1, 1,
-0.05089596, -0.1542255, -1.440525, 0, 0, 0, 1, 1,
-0.0506191, -0.1660392, -3.147455, 1, 1, 1, 1, 1,
-0.04737141, -0.2570477, -2.190036, 1, 1, 1, 1, 1,
-0.04542398, 0.1988099, 1.426525, 1, 1, 1, 1, 1,
-0.04487567, 1.325325, -1.505041, 1, 1, 1, 1, 1,
-0.04420203, 0.4210053, -0.3109204, 1, 1, 1, 1, 1,
-0.04043191, 0.1297887, -1.59621, 1, 1, 1, 1, 1,
-0.03937256, 0.5827147, -0.09221827, 1, 1, 1, 1, 1,
-0.03549997, -0.3229502, -3.790659, 1, 1, 1, 1, 1,
-0.02662074, -1.525651, -1.868244, 1, 1, 1, 1, 1,
-0.02603465, 1.206319, 0.3349827, 1, 1, 1, 1, 1,
-0.02585601, 1.23142, 0.5180784, 1, 1, 1, 1, 1,
-0.02383617, -1.024078, -4.072078, 1, 1, 1, 1, 1,
-0.02132734, 0.5742146, -0.3420881, 1, 1, 1, 1, 1,
-0.01954553, -0.1134787, -4.160864, 1, 1, 1, 1, 1,
-0.01795573, -1.061113, -3.218018, 1, 1, 1, 1, 1,
-0.01695929, 0.7594309, 0.3461388, 0, 0, 1, 1, 1,
-0.01502083, -0.3265681, -2.694093, 1, 0, 0, 1, 1,
-0.01455786, -0.8032241, -4.219831, 1, 0, 0, 1, 1,
-0.01455477, 1.573915, -1.298417, 1, 0, 0, 1, 1,
-0.01421297, 0.0350306, -0.08032601, 1, 0, 0, 1, 1,
-0.009396388, 0.3279568, 0.4054841, 1, 0, 0, 1, 1,
-0.007693977, 0.6864364, 0.2747661, 0, 0, 0, 1, 1,
-0.007369483, 0.6444867, 0.5438203, 0, 0, 0, 1, 1,
-0.006512188, -0.9712115, -2.724147, 0, 0, 0, 1, 1,
-0.002423703, -0.6333482, -3.673541, 0, 0, 0, 1, 1,
0.00345468, 1.978272, 0.6734181, 0, 0, 0, 1, 1,
0.00934567, 0.07589546, 0.08045787, 0, 0, 0, 1, 1,
0.01222558, 1.198863, -0.9727418, 0, 0, 0, 1, 1,
0.01369334, -0.1704532, 3.121371, 1, 1, 1, 1, 1,
0.01775823, 0.154569, 0.06480533, 1, 1, 1, 1, 1,
0.01900982, -0.04417028, 3.93894, 1, 1, 1, 1, 1,
0.02071368, 0.6556802, -1.324135, 1, 1, 1, 1, 1,
0.02086101, -1.134895, 3.156889, 1, 1, 1, 1, 1,
0.02418817, 0.8796249, 0.280299, 1, 1, 1, 1, 1,
0.02576259, -1.184801, 3.968172, 1, 1, 1, 1, 1,
0.02813087, 1.74351, -3.155272, 1, 1, 1, 1, 1,
0.02861434, 0.391495, -0.4098316, 1, 1, 1, 1, 1,
0.03168952, -1.492932, 1.821801, 1, 1, 1, 1, 1,
0.03375975, -0.5543031, 3.77089, 1, 1, 1, 1, 1,
0.03829396, 0.3309175, -0.2720548, 1, 1, 1, 1, 1,
0.03886048, -0.7174811, 3.666729, 1, 1, 1, 1, 1,
0.03994866, -0.2669905, 3.701646, 1, 1, 1, 1, 1,
0.04190301, 0.7425026, 1.824406, 1, 1, 1, 1, 1,
0.04713694, 1.745782, -0.5800853, 0, 0, 1, 1, 1,
0.04764658, -1.151371, 3.523165, 1, 0, 0, 1, 1,
0.0488737, -0.995697, 2.826844, 1, 0, 0, 1, 1,
0.04963646, 1.258841, 1.129148, 1, 0, 0, 1, 1,
0.05773486, 0.2503859, -0.9066986, 1, 0, 0, 1, 1,
0.06214335, 0.6803709, 0.4241212, 1, 0, 0, 1, 1,
0.06463964, 0.06389017, 3.57365, 0, 0, 0, 1, 1,
0.06595219, -0.009424499, 0.9121839, 0, 0, 0, 1, 1,
0.0661839, -1.452858, 1.593937, 0, 0, 0, 1, 1,
0.0664068, 0.6855509, 1.843132, 0, 0, 0, 1, 1,
0.07400263, -1.037025, 5.008271, 0, 0, 0, 1, 1,
0.07645036, 0.138249, 1.617493, 0, 0, 0, 1, 1,
0.08344261, -0.6850178, 1.782422, 0, 0, 0, 1, 1,
0.08398438, 2.177113, -0.6602574, 1, 1, 1, 1, 1,
0.08549225, -0.8831586, 3.823962, 1, 1, 1, 1, 1,
0.0865601, 0.1392694, -1.149081, 1, 1, 1, 1, 1,
0.08724944, 1.268931, -0.3918668, 1, 1, 1, 1, 1,
0.08923873, -0.4536933, 3.165449, 1, 1, 1, 1, 1,
0.09248781, 0.2379309, -0.5950849, 1, 1, 1, 1, 1,
0.09281206, 1.497736, 0.08198369, 1, 1, 1, 1, 1,
0.1025304, -0.3899982, 1.842676, 1, 1, 1, 1, 1,
0.1150041, 0.5799441, -0.4971544, 1, 1, 1, 1, 1,
0.118103, 1.452186, -0.7347488, 1, 1, 1, 1, 1,
0.1209168, 0.8451083, 1.002947, 1, 1, 1, 1, 1,
0.1226336, 0.0048433, 2.951784, 1, 1, 1, 1, 1,
0.123055, 1.650296, -0.5740863, 1, 1, 1, 1, 1,
0.1235495, 1.159383, 0.5050306, 1, 1, 1, 1, 1,
0.1241102, 0.8743037, -0.08886825, 1, 1, 1, 1, 1,
0.1254796, -1.701603, 4.055959, 0, 0, 1, 1, 1,
0.1279372, 0.2873276, 1.194406, 1, 0, 0, 1, 1,
0.1340198, 0.002938164, 1.316469, 1, 0, 0, 1, 1,
0.1356257, 1.109027, -1.027325, 1, 0, 0, 1, 1,
0.1358743, -0.3932675, 4.168493, 1, 0, 0, 1, 1,
0.1394778, -0.5763453, 2.267798, 1, 0, 0, 1, 1,
0.1442029, 0.1786995, 1.79485, 0, 0, 0, 1, 1,
0.1470168, 0.5160263, -0.6375789, 0, 0, 0, 1, 1,
0.150117, 0.6948608, 1.938172, 0, 0, 0, 1, 1,
0.1504752, 0.9751266, 0.6028752, 0, 0, 0, 1, 1,
0.1525849, 0.3686676, -1.893059, 0, 0, 0, 1, 1,
0.154565, -2.602504, 2.519386, 0, 0, 0, 1, 1,
0.1556844, 1.153752, -0.2169131, 0, 0, 0, 1, 1,
0.1561887, 1.169815, 0.389085, 1, 1, 1, 1, 1,
0.1602763, -1.555778, 1.483343, 1, 1, 1, 1, 1,
0.1614746, 1.748306, 1.231405, 1, 1, 1, 1, 1,
0.1627732, -0.08967865, 2.033085, 1, 1, 1, 1, 1,
0.1651403, 0.6959321, -1.452042, 1, 1, 1, 1, 1,
0.171409, 2.024832, 1.568342, 1, 1, 1, 1, 1,
0.178233, 0.2477098, -0.5995649, 1, 1, 1, 1, 1,
0.1858456, -0.5549994, 4.071174, 1, 1, 1, 1, 1,
0.187643, 0.4747268, 0.998729, 1, 1, 1, 1, 1,
0.1879624, -0.3112091, 0.7263744, 1, 1, 1, 1, 1,
0.1890317, 0.5280176, 1.790143, 1, 1, 1, 1, 1,
0.1897503, 1.202135, -1.028963, 1, 1, 1, 1, 1,
0.1941823, -1.459083, 4.911387, 1, 1, 1, 1, 1,
0.1948391, 1.179765, -0.7233833, 1, 1, 1, 1, 1,
0.1950167, -0.4411667, 2.7185, 1, 1, 1, 1, 1,
0.19577, 0.9337151, -0.200355, 0, 0, 1, 1, 1,
0.2023194, 1.098371, 0.4174971, 1, 0, 0, 1, 1,
0.2027506, 0.7780204, 2.042617, 1, 0, 0, 1, 1,
0.204648, 0.2191117, 1.486503, 1, 0, 0, 1, 1,
0.2048415, 1.242583, 1.335755, 1, 0, 0, 1, 1,
0.20495, -1.438065, 1.312283, 1, 0, 0, 1, 1,
0.2068354, -1.152849, 5.970272, 0, 0, 0, 1, 1,
0.2118118, -1.55539, 3.158413, 0, 0, 0, 1, 1,
0.216037, 1.046141, -0.2557261, 0, 0, 0, 1, 1,
0.2203194, 0.9772458, -0.1649167, 0, 0, 0, 1, 1,
0.2234188, 0.7178379, 1.155124, 0, 0, 0, 1, 1,
0.2241941, -1.354276, 2.874354, 0, 0, 0, 1, 1,
0.2306473, -0.05310206, 3.187363, 0, 0, 0, 1, 1,
0.2309767, -0.08464414, 1.925003, 1, 1, 1, 1, 1,
0.2328104, -0.4266248, 0.7763004, 1, 1, 1, 1, 1,
0.2376381, -2.64322, 2.767462, 1, 1, 1, 1, 1,
0.2379089, 0.4115841, 1.099316, 1, 1, 1, 1, 1,
0.2380496, 1.187037, -2.421642, 1, 1, 1, 1, 1,
0.2405674, -0.004527267, 2.61596, 1, 1, 1, 1, 1,
0.2411543, -0.8987845, 3.058657, 1, 1, 1, 1, 1,
0.2422434, -0.5518807, 2.54549, 1, 1, 1, 1, 1,
0.2452235, -0.2521209, 2.289461, 1, 1, 1, 1, 1,
0.2468162, 1.341891, 1.886466, 1, 1, 1, 1, 1,
0.2475449, -1.021414, 1.779037, 1, 1, 1, 1, 1,
0.2476206, 0.2517439, 1.235178, 1, 1, 1, 1, 1,
0.2481397, 1.352691, -0.2499546, 1, 1, 1, 1, 1,
0.2495791, -1.036978, 4.180963, 1, 1, 1, 1, 1,
0.2497967, 0.7805285, -1.602638, 1, 1, 1, 1, 1,
0.250542, 0.5178841, 0.7498798, 0, 0, 1, 1, 1,
0.2551531, 1.58779, 1.180949, 1, 0, 0, 1, 1,
0.2569467, -1.637792, 1.86184, 1, 0, 0, 1, 1,
0.2600629, 0.5190089, -0.4242301, 1, 0, 0, 1, 1,
0.2605941, 0.2908751, -0.3891125, 1, 0, 0, 1, 1,
0.2622959, -0.05293864, 2.158421, 1, 0, 0, 1, 1,
0.2626729, 0.2115445, 0.5621043, 0, 0, 0, 1, 1,
0.2673239, -0.6878458, 3.855371, 0, 0, 0, 1, 1,
0.2761781, 0.03441043, 3.208744, 0, 0, 0, 1, 1,
0.2800141, -0.1419964, 2.535325, 0, 0, 0, 1, 1,
0.2832353, 0.4055775, 0.0214187, 0, 0, 0, 1, 1,
0.2841823, 0.8922745, 0.444784, 0, 0, 0, 1, 1,
0.2867849, 1.934929, 0.8272825, 0, 0, 0, 1, 1,
0.2884381, 0.3695931, -0.1108375, 1, 1, 1, 1, 1,
0.2896283, 1.353872, 1.444394, 1, 1, 1, 1, 1,
0.2920967, 1.344844, 1.599602, 1, 1, 1, 1, 1,
0.2947396, 0.1536866, -0.071567, 1, 1, 1, 1, 1,
0.2953174, -1.937299, 1.231873, 1, 1, 1, 1, 1,
0.297642, -0.4548548, 3.412671, 1, 1, 1, 1, 1,
0.2976856, 0.3532487, 0.4943287, 1, 1, 1, 1, 1,
0.2977393, -0.4475071, 1.930609, 1, 1, 1, 1, 1,
0.2984949, -0.09343296, 3.289406, 1, 1, 1, 1, 1,
0.2990058, 0.6877735, 0.1377967, 1, 1, 1, 1, 1,
0.3011286, 0.4095042, 1.086842, 1, 1, 1, 1, 1,
0.3032976, -0.9308619, 3.027451, 1, 1, 1, 1, 1,
0.303853, -1.592459, 2.288833, 1, 1, 1, 1, 1,
0.3063036, -1.970955, 4.148551, 1, 1, 1, 1, 1,
0.3068597, 1.323627, 0.3734322, 1, 1, 1, 1, 1,
0.3075489, 0.07681541, 1.957767, 0, 0, 1, 1, 1,
0.3092747, -2.071413, 3.852482, 1, 0, 0, 1, 1,
0.3122424, -0.08578327, 1.833105, 1, 0, 0, 1, 1,
0.3136079, 0.4330778, -0.9944817, 1, 0, 0, 1, 1,
0.3171551, 1.185459, 1.029738, 1, 0, 0, 1, 1,
0.3243595, -0.9965833, 3.348032, 1, 0, 0, 1, 1,
0.3255554, -0.1534475, -0.1343721, 0, 0, 0, 1, 1,
0.3299514, -1.180836, 3.64089, 0, 0, 0, 1, 1,
0.3300204, 0.7980137, 0.3927629, 0, 0, 0, 1, 1,
0.3343935, 0.962427, 0.6802909, 0, 0, 0, 1, 1,
0.3404055, 0.868656, 1.065115, 0, 0, 0, 1, 1,
0.3444386, 1.48354, 0.2143013, 0, 0, 0, 1, 1,
0.3453089, 0.8381192, 0.02632679, 0, 0, 0, 1, 1,
0.3485771, 1.62076, -0.1325598, 1, 1, 1, 1, 1,
0.3496078, -0.9844064, 3.265439, 1, 1, 1, 1, 1,
0.3545036, -0.4205587, 3.061251, 1, 1, 1, 1, 1,
0.3599061, -0.1019229, 2.657918, 1, 1, 1, 1, 1,
0.3602645, -1.0212, 5.09403, 1, 1, 1, 1, 1,
0.3603418, -1.510674, 2.500056, 1, 1, 1, 1, 1,
0.3618942, 1.636026, 0.1474723, 1, 1, 1, 1, 1,
0.3629062, 0.6841139, -0.3880033, 1, 1, 1, 1, 1,
0.3634749, 0.001910004, -1.067845, 1, 1, 1, 1, 1,
0.3636784, -0.2970654, 4.336906, 1, 1, 1, 1, 1,
0.3695059, 1.609521, 0.691263, 1, 1, 1, 1, 1,
0.3698614, 0.5023044, -0.2101779, 1, 1, 1, 1, 1,
0.3703491, 0.6742781, 0.1457155, 1, 1, 1, 1, 1,
0.3706619, 0.6491599, 1.618321, 1, 1, 1, 1, 1,
0.3727152, 0.7207526, 0.5243672, 1, 1, 1, 1, 1,
0.3734922, -1.461749, 1.546358, 0, 0, 1, 1, 1,
0.3746064, 0.3761357, 0.3255309, 1, 0, 0, 1, 1,
0.3748277, -0.7994113, 1.010991, 1, 0, 0, 1, 1,
0.3749625, 0.9064098, -0.1434487, 1, 0, 0, 1, 1,
0.3765401, 0.8985628, -0.03216745, 1, 0, 0, 1, 1,
0.3779634, -0.5222341, 2.834727, 1, 0, 0, 1, 1,
0.3783275, -1.346006, 2.552402, 0, 0, 0, 1, 1,
0.3829392, -0.9027254, 2.386198, 0, 0, 0, 1, 1,
0.3850839, 0.1828952, 1.284271, 0, 0, 0, 1, 1,
0.3904972, 0.2298909, 1.475339, 0, 0, 0, 1, 1,
0.3909363, -1.135303, 2.964572, 0, 0, 0, 1, 1,
0.3914436, -2.218177, 3.004352, 0, 0, 0, 1, 1,
0.3936661, 1.454417, -1.837922, 0, 0, 0, 1, 1,
0.3948483, 0.857481, -0.1964625, 1, 1, 1, 1, 1,
0.4023176, 0.08718638, 0.6087998, 1, 1, 1, 1, 1,
0.4037554, 0.5943032, -0.3606742, 1, 1, 1, 1, 1,
0.4046141, -0.5748588, 3.455792, 1, 1, 1, 1, 1,
0.404722, -0.6700758, 3.190775, 1, 1, 1, 1, 1,
0.4101529, 1.3951, 0.05953595, 1, 1, 1, 1, 1,
0.4104216, -0.4968702, 2.338357, 1, 1, 1, 1, 1,
0.4129653, 0.7618796, 1.196211, 1, 1, 1, 1, 1,
0.4151412, 0.1755804, 1.057366, 1, 1, 1, 1, 1,
0.4175843, -0.08632688, 1.346799, 1, 1, 1, 1, 1,
0.4187303, -0.6749008, 1.764163, 1, 1, 1, 1, 1,
0.4296046, 1.144333, 1.72032, 1, 1, 1, 1, 1,
0.4313337, 0.39646, 0.9860606, 1, 1, 1, 1, 1,
0.4339093, -1.235474, 1.777163, 1, 1, 1, 1, 1,
0.4361602, -0.4931788, 2.440006, 1, 1, 1, 1, 1,
0.4370136, -0.8003997, 0.8927188, 0, 0, 1, 1, 1,
0.4465384, 1.822789, 1.235308, 1, 0, 0, 1, 1,
0.4510271, -1.923906, 3.080627, 1, 0, 0, 1, 1,
0.4512388, -1.748369, 3.640518, 1, 0, 0, 1, 1,
0.4600386, 1.27945, 0.6117851, 1, 0, 0, 1, 1,
0.4607094, -0.7231753, 1.768249, 1, 0, 0, 1, 1,
0.4614797, -1.572336, 4.142861, 0, 0, 0, 1, 1,
0.4675833, 0.3631074, 0.9053143, 0, 0, 0, 1, 1,
0.4711961, -0.2840471, 1.622689, 0, 0, 0, 1, 1,
0.4778133, 1.006809, 0.007677895, 0, 0, 0, 1, 1,
0.4790027, -0.7606502, 3.40979, 0, 0, 0, 1, 1,
0.4800286, 0.7378108, -1.313936, 0, 0, 0, 1, 1,
0.4804274, 0.1001118, 1.254345, 0, 0, 0, 1, 1,
0.485285, 0.2163473, 1.042471, 1, 1, 1, 1, 1,
0.4870688, -1.284536, 3.865736, 1, 1, 1, 1, 1,
0.489536, 0.173816, 0.5657166, 1, 1, 1, 1, 1,
0.4899048, 1.647916, 0.278828, 1, 1, 1, 1, 1,
0.4941222, -1.34224, 1.579364, 1, 1, 1, 1, 1,
0.4951882, 0.8704588, 1.517687, 1, 1, 1, 1, 1,
0.5024888, 0.808914, -1.068705, 1, 1, 1, 1, 1,
0.5072601, -1.165229, 2.263754, 1, 1, 1, 1, 1,
0.5092689, 1.924374, 1.674256, 1, 1, 1, 1, 1,
0.512872, -0.725903, 3.101585, 1, 1, 1, 1, 1,
0.5148183, -0.8805893, 3.221777, 1, 1, 1, 1, 1,
0.516367, -0.7679934, 0.7213078, 1, 1, 1, 1, 1,
0.5172375, 0.08096743, 0.2513235, 1, 1, 1, 1, 1,
0.5218275, 1.692982, 0.1784771, 1, 1, 1, 1, 1,
0.5245032, -0.1100256, 1.484211, 1, 1, 1, 1, 1,
0.5251315, -1.232119, 2.431206, 0, 0, 1, 1, 1,
0.5275386, -0.2724668, 2.473835, 1, 0, 0, 1, 1,
0.529455, -0.0756586, 1.840459, 1, 0, 0, 1, 1,
0.5298212, 0.6360447, 0.07839796, 1, 0, 0, 1, 1,
0.5315249, -0.8731304, 2.807534, 1, 0, 0, 1, 1,
0.5316306, 0.7019156, -0.03157549, 1, 0, 0, 1, 1,
0.5338495, -1.355313, 1.804172, 0, 0, 0, 1, 1,
0.5340036, 0.1597737, 2.280342, 0, 0, 0, 1, 1,
0.5372825, -0.07773237, 2.147633, 0, 0, 0, 1, 1,
0.5400177, 0.1965544, -0.3467544, 0, 0, 0, 1, 1,
0.5442706, -1.104971, 2.560542, 0, 0, 0, 1, 1,
0.5449923, -0.3289645, 2.66534, 0, 0, 0, 1, 1,
0.5498297, -1.344691, 1.823418, 0, 0, 0, 1, 1,
0.5507242, -1.026538, 2.573643, 1, 1, 1, 1, 1,
0.554915, -1.42955, 3.217203, 1, 1, 1, 1, 1,
0.5589039, 0.08620239, 3.099703, 1, 1, 1, 1, 1,
0.5599774, -0.5737762, 1.256952, 1, 1, 1, 1, 1,
0.5619347, -1.275083, 4.092421, 1, 1, 1, 1, 1,
0.5657595, -0.5990236, 2.812919, 1, 1, 1, 1, 1,
0.5660551, -0.2164469, -0.2828198, 1, 1, 1, 1, 1,
0.5750682, 0.1755558, 0.4748966, 1, 1, 1, 1, 1,
0.5830342, -0.3286421, 2.2364, 1, 1, 1, 1, 1,
0.5855847, -0.1628108, 2.172195, 1, 1, 1, 1, 1,
0.5979978, 1.960416, 1.856734, 1, 1, 1, 1, 1,
0.6002399, 0.2584072, 2.43644, 1, 1, 1, 1, 1,
0.6011494, 1.429725, -1.093381, 1, 1, 1, 1, 1,
0.6023087, -1.560685, 2.263974, 1, 1, 1, 1, 1,
0.6047122, 0.3527062, 1.813469, 1, 1, 1, 1, 1,
0.6055961, -0.06466714, 2.548363, 0, 0, 1, 1, 1,
0.6084898, -0.4716055, 2.563413, 1, 0, 0, 1, 1,
0.610841, 1.12677, 0.3874202, 1, 0, 0, 1, 1,
0.6135916, 0.1820326, 0.9296328, 1, 0, 0, 1, 1,
0.6197382, -0.6667327, 3.553898, 1, 0, 0, 1, 1,
0.6284865, 2.02001, 0.638669, 1, 0, 0, 1, 1,
0.6284993, -0.3368668, 1.25708, 0, 0, 0, 1, 1,
0.632108, 0.1810428, 3.474486, 0, 0, 0, 1, 1,
0.6352346, -0.9452518, 2.235556, 0, 0, 0, 1, 1,
0.6403626, 1.27182, 0.7905296, 0, 0, 0, 1, 1,
0.6412825, -1.455169, 1.432716, 0, 0, 0, 1, 1,
0.6442485, 0.3721232, -0.1100074, 0, 0, 0, 1, 1,
0.6459242, 1.353013, -0.593623, 0, 0, 0, 1, 1,
0.6470059, 0.6536884, 1.167629, 1, 1, 1, 1, 1,
0.6518428, 0.3801544, -0.08720008, 1, 1, 1, 1, 1,
0.6529046, -1.073986, 3.491314, 1, 1, 1, 1, 1,
0.6597741, -1.324378, 3.435808, 1, 1, 1, 1, 1,
0.6627128, -0.6374434, 3.347929, 1, 1, 1, 1, 1,
0.6635306, -0.9214845, 2.623299, 1, 1, 1, 1, 1,
0.6780626, -0.2595874, 1.867223, 1, 1, 1, 1, 1,
0.6835939, 0.7781892, -0.2446318, 1, 1, 1, 1, 1,
0.6922844, -0.1543181, 3.408295, 1, 1, 1, 1, 1,
0.6929057, 0.7388864, 0.09671705, 1, 1, 1, 1, 1,
0.6982174, -2.126664, 4.49329, 1, 1, 1, 1, 1,
0.6982982, 0.5524196, 0.4713531, 1, 1, 1, 1, 1,
0.6994595, 1.832444, 1.418603, 1, 1, 1, 1, 1,
0.7066734, 0.07157135, 0.5034803, 1, 1, 1, 1, 1,
0.7094237, 2.658163, -0.1774868, 1, 1, 1, 1, 1,
0.7119539, 1.84765, 0.1827093, 0, 0, 1, 1, 1,
0.714617, 0.02554667, 1.216771, 1, 0, 0, 1, 1,
0.7180809, 0.1646794, 1.410724, 1, 0, 0, 1, 1,
0.7243747, -1.132521, 3.225688, 1, 0, 0, 1, 1,
0.7255433, 1.036093, -1.520916, 1, 0, 0, 1, 1,
0.7285964, 1.483509, 1.132813, 1, 0, 0, 1, 1,
0.7291806, -0.1635398, 2.235115, 0, 0, 0, 1, 1,
0.7304567, -0.5025616, 1.979355, 0, 0, 0, 1, 1,
0.7321305, 0.5955334, 1.880654, 0, 0, 0, 1, 1,
0.7386981, -1.098668, 1.515032, 0, 0, 0, 1, 1,
0.7415853, 0.9294149, 1.295227, 0, 0, 0, 1, 1,
0.7452676, -0.7265242, 0.9144621, 0, 0, 0, 1, 1,
0.7459707, -1.052158, 2.435056, 0, 0, 0, 1, 1,
0.7532774, 0.6259814, 1.303271, 1, 1, 1, 1, 1,
0.7560785, 1.373106, 1.084842, 1, 1, 1, 1, 1,
0.7592477, 0.5356215, 1.023998, 1, 1, 1, 1, 1,
0.7665964, 1.652177, 1.279423, 1, 1, 1, 1, 1,
0.7707061, -0.7482215, 3.513182, 1, 1, 1, 1, 1,
0.777504, 0.07485624, 1.195161, 1, 1, 1, 1, 1,
0.7790393, -0.5654568, 2.599424, 1, 1, 1, 1, 1,
0.7813398, 0.7488075, 1.28231, 1, 1, 1, 1, 1,
0.7871938, 0.5668228, 0.09625558, 1, 1, 1, 1, 1,
0.7898411, -0.8228219, 3.740879, 1, 1, 1, 1, 1,
0.8045287, 1.42154, 0.7804132, 1, 1, 1, 1, 1,
0.8068385, 0.5927388, 1.193745, 1, 1, 1, 1, 1,
0.8171852, 1.52723, -0.5399683, 1, 1, 1, 1, 1,
0.8174221, 1.849624, 0.8928162, 1, 1, 1, 1, 1,
0.8218968, -1.230414, 1.826964, 1, 1, 1, 1, 1,
0.822275, 0.0135433, 0.6794927, 0, 0, 1, 1, 1,
0.8235804, 1.210061, 2.276517, 1, 0, 0, 1, 1,
0.8273964, 0.3108564, 1.304908, 1, 0, 0, 1, 1,
0.8393388, -0.2404604, 0.9423519, 1, 0, 0, 1, 1,
0.8463553, 1.537725, -1.02149, 1, 0, 0, 1, 1,
0.8523331, -0.5942214, 1.895344, 1, 0, 0, 1, 1,
0.8540754, -0.454389, 2.325195, 0, 0, 0, 1, 1,
0.857714, -0.6919259, 2.59113, 0, 0, 0, 1, 1,
0.8620861, 0.0684895, 1.697339, 0, 0, 0, 1, 1,
0.8670764, 1.557181, 0.6513023, 0, 0, 0, 1, 1,
0.870186, 0.2891252, 1.43722, 0, 0, 0, 1, 1,
0.8756346, 0.1205879, 0.9165484, 0, 0, 0, 1, 1,
0.8915022, 0.8916055, 0.1421676, 0, 0, 0, 1, 1,
0.8976211, 2.737676, 2.006381, 1, 1, 1, 1, 1,
0.8976603, 1.462781, -0.7270411, 1, 1, 1, 1, 1,
0.8997706, 0.3242348, 1.403039, 1, 1, 1, 1, 1,
0.9065669, 0.4942837, 1.660999, 1, 1, 1, 1, 1,
0.907586, 1.843171, -0.1686115, 1, 1, 1, 1, 1,
0.9077963, 0.1541661, 0.7828724, 1, 1, 1, 1, 1,
0.9078402, -0.4613988, 1.704308, 1, 1, 1, 1, 1,
0.9084263, -0.9578384, 3.382328, 1, 1, 1, 1, 1,
0.9102442, 0.947376, 1.670383, 1, 1, 1, 1, 1,
0.9109225, 1.333647, -0.04989537, 1, 1, 1, 1, 1,
0.9153103, 0.5712889, 0.7010307, 1, 1, 1, 1, 1,
0.9192839, 1.136169, -0.04255353, 1, 1, 1, 1, 1,
0.9199249, -0.2016053, 2.009354, 1, 1, 1, 1, 1,
0.9221717, 0.3187027, 2.627782, 1, 1, 1, 1, 1,
0.9228181, -1.066888, 0.4579397, 1, 1, 1, 1, 1,
0.9236869, -1.002075, 2.394841, 0, 0, 1, 1, 1,
0.9263467, 2.927922, 0.1455848, 1, 0, 0, 1, 1,
0.9274539, 0.5878896, 1.433394, 1, 0, 0, 1, 1,
0.9421147, 0.3445736, 0.8044179, 1, 0, 0, 1, 1,
0.9469626, -1.190627, 2.245613, 1, 0, 0, 1, 1,
0.9506798, -0.2064647, 2.652793, 1, 0, 0, 1, 1,
0.9546179, -1.994728, 2.193724, 0, 0, 0, 1, 1,
0.9569675, -1.013511, 3.469213, 0, 0, 0, 1, 1,
0.9656444, -0.1710165, 1.653206, 0, 0, 0, 1, 1,
0.9668939, 0.3786649, 1.177299, 0, 0, 0, 1, 1,
0.9691522, -2.085011, 1.015339, 0, 0, 0, 1, 1,
0.9699221, -1.742994, 3.207453, 0, 0, 0, 1, 1,
0.9926251, 0.485467, 1.863088, 0, 0, 0, 1, 1,
0.9936635, 1.009509, 1.365316, 1, 1, 1, 1, 1,
0.9995295, 0.2986787, 1.347344, 1, 1, 1, 1, 1,
1.003129, 0.5644743, 1.138286, 1, 1, 1, 1, 1,
1.00372, 0.1964863, 2.193973, 1, 1, 1, 1, 1,
1.003914, 0.2142366, 1.193711, 1, 1, 1, 1, 1,
1.006791, 0.4069165, 2.640432, 1, 1, 1, 1, 1,
1.009377, 0.2589227, 0.4432417, 1, 1, 1, 1, 1,
1.01229, -0.5461555, 2.699136, 1, 1, 1, 1, 1,
1.0162, 0.2441567, -0.2560648, 1, 1, 1, 1, 1,
1.023019, 0.0124142, 1.027999, 1, 1, 1, 1, 1,
1.028491, 0.4738095, 1.492599, 1, 1, 1, 1, 1,
1.030349, -0.5861028, 2.980773, 1, 1, 1, 1, 1,
1.040334, -0.4175311, 2.200016, 1, 1, 1, 1, 1,
1.045113, -0.6532166, 1.111889, 1, 1, 1, 1, 1,
1.054123, 2.284018, 1.344757, 1, 1, 1, 1, 1,
1.056415, 0.5345597, 0.4127136, 0, 0, 1, 1, 1,
1.057914, -0.2320667, 1.048924, 1, 0, 0, 1, 1,
1.058224, -0.271536, 2.462909, 1, 0, 0, 1, 1,
1.062182, -0.3470232, 1.334874, 1, 0, 0, 1, 1,
1.067042, 1.945904, 0.4966002, 1, 0, 0, 1, 1,
1.073436, 0.6990561, 2.91022, 1, 0, 0, 1, 1,
1.075197, -0.3514672, 1.558348, 0, 0, 0, 1, 1,
1.082713, 0.7204951, 2.449278, 0, 0, 0, 1, 1,
1.092255, 1.707364, -0.9418755, 0, 0, 0, 1, 1,
1.092936, 0.5487677, 0.8047101, 0, 0, 0, 1, 1,
1.095325, -1.34439, 2.538157, 0, 0, 0, 1, 1,
1.095457, 0.305509, 0.9873495, 0, 0, 0, 1, 1,
1.098027, -1.335224, 1.043584, 0, 0, 0, 1, 1,
1.102511, -0.9880323, 2.44796, 1, 1, 1, 1, 1,
1.118531, 2.513999, -0.3751952, 1, 1, 1, 1, 1,
1.135171, 0.4203034, 2.009972, 1, 1, 1, 1, 1,
1.145663, 1.271251, 1.667395, 1, 1, 1, 1, 1,
1.151822, -2.369312, 1.14676, 1, 1, 1, 1, 1,
1.164739, -0.2082939, 1.724875, 1, 1, 1, 1, 1,
1.168879, -0.0154535, 1.332701, 1, 1, 1, 1, 1,
1.173351, -1.537247, 1.808652, 1, 1, 1, 1, 1,
1.174721, -0.1559153, 3.321249, 1, 1, 1, 1, 1,
1.178824, -0.1568125, 1.877294, 1, 1, 1, 1, 1,
1.192835, 0.7642378, 0.2285801, 1, 1, 1, 1, 1,
1.193327, -0.03630352, 2.195063, 1, 1, 1, 1, 1,
1.194726, -0.4510304, 0.6798016, 1, 1, 1, 1, 1,
1.196376, 0.9094218, 0.9749914, 1, 1, 1, 1, 1,
1.198455, -0.01244266, 2.422395, 1, 1, 1, 1, 1,
1.200248, 0.3596628, 1.174245, 0, 0, 1, 1, 1,
1.202542, -0.3838569, 2.179338, 1, 0, 0, 1, 1,
1.203368, 0.7585551, 1.75313, 1, 0, 0, 1, 1,
1.203993, -0.5931821, 2.85288, 1, 0, 0, 1, 1,
1.203998, -0.4003616, 1.562234, 1, 0, 0, 1, 1,
1.208664, -1.644628, 2.557933, 1, 0, 0, 1, 1,
1.214367, 0.4162358, 0.0686204, 0, 0, 0, 1, 1,
1.221163, -1.696065, 2.333025, 0, 0, 0, 1, 1,
1.228667, 0.694636, 0.2386869, 0, 0, 0, 1, 1,
1.242464, 1.022858, -0.5401148, 0, 0, 0, 1, 1,
1.251315, -1.004974, 3.382982, 0, 0, 0, 1, 1,
1.26182, 0.2131967, 1.296038, 0, 0, 0, 1, 1,
1.2652, -0.598815, 1.430083, 0, 0, 0, 1, 1,
1.267148, 0.146743, 1.507064, 1, 1, 1, 1, 1,
1.267731, 1.163425, 1.76719, 1, 1, 1, 1, 1,
1.271367, -0.6455229, 1.318972, 1, 1, 1, 1, 1,
1.277434, 0.00536747, 3.430434, 1, 1, 1, 1, 1,
1.281597, 1.448335, 1.744683, 1, 1, 1, 1, 1,
1.291004, -0.03310186, 1.474261, 1, 1, 1, 1, 1,
1.299796, -0.4854305, 0.4126874, 1, 1, 1, 1, 1,
1.300205, 0.7627404, 0.7112681, 1, 1, 1, 1, 1,
1.307113, 1.246075, 0.8570479, 1, 1, 1, 1, 1,
1.344139, 0.07844482, 1.431335, 1, 1, 1, 1, 1,
1.349151, 0.3707095, -0.01196681, 1, 1, 1, 1, 1,
1.350309, -0.367016, 1.855687, 1, 1, 1, 1, 1,
1.372278, -0.6221303, 2.585364, 1, 1, 1, 1, 1,
1.382406, 0.9841178, 0.7235166, 1, 1, 1, 1, 1,
1.388815, -1.110423, 0.4952456, 1, 1, 1, 1, 1,
1.407408, -0.1491324, 1.607988, 0, 0, 1, 1, 1,
1.421484, -0.4501713, 1.787872, 1, 0, 0, 1, 1,
1.423432, 2.09444, 2.852522, 1, 0, 0, 1, 1,
1.43014, -0.2746157, 1.809525, 1, 0, 0, 1, 1,
1.44066, -0.02188894, 1.80319, 1, 0, 0, 1, 1,
1.44663, 0.8116047, 0.5954648, 1, 0, 0, 1, 1,
1.455155, -1.199566, 2.183045, 0, 0, 0, 1, 1,
1.465184, 0.8102441, 0.5712903, 0, 0, 0, 1, 1,
1.466516, 0.004648911, 2.223644, 0, 0, 0, 1, 1,
1.472165, 0.6930526, 1.010344, 0, 0, 0, 1, 1,
1.4778, 0.01804553, 3.082196, 0, 0, 0, 1, 1,
1.492722, -0.2077848, 0.7309892, 0, 0, 0, 1, 1,
1.503891, -0.5380226, 0.6934165, 0, 0, 0, 1, 1,
1.504103, -0.1579986, 1.291975, 1, 1, 1, 1, 1,
1.507213, -1.288906, 1.323357, 1, 1, 1, 1, 1,
1.540915, 1.038018, 1.84475, 1, 1, 1, 1, 1,
1.543287, 1.039453, -0.5785124, 1, 1, 1, 1, 1,
1.549368, 1.136225, -1.51742, 1, 1, 1, 1, 1,
1.556626, 0.3947585, 1.16341, 1, 1, 1, 1, 1,
1.563055, 1.579419, -1.383577, 1, 1, 1, 1, 1,
1.586175, 0.01724176, 0.02069058, 1, 1, 1, 1, 1,
1.586535, -0.6129108, 4.095359, 1, 1, 1, 1, 1,
1.592696, 1.944468, 0.1453131, 1, 1, 1, 1, 1,
1.604113, 0.9415731, 0.6290579, 1, 1, 1, 1, 1,
1.605105, 0.7618995, 0.3601298, 1, 1, 1, 1, 1,
1.613676, 1.488621, -0.468898, 1, 1, 1, 1, 1,
1.616057, -0.1077704, -0.118832, 1, 1, 1, 1, 1,
1.628153, -0.4101463, 1.970077, 1, 1, 1, 1, 1,
1.631784, -1.461862, 1.383154, 0, 0, 1, 1, 1,
1.642309, 0.4728238, 1.016746, 1, 0, 0, 1, 1,
1.665354, 0.9365173, -0.7561848, 1, 0, 0, 1, 1,
1.667222, -0.005994308, 0.9145598, 1, 0, 0, 1, 1,
1.692968, -0.3490679, 2.309267, 1, 0, 0, 1, 1,
1.736009, -0.7246087, 0.9207347, 1, 0, 0, 1, 1,
1.787807, -0.2474338, 1.87262, 0, 0, 0, 1, 1,
1.791697, -1.007171, 3.726774, 0, 0, 0, 1, 1,
1.797858, 0.7628807, 0.162661, 0, 0, 0, 1, 1,
1.801504, -0.9373634, 2.584058, 0, 0, 0, 1, 1,
1.810619, 0.3754762, -0.3417228, 0, 0, 0, 1, 1,
1.810684, 1.797208, 1.847542, 0, 0, 0, 1, 1,
1.829556, -1.749304, 2.416028, 0, 0, 0, 1, 1,
1.838457, 1.609066, 1.102282, 1, 1, 1, 1, 1,
1.877532, 0.02081244, 2.693323, 1, 1, 1, 1, 1,
1.880834, 0.553229, 2.041052, 1, 1, 1, 1, 1,
1.885044, -0.142912, 2.909922, 1, 1, 1, 1, 1,
1.893043, -1.529075, 2.207031, 1, 1, 1, 1, 1,
1.896541, 0.4101327, 0.4759125, 1, 1, 1, 1, 1,
1.902911, -0.3190823, 1.815569, 1, 1, 1, 1, 1,
1.947852, -1.886164, 0.0531215, 1, 1, 1, 1, 1,
1.967409, -0.9452908, 1.356694, 1, 1, 1, 1, 1,
1.970082, -0.1310289, 3.119827, 1, 1, 1, 1, 1,
1.978828, 0.1123289, 0.7748041, 1, 1, 1, 1, 1,
1.982011, 0.7285333, 1.791202, 1, 1, 1, 1, 1,
2.005705, -0.1300851, 2.259938, 1, 1, 1, 1, 1,
2.02435, 0.7683364, 0.4672672, 1, 1, 1, 1, 1,
2.036279, 0.3394847, 0.9227946, 1, 1, 1, 1, 1,
2.055828, 0.008972874, 1.931944, 0, 0, 1, 1, 1,
2.082244, -1.150853, 3.481397, 1, 0, 0, 1, 1,
2.11902, 0.4683683, -0.06586624, 1, 0, 0, 1, 1,
2.122548, -1.317252, 2.589732, 1, 0, 0, 1, 1,
2.125741, -0.513285, 2.744809, 1, 0, 0, 1, 1,
2.137386, -1.594529, 2.813614, 1, 0, 0, 1, 1,
2.194917, -1.238864, 1.2552, 0, 0, 0, 1, 1,
2.215983, 2.232602, 1.815025, 0, 0, 0, 1, 1,
2.24118, 0.5370312, 0.9916524, 0, 0, 0, 1, 1,
2.287986, -0.5878313, 0.7921594, 0, 0, 0, 1, 1,
2.343347, -0.675374, 1.556053, 0, 0, 0, 1, 1,
2.42241, -0.8378395, 1.379127, 0, 0, 0, 1, 1,
2.423941, -0.628446, 1.90692, 0, 0, 0, 1, 1,
2.431233, -0.4620657, 2.328604, 1, 1, 1, 1, 1,
2.477467, -0.9831696, 1.191532, 1, 1, 1, 1, 1,
2.497858, 0.05761096, 0.8621011, 1, 1, 1, 1, 1,
2.672102, -1.638068, 1.601465, 1, 1, 1, 1, 1,
2.728947, 0.3853826, 2.969982, 1, 1, 1, 1, 1,
3.028986, -1.332113, 0.6402327, 1, 1, 1, 1, 1,
3.13739, -0.7508335, 2.557473, 1, 1, 1, 1, 1
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
var radius = 9.459441;
var distance = 33.22589;
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
mvMatrix.translate( -0.01627278, -0.1304747, -0.4474614 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22589);
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
