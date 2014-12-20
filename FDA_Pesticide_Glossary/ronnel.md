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
-3.154026, -1.234271, 0.009364553, 1, 0, 0, 1,
-3.096122, 0.951917, -2.102482, 1, 0.007843138, 0, 1,
-3.039136, 1.015992, 0.6468109, 1, 0.01176471, 0, 1,
-2.902669, 0.7745795, -0.410707, 1, 0.01960784, 0, 1,
-2.868502, -0.6574304, -2.406543, 1, 0.02352941, 0, 1,
-2.863208, -0.08877882, -1.835079, 1, 0.03137255, 0, 1,
-2.809982, 0.01582904, -2.67939, 1, 0.03529412, 0, 1,
-2.777569, 1.985438, 0.6757883, 1, 0.04313726, 0, 1,
-2.611509, 0.9236902, -1.950413, 1, 0.04705882, 0, 1,
-2.608954, 0.5658779, -1.890509, 1, 0.05490196, 0, 1,
-2.49995, 1.551624, -0.6279731, 1, 0.05882353, 0, 1,
-2.433571, 1.316665, -0.9835069, 1, 0.06666667, 0, 1,
-2.386894, -1.087016, -2.699152, 1, 0.07058824, 0, 1,
-2.194867, -1.091307, -2.390644, 1, 0.07843138, 0, 1,
-2.16085, 0.5268921, -1.494395, 1, 0.08235294, 0, 1,
-2.151519, 1.29725, -1.254515, 1, 0.09019608, 0, 1,
-2.151, 0.6055775, -1.645793, 1, 0.09411765, 0, 1,
-2.107572, 2.544836, -1.781494, 1, 0.1019608, 0, 1,
-2.099209, 1.043115, -1.474878, 1, 0.1098039, 0, 1,
-2.082367, -1.126753, -4.290771, 1, 0.1137255, 0, 1,
-2.081098, 1.238636, -1.605771, 1, 0.1215686, 0, 1,
-2.064094, -0.2193818, -3.518776, 1, 0.1254902, 0, 1,
-2.063393, -0.6763387, -0.6490469, 1, 0.1333333, 0, 1,
-2.031379, -0.9546422, -3.005206, 1, 0.1372549, 0, 1,
-2.025302, -0.7373936, -1.286912, 1, 0.145098, 0, 1,
-2.022848, 1.832882, -2.720587, 1, 0.1490196, 0, 1,
-2.009525, -0.1037098, -2.112078, 1, 0.1568628, 0, 1,
-1.989617, -1.27546, -2.447718, 1, 0.1607843, 0, 1,
-1.964579, 0.1193601, -0.9229841, 1, 0.1686275, 0, 1,
-1.953433, -0.2283272, -2.592273, 1, 0.172549, 0, 1,
-1.929848, -0.2862205, -2.825621, 1, 0.1803922, 0, 1,
-1.924452, -1.473266, -2.63315, 1, 0.1843137, 0, 1,
-1.901185, -1.211764, -0.9332135, 1, 0.1921569, 0, 1,
-1.86904, 0.12544, -0.9664808, 1, 0.1960784, 0, 1,
-1.867055, -0.4541486, -1.293445, 1, 0.2039216, 0, 1,
-1.847275, 1.203259, 0.4053605, 1, 0.2117647, 0, 1,
-1.83486, 1.304023, -0.7148988, 1, 0.2156863, 0, 1,
-1.831941, 0.6976042, -1.446306, 1, 0.2235294, 0, 1,
-1.829097, -1.305338, -1.384858, 1, 0.227451, 0, 1,
-1.818362, -1.141228, 0.2419702, 1, 0.2352941, 0, 1,
-1.781559, -0.100332, -0.8180192, 1, 0.2392157, 0, 1,
-1.752801, -0.1027793, -1.426672, 1, 0.2470588, 0, 1,
-1.749878, -1.16956, -1.92443, 1, 0.2509804, 0, 1,
-1.732149, -1.101238, -2.405421, 1, 0.2588235, 0, 1,
-1.718221, -1.214378, -1.994476, 1, 0.2627451, 0, 1,
-1.716949, -0.5632118, -2.845578, 1, 0.2705882, 0, 1,
-1.707338, 0.227112, -1.780369, 1, 0.2745098, 0, 1,
-1.681967, -0.5988194, -2.450317, 1, 0.282353, 0, 1,
-1.68017, 2.101703, -1.074576, 1, 0.2862745, 0, 1,
-1.650712, -1.058849, -3.671346, 1, 0.2941177, 0, 1,
-1.64245, -0.2120863, -1.517293, 1, 0.3019608, 0, 1,
-1.639653, 0.532968, -1.391032, 1, 0.3058824, 0, 1,
-1.633243, -0.9201933, -2.659912, 1, 0.3137255, 0, 1,
-1.628987, -0.7757793, -0.7046945, 1, 0.3176471, 0, 1,
-1.619128, -1.61842, -1.810758, 1, 0.3254902, 0, 1,
-1.609839, -0.1401221, -3.79177, 1, 0.3294118, 0, 1,
-1.608353, -1.334106, -3.489047, 1, 0.3372549, 0, 1,
-1.606526, 0.01981041, -1.421594, 1, 0.3411765, 0, 1,
-1.574446, 1.697955, -0.004843091, 1, 0.3490196, 0, 1,
-1.5691, 1.373542, 0.4178815, 1, 0.3529412, 0, 1,
-1.552792, 0.3245518, -1.491794, 1, 0.3607843, 0, 1,
-1.550587, 0.3232763, -1.703888, 1, 0.3647059, 0, 1,
-1.545148, -0.9781963, -3.502555, 1, 0.372549, 0, 1,
-1.541788, 0.1007512, -2.939541, 1, 0.3764706, 0, 1,
-1.537073, -1.154535, -3.988137, 1, 0.3843137, 0, 1,
-1.530585, 0.4350745, -3.458072, 1, 0.3882353, 0, 1,
-1.519377, 0.6414814, -0.5759626, 1, 0.3960784, 0, 1,
-1.504902, 0.600578, -2.419052, 1, 0.4039216, 0, 1,
-1.492641, 0.6971996, -3.628476, 1, 0.4078431, 0, 1,
-1.490138, -0.5738998, -1.554827, 1, 0.4156863, 0, 1,
-1.461673, 0.5047256, -2.037769, 1, 0.4196078, 0, 1,
-1.448612, 0.7849547, -2.084135, 1, 0.427451, 0, 1,
-1.43868, -1.153818, -3.160148, 1, 0.4313726, 0, 1,
-1.437916, 1.391593, -0.2248308, 1, 0.4392157, 0, 1,
-1.437262, -0.9604307, -1.905774, 1, 0.4431373, 0, 1,
-1.434728, 0.6329005, 0.01566938, 1, 0.4509804, 0, 1,
-1.42156, -0.03588865, -2.319278, 1, 0.454902, 0, 1,
-1.419958, -0.08228882, -1.206477, 1, 0.4627451, 0, 1,
-1.398514, -0.5932196, -1.886725, 1, 0.4666667, 0, 1,
-1.398452, 1.790347, -0.5205972, 1, 0.4745098, 0, 1,
-1.392632, -0.106626, -0.9798732, 1, 0.4784314, 0, 1,
-1.389408, -1.008137, -1.936925, 1, 0.4862745, 0, 1,
-1.385913, -1.279112, -0.9384108, 1, 0.4901961, 0, 1,
-1.381886, -0.1972562, -2.14414, 1, 0.4980392, 0, 1,
-1.380113, -0.0851019, -1.23023, 1, 0.5058824, 0, 1,
-1.350118, -0.1187283, -2.672136, 1, 0.509804, 0, 1,
-1.343003, -0.6436607, -1.1638, 1, 0.5176471, 0, 1,
-1.335295, -1.294025, -4.06661, 1, 0.5215687, 0, 1,
-1.335192, -1.231343, -2.302349, 1, 0.5294118, 0, 1,
-1.331666, 0.4508644, -2.21694, 1, 0.5333334, 0, 1,
-1.329316, 1.361729, -1.552915, 1, 0.5411765, 0, 1,
-1.329063, 0.5528491, -2.368832, 1, 0.5450981, 0, 1,
-1.328188, -0.3353861, -1.340527, 1, 0.5529412, 0, 1,
-1.31759, -0.3943712, -2.124828, 1, 0.5568628, 0, 1,
-1.316662, 0.7891835, -1.162768, 1, 0.5647059, 0, 1,
-1.314212, -0.3878549, -1.374522, 1, 0.5686275, 0, 1,
-1.310191, 0.8940261, 0.02368568, 1, 0.5764706, 0, 1,
-1.304257, -0.07262862, 0.7024209, 1, 0.5803922, 0, 1,
-1.301617, -0.2158279, -2.407389, 1, 0.5882353, 0, 1,
-1.301005, -0.1482278, -2.50015, 1, 0.5921569, 0, 1,
-1.292621, -0.3299038, -5.027309, 1, 0.6, 0, 1,
-1.28988, 1.405918, -1.009967, 1, 0.6078432, 0, 1,
-1.28668, -0.03810115, -1.981829, 1, 0.6117647, 0, 1,
-1.282372, -0.6707662, -2.42019, 1, 0.6196079, 0, 1,
-1.281283, -1.756798, -2.709281, 1, 0.6235294, 0, 1,
-1.27982, 0.5107993, -1.772672, 1, 0.6313726, 0, 1,
-1.272194, -0.3792049, -2.495702, 1, 0.6352941, 0, 1,
-1.263782, 0.02913292, -0.4461329, 1, 0.6431373, 0, 1,
-1.259336, -0.3748884, -1.478671, 1, 0.6470588, 0, 1,
-1.252547, 0.6953847, 0.7659487, 1, 0.654902, 0, 1,
-1.252269, -1.632439, -2.326468, 1, 0.6588235, 0, 1,
-1.248283, 0.16676, -1.323045, 1, 0.6666667, 0, 1,
-1.2461, 1.074386, -1.666203, 1, 0.6705883, 0, 1,
-1.245027, 1.785792, -1.469602, 1, 0.6784314, 0, 1,
-1.23856, 2.35974, 0.2544675, 1, 0.682353, 0, 1,
-1.237879, 0.2340563, -1.870351, 1, 0.6901961, 0, 1,
-1.232113, 0.9834667, 0.03129428, 1, 0.6941177, 0, 1,
-1.225024, 0.1128222, -2.113293, 1, 0.7019608, 0, 1,
-1.223091, 0.2851247, -0.3310883, 1, 0.7098039, 0, 1,
-1.215826, 0.382479, -1.556407, 1, 0.7137255, 0, 1,
-1.208654, -0.7342965, -2.65258, 1, 0.7215686, 0, 1,
-1.206528, -0.7270029, -0.499004, 1, 0.7254902, 0, 1,
-1.202702, -0.7872923, -2.562814, 1, 0.7333333, 0, 1,
-1.195781, -1.882781, -1.914687, 1, 0.7372549, 0, 1,
-1.193351, -0.3891023, -2.968493, 1, 0.7450981, 0, 1,
-1.191798, -0.1128188, 0.03587313, 1, 0.7490196, 0, 1,
-1.190511, -0.3979276, -0.790205, 1, 0.7568628, 0, 1,
-1.189863, -0.2157794, -3.348097, 1, 0.7607843, 0, 1,
-1.18291, -0.351016, -2.248063, 1, 0.7686275, 0, 1,
-1.174952, 0.5053856, -1.363938, 1, 0.772549, 0, 1,
-1.164302, 0.02312476, -2.378964, 1, 0.7803922, 0, 1,
-1.163696, 1.180619, -0.3125046, 1, 0.7843137, 0, 1,
-1.162169, -0.9641384, -2.006024, 1, 0.7921569, 0, 1,
-1.16052, -0.3946755, -1.96024, 1, 0.7960784, 0, 1,
-1.160025, -0.9737469, -3.344638, 1, 0.8039216, 0, 1,
-1.152567, -0.008388831, -1.010686, 1, 0.8117647, 0, 1,
-1.146286, 1.805046, -0.8119695, 1, 0.8156863, 0, 1,
-1.145371, 0.6824456, -0.50047, 1, 0.8235294, 0, 1,
-1.138445, 0.633984, -2.348286, 1, 0.827451, 0, 1,
-1.136508, -1.220504, -1.475381, 1, 0.8352941, 0, 1,
-1.133777, -1.006442, -3.530789, 1, 0.8392157, 0, 1,
-1.128608, -0.04910813, -1.126968, 1, 0.8470588, 0, 1,
-1.122165, 0.289665, -1.211379, 1, 0.8509804, 0, 1,
-1.108174, -1.081143, -2.848, 1, 0.8588235, 0, 1,
-1.102809, -2.367417, -2.992182, 1, 0.8627451, 0, 1,
-1.101755, -0.3549013, -2.086504, 1, 0.8705882, 0, 1,
-1.092895, -2.174685, -3.253611, 1, 0.8745098, 0, 1,
-1.092824, -0.5873284, -3.128734, 1, 0.8823529, 0, 1,
-1.088946, 1.638423, 1.270332, 1, 0.8862745, 0, 1,
-1.082291, -1.195056, -3.418609, 1, 0.8941177, 0, 1,
-1.081198, -1.022726, -2.244932, 1, 0.8980392, 0, 1,
-1.078329, 0.9232984, -3.035192, 1, 0.9058824, 0, 1,
-1.078166, 0.1251568, -2.305969, 1, 0.9137255, 0, 1,
-1.07331, 0.1777646, -1.59487, 1, 0.9176471, 0, 1,
-1.071311, -0.6008162, -1.337418, 1, 0.9254902, 0, 1,
-1.054349, -2.009088, -2.605465, 1, 0.9294118, 0, 1,
-1.05205, -1.077574, -2.812099, 1, 0.9372549, 0, 1,
-1.049965, -0.9930469, -2.987611, 1, 0.9411765, 0, 1,
-1.049846, 0.707841, -0.4693469, 1, 0.9490196, 0, 1,
-1.04452, 1.996443, -0.7647127, 1, 0.9529412, 0, 1,
-1.037864, 0.6976217, 0.627645, 1, 0.9607843, 0, 1,
-1.035453, -0.6913898, -3.480825, 1, 0.9647059, 0, 1,
-1.033354, -1.250314, -1.958035, 1, 0.972549, 0, 1,
-1.028688, 0.9507382, -2.669299, 1, 0.9764706, 0, 1,
-1.026749, 0.6374259, -0.3572927, 1, 0.9843137, 0, 1,
-1.023258, -0.6381468, -1.231821, 1, 0.9882353, 0, 1,
-1.018933, 0.3643231, -2.018747, 1, 0.9960784, 0, 1,
-1.010282, 1.308661, -0.8479888, 0.9960784, 1, 0, 1,
-1.009167, 1.175361, 1.108577, 0.9921569, 1, 0, 1,
-0.9978023, 0.1242687, -1.60908, 0.9843137, 1, 0, 1,
-0.9928177, 1.517133, 0.1378369, 0.9803922, 1, 0, 1,
-0.9917486, 1.767522, 0.3179016, 0.972549, 1, 0, 1,
-0.9889585, -1.398111, -4.172175, 0.9686275, 1, 0, 1,
-0.9829709, 2.74861, 0.9564612, 0.9607843, 1, 0, 1,
-0.979255, 0.1393418, -1.489486, 0.9568627, 1, 0, 1,
-0.9778795, 0.02077525, 1.365417, 0.9490196, 1, 0, 1,
-0.9731649, -0.6780249, -1.614283, 0.945098, 1, 0, 1,
-0.9710306, -0.04120762, -1.752779, 0.9372549, 1, 0, 1,
-0.9666157, -0.3047523, -1.088925, 0.9333333, 1, 0, 1,
-0.9569891, 1.326064, -2.392789, 0.9254902, 1, 0, 1,
-0.9558124, 0.443971, -2.012959, 0.9215686, 1, 0, 1,
-0.9499621, -0.2116911, -1.884899, 0.9137255, 1, 0, 1,
-0.9482541, 0.2851227, -0.6463698, 0.9098039, 1, 0, 1,
-0.9479068, 1.206665, 2.592566, 0.9019608, 1, 0, 1,
-0.9383827, -0.9132873, -1.317806, 0.8941177, 1, 0, 1,
-0.9375411, 0.3229595, -2.236073, 0.8901961, 1, 0, 1,
-0.9347295, -2.038714, -2.102366, 0.8823529, 1, 0, 1,
-0.9330193, -0.1109037, -2.518636, 0.8784314, 1, 0, 1,
-0.9268507, -0.4046083, -4.134993, 0.8705882, 1, 0, 1,
-0.9229327, -0.6969795, -2.103579, 0.8666667, 1, 0, 1,
-0.9204226, 0.2452836, 0.3032022, 0.8588235, 1, 0, 1,
-0.9188045, -0.01543529, -1.833263, 0.854902, 1, 0, 1,
-0.912797, -0.8330285, -1.978958, 0.8470588, 1, 0, 1,
-0.9072214, -1.901864, -2.877535, 0.8431373, 1, 0, 1,
-0.9007565, 1.427389, -0.7910231, 0.8352941, 1, 0, 1,
-0.8961533, 0.4308278, -1.795213, 0.8313726, 1, 0, 1,
-0.894868, 0.1664568, -0.205228, 0.8235294, 1, 0, 1,
-0.885927, -0.3681229, -3.556039, 0.8196079, 1, 0, 1,
-0.8840993, -0.4319226, -2.070735, 0.8117647, 1, 0, 1,
-0.8836108, -0.3316169, -2.495562, 0.8078431, 1, 0, 1,
-0.8783513, 0.5574136, -2.673883, 0.8, 1, 0, 1,
-0.8764011, -0.1960041, -3.352206, 0.7921569, 1, 0, 1,
-0.8689089, 1.443876, -0.926611, 0.7882353, 1, 0, 1,
-0.8623603, -0.2686618, -3.067111, 0.7803922, 1, 0, 1,
-0.8572649, 1.35574, 0.9458441, 0.7764706, 1, 0, 1,
-0.8566896, -2.029923, -3.736645, 0.7686275, 1, 0, 1,
-0.8542324, 0.4531683, -2.557745, 0.7647059, 1, 0, 1,
-0.8499622, 0.5115734, -2.760052, 0.7568628, 1, 0, 1,
-0.8466767, 0.2558616, -0.9466698, 0.7529412, 1, 0, 1,
-0.8388295, 2.035021, -0.4031451, 0.7450981, 1, 0, 1,
-0.8278503, -2.004867, -3.126448, 0.7411765, 1, 0, 1,
-0.823038, 0.7397037, -0.3574484, 0.7333333, 1, 0, 1,
-0.8211315, 1.259333, -0.5776917, 0.7294118, 1, 0, 1,
-0.8147114, 0.8847849, -0.8847058, 0.7215686, 1, 0, 1,
-0.8109408, -0.8238962, -1.396467, 0.7176471, 1, 0, 1,
-0.8095093, 0.8633124, -0.7626557, 0.7098039, 1, 0, 1,
-0.8079485, 0.3157799, 0.08078638, 0.7058824, 1, 0, 1,
-0.8054633, 0.4774637, -1.869954, 0.6980392, 1, 0, 1,
-0.777756, 0.4953426, -1.433643, 0.6901961, 1, 0, 1,
-0.773939, 0.910565, -1.577006, 0.6862745, 1, 0, 1,
-0.7724906, -1.429377, -2.067793, 0.6784314, 1, 0, 1,
-0.7716667, 1.17176, -3.373061, 0.6745098, 1, 0, 1,
-0.76753, -0.4499313, -2.46899, 0.6666667, 1, 0, 1,
-0.7635503, 1.378261, -3.505672, 0.6627451, 1, 0, 1,
-0.7605937, 0.4291524, -0.3955473, 0.654902, 1, 0, 1,
-0.7602487, -0.132723, -3.718374, 0.6509804, 1, 0, 1,
-0.7600805, 0.6831037, 0.338376, 0.6431373, 1, 0, 1,
-0.7579278, -0.301661, -2.217646, 0.6392157, 1, 0, 1,
-0.7521877, 0.7833037, -0.0961514, 0.6313726, 1, 0, 1,
-0.7455686, -0.2439276, -1.995035, 0.627451, 1, 0, 1,
-0.7435337, -0.1410208, -1.983209, 0.6196079, 1, 0, 1,
-0.7398255, 0.07731557, -0.8545386, 0.6156863, 1, 0, 1,
-0.7379621, -0.7033315, -4.620961, 0.6078432, 1, 0, 1,
-0.7354149, -1.73098, -4.029582, 0.6039216, 1, 0, 1,
-0.7277176, -0.4785866, -2.435195, 0.5960785, 1, 0, 1,
-0.7255175, 0.3844513, -1.982112, 0.5882353, 1, 0, 1,
-0.7237484, 0.2292291, -2.940948, 0.5843138, 1, 0, 1,
-0.7146249, -0.1259451, -2.049284, 0.5764706, 1, 0, 1,
-0.7136084, 0.01962906, -2.854893, 0.572549, 1, 0, 1,
-0.7097693, -0.01867622, -0.7649412, 0.5647059, 1, 0, 1,
-0.708051, 0.5554758, -0.00422434, 0.5607843, 1, 0, 1,
-0.7067137, 0.1946553, -1.154205, 0.5529412, 1, 0, 1,
-0.7051694, 0.8816166, -1.629181, 0.5490196, 1, 0, 1,
-0.6961061, 1.072417, -1.81289, 0.5411765, 1, 0, 1,
-0.6955404, 0.2276797, -0.3914024, 0.5372549, 1, 0, 1,
-0.6954282, -0.5494487, -3.381634, 0.5294118, 1, 0, 1,
-0.6945928, -1.233928, -1.589119, 0.5254902, 1, 0, 1,
-0.6917393, -1.064515, -4.123257, 0.5176471, 1, 0, 1,
-0.6891072, -1.527718, -2.593609, 0.5137255, 1, 0, 1,
-0.687126, 0.02968856, -0.5780329, 0.5058824, 1, 0, 1,
-0.6863797, 0.2749325, -1.23299, 0.5019608, 1, 0, 1,
-0.6738109, 0.3235987, -1.566112, 0.4941176, 1, 0, 1,
-0.6611868, 1.056353, -2.562483, 0.4862745, 1, 0, 1,
-0.6587636, 0.1198176, -1.790652, 0.4823529, 1, 0, 1,
-0.6567895, 0.5514014, -0.9445827, 0.4745098, 1, 0, 1,
-0.6555368, -1.269777, -0.5969288, 0.4705882, 1, 0, 1,
-0.6545678, -1.005411, -2.479164, 0.4627451, 1, 0, 1,
-0.6525596, -0.2081001, -1.225252, 0.4588235, 1, 0, 1,
-0.6521342, 0.1818284, -0.292794, 0.4509804, 1, 0, 1,
-0.6491612, 1.293172, 0.930359, 0.4470588, 1, 0, 1,
-0.6464693, 0.549742, 0.2607654, 0.4392157, 1, 0, 1,
-0.6451531, 0.2478831, -1.148757, 0.4352941, 1, 0, 1,
-0.6350222, 0.2409928, -0.3046116, 0.427451, 1, 0, 1,
-0.6322894, -0.6251642, -3.151931, 0.4235294, 1, 0, 1,
-0.6312356, -0.4947647, -1.943383, 0.4156863, 1, 0, 1,
-0.6269758, 1.487146, -0.09911954, 0.4117647, 1, 0, 1,
-0.6268582, -2.126313, -2.807573, 0.4039216, 1, 0, 1,
-0.6264502, 0.6389081, -0.2528927, 0.3960784, 1, 0, 1,
-0.6216738, 0.861504, -1.94563, 0.3921569, 1, 0, 1,
-0.6209552, 1.213492, 0.860426, 0.3843137, 1, 0, 1,
-0.6193574, -0.3673168, -2.5054, 0.3803922, 1, 0, 1,
-0.6139763, -0.9314117, -3.546234, 0.372549, 1, 0, 1,
-0.6071783, -1.887692, -2.787977, 0.3686275, 1, 0, 1,
-0.6049134, 1.03201, -0.9812973, 0.3607843, 1, 0, 1,
-0.5992093, -1.157484, -2.900528, 0.3568628, 1, 0, 1,
-0.5924879, -1.247686, -2.465573, 0.3490196, 1, 0, 1,
-0.591894, -1.023474, -5.525113, 0.345098, 1, 0, 1,
-0.5903255, 1.271876, -1.365101, 0.3372549, 1, 0, 1,
-0.5826325, -1.240359, -3.317862, 0.3333333, 1, 0, 1,
-0.5770361, -0.5223334, -1.933773, 0.3254902, 1, 0, 1,
-0.5717251, 0.6574136, -1.96294, 0.3215686, 1, 0, 1,
-0.5625376, 1.492863, 0.1463124, 0.3137255, 1, 0, 1,
-0.5620935, -0.4546678, -1.939005, 0.3098039, 1, 0, 1,
-0.5589843, -1.457434, -1.560072, 0.3019608, 1, 0, 1,
-0.5577075, 0.06310014, -2.712031, 0.2941177, 1, 0, 1,
-0.5576515, 0.4212884, -3.195949, 0.2901961, 1, 0, 1,
-0.552917, 1.50922, -2.709704, 0.282353, 1, 0, 1,
-0.5523963, 0.9336001, -1.481219, 0.2784314, 1, 0, 1,
-0.54139, -0.7465571, -3.295631, 0.2705882, 1, 0, 1,
-0.536962, 1.149157, -3.013572, 0.2666667, 1, 0, 1,
-0.536345, -0.2958099, -2.6803, 0.2588235, 1, 0, 1,
-0.5343186, -0.2886658, -2.792806, 0.254902, 1, 0, 1,
-0.5317122, 0.5381386, -0.7896019, 0.2470588, 1, 0, 1,
-0.5312659, -0.5966158, -1.898376, 0.2431373, 1, 0, 1,
-0.528084, -1.065117, -3.974525, 0.2352941, 1, 0, 1,
-0.5265855, 0.1109462, -0.3458613, 0.2313726, 1, 0, 1,
-0.5214922, -0.9603185, -2.601849, 0.2235294, 1, 0, 1,
-0.5210053, 2.335158, 1.956155, 0.2196078, 1, 0, 1,
-0.5193096, 0.9993392, -0.8842407, 0.2117647, 1, 0, 1,
-0.5151588, 0.9360777, -2.394585, 0.2078431, 1, 0, 1,
-0.5138218, 0.1702807, 0.3233685, 0.2, 1, 0, 1,
-0.5129772, 1.331246, 0.1675708, 0.1921569, 1, 0, 1,
-0.5073685, 0.3457419, -0.06572662, 0.1882353, 1, 0, 1,
-0.5064112, -0.2651621, -2.702041, 0.1803922, 1, 0, 1,
-0.5036039, -0.4711033, -2.684851, 0.1764706, 1, 0, 1,
-0.501128, -0.7969465, -3.73849, 0.1686275, 1, 0, 1,
-0.498297, 0.7037485, -1.29019, 0.1647059, 1, 0, 1,
-0.4978829, 1.223262, 0.3199357, 0.1568628, 1, 0, 1,
-0.495001, 0.3430919, -1.34961, 0.1529412, 1, 0, 1,
-0.4921697, 2.759427, -0.979318, 0.145098, 1, 0, 1,
-0.4877964, 0.5388113, -1.699762, 0.1411765, 1, 0, 1,
-0.4800475, 0.5513922, -1.785578, 0.1333333, 1, 0, 1,
-0.4745402, -1.081533, -2.65432, 0.1294118, 1, 0, 1,
-0.4736702, 0.9338835, -2.323898, 0.1215686, 1, 0, 1,
-0.4724653, -0.5069705, -1.202362, 0.1176471, 1, 0, 1,
-0.4650063, 0.8083401, -0.2142997, 0.1098039, 1, 0, 1,
-0.464127, -0.05422367, -1.682855, 0.1058824, 1, 0, 1,
-0.4596919, -1.161791, -1.082011, 0.09803922, 1, 0, 1,
-0.4579299, 0.402384, -0.6626288, 0.09019608, 1, 0, 1,
-0.4560217, -1.144593, -2.5496, 0.08627451, 1, 0, 1,
-0.4558645, 0.934387, 0.2337859, 0.07843138, 1, 0, 1,
-0.4548557, 0.3663379, -0.9672775, 0.07450981, 1, 0, 1,
-0.4522288, 0.6697753, -1.044149, 0.06666667, 1, 0, 1,
-0.4508866, -1.611333, -2.712083, 0.0627451, 1, 0, 1,
-0.4504558, 1.447031, 0.2704119, 0.05490196, 1, 0, 1,
-0.4491937, 2.365596, 0.2373495, 0.05098039, 1, 0, 1,
-0.4484995, -0.248384, -2.386355, 0.04313726, 1, 0, 1,
-0.4447321, -1.16253, -3.863093, 0.03921569, 1, 0, 1,
-0.4441894, 0.266887, -0.1195116, 0.03137255, 1, 0, 1,
-0.4436452, 0.1055764, -2.911713, 0.02745098, 1, 0, 1,
-0.4386368, 0.06348502, -0.8636627, 0.01960784, 1, 0, 1,
-0.4383776, 1.37727, 0.5401373, 0.01568628, 1, 0, 1,
-0.4381221, 0.6407341, 0.03497184, 0.007843138, 1, 0, 1,
-0.4373561, -0.875888, -3.314279, 0.003921569, 1, 0, 1,
-0.4338627, -1.679404, -2.679661, 0, 1, 0.003921569, 1,
-0.4329913, 0.5431195, -0.9752503, 0, 1, 0.01176471, 1,
-0.4321006, -0.406802, -0.3041135, 0, 1, 0.01568628, 1,
-0.4317326, -0.5450065, -1.264914, 0, 1, 0.02352941, 1,
-0.4287303, -1.865343, -2.727917, 0, 1, 0.02745098, 1,
-0.4279791, -0.9806998, -1.235307, 0, 1, 0.03529412, 1,
-0.4267673, 0.3493343, -0.732699, 0, 1, 0.03921569, 1,
-0.4265836, -0.9160402, -3.776595, 0, 1, 0.04705882, 1,
-0.4248183, -0.5138589, -1.249448, 0, 1, 0.05098039, 1,
-0.4197988, -1.718491, -3.500379, 0, 1, 0.05882353, 1,
-0.4171666, -0.3711194, -3.246506, 0, 1, 0.0627451, 1,
-0.4146603, -0.5823529, -3.057806, 0, 1, 0.07058824, 1,
-0.4145336, -0.4288361, -3.317808, 0, 1, 0.07450981, 1,
-0.4144858, 0.4574026, -1.393725, 0, 1, 0.08235294, 1,
-0.4068761, -0.2640561, -3.541107, 0, 1, 0.08627451, 1,
-0.4017458, -1.136017, -2.874909, 0, 1, 0.09411765, 1,
-0.399287, -0.3472885, -4.377957, 0, 1, 0.1019608, 1,
-0.3903293, 0.1073401, -2.727756, 0, 1, 0.1058824, 1,
-0.3902815, -1.251963, -2.279472, 0, 1, 0.1137255, 1,
-0.3877613, -0.6776572, -2.649165, 0, 1, 0.1176471, 1,
-0.3875606, 0.6026964, -0.3012985, 0, 1, 0.1254902, 1,
-0.3873077, -1.046505, -0.4460288, 0, 1, 0.1294118, 1,
-0.3822501, 0.5036491, -0.6613577, 0, 1, 0.1372549, 1,
-0.3795784, 2.116551, -0.7618751, 0, 1, 0.1411765, 1,
-0.3778261, 0.07420862, -1.787906, 0, 1, 0.1490196, 1,
-0.3740954, -1.568892, -3.17126, 0, 1, 0.1529412, 1,
-0.3739289, -0.1933933, -3.709838, 0, 1, 0.1607843, 1,
-0.3716956, -1.254016, -2.474576, 0, 1, 0.1647059, 1,
-0.3685837, -1.648336, -3.461557, 0, 1, 0.172549, 1,
-0.3655576, -1.681511, -1.923067, 0, 1, 0.1764706, 1,
-0.3597694, 0.2591924, -1.980306, 0, 1, 0.1843137, 1,
-0.3589503, 0.09321637, -2.977271, 0, 1, 0.1882353, 1,
-0.3571639, 0.5447456, -0.5559479, 0, 1, 0.1960784, 1,
-0.3543581, 0.6581345, -0.6077414, 0, 1, 0.2039216, 1,
-0.3480338, 0.945811, -1.212445, 0, 1, 0.2078431, 1,
-0.346082, -1.747913, -2.833378, 0, 1, 0.2156863, 1,
-0.3363903, 1.27309, 0.1854094, 0, 1, 0.2196078, 1,
-0.3347667, 0.174348, -0.375068, 0, 1, 0.227451, 1,
-0.3299704, 1.031123, -0.5446188, 0, 1, 0.2313726, 1,
-0.3294508, 0.2201392, 0.02301338, 0, 1, 0.2392157, 1,
-0.3268616, -0.7966844, -4.632114, 0, 1, 0.2431373, 1,
-0.3187355, 1.862747, -0.4529059, 0, 1, 0.2509804, 1,
-0.3139542, -1.629922, -2.175537, 0, 1, 0.254902, 1,
-0.3110709, -0.6598865, -1.250868, 0, 1, 0.2627451, 1,
-0.3074667, 0.5752555, -0.2331676, 0, 1, 0.2666667, 1,
-0.3074629, -0.5417367, -2.637472, 0, 1, 0.2745098, 1,
-0.3061477, 0.6956487, 0.9139143, 0, 1, 0.2784314, 1,
-0.3048238, 0.01748223, -3.000364, 0, 1, 0.2862745, 1,
-0.3022652, 0.3465368, 0.2331079, 0, 1, 0.2901961, 1,
-0.3020574, -0.577273, -2.485123, 0, 1, 0.2980392, 1,
-0.2995734, 0.3515886, -1.194843, 0, 1, 0.3058824, 1,
-0.2964355, -1.490787, -5.526528, 0, 1, 0.3098039, 1,
-0.2957143, -0.8603989, -4.531744, 0, 1, 0.3176471, 1,
-0.2957098, 0.4559152, -0.6455441, 0, 1, 0.3215686, 1,
-0.2956536, 0.8111454, -1.157207, 0, 1, 0.3294118, 1,
-0.2917988, -1.583966, -2.192759, 0, 1, 0.3333333, 1,
-0.2906629, 1.341757, 0.8096927, 0, 1, 0.3411765, 1,
-0.2850238, 0.07062648, -1.166741, 0, 1, 0.345098, 1,
-0.2822416, -1.874742, -2.799479, 0, 1, 0.3529412, 1,
-0.2821049, 1.837837, 0.7848818, 0, 1, 0.3568628, 1,
-0.2818651, -1.016107, -2.278812, 0, 1, 0.3647059, 1,
-0.2786261, 0.9379112, 0.1132959, 0, 1, 0.3686275, 1,
-0.277668, 1.926764, -1.691386, 0, 1, 0.3764706, 1,
-0.2688692, -0.5250984, -2.600723, 0, 1, 0.3803922, 1,
-0.2682039, -1.883085, -1.184495, 0, 1, 0.3882353, 1,
-0.2664682, 0.8346696, -0.9421864, 0, 1, 0.3921569, 1,
-0.2643631, 0.2923267, -0.1760882, 0, 1, 0.4, 1,
-0.2642972, -1.647453, -3.562947, 0, 1, 0.4078431, 1,
-0.2636725, -0.1800812, -2.707729, 0, 1, 0.4117647, 1,
-0.2627691, -0.5069585, -1.641135, 0, 1, 0.4196078, 1,
-0.2616374, -2.449876, -3.406103, 0, 1, 0.4235294, 1,
-0.2587566, 0.4386654, -2.233026, 0, 1, 0.4313726, 1,
-0.2515346, 1.634534, -0.594441, 0, 1, 0.4352941, 1,
-0.2471569, -1.115081, -3.261812, 0, 1, 0.4431373, 1,
-0.2419781, 0.04801806, -0.4543868, 0, 1, 0.4470588, 1,
-0.2377797, -2.922039, -3.319657, 0, 1, 0.454902, 1,
-0.2371424, -0.689589, -2.775786, 0, 1, 0.4588235, 1,
-0.2359641, -0.5085076, -0.9933451, 0, 1, 0.4666667, 1,
-0.2325685, 0.1369928, -1.20406, 0, 1, 0.4705882, 1,
-0.2309196, 0.7311481, 0.9604818, 0, 1, 0.4784314, 1,
-0.2294636, -1.011331, -4.81781, 0, 1, 0.4823529, 1,
-0.2246802, 0.3326614, -0.2103828, 0, 1, 0.4901961, 1,
-0.2234922, 0.8247733, -1.311381, 0, 1, 0.4941176, 1,
-0.2226193, -1.698229, -1.96245, 0, 1, 0.5019608, 1,
-0.221036, -0.5985364, -4.58242, 0, 1, 0.509804, 1,
-0.218044, 0.4147376, -1.567184, 0, 1, 0.5137255, 1,
-0.2123475, 0.07750522, 0.7285022, 0, 1, 0.5215687, 1,
-0.2121823, 0.03583036, -1.162153, 0, 1, 0.5254902, 1,
-0.1998474, 1.729361, 1.025741, 0, 1, 0.5333334, 1,
-0.1950014, 0.7006018, -0.9889991, 0, 1, 0.5372549, 1,
-0.1818684, 0.8259065, 0.2701825, 0, 1, 0.5450981, 1,
-0.173806, -2.236506, -3.148993, 0, 1, 0.5490196, 1,
-0.1704071, 0.4929118, 0.7489265, 0, 1, 0.5568628, 1,
-0.169312, -0.9704758, -2.452213, 0, 1, 0.5607843, 1,
-0.1687561, 0.3821331, -0.5684679, 0, 1, 0.5686275, 1,
-0.1685125, 0.2960916, 0.4705247, 0, 1, 0.572549, 1,
-0.1684035, -0.4505318, -2.174588, 0, 1, 0.5803922, 1,
-0.1650365, 1.843805, -0.07395937, 0, 1, 0.5843138, 1,
-0.1634662, -0.01518315, -1.613527, 0, 1, 0.5921569, 1,
-0.1606009, 0.9276066, 1.211112, 0, 1, 0.5960785, 1,
-0.1599962, -0.4694495, -2.427834, 0, 1, 0.6039216, 1,
-0.1571731, -0.4183158, -2.741804, 0, 1, 0.6117647, 1,
-0.1567333, 1.765463, -0.8349185, 0, 1, 0.6156863, 1,
-0.1508601, -1.224866, -3.973609, 0, 1, 0.6235294, 1,
-0.1495487, 0.04940911, -2.300637, 0, 1, 0.627451, 1,
-0.1492467, -0.788881, -2.893331, 0, 1, 0.6352941, 1,
-0.1492325, 0.305351, 0.2056021, 0, 1, 0.6392157, 1,
-0.1474713, -0.7792416, -3.117861, 0, 1, 0.6470588, 1,
-0.1457923, -0.08936444, -2.012828, 0, 1, 0.6509804, 1,
-0.1440846, 1.299184, -1.129598, 0, 1, 0.6588235, 1,
-0.1397763, 1.080759, -0.3157956, 0, 1, 0.6627451, 1,
-0.1347771, -0.4270287, -4.302914, 0, 1, 0.6705883, 1,
-0.1339077, -0.9793202, -3.314107, 0, 1, 0.6745098, 1,
-0.1305681, 0.8284451, -0.3269861, 0, 1, 0.682353, 1,
-0.1267331, -0.760261, -0.7994059, 0, 1, 0.6862745, 1,
-0.1234517, -1.899659, -3.525132, 0, 1, 0.6941177, 1,
-0.1224155, -0.2060987, -1.234347, 0, 1, 0.7019608, 1,
-0.122343, -1.289101, -3.988315, 0, 1, 0.7058824, 1,
-0.1219629, -0.7619666, -2.517004, 0, 1, 0.7137255, 1,
-0.1192802, -0.03938126, -3.276566, 0, 1, 0.7176471, 1,
-0.1175441, 0.557831, -1.171155, 0, 1, 0.7254902, 1,
-0.116688, -0.514006, -3.51006, 0, 1, 0.7294118, 1,
-0.1140967, -0.4305456, -3.276372, 0, 1, 0.7372549, 1,
-0.1125226, -0.8791533, -1.709202, 0, 1, 0.7411765, 1,
-0.1114774, 0.8918742, -1.563722, 0, 1, 0.7490196, 1,
-0.1094353, -0.582601, -3.329943, 0, 1, 0.7529412, 1,
-0.1056136, -1.415586, -0.9179771, 0, 1, 0.7607843, 1,
-0.1028994, -1.163838, -3.471655, 0, 1, 0.7647059, 1,
-0.1018316, -0.376697, -2.966071, 0, 1, 0.772549, 1,
-0.1009631, -0.1306721, -1.514553, 0, 1, 0.7764706, 1,
-0.09794047, 1.300597, -0.7508097, 0, 1, 0.7843137, 1,
-0.09134204, 0.8422616, -1.128431, 0, 1, 0.7882353, 1,
-0.09018274, -2.560905, -1.259365, 0, 1, 0.7960784, 1,
-0.08956651, -0.1009774, -2.129652, 0, 1, 0.8039216, 1,
-0.08182116, -0.3707898, -2.603467, 0, 1, 0.8078431, 1,
-0.07880036, -0.2625595, -2.592046, 0, 1, 0.8156863, 1,
-0.07713603, -1.026064, -1.7608, 0, 1, 0.8196079, 1,
-0.07417168, 0.04220222, 0.2033019, 0, 1, 0.827451, 1,
-0.07289871, 0.1299576, 0.01898043, 0, 1, 0.8313726, 1,
-0.07172415, 0.57245, 0.593558, 0, 1, 0.8392157, 1,
-0.07132778, -0.3199054, -4.563601, 0, 1, 0.8431373, 1,
-0.07074779, -0.27934, -2.430821, 0, 1, 0.8509804, 1,
-0.06590817, -0.8138832, -3.720934, 0, 1, 0.854902, 1,
-0.06391858, -2.016622, -3.952845, 0, 1, 0.8627451, 1,
-0.05958516, 0.6484905, -0.5374557, 0, 1, 0.8666667, 1,
-0.05882953, -0.1230925, -1.70255, 0, 1, 0.8745098, 1,
-0.05232279, 0.7467211, 1.497002, 0, 1, 0.8784314, 1,
-0.05009539, 1.254066, -0.654093, 0, 1, 0.8862745, 1,
-0.04954419, 0.460474, -0.8656388, 0, 1, 0.8901961, 1,
-0.04643653, 1.035234, 1.282221, 0, 1, 0.8980392, 1,
-0.04600509, -0.297065, -3.544216, 0, 1, 0.9058824, 1,
-0.04362027, 0.9880285, 0.0279359, 0, 1, 0.9098039, 1,
-0.04000158, -0.3214557, -3.36903, 0, 1, 0.9176471, 1,
-0.03582687, 1.221306, -0.7007419, 0, 1, 0.9215686, 1,
-0.03521859, -1.098129, -2.341852, 0, 1, 0.9294118, 1,
-0.03516058, -1.468605, -1.208395, 0, 1, 0.9333333, 1,
-0.03463041, 1.032838, -0.2053239, 0, 1, 0.9411765, 1,
-0.03195393, 1.960104, 0.6412463, 0, 1, 0.945098, 1,
-0.02914415, 0.6792375, 0.07507081, 0, 1, 0.9529412, 1,
-0.01705904, 1.030933, 0.3737746, 0, 1, 0.9568627, 1,
-0.0140207, -0.7689196, -4.51659, 0, 1, 0.9647059, 1,
-0.01195819, 0.7729838, -0.1758918, 0, 1, 0.9686275, 1,
-0.01050266, -0.2361242, -3.038125, 0, 1, 0.9764706, 1,
-0.009744736, -0.02113157, -2.249259, 0, 1, 0.9803922, 1,
-0.009506508, 0.1880443, -0.01556777, 0, 1, 0.9882353, 1,
-0.00826774, -1.427735, -2.556795, 0, 1, 0.9921569, 1,
-0.008006823, 1.492426, -0.1630022, 0, 1, 1, 1,
-0.0007887862, -0.05871803, -5.083471, 0, 0.9921569, 1, 1,
-0.0006062256, 1.202291, 0.05310439, 0, 0.9882353, 1, 1,
0.003027503, -1.827718, 4.108995, 0, 0.9803922, 1, 1,
0.00526196, -0.7294632, 1.747118, 0, 0.9764706, 1, 1,
0.005577478, 0.84574, -0.7516785, 0, 0.9686275, 1, 1,
0.006051921, -0.3487506, 3.882129, 0, 0.9647059, 1, 1,
0.007911123, -0.8652702, 3.033232, 0, 0.9568627, 1, 1,
0.009878816, 0.1241542, 0.5184558, 0, 0.9529412, 1, 1,
0.01780777, 0.2898881, -0.4970587, 0, 0.945098, 1, 1,
0.02049089, 0.6948559, -1.32619, 0, 0.9411765, 1, 1,
0.02297622, 0.6431444, -1.404023, 0, 0.9333333, 1, 1,
0.02739152, 2.056989, 0.2008587, 0, 0.9294118, 1, 1,
0.02847465, -1.141198, 4.402965, 0, 0.9215686, 1, 1,
0.03377399, 1.348471, -2.494539, 0, 0.9176471, 1, 1,
0.03605574, -1.01934, 3.46205, 0, 0.9098039, 1, 1,
0.03661245, 1.210816, -0.6670533, 0, 0.9058824, 1, 1,
0.03690996, -0.6839215, 4.384068, 0, 0.8980392, 1, 1,
0.03808179, 0.1683565, -0.4722778, 0, 0.8901961, 1, 1,
0.03809069, 0.9947063, 1.640713, 0, 0.8862745, 1, 1,
0.038713, 0.9097147, 0.3408743, 0, 0.8784314, 1, 1,
0.03965943, -1.095081, 2.676321, 0, 0.8745098, 1, 1,
0.04957609, -0.5946825, 4.375145, 0, 0.8666667, 1, 1,
0.05103981, -0.01732551, 2.319942, 0, 0.8627451, 1, 1,
0.05353948, 0.855949, -0.6244414, 0, 0.854902, 1, 1,
0.05360183, -0.8987823, 2.538869, 0, 0.8509804, 1, 1,
0.05472526, 0.4363802, 1.105543, 0, 0.8431373, 1, 1,
0.0556609, 2.254692, 0.4112415, 0, 0.8392157, 1, 1,
0.056062, -0.2806918, 4.582001, 0, 0.8313726, 1, 1,
0.05811298, 0.8438061, 1.201597, 0, 0.827451, 1, 1,
0.05904427, -0.910198, 3.391007, 0, 0.8196079, 1, 1,
0.06173534, 1.87471, -0.8000281, 0, 0.8156863, 1, 1,
0.06476317, 0.01362303, 1.602541, 0, 0.8078431, 1, 1,
0.07276292, -0.05170845, 2.540423, 0, 0.8039216, 1, 1,
0.07546657, 0.09938027, -0.2482232, 0, 0.7960784, 1, 1,
0.07818821, 1.202592, 0.7187907, 0, 0.7882353, 1, 1,
0.07834269, -0.2437044, 1.468122, 0, 0.7843137, 1, 1,
0.07913373, 1.417447, 1.027419, 0, 0.7764706, 1, 1,
0.08303814, -0.5498705, 1.865895, 0, 0.772549, 1, 1,
0.0837734, 0.3302035, -0.2553762, 0, 0.7647059, 1, 1,
0.09440099, 1.233213, 0.717207, 0, 0.7607843, 1, 1,
0.09658304, -0.6194901, 3.297728, 0, 0.7529412, 1, 1,
0.09960843, -0.9353289, 3.988866, 0, 0.7490196, 1, 1,
0.1039904, 0.2660609, 2.958529, 0, 0.7411765, 1, 1,
0.1047708, 0.2613676, 1.850836, 0, 0.7372549, 1, 1,
0.1052326, -0.0511812, 2.279688, 0, 0.7294118, 1, 1,
0.1092615, 0.513234, 0.2499539, 0, 0.7254902, 1, 1,
0.1095444, -1.860729, 4.503423, 0, 0.7176471, 1, 1,
0.1101798, -0.06423568, 1.068623, 0, 0.7137255, 1, 1,
0.110331, -1.699155, 3.198957, 0, 0.7058824, 1, 1,
0.110891, 0.4911871, 1.299067, 0, 0.6980392, 1, 1,
0.1178611, 0.6743894, -0.2782881, 0, 0.6941177, 1, 1,
0.1186845, 1.287154, 1.234274, 0, 0.6862745, 1, 1,
0.1197667, -0.6925422, 3.308029, 0, 0.682353, 1, 1,
0.1203202, 0.01550137, 0.8418266, 0, 0.6745098, 1, 1,
0.1216636, -0.8640832, 2.676662, 0, 0.6705883, 1, 1,
0.1228383, 1.140634, -1.161497, 0, 0.6627451, 1, 1,
0.1263308, 0.6216621, 1.156773, 0, 0.6588235, 1, 1,
0.1274271, -0.0666246, 2.939587, 0, 0.6509804, 1, 1,
0.1291739, 0.08542617, 1.069726, 0, 0.6470588, 1, 1,
0.1296781, -0.8515242, 3.196041, 0, 0.6392157, 1, 1,
0.130351, 0.07395338, 1.161304, 0, 0.6352941, 1, 1,
0.1327525, 0.758338, 0.7869064, 0, 0.627451, 1, 1,
0.1343672, 0.2251733, 0.5925273, 0, 0.6235294, 1, 1,
0.1376743, 1.874797, -0.5006521, 0, 0.6156863, 1, 1,
0.1380466, -0.5765559, 1.629366, 0, 0.6117647, 1, 1,
0.1445069, -1.897253, 3.526673, 0, 0.6039216, 1, 1,
0.1485565, 1.733592, 0.3509164, 0, 0.5960785, 1, 1,
0.1514596, -1.151171, 2.08479, 0, 0.5921569, 1, 1,
0.1556024, 1.160464, -0.8018016, 0, 0.5843138, 1, 1,
0.1598861, 0.4829978, 0.06162915, 0, 0.5803922, 1, 1,
0.1628893, -1.380893, 4.167681, 0, 0.572549, 1, 1,
0.1653643, 0.4881241, 0.9799475, 0, 0.5686275, 1, 1,
0.1669093, -0.3365073, 2.870591, 0, 0.5607843, 1, 1,
0.1672495, -0.6586344, 2.760134, 0, 0.5568628, 1, 1,
0.1721594, 0.1107515, 0.1721269, 0, 0.5490196, 1, 1,
0.1734892, -1.975589, 3.68383, 0, 0.5450981, 1, 1,
0.1749921, 1.543033, -1.009625, 0, 0.5372549, 1, 1,
0.175049, 0.6245182, 0.8473472, 0, 0.5333334, 1, 1,
0.176901, 0.735267, 0.5211196, 0, 0.5254902, 1, 1,
0.1772099, -0.7502234, 2.947354, 0, 0.5215687, 1, 1,
0.1780517, 0.2991329, 0.6449836, 0, 0.5137255, 1, 1,
0.1858455, -0.9967579, 2.15805, 0, 0.509804, 1, 1,
0.1895512, -0.952909, 4.485601, 0, 0.5019608, 1, 1,
0.1901379, -0.4954102, 3.168106, 0, 0.4941176, 1, 1,
0.1912758, 0.2083236, -0.16979, 0, 0.4901961, 1, 1,
0.1956759, 0.5659142, 1.115328, 0, 0.4823529, 1, 1,
0.1963472, -0.2841328, 4.627218, 0, 0.4784314, 1, 1,
0.1984898, -0.4968598, 1.722824, 0, 0.4705882, 1, 1,
0.2017457, -0.2351636, 1.029391, 0, 0.4666667, 1, 1,
0.2032996, 0.9825692, -1.061959, 0, 0.4588235, 1, 1,
0.2035206, -0.1207588, 1.180519, 0, 0.454902, 1, 1,
0.2051216, -0.7882353, 3.200151, 0, 0.4470588, 1, 1,
0.2065071, -0.7291263, 2.865255, 0, 0.4431373, 1, 1,
0.207611, 0.8063585, -0.6003456, 0, 0.4352941, 1, 1,
0.2092584, 0.449909, 0.4318512, 0, 0.4313726, 1, 1,
0.2180473, -0.7831191, 2.465627, 0, 0.4235294, 1, 1,
0.2237325, -1.147067, 2.72775, 0, 0.4196078, 1, 1,
0.2356169, -3.516492, 4.12651, 0, 0.4117647, 1, 1,
0.2362687, 0.8681359, -1.275503, 0, 0.4078431, 1, 1,
0.2381987, -1.347036, 1.893048, 0, 0.4, 1, 1,
0.2413585, 1.26453, -0.08483326, 0, 0.3921569, 1, 1,
0.2430449, 0.3351792, -1.080262, 0, 0.3882353, 1, 1,
0.2432233, 1.202526, -0.2410703, 0, 0.3803922, 1, 1,
0.2500543, -0.8724374, 2.288399, 0, 0.3764706, 1, 1,
0.251062, 2.17992, -0.03777539, 0, 0.3686275, 1, 1,
0.2511801, 1.676916, 1.248822, 0, 0.3647059, 1, 1,
0.2541194, -0.3003213, 3.088178, 0, 0.3568628, 1, 1,
0.2542321, -0.8900432, 2.970611, 0, 0.3529412, 1, 1,
0.2604814, -0.368315, 2.223871, 0, 0.345098, 1, 1,
0.2611119, -0.08262388, 1.433388, 0, 0.3411765, 1, 1,
0.2619525, 0.4063689, 0.9114893, 0, 0.3333333, 1, 1,
0.2628098, 1.433339, -1.437197, 0, 0.3294118, 1, 1,
0.2632162, -0.8172289, 3.649381, 0, 0.3215686, 1, 1,
0.2634656, 0.5172362, -0.9936455, 0, 0.3176471, 1, 1,
0.2677207, -0.8045939, 3.379476, 0, 0.3098039, 1, 1,
0.2689035, -1.155905, 3.33175, 0, 0.3058824, 1, 1,
0.2693081, -0.5701832, 3.246332, 0, 0.2980392, 1, 1,
0.2750937, 1.158013, 2.218237, 0, 0.2901961, 1, 1,
0.2766909, 0.9787625, 2.853491, 0, 0.2862745, 1, 1,
0.2773732, 1.112177, -2.02761, 0, 0.2784314, 1, 1,
0.2780312, -0.3650502, 3.129539, 0, 0.2745098, 1, 1,
0.2788575, -0.02167545, 1.843085, 0, 0.2666667, 1, 1,
0.2807413, 0.1493345, 2.112223, 0, 0.2627451, 1, 1,
0.2833471, -0.5353382, 3.244712, 0, 0.254902, 1, 1,
0.2839915, 0.840391, -0.423283, 0, 0.2509804, 1, 1,
0.2860347, -2.154149, 4.302091, 0, 0.2431373, 1, 1,
0.2932344, 1.500557, 0.3303309, 0, 0.2392157, 1, 1,
0.3002301, -0.1696898, 2.804755, 0, 0.2313726, 1, 1,
0.3015767, -0.08167516, 1.891029, 0, 0.227451, 1, 1,
0.3105573, -0.6880614, 4.397386, 0, 0.2196078, 1, 1,
0.3113512, -1.034871, 2.709169, 0, 0.2156863, 1, 1,
0.3134073, 0.5943988, 1.416653, 0, 0.2078431, 1, 1,
0.3185251, -0.2819367, 1.493575, 0, 0.2039216, 1, 1,
0.3196152, 0.04744644, 1.288534, 0, 0.1960784, 1, 1,
0.3199212, -0.1489548, 2.241099, 0, 0.1882353, 1, 1,
0.3200493, -0.1362452, 0.2638642, 0, 0.1843137, 1, 1,
0.3232393, 1.942217, 0.2223519, 0, 0.1764706, 1, 1,
0.3232524, -0.1130575, -1.078484, 0, 0.172549, 1, 1,
0.3249666, -1.324466, 2.607555, 0, 0.1647059, 1, 1,
0.327037, 0.6929923, 1.311798, 0, 0.1607843, 1, 1,
0.3271947, 2.127964, 0.80616, 0, 0.1529412, 1, 1,
0.3275194, -0.03568569, 1.804873, 0, 0.1490196, 1, 1,
0.3303681, 1.161446, 0.2992397, 0, 0.1411765, 1, 1,
0.3325215, -0.0305481, 2.076414, 0, 0.1372549, 1, 1,
0.3338243, -1.34963, 1.655815, 0, 0.1294118, 1, 1,
0.3368201, 0.3170627, 2.437829, 0, 0.1254902, 1, 1,
0.3375426, 0.469739, -0.03628014, 0, 0.1176471, 1, 1,
0.3376268, -1.622921, 2.042666, 0, 0.1137255, 1, 1,
0.3381028, 0.1191019, 1.230506, 0, 0.1058824, 1, 1,
0.3381325, 0.8659734, -1.34135, 0, 0.09803922, 1, 1,
0.3382541, -0.4156764, 2.850949, 0, 0.09411765, 1, 1,
0.3446709, 0.3170154, 1.576041, 0, 0.08627451, 1, 1,
0.3486832, -0.4423074, 3.358291, 0, 0.08235294, 1, 1,
0.3509662, 0.4046834, -0.2371415, 0, 0.07450981, 1, 1,
0.3533888, -1.828971, 3.053681, 0, 0.07058824, 1, 1,
0.3675812, 0.06937986, 3.247521, 0, 0.0627451, 1, 1,
0.368755, -0.1289476, 2.178844, 0, 0.05882353, 1, 1,
0.3716016, 0.6608859, 0.3057772, 0, 0.05098039, 1, 1,
0.3759125, -0.9181269, 1.907734, 0, 0.04705882, 1, 1,
0.3810706, -1.504899, 2.158869, 0, 0.03921569, 1, 1,
0.3810993, 1.307711, 0.2627316, 0, 0.03529412, 1, 1,
0.3849331, 1.888175, 2.167143, 0, 0.02745098, 1, 1,
0.3894734, 0.1710524, 0.7578601, 0, 0.02352941, 1, 1,
0.3916733, -2.133015, 4.436768, 0, 0.01568628, 1, 1,
0.3917358, -0.8756055, 2.78583, 0, 0.01176471, 1, 1,
0.3918268, 1.969186, 2.08768, 0, 0.003921569, 1, 1,
0.3924221, -0.1297265, 2.182662, 0.003921569, 0, 1, 1,
0.3943208, -0.2064479, 3.415691, 0.007843138, 0, 1, 1,
0.3945985, 0.05165004, 1.721685, 0.01568628, 0, 1, 1,
0.400811, -0.964411, 3.645219, 0.01960784, 0, 1, 1,
0.401439, 0.8597587, 1.314849, 0.02745098, 0, 1, 1,
0.4033798, 2.18112, 0.9935233, 0.03137255, 0, 1, 1,
0.4059167, 1.027846, -0.4529917, 0.03921569, 0, 1, 1,
0.4089725, 0.9480324, 1.513522, 0.04313726, 0, 1, 1,
0.409508, -0.5346153, 2.54577, 0.05098039, 0, 1, 1,
0.4146991, -0.1765332, 2.33102, 0.05490196, 0, 1, 1,
0.4161872, -0.7895598, 4.839395, 0.0627451, 0, 1, 1,
0.4168818, 0.6171558, 3.047887, 0.06666667, 0, 1, 1,
0.4183393, 0.8670196, 0.4788308, 0.07450981, 0, 1, 1,
0.4214477, -0.7846814, 2.473549, 0.07843138, 0, 1, 1,
0.4274259, 0.06226052, 0.5846304, 0.08627451, 0, 1, 1,
0.4293072, -1.351727, 1.973591, 0.09019608, 0, 1, 1,
0.4346572, 0.5226456, 0.5550666, 0.09803922, 0, 1, 1,
0.4372258, 0.06715935, 2.386317, 0.1058824, 0, 1, 1,
0.4487436, -1.246175, 3.667571, 0.1098039, 0, 1, 1,
0.4520383, 0.2587738, 1.641989, 0.1176471, 0, 1, 1,
0.4539414, 1.389264, 0.2520677, 0.1215686, 0, 1, 1,
0.4577041, -1.616389, 3.24782, 0.1294118, 0, 1, 1,
0.459071, -0.6390767, 4.242001, 0.1333333, 0, 1, 1,
0.4640836, -1.745122, 2.687112, 0.1411765, 0, 1, 1,
0.4652988, 0.04357062, 0.1940751, 0.145098, 0, 1, 1,
0.4658238, 1.347048, 0.6502878, 0.1529412, 0, 1, 1,
0.4701848, 1.114849, 1.162425, 0.1568628, 0, 1, 1,
0.4777639, 0.1646275, 3.099057, 0.1647059, 0, 1, 1,
0.4842971, -0.4288718, 3.753349, 0.1686275, 0, 1, 1,
0.4856144, -0.8014675, 3.782001, 0.1764706, 0, 1, 1,
0.4871509, 0.57149, 0.6623194, 0.1803922, 0, 1, 1,
0.4915702, -0.4162118, 2.686547, 0.1882353, 0, 1, 1,
0.4922029, 0.7289277, 0.01206971, 0.1921569, 0, 1, 1,
0.4928728, -1.684154, 3.512236, 0.2, 0, 1, 1,
0.4974318, 0.2328491, -0.1669994, 0.2078431, 0, 1, 1,
0.5093784, -0.7047531, 2.274917, 0.2117647, 0, 1, 1,
0.5118907, 1.147729, -0.3741868, 0.2196078, 0, 1, 1,
0.5127499, -0.2593363, 4.220563, 0.2235294, 0, 1, 1,
0.5169301, -1.653495, 2.665247, 0.2313726, 0, 1, 1,
0.5191481, 0.487357, 1.406877, 0.2352941, 0, 1, 1,
0.5194089, 1.927381, -1.746436, 0.2431373, 0, 1, 1,
0.5194139, 0.8006268, 1.007207, 0.2470588, 0, 1, 1,
0.5228825, 0.02280472, 1.056588, 0.254902, 0, 1, 1,
0.5229, 0.3032483, 2.038546, 0.2588235, 0, 1, 1,
0.5240937, -0.8140941, 2.772222, 0.2666667, 0, 1, 1,
0.5250778, -0.3084848, 3.127945, 0.2705882, 0, 1, 1,
0.528583, 0.04269124, 0.1264289, 0.2784314, 0, 1, 1,
0.5297917, -0.7790141, 0.7918088, 0.282353, 0, 1, 1,
0.5328279, 1.715319, 1.666204, 0.2901961, 0, 1, 1,
0.5376035, -0.05782103, 3.033795, 0.2941177, 0, 1, 1,
0.5387558, 0.3375146, -0.524801, 0.3019608, 0, 1, 1,
0.5418242, 0.2505746, 0.4855675, 0.3098039, 0, 1, 1,
0.5437493, -2.012657, 3.669784, 0.3137255, 0, 1, 1,
0.5507979, -0.1575518, 2.551962, 0.3215686, 0, 1, 1,
0.5543194, -0.9369989, 3.50958, 0.3254902, 0, 1, 1,
0.5543784, 0.5553348, 2.554177, 0.3333333, 0, 1, 1,
0.5559339, 1.36205, 0.4328522, 0.3372549, 0, 1, 1,
0.5584981, 1.24982, 0.9928116, 0.345098, 0, 1, 1,
0.5686852, -0.1134702, 2.535218, 0.3490196, 0, 1, 1,
0.5696909, 1.662478, 0.3471201, 0.3568628, 0, 1, 1,
0.5718158, -0.003396778, 1.527092, 0.3607843, 0, 1, 1,
0.5718374, 0.1612162, 0.6244786, 0.3686275, 0, 1, 1,
0.5807611, -0.3839631, 1.892266, 0.372549, 0, 1, 1,
0.5845198, -0.6733287, 1.814898, 0.3803922, 0, 1, 1,
0.5865659, -0.9305357, 3.087225, 0.3843137, 0, 1, 1,
0.5876669, -1.588442, 4.072145, 0.3921569, 0, 1, 1,
0.5899862, 1.083407, 1.222713, 0.3960784, 0, 1, 1,
0.5920322, -0.5564913, 1.833273, 0.4039216, 0, 1, 1,
0.5925303, 0.6178115, -0.7139288, 0.4117647, 0, 1, 1,
0.5936736, 0.6395627, 1.583846, 0.4156863, 0, 1, 1,
0.5964506, 1.062501, -1.654635, 0.4235294, 0, 1, 1,
0.5994533, 0.343105, -1.512141, 0.427451, 0, 1, 1,
0.5999055, 0.9291046, -0.6317043, 0.4352941, 0, 1, 1,
0.6013898, -1.027462, 1.365027, 0.4392157, 0, 1, 1,
0.6081133, -0.8240803, 2.802246, 0.4470588, 0, 1, 1,
0.6087644, 1.041332, 0.1960235, 0.4509804, 0, 1, 1,
0.609984, -0.4921836, 1.446305, 0.4588235, 0, 1, 1,
0.6113946, -0.01675476, 1.049548, 0.4627451, 0, 1, 1,
0.6117344, -0.3680721, 1.031007, 0.4705882, 0, 1, 1,
0.6165196, 2.091045, -1.791212, 0.4745098, 0, 1, 1,
0.6186835, 0.8509593, 1.421539, 0.4823529, 0, 1, 1,
0.6198021, -1.215679, 1.546052, 0.4862745, 0, 1, 1,
0.6217142, -0.05283423, 1.976756, 0.4941176, 0, 1, 1,
0.6217695, 1.139103, 0.8706143, 0.5019608, 0, 1, 1,
0.6233293, 0.1435485, 0.3311674, 0.5058824, 0, 1, 1,
0.6243983, 0.8589051, 1.208737, 0.5137255, 0, 1, 1,
0.6270901, 0.227713, 2.070697, 0.5176471, 0, 1, 1,
0.630703, -2.161259, 3.09775, 0.5254902, 0, 1, 1,
0.6405442, -1.157761, 1.257925, 0.5294118, 0, 1, 1,
0.6446225, -1.018126, 2.599817, 0.5372549, 0, 1, 1,
0.6547768, 1.686746, 0.5873405, 0.5411765, 0, 1, 1,
0.6568028, -0.6507087, 3.280228, 0.5490196, 0, 1, 1,
0.6569747, -0.7037469, 3.541311, 0.5529412, 0, 1, 1,
0.6647678, -0.373604, 1.638383, 0.5607843, 0, 1, 1,
0.6697209, -0.2235838, -0.06979146, 0.5647059, 0, 1, 1,
0.6710832, -1.337788, 1.962282, 0.572549, 0, 1, 1,
0.6730877, -0.3031878, 1.486757, 0.5764706, 0, 1, 1,
0.6778978, -0.5729923, 3.009867, 0.5843138, 0, 1, 1,
0.6789645, 1.333911, -0.47045, 0.5882353, 0, 1, 1,
0.679198, -1.126178, 2.686355, 0.5960785, 0, 1, 1,
0.6811619, -0.05806046, 1.565945, 0.6039216, 0, 1, 1,
0.6828318, -0.7601433, 3.419214, 0.6078432, 0, 1, 1,
0.68515, -1.481966, 2.940896, 0.6156863, 0, 1, 1,
0.6959336, -0.2543373, 1.831869, 0.6196079, 0, 1, 1,
0.7000342, -0.7682275, 2.369582, 0.627451, 0, 1, 1,
0.701321, -0.05495282, 1.908485, 0.6313726, 0, 1, 1,
0.7021244, -0.649797, 3.046281, 0.6392157, 0, 1, 1,
0.704285, -1.596303, 1.620135, 0.6431373, 0, 1, 1,
0.7048032, -1.822815, 1.943527, 0.6509804, 0, 1, 1,
0.709779, -0.8066757, 2.017385, 0.654902, 0, 1, 1,
0.7104709, 0.5642412, 0.7758076, 0.6627451, 0, 1, 1,
0.7144119, -2.165776, 2.949194, 0.6666667, 0, 1, 1,
0.7233788, 1.815531, -2.58999, 0.6745098, 0, 1, 1,
0.7269163, 0.1625284, 1.153035, 0.6784314, 0, 1, 1,
0.7324214, 0.04230072, -0.253483, 0.6862745, 0, 1, 1,
0.7348625, 1.583755, -0.4466171, 0.6901961, 0, 1, 1,
0.7370797, 0.03483213, 2.18843, 0.6980392, 0, 1, 1,
0.7375606, -0.8987607, 4.795681, 0.7058824, 0, 1, 1,
0.7416745, -0.7810467, 1.610897, 0.7098039, 0, 1, 1,
0.7421391, 0.2339961, 1.565722, 0.7176471, 0, 1, 1,
0.749067, -1.375163, 3.744048, 0.7215686, 0, 1, 1,
0.7498237, 1.237975, 0.7568299, 0.7294118, 0, 1, 1,
0.7571266, -2.518629, 3.605792, 0.7333333, 0, 1, 1,
0.7591286, -0.6769485, 2.627124, 0.7411765, 0, 1, 1,
0.7703435, 0.2602363, -0.4560693, 0.7450981, 0, 1, 1,
0.7704619, -1.108585, 3.1275, 0.7529412, 0, 1, 1,
0.7815184, 0.7815855, 0.6005574, 0.7568628, 0, 1, 1,
0.7830862, -0.2003019, 0.9799613, 0.7647059, 0, 1, 1,
0.7892928, -1.096911, 2.343037, 0.7686275, 0, 1, 1,
0.7912367, -0.3196293, 1.301586, 0.7764706, 0, 1, 1,
0.7913035, 0.04442685, 1.227628, 0.7803922, 0, 1, 1,
0.8037896, -1.202853, 2.00198, 0.7882353, 0, 1, 1,
0.8088722, 0.6945686, -0.224124, 0.7921569, 0, 1, 1,
0.8106323, -0.6394023, 1.639435, 0.8, 0, 1, 1,
0.8118309, 2.308, 0.3918111, 0.8078431, 0, 1, 1,
0.8218194, 0.6481701, 2.341115, 0.8117647, 0, 1, 1,
0.8249601, 0.6686944, 0.1152993, 0.8196079, 0, 1, 1,
0.8259047, 0.5033779, -0.8263794, 0.8235294, 0, 1, 1,
0.8264483, 0.8558699, -0.05796326, 0.8313726, 0, 1, 1,
0.8279663, 0.537987, 1.517966, 0.8352941, 0, 1, 1,
0.8367867, -2.499014, 1.950663, 0.8431373, 0, 1, 1,
0.8468833, 1.565717, 1.25644, 0.8470588, 0, 1, 1,
0.8510199, 0.3761362, 1.057586, 0.854902, 0, 1, 1,
0.8514755, 0.03377032, 3.120265, 0.8588235, 0, 1, 1,
0.8539503, 1.937896, 0.2518616, 0.8666667, 0, 1, 1,
0.8564189, -0.8227704, 1.876087, 0.8705882, 0, 1, 1,
0.8582868, 1.060441, 0.5121703, 0.8784314, 0, 1, 1,
0.8606104, -0.4975428, 1.815688, 0.8823529, 0, 1, 1,
0.8646901, -0.6584868, 3.817638, 0.8901961, 0, 1, 1,
0.8662288, -0.6544721, 1.629339, 0.8941177, 0, 1, 1,
0.8781723, -0.3123397, 1.124584, 0.9019608, 0, 1, 1,
0.878621, -1.896876, 1.582831, 0.9098039, 0, 1, 1,
0.8809417, 1.900024, -0.5496022, 0.9137255, 0, 1, 1,
0.8812089, 1.66007, 0.5953702, 0.9215686, 0, 1, 1,
0.8844681, 2.656022, 0.4050455, 0.9254902, 0, 1, 1,
0.8926044, -0.1959132, -0.9364304, 0.9333333, 0, 1, 1,
0.8957736, 1.888457, 1.736471, 0.9372549, 0, 1, 1,
0.8959441, -1.071597, 3.189402, 0.945098, 0, 1, 1,
0.8978698, 0.1317189, 2.488527, 0.9490196, 0, 1, 1,
0.899595, -0.1839746, 2.037706, 0.9568627, 0, 1, 1,
0.9342057, -0.7113943, 2.293023, 0.9607843, 0, 1, 1,
0.934749, 1.145429, 2.393963, 0.9686275, 0, 1, 1,
0.9354011, -1.034212, 1.827972, 0.972549, 0, 1, 1,
0.9361179, -1.318083, 1.525813, 0.9803922, 0, 1, 1,
0.9375948, -1.169848, 2.298943, 0.9843137, 0, 1, 1,
0.9429007, -0.7344677, 3.361519, 0.9921569, 0, 1, 1,
0.9448856, -1.911684, 3.061793, 0.9960784, 0, 1, 1,
0.9471093, 1.763537, 0.7385779, 1, 0, 0.9960784, 1,
0.9706168, 1.192784, -0.1107728, 1, 0, 0.9882353, 1,
0.9720874, 0.8892221, 2.979135, 1, 0, 0.9843137, 1,
0.9739618, 0.04436167, 1.39837, 1, 0, 0.9764706, 1,
0.9792398, 1.733011, -1.237625, 1, 0, 0.972549, 1,
0.9907767, -0.8062727, 1.482075, 1, 0, 0.9647059, 1,
0.9911402, -0.009842045, 1.704008, 1, 0, 0.9607843, 1,
0.9914158, 0.3452112, 1.726507, 1, 0, 0.9529412, 1,
0.9934018, 0.1238874, 2.810748, 1, 0, 0.9490196, 1,
0.993489, -1.107964, 1.402236, 1, 0, 0.9411765, 1,
0.9983733, 0.3852583, 1.978655, 1, 0, 0.9372549, 1,
1.000831, 0.6824615, -0.04490711, 1, 0, 0.9294118, 1,
1.002349, -1.01917, 3.308381, 1, 0, 0.9254902, 1,
1.014104, 0.8855975, -0.2847388, 1, 0, 0.9176471, 1,
1.026801, 0.167489, -1.171311, 1, 0, 0.9137255, 1,
1.029639, -0.06438834, 0.03793578, 1, 0, 0.9058824, 1,
1.031021, 1.508598, 1.476426, 1, 0, 0.9019608, 1,
1.038406, -1.225723, 3.207588, 1, 0, 0.8941177, 1,
1.038728, -0.1231232, 2.644433, 1, 0, 0.8862745, 1,
1.041987, 0.7393121, 0.2299017, 1, 0, 0.8823529, 1,
1.050943, 1.227145, 0.04253931, 1, 0, 0.8745098, 1,
1.056333, 0.6317987, 2.130256, 1, 0, 0.8705882, 1,
1.056339, 1.867246, 1.619555, 1, 0, 0.8627451, 1,
1.058046, -0.3966215, 1.704427, 1, 0, 0.8588235, 1,
1.060156, -0.2865626, 1.477049, 1, 0, 0.8509804, 1,
1.063117, -0.1838372, 1.458983, 1, 0, 0.8470588, 1,
1.067964, -0.7875993, 6.090123, 1, 0, 0.8392157, 1,
1.073537, -0.4439169, 0.0643709, 1, 0, 0.8352941, 1,
1.080367, -0.9825323, 1.761685, 1, 0, 0.827451, 1,
1.084456, -0.6865521, 2.992289, 1, 0, 0.8235294, 1,
1.088899, -1.423214, 1.221288, 1, 0, 0.8156863, 1,
1.098201, -0.7497721, 1.873299, 1, 0, 0.8117647, 1,
1.106981, -0.5247031, 3.034287, 1, 0, 0.8039216, 1,
1.120176, 1.3393, 1.994769, 1, 0, 0.7960784, 1,
1.132259, 0.5562435, 0.5748682, 1, 0, 0.7921569, 1,
1.133891, 0.9548277, 0.6925374, 1, 0, 0.7843137, 1,
1.138308, 0.2404622, 0.5599029, 1, 0, 0.7803922, 1,
1.138376, -1.570877, 4.07426, 1, 0, 0.772549, 1,
1.153214, -1.002404, 0.3162863, 1, 0, 0.7686275, 1,
1.157291, 0.5326235, 1.519538, 1, 0, 0.7607843, 1,
1.158437, 0.02973689, 1.868706, 1, 0, 0.7568628, 1,
1.166493, 0.9313807, 0.1227835, 1, 0, 0.7490196, 1,
1.181767, 0.6877308, 0.4814845, 1, 0, 0.7450981, 1,
1.183175, 0.5462341, 2.97085, 1, 0, 0.7372549, 1,
1.185364, 0.8693325, 1.081263, 1, 0, 0.7333333, 1,
1.192293, -0.2846515, 0.7306362, 1, 0, 0.7254902, 1,
1.193766, -0.4451337, 2.067452, 1, 0, 0.7215686, 1,
1.197521, 0.6967866, 1.333838, 1, 0, 0.7137255, 1,
1.199123, -1.081084, 0.6448267, 1, 0, 0.7098039, 1,
1.200412, 0.1262614, 1.044561, 1, 0, 0.7019608, 1,
1.202231, 0.6654238, -0.4500374, 1, 0, 0.6941177, 1,
1.21232, 0.5432863, 0.895082, 1, 0, 0.6901961, 1,
1.216874, -0.2127914, 2.154133, 1, 0, 0.682353, 1,
1.225622, -1.962286, 3.963829, 1, 0, 0.6784314, 1,
1.242354, -1.131783, 3.84403, 1, 0, 0.6705883, 1,
1.24637, 2.187725, 0.3318262, 1, 0, 0.6666667, 1,
1.247084, -1.399096, 3.33967, 1, 0, 0.6588235, 1,
1.248266, 0.1695509, 0.3342234, 1, 0, 0.654902, 1,
1.251623, 1.01019, 0.7440622, 1, 0, 0.6470588, 1,
1.256593, -0.133725, 0.06266059, 1, 0, 0.6431373, 1,
1.259357, -0.978937, 1.887504, 1, 0, 0.6352941, 1,
1.272224, -1.46912, 3.141466, 1, 0, 0.6313726, 1,
1.274347, -0.4758067, 1.54439, 1, 0, 0.6235294, 1,
1.277282, -0.02214427, 0.6597804, 1, 0, 0.6196079, 1,
1.288175, -0.04937695, 0.8451595, 1, 0, 0.6117647, 1,
1.289908, 0.6591033, -0.3503338, 1, 0, 0.6078432, 1,
1.301571, -0.04101634, 2.86984, 1, 0, 0.6, 1,
1.305545, 0.8056389, 2.4382, 1, 0, 0.5921569, 1,
1.312368, 0.0924701, 1.89866, 1, 0, 0.5882353, 1,
1.314654, 1.548971, -0.3554551, 1, 0, 0.5803922, 1,
1.323266, 0.5024182, 3.688866, 1, 0, 0.5764706, 1,
1.334435, 0.912905, 0.9250461, 1, 0, 0.5686275, 1,
1.335374, 0.3946728, 0.6294259, 1, 0, 0.5647059, 1,
1.344723, 1.524496, 0.773221, 1, 0, 0.5568628, 1,
1.347786, -0.003703819, 0.4388137, 1, 0, 0.5529412, 1,
1.348531, 1.628941, -0.1797946, 1, 0, 0.5450981, 1,
1.358572, -0.01752528, 1.559596, 1, 0, 0.5411765, 1,
1.381466, 0.2522087, 1.258067, 1, 0, 0.5333334, 1,
1.384316, 0.7309989, 2.040737, 1, 0, 0.5294118, 1,
1.38865, 0.1258695, 1.531271, 1, 0, 0.5215687, 1,
1.394975, -0.5141919, 1.845512, 1, 0, 0.5176471, 1,
1.396553, 0.531716, 1.642321, 1, 0, 0.509804, 1,
1.40309, -0.9438676, 1.834202, 1, 0, 0.5058824, 1,
1.4059, 1.33049, -0.1722357, 1, 0, 0.4980392, 1,
1.41809, 0.5660252, 2.092628, 1, 0, 0.4901961, 1,
1.426301, 0.875106, 3.510196, 1, 0, 0.4862745, 1,
1.426454, -0.2692785, 1.214425, 1, 0, 0.4784314, 1,
1.432006, -0.4389873, 3.017196, 1, 0, 0.4745098, 1,
1.433953, 0.5890056, 1.923873, 1, 0, 0.4666667, 1,
1.449031, -0.5846299, 3.572732, 1, 0, 0.4627451, 1,
1.454799, -0.6823176, 0.8559883, 1, 0, 0.454902, 1,
1.46139, -1.089665, 3.503301, 1, 0, 0.4509804, 1,
1.469, -2.567576, 3.016289, 1, 0, 0.4431373, 1,
1.474951, -0.2691009, 2.177515, 1, 0, 0.4392157, 1,
1.475765, -0.4206818, 1.230762, 1, 0, 0.4313726, 1,
1.4837, 2.462632, 0.2220775, 1, 0, 0.427451, 1,
1.507861, 1.016296, 0.2296151, 1, 0, 0.4196078, 1,
1.512328, 1.181361, 1.155464, 1, 0, 0.4156863, 1,
1.519357, -2.771463, 2.646723, 1, 0, 0.4078431, 1,
1.522487, 0.03505522, 0.9324331, 1, 0, 0.4039216, 1,
1.529166, -1.081966, 1.829969, 1, 0, 0.3960784, 1,
1.531864, -0.9074388, 2.539979, 1, 0, 0.3882353, 1,
1.558807, -1.247292, 3.351023, 1, 0, 0.3843137, 1,
1.563386, 0.1524298, 1.798709, 1, 0, 0.3764706, 1,
1.564123, -0.2374124, 1.28886, 1, 0, 0.372549, 1,
1.579222, 0.5323141, -0.8251066, 1, 0, 0.3647059, 1,
1.580385, 1.353976, 1.118086, 1, 0, 0.3607843, 1,
1.582786, -1.710423, 3.835492, 1, 0, 0.3529412, 1,
1.592615, -0.4988508, 2.93599, 1, 0, 0.3490196, 1,
1.604337, 0.135876, 2.614675, 1, 0, 0.3411765, 1,
1.62835, -0.3182904, 2.093588, 1, 0, 0.3372549, 1,
1.635561, -0.4017757, 0.6250128, 1, 0, 0.3294118, 1,
1.640623, 0.01893212, 2.892329, 1, 0, 0.3254902, 1,
1.644952, 1.562465, 0.6779951, 1, 0, 0.3176471, 1,
1.648541, 0.8348588, 0.276201, 1, 0, 0.3137255, 1,
1.670932, -0.09366724, 1.274498, 1, 0, 0.3058824, 1,
1.684661, 0.2160735, 0.9407721, 1, 0, 0.2980392, 1,
1.693823, 1.784249, 2.294235, 1, 0, 0.2941177, 1,
1.710918, -0.5648119, 3.484146, 1, 0, 0.2862745, 1,
1.718444, 1.303804, 0.5949482, 1, 0, 0.282353, 1,
1.724242, 1.812553, -0.05156859, 1, 0, 0.2745098, 1,
1.727993, -0.2132835, 1.633296, 1, 0, 0.2705882, 1,
1.730923, -0.7612103, 2.007845, 1, 0, 0.2627451, 1,
1.74002, 1.916685, 1.571299, 1, 0, 0.2588235, 1,
1.746396, -0.611899, 3.118273, 1, 0, 0.2509804, 1,
1.747234, 0.6150481, 0.8919552, 1, 0, 0.2470588, 1,
1.749932, 0.2026044, 1.762121, 1, 0, 0.2392157, 1,
1.752857, -0.06518473, 0.6280799, 1, 0, 0.2352941, 1,
1.759357, 1.623647, 0.9453341, 1, 0, 0.227451, 1,
1.791312, 1.429738, -0.7465447, 1, 0, 0.2235294, 1,
1.795729, -1.232899, 4.173045, 1, 0, 0.2156863, 1,
1.810325, 0.9100805, 0.5911121, 1, 0, 0.2117647, 1,
1.852671, -0.8657647, 1.916616, 1, 0, 0.2039216, 1,
1.862508, 0.3375999, 2.828692, 1, 0, 0.1960784, 1,
1.884592, -0.9872394, 1.544712, 1, 0, 0.1921569, 1,
1.896381, 0.6058493, 1.027462, 1, 0, 0.1843137, 1,
1.915722, -0.8556964, 2.400083, 1, 0, 0.1803922, 1,
1.923493, 1.070037, 0.2763108, 1, 0, 0.172549, 1,
1.925586, -0.7917501, 3.934997, 1, 0, 0.1686275, 1,
1.942279, 0.08778211, 1.901471, 1, 0, 0.1607843, 1,
1.966794, 0.1886491, 0.599261, 1, 0, 0.1568628, 1,
1.978379, -0.08847759, 1.926987, 1, 0, 0.1490196, 1,
1.979923, 1.453269, 0.3513547, 1, 0, 0.145098, 1,
2.011196, 0.4299893, 1.472953, 1, 0, 0.1372549, 1,
2.03694, 0.6472683, 0.2873572, 1, 0, 0.1333333, 1,
2.051593, 1.149991, 1.824509, 1, 0, 0.1254902, 1,
2.068163, 1.467414, 3.421777, 1, 0, 0.1215686, 1,
2.154001, 0.3959596, 1.291731, 1, 0, 0.1137255, 1,
2.216271, -2.488611, 3.258878, 1, 0, 0.1098039, 1,
2.232228, -1.821116, 1.484243, 1, 0, 0.1019608, 1,
2.235287, 0.6527879, 2.821736, 1, 0, 0.09411765, 1,
2.254484, 0.6660524, 2.330499, 1, 0, 0.09019608, 1,
2.261042, 0.2411359, 1.912329, 1, 0, 0.08235294, 1,
2.289945, -0.6135416, 1.782982, 1, 0, 0.07843138, 1,
2.292935, 1.652295, 1.248849, 1, 0, 0.07058824, 1,
2.363945, -0.3098755, 0.5639848, 1, 0, 0.06666667, 1,
2.406531, -0.7254058, 2.637985, 1, 0, 0.05882353, 1,
2.528128, 1.114114, 1.305949, 1, 0, 0.05490196, 1,
2.551666, 0.9459481, 0.735432, 1, 0, 0.04705882, 1,
2.556665, -0.1327911, 1.649987, 1, 0, 0.04313726, 1,
2.60248, -1.18219, 1.185122, 1, 0, 0.03529412, 1,
2.619089, 0.1590117, 0.4086727, 1, 0, 0.03137255, 1,
2.621072, 0.2652424, -0.6785371, 1, 0, 0.02352941, 1,
2.64282, -0.6043168, 1.017692, 1, 0, 0.01960784, 1,
2.747089, -1.161804, 2.072439, 1, 0, 0.01176471, 1,
2.77161, -0.8189243, 0.5907376, 1, 0, 0.007843138, 1
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
-0.1912081, -4.58026, -7.49555, 0, -0.5, 0.5, 0.5,
-0.1912081, -4.58026, -7.49555, 1, -0.5, 0.5, 0.5,
-0.1912081, -4.58026, -7.49555, 1, 1.5, 0.5, 0.5,
-0.1912081, -4.58026, -7.49555, 0, 1.5, 0.5, 0.5
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
-4.158422, -0.3785322, -7.49555, 0, -0.5, 0.5, 0.5,
-4.158422, -0.3785322, -7.49555, 1, -0.5, 0.5, 0.5,
-4.158422, -0.3785322, -7.49555, 1, 1.5, 0.5, 0.5,
-4.158422, -0.3785322, -7.49555, 0, 1.5, 0.5, 0.5
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
-4.158422, -4.58026, 0.2817974, 0, -0.5, 0.5, 0.5,
-4.158422, -4.58026, 0.2817974, 1, -0.5, 0.5, 0.5,
-4.158422, -4.58026, 0.2817974, 1, 1.5, 0.5, 0.5,
-4.158422, -4.58026, 0.2817974, 0, 1.5, 0.5, 0.5
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
-3, -3.610631, -5.700778,
2, -3.610631, -5.700778,
-3, -3.610631, -5.700778,
-3, -3.772235, -5.999907,
-2, -3.610631, -5.700778,
-2, -3.772235, -5.999907,
-1, -3.610631, -5.700778,
-1, -3.772235, -5.999907,
0, -3.610631, -5.700778,
0, -3.772235, -5.999907,
1, -3.610631, -5.700778,
1, -3.772235, -5.999907,
2, -3.610631, -5.700778,
2, -3.772235, -5.999907
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
-3, -4.095445, -6.598164, 0, -0.5, 0.5, 0.5,
-3, -4.095445, -6.598164, 1, -0.5, 0.5, 0.5,
-3, -4.095445, -6.598164, 1, 1.5, 0.5, 0.5,
-3, -4.095445, -6.598164, 0, 1.5, 0.5, 0.5,
-2, -4.095445, -6.598164, 0, -0.5, 0.5, 0.5,
-2, -4.095445, -6.598164, 1, -0.5, 0.5, 0.5,
-2, -4.095445, -6.598164, 1, 1.5, 0.5, 0.5,
-2, -4.095445, -6.598164, 0, 1.5, 0.5, 0.5,
-1, -4.095445, -6.598164, 0, -0.5, 0.5, 0.5,
-1, -4.095445, -6.598164, 1, -0.5, 0.5, 0.5,
-1, -4.095445, -6.598164, 1, 1.5, 0.5, 0.5,
-1, -4.095445, -6.598164, 0, 1.5, 0.5, 0.5,
0, -4.095445, -6.598164, 0, -0.5, 0.5, 0.5,
0, -4.095445, -6.598164, 1, -0.5, 0.5, 0.5,
0, -4.095445, -6.598164, 1, 1.5, 0.5, 0.5,
0, -4.095445, -6.598164, 0, 1.5, 0.5, 0.5,
1, -4.095445, -6.598164, 0, -0.5, 0.5, 0.5,
1, -4.095445, -6.598164, 1, -0.5, 0.5, 0.5,
1, -4.095445, -6.598164, 1, 1.5, 0.5, 0.5,
1, -4.095445, -6.598164, 0, 1.5, 0.5, 0.5,
2, -4.095445, -6.598164, 0, -0.5, 0.5, 0.5,
2, -4.095445, -6.598164, 1, -0.5, 0.5, 0.5,
2, -4.095445, -6.598164, 1, 1.5, 0.5, 0.5,
2, -4.095445, -6.598164, 0, 1.5, 0.5, 0.5
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
-3.242911, -3, -5.700778,
-3.242911, 2, -5.700778,
-3.242911, -3, -5.700778,
-3.395496, -3, -5.999907,
-3.242911, -2, -5.700778,
-3.395496, -2, -5.999907,
-3.242911, -1, -5.700778,
-3.395496, -1, -5.999907,
-3.242911, 0, -5.700778,
-3.395496, 0, -5.999907,
-3.242911, 1, -5.700778,
-3.395496, 1, -5.999907,
-3.242911, 2, -5.700778,
-3.395496, 2, -5.999907
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
-3.700666, -3, -6.598164, 0, -0.5, 0.5, 0.5,
-3.700666, -3, -6.598164, 1, -0.5, 0.5, 0.5,
-3.700666, -3, -6.598164, 1, 1.5, 0.5, 0.5,
-3.700666, -3, -6.598164, 0, 1.5, 0.5, 0.5,
-3.700666, -2, -6.598164, 0, -0.5, 0.5, 0.5,
-3.700666, -2, -6.598164, 1, -0.5, 0.5, 0.5,
-3.700666, -2, -6.598164, 1, 1.5, 0.5, 0.5,
-3.700666, -2, -6.598164, 0, 1.5, 0.5, 0.5,
-3.700666, -1, -6.598164, 0, -0.5, 0.5, 0.5,
-3.700666, -1, -6.598164, 1, -0.5, 0.5, 0.5,
-3.700666, -1, -6.598164, 1, 1.5, 0.5, 0.5,
-3.700666, -1, -6.598164, 0, 1.5, 0.5, 0.5,
-3.700666, 0, -6.598164, 0, -0.5, 0.5, 0.5,
-3.700666, 0, -6.598164, 1, -0.5, 0.5, 0.5,
-3.700666, 0, -6.598164, 1, 1.5, 0.5, 0.5,
-3.700666, 0, -6.598164, 0, 1.5, 0.5, 0.5,
-3.700666, 1, -6.598164, 0, -0.5, 0.5, 0.5,
-3.700666, 1, -6.598164, 1, -0.5, 0.5, 0.5,
-3.700666, 1, -6.598164, 1, 1.5, 0.5, 0.5,
-3.700666, 1, -6.598164, 0, 1.5, 0.5, 0.5,
-3.700666, 2, -6.598164, 0, -0.5, 0.5, 0.5,
-3.700666, 2, -6.598164, 1, -0.5, 0.5, 0.5,
-3.700666, 2, -6.598164, 1, 1.5, 0.5, 0.5,
-3.700666, 2, -6.598164, 0, 1.5, 0.5, 0.5
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
-3.242911, -3.610631, -4,
-3.242911, -3.610631, 6,
-3.242911, -3.610631, -4,
-3.395496, -3.772235, -4,
-3.242911, -3.610631, -2,
-3.395496, -3.772235, -2,
-3.242911, -3.610631, 0,
-3.395496, -3.772235, 0,
-3.242911, -3.610631, 2,
-3.395496, -3.772235, 2,
-3.242911, -3.610631, 4,
-3.395496, -3.772235, 4,
-3.242911, -3.610631, 6,
-3.395496, -3.772235, 6
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
"4",
"6"
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
-3.700666, -4.095445, -4, 0, -0.5, 0.5, 0.5,
-3.700666, -4.095445, -4, 1, -0.5, 0.5, 0.5,
-3.700666, -4.095445, -4, 1, 1.5, 0.5, 0.5,
-3.700666, -4.095445, -4, 0, 1.5, 0.5, 0.5,
-3.700666, -4.095445, -2, 0, -0.5, 0.5, 0.5,
-3.700666, -4.095445, -2, 1, -0.5, 0.5, 0.5,
-3.700666, -4.095445, -2, 1, 1.5, 0.5, 0.5,
-3.700666, -4.095445, -2, 0, 1.5, 0.5, 0.5,
-3.700666, -4.095445, 0, 0, -0.5, 0.5, 0.5,
-3.700666, -4.095445, 0, 1, -0.5, 0.5, 0.5,
-3.700666, -4.095445, 0, 1, 1.5, 0.5, 0.5,
-3.700666, -4.095445, 0, 0, 1.5, 0.5, 0.5,
-3.700666, -4.095445, 2, 0, -0.5, 0.5, 0.5,
-3.700666, -4.095445, 2, 1, -0.5, 0.5, 0.5,
-3.700666, -4.095445, 2, 1, 1.5, 0.5, 0.5,
-3.700666, -4.095445, 2, 0, 1.5, 0.5, 0.5,
-3.700666, -4.095445, 4, 0, -0.5, 0.5, 0.5,
-3.700666, -4.095445, 4, 1, -0.5, 0.5, 0.5,
-3.700666, -4.095445, 4, 1, 1.5, 0.5, 0.5,
-3.700666, -4.095445, 4, 0, 1.5, 0.5, 0.5,
-3.700666, -4.095445, 6, 0, -0.5, 0.5, 0.5,
-3.700666, -4.095445, 6, 1, -0.5, 0.5, 0.5,
-3.700666, -4.095445, 6, 1, 1.5, 0.5, 0.5,
-3.700666, -4.095445, 6, 0, 1.5, 0.5, 0.5
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
-3.242911, -3.610631, -5.700778,
-3.242911, 2.853566, -5.700778,
-3.242911, -3.610631, 6.264372,
-3.242911, 2.853566, 6.264372,
-3.242911, -3.610631, -5.700778,
-3.242911, -3.610631, 6.264372,
-3.242911, 2.853566, -5.700778,
-3.242911, 2.853566, 6.264372,
-3.242911, -3.610631, -5.700778,
2.860495, -3.610631, -5.700778,
-3.242911, -3.610631, 6.264372,
2.860495, -3.610631, 6.264372,
-3.242911, 2.853566, -5.700778,
2.860495, 2.853566, -5.700778,
-3.242911, 2.853566, 6.264372,
2.860495, 2.853566, 6.264372,
2.860495, -3.610631, -5.700778,
2.860495, 2.853566, -5.700778,
2.860495, -3.610631, 6.264372,
2.860495, 2.853566, 6.264372,
2.860495, -3.610631, -5.700778,
2.860495, -3.610631, 6.264372,
2.860495, 2.853566, -5.700778,
2.860495, 2.853566, 6.264372
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
var radius = 7.959754;
var distance = 35.41385;
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
mvMatrix.translate( 0.1912081, 0.3785322, -0.2817974 );
mvMatrix.scale( 1.410072, 1.331371, 0.7192757 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.41385);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
ronnel<-read.table("ronnel.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ronnel$V2
```

```
## Error in eval(expr, envir, enclos): object 'ronnel' not found
```

```r
y<-ronnel$V3
```

```
## Error in eval(expr, envir, enclos): object 'ronnel' not found
```

```r
z<-ronnel$V4
```

```
## Error in eval(expr, envir, enclos): object 'ronnel' not found
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
-3.154026, -1.234271, 0.009364553, 0, 0, 1, 1, 1,
-3.096122, 0.951917, -2.102482, 1, 0, 0, 1, 1,
-3.039136, 1.015992, 0.6468109, 1, 0, 0, 1, 1,
-2.902669, 0.7745795, -0.410707, 1, 0, 0, 1, 1,
-2.868502, -0.6574304, -2.406543, 1, 0, 0, 1, 1,
-2.863208, -0.08877882, -1.835079, 1, 0, 0, 1, 1,
-2.809982, 0.01582904, -2.67939, 0, 0, 0, 1, 1,
-2.777569, 1.985438, 0.6757883, 0, 0, 0, 1, 1,
-2.611509, 0.9236902, -1.950413, 0, 0, 0, 1, 1,
-2.608954, 0.5658779, -1.890509, 0, 0, 0, 1, 1,
-2.49995, 1.551624, -0.6279731, 0, 0, 0, 1, 1,
-2.433571, 1.316665, -0.9835069, 0, 0, 0, 1, 1,
-2.386894, -1.087016, -2.699152, 0, 0, 0, 1, 1,
-2.194867, -1.091307, -2.390644, 1, 1, 1, 1, 1,
-2.16085, 0.5268921, -1.494395, 1, 1, 1, 1, 1,
-2.151519, 1.29725, -1.254515, 1, 1, 1, 1, 1,
-2.151, 0.6055775, -1.645793, 1, 1, 1, 1, 1,
-2.107572, 2.544836, -1.781494, 1, 1, 1, 1, 1,
-2.099209, 1.043115, -1.474878, 1, 1, 1, 1, 1,
-2.082367, -1.126753, -4.290771, 1, 1, 1, 1, 1,
-2.081098, 1.238636, -1.605771, 1, 1, 1, 1, 1,
-2.064094, -0.2193818, -3.518776, 1, 1, 1, 1, 1,
-2.063393, -0.6763387, -0.6490469, 1, 1, 1, 1, 1,
-2.031379, -0.9546422, -3.005206, 1, 1, 1, 1, 1,
-2.025302, -0.7373936, -1.286912, 1, 1, 1, 1, 1,
-2.022848, 1.832882, -2.720587, 1, 1, 1, 1, 1,
-2.009525, -0.1037098, -2.112078, 1, 1, 1, 1, 1,
-1.989617, -1.27546, -2.447718, 1, 1, 1, 1, 1,
-1.964579, 0.1193601, -0.9229841, 0, 0, 1, 1, 1,
-1.953433, -0.2283272, -2.592273, 1, 0, 0, 1, 1,
-1.929848, -0.2862205, -2.825621, 1, 0, 0, 1, 1,
-1.924452, -1.473266, -2.63315, 1, 0, 0, 1, 1,
-1.901185, -1.211764, -0.9332135, 1, 0, 0, 1, 1,
-1.86904, 0.12544, -0.9664808, 1, 0, 0, 1, 1,
-1.867055, -0.4541486, -1.293445, 0, 0, 0, 1, 1,
-1.847275, 1.203259, 0.4053605, 0, 0, 0, 1, 1,
-1.83486, 1.304023, -0.7148988, 0, 0, 0, 1, 1,
-1.831941, 0.6976042, -1.446306, 0, 0, 0, 1, 1,
-1.829097, -1.305338, -1.384858, 0, 0, 0, 1, 1,
-1.818362, -1.141228, 0.2419702, 0, 0, 0, 1, 1,
-1.781559, -0.100332, -0.8180192, 0, 0, 0, 1, 1,
-1.752801, -0.1027793, -1.426672, 1, 1, 1, 1, 1,
-1.749878, -1.16956, -1.92443, 1, 1, 1, 1, 1,
-1.732149, -1.101238, -2.405421, 1, 1, 1, 1, 1,
-1.718221, -1.214378, -1.994476, 1, 1, 1, 1, 1,
-1.716949, -0.5632118, -2.845578, 1, 1, 1, 1, 1,
-1.707338, 0.227112, -1.780369, 1, 1, 1, 1, 1,
-1.681967, -0.5988194, -2.450317, 1, 1, 1, 1, 1,
-1.68017, 2.101703, -1.074576, 1, 1, 1, 1, 1,
-1.650712, -1.058849, -3.671346, 1, 1, 1, 1, 1,
-1.64245, -0.2120863, -1.517293, 1, 1, 1, 1, 1,
-1.639653, 0.532968, -1.391032, 1, 1, 1, 1, 1,
-1.633243, -0.9201933, -2.659912, 1, 1, 1, 1, 1,
-1.628987, -0.7757793, -0.7046945, 1, 1, 1, 1, 1,
-1.619128, -1.61842, -1.810758, 1, 1, 1, 1, 1,
-1.609839, -0.1401221, -3.79177, 1, 1, 1, 1, 1,
-1.608353, -1.334106, -3.489047, 0, 0, 1, 1, 1,
-1.606526, 0.01981041, -1.421594, 1, 0, 0, 1, 1,
-1.574446, 1.697955, -0.004843091, 1, 0, 0, 1, 1,
-1.5691, 1.373542, 0.4178815, 1, 0, 0, 1, 1,
-1.552792, 0.3245518, -1.491794, 1, 0, 0, 1, 1,
-1.550587, 0.3232763, -1.703888, 1, 0, 0, 1, 1,
-1.545148, -0.9781963, -3.502555, 0, 0, 0, 1, 1,
-1.541788, 0.1007512, -2.939541, 0, 0, 0, 1, 1,
-1.537073, -1.154535, -3.988137, 0, 0, 0, 1, 1,
-1.530585, 0.4350745, -3.458072, 0, 0, 0, 1, 1,
-1.519377, 0.6414814, -0.5759626, 0, 0, 0, 1, 1,
-1.504902, 0.600578, -2.419052, 0, 0, 0, 1, 1,
-1.492641, 0.6971996, -3.628476, 0, 0, 0, 1, 1,
-1.490138, -0.5738998, -1.554827, 1, 1, 1, 1, 1,
-1.461673, 0.5047256, -2.037769, 1, 1, 1, 1, 1,
-1.448612, 0.7849547, -2.084135, 1, 1, 1, 1, 1,
-1.43868, -1.153818, -3.160148, 1, 1, 1, 1, 1,
-1.437916, 1.391593, -0.2248308, 1, 1, 1, 1, 1,
-1.437262, -0.9604307, -1.905774, 1, 1, 1, 1, 1,
-1.434728, 0.6329005, 0.01566938, 1, 1, 1, 1, 1,
-1.42156, -0.03588865, -2.319278, 1, 1, 1, 1, 1,
-1.419958, -0.08228882, -1.206477, 1, 1, 1, 1, 1,
-1.398514, -0.5932196, -1.886725, 1, 1, 1, 1, 1,
-1.398452, 1.790347, -0.5205972, 1, 1, 1, 1, 1,
-1.392632, -0.106626, -0.9798732, 1, 1, 1, 1, 1,
-1.389408, -1.008137, -1.936925, 1, 1, 1, 1, 1,
-1.385913, -1.279112, -0.9384108, 1, 1, 1, 1, 1,
-1.381886, -0.1972562, -2.14414, 1, 1, 1, 1, 1,
-1.380113, -0.0851019, -1.23023, 0, 0, 1, 1, 1,
-1.350118, -0.1187283, -2.672136, 1, 0, 0, 1, 1,
-1.343003, -0.6436607, -1.1638, 1, 0, 0, 1, 1,
-1.335295, -1.294025, -4.06661, 1, 0, 0, 1, 1,
-1.335192, -1.231343, -2.302349, 1, 0, 0, 1, 1,
-1.331666, 0.4508644, -2.21694, 1, 0, 0, 1, 1,
-1.329316, 1.361729, -1.552915, 0, 0, 0, 1, 1,
-1.329063, 0.5528491, -2.368832, 0, 0, 0, 1, 1,
-1.328188, -0.3353861, -1.340527, 0, 0, 0, 1, 1,
-1.31759, -0.3943712, -2.124828, 0, 0, 0, 1, 1,
-1.316662, 0.7891835, -1.162768, 0, 0, 0, 1, 1,
-1.314212, -0.3878549, -1.374522, 0, 0, 0, 1, 1,
-1.310191, 0.8940261, 0.02368568, 0, 0, 0, 1, 1,
-1.304257, -0.07262862, 0.7024209, 1, 1, 1, 1, 1,
-1.301617, -0.2158279, -2.407389, 1, 1, 1, 1, 1,
-1.301005, -0.1482278, -2.50015, 1, 1, 1, 1, 1,
-1.292621, -0.3299038, -5.027309, 1, 1, 1, 1, 1,
-1.28988, 1.405918, -1.009967, 1, 1, 1, 1, 1,
-1.28668, -0.03810115, -1.981829, 1, 1, 1, 1, 1,
-1.282372, -0.6707662, -2.42019, 1, 1, 1, 1, 1,
-1.281283, -1.756798, -2.709281, 1, 1, 1, 1, 1,
-1.27982, 0.5107993, -1.772672, 1, 1, 1, 1, 1,
-1.272194, -0.3792049, -2.495702, 1, 1, 1, 1, 1,
-1.263782, 0.02913292, -0.4461329, 1, 1, 1, 1, 1,
-1.259336, -0.3748884, -1.478671, 1, 1, 1, 1, 1,
-1.252547, 0.6953847, 0.7659487, 1, 1, 1, 1, 1,
-1.252269, -1.632439, -2.326468, 1, 1, 1, 1, 1,
-1.248283, 0.16676, -1.323045, 1, 1, 1, 1, 1,
-1.2461, 1.074386, -1.666203, 0, 0, 1, 1, 1,
-1.245027, 1.785792, -1.469602, 1, 0, 0, 1, 1,
-1.23856, 2.35974, 0.2544675, 1, 0, 0, 1, 1,
-1.237879, 0.2340563, -1.870351, 1, 0, 0, 1, 1,
-1.232113, 0.9834667, 0.03129428, 1, 0, 0, 1, 1,
-1.225024, 0.1128222, -2.113293, 1, 0, 0, 1, 1,
-1.223091, 0.2851247, -0.3310883, 0, 0, 0, 1, 1,
-1.215826, 0.382479, -1.556407, 0, 0, 0, 1, 1,
-1.208654, -0.7342965, -2.65258, 0, 0, 0, 1, 1,
-1.206528, -0.7270029, -0.499004, 0, 0, 0, 1, 1,
-1.202702, -0.7872923, -2.562814, 0, 0, 0, 1, 1,
-1.195781, -1.882781, -1.914687, 0, 0, 0, 1, 1,
-1.193351, -0.3891023, -2.968493, 0, 0, 0, 1, 1,
-1.191798, -0.1128188, 0.03587313, 1, 1, 1, 1, 1,
-1.190511, -0.3979276, -0.790205, 1, 1, 1, 1, 1,
-1.189863, -0.2157794, -3.348097, 1, 1, 1, 1, 1,
-1.18291, -0.351016, -2.248063, 1, 1, 1, 1, 1,
-1.174952, 0.5053856, -1.363938, 1, 1, 1, 1, 1,
-1.164302, 0.02312476, -2.378964, 1, 1, 1, 1, 1,
-1.163696, 1.180619, -0.3125046, 1, 1, 1, 1, 1,
-1.162169, -0.9641384, -2.006024, 1, 1, 1, 1, 1,
-1.16052, -0.3946755, -1.96024, 1, 1, 1, 1, 1,
-1.160025, -0.9737469, -3.344638, 1, 1, 1, 1, 1,
-1.152567, -0.008388831, -1.010686, 1, 1, 1, 1, 1,
-1.146286, 1.805046, -0.8119695, 1, 1, 1, 1, 1,
-1.145371, 0.6824456, -0.50047, 1, 1, 1, 1, 1,
-1.138445, 0.633984, -2.348286, 1, 1, 1, 1, 1,
-1.136508, -1.220504, -1.475381, 1, 1, 1, 1, 1,
-1.133777, -1.006442, -3.530789, 0, 0, 1, 1, 1,
-1.128608, -0.04910813, -1.126968, 1, 0, 0, 1, 1,
-1.122165, 0.289665, -1.211379, 1, 0, 0, 1, 1,
-1.108174, -1.081143, -2.848, 1, 0, 0, 1, 1,
-1.102809, -2.367417, -2.992182, 1, 0, 0, 1, 1,
-1.101755, -0.3549013, -2.086504, 1, 0, 0, 1, 1,
-1.092895, -2.174685, -3.253611, 0, 0, 0, 1, 1,
-1.092824, -0.5873284, -3.128734, 0, 0, 0, 1, 1,
-1.088946, 1.638423, 1.270332, 0, 0, 0, 1, 1,
-1.082291, -1.195056, -3.418609, 0, 0, 0, 1, 1,
-1.081198, -1.022726, -2.244932, 0, 0, 0, 1, 1,
-1.078329, 0.9232984, -3.035192, 0, 0, 0, 1, 1,
-1.078166, 0.1251568, -2.305969, 0, 0, 0, 1, 1,
-1.07331, 0.1777646, -1.59487, 1, 1, 1, 1, 1,
-1.071311, -0.6008162, -1.337418, 1, 1, 1, 1, 1,
-1.054349, -2.009088, -2.605465, 1, 1, 1, 1, 1,
-1.05205, -1.077574, -2.812099, 1, 1, 1, 1, 1,
-1.049965, -0.9930469, -2.987611, 1, 1, 1, 1, 1,
-1.049846, 0.707841, -0.4693469, 1, 1, 1, 1, 1,
-1.04452, 1.996443, -0.7647127, 1, 1, 1, 1, 1,
-1.037864, 0.6976217, 0.627645, 1, 1, 1, 1, 1,
-1.035453, -0.6913898, -3.480825, 1, 1, 1, 1, 1,
-1.033354, -1.250314, -1.958035, 1, 1, 1, 1, 1,
-1.028688, 0.9507382, -2.669299, 1, 1, 1, 1, 1,
-1.026749, 0.6374259, -0.3572927, 1, 1, 1, 1, 1,
-1.023258, -0.6381468, -1.231821, 1, 1, 1, 1, 1,
-1.018933, 0.3643231, -2.018747, 1, 1, 1, 1, 1,
-1.010282, 1.308661, -0.8479888, 1, 1, 1, 1, 1,
-1.009167, 1.175361, 1.108577, 0, 0, 1, 1, 1,
-0.9978023, 0.1242687, -1.60908, 1, 0, 0, 1, 1,
-0.9928177, 1.517133, 0.1378369, 1, 0, 0, 1, 1,
-0.9917486, 1.767522, 0.3179016, 1, 0, 0, 1, 1,
-0.9889585, -1.398111, -4.172175, 1, 0, 0, 1, 1,
-0.9829709, 2.74861, 0.9564612, 1, 0, 0, 1, 1,
-0.979255, 0.1393418, -1.489486, 0, 0, 0, 1, 1,
-0.9778795, 0.02077525, 1.365417, 0, 0, 0, 1, 1,
-0.9731649, -0.6780249, -1.614283, 0, 0, 0, 1, 1,
-0.9710306, -0.04120762, -1.752779, 0, 0, 0, 1, 1,
-0.9666157, -0.3047523, -1.088925, 0, 0, 0, 1, 1,
-0.9569891, 1.326064, -2.392789, 0, 0, 0, 1, 1,
-0.9558124, 0.443971, -2.012959, 0, 0, 0, 1, 1,
-0.9499621, -0.2116911, -1.884899, 1, 1, 1, 1, 1,
-0.9482541, 0.2851227, -0.6463698, 1, 1, 1, 1, 1,
-0.9479068, 1.206665, 2.592566, 1, 1, 1, 1, 1,
-0.9383827, -0.9132873, -1.317806, 1, 1, 1, 1, 1,
-0.9375411, 0.3229595, -2.236073, 1, 1, 1, 1, 1,
-0.9347295, -2.038714, -2.102366, 1, 1, 1, 1, 1,
-0.9330193, -0.1109037, -2.518636, 1, 1, 1, 1, 1,
-0.9268507, -0.4046083, -4.134993, 1, 1, 1, 1, 1,
-0.9229327, -0.6969795, -2.103579, 1, 1, 1, 1, 1,
-0.9204226, 0.2452836, 0.3032022, 1, 1, 1, 1, 1,
-0.9188045, -0.01543529, -1.833263, 1, 1, 1, 1, 1,
-0.912797, -0.8330285, -1.978958, 1, 1, 1, 1, 1,
-0.9072214, -1.901864, -2.877535, 1, 1, 1, 1, 1,
-0.9007565, 1.427389, -0.7910231, 1, 1, 1, 1, 1,
-0.8961533, 0.4308278, -1.795213, 1, 1, 1, 1, 1,
-0.894868, 0.1664568, -0.205228, 0, 0, 1, 1, 1,
-0.885927, -0.3681229, -3.556039, 1, 0, 0, 1, 1,
-0.8840993, -0.4319226, -2.070735, 1, 0, 0, 1, 1,
-0.8836108, -0.3316169, -2.495562, 1, 0, 0, 1, 1,
-0.8783513, 0.5574136, -2.673883, 1, 0, 0, 1, 1,
-0.8764011, -0.1960041, -3.352206, 1, 0, 0, 1, 1,
-0.8689089, 1.443876, -0.926611, 0, 0, 0, 1, 1,
-0.8623603, -0.2686618, -3.067111, 0, 0, 0, 1, 1,
-0.8572649, 1.35574, 0.9458441, 0, 0, 0, 1, 1,
-0.8566896, -2.029923, -3.736645, 0, 0, 0, 1, 1,
-0.8542324, 0.4531683, -2.557745, 0, 0, 0, 1, 1,
-0.8499622, 0.5115734, -2.760052, 0, 0, 0, 1, 1,
-0.8466767, 0.2558616, -0.9466698, 0, 0, 0, 1, 1,
-0.8388295, 2.035021, -0.4031451, 1, 1, 1, 1, 1,
-0.8278503, -2.004867, -3.126448, 1, 1, 1, 1, 1,
-0.823038, 0.7397037, -0.3574484, 1, 1, 1, 1, 1,
-0.8211315, 1.259333, -0.5776917, 1, 1, 1, 1, 1,
-0.8147114, 0.8847849, -0.8847058, 1, 1, 1, 1, 1,
-0.8109408, -0.8238962, -1.396467, 1, 1, 1, 1, 1,
-0.8095093, 0.8633124, -0.7626557, 1, 1, 1, 1, 1,
-0.8079485, 0.3157799, 0.08078638, 1, 1, 1, 1, 1,
-0.8054633, 0.4774637, -1.869954, 1, 1, 1, 1, 1,
-0.777756, 0.4953426, -1.433643, 1, 1, 1, 1, 1,
-0.773939, 0.910565, -1.577006, 1, 1, 1, 1, 1,
-0.7724906, -1.429377, -2.067793, 1, 1, 1, 1, 1,
-0.7716667, 1.17176, -3.373061, 1, 1, 1, 1, 1,
-0.76753, -0.4499313, -2.46899, 1, 1, 1, 1, 1,
-0.7635503, 1.378261, -3.505672, 1, 1, 1, 1, 1,
-0.7605937, 0.4291524, -0.3955473, 0, 0, 1, 1, 1,
-0.7602487, -0.132723, -3.718374, 1, 0, 0, 1, 1,
-0.7600805, 0.6831037, 0.338376, 1, 0, 0, 1, 1,
-0.7579278, -0.301661, -2.217646, 1, 0, 0, 1, 1,
-0.7521877, 0.7833037, -0.0961514, 1, 0, 0, 1, 1,
-0.7455686, -0.2439276, -1.995035, 1, 0, 0, 1, 1,
-0.7435337, -0.1410208, -1.983209, 0, 0, 0, 1, 1,
-0.7398255, 0.07731557, -0.8545386, 0, 0, 0, 1, 1,
-0.7379621, -0.7033315, -4.620961, 0, 0, 0, 1, 1,
-0.7354149, -1.73098, -4.029582, 0, 0, 0, 1, 1,
-0.7277176, -0.4785866, -2.435195, 0, 0, 0, 1, 1,
-0.7255175, 0.3844513, -1.982112, 0, 0, 0, 1, 1,
-0.7237484, 0.2292291, -2.940948, 0, 0, 0, 1, 1,
-0.7146249, -0.1259451, -2.049284, 1, 1, 1, 1, 1,
-0.7136084, 0.01962906, -2.854893, 1, 1, 1, 1, 1,
-0.7097693, -0.01867622, -0.7649412, 1, 1, 1, 1, 1,
-0.708051, 0.5554758, -0.00422434, 1, 1, 1, 1, 1,
-0.7067137, 0.1946553, -1.154205, 1, 1, 1, 1, 1,
-0.7051694, 0.8816166, -1.629181, 1, 1, 1, 1, 1,
-0.6961061, 1.072417, -1.81289, 1, 1, 1, 1, 1,
-0.6955404, 0.2276797, -0.3914024, 1, 1, 1, 1, 1,
-0.6954282, -0.5494487, -3.381634, 1, 1, 1, 1, 1,
-0.6945928, -1.233928, -1.589119, 1, 1, 1, 1, 1,
-0.6917393, -1.064515, -4.123257, 1, 1, 1, 1, 1,
-0.6891072, -1.527718, -2.593609, 1, 1, 1, 1, 1,
-0.687126, 0.02968856, -0.5780329, 1, 1, 1, 1, 1,
-0.6863797, 0.2749325, -1.23299, 1, 1, 1, 1, 1,
-0.6738109, 0.3235987, -1.566112, 1, 1, 1, 1, 1,
-0.6611868, 1.056353, -2.562483, 0, 0, 1, 1, 1,
-0.6587636, 0.1198176, -1.790652, 1, 0, 0, 1, 1,
-0.6567895, 0.5514014, -0.9445827, 1, 0, 0, 1, 1,
-0.6555368, -1.269777, -0.5969288, 1, 0, 0, 1, 1,
-0.6545678, -1.005411, -2.479164, 1, 0, 0, 1, 1,
-0.6525596, -0.2081001, -1.225252, 1, 0, 0, 1, 1,
-0.6521342, 0.1818284, -0.292794, 0, 0, 0, 1, 1,
-0.6491612, 1.293172, 0.930359, 0, 0, 0, 1, 1,
-0.6464693, 0.549742, 0.2607654, 0, 0, 0, 1, 1,
-0.6451531, 0.2478831, -1.148757, 0, 0, 0, 1, 1,
-0.6350222, 0.2409928, -0.3046116, 0, 0, 0, 1, 1,
-0.6322894, -0.6251642, -3.151931, 0, 0, 0, 1, 1,
-0.6312356, -0.4947647, -1.943383, 0, 0, 0, 1, 1,
-0.6269758, 1.487146, -0.09911954, 1, 1, 1, 1, 1,
-0.6268582, -2.126313, -2.807573, 1, 1, 1, 1, 1,
-0.6264502, 0.6389081, -0.2528927, 1, 1, 1, 1, 1,
-0.6216738, 0.861504, -1.94563, 1, 1, 1, 1, 1,
-0.6209552, 1.213492, 0.860426, 1, 1, 1, 1, 1,
-0.6193574, -0.3673168, -2.5054, 1, 1, 1, 1, 1,
-0.6139763, -0.9314117, -3.546234, 1, 1, 1, 1, 1,
-0.6071783, -1.887692, -2.787977, 1, 1, 1, 1, 1,
-0.6049134, 1.03201, -0.9812973, 1, 1, 1, 1, 1,
-0.5992093, -1.157484, -2.900528, 1, 1, 1, 1, 1,
-0.5924879, -1.247686, -2.465573, 1, 1, 1, 1, 1,
-0.591894, -1.023474, -5.525113, 1, 1, 1, 1, 1,
-0.5903255, 1.271876, -1.365101, 1, 1, 1, 1, 1,
-0.5826325, -1.240359, -3.317862, 1, 1, 1, 1, 1,
-0.5770361, -0.5223334, -1.933773, 1, 1, 1, 1, 1,
-0.5717251, 0.6574136, -1.96294, 0, 0, 1, 1, 1,
-0.5625376, 1.492863, 0.1463124, 1, 0, 0, 1, 1,
-0.5620935, -0.4546678, -1.939005, 1, 0, 0, 1, 1,
-0.5589843, -1.457434, -1.560072, 1, 0, 0, 1, 1,
-0.5577075, 0.06310014, -2.712031, 1, 0, 0, 1, 1,
-0.5576515, 0.4212884, -3.195949, 1, 0, 0, 1, 1,
-0.552917, 1.50922, -2.709704, 0, 0, 0, 1, 1,
-0.5523963, 0.9336001, -1.481219, 0, 0, 0, 1, 1,
-0.54139, -0.7465571, -3.295631, 0, 0, 0, 1, 1,
-0.536962, 1.149157, -3.013572, 0, 0, 0, 1, 1,
-0.536345, -0.2958099, -2.6803, 0, 0, 0, 1, 1,
-0.5343186, -0.2886658, -2.792806, 0, 0, 0, 1, 1,
-0.5317122, 0.5381386, -0.7896019, 0, 0, 0, 1, 1,
-0.5312659, -0.5966158, -1.898376, 1, 1, 1, 1, 1,
-0.528084, -1.065117, -3.974525, 1, 1, 1, 1, 1,
-0.5265855, 0.1109462, -0.3458613, 1, 1, 1, 1, 1,
-0.5214922, -0.9603185, -2.601849, 1, 1, 1, 1, 1,
-0.5210053, 2.335158, 1.956155, 1, 1, 1, 1, 1,
-0.5193096, 0.9993392, -0.8842407, 1, 1, 1, 1, 1,
-0.5151588, 0.9360777, -2.394585, 1, 1, 1, 1, 1,
-0.5138218, 0.1702807, 0.3233685, 1, 1, 1, 1, 1,
-0.5129772, 1.331246, 0.1675708, 1, 1, 1, 1, 1,
-0.5073685, 0.3457419, -0.06572662, 1, 1, 1, 1, 1,
-0.5064112, -0.2651621, -2.702041, 1, 1, 1, 1, 1,
-0.5036039, -0.4711033, -2.684851, 1, 1, 1, 1, 1,
-0.501128, -0.7969465, -3.73849, 1, 1, 1, 1, 1,
-0.498297, 0.7037485, -1.29019, 1, 1, 1, 1, 1,
-0.4978829, 1.223262, 0.3199357, 1, 1, 1, 1, 1,
-0.495001, 0.3430919, -1.34961, 0, 0, 1, 1, 1,
-0.4921697, 2.759427, -0.979318, 1, 0, 0, 1, 1,
-0.4877964, 0.5388113, -1.699762, 1, 0, 0, 1, 1,
-0.4800475, 0.5513922, -1.785578, 1, 0, 0, 1, 1,
-0.4745402, -1.081533, -2.65432, 1, 0, 0, 1, 1,
-0.4736702, 0.9338835, -2.323898, 1, 0, 0, 1, 1,
-0.4724653, -0.5069705, -1.202362, 0, 0, 0, 1, 1,
-0.4650063, 0.8083401, -0.2142997, 0, 0, 0, 1, 1,
-0.464127, -0.05422367, -1.682855, 0, 0, 0, 1, 1,
-0.4596919, -1.161791, -1.082011, 0, 0, 0, 1, 1,
-0.4579299, 0.402384, -0.6626288, 0, 0, 0, 1, 1,
-0.4560217, -1.144593, -2.5496, 0, 0, 0, 1, 1,
-0.4558645, 0.934387, 0.2337859, 0, 0, 0, 1, 1,
-0.4548557, 0.3663379, -0.9672775, 1, 1, 1, 1, 1,
-0.4522288, 0.6697753, -1.044149, 1, 1, 1, 1, 1,
-0.4508866, -1.611333, -2.712083, 1, 1, 1, 1, 1,
-0.4504558, 1.447031, 0.2704119, 1, 1, 1, 1, 1,
-0.4491937, 2.365596, 0.2373495, 1, 1, 1, 1, 1,
-0.4484995, -0.248384, -2.386355, 1, 1, 1, 1, 1,
-0.4447321, -1.16253, -3.863093, 1, 1, 1, 1, 1,
-0.4441894, 0.266887, -0.1195116, 1, 1, 1, 1, 1,
-0.4436452, 0.1055764, -2.911713, 1, 1, 1, 1, 1,
-0.4386368, 0.06348502, -0.8636627, 1, 1, 1, 1, 1,
-0.4383776, 1.37727, 0.5401373, 1, 1, 1, 1, 1,
-0.4381221, 0.6407341, 0.03497184, 1, 1, 1, 1, 1,
-0.4373561, -0.875888, -3.314279, 1, 1, 1, 1, 1,
-0.4338627, -1.679404, -2.679661, 1, 1, 1, 1, 1,
-0.4329913, 0.5431195, -0.9752503, 1, 1, 1, 1, 1,
-0.4321006, -0.406802, -0.3041135, 0, 0, 1, 1, 1,
-0.4317326, -0.5450065, -1.264914, 1, 0, 0, 1, 1,
-0.4287303, -1.865343, -2.727917, 1, 0, 0, 1, 1,
-0.4279791, -0.9806998, -1.235307, 1, 0, 0, 1, 1,
-0.4267673, 0.3493343, -0.732699, 1, 0, 0, 1, 1,
-0.4265836, -0.9160402, -3.776595, 1, 0, 0, 1, 1,
-0.4248183, -0.5138589, -1.249448, 0, 0, 0, 1, 1,
-0.4197988, -1.718491, -3.500379, 0, 0, 0, 1, 1,
-0.4171666, -0.3711194, -3.246506, 0, 0, 0, 1, 1,
-0.4146603, -0.5823529, -3.057806, 0, 0, 0, 1, 1,
-0.4145336, -0.4288361, -3.317808, 0, 0, 0, 1, 1,
-0.4144858, 0.4574026, -1.393725, 0, 0, 0, 1, 1,
-0.4068761, -0.2640561, -3.541107, 0, 0, 0, 1, 1,
-0.4017458, -1.136017, -2.874909, 1, 1, 1, 1, 1,
-0.399287, -0.3472885, -4.377957, 1, 1, 1, 1, 1,
-0.3903293, 0.1073401, -2.727756, 1, 1, 1, 1, 1,
-0.3902815, -1.251963, -2.279472, 1, 1, 1, 1, 1,
-0.3877613, -0.6776572, -2.649165, 1, 1, 1, 1, 1,
-0.3875606, 0.6026964, -0.3012985, 1, 1, 1, 1, 1,
-0.3873077, -1.046505, -0.4460288, 1, 1, 1, 1, 1,
-0.3822501, 0.5036491, -0.6613577, 1, 1, 1, 1, 1,
-0.3795784, 2.116551, -0.7618751, 1, 1, 1, 1, 1,
-0.3778261, 0.07420862, -1.787906, 1, 1, 1, 1, 1,
-0.3740954, -1.568892, -3.17126, 1, 1, 1, 1, 1,
-0.3739289, -0.1933933, -3.709838, 1, 1, 1, 1, 1,
-0.3716956, -1.254016, -2.474576, 1, 1, 1, 1, 1,
-0.3685837, -1.648336, -3.461557, 1, 1, 1, 1, 1,
-0.3655576, -1.681511, -1.923067, 1, 1, 1, 1, 1,
-0.3597694, 0.2591924, -1.980306, 0, 0, 1, 1, 1,
-0.3589503, 0.09321637, -2.977271, 1, 0, 0, 1, 1,
-0.3571639, 0.5447456, -0.5559479, 1, 0, 0, 1, 1,
-0.3543581, 0.6581345, -0.6077414, 1, 0, 0, 1, 1,
-0.3480338, 0.945811, -1.212445, 1, 0, 0, 1, 1,
-0.346082, -1.747913, -2.833378, 1, 0, 0, 1, 1,
-0.3363903, 1.27309, 0.1854094, 0, 0, 0, 1, 1,
-0.3347667, 0.174348, -0.375068, 0, 0, 0, 1, 1,
-0.3299704, 1.031123, -0.5446188, 0, 0, 0, 1, 1,
-0.3294508, 0.2201392, 0.02301338, 0, 0, 0, 1, 1,
-0.3268616, -0.7966844, -4.632114, 0, 0, 0, 1, 1,
-0.3187355, 1.862747, -0.4529059, 0, 0, 0, 1, 1,
-0.3139542, -1.629922, -2.175537, 0, 0, 0, 1, 1,
-0.3110709, -0.6598865, -1.250868, 1, 1, 1, 1, 1,
-0.3074667, 0.5752555, -0.2331676, 1, 1, 1, 1, 1,
-0.3074629, -0.5417367, -2.637472, 1, 1, 1, 1, 1,
-0.3061477, 0.6956487, 0.9139143, 1, 1, 1, 1, 1,
-0.3048238, 0.01748223, -3.000364, 1, 1, 1, 1, 1,
-0.3022652, 0.3465368, 0.2331079, 1, 1, 1, 1, 1,
-0.3020574, -0.577273, -2.485123, 1, 1, 1, 1, 1,
-0.2995734, 0.3515886, -1.194843, 1, 1, 1, 1, 1,
-0.2964355, -1.490787, -5.526528, 1, 1, 1, 1, 1,
-0.2957143, -0.8603989, -4.531744, 1, 1, 1, 1, 1,
-0.2957098, 0.4559152, -0.6455441, 1, 1, 1, 1, 1,
-0.2956536, 0.8111454, -1.157207, 1, 1, 1, 1, 1,
-0.2917988, -1.583966, -2.192759, 1, 1, 1, 1, 1,
-0.2906629, 1.341757, 0.8096927, 1, 1, 1, 1, 1,
-0.2850238, 0.07062648, -1.166741, 1, 1, 1, 1, 1,
-0.2822416, -1.874742, -2.799479, 0, 0, 1, 1, 1,
-0.2821049, 1.837837, 0.7848818, 1, 0, 0, 1, 1,
-0.2818651, -1.016107, -2.278812, 1, 0, 0, 1, 1,
-0.2786261, 0.9379112, 0.1132959, 1, 0, 0, 1, 1,
-0.277668, 1.926764, -1.691386, 1, 0, 0, 1, 1,
-0.2688692, -0.5250984, -2.600723, 1, 0, 0, 1, 1,
-0.2682039, -1.883085, -1.184495, 0, 0, 0, 1, 1,
-0.2664682, 0.8346696, -0.9421864, 0, 0, 0, 1, 1,
-0.2643631, 0.2923267, -0.1760882, 0, 0, 0, 1, 1,
-0.2642972, -1.647453, -3.562947, 0, 0, 0, 1, 1,
-0.2636725, -0.1800812, -2.707729, 0, 0, 0, 1, 1,
-0.2627691, -0.5069585, -1.641135, 0, 0, 0, 1, 1,
-0.2616374, -2.449876, -3.406103, 0, 0, 0, 1, 1,
-0.2587566, 0.4386654, -2.233026, 1, 1, 1, 1, 1,
-0.2515346, 1.634534, -0.594441, 1, 1, 1, 1, 1,
-0.2471569, -1.115081, -3.261812, 1, 1, 1, 1, 1,
-0.2419781, 0.04801806, -0.4543868, 1, 1, 1, 1, 1,
-0.2377797, -2.922039, -3.319657, 1, 1, 1, 1, 1,
-0.2371424, -0.689589, -2.775786, 1, 1, 1, 1, 1,
-0.2359641, -0.5085076, -0.9933451, 1, 1, 1, 1, 1,
-0.2325685, 0.1369928, -1.20406, 1, 1, 1, 1, 1,
-0.2309196, 0.7311481, 0.9604818, 1, 1, 1, 1, 1,
-0.2294636, -1.011331, -4.81781, 1, 1, 1, 1, 1,
-0.2246802, 0.3326614, -0.2103828, 1, 1, 1, 1, 1,
-0.2234922, 0.8247733, -1.311381, 1, 1, 1, 1, 1,
-0.2226193, -1.698229, -1.96245, 1, 1, 1, 1, 1,
-0.221036, -0.5985364, -4.58242, 1, 1, 1, 1, 1,
-0.218044, 0.4147376, -1.567184, 1, 1, 1, 1, 1,
-0.2123475, 0.07750522, 0.7285022, 0, 0, 1, 1, 1,
-0.2121823, 0.03583036, -1.162153, 1, 0, 0, 1, 1,
-0.1998474, 1.729361, 1.025741, 1, 0, 0, 1, 1,
-0.1950014, 0.7006018, -0.9889991, 1, 0, 0, 1, 1,
-0.1818684, 0.8259065, 0.2701825, 1, 0, 0, 1, 1,
-0.173806, -2.236506, -3.148993, 1, 0, 0, 1, 1,
-0.1704071, 0.4929118, 0.7489265, 0, 0, 0, 1, 1,
-0.169312, -0.9704758, -2.452213, 0, 0, 0, 1, 1,
-0.1687561, 0.3821331, -0.5684679, 0, 0, 0, 1, 1,
-0.1685125, 0.2960916, 0.4705247, 0, 0, 0, 1, 1,
-0.1684035, -0.4505318, -2.174588, 0, 0, 0, 1, 1,
-0.1650365, 1.843805, -0.07395937, 0, 0, 0, 1, 1,
-0.1634662, -0.01518315, -1.613527, 0, 0, 0, 1, 1,
-0.1606009, 0.9276066, 1.211112, 1, 1, 1, 1, 1,
-0.1599962, -0.4694495, -2.427834, 1, 1, 1, 1, 1,
-0.1571731, -0.4183158, -2.741804, 1, 1, 1, 1, 1,
-0.1567333, 1.765463, -0.8349185, 1, 1, 1, 1, 1,
-0.1508601, -1.224866, -3.973609, 1, 1, 1, 1, 1,
-0.1495487, 0.04940911, -2.300637, 1, 1, 1, 1, 1,
-0.1492467, -0.788881, -2.893331, 1, 1, 1, 1, 1,
-0.1492325, 0.305351, 0.2056021, 1, 1, 1, 1, 1,
-0.1474713, -0.7792416, -3.117861, 1, 1, 1, 1, 1,
-0.1457923, -0.08936444, -2.012828, 1, 1, 1, 1, 1,
-0.1440846, 1.299184, -1.129598, 1, 1, 1, 1, 1,
-0.1397763, 1.080759, -0.3157956, 1, 1, 1, 1, 1,
-0.1347771, -0.4270287, -4.302914, 1, 1, 1, 1, 1,
-0.1339077, -0.9793202, -3.314107, 1, 1, 1, 1, 1,
-0.1305681, 0.8284451, -0.3269861, 1, 1, 1, 1, 1,
-0.1267331, -0.760261, -0.7994059, 0, 0, 1, 1, 1,
-0.1234517, -1.899659, -3.525132, 1, 0, 0, 1, 1,
-0.1224155, -0.2060987, -1.234347, 1, 0, 0, 1, 1,
-0.122343, -1.289101, -3.988315, 1, 0, 0, 1, 1,
-0.1219629, -0.7619666, -2.517004, 1, 0, 0, 1, 1,
-0.1192802, -0.03938126, -3.276566, 1, 0, 0, 1, 1,
-0.1175441, 0.557831, -1.171155, 0, 0, 0, 1, 1,
-0.116688, -0.514006, -3.51006, 0, 0, 0, 1, 1,
-0.1140967, -0.4305456, -3.276372, 0, 0, 0, 1, 1,
-0.1125226, -0.8791533, -1.709202, 0, 0, 0, 1, 1,
-0.1114774, 0.8918742, -1.563722, 0, 0, 0, 1, 1,
-0.1094353, -0.582601, -3.329943, 0, 0, 0, 1, 1,
-0.1056136, -1.415586, -0.9179771, 0, 0, 0, 1, 1,
-0.1028994, -1.163838, -3.471655, 1, 1, 1, 1, 1,
-0.1018316, -0.376697, -2.966071, 1, 1, 1, 1, 1,
-0.1009631, -0.1306721, -1.514553, 1, 1, 1, 1, 1,
-0.09794047, 1.300597, -0.7508097, 1, 1, 1, 1, 1,
-0.09134204, 0.8422616, -1.128431, 1, 1, 1, 1, 1,
-0.09018274, -2.560905, -1.259365, 1, 1, 1, 1, 1,
-0.08956651, -0.1009774, -2.129652, 1, 1, 1, 1, 1,
-0.08182116, -0.3707898, -2.603467, 1, 1, 1, 1, 1,
-0.07880036, -0.2625595, -2.592046, 1, 1, 1, 1, 1,
-0.07713603, -1.026064, -1.7608, 1, 1, 1, 1, 1,
-0.07417168, 0.04220222, 0.2033019, 1, 1, 1, 1, 1,
-0.07289871, 0.1299576, 0.01898043, 1, 1, 1, 1, 1,
-0.07172415, 0.57245, 0.593558, 1, 1, 1, 1, 1,
-0.07132778, -0.3199054, -4.563601, 1, 1, 1, 1, 1,
-0.07074779, -0.27934, -2.430821, 1, 1, 1, 1, 1,
-0.06590817, -0.8138832, -3.720934, 0, 0, 1, 1, 1,
-0.06391858, -2.016622, -3.952845, 1, 0, 0, 1, 1,
-0.05958516, 0.6484905, -0.5374557, 1, 0, 0, 1, 1,
-0.05882953, -0.1230925, -1.70255, 1, 0, 0, 1, 1,
-0.05232279, 0.7467211, 1.497002, 1, 0, 0, 1, 1,
-0.05009539, 1.254066, -0.654093, 1, 0, 0, 1, 1,
-0.04954419, 0.460474, -0.8656388, 0, 0, 0, 1, 1,
-0.04643653, 1.035234, 1.282221, 0, 0, 0, 1, 1,
-0.04600509, -0.297065, -3.544216, 0, 0, 0, 1, 1,
-0.04362027, 0.9880285, 0.0279359, 0, 0, 0, 1, 1,
-0.04000158, -0.3214557, -3.36903, 0, 0, 0, 1, 1,
-0.03582687, 1.221306, -0.7007419, 0, 0, 0, 1, 1,
-0.03521859, -1.098129, -2.341852, 0, 0, 0, 1, 1,
-0.03516058, -1.468605, -1.208395, 1, 1, 1, 1, 1,
-0.03463041, 1.032838, -0.2053239, 1, 1, 1, 1, 1,
-0.03195393, 1.960104, 0.6412463, 1, 1, 1, 1, 1,
-0.02914415, 0.6792375, 0.07507081, 1, 1, 1, 1, 1,
-0.01705904, 1.030933, 0.3737746, 1, 1, 1, 1, 1,
-0.0140207, -0.7689196, -4.51659, 1, 1, 1, 1, 1,
-0.01195819, 0.7729838, -0.1758918, 1, 1, 1, 1, 1,
-0.01050266, -0.2361242, -3.038125, 1, 1, 1, 1, 1,
-0.009744736, -0.02113157, -2.249259, 1, 1, 1, 1, 1,
-0.009506508, 0.1880443, -0.01556777, 1, 1, 1, 1, 1,
-0.00826774, -1.427735, -2.556795, 1, 1, 1, 1, 1,
-0.008006823, 1.492426, -0.1630022, 1, 1, 1, 1, 1,
-0.0007887862, -0.05871803, -5.083471, 1, 1, 1, 1, 1,
-0.0006062256, 1.202291, 0.05310439, 1, 1, 1, 1, 1,
0.003027503, -1.827718, 4.108995, 1, 1, 1, 1, 1,
0.00526196, -0.7294632, 1.747118, 0, 0, 1, 1, 1,
0.005577478, 0.84574, -0.7516785, 1, 0, 0, 1, 1,
0.006051921, -0.3487506, 3.882129, 1, 0, 0, 1, 1,
0.007911123, -0.8652702, 3.033232, 1, 0, 0, 1, 1,
0.009878816, 0.1241542, 0.5184558, 1, 0, 0, 1, 1,
0.01780777, 0.2898881, -0.4970587, 1, 0, 0, 1, 1,
0.02049089, 0.6948559, -1.32619, 0, 0, 0, 1, 1,
0.02297622, 0.6431444, -1.404023, 0, 0, 0, 1, 1,
0.02739152, 2.056989, 0.2008587, 0, 0, 0, 1, 1,
0.02847465, -1.141198, 4.402965, 0, 0, 0, 1, 1,
0.03377399, 1.348471, -2.494539, 0, 0, 0, 1, 1,
0.03605574, -1.01934, 3.46205, 0, 0, 0, 1, 1,
0.03661245, 1.210816, -0.6670533, 0, 0, 0, 1, 1,
0.03690996, -0.6839215, 4.384068, 1, 1, 1, 1, 1,
0.03808179, 0.1683565, -0.4722778, 1, 1, 1, 1, 1,
0.03809069, 0.9947063, 1.640713, 1, 1, 1, 1, 1,
0.038713, 0.9097147, 0.3408743, 1, 1, 1, 1, 1,
0.03965943, -1.095081, 2.676321, 1, 1, 1, 1, 1,
0.04957609, -0.5946825, 4.375145, 1, 1, 1, 1, 1,
0.05103981, -0.01732551, 2.319942, 1, 1, 1, 1, 1,
0.05353948, 0.855949, -0.6244414, 1, 1, 1, 1, 1,
0.05360183, -0.8987823, 2.538869, 1, 1, 1, 1, 1,
0.05472526, 0.4363802, 1.105543, 1, 1, 1, 1, 1,
0.0556609, 2.254692, 0.4112415, 1, 1, 1, 1, 1,
0.056062, -0.2806918, 4.582001, 1, 1, 1, 1, 1,
0.05811298, 0.8438061, 1.201597, 1, 1, 1, 1, 1,
0.05904427, -0.910198, 3.391007, 1, 1, 1, 1, 1,
0.06173534, 1.87471, -0.8000281, 1, 1, 1, 1, 1,
0.06476317, 0.01362303, 1.602541, 0, 0, 1, 1, 1,
0.07276292, -0.05170845, 2.540423, 1, 0, 0, 1, 1,
0.07546657, 0.09938027, -0.2482232, 1, 0, 0, 1, 1,
0.07818821, 1.202592, 0.7187907, 1, 0, 0, 1, 1,
0.07834269, -0.2437044, 1.468122, 1, 0, 0, 1, 1,
0.07913373, 1.417447, 1.027419, 1, 0, 0, 1, 1,
0.08303814, -0.5498705, 1.865895, 0, 0, 0, 1, 1,
0.0837734, 0.3302035, -0.2553762, 0, 0, 0, 1, 1,
0.09440099, 1.233213, 0.717207, 0, 0, 0, 1, 1,
0.09658304, -0.6194901, 3.297728, 0, 0, 0, 1, 1,
0.09960843, -0.9353289, 3.988866, 0, 0, 0, 1, 1,
0.1039904, 0.2660609, 2.958529, 0, 0, 0, 1, 1,
0.1047708, 0.2613676, 1.850836, 0, 0, 0, 1, 1,
0.1052326, -0.0511812, 2.279688, 1, 1, 1, 1, 1,
0.1092615, 0.513234, 0.2499539, 1, 1, 1, 1, 1,
0.1095444, -1.860729, 4.503423, 1, 1, 1, 1, 1,
0.1101798, -0.06423568, 1.068623, 1, 1, 1, 1, 1,
0.110331, -1.699155, 3.198957, 1, 1, 1, 1, 1,
0.110891, 0.4911871, 1.299067, 1, 1, 1, 1, 1,
0.1178611, 0.6743894, -0.2782881, 1, 1, 1, 1, 1,
0.1186845, 1.287154, 1.234274, 1, 1, 1, 1, 1,
0.1197667, -0.6925422, 3.308029, 1, 1, 1, 1, 1,
0.1203202, 0.01550137, 0.8418266, 1, 1, 1, 1, 1,
0.1216636, -0.8640832, 2.676662, 1, 1, 1, 1, 1,
0.1228383, 1.140634, -1.161497, 1, 1, 1, 1, 1,
0.1263308, 0.6216621, 1.156773, 1, 1, 1, 1, 1,
0.1274271, -0.0666246, 2.939587, 1, 1, 1, 1, 1,
0.1291739, 0.08542617, 1.069726, 1, 1, 1, 1, 1,
0.1296781, -0.8515242, 3.196041, 0, 0, 1, 1, 1,
0.130351, 0.07395338, 1.161304, 1, 0, 0, 1, 1,
0.1327525, 0.758338, 0.7869064, 1, 0, 0, 1, 1,
0.1343672, 0.2251733, 0.5925273, 1, 0, 0, 1, 1,
0.1376743, 1.874797, -0.5006521, 1, 0, 0, 1, 1,
0.1380466, -0.5765559, 1.629366, 1, 0, 0, 1, 1,
0.1445069, -1.897253, 3.526673, 0, 0, 0, 1, 1,
0.1485565, 1.733592, 0.3509164, 0, 0, 0, 1, 1,
0.1514596, -1.151171, 2.08479, 0, 0, 0, 1, 1,
0.1556024, 1.160464, -0.8018016, 0, 0, 0, 1, 1,
0.1598861, 0.4829978, 0.06162915, 0, 0, 0, 1, 1,
0.1628893, -1.380893, 4.167681, 0, 0, 0, 1, 1,
0.1653643, 0.4881241, 0.9799475, 0, 0, 0, 1, 1,
0.1669093, -0.3365073, 2.870591, 1, 1, 1, 1, 1,
0.1672495, -0.6586344, 2.760134, 1, 1, 1, 1, 1,
0.1721594, 0.1107515, 0.1721269, 1, 1, 1, 1, 1,
0.1734892, -1.975589, 3.68383, 1, 1, 1, 1, 1,
0.1749921, 1.543033, -1.009625, 1, 1, 1, 1, 1,
0.175049, 0.6245182, 0.8473472, 1, 1, 1, 1, 1,
0.176901, 0.735267, 0.5211196, 1, 1, 1, 1, 1,
0.1772099, -0.7502234, 2.947354, 1, 1, 1, 1, 1,
0.1780517, 0.2991329, 0.6449836, 1, 1, 1, 1, 1,
0.1858455, -0.9967579, 2.15805, 1, 1, 1, 1, 1,
0.1895512, -0.952909, 4.485601, 1, 1, 1, 1, 1,
0.1901379, -0.4954102, 3.168106, 1, 1, 1, 1, 1,
0.1912758, 0.2083236, -0.16979, 1, 1, 1, 1, 1,
0.1956759, 0.5659142, 1.115328, 1, 1, 1, 1, 1,
0.1963472, -0.2841328, 4.627218, 1, 1, 1, 1, 1,
0.1984898, -0.4968598, 1.722824, 0, 0, 1, 1, 1,
0.2017457, -0.2351636, 1.029391, 1, 0, 0, 1, 1,
0.2032996, 0.9825692, -1.061959, 1, 0, 0, 1, 1,
0.2035206, -0.1207588, 1.180519, 1, 0, 0, 1, 1,
0.2051216, -0.7882353, 3.200151, 1, 0, 0, 1, 1,
0.2065071, -0.7291263, 2.865255, 1, 0, 0, 1, 1,
0.207611, 0.8063585, -0.6003456, 0, 0, 0, 1, 1,
0.2092584, 0.449909, 0.4318512, 0, 0, 0, 1, 1,
0.2180473, -0.7831191, 2.465627, 0, 0, 0, 1, 1,
0.2237325, -1.147067, 2.72775, 0, 0, 0, 1, 1,
0.2356169, -3.516492, 4.12651, 0, 0, 0, 1, 1,
0.2362687, 0.8681359, -1.275503, 0, 0, 0, 1, 1,
0.2381987, -1.347036, 1.893048, 0, 0, 0, 1, 1,
0.2413585, 1.26453, -0.08483326, 1, 1, 1, 1, 1,
0.2430449, 0.3351792, -1.080262, 1, 1, 1, 1, 1,
0.2432233, 1.202526, -0.2410703, 1, 1, 1, 1, 1,
0.2500543, -0.8724374, 2.288399, 1, 1, 1, 1, 1,
0.251062, 2.17992, -0.03777539, 1, 1, 1, 1, 1,
0.2511801, 1.676916, 1.248822, 1, 1, 1, 1, 1,
0.2541194, -0.3003213, 3.088178, 1, 1, 1, 1, 1,
0.2542321, -0.8900432, 2.970611, 1, 1, 1, 1, 1,
0.2604814, -0.368315, 2.223871, 1, 1, 1, 1, 1,
0.2611119, -0.08262388, 1.433388, 1, 1, 1, 1, 1,
0.2619525, 0.4063689, 0.9114893, 1, 1, 1, 1, 1,
0.2628098, 1.433339, -1.437197, 1, 1, 1, 1, 1,
0.2632162, -0.8172289, 3.649381, 1, 1, 1, 1, 1,
0.2634656, 0.5172362, -0.9936455, 1, 1, 1, 1, 1,
0.2677207, -0.8045939, 3.379476, 1, 1, 1, 1, 1,
0.2689035, -1.155905, 3.33175, 0, 0, 1, 1, 1,
0.2693081, -0.5701832, 3.246332, 1, 0, 0, 1, 1,
0.2750937, 1.158013, 2.218237, 1, 0, 0, 1, 1,
0.2766909, 0.9787625, 2.853491, 1, 0, 0, 1, 1,
0.2773732, 1.112177, -2.02761, 1, 0, 0, 1, 1,
0.2780312, -0.3650502, 3.129539, 1, 0, 0, 1, 1,
0.2788575, -0.02167545, 1.843085, 0, 0, 0, 1, 1,
0.2807413, 0.1493345, 2.112223, 0, 0, 0, 1, 1,
0.2833471, -0.5353382, 3.244712, 0, 0, 0, 1, 1,
0.2839915, 0.840391, -0.423283, 0, 0, 0, 1, 1,
0.2860347, -2.154149, 4.302091, 0, 0, 0, 1, 1,
0.2932344, 1.500557, 0.3303309, 0, 0, 0, 1, 1,
0.3002301, -0.1696898, 2.804755, 0, 0, 0, 1, 1,
0.3015767, -0.08167516, 1.891029, 1, 1, 1, 1, 1,
0.3105573, -0.6880614, 4.397386, 1, 1, 1, 1, 1,
0.3113512, -1.034871, 2.709169, 1, 1, 1, 1, 1,
0.3134073, 0.5943988, 1.416653, 1, 1, 1, 1, 1,
0.3185251, -0.2819367, 1.493575, 1, 1, 1, 1, 1,
0.3196152, 0.04744644, 1.288534, 1, 1, 1, 1, 1,
0.3199212, -0.1489548, 2.241099, 1, 1, 1, 1, 1,
0.3200493, -0.1362452, 0.2638642, 1, 1, 1, 1, 1,
0.3232393, 1.942217, 0.2223519, 1, 1, 1, 1, 1,
0.3232524, -0.1130575, -1.078484, 1, 1, 1, 1, 1,
0.3249666, -1.324466, 2.607555, 1, 1, 1, 1, 1,
0.327037, 0.6929923, 1.311798, 1, 1, 1, 1, 1,
0.3271947, 2.127964, 0.80616, 1, 1, 1, 1, 1,
0.3275194, -0.03568569, 1.804873, 1, 1, 1, 1, 1,
0.3303681, 1.161446, 0.2992397, 1, 1, 1, 1, 1,
0.3325215, -0.0305481, 2.076414, 0, 0, 1, 1, 1,
0.3338243, -1.34963, 1.655815, 1, 0, 0, 1, 1,
0.3368201, 0.3170627, 2.437829, 1, 0, 0, 1, 1,
0.3375426, 0.469739, -0.03628014, 1, 0, 0, 1, 1,
0.3376268, -1.622921, 2.042666, 1, 0, 0, 1, 1,
0.3381028, 0.1191019, 1.230506, 1, 0, 0, 1, 1,
0.3381325, 0.8659734, -1.34135, 0, 0, 0, 1, 1,
0.3382541, -0.4156764, 2.850949, 0, 0, 0, 1, 1,
0.3446709, 0.3170154, 1.576041, 0, 0, 0, 1, 1,
0.3486832, -0.4423074, 3.358291, 0, 0, 0, 1, 1,
0.3509662, 0.4046834, -0.2371415, 0, 0, 0, 1, 1,
0.3533888, -1.828971, 3.053681, 0, 0, 0, 1, 1,
0.3675812, 0.06937986, 3.247521, 0, 0, 0, 1, 1,
0.368755, -0.1289476, 2.178844, 1, 1, 1, 1, 1,
0.3716016, 0.6608859, 0.3057772, 1, 1, 1, 1, 1,
0.3759125, -0.9181269, 1.907734, 1, 1, 1, 1, 1,
0.3810706, -1.504899, 2.158869, 1, 1, 1, 1, 1,
0.3810993, 1.307711, 0.2627316, 1, 1, 1, 1, 1,
0.3849331, 1.888175, 2.167143, 1, 1, 1, 1, 1,
0.3894734, 0.1710524, 0.7578601, 1, 1, 1, 1, 1,
0.3916733, -2.133015, 4.436768, 1, 1, 1, 1, 1,
0.3917358, -0.8756055, 2.78583, 1, 1, 1, 1, 1,
0.3918268, 1.969186, 2.08768, 1, 1, 1, 1, 1,
0.3924221, -0.1297265, 2.182662, 1, 1, 1, 1, 1,
0.3943208, -0.2064479, 3.415691, 1, 1, 1, 1, 1,
0.3945985, 0.05165004, 1.721685, 1, 1, 1, 1, 1,
0.400811, -0.964411, 3.645219, 1, 1, 1, 1, 1,
0.401439, 0.8597587, 1.314849, 1, 1, 1, 1, 1,
0.4033798, 2.18112, 0.9935233, 0, 0, 1, 1, 1,
0.4059167, 1.027846, -0.4529917, 1, 0, 0, 1, 1,
0.4089725, 0.9480324, 1.513522, 1, 0, 0, 1, 1,
0.409508, -0.5346153, 2.54577, 1, 0, 0, 1, 1,
0.4146991, -0.1765332, 2.33102, 1, 0, 0, 1, 1,
0.4161872, -0.7895598, 4.839395, 1, 0, 0, 1, 1,
0.4168818, 0.6171558, 3.047887, 0, 0, 0, 1, 1,
0.4183393, 0.8670196, 0.4788308, 0, 0, 0, 1, 1,
0.4214477, -0.7846814, 2.473549, 0, 0, 0, 1, 1,
0.4274259, 0.06226052, 0.5846304, 0, 0, 0, 1, 1,
0.4293072, -1.351727, 1.973591, 0, 0, 0, 1, 1,
0.4346572, 0.5226456, 0.5550666, 0, 0, 0, 1, 1,
0.4372258, 0.06715935, 2.386317, 0, 0, 0, 1, 1,
0.4487436, -1.246175, 3.667571, 1, 1, 1, 1, 1,
0.4520383, 0.2587738, 1.641989, 1, 1, 1, 1, 1,
0.4539414, 1.389264, 0.2520677, 1, 1, 1, 1, 1,
0.4577041, -1.616389, 3.24782, 1, 1, 1, 1, 1,
0.459071, -0.6390767, 4.242001, 1, 1, 1, 1, 1,
0.4640836, -1.745122, 2.687112, 1, 1, 1, 1, 1,
0.4652988, 0.04357062, 0.1940751, 1, 1, 1, 1, 1,
0.4658238, 1.347048, 0.6502878, 1, 1, 1, 1, 1,
0.4701848, 1.114849, 1.162425, 1, 1, 1, 1, 1,
0.4777639, 0.1646275, 3.099057, 1, 1, 1, 1, 1,
0.4842971, -0.4288718, 3.753349, 1, 1, 1, 1, 1,
0.4856144, -0.8014675, 3.782001, 1, 1, 1, 1, 1,
0.4871509, 0.57149, 0.6623194, 1, 1, 1, 1, 1,
0.4915702, -0.4162118, 2.686547, 1, 1, 1, 1, 1,
0.4922029, 0.7289277, 0.01206971, 1, 1, 1, 1, 1,
0.4928728, -1.684154, 3.512236, 0, 0, 1, 1, 1,
0.4974318, 0.2328491, -0.1669994, 1, 0, 0, 1, 1,
0.5093784, -0.7047531, 2.274917, 1, 0, 0, 1, 1,
0.5118907, 1.147729, -0.3741868, 1, 0, 0, 1, 1,
0.5127499, -0.2593363, 4.220563, 1, 0, 0, 1, 1,
0.5169301, -1.653495, 2.665247, 1, 0, 0, 1, 1,
0.5191481, 0.487357, 1.406877, 0, 0, 0, 1, 1,
0.5194089, 1.927381, -1.746436, 0, 0, 0, 1, 1,
0.5194139, 0.8006268, 1.007207, 0, 0, 0, 1, 1,
0.5228825, 0.02280472, 1.056588, 0, 0, 0, 1, 1,
0.5229, 0.3032483, 2.038546, 0, 0, 0, 1, 1,
0.5240937, -0.8140941, 2.772222, 0, 0, 0, 1, 1,
0.5250778, -0.3084848, 3.127945, 0, 0, 0, 1, 1,
0.528583, 0.04269124, 0.1264289, 1, 1, 1, 1, 1,
0.5297917, -0.7790141, 0.7918088, 1, 1, 1, 1, 1,
0.5328279, 1.715319, 1.666204, 1, 1, 1, 1, 1,
0.5376035, -0.05782103, 3.033795, 1, 1, 1, 1, 1,
0.5387558, 0.3375146, -0.524801, 1, 1, 1, 1, 1,
0.5418242, 0.2505746, 0.4855675, 1, 1, 1, 1, 1,
0.5437493, -2.012657, 3.669784, 1, 1, 1, 1, 1,
0.5507979, -0.1575518, 2.551962, 1, 1, 1, 1, 1,
0.5543194, -0.9369989, 3.50958, 1, 1, 1, 1, 1,
0.5543784, 0.5553348, 2.554177, 1, 1, 1, 1, 1,
0.5559339, 1.36205, 0.4328522, 1, 1, 1, 1, 1,
0.5584981, 1.24982, 0.9928116, 1, 1, 1, 1, 1,
0.5686852, -0.1134702, 2.535218, 1, 1, 1, 1, 1,
0.5696909, 1.662478, 0.3471201, 1, 1, 1, 1, 1,
0.5718158, -0.003396778, 1.527092, 1, 1, 1, 1, 1,
0.5718374, 0.1612162, 0.6244786, 0, 0, 1, 1, 1,
0.5807611, -0.3839631, 1.892266, 1, 0, 0, 1, 1,
0.5845198, -0.6733287, 1.814898, 1, 0, 0, 1, 1,
0.5865659, -0.9305357, 3.087225, 1, 0, 0, 1, 1,
0.5876669, -1.588442, 4.072145, 1, 0, 0, 1, 1,
0.5899862, 1.083407, 1.222713, 1, 0, 0, 1, 1,
0.5920322, -0.5564913, 1.833273, 0, 0, 0, 1, 1,
0.5925303, 0.6178115, -0.7139288, 0, 0, 0, 1, 1,
0.5936736, 0.6395627, 1.583846, 0, 0, 0, 1, 1,
0.5964506, 1.062501, -1.654635, 0, 0, 0, 1, 1,
0.5994533, 0.343105, -1.512141, 0, 0, 0, 1, 1,
0.5999055, 0.9291046, -0.6317043, 0, 0, 0, 1, 1,
0.6013898, -1.027462, 1.365027, 0, 0, 0, 1, 1,
0.6081133, -0.8240803, 2.802246, 1, 1, 1, 1, 1,
0.6087644, 1.041332, 0.1960235, 1, 1, 1, 1, 1,
0.609984, -0.4921836, 1.446305, 1, 1, 1, 1, 1,
0.6113946, -0.01675476, 1.049548, 1, 1, 1, 1, 1,
0.6117344, -0.3680721, 1.031007, 1, 1, 1, 1, 1,
0.6165196, 2.091045, -1.791212, 1, 1, 1, 1, 1,
0.6186835, 0.8509593, 1.421539, 1, 1, 1, 1, 1,
0.6198021, -1.215679, 1.546052, 1, 1, 1, 1, 1,
0.6217142, -0.05283423, 1.976756, 1, 1, 1, 1, 1,
0.6217695, 1.139103, 0.8706143, 1, 1, 1, 1, 1,
0.6233293, 0.1435485, 0.3311674, 1, 1, 1, 1, 1,
0.6243983, 0.8589051, 1.208737, 1, 1, 1, 1, 1,
0.6270901, 0.227713, 2.070697, 1, 1, 1, 1, 1,
0.630703, -2.161259, 3.09775, 1, 1, 1, 1, 1,
0.6405442, -1.157761, 1.257925, 1, 1, 1, 1, 1,
0.6446225, -1.018126, 2.599817, 0, 0, 1, 1, 1,
0.6547768, 1.686746, 0.5873405, 1, 0, 0, 1, 1,
0.6568028, -0.6507087, 3.280228, 1, 0, 0, 1, 1,
0.6569747, -0.7037469, 3.541311, 1, 0, 0, 1, 1,
0.6647678, -0.373604, 1.638383, 1, 0, 0, 1, 1,
0.6697209, -0.2235838, -0.06979146, 1, 0, 0, 1, 1,
0.6710832, -1.337788, 1.962282, 0, 0, 0, 1, 1,
0.6730877, -0.3031878, 1.486757, 0, 0, 0, 1, 1,
0.6778978, -0.5729923, 3.009867, 0, 0, 0, 1, 1,
0.6789645, 1.333911, -0.47045, 0, 0, 0, 1, 1,
0.679198, -1.126178, 2.686355, 0, 0, 0, 1, 1,
0.6811619, -0.05806046, 1.565945, 0, 0, 0, 1, 1,
0.6828318, -0.7601433, 3.419214, 0, 0, 0, 1, 1,
0.68515, -1.481966, 2.940896, 1, 1, 1, 1, 1,
0.6959336, -0.2543373, 1.831869, 1, 1, 1, 1, 1,
0.7000342, -0.7682275, 2.369582, 1, 1, 1, 1, 1,
0.701321, -0.05495282, 1.908485, 1, 1, 1, 1, 1,
0.7021244, -0.649797, 3.046281, 1, 1, 1, 1, 1,
0.704285, -1.596303, 1.620135, 1, 1, 1, 1, 1,
0.7048032, -1.822815, 1.943527, 1, 1, 1, 1, 1,
0.709779, -0.8066757, 2.017385, 1, 1, 1, 1, 1,
0.7104709, 0.5642412, 0.7758076, 1, 1, 1, 1, 1,
0.7144119, -2.165776, 2.949194, 1, 1, 1, 1, 1,
0.7233788, 1.815531, -2.58999, 1, 1, 1, 1, 1,
0.7269163, 0.1625284, 1.153035, 1, 1, 1, 1, 1,
0.7324214, 0.04230072, -0.253483, 1, 1, 1, 1, 1,
0.7348625, 1.583755, -0.4466171, 1, 1, 1, 1, 1,
0.7370797, 0.03483213, 2.18843, 1, 1, 1, 1, 1,
0.7375606, -0.8987607, 4.795681, 0, 0, 1, 1, 1,
0.7416745, -0.7810467, 1.610897, 1, 0, 0, 1, 1,
0.7421391, 0.2339961, 1.565722, 1, 0, 0, 1, 1,
0.749067, -1.375163, 3.744048, 1, 0, 0, 1, 1,
0.7498237, 1.237975, 0.7568299, 1, 0, 0, 1, 1,
0.7571266, -2.518629, 3.605792, 1, 0, 0, 1, 1,
0.7591286, -0.6769485, 2.627124, 0, 0, 0, 1, 1,
0.7703435, 0.2602363, -0.4560693, 0, 0, 0, 1, 1,
0.7704619, -1.108585, 3.1275, 0, 0, 0, 1, 1,
0.7815184, 0.7815855, 0.6005574, 0, 0, 0, 1, 1,
0.7830862, -0.2003019, 0.9799613, 0, 0, 0, 1, 1,
0.7892928, -1.096911, 2.343037, 0, 0, 0, 1, 1,
0.7912367, -0.3196293, 1.301586, 0, 0, 0, 1, 1,
0.7913035, 0.04442685, 1.227628, 1, 1, 1, 1, 1,
0.8037896, -1.202853, 2.00198, 1, 1, 1, 1, 1,
0.8088722, 0.6945686, -0.224124, 1, 1, 1, 1, 1,
0.8106323, -0.6394023, 1.639435, 1, 1, 1, 1, 1,
0.8118309, 2.308, 0.3918111, 1, 1, 1, 1, 1,
0.8218194, 0.6481701, 2.341115, 1, 1, 1, 1, 1,
0.8249601, 0.6686944, 0.1152993, 1, 1, 1, 1, 1,
0.8259047, 0.5033779, -0.8263794, 1, 1, 1, 1, 1,
0.8264483, 0.8558699, -0.05796326, 1, 1, 1, 1, 1,
0.8279663, 0.537987, 1.517966, 1, 1, 1, 1, 1,
0.8367867, -2.499014, 1.950663, 1, 1, 1, 1, 1,
0.8468833, 1.565717, 1.25644, 1, 1, 1, 1, 1,
0.8510199, 0.3761362, 1.057586, 1, 1, 1, 1, 1,
0.8514755, 0.03377032, 3.120265, 1, 1, 1, 1, 1,
0.8539503, 1.937896, 0.2518616, 1, 1, 1, 1, 1,
0.8564189, -0.8227704, 1.876087, 0, 0, 1, 1, 1,
0.8582868, 1.060441, 0.5121703, 1, 0, 0, 1, 1,
0.8606104, -0.4975428, 1.815688, 1, 0, 0, 1, 1,
0.8646901, -0.6584868, 3.817638, 1, 0, 0, 1, 1,
0.8662288, -0.6544721, 1.629339, 1, 0, 0, 1, 1,
0.8781723, -0.3123397, 1.124584, 1, 0, 0, 1, 1,
0.878621, -1.896876, 1.582831, 0, 0, 0, 1, 1,
0.8809417, 1.900024, -0.5496022, 0, 0, 0, 1, 1,
0.8812089, 1.66007, 0.5953702, 0, 0, 0, 1, 1,
0.8844681, 2.656022, 0.4050455, 0, 0, 0, 1, 1,
0.8926044, -0.1959132, -0.9364304, 0, 0, 0, 1, 1,
0.8957736, 1.888457, 1.736471, 0, 0, 0, 1, 1,
0.8959441, -1.071597, 3.189402, 0, 0, 0, 1, 1,
0.8978698, 0.1317189, 2.488527, 1, 1, 1, 1, 1,
0.899595, -0.1839746, 2.037706, 1, 1, 1, 1, 1,
0.9342057, -0.7113943, 2.293023, 1, 1, 1, 1, 1,
0.934749, 1.145429, 2.393963, 1, 1, 1, 1, 1,
0.9354011, -1.034212, 1.827972, 1, 1, 1, 1, 1,
0.9361179, -1.318083, 1.525813, 1, 1, 1, 1, 1,
0.9375948, -1.169848, 2.298943, 1, 1, 1, 1, 1,
0.9429007, -0.7344677, 3.361519, 1, 1, 1, 1, 1,
0.9448856, -1.911684, 3.061793, 1, 1, 1, 1, 1,
0.9471093, 1.763537, 0.7385779, 1, 1, 1, 1, 1,
0.9706168, 1.192784, -0.1107728, 1, 1, 1, 1, 1,
0.9720874, 0.8892221, 2.979135, 1, 1, 1, 1, 1,
0.9739618, 0.04436167, 1.39837, 1, 1, 1, 1, 1,
0.9792398, 1.733011, -1.237625, 1, 1, 1, 1, 1,
0.9907767, -0.8062727, 1.482075, 1, 1, 1, 1, 1,
0.9911402, -0.009842045, 1.704008, 0, 0, 1, 1, 1,
0.9914158, 0.3452112, 1.726507, 1, 0, 0, 1, 1,
0.9934018, 0.1238874, 2.810748, 1, 0, 0, 1, 1,
0.993489, -1.107964, 1.402236, 1, 0, 0, 1, 1,
0.9983733, 0.3852583, 1.978655, 1, 0, 0, 1, 1,
1.000831, 0.6824615, -0.04490711, 1, 0, 0, 1, 1,
1.002349, -1.01917, 3.308381, 0, 0, 0, 1, 1,
1.014104, 0.8855975, -0.2847388, 0, 0, 0, 1, 1,
1.026801, 0.167489, -1.171311, 0, 0, 0, 1, 1,
1.029639, -0.06438834, 0.03793578, 0, 0, 0, 1, 1,
1.031021, 1.508598, 1.476426, 0, 0, 0, 1, 1,
1.038406, -1.225723, 3.207588, 0, 0, 0, 1, 1,
1.038728, -0.1231232, 2.644433, 0, 0, 0, 1, 1,
1.041987, 0.7393121, 0.2299017, 1, 1, 1, 1, 1,
1.050943, 1.227145, 0.04253931, 1, 1, 1, 1, 1,
1.056333, 0.6317987, 2.130256, 1, 1, 1, 1, 1,
1.056339, 1.867246, 1.619555, 1, 1, 1, 1, 1,
1.058046, -0.3966215, 1.704427, 1, 1, 1, 1, 1,
1.060156, -0.2865626, 1.477049, 1, 1, 1, 1, 1,
1.063117, -0.1838372, 1.458983, 1, 1, 1, 1, 1,
1.067964, -0.7875993, 6.090123, 1, 1, 1, 1, 1,
1.073537, -0.4439169, 0.0643709, 1, 1, 1, 1, 1,
1.080367, -0.9825323, 1.761685, 1, 1, 1, 1, 1,
1.084456, -0.6865521, 2.992289, 1, 1, 1, 1, 1,
1.088899, -1.423214, 1.221288, 1, 1, 1, 1, 1,
1.098201, -0.7497721, 1.873299, 1, 1, 1, 1, 1,
1.106981, -0.5247031, 3.034287, 1, 1, 1, 1, 1,
1.120176, 1.3393, 1.994769, 1, 1, 1, 1, 1,
1.132259, 0.5562435, 0.5748682, 0, 0, 1, 1, 1,
1.133891, 0.9548277, 0.6925374, 1, 0, 0, 1, 1,
1.138308, 0.2404622, 0.5599029, 1, 0, 0, 1, 1,
1.138376, -1.570877, 4.07426, 1, 0, 0, 1, 1,
1.153214, -1.002404, 0.3162863, 1, 0, 0, 1, 1,
1.157291, 0.5326235, 1.519538, 1, 0, 0, 1, 1,
1.158437, 0.02973689, 1.868706, 0, 0, 0, 1, 1,
1.166493, 0.9313807, 0.1227835, 0, 0, 0, 1, 1,
1.181767, 0.6877308, 0.4814845, 0, 0, 0, 1, 1,
1.183175, 0.5462341, 2.97085, 0, 0, 0, 1, 1,
1.185364, 0.8693325, 1.081263, 0, 0, 0, 1, 1,
1.192293, -0.2846515, 0.7306362, 0, 0, 0, 1, 1,
1.193766, -0.4451337, 2.067452, 0, 0, 0, 1, 1,
1.197521, 0.6967866, 1.333838, 1, 1, 1, 1, 1,
1.199123, -1.081084, 0.6448267, 1, 1, 1, 1, 1,
1.200412, 0.1262614, 1.044561, 1, 1, 1, 1, 1,
1.202231, 0.6654238, -0.4500374, 1, 1, 1, 1, 1,
1.21232, 0.5432863, 0.895082, 1, 1, 1, 1, 1,
1.216874, -0.2127914, 2.154133, 1, 1, 1, 1, 1,
1.225622, -1.962286, 3.963829, 1, 1, 1, 1, 1,
1.242354, -1.131783, 3.84403, 1, 1, 1, 1, 1,
1.24637, 2.187725, 0.3318262, 1, 1, 1, 1, 1,
1.247084, -1.399096, 3.33967, 1, 1, 1, 1, 1,
1.248266, 0.1695509, 0.3342234, 1, 1, 1, 1, 1,
1.251623, 1.01019, 0.7440622, 1, 1, 1, 1, 1,
1.256593, -0.133725, 0.06266059, 1, 1, 1, 1, 1,
1.259357, -0.978937, 1.887504, 1, 1, 1, 1, 1,
1.272224, -1.46912, 3.141466, 1, 1, 1, 1, 1,
1.274347, -0.4758067, 1.54439, 0, 0, 1, 1, 1,
1.277282, -0.02214427, 0.6597804, 1, 0, 0, 1, 1,
1.288175, -0.04937695, 0.8451595, 1, 0, 0, 1, 1,
1.289908, 0.6591033, -0.3503338, 1, 0, 0, 1, 1,
1.301571, -0.04101634, 2.86984, 1, 0, 0, 1, 1,
1.305545, 0.8056389, 2.4382, 1, 0, 0, 1, 1,
1.312368, 0.0924701, 1.89866, 0, 0, 0, 1, 1,
1.314654, 1.548971, -0.3554551, 0, 0, 0, 1, 1,
1.323266, 0.5024182, 3.688866, 0, 0, 0, 1, 1,
1.334435, 0.912905, 0.9250461, 0, 0, 0, 1, 1,
1.335374, 0.3946728, 0.6294259, 0, 0, 0, 1, 1,
1.344723, 1.524496, 0.773221, 0, 0, 0, 1, 1,
1.347786, -0.003703819, 0.4388137, 0, 0, 0, 1, 1,
1.348531, 1.628941, -0.1797946, 1, 1, 1, 1, 1,
1.358572, -0.01752528, 1.559596, 1, 1, 1, 1, 1,
1.381466, 0.2522087, 1.258067, 1, 1, 1, 1, 1,
1.384316, 0.7309989, 2.040737, 1, 1, 1, 1, 1,
1.38865, 0.1258695, 1.531271, 1, 1, 1, 1, 1,
1.394975, -0.5141919, 1.845512, 1, 1, 1, 1, 1,
1.396553, 0.531716, 1.642321, 1, 1, 1, 1, 1,
1.40309, -0.9438676, 1.834202, 1, 1, 1, 1, 1,
1.4059, 1.33049, -0.1722357, 1, 1, 1, 1, 1,
1.41809, 0.5660252, 2.092628, 1, 1, 1, 1, 1,
1.426301, 0.875106, 3.510196, 1, 1, 1, 1, 1,
1.426454, -0.2692785, 1.214425, 1, 1, 1, 1, 1,
1.432006, -0.4389873, 3.017196, 1, 1, 1, 1, 1,
1.433953, 0.5890056, 1.923873, 1, 1, 1, 1, 1,
1.449031, -0.5846299, 3.572732, 1, 1, 1, 1, 1,
1.454799, -0.6823176, 0.8559883, 0, 0, 1, 1, 1,
1.46139, -1.089665, 3.503301, 1, 0, 0, 1, 1,
1.469, -2.567576, 3.016289, 1, 0, 0, 1, 1,
1.474951, -0.2691009, 2.177515, 1, 0, 0, 1, 1,
1.475765, -0.4206818, 1.230762, 1, 0, 0, 1, 1,
1.4837, 2.462632, 0.2220775, 1, 0, 0, 1, 1,
1.507861, 1.016296, 0.2296151, 0, 0, 0, 1, 1,
1.512328, 1.181361, 1.155464, 0, 0, 0, 1, 1,
1.519357, -2.771463, 2.646723, 0, 0, 0, 1, 1,
1.522487, 0.03505522, 0.9324331, 0, 0, 0, 1, 1,
1.529166, -1.081966, 1.829969, 0, 0, 0, 1, 1,
1.531864, -0.9074388, 2.539979, 0, 0, 0, 1, 1,
1.558807, -1.247292, 3.351023, 0, 0, 0, 1, 1,
1.563386, 0.1524298, 1.798709, 1, 1, 1, 1, 1,
1.564123, -0.2374124, 1.28886, 1, 1, 1, 1, 1,
1.579222, 0.5323141, -0.8251066, 1, 1, 1, 1, 1,
1.580385, 1.353976, 1.118086, 1, 1, 1, 1, 1,
1.582786, -1.710423, 3.835492, 1, 1, 1, 1, 1,
1.592615, -0.4988508, 2.93599, 1, 1, 1, 1, 1,
1.604337, 0.135876, 2.614675, 1, 1, 1, 1, 1,
1.62835, -0.3182904, 2.093588, 1, 1, 1, 1, 1,
1.635561, -0.4017757, 0.6250128, 1, 1, 1, 1, 1,
1.640623, 0.01893212, 2.892329, 1, 1, 1, 1, 1,
1.644952, 1.562465, 0.6779951, 1, 1, 1, 1, 1,
1.648541, 0.8348588, 0.276201, 1, 1, 1, 1, 1,
1.670932, -0.09366724, 1.274498, 1, 1, 1, 1, 1,
1.684661, 0.2160735, 0.9407721, 1, 1, 1, 1, 1,
1.693823, 1.784249, 2.294235, 1, 1, 1, 1, 1,
1.710918, -0.5648119, 3.484146, 0, 0, 1, 1, 1,
1.718444, 1.303804, 0.5949482, 1, 0, 0, 1, 1,
1.724242, 1.812553, -0.05156859, 1, 0, 0, 1, 1,
1.727993, -0.2132835, 1.633296, 1, 0, 0, 1, 1,
1.730923, -0.7612103, 2.007845, 1, 0, 0, 1, 1,
1.74002, 1.916685, 1.571299, 1, 0, 0, 1, 1,
1.746396, -0.611899, 3.118273, 0, 0, 0, 1, 1,
1.747234, 0.6150481, 0.8919552, 0, 0, 0, 1, 1,
1.749932, 0.2026044, 1.762121, 0, 0, 0, 1, 1,
1.752857, -0.06518473, 0.6280799, 0, 0, 0, 1, 1,
1.759357, 1.623647, 0.9453341, 0, 0, 0, 1, 1,
1.791312, 1.429738, -0.7465447, 0, 0, 0, 1, 1,
1.795729, -1.232899, 4.173045, 0, 0, 0, 1, 1,
1.810325, 0.9100805, 0.5911121, 1, 1, 1, 1, 1,
1.852671, -0.8657647, 1.916616, 1, 1, 1, 1, 1,
1.862508, 0.3375999, 2.828692, 1, 1, 1, 1, 1,
1.884592, -0.9872394, 1.544712, 1, 1, 1, 1, 1,
1.896381, 0.6058493, 1.027462, 1, 1, 1, 1, 1,
1.915722, -0.8556964, 2.400083, 1, 1, 1, 1, 1,
1.923493, 1.070037, 0.2763108, 1, 1, 1, 1, 1,
1.925586, -0.7917501, 3.934997, 1, 1, 1, 1, 1,
1.942279, 0.08778211, 1.901471, 1, 1, 1, 1, 1,
1.966794, 0.1886491, 0.599261, 1, 1, 1, 1, 1,
1.978379, -0.08847759, 1.926987, 1, 1, 1, 1, 1,
1.979923, 1.453269, 0.3513547, 1, 1, 1, 1, 1,
2.011196, 0.4299893, 1.472953, 1, 1, 1, 1, 1,
2.03694, 0.6472683, 0.2873572, 1, 1, 1, 1, 1,
2.051593, 1.149991, 1.824509, 1, 1, 1, 1, 1,
2.068163, 1.467414, 3.421777, 0, 0, 1, 1, 1,
2.154001, 0.3959596, 1.291731, 1, 0, 0, 1, 1,
2.216271, -2.488611, 3.258878, 1, 0, 0, 1, 1,
2.232228, -1.821116, 1.484243, 1, 0, 0, 1, 1,
2.235287, 0.6527879, 2.821736, 1, 0, 0, 1, 1,
2.254484, 0.6660524, 2.330499, 1, 0, 0, 1, 1,
2.261042, 0.2411359, 1.912329, 0, 0, 0, 1, 1,
2.289945, -0.6135416, 1.782982, 0, 0, 0, 1, 1,
2.292935, 1.652295, 1.248849, 0, 0, 0, 1, 1,
2.363945, -0.3098755, 0.5639848, 0, 0, 0, 1, 1,
2.406531, -0.7254058, 2.637985, 0, 0, 0, 1, 1,
2.528128, 1.114114, 1.305949, 0, 0, 0, 1, 1,
2.551666, 0.9459481, 0.735432, 0, 0, 0, 1, 1,
2.556665, -0.1327911, 1.649987, 1, 1, 1, 1, 1,
2.60248, -1.18219, 1.185122, 1, 1, 1, 1, 1,
2.619089, 0.1590117, 0.4086727, 1, 1, 1, 1, 1,
2.621072, 0.2652424, -0.6785371, 1, 1, 1, 1, 1,
2.64282, -0.6043168, 1.017692, 1, 1, 1, 1, 1,
2.747089, -1.161804, 2.072439, 1, 1, 1, 1, 1,
2.77161, -0.8189243, 0.5907376, 1, 1, 1, 1, 1
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
var radius = 9.788142;
var distance = 34.38043;
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
mvMatrix.translate( 0.191208, 0.3785323, -0.2817974 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.38043);
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
