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
-3.861311, 0.05750242, -1.273656, 1, 0, 0, 1,
-3.134531, -0.3726392, 0.6763709, 1, 0.007843138, 0, 1,
-3.073615, -0.2618601, -1.993801, 1, 0.01176471, 0, 1,
-2.850217, -0.3001541, -0.5177612, 1, 0.01960784, 0, 1,
-2.731328, 1.603753, -1.199333, 1, 0.02352941, 0, 1,
-2.560848, 0.5060922, 0.1327776, 1, 0.03137255, 0, 1,
-2.524607, 0.3377133, -1.49542, 1, 0.03529412, 0, 1,
-2.441247, -1.239693, -1.18899, 1, 0.04313726, 0, 1,
-2.427207, -0.5911582, -1.514987, 1, 0.04705882, 0, 1,
-2.408632, -1.339879, -2.389435, 1, 0.05490196, 0, 1,
-2.354945, 1.767576, -0.02682244, 1, 0.05882353, 0, 1,
-2.256413, -1.593025, -1.530712, 1, 0.06666667, 0, 1,
-2.229005, 0.4505554, -1.30368, 1, 0.07058824, 0, 1,
-2.211642, 0.5963635, -0.1713388, 1, 0.07843138, 0, 1,
-2.177227, -0.6085694, -3.299252, 1, 0.08235294, 0, 1,
-2.107258, 1.60683, 0.06307555, 1, 0.09019608, 0, 1,
-2.096085, -0.421304, -1.937916, 1, 0.09411765, 0, 1,
-2.070012, -0.4694149, -2.404759, 1, 0.1019608, 0, 1,
-2.060959, 0.03654742, -2.234831, 1, 0.1098039, 0, 1,
-2.059019, -1.256794, -1.127774, 1, 0.1137255, 0, 1,
-2.021902, -0.157888, -2.762952, 1, 0.1215686, 0, 1,
-2.020471, 0.3352342, -2.736068, 1, 0.1254902, 0, 1,
-1.985469, 0.3523052, -1.298819, 1, 0.1333333, 0, 1,
-1.978854, -0.8353761, -2.933738, 1, 0.1372549, 0, 1,
-1.947929, 0.09412495, -0.8136941, 1, 0.145098, 0, 1,
-1.927659, -0.5708411, -1.713866, 1, 0.1490196, 0, 1,
-1.92071, 0.8848605, -1.595622, 1, 0.1568628, 0, 1,
-1.912055, 0.7767962, -0.9214951, 1, 0.1607843, 0, 1,
-1.864671, -0.8498468, -1.076938, 1, 0.1686275, 0, 1,
-1.840672, 0.6257228, -1.244512, 1, 0.172549, 0, 1,
-1.812881, 1.559811, -2.766998, 1, 0.1803922, 0, 1,
-1.794091, -0.3652032, -1.733528, 1, 0.1843137, 0, 1,
-1.785322, 0.4053822, -1.856889, 1, 0.1921569, 0, 1,
-1.772593, 0.642776, 0.3352999, 1, 0.1960784, 0, 1,
-1.772261, -0.4732214, -2.690171, 1, 0.2039216, 0, 1,
-1.741841, 0.03508613, -2.235501, 1, 0.2117647, 0, 1,
-1.741431, -1.130893, -2.270835, 1, 0.2156863, 0, 1,
-1.698799, -0.2358837, -1.1395, 1, 0.2235294, 0, 1,
-1.690171, 1.222311, -0.477381, 1, 0.227451, 0, 1,
-1.685002, -1.283081, -2.830906, 1, 0.2352941, 0, 1,
-1.680052, -0.2406161, 1.442761, 1, 0.2392157, 0, 1,
-1.670963, -1.972961, -2.715358, 1, 0.2470588, 0, 1,
-1.661671, -0.6160641, -1.311185, 1, 0.2509804, 0, 1,
-1.660636, 2.161916, 0.5346437, 1, 0.2588235, 0, 1,
-1.656595, 0.2222987, -0.718735, 1, 0.2627451, 0, 1,
-1.650939, -0.1569931, -0.4244775, 1, 0.2705882, 0, 1,
-1.646871, 0.5904624, -0.4513007, 1, 0.2745098, 0, 1,
-1.634545, 1.229076, -1.756606, 1, 0.282353, 0, 1,
-1.630632, 1.177336, -1.49266, 1, 0.2862745, 0, 1,
-1.623876, 1.288497, -3.280381, 1, 0.2941177, 0, 1,
-1.613857, 0.2013954, -1.373022, 1, 0.3019608, 0, 1,
-1.599534, -0.5807445, -1.031004, 1, 0.3058824, 0, 1,
-1.594809, -0.9457299, -1.419056, 1, 0.3137255, 0, 1,
-1.591348, -0.8186218, -1.854875, 1, 0.3176471, 0, 1,
-1.580705, 0.4191126, -1.305355, 1, 0.3254902, 0, 1,
-1.574196, -0.09269033, -2.765137, 1, 0.3294118, 0, 1,
-1.573211, -0.3729763, -2.436234, 1, 0.3372549, 0, 1,
-1.55965, 0.6171244, 0.7798691, 1, 0.3411765, 0, 1,
-1.558552, -0.2701882, -0.8401, 1, 0.3490196, 0, 1,
-1.55721, -0.9749188, -2.074697, 1, 0.3529412, 0, 1,
-1.53783, -1.055085, -2.894411, 1, 0.3607843, 0, 1,
-1.52899, 0.5240806, -2.25856, 1, 0.3647059, 0, 1,
-1.52208, 0.2294237, -1.503725, 1, 0.372549, 0, 1,
-1.514038, 1.225598, 0.4177835, 1, 0.3764706, 0, 1,
-1.502114, -1.117722, -2.482747, 1, 0.3843137, 0, 1,
-1.499476, -1.850793, -1.317077, 1, 0.3882353, 0, 1,
-1.493906, -0.6887797, -2.102676, 1, 0.3960784, 0, 1,
-1.48331, 0.1991637, -1.797898, 1, 0.4039216, 0, 1,
-1.482853, 0.2871031, -2.237595, 1, 0.4078431, 0, 1,
-1.482815, 0.4990521, -1.34118, 1, 0.4156863, 0, 1,
-1.482273, 0.1386337, -1.743458, 1, 0.4196078, 0, 1,
-1.462867, 0.1610773, -1.660547, 1, 0.427451, 0, 1,
-1.462146, 0.6292337, -1.611562, 1, 0.4313726, 0, 1,
-1.454516, -0.5136666, -0.9553638, 1, 0.4392157, 0, 1,
-1.450422, 0.1877083, -2.710331, 1, 0.4431373, 0, 1,
-1.436519, -1.036279, -2.44462, 1, 0.4509804, 0, 1,
-1.429147, -0.323946, -1.175495, 1, 0.454902, 0, 1,
-1.426243, 0.1852425, -3.867037, 1, 0.4627451, 0, 1,
-1.425872, 0.3010536, -2.334757, 1, 0.4666667, 0, 1,
-1.423216, -0.8936393, -1.865202, 1, 0.4745098, 0, 1,
-1.422945, -0.4695091, -4.444844, 1, 0.4784314, 0, 1,
-1.420848, -0.2616181, -1.729061, 1, 0.4862745, 0, 1,
-1.417358, 1.278874, -1.335037, 1, 0.4901961, 0, 1,
-1.407154, -1.661858, -3.211823, 1, 0.4980392, 0, 1,
-1.405517, -0.8797851, -2.792211, 1, 0.5058824, 0, 1,
-1.39203, -0.4822455, -2.701375, 1, 0.509804, 0, 1,
-1.38537, -0.7878424, -2.634934, 1, 0.5176471, 0, 1,
-1.378637, 0.1634314, -0.5315886, 1, 0.5215687, 0, 1,
-1.369711, 0.194216, -0.9878581, 1, 0.5294118, 0, 1,
-1.361513, 0.1885334, 0.0763463, 1, 0.5333334, 0, 1,
-1.342289, -0.7775467, -1.460346, 1, 0.5411765, 0, 1,
-1.34128, -1.510275, -3.248856, 1, 0.5450981, 0, 1,
-1.339422, -1.255976, -0.1351584, 1, 0.5529412, 0, 1,
-1.33527, -0.7631555, -0.8000059, 1, 0.5568628, 0, 1,
-1.315813, -1.651136, -2.239094, 1, 0.5647059, 0, 1,
-1.291425, 0.3162659, -2.264861, 1, 0.5686275, 0, 1,
-1.285311, 0.8901538, -0.9486355, 1, 0.5764706, 0, 1,
-1.275835, -1.380363, -2.452621, 1, 0.5803922, 0, 1,
-1.274957, 0.7169411, -1.160764, 1, 0.5882353, 0, 1,
-1.269433, 0.09544488, -2.733936, 1, 0.5921569, 0, 1,
-1.251692, -2.012869, -3.485027, 1, 0.6, 0, 1,
-1.251103, -1.066422, -2.240834, 1, 0.6078432, 0, 1,
-1.238514, -0.2268361, -0.9229754, 1, 0.6117647, 0, 1,
-1.237115, -0.7225662, -0.5691468, 1, 0.6196079, 0, 1,
-1.23241, -1.295556, -3.209772, 1, 0.6235294, 0, 1,
-1.231831, 0.8785239, -1.197506, 1, 0.6313726, 0, 1,
-1.226771, -2.018373, -1.087128, 1, 0.6352941, 0, 1,
-1.21087, 0.2347825, -2.489877, 1, 0.6431373, 0, 1,
-1.210339, -0.6160256, -1.80245, 1, 0.6470588, 0, 1,
-1.192856, -0.4920787, -1.77117, 1, 0.654902, 0, 1,
-1.184641, -0.2673873, -1.702635, 1, 0.6588235, 0, 1,
-1.173973, -0.3394797, -2.600582, 1, 0.6666667, 0, 1,
-1.173437, 0.4162203, -0.1493164, 1, 0.6705883, 0, 1,
-1.171771, -0.9294134, -1.313486, 1, 0.6784314, 0, 1,
-1.168705, -1.3328, -2.963832, 1, 0.682353, 0, 1,
-1.163717, -0.4239643, -3.867098, 1, 0.6901961, 0, 1,
-1.163355, 0.6991554, -1.442594, 1, 0.6941177, 0, 1,
-1.162508, -0.02909322, -2.010836, 1, 0.7019608, 0, 1,
-1.160749, 0.6829681, -1.279861, 1, 0.7098039, 0, 1,
-1.156496, 0.01267374, -0.7576517, 1, 0.7137255, 0, 1,
-1.14939, -0.1498895, -2.192234, 1, 0.7215686, 0, 1,
-1.148017, 1.44881, -1.269051, 1, 0.7254902, 0, 1,
-1.144112, 1.543558, 0.01598601, 1, 0.7333333, 0, 1,
-1.143505, 0.2687106, -0.4913184, 1, 0.7372549, 0, 1,
-1.143475, 0.4350019, -3.07844, 1, 0.7450981, 0, 1,
-1.140063, 1.562582, -1.42318, 1, 0.7490196, 0, 1,
-1.136655, -0.4697139, -1.796886, 1, 0.7568628, 0, 1,
-1.12307, -0.7242616, -1.836127, 1, 0.7607843, 0, 1,
-1.11537, 1.140323, 0.450019, 1, 0.7686275, 0, 1,
-1.111758, -0.8407426, -3.658252, 1, 0.772549, 0, 1,
-1.10317, -1.400315, -2.780865, 1, 0.7803922, 0, 1,
-1.101581, -1.250908, -4.620182, 1, 0.7843137, 0, 1,
-1.094053, 1.624671, 1.172076, 1, 0.7921569, 0, 1,
-1.093519, 0.5425165, -0.5372118, 1, 0.7960784, 0, 1,
-1.074488, -1.818689, -4.48747, 1, 0.8039216, 0, 1,
-1.063373, -0.4107911, -2.882099, 1, 0.8117647, 0, 1,
-1.057963, 0.622681, -0.2974564, 1, 0.8156863, 0, 1,
-1.050673, -1.370347, -2.422437, 1, 0.8235294, 0, 1,
-1.043899, 0.6513444, -0.4863957, 1, 0.827451, 0, 1,
-1.041094, -1.217692, -3.461195, 1, 0.8352941, 0, 1,
-1.036199, 0.2635991, -0.7287045, 1, 0.8392157, 0, 1,
-1.028626, 0.8399381, -0.4421397, 1, 0.8470588, 0, 1,
-1.02767, 1.967848, -1.170049, 1, 0.8509804, 0, 1,
-1.024502, -2.024317, -3.396076, 1, 0.8588235, 0, 1,
-1.023388, -0.1049625, -0.5655832, 1, 0.8627451, 0, 1,
-1.022237, -0.5491823, -1.835777, 1, 0.8705882, 0, 1,
-1.018263, 0.04522718, -1.584613, 1, 0.8745098, 0, 1,
-1.010735, -0.3539773, -3.589423, 1, 0.8823529, 0, 1,
-1.010476, 2.498651, -0.8219855, 1, 0.8862745, 0, 1,
-0.9981126, -0.7193522, -3.963991, 1, 0.8941177, 0, 1,
-0.9980306, -1.315557, -2.540667, 1, 0.8980392, 0, 1,
-0.9968236, -0.5794221, -1.352231, 1, 0.9058824, 0, 1,
-0.9844448, 0.114138, -0.562748, 1, 0.9137255, 0, 1,
-0.9825269, 0.1793876, -1.618922, 1, 0.9176471, 0, 1,
-0.9812473, 0.3736606, -2.238565, 1, 0.9254902, 0, 1,
-0.9796098, 0.9353804, -1.606147, 1, 0.9294118, 0, 1,
-0.9671797, 0.3280643, -1.479815, 1, 0.9372549, 0, 1,
-0.9668217, -1.885679, -3.267473, 1, 0.9411765, 0, 1,
-0.9573714, 0.177628, -0.7853504, 1, 0.9490196, 0, 1,
-0.9508417, -3.288767, -3.783918, 1, 0.9529412, 0, 1,
-0.9468317, -0.3593477, -1.672571, 1, 0.9607843, 0, 1,
-0.9455923, 0.8554773, -2.446021, 1, 0.9647059, 0, 1,
-0.9436678, 0.5149272, -1.455474, 1, 0.972549, 0, 1,
-0.9387519, 0.7055299, -0.865069, 1, 0.9764706, 0, 1,
-0.935155, 1.664932, 0.571526, 1, 0.9843137, 0, 1,
-0.9346928, 0.01151121, -0.2580268, 1, 0.9882353, 0, 1,
-0.9329774, 0.5703441, -2.018285, 1, 0.9960784, 0, 1,
-0.9322326, -0.4985025, -1.603156, 0.9960784, 1, 0, 1,
-0.9234496, -0.4471524, -0.8055918, 0.9921569, 1, 0, 1,
-0.9191869, -1.281498, -3.59459, 0.9843137, 1, 0, 1,
-0.9115777, -1.18217, -1.347257, 0.9803922, 1, 0, 1,
-0.8997808, -0.3156807, -0.6514987, 0.972549, 1, 0, 1,
-0.8983802, 0.4121037, 0.1280507, 0.9686275, 1, 0, 1,
-0.8943598, 0.4819791, -1.654598, 0.9607843, 1, 0, 1,
-0.8926912, 0.731075, 0.7406241, 0.9568627, 1, 0, 1,
-0.8902794, -1.660211, -1.102994, 0.9490196, 1, 0, 1,
-0.8796041, 0.2004201, -1.356956, 0.945098, 1, 0, 1,
-0.8718721, -1.42544, -1.229608, 0.9372549, 1, 0, 1,
-0.8694102, -1.841303, -3.51365, 0.9333333, 1, 0, 1,
-0.8684567, 0.5512859, -1.350496, 0.9254902, 1, 0, 1,
-0.8680625, -1.836629, -2.682435, 0.9215686, 1, 0, 1,
-0.8680381, -1.093411, -1.716378, 0.9137255, 1, 0, 1,
-0.8642939, 1.832556, -0.9330586, 0.9098039, 1, 0, 1,
-0.8560761, 1.051547, -2.22937, 0.9019608, 1, 0, 1,
-0.8523366, -0.4144554, -1.652534, 0.8941177, 1, 0, 1,
-0.8383407, 0.03876244, -0.1405073, 0.8901961, 1, 0, 1,
-0.8322666, -0.3147917, -1.957519, 0.8823529, 1, 0, 1,
-0.8321761, -1.034018, -2.619461, 0.8784314, 1, 0, 1,
-0.827911, 0.7632883, -0.0512422, 0.8705882, 1, 0, 1,
-0.825596, 0.1157848, -4.015594, 0.8666667, 1, 0, 1,
-0.8179069, 0.4063122, -0.7833942, 0.8588235, 1, 0, 1,
-0.817391, -1.806329, -1.694497, 0.854902, 1, 0, 1,
-0.8088441, 2.50163, -1.221405, 0.8470588, 1, 0, 1,
-0.8059976, 0.1176896, -2.378986, 0.8431373, 1, 0, 1,
-0.7995036, 1.596127, -1.545561, 0.8352941, 1, 0, 1,
-0.7969721, 0.528038, -0.6070068, 0.8313726, 1, 0, 1,
-0.7930746, 0.7945687, -1.93493, 0.8235294, 1, 0, 1,
-0.7889097, -0.2252948, -0.616553, 0.8196079, 1, 0, 1,
-0.7885993, -1.652808, -3.167232, 0.8117647, 1, 0, 1,
-0.7855988, 1.212055, -0.3503425, 0.8078431, 1, 0, 1,
-0.7840583, 0.1796539, -1.165193, 0.8, 1, 0, 1,
-0.7824821, -1.078873, -1.740625, 0.7921569, 1, 0, 1,
-0.7814103, -1.342252, -3.930928, 0.7882353, 1, 0, 1,
-0.7729855, 0.08798759, -2.134168, 0.7803922, 1, 0, 1,
-0.7699791, -1.164575, -2.994481, 0.7764706, 1, 0, 1,
-0.7614948, 0.01370802, -2.129471, 0.7686275, 1, 0, 1,
-0.761048, 0.8599897, -2.282446, 0.7647059, 1, 0, 1,
-0.7603645, -1.35437, -3.074888, 0.7568628, 1, 0, 1,
-0.7598691, 0.7766512, -0.7147242, 0.7529412, 1, 0, 1,
-0.7592275, 1.409872, -0.6107189, 0.7450981, 1, 0, 1,
-0.7567956, 1.989304, -1.022615, 0.7411765, 1, 0, 1,
-0.7530327, 1.033007, -1.430121, 0.7333333, 1, 0, 1,
-0.752691, 0.7439305, -0.7314822, 0.7294118, 1, 0, 1,
-0.7497954, 0.5158662, -1.662043, 0.7215686, 1, 0, 1,
-0.7497402, 0.01689856, -2.10948, 0.7176471, 1, 0, 1,
-0.7447894, 0.1995413, -2.110689, 0.7098039, 1, 0, 1,
-0.7404785, 1.488237, -0.7649761, 0.7058824, 1, 0, 1,
-0.7401674, -0.5868845, -1.237119, 0.6980392, 1, 0, 1,
-0.7318045, -0.002063886, -1.611283, 0.6901961, 1, 0, 1,
-0.7298979, 0.6812025, -2.535157, 0.6862745, 1, 0, 1,
-0.7281694, -2.075118, -4.22543, 0.6784314, 1, 0, 1,
-0.7278872, 1.587157, -0.9201014, 0.6745098, 1, 0, 1,
-0.7090789, -0.8250694, -2.067892, 0.6666667, 1, 0, 1,
-0.706741, -0.02657695, -3.70861, 0.6627451, 1, 0, 1,
-0.7043409, 1.035015, 0.05918811, 0.654902, 1, 0, 1,
-0.7028307, -0.3661788, -2.252132, 0.6509804, 1, 0, 1,
-0.6998492, -0.9528961, -3.177668, 0.6431373, 1, 0, 1,
-0.6997279, 2.981972, 1.886628, 0.6392157, 1, 0, 1,
-0.6916045, -0.6094838, -2.010552, 0.6313726, 1, 0, 1,
-0.6903623, 0.1262567, -1.857634, 0.627451, 1, 0, 1,
-0.6815802, 0.1060882, -1.719541, 0.6196079, 1, 0, 1,
-0.6798035, -1.334423, -3.03646, 0.6156863, 1, 0, 1,
-0.6741943, 0.6234701, -0.1858934, 0.6078432, 1, 0, 1,
-0.6707477, 1.85133, -0.1143547, 0.6039216, 1, 0, 1,
-0.6695949, 0.8642964, 0.4989299, 0.5960785, 1, 0, 1,
-0.6673863, -0.4568861, -2.5518, 0.5882353, 1, 0, 1,
-0.6634627, -0.5752103, -2.005743, 0.5843138, 1, 0, 1,
-0.6550271, 0.1999387, -0.7016681, 0.5764706, 1, 0, 1,
-0.6512983, 0.1594823, -2.380068, 0.572549, 1, 0, 1,
-0.6436281, -0.9173952, -4.542952, 0.5647059, 1, 0, 1,
-0.6435137, -0.7060312, -1.591566, 0.5607843, 1, 0, 1,
-0.639108, 0.6180869, -1.381283, 0.5529412, 1, 0, 1,
-0.6382923, 0.4904345, -2.140819, 0.5490196, 1, 0, 1,
-0.6352955, 0.4642536, -1.256273, 0.5411765, 1, 0, 1,
-0.6329749, 2.706414, 0.9906406, 0.5372549, 1, 0, 1,
-0.6305198, 2.209653, -0.349508, 0.5294118, 1, 0, 1,
-0.6289946, -0.9877289, -0.724934, 0.5254902, 1, 0, 1,
-0.6278086, 1.031115, 1.258751, 0.5176471, 1, 0, 1,
-0.6243231, -0.6019933, -2.384385, 0.5137255, 1, 0, 1,
-0.6227736, 0.8096266, 0.3468832, 0.5058824, 1, 0, 1,
-0.6135185, 0.7051688, -3.03795, 0.5019608, 1, 0, 1,
-0.6134028, 0.5588264, 2.08476, 0.4941176, 1, 0, 1,
-0.6115402, -0.3871955, -2.588866, 0.4862745, 1, 0, 1,
-0.6012465, 1.326991, -0.8604854, 0.4823529, 1, 0, 1,
-0.6011364, 0.7361121, -2.19089, 0.4745098, 1, 0, 1,
-0.6001278, -0.02011792, -1.106196, 0.4705882, 1, 0, 1,
-0.5939656, -0.3944098, -3.667305, 0.4627451, 1, 0, 1,
-0.5936072, 0.2156576, -0.8411343, 0.4588235, 1, 0, 1,
-0.5894196, 0.9301391, -1.721452, 0.4509804, 1, 0, 1,
-0.582671, -0.4692293, -2.743474, 0.4470588, 1, 0, 1,
-0.5826392, -1.222342, -3.333684, 0.4392157, 1, 0, 1,
-0.579478, -0.7968446, -2.704444, 0.4352941, 1, 0, 1,
-0.5769837, -0.5440505, -2.184025, 0.427451, 1, 0, 1,
-0.5759187, 4.311301, 0.07819898, 0.4235294, 1, 0, 1,
-0.5758229, -1.267846, -4.34322, 0.4156863, 1, 0, 1,
-0.5720676, 0.03168373, -1.41175, 0.4117647, 1, 0, 1,
-0.5687331, -1.005473, -2.339543, 0.4039216, 1, 0, 1,
-0.5618144, -1.291189, -1.148036, 0.3960784, 1, 0, 1,
-0.560815, 1.713372, -1.379251, 0.3921569, 1, 0, 1,
-0.5552106, 0.07308816, -0.4189101, 0.3843137, 1, 0, 1,
-0.5522637, 0.565579, -0.04564061, 0.3803922, 1, 0, 1,
-0.5499636, -2.253491, -4.44126, 0.372549, 1, 0, 1,
-0.5465419, 0.826066, -0.8598829, 0.3686275, 1, 0, 1,
-0.5437604, 0.5088547, -0.7913349, 0.3607843, 1, 0, 1,
-0.542288, 2.538784, -0.251605, 0.3568628, 1, 0, 1,
-0.5317668, -1.555121, -3.789273, 0.3490196, 1, 0, 1,
-0.5311791, -0.6471345, -2.358326, 0.345098, 1, 0, 1,
-0.5243872, -1.292674, -2.963047, 0.3372549, 1, 0, 1,
-0.5225499, -0.4927001, -2.000707, 0.3333333, 1, 0, 1,
-0.5225368, -0.7608134, -1.865216, 0.3254902, 1, 0, 1,
-0.51981, -0.05488491, -1.539274, 0.3215686, 1, 0, 1,
-0.5157588, -0.1880993, -0.1882268, 0.3137255, 1, 0, 1,
-0.511004, -0.6069834, -2.2037, 0.3098039, 1, 0, 1,
-0.5048475, 2.541542, 1.402067, 0.3019608, 1, 0, 1,
-0.5045415, -0.0518827, -0.3300903, 0.2941177, 1, 0, 1,
-0.5025392, 1.151094, -2.106772, 0.2901961, 1, 0, 1,
-0.4995402, -0.4444438, -3.215224, 0.282353, 1, 0, 1,
-0.4953499, 0.6319259, -0.8658907, 0.2784314, 1, 0, 1,
-0.4938911, 1.168919, -0.3858792, 0.2705882, 1, 0, 1,
-0.4851833, -0.1961192, -2.409412, 0.2666667, 1, 0, 1,
-0.4811442, -0.3049911, -0.643864, 0.2588235, 1, 0, 1,
-0.4807825, 0.4391433, 0.1760359, 0.254902, 1, 0, 1,
-0.4804535, -1.232252, -2.239267, 0.2470588, 1, 0, 1,
-0.4782441, -1.056313, -2.336841, 0.2431373, 1, 0, 1,
-0.4773755, -0.4050542, -0.9261352, 0.2352941, 1, 0, 1,
-0.4731271, 1.150088, 0.5773626, 0.2313726, 1, 0, 1,
-0.4724747, 0.1286432, -0.7636627, 0.2235294, 1, 0, 1,
-0.4651413, 0.1451661, -0.8599876, 0.2196078, 1, 0, 1,
-0.4641409, -0.1543356, -2.78923, 0.2117647, 1, 0, 1,
-0.4634336, -1.05453, -3.006771, 0.2078431, 1, 0, 1,
-0.4586008, -0.5389922, -2.019971, 0.2, 1, 0, 1,
-0.4562108, 0.1398794, -1.503069, 0.1921569, 1, 0, 1,
-0.4553168, -1.069791, -4.457423, 0.1882353, 1, 0, 1,
-0.45046, 0.7541478, 0.2139101, 0.1803922, 1, 0, 1,
-0.4465074, 0.1730211, -2.776498, 0.1764706, 1, 0, 1,
-0.4425667, -1.357911, -1.856575, 0.1686275, 1, 0, 1,
-0.4421396, -0.2750807, -1.928827, 0.1647059, 1, 0, 1,
-0.4356549, -1.263258, -1.037701, 0.1568628, 1, 0, 1,
-0.4342558, -1.253088, -3.069538, 0.1529412, 1, 0, 1,
-0.4337577, 1.068568, 1.377795, 0.145098, 1, 0, 1,
-0.4322563, -0.2797141, -2.426533, 0.1411765, 1, 0, 1,
-0.4316699, -0.4916849, -2.435117, 0.1333333, 1, 0, 1,
-0.4299796, -0.6925797, -3.519349, 0.1294118, 1, 0, 1,
-0.4238576, 1.441247, 0.4619884, 0.1215686, 1, 0, 1,
-0.4223099, -0.3748774, -2.732329, 0.1176471, 1, 0, 1,
-0.4219997, 1.591099, -0.4364443, 0.1098039, 1, 0, 1,
-0.4171173, -0.2700491, -3.471344, 0.1058824, 1, 0, 1,
-0.4135769, 0.3050417, -0.5977834, 0.09803922, 1, 0, 1,
-0.4113529, -0.2767455, -1.830789, 0.09019608, 1, 0, 1,
-0.4072157, 0.9609761, -2.02525, 0.08627451, 1, 0, 1,
-0.397891, -0.09723694, -1.535455, 0.07843138, 1, 0, 1,
-0.3963208, -0.2509392, -1.588402, 0.07450981, 1, 0, 1,
-0.3948889, 0.5560893, -0.5970709, 0.06666667, 1, 0, 1,
-0.3865158, -0.5815553, -2.749545, 0.0627451, 1, 0, 1,
-0.3863379, -0.4837672, -1.79661, 0.05490196, 1, 0, 1,
-0.3855556, -2.494507, -4.020996, 0.05098039, 1, 0, 1,
-0.3835728, 0.5082276, -0.2643698, 0.04313726, 1, 0, 1,
-0.3798559, 0.8668147, -2.402317, 0.03921569, 1, 0, 1,
-0.378747, -1.862085, -3.195928, 0.03137255, 1, 0, 1,
-0.3747704, 0.2684904, 0.7457817, 0.02745098, 1, 0, 1,
-0.3745144, 0.8078732, 0.6467015, 0.01960784, 1, 0, 1,
-0.3717511, 1.259822, 0.3220474, 0.01568628, 1, 0, 1,
-0.3713858, -0.3060425, -3.323872, 0.007843138, 1, 0, 1,
-0.3711299, -1.806443, -4.911982, 0.003921569, 1, 0, 1,
-0.3667806, -0.1144804, -2.580234, 0, 1, 0.003921569, 1,
-0.3666698, 0.4030504, -0.6837267, 0, 1, 0.01176471, 1,
-0.3660024, 0.7748063, -1.195558, 0, 1, 0.01568628, 1,
-0.363602, -0.6819659, -2.286958, 0, 1, 0.02352941, 1,
-0.3621448, 0.9993076, -0.9359294, 0, 1, 0.02745098, 1,
-0.3530268, 0.850028, -0.8060815, 0, 1, 0.03529412, 1,
-0.346541, 1.785092, 0.2323373, 0, 1, 0.03921569, 1,
-0.343436, -0.6006151, -2.683391, 0, 1, 0.04705882, 1,
-0.3432891, -0.535522, -0.5427941, 0, 1, 0.05098039, 1,
-0.3416976, -0.3965684, -1.740607, 0, 1, 0.05882353, 1,
-0.3410909, 1.109134, -1.097012, 0, 1, 0.0627451, 1,
-0.3400564, 0.4020312, -0.6629871, 0, 1, 0.07058824, 1,
-0.3333188, -1.895046, -3.773419, 0, 1, 0.07450981, 1,
-0.3332996, -0.5151446, -3.119141, 0, 1, 0.08235294, 1,
-0.3286028, -0.5535035, -0.8875041, 0, 1, 0.08627451, 1,
-0.3284872, -0.1947393, -2.690095, 0, 1, 0.09411765, 1,
-0.3257116, -0.2653722, -2.155677, 0, 1, 0.1019608, 1,
-0.324183, -0.186212, -1.569273, 0, 1, 0.1058824, 1,
-0.3194584, -1.123074, -1.68742, 0, 1, 0.1137255, 1,
-0.3183927, 0.05793541, -2.416024, 0, 1, 0.1176471, 1,
-0.3165448, -0.9877033, -1.992507, 0, 1, 0.1254902, 1,
-0.3149447, -0.6532719, -3.715838, 0, 1, 0.1294118, 1,
-0.3133759, 1.830456, -0.9831721, 0, 1, 0.1372549, 1,
-0.3064287, -0.5506435, -2.911706, 0, 1, 0.1411765, 1,
-0.3055669, 0.5269905, -1.073933, 0, 1, 0.1490196, 1,
-0.3039375, -1.234894, -2.171216, 0, 1, 0.1529412, 1,
-0.3000819, -1.155981, -2.494575, 0, 1, 0.1607843, 1,
-0.2915122, 1.016986, -1.515425, 0, 1, 0.1647059, 1,
-0.2906823, -0.7538938, -3.609803, 0, 1, 0.172549, 1,
-0.286175, 0.1170551, 0.1988652, 0, 1, 0.1764706, 1,
-0.2858389, 0.9964752, -0.4972534, 0, 1, 0.1843137, 1,
-0.2855809, -1.612769, -3.297417, 0, 1, 0.1882353, 1,
-0.2852146, -0.7065003, -5.171096, 0, 1, 0.1960784, 1,
-0.2835245, -0.6716493, -4.473346, 0, 1, 0.2039216, 1,
-0.2777444, -2.003842, -2.926188, 0, 1, 0.2078431, 1,
-0.2776048, 1.649731, -0.4656761, 0, 1, 0.2156863, 1,
-0.2766635, 1.739127, 1.813598, 0, 1, 0.2196078, 1,
-0.2756392, -1.46399, -4.163915, 0, 1, 0.227451, 1,
-0.2720977, -2.064149, -4.422654, 0, 1, 0.2313726, 1,
-0.2709656, 0.8296302, -0.08264643, 0, 1, 0.2392157, 1,
-0.2687183, -0.3606551, -0.5476065, 0, 1, 0.2431373, 1,
-0.2630976, -0.6391099, -1.932857, 0, 1, 0.2509804, 1,
-0.2603448, 1.806819, -2.532595, 0, 1, 0.254902, 1,
-0.2579373, 0.4937165, 0.1693333, 0, 1, 0.2627451, 1,
-0.255709, 1.139489, 0.8126441, 0, 1, 0.2666667, 1,
-0.2551947, 0.6340563, -1.28819, 0, 1, 0.2745098, 1,
-0.2541936, 0.5174631, 0.1997798, 0, 1, 0.2784314, 1,
-0.2537806, -1.459053, -3.06585, 0, 1, 0.2862745, 1,
-0.2485776, 0.7091389, -1.459691, 0, 1, 0.2901961, 1,
-0.2467054, 1.068153, -0.2146222, 0, 1, 0.2980392, 1,
-0.2389481, -0.1245461, -2.060802, 0, 1, 0.3058824, 1,
-0.2382563, 0.2619978, -0.02507656, 0, 1, 0.3098039, 1,
-0.2376763, 1.457635, -0.1865332, 0, 1, 0.3176471, 1,
-0.2328704, 0.1756011, 1.012195, 0, 1, 0.3215686, 1,
-0.2293354, 0.2229261, -2.337604, 0, 1, 0.3294118, 1,
-0.2206984, 0.4699118, -0.7262419, 0, 1, 0.3333333, 1,
-0.2148905, 0.3023827, -0.2977647, 0, 1, 0.3411765, 1,
-0.214568, -0.2341963, -1.843287, 0, 1, 0.345098, 1,
-0.2135787, 1.054989, -0.7507083, 0, 1, 0.3529412, 1,
-0.211186, -0.6913047, -1.790872, 0, 1, 0.3568628, 1,
-0.2060444, -1.247684, -3.447649, 0, 1, 0.3647059, 1,
-0.2059859, -0.3837881, -2.35217, 0, 1, 0.3686275, 1,
-0.2036281, -2.544865, -3.919513, 0, 1, 0.3764706, 1,
-0.1972107, -0.7705567, -2.868501, 0, 1, 0.3803922, 1,
-0.1966091, 0.2103259, -1.776253, 0, 1, 0.3882353, 1,
-0.1934332, 0.4241355, -0.04798973, 0, 1, 0.3921569, 1,
-0.1904783, -0.4129447, -4.10428, 0, 1, 0.4, 1,
-0.1833392, 1.038442, 0.8748138, 0, 1, 0.4078431, 1,
-0.1818623, 1.54069, 0.9327347, 0, 1, 0.4117647, 1,
-0.177294, 0.3445118, -1.212074, 0, 1, 0.4196078, 1,
-0.1744139, -0.9366645, -3.408325, 0, 1, 0.4235294, 1,
-0.1739727, -0.445965, -1.734856, 0, 1, 0.4313726, 1,
-0.1695879, -1.5562, -2.892232, 0, 1, 0.4352941, 1,
-0.1661373, -1.121247, -1.872976, 0, 1, 0.4431373, 1,
-0.1656747, 0.09121047, -1.272284, 0, 1, 0.4470588, 1,
-0.1649604, -2.876631, -2.629997, 0, 1, 0.454902, 1,
-0.1600607, 1.561175, -0.1703819, 0, 1, 0.4588235, 1,
-0.1589447, 0.1329603, -1.917162, 0, 1, 0.4666667, 1,
-0.1575427, -0.6145036, -4.036456, 0, 1, 0.4705882, 1,
-0.1554696, 0.3862355, -0.6645097, 0, 1, 0.4784314, 1,
-0.1416737, 0.2294411, -0.2248584, 0, 1, 0.4823529, 1,
-0.1410094, -0.4683711, -3.445032, 0, 1, 0.4901961, 1,
-0.1352604, 0.2290716, 0.7299608, 0, 1, 0.4941176, 1,
-0.1338605, 0.6885091, 1.352161, 0, 1, 0.5019608, 1,
-0.1320293, 0.3402652, 1.322734, 0, 1, 0.509804, 1,
-0.131026, 0.6595365, -0.108775, 0, 1, 0.5137255, 1,
-0.1275545, 1.667961, 0.05149724, 0, 1, 0.5215687, 1,
-0.1272409, 2.057984, -0.143719, 0, 1, 0.5254902, 1,
-0.1243639, 1.858622, -0.8619906, 0, 1, 0.5333334, 1,
-0.1227988, 0.9631215, -0.2231019, 0, 1, 0.5372549, 1,
-0.1196356, 0.4099553, -0.9682477, 0, 1, 0.5450981, 1,
-0.113616, 0.4904353, -0.8435425, 0, 1, 0.5490196, 1,
-0.1073144, 0.8134351, -0.1646076, 0, 1, 0.5568628, 1,
-0.106643, -0.262551, -3.519052, 0, 1, 0.5607843, 1,
-0.1039834, -0.6446835, -2.494952, 0, 1, 0.5686275, 1,
-0.1038608, -1.656895, -3.334524, 0, 1, 0.572549, 1,
-0.1026126, 0.5651433, 0.7520002, 0, 1, 0.5803922, 1,
-0.1013928, -0.38923, -3.250172, 0, 1, 0.5843138, 1,
-0.09958228, 1.127753, 2.018847, 0, 1, 0.5921569, 1,
-0.09832454, -0.3705373, -2.545634, 0, 1, 0.5960785, 1,
-0.09756487, -0.02807039, -0.7093597, 0, 1, 0.6039216, 1,
-0.09682699, -1.254666, -3.425488, 0, 1, 0.6117647, 1,
-0.0960684, -0.4033537, -1.416904, 0, 1, 0.6156863, 1,
-0.09147025, -0.3418545, -3.685142, 0, 1, 0.6235294, 1,
-0.09126496, -0.2636099, -2.090904, 0, 1, 0.627451, 1,
-0.09057999, -0.2019272, -2.01863, 0, 1, 0.6352941, 1,
-0.08828587, -1.461513, -2.459454, 0, 1, 0.6392157, 1,
-0.08500525, -0.1461044, -2.546187, 0, 1, 0.6470588, 1,
-0.08435334, 0.4568333, -0.1422624, 0, 1, 0.6509804, 1,
-0.0830093, 2.374386, 0.8135479, 0, 1, 0.6588235, 1,
-0.08262117, 1.990122, -0.9112476, 0, 1, 0.6627451, 1,
-0.08163368, 0.09139495, -1.414732, 0, 1, 0.6705883, 1,
-0.07554757, -0.0283673, -1.776929, 0, 1, 0.6745098, 1,
-0.07532606, 1.138752, -0.7128034, 0, 1, 0.682353, 1,
-0.07290646, -1.277117, -3.826279, 0, 1, 0.6862745, 1,
-0.07154771, 0.1550861, 0.5437112, 0, 1, 0.6941177, 1,
-0.07141373, 0.1391985, -1.767463, 0, 1, 0.7019608, 1,
-0.06684215, 1.544035, 0.1628833, 0, 1, 0.7058824, 1,
-0.06653329, -0.9066219, -3.716741, 0, 1, 0.7137255, 1,
-0.06634602, 0.6560702, -1.861148, 0, 1, 0.7176471, 1,
-0.06450582, -1.57668, -4.13018, 0, 1, 0.7254902, 1,
-0.06146149, -1.247526, -2.689416, 0, 1, 0.7294118, 1,
-0.06102888, 0.5837224, -0.6974584, 0, 1, 0.7372549, 1,
-0.06093504, -0.9596534, -3.81197, 0, 1, 0.7411765, 1,
-0.0596358, -2.007825, -3.339971, 0, 1, 0.7490196, 1,
-0.05781293, -0.7878202, -2.11533, 0, 1, 0.7529412, 1,
-0.05488203, 0.2648202, -0.390551, 0, 1, 0.7607843, 1,
-0.05426569, 0.8670387, 0.393249, 0, 1, 0.7647059, 1,
-0.05312219, 0.1191049, -0.318833, 0, 1, 0.772549, 1,
-0.05257399, 0.4607276, -0.3503014, 0, 1, 0.7764706, 1,
-0.04475306, 0.4668632, -0.06559162, 0, 1, 0.7843137, 1,
-0.04472818, -0.5110031, -4.566823, 0, 1, 0.7882353, 1,
-0.04431024, 0.6159188, -0.9300369, 0, 1, 0.7960784, 1,
-0.04313192, 0.3584909, 0.5244697, 0, 1, 0.8039216, 1,
-0.03870293, 0.899595, -0.2384839, 0, 1, 0.8078431, 1,
-0.03464327, -0.9055517, -3.578502, 0, 1, 0.8156863, 1,
-0.03364887, -2.168917, -4.75007, 0, 1, 0.8196079, 1,
-0.02218191, 1.408008, -0.9153239, 0, 1, 0.827451, 1,
-0.02123242, -1.178562, -2.833389, 0, 1, 0.8313726, 1,
-0.01681039, -1.308082, -3.256481, 0, 1, 0.8392157, 1,
-0.01508996, 2.41296, -2.219899, 0, 1, 0.8431373, 1,
-0.01394494, 1.146402, 0.6745433, 0, 1, 0.8509804, 1,
-0.01311765, 0.2183573, -0.1330054, 0, 1, 0.854902, 1,
-0.008357498, -0.9555351, -4.413379, 0, 1, 0.8627451, 1,
-0.00537493, 1.675398, -0.5525048, 0, 1, 0.8666667, 1,
0.001463928, 0.1829012, 0.2469679, 0, 1, 0.8745098, 1,
0.001531589, 0.1131165, 0.9471251, 0, 1, 0.8784314, 1,
0.008970169, 0.1999428, -1.01771, 0, 1, 0.8862745, 1,
0.009690054, 0.6007236, -1.48484, 0, 1, 0.8901961, 1,
0.02047012, -0.5651401, 3.304762, 0, 1, 0.8980392, 1,
0.02074723, 0.7529114, 0.978942, 0, 1, 0.9058824, 1,
0.02107001, 0.6476991, 1.033749, 0, 1, 0.9098039, 1,
0.02558252, -1.2494, 3.360076, 0, 1, 0.9176471, 1,
0.02744852, 1.238729, 1.11321, 0, 1, 0.9215686, 1,
0.0282025, -2.105222, 2.539547, 0, 1, 0.9294118, 1,
0.02918099, -0.8210334, 3.458205, 0, 1, 0.9333333, 1,
0.02965672, -0.03101965, 3.063365, 0, 1, 0.9411765, 1,
0.03097067, -0.4937202, 3.093754, 0, 1, 0.945098, 1,
0.03143032, 0.6259504, -0.4139386, 0, 1, 0.9529412, 1,
0.03143078, 0.8964019, 0.3118693, 0, 1, 0.9568627, 1,
0.03511305, -0.6948863, 3.576814, 0, 1, 0.9647059, 1,
0.04035007, -0.4931803, 3.524179, 0, 1, 0.9686275, 1,
0.04254036, 2.361237, -1.426447, 0, 1, 0.9764706, 1,
0.04575894, 1.44577, -1.612562, 0, 1, 0.9803922, 1,
0.04635869, 0.09163117, -0.9436317, 0, 1, 0.9882353, 1,
0.04753535, 0.02558399, -0.2466681, 0, 1, 0.9921569, 1,
0.04769696, -1.14372, 3.797945, 0, 1, 1, 1,
0.04860979, -0.2784968, 4.346884, 0, 0.9921569, 1, 1,
0.04882477, -1.47721, 2.952509, 0, 0.9882353, 1, 1,
0.05183174, -1.266487, 3.437637, 0, 0.9803922, 1, 1,
0.05373907, 0.4052233, 2.769267, 0, 0.9764706, 1, 1,
0.05545236, -1.34105, 3.408511, 0, 0.9686275, 1, 1,
0.06499725, -0.9691271, 3.476965, 0, 0.9647059, 1, 1,
0.06661455, 0.4434398, 0.1871641, 0, 0.9568627, 1, 1,
0.06817339, 1.78108, 2.179246, 0, 0.9529412, 1, 1,
0.06833604, 0.09164784, 1.651532, 0, 0.945098, 1, 1,
0.06851736, 0.6062791, -1.721222, 0, 0.9411765, 1, 1,
0.07241657, 0.3194236, 1.382263, 0, 0.9333333, 1, 1,
0.07347199, -0.2133227, 1.84838, 0, 0.9294118, 1, 1,
0.07458192, -1.117961, 2.747933, 0, 0.9215686, 1, 1,
0.07507882, -0.2355778, 4.169902, 0, 0.9176471, 1, 1,
0.08090501, 1.735716, 1.210268, 0, 0.9098039, 1, 1,
0.08213537, -0.8224624, 5.727382, 0, 0.9058824, 1, 1,
0.09172596, -0.3741718, 2.35349, 0, 0.8980392, 1, 1,
0.09425213, 0.5205067, -0.06026987, 0, 0.8901961, 1, 1,
0.0949785, -1.788907, 4.050537, 0, 0.8862745, 1, 1,
0.09795073, 0.4564991, -0.4640015, 0, 0.8784314, 1, 1,
0.09934598, 0.5691257, -1.006788, 0, 0.8745098, 1, 1,
0.09937521, 0.9270685, -0.2607539, 0, 0.8666667, 1, 1,
0.1051745, 0.8603436, -0.1774647, 0, 0.8627451, 1, 1,
0.1087432, 0.3229686, 0.6347972, 0, 0.854902, 1, 1,
0.1103435, -0.4219418, 3.699184, 0, 0.8509804, 1, 1,
0.1228941, 1.550195, -0.3317474, 0, 0.8431373, 1, 1,
0.1233082, 0.8576978, 0.1378791, 0, 0.8392157, 1, 1,
0.1246011, -0.6732649, 2.189389, 0, 0.8313726, 1, 1,
0.1264876, 0.4196176, 0.5653039, 0, 0.827451, 1, 1,
0.131208, -0.2678616, 2.165689, 0, 0.8196079, 1, 1,
0.1312671, 0.7037655, -0.09441206, 0, 0.8156863, 1, 1,
0.1410308, -1.234446, 1.939304, 0, 0.8078431, 1, 1,
0.1442363, -0.2440349, 1.792802, 0, 0.8039216, 1, 1,
0.1459993, -0.3300374, 2.842868, 0, 0.7960784, 1, 1,
0.1475208, 0.2154232, -2.325418, 0, 0.7882353, 1, 1,
0.1487979, -0.2000477, 3.089241, 0, 0.7843137, 1, 1,
0.1512817, 1.130519, 0.4416003, 0, 0.7764706, 1, 1,
0.1565462, -0.6272508, 2.956694, 0, 0.772549, 1, 1,
0.1570261, 1.846923, -0.06915912, 0, 0.7647059, 1, 1,
0.1593324, -0.9341771, 4.856743, 0, 0.7607843, 1, 1,
0.1630863, -0.3717279, 1.717521, 0, 0.7529412, 1, 1,
0.1632736, 0.5078273, -1.643414, 0, 0.7490196, 1, 1,
0.166999, -1.732581, 2.082935, 0, 0.7411765, 1, 1,
0.168646, -0.3795347, 2.983298, 0, 0.7372549, 1, 1,
0.1718083, 0.7180272, 0.7904924, 0, 0.7294118, 1, 1,
0.172103, -1.719979, 4.239972, 0, 0.7254902, 1, 1,
0.1732342, -0.7204797, 4.190749, 0, 0.7176471, 1, 1,
0.1736989, -0.2213245, 4.879777, 0, 0.7137255, 1, 1,
0.1777158, -0.08723371, 2.565408, 0, 0.7058824, 1, 1,
0.1778089, 0.1357951, 1.493977, 0, 0.6980392, 1, 1,
0.1781784, -0.521791, 2.888968, 0, 0.6941177, 1, 1,
0.1796002, 0.1430496, 3.418369, 0, 0.6862745, 1, 1,
0.1805777, 1.584383, -1.060918, 0, 0.682353, 1, 1,
0.1831295, 0.3964662, 0.2665271, 0, 0.6745098, 1, 1,
0.1853103, -1.190369, 3.005915, 0, 0.6705883, 1, 1,
0.1954502, 0.1124513, 0.6705221, 0, 0.6627451, 1, 1,
0.1959313, -1.69531, 3.077847, 0, 0.6588235, 1, 1,
0.1969303, -0.5918148, 2.493392, 0, 0.6509804, 1, 1,
0.1996967, 0.801458, 1.389207, 0, 0.6470588, 1, 1,
0.2013705, 0.04596728, 0.4107968, 0, 0.6392157, 1, 1,
0.202322, -2.575601, 3.196723, 0, 0.6352941, 1, 1,
0.2036691, -1.483213, 2.775582, 0, 0.627451, 1, 1,
0.2046266, -0.01615892, -0.3266329, 0, 0.6235294, 1, 1,
0.2065741, 1.492462, -0.3187152, 0, 0.6156863, 1, 1,
0.2112058, -0.2142577, 2.115758, 0, 0.6117647, 1, 1,
0.2133831, -0.3590263, 3.758694, 0, 0.6039216, 1, 1,
0.2153865, 0.6578208, -0.1132069, 0, 0.5960785, 1, 1,
0.2187244, 0.0568608, 0.7608339, 0, 0.5921569, 1, 1,
0.2193098, 0.1485718, -0.09055714, 0, 0.5843138, 1, 1,
0.2195481, -0.2788308, 2.093945, 0, 0.5803922, 1, 1,
0.2218104, 0.1931603, 0.141218, 0, 0.572549, 1, 1,
0.2272555, 0.07518942, -0.4795062, 0, 0.5686275, 1, 1,
0.2288901, 0.2318605, 1.537735, 0, 0.5607843, 1, 1,
0.2296148, 0.5954096, 0.4511417, 0, 0.5568628, 1, 1,
0.2304092, 0.2527695, 0.587544, 0, 0.5490196, 1, 1,
0.2364721, -0.977925, 1.725958, 0, 0.5450981, 1, 1,
0.2412421, -0.8553492, 3.618251, 0, 0.5372549, 1, 1,
0.2459195, -0.8862782, 3.484389, 0, 0.5333334, 1, 1,
0.2464605, 0.01473418, 0.6674729, 0, 0.5254902, 1, 1,
0.2489223, 2.022174, 0.7079395, 0, 0.5215687, 1, 1,
0.2514585, -1.953831, 2.705373, 0, 0.5137255, 1, 1,
0.2530388, -1.732341, 2.800865, 0, 0.509804, 1, 1,
0.2550638, -0.9518821, 3.257861, 0, 0.5019608, 1, 1,
0.2576934, -0.9408706, 2.32856, 0, 0.4941176, 1, 1,
0.2593338, 0.140725, 0.3793742, 0, 0.4901961, 1, 1,
0.261673, 2.574766, 1.111567, 0, 0.4823529, 1, 1,
0.2619731, 0.260778, 0.8054559, 0, 0.4784314, 1, 1,
0.2622375, -0.3915102, 2.71031, 0, 0.4705882, 1, 1,
0.2624394, -0.888413, 0.7554085, 0, 0.4666667, 1, 1,
0.2639788, -1.128233, 1.918993, 0, 0.4588235, 1, 1,
0.2642165, 1.137634, -1.065525, 0, 0.454902, 1, 1,
0.2654384, 1.325949, 1.074045, 0, 0.4470588, 1, 1,
0.266522, -0.01705371, 0.7241791, 0, 0.4431373, 1, 1,
0.2677717, -0.3540083, 3.155555, 0, 0.4352941, 1, 1,
0.26902, -0.9630469, 3.053118, 0, 0.4313726, 1, 1,
0.27083, -0.9692495, 3.095526, 0, 0.4235294, 1, 1,
0.2710463, 0.581908, -0.1984889, 0, 0.4196078, 1, 1,
0.2715799, 0.02210846, 0.7295415, 0, 0.4117647, 1, 1,
0.2718892, 0.9975165, 0.8348581, 0, 0.4078431, 1, 1,
0.2730674, 0.1653271, 1.618171, 0, 0.4, 1, 1,
0.2735428, 1.08593, 0.2341874, 0, 0.3921569, 1, 1,
0.2759713, -1.721227, 2.564188, 0, 0.3882353, 1, 1,
0.2768382, 1.589684, -0.2209831, 0, 0.3803922, 1, 1,
0.2788494, -0.5016231, 4.053246, 0, 0.3764706, 1, 1,
0.2793418, 0.265548, -0.06399255, 0, 0.3686275, 1, 1,
0.2802122, 0.3922578, 0.193658, 0, 0.3647059, 1, 1,
0.2815249, -1.285294, 3.290828, 0, 0.3568628, 1, 1,
0.2818018, -0.5522483, 3.684021, 0, 0.3529412, 1, 1,
0.2879081, -1.319528, 3.932726, 0, 0.345098, 1, 1,
0.2880154, 0.3612214, -0.343493, 0, 0.3411765, 1, 1,
0.2888678, -0.7040767, 2.197091, 0, 0.3333333, 1, 1,
0.2890556, -1.208577, 3.829176, 0, 0.3294118, 1, 1,
0.2895488, -2.422274, 3.311146, 0, 0.3215686, 1, 1,
0.2941048, 1.62619, 0.5012641, 0, 0.3176471, 1, 1,
0.2951191, -0.7675835, 2.005965, 0, 0.3098039, 1, 1,
0.2953997, 1.030263, 1.114352, 0, 0.3058824, 1, 1,
0.3017204, -0.3825788, 3.516185, 0, 0.2980392, 1, 1,
0.3025833, -0.5939564, 1.417541, 0, 0.2901961, 1, 1,
0.304285, -0.4700334, 2.651343, 0, 0.2862745, 1, 1,
0.3087387, -0.7758049, 1.436016, 0, 0.2784314, 1, 1,
0.3090988, 0.8777074, 1.196096, 0, 0.2745098, 1, 1,
0.314117, 0.6515198, 1.202359, 0, 0.2666667, 1, 1,
0.3164602, -1.034752, 1.473069, 0, 0.2627451, 1, 1,
0.317246, 0.5581818, 0.3050523, 0, 0.254902, 1, 1,
0.3198732, -0.072436, 2.509848, 0, 0.2509804, 1, 1,
0.3230059, 0.745585, 1.06209, 0, 0.2431373, 1, 1,
0.3231579, 0.8834647, 1.60752, 0, 0.2392157, 1, 1,
0.3259949, -0.8906405, 2.311756, 0, 0.2313726, 1, 1,
0.3264652, -0.9206544, 2.818459, 0, 0.227451, 1, 1,
0.3359089, 0.6298783, -0.4912876, 0, 0.2196078, 1, 1,
0.3388704, -1.312062, 1.377172, 0, 0.2156863, 1, 1,
0.3391512, 0.9305142, -3.13998, 0, 0.2078431, 1, 1,
0.3513871, 0.2574963, 0.7825267, 0, 0.2039216, 1, 1,
0.3558331, 0.6050564, 0.75951, 0, 0.1960784, 1, 1,
0.3560994, -1.008012, 2.602028, 0, 0.1882353, 1, 1,
0.3575098, -1.107358, 2.708112, 0, 0.1843137, 1, 1,
0.3596325, -2.143374, 2.732646, 0, 0.1764706, 1, 1,
0.3607149, 1.256596, -0.4265079, 0, 0.172549, 1, 1,
0.3626295, 0.06365462, 0.8246415, 0, 0.1647059, 1, 1,
0.3667026, 0.3361945, -0.861631, 0, 0.1607843, 1, 1,
0.3694243, -1.064603, 3.514602, 0, 0.1529412, 1, 1,
0.3697479, 1.386531, 0.5886827, 0, 0.1490196, 1, 1,
0.3725341, -0.4637972, 1.89414, 0, 0.1411765, 1, 1,
0.3737552, -0.6159232, 2.909008, 0, 0.1372549, 1, 1,
0.3738316, -1.836175, 2.611511, 0, 0.1294118, 1, 1,
0.3739342, -0.5696406, 1.62913, 0, 0.1254902, 1, 1,
0.3743412, 0.216108, 0.9761989, 0, 0.1176471, 1, 1,
0.3778892, -1.339911, 1.164814, 0, 0.1137255, 1, 1,
0.3787823, 1.560044, -0.4119855, 0, 0.1058824, 1, 1,
0.3787827, -0.3776366, 2.907953, 0, 0.09803922, 1, 1,
0.3829929, 0.7919481, 0.2504168, 0, 0.09411765, 1, 1,
0.3841473, -0.5840591, 1.080527, 0, 0.08627451, 1, 1,
0.3881135, 1.065672, -0.8184366, 0, 0.08235294, 1, 1,
0.3889953, 1.367368, 1.215139, 0, 0.07450981, 1, 1,
0.3932188, 0.7808166, 0.3686183, 0, 0.07058824, 1, 1,
0.3938482, 0.2082525, -0.4352492, 0, 0.0627451, 1, 1,
0.3978664, 1.525632, 1.601107, 0, 0.05882353, 1, 1,
0.3993507, -0.2472034, 0.2823309, 0, 0.05098039, 1, 1,
0.4001683, -0.5804066, 1.803803, 0, 0.04705882, 1, 1,
0.4016177, -0.750239, 2.376848, 0, 0.03921569, 1, 1,
0.4021071, -2.579342, 3.606495, 0, 0.03529412, 1, 1,
0.405271, 0.428405, 2.124602, 0, 0.02745098, 1, 1,
0.4056382, -0.3494213, 1.696651, 0, 0.02352941, 1, 1,
0.4095455, 1.839602, -0.7226979, 0, 0.01568628, 1, 1,
0.4171887, 0.8892367, 0.8863057, 0, 0.01176471, 1, 1,
0.4194297, -1.083051, 3.472633, 0, 0.003921569, 1, 1,
0.423198, 0.9036191, -0.205261, 0.003921569, 0, 1, 1,
0.4284114, 0.8054075, -0.6169246, 0.007843138, 0, 1, 1,
0.432523, -0.3587658, 3.262446, 0.01568628, 0, 1, 1,
0.4329147, -0.3741083, 2.964745, 0.01960784, 0, 1, 1,
0.4350358, -0.02357794, 2.904873, 0.02745098, 0, 1, 1,
0.4351797, -0.1266817, 1.856764, 0.03137255, 0, 1, 1,
0.438574, 0.4663811, 0.7548062, 0.03921569, 0, 1, 1,
0.4390844, 1.141986, 0.5517775, 0.04313726, 0, 1, 1,
0.4408182, -0.6170239, 1.77646, 0.05098039, 0, 1, 1,
0.4434969, 1.688181, 1.741167, 0.05490196, 0, 1, 1,
0.4459429, -1.268326, 1.674926, 0.0627451, 0, 1, 1,
0.4482863, 1.037345, 1.816974, 0.06666667, 0, 1, 1,
0.4483996, -0.7049094, 0.9420255, 0.07450981, 0, 1, 1,
0.4499652, 0.7757475, 0.588596, 0.07843138, 0, 1, 1,
0.4523896, 0.6535258, 1.517786, 0.08627451, 0, 1, 1,
0.45786, -1.038417, 2.658794, 0.09019608, 0, 1, 1,
0.4616424, -0.8545987, 1.927033, 0.09803922, 0, 1, 1,
0.467792, -1.642208, 4.355275, 0.1058824, 0, 1, 1,
0.4721538, -1.060872, 3.480286, 0.1098039, 0, 1, 1,
0.4751859, 2.599265, -0.6192025, 0.1176471, 0, 1, 1,
0.4766288, 1.583232, 1.282124, 0.1215686, 0, 1, 1,
0.4791573, -2.279058, 3.694472, 0.1294118, 0, 1, 1,
0.4837727, 0.01494666, 2.109549, 0.1333333, 0, 1, 1,
0.4881427, -1.628786, 2.886837, 0.1411765, 0, 1, 1,
0.4894086, 0.8806546, 0.4843261, 0.145098, 0, 1, 1,
0.493019, -0.6593991, 4.23344, 0.1529412, 0, 1, 1,
0.493177, -1.841754, 1.688479, 0.1568628, 0, 1, 1,
0.4965295, -2.077749, 4.180398, 0.1647059, 0, 1, 1,
0.4995701, -0.7425014, 1.444901, 0.1686275, 0, 1, 1,
0.5030222, 0.2929313, 1.633206, 0.1764706, 0, 1, 1,
0.5042462, -0.4952058, 2.097451, 0.1803922, 0, 1, 1,
0.5053739, -1.059367, 2.957236, 0.1882353, 0, 1, 1,
0.5078316, -0.08262324, 1.479517, 0.1921569, 0, 1, 1,
0.5094718, -0.05852383, 1.050005, 0.2, 0, 1, 1,
0.5097721, -0.0100152, 2.049178, 0.2078431, 0, 1, 1,
0.5104598, 1.075118, 1.397431, 0.2117647, 0, 1, 1,
0.5131825, 1.453644, 1.606444, 0.2196078, 0, 1, 1,
0.5193208, -1.207025, 3.918522, 0.2235294, 0, 1, 1,
0.5233484, -0.9131058, 2.08034, 0.2313726, 0, 1, 1,
0.524595, 0.05616769, 1.430814, 0.2352941, 0, 1, 1,
0.5335608, 1.121755, 0.4945424, 0.2431373, 0, 1, 1,
0.5339184, 0.6410398, -1.116168, 0.2470588, 0, 1, 1,
0.5384166, 1.305917, 0.2802162, 0.254902, 0, 1, 1,
0.5384294, 0.9454127, 0.7144996, 0.2588235, 0, 1, 1,
0.5386461, 0.5035902, 0.7517902, 0.2666667, 0, 1, 1,
0.5406807, -0.5050954, 1.387836, 0.2705882, 0, 1, 1,
0.5481577, 0.7935843, -0.2273582, 0.2784314, 0, 1, 1,
0.5486467, -0.04778024, 1.222358, 0.282353, 0, 1, 1,
0.5491679, -0.3971156, 3.360791, 0.2901961, 0, 1, 1,
0.5513484, -0.1750132, 0.1222161, 0.2941177, 0, 1, 1,
0.5514102, 0.3320997, 0.252899, 0.3019608, 0, 1, 1,
0.5545417, -0.07065199, 2.457068, 0.3098039, 0, 1, 1,
0.5545936, 0.6796714, 1.504909, 0.3137255, 0, 1, 1,
0.5562457, -1.651617, 3.797126, 0.3215686, 0, 1, 1,
0.5580274, 0.3243091, 0.008860986, 0.3254902, 0, 1, 1,
0.5586789, -0.7439172, 1.909166, 0.3333333, 0, 1, 1,
0.5592493, -1.041507, 3.083754, 0.3372549, 0, 1, 1,
0.5631646, -0.8420897, 4.253568, 0.345098, 0, 1, 1,
0.5647, 0.03176734, 1.908288, 0.3490196, 0, 1, 1,
0.5655909, 1.025531, 1.786706, 0.3568628, 0, 1, 1,
0.5676824, -0.7112926, 2.205523, 0.3607843, 0, 1, 1,
0.568157, 0.07778303, 1.027052, 0.3686275, 0, 1, 1,
0.5721997, -1.486202, 4.712455, 0.372549, 0, 1, 1,
0.5734596, 1.148662, 2.526857, 0.3803922, 0, 1, 1,
0.5760533, 1.166469, -0.07149892, 0.3843137, 0, 1, 1,
0.5765963, 1.823935, 2.536742, 0.3921569, 0, 1, 1,
0.5814354, 0.573454, 0.5728673, 0.3960784, 0, 1, 1,
0.5824086, -0.05290167, -0.7822056, 0.4039216, 0, 1, 1,
0.584505, 0.6431305, 2.64273, 0.4117647, 0, 1, 1,
0.5847135, 0.06444822, -1.695701, 0.4156863, 0, 1, 1,
0.5901991, -0.205027, 2.535867, 0.4235294, 0, 1, 1,
0.5926356, 2.111006, -1.698276, 0.427451, 0, 1, 1,
0.5927464, -1.307914, 3.194509, 0.4352941, 0, 1, 1,
0.595589, 1.385116, 0.9615548, 0.4392157, 0, 1, 1,
0.5979435, -0.1480213, 1.478806, 0.4470588, 0, 1, 1,
0.5992639, -0.9075071, 3.593383, 0.4509804, 0, 1, 1,
0.6004189, -0.8245351, 2.324645, 0.4588235, 0, 1, 1,
0.6024354, 1.589016, 1.253697, 0.4627451, 0, 1, 1,
0.6032538, -0.9431661, 3.195976, 0.4705882, 0, 1, 1,
0.6075476, 1.041932, 1.411704, 0.4745098, 0, 1, 1,
0.6084513, -0.1197097, 1.895257, 0.4823529, 0, 1, 1,
0.6102596, -0.394, 3.834224, 0.4862745, 0, 1, 1,
0.6112315, 0.7545527, 2.231005, 0.4941176, 0, 1, 1,
0.6158645, -0.4207459, 2.445231, 0.5019608, 0, 1, 1,
0.6163293, -0.04709939, 3.02159, 0.5058824, 0, 1, 1,
0.6171478, -0.5348099, 1.283822, 0.5137255, 0, 1, 1,
0.6184173, 0.2217059, 1.123987, 0.5176471, 0, 1, 1,
0.6230875, 2.615827, -0.7582203, 0.5254902, 0, 1, 1,
0.6238, -1.307195, 0.9335093, 0.5294118, 0, 1, 1,
0.6248347, 0.1042174, 1.822942, 0.5372549, 0, 1, 1,
0.6264463, 1.581542, 1.160913, 0.5411765, 0, 1, 1,
0.6305882, 0.4936194, -0.4364545, 0.5490196, 0, 1, 1,
0.634923, 1.555355, -2.377343, 0.5529412, 0, 1, 1,
0.6383383, -1.241759, 2.333842, 0.5607843, 0, 1, 1,
0.6386521, -2.79846, 1.533845, 0.5647059, 0, 1, 1,
0.6427417, 1.848329, 0.4682325, 0.572549, 0, 1, 1,
0.6458604, -0.9076265, 1.337546, 0.5764706, 0, 1, 1,
0.647554, 0.2235475, 1.213455, 0.5843138, 0, 1, 1,
0.6490116, -0.8308369, 2.911284, 0.5882353, 0, 1, 1,
0.6699254, -0.1766627, 2.331787, 0.5960785, 0, 1, 1,
0.6725566, -0.1954225, 0.8759838, 0.6039216, 0, 1, 1,
0.6739248, 0.2104893, 2.078188, 0.6078432, 0, 1, 1,
0.681637, -0.7334394, 2.102829, 0.6156863, 0, 1, 1,
0.6826313, -1.085117, 1.972374, 0.6196079, 0, 1, 1,
0.6834167, 0.7890925, 0.9277301, 0.627451, 0, 1, 1,
0.6835673, -0.3397567, 2.108006, 0.6313726, 0, 1, 1,
0.6842384, -0.3700186, 1.647481, 0.6392157, 0, 1, 1,
0.6870948, -0.494608, 1.915992, 0.6431373, 0, 1, 1,
0.6873304, -0.01867024, 1.471174, 0.6509804, 0, 1, 1,
0.6881187, 1.157309, 1.657206, 0.654902, 0, 1, 1,
0.6900405, -0.7513347, 1.377448, 0.6627451, 0, 1, 1,
0.6939837, -0.02652946, 1.319618, 0.6666667, 0, 1, 1,
0.7081273, -0.6745017, 2.289161, 0.6745098, 0, 1, 1,
0.7124044, 2.265462, 0.6104338, 0.6784314, 0, 1, 1,
0.7166572, -0.196631, -0.4993696, 0.6862745, 0, 1, 1,
0.7169601, 0.6271544, 0.4345714, 0.6901961, 0, 1, 1,
0.7199114, 3.262385, 0.1369809, 0.6980392, 0, 1, 1,
0.7236323, 0.9386192, 1.006272, 0.7058824, 0, 1, 1,
0.7422459, -1.166773, 1.513545, 0.7098039, 0, 1, 1,
0.7424448, -0.2732785, 1.433096, 0.7176471, 0, 1, 1,
0.7432968, -1.413506, 3.62171, 0.7215686, 0, 1, 1,
0.746603, 0.1048957, 1.65783, 0.7294118, 0, 1, 1,
0.7473401, 0.4197282, 1.724309, 0.7333333, 0, 1, 1,
0.7476066, 0.8563058, 1.706754, 0.7411765, 0, 1, 1,
0.7481127, -0.6282643, 0.8254324, 0.7450981, 0, 1, 1,
0.754587, 2.585328, 0.09515406, 0.7529412, 0, 1, 1,
0.7562479, 0.8877742, -0.587081, 0.7568628, 0, 1, 1,
0.759092, 0.1611775, 0.745159, 0.7647059, 0, 1, 1,
0.7616497, -1.894219, 3.606683, 0.7686275, 0, 1, 1,
0.768859, -0.5024164, 3.296584, 0.7764706, 0, 1, 1,
0.770964, 1.281105, -0.9938803, 0.7803922, 0, 1, 1,
0.7799855, 0.2057697, 0.8946369, 0.7882353, 0, 1, 1,
0.7823795, -0.8513043, 0.3555877, 0.7921569, 0, 1, 1,
0.7845073, 0.1220349, 0.4601253, 0.8, 0, 1, 1,
0.7852374, 1.318501, 0.4921281, 0.8078431, 0, 1, 1,
0.7862684, 1.951836, 0.5330785, 0.8117647, 0, 1, 1,
0.7925399, 0.8648723, 1.605633, 0.8196079, 0, 1, 1,
0.7936761, 2.371967, 1.968498, 0.8235294, 0, 1, 1,
0.7967225, -0.4023677, 1.78074, 0.8313726, 0, 1, 1,
0.800974, 0.1482402, 0.6401079, 0.8352941, 0, 1, 1,
0.8021296, -0.3814076, 2.145751, 0.8431373, 0, 1, 1,
0.8027354, -1.788882, 3.683781, 0.8470588, 0, 1, 1,
0.8032411, 2.068845, 0.8302057, 0.854902, 0, 1, 1,
0.8083127, 0.7822902, 0.04643796, 0.8588235, 0, 1, 1,
0.8094478, -0.8088439, 2.026925, 0.8666667, 0, 1, 1,
0.8108265, 1.119559, 1.294117, 0.8705882, 0, 1, 1,
0.8116549, 1.249962, 1.648971, 0.8784314, 0, 1, 1,
0.8125677, 0.4583264, 1.271334, 0.8823529, 0, 1, 1,
0.815259, 0.2302156, 2.700707, 0.8901961, 0, 1, 1,
0.8291587, 0.4669807, 1.2705, 0.8941177, 0, 1, 1,
0.830828, -0.4156973, 3.019798, 0.9019608, 0, 1, 1,
0.8364357, 1.113229, 1.364198, 0.9098039, 0, 1, 1,
0.8463743, -0.6005681, 1.319832, 0.9137255, 0, 1, 1,
0.8500054, 1.068476, 2.400437, 0.9215686, 0, 1, 1,
0.8508024, -0.7960117, 2.615736, 0.9254902, 0, 1, 1,
0.8523818, -0.8604102, 0.3673479, 0.9333333, 0, 1, 1,
0.8599916, 0.3609697, 2.215588, 0.9372549, 0, 1, 1,
0.8631567, 2.338644, 0.8197614, 0.945098, 0, 1, 1,
0.8638557, 0.07113002, 2.664082, 0.9490196, 0, 1, 1,
0.8649119, -0.8768564, 2.131628, 0.9568627, 0, 1, 1,
0.872637, -0.1384442, 1.773716, 0.9607843, 0, 1, 1,
0.874871, 0.3906883, -0.6879217, 0.9686275, 0, 1, 1,
0.8808833, 0.1171257, 1.254231, 0.972549, 0, 1, 1,
0.8817765, -0.9629783, 2.05518, 0.9803922, 0, 1, 1,
0.8877798, 1.163052, 0.5682433, 0.9843137, 0, 1, 1,
0.8881305, -1.189841, 1.87053, 0.9921569, 0, 1, 1,
0.8890575, -1.699, 3.435676, 0.9960784, 0, 1, 1,
0.8929277, 1.991249, 1.040213, 1, 0, 0.9960784, 1,
0.8976351, 0.3146941, 0.1510949, 1, 0, 0.9882353, 1,
0.8992302, 0.4146316, 0.7514238, 1, 0, 0.9843137, 1,
0.9027104, 1.645167, -0.05103276, 1, 0, 0.9764706, 1,
0.9059097, 0.2840099, 3.89169, 1, 0, 0.972549, 1,
0.9062397, 1.121981, 0.5820405, 1, 0, 0.9647059, 1,
0.907845, -0.4535873, 2.262862, 1, 0, 0.9607843, 1,
0.9083771, -0.8547375, 1.329583, 1, 0, 0.9529412, 1,
0.9111481, -0.8244194, 3.217326, 1, 0, 0.9490196, 1,
0.915281, -2.072127, 4.173986, 1, 0, 0.9411765, 1,
0.9171097, 0.6517727, 0.9232987, 1, 0, 0.9372549, 1,
0.9279728, 0.2248083, 1.251029, 1, 0, 0.9294118, 1,
0.9295152, 0.505958, 2.538291, 1, 0, 0.9254902, 1,
0.931684, -1.043947, 3.904244, 1, 0, 0.9176471, 1,
0.9445612, 0.4762605, 2.180961, 1, 0, 0.9137255, 1,
0.9489533, 0.9103994, 1.013156, 1, 0, 0.9058824, 1,
0.9646214, -0.05851436, 1.950836, 1, 0, 0.9019608, 1,
0.965712, -1.157828, 1.812756, 1, 0, 0.8941177, 1,
0.9705475, 0.1959936, 2.489974, 1, 0, 0.8862745, 1,
0.9718155, -1.055659, 2.155653, 1, 0, 0.8823529, 1,
0.9750302, 0.09673908, -0.601812, 1, 0, 0.8745098, 1,
0.9891818, 1.490647, 1.085545, 1, 0, 0.8705882, 1,
0.9974575, 0.8017471, 0.2816231, 1, 0, 0.8627451, 1,
1.00397, -1.26199, -0.231921, 1, 0, 0.8588235, 1,
1.010479, -0.02282752, 1.995709, 1, 0, 0.8509804, 1,
1.010507, 0.2750924, 1.027478, 1, 0, 0.8470588, 1,
1.011099, 0.3913448, 2.49628, 1, 0, 0.8392157, 1,
1.014026, -0.6514564, 2.496965, 1, 0, 0.8352941, 1,
1.018279, -0.3312612, 2.527677, 1, 0, 0.827451, 1,
1.020054, -0.2898362, 2.165902, 1, 0, 0.8235294, 1,
1.027402, 0.8367463, -1.949727, 1, 0, 0.8156863, 1,
1.031762, -0.9255018, 1.705547, 1, 0, 0.8117647, 1,
1.03349, 0.7776263, 1.307683, 1, 0, 0.8039216, 1,
1.036014, -1.055432, 3.473794, 1, 0, 0.7960784, 1,
1.040654, -0.8215317, 3.340323, 1, 0, 0.7921569, 1,
1.040873, 0.3190039, 0.8600672, 1, 0, 0.7843137, 1,
1.046176, 0.4917365, 0.01114145, 1, 0, 0.7803922, 1,
1.047557, 0.4411377, 1.014976, 1, 0, 0.772549, 1,
1.052271, 0.07000551, 2.6917, 1, 0, 0.7686275, 1,
1.052641, -0.8409009, 4.382893, 1, 0, 0.7607843, 1,
1.05303, -1.351608, 1.781721, 1, 0, 0.7568628, 1,
1.061765, 1.737505, 1.139059, 1, 0, 0.7490196, 1,
1.067042, -0.2754717, 3.044634, 1, 0, 0.7450981, 1,
1.070765, -1.290657, 0.4988738, 1, 0, 0.7372549, 1,
1.073709, 0.4515091, 0.7083911, 1, 0, 0.7333333, 1,
1.079367, 1.248262, 1.705727, 1, 0, 0.7254902, 1,
1.082049, 1.94318, 1.062483, 1, 0, 0.7215686, 1,
1.08421, 0.8843929, 1.726793, 1, 0, 0.7137255, 1,
1.089674, -0.1883993, 0.8192683, 1, 0, 0.7098039, 1,
1.090692, 1.833575, 1.117845, 1, 0, 0.7019608, 1,
1.108359, -0.2995494, 1.937663, 1, 0, 0.6941177, 1,
1.108478, -0.8246745, 2.391674, 1, 0, 0.6901961, 1,
1.112804, -0.07714219, 1.588075, 1, 0, 0.682353, 1,
1.113122, -0.9205139, 2.317454, 1, 0, 0.6784314, 1,
1.11827, -0.4933379, 2.990342, 1, 0, 0.6705883, 1,
1.122606, -1.698855, 2.517315, 1, 0, 0.6666667, 1,
1.133892, -0.05252189, 1.608241, 1, 0, 0.6588235, 1,
1.145074, -0.007506778, -0.2172775, 1, 0, 0.654902, 1,
1.147776, 0.6377326, 0.4911452, 1, 0, 0.6470588, 1,
1.152035, 0.9277896, 0.390265, 1, 0, 0.6431373, 1,
1.178385, 2.788242, 0.773888, 1, 0, 0.6352941, 1,
1.179496, 0.2943735, 2.122975, 1, 0, 0.6313726, 1,
1.186329, -1.505316, 3.83852, 1, 0, 0.6235294, 1,
1.187822, 0.2097674, 1.738688, 1, 0, 0.6196079, 1,
1.189936, -0.3095331, 1.33171, 1, 0, 0.6117647, 1,
1.191393, -0.4576948, 3.194909, 1, 0, 0.6078432, 1,
1.194291, 1.265338, 1.693539, 1, 0, 0.6, 1,
1.21005, 0.49408, 0.9168167, 1, 0, 0.5921569, 1,
1.218166, 0.2586809, 1.998199, 1, 0, 0.5882353, 1,
1.219583, -1.289095, 1.068251, 1, 0, 0.5803922, 1,
1.226803, 1.12035, 0.7149817, 1, 0, 0.5764706, 1,
1.235957, -0.1426328, 1.90228, 1, 0, 0.5686275, 1,
1.239661, 0.0638392, 1.661994, 1, 0, 0.5647059, 1,
1.242429, 1.320659, 0.9086758, 1, 0, 0.5568628, 1,
1.246401, 1.101373, 1.742861, 1, 0, 0.5529412, 1,
1.250672, -1.31965, 1.151044, 1, 0, 0.5450981, 1,
1.256521, 0.07425069, 0.6935608, 1, 0, 0.5411765, 1,
1.26422, 0.5202132, 0.007935453, 1, 0, 0.5333334, 1,
1.269461, 0.03967565, 2.119966, 1, 0, 0.5294118, 1,
1.269966, -0.5973393, 1.100857, 1, 0, 0.5215687, 1,
1.280136, -0.9265751, 1.467058, 1, 0, 0.5176471, 1,
1.291387, -0.2419119, 2.352815, 1, 0, 0.509804, 1,
1.293284, 0.08605821, -0.1220007, 1, 0, 0.5058824, 1,
1.308215, -0.4179646, 3.630861, 1, 0, 0.4980392, 1,
1.323542, 1.226293, 1.514368, 1, 0, 0.4901961, 1,
1.330317, 1.519961, 0.9268389, 1, 0, 0.4862745, 1,
1.341794, 0.8540478, 1.146224, 1, 0, 0.4784314, 1,
1.35436, -0.9297596, 1.380537, 1, 0, 0.4745098, 1,
1.355961, 1.132071, 1.039, 1, 0, 0.4666667, 1,
1.372291, 1.429772, 1.850797, 1, 0, 0.4627451, 1,
1.383712, 0.7871507, 1.630796, 1, 0, 0.454902, 1,
1.384294, 0.4809697, 2.203181, 1, 0, 0.4509804, 1,
1.388236, 2.145359, 0.9004617, 1, 0, 0.4431373, 1,
1.39203, -1.141165, 0.9610216, 1, 0, 0.4392157, 1,
1.393291, -1.625273, 2.672975, 1, 0, 0.4313726, 1,
1.393637, 0.3834594, 1.599669, 1, 0, 0.427451, 1,
1.401123, 1.193958, -0.1902121, 1, 0, 0.4196078, 1,
1.408882, -0.2350839, 0.7081671, 1, 0, 0.4156863, 1,
1.414531, 1.406291, 0.1709865, 1, 0, 0.4078431, 1,
1.418404, 0.2876374, 0.6948817, 1, 0, 0.4039216, 1,
1.426026, -1.292779, 2.534224, 1, 0, 0.3960784, 1,
1.435148, -0.8049286, 1.963984, 1, 0, 0.3882353, 1,
1.445851, -0.5552067, 2.530221, 1, 0, 0.3843137, 1,
1.451641, 0.6712638, 1.913902, 1, 0, 0.3764706, 1,
1.452006, -0.1013149, 1.114991, 1, 0, 0.372549, 1,
1.460876, 2.385167, -0.4684297, 1, 0, 0.3647059, 1,
1.464407, 0.9575981, 2.148418, 1, 0, 0.3607843, 1,
1.468509, 0.05588376, 1.592309, 1, 0, 0.3529412, 1,
1.470219, -1.391416, -0.3826884, 1, 0, 0.3490196, 1,
1.471735, -1.152057, 1.035683, 1, 0, 0.3411765, 1,
1.471849, 0.5986183, 0.526005, 1, 0, 0.3372549, 1,
1.476064, -0.3921795, 1.308591, 1, 0, 0.3294118, 1,
1.480188, -0.03926165, 1.290662, 1, 0, 0.3254902, 1,
1.481464, 0.006499006, 0.8785822, 1, 0, 0.3176471, 1,
1.485199, 0.2802276, -0.1868333, 1, 0, 0.3137255, 1,
1.503138, -0.3573755, 1.253099, 1, 0, 0.3058824, 1,
1.505254, 1.033092, -1.526917, 1, 0, 0.2980392, 1,
1.509342, -0.9356657, 1.925248, 1, 0, 0.2941177, 1,
1.517687, 0.5835667, 0.8811154, 1, 0, 0.2862745, 1,
1.530034, 0.2226878, 2.025993, 1, 0, 0.282353, 1,
1.535345, -0.02740385, 1.652705, 1, 0, 0.2745098, 1,
1.538091, 0.9238541, 0.3444526, 1, 0, 0.2705882, 1,
1.548361, 0.03765584, 4.533371, 1, 0, 0.2627451, 1,
1.550801, -1.610901, 3.095736, 1, 0, 0.2588235, 1,
1.558101, 0.8850901, 2.000721, 1, 0, 0.2509804, 1,
1.559568, -1.006247, 2.492157, 1, 0, 0.2470588, 1,
1.566434, 1.067369, 1.3596, 1, 0, 0.2392157, 1,
1.582781, 0.1431518, 0.8671133, 1, 0, 0.2352941, 1,
1.589228, 0.2562619, 0.7821772, 1, 0, 0.227451, 1,
1.621488, 0.951407, 0.5036375, 1, 0, 0.2235294, 1,
1.658807, -0.7309417, 0.4047967, 1, 0, 0.2156863, 1,
1.681988, 1.024758, 1.409058, 1, 0, 0.2117647, 1,
1.682126, 0.1230521, 1.699375, 1, 0, 0.2039216, 1,
1.708956, 0.9979662, 0.2399092, 1, 0, 0.1960784, 1,
1.720091, -0.6542715, 1.24871, 1, 0, 0.1921569, 1,
1.726424, -1.487538, 1.760555, 1, 0, 0.1843137, 1,
1.785824, 0.3747203, 2.025466, 1, 0, 0.1803922, 1,
1.826969, 0.3540286, 0.002259708, 1, 0, 0.172549, 1,
1.836365, 0.834011, 0.3991269, 1, 0, 0.1686275, 1,
1.877966, -1.290734, 1.38967, 1, 0, 0.1607843, 1,
1.894096, 0.330103, -0.07159368, 1, 0, 0.1568628, 1,
1.912845, 1.644122, 0.1564983, 1, 0, 0.1490196, 1,
1.967341, 0.1551742, 1.310617, 1, 0, 0.145098, 1,
2.015303, -1.010911, 1.767154, 1, 0, 0.1372549, 1,
2.023227, 0.3293103, 2.08504, 1, 0, 0.1333333, 1,
2.054445, 1.220712, 0.3940198, 1, 0, 0.1254902, 1,
2.063429, -2.169608, 2.244843, 1, 0, 0.1215686, 1,
2.078397, 1.060523, 0.3258521, 1, 0, 0.1137255, 1,
2.109365, -0.3437052, 2.071771, 1, 0, 0.1098039, 1,
2.136026, 1.287214, 1.547841, 1, 0, 0.1019608, 1,
2.139159, -0.3650562, 2.781261, 1, 0, 0.09411765, 1,
2.171552, -0.7704006, 1.337769, 1, 0, 0.09019608, 1,
2.236809, 0.3906804, 0.9891005, 1, 0, 0.08235294, 1,
2.259717, -0.07887991, -0.7141559, 1, 0, 0.07843138, 1,
2.298016, -0.2784015, 1.217013, 1, 0, 0.07058824, 1,
2.349545, -0.7623194, 1.857219, 1, 0, 0.06666667, 1,
2.356021, -1.279238, 3.253747, 1, 0, 0.05882353, 1,
2.40077, 1.536025, 1.447611, 1, 0, 0.05490196, 1,
2.407745, -0.2416406, 0.8401068, 1, 0, 0.04705882, 1,
2.418203, -0.07256417, 1.34062, 1, 0, 0.04313726, 1,
2.677517, -1.796887, 1.592049, 1, 0, 0.03529412, 1,
2.751593, 1.286238, -0.06271823, 1, 0, 0.03137255, 1,
2.797288, -1.872913, 1.418481, 1, 0, 0.02352941, 1,
3.062909, -0.3793096, 2.862865, 1, 0, 0.01960784, 1,
3.321582, -0.4289367, 0.8932364, 1, 0, 0.01176471, 1,
3.389969, 0.2878874, 2.82785, 1, 0, 0.007843138, 1
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
-0.235671, -4.576979, -7.018388, 0, -0.5, 0.5, 0.5,
-0.235671, -4.576979, -7.018388, 1, -0.5, 0.5, 0.5,
-0.235671, -4.576979, -7.018388, 1, 1.5, 0.5, 0.5,
-0.235671, -4.576979, -7.018388, 0, 1.5, 0.5, 0.5
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
-5.090404, 0.5112669, -7.018388, 0, -0.5, 0.5, 0.5,
-5.090404, 0.5112669, -7.018388, 1, -0.5, 0.5, 0.5,
-5.090404, 0.5112669, -7.018388, 1, 1.5, 0.5, 0.5,
-5.090404, 0.5112669, -7.018388, 0, 1.5, 0.5, 0.5
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
-5.090404, -4.576979, 0.2781429, 0, -0.5, 0.5, 0.5,
-5.090404, -4.576979, 0.2781429, 1, -0.5, 0.5, 0.5,
-5.090404, -4.576979, 0.2781429, 1, 1.5, 0.5, 0.5,
-5.090404, -4.576979, 0.2781429, 0, 1.5, 0.5, 0.5
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
-2, -3.402768, -5.334573,
2, -3.402768, -5.334573,
-2, -3.402768, -5.334573,
-2, -3.59847, -5.615209,
0, -3.402768, -5.334573,
0, -3.59847, -5.615209,
2, -3.402768, -5.334573,
2, -3.59847, -5.615209
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
-2, -3.989874, -6.176481, 0, -0.5, 0.5, 0.5,
-2, -3.989874, -6.176481, 1, -0.5, 0.5, 0.5,
-2, -3.989874, -6.176481, 1, 1.5, 0.5, 0.5,
-2, -3.989874, -6.176481, 0, 1.5, 0.5, 0.5,
0, -3.989874, -6.176481, 0, -0.5, 0.5, 0.5,
0, -3.989874, -6.176481, 1, -0.5, 0.5, 0.5,
0, -3.989874, -6.176481, 1, 1.5, 0.5, 0.5,
0, -3.989874, -6.176481, 0, 1.5, 0.5, 0.5,
2, -3.989874, -6.176481, 0, -0.5, 0.5, 0.5,
2, -3.989874, -6.176481, 1, -0.5, 0.5, 0.5,
2, -3.989874, -6.176481, 1, 1.5, 0.5, 0.5,
2, -3.989874, -6.176481, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.970081, -2, -5.334573,
-3.970081, 4, -5.334573,
-3.970081, -2, -5.334573,
-4.156801, -2, -5.615209,
-3.970081, 0, -5.334573,
-4.156801, 0, -5.615209,
-3.970081, 2, -5.334573,
-4.156801, 2, -5.615209,
-3.970081, 4, -5.334573,
-4.156801, 4, -5.615209
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
"0",
"2",
"4"
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
-4.530242, -2, -6.176481, 0, -0.5, 0.5, 0.5,
-4.530242, -2, -6.176481, 1, -0.5, 0.5, 0.5,
-4.530242, -2, -6.176481, 1, 1.5, 0.5, 0.5,
-4.530242, -2, -6.176481, 0, 1.5, 0.5, 0.5,
-4.530242, 0, -6.176481, 0, -0.5, 0.5, 0.5,
-4.530242, 0, -6.176481, 1, -0.5, 0.5, 0.5,
-4.530242, 0, -6.176481, 1, 1.5, 0.5, 0.5,
-4.530242, 0, -6.176481, 0, 1.5, 0.5, 0.5,
-4.530242, 2, -6.176481, 0, -0.5, 0.5, 0.5,
-4.530242, 2, -6.176481, 1, -0.5, 0.5, 0.5,
-4.530242, 2, -6.176481, 1, 1.5, 0.5, 0.5,
-4.530242, 2, -6.176481, 0, 1.5, 0.5, 0.5,
-4.530242, 4, -6.176481, 0, -0.5, 0.5, 0.5,
-4.530242, 4, -6.176481, 1, -0.5, 0.5, 0.5,
-4.530242, 4, -6.176481, 1, 1.5, 0.5, 0.5,
-4.530242, 4, -6.176481, 0, 1.5, 0.5, 0.5
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
-3.970081, -3.402768, -4,
-3.970081, -3.402768, 4,
-3.970081, -3.402768, -4,
-4.156801, -3.59847, -4,
-3.970081, -3.402768, -2,
-4.156801, -3.59847, -2,
-3.970081, -3.402768, 0,
-4.156801, -3.59847, 0,
-3.970081, -3.402768, 2,
-4.156801, -3.59847, 2,
-3.970081, -3.402768, 4,
-4.156801, -3.59847, 4
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
-4.530242, -3.989874, -4, 0, -0.5, 0.5, 0.5,
-4.530242, -3.989874, -4, 1, -0.5, 0.5, 0.5,
-4.530242, -3.989874, -4, 1, 1.5, 0.5, 0.5,
-4.530242, -3.989874, -4, 0, 1.5, 0.5, 0.5,
-4.530242, -3.989874, -2, 0, -0.5, 0.5, 0.5,
-4.530242, -3.989874, -2, 1, -0.5, 0.5, 0.5,
-4.530242, -3.989874, -2, 1, 1.5, 0.5, 0.5,
-4.530242, -3.989874, -2, 0, 1.5, 0.5, 0.5,
-4.530242, -3.989874, 0, 0, -0.5, 0.5, 0.5,
-4.530242, -3.989874, 0, 1, -0.5, 0.5, 0.5,
-4.530242, -3.989874, 0, 1, 1.5, 0.5, 0.5,
-4.530242, -3.989874, 0, 0, 1.5, 0.5, 0.5,
-4.530242, -3.989874, 2, 0, -0.5, 0.5, 0.5,
-4.530242, -3.989874, 2, 1, -0.5, 0.5, 0.5,
-4.530242, -3.989874, 2, 1, 1.5, 0.5, 0.5,
-4.530242, -3.989874, 2, 0, 1.5, 0.5, 0.5,
-4.530242, -3.989874, 4, 0, -0.5, 0.5, 0.5,
-4.530242, -3.989874, 4, 1, -0.5, 0.5, 0.5,
-4.530242, -3.989874, 4, 1, 1.5, 0.5, 0.5,
-4.530242, -3.989874, 4, 0, 1.5, 0.5, 0.5
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
-3.970081, -3.402768, -5.334573,
-3.970081, 4.425302, -5.334573,
-3.970081, -3.402768, 5.890859,
-3.970081, 4.425302, 5.890859,
-3.970081, -3.402768, -5.334573,
-3.970081, -3.402768, 5.890859,
-3.970081, 4.425302, -5.334573,
-3.970081, 4.425302, 5.890859,
-3.970081, -3.402768, -5.334573,
3.498739, -3.402768, -5.334573,
-3.970081, -3.402768, 5.890859,
3.498739, -3.402768, 5.890859,
-3.970081, 4.425302, -5.334573,
3.498739, 4.425302, -5.334573,
-3.970081, 4.425302, 5.890859,
3.498739, 4.425302, 5.890859,
3.498739, -3.402768, -5.334573,
3.498739, 4.425302, -5.334573,
3.498739, -3.402768, 5.890859,
3.498739, 4.425302, 5.890859,
3.498739, -3.402768, -5.334573,
3.498739, -3.402768, 5.890859,
3.498739, 4.425302, -5.334573,
3.498739, 4.425302, 5.890859
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
var radius = 8.325171;
var distance = 37.03963;
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
mvMatrix.translate( 0.235671, -0.5112669, -0.2781429 );
mvMatrix.scale( 1.205189, 1.14988, 0.80187 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.03963);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


