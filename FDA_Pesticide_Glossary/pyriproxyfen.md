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
-2.904997, -0.3831823, -0.2626938, 1, 0, 0, 1,
-2.790452, 1.995499, -1.489902, 1, 0.007843138, 0, 1,
-2.769227, 1.624461, -0.3731904, 1, 0.01176471, 0, 1,
-2.58124, -1.313379, -4.026185, 1, 0.01960784, 0, 1,
-2.419483, -0.3492027, -1.249382, 1, 0.02352941, 0, 1,
-2.405575, -1.404827, -1.155239, 1, 0.03137255, 0, 1,
-2.342107, -0.9023798, -2.014331, 1, 0.03529412, 0, 1,
-2.294945, 0.5281487, -0.8493934, 1, 0.04313726, 0, 1,
-2.223141, -0.3312765, -2.696059, 1, 0.04705882, 0, 1,
-2.218691, -0.5152348, -0.6813556, 1, 0.05490196, 0, 1,
-2.202694, 0.4806226, -1.700383, 1, 0.05882353, 0, 1,
-2.196535, -1.367622, -4.245997, 1, 0.06666667, 0, 1,
-2.189481, -0.1006512, -2.260866, 1, 0.07058824, 0, 1,
-2.13762, -0.1347119, -1.641052, 1, 0.07843138, 0, 1,
-2.09572, 0.02072448, -1.079277, 1, 0.08235294, 0, 1,
-2.093126, 1.210568, -0.09886286, 1, 0.09019608, 0, 1,
-2.076936, -0.763715, -1.924492, 1, 0.09411765, 0, 1,
-2.049951, 0.4711291, -0.378856, 1, 0.1019608, 0, 1,
-2.03855, 0.8038252, -1.189333, 1, 0.1098039, 0, 1,
-2.02462, 1.877176, -0.4950725, 1, 0.1137255, 0, 1,
-1.987635, 0.8662593, -1.812781, 1, 0.1215686, 0, 1,
-1.95947, -0.4654086, -1.05772, 1, 0.1254902, 0, 1,
-1.92235, -0.4744869, -2.157974, 1, 0.1333333, 0, 1,
-1.922314, -0.2046424, -0.6074755, 1, 0.1372549, 0, 1,
-1.904422, 0.6513667, -1.96745, 1, 0.145098, 0, 1,
-1.88933, -0.9475024, -3.298627, 1, 0.1490196, 0, 1,
-1.88779, -0.1168954, -2.451963, 1, 0.1568628, 0, 1,
-1.848456, -0.05156516, -0.9079597, 1, 0.1607843, 0, 1,
-1.844147, -0.4053353, -3.817721, 1, 0.1686275, 0, 1,
-1.835398, -1.814222, -2.788496, 1, 0.172549, 0, 1,
-1.834679, -0.3011943, 0.1382923, 1, 0.1803922, 0, 1,
-1.823917, 1.692747, -0.2173438, 1, 0.1843137, 0, 1,
-1.78949, -0.1689515, -0.570655, 1, 0.1921569, 0, 1,
-1.783164, 1.151641, -2.443099, 1, 0.1960784, 0, 1,
-1.782241, -1.582335, -3.474562, 1, 0.2039216, 0, 1,
-1.775724, 1.793571, -1.174731, 1, 0.2117647, 0, 1,
-1.757182, 1.4788, -0.5770639, 1, 0.2156863, 0, 1,
-1.73864, 1.407641, -0.1478753, 1, 0.2235294, 0, 1,
-1.735288, -0.7950374, -1.411968, 1, 0.227451, 0, 1,
-1.731273, -0.519937, -1.737084, 1, 0.2352941, 0, 1,
-1.724226, -0.3308652, -0.7597048, 1, 0.2392157, 0, 1,
-1.713794, 0.8050009, -1.75826, 1, 0.2470588, 0, 1,
-1.695042, -0.2556005, -1.252912, 1, 0.2509804, 0, 1,
-1.694423, 0.6947973, -2.178968, 1, 0.2588235, 0, 1,
-1.685818, 1.57327, -1.11816, 1, 0.2627451, 0, 1,
-1.683205, 1.357546, -1.193043, 1, 0.2705882, 0, 1,
-1.67848, 0.151796, -2.605721, 1, 0.2745098, 0, 1,
-1.667371, 0.349426, -1.556521, 1, 0.282353, 0, 1,
-1.639132, 1.502843, 0.1630993, 1, 0.2862745, 0, 1,
-1.633889, 0.114569, -1.964541, 1, 0.2941177, 0, 1,
-1.632197, 1.82489, -0.4926554, 1, 0.3019608, 0, 1,
-1.626398, 1.166105, -1.304061, 1, 0.3058824, 0, 1,
-1.622247, 0.181182, -0.6998437, 1, 0.3137255, 0, 1,
-1.619004, -1.001001, -2.005036, 1, 0.3176471, 0, 1,
-1.61251, 0.2972911, -2.253536, 1, 0.3254902, 0, 1,
-1.608915, -0.3005827, -3.302574, 1, 0.3294118, 0, 1,
-1.565253, -0.6513188, -1.972598, 1, 0.3372549, 0, 1,
-1.562034, -0.6793646, -2.266502, 1, 0.3411765, 0, 1,
-1.558537, -0.3297148, -2.249925, 1, 0.3490196, 0, 1,
-1.538331, -0.5597561, -2.655989, 1, 0.3529412, 0, 1,
-1.533116, 0.5771588, -2.030496, 1, 0.3607843, 0, 1,
-1.530448, -1.082921, -0.4423487, 1, 0.3647059, 0, 1,
-1.530124, -1.274346, -1.164423, 1, 0.372549, 0, 1,
-1.519921, -1.008975, -1.84201, 1, 0.3764706, 0, 1,
-1.51473, 1.028109, -0.4793186, 1, 0.3843137, 0, 1,
-1.505473, 1.223283, -1.787451, 1, 0.3882353, 0, 1,
-1.492666, -1.140755, -1.99798, 1, 0.3960784, 0, 1,
-1.490094, 0.3773546, -1.540613, 1, 0.4039216, 0, 1,
-1.472235, -0.2886561, -1.034824, 1, 0.4078431, 0, 1,
-1.460308, 0.1865525, -0.8914858, 1, 0.4156863, 0, 1,
-1.460272, -1.207069, -1.427573, 1, 0.4196078, 0, 1,
-1.452477, 0.5172476, -1.127074, 1, 0.427451, 0, 1,
-1.44809, 0.07854375, -1.064968, 1, 0.4313726, 0, 1,
-1.441505, -0.158939, -0.6853392, 1, 0.4392157, 0, 1,
-1.434919, -0.1629187, -1.880988, 1, 0.4431373, 0, 1,
-1.422511, -0.1095354, -2.411521, 1, 0.4509804, 0, 1,
-1.402586, 0.2541315, -1.244046, 1, 0.454902, 0, 1,
-1.394744, -0.7325044, -2.343833, 1, 0.4627451, 0, 1,
-1.380372, 1.922891, -0.3028491, 1, 0.4666667, 0, 1,
-1.373365, 2.321488, 0.1366567, 1, 0.4745098, 0, 1,
-1.352252, -0.7095055, -0.5154901, 1, 0.4784314, 0, 1,
-1.338449, -0.5653231, -0.5618832, 1, 0.4862745, 0, 1,
-1.33579, 0.7865064, 0.07231469, 1, 0.4901961, 0, 1,
-1.334267, -1.168726, -1.748738, 1, 0.4980392, 0, 1,
-1.324152, 1.412188, -1.837951, 1, 0.5058824, 0, 1,
-1.31588, 1.183686, -3.101001, 1, 0.509804, 0, 1,
-1.313848, 0.588957, -2.90859, 1, 0.5176471, 0, 1,
-1.306123, -0.5620804, -2.239397, 1, 0.5215687, 0, 1,
-1.30189, 0.454403, 0.1646245, 1, 0.5294118, 0, 1,
-1.299445, -0.5842732, -3.396548, 1, 0.5333334, 0, 1,
-1.295124, -0.5241739, -2.003289, 1, 0.5411765, 0, 1,
-1.289928, 0.4249007, -0.5806286, 1, 0.5450981, 0, 1,
-1.285001, -0.04227795, -1.300291, 1, 0.5529412, 0, 1,
-1.279275, 1.166269, -2.187838, 1, 0.5568628, 0, 1,
-1.273476, -3.97917, -3.456857, 1, 0.5647059, 0, 1,
-1.266272, 2.302294, -1.594419, 1, 0.5686275, 0, 1,
-1.255664, -0.862126, -2.079483, 1, 0.5764706, 0, 1,
-1.25043, 1.196963, 0.5379366, 1, 0.5803922, 0, 1,
-1.231172, 0.62549, 0.1934522, 1, 0.5882353, 0, 1,
-1.220085, -0.1124813, -2.45015, 1, 0.5921569, 0, 1,
-1.219415, -0.7404273, -1.365527, 1, 0.6, 0, 1,
-1.213403, 1.226658, 0.1454778, 1, 0.6078432, 0, 1,
-1.21022, -0.3459637, -2.941125, 1, 0.6117647, 0, 1,
-1.177914, -0.6600196, -2.313834, 1, 0.6196079, 0, 1,
-1.164245, -0.9685356, -3.293756, 1, 0.6235294, 0, 1,
-1.161302, -2.06696, -2.285323, 1, 0.6313726, 0, 1,
-1.160093, 0.05698474, -1.793338, 1, 0.6352941, 0, 1,
-1.158504, -1.875864, -3.367869, 1, 0.6431373, 0, 1,
-1.147679, -0.2374933, -4.224548, 1, 0.6470588, 0, 1,
-1.14538, 0.2538644, -0.4339986, 1, 0.654902, 0, 1,
-1.131301, 0.9722524, -2.276663, 1, 0.6588235, 0, 1,
-1.126071, -1.032147, -1.943213, 1, 0.6666667, 0, 1,
-1.123824, -0.5015621, -1.864108, 1, 0.6705883, 0, 1,
-1.114875, -0.8029157, -1.704631, 1, 0.6784314, 0, 1,
-1.11457, 1.049961, -0.4387096, 1, 0.682353, 0, 1,
-1.104387, 0.07107705, -1.342471, 1, 0.6901961, 0, 1,
-1.103566, 1.588851, -1.71557, 1, 0.6941177, 0, 1,
-1.102001, -1.19853, -1.217972, 1, 0.7019608, 0, 1,
-1.094133, 0.6231117, -1.809596, 1, 0.7098039, 0, 1,
-1.080316, -0.258879, -2.347707, 1, 0.7137255, 0, 1,
-1.078788, -0.1099882, -0.7256054, 1, 0.7215686, 0, 1,
-1.068511, 0.1285276, -2.062913, 1, 0.7254902, 0, 1,
-1.067015, 0.3868895, 0.00609379, 1, 0.7333333, 0, 1,
-1.066459, -0.6714502, -1.386732, 1, 0.7372549, 0, 1,
-1.06641, -0.2491963, -1.072694, 1, 0.7450981, 0, 1,
-1.051439, 0.2527806, -1.317163, 1, 0.7490196, 0, 1,
-1.047132, -1.464898, -1.188101, 1, 0.7568628, 0, 1,
-1.045875, -0.7347697, -1.755346, 1, 0.7607843, 0, 1,
-1.044201, 0.03855499, 0.1584572, 1, 0.7686275, 0, 1,
-1.041016, -0.4113382, -1.437177, 1, 0.772549, 0, 1,
-1.032183, 1.455366, -1.197893, 1, 0.7803922, 0, 1,
-1.032033, 0.9216238, -0.5994921, 1, 0.7843137, 0, 1,
-1.030296, 1.982478, -2.006427, 1, 0.7921569, 0, 1,
-1.02754, -0.3070176, -1.119851, 1, 0.7960784, 0, 1,
-1.026769, -0.5964283, -2.327586, 1, 0.8039216, 0, 1,
-1.020088, 0.7817718, -1.917969, 1, 0.8117647, 0, 1,
-1.018394, -0.1035963, -1.781021, 1, 0.8156863, 0, 1,
-1.017431, -0.8500736, -1.934826, 1, 0.8235294, 0, 1,
-1.016014, 0.314557, -1.582457, 1, 0.827451, 0, 1,
-1.01517, -0.7691905, -0.6630672, 1, 0.8352941, 0, 1,
-1.013405, -0.8170296, -3.964727, 1, 0.8392157, 0, 1,
-1.011574, 0.5797364, -1.311718, 1, 0.8470588, 0, 1,
-1.000901, -0.1706755, -1.952193, 1, 0.8509804, 0, 1,
-0.9981132, -0.8785119, -0.01792934, 1, 0.8588235, 0, 1,
-0.9966969, 0.4900812, -0.9669444, 1, 0.8627451, 0, 1,
-0.9852841, 0.3214715, 0.027007, 1, 0.8705882, 0, 1,
-0.9851639, -0.2824659, -1.448458, 1, 0.8745098, 0, 1,
-0.9829617, 1.095514, -1.491889, 1, 0.8823529, 0, 1,
-0.9745935, -1.398043, -3.348464, 1, 0.8862745, 0, 1,
-0.9742101, -2.182531, -1.668073, 1, 0.8941177, 0, 1,
-0.9676189, -0.1039941, 0.2846103, 1, 0.8980392, 0, 1,
-0.9670456, 1.664398, -1.638941, 1, 0.9058824, 0, 1,
-0.9619671, -0.9522682, -2.32118, 1, 0.9137255, 0, 1,
-0.9600027, 0.2764399, 0.1737395, 1, 0.9176471, 0, 1,
-0.9522143, 0.2302467, -2.509661, 1, 0.9254902, 0, 1,
-0.9487509, -0.01125644, -0.1181353, 1, 0.9294118, 0, 1,
-0.9409304, 0.3238728, -0.8774947, 1, 0.9372549, 0, 1,
-0.9328608, 0.8431854, 0.4496817, 1, 0.9411765, 0, 1,
-0.9322311, -0.5311688, -2.012278, 1, 0.9490196, 0, 1,
-0.9234631, -1.380463, -4.239001, 1, 0.9529412, 0, 1,
-0.9192268, 1.447541, -0.5706773, 1, 0.9607843, 0, 1,
-0.916479, 1.812413, -0.5870488, 1, 0.9647059, 0, 1,
-0.9160551, -0.6571347, -2.39911, 1, 0.972549, 0, 1,
-0.9160128, -0.2475777, -1.401441, 1, 0.9764706, 0, 1,
-0.9143323, -0.354854, -3.21698, 1, 0.9843137, 0, 1,
-0.9142337, -1.149318, -1.106063, 1, 0.9882353, 0, 1,
-0.9089485, 1.736141, -0.3397785, 1, 0.9960784, 0, 1,
-0.9077831, 0.8663187, -0.3590885, 0.9960784, 1, 0, 1,
-0.9009185, 0.5420731, -1.12625, 0.9921569, 1, 0, 1,
-0.8928486, -1.117737, -3.760274, 0.9843137, 1, 0, 1,
-0.8924643, -0.9483728, -3.582745, 0.9803922, 1, 0, 1,
-0.8903589, 1.505035, -0.6334316, 0.972549, 1, 0, 1,
-0.8866637, -0.709716, -1.093667, 0.9686275, 1, 0, 1,
-0.8841026, -1.008549, -2.707963, 0.9607843, 1, 0, 1,
-0.8799033, -0.9598065, -1.98975, 0.9568627, 1, 0, 1,
-0.878127, 0.6159549, -0.2832051, 0.9490196, 1, 0, 1,
-0.874074, -1.967609, -3.377958, 0.945098, 1, 0, 1,
-0.8727083, -0.06106351, -2.526629, 0.9372549, 1, 0, 1,
-0.8692191, 1.188205, -0.7834051, 0.9333333, 1, 0, 1,
-0.8663496, 1.237182, -1.262617, 0.9254902, 1, 0, 1,
-0.8488074, 0.4808189, -1.5691, 0.9215686, 1, 0, 1,
-0.8420865, 0.4421182, -0.2602133, 0.9137255, 1, 0, 1,
-0.8407502, 1.651379, 1.026658, 0.9098039, 1, 0, 1,
-0.8401313, 0.7380003, -0.06679268, 0.9019608, 1, 0, 1,
-0.8386016, -0.5067503, -0.8881391, 0.8941177, 1, 0, 1,
-0.8371485, 0.2804746, -1.291021, 0.8901961, 1, 0, 1,
-0.8358847, 0.08048122, 1.167209, 0.8823529, 1, 0, 1,
-0.8318494, -0.0492997, -2.965021, 0.8784314, 1, 0, 1,
-0.8268484, -0.423731, -0.9868343, 0.8705882, 1, 0, 1,
-0.8249523, -1.03493, -1.502109, 0.8666667, 1, 0, 1,
-0.823505, -0.6341345, -1.095414, 0.8588235, 1, 0, 1,
-0.8198004, -0.7733368, -2.109357, 0.854902, 1, 0, 1,
-0.8174198, 1.828053, -3.11172, 0.8470588, 1, 0, 1,
-0.8163279, 0.4638151, -0.8611591, 0.8431373, 1, 0, 1,
-0.816276, -0.8339673, -3.682067, 0.8352941, 1, 0, 1,
-0.814263, -0.5199317, -0.8417332, 0.8313726, 1, 0, 1,
-0.8129983, -0.4394431, -1.63774, 0.8235294, 1, 0, 1,
-0.8126008, -0.7049155, -2.129783, 0.8196079, 1, 0, 1,
-0.8119878, -0.8677766, -3.101857, 0.8117647, 1, 0, 1,
-0.8078697, 0.7356935, -0.1902659, 0.8078431, 1, 0, 1,
-0.8064975, 0.1225135, -1.305909, 0.8, 1, 0, 1,
-0.8058257, -0.5627043, -2.078914, 0.7921569, 1, 0, 1,
-0.8051522, -0.6066701, -2.660098, 0.7882353, 1, 0, 1,
-0.803419, 1.0262, -0.248716, 0.7803922, 1, 0, 1,
-0.8033963, -1.400356, -2.908568, 0.7764706, 1, 0, 1,
-0.8005534, 0.5967534, -0.3576099, 0.7686275, 1, 0, 1,
-0.8002475, -0.1367579, -1.873046, 0.7647059, 1, 0, 1,
-0.7979839, -0.9139392, -4.778582, 0.7568628, 1, 0, 1,
-0.7867402, -0.01203419, -2.360551, 0.7529412, 1, 0, 1,
-0.7802366, -1.56836, -1.469966, 0.7450981, 1, 0, 1,
-0.7793304, 0.630523, 1.619433, 0.7411765, 1, 0, 1,
-0.7774155, -1.869355, -1.150459, 0.7333333, 1, 0, 1,
-0.7758792, 0.4053402, -1.971598, 0.7294118, 1, 0, 1,
-0.7741904, 1.580371, -0.2499521, 0.7215686, 1, 0, 1,
-0.7727517, 1.07426, -1.268302, 0.7176471, 1, 0, 1,
-0.7725276, -0.5644668, -3.765418, 0.7098039, 1, 0, 1,
-0.7691177, 0.7648762, -1.501399, 0.7058824, 1, 0, 1,
-0.7611529, -0.1581521, -2.306306, 0.6980392, 1, 0, 1,
-0.7602364, 0.3026569, -3.554264, 0.6901961, 1, 0, 1,
-0.7598271, -0.6852415, -0.7957305, 0.6862745, 1, 0, 1,
-0.7597979, -2.418885, -2.277204, 0.6784314, 1, 0, 1,
-0.7560489, -1.146783, -2.420044, 0.6745098, 1, 0, 1,
-0.7559279, -0.3977395, -1.288418, 0.6666667, 1, 0, 1,
-0.7510028, -1.238216, -2.012028, 0.6627451, 1, 0, 1,
-0.7491977, -1.325777, -0.419075, 0.654902, 1, 0, 1,
-0.7453746, -1.482691, -3.366084, 0.6509804, 1, 0, 1,
-0.7318025, 0.8834783, 0.2767001, 0.6431373, 1, 0, 1,
-0.7297152, 1.094244, 0.920506, 0.6392157, 1, 0, 1,
-0.7229072, -0.3211507, -0.744818, 0.6313726, 1, 0, 1,
-0.7200421, -0.4976776, -1.697994, 0.627451, 1, 0, 1,
-0.7172272, 1.256665, -0.8056954, 0.6196079, 1, 0, 1,
-0.7123402, 0.2369473, -0.2864604, 0.6156863, 1, 0, 1,
-0.7110968, 0.6294823, 0.03950604, 0.6078432, 1, 0, 1,
-0.7106633, 0.3251058, -1.826931, 0.6039216, 1, 0, 1,
-0.7096776, 1.356448, -0.8174311, 0.5960785, 1, 0, 1,
-0.7064788, 0.6156686, 0.06311901, 0.5882353, 1, 0, 1,
-0.7063398, -1.084386, -3.155665, 0.5843138, 1, 0, 1,
-0.7017309, -1.418344, -1.520537, 0.5764706, 1, 0, 1,
-0.6992654, -0.5847725, -3.182954, 0.572549, 1, 0, 1,
-0.6971176, 1.592859, -0.5641562, 0.5647059, 1, 0, 1,
-0.6970488, -1.777686, -4.041426, 0.5607843, 1, 0, 1,
-0.6953731, -0.2918028, 0.3573494, 0.5529412, 1, 0, 1,
-0.6909774, -0.03670871, -2.63893, 0.5490196, 1, 0, 1,
-0.6901813, -1.083461, -4.113787, 0.5411765, 1, 0, 1,
-0.6841989, -1.688755, -1.962254, 0.5372549, 1, 0, 1,
-0.6827498, 0.04149081, -2.682543, 0.5294118, 1, 0, 1,
-0.6809105, 0.1784415, -3.270569, 0.5254902, 1, 0, 1,
-0.6759455, 0.06993499, 0.1252248, 0.5176471, 1, 0, 1,
-0.6714636, 0.8542585, -0.008071132, 0.5137255, 1, 0, 1,
-0.6648247, 0.8532649, 0.4525607, 0.5058824, 1, 0, 1,
-0.6610683, -0.6013969, -2.349699, 0.5019608, 1, 0, 1,
-0.6539485, -1.502975, -2.150492, 0.4941176, 1, 0, 1,
-0.6502779, -0.5995289, -1.476633, 0.4862745, 1, 0, 1,
-0.6475768, -0.8780667, -2.864642, 0.4823529, 1, 0, 1,
-0.6473511, -0.721893, -1.607891, 0.4745098, 1, 0, 1,
-0.6465222, -0.1338408, -2.399722, 0.4705882, 1, 0, 1,
-0.6446536, -0.6653539, 0.08118429, 0.4627451, 1, 0, 1,
-0.6434498, -1.130944, -2.235934, 0.4588235, 1, 0, 1,
-0.6408626, -1.762587, -5.607858, 0.4509804, 1, 0, 1,
-0.6337743, 1.313214, 0.1481141, 0.4470588, 1, 0, 1,
-0.631643, 1.806666, -0.2224001, 0.4392157, 1, 0, 1,
-0.6268792, -0.06273176, -2.483278, 0.4352941, 1, 0, 1,
-0.6250562, -0.6552113, -2.140017, 0.427451, 1, 0, 1,
-0.6216941, -0.8590253, -1.688687, 0.4235294, 1, 0, 1,
-0.6206357, -1.648806, -1.599823, 0.4156863, 1, 0, 1,
-0.619226, -0.2502638, -3.102268, 0.4117647, 1, 0, 1,
-0.6149281, -1.278535, -4.059665, 0.4039216, 1, 0, 1,
-0.6130628, 1.202184, 0.9596153, 0.3960784, 1, 0, 1,
-0.6065934, 0.4816107, -2.1717, 0.3921569, 1, 0, 1,
-0.6010194, 1.662168, -0.857194, 0.3843137, 1, 0, 1,
-0.5967748, 0.1660832, -0.8247619, 0.3803922, 1, 0, 1,
-0.5952925, 1.660538, 0.3114251, 0.372549, 1, 0, 1,
-0.5910913, -0.2572604, -2.176986, 0.3686275, 1, 0, 1,
-0.589854, -0.9148592, -2.84364, 0.3607843, 1, 0, 1,
-0.5865849, 1.16813, 0.8116312, 0.3568628, 1, 0, 1,
-0.5817817, -0.4301791, -1.841866, 0.3490196, 1, 0, 1,
-0.5742285, 0.5378911, -2.220551, 0.345098, 1, 0, 1,
-0.5685781, -1.209394, -2.660739, 0.3372549, 1, 0, 1,
-0.5676701, -0.1046547, -1.561957, 0.3333333, 1, 0, 1,
-0.5660918, 1.126957, -0.1984382, 0.3254902, 1, 0, 1,
-0.5656191, -0.7726136, -2.084851, 0.3215686, 1, 0, 1,
-0.564692, -0.9905851, -1.431803, 0.3137255, 1, 0, 1,
-0.5643752, -0.3307172, -1.657693, 0.3098039, 1, 0, 1,
-0.561535, -0.2265573, -3.296791, 0.3019608, 1, 0, 1,
-0.5609899, 0.1911302, 0.7322492, 0.2941177, 1, 0, 1,
-0.5600749, -0.6846411, -5.908532, 0.2901961, 1, 0, 1,
-0.5593569, 1.127562, -0.8835836, 0.282353, 1, 0, 1,
-0.5566364, 0.335177, -1.457186, 0.2784314, 1, 0, 1,
-0.5550466, -0.5312674, -1.364347, 0.2705882, 1, 0, 1,
-0.5543004, -0.1702027, -0.3623643, 0.2666667, 1, 0, 1,
-0.5482242, 0.2287747, -1.158435, 0.2588235, 1, 0, 1,
-0.5460938, -0.3494619, -1.223783, 0.254902, 1, 0, 1,
-0.5458831, -0.5053844, -3.316705, 0.2470588, 1, 0, 1,
-0.544477, 0.2730597, -0.6517947, 0.2431373, 1, 0, 1,
-0.5435116, -1.019671, -2.594834, 0.2352941, 1, 0, 1,
-0.5378591, 0.1374721, -2.247465, 0.2313726, 1, 0, 1,
-0.5314127, -1.108187, -2.995759, 0.2235294, 1, 0, 1,
-0.5245857, 1.704037, -1.317403, 0.2196078, 1, 0, 1,
-0.5217219, -2.462818, -4.319404, 0.2117647, 1, 0, 1,
-0.518747, 1.531225, 0.2107504, 0.2078431, 1, 0, 1,
-0.513859, 0.3544158, -1.764335, 0.2, 1, 0, 1,
-0.5127105, 0.3354146, -1.13338, 0.1921569, 1, 0, 1,
-0.5069637, 0.4626218, -0.5955405, 0.1882353, 1, 0, 1,
-0.5033724, -1.626148, -2.903461, 0.1803922, 1, 0, 1,
-0.4970859, -1.395508, -3.676893, 0.1764706, 1, 0, 1,
-0.4968686, 0.8583813, -0.3596927, 0.1686275, 1, 0, 1,
-0.4962767, -0.2791397, -3.387267, 0.1647059, 1, 0, 1,
-0.4953047, -0.3268208, -4.606369, 0.1568628, 1, 0, 1,
-0.4945528, 0.6782237, -0.894675, 0.1529412, 1, 0, 1,
-0.4942943, 0.1755455, -1.149844, 0.145098, 1, 0, 1,
-0.4940355, -1.406323, -2.732466, 0.1411765, 1, 0, 1,
-0.4907852, -1.539846, -2.438609, 0.1333333, 1, 0, 1,
-0.4831629, -0.01817787, -1.323893, 0.1294118, 1, 0, 1,
-0.4829714, 2.471922, -0.1173983, 0.1215686, 1, 0, 1,
-0.4828855, 0.8083433, -0.3621116, 0.1176471, 1, 0, 1,
-0.481419, 1.438289, -2.68916, 0.1098039, 1, 0, 1,
-0.480023, 0.8279317, -1.758451, 0.1058824, 1, 0, 1,
-0.4732809, 1.145811, 0.9207757, 0.09803922, 1, 0, 1,
-0.4659857, 0.4653057, 0.1263194, 0.09019608, 1, 0, 1,
-0.4653217, 0.9127049, -1.377824, 0.08627451, 1, 0, 1,
-0.4583261, 0.4543564, -0.3181086, 0.07843138, 1, 0, 1,
-0.4564833, -0.04802205, -3.297478, 0.07450981, 1, 0, 1,
-0.4544372, 1.667447, -0.2219618, 0.06666667, 1, 0, 1,
-0.4532046, -0.9230872, -2.027479, 0.0627451, 1, 0, 1,
-0.4524269, -2.284307, -3.292957, 0.05490196, 1, 0, 1,
-0.4469638, -0.7145421, -3.901518, 0.05098039, 1, 0, 1,
-0.4447125, 0.3261011, -0.9603996, 0.04313726, 1, 0, 1,
-0.4424798, 1.050443, -0.8335577, 0.03921569, 1, 0, 1,
-0.4418453, 0.6689334, -0.7616392, 0.03137255, 1, 0, 1,
-0.4389972, 1.161895, -0.605922, 0.02745098, 1, 0, 1,
-0.4351812, -0.625325, -2.78995, 0.01960784, 1, 0, 1,
-0.43369, 0.3927166, 0.5536078, 0.01568628, 1, 0, 1,
-0.4296368, 0.4782809, -2.794567, 0.007843138, 1, 0, 1,
-0.4273476, -0.2853075, -1.672159, 0.003921569, 1, 0, 1,
-0.4229626, 0.6214256, -0.9852265, 0, 1, 0.003921569, 1,
-0.4227984, -0.3595639, -0.1848, 0, 1, 0.01176471, 1,
-0.4195839, -1.420886, -4.620711, 0, 1, 0.01568628, 1,
-0.4187903, -0.02241668, -2.937317, 0, 1, 0.02352941, 1,
-0.4100002, -0.3334342, -4.553384, 0, 1, 0.02745098, 1,
-0.4097215, -1.953435, -1.391924, 0, 1, 0.03529412, 1,
-0.397716, 0.07022122, -2.009686, 0, 1, 0.03921569, 1,
-0.3933186, 0.6673471, 1.219317, 0, 1, 0.04705882, 1,
-0.3922162, 1.027428, -0.6719151, 0, 1, 0.05098039, 1,
-0.387457, -0.8364946, -3.594244, 0, 1, 0.05882353, 1,
-0.3857883, 0.1372712, -1.452446, 0, 1, 0.0627451, 1,
-0.3834293, 0.3805643, -0.6397257, 0, 1, 0.07058824, 1,
-0.3798167, 1.22485, 0.1735781, 0, 1, 0.07450981, 1,
-0.3770514, 0.9590126, -1.378168, 0, 1, 0.08235294, 1,
-0.3721929, 1.056492, 0.005793993, 0, 1, 0.08627451, 1,
-0.3695946, -0.2021031, -2.138704, 0, 1, 0.09411765, 1,
-0.3617255, 1.290753, -0.3612315, 0, 1, 0.1019608, 1,
-0.3590224, 2.235791, -0.2642531, 0, 1, 0.1058824, 1,
-0.3579886, -0.1387867, -1.517608, 0, 1, 0.1137255, 1,
-0.356841, 0.7751928, -0.2959159, 0, 1, 0.1176471, 1,
-0.3559698, -0.2391201, -3.232153, 0, 1, 0.1254902, 1,
-0.3559319, 0.07467883, -2.817536, 0, 1, 0.1294118, 1,
-0.3555107, -0.8158719, -2.351828, 0, 1, 0.1372549, 1,
-0.3549099, 0.4683077, -0.6751869, 0, 1, 0.1411765, 1,
-0.3535694, 0.3985981, -0.04465482, 0, 1, 0.1490196, 1,
-0.350274, 0.2112088, -0.02186232, 0, 1, 0.1529412, 1,
-0.347538, 0.2711126, -0.4592779, 0, 1, 0.1607843, 1,
-0.3432406, -1.003312, -2.036616, 0, 1, 0.1647059, 1,
-0.3417126, -0.727986, -5.327893, 0, 1, 0.172549, 1,
-0.3412287, 1.166297, -2.221799, 0, 1, 0.1764706, 1,
-0.3409152, 0.8807801, 0.2944989, 0, 1, 0.1843137, 1,
-0.3390384, -0.7831091, -0.803877, 0, 1, 0.1882353, 1,
-0.3355761, 1.255497, 0.7125207, 0, 1, 0.1960784, 1,
-0.332871, 1.158723, -0.7262252, 0, 1, 0.2039216, 1,
-0.3317105, -1.954287, -3.554856, 0, 1, 0.2078431, 1,
-0.3313379, -1.053197, -3.726496, 0, 1, 0.2156863, 1,
-0.3265899, 1.600827, -0.4720463, 0, 1, 0.2196078, 1,
-0.3221002, -0.1071216, -0.8475365, 0, 1, 0.227451, 1,
-0.3165089, 0.8176827, -0.6226491, 0, 1, 0.2313726, 1,
-0.3133221, -0.05219711, -1.463037, 0, 1, 0.2392157, 1,
-0.3120821, 0.684852, 0.893988, 0, 1, 0.2431373, 1,
-0.3119363, -0.5014747, -2.856639, 0, 1, 0.2509804, 1,
-0.310284, 0.3575948, -2.095575, 0, 1, 0.254902, 1,
-0.3077668, 2.716034, -0.03379242, 0, 1, 0.2627451, 1,
-0.2961663, 0.02142227, -2.636948, 0, 1, 0.2666667, 1,
-0.2922141, -0.4230288, -2.946742, 0, 1, 0.2745098, 1,
-0.2916494, 1.869573, -1.724231, 0, 1, 0.2784314, 1,
-0.2914461, 2.364562, -0.2503354, 0, 1, 0.2862745, 1,
-0.2913672, 2.024501, -0.3738141, 0, 1, 0.2901961, 1,
-0.2905464, -1.380264, -1.982111, 0, 1, 0.2980392, 1,
-0.2895279, -0.5208713, -0.7007635, 0, 1, 0.3058824, 1,
-0.2797856, 0.3171543, -0.3425231, 0, 1, 0.3098039, 1,
-0.2784435, -0.8836505, -4.666949, 0, 1, 0.3176471, 1,
-0.2766199, 0.1864265, -1.227272, 0, 1, 0.3215686, 1,
-0.2756166, -0.1882632, -2.512995, 0, 1, 0.3294118, 1,
-0.2751629, 0.7403437, -1.027979, 0, 1, 0.3333333, 1,
-0.2740614, 0.5757671, -0.1116902, 0, 1, 0.3411765, 1,
-0.2704568, 0.5569634, 0.2697954, 0, 1, 0.345098, 1,
-0.2681393, -0.7022193, -4.518288, 0, 1, 0.3529412, 1,
-0.2654115, 0.9333676, -0.3603753, 0, 1, 0.3568628, 1,
-0.2652477, 0.4844637, -0.8229239, 0, 1, 0.3647059, 1,
-0.2648917, 0.9178356, 0.9030576, 0, 1, 0.3686275, 1,
-0.2642166, 0.7532622, -0.2427026, 0, 1, 0.3764706, 1,
-0.2610861, 0.9690045, 0.5005667, 0, 1, 0.3803922, 1,
-0.2575902, 0.4798659, 0.02441226, 0, 1, 0.3882353, 1,
-0.2563769, -0.5987255, -3.421607, 0, 1, 0.3921569, 1,
-0.2526639, -0.8459883, -1.221036, 0, 1, 0.4, 1,
-0.2509567, 1.093192, -1.474517, 0, 1, 0.4078431, 1,
-0.2478536, 2.105346, -1.033403, 0, 1, 0.4117647, 1,
-0.245337, 0.4480454, -0.001341977, 0, 1, 0.4196078, 1,
-0.2438437, 0.6648911, -0.2777268, 0, 1, 0.4235294, 1,
-0.2434694, 0.9046211, -0.7897617, 0, 1, 0.4313726, 1,
-0.2409622, 0.1816183, -2.005688, 0, 1, 0.4352941, 1,
-0.2409369, 0.3756098, 0.8237932, 0, 1, 0.4431373, 1,
-0.2388579, -1.296764, -3.413449, 0, 1, 0.4470588, 1,
-0.2350695, 0.9455889, 0.2964707, 0, 1, 0.454902, 1,
-0.2331636, 0.5771248, -0.5106274, 0, 1, 0.4588235, 1,
-0.2301414, 0.05959868, -2.435173, 0, 1, 0.4666667, 1,
-0.2294482, -1.552343, -4.008058, 0, 1, 0.4705882, 1,
-0.2215096, 0.2223363, -0.2502862, 0, 1, 0.4784314, 1,
-0.2204892, 1.134388, -0.8314444, 0, 1, 0.4823529, 1,
-0.2184255, 1.300129, 0.681419, 0, 1, 0.4901961, 1,
-0.213161, 1.929889, 0.3227222, 0, 1, 0.4941176, 1,
-0.2094437, 1.421902, -2.550155, 0, 1, 0.5019608, 1,
-0.2085677, 0.3068651, -2.564688, 0, 1, 0.509804, 1,
-0.2040592, -0.05947761, -1.579695, 0, 1, 0.5137255, 1,
-0.1957041, -1.205877, -3.460824, 0, 1, 0.5215687, 1,
-0.19421, -1.48145, -2.68156, 0, 1, 0.5254902, 1,
-0.1921952, 0.00143319, -2.236852, 0, 1, 0.5333334, 1,
-0.1918474, 1.508307, -0.9294521, 0, 1, 0.5372549, 1,
-0.1912627, 1.015791, 1.352035, 0, 1, 0.5450981, 1,
-0.1908469, 0.9903865, -0.1340355, 0, 1, 0.5490196, 1,
-0.1881547, -1.085731, -2.888053, 0, 1, 0.5568628, 1,
-0.1871142, 0.5046756, -0.3239278, 0, 1, 0.5607843, 1,
-0.1859649, 0.3970763, 1.865109, 0, 1, 0.5686275, 1,
-0.1843599, -0.9361782, -3.500292, 0, 1, 0.572549, 1,
-0.1839155, 1.599138, -1.256111, 0, 1, 0.5803922, 1,
-0.1833172, -0.1485784, -3.924721, 0, 1, 0.5843138, 1,
-0.1801698, 0.8838127, 0.6093462, 0, 1, 0.5921569, 1,
-0.1762605, 0.1021049, -1.699366, 0, 1, 0.5960785, 1,
-0.1744878, -0.7049753, -1.935638, 0, 1, 0.6039216, 1,
-0.1708723, -0.1019326, -3.444926, 0, 1, 0.6117647, 1,
-0.1692391, -0.3060894, -1.075763, 0, 1, 0.6156863, 1,
-0.164249, 1.014723, -0.6719362, 0, 1, 0.6235294, 1,
-0.1629974, 0.08327723, -3.709772, 0, 1, 0.627451, 1,
-0.158616, -0.636769, -3.321667, 0, 1, 0.6352941, 1,
-0.1516678, -0.722865, -1.960098, 0, 1, 0.6392157, 1,
-0.1442527, 0.8810881, -0.1774159, 0, 1, 0.6470588, 1,
-0.1430094, -0.4722395, -2.306346, 0, 1, 0.6509804, 1,
-0.1426912, -0.9977962, -2.766505, 0, 1, 0.6588235, 1,
-0.139568, 0.1024967, -3.346368, 0, 1, 0.6627451, 1,
-0.1383556, -1.844684, -3.162519, 0, 1, 0.6705883, 1,
-0.1381973, -0.1031919, -1.717555, 0, 1, 0.6745098, 1,
-0.1375448, -1.660785, -3.250075, 0, 1, 0.682353, 1,
-0.1356564, -0.3943752, -0.1337503, 0, 1, 0.6862745, 1,
-0.1337297, -0.0663517, -0.9999769, 0, 1, 0.6941177, 1,
-0.1336829, 0.1384698, -1.713275, 0, 1, 0.7019608, 1,
-0.1297016, 0.6884378, -0.6077718, 0, 1, 0.7058824, 1,
-0.1293413, -2.112515, -2.088992, 0, 1, 0.7137255, 1,
-0.1285805, 0.6979567, 1.266523, 0, 1, 0.7176471, 1,
-0.124792, -1.871332, -2.769642, 0, 1, 0.7254902, 1,
-0.1202579, -0.3304702, -2.72286, 0, 1, 0.7294118, 1,
-0.1154288, 0.5380132, 0.5724012, 0, 1, 0.7372549, 1,
-0.1121207, -0.5830081, -2.386936, 0, 1, 0.7411765, 1,
-0.1118593, 1.530553, -1.128852, 0, 1, 0.7490196, 1,
-0.1111125, 0.3850008, -0.2153409, 0, 1, 0.7529412, 1,
-0.1104586, 0.4885626, -0.2398032, 0, 1, 0.7607843, 1,
-0.1096801, -1.440933, -2.984114, 0, 1, 0.7647059, 1,
-0.1076152, 1.442398, -1.083064, 0, 1, 0.772549, 1,
-0.1062627, 1.404804, 0.5331351, 0, 1, 0.7764706, 1,
-0.1046774, 0.7968178, 0.423802, 0, 1, 0.7843137, 1,
-0.1016988, 0.03828957, -1.90726, 0, 1, 0.7882353, 1,
-0.1009926, 1.736911, -0.8766562, 0, 1, 0.7960784, 1,
-0.09441242, -0.2844424, -0.7413378, 0, 1, 0.8039216, 1,
-0.09350293, 0.4537899, 0.1684745, 0, 1, 0.8078431, 1,
-0.09130719, 0.2760547, -0.2763612, 0, 1, 0.8156863, 1,
-0.09044273, -0.1545378, -2.314716, 0, 1, 0.8196079, 1,
-0.08904608, 0.02267762, -0.03205384, 0, 1, 0.827451, 1,
-0.08791505, -0.4331037, -2.301349, 0, 1, 0.8313726, 1,
-0.08731592, 0.6816766, 0.2894153, 0, 1, 0.8392157, 1,
-0.08055586, -0.4673505, -2.546518, 0, 1, 0.8431373, 1,
-0.07889058, -0.5849808, -4.370625, 0, 1, 0.8509804, 1,
-0.07625029, -0.3614781, -4.7723, 0, 1, 0.854902, 1,
-0.0759398, -0.4845644, -1.648764, 0, 1, 0.8627451, 1,
-0.07538348, 0.3819117, 1.532659, 0, 1, 0.8666667, 1,
-0.07368185, 1.130558, 0.7860437, 0, 1, 0.8745098, 1,
-0.06786647, 0.05658485, 0.311561, 0, 1, 0.8784314, 1,
-0.06068946, -0.4139157, -4.366428, 0, 1, 0.8862745, 1,
-0.05818209, 0.7689889, -0.4430414, 0, 1, 0.8901961, 1,
-0.05806679, -0.3042415, -3.870534, 0, 1, 0.8980392, 1,
-0.04316418, 0.7680354, -0.5379443, 0, 1, 0.9058824, 1,
-0.04268885, 0.2156127, 0.2644216, 0, 1, 0.9098039, 1,
-0.03978194, -0.5801971, -2.691425, 0, 1, 0.9176471, 1,
-0.03504082, -1.112583, -3.268317, 0, 1, 0.9215686, 1,
-0.03414725, -0.3517756, -4.50703, 0, 1, 0.9294118, 1,
-0.0327647, 0.1627323, -0.07644214, 0, 1, 0.9333333, 1,
-0.0311826, 1.661152, -0.4114689, 0, 1, 0.9411765, 1,
-0.03044194, 2.527601, -0.7240571, 0, 1, 0.945098, 1,
-0.02953113, -0.1468769, -4.711104, 0, 1, 0.9529412, 1,
-0.02858633, 2.256466, -0.2689319, 0, 1, 0.9568627, 1,
-0.02318015, -0.4625042, -3.357552, 0, 1, 0.9647059, 1,
-0.02057269, 0.5074681, -0.3386484, 0, 1, 0.9686275, 1,
-0.01869833, 1.71708, -0.8479551, 0, 1, 0.9764706, 1,
-0.01773114, 1.329559, -1.361729, 0, 1, 0.9803922, 1,
-0.01706668, 1.011222, -0.1960459, 0, 1, 0.9882353, 1,
-0.01603222, 1.870314, 0.648747, 0, 1, 0.9921569, 1,
-0.01578048, 0.5508976, 1.23677, 0, 1, 1, 1,
-0.01443121, -1.510952, -3.495921, 0, 0.9921569, 1, 1,
-0.01274714, -0.3004537, -1.738275, 0, 0.9882353, 1, 1,
-0.01033938, -0.5313591, -2.171121, 0, 0.9803922, 1, 1,
-0.01007144, -0.1310063, -4.357985, 0, 0.9764706, 1, 1,
-0.006026974, 0.4205821, 1.575742, 0, 0.9686275, 1, 1,
-0.00545906, 0.007857878, -0.9521049, 0, 0.9647059, 1, 1,
-0.0009691241, 1.378019, 1.088702, 0, 0.9568627, 1, 1,
0.0008713112, -0.5185622, 4.453027, 0, 0.9529412, 1, 1,
0.001003374, 0.2872925, -0.9665512, 0, 0.945098, 1, 1,
0.001301912, -0.8187978, 3.203347, 0, 0.9411765, 1, 1,
0.002678903, 0.1513361, 0.5772878, 0, 0.9333333, 1, 1,
0.003361246, 2.114277, 0.4306936, 0, 0.9294118, 1, 1,
0.009031399, 0.8702123, 0.7474467, 0, 0.9215686, 1, 1,
0.01021738, 0.1602527, -0.05604554, 0, 0.9176471, 1, 1,
0.01394537, 1.534584, -0.5984253, 0, 0.9098039, 1, 1,
0.01612527, -0.6210386, 1.520563, 0, 0.9058824, 1, 1,
0.01753515, -0.6880629, 2.555275, 0, 0.8980392, 1, 1,
0.01971848, 1.198948, -0.9303748, 0, 0.8901961, 1, 1,
0.02042866, -0.04030333, 3.148984, 0, 0.8862745, 1, 1,
0.0207354, -1.656653, 1.580521, 0, 0.8784314, 1, 1,
0.022833, 0.3831457, -0.5913754, 0, 0.8745098, 1, 1,
0.0263287, -0.9971506, 0.2496835, 0, 0.8666667, 1, 1,
0.02759723, -0.9026957, 3.539092, 0, 0.8627451, 1, 1,
0.03000946, -0.3194254, 2.609239, 0, 0.854902, 1, 1,
0.03015429, -1.004257, 1.961379, 0, 0.8509804, 1, 1,
0.03457278, 0.7914342, 0.1050719, 0, 0.8431373, 1, 1,
0.03780375, 0.4532073, -1.859139, 0, 0.8392157, 1, 1,
0.04259182, 0.1780397, -1.4565, 0, 0.8313726, 1, 1,
0.04367547, 1.635957, -0.7733974, 0, 0.827451, 1, 1,
0.04453285, -1.713332, 3.986734, 0, 0.8196079, 1, 1,
0.04596986, 0.5952959, 0.702759, 0, 0.8156863, 1, 1,
0.04628868, 1.126008, 0.1889101, 0, 0.8078431, 1, 1,
0.04788256, 0.6061705, 1.033842, 0, 0.8039216, 1, 1,
0.05291844, -1.72703, 3.833479, 0, 0.7960784, 1, 1,
0.05342367, -0.5906889, 3.230435, 0, 0.7882353, 1, 1,
0.05354563, 1.234716, 0.3879361, 0, 0.7843137, 1, 1,
0.05724028, 0.7841753, -0.06199844, 0, 0.7764706, 1, 1,
0.05842576, -0.1292126, 4.19236, 0, 0.772549, 1, 1,
0.06257915, 0.8722776, 1.274777, 0, 0.7647059, 1, 1,
0.06297397, 0.5191528, -0.6695592, 0, 0.7607843, 1, 1,
0.06653593, 1.064599, -0.3901087, 0, 0.7529412, 1, 1,
0.07185031, 1.097196, 1.166381, 0, 0.7490196, 1, 1,
0.07253839, 0.9653783, 0.5873477, 0, 0.7411765, 1, 1,
0.07329313, -1.048908, 2.788194, 0, 0.7372549, 1, 1,
0.07741555, -0.2106748, 2.613161, 0, 0.7294118, 1, 1,
0.07786308, 0.1391601, 0.3917936, 0, 0.7254902, 1, 1,
0.08012757, -0.1459693, 4.656875, 0, 0.7176471, 1, 1,
0.08300366, -2.334717, 1.054756, 0, 0.7137255, 1, 1,
0.09172533, -2.076633, 1.452545, 0, 0.7058824, 1, 1,
0.09606504, -0.5436112, 1.48088, 0, 0.6980392, 1, 1,
0.09877718, 0.925162, 0.5973091, 0, 0.6941177, 1, 1,
0.1012061, 2.547818, 1.079008, 0, 0.6862745, 1, 1,
0.102266, -0.5064894, 2.751313, 0, 0.682353, 1, 1,
0.1056637, -0.2070284, 1.7765, 0, 0.6745098, 1, 1,
0.107802, -0.4880544, 3.142164, 0, 0.6705883, 1, 1,
0.1099215, -0.4363935, 2.203455, 0, 0.6627451, 1, 1,
0.1157262, -1.70508, 2.17407, 0, 0.6588235, 1, 1,
0.1165809, -0.8839019, 4.185672, 0, 0.6509804, 1, 1,
0.1170195, -0.6381317, 2.277224, 0, 0.6470588, 1, 1,
0.1179893, 0.8444979, 0.1759988, 0, 0.6392157, 1, 1,
0.1248543, -0.1859915, 2.394071, 0, 0.6352941, 1, 1,
0.1325752, -0.6714906, 3.079237, 0, 0.627451, 1, 1,
0.1329095, -0.5680678, 1.716755, 0, 0.6235294, 1, 1,
0.1350935, 0.4235357, -1.497283, 0, 0.6156863, 1, 1,
0.1353681, -1.063153, 3.067218, 0, 0.6117647, 1, 1,
0.1369645, 0.808635, -0.02325159, 0, 0.6039216, 1, 1,
0.1402291, 0.6786579, 0.2838823, 0, 0.5960785, 1, 1,
0.1431341, 0.1135689, 0.9998585, 0, 0.5921569, 1, 1,
0.1460664, 0.5792498, -0.9936154, 0, 0.5843138, 1, 1,
0.1512028, 1.424589, -0.3708378, 0, 0.5803922, 1, 1,
0.1545266, -0.5651063, 3.140835, 0, 0.572549, 1, 1,
0.1573801, 1.189302, 0.06758148, 0, 0.5686275, 1, 1,
0.1575993, 0.1669828, 1.849568, 0, 0.5607843, 1, 1,
0.1576475, 0.5147058, -1.210233, 0, 0.5568628, 1, 1,
0.1609917, -0.7037464, 2.123352, 0, 0.5490196, 1, 1,
0.1611591, 0.6672311, -0.7115711, 0, 0.5450981, 1, 1,
0.1613099, -0.9854923, 2.657466, 0, 0.5372549, 1, 1,
0.1623252, -0.5909264, 2.523399, 0, 0.5333334, 1, 1,
0.1644296, -1.734396, 2.072978, 0, 0.5254902, 1, 1,
0.166778, 0.3644572, 1.408246, 0, 0.5215687, 1, 1,
0.172529, 0.6122699, -0.5635089, 0, 0.5137255, 1, 1,
0.1731995, 1.340374, 0.01581661, 0, 0.509804, 1, 1,
0.1740819, 0.2971626, 0.9778159, 0, 0.5019608, 1, 1,
0.17431, 0.9025006, -1.478465, 0, 0.4941176, 1, 1,
0.1800994, -1.61777, 2.107542, 0, 0.4901961, 1, 1,
0.1816533, 0.1853301, 0.9716226, 0, 0.4823529, 1, 1,
0.1828128, -0.4473324, 4.626617, 0, 0.4784314, 1, 1,
0.1849958, 0.5604241, -0.2275527, 0, 0.4705882, 1, 1,
0.1887863, 1.441263, 0.01769997, 0, 0.4666667, 1, 1,
0.1926135, -0.8298149, 3.315495, 0, 0.4588235, 1, 1,
0.1929289, 0.843321, -0.429434, 0, 0.454902, 1, 1,
0.2024355, -1.455464, 2.405451, 0, 0.4470588, 1, 1,
0.203083, -0.729278, 4.196712, 0, 0.4431373, 1, 1,
0.2081415, -0.127999, 1.018745, 0, 0.4352941, 1, 1,
0.2087354, -0.5543489, 4.026098, 0, 0.4313726, 1, 1,
0.2089542, -0.0127747, 1.259071, 0, 0.4235294, 1, 1,
0.2103736, 0.6566851, -1.256493, 0, 0.4196078, 1, 1,
0.2106517, -0.06037249, 0.8555793, 0, 0.4117647, 1, 1,
0.2122054, 0.1677849, 1.15971, 0, 0.4078431, 1, 1,
0.212405, 0.8680238, 0.06910104, 0, 0.4, 1, 1,
0.2129257, 1.014446, -0.5735899, 0, 0.3921569, 1, 1,
0.2157196, -1.386462, 2.075794, 0, 0.3882353, 1, 1,
0.2162168, -0.4280168, 3.892836, 0, 0.3803922, 1, 1,
0.2175235, 0.8828013, -1.811844, 0, 0.3764706, 1, 1,
0.2206589, -0.2389563, 3.725039, 0, 0.3686275, 1, 1,
0.2218534, 0.3820369, -0.5187312, 0, 0.3647059, 1, 1,
0.2256283, 0.3231858, 0.4781345, 0, 0.3568628, 1, 1,
0.230594, 0.8621907, -0.3647155, 0, 0.3529412, 1, 1,
0.2319418, -0.5286468, 3.511473, 0, 0.345098, 1, 1,
0.234806, 0.8034511, -0.03676762, 0, 0.3411765, 1, 1,
0.2388743, -0.4146066, 2.171669, 0, 0.3333333, 1, 1,
0.2394576, 1.501485, 0.8572441, 0, 0.3294118, 1, 1,
0.2489579, -0.02234339, 0.450099, 0, 0.3215686, 1, 1,
0.2514513, -2.482904, 2.613693, 0, 0.3176471, 1, 1,
0.2556123, -0.6469192, 1.667778, 0, 0.3098039, 1, 1,
0.2587586, 0.2981699, 1.876402, 0, 0.3058824, 1, 1,
0.2639832, -1.045722, 4.801012, 0, 0.2980392, 1, 1,
0.2641274, 0.5972079, 1.107767, 0, 0.2901961, 1, 1,
0.2681473, 0.4201565, 1.067183, 0, 0.2862745, 1, 1,
0.2721816, 0.03818664, 1.30402, 0, 0.2784314, 1, 1,
0.2726377, -0.2759182, 1.673708, 0, 0.2745098, 1, 1,
0.2781252, 0.5186769, 0.1702979, 0, 0.2666667, 1, 1,
0.2806906, -1.054356, 3.200549, 0, 0.2627451, 1, 1,
0.2820234, 0.8054534, 1.524001, 0, 0.254902, 1, 1,
0.283007, -0.389996, 3.511237, 0, 0.2509804, 1, 1,
0.2836254, 0.3822403, 1.287636, 0, 0.2431373, 1, 1,
0.2849158, -0.7094067, 1.516845, 0, 0.2392157, 1, 1,
0.2886592, -1.043502, 1.013725, 0, 0.2313726, 1, 1,
0.2892767, -0.5033472, 2.941572, 0, 0.227451, 1, 1,
0.2901153, -0.529841, 4.091313, 0, 0.2196078, 1, 1,
0.2913344, 1.217915, 1.592998, 0, 0.2156863, 1, 1,
0.2935655, -0.8207652, 0.8794609, 0, 0.2078431, 1, 1,
0.2943955, -1.656535, 3.851739, 0, 0.2039216, 1, 1,
0.2952986, -0.3689139, 2.580589, 0, 0.1960784, 1, 1,
0.2968213, 1.307337, 2.061935, 0, 0.1882353, 1, 1,
0.3052427, 0.03372203, 1.228509, 0, 0.1843137, 1, 1,
0.3054834, 1.530221, 0.218264, 0, 0.1764706, 1, 1,
0.3081094, -0.4123837, 3.914964, 0, 0.172549, 1, 1,
0.3094722, 0.5226219, 0.2274008, 0, 0.1647059, 1, 1,
0.3120863, 0.97966, 0.2450232, 0, 0.1607843, 1, 1,
0.3149789, -0.507935, 2.425087, 0, 0.1529412, 1, 1,
0.3160304, -1.081447, 1.633253, 0, 0.1490196, 1, 1,
0.3181719, 0.7065134, 1.003107, 0, 0.1411765, 1, 1,
0.3200983, -0.6644962, 2.26634, 0, 0.1372549, 1, 1,
0.3217695, 0.06540099, 3.740613, 0, 0.1294118, 1, 1,
0.3230818, -2.393905, 2.221725, 0, 0.1254902, 1, 1,
0.3233339, 0.6478912, 2.067025, 0, 0.1176471, 1, 1,
0.3257656, 1.276812, 1.724538, 0, 0.1137255, 1, 1,
0.3278082, -0.5755529, 3.878449, 0, 0.1058824, 1, 1,
0.3304281, -0.8968595, 3.054839, 0, 0.09803922, 1, 1,
0.3305242, 0.37607, -1.174856, 0, 0.09411765, 1, 1,
0.3325644, 0.2760099, 1.943139, 0, 0.08627451, 1, 1,
0.3326365, -0.04147319, 2.937596, 0, 0.08235294, 1, 1,
0.3333878, 1.0251, -0.8087099, 0, 0.07450981, 1, 1,
0.334824, -1.953428, 2.394439, 0, 0.07058824, 1, 1,
0.3361075, 1.279977, 0.4561981, 0, 0.0627451, 1, 1,
0.3427714, 0.4027216, 1.749009, 0, 0.05882353, 1, 1,
0.3462345, -1.345462, 1.077622, 0, 0.05098039, 1, 1,
0.3527051, -1.7228, 3.161359, 0, 0.04705882, 1, 1,
0.3578886, -0.9708688, 3.332566, 0, 0.03921569, 1, 1,
0.3615635, -1.022081, 2.156473, 0, 0.03529412, 1, 1,
0.3631998, -0.7771732, 1.470429, 0, 0.02745098, 1, 1,
0.3679393, 0.2680031, -0.8621308, 0, 0.02352941, 1, 1,
0.3690234, -0.6659015, 3.985878, 0, 0.01568628, 1, 1,
0.3694801, 0.8347768, -1.455232, 0, 0.01176471, 1, 1,
0.3740197, -2.285886, 3.605235, 0, 0.003921569, 1, 1,
0.3777164, -0.3841311, 1.083729, 0.003921569, 0, 1, 1,
0.3821517, 0.6892097, 1.040481, 0.007843138, 0, 1, 1,
0.3865401, -1.261975, 4.446298, 0.01568628, 0, 1, 1,
0.3892352, -0.816241, 3.379331, 0.01960784, 0, 1, 1,
0.3927753, 0.0850974, -0.3299673, 0.02745098, 0, 1, 1,
0.3959428, -0.3065497, 0.9496625, 0.03137255, 0, 1, 1,
0.3982402, -1.479489, 2.546804, 0.03921569, 0, 1, 1,
0.398467, -1.662201, 2.29802, 0.04313726, 0, 1, 1,
0.4028759, -1.095129, 2.904924, 0.05098039, 0, 1, 1,
0.4044956, -0.8305577, 3.071671, 0.05490196, 0, 1, 1,
0.4078695, -0.2734492, 1.076221, 0.0627451, 0, 1, 1,
0.4079807, -1.564947, 3.486259, 0.06666667, 0, 1, 1,
0.421353, 0.3617243, -0.5006995, 0.07450981, 0, 1, 1,
0.4272545, 1.037048, -2.062715, 0.07843138, 0, 1, 1,
0.4371, -0.09006279, 1.259773, 0.08627451, 0, 1, 1,
0.4380952, -1.149257, 1.304076, 0.09019608, 0, 1, 1,
0.4391093, 0.1905043, 0.2467526, 0.09803922, 0, 1, 1,
0.4408861, 1.794766, 2.754309, 0.1058824, 0, 1, 1,
0.440964, 0.5825993, -0.2251233, 0.1098039, 0, 1, 1,
0.4409775, -0.3451159, 2.510046, 0.1176471, 0, 1, 1,
0.4416515, -0.1373059, 2.972864, 0.1215686, 0, 1, 1,
0.4421504, -0.2971189, 1.238525, 0.1294118, 0, 1, 1,
0.4422557, 1.490474, 0.6985149, 0.1333333, 0, 1, 1,
0.4425426, 0.7218301, 0.6081487, 0.1411765, 0, 1, 1,
0.444856, 0.1859625, 2.550468, 0.145098, 0, 1, 1,
0.4491928, -0.1921904, 1.310622, 0.1529412, 0, 1, 1,
0.4556436, -0.3442267, 1.968742, 0.1568628, 0, 1, 1,
0.4589639, -1.187481, 3.27293, 0.1647059, 0, 1, 1,
0.4597885, -1.55287, 1.70452, 0.1686275, 0, 1, 1,
0.4603044, -0.6803777, 2.678777, 0.1764706, 0, 1, 1,
0.4626783, 0.1878915, 2.384535, 0.1803922, 0, 1, 1,
0.4719591, 0.1077393, 0.9831228, 0.1882353, 0, 1, 1,
0.473159, -0.1920743, -0.04429104, 0.1921569, 0, 1, 1,
0.4789479, -1.142647, 4.201549, 0.2, 0, 1, 1,
0.4790846, 1.0139, 0.0238842, 0.2078431, 0, 1, 1,
0.4791901, -1.238449, 1.843226, 0.2117647, 0, 1, 1,
0.4824619, -0.6414135, 1.706134, 0.2196078, 0, 1, 1,
0.4841638, -0.1226083, 3.186071, 0.2235294, 0, 1, 1,
0.4864683, 0.7643942, 0.9303465, 0.2313726, 0, 1, 1,
0.4877089, 0.1676801, 0.607173, 0.2352941, 0, 1, 1,
0.4894126, -0.8434991, 3.921413, 0.2431373, 0, 1, 1,
0.4925588, -1.482585, 1.105185, 0.2470588, 0, 1, 1,
0.4938017, 1.15263, 1.338111, 0.254902, 0, 1, 1,
0.4950361, 2.514013, 1.183174, 0.2588235, 0, 1, 1,
0.5003418, -0.249253, 2.738099, 0.2666667, 0, 1, 1,
0.5084122, 1.314008, 0.4754461, 0.2705882, 0, 1, 1,
0.5091692, -0.004260736, 1.832113, 0.2784314, 0, 1, 1,
0.5095177, -1.137076, 2.842927, 0.282353, 0, 1, 1,
0.5165991, 0.4813169, 0.1082088, 0.2901961, 0, 1, 1,
0.524047, 0.6565802, 0.6416908, 0.2941177, 0, 1, 1,
0.5246819, 0.9410337, 1.03077, 0.3019608, 0, 1, 1,
0.5271317, -0.2072362, 3.469502, 0.3098039, 0, 1, 1,
0.5283947, 1.336758, -0.6730285, 0.3137255, 0, 1, 1,
0.5312719, -0.5348423, 2.509331, 0.3215686, 0, 1, 1,
0.5336044, -0.5206295, 2.404728, 0.3254902, 0, 1, 1,
0.5352548, 0.5345958, 1.19183, 0.3333333, 0, 1, 1,
0.5393965, -1.80649, 2.274655, 0.3372549, 0, 1, 1,
0.5464622, -0.9068847, 3.511628, 0.345098, 0, 1, 1,
0.5470748, 1.59708, 0.4822168, 0.3490196, 0, 1, 1,
0.5519239, 0.4478802, 2.197717, 0.3568628, 0, 1, 1,
0.5532011, 0.8084088, 2.03508, 0.3607843, 0, 1, 1,
0.5594857, -0.1982455, 2.32623, 0.3686275, 0, 1, 1,
0.5674659, 0.0762584, 1.71096, 0.372549, 0, 1, 1,
0.5716774, 0.1584522, 0.8455188, 0.3803922, 0, 1, 1,
0.5739543, -1.83497, 2.827274, 0.3843137, 0, 1, 1,
0.5823511, -0.8126637, 3.067586, 0.3921569, 0, 1, 1,
0.5870823, 0.09295956, 0.3708433, 0.3960784, 0, 1, 1,
0.5883989, -0.4440884, 2.519097, 0.4039216, 0, 1, 1,
0.5893989, -0.009809699, 2.1313, 0.4117647, 0, 1, 1,
0.5899554, 1.321192, 0.6227441, 0.4156863, 0, 1, 1,
0.5937756, -0.5200691, 0.6842034, 0.4235294, 0, 1, 1,
0.5996312, -0.1668963, 2.031169, 0.427451, 0, 1, 1,
0.6050301, 0.1707395, 1.914288, 0.4352941, 0, 1, 1,
0.6052904, -0.1761367, 3.422113, 0.4392157, 0, 1, 1,
0.6069598, 0.5827254, 1.205314, 0.4470588, 0, 1, 1,
0.6075865, 1.009397, 0.8861769, 0.4509804, 0, 1, 1,
0.6080949, 0.3232907, 1.401555, 0.4588235, 0, 1, 1,
0.6120849, 0.7742019, -0.339567, 0.4627451, 0, 1, 1,
0.6193445, 1.254785, 2.801555, 0.4705882, 0, 1, 1,
0.6207471, -1.496124, 1.971994, 0.4745098, 0, 1, 1,
0.6301443, -0.4981966, 2.126565, 0.4823529, 0, 1, 1,
0.6309105, 0.7269685, 1.611727, 0.4862745, 0, 1, 1,
0.6341897, 1.784008, -0.7703548, 0.4941176, 0, 1, 1,
0.6376647, -0.2840084, 1.288428, 0.5019608, 0, 1, 1,
0.6438607, -0.6923499, 1.287135, 0.5058824, 0, 1, 1,
0.6458344, 0.1846894, -0.6460102, 0.5137255, 0, 1, 1,
0.6489286, 0.7120724, -0.5655429, 0.5176471, 0, 1, 1,
0.6507595, 0.3668724, 0.407826, 0.5254902, 0, 1, 1,
0.6515058, 1.123584, 0.659964, 0.5294118, 0, 1, 1,
0.6535055, 0.01349132, 2.613065, 0.5372549, 0, 1, 1,
0.6581233, 0.2096398, 0.6806049, 0.5411765, 0, 1, 1,
0.6637306, 0.1554419, 1.640253, 0.5490196, 0, 1, 1,
0.6652644, -0.004534707, 1.691377, 0.5529412, 0, 1, 1,
0.6702326, 0.6399742, 1.018941, 0.5607843, 0, 1, 1,
0.6776971, -0.3011709, 0.005425477, 0.5647059, 0, 1, 1,
0.6830856, 0.9775845, 1.022544, 0.572549, 0, 1, 1,
0.6879113, 0.9318715, 0.05308051, 0.5764706, 0, 1, 1,
0.6906222, 0.8499771, -0.1608055, 0.5843138, 0, 1, 1,
0.6933653, -0.8142795, 3.627256, 0.5882353, 0, 1, 1,
0.6945371, 0.494035, 1.165027, 0.5960785, 0, 1, 1,
0.6973593, 0.8403333, 0.4030077, 0.6039216, 0, 1, 1,
0.6996714, 1.083989, 1.297837, 0.6078432, 0, 1, 1,
0.7056963, 1.816128, -1.03229, 0.6156863, 0, 1, 1,
0.7079375, -2.142131, 0.9643228, 0.6196079, 0, 1, 1,
0.7084506, 0.71876, 1.152628, 0.627451, 0, 1, 1,
0.709877, 0.7581128, 0.3223868, 0.6313726, 0, 1, 1,
0.7098896, 1.401147, -0.02876868, 0.6392157, 0, 1, 1,
0.7177183, 1.366645, 0.6806847, 0.6431373, 0, 1, 1,
0.7181072, 1.012631, 2.472743, 0.6509804, 0, 1, 1,
0.719614, 0.9270741, 1.391357, 0.654902, 0, 1, 1,
0.7255642, 0.2210299, 2.683477, 0.6627451, 0, 1, 1,
0.7284079, -1.451652, 3.182209, 0.6666667, 0, 1, 1,
0.7303591, -1.248103, 2.691693, 0.6745098, 0, 1, 1,
0.7313119, 0.6400793, 1.527179, 0.6784314, 0, 1, 1,
0.7333615, -0.9556741, 2.342151, 0.6862745, 0, 1, 1,
0.7338845, -1.286149, 2.976386, 0.6901961, 0, 1, 1,
0.7346815, 0.7402424, -0.8434641, 0.6980392, 0, 1, 1,
0.7355798, 2.094033, -0.1679835, 0.7058824, 0, 1, 1,
0.7391103, 1.293922, -0.5702503, 0.7098039, 0, 1, 1,
0.7392598, -0.1714856, 1.292677, 0.7176471, 0, 1, 1,
0.7444122, -1.257803, 0.856414, 0.7215686, 0, 1, 1,
0.7514656, 0.842991, 1.617388, 0.7294118, 0, 1, 1,
0.75471, -1.083358, 1.195018, 0.7333333, 0, 1, 1,
0.7661815, -0.1650244, 3.690317, 0.7411765, 0, 1, 1,
0.7713068, 0.2829241, 2.679131, 0.7450981, 0, 1, 1,
0.7725319, 0.0001102119, 3.196658, 0.7529412, 0, 1, 1,
0.7827805, 1.106342, 1.368281, 0.7568628, 0, 1, 1,
0.7845632, -0.4744697, 1.085108, 0.7647059, 0, 1, 1,
0.7858909, -0.4017065, 1.422213, 0.7686275, 0, 1, 1,
0.788893, 0.9527961, 1.129045, 0.7764706, 0, 1, 1,
0.7897661, 0.4417449, 2.182275, 0.7803922, 0, 1, 1,
0.7903875, 0.4294712, 0.6257739, 0.7882353, 0, 1, 1,
0.7913288, -1.32555, 1.090563, 0.7921569, 0, 1, 1,
0.7973933, 1.081578, 1.664939, 0.8, 0, 1, 1,
0.7980392, -0.3203704, 4.056619, 0.8078431, 0, 1, 1,
0.8003537, -0.05270685, 3.088932, 0.8117647, 0, 1, 1,
0.8012671, -1.170143, 0.7321087, 0.8196079, 0, 1, 1,
0.8033164, 1.248861, 0.003035868, 0.8235294, 0, 1, 1,
0.8041904, -0.7912347, 2.195166, 0.8313726, 0, 1, 1,
0.8091035, 0.4206748, -0.8289734, 0.8352941, 0, 1, 1,
0.8152821, 3.058273, -0.5267323, 0.8431373, 0, 1, 1,
0.8248653, 0.117704, 0.3927056, 0.8470588, 0, 1, 1,
0.8258535, -0.941604, 3.505993, 0.854902, 0, 1, 1,
0.8309191, 0.2519423, 1.57075, 0.8588235, 0, 1, 1,
0.8343915, 0.9900588, -0.09786232, 0.8666667, 0, 1, 1,
0.8345149, -0.6649695, 1.134637, 0.8705882, 0, 1, 1,
0.8428275, -0.3006796, 1.325959, 0.8784314, 0, 1, 1,
0.8444458, -0.6058838, 1.898722, 0.8823529, 0, 1, 1,
0.8456919, 0.8978582, 1.135452, 0.8901961, 0, 1, 1,
0.8499631, 0.2258709, 2.918594, 0.8941177, 0, 1, 1,
0.8501174, -0.02051505, 1.699212, 0.9019608, 0, 1, 1,
0.8514885, -0.08006247, 1.550439, 0.9098039, 0, 1, 1,
0.8550746, 1.322848, 0.6958663, 0.9137255, 0, 1, 1,
0.8579929, -0.3446482, 1.726748, 0.9215686, 0, 1, 1,
0.8655452, 1.124499, -0.1995248, 0.9254902, 0, 1, 1,
0.8666226, -1.748337, 3.546949, 0.9333333, 0, 1, 1,
0.8676294, -0.4515327, 3.399741, 0.9372549, 0, 1, 1,
0.8707529, -0.9893143, 2.866845, 0.945098, 0, 1, 1,
0.8797482, -0.7442047, 4.840845, 0.9490196, 0, 1, 1,
0.8866975, -0.168574, 0.2682283, 0.9568627, 0, 1, 1,
0.8876485, 0.9973267, -0.1951198, 0.9607843, 0, 1, 1,
0.8884597, -0.5536826, 2.763138, 0.9686275, 0, 1, 1,
0.8919326, -0.2786675, 3.222118, 0.972549, 0, 1, 1,
0.8939331, 1.243524, 0.1965652, 0.9803922, 0, 1, 1,
0.9038067, 2.496051, -1.267387, 0.9843137, 0, 1, 1,
0.9060138, -0.9998206, 1.138369, 0.9921569, 0, 1, 1,
0.9096003, 1.943253, -0.2170513, 0.9960784, 0, 1, 1,
0.9099037, 0.2666894, 2.358458, 1, 0, 0.9960784, 1,
0.9123017, 0.03812325, 2.133332, 1, 0, 0.9882353, 1,
0.9154594, -1.156235, 3.93197, 1, 0, 0.9843137, 1,
0.9160659, 1.231186, 1.003356, 1, 0, 0.9764706, 1,
0.9211086, 0.335297, 2.587677, 1, 0, 0.972549, 1,
0.9240674, 0.9886237, -0.2094756, 1, 0, 0.9647059, 1,
0.9258279, 0.255378, 1.847888, 1, 0, 0.9607843, 1,
0.9399715, -0.4695274, 3.447071, 1, 0, 0.9529412, 1,
0.9459035, 0.3236224, 0.9686938, 1, 0, 0.9490196, 1,
0.9498357, -0.4875557, 2.392245, 1, 0, 0.9411765, 1,
0.9500722, -0.5436814, 1.22783, 1, 0, 0.9372549, 1,
0.9524415, -2.67402, 1.959766, 1, 0, 0.9294118, 1,
0.9546641, -0.8330036, 1.013361, 1, 0, 0.9254902, 1,
0.9562689, 1.94953, 0.9497656, 1, 0, 0.9176471, 1,
0.9563329, -0.7278113, 1.116208, 1, 0, 0.9137255, 1,
0.9727333, -0.8083116, 2.361179, 1, 0, 0.9058824, 1,
0.9738098, 1.376473, 2.811847, 1, 0, 0.9019608, 1,
0.9777756, -0.3967517, 1.365068, 1, 0, 0.8941177, 1,
0.9825003, -1.143553, 2.463711, 1, 0, 0.8862745, 1,
0.983964, 0.8890027, 0.6061252, 1, 0, 0.8823529, 1,
0.9865031, 0.8402278, 2.384006, 1, 0, 0.8745098, 1,
0.9928252, -0.5420539, 3.217542, 1, 0, 0.8705882, 1,
0.9933044, 0.6876026, 0.1289645, 1, 0, 0.8627451, 1,
0.9985945, -0.2957612, 2.514901, 1, 0, 0.8588235, 1,
1.00188, -0.1584772, 1.12046, 1, 0, 0.8509804, 1,
1.00309, -0.5320401, 2.327178, 1, 0, 0.8470588, 1,
1.003835, 0.636126, 1.499155, 1, 0, 0.8392157, 1,
1.007672, 1.216627, -0.1814442, 1, 0, 0.8352941, 1,
1.01078, 0.6531932, 0.1449854, 1, 0, 0.827451, 1,
1.021829, 0.04731568, 1.503529, 1, 0, 0.8235294, 1,
1.024125, -1.07219, 3.019162, 1, 0, 0.8156863, 1,
1.025096, -0.5999779, 2.659526, 1, 0, 0.8117647, 1,
1.035198, -1.089359, 1.258299, 1, 0, 0.8039216, 1,
1.035842, -0.1131584, 0.6739404, 1, 0, 0.7960784, 1,
1.036496, -1.880243, 2.107029, 1, 0, 0.7921569, 1,
1.039297, -2.313318, 0.3359714, 1, 0, 0.7843137, 1,
1.039663, 0.3058096, 1.694093, 1, 0, 0.7803922, 1,
1.047639, 0.8480484, 0.5431162, 1, 0, 0.772549, 1,
1.060615, 0.9060096, 0.4069795, 1, 0, 0.7686275, 1,
1.061269, 0.004155341, 0.5041889, 1, 0, 0.7607843, 1,
1.064147, -0.7862664, 3.374659, 1, 0, 0.7568628, 1,
1.064622, 0.361879, 1.325312, 1, 0, 0.7490196, 1,
1.087921, 0.4844024, 1.748419, 1, 0, 0.7450981, 1,
1.091367, -1.266077, 3.764699, 1, 0, 0.7372549, 1,
1.091489, 1.129737, 1.229375, 1, 0, 0.7333333, 1,
1.098147, 0.61822, 1.22687, 1, 0, 0.7254902, 1,
1.100918, 1.165075, -0.0557255, 1, 0, 0.7215686, 1,
1.105798, 2.142443, 0.1602357, 1, 0, 0.7137255, 1,
1.107591, 0.2084671, 0.9733428, 1, 0, 0.7098039, 1,
1.117055, -0.470536, 0.6148278, 1, 0, 0.7019608, 1,
1.133374, 0.3870004, 1.575916, 1, 0, 0.6941177, 1,
1.134137, 0.8640371, 1.869173, 1, 0, 0.6901961, 1,
1.135833, 0.7039254, 1.212533, 1, 0, 0.682353, 1,
1.140793, 1.004701, 2.073936, 1, 0, 0.6784314, 1,
1.141818, 0.7349182, 0.7333083, 1, 0, 0.6705883, 1,
1.142078, -1.778954, 3.400245, 1, 0, 0.6666667, 1,
1.143839, -0.01969982, 1.821467, 1, 0, 0.6588235, 1,
1.151066, -0.5695117, 2.774436, 1, 0, 0.654902, 1,
1.153556, -1.773967, 1.659681, 1, 0, 0.6470588, 1,
1.160481, -0.8626178, 1.67098, 1, 0, 0.6431373, 1,
1.18384, 0.5811316, -0.967467, 1, 0, 0.6352941, 1,
1.189703, 0.6260699, 0.06626478, 1, 0, 0.6313726, 1,
1.199341, 0.06724021, 0.6097096, 1, 0, 0.6235294, 1,
1.205228, -0.3060061, 0.5870826, 1, 0, 0.6196079, 1,
1.210982, 0.3885379, -0.2512513, 1, 0, 0.6117647, 1,
1.211693, -0.7663918, 0.7119594, 1, 0, 0.6078432, 1,
1.215306, -0.003736303, 0.5462752, 1, 0, 0.6, 1,
1.22405, -0.6689289, 2.594669, 1, 0, 0.5921569, 1,
1.226262, -0.02500893, 2.693628, 1, 0, 0.5882353, 1,
1.229529, -0.2949936, 3.013579, 1, 0, 0.5803922, 1,
1.229607, 0.7289524, 1.870676, 1, 0, 0.5764706, 1,
1.232617, -2.555891, 3.881964, 1, 0, 0.5686275, 1,
1.233543, -1.296813, 0.5746788, 1, 0, 0.5647059, 1,
1.234961, -2.240686, 1.837503, 1, 0, 0.5568628, 1,
1.24473, -1.648361, 1.129398, 1, 0, 0.5529412, 1,
1.247448, -0.8724879, 1.937867, 1, 0, 0.5450981, 1,
1.249329, -0.6451155, 2.629151, 1, 0, 0.5411765, 1,
1.254884, 0.722409, 2.750679, 1, 0, 0.5333334, 1,
1.260589, 0.4297286, 0.680096, 1, 0, 0.5294118, 1,
1.261706, 0.3462234, 1.149295, 1, 0, 0.5215687, 1,
1.270497, -0.6136341, 2.303758, 1, 0, 0.5176471, 1,
1.306028, -0.6173012, 2.861359, 1, 0, 0.509804, 1,
1.313202, 1.051333, 1.20844, 1, 0, 0.5058824, 1,
1.313562, 0.1965939, 0.09008374, 1, 0, 0.4980392, 1,
1.315309, 0.4719332, 0.3643202, 1, 0, 0.4901961, 1,
1.317249, -1.330504, 0.8214338, 1, 0, 0.4862745, 1,
1.330051, 1.625694, -0.1291813, 1, 0, 0.4784314, 1,
1.333212, 0.7406941, 0.6511558, 1, 0, 0.4745098, 1,
1.334285, -1.072136, 2.951495, 1, 0, 0.4666667, 1,
1.350563, -0.06627866, 1.611291, 1, 0, 0.4627451, 1,
1.354239, -0.3018945, 2.065802, 1, 0, 0.454902, 1,
1.356268, -0.9505689, 2.565138, 1, 0, 0.4509804, 1,
1.359977, -0.1022358, 1.619712, 1, 0, 0.4431373, 1,
1.362661, 0.729926, -0.6961608, 1, 0, 0.4392157, 1,
1.362895, -0.3656469, 2.13386, 1, 0, 0.4313726, 1,
1.365207, 0.6829971, 2.845244, 1, 0, 0.427451, 1,
1.376281, 1.039928, 0.5714745, 1, 0, 0.4196078, 1,
1.382151, -0.02612279, 1.836757, 1, 0, 0.4156863, 1,
1.389699, 0.2589783, 3.213168, 1, 0, 0.4078431, 1,
1.392194, 0.6171044, 2.032389, 1, 0, 0.4039216, 1,
1.392444, -0.5388296, 0.834037, 1, 0, 0.3960784, 1,
1.393901, -0.05815102, 0.9497648, 1, 0, 0.3882353, 1,
1.396897, 2.958202, -1.523191, 1, 0, 0.3843137, 1,
1.406802, -0.4666608, 1.096572, 1, 0, 0.3764706, 1,
1.415219, -0.6340859, 1.562984, 1, 0, 0.372549, 1,
1.420202, -1.236436, 2.935308, 1, 0, 0.3647059, 1,
1.424645, -1.08187, 2.417384, 1, 0, 0.3607843, 1,
1.426643, -0.4585825, 1.722775, 1, 0, 0.3529412, 1,
1.431706, 0.6796554, 0.2529123, 1, 0, 0.3490196, 1,
1.452162, 0.140843, 0.3804072, 1, 0, 0.3411765, 1,
1.452889, -0.03198175, 1.498135, 1, 0, 0.3372549, 1,
1.455056, 1.623061, 0.4796324, 1, 0, 0.3294118, 1,
1.45907, 0.5872037, 1.757027, 1, 0, 0.3254902, 1,
1.46084, -0.1511143, 1.648847, 1, 0, 0.3176471, 1,
1.474234, 0.7486307, 0.3659621, 1, 0, 0.3137255, 1,
1.474592, -1.450518, 1.412694, 1, 0, 0.3058824, 1,
1.484928, -1.235147, 0.9230985, 1, 0, 0.2980392, 1,
1.510478, -0.3528279, 3.057028, 1, 0, 0.2941177, 1,
1.524816, -0.9123621, 1.533872, 1, 0, 0.2862745, 1,
1.529936, -0.02202038, 0.3470578, 1, 0, 0.282353, 1,
1.540142, 1.538824, 1.362767, 1, 0, 0.2745098, 1,
1.541806, -1.46958, 2.254601, 1, 0, 0.2705882, 1,
1.548811, -1.30039, 1.748768, 1, 0, 0.2627451, 1,
1.558624, 0.274875, 1.375656, 1, 0, 0.2588235, 1,
1.590647, -1.2552, 1.464581, 1, 0, 0.2509804, 1,
1.603404, 0.3449169, 1.633751, 1, 0, 0.2470588, 1,
1.607099, -0.09721205, -0.003011903, 1, 0, 0.2392157, 1,
1.612251, 0.7397433, 1.111202, 1, 0, 0.2352941, 1,
1.638301, -0.2198786, -0.5851571, 1, 0, 0.227451, 1,
1.646173, -0.6342044, 2.000934, 1, 0, 0.2235294, 1,
1.657274, 0.3192671, 1.73539, 1, 0, 0.2156863, 1,
1.672159, -2.269637, 2.465592, 1, 0, 0.2117647, 1,
1.674197, -0.9116436, 0.9757748, 1, 0, 0.2039216, 1,
1.6811, 0.7858043, 0.9366181, 1, 0, 0.1960784, 1,
1.699087, 1.857492, 2.656235, 1, 0, 0.1921569, 1,
1.745781, 0.9391873, 0.8276338, 1, 0, 0.1843137, 1,
1.760694, -0.0948751, 1.009236, 1, 0, 0.1803922, 1,
1.779386, 2.342096, 0.08656264, 1, 0, 0.172549, 1,
1.781384, -0.8099961, 4.786624, 1, 0, 0.1686275, 1,
1.782098, -0.8759269, 1.90381, 1, 0, 0.1607843, 1,
1.797679, 0.5878243, 2.203532, 1, 0, 0.1568628, 1,
1.798105, 0.2822166, 1.273607, 1, 0, 0.1490196, 1,
1.814951, 1.206153, 0.6429623, 1, 0, 0.145098, 1,
1.835679, -0.6357993, 3.195363, 1, 0, 0.1372549, 1,
1.888329, 1.080431, 0.9460405, 1, 0, 0.1333333, 1,
1.908113, -1.045424, 2.33656, 1, 0, 0.1254902, 1,
1.941223, 1.303367, 1.707064, 1, 0, 0.1215686, 1,
1.946984, 0.489637, 0.1368244, 1, 0, 0.1137255, 1,
1.969324, -1.225373, 1.537367, 1, 0, 0.1098039, 1,
1.995337, 0.9845622, -0.2292369, 1, 0, 0.1019608, 1,
2.051066, -0.3354216, -0.07865419, 1, 0, 0.09411765, 1,
2.09442, -1.07065, 2.333797, 1, 0, 0.09019608, 1,
2.096729, -0.5891135, 1.823597, 1, 0, 0.08235294, 1,
2.09726, 0.2740142, 1.734638, 1, 0, 0.07843138, 1,
2.113016, 0.1002565, 2.118689, 1, 0, 0.07058824, 1,
2.132447, -1.055102, 2.455903, 1, 0, 0.06666667, 1,
2.194522, 0.190373, 2.570393, 1, 0, 0.05882353, 1,
2.200083, 1.037692, 0.8699639, 1, 0, 0.05490196, 1,
2.252791, 0.8974833, -0.09511234, 1, 0, 0.04705882, 1,
2.320201, 0.1382451, 2.184368, 1, 0, 0.04313726, 1,
2.605533, -0.647135, 0.9867809, 1, 0, 0.03529412, 1,
2.610772, 1.667761, 0.4511986, 1, 0, 0.03137255, 1,
2.622193, -0.6019858, 3.049467, 1, 0, 0.02352941, 1,
2.957941, 0.5289909, 1.164435, 1, 0, 0.01960784, 1,
3.052498, 1.550532, -0.7286478, 1, 0, 0.01176471, 1,
3.11411, -0.6286951, -0.3093893, 1, 0, 0.007843138, 1
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
0.1045566, -5.172017, -7.730551, 0, -0.5, 0.5, 0.5,
0.1045566, -5.172017, -7.730551, 1, -0.5, 0.5, 0.5,
0.1045566, -5.172017, -7.730551, 1, 1.5, 0.5, 0.5,
0.1045566, -5.172017, -7.730551, 0, 1.5, 0.5, 0.5
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
-3.925236, -0.4604486, -7.730551, 0, -0.5, 0.5, 0.5,
-3.925236, -0.4604486, -7.730551, 1, -0.5, 0.5, 0.5,
-3.925236, -0.4604486, -7.730551, 1, 1.5, 0.5, 0.5,
-3.925236, -0.4604486, -7.730551, 0, 1.5, 0.5, 0.5
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
-3.925236, -5.172017, -0.5338433, 0, -0.5, 0.5, 0.5,
-3.925236, -5.172017, -0.5338433, 1, -0.5, 0.5, 0.5,
-3.925236, -5.172017, -0.5338433, 1, 1.5, 0.5, 0.5,
-3.925236, -5.172017, -0.5338433, 0, 1.5, 0.5, 0.5
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
-2, -4.084732, -6.069772,
3, -4.084732, -6.069772,
-2, -4.084732, -6.069772,
-2, -4.265946, -6.346569,
-1, -4.084732, -6.069772,
-1, -4.265946, -6.346569,
0, -4.084732, -6.069772,
0, -4.265946, -6.346569,
1, -4.084732, -6.069772,
1, -4.265946, -6.346569,
2, -4.084732, -6.069772,
2, -4.265946, -6.346569,
3, -4.084732, -6.069772,
3, -4.265946, -6.346569
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
-2, -4.628375, -6.900162, 0, -0.5, 0.5, 0.5,
-2, -4.628375, -6.900162, 1, -0.5, 0.5, 0.5,
-2, -4.628375, -6.900162, 1, 1.5, 0.5, 0.5,
-2, -4.628375, -6.900162, 0, 1.5, 0.5, 0.5,
-1, -4.628375, -6.900162, 0, -0.5, 0.5, 0.5,
-1, -4.628375, -6.900162, 1, -0.5, 0.5, 0.5,
-1, -4.628375, -6.900162, 1, 1.5, 0.5, 0.5,
-1, -4.628375, -6.900162, 0, 1.5, 0.5, 0.5,
0, -4.628375, -6.900162, 0, -0.5, 0.5, 0.5,
0, -4.628375, -6.900162, 1, -0.5, 0.5, 0.5,
0, -4.628375, -6.900162, 1, 1.5, 0.5, 0.5,
0, -4.628375, -6.900162, 0, 1.5, 0.5, 0.5,
1, -4.628375, -6.900162, 0, -0.5, 0.5, 0.5,
1, -4.628375, -6.900162, 1, -0.5, 0.5, 0.5,
1, -4.628375, -6.900162, 1, 1.5, 0.5, 0.5,
1, -4.628375, -6.900162, 0, 1.5, 0.5, 0.5,
2, -4.628375, -6.900162, 0, -0.5, 0.5, 0.5,
2, -4.628375, -6.900162, 1, -0.5, 0.5, 0.5,
2, -4.628375, -6.900162, 1, 1.5, 0.5, 0.5,
2, -4.628375, -6.900162, 0, 1.5, 0.5, 0.5,
3, -4.628375, -6.900162, 0, -0.5, 0.5, 0.5,
3, -4.628375, -6.900162, 1, -0.5, 0.5, 0.5,
3, -4.628375, -6.900162, 1, 1.5, 0.5, 0.5,
3, -4.628375, -6.900162, 0, 1.5, 0.5, 0.5
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
-2.995284, -2, -6.069772,
-2.995284, 2, -6.069772,
-2.995284, -2, -6.069772,
-3.150276, -2, -6.346569,
-2.995284, 0, -6.069772,
-3.150276, 0, -6.346569,
-2.995284, 2, -6.069772,
-3.150276, 2, -6.346569
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
-3.46026, -2, -6.900162, 0, -0.5, 0.5, 0.5,
-3.46026, -2, -6.900162, 1, -0.5, 0.5, 0.5,
-3.46026, -2, -6.900162, 1, 1.5, 0.5, 0.5,
-3.46026, -2, -6.900162, 0, 1.5, 0.5, 0.5,
-3.46026, 0, -6.900162, 0, -0.5, 0.5, 0.5,
-3.46026, 0, -6.900162, 1, -0.5, 0.5, 0.5,
-3.46026, 0, -6.900162, 1, 1.5, 0.5, 0.5,
-3.46026, 0, -6.900162, 0, 1.5, 0.5, 0.5,
-3.46026, 2, -6.900162, 0, -0.5, 0.5, 0.5,
-3.46026, 2, -6.900162, 1, -0.5, 0.5, 0.5,
-3.46026, 2, -6.900162, 1, 1.5, 0.5, 0.5,
-3.46026, 2, -6.900162, 0, 1.5, 0.5, 0.5
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
-2.995284, -4.084732, -4,
-2.995284, -4.084732, 4,
-2.995284, -4.084732, -4,
-3.150276, -4.265946, -4,
-2.995284, -4.084732, -2,
-3.150276, -4.265946, -2,
-2.995284, -4.084732, 0,
-3.150276, -4.265946, 0,
-2.995284, -4.084732, 2,
-3.150276, -4.265946, 2,
-2.995284, -4.084732, 4,
-3.150276, -4.265946, 4
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
-3.46026, -4.628375, -4, 0, -0.5, 0.5, 0.5,
-3.46026, -4.628375, -4, 1, -0.5, 0.5, 0.5,
-3.46026, -4.628375, -4, 1, 1.5, 0.5, 0.5,
-3.46026, -4.628375, -4, 0, 1.5, 0.5, 0.5,
-3.46026, -4.628375, -2, 0, -0.5, 0.5, 0.5,
-3.46026, -4.628375, -2, 1, -0.5, 0.5, 0.5,
-3.46026, -4.628375, -2, 1, 1.5, 0.5, 0.5,
-3.46026, -4.628375, -2, 0, 1.5, 0.5, 0.5,
-3.46026, -4.628375, 0, 0, -0.5, 0.5, 0.5,
-3.46026, -4.628375, 0, 1, -0.5, 0.5, 0.5,
-3.46026, -4.628375, 0, 1, 1.5, 0.5, 0.5,
-3.46026, -4.628375, 0, 0, 1.5, 0.5, 0.5,
-3.46026, -4.628375, 2, 0, -0.5, 0.5, 0.5,
-3.46026, -4.628375, 2, 1, -0.5, 0.5, 0.5,
-3.46026, -4.628375, 2, 1, 1.5, 0.5, 0.5,
-3.46026, -4.628375, 2, 0, 1.5, 0.5, 0.5,
-3.46026, -4.628375, 4, 0, -0.5, 0.5, 0.5,
-3.46026, -4.628375, 4, 1, -0.5, 0.5, 0.5,
-3.46026, -4.628375, 4, 1, 1.5, 0.5, 0.5,
-3.46026, -4.628375, 4, 0, 1.5, 0.5, 0.5
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
-2.995284, -4.084732, -6.069772,
-2.995284, 3.163835, -6.069772,
-2.995284, -4.084732, 5.002086,
-2.995284, 3.163835, 5.002086,
-2.995284, -4.084732, -6.069772,
-2.995284, -4.084732, 5.002086,
-2.995284, 3.163835, -6.069772,
-2.995284, 3.163835, 5.002086,
-2.995284, -4.084732, -6.069772,
3.204397, -4.084732, -6.069772,
-2.995284, -4.084732, 5.002086,
3.204397, -4.084732, 5.002086,
-2.995284, 3.163835, -6.069772,
3.204397, 3.163835, -6.069772,
-2.995284, 3.163835, 5.002086,
3.204397, 3.163835, 5.002086,
3.204397, -4.084732, -6.069772,
3.204397, 3.163835, -6.069772,
3.204397, -4.084732, 5.002086,
3.204397, 3.163835, 5.002086,
3.204397, -4.084732, -6.069772,
3.204397, -4.084732, 5.002086,
3.204397, 3.163835, -6.069772,
3.204397, 3.163835, 5.002086
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
var radius = 7.803498;
var distance = 34.71864;
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
mvMatrix.translate( -0.1045566, 0.4604486, 0.5338433 );
mvMatrix.scale( 1.360924, 1.163995, 0.7620487 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.71864);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
pyriproxyfen<-read.table("pyriproxyfen.xyz")
```

```
## Error in read.table("pyriproxyfen.xyz"): no lines available in input
```

```r
x<-pyriproxyfen$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyriproxyfen' not found
```

```r
y<-pyriproxyfen$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyriproxyfen' not found
```

```r
z<-pyriproxyfen$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyriproxyfen' not found
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
-2.904997, -0.3831823, -0.2626938, 0, 0, 1, 1, 1,
-2.790452, 1.995499, -1.489902, 1, 0, 0, 1, 1,
-2.769227, 1.624461, -0.3731904, 1, 0, 0, 1, 1,
-2.58124, -1.313379, -4.026185, 1, 0, 0, 1, 1,
-2.419483, -0.3492027, -1.249382, 1, 0, 0, 1, 1,
-2.405575, -1.404827, -1.155239, 1, 0, 0, 1, 1,
-2.342107, -0.9023798, -2.014331, 0, 0, 0, 1, 1,
-2.294945, 0.5281487, -0.8493934, 0, 0, 0, 1, 1,
-2.223141, -0.3312765, -2.696059, 0, 0, 0, 1, 1,
-2.218691, -0.5152348, -0.6813556, 0, 0, 0, 1, 1,
-2.202694, 0.4806226, -1.700383, 0, 0, 0, 1, 1,
-2.196535, -1.367622, -4.245997, 0, 0, 0, 1, 1,
-2.189481, -0.1006512, -2.260866, 0, 0, 0, 1, 1,
-2.13762, -0.1347119, -1.641052, 1, 1, 1, 1, 1,
-2.09572, 0.02072448, -1.079277, 1, 1, 1, 1, 1,
-2.093126, 1.210568, -0.09886286, 1, 1, 1, 1, 1,
-2.076936, -0.763715, -1.924492, 1, 1, 1, 1, 1,
-2.049951, 0.4711291, -0.378856, 1, 1, 1, 1, 1,
-2.03855, 0.8038252, -1.189333, 1, 1, 1, 1, 1,
-2.02462, 1.877176, -0.4950725, 1, 1, 1, 1, 1,
-1.987635, 0.8662593, -1.812781, 1, 1, 1, 1, 1,
-1.95947, -0.4654086, -1.05772, 1, 1, 1, 1, 1,
-1.92235, -0.4744869, -2.157974, 1, 1, 1, 1, 1,
-1.922314, -0.2046424, -0.6074755, 1, 1, 1, 1, 1,
-1.904422, 0.6513667, -1.96745, 1, 1, 1, 1, 1,
-1.88933, -0.9475024, -3.298627, 1, 1, 1, 1, 1,
-1.88779, -0.1168954, -2.451963, 1, 1, 1, 1, 1,
-1.848456, -0.05156516, -0.9079597, 1, 1, 1, 1, 1,
-1.844147, -0.4053353, -3.817721, 0, 0, 1, 1, 1,
-1.835398, -1.814222, -2.788496, 1, 0, 0, 1, 1,
-1.834679, -0.3011943, 0.1382923, 1, 0, 0, 1, 1,
-1.823917, 1.692747, -0.2173438, 1, 0, 0, 1, 1,
-1.78949, -0.1689515, -0.570655, 1, 0, 0, 1, 1,
-1.783164, 1.151641, -2.443099, 1, 0, 0, 1, 1,
-1.782241, -1.582335, -3.474562, 0, 0, 0, 1, 1,
-1.775724, 1.793571, -1.174731, 0, 0, 0, 1, 1,
-1.757182, 1.4788, -0.5770639, 0, 0, 0, 1, 1,
-1.73864, 1.407641, -0.1478753, 0, 0, 0, 1, 1,
-1.735288, -0.7950374, -1.411968, 0, 0, 0, 1, 1,
-1.731273, -0.519937, -1.737084, 0, 0, 0, 1, 1,
-1.724226, -0.3308652, -0.7597048, 0, 0, 0, 1, 1,
-1.713794, 0.8050009, -1.75826, 1, 1, 1, 1, 1,
-1.695042, -0.2556005, -1.252912, 1, 1, 1, 1, 1,
-1.694423, 0.6947973, -2.178968, 1, 1, 1, 1, 1,
-1.685818, 1.57327, -1.11816, 1, 1, 1, 1, 1,
-1.683205, 1.357546, -1.193043, 1, 1, 1, 1, 1,
-1.67848, 0.151796, -2.605721, 1, 1, 1, 1, 1,
-1.667371, 0.349426, -1.556521, 1, 1, 1, 1, 1,
-1.639132, 1.502843, 0.1630993, 1, 1, 1, 1, 1,
-1.633889, 0.114569, -1.964541, 1, 1, 1, 1, 1,
-1.632197, 1.82489, -0.4926554, 1, 1, 1, 1, 1,
-1.626398, 1.166105, -1.304061, 1, 1, 1, 1, 1,
-1.622247, 0.181182, -0.6998437, 1, 1, 1, 1, 1,
-1.619004, -1.001001, -2.005036, 1, 1, 1, 1, 1,
-1.61251, 0.2972911, -2.253536, 1, 1, 1, 1, 1,
-1.608915, -0.3005827, -3.302574, 1, 1, 1, 1, 1,
-1.565253, -0.6513188, -1.972598, 0, 0, 1, 1, 1,
-1.562034, -0.6793646, -2.266502, 1, 0, 0, 1, 1,
-1.558537, -0.3297148, -2.249925, 1, 0, 0, 1, 1,
-1.538331, -0.5597561, -2.655989, 1, 0, 0, 1, 1,
-1.533116, 0.5771588, -2.030496, 1, 0, 0, 1, 1,
-1.530448, -1.082921, -0.4423487, 1, 0, 0, 1, 1,
-1.530124, -1.274346, -1.164423, 0, 0, 0, 1, 1,
-1.519921, -1.008975, -1.84201, 0, 0, 0, 1, 1,
-1.51473, 1.028109, -0.4793186, 0, 0, 0, 1, 1,
-1.505473, 1.223283, -1.787451, 0, 0, 0, 1, 1,
-1.492666, -1.140755, -1.99798, 0, 0, 0, 1, 1,
-1.490094, 0.3773546, -1.540613, 0, 0, 0, 1, 1,
-1.472235, -0.2886561, -1.034824, 0, 0, 0, 1, 1,
-1.460308, 0.1865525, -0.8914858, 1, 1, 1, 1, 1,
-1.460272, -1.207069, -1.427573, 1, 1, 1, 1, 1,
-1.452477, 0.5172476, -1.127074, 1, 1, 1, 1, 1,
-1.44809, 0.07854375, -1.064968, 1, 1, 1, 1, 1,
-1.441505, -0.158939, -0.6853392, 1, 1, 1, 1, 1,
-1.434919, -0.1629187, -1.880988, 1, 1, 1, 1, 1,
-1.422511, -0.1095354, -2.411521, 1, 1, 1, 1, 1,
-1.402586, 0.2541315, -1.244046, 1, 1, 1, 1, 1,
-1.394744, -0.7325044, -2.343833, 1, 1, 1, 1, 1,
-1.380372, 1.922891, -0.3028491, 1, 1, 1, 1, 1,
-1.373365, 2.321488, 0.1366567, 1, 1, 1, 1, 1,
-1.352252, -0.7095055, -0.5154901, 1, 1, 1, 1, 1,
-1.338449, -0.5653231, -0.5618832, 1, 1, 1, 1, 1,
-1.33579, 0.7865064, 0.07231469, 1, 1, 1, 1, 1,
-1.334267, -1.168726, -1.748738, 1, 1, 1, 1, 1,
-1.324152, 1.412188, -1.837951, 0, 0, 1, 1, 1,
-1.31588, 1.183686, -3.101001, 1, 0, 0, 1, 1,
-1.313848, 0.588957, -2.90859, 1, 0, 0, 1, 1,
-1.306123, -0.5620804, -2.239397, 1, 0, 0, 1, 1,
-1.30189, 0.454403, 0.1646245, 1, 0, 0, 1, 1,
-1.299445, -0.5842732, -3.396548, 1, 0, 0, 1, 1,
-1.295124, -0.5241739, -2.003289, 0, 0, 0, 1, 1,
-1.289928, 0.4249007, -0.5806286, 0, 0, 0, 1, 1,
-1.285001, -0.04227795, -1.300291, 0, 0, 0, 1, 1,
-1.279275, 1.166269, -2.187838, 0, 0, 0, 1, 1,
-1.273476, -3.97917, -3.456857, 0, 0, 0, 1, 1,
-1.266272, 2.302294, -1.594419, 0, 0, 0, 1, 1,
-1.255664, -0.862126, -2.079483, 0, 0, 0, 1, 1,
-1.25043, 1.196963, 0.5379366, 1, 1, 1, 1, 1,
-1.231172, 0.62549, 0.1934522, 1, 1, 1, 1, 1,
-1.220085, -0.1124813, -2.45015, 1, 1, 1, 1, 1,
-1.219415, -0.7404273, -1.365527, 1, 1, 1, 1, 1,
-1.213403, 1.226658, 0.1454778, 1, 1, 1, 1, 1,
-1.21022, -0.3459637, -2.941125, 1, 1, 1, 1, 1,
-1.177914, -0.6600196, -2.313834, 1, 1, 1, 1, 1,
-1.164245, -0.9685356, -3.293756, 1, 1, 1, 1, 1,
-1.161302, -2.06696, -2.285323, 1, 1, 1, 1, 1,
-1.160093, 0.05698474, -1.793338, 1, 1, 1, 1, 1,
-1.158504, -1.875864, -3.367869, 1, 1, 1, 1, 1,
-1.147679, -0.2374933, -4.224548, 1, 1, 1, 1, 1,
-1.14538, 0.2538644, -0.4339986, 1, 1, 1, 1, 1,
-1.131301, 0.9722524, -2.276663, 1, 1, 1, 1, 1,
-1.126071, -1.032147, -1.943213, 1, 1, 1, 1, 1,
-1.123824, -0.5015621, -1.864108, 0, 0, 1, 1, 1,
-1.114875, -0.8029157, -1.704631, 1, 0, 0, 1, 1,
-1.11457, 1.049961, -0.4387096, 1, 0, 0, 1, 1,
-1.104387, 0.07107705, -1.342471, 1, 0, 0, 1, 1,
-1.103566, 1.588851, -1.71557, 1, 0, 0, 1, 1,
-1.102001, -1.19853, -1.217972, 1, 0, 0, 1, 1,
-1.094133, 0.6231117, -1.809596, 0, 0, 0, 1, 1,
-1.080316, -0.258879, -2.347707, 0, 0, 0, 1, 1,
-1.078788, -0.1099882, -0.7256054, 0, 0, 0, 1, 1,
-1.068511, 0.1285276, -2.062913, 0, 0, 0, 1, 1,
-1.067015, 0.3868895, 0.00609379, 0, 0, 0, 1, 1,
-1.066459, -0.6714502, -1.386732, 0, 0, 0, 1, 1,
-1.06641, -0.2491963, -1.072694, 0, 0, 0, 1, 1,
-1.051439, 0.2527806, -1.317163, 1, 1, 1, 1, 1,
-1.047132, -1.464898, -1.188101, 1, 1, 1, 1, 1,
-1.045875, -0.7347697, -1.755346, 1, 1, 1, 1, 1,
-1.044201, 0.03855499, 0.1584572, 1, 1, 1, 1, 1,
-1.041016, -0.4113382, -1.437177, 1, 1, 1, 1, 1,
-1.032183, 1.455366, -1.197893, 1, 1, 1, 1, 1,
-1.032033, 0.9216238, -0.5994921, 1, 1, 1, 1, 1,
-1.030296, 1.982478, -2.006427, 1, 1, 1, 1, 1,
-1.02754, -0.3070176, -1.119851, 1, 1, 1, 1, 1,
-1.026769, -0.5964283, -2.327586, 1, 1, 1, 1, 1,
-1.020088, 0.7817718, -1.917969, 1, 1, 1, 1, 1,
-1.018394, -0.1035963, -1.781021, 1, 1, 1, 1, 1,
-1.017431, -0.8500736, -1.934826, 1, 1, 1, 1, 1,
-1.016014, 0.314557, -1.582457, 1, 1, 1, 1, 1,
-1.01517, -0.7691905, -0.6630672, 1, 1, 1, 1, 1,
-1.013405, -0.8170296, -3.964727, 0, 0, 1, 1, 1,
-1.011574, 0.5797364, -1.311718, 1, 0, 0, 1, 1,
-1.000901, -0.1706755, -1.952193, 1, 0, 0, 1, 1,
-0.9981132, -0.8785119, -0.01792934, 1, 0, 0, 1, 1,
-0.9966969, 0.4900812, -0.9669444, 1, 0, 0, 1, 1,
-0.9852841, 0.3214715, 0.027007, 1, 0, 0, 1, 1,
-0.9851639, -0.2824659, -1.448458, 0, 0, 0, 1, 1,
-0.9829617, 1.095514, -1.491889, 0, 0, 0, 1, 1,
-0.9745935, -1.398043, -3.348464, 0, 0, 0, 1, 1,
-0.9742101, -2.182531, -1.668073, 0, 0, 0, 1, 1,
-0.9676189, -0.1039941, 0.2846103, 0, 0, 0, 1, 1,
-0.9670456, 1.664398, -1.638941, 0, 0, 0, 1, 1,
-0.9619671, -0.9522682, -2.32118, 0, 0, 0, 1, 1,
-0.9600027, 0.2764399, 0.1737395, 1, 1, 1, 1, 1,
-0.9522143, 0.2302467, -2.509661, 1, 1, 1, 1, 1,
-0.9487509, -0.01125644, -0.1181353, 1, 1, 1, 1, 1,
-0.9409304, 0.3238728, -0.8774947, 1, 1, 1, 1, 1,
-0.9328608, 0.8431854, 0.4496817, 1, 1, 1, 1, 1,
-0.9322311, -0.5311688, -2.012278, 1, 1, 1, 1, 1,
-0.9234631, -1.380463, -4.239001, 1, 1, 1, 1, 1,
-0.9192268, 1.447541, -0.5706773, 1, 1, 1, 1, 1,
-0.916479, 1.812413, -0.5870488, 1, 1, 1, 1, 1,
-0.9160551, -0.6571347, -2.39911, 1, 1, 1, 1, 1,
-0.9160128, -0.2475777, -1.401441, 1, 1, 1, 1, 1,
-0.9143323, -0.354854, -3.21698, 1, 1, 1, 1, 1,
-0.9142337, -1.149318, -1.106063, 1, 1, 1, 1, 1,
-0.9089485, 1.736141, -0.3397785, 1, 1, 1, 1, 1,
-0.9077831, 0.8663187, -0.3590885, 1, 1, 1, 1, 1,
-0.9009185, 0.5420731, -1.12625, 0, 0, 1, 1, 1,
-0.8928486, -1.117737, -3.760274, 1, 0, 0, 1, 1,
-0.8924643, -0.9483728, -3.582745, 1, 0, 0, 1, 1,
-0.8903589, 1.505035, -0.6334316, 1, 0, 0, 1, 1,
-0.8866637, -0.709716, -1.093667, 1, 0, 0, 1, 1,
-0.8841026, -1.008549, -2.707963, 1, 0, 0, 1, 1,
-0.8799033, -0.9598065, -1.98975, 0, 0, 0, 1, 1,
-0.878127, 0.6159549, -0.2832051, 0, 0, 0, 1, 1,
-0.874074, -1.967609, -3.377958, 0, 0, 0, 1, 1,
-0.8727083, -0.06106351, -2.526629, 0, 0, 0, 1, 1,
-0.8692191, 1.188205, -0.7834051, 0, 0, 0, 1, 1,
-0.8663496, 1.237182, -1.262617, 0, 0, 0, 1, 1,
-0.8488074, 0.4808189, -1.5691, 0, 0, 0, 1, 1,
-0.8420865, 0.4421182, -0.2602133, 1, 1, 1, 1, 1,
-0.8407502, 1.651379, 1.026658, 1, 1, 1, 1, 1,
-0.8401313, 0.7380003, -0.06679268, 1, 1, 1, 1, 1,
-0.8386016, -0.5067503, -0.8881391, 1, 1, 1, 1, 1,
-0.8371485, 0.2804746, -1.291021, 1, 1, 1, 1, 1,
-0.8358847, 0.08048122, 1.167209, 1, 1, 1, 1, 1,
-0.8318494, -0.0492997, -2.965021, 1, 1, 1, 1, 1,
-0.8268484, -0.423731, -0.9868343, 1, 1, 1, 1, 1,
-0.8249523, -1.03493, -1.502109, 1, 1, 1, 1, 1,
-0.823505, -0.6341345, -1.095414, 1, 1, 1, 1, 1,
-0.8198004, -0.7733368, -2.109357, 1, 1, 1, 1, 1,
-0.8174198, 1.828053, -3.11172, 1, 1, 1, 1, 1,
-0.8163279, 0.4638151, -0.8611591, 1, 1, 1, 1, 1,
-0.816276, -0.8339673, -3.682067, 1, 1, 1, 1, 1,
-0.814263, -0.5199317, -0.8417332, 1, 1, 1, 1, 1,
-0.8129983, -0.4394431, -1.63774, 0, 0, 1, 1, 1,
-0.8126008, -0.7049155, -2.129783, 1, 0, 0, 1, 1,
-0.8119878, -0.8677766, -3.101857, 1, 0, 0, 1, 1,
-0.8078697, 0.7356935, -0.1902659, 1, 0, 0, 1, 1,
-0.8064975, 0.1225135, -1.305909, 1, 0, 0, 1, 1,
-0.8058257, -0.5627043, -2.078914, 1, 0, 0, 1, 1,
-0.8051522, -0.6066701, -2.660098, 0, 0, 0, 1, 1,
-0.803419, 1.0262, -0.248716, 0, 0, 0, 1, 1,
-0.8033963, -1.400356, -2.908568, 0, 0, 0, 1, 1,
-0.8005534, 0.5967534, -0.3576099, 0, 0, 0, 1, 1,
-0.8002475, -0.1367579, -1.873046, 0, 0, 0, 1, 1,
-0.7979839, -0.9139392, -4.778582, 0, 0, 0, 1, 1,
-0.7867402, -0.01203419, -2.360551, 0, 0, 0, 1, 1,
-0.7802366, -1.56836, -1.469966, 1, 1, 1, 1, 1,
-0.7793304, 0.630523, 1.619433, 1, 1, 1, 1, 1,
-0.7774155, -1.869355, -1.150459, 1, 1, 1, 1, 1,
-0.7758792, 0.4053402, -1.971598, 1, 1, 1, 1, 1,
-0.7741904, 1.580371, -0.2499521, 1, 1, 1, 1, 1,
-0.7727517, 1.07426, -1.268302, 1, 1, 1, 1, 1,
-0.7725276, -0.5644668, -3.765418, 1, 1, 1, 1, 1,
-0.7691177, 0.7648762, -1.501399, 1, 1, 1, 1, 1,
-0.7611529, -0.1581521, -2.306306, 1, 1, 1, 1, 1,
-0.7602364, 0.3026569, -3.554264, 1, 1, 1, 1, 1,
-0.7598271, -0.6852415, -0.7957305, 1, 1, 1, 1, 1,
-0.7597979, -2.418885, -2.277204, 1, 1, 1, 1, 1,
-0.7560489, -1.146783, -2.420044, 1, 1, 1, 1, 1,
-0.7559279, -0.3977395, -1.288418, 1, 1, 1, 1, 1,
-0.7510028, -1.238216, -2.012028, 1, 1, 1, 1, 1,
-0.7491977, -1.325777, -0.419075, 0, 0, 1, 1, 1,
-0.7453746, -1.482691, -3.366084, 1, 0, 0, 1, 1,
-0.7318025, 0.8834783, 0.2767001, 1, 0, 0, 1, 1,
-0.7297152, 1.094244, 0.920506, 1, 0, 0, 1, 1,
-0.7229072, -0.3211507, -0.744818, 1, 0, 0, 1, 1,
-0.7200421, -0.4976776, -1.697994, 1, 0, 0, 1, 1,
-0.7172272, 1.256665, -0.8056954, 0, 0, 0, 1, 1,
-0.7123402, 0.2369473, -0.2864604, 0, 0, 0, 1, 1,
-0.7110968, 0.6294823, 0.03950604, 0, 0, 0, 1, 1,
-0.7106633, 0.3251058, -1.826931, 0, 0, 0, 1, 1,
-0.7096776, 1.356448, -0.8174311, 0, 0, 0, 1, 1,
-0.7064788, 0.6156686, 0.06311901, 0, 0, 0, 1, 1,
-0.7063398, -1.084386, -3.155665, 0, 0, 0, 1, 1,
-0.7017309, -1.418344, -1.520537, 1, 1, 1, 1, 1,
-0.6992654, -0.5847725, -3.182954, 1, 1, 1, 1, 1,
-0.6971176, 1.592859, -0.5641562, 1, 1, 1, 1, 1,
-0.6970488, -1.777686, -4.041426, 1, 1, 1, 1, 1,
-0.6953731, -0.2918028, 0.3573494, 1, 1, 1, 1, 1,
-0.6909774, -0.03670871, -2.63893, 1, 1, 1, 1, 1,
-0.6901813, -1.083461, -4.113787, 1, 1, 1, 1, 1,
-0.6841989, -1.688755, -1.962254, 1, 1, 1, 1, 1,
-0.6827498, 0.04149081, -2.682543, 1, 1, 1, 1, 1,
-0.6809105, 0.1784415, -3.270569, 1, 1, 1, 1, 1,
-0.6759455, 0.06993499, 0.1252248, 1, 1, 1, 1, 1,
-0.6714636, 0.8542585, -0.008071132, 1, 1, 1, 1, 1,
-0.6648247, 0.8532649, 0.4525607, 1, 1, 1, 1, 1,
-0.6610683, -0.6013969, -2.349699, 1, 1, 1, 1, 1,
-0.6539485, -1.502975, -2.150492, 1, 1, 1, 1, 1,
-0.6502779, -0.5995289, -1.476633, 0, 0, 1, 1, 1,
-0.6475768, -0.8780667, -2.864642, 1, 0, 0, 1, 1,
-0.6473511, -0.721893, -1.607891, 1, 0, 0, 1, 1,
-0.6465222, -0.1338408, -2.399722, 1, 0, 0, 1, 1,
-0.6446536, -0.6653539, 0.08118429, 1, 0, 0, 1, 1,
-0.6434498, -1.130944, -2.235934, 1, 0, 0, 1, 1,
-0.6408626, -1.762587, -5.607858, 0, 0, 0, 1, 1,
-0.6337743, 1.313214, 0.1481141, 0, 0, 0, 1, 1,
-0.631643, 1.806666, -0.2224001, 0, 0, 0, 1, 1,
-0.6268792, -0.06273176, -2.483278, 0, 0, 0, 1, 1,
-0.6250562, -0.6552113, -2.140017, 0, 0, 0, 1, 1,
-0.6216941, -0.8590253, -1.688687, 0, 0, 0, 1, 1,
-0.6206357, -1.648806, -1.599823, 0, 0, 0, 1, 1,
-0.619226, -0.2502638, -3.102268, 1, 1, 1, 1, 1,
-0.6149281, -1.278535, -4.059665, 1, 1, 1, 1, 1,
-0.6130628, 1.202184, 0.9596153, 1, 1, 1, 1, 1,
-0.6065934, 0.4816107, -2.1717, 1, 1, 1, 1, 1,
-0.6010194, 1.662168, -0.857194, 1, 1, 1, 1, 1,
-0.5967748, 0.1660832, -0.8247619, 1, 1, 1, 1, 1,
-0.5952925, 1.660538, 0.3114251, 1, 1, 1, 1, 1,
-0.5910913, -0.2572604, -2.176986, 1, 1, 1, 1, 1,
-0.589854, -0.9148592, -2.84364, 1, 1, 1, 1, 1,
-0.5865849, 1.16813, 0.8116312, 1, 1, 1, 1, 1,
-0.5817817, -0.4301791, -1.841866, 1, 1, 1, 1, 1,
-0.5742285, 0.5378911, -2.220551, 1, 1, 1, 1, 1,
-0.5685781, -1.209394, -2.660739, 1, 1, 1, 1, 1,
-0.5676701, -0.1046547, -1.561957, 1, 1, 1, 1, 1,
-0.5660918, 1.126957, -0.1984382, 1, 1, 1, 1, 1,
-0.5656191, -0.7726136, -2.084851, 0, 0, 1, 1, 1,
-0.564692, -0.9905851, -1.431803, 1, 0, 0, 1, 1,
-0.5643752, -0.3307172, -1.657693, 1, 0, 0, 1, 1,
-0.561535, -0.2265573, -3.296791, 1, 0, 0, 1, 1,
-0.5609899, 0.1911302, 0.7322492, 1, 0, 0, 1, 1,
-0.5600749, -0.6846411, -5.908532, 1, 0, 0, 1, 1,
-0.5593569, 1.127562, -0.8835836, 0, 0, 0, 1, 1,
-0.5566364, 0.335177, -1.457186, 0, 0, 0, 1, 1,
-0.5550466, -0.5312674, -1.364347, 0, 0, 0, 1, 1,
-0.5543004, -0.1702027, -0.3623643, 0, 0, 0, 1, 1,
-0.5482242, 0.2287747, -1.158435, 0, 0, 0, 1, 1,
-0.5460938, -0.3494619, -1.223783, 0, 0, 0, 1, 1,
-0.5458831, -0.5053844, -3.316705, 0, 0, 0, 1, 1,
-0.544477, 0.2730597, -0.6517947, 1, 1, 1, 1, 1,
-0.5435116, -1.019671, -2.594834, 1, 1, 1, 1, 1,
-0.5378591, 0.1374721, -2.247465, 1, 1, 1, 1, 1,
-0.5314127, -1.108187, -2.995759, 1, 1, 1, 1, 1,
-0.5245857, 1.704037, -1.317403, 1, 1, 1, 1, 1,
-0.5217219, -2.462818, -4.319404, 1, 1, 1, 1, 1,
-0.518747, 1.531225, 0.2107504, 1, 1, 1, 1, 1,
-0.513859, 0.3544158, -1.764335, 1, 1, 1, 1, 1,
-0.5127105, 0.3354146, -1.13338, 1, 1, 1, 1, 1,
-0.5069637, 0.4626218, -0.5955405, 1, 1, 1, 1, 1,
-0.5033724, -1.626148, -2.903461, 1, 1, 1, 1, 1,
-0.4970859, -1.395508, -3.676893, 1, 1, 1, 1, 1,
-0.4968686, 0.8583813, -0.3596927, 1, 1, 1, 1, 1,
-0.4962767, -0.2791397, -3.387267, 1, 1, 1, 1, 1,
-0.4953047, -0.3268208, -4.606369, 1, 1, 1, 1, 1,
-0.4945528, 0.6782237, -0.894675, 0, 0, 1, 1, 1,
-0.4942943, 0.1755455, -1.149844, 1, 0, 0, 1, 1,
-0.4940355, -1.406323, -2.732466, 1, 0, 0, 1, 1,
-0.4907852, -1.539846, -2.438609, 1, 0, 0, 1, 1,
-0.4831629, -0.01817787, -1.323893, 1, 0, 0, 1, 1,
-0.4829714, 2.471922, -0.1173983, 1, 0, 0, 1, 1,
-0.4828855, 0.8083433, -0.3621116, 0, 0, 0, 1, 1,
-0.481419, 1.438289, -2.68916, 0, 0, 0, 1, 1,
-0.480023, 0.8279317, -1.758451, 0, 0, 0, 1, 1,
-0.4732809, 1.145811, 0.9207757, 0, 0, 0, 1, 1,
-0.4659857, 0.4653057, 0.1263194, 0, 0, 0, 1, 1,
-0.4653217, 0.9127049, -1.377824, 0, 0, 0, 1, 1,
-0.4583261, 0.4543564, -0.3181086, 0, 0, 0, 1, 1,
-0.4564833, -0.04802205, -3.297478, 1, 1, 1, 1, 1,
-0.4544372, 1.667447, -0.2219618, 1, 1, 1, 1, 1,
-0.4532046, -0.9230872, -2.027479, 1, 1, 1, 1, 1,
-0.4524269, -2.284307, -3.292957, 1, 1, 1, 1, 1,
-0.4469638, -0.7145421, -3.901518, 1, 1, 1, 1, 1,
-0.4447125, 0.3261011, -0.9603996, 1, 1, 1, 1, 1,
-0.4424798, 1.050443, -0.8335577, 1, 1, 1, 1, 1,
-0.4418453, 0.6689334, -0.7616392, 1, 1, 1, 1, 1,
-0.4389972, 1.161895, -0.605922, 1, 1, 1, 1, 1,
-0.4351812, -0.625325, -2.78995, 1, 1, 1, 1, 1,
-0.43369, 0.3927166, 0.5536078, 1, 1, 1, 1, 1,
-0.4296368, 0.4782809, -2.794567, 1, 1, 1, 1, 1,
-0.4273476, -0.2853075, -1.672159, 1, 1, 1, 1, 1,
-0.4229626, 0.6214256, -0.9852265, 1, 1, 1, 1, 1,
-0.4227984, -0.3595639, -0.1848, 1, 1, 1, 1, 1,
-0.4195839, -1.420886, -4.620711, 0, 0, 1, 1, 1,
-0.4187903, -0.02241668, -2.937317, 1, 0, 0, 1, 1,
-0.4100002, -0.3334342, -4.553384, 1, 0, 0, 1, 1,
-0.4097215, -1.953435, -1.391924, 1, 0, 0, 1, 1,
-0.397716, 0.07022122, -2.009686, 1, 0, 0, 1, 1,
-0.3933186, 0.6673471, 1.219317, 1, 0, 0, 1, 1,
-0.3922162, 1.027428, -0.6719151, 0, 0, 0, 1, 1,
-0.387457, -0.8364946, -3.594244, 0, 0, 0, 1, 1,
-0.3857883, 0.1372712, -1.452446, 0, 0, 0, 1, 1,
-0.3834293, 0.3805643, -0.6397257, 0, 0, 0, 1, 1,
-0.3798167, 1.22485, 0.1735781, 0, 0, 0, 1, 1,
-0.3770514, 0.9590126, -1.378168, 0, 0, 0, 1, 1,
-0.3721929, 1.056492, 0.005793993, 0, 0, 0, 1, 1,
-0.3695946, -0.2021031, -2.138704, 1, 1, 1, 1, 1,
-0.3617255, 1.290753, -0.3612315, 1, 1, 1, 1, 1,
-0.3590224, 2.235791, -0.2642531, 1, 1, 1, 1, 1,
-0.3579886, -0.1387867, -1.517608, 1, 1, 1, 1, 1,
-0.356841, 0.7751928, -0.2959159, 1, 1, 1, 1, 1,
-0.3559698, -0.2391201, -3.232153, 1, 1, 1, 1, 1,
-0.3559319, 0.07467883, -2.817536, 1, 1, 1, 1, 1,
-0.3555107, -0.8158719, -2.351828, 1, 1, 1, 1, 1,
-0.3549099, 0.4683077, -0.6751869, 1, 1, 1, 1, 1,
-0.3535694, 0.3985981, -0.04465482, 1, 1, 1, 1, 1,
-0.350274, 0.2112088, -0.02186232, 1, 1, 1, 1, 1,
-0.347538, 0.2711126, -0.4592779, 1, 1, 1, 1, 1,
-0.3432406, -1.003312, -2.036616, 1, 1, 1, 1, 1,
-0.3417126, -0.727986, -5.327893, 1, 1, 1, 1, 1,
-0.3412287, 1.166297, -2.221799, 1, 1, 1, 1, 1,
-0.3409152, 0.8807801, 0.2944989, 0, 0, 1, 1, 1,
-0.3390384, -0.7831091, -0.803877, 1, 0, 0, 1, 1,
-0.3355761, 1.255497, 0.7125207, 1, 0, 0, 1, 1,
-0.332871, 1.158723, -0.7262252, 1, 0, 0, 1, 1,
-0.3317105, -1.954287, -3.554856, 1, 0, 0, 1, 1,
-0.3313379, -1.053197, -3.726496, 1, 0, 0, 1, 1,
-0.3265899, 1.600827, -0.4720463, 0, 0, 0, 1, 1,
-0.3221002, -0.1071216, -0.8475365, 0, 0, 0, 1, 1,
-0.3165089, 0.8176827, -0.6226491, 0, 0, 0, 1, 1,
-0.3133221, -0.05219711, -1.463037, 0, 0, 0, 1, 1,
-0.3120821, 0.684852, 0.893988, 0, 0, 0, 1, 1,
-0.3119363, -0.5014747, -2.856639, 0, 0, 0, 1, 1,
-0.310284, 0.3575948, -2.095575, 0, 0, 0, 1, 1,
-0.3077668, 2.716034, -0.03379242, 1, 1, 1, 1, 1,
-0.2961663, 0.02142227, -2.636948, 1, 1, 1, 1, 1,
-0.2922141, -0.4230288, -2.946742, 1, 1, 1, 1, 1,
-0.2916494, 1.869573, -1.724231, 1, 1, 1, 1, 1,
-0.2914461, 2.364562, -0.2503354, 1, 1, 1, 1, 1,
-0.2913672, 2.024501, -0.3738141, 1, 1, 1, 1, 1,
-0.2905464, -1.380264, -1.982111, 1, 1, 1, 1, 1,
-0.2895279, -0.5208713, -0.7007635, 1, 1, 1, 1, 1,
-0.2797856, 0.3171543, -0.3425231, 1, 1, 1, 1, 1,
-0.2784435, -0.8836505, -4.666949, 1, 1, 1, 1, 1,
-0.2766199, 0.1864265, -1.227272, 1, 1, 1, 1, 1,
-0.2756166, -0.1882632, -2.512995, 1, 1, 1, 1, 1,
-0.2751629, 0.7403437, -1.027979, 1, 1, 1, 1, 1,
-0.2740614, 0.5757671, -0.1116902, 1, 1, 1, 1, 1,
-0.2704568, 0.5569634, 0.2697954, 1, 1, 1, 1, 1,
-0.2681393, -0.7022193, -4.518288, 0, 0, 1, 1, 1,
-0.2654115, 0.9333676, -0.3603753, 1, 0, 0, 1, 1,
-0.2652477, 0.4844637, -0.8229239, 1, 0, 0, 1, 1,
-0.2648917, 0.9178356, 0.9030576, 1, 0, 0, 1, 1,
-0.2642166, 0.7532622, -0.2427026, 1, 0, 0, 1, 1,
-0.2610861, 0.9690045, 0.5005667, 1, 0, 0, 1, 1,
-0.2575902, 0.4798659, 0.02441226, 0, 0, 0, 1, 1,
-0.2563769, -0.5987255, -3.421607, 0, 0, 0, 1, 1,
-0.2526639, -0.8459883, -1.221036, 0, 0, 0, 1, 1,
-0.2509567, 1.093192, -1.474517, 0, 0, 0, 1, 1,
-0.2478536, 2.105346, -1.033403, 0, 0, 0, 1, 1,
-0.245337, 0.4480454, -0.001341977, 0, 0, 0, 1, 1,
-0.2438437, 0.6648911, -0.2777268, 0, 0, 0, 1, 1,
-0.2434694, 0.9046211, -0.7897617, 1, 1, 1, 1, 1,
-0.2409622, 0.1816183, -2.005688, 1, 1, 1, 1, 1,
-0.2409369, 0.3756098, 0.8237932, 1, 1, 1, 1, 1,
-0.2388579, -1.296764, -3.413449, 1, 1, 1, 1, 1,
-0.2350695, 0.9455889, 0.2964707, 1, 1, 1, 1, 1,
-0.2331636, 0.5771248, -0.5106274, 1, 1, 1, 1, 1,
-0.2301414, 0.05959868, -2.435173, 1, 1, 1, 1, 1,
-0.2294482, -1.552343, -4.008058, 1, 1, 1, 1, 1,
-0.2215096, 0.2223363, -0.2502862, 1, 1, 1, 1, 1,
-0.2204892, 1.134388, -0.8314444, 1, 1, 1, 1, 1,
-0.2184255, 1.300129, 0.681419, 1, 1, 1, 1, 1,
-0.213161, 1.929889, 0.3227222, 1, 1, 1, 1, 1,
-0.2094437, 1.421902, -2.550155, 1, 1, 1, 1, 1,
-0.2085677, 0.3068651, -2.564688, 1, 1, 1, 1, 1,
-0.2040592, -0.05947761, -1.579695, 1, 1, 1, 1, 1,
-0.1957041, -1.205877, -3.460824, 0, 0, 1, 1, 1,
-0.19421, -1.48145, -2.68156, 1, 0, 0, 1, 1,
-0.1921952, 0.00143319, -2.236852, 1, 0, 0, 1, 1,
-0.1918474, 1.508307, -0.9294521, 1, 0, 0, 1, 1,
-0.1912627, 1.015791, 1.352035, 1, 0, 0, 1, 1,
-0.1908469, 0.9903865, -0.1340355, 1, 0, 0, 1, 1,
-0.1881547, -1.085731, -2.888053, 0, 0, 0, 1, 1,
-0.1871142, 0.5046756, -0.3239278, 0, 0, 0, 1, 1,
-0.1859649, 0.3970763, 1.865109, 0, 0, 0, 1, 1,
-0.1843599, -0.9361782, -3.500292, 0, 0, 0, 1, 1,
-0.1839155, 1.599138, -1.256111, 0, 0, 0, 1, 1,
-0.1833172, -0.1485784, -3.924721, 0, 0, 0, 1, 1,
-0.1801698, 0.8838127, 0.6093462, 0, 0, 0, 1, 1,
-0.1762605, 0.1021049, -1.699366, 1, 1, 1, 1, 1,
-0.1744878, -0.7049753, -1.935638, 1, 1, 1, 1, 1,
-0.1708723, -0.1019326, -3.444926, 1, 1, 1, 1, 1,
-0.1692391, -0.3060894, -1.075763, 1, 1, 1, 1, 1,
-0.164249, 1.014723, -0.6719362, 1, 1, 1, 1, 1,
-0.1629974, 0.08327723, -3.709772, 1, 1, 1, 1, 1,
-0.158616, -0.636769, -3.321667, 1, 1, 1, 1, 1,
-0.1516678, -0.722865, -1.960098, 1, 1, 1, 1, 1,
-0.1442527, 0.8810881, -0.1774159, 1, 1, 1, 1, 1,
-0.1430094, -0.4722395, -2.306346, 1, 1, 1, 1, 1,
-0.1426912, -0.9977962, -2.766505, 1, 1, 1, 1, 1,
-0.139568, 0.1024967, -3.346368, 1, 1, 1, 1, 1,
-0.1383556, -1.844684, -3.162519, 1, 1, 1, 1, 1,
-0.1381973, -0.1031919, -1.717555, 1, 1, 1, 1, 1,
-0.1375448, -1.660785, -3.250075, 1, 1, 1, 1, 1,
-0.1356564, -0.3943752, -0.1337503, 0, 0, 1, 1, 1,
-0.1337297, -0.0663517, -0.9999769, 1, 0, 0, 1, 1,
-0.1336829, 0.1384698, -1.713275, 1, 0, 0, 1, 1,
-0.1297016, 0.6884378, -0.6077718, 1, 0, 0, 1, 1,
-0.1293413, -2.112515, -2.088992, 1, 0, 0, 1, 1,
-0.1285805, 0.6979567, 1.266523, 1, 0, 0, 1, 1,
-0.124792, -1.871332, -2.769642, 0, 0, 0, 1, 1,
-0.1202579, -0.3304702, -2.72286, 0, 0, 0, 1, 1,
-0.1154288, 0.5380132, 0.5724012, 0, 0, 0, 1, 1,
-0.1121207, -0.5830081, -2.386936, 0, 0, 0, 1, 1,
-0.1118593, 1.530553, -1.128852, 0, 0, 0, 1, 1,
-0.1111125, 0.3850008, -0.2153409, 0, 0, 0, 1, 1,
-0.1104586, 0.4885626, -0.2398032, 0, 0, 0, 1, 1,
-0.1096801, -1.440933, -2.984114, 1, 1, 1, 1, 1,
-0.1076152, 1.442398, -1.083064, 1, 1, 1, 1, 1,
-0.1062627, 1.404804, 0.5331351, 1, 1, 1, 1, 1,
-0.1046774, 0.7968178, 0.423802, 1, 1, 1, 1, 1,
-0.1016988, 0.03828957, -1.90726, 1, 1, 1, 1, 1,
-0.1009926, 1.736911, -0.8766562, 1, 1, 1, 1, 1,
-0.09441242, -0.2844424, -0.7413378, 1, 1, 1, 1, 1,
-0.09350293, 0.4537899, 0.1684745, 1, 1, 1, 1, 1,
-0.09130719, 0.2760547, -0.2763612, 1, 1, 1, 1, 1,
-0.09044273, -0.1545378, -2.314716, 1, 1, 1, 1, 1,
-0.08904608, 0.02267762, -0.03205384, 1, 1, 1, 1, 1,
-0.08791505, -0.4331037, -2.301349, 1, 1, 1, 1, 1,
-0.08731592, 0.6816766, 0.2894153, 1, 1, 1, 1, 1,
-0.08055586, -0.4673505, -2.546518, 1, 1, 1, 1, 1,
-0.07889058, -0.5849808, -4.370625, 1, 1, 1, 1, 1,
-0.07625029, -0.3614781, -4.7723, 0, 0, 1, 1, 1,
-0.0759398, -0.4845644, -1.648764, 1, 0, 0, 1, 1,
-0.07538348, 0.3819117, 1.532659, 1, 0, 0, 1, 1,
-0.07368185, 1.130558, 0.7860437, 1, 0, 0, 1, 1,
-0.06786647, 0.05658485, 0.311561, 1, 0, 0, 1, 1,
-0.06068946, -0.4139157, -4.366428, 1, 0, 0, 1, 1,
-0.05818209, 0.7689889, -0.4430414, 0, 0, 0, 1, 1,
-0.05806679, -0.3042415, -3.870534, 0, 0, 0, 1, 1,
-0.04316418, 0.7680354, -0.5379443, 0, 0, 0, 1, 1,
-0.04268885, 0.2156127, 0.2644216, 0, 0, 0, 1, 1,
-0.03978194, -0.5801971, -2.691425, 0, 0, 0, 1, 1,
-0.03504082, -1.112583, -3.268317, 0, 0, 0, 1, 1,
-0.03414725, -0.3517756, -4.50703, 0, 0, 0, 1, 1,
-0.0327647, 0.1627323, -0.07644214, 1, 1, 1, 1, 1,
-0.0311826, 1.661152, -0.4114689, 1, 1, 1, 1, 1,
-0.03044194, 2.527601, -0.7240571, 1, 1, 1, 1, 1,
-0.02953113, -0.1468769, -4.711104, 1, 1, 1, 1, 1,
-0.02858633, 2.256466, -0.2689319, 1, 1, 1, 1, 1,
-0.02318015, -0.4625042, -3.357552, 1, 1, 1, 1, 1,
-0.02057269, 0.5074681, -0.3386484, 1, 1, 1, 1, 1,
-0.01869833, 1.71708, -0.8479551, 1, 1, 1, 1, 1,
-0.01773114, 1.329559, -1.361729, 1, 1, 1, 1, 1,
-0.01706668, 1.011222, -0.1960459, 1, 1, 1, 1, 1,
-0.01603222, 1.870314, 0.648747, 1, 1, 1, 1, 1,
-0.01578048, 0.5508976, 1.23677, 1, 1, 1, 1, 1,
-0.01443121, -1.510952, -3.495921, 1, 1, 1, 1, 1,
-0.01274714, -0.3004537, -1.738275, 1, 1, 1, 1, 1,
-0.01033938, -0.5313591, -2.171121, 1, 1, 1, 1, 1,
-0.01007144, -0.1310063, -4.357985, 0, 0, 1, 1, 1,
-0.006026974, 0.4205821, 1.575742, 1, 0, 0, 1, 1,
-0.00545906, 0.007857878, -0.9521049, 1, 0, 0, 1, 1,
-0.0009691241, 1.378019, 1.088702, 1, 0, 0, 1, 1,
0.0008713112, -0.5185622, 4.453027, 1, 0, 0, 1, 1,
0.001003374, 0.2872925, -0.9665512, 1, 0, 0, 1, 1,
0.001301912, -0.8187978, 3.203347, 0, 0, 0, 1, 1,
0.002678903, 0.1513361, 0.5772878, 0, 0, 0, 1, 1,
0.003361246, 2.114277, 0.4306936, 0, 0, 0, 1, 1,
0.009031399, 0.8702123, 0.7474467, 0, 0, 0, 1, 1,
0.01021738, 0.1602527, -0.05604554, 0, 0, 0, 1, 1,
0.01394537, 1.534584, -0.5984253, 0, 0, 0, 1, 1,
0.01612527, -0.6210386, 1.520563, 0, 0, 0, 1, 1,
0.01753515, -0.6880629, 2.555275, 1, 1, 1, 1, 1,
0.01971848, 1.198948, -0.9303748, 1, 1, 1, 1, 1,
0.02042866, -0.04030333, 3.148984, 1, 1, 1, 1, 1,
0.0207354, -1.656653, 1.580521, 1, 1, 1, 1, 1,
0.022833, 0.3831457, -0.5913754, 1, 1, 1, 1, 1,
0.0263287, -0.9971506, 0.2496835, 1, 1, 1, 1, 1,
0.02759723, -0.9026957, 3.539092, 1, 1, 1, 1, 1,
0.03000946, -0.3194254, 2.609239, 1, 1, 1, 1, 1,
0.03015429, -1.004257, 1.961379, 1, 1, 1, 1, 1,
0.03457278, 0.7914342, 0.1050719, 1, 1, 1, 1, 1,
0.03780375, 0.4532073, -1.859139, 1, 1, 1, 1, 1,
0.04259182, 0.1780397, -1.4565, 1, 1, 1, 1, 1,
0.04367547, 1.635957, -0.7733974, 1, 1, 1, 1, 1,
0.04453285, -1.713332, 3.986734, 1, 1, 1, 1, 1,
0.04596986, 0.5952959, 0.702759, 1, 1, 1, 1, 1,
0.04628868, 1.126008, 0.1889101, 0, 0, 1, 1, 1,
0.04788256, 0.6061705, 1.033842, 1, 0, 0, 1, 1,
0.05291844, -1.72703, 3.833479, 1, 0, 0, 1, 1,
0.05342367, -0.5906889, 3.230435, 1, 0, 0, 1, 1,
0.05354563, 1.234716, 0.3879361, 1, 0, 0, 1, 1,
0.05724028, 0.7841753, -0.06199844, 1, 0, 0, 1, 1,
0.05842576, -0.1292126, 4.19236, 0, 0, 0, 1, 1,
0.06257915, 0.8722776, 1.274777, 0, 0, 0, 1, 1,
0.06297397, 0.5191528, -0.6695592, 0, 0, 0, 1, 1,
0.06653593, 1.064599, -0.3901087, 0, 0, 0, 1, 1,
0.07185031, 1.097196, 1.166381, 0, 0, 0, 1, 1,
0.07253839, 0.9653783, 0.5873477, 0, 0, 0, 1, 1,
0.07329313, -1.048908, 2.788194, 0, 0, 0, 1, 1,
0.07741555, -0.2106748, 2.613161, 1, 1, 1, 1, 1,
0.07786308, 0.1391601, 0.3917936, 1, 1, 1, 1, 1,
0.08012757, -0.1459693, 4.656875, 1, 1, 1, 1, 1,
0.08300366, -2.334717, 1.054756, 1, 1, 1, 1, 1,
0.09172533, -2.076633, 1.452545, 1, 1, 1, 1, 1,
0.09606504, -0.5436112, 1.48088, 1, 1, 1, 1, 1,
0.09877718, 0.925162, 0.5973091, 1, 1, 1, 1, 1,
0.1012061, 2.547818, 1.079008, 1, 1, 1, 1, 1,
0.102266, -0.5064894, 2.751313, 1, 1, 1, 1, 1,
0.1056637, -0.2070284, 1.7765, 1, 1, 1, 1, 1,
0.107802, -0.4880544, 3.142164, 1, 1, 1, 1, 1,
0.1099215, -0.4363935, 2.203455, 1, 1, 1, 1, 1,
0.1157262, -1.70508, 2.17407, 1, 1, 1, 1, 1,
0.1165809, -0.8839019, 4.185672, 1, 1, 1, 1, 1,
0.1170195, -0.6381317, 2.277224, 1, 1, 1, 1, 1,
0.1179893, 0.8444979, 0.1759988, 0, 0, 1, 1, 1,
0.1248543, -0.1859915, 2.394071, 1, 0, 0, 1, 1,
0.1325752, -0.6714906, 3.079237, 1, 0, 0, 1, 1,
0.1329095, -0.5680678, 1.716755, 1, 0, 0, 1, 1,
0.1350935, 0.4235357, -1.497283, 1, 0, 0, 1, 1,
0.1353681, -1.063153, 3.067218, 1, 0, 0, 1, 1,
0.1369645, 0.808635, -0.02325159, 0, 0, 0, 1, 1,
0.1402291, 0.6786579, 0.2838823, 0, 0, 0, 1, 1,
0.1431341, 0.1135689, 0.9998585, 0, 0, 0, 1, 1,
0.1460664, 0.5792498, -0.9936154, 0, 0, 0, 1, 1,
0.1512028, 1.424589, -0.3708378, 0, 0, 0, 1, 1,
0.1545266, -0.5651063, 3.140835, 0, 0, 0, 1, 1,
0.1573801, 1.189302, 0.06758148, 0, 0, 0, 1, 1,
0.1575993, 0.1669828, 1.849568, 1, 1, 1, 1, 1,
0.1576475, 0.5147058, -1.210233, 1, 1, 1, 1, 1,
0.1609917, -0.7037464, 2.123352, 1, 1, 1, 1, 1,
0.1611591, 0.6672311, -0.7115711, 1, 1, 1, 1, 1,
0.1613099, -0.9854923, 2.657466, 1, 1, 1, 1, 1,
0.1623252, -0.5909264, 2.523399, 1, 1, 1, 1, 1,
0.1644296, -1.734396, 2.072978, 1, 1, 1, 1, 1,
0.166778, 0.3644572, 1.408246, 1, 1, 1, 1, 1,
0.172529, 0.6122699, -0.5635089, 1, 1, 1, 1, 1,
0.1731995, 1.340374, 0.01581661, 1, 1, 1, 1, 1,
0.1740819, 0.2971626, 0.9778159, 1, 1, 1, 1, 1,
0.17431, 0.9025006, -1.478465, 1, 1, 1, 1, 1,
0.1800994, -1.61777, 2.107542, 1, 1, 1, 1, 1,
0.1816533, 0.1853301, 0.9716226, 1, 1, 1, 1, 1,
0.1828128, -0.4473324, 4.626617, 1, 1, 1, 1, 1,
0.1849958, 0.5604241, -0.2275527, 0, 0, 1, 1, 1,
0.1887863, 1.441263, 0.01769997, 1, 0, 0, 1, 1,
0.1926135, -0.8298149, 3.315495, 1, 0, 0, 1, 1,
0.1929289, 0.843321, -0.429434, 1, 0, 0, 1, 1,
0.2024355, -1.455464, 2.405451, 1, 0, 0, 1, 1,
0.203083, -0.729278, 4.196712, 1, 0, 0, 1, 1,
0.2081415, -0.127999, 1.018745, 0, 0, 0, 1, 1,
0.2087354, -0.5543489, 4.026098, 0, 0, 0, 1, 1,
0.2089542, -0.0127747, 1.259071, 0, 0, 0, 1, 1,
0.2103736, 0.6566851, -1.256493, 0, 0, 0, 1, 1,
0.2106517, -0.06037249, 0.8555793, 0, 0, 0, 1, 1,
0.2122054, 0.1677849, 1.15971, 0, 0, 0, 1, 1,
0.212405, 0.8680238, 0.06910104, 0, 0, 0, 1, 1,
0.2129257, 1.014446, -0.5735899, 1, 1, 1, 1, 1,
0.2157196, -1.386462, 2.075794, 1, 1, 1, 1, 1,
0.2162168, -0.4280168, 3.892836, 1, 1, 1, 1, 1,
0.2175235, 0.8828013, -1.811844, 1, 1, 1, 1, 1,
0.2206589, -0.2389563, 3.725039, 1, 1, 1, 1, 1,
0.2218534, 0.3820369, -0.5187312, 1, 1, 1, 1, 1,
0.2256283, 0.3231858, 0.4781345, 1, 1, 1, 1, 1,
0.230594, 0.8621907, -0.3647155, 1, 1, 1, 1, 1,
0.2319418, -0.5286468, 3.511473, 1, 1, 1, 1, 1,
0.234806, 0.8034511, -0.03676762, 1, 1, 1, 1, 1,
0.2388743, -0.4146066, 2.171669, 1, 1, 1, 1, 1,
0.2394576, 1.501485, 0.8572441, 1, 1, 1, 1, 1,
0.2489579, -0.02234339, 0.450099, 1, 1, 1, 1, 1,
0.2514513, -2.482904, 2.613693, 1, 1, 1, 1, 1,
0.2556123, -0.6469192, 1.667778, 1, 1, 1, 1, 1,
0.2587586, 0.2981699, 1.876402, 0, 0, 1, 1, 1,
0.2639832, -1.045722, 4.801012, 1, 0, 0, 1, 1,
0.2641274, 0.5972079, 1.107767, 1, 0, 0, 1, 1,
0.2681473, 0.4201565, 1.067183, 1, 0, 0, 1, 1,
0.2721816, 0.03818664, 1.30402, 1, 0, 0, 1, 1,
0.2726377, -0.2759182, 1.673708, 1, 0, 0, 1, 1,
0.2781252, 0.5186769, 0.1702979, 0, 0, 0, 1, 1,
0.2806906, -1.054356, 3.200549, 0, 0, 0, 1, 1,
0.2820234, 0.8054534, 1.524001, 0, 0, 0, 1, 1,
0.283007, -0.389996, 3.511237, 0, 0, 0, 1, 1,
0.2836254, 0.3822403, 1.287636, 0, 0, 0, 1, 1,
0.2849158, -0.7094067, 1.516845, 0, 0, 0, 1, 1,
0.2886592, -1.043502, 1.013725, 0, 0, 0, 1, 1,
0.2892767, -0.5033472, 2.941572, 1, 1, 1, 1, 1,
0.2901153, -0.529841, 4.091313, 1, 1, 1, 1, 1,
0.2913344, 1.217915, 1.592998, 1, 1, 1, 1, 1,
0.2935655, -0.8207652, 0.8794609, 1, 1, 1, 1, 1,
0.2943955, -1.656535, 3.851739, 1, 1, 1, 1, 1,
0.2952986, -0.3689139, 2.580589, 1, 1, 1, 1, 1,
0.2968213, 1.307337, 2.061935, 1, 1, 1, 1, 1,
0.3052427, 0.03372203, 1.228509, 1, 1, 1, 1, 1,
0.3054834, 1.530221, 0.218264, 1, 1, 1, 1, 1,
0.3081094, -0.4123837, 3.914964, 1, 1, 1, 1, 1,
0.3094722, 0.5226219, 0.2274008, 1, 1, 1, 1, 1,
0.3120863, 0.97966, 0.2450232, 1, 1, 1, 1, 1,
0.3149789, -0.507935, 2.425087, 1, 1, 1, 1, 1,
0.3160304, -1.081447, 1.633253, 1, 1, 1, 1, 1,
0.3181719, 0.7065134, 1.003107, 1, 1, 1, 1, 1,
0.3200983, -0.6644962, 2.26634, 0, 0, 1, 1, 1,
0.3217695, 0.06540099, 3.740613, 1, 0, 0, 1, 1,
0.3230818, -2.393905, 2.221725, 1, 0, 0, 1, 1,
0.3233339, 0.6478912, 2.067025, 1, 0, 0, 1, 1,
0.3257656, 1.276812, 1.724538, 1, 0, 0, 1, 1,
0.3278082, -0.5755529, 3.878449, 1, 0, 0, 1, 1,
0.3304281, -0.8968595, 3.054839, 0, 0, 0, 1, 1,
0.3305242, 0.37607, -1.174856, 0, 0, 0, 1, 1,
0.3325644, 0.2760099, 1.943139, 0, 0, 0, 1, 1,
0.3326365, -0.04147319, 2.937596, 0, 0, 0, 1, 1,
0.3333878, 1.0251, -0.8087099, 0, 0, 0, 1, 1,
0.334824, -1.953428, 2.394439, 0, 0, 0, 1, 1,
0.3361075, 1.279977, 0.4561981, 0, 0, 0, 1, 1,
0.3427714, 0.4027216, 1.749009, 1, 1, 1, 1, 1,
0.3462345, -1.345462, 1.077622, 1, 1, 1, 1, 1,
0.3527051, -1.7228, 3.161359, 1, 1, 1, 1, 1,
0.3578886, -0.9708688, 3.332566, 1, 1, 1, 1, 1,
0.3615635, -1.022081, 2.156473, 1, 1, 1, 1, 1,
0.3631998, -0.7771732, 1.470429, 1, 1, 1, 1, 1,
0.3679393, 0.2680031, -0.8621308, 1, 1, 1, 1, 1,
0.3690234, -0.6659015, 3.985878, 1, 1, 1, 1, 1,
0.3694801, 0.8347768, -1.455232, 1, 1, 1, 1, 1,
0.3740197, -2.285886, 3.605235, 1, 1, 1, 1, 1,
0.3777164, -0.3841311, 1.083729, 1, 1, 1, 1, 1,
0.3821517, 0.6892097, 1.040481, 1, 1, 1, 1, 1,
0.3865401, -1.261975, 4.446298, 1, 1, 1, 1, 1,
0.3892352, -0.816241, 3.379331, 1, 1, 1, 1, 1,
0.3927753, 0.0850974, -0.3299673, 1, 1, 1, 1, 1,
0.3959428, -0.3065497, 0.9496625, 0, 0, 1, 1, 1,
0.3982402, -1.479489, 2.546804, 1, 0, 0, 1, 1,
0.398467, -1.662201, 2.29802, 1, 0, 0, 1, 1,
0.4028759, -1.095129, 2.904924, 1, 0, 0, 1, 1,
0.4044956, -0.8305577, 3.071671, 1, 0, 0, 1, 1,
0.4078695, -0.2734492, 1.076221, 1, 0, 0, 1, 1,
0.4079807, -1.564947, 3.486259, 0, 0, 0, 1, 1,
0.421353, 0.3617243, -0.5006995, 0, 0, 0, 1, 1,
0.4272545, 1.037048, -2.062715, 0, 0, 0, 1, 1,
0.4371, -0.09006279, 1.259773, 0, 0, 0, 1, 1,
0.4380952, -1.149257, 1.304076, 0, 0, 0, 1, 1,
0.4391093, 0.1905043, 0.2467526, 0, 0, 0, 1, 1,
0.4408861, 1.794766, 2.754309, 0, 0, 0, 1, 1,
0.440964, 0.5825993, -0.2251233, 1, 1, 1, 1, 1,
0.4409775, -0.3451159, 2.510046, 1, 1, 1, 1, 1,
0.4416515, -0.1373059, 2.972864, 1, 1, 1, 1, 1,
0.4421504, -0.2971189, 1.238525, 1, 1, 1, 1, 1,
0.4422557, 1.490474, 0.6985149, 1, 1, 1, 1, 1,
0.4425426, 0.7218301, 0.6081487, 1, 1, 1, 1, 1,
0.444856, 0.1859625, 2.550468, 1, 1, 1, 1, 1,
0.4491928, -0.1921904, 1.310622, 1, 1, 1, 1, 1,
0.4556436, -0.3442267, 1.968742, 1, 1, 1, 1, 1,
0.4589639, -1.187481, 3.27293, 1, 1, 1, 1, 1,
0.4597885, -1.55287, 1.70452, 1, 1, 1, 1, 1,
0.4603044, -0.6803777, 2.678777, 1, 1, 1, 1, 1,
0.4626783, 0.1878915, 2.384535, 1, 1, 1, 1, 1,
0.4719591, 0.1077393, 0.9831228, 1, 1, 1, 1, 1,
0.473159, -0.1920743, -0.04429104, 1, 1, 1, 1, 1,
0.4789479, -1.142647, 4.201549, 0, 0, 1, 1, 1,
0.4790846, 1.0139, 0.0238842, 1, 0, 0, 1, 1,
0.4791901, -1.238449, 1.843226, 1, 0, 0, 1, 1,
0.4824619, -0.6414135, 1.706134, 1, 0, 0, 1, 1,
0.4841638, -0.1226083, 3.186071, 1, 0, 0, 1, 1,
0.4864683, 0.7643942, 0.9303465, 1, 0, 0, 1, 1,
0.4877089, 0.1676801, 0.607173, 0, 0, 0, 1, 1,
0.4894126, -0.8434991, 3.921413, 0, 0, 0, 1, 1,
0.4925588, -1.482585, 1.105185, 0, 0, 0, 1, 1,
0.4938017, 1.15263, 1.338111, 0, 0, 0, 1, 1,
0.4950361, 2.514013, 1.183174, 0, 0, 0, 1, 1,
0.5003418, -0.249253, 2.738099, 0, 0, 0, 1, 1,
0.5084122, 1.314008, 0.4754461, 0, 0, 0, 1, 1,
0.5091692, -0.004260736, 1.832113, 1, 1, 1, 1, 1,
0.5095177, -1.137076, 2.842927, 1, 1, 1, 1, 1,
0.5165991, 0.4813169, 0.1082088, 1, 1, 1, 1, 1,
0.524047, 0.6565802, 0.6416908, 1, 1, 1, 1, 1,
0.5246819, 0.9410337, 1.03077, 1, 1, 1, 1, 1,
0.5271317, -0.2072362, 3.469502, 1, 1, 1, 1, 1,
0.5283947, 1.336758, -0.6730285, 1, 1, 1, 1, 1,
0.5312719, -0.5348423, 2.509331, 1, 1, 1, 1, 1,
0.5336044, -0.5206295, 2.404728, 1, 1, 1, 1, 1,
0.5352548, 0.5345958, 1.19183, 1, 1, 1, 1, 1,
0.5393965, -1.80649, 2.274655, 1, 1, 1, 1, 1,
0.5464622, -0.9068847, 3.511628, 1, 1, 1, 1, 1,
0.5470748, 1.59708, 0.4822168, 1, 1, 1, 1, 1,
0.5519239, 0.4478802, 2.197717, 1, 1, 1, 1, 1,
0.5532011, 0.8084088, 2.03508, 1, 1, 1, 1, 1,
0.5594857, -0.1982455, 2.32623, 0, 0, 1, 1, 1,
0.5674659, 0.0762584, 1.71096, 1, 0, 0, 1, 1,
0.5716774, 0.1584522, 0.8455188, 1, 0, 0, 1, 1,
0.5739543, -1.83497, 2.827274, 1, 0, 0, 1, 1,
0.5823511, -0.8126637, 3.067586, 1, 0, 0, 1, 1,
0.5870823, 0.09295956, 0.3708433, 1, 0, 0, 1, 1,
0.5883989, -0.4440884, 2.519097, 0, 0, 0, 1, 1,
0.5893989, -0.009809699, 2.1313, 0, 0, 0, 1, 1,
0.5899554, 1.321192, 0.6227441, 0, 0, 0, 1, 1,
0.5937756, -0.5200691, 0.6842034, 0, 0, 0, 1, 1,
0.5996312, -0.1668963, 2.031169, 0, 0, 0, 1, 1,
0.6050301, 0.1707395, 1.914288, 0, 0, 0, 1, 1,
0.6052904, -0.1761367, 3.422113, 0, 0, 0, 1, 1,
0.6069598, 0.5827254, 1.205314, 1, 1, 1, 1, 1,
0.6075865, 1.009397, 0.8861769, 1, 1, 1, 1, 1,
0.6080949, 0.3232907, 1.401555, 1, 1, 1, 1, 1,
0.6120849, 0.7742019, -0.339567, 1, 1, 1, 1, 1,
0.6193445, 1.254785, 2.801555, 1, 1, 1, 1, 1,
0.6207471, -1.496124, 1.971994, 1, 1, 1, 1, 1,
0.6301443, -0.4981966, 2.126565, 1, 1, 1, 1, 1,
0.6309105, 0.7269685, 1.611727, 1, 1, 1, 1, 1,
0.6341897, 1.784008, -0.7703548, 1, 1, 1, 1, 1,
0.6376647, -0.2840084, 1.288428, 1, 1, 1, 1, 1,
0.6438607, -0.6923499, 1.287135, 1, 1, 1, 1, 1,
0.6458344, 0.1846894, -0.6460102, 1, 1, 1, 1, 1,
0.6489286, 0.7120724, -0.5655429, 1, 1, 1, 1, 1,
0.6507595, 0.3668724, 0.407826, 1, 1, 1, 1, 1,
0.6515058, 1.123584, 0.659964, 1, 1, 1, 1, 1,
0.6535055, 0.01349132, 2.613065, 0, 0, 1, 1, 1,
0.6581233, 0.2096398, 0.6806049, 1, 0, 0, 1, 1,
0.6637306, 0.1554419, 1.640253, 1, 0, 0, 1, 1,
0.6652644, -0.004534707, 1.691377, 1, 0, 0, 1, 1,
0.6702326, 0.6399742, 1.018941, 1, 0, 0, 1, 1,
0.6776971, -0.3011709, 0.005425477, 1, 0, 0, 1, 1,
0.6830856, 0.9775845, 1.022544, 0, 0, 0, 1, 1,
0.6879113, 0.9318715, 0.05308051, 0, 0, 0, 1, 1,
0.6906222, 0.8499771, -0.1608055, 0, 0, 0, 1, 1,
0.6933653, -0.8142795, 3.627256, 0, 0, 0, 1, 1,
0.6945371, 0.494035, 1.165027, 0, 0, 0, 1, 1,
0.6973593, 0.8403333, 0.4030077, 0, 0, 0, 1, 1,
0.6996714, 1.083989, 1.297837, 0, 0, 0, 1, 1,
0.7056963, 1.816128, -1.03229, 1, 1, 1, 1, 1,
0.7079375, -2.142131, 0.9643228, 1, 1, 1, 1, 1,
0.7084506, 0.71876, 1.152628, 1, 1, 1, 1, 1,
0.709877, 0.7581128, 0.3223868, 1, 1, 1, 1, 1,
0.7098896, 1.401147, -0.02876868, 1, 1, 1, 1, 1,
0.7177183, 1.366645, 0.6806847, 1, 1, 1, 1, 1,
0.7181072, 1.012631, 2.472743, 1, 1, 1, 1, 1,
0.719614, 0.9270741, 1.391357, 1, 1, 1, 1, 1,
0.7255642, 0.2210299, 2.683477, 1, 1, 1, 1, 1,
0.7284079, -1.451652, 3.182209, 1, 1, 1, 1, 1,
0.7303591, -1.248103, 2.691693, 1, 1, 1, 1, 1,
0.7313119, 0.6400793, 1.527179, 1, 1, 1, 1, 1,
0.7333615, -0.9556741, 2.342151, 1, 1, 1, 1, 1,
0.7338845, -1.286149, 2.976386, 1, 1, 1, 1, 1,
0.7346815, 0.7402424, -0.8434641, 1, 1, 1, 1, 1,
0.7355798, 2.094033, -0.1679835, 0, 0, 1, 1, 1,
0.7391103, 1.293922, -0.5702503, 1, 0, 0, 1, 1,
0.7392598, -0.1714856, 1.292677, 1, 0, 0, 1, 1,
0.7444122, -1.257803, 0.856414, 1, 0, 0, 1, 1,
0.7514656, 0.842991, 1.617388, 1, 0, 0, 1, 1,
0.75471, -1.083358, 1.195018, 1, 0, 0, 1, 1,
0.7661815, -0.1650244, 3.690317, 0, 0, 0, 1, 1,
0.7713068, 0.2829241, 2.679131, 0, 0, 0, 1, 1,
0.7725319, 0.0001102119, 3.196658, 0, 0, 0, 1, 1,
0.7827805, 1.106342, 1.368281, 0, 0, 0, 1, 1,
0.7845632, -0.4744697, 1.085108, 0, 0, 0, 1, 1,
0.7858909, -0.4017065, 1.422213, 0, 0, 0, 1, 1,
0.788893, 0.9527961, 1.129045, 0, 0, 0, 1, 1,
0.7897661, 0.4417449, 2.182275, 1, 1, 1, 1, 1,
0.7903875, 0.4294712, 0.6257739, 1, 1, 1, 1, 1,
0.7913288, -1.32555, 1.090563, 1, 1, 1, 1, 1,
0.7973933, 1.081578, 1.664939, 1, 1, 1, 1, 1,
0.7980392, -0.3203704, 4.056619, 1, 1, 1, 1, 1,
0.8003537, -0.05270685, 3.088932, 1, 1, 1, 1, 1,
0.8012671, -1.170143, 0.7321087, 1, 1, 1, 1, 1,
0.8033164, 1.248861, 0.003035868, 1, 1, 1, 1, 1,
0.8041904, -0.7912347, 2.195166, 1, 1, 1, 1, 1,
0.8091035, 0.4206748, -0.8289734, 1, 1, 1, 1, 1,
0.8152821, 3.058273, -0.5267323, 1, 1, 1, 1, 1,
0.8248653, 0.117704, 0.3927056, 1, 1, 1, 1, 1,
0.8258535, -0.941604, 3.505993, 1, 1, 1, 1, 1,
0.8309191, 0.2519423, 1.57075, 1, 1, 1, 1, 1,
0.8343915, 0.9900588, -0.09786232, 1, 1, 1, 1, 1,
0.8345149, -0.6649695, 1.134637, 0, 0, 1, 1, 1,
0.8428275, -0.3006796, 1.325959, 1, 0, 0, 1, 1,
0.8444458, -0.6058838, 1.898722, 1, 0, 0, 1, 1,
0.8456919, 0.8978582, 1.135452, 1, 0, 0, 1, 1,
0.8499631, 0.2258709, 2.918594, 1, 0, 0, 1, 1,
0.8501174, -0.02051505, 1.699212, 1, 0, 0, 1, 1,
0.8514885, -0.08006247, 1.550439, 0, 0, 0, 1, 1,
0.8550746, 1.322848, 0.6958663, 0, 0, 0, 1, 1,
0.8579929, -0.3446482, 1.726748, 0, 0, 0, 1, 1,
0.8655452, 1.124499, -0.1995248, 0, 0, 0, 1, 1,
0.8666226, -1.748337, 3.546949, 0, 0, 0, 1, 1,
0.8676294, -0.4515327, 3.399741, 0, 0, 0, 1, 1,
0.8707529, -0.9893143, 2.866845, 0, 0, 0, 1, 1,
0.8797482, -0.7442047, 4.840845, 1, 1, 1, 1, 1,
0.8866975, -0.168574, 0.2682283, 1, 1, 1, 1, 1,
0.8876485, 0.9973267, -0.1951198, 1, 1, 1, 1, 1,
0.8884597, -0.5536826, 2.763138, 1, 1, 1, 1, 1,
0.8919326, -0.2786675, 3.222118, 1, 1, 1, 1, 1,
0.8939331, 1.243524, 0.1965652, 1, 1, 1, 1, 1,
0.9038067, 2.496051, -1.267387, 1, 1, 1, 1, 1,
0.9060138, -0.9998206, 1.138369, 1, 1, 1, 1, 1,
0.9096003, 1.943253, -0.2170513, 1, 1, 1, 1, 1,
0.9099037, 0.2666894, 2.358458, 1, 1, 1, 1, 1,
0.9123017, 0.03812325, 2.133332, 1, 1, 1, 1, 1,
0.9154594, -1.156235, 3.93197, 1, 1, 1, 1, 1,
0.9160659, 1.231186, 1.003356, 1, 1, 1, 1, 1,
0.9211086, 0.335297, 2.587677, 1, 1, 1, 1, 1,
0.9240674, 0.9886237, -0.2094756, 1, 1, 1, 1, 1,
0.9258279, 0.255378, 1.847888, 0, 0, 1, 1, 1,
0.9399715, -0.4695274, 3.447071, 1, 0, 0, 1, 1,
0.9459035, 0.3236224, 0.9686938, 1, 0, 0, 1, 1,
0.9498357, -0.4875557, 2.392245, 1, 0, 0, 1, 1,
0.9500722, -0.5436814, 1.22783, 1, 0, 0, 1, 1,
0.9524415, -2.67402, 1.959766, 1, 0, 0, 1, 1,
0.9546641, -0.8330036, 1.013361, 0, 0, 0, 1, 1,
0.9562689, 1.94953, 0.9497656, 0, 0, 0, 1, 1,
0.9563329, -0.7278113, 1.116208, 0, 0, 0, 1, 1,
0.9727333, -0.8083116, 2.361179, 0, 0, 0, 1, 1,
0.9738098, 1.376473, 2.811847, 0, 0, 0, 1, 1,
0.9777756, -0.3967517, 1.365068, 0, 0, 0, 1, 1,
0.9825003, -1.143553, 2.463711, 0, 0, 0, 1, 1,
0.983964, 0.8890027, 0.6061252, 1, 1, 1, 1, 1,
0.9865031, 0.8402278, 2.384006, 1, 1, 1, 1, 1,
0.9928252, -0.5420539, 3.217542, 1, 1, 1, 1, 1,
0.9933044, 0.6876026, 0.1289645, 1, 1, 1, 1, 1,
0.9985945, -0.2957612, 2.514901, 1, 1, 1, 1, 1,
1.00188, -0.1584772, 1.12046, 1, 1, 1, 1, 1,
1.00309, -0.5320401, 2.327178, 1, 1, 1, 1, 1,
1.003835, 0.636126, 1.499155, 1, 1, 1, 1, 1,
1.007672, 1.216627, -0.1814442, 1, 1, 1, 1, 1,
1.01078, 0.6531932, 0.1449854, 1, 1, 1, 1, 1,
1.021829, 0.04731568, 1.503529, 1, 1, 1, 1, 1,
1.024125, -1.07219, 3.019162, 1, 1, 1, 1, 1,
1.025096, -0.5999779, 2.659526, 1, 1, 1, 1, 1,
1.035198, -1.089359, 1.258299, 1, 1, 1, 1, 1,
1.035842, -0.1131584, 0.6739404, 1, 1, 1, 1, 1,
1.036496, -1.880243, 2.107029, 0, 0, 1, 1, 1,
1.039297, -2.313318, 0.3359714, 1, 0, 0, 1, 1,
1.039663, 0.3058096, 1.694093, 1, 0, 0, 1, 1,
1.047639, 0.8480484, 0.5431162, 1, 0, 0, 1, 1,
1.060615, 0.9060096, 0.4069795, 1, 0, 0, 1, 1,
1.061269, 0.004155341, 0.5041889, 1, 0, 0, 1, 1,
1.064147, -0.7862664, 3.374659, 0, 0, 0, 1, 1,
1.064622, 0.361879, 1.325312, 0, 0, 0, 1, 1,
1.087921, 0.4844024, 1.748419, 0, 0, 0, 1, 1,
1.091367, -1.266077, 3.764699, 0, 0, 0, 1, 1,
1.091489, 1.129737, 1.229375, 0, 0, 0, 1, 1,
1.098147, 0.61822, 1.22687, 0, 0, 0, 1, 1,
1.100918, 1.165075, -0.0557255, 0, 0, 0, 1, 1,
1.105798, 2.142443, 0.1602357, 1, 1, 1, 1, 1,
1.107591, 0.2084671, 0.9733428, 1, 1, 1, 1, 1,
1.117055, -0.470536, 0.6148278, 1, 1, 1, 1, 1,
1.133374, 0.3870004, 1.575916, 1, 1, 1, 1, 1,
1.134137, 0.8640371, 1.869173, 1, 1, 1, 1, 1,
1.135833, 0.7039254, 1.212533, 1, 1, 1, 1, 1,
1.140793, 1.004701, 2.073936, 1, 1, 1, 1, 1,
1.141818, 0.7349182, 0.7333083, 1, 1, 1, 1, 1,
1.142078, -1.778954, 3.400245, 1, 1, 1, 1, 1,
1.143839, -0.01969982, 1.821467, 1, 1, 1, 1, 1,
1.151066, -0.5695117, 2.774436, 1, 1, 1, 1, 1,
1.153556, -1.773967, 1.659681, 1, 1, 1, 1, 1,
1.160481, -0.8626178, 1.67098, 1, 1, 1, 1, 1,
1.18384, 0.5811316, -0.967467, 1, 1, 1, 1, 1,
1.189703, 0.6260699, 0.06626478, 1, 1, 1, 1, 1,
1.199341, 0.06724021, 0.6097096, 0, 0, 1, 1, 1,
1.205228, -0.3060061, 0.5870826, 1, 0, 0, 1, 1,
1.210982, 0.3885379, -0.2512513, 1, 0, 0, 1, 1,
1.211693, -0.7663918, 0.7119594, 1, 0, 0, 1, 1,
1.215306, -0.003736303, 0.5462752, 1, 0, 0, 1, 1,
1.22405, -0.6689289, 2.594669, 1, 0, 0, 1, 1,
1.226262, -0.02500893, 2.693628, 0, 0, 0, 1, 1,
1.229529, -0.2949936, 3.013579, 0, 0, 0, 1, 1,
1.229607, 0.7289524, 1.870676, 0, 0, 0, 1, 1,
1.232617, -2.555891, 3.881964, 0, 0, 0, 1, 1,
1.233543, -1.296813, 0.5746788, 0, 0, 0, 1, 1,
1.234961, -2.240686, 1.837503, 0, 0, 0, 1, 1,
1.24473, -1.648361, 1.129398, 0, 0, 0, 1, 1,
1.247448, -0.8724879, 1.937867, 1, 1, 1, 1, 1,
1.249329, -0.6451155, 2.629151, 1, 1, 1, 1, 1,
1.254884, 0.722409, 2.750679, 1, 1, 1, 1, 1,
1.260589, 0.4297286, 0.680096, 1, 1, 1, 1, 1,
1.261706, 0.3462234, 1.149295, 1, 1, 1, 1, 1,
1.270497, -0.6136341, 2.303758, 1, 1, 1, 1, 1,
1.306028, -0.6173012, 2.861359, 1, 1, 1, 1, 1,
1.313202, 1.051333, 1.20844, 1, 1, 1, 1, 1,
1.313562, 0.1965939, 0.09008374, 1, 1, 1, 1, 1,
1.315309, 0.4719332, 0.3643202, 1, 1, 1, 1, 1,
1.317249, -1.330504, 0.8214338, 1, 1, 1, 1, 1,
1.330051, 1.625694, -0.1291813, 1, 1, 1, 1, 1,
1.333212, 0.7406941, 0.6511558, 1, 1, 1, 1, 1,
1.334285, -1.072136, 2.951495, 1, 1, 1, 1, 1,
1.350563, -0.06627866, 1.611291, 1, 1, 1, 1, 1,
1.354239, -0.3018945, 2.065802, 0, 0, 1, 1, 1,
1.356268, -0.9505689, 2.565138, 1, 0, 0, 1, 1,
1.359977, -0.1022358, 1.619712, 1, 0, 0, 1, 1,
1.362661, 0.729926, -0.6961608, 1, 0, 0, 1, 1,
1.362895, -0.3656469, 2.13386, 1, 0, 0, 1, 1,
1.365207, 0.6829971, 2.845244, 1, 0, 0, 1, 1,
1.376281, 1.039928, 0.5714745, 0, 0, 0, 1, 1,
1.382151, -0.02612279, 1.836757, 0, 0, 0, 1, 1,
1.389699, 0.2589783, 3.213168, 0, 0, 0, 1, 1,
1.392194, 0.6171044, 2.032389, 0, 0, 0, 1, 1,
1.392444, -0.5388296, 0.834037, 0, 0, 0, 1, 1,
1.393901, -0.05815102, 0.9497648, 0, 0, 0, 1, 1,
1.396897, 2.958202, -1.523191, 0, 0, 0, 1, 1,
1.406802, -0.4666608, 1.096572, 1, 1, 1, 1, 1,
1.415219, -0.6340859, 1.562984, 1, 1, 1, 1, 1,
1.420202, -1.236436, 2.935308, 1, 1, 1, 1, 1,
1.424645, -1.08187, 2.417384, 1, 1, 1, 1, 1,
1.426643, -0.4585825, 1.722775, 1, 1, 1, 1, 1,
1.431706, 0.6796554, 0.2529123, 1, 1, 1, 1, 1,
1.452162, 0.140843, 0.3804072, 1, 1, 1, 1, 1,
1.452889, -0.03198175, 1.498135, 1, 1, 1, 1, 1,
1.455056, 1.623061, 0.4796324, 1, 1, 1, 1, 1,
1.45907, 0.5872037, 1.757027, 1, 1, 1, 1, 1,
1.46084, -0.1511143, 1.648847, 1, 1, 1, 1, 1,
1.474234, 0.7486307, 0.3659621, 1, 1, 1, 1, 1,
1.474592, -1.450518, 1.412694, 1, 1, 1, 1, 1,
1.484928, -1.235147, 0.9230985, 1, 1, 1, 1, 1,
1.510478, -0.3528279, 3.057028, 1, 1, 1, 1, 1,
1.524816, -0.9123621, 1.533872, 0, 0, 1, 1, 1,
1.529936, -0.02202038, 0.3470578, 1, 0, 0, 1, 1,
1.540142, 1.538824, 1.362767, 1, 0, 0, 1, 1,
1.541806, -1.46958, 2.254601, 1, 0, 0, 1, 1,
1.548811, -1.30039, 1.748768, 1, 0, 0, 1, 1,
1.558624, 0.274875, 1.375656, 1, 0, 0, 1, 1,
1.590647, -1.2552, 1.464581, 0, 0, 0, 1, 1,
1.603404, 0.3449169, 1.633751, 0, 0, 0, 1, 1,
1.607099, -0.09721205, -0.003011903, 0, 0, 0, 1, 1,
1.612251, 0.7397433, 1.111202, 0, 0, 0, 1, 1,
1.638301, -0.2198786, -0.5851571, 0, 0, 0, 1, 1,
1.646173, -0.6342044, 2.000934, 0, 0, 0, 1, 1,
1.657274, 0.3192671, 1.73539, 0, 0, 0, 1, 1,
1.672159, -2.269637, 2.465592, 1, 1, 1, 1, 1,
1.674197, -0.9116436, 0.9757748, 1, 1, 1, 1, 1,
1.6811, 0.7858043, 0.9366181, 1, 1, 1, 1, 1,
1.699087, 1.857492, 2.656235, 1, 1, 1, 1, 1,
1.745781, 0.9391873, 0.8276338, 1, 1, 1, 1, 1,
1.760694, -0.0948751, 1.009236, 1, 1, 1, 1, 1,
1.779386, 2.342096, 0.08656264, 1, 1, 1, 1, 1,
1.781384, -0.8099961, 4.786624, 1, 1, 1, 1, 1,
1.782098, -0.8759269, 1.90381, 1, 1, 1, 1, 1,
1.797679, 0.5878243, 2.203532, 1, 1, 1, 1, 1,
1.798105, 0.2822166, 1.273607, 1, 1, 1, 1, 1,
1.814951, 1.206153, 0.6429623, 1, 1, 1, 1, 1,
1.835679, -0.6357993, 3.195363, 1, 1, 1, 1, 1,
1.888329, 1.080431, 0.9460405, 1, 1, 1, 1, 1,
1.908113, -1.045424, 2.33656, 1, 1, 1, 1, 1,
1.941223, 1.303367, 1.707064, 0, 0, 1, 1, 1,
1.946984, 0.489637, 0.1368244, 1, 0, 0, 1, 1,
1.969324, -1.225373, 1.537367, 1, 0, 0, 1, 1,
1.995337, 0.9845622, -0.2292369, 1, 0, 0, 1, 1,
2.051066, -0.3354216, -0.07865419, 1, 0, 0, 1, 1,
2.09442, -1.07065, 2.333797, 1, 0, 0, 1, 1,
2.096729, -0.5891135, 1.823597, 0, 0, 0, 1, 1,
2.09726, 0.2740142, 1.734638, 0, 0, 0, 1, 1,
2.113016, 0.1002565, 2.118689, 0, 0, 0, 1, 1,
2.132447, -1.055102, 2.455903, 0, 0, 0, 1, 1,
2.194522, 0.190373, 2.570393, 0, 0, 0, 1, 1,
2.200083, 1.037692, 0.8699639, 0, 0, 0, 1, 1,
2.252791, 0.8974833, -0.09511234, 0, 0, 0, 1, 1,
2.320201, 0.1382451, 2.184368, 1, 1, 1, 1, 1,
2.605533, -0.647135, 0.9867809, 1, 1, 1, 1, 1,
2.610772, 1.667761, 0.4511986, 1, 1, 1, 1, 1,
2.622193, -0.6019858, 3.049467, 1, 1, 1, 1, 1,
2.957941, 0.5289909, 1.164435, 1, 1, 1, 1, 1,
3.052498, 1.550532, -0.7286478, 1, 1, 1, 1, 1,
3.11411, -0.6286951, -0.3093893, 1, 1, 1, 1, 1
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
var radius = 9.660732;
var distance = 33.93291;
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
mvMatrix.translate( -0.1045566, 0.4604485, 0.5338433 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.93291);
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
