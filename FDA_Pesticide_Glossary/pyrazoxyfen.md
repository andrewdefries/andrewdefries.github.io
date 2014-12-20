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
-3.081048, 0.6541033, -1.645921, 1, 0, 0, 1,
-3.048883, -0.866447, -0.1618515, 1, 0.007843138, 0, 1,
-2.670577, -0.9274586, -4.569042, 1, 0.01176471, 0, 1,
-2.65411, 0.535805, 0.6347421, 1, 0.01960784, 0, 1,
-2.644026, -0.1728273, -2.152737, 1, 0.02352941, 0, 1,
-2.558137, -0.602743, -2.857201, 1, 0.03137255, 0, 1,
-2.531292, 0.4629774, -0.0378174, 1, 0.03529412, 0, 1,
-2.52023, 1.382776, -2.749192, 1, 0.04313726, 0, 1,
-2.5123, 0.3596232, -1.052032, 1, 0.04705882, 0, 1,
-2.48572, 1.829168, -1.119841, 1, 0.05490196, 0, 1,
-2.365433, 0.7715498, -0.5054045, 1, 0.05882353, 0, 1,
-2.362574, -0.2319688, -1.39791, 1, 0.06666667, 0, 1,
-2.335925, 0.7195252, -2.168829, 1, 0.07058824, 0, 1,
-2.320399, -1.797896, -2.194204, 1, 0.07843138, 0, 1,
-2.302773, -1.882828, -1.729526, 1, 0.08235294, 0, 1,
-2.173191, 0.2392994, -0.5158596, 1, 0.09019608, 0, 1,
-2.139061, -0.1630181, -1.009518, 1, 0.09411765, 0, 1,
-2.115467, 1.234556, -0.8345929, 1, 0.1019608, 0, 1,
-2.113089, 0.1275943, -0.8946169, 1, 0.1098039, 0, 1,
-2.107085, -0.4750264, -2.427716, 1, 0.1137255, 0, 1,
-2.100276, -0.3666708, -0.7084292, 1, 0.1215686, 0, 1,
-2.08692, 0.0849897, -1.918555, 1, 0.1254902, 0, 1,
-2.076038, -0.1140536, -1.285779, 1, 0.1333333, 0, 1,
-2.056865, 0.4151332, -0.5616494, 1, 0.1372549, 0, 1,
-2.031905, -1.331943, -1.668914, 1, 0.145098, 0, 1,
-2.020334, -0.9811258, -1.197804, 1, 0.1490196, 0, 1,
-2.014369, 0.105462, -0.04372127, 1, 0.1568628, 0, 1,
-2.001595, -1.080236, -3.633606, 1, 0.1607843, 0, 1,
-1.992212, 1.103907, -2.672626, 1, 0.1686275, 0, 1,
-1.984839, 0.4402718, -1.174724, 1, 0.172549, 0, 1,
-1.975318, 0.6662879, -0.2154533, 1, 0.1803922, 0, 1,
-1.960967, -0.5241727, -1.595273, 1, 0.1843137, 0, 1,
-1.953012, 0.1022517, -2.47982, 1, 0.1921569, 0, 1,
-1.948608, 0.9813922, -1.647636, 1, 0.1960784, 0, 1,
-1.908356, -1.878138, -3.51404, 1, 0.2039216, 0, 1,
-1.905706, 1.742216, -0.05010971, 1, 0.2117647, 0, 1,
-1.903013, -0.2410963, -1.295259, 1, 0.2156863, 0, 1,
-1.877279, -0.3538302, -0.6763551, 1, 0.2235294, 0, 1,
-1.869801, -0.8356363, -1.88339, 1, 0.227451, 0, 1,
-1.858745, 2.427526, -1.82133, 1, 0.2352941, 0, 1,
-1.841482, 0.8912798, -1.953215, 1, 0.2392157, 0, 1,
-1.838704, 1.088683, -1.164991, 1, 0.2470588, 0, 1,
-1.821656, -0.77639, -0.6188703, 1, 0.2509804, 0, 1,
-1.815336, 0.4594423, 0.3501324, 1, 0.2588235, 0, 1,
-1.779213, -1.567096, -2.572037, 1, 0.2627451, 0, 1,
-1.746557, -0.01695334, -2.474928, 1, 0.2705882, 0, 1,
-1.739051, 0.6066387, -1.382682, 1, 0.2745098, 0, 1,
-1.734891, -0.7301635, -0.9666593, 1, 0.282353, 0, 1,
-1.731377, -0.3371599, -1.509009, 1, 0.2862745, 0, 1,
-1.7221, -0.6914375, -1.11827, 1, 0.2941177, 0, 1,
-1.694558, 0.6581724, -1.444544, 1, 0.3019608, 0, 1,
-1.691982, 0.8899967, -0.8508177, 1, 0.3058824, 0, 1,
-1.689243, 0.6442054, -2.197123, 1, 0.3137255, 0, 1,
-1.677385, 0.3633411, -0.7658135, 1, 0.3176471, 0, 1,
-1.659102, -0.03392781, -1.446028, 1, 0.3254902, 0, 1,
-1.658631, 0.1447472, -2.706435, 1, 0.3294118, 0, 1,
-1.65794, -3.408299, -3.648568, 1, 0.3372549, 0, 1,
-1.640218, 0.06126095, -0.01438471, 1, 0.3411765, 0, 1,
-1.636508, -1.445438, -1.232953, 1, 0.3490196, 0, 1,
-1.619781, 0.6491562, -0.09657441, 1, 0.3529412, 0, 1,
-1.61669, -1.260388, -3.365654, 1, 0.3607843, 0, 1,
-1.610869, -0.3041759, -1.896585, 1, 0.3647059, 0, 1,
-1.595538, -1.930892, -1.565859, 1, 0.372549, 0, 1,
-1.574321, -0.6702565, -3.596912, 1, 0.3764706, 0, 1,
-1.570193, 0.5684866, -0.163003, 1, 0.3843137, 0, 1,
-1.548075, -0.7275624, -1.491607, 1, 0.3882353, 0, 1,
-1.525887, -0.931173, -2.061145, 1, 0.3960784, 0, 1,
-1.524948, 0.5426956, -2.703446, 1, 0.4039216, 0, 1,
-1.514887, 0.2752229, -1.137119, 1, 0.4078431, 0, 1,
-1.501352, 1.705282, -1.241655, 1, 0.4156863, 0, 1,
-1.493713, 1.227567, -1.205712, 1, 0.4196078, 0, 1,
-1.493428, 1.044865, -0.1704877, 1, 0.427451, 0, 1,
-1.481086, -0.8018514, -2.32717, 1, 0.4313726, 0, 1,
-1.478714, -0.8678925, -3.065939, 1, 0.4392157, 0, 1,
-1.472183, -0.5264738, -3.465629, 1, 0.4431373, 0, 1,
-1.464125, 1.31226, -1.34814, 1, 0.4509804, 0, 1,
-1.450581, -0.6061622, -2.244865, 1, 0.454902, 0, 1,
-1.438001, 1.514851, -2.14712, 1, 0.4627451, 0, 1,
-1.430885, -1.204262, -1.399653, 1, 0.4666667, 0, 1,
-1.426365, 0.227511, -0.6693304, 1, 0.4745098, 0, 1,
-1.42377, 0.9786286, 0.2682005, 1, 0.4784314, 0, 1,
-1.423313, 0.7695387, -2.029998, 1, 0.4862745, 0, 1,
-1.420886, -0.905239, -1.435133, 1, 0.4901961, 0, 1,
-1.409568, -0.2082727, 0.01776227, 1, 0.4980392, 0, 1,
-1.409154, -0.184852, -2.359952, 1, 0.5058824, 0, 1,
-1.404423, 1.927443, -0.6737262, 1, 0.509804, 0, 1,
-1.397322, -0.07720958, -1.348067, 1, 0.5176471, 0, 1,
-1.392899, -0.767276, -1.612934, 1, 0.5215687, 0, 1,
-1.388155, -0.913196, -2.712453, 1, 0.5294118, 0, 1,
-1.376446, -0.4131361, -0.6315821, 1, 0.5333334, 0, 1,
-1.366942, 0.9153391, -0.10958, 1, 0.5411765, 0, 1,
-1.361619, -0.5004342, -2.671481, 1, 0.5450981, 0, 1,
-1.357637, -1.592607, -2.268258, 1, 0.5529412, 0, 1,
-1.357216, 1.017297, -3.25982, 1, 0.5568628, 0, 1,
-1.35588, -0.5171439, -2.04654, 1, 0.5647059, 0, 1,
-1.35383, -1.950038, -2.379104, 1, 0.5686275, 0, 1,
-1.350099, 0.4105479, -1.882116, 1, 0.5764706, 0, 1,
-1.343585, 0.9455255, -0.9998402, 1, 0.5803922, 0, 1,
-1.34057, 1.319499, -0.5110198, 1, 0.5882353, 0, 1,
-1.332105, 0.4194154, -0.4642304, 1, 0.5921569, 0, 1,
-1.316007, -0.5932096, -1.908894, 1, 0.6, 0, 1,
-1.303811, -1.710127, -3.333856, 1, 0.6078432, 0, 1,
-1.300833, 0.5707406, 1.044443, 1, 0.6117647, 0, 1,
-1.295351, 0.747239, -0.272317, 1, 0.6196079, 0, 1,
-1.290621, 1.371393, -1.030464, 1, 0.6235294, 0, 1,
-1.270668, 0.7982813, -0.1470866, 1, 0.6313726, 0, 1,
-1.262808, -0.3806233, -0.6076641, 1, 0.6352941, 0, 1,
-1.25489, 0.5502343, -0.5746129, 1, 0.6431373, 0, 1,
-1.248934, 0.2472463, -0.7163479, 1, 0.6470588, 0, 1,
-1.247416, -0.8564894, -3.404063, 1, 0.654902, 0, 1,
-1.246096, 1.724929, 0.8257946, 1, 0.6588235, 0, 1,
-1.242254, 0.1308037, -2.820188, 1, 0.6666667, 0, 1,
-1.240852, -0.1213404, -0.08698382, 1, 0.6705883, 0, 1,
-1.232266, 0.1558085, -1.055017, 1, 0.6784314, 0, 1,
-1.225085, -0.8026092, -2.530239, 1, 0.682353, 0, 1,
-1.221112, 0.4697624, -0.469442, 1, 0.6901961, 0, 1,
-1.216315, 0.9692149, -2.338935, 1, 0.6941177, 0, 1,
-1.214617, 0.3309871, -0.357283, 1, 0.7019608, 0, 1,
-1.2088, 1.343676, -2.117996, 1, 0.7098039, 0, 1,
-1.194702, -1.357637, -1.863835, 1, 0.7137255, 0, 1,
-1.192728, -1.077215, -1.00673, 1, 0.7215686, 0, 1,
-1.187452, -1.3678, -1.674927, 1, 0.7254902, 0, 1,
-1.183179, 0.4025444, -1.551163, 1, 0.7333333, 0, 1,
-1.180248, 2.022916, -1.349032, 1, 0.7372549, 0, 1,
-1.176784, -0.9849957, -1.400716, 1, 0.7450981, 0, 1,
-1.172892, 0.3379794, -0.6434332, 1, 0.7490196, 0, 1,
-1.162182, 0.5672325, -1.217242, 1, 0.7568628, 0, 1,
-1.160646, 1.772655, -1.130944, 1, 0.7607843, 0, 1,
-1.159739, -1.573968, -2.566952, 1, 0.7686275, 0, 1,
-1.156998, -0.5653193, -2.613113, 1, 0.772549, 0, 1,
-1.156014, -1.539038, -2.868072, 1, 0.7803922, 0, 1,
-1.151156, -0.1642081, -2.509699, 1, 0.7843137, 0, 1,
-1.149699, 0.4850503, -1.445836, 1, 0.7921569, 0, 1,
-1.149322, 0.271644, -2.671933, 1, 0.7960784, 0, 1,
-1.145377, 1.007878, -0.8396041, 1, 0.8039216, 0, 1,
-1.143128, 2.771321, 0.4526682, 1, 0.8117647, 0, 1,
-1.13344, 0.2598328, -1.679102, 1, 0.8156863, 0, 1,
-1.129743, -0.0965238, -2.715593, 1, 0.8235294, 0, 1,
-1.128726, -0.3043204, -2.253428, 1, 0.827451, 0, 1,
-1.126422, -0.05461502, -1.401763, 1, 0.8352941, 0, 1,
-1.124968, -0.005742339, -3.644147, 1, 0.8392157, 0, 1,
-1.12354, 0.7414915, -2.494682, 1, 0.8470588, 0, 1,
-1.120179, 1.436852, -1.681288, 1, 0.8509804, 0, 1,
-1.106901, 0.0003478224, -0.5207165, 1, 0.8588235, 0, 1,
-1.105114, -0.1567799, -1.18427, 1, 0.8627451, 0, 1,
-1.094748, -0.8392817, -3.74652, 1, 0.8705882, 0, 1,
-1.092473, -1.105872, -1.845332, 1, 0.8745098, 0, 1,
-1.09224, -0.7978563, -0.9592819, 1, 0.8823529, 0, 1,
-1.090183, -0.2584884, -3.56122, 1, 0.8862745, 0, 1,
-1.079095, -0.5131481, -0.4230237, 1, 0.8941177, 0, 1,
-1.052854, -0.1026741, -1.194621, 1, 0.8980392, 0, 1,
-1.04593, 1.059067, -2.276664, 1, 0.9058824, 0, 1,
-1.045089, 1.690762, 0.198726, 1, 0.9137255, 0, 1,
-1.04508, 0.3327882, -1.373479, 1, 0.9176471, 0, 1,
-1.042546, 2.389453, 0.0001754979, 1, 0.9254902, 0, 1,
-1.020714, -0.9830456, -2.569878, 1, 0.9294118, 0, 1,
-1.018173, -1.279796, -1.481577, 1, 0.9372549, 0, 1,
-1.014187, 0.3172947, 0.4590917, 1, 0.9411765, 0, 1,
-1.01176, 1.43594, -2.110418, 1, 0.9490196, 0, 1,
-1.010054, -0.683051, -3.965611, 1, 0.9529412, 0, 1,
-1.007508, 0.5055806, -0.7521815, 1, 0.9607843, 0, 1,
-1.000741, 1.377672, -0.2707111, 1, 0.9647059, 0, 1,
-0.9991744, 1.058064, -0.519765, 1, 0.972549, 0, 1,
-0.9957483, -0.6770326, -3.446843, 1, 0.9764706, 0, 1,
-0.993701, -1.33977, -3.10708, 1, 0.9843137, 0, 1,
-0.9900383, 0.06331276, -1.984008, 1, 0.9882353, 0, 1,
-0.9893441, 0.1943459, -0.499339, 1, 0.9960784, 0, 1,
-0.988785, 0.1996148, 0.7708853, 0.9960784, 1, 0, 1,
-0.9867316, 2.092241, -0.4634235, 0.9921569, 1, 0, 1,
-0.9761474, 0.6897212, -1.232138, 0.9843137, 1, 0, 1,
-0.9493523, -0.2777637, -1.61423, 0.9803922, 1, 0, 1,
-0.9474648, -0.2449152, -0.9304205, 0.972549, 1, 0, 1,
-0.9460359, -0.2889245, -3.367735, 0.9686275, 1, 0, 1,
-0.94549, -0.05500824, -1.388766, 0.9607843, 1, 0, 1,
-0.9419466, -0.6504807, -0.431187, 0.9568627, 1, 0, 1,
-0.9298539, 0.1384911, -0.6139246, 0.9490196, 1, 0, 1,
-0.9268832, -0.6009604, -2.827037, 0.945098, 1, 0, 1,
-0.9189429, -0.4751208, -1.933519, 0.9372549, 1, 0, 1,
-0.9189143, 0.725218, -1.266522, 0.9333333, 1, 0, 1,
-0.9164721, -0.7632174, -2.123494, 0.9254902, 1, 0, 1,
-0.9125625, -0.528364, -2.270245, 0.9215686, 1, 0, 1,
-0.9021372, 0.1170167, -2.52773, 0.9137255, 1, 0, 1,
-0.8998832, 0.8320226, -0.7561743, 0.9098039, 1, 0, 1,
-0.8968816, 0.4799579, -1.418891, 0.9019608, 1, 0, 1,
-0.8936417, -0.8836337, -1.590071, 0.8941177, 1, 0, 1,
-0.8925022, -0.3559908, -2.858657, 0.8901961, 1, 0, 1,
-0.8808141, 0.3675858, -1.451764, 0.8823529, 1, 0, 1,
-0.879709, -0.5724195, -1.65726, 0.8784314, 1, 0, 1,
-0.8745812, -0.2241893, -1.821871, 0.8705882, 1, 0, 1,
-0.8741054, 1.260709, -1.098846, 0.8666667, 1, 0, 1,
-0.8623038, 0.4721497, -1.425203, 0.8588235, 1, 0, 1,
-0.85928, 0.801066, -0.6141503, 0.854902, 1, 0, 1,
-0.8534552, -1.730006, -1.303803, 0.8470588, 1, 0, 1,
-0.8503525, -0.6318882, -2.202677, 0.8431373, 1, 0, 1,
-0.8472888, 0.3228722, -1.31801, 0.8352941, 1, 0, 1,
-0.8394483, 0.7893507, -0.08169887, 0.8313726, 1, 0, 1,
-0.8297868, 1.037251, -1.210018, 0.8235294, 1, 0, 1,
-0.8246385, -0.8916277, -2.014865, 0.8196079, 1, 0, 1,
-0.8168415, -0.6878266, -1.898568, 0.8117647, 1, 0, 1,
-0.8093896, 1.315087, -1.609152, 0.8078431, 1, 0, 1,
-0.8090779, 0.6437883, -0.9919551, 0.8, 1, 0, 1,
-0.8061723, 0.1347756, -1.502071, 0.7921569, 1, 0, 1,
-0.7968541, -1.182709, -1.429747, 0.7882353, 1, 0, 1,
-0.7964585, -0.3348622, -3.275357, 0.7803922, 1, 0, 1,
-0.7889317, -0.6099416, -1.788957, 0.7764706, 1, 0, 1,
-0.7858921, -0.6288733, -1.102666, 0.7686275, 1, 0, 1,
-0.7843125, 0.05619953, -1.556181, 0.7647059, 1, 0, 1,
-0.7841733, -0.8970565, -2.026088, 0.7568628, 1, 0, 1,
-0.7802057, 0.8140709, 0.1661536, 0.7529412, 1, 0, 1,
-0.7764786, -0.6030962, -1.69171, 0.7450981, 1, 0, 1,
-0.7729812, 0.2205343, -1.550723, 0.7411765, 1, 0, 1,
-0.7582715, -0.03234161, -2.972833, 0.7333333, 1, 0, 1,
-0.7510522, 0.8739277, -2.966985, 0.7294118, 1, 0, 1,
-0.7499896, -0.3327793, -3.326755, 0.7215686, 1, 0, 1,
-0.7488472, -1.005977, -1.930078, 0.7176471, 1, 0, 1,
-0.7472784, -0.4171915, -2.674751, 0.7098039, 1, 0, 1,
-0.7466847, -1.588285, -2.294805, 0.7058824, 1, 0, 1,
-0.7434604, 1.029469, -2.951241, 0.6980392, 1, 0, 1,
-0.7419382, 1.958238, -1.980682, 0.6901961, 1, 0, 1,
-0.7413071, -1.143184, -2.750556, 0.6862745, 1, 0, 1,
-0.7364779, -0.2715347, -1.673585, 0.6784314, 1, 0, 1,
-0.7348953, 0.03638932, -0.7183343, 0.6745098, 1, 0, 1,
-0.7341694, 0.8360671, -1.925812, 0.6666667, 1, 0, 1,
-0.7295665, 1.452676, -0.2578827, 0.6627451, 1, 0, 1,
-0.7254212, -1.22832, -3.370147, 0.654902, 1, 0, 1,
-0.7235589, -0.8765706, -1.811375, 0.6509804, 1, 0, 1,
-0.717948, 0.7966288, -0.2020903, 0.6431373, 1, 0, 1,
-0.715674, -0.1803566, -1.985005, 0.6392157, 1, 0, 1,
-0.7153183, 0.2494562, -1.109002, 0.6313726, 1, 0, 1,
-0.7068298, 0.08627227, -1.009683, 0.627451, 1, 0, 1,
-0.7015041, 0.9162171, -0.0185145, 0.6196079, 1, 0, 1,
-0.6954091, -0.6615871, -0.8813671, 0.6156863, 1, 0, 1,
-0.6934174, 1.120899, -0.781987, 0.6078432, 1, 0, 1,
-0.6903524, 0.7339138, -0.6815596, 0.6039216, 1, 0, 1,
-0.6783627, -0.3803169, -2.727719, 0.5960785, 1, 0, 1,
-0.6776538, -1.776267, -3.96286, 0.5882353, 1, 0, 1,
-0.6707733, -1.30658, -2.580158, 0.5843138, 1, 0, 1,
-0.6675664, 0.9334461, -0.9870675, 0.5764706, 1, 0, 1,
-0.6665611, 0.1404316, -0.9033322, 0.572549, 1, 0, 1,
-0.6647498, 0.4003659, 0.7980156, 0.5647059, 1, 0, 1,
-0.6624761, 1.221426, -0.4503357, 0.5607843, 1, 0, 1,
-0.6586605, -0.3573375, -3.239804, 0.5529412, 1, 0, 1,
-0.6577757, -0.2188706, -1.632211, 0.5490196, 1, 0, 1,
-0.6493896, -2.062637, -3.730218, 0.5411765, 1, 0, 1,
-0.644766, 0.03743199, -0.2862574, 0.5372549, 1, 0, 1,
-0.6444876, 0.06535088, -1.970573, 0.5294118, 1, 0, 1,
-0.6444322, 0.3022189, -0.6183434, 0.5254902, 1, 0, 1,
-0.6381093, 0.790323, -0.3676902, 0.5176471, 1, 0, 1,
-0.6328898, 1.178627, -1.627775, 0.5137255, 1, 0, 1,
-0.6319667, 0.2179839, 0.04847534, 0.5058824, 1, 0, 1,
-0.6315131, 0.7212434, 1.165567, 0.5019608, 1, 0, 1,
-0.6298267, -0.02905145, -1.651746, 0.4941176, 1, 0, 1,
-0.6282101, -0.06940088, -0.6010747, 0.4862745, 1, 0, 1,
-0.6186796, 0.8406382, -1.788222, 0.4823529, 1, 0, 1,
-0.616744, -1.466814, -2.522681, 0.4745098, 1, 0, 1,
-0.6123548, 0.529604, -0.6245056, 0.4705882, 1, 0, 1,
-0.6101955, 0.6287361, -1.10682, 0.4627451, 1, 0, 1,
-0.6058947, -0.185126, -0.3977413, 0.4588235, 1, 0, 1,
-0.5995306, 0.6998008, -0.8313019, 0.4509804, 1, 0, 1,
-0.5968485, -0.6368653, -0.6631238, 0.4470588, 1, 0, 1,
-0.5968472, 0.5862801, -0.6476421, 0.4392157, 1, 0, 1,
-0.5928708, -1.240877, -3.065884, 0.4352941, 1, 0, 1,
-0.5905089, 1.132079, -0.8818042, 0.427451, 1, 0, 1,
-0.5902765, 0.8318326, -1.432181, 0.4235294, 1, 0, 1,
-0.5889447, 0.8103163, -2.885436, 0.4156863, 1, 0, 1,
-0.5871573, -0.1890957, -1.84541, 0.4117647, 1, 0, 1,
-0.5870828, -0.05383579, -1.327987, 0.4039216, 1, 0, 1,
-0.576254, 0.5287104, -1.576956, 0.3960784, 1, 0, 1,
-0.5735726, 0.7937427, -1.222855, 0.3921569, 1, 0, 1,
-0.5709039, 0.1194318, -1.525437, 0.3843137, 1, 0, 1,
-0.568083, 2.083564, -0.8971263, 0.3803922, 1, 0, 1,
-0.5677753, -1.952869, -2.616976, 0.372549, 1, 0, 1,
-0.5642606, -0.07435893, -1.452077, 0.3686275, 1, 0, 1,
-0.5638067, 0.2775805, -2.000844, 0.3607843, 1, 0, 1,
-0.5636674, -0.6992165, -2.731733, 0.3568628, 1, 0, 1,
-0.5617272, -1.465624, -4.031599, 0.3490196, 1, 0, 1,
-0.5608511, 1.015442, 0.09658952, 0.345098, 1, 0, 1,
-0.5606907, -2.364146, -3.276291, 0.3372549, 1, 0, 1,
-0.5601521, 0.1032222, -0.5118471, 0.3333333, 1, 0, 1,
-0.5569054, -1.472362, -3.479922, 0.3254902, 1, 0, 1,
-0.5554686, -0.3019734, -3.182248, 0.3215686, 1, 0, 1,
-0.554937, -0.03773597, -1.368316, 0.3137255, 1, 0, 1,
-0.5524779, 0.3359673, -0.4769029, 0.3098039, 1, 0, 1,
-0.5508756, -1.668052, -2.357995, 0.3019608, 1, 0, 1,
-0.5503445, 0.3974543, -1.454239, 0.2941177, 1, 0, 1,
-0.5491201, 1.232856, 2.338052, 0.2901961, 1, 0, 1,
-0.5419949, 0.1411246, -1.875338, 0.282353, 1, 0, 1,
-0.5419912, 1.292003, 0.9683971, 0.2784314, 1, 0, 1,
-0.5416858, 0.5353085, -0.248884, 0.2705882, 1, 0, 1,
-0.531664, -1.980274, -2.684821, 0.2666667, 1, 0, 1,
-0.5292064, -1.32558, -3.807478, 0.2588235, 1, 0, 1,
-0.52393, -0.4641679, -3.212157, 0.254902, 1, 0, 1,
-0.5209017, 0.7991078, -2.413708, 0.2470588, 1, 0, 1,
-0.519748, 0.2966153, -2.361448, 0.2431373, 1, 0, 1,
-0.5157335, 2.313282, -1.37001, 0.2352941, 1, 0, 1,
-0.5070887, -0.2319842, -1.783668, 0.2313726, 1, 0, 1,
-0.5067555, 2.344267, -0.5084423, 0.2235294, 1, 0, 1,
-0.5036983, -0.7924088, -1.844235, 0.2196078, 1, 0, 1,
-0.5026353, -0.8517324, -3.412622, 0.2117647, 1, 0, 1,
-0.4938109, 0.6393273, -2.890697, 0.2078431, 1, 0, 1,
-0.4918574, 0.3839477, 0.4948763, 0.2, 1, 0, 1,
-0.4914232, -1.237571, -3.668169, 0.1921569, 1, 0, 1,
-0.4851748, -2.33285, -3.756853, 0.1882353, 1, 0, 1,
-0.4790192, 1.279617, 0.2342167, 0.1803922, 1, 0, 1,
-0.4779304, -0.9611471, -1.677055, 0.1764706, 1, 0, 1,
-0.4760557, 1.597368, 0.01718654, 0.1686275, 1, 0, 1,
-0.4717801, 0.8724182, -1.361689, 0.1647059, 1, 0, 1,
-0.4696303, 1.292905, -0.02464637, 0.1568628, 1, 0, 1,
-0.466549, -1.388176, -3.510176, 0.1529412, 1, 0, 1,
-0.4636654, 1.225868, -1.321285, 0.145098, 1, 0, 1,
-0.4620469, -1.917991, -2.686218, 0.1411765, 1, 0, 1,
-0.4569355, -1.36515, -4.647003, 0.1333333, 1, 0, 1,
-0.4542394, 0.4070863, -0.6011468, 0.1294118, 1, 0, 1,
-0.4539338, -1.314032, -1.334424, 0.1215686, 1, 0, 1,
-0.4532017, -0.917294, -1.633009, 0.1176471, 1, 0, 1,
-0.4516734, -1.081712, -0.9433058, 0.1098039, 1, 0, 1,
-0.4506141, -0.278823, -1.745981, 0.1058824, 1, 0, 1,
-0.4474217, 1.518338, 0.04002307, 0.09803922, 1, 0, 1,
-0.4445719, 1.814718, -0.3585513, 0.09019608, 1, 0, 1,
-0.4439673, 0.865805, -0.9081541, 0.08627451, 1, 0, 1,
-0.4409952, -1.220944, -4.457067, 0.07843138, 1, 0, 1,
-0.4409928, -0.752775, -3.099258, 0.07450981, 1, 0, 1,
-0.4399481, -0.0981222, -2.965457, 0.06666667, 1, 0, 1,
-0.4398928, -0.6348962, -2.979658, 0.0627451, 1, 0, 1,
-0.4338121, -1.075126, -2.6867, 0.05490196, 1, 0, 1,
-0.4307784, -0.2134381, -0.65771, 0.05098039, 1, 0, 1,
-0.4264871, 0.7385187, -0.7993754, 0.04313726, 1, 0, 1,
-0.4251107, 0.2825341, 1.47963, 0.03921569, 1, 0, 1,
-0.4248426, -0.1151554, -2.955509, 0.03137255, 1, 0, 1,
-0.4244109, 1.907669, -1.174008, 0.02745098, 1, 0, 1,
-0.4225833, 0.1187803, -1.457214, 0.01960784, 1, 0, 1,
-0.4180782, 0.6439517, 0.5368013, 0.01568628, 1, 0, 1,
-0.4149368, -0.5896314, -2.787065, 0.007843138, 1, 0, 1,
-0.4124185, 0.6787264, -1.471301, 0.003921569, 1, 0, 1,
-0.4118043, 0.0593688, -2.928368, 0, 1, 0.003921569, 1,
-0.4114246, 1.273169, -1.397943, 0, 1, 0.01176471, 1,
-0.40108, 0.2744903, -1.52089, 0, 1, 0.01568628, 1,
-0.4009546, 0.383471, 1.258222, 0, 1, 0.02352941, 1,
-0.3895213, -0.7093568, -1.971013, 0, 1, 0.02745098, 1,
-0.3894847, 0.533758, -0.4576274, 0, 1, 0.03529412, 1,
-0.3870782, 0.1542041, 0.9994789, 0, 1, 0.03921569, 1,
-0.3759232, 0.05255076, -0.8684031, 0, 1, 0.04705882, 1,
-0.37414, 0.1056389, -0.5666699, 0, 1, 0.05098039, 1,
-0.374139, -1.632149, -2.480144, 0, 1, 0.05882353, 1,
-0.3740581, 2.485982, -0.7469458, 0, 1, 0.0627451, 1,
-0.3719166, 1.119317, -1.254712, 0, 1, 0.07058824, 1,
-0.3703951, 0.7169402, 1.242917, 0, 1, 0.07450981, 1,
-0.3696442, 1.494293, -0.03126733, 0, 1, 0.08235294, 1,
-0.3625269, 0.2782581, -1.271114, 0, 1, 0.08627451, 1,
-0.3617524, -0.546861, -0.9137734, 0, 1, 0.09411765, 1,
-0.3584953, -0.8338354, -2.252895, 0, 1, 0.1019608, 1,
-0.3583443, -1.004029, -5.059115, 0, 1, 0.1058824, 1,
-0.3574637, -1.160974, -2.31668, 0, 1, 0.1137255, 1,
-0.3552065, 0.7971424, -0.5219777, 0, 1, 0.1176471, 1,
-0.3522169, 1.177559, 0.5597653, 0, 1, 0.1254902, 1,
-0.3510212, -0.6108797, -2.054484, 0, 1, 0.1294118, 1,
-0.3481798, -0.2329708, -3.044021, 0, 1, 0.1372549, 1,
-0.3417998, -2.661377, -2.697309, 0, 1, 0.1411765, 1,
-0.3409159, -2.996356, -2.792494, 0, 1, 0.1490196, 1,
-0.3390797, -0.1869381, -2.083961, 0, 1, 0.1529412, 1,
-0.3330732, 1.169176, 1.280462, 0, 1, 0.1607843, 1,
-0.3304982, -0.05508782, 0.08673389, 0, 1, 0.1647059, 1,
-0.3300192, -0.01001252, -0.9386947, 0, 1, 0.172549, 1,
-0.3291149, 1.767841, -1.549014, 0, 1, 0.1764706, 1,
-0.3268191, -0.4616555, -2.441256, 0, 1, 0.1843137, 1,
-0.3217741, -0.2741615, -2.379602, 0, 1, 0.1882353, 1,
-0.3209527, 0.3754755, -0.5599666, 0, 1, 0.1960784, 1,
-0.3208301, 0.09469317, -2.262483, 0, 1, 0.2039216, 1,
-0.3102008, -0.3451774, -3.412038, 0, 1, 0.2078431, 1,
-0.3083196, 0.3839853, -1.400362, 0, 1, 0.2156863, 1,
-0.3071705, 1.429132, -0.3499249, 0, 1, 0.2196078, 1,
-0.3018626, -0.4372838, -3.879337, 0, 1, 0.227451, 1,
-0.2989811, -0.6298001, -3.290797, 0, 1, 0.2313726, 1,
-0.2858396, -0.6661913, -1.815874, 0, 1, 0.2392157, 1,
-0.2839475, 0.1786657, 0.5027032, 0, 1, 0.2431373, 1,
-0.2833394, 0.5576559, 0.5900854, 0, 1, 0.2509804, 1,
-0.2803124, 0.1701618, -0.8844011, 0, 1, 0.254902, 1,
-0.2762573, 0.4876418, -0.1578856, 0, 1, 0.2627451, 1,
-0.2721683, 1.504766, 1.612947, 0, 1, 0.2666667, 1,
-0.2717391, -0.7020198, -2.130924, 0, 1, 0.2745098, 1,
-0.271261, 1.875977, 1.263404, 0, 1, 0.2784314, 1,
-0.2674522, 0.135896, -1.134253, 0, 1, 0.2862745, 1,
-0.2670929, 0.3679593, -0.4570058, 0, 1, 0.2901961, 1,
-0.2655669, 0.476618, -1.714694, 0, 1, 0.2980392, 1,
-0.2632174, -0.02857068, -0.9074328, 0, 1, 0.3058824, 1,
-0.2603429, -1.721889, -3.485233, 0, 1, 0.3098039, 1,
-0.2561623, -1.181908, -2.879608, 0, 1, 0.3176471, 1,
-0.2509903, -0.357625, -1.714121, 0, 1, 0.3215686, 1,
-0.2491921, 0.6316154, 0.860386, 0, 1, 0.3294118, 1,
-0.2482588, 0.6563321, -0.4387234, 0, 1, 0.3333333, 1,
-0.2481247, -0.22229, -2.390351, 0, 1, 0.3411765, 1,
-0.2460555, 0.7245611, -1.565297, 0, 1, 0.345098, 1,
-0.2453923, -1.811425, -4.884013, 0, 1, 0.3529412, 1,
-0.2451395, -0.9964226, -0.4800098, 0, 1, 0.3568628, 1,
-0.244811, 0.744683, -0.4259392, 0, 1, 0.3647059, 1,
-0.2423428, -0.3071117, -3.744129, 0, 1, 0.3686275, 1,
-0.2352456, -0.1830843, -1.995609, 0, 1, 0.3764706, 1,
-0.233374, -0.175968, -2.814843, 0, 1, 0.3803922, 1,
-0.2329521, -1.850713, -3.049233, 0, 1, 0.3882353, 1,
-0.2328397, 2.582916, -1.427457, 0, 1, 0.3921569, 1,
-0.2310512, -0.537595, -3.525663, 0, 1, 0.4, 1,
-0.2306155, 0.7969203, 0.5431897, 0, 1, 0.4078431, 1,
-0.2257762, -1.48671, -3.874725, 0, 1, 0.4117647, 1,
-0.2198929, -0.6202735, -2.840512, 0, 1, 0.4196078, 1,
-0.2198839, 0.2238212, 0.3032394, 0, 1, 0.4235294, 1,
-0.2190096, 2.570534, -2.533111, 0, 1, 0.4313726, 1,
-0.2172619, 0.4439663, -3.049757, 0, 1, 0.4352941, 1,
-0.2169223, 0.3569477, -0.9053248, 0, 1, 0.4431373, 1,
-0.2103403, -0.09180725, -3.662202, 0, 1, 0.4470588, 1,
-0.2096532, -0.830793, -3.709218, 0, 1, 0.454902, 1,
-0.2079478, 0.07607995, -1.696144, 0, 1, 0.4588235, 1,
-0.2076222, -0.4655389, -2.147724, 0, 1, 0.4666667, 1,
-0.2028737, -1.354757, -3.008678, 0, 1, 0.4705882, 1,
-0.2024493, -0.7057871, -2.611696, 0, 1, 0.4784314, 1,
-0.198131, -1.197803, -2.497493, 0, 1, 0.4823529, 1,
-0.1893808, -1.889585, -4.050791, 0, 1, 0.4901961, 1,
-0.1888361, -2.521485, -2.817213, 0, 1, 0.4941176, 1,
-0.1869356, -0.2004965, -1.834048, 0, 1, 0.5019608, 1,
-0.1861316, 0.8158258, 0.2632421, 0, 1, 0.509804, 1,
-0.1853533, 0.639132, 0.6880025, 0, 1, 0.5137255, 1,
-0.1840349, -1.978479, -4.32735, 0, 1, 0.5215687, 1,
-0.1825412, -0.4333296, -2.031421, 0, 1, 0.5254902, 1,
-0.1824525, -0.9836335, -1.138528, 0, 1, 0.5333334, 1,
-0.18097, 1.426421, 0.6689647, 0, 1, 0.5372549, 1,
-0.1794041, 0.989467, -1.048607, 0, 1, 0.5450981, 1,
-0.1732278, 1.760085, -1.836383, 0, 1, 0.5490196, 1,
-0.1731868, -0.9601426, -3.412908, 0, 1, 0.5568628, 1,
-0.1678327, -0.08040398, -1.238366, 0, 1, 0.5607843, 1,
-0.1652013, 1.964224, 1.120775, 0, 1, 0.5686275, 1,
-0.1640849, 0.5291459, -0.3435795, 0, 1, 0.572549, 1,
-0.1582528, 1.204555, -0.5058348, 0, 1, 0.5803922, 1,
-0.1510823, -0.2565421, -3.06647, 0, 1, 0.5843138, 1,
-0.1505233, 1.75052, -0.09607919, 0, 1, 0.5921569, 1,
-0.1498052, 0.5204764, -1.750801, 0, 1, 0.5960785, 1,
-0.1480455, 2.003273, 1.27511, 0, 1, 0.6039216, 1,
-0.1435369, -0.08515141, -3.169742, 0, 1, 0.6117647, 1,
-0.143276, -1.360407, -2.713318, 0, 1, 0.6156863, 1,
-0.143056, -0.9355513, -2.648835, 0, 1, 0.6235294, 1,
-0.1377368, 1.132195, 0.3052984, 0, 1, 0.627451, 1,
-0.1356955, -0.5551189, -2.958691, 0, 1, 0.6352941, 1,
-0.1264035, -2.096437, -3.30486, 0, 1, 0.6392157, 1,
-0.1253117, -0.2151468, -2.716712, 0, 1, 0.6470588, 1,
-0.1226266, -0.6375251, -0.8333459, 0, 1, 0.6509804, 1,
-0.1225602, 2.101916, 0.7359015, 0, 1, 0.6588235, 1,
-0.1225336, 0.7188425, -0.88365, 0, 1, 0.6627451, 1,
-0.1209594, 0.2046701, 1.384464, 0, 1, 0.6705883, 1,
-0.1197321, 0.7037488, -0.396027, 0, 1, 0.6745098, 1,
-0.1185013, -0.3798905, -3.1043, 0, 1, 0.682353, 1,
-0.1099993, 2.822936, 1.511557, 0, 1, 0.6862745, 1,
-0.1084009, -1.322702, -2.903457, 0, 1, 0.6941177, 1,
-0.1081739, -0.5634514, -3.791682, 0, 1, 0.7019608, 1,
-0.108008, 1.161047, -0.6458777, 0, 1, 0.7058824, 1,
-0.1064988, -0.7812585, -2.996675, 0, 1, 0.7137255, 1,
-0.1063997, -1.101631, -3.075785, 0, 1, 0.7176471, 1,
-0.105465, 0.3974425, 0.9221627, 0, 1, 0.7254902, 1,
-0.1050014, 0.3584453, 1.036878, 0, 1, 0.7294118, 1,
-0.1044362, 0.03020226, 0.506658, 0, 1, 0.7372549, 1,
-0.1034221, -1.828254, -3.999476, 0, 1, 0.7411765, 1,
-0.1010095, 0.8174853, -0.4373736, 0, 1, 0.7490196, 1,
-0.09935702, -0.1076124, -1.809122, 0, 1, 0.7529412, 1,
-0.09870026, -0.1228403, -1.001173, 0, 1, 0.7607843, 1,
-0.09779096, 0.8755371, -1.1493, 0, 1, 0.7647059, 1,
-0.09773606, 0.1947068, -1.859365, 0, 1, 0.772549, 1,
-0.09700225, 0.9876896, -1.428892, 0, 1, 0.7764706, 1,
-0.09674497, -0.1972932, -3.226333, 0, 1, 0.7843137, 1,
-0.09581601, 0.4309581, 0.825888, 0, 1, 0.7882353, 1,
-0.09460971, 1.236184, 0.4783891, 0, 1, 0.7960784, 1,
-0.09442771, -0.1069781, -3.703969, 0, 1, 0.8039216, 1,
-0.09397022, -0.04709191, -2.129408, 0, 1, 0.8078431, 1,
-0.09303603, 0.8741355, 0.1615874, 0, 1, 0.8156863, 1,
-0.08512565, 0.7097161, -0.8359944, 0, 1, 0.8196079, 1,
-0.08383533, -0.9624732, -3.911226, 0, 1, 0.827451, 1,
-0.08339516, -0.6269098, -3.770347, 0, 1, 0.8313726, 1,
-0.08291794, 0.2573978, 0.6600367, 0, 1, 0.8392157, 1,
-0.08281414, 1.034952, 0.9030682, 0, 1, 0.8431373, 1,
-0.08053636, 0.1584031, -0.7329486, 0, 1, 0.8509804, 1,
-0.07698558, 0.427435, 2.136565, 0, 1, 0.854902, 1,
-0.0728143, 0.557191, 1.053982, 0, 1, 0.8627451, 1,
-0.07155353, -0.06497588, -1.836725, 0, 1, 0.8666667, 1,
-0.06286308, -0.156635, -2.387595, 0, 1, 0.8745098, 1,
-0.06157142, 2.637428, -1.044301, 0, 1, 0.8784314, 1,
-0.06152968, 0.2111668, -1.722486, 0, 1, 0.8862745, 1,
-0.06045658, -0.9091821, -4.140574, 0, 1, 0.8901961, 1,
-0.05114611, 0.005731681, -1.500666, 0, 1, 0.8980392, 1,
-0.04927149, -0.2374521, -2.320798, 0, 1, 0.9058824, 1,
-0.0482455, -2.105397, -4.133658, 0, 1, 0.9098039, 1,
-0.04667168, -0.6287886, -3.378299, 0, 1, 0.9176471, 1,
-0.04448369, -0.3628457, -3.627407, 0, 1, 0.9215686, 1,
-0.04400047, -1.082428, -2.758131, 0, 1, 0.9294118, 1,
-0.043892, -0.5403434, -1.779752, 0, 1, 0.9333333, 1,
-0.03998409, -0.419223, -1.324116, 0, 1, 0.9411765, 1,
-0.03522789, -0.3597919, -3.072286, 0, 1, 0.945098, 1,
-0.03322541, -1.392966, -2.467351, 0, 1, 0.9529412, 1,
-0.03193527, -0.8168707, -4.689007, 0, 1, 0.9568627, 1,
-0.02234369, -0.596185, -3.188937, 0, 1, 0.9647059, 1,
-0.02229323, 1.155539, 0.4028294, 0, 1, 0.9686275, 1,
-0.02214761, -0.05315056, -4.220249, 0, 1, 0.9764706, 1,
-0.01892031, -1.442792, -1.038958, 0, 1, 0.9803922, 1,
-0.01632976, 0.7242431, 0.1717929, 0, 1, 0.9882353, 1,
-0.009594011, 1.135275, 0.8532261, 0, 1, 0.9921569, 1,
-0.003953272, 0.8128238, 1.032727, 0, 1, 1, 1,
-0.00357963, -1.238618, -2.27352, 0, 0.9921569, 1, 1,
-0.001108099, 0.2563841, 0.9463263, 0, 0.9882353, 1, 1,
-0.0004446234, 1.991113, -0.4953314, 0, 0.9803922, 1, 1,
0.005741125, -0.7464031, 4.049664, 0, 0.9764706, 1, 1,
0.009189361, 0.7717254, 0.2623285, 0, 0.9686275, 1, 1,
0.009368731, -1.532562, 3.368574, 0, 0.9647059, 1, 1,
0.0136507, -1.738567, 2.960099, 0, 0.9568627, 1, 1,
0.02068525, 1.217206, -2.520808, 0, 0.9529412, 1, 1,
0.02231012, 1.086568, 1.253239, 0, 0.945098, 1, 1,
0.02550115, -0.00218985, 2.008656, 0, 0.9411765, 1, 1,
0.0267645, -0.6276829, 3.675246, 0, 0.9333333, 1, 1,
0.03140825, -0.7320262, 3.177431, 0, 0.9294118, 1, 1,
0.03417468, -1.057, 3.843731, 0, 0.9215686, 1, 1,
0.03424899, 0.9830713, -0.7780893, 0, 0.9176471, 1, 1,
0.04107418, -0.8976397, 2.820747, 0, 0.9098039, 1, 1,
0.0450385, -0.8748295, 1.408223, 0, 0.9058824, 1, 1,
0.04547859, 0.4045864, -0.7581412, 0, 0.8980392, 1, 1,
0.04849161, -0.132006, 4.772045, 0, 0.8901961, 1, 1,
0.05061108, 1.034256, 1.943631, 0, 0.8862745, 1, 1,
0.05120542, -0.3923946, 3.013825, 0, 0.8784314, 1, 1,
0.05524618, 0.208588, 1.125009, 0, 0.8745098, 1, 1,
0.05607248, 1.380911, 0.02253604, 0, 0.8666667, 1, 1,
0.05637965, 0.08144588, 0.9668345, 0, 0.8627451, 1, 1,
0.05766253, -0.006485418, 2.408939, 0, 0.854902, 1, 1,
0.06494469, 0.892378, -1.132604, 0, 0.8509804, 1, 1,
0.07232635, -0.7049347, 1.741577, 0, 0.8431373, 1, 1,
0.07311167, 0.2984962, -0.5549421, 0, 0.8392157, 1, 1,
0.07500028, 0.4786754, 0.9825379, 0, 0.8313726, 1, 1,
0.07882357, 0.6504736, 0.7992097, 0, 0.827451, 1, 1,
0.07895219, 0.1601431, -0.6927786, 0, 0.8196079, 1, 1,
0.08229429, 0.1554275, -0.04153448, 0, 0.8156863, 1, 1,
0.08311541, 1.030894, 1.93357, 0, 0.8078431, 1, 1,
0.08371086, -1.117369, 1.320495, 0, 0.8039216, 1, 1,
0.08468824, 0.9823065, -0.5156528, 0, 0.7960784, 1, 1,
0.08678618, 0.2572803, -0.5267701, 0, 0.7882353, 1, 1,
0.09321692, 1.111538, 2.070445, 0, 0.7843137, 1, 1,
0.0966247, 0.6179376, 0.7287819, 0, 0.7764706, 1, 1,
0.09678205, 0.3208709, -0.1751583, 0, 0.772549, 1, 1,
0.09993014, 1.305811, 2.147776, 0, 0.7647059, 1, 1,
0.1006136, 0.5632843, 0.1677744, 0, 0.7607843, 1, 1,
0.1023348, -0.9293032, 3.024735, 0, 0.7529412, 1, 1,
0.1024374, -0.3198562, 2.820972, 0, 0.7490196, 1, 1,
0.1094214, -0.9565326, 3.565542, 0, 0.7411765, 1, 1,
0.1098707, 0.2434731, 2.453431, 0, 0.7372549, 1, 1,
0.1151335, -0.5260872, -0.3100259, 0, 0.7294118, 1, 1,
0.1153216, -1.264333, 3.839044, 0, 0.7254902, 1, 1,
0.1171902, -0.3905711, 1.782848, 0, 0.7176471, 1, 1,
0.1178006, -1.102877, 3.746688, 0, 0.7137255, 1, 1,
0.1197897, -0.05574308, 1.015654, 0, 0.7058824, 1, 1,
0.1198091, 1.600515, 0.2774868, 0, 0.6980392, 1, 1,
0.1204707, -0.1286266, 3.384301, 0, 0.6941177, 1, 1,
0.1219586, 0.3880621, 1.636666, 0, 0.6862745, 1, 1,
0.1224363, -0.1434576, 1.86374, 0, 0.682353, 1, 1,
0.1237169, 1.836826, 0.7451355, 0, 0.6745098, 1, 1,
0.1238346, 0.3261927, 1.221383, 0, 0.6705883, 1, 1,
0.1321957, -1.220217, 3.093415, 0, 0.6627451, 1, 1,
0.1375381, -0.765116, 2.706141, 0, 0.6588235, 1, 1,
0.1433277, 0.741943, 0.9819031, 0, 0.6509804, 1, 1,
0.1460271, -0.227414, 2.528521, 0, 0.6470588, 1, 1,
0.1477649, 0.4945894, -0.5407586, 0, 0.6392157, 1, 1,
0.1519968, -1.475525, 4.205716, 0, 0.6352941, 1, 1,
0.1528057, -0.9315348, 5.536424, 0, 0.627451, 1, 1,
0.1561372, 0.5925534, -0.5219634, 0, 0.6235294, 1, 1,
0.1569911, -0.6323802, 3.472409, 0, 0.6156863, 1, 1,
0.1627931, -1.270979, 3.570685, 0, 0.6117647, 1, 1,
0.165167, 0.6087173, 0.5929291, 0, 0.6039216, 1, 1,
0.1660646, -0.7440094, 1.490408, 0, 0.5960785, 1, 1,
0.1703058, -1.494413, 4.094214, 0, 0.5921569, 1, 1,
0.1721585, 0.5863712, 1.81948, 0, 0.5843138, 1, 1,
0.1786274, 0.8056409, 1.04542, 0, 0.5803922, 1, 1,
0.1798918, 0.1185517, 0.2758708, 0, 0.572549, 1, 1,
0.1855528, 0.7595084, -0.4670186, 0, 0.5686275, 1, 1,
0.1884259, 0.4512081, 0.05498606, 0, 0.5607843, 1, 1,
0.1889666, 0.6049705, -0.4758414, 0, 0.5568628, 1, 1,
0.1891967, -0.6259836, 3.685076, 0, 0.5490196, 1, 1,
0.1903213, -0.02313344, 2.065377, 0, 0.5450981, 1, 1,
0.1948964, -0.2470044, 2.458784, 0, 0.5372549, 1, 1,
0.1949219, -0.3476916, 1.741458, 0, 0.5333334, 1, 1,
0.1983036, -0.0008878252, 1.530951, 0, 0.5254902, 1, 1,
0.2117704, 0.3858258, 0.5360698, 0, 0.5215687, 1, 1,
0.2155798, 0.2600615, 1.306438, 0, 0.5137255, 1, 1,
0.2179597, -0.3243028, 3.356033, 0, 0.509804, 1, 1,
0.2187837, 0.09830992, 1.036986, 0, 0.5019608, 1, 1,
0.2190749, -0.2345584, 2.484141, 0, 0.4941176, 1, 1,
0.2213824, -1.990368, 4.453578, 0, 0.4901961, 1, 1,
0.2216673, -0.3256961, 1.598521, 0, 0.4823529, 1, 1,
0.2221132, -0.2607135, 0.7476121, 0, 0.4784314, 1, 1,
0.2234651, 0.6123067, 1.944087, 0, 0.4705882, 1, 1,
0.2277418, 0.8724354, 0.6394044, 0, 0.4666667, 1, 1,
0.2288027, 0.7078871, 0.5271325, 0, 0.4588235, 1, 1,
0.2300717, 0.08278733, -0.008438292, 0, 0.454902, 1, 1,
0.2301755, 0.1777198, 0.6567552, 0, 0.4470588, 1, 1,
0.2371437, 0.2427348, 1.166289, 0, 0.4431373, 1, 1,
0.2383416, 0.6128305, 1.144991, 0, 0.4352941, 1, 1,
0.2416903, 0.5369793, -0.5020718, 0, 0.4313726, 1, 1,
0.2420097, -1.473125, 1.642491, 0, 0.4235294, 1, 1,
0.2421416, 0.7074483, 0.8839366, 0, 0.4196078, 1, 1,
0.2453199, 0.44675, 0.1763479, 0, 0.4117647, 1, 1,
0.2525039, -0.5849916, 3.540576, 0, 0.4078431, 1, 1,
0.2530428, -1.246801, 3.872131, 0, 0.4, 1, 1,
0.2549213, -1.09596, 3.611362, 0, 0.3921569, 1, 1,
0.2551489, 0.4128054, 0.9539521, 0, 0.3882353, 1, 1,
0.2578184, -0.5161405, 3.023856, 0, 0.3803922, 1, 1,
0.2610107, 1.720638, -0.1262804, 0, 0.3764706, 1, 1,
0.2645884, 1.940768, -0.3627566, 0, 0.3686275, 1, 1,
0.2648132, 2.278198, 0.2514776, 0, 0.3647059, 1, 1,
0.2653227, 1.326639, 1.104329, 0, 0.3568628, 1, 1,
0.2665732, -0.06496345, 1.041699, 0, 0.3529412, 1, 1,
0.2667946, -0.04092431, 1.759733, 0, 0.345098, 1, 1,
0.267412, 0.1679088, 1.608043, 0, 0.3411765, 1, 1,
0.2710312, -2.491688, 2.070589, 0, 0.3333333, 1, 1,
0.2866847, -1.342078, 1.359416, 0, 0.3294118, 1, 1,
0.2875628, 0.5835501, 0.8361294, 0, 0.3215686, 1, 1,
0.2884347, -1.340293, 3.939113, 0, 0.3176471, 1, 1,
0.2893127, -0.5486186, 2.214441, 0, 0.3098039, 1, 1,
0.2914938, -1.009982, 3.081546, 0, 0.3058824, 1, 1,
0.2968404, 0.2024778, 0.9432639, 0, 0.2980392, 1, 1,
0.29846, -0.1597882, 0.8901516, 0, 0.2901961, 1, 1,
0.2999772, 0.2232215, 0.860853, 0, 0.2862745, 1, 1,
0.3000054, -0.9838024, 1.666912, 0, 0.2784314, 1, 1,
0.303212, -0.6193694, 1.990057, 0, 0.2745098, 1, 1,
0.308276, -1.197688, 3.813618, 0, 0.2666667, 1, 1,
0.3119134, -0.1790081, 1.215276, 0, 0.2627451, 1, 1,
0.3164073, 1.007655, 0.1046774, 0, 0.254902, 1, 1,
0.3211546, 0.1927625, 1.133252, 0, 0.2509804, 1, 1,
0.3220127, 0.1417106, -0.0700383, 0, 0.2431373, 1, 1,
0.3278641, -2.536825, 4.022294, 0, 0.2392157, 1, 1,
0.3296981, -0.1821427, 2.841997, 0, 0.2313726, 1, 1,
0.3337302, -0.2871803, 3.878765, 0, 0.227451, 1, 1,
0.33607, 0.4381085, -0.0168064, 0, 0.2196078, 1, 1,
0.3440414, -0.4093679, 3.660233, 0, 0.2156863, 1, 1,
0.3447494, 0.9108153, -0.4463079, 0, 0.2078431, 1, 1,
0.3458113, 0.5314072, 0.9381325, 0, 0.2039216, 1, 1,
0.3467236, 0.8387867, 0.06396504, 0, 0.1960784, 1, 1,
0.3495454, 0.9760001, -0.4310474, 0, 0.1882353, 1, 1,
0.3511754, 0.1538978, 1.201931, 0, 0.1843137, 1, 1,
0.3547203, -0.9550256, 3.231675, 0, 0.1764706, 1, 1,
0.3590352, -0.2268019, 0.8092985, 0, 0.172549, 1, 1,
0.3678929, 1.672178, -0.4373792, 0, 0.1647059, 1, 1,
0.3696052, 0.9387468, -0.1321678, 0, 0.1607843, 1, 1,
0.371157, 0.1394709, 1.154092, 0, 0.1529412, 1, 1,
0.3713219, -1.703292, 1.615645, 0, 0.1490196, 1, 1,
0.3754999, 0.2627003, 2.170376, 0, 0.1411765, 1, 1,
0.3761857, 1.163532, -0.1541655, 0, 0.1372549, 1, 1,
0.3767774, 0.5269947, 0.2641263, 0, 0.1294118, 1, 1,
0.3832667, -1.491992, 4.54661, 0, 0.1254902, 1, 1,
0.3844013, 1.369041, -1.203999, 0, 0.1176471, 1, 1,
0.3859157, -1.002441, 0.1528376, 0, 0.1137255, 1, 1,
0.3873359, -0.1108089, 2.957344, 0, 0.1058824, 1, 1,
0.3883847, -0.1132598, 0.966052, 0, 0.09803922, 1, 1,
0.3909239, -2.121319, 0.7369929, 0, 0.09411765, 1, 1,
0.3919793, 0.1003527, 0.09108983, 0, 0.08627451, 1, 1,
0.3947344, 0.03472842, 0.2327964, 0, 0.08235294, 1, 1,
0.3960215, 0.6499916, 1.301276, 0, 0.07450981, 1, 1,
0.3967548, 0.1669585, 1.813704, 0, 0.07058824, 1, 1,
0.3968354, -0.4981541, 1.362948, 0, 0.0627451, 1, 1,
0.398349, 0.5647916, 0.8810045, 0, 0.05882353, 1, 1,
0.398566, 0.7995069, -0.7920756, 0, 0.05098039, 1, 1,
0.3988176, -0.2943397, 0.771382, 0, 0.04705882, 1, 1,
0.4010197, 0.8204985, 1.914718, 0, 0.03921569, 1, 1,
0.4021631, 0.7437078, 2.871829, 0, 0.03529412, 1, 1,
0.4053701, 0.4526984, 3.937303, 0, 0.02745098, 1, 1,
0.4070683, -0.1843249, 1.964771, 0, 0.02352941, 1, 1,
0.4073777, 1.610654, -0.3317851, 0, 0.01568628, 1, 1,
0.4074184, 0.3474142, 2.423221, 0, 0.01176471, 1, 1,
0.4129681, -0.3165217, 4.779042, 0, 0.003921569, 1, 1,
0.4134119, -0.6882167, 1.517966, 0.003921569, 0, 1, 1,
0.4173883, -1.408663, 2.609821, 0.007843138, 0, 1, 1,
0.4245024, -1.557281, 1.980235, 0.01568628, 0, 1, 1,
0.4273139, -0.2678278, 0.6351941, 0.01960784, 0, 1, 1,
0.4296193, 2.61449, -1.807529, 0.02745098, 0, 1, 1,
0.4298541, 2.3238, -0.1486382, 0.03137255, 0, 1, 1,
0.4330725, -0.2134292, 3.20193, 0.03921569, 0, 1, 1,
0.4389933, 0.7813656, 0.7621329, 0.04313726, 0, 1, 1,
0.4460359, 1.607201, 0.6974255, 0.05098039, 0, 1, 1,
0.4579418, -0.1993402, 3.082801, 0.05490196, 0, 1, 1,
0.4624043, 0.4727844, 0.1164386, 0.0627451, 0, 1, 1,
0.4649733, 0.6153256, 0.6068045, 0.06666667, 0, 1, 1,
0.4655044, 0.2249012, 0.5956097, 0.07450981, 0, 1, 1,
0.4662605, 1.133518, -1.134746, 0.07843138, 0, 1, 1,
0.4667932, 1.320462, 0.5888368, 0.08627451, 0, 1, 1,
0.4744716, 0.7078215, -0.3629869, 0.09019608, 0, 1, 1,
0.4787209, -0.518698, 2.756966, 0.09803922, 0, 1, 1,
0.4800535, 0.6979207, 1.223505, 0.1058824, 0, 1, 1,
0.4853136, 1.915287, 0.6596092, 0.1098039, 0, 1, 1,
0.4936734, 2.536922, -2.253164, 0.1176471, 0, 1, 1,
0.498331, 1.133314, 0.2425459, 0.1215686, 0, 1, 1,
0.4985746, 0.6028309, 2.002032, 0.1294118, 0, 1, 1,
0.5004994, -0.5470529, 3.213683, 0.1333333, 0, 1, 1,
0.5028262, -0.5350614, 2.282725, 0.1411765, 0, 1, 1,
0.5037704, -0.9526246, 3.691025, 0.145098, 0, 1, 1,
0.5057143, -0.6579705, 1.843987, 0.1529412, 0, 1, 1,
0.5060917, -0.647293, 1.249604, 0.1568628, 0, 1, 1,
0.5074454, 0.4496077, 1.829229, 0.1647059, 0, 1, 1,
0.5075299, 0.9813906, 0.3750815, 0.1686275, 0, 1, 1,
0.5078218, -0.04515032, 1.806675, 0.1764706, 0, 1, 1,
0.5097321, 0.1253688, 0.4308802, 0.1803922, 0, 1, 1,
0.5106767, 0.4659154, -2.912043, 0.1882353, 0, 1, 1,
0.5118311, 1.017193, -0.2944794, 0.1921569, 0, 1, 1,
0.5171639, 1.781622, 0.1670304, 0.2, 0, 1, 1,
0.5256299, -0.1130004, 0.625259, 0.2078431, 0, 1, 1,
0.5277535, 1.369727, -1.096106, 0.2117647, 0, 1, 1,
0.5317398, -1.185091, 2.545539, 0.2196078, 0, 1, 1,
0.5390899, 0.7287447, 0.0928897, 0.2235294, 0, 1, 1,
0.5414966, -0.5612896, 3.322147, 0.2313726, 0, 1, 1,
0.545075, 0.9114244, 3.650748, 0.2352941, 0, 1, 1,
0.5484098, 0.4284987, 2.655482, 0.2431373, 0, 1, 1,
0.5505145, 1.471064, 1.897508, 0.2470588, 0, 1, 1,
0.5559494, 0.9351506, 0.8625969, 0.254902, 0, 1, 1,
0.5568462, -0.6165407, 2.72116, 0.2588235, 0, 1, 1,
0.5604472, 0.5212781, 0.9669142, 0.2666667, 0, 1, 1,
0.5623135, 0.03581417, 0.3563462, 0.2705882, 0, 1, 1,
0.5638081, 0.03226883, 1.743284, 0.2784314, 0, 1, 1,
0.564994, -0.2492581, 0.3869571, 0.282353, 0, 1, 1,
0.5653429, -1.459815, 2.068592, 0.2901961, 0, 1, 1,
0.5683408, -0.3673911, 2.843259, 0.2941177, 0, 1, 1,
0.5732555, -0.8668947, 2.319131, 0.3019608, 0, 1, 1,
0.5753304, -0.7905399, 4.299434, 0.3098039, 0, 1, 1,
0.5818253, 0.4569021, 0.9899952, 0.3137255, 0, 1, 1,
0.5827588, -0.9972186, 1.958586, 0.3215686, 0, 1, 1,
0.5868397, -0.3505628, 3.245696, 0.3254902, 0, 1, 1,
0.5875864, 1.495872, 1.153346, 0.3333333, 0, 1, 1,
0.5913928, 1.151437, 2.251736, 0.3372549, 0, 1, 1,
0.5964742, -0.5599702, 2.883997, 0.345098, 0, 1, 1,
0.5980178, -0.9964717, 1.406929, 0.3490196, 0, 1, 1,
0.600179, -0.6358476, 2.099983, 0.3568628, 0, 1, 1,
0.6061836, 1.204034, 0.8661618, 0.3607843, 0, 1, 1,
0.6117998, -1.34058, 3.585591, 0.3686275, 0, 1, 1,
0.6142781, 1.714697, -0.9005974, 0.372549, 0, 1, 1,
0.6174658, 0.2011732, 1.524354, 0.3803922, 0, 1, 1,
0.6227719, -0.5599093, 1.051646, 0.3843137, 0, 1, 1,
0.6250072, -0.1792981, 1.951144, 0.3921569, 0, 1, 1,
0.6254457, -1.10434, 4.578352, 0.3960784, 0, 1, 1,
0.6341149, 1.965034, -1.08891, 0.4039216, 0, 1, 1,
0.6343085, -1.305701, 1.080769, 0.4117647, 0, 1, 1,
0.6350679, -2.290608, 2.285902, 0.4156863, 0, 1, 1,
0.6360416, -1.214541, 2.868431, 0.4235294, 0, 1, 1,
0.6368162, 0.5311383, 0.7789132, 0.427451, 0, 1, 1,
0.6398858, 0.6508029, -0.3317495, 0.4352941, 0, 1, 1,
0.6403272, -0.7837121, 0.6508929, 0.4392157, 0, 1, 1,
0.6403913, -1.325735, 1.070492, 0.4470588, 0, 1, 1,
0.6414611, -0.9310184, 1.972289, 0.4509804, 0, 1, 1,
0.6419575, -0.5737379, 3.183952, 0.4588235, 0, 1, 1,
0.6518722, 0.5363302, -0.2416997, 0.4627451, 0, 1, 1,
0.6560386, 0.5373088, 1.159429, 0.4705882, 0, 1, 1,
0.6620594, 1.032936, 0.02510813, 0.4745098, 0, 1, 1,
0.6638303, 2.854443, 0.7684474, 0.4823529, 0, 1, 1,
0.6640491, 1.108715, 0.5622115, 0.4862745, 0, 1, 1,
0.6650424, 0.3875867, 1.339849, 0.4941176, 0, 1, 1,
0.6665426, 0.0539282, 1.195455, 0.5019608, 0, 1, 1,
0.6697127, 1.044357, -1.314974, 0.5058824, 0, 1, 1,
0.6746845, 0.5879709, 0.6034785, 0.5137255, 0, 1, 1,
0.6763254, -1.146339, 2.836873, 0.5176471, 0, 1, 1,
0.6842753, 0.9762143, 1.086338, 0.5254902, 0, 1, 1,
0.685734, 0.09460635, 2.086694, 0.5294118, 0, 1, 1,
0.6977798, -0.8430082, 5.907994, 0.5372549, 0, 1, 1,
0.7000666, -0.004000954, 2.478555, 0.5411765, 0, 1, 1,
0.7068942, -0.2315346, 1.942095, 0.5490196, 0, 1, 1,
0.7150653, -0.9732503, 3.186543, 0.5529412, 0, 1, 1,
0.7177894, 1.168476, 0.8124028, 0.5607843, 0, 1, 1,
0.7355589, 0.4682434, 2.306448, 0.5647059, 0, 1, 1,
0.7393944, -0.4982493, 1.602579, 0.572549, 0, 1, 1,
0.7429485, -1.059882, 2.057992, 0.5764706, 0, 1, 1,
0.7435766, -0.4651373, 2.743327, 0.5843138, 0, 1, 1,
0.7444332, -0.8650609, 2.090816, 0.5882353, 0, 1, 1,
0.7467731, -1.192916, 2.209995, 0.5960785, 0, 1, 1,
0.7469308, -1.566545, 3.633381, 0.6039216, 0, 1, 1,
0.7505031, 0.1625496, 1.41204, 0.6078432, 0, 1, 1,
0.750817, 0.001439917, 0.3815928, 0.6156863, 0, 1, 1,
0.7613522, -0.05383022, 1.404564, 0.6196079, 0, 1, 1,
0.7614458, -1.583554, 2.076309, 0.627451, 0, 1, 1,
0.7631921, 0.3862201, 2.344146, 0.6313726, 0, 1, 1,
0.7640427, -0.1270238, 0.8476029, 0.6392157, 0, 1, 1,
0.7654426, -0.6995221, 2.896333, 0.6431373, 0, 1, 1,
0.7713867, 0.468083, 0.6448779, 0.6509804, 0, 1, 1,
0.7725898, 0.3449834, 1.09226, 0.654902, 0, 1, 1,
0.7741222, -1.683139, 2.724519, 0.6627451, 0, 1, 1,
0.7742882, 1.334052, 2.106112, 0.6666667, 0, 1, 1,
0.7742889, 0.9921308, 2.513357, 0.6745098, 0, 1, 1,
0.7805846, -0.636137, 1.486112, 0.6784314, 0, 1, 1,
0.781917, -0.4386485, 1.130916, 0.6862745, 0, 1, 1,
0.7837159, -0.6666834, 1.499478, 0.6901961, 0, 1, 1,
0.7951854, -0.5925711, 0.8489566, 0.6980392, 0, 1, 1,
0.795643, 1.341764, 1.24465, 0.7058824, 0, 1, 1,
0.7995771, 1.474915, 0.1740733, 0.7098039, 0, 1, 1,
0.8026631, -0.2831596, 2.804214, 0.7176471, 0, 1, 1,
0.8049453, 0.1173686, 0.7051206, 0.7215686, 0, 1, 1,
0.8061442, 2.31147, 0.8970878, 0.7294118, 0, 1, 1,
0.8088912, 0.1808725, 2.333736, 0.7333333, 0, 1, 1,
0.8089253, -0.5969245, 4.059216, 0.7411765, 0, 1, 1,
0.8108066, 0.9625155, 2.175527, 0.7450981, 0, 1, 1,
0.8128453, -1.028137, 1.276905, 0.7529412, 0, 1, 1,
0.8203293, 1.576875, 1.017351, 0.7568628, 0, 1, 1,
0.8214227, -1.052132, 2.192854, 0.7647059, 0, 1, 1,
0.8251545, -0.2726627, 1.112613, 0.7686275, 0, 1, 1,
0.8265733, 1.738819, -0.5012676, 0.7764706, 0, 1, 1,
0.8293043, 0.5005533, 1.297375, 0.7803922, 0, 1, 1,
0.8305154, 0.4203296, 0.04672841, 0.7882353, 0, 1, 1,
0.835522, 1.392512, 0.811231, 0.7921569, 0, 1, 1,
0.8374868, 2.346869, -0.09054541, 0.8, 0, 1, 1,
0.8397314, 1.718099, 0.01704265, 0.8078431, 0, 1, 1,
0.8422197, -0.7464052, 1.030163, 0.8117647, 0, 1, 1,
0.8469671, 1.675234, 0.1962738, 0.8196079, 0, 1, 1,
0.8526796, -0.230173, 0.9981108, 0.8235294, 0, 1, 1,
0.8552761, 0.4486843, 0.1092103, 0.8313726, 0, 1, 1,
0.8558288, -1.269982, 4.561874, 0.8352941, 0, 1, 1,
0.8648748, -1.002198, 3.282861, 0.8431373, 0, 1, 1,
0.8678156, -0.006746705, 2.065284, 0.8470588, 0, 1, 1,
0.8690549, 0.3085681, 1.149767, 0.854902, 0, 1, 1,
0.8727348, 1.922698, 1.482646, 0.8588235, 0, 1, 1,
0.8881817, -0.2309565, 2.460984, 0.8666667, 0, 1, 1,
0.8896834, -1.984108, 1.334291, 0.8705882, 0, 1, 1,
0.8908223, 1.221194, 3.82887, 0.8784314, 0, 1, 1,
0.8940449, 1.298852, 0.2055016, 0.8823529, 0, 1, 1,
0.8980522, -1.034652, 1.092675, 0.8901961, 0, 1, 1,
0.8981256, -0.01244686, 1.048057, 0.8941177, 0, 1, 1,
0.8985068, 0.7051585, 1.027977, 0.9019608, 0, 1, 1,
0.9033213, -0.8061296, 3.131917, 0.9098039, 0, 1, 1,
0.9066887, -0.03074489, 1.881699, 0.9137255, 0, 1, 1,
0.9071606, 0.7000071, 0.20113, 0.9215686, 0, 1, 1,
0.9122784, -1.775652, 2.564204, 0.9254902, 0, 1, 1,
0.9124022, -0.1177696, 1.135335, 0.9333333, 0, 1, 1,
0.9186147, 0.3782458, -0.2599055, 0.9372549, 0, 1, 1,
0.9220775, 0.5406966, -0.2531012, 0.945098, 0, 1, 1,
0.9240468, -3.141081, 3.745839, 0.9490196, 0, 1, 1,
0.9301896, -0.1305063, 2.824807, 0.9568627, 0, 1, 1,
0.931336, -0.2322475, 1.453128, 0.9607843, 0, 1, 1,
0.9315435, 0.5318864, 1.294213, 0.9686275, 0, 1, 1,
0.9382289, 0.886259, 0.690208, 0.972549, 0, 1, 1,
0.9387138, -3.508785, 5.574598, 0.9803922, 0, 1, 1,
0.9425401, 1.360015, 3.317385, 0.9843137, 0, 1, 1,
0.9475392, -0.8428329, 0.4001383, 0.9921569, 0, 1, 1,
0.950679, -0.2813587, 3.072174, 0.9960784, 0, 1, 1,
0.950704, 1.428234, 0.4349227, 1, 0, 0.9960784, 1,
0.9630558, 2.659554, -0.1291178, 1, 0, 0.9882353, 1,
0.9747033, -2.332755, 0.4165314, 1, 0, 0.9843137, 1,
0.9749314, -2.368452, 3.297212, 1, 0, 0.9764706, 1,
0.9750593, -0.02957394, 1.7386, 1, 0, 0.972549, 1,
0.9758713, 0.5985687, 0.7133536, 1, 0, 0.9647059, 1,
0.9790413, 0.7467852, 0.5931568, 1, 0, 0.9607843, 1,
0.9923357, 0.3833982, 1.018749, 1, 0, 0.9529412, 1,
0.9968816, 1.000788, -0.5331593, 1, 0, 0.9490196, 1,
0.9980289, -0.8762414, 2.244539, 1, 0, 0.9411765, 1,
0.9985927, -1.061446, 2.583348, 1, 0, 0.9372549, 1,
0.9987007, 0.5088863, 0.7468609, 1, 0, 0.9294118, 1,
0.9998975, -0.08518349, 1.453207, 1, 0, 0.9254902, 1,
1.005376, -0.8959253, 2.713737, 1, 0, 0.9176471, 1,
1.010216, 2.545663, 0.3105851, 1, 0, 0.9137255, 1,
1.011179, -0.6111258, 3.360698, 1, 0, 0.9058824, 1,
1.013199, -0.2328778, 1.412739, 1, 0, 0.9019608, 1,
1.019132, -0.6443154, 2.204039, 1, 0, 0.8941177, 1,
1.028387, -0.554548, 1.945266, 1, 0, 0.8862745, 1,
1.031694, -0.6505756, 3.617608, 1, 0, 0.8823529, 1,
1.034682, 0.2497545, -0.4515564, 1, 0, 0.8745098, 1,
1.037567, -0.7872123, 0.4901621, 1, 0, 0.8705882, 1,
1.038118, 0.4131249, 0.4780855, 1, 0, 0.8627451, 1,
1.039994, 1.212805, 1.275672, 1, 0, 0.8588235, 1,
1.04062, -1.003544, 3.445589, 1, 0, 0.8509804, 1,
1.042089, 0.9013277, 0.4670868, 1, 0, 0.8470588, 1,
1.050427, 0.03380381, 2.226633, 1, 0, 0.8392157, 1,
1.055397, -0.9136088, 3.189283, 1, 0, 0.8352941, 1,
1.059319, -1.206269, 4.033405, 1, 0, 0.827451, 1,
1.081661, -0.003681234, 0.1402593, 1, 0, 0.8235294, 1,
1.086288, 0.4123474, 1.143498, 1, 0, 0.8156863, 1,
1.089056, -0.5534226, 2.176339, 1, 0, 0.8117647, 1,
1.093779, 0.4681464, 0.8324137, 1, 0, 0.8039216, 1,
1.095902, -0.9066635, 2.908032, 1, 0, 0.7960784, 1,
1.100973, 0.3615685, 0.7022886, 1, 0, 0.7921569, 1,
1.120501, -1.006505, 2.759492, 1, 0, 0.7843137, 1,
1.123021, 1.330483, 0.5810409, 1, 0, 0.7803922, 1,
1.123373, -1.593013, 3.515589, 1, 0, 0.772549, 1,
1.123495, 0.5129868, 1.863522, 1, 0, 0.7686275, 1,
1.12761, -1.852807, 2.085353, 1, 0, 0.7607843, 1,
1.139034, 0.1819865, 1.877161, 1, 0, 0.7568628, 1,
1.151843, 1.605081, 0.8930709, 1, 0, 0.7490196, 1,
1.153539, 0.694255, 0.132186, 1, 0, 0.7450981, 1,
1.154492, -0.08616591, -0.2864861, 1, 0, 0.7372549, 1,
1.169735, 0.2139214, 0.6450795, 1, 0, 0.7333333, 1,
1.180607, 0.4282098, 0.5063766, 1, 0, 0.7254902, 1,
1.185856, -0.401795, 1.609999, 1, 0, 0.7215686, 1,
1.189684, -1.420932, 3.30018, 1, 0, 0.7137255, 1,
1.197769, 0.7835355, 1.651607, 1, 0, 0.7098039, 1,
1.201717, -0.05792012, 1.725092, 1, 0, 0.7019608, 1,
1.205523, 0.3721139, 0.1102338, 1, 0, 0.6941177, 1,
1.226642, 0.48583, 1.463601, 1, 0, 0.6901961, 1,
1.226909, -0.9750077, 1.876591, 1, 0, 0.682353, 1,
1.229755, -0.3490779, 2.752574, 1, 0, 0.6784314, 1,
1.232397, -0.79106, 2.430946, 1, 0, 0.6705883, 1,
1.236334, 0.69545, 0.5562144, 1, 0, 0.6666667, 1,
1.248833, -0.3537529, 0.2690436, 1, 0, 0.6588235, 1,
1.250663, -1.903229, 2.391834, 1, 0, 0.654902, 1,
1.251733, -2.54229, 3.472689, 1, 0, 0.6470588, 1,
1.253141, 2.349072, -0.03733869, 1, 0, 0.6431373, 1,
1.262525, -0.2765338, 0.4099182, 1, 0, 0.6352941, 1,
1.263631, -1.41101, 3.774679, 1, 0, 0.6313726, 1,
1.265854, 1.288931, 1.525798, 1, 0, 0.6235294, 1,
1.27304, -1.656488, 2.07335, 1, 0, 0.6196079, 1,
1.274075, -0.1324998, 1.01472, 1, 0, 0.6117647, 1,
1.278892, -1.042084, 0.9066436, 1, 0, 0.6078432, 1,
1.280787, -0.5651928, 1.884078, 1, 0, 0.6, 1,
1.288212, 1.123526, 1.223848, 1, 0, 0.5921569, 1,
1.292109, 0.8314438, 1.314755, 1, 0, 0.5882353, 1,
1.309108, -0.2557299, 1.081877, 1, 0, 0.5803922, 1,
1.310437, 0.1827052, 1.090702, 1, 0, 0.5764706, 1,
1.312233, 1.026624, 0.9303221, 1, 0, 0.5686275, 1,
1.32095, -0.5181985, 1.516848, 1, 0, 0.5647059, 1,
1.326077, -0.9735505, 2.393063, 1, 0, 0.5568628, 1,
1.331194, -1.311649, 1.925824, 1, 0, 0.5529412, 1,
1.340028, -0.8945633, 2.296256, 1, 0, 0.5450981, 1,
1.342943, 2.298778, 2.909678, 1, 0, 0.5411765, 1,
1.345147, 1.039475, 2.293061, 1, 0, 0.5333334, 1,
1.355386, -1.266471, 2.234452, 1, 0, 0.5294118, 1,
1.360847, 0.6285571, -0.7899125, 1, 0, 0.5215687, 1,
1.366759, 0.2327285, 1.985419, 1, 0, 0.5176471, 1,
1.368596, 1.193281, 0.08468445, 1, 0, 0.509804, 1,
1.371542, 0.6518012, 1.087399, 1, 0, 0.5058824, 1,
1.383704, 1.372599, 2.443847, 1, 0, 0.4980392, 1,
1.400996, -0.4810427, 2.19271, 1, 0, 0.4901961, 1,
1.404056, -1.543401, 1.502288, 1, 0, 0.4862745, 1,
1.404325, 0.2235271, 0.0158956, 1, 0, 0.4784314, 1,
1.407386, 0.7329308, 2.129602, 1, 0, 0.4745098, 1,
1.409582, -0.1788329, 0.771772, 1, 0, 0.4666667, 1,
1.426238, 0.9320551, 0.9309666, 1, 0, 0.4627451, 1,
1.426988, -0.1391574, 2.635574, 1, 0, 0.454902, 1,
1.4307, 0.03523167, 1.355744, 1, 0, 0.4509804, 1,
1.446178, -0.4358118, 0.9941114, 1, 0, 0.4431373, 1,
1.446963, -0.6614701, 2.62569, 1, 0, 0.4392157, 1,
1.448416, 2.549116, -0.2682674, 1, 0, 0.4313726, 1,
1.463306, 1.980888, 1.485726, 1, 0, 0.427451, 1,
1.465441, -0.5958179, 2.223958, 1, 0, 0.4196078, 1,
1.468152, -0.3821308, 1.672866, 1, 0, 0.4156863, 1,
1.471797, 2.103369, 1.148572, 1, 0, 0.4078431, 1,
1.485155, 0.3936209, -0.2535621, 1, 0, 0.4039216, 1,
1.486389, 0.7715959, 1.564453, 1, 0, 0.3960784, 1,
1.487881, -1.406198, 2.658308, 1, 0, 0.3882353, 1,
1.500287, 0.3024543, 1.020309, 1, 0, 0.3843137, 1,
1.507936, -2.497931, 2.936763, 1, 0, 0.3764706, 1,
1.511114, -1.544533, 3.547331, 1, 0, 0.372549, 1,
1.523852, 0.3584275, 0.6849322, 1, 0, 0.3647059, 1,
1.525568, -0.1193827, 3.165269, 1, 0, 0.3607843, 1,
1.529273, -1.402221, 0.6251798, 1, 0, 0.3529412, 1,
1.564375, 1.394947, 0.4405409, 1, 0, 0.3490196, 1,
1.567911, 0.8239669, 0.5746388, 1, 0, 0.3411765, 1,
1.569343, -1.065512, 1.826306, 1, 0, 0.3372549, 1,
1.575032, 0.7139959, 1.956255, 1, 0, 0.3294118, 1,
1.577174, 0.5408359, 0.8807579, 1, 0, 0.3254902, 1,
1.584598, -0.6481278, 2.118047, 1, 0, 0.3176471, 1,
1.588405, -0.4531575, 2.452348, 1, 0, 0.3137255, 1,
1.592098, -0.8486589, 0.1446498, 1, 0, 0.3058824, 1,
1.616413, -0.1036769, 1.477354, 1, 0, 0.2980392, 1,
1.624041, -0.1407273, 1.36525, 1, 0, 0.2941177, 1,
1.632751, -0.4482535, 0.2729398, 1, 0, 0.2862745, 1,
1.65048, 0.2556987, 4.20059, 1, 0, 0.282353, 1,
1.662127, 0.03575824, 2.672896, 1, 0, 0.2745098, 1,
1.687012, -0.4845805, 0.3003802, 1, 0, 0.2705882, 1,
1.691796, 0.6158984, 0.8425878, 1, 0, 0.2627451, 1,
1.696572, 1.799875, 1.127935, 1, 0, 0.2588235, 1,
1.753958, 0.2175273, 0.8634625, 1, 0, 0.2509804, 1,
1.767424, 1.319183, 1.390246, 1, 0, 0.2470588, 1,
1.773967, -0.7391266, 2.615747, 1, 0, 0.2392157, 1,
1.797657, -0.8126161, 1.669466, 1, 0, 0.2352941, 1,
1.801201, -0.4722807, 0.9963465, 1, 0, 0.227451, 1,
1.809975, 1.261742, 0.9855482, 1, 0, 0.2235294, 1,
1.828921, -0.6969265, 2.071838, 1, 0, 0.2156863, 1,
1.842133, -3.943816, 3.495555, 1, 0, 0.2117647, 1,
1.847012, 0.4953893, 1.202304, 1, 0, 0.2039216, 1,
1.860665, 0.5252795, 1.752684, 1, 0, 0.1960784, 1,
1.861755, 1.270208, 0.3808959, 1, 0, 0.1921569, 1,
1.875233, 0.1424676, 2.418043, 1, 0, 0.1843137, 1,
1.884346, -0.252929, 2.833741, 1, 0, 0.1803922, 1,
1.892727, -0.191084, 3.465632, 1, 0, 0.172549, 1,
1.89316, 1.15675, 2.609364, 1, 0, 0.1686275, 1,
1.910017, 0.7040848, 1.134224, 1, 0, 0.1607843, 1,
1.936868, 1.180887, 1.242355, 1, 0, 0.1568628, 1,
1.949985, -0.5598538, 3.714486, 1, 0, 0.1490196, 1,
1.958965, 1.77845, 1.468741, 1, 0, 0.145098, 1,
1.977896, -0.03055023, 2.83165, 1, 0, 0.1372549, 1,
2.002691, 0.5676183, 0.9551536, 1, 0, 0.1333333, 1,
2.007964, 0.7841406, 1.850205, 1, 0, 0.1254902, 1,
2.04837, 0.580651, 1.69403, 1, 0, 0.1215686, 1,
2.06189, -1.002788, 3.388196, 1, 0, 0.1137255, 1,
2.068098, 0.4513088, 0.2952304, 1, 0, 0.1098039, 1,
2.08627, -0.7539392, 1.303989, 1, 0, 0.1019608, 1,
2.09831, -1.111284, 1.487625, 1, 0, 0.09411765, 1,
2.105665, -0.8537132, 1.22176, 1, 0, 0.09019608, 1,
2.123393, -0.9338319, 1.124835, 1, 0, 0.08235294, 1,
2.148849, -0.9463505, 4.052764, 1, 0, 0.07843138, 1,
2.173888, -0.666387, 0.5188892, 1, 0, 0.07058824, 1,
2.249212, 1.758722, 0.4402763, 1, 0, 0.06666667, 1,
2.265303, 0.6745995, 1.844095, 1, 0, 0.05882353, 1,
2.276202, 0.1300041, 3.213439, 1, 0, 0.05490196, 1,
2.311842, 0.08004286, -0.9540448, 1, 0, 0.04705882, 1,
2.380805, 1.313073, 1.858274, 1, 0, 0.04313726, 1,
2.741628, -0.03289613, 2.570226, 1, 0, 0.03529412, 1,
2.892973, -1.224809, 3.320118, 1, 0, 0.03137255, 1,
2.983394, -0.03340447, 1.697945, 1, 0, 0.02352941, 1,
3.064675, -0.5822867, 3.201896, 1, 0, 0.01960784, 1,
3.323982, -0.1103632, 1.210615, 1, 0, 0.01176471, 1,
3.394698, -0.2641123, 1.761484, 1, 0, 0.007843138, 1
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
0.1568246, -5.096121, -6.91804, 0, -0.5, 0.5, 0.5,
0.1568246, -5.096121, -6.91804, 1, -0.5, 0.5, 0.5,
0.1568246, -5.096121, -6.91804, 1, 1.5, 0.5, 0.5,
0.1568246, -5.096121, -6.91804, 0, 1.5, 0.5, 0.5
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
-4.178688, -0.5446864, -6.91804, 0, -0.5, 0.5, 0.5,
-4.178688, -0.5446864, -6.91804, 1, -0.5, 0.5, 0.5,
-4.178688, -0.5446864, -6.91804, 1, 1.5, 0.5, 0.5,
-4.178688, -0.5446864, -6.91804, 0, 1.5, 0.5, 0.5
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
-4.178688, -5.096121, 0.4244397, 0, -0.5, 0.5, 0.5,
-4.178688, -5.096121, 0.4244397, 1, -0.5, 0.5, 0.5,
-4.178688, -5.096121, 0.4244397, 1, 1.5, 0.5, 0.5,
-4.178688, -5.096121, 0.4244397, 0, 1.5, 0.5, 0.5
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
-3, -4.04579, -5.223621,
3, -4.04579, -5.223621,
-3, -4.04579, -5.223621,
-3, -4.220845, -5.506025,
-2, -4.04579, -5.223621,
-2, -4.220845, -5.506025,
-1, -4.04579, -5.223621,
-1, -4.220845, -5.506025,
0, -4.04579, -5.223621,
0, -4.220845, -5.506025,
1, -4.04579, -5.223621,
1, -4.220845, -5.506025,
2, -4.04579, -5.223621,
2, -4.220845, -5.506025,
3, -4.04579, -5.223621,
3, -4.220845, -5.506025
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
-3, -4.570956, -6.070831, 0, -0.5, 0.5, 0.5,
-3, -4.570956, -6.070831, 1, -0.5, 0.5, 0.5,
-3, -4.570956, -6.070831, 1, 1.5, 0.5, 0.5,
-3, -4.570956, -6.070831, 0, 1.5, 0.5, 0.5,
-2, -4.570956, -6.070831, 0, -0.5, 0.5, 0.5,
-2, -4.570956, -6.070831, 1, -0.5, 0.5, 0.5,
-2, -4.570956, -6.070831, 1, 1.5, 0.5, 0.5,
-2, -4.570956, -6.070831, 0, 1.5, 0.5, 0.5,
-1, -4.570956, -6.070831, 0, -0.5, 0.5, 0.5,
-1, -4.570956, -6.070831, 1, -0.5, 0.5, 0.5,
-1, -4.570956, -6.070831, 1, 1.5, 0.5, 0.5,
-1, -4.570956, -6.070831, 0, 1.5, 0.5, 0.5,
0, -4.570956, -6.070831, 0, -0.5, 0.5, 0.5,
0, -4.570956, -6.070831, 1, -0.5, 0.5, 0.5,
0, -4.570956, -6.070831, 1, 1.5, 0.5, 0.5,
0, -4.570956, -6.070831, 0, 1.5, 0.5, 0.5,
1, -4.570956, -6.070831, 0, -0.5, 0.5, 0.5,
1, -4.570956, -6.070831, 1, -0.5, 0.5, 0.5,
1, -4.570956, -6.070831, 1, 1.5, 0.5, 0.5,
1, -4.570956, -6.070831, 0, 1.5, 0.5, 0.5,
2, -4.570956, -6.070831, 0, -0.5, 0.5, 0.5,
2, -4.570956, -6.070831, 1, -0.5, 0.5, 0.5,
2, -4.570956, -6.070831, 1, 1.5, 0.5, 0.5,
2, -4.570956, -6.070831, 0, 1.5, 0.5, 0.5,
3, -4.570956, -6.070831, 0, -0.5, 0.5, 0.5,
3, -4.570956, -6.070831, 1, -0.5, 0.5, 0.5,
3, -4.570956, -6.070831, 1, 1.5, 0.5, 0.5,
3, -4.570956, -6.070831, 0, 1.5, 0.5, 0.5
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
-3.178185, -3, -5.223621,
-3.178185, 2, -5.223621,
-3.178185, -3, -5.223621,
-3.344935, -3, -5.506025,
-3.178185, -2, -5.223621,
-3.344935, -2, -5.506025,
-3.178185, -1, -5.223621,
-3.344935, -1, -5.506025,
-3.178185, 0, -5.223621,
-3.344935, 0, -5.506025,
-3.178185, 1, -5.223621,
-3.344935, 1, -5.506025,
-3.178185, 2, -5.223621,
-3.344935, 2, -5.506025
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
-3.678436, -3, -6.070831, 0, -0.5, 0.5, 0.5,
-3.678436, -3, -6.070831, 1, -0.5, 0.5, 0.5,
-3.678436, -3, -6.070831, 1, 1.5, 0.5, 0.5,
-3.678436, -3, -6.070831, 0, 1.5, 0.5, 0.5,
-3.678436, -2, -6.070831, 0, -0.5, 0.5, 0.5,
-3.678436, -2, -6.070831, 1, -0.5, 0.5, 0.5,
-3.678436, -2, -6.070831, 1, 1.5, 0.5, 0.5,
-3.678436, -2, -6.070831, 0, 1.5, 0.5, 0.5,
-3.678436, -1, -6.070831, 0, -0.5, 0.5, 0.5,
-3.678436, -1, -6.070831, 1, -0.5, 0.5, 0.5,
-3.678436, -1, -6.070831, 1, 1.5, 0.5, 0.5,
-3.678436, -1, -6.070831, 0, 1.5, 0.5, 0.5,
-3.678436, 0, -6.070831, 0, -0.5, 0.5, 0.5,
-3.678436, 0, -6.070831, 1, -0.5, 0.5, 0.5,
-3.678436, 0, -6.070831, 1, 1.5, 0.5, 0.5,
-3.678436, 0, -6.070831, 0, 1.5, 0.5, 0.5,
-3.678436, 1, -6.070831, 0, -0.5, 0.5, 0.5,
-3.678436, 1, -6.070831, 1, -0.5, 0.5, 0.5,
-3.678436, 1, -6.070831, 1, 1.5, 0.5, 0.5,
-3.678436, 1, -6.070831, 0, 1.5, 0.5, 0.5,
-3.678436, 2, -6.070831, 0, -0.5, 0.5, 0.5,
-3.678436, 2, -6.070831, 1, -0.5, 0.5, 0.5,
-3.678436, 2, -6.070831, 1, 1.5, 0.5, 0.5,
-3.678436, 2, -6.070831, 0, 1.5, 0.5, 0.5
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
-3.178185, -4.04579, -4,
-3.178185, -4.04579, 4,
-3.178185, -4.04579, -4,
-3.344935, -4.220845, -4,
-3.178185, -4.04579, -2,
-3.344935, -4.220845, -2,
-3.178185, -4.04579, 0,
-3.344935, -4.220845, 0,
-3.178185, -4.04579, 2,
-3.344935, -4.220845, 2,
-3.178185, -4.04579, 4,
-3.344935, -4.220845, 4
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
-3.678436, -4.570956, -4, 0, -0.5, 0.5, 0.5,
-3.678436, -4.570956, -4, 1, -0.5, 0.5, 0.5,
-3.678436, -4.570956, -4, 1, 1.5, 0.5, 0.5,
-3.678436, -4.570956, -4, 0, 1.5, 0.5, 0.5,
-3.678436, -4.570956, -2, 0, -0.5, 0.5, 0.5,
-3.678436, -4.570956, -2, 1, -0.5, 0.5, 0.5,
-3.678436, -4.570956, -2, 1, 1.5, 0.5, 0.5,
-3.678436, -4.570956, -2, 0, 1.5, 0.5, 0.5,
-3.678436, -4.570956, 0, 0, -0.5, 0.5, 0.5,
-3.678436, -4.570956, 0, 1, -0.5, 0.5, 0.5,
-3.678436, -4.570956, 0, 1, 1.5, 0.5, 0.5,
-3.678436, -4.570956, 0, 0, 1.5, 0.5, 0.5,
-3.678436, -4.570956, 2, 0, -0.5, 0.5, 0.5,
-3.678436, -4.570956, 2, 1, -0.5, 0.5, 0.5,
-3.678436, -4.570956, 2, 1, 1.5, 0.5, 0.5,
-3.678436, -4.570956, 2, 0, 1.5, 0.5, 0.5,
-3.678436, -4.570956, 4, 0, -0.5, 0.5, 0.5,
-3.678436, -4.570956, 4, 1, -0.5, 0.5, 0.5,
-3.678436, -4.570956, 4, 1, 1.5, 0.5, 0.5,
-3.678436, -4.570956, 4, 0, 1.5, 0.5, 0.5
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
-3.178185, -4.04579, -5.223621,
-3.178185, 2.956417, -5.223621,
-3.178185, -4.04579, 6.072501,
-3.178185, 2.956417, 6.072501,
-3.178185, -4.04579, -5.223621,
-3.178185, -4.04579, 6.072501,
-3.178185, 2.956417, -5.223621,
-3.178185, 2.956417, 6.072501,
-3.178185, -4.04579, -5.223621,
3.491834, -4.04579, -5.223621,
-3.178185, -4.04579, 6.072501,
3.491834, -4.04579, 6.072501,
-3.178185, 2.956417, -5.223621,
3.491834, 2.956417, -5.223621,
-3.178185, 2.956417, 6.072501,
3.491834, 2.956417, 6.072501,
3.491834, -4.04579, -5.223621,
3.491834, 2.956417, -5.223621,
3.491834, -4.04579, 6.072501,
3.491834, 2.956417, 6.072501,
3.491834, -4.04579, -5.223621,
3.491834, -4.04579, 6.072501,
3.491834, 2.956417, -5.223621,
3.491834, 2.956417, 6.072501
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
var radius = 7.940391;
var distance = 35.32769;
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
mvMatrix.translate( -0.1568246, 0.5446864, -0.4244397 );
mvMatrix.scale( 1.287149, 1.226086, 0.7600224 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.32769);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
pyrazoxyfen<-read.table("pyrazoxyfen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrazoxyfen$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrazoxyfen' not found
```

```r
y<-pyrazoxyfen$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrazoxyfen' not found
```

```r
z<-pyrazoxyfen$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrazoxyfen' not found
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
-3.081048, 0.6541033, -1.645921, 0, 0, 1, 1, 1,
-3.048883, -0.866447, -0.1618515, 1, 0, 0, 1, 1,
-2.670577, -0.9274586, -4.569042, 1, 0, 0, 1, 1,
-2.65411, 0.535805, 0.6347421, 1, 0, 0, 1, 1,
-2.644026, -0.1728273, -2.152737, 1, 0, 0, 1, 1,
-2.558137, -0.602743, -2.857201, 1, 0, 0, 1, 1,
-2.531292, 0.4629774, -0.0378174, 0, 0, 0, 1, 1,
-2.52023, 1.382776, -2.749192, 0, 0, 0, 1, 1,
-2.5123, 0.3596232, -1.052032, 0, 0, 0, 1, 1,
-2.48572, 1.829168, -1.119841, 0, 0, 0, 1, 1,
-2.365433, 0.7715498, -0.5054045, 0, 0, 0, 1, 1,
-2.362574, -0.2319688, -1.39791, 0, 0, 0, 1, 1,
-2.335925, 0.7195252, -2.168829, 0, 0, 0, 1, 1,
-2.320399, -1.797896, -2.194204, 1, 1, 1, 1, 1,
-2.302773, -1.882828, -1.729526, 1, 1, 1, 1, 1,
-2.173191, 0.2392994, -0.5158596, 1, 1, 1, 1, 1,
-2.139061, -0.1630181, -1.009518, 1, 1, 1, 1, 1,
-2.115467, 1.234556, -0.8345929, 1, 1, 1, 1, 1,
-2.113089, 0.1275943, -0.8946169, 1, 1, 1, 1, 1,
-2.107085, -0.4750264, -2.427716, 1, 1, 1, 1, 1,
-2.100276, -0.3666708, -0.7084292, 1, 1, 1, 1, 1,
-2.08692, 0.0849897, -1.918555, 1, 1, 1, 1, 1,
-2.076038, -0.1140536, -1.285779, 1, 1, 1, 1, 1,
-2.056865, 0.4151332, -0.5616494, 1, 1, 1, 1, 1,
-2.031905, -1.331943, -1.668914, 1, 1, 1, 1, 1,
-2.020334, -0.9811258, -1.197804, 1, 1, 1, 1, 1,
-2.014369, 0.105462, -0.04372127, 1, 1, 1, 1, 1,
-2.001595, -1.080236, -3.633606, 1, 1, 1, 1, 1,
-1.992212, 1.103907, -2.672626, 0, 0, 1, 1, 1,
-1.984839, 0.4402718, -1.174724, 1, 0, 0, 1, 1,
-1.975318, 0.6662879, -0.2154533, 1, 0, 0, 1, 1,
-1.960967, -0.5241727, -1.595273, 1, 0, 0, 1, 1,
-1.953012, 0.1022517, -2.47982, 1, 0, 0, 1, 1,
-1.948608, 0.9813922, -1.647636, 1, 0, 0, 1, 1,
-1.908356, -1.878138, -3.51404, 0, 0, 0, 1, 1,
-1.905706, 1.742216, -0.05010971, 0, 0, 0, 1, 1,
-1.903013, -0.2410963, -1.295259, 0, 0, 0, 1, 1,
-1.877279, -0.3538302, -0.6763551, 0, 0, 0, 1, 1,
-1.869801, -0.8356363, -1.88339, 0, 0, 0, 1, 1,
-1.858745, 2.427526, -1.82133, 0, 0, 0, 1, 1,
-1.841482, 0.8912798, -1.953215, 0, 0, 0, 1, 1,
-1.838704, 1.088683, -1.164991, 1, 1, 1, 1, 1,
-1.821656, -0.77639, -0.6188703, 1, 1, 1, 1, 1,
-1.815336, 0.4594423, 0.3501324, 1, 1, 1, 1, 1,
-1.779213, -1.567096, -2.572037, 1, 1, 1, 1, 1,
-1.746557, -0.01695334, -2.474928, 1, 1, 1, 1, 1,
-1.739051, 0.6066387, -1.382682, 1, 1, 1, 1, 1,
-1.734891, -0.7301635, -0.9666593, 1, 1, 1, 1, 1,
-1.731377, -0.3371599, -1.509009, 1, 1, 1, 1, 1,
-1.7221, -0.6914375, -1.11827, 1, 1, 1, 1, 1,
-1.694558, 0.6581724, -1.444544, 1, 1, 1, 1, 1,
-1.691982, 0.8899967, -0.8508177, 1, 1, 1, 1, 1,
-1.689243, 0.6442054, -2.197123, 1, 1, 1, 1, 1,
-1.677385, 0.3633411, -0.7658135, 1, 1, 1, 1, 1,
-1.659102, -0.03392781, -1.446028, 1, 1, 1, 1, 1,
-1.658631, 0.1447472, -2.706435, 1, 1, 1, 1, 1,
-1.65794, -3.408299, -3.648568, 0, 0, 1, 1, 1,
-1.640218, 0.06126095, -0.01438471, 1, 0, 0, 1, 1,
-1.636508, -1.445438, -1.232953, 1, 0, 0, 1, 1,
-1.619781, 0.6491562, -0.09657441, 1, 0, 0, 1, 1,
-1.61669, -1.260388, -3.365654, 1, 0, 0, 1, 1,
-1.610869, -0.3041759, -1.896585, 1, 0, 0, 1, 1,
-1.595538, -1.930892, -1.565859, 0, 0, 0, 1, 1,
-1.574321, -0.6702565, -3.596912, 0, 0, 0, 1, 1,
-1.570193, 0.5684866, -0.163003, 0, 0, 0, 1, 1,
-1.548075, -0.7275624, -1.491607, 0, 0, 0, 1, 1,
-1.525887, -0.931173, -2.061145, 0, 0, 0, 1, 1,
-1.524948, 0.5426956, -2.703446, 0, 0, 0, 1, 1,
-1.514887, 0.2752229, -1.137119, 0, 0, 0, 1, 1,
-1.501352, 1.705282, -1.241655, 1, 1, 1, 1, 1,
-1.493713, 1.227567, -1.205712, 1, 1, 1, 1, 1,
-1.493428, 1.044865, -0.1704877, 1, 1, 1, 1, 1,
-1.481086, -0.8018514, -2.32717, 1, 1, 1, 1, 1,
-1.478714, -0.8678925, -3.065939, 1, 1, 1, 1, 1,
-1.472183, -0.5264738, -3.465629, 1, 1, 1, 1, 1,
-1.464125, 1.31226, -1.34814, 1, 1, 1, 1, 1,
-1.450581, -0.6061622, -2.244865, 1, 1, 1, 1, 1,
-1.438001, 1.514851, -2.14712, 1, 1, 1, 1, 1,
-1.430885, -1.204262, -1.399653, 1, 1, 1, 1, 1,
-1.426365, 0.227511, -0.6693304, 1, 1, 1, 1, 1,
-1.42377, 0.9786286, 0.2682005, 1, 1, 1, 1, 1,
-1.423313, 0.7695387, -2.029998, 1, 1, 1, 1, 1,
-1.420886, -0.905239, -1.435133, 1, 1, 1, 1, 1,
-1.409568, -0.2082727, 0.01776227, 1, 1, 1, 1, 1,
-1.409154, -0.184852, -2.359952, 0, 0, 1, 1, 1,
-1.404423, 1.927443, -0.6737262, 1, 0, 0, 1, 1,
-1.397322, -0.07720958, -1.348067, 1, 0, 0, 1, 1,
-1.392899, -0.767276, -1.612934, 1, 0, 0, 1, 1,
-1.388155, -0.913196, -2.712453, 1, 0, 0, 1, 1,
-1.376446, -0.4131361, -0.6315821, 1, 0, 0, 1, 1,
-1.366942, 0.9153391, -0.10958, 0, 0, 0, 1, 1,
-1.361619, -0.5004342, -2.671481, 0, 0, 0, 1, 1,
-1.357637, -1.592607, -2.268258, 0, 0, 0, 1, 1,
-1.357216, 1.017297, -3.25982, 0, 0, 0, 1, 1,
-1.35588, -0.5171439, -2.04654, 0, 0, 0, 1, 1,
-1.35383, -1.950038, -2.379104, 0, 0, 0, 1, 1,
-1.350099, 0.4105479, -1.882116, 0, 0, 0, 1, 1,
-1.343585, 0.9455255, -0.9998402, 1, 1, 1, 1, 1,
-1.34057, 1.319499, -0.5110198, 1, 1, 1, 1, 1,
-1.332105, 0.4194154, -0.4642304, 1, 1, 1, 1, 1,
-1.316007, -0.5932096, -1.908894, 1, 1, 1, 1, 1,
-1.303811, -1.710127, -3.333856, 1, 1, 1, 1, 1,
-1.300833, 0.5707406, 1.044443, 1, 1, 1, 1, 1,
-1.295351, 0.747239, -0.272317, 1, 1, 1, 1, 1,
-1.290621, 1.371393, -1.030464, 1, 1, 1, 1, 1,
-1.270668, 0.7982813, -0.1470866, 1, 1, 1, 1, 1,
-1.262808, -0.3806233, -0.6076641, 1, 1, 1, 1, 1,
-1.25489, 0.5502343, -0.5746129, 1, 1, 1, 1, 1,
-1.248934, 0.2472463, -0.7163479, 1, 1, 1, 1, 1,
-1.247416, -0.8564894, -3.404063, 1, 1, 1, 1, 1,
-1.246096, 1.724929, 0.8257946, 1, 1, 1, 1, 1,
-1.242254, 0.1308037, -2.820188, 1, 1, 1, 1, 1,
-1.240852, -0.1213404, -0.08698382, 0, 0, 1, 1, 1,
-1.232266, 0.1558085, -1.055017, 1, 0, 0, 1, 1,
-1.225085, -0.8026092, -2.530239, 1, 0, 0, 1, 1,
-1.221112, 0.4697624, -0.469442, 1, 0, 0, 1, 1,
-1.216315, 0.9692149, -2.338935, 1, 0, 0, 1, 1,
-1.214617, 0.3309871, -0.357283, 1, 0, 0, 1, 1,
-1.2088, 1.343676, -2.117996, 0, 0, 0, 1, 1,
-1.194702, -1.357637, -1.863835, 0, 0, 0, 1, 1,
-1.192728, -1.077215, -1.00673, 0, 0, 0, 1, 1,
-1.187452, -1.3678, -1.674927, 0, 0, 0, 1, 1,
-1.183179, 0.4025444, -1.551163, 0, 0, 0, 1, 1,
-1.180248, 2.022916, -1.349032, 0, 0, 0, 1, 1,
-1.176784, -0.9849957, -1.400716, 0, 0, 0, 1, 1,
-1.172892, 0.3379794, -0.6434332, 1, 1, 1, 1, 1,
-1.162182, 0.5672325, -1.217242, 1, 1, 1, 1, 1,
-1.160646, 1.772655, -1.130944, 1, 1, 1, 1, 1,
-1.159739, -1.573968, -2.566952, 1, 1, 1, 1, 1,
-1.156998, -0.5653193, -2.613113, 1, 1, 1, 1, 1,
-1.156014, -1.539038, -2.868072, 1, 1, 1, 1, 1,
-1.151156, -0.1642081, -2.509699, 1, 1, 1, 1, 1,
-1.149699, 0.4850503, -1.445836, 1, 1, 1, 1, 1,
-1.149322, 0.271644, -2.671933, 1, 1, 1, 1, 1,
-1.145377, 1.007878, -0.8396041, 1, 1, 1, 1, 1,
-1.143128, 2.771321, 0.4526682, 1, 1, 1, 1, 1,
-1.13344, 0.2598328, -1.679102, 1, 1, 1, 1, 1,
-1.129743, -0.0965238, -2.715593, 1, 1, 1, 1, 1,
-1.128726, -0.3043204, -2.253428, 1, 1, 1, 1, 1,
-1.126422, -0.05461502, -1.401763, 1, 1, 1, 1, 1,
-1.124968, -0.005742339, -3.644147, 0, 0, 1, 1, 1,
-1.12354, 0.7414915, -2.494682, 1, 0, 0, 1, 1,
-1.120179, 1.436852, -1.681288, 1, 0, 0, 1, 1,
-1.106901, 0.0003478224, -0.5207165, 1, 0, 0, 1, 1,
-1.105114, -0.1567799, -1.18427, 1, 0, 0, 1, 1,
-1.094748, -0.8392817, -3.74652, 1, 0, 0, 1, 1,
-1.092473, -1.105872, -1.845332, 0, 0, 0, 1, 1,
-1.09224, -0.7978563, -0.9592819, 0, 0, 0, 1, 1,
-1.090183, -0.2584884, -3.56122, 0, 0, 0, 1, 1,
-1.079095, -0.5131481, -0.4230237, 0, 0, 0, 1, 1,
-1.052854, -0.1026741, -1.194621, 0, 0, 0, 1, 1,
-1.04593, 1.059067, -2.276664, 0, 0, 0, 1, 1,
-1.045089, 1.690762, 0.198726, 0, 0, 0, 1, 1,
-1.04508, 0.3327882, -1.373479, 1, 1, 1, 1, 1,
-1.042546, 2.389453, 0.0001754979, 1, 1, 1, 1, 1,
-1.020714, -0.9830456, -2.569878, 1, 1, 1, 1, 1,
-1.018173, -1.279796, -1.481577, 1, 1, 1, 1, 1,
-1.014187, 0.3172947, 0.4590917, 1, 1, 1, 1, 1,
-1.01176, 1.43594, -2.110418, 1, 1, 1, 1, 1,
-1.010054, -0.683051, -3.965611, 1, 1, 1, 1, 1,
-1.007508, 0.5055806, -0.7521815, 1, 1, 1, 1, 1,
-1.000741, 1.377672, -0.2707111, 1, 1, 1, 1, 1,
-0.9991744, 1.058064, -0.519765, 1, 1, 1, 1, 1,
-0.9957483, -0.6770326, -3.446843, 1, 1, 1, 1, 1,
-0.993701, -1.33977, -3.10708, 1, 1, 1, 1, 1,
-0.9900383, 0.06331276, -1.984008, 1, 1, 1, 1, 1,
-0.9893441, 0.1943459, -0.499339, 1, 1, 1, 1, 1,
-0.988785, 0.1996148, 0.7708853, 1, 1, 1, 1, 1,
-0.9867316, 2.092241, -0.4634235, 0, 0, 1, 1, 1,
-0.9761474, 0.6897212, -1.232138, 1, 0, 0, 1, 1,
-0.9493523, -0.2777637, -1.61423, 1, 0, 0, 1, 1,
-0.9474648, -0.2449152, -0.9304205, 1, 0, 0, 1, 1,
-0.9460359, -0.2889245, -3.367735, 1, 0, 0, 1, 1,
-0.94549, -0.05500824, -1.388766, 1, 0, 0, 1, 1,
-0.9419466, -0.6504807, -0.431187, 0, 0, 0, 1, 1,
-0.9298539, 0.1384911, -0.6139246, 0, 0, 0, 1, 1,
-0.9268832, -0.6009604, -2.827037, 0, 0, 0, 1, 1,
-0.9189429, -0.4751208, -1.933519, 0, 0, 0, 1, 1,
-0.9189143, 0.725218, -1.266522, 0, 0, 0, 1, 1,
-0.9164721, -0.7632174, -2.123494, 0, 0, 0, 1, 1,
-0.9125625, -0.528364, -2.270245, 0, 0, 0, 1, 1,
-0.9021372, 0.1170167, -2.52773, 1, 1, 1, 1, 1,
-0.8998832, 0.8320226, -0.7561743, 1, 1, 1, 1, 1,
-0.8968816, 0.4799579, -1.418891, 1, 1, 1, 1, 1,
-0.8936417, -0.8836337, -1.590071, 1, 1, 1, 1, 1,
-0.8925022, -0.3559908, -2.858657, 1, 1, 1, 1, 1,
-0.8808141, 0.3675858, -1.451764, 1, 1, 1, 1, 1,
-0.879709, -0.5724195, -1.65726, 1, 1, 1, 1, 1,
-0.8745812, -0.2241893, -1.821871, 1, 1, 1, 1, 1,
-0.8741054, 1.260709, -1.098846, 1, 1, 1, 1, 1,
-0.8623038, 0.4721497, -1.425203, 1, 1, 1, 1, 1,
-0.85928, 0.801066, -0.6141503, 1, 1, 1, 1, 1,
-0.8534552, -1.730006, -1.303803, 1, 1, 1, 1, 1,
-0.8503525, -0.6318882, -2.202677, 1, 1, 1, 1, 1,
-0.8472888, 0.3228722, -1.31801, 1, 1, 1, 1, 1,
-0.8394483, 0.7893507, -0.08169887, 1, 1, 1, 1, 1,
-0.8297868, 1.037251, -1.210018, 0, 0, 1, 1, 1,
-0.8246385, -0.8916277, -2.014865, 1, 0, 0, 1, 1,
-0.8168415, -0.6878266, -1.898568, 1, 0, 0, 1, 1,
-0.8093896, 1.315087, -1.609152, 1, 0, 0, 1, 1,
-0.8090779, 0.6437883, -0.9919551, 1, 0, 0, 1, 1,
-0.8061723, 0.1347756, -1.502071, 1, 0, 0, 1, 1,
-0.7968541, -1.182709, -1.429747, 0, 0, 0, 1, 1,
-0.7964585, -0.3348622, -3.275357, 0, 0, 0, 1, 1,
-0.7889317, -0.6099416, -1.788957, 0, 0, 0, 1, 1,
-0.7858921, -0.6288733, -1.102666, 0, 0, 0, 1, 1,
-0.7843125, 0.05619953, -1.556181, 0, 0, 0, 1, 1,
-0.7841733, -0.8970565, -2.026088, 0, 0, 0, 1, 1,
-0.7802057, 0.8140709, 0.1661536, 0, 0, 0, 1, 1,
-0.7764786, -0.6030962, -1.69171, 1, 1, 1, 1, 1,
-0.7729812, 0.2205343, -1.550723, 1, 1, 1, 1, 1,
-0.7582715, -0.03234161, -2.972833, 1, 1, 1, 1, 1,
-0.7510522, 0.8739277, -2.966985, 1, 1, 1, 1, 1,
-0.7499896, -0.3327793, -3.326755, 1, 1, 1, 1, 1,
-0.7488472, -1.005977, -1.930078, 1, 1, 1, 1, 1,
-0.7472784, -0.4171915, -2.674751, 1, 1, 1, 1, 1,
-0.7466847, -1.588285, -2.294805, 1, 1, 1, 1, 1,
-0.7434604, 1.029469, -2.951241, 1, 1, 1, 1, 1,
-0.7419382, 1.958238, -1.980682, 1, 1, 1, 1, 1,
-0.7413071, -1.143184, -2.750556, 1, 1, 1, 1, 1,
-0.7364779, -0.2715347, -1.673585, 1, 1, 1, 1, 1,
-0.7348953, 0.03638932, -0.7183343, 1, 1, 1, 1, 1,
-0.7341694, 0.8360671, -1.925812, 1, 1, 1, 1, 1,
-0.7295665, 1.452676, -0.2578827, 1, 1, 1, 1, 1,
-0.7254212, -1.22832, -3.370147, 0, 0, 1, 1, 1,
-0.7235589, -0.8765706, -1.811375, 1, 0, 0, 1, 1,
-0.717948, 0.7966288, -0.2020903, 1, 0, 0, 1, 1,
-0.715674, -0.1803566, -1.985005, 1, 0, 0, 1, 1,
-0.7153183, 0.2494562, -1.109002, 1, 0, 0, 1, 1,
-0.7068298, 0.08627227, -1.009683, 1, 0, 0, 1, 1,
-0.7015041, 0.9162171, -0.0185145, 0, 0, 0, 1, 1,
-0.6954091, -0.6615871, -0.8813671, 0, 0, 0, 1, 1,
-0.6934174, 1.120899, -0.781987, 0, 0, 0, 1, 1,
-0.6903524, 0.7339138, -0.6815596, 0, 0, 0, 1, 1,
-0.6783627, -0.3803169, -2.727719, 0, 0, 0, 1, 1,
-0.6776538, -1.776267, -3.96286, 0, 0, 0, 1, 1,
-0.6707733, -1.30658, -2.580158, 0, 0, 0, 1, 1,
-0.6675664, 0.9334461, -0.9870675, 1, 1, 1, 1, 1,
-0.6665611, 0.1404316, -0.9033322, 1, 1, 1, 1, 1,
-0.6647498, 0.4003659, 0.7980156, 1, 1, 1, 1, 1,
-0.6624761, 1.221426, -0.4503357, 1, 1, 1, 1, 1,
-0.6586605, -0.3573375, -3.239804, 1, 1, 1, 1, 1,
-0.6577757, -0.2188706, -1.632211, 1, 1, 1, 1, 1,
-0.6493896, -2.062637, -3.730218, 1, 1, 1, 1, 1,
-0.644766, 0.03743199, -0.2862574, 1, 1, 1, 1, 1,
-0.6444876, 0.06535088, -1.970573, 1, 1, 1, 1, 1,
-0.6444322, 0.3022189, -0.6183434, 1, 1, 1, 1, 1,
-0.6381093, 0.790323, -0.3676902, 1, 1, 1, 1, 1,
-0.6328898, 1.178627, -1.627775, 1, 1, 1, 1, 1,
-0.6319667, 0.2179839, 0.04847534, 1, 1, 1, 1, 1,
-0.6315131, 0.7212434, 1.165567, 1, 1, 1, 1, 1,
-0.6298267, -0.02905145, -1.651746, 1, 1, 1, 1, 1,
-0.6282101, -0.06940088, -0.6010747, 0, 0, 1, 1, 1,
-0.6186796, 0.8406382, -1.788222, 1, 0, 0, 1, 1,
-0.616744, -1.466814, -2.522681, 1, 0, 0, 1, 1,
-0.6123548, 0.529604, -0.6245056, 1, 0, 0, 1, 1,
-0.6101955, 0.6287361, -1.10682, 1, 0, 0, 1, 1,
-0.6058947, -0.185126, -0.3977413, 1, 0, 0, 1, 1,
-0.5995306, 0.6998008, -0.8313019, 0, 0, 0, 1, 1,
-0.5968485, -0.6368653, -0.6631238, 0, 0, 0, 1, 1,
-0.5968472, 0.5862801, -0.6476421, 0, 0, 0, 1, 1,
-0.5928708, -1.240877, -3.065884, 0, 0, 0, 1, 1,
-0.5905089, 1.132079, -0.8818042, 0, 0, 0, 1, 1,
-0.5902765, 0.8318326, -1.432181, 0, 0, 0, 1, 1,
-0.5889447, 0.8103163, -2.885436, 0, 0, 0, 1, 1,
-0.5871573, -0.1890957, -1.84541, 1, 1, 1, 1, 1,
-0.5870828, -0.05383579, -1.327987, 1, 1, 1, 1, 1,
-0.576254, 0.5287104, -1.576956, 1, 1, 1, 1, 1,
-0.5735726, 0.7937427, -1.222855, 1, 1, 1, 1, 1,
-0.5709039, 0.1194318, -1.525437, 1, 1, 1, 1, 1,
-0.568083, 2.083564, -0.8971263, 1, 1, 1, 1, 1,
-0.5677753, -1.952869, -2.616976, 1, 1, 1, 1, 1,
-0.5642606, -0.07435893, -1.452077, 1, 1, 1, 1, 1,
-0.5638067, 0.2775805, -2.000844, 1, 1, 1, 1, 1,
-0.5636674, -0.6992165, -2.731733, 1, 1, 1, 1, 1,
-0.5617272, -1.465624, -4.031599, 1, 1, 1, 1, 1,
-0.5608511, 1.015442, 0.09658952, 1, 1, 1, 1, 1,
-0.5606907, -2.364146, -3.276291, 1, 1, 1, 1, 1,
-0.5601521, 0.1032222, -0.5118471, 1, 1, 1, 1, 1,
-0.5569054, -1.472362, -3.479922, 1, 1, 1, 1, 1,
-0.5554686, -0.3019734, -3.182248, 0, 0, 1, 1, 1,
-0.554937, -0.03773597, -1.368316, 1, 0, 0, 1, 1,
-0.5524779, 0.3359673, -0.4769029, 1, 0, 0, 1, 1,
-0.5508756, -1.668052, -2.357995, 1, 0, 0, 1, 1,
-0.5503445, 0.3974543, -1.454239, 1, 0, 0, 1, 1,
-0.5491201, 1.232856, 2.338052, 1, 0, 0, 1, 1,
-0.5419949, 0.1411246, -1.875338, 0, 0, 0, 1, 1,
-0.5419912, 1.292003, 0.9683971, 0, 0, 0, 1, 1,
-0.5416858, 0.5353085, -0.248884, 0, 0, 0, 1, 1,
-0.531664, -1.980274, -2.684821, 0, 0, 0, 1, 1,
-0.5292064, -1.32558, -3.807478, 0, 0, 0, 1, 1,
-0.52393, -0.4641679, -3.212157, 0, 0, 0, 1, 1,
-0.5209017, 0.7991078, -2.413708, 0, 0, 0, 1, 1,
-0.519748, 0.2966153, -2.361448, 1, 1, 1, 1, 1,
-0.5157335, 2.313282, -1.37001, 1, 1, 1, 1, 1,
-0.5070887, -0.2319842, -1.783668, 1, 1, 1, 1, 1,
-0.5067555, 2.344267, -0.5084423, 1, 1, 1, 1, 1,
-0.5036983, -0.7924088, -1.844235, 1, 1, 1, 1, 1,
-0.5026353, -0.8517324, -3.412622, 1, 1, 1, 1, 1,
-0.4938109, 0.6393273, -2.890697, 1, 1, 1, 1, 1,
-0.4918574, 0.3839477, 0.4948763, 1, 1, 1, 1, 1,
-0.4914232, -1.237571, -3.668169, 1, 1, 1, 1, 1,
-0.4851748, -2.33285, -3.756853, 1, 1, 1, 1, 1,
-0.4790192, 1.279617, 0.2342167, 1, 1, 1, 1, 1,
-0.4779304, -0.9611471, -1.677055, 1, 1, 1, 1, 1,
-0.4760557, 1.597368, 0.01718654, 1, 1, 1, 1, 1,
-0.4717801, 0.8724182, -1.361689, 1, 1, 1, 1, 1,
-0.4696303, 1.292905, -0.02464637, 1, 1, 1, 1, 1,
-0.466549, -1.388176, -3.510176, 0, 0, 1, 1, 1,
-0.4636654, 1.225868, -1.321285, 1, 0, 0, 1, 1,
-0.4620469, -1.917991, -2.686218, 1, 0, 0, 1, 1,
-0.4569355, -1.36515, -4.647003, 1, 0, 0, 1, 1,
-0.4542394, 0.4070863, -0.6011468, 1, 0, 0, 1, 1,
-0.4539338, -1.314032, -1.334424, 1, 0, 0, 1, 1,
-0.4532017, -0.917294, -1.633009, 0, 0, 0, 1, 1,
-0.4516734, -1.081712, -0.9433058, 0, 0, 0, 1, 1,
-0.4506141, -0.278823, -1.745981, 0, 0, 0, 1, 1,
-0.4474217, 1.518338, 0.04002307, 0, 0, 0, 1, 1,
-0.4445719, 1.814718, -0.3585513, 0, 0, 0, 1, 1,
-0.4439673, 0.865805, -0.9081541, 0, 0, 0, 1, 1,
-0.4409952, -1.220944, -4.457067, 0, 0, 0, 1, 1,
-0.4409928, -0.752775, -3.099258, 1, 1, 1, 1, 1,
-0.4399481, -0.0981222, -2.965457, 1, 1, 1, 1, 1,
-0.4398928, -0.6348962, -2.979658, 1, 1, 1, 1, 1,
-0.4338121, -1.075126, -2.6867, 1, 1, 1, 1, 1,
-0.4307784, -0.2134381, -0.65771, 1, 1, 1, 1, 1,
-0.4264871, 0.7385187, -0.7993754, 1, 1, 1, 1, 1,
-0.4251107, 0.2825341, 1.47963, 1, 1, 1, 1, 1,
-0.4248426, -0.1151554, -2.955509, 1, 1, 1, 1, 1,
-0.4244109, 1.907669, -1.174008, 1, 1, 1, 1, 1,
-0.4225833, 0.1187803, -1.457214, 1, 1, 1, 1, 1,
-0.4180782, 0.6439517, 0.5368013, 1, 1, 1, 1, 1,
-0.4149368, -0.5896314, -2.787065, 1, 1, 1, 1, 1,
-0.4124185, 0.6787264, -1.471301, 1, 1, 1, 1, 1,
-0.4118043, 0.0593688, -2.928368, 1, 1, 1, 1, 1,
-0.4114246, 1.273169, -1.397943, 1, 1, 1, 1, 1,
-0.40108, 0.2744903, -1.52089, 0, 0, 1, 1, 1,
-0.4009546, 0.383471, 1.258222, 1, 0, 0, 1, 1,
-0.3895213, -0.7093568, -1.971013, 1, 0, 0, 1, 1,
-0.3894847, 0.533758, -0.4576274, 1, 0, 0, 1, 1,
-0.3870782, 0.1542041, 0.9994789, 1, 0, 0, 1, 1,
-0.3759232, 0.05255076, -0.8684031, 1, 0, 0, 1, 1,
-0.37414, 0.1056389, -0.5666699, 0, 0, 0, 1, 1,
-0.374139, -1.632149, -2.480144, 0, 0, 0, 1, 1,
-0.3740581, 2.485982, -0.7469458, 0, 0, 0, 1, 1,
-0.3719166, 1.119317, -1.254712, 0, 0, 0, 1, 1,
-0.3703951, 0.7169402, 1.242917, 0, 0, 0, 1, 1,
-0.3696442, 1.494293, -0.03126733, 0, 0, 0, 1, 1,
-0.3625269, 0.2782581, -1.271114, 0, 0, 0, 1, 1,
-0.3617524, -0.546861, -0.9137734, 1, 1, 1, 1, 1,
-0.3584953, -0.8338354, -2.252895, 1, 1, 1, 1, 1,
-0.3583443, -1.004029, -5.059115, 1, 1, 1, 1, 1,
-0.3574637, -1.160974, -2.31668, 1, 1, 1, 1, 1,
-0.3552065, 0.7971424, -0.5219777, 1, 1, 1, 1, 1,
-0.3522169, 1.177559, 0.5597653, 1, 1, 1, 1, 1,
-0.3510212, -0.6108797, -2.054484, 1, 1, 1, 1, 1,
-0.3481798, -0.2329708, -3.044021, 1, 1, 1, 1, 1,
-0.3417998, -2.661377, -2.697309, 1, 1, 1, 1, 1,
-0.3409159, -2.996356, -2.792494, 1, 1, 1, 1, 1,
-0.3390797, -0.1869381, -2.083961, 1, 1, 1, 1, 1,
-0.3330732, 1.169176, 1.280462, 1, 1, 1, 1, 1,
-0.3304982, -0.05508782, 0.08673389, 1, 1, 1, 1, 1,
-0.3300192, -0.01001252, -0.9386947, 1, 1, 1, 1, 1,
-0.3291149, 1.767841, -1.549014, 1, 1, 1, 1, 1,
-0.3268191, -0.4616555, -2.441256, 0, 0, 1, 1, 1,
-0.3217741, -0.2741615, -2.379602, 1, 0, 0, 1, 1,
-0.3209527, 0.3754755, -0.5599666, 1, 0, 0, 1, 1,
-0.3208301, 0.09469317, -2.262483, 1, 0, 0, 1, 1,
-0.3102008, -0.3451774, -3.412038, 1, 0, 0, 1, 1,
-0.3083196, 0.3839853, -1.400362, 1, 0, 0, 1, 1,
-0.3071705, 1.429132, -0.3499249, 0, 0, 0, 1, 1,
-0.3018626, -0.4372838, -3.879337, 0, 0, 0, 1, 1,
-0.2989811, -0.6298001, -3.290797, 0, 0, 0, 1, 1,
-0.2858396, -0.6661913, -1.815874, 0, 0, 0, 1, 1,
-0.2839475, 0.1786657, 0.5027032, 0, 0, 0, 1, 1,
-0.2833394, 0.5576559, 0.5900854, 0, 0, 0, 1, 1,
-0.2803124, 0.1701618, -0.8844011, 0, 0, 0, 1, 1,
-0.2762573, 0.4876418, -0.1578856, 1, 1, 1, 1, 1,
-0.2721683, 1.504766, 1.612947, 1, 1, 1, 1, 1,
-0.2717391, -0.7020198, -2.130924, 1, 1, 1, 1, 1,
-0.271261, 1.875977, 1.263404, 1, 1, 1, 1, 1,
-0.2674522, 0.135896, -1.134253, 1, 1, 1, 1, 1,
-0.2670929, 0.3679593, -0.4570058, 1, 1, 1, 1, 1,
-0.2655669, 0.476618, -1.714694, 1, 1, 1, 1, 1,
-0.2632174, -0.02857068, -0.9074328, 1, 1, 1, 1, 1,
-0.2603429, -1.721889, -3.485233, 1, 1, 1, 1, 1,
-0.2561623, -1.181908, -2.879608, 1, 1, 1, 1, 1,
-0.2509903, -0.357625, -1.714121, 1, 1, 1, 1, 1,
-0.2491921, 0.6316154, 0.860386, 1, 1, 1, 1, 1,
-0.2482588, 0.6563321, -0.4387234, 1, 1, 1, 1, 1,
-0.2481247, -0.22229, -2.390351, 1, 1, 1, 1, 1,
-0.2460555, 0.7245611, -1.565297, 1, 1, 1, 1, 1,
-0.2453923, -1.811425, -4.884013, 0, 0, 1, 1, 1,
-0.2451395, -0.9964226, -0.4800098, 1, 0, 0, 1, 1,
-0.244811, 0.744683, -0.4259392, 1, 0, 0, 1, 1,
-0.2423428, -0.3071117, -3.744129, 1, 0, 0, 1, 1,
-0.2352456, -0.1830843, -1.995609, 1, 0, 0, 1, 1,
-0.233374, -0.175968, -2.814843, 1, 0, 0, 1, 1,
-0.2329521, -1.850713, -3.049233, 0, 0, 0, 1, 1,
-0.2328397, 2.582916, -1.427457, 0, 0, 0, 1, 1,
-0.2310512, -0.537595, -3.525663, 0, 0, 0, 1, 1,
-0.2306155, 0.7969203, 0.5431897, 0, 0, 0, 1, 1,
-0.2257762, -1.48671, -3.874725, 0, 0, 0, 1, 1,
-0.2198929, -0.6202735, -2.840512, 0, 0, 0, 1, 1,
-0.2198839, 0.2238212, 0.3032394, 0, 0, 0, 1, 1,
-0.2190096, 2.570534, -2.533111, 1, 1, 1, 1, 1,
-0.2172619, 0.4439663, -3.049757, 1, 1, 1, 1, 1,
-0.2169223, 0.3569477, -0.9053248, 1, 1, 1, 1, 1,
-0.2103403, -0.09180725, -3.662202, 1, 1, 1, 1, 1,
-0.2096532, -0.830793, -3.709218, 1, 1, 1, 1, 1,
-0.2079478, 0.07607995, -1.696144, 1, 1, 1, 1, 1,
-0.2076222, -0.4655389, -2.147724, 1, 1, 1, 1, 1,
-0.2028737, -1.354757, -3.008678, 1, 1, 1, 1, 1,
-0.2024493, -0.7057871, -2.611696, 1, 1, 1, 1, 1,
-0.198131, -1.197803, -2.497493, 1, 1, 1, 1, 1,
-0.1893808, -1.889585, -4.050791, 1, 1, 1, 1, 1,
-0.1888361, -2.521485, -2.817213, 1, 1, 1, 1, 1,
-0.1869356, -0.2004965, -1.834048, 1, 1, 1, 1, 1,
-0.1861316, 0.8158258, 0.2632421, 1, 1, 1, 1, 1,
-0.1853533, 0.639132, 0.6880025, 1, 1, 1, 1, 1,
-0.1840349, -1.978479, -4.32735, 0, 0, 1, 1, 1,
-0.1825412, -0.4333296, -2.031421, 1, 0, 0, 1, 1,
-0.1824525, -0.9836335, -1.138528, 1, 0, 0, 1, 1,
-0.18097, 1.426421, 0.6689647, 1, 0, 0, 1, 1,
-0.1794041, 0.989467, -1.048607, 1, 0, 0, 1, 1,
-0.1732278, 1.760085, -1.836383, 1, 0, 0, 1, 1,
-0.1731868, -0.9601426, -3.412908, 0, 0, 0, 1, 1,
-0.1678327, -0.08040398, -1.238366, 0, 0, 0, 1, 1,
-0.1652013, 1.964224, 1.120775, 0, 0, 0, 1, 1,
-0.1640849, 0.5291459, -0.3435795, 0, 0, 0, 1, 1,
-0.1582528, 1.204555, -0.5058348, 0, 0, 0, 1, 1,
-0.1510823, -0.2565421, -3.06647, 0, 0, 0, 1, 1,
-0.1505233, 1.75052, -0.09607919, 0, 0, 0, 1, 1,
-0.1498052, 0.5204764, -1.750801, 1, 1, 1, 1, 1,
-0.1480455, 2.003273, 1.27511, 1, 1, 1, 1, 1,
-0.1435369, -0.08515141, -3.169742, 1, 1, 1, 1, 1,
-0.143276, -1.360407, -2.713318, 1, 1, 1, 1, 1,
-0.143056, -0.9355513, -2.648835, 1, 1, 1, 1, 1,
-0.1377368, 1.132195, 0.3052984, 1, 1, 1, 1, 1,
-0.1356955, -0.5551189, -2.958691, 1, 1, 1, 1, 1,
-0.1264035, -2.096437, -3.30486, 1, 1, 1, 1, 1,
-0.1253117, -0.2151468, -2.716712, 1, 1, 1, 1, 1,
-0.1226266, -0.6375251, -0.8333459, 1, 1, 1, 1, 1,
-0.1225602, 2.101916, 0.7359015, 1, 1, 1, 1, 1,
-0.1225336, 0.7188425, -0.88365, 1, 1, 1, 1, 1,
-0.1209594, 0.2046701, 1.384464, 1, 1, 1, 1, 1,
-0.1197321, 0.7037488, -0.396027, 1, 1, 1, 1, 1,
-0.1185013, -0.3798905, -3.1043, 1, 1, 1, 1, 1,
-0.1099993, 2.822936, 1.511557, 0, 0, 1, 1, 1,
-0.1084009, -1.322702, -2.903457, 1, 0, 0, 1, 1,
-0.1081739, -0.5634514, -3.791682, 1, 0, 0, 1, 1,
-0.108008, 1.161047, -0.6458777, 1, 0, 0, 1, 1,
-0.1064988, -0.7812585, -2.996675, 1, 0, 0, 1, 1,
-0.1063997, -1.101631, -3.075785, 1, 0, 0, 1, 1,
-0.105465, 0.3974425, 0.9221627, 0, 0, 0, 1, 1,
-0.1050014, 0.3584453, 1.036878, 0, 0, 0, 1, 1,
-0.1044362, 0.03020226, 0.506658, 0, 0, 0, 1, 1,
-0.1034221, -1.828254, -3.999476, 0, 0, 0, 1, 1,
-0.1010095, 0.8174853, -0.4373736, 0, 0, 0, 1, 1,
-0.09935702, -0.1076124, -1.809122, 0, 0, 0, 1, 1,
-0.09870026, -0.1228403, -1.001173, 0, 0, 0, 1, 1,
-0.09779096, 0.8755371, -1.1493, 1, 1, 1, 1, 1,
-0.09773606, 0.1947068, -1.859365, 1, 1, 1, 1, 1,
-0.09700225, 0.9876896, -1.428892, 1, 1, 1, 1, 1,
-0.09674497, -0.1972932, -3.226333, 1, 1, 1, 1, 1,
-0.09581601, 0.4309581, 0.825888, 1, 1, 1, 1, 1,
-0.09460971, 1.236184, 0.4783891, 1, 1, 1, 1, 1,
-0.09442771, -0.1069781, -3.703969, 1, 1, 1, 1, 1,
-0.09397022, -0.04709191, -2.129408, 1, 1, 1, 1, 1,
-0.09303603, 0.8741355, 0.1615874, 1, 1, 1, 1, 1,
-0.08512565, 0.7097161, -0.8359944, 1, 1, 1, 1, 1,
-0.08383533, -0.9624732, -3.911226, 1, 1, 1, 1, 1,
-0.08339516, -0.6269098, -3.770347, 1, 1, 1, 1, 1,
-0.08291794, 0.2573978, 0.6600367, 1, 1, 1, 1, 1,
-0.08281414, 1.034952, 0.9030682, 1, 1, 1, 1, 1,
-0.08053636, 0.1584031, -0.7329486, 1, 1, 1, 1, 1,
-0.07698558, 0.427435, 2.136565, 0, 0, 1, 1, 1,
-0.0728143, 0.557191, 1.053982, 1, 0, 0, 1, 1,
-0.07155353, -0.06497588, -1.836725, 1, 0, 0, 1, 1,
-0.06286308, -0.156635, -2.387595, 1, 0, 0, 1, 1,
-0.06157142, 2.637428, -1.044301, 1, 0, 0, 1, 1,
-0.06152968, 0.2111668, -1.722486, 1, 0, 0, 1, 1,
-0.06045658, -0.9091821, -4.140574, 0, 0, 0, 1, 1,
-0.05114611, 0.005731681, -1.500666, 0, 0, 0, 1, 1,
-0.04927149, -0.2374521, -2.320798, 0, 0, 0, 1, 1,
-0.0482455, -2.105397, -4.133658, 0, 0, 0, 1, 1,
-0.04667168, -0.6287886, -3.378299, 0, 0, 0, 1, 1,
-0.04448369, -0.3628457, -3.627407, 0, 0, 0, 1, 1,
-0.04400047, -1.082428, -2.758131, 0, 0, 0, 1, 1,
-0.043892, -0.5403434, -1.779752, 1, 1, 1, 1, 1,
-0.03998409, -0.419223, -1.324116, 1, 1, 1, 1, 1,
-0.03522789, -0.3597919, -3.072286, 1, 1, 1, 1, 1,
-0.03322541, -1.392966, -2.467351, 1, 1, 1, 1, 1,
-0.03193527, -0.8168707, -4.689007, 1, 1, 1, 1, 1,
-0.02234369, -0.596185, -3.188937, 1, 1, 1, 1, 1,
-0.02229323, 1.155539, 0.4028294, 1, 1, 1, 1, 1,
-0.02214761, -0.05315056, -4.220249, 1, 1, 1, 1, 1,
-0.01892031, -1.442792, -1.038958, 1, 1, 1, 1, 1,
-0.01632976, 0.7242431, 0.1717929, 1, 1, 1, 1, 1,
-0.009594011, 1.135275, 0.8532261, 1, 1, 1, 1, 1,
-0.003953272, 0.8128238, 1.032727, 1, 1, 1, 1, 1,
-0.00357963, -1.238618, -2.27352, 1, 1, 1, 1, 1,
-0.001108099, 0.2563841, 0.9463263, 1, 1, 1, 1, 1,
-0.0004446234, 1.991113, -0.4953314, 1, 1, 1, 1, 1,
0.005741125, -0.7464031, 4.049664, 0, 0, 1, 1, 1,
0.009189361, 0.7717254, 0.2623285, 1, 0, 0, 1, 1,
0.009368731, -1.532562, 3.368574, 1, 0, 0, 1, 1,
0.0136507, -1.738567, 2.960099, 1, 0, 0, 1, 1,
0.02068525, 1.217206, -2.520808, 1, 0, 0, 1, 1,
0.02231012, 1.086568, 1.253239, 1, 0, 0, 1, 1,
0.02550115, -0.00218985, 2.008656, 0, 0, 0, 1, 1,
0.0267645, -0.6276829, 3.675246, 0, 0, 0, 1, 1,
0.03140825, -0.7320262, 3.177431, 0, 0, 0, 1, 1,
0.03417468, -1.057, 3.843731, 0, 0, 0, 1, 1,
0.03424899, 0.9830713, -0.7780893, 0, 0, 0, 1, 1,
0.04107418, -0.8976397, 2.820747, 0, 0, 0, 1, 1,
0.0450385, -0.8748295, 1.408223, 0, 0, 0, 1, 1,
0.04547859, 0.4045864, -0.7581412, 1, 1, 1, 1, 1,
0.04849161, -0.132006, 4.772045, 1, 1, 1, 1, 1,
0.05061108, 1.034256, 1.943631, 1, 1, 1, 1, 1,
0.05120542, -0.3923946, 3.013825, 1, 1, 1, 1, 1,
0.05524618, 0.208588, 1.125009, 1, 1, 1, 1, 1,
0.05607248, 1.380911, 0.02253604, 1, 1, 1, 1, 1,
0.05637965, 0.08144588, 0.9668345, 1, 1, 1, 1, 1,
0.05766253, -0.006485418, 2.408939, 1, 1, 1, 1, 1,
0.06494469, 0.892378, -1.132604, 1, 1, 1, 1, 1,
0.07232635, -0.7049347, 1.741577, 1, 1, 1, 1, 1,
0.07311167, 0.2984962, -0.5549421, 1, 1, 1, 1, 1,
0.07500028, 0.4786754, 0.9825379, 1, 1, 1, 1, 1,
0.07882357, 0.6504736, 0.7992097, 1, 1, 1, 1, 1,
0.07895219, 0.1601431, -0.6927786, 1, 1, 1, 1, 1,
0.08229429, 0.1554275, -0.04153448, 1, 1, 1, 1, 1,
0.08311541, 1.030894, 1.93357, 0, 0, 1, 1, 1,
0.08371086, -1.117369, 1.320495, 1, 0, 0, 1, 1,
0.08468824, 0.9823065, -0.5156528, 1, 0, 0, 1, 1,
0.08678618, 0.2572803, -0.5267701, 1, 0, 0, 1, 1,
0.09321692, 1.111538, 2.070445, 1, 0, 0, 1, 1,
0.0966247, 0.6179376, 0.7287819, 1, 0, 0, 1, 1,
0.09678205, 0.3208709, -0.1751583, 0, 0, 0, 1, 1,
0.09993014, 1.305811, 2.147776, 0, 0, 0, 1, 1,
0.1006136, 0.5632843, 0.1677744, 0, 0, 0, 1, 1,
0.1023348, -0.9293032, 3.024735, 0, 0, 0, 1, 1,
0.1024374, -0.3198562, 2.820972, 0, 0, 0, 1, 1,
0.1094214, -0.9565326, 3.565542, 0, 0, 0, 1, 1,
0.1098707, 0.2434731, 2.453431, 0, 0, 0, 1, 1,
0.1151335, -0.5260872, -0.3100259, 1, 1, 1, 1, 1,
0.1153216, -1.264333, 3.839044, 1, 1, 1, 1, 1,
0.1171902, -0.3905711, 1.782848, 1, 1, 1, 1, 1,
0.1178006, -1.102877, 3.746688, 1, 1, 1, 1, 1,
0.1197897, -0.05574308, 1.015654, 1, 1, 1, 1, 1,
0.1198091, 1.600515, 0.2774868, 1, 1, 1, 1, 1,
0.1204707, -0.1286266, 3.384301, 1, 1, 1, 1, 1,
0.1219586, 0.3880621, 1.636666, 1, 1, 1, 1, 1,
0.1224363, -0.1434576, 1.86374, 1, 1, 1, 1, 1,
0.1237169, 1.836826, 0.7451355, 1, 1, 1, 1, 1,
0.1238346, 0.3261927, 1.221383, 1, 1, 1, 1, 1,
0.1321957, -1.220217, 3.093415, 1, 1, 1, 1, 1,
0.1375381, -0.765116, 2.706141, 1, 1, 1, 1, 1,
0.1433277, 0.741943, 0.9819031, 1, 1, 1, 1, 1,
0.1460271, -0.227414, 2.528521, 1, 1, 1, 1, 1,
0.1477649, 0.4945894, -0.5407586, 0, 0, 1, 1, 1,
0.1519968, -1.475525, 4.205716, 1, 0, 0, 1, 1,
0.1528057, -0.9315348, 5.536424, 1, 0, 0, 1, 1,
0.1561372, 0.5925534, -0.5219634, 1, 0, 0, 1, 1,
0.1569911, -0.6323802, 3.472409, 1, 0, 0, 1, 1,
0.1627931, -1.270979, 3.570685, 1, 0, 0, 1, 1,
0.165167, 0.6087173, 0.5929291, 0, 0, 0, 1, 1,
0.1660646, -0.7440094, 1.490408, 0, 0, 0, 1, 1,
0.1703058, -1.494413, 4.094214, 0, 0, 0, 1, 1,
0.1721585, 0.5863712, 1.81948, 0, 0, 0, 1, 1,
0.1786274, 0.8056409, 1.04542, 0, 0, 0, 1, 1,
0.1798918, 0.1185517, 0.2758708, 0, 0, 0, 1, 1,
0.1855528, 0.7595084, -0.4670186, 0, 0, 0, 1, 1,
0.1884259, 0.4512081, 0.05498606, 1, 1, 1, 1, 1,
0.1889666, 0.6049705, -0.4758414, 1, 1, 1, 1, 1,
0.1891967, -0.6259836, 3.685076, 1, 1, 1, 1, 1,
0.1903213, -0.02313344, 2.065377, 1, 1, 1, 1, 1,
0.1948964, -0.2470044, 2.458784, 1, 1, 1, 1, 1,
0.1949219, -0.3476916, 1.741458, 1, 1, 1, 1, 1,
0.1983036, -0.0008878252, 1.530951, 1, 1, 1, 1, 1,
0.2117704, 0.3858258, 0.5360698, 1, 1, 1, 1, 1,
0.2155798, 0.2600615, 1.306438, 1, 1, 1, 1, 1,
0.2179597, -0.3243028, 3.356033, 1, 1, 1, 1, 1,
0.2187837, 0.09830992, 1.036986, 1, 1, 1, 1, 1,
0.2190749, -0.2345584, 2.484141, 1, 1, 1, 1, 1,
0.2213824, -1.990368, 4.453578, 1, 1, 1, 1, 1,
0.2216673, -0.3256961, 1.598521, 1, 1, 1, 1, 1,
0.2221132, -0.2607135, 0.7476121, 1, 1, 1, 1, 1,
0.2234651, 0.6123067, 1.944087, 0, 0, 1, 1, 1,
0.2277418, 0.8724354, 0.6394044, 1, 0, 0, 1, 1,
0.2288027, 0.7078871, 0.5271325, 1, 0, 0, 1, 1,
0.2300717, 0.08278733, -0.008438292, 1, 0, 0, 1, 1,
0.2301755, 0.1777198, 0.6567552, 1, 0, 0, 1, 1,
0.2371437, 0.2427348, 1.166289, 1, 0, 0, 1, 1,
0.2383416, 0.6128305, 1.144991, 0, 0, 0, 1, 1,
0.2416903, 0.5369793, -0.5020718, 0, 0, 0, 1, 1,
0.2420097, -1.473125, 1.642491, 0, 0, 0, 1, 1,
0.2421416, 0.7074483, 0.8839366, 0, 0, 0, 1, 1,
0.2453199, 0.44675, 0.1763479, 0, 0, 0, 1, 1,
0.2525039, -0.5849916, 3.540576, 0, 0, 0, 1, 1,
0.2530428, -1.246801, 3.872131, 0, 0, 0, 1, 1,
0.2549213, -1.09596, 3.611362, 1, 1, 1, 1, 1,
0.2551489, 0.4128054, 0.9539521, 1, 1, 1, 1, 1,
0.2578184, -0.5161405, 3.023856, 1, 1, 1, 1, 1,
0.2610107, 1.720638, -0.1262804, 1, 1, 1, 1, 1,
0.2645884, 1.940768, -0.3627566, 1, 1, 1, 1, 1,
0.2648132, 2.278198, 0.2514776, 1, 1, 1, 1, 1,
0.2653227, 1.326639, 1.104329, 1, 1, 1, 1, 1,
0.2665732, -0.06496345, 1.041699, 1, 1, 1, 1, 1,
0.2667946, -0.04092431, 1.759733, 1, 1, 1, 1, 1,
0.267412, 0.1679088, 1.608043, 1, 1, 1, 1, 1,
0.2710312, -2.491688, 2.070589, 1, 1, 1, 1, 1,
0.2866847, -1.342078, 1.359416, 1, 1, 1, 1, 1,
0.2875628, 0.5835501, 0.8361294, 1, 1, 1, 1, 1,
0.2884347, -1.340293, 3.939113, 1, 1, 1, 1, 1,
0.2893127, -0.5486186, 2.214441, 1, 1, 1, 1, 1,
0.2914938, -1.009982, 3.081546, 0, 0, 1, 1, 1,
0.2968404, 0.2024778, 0.9432639, 1, 0, 0, 1, 1,
0.29846, -0.1597882, 0.8901516, 1, 0, 0, 1, 1,
0.2999772, 0.2232215, 0.860853, 1, 0, 0, 1, 1,
0.3000054, -0.9838024, 1.666912, 1, 0, 0, 1, 1,
0.303212, -0.6193694, 1.990057, 1, 0, 0, 1, 1,
0.308276, -1.197688, 3.813618, 0, 0, 0, 1, 1,
0.3119134, -0.1790081, 1.215276, 0, 0, 0, 1, 1,
0.3164073, 1.007655, 0.1046774, 0, 0, 0, 1, 1,
0.3211546, 0.1927625, 1.133252, 0, 0, 0, 1, 1,
0.3220127, 0.1417106, -0.0700383, 0, 0, 0, 1, 1,
0.3278641, -2.536825, 4.022294, 0, 0, 0, 1, 1,
0.3296981, -0.1821427, 2.841997, 0, 0, 0, 1, 1,
0.3337302, -0.2871803, 3.878765, 1, 1, 1, 1, 1,
0.33607, 0.4381085, -0.0168064, 1, 1, 1, 1, 1,
0.3440414, -0.4093679, 3.660233, 1, 1, 1, 1, 1,
0.3447494, 0.9108153, -0.4463079, 1, 1, 1, 1, 1,
0.3458113, 0.5314072, 0.9381325, 1, 1, 1, 1, 1,
0.3467236, 0.8387867, 0.06396504, 1, 1, 1, 1, 1,
0.3495454, 0.9760001, -0.4310474, 1, 1, 1, 1, 1,
0.3511754, 0.1538978, 1.201931, 1, 1, 1, 1, 1,
0.3547203, -0.9550256, 3.231675, 1, 1, 1, 1, 1,
0.3590352, -0.2268019, 0.8092985, 1, 1, 1, 1, 1,
0.3678929, 1.672178, -0.4373792, 1, 1, 1, 1, 1,
0.3696052, 0.9387468, -0.1321678, 1, 1, 1, 1, 1,
0.371157, 0.1394709, 1.154092, 1, 1, 1, 1, 1,
0.3713219, -1.703292, 1.615645, 1, 1, 1, 1, 1,
0.3754999, 0.2627003, 2.170376, 1, 1, 1, 1, 1,
0.3761857, 1.163532, -0.1541655, 0, 0, 1, 1, 1,
0.3767774, 0.5269947, 0.2641263, 1, 0, 0, 1, 1,
0.3832667, -1.491992, 4.54661, 1, 0, 0, 1, 1,
0.3844013, 1.369041, -1.203999, 1, 0, 0, 1, 1,
0.3859157, -1.002441, 0.1528376, 1, 0, 0, 1, 1,
0.3873359, -0.1108089, 2.957344, 1, 0, 0, 1, 1,
0.3883847, -0.1132598, 0.966052, 0, 0, 0, 1, 1,
0.3909239, -2.121319, 0.7369929, 0, 0, 0, 1, 1,
0.3919793, 0.1003527, 0.09108983, 0, 0, 0, 1, 1,
0.3947344, 0.03472842, 0.2327964, 0, 0, 0, 1, 1,
0.3960215, 0.6499916, 1.301276, 0, 0, 0, 1, 1,
0.3967548, 0.1669585, 1.813704, 0, 0, 0, 1, 1,
0.3968354, -0.4981541, 1.362948, 0, 0, 0, 1, 1,
0.398349, 0.5647916, 0.8810045, 1, 1, 1, 1, 1,
0.398566, 0.7995069, -0.7920756, 1, 1, 1, 1, 1,
0.3988176, -0.2943397, 0.771382, 1, 1, 1, 1, 1,
0.4010197, 0.8204985, 1.914718, 1, 1, 1, 1, 1,
0.4021631, 0.7437078, 2.871829, 1, 1, 1, 1, 1,
0.4053701, 0.4526984, 3.937303, 1, 1, 1, 1, 1,
0.4070683, -0.1843249, 1.964771, 1, 1, 1, 1, 1,
0.4073777, 1.610654, -0.3317851, 1, 1, 1, 1, 1,
0.4074184, 0.3474142, 2.423221, 1, 1, 1, 1, 1,
0.4129681, -0.3165217, 4.779042, 1, 1, 1, 1, 1,
0.4134119, -0.6882167, 1.517966, 1, 1, 1, 1, 1,
0.4173883, -1.408663, 2.609821, 1, 1, 1, 1, 1,
0.4245024, -1.557281, 1.980235, 1, 1, 1, 1, 1,
0.4273139, -0.2678278, 0.6351941, 1, 1, 1, 1, 1,
0.4296193, 2.61449, -1.807529, 1, 1, 1, 1, 1,
0.4298541, 2.3238, -0.1486382, 0, 0, 1, 1, 1,
0.4330725, -0.2134292, 3.20193, 1, 0, 0, 1, 1,
0.4389933, 0.7813656, 0.7621329, 1, 0, 0, 1, 1,
0.4460359, 1.607201, 0.6974255, 1, 0, 0, 1, 1,
0.4579418, -0.1993402, 3.082801, 1, 0, 0, 1, 1,
0.4624043, 0.4727844, 0.1164386, 1, 0, 0, 1, 1,
0.4649733, 0.6153256, 0.6068045, 0, 0, 0, 1, 1,
0.4655044, 0.2249012, 0.5956097, 0, 0, 0, 1, 1,
0.4662605, 1.133518, -1.134746, 0, 0, 0, 1, 1,
0.4667932, 1.320462, 0.5888368, 0, 0, 0, 1, 1,
0.4744716, 0.7078215, -0.3629869, 0, 0, 0, 1, 1,
0.4787209, -0.518698, 2.756966, 0, 0, 0, 1, 1,
0.4800535, 0.6979207, 1.223505, 0, 0, 0, 1, 1,
0.4853136, 1.915287, 0.6596092, 1, 1, 1, 1, 1,
0.4936734, 2.536922, -2.253164, 1, 1, 1, 1, 1,
0.498331, 1.133314, 0.2425459, 1, 1, 1, 1, 1,
0.4985746, 0.6028309, 2.002032, 1, 1, 1, 1, 1,
0.5004994, -0.5470529, 3.213683, 1, 1, 1, 1, 1,
0.5028262, -0.5350614, 2.282725, 1, 1, 1, 1, 1,
0.5037704, -0.9526246, 3.691025, 1, 1, 1, 1, 1,
0.5057143, -0.6579705, 1.843987, 1, 1, 1, 1, 1,
0.5060917, -0.647293, 1.249604, 1, 1, 1, 1, 1,
0.5074454, 0.4496077, 1.829229, 1, 1, 1, 1, 1,
0.5075299, 0.9813906, 0.3750815, 1, 1, 1, 1, 1,
0.5078218, -0.04515032, 1.806675, 1, 1, 1, 1, 1,
0.5097321, 0.1253688, 0.4308802, 1, 1, 1, 1, 1,
0.5106767, 0.4659154, -2.912043, 1, 1, 1, 1, 1,
0.5118311, 1.017193, -0.2944794, 1, 1, 1, 1, 1,
0.5171639, 1.781622, 0.1670304, 0, 0, 1, 1, 1,
0.5256299, -0.1130004, 0.625259, 1, 0, 0, 1, 1,
0.5277535, 1.369727, -1.096106, 1, 0, 0, 1, 1,
0.5317398, -1.185091, 2.545539, 1, 0, 0, 1, 1,
0.5390899, 0.7287447, 0.0928897, 1, 0, 0, 1, 1,
0.5414966, -0.5612896, 3.322147, 1, 0, 0, 1, 1,
0.545075, 0.9114244, 3.650748, 0, 0, 0, 1, 1,
0.5484098, 0.4284987, 2.655482, 0, 0, 0, 1, 1,
0.5505145, 1.471064, 1.897508, 0, 0, 0, 1, 1,
0.5559494, 0.9351506, 0.8625969, 0, 0, 0, 1, 1,
0.5568462, -0.6165407, 2.72116, 0, 0, 0, 1, 1,
0.5604472, 0.5212781, 0.9669142, 0, 0, 0, 1, 1,
0.5623135, 0.03581417, 0.3563462, 0, 0, 0, 1, 1,
0.5638081, 0.03226883, 1.743284, 1, 1, 1, 1, 1,
0.564994, -0.2492581, 0.3869571, 1, 1, 1, 1, 1,
0.5653429, -1.459815, 2.068592, 1, 1, 1, 1, 1,
0.5683408, -0.3673911, 2.843259, 1, 1, 1, 1, 1,
0.5732555, -0.8668947, 2.319131, 1, 1, 1, 1, 1,
0.5753304, -0.7905399, 4.299434, 1, 1, 1, 1, 1,
0.5818253, 0.4569021, 0.9899952, 1, 1, 1, 1, 1,
0.5827588, -0.9972186, 1.958586, 1, 1, 1, 1, 1,
0.5868397, -0.3505628, 3.245696, 1, 1, 1, 1, 1,
0.5875864, 1.495872, 1.153346, 1, 1, 1, 1, 1,
0.5913928, 1.151437, 2.251736, 1, 1, 1, 1, 1,
0.5964742, -0.5599702, 2.883997, 1, 1, 1, 1, 1,
0.5980178, -0.9964717, 1.406929, 1, 1, 1, 1, 1,
0.600179, -0.6358476, 2.099983, 1, 1, 1, 1, 1,
0.6061836, 1.204034, 0.8661618, 1, 1, 1, 1, 1,
0.6117998, -1.34058, 3.585591, 0, 0, 1, 1, 1,
0.6142781, 1.714697, -0.9005974, 1, 0, 0, 1, 1,
0.6174658, 0.2011732, 1.524354, 1, 0, 0, 1, 1,
0.6227719, -0.5599093, 1.051646, 1, 0, 0, 1, 1,
0.6250072, -0.1792981, 1.951144, 1, 0, 0, 1, 1,
0.6254457, -1.10434, 4.578352, 1, 0, 0, 1, 1,
0.6341149, 1.965034, -1.08891, 0, 0, 0, 1, 1,
0.6343085, -1.305701, 1.080769, 0, 0, 0, 1, 1,
0.6350679, -2.290608, 2.285902, 0, 0, 0, 1, 1,
0.6360416, -1.214541, 2.868431, 0, 0, 0, 1, 1,
0.6368162, 0.5311383, 0.7789132, 0, 0, 0, 1, 1,
0.6398858, 0.6508029, -0.3317495, 0, 0, 0, 1, 1,
0.6403272, -0.7837121, 0.6508929, 0, 0, 0, 1, 1,
0.6403913, -1.325735, 1.070492, 1, 1, 1, 1, 1,
0.6414611, -0.9310184, 1.972289, 1, 1, 1, 1, 1,
0.6419575, -0.5737379, 3.183952, 1, 1, 1, 1, 1,
0.6518722, 0.5363302, -0.2416997, 1, 1, 1, 1, 1,
0.6560386, 0.5373088, 1.159429, 1, 1, 1, 1, 1,
0.6620594, 1.032936, 0.02510813, 1, 1, 1, 1, 1,
0.6638303, 2.854443, 0.7684474, 1, 1, 1, 1, 1,
0.6640491, 1.108715, 0.5622115, 1, 1, 1, 1, 1,
0.6650424, 0.3875867, 1.339849, 1, 1, 1, 1, 1,
0.6665426, 0.0539282, 1.195455, 1, 1, 1, 1, 1,
0.6697127, 1.044357, -1.314974, 1, 1, 1, 1, 1,
0.6746845, 0.5879709, 0.6034785, 1, 1, 1, 1, 1,
0.6763254, -1.146339, 2.836873, 1, 1, 1, 1, 1,
0.6842753, 0.9762143, 1.086338, 1, 1, 1, 1, 1,
0.685734, 0.09460635, 2.086694, 1, 1, 1, 1, 1,
0.6977798, -0.8430082, 5.907994, 0, 0, 1, 1, 1,
0.7000666, -0.004000954, 2.478555, 1, 0, 0, 1, 1,
0.7068942, -0.2315346, 1.942095, 1, 0, 0, 1, 1,
0.7150653, -0.9732503, 3.186543, 1, 0, 0, 1, 1,
0.7177894, 1.168476, 0.8124028, 1, 0, 0, 1, 1,
0.7355589, 0.4682434, 2.306448, 1, 0, 0, 1, 1,
0.7393944, -0.4982493, 1.602579, 0, 0, 0, 1, 1,
0.7429485, -1.059882, 2.057992, 0, 0, 0, 1, 1,
0.7435766, -0.4651373, 2.743327, 0, 0, 0, 1, 1,
0.7444332, -0.8650609, 2.090816, 0, 0, 0, 1, 1,
0.7467731, -1.192916, 2.209995, 0, 0, 0, 1, 1,
0.7469308, -1.566545, 3.633381, 0, 0, 0, 1, 1,
0.7505031, 0.1625496, 1.41204, 0, 0, 0, 1, 1,
0.750817, 0.001439917, 0.3815928, 1, 1, 1, 1, 1,
0.7613522, -0.05383022, 1.404564, 1, 1, 1, 1, 1,
0.7614458, -1.583554, 2.076309, 1, 1, 1, 1, 1,
0.7631921, 0.3862201, 2.344146, 1, 1, 1, 1, 1,
0.7640427, -0.1270238, 0.8476029, 1, 1, 1, 1, 1,
0.7654426, -0.6995221, 2.896333, 1, 1, 1, 1, 1,
0.7713867, 0.468083, 0.6448779, 1, 1, 1, 1, 1,
0.7725898, 0.3449834, 1.09226, 1, 1, 1, 1, 1,
0.7741222, -1.683139, 2.724519, 1, 1, 1, 1, 1,
0.7742882, 1.334052, 2.106112, 1, 1, 1, 1, 1,
0.7742889, 0.9921308, 2.513357, 1, 1, 1, 1, 1,
0.7805846, -0.636137, 1.486112, 1, 1, 1, 1, 1,
0.781917, -0.4386485, 1.130916, 1, 1, 1, 1, 1,
0.7837159, -0.6666834, 1.499478, 1, 1, 1, 1, 1,
0.7951854, -0.5925711, 0.8489566, 1, 1, 1, 1, 1,
0.795643, 1.341764, 1.24465, 0, 0, 1, 1, 1,
0.7995771, 1.474915, 0.1740733, 1, 0, 0, 1, 1,
0.8026631, -0.2831596, 2.804214, 1, 0, 0, 1, 1,
0.8049453, 0.1173686, 0.7051206, 1, 0, 0, 1, 1,
0.8061442, 2.31147, 0.8970878, 1, 0, 0, 1, 1,
0.8088912, 0.1808725, 2.333736, 1, 0, 0, 1, 1,
0.8089253, -0.5969245, 4.059216, 0, 0, 0, 1, 1,
0.8108066, 0.9625155, 2.175527, 0, 0, 0, 1, 1,
0.8128453, -1.028137, 1.276905, 0, 0, 0, 1, 1,
0.8203293, 1.576875, 1.017351, 0, 0, 0, 1, 1,
0.8214227, -1.052132, 2.192854, 0, 0, 0, 1, 1,
0.8251545, -0.2726627, 1.112613, 0, 0, 0, 1, 1,
0.8265733, 1.738819, -0.5012676, 0, 0, 0, 1, 1,
0.8293043, 0.5005533, 1.297375, 1, 1, 1, 1, 1,
0.8305154, 0.4203296, 0.04672841, 1, 1, 1, 1, 1,
0.835522, 1.392512, 0.811231, 1, 1, 1, 1, 1,
0.8374868, 2.346869, -0.09054541, 1, 1, 1, 1, 1,
0.8397314, 1.718099, 0.01704265, 1, 1, 1, 1, 1,
0.8422197, -0.7464052, 1.030163, 1, 1, 1, 1, 1,
0.8469671, 1.675234, 0.1962738, 1, 1, 1, 1, 1,
0.8526796, -0.230173, 0.9981108, 1, 1, 1, 1, 1,
0.8552761, 0.4486843, 0.1092103, 1, 1, 1, 1, 1,
0.8558288, -1.269982, 4.561874, 1, 1, 1, 1, 1,
0.8648748, -1.002198, 3.282861, 1, 1, 1, 1, 1,
0.8678156, -0.006746705, 2.065284, 1, 1, 1, 1, 1,
0.8690549, 0.3085681, 1.149767, 1, 1, 1, 1, 1,
0.8727348, 1.922698, 1.482646, 1, 1, 1, 1, 1,
0.8881817, -0.2309565, 2.460984, 1, 1, 1, 1, 1,
0.8896834, -1.984108, 1.334291, 0, 0, 1, 1, 1,
0.8908223, 1.221194, 3.82887, 1, 0, 0, 1, 1,
0.8940449, 1.298852, 0.2055016, 1, 0, 0, 1, 1,
0.8980522, -1.034652, 1.092675, 1, 0, 0, 1, 1,
0.8981256, -0.01244686, 1.048057, 1, 0, 0, 1, 1,
0.8985068, 0.7051585, 1.027977, 1, 0, 0, 1, 1,
0.9033213, -0.8061296, 3.131917, 0, 0, 0, 1, 1,
0.9066887, -0.03074489, 1.881699, 0, 0, 0, 1, 1,
0.9071606, 0.7000071, 0.20113, 0, 0, 0, 1, 1,
0.9122784, -1.775652, 2.564204, 0, 0, 0, 1, 1,
0.9124022, -0.1177696, 1.135335, 0, 0, 0, 1, 1,
0.9186147, 0.3782458, -0.2599055, 0, 0, 0, 1, 1,
0.9220775, 0.5406966, -0.2531012, 0, 0, 0, 1, 1,
0.9240468, -3.141081, 3.745839, 1, 1, 1, 1, 1,
0.9301896, -0.1305063, 2.824807, 1, 1, 1, 1, 1,
0.931336, -0.2322475, 1.453128, 1, 1, 1, 1, 1,
0.9315435, 0.5318864, 1.294213, 1, 1, 1, 1, 1,
0.9382289, 0.886259, 0.690208, 1, 1, 1, 1, 1,
0.9387138, -3.508785, 5.574598, 1, 1, 1, 1, 1,
0.9425401, 1.360015, 3.317385, 1, 1, 1, 1, 1,
0.9475392, -0.8428329, 0.4001383, 1, 1, 1, 1, 1,
0.950679, -0.2813587, 3.072174, 1, 1, 1, 1, 1,
0.950704, 1.428234, 0.4349227, 1, 1, 1, 1, 1,
0.9630558, 2.659554, -0.1291178, 1, 1, 1, 1, 1,
0.9747033, -2.332755, 0.4165314, 1, 1, 1, 1, 1,
0.9749314, -2.368452, 3.297212, 1, 1, 1, 1, 1,
0.9750593, -0.02957394, 1.7386, 1, 1, 1, 1, 1,
0.9758713, 0.5985687, 0.7133536, 1, 1, 1, 1, 1,
0.9790413, 0.7467852, 0.5931568, 0, 0, 1, 1, 1,
0.9923357, 0.3833982, 1.018749, 1, 0, 0, 1, 1,
0.9968816, 1.000788, -0.5331593, 1, 0, 0, 1, 1,
0.9980289, -0.8762414, 2.244539, 1, 0, 0, 1, 1,
0.9985927, -1.061446, 2.583348, 1, 0, 0, 1, 1,
0.9987007, 0.5088863, 0.7468609, 1, 0, 0, 1, 1,
0.9998975, -0.08518349, 1.453207, 0, 0, 0, 1, 1,
1.005376, -0.8959253, 2.713737, 0, 0, 0, 1, 1,
1.010216, 2.545663, 0.3105851, 0, 0, 0, 1, 1,
1.011179, -0.6111258, 3.360698, 0, 0, 0, 1, 1,
1.013199, -0.2328778, 1.412739, 0, 0, 0, 1, 1,
1.019132, -0.6443154, 2.204039, 0, 0, 0, 1, 1,
1.028387, -0.554548, 1.945266, 0, 0, 0, 1, 1,
1.031694, -0.6505756, 3.617608, 1, 1, 1, 1, 1,
1.034682, 0.2497545, -0.4515564, 1, 1, 1, 1, 1,
1.037567, -0.7872123, 0.4901621, 1, 1, 1, 1, 1,
1.038118, 0.4131249, 0.4780855, 1, 1, 1, 1, 1,
1.039994, 1.212805, 1.275672, 1, 1, 1, 1, 1,
1.04062, -1.003544, 3.445589, 1, 1, 1, 1, 1,
1.042089, 0.9013277, 0.4670868, 1, 1, 1, 1, 1,
1.050427, 0.03380381, 2.226633, 1, 1, 1, 1, 1,
1.055397, -0.9136088, 3.189283, 1, 1, 1, 1, 1,
1.059319, -1.206269, 4.033405, 1, 1, 1, 1, 1,
1.081661, -0.003681234, 0.1402593, 1, 1, 1, 1, 1,
1.086288, 0.4123474, 1.143498, 1, 1, 1, 1, 1,
1.089056, -0.5534226, 2.176339, 1, 1, 1, 1, 1,
1.093779, 0.4681464, 0.8324137, 1, 1, 1, 1, 1,
1.095902, -0.9066635, 2.908032, 1, 1, 1, 1, 1,
1.100973, 0.3615685, 0.7022886, 0, 0, 1, 1, 1,
1.120501, -1.006505, 2.759492, 1, 0, 0, 1, 1,
1.123021, 1.330483, 0.5810409, 1, 0, 0, 1, 1,
1.123373, -1.593013, 3.515589, 1, 0, 0, 1, 1,
1.123495, 0.5129868, 1.863522, 1, 0, 0, 1, 1,
1.12761, -1.852807, 2.085353, 1, 0, 0, 1, 1,
1.139034, 0.1819865, 1.877161, 0, 0, 0, 1, 1,
1.151843, 1.605081, 0.8930709, 0, 0, 0, 1, 1,
1.153539, 0.694255, 0.132186, 0, 0, 0, 1, 1,
1.154492, -0.08616591, -0.2864861, 0, 0, 0, 1, 1,
1.169735, 0.2139214, 0.6450795, 0, 0, 0, 1, 1,
1.180607, 0.4282098, 0.5063766, 0, 0, 0, 1, 1,
1.185856, -0.401795, 1.609999, 0, 0, 0, 1, 1,
1.189684, -1.420932, 3.30018, 1, 1, 1, 1, 1,
1.197769, 0.7835355, 1.651607, 1, 1, 1, 1, 1,
1.201717, -0.05792012, 1.725092, 1, 1, 1, 1, 1,
1.205523, 0.3721139, 0.1102338, 1, 1, 1, 1, 1,
1.226642, 0.48583, 1.463601, 1, 1, 1, 1, 1,
1.226909, -0.9750077, 1.876591, 1, 1, 1, 1, 1,
1.229755, -0.3490779, 2.752574, 1, 1, 1, 1, 1,
1.232397, -0.79106, 2.430946, 1, 1, 1, 1, 1,
1.236334, 0.69545, 0.5562144, 1, 1, 1, 1, 1,
1.248833, -0.3537529, 0.2690436, 1, 1, 1, 1, 1,
1.250663, -1.903229, 2.391834, 1, 1, 1, 1, 1,
1.251733, -2.54229, 3.472689, 1, 1, 1, 1, 1,
1.253141, 2.349072, -0.03733869, 1, 1, 1, 1, 1,
1.262525, -0.2765338, 0.4099182, 1, 1, 1, 1, 1,
1.263631, -1.41101, 3.774679, 1, 1, 1, 1, 1,
1.265854, 1.288931, 1.525798, 0, 0, 1, 1, 1,
1.27304, -1.656488, 2.07335, 1, 0, 0, 1, 1,
1.274075, -0.1324998, 1.01472, 1, 0, 0, 1, 1,
1.278892, -1.042084, 0.9066436, 1, 0, 0, 1, 1,
1.280787, -0.5651928, 1.884078, 1, 0, 0, 1, 1,
1.288212, 1.123526, 1.223848, 1, 0, 0, 1, 1,
1.292109, 0.8314438, 1.314755, 0, 0, 0, 1, 1,
1.309108, -0.2557299, 1.081877, 0, 0, 0, 1, 1,
1.310437, 0.1827052, 1.090702, 0, 0, 0, 1, 1,
1.312233, 1.026624, 0.9303221, 0, 0, 0, 1, 1,
1.32095, -0.5181985, 1.516848, 0, 0, 0, 1, 1,
1.326077, -0.9735505, 2.393063, 0, 0, 0, 1, 1,
1.331194, -1.311649, 1.925824, 0, 0, 0, 1, 1,
1.340028, -0.8945633, 2.296256, 1, 1, 1, 1, 1,
1.342943, 2.298778, 2.909678, 1, 1, 1, 1, 1,
1.345147, 1.039475, 2.293061, 1, 1, 1, 1, 1,
1.355386, -1.266471, 2.234452, 1, 1, 1, 1, 1,
1.360847, 0.6285571, -0.7899125, 1, 1, 1, 1, 1,
1.366759, 0.2327285, 1.985419, 1, 1, 1, 1, 1,
1.368596, 1.193281, 0.08468445, 1, 1, 1, 1, 1,
1.371542, 0.6518012, 1.087399, 1, 1, 1, 1, 1,
1.383704, 1.372599, 2.443847, 1, 1, 1, 1, 1,
1.400996, -0.4810427, 2.19271, 1, 1, 1, 1, 1,
1.404056, -1.543401, 1.502288, 1, 1, 1, 1, 1,
1.404325, 0.2235271, 0.0158956, 1, 1, 1, 1, 1,
1.407386, 0.7329308, 2.129602, 1, 1, 1, 1, 1,
1.409582, -0.1788329, 0.771772, 1, 1, 1, 1, 1,
1.426238, 0.9320551, 0.9309666, 1, 1, 1, 1, 1,
1.426988, -0.1391574, 2.635574, 0, 0, 1, 1, 1,
1.4307, 0.03523167, 1.355744, 1, 0, 0, 1, 1,
1.446178, -0.4358118, 0.9941114, 1, 0, 0, 1, 1,
1.446963, -0.6614701, 2.62569, 1, 0, 0, 1, 1,
1.448416, 2.549116, -0.2682674, 1, 0, 0, 1, 1,
1.463306, 1.980888, 1.485726, 1, 0, 0, 1, 1,
1.465441, -0.5958179, 2.223958, 0, 0, 0, 1, 1,
1.468152, -0.3821308, 1.672866, 0, 0, 0, 1, 1,
1.471797, 2.103369, 1.148572, 0, 0, 0, 1, 1,
1.485155, 0.3936209, -0.2535621, 0, 0, 0, 1, 1,
1.486389, 0.7715959, 1.564453, 0, 0, 0, 1, 1,
1.487881, -1.406198, 2.658308, 0, 0, 0, 1, 1,
1.500287, 0.3024543, 1.020309, 0, 0, 0, 1, 1,
1.507936, -2.497931, 2.936763, 1, 1, 1, 1, 1,
1.511114, -1.544533, 3.547331, 1, 1, 1, 1, 1,
1.523852, 0.3584275, 0.6849322, 1, 1, 1, 1, 1,
1.525568, -0.1193827, 3.165269, 1, 1, 1, 1, 1,
1.529273, -1.402221, 0.6251798, 1, 1, 1, 1, 1,
1.564375, 1.394947, 0.4405409, 1, 1, 1, 1, 1,
1.567911, 0.8239669, 0.5746388, 1, 1, 1, 1, 1,
1.569343, -1.065512, 1.826306, 1, 1, 1, 1, 1,
1.575032, 0.7139959, 1.956255, 1, 1, 1, 1, 1,
1.577174, 0.5408359, 0.8807579, 1, 1, 1, 1, 1,
1.584598, -0.6481278, 2.118047, 1, 1, 1, 1, 1,
1.588405, -0.4531575, 2.452348, 1, 1, 1, 1, 1,
1.592098, -0.8486589, 0.1446498, 1, 1, 1, 1, 1,
1.616413, -0.1036769, 1.477354, 1, 1, 1, 1, 1,
1.624041, -0.1407273, 1.36525, 1, 1, 1, 1, 1,
1.632751, -0.4482535, 0.2729398, 0, 0, 1, 1, 1,
1.65048, 0.2556987, 4.20059, 1, 0, 0, 1, 1,
1.662127, 0.03575824, 2.672896, 1, 0, 0, 1, 1,
1.687012, -0.4845805, 0.3003802, 1, 0, 0, 1, 1,
1.691796, 0.6158984, 0.8425878, 1, 0, 0, 1, 1,
1.696572, 1.799875, 1.127935, 1, 0, 0, 1, 1,
1.753958, 0.2175273, 0.8634625, 0, 0, 0, 1, 1,
1.767424, 1.319183, 1.390246, 0, 0, 0, 1, 1,
1.773967, -0.7391266, 2.615747, 0, 0, 0, 1, 1,
1.797657, -0.8126161, 1.669466, 0, 0, 0, 1, 1,
1.801201, -0.4722807, 0.9963465, 0, 0, 0, 1, 1,
1.809975, 1.261742, 0.9855482, 0, 0, 0, 1, 1,
1.828921, -0.6969265, 2.071838, 0, 0, 0, 1, 1,
1.842133, -3.943816, 3.495555, 1, 1, 1, 1, 1,
1.847012, 0.4953893, 1.202304, 1, 1, 1, 1, 1,
1.860665, 0.5252795, 1.752684, 1, 1, 1, 1, 1,
1.861755, 1.270208, 0.3808959, 1, 1, 1, 1, 1,
1.875233, 0.1424676, 2.418043, 1, 1, 1, 1, 1,
1.884346, -0.252929, 2.833741, 1, 1, 1, 1, 1,
1.892727, -0.191084, 3.465632, 1, 1, 1, 1, 1,
1.89316, 1.15675, 2.609364, 1, 1, 1, 1, 1,
1.910017, 0.7040848, 1.134224, 1, 1, 1, 1, 1,
1.936868, 1.180887, 1.242355, 1, 1, 1, 1, 1,
1.949985, -0.5598538, 3.714486, 1, 1, 1, 1, 1,
1.958965, 1.77845, 1.468741, 1, 1, 1, 1, 1,
1.977896, -0.03055023, 2.83165, 1, 1, 1, 1, 1,
2.002691, 0.5676183, 0.9551536, 1, 1, 1, 1, 1,
2.007964, 0.7841406, 1.850205, 1, 1, 1, 1, 1,
2.04837, 0.580651, 1.69403, 0, 0, 1, 1, 1,
2.06189, -1.002788, 3.388196, 1, 0, 0, 1, 1,
2.068098, 0.4513088, 0.2952304, 1, 0, 0, 1, 1,
2.08627, -0.7539392, 1.303989, 1, 0, 0, 1, 1,
2.09831, -1.111284, 1.487625, 1, 0, 0, 1, 1,
2.105665, -0.8537132, 1.22176, 1, 0, 0, 1, 1,
2.123393, -0.9338319, 1.124835, 0, 0, 0, 1, 1,
2.148849, -0.9463505, 4.052764, 0, 0, 0, 1, 1,
2.173888, -0.666387, 0.5188892, 0, 0, 0, 1, 1,
2.249212, 1.758722, 0.4402763, 0, 0, 0, 1, 1,
2.265303, 0.6745995, 1.844095, 0, 0, 0, 1, 1,
2.276202, 0.1300041, 3.213439, 0, 0, 0, 1, 1,
2.311842, 0.08004286, -0.9540448, 0, 0, 0, 1, 1,
2.380805, 1.313073, 1.858274, 1, 1, 1, 1, 1,
2.741628, -0.03289613, 2.570226, 1, 1, 1, 1, 1,
2.892973, -1.224809, 3.320118, 1, 1, 1, 1, 1,
2.983394, -0.03340447, 1.697945, 1, 1, 1, 1, 1,
3.064675, -0.5822867, 3.201896, 1, 1, 1, 1, 1,
3.323982, -0.1103632, 1.210615, 1, 1, 1, 1, 1,
3.394698, -0.2641123, 1.761484, 1, 1, 1, 1, 1
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
var radius = 9.798549;
var distance = 34.41699;
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
mvMatrix.translate( -0.1568246, 0.5446864, -0.4244397 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.41699);
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
