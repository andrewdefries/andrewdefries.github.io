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
-2.756951, -0.5601531, -1.873065, 1, 0, 0, 1,
-2.596231, -0.3758473, -2.070848, 1, 0.007843138, 0, 1,
-2.457054, -0.5972276, -0.7411472, 1, 0.01176471, 0, 1,
-2.346961, -0.3607947, -1.245744, 1, 0.01960784, 0, 1,
-2.30931, 2.000355, -1.372889, 1, 0.02352941, 0, 1,
-2.279345, -0.4084439, -0.5158727, 1, 0.03137255, 0, 1,
-2.242427, -0.8815505, -2.247781, 1, 0.03529412, 0, 1,
-2.219728, 0.2936786, -1.15938, 1, 0.04313726, 0, 1,
-2.214552, -0.38897, -2.797979, 1, 0.04705882, 0, 1,
-2.142045, -0.3462737, -0.3607477, 1, 0.05490196, 0, 1,
-2.139724, -2.022536, -1.561019, 1, 0.05882353, 0, 1,
-2.130601, -0.1763901, -0.9447923, 1, 0.06666667, 0, 1,
-2.12147, 0.5856498, -1.797231, 1, 0.07058824, 0, 1,
-2.056237, 1.754771, -2.324725, 1, 0.07843138, 0, 1,
-2.048639, 0.3055425, 0.01235758, 1, 0.08235294, 0, 1,
-2.048562, -0.6471633, -1.590919, 1, 0.09019608, 0, 1,
-2.009355, 2.309149, 0.8312209, 1, 0.09411765, 0, 1,
-2.007832, 0.5430287, -0.3996611, 1, 0.1019608, 0, 1,
-1.943348, 1.146819, -0.429716, 1, 0.1098039, 0, 1,
-1.928449, 0.5167426, -0.6649061, 1, 0.1137255, 0, 1,
-1.924449, -1.795816, -3.605411, 1, 0.1215686, 0, 1,
-1.901924, 1.630563, -3.01134, 1, 0.1254902, 0, 1,
-1.89731, 0.6666343, -2.309926, 1, 0.1333333, 0, 1,
-1.895947, 2.025102, -1.605573, 1, 0.1372549, 0, 1,
-1.893977, -1.729005, -0.9180161, 1, 0.145098, 0, 1,
-1.869486, 0.6212203, -1.236754, 1, 0.1490196, 0, 1,
-1.83675, 0.170902, -2.988369, 1, 0.1568628, 0, 1,
-1.832037, 0.4377076, -2.188239, 1, 0.1607843, 0, 1,
-1.826171, -0.1226665, -1.150629, 1, 0.1686275, 0, 1,
-1.81797, 0.5771482, -1.654658, 1, 0.172549, 0, 1,
-1.813043, 1.417803, -1.229005, 1, 0.1803922, 0, 1,
-1.812976, 0.2113369, -2.402115, 1, 0.1843137, 0, 1,
-1.768143, -0.4411059, -0.4523333, 1, 0.1921569, 0, 1,
-1.76543, 1.272319, -2.141557, 1, 0.1960784, 0, 1,
-1.752201, 0.3324528, -2.258417, 1, 0.2039216, 0, 1,
-1.722917, 0.1519633, -0.9602857, 1, 0.2117647, 0, 1,
-1.721258, 0.1197088, -2.649517, 1, 0.2156863, 0, 1,
-1.708984, -0.003555457, -3.596606, 1, 0.2235294, 0, 1,
-1.707981, -1.623462, -3.39919, 1, 0.227451, 0, 1,
-1.70563, 1.715099, -0.4208259, 1, 0.2352941, 0, 1,
-1.690963, -0.7745299, -1.239003, 1, 0.2392157, 0, 1,
-1.681587, 0.3569889, -1.752548, 1, 0.2470588, 0, 1,
-1.676974, 0.1434711, -1.906533, 1, 0.2509804, 0, 1,
-1.633812, -0.09315965, -0.6931641, 1, 0.2588235, 0, 1,
-1.61215, -1.005316, -2.358935, 1, 0.2627451, 0, 1,
-1.608491, -0.6692462, -1.266937, 1, 0.2705882, 0, 1,
-1.600765, -1.145814, -2.035091, 1, 0.2745098, 0, 1,
-1.594289, -0.3798425, -3.462275, 1, 0.282353, 0, 1,
-1.586094, -0.2065201, -3.378932, 1, 0.2862745, 0, 1,
-1.576321, 0.2197539, -2.031304, 1, 0.2941177, 0, 1,
-1.572123, 0.08945916, -1.638013, 1, 0.3019608, 0, 1,
-1.563215, 0.1322359, -1.057688, 1, 0.3058824, 0, 1,
-1.558982, -0.7399344, -2.717394, 1, 0.3137255, 0, 1,
-1.55461, 0.193864, -1.216794, 1, 0.3176471, 0, 1,
-1.530048, 1.120394, -0.7192543, 1, 0.3254902, 0, 1,
-1.519838, 1.676386, -1.007921, 1, 0.3294118, 0, 1,
-1.514345, 0.3908598, -1.107039, 1, 0.3372549, 0, 1,
-1.512405, 0.4888795, -0.637531, 1, 0.3411765, 0, 1,
-1.511667, -1.889096, -3.395651, 1, 0.3490196, 0, 1,
-1.50059, -1.833373, -1.161964, 1, 0.3529412, 0, 1,
-1.491912, 0.5298651, -1.798069, 1, 0.3607843, 0, 1,
-1.491232, -0.3976554, -1.382028, 1, 0.3647059, 0, 1,
-1.482545, -1.019833, -1.17818, 1, 0.372549, 0, 1,
-1.468888, 1.505373, -0.5089293, 1, 0.3764706, 0, 1,
-1.464436, -1.75601, -3.178862, 1, 0.3843137, 0, 1,
-1.456192, -0.5029784, -0.07381213, 1, 0.3882353, 0, 1,
-1.454676, -1.188624, -3.786009, 1, 0.3960784, 0, 1,
-1.442742, -1.487633, -2.044619, 1, 0.4039216, 0, 1,
-1.432084, -1.492256, -0.7150088, 1, 0.4078431, 0, 1,
-1.427874, 0.5817362, -1.268663, 1, 0.4156863, 0, 1,
-1.423839, -1.502367, -1.60429, 1, 0.4196078, 0, 1,
-1.414946, 0.1306705, -3.376835, 1, 0.427451, 0, 1,
-1.413803, 0.4413371, -2.255826, 1, 0.4313726, 0, 1,
-1.411549, 1.364111, -0.4182457, 1, 0.4392157, 0, 1,
-1.409647, -0.8688993, -3.085606, 1, 0.4431373, 0, 1,
-1.39677, -0.7415547, -2.847542, 1, 0.4509804, 0, 1,
-1.388684, -2.610438, -2.647144, 1, 0.454902, 0, 1,
-1.387849, 0.4978855, -1.723992, 1, 0.4627451, 0, 1,
-1.385472, -0.8702745, -1.249634, 1, 0.4666667, 0, 1,
-1.375124, 1.401513, 0.5542661, 1, 0.4745098, 0, 1,
-1.358836, -0.3286075, -2.799709, 1, 0.4784314, 0, 1,
-1.350876, -0.6666235, -0.5076026, 1, 0.4862745, 0, 1,
-1.350112, 0.2389214, -1.934443, 1, 0.4901961, 0, 1,
-1.343678, 0.04818869, -2.963531, 1, 0.4980392, 0, 1,
-1.341782, 0.6669623, -0.1773065, 1, 0.5058824, 0, 1,
-1.327752, -0.2563564, -2.752204, 1, 0.509804, 0, 1,
-1.315115, 1.685462, -1.08778, 1, 0.5176471, 0, 1,
-1.314426, 0.5241212, -0.4298891, 1, 0.5215687, 0, 1,
-1.313762, 0.6997948, 0.2178898, 1, 0.5294118, 0, 1,
-1.293893, -0.04878183, -0.8518245, 1, 0.5333334, 0, 1,
-1.290505, -0.5301477, -1.951472, 1, 0.5411765, 0, 1,
-1.284874, 0.7874053, -2.47471, 1, 0.5450981, 0, 1,
-1.276694, 0.16342, -0.8301194, 1, 0.5529412, 0, 1,
-1.26803, -0.5248646, -0.6460471, 1, 0.5568628, 0, 1,
-1.263611, 0.7467672, -2.497291, 1, 0.5647059, 0, 1,
-1.247604, 1.4947, -2.081882, 1, 0.5686275, 0, 1,
-1.217661, -0.5053666, -2.053044, 1, 0.5764706, 0, 1,
-1.216184, -0.7424904, -1.669599, 1, 0.5803922, 0, 1,
-1.215917, -0.1580311, -1.13716, 1, 0.5882353, 0, 1,
-1.204998, 1.235925, -1.331502, 1, 0.5921569, 0, 1,
-1.203074, -0.136085, -2.249378, 1, 0.6, 0, 1,
-1.199703, 0.5964249, -0.2900664, 1, 0.6078432, 0, 1,
-1.164481, -1.153058, -2.277179, 1, 0.6117647, 0, 1,
-1.161416, 1.105791, 0.9149895, 1, 0.6196079, 0, 1,
-1.149604, -1.334423, -2.676571, 1, 0.6235294, 0, 1,
-1.149264, 0.1874278, -1.66837, 1, 0.6313726, 0, 1,
-1.139498, -1.733142, -3.568545, 1, 0.6352941, 0, 1,
-1.136905, -0.2412948, -0.1650789, 1, 0.6431373, 0, 1,
-1.12507, 0.266834, -1.467522, 1, 0.6470588, 0, 1,
-1.123549, -1.058204, -3.927564, 1, 0.654902, 0, 1,
-1.119226, 0.7066965, -0.05993684, 1, 0.6588235, 0, 1,
-1.116796, -0.2550942, -1.725622, 1, 0.6666667, 0, 1,
-1.113514, -0.250872, -1.132926, 1, 0.6705883, 0, 1,
-1.113465, -0.1991047, -3.379901, 1, 0.6784314, 0, 1,
-1.108851, 0.3013861, -1.152756, 1, 0.682353, 0, 1,
-1.107771, -0.5476198, -3.008499, 1, 0.6901961, 0, 1,
-1.101556, 1.268632, -1.425124, 1, 0.6941177, 0, 1,
-1.093765, 0.5244168, -0.03983183, 1, 0.7019608, 0, 1,
-1.092191, -0.298375, -0.2358431, 1, 0.7098039, 0, 1,
-1.091237, -0.1328811, -1.019177, 1, 0.7137255, 0, 1,
-1.090081, -2.38635, -1.781289, 1, 0.7215686, 0, 1,
-1.087978, 1.591525, 0.4695383, 1, 0.7254902, 0, 1,
-1.086929, -2.333534, -3.419052, 1, 0.7333333, 0, 1,
-1.08502, -0.3714312, -0.4859311, 1, 0.7372549, 0, 1,
-1.07831, 0.3808644, -2.596901, 1, 0.7450981, 0, 1,
-1.075333, 0.8910971, 0.38627, 1, 0.7490196, 0, 1,
-1.067745, 1.005296, -0.3474723, 1, 0.7568628, 0, 1,
-1.060554, 0.1500758, -2.89535, 1, 0.7607843, 0, 1,
-1.0549, -1.903823, -2.588396, 1, 0.7686275, 0, 1,
-1.053683, -1.094014, -3.794951, 1, 0.772549, 0, 1,
-1.050918, -1.301066, -2.671596, 1, 0.7803922, 0, 1,
-1.048824, 0.5254419, -0.6437737, 1, 0.7843137, 0, 1,
-1.045474, -0.1689903, -2.107243, 1, 0.7921569, 0, 1,
-1.041886, -0.3678113, -2.372875, 1, 0.7960784, 0, 1,
-1.040592, -0.2742797, -1.454096, 1, 0.8039216, 0, 1,
-1.039842, 0.3667608, -1.614621, 1, 0.8117647, 0, 1,
-1.039764, 0.3260559, -2.180679, 1, 0.8156863, 0, 1,
-1.03169, -0.4421512, -2.119119, 1, 0.8235294, 0, 1,
-1.030429, 0.8055934, -2.237167, 1, 0.827451, 0, 1,
-1.029877, -1.310181, -2.63764, 1, 0.8352941, 0, 1,
-1.027017, 0.3938586, -1.170174, 1, 0.8392157, 0, 1,
-1.024089, 1.460146, -1.17677, 1, 0.8470588, 0, 1,
-1.009673, 3.158757, -0.2494487, 1, 0.8509804, 0, 1,
-1.00866, 0.3028908, -0.8832092, 1, 0.8588235, 0, 1,
-1.00276, -0.3646085, -3.19375, 1, 0.8627451, 0, 1,
-0.9943604, -2.341849, -3.166671, 1, 0.8705882, 0, 1,
-0.9867283, -2.054726, -2.331487, 1, 0.8745098, 0, 1,
-0.9855162, -1.425308, -1.663705, 1, 0.8823529, 0, 1,
-0.9848625, -0.4119759, -0.9794599, 1, 0.8862745, 0, 1,
-0.981795, 0.541878, -2.688712, 1, 0.8941177, 0, 1,
-0.9803712, -0.2752135, -1.386953, 1, 0.8980392, 0, 1,
-0.9764528, -0.3609611, -1.653516, 1, 0.9058824, 0, 1,
-0.9701282, 0.1626427, -2.523444, 1, 0.9137255, 0, 1,
-0.9691435, -0.7513878, -0.4953917, 1, 0.9176471, 0, 1,
-0.9673219, -0.01818551, -1.415822, 1, 0.9254902, 0, 1,
-0.9626836, 2.623959, 0.01127478, 1, 0.9294118, 0, 1,
-0.960722, 1.486766, -1.409346, 1, 0.9372549, 0, 1,
-0.9592553, -0.258039, -2.173746, 1, 0.9411765, 0, 1,
-0.9575346, 0.6329508, -1.898729, 1, 0.9490196, 0, 1,
-0.9561269, 2.981997, -1.052395, 1, 0.9529412, 0, 1,
-0.9505121, 0.8487214, -1.669464, 1, 0.9607843, 0, 1,
-0.9447457, -0.8807003, -3.352448, 1, 0.9647059, 0, 1,
-0.9407795, 0.6877782, 0.8048029, 1, 0.972549, 0, 1,
-0.9407175, -1.057863, -2.586701, 1, 0.9764706, 0, 1,
-0.9377556, -1.647697, 1.080765, 1, 0.9843137, 0, 1,
-0.9369884, 0.3544164, -2.547647, 1, 0.9882353, 0, 1,
-0.9281645, -0.9404401, -1.516605, 1, 0.9960784, 0, 1,
-0.9244387, 0.03682049, -1.435562, 0.9960784, 1, 0, 1,
-0.913132, -0.3916406, -3.664093, 0.9921569, 1, 0, 1,
-0.9082421, -0.07867704, -0.5569372, 0.9843137, 1, 0, 1,
-0.9047522, -0.01483977, -1.752121, 0.9803922, 1, 0, 1,
-0.9037614, 0.1496147, -2.546416, 0.972549, 1, 0, 1,
-0.9014302, 0.3016689, -1.025871, 0.9686275, 1, 0, 1,
-0.9012895, 0.4960424, -2.478638, 0.9607843, 1, 0, 1,
-0.8973867, -1.913085, -3.044376, 0.9568627, 1, 0, 1,
-0.8925546, -0.1468181, -3.371114, 0.9490196, 1, 0, 1,
-0.8913574, 0.2877035, -1.157868, 0.945098, 1, 0, 1,
-0.8875675, 3.242957, -0.2198193, 0.9372549, 1, 0, 1,
-0.8814946, -0.6542712, -3.563626, 0.9333333, 1, 0, 1,
-0.8635015, 0.5656875, 0.9947824, 0.9254902, 1, 0, 1,
-0.8609869, -0.5524951, -1.630592, 0.9215686, 1, 0, 1,
-0.8601187, 0.9444526, -1.50834, 0.9137255, 1, 0, 1,
-0.8564337, 1.30729, -0.3379706, 0.9098039, 1, 0, 1,
-0.8559024, -0.7869511, -1.405817, 0.9019608, 1, 0, 1,
-0.8548277, 0.9643764, -1.023882, 0.8941177, 1, 0, 1,
-0.8547513, -1.518592, -3.005315, 0.8901961, 1, 0, 1,
-0.8445783, 1.557976, -1.781677, 0.8823529, 1, 0, 1,
-0.8445131, -0.7628224, -2.14381, 0.8784314, 1, 0, 1,
-0.8414461, -1.135944, -2.097776, 0.8705882, 1, 0, 1,
-0.8327585, 0.8802141, 1.078363, 0.8666667, 1, 0, 1,
-0.8323036, 1.661341, -1.497655, 0.8588235, 1, 0, 1,
-0.830238, 0.6698068, 0.1395696, 0.854902, 1, 0, 1,
-0.8273159, 0.2086726, -0.747857, 0.8470588, 1, 0, 1,
-0.8260456, 0.2587913, -0.7477268, 0.8431373, 1, 0, 1,
-0.8237344, 0.6773693, -0.7523277, 0.8352941, 1, 0, 1,
-0.8214912, 0.2075386, -2.120408, 0.8313726, 1, 0, 1,
-0.8209688, -0.4671807, -3.261401, 0.8235294, 1, 0, 1,
-0.8151317, -1.47793, -3.506067, 0.8196079, 1, 0, 1,
-0.8141539, 0.06018995, -1.771686, 0.8117647, 1, 0, 1,
-0.8136418, -0.2196606, -3.601842, 0.8078431, 1, 0, 1,
-0.8135602, -0.5601514, -2.164069, 0.8, 1, 0, 1,
-0.8133841, -0.8584991, -2.058011, 0.7921569, 1, 0, 1,
-0.8098632, -1.942608, -2.360588, 0.7882353, 1, 0, 1,
-0.8071729, -0.2918751, -1.467334, 0.7803922, 1, 0, 1,
-0.8056152, -1.007163, -1.622893, 0.7764706, 1, 0, 1,
-0.8006908, -0.7696838, -3.96238, 0.7686275, 1, 0, 1,
-0.7977046, -0.9105509, -2.010144, 0.7647059, 1, 0, 1,
-0.7959285, -0.3796912, -3.518007, 0.7568628, 1, 0, 1,
-0.7948777, 0.1981952, -0.8493262, 0.7529412, 1, 0, 1,
-0.7902838, 0.5487307, 1.106717, 0.7450981, 1, 0, 1,
-0.7889429, 0.7301521, -0.8394536, 0.7411765, 1, 0, 1,
-0.7859354, -0.8051169, -0.6146156, 0.7333333, 1, 0, 1,
-0.7797033, 1.437949, 1.559955, 0.7294118, 1, 0, 1,
-0.7796378, 0.1456405, -0.2457116, 0.7215686, 1, 0, 1,
-0.7773166, 0.1467228, -1.625665, 0.7176471, 1, 0, 1,
-0.7659713, -1.168967, -2.09521, 0.7098039, 1, 0, 1,
-0.7613052, 2.922533, -0.4687705, 0.7058824, 1, 0, 1,
-0.7590489, 0.8840562, -1.115017, 0.6980392, 1, 0, 1,
-0.7573639, 0.8490898, 0.1462843, 0.6901961, 1, 0, 1,
-0.755421, 0.9730054, -1.226278, 0.6862745, 1, 0, 1,
-0.7538584, 1.022096, -1.181862, 0.6784314, 1, 0, 1,
-0.7478552, 0.3667462, -1.667109, 0.6745098, 1, 0, 1,
-0.7441111, 0.9572656, 0.02348866, 0.6666667, 1, 0, 1,
-0.7402336, 0.3185162, -2.230795, 0.6627451, 1, 0, 1,
-0.7398, -1.691818, -2.687488, 0.654902, 1, 0, 1,
-0.7381282, 0.423305, -1.859504, 0.6509804, 1, 0, 1,
-0.7340725, 1.000949, 0.6939595, 0.6431373, 1, 0, 1,
-0.7315633, -0.8987241, -2.441778, 0.6392157, 1, 0, 1,
-0.7314491, -1.126592, -3.845702, 0.6313726, 1, 0, 1,
-0.7291197, 0.295158, -0.1669721, 0.627451, 1, 0, 1,
-0.7264021, 1.884663, -0.1540185, 0.6196079, 1, 0, 1,
-0.7262972, 0.4666254, -0.2099484, 0.6156863, 1, 0, 1,
-0.7219754, -0.6003326, -1.519277, 0.6078432, 1, 0, 1,
-0.7211648, -0.4801719, -2.922764, 0.6039216, 1, 0, 1,
-0.7156402, -1.085198, -2.238366, 0.5960785, 1, 0, 1,
-0.7123993, 0.6561773, -1.552186, 0.5882353, 1, 0, 1,
-0.7058226, -2.399651, -1.402893, 0.5843138, 1, 0, 1,
-0.705114, -0.6194766, -3.438643, 0.5764706, 1, 0, 1,
-0.7043976, -1.507984, -1.923982, 0.572549, 1, 0, 1,
-0.7004846, -0.5106517, -2.475339, 0.5647059, 1, 0, 1,
-0.6965081, 0.9254196, -1.308367, 0.5607843, 1, 0, 1,
-0.6956345, -0.252034, -2.351253, 0.5529412, 1, 0, 1,
-0.6857074, -0.7737315, -2.874496, 0.5490196, 1, 0, 1,
-0.6846936, -0.9886312, -1.801101, 0.5411765, 1, 0, 1,
-0.6846377, -0.8746676, -3.923105, 0.5372549, 1, 0, 1,
-0.6831178, -0.364, -2.580457, 0.5294118, 1, 0, 1,
-0.6819393, 0.7867209, 0.05615699, 0.5254902, 1, 0, 1,
-0.6773529, -0.2694502, -0.4681148, 0.5176471, 1, 0, 1,
-0.6717596, -0.7863421, -0.7592361, 0.5137255, 1, 0, 1,
-0.6689982, 0.01310848, -1.202544, 0.5058824, 1, 0, 1,
-0.6682004, 0.03798136, -0.2657492, 0.5019608, 1, 0, 1,
-0.6658306, -1.336171, -3.573981, 0.4941176, 1, 0, 1,
-0.6598898, 0.7820024, -1.95399, 0.4862745, 1, 0, 1,
-0.6535478, -0.3762318, -2.499427, 0.4823529, 1, 0, 1,
-0.6486726, -2.089483, -5.137518, 0.4745098, 1, 0, 1,
-0.6435318, -0.8135744, -2.811274, 0.4705882, 1, 0, 1,
-0.6434341, 0.5728323, -0.5793422, 0.4627451, 1, 0, 1,
-0.6289533, 0.9213561, -0.08906927, 0.4588235, 1, 0, 1,
-0.6257076, -0.6597146, -1.1992, 0.4509804, 1, 0, 1,
-0.6206827, -0.4369979, -1.997249, 0.4470588, 1, 0, 1,
-0.6144507, 0.6862393, 0.2798824, 0.4392157, 1, 0, 1,
-0.6124877, -0.392035, -1.778318, 0.4352941, 1, 0, 1,
-0.6122367, -1.706659, -1.505689, 0.427451, 1, 0, 1,
-0.6118648, -0.3074036, -1.241512, 0.4235294, 1, 0, 1,
-0.6094204, 0.3031673, -2.239859, 0.4156863, 1, 0, 1,
-0.608894, -0.9548147, -2.232683, 0.4117647, 1, 0, 1,
-0.6082583, 0.09306933, -1.881571, 0.4039216, 1, 0, 1,
-0.5937301, -0.4497198, -3.019321, 0.3960784, 1, 0, 1,
-0.5925224, -0.8293936, -2.016476, 0.3921569, 1, 0, 1,
-0.5804498, 0.589452, -2.178293, 0.3843137, 1, 0, 1,
-0.5767741, 0.4863918, -0.6068198, 0.3803922, 1, 0, 1,
-0.5737044, -0.5479701, -1.205696, 0.372549, 1, 0, 1,
-0.5732199, -0.606065, -1.42712, 0.3686275, 1, 0, 1,
-0.5729113, 0.2158403, -2.947739, 0.3607843, 1, 0, 1,
-0.5704473, 0.1206435, -0.4716626, 0.3568628, 1, 0, 1,
-0.5697229, -1.533513, -4.541655, 0.3490196, 1, 0, 1,
-0.5664, 0.1123208, -1.00313, 0.345098, 1, 0, 1,
-0.5649007, -0.3821829, -1.898695, 0.3372549, 1, 0, 1,
-0.5622778, -0.9811105, -1.263258, 0.3333333, 1, 0, 1,
-0.5585948, 0.4339305, -0.6701781, 0.3254902, 1, 0, 1,
-0.5584079, 0.04608504, 0.3328251, 0.3215686, 1, 0, 1,
-0.5548087, 1.438858, 1.27216, 0.3137255, 1, 0, 1,
-0.5546973, -0.37807, -0.2965561, 0.3098039, 1, 0, 1,
-0.5541224, -0.9891973, -0.8254044, 0.3019608, 1, 0, 1,
-0.5497535, 0.7875463, -0.6716734, 0.2941177, 1, 0, 1,
-0.5489894, 0.2998714, -0.97794, 0.2901961, 1, 0, 1,
-0.5423809, -0.3360625, -2.502306, 0.282353, 1, 0, 1,
-0.5408918, 0.008755606, -0.06241312, 0.2784314, 1, 0, 1,
-0.5386308, 0.3113842, -0.7661439, 0.2705882, 1, 0, 1,
-0.5385125, -1.759698, -2.768788, 0.2666667, 1, 0, 1,
-0.5366466, -2.066657, -2.657458, 0.2588235, 1, 0, 1,
-0.5346418, 1.060342, 0.7684176, 0.254902, 1, 0, 1,
-0.5342569, 0.2151206, -1.47883, 0.2470588, 1, 0, 1,
-0.5327892, -0.461759, -2.821513, 0.2431373, 1, 0, 1,
-0.5312281, 0.7906907, -0.7608023, 0.2352941, 1, 0, 1,
-0.5291849, 0.0450649, -1.374385, 0.2313726, 1, 0, 1,
-0.5281154, 0.2581062, -1.223994, 0.2235294, 1, 0, 1,
-0.5239252, 1.802344, -0.1480858, 0.2196078, 1, 0, 1,
-0.5214826, 0.06413121, -1.508246, 0.2117647, 1, 0, 1,
-0.5186751, 0.4535803, 0.3263853, 0.2078431, 1, 0, 1,
-0.5184784, -0.8887787, -3.542693, 0.2, 1, 0, 1,
-0.5176061, 0.5110051, 0.0854521, 0.1921569, 1, 0, 1,
-0.5159603, -0.2290184, -2.77364, 0.1882353, 1, 0, 1,
-0.5122787, 0.2551767, -1.673666, 0.1803922, 1, 0, 1,
-0.5084645, 0.3706069, -2.206561, 0.1764706, 1, 0, 1,
-0.507821, 0.351597, -2.053993, 0.1686275, 1, 0, 1,
-0.5068425, -1.246195, -1.995483, 0.1647059, 1, 0, 1,
-0.5064767, -1.879275, -2.918439, 0.1568628, 1, 0, 1,
-0.5056406, -0.5366289, -2.770178, 0.1529412, 1, 0, 1,
-0.499763, 0.6240147, -1.412715, 0.145098, 1, 0, 1,
-0.4992678, -0.1066252, -2.905924, 0.1411765, 1, 0, 1,
-0.493766, -0.07397656, -1.302544, 0.1333333, 1, 0, 1,
-0.4924381, 2.122633, -0.4263284, 0.1294118, 1, 0, 1,
-0.4923909, -1.832476, -2.189085, 0.1215686, 1, 0, 1,
-0.4851218, -0.6851525, -4.757609, 0.1176471, 1, 0, 1,
-0.4842447, 0.3515686, 0.3444427, 0.1098039, 1, 0, 1,
-0.4809671, 0.1470811, -1.005558, 0.1058824, 1, 0, 1,
-0.476581, 1.273275, 0.4062538, 0.09803922, 1, 0, 1,
-0.4738526, -1.131558, -4.264878, 0.09019608, 1, 0, 1,
-0.462403, -0.6889088, -2.580561, 0.08627451, 1, 0, 1,
-0.4584583, 0.1824371, 0.4828328, 0.07843138, 1, 0, 1,
-0.4577047, 1.700678, -0.2703364, 0.07450981, 1, 0, 1,
-0.4571453, -0.5924756, -3.880457, 0.06666667, 1, 0, 1,
-0.4567839, -0.3314309, -0.1561897, 0.0627451, 1, 0, 1,
-0.4557665, -0.2497223, -0.5124737, 0.05490196, 1, 0, 1,
-0.4555084, -0.1000382, -1.328948, 0.05098039, 1, 0, 1,
-0.4546596, 0.5414652, 0.4977985, 0.04313726, 1, 0, 1,
-0.4531426, -1.583304, -2.069902, 0.03921569, 1, 0, 1,
-0.4502997, 0.5986291, -1.080758, 0.03137255, 1, 0, 1,
-0.4485249, -1.057777, -4.863826, 0.02745098, 1, 0, 1,
-0.4481231, 0.244003, 0.142486, 0.01960784, 1, 0, 1,
-0.4445611, 0.1901862, -0.8125804, 0.01568628, 1, 0, 1,
-0.4438274, -0.3957593, -2.666398, 0.007843138, 1, 0, 1,
-0.4436517, 0.1711817, -0.5265543, 0.003921569, 1, 0, 1,
-0.4415202, -1.3722, -1.902518, 0, 1, 0.003921569, 1,
-0.4338583, 0.7945264, -0.1637298, 0, 1, 0.01176471, 1,
-0.4335189, 2.535232, 0.1973197, 0, 1, 0.01568628, 1,
-0.4298226, 1.020995, -0.006038425, 0, 1, 0.02352941, 1,
-0.4297855, -0.264406, -0.9615375, 0, 1, 0.02745098, 1,
-0.425725, -0.3331971, -2.471167, 0, 1, 0.03529412, 1,
-0.4218131, -0.5590097, -3.172656, 0, 1, 0.03921569, 1,
-0.4163784, -0.8305386, -3.341236, 0, 1, 0.04705882, 1,
-0.4162748, -0.1019286, -1.184167, 0, 1, 0.05098039, 1,
-0.4039015, -0.6029526, -1.766227, 0, 1, 0.05882353, 1,
-0.4037505, 1.342337, -0.1173711, 0, 1, 0.0627451, 1,
-0.3992485, -0.1453945, -2.254613, 0, 1, 0.07058824, 1,
-0.3979183, -1.0477, -2.183042, 0, 1, 0.07450981, 1,
-0.3960381, -0.4129, -2.41718, 0, 1, 0.08235294, 1,
-0.3937081, 0.1162274, -2.510126, 0, 1, 0.08627451, 1,
-0.3902004, 0.1620045, -2.914783, 0, 1, 0.09411765, 1,
-0.3884216, 1.073064, -1.190999, 0, 1, 0.1019608, 1,
-0.3882856, -1.460864, -1.839018, 0, 1, 0.1058824, 1,
-0.3855475, -0.06580215, -2.044588, 0, 1, 0.1137255, 1,
-0.3838858, 0.8660119, 0.930012, 0, 1, 0.1176471, 1,
-0.3835563, 1.146317, -0.4739738, 0, 1, 0.1254902, 1,
-0.3799199, 1.103371, -1.443365, 0, 1, 0.1294118, 1,
-0.3793749, -0.2552472, -2.780344, 0, 1, 0.1372549, 1,
-0.3761092, 1.504122, 1.031977, 0, 1, 0.1411765, 1,
-0.3730995, -0.3457704, -3.447592, 0, 1, 0.1490196, 1,
-0.3693102, 0.5207918, -0.3122801, 0, 1, 0.1529412, 1,
-0.3686447, -0.6990205, -4.205312, 0, 1, 0.1607843, 1,
-0.3682316, 1.120415, -0.8477094, 0, 1, 0.1647059, 1,
-0.3675617, -0.3417687, -3.90312, 0, 1, 0.172549, 1,
-0.3656032, 0.2819432, -2.45977, 0, 1, 0.1764706, 1,
-0.3652227, -1.086807, -3.599586, 0, 1, 0.1843137, 1,
-0.3628581, 0.4694179, -1.33593, 0, 1, 0.1882353, 1,
-0.3615348, -1.181975, -2.345926, 0, 1, 0.1960784, 1,
-0.3571387, -0.4096614, -1.90677, 0, 1, 0.2039216, 1,
-0.3523647, -0.3317941, -0.1753055, 0, 1, 0.2078431, 1,
-0.3496971, 0.2922208, 0.9603754, 0, 1, 0.2156863, 1,
-0.3468167, -1.449986, -2.202032, 0, 1, 0.2196078, 1,
-0.3438195, 0.5729201, 0.1616067, 0, 1, 0.227451, 1,
-0.3423872, -1.381675, -0.3461436, 0, 1, 0.2313726, 1,
-0.341992, -0.7204337, -1.040705, 0, 1, 0.2392157, 1,
-0.3378781, -1.093432, -2.772614, 0, 1, 0.2431373, 1,
-0.3342927, 1.386151, 0.2017707, 0, 1, 0.2509804, 1,
-0.3329872, -2.837885, -3.482865, 0, 1, 0.254902, 1,
-0.3321787, 0.5359753, -0.2201381, 0, 1, 0.2627451, 1,
-0.330211, -2.193141, -1.599385, 0, 1, 0.2666667, 1,
-0.3250631, -0.6943455, -3.185726, 0, 1, 0.2745098, 1,
-0.3245497, 2.203814, -0.665701, 0, 1, 0.2784314, 1,
-0.3216621, -0.2003071, -2.562141, 0, 1, 0.2862745, 1,
-0.3210082, 0.3500797, 1.010721, 0, 1, 0.2901961, 1,
-0.3202477, 1.042809, -0.3832101, 0, 1, 0.2980392, 1,
-0.3187394, -0.7972379, -4.070083, 0, 1, 0.3058824, 1,
-0.3132591, 1.646264, -1.049564, 0, 1, 0.3098039, 1,
-0.3126134, -0.4553886, -2.247256, 0, 1, 0.3176471, 1,
-0.3105363, -0.07200792, -2.603143, 0, 1, 0.3215686, 1,
-0.3103257, -0.3262851, -1.076594, 0, 1, 0.3294118, 1,
-0.3054156, -0.5879127, -1.811606, 0, 1, 0.3333333, 1,
-0.3053921, 0.8586421, -1.91987, 0, 1, 0.3411765, 1,
-0.2988538, 0.07207154, -2.25471, 0, 1, 0.345098, 1,
-0.2934327, -0.4151225, -1.478591, 0, 1, 0.3529412, 1,
-0.2906123, 0.6247211, -1.64253, 0, 1, 0.3568628, 1,
-0.2885304, 1.525877, -1.468967, 0, 1, 0.3647059, 1,
-0.285791, 2.030375, -0.608928, 0, 1, 0.3686275, 1,
-0.2831575, -0.1651239, -2.128171, 0, 1, 0.3764706, 1,
-0.2776819, -1.043193, -3.073457, 0, 1, 0.3803922, 1,
-0.2760087, -1.138347, -3.548302, 0, 1, 0.3882353, 1,
-0.2743472, 0.7845782, -2.079254, 0, 1, 0.3921569, 1,
-0.2695684, -0.4693758, -1.821661, 0, 1, 0.4, 1,
-0.259237, 0.7328711, -0.6320207, 0, 1, 0.4078431, 1,
-0.2590584, 1.139081, -0.004031541, 0, 1, 0.4117647, 1,
-0.255845, 0.8252741, -0.01636473, 0, 1, 0.4196078, 1,
-0.2549894, 0.8256023, -1.970828, 0, 1, 0.4235294, 1,
-0.2506599, -0.3529597, -2.511748, 0, 1, 0.4313726, 1,
-0.2494724, 0.6079597, -0.3732651, 0, 1, 0.4352941, 1,
-0.2488516, -0.6936874, -3.207249, 0, 1, 0.4431373, 1,
-0.2476735, 0.2372958, -1.573102, 0, 1, 0.4470588, 1,
-0.2469204, -0.4245344, -2.52242, 0, 1, 0.454902, 1,
-0.2455653, 1.158373, -1.62814, 0, 1, 0.4588235, 1,
-0.2450794, 1.867994, -0.7613093, 0, 1, 0.4666667, 1,
-0.2422615, 1.882951, -0.9878447, 0, 1, 0.4705882, 1,
-0.2417963, 1.55424, 0.4445947, 0, 1, 0.4784314, 1,
-0.2394558, -0.6947744, -1.739638, 0, 1, 0.4823529, 1,
-0.2371539, -0.3797837, -3.549368, 0, 1, 0.4901961, 1,
-0.2357351, -0.6272857, -4.200917, 0, 1, 0.4941176, 1,
-0.2346396, -1.200837, -5.180634, 0, 1, 0.5019608, 1,
-0.2306908, -0.06782949, -1.479154, 0, 1, 0.509804, 1,
-0.2294688, -0.8510848, -2.76909, 0, 1, 0.5137255, 1,
-0.229376, 0.1878916, -1.070346, 0, 1, 0.5215687, 1,
-0.2247985, -0.05661162, -2.889485, 0, 1, 0.5254902, 1,
-0.2224152, 0.6335639, 1.10043, 0, 1, 0.5333334, 1,
-0.2194506, -0.482823, -3.686192, 0, 1, 0.5372549, 1,
-0.2193067, 2.431799, -0.40715, 0, 1, 0.5450981, 1,
-0.2190098, -1.105631, -2.571873, 0, 1, 0.5490196, 1,
-0.2187214, 0.4320862, -0.8324966, 0, 1, 0.5568628, 1,
-0.2166708, 0.5816088, -0.5916576, 0, 1, 0.5607843, 1,
-0.2138851, -0.6681243, -3.943182, 0, 1, 0.5686275, 1,
-0.2132153, 0.1181084, -3.731268, 0, 1, 0.572549, 1,
-0.2130008, 0.280361, -2.293059, 0, 1, 0.5803922, 1,
-0.2086269, 2.289217, 1.105177, 0, 1, 0.5843138, 1,
-0.2084747, 1.057478, -0.3324555, 0, 1, 0.5921569, 1,
-0.2050183, -0.02146892, -1.991283, 0, 1, 0.5960785, 1,
-0.204936, -0.9238901, -2.973538, 0, 1, 0.6039216, 1,
-0.2003019, 1.191394, -2.971087, 0, 1, 0.6117647, 1,
-0.1963337, -0.002439133, -2.573421, 0, 1, 0.6156863, 1,
-0.1927397, 0.6397792, -1.057704, 0, 1, 0.6235294, 1,
-0.1916446, -0.868659, -2.535098, 0, 1, 0.627451, 1,
-0.185949, 1.33815, 0.7244235, 0, 1, 0.6352941, 1,
-0.1855189, -0.2087299, -1.903548, 0, 1, 0.6392157, 1,
-0.1795372, -0.720513, -4.538738, 0, 1, 0.6470588, 1,
-0.1782114, -0.7020078, -3.336264, 0, 1, 0.6509804, 1,
-0.1774769, -0.8066608, -3.728713, 0, 1, 0.6588235, 1,
-0.1700839, -0.8218884, -1.849266, 0, 1, 0.6627451, 1,
-0.1685769, -0.028833, -1.717361, 0, 1, 0.6705883, 1,
-0.1680677, 0.1222516, -1.075612, 0, 1, 0.6745098, 1,
-0.1673784, -1.899896, -1.447945, 0, 1, 0.682353, 1,
-0.1638321, 0.6136876, 1.135249, 0, 1, 0.6862745, 1,
-0.1623205, 0.4869216, -0.5206104, 0, 1, 0.6941177, 1,
-0.1560167, -0.2596328, -1.891786, 0, 1, 0.7019608, 1,
-0.1555154, -1.261854, -3.751819, 0, 1, 0.7058824, 1,
-0.1547802, 0.4883182, -1.635598, 0, 1, 0.7137255, 1,
-0.1516556, -0.07928383, -1.853178, 0, 1, 0.7176471, 1,
-0.1471159, 0.5376993, 1.479898, 0, 1, 0.7254902, 1,
-0.146584, -0.9788601, -1.746585, 0, 1, 0.7294118, 1,
-0.1458542, -0.1605582, -1.280242, 0, 1, 0.7372549, 1,
-0.1443508, 1.037256, -0.3594021, 0, 1, 0.7411765, 1,
-0.14325, -1.438709, -3.68173, 0, 1, 0.7490196, 1,
-0.1416828, -1.024385, -2.672187, 0, 1, 0.7529412, 1,
-0.1411362, 1.15148, -0.01083794, 0, 1, 0.7607843, 1,
-0.1402695, -0.7072488, -1.541677, 0, 1, 0.7647059, 1,
-0.1400575, -1.591213, -3.382067, 0, 1, 0.772549, 1,
-0.1391523, -0.3406349, -4.387787, 0, 1, 0.7764706, 1,
-0.1322467, 1.761159, 0.9602739, 0, 1, 0.7843137, 1,
-0.1321316, -0.1911436, -1.993791, 0, 1, 0.7882353, 1,
-0.1315649, -0.0547835, -0.5586093, 0, 1, 0.7960784, 1,
-0.1220414, -0.8837817, -2.142915, 0, 1, 0.8039216, 1,
-0.1158482, -0.4674796, -3.297217, 0, 1, 0.8078431, 1,
-0.1111564, 0.8906602, 0.003087613, 0, 1, 0.8156863, 1,
-0.1101505, -0.6980958, -1.708286, 0, 1, 0.8196079, 1,
-0.1059135, 0.3017426, 0.7135552, 0, 1, 0.827451, 1,
-0.1053113, -0.9706939, -2.68389, 0, 1, 0.8313726, 1,
-0.1013583, -0.05813356, -2.364501, 0, 1, 0.8392157, 1,
-0.09211587, -0.5461373, -3.853538, 0, 1, 0.8431373, 1,
-0.09035226, -1.573465, -2.852475, 0, 1, 0.8509804, 1,
-0.08213433, -1.984379, -2.291873, 0, 1, 0.854902, 1,
-0.08063787, -1.275382, -2.435322, 0, 1, 0.8627451, 1,
-0.07921369, -0.7804902, -3.29374, 0, 1, 0.8666667, 1,
-0.07820209, -0.1849571, -2.448797, 0, 1, 0.8745098, 1,
-0.0739308, 1.373511, 1.054361, 0, 1, 0.8784314, 1,
-0.07331385, -1.310408, -3.208918, 0, 1, 0.8862745, 1,
-0.06968527, 0.3532342, 0.7665595, 0, 1, 0.8901961, 1,
-0.06782722, 0.119413, -0.8144836, 0, 1, 0.8980392, 1,
-0.06652642, 0.08840538, -1.170349, 0, 1, 0.9058824, 1,
-0.06415089, -1.454665, -4.225006, 0, 1, 0.9098039, 1,
-0.06019343, -0.4208234, -1.789158, 0, 1, 0.9176471, 1,
-0.05734986, -1.368836, -3.009921, 0, 1, 0.9215686, 1,
-0.0522156, 1.832363, -0.822371, 0, 1, 0.9294118, 1,
-0.05114056, -0.482715, -5.534342, 0, 1, 0.9333333, 1,
-0.05005727, 0.703048, -0.4739138, 0, 1, 0.9411765, 1,
-0.04748376, 1.296639, 0.1525573, 0, 1, 0.945098, 1,
-0.04493354, 0.8549767, 1.008701, 0, 1, 0.9529412, 1,
-0.04406074, 1.192844, 1.12848, 0, 1, 0.9568627, 1,
-0.03987972, 0.8475912, -0.8849799, 0, 1, 0.9647059, 1,
-0.03820403, 1.381588, 0.8103974, 0, 1, 0.9686275, 1,
-0.03694728, -0.9353881, -3.812399, 0, 1, 0.9764706, 1,
-0.03660583, -0.402779, -2.468549, 0, 1, 0.9803922, 1,
-0.02946753, 0.1224932, 0.5793109, 0, 1, 0.9882353, 1,
-0.02859509, 1.618854, 0.6783276, 0, 1, 0.9921569, 1,
-0.02827483, 0.5382591, -0.4029799, 0, 1, 1, 1,
-0.02591678, 1.481509, 0.7092632, 0, 0.9921569, 1, 1,
-0.02081222, -0.1749103, -3.620681, 0, 0.9882353, 1, 1,
-0.01955888, -0.1233914, -1.711969, 0, 0.9803922, 1, 1,
-0.01939662, 0.1524613, 0.8321351, 0, 0.9764706, 1, 1,
-0.01675254, -0.8424153, -1.187264, 0, 0.9686275, 1, 1,
-0.01558954, 1.106232, 1.377072, 0, 0.9647059, 1, 1,
-0.01438859, 0.4385687, 0.06727047, 0, 0.9568627, 1, 1,
-0.01413752, 1.374956, 0.2637565, 0, 0.9529412, 1, 1,
-0.01230278, -0.02768213, -2.926666, 0, 0.945098, 1, 1,
-0.01139051, -0.4082726, -3.109421, 0, 0.9411765, 1, 1,
-0.01131678, -0.3350542, -4.350482, 0, 0.9333333, 1, 1,
-0.01036616, 0.9632373, 0.2187278, 0, 0.9294118, 1, 1,
-0.005730557, 1.043448, -0.332285, 0, 0.9215686, 1, 1,
-0.003301214, 0.06145929, 0.5521462, 0, 0.9176471, 1, 1,
0.001404638, 1.020827, -1.207667, 0, 0.9098039, 1, 1,
0.003017664, 0.3403492, -0.03994179, 0, 0.9058824, 1, 1,
0.006072613, 0.002950064, 3.321556, 0, 0.8980392, 1, 1,
0.006666175, 0.9212602, 2.130696, 0, 0.8901961, 1, 1,
0.008651421, -0.1911399, 3.804667, 0, 0.8862745, 1, 1,
0.009644253, 1.395387, -0.08738369, 0, 0.8784314, 1, 1,
0.01495897, 1.508512, -0.4796681, 0, 0.8745098, 1, 1,
0.01638538, 1.06269, -1.290643, 0, 0.8666667, 1, 1,
0.01947434, -1.324236, 3.346364, 0, 0.8627451, 1, 1,
0.02274267, 0.6657684, 0.1672802, 0, 0.854902, 1, 1,
0.02443165, -0.4808875, 2.085167, 0, 0.8509804, 1, 1,
0.02770079, 0.8433081, -0.004161755, 0, 0.8431373, 1, 1,
0.03550838, -1.433095, 3.482567, 0, 0.8392157, 1, 1,
0.04120833, 0.5974301, -0.341824, 0, 0.8313726, 1, 1,
0.052959, 0.5871184, -0.7268014, 0, 0.827451, 1, 1,
0.05492692, -1.45436, 3.483268, 0, 0.8196079, 1, 1,
0.05808069, 1.097336, 0.2268193, 0, 0.8156863, 1, 1,
0.06298073, -0.06412773, 2.476069, 0, 0.8078431, 1, 1,
0.06740376, 0.2353005, 0.7082963, 0, 0.8039216, 1, 1,
0.07216805, -0.2633623, 2.659862, 0, 0.7960784, 1, 1,
0.07273274, 0.1977469, 0.7711526, 0, 0.7882353, 1, 1,
0.0817332, -0.6968246, 5.370898, 0, 0.7843137, 1, 1,
0.08414622, -0.5829643, 2.916514, 0, 0.7764706, 1, 1,
0.08500644, -0.4226056, 3.677685, 0, 0.772549, 1, 1,
0.08615653, -0.3122164, 4.678353, 0, 0.7647059, 1, 1,
0.0891029, -0.7003546, 2.776301, 0, 0.7607843, 1, 1,
0.08981625, 0.6688178, -0.2980562, 0, 0.7529412, 1, 1,
0.09146946, -0.5665055, 3.46746, 0, 0.7490196, 1, 1,
0.09213226, -1.035965, 4.490963, 0, 0.7411765, 1, 1,
0.09498549, 1.37229, -0.6291474, 0, 0.7372549, 1, 1,
0.09702136, -0.1074917, 2.770133, 0, 0.7294118, 1, 1,
0.09780132, 0.8168846, -0.4968784, 0, 0.7254902, 1, 1,
0.09805933, -1.316109, 3.811621, 0, 0.7176471, 1, 1,
0.09959452, -0.3925179, 3.610039, 0, 0.7137255, 1, 1,
0.1090298, -0.2272504, 1.597933, 0, 0.7058824, 1, 1,
0.1122358, 0.4898849, 1.606321, 0, 0.6980392, 1, 1,
0.1163022, 2.197429, -1.111131, 0, 0.6941177, 1, 1,
0.1201543, 2.739464, 0.08940288, 0, 0.6862745, 1, 1,
0.1209552, 0.4336764, 0.5388308, 0, 0.682353, 1, 1,
0.1210895, 1.07251, 0.4128439, 0, 0.6745098, 1, 1,
0.1216494, 0.07363909, 0.5336058, 0, 0.6705883, 1, 1,
0.1255775, 1.794751, 0.1693618, 0, 0.6627451, 1, 1,
0.1279429, -1.943471, 2.916377, 0, 0.6588235, 1, 1,
0.1333709, 0.5887645, -1.373322, 0, 0.6509804, 1, 1,
0.1347952, 0.5562658, -0.06396168, 0, 0.6470588, 1, 1,
0.1354016, 1.247516, -0.1842879, 0, 0.6392157, 1, 1,
0.142165, -1.292736, 2.944123, 0, 0.6352941, 1, 1,
0.1436878, 1.462144, 0.3877127, 0, 0.627451, 1, 1,
0.1442026, -1.281976, 1.758787, 0, 0.6235294, 1, 1,
0.1481172, -1.581822, 3.132243, 0, 0.6156863, 1, 1,
0.1482679, -1.540395, 4.538633, 0, 0.6117647, 1, 1,
0.1505789, 0.3594857, 3.245582, 0, 0.6039216, 1, 1,
0.1525887, 0.6297718, -1.077869, 0, 0.5960785, 1, 1,
0.1548867, -0.5551642, 1.93984, 0, 0.5921569, 1, 1,
0.1560156, 0.647646, -1.326468, 0, 0.5843138, 1, 1,
0.1634884, -0.4278846, 2.614728, 0, 0.5803922, 1, 1,
0.1670482, 0.9907971, -0.6379065, 0, 0.572549, 1, 1,
0.1687354, -0.07276993, 2.069005, 0, 0.5686275, 1, 1,
0.1693983, 0.01103532, 2.048309, 0, 0.5607843, 1, 1,
0.1703643, 1.251607, 0.7338192, 0, 0.5568628, 1, 1,
0.1739646, 2.100443, -0.1182727, 0, 0.5490196, 1, 1,
0.1776242, 0.683814, 2.359151, 0, 0.5450981, 1, 1,
0.1778064, -1.124272, 2.976958, 0, 0.5372549, 1, 1,
0.1831927, -0.5273471, 1.767946, 0, 0.5333334, 1, 1,
0.1850677, 2.062998, -1.45543, 0, 0.5254902, 1, 1,
0.1873302, -0.06377722, 1.16406, 0, 0.5215687, 1, 1,
0.1924681, 1.749122, -0.06098768, 0, 0.5137255, 1, 1,
0.1927249, 1.020854, 1.324639, 0, 0.509804, 1, 1,
0.1981988, -0.4988705, 4.403954, 0, 0.5019608, 1, 1,
0.1995999, 0.217061, 1.633973, 0, 0.4941176, 1, 1,
0.2034545, 0.6048996, 0.01588501, 0, 0.4901961, 1, 1,
0.2102251, -0.3295734, 2.403996, 0, 0.4823529, 1, 1,
0.2103667, 0.1901278, 0.3404932, 0, 0.4784314, 1, 1,
0.2138106, -0.3344686, 3.242522, 0, 0.4705882, 1, 1,
0.2164158, -0.4953212, 2.923325, 0, 0.4666667, 1, 1,
0.2187347, 0.5620801, 1.36485, 0, 0.4588235, 1, 1,
0.2198957, -1.528191, 3.90625, 0, 0.454902, 1, 1,
0.2205746, -0.7857807, 3.733676, 0, 0.4470588, 1, 1,
0.2272798, -0.7611841, 2.0059, 0, 0.4431373, 1, 1,
0.2275769, -0.5610188, 1.950234, 0, 0.4352941, 1, 1,
0.2289363, -0.4366035, 3.979015, 0, 0.4313726, 1, 1,
0.2297312, 0.3934803, 1.904383, 0, 0.4235294, 1, 1,
0.2345991, 2.896202, -0.7286474, 0, 0.4196078, 1, 1,
0.2378707, -2.122343, 5.37194, 0, 0.4117647, 1, 1,
0.2382686, 0.5785131, -0.3868891, 0, 0.4078431, 1, 1,
0.2413483, -1.020373, 3.63881, 0, 0.4, 1, 1,
0.2430125, 1.567269, -0.2077179, 0, 0.3921569, 1, 1,
0.2537045, -0.1110909, 2.332897, 0, 0.3882353, 1, 1,
0.2542985, 1.41738, -0.2731513, 0, 0.3803922, 1, 1,
0.2559069, -0.5934569, 3.355347, 0, 0.3764706, 1, 1,
0.256986, 0.42123, 0.0513774, 0, 0.3686275, 1, 1,
0.2606541, -0.1810733, 2.289725, 0, 0.3647059, 1, 1,
0.2608134, 0.2841024, -0.8406225, 0, 0.3568628, 1, 1,
0.2636537, 0.8192576, -0.2811768, 0, 0.3529412, 1, 1,
0.2669952, -2.540095, 1.710794, 0, 0.345098, 1, 1,
0.2678466, 0.1385998, 1.381455, 0, 0.3411765, 1, 1,
0.2688868, -1.340038, 1.719312, 0, 0.3333333, 1, 1,
0.2699682, -0.1611627, 2.481755, 0, 0.3294118, 1, 1,
0.2713901, -0.6061026, 3.951948, 0, 0.3215686, 1, 1,
0.2780157, 0.2627133, -0.6201077, 0, 0.3176471, 1, 1,
0.2792461, 1.516249, -0.1220392, 0, 0.3098039, 1, 1,
0.282898, 0.7237496, -0.9046873, 0, 0.3058824, 1, 1,
0.2874481, 0.4695069, -0.4276539, 0, 0.2980392, 1, 1,
0.2936383, -0.1371768, 2.543592, 0, 0.2901961, 1, 1,
0.2961653, -0.9615621, 2.881039, 0, 0.2862745, 1, 1,
0.2970195, -0.4110724, 2.417718, 0, 0.2784314, 1, 1,
0.2985301, -0.4041182, 0.8713973, 0, 0.2745098, 1, 1,
0.299521, 0.5781747, 0.08660384, 0, 0.2666667, 1, 1,
0.2996893, -0.194926, 2.793771, 0, 0.2627451, 1, 1,
0.2997468, 0.8998258, 1.701256, 0, 0.254902, 1, 1,
0.301457, -0.2619206, 3.317383, 0, 0.2509804, 1, 1,
0.3022257, 0.005486036, 0.1488985, 0, 0.2431373, 1, 1,
0.3045796, -0.2984626, 3.370873, 0, 0.2392157, 1, 1,
0.3111448, 1.265017, 0.091434, 0, 0.2313726, 1, 1,
0.3370338, 0.6993265, 0.6840464, 0, 0.227451, 1, 1,
0.3436395, 0.6740971, 1.330497, 0, 0.2196078, 1, 1,
0.34381, -1.096149, 3.281776, 0, 0.2156863, 1, 1,
0.3438849, 1.91744, 0.7965598, 0, 0.2078431, 1, 1,
0.3461626, 0.06502072, 0.4791005, 0, 0.2039216, 1, 1,
0.3477373, 1.226679, 0.6252628, 0, 0.1960784, 1, 1,
0.349398, 2.020725, 0.5819216, 0, 0.1882353, 1, 1,
0.3494317, -0.04626843, 2.502613, 0, 0.1843137, 1, 1,
0.3528591, 2.178283, 0.06376527, 0, 0.1764706, 1, 1,
0.3602859, 1.499174, 0.04533548, 0, 0.172549, 1, 1,
0.3695057, 1.544523, 0.3566689, 0, 0.1647059, 1, 1,
0.3720316, 0.7126104, 0.4612128, 0, 0.1607843, 1, 1,
0.3815798, -1.20738, 2.310923, 0, 0.1529412, 1, 1,
0.3820168, 0.699399, -0.8207074, 0, 0.1490196, 1, 1,
0.3826033, -1.516881, 3.405156, 0, 0.1411765, 1, 1,
0.3841232, 0.06519224, 1.65072, 0, 0.1372549, 1, 1,
0.3889433, 0.3887661, 1.561615, 0, 0.1294118, 1, 1,
0.3890095, 1.319135, -0.7360642, 0, 0.1254902, 1, 1,
0.3953826, 1.34617, 0.5002878, 0, 0.1176471, 1, 1,
0.4034858, 0.8714787, 1.404734, 0, 0.1137255, 1, 1,
0.4038267, -0.4506668, 3.879513, 0, 0.1058824, 1, 1,
0.4110937, 0.4343124, 1.497117, 0, 0.09803922, 1, 1,
0.415692, 0.3872925, 2.854554, 0, 0.09411765, 1, 1,
0.4171094, -1.269606, 2.422112, 0, 0.08627451, 1, 1,
0.4191028, -0.1110837, 1.433117, 0, 0.08235294, 1, 1,
0.42373, -0.2113647, 2.712312, 0, 0.07450981, 1, 1,
0.4269002, 0.3292023, 0.8575275, 0, 0.07058824, 1, 1,
0.42989, 0.7797346, 1.740915, 0, 0.0627451, 1, 1,
0.4307117, 1.224727, 1.784639, 0, 0.05882353, 1, 1,
0.4338362, 0.149997, 2.034133, 0, 0.05098039, 1, 1,
0.4440197, -1.509372, 1.420896, 0, 0.04705882, 1, 1,
0.4447657, 0.02697279, 1.044584, 0, 0.03921569, 1, 1,
0.4514032, 0.2448108, 1.437902, 0, 0.03529412, 1, 1,
0.4523377, -0.139404, 0.1267218, 0, 0.02745098, 1, 1,
0.4523385, 0.6966088, 2.21808, 0, 0.02352941, 1, 1,
0.4544119, 0.7704535, 0.1473072, 0, 0.01568628, 1, 1,
0.4592226, -1.984448, 0.9810125, 0, 0.01176471, 1, 1,
0.4600978, 0.1958346, 2.924294, 0, 0.003921569, 1, 1,
0.4677327, -0.260206, 2.332359, 0.003921569, 0, 1, 1,
0.4683939, -0.121283, 3.194573, 0.007843138, 0, 1, 1,
0.4692489, -0.7295192, 0.4654217, 0.01568628, 0, 1, 1,
0.4696326, 0.8639871, 0.05618516, 0.01960784, 0, 1, 1,
0.4723143, 0.3237392, 0.4319846, 0.02745098, 0, 1, 1,
0.4822792, 0.1144819, 0.2221291, 0.03137255, 0, 1, 1,
0.4845461, -0.9185603, 3.085181, 0.03921569, 0, 1, 1,
0.4892195, -1.043919, 1.945367, 0.04313726, 0, 1, 1,
0.4969456, 1.627476, 1.311669, 0.05098039, 0, 1, 1,
0.4979294, 0.2669804, 1.800595, 0.05490196, 0, 1, 1,
0.5029002, 1.911251, -1.472565, 0.0627451, 0, 1, 1,
0.5032618, -1.565941, 3.635799, 0.06666667, 0, 1, 1,
0.5043516, -1.999177, 3.107874, 0.07450981, 0, 1, 1,
0.5073797, 1.253291, -1.367599, 0.07843138, 0, 1, 1,
0.5089101, 0.8796421, 0.4503717, 0.08627451, 0, 1, 1,
0.5127906, -1.282086, 2.057774, 0.09019608, 0, 1, 1,
0.5241227, -0.5110302, 2.201422, 0.09803922, 0, 1, 1,
0.5294542, -0.5856276, 2.335613, 0.1058824, 0, 1, 1,
0.5306382, 0.7957086, 0.4007961, 0.1098039, 0, 1, 1,
0.5329056, 2.059314, 1.213602, 0.1176471, 0, 1, 1,
0.5370022, 0.8706204, 1.419095, 0.1215686, 0, 1, 1,
0.5371989, -0.1320248, 1.15953, 0.1294118, 0, 1, 1,
0.5401348, 0.9713438, 0.1509923, 0.1333333, 0, 1, 1,
0.5449722, -0.2621011, 0.7386828, 0.1411765, 0, 1, 1,
0.5455944, 1.841145, -1.345651, 0.145098, 0, 1, 1,
0.5476528, 0.05349729, 2.602597, 0.1529412, 0, 1, 1,
0.5482149, 0.4455431, 0.6185595, 0.1568628, 0, 1, 1,
0.5484164, 0.5835084, -0.1437302, 0.1647059, 0, 1, 1,
0.551433, 0.1126943, 0.00583804, 0.1686275, 0, 1, 1,
0.5535996, -2.332257, 2.491347, 0.1764706, 0, 1, 1,
0.5561216, 0.07827374, 2.725283, 0.1803922, 0, 1, 1,
0.5564356, -0.6955703, 1.25361, 0.1882353, 0, 1, 1,
0.5579646, -0.6697826, 2.727735, 0.1921569, 0, 1, 1,
0.5581067, -0.2153013, 2.231172, 0.2, 0, 1, 1,
0.5662041, 1.299105, -0.9603477, 0.2078431, 0, 1, 1,
0.5700233, -0.7293085, 3.557134, 0.2117647, 0, 1, 1,
0.5713914, -1.211934, 1.683646, 0.2196078, 0, 1, 1,
0.580294, -1.005251, 1.968612, 0.2235294, 0, 1, 1,
0.5805019, -0.7007598, 1.827141, 0.2313726, 0, 1, 1,
0.580611, -0.2326319, 2.087872, 0.2352941, 0, 1, 1,
0.5819843, 0.676061, 0.7090468, 0.2431373, 0, 1, 1,
0.5880974, 0.5192395, 1.873854, 0.2470588, 0, 1, 1,
0.589896, 0.7650447, 1.283203, 0.254902, 0, 1, 1,
0.6010336, -1.14935, 2.0779, 0.2588235, 0, 1, 1,
0.6093004, 0.5487645, 1.235678, 0.2666667, 0, 1, 1,
0.6132414, -0.7019226, 1.509232, 0.2705882, 0, 1, 1,
0.6139358, -1.309953, -0.026489, 0.2784314, 0, 1, 1,
0.6155735, 1.301349, 1.47508, 0.282353, 0, 1, 1,
0.6173385, -0.1648785, -0.1207447, 0.2901961, 0, 1, 1,
0.6174435, 1.506747, -0.00334153, 0.2941177, 0, 1, 1,
0.6180748, -1.571582, 2.538905, 0.3019608, 0, 1, 1,
0.6188762, -0.3999367, 3.188031, 0.3098039, 0, 1, 1,
0.6189095, -0.927458, 2.989574, 0.3137255, 0, 1, 1,
0.6191051, -1.499497, 1.331964, 0.3215686, 0, 1, 1,
0.6197916, -1.527062, 4.413583, 0.3254902, 0, 1, 1,
0.6213816, -0.6350737, 3.038662, 0.3333333, 0, 1, 1,
0.6218483, -0.2120208, 0.9710513, 0.3372549, 0, 1, 1,
0.62498, -0.1677084, 0.6958108, 0.345098, 0, 1, 1,
0.6311762, -0.5309625, 1.091599, 0.3490196, 0, 1, 1,
0.6312361, 0.005858313, 2.007437, 0.3568628, 0, 1, 1,
0.6328068, -0.06278659, 0.9748836, 0.3607843, 0, 1, 1,
0.6371145, -1.466613, 4.181797, 0.3686275, 0, 1, 1,
0.6388707, -0.1125648, 1.162635, 0.372549, 0, 1, 1,
0.6418681, 0.7019692, 1.733207, 0.3803922, 0, 1, 1,
0.642688, -2.305124, 2.874424, 0.3843137, 0, 1, 1,
0.6435611, -0.3768544, 3.11855, 0.3921569, 0, 1, 1,
0.6486387, -0.2184475, 0.9520352, 0.3960784, 0, 1, 1,
0.6547127, 1.142341, 0.8447092, 0.4039216, 0, 1, 1,
0.6580964, 1.772736, 0.9769112, 0.4117647, 0, 1, 1,
0.6606949, 0.4114138, -0.7568067, 0.4156863, 0, 1, 1,
0.6663586, 1.502932, -0.06298419, 0.4235294, 0, 1, 1,
0.6681581, 0.8823764, -0.2561993, 0.427451, 0, 1, 1,
0.671681, -0.1076989, 0.409714, 0.4352941, 0, 1, 1,
0.6729388, -0.1349397, 1.362496, 0.4392157, 0, 1, 1,
0.6756904, -0.7765915, 3.084126, 0.4470588, 0, 1, 1,
0.6780872, 0.4902742, -1.06714, 0.4509804, 0, 1, 1,
0.6897753, 0.4912976, 1.409525, 0.4588235, 0, 1, 1,
0.6963199, 1.47155, 0.6230037, 0.4627451, 0, 1, 1,
0.7024356, 1.082739, -1.376577, 0.4705882, 0, 1, 1,
0.711537, -0.5964135, 2.499354, 0.4745098, 0, 1, 1,
0.7125932, -0.2038145, 3.08829, 0.4823529, 0, 1, 1,
0.7178336, 0.7033986, 0.1902293, 0.4862745, 0, 1, 1,
0.7194901, -1.766717, 3.57423, 0.4941176, 0, 1, 1,
0.7198615, -0.01180388, 1.485222, 0.5019608, 0, 1, 1,
0.7218481, -2.42215, 2.339749, 0.5058824, 0, 1, 1,
0.7246113, 1.121295, -0.5874454, 0.5137255, 0, 1, 1,
0.7283329, -0.01043265, -0.0800419, 0.5176471, 0, 1, 1,
0.730567, -0.8225573, 1.356358, 0.5254902, 0, 1, 1,
0.7306347, -1.878144, 1.712502, 0.5294118, 0, 1, 1,
0.7327614, 0.7236812, 2.335698, 0.5372549, 0, 1, 1,
0.7368242, -1.380276, 3.000085, 0.5411765, 0, 1, 1,
0.737275, -1.049781, 3.910437, 0.5490196, 0, 1, 1,
0.7441426, 0.1620944, 1.441537, 0.5529412, 0, 1, 1,
0.7451664, -1.341678, 1.860762, 0.5607843, 0, 1, 1,
0.7470024, 0.254841, 1.569071, 0.5647059, 0, 1, 1,
0.7499859, -0.2944405, 1.536221, 0.572549, 0, 1, 1,
0.7562566, -0.6988223, 1.900104, 0.5764706, 0, 1, 1,
0.7572151, -0.1778661, 2.799523, 0.5843138, 0, 1, 1,
0.7600064, -0.6901704, 1.32982, 0.5882353, 0, 1, 1,
0.7617267, -0.1244757, 1.11218, 0.5960785, 0, 1, 1,
0.7621993, -1.314253, 2.488058, 0.6039216, 0, 1, 1,
0.7664802, 0.01931661, 0.7787119, 0.6078432, 0, 1, 1,
0.7676795, 0.3803922, -0.3628583, 0.6156863, 0, 1, 1,
0.7690395, 0.8164185, 1.338725, 0.6196079, 0, 1, 1,
0.7695339, -1.292325, 3.462443, 0.627451, 0, 1, 1,
0.7713595, -1.784954, 1.953072, 0.6313726, 0, 1, 1,
0.7716097, -0.2162228, 3.021374, 0.6392157, 0, 1, 1,
0.7801509, -1.107826, 0.4248723, 0.6431373, 0, 1, 1,
0.7804928, 0.0594145, 0.186841, 0.6509804, 0, 1, 1,
0.7807952, -0.5006788, 3.101243, 0.654902, 0, 1, 1,
0.7816826, 0.6393853, 1.650399, 0.6627451, 0, 1, 1,
0.7860992, 0.8231092, 1.221013, 0.6666667, 0, 1, 1,
0.7895612, 0.9274437, 0.7750582, 0.6745098, 0, 1, 1,
0.7938354, 0.03737747, -0.2898947, 0.6784314, 0, 1, 1,
0.7939611, -1.020878, 2.356137, 0.6862745, 0, 1, 1,
0.7940496, -1.065537, 1.921179, 0.6901961, 0, 1, 1,
0.7951055, -1.76457, 4.3066, 0.6980392, 0, 1, 1,
0.7981499, 0.4027341, 1.499219, 0.7058824, 0, 1, 1,
0.7982796, 0.9431857, 0.6907917, 0.7098039, 0, 1, 1,
0.8030499, 1.50415, -0.07854437, 0.7176471, 0, 1, 1,
0.8120905, 0.7965348, 0.4614404, 0.7215686, 0, 1, 1,
0.8126141, -1.802691, 4.276484, 0.7294118, 0, 1, 1,
0.818708, -0.4590211, 0.9002893, 0.7333333, 0, 1, 1,
0.8265317, 0.7077869, 1.809845, 0.7411765, 0, 1, 1,
0.827062, 0.9535758, 0.9703649, 0.7450981, 0, 1, 1,
0.8310011, 0.8926792, 1.505739, 0.7529412, 0, 1, 1,
0.8363837, 1.912215, 1.427042, 0.7568628, 0, 1, 1,
0.8366436, 0.4175297, 1.415113, 0.7647059, 0, 1, 1,
0.8391979, -0.03810297, -0.07209276, 0.7686275, 0, 1, 1,
0.8589037, 2.22997, 1.24548, 0.7764706, 0, 1, 1,
0.8658428, 0.3574465, 1.900603, 0.7803922, 0, 1, 1,
0.8685979, 0.07201646, 0.7171032, 0.7882353, 0, 1, 1,
0.8726454, -0.8302203, 3.69894, 0.7921569, 0, 1, 1,
0.8799707, 0.8084176, -0.007707436, 0.8, 0, 1, 1,
0.882309, -0.4287472, 1.899867, 0.8078431, 0, 1, 1,
0.884208, 1.416908, 2.274569, 0.8117647, 0, 1, 1,
0.8851445, 1.09426, -0.1683113, 0.8196079, 0, 1, 1,
0.8922297, -0.8647734, 0.4878907, 0.8235294, 0, 1, 1,
0.8930422, 1.326715, 2.399612, 0.8313726, 0, 1, 1,
0.8953535, 0.009277196, 3.028358, 0.8352941, 0, 1, 1,
0.8958398, -2.262536, 3.96786, 0.8431373, 0, 1, 1,
0.900758, 0.36923, 0.4466124, 0.8470588, 0, 1, 1,
0.9057925, -0.364394, 3.387931, 0.854902, 0, 1, 1,
0.9100714, -0.329687, 2.188872, 0.8588235, 0, 1, 1,
0.9112312, -0.5284554, 2.054257, 0.8666667, 0, 1, 1,
0.9122505, -1.33129, 1.778509, 0.8705882, 0, 1, 1,
0.9226149, -1.352087, 1.515759, 0.8784314, 0, 1, 1,
0.9226681, 1.79533, -0.9571359, 0.8823529, 0, 1, 1,
0.9236522, 1.926292, 2.142924, 0.8901961, 0, 1, 1,
0.9303542, -0.5289888, 1.695427, 0.8941177, 0, 1, 1,
0.9311161, -0.3680732, 2.901147, 0.9019608, 0, 1, 1,
0.9329948, -0.472319, 1.92478, 0.9098039, 0, 1, 1,
0.9344896, 0.939511, 1.129379, 0.9137255, 0, 1, 1,
0.9349539, -0.121669, 1.061885, 0.9215686, 0, 1, 1,
0.9378656, -0.1825971, 1.18365, 0.9254902, 0, 1, 1,
0.9380068, 0.03014092, 1.308491, 0.9333333, 0, 1, 1,
0.943013, -0.005405314, 2.53055, 0.9372549, 0, 1, 1,
0.944059, 1.1036, 1.320521, 0.945098, 0, 1, 1,
0.9460732, 0.3742333, 0.716885, 0.9490196, 0, 1, 1,
0.9489456, 0.8631187, -0.9812953, 0.9568627, 0, 1, 1,
0.9505993, 0.3002482, 0.896594, 0.9607843, 0, 1, 1,
0.9516822, 0.8644045, -1.043104, 0.9686275, 0, 1, 1,
0.9530576, 0.298477, 1.204657, 0.972549, 0, 1, 1,
0.9564594, -0.7279302, 1.392213, 0.9803922, 0, 1, 1,
0.9672812, 0.5100476, 1.055959, 0.9843137, 0, 1, 1,
0.9674569, 0.5364875, 1.428567, 0.9921569, 0, 1, 1,
0.9681976, 0.4011509, 1.178147, 0.9960784, 0, 1, 1,
0.9690042, 0.8613627, 1.342599, 1, 0, 0.9960784, 1,
0.9725739, 0.4421811, 2.017868, 1, 0, 0.9882353, 1,
0.9769328, 1.375584, 1.845798, 1, 0, 0.9843137, 1,
0.982403, 1.328452, 1.862083, 1, 0, 0.9764706, 1,
0.9843739, -0.3650064, 2.027457, 1, 0, 0.972549, 1,
0.98609, -0.1995137, 2.551032, 1, 0, 0.9647059, 1,
0.9908738, 1.405449, -0.6203968, 1, 0, 0.9607843, 1,
0.996607, -0.9808729, 2.023067, 1, 0, 0.9529412, 1,
0.9970753, 1.361, 0.08399978, 1, 0, 0.9490196, 1,
0.9970818, -1.156821, 1.793177, 1, 0, 0.9411765, 1,
0.9985306, 0.06452979, 0.9999762, 1, 0, 0.9372549, 1,
0.999724, -0.4859804, 2.539439, 1, 0, 0.9294118, 1,
1.000381, -0.6246756, 2.009658, 1, 0, 0.9254902, 1,
1.002829, -1.589581, 2.047118, 1, 0, 0.9176471, 1,
1.006601, -0.3081122, 2.20679, 1, 0, 0.9137255, 1,
1.006926, 0.001293285, 2.288391, 1, 0, 0.9058824, 1,
1.013191, 0.4849725, 0.5473164, 1, 0, 0.9019608, 1,
1.01754, 0.3892641, 0.06619443, 1, 0, 0.8941177, 1,
1.020087, 0.2287916, 2.772705, 1, 0, 0.8862745, 1,
1.022742, -0.09218369, 1.32645, 1, 0, 0.8823529, 1,
1.028971, -1.7288, 3.118124, 1, 0, 0.8745098, 1,
1.032411, -1.762239, 2.529657, 1, 0, 0.8705882, 1,
1.034676, 0.5115748, 1.259398, 1, 0, 0.8627451, 1,
1.039085, 2.236385, 0.9152302, 1, 0, 0.8588235, 1,
1.039575, -0.1558085, 3.237744, 1, 0, 0.8509804, 1,
1.039735, 0.09734904, 2.180199, 1, 0, 0.8470588, 1,
1.045716, 1.779902, 0.7914069, 1, 0, 0.8392157, 1,
1.052301, 0.7097868, 0.6050122, 1, 0, 0.8352941, 1,
1.060703, -0.3685109, 1.889084, 1, 0, 0.827451, 1,
1.062609, 0.4520845, -0.448133, 1, 0, 0.8235294, 1,
1.064847, -0.4130849, 3.022279, 1, 0, 0.8156863, 1,
1.076872, 1.278147, -1.324752, 1, 0, 0.8117647, 1,
1.079148, -0.6647266, 1.806496, 1, 0, 0.8039216, 1,
1.087167, -0.6248906, 2.771629, 1, 0, 0.7960784, 1,
1.092079, 0.4153013, 2.153936, 1, 0, 0.7921569, 1,
1.097962, -0.2682858, 2.522704, 1, 0, 0.7843137, 1,
1.101643, 1.049626, 0.6824502, 1, 0, 0.7803922, 1,
1.101646, -1.700235, 0.5002307, 1, 0, 0.772549, 1,
1.102448, -1.932495, 1.258224, 1, 0, 0.7686275, 1,
1.103937, -0.3897212, 3.490354, 1, 0, 0.7607843, 1,
1.112276, 0.488019, 0.8287364, 1, 0, 0.7568628, 1,
1.119726, 0.72864, 2.755526, 1, 0, 0.7490196, 1,
1.125299, 1.586047, 1.731779, 1, 0, 0.7450981, 1,
1.125541, -1.489059, 4.146334, 1, 0, 0.7372549, 1,
1.146134, -0.1825683, -0.2610597, 1, 0, 0.7333333, 1,
1.147116, -0.8897082, 3.73524, 1, 0, 0.7254902, 1,
1.153112, -1.774421, 2.567003, 1, 0, 0.7215686, 1,
1.165567, 0.1300676, 3.472939, 1, 0, 0.7137255, 1,
1.167002, -0.8528998, 1.231514, 1, 0, 0.7098039, 1,
1.176971, -0.04702623, 3.558448, 1, 0, 0.7019608, 1,
1.184333, -0.7030196, 3.230793, 1, 0, 0.6941177, 1,
1.193754, 1.05178, 1.446723, 1, 0, 0.6901961, 1,
1.193857, -0.5787376, 3.637008, 1, 0, 0.682353, 1,
1.211583, -1.284784, 1.497486, 1, 0, 0.6784314, 1,
1.218341, -0.5451721, 3.136636, 1, 0, 0.6705883, 1,
1.223919, 1.610502, -0.3273987, 1, 0, 0.6666667, 1,
1.227669, 0.4394288, 0.2043506, 1, 0, 0.6588235, 1,
1.236509, -1.213177, 1.481977, 1, 0, 0.654902, 1,
1.249992, -1.865819, 2.816255, 1, 0, 0.6470588, 1,
1.260357, 0.2314133, -0.6772677, 1, 0, 0.6431373, 1,
1.261534, 0.04251617, 2.886107, 1, 0, 0.6352941, 1,
1.262377, -0.9434168, 1.141219, 1, 0, 0.6313726, 1,
1.262467, -0.3370478, 1.395051, 1, 0, 0.6235294, 1,
1.264631, -0.5053502, 1.328605, 1, 0, 0.6196079, 1,
1.272895, -0.4183453, 1.701057, 1, 0, 0.6117647, 1,
1.275833, 2.839213, -0.1058429, 1, 0, 0.6078432, 1,
1.284754, 0.5918559, 0.5815639, 1, 0, 0.6, 1,
1.291465, 1.895953, 2.190277, 1, 0, 0.5921569, 1,
1.294398, 0.2470961, 1.277243, 1, 0, 0.5882353, 1,
1.297472, -0.1736146, 1.805956, 1, 0, 0.5803922, 1,
1.303647, -0.9235111, 2.895794, 1, 0, 0.5764706, 1,
1.317963, 2.421292, 0.3786468, 1, 0, 0.5686275, 1,
1.321396, -0.02081297, 1.716717, 1, 0, 0.5647059, 1,
1.327937, -0.1118373, -0.04604514, 1, 0, 0.5568628, 1,
1.329149, 0.957356, -0.4236731, 1, 0, 0.5529412, 1,
1.330606, 0.9207621, 2.021619, 1, 0, 0.5450981, 1,
1.334072, 0.032097, -0.2122537, 1, 0, 0.5411765, 1,
1.341363, 1.082588, 2.629658, 1, 0, 0.5333334, 1,
1.344383, 0.4517819, -0.6227669, 1, 0, 0.5294118, 1,
1.346274, -2.083646, 0.7744259, 1, 0, 0.5215687, 1,
1.359191, 0.3616848, 2.714044, 1, 0, 0.5176471, 1,
1.361885, 2.43264, 0.6166903, 1, 0, 0.509804, 1,
1.367221, 0.9633093, 0.08670405, 1, 0, 0.5058824, 1,
1.374195, 2.249327, -0.2053874, 1, 0, 0.4980392, 1,
1.38589, 0.7679347, 2.649655, 1, 0, 0.4901961, 1,
1.389947, 0.0800836, 2.403292, 1, 0, 0.4862745, 1,
1.400591, -1.26284, 2.854116, 1, 0, 0.4784314, 1,
1.409034, 0.4238179, 2.440309, 1, 0, 0.4745098, 1,
1.41626, -0.7019995, 3.578637, 1, 0, 0.4666667, 1,
1.418782, -0.3289058, 2.452824, 1, 0, 0.4627451, 1,
1.439377, -1.114978, 2.737995, 1, 0, 0.454902, 1,
1.440039, -0.6743808, 3.031025, 1, 0, 0.4509804, 1,
1.463959, 0.5114182, 1.271393, 1, 0, 0.4431373, 1,
1.467789, 0.2347302, -0.5250061, 1, 0, 0.4392157, 1,
1.487166, 1.234311, 0.3578067, 1, 0, 0.4313726, 1,
1.494956, 0.2431276, 0.3854977, 1, 0, 0.427451, 1,
1.506701, -1.920781, 3.464143, 1, 0, 0.4196078, 1,
1.512067, 0.2303495, 1.209804, 1, 0, 0.4156863, 1,
1.522136, -1.623867, 2.17427, 1, 0, 0.4078431, 1,
1.54533, -1.203019, 3.270006, 1, 0, 0.4039216, 1,
1.547562, 0.3428712, 2.009521, 1, 0, 0.3960784, 1,
1.552962, 0.3747429, 2.030973, 1, 0, 0.3882353, 1,
1.553205, 0.3641328, 2.582382, 1, 0, 0.3843137, 1,
1.553889, -0.732291, 1.537638, 1, 0, 0.3764706, 1,
1.559448, -0.02983359, 1.412744, 1, 0, 0.372549, 1,
1.566606, -2.820837, 3.305106, 1, 0, 0.3647059, 1,
1.567407, 0.7836854, 0.9334187, 1, 0, 0.3607843, 1,
1.570346, 1.229692, 0.8922444, 1, 0, 0.3529412, 1,
1.580894, -0.1918289, 1.503563, 1, 0, 0.3490196, 1,
1.582488, -1.458459, 2.338481, 1, 0, 0.3411765, 1,
1.58331, 0.6669912, 2.609047, 1, 0, 0.3372549, 1,
1.587418, 0.4870165, 1.355286, 1, 0, 0.3294118, 1,
1.610675, 1.366414, 1.005107, 1, 0, 0.3254902, 1,
1.613871, -1.521555, 2.778431, 1, 0, 0.3176471, 1,
1.61412, 0.3790161, 3.181809, 1, 0, 0.3137255, 1,
1.61492, -0.9221631, 1.69999, 1, 0, 0.3058824, 1,
1.626161, 0.4739279, 1.513259, 1, 0, 0.2980392, 1,
1.645863, -0.4120963, 0.2592259, 1, 0, 0.2941177, 1,
1.648387, -0.2389281, 0.9632841, 1, 0, 0.2862745, 1,
1.655463, 1.716773, 0.7864195, 1, 0, 0.282353, 1,
1.664314, -1.601707, 1.105251, 1, 0, 0.2745098, 1,
1.678236, 1.419396, 0.3594536, 1, 0, 0.2705882, 1,
1.681089, -0.4193738, 0.0896595, 1, 0, 0.2627451, 1,
1.688592, -1.157167, 2.540143, 1, 0, 0.2588235, 1,
1.704385, 1.164198, 1.011022, 1, 0, 0.2509804, 1,
1.731663, -0.116119, 2.877229, 1, 0, 0.2470588, 1,
1.732533, -1.246469, 0.1305862, 1, 0, 0.2392157, 1,
1.736421, -0.3702024, 2.673431, 1, 0, 0.2352941, 1,
1.739937, -0.3263738, 2.417288, 1, 0, 0.227451, 1,
1.771666, 0.6023263, 1.174049, 1, 0, 0.2235294, 1,
1.771859, -0.5880462, 1.871508, 1, 0, 0.2156863, 1,
1.775638, -0.1560548, 0.4185818, 1, 0, 0.2117647, 1,
1.77853, -1.004249, 3.041558, 1, 0, 0.2039216, 1,
1.779712, -1.248315, 1.459522, 1, 0, 0.1960784, 1,
1.824344, -0.01484883, 3.857988, 1, 0, 0.1921569, 1,
1.839281, 0.3791784, 1.508985, 1, 0, 0.1843137, 1,
1.855797, -0.4656107, 2.287166, 1, 0, 0.1803922, 1,
1.876093, 2.133127, -0.7128159, 1, 0, 0.172549, 1,
1.88429, -0.337375, 1.426396, 1, 0, 0.1686275, 1,
1.886601, -1.72816, 2.218827, 1, 0, 0.1607843, 1,
1.893129, -0.6841777, 3.748054, 1, 0, 0.1568628, 1,
1.893536, 0.127119, 2.762097, 1, 0, 0.1490196, 1,
1.895772, 0.3873904, 0.3152061, 1, 0, 0.145098, 1,
1.900645, -0.5656051, 2.329043, 1, 0, 0.1372549, 1,
1.951395, -1.010972, 2.486925, 1, 0, 0.1333333, 1,
1.979452, 1.007362, -0.1941222, 1, 0, 0.1254902, 1,
1.988999, 0.6196637, 0.7769941, 1, 0, 0.1215686, 1,
1.991916, 0.5626251, 2.02715, 1, 0, 0.1137255, 1,
1.992666, 0.02599801, 0.06817275, 1, 0, 0.1098039, 1,
2.013477, -0.5317519, 0.7671147, 1, 0, 0.1019608, 1,
2.034695, 0.5275366, 1.204596, 1, 0, 0.09411765, 1,
2.036428, -0.3612891, 2.370839, 1, 0, 0.09019608, 1,
2.180993, -0.3942299, -0.03790791, 1, 0, 0.08235294, 1,
2.238582, 0.3889518, -0.3728828, 1, 0, 0.07843138, 1,
2.241329, 1.007465, 0.0715718, 1, 0, 0.07058824, 1,
2.297575, 0.5215759, 0.1340557, 1, 0, 0.06666667, 1,
2.440439, 0.6402246, 2.153655, 1, 0, 0.05882353, 1,
2.587421, -0.3888715, 1.838062, 1, 0, 0.05490196, 1,
2.630351, -2.042984, 2.274901, 1, 0, 0.04705882, 1,
2.631642, -0.08744641, 2.480778, 1, 0, 0.04313726, 1,
2.68372, 0.07742395, 1.629072, 1, 0, 0.03529412, 1,
2.690566, 0.552754, 2.205811, 1, 0, 0.03137255, 1,
2.732913, -0.03389049, 0.3293256, 1, 0, 0.02352941, 1,
2.746269, -0.9853317, 2.332159, 1, 0, 0.01960784, 1,
2.849571, -0.3561828, 1.451298, 1, 0, 0.01176471, 1,
2.952095, 0.5132614, 1.428578, 1, 0, 0.007843138, 1
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
0.09757209, -3.868588, -7.382957, 0, -0.5, 0.5, 0.5,
0.09757209, -3.868588, -7.382957, 1, -0.5, 0.5, 0.5,
0.09757209, -3.868588, -7.382957, 1, 1.5, 0.5, 0.5,
0.09757209, -3.868588, -7.382957, 0, 1.5, 0.5, 0.5
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
-3.724634, 0.202536, -7.382957, 0, -0.5, 0.5, 0.5,
-3.724634, 0.202536, -7.382957, 1, -0.5, 0.5, 0.5,
-3.724634, 0.202536, -7.382957, 1, 1.5, 0.5, 0.5,
-3.724634, 0.202536, -7.382957, 0, 1.5, 0.5, 0.5
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
-3.724634, -3.868588, -0.08120108, 0, -0.5, 0.5, 0.5,
-3.724634, -3.868588, -0.08120108, 1, -0.5, 0.5, 0.5,
-3.724634, -3.868588, -0.08120108, 1, 1.5, 0.5, 0.5,
-3.724634, -3.868588, -0.08120108, 0, 1.5, 0.5, 0.5
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
-2, -2.929098, -5.697936,
2, -2.929098, -5.697936,
-2, -2.929098, -5.697936,
-2, -3.08568, -5.978773,
-1, -2.929098, -5.697936,
-1, -3.08568, -5.978773,
0, -2.929098, -5.697936,
0, -3.08568, -5.978773,
1, -2.929098, -5.697936,
1, -3.08568, -5.978773,
2, -2.929098, -5.697936,
2, -3.08568, -5.978773
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
-2, -3.398843, -6.540446, 0, -0.5, 0.5, 0.5,
-2, -3.398843, -6.540446, 1, -0.5, 0.5, 0.5,
-2, -3.398843, -6.540446, 1, 1.5, 0.5, 0.5,
-2, -3.398843, -6.540446, 0, 1.5, 0.5, 0.5,
-1, -3.398843, -6.540446, 0, -0.5, 0.5, 0.5,
-1, -3.398843, -6.540446, 1, -0.5, 0.5, 0.5,
-1, -3.398843, -6.540446, 1, 1.5, 0.5, 0.5,
-1, -3.398843, -6.540446, 0, 1.5, 0.5, 0.5,
0, -3.398843, -6.540446, 0, -0.5, 0.5, 0.5,
0, -3.398843, -6.540446, 1, -0.5, 0.5, 0.5,
0, -3.398843, -6.540446, 1, 1.5, 0.5, 0.5,
0, -3.398843, -6.540446, 0, 1.5, 0.5, 0.5,
1, -3.398843, -6.540446, 0, -0.5, 0.5, 0.5,
1, -3.398843, -6.540446, 1, -0.5, 0.5, 0.5,
1, -3.398843, -6.540446, 1, 1.5, 0.5, 0.5,
1, -3.398843, -6.540446, 0, 1.5, 0.5, 0.5,
2, -3.398843, -6.540446, 0, -0.5, 0.5, 0.5,
2, -3.398843, -6.540446, 1, -0.5, 0.5, 0.5,
2, -3.398843, -6.540446, 1, 1.5, 0.5, 0.5,
2, -3.398843, -6.540446, 0, 1.5, 0.5, 0.5
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
-2.842587, -2, -5.697936,
-2.842587, 3, -5.697936,
-2.842587, -2, -5.697936,
-2.989595, -2, -5.978773,
-2.842587, -1, -5.697936,
-2.989595, -1, -5.978773,
-2.842587, 0, -5.697936,
-2.989595, 0, -5.978773,
-2.842587, 1, -5.697936,
-2.989595, 1, -5.978773,
-2.842587, 2, -5.697936,
-2.989595, 2, -5.978773,
-2.842587, 3, -5.697936,
-2.989595, 3, -5.978773
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
-3.283611, -2, -6.540446, 0, -0.5, 0.5, 0.5,
-3.283611, -2, -6.540446, 1, -0.5, 0.5, 0.5,
-3.283611, -2, -6.540446, 1, 1.5, 0.5, 0.5,
-3.283611, -2, -6.540446, 0, 1.5, 0.5, 0.5,
-3.283611, -1, -6.540446, 0, -0.5, 0.5, 0.5,
-3.283611, -1, -6.540446, 1, -0.5, 0.5, 0.5,
-3.283611, -1, -6.540446, 1, 1.5, 0.5, 0.5,
-3.283611, -1, -6.540446, 0, 1.5, 0.5, 0.5,
-3.283611, 0, -6.540446, 0, -0.5, 0.5, 0.5,
-3.283611, 0, -6.540446, 1, -0.5, 0.5, 0.5,
-3.283611, 0, -6.540446, 1, 1.5, 0.5, 0.5,
-3.283611, 0, -6.540446, 0, 1.5, 0.5, 0.5,
-3.283611, 1, -6.540446, 0, -0.5, 0.5, 0.5,
-3.283611, 1, -6.540446, 1, -0.5, 0.5, 0.5,
-3.283611, 1, -6.540446, 1, 1.5, 0.5, 0.5,
-3.283611, 1, -6.540446, 0, 1.5, 0.5, 0.5,
-3.283611, 2, -6.540446, 0, -0.5, 0.5, 0.5,
-3.283611, 2, -6.540446, 1, -0.5, 0.5, 0.5,
-3.283611, 2, -6.540446, 1, 1.5, 0.5, 0.5,
-3.283611, 2, -6.540446, 0, 1.5, 0.5, 0.5,
-3.283611, 3, -6.540446, 0, -0.5, 0.5, 0.5,
-3.283611, 3, -6.540446, 1, -0.5, 0.5, 0.5,
-3.283611, 3, -6.540446, 1, 1.5, 0.5, 0.5,
-3.283611, 3, -6.540446, 0, 1.5, 0.5, 0.5
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
-2.842587, -2.929098, -4,
-2.842587, -2.929098, 4,
-2.842587, -2.929098, -4,
-2.989595, -3.08568, -4,
-2.842587, -2.929098, -2,
-2.989595, -3.08568, -2,
-2.842587, -2.929098, 0,
-2.989595, -3.08568, 0,
-2.842587, -2.929098, 2,
-2.989595, -3.08568, 2,
-2.842587, -2.929098, 4,
-2.989595, -3.08568, 4
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
-3.283611, -3.398843, -4, 0, -0.5, 0.5, 0.5,
-3.283611, -3.398843, -4, 1, -0.5, 0.5, 0.5,
-3.283611, -3.398843, -4, 1, 1.5, 0.5, 0.5,
-3.283611, -3.398843, -4, 0, 1.5, 0.5, 0.5,
-3.283611, -3.398843, -2, 0, -0.5, 0.5, 0.5,
-3.283611, -3.398843, -2, 1, -0.5, 0.5, 0.5,
-3.283611, -3.398843, -2, 1, 1.5, 0.5, 0.5,
-3.283611, -3.398843, -2, 0, 1.5, 0.5, 0.5,
-3.283611, -3.398843, 0, 0, -0.5, 0.5, 0.5,
-3.283611, -3.398843, 0, 1, -0.5, 0.5, 0.5,
-3.283611, -3.398843, 0, 1, 1.5, 0.5, 0.5,
-3.283611, -3.398843, 0, 0, 1.5, 0.5, 0.5,
-3.283611, -3.398843, 2, 0, -0.5, 0.5, 0.5,
-3.283611, -3.398843, 2, 1, -0.5, 0.5, 0.5,
-3.283611, -3.398843, 2, 1, 1.5, 0.5, 0.5,
-3.283611, -3.398843, 2, 0, 1.5, 0.5, 0.5,
-3.283611, -3.398843, 4, 0, -0.5, 0.5, 0.5,
-3.283611, -3.398843, 4, 1, -0.5, 0.5, 0.5,
-3.283611, -3.398843, 4, 1, 1.5, 0.5, 0.5,
-3.283611, -3.398843, 4, 0, 1.5, 0.5, 0.5
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
-2.842587, -2.929098, -5.697936,
-2.842587, 3.33417, -5.697936,
-2.842587, -2.929098, 5.535534,
-2.842587, 3.33417, 5.535534,
-2.842587, -2.929098, -5.697936,
-2.842587, -2.929098, 5.535534,
-2.842587, 3.33417, -5.697936,
-2.842587, 3.33417, 5.535534,
-2.842587, -2.929098, -5.697936,
3.037731, -2.929098, -5.697936,
-2.842587, -2.929098, 5.535534,
3.037731, -2.929098, 5.535534,
-2.842587, 3.33417, -5.697936,
3.037731, 3.33417, -5.697936,
-2.842587, 3.33417, 5.535534,
3.037731, 3.33417, 5.535534,
3.037731, -2.929098, -5.697936,
3.037731, 3.33417, -5.697936,
3.037731, -2.929098, 5.535534,
3.037731, 3.33417, 5.535534,
3.037731, -2.929098, -5.697936,
3.037731, -2.929098, 5.535534,
3.037731, 3.33417, -5.697936,
3.037731, 3.33417, 5.535534
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
var radius = 7.551579;
var distance = 33.59782;
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
mvMatrix.translate( -0.09757209, -0.202536, 0.08120108 );
mvMatrix.scale( 1.388516, 1.303619, 0.7268382 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.59782);
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
sulfate_copper_sulfa<-read.table("sulfate_copper_sulfa.xyz")
```

```
## Error in read.table("sulfate_copper_sulfa.xyz"): no lines available in input
```

```r
x<-sulfate_copper_sulfa$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulfate_copper_sulfa' not found
```

```r
y<-sulfate_copper_sulfa$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulfate_copper_sulfa' not found
```

```r
z<-sulfate_copper_sulfa$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulfate_copper_sulfa' not found
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
-2.756951, -0.5601531, -1.873065, 0, 0, 1, 1, 1,
-2.596231, -0.3758473, -2.070848, 1, 0, 0, 1, 1,
-2.457054, -0.5972276, -0.7411472, 1, 0, 0, 1, 1,
-2.346961, -0.3607947, -1.245744, 1, 0, 0, 1, 1,
-2.30931, 2.000355, -1.372889, 1, 0, 0, 1, 1,
-2.279345, -0.4084439, -0.5158727, 1, 0, 0, 1, 1,
-2.242427, -0.8815505, -2.247781, 0, 0, 0, 1, 1,
-2.219728, 0.2936786, -1.15938, 0, 0, 0, 1, 1,
-2.214552, -0.38897, -2.797979, 0, 0, 0, 1, 1,
-2.142045, -0.3462737, -0.3607477, 0, 0, 0, 1, 1,
-2.139724, -2.022536, -1.561019, 0, 0, 0, 1, 1,
-2.130601, -0.1763901, -0.9447923, 0, 0, 0, 1, 1,
-2.12147, 0.5856498, -1.797231, 0, 0, 0, 1, 1,
-2.056237, 1.754771, -2.324725, 1, 1, 1, 1, 1,
-2.048639, 0.3055425, 0.01235758, 1, 1, 1, 1, 1,
-2.048562, -0.6471633, -1.590919, 1, 1, 1, 1, 1,
-2.009355, 2.309149, 0.8312209, 1, 1, 1, 1, 1,
-2.007832, 0.5430287, -0.3996611, 1, 1, 1, 1, 1,
-1.943348, 1.146819, -0.429716, 1, 1, 1, 1, 1,
-1.928449, 0.5167426, -0.6649061, 1, 1, 1, 1, 1,
-1.924449, -1.795816, -3.605411, 1, 1, 1, 1, 1,
-1.901924, 1.630563, -3.01134, 1, 1, 1, 1, 1,
-1.89731, 0.6666343, -2.309926, 1, 1, 1, 1, 1,
-1.895947, 2.025102, -1.605573, 1, 1, 1, 1, 1,
-1.893977, -1.729005, -0.9180161, 1, 1, 1, 1, 1,
-1.869486, 0.6212203, -1.236754, 1, 1, 1, 1, 1,
-1.83675, 0.170902, -2.988369, 1, 1, 1, 1, 1,
-1.832037, 0.4377076, -2.188239, 1, 1, 1, 1, 1,
-1.826171, -0.1226665, -1.150629, 0, 0, 1, 1, 1,
-1.81797, 0.5771482, -1.654658, 1, 0, 0, 1, 1,
-1.813043, 1.417803, -1.229005, 1, 0, 0, 1, 1,
-1.812976, 0.2113369, -2.402115, 1, 0, 0, 1, 1,
-1.768143, -0.4411059, -0.4523333, 1, 0, 0, 1, 1,
-1.76543, 1.272319, -2.141557, 1, 0, 0, 1, 1,
-1.752201, 0.3324528, -2.258417, 0, 0, 0, 1, 1,
-1.722917, 0.1519633, -0.9602857, 0, 0, 0, 1, 1,
-1.721258, 0.1197088, -2.649517, 0, 0, 0, 1, 1,
-1.708984, -0.003555457, -3.596606, 0, 0, 0, 1, 1,
-1.707981, -1.623462, -3.39919, 0, 0, 0, 1, 1,
-1.70563, 1.715099, -0.4208259, 0, 0, 0, 1, 1,
-1.690963, -0.7745299, -1.239003, 0, 0, 0, 1, 1,
-1.681587, 0.3569889, -1.752548, 1, 1, 1, 1, 1,
-1.676974, 0.1434711, -1.906533, 1, 1, 1, 1, 1,
-1.633812, -0.09315965, -0.6931641, 1, 1, 1, 1, 1,
-1.61215, -1.005316, -2.358935, 1, 1, 1, 1, 1,
-1.608491, -0.6692462, -1.266937, 1, 1, 1, 1, 1,
-1.600765, -1.145814, -2.035091, 1, 1, 1, 1, 1,
-1.594289, -0.3798425, -3.462275, 1, 1, 1, 1, 1,
-1.586094, -0.2065201, -3.378932, 1, 1, 1, 1, 1,
-1.576321, 0.2197539, -2.031304, 1, 1, 1, 1, 1,
-1.572123, 0.08945916, -1.638013, 1, 1, 1, 1, 1,
-1.563215, 0.1322359, -1.057688, 1, 1, 1, 1, 1,
-1.558982, -0.7399344, -2.717394, 1, 1, 1, 1, 1,
-1.55461, 0.193864, -1.216794, 1, 1, 1, 1, 1,
-1.530048, 1.120394, -0.7192543, 1, 1, 1, 1, 1,
-1.519838, 1.676386, -1.007921, 1, 1, 1, 1, 1,
-1.514345, 0.3908598, -1.107039, 0, 0, 1, 1, 1,
-1.512405, 0.4888795, -0.637531, 1, 0, 0, 1, 1,
-1.511667, -1.889096, -3.395651, 1, 0, 0, 1, 1,
-1.50059, -1.833373, -1.161964, 1, 0, 0, 1, 1,
-1.491912, 0.5298651, -1.798069, 1, 0, 0, 1, 1,
-1.491232, -0.3976554, -1.382028, 1, 0, 0, 1, 1,
-1.482545, -1.019833, -1.17818, 0, 0, 0, 1, 1,
-1.468888, 1.505373, -0.5089293, 0, 0, 0, 1, 1,
-1.464436, -1.75601, -3.178862, 0, 0, 0, 1, 1,
-1.456192, -0.5029784, -0.07381213, 0, 0, 0, 1, 1,
-1.454676, -1.188624, -3.786009, 0, 0, 0, 1, 1,
-1.442742, -1.487633, -2.044619, 0, 0, 0, 1, 1,
-1.432084, -1.492256, -0.7150088, 0, 0, 0, 1, 1,
-1.427874, 0.5817362, -1.268663, 1, 1, 1, 1, 1,
-1.423839, -1.502367, -1.60429, 1, 1, 1, 1, 1,
-1.414946, 0.1306705, -3.376835, 1, 1, 1, 1, 1,
-1.413803, 0.4413371, -2.255826, 1, 1, 1, 1, 1,
-1.411549, 1.364111, -0.4182457, 1, 1, 1, 1, 1,
-1.409647, -0.8688993, -3.085606, 1, 1, 1, 1, 1,
-1.39677, -0.7415547, -2.847542, 1, 1, 1, 1, 1,
-1.388684, -2.610438, -2.647144, 1, 1, 1, 1, 1,
-1.387849, 0.4978855, -1.723992, 1, 1, 1, 1, 1,
-1.385472, -0.8702745, -1.249634, 1, 1, 1, 1, 1,
-1.375124, 1.401513, 0.5542661, 1, 1, 1, 1, 1,
-1.358836, -0.3286075, -2.799709, 1, 1, 1, 1, 1,
-1.350876, -0.6666235, -0.5076026, 1, 1, 1, 1, 1,
-1.350112, 0.2389214, -1.934443, 1, 1, 1, 1, 1,
-1.343678, 0.04818869, -2.963531, 1, 1, 1, 1, 1,
-1.341782, 0.6669623, -0.1773065, 0, 0, 1, 1, 1,
-1.327752, -0.2563564, -2.752204, 1, 0, 0, 1, 1,
-1.315115, 1.685462, -1.08778, 1, 0, 0, 1, 1,
-1.314426, 0.5241212, -0.4298891, 1, 0, 0, 1, 1,
-1.313762, 0.6997948, 0.2178898, 1, 0, 0, 1, 1,
-1.293893, -0.04878183, -0.8518245, 1, 0, 0, 1, 1,
-1.290505, -0.5301477, -1.951472, 0, 0, 0, 1, 1,
-1.284874, 0.7874053, -2.47471, 0, 0, 0, 1, 1,
-1.276694, 0.16342, -0.8301194, 0, 0, 0, 1, 1,
-1.26803, -0.5248646, -0.6460471, 0, 0, 0, 1, 1,
-1.263611, 0.7467672, -2.497291, 0, 0, 0, 1, 1,
-1.247604, 1.4947, -2.081882, 0, 0, 0, 1, 1,
-1.217661, -0.5053666, -2.053044, 0, 0, 0, 1, 1,
-1.216184, -0.7424904, -1.669599, 1, 1, 1, 1, 1,
-1.215917, -0.1580311, -1.13716, 1, 1, 1, 1, 1,
-1.204998, 1.235925, -1.331502, 1, 1, 1, 1, 1,
-1.203074, -0.136085, -2.249378, 1, 1, 1, 1, 1,
-1.199703, 0.5964249, -0.2900664, 1, 1, 1, 1, 1,
-1.164481, -1.153058, -2.277179, 1, 1, 1, 1, 1,
-1.161416, 1.105791, 0.9149895, 1, 1, 1, 1, 1,
-1.149604, -1.334423, -2.676571, 1, 1, 1, 1, 1,
-1.149264, 0.1874278, -1.66837, 1, 1, 1, 1, 1,
-1.139498, -1.733142, -3.568545, 1, 1, 1, 1, 1,
-1.136905, -0.2412948, -0.1650789, 1, 1, 1, 1, 1,
-1.12507, 0.266834, -1.467522, 1, 1, 1, 1, 1,
-1.123549, -1.058204, -3.927564, 1, 1, 1, 1, 1,
-1.119226, 0.7066965, -0.05993684, 1, 1, 1, 1, 1,
-1.116796, -0.2550942, -1.725622, 1, 1, 1, 1, 1,
-1.113514, -0.250872, -1.132926, 0, 0, 1, 1, 1,
-1.113465, -0.1991047, -3.379901, 1, 0, 0, 1, 1,
-1.108851, 0.3013861, -1.152756, 1, 0, 0, 1, 1,
-1.107771, -0.5476198, -3.008499, 1, 0, 0, 1, 1,
-1.101556, 1.268632, -1.425124, 1, 0, 0, 1, 1,
-1.093765, 0.5244168, -0.03983183, 1, 0, 0, 1, 1,
-1.092191, -0.298375, -0.2358431, 0, 0, 0, 1, 1,
-1.091237, -0.1328811, -1.019177, 0, 0, 0, 1, 1,
-1.090081, -2.38635, -1.781289, 0, 0, 0, 1, 1,
-1.087978, 1.591525, 0.4695383, 0, 0, 0, 1, 1,
-1.086929, -2.333534, -3.419052, 0, 0, 0, 1, 1,
-1.08502, -0.3714312, -0.4859311, 0, 0, 0, 1, 1,
-1.07831, 0.3808644, -2.596901, 0, 0, 0, 1, 1,
-1.075333, 0.8910971, 0.38627, 1, 1, 1, 1, 1,
-1.067745, 1.005296, -0.3474723, 1, 1, 1, 1, 1,
-1.060554, 0.1500758, -2.89535, 1, 1, 1, 1, 1,
-1.0549, -1.903823, -2.588396, 1, 1, 1, 1, 1,
-1.053683, -1.094014, -3.794951, 1, 1, 1, 1, 1,
-1.050918, -1.301066, -2.671596, 1, 1, 1, 1, 1,
-1.048824, 0.5254419, -0.6437737, 1, 1, 1, 1, 1,
-1.045474, -0.1689903, -2.107243, 1, 1, 1, 1, 1,
-1.041886, -0.3678113, -2.372875, 1, 1, 1, 1, 1,
-1.040592, -0.2742797, -1.454096, 1, 1, 1, 1, 1,
-1.039842, 0.3667608, -1.614621, 1, 1, 1, 1, 1,
-1.039764, 0.3260559, -2.180679, 1, 1, 1, 1, 1,
-1.03169, -0.4421512, -2.119119, 1, 1, 1, 1, 1,
-1.030429, 0.8055934, -2.237167, 1, 1, 1, 1, 1,
-1.029877, -1.310181, -2.63764, 1, 1, 1, 1, 1,
-1.027017, 0.3938586, -1.170174, 0, 0, 1, 1, 1,
-1.024089, 1.460146, -1.17677, 1, 0, 0, 1, 1,
-1.009673, 3.158757, -0.2494487, 1, 0, 0, 1, 1,
-1.00866, 0.3028908, -0.8832092, 1, 0, 0, 1, 1,
-1.00276, -0.3646085, -3.19375, 1, 0, 0, 1, 1,
-0.9943604, -2.341849, -3.166671, 1, 0, 0, 1, 1,
-0.9867283, -2.054726, -2.331487, 0, 0, 0, 1, 1,
-0.9855162, -1.425308, -1.663705, 0, 0, 0, 1, 1,
-0.9848625, -0.4119759, -0.9794599, 0, 0, 0, 1, 1,
-0.981795, 0.541878, -2.688712, 0, 0, 0, 1, 1,
-0.9803712, -0.2752135, -1.386953, 0, 0, 0, 1, 1,
-0.9764528, -0.3609611, -1.653516, 0, 0, 0, 1, 1,
-0.9701282, 0.1626427, -2.523444, 0, 0, 0, 1, 1,
-0.9691435, -0.7513878, -0.4953917, 1, 1, 1, 1, 1,
-0.9673219, -0.01818551, -1.415822, 1, 1, 1, 1, 1,
-0.9626836, 2.623959, 0.01127478, 1, 1, 1, 1, 1,
-0.960722, 1.486766, -1.409346, 1, 1, 1, 1, 1,
-0.9592553, -0.258039, -2.173746, 1, 1, 1, 1, 1,
-0.9575346, 0.6329508, -1.898729, 1, 1, 1, 1, 1,
-0.9561269, 2.981997, -1.052395, 1, 1, 1, 1, 1,
-0.9505121, 0.8487214, -1.669464, 1, 1, 1, 1, 1,
-0.9447457, -0.8807003, -3.352448, 1, 1, 1, 1, 1,
-0.9407795, 0.6877782, 0.8048029, 1, 1, 1, 1, 1,
-0.9407175, -1.057863, -2.586701, 1, 1, 1, 1, 1,
-0.9377556, -1.647697, 1.080765, 1, 1, 1, 1, 1,
-0.9369884, 0.3544164, -2.547647, 1, 1, 1, 1, 1,
-0.9281645, -0.9404401, -1.516605, 1, 1, 1, 1, 1,
-0.9244387, 0.03682049, -1.435562, 1, 1, 1, 1, 1,
-0.913132, -0.3916406, -3.664093, 0, 0, 1, 1, 1,
-0.9082421, -0.07867704, -0.5569372, 1, 0, 0, 1, 1,
-0.9047522, -0.01483977, -1.752121, 1, 0, 0, 1, 1,
-0.9037614, 0.1496147, -2.546416, 1, 0, 0, 1, 1,
-0.9014302, 0.3016689, -1.025871, 1, 0, 0, 1, 1,
-0.9012895, 0.4960424, -2.478638, 1, 0, 0, 1, 1,
-0.8973867, -1.913085, -3.044376, 0, 0, 0, 1, 1,
-0.8925546, -0.1468181, -3.371114, 0, 0, 0, 1, 1,
-0.8913574, 0.2877035, -1.157868, 0, 0, 0, 1, 1,
-0.8875675, 3.242957, -0.2198193, 0, 0, 0, 1, 1,
-0.8814946, -0.6542712, -3.563626, 0, 0, 0, 1, 1,
-0.8635015, 0.5656875, 0.9947824, 0, 0, 0, 1, 1,
-0.8609869, -0.5524951, -1.630592, 0, 0, 0, 1, 1,
-0.8601187, 0.9444526, -1.50834, 1, 1, 1, 1, 1,
-0.8564337, 1.30729, -0.3379706, 1, 1, 1, 1, 1,
-0.8559024, -0.7869511, -1.405817, 1, 1, 1, 1, 1,
-0.8548277, 0.9643764, -1.023882, 1, 1, 1, 1, 1,
-0.8547513, -1.518592, -3.005315, 1, 1, 1, 1, 1,
-0.8445783, 1.557976, -1.781677, 1, 1, 1, 1, 1,
-0.8445131, -0.7628224, -2.14381, 1, 1, 1, 1, 1,
-0.8414461, -1.135944, -2.097776, 1, 1, 1, 1, 1,
-0.8327585, 0.8802141, 1.078363, 1, 1, 1, 1, 1,
-0.8323036, 1.661341, -1.497655, 1, 1, 1, 1, 1,
-0.830238, 0.6698068, 0.1395696, 1, 1, 1, 1, 1,
-0.8273159, 0.2086726, -0.747857, 1, 1, 1, 1, 1,
-0.8260456, 0.2587913, -0.7477268, 1, 1, 1, 1, 1,
-0.8237344, 0.6773693, -0.7523277, 1, 1, 1, 1, 1,
-0.8214912, 0.2075386, -2.120408, 1, 1, 1, 1, 1,
-0.8209688, -0.4671807, -3.261401, 0, 0, 1, 1, 1,
-0.8151317, -1.47793, -3.506067, 1, 0, 0, 1, 1,
-0.8141539, 0.06018995, -1.771686, 1, 0, 0, 1, 1,
-0.8136418, -0.2196606, -3.601842, 1, 0, 0, 1, 1,
-0.8135602, -0.5601514, -2.164069, 1, 0, 0, 1, 1,
-0.8133841, -0.8584991, -2.058011, 1, 0, 0, 1, 1,
-0.8098632, -1.942608, -2.360588, 0, 0, 0, 1, 1,
-0.8071729, -0.2918751, -1.467334, 0, 0, 0, 1, 1,
-0.8056152, -1.007163, -1.622893, 0, 0, 0, 1, 1,
-0.8006908, -0.7696838, -3.96238, 0, 0, 0, 1, 1,
-0.7977046, -0.9105509, -2.010144, 0, 0, 0, 1, 1,
-0.7959285, -0.3796912, -3.518007, 0, 0, 0, 1, 1,
-0.7948777, 0.1981952, -0.8493262, 0, 0, 0, 1, 1,
-0.7902838, 0.5487307, 1.106717, 1, 1, 1, 1, 1,
-0.7889429, 0.7301521, -0.8394536, 1, 1, 1, 1, 1,
-0.7859354, -0.8051169, -0.6146156, 1, 1, 1, 1, 1,
-0.7797033, 1.437949, 1.559955, 1, 1, 1, 1, 1,
-0.7796378, 0.1456405, -0.2457116, 1, 1, 1, 1, 1,
-0.7773166, 0.1467228, -1.625665, 1, 1, 1, 1, 1,
-0.7659713, -1.168967, -2.09521, 1, 1, 1, 1, 1,
-0.7613052, 2.922533, -0.4687705, 1, 1, 1, 1, 1,
-0.7590489, 0.8840562, -1.115017, 1, 1, 1, 1, 1,
-0.7573639, 0.8490898, 0.1462843, 1, 1, 1, 1, 1,
-0.755421, 0.9730054, -1.226278, 1, 1, 1, 1, 1,
-0.7538584, 1.022096, -1.181862, 1, 1, 1, 1, 1,
-0.7478552, 0.3667462, -1.667109, 1, 1, 1, 1, 1,
-0.7441111, 0.9572656, 0.02348866, 1, 1, 1, 1, 1,
-0.7402336, 0.3185162, -2.230795, 1, 1, 1, 1, 1,
-0.7398, -1.691818, -2.687488, 0, 0, 1, 1, 1,
-0.7381282, 0.423305, -1.859504, 1, 0, 0, 1, 1,
-0.7340725, 1.000949, 0.6939595, 1, 0, 0, 1, 1,
-0.7315633, -0.8987241, -2.441778, 1, 0, 0, 1, 1,
-0.7314491, -1.126592, -3.845702, 1, 0, 0, 1, 1,
-0.7291197, 0.295158, -0.1669721, 1, 0, 0, 1, 1,
-0.7264021, 1.884663, -0.1540185, 0, 0, 0, 1, 1,
-0.7262972, 0.4666254, -0.2099484, 0, 0, 0, 1, 1,
-0.7219754, -0.6003326, -1.519277, 0, 0, 0, 1, 1,
-0.7211648, -0.4801719, -2.922764, 0, 0, 0, 1, 1,
-0.7156402, -1.085198, -2.238366, 0, 0, 0, 1, 1,
-0.7123993, 0.6561773, -1.552186, 0, 0, 0, 1, 1,
-0.7058226, -2.399651, -1.402893, 0, 0, 0, 1, 1,
-0.705114, -0.6194766, -3.438643, 1, 1, 1, 1, 1,
-0.7043976, -1.507984, -1.923982, 1, 1, 1, 1, 1,
-0.7004846, -0.5106517, -2.475339, 1, 1, 1, 1, 1,
-0.6965081, 0.9254196, -1.308367, 1, 1, 1, 1, 1,
-0.6956345, -0.252034, -2.351253, 1, 1, 1, 1, 1,
-0.6857074, -0.7737315, -2.874496, 1, 1, 1, 1, 1,
-0.6846936, -0.9886312, -1.801101, 1, 1, 1, 1, 1,
-0.6846377, -0.8746676, -3.923105, 1, 1, 1, 1, 1,
-0.6831178, -0.364, -2.580457, 1, 1, 1, 1, 1,
-0.6819393, 0.7867209, 0.05615699, 1, 1, 1, 1, 1,
-0.6773529, -0.2694502, -0.4681148, 1, 1, 1, 1, 1,
-0.6717596, -0.7863421, -0.7592361, 1, 1, 1, 1, 1,
-0.6689982, 0.01310848, -1.202544, 1, 1, 1, 1, 1,
-0.6682004, 0.03798136, -0.2657492, 1, 1, 1, 1, 1,
-0.6658306, -1.336171, -3.573981, 1, 1, 1, 1, 1,
-0.6598898, 0.7820024, -1.95399, 0, 0, 1, 1, 1,
-0.6535478, -0.3762318, -2.499427, 1, 0, 0, 1, 1,
-0.6486726, -2.089483, -5.137518, 1, 0, 0, 1, 1,
-0.6435318, -0.8135744, -2.811274, 1, 0, 0, 1, 1,
-0.6434341, 0.5728323, -0.5793422, 1, 0, 0, 1, 1,
-0.6289533, 0.9213561, -0.08906927, 1, 0, 0, 1, 1,
-0.6257076, -0.6597146, -1.1992, 0, 0, 0, 1, 1,
-0.6206827, -0.4369979, -1.997249, 0, 0, 0, 1, 1,
-0.6144507, 0.6862393, 0.2798824, 0, 0, 0, 1, 1,
-0.6124877, -0.392035, -1.778318, 0, 0, 0, 1, 1,
-0.6122367, -1.706659, -1.505689, 0, 0, 0, 1, 1,
-0.6118648, -0.3074036, -1.241512, 0, 0, 0, 1, 1,
-0.6094204, 0.3031673, -2.239859, 0, 0, 0, 1, 1,
-0.608894, -0.9548147, -2.232683, 1, 1, 1, 1, 1,
-0.6082583, 0.09306933, -1.881571, 1, 1, 1, 1, 1,
-0.5937301, -0.4497198, -3.019321, 1, 1, 1, 1, 1,
-0.5925224, -0.8293936, -2.016476, 1, 1, 1, 1, 1,
-0.5804498, 0.589452, -2.178293, 1, 1, 1, 1, 1,
-0.5767741, 0.4863918, -0.6068198, 1, 1, 1, 1, 1,
-0.5737044, -0.5479701, -1.205696, 1, 1, 1, 1, 1,
-0.5732199, -0.606065, -1.42712, 1, 1, 1, 1, 1,
-0.5729113, 0.2158403, -2.947739, 1, 1, 1, 1, 1,
-0.5704473, 0.1206435, -0.4716626, 1, 1, 1, 1, 1,
-0.5697229, -1.533513, -4.541655, 1, 1, 1, 1, 1,
-0.5664, 0.1123208, -1.00313, 1, 1, 1, 1, 1,
-0.5649007, -0.3821829, -1.898695, 1, 1, 1, 1, 1,
-0.5622778, -0.9811105, -1.263258, 1, 1, 1, 1, 1,
-0.5585948, 0.4339305, -0.6701781, 1, 1, 1, 1, 1,
-0.5584079, 0.04608504, 0.3328251, 0, 0, 1, 1, 1,
-0.5548087, 1.438858, 1.27216, 1, 0, 0, 1, 1,
-0.5546973, -0.37807, -0.2965561, 1, 0, 0, 1, 1,
-0.5541224, -0.9891973, -0.8254044, 1, 0, 0, 1, 1,
-0.5497535, 0.7875463, -0.6716734, 1, 0, 0, 1, 1,
-0.5489894, 0.2998714, -0.97794, 1, 0, 0, 1, 1,
-0.5423809, -0.3360625, -2.502306, 0, 0, 0, 1, 1,
-0.5408918, 0.008755606, -0.06241312, 0, 0, 0, 1, 1,
-0.5386308, 0.3113842, -0.7661439, 0, 0, 0, 1, 1,
-0.5385125, -1.759698, -2.768788, 0, 0, 0, 1, 1,
-0.5366466, -2.066657, -2.657458, 0, 0, 0, 1, 1,
-0.5346418, 1.060342, 0.7684176, 0, 0, 0, 1, 1,
-0.5342569, 0.2151206, -1.47883, 0, 0, 0, 1, 1,
-0.5327892, -0.461759, -2.821513, 1, 1, 1, 1, 1,
-0.5312281, 0.7906907, -0.7608023, 1, 1, 1, 1, 1,
-0.5291849, 0.0450649, -1.374385, 1, 1, 1, 1, 1,
-0.5281154, 0.2581062, -1.223994, 1, 1, 1, 1, 1,
-0.5239252, 1.802344, -0.1480858, 1, 1, 1, 1, 1,
-0.5214826, 0.06413121, -1.508246, 1, 1, 1, 1, 1,
-0.5186751, 0.4535803, 0.3263853, 1, 1, 1, 1, 1,
-0.5184784, -0.8887787, -3.542693, 1, 1, 1, 1, 1,
-0.5176061, 0.5110051, 0.0854521, 1, 1, 1, 1, 1,
-0.5159603, -0.2290184, -2.77364, 1, 1, 1, 1, 1,
-0.5122787, 0.2551767, -1.673666, 1, 1, 1, 1, 1,
-0.5084645, 0.3706069, -2.206561, 1, 1, 1, 1, 1,
-0.507821, 0.351597, -2.053993, 1, 1, 1, 1, 1,
-0.5068425, -1.246195, -1.995483, 1, 1, 1, 1, 1,
-0.5064767, -1.879275, -2.918439, 1, 1, 1, 1, 1,
-0.5056406, -0.5366289, -2.770178, 0, 0, 1, 1, 1,
-0.499763, 0.6240147, -1.412715, 1, 0, 0, 1, 1,
-0.4992678, -0.1066252, -2.905924, 1, 0, 0, 1, 1,
-0.493766, -0.07397656, -1.302544, 1, 0, 0, 1, 1,
-0.4924381, 2.122633, -0.4263284, 1, 0, 0, 1, 1,
-0.4923909, -1.832476, -2.189085, 1, 0, 0, 1, 1,
-0.4851218, -0.6851525, -4.757609, 0, 0, 0, 1, 1,
-0.4842447, 0.3515686, 0.3444427, 0, 0, 0, 1, 1,
-0.4809671, 0.1470811, -1.005558, 0, 0, 0, 1, 1,
-0.476581, 1.273275, 0.4062538, 0, 0, 0, 1, 1,
-0.4738526, -1.131558, -4.264878, 0, 0, 0, 1, 1,
-0.462403, -0.6889088, -2.580561, 0, 0, 0, 1, 1,
-0.4584583, 0.1824371, 0.4828328, 0, 0, 0, 1, 1,
-0.4577047, 1.700678, -0.2703364, 1, 1, 1, 1, 1,
-0.4571453, -0.5924756, -3.880457, 1, 1, 1, 1, 1,
-0.4567839, -0.3314309, -0.1561897, 1, 1, 1, 1, 1,
-0.4557665, -0.2497223, -0.5124737, 1, 1, 1, 1, 1,
-0.4555084, -0.1000382, -1.328948, 1, 1, 1, 1, 1,
-0.4546596, 0.5414652, 0.4977985, 1, 1, 1, 1, 1,
-0.4531426, -1.583304, -2.069902, 1, 1, 1, 1, 1,
-0.4502997, 0.5986291, -1.080758, 1, 1, 1, 1, 1,
-0.4485249, -1.057777, -4.863826, 1, 1, 1, 1, 1,
-0.4481231, 0.244003, 0.142486, 1, 1, 1, 1, 1,
-0.4445611, 0.1901862, -0.8125804, 1, 1, 1, 1, 1,
-0.4438274, -0.3957593, -2.666398, 1, 1, 1, 1, 1,
-0.4436517, 0.1711817, -0.5265543, 1, 1, 1, 1, 1,
-0.4415202, -1.3722, -1.902518, 1, 1, 1, 1, 1,
-0.4338583, 0.7945264, -0.1637298, 1, 1, 1, 1, 1,
-0.4335189, 2.535232, 0.1973197, 0, 0, 1, 1, 1,
-0.4298226, 1.020995, -0.006038425, 1, 0, 0, 1, 1,
-0.4297855, -0.264406, -0.9615375, 1, 0, 0, 1, 1,
-0.425725, -0.3331971, -2.471167, 1, 0, 0, 1, 1,
-0.4218131, -0.5590097, -3.172656, 1, 0, 0, 1, 1,
-0.4163784, -0.8305386, -3.341236, 1, 0, 0, 1, 1,
-0.4162748, -0.1019286, -1.184167, 0, 0, 0, 1, 1,
-0.4039015, -0.6029526, -1.766227, 0, 0, 0, 1, 1,
-0.4037505, 1.342337, -0.1173711, 0, 0, 0, 1, 1,
-0.3992485, -0.1453945, -2.254613, 0, 0, 0, 1, 1,
-0.3979183, -1.0477, -2.183042, 0, 0, 0, 1, 1,
-0.3960381, -0.4129, -2.41718, 0, 0, 0, 1, 1,
-0.3937081, 0.1162274, -2.510126, 0, 0, 0, 1, 1,
-0.3902004, 0.1620045, -2.914783, 1, 1, 1, 1, 1,
-0.3884216, 1.073064, -1.190999, 1, 1, 1, 1, 1,
-0.3882856, -1.460864, -1.839018, 1, 1, 1, 1, 1,
-0.3855475, -0.06580215, -2.044588, 1, 1, 1, 1, 1,
-0.3838858, 0.8660119, 0.930012, 1, 1, 1, 1, 1,
-0.3835563, 1.146317, -0.4739738, 1, 1, 1, 1, 1,
-0.3799199, 1.103371, -1.443365, 1, 1, 1, 1, 1,
-0.3793749, -0.2552472, -2.780344, 1, 1, 1, 1, 1,
-0.3761092, 1.504122, 1.031977, 1, 1, 1, 1, 1,
-0.3730995, -0.3457704, -3.447592, 1, 1, 1, 1, 1,
-0.3693102, 0.5207918, -0.3122801, 1, 1, 1, 1, 1,
-0.3686447, -0.6990205, -4.205312, 1, 1, 1, 1, 1,
-0.3682316, 1.120415, -0.8477094, 1, 1, 1, 1, 1,
-0.3675617, -0.3417687, -3.90312, 1, 1, 1, 1, 1,
-0.3656032, 0.2819432, -2.45977, 1, 1, 1, 1, 1,
-0.3652227, -1.086807, -3.599586, 0, 0, 1, 1, 1,
-0.3628581, 0.4694179, -1.33593, 1, 0, 0, 1, 1,
-0.3615348, -1.181975, -2.345926, 1, 0, 0, 1, 1,
-0.3571387, -0.4096614, -1.90677, 1, 0, 0, 1, 1,
-0.3523647, -0.3317941, -0.1753055, 1, 0, 0, 1, 1,
-0.3496971, 0.2922208, 0.9603754, 1, 0, 0, 1, 1,
-0.3468167, -1.449986, -2.202032, 0, 0, 0, 1, 1,
-0.3438195, 0.5729201, 0.1616067, 0, 0, 0, 1, 1,
-0.3423872, -1.381675, -0.3461436, 0, 0, 0, 1, 1,
-0.341992, -0.7204337, -1.040705, 0, 0, 0, 1, 1,
-0.3378781, -1.093432, -2.772614, 0, 0, 0, 1, 1,
-0.3342927, 1.386151, 0.2017707, 0, 0, 0, 1, 1,
-0.3329872, -2.837885, -3.482865, 0, 0, 0, 1, 1,
-0.3321787, 0.5359753, -0.2201381, 1, 1, 1, 1, 1,
-0.330211, -2.193141, -1.599385, 1, 1, 1, 1, 1,
-0.3250631, -0.6943455, -3.185726, 1, 1, 1, 1, 1,
-0.3245497, 2.203814, -0.665701, 1, 1, 1, 1, 1,
-0.3216621, -0.2003071, -2.562141, 1, 1, 1, 1, 1,
-0.3210082, 0.3500797, 1.010721, 1, 1, 1, 1, 1,
-0.3202477, 1.042809, -0.3832101, 1, 1, 1, 1, 1,
-0.3187394, -0.7972379, -4.070083, 1, 1, 1, 1, 1,
-0.3132591, 1.646264, -1.049564, 1, 1, 1, 1, 1,
-0.3126134, -0.4553886, -2.247256, 1, 1, 1, 1, 1,
-0.3105363, -0.07200792, -2.603143, 1, 1, 1, 1, 1,
-0.3103257, -0.3262851, -1.076594, 1, 1, 1, 1, 1,
-0.3054156, -0.5879127, -1.811606, 1, 1, 1, 1, 1,
-0.3053921, 0.8586421, -1.91987, 1, 1, 1, 1, 1,
-0.2988538, 0.07207154, -2.25471, 1, 1, 1, 1, 1,
-0.2934327, -0.4151225, -1.478591, 0, 0, 1, 1, 1,
-0.2906123, 0.6247211, -1.64253, 1, 0, 0, 1, 1,
-0.2885304, 1.525877, -1.468967, 1, 0, 0, 1, 1,
-0.285791, 2.030375, -0.608928, 1, 0, 0, 1, 1,
-0.2831575, -0.1651239, -2.128171, 1, 0, 0, 1, 1,
-0.2776819, -1.043193, -3.073457, 1, 0, 0, 1, 1,
-0.2760087, -1.138347, -3.548302, 0, 0, 0, 1, 1,
-0.2743472, 0.7845782, -2.079254, 0, 0, 0, 1, 1,
-0.2695684, -0.4693758, -1.821661, 0, 0, 0, 1, 1,
-0.259237, 0.7328711, -0.6320207, 0, 0, 0, 1, 1,
-0.2590584, 1.139081, -0.004031541, 0, 0, 0, 1, 1,
-0.255845, 0.8252741, -0.01636473, 0, 0, 0, 1, 1,
-0.2549894, 0.8256023, -1.970828, 0, 0, 0, 1, 1,
-0.2506599, -0.3529597, -2.511748, 1, 1, 1, 1, 1,
-0.2494724, 0.6079597, -0.3732651, 1, 1, 1, 1, 1,
-0.2488516, -0.6936874, -3.207249, 1, 1, 1, 1, 1,
-0.2476735, 0.2372958, -1.573102, 1, 1, 1, 1, 1,
-0.2469204, -0.4245344, -2.52242, 1, 1, 1, 1, 1,
-0.2455653, 1.158373, -1.62814, 1, 1, 1, 1, 1,
-0.2450794, 1.867994, -0.7613093, 1, 1, 1, 1, 1,
-0.2422615, 1.882951, -0.9878447, 1, 1, 1, 1, 1,
-0.2417963, 1.55424, 0.4445947, 1, 1, 1, 1, 1,
-0.2394558, -0.6947744, -1.739638, 1, 1, 1, 1, 1,
-0.2371539, -0.3797837, -3.549368, 1, 1, 1, 1, 1,
-0.2357351, -0.6272857, -4.200917, 1, 1, 1, 1, 1,
-0.2346396, -1.200837, -5.180634, 1, 1, 1, 1, 1,
-0.2306908, -0.06782949, -1.479154, 1, 1, 1, 1, 1,
-0.2294688, -0.8510848, -2.76909, 1, 1, 1, 1, 1,
-0.229376, 0.1878916, -1.070346, 0, 0, 1, 1, 1,
-0.2247985, -0.05661162, -2.889485, 1, 0, 0, 1, 1,
-0.2224152, 0.6335639, 1.10043, 1, 0, 0, 1, 1,
-0.2194506, -0.482823, -3.686192, 1, 0, 0, 1, 1,
-0.2193067, 2.431799, -0.40715, 1, 0, 0, 1, 1,
-0.2190098, -1.105631, -2.571873, 1, 0, 0, 1, 1,
-0.2187214, 0.4320862, -0.8324966, 0, 0, 0, 1, 1,
-0.2166708, 0.5816088, -0.5916576, 0, 0, 0, 1, 1,
-0.2138851, -0.6681243, -3.943182, 0, 0, 0, 1, 1,
-0.2132153, 0.1181084, -3.731268, 0, 0, 0, 1, 1,
-0.2130008, 0.280361, -2.293059, 0, 0, 0, 1, 1,
-0.2086269, 2.289217, 1.105177, 0, 0, 0, 1, 1,
-0.2084747, 1.057478, -0.3324555, 0, 0, 0, 1, 1,
-0.2050183, -0.02146892, -1.991283, 1, 1, 1, 1, 1,
-0.204936, -0.9238901, -2.973538, 1, 1, 1, 1, 1,
-0.2003019, 1.191394, -2.971087, 1, 1, 1, 1, 1,
-0.1963337, -0.002439133, -2.573421, 1, 1, 1, 1, 1,
-0.1927397, 0.6397792, -1.057704, 1, 1, 1, 1, 1,
-0.1916446, -0.868659, -2.535098, 1, 1, 1, 1, 1,
-0.185949, 1.33815, 0.7244235, 1, 1, 1, 1, 1,
-0.1855189, -0.2087299, -1.903548, 1, 1, 1, 1, 1,
-0.1795372, -0.720513, -4.538738, 1, 1, 1, 1, 1,
-0.1782114, -0.7020078, -3.336264, 1, 1, 1, 1, 1,
-0.1774769, -0.8066608, -3.728713, 1, 1, 1, 1, 1,
-0.1700839, -0.8218884, -1.849266, 1, 1, 1, 1, 1,
-0.1685769, -0.028833, -1.717361, 1, 1, 1, 1, 1,
-0.1680677, 0.1222516, -1.075612, 1, 1, 1, 1, 1,
-0.1673784, -1.899896, -1.447945, 1, 1, 1, 1, 1,
-0.1638321, 0.6136876, 1.135249, 0, 0, 1, 1, 1,
-0.1623205, 0.4869216, -0.5206104, 1, 0, 0, 1, 1,
-0.1560167, -0.2596328, -1.891786, 1, 0, 0, 1, 1,
-0.1555154, -1.261854, -3.751819, 1, 0, 0, 1, 1,
-0.1547802, 0.4883182, -1.635598, 1, 0, 0, 1, 1,
-0.1516556, -0.07928383, -1.853178, 1, 0, 0, 1, 1,
-0.1471159, 0.5376993, 1.479898, 0, 0, 0, 1, 1,
-0.146584, -0.9788601, -1.746585, 0, 0, 0, 1, 1,
-0.1458542, -0.1605582, -1.280242, 0, 0, 0, 1, 1,
-0.1443508, 1.037256, -0.3594021, 0, 0, 0, 1, 1,
-0.14325, -1.438709, -3.68173, 0, 0, 0, 1, 1,
-0.1416828, -1.024385, -2.672187, 0, 0, 0, 1, 1,
-0.1411362, 1.15148, -0.01083794, 0, 0, 0, 1, 1,
-0.1402695, -0.7072488, -1.541677, 1, 1, 1, 1, 1,
-0.1400575, -1.591213, -3.382067, 1, 1, 1, 1, 1,
-0.1391523, -0.3406349, -4.387787, 1, 1, 1, 1, 1,
-0.1322467, 1.761159, 0.9602739, 1, 1, 1, 1, 1,
-0.1321316, -0.1911436, -1.993791, 1, 1, 1, 1, 1,
-0.1315649, -0.0547835, -0.5586093, 1, 1, 1, 1, 1,
-0.1220414, -0.8837817, -2.142915, 1, 1, 1, 1, 1,
-0.1158482, -0.4674796, -3.297217, 1, 1, 1, 1, 1,
-0.1111564, 0.8906602, 0.003087613, 1, 1, 1, 1, 1,
-0.1101505, -0.6980958, -1.708286, 1, 1, 1, 1, 1,
-0.1059135, 0.3017426, 0.7135552, 1, 1, 1, 1, 1,
-0.1053113, -0.9706939, -2.68389, 1, 1, 1, 1, 1,
-0.1013583, -0.05813356, -2.364501, 1, 1, 1, 1, 1,
-0.09211587, -0.5461373, -3.853538, 1, 1, 1, 1, 1,
-0.09035226, -1.573465, -2.852475, 1, 1, 1, 1, 1,
-0.08213433, -1.984379, -2.291873, 0, 0, 1, 1, 1,
-0.08063787, -1.275382, -2.435322, 1, 0, 0, 1, 1,
-0.07921369, -0.7804902, -3.29374, 1, 0, 0, 1, 1,
-0.07820209, -0.1849571, -2.448797, 1, 0, 0, 1, 1,
-0.0739308, 1.373511, 1.054361, 1, 0, 0, 1, 1,
-0.07331385, -1.310408, -3.208918, 1, 0, 0, 1, 1,
-0.06968527, 0.3532342, 0.7665595, 0, 0, 0, 1, 1,
-0.06782722, 0.119413, -0.8144836, 0, 0, 0, 1, 1,
-0.06652642, 0.08840538, -1.170349, 0, 0, 0, 1, 1,
-0.06415089, -1.454665, -4.225006, 0, 0, 0, 1, 1,
-0.06019343, -0.4208234, -1.789158, 0, 0, 0, 1, 1,
-0.05734986, -1.368836, -3.009921, 0, 0, 0, 1, 1,
-0.0522156, 1.832363, -0.822371, 0, 0, 0, 1, 1,
-0.05114056, -0.482715, -5.534342, 1, 1, 1, 1, 1,
-0.05005727, 0.703048, -0.4739138, 1, 1, 1, 1, 1,
-0.04748376, 1.296639, 0.1525573, 1, 1, 1, 1, 1,
-0.04493354, 0.8549767, 1.008701, 1, 1, 1, 1, 1,
-0.04406074, 1.192844, 1.12848, 1, 1, 1, 1, 1,
-0.03987972, 0.8475912, -0.8849799, 1, 1, 1, 1, 1,
-0.03820403, 1.381588, 0.8103974, 1, 1, 1, 1, 1,
-0.03694728, -0.9353881, -3.812399, 1, 1, 1, 1, 1,
-0.03660583, -0.402779, -2.468549, 1, 1, 1, 1, 1,
-0.02946753, 0.1224932, 0.5793109, 1, 1, 1, 1, 1,
-0.02859509, 1.618854, 0.6783276, 1, 1, 1, 1, 1,
-0.02827483, 0.5382591, -0.4029799, 1, 1, 1, 1, 1,
-0.02591678, 1.481509, 0.7092632, 1, 1, 1, 1, 1,
-0.02081222, -0.1749103, -3.620681, 1, 1, 1, 1, 1,
-0.01955888, -0.1233914, -1.711969, 1, 1, 1, 1, 1,
-0.01939662, 0.1524613, 0.8321351, 0, 0, 1, 1, 1,
-0.01675254, -0.8424153, -1.187264, 1, 0, 0, 1, 1,
-0.01558954, 1.106232, 1.377072, 1, 0, 0, 1, 1,
-0.01438859, 0.4385687, 0.06727047, 1, 0, 0, 1, 1,
-0.01413752, 1.374956, 0.2637565, 1, 0, 0, 1, 1,
-0.01230278, -0.02768213, -2.926666, 1, 0, 0, 1, 1,
-0.01139051, -0.4082726, -3.109421, 0, 0, 0, 1, 1,
-0.01131678, -0.3350542, -4.350482, 0, 0, 0, 1, 1,
-0.01036616, 0.9632373, 0.2187278, 0, 0, 0, 1, 1,
-0.005730557, 1.043448, -0.332285, 0, 0, 0, 1, 1,
-0.003301214, 0.06145929, 0.5521462, 0, 0, 0, 1, 1,
0.001404638, 1.020827, -1.207667, 0, 0, 0, 1, 1,
0.003017664, 0.3403492, -0.03994179, 0, 0, 0, 1, 1,
0.006072613, 0.002950064, 3.321556, 1, 1, 1, 1, 1,
0.006666175, 0.9212602, 2.130696, 1, 1, 1, 1, 1,
0.008651421, -0.1911399, 3.804667, 1, 1, 1, 1, 1,
0.009644253, 1.395387, -0.08738369, 1, 1, 1, 1, 1,
0.01495897, 1.508512, -0.4796681, 1, 1, 1, 1, 1,
0.01638538, 1.06269, -1.290643, 1, 1, 1, 1, 1,
0.01947434, -1.324236, 3.346364, 1, 1, 1, 1, 1,
0.02274267, 0.6657684, 0.1672802, 1, 1, 1, 1, 1,
0.02443165, -0.4808875, 2.085167, 1, 1, 1, 1, 1,
0.02770079, 0.8433081, -0.004161755, 1, 1, 1, 1, 1,
0.03550838, -1.433095, 3.482567, 1, 1, 1, 1, 1,
0.04120833, 0.5974301, -0.341824, 1, 1, 1, 1, 1,
0.052959, 0.5871184, -0.7268014, 1, 1, 1, 1, 1,
0.05492692, -1.45436, 3.483268, 1, 1, 1, 1, 1,
0.05808069, 1.097336, 0.2268193, 1, 1, 1, 1, 1,
0.06298073, -0.06412773, 2.476069, 0, 0, 1, 1, 1,
0.06740376, 0.2353005, 0.7082963, 1, 0, 0, 1, 1,
0.07216805, -0.2633623, 2.659862, 1, 0, 0, 1, 1,
0.07273274, 0.1977469, 0.7711526, 1, 0, 0, 1, 1,
0.0817332, -0.6968246, 5.370898, 1, 0, 0, 1, 1,
0.08414622, -0.5829643, 2.916514, 1, 0, 0, 1, 1,
0.08500644, -0.4226056, 3.677685, 0, 0, 0, 1, 1,
0.08615653, -0.3122164, 4.678353, 0, 0, 0, 1, 1,
0.0891029, -0.7003546, 2.776301, 0, 0, 0, 1, 1,
0.08981625, 0.6688178, -0.2980562, 0, 0, 0, 1, 1,
0.09146946, -0.5665055, 3.46746, 0, 0, 0, 1, 1,
0.09213226, -1.035965, 4.490963, 0, 0, 0, 1, 1,
0.09498549, 1.37229, -0.6291474, 0, 0, 0, 1, 1,
0.09702136, -0.1074917, 2.770133, 1, 1, 1, 1, 1,
0.09780132, 0.8168846, -0.4968784, 1, 1, 1, 1, 1,
0.09805933, -1.316109, 3.811621, 1, 1, 1, 1, 1,
0.09959452, -0.3925179, 3.610039, 1, 1, 1, 1, 1,
0.1090298, -0.2272504, 1.597933, 1, 1, 1, 1, 1,
0.1122358, 0.4898849, 1.606321, 1, 1, 1, 1, 1,
0.1163022, 2.197429, -1.111131, 1, 1, 1, 1, 1,
0.1201543, 2.739464, 0.08940288, 1, 1, 1, 1, 1,
0.1209552, 0.4336764, 0.5388308, 1, 1, 1, 1, 1,
0.1210895, 1.07251, 0.4128439, 1, 1, 1, 1, 1,
0.1216494, 0.07363909, 0.5336058, 1, 1, 1, 1, 1,
0.1255775, 1.794751, 0.1693618, 1, 1, 1, 1, 1,
0.1279429, -1.943471, 2.916377, 1, 1, 1, 1, 1,
0.1333709, 0.5887645, -1.373322, 1, 1, 1, 1, 1,
0.1347952, 0.5562658, -0.06396168, 1, 1, 1, 1, 1,
0.1354016, 1.247516, -0.1842879, 0, 0, 1, 1, 1,
0.142165, -1.292736, 2.944123, 1, 0, 0, 1, 1,
0.1436878, 1.462144, 0.3877127, 1, 0, 0, 1, 1,
0.1442026, -1.281976, 1.758787, 1, 0, 0, 1, 1,
0.1481172, -1.581822, 3.132243, 1, 0, 0, 1, 1,
0.1482679, -1.540395, 4.538633, 1, 0, 0, 1, 1,
0.1505789, 0.3594857, 3.245582, 0, 0, 0, 1, 1,
0.1525887, 0.6297718, -1.077869, 0, 0, 0, 1, 1,
0.1548867, -0.5551642, 1.93984, 0, 0, 0, 1, 1,
0.1560156, 0.647646, -1.326468, 0, 0, 0, 1, 1,
0.1634884, -0.4278846, 2.614728, 0, 0, 0, 1, 1,
0.1670482, 0.9907971, -0.6379065, 0, 0, 0, 1, 1,
0.1687354, -0.07276993, 2.069005, 0, 0, 0, 1, 1,
0.1693983, 0.01103532, 2.048309, 1, 1, 1, 1, 1,
0.1703643, 1.251607, 0.7338192, 1, 1, 1, 1, 1,
0.1739646, 2.100443, -0.1182727, 1, 1, 1, 1, 1,
0.1776242, 0.683814, 2.359151, 1, 1, 1, 1, 1,
0.1778064, -1.124272, 2.976958, 1, 1, 1, 1, 1,
0.1831927, -0.5273471, 1.767946, 1, 1, 1, 1, 1,
0.1850677, 2.062998, -1.45543, 1, 1, 1, 1, 1,
0.1873302, -0.06377722, 1.16406, 1, 1, 1, 1, 1,
0.1924681, 1.749122, -0.06098768, 1, 1, 1, 1, 1,
0.1927249, 1.020854, 1.324639, 1, 1, 1, 1, 1,
0.1981988, -0.4988705, 4.403954, 1, 1, 1, 1, 1,
0.1995999, 0.217061, 1.633973, 1, 1, 1, 1, 1,
0.2034545, 0.6048996, 0.01588501, 1, 1, 1, 1, 1,
0.2102251, -0.3295734, 2.403996, 1, 1, 1, 1, 1,
0.2103667, 0.1901278, 0.3404932, 1, 1, 1, 1, 1,
0.2138106, -0.3344686, 3.242522, 0, 0, 1, 1, 1,
0.2164158, -0.4953212, 2.923325, 1, 0, 0, 1, 1,
0.2187347, 0.5620801, 1.36485, 1, 0, 0, 1, 1,
0.2198957, -1.528191, 3.90625, 1, 0, 0, 1, 1,
0.2205746, -0.7857807, 3.733676, 1, 0, 0, 1, 1,
0.2272798, -0.7611841, 2.0059, 1, 0, 0, 1, 1,
0.2275769, -0.5610188, 1.950234, 0, 0, 0, 1, 1,
0.2289363, -0.4366035, 3.979015, 0, 0, 0, 1, 1,
0.2297312, 0.3934803, 1.904383, 0, 0, 0, 1, 1,
0.2345991, 2.896202, -0.7286474, 0, 0, 0, 1, 1,
0.2378707, -2.122343, 5.37194, 0, 0, 0, 1, 1,
0.2382686, 0.5785131, -0.3868891, 0, 0, 0, 1, 1,
0.2413483, -1.020373, 3.63881, 0, 0, 0, 1, 1,
0.2430125, 1.567269, -0.2077179, 1, 1, 1, 1, 1,
0.2537045, -0.1110909, 2.332897, 1, 1, 1, 1, 1,
0.2542985, 1.41738, -0.2731513, 1, 1, 1, 1, 1,
0.2559069, -0.5934569, 3.355347, 1, 1, 1, 1, 1,
0.256986, 0.42123, 0.0513774, 1, 1, 1, 1, 1,
0.2606541, -0.1810733, 2.289725, 1, 1, 1, 1, 1,
0.2608134, 0.2841024, -0.8406225, 1, 1, 1, 1, 1,
0.2636537, 0.8192576, -0.2811768, 1, 1, 1, 1, 1,
0.2669952, -2.540095, 1.710794, 1, 1, 1, 1, 1,
0.2678466, 0.1385998, 1.381455, 1, 1, 1, 1, 1,
0.2688868, -1.340038, 1.719312, 1, 1, 1, 1, 1,
0.2699682, -0.1611627, 2.481755, 1, 1, 1, 1, 1,
0.2713901, -0.6061026, 3.951948, 1, 1, 1, 1, 1,
0.2780157, 0.2627133, -0.6201077, 1, 1, 1, 1, 1,
0.2792461, 1.516249, -0.1220392, 1, 1, 1, 1, 1,
0.282898, 0.7237496, -0.9046873, 0, 0, 1, 1, 1,
0.2874481, 0.4695069, -0.4276539, 1, 0, 0, 1, 1,
0.2936383, -0.1371768, 2.543592, 1, 0, 0, 1, 1,
0.2961653, -0.9615621, 2.881039, 1, 0, 0, 1, 1,
0.2970195, -0.4110724, 2.417718, 1, 0, 0, 1, 1,
0.2985301, -0.4041182, 0.8713973, 1, 0, 0, 1, 1,
0.299521, 0.5781747, 0.08660384, 0, 0, 0, 1, 1,
0.2996893, -0.194926, 2.793771, 0, 0, 0, 1, 1,
0.2997468, 0.8998258, 1.701256, 0, 0, 0, 1, 1,
0.301457, -0.2619206, 3.317383, 0, 0, 0, 1, 1,
0.3022257, 0.005486036, 0.1488985, 0, 0, 0, 1, 1,
0.3045796, -0.2984626, 3.370873, 0, 0, 0, 1, 1,
0.3111448, 1.265017, 0.091434, 0, 0, 0, 1, 1,
0.3370338, 0.6993265, 0.6840464, 1, 1, 1, 1, 1,
0.3436395, 0.6740971, 1.330497, 1, 1, 1, 1, 1,
0.34381, -1.096149, 3.281776, 1, 1, 1, 1, 1,
0.3438849, 1.91744, 0.7965598, 1, 1, 1, 1, 1,
0.3461626, 0.06502072, 0.4791005, 1, 1, 1, 1, 1,
0.3477373, 1.226679, 0.6252628, 1, 1, 1, 1, 1,
0.349398, 2.020725, 0.5819216, 1, 1, 1, 1, 1,
0.3494317, -0.04626843, 2.502613, 1, 1, 1, 1, 1,
0.3528591, 2.178283, 0.06376527, 1, 1, 1, 1, 1,
0.3602859, 1.499174, 0.04533548, 1, 1, 1, 1, 1,
0.3695057, 1.544523, 0.3566689, 1, 1, 1, 1, 1,
0.3720316, 0.7126104, 0.4612128, 1, 1, 1, 1, 1,
0.3815798, -1.20738, 2.310923, 1, 1, 1, 1, 1,
0.3820168, 0.699399, -0.8207074, 1, 1, 1, 1, 1,
0.3826033, -1.516881, 3.405156, 1, 1, 1, 1, 1,
0.3841232, 0.06519224, 1.65072, 0, 0, 1, 1, 1,
0.3889433, 0.3887661, 1.561615, 1, 0, 0, 1, 1,
0.3890095, 1.319135, -0.7360642, 1, 0, 0, 1, 1,
0.3953826, 1.34617, 0.5002878, 1, 0, 0, 1, 1,
0.4034858, 0.8714787, 1.404734, 1, 0, 0, 1, 1,
0.4038267, -0.4506668, 3.879513, 1, 0, 0, 1, 1,
0.4110937, 0.4343124, 1.497117, 0, 0, 0, 1, 1,
0.415692, 0.3872925, 2.854554, 0, 0, 0, 1, 1,
0.4171094, -1.269606, 2.422112, 0, 0, 0, 1, 1,
0.4191028, -0.1110837, 1.433117, 0, 0, 0, 1, 1,
0.42373, -0.2113647, 2.712312, 0, 0, 0, 1, 1,
0.4269002, 0.3292023, 0.8575275, 0, 0, 0, 1, 1,
0.42989, 0.7797346, 1.740915, 0, 0, 0, 1, 1,
0.4307117, 1.224727, 1.784639, 1, 1, 1, 1, 1,
0.4338362, 0.149997, 2.034133, 1, 1, 1, 1, 1,
0.4440197, -1.509372, 1.420896, 1, 1, 1, 1, 1,
0.4447657, 0.02697279, 1.044584, 1, 1, 1, 1, 1,
0.4514032, 0.2448108, 1.437902, 1, 1, 1, 1, 1,
0.4523377, -0.139404, 0.1267218, 1, 1, 1, 1, 1,
0.4523385, 0.6966088, 2.21808, 1, 1, 1, 1, 1,
0.4544119, 0.7704535, 0.1473072, 1, 1, 1, 1, 1,
0.4592226, -1.984448, 0.9810125, 1, 1, 1, 1, 1,
0.4600978, 0.1958346, 2.924294, 1, 1, 1, 1, 1,
0.4677327, -0.260206, 2.332359, 1, 1, 1, 1, 1,
0.4683939, -0.121283, 3.194573, 1, 1, 1, 1, 1,
0.4692489, -0.7295192, 0.4654217, 1, 1, 1, 1, 1,
0.4696326, 0.8639871, 0.05618516, 1, 1, 1, 1, 1,
0.4723143, 0.3237392, 0.4319846, 1, 1, 1, 1, 1,
0.4822792, 0.1144819, 0.2221291, 0, 0, 1, 1, 1,
0.4845461, -0.9185603, 3.085181, 1, 0, 0, 1, 1,
0.4892195, -1.043919, 1.945367, 1, 0, 0, 1, 1,
0.4969456, 1.627476, 1.311669, 1, 0, 0, 1, 1,
0.4979294, 0.2669804, 1.800595, 1, 0, 0, 1, 1,
0.5029002, 1.911251, -1.472565, 1, 0, 0, 1, 1,
0.5032618, -1.565941, 3.635799, 0, 0, 0, 1, 1,
0.5043516, -1.999177, 3.107874, 0, 0, 0, 1, 1,
0.5073797, 1.253291, -1.367599, 0, 0, 0, 1, 1,
0.5089101, 0.8796421, 0.4503717, 0, 0, 0, 1, 1,
0.5127906, -1.282086, 2.057774, 0, 0, 0, 1, 1,
0.5241227, -0.5110302, 2.201422, 0, 0, 0, 1, 1,
0.5294542, -0.5856276, 2.335613, 0, 0, 0, 1, 1,
0.5306382, 0.7957086, 0.4007961, 1, 1, 1, 1, 1,
0.5329056, 2.059314, 1.213602, 1, 1, 1, 1, 1,
0.5370022, 0.8706204, 1.419095, 1, 1, 1, 1, 1,
0.5371989, -0.1320248, 1.15953, 1, 1, 1, 1, 1,
0.5401348, 0.9713438, 0.1509923, 1, 1, 1, 1, 1,
0.5449722, -0.2621011, 0.7386828, 1, 1, 1, 1, 1,
0.5455944, 1.841145, -1.345651, 1, 1, 1, 1, 1,
0.5476528, 0.05349729, 2.602597, 1, 1, 1, 1, 1,
0.5482149, 0.4455431, 0.6185595, 1, 1, 1, 1, 1,
0.5484164, 0.5835084, -0.1437302, 1, 1, 1, 1, 1,
0.551433, 0.1126943, 0.00583804, 1, 1, 1, 1, 1,
0.5535996, -2.332257, 2.491347, 1, 1, 1, 1, 1,
0.5561216, 0.07827374, 2.725283, 1, 1, 1, 1, 1,
0.5564356, -0.6955703, 1.25361, 1, 1, 1, 1, 1,
0.5579646, -0.6697826, 2.727735, 1, 1, 1, 1, 1,
0.5581067, -0.2153013, 2.231172, 0, 0, 1, 1, 1,
0.5662041, 1.299105, -0.9603477, 1, 0, 0, 1, 1,
0.5700233, -0.7293085, 3.557134, 1, 0, 0, 1, 1,
0.5713914, -1.211934, 1.683646, 1, 0, 0, 1, 1,
0.580294, -1.005251, 1.968612, 1, 0, 0, 1, 1,
0.5805019, -0.7007598, 1.827141, 1, 0, 0, 1, 1,
0.580611, -0.2326319, 2.087872, 0, 0, 0, 1, 1,
0.5819843, 0.676061, 0.7090468, 0, 0, 0, 1, 1,
0.5880974, 0.5192395, 1.873854, 0, 0, 0, 1, 1,
0.589896, 0.7650447, 1.283203, 0, 0, 0, 1, 1,
0.6010336, -1.14935, 2.0779, 0, 0, 0, 1, 1,
0.6093004, 0.5487645, 1.235678, 0, 0, 0, 1, 1,
0.6132414, -0.7019226, 1.509232, 0, 0, 0, 1, 1,
0.6139358, -1.309953, -0.026489, 1, 1, 1, 1, 1,
0.6155735, 1.301349, 1.47508, 1, 1, 1, 1, 1,
0.6173385, -0.1648785, -0.1207447, 1, 1, 1, 1, 1,
0.6174435, 1.506747, -0.00334153, 1, 1, 1, 1, 1,
0.6180748, -1.571582, 2.538905, 1, 1, 1, 1, 1,
0.6188762, -0.3999367, 3.188031, 1, 1, 1, 1, 1,
0.6189095, -0.927458, 2.989574, 1, 1, 1, 1, 1,
0.6191051, -1.499497, 1.331964, 1, 1, 1, 1, 1,
0.6197916, -1.527062, 4.413583, 1, 1, 1, 1, 1,
0.6213816, -0.6350737, 3.038662, 1, 1, 1, 1, 1,
0.6218483, -0.2120208, 0.9710513, 1, 1, 1, 1, 1,
0.62498, -0.1677084, 0.6958108, 1, 1, 1, 1, 1,
0.6311762, -0.5309625, 1.091599, 1, 1, 1, 1, 1,
0.6312361, 0.005858313, 2.007437, 1, 1, 1, 1, 1,
0.6328068, -0.06278659, 0.9748836, 1, 1, 1, 1, 1,
0.6371145, -1.466613, 4.181797, 0, 0, 1, 1, 1,
0.6388707, -0.1125648, 1.162635, 1, 0, 0, 1, 1,
0.6418681, 0.7019692, 1.733207, 1, 0, 0, 1, 1,
0.642688, -2.305124, 2.874424, 1, 0, 0, 1, 1,
0.6435611, -0.3768544, 3.11855, 1, 0, 0, 1, 1,
0.6486387, -0.2184475, 0.9520352, 1, 0, 0, 1, 1,
0.6547127, 1.142341, 0.8447092, 0, 0, 0, 1, 1,
0.6580964, 1.772736, 0.9769112, 0, 0, 0, 1, 1,
0.6606949, 0.4114138, -0.7568067, 0, 0, 0, 1, 1,
0.6663586, 1.502932, -0.06298419, 0, 0, 0, 1, 1,
0.6681581, 0.8823764, -0.2561993, 0, 0, 0, 1, 1,
0.671681, -0.1076989, 0.409714, 0, 0, 0, 1, 1,
0.6729388, -0.1349397, 1.362496, 0, 0, 0, 1, 1,
0.6756904, -0.7765915, 3.084126, 1, 1, 1, 1, 1,
0.6780872, 0.4902742, -1.06714, 1, 1, 1, 1, 1,
0.6897753, 0.4912976, 1.409525, 1, 1, 1, 1, 1,
0.6963199, 1.47155, 0.6230037, 1, 1, 1, 1, 1,
0.7024356, 1.082739, -1.376577, 1, 1, 1, 1, 1,
0.711537, -0.5964135, 2.499354, 1, 1, 1, 1, 1,
0.7125932, -0.2038145, 3.08829, 1, 1, 1, 1, 1,
0.7178336, 0.7033986, 0.1902293, 1, 1, 1, 1, 1,
0.7194901, -1.766717, 3.57423, 1, 1, 1, 1, 1,
0.7198615, -0.01180388, 1.485222, 1, 1, 1, 1, 1,
0.7218481, -2.42215, 2.339749, 1, 1, 1, 1, 1,
0.7246113, 1.121295, -0.5874454, 1, 1, 1, 1, 1,
0.7283329, -0.01043265, -0.0800419, 1, 1, 1, 1, 1,
0.730567, -0.8225573, 1.356358, 1, 1, 1, 1, 1,
0.7306347, -1.878144, 1.712502, 1, 1, 1, 1, 1,
0.7327614, 0.7236812, 2.335698, 0, 0, 1, 1, 1,
0.7368242, -1.380276, 3.000085, 1, 0, 0, 1, 1,
0.737275, -1.049781, 3.910437, 1, 0, 0, 1, 1,
0.7441426, 0.1620944, 1.441537, 1, 0, 0, 1, 1,
0.7451664, -1.341678, 1.860762, 1, 0, 0, 1, 1,
0.7470024, 0.254841, 1.569071, 1, 0, 0, 1, 1,
0.7499859, -0.2944405, 1.536221, 0, 0, 0, 1, 1,
0.7562566, -0.6988223, 1.900104, 0, 0, 0, 1, 1,
0.7572151, -0.1778661, 2.799523, 0, 0, 0, 1, 1,
0.7600064, -0.6901704, 1.32982, 0, 0, 0, 1, 1,
0.7617267, -0.1244757, 1.11218, 0, 0, 0, 1, 1,
0.7621993, -1.314253, 2.488058, 0, 0, 0, 1, 1,
0.7664802, 0.01931661, 0.7787119, 0, 0, 0, 1, 1,
0.7676795, 0.3803922, -0.3628583, 1, 1, 1, 1, 1,
0.7690395, 0.8164185, 1.338725, 1, 1, 1, 1, 1,
0.7695339, -1.292325, 3.462443, 1, 1, 1, 1, 1,
0.7713595, -1.784954, 1.953072, 1, 1, 1, 1, 1,
0.7716097, -0.2162228, 3.021374, 1, 1, 1, 1, 1,
0.7801509, -1.107826, 0.4248723, 1, 1, 1, 1, 1,
0.7804928, 0.0594145, 0.186841, 1, 1, 1, 1, 1,
0.7807952, -0.5006788, 3.101243, 1, 1, 1, 1, 1,
0.7816826, 0.6393853, 1.650399, 1, 1, 1, 1, 1,
0.7860992, 0.8231092, 1.221013, 1, 1, 1, 1, 1,
0.7895612, 0.9274437, 0.7750582, 1, 1, 1, 1, 1,
0.7938354, 0.03737747, -0.2898947, 1, 1, 1, 1, 1,
0.7939611, -1.020878, 2.356137, 1, 1, 1, 1, 1,
0.7940496, -1.065537, 1.921179, 1, 1, 1, 1, 1,
0.7951055, -1.76457, 4.3066, 1, 1, 1, 1, 1,
0.7981499, 0.4027341, 1.499219, 0, 0, 1, 1, 1,
0.7982796, 0.9431857, 0.6907917, 1, 0, 0, 1, 1,
0.8030499, 1.50415, -0.07854437, 1, 0, 0, 1, 1,
0.8120905, 0.7965348, 0.4614404, 1, 0, 0, 1, 1,
0.8126141, -1.802691, 4.276484, 1, 0, 0, 1, 1,
0.818708, -0.4590211, 0.9002893, 1, 0, 0, 1, 1,
0.8265317, 0.7077869, 1.809845, 0, 0, 0, 1, 1,
0.827062, 0.9535758, 0.9703649, 0, 0, 0, 1, 1,
0.8310011, 0.8926792, 1.505739, 0, 0, 0, 1, 1,
0.8363837, 1.912215, 1.427042, 0, 0, 0, 1, 1,
0.8366436, 0.4175297, 1.415113, 0, 0, 0, 1, 1,
0.8391979, -0.03810297, -0.07209276, 0, 0, 0, 1, 1,
0.8589037, 2.22997, 1.24548, 0, 0, 0, 1, 1,
0.8658428, 0.3574465, 1.900603, 1, 1, 1, 1, 1,
0.8685979, 0.07201646, 0.7171032, 1, 1, 1, 1, 1,
0.8726454, -0.8302203, 3.69894, 1, 1, 1, 1, 1,
0.8799707, 0.8084176, -0.007707436, 1, 1, 1, 1, 1,
0.882309, -0.4287472, 1.899867, 1, 1, 1, 1, 1,
0.884208, 1.416908, 2.274569, 1, 1, 1, 1, 1,
0.8851445, 1.09426, -0.1683113, 1, 1, 1, 1, 1,
0.8922297, -0.8647734, 0.4878907, 1, 1, 1, 1, 1,
0.8930422, 1.326715, 2.399612, 1, 1, 1, 1, 1,
0.8953535, 0.009277196, 3.028358, 1, 1, 1, 1, 1,
0.8958398, -2.262536, 3.96786, 1, 1, 1, 1, 1,
0.900758, 0.36923, 0.4466124, 1, 1, 1, 1, 1,
0.9057925, -0.364394, 3.387931, 1, 1, 1, 1, 1,
0.9100714, -0.329687, 2.188872, 1, 1, 1, 1, 1,
0.9112312, -0.5284554, 2.054257, 1, 1, 1, 1, 1,
0.9122505, -1.33129, 1.778509, 0, 0, 1, 1, 1,
0.9226149, -1.352087, 1.515759, 1, 0, 0, 1, 1,
0.9226681, 1.79533, -0.9571359, 1, 0, 0, 1, 1,
0.9236522, 1.926292, 2.142924, 1, 0, 0, 1, 1,
0.9303542, -0.5289888, 1.695427, 1, 0, 0, 1, 1,
0.9311161, -0.3680732, 2.901147, 1, 0, 0, 1, 1,
0.9329948, -0.472319, 1.92478, 0, 0, 0, 1, 1,
0.9344896, 0.939511, 1.129379, 0, 0, 0, 1, 1,
0.9349539, -0.121669, 1.061885, 0, 0, 0, 1, 1,
0.9378656, -0.1825971, 1.18365, 0, 0, 0, 1, 1,
0.9380068, 0.03014092, 1.308491, 0, 0, 0, 1, 1,
0.943013, -0.005405314, 2.53055, 0, 0, 0, 1, 1,
0.944059, 1.1036, 1.320521, 0, 0, 0, 1, 1,
0.9460732, 0.3742333, 0.716885, 1, 1, 1, 1, 1,
0.9489456, 0.8631187, -0.9812953, 1, 1, 1, 1, 1,
0.9505993, 0.3002482, 0.896594, 1, 1, 1, 1, 1,
0.9516822, 0.8644045, -1.043104, 1, 1, 1, 1, 1,
0.9530576, 0.298477, 1.204657, 1, 1, 1, 1, 1,
0.9564594, -0.7279302, 1.392213, 1, 1, 1, 1, 1,
0.9672812, 0.5100476, 1.055959, 1, 1, 1, 1, 1,
0.9674569, 0.5364875, 1.428567, 1, 1, 1, 1, 1,
0.9681976, 0.4011509, 1.178147, 1, 1, 1, 1, 1,
0.9690042, 0.8613627, 1.342599, 1, 1, 1, 1, 1,
0.9725739, 0.4421811, 2.017868, 1, 1, 1, 1, 1,
0.9769328, 1.375584, 1.845798, 1, 1, 1, 1, 1,
0.982403, 1.328452, 1.862083, 1, 1, 1, 1, 1,
0.9843739, -0.3650064, 2.027457, 1, 1, 1, 1, 1,
0.98609, -0.1995137, 2.551032, 1, 1, 1, 1, 1,
0.9908738, 1.405449, -0.6203968, 0, 0, 1, 1, 1,
0.996607, -0.9808729, 2.023067, 1, 0, 0, 1, 1,
0.9970753, 1.361, 0.08399978, 1, 0, 0, 1, 1,
0.9970818, -1.156821, 1.793177, 1, 0, 0, 1, 1,
0.9985306, 0.06452979, 0.9999762, 1, 0, 0, 1, 1,
0.999724, -0.4859804, 2.539439, 1, 0, 0, 1, 1,
1.000381, -0.6246756, 2.009658, 0, 0, 0, 1, 1,
1.002829, -1.589581, 2.047118, 0, 0, 0, 1, 1,
1.006601, -0.3081122, 2.20679, 0, 0, 0, 1, 1,
1.006926, 0.001293285, 2.288391, 0, 0, 0, 1, 1,
1.013191, 0.4849725, 0.5473164, 0, 0, 0, 1, 1,
1.01754, 0.3892641, 0.06619443, 0, 0, 0, 1, 1,
1.020087, 0.2287916, 2.772705, 0, 0, 0, 1, 1,
1.022742, -0.09218369, 1.32645, 1, 1, 1, 1, 1,
1.028971, -1.7288, 3.118124, 1, 1, 1, 1, 1,
1.032411, -1.762239, 2.529657, 1, 1, 1, 1, 1,
1.034676, 0.5115748, 1.259398, 1, 1, 1, 1, 1,
1.039085, 2.236385, 0.9152302, 1, 1, 1, 1, 1,
1.039575, -0.1558085, 3.237744, 1, 1, 1, 1, 1,
1.039735, 0.09734904, 2.180199, 1, 1, 1, 1, 1,
1.045716, 1.779902, 0.7914069, 1, 1, 1, 1, 1,
1.052301, 0.7097868, 0.6050122, 1, 1, 1, 1, 1,
1.060703, -0.3685109, 1.889084, 1, 1, 1, 1, 1,
1.062609, 0.4520845, -0.448133, 1, 1, 1, 1, 1,
1.064847, -0.4130849, 3.022279, 1, 1, 1, 1, 1,
1.076872, 1.278147, -1.324752, 1, 1, 1, 1, 1,
1.079148, -0.6647266, 1.806496, 1, 1, 1, 1, 1,
1.087167, -0.6248906, 2.771629, 1, 1, 1, 1, 1,
1.092079, 0.4153013, 2.153936, 0, 0, 1, 1, 1,
1.097962, -0.2682858, 2.522704, 1, 0, 0, 1, 1,
1.101643, 1.049626, 0.6824502, 1, 0, 0, 1, 1,
1.101646, -1.700235, 0.5002307, 1, 0, 0, 1, 1,
1.102448, -1.932495, 1.258224, 1, 0, 0, 1, 1,
1.103937, -0.3897212, 3.490354, 1, 0, 0, 1, 1,
1.112276, 0.488019, 0.8287364, 0, 0, 0, 1, 1,
1.119726, 0.72864, 2.755526, 0, 0, 0, 1, 1,
1.125299, 1.586047, 1.731779, 0, 0, 0, 1, 1,
1.125541, -1.489059, 4.146334, 0, 0, 0, 1, 1,
1.146134, -0.1825683, -0.2610597, 0, 0, 0, 1, 1,
1.147116, -0.8897082, 3.73524, 0, 0, 0, 1, 1,
1.153112, -1.774421, 2.567003, 0, 0, 0, 1, 1,
1.165567, 0.1300676, 3.472939, 1, 1, 1, 1, 1,
1.167002, -0.8528998, 1.231514, 1, 1, 1, 1, 1,
1.176971, -0.04702623, 3.558448, 1, 1, 1, 1, 1,
1.184333, -0.7030196, 3.230793, 1, 1, 1, 1, 1,
1.193754, 1.05178, 1.446723, 1, 1, 1, 1, 1,
1.193857, -0.5787376, 3.637008, 1, 1, 1, 1, 1,
1.211583, -1.284784, 1.497486, 1, 1, 1, 1, 1,
1.218341, -0.5451721, 3.136636, 1, 1, 1, 1, 1,
1.223919, 1.610502, -0.3273987, 1, 1, 1, 1, 1,
1.227669, 0.4394288, 0.2043506, 1, 1, 1, 1, 1,
1.236509, -1.213177, 1.481977, 1, 1, 1, 1, 1,
1.249992, -1.865819, 2.816255, 1, 1, 1, 1, 1,
1.260357, 0.2314133, -0.6772677, 1, 1, 1, 1, 1,
1.261534, 0.04251617, 2.886107, 1, 1, 1, 1, 1,
1.262377, -0.9434168, 1.141219, 1, 1, 1, 1, 1,
1.262467, -0.3370478, 1.395051, 0, 0, 1, 1, 1,
1.264631, -0.5053502, 1.328605, 1, 0, 0, 1, 1,
1.272895, -0.4183453, 1.701057, 1, 0, 0, 1, 1,
1.275833, 2.839213, -0.1058429, 1, 0, 0, 1, 1,
1.284754, 0.5918559, 0.5815639, 1, 0, 0, 1, 1,
1.291465, 1.895953, 2.190277, 1, 0, 0, 1, 1,
1.294398, 0.2470961, 1.277243, 0, 0, 0, 1, 1,
1.297472, -0.1736146, 1.805956, 0, 0, 0, 1, 1,
1.303647, -0.9235111, 2.895794, 0, 0, 0, 1, 1,
1.317963, 2.421292, 0.3786468, 0, 0, 0, 1, 1,
1.321396, -0.02081297, 1.716717, 0, 0, 0, 1, 1,
1.327937, -0.1118373, -0.04604514, 0, 0, 0, 1, 1,
1.329149, 0.957356, -0.4236731, 0, 0, 0, 1, 1,
1.330606, 0.9207621, 2.021619, 1, 1, 1, 1, 1,
1.334072, 0.032097, -0.2122537, 1, 1, 1, 1, 1,
1.341363, 1.082588, 2.629658, 1, 1, 1, 1, 1,
1.344383, 0.4517819, -0.6227669, 1, 1, 1, 1, 1,
1.346274, -2.083646, 0.7744259, 1, 1, 1, 1, 1,
1.359191, 0.3616848, 2.714044, 1, 1, 1, 1, 1,
1.361885, 2.43264, 0.6166903, 1, 1, 1, 1, 1,
1.367221, 0.9633093, 0.08670405, 1, 1, 1, 1, 1,
1.374195, 2.249327, -0.2053874, 1, 1, 1, 1, 1,
1.38589, 0.7679347, 2.649655, 1, 1, 1, 1, 1,
1.389947, 0.0800836, 2.403292, 1, 1, 1, 1, 1,
1.400591, -1.26284, 2.854116, 1, 1, 1, 1, 1,
1.409034, 0.4238179, 2.440309, 1, 1, 1, 1, 1,
1.41626, -0.7019995, 3.578637, 1, 1, 1, 1, 1,
1.418782, -0.3289058, 2.452824, 1, 1, 1, 1, 1,
1.439377, -1.114978, 2.737995, 0, 0, 1, 1, 1,
1.440039, -0.6743808, 3.031025, 1, 0, 0, 1, 1,
1.463959, 0.5114182, 1.271393, 1, 0, 0, 1, 1,
1.467789, 0.2347302, -0.5250061, 1, 0, 0, 1, 1,
1.487166, 1.234311, 0.3578067, 1, 0, 0, 1, 1,
1.494956, 0.2431276, 0.3854977, 1, 0, 0, 1, 1,
1.506701, -1.920781, 3.464143, 0, 0, 0, 1, 1,
1.512067, 0.2303495, 1.209804, 0, 0, 0, 1, 1,
1.522136, -1.623867, 2.17427, 0, 0, 0, 1, 1,
1.54533, -1.203019, 3.270006, 0, 0, 0, 1, 1,
1.547562, 0.3428712, 2.009521, 0, 0, 0, 1, 1,
1.552962, 0.3747429, 2.030973, 0, 0, 0, 1, 1,
1.553205, 0.3641328, 2.582382, 0, 0, 0, 1, 1,
1.553889, -0.732291, 1.537638, 1, 1, 1, 1, 1,
1.559448, -0.02983359, 1.412744, 1, 1, 1, 1, 1,
1.566606, -2.820837, 3.305106, 1, 1, 1, 1, 1,
1.567407, 0.7836854, 0.9334187, 1, 1, 1, 1, 1,
1.570346, 1.229692, 0.8922444, 1, 1, 1, 1, 1,
1.580894, -0.1918289, 1.503563, 1, 1, 1, 1, 1,
1.582488, -1.458459, 2.338481, 1, 1, 1, 1, 1,
1.58331, 0.6669912, 2.609047, 1, 1, 1, 1, 1,
1.587418, 0.4870165, 1.355286, 1, 1, 1, 1, 1,
1.610675, 1.366414, 1.005107, 1, 1, 1, 1, 1,
1.613871, -1.521555, 2.778431, 1, 1, 1, 1, 1,
1.61412, 0.3790161, 3.181809, 1, 1, 1, 1, 1,
1.61492, -0.9221631, 1.69999, 1, 1, 1, 1, 1,
1.626161, 0.4739279, 1.513259, 1, 1, 1, 1, 1,
1.645863, -0.4120963, 0.2592259, 1, 1, 1, 1, 1,
1.648387, -0.2389281, 0.9632841, 0, 0, 1, 1, 1,
1.655463, 1.716773, 0.7864195, 1, 0, 0, 1, 1,
1.664314, -1.601707, 1.105251, 1, 0, 0, 1, 1,
1.678236, 1.419396, 0.3594536, 1, 0, 0, 1, 1,
1.681089, -0.4193738, 0.0896595, 1, 0, 0, 1, 1,
1.688592, -1.157167, 2.540143, 1, 0, 0, 1, 1,
1.704385, 1.164198, 1.011022, 0, 0, 0, 1, 1,
1.731663, -0.116119, 2.877229, 0, 0, 0, 1, 1,
1.732533, -1.246469, 0.1305862, 0, 0, 0, 1, 1,
1.736421, -0.3702024, 2.673431, 0, 0, 0, 1, 1,
1.739937, -0.3263738, 2.417288, 0, 0, 0, 1, 1,
1.771666, 0.6023263, 1.174049, 0, 0, 0, 1, 1,
1.771859, -0.5880462, 1.871508, 0, 0, 0, 1, 1,
1.775638, -0.1560548, 0.4185818, 1, 1, 1, 1, 1,
1.77853, -1.004249, 3.041558, 1, 1, 1, 1, 1,
1.779712, -1.248315, 1.459522, 1, 1, 1, 1, 1,
1.824344, -0.01484883, 3.857988, 1, 1, 1, 1, 1,
1.839281, 0.3791784, 1.508985, 1, 1, 1, 1, 1,
1.855797, -0.4656107, 2.287166, 1, 1, 1, 1, 1,
1.876093, 2.133127, -0.7128159, 1, 1, 1, 1, 1,
1.88429, -0.337375, 1.426396, 1, 1, 1, 1, 1,
1.886601, -1.72816, 2.218827, 1, 1, 1, 1, 1,
1.893129, -0.6841777, 3.748054, 1, 1, 1, 1, 1,
1.893536, 0.127119, 2.762097, 1, 1, 1, 1, 1,
1.895772, 0.3873904, 0.3152061, 1, 1, 1, 1, 1,
1.900645, -0.5656051, 2.329043, 1, 1, 1, 1, 1,
1.951395, -1.010972, 2.486925, 1, 1, 1, 1, 1,
1.979452, 1.007362, -0.1941222, 1, 1, 1, 1, 1,
1.988999, 0.6196637, 0.7769941, 0, 0, 1, 1, 1,
1.991916, 0.5626251, 2.02715, 1, 0, 0, 1, 1,
1.992666, 0.02599801, 0.06817275, 1, 0, 0, 1, 1,
2.013477, -0.5317519, 0.7671147, 1, 0, 0, 1, 1,
2.034695, 0.5275366, 1.204596, 1, 0, 0, 1, 1,
2.036428, -0.3612891, 2.370839, 1, 0, 0, 1, 1,
2.180993, -0.3942299, -0.03790791, 0, 0, 0, 1, 1,
2.238582, 0.3889518, -0.3728828, 0, 0, 0, 1, 1,
2.241329, 1.007465, 0.0715718, 0, 0, 0, 1, 1,
2.297575, 0.5215759, 0.1340557, 0, 0, 0, 1, 1,
2.440439, 0.6402246, 2.153655, 0, 0, 0, 1, 1,
2.587421, -0.3888715, 1.838062, 0, 0, 0, 1, 1,
2.630351, -2.042984, 2.274901, 0, 0, 0, 1, 1,
2.631642, -0.08744641, 2.480778, 1, 1, 1, 1, 1,
2.68372, 0.07742395, 1.629072, 1, 1, 1, 1, 1,
2.690566, 0.552754, 2.205811, 1, 1, 1, 1, 1,
2.732913, -0.03389049, 0.3293256, 1, 1, 1, 1, 1,
2.746269, -0.9853317, 2.332159, 1, 1, 1, 1, 1,
2.849571, -0.3561828, 1.451298, 1, 1, 1, 1, 1,
2.952095, 0.5132614, 1.428578, 1, 1, 1, 1, 1
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
var radius = 9.387157;
var distance = 32.97199;
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
mvMatrix.translate( -0.09757209, -0.2025359, 0.08120108 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.97199);
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
