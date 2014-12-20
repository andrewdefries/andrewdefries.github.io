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
-3.021646, -1.595979, -1.17486, 1, 0, 0, 1,
-2.811056, -1.597648, -1.960241, 1, 0.007843138, 0, 1,
-2.793974, -0.1132639, -0.8839612, 1, 0.01176471, 0, 1,
-2.758487, -0.1668959, -0.02583919, 1, 0.01960784, 0, 1,
-2.757384, -1.092295, -1.393443, 1, 0.02352941, 0, 1,
-2.506087, 1.233661, -1.089107, 1, 0.03137255, 0, 1,
-2.482693, 0.5996009, -0.6979269, 1, 0.03529412, 0, 1,
-2.393184, -0.1966843, -2.569153, 1, 0.04313726, 0, 1,
-2.362017, -0.7305117, -2.834854, 1, 0.04705882, 0, 1,
-2.32401, 1.332403, -1.852829, 1, 0.05490196, 0, 1,
-2.275591, 1.04272, -0.7746927, 1, 0.05882353, 0, 1,
-2.206008, 0.3830759, -1.618615, 1, 0.06666667, 0, 1,
-2.181562, 0.2453498, -1.936628, 1, 0.07058824, 0, 1,
-2.170264, -0.3511439, -1.771187, 1, 0.07843138, 0, 1,
-2.145499, 0.394482, -2.493459, 1, 0.08235294, 0, 1,
-2.1435, -1.081897, -2.489899, 1, 0.09019608, 0, 1,
-2.119145, -0.5191569, -3.556567, 1, 0.09411765, 0, 1,
-2.097966, -0.7525636, -3.454653, 1, 0.1019608, 0, 1,
-2.085793, 0.1105288, -1.855965, 1, 0.1098039, 0, 1,
-2.072648, 0.004755769, -0.1793061, 1, 0.1137255, 0, 1,
-2.06295, 1.808108, 0.8221354, 1, 0.1215686, 0, 1,
-2.031437, 0.1167087, -3.170506, 1, 0.1254902, 0, 1,
-1.965009, -0.09573592, -0.7302981, 1, 0.1333333, 0, 1,
-1.943736, -0.09908442, -3.141294, 1, 0.1372549, 0, 1,
-1.902662, -0.7598821, -3.260104, 1, 0.145098, 0, 1,
-1.887262, 0.8776432, -0.1194206, 1, 0.1490196, 0, 1,
-1.815927, 0.9993305, -0.6943377, 1, 0.1568628, 0, 1,
-1.78367, -0.8359686, -2.304143, 1, 0.1607843, 0, 1,
-1.767922, -0.7308763, -2.662751, 1, 0.1686275, 0, 1,
-1.738441, -0.420195, -1.842889, 1, 0.172549, 0, 1,
-1.726462, 0.826572, -0.3288784, 1, 0.1803922, 0, 1,
-1.723219, -1.328909, -2.52637, 1, 0.1843137, 0, 1,
-1.721475, -0.5432475, -2.320734, 1, 0.1921569, 0, 1,
-1.716741, -0.7307708, -1.250081, 1, 0.1960784, 0, 1,
-1.700861, 1.623224, -2.460414, 1, 0.2039216, 0, 1,
-1.68715, 0.8237919, -1.203283, 1, 0.2117647, 0, 1,
-1.686011, -0.2823444, -0.7361188, 1, 0.2156863, 0, 1,
-1.665955, 1.876559, -0.08391201, 1, 0.2235294, 0, 1,
-1.645155, 0.3459264, -3.093154, 1, 0.227451, 0, 1,
-1.642804, 0.9704285, -0.1555006, 1, 0.2352941, 0, 1,
-1.626373, 0.04685939, -3.098816, 1, 0.2392157, 0, 1,
-1.617137, 0.2720652, -0.5760249, 1, 0.2470588, 0, 1,
-1.616816, 0.4433565, -0.5534754, 1, 0.2509804, 0, 1,
-1.611695, 0.2436817, -3.600165, 1, 0.2588235, 0, 1,
-1.605792, 0.4863362, -0.9865146, 1, 0.2627451, 0, 1,
-1.592874, -1.673455, -2.768507, 1, 0.2705882, 0, 1,
-1.584432, 1.44616, -0.9657552, 1, 0.2745098, 0, 1,
-1.57235, -0.2916319, -2.952552, 1, 0.282353, 0, 1,
-1.557775, -1.218422, -2.047047, 1, 0.2862745, 0, 1,
-1.546886, -1.508049, -2.947214, 1, 0.2941177, 0, 1,
-1.526217, -1.108602, -2.617072, 1, 0.3019608, 0, 1,
-1.51655, -0.2525604, -1.941574, 1, 0.3058824, 0, 1,
-1.505673, 1.515772, -1.369923, 1, 0.3137255, 0, 1,
-1.495714, 0.9490627, 0.007011132, 1, 0.3176471, 0, 1,
-1.49235, 0.9500284, -1.087283, 1, 0.3254902, 0, 1,
-1.490375, 0.6649559, -1.604504, 1, 0.3294118, 0, 1,
-1.487572, -1.517753, -1.456198, 1, 0.3372549, 0, 1,
-1.47917, -1.831731, -4.57015, 1, 0.3411765, 0, 1,
-1.477793, 0.7333068, -2.211066, 1, 0.3490196, 0, 1,
-1.459363, -0.4187588, -2.208538, 1, 0.3529412, 0, 1,
-1.459272, -1.065146, -1.27932, 1, 0.3607843, 0, 1,
-1.458058, 1.344667, -2.420402, 1, 0.3647059, 0, 1,
-1.457623, -1.284415, -0.7060295, 1, 0.372549, 0, 1,
-1.440522, -0.05989378, -1.163607, 1, 0.3764706, 0, 1,
-1.436838, -1.674583, -3.099022, 1, 0.3843137, 0, 1,
-1.427813, 0.9593849, -2.147817, 1, 0.3882353, 0, 1,
-1.423756, -0.4649351, -2.989829, 1, 0.3960784, 0, 1,
-1.417985, -1.767907, -3.415136, 1, 0.4039216, 0, 1,
-1.414178, 0.5008917, -1.668201, 1, 0.4078431, 0, 1,
-1.412709, 2.114737, -1.059162, 1, 0.4156863, 0, 1,
-1.410334, -0.1410872, -2.213517, 1, 0.4196078, 0, 1,
-1.409485, 0.1368041, -1.071527, 1, 0.427451, 0, 1,
-1.405293, 0.2437178, -1.718734, 1, 0.4313726, 0, 1,
-1.40528, -0.9181162, -0.6196444, 1, 0.4392157, 0, 1,
-1.392167, 0.1196122, -0.6507251, 1, 0.4431373, 0, 1,
-1.369126, 0.3078658, -1.460586, 1, 0.4509804, 0, 1,
-1.359072, -0.03733996, -2.441765, 1, 0.454902, 0, 1,
-1.351027, 0.4196044, -1.902213, 1, 0.4627451, 0, 1,
-1.349097, 0.8526633, -1.283644, 1, 0.4666667, 0, 1,
-1.34618, -0.1335741, -1.567706, 1, 0.4745098, 0, 1,
-1.340974, -0.1127369, -1.290817, 1, 0.4784314, 0, 1,
-1.34061, -0.7748963, -0.6007661, 1, 0.4862745, 0, 1,
-1.335127, 0.6308222, -2.763432, 1, 0.4901961, 0, 1,
-1.327477, -0.3316916, -2.379158, 1, 0.4980392, 0, 1,
-1.326534, -1.599821, -2.315051, 1, 0.5058824, 0, 1,
-1.318292, 1.421887, -0.516176, 1, 0.509804, 0, 1,
-1.31567, 1.154292, -1.131955, 1, 0.5176471, 0, 1,
-1.31105, 1.034545, -2.620862, 1, 0.5215687, 0, 1,
-1.310905, 0.6386121, -1.611163, 1, 0.5294118, 0, 1,
-1.306996, 0.1781154, 0.2110897, 1, 0.5333334, 0, 1,
-1.301322, 1.088867, -1.133878, 1, 0.5411765, 0, 1,
-1.299525, -0.8680876, -2.848667, 1, 0.5450981, 0, 1,
-1.29904, -0.1419561, -2.057618, 1, 0.5529412, 0, 1,
-1.292287, -1.700872, -1.984553, 1, 0.5568628, 0, 1,
-1.291745, 0.2926603, -2.090797, 1, 0.5647059, 0, 1,
-1.290885, -0.7741122, -1.166571, 1, 0.5686275, 0, 1,
-1.290321, 0.4405997, -1.409667, 1, 0.5764706, 0, 1,
-1.285939, 0.5993888, -0.9605551, 1, 0.5803922, 0, 1,
-1.282622, 1.356073, -2.316381, 1, 0.5882353, 0, 1,
-1.268836, -0.2328986, -0.8299189, 1, 0.5921569, 0, 1,
-1.266182, 1.840054, 0.2756691, 1, 0.6, 0, 1,
-1.259888, -0.2436839, -0.1798934, 1, 0.6078432, 0, 1,
-1.256525, -0.2722442, -0.9180098, 1, 0.6117647, 0, 1,
-1.252778, 1.858703, -1.802008, 1, 0.6196079, 0, 1,
-1.252297, 1.872181, 1.974544, 1, 0.6235294, 0, 1,
-1.244668, 0.1173397, -0.7077006, 1, 0.6313726, 0, 1,
-1.24415, 0.008214421, -1.107652, 1, 0.6352941, 0, 1,
-1.24286, 1.266192, 0.5430811, 1, 0.6431373, 0, 1,
-1.241526, -0.1888553, -2.537749, 1, 0.6470588, 0, 1,
-1.230599, 0.5581574, -1.655399, 1, 0.654902, 0, 1,
-1.222696, 0.4795989, -1.590097, 1, 0.6588235, 0, 1,
-1.216195, -1.6817, -1.817551, 1, 0.6666667, 0, 1,
-1.216175, 0.2694139, -1.363664, 1, 0.6705883, 0, 1,
-1.213504, 0.2458504, -1.698017, 1, 0.6784314, 0, 1,
-1.208799, -0.2258279, -0.5481229, 1, 0.682353, 0, 1,
-1.190334, 0.2656448, -0.7475002, 1, 0.6901961, 0, 1,
-1.187207, 0.1117238, -1.317433, 1, 0.6941177, 0, 1,
-1.183048, 0.9902685, -1.702784, 1, 0.7019608, 0, 1,
-1.176225, -0.8036228, -3.783154, 1, 0.7098039, 0, 1,
-1.160748, -0.9877219, -3.051849, 1, 0.7137255, 0, 1,
-1.158746, 0.6102587, -0.9642508, 1, 0.7215686, 0, 1,
-1.147228, 1.452096, -0.4366635, 1, 0.7254902, 0, 1,
-1.138099, 0.3352481, -0.9766914, 1, 0.7333333, 0, 1,
-1.136038, -0.6360843, 0.1914721, 1, 0.7372549, 0, 1,
-1.133169, 0.0802379, -0.9397247, 1, 0.7450981, 0, 1,
-1.132395, -0.05808109, -1.853358, 1, 0.7490196, 0, 1,
-1.132026, -0.8864338, -2.115999, 1, 0.7568628, 0, 1,
-1.130295, -3.586965, -2.377463, 1, 0.7607843, 0, 1,
-1.129313, 0.2099966, -1.100194, 1, 0.7686275, 0, 1,
-1.12845, -0.6620073, -2.047448, 1, 0.772549, 0, 1,
-1.128399, -0.4509127, -1.531007, 1, 0.7803922, 0, 1,
-1.125456, 0.4163351, -0.5895686, 1, 0.7843137, 0, 1,
-1.122529, -1.396939, -2.408631, 1, 0.7921569, 0, 1,
-1.119875, -0.008352263, -2.103894, 1, 0.7960784, 0, 1,
-1.114011, 0.2569997, -4.00932, 1, 0.8039216, 0, 1,
-1.113631, -0.6756427, -2.897019, 1, 0.8117647, 0, 1,
-1.112513, -1.1323, -1.622127, 1, 0.8156863, 0, 1,
-1.104496, 0.5928869, -2.538459, 1, 0.8235294, 0, 1,
-1.102272, -0.5780452, -3.479525, 1, 0.827451, 0, 1,
-1.100419, -0.1878642, -1.891313, 1, 0.8352941, 0, 1,
-1.094739, 0.3453897, -0.6942627, 1, 0.8392157, 0, 1,
-1.093105, -0.6870664, -1.096949, 1, 0.8470588, 0, 1,
-1.091285, -1.383666, -1.833886, 1, 0.8509804, 0, 1,
-1.087877, 1.122697, -1.581309, 1, 0.8588235, 0, 1,
-1.083894, -0.3932349, -0.4095605, 1, 0.8627451, 0, 1,
-1.083483, -1.493399, -4.00257, 1, 0.8705882, 0, 1,
-1.081233, -0.2703751, 0.4477543, 1, 0.8745098, 0, 1,
-1.063294, -0.2096488, -2.69714, 1, 0.8823529, 0, 1,
-1.061483, -0.4132722, -1.859586, 1, 0.8862745, 0, 1,
-1.058669, -0.7080948, -1.645438, 1, 0.8941177, 0, 1,
-1.054649, 1.044504, -0.5553896, 1, 0.8980392, 0, 1,
-1.053935, -0.883227, -2.382505, 1, 0.9058824, 0, 1,
-1.052783, -0.4068927, -3.184647, 1, 0.9137255, 0, 1,
-1.052327, -1.535267, -1.605485, 1, 0.9176471, 0, 1,
-1.045594, -1.567649, -4.391453, 1, 0.9254902, 0, 1,
-1.044964, -1.221099, -3.129545, 1, 0.9294118, 0, 1,
-1.044188, 1.012465, -1.255752, 1, 0.9372549, 0, 1,
-1.035578, -0.3669775, -0.876356, 1, 0.9411765, 0, 1,
-1.033137, 0.1416928, -1.232063, 1, 0.9490196, 0, 1,
-1.032809, 0.5670183, -1.943083, 1, 0.9529412, 0, 1,
-1.032145, -0.5061598, -0.6926467, 1, 0.9607843, 0, 1,
-1.029678, 0.8349661, -1.050688, 1, 0.9647059, 0, 1,
-1.029443, 0.2350297, -1.592546, 1, 0.972549, 0, 1,
-1.017782, 0.9023689, -1.052457, 1, 0.9764706, 0, 1,
-1.016765, -0.6549725, -3.356254, 1, 0.9843137, 0, 1,
-1.016102, -0.5958123, -1.647692, 1, 0.9882353, 0, 1,
-1.015738, -0.6018141, -1.706999, 1, 0.9960784, 0, 1,
-1.014954, 1.824386, -0.6132934, 0.9960784, 1, 0, 1,
-1.012817, 1.377475, 0.3223875, 0.9921569, 1, 0, 1,
-0.9970115, -1.306002, -3.102857, 0.9843137, 1, 0, 1,
-0.9930208, 0.3134415, -1.280413, 0.9803922, 1, 0, 1,
-0.9920442, 2.391787, -0.7050676, 0.972549, 1, 0, 1,
-0.9919514, 0.1498092, 0.5595459, 0.9686275, 1, 0, 1,
-0.9913682, -0.1530056, -2.285479, 0.9607843, 1, 0, 1,
-0.9911025, 0.1289423, -1.422858, 0.9568627, 1, 0, 1,
-0.9897256, -0.02695554, -1.070437, 0.9490196, 1, 0, 1,
-0.9881672, -0.4448323, -1.648829, 0.945098, 1, 0, 1,
-0.9863151, 0.3819398, -0.7662437, 0.9372549, 1, 0, 1,
-0.9833278, 0.5279599, -0.6710208, 0.9333333, 1, 0, 1,
-0.9768406, 0.3647206, -1.571283, 0.9254902, 1, 0, 1,
-0.975885, -2.250895, -2.101687, 0.9215686, 1, 0, 1,
-0.9680985, -1.28404, -3.284612, 0.9137255, 1, 0, 1,
-0.9665571, 0.409214, -2.769514, 0.9098039, 1, 0, 1,
-0.9593984, 2.097261, -1.294353, 0.9019608, 1, 0, 1,
-0.9577354, 1.830737, -0.3179339, 0.8941177, 1, 0, 1,
-0.9463276, 0.1354954, -1.763123, 0.8901961, 1, 0, 1,
-0.9422895, 0.1344425, -3.508769, 0.8823529, 1, 0, 1,
-0.9386541, 0.1454457, -2.032618, 0.8784314, 1, 0, 1,
-0.9374136, -1.806269, -1.918048, 0.8705882, 1, 0, 1,
-0.9371191, -0.6784141, -1.210734, 0.8666667, 1, 0, 1,
-0.9350566, 1.374706, 0.4675176, 0.8588235, 1, 0, 1,
-0.9332179, -0.251781, -1.319335, 0.854902, 1, 0, 1,
-0.9262655, 0.601989, -1.803819, 0.8470588, 1, 0, 1,
-0.9249291, 1.321752, 0.1061108, 0.8431373, 1, 0, 1,
-0.9237322, 0.6353647, -0.6487097, 0.8352941, 1, 0, 1,
-0.9198937, 0.6874997, -0.1847449, 0.8313726, 1, 0, 1,
-0.9183106, -1.418626, -1.247057, 0.8235294, 1, 0, 1,
-0.9111468, 0.0687299, -0.8116651, 0.8196079, 1, 0, 1,
-0.9107866, 0.3608514, -2.13949, 0.8117647, 1, 0, 1,
-0.9083393, -0.2818342, -2.021614, 0.8078431, 1, 0, 1,
-0.9076982, -0.6315358, -0.3343938, 0.8, 1, 0, 1,
-0.907241, 0.8049873, -0.9072779, 0.7921569, 1, 0, 1,
-0.905987, -0.9354239, -2.091227, 0.7882353, 1, 0, 1,
-0.9044435, -0.7322844, -2.542005, 0.7803922, 1, 0, 1,
-0.9037434, -0.008333672, 0.1608624, 0.7764706, 1, 0, 1,
-0.897077, -2.114974, -2.643363, 0.7686275, 1, 0, 1,
-0.8944761, -0.2131307, -2.442355, 0.7647059, 1, 0, 1,
-0.8925595, -0.01108857, -1.907971, 0.7568628, 1, 0, 1,
-0.8886663, 0.516851, -0.6362533, 0.7529412, 1, 0, 1,
-0.8882095, -1.283329, -3.784713, 0.7450981, 1, 0, 1,
-0.8877696, -0.06175689, -3.398146, 0.7411765, 1, 0, 1,
-0.8744733, 0.1544197, -1.923316, 0.7333333, 1, 0, 1,
-0.8732078, -0.002628784, -1.278818, 0.7294118, 1, 0, 1,
-0.8729671, -0.3537481, -1.384493, 0.7215686, 1, 0, 1,
-0.8722665, -1.709213, -2.568398, 0.7176471, 1, 0, 1,
-0.8687643, -0.3836058, -2.333061, 0.7098039, 1, 0, 1,
-0.8527798, -0.1843126, -3.302547, 0.7058824, 1, 0, 1,
-0.8450231, 0.7075276, -2.745713, 0.6980392, 1, 0, 1,
-0.8434095, -0.2944385, 0.1595897, 0.6901961, 1, 0, 1,
-0.8380662, 0.7072042, 0.02471648, 0.6862745, 1, 0, 1,
-0.8371418, -1.062458, -2.066052, 0.6784314, 1, 0, 1,
-0.8363354, -0.727402, -1.667998, 0.6745098, 1, 0, 1,
-0.8353376, 0.09576897, -2.074756, 0.6666667, 1, 0, 1,
-0.835045, -0.4246345, -2.206944, 0.6627451, 1, 0, 1,
-0.8341444, 0.3500653, -1.628468, 0.654902, 1, 0, 1,
-0.8340553, 1.865064, -0.4508656, 0.6509804, 1, 0, 1,
-0.828696, -0.360672, -2.700572, 0.6431373, 1, 0, 1,
-0.8079345, 0.8408023, -0.2307671, 0.6392157, 1, 0, 1,
-0.8004075, 0.5225362, -0.6921063, 0.6313726, 1, 0, 1,
-0.7931835, 0.7641225, -0.6517826, 0.627451, 1, 0, 1,
-0.7913611, 0.1250361, -0.7398865, 0.6196079, 1, 0, 1,
-0.7886699, -0.670594, -2.180434, 0.6156863, 1, 0, 1,
-0.7862304, 0.7787929, -0.02362094, 0.6078432, 1, 0, 1,
-0.7852479, 0.4293113, -2.949027, 0.6039216, 1, 0, 1,
-0.7817548, -0.8562964, -2.264182, 0.5960785, 1, 0, 1,
-0.780405, 0.3438119, -1.713776, 0.5882353, 1, 0, 1,
-0.7784474, 0.2128267, -1.006073, 0.5843138, 1, 0, 1,
-0.7754359, -1.066927, -2.172803, 0.5764706, 1, 0, 1,
-0.7685319, -2.443946, -3.346303, 0.572549, 1, 0, 1,
-0.7669336, 0.8321429, -1.550002, 0.5647059, 1, 0, 1,
-0.7578881, -0.1731855, -1.326021, 0.5607843, 1, 0, 1,
-0.7577877, -0.3749743, -2.872231, 0.5529412, 1, 0, 1,
-0.7531603, -0.2342676, -2.622145, 0.5490196, 1, 0, 1,
-0.7519555, -1.37156, -0.7548002, 0.5411765, 1, 0, 1,
-0.7494856, -0.04893998, -0.9750077, 0.5372549, 1, 0, 1,
-0.7418221, 1.692139, -0.6958769, 0.5294118, 1, 0, 1,
-0.7395164, 0.5842544, 0.7861194, 0.5254902, 1, 0, 1,
-0.7394333, 0.5541608, -1.34431, 0.5176471, 1, 0, 1,
-0.7377694, -1.331555, -3.825057, 0.5137255, 1, 0, 1,
-0.7345822, -0.6591772, -2.230919, 0.5058824, 1, 0, 1,
-0.7324098, 0.8024361, -1.058545, 0.5019608, 1, 0, 1,
-0.7313095, -0.5329307, -3.061573, 0.4941176, 1, 0, 1,
-0.730494, -0.7227136, -2.841177, 0.4862745, 1, 0, 1,
-0.7244278, 0.3181626, 1.07671, 0.4823529, 1, 0, 1,
-0.7172152, 0.97968, -0.1424707, 0.4745098, 1, 0, 1,
-0.7150378, -0.9725167, -3.269695, 0.4705882, 1, 0, 1,
-0.7138762, 0.7594703, -1.476421, 0.4627451, 1, 0, 1,
-0.7135157, 0.1514777, -0.5216001, 0.4588235, 1, 0, 1,
-0.7073447, 2.097793, 1.011662, 0.4509804, 1, 0, 1,
-0.707206, -0.3867165, -2.068727, 0.4470588, 1, 0, 1,
-0.7028273, 0.0008017246, -2.496456, 0.4392157, 1, 0, 1,
-0.7008923, -1.841746, -3.533237, 0.4352941, 1, 0, 1,
-0.6966795, 0.2654262, -1.439974, 0.427451, 1, 0, 1,
-0.6964724, 0.6809458, 0.710997, 0.4235294, 1, 0, 1,
-0.696179, -0.2890082, -2.26967, 0.4156863, 1, 0, 1,
-0.6911488, -0.9207886, -3.341897, 0.4117647, 1, 0, 1,
-0.6895407, -0.8798069, -0.993643, 0.4039216, 1, 0, 1,
-0.6864649, 2.682045, 2.101865, 0.3960784, 1, 0, 1,
-0.6853495, -1.203138, -2.37325, 0.3921569, 1, 0, 1,
-0.6836627, -0.0634858, -1.112218, 0.3843137, 1, 0, 1,
-0.6825328, 0.3153232, -0.709287, 0.3803922, 1, 0, 1,
-0.676937, 0.3439054, -1.672687, 0.372549, 1, 0, 1,
-0.6736106, -0.7837324, -2.031615, 0.3686275, 1, 0, 1,
-0.6728424, 0.5467229, -1.293929, 0.3607843, 1, 0, 1,
-0.666564, -0.1062194, -1.023594, 0.3568628, 1, 0, 1,
-0.6620591, 0.7544164, 0.4274195, 0.3490196, 1, 0, 1,
-0.658217, -0.627856, -2.248404, 0.345098, 1, 0, 1,
-0.6514655, 1.162138, -0.009992115, 0.3372549, 1, 0, 1,
-0.6490092, 0.4817323, -0.9172471, 0.3333333, 1, 0, 1,
-0.6419557, 1.348685, -1.620834, 0.3254902, 1, 0, 1,
-0.6351765, 0.4535046, 0.7637429, 0.3215686, 1, 0, 1,
-0.6306741, 0.5638391, -1.520915, 0.3137255, 1, 0, 1,
-0.6251734, 1.021082, -1.278178, 0.3098039, 1, 0, 1,
-0.6250899, 1.289636, -1.321398, 0.3019608, 1, 0, 1,
-0.6211287, -0.2160079, -2.194132, 0.2941177, 1, 0, 1,
-0.619638, -0.02666181, -1.335384, 0.2901961, 1, 0, 1,
-0.6146252, 2.204714, -0.2645046, 0.282353, 1, 0, 1,
-0.6087243, 0.7802774, -1.384026, 0.2784314, 1, 0, 1,
-0.6038223, 0.05780432, -0.727869, 0.2705882, 1, 0, 1,
-0.5980117, 0.705871, -0.1307276, 0.2666667, 1, 0, 1,
-0.5928721, 0.4047714, 0.8721687, 0.2588235, 1, 0, 1,
-0.5914054, -1.93724, -2.535212, 0.254902, 1, 0, 1,
-0.5860983, 1.984557, -0.8739065, 0.2470588, 1, 0, 1,
-0.5860282, -0.03074891, -1.811574, 0.2431373, 1, 0, 1,
-0.5855468, 0.07609591, -0.7015923, 0.2352941, 1, 0, 1,
-0.5832375, 0.4238827, -0.4851941, 0.2313726, 1, 0, 1,
-0.5823503, 0.4895421, -1.371293, 0.2235294, 1, 0, 1,
-0.5814109, -0.5135195, -2.449324, 0.2196078, 1, 0, 1,
-0.5795894, 0.2713032, -0.2194953, 0.2117647, 1, 0, 1,
-0.5710045, -0.08487476, -0.7814745, 0.2078431, 1, 0, 1,
-0.5703663, -0.672891, -3.679436, 0.2, 1, 0, 1,
-0.5667688, -0.1647466, -1.462521, 0.1921569, 1, 0, 1,
-0.5659112, 0.04386121, -0.292431, 0.1882353, 1, 0, 1,
-0.5651983, -0.5297639, -3.135807, 0.1803922, 1, 0, 1,
-0.5635502, -0.6385171, -2.854305, 0.1764706, 1, 0, 1,
-0.563239, 0.008645756, -0.704357, 0.1686275, 1, 0, 1,
-0.5625662, -0.1937332, -1.553236, 0.1647059, 1, 0, 1,
-0.5623924, 0.3036188, 0.7796289, 0.1568628, 1, 0, 1,
-0.558641, -1.362832, -4.653444, 0.1529412, 1, 0, 1,
-0.5492556, -1.211181, -3.303434, 0.145098, 1, 0, 1,
-0.5401112, 1.806608, -1.801332, 0.1411765, 1, 0, 1,
-0.5396572, -0.1934743, -1.781679, 0.1333333, 1, 0, 1,
-0.536476, -0.2400302, -0.8008216, 0.1294118, 1, 0, 1,
-0.5331478, -0.7383888, -2.835945, 0.1215686, 1, 0, 1,
-0.5304079, -0.7464319, -1.53663, 0.1176471, 1, 0, 1,
-0.5286438, -0.4391708, -2.966779, 0.1098039, 1, 0, 1,
-0.5266963, 0.4667017, -0.210567, 0.1058824, 1, 0, 1,
-0.5263041, 0.878156, -1.195566, 0.09803922, 1, 0, 1,
-0.5241441, 0.9191928, -1.610756, 0.09019608, 1, 0, 1,
-0.5156079, -0.03467361, -3.337826, 0.08627451, 1, 0, 1,
-0.5152709, -0.6944113, -1.73708, 0.07843138, 1, 0, 1,
-0.5142807, 0.8484821, 0.02530856, 0.07450981, 1, 0, 1,
-0.5129505, 0.4256515, -1.312053, 0.06666667, 1, 0, 1,
-0.5113555, 1.355772, -0.1774859, 0.0627451, 1, 0, 1,
-0.508853, 0.8968677, -1.742077, 0.05490196, 1, 0, 1,
-0.507105, 0.3829387, -0.1169338, 0.05098039, 1, 0, 1,
-0.5026674, 2.502952, -2.328124, 0.04313726, 1, 0, 1,
-0.5006225, -2.493981, -1.252729, 0.03921569, 1, 0, 1,
-0.4983743, 1.829023, -0.3583418, 0.03137255, 1, 0, 1,
-0.4952978, 1.045401, -2.006032, 0.02745098, 1, 0, 1,
-0.4935429, -0.1690925, -2.423529, 0.01960784, 1, 0, 1,
-0.4904375, 0.1514535, -2.933615, 0.01568628, 1, 0, 1,
-0.4893597, 1.752229, -0.3014906, 0.007843138, 1, 0, 1,
-0.4885322, 1.524778, -0.1941875, 0.003921569, 1, 0, 1,
-0.4883507, 0.2260807, -0.6647999, 0, 1, 0.003921569, 1,
-0.4712592, -0.2367276, -2.083062, 0, 1, 0.01176471, 1,
-0.4586883, 1.177971, 0.7986936, 0, 1, 0.01568628, 1,
-0.4578159, 0.04418977, -0.7695931, 0, 1, 0.02352941, 1,
-0.45647, -0.5282219, -3.420698, 0, 1, 0.02745098, 1,
-0.4537141, 0.8183474, -0.5571219, 0, 1, 0.03529412, 1,
-0.4488049, -0.4993951, -1.316023, 0, 1, 0.03921569, 1,
-0.4463363, -0.2240492, -2.02416, 0, 1, 0.04705882, 1,
-0.4373086, -0.3306816, -4.700947, 0, 1, 0.05098039, 1,
-0.4361878, 0.6187508, -0.4490468, 0, 1, 0.05882353, 1,
-0.431037, 0.8660005, -1.441309, 0, 1, 0.0627451, 1,
-0.4300532, 0.5789137, -0.1719573, 0, 1, 0.07058824, 1,
-0.4299287, 0.9365485, 0.6650309, 0, 1, 0.07450981, 1,
-0.4212525, 0.99966, -0.8700755, 0, 1, 0.08235294, 1,
-0.4144687, -0.9528472, -4.008999, 0, 1, 0.08627451, 1,
-0.4105258, -0.408107, -1.636537, 0, 1, 0.09411765, 1,
-0.4058658, 0.5828894, -0.8580425, 0, 1, 0.1019608, 1,
-0.4005175, -1.259271, -5.088836, 0, 1, 0.1058824, 1,
-0.400264, -0.229378, -1.81802, 0, 1, 0.1137255, 1,
-0.3930551, -0.04792627, -0.3817148, 0, 1, 0.1176471, 1,
-0.3909853, -0.64302, -3.46051, 0, 1, 0.1254902, 1,
-0.3893454, -0.3494176, -1.108299, 0, 1, 0.1294118, 1,
-0.3874682, 0.6758838, -0.7919667, 0, 1, 0.1372549, 1,
-0.387372, 1.655489, -1.146412, 0, 1, 0.1411765, 1,
-0.3848776, 0.08161077, 0.04440998, 0, 1, 0.1490196, 1,
-0.3835857, 1.34139, 0.04456713, 0, 1, 0.1529412, 1,
-0.3793317, 0.09440367, -1.012414, 0, 1, 0.1607843, 1,
-0.3735616, -0.54877, -2.694973, 0, 1, 0.1647059, 1,
-0.3629756, 0.3106631, 0.9264059, 0, 1, 0.172549, 1,
-0.3621065, -2.82078, -2.18838, 0, 1, 0.1764706, 1,
-0.3598848, 1.21338, -0.3921205, 0, 1, 0.1843137, 1,
-0.3595088, 2.44547, 0.2203896, 0, 1, 0.1882353, 1,
-0.3573563, 1.377833, 0.6608675, 0, 1, 0.1960784, 1,
-0.355389, -1.774383, -1.764995, 0, 1, 0.2039216, 1,
-0.3535667, 1.437652, -0.7699047, 0, 1, 0.2078431, 1,
-0.3496614, 1.180686, -0.3499926, 0, 1, 0.2156863, 1,
-0.3445627, -0.1254553, -2.145378, 0, 1, 0.2196078, 1,
-0.3416216, -0.7906024, -2.228413, 0, 1, 0.227451, 1,
-0.3413328, 1.240558, 0.3512079, 0, 1, 0.2313726, 1,
-0.3411092, 1.883265, 0.5100495, 0, 1, 0.2392157, 1,
-0.3306659, 0.8603328, 0.1747732, 0, 1, 0.2431373, 1,
-0.3206388, -0.5741357, -1.758867, 0, 1, 0.2509804, 1,
-0.3075001, -1.4566, -3.081102, 0, 1, 0.254902, 1,
-0.3059119, 0.09046192, 0.05863375, 0, 1, 0.2627451, 1,
-0.2903677, 0.6231636, 0.7742926, 0, 1, 0.2666667, 1,
-0.2888781, 0.1352938, -1.053541, 0, 1, 0.2745098, 1,
-0.2824234, -0.505084, -1.413186, 0, 1, 0.2784314, 1,
-0.2809842, -1.443, -3.539238, 0, 1, 0.2862745, 1,
-0.275891, 1.14804, 1.03889, 0, 1, 0.2901961, 1,
-0.2753769, -1.787942, -3.64798, 0, 1, 0.2980392, 1,
-0.273056, 1.790672, 0.2418523, 0, 1, 0.3058824, 1,
-0.2715556, -0.5388209, -3.069481, 0, 1, 0.3098039, 1,
-0.2704653, -0.2046884, -3.851646, 0, 1, 0.3176471, 1,
-0.2669803, 0.4081703, 0.1277457, 0, 1, 0.3215686, 1,
-0.2594499, 1.519751, 0.2023743, 0, 1, 0.3294118, 1,
-0.2551652, -0.8386488, -3.570047, 0, 1, 0.3333333, 1,
-0.2532003, 1.34125, 0.0481458, 0, 1, 0.3411765, 1,
-0.2529576, -0.06653056, -2.822372, 0, 1, 0.345098, 1,
-0.2456677, 0.3200853, -0.5068532, 0, 1, 0.3529412, 1,
-0.2447683, -1.190647, -1.607549, 0, 1, 0.3568628, 1,
-0.2389441, 1.807644, 1.318138, 0, 1, 0.3647059, 1,
-0.2371278, 1.364949, -1.130136, 0, 1, 0.3686275, 1,
-0.2356314, 0.9851797, 0.40975, 0, 1, 0.3764706, 1,
-0.233866, -0.02508126, -0.1408438, 0, 1, 0.3803922, 1,
-0.2312458, 1.845422, 0.6652189, 0, 1, 0.3882353, 1,
-0.2288184, -0.01504791, -3.380531, 0, 1, 0.3921569, 1,
-0.2186409, -0.9431857, -3.799809, 0, 1, 0.4, 1,
-0.2173949, 1.246626, -1.183519, 0, 1, 0.4078431, 1,
-0.2106985, 0.549428, -1.327156, 0, 1, 0.4117647, 1,
-0.2097906, -1.787143, -2.006829, 0, 1, 0.4196078, 1,
-0.2049395, -0.3442508, -3.438097, 0, 1, 0.4235294, 1,
-0.204393, -0.7822787, -3.311798, 0, 1, 0.4313726, 1,
-0.2021949, -0.5774179, -3.02079, 0, 1, 0.4352941, 1,
-0.2005523, -0.4887042, -1.992859, 0, 1, 0.4431373, 1,
-0.199672, 0.3617161, -0.3648349, 0, 1, 0.4470588, 1,
-0.1994164, 1.169279, -3.122589, 0, 1, 0.454902, 1,
-0.1993642, -0.1392524, -1.692097, 0, 1, 0.4588235, 1,
-0.1976744, 0.7193074, 0.25484, 0, 1, 0.4666667, 1,
-0.1939764, 0.1101104, -2.403456, 0, 1, 0.4705882, 1,
-0.1892992, 0.006402561, -1.546449, 0, 1, 0.4784314, 1,
-0.1881513, -1.389232, -2.991181, 0, 1, 0.4823529, 1,
-0.1856093, 0.6859826, -1.059082, 0, 1, 0.4901961, 1,
-0.1829626, 1.746197, 0.8172459, 0, 1, 0.4941176, 1,
-0.1807157, -0.5588951, -1.481506, 0, 1, 0.5019608, 1,
-0.1802256, -0.352066, -3.048339, 0, 1, 0.509804, 1,
-0.1789356, -0.3537268, -1.328994, 0, 1, 0.5137255, 1,
-0.1769267, -0.8092708, -1.908288, 0, 1, 0.5215687, 1,
-0.1764517, -0.9418923, -2.466826, 0, 1, 0.5254902, 1,
-0.1754695, -0.8499794, -3.02858, 0, 1, 0.5333334, 1,
-0.1719437, 0.3317948, -1.268499, 0, 1, 0.5372549, 1,
-0.1704688, -0.5414694, -0.3030189, 0, 1, 0.5450981, 1,
-0.169863, -1.276118, -2.261629, 0, 1, 0.5490196, 1,
-0.1691958, -1.157553, -1.888558, 0, 1, 0.5568628, 1,
-0.1687024, 0.7552607, 0.3286616, 0, 1, 0.5607843, 1,
-0.1655984, 0.07129114, -1.879218, 0, 1, 0.5686275, 1,
-0.1647862, -0.6678411, -3.599451, 0, 1, 0.572549, 1,
-0.1592353, 0.2640929, -0.5905134, 0, 1, 0.5803922, 1,
-0.155505, 0.9022994, 0.6151774, 0, 1, 0.5843138, 1,
-0.1516123, -0.7084777, -3.711632, 0, 1, 0.5921569, 1,
-0.1478964, 1.415654, 0.2763479, 0, 1, 0.5960785, 1,
-0.1428094, -0.8934996, -3.935398, 0, 1, 0.6039216, 1,
-0.1419544, -1.66701, -3.327199, 0, 1, 0.6117647, 1,
-0.1398693, -0.4227867, -2.218317, 0, 1, 0.6156863, 1,
-0.1390589, 1.257701, -0.4982664, 0, 1, 0.6235294, 1,
-0.1368973, -0.5431212, -2.923339, 0, 1, 0.627451, 1,
-0.136474, 0.5682307, -0.01710125, 0, 1, 0.6352941, 1,
-0.1351466, 3.206385, -0.7650109, 0, 1, 0.6392157, 1,
-0.1255954, 0.4132123, 0.2441534, 0, 1, 0.6470588, 1,
-0.1240983, -0.09960284, -1.314726, 0, 1, 0.6509804, 1,
-0.1228303, 2.257734, -1.070997, 0, 1, 0.6588235, 1,
-0.1222064, -0.7768996, -1.827453, 0, 1, 0.6627451, 1,
-0.1197508, 0.4200081, -1.705021, 0, 1, 0.6705883, 1,
-0.1158007, 0.2245244, 0.9089257, 0, 1, 0.6745098, 1,
-0.1141936, 0.5778199, 0.7576582, 0, 1, 0.682353, 1,
-0.1025601, -1.005787, -2.769359, 0, 1, 0.6862745, 1,
-0.1009142, -0.950069, -2.202666, 0, 1, 0.6941177, 1,
-0.09827294, -0.4431932, -3.527748, 0, 1, 0.7019608, 1,
-0.09396493, 0.8399061, -0.945994, 0, 1, 0.7058824, 1,
-0.08886997, 0.2901719, 0.1070991, 0, 1, 0.7137255, 1,
-0.08743875, 0.1242439, -1.178949, 0, 1, 0.7176471, 1,
-0.08591394, 0.7639692, 1.621685, 0, 1, 0.7254902, 1,
-0.08430085, -1.343304, -2.21848, 0, 1, 0.7294118, 1,
-0.08162792, -1.778838, -3.021304, 0, 1, 0.7372549, 1,
-0.07986058, 1.003779, 0.0005416013, 0, 1, 0.7411765, 1,
-0.07964769, 0.5289148, 0.6663864, 0, 1, 0.7490196, 1,
-0.07763836, 0.4763978, 0.5246896, 0, 1, 0.7529412, 1,
-0.06826156, -1.175803, -2.567012, 0, 1, 0.7607843, 1,
-0.0679525, 1.459106, -1.372197, 0, 1, 0.7647059, 1,
-0.06638599, 1.219353, 0.7158833, 0, 1, 0.772549, 1,
-0.06493165, -0.196209, -3.539889, 0, 1, 0.7764706, 1,
-0.06061568, 0.1091717, -0.3318935, 0, 1, 0.7843137, 1,
-0.05726031, -0.5655396, -1.862679, 0, 1, 0.7882353, 1,
-0.05465099, 0.5564597, -0.6618159, 0, 1, 0.7960784, 1,
-0.05275692, -1.350499, -3.732886, 0, 1, 0.8039216, 1,
-0.04681724, -1.74927, -3.247506, 0, 1, 0.8078431, 1,
-0.04659182, -0.6206289, -2.345896, 0, 1, 0.8156863, 1,
-0.0410255, 0.1881374, -2.202097, 0, 1, 0.8196079, 1,
-0.04068661, -1.742575, -1.99813, 0, 1, 0.827451, 1,
-0.04060151, -0.7075441, -3.270771, 0, 1, 0.8313726, 1,
-0.03999382, 1.031608, 0.5803103, 0, 1, 0.8392157, 1,
-0.03991789, -0.184883, -3.069102, 0, 1, 0.8431373, 1,
-0.03759671, 1.378403, 1.1239, 0, 1, 0.8509804, 1,
-0.03699454, -1.20804, -3.677765, 0, 1, 0.854902, 1,
-0.03518177, 0.08090187, 0.5213469, 0, 1, 0.8627451, 1,
-0.0339294, 0.2498177, -0.4645503, 0, 1, 0.8666667, 1,
-0.03009898, 0.1778568, 0.5881816, 0, 1, 0.8745098, 1,
-0.02939982, 0.1880235, -0.2486316, 0, 1, 0.8784314, 1,
-0.02580717, 0.1309561, -0.1858893, 0, 1, 0.8862745, 1,
-0.02100839, -0.4977984, -3.073833, 0, 1, 0.8901961, 1,
-0.02072862, -0.0179959, -1.700951, 0, 1, 0.8980392, 1,
-0.01628461, 1.184595, -1.801672, 0, 1, 0.9058824, 1,
-0.01396148, -0.7056004, -2.653147, 0, 1, 0.9098039, 1,
-0.01306592, 0.4764971, 1.735307, 0, 1, 0.9176471, 1,
-0.004629638, 1.205078, -0.09103451, 0, 1, 0.9215686, 1,
-0.002456794, -1.394374, -2.618493, 0, 1, 0.9294118, 1,
0.003947509, -0.9684246, 3.567131, 0, 1, 0.9333333, 1,
0.00613596, -0.04957615, 5.652003, 0, 1, 0.9411765, 1,
0.006464052, -0.2289566, 4.091815, 0, 1, 0.945098, 1,
0.01690961, 0.1083211, -0.3534803, 0, 1, 0.9529412, 1,
0.02086118, -1.97444, 1.604062, 0, 1, 0.9568627, 1,
0.02184833, -1.029941, 4.26125, 0, 1, 0.9647059, 1,
0.02349404, 0.6515601, -0.518108, 0, 1, 0.9686275, 1,
0.02542324, 1.022424, -0.5580936, 0, 1, 0.9764706, 1,
0.02620018, 1.574982, 1.484628, 0, 1, 0.9803922, 1,
0.02700629, -1.004778, 2.174839, 0, 1, 0.9882353, 1,
0.03152275, 1.173258, 0.5743923, 0, 1, 0.9921569, 1,
0.03161088, 0.1179888, 2.077847, 0, 1, 1, 1,
0.03240311, -0.5050324, 2.912141, 0, 0.9921569, 1, 1,
0.03363258, 0.4389915, -0.9003353, 0, 0.9882353, 1, 1,
0.04025008, -0.3797466, 3.293757, 0, 0.9803922, 1, 1,
0.04180104, -0.5649847, 5.744132, 0, 0.9764706, 1, 1,
0.0418408, -0.1475117, 2.667663, 0, 0.9686275, 1, 1,
0.04545352, 1.493421, 0.5185571, 0, 0.9647059, 1, 1,
0.04549512, -0.1276446, 2.345345, 0, 0.9568627, 1, 1,
0.04581816, -0.02581265, 2.811669, 0, 0.9529412, 1, 1,
0.04787498, 1.536661, -0.1808026, 0, 0.945098, 1, 1,
0.04924281, 1.260101, 0.8616843, 0, 0.9411765, 1, 1,
0.04974431, 1.313077, -2.266923, 0, 0.9333333, 1, 1,
0.05153701, -0.868872, 0.2536416, 0, 0.9294118, 1, 1,
0.05208356, -0.8190073, 3.457488, 0, 0.9215686, 1, 1,
0.05598274, 0.6701815, 0.7093062, 0, 0.9176471, 1, 1,
0.05767433, 0.3487079, -1.827609, 0, 0.9098039, 1, 1,
0.0584819, -0.6416159, 3.057311, 0, 0.9058824, 1, 1,
0.05858773, -1.757187, 2.254886, 0, 0.8980392, 1, 1,
0.05917627, -1.26447, 4.659455, 0, 0.8901961, 1, 1,
0.06376204, -0.6607882, 3.12059, 0, 0.8862745, 1, 1,
0.06395274, 0.504798, -0.9724642, 0, 0.8784314, 1, 1,
0.06544936, -0.4848599, 0.9613736, 0, 0.8745098, 1, 1,
0.0700611, -2.335426, 2.241014, 0, 0.8666667, 1, 1,
0.08698814, -0.09203774, 1.615527, 0, 0.8627451, 1, 1,
0.08899603, 0.592207, 0.1784583, 0, 0.854902, 1, 1,
0.09362862, 0.4023042, 1.618624, 0, 0.8509804, 1, 1,
0.09436371, -0.2006972, 2.43851, 0, 0.8431373, 1, 1,
0.09460979, -1.601107, 1.026345, 0, 0.8392157, 1, 1,
0.09618119, -0.892467, 2.294535, 0, 0.8313726, 1, 1,
0.09656917, 0.03781004, -0.004426548, 0, 0.827451, 1, 1,
0.1012348, 0.9951397, 0.3335631, 0, 0.8196079, 1, 1,
0.1023141, 0.1146365, 1.76679, 0, 0.8156863, 1, 1,
0.1028564, 0.3835394, 2.536648, 0, 0.8078431, 1, 1,
0.1059452, -0.07899296, 2.771981, 0, 0.8039216, 1, 1,
0.1118721, -0.7032657, 4.138545, 0, 0.7960784, 1, 1,
0.1138986, -1.344927, 3.244698, 0, 0.7882353, 1, 1,
0.1144717, 0.1544532, 1.897289, 0, 0.7843137, 1, 1,
0.120047, -0.8886666, 2.757221, 0, 0.7764706, 1, 1,
0.1214813, -1.702136, 2.194653, 0, 0.772549, 1, 1,
0.1220496, -0.2210702, 2.372041, 0, 0.7647059, 1, 1,
0.1224835, -1.665703, 3.335939, 0, 0.7607843, 1, 1,
0.1262739, 0.467796, 0.5674189, 0, 0.7529412, 1, 1,
0.1271818, 0.1783456, 0.6811924, 0, 0.7490196, 1, 1,
0.1277454, -0.2183467, 4.244603, 0, 0.7411765, 1, 1,
0.1300066, 0.05680363, 3.097646, 0, 0.7372549, 1, 1,
0.1320952, -1.471476, 2.956221, 0, 0.7294118, 1, 1,
0.1336699, 0.5614436, -0.7114667, 0, 0.7254902, 1, 1,
0.1339398, 0.3077331, 0.5611084, 0, 0.7176471, 1, 1,
0.1347502, 0.7971547, 1.76411, 0, 0.7137255, 1, 1,
0.1349036, -0.9159353, 4.782204, 0, 0.7058824, 1, 1,
0.1356768, 1.09137, 1.646492, 0, 0.6980392, 1, 1,
0.1391347, 0.6688262, 2.227709, 0, 0.6941177, 1, 1,
0.1419307, 1.643774, 0.169768, 0, 0.6862745, 1, 1,
0.1437496, -0.4916192, 3.87004, 0, 0.682353, 1, 1,
0.1453508, 0.09725804, -0.4127674, 0, 0.6745098, 1, 1,
0.1525377, 1.180084, 0.7710561, 0, 0.6705883, 1, 1,
0.1562339, 1.281724, -1.122154, 0, 0.6627451, 1, 1,
0.1578314, 0.8642621, -0.4391509, 0, 0.6588235, 1, 1,
0.1585414, 0.8488777, -1.080642, 0, 0.6509804, 1, 1,
0.1592524, 0.3269289, 0.3183798, 0, 0.6470588, 1, 1,
0.1602188, -0.5564589, 3.206491, 0, 0.6392157, 1, 1,
0.1608979, 0.158382, 0.7003754, 0, 0.6352941, 1, 1,
0.1609991, -1.572882, 0.8182606, 0, 0.627451, 1, 1,
0.1622211, 1.387245, 1.239039, 0, 0.6235294, 1, 1,
0.1678653, 0.05315732, 3.352901, 0, 0.6156863, 1, 1,
0.1679694, -2.719468, 2.228449, 0, 0.6117647, 1, 1,
0.1698185, -0.3889576, 2.117254, 0, 0.6039216, 1, 1,
0.1710915, -0.6468452, 3.868522, 0, 0.5960785, 1, 1,
0.1712772, -0.1895058, 3.243714, 0, 0.5921569, 1, 1,
0.1823973, 0.09005684, 1.570576, 0, 0.5843138, 1, 1,
0.1837298, 1.216226, -1.256277, 0, 0.5803922, 1, 1,
0.1842129, -1.34665, 1.553011, 0, 0.572549, 1, 1,
0.1887749, 0.477639, -0.7255663, 0, 0.5686275, 1, 1,
0.1941706, 1.56666, 0.7303582, 0, 0.5607843, 1, 1,
0.1946722, -0.5419094, 3.018658, 0, 0.5568628, 1, 1,
0.1948527, -0.007434472, 2.166015, 0, 0.5490196, 1, 1,
0.1966842, 1.237081, 0.2277691, 0, 0.5450981, 1, 1,
0.1976517, 0.128839, 3.001914, 0, 0.5372549, 1, 1,
0.2030839, 0.2755709, 0.1290499, 0, 0.5333334, 1, 1,
0.2035436, -0.2276761, 3.04209, 0, 0.5254902, 1, 1,
0.2046541, 0.1538309, 1.201185, 0, 0.5215687, 1, 1,
0.2057104, -0.0002425672, 0.8479257, 0, 0.5137255, 1, 1,
0.2061932, 1.251513, -0.2306656, 0, 0.509804, 1, 1,
0.206258, -0.0320174, 1.034922, 0, 0.5019608, 1, 1,
0.209516, -0.2088951, 3.107821, 0, 0.4941176, 1, 1,
0.2116976, 0.8996647, 0.2240544, 0, 0.4901961, 1, 1,
0.2132144, 0.1599821, 0.288101, 0, 0.4823529, 1, 1,
0.214269, 0.8730208, 0.6834856, 0, 0.4784314, 1, 1,
0.2195807, 0.2813946, 0.362745, 0, 0.4705882, 1, 1,
0.2207041, -0.5435418, 2.030837, 0, 0.4666667, 1, 1,
0.2211844, 1.238165, -0.05839468, 0, 0.4588235, 1, 1,
0.2220776, -0.3004485, 3.320973, 0, 0.454902, 1, 1,
0.2267521, -0.8326384, 2.018765, 0, 0.4470588, 1, 1,
0.228007, -1.956526, 3.305386, 0, 0.4431373, 1, 1,
0.2284593, -0.4520251, 1.560966, 0, 0.4352941, 1, 1,
0.2298113, 1.044137, -0.4909614, 0, 0.4313726, 1, 1,
0.2298202, 0.487049, -0.5549839, 0, 0.4235294, 1, 1,
0.2335029, -1.605087, 2.107721, 0, 0.4196078, 1, 1,
0.2347801, -0.6614999, 3.286782, 0, 0.4117647, 1, 1,
0.2367867, -0.06891935, 1.96069, 0, 0.4078431, 1, 1,
0.2416535, 0.07040004, 3.299009, 0, 0.4, 1, 1,
0.2424653, 1.162932, 1.732769, 0, 0.3921569, 1, 1,
0.2445102, 0.3564814, 0.7425071, 0, 0.3882353, 1, 1,
0.2449053, -0.2551461, 2.61452, 0, 0.3803922, 1, 1,
0.2585818, 0.03898439, 1.535038, 0, 0.3764706, 1, 1,
0.2630965, -0.6702377, 0.3689621, 0, 0.3686275, 1, 1,
0.270189, -0.7767684, 3.472894, 0, 0.3647059, 1, 1,
0.2704943, -0.04155407, 3.11086, 0, 0.3568628, 1, 1,
0.2706853, -1.125344, 3.785486, 0, 0.3529412, 1, 1,
0.27407, -1.650437, 4.011598, 0, 0.345098, 1, 1,
0.2840389, 1.690349, 0.1275855, 0, 0.3411765, 1, 1,
0.2858847, -0.1672559, 0.8548476, 0, 0.3333333, 1, 1,
0.2905623, -0.09516639, 1.284548, 0, 0.3294118, 1, 1,
0.2909114, -0.5411949, 1.50932, 0, 0.3215686, 1, 1,
0.2913464, 0.3078087, 2.296625, 0, 0.3176471, 1, 1,
0.3003925, 0.4067231, -0.6008054, 0, 0.3098039, 1, 1,
0.3026712, 0.1703701, -0.8846267, 0, 0.3058824, 1, 1,
0.3034297, -0.8447543, 3.842624, 0, 0.2980392, 1, 1,
0.3073715, -1.032381, 3.530153, 0, 0.2901961, 1, 1,
0.3074526, 0.645537, -0.09840923, 0, 0.2862745, 1, 1,
0.3125155, -0.1271926, 0.597702, 0, 0.2784314, 1, 1,
0.3140826, 1.259094, 0.7122564, 0, 0.2745098, 1, 1,
0.3145481, 0.08997354, 2.532634, 0, 0.2666667, 1, 1,
0.3166755, 0.3571481, 0.1541063, 0, 0.2627451, 1, 1,
0.3220773, -1.380436, 1.871163, 0, 0.254902, 1, 1,
0.3221366, 0.1108995, 1.069701, 0, 0.2509804, 1, 1,
0.3235681, -1.417908, 4.147567, 0, 0.2431373, 1, 1,
0.3252994, 0.5204253, -0.5185646, 0, 0.2392157, 1, 1,
0.3264581, 1.764853, -0.5850677, 0, 0.2313726, 1, 1,
0.3294609, 1.148819, -0.9988795, 0, 0.227451, 1, 1,
0.3301911, 0.058506, 0.5816304, 0, 0.2196078, 1, 1,
0.3323335, 1.855875, -1.084044, 0, 0.2156863, 1, 1,
0.3333543, -0.4603973, 2.517123, 0, 0.2078431, 1, 1,
0.3367531, 0.3807573, 0.9446541, 0, 0.2039216, 1, 1,
0.3397058, 0.0861435, 0.3904137, 0, 0.1960784, 1, 1,
0.3406723, -1.926867, 5.158673, 0, 0.1882353, 1, 1,
0.3423961, -0.6976422, 3.080525, 0, 0.1843137, 1, 1,
0.3461665, 0.06983422, 0.4345275, 0, 0.1764706, 1, 1,
0.3467363, -0.6200513, 2.369213, 0, 0.172549, 1, 1,
0.3471856, 1.364777, -0.5462618, 0, 0.1647059, 1, 1,
0.3503387, -0.7887259, 3.43652, 0, 0.1607843, 1, 1,
0.3512953, -0.5746136, 2.714537, 0, 0.1529412, 1, 1,
0.3545572, -1.284755, 3.8233, 0, 0.1490196, 1, 1,
0.3567351, 1.603281, -0.01238197, 0, 0.1411765, 1, 1,
0.3577245, 1.237345, 0.4889402, 0, 0.1372549, 1, 1,
0.3601697, 1.11465, -0.6328712, 0, 0.1294118, 1, 1,
0.3613627, -1.253599, 2.947768, 0, 0.1254902, 1, 1,
0.3631597, -0.5403599, 0.7455663, 0, 0.1176471, 1, 1,
0.3634526, 0.2471683, 3.479573, 0, 0.1137255, 1, 1,
0.3636906, 2.361728, 0.6589518, 0, 0.1058824, 1, 1,
0.3658391, -0.2717789, 2.562354, 0, 0.09803922, 1, 1,
0.3698825, 0.2877716, 0.7293727, 0, 0.09411765, 1, 1,
0.3716199, -2.082235, 3.400818, 0, 0.08627451, 1, 1,
0.3741671, -2.611903, 3.51075, 0, 0.08235294, 1, 1,
0.3751618, 0.4990324, -1.425882, 0, 0.07450981, 1, 1,
0.3767631, -0.9667479, 2.909106, 0, 0.07058824, 1, 1,
0.382286, -0.5587467, 3.392921, 0, 0.0627451, 1, 1,
0.3830391, 1.472875, -1.509148, 0, 0.05882353, 1, 1,
0.3856981, 0.5537463, -0.03890119, 0, 0.05098039, 1, 1,
0.3867935, -0.394503, 2.870702, 0, 0.04705882, 1, 1,
0.3878652, -0.5919726, 2.733227, 0, 0.03921569, 1, 1,
0.387879, 2.132948, 0.2989632, 0, 0.03529412, 1, 1,
0.3915808, 1.000424, 0.3798465, 0, 0.02745098, 1, 1,
0.3920652, 0.4077842, 0.488492, 0, 0.02352941, 1, 1,
0.3991612, 0.4930113, 1.449083, 0, 0.01568628, 1, 1,
0.4012128, 0.3580628, 0.4648313, 0, 0.01176471, 1, 1,
0.4018616, -0.709309, 2.407373, 0, 0.003921569, 1, 1,
0.4035806, 0.7765586, 2.403652, 0.003921569, 0, 1, 1,
0.4117256, -0.7239457, 2.578764, 0.007843138, 0, 1, 1,
0.4209784, -1.353536, 2.439164, 0.01568628, 0, 1, 1,
0.4272369, -1.019974, 4.435685, 0.01960784, 0, 1, 1,
0.4290762, 1.891263, -0.2703459, 0.02745098, 0, 1, 1,
0.4343677, 0.2652494, -0.3678642, 0.03137255, 0, 1, 1,
0.4345434, 0.2670393, 1.354435, 0.03921569, 0, 1, 1,
0.4358034, -0.3288018, 3.129476, 0.04313726, 0, 1, 1,
0.4371283, 1.960044, 0.3263656, 0.05098039, 0, 1, 1,
0.4393269, 1.062786, 0.2610402, 0.05490196, 0, 1, 1,
0.4450077, 0.7074737, 1.276855, 0.0627451, 0, 1, 1,
0.4450952, -1.524868, 2.38771, 0.06666667, 0, 1, 1,
0.4500378, 0.9703525, 0.7307436, 0.07450981, 0, 1, 1,
0.4532601, 0.3009972, 1.278961, 0.07843138, 0, 1, 1,
0.4565206, 0.8470814, 0.4421205, 0.08627451, 0, 1, 1,
0.4567682, -0.1872624, 1.559583, 0.09019608, 0, 1, 1,
0.4649715, 0.7342576, 0.1625555, 0.09803922, 0, 1, 1,
0.4652453, 0.1573952, 3.109997, 0.1058824, 0, 1, 1,
0.4680827, -0.2435931, 0.7216302, 0.1098039, 0, 1, 1,
0.4770334, -1.663757, 2.129287, 0.1176471, 0, 1, 1,
0.4808326, 1.18646, 0.8707992, 0.1215686, 0, 1, 1,
0.4813099, 0.4654228, 1.524076, 0.1294118, 0, 1, 1,
0.4818678, -0.1584215, 1.831403, 0.1333333, 0, 1, 1,
0.50075, 1.616256, 1.854788, 0.1411765, 0, 1, 1,
0.5042276, 0.443593, 0.4837422, 0.145098, 0, 1, 1,
0.5054654, -0.1914314, 2.438342, 0.1529412, 0, 1, 1,
0.5113083, 0.09350833, 0.9669505, 0.1568628, 0, 1, 1,
0.5124398, 1.068649, 0.8951736, 0.1647059, 0, 1, 1,
0.5127491, -1.173892, 3.526598, 0.1686275, 0, 1, 1,
0.5145221, -0.4349933, 0.5541474, 0.1764706, 0, 1, 1,
0.5151638, 0.4686171, 1.669521, 0.1803922, 0, 1, 1,
0.5172506, 0.3274673, -0.1562823, 0.1882353, 0, 1, 1,
0.5223561, -0.07439448, 3.169156, 0.1921569, 0, 1, 1,
0.5227997, -0.5496644, 1.590744, 0.2, 0, 1, 1,
0.52577, -1.296124, 2.643589, 0.2078431, 0, 1, 1,
0.5283848, 0.6282638, 2.09579, 0.2117647, 0, 1, 1,
0.5290647, -0.01158476, 3.346257, 0.2196078, 0, 1, 1,
0.5316243, 0.09543405, 1.301803, 0.2235294, 0, 1, 1,
0.532786, -1.818063, 4.937402, 0.2313726, 0, 1, 1,
0.5330804, 1.694277, 1.597181, 0.2352941, 0, 1, 1,
0.5354529, -0.1462411, 1.77051, 0.2431373, 0, 1, 1,
0.5359861, 0.4169971, 0.2033737, 0.2470588, 0, 1, 1,
0.5447498, -0.6167869, 1.411612, 0.254902, 0, 1, 1,
0.5475797, -0.4777983, 1.692235, 0.2588235, 0, 1, 1,
0.5562878, 0.8255809, 2.281231, 0.2666667, 0, 1, 1,
0.5571675, 0.07751447, 2.343945, 0.2705882, 0, 1, 1,
0.56062, -0.6836956, 2.718759, 0.2784314, 0, 1, 1,
0.5610161, 1.721833, -1.619402, 0.282353, 0, 1, 1,
0.5614429, -0.7052276, 2.562075, 0.2901961, 0, 1, 1,
0.5652212, 0.8252974, 1.218173, 0.2941177, 0, 1, 1,
0.5656585, -0.4501615, 3.566159, 0.3019608, 0, 1, 1,
0.5682465, 0.4805513, 2.137399, 0.3098039, 0, 1, 1,
0.5688743, 1.021369, 1.370222, 0.3137255, 0, 1, 1,
0.5847629, 1.42844, 2.660099, 0.3215686, 0, 1, 1,
0.5907313, 0.8730342, 0.9057283, 0.3254902, 0, 1, 1,
0.5908918, 0.7164136, -0.686751, 0.3333333, 0, 1, 1,
0.594065, 0.9055916, 2.386553, 0.3372549, 0, 1, 1,
0.6016756, -1.347448, 2.346529, 0.345098, 0, 1, 1,
0.6030136, -1.504848, 2.922842, 0.3490196, 0, 1, 1,
0.6124073, 0.4707691, 0.5687139, 0.3568628, 0, 1, 1,
0.6145077, 1.401115, -0.200888, 0.3607843, 0, 1, 1,
0.6173788, -1.211259, 0.3093127, 0.3686275, 0, 1, 1,
0.6182486, -0.2565051, 1.772133, 0.372549, 0, 1, 1,
0.6202921, -1.006325, 3.99962, 0.3803922, 0, 1, 1,
0.6219736, 0.5825076, 1.425755, 0.3843137, 0, 1, 1,
0.6223857, 0.7344521, 1.340701, 0.3921569, 0, 1, 1,
0.6262432, -0.1651086, 0.9934028, 0.3960784, 0, 1, 1,
0.6289951, 0.9894848, 0.5593119, 0.4039216, 0, 1, 1,
0.6299356, 0.09901354, 1.03411, 0.4117647, 0, 1, 1,
0.6360831, -0.7239577, 1.080569, 0.4156863, 0, 1, 1,
0.6437278, 0.846818, -0.5057594, 0.4235294, 0, 1, 1,
0.643832, -1.006777, 3.418042, 0.427451, 0, 1, 1,
0.6438541, -0.1602235, 2.98395, 0.4352941, 0, 1, 1,
0.6443977, 2.720189, 0.1334582, 0.4392157, 0, 1, 1,
0.6460893, -0.7359824, 2.178047, 0.4470588, 0, 1, 1,
0.6489542, 0.9895726, -1.330955, 0.4509804, 0, 1, 1,
0.6530141, 0.9571415, 0.7773861, 0.4588235, 0, 1, 1,
0.6547992, -1.120804, 1.840514, 0.4627451, 0, 1, 1,
0.6563128, -0.4272486, -0.1252593, 0.4705882, 0, 1, 1,
0.656426, 0.1499304, 1.846992, 0.4745098, 0, 1, 1,
0.6574379, 0.6973793, 1.832578, 0.4823529, 0, 1, 1,
0.6600356, -0.7025474, 3.849765, 0.4862745, 0, 1, 1,
0.660298, 0.3895462, 2.03396, 0.4941176, 0, 1, 1,
0.6646492, 0.6340079, 0.6419632, 0.5019608, 0, 1, 1,
0.667592, -0.1362472, 1.462304, 0.5058824, 0, 1, 1,
0.6728897, 0.2895472, 1.028375, 0.5137255, 0, 1, 1,
0.6740516, 0.1596491, 1.651843, 0.5176471, 0, 1, 1,
0.6829382, -1.143951, 3.184994, 0.5254902, 0, 1, 1,
0.6852264, -0.2617883, 1.947323, 0.5294118, 0, 1, 1,
0.6885946, 1.364817, 2.387666, 0.5372549, 0, 1, 1,
0.6893008, 0.2331425, 1.795748, 0.5411765, 0, 1, 1,
0.6979426, 0.4476036, 2.040025, 0.5490196, 0, 1, 1,
0.7027255, -0.4032432, -0.07138395, 0.5529412, 0, 1, 1,
0.7032787, -1.88205, 3.154835, 0.5607843, 0, 1, 1,
0.7034453, 0.4335441, -0.1623139, 0.5647059, 0, 1, 1,
0.7084315, -0.3539588, 1.103409, 0.572549, 0, 1, 1,
0.7095451, 0.1592884, 0.5345706, 0.5764706, 0, 1, 1,
0.7111923, -2.646822, 2.537669, 0.5843138, 0, 1, 1,
0.7132449, -1.0904, 1.725885, 0.5882353, 0, 1, 1,
0.7151669, -0.3212191, 4.723038, 0.5960785, 0, 1, 1,
0.7204171, -0.02145205, 1.963614, 0.6039216, 0, 1, 1,
0.7260075, 0.5901124, 2.519531, 0.6078432, 0, 1, 1,
0.7291861, 0.7796971, 1.537313, 0.6156863, 0, 1, 1,
0.7298042, -0.438237, 2.685125, 0.6196079, 0, 1, 1,
0.7375739, 0.8706123, -0.2644678, 0.627451, 0, 1, 1,
0.7434668, 1.053557, 0.686877, 0.6313726, 0, 1, 1,
0.7438141, 1.012855, -1.091619, 0.6392157, 0, 1, 1,
0.7461697, 0.09227409, 0.7031879, 0.6431373, 0, 1, 1,
0.7500893, 1.503708, 0.6113154, 0.6509804, 0, 1, 1,
0.7522168, -0.5357103, 2.130297, 0.654902, 0, 1, 1,
0.7620746, 0.8140349, 1.216587, 0.6627451, 0, 1, 1,
0.7634462, -0.2515284, 0.5886602, 0.6666667, 0, 1, 1,
0.7644722, -0.1209202, 0.3786454, 0.6745098, 0, 1, 1,
0.7649118, -1.391432, 2.365721, 0.6784314, 0, 1, 1,
0.7731274, 0.2702972, 2.541156, 0.6862745, 0, 1, 1,
0.7843772, -1.181238, 1.10232, 0.6901961, 0, 1, 1,
0.7847258, -1.468384, 3.578216, 0.6980392, 0, 1, 1,
0.7851425, -1.932035, 2.868455, 0.7058824, 0, 1, 1,
0.7857233, -1.334365, 2.513441, 0.7098039, 0, 1, 1,
0.7859367, 1.528903, 0.7772652, 0.7176471, 0, 1, 1,
0.7909671, 1.008158, -0.8667, 0.7215686, 0, 1, 1,
0.7935402, 1.971084, -0.9972016, 0.7294118, 0, 1, 1,
0.8000969, 2.21785, -0.04861079, 0.7333333, 0, 1, 1,
0.8038049, -1.043341, 3.781241, 0.7411765, 0, 1, 1,
0.8080934, -0.0231058, -0.5230815, 0.7450981, 0, 1, 1,
0.8082152, -1.291656, 1.808402, 0.7529412, 0, 1, 1,
0.8094174, 0.3560432, 1.047229, 0.7568628, 0, 1, 1,
0.8246373, -1.075947, 4.421893, 0.7647059, 0, 1, 1,
0.8246474, 0.5005645, 0.681189, 0.7686275, 0, 1, 1,
0.8273768, 0.7442544, 2.125673, 0.7764706, 0, 1, 1,
0.8284252, -0.5969077, 2.608795, 0.7803922, 0, 1, 1,
0.831744, 0.9231128, 2.937153, 0.7882353, 0, 1, 1,
0.839434, -1.633417, 2.380317, 0.7921569, 0, 1, 1,
0.8521592, -0.06740969, 1.792138, 0.8, 0, 1, 1,
0.8592205, 1.345827, -0.09341241, 0.8078431, 0, 1, 1,
0.8618593, -0.2845747, 3.16133, 0.8117647, 0, 1, 1,
0.8665623, 0.5855088, 1.287958, 0.8196079, 0, 1, 1,
0.8760335, 0.3422568, -0.7273835, 0.8235294, 0, 1, 1,
0.8768284, -1.43317, 4.080202, 0.8313726, 0, 1, 1,
0.8774939, -1.617201, 2.701708, 0.8352941, 0, 1, 1,
0.8810437, -0.6780713, 0.815743, 0.8431373, 0, 1, 1,
0.883909, 1.051493, -0.4100065, 0.8470588, 0, 1, 1,
0.8871379, 1.501917, 0.6739015, 0.854902, 0, 1, 1,
0.8929033, -0.4193636, 0.9323046, 0.8588235, 0, 1, 1,
0.8942833, -0.4336638, 2.079391, 0.8666667, 0, 1, 1,
0.8959179, -1.295495, 0.253948, 0.8705882, 0, 1, 1,
0.8997663, 0.03777405, 1.304101, 0.8784314, 0, 1, 1,
0.9032268, -0.5349544, 3.050985, 0.8823529, 0, 1, 1,
0.9052562, -0.9176642, 2.177758, 0.8901961, 0, 1, 1,
0.9059293, -1.36405, 1.721556, 0.8941177, 0, 1, 1,
0.9137661, -1.47805, 4.136653, 0.9019608, 0, 1, 1,
0.9143405, -2.03179, 0.8479293, 0.9098039, 0, 1, 1,
0.9154503, 0.5840296, -0.8394861, 0.9137255, 0, 1, 1,
0.9252312, -0.3937657, 2.116729, 0.9215686, 0, 1, 1,
0.9275747, -0.9324303, 2.24555, 0.9254902, 0, 1, 1,
0.9280772, 0.4366634, 2.49526, 0.9333333, 0, 1, 1,
0.9307464, 0.1065116, 1.90751, 0.9372549, 0, 1, 1,
0.9310094, 2.401926, 0.8889922, 0.945098, 0, 1, 1,
0.9312663, 0.4769543, 0.6761767, 0.9490196, 0, 1, 1,
0.9342795, 0.1968725, 2.406829, 0.9568627, 0, 1, 1,
0.9360186, -1.159859, 2.025554, 0.9607843, 0, 1, 1,
0.9380249, -0.6726785, 1.722862, 0.9686275, 0, 1, 1,
0.9391949, -1.120507, 3.493559, 0.972549, 0, 1, 1,
0.9402365, -1.187568, 3.284929, 0.9803922, 0, 1, 1,
0.940553, -0.3081555, 0.5422629, 0.9843137, 0, 1, 1,
0.9414896, 0.4320855, -0.4952811, 0.9921569, 0, 1, 1,
0.9426864, 1.693201, -0.2095619, 0.9960784, 0, 1, 1,
0.9519915, 0.5369675, 0.8089129, 1, 0, 0.9960784, 1,
0.9523584, -0.7457403, 1.002947, 1, 0, 0.9882353, 1,
0.9697665, -0.4505881, 3.546114, 1, 0, 0.9843137, 1,
0.9700464, 0.4900325, 1.151494, 1, 0, 0.9764706, 1,
0.9741246, -0.3269418, 1.821498, 1, 0, 0.972549, 1,
0.9765692, 0.06698363, 1.418382, 1, 0, 0.9647059, 1,
0.9777454, 1.716638, 0.1957129, 1, 0, 0.9607843, 1,
0.9842119, 0.4668288, 2.188717, 1, 0, 0.9529412, 1,
0.9855315, 2.817141, -0.3017347, 1, 0, 0.9490196, 1,
0.9882058, -0.2100497, 2.563598, 1, 0, 0.9411765, 1,
0.9891285, -2.192217, 2.309364, 1, 0, 0.9372549, 1,
0.9917333, 0.479931, 0.1396285, 1, 0, 0.9294118, 1,
0.9946268, 0.06167621, 0.9078949, 1, 0, 0.9254902, 1,
0.9955762, 1.700831, 1.106001, 1, 0, 0.9176471, 1,
0.9972084, 0.8922028, 0.8128376, 1, 0, 0.9137255, 1,
1.000761, 0.2716749, 0.6568376, 1, 0, 0.9058824, 1,
1.001859, -0.08834642, 3.428401, 1, 0, 0.9019608, 1,
1.005397, 1.327696, -0.5862712, 1, 0, 0.8941177, 1,
1.011242, -1.627309, 3.272041, 1, 0, 0.8862745, 1,
1.016448, 0.151143, 2.226822, 1, 0, 0.8823529, 1,
1.019391, -0.02898688, 1.316696, 1, 0, 0.8745098, 1,
1.039091, 0.4066556, 2.241669, 1, 0, 0.8705882, 1,
1.059157, -1.284735, 1.027069, 1, 0, 0.8627451, 1,
1.060253, 1.69263, 1.059258, 1, 0, 0.8588235, 1,
1.064652, -0.9737447, 1.965979, 1, 0, 0.8509804, 1,
1.066667, -1.095999, 2.176917, 1, 0, 0.8470588, 1,
1.068699, 0.8081849, 0.3240306, 1, 0, 0.8392157, 1,
1.070896, -0.9250859, 0.4319217, 1, 0, 0.8352941, 1,
1.073792, -0.3711687, 1.455566, 1, 0, 0.827451, 1,
1.075342, 0.7012546, 0.901426, 1, 0, 0.8235294, 1,
1.078724, 1.517192, 1.420442, 1, 0, 0.8156863, 1,
1.079146, -1.557421, 2.421592, 1, 0, 0.8117647, 1,
1.09075, 0.6082495, 0.4348639, 1, 0, 0.8039216, 1,
1.098848, -0.6273208, 2.45263, 1, 0, 0.7960784, 1,
1.108249, 0.9278959, 1.681845, 1, 0, 0.7921569, 1,
1.121549, -1.245068, 3.435563, 1, 0, 0.7843137, 1,
1.122515, 1.73407, 0.1042376, 1, 0, 0.7803922, 1,
1.134574, 0.7627424, 3.27263, 1, 0, 0.772549, 1,
1.143495, 1.315496, 0.9537718, 1, 0, 0.7686275, 1,
1.146498, -0.3176679, 2.201404, 1, 0, 0.7607843, 1,
1.150546, -0.2333648, 3.593215, 1, 0, 0.7568628, 1,
1.158917, -0.384718, 2.01165, 1, 0, 0.7490196, 1,
1.159436, 0.5444608, 2.088284, 1, 0, 0.7450981, 1,
1.16259, -0.4984222, 1.123951, 1, 0, 0.7372549, 1,
1.166261, -1.33597, 2.273907, 1, 0, 0.7333333, 1,
1.172826, 0.9568743, 1.008857, 1, 0, 0.7254902, 1,
1.176713, -0.8046215, 1.683626, 1, 0, 0.7215686, 1,
1.179427, 0.04849765, 0.2664194, 1, 0, 0.7137255, 1,
1.181951, 0.1383703, 2.87648, 1, 0, 0.7098039, 1,
1.183784, -1.138995, 3.342042, 1, 0, 0.7019608, 1,
1.186341, -1.027827, 0.6520831, 1, 0, 0.6941177, 1,
1.189271, -0.435019, -0.2290076, 1, 0, 0.6901961, 1,
1.191747, 0.1496052, 1.476169, 1, 0, 0.682353, 1,
1.192584, -1.02915, 0.9174342, 1, 0, 0.6784314, 1,
1.195004, 0.4999867, 1.010483, 1, 0, 0.6705883, 1,
1.200545, 0.3995833, -0.05761279, 1, 0, 0.6666667, 1,
1.204614, 1.194753, -0.1564803, 1, 0, 0.6588235, 1,
1.215942, -0.5992154, 2.183346, 1, 0, 0.654902, 1,
1.216263, -0.1416389, 2.371586, 1, 0, 0.6470588, 1,
1.216531, -0.3278835, 1.613438, 1, 0, 0.6431373, 1,
1.217778, 0.3949408, 1.078884, 1, 0, 0.6352941, 1,
1.219417, 0.08681045, 1.724112, 1, 0, 0.6313726, 1,
1.220015, -0.2082906, 0.5737839, 1, 0, 0.6235294, 1,
1.220495, -1.203474, 1.104501, 1, 0, 0.6196079, 1,
1.228956, 0.9463947, 0.683139, 1, 0, 0.6117647, 1,
1.239426, -1.689236, 3.718818, 1, 0, 0.6078432, 1,
1.241567, -0.2589065, 0.66677, 1, 0, 0.6, 1,
1.257093, 1.065944, -0.8271003, 1, 0, 0.5921569, 1,
1.267154, 0.2435353, 2.7119, 1, 0, 0.5882353, 1,
1.279644, -1.024277, 3.042794, 1, 0, 0.5803922, 1,
1.286397, 1.821665, -0.4671513, 1, 0, 0.5764706, 1,
1.286874, 0.4012319, 1.399458, 1, 0, 0.5686275, 1,
1.290679, 0.5615011, 1.72644, 1, 0, 0.5647059, 1,
1.29294, -1.006356, 2.15721, 1, 0, 0.5568628, 1,
1.295437, 1.649571, 0.2771701, 1, 0, 0.5529412, 1,
1.312744, -0.3530953, 1.005819, 1, 0, 0.5450981, 1,
1.31304, -0.01142645, 2.858449, 1, 0, 0.5411765, 1,
1.322812, -1.817813, 2.142555, 1, 0, 0.5333334, 1,
1.325458, 1.743714, -0.2361101, 1, 0, 0.5294118, 1,
1.326495, -1.44715, 3.369043, 1, 0, 0.5215687, 1,
1.339564, 0.0550673, 1.919199, 1, 0, 0.5176471, 1,
1.339736, -0.5290143, 2.402611, 1, 0, 0.509804, 1,
1.355953, -1.299118, 3.754992, 1, 0, 0.5058824, 1,
1.356492, 1.115413, 0.191025, 1, 0, 0.4980392, 1,
1.368786, 0.7934144, 1.244895, 1, 0, 0.4901961, 1,
1.372652, -2.033892, 2.674285, 1, 0, 0.4862745, 1,
1.375223, 0.06242856, 0.8716696, 1, 0, 0.4784314, 1,
1.38234, -0.7204122, 2.235709, 1, 0, 0.4745098, 1,
1.391893, 0.4544125, 2.449186, 1, 0, 0.4666667, 1,
1.401144, 1.246132, 1.529726, 1, 0, 0.4627451, 1,
1.404017, 2.281158, -0.8376243, 1, 0, 0.454902, 1,
1.404176, -0.1414863, 1.112266, 1, 0, 0.4509804, 1,
1.408242, 1.066808, 0.8262038, 1, 0, 0.4431373, 1,
1.418776, -1.775627, 2.280397, 1, 0, 0.4392157, 1,
1.437674, -0.8558412, 2.54826, 1, 0, 0.4313726, 1,
1.440639, -1.27651, 1.188352, 1, 0, 0.427451, 1,
1.445273, 0.05401447, 1.839105, 1, 0, 0.4196078, 1,
1.44533, 0.5582548, 1.058948, 1, 0, 0.4156863, 1,
1.447381, -0.8514072, 2.735856, 1, 0, 0.4078431, 1,
1.453477, 0.9766643, 1.245088, 1, 0, 0.4039216, 1,
1.461909, 0.07907523, 2.111888, 1, 0, 0.3960784, 1,
1.46271, 0.7277289, 1.031128, 1, 0, 0.3882353, 1,
1.464305, 0.4992387, 0.4592639, 1, 0, 0.3843137, 1,
1.4647, 1.092241, 0.800512, 1, 0, 0.3764706, 1,
1.475815, -0.7763138, 2.991575, 1, 0, 0.372549, 1,
1.488661, 0.4643343, -0.0006588067, 1, 0, 0.3647059, 1,
1.489564, -0.7146974, 0.732868, 1, 0, 0.3607843, 1,
1.491801, -0.6736243, 0.768838, 1, 0, 0.3529412, 1,
1.497985, -0.3855252, -0.7801273, 1, 0, 0.3490196, 1,
1.500652, 0.5822791, 1.118099, 1, 0, 0.3411765, 1,
1.50702, -1.510436, 2.102167, 1, 0, 0.3372549, 1,
1.515834, 1.554506, 0.352361, 1, 0, 0.3294118, 1,
1.51765, -0.5415367, 4.275167, 1, 0, 0.3254902, 1,
1.5393, 0.1584206, 0.1372124, 1, 0, 0.3176471, 1,
1.542889, -1.890199, 2.443475, 1, 0, 0.3137255, 1,
1.553021, 0.0880017, 1.566836, 1, 0, 0.3058824, 1,
1.553554, -1.637663, 3.031207, 1, 0, 0.2980392, 1,
1.569047, 0.1917619, 0.469364, 1, 0, 0.2941177, 1,
1.575226, -0.6074341, 1.617385, 1, 0, 0.2862745, 1,
1.598407, 0.221934, 0.5527942, 1, 0, 0.282353, 1,
1.61364, -0.1048793, 1.836607, 1, 0, 0.2745098, 1,
1.629352, -0.2112695, 1.900962, 1, 0, 0.2705882, 1,
1.629534, -0.009892012, 2.599713, 1, 0, 0.2627451, 1,
1.634719, -0.6214486, 3.665584, 1, 0, 0.2588235, 1,
1.647493, -1.032577, 2.730781, 1, 0, 0.2509804, 1,
1.656255, -0.3981955, 1.750588, 1, 0, 0.2470588, 1,
1.656653, -0.6513013, 0.7041567, 1, 0, 0.2392157, 1,
1.662752, 0.9951822, 0.01211907, 1, 0, 0.2352941, 1,
1.704919, 1.29607, 0.6955814, 1, 0, 0.227451, 1,
1.709032, -1.321556, 4.274819, 1, 0, 0.2235294, 1,
1.730412, 1.606278, 1.115328, 1, 0, 0.2156863, 1,
1.747963, 0.5905415, 0.7563362, 1, 0, 0.2117647, 1,
1.769494, -0.2133044, 1.817292, 1, 0, 0.2039216, 1,
1.816165, 1.285236, 2.072747, 1, 0, 0.1960784, 1,
1.82842, -1.127123, 2.579815, 1, 0, 0.1921569, 1,
1.830449, -0.5601988, 1.358993, 1, 0, 0.1843137, 1,
1.839736, 1.244246, -0.09476882, 1, 0, 0.1803922, 1,
1.87755, -0.06380003, 0.4363079, 1, 0, 0.172549, 1,
1.889177, -0.7089673, 1.394054, 1, 0, 0.1686275, 1,
1.977092, 2.124748, 0.08778132, 1, 0, 0.1607843, 1,
1.988889, -0.7256991, 3.535218, 1, 0, 0.1568628, 1,
1.991551, 0.04111962, 1.710396, 1, 0, 0.1490196, 1,
1.994933, -1.274345, 0.9575272, 1, 0, 0.145098, 1,
2.005821, 0.6001509, 2.578814, 1, 0, 0.1372549, 1,
2.009174, -0.49903, 3.191805, 1, 0, 0.1333333, 1,
2.037242, -1.22363, 1.465351, 1, 0, 0.1254902, 1,
2.054237, -0.314517, 1.119094, 1, 0, 0.1215686, 1,
2.077424, -0.008118686, 2.180606, 1, 0, 0.1137255, 1,
2.099739, -0.2393853, 1.168286, 1, 0, 0.1098039, 1,
2.108276, 1.614426, 0.6923991, 1, 0, 0.1019608, 1,
2.109061, 0.4794984, 0.6212927, 1, 0, 0.09411765, 1,
2.119768, 0.3185852, 2.234327, 1, 0, 0.09019608, 1,
2.140686, -0.7412001, 2.026588, 1, 0, 0.08235294, 1,
2.15519, 0.2426693, 1.768808, 1, 0, 0.07843138, 1,
2.165979, 0.6047222, 0.8796165, 1, 0, 0.07058824, 1,
2.19608, 0.6233792, 0.0653271, 1, 0, 0.06666667, 1,
2.205551, -0.9067486, 2.27903, 1, 0, 0.05882353, 1,
2.265965, 1.303032, 1.204297, 1, 0, 0.05490196, 1,
2.274971, -1.392308, 2.867036, 1, 0, 0.04705882, 1,
2.281125, 2.716665, 1.444896, 1, 0, 0.04313726, 1,
2.296729, -0.7889876, 1.054682, 1, 0, 0.03529412, 1,
2.318543, -1.699936, 4.900079, 1, 0, 0.03137255, 1,
2.327053, -0.4106206, 1.868572, 1, 0, 0.02352941, 1,
2.439909, -1.567543, 1.113308, 1, 0, 0.01960784, 1,
2.480605, 0.3881213, 2.186599, 1, 0, 0.01176471, 1,
3.244093, 1.28684, 1.09124, 1, 0, 0.007843138, 1
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
0.1112238, -4.738437, -6.925024, 0, -0.5, 0.5, 0.5,
0.1112238, -4.738437, -6.925024, 1, -0.5, 0.5, 0.5,
0.1112238, -4.738437, -6.925024, 1, 1.5, 0.5, 0.5,
0.1112238, -4.738437, -6.925024, 0, 1.5, 0.5, 0.5
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
-4.083688, -0.19029, -6.925024, 0, -0.5, 0.5, 0.5,
-4.083688, -0.19029, -6.925024, 1, -0.5, 0.5, 0.5,
-4.083688, -0.19029, -6.925024, 1, 1.5, 0.5, 0.5,
-4.083688, -0.19029, -6.925024, 0, 1.5, 0.5, 0.5
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
-4.083688, -4.738437, 0.3276477, 0, -0.5, 0.5, 0.5,
-4.083688, -4.738437, 0.3276477, 1, -0.5, 0.5, 0.5,
-4.083688, -4.738437, 0.3276477, 1, 1.5, 0.5, 0.5,
-4.083688, -4.738437, 0.3276477, 0, 1.5, 0.5, 0.5
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
-3, -3.688865, -5.251331,
3, -3.688865, -5.251331,
-3, -3.688865, -5.251331,
-3, -3.863794, -5.53028,
-2, -3.688865, -5.251331,
-2, -3.863794, -5.53028,
-1, -3.688865, -5.251331,
-1, -3.863794, -5.53028,
0, -3.688865, -5.251331,
0, -3.863794, -5.53028,
1, -3.688865, -5.251331,
1, -3.863794, -5.53028,
2, -3.688865, -5.251331,
2, -3.863794, -5.53028,
3, -3.688865, -5.251331,
3, -3.863794, -5.53028
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
-3, -4.213651, -6.088178, 0, -0.5, 0.5, 0.5,
-3, -4.213651, -6.088178, 1, -0.5, 0.5, 0.5,
-3, -4.213651, -6.088178, 1, 1.5, 0.5, 0.5,
-3, -4.213651, -6.088178, 0, 1.5, 0.5, 0.5,
-2, -4.213651, -6.088178, 0, -0.5, 0.5, 0.5,
-2, -4.213651, -6.088178, 1, -0.5, 0.5, 0.5,
-2, -4.213651, -6.088178, 1, 1.5, 0.5, 0.5,
-2, -4.213651, -6.088178, 0, 1.5, 0.5, 0.5,
-1, -4.213651, -6.088178, 0, -0.5, 0.5, 0.5,
-1, -4.213651, -6.088178, 1, -0.5, 0.5, 0.5,
-1, -4.213651, -6.088178, 1, 1.5, 0.5, 0.5,
-1, -4.213651, -6.088178, 0, 1.5, 0.5, 0.5,
0, -4.213651, -6.088178, 0, -0.5, 0.5, 0.5,
0, -4.213651, -6.088178, 1, -0.5, 0.5, 0.5,
0, -4.213651, -6.088178, 1, 1.5, 0.5, 0.5,
0, -4.213651, -6.088178, 0, 1.5, 0.5, 0.5,
1, -4.213651, -6.088178, 0, -0.5, 0.5, 0.5,
1, -4.213651, -6.088178, 1, -0.5, 0.5, 0.5,
1, -4.213651, -6.088178, 1, 1.5, 0.5, 0.5,
1, -4.213651, -6.088178, 0, 1.5, 0.5, 0.5,
2, -4.213651, -6.088178, 0, -0.5, 0.5, 0.5,
2, -4.213651, -6.088178, 1, -0.5, 0.5, 0.5,
2, -4.213651, -6.088178, 1, 1.5, 0.5, 0.5,
2, -4.213651, -6.088178, 0, 1.5, 0.5, 0.5,
3, -4.213651, -6.088178, 0, -0.5, 0.5, 0.5,
3, -4.213651, -6.088178, 1, -0.5, 0.5, 0.5,
3, -4.213651, -6.088178, 1, 1.5, 0.5, 0.5,
3, -4.213651, -6.088178, 0, 1.5, 0.5, 0.5
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
-3.115632, -3, -5.251331,
-3.115632, 3, -5.251331,
-3.115632, -3, -5.251331,
-3.276974, -3, -5.53028,
-3.115632, -2, -5.251331,
-3.276974, -2, -5.53028,
-3.115632, -1, -5.251331,
-3.276974, -1, -5.53028,
-3.115632, 0, -5.251331,
-3.276974, 0, -5.53028,
-3.115632, 1, -5.251331,
-3.276974, 1, -5.53028,
-3.115632, 2, -5.251331,
-3.276974, 2, -5.53028,
-3.115632, 3, -5.251331,
-3.276974, 3, -5.53028
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
-3.59966, -3, -6.088178, 0, -0.5, 0.5, 0.5,
-3.59966, -3, -6.088178, 1, -0.5, 0.5, 0.5,
-3.59966, -3, -6.088178, 1, 1.5, 0.5, 0.5,
-3.59966, -3, -6.088178, 0, 1.5, 0.5, 0.5,
-3.59966, -2, -6.088178, 0, -0.5, 0.5, 0.5,
-3.59966, -2, -6.088178, 1, -0.5, 0.5, 0.5,
-3.59966, -2, -6.088178, 1, 1.5, 0.5, 0.5,
-3.59966, -2, -6.088178, 0, 1.5, 0.5, 0.5,
-3.59966, -1, -6.088178, 0, -0.5, 0.5, 0.5,
-3.59966, -1, -6.088178, 1, -0.5, 0.5, 0.5,
-3.59966, -1, -6.088178, 1, 1.5, 0.5, 0.5,
-3.59966, -1, -6.088178, 0, 1.5, 0.5, 0.5,
-3.59966, 0, -6.088178, 0, -0.5, 0.5, 0.5,
-3.59966, 0, -6.088178, 1, -0.5, 0.5, 0.5,
-3.59966, 0, -6.088178, 1, 1.5, 0.5, 0.5,
-3.59966, 0, -6.088178, 0, 1.5, 0.5, 0.5,
-3.59966, 1, -6.088178, 0, -0.5, 0.5, 0.5,
-3.59966, 1, -6.088178, 1, -0.5, 0.5, 0.5,
-3.59966, 1, -6.088178, 1, 1.5, 0.5, 0.5,
-3.59966, 1, -6.088178, 0, 1.5, 0.5, 0.5,
-3.59966, 2, -6.088178, 0, -0.5, 0.5, 0.5,
-3.59966, 2, -6.088178, 1, -0.5, 0.5, 0.5,
-3.59966, 2, -6.088178, 1, 1.5, 0.5, 0.5,
-3.59966, 2, -6.088178, 0, 1.5, 0.5, 0.5,
-3.59966, 3, -6.088178, 0, -0.5, 0.5, 0.5,
-3.59966, 3, -6.088178, 1, -0.5, 0.5, 0.5,
-3.59966, 3, -6.088178, 1, 1.5, 0.5, 0.5,
-3.59966, 3, -6.088178, 0, 1.5, 0.5, 0.5
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
-3.115632, -3.688865, -4,
-3.115632, -3.688865, 4,
-3.115632, -3.688865, -4,
-3.276974, -3.863794, -4,
-3.115632, -3.688865, -2,
-3.276974, -3.863794, -2,
-3.115632, -3.688865, 0,
-3.276974, -3.863794, 0,
-3.115632, -3.688865, 2,
-3.276974, -3.863794, 2,
-3.115632, -3.688865, 4,
-3.276974, -3.863794, 4
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
-3.59966, -4.213651, -4, 0, -0.5, 0.5, 0.5,
-3.59966, -4.213651, -4, 1, -0.5, 0.5, 0.5,
-3.59966, -4.213651, -4, 1, 1.5, 0.5, 0.5,
-3.59966, -4.213651, -4, 0, 1.5, 0.5, 0.5,
-3.59966, -4.213651, -2, 0, -0.5, 0.5, 0.5,
-3.59966, -4.213651, -2, 1, -0.5, 0.5, 0.5,
-3.59966, -4.213651, -2, 1, 1.5, 0.5, 0.5,
-3.59966, -4.213651, -2, 0, 1.5, 0.5, 0.5,
-3.59966, -4.213651, 0, 0, -0.5, 0.5, 0.5,
-3.59966, -4.213651, 0, 1, -0.5, 0.5, 0.5,
-3.59966, -4.213651, 0, 1, 1.5, 0.5, 0.5,
-3.59966, -4.213651, 0, 0, 1.5, 0.5, 0.5,
-3.59966, -4.213651, 2, 0, -0.5, 0.5, 0.5,
-3.59966, -4.213651, 2, 1, -0.5, 0.5, 0.5,
-3.59966, -4.213651, 2, 1, 1.5, 0.5, 0.5,
-3.59966, -4.213651, 2, 0, 1.5, 0.5, 0.5,
-3.59966, -4.213651, 4, 0, -0.5, 0.5, 0.5,
-3.59966, -4.213651, 4, 1, -0.5, 0.5, 0.5,
-3.59966, -4.213651, 4, 1, 1.5, 0.5, 0.5,
-3.59966, -4.213651, 4, 0, 1.5, 0.5, 0.5
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
-3.115632, -3.688865, -5.251331,
-3.115632, 3.308285, -5.251331,
-3.115632, -3.688865, 5.906626,
-3.115632, 3.308285, 5.906626,
-3.115632, -3.688865, -5.251331,
-3.115632, -3.688865, 5.906626,
-3.115632, 3.308285, -5.251331,
-3.115632, 3.308285, 5.906626,
-3.115632, -3.688865, -5.251331,
3.338079, -3.688865, -5.251331,
-3.115632, -3.688865, 5.906626,
3.338079, -3.688865, 5.906626,
-3.115632, 3.308285, -5.251331,
3.338079, 3.308285, -5.251331,
-3.115632, 3.308285, 5.906626,
3.338079, 3.308285, 5.906626,
3.338079, -3.688865, -5.251331,
3.338079, 3.308285, -5.251331,
3.338079, -3.688865, 5.906626,
3.338079, 3.308285, 5.906626,
3.338079, -3.688865, -5.251331,
3.338079, -3.688865, 5.906626,
3.338079, 3.308285, -5.251331,
3.338079, 3.308285, 5.906626
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
var radius = 7.831704;
var distance = 34.84414;
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
mvMatrix.translate( -0.1112238, 0.19029, -0.3276477 );
mvMatrix.scale( 1.312081, 1.210177, 0.7589017 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.84414);
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
sodium_3-acetyl-6-me<-read.table("sodium_3-acetyl-6-me.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sodium_3-acetyl-6-me$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_3' not found
```

```r
y<-sodium_3-acetyl-6-me$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_3' not found
```

```r
z<-sodium_3-acetyl-6-me$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_3' not found
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
-3.021646, -1.595979, -1.17486, 0, 0, 1, 1, 1,
-2.811056, -1.597648, -1.960241, 1, 0, 0, 1, 1,
-2.793974, -0.1132639, -0.8839612, 1, 0, 0, 1, 1,
-2.758487, -0.1668959, -0.02583919, 1, 0, 0, 1, 1,
-2.757384, -1.092295, -1.393443, 1, 0, 0, 1, 1,
-2.506087, 1.233661, -1.089107, 1, 0, 0, 1, 1,
-2.482693, 0.5996009, -0.6979269, 0, 0, 0, 1, 1,
-2.393184, -0.1966843, -2.569153, 0, 0, 0, 1, 1,
-2.362017, -0.7305117, -2.834854, 0, 0, 0, 1, 1,
-2.32401, 1.332403, -1.852829, 0, 0, 0, 1, 1,
-2.275591, 1.04272, -0.7746927, 0, 0, 0, 1, 1,
-2.206008, 0.3830759, -1.618615, 0, 0, 0, 1, 1,
-2.181562, 0.2453498, -1.936628, 0, 0, 0, 1, 1,
-2.170264, -0.3511439, -1.771187, 1, 1, 1, 1, 1,
-2.145499, 0.394482, -2.493459, 1, 1, 1, 1, 1,
-2.1435, -1.081897, -2.489899, 1, 1, 1, 1, 1,
-2.119145, -0.5191569, -3.556567, 1, 1, 1, 1, 1,
-2.097966, -0.7525636, -3.454653, 1, 1, 1, 1, 1,
-2.085793, 0.1105288, -1.855965, 1, 1, 1, 1, 1,
-2.072648, 0.004755769, -0.1793061, 1, 1, 1, 1, 1,
-2.06295, 1.808108, 0.8221354, 1, 1, 1, 1, 1,
-2.031437, 0.1167087, -3.170506, 1, 1, 1, 1, 1,
-1.965009, -0.09573592, -0.7302981, 1, 1, 1, 1, 1,
-1.943736, -0.09908442, -3.141294, 1, 1, 1, 1, 1,
-1.902662, -0.7598821, -3.260104, 1, 1, 1, 1, 1,
-1.887262, 0.8776432, -0.1194206, 1, 1, 1, 1, 1,
-1.815927, 0.9993305, -0.6943377, 1, 1, 1, 1, 1,
-1.78367, -0.8359686, -2.304143, 1, 1, 1, 1, 1,
-1.767922, -0.7308763, -2.662751, 0, 0, 1, 1, 1,
-1.738441, -0.420195, -1.842889, 1, 0, 0, 1, 1,
-1.726462, 0.826572, -0.3288784, 1, 0, 0, 1, 1,
-1.723219, -1.328909, -2.52637, 1, 0, 0, 1, 1,
-1.721475, -0.5432475, -2.320734, 1, 0, 0, 1, 1,
-1.716741, -0.7307708, -1.250081, 1, 0, 0, 1, 1,
-1.700861, 1.623224, -2.460414, 0, 0, 0, 1, 1,
-1.68715, 0.8237919, -1.203283, 0, 0, 0, 1, 1,
-1.686011, -0.2823444, -0.7361188, 0, 0, 0, 1, 1,
-1.665955, 1.876559, -0.08391201, 0, 0, 0, 1, 1,
-1.645155, 0.3459264, -3.093154, 0, 0, 0, 1, 1,
-1.642804, 0.9704285, -0.1555006, 0, 0, 0, 1, 1,
-1.626373, 0.04685939, -3.098816, 0, 0, 0, 1, 1,
-1.617137, 0.2720652, -0.5760249, 1, 1, 1, 1, 1,
-1.616816, 0.4433565, -0.5534754, 1, 1, 1, 1, 1,
-1.611695, 0.2436817, -3.600165, 1, 1, 1, 1, 1,
-1.605792, 0.4863362, -0.9865146, 1, 1, 1, 1, 1,
-1.592874, -1.673455, -2.768507, 1, 1, 1, 1, 1,
-1.584432, 1.44616, -0.9657552, 1, 1, 1, 1, 1,
-1.57235, -0.2916319, -2.952552, 1, 1, 1, 1, 1,
-1.557775, -1.218422, -2.047047, 1, 1, 1, 1, 1,
-1.546886, -1.508049, -2.947214, 1, 1, 1, 1, 1,
-1.526217, -1.108602, -2.617072, 1, 1, 1, 1, 1,
-1.51655, -0.2525604, -1.941574, 1, 1, 1, 1, 1,
-1.505673, 1.515772, -1.369923, 1, 1, 1, 1, 1,
-1.495714, 0.9490627, 0.007011132, 1, 1, 1, 1, 1,
-1.49235, 0.9500284, -1.087283, 1, 1, 1, 1, 1,
-1.490375, 0.6649559, -1.604504, 1, 1, 1, 1, 1,
-1.487572, -1.517753, -1.456198, 0, 0, 1, 1, 1,
-1.47917, -1.831731, -4.57015, 1, 0, 0, 1, 1,
-1.477793, 0.7333068, -2.211066, 1, 0, 0, 1, 1,
-1.459363, -0.4187588, -2.208538, 1, 0, 0, 1, 1,
-1.459272, -1.065146, -1.27932, 1, 0, 0, 1, 1,
-1.458058, 1.344667, -2.420402, 1, 0, 0, 1, 1,
-1.457623, -1.284415, -0.7060295, 0, 0, 0, 1, 1,
-1.440522, -0.05989378, -1.163607, 0, 0, 0, 1, 1,
-1.436838, -1.674583, -3.099022, 0, 0, 0, 1, 1,
-1.427813, 0.9593849, -2.147817, 0, 0, 0, 1, 1,
-1.423756, -0.4649351, -2.989829, 0, 0, 0, 1, 1,
-1.417985, -1.767907, -3.415136, 0, 0, 0, 1, 1,
-1.414178, 0.5008917, -1.668201, 0, 0, 0, 1, 1,
-1.412709, 2.114737, -1.059162, 1, 1, 1, 1, 1,
-1.410334, -0.1410872, -2.213517, 1, 1, 1, 1, 1,
-1.409485, 0.1368041, -1.071527, 1, 1, 1, 1, 1,
-1.405293, 0.2437178, -1.718734, 1, 1, 1, 1, 1,
-1.40528, -0.9181162, -0.6196444, 1, 1, 1, 1, 1,
-1.392167, 0.1196122, -0.6507251, 1, 1, 1, 1, 1,
-1.369126, 0.3078658, -1.460586, 1, 1, 1, 1, 1,
-1.359072, -0.03733996, -2.441765, 1, 1, 1, 1, 1,
-1.351027, 0.4196044, -1.902213, 1, 1, 1, 1, 1,
-1.349097, 0.8526633, -1.283644, 1, 1, 1, 1, 1,
-1.34618, -0.1335741, -1.567706, 1, 1, 1, 1, 1,
-1.340974, -0.1127369, -1.290817, 1, 1, 1, 1, 1,
-1.34061, -0.7748963, -0.6007661, 1, 1, 1, 1, 1,
-1.335127, 0.6308222, -2.763432, 1, 1, 1, 1, 1,
-1.327477, -0.3316916, -2.379158, 1, 1, 1, 1, 1,
-1.326534, -1.599821, -2.315051, 0, 0, 1, 1, 1,
-1.318292, 1.421887, -0.516176, 1, 0, 0, 1, 1,
-1.31567, 1.154292, -1.131955, 1, 0, 0, 1, 1,
-1.31105, 1.034545, -2.620862, 1, 0, 0, 1, 1,
-1.310905, 0.6386121, -1.611163, 1, 0, 0, 1, 1,
-1.306996, 0.1781154, 0.2110897, 1, 0, 0, 1, 1,
-1.301322, 1.088867, -1.133878, 0, 0, 0, 1, 1,
-1.299525, -0.8680876, -2.848667, 0, 0, 0, 1, 1,
-1.29904, -0.1419561, -2.057618, 0, 0, 0, 1, 1,
-1.292287, -1.700872, -1.984553, 0, 0, 0, 1, 1,
-1.291745, 0.2926603, -2.090797, 0, 0, 0, 1, 1,
-1.290885, -0.7741122, -1.166571, 0, 0, 0, 1, 1,
-1.290321, 0.4405997, -1.409667, 0, 0, 0, 1, 1,
-1.285939, 0.5993888, -0.9605551, 1, 1, 1, 1, 1,
-1.282622, 1.356073, -2.316381, 1, 1, 1, 1, 1,
-1.268836, -0.2328986, -0.8299189, 1, 1, 1, 1, 1,
-1.266182, 1.840054, 0.2756691, 1, 1, 1, 1, 1,
-1.259888, -0.2436839, -0.1798934, 1, 1, 1, 1, 1,
-1.256525, -0.2722442, -0.9180098, 1, 1, 1, 1, 1,
-1.252778, 1.858703, -1.802008, 1, 1, 1, 1, 1,
-1.252297, 1.872181, 1.974544, 1, 1, 1, 1, 1,
-1.244668, 0.1173397, -0.7077006, 1, 1, 1, 1, 1,
-1.24415, 0.008214421, -1.107652, 1, 1, 1, 1, 1,
-1.24286, 1.266192, 0.5430811, 1, 1, 1, 1, 1,
-1.241526, -0.1888553, -2.537749, 1, 1, 1, 1, 1,
-1.230599, 0.5581574, -1.655399, 1, 1, 1, 1, 1,
-1.222696, 0.4795989, -1.590097, 1, 1, 1, 1, 1,
-1.216195, -1.6817, -1.817551, 1, 1, 1, 1, 1,
-1.216175, 0.2694139, -1.363664, 0, 0, 1, 1, 1,
-1.213504, 0.2458504, -1.698017, 1, 0, 0, 1, 1,
-1.208799, -0.2258279, -0.5481229, 1, 0, 0, 1, 1,
-1.190334, 0.2656448, -0.7475002, 1, 0, 0, 1, 1,
-1.187207, 0.1117238, -1.317433, 1, 0, 0, 1, 1,
-1.183048, 0.9902685, -1.702784, 1, 0, 0, 1, 1,
-1.176225, -0.8036228, -3.783154, 0, 0, 0, 1, 1,
-1.160748, -0.9877219, -3.051849, 0, 0, 0, 1, 1,
-1.158746, 0.6102587, -0.9642508, 0, 0, 0, 1, 1,
-1.147228, 1.452096, -0.4366635, 0, 0, 0, 1, 1,
-1.138099, 0.3352481, -0.9766914, 0, 0, 0, 1, 1,
-1.136038, -0.6360843, 0.1914721, 0, 0, 0, 1, 1,
-1.133169, 0.0802379, -0.9397247, 0, 0, 0, 1, 1,
-1.132395, -0.05808109, -1.853358, 1, 1, 1, 1, 1,
-1.132026, -0.8864338, -2.115999, 1, 1, 1, 1, 1,
-1.130295, -3.586965, -2.377463, 1, 1, 1, 1, 1,
-1.129313, 0.2099966, -1.100194, 1, 1, 1, 1, 1,
-1.12845, -0.6620073, -2.047448, 1, 1, 1, 1, 1,
-1.128399, -0.4509127, -1.531007, 1, 1, 1, 1, 1,
-1.125456, 0.4163351, -0.5895686, 1, 1, 1, 1, 1,
-1.122529, -1.396939, -2.408631, 1, 1, 1, 1, 1,
-1.119875, -0.008352263, -2.103894, 1, 1, 1, 1, 1,
-1.114011, 0.2569997, -4.00932, 1, 1, 1, 1, 1,
-1.113631, -0.6756427, -2.897019, 1, 1, 1, 1, 1,
-1.112513, -1.1323, -1.622127, 1, 1, 1, 1, 1,
-1.104496, 0.5928869, -2.538459, 1, 1, 1, 1, 1,
-1.102272, -0.5780452, -3.479525, 1, 1, 1, 1, 1,
-1.100419, -0.1878642, -1.891313, 1, 1, 1, 1, 1,
-1.094739, 0.3453897, -0.6942627, 0, 0, 1, 1, 1,
-1.093105, -0.6870664, -1.096949, 1, 0, 0, 1, 1,
-1.091285, -1.383666, -1.833886, 1, 0, 0, 1, 1,
-1.087877, 1.122697, -1.581309, 1, 0, 0, 1, 1,
-1.083894, -0.3932349, -0.4095605, 1, 0, 0, 1, 1,
-1.083483, -1.493399, -4.00257, 1, 0, 0, 1, 1,
-1.081233, -0.2703751, 0.4477543, 0, 0, 0, 1, 1,
-1.063294, -0.2096488, -2.69714, 0, 0, 0, 1, 1,
-1.061483, -0.4132722, -1.859586, 0, 0, 0, 1, 1,
-1.058669, -0.7080948, -1.645438, 0, 0, 0, 1, 1,
-1.054649, 1.044504, -0.5553896, 0, 0, 0, 1, 1,
-1.053935, -0.883227, -2.382505, 0, 0, 0, 1, 1,
-1.052783, -0.4068927, -3.184647, 0, 0, 0, 1, 1,
-1.052327, -1.535267, -1.605485, 1, 1, 1, 1, 1,
-1.045594, -1.567649, -4.391453, 1, 1, 1, 1, 1,
-1.044964, -1.221099, -3.129545, 1, 1, 1, 1, 1,
-1.044188, 1.012465, -1.255752, 1, 1, 1, 1, 1,
-1.035578, -0.3669775, -0.876356, 1, 1, 1, 1, 1,
-1.033137, 0.1416928, -1.232063, 1, 1, 1, 1, 1,
-1.032809, 0.5670183, -1.943083, 1, 1, 1, 1, 1,
-1.032145, -0.5061598, -0.6926467, 1, 1, 1, 1, 1,
-1.029678, 0.8349661, -1.050688, 1, 1, 1, 1, 1,
-1.029443, 0.2350297, -1.592546, 1, 1, 1, 1, 1,
-1.017782, 0.9023689, -1.052457, 1, 1, 1, 1, 1,
-1.016765, -0.6549725, -3.356254, 1, 1, 1, 1, 1,
-1.016102, -0.5958123, -1.647692, 1, 1, 1, 1, 1,
-1.015738, -0.6018141, -1.706999, 1, 1, 1, 1, 1,
-1.014954, 1.824386, -0.6132934, 1, 1, 1, 1, 1,
-1.012817, 1.377475, 0.3223875, 0, 0, 1, 1, 1,
-0.9970115, -1.306002, -3.102857, 1, 0, 0, 1, 1,
-0.9930208, 0.3134415, -1.280413, 1, 0, 0, 1, 1,
-0.9920442, 2.391787, -0.7050676, 1, 0, 0, 1, 1,
-0.9919514, 0.1498092, 0.5595459, 1, 0, 0, 1, 1,
-0.9913682, -0.1530056, -2.285479, 1, 0, 0, 1, 1,
-0.9911025, 0.1289423, -1.422858, 0, 0, 0, 1, 1,
-0.9897256, -0.02695554, -1.070437, 0, 0, 0, 1, 1,
-0.9881672, -0.4448323, -1.648829, 0, 0, 0, 1, 1,
-0.9863151, 0.3819398, -0.7662437, 0, 0, 0, 1, 1,
-0.9833278, 0.5279599, -0.6710208, 0, 0, 0, 1, 1,
-0.9768406, 0.3647206, -1.571283, 0, 0, 0, 1, 1,
-0.975885, -2.250895, -2.101687, 0, 0, 0, 1, 1,
-0.9680985, -1.28404, -3.284612, 1, 1, 1, 1, 1,
-0.9665571, 0.409214, -2.769514, 1, 1, 1, 1, 1,
-0.9593984, 2.097261, -1.294353, 1, 1, 1, 1, 1,
-0.9577354, 1.830737, -0.3179339, 1, 1, 1, 1, 1,
-0.9463276, 0.1354954, -1.763123, 1, 1, 1, 1, 1,
-0.9422895, 0.1344425, -3.508769, 1, 1, 1, 1, 1,
-0.9386541, 0.1454457, -2.032618, 1, 1, 1, 1, 1,
-0.9374136, -1.806269, -1.918048, 1, 1, 1, 1, 1,
-0.9371191, -0.6784141, -1.210734, 1, 1, 1, 1, 1,
-0.9350566, 1.374706, 0.4675176, 1, 1, 1, 1, 1,
-0.9332179, -0.251781, -1.319335, 1, 1, 1, 1, 1,
-0.9262655, 0.601989, -1.803819, 1, 1, 1, 1, 1,
-0.9249291, 1.321752, 0.1061108, 1, 1, 1, 1, 1,
-0.9237322, 0.6353647, -0.6487097, 1, 1, 1, 1, 1,
-0.9198937, 0.6874997, -0.1847449, 1, 1, 1, 1, 1,
-0.9183106, -1.418626, -1.247057, 0, 0, 1, 1, 1,
-0.9111468, 0.0687299, -0.8116651, 1, 0, 0, 1, 1,
-0.9107866, 0.3608514, -2.13949, 1, 0, 0, 1, 1,
-0.9083393, -0.2818342, -2.021614, 1, 0, 0, 1, 1,
-0.9076982, -0.6315358, -0.3343938, 1, 0, 0, 1, 1,
-0.907241, 0.8049873, -0.9072779, 1, 0, 0, 1, 1,
-0.905987, -0.9354239, -2.091227, 0, 0, 0, 1, 1,
-0.9044435, -0.7322844, -2.542005, 0, 0, 0, 1, 1,
-0.9037434, -0.008333672, 0.1608624, 0, 0, 0, 1, 1,
-0.897077, -2.114974, -2.643363, 0, 0, 0, 1, 1,
-0.8944761, -0.2131307, -2.442355, 0, 0, 0, 1, 1,
-0.8925595, -0.01108857, -1.907971, 0, 0, 0, 1, 1,
-0.8886663, 0.516851, -0.6362533, 0, 0, 0, 1, 1,
-0.8882095, -1.283329, -3.784713, 1, 1, 1, 1, 1,
-0.8877696, -0.06175689, -3.398146, 1, 1, 1, 1, 1,
-0.8744733, 0.1544197, -1.923316, 1, 1, 1, 1, 1,
-0.8732078, -0.002628784, -1.278818, 1, 1, 1, 1, 1,
-0.8729671, -0.3537481, -1.384493, 1, 1, 1, 1, 1,
-0.8722665, -1.709213, -2.568398, 1, 1, 1, 1, 1,
-0.8687643, -0.3836058, -2.333061, 1, 1, 1, 1, 1,
-0.8527798, -0.1843126, -3.302547, 1, 1, 1, 1, 1,
-0.8450231, 0.7075276, -2.745713, 1, 1, 1, 1, 1,
-0.8434095, -0.2944385, 0.1595897, 1, 1, 1, 1, 1,
-0.8380662, 0.7072042, 0.02471648, 1, 1, 1, 1, 1,
-0.8371418, -1.062458, -2.066052, 1, 1, 1, 1, 1,
-0.8363354, -0.727402, -1.667998, 1, 1, 1, 1, 1,
-0.8353376, 0.09576897, -2.074756, 1, 1, 1, 1, 1,
-0.835045, -0.4246345, -2.206944, 1, 1, 1, 1, 1,
-0.8341444, 0.3500653, -1.628468, 0, 0, 1, 1, 1,
-0.8340553, 1.865064, -0.4508656, 1, 0, 0, 1, 1,
-0.828696, -0.360672, -2.700572, 1, 0, 0, 1, 1,
-0.8079345, 0.8408023, -0.2307671, 1, 0, 0, 1, 1,
-0.8004075, 0.5225362, -0.6921063, 1, 0, 0, 1, 1,
-0.7931835, 0.7641225, -0.6517826, 1, 0, 0, 1, 1,
-0.7913611, 0.1250361, -0.7398865, 0, 0, 0, 1, 1,
-0.7886699, -0.670594, -2.180434, 0, 0, 0, 1, 1,
-0.7862304, 0.7787929, -0.02362094, 0, 0, 0, 1, 1,
-0.7852479, 0.4293113, -2.949027, 0, 0, 0, 1, 1,
-0.7817548, -0.8562964, -2.264182, 0, 0, 0, 1, 1,
-0.780405, 0.3438119, -1.713776, 0, 0, 0, 1, 1,
-0.7784474, 0.2128267, -1.006073, 0, 0, 0, 1, 1,
-0.7754359, -1.066927, -2.172803, 1, 1, 1, 1, 1,
-0.7685319, -2.443946, -3.346303, 1, 1, 1, 1, 1,
-0.7669336, 0.8321429, -1.550002, 1, 1, 1, 1, 1,
-0.7578881, -0.1731855, -1.326021, 1, 1, 1, 1, 1,
-0.7577877, -0.3749743, -2.872231, 1, 1, 1, 1, 1,
-0.7531603, -0.2342676, -2.622145, 1, 1, 1, 1, 1,
-0.7519555, -1.37156, -0.7548002, 1, 1, 1, 1, 1,
-0.7494856, -0.04893998, -0.9750077, 1, 1, 1, 1, 1,
-0.7418221, 1.692139, -0.6958769, 1, 1, 1, 1, 1,
-0.7395164, 0.5842544, 0.7861194, 1, 1, 1, 1, 1,
-0.7394333, 0.5541608, -1.34431, 1, 1, 1, 1, 1,
-0.7377694, -1.331555, -3.825057, 1, 1, 1, 1, 1,
-0.7345822, -0.6591772, -2.230919, 1, 1, 1, 1, 1,
-0.7324098, 0.8024361, -1.058545, 1, 1, 1, 1, 1,
-0.7313095, -0.5329307, -3.061573, 1, 1, 1, 1, 1,
-0.730494, -0.7227136, -2.841177, 0, 0, 1, 1, 1,
-0.7244278, 0.3181626, 1.07671, 1, 0, 0, 1, 1,
-0.7172152, 0.97968, -0.1424707, 1, 0, 0, 1, 1,
-0.7150378, -0.9725167, -3.269695, 1, 0, 0, 1, 1,
-0.7138762, 0.7594703, -1.476421, 1, 0, 0, 1, 1,
-0.7135157, 0.1514777, -0.5216001, 1, 0, 0, 1, 1,
-0.7073447, 2.097793, 1.011662, 0, 0, 0, 1, 1,
-0.707206, -0.3867165, -2.068727, 0, 0, 0, 1, 1,
-0.7028273, 0.0008017246, -2.496456, 0, 0, 0, 1, 1,
-0.7008923, -1.841746, -3.533237, 0, 0, 0, 1, 1,
-0.6966795, 0.2654262, -1.439974, 0, 0, 0, 1, 1,
-0.6964724, 0.6809458, 0.710997, 0, 0, 0, 1, 1,
-0.696179, -0.2890082, -2.26967, 0, 0, 0, 1, 1,
-0.6911488, -0.9207886, -3.341897, 1, 1, 1, 1, 1,
-0.6895407, -0.8798069, -0.993643, 1, 1, 1, 1, 1,
-0.6864649, 2.682045, 2.101865, 1, 1, 1, 1, 1,
-0.6853495, -1.203138, -2.37325, 1, 1, 1, 1, 1,
-0.6836627, -0.0634858, -1.112218, 1, 1, 1, 1, 1,
-0.6825328, 0.3153232, -0.709287, 1, 1, 1, 1, 1,
-0.676937, 0.3439054, -1.672687, 1, 1, 1, 1, 1,
-0.6736106, -0.7837324, -2.031615, 1, 1, 1, 1, 1,
-0.6728424, 0.5467229, -1.293929, 1, 1, 1, 1, 1,
-0.666564, -0.1062194, -1.023594, 1, 1, 1, 1, 1,
-0.6620591, 0.7544164, 0.4274195, 1, 1, 1, 1, 1,
-0.658217, -0.627856, -2.248404, 1, 1, 1, 1, 1,
-0.6514655, 1.162138, -0.009992115, 1, 1, 1, 1, 1,
-0.6490092, 0.4817323, -0.9172471, 1, 1, 1, 1, 1,
-0.6419557, 1.348685, -1.620834, 1, 1, 1, 1, 1,
-0.6351765, 0.4535046, 0.7637429, 0, 0, 1, 1, 1,
-0.6306741, 0.5638391, -1.520915, 1, 0, 0, 1, 1,
-0.6251734, 1.021082, -1.278178, 1, 0, 0, 1, 1,
-0.6250899, 1.289636, -1.321398, 1, 0, 0, 1, 1,
-0.6211287, -0.2160079, -2.194132, 1, 0, 0, 1, 1,
-0.619638, -0.02666181, -1.335384, 1, 0, 0, 1, 1,
-0.6146252, 2.204714, -0.2645046, 0, 0, 0, 1, 1,
-0.6087243, 0.7802774, -1.384026, 0, 0, 0, 1, 1,
-0.6038223, 0.05780432, -0.727869, 0, 0, 0, 1, 1,
-0.5980117, 0.705871, -0.1307276, 0, 0, 0, 1, 1,
-0.5928721, 0.4047714, 0.8721687, 0, 0, 0, 1, 1,
-0.5914054, -1.93724, -2.535212, 0, 0, 0, 1, 1,
-0.5860983, 1.984557, -0.8739065, 0, 0, 0, 1, 1,
-0.5860282, -0.03074891, -1.811574, 1, 1, 1, 1, 1,
-0.5855468, 0.07609591, -0.7015923, 1, 1, 1, 1, 1,
-0.5832375, 0.4238827, -0.4851941, 1, 1, 1, 1, 1,
-0.5823503, 0.4895421, -1.371293, 1, 1, 1, 1, 1,
-0.5814109, -0.5135195, -2.449324, 1, 1, 1, 1, 1,
-0.5795894, 0.2713032, -0.2194953, 1, 1, 1, 1, 1,
-0.5710045, -0.08487476, -0.7814745, 1, 1, 1, 1, 1,
-0.5703663, -0.672891, -3.679436, 1, 1, 1, 1, 1,
-0.5667688, -0.1647466, -1.462521, 1, 1, 1, 1, 1,
-0.5659112, 0.04386121, -0.292431, 1, 1, 1, 1, 1,
-0.5651983, -0.5297639, -3.135807, 1, 1, 1, 1, 1,
-0.5635502, -0.6385171, -2.854305, 1, 1, 1, 1, 1,
-0.563239, 0.008645756, -0.704357, 1, 1, 1, 1, 1,
-0.5625662, -0.1937332, -1.553236, 1, 1, 1, 1, 1,
-0.5623924, 0.3036188, 0.7796289, 1, 1, 1, 1, 1,
-0.558641, -1.362832, -4.653444, 0, 0, 1, 1, 1,
-0.5492556, -1.211181, -3.303434, 1, 0, 0, 1, 1,
-0.5401112, 1.806608, -1.801332, 1, 0, 0, 1, 1,
-0.5396572, -0.1934743, -1.781679, 1, 0, 0, 1, 1,
-0.536476, -0.2400302, -0.8008216, 1, 0, 0, 1, 1,
-0.5331478, -0.7383888, -2.835945, 1, 0, 0, 1, 1,
-0.5304079, -0.7464319, -1.53663, 0, 0, 0, 1, 1,
-0.5286438, -0.4391708, -2.966779, 0, 0, 0, 1, 1,
-0.5266963, 0.4667017, -0.210567, 0, 0, 0, 1, 1,
-0.5263041, 0.878156, -1.195566, 0, 0, 0, 1, 1,
-0.5241441, 0.9191928, -1.610756, 0, 0, 0, 1, 1,
-0.5156079, -0.03467361, -3.337826, 0, 0, 0, 1, 1,
-0.5152709, -0.6944113, -1.73708, 0, 0, 0, 1, 1,
-0.5142807, 0.8484821, 0.02530856, 1, 1, 1, 1, 1,
-0.5129505, 0.4256515, -1.312053, 1, 1, 1, 1, 1,
-0.5113555, 1.355772, -0.1774859, 1, 1, 1, 1, 1,
-0.508853, 0.8968677, -1.742077, 1, 1, 1, 1, 1,
-0.507105, 0.3829387, -0.1169338, 1, 1, 1, 1, 1,
-0.5026674, 2.502952, -2.328124, 1, 1, 1, 1, 1,
-0.5006225, -2.493981, -1.252729, 1, 1, 1, 1, 1,
-0.4983743, 1.829023, -0.3583418, 1, 1, 1, 1, 1,
-0.4952978, 1.045401, -2.006032, 1, 1, 1, 1, 1,
-0.4935429, -0.1690925, -2.423529, 1, 1, 1, 1, 1,
-0.4904375, 0.1514535, -2.933615, 1, 1, 1, 1, 1,
-0.4893597, 1.752229, -0.3014906, 1, 1, 1, 1, 1,
-0.4885322, 1.524778, -0.1941875, 1, 1, 1, 1, 1,
-0.4883507, 0.2260807, -0.6647999, 1, 1, 1, 1, 1,
-0.4712592, -0.2367276, -2.083062, 1, 1, 1, 1, 1,
-0.4586883, 1.177971, 0.7986936, 0, 0, 1, 1, 1,
-0.4578159, 0.04418977, -0.7695931, 1, 0, 0, 1, 1,
-0.45647, -0.5282219, -3.420698, 1, 0, 0, 1, 1,
-0.4537141, 0.8183474, -0.5571219, 1, 0, 0, 1, 1,
-0.4488049, -0.4993951, -1.316023, 1, 0, 0, 1, 1,
-0.4463363, -0.2240492, -2.02416, 1, 0, 0, 1, 1,
-0.4373086, -0.3306816, -4.700947, 0, 0, 0, 1, 1,
-0.4361878, 0.6187508, -0.4490468, 0, 0, 0, 1, 1,
-0.431037, 0.8660005, -1.441309, 0, 0, 0, 1, 1,
-0.4300532, 0.5789137, -0.1719573, 0, 0, 0, 1, 1,
-0.4299287, 0.9365485, 0.6650309, 0, 0, 0, 1, 1,
-0.4212525, 0.99966, -0.8700755, 0, 0, 0, 1, 1,
-0.4144687, -0.9528472, -4.008999, 0, 0, 0, 1, 1,
-0.4105258, -0.408107, -1.636537, 1, 1, 1, 1, 1,
-0.4058658, 0.5828894, -0.8580425, 1, 1, 1, 1, 1,
-0.4005175, -1.259271, -5.088836, 1, 1, 1, 1, 1,
-0.400264, -0.229378, -1.81802, 1, 1, 1, 1, 1,
-0.3930551, -0.04792627, -0.3817148, 1, 1, 1, 1, 1,
-0.3909853, -0.64302, -3.46051, 1, 1, 1, 1, 1,
-0.3893454, -0.3494176, -1.108299, 1, 1, 1, 1, 1,
-0.3874682, 0.6758838, -0.7919667, 1, 1, 1, 1, 1,
-0.387372, 1.655489, -1.146412, 1, 1, 1, 1, 1,
-0.3848776, 0.08161077, 0.04440998, 1, 1, 1, 1, 1,
-0.3835857, 1.34139, 0.04456713, 1, 1, 1, 1, 1,
-0.3793317, 0.09440367, -1.012414, 1, 1, 1, 1, 1,
-0.3735616, -0.54877, -2.694973, 1, 1, 1, 1, 1,
-0.3629756, 0.3106631, 0.9264059, 1, 1, 1, 1, 1,
-0.3621065, -2.82078, -2.18838, 1, 1, 1, 1, 1,
-0.3598848, 1.21338, -0.3921205, 0, 0, 1, 1, 1,
-0.3595088, 2.44547, 0.2203896, 1, 0, 0, 1, 1,
-0.3573563, 1.377833, 0.6608675, 1, 0, 0, 1, 1,
-0.355389, -1.774383, -1.764995, 1, 0, 0, 1, 1,
-0.3535667, 1.437652, -0.7699047, 1, 0, 0, 1, 1,
-0.3496614, 1.180686, -0.3499926, 1, 0, 0, 1, 1,
-0.3445627, -0.1254553, -2.145378, 0, 0, 0, 1, 1,
-0.3416216, -0.7906024, -2.228413, 0, 0, 0, 1, 1,
-0.3413328, 1.240558, 0.3512079, 0, 0, 0, 1, 1,
-0.3411092, 1.883265, 0.5100495, 0, 0, 0, 1, 1,
-0.3306659, 0.8603328, 0.1747732, 0, 0, 0, 1, 1,
-0.3206388, -0.5741357, -1.758867, 0, 0, 0, 1, 1,
-0.3075001, -1.4566, -3.081102, 0, 0, 0, 1, 1,
-0.3059119, 0.09046192, 0.05863375, 1, 1, 1, 1, 1,
-0.2903677, 0.6231636, 0.7742926, 1, 1, 1, 1, 1,
-0.2888781, 0.1352938, -1.053541, 1, 1, 1, 1, 1,
-0.2824234, -0.505084, -1.413186, 1, 1, 1, 1, 1,
-0.2809842, -1.443, -3.539238, 1, 1, 1, 1, 1,
-0.275891, 1.14804, 1.03889, 1, 1, 1, 1, 1,
-0.2753769, -1.787942, -3.64798, 1, 1, 1, 1, 1,
-0.273056, 1.790672, 0.2418523, 1, 1, 1, 1, 1,
-0.2715556, -0.5388209, -3.069481, 1, 1, 1, 1, 1,
-0.2704653, -0.2046884, -3.851646, 1, 1, 1, 1, 1,
-0.2669803, 0.4081703, 0.1277457, 1, 1, 1, 1, 1,
-0.2594499, 1.519751, 0.2023743, 1, 1, 1, 1, 1,
-0.2551652, -0.8386488, -3.570047, 1, 1, 1, 1, 1,
-0.2532003, 1.34125, 0.0481458, 1, 1, 1, 1, 1,
-0.2529576, -0.06653056, -2.822372, 1, 1, 1, 1, 1,
-0.2456677, 0.3200853, -0.5068532, 0, 0, 1, 1, 1,
-0.2447683, -1.190647, -1.607549, 1, 0, 0, 1, 1,
-0.2389441, 1.807644, 1.318138, 1, 0, 0, 1, 1,
-0.2371278, 1.364949, -1.130136, 1, 0, 0, 1, 1,
-0.2356314, 0.9851797, 0.40975, 1, 0, 0, 1, 1,
-0.233866, -0.02508126, -0.1408438, 1, 0, 0, 1, 1,
-0.2312458, 1.845422, 0.6652189, 0, 0, 0, 1, 1,
-0.2288184, -0.01504791, -3.380531, 0, 0, 0, 1, 1,
-0.2186409, -0.9431857, -3.799809, 0, 0, 0, 1, 1,
-0.2173949, 1.246626, -1.183519, 0, 0, 0, 1, 1,
-0.2106985, 0.549428, -1.327156, 0, 0, 0, 1, 1,
-0.2097906, -1.787143, -2.006829, 0, 0, 0, 1, 1,
-0.2049395, -0.3442508, -3.438097, 0, 0, 0, 1, 1,
-0.204393, -0.7822787, -3.311798, 1, 1, 1, 1, 1,
-0.2021949, -0.5774179, -3.02079, 1, 1, 1, 1, 1,
-0.2005523, -0.4887042, -1.992859, 1, 1, 1, 1, 1,
-0.199672, 0.3617161, -0.3648349, 1, 1, 1, 1, 1,
-0.1994164, 1.169279, -3.122589, 1, 1, 1, 1, 1,
-0.1993642, -0.1392524, -1.692097, 1, 1, 1, 1, 1,
-0.1976744, 0.7193074, 0.25484, 1, 1, 1, 1, 1,
-0.1939764, 0.1101104, -2.403456, 1, 1, 1, 1, 1,
-0.1892992, 0.006402561, -1.546449, 1, 1, 1, 1, 1,
-0.1881513, -1.389232, -2.991181, 1, 1, 1, 1, 1,
-0.1856093, 0.6859826, -1.059082, 1, 1, 1, 1, 1,
-0.1829626, 1.746197, 0.8172459, 1, 1, 1, 1, 1,
-0.1807157, -0.5588951, -1.481506, 1, 1, 1, 1, 1,
-0.1802256, -0.352066, -3.048339, 1, 1, 1, 1, 1,
-0.1789356, -0.3537268, -1.328994, 1, 1, 1, 1, 1,
-0.1769267, -0.8092708, -1.908288, 0, 0, 1, 1, 1,
-0.1764517, -0.9418923, -2.466826, 1, 0, 0, 1, 1,
-0.1754695, -0.8499794, -3.02858, 1, 0, 0, 1, 1,
-0.1719437, 0.3317948, -1.268499, 1, 0, 0, 1, 1,
-0.1704688, -0.5414694, -0.3030189, 1, 0, 0, 1, 1,
-0.169863, -1.276118, -2.261629, 1, 0, 0, 1, 1,
-0.1691958, -1.157553, -1.888558, 0, 0, 0, 1, 1,
-0.1687024, 0.7552607, 0.3286616, 0, 0, 0, 1, 1,
-0.1655984, 0.07129114, -1.879218, 0, 0, 0, 1, 1,
-0.1647862, -0.6678411, -3.599451, 0, 0, 0, 1, 1,
-0.1592353, 0.2640929, -0.5905134, 0, 0, 0, 1, 1,
-0.155505, 0.9022994, 0.6151774, 0, 0, 0, 1, 1,
-0.1516123, -0.7084777, -3.711632, 0, 0, 0, 1, 1,
-0.1478964, 1.415654, 0.2763479, 1, 1, 1, 1, 1,
-0.1428094, -0.8934996, -3.935398, 1, 1, 1, 1, 1,
-0.1419544, -1.66701, -3.327199, 1, 1, 1, 1, 1,
-0.1398693, -0.4227867, -2.218317, 1, 1, 1, 1, 1,
-0.1390589, 1.257701, -0.4982664, 1, 1, 1, 1, 1,
-0.1368973, -0.5431212, -2.923339, 1, 1, 1, 1, 1,
-0.136474, 0.5682307, -0.01710125, 1, 1, 1, 1, 1,
-0.1351466, 3.206385, -0.7650109, 1, 1, 1, 1, 1,
-0.1255954, 0.4132123, 0.2441534, 1, 1, 1, 1, 1,
-0.1240983, -0.09960284, -1.314726, 1, 1, 1, 1, 1,
-0.1228303, 2.257734, -1.070997, 1, 1, 1, 1, 1,
-0.1222064, -0.7768996, -1.827453, 1, 1, 1, 1, 1,
-0.1197508, 0.4200081, -1.705021, 1, 1, 1, 1, 1,
-0.1158007, 0.2245244, 0.9089257, 1, 1, 1, 1, 1,
-0.1141936, 0.5778199, 0.7576582, 1, 1, 1, 1, 1,
-0.1025601, -1.005787, -2.769359, 0, 0, 1, 1, 1,
-0.1009142, -0.950069, -2.202666, 1, 0, 0, 1, 1,
-0.09827294, -0.4431932, -3.527748, 1, 0, 0, 1, 1,
-0.09396493, 0.8399061, -0.945994, 1, 0, 0, 1, 1,
-0.08886997, 0.2901719, 0.1070991, 1, 0, 0, 1, 1,
-0.08743875, 0.1242439, -1.178949, 1, 0, 0, 1, 1,
-0.08591394, 0.7639692, 1.621685, 0, 0, 0, 1, 1,
-0.08430085, -1.343304, -2.21848, 0, 0, 0, 1, 1,
-0.08162792, -1.778838, -3.021304, 0, 0, 0, 1, 1,
-0.07986058, 1.003779, 0.0005416013, 0, 0, 0, 1, 1,
-0.07964769, 0.5289148, 0.6663864, 0, 0, 0, 1, 1,
-0.07763836, 0.4763978, 0.5246896, 0, 0, 0, 1, 1,
-0.06826156, -1.175803, -2.567012, 0, 0, 0, 1, 1,
-0.0679525, 1.459106, -1.372197, 1, 1, 1, 1, 1,
-0.06638599, 1.219353, 0.7158833, 1, 1, 1, 1, 1,
-0.06493165, -0.196209, -3.539889, 1, 1, 1, 1, 1,
-0.06061568, 0.1091717, -0.3318935, 1, 1, 1, 1, 1,
-0.05726031, -0.5655396, -1.862679, 1, 1, 1, 1, 1,
-0.05465099, 0.5564597, -0.6618159, 1, 1, 1, 1, 1,
-0.05275692, -1.350499, -3.732886, 1, 1, 1, 1, 1,
-0.04681724, -1.74927, -3.247506, 1, 1, 1, 1, 1,
-0.04659182, -0.6206289, -2.345896, 1, 1, 1, 1, 1,
-0.0410255, 0.1881374, -2.202097, 1, 1, 1, 1, 1,
-0.04068661, -1.742575, -1.99813, 1, 1, 1, 1, 1,
-0.04060151, -0.7075441, -3.270771, 1, 1, 1, 1, 1,
-0.03999382, 1.031608, 0.5803103, 1, 1, 1, 1, 1,
-0.03991789, -0.184883, -3.069102, 1, 1, 1, 1, 1,
-0.03759671, 1.378403, 1.1239, 1, 1, 1, 1, 1,
-0.03699454, -1.20804, -3.677765, 0, 0, 1, 1, 1,
-0.03518177, 0.08090187, 0.5213469, 1, 0, 0, 1, 1,
-0.0339294, 0.2498177, -0.4645503, 1, 0, 0, 1, 1,
-0.03009898, 0.1778568, 0.5881816, 1, 0, 0, 1, 1,
-0.02939982, 0.1880235, -0.2486316, 1, 0, 0, 1, 1,
-0.02580717, 0.1309561, -0.1858893, 1, 0, 0, 1, 1,
-0.02100839, -0.4977984, -3.073833, 0, 0, 0, 1, 1,
-0.02072862, -0.0179959, -1.700951, 0, 0, 0, 1, 1,
-0.01628461, 1.184595, -1.801672, 0, 0, 0, 1, 1,
-0.01396148, -0.7056004, -2.653147, 0, 0, 0, 1, 1,
-0.01306592, 0.4764971, 1.735307, 0, 0, 0, 1, 1,
-0.004629638, 1.205078, -0.09103451, 0, 0, 0, 1, 1,
-0.002456794, -1.394374, -2.618493, 0, 0, 0, 1, 1,
0.003947509, -0.9684246, 3.567131, 1, 1, 1, 1, 1,
0.00613596, -0.04957615, 5.652003, 1, 1, 1, 1, 1,
0.006464052, -0.2289566, 4.091815, 1, 1, 1, 1, 1,
0.01690961, 0.1083211, -0.3534803, 1, 1, 1, 1, 1,
0.02086118, -1.97444, 1.604062, 1, 1, 1, 1, 1,
0.02184833, -1.029941, 4.26125, 1, 1, 1, 1, 1,
0.02349404, 0.6515601, -0.518108, 1, 1, 1, 1, 1,
0.02542324, 1.022424, -0.5580936, 1, 1, 1, 1, 1,
0.02620018, 1.574982, 1.484628, 1, 1, 1, 1, 1,
0.02700629, -1.004778, 2.174839, 1, 1, 1, 1, 1,
0.03152275, 1.173258, 0.5743923, 1, 1, 1, 1, 1,
0.03161088, 0.1179888, 2.077847, 1, 1, 1, 1, 1,
0.03240311, -0.5050324, 2.912141, 1, 1, 1, 1, 1,
0.03363258, 0.4389915, -0.9003353, 1, 1, 1, 1, 1,
0.04025008, -0.3797466, 3.293757, 1, 1, 1, 1, 1,
0.04180104, -0.5649847, 5.744132, 0, 0, 1, 1, 1,
0.0418408, -0.1475117, 2.667663, 1, 0, 0, 1, 1,
0.04545352, 1.493421, 0.5185571, 1, 0, 0, 1, 1,
0.04549512, -0.1276446, 2.345345, 1, 0, 0, 1, 1,
0.04581816, -0.02581265, 2.811669, 1, 0, 0, 1, 1,
0.04787498, 1.536661, -0.1808026, 1, 0, 0, 1, 1,
0.04924281, 1.260101, 0.8616843, 0, 0, 0, 1, 1,
0.04974431, 1.313077, -2.266923, 0, 0, 0, 1, 1,
0.05153701, -0.868872, 0.2536416, 0, 0, 0, 1, 1,
0.05208356, -0.8190073, 3.457488, 0, 0, 0, 1, 1,
0.05598274, 0.6701815, 0.7093062, 0, 0, 0, 1, 1,
0.05767433, 0.3487079, -1.827609, 0, 0, 0, 1, 1,
0.0584819, -0.6416159, 3.057311, 0, 0, 0, 1, 1,
0.05858773, -1.757187, 2.254886, 1, 1, 1, 1, 1,
0.05917627, -1.26447, 4.659455, 1, 1, 1, 1, 1,
0.06376204, -0.6607882, 3.12059, 1, 1, 1, 1, 1,
0.06395274, 0.504798, -0.9724642, 1, 1, 1, 1, 1,
0.06544936, -0.4848599, 0.9613736, 1, 1, 1, 1, 1,
0.0700611, -2.335426, 2.241014, 1, 1, 1, 1, 1,
0.08698814, -0.09203774, 1.615527, 1, 1, 1, 1, 1,
0.08899603, 0.592207, 0.1784583, 1, 1, 1, 1, 1,
0.09362862, 0.4023042, 1.618624, 1, 1, 1, 1, 1,
0.09436371, -0.2006972, 2.43851, 1, 1, 1, 1, 1,
0.09460979, -1.601107, 1.026345, 1, 1, 1, 1, 1,
0.09618119, -0.892467, 2.294535, 1, 1, 1, 1, 1,
0.09656917, 0.03781004, -0.004426548, 1, 1, 1, 1, 1,
0.1012348, 0.9951397, 0.3335631, 1, 1, 1, 1, 1,
0.1023141, 0.1146365, 1.76679, 1, 1, 1, 1, 1,
0.1028564, 0.3835394, 2.536648, 0, 0, 1, 1, 1,
0.1059452, -0.07899296, 2.771981, 1, 0, 0, 1, 1,
0.1118721, -0.7032657, 4.138545, 1, 0, 0, 1, 1,
0.1138986, -1.344927, 3.244698, 1, 0, 0, 1, 1,
0.1144717, 0.1544532, 1.897289, 1, 0, 0, 1, 1,
0.120047, -0.8886666, 2.757221, 1, 0, 0, 1, 1,
0.1214813, -1.702136, 2.194653, 0, 0, 0, 1, 1,
0.1220496, -0.2210702, 2.372041, 0, 0, 0, 1, 1,
0.1224835, -1.665703, 3.335939, 0, 0, 0, 1, 1,
0.1262739, 0.467796, 0.5674189, 0, 0, 0, 1, 1,
0.1271818, 0.1783456, 0.6811924, 0, 0, 0, 1, 1,
0.1277454, -0.2183467, 4.244603, 0, 0, 0, 1, 1,
0.1300066, 0.05680363, 3.097646, 0, 0, 0, 1, 1,
0.1320952, -1.471476, 2.956221, 1, 1, 1, 1, 1,
0.1336699, 0.5614436, -0.7114667, 1, 1, 1, 1, 1,
0.1339398, 0.3077331, 0.5611084, 1, 1, 1, 1, 1,
0.1347502, 0.7971547, 1.76411, 1, 1, 1, 1, 1,
0.1349036, -0.9159353, 4.782204, 1, 1, 1, 1, 1,
0.1356768, 1.09137, 1.646492, 1, 1, 1, 1, 1,
0.1391347, 0.6688262, 2.227709, 1, 1, 1, 1, 1,
0.1419307, 1.643774, 0.169768, 1, 1, 1, 1, 1,
0.1437496, -0.4916192, 3.87004, 1, 1, 1, 1, 1,
0.1453508, 0.09725804, -0.4127674, 1, 1, 1, 1, 1,
0.1525377, 1.180084, 0.7710561, 1, 1, 1, 1, 1,
0.1562339, 1.281724, -1.122154, 1, 1, 1, 1, 1,
0.1578314, 0.8642621, -0.4391509, 1, 1, 1, 1, 1,
0.1585414, 0.8488777, -1.080642, 1, 1, 1, 1, 1,
0.1592524, 0.3269289, 0.3183798, 1, 1, 1, 1, 1,
0.1602188, -0.5564589, 3.206491, 0, 0, 1, 1, 1,
0.1608979, 0.158382, 0.7003754, 1, 0, 0, 1, 1,
0.1609991, -1.572882, 0.8182606, 1, 0, 0, 1, 1,
0.1622211, 1.387245, 1.239039, 1, 0, 0, 1, 1,
0.1678653, 0.05315732, 3.352901, 1, 0, 0, 1, 1,
0.1679694, -2.719468, 2.228449, 1, 0, 0, 1, 1,
0.1698185, -0.3889576, 2.117254, 0, 0, 0, 1, 1,
0.1710915, -0.6468452, 3.868522, 0, 0, 0, 1, 1,
0.1712772, -0.1895058, 3.243714, 0, 0, 0, 1, 1,
0.1823973, 0.09005684, 1.570576, 0, 0, 0, 1, 1,
0.1837298, 1.216226, -1.256277, 0, 0, 0, 1, 1,
0.1842129, -1.34665, 1.553011, 0, 0, 0, 1, 1,
0.1887749, 0.477639, -0.7255663, 0, 0, 0, 1, 1,
0.1941706, 1.56666, 0.7303582, 1, 1, 1, 1, 1,
0.1946722, -0.5419094, 3.018658, 1, 1, 1, 1, 1,
0.1948527, -0.007434472, 2.166015, 1, 1, 1, 1, 1,
0.1966842, 1.237081, 0.2277691, 1, 1, 1, 1, 1,
0.1976517, 0.128839, 3.001914, 1, 1, 1, 1, 1,
0.2030839, 0.2755709, 0.1290499, 1, 1, 1, 1, 1,
0.2035436, -0.2276761, 3.04209, 1, 1, 1, 1, 1,
0.2046541, 0.1538309, 1.201185, 1, 1, 1, 1, 1,
0.2057104, -0.0002425672, 0.8479257, 1, 1, 1, 1, 1,
0.2061932, 1.251513, -0.2306656, 1, 1, 1, 1, 1,
0.206258, -0.0320174, 1.034922, 1, 1, 1, 1, 1,
0.209516, -0.2088951, 3.107821, 1, 1, 1, 1, 1,
0.2116976, 0.8996647, 0.2240544, 1, 1, 1, 1, 1,
0.2132144, 0.1599821, 0.288101, 1, 1, 1, 1, 1,
0.214269, 0.8730208, 0.6834856, 1, 1, 1, 1, 1,
0.2195807, 0.2813946, 0.362745, 0, 0, 1, 1, 1,
0.2207041, -0.5435418, 2.030837, 1, 0, 0, 1, 1,
0.2211844, 1.238165, -0.05839468, 1, 0, 0, 1, 1,
0.2220776, -0.3004485, 3.320973, 1, 0, 0, 1, 1,
0.2267521, -0.8326384, 2.018765, 1, 0, 0, 1, 1,
0.228007, -1.956526, 3.305386, 1, 0, 0, 1, 1,
0.2284593, -0.4520251, 1.560966, 0, 0, 0, 1, 1,
0.2298113, 1.044137, -0.4909614, 0, 0, 0, 1, 1,
0.2298202, 0.487049, -0.5549839, 0, 0, 0, 1, 1,
0.2335029, -1.605087, 2.107721, 0, 0, 0, 1, 1,
0.2347801, -0.6614999, 3.286782, 0, 0, 0, 1, 1,
0.2367867, -0.06891935, 1.96069, 0, 0, 0, 1, 1,
0.2416535, 0.07040004, 3.299009, 0, 0, 0, 1, 1,
0.2424653, 1.162932, 1.732769, 1, 1, 1, 1, 1,
0.2445102, 0.3564814, 0.7425071, 1, 1, 1, 1, 1,
0.2449053, -0.2551461, 2.61452, 1, 1, 1, 1, 1,
0.2585818, 0.03898439, 1.535038, 1, 1, 1, 1, 1,
0.2630965, -0.6702377, 0.3689621, 1, 1, 1, 1, 1,
0.270189, -0.7767684, 3.472894, 1, 1, 1, 1, 1,
0.2704943, -0.04155407, 3.11086, 1, 1, 1, 1, 1,
0.2706853, -1.125344, 3.785486, 1, 1, 1, 1, 1,
0.27407, -1.650437, 4.011598, 1, 1, 1, 1, 1,
0.2840389, 1.690349, 0.1275855, 1, 1, 1, 1, 1,
0.2858847, -0.1672559, 0.8548476, 1, 1, 1, 1, 1,
0.2905623, -0.09516639, 1.284548, 1, 1, 1, 1, 1,
0.2909114, -0.5411949, 1.50932, 1, 1, 1, 1, 1,
0.2913464, 0.3078087, 2.296625, 1, 1, 1, 1, 1,
0.3003925, 0.4067231, -0.6008054, 1, 1, 1, 1, 1,
0.3026712, 0.1703701, -0.8846267, 0, 0, 1, 1, 1,
0.3034297, -0.8447543, 3.842624, 1, 0, 0, 1, 1,
0.3073715, -1.032381, 3.530153, 1, 0, 0, 1, 1,
0.3074526, 0.645537, -0.09840923, 1, 0, 0, 1, 1,
0.3125155, -0.1271926, 0.597702, 1, 0, 0, 1, 1,
0.3140826, 1.259094, 0.7122564, 1, 0, 0, 1, 1,
0.3145481, 0.08997354, 2.532634, 0, 0, 0, 1, 1,
0.3166755, 0.3571481, 0.1541063, 0, 0, 0, 1, 1,
0.3220773, -1.380436, 1.871163, 0, 0, 0, 1, 1,
0.3221366, 0.1108995, 1.069701, 0, 0, 0, 1, 1,
0.3235681, -1.417908, 4.147567, 0, 0, 0, 1, 1,
0.3252994, 0.5204253, -0.5185646, 0, 0, 0, 1, 1,
0.3264581, 1.764853, -0.5850677, 0, 0, 0, 1, 1,
0.3294609, 1.148819, -0.9988795, 1, 1, 1, 1, 1,
0.3301911, 0.058506, 0.5816304, 1, 1, 1, 1, 1,
0.3323335, 1.855875, -1.084044, 1, 1, 1, 1, 1,
0.3333543, -0.4603973, 2.517123, 1, 1, 1, 1, 1,
0.3367531, 0.3807573, 0.9446541, 1, 1, 1, 1, 1,
0.3397058, 0.0861435, 0.3904137, 1, 1, 1, 1, 1,
0.3406723, -1.926867, 5.158673, 1, 1, 1, 1, 1,
0.3423961, -0.6976422, 3.080525, 1, 1, 1, 1, 1,
0.3461665, 0.06983422, 0.4345275, 1, 1, 1, 1, 1,
0.3467363, -0.6200513, 2.369213, 1, 1, 1, 1, 1,
0.3471856, 1.364777, -0.5462618, 1, 1, 1, 1, 1,
0.3503387, -0.7887259, 3.43652, 1, 1, 1, 1, 1,
0.3512953, -0.5746136, 2.714537, 1, 1, 1, 1, 1,
0.3545572, -1.284755, 3.8233, 1, 1, 1, 1, 1,
0.3567351, 1.603281, -0.01238197, 1, 1, 1, 1, 1,
0.3577245, 1.237345, 0.4889402, 0, 0, 1, 1, 1,
0.3601697, 1.11465, -0.6328712, 1, 0, 0, 1, 1,
0.3613627, -1.253599, 2.947768, 1, 0, 0, 1, 1,
0.3631597, -0.5403599, 0.7455663, 1, 0, 0, 1, 1,
0.3634526, 0.2471683, 3.479573, 1, 0, 0, 1, 1,
0.3636906, 2.361728, 0.6589518, 1, 0, 0, 1, 1,
0.3658391, -0.2717789, 2.562354, 0, 0, 0, 1, 1,
0.3698825, 0.2877716, 0.7293727, 0, 0, 0, 1, 1,
0.3716199, -2.082235, 3.400818, 0, 0, 0, 1, 1,
0.3741671, -2.611903, 3.51075, 0, 0, 0, 1, 1,
0.3751618, 0.4990324, -1.425882, 0, 0, 0, 1, 1,
0.3767631, -0.9667479, 2.909106, 0, 0, 0, 1, 1,
0.382286, -0.5587467, 3.392921, 0, 0, 0, 1, 1,
0.3830391, 1.472875, -1.509148, 1, 1, 1, 1, 1,
0.3856981, 0.5537463, -0.03890119, 1, 1, 1, 1, 1,
0.3867935, -0.394503, 2.870702, 1, 1, 1, 1, 1,
0.3878652, -0.5919726, 2.733227, 1, 1, 1, 1, 1,
0.387879, 2.132948, 0.2989632, 1, 1, 1, 1, 1,
0.3915808, 1.000424, 0.3798465, 1, 1, 1, 1, 1,
0.3920652, 0.4077842, 0.488492, 1, 1, 1, 1, 1,
0.3991612, 0.4930113, 1.449083, 1, 1, 1, 1, 1,
0.4012128, 0.3580628, 0.4648313, 1, 1, 1, 1, 1,
0.4018616, -0.709309, 2.407373, 1, 1, 1, 1, 1,
0.4035806, 0.7765586, 2.403652, 1, 1, 1, 1, 1,
0.4117256, -0.7239457, 2.578764, 1, 1, 1, 1, 1,
0.4209784, -1.353536, 2.439164, 1, 1, 1, 1, 1,
0.4272369, -1.019974, 4.435685, 1, 1, 1, 1, 1,
0.4290762, 1.891263, -0.2703459, 1, 1, 1, 1, 1,
0.4343677, 0.2652494, -0.3678642, 0, 0, 1, 1, 1,
0.4345434, 0.2670393, 1.354435, 1, 0, 0, 1, 1,
0.4358034, -0.3288018, 3.129476, 1, 0, 0, 1, 1,
0.4371283, 1.960044, 0.3263656, 1, 0, 0, 1, 1,
0.4393269, 1.062786, 0.2610402, 1, 0, 0, 1, 1,
0.4450077, 0.7074737, 1.276855, 1, 0, 0, 1, 1,
0.4450952, -1.524868, 2.38771, 0, 0, 0, 1, 1,
0.4500378, 0.9703525, 0.7307436, 0, 0, 0, 1, 1,
0.4532601, 0.3009972, 1.278961, 0, 0, 0, 1, 1,
0.4565206, 0.8470814, 0.4421205, 0, 0, 0, 1, 1,
0.4567682, -0.1872624, 1.559583, 0, 0, 0, 1, 1,
0.4649715, 0.7342576, 0.1625555, 0, 0, 0, 1, 1,
0.4652453, 0.1573952, 3.109997, 0, 0, 0, 1, 1,
0.4680827, -0.2435931, 0.7216302, 1, 1, 1, 1, 1,
0.4770334, -1.663757, 2.129287, 1, 1, 1, 1, 1,
0.4808326, 1.18646, 0.8707992, 1, 1, 1, 1, 1,
0.4813099, 0.4654228, 1.524076, 1, 1, 1, 1, 1,
0.4818678, -0.1584215, 1.831403, 1, 1, 1, 1, 1,
0.50075, 1.616256, 1.854788, 1, 1, 1, 1, 1,
0.5042276, 0.443593, 0.4837422, 1, 1, 1, 1, 1,
0.5054654, -0.1914314, 2.438342, 1, 1, 1, 1, 1,
0.5113083, 0.09350833, 0.9669505, 1, 1, 1, 1, 1,
0.5124398, 1.068649, 0.8951736, 1, 1, 1, 1, 1,
0.5127491, -1.173892, 3.526598, 1, 1, 1, 1, 1,
0.5145221, -0.4349933, 0.5541474, 1, 1, 1, 1, 1,
0.5151638, 0.4686171, 1.669521, 1, 1, 1, 1, 1,
0.5172506, 0.3274673, -0.1562823, 1, 1, 1, 1, 1,
0.5223561, -0.07439448, 3.169156, 1, 1, 1, 1, 1,
0.5227997, -0.5496644, 1.590744, 0, 0, 1, 1, 1,
0.52577, -1.296124, 2.643589, 1, 0, 0, 1, 1,
0.5283848, 0.6282638, 2.09579, 1, 0, 0, 1, 1,
0.5290647, -0.01158476, 3.346257, 1, 0, 0, 1, 1,
0.5316243, 0.09543405, 1.301803, 1, 0, 0, 1, 1,
0.532786, -1.818063, 4.937402, 1, 0, 0, 1, 1,
0.5330804, 1.694277, 1.597181, 0, 0, 0, 1, 1,
0.5354529, -0.1462411, 1.77051, 0, 0, 0, 1, 1,
0.5359861, 0.4169971, 0.2033737, 0, 0, 0, 1, 1,
0.5447498, -0.6167869, 1.411612, 0, 0, 0, 1, 1,
0.5475797, -0.4777983, 1.692235, 0, 0, 0, 1, 1,
0.5562878, 0.8255809, 2.281231, 0, 0, 0, 1, 1,
0.5571675, 0.07751447, 2.343945, 0, 0, 0, 1, 1,
0.56062, -0.6836956, 2.718759, 1, 1, 1, 1, 1,
0.5610161, 1.721833, -1.619402, 1, 1, 1, 1, 1,
0.5614429, -0.7052276, 2.562075, 1, 1, 1, 1, 1,
0.5652212, 0.8252974, 1.218173, 1, 1, 1, 1, 1,
0.5656585, -0.4501615, 3.566159, 1, 1, 1, 1, 1,
0.5682465, 0.4805513, 2.137399, 1, 1, 1, 1, 1,
0.5688743, 1.021369, 1.370222, 1, 1, 1, 1, 1,
0.5847629, 1.42844, 2.660099, 1, 1, 1, 1, 1,
0.5907313, 0.8730342, 0.9057283, 1, 1, 1, 1, 1,
0.5908918, 0.7164136, -0.686751, 1, 1, 1, 1, 1,
0.594065, 0.9055916, 2.386553, 1, 1, 1, 1, 1,
0.6016756, -1.347448, 2.346529, 1, 1, 1, 1, 1,
0.6030136, -1.504848, 2.922842, 1, 1, 1, 1, 1,
0.6124073, 0.4707691, 0.5687139, 1, 1, 1, 1, 1,
0.6145077, 1.401115, -0.200888, 1, 1, 1, 1, 1,
0.6173788, -1.211259, 0.3093127, 0, 0, 1, 1, 1,
0.6182486, -0.2565051, 1.772133, 1, 0, 0, 1, 1,
0.6202921, -1.006325, 3.99962, 1, 0, 0, 1, 1,
0.6219736, 0.5825076, 1.425755, 1, 0, 0, 1, 1,
0.6223857, 0.7344521, 1.340701, 1, 0, 0, 1, 1,
0.6262432, -0.1651086, 0.9934028, 1, 0, 0, 1, 1,
0.6289951, 0.9894848, 0.5593119, 0, 0, 0, 1, 1,
0.6299356, 0.09901354, 1.03411, 0, 0, 0, 1, 1,
0.6360831, -0.7239577, 1.080569, 0, 0, 0, 1, 1,
0.6437278, 0.846818, -0.5057594, 0, 0, 0, 1, 1,
0.643832, -1.006777, 3.418042, 0, 0, 0, 1, 1,
0.6438541, -0.1602235, 2.98395, 0, 0, 0, 1, 1,
0.6443977, 2.720189, 0.1334582, 0, 0, 0, 1, 1,
0.6460893, -0.7359824, 2.178047, 1, 1, 1, 1, 1,
0.6489542, 0.9895726, -1.330955, 1, 1, 1, 1, 1,
0.6530141, 0.9571415, 0.7773861, 1, 1, 1, 1, 1,
0.6547992, -1.120804, 1.840514, 1, 1, 1, 1, 1,
0.6563128, -0.4272486, -0.1252593, 1, 1, 1, 1, 1,
0.656426, 0.1499304, 1.846992, 1, 1, 1, 1, 1,
0.6574379, 0.6973793, 1.832578, 1, 1, 1, 1, 1,
0.6600356, -0.7025474, 3.849765, 1, 1, 1, 1, 1,
0.660298, 0.3895462, 2.03396, 1, 1, 1, 1, 1,
0.6646492, 0.6340079, 0.6419632, 1, 1, 1, 1, 1,
0.667592, -0.1362472, 1.462304, 1, 1, 1, 1, 1,
0.6728897, 0.2895472, 1.028375, 1, 1, 1, 1, 1,
0.6740516, 0.1596491, 1.651843, 1, 1, 1, 1, 1,
0.6829382, -1.143951, 3.184994, 1, 1, 1, 1, 1,
0.6852264, -0.2617883, 1.947323, 1, 1, 1, 1, 1,
0.6885946, 1.364817, 2.387666, 0, 0, 1, 1, 1,
0.6893008, 0.2331425, 1.795748, 1, 0, 0, 1, 1,
0.6979426, 0.4476036, 2.040025, 1, 0, 0, 1, 1,
0.7027255, -0.4032432, -0.07138395, 1, 0, 0, 1, 1,
0.7032787, -1.88205, 3.154835, 1, 0, 0, 1, 1,
0.7034453, 0.4335441, -0.1623139, 1, 0, 0, 1, 1,
0.7084315, -0.3539588, 1.103409, 0, 0, 0, 1, 1,
0.7095451, 0.1592884, 0.5345706, 0, 0, 0, 1, 1,
0.7111923, -2.646822, 2.537669, 0, 0, 0, 1, 1,
0.7132449, -1.0904, 1.725885, 0, 0, 0, 1, 1,
0.7151669, -0.3212191, 4.723038, 0, 0, 0, 1, 1,
0.7204171, -0.02145205, 1.963614, 0, 0, 0, 1, 1,
0.7260075, 0.5901124, 2.519531, 0, 0, 0, 1, 1,
0.7291861, 0.7796971, 1.537313, 1, 1, 1, 1, 1,
0.7298042, -0.438237, 2.685125, 1, 1, 1, 1, 1,
0.7375739, 0.8706123, -0.2644678, 1, 1, 1, 1, 1,
0.7434668, 1.053557, 0.686877, 1, 1, 1, 1, 1,
0.7438141, 1.012855, -1.091619, 1, 1, 1, 1, 1,
0.7461697, 0.09227409, 0.7031879, 1, 1, 1, 1, 1,
0.7500893, 1.503708, 0.6113154, 1, 1, 1, 1, 1,
0.7522168, -0.5357103, 2.130297, 1, 1, 1, 1, 1,
0.7620746, 0.8140349, 1.216587, 1, 1, 1, 1, 1,
0.7634462, -0.2515284, 0.5886602, 1, 1, 1, 1, 1,
0.7644722, -0.1209202, 0.3786454, 1, 1, 1, 1, 1,
0.7649118, -1.391432, 2.365721, 1, 1, 1, 1, 1,
0.7731274, 0.2702972, 2.541156, 1, 1, 1, 1, 1,
0.7843772, -1.181238, 1.10232, 1, 1, 1, 1, 1,
0.7847258, -1.468384, 3.578216, 1, 1, 1, 1, 1,
0.7851425, -1.932035, 2.868455, 0, 0, 1, 1, 1,
0.7857233, -1.334365, 2.513441, 1, 0, 0, 1, 1,
0.7859367, 1.528903, 0.7772652, 1, 0, 0, 1, 1,
0.7909671, 1.008158, -0.8667, 1, 0, 0, 1, 1,
0.7935402, 1.971084, -0.9972016, 1, 0, 0, 1, 1,
0.8000969, 2.21785, -0.04861079, 1, 0, 0, 1, 1,
0.8038049, -1.043341, 3.781241, 0, 0, 0, 1, 1,
0.8080934, -0.0231058, -0.5230815, 0, 0, 0, 1, 1,
0.8082152, -1.291656, 1.808402, 0, 0, 0, 1, 1,
0.8094174, 0.3560432, 1.047229, 0, 0, 0, 1, 1,
0.8246373, -1.075947, 4.421893, 0, 0, 0, 1, 1,
0.8246474, 0.5005645, 0.681189, 0, 0, 0, 1, 1,
0.8273768, 0.7442544, 2.125673, 0, 0, 0, 1, 1,
0.8284252, -0.5969077, 2.608795, 1, 1, 1, 1, 1,
0.831744, 0.9231128, 2.937153, 1, 1, 1, 1, 1,
0.839434, -1.633417, 2.380317, 1, 1, 1, 1, 1,
0.8521592, -0.06740969, 1.792138, 1, 1, 1, 1, 1,
0.8592205, 1.345827, -0.09341241, 1, 1, 1, 1, 1,
0.8618593, -0.2845747, 3.16133, 1, 1, 1, 1, 1,
0.8665623, 0.5855088, 1.287958, 1, 1, 1, 1, 1,
0.8760335, 0.3422568, -0.7273835, 1, 1, 1, 1, 1,
0.8768284, -1.43317, 4.080202, 1, 1, 1, 1, 1,
0.8774939, -1.617201, 2.701708, 1, 1, 1, 1, 1,
0.8810437, -0.6780713, 0.815743, 1, 1, 1, 1, 1,
0.883909, 1.051493, -0.4100065, 1, 1, 1, 1, 1,
0.8871379, 1.501917, 0.6739015, 1, 1, 1, 1, 1,
0.8929033, -0.4193636, 0.9323046, 1, 1, 1, 1, 1,
0.8942833, -0.4336638, 2.079391, 1, 1, 1, 1, 1,
0.8959179, -1.295495, 0.253948, 0, 0, 1, 1, 1,
0.8997663, 0.03777405, 1.304101, 1, 0, 0, 1, 1,
0.9032268, -0.5349544, 3.050985, 1, 0, 0, 1, 1,
0.9052562, -0.9176642, 2.177758, 1, 0, 0, 1, 1,
0.9059293, -1.36405, 1.721556, 1, 0, 0, 1, 1,
0.9137661, -1.47805, 4.136653, 1, 0, 0, 1, 1,
0.9143405, -2.03179, 0.8479293, 0, 0, 0, 1, 1,
0.9154503, 0.5840296, -0.8394861, 0, 0, 0, 1, 1,
0.9252312, -0.3937657, 2.116729, 0, 0, 0, 1, 1,
0.9275747, -0.9324303, 2.24555, 0, 0, 0, 1, 1,
0.9280772, 0.4366634, 2.49526, 0, 0, 0, 1, 1,
0.9307464, 0.1065116, 1.90751, 0, 0, 0, 1, 1,
0.9310094, 2.401926, 0.8889922, 0, 0, 0, 1, 1,
0.9312663, 0.4769543, 0.6761767, 1, 1, 1, 1, 1,
0.9342795, 0.1968725, 2.406829, 1, 1, 1, 1, 1,
0.9360186, -1.159859, 2.025554, 1, 1, 1, 1, 1,
0.9380249, -0.6726785, 1.722862, 1, 1, 1, 1, 1,
0.9391949, -1.120507, 3.493559, 1, 1, 1, 1, 1,
0.9402365, -1.187568, 3.284929, 1, 1, 1, 1, 1,
0.940553, -0.3081555, 0.5422629, 1, 1, 1, 1, 1,
0.9414896, 0.4320855, -0.4952811, 1, 1, 1, 1, 1,
0.9426864, 1.693201, -0.2095619, 1, 1, 1, 1, 1,
0.9519915, 0.5369675, 0.8089129, 1, 1, 1, 1, 1,
0.9523584, -0.7457403, 1.002947, 1, 1, 1, 1, 1,
0.9697665, -0.4505881, 3.546114, 1, 1, 1, 1, 1,
0.9700464, 0.4900325, 1.151494, 1, 1, 1, 1, 1,
0.9741246, -0.3269418, 1.821498, 1, 1, 1, 1, 1,
0.9765692, 0.06698363, 1.418382, 1, 1, 1, 1, 1,
0.9777454, 1.716638, 0.1957129, 0, 0, 1, 1, 1,
0.9842119, 0.4668288, 2.188717, 1, 0, 0, 1, 1,
0.9855315, 2.817141, -0.3017347, 1, 0, 0, 1, 1,
0.9882058, -0.2100497, 2.563598, 1, 0, 0, 1, 1,
0.9891285, -2.192217, 2.309364, 1, 0, 0, 1, 1,
0.9917333, 0.479931, 0.1396285, 1, 0, 0, 1, 1,
0.9946268, 0.06167621, 0.9078949, 0, 0, 0, 1, 1,
0.9955762, 1.700831, 1.106001, 0, 0, 0, 1, 1,
0.9972084, 0.8922028, 0.8128376, 0, 0, 0, 1, 1,
1.000761, 0.2716749, 0.6568376, 0, 0, 0, 1, 1,
1.001859, -0.08834642, 3.428401, 0, 0, 0, 1, 1,
1.005397, 1.327696, -0.5862712, 0, 0, 0, 1, 1,
1.011242, -1.627309, 3.272041, 0, 0, 0, 1, 1,
1.016448, 0.151143, 2.226822, 1, 1, 1, 1, 1,
1.019391, -0.02898688, 1.316696, 1, 1, 1, 1, 1,
1.039091, 0.4066556, 2.241669, 1, 1, 1, 1, 1,
1.059157, -1.284735, 1.027069, 1, 1, 1, 1, 1,
1.060253, 1.69263, 1.059258, 1, 1, 1, 1, 1,
1.064652, -0.9737447, 1.965979, 1, 1, 1, 1, 1,
1.066667, -1.095999, 2.176917, 1, 1, 1, 1, 1,
1.068699, 0.8081849, 0.3240306, 1, 1, 1, 1, 1,
1.070896, -0.9250859, 0.4319217, 1, 1, 1, 1, 1,
1.073792, -0.3711687, 1.455566, 1, 1, 1, 1, 1,
1.075342, 0.7012546, 0.901426, 1, 1, 1, 1, 1,
1.078724, 1.517192, 1.420442, 1, 1, 1, 1, 1,
1.079146, -1.557421, 2.421592, 1, 1, 1, 1, 1,
1.09075, 0.6082495, 0.4348639, 1, 1, 1, 1, 1,
1.098848, -0.6273208, 2.45263, 1, 1, 1, 1, 1,
1.108249, 0.9278959, 1.681845, 0, 0, 1, 1, 1,
1.121549, -1.245068, 3.435563, 1, 0, 0, 1, 1,
1.122515, 1.73407, 0.1042376, 1, 0, 0, 1, 1,
1.134574, 0.7627424, 3.27263, 1, 0, 0, 1, 1,
1.143495, 1.315496, 0.9537718, 1, 0, 0, 1, 1,
1.146498, -0.3176679, 2.201404, 1, 0, 0, 1, 1,
1.150546, -0.2333648, 3.593215, 0, 0, 0, 1, 1,
1.158917, -0.384718, 2.01165, 0, 0, 0, 1, 1,
1.159436, 0.5444608, 2.088284, 0, 0, 0, 1, 1,
1.16259, -0.4984222, 1.123951, 0, 0, 0, 1, 1,
1.166261, -1.33597, 2.273907, 0, 0, 0, 1, 1,
1.172826, 0.9568743, 1.008857, 0, 0, 0, 1, 1,
1.176713, -0.8046215, 1.683626, 0, 0, 0, 1, 1,
1.179427, 0.04849765, 0.2664194, 1, 1, 1, 1, 1,
1.181951, 0.1383703, 2.87648, 1, 1, 1, 1, 1,
1.183784, -1.138995, 3.342042, 1, 1, 1, 1, 1,
1.186341, -1.027827, 0.6520831, 1, 1, 1, 1, 1,
1.189271, -0.435019, -0.2290076, 1, 1, 1, 1, 1,
1.191747, 0.1496052, 1.476169, 1, 1, 1, 1, 1,
1.192584, -1.02915, 0.9174342, 1, 1, 1, 1, 1,
1.195004, 0.4999867, 1.010483, 1, 1, 1, 1, 1,
1.200545, 0.3995833, -0.05761279, 1, 1, 1, 1, 1,
1.204614, 1.194753, -0.1564803, 1, 1, 1, 1, 1,
1.215942, -0.5992154, 2.183346, 1, 1, 1, 1, 1,
1.216263, -0.1416389, 2.371586, 1, 1, 1, 1, 1,
1.216531, -0.3278835, 1.613438, 1, 1, 1, 1, 1,
1.217778, 0.3949408, 1.078884, 1, 1, 1, 1, 1,
1.219417, 0.08681045, 1.724112, 1, 1, 1, 1, 1,
1.220015, -0.2082906, 0.5737839, 0, 0, 1, 1, 1,
1.220495, -1.203474, 1.104501, 1, 0, 0, 1, 1,
1.228956, 0.9463947, 0.683139, 1, 0, 0, 1, 1,
1.239426, -1.689236, 3.718818, 1, 0, 0, 1, 1,
1.241567, -0.2589065, 0.66677, 1, 0, 0, 1, 1,
1.257093, 1.065944, -0.8271003, 1, 0, 0, 1, 1,
1.267154, 0.2435353, 2.7119, 0, 0, 0, 1, 1,
1.279644, -1.024277, 3.042794, 0, 0, 0, 1, 1,
1.286397, 1.821665, -0.4671513, 0, 0, 0, 1, 1,
1.286874, 0.4012319, 1.399458, 0, 0, 0, 1, 1,
1.290679, 0.5615011, 1.72644, 0, 0, 0, 1, 1,
1.29294, -1.006356, 2.15721, 0, 0, 0, 1, 1,
1.295437, 1.649571, 0.2771701, 0, 0, 0, 1, 1,
1.312744, -0.3530953, 1.005819, 1, 1, 1, 1, 1,
1.31304, -0.01142645, 2.858449, 1, 1, 1, 1, 1,
1.322812, -1.817813, 2.142555, 1, 1, 1, 1, 1,
1.325458, 1.743714, -0.2361101, 1, 1, 1, 1, 1,
1.326495, -1.44715, 3.369043, 1, 1, 1, 1, 1,
1.339564, 0.0550673, 1.919199, 1, 1, 1, 1, 1,
1.339736, -0.5290143, 2.402611, 1, 1, 1, 1, 1,
1.355953, -1.299118, 3.754992, 1, 1, 1, 1, 1,
1.356492, 1.115413, 0.191025, 1, 1, 1, 1, 1,
1.368786, 0.7934144, 1.244895, 1, 1, 1, 1, 1,
1.372652, -2.033892, 2.674285, 1, 1, 1, 1, 1,
1.375223, 0.06242856, 0.8716696, 1, 1, 1, 1, 1,
1.38234, -0.7204122, 2.235709, 1, 1, 1, 1, 1,
1.391893, 0.4544125, 2.449186, 1, 1, 1, 1, 1,
1.401144, 1.246132, 1.529726, 1, 1, 1, 1, 1,
1.404017, 2.281158, -0.8376243, 0, 0, 1, 1, 1,
1.404176, -0.1414863, 1.112266, 1, 0, 0, 1, 1,
1.408242, 1.066808, 0.8262038, 1, 0, 0, 1, 1,
1.418776, -1.775627, 2.280397, 1, 0, 0, 1, 1,
1.437674, -0.8558412, 2.54826, 1, 0, 0, 1, 1,
1.440639, -1.27651, 1.188352, 1, 0, 0, 1, 1,
1.445273, 0.05401447, 1.839105, 0, 0, 0, 1, 1,
1.44533, 0.5582548, 1.058948, 0, 0, 0, 1, 1,
1.447381, -0.8514072, 2.735856, 0, 0, 0, 1, 1,
1.453477, 0.9766643, 1.245088, 0, 0, 0, 1, 1,
1.461909, 0.07907523, 2.111888, 0, 0, 0, 1, 1,
1.46271, 0.7277289, 1.031128, 0, 0, 0, 1, 1,
1.464305, 0.4992387, 0.4592639, 0, 0, 0, 1, 1,
1.4647, 1.092241, 0.800512, 1, 1, 1, 1, 1,
1.475815, -0.7763138, 2.991575, 1, 1, 1, 1, 1,
1.488661, 0.4643343, -0.0006588067, 1, 1, 1, 1, 1,
1.489564, -0.7146974, 0.732868, 1, 1, 1, 1, 1,
1.491801, -0.6736243, 0.768838, 1, 1, 1, 1, 1,
1.497985, -0.3855252, -0.7801273, 1, 1, 1, 1, 1,
1.500652, 0.5822791, 1.118099, 1, 1, 1, 1, 1,
1.50702, -1.510436, 2.102167, 1, 1, 1, 1, 1,
1.515834, 1.554506, 0.352361, 1, 1, 1, 1, 1,
1.51765, -0.5415367, 4.275167, 1, 1, 1, 1, 1,
1.5393, 0.1584206, 0.1372124, 1, 1, 1, 1, 1,
1.542889, -1.890199, 2.443475, 1, 1, 1, 1, 1,
1.553021, 0.0880017, 1.566836, 1, 1, 1, 1, 1,
1.553554, -1.637663, 3.031207, 1, 1, 1, 1, 1,
1.569047, 0.1917619, 0.469364, 1, 1, 1, 1, 1,
1.575226, -0.6074341, 1.617385, 0, 0, 1, 1, 1,
1.598407, 0.221934, 0.5527942, 1, 0, 0, 1, 1,
1.61364, -0.1048793, 1.836607, 1, 0, 0, 1, 1,
1.629352, -0.2112695, 1.900962, 1, 0, 0, 1, 1,
1.629534, -0.009892012, 2.599713, 1, 0, 0, 1, 1,
1.634719, -0.6214486, 3.665584, 1, 0, 0, 1, 1,
1.647493, -1.032577, 2.730781, 0, 0, 0, 1, 1,
1.656255, -0.3981955, 1.750588, 0, 0, 0, 1, 1,
1.656653, -0.6513013, 0.7041567, 0, 0, 0, 1, 1,
1.662752, 0.9951822, 0.01211907, 0, 0, 0, 1, 1,
1.704919, 1.29607, 0.6955814, 0, 0, 0, 1, 1,
1.709032, -1.321556, 4.274819, 0, 0, 0, 1, 1,
1.730412, 1.606278, 1.115328, 0, 0, 0, 1, 1,
1.747963, 0.5905415, 0.7563362, 1, 1, 1, 1, 1,
1.769494, -0.2133044, 1.817292, 1, 1, 1, 1, 1,
1.816165, 1.285236, 2.072747, 1, 1, 1, 1, 1,
1.82842, -1.127123, 2.579815, 1, 1, 1, 1, 1,
1.830449, -0.5601988, 1.358993, 1, 1, 1, 1, 1,
1.839736, 1.244246, -0.09476882, 1, 1, 1, 1, 1,
1.87755, -0.06380003, 0.4363079, 1, 1, 1, 1, 1,
1.889177, -0.7089673, 1.394054, 1, 1, 1, 1, 1,
1.977092, 2.124748, 0.08778132, 1, 1, 1, 1, 1,
1.988889, -0.7256991, 3.535218, 1, 1, 1, 1, 1,
1.991551, 0.04111962, 1.710396, 1, 1, 1, 1, 1,
1.994933, -1.274345, 0.9575272, 1, 1, 1, 1, 1,
2.005821, 0.6001509, 2.578814, 1, 1, 1, 1, 1,
2.009174, -0.49903, 3.191805, 1, 1, 1, 1, 1,
2.037242, -1.22363, 1.465351, 1, 1, 1, 1, 1,
2.054237, -0.314517, 1.119094, 0, 0, 1, 1, 1,
2.077424, -0.008118686, 2.180606, 1, 0, 0, 1, 1,
2.099739, -0.2393853, 1.168286, 1, 0, 0, 1, 1,
2.108276, 1.614426, 0.6923991, 1, 0, 0, 1, 1,
2.109061, 0.4794984, 0.6212927, 1, 0, 0, 1, 1,
2.119768, 0.3185852, 2.234327, 1, 0, 0, 1, 1,
2.140686, -0.7412001, 2.026588, 0, 0, 0, 1, 1,
2.15519, 0.2426693, 1.768808, 0, 0, 0, 1, 1,
2.165979, 0.6047222, 0.8796165, 0, 0, 0, 1, 1,
2.19608, 0.6233792, 0.0653271, 0, 0, 0, 1, 1,
2.205551, -0.9067486, 2.27903, 0, 0, 0, 1, 1,
2.265965, 1.303032, 1.204297, 0, 0, 0, 1, 1,
2.274971, -1.392308, 2.867036, 0, 0, 0, 1, 1,
2.281125, 2.716665, 1.444896, 1, 1, 1, 1, 1,
2.296729, -0.7889876, 1.054682, 1, 1, 1, 1, 1,
2.318543, -1.699936, 4.900079, 1, 1, 1, 1, 1,
2.327053, -0.4106206, 1.868572, 1, 1, 1, 1, 1,
2.439909, -1.567543, 1.113308, 1, 1, 1, 1, 1,
2.480605, 0.3881213, 2.186599, 1, 1, 1, 1, 1,
3.244093, 1.28684, 1.09124, 1, 1, 1, 1, 1
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
var radius = 9.68891;
var distance = 34.03188;
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
mvMatrix.translate( -0.1112237, 0.19029, -0.3276477 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.03188);
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
