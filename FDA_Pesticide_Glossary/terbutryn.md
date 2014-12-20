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
-3.316757, -1.666369, -2.513048, 1, 0, 0, 1,
-3.090017, -1.336826, -1.087949, 1, 0.007843138, 0, 1,
-2.622541, -0.1983631, -2.405462, 1, 0.01176471, 0, 1,
-2.611861, -0.2514161, -1.71239, 1, 0.01960784, 0, 1,
-2.567317, 1.007885, -0.9048998, 1, 0.02352941, 0, 1,
-2.565785, 0.03102109, -2.381433, 1, 0.03137255, 0, 1,
-2.385992, 0.6104957, -0.7008712, 1, 0.03529412, 0, 1,
-2.316743, -0.1237664, -2.221687, 1, 0.04313726, 0, 1,
-2.303188, 1.061327, -0.03316776, 1, 0.04705882, 0, 1,
-2.300035, -0.6589499, -2.293119, 1, 0.05490196, 0, 1,
-2.246441, -1.02147, -3.281093, 1, 0.05882353, 0, 1,
-2.214813, -0.375498, -2.9263, 1, 0.06666667, 0, 1,
-2.210919, 1.769471, -1.168096, 1, 0.07058824, 0, 1,
-2.20482, 0.5683093, -2.159437, 1, 0.07843138, 0, 1,
-2.084991, -0.7818978, -2.924675, 1, 0.08235294, 0, 1,
-2.066535, -1.29114, -0.8670589, 1, 0.09019608, 0, 1,
-2.045221, 0.3868885, -0.05578765, 1, 0.09411765, 0, 1,
-2.037206, -0.2896548, -1.810699, 1, 0.1019608, 0, 1,
-2.017346, 0.04681918, -2.902296, 1, 0.1098039, 0, 1,
-2.004828, 0.7048365, -0.3761603, 1, 0.1137255, 0, 1,
-1.986896, 0.8473093, -1.770624, 1, 0.1215686, 0, 1,
-1.941691, -1.158136, -2.689275, 1, 0.1254902, 0, 1,
-1.931459, -1.326399, -1.376556, 1, 0.1333333, 0, 1,
-1.93119, -0.5668256, -2.276112, 1, 0.1372549, 0, 1,
-1.921119, 0.1656245, -0.9936119, 1, 0.145098, 0, 1,
-1.909183, 0.04414807, -1.027573, 1, 0.1490196, 0, 1,
-1.896258, -0.4814937, -2.306069, 1, 0.1568628, 0, 1,
-1.89291, 1.878777, -2.517293, 1, 0.1607843, 0, 1,
-1.883609, -0.3195632, -2.059442, 1, 0.1686275, 0, 1,
-1.875883, 1.091056, -2.333168, 1, 0.172549, 0, 1,
-1.871152, -1.10283, -2.586919, 1, 0.1803922, 0, 1,
-1.842322, 0.8418111, -0.1012146, 1, 0.1843137, 0, 1,
-1.830928, 1.645926, -1.427144, 1, 0.1921569, 0, 1,
-1.826171, 0.586314, -4.116024, 1, 0.1960784, 0, 1,
-1.814071, 2.15499, -0.431795, 1, 0.2039216, 0, 1,
-1.807053, -1.372463, -1.744334, 1, 0.2117647, 0, 1,
-1.79968, 1.162044, -0.7616526, 1, 0.2156863, 0, 1,
-1.785942, 0.1037261, -0.5520844, 1, 0.2235294, 0, 1,
-1.783302, -0.0698581, -0.695771, 1, 0.227451, 0, 1,
-1.766722, -0.3467739, -1.566725, 1, 0.2352941, 0, 1,
-1.758957, 0.4320646, -0.1638918, 1, 0.2392157, 0, 1,
-1.757993, 0.5480453, -1.502144, 1, 0.2470588, 0, 1,
-1.750699, -1.123999, -2.776312, 1, 0.2509804, 0, 1,
-1.748943, 0.3282342, -2.260804, 1, 0.2588235, 0, 1,
-1.711251, 0.06314033, -0.8520538, 1, 0.2627451, 0, 1,
-1.707361, -0.4615731, -1.064133, 1, 0.2705882, 0, 1,
-1.702368, 0.9491124, -2.11, 1, 0.2745098, 0, 1,
-1.695551, 0.02030983, -2.949054, 1, 0.282353, 0, 1,
-1.667591, -0.3078492, -3.172641, 1, 0.2862745, 0, 1,
-1.643353, -0.06007811, -1.74531, 1, 0.2941177, 0, 1,
-1.641328, -1.251532, -1.413636, 1, 0.3019608, 0, 1,
-1.635845, -0.3135224, -2.055777, 1, 0.3058824, 0, 1,
-1.599785, -0.7361188, -0.887711, 1, 0.3137255, 0, 1,
-1.59611, -0.4349622, -2.675334, 1, 0.3176471, 0, 1,
-1.593159, -0.2686421, -1.164164, 1, 0.3254902, 0, 1,
-1.570964, 0.4222566, -0.9218392, 1, 0.3294118, 0, 1,
-1.570819, 1.455818, -0.4894142, 1, 0.3372549, 0, 1,
-1.567945, 0.1037776, -4.32232, 1, 0.3411765, 0, 1,
-1.539915, -1.319585, 0.02960947, 1, 0.3490196, 0, 1,
-1.538067, -1.206915, -1.498576, 1, 0.3529412, 0, 1,
-1.531896, -1.46559, -2.747007, 1, 0.3607843, 0, 1,
-1.524536, -1.150209, -0.9851603, 1, 0.3647059, 0, 1,
-1.517354, -0.4964675, -1.402105, 1, 0.372549, 0, 1,
-1.517058, 1.392028, -1.271641, 1, 0.3764706, 0, 1,
-1.516197, -2.076248, -2.491215, 1, 0.3843137, 0, 1,
-1.50977, 0.2788363, -2.386357, 1, 0.3882353, 0, 1,
-1.505282, 0.7712318, -1.177723, 1, 0.3960784, 0, 1,
-1.504339, 0.0886545, -2.804145, 1, 0.4039216, 0, 1,
-1.49281, 0.9887537, -2.194903, 1, 0.4078431, 0, 1,
-1.480362, 0.9028416, -0.06695472, 1, 0.4156863, 0, 1,
-1.471852, 0.2076962, -1.844803, 1, 0.4196078, 0, 1,
-1.471133, -0.8728546, -1.614154, 1, 0.427451, 0, 1,
-1.458974, -1.798138, -2.505659, 1, 0.4313726, 0, 1,
-1.455907, 0.5143369, -2.754773, 1, 0.4392157, 0, 1,
-1.453085, 0.1578413, 0.4166266, 1, 0.4431373, 0, 1,
-1.448052, 0.7973722, -1.220602, 1, 0.4509804, 0, 1,
-1.436684, -0.4152822, -0.691297, 1, 0.454902, 0, 1,
-1.43075, -0.5261062, -3.149082, 1, 0.4627451, 0, 1,
-1.423622, -0.03902609, -1.286164, 1, 0.4666667, 0, 1,
-1.416321, 1.684871, -0.1008907, 1, 0.4745098, 0, 1,
-1.411649, -0.1042284, -1.83739, 1, 0.4784314, 0, 1,
-1.403973, -0.3733164, -0.6689849, 1, 0.4862745, 0, 1,
-1.403769, -1.169645, -3.406812, 1, 0.4901961, 0, 1,
-1.401433, -1.996963, -2.434986, 1, 0.4980392, 0, 1,
-1.396142, -0.8734387, -1.752579, 1, 0.5058824, 0, 1,
-1.386106, 1.580015, -0.5517131, 1, 0.509804, 0, 1,
-1.380903, 0.6609251, -0.1996928, 1, 0.5176471, 0, 1,
-1.376998, 0.1298168, -2.084788, 1, 0.5215687, 0, 1,
-1.37572, -0.2861478, -4.04667, 1, 0.5294118, 0, 1,
-1.373811, -0.2741602, -0.3843614, 1, 0.5333334, 0, 1,
-1.365691, 1.203344, -1.431935, 1, 0.5411765, 0, 1,
-1.36377, 0.7459357, -1.608062, 1, 0.5450981, 0, 1,
-1.3624, 1.650305, -1.609624, 1, 0.5529412, 0, 1,
-1.358638, 0.9031742, -1.167427, 1, 0.5568628, 0, 1,
-1.358151, -0.7361925, -2.021168, 1, 0.5647059, 0, 1,
-1.354297, 0.7535909, -2.26878, 1, 0.5686275, 0, 1,
-1.326382, -1.103594, -2.8274, 1, 0.5764706, 0, 1,
-1.323529, -1.405081, -1.39363, 1, 0.5803922, 0, 1,
-1.318649, 0.5968627, -3.075595, 1, 0.5882353, 0, 1,
-1.305412, -0.9620225, -2.165528, 1, 0.5921569, 0, 1,
-1.301046, -0.532968, -3.7729, 1, 0.6, 0, 1,
-1.297153, 0.3074902, -1.508101, 1, 0.6078432, 0, 1,
-1.296962, 0.5169089, -0.8650295, 1, 0.6117647, 0, 1,
-1.296115, -0.238898, -2.310185, 1, 0.6196079, 0, 1,
-1.288901, -0.1968909, -2.449729, 1, 0.6235294, 0, 1,
-1.282786, -0.1458072, -1.725835, 1, 0.6313726, 0, 1,
-1.275335, 0.1014234, -0.3886139, 1, 0.6352941, 0, 1,
-1.262647, -0.9767447, -2.210645, 1, 0.6431373, 0, 1,
-1.261215, -0.01277981, -0.08285275, 1, 0.6470588, 0, 1,
-1.246534, -2.416505, -3.43394, 1, 0.654902, 0, 1,
-1.242669, 0.6858822, -0.9645255, 1, 0.6588235, 0, 1,
-1.237354, 0.8209273, -0.8728824, 1, 0.6666667, 0, 1,
-1.231066, -0.5046398, -1.698106, 1, 0.6705883, 0, 1,
-1.228081, 0.1789536, 1.344455, 1, 0.6784314, 0, 1,
-1.225628, 1.030353, -0.394345, 1, 0.682353, 0, 1,
-1.219014, 0.7953107, -1.048643, 1, 0.6901961, 0, 1,
-1.217684, 1.265216, -0.1030681, 1, 0.6941177, 0, 1,
-1.209587, 0.3992492, -2.507109, 1, 0.7019608, 0, 1,
-1.208431, -0.766197, -2.554862, 1, 0.7098039, 0, 1,
-1.208319, -0.550398, -2.23477, 1, 0.7137255, 0, 1,
-1.200976, -0.4611888, -2.374251, 1, 0.7215686, 0, 1,
-1.198821, 0.5209069, -1.085113, 1, 0.7254902, 0, 1,
-1.187077, -0.6604656, -1.693312, 1, 0.7333333, 0, 1,
-1.185108, -0.5803803, -1.578438, 1, 0.7372549, 0, 1,
-1.184785, -1.306645, -2.541197, 1, 0.7450981, 0, 1,
-1.180527, -0.5337119, -2.520657, 1, 0.7490196, 0, 1,
-1.176171, -0.433038, -4.423798, 1, 0.7568628, 0, 1,
-1.170098, -1.298999, -2.289489, 1, 0.7607843, 0, 1,
-1.163841, 0.4842452, -1.636748, 1, 0.7686275, 0, 1,
-1.153014, -0.2556628, -2.168257, 1, 0.772549, 0, 1,
-1.149229, 0.6018956, -0.9198568, 1, 0.7803922, 0, 1,
-1.145955, 0.2347744, -0.9734125, 1, 0.7843137, 0, 1,
-1.136731, 0.7971266, -0.5574777, 1, 0.7921569, 0, 1,
-1.134244, 1.041732, -1.672711, 1, 0.7960784, 0, 1,
-1.132314, 0.3434878, -3.135439, 1, 0.8039216, 0, 1,
-1.123498, 0.01491869, -0.03188869, 1, 0.8117647, 0, 1,
-1.122829, -0.4312605, -1.866772, 1, 0.8156863, 0, 1,
-1.113428, -0.8105384, -1.488206, 1, 0.8235294, 0, 1,
-1.111245, 0.04943195, -1.50172, 1, 0.827451, 0, 1,
-1.106859, -2.438812, -0.9230017, 1, 0.8352941, 0, 1,
-1.088356, -2.005137, -3.509241, 1, 0.8392157, 0, 1,
-1.083585, -1.069186, -3.128525, 1, 0.8470588, 0, 1,
-1.072943, -0.5048191, -3.192632, 1, 0.8509804, 0, 1,
-1.064101, -0.551295, -1.711239, 1, 0.8588235, 0, 1,
-1.062179, 0.1327787, -1.948233, 1, 0.8627451, 0, 1,
-1.060571, 1.065175, 0.2652159, 1, 0.8705882, 0, 1,
-1.059323, -0.07559095, -3.567341, 1, 0.8745098, 0, 1,
-1.058927, -1.703187, -2.149272, 1, 0.8823529, 0, 1,
-1.05749, 1.679815, -0.294255, 1, 0.8862745, 0, 1,
-1.050703, -0.317599, -0.7743224, 1, 0.8941177, 0, 1,
-1.048186, 1.086736, -0.8904514, 1, 0.8980392, 0, 1,
-1.043414, -1.214607, -2.267558, 1, 0.9058824, 0, 1,
-1.039213, 0.8588524, 0.1775129, 1, 0.9137255, 0, 1,
-1.034754, 0.2591906, -0.5908386, 1, 0.9176471, 0, 1,
-1.027712, 0.4802435, -1.133465, 1, 0.9254902, 0, 1,
-1.024689, -0.2899175, -1.012254, 1, 0.9294118, 0, 1,
-1.021684, -1.689703, -1.800269, 1, 0.9372549, 0, 1,
-1.018944, 1.448562, -0.9970968, 1, 0.9411765, 0, 1,
-1.017655, -0.1801843, -2.160221, 1, 0.9490196, 0, 1,
-1.014399, 0.8069284, 0.2815953, 1, 0.9529412, 0, 1,
-1.008901, 0.1467024, -1.778326, 1, 0.9607843, 0, 1,
-1.004604, 0.656972, -0.8591574, 1, 0.9647059, 0, 1,
-0.9936295, -0.8267377, -3.211109, 1, 0.972549, 0, 1,
-0.9931343, -1.019778, -2.188631, 1, 0.9764706, 0, 1,
-0.9901114, -1.66224, -3.106056, 1, 0.9843137, 0, 1,
-0.9839925, -2.141136, -1.671288, 1, 0.9882353, 0, 1,
-0.9690986, -0.8736386, -0.4115716, 1, 0.9960784, 0, 1,
-0.9644052, 1.064502, -1.484253, 0.9960784, 1, 0, 1,
-0.9611343, 1.52109, -1.623495, 0.9921569, 1, 0, 1,
-0.9585017, 2.149636, -1.982781, 0.9843137, 1, 0, 1,
-0.9574668, -0.7204291, -2.404742, 0.9803922, 1, 0, 1,
-0.9558709, -2.25253, -3.116177, 0.972549, 1, 0, 1,
-0.9515138, -0.8736664, -0.5456097, 0.9686275, 1, 0, 1,
-0.9460902, 0.9064613, -0.510946, 0.9607843, 1, 0, 1,
-0.9427385, -0.2747107, 0.07762516, 0.9568627, 1, 0, 1,
-0.9424915, 0.8996506, -0.3429612, 0.9490196, 1, 0, 1,
-0.9421435, 0.05685734, -1.755427, 0.945098, 1, 0, 1,
-0.9365161, 0.6124328, -1.960311, 0.9372549, 1, 0, 1,
-0.9312587, 0.5517421, -0.4198784, 0.9333333, 1, 0, 1,
-0.9299338, 0.2990176, -0.9681559, 0.9254902, 1, 0, 1,
-0.91965, -1.564316, -1.823127, 0.9215686, 1, 0, 1,
-0.9073386, 0.2283158, -2.528641, 0.9137255, 1, 0, 1,
-0.9024339, -0.00160177, -1.49704, 0.9098039, 1, 0, 1,
-0.9021462, 0.54103, 0.02890575, 0.9019608, 1, 0, 1,
-0.8948745, -2.425537, -2.109781, 0.8941177, 1, 0, 1,
-0.893337, -0.9099602, -2.953233, 0.8901961, 1, 0, 1,
-0.892392, -2.017763, -3.939992, 0.8823529, 1, 0, 1,
-0.8901295, -0.04041032, -2.375298, 0.8784314, 1, 0, 1,
-0.8880986, -0.9539827, -1.821648, 0.8705882, 1, 0, 1,
-0.8880036, -1.549881, -2.309432, 0.8666667, 1, 0, 1,
-0.8864807, 0.11859, -1.698279, 0.8588235, 1, 0, 1,
-0.874747, 0.05659637, -1.963522, 0.854902, 1, 0, 1,
-0.8704734, -0.7343069, -2.77054, 0.8470588, 1, 0, 1,
-0.8690794, 0.2033927, 0.1453529, 0.8431373, 1, 0, 1,
-0.8652133, -0.407176, -4.518775, 0.8352941, 1, 0, 1,
-0.8634846, -1.095762, -2.427155, 0.8313726, 1, 0, 1,
-0.8617615, 1.18641, -0.6747697, 0.8235294, 1, 0, 1,
-0.855674, 0.9493716, -0.2361746, 0.8196079, 1, 0, 1,
-0.8428197, -0.4161441, -2.276431, 0.8117647, 1, 0, 1,
-0.8244235, -0.9924527, -3.085994, 0.8078431, 1, 0, 1,
-0.8218658, -0.1640935, -0.6344449, 0.8, 1, 0, 1,
-0.8133382, 0.6473278, -0.5742772, 0.7921569, 1, 0, 1,
-0.8128279, 0.5458811, -3.407813, 0.7882353, 1, 0, 1,
-0.8103594, -2.016952, -2.569116, 0.7803922, 1, 0, 1,
-0.8077617, -0.9574328, -1.744797, 0.7764706, 1, 0, 1,
-0.8049702, 0.7253132, -1.187395, 0.7686275, 1, 0, 1,
-0.8047131, 0.940901, -0.9615542, 0.7647059, 1, 0, 1,
-0.8043588, -2.006976, -2.23792, 0.7568628, 1, 0, 1,
-0.8021629, -0.5507262, -0.9939365, 0.7529412, 1, 0, 1,
-0.8005179, 0.6669456, -1.206875, 0.7450981, 1, 0, 1,
-0.7971328, -1.237277, -1.785409, 0.7411765, 1, 0, 1,
-0.7947529, -0.1849732, -1.690849, 0.7333333, 1, 0, 1,
-0.7913074, -0.4527661, -1.478372, 0.7294118, 1, 0, 1,
-0.7911302, -0.6946076, -3.449913, 0.7215686, 1, 0, 1,
-0.7883664, 0.4337864, -0.8504627, 0.7176471, 1, 0, 1,
-0.7883545, -0.05723245, -2.867795, 0.7098039, 1, 0, 1,
-0.7865942, -0.6058432, -2.215505, 0.7058824, 1, 0, 1,
-0.7834886, -0.3270743, -2.752412, 0.6980392, 1, 0, 1,
-0.7789816, -0.7236037, -2.608667, 0.6901961, 1, 0, 1,
-0.7776653, -0.0582406, -1.717643, 0.6862745, 1, 0, 1,
-0.7771002, -0.03723845, -1.269761, 0.6784314, 1, 0, 1,
-0.7752918, -0.8670239, -2.03024, 0.6745098, 1, 0, 1,
-0.771265, -0.7444788, -2.714882, 0.6666667, 1, 0, 1,
-0.7694299, -0.7670594, -3.682076, 0.6627451, 1, 0, 1,
-0.7633395, -0.3130589, -1.404093, 0.654902, 1, 0, 1,
-0.7593552, 0.5844728, -2.836819, 0.6509804, 1, 0, 1,
-0.7568157, 1.056926, -2.352756, 0.6431373, 1, 0, 1,
-0.7532232, 0.6299974, 0.984327, 0.6392157, 1, 0, 1,
-0.7523756, -1.090179, -2.378495, 0.6313726, 1, 0, 1,
-0.7464188, 0.03459866, -1.396059, 0.627451, 1, 0, 1,
-0.7464181, 0.8355593, -1.820681, 0.6196079, 1, 0, 1,
-0.7462475, 1.423468, 0.2861496, 0.6156863, 1, 0, 1,
-0.7456415, 0.1757421, 0.3897803, 0.6078432, 1, 0, 1,
-0.7404947, 0.06671082, -0.32461, 0.6039216, 1, 0, 1,
-0.7396988, -1.493386, -4.047244, 0.5960785, 1, 0, 1,
-0.7384199, -1.305685, -2.113217, 0.5882353, 1, 0, 1,
-0.731266, 0.3005726, -0.5985907, 0.5843138, 1, 0, 1,
-0.729628, -0.9260168, -1.550127, 0.5764706, 1, 0, 1,
-0.7266717, 0.8502633, 0.03027635, 0.572549, 1, 0, 1,
-0.7265612, -2.034859, -2.155538, 0.5647059, 1, 0, 1,
-0.7256426, -0.2710603, -2.483832, 0.5607843, 1, 0, 1,
-0.7248916, 1.228987, -1.935664, 0.5529412, 1, 0, 1,
-0.7239358, 0.3219496, -1.402949, 0.5490196, 1, 0, 1,
-0.7135382, -1.355971, -3.091848, 0.5411765, 1, 0, 1,
-0.7126153, -0.05511451, -0.4288976, 0.5372549, 1, 0, 1,
-0.7096854, -0.7672615, -2.508195, 0.5294118, 1, 0, 1,
-0.7094822, -0.1175396, -1.414655, 0.5254902, 1, 0, 1,
-0.7091686, 0.7170098, -1.242069, 0.5176471, 1, 0, 1,
-0.7068759, 0.4171333, -2.231896, 0.5137255, 1, 0, 1,
-0.706243, 2.90666, 1.188205, 0.5058824, 1, 0, 1,
-0.7051256, 0.7096118, -3.311728, 0.5019608, 1, 0, 1,
-0.7023013, -1.526684, -3.588251, 0.4941176, 1, 0, 1,
-0.7009896, 0.4684634, -0.1576734, 0.4862745, 1, 0, 1,
-0.6873417, -0.372425, -1.317568, 0.4823529, 1, 0, 1,
-0.6868822, 0.6723362, -1.064309, 0.4745098, 1, 0, 1,
-0.6812046, 0.5888811, -0.4959468, 0.4705882, 1, 0, 1,
-0.6809464, -0.7503929, -2.092678, 0.4627451, 1, 0, 1,
-0.6740709, 0.7692053, -0.4094683, 0.4588235, 1, 0, 1,
-0.6707622, 0.4765323, -1.39069, 0.4509804, 1, 0, 1,
-0.6644727, 1.847702, -1.240349, 0.4470588, 1, 0, 1,
-0.6582276, 1.091235, -0.9638324, 0.4392157, 1, 0, 1,
-0.6572193, -1.568613, -3.82696, 0.4352941, 1, 0, 1,
-0.6554847, -1.306077, -2.857058, 0.427451, 1, 0, 1,
-0.6493424, -0.7361987, -2.754706, 0.4235294, 1, 0, 1,
-0.6469927, 0.9327646, 0.05471707, 0.4156863, 1, 0, 1,
-0.6432725, 0.554192, -2.151887, 0.4117647, 1, 0, 1,
-0.6415817, 0.578856, -0.1981827, 0.4039216, 1, 0, 1,
-0.6409656, 0.8481988, -0.2221768, 0.3960784, 1, 0, 1,
-0.6373074, -1.408823, -2.207125, 0.3921569, 1, 0, 1,
-0.6370242, 0.9871656, -1.354577, 0.3843137, 1, 0, 1,
-0.6350795, -1.527603, -3.230802, 0.3803922, 1, 0, 1,
-0.6214125, 0.2913529, 0.2967018, 0.372549, 1, 0, 1,
-0.6181347, 0.5891824, -2.006759, 0.3686275, 1, 0, 1,
-0.6074387, -0.6280779, -1.720806, 0.3607843, 1, 0, 1,
-0.6056356, 0.8464447, -0.9558954, 0.3568628, 1, 0, 1,
-0.6044725, 0.4079432, -1.328768, 0.3490196, 1, 0, 1,
-0.5993024, 0.9117936, -0.8302194, 0.345098, 1, 0, 1,
-0.5924147, -0.3130059, -3.465657, 0.3372549, 1, 0, 1,
-0.5919734, 0.7907879, 1.047536, 0.3333333, 1, 0, 1,
-0.5897311, -0.08639807, -1.613732, 0.3254902, 1, 0, 1,
-0.5862285, -2.133292, -2.479346, 0.3215686, 1, 0, 1,
-0.5789893, 0.617685, -0.6273941, 0.3137255, 1, 0, 1,
-0.5773392, 0.02968273, -1.453205, 0.3098039, 1, 0, 1,
-0.574928, 0.3526541, 0.0329631, 0.3019608, 1, 0, 1,
-0.5676572, -0.4945601, -3.107582, 0.2941177, 1, 0, 1,
-0.5640777, 0.5954162, -0.04578086, 0.2901961, 1, 0, 1,
-0.5637493, 0.8563609, 0.0711061, 0.282353, 1, 0, 1,
-0.5629888, -2.491802, -3.586225, 0.2784314, 1, 0, 1,
-0.5610011, 0.5889313, -0.9251603, 0.2705882, 1, 0, 1,
-0.560289, 1.932588, -1.107511, 0.2666667, 1, 0, 1,
-0.5597482, -0.2537244, -3.6991, 0.2588235, 1, 0, 1,
-0.5584681, 1.246259, -1.52761, 0.254902, 1, 0, 1,
-0.5555834, 0.07744422, 0.1938904, 0.2470588, 1, 0, 1,
-0.5531564, 1.251861, 0.3196159, 0.2431373, 1, 0, 1,
-0.552365, -0.9904383, -3.361881, 0.2352941, 1, 0, 1,
-0.5517756, -0.8334339, -3.108567, 0.2313726, 1, 0, 1,
-0.5483423, -0.4462957, -1.673512, 0.2235294, 1, 0, 1,
-0.5449182, 0.2736185, 0.1888361, 0.2196078, 1, 0, 1,
-0.544543, 0.501132, -1.318904, 0.2117647, 1, 0, 1,
-0.5413426, -0.8770919, -0.9782521, 0.2078431, 1, 0, 1,
-0.539569, -0.9368464, -3.254415, 0.2, 1, 0, 1,
-0.5393695, 0.04121856, -1.04093, 0.1921569, 1, 0, 1,
-0.5309623, 0.7230235, -0.4809301, 0.1882353, 1, 0, 1,
-0.53084, -2.46822, -3.470258, 0.1803922, 1, 0, 1,
-0.5277061, -0.1702423, -2.462347, 0.1764706, 1, 0, 1,
-0.5241934, 1.636766, -0.06655244, 0.1686275, 1, 0, 1,
-0.5179877, 1.259897, 1.733873, 0.1647059, 1, 0, 1,
-0.5174796, -1.306495, -2.410388, 0.1568628, 1, 0, 1,
-0.5119053, -0.1264625, -0.516104, 0.1529412, 1, 0, 1,
-0.5113822, -2.300875, -2.931778, 0.145098, 1, 0, 1,
-0.5081416, 1.812355, -1.170519, 0.1411765, 1, 0, 1,
-0.5038425, -0.9745309, -1.561462, 0.1333333, 1, 0, 1,
-0.5031168, 1.02614, 0.2434023, 0.1294118, 1, 0, 1,
-0.4940632, -0.3737963, -1.020316, 0.1215686, 1, 0, 1,
-0.4922823, 0.5276265, 0.3412444, 0.1176471, 1, 0, 1,
-0.492263, 2.347253, -1.285838, 0.1098039, 1, 0, 1,
-0.4876907, -0.3321013, -3.49502, 0.1058824, 1, 0, 1,
-0.4833405, 0.2453181, -1.157672, 0.09803922, 1, 0, 1,
-0.4797678, -0.3533474, -2.002698, 0.09019608, 1, 0, 1,
-0.4795555, 1.07159, -1.140204, 0.08627451, 1, 0, 1,
-0.4773262, 1.059397, 0.6157593, 0.07843138, 1, 0, 1,
-0.4730312, 0.8284534, 1.032114, 0.07450981, 1, 0, 1,
-0.4721561, 1.885263, -1.360249, 0.06666667, 1, 0, 1,
-0.470731, 1.054279, -0.1302296, 0.0627451, 1, 0, 1,
-0.4666198, 1.508404, 0.8177104, 0.05490196, 1, 0, 1,
-0.4656636, -0.7400421, -2.750782, 0.05098039, 1, 0, 1,
-0.4633957, 0.7196202, -0.5735431, 0.04313726, 1, 0, 1,
-0.4620584, -0.1216655, -2.660247, 0.03921569, 1, 0, 1,
-0.459456, -0.8245113, -2.692273, 0.03137255, 1, 0, 1,
-0.4588054, -0.4892865, -2.679405, 0.02745098, 1, 0, 1,
-0.4557913, 0.2529362, -0.05527709, 0.01960784, 1, 0, 1,
-0.4541013, 1.311348, -0.3067293, 0.01568628, 1, 0, 1,
-0.4522345, -1.202533, -3.447311, 0.007843138, 1, 0, 1,
-0.4508862, 1.157959, -1.037212, 0.003921569, 1, 0, 1,
-0.4494531, 0.5783301, -1.754564, 0, 1, 0.003921569, 1,
-0.4453299, 0.01088043, -2.345414, 0, 1, 0.01176471, 1,
-0.4450802, -0.07109344, -2.091192, 0, 1, 0.01568628, 1,
-0.4365224, -0.6329474, -2.153056, 0, 1, 0.02352941, 1,
-0.4353105, 0.2877748, -2.109785, 0, 1, 0.02745098, 1,
-0.4351665, -1.603557, -3.142133, 0, 1, 0.03529412, 1,
-0.4325275, 0.7012698, -0.2040268, 0, 1, 0.03921569, 1,
-0.4289032, -0.7497051, -1.517522, 0, 1, 0.04705882, 1,
-0.4263254, 1.476449, -1.481575, 0, 1, 0.05098039, 1,
-0.4193878, -0.9667121, -3.41908, 0, 1, 0.05882353, 1,
-0.4183824, -0.1965073, -3.341394, 0, 1, 0.0627451, 1,
-0.4136142, -0.1208274, -1.47682, 0, 1, 0.07058824, 1,
-0.4110462, -1.370239, -0.7190382, 0, 1, 0.07450981, 1,
-0.4101564, -1.820092, -3.393962, 0, 1, 0.08235294, 1,
-0.4040057, -2.079341, -3.021383, 0, 1, 0.08627451, 1,
-0.4034336, -0.4848129, -2.656109, 0, 1, 0.09411765, 1,
-0.4000748, -1.518414, -1.507784, 0, 1, 0.1019608, 1,
-0.3932761, -0.7100953, -2.589702, 0, 1, 0.1058824, 1,
-0.392026, 1.720694, 1.387793, 0, 1, 0.1137255, 1,
-0.390666, 1.059578, -0.1659117, 0, 1, 0.1176471, 1,
-0.390373, 0.09059928, -2.284022, 0, 1, 0.1254902, 1,
-0.3855931, 1.049004, -1.615741, 0, 1, 0.1294118, 1,
-0.3814991, -0.7200713, -2.559448, 0, 1, 0.1372549, 1,
-0.3785713, -0.1150819, -3.654349, 0, 1, 0.1411765, 1,
-0.3656844, 1.085818, -0.2355638, 0, 1, 0.1490196, 1,
-0.3651465, -0.9014775, -3.163256, 0, 1, 0.1529412, 1,
-0.3594199, -0.7517198, -1.763922, 0, 1, 0.1607843, 1,
-0.3592255, 0.7836869, -1.068565, 0, 1, 0.1647059, 1,
-0.349909, -0.068082, -0.3619689, 0, 1, 0.172549, 1,
-0.3381987, 0.4371558, -1.236264, 0, 1, 0.1764706, 1,
-0.3360841, -0.6908491, -1.167877, 0, 1, 0.1843137, 1,
-0.3348804, -0.3690426, -1.880674, 0, 1, 0.1882353, 1,
-0.3308736, -0.9583645, -1.795296, 0, 1, 0.1960784, 1,
-0.3241277, 2.252511, -2.666441, 0, 1, 0.2039216, 1,
-0.322646, 0.4736434, -0.2775261, 0, 1, 0.2078431, 1,
-0.3216969, -0.3311392, -2.02248, 0, 1, 0.2156863, 1,
-0.3214028, -0.1475998, -1.542966, 0, 1, 0.2196078, 1,
-0.3193485, 0.6573612, -0.7887812, 0, 1, 0.227451, 1,
-0.318679, -0.9979954, -3.142078, 0, 1, 0.2313726, 1,
-0.3153013, -1.328452, -3.78896, 0, 1, 0.2392157, 1,
-0.3147157, -1.397372, -4.764164, 0, 1, 0.2431373, 1,
-0.3104863, -0.4808969, -2.921015, 0, 1, 0.2509804, 1,
-0.3080848, 0.09143495, -0.07385875, 0, 1, 0.254902, 1,
-0.3080842, -0.4291819, -2.016601, 0, 1, 0.2627451, 1,
-0.3030372, 1.04893, 0.08113588, 0, 1, 0.2666667, 1,
-0.3008853, 2.016071, -2.400575, 0, 1, 0.2745098, 1,
-0.2882786, -0.04527319, -1.817783, 0, 1, 0.2784314, 1,
-0.2865105, -0.8764335, -3.336309, 0, 1, 0.2862745, 1,
-0.2846749, 0.4161646, -1.355725, 0, 1, 0.2901961, 1,
-0.2826065, 0.3917173, 0.5721585, 0, 1, 0.2980392, 1,
-0.2802859, 2.195236, 2.512795, 0, 1, 0.3058824, 1,
-0.2765662, -0.8574598, -3.499454, 0, 1, 0.3098039, 1,
-0.2724406, -0.216626, -1.694294, 0, 1, 0.3176471, 1,
-0.2701948, -1.226443, -3.971192, 0, 1, 0.3215686, 1,
-0.2655791, -0.2361896, -3.543492, 0, 1, 0.3294118, 1,
-0.2600226, 0.4664918, 0.3154407, 0, 1, 0.3333333, 1,
-0.2595224, -1.513208, -3.405559, 0, 1, 0.3411765, 1,
-0.2564176, -0.866053, -1.833912, 0, 1, 0.345098, 1,
-0.2555774, 0.7806643, -1.307665, 0, 1, 0.3529412, 1,
-0.2548484, -0.6977227, -3.568978, 0, 1, 0.3568628, 1,
-0.2530375, -0.2107943, -0.7957706, 0, 1, 0.3647059, 1,
-0.2518602, 0.8215079, 0.5960021, 0, 1, 0.3686275, 1,
-0.2505669, -1.364955, -2.673064, 0, 1, 0.3764706, 1,
-0.2501879, 0.9829247, -0.0510473, 0, 1, 0.3803922, 1,
-0.2485361, -0.1808765, -3.774987, 0, 1, 0.3882353, 1,
-0.2482166, -0.2825574, -1.343291, 0, 1, 0.3921569, 1,
-0.2480437, -0.7348257, -0.5541949, 0, 1, 0.4, 1,
-0.2466017, -0.05937585, -2.321616, 0, 1, 0.4078431, 1,
-0.243238, 0.09975872, -0.915078, 0, 1, 0.4117647, 1,
-0.2414482, -0.8513682, -3.682613, 0, 1, 0.4196078, 1,
-0.2410673, -0.5437357, -2.145526, 0, 1, 0.4235294, 1,
-0.2409788, 1.244799, 0.2424984, 0, 1, 0.4313726, 1,
-0.2387955, -0.7482379, -2.28122, 0, 1, 0.4352941, 1,
-0.2373859, 1.225839, 0.4521117, 0, 1, 0.4431373, 1,
-0.2361476, 0.7170239, -0.8675174, 0, 1, 0.4470588, 1,
-0.2344925, 0.3126878, -1.063177, 0, 1, 0.454902, 1,
-0.234281, -1.764436, -1.528952, 0, 1, 0.4588235, 1,
-0.2316563, 0.05056588, -2.481878, 0, 1, 0.4666667, 1,
-0.2303393, -0.7691647, -5.834636, 0, 1, 0.4705882, 1,
-0.2295153, 0.07057161, -0.4948216, 0, 1, 0.4784314, 1,
-0.2236727, 0.3423062, -0.7432945, 0, 1, 0.4823529, 1,
-0.2230754, -1.666139, -2.916328, 0, 1, 0.4901961, 1,
-0.2224705, -1.285497, -3.447615, 0, 1, 0.4941176, 1,
-0.2220138, 0.7454375, -0.8128056, 0, 1, 0.5019608, 1,
-0.221973, 0.1415564, -1.604946, 0, 1, 0.509804, 1,
-0.2210141, -3.065676, -2.517483, 0, 1, 0.5137255, 1,
-0.220776, -0.191122, -1.093427, 0, 1, 0.5215687, 1,
-0.2148702, -0.4870366, -1.891209, 0, 1, 0.5254902, 1,
-0.212493, -1.331895, -3.911466, 0, 1, 0.5333334, 1,
-0.2101472, -0.6782955, -2.705646, 0, 1, 0.5372549, 1,
-0.2087604, 0.1918589, -1.069336, 0, 1, 0.5450981, 1,
-0.2072894, 0.4589965, 0.08641805, 0, 1, 0.5490196, 1,
-0.2069198, -1.553027, -3.711508, 0, 1, 0.5568628, 1,
-0.201944, 1.027978, -1.133667, 0, 1, 0.5607843, 1,
-0.2013783, 0.03202704, -0.8424388, 0, 1, 0.5686275, 1,
-0.2006576, 0.5998342, 0.1810744, 0, 1, 0.572549, 1,
-0.2002732, 1.85131, -1.267771, 0, 1, 0.5803922, 1,
-0.1999597, -0.3527904, -3.115747, 0, 1, 0.5843138, 1,
-0.1981958, 0.7018792, 0.4080639, 0, 1, 0.5921569, 1,
-0.197772, 0.3710574, -0.7242282, 0, 1, 0.5960785, 1,
-0.1975322, 1.051911, 0.2456016, 0, 1, 0.6039216, 1,
-0.1881942, 1.041069, 1.426966, 0, 1, 0.6117647, 1,
-0.1866317, -0.5218541, -3.026007, 0, 1, 0.6156863, 1,
-0.1841555, -0.4831921, -2.886781, 0, 1, 0.6235294, 1,
-0.1822704, -0.1055356, -2.167328, 0, 1, 0.627451, 1,
-0.1800131, -1.846352, -1.487816, 0, 1, 0.6352941, 1,
-0.178726, 0.7766818, -0.8999491, 0, 1, 0.6392157, 1,
-0.1777288, -0.3844448, -3.132725, 0, 1, 0.6470588, 1,
-0.1762095, -1.372273, -2.006614, 0, 1, 0.6509804, 1,
-0.1732404, 0.7666733, 0.3814252, 0, 1, 0.6588235, 1,
-0.1720973, 0.9804428, 0.335217, 0, 1, 0.6627451, 1,
-0.1720455, -0.1209477, -1.713082, 0, 1, 0.6705883, 1,
-0.1677664, 0.4783478, 0.6502131, 0, 1, 0.6745098, 1,
-0.1641559, -1.307415, -3.625674, 0, 1, 0.682353, 1,
-0.1604956, 0.8233072, 0.2988561, 0, 1, 0.6862745, 1,
-0.1544412, 0.7185459, 0.1820802, 0, 1, 0.6941177, 1,
-0.1505844, -1.216706, -2.848221, 0, 1, 0.7019608, 1,
-0.1499954, -1.611067, -4.0362, 0, 1, 0.7058824, 1,
-0.1429336, 0.7416807, 0.7101157, 0, 1, 0.7137255, 1,
-0.1426463, -1.474489, -2.717026, 0, 1, 0.7176471, 1,
-0.1422194, -0.7183748, -3.487205, 0, 1, 0.7254902, 1,
-0.1408172, 0.03755113, -2.312846, 0, 1, 0.7294118, 1,
-0.1407131, -0.15327, -0.5639476, 0, 1, 0.7372549, 1,
-0.1372325, 0.04370632, -2.454776, 0, 1, 0.7411765, 1,
-0.1325536, 0.09933777, -1.644494, 0, 1, 0.7490196, 1,
-0.1311726, 1.440593, 1.202254, 0, 1, 0.7529412, 1,
-0.1286503, -0.08760756, -2.39772, 0, 1, 0.7607843, 1,
-0.1279273, 0.4798024, -1.936059, 0, 1, 0.7647059, 1,
-0.1216669, 0.6029035, 0.2099639, 0, 1, 0.772549, 1,
-0.1208101, -1.083414, -3.433331, 0, 1, 0.7764706, 1,
-0.1186852, 1.421709, -1.902747, 0, 1, 0.7843137, 1,
-0.1071211, -0.924511, -2.255331, 0, 1, 0.7882353, 1,
-0.1054984, -1.156077, -4.139716, 0, 1, 0.7960784, 1,
-0.1050131, -1.013786, -3.697324, 0, 1, 0.8039216, 1,
-0.09750944, -0.3338097, -1.655144, 0, 1, 0.8078431, 1,
-0.09558243, 0.9868751, -0.931945, 0, 1, 0.8156863, 1,
-0.09483398, -0.8479697, -4.168397, 0, 1, 0.8196079, 1,
-0.09430877, -1.981138, -4.945308, 0, 1, 0.827451, 1,
-0.09289618, 0.1232347, 0.3884323, 0, 1, 0.8313726, 1,
-0.09049145, 0.8054484, 0.3859273, 0, 1, 0.8392157, 1,
-0.08852237, -0.744709, -3.305297, 0, 1, 0.8431373, 1,
-0.08347015, 0.07223482, 0.4101446, 0, 1, 0.8509804, 1,
-0.07912337, -0.2842243, -2.68568, 0, 1, 0.854902, 1,
-0.07467934, 0.4595849, 0.1287027, 0, 1, 0.8627451, 1,
-0.07247484, 0.2505215, 0.3775342, 0, 1, 0.8666667, 1,
-0.06611735, 3.41347, 0.7035969, 0, 1, 0.8745098, 1,
-0.06353626, -0.7700232, -2.996071, 0, 1, 0.8784314, 1,
-0.06212296, 1.281794, 1.224231, 0, 1, 0.8862745, 1,
-0.06031867, -1.523962, -2.343798, 0, 1, 0.8901961, 1,
-0.05647597, 1.273475, -1.133075, 0, 1, 0.8980392, 1,
-0.05555141, -0.6605472, -2.448491, 0, 1, 0.9058824, 1,
-0.05312666, 1.733355, 0.1578349, 0, 1, 0.9098039, 1,
-0.05055386, -0.6144521, -2.289298, 0, 1, 0.9176471, 1,
-0.05040572, 1.204327, 0.6262665, 0, 1, 0.9215686, 1,
-0.04970625, -1.875795, -2.494469, 0, 1, 0.9294118, 1,
-0.04258014, 0.4939467, 0.5767062, 0, 1, 0.9333333, 1,
-0.04223699, 1.060542, -0.14606, 0, 1, 0.9411765, 1,
-0.03812901, -1.5844, -1.954714, 0, 1, 0.945098, 1,
-0.03767079, -1.706283, -2.620483, 0, 1, 0.9529412, 1,
-0.03762715, 0.2521301, -0.3222726, 0, 1, 0.9568627, 1,
-0.03752553, -0.1146879, -3.438634, 0, 1, 0.9647059, 1,
-0.03056485, -0.7575341, -3.22977, 0, 1, 0.9686275, 1,
-0.03027344, 0.8384533, -0.1774839, 0, 1, 0.9764706, 1,
-0.02897374, -1.930511, -0.3086227, 0, 1, 0.9803922, 1,
-0.02629367, -0.3475303, -2.651506, 0, 1, 0.9882353, 1,
-0.02145446, 0.06581238, -0.08029641, 0, 1, 0.9921569, 1,
-0.0211173, 0.7185387, -0.1826766, 0, 1, 1, 1,
-0.01871127, -0.5477268, -4.804711, 0, 0.9921569, 1, 1,
-0.01646239, 0.0007230506, -0.1190646, 0, 0.9882353, 1, 1,
-0.01353918, 1.077363, 0.173036, 0, 0.9803922, 1, 1,
-0.0116505, -1.296451, -4.19595, 0, 0.9764706, 1, 1,
-0.01090316, 0.04899917, 0.4464665, 0, 0.9686275, 1, 1,
-0.009615227, 0.4702667, -0.4046453, 0, 0.9647059, 1, 1,
-0.00701353, -1.239545, -3.958613, 0, 0.9568627, 1, 1,
0.003799639, -1.433832, 1.012774, 0, 0.9529412, 1, 1,
0.007771097, -0.5963659, 4.051969, 0, 0.945098, 1, 1,
0.007889567, -0.6139846, 2.303505, 0, 0.9411765, 1, 1,
0.01072626, -0.7987753, 3.784675, 0, 0.9333333, 1, 1,
0.01715898, 1.240587, -0.2332245, 0, 0.9294118, 1, 1,
0.02331526, 0.02315139, 1.185463, 0, 0.9215686, 1, 1,
0.02392686, 0.4695634, -2.496974, 0, 0.9176471, 1, 1,
0.02583401, 0.4118099, 1.026842, 0, 0.9098039, 1, 1,
0.02648387, 0.2719792, -0.311171, 0, 0.9058824, 1, 1,
0.0274464, -0.5840908, 4.726221, 0, 0.8980392, 1, 1,
0.02847263, -1.354787, 3.138553, 0, 0.8901961, 1, 1,
0.03231347, -1.059841, 2.700381, 0, 0.8862745, 1, 1,
0.03487332, 0.671182, 1.37262, 0, 0.8784314, 1, 1,
0.03809411, 1.847948, -0.2077435, 0, 0.8745098, 1, 1,
0.03841876, 0.3182199, 0.4950257, 0, 0.8666667, 1, 1,
0.03868625, -0.3721557, 4.716454, 0, 0.8627451, 1, 1,
0.04243028, -0.8695747, 2.520871, 0, 0.854902, 1, 1,
0.04306845, 0.4659795, 1.086159, 0, 0.8509804, 1, 1,
0.04539926, 1.086893, -0.7454504, 0, 0.8431373, 1, 1,
0.04725326, 0.1604434, 1.0151, 0, 0.8392157, 1, 1,
0.04793337, 0.7990617, 0.8500117, 0, 0.8313726, 1, 1,
0.04857884, -0.9536799, 3.542647, 0, 0.827451, 1, 1,
0.04903855, -0.05141593, 0.3127637, 0, 0.8196079, 1, 1,
0.05827061, -1.787462, 2.932613, 0, 0.8156863, 1, 1,
0.06645196, -0.4998396, 2.610006, 0, 0.8078431, 1, 1,
0.07337737, 0.3675345, -0.9380195, 0, 0.8039216, 1, 1,
0.07397634, -0.4063983, 1.03104, 0, 0.7960784, 1, 1,
0.07469057, -0.6828034, 3.781442, 0, 0.7882353, 1, 1,
0.07752751, 1.112283, 0.4621462, 0, 0.7843137, 1, 1,
0.07887211, -0.9108753, 1.873556, 0, 0.7764706, 1, 1,
0.07899935, -0.4867689, 2.725159, 0, 0.772549, 1, 1,
0.08074185, 0.9623434, -0.08687905, 0, 0.7647059, 1, 1,
0.08298317, 0.3691026, -0.09150989, 0, 0.7607843, 1, 1,
0.08475553, 0.5538096, -2.334441, 0, 0.7529412, 1, 1,
0.08818205, 0.4023107, 0.03099052, 0, 0.7490196, 1, 1,
0.08987488, 0.4778816, -1.368063, 0, 0.7411765, 1, 1,
0.09121653, -0.2881781, 1.270098, 0, 0.7372549, 1, 1,
0.09212986, -0.5732231, 4.033062, 0, 0.7294118, 1, 1,
0.09374073, 0.6703606, 0.7496929, 0, 0.7254902, 1, 1,
0.09544742, 1.560307, 1.047865, 0, 0.7176471, 1, 1,
0.09894384, -1.696834, 2.910253, 0, 0.7137255, 1, 1,
0.1008395, -0.1291086, 2.139136, 0, 0.7058824, 1, 1,
0.106248, -0.08391429, 0.63582, 0, 0.6980392, 1, 1,
0.1065071, -0.3727474, 4.621172, 0, 0.6941177, 1, 1,
0.1155912, 0.1593186, -0.2857572, 0, 0.6862745, 1, 1,
0.1198643, 1.506062, 0.2118966, 0, 0.682353, 1, 1,
0.1208488, 1.301772, 0.2389646, 0, 0.6745098, 1, 1,
0.1270922, 0.4984287, 0.4718609, 0, 0.6705883, 1, 1,
0.1284113, 1.474272, -0.6649455, 0, 0.6627451, 1, 1,
0.1297, 0.3513182, 0.4045201, 0, 0.6588235, 1, 1,
0.1345684, -1.836215, 3.838576, 0, 0.6509804, 1, 1,
0.1349892, 0.9696149, 0.6955864, 0, 0.6470588, 1, 1,
0.1371903, -2.861796, 3.157206, 0, 0.6392157, 1, 1,
0.1384076, 0.3601584, 0.5214293, 0, 0.6352941, 1, 1,
0.1396102, -2.193518, 3.173291, 0, 0.627451, 1, 1,
0.1427629, 0.5069009, 0.461396, 0, 0.6235294, 1, 1,
0.152004, -1.172613, 2.981722, 0, 0.6156863, 1, 1,
0.1520424, 0.8037844, -0.7519023, 0, 0.6117647, 1, 1,
0.1522263, -0.4730512, 5.491512, 0, 0.6039216, 1, 1,
0.1527878, 0.5212956, -1.288597, 0, 0.5960785, 1, 1,
0.1552004, 1.099428, 0.3861381, 0, 0.5921569, 1, 1,
0.1563433, 0.9845266, 0.3693752, 0, 0.5843138, 1, 1,
0.1604584, 0.3288708, -0.5359359, 0, 0.5803922, 1, 1,
0.1685345, 1.526753, 2.576186, 0, 0.572549, 1, 1,
0.1691971, 0.4919396, -0.8440037, 0, 0.5686275, 1, 1,
0.1703551, -0.6817932, 3.409302, 0, 0.5607843, 1, 1,
0.1728044, -0.5062924, 2.046539, 0, 0.5568628, 1, 1,
0.173402, 1.137432, 0.4419057, 0, 0.5490196, 1, 1,
0.1775418, 1.51034, 0.4873675, 0, 0.5450981, 1, 1,
0.1781055, -0.4406936, 3.7862, 0, 0.5372549, 1, 1,
0.1809373, 1.205912, -1.549701, 0, 0.5333334, 1, 1,
0.191694, 1.626167, -0.4628546, 0, 0.5254902, 1, 1,
0.1919413, 2.589071, -0.960907, 0, 0.5215687, 1, 1,
0.1922586, 0.5799264, -0.4082366, 0, 0.5137255, 1, 1,
0.1927766, 0.07854528, 2.025658, 0, 0.509804, 1, 1,
0.1936108, 0.09773374, 0.09247396, 0, 0.5019608, 1, 1,
0.1975894, -0.1727815, 1.469437, 0, 0.4941176, 1, 1,
0.2014131, 0.866116, -0.7540541, 0, 0.4901961, 1, 1,
0.2014142, -0.6907995, 4.01853, 0, 0.4823529, 1, 1,
0.2027909, 0.6020899, 0.02397887, 0, 0.4784314, 1, 1,
0.2092494, -0.5673708, 4.656925, 0, 0.4705882, 1, 1,
0.2110157, -0.9712808, 1.181095, 0, 0.4666667, 1, 1,
0.2116975, 0.2413506, 0.970315, 0, 0.4588235, 1, 1,
0.2123993, 1.367913, 0.09448086, 0, 0.454902, 1, 1,
0.2133708, -0.4065417, 2.845531, 0, 0.4470588, 1, 1,
0.2178495, 1.48704, 0.9208019, 0, 0.4431373, 1, 1,
0.2183961, 0.3229338, 0.6629412, 0, 0.4352941, 1, 1,
0.2192736, -1.589537, 2.353217, 0, 0.4313726, 1, 1,
0.2244668, 0.3227157, 1.536901, 0, 0.4235294, 1, 1,
0.2261643, 0.4300596, 0.7027224, 0, 0.4196078, 1, 1,
0.2277645, 0.9283701, 0.2236718, 0, 0.4117647, 1, 1,
0.2293586, -0.2193097, 1.963632, 0, 0.4078431, 1, 1,
0.2302249, -0.8730963, 4.982589, 0, 0.4, 1, 1,
0.2306088, 0.9313794, -1.302395, 0, 0.3921569, 1, 1,
0.2331059, 1.967628, -0.0006354183, 0, 0.3882353, 1, 1,
0.2428356, -1.134882, 3.397476, 0, 0.3803922, 1, 1,
0.2463263, -0.1496139, 1.631239, 0, 0.3764706, 1, 1,
0.2463786, -1.386518, 3.115001, 0, 0.3686275, 1, 1,
0.2470718, -0.2587388, 3.17378, 0, 0.3647059, 1, 1,
0.2502328, -0.7371526, 2.640047, 0, 0.3568628, 1, 1,
0.2553923, 0.6831878, 1.136687, 0, 0.3529412, 1, 1,
0.2557322, 0.3586324, -1.895445, 0, 0.345098, 1, 1,
0.2574802, -0.2390587, 2.577924, 0, 0.3411765, 1, 1,
0.2606662, -0.4227521, 0.3290929, 0, 0.3333333, 1, 1,
0.2660783, 0.6136699, -0.5659917, 0, 0.3294118, 1, 1,
0.2676277, -1.027686, 2.30976, 0, 0.3215686, 1, 1,
0.2696474, 0.5808285, 1.302686, 0, 0.3176471, 1, 1,
0.2710954, 0.1474894, -0.05147127, 0, 0.3098039, 1, 1,
0.2727854, -0.1217621, 1.570315, 0, 0.3058824, 1, 1,
0.2801377, 0.4076641, -1.062496, 0, 0.2980392, 1, 1,
0.2839198, -0.3260587, 1.582944, 0, 0.2901961, 1, 1,
0.2864244, -1.375521, 1.619349, 0, 0.2862745, 1, 1,
0.2866913, 0.1336899, 0.1811174, 0, 0.2784314, 1, 1,
0.2875352, 0.9539553, 0.4673065, 0, 0.2745098, 1, 1,
0.2942227, 1.085579, -0.1551484, 0, 0.2666667, 1, 1,
0.2946034, -1.571207, 3.904742, 0, 0.2627451, 1, 1,
0.2958601, -0.7082636, 1.928467, 0, 0.254902, 1, 1,
0.3100904, -1.075055, 4.564373, 0, 0.2509804, 1, 1,
0.3116164, -0.6658774, 2.857634, 0, 0.2431373, 1, 1,
0.3121685, -0.6006121, 3.13306, 0, 0.2392157, 1, 1,
0.3140348, 0.4445391, -0.8325784, 0, 0.2313726, 1, 1,
0.3145881, 1.077358, -0.2654632, 0, 0.227451, 1, 1,
0.3165177, -0.552999, 4.400518, 0, 0.2196078, 1, 1,
0.3189999, -0.4287536, 3.547772, 0, 0.2156863, 1, 1,
0.3194703, -0.3173817, 0.8247106, 0, 0.2078431, 1, 1,
0.322345, -1.068576, 3.625718, 0, 0.2039216, 1, 1,
0.326592, 0.1472509, -0.2468762, 0, 0.1960784, 1, 1,
0.3392541, -0.2067336, 2.647203, 0, 0.1882353, 1, 1,
0.3408961, 0.7700691, 0.1149979, 0, 0.1843137, 1, 1,
0.3516142, -0.9814375, 1.940372, 0, 0.1764706, 1, 1,
0.3540868, 0.2198595, 0.6686257, 0, 0.172549, 1, 1,
0.3599719, -1.061972, 2.13715, 0, 0.1647059, 1, 1,
0.3637862, 2.614268, -0.2467873, 0, 0.1607843, 1, 1,
0.365187, 1.32247, 0.2344394, 0, 0.1529412, 1, 1,
0.3661148, -0.07162498, 2.411822, 0, 0.1490196, 1, 1,
0.3681739, -1.531584, 1.159989, 0, 0.1411765, 1, 1,
0.3683704, 0.9526404, -0.5416348, 0, 0.1372549, 1, 1,
0.3684834, 1.129728, 0.8675979, 0, 0.1294118, 1, 1,
0.3717569, 0.4042466, 1.423227, 0, 0.1254902, 1, 1,
0.373698, 0.1508304, 1.362391, 0, 0.1176471, 1, 1,
0.3753032, -0.4315163, 2.970061, 0, 0.1137255, 1, 1,
0.3757231, 0.3774252, 2.037042, 0, 0.1058824, 1, 1,
0.3759248, 0.1316888, 1.402313, 0, 0.09803922, 1, 1,
0.3780058, 0.5824533, 0.1415419, 0, 0.09411765, 1, 1,
0.3796043, -0.1465404, 1.706243, 0, 0.08627451, 1, 1,
0.3816089, 0.1958933, 1.501624, 0, 0.08235294, 1, 1,
0.3823237, -0.5563396, 3.020989, 0, 0.07450981, 1, 1,
0.3835389, 0.1956244, 0.5566033, 0, 0.07058824, 1, 1,
0.3897937, 0.09532316, 2.042481, 0, 0.0627451, 1, 1,
0.3927088, 2.324629, 0.750332, 0, 0.05882353, 1, 1,
0.3935169, -0.311707, 3.981294, 0, 0.05098039, 1, 1,
0.395197, -0.8159503, 2.001057, 0, 0.04705882, 1, 1,
0.3960517, -0.1747403, 1.509323, 0, 0.03921569, 1, 1,
0.3980806, 0.5991391, -0.001308477, 0, 0.03529412, 1, 1,
0.3981738, 0.8920348, -1.43626, 0, 0.02745098, 1, 1,
0.3981949, 0.3523899, 1.954965, 0, 0.02352941, 1, 1,
0.401388, -1.923456, 2.827083, 0, 0.01568628, 1, 1,
0.4167654, 1.682855, -1.62696, 0, 0.01176471, 1, 1,
0.4173509, 1.386824, 0.7422015, 0, 0.003921569, 1, 1,
0.4176322, 0.8763637, -0.06109842, 0.003921569, 0, 1, 1,
0.4183313, -1.357957, 2.21034, 0.007843138, 0, 1, 1,
0.4197209, -0.02131681, 2.083778, 0.01568628, 0, 1, 1,
0.4212292, -0.1359808, 2.161995, 0.01960784, 0, 1, 1,
0.4217583, 0.3326243, 2.137662, 0.02745098, 0, 1, 1,
0.4271449, 0.01681969, 2.028377, 0.03137255, 0, 1, 1,
0.4278499, -0.8571886, 3.165321, 0.03921569, 0, 1, 1,
0.4310078, -0.78208, 2.062565, 0.04313726, 0, 1, 1,
0.431096, -1.293725, 1.865927, 0.05098039, 0, 1, 1,
0.4374825, 1.079606, 0.8993124, 0.05490196, 0, 1, 1,
0.4410271, -1.160128, 4.115211, 0.0627451, 0, 1, 1,
0.4424627, -0.348096, 2.43496, 0.06666667, 0, 1, 1,
0.443655, -1.008405, 1.08672, 0.07450981, 0, 1, 1,
0.4454438, 0.3085389, 1.236053, 0.07843138, 0, 1, 1,
0.4485689, -0.2573521, 4.01549, 0.08627451, 0, 1, 1,
0.4486519, -1.72086, 2.271191, 0.09019608, 0, 1, 1,
0.4545616, -0.2026867, 2.195768, 0.09803922, 0, 1, 1,
0.4565649, 1.662447, -0.08269156, 0.1058824, 0, 1, 1,
0.4637288, 0.7050624, 0.1508499, 0.1098039, 0, 1, 1,
0.4684691, 0.3237784, -0.002561776, 0.1176471, 0, 1, 1,
0.4734063, 1.282596, 0.2206089, 0.1215686, 0, 1, 1,
0.4737023, 0.4728652, -2.181334, 0.1294118, 0, 1, 1,
0.4739391, 0.9329745, -0.5360941, 0.1333333, 0, 1, 1,
0.4766153, 0.6364024, 0.2299185, 0.1411765, 0, 1, 1,
0.4784431, -0.6398315, 1.871615, 0.145098, 0, 1, 1,
0.4872985, -0.8251914, 4.119627, 0.1529412, 0, 1, 1,
0.4873065, 1.601295, 0.2182449, 0.1568628, 0, 1, 1,
0.4920373, 0.9734854, 0.09875936, 0.1647059, 0, 1, 1,
0.4923726, -0.2232509, 1.693261, 0.1686275, 0, 1, 1,
0.4924359, 0.9003072, 0.1815835, 0.1764706, 0, 1, 1,
0.4941057, -2.667765, 2.396645, 0.1803922, 0, 1, 1,
0.4949, -1.09984, 2.679781, 0.1882353, 0, 1, 1,
0.4967778, -0.1426785, 0.8275014, 0.1921569, 0, 1, 1,
0.4969603, 1.016938, 0.832485, 0.2, 0, 1, 1,
0.4970796, 0.198598, 0.5834256, 0.2078431, 0, 1, 1,
0.4985859, 0.8772748, 0.4125164, 0.2117647, 0, 1, 1,
0.499235, -0.8488362, 4.211909, 0.2196078, 0, 1, 1,
0.5030612, -1.092349, 3.71396, 0.2235294, 0, 1, 1,
0.5053632, 0.3168677, 1.000187, 0.2313726, 0, 1, 1,
0.5057721, 0.4440342, -0.05415765, 0.2352941, 0, 1, 1,
0.5081707, 0.6089231, 0.8006042, 0.2431373, 0, 1, 1,
0.5091255, -1.354951, 3.302668, 0.2470588, 0, 1, 1,
0.5104088, -0.2889736, 1.443115, 0.254902, 0, 1, 1,
0.513068, -0.6467486, 3.191688, 0.2588235, 0, 1, 1,
0.5173036, -0.7335722, 2.354799, 0.2666667, 0, 1, 1,
0.518021, -0.6168674, 2.091104, 0.2705882, 0, 1, 1,
0.5188929, 0.07649632, 1.885502, 0.2784314, 0, 1, 1,
0.5204591, 0.6869994, 1.536065, 0.282353, 0, 1, 1,
0.5210228, 0.2961701, 1.420681, 0.2901961, 0, 1, 1,
0.5266867, 0.7131215, 1.596929, 0.2941177, 0, 1, 1,
0.5269753, 0.429847, 0.8978291, 0.3019608, 0, 1, 1,
0.5276895, 0.6393299, 1.345775, 0.3098039, 0, 1, 1,
0.5289755, 0.7776726, 3.175039, 0.3137255, 0, 1, 1,
0.5297101, -0.06417333, 1.522971, 0.3215686, 0, 1, 1,
0.5338137, -0.684054, 1.825703, 0.3254902, 0, 1, 1,
0.5346331, 1.295622, 0.3348047, 0.3333333, 0, 1, 1,
0.5477812, -0.1387238, 1.34588, 0.3372549, 0, 1, 1,
0.5519532, -1.058564, 3.210586, 0.345098, 0, 1, 1,
0.555421, -0.3739634, 3.386236, 0.3490196, 0, 1, 1,
0.5607226, 0.9589634, -1.838548, 0.3568628, 0, 1, 1,
0.5607331, 0.6685013, 1.207327, 0.3607843, 0, 1, 1,
0.562139, 0.617687, 1.77205, 0.3686275, 0, 1, 1,
0.5654712, 0.8605586, -0.938853, 0.372549, 0, 1, 1,
0.5718839, -0.8657907, 2.037421, 0.3803922, 0, 1, 1,
0.5732204, -1.423523, 2.542845, 0.3843137, 0, 1, 1,
0.5817217, -1.601122, 3.243514, 0.3921569, 0, 1, 1,
0.5860421, 0.9898691, 1.278359, 0.3960784, 0, 1, 1,
0.5943075, -0.9325236, 3.044157, 0.4039216, 0, 1, 1,
0.5968595, -1.14951, 1.721564, 0.4117647, 0, 1, 1,
0.5975317, -0.4257203, 2.326836, 0.4156863, 0, 1, 1,
0.6007761, -0.7859406, 3.575804, 0.4235294, 0, 1, 1,
0.61551, 1.367364, -0.03836378, 0.427451, 0, 1, 1,
0.6189132, 0.8067232, 2.060018, 0.4352941, 0, 1, 1,
0.6324762, -0.7700272, 3.157332, 0.4392157, 0, 1, 1,
0.635956, -1.02403, 3.59754, 0.4470588, 0, 1, 1,
0.6368402, 0.9868554, -0.02809415, 0.4509804, 0, 1, 1,
0.6404725, 0.9209, 0.7678748, 0.4588235, 0, 1, 1,
0.6425838, 0.5710561, -0.7052789, 0.4627451, 0, 1, 1,
0.6428044, -1.485492, 3.210588, 0.4705882, 0, 1, 1,
0.6458227, 1.534111, 1.001713, 0.4745098, 0, 1, 1,
0.6493252, 0.6224477, 1.6729, 0.4823529, 0, 1, 1,
0.6629933, 0.5386341, -1.436209, 0.4862745, 0, 1, 1,
0.6655558, 0.2014053, 1.21292, 0.4941176, 0, 1, 1,
0.6656376, 0.4030698, 0.6781724, 0.5019608, 0, 1, 1,
0.6683637, -0.1197352, 1.35716, 0.5058824, 0, 1, 1,
0.6684833, -0.1851519, 2.739489, 0.5137255, 0, 1, 1,
0.6772028, -0.2338291, 2.263285, 0.5176471, 0, 1, 1,
0.6806604, 0.6800431, 0.3206819, 0.5254902, 0, 1, 1,
0.6815013, 0.2546375, 1.168996, 0.5294118, 0, 1, 1,
0.6847713, -0.8805093, 1.895898, 0.5372549, 0, 1, 1,
0.6850241, -0.02969106, 2.574385, 0.5411765, 0, 1, 1,
0.685599, -0.07921473, 0.5236194, 0.5490196, 0, 1, 1,
0.6887416, -1.064542, 2.71389, 0.5529412, 0, 1, 1,
0.6897748, -0.5692661, 2.034605, 0.5607843, 0, 1, 1,
0.6906018, -1.348265, 3.701416, 0.5647059, 0, 1, 1,
0.702001, -0.6422259, 3.564672, 0.572549, 0, 1, 1,
0.7030671, 1.135907, 1.527005, 0.5764706, 0, 1, 1,
0.7048871, 0.6591527, 0.6539825, 0.5843138, 0, 1, 1,
0.705204, 0.25189, 1.079438, 0.5882353, 0, 1, 1,
0.7077613, -0.473285, 4.407798, 0.5960785, 0, 1, 1,
0.708494, -1.111373, 1.310924, 0.6039216, 0, 1, 1,
0.7095649, 0.2391624, 0.07502161, 0.6078432, 0, 1, 1,
0.7114854, -2.160642, 1.546877, 0.6156863, 0, 1, 1,
0.7130028, 1.744395, 1.815504, 0.6196079, 0, 1, 1,
0.7140256, 0.4311424, 0.8774849, 0.627451, 0, 1, 1,
0.7203945, -2.095275, 4.142972, 0.6313726, 0, 1, 1,
0.7247943, -0.7130698, 3.091012, 0.6392157, 0, 1, 1,
0.7346227, -0.1947558, 1.796374, 0.6431373, 0, 1, 1,
0.7356074, -0.2750648, 2.084759, 0.6509804, 0, 1, 1,
0.7429825, 0.7855244, 1.808375, 0.654902, 0, 1, 1,
0.7433444, -0.7151935, 0.9118822, 0.6627451, 0, 1, 1,
0.7458774, -1.817729, 2.154633, 0.6666667, 0, 1, 1,
0.7464591, 0.8923419, -0.3757349, 0.6745098, 0, 1, 1,
0.7521943, -0.644099, 1.630574, 0.6784314, 0, 1, 1,
0.7591555, -0.1449555, 0.632503, 0.6862745, 0, 1, 1,
0.7615911, -0.2832573, 2.825952, 0.6901961, 0, 1, 1,
0.7642822, -0.2218077, 1.091915, 0.6980392, 0, 1, 1,
0.7646952, -0.8640672, 1.606979, 0.7058824, 0, 1, 1,
0.7672595, -0.4414482, 2.510121, 0.7098039, 0, 1, 1,
0.7686375, -2.116316, 2.527632, 0.7176471, 0, 1, 1,
0.7703934, 0.7990751, -0.6785501, 0.7215686, 0, 1, 1,
0.7738178, -0.9512781, 2.3202, 0.7294118, 0, 1, 1,
0.780866, -0.9267659, 2.311205, 0.7333333, 0, 1, 1,
0.7842728, -1.593024, 2.412801, 0.7411765, 0, 1, 1,
0.7846384, 1.923024, -0.7987819, 0.7450981, 0, 1, 1,
0.7861278, 0.2445454, 0.5533703, 0.7529412, 0, 1, 1,
0.7873201, -1.159409, 2.834929, 0.7568628, 0, 1, 1,
0.7928126, 0.7554115, -0.5984807, 0.7647059, 0, 1, 1,
0.7934083, 1.179146, 2.223239, 0.7686275, 0, 1, 1,
0.7962391, -0.6331849, 3.927371, 0.7764706, 0, 1, 1,
0.8002383, 0.00494322, 2.642688, 0.7803922, 0, 1, 1,
0.8015196, 0.7614416, 3.429547, 0.7882353, 0, 1, 1,
0.8032495, -1.873674, 3.24429, 0.7921569, 0, 1, 1,
0.8075727, -0.2466737, 2.037798, 0.8, 0, 1, 1,
0.8091517, 0.08687741, 1.892413, 0.8078431, 0, 1, 1,
0.8092479, -0.6824586, 1.398408, 0.8117647, 0, 1, 1,
0.8103557, 0.5070739, 1.614329, 0.8196079, 0, 1, 1,
0.8140707, -0.6034018, 2.053206, 0.8235294, 0, 1, 1,
0.8164414, -1.539461, 2.489204, 0.8313726, 0, 1, 1,
0.8211247, -0.3226323, 2.778333, 0.8352941, 0, 1, 1,
0.8264161, -0.1450467, 1.757722, 0.8431373, 0, 1, 1,
0.8324998, 0.2082133, 1.891962, 0.8470588, 0, 1, 1,
0.83366, -0.7368603, 1.929293, 0.854902, 0, 1, 1,
0.8341423, 0.2344021, 1.761752, 0.8588235, 0, 1, 1,
0.8348925, -1.176577, 0.966742, 0.8666667, 0, 1, 1,
0.8394905, 0.3717115, 2.797736, 0.8705882, 0, 1, 1,
0.8401339, 2.271149, 0.577101, 0.8784314, 0, 1, 1,
0.8491371, 0.8935053, 3.226144, 0.8823529, 0, 1, 1,
0.8495698, 0.4436373, 2.699969, 0.8901961, 0, 1, 1,
0.8506731, -0.8312383, 2.565091, 0.8941177, 0, 1, 1,
0.8528703, -1.324986, 0.8271343, 0.9019608, 0, 1, 1,
0.8658106, 0.3454857, 1.662562, 0.9098039, 0, 1, 1,
0.8659936, -0.4662878, 2.196109, 0.9137255, 0, 1, 1,
0.867461, 1.142613, 1.428168, 0.9215686, 0, 1, 1,
0.8696817, -1.097002, 3.099663, 0.9254902, 0, 1, 1,
0.8699, 1.782407, 2.048218, 0.9333333, 0, 1, 1,
0.8702495, 1.108842, -0.6801966, 0.9372549, 0, 1, 1,
0.8734691, -0.8785962, 3.110947, 0.945098, 0, 1, 1,
0.87573, 1.35132, -0.1960424, 0.9490196, 0, 1, 1,
0.8805015, 0.4253688, 1.232826, 0.9568627, 0, 1, 1,
0.8832575, 0.6305282, 2.19909, 0.9607843, 0, 1, 1,
0.8886679, 1.127173, 0.4610886, 0.9686275, 0, 1, 1,
0.8902037, 1.465009, 0.9385429, 0.972549, 0, 1, 1,
0.9026971, -0.7708716, 2.236021, 0.9803922, 0, 1, 1,
0.9055747, -0.5510821, 0.7537799, 0.9843137, 0, 1, 1,
0.9084667, 1.04512, -0.2978922, 0.9921569, 0, 1, 1,
0.9096779, -0.1845673, 1.90559, 0.9960784, 0, 1, 1,
0.9114958, -1.004876, 3.652819, 1, 0, 0.9960784, 1,
0.9153872, -0.8645107, 2.790976, 1, 0, 0.9882353, 1,
0.9165169, -0.6225777, 2.703855, 1, 0, 0.9843137, 1,
0.9192592, -1.454685, 1.504821, 1, 0, 0.9764706, 1,
0.9228287, 0.373716, 0.9238566, 1, 0, 0.972549, 1,
0.9244831, 0.9864639, 0.3693131, 1, 0, 0.9647059, 1,
0.9253059, 1.000413, 0.4818952, 1, 0, 0.9607843, 1,
0.9265347, 0.3471471, 0.6939969, 1, 0, 0.9529412, 1,
0.9265623, 2.11326, 0.4178416, 1, 0, 0.9490196, 1,
0.9266551, -0.6652916, 0.6442299, 1, 0, 0.9411765, 1,
0.9380562, 0.5128914, 2.952593, 1, 0, 0.9372549, 1,
0.9398777, -0.7875823, 2.86294, 1, 0, 0.9294118, 1,
0.9483128, 0.8172112, -1.295168, 1, 0, 0.9254902, 1,
0.952308, -0.7333071, 1.928571, 1, 0, 0.9176471, 1,
0.9557258, 1.264553, 0.7107819, 1, 0, 0.9137255, 1,
0.9563653, -1.119378, 3.062317, 1, 0, 0.9058824, 1,
0.9635701, -0.2066031, 2.250025, 1, 0, 0.9019608, 1,
0.9699982, 1.254259, 1.002401, 1, 0, 0.8941177, 1,
0.97131, 0.26837, 0.7757724, 1, 0, 0.8862745, 1,
0.9962808, -0.7084768, 3.187366, 1, 0, 0.8823529, 1,
0.9974685, -0.3860132, 2.986445, 1, 0, 0.8745098, 1,
1.003839, 0.08690388, 1.508426, 1, 0, 0.8705882, 1,
1.00773, 0.4075379, 1.975262, 1, 0, 0.8627451, 1,
1.008243, -1.669368, 3.7211, 1, 0, 0.8588235, 1,
1.009539, 0.6329898, 1.989296, 1, 0, 0.8509804, 1,
1.010412, -0.0435914, 0.7709523, 1, 0, 0.8470588, 1,
1.011616, -0.727204, 2.064941, 1, 0, 0.8392157, 1,
1.013657, -0.7671844, 1.584204, 1, 0, 0.8352941, 1,
1.018812, 0.5486147, 1.135642, 1, 0, 0.827451, 1,
1.019773, 1.060848, 1.643619, 1, 0, 0.8235294, 1,
1.036897, 0.4976132, 0.9804602, 1, 0, 0.8156863, 1,
1.037371, -1.392397, 2.332633, 1, 0, 0.8117647, 1,
1.041591, -1.153418, 2.800544, 1, 0, 0.8039216, 1,
1.043978, 0.2485818, 2.301943, 1, 0, 0.7960784, 1,
1.047191, -0.961611, 0.2113041, 1, 0, 0.7921569, 1,
1.047676, -2.529702, 3.536884, 1, 0, 0.7843137, 1,
1.05188, 0.7350566, 1.252521, 1, 0, 0.7803922, 1,
1.052289, 1.100403, -0.2747371, 1, 0, 0.772549, 1,
1.056173, -1.39398, 3.770794, 1, 0, 0.7686275, 1,
1.058759, 0.915173, 0.2260696, 1, 0, 0.7607843, 1,
1.066246, 1.259972, -2.628699, 1, 0, 0.7568628, 1,
1.089515, 1.120894, -0.107199, 1, 0, 0.7490196, 1,
1.09829, -1.36496, 1.36484, 1, 0, 0.7450981, 1,
1.101533, -0.06673916, 0.7590244, 1, 0, 0.7372549, 1,
1.101551, 1.718715, 0.4740284, 1, 0, 0.7333333, 1,
1.107283, 1.476585, 2.218074, 1, 0, 0.7254902, 1,
1.12839, -0.5377808, 3.516484, 1, 0, 0.7215686, 1,
1.135539, -1.796548, 2.141173, 1, 0, 0.7137255, 1,
1.142976, -1.494435, 3.19522, 1, 0, 0.7098039, 1,
1.146421, -0.3905903, 0.866096, 1, 0, 0.7019608, 1,
1.146825, -0.4495952, 2.973465, 1, 0, 0.6941177, 1,
1.147435, 0.467685, 0.03194382, 1, 0, 0.6901961, 1,
1.147599, 0.6247009, 0.4431631, 1, 0, 0.682353, 1,
1.156496, -0.3360201, 1.572625, 1, 0, 0.6784314, 1,
1.157669, -0.2502767, 3.425849, 1, 0, 0.6705883, 1,
1.166585, 0.7153399, -0.5484523, 1, 0, 0.6666667, 1,
1.170809, -0.5193868, 1.837004, 1, 0, 0.6588235, 1,
1.17855, -0.8620498, 1.137626, 1, 0, 0.654902, 1,
1.184587, 0.7572326, -0.6237034, 1, 0, 0.6470588, 1,
1.189286, 1.047015, 1.793971, 1, 0, 0.6431373, 1,
1.194139, 0.418536, 1.010823, 1, 0, 0.6352941, 1,
1.19426, 1.68252, 0.2069711, 1, 0, 0.6313726, 1,
1.196203, -0.4299985, 0.9268315, 1, 0, 0.6235294, 1,
1.196675, 0.4383184, 0.1431868, 1, 0, 0.6196079, 1,
1.212096, -1.407788, 1.993573, 1, 0, 0.6117647, 1,
1.213023, -0.8379134, 2.516298, 1, 0, 0.6078432, 1,
1.214326, 0.4887575, 2.199007, 1, 0, 0.6, 1,
1.218925, -0.02550282, 1.691325, 1, 0, 0.5921569, 1,
1.221347, -1.671541, 1.913764, 1, 0, 0.5882353, 1,
1.226828, 1.842489, 1.616837, 1, 0, 0.5803922, 1,
1.227693, -0.3731421, 2.79849, 1, 0, 0.5764706, 1,
1.233451, -1.196613, 2.803697, 1, 0, 0.5686275, 1,
1.234918, -0.5956978, 2.224432, 1, 0, 0.5647059, 1,
1.238065, -0.2603716, 1.552368, 1, 0, 0.5568628, 1,
1.239704, 0.5163304, 0.5892012, 1, 0, 0.5529412, 1,
1.251012, -0.7723885, 1.303468, 1, 0, 0.5450981, 1,
1.260457, 0.1258229, 0.5590723, 1, 0, 0.5411765, 1,
1.262125, 0.4376225, 1.487622, 1, 0, 0.5333334, 1,
1.262663, 2.434219, 1.131054, 1, 0, 0.5294118, 1,
1.264814, -0.8744991, 3.76822, 1, 0, 0.5215687, 1,
1.279255, 0.342288, 0.5671151, 1, 0, 0.5176471, 1,
1.281032, 1.369958, 3.249643, 1, 0, 0.509804, 1,
1.291996, 0.0617198, 1.596912, 1, 0, 0.5058824, 1,
1.294847, -0.3491734, 1.048262, 1, 0, 0.4980392, 1,
1.300581, 0.222414, 3.763629, 1, 0, 0.4901961, 1,
1.313138, 0.05645307, 0.90189, 1, 0, 0.4862745, 1,
1.334993, -0.2467525, 1.132462, 1, 0, 0.4784314, 1,
1.336727, 1.153354, 1.039194, 1, 0, 0.4745098, 1,
1.358422, -1.006532, 2.324834, 1, 0, 0.4666667, 1,
1.368129, 2.772888, -0.002366713, 1, 0, 0.4627451, 1,
1.369846, -0.9596907, 2.73576, 1, 0, 0.454902, 1,
1.380308, 0.5557986, 1.671285, 1, 0, 0.4509804, 1,
1.400394, -1.357707, 3.127145, 1, 0, 0.4431373, 1,
1.425315, -1.462315, 1.509882, 1, 0, 0.4392157, 1,
1.440605, -1.40515, 0.9862446, 1, 0, 0.4313726, 1,
1.442419, 0.3600883, 0.6853928, 1, 0, 0.427451, 1,
1.452994, -0.3843609, -0.3277272, 1, 0, 0.4196078, 1,
1.454035, 3.154374, 1.480331, 1, 0, 0.4156863, 1,
1.457218, 0.951038, 2.944567, 1, 0, 0.4078431, 1,
1.463797, 0.2467539, 0.3664902, 1, 0, 0.4039216, 1,
1.470525, 1.410574, 1.512154, 1, 0, 0.3960784, 1,
1.471867, 0.5939624, -0.3010147, 1, 0, 0.3882353, 1,
1.47402, -0.5392859, 2.812965, 1, 0, 0.3843137, 1,
1.478982, -0.6175032, 1.447029, 1, 0, 0.3764706, 1,
1.493654, 1.437889, 0.293913, 1, 0, 0.372549, 1,
1.496869, 0.09626066, 2.228817, 1, 0, 0.3647059, 1,
1.503657, -0.1909906, 2.541687, 1, 0, 0.3607843, 1,
1.512489, 2.20328, 1.149215, 1, 0, 0.3529412, 1,
1.518794, 0.1919343, 1.834015, 1, 0, 0.3490196, 1,
1.521657, -1.43234, 1.791885, 1, 0, 0.3411765, 1,
1.533651, -0.2121503, 1.676553, 1, 0, 0.3372549, 1,
1.536818, -0.3176868, 2.993896, 1, 0, 0.3294118, 1,
1.538767, -2.165043, 2.042304, 1, 0, 0.3254902, 1,
1.543633, 1.169409, 1.906018, 1, 0, 0.3176471, 1,
1.552875, -0.694062, 1.59912, 1, 0, 0.3137255, 1,
1.566993, -0.8826911, 2.801778, 1, 0, 0.3058824, 1,
1.57662, 1.924554, 0.9741583, 1, 0, 0.2980392, 1,
1.580917, 0.1810657, 3.512726, 1, 0, 0.2941177, 1,
1.581141, 0.2948565, -0.2260357, 1, 0, 0.2862745, 1,
1.586589, 2.189602, -1.103414, 1, 0, 0.282353, 1,
1.595043, -0.3751757, 0.9809641, 1, 0, 0.2745098, 1,
1.630254, -0.02671537, 3.256114, 1, 0, 0.2705882, 1,
1.633078, 0.2862164, 4.017919, 1, 0, 0.2627451, 1,
1.63372, 0.318699, 1.840633, 1, 0, 0.2588235, 1,
1.641837, 0.721638, 0.165464, 1, 0, 0.2509804, 1,
1.646531, 0.9102681, 1.661819, 1, 0, 0.2470588, 1,
1.677812, -0.3909426, 1.598881, 1, 0, 0.2392157, 1,
1.681273, -0.2293038, 1.60385, 1, 0, 0.2352941, 1,
1.700369, 0.8777213, -0.2333684, 1, 0, 0.227451, 1,
1.721123, 1.371132, 0.9164434, 1, 0, 0.2235294, 1,
1.732702, -0.09969527, 0.6172891, 1, 0, 0.2156863, 1,
1.746668, 1.225018, 0.6931877, 1, 0, 0.2117647, 1,
1.750311, -0.5889503, 2.475682, 1, 0, 0.2039216, 1,
1.751248, 1.263281, 0.3670643, 1, 0, 0.1960784, 1,
1.752812, -0.105626, 2.931017, 1, 0, 0.1921569, 1,
1.7709, 0.03994897, 0.323202, 1, 0, 0.1843137, 1,
1.78931, -1.628916, 3.684564, 1, 0, 0.1803922, 1,
1.7947, 0.151088, 2.398102, 1, 0, 0.172549, 1,
1.803073, -1.821664, 3.769878, 1, 0, 0.1686275, 1,
1.864782, 0.184867, 1.549012, 1, 0, 0.1607843, 1,
1.867874, -1.744499, 2.372157, 1, 0, 0.1568628, 1,
1.884935, 0.9078303, 0.3325455, 1, 0, 0.1490196, 1,
1.913374, -0.729724, 1.458841, 1, 0, 0.145098, 1,
1.935381, 0.7012146, 0.5956591, 1, 0, 0.1372549, 1,
2.006078, 1.624357, 0.838615, 1, 0, 0.1333333, 1,
2.019118, -1.862754, 3.205218, 1, 0, 0.1254902, 1,
2.025172, -0.01682153, 1.825659, 1, 0, 0.1215686, 1,
2.026938, 0.6516199, 1.722482, 1, 0, 0.1137255, 1,
2.027347, -0.9086952, 0.04132343, 1, 0, 0.1098039, 1,
2.041213, -0.2063725, 1.580868, 1, 0, 0.1019608, 1,
2.04522, -1.459009, 1.425808, 1, 0, 0.09411765, 1,
2.097314, 0.5882333, 2.792706, 1, 0, 0.09019608, 1,
2.121607, -2.412908, 2.937926, 1, 0, 0.08235294, 1,
2.14021, 1.176715, -0.8232978, 1, 0, 0.07843138, 1,
2.154616, 0.6927398, 0.9475281, 1, 0, 0.07058824, 1,
2.171251, -0.119118, 1.645, 1, 0, 0.06666667, 1,
2.243978, -0.2757059, 2.899914, 1, 0, 0.05882353, 1,
2.349373, 0.401597, 1.317927, 1, 0, 0.05490196, 1,
2.506203, 0.2722317, -0.268255, 1, 0, 0.04705882, 1,
2.525421, 0.567525, -0.2194476, 1, 0, 0.04313726, 1,
2.566563, -0.3066507, 2.019441, 1, 0, 0.03529412, 1,
2.622838, 0.2082478, 1.947875, 1, 0, 0.03137255, 1,
2.660152, 0.2992843, 0.6602758, 1, 0, 0.02352941, 1,
2.747637, -0.5863846, 3.306828, 1, 0, 0.01960784, 1,
2.855838, 0.6682522, 1.390932, 1, 0, 0.01176471, 1,
2.856311, 0.648074, 1.8241, 1, 0, 0.007843138, 1
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
-0.2302232, -4.163891, -7.754418, 0, -0.5, 0.5, 0.5,
-0.2302232, -4.163891, -7.754418, 1, -0.5, 0.5, 0.5,
-0.2302232, -4.163891, -7.754418, 1, 1.5, 0.5, 0.5,
-0.2302232, -4.163891, -7.754418, 0, 1.5, 0.5, 0.5
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
-4.363092, 0.1738968, -7.754418, 0, -0.5, 0.5, 0.5,
-4.363092, 0.1738968, -7.754418, 1, -0.5, 0.5, 0.5,
-4.363092, 0.1738968, -7.754418, 1, 1.5, 0.5, 0.5,
-4.363092, 0.1738968, -7.754418, 0, 1.5, 0.5, 0.5
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
-4.363092, -4.163891, -0.171562, 0, -0.5, 0.5, 0.5,
-4.363092, -4.163891, -0.171562, 1, -0.5, 0.5, 0.5,
-4.363092, -4.163891, -0.171562, 1, 1.5, 0.5, 0.5,
-4.363092, -4.163891, -0.171562, 0, 1.5, 0.5, 0.5
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
-3, -3.162863, -6.004528,
2, -3.162863, -6.004528,
-3, -3.162863, -6.004528,
-3, -3.329701, -6.296176,
-2, -3.162863, -6.004528,
-2, -3.329701, -6.296176,
-1, -3.162863, -6.004528,
-1, -3.329701, -6.296176,
0, -3.162863, -6.004528,
0, -3.329701, -6.296176,
1, -3.162863, -6.004528,
1, -3.329701, -6.296176,
2, -3.162863, -6.004528,
2, -3.329701, -6.296176
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
-3, -3.663378, -6.879473, 0, -0.5, 0.5, 0.5,
-3, -3.663378, -6.879473, 1, -0.5, 0.5, 0.5,
-3, -3.663378, -6.879473, 1, 1.5, 0.5, 0.5,
-3, -3.663378, -6.879473, 0, 1.5, 0.5, 0.5,
-2, -3.663378, -6.879473, 0, -0.5, 0.5, 0.5,
-2, -3.663378, -6.879473, 1, -0.5, 0.5, 0.5,
-2, -3.663378, -6.879473, 1, 1.5, 0.5, 0.5,
-2, -3.663378, -6.879473, 0, 1.5, 0.5, 0.5,
-1, -3.663378, -6.879473, 0, -0.5, 0.5, 0.5,
-1, -3.663378, -6.879473, 1, -0.5, 0.5, 0.5,
-1, -3.663378, -6.879473, 1, 1.5, 0.5, 0.5,
-1, -3.663378, -6.879473, 0, 1.5, 0.5, 0.5,
0, -3.663378, -6.879473, 0, -0.5, 0.5, 0.5,
0, -3.663378, -6.879473, 1, -0.5, 0.5, 0.5,
0, -3.663378, -6.879473, 1, 1.5, 0.5, 0.5,
0, -3.663378, -6.879473, 0, 1.5, 0.5, 0.5,
1, -3.663378, -6.879473, 0, -0.5, 0.5, 0.5,
1, -3.663378, -6.879473, 1, -0.5, 0.5, 0.5,
1, -3.663378, -6.879473, 1, 1.5, 0.5, 0.5,
1, -3.663378, -6.879473, 0, 1.5, 0.5, 0.5,
2, -3.663378, -6.879473, 0, -0.5, 0.5, 0.5,
2, -3.663378, -6.879473, 1, -0.5, 0.5, 0.5,
2, -3.663378, -6.879473, 1, 1.5, 0.5, 0.5,
2, -3.663378, -6.879473, 0, 1.5, 0.5, 0.5
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
-3.409353, -3, -6.004528,
-3.409353, 3, -6.004528,
-3.409353, -3, -6.004528,
-3.56831, -3, -6.296176,
-3.409353, -2, -6.004528,
-3.56831, -2, -6.296176,
-3.409353, -1, -6.004528,
-3.56831, -1, -6.296176,
-3.409353, 0, -6.004528,
-3.56831, 0, -6.296176,
-3.409353, 1, -6.004528,
-3.56831, 1, -6.296176,
-3.409353, 2, -6.004528,
-3.56831, 2, -6.296176,
-3.409353, 3, -6.004528,
-3.56831, 3, -6.296176
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
-3.886223, -3, -6.879473, 0, -0.5, 0.5, 0.5,
-3.886223, -3, -6.879473, 1, -0.5, 0.5, 0.5,
-3.886223, -3, -6.879473, 1, 1.5, 0.5, 0.5,
-3.886223, -3, -6.879473, 0, 1.5, 0.5, 0.5,
-3.886223, -2, -6.879473, 0, -0.5, 0.5, 0.5,
-3.886223, -2, -6.879473, 1, -0.5, 0.5, 0.5,
-3.886223, -2, -6.879473, 1, 1.5, 0.5, 0.5,
-3.886223, -2, -6.879473, 0, 1.5, 0.5, 0.5,
-3.886223, -1, -6.879473, 0, -0.5, 0.5, 0.5,
-3.886223, -1, -6.879473, 1, -0.5, 0.5, 0.5,
-3.886223, -1, -6.879473, 1, 1.5, 0.5, 0.5,
-3.886223, -1, -6.879473, 0, 1.5, 0.5, 0.5,
-3.886223, 0, -6.879473, 0, -0.5, 0.5, 0.5,
-3.886223, 0, -6.879473, 1, -0.5, 0.5, 0.5,
-3.886223, 0, -6.879473, 1, 1.5, 0.5, 0.5,
-3.886223, 0, -6.879473, 0, 1.5, 0.5, 0.5,
-3.886223, 1, -6.879473, 0, -0.5, 0.5, 0.5,
-3.886223, 1, -6.879473, 1, -0.5, 0.5, 0.5,
-3.886223, 1, -6.879473, 1, 1.5, 0.5, 0.5,
-3.886223, 1, -6.879473, 0, 1.5, 0.5, 0.5,
-3.886223, 2, -6.879473, 0, -0.5, 0.5, 0.5,
-3.886223, 2, -6.879473, 1, -0.5, 0.5, 0.5,
-3.886223, 2, -6.879473, 1, 1.5, 0.5, 0.5,
-3.886223, 2, -6.879473, 0, 1.5, 0.5, 0.5,
-3.886223, 3, -6.879473, 0, -0.5, 0.5, 0.5,
-3.886223, 3, -6.879473, 1, -0.5, 0.5, 0.5,
-3.886223, 3, -6.879473, 1, 1.5, 0.5, 0.5,
-3.886223, 3, -6.879473, 0, 1.5, 0.5, 0.5
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
-3.409353, -3.162863, -4,
-3.409353, -3.162863, 4,
-3.409353, -3.162863, -4,
-3.56831, -3.329701, -4,
-3.409353, -3.162863, -2,
-3.56831, -3.329701, -2,
-3.409353, -3.162863, 0,
-3.56831, -3.329701, 0,
-3.409353, -3.162863, 2,
-3.56831, -3.329701, 2,
-3.409353, -3.162863, 4,
-3.56831, -3.329701, 4
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
-3.886223, -3.663378, -4, 0, -0.5, 0.5, 0.5,
-3.886223, -3.663378, -4, 1, -0.5, 0.5, 0.5,
-3.886223, -3.663378, -4, 1, 1.5, 0.5, 0.5,
-3.886223, -3.663378, -4, 0, 1.5, 0.5, 0.5,
-3.886223, -3.663378, -2, 0, -0.5, 0.5, 0.5,
-3.886223, -3.663378, -2, 1, -0.5, 0.5, 0.5,
-3.886223, -3.663378, -2, 1, 1.5, 0.5, 0.5,
-3.886223, -3.663378, -2, 0, 1.5, 0.5, 0.5,
-3.886223, -3.663378, 0, 0, -0.5, 0.5, 0.5,
-3.886223, -3.663378, 0, 1, -0.5, 0.5, 0.5,
-3.886223, -3.663378, 0, 1, 1.5, 0.5, 0.5,
-3.886223, -3.663378, 0, 0, 1.5, 0.5, 0.5,
-3.886223, -3.663378, 2, 0, -0.5, 0.5, 0.5,
-3.886223, -3.663378, 2, 1, -0.5, 0.5, 0.5,
-3.886223, -3.663378, 2, 1, 1.5, 0.5, 0.5,
-3.886223, -3.663378, 2, 0, 1.5, 0.5, 0.5,
-3.886223, -3.663378, 4, 0, -0.5, 0.5, 0.5,
-3.886223, -3.663378, 4, 1, -0.5, 0.5, 0.5,
-3.886223, -3.663378, 4, 1, 1.5, 0.5, 0.5,
-3.886223, -3.663378, 4, 0, 1.5, 0.5, 0.5
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
-3.409353, -3.162863, -6.004528,
-3.409353, 3.510657, -6.004528,
-3.409353, -3.162863, 5.661404,
-3.409353, 3.510657, 5.661404,
-3.409353, -3.162863, -6.004528,
-3.409353, -3.162863, 5.661404,
-3.409353, 3.510657, -6.004528,
-3.409353, 3.510657, 5.661404,
-3.409353, -3.162863, -6.004528,
2.948907, -3.162863, -6.004528,
-3.409353, -3.162863, 5.661404,
2.948907, -3.162863, 5.661404,
-3.409353, 3.510657, -6.004528,
2.948907, 3.510657, -6.004528,
-3.409353, 3.510657, 5.661404,
2.948907, 3.510657, 5.661404,
2.948907, -3.162863, -6.004528,
2.948907, 3.510657, -6.004528,
2.948907, -3.162863, 5.661404,
2.948907, 3.510657, 5.661404,
2.948907, -3.162863, -6.004528,
2.948907, -3.162863, 5.661404,
2.948907, 3.510657, -6.004528,
2.948907, 3.510657, 5.661404
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
var radius = 7.939221;
var distance = 35.32249;
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
mvMatrix.translate( 0.2302232, -0.1738968, 0.171562 );
mvMatrix.scale( 1.350061, 1.286284, 0.7358214 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.32249);
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
terbutryn<-read.table("terbutryn.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-terbutryn$V2
```

```
## Error in eval(expr, envir, enclos): object 'terbutryn' not found
```

```r
y<-terbutryn$V3
```

```
## Error in eval(expr, envir, enclos): object 'terbutryn' not found
```

```r
z<-terbutryn$V4
```

```
## Error in eval(expr, envir, enclos): object 'terbutryn' not found
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
-3.316757, -1.666369, -2.513048, 0, 0, 1, 1, 1,
-3.090017, -1.336826, -1.087949, 1, 0, 0, 1, 1,
-2.622541, -0.1983631, -2.405462, 1, 0, 0, 1, 1,
-2.611861, -0.2514161, -1.71239, 1, 0, 0, 1, 1,
-2.567317, 1.007885, -0.9048998, 1, 0, 0, 1, 1,
-2.565785, 0.03102109, -2.381433, 1, 0, 0, 1, 1,
-2.385992, 0.6104957, -0.7008712, 0, 0, 0, 1, 1,
-2.316743, -0.1237664, -2.221687, 0, 0, 0, 1, 1,
-2.303188, 1.061327, -0.03316776, 0, 0, 0, 1, 1,
-2.300035, -0.6589499, -2.293119, 0, 0, 0, 1, 1,
-2.246441, -1.02147, -3.281093, 0, 0, 0, 1, 1,
-2.214813, -0.375498, -2.9263, 0, 0, 0, 1, 1,
-2.210919, 1.769471, -1.168096, 0, 0, 0, 1, 1,
-2.20482, 0.5683093, -2.159437, 1, 1, 1, 1, 1,
-2.084991, -0.7818978, -2.924675, 1, 1, 1, 1, 1,
-2.066535, -1.29114, -0.8670589, 1, 1, 1, 1, 1,
-2.045221, 0.3868885, -0.05578765, 1, 1, 1, 1, 1,
-2.037206, -0.2896548, -1.810699, 1, 1, 1, 1, 1,
-2.017346, 0.04681918, -2.902296, 1, 1, 1, 1, 1,
-2.004828, 0.7048365, -0.3761603, 1, 1, 1, 1, 1,
-1.986896, 0.8473093, -1.770624, 1, 1, 1, 1, 1,
-1.941691, -1.158136, -2.689275, 1, 1, 1, 1, 1,
-1.931459, -1.326399, -1.376556, 1, 1, 1, 1, 1,
-1.93119, -0.5668256, -2.276112, 1, 1, 1, 1, 1,
-1.921119, 0.1656245, -0.9936119, 1, 1, 1, 1, 1,
-1.909183, 0.04414807, -1.027573, 1, 1, 1, 1, 1,
-1.896258, -0.4814937, -2.306069, 1, 1, 1, 1, 1,
-1.89291, 1.878777, -2.517293, 1, 1, 1, 1, 1,
-1.883609, -0.3195632, -2.059442, 0, 0, 1, 1, 1,
-1.875883, 1.091056, -2.333168, 1, 0, 0, 1, 1,
-1.871152, -1.10283, -2.586919, 1, 0, 0, 1, 1,
-1.842322, 0.8418111, -0.1012146, 1, 0, 0, 1, 1,
-1.830928, 1.645926, -1.427144, 1, 0, 0, 1, 1,
-1.826171, 0.586314, -4.116024, 1, 0, 0, 1, 1,
-1.814071, 2.15499, -0.431795, 0, 0, 0, 1, 1,
-1.807053, -1.372463, -1.744334, 0, 0, 0, 1, 1,
-1.79968, 1.162044, -0.7616526, 0, 0, 0, 1, 1,
-1.785942, 0.1037261, -0.5520844, 0, 0, 0, 1, 1,
-1.783302, -0.0698581, -0.695771, 0, 0, 0, 1, 1,
-1.766722, -0.3467739, -1.566725, 0, 0, 0, 1, 1,
-1.758957, 0.4320646, -0.1638918, 0, 0, 0, 1, 1,
-1.757993, 0.5480453, -1.502144, 1, 1, 1, 1, 1,
-1.750699, -1.123999, -2.776312, 1, 1, 1, 1, 1,
-1.748943, 0.3282342, -2.260804, 1, 1, 1, 1, 1,
-1.711251, 0.06314033, -0.8520538, 1, 1, 1, 1, 1,
-1.707361, -0.4615731, -1.064133, 1, 1, 1, 1, 1,
-1.702368, 0.9491124, -2.11, 1, 1, 1, 1, 1,
-1.695551, 0.02030983, -2.949054, 1, 1, 1, 1, 1,
-1.667591, -0.3078492, -3.172641, 1, 1, 1, 1, 1,
-1.643353, -0.06007811, -1.74531, 1, 1, 1, 1, 1,
-1.641328, -1.251532, -1.413636, 1, 1, 1, 1, 1,
-1.635845, -0.3135224, -2.055777, 1, 1, 1, 1, 1,
-1.599785, -0.7361188, -0.887711, 1, 1, 1, 1, 1,
-1.59611, -0.4349622, -2.675334, 1, 1, 1, 1, 1,
-1.593159, -0.2686421, -1.164164, 1, 1, 1, 1, 1,
-1.570964, 0.4222566, -0.9218392, 1, 1, 1, 1, 1,
-1.570819, 1.455818, -0.4894142, 0, 0, 1, 1, 1,
-1.567945, 0.1037776, -4.32232, 1, 0, 0, 1, 1,
-1.539915, -1.319585, 0.02960947, 1, 0, 0, 1, 1,
-1.538067, -1.206915, -1.498576, 1, 0, 0, 1, 1,
-1.531896, -1.46559, -2.747007, 1, 0, 0, 1, 1,
-1.524536, -1.150209, -0.9851603, 1, 0, 0, 1, 1,
-1.517354, -0.4964675, -1.402105, 0, 0, 0, 1, 1,
-1.517058, 1.392028, -1.271641, 0, 0, 0, 1, 1,
-1.516197, -2.076248, -2.491215, 0, 0, 0, 1, 1,
-1.50977, 0.2788363, -2.386357, 0, 0, 0, 1, 1,
-1.505282, 0.7712318, -1.177723, 0, 0, 0, 1, 1,
-1.504339, 0.0886545, -2.804145, 0, 0, 0, 1, 1,
-1.49281, 0.9887537, -2.194903, 0, 0, 0, 1, 1,
-1.480362, 0.9028416, -0.06695472, 1, 1, 1, 1, 1,
-1.471852, 0.2076962, -1.844803, 1, 1, 1, 1, 1,
-1.471133, -0.8728546, -1.614154, 1, 1, 1, 1, 1,
-1.458974, -1.798138, -2.505659, 1, 1, 1, 1, 1,
-1.455907, 0.5143369, -2.754773, 1, 1, 1, 1, 1,
-1.453085, 0.1578413, 0.4166266, 1, 1, 1, 1, 1,
-1.448052, 0.7973722, -1.220602, 1, 1, 1, 1, 1,
-1.436684, -0.4152822, -0.691297, 1, 1, 1, 1, 1,
-1.43075, -0.5261062, -3.149082, 1, 1, 1, 1, 1,
-1.423622, -0.03902609, -1.286164, 1, 1, 1, 1, 1,
-1.416321, 1.684871, -0.1008907, 1, 1, 1, 1, 1,
-1.411649, -0.1042284, -1.83739, 1, 1, 1, 1, 1,
-1.403973, -0.3733164, -0.6689849, 1, 1, 1, 1, 1,
-1.403769, -1.169645, -3.406812, 1, 1, 1, 1, 1,
-1.401433, -1.996963, -2.434986, 1, 1, 1, 1, 1,
-1.396142, -0.8734387, -1.752579, 0, 0, 1, 1, 1,
-1.386106, 1.580015, -0.5517131, 1, 0, 0, 1, 1,
-1.380903, 0.6609251, -0.1996928, 1, 0, 0, 1, 1,
-1.376998, 0.1298168, -2.084788, 1, 0, 0, 1, 1,
-1.37572, -0.2861478, -4.04667, 1, 0, 0, 1, 1,
-1.373811, -0.2741602, -0.3843614, 1, 0, 0, 1, 1,
-1.365691, 1.203344, -1.431935, 0, 0, 0, 1, 1,
-1.36377, 0.7459357, -1.608062, 0, 0, 0, 1, 1,
-1.3624, 1.650305, -1.609624, 0, 0, 0, 1, 1,
-1.358638, 0.9031742, -1.167427, 0, 0, 0, 1, 1,
-1.358151, -0.7361925, -2.021168, 0, 0, 0, 1, 1,
-1.354297, 0.7535909, -2.26878, 0, 0, 0, 1, 1,
-1.326382, -1.103594, -2.8274, 0, 0, 0, 1, 1,
-1.323529, -1.405081, -1.39363, 1, 1, 1, 1, 1,
-1.318649, 0.5968627, -3.075595, 1, 1, 1, 1, 1,
-1.305412, -0.9620225, -2.165528, 1, 1, 1, 1, 1,
-1.301046, -0.532968, -3.7729, 1, 1, 1, 1, 1,
-1.297153, 0.3074902, -1.508101, 1, 1, 1, 1, 1,
-1.296962, 0.5169089, -0.8650295, 1, 1, 1, 1, 1,
-1.296115, -0.238898, -2.310185, 1, 1, 1, 1, 1,
-1.288901, -0.1968909, -2.449729, 1, 1, 1, 1, 1,
-1.282786, -0.1458072, -1.725835, 1, 1, 1, 1, 1,
-1.275335, 0.1014234, -0.3886139, 1, 1, 1, 1, 1,
-1.262647, -0.9767447, -2.210645, 1, 1, 1, 1, 1,
-1.261215, -0.01277981, -0.08285275, 1, 1, 1, 1, 1,
-1.246534, -2.416505, -3.43394, 1, 1, 1, 1, 1,
-1.242669, 0.6858822, -0.9645255, 1, 1, 1, 1, 1,
-1.237354, 0.8209273, -0.8728824, 1, 1, 1, 1, 1,
-1.231066, -0.5046398, -1.698106, 0, 0, 1, 1, 1,
-1.228081, 0.1789536, 1.344455, 1, 0, 0, 1, 1,
-1.225628, 1.030353, -0.394345, 1, 0, 0, 1, 1,
-1.219014, 0.7953107, -1.048643, 1, 0, 0, 1, 1,
-1.217684, 1.265216, -0.1030681, 1, 0, 0, 1, 1,
-1.209587, 0.3992492, -2.507109, 1, 0, 0, 1, 1,
-1.208431, -0.766197, -2.554862, 0, 0, 0, 1, 1,
-1.208319, -0.550398, -2.23477, 0, 0, 0, 1, 1,
-1.200976, -0.4611888, -2.374251, 0, 0, 0, 1, 1,
-1.198821, 0.5209069, -1.085113, 0, 0, 0, 1, 1,
-1.187077, -0.6604656, -1.693312, 0, 0, 0, 1, 1,
-1.185108, -0.5803803, -1.578438, 0, 0, 0, 1, 1,
-1.184785, -1.306645, -2.541197, 0, 0, 0, 1, 1,
-1.180527, -0.5337119, -2.520657, 1, 1, 1, 1, 1,
-1.176171, -0.433038, -4.423798, 1, 1, 1, 1, 1,
-1.170098, -1.298999, -2.289489, 1, 1, 1, 1, 1,
-1.163841, 0.4842452, -1.636748, 1, 1, 1, 1, 1,
-1.153014, -0.2556628, -2.168257, 1, 1, 1, 1, 1,
-1.149229, 0.6018956, -0.9198568, 1, 1, 1, 1, 1,
-1.145955, 0.2347744, -0.9734125, 1, 1, 1, 1, 1,
-1.136731, 0.7971266, -0.5574777, 1, 1, 1, 1, 1,
-1.134244, 1.041732, -1.672711, 1, 1, 1, 1, 1,
-1.132314, 0.3434878, -3.135439, 1, 1, 1, 1, 1,
-1.123498, 0.01491869, -0.03188869, 1, 1, 1, 1, 1,
-1.122829, -0.4312605, -1.866772, 1, 1, 1, 1, 1,
-1.113428, -0.8105384, -1.488206, 1, 1, 1, 1, 1,
-1.111245, 0.04943195, -1.50172, 1, 1, 1, 1, 1,
-1.106859, -2.438812, -0.9230017, 1, 1, 1, 1, 1,
-1.088356, -2.005137, -3.509241, 0, 0, 1, 1, 1,
-1.083585, -1.069186, -3.128525, 1, 0, 0, 1, 1,
-1.072943, -0.5048191, -3.192632, 1, 0, 0, 1, 1,
-1.064101, -0.551295, -1.711239, 1, 0, 0, 1, 1,
-1.062179, 0.1327787, -1.948233, 1, 0, 0, 1, 1,
-1.060571, 1.065175, 0.2652159, 1, 0, 0, 1, 1,
-1.059323, -0.07559095, -3.567341, 0, 0, 0, 1, 1,
-1.058927, -1.703187, -2.149272, 0, 0, 0, 1, 1,
-1.05749, 1.679815, -0.294255, 0, 0, 0, 1, 1,
-1.050703, -0.317599, -0.7743224, 0, 0, 0, 1, 1,
-1.048186, 1.086736, -0.8904514, 0, 0, 0, 1, 1,
-1.043414, -1.214607, -2.267558, 0, 0, 0, 1, 1,
-1.039213, 0.8588524, 0.1775129, 0, 0, 0, 1, 1,
-1.034754, 0.2591906, -0.5908386, 1, 1, 1, 1, 1,
-1.027712, 0.4802435, -1.133465, 1, 1, 1, 1, 1,
-1.024689, -0.2899175, -1.012254, 1, 1, 1, 1, 1,
-1.021684, -1.689703, -1.800269, 1, 1, 1, 1, 1,
-1.018944, 1.448562, -0.9970968, 1, 1, 1, 1, 1,
-1.017655, -0.1801843, -2.160221, 1, 1, 1, 1, 1,
-1.014399, 0.8069284, 0.2815953, 1, 1, 1, 1, 1,
-1.008901, 0.1467024, -1.778326, 1, 1, 1, 1, 1,
-1.004604, 0.656972, -0.8591574, 1, 1, 1, 1, 1,
-0.9936295, -0.8267377, -3.211109, 1, 1, 1, 1, 1,
-0.9931343, -1.019778, -2.188631, 1, 1, 1, 1, 1,
-0.9901114, -1.66224, -3.106056, 1, 1, 1, 1, 1,
-0.9839925, -2.141136, -1.671288, 1, 1, 1, 1, 1,
-0.9690986, -0.8736386, -0.4115716, 1, 1, 1, 1, 1,
-0.9644052, 1.064502, -1.484253, 1, 1, 1, 1, 1,
-0.9611343, 1.52109, -1.623495, 0, 0, 1, 1, 1,
-0.9585017, 2.149636, -1.982781, 1, 0, 0, 1, 1,
-0.9574668, -0.7204291, -2.404742, 1, 0, 0, 1, 1,
-0.9558709, -2.25253, -3.116177, 1, 0, 0, 1, 1,
-0.9515138, -0.8736664, -0.5456097, 1, 0, 0, 1, 1,
-0.9460902, 0.9064613, -0.510946, 1, 0, 0, 1, 1,
-0.9427385, -0.2747107, 0.07762516, 0, 0, 0, 1, 1,
-0.9424915, 0.8996506, -0.3429612, 0, 0, 0, 1, 1,
-0.9421435, 0.05685734, -1.755427, 0, 0, 0, 1, 1,
-0.9365161, 0.6124328, -1.960311, 0, 0, 0, 1, 1,
-0.9312587, 0.5517421, -0.4198784, 0, 0, 0, 1, 1,
-0.9299338, 0.2990176, -0.9681559, 0, 0, 0, 1, 1,
-0.91965, -1.564316, -1.823127, 0, 0, 0, 1, 1,
-0.9073386, 0.2283158, -2.528641, 1, 1, 1, 1, 1,
-0.9024339, -0.00160177, -1.49704, 1, 1, 1, 1, 1,
-0.9021462, 0.54103, 0.02890575, 1, 1, 1, 1, 1,
-0.8948745, -2.425537, -2.109781, 1, 1, 1, 1, 1,
-0.893337, -0.9099602, -2.953233, 1, 1, 1, 1, 1,
-0.892392, -2.017763, -3.939992, 1, 1, 1, 1, 1,
-0.8901295, -0.04041032, -2.375298, 1, 1, 1, 1, 1,
-0.8880986, -0.9539827, -1.821648, 1, 1, 1, 1, 1,
-0.8880036, -1.549881, -2.309432, 1, 1, 1, 1, 1,
-0.8864807, 0.11859, -1.698279, 1, 1, 1, 1, 1,
-0.874747, 0.05659637, -1.963522, 1, 1, 1, 1, 1,
-0.8704734, -0.7343069, -2.77054, 1, 1, 1, 1, 1,
-0.8690794, 0.2033927, 0.1453529, 1, 1, 1, 1, 1,
-0.8652133, -0.407176, -4.518775, 1, 1, 1, 1, 1,
-0.8634846, -1.095762, -2.427155, 1, 1, 1, 1, 1,
-0.8617615, 1.18641, -0.6747697, 0, 0, 1, 1, 1,
-0.855674, 0.9493716, -0.2361746, 1, 0, 0, 1, 1,
-0.8428197, -0.4161441, -2.276431, 1, 0, 0, 1, 1,
-0.8244235, -0.9924527, -3.085994, 1, 0, 0, 1, 1,
-0.8218658, -0.1640935, -0.6344449, 1, 0, 0, 1, 1,
-0.8133382, 0.6473278, -0.5742772, 1, 0, 0, 1, 1,
-0.8128279, 0.5458811, -3.407813, 0, 0, 0, 1, 1,
-0.8103594, -2.016952, -2.569116, 0, 0, 0, 1, 1,
-0.8077617, -0.9574328, -1.744797, 0, 0, 0, 1, 1,
-0.8049702, 0.7253132, -1.187395, 0, 0, 0, 1, 1,
-0.8047131, 0.940901, -0.9615542, 0, 0, 0, 1, 1,
-0.8043588, -2.006976, -2.23792, 0, 0, 0, 1, 1,
-0.8021629, -0.5507262, -0.9939365, 0, 0, 0, 1, 1,
-0.8005179, 0.6669456, -1.206875, 1, 1, 1, 1, 1,
-0.7971328, -1.237277, -1.785409, 1, 1, 1, 1, 1,
-0.7947529, -0.1849732, -1.690849, 1, 1, 1, 1, 1,
-0.7913074, -0.4527661, -1.478372, 1, 1, 1, 1, 1,
-0.7911302, -0.6946076, -3.449913, 1, 1, 1, 1, 1,
-0.7883664, 0.4337864, -0.8504627, 1, 1, 1, 1, 1,
-0.7883545, -0.05723245, -2.867795, 1, 1, 1, 1, 1,
-0.7865942, -0.6058432, -2.215505, 1, 1, 1, 1, 1,
-0.7834886, -0.3270743, -2.752412, 1, 1, 1, 1, 1,
-0.7789816, -0.7236037, -2.608667, 1, 1, 1, 1, 1,
-0.7776653, -0.0582406, -1.717643, 1, 1, 1, 1, 1,
-0.7771002, -0.03723845, -1.269761, 1, 1, 1, 1, 1,
-0.7752918, -0.8670239, -2.03024, 1, 1, 1, 1, 1,
-0.771265, -0.7444788, -2.714882, 1, 1, 1, 1, 1,
-0.7694299, -0.7670594, -3.682076, 1, 1, 1, 1, 1,
-0.7633395, -0.3130589, -1.404093, 0, 0, 1, 1, 1,
-0.7593552, 0.5844728, -2.836819, 1, 0, 0, 1, 1,
-0.7568157, 1.056926, -2.352756, 1, 0, 0, 1, 1,
-0.7532232, 0.6299974, 0.984327, 1, 0, 0, 1, 1,
-0.7523756, -1.090179, -2.378495, 1, 0, 0, 1, 1,
-0.7464188, 0.03459866, -1.396059, 1, 0, 0, 1, 1,
-0.7464181, 0.8355593, -1.820681, 0, 0, 0, 1, 1,
-0.7462475, 1.423468, 0.2861496, 0, 0, 0, 1, 1,
-0.7456415, 0.1757421, 0.3897803, 0, 0, 0, 1, 1,
-0.7404947, 0.06671082, -0.32461, 0, 0, 0, 1, 1,
-0.7396988, -1.493386, -4.047244, 0, 0, 0, 1, 1,
-0.7384199, -1.305685, -2.113217, 0, 0, 0, 1, 1,
-0.731266, 0.3005726, -0.5985907, 0, 0, 0, 1, 1,
-0.729628, -0.9260168, -1.550127, 1, 1, 1, 1, 1,
-0.7266717, 0.8502633, 0.03027635, 1, 1, 1, 1, 1,
-0.7265612, -2.034859, -2.155538, 1, 1, 1, 1, 1,
-0.7256426, -0.2710603, -2.483832, 1, 1, 1, 1, 1,
-0.7248916, 1.228987, -1.935664, 1, 1, 1, 1, 1,
-0.7239358, 0.3219496, -1.402949, 1, 1, 1, 1, 1,
-0.7135382, -1.355971, -3.091848, 1, 1, 1, 1, 1,
-0.7126153, -0.05511451, -0.4288976, 1, 1, 1, 1, 1,
-0.7096854, -0.7672615, -2.508195, 1, 1, 1, 1, 1,
-0.7094822, -0.1175396, -1.414655, 1, 1, 1, 1, 1,
-0.7091686, 0.7170098, -1.242069, 1, 1, 1, 1, 1,
-0.7068759, 0.4171333, -2.231896, 1, 1, 1, 1, 1,
-0.706243, 2.90666, 1.188205, 1, 1, 1, 1, 1,
-0.7051256, 0.7096118, -3.311728, 1, 1, 1, 1, 1,
-0.7023013, -1.526684, -3.588251, 1, 1, 1, 1, 1,
-0.7009896, 0.4684634, -0.1576734, 0, 0, 1, 1, 1,
-0.6873417, -0.372425, -1.317568, 1, 0, 0, 1, 1,
-0.6868822, 0.6723362, -1.064309, 1, 0, 0, 1, 1,
-0.6812046, 0.5888811, -0.4959468, 1, 0, 0, 1, 1,
-0.6809464, -0.7503929, -2.092678, 1, 0, 0, 1, 1,
-0.6740709, 0.7692053, -0.4094683, 1, 0, 0, 1, 1,
-0.6707622, 0.4765323, -1.39069, 0, 0, 0, 1, 1,
-0.6644727, 1.847702, -1.240349, 0, 0, 0, 1, 1,
-0.6582276, 1.091235, -0.9638324, 0, 0, 0, 1, 1,
-0.6572193, -1.568613, -3.82696, 0, 0, 0, 1, 1,
-0.6554847, -1.306077, -2.857058, 0, 0, 0, 1, 1,
-0.6493424, -0.7361987, -2.754706, 0, 0, 0, 1, 1,
-0.6469927, 0.9327646, 0.05471707, 0, 0, 0, 1, 1,
-0.6432725, 0.554192, -2.151887, 1, 1, 1, 1, 1,
-0.6415817, 0.578856, -0.1981827, 1, 1, 1, 1, 1,
-0.6409656, 0.8481988, -0.2221768, 1, 1, 1, 1, 1,
-0.6373074, -1.408823, -2.207125, 1, 1, 1, 1, 1,
-0.6370242, 0.9871656, -1.354577, 1, 1, 1, 1, 1,
-0.6350795, -1.527603, -3.230802, 1, 1, 1, 1, 1,
-0.6214125, 0.2913529, 0.2967018, 1, 1, 1, 1, 1,
-0.6181347, 0.5891824, -2.006759, 1, 1, 1, 1, 1,
-0.6074387, -0.6280779, -1.720806, 1, 1, 1, 1, 1,
-0.6056356, 0.8464447, -0.9558954, 1, 1, 1, 1, 1,
-0.6044725, 0.4079432, -1.328768, 1, 1, 1, 1, 1,
-0.5993024, 0.9117936, -0.8302194, 1, 1, 1, 1, 1,
-0.5924147, -0.3130059, -3.465657, 1, 1, 1, 1, 1,
-0.5919734, 0.7907879, 1.047536, 1, 1, 1, 1, 1,
-0.5897311, -0.08639807, -1.613732, 1, 1, 1, 1, 1,
-0.5862285, -2.133292, -2.479346, 0, 0, 1, 1, 1,
-0.5789893, 0.617685, -0.6273941, 1, 0, 0, 1, 1,
-0.5773392, 0.02968273, -1.453205, 1, 0, 0, 1, 1,
-0.574928, 0.3526541, 0.0329631, 1, 0, 0, 1, 1,
-0.5676572, -0.4945601, -3.107582, 1, 0, 0, 1, 1,
-0.5640777, 0.5954162, -0.04578086, 1, 0, 0, 1, 1,
-0.5637493, 0.8563609, 0.0711061, 0, 0, 0, 1, 1,
-0.5629888, -2.491802, -3.586225, 0, 0, 0, 1, 1,
-0.5610011, 0.5889313, -0.9251603, 0, 0, 0, 1, 1,
-0.560289, 1.932588, -1.107511, 0, 0, 0, 1, 1,
-0.5597482, -0.2537244, -3.6991, 0, 0, 0, 1, 1,
-0.5584681, 1.246259, -1.52761, 0, 0, 0, 1, 1,
-0.5555834, 0.07744422, 0.1938904, 0, 0, 0, 1, 1,
-0.5531564, 1.251861, 0.3196159, 1, 1, 1, 1, 1,
-0.552365, -0.9904383, -3.361881, 1, 1, 1, 1, 1,
-0.5517756, -0.8334339, -3.108567, 1, 1, 1, 1, 1,
-0.5483423, -0.4462957, -1.673512, 1, 1, 1, 1, 1,
-0.5449182, 0.2736185, 0.1888361, 1, 1, 1, 1, 1,
-0.544543, 0.501132, -1.318904, 1, 1, 1, 1, 1,
-0.5413426, -0.8770919, -0.9782521, 1, 1, 1, 1, 1,
-0.539569, -0.9368464, -3.254415, 1, 1, 1, 1, 1,
-0.5393695, 0.04121856, -1.04093, 1, 1, 1, 1, 1,
-0.5309623, 0.7230235, -0.4809301, 1, 1, 1, 1, 1,
-0.53084, -2.46822, -3.470258, 1, 1, 1, 1, 1,
-0.5277061, -0.1702423, -2.462347, 1, 1, 1, 1, 1,
-0.5241934, 1.636766, -0.06655244, 1, 1, 1, 1, 1,
-0.5179877, 1.259897, 1.733873, 1, 1, 1, 1, 1,
-0.5174796, -1.306495, -2.410388, 1, 1, 1, 1, 1,
-0.5119053, -0.1264625, -0.516104, 0, 0, 1, 1, 1,
-0.5113822, -2.300875, -2.931778, 1, 0, 0, 1, 1,
-0.5081416, 1.812355, -1.170519, 1, 0, 0, 1, 1,
-0.5038425, -0.9745309, -1.561462, 1, 0, 0, 1, 1,
-0.5031168, 1.02614, 0.2434023, 1, 0, 0, 1, 1,
-0.4940632, -0.3737963, -1.020316, 1, 0, 0, 1, 1,
-0.4922823, 0.5276265, 0.3412444, 0, 0, 0, 1, 1,
-0.492263, 2.347253, -1.285838, 0, 0, 0, 1, 1,
-0.4876907, -0.3321013, -3.49502, 0, 0, 0, 1, 1,
-0.4833405, 0.2453181, -1.157672, 0, 0, 0, 1, 1,
-0.4797678, -0.3533474, -2.002698, 0, 0, 0, 1, 1,
-0.4795555, 1.07159, -1.140204, 0, 0, 0, 1, 1,
-0.4773262, 1.059397, 0.6157593, 0, 0, 0, 1, 1,
-0.4730312, 0.8284534, 1.032114, 1, 1, 1, 1, 1,
-0.4721561, 1.885263, -1.360249, 1, 1, 1, 1, 1,
-0.470731, 1.054279, -0.1302296, 1, 1, 1, 1, 1,
-0.4666198, 1.508404, 0.8177104, 1, 1, 1, 1, 1,
-0.4656636, -0.7400421, -2.750782, 1, 1, 1, 1, 1,
-0.4633957, 0.7196202, -0.5735431, 1, 1, 1, 1, 1,
-0.4620584, -0.1216655, -2.660247, 1, 1, 1, 1, 1,
-0.459456, -0.8245113, -2.692273, 1, 1, 1, 1, 1,
-0.4588054, -0.4892865, -2.679405, 1, 1, 1, 1, 1,
-0.4557913, 0.2529362, -0.05527709, 1, 1, 1, 1, 1,
-0.4541013, 1.311348, -0.3067293, 1, 1, 1, 1, 1,
-0.4522345, -1.202533, -3.447311, 1, 1, 1, 1, 1,
-0.4508862, 1.157959, -1.037212, 1, 1, 1, 1, 1,
-0.4494531, 0.5783301, -1.754564, 1, 1, 1, 1, 1,
-0.4453299, 0.01088043, -2.345414, 1, 1, 1, 1, 1,
-0.4450802, -0.07109344, -2.091192, 0, 0, 1, 1, 1,
-0.4365224, -0.6329474, -2.153056, 1, 0, 0, 1, 1,
-0.4353105, 0.2877748, -2.109785, 1, 0, 0, 1, 1,
-0.4351665, -1.603557, -3.142133, 1, 0, 0, 1, 1,
-0.4325275, 0.7012698, -0.2040268, 1, 0, 0, 1, 1,
-0.4289032, -0.7497051, -1.517522, 1, 0, 0, 1, 1,
-0.4263254, 1.476449, -1.481575, 0, 0, 0, 1, 1,
-0.4193878, -0.9667121, -3.41908, 0, 0, 0, 1, 1,
-0.4183824, -0.1965073, -3.341394, 0, 0, 0, 1, 1,
-0.4136142, -0.1208274, -1.47682, 0, 0, 0, 1, 1,
-0.4110462, -1.370239, -0.7190382, 0, 0, 0, 1, 1,
-0.4101564, -1.820092, -3.393962, 0, 0, 0, 1, 1,
-0.4040057, -2.079341, -3.021383, 0, 0, 0, 1, 1,
-0.4034336, -0.4848129, -2.656109, 1, 1, 1, 1, 1,
-0.4000748, -1.518414, -1.507784, 1, 1, 1, 1, 1,
-0.3932761, -0.7100953, -2.589702, 1, 1, 1, 1, 1,
-0.392026, 1.720694, 1.387793, 1, 1, 1, 1, 1,
-0.390666, 1.059578, -0.1659117, 1, 1, 1, 1, 1,
-0.390373, 0.09059928, -2.284022, 1, 1, 1, 1, 1,
-0.3855931, 1.049004, -1.615741, 1, 1, 1, 1, 1,
-0.3814991, -0.7200713, -2.559448, 1, 1, 1, 1, 1,
-0.3785713, -0.1150819, -3.654349, 1, 1, 1, 1, 1,
-0.3656844, 1.085818, -0.2355638, 1, 1, 1, 1, 1,
-0.3651465, -0.9014775, -3.163256, 1, 1, 1, 1, 1,
-0.3594199, -0.7517198, -1.763922, 1, 1, 1, 1, 1,
-0.3592255, 0.7836869, -1.068565, 1, 1, 1, 1, 1,
-0.349909, -0.068082, -0.3619689, 1, 1, 1, 1, 1,
-0.3381987, 0.4371558, -1.236264, 1, 1, 1, 1, 1,
-0.3360841, -0.6908491, -1.167877, 0, 0, 1, 1, 1,
-0.3348804, -0.3690426, -1.880674, 1, 0, 0, 1, 1,
-0.3308736, -0.9583645, -1.795296, 1, 0, 0, 1, 1,
-0.3241277, 2.252511, -2.666441, 1, 0, 0, 1, 1,
-0.322646, 0.4736434, -0.2775261, 1, 0, 0, 1, 1,
-0.3216969, -0.3311392, -2.02248, 1, 0, 0, 1, 1,
-0.3214028, -0.1475998, -1.542966, 0, 0, 0, 1, 1,
-0.3193485, 0.6573612, -0.7887812, 0, 0, 0, 1, 1,
-0.318679, -0.9979954, -3.142078, 0, 0, 0, 1, 1,
-0.3153013, -1.328452, -3.78896, 0, 0, 0, 1, 1,
-0.3147157, -1.397372, -4.764164, 0, 0, 0, 1, 1,
-0.3104863, -0.4808969, -2.921015, 0, 0, 0, 1, 1,
-0.3080848, 0.09143495, -0.07385875, 0, 0, 0, 1, 1,
-0.3080842, -0.4291819, -2.016601, 1, 1, 1, 1, 1,
-0.3030372, 1.04893, 0.08113588, 1, 1, 1, 1, 1,
-0.3008853, 2.016071, -2.400575, 1, 1, 1, 1, 1,
-0.2882786, -0.04527319, -1.817783, 1, 1, 1, 1, 1,
-0.2865105, -0.8764335, -3.336309, 1, 1, 1, 1, 1,
-0.2846749, 0.4161646, -1.355725, 1, 1, 1, 1, 1,
-0.2826065, 0.3917173, 0.5721585, 1, 1, 1, 1, 1,
-0.2802859, 2.195236, 2.512795, 1, 1, 1, 1, 1,
-0.2765662, -0.8574598, -3.499454, 1, 1, 1, 1, 1,
-0.2724406, -0.216626, -1.694294, 1, 1, 1, 1, 1,
-0.2701948, -1.226443, -3.971192, 1, 1, 1, 1, 1,
-0.2655791, -0.2361896, -3.543492, 1, 1, 1, 1, 1,
-0.2600226, 0.4664918, 0.3154407, 1, 1, 1, 1, 1,
-0.2595224, -1.513208, -3.405559, 1, 1, 1, 1, 1,
-0.2564176, -0.866053, -1.833912, 1, 1, 1, 1, 1,
-0.2555774, 0.7806643, -1.307665, 0, 0, 1, 1, 1,
-0.2548484, -0.6977227, -3.568978, 1, 0, 0, 1, 1,
-0.2530375, -0.2107943, -0.7957706, 1, 0, 0, 1, 1,
-0.2518602, 0.8215079, 0.5960021, 1, 0, 0, 1, 1,
-0.2505669, -1.364955, -2.673064, 1, 0, 0, 1, 1,
-0.2501879, 0.9829247, -0.0510473, 1, 0, 0, 1, 1,
-0.2485361, -0.1808765, -3.774987, 0, 0, 0, 1, 1,
-0.2482166, -0.2825574, -1.343291, 0, 0, 0, 1, 1,
-0.2480437, -0.7348257, -0.5541949, 0, 0, 0, 1, 1,
-0.2466017, -0.05937585, -2.321616, 0, 0, 0, 1, 1,
-0.243238, 0.09975872, -0.915078, 0, 0, 0, 1, 1,
-0.2414482, -0.8513682, -3.682613, 0, 0, 0, 1, 1,
-0.2410673, -0.5437357, -2.145526, 0, 0, 0, 1, 1,
-0.2409788, 1.244799, 0.2424984, 1, 1, 1, 1, 1,
-0.2387955, -0.7482379, -2.28122, 1, 1, 1, 1, 1,
-0.2373859, 1.225839, 0.4521117, 1, 1, 1, 1, 1,
-0.2361476, 0.7170239, -0.8675174, 1, 1, 1, 1, 1,
-0.2344925, 0.3126878, -1.063177, 1, 1, 1, 1, 1,
-0.234281, -1.764436, -1.528952, 1, 1, 1, 1, 1,
-0.2316563, 0.05056588, -2.481878, 1, 1, 1, 1, 1,
-0.2303393, -0.7691647, -5.834636, 1, 1, 1, 1, 1,
-0.2295153, 0.07057161, -0.4948216, 1, 1, 1, 1, 1,
-0.2236727, 0.3423062, -0.7432945, 1, 1, 1, 1, 1,
-0.2230754, -1.666139, -2.916328, 1, 1, 1, 1, 1,
-0.2224705, -1.285497, -3.447615, 1, 1, 1, 1, 1,
-0.2220138, 0.7454375, -0.8128056, 1, 1, 1, 1, 1,
-0.221973, 0.1415564, -1.604946, 1, 1, 1, 1, 1,
-0.2210141, -3.065676, -2.517483, 1, 1, 1, 1, 1,
-0.220776, -0.191122, -1.093427, 0, 0, 1, 1, 1,
-0.2148702, -0.4870366, -1.891209, 1, 0, 0, 1, 1,
-0.212493, -1.331895, -3.911466, 1, 0, 0, 1, 1,
-0.2101472, -0.6782955, -2.705646, 1, 0, 0, 1, 1,
-0.2087604, 0.1918589, -1.069336, 1, 0, 0, 1, 1,
-0.2072894, 0.4589965, 0.08641805, 1, 0, 0, 1, 1,
-0.2069198, -1.553027, -3.711508, 0, 0, 0, 1, 1,
-0.201944, 1.027978, -1.133667, 0, 0, 0, 1, 1,
-0.2013783, 0.03202704, -0.8424388, 0, 0, 0, 1, 1,
-0.2006576, 0.5998342, 0.1810744, 0, 0, 0, 1, 1,
-0.2002732, 1.85131, -1.267771, 0, 0, 0, 1, 1,
-0.1999597, -0.3527904, -3.115747, 0, 0, 0, 1, 1,
-0.1981958, 0.7018792, 0.4080639, 0, 0, 0, 1, 1,
-0.197772, 0.3710574, -0.7242282, 1, 1, 1, 1, 1,
-0.1975322, 1.051911, 0.2456016, 1, 1, 1, 1, 1,
-0.1881942, 1.041069, 1.426966, 1, 1, 1, 1, 1,
-0.1866317, -0.5218541, -3.026007, 1, 1, 1, 1, 1,
-0.1841555, -0.4831921, -2.886781, 1, 1, 1, 1, 1,
-0.1822704, -0.1055356, -2.167328, 1, 1, 1, 1, 1,
-0.1800131, -1.846352, -1.487816, 1, 1, 1, 1, 1,
-0.178726, 0.7766818, -0.8999491, 1, 1, 1, 1, 1,
-0.1777288, -0.3844448, -3.132725, 1, 1, 1, 1, 1,
-0.1762095, -1.372273, -2.006614, 1, 1, 1, 1, 1,
-0.1732404, 0.7666733, 0.3814252, 1, 1, 1, 1, 1,
-0.1720973, 0.9804428, 0.335217, 1, 1, 1, 1, 1,
-0.1720455, -0.1209477, -1.713082, 1, 1, 1, 1, 1,
-0.1677664, 0.4783478, 0.6502131, 1, 1, 1, 1, 1,
-0.1641559, -1.307415, -3.625674, 1, 1, 1, 1, 1,
-0.1604956, 0.8233072, 0.2988561, 0, 0, 1, 1, 1,
-0.1544412, 0.7185459, 0.1820802, 1, 0, 0, 1, 1,
-0.1505844, -1.216706, -2.848221, 1, 0, 0, 1, 1,
-0.1499954, -1.611067, -4.0362, 1, 0, 0, 1, 1,
-0.1429336, 0.7416807, 0.7101157, 1, 0, 0, 1, 1,
-0.1426463, -1.474489, -2.717026, 1, 0, 0, 1, 1,
-0.1422194, -0.7183748, -3.487205, 0, 0, 0, 1, 1,
-0.1408172, 0.03755113, -2.312846, 0, 0, 0, 1, 1,
-0.1407131, -0.15327, -0.5639476, 0, 0, 0, 1, 1,
-0.1372325, 0.04370632, -2.454776, 0, 0, 0, 1, 1,
-0.1325536, 0.09933777, -1.644494, 0, 0, 0, 1, 1,
-0.1311726, 1.440593, 1.202254, 0, 0, 0, 1, 1,
-0.1286503, -0.08760756, -2.39772, 0, 0, 0, 1, 1,
-0.1279273, 0.4798024, -1.936059, 1, 1, 1, 1, 1,
-0.1216669, 0.6029035, 0.2099639, 1, 1, 1, 1, 1,
-0.1208101, -1.083414, -3.433331, 1, 1, 1, 1, 1,
-0.1186852, 1.421709, -1.902747, 1, 1, 1, 1, 1,
-0.1071211, -0.924511, -2.255331, 1, 1, 1, 1, 1,
-0.1054984, -1.156077, -4.139716, 1, 1, 1, 1, 1,
-0.1050131, -1.013786, -3.697324, 1, 1, 1, 1, 1,
-0.09750944, -0.3338097, -1.655144, 1, 1, 1, 1, 1,
-0.09558243, 0.9868751, -0.931945, 1, 1, 1, 1, 1,
-0.09483398, -0.8479697, -4.168397, 1, 1, 1, 1, 1,
-0.09430877, -1.981138, -4.945308, 1, 1, 1, 1, 1,
-0.09289618, 0.1232347, 0.3884323, 1, 1, 1, 1, 1,
-0.09049145, 0.8054484, 0.3859273, 1, 1, 1, 1, 1,
-0.08852237, -0.744709, -3.305297, 1, 1, 1, 1, 1,
-0.08347015, 0.07223482, 0.4101446, 1, 1, 1, 1, 1,
-0.07912337, -0.2842243, -2.68568, 0, 0, 1, 1, 1,
-0.07467934, 0.4595849, 0.1287027, 1, 0, 0, 1, 1,
-0.07247484, 0.2505215, 0.3775342, 1, 0, 0, 1, 1,
-0.06611735, 3.41347, 0.7035969, 1, 0, 0, 1, 1,
-0.06353626, -0.7700232, -2.996071, 1, 0, 0, 1, 1,
-0.06212296, 1.281794, 1.224231, 1, 0, 0, 1, 1,
-0.06031867, -1.523962, -2.343798, 0, 0, 0, 1, 1,
-0.05647597, 1.273475, -1.133075, 0, 0, 0, 1, 1,
-0.05555141, -0.6605472, -2.448491, 0, 0, 0, 1, 1,
-0.05312666, 1.733355, 0.1578349, 0, 0, 0, 1, 1,
-0.05055386, -0.6144521, -2.289298, 0, 0, 0, 1, 1,
-0.05040572, 1.204327, 0.6262665, 0, 0, 0, 1, 1,
-0.04970625, -1.875795, -2.494469, 0, 0, 0, 1, 1,
-0.04258014, 0.4939467, 0.5767062, 1, 1, 1, 1, 1,
-0.04223699, 1.060542, -0.14606, 1, 1, 1, 1, 1,
-0.03812901, -1.5844, -1.954714, 1, 1, 1, 1, 1,
-0.03767079, -1.706283, -2.620483, 1, 1, 1, 1, 1,
-0.03762715, 0.2521301, -0.3222726, 1, 1, 1, 1, 1,
-0.03752553, -0.1146879, -3.438634, 1, 1, 1, 1, 1,
-0.03056485, -0.7575341, -3.22977, 1, 1, 1, 1, 1,
-0.03027344, 0.8384533, -0.1774839, 1, 1, 1, 1, 1,
-0.02897374, -1.930511, -0.3086227, 1, 1, 1, 1, 1,
-0.02629367, -0.3475303, -2.651506, 1, 1, 1, 1, 1,
-0.02145446, 0.06581238, -0.08029641, 1, 1, 1, 1, 1,
-0.0211173, 0.7185387, -0.1826766, 1, 1, 1, 1, 1,
-0.01871127, -0.5477268, -4.804711, 1, 1, 1, 1, 1,
-0.01646239, 0.0007230506, -0.1190646, 1, 1, 1, 1, 1,
-0.01353918, 1.077363, 0.173036, 1, 1, 1, 1, 1,
-0.0116505, -1.296451, -4.19595, 0, 0, 1, 1, 1,
-0.01090316, 0.04899917, 0.4464665, 1, 0, 0, 1, 1,
-0.009615227, 0.4702667, -0.4046453, 1, 0, 0, 1, 1,
-0.00701353, -1.239545, -3.958613, 1, 0, 0, 1, 1,
0.003799639, -1.433832, 1.012774, 1, 0, 0, 1, 1,
0.007771097, -0.5963659, 4.051969, 1, 0, 0, 1, 1,
0.007889567, -0.6139846, 2.303505, 0, 0, 0, 1, 1,
0.01072626, -0.7987753, 3.784675, 0, 0, 0, 1, 1,
0.01715898, 1.240587, -0.2332245, 0, 0, 0, 1, 1,
0.02331526, 0.02315139, 1.185463, 0, 0, 0, 1, 1,
0.02392686, 0.4695634, -2.496974, 0, 0, 0, 1, 1,
0.02583401, 0.4118099, 1.026842, 0, 0, 0, 1, 1,
0.02648387, 0.2719792, -0.311171, 0, 0, 0, 1, 1,
0.0274464, -0.5840908, 4.726221, 1, 1, 1, 1, 1,
0.02847263, -1.354787, 3.138553, 1, 1, 1, 1, 1,
0.03231347, -1.059841, 2.700381, 1, 1, 1, 1, 1,
0.03487332, 0.671182, 1.37262, 1, 1, 1, 1, 1,
0.03809411, 1.847948, -0.2077435, 1, 1, 1, 1, 1,
0.03841876, 0.3182199, 0.4950257, 1, 1, 1, 1, 1,
0.03868625, -0.3721557, 4.716454, 1, 1, 1, 1, 1,
0.04243028, -0.8695747, 2.520871, 1, 1, 1, 1, 1,
0.04306845, 0.4659795, 1.086159, 1, 1, 1, 1, 1,
0.04539926, 1.086893, -0.7454504, 1, 1, 1, 1, 1,
0.04725326, 0.1604434, 1.0151, 1, 1, 1, 1, 1,
0.04793337, 0.7990617, 0.8500117, 1, 1, 1, 1, 1,
0.04857884, -0.9536799, 3.542647, 1, 1, 1, 1, 1,
0.04903855, -0.05141593, 0.3127637, 1, 1, 1, 1, 1,
0.05827061, -1.787462, 2.932613, 1, 1, 1, 1, 1,
0.06645196, -0.4998396, 2.610006, 0, 0, 1, 1, 1,
0.07337737, 0.3675345, -0.9380195, 1, 0, 0, 1, 1,
0.07397634, -0.4063983, 1.03104, 1, 0, 0, 1, 1,
0.07469057, -0.6828034, 3.781442, 1, 0, 0, 1, 1,
0.07752751, 1.112283, 0.4621462, 1, 0, 0, 1, 1,
0.07887211, -0.9108753, 1.873556, 1, 0, 0, 1, 1,
0.07899935, -0.4867689, 2.725159, 0, 0, 0, 1, 1,
0.08074185, 0.9623434, -0.08687905, 0, 0, 0, 1, 1,
0.08298317, 0.3691026, -0.09150989, 0, 0, 0, 1, 1,
0.08475553, 0.5538096, -2.334441, 0, 0, 0, 1, 1,
0.08818205, 0.4023107, 0.03099052, 0, 0, 0, 1, 1,
0.08987488, 0.4778816, -1.368063, 0, 0, 0, 1, 1,
0.09121653, -0.2881781, 1.270098, 0, 0, 0, 1, 1,
0.09212986, -0.5732231, 4.033062, 1, 1, 1, 1, 1,
0.09374073, 0.6703606, 0.7496929, 1, 1, 1, 1, 1,
0.09544742, 1.560307, 1.047865, 1, 1, 1, 1, 1,
0.09894384, -1.696834, 2.910253, 1, 1, 1, 1, 1,
0.1008395, -0.1291086, 2.139136, 1, 1, 1, 1, 1,
0.106248, -0.08391429, 0.63582, 1, 1, 1, 1, 1,
0.1065071, -0.3727474, 4.621172, 1, 1, 1, 1, 1,
0.1155912, 0.1593186, -0.2857572, 1, 1, 1, 1, 1,
0.1198643, 1.506062, 0.2118966, 1, 1, 1, 1, 1,
0.1208488, 1.301772, 0.2389646, 1, 1, 1, 1, 1,
0.1270922, 0.4984287, 0.4718609, 1, 1, 1, 1, 1,
0.1284113, 1.474272, -0.6649455, 1, 1, 1, 1, 1,
0.1297, 0.3513182, 0.4045201, 1, 1, 1, 1, 1,
0.1345684, -1.836215, 3.838576, 1, 1, 1, 1, 1,
0.1349892, 0.9696149, 0.6955864, 1, 1, 1, 1, 1,
0.1371903, -2.861796, 3.157206, 0, 0, 1, 1, 1,
0.1384076, 0.3601584, 0.5214293, 1, 0, 0, 1, 1,
0.1396102, -2.193518, 3.173291, 1, 0, 0, 1, 1,
0.1427629, 0.5069009, 0.461396, 1, 0, 0, 1, 1,
0.152004, -1.172613, 2.981722, 1, 0, 0, 1, 1,
0.1520424, 0.8037844, -0.7519023, 1, 0, 0, 1, 1,
0.1522263, -0.4730512, 5.491512, 0, 0, 0, 1, 1,
0.1527878, 0.5212956, -1.288597, 0, 0, 0, 1, 1,
0.1552004, 1.099428, 0.3861381, 0, 0, 0, 1, 1,
0.1563433, 0.9845266, 0.3693752, 0, 0, 0, 1, 1,
0.1604584, 0.3288708, -0.5359359, 0, 0, 0, 1, 1,
0.1685345, 1.526753, 2.576186, 0, 0, 0, 1, 1,
0.1691971, 0.4919396, -0.8440037, 0, 0, 0, 1, 1,
0.1703551, -0.6817932, 3.409302, 1, 1, 1, 1, 1,
0.1728044, -0.5062924, 2.046539, 1, 1, 1, 1, 1,
0.173402, 1.137432, 0.4419057, 1, 1, 1, 1, 1,
0.1775418, 1.51034, 0.4873675, 1, 1, 1, 1, 1,
0.1781055, -0.4406936, 3.7862, 1, 1, 1, 1, 1,
0.1809373, 1.205912, -1.549701, 1, 1, 1, 1, 1,
0.191694, 1.626167, -0.4628546, 1, 1, 1, 1, 1,
0.1919413, 2.589071, -0.960907, 1, 1, 1, 1, 1,
0.1922586, 0.5799264, -0.4082366, 1, 1, 1, 1, 1,
0.1927766, 0.07854528, 2.025658, 1, 1, 1, 1, 1,
0.1936108, 0.09773374, 0.09247396, 1, 1, 1, 1, 1,
0.1975894, -0.1727815, 1.469437, 1, 1, 1, 1, 1,
0.2014131, 0.866116, -0.7540541, 1, 1, 1, 1, 1,
0.2014142, -0.6907995, 4.01853, 1, 1, 1, 1, 1,
0.2027909, 0.6020899, 0.02397887, 1, 1, 1, 1, 1,
0.2092494, -0.5673708, 4.656925, 0, 0, 1, 1, 1,
0.2110157, -0.9712808, 1.181095, 1, 0, 0, 1, 1,
0.2116975, 0.2413506, 0.970315, 1, 0, 0, 1, 1,
0.2123993, 1.367913, 0.09448086, 1, 0, 0, 1, 1,
0.2133708, -0.4065417, 2.845531, 1, 0, 0, 1, 1,
0.2178495, 1.48704, 0.9208019, 1, 0, 0, 1, 1,
0.2183961, 0.3229338, 0.6629412, 0, 0, 0, 1, 1,
0.2192736, -1.589537, 2.353217, 0, 0, 0, 1, 1,
0.2244668, 0.3227157, 1.536901, 0, 0, 0, 1, 1,
0.2261643, 0.4300596, 0.7027224, 0, 0, 0, 1, 1,
0.2277645, 0.9283701, 0.2236718, 0, 0, 0, 1, 1,
0.2293586, -0.2193097, 1.963632, 0, 0, 0, 1, 1,
0.2302249, -0.8730963, 4.982589, 0, 0, 0, 1, 1,
0.2306088, 0.9313794, -1.302395, 1, 1, 1, 1, 1,
0.2331059, 1.967628, -0.0006354183, 1, 1, 1, 1, 1,
0.2428356, -1.134882, 3.397476, 1, 1, 1, 1, 1,
0.2463263, -0.1496139, 1.631239, 1, 1, 1, 1, 1,
0.2463786, -1.386518, 3.115001, 1, 1, 1, 1, 1,
0.2470718, -0.2587388, 3.17378, 1, 1, 1, 1, 1,
0.2502328, -0.7371526, 2.640047, 1, 1, 1, 1, 1,
0.2553923, 0.6831878, 1.136687, 1, 1, 1, 1, 1,
0.2557322, 0.3586324, -1.895445, 1, 1, 1, 1, 1,
0.2574802, -0.2390587, 2.577924, 1, 1, 1, 1, 1,
0.2606662, -0.4227521, 0.3290929, 1, 1, 1, 1, 1,
0.2660783, 0.6136699, -0.5659917, 1, 1, 1, 1, 1,
0.2676277, -1.027686, 2.30976, 1, 1, 1, 1, 1,
0.2696474, 0.5808285, 1.302686, 1, 1, 1, 1, 1,
0.2710954, 0.1474894, -0.05147127, 1, 1, 1, 1, 1,
0.2727854, -0.1217621, 1.570315, 0, 0, 1, 1, 1,
0.2801377, 0.4076641, -1.062496, 1, 0, 0, 1, 1,
0.2839198, -0.3260587, 1.582944, 1, 0, 0, 1, 1,
0.2864244, -1.375521, 1.619349, 1, 0, 0, 1, 1,
0.2866913, 0.1336899, 0.1811174, 1, 0, 0, 1, 1,
0.2875352, 0.9539553, 0.4673065, 1, 0, 0, 1, 1,
0.2942227, 1.085579, -0.1551484, 0, 0, 0, 1, 1,
0.2946034, -1.571207, 3.904742, 0, 0, 0, 1, 1,
0.2958601, -0.7082636, 1.928467, 0, 0, 0, 1, 1,
0.3100904, -1.075055, 4.564373, 0, 0, 0, 1, 1,
0.3116164, -0.6658774, 2.857634, 0, 0, 0, 1, 1,
0.3121685, -0.6006121, 3.13306, 0, 0, 0, 1, 1,
0.3140348, 0.4445391, -0.8325784, 0, 0, 0, 1, 1,
0.3145881, 1.077358, -0.2654632, 1, 1, 1, 1, 1,
0.3165177, -0.552999, 4.400518, 1, 1, 1, 1, 1,
0.3189999, -0.4287536, 3.547772, 1, 1, 1, 1, 1,
0.3194703, -0.3173817, 0.8247106, 1, 1, 1, 1, 1,
0.322345, -1.068576, 3.625718, 1, 1, 1, 1, 1,
0.326592, 0.1472509, -0.2468762, 1, 1, 1, 1, 1,
0.3392541, -0.2067336, 2.647203, 1, 1, 1, 1, 1,
0.3408961, 0.7700691, 0.1149979, 1, 1, 1, 1, 1,
0.3516142, -0.9814375, 1.940372, 1, 1, 1, 1, 1,
0.3540868, 0.2198595, 0.6686257, 1, 1, 1, 1, 1,
0.3599719, -1.061972, 2.13715, 1, 1, 1, 1, 1,
0.3637862, 2.614268, -0.2467873, 1, 1, 1, 1, 1,
0.365187, 1.32247, 0.2344394, 1, 1, 1, 1, 1,
0.3661148, -0.07162498, 2.411822, 1, 1, 1, 1, 1,
0.3681739, -1.531584, 1.159989, 1, 1, 1, 1, 1,
0.3683704, 0.9526404, -0.5416348, 0, 0, 1, 1, 1,
0.3684834, 1.129728, 0.8675979, 1, 0, 0, 1, 1,
0.3717569, 0.4042466, 1.423227, 1, 0, 0, 1, 1,
0.373698, 0.1508304, 1.362391, 1, 0, 0, 1, 1,
0.3753032, -0.4315163, 2.970061, 1, 0, 0, 1, 1,
0.3757231, 0.3774252, 2.037042, 1, 0, 0, 1, 1,
0.3759248, 0.1316888, 1.402313, 0, 0, 0, 1, 1,
0.3780058, 0.5824533, 0.1415419, 0, 0, 0, 1, 1,
0.3796043, -0.1465404, 1.706243, 0, 0, 0, 1, 1,
0.3816089, 0.1958933, 1.501624, 0, 0, 0, 1, 1,
0.3823237, -0.5563396, 3.020989, 0, 0, 0, 1, 1,
0.3835389, 0.1956244, 0.5566033, 0, 0, 0, 1, 1,
0.3897937, 0.09532316, 2.042481, 0, 0, 0, 1, 1,
0.3927088, 2.324629, 0.750332, 1, 1, 1, 1, 1,
0.3935169, -0.311707, 3.981294, 1, 1, 1, 1, 1,
0.395197, -0.8159503, 2.001057, 1, 1, 1, 1, 1,
0.3960517, -0.1747403, 1.509323, 1, 1, 1, 1, 1,
0.3980806, 0.5991391, -0.001308477, 1, 1, 1, 1, 1,
0.3981738, 0.8920348, -1.43626, 1, 1, 1, 1, 1,
0.3981949, 0.3523899, 1.954965, 1, 1, 1, 1, 1,
0.401388, -1.923456, 2.827083, 1, 1, 1, 1, 1,
0.4167654, 1.682855, -1.62696, 1, 1, 1, 1, 1,
0.4173509, 1.386824, 0.7422015, 1, 1, 1, 1, 1,
0.4176322, 0.8763637, -0.06109842, 1, 1, 1, 1, 1,
0.4183313, -1.357957, 2.21034, 1, 1, 1, 1, 1,
0.4197209, -0.02131681, 2.083778, 1, 1, 1, 1, 1,
0.4212292, -0.1359808, 2.161995, 1, 1, 1, 1, 1,
0.4217583, 0.3326243, 2.137662, 1, 1, 1, 1, 1,
0.4271449, 0.01681969, 2.028377, 0, 0, 1, 1, 1,
0.4278499, -0.8571886, 3.165321, 1, 0, 0, 1, 1,
0.4310078, -0.78208, 2.062565, 1, 0, 0, 1, 1,
0.431096, -1.293725, 1.865927, 1, 0, 0, 1, 1,
0.4374825, 1.079606, 0.8993124, 1, 0, 0, 1, 1,
0.4410271, -1.160128, 4.115211, 1, 0, 0, 1, 1,
0.4424627, -0.348096, 2.43496, 0, 0, 0, 1, 1,
0.443655, -1.008405, 1.08672, 0, 0, 0, 1, 1,
0.4454438, 0.3085389, 1.236053, 0, 0, 0, 1, 1,
0.4485689, -0.2573521, 4.01549, 0, 0, 0, 1, 1,
0.4486519, -1.72086, 2.271191, 0, 0, 0, 1, 1,
0.4545616, -0.2026867, 2.195768, 0, 0, 0, 1, 1,
0.4565649, 1.662447, -0.08269156, 0, 0, 0, 1, 1,
0.4637288, 0.7050624, 0.1508499, 1, 1, 1, 1, 1,
0.4684691, 0.3237784, -0.002561776, 1, 1, 1, 1, 1,
0.4734063, 1.282596, 0.2206089, 1, 1, 1, 1, 1,
0.4737023, 0.4728652, -2.181334, 1, 1, 1, 1, 1,
0.4739391, 0.9329745, -0.5360941, 1, 1, 1, 1, 1,
0.4766153, 0.6364024, 0.2299185, 1, 1, 1, 1, 1,
0.4784431, -0.6398315, 1.871615, 1, 1, 1, 1, 1,
0.4872985, -0.8251914, 4.119627, 1, 1, 1, 1, 1,
0.4873065, 1.601295, 0.2182449, 1, 1, 1, 1, 1,
0.4920373, 0.9734854, 0.09875936, 1, 1, 1, 1, 1,
0.4923726, -0.2232509, 1.693261, 1, 1, 1, 1, 1,
0.4924359, 0.9003072, 0.1815835, 1, 1, 1, 1, 1,
0.4941057, -2.667765, 2.396645, 1, 1, 1, 1, 1,
0.4949, -1.09984, 2.679781, 1, 1, 1, 1, 1,
0.4967778, -0.1426785, 0.8275014, 1, 1, 1, 1, 1,
0.4969603, 1.016938, 0.832485, 0, 0, 1, 1, 1,
0.4970796, 0.198598, 0.5834256, 1, 0, 0, 1, 1,
0.4985859, 0.8772748, 0.4125164, 1, 0, 0, 1, 1,
0.499235, -0.8488362, 4.211909, 1, 0, 0, 1, 1,
0.5030612, -1.092349, 3.71396, 1, 0, 0, 1, 1,
0.5053632, 0.3168677, 1.000187, 1, 0, 0, 1, 1,
0.5057721, 0.4440342, -0.05415765, 0, 0, 0, 1, 1,
0.5081707, 0.6089231, 0.8006042, 0, 0, 0, 1, 1,
0.5091255, -1.354951, 3.302668, 0, 0, 0, 1, 1,
0.5104088, -0.2889736, 1.443115, 0, 0, 0, 1, 1,
0.513068, -0.6467486, 3.191688, 0, 0, 0, 1, 1,
0.5173036, -0.7335722, 2.354799, 0, 0, 0, 1, 1,
0.518021, -0.6168674, 2.091104, 0, 0, 0, 1, 1,
0.5188929, 0.07649632, 1.885502, 1, 1, 1, 1, 1,
0.5204591, 0.6869994, 1.536065, 1, 1, 1, 1, 1,
0.5210228, 0.2961701, 1.420681, 1, 1, 1, 1, 1,
0.5266867, 0.7131215, 1.596929, 1, 1, 1, 1, 1,
0.5269753, 0.429847, 0.8978291, 1, 1, 1, 1, 1,
0.5276895, 0.6393299, 1.345775, 1, 1, 1, 1, 1,
0.5289755, 0.7776726, 3.175039, 1, 1, 1, 1, 1,
0.5297101, -0.06417333, 1.522971, 1, 1, 1, 1, 1,
0.5338137, -0.684054, 1.825703, 1, 1, 1, 1, 1,
0.5346331, 1.295622, 0.3348047, 1, 1, 1, 1, 1,
0.5477812, -0.1387238, 1.34588, 1, 1, 1, 1, 1,
0.5519532, -1.058564, 3.210586, 1, 1, 1, 1, 1,
0.555421, -0.3739634, 3.386236, 1, 1, 1, 1, 1,
0.5607226, 0.9589634, -1.838548, 1, 1, 1, 1, 1,
0.5607331, 0.6685013, 1.207327, 1, 1, 1, 1, 1,
0.562139, 0.617687, 1.77205, 0, 0, 1, 1, 1,
0.5654712, 0.8605586, -0.938853, 1, 0, 0, 1, 1,
0.5718839, -0.8657907, 2.037421, 1, 0, 0, 1, 1,
0.5732204, -1.423523, 2.542845, 1, 0, 0, 1, 1,
0.5817217, -1.601122, 3.243514, 1, 0, 0, 1, 1,
0.5860421, 0.9898691, 1.278359, 1, 0, 0, 1, 1,
0.5943075, -0.9325236, 3.044157, 0, 0, 0, 1, 1,
0.5968595, -1.14951, 1.721564, 0, 0, 0, 1, 1,
0.5975317, -0.4257203, 2.326836, 0, 0, 0, 1, 1,
0.6007761, -0.7859406, 3.575804, 0, 0, 0, 1, 1,
0.61551, 1.367364, -0.03836378, 0, 0, 0, 1, 1,
0.6189132, 0.8067232, 2.060018, 0, 0, 0, 1, 1,
0.6324762, -0.7700272, 3.157332, 0, 0, 0, 1, 1,
0.635956, -1.02403, 3.59754, 1, 1, 1, 1, 1,
0.6368402, 0.9868554, -0.02809415, 1, 1, 1, 1, 1,
0.6404725, 0.9209, 0.7678748, 1, 1, 1, 1, 1,
0.6425838, 0.5710561, -0.7052789, 1, 1, 1, 1, 1,
0.6428044, -1.485492, 3.210588, 1, 1, 1, 1, 1,
0.6458227, 1.534111, 1.001713, 1, 1, 1, 1, 1,
0.6493252, 0.6224477, 1.6729, 1, 1, 1, 1, 1,
0.6629933, 0.5386341, -1.436209, 1, 1, 1, 1, 1,
0.6655558, 0.2014053, 1.21292, 1, 1, 1, 1, 1,
0.6656376, 0.4030698, 0.6781724, 1, 1, 1, 1, 1,
0.6683637, -0.1197352, 1.35716, 1, 1, 1, 1, 1,
0.6684833, -0.1851519, 2.739489, 1, 1, 1, 1, 1,
0.6772028, -0.2338291, 2.263285, 1, 1, 1, 1, 1,
0.6806604, 0.6800431, 0.3206819, 1, 1, 1, 1, 1,
0.6815013, 0.2546375, 1.168996, 1, 1, 1, 1, 1,
0.6847713, -0.8805093, 1.895898, 0, 0, 1, 1, 1,
0.6850241, -0.02969106, 2.574385, 1, 0, 0, 1, 1,
0.685599, -0.07921473, 0.5236194, 1, 0, 0, 1, 1,
0.6887416, -1.064542, 2.71389, 1, 0, 0, 1, 1,
0.6897748, -0.5692661, 2.034605, 1, 0, 0, 1, 1,
0.6906018, -1.348265, 3.701416, 1, 0, 0, 1, 1,
0.702001, -0.6422259, 3.564672, 0, 0, 0, 1, 1,
0.7030671, 1.135907, 1.527005, 0, 0, 0, 1, 1,
0.7048871, 0.6591527, 0.6539825, 0, 0, 0, 1, 1,
0.705204, 0.25189, 1.079438, 0, 0, 0, 1, 1,
0.7077613, -0.473285, 4.407798, 0, 0, 0, 1, 1,
0.708494, -1.111373, 1.310924, 0, 0, 0, 1, 1,
0.7095649, 0.2391624, 0.07502161, 0, 0, 0, 1, 1,
0.7114854, -2.160642, 1.546877, 1, 1, 1, 1, 1,
0.7130028, 1.744395, 1.815504, 1, 1, 1, 1, 1,
0.7140256, 0.4311424, 0.8774849, 1, 1, 1, 1, 1,
0.7203945, -2.095275, 4.142972, 1, 1, 1, 1, 1,
0.7247943, -0.7130698, 3.091012, 1, 1, 1, 1, 1,
0.7346227, -0.1947558, 1.796374, 1, 1, 1, 1, 1,
0.7356074, -0.2750648, 2.084759, 1, 1, 1, 1, 1,
0.7429825, 0.7855244, 1.808375, 1, 1, 1, 1, 1,
0.7433444, -0.7151935, 0.9118822, 1, 1, 1, 1, 1,
0.7458774, -1.817729, 2.154633, 1, 1, 1, 1, 1,
0.7464591, 0.8923419, -0.3757349, 1, 1, 1, 1, 1,
0.7521943, -0.644099, 1.630574, 1, 1, 1, 1, 1,
0.7591555, -0.1449555, 0.632503, 1, 1, 1, 1, 1,
0.7615911, -0.2832573, 2.825952, 1, 1, 1, 1, 1,
0.7642822, -0.2218077, 1.091915, 1, 1, 1, 1, 1,
0.7646952, -0.8640672, 1.606979, 0, 0, 1, 1, 1,
0.7672595, -0.4414482, 2.510121, 1, 0, 0, 1, 1,
0.7686375, -2.116316, 2.527632, 1, 0, 0, 1, 1,
0.7703934, 0.7990751, -0.6785501, 1, 0, 0, 1, 1,
0.7738178, -0.9512781, 2.3202, 1, 0, 0, 1, 1,
0.780866, -0.9267659, 2.311205, 1, 0, 0, 1, 1,
0.7842728, -1.593024, 2.412801, 0, 0, 0, 1, 1,
0.7846384, 1.923024, -0.7987819, 0, 0, 0, 1, 1,
0.7861278, 0.2445454, 0.5533703, 0, 0, 0, 1, 1,
0.7873201, -1.159409, 2.834929, 0, 0, 0, 1, 1,
0.7928126, 0.7554115, -0.5984807, 0, 0, 0, 1, 1,
0.7934083, 1.179146, 2.223239, 0, 0, 0, 1, 1,
0.7962391, -0.6331849, 3.927371, 0, 0, 0, 1, 1,
0.8002383, 0.00494322, 2.642688, 1, 1, 1, 1, 1,
0.8015196, 0.7614416, 3.429547, 1, 1, 1, 1, 1,
0.8032495, -1.873674, 3.24429, 1, 1, 1, 1, 1,
0.8075727, -0.2466737, 2.037798, 1, 1, 1, 1, 1,
0.8091517, 0.08687741, 1.892413, 1, 1, 1, 1, 1,
0.8092479, -0.6824586, 1.398408, 1, 1, 1, 1, 1,
0.8103557, 0.5070739, 1.614329, 1, 1, 1, 1, 1,
0.8140707, -0.6034018, 2.053206, 1, 1, 1, 1, 1,
0.8164414, -1.539461, 2.489204, 1, 1, 1, 1, 1,
0.8211247, -0.3226323, 2.778333, 1, 1, 1, 1, 1,
0.8264161, -0.1450467, 1.757722, 1, 1, 1, 1, 1,
0.8324998, 0.2082133, 1.891962, 1, 1, 1, 1, 1,
0.83366, -0.7368603, 1.929293, 1, 1, 1, 1, 1,
0.8341423, 0.2344021, 1.761752, 1, 1, 1, 1, 1,
0.8348925, -1.176577, 0.966742, 1, 1, 1, 1, 1,
0.8394905, 0.3717115, 2.797736, 0, 0, 1, 1, 1,
0.8401339, 2.271149, 0.577101, 1, 0, 0, 1, 1,
0.8491371, 0.8935053, 3.226144, 1, 0, 0, 1, 1,
0.8495698, 0.4436373, 2.699969, 1, 0, 0, 1, 1,
0.8506731, -0.8312383, 2.565091, 1, 0, 0, 1, 1,
0.8528703, -1.324986, 0.8271343, 1, 0, 0, 1, 1,
0.8658106, 0.3454857, 1.662562, 0, 0, 0, 1, 1,
0.8659936, -0.4662878, 2.196109, 0, 0, 0, 1, 1,
0.867461, 1.142613, 1.428168, 0, 0, 0, 1, 1,
0.8696817, -1.097002, 3.099663, 0, 0, 0, 1, 1,
0.8699, 1.782407, 2.048218, 0, 0, 0, 1, 1,
0.8702495, 1.108842, -0.6801966, 0, 0, 0, 1, 1,
0.8734691, -0.8785962, 3.110947, 0, 0, 0, 1, 1,
0.87573, 1.35132, -0.1960424, 1, 1, 1, 1, 1,
0.8805015, 0.4253688, 1.232826, 1, 1, 1, 1, 1,
0.8832575, 0.6305282, 2.19909, 1, 1, 1, 1, 1,
0.8886679, 1.127173, 0.4610886, 1, 1, 1, 1, 1,
0.8902037, 1.465009, 0.9385429, 1, 1, 1, 1, 1,
0.9026971, -0.7708716, 2.236021, 1, 1, 1, 1, 1,
0.9055747, -0.5510821, 0.7537799, 1, 1, 1, 1, 1,
0.9084667, 1.04512, -0.2978922, 1, 1, 1, 1, 1,
0.9096779, -0.1845673, 1.90559, 1, 1, 1, 1, 1,
0.9114958, -1.004876, 3.652819, 1, 1, 1, 1, 1,
0.9153872, -0.8645107, 2.790976, 1, 1, 1, 1, 1,
0.9165169, -0.6225777, 2.703855, 1, 1, 1, 1, 1,
0.9192592, -1.454685, 1.504821, 1, 1, 1, 1, 1,
0.9228287, 0.373716, 0.9238566, 1, 1, 1, 1, 1,
0.9244831, 0.9864639, 0.3693131, 1, 1, 1, 1, 1,
0.9253059, 1.000413, 0.4818952, 0, 0, 1, 1, 1,
0.9265347, 0.3471471, 0.6939969, 1, 0, 0, 1, 1,
0.9265623, 2.11326, 0.4178416, 1, 0, 0, 1, 1,
0.9266551, -0.6652916, 0.6442299, 1, 0, 0, 1, 1,
0.9380562, 0.5128914, 2.952593, 1, 0, 0, 1, 1,
0.9398777, -0.7875823, 2.86294, 1, 0, 0, 1, 1,
0.9483128, 0.8172112, -1.295168, 0, 0, 0, 1, 1,
0.952308, -0.7333071, 1.928571, 0, 0, 0, 1, 1,
0.9557258, 1.264553, 0.7107819, 0, 0, 0, 1, 1,
0.9563653, -1.119378, 3.062317, 0, 0, 0, 1, 1,
0.9635701, -0.2066031, 2.250025, 0, 0, 0, 1, 1,
0.9699982, 1.254259, 1.002401, 0, 0, 0, 1, 1,
0.97131, 0.26837, 0.7757724, 0, 0, 0, 1, 1,
0.9962808, -0.7084768, 3.187366, 1, 1, 1, 1, 1,
0.9974685, -0.3860132, 2.986445, 1, 1, 1, 1, 1,
1.003839, 0.08690388, 1.508426, 1, 1, 1, 1, 1,
1.00773, 0.4075379, 1.975262, 1, 1, 1, 1, 1,
1.008243, -1.669368, 3.7211, 1, 1, 1, 1, 1,
1.009539, 0.6329898, 1.989296, 1, 1, 1, 1, 1,
1.010412, -0.0435914, 0.7709523, 1, 1, 1, 1, 1,
1.011616, -0.727204, 2.064941, 1, 1, 1, 1, 1,
1.013657, -0.7671844, 1.584204, 1, 1, 1, 1, 1,
1.018812, 0.5486147, 1.135642, 1, 1, 1, 1, 1,
1.019773, 1.060848, 1.643619, 1, 1, 1, 1, 1,
1.036897, 0.4976132, 0.9804602, 1, 1, 1, 1, 1,
1.037371, -1.392397, 2.332633, 1, 1, 1, 1, 1,
1.041591, -1.153418, 2.800544, 1, 1, 1, 1, 1,
1.043978, 0.2485818, 2.301943, 1, 1, 1, 1, 1,
1.047191, -0.961611, 0.2113041, 0, 0, 1, 1, 1,
1.047676, -2.529702, 3.536884, 1, 0, 0, 1, 1,
1.05188, 0.7350566, 1.252521, 1, 0, 0, 1, 1,
1.052289, 1.100403, -0.2747371, 1, 0, 0, 1, 1,
1.056173, -1.39398, 3.770794, 1, 0, 0, 1, 1,
1.058759, 0.915173, 0.2260696, 1, 0, 0, 1, 1,
1.066246, 1.259972, -2.628699, 0, 0, 0, 1, 1,
1.089515, 1.120894, -0.107199, 0, 0, 0, 1, 1,
1.09829, -1.36496, 1.36484, 0, 0, 0, 1, 1,
1.101533, -0.06673916, 0.7590244, 0, 0, 0, 1, 1,
1.101551, 1.718715, 0.4740284, 0, 0, 0, 1, 1,
1.107283, 1.476585, 2.218074, 0, 0, 0, 1, 1,
1.12839, -0.5377808, 3.516484, 0, 0, 0, 1, 1,
1.135539, -1.796548, 2.141173, 1, 1, 1, 1, 1,
1.142976, -1.494435, 3.19522, 1, 1, 1, 1, 1,
1.146421, -0.3905903, 0.866096, 1, 1, 1, 1, 1,
1.146825, -0.4495952, 2.973465, 1, 1, 1, 1, 1,
1.147435, 0.467685, 0.03194382, 1, 1, 1, 1, 1,
1.147599, 0.6247009, 0.4431631, 1, 1, 1, 1, 1,
1.156496, -0.3360201, 1.572625, 1, 1, 1, 1, 1,
1.157669, -0.2502767, 3.425849, 1, 1, 1, 1, 1,
1.166585, 0.7153399, -0.5484523, 1, 1, 1, 1, 1,
1.170809, -0.5193868, 1.837004, 1, 1, 1, 1, 1,
1.17855, -0.8620498, 1.137626, 1, 1, 1, 1, 1,
1.184587, 0.7572326, -0.6237034, 1, 1, 1, 1, 1,
1.189286, 1.047015, 1.793971, 1, 1, 1, 1, 1,
1.194139, 0.418536, 1.010823, 1, 1, 1, 1, 1,
1.19426, 1.68252, 0.2069711, 1, 1, 1, 1, 1,
1.196203, -0.4299985, 0.9268315, 0, 0, 1, 1, 1,
1.196675, 0.4383184, 0.1431868, 1, 0, 0, 1, 1,
1.212096, -1.407788, 1.993573, 1, 0, 0, 1, 1,
1.213023, -0.8379134, 2.516298, 1, 0, 0, 1, 1,
1.214326, 0.4887575, 2.199007, 1, 0, 0, 1, 1,
1.218925, -0.02550282, 1.691325, 1, 0, 0, 1, 1,
1.221347, -1.671541, 1.913764, 0, 0, 0, 1, 1,
1.226828, 1.842489, 1.616837, 0, 0, 0, 1, 1,
1.227693, -0.3731421, 2.79849, 0, 0, 0, 1, 1,
1.233451, -1.196613, 2.803697, 0, 0, 0, 1, 1,
1.234918, -0.5956978, 2.224432, 0, 0, 0, 1, 1,
1.238065, -0.2603716, 1.552368, 0, 0, 0, 1, 1,
1.239704, 0.5163304, 0.5892012, 0, 0, 0, 1, 1,
1.251012, -0.7723885, 1.303468, 1, 1, 1, 1, 1,
1.260457, 0.1258229, 0.5590723, 1, 1, 1, 1, 1,
1.262125, 0.4376225, 1.487622, 1, 1, 1, 1, 1,
1.262663, 2.434219, 1.131054, 1, 1, 1, 1, 1,
1.264814, -0.8744991, 3.76822, 1, 1, 1, 1, 1,
1.279255, 0.342288, 0.5671151, 1, 1, 1, 1, 1,
1.281032, 1.369958, 3.249643, 1, 1, 1, 1, 1,
1.291996, 0.0617198, 1.596912, 1, 1, 1, 1, 1,
1.294847, -0.3491734, 1.048262, 1, 1, 1, 1, 1,
1.300581, 0.222414, 3.763629, 1, 1, 1, 1, 1,
1.313138, 0.05645307, 0.90189, 1, 1, 1, 1, 1,
1.334993, -0.2467525, 1.132462, 1, 1, 1, 1, 1,
1.336727, 1.153354, 1.039194, 1, 1, 1, 1, 1,
1.358422, -1.006532, 2.324834, 1, 1, 1, 1, 1,
1.368129, 2.772888, -0.002366713, 1, 1, 1, 1, 1,
1.369846, -0.9596907, 2.73576, 0, 0, 1, 1, 1,
1.380308, 0.5557986, 1.671285, 1, 0, 0, 1, 1,
1.400394, -1.357707, 3.127145, 1, 0, 0, 1, 1,
1.425315, -1.462315, 1.509882, 1, 0, 0, 1, 1,
1.440605, -1.40515, 0.9862446, 1, 0, 0, 1, 1,
1.442419, 0.3600883, 0.6853928, 1, 0, 0, 1, 1,
1.452994, -0.3843609, -0.3277272, 0, 0, 0, 1, 1,
1.454035, 3.154374, 1.480331, 0, 0, 0, 1, 1,
1.457218, 0.951038, 2.944567, 0, 0, 0, 1, 1,
1.463797, 0.2467539, 0.3664902, 0, 0, 0, 1, 1,
1.470525, 1.410574, 1.512154, 0, 0, 0, 1, 1,
1.471867, 0.5939624, -0.3010147, 0, 0, 0, 1, 1,
1.47402, -0.5392859, 2.812965, 0, 0, 0, 1, 1,
1.478982, -0.6175032, 1.447029, 1, 1, 1, 1, 1,
1.493654, 1.437889, 0.293913, 1, 1, 1, 1, 1,
1.496869, 0.09626066, 2.228817, 1, 1, 1, 1, 1,
1.503657, -0.1909906, 2.541687, 1, 1, 1, 1, 1,
1.512489, 2.20328, 1.149215, 1, 1, 1, 1, 1,
1.518794, 0.1919343, 1.834015, 1, 1, 1, 1, 1,
1.521657, -1.43234, 1.791885, 1, 1, 1, 1, 1,
1.533651, -0.2121503, 1.676553, 1, 1, 1, 1, 1,
1.536818, -0.3176868, 2.993896, 1, 1, 1, 1, 1,
1.538767, -2.165043, 2.042304, 1, 1, 1, 1, 1,
1.543633, 1.169409, 1.906018, 1, 1, 1, 1, 1,
1.552875, -0.694062, 1.59912, 1, 1, 1, 1, 1,
1.566993, -0.8826911, 2.801778, 1, 1, 1, 1, 1,
1.57662, 1.924554, 0.9741583, 1, 1, 1, 1, 1,
1.580917, 0.1810657, 3.512726, 1, 1, 1, 1, 1,
1.581141, 0.2948565, -0.2260357, 0, 0, 1, 1, 1,
1.586589, 2.189602, -1.103414, 1, 0, 0, 1, 1,
1.595043, -0.3751757, 0.9809641, 1, 0, 0, 1, 1,
1.630254, -0.02671537, 3.256114, 1, 0, 0, 1, 1,
1.633078, 0.2862164, 4.017919, 1, 0, 0, 1, 1,
1.63372, 0.318699, 1.840633, 1, 0, 0, 1, 1,
1.641837, 0.721638, 0.165464, 0, 0, 0, 1, 1,
1.646531, 0.9102681, 1.661819, 0, 0, 0, 1, 1,
1.677812, -0.3909426, 1.598881, 0, 0, 0, 1, 1,
1.681273, -0.2293038, 1.60385, 0, 0, 0, 1, 1,
1.700369, 0.8777213, -0.2333684, 0, 0, 0, 1, 1,
1.721123, 1.371132, 0.9164434, 0, 0, 0, 1, 1,
1.732702, -0.09969527, 0.6172891, 0, 0, 0, 1, 1,
1.746668, 1.225018, 0.6931877, 1, 1, 1, 1, 1,
1.750311, -0.5889503, 2.475682, 1, 1, 1, 1, 1,
1.751248, 1.263281, 0.3670643, 1, 1, 1, 1, 1,
1.752812, -0.105626, 2.931017, 1, 1, 1, 1, 1,
1.7709, 0.03994897, 0.323202, 1, 1, 1, 1, 1,
1.78931, -1.628916, 3.684564, 1, 1, 1, 1, 1,
1.7947, 0.151088, 2.398102, 1, 1, 1, 1, 1,
1.803073, -1.821664, 3.769878, 1, 1, 1, 1, 1,
1.864782, 0.184867, 1.549012, 1, 1, 1, 1, 1,
1.867874, -1.744499, 2.372157, 1, 1, 1, 1, 1,
1.884935, 0.9078303, 0.3325455, 1, 1, 1, 1, 1,
1.913374, -0.729724, 1.458841, 1, 1, 1, 1, 1,
1.935381, 0.7012146, 0.5956591, 1, 1, 1, 1, 1,
2.006078, 1.624357, 0.838615, 1, 1, 1, 1, 1,
2.019118, -1.862754, 3.205218, 1, 1, 1, 1, 1,
2.025172, -0.01682153, 1.825659, 0, 0, 1, 1, 1,
2.026938, 0.6516199, 1.722482, 1, 0, 0, 1, 1,
2.027347, -0.9086952, 0.04132343, 1, 0, 0, 1, 1,
2.041213, -0.2063725, 1.580868, 1, 0, 0, 1, 1,
2.04522, -1.459009, 1.425808, 1, 0, 0, 1, 1,
2.097314, 0.5882333, 2.792706, 1, 0, 0, 1, 1,
2.121607, -2.412908, 2.937926, 0, 0, 0, 1, 1,
2.14021, 1.176715, -0.8232978, 0, 0, 0, 1, 1,
2.154616, 0.6927398, 0.9475281, 0, 0, 0, 1, 1,
2.171251, -0.119118, 1.645, 0, 0, 0, 1, 1,
2.243978, -0.2757059, 2.899914, 0, 0, 0, 1, 1,
2.349373, 0.401597, 1.317927, 0, 0, 0, 1, 1,
2.506203, 0.2722317, -0.268255, 0, 0, 0, 1, 1,
2.525421, 0.567525, -0.2194476, 1, 1, 1, 1, 1,
2.566563, -0.3066507, 2.019441, 1, 1, 1, 1, 1,
2.622838, 0.2082478, 1.947875, 1, 1, 1, 1, 1,
2.660152, 0.2992843, 0.6602758, 1, 1, 1, 1, 1,
2.747637, -0.5863846, 3.306828, 1, 1, 1, 1, 1,
2.855838, 0.6682522, 1.390932, 1, 1, 1, 1, 1,
2.856311, 0.648074, 1.8241, 1, 1, 1, 1, 1
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
var radius = 9.781363;
var distance = 34.35662;
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
mvMatrix.translate( 0.2302231, -0.1738968, 0.171562 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.35662);
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
