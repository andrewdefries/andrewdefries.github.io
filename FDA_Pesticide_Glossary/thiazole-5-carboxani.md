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
-2.889994, 0.7542146, -2.547181, 1, 0, 0, 1,
-2.879854, -0.7799516, -3.652766, 1, 0.007843138, 0, 1,
-2.844058, -0.8168249, -2.710382, 1, 0.01176471, 0, 1,
-2.54686, -0.4504378, -0.8701591, 1, 0.01960784, 0, 1,
-2.537566, -0.09227546, -0.8925112, 1, 0.02352941, 0, 1,
-2.535604, 0.1610528, -1.113755, 1, 0.03137255, 0, 1,
-2.494404, 0.7124453, -0.5204134, 1, 0.03529412, 0, 1,
-2.463902, -1.460776, -1.447327, 1, 0.04313726, 0, 1,
-2.405181, -0.4790968, -1.993093, 1, 0.04705882, 0, 1,
-2.376966, 0.7955217, -1.814166, 1, 0.05490196, 0, 1,
-2.366371, 0.4127678, -1.530576, 1, 0.05882353, 0, 1,
-2.315619, 0.1368386, -1.922505, 1, 0.06666667, 0, 1,
-2.297595, 0.8812441, -0.3489719, 1, 0.07058824, 0, 1,
-2.200089, 0.1984641, 0.09751367, 1, 0.07843138, 0, 1,
-2.166459, -0.3285675, -0.8752401, 1, 0.08235294, 0, 1,
-2.153733, 0.9444783, 0.02218712, 1, 0.09019608, 0, 1,
-2.097897, 1.155564, -0.5115437, 1, 0.09411765, 0, 1,
-2.076056, -0.5873109, -0.9825071, 1, 0.1019608, 0, 1,
-2.058477, -1.276133, -0.5351533, 1, 0.1098039, 0, 1,
-2.049438, 0.7526892, -1.731453, 1, 0.1137255, 0, 1,
-2.020088, -0.3114373, -2.252523, 1, 0.1215686, 0, 1,
-2.00747, 1.566801, -0.5736505, 1, 0.1254902, 0, 1,
-1.98301, -1.579814, -2.570357, 1, 0.1333333, 0, 1,
-1.893403, -0.07316949, -1.290031, 1, 0.1372549, 0, 1,
-1.875564, 0.88875, -0.6814113, 1, 0.145098, 0, 1,
-1.84818, -1.982897, -1.974932, 1, 0.1490196, 0, 1,
-1.812545, 0.4707972, -2.379036, 1, 0.1568628, 0, 1,
-1.805542, -0.6301408, 0.1703231, 1, 0.1607843, 0, 1,
-1.788096, -0.3503905, -4.326003, 1, 0.1686275, 0, 1,
-1.77015, -0.3115943, -2.197661, 1, 0.172549, 0, 1,
-1.762567, -1.406859, -2.367643, 1, 0.1803922, 0, 1,
-1.761923, -0.5165213, -0.7049702, 1, 0.1843137, 0, 1,
-1.760091, 1.407235, 0.6057051, 1, 0.1921569, 0, 1,
-1.756875, -0.002874897, 0.1391229, 1, 0.1960784, 0, 1,
-1.754403, 1.645151, -0.9926964, 1, 0.2039216, 0, 1,
-1.748585, 1.203195, -1.374928, 1, 0.2117647, 0, 1,
-1.739844, -0.07747565, -1.283134, 1, 0.2156863, 0, 1,
-1.738775, 1.088353, -0.05336715, 1, 0.2235294, 0, 1,
-1.730014, 1.94232, -1.082986, 1, 0.227451, 0, 1,
-1.726646, -0.5033438, -1.650907, 1, 0.2352941, 0, 1,
-1.714401, 0.8851206, -0.4745241, 1, 0.2392157, 0, 1,
-1.688781, -0.0554243, 1.229351, 1, 0.2470588, 0, 1,
-1.686069, -0.08076957, -3.137979, 1, 0.2509804, 0, 1,
-1.675704, 0.28501, -1.246389, 1, 0.2588235, 0, 1,
-1.664341, -1.549233, -1.533372, 1, 0.2627451, 0, 1,
-1.646606, -1.531746, -2.526362, 1, 0.2705882, 0, 1,
-1.640834, 0.4326739, -0.349064, 1, 0.2745098, 0, 1,
-1.637727, -1.295962, -4.22761, 1, 0.282353, 0, 1,
-1.635004, 1.681947, -0.4686043, 1, 0.2862745, 0, 1,
-1.628839, 1.20637, -0.7405676, 1, 0.2941177, 0, 1,
-1.61559, 1.612473, -1.378615, 1, 0.3019608, 0, 1,
-1.571249, -1.806213, -2.277648, 1, 0.3058824, 0, 1,
-1.560125, 1.456814, -2.854457, 1, 0.3137255, 0, 1,
-1.548559, -1.925639, -3.330819, 1, 0.3176471, 0, 1,
-1.547346, -1.034479, -3.369053, 1, 0.3254902, 0, 1,
-1.544367, 0.5200676, -2.365917, 1, 0.3294118, 0, 1,
-1.543765, 2.418563, 0.362177, 1, 0.3372549, 0, 1,
-1.53651, -0.9194683, -1.998482, 1, 0.3411765, 0, 1,
-1.531302, 0.2098042, -0.7999325, 1, 0.3490196, 0, 1,
-1.500877, -0.8240054, -1.396436, 1, 0.3529412, 0, 1,
-1.498724, -0.166821, -2.006489, 1, 0.3607843, 0, 1,
-1.496258, 0.02574098, -1.443791, 1, 0.3647059, 0, 1,
-1.494835, -0.6561846, -2.226344, 1, 0.372549, 0, 1,
-1.478529, 0.03653758, -2.715212, 1, 0.3764706, 0, 1,
-1.466937, -0.8281372, -2.51979, 1, 0.3843137, 0, 1,
-1.455269, -1.363729, -3.536564, 1, 0.3882353, 0, 1,
-1.446246, 0.7188551, -2.412728, 1, 0.3960784, 0, 1,
-1.444465, 0.05446292, -1.700721, 1, 0.4039216, 0, 1,
-1.441908, 2.083244, -0.624109, 1, 0.4078431, 0, 1,
-1.432284, -0.08534361, -3.888044, 1, 0.4156863, 0, 1,
-1.418558, -0.5964192, -0.6233542, 1, 0.4196078, 0, 1,
-1.400482, -1.366503, -3.961335, 1, 0.427451, 0, 1,
-1.388531, 1.707172, -1.40811, 1, 0.4313726, 0, 1,
-1.387553, -0.4862747, -0.8596286, 1, 0.4392157, 0, 1,
-1.383693, 0.3444054, -0.2919883, 1, 0.4431373, 0, 1,
-1.383137, -0.331871, -1.27376, 1, 0.4509804, 0, 1,
-1.366848, -0.1276698, -2.385517, 1, 0.454902, 0, 1,
-1.366699, 0.2112709, -1.085349, 1, 0.4627451, 0, 1,
-1.364168, -0.1998737, -2.137957, 1, 0.4666667, 0, 1,
-1.361977, 1.248593, -0.7415092, 1, 0.4745098, 0, 1,
-1.359072, -0.249192, -1.489004, 1, 0.4784314, 0, 1,
-1.341881, -0.4477648, -2.296695, 1, 0.4862745, 0, 1,
-1.341165, -0.354647, -2.99338, 1, 0.4901961, 0, 1,
-1.339395, -0.301955, -1.589524, 1, 0.4980392, 0, 1,
-1.330598, 1.513636, -0.4690087, 1, 0.5058824, 0, 1,
-1.32751, 0.881492, -2.16276, 1, 0.509804, 0, 1,
-1.310256, 0.01786961, -2.60026, 1, 0.5176471, 0, 1,
-1.307969, 0.2059383, -0.3896577, 1, 0.5215687, 0, 1,
-1.304379, -1.82662, -2.245093, 1, 0.5294118, 0, 1,
-1.301106, 0.814945, -0.2853733, 1, 0.5333334, 0, 1,
-1.290679, 2.146822, -0.1095552, 1, 0.5411765, 0, 1,
-1.290225, -0.9956128, -4.119297, 1, 0.5450981, 0, 1,
-1.288401, -0.1416218, -2.382611, 1, 0.5529412, 0, 1,
-1.274372, 0.6304697, -2.243932, 1, 0.5568628, 0, 1,
-1.252082, -0.1432769, -1.42042, 1, 0.5647059, 0, 1,
-1.251759, -0.9017516, -2.75782, 1, 0.5686275, 0, 1,
-1.248986, -1.365743, -2.566974, 1, 0.5764706, 0, 1,
-1.248709, -0.09811724, -2.248603, 1, 0.5803922, 0, 1,
-1.247836, -1.654636, -3.005719, 1, 0.5882353, 0, 1,
-1.247735, 0.428641, 1.292948, 1, 0.5921569, 0, 1,
-1.245773, 0.7193632, -1.321934, 1, 0.6, 0, 1,
-1.239439, 0.926116, -1.096357, 1, 0.6078432, 0, 1,
-1.239078, -0.02607034, -3.047935, 1, 0.6117647, 0, 1,
-1.235735, 1.176467, 0.4143147, 1, 0.6196079, 0, 1,
-1.223468, 1.121497, -0.4911861, 1, 0.6235294, 0, 1,
-1.217123, -0.6256979, -2.192419, 1, 0.6313726, 0, 1,
-1.216599, 0.01085128, -0.3087455, 1, 0.6352941, 0, 1,
-1.215518, 1.818022, 0.6766153, 1, 0.6431373, 0, 1,
-1.214449, 0.5006808, -2.130299, 1, 0.6470588, 0, 1,
-1.194569, -0.6136746, -1.787064, 1, 0.654902, 0, 1,
-1.193665, 0.03836367, -1.411868, 1, 0.6588235, 0, 1,
-1.191698, -0.8905723, -3.625529, 1, 0.6666667, 0, 1,
-1.184566, 0.5683749, -2.90128, 1, 0.6705883, 0, 1,
-1.181525, -0.3183912, -0.8893946, 1, 0.6784314, 0, 1,
-1.175666, 0.9296769, -0.2564672, 1, 0.682353, 0, 1,
-1.174718, 1.677334, -0.4944502, 1, 0.6901961, 0, 1,
-1.154809, -2.240959, -2.217737, 1, 0.6941177, 0, 1,
-1.153029, 0.6040324, 0.8113188, 1, 0.7019608, 0, 1,
-1.152502, 0.9452304, -1.330955, 1, 0.7098039, 0, 1,
-1.151712, -0.1889389, -0.6414592, 1, 0.7137255, 0, 1,
-1.141835, 1.219234, -1.577681, 1, 0.7215686, 0, 1,
-1.136537, 0.9036765, -2.089482, 1, 0.7254902, 0, 1,
-1.13386, 1.281244, -1.181111, 1, 0.7333333, 0, 1,
-1.130414, -0.1418345, -1.493243, 1, 0.7372549, 0, 1,
-1.128167, -1.133105, -2.486575, 1, 0.7450981, 0, 1,
-1.126201, 0.2507904, -0.9284689, 1, 0.7490196, 0, 1,
-1.12485, -1.75146, -3.582473, 1, 0.7568628, 0, 1,
-1.123066, -0.2683685, -1.271081, 1, 0.7607843, 0, 1,
-1.122154, 1.240648, -1.630202, 1, 0.7686275, 0, 1,
-1.120986, 0.3429281, -2.267803, 1, 0.772549, 0, 1,
-1.120685, 1.113993, -0.06123719, 1, 0.7803922, 0, 1,
-1.120309, -0.6496108, -2.749977, 1, 0.7843137, 0, 1,
-1.1117, 1.182007, -1.150218, 1, 0.7921569, 0, 1,
-1.110592, -0.3580164, -1.357515, 1, 0.7960784, 0, 1,
-1.110452, 0.2043929, -2.18368, 1, 0.8039216, 0, 1,
-1.10704, 0.08652411, -1.227422, 1, 0.8117647, 0, 1,
-1.09674, 2.335295, -0.8136918, 1, 0.8156863, 0, 1,
-1.096291, 0.3658475, -1.938998, 1, 0.8235294, 0, 1,
-1.092065, 1.585168, -1.626194, 1, 0.827451, 0, 1,
-1.088945, 1.30302, 0.3271448, 1, 0.8352941, 0, 1,
-1.083148, -0.6747609, -0.8827269, 1, 0.8392157, 0, 1,
-1.077095, -0.08203671, -1.59883, 1, 0.8470588, 0, 1,
-1.074606, -1.29065, -2.845795, 1, 0.8509804, 0, 1,
-1.071062, -1.453277, -3.303227, 1, 0.8588235, 0, 1,
-1.065215, -0.1707224, -1.897647, 1, 0.8627451, 0, 1,
-1.063673, -1.344223, -3.079786, 1, 0.8705882, 0, 1,
-1.063252, -1.377491, -2.616837, 1, 0.8745098, 0, 1,
-1.061566, -0.362623, -1.956553, 1, 0.8823529, 0, 1,
-1.058485, -2.07728, -3.154951, 1, 0.8862745, 0, 1,
-1.058105, 0.5076175, -2.398989, 1, 0.8941177, 0, 1,
-1.057662, -0.1928656, -2.637625, 1, 0.8980392, 0, 1,
-1.056422, -0.1699346, 0.02241409, 1, 0.9058824, 0, 1,
-1.052737, -0.8133439, -1.747813, 1, 0.9137255, 0, 1,
-1.052216, -1.433645, -3.129585, 1, 0.9176471, 0, 1,
-1.043794, 1.020885, -0.9532623, 1, 0.9254902, 0, 1,
-1.040459, -0.2578849, -1.537935, 1, 0.9294118, 0, 1,
-1.034004, -0.155668, -1.151547, 1, 0.9372549, 0, 1,
-1.031449, 0.1861006, -3.484041, 1, 0.9411765, 0, 1,
-1.020047, -0.4100182, -1.349156, 1, 0.9490196, 0, 1,
-1.018978, -0.3100157, 0.1713615, 1, 0.9529412, 0, 1,
-1.014192, 0.1693167, -2.272178, 1, 0.9607843, 0, 1,
-1.008725, -1.567083, -1.969925, 1, 0.9647059, 0, 1,
-1.004987, 1.133317, -0.09220801, 1, 0.972549, 0, 1,
-1.002448, -0.506459, -2.473951, 1, 0.9764706, 0, 1,
-1.00154, -1.014252, -1.354799, 1, 0.9843137, 0, 1,
-0.9881026, 2.256502, -0.1096383, 1, 0.9882353, 0, 1,
-0.9758332, -1.621715, -2.97636, 1, 0.9960784, 0, 1,
-0.9730377, -0.2281711, -2.108403, 0.9960784, 1, 0, 1,
-0.9617684, 1.602559, 0.6366329, 0.9921569, 1, 0, 1,
-0.9569418, -1.685372, -2.222095, 0.9843137, 1, 0, 1,
-0.9565157, -0.7638978, -2.76307, 0.9803922, 1, 0, 1,
-0.9496145, -0.5585632, -1.76309, 0.972549, 1, 0, 1,
-0.9480065, 0.01500361, -2.356393, 0.9686275, 1, 0, 1,
-0.9477736, -0.5055444, -0.4019037, 0.9607843, 1, 0, 1,
-0.9432104, -1.488763, -2.018416, 0.9568627, 1, 0, 1,
-0.9430287, -0.9532697, -1.231299, 0.9490196, 1, 0, 1,
-0.922201, 1.328581, -1.843108, 0.945098, 1, 0, 1,
-0.9148635, -0.4947133, -2.682322, 0.9372549, 1, 0, 1,
-0.9134701, 0.3599818, -1.471022, 0.9333333, 1, 0, 1,
-0.9116504, -0.9007465, -2.867615, 0.9254902, 1, 0, 1,
-0.9114252, -0.4159345, -1.592049, 0.9215686, 1, 0, 1,
-0.9094466, 0.08837378, -0.05497221, 0.9137255, 1, 0, 1,
-0.9086962, -0.35988, -3.106081, 0.9098039, 1, 0, 1,
-0.9041126, -0.2946493, -1.114085, 0.9019608, 1, 0, 1,
-0.8958684, -1.1129, -2.13077, 0.8941177, 1, 0, 1,
-0.8933613, -0.7002418, -2.63203, 0.8901961, 1, 0, 1,
-0.8918267, -0.1708786, -3.685755, 0.8823529, 1, 0, 1,
-0.8832053, 1.14083, -0.8803657, 0.8784314, 1, 0, 1,
-0.8792447, -0.5961068, -1.828175, 0.8705882, 1, 0, 1,
-0.8707966, 0.1984312, -3.068006, 0.8666667, 1, 0, 1,
-0.8636184, -0.8703858, -3.136508, 0.8588235, 1, 0, 1,
-0.8585328, 1.193541, -0.3682314, 0.854902, 1, 0, 1,
-0.8558509, 0.9790353, -3.128747, 0.8470588, 1, 0, 1,
-0.8466251, -1.321175, -0.5381464, 0.8431373, 1, 0, 1,
-0.8349992, -0.2858127, -1.199806, 0.8352941, 1, 0, 1,
-0.8303933, 1.144835, 0.4690183, 0.8313726, 1, 0, 1,
-0.8268872, -0.2682705, -2.181081, 0.8235294, 1, 0, 1,
-0.8229026, -1.274941, -1.90172, 0.8196079, 1, 0, 1,
-0.821165, -1.159698, -3.710909, 0.8117647, 1, 0, 1,
-0.8122239, -2.137732, -2.654713, 0.8078431, 1, 0, 1,
-0.81221, -0.8241354, -2.260605, 0.8, 1, 0, 1,
-0.8111237, 0.02740958, -0.3971669, 0.7921569, 1, 0, 1,
-0.8062045, 0.4325079, -1.120329, 0.7882353, 1, 0, 1,
-0.8050383, -0.6719823, -1.896527, 0.7803922, 1, 0, 1,
-0.7999826, 0.7826409, -0.3437466, 0.7764706, 1, 0, 1,
-0.7959867, -0.3522694, -0.1577642, 0.7686275, 1, 0, 1,
-0.7822778, -1.063754, -2.390623, 0.7647059, 1, 0, 1,
-0.7806576, 1.007429, -0.746156, 0.7568628, 1, 0, 1,
-0.7804053, -0.04088851, -1.193415, 0.7529412, 1, 0, 1,
-0.778885, 0.9028619, -0.8622318, 0.7450981, 1, 0, 1,
-0.7780806, 0.01723574, -1.203542, 0.7411765, 1, 0, 1,
-0.7693556, -0.7191373, -1.168592, 0.7333333, 1, 0, 1,
-0.7687317, 0.06504253, -1.434766, 0.7294118, 1, 0, 1,
-0.7667752, -0.09450058, -1.81855, 0.7215686, 1, 0, 1,
-0.7577671, -1.607103, -4.009367, 0.7176471, 1, 0, 1,
-0.7550591, 0.2961779, -1.043238, 0.7098039, 1, 0, 1,
-0.751646, -0.09851898, -4.025787, 0.7058824, 1, 0, 1,
-0.7434962, 0.6231111, -2.434708, 0.6980392, 1, 0, 1,
-0.7418239, -1.046794, -1.80215, 0.6901961, 1, 0, 1,
-0.7374486, -0.08311445, -4.047842, 0.6862745, 1, 0, 1,
-0.7373297, -0.3198198, -2.550465, 0.6784314, 1, 0, 1,
-0.7365306, 0.810838, -1.941526, 0.6745098, 1, 0, 1,
-0.7307161, -0.4874151, -4.036819, 0.6666667, 1, 0, 1,
-0.728949, -0.05697468, -2.149835, 0.6627451, 1, 0, 1,
-0.7249864, -0.9459554, -2.4131, 0.654902, 1, 0, 1,
-0.7177135, -0.1844503, -1.740162, 0.6509804, 1, 0, 1,
-0.7158854, -0.5894097, -2.204967, 0.6431373, 1, 0, 1,
-0.7147267, 1.398333, 0.01013558, 0.6392157, 1, 0, 1,
-0.7051376, -1.682541, -3.545721, 0.6313726, 1, 0, 1,
-0.6988564, -0.2960691, -2.049531, 0.627451, 1, 0, 1,
-0.6972245, -0.4371576, -1.450623, 0.6196079, 1, 0, 1,
-0.6902843, -1.634775, -0.5906671, 0.6156863, 1, 0, 1,
-0.6868534, -0.5193956, -2.254368, 0.6078432, 1, 0, 1,
-0.6868125, 0.1531476, -2.071552, 0.6039216, 1, 0, 1,
-0.6853226, 2.076351, 0.2067484, 0.5960785, 1, 0, 1,
-0.679774, -0.1530878, -1.896393, 0.5882353, 1, 0, 1,
-0.6796853, 0.3351744, -0.6023787, 0.5843138, 1, 0, 1,
-0.6747683, 0.6204021, -0.5827115, 0.5764706, 1, 0, 1,
-0.6723416, -0.06966283, -4.143038, 0.572549, 1, 0, 1,
-0.667028, -0.4565018, -4.090294, 0.5647059, 1, 0, 1,
-0.6661504, -0.04541356, -2.672169, 0.5607843, 1, 0, 1,
-0.6508273, 0.2893468, -1.073507, 0.5529412, 1, 0, 1,
-0.645426, -0.766115, -3.092537, 0.5490196, 1, 0, 1,
-0.6442894, 0.01532513, -1.546439, 0.5411765, 1, 0, 1,
-0.6419154, 0.2869449, -2.49571, 0.5372549, 1, 0, 1,
-0.636808, -2.322066, -4.269825, 0.5294118, 1, 0, 1,
-0.6340916, -1.162136, -3.619059, 0.5254902, 1, 0, 1,
-0.6327214, 1.999078, 0.307763, 0.5176471, 1, 0, 1,
-0.6274742, 0.6851107, 0.3812735, 0.5137255, 1, 0, 1,
-0.623402, -0.4636109, -4.394622, 0.5058824, 1, 0, 1,
-0.6227068, 0.08232332, -3.330863, 0.5019608, 1, 0, 1,
-0.6196737, 1.73184, -1.162417, 0.4941176, 1, 0, 1,
-0.6183126, -1.987757, -1.540671, 0.4862745, 1, 0, 1,
-0.61672, 1.105833, -1.857666, 0.4823529, 1, 0, 1,
-0.6138723, -2.26173, -1.437082, 0.4745098, 1, 0, 1,
-0.6109235, -0.2431194, -4.598299, 0.4705882, 1, 0, 1,
-0.6058131, 0.7494642, -0.7647817, 0.4627451, 1, 0, 1,
-0.604993, -0.1746028, -2.298651, 0.4588235, 1, 0, 1,
-0.6022331, 0.07731338, -0.1436207, 0.4509804, 1, 0, 1,
-0.5987763, -1.696608, -4.300456, 0.4470588, 1, 0, 1,
-0.5968114, -0.56999, -1.884709, 0.4392157, 1, 0, 1,
-0.5869751, 0.2688971, 1.01369, 0.4352941, 1, 0, 1,
-0.5859591, -0.5608586, -2.307439, 0.427451, 1, 0, 1,
-0.584524, -1.229113, -0.8515872, 0.4235294, 1, 0, 1,
-0.5820023, -0.1908625, 0.7374987, 0.4156863, 1, 0, 1,
-0.5773184, 1.614528, 0.3699757, 0.4117647, 1, 0, 1,
-0.577163, -0.1938314, -1.344555, 0.4039216, 1, 0, 1,
-0.5766417, -1.817242, -4.426389, 0.3960784, 1, 0, 1,
-0.5763378, 1.153171, -0.7334765, 0.3921569, 1, 0, 1,
-0.5732054, 0.2246579, -1.890755, 0.3843137, 1, 0, 1,
-0.5672439, -0.671402, -2.812957, 0.3803922, 1, 0, 1,
-0.5670773, 0.8523902, -0.4628966, 0.372549, 1, 0, 1,
-0.5649244, 0.295456, -1.144695, 0.3686275, 1, 0, 1,
-0.5636537, -0.5975459, -3.771351, 0.3607843, 1, 0, 1,
-0.5605351, 0.7435371, -3.251813, 0.3568628, 1, 0, 1,
-0.5577855, -0.1159917, -2.051023, 0.3490196, 1, 0, 1,
-0.5575849, 1.033675, -2.059064, 0.345098, 1, 0, 1,
-0.5551066, -0.469203, -2.242519, 0.3372549, 1, 0, 1,
-0.5448114, 2.124945, -0.880696, 0.3333333, 1, 0, 1,
-0.5444682, 0.03559427, -1.815718, 0.3254902, 1, 0, 1,
-0.5432228, -0.6223245, -2.688777, 0.3215686, 1, 0, 1,
-0.5430425, 1.597548, -2.500091, 0.3137255, 1, 0, 1,
-0.5398233, 0.7935098, -0.7387915, 0.3098039, 1, 0, 1,
-0.5393788, 0.5106829, -1.234941, 0.3019608, 1, 0, 1,
-0.5379341, 1.639692, 1.357962, 0.2941177, 1, 0, 1,
-0.531048, 0.9493194, -0.5191379, 0.2901961, 1, 0, 1,
-0.5297769, -1.502861, -2.757024, 0.282353, 1, 0, 1,
-0.5292573, -2.490431, -3.335951, 0.2784314, 1, 0, 1,
-0.5290297, 0.852983, -0.1353435, 0.2705882, 1, 0, 1,
-0.528634, -0.5431794, -1.392965, 0.2666667, 1, 0, 1,
-0.5246352, -0.2704324, -1.351777, 0.2588235, 1, 0, 1,
-0.5238858, 1.529702, -1.410998, 0.254902, 1, 0, 1,
-0.5202786, 0.6964173, -2.036154, 0.2470588, 1, 0, 1,
-0.5194654, -1.234405, -2.874686, 0.2431373, 1, 0, 1,
-0.5150152, -2.040035, -3.212404, 0.2352941, 1, 0, 1,
-0.5141553, -1.896039, -3.160551, 0.2313726, 1, 0, 1,
-0.513688, -1.136922, -3.259549, 0.2235294, 1, 0, 1,
-0.5116447, -0.0816249, -1.184389, 0.2196078, 1, 0, 1,
-0.5076945, 0.4840301, -0.02100878, 0.2117647, 1, 0, 1,
-0.5053496, -1.181347, -2.464558, 0.2078431, 1, 0, 1,
-0.5022028, 0.5911071, -1.150528, 0.2, 1, 0, 1,
-0.4885352, -0.2950507, -3.212182, 0.1921569, 1, 0, 1,
-0.4836031, -0.2670181, -1.79284, 0.1882353, 1, 0, 1,
-0.4754846, 0.9627366, -1.425821, 0.1803922, 1, 0, 1,
-0.475053, -0.1817157, -2.372207, 0.1764706, 1, 0, 1,
-0.4629102, -0.5523761, -2.783102, 0.1686275, 1, 0, 1,
-0.4574056, -0.281477, -1.949478, 0.1647059, 1, 0, 1,
-0.457272, 0.08916733, -2.428183, 0.1568628, 1, 0, 1,
-0.4559058, 2.329317, -1.971236, 0.1529412, 1, 0, 1,
-0.4517554, -1.844929, -2.60412, 0.145098, 1, 0, 1,
-0.4492505, -0.948193, -3.997517, 0.1411765, 1, 0, 1,
-0.4488476, 0.8255036, -1.284641, 0.1333333, 1, 0, 1,
-0.4488165, 0.9623401, 0.8965246, 0.1294118, 1, 0, 1,
-0.4479547, 1.319198, -1.150956, 0.1215686, 1, 0, 1,
-0.4428244, 0.4772567, -0.1001986, 0.1176471, 1, 0, 1,
-0.442166, -1.10548, -4.013377, 0.1098039, 1, 0, 1,
-0.4414657, 0.1792041, -0.1976855, 0.1058824, 1, 0, 1,
-0.4396516, 0.4932545, -1.376752, 0.09803922, 1, 0, 1,
-0.4395527, -2.398015, -1.920424, 0.09019608, 1, 0, 1,
-0.4390385, 0.2739584, -1.510604, 0.08627451, 1, 0, 1,
-0.4347251, 0.9382129, -1.448334, 0.07843138, 1, 0, 1,
-0.4315232, 0.5023958, -0.8081667, 0.07450981, 1, 0, 1,
-0.4303726, -0.881044, -2.034577, 0.06666667, 1, 0, 1,
-0.427961, 0.8182997, -0.4041656, 0.0627451, 1, 0, 1,
-0.4227985, 0.1460965, -0.7447398, 0.05490196, 1, 0, 1,
-0.4210801, -1.741227, -3.321712, 0.05098039, 1, 0, 1,
-0.4166764, 1.336468, 0.3137978, 0.04313726, 1, 0, 1,
-0.4162052, -0.9707251, -2.797202, 0.03921569, 1, 0, 1,
-0.4139658, -1.283736, -3.083191, 0.03137255, 1, 0, 1,
-0.4128757, 0.2249961, -4.00087, 0.02745098, 1, 0, 1,
-0.4098202, -0.6081637, -1.50111, 0.01960784, 1, 0, 1,
-0.4087466, 0.8849913, -0.1063759, 0.01568628, 1, 0, 1,
-0.4057178, 0.150651, -2.013083, 0.007843138, 1, 0, 1,
-0.4033763, 0.8273051, 0.1262016, 0.003921569, 1, 0, 1,
-0.4027748, -1.159943, -5.326859, 0, 1, 0.003921569, 1,
-0.4023971, -2.691935, -4.538291, 0, 1, 0.01176471, 1,
-0.4016362, 0.4273704, -1.665858, 0, 1, 0.01568628, 1,
-0.3959455, -0.8852625, -0.1955812, 0, 1, 0.02352941, 1,
-0.3887882, -0.8413602, -3.141971, 0, 1, 0.02745098, 1,
-0.3879977, -1.332615, -3.540807, 0, 1, 0.03529412, 1,
-0.386415, 0.5326956, 0.343916, 0, 1, 0.03921569, 1,
-0.3840359, 1.421406, -1.74765, 0, 1, 0.04705882, 1,
-0.3821909, -0.6657382, -4.026586, 0, 1, 0.05098039, 1,
-0.373242, -0.8363826, -2.658297, 0, 1, 0.05882353, 1,
-0.3707843, 0.723823, 0.5605627, 0, 1, 0.0627451, 1,
-0.3683324, 1.506746, -0.04775437, 0, 1, 0.07058824, 1,
-0.3681442, -2.32466, -2.512075, 0, 1, 0.07450981, 1,
-0.3675435, 0.2210083, -0.9889575, 0, 1, 0.08235294, 1,
-0.355453, -0.9900556, -2.521698, 0, 1, 0.08627451, 1,
-0.3545192, -1.333774, -3.421761, 0, 1, 0.09411765, 1,
-0.3538725, -2.595076, -5.133675, 0, 1, 0.1019608, 1,
-0.3536315, -0.1700925, -2.255378, 0, 1, 0.1058824, 1,
-0.3523436, 0.2139299, -1.580403, 0, 1, 0.1137255, 1,
-0.3518311, -0.2121577, -2.976587, 0, 1, 0.1176471, 1,
-0.3485247, 0.764713, -1.604689, 0, 1, 0.1254902, 1,
-0.3427962, -0.5414337, -2.361595, 0, 1, 0.1294118, 1,
-0.3388451, 1.477172, 0.4617909, 0, 1, 0.1372549, 1,
-0.3363199, 1.411301, 0.00252082, 0, 1, 0.1411765, 1,
-0.3356348, -1.012363, -4.214833, 0, 1, 0.1490196, 1,
-0.3328721, 2.203136, 1.005015, 0, 1, 0.1529412, 1,
-0.332392, 0.5607091, -1.224003, 0, 1, 0.1607843, 1,
-0.3320298, -1.335688, -3.154789, 0, 1, 0.1647059, 1,
-0.3281721, 1.212793, 0.8478659, 0, 1, 0.172549, 1,
-0.326561, 0.3395231, -1.399359, 0, 1, 0.1764706, 1,
-0.3259314, 1.368779, -1.456524, 0, 1, 0.1843137, 1,
-0.325095, 0.2669342, -1.847008, 0, 1, 0.1882353, 1,
-0.3236676, -0.05073083, 0.290194, 0, 1, 0.1960784, 1,
-0.3233829, 1.220982, -0.9183392, 0, 1, 0.2039216, 1,
-0.3223017, 0.5265679, -2.011451, 0, 1, 0.2078431, 1,
-0.3128275, -0.9114847, -3.289986, 0, 1, 0.2156863, 1,
-0.310711, 0.6423221, 0.07152306, 0, 1, 0.2196078, 1,
-0.3098162, 0.8330006, -0.4638792, 0, 1, 0.227451, 1,
-0.3088156, 0.1624011, -0.9331019, 0, 1, 0.2313726, 1,
-0.3081674, -0.2649584, -1.974113, 0, 1, 0.2392157, 1,
-0.3080168, 0.2807131, -2.395068, 0, 1, 0.2431373, 1,
-0.3064192, 0.6593686, -1.364444, 0, 1, 0.2509804, 1,
-0.3058161, -0.4479119, -2.922852, 0, 1, 0.254902, 1,
-0.3043234, 0.3070035, -1.146435, 0, 1, 0.2627451, 1,
-0.3011501, -0.4670484, -1.435105, 0, 1, 0.2666667, 1,
-0.299984, 0.2893812, 0.1259159, 0, 1, 0.2745098, 1,
-0.296884, -0.3613349, -1.974079, 0, 1, 0.2784314, 1,
-0.2964592, -0.9324423, -2.032988, 0, 1, 0.2862745, 1,
-0.2936255, -1.597331, -2.700545, 0, 1, 0.2901961, 1,
-0.2878095, -0.8094397, -3.711785, 0, 1, 0.2980392, 1,
-0.2857718, -0.1555478, -0.1469862, 0, 1, 0.3058824, 1,
-0.2791623, 0.9015626, -0.8615972, 0, 1, 0.3098039, 1,
-0.2661233, 0.9017196, 0.5546352, 0, 1, 0.3176471, 1,
-0.2581752, 0.1128855, -1.51734, 0, 1, 0.3215686, 1,
-0.2579417, 0.3737999, -2.619888, 0, 1, 0.3294118, 1,
-0.2564823, 0.5060906, -0.2653409, 0, 1, 0.3333333, 1,
-0.2563406, -1.226004, -3.93191, 0, 1, 0.3411765, 1,
-0.2545007, 0.9820282, 0.6632678, 0, 1, 0.345098, 1,
-0.2496478, 1.254838, -0.1753982, 0, 1, 0.3529412, 1,
-0.2488302, 0.04516067, -0.9694468, 0, 1, 0.3568628, 1,
-0.2480263, 0.3670406, -1.939736, 0, 1, 0.3647059, 1,
-0.246792, -0.2097538, -3.291229, 0, 1, 0.3686275, 1,
-0.2413699, 0.1112517, -0.4151296, 0, 1, 0.3764706, 1,
-0.2405861, 0.9098434, -0.9922754, 0, 1, 0.3803922, 1,
-0.2377751, -0.7186003, -3.325131, 0, 1, 0.3882353, 1,
-0.2377273, 1.437886, -0.8325679, 0, 1, 0.3921569, 1,
-0.2265622, 0.2798911, 0.1865817, 0, 1, 0.4, 1,
-0.2247028, 1.30714, 0.4149549, 0, 1, 0.4078431, 1,
-0.222594, -0.4433216, -2.716792, 0, 1, 0.4117647, 1,
-0.2185214, 0.4842184, -0.05279083, 0, 1, 0.4196078, 1,
-0.2171006, 0.9851498, 1.15207, 0, 1, 0.4235294, 1,
-0.2156192, 0.2147371, -0.5729162, 0, 1, 0.4313726, 1,
-0.2142477, 1.35435, 0.2835843, 0, 1, 0.4352941, 1,
-0.2138502, -0.6337928, -2.79864, 0, 1, 0.4431373, 1,
-0.213402, -0.3567911, -3.127717, 0, 1, 0.4470588, 1,
-0.2129679, 1.008112, -1.202239, 0, 1, 0.454902, 1,
-0.2025339, -0.1059319, -2.3776, 0, 1, 0.4588235, 1,
-0.2012295, -1.01898, -1.933233, 0, 1, 0.4666667, 1,
-0.2010499, -0.8624055, -2.5262, 0, 1, 0.4705882, 1,
-0.1992298, -0.1993144, 0.06637844, 0, 1, 0.4784314, 1,
-0.1974588, 1.868816, 0.3826886, 0, 1, 0.4823529, 1,
-0.1948179, -0.2898225, -1.468909, 0, 1, 0.4901961, 1,
-0.1939574, -0.5002258, -3.363752, 0, 1, 0.4941176, 1,
-0.1914915, -0.12404, -3.641965, 0, 1, 0.5019608, 1,
-0.190793, 0.1067277, -1.281255, 0, 1, 0.509804, 1,
-0.1888329, -0.5065712, -3.486636, 0, 1, 0.5137255, 1,
-0.1844324, 1.121794, -1.185056, 0, 1, 0.5215687, 1,
-0.1841169, -0.1812451, 0.2485181, 0, 1, 0.5254902, 1,
-0.1811448, -0.6580463, -3.831349, 0, 1, 0.5333334, 1,
-0.1781878, -0.1514656, -2.343163, 0, 1, 0.5372549, 1,
-0.17375, -0.1094877, -2.898447, 0, 1, 0.5450981, 1,
-0.1726661, -0.3409659, -2.565453, 0, 1, 0.5490196, 1,
-0.1698934, -0.5012884, -3.97383, 0, 1, 0.5568628, 1,
-0.1680188, -0.4228179, -1.860865, 0, 1, 0.5607843, 1,
-0.1674892, -0.2227812, -3.474925, 0, 1, 0.5686275, 1,
-0.167233, 1.206615, 1.401798, 0, 1, 0.572549, 1,
-0.1633701, -1.34256, -2.380326, 0, 1, 0.5803922, 1,
-0.1579782, -1.349332, -1.83293, 0, 1, 0.5843138, 1,
-0.1567782, -0.2478441, -3.794747, 0, 1, 0.5921569, 1,
-0.15323, -0.9610093, -3.619447, 0, 1, 0.5960785, 1,
-0.1526018, -0.4480636, -2.223356, 0, 1, 0.6039216, 1,
-0.1525388, 0.1746761, 0.5857751, 0, 1, 0.6117647, 1,
-0.1480766, 0.4071357, -0.04639383, 0, 1, 0.6156863, 1,
-0.1446694, -0.1973293, -1.891621, 0, 1, 0.6235294, 1,
-0.1400713, 0.5898874, 1.641207, 0, 1, 0.627451, 1,
-0.137972, -0.1321918, -2.329562, 0, 1, 0.6352941, 1,
-0.1379046, -0.8851966, -2.416814, 0, 1, 0.6392157, 1,
-0.1369455, -0.8869722, -2.865276, 0, 1, 0.6470588, 1,
-0.1330952, -1.014778, -5.187517, 0, 1, 0.6509804, 1,
-0.1319121, -1.528479, -2.976137, 0, 1, 0.6588235, 1,
-0.1306932, 0.6866864, -0.8191321, 0, 1, 0.6627451, 1,
-0.1304442, -1.192512, -3.252477, 0, 1, 0.6705883, 1,
-0.1303795, 1.233522, 0.3205656, 0, 1, 0.6745098, 1,
-0.1246623, 0.6934025, -0.3160299, 0, 1, 0.682353, 1,
-0.1244756, -0.2413704, -3.512696, 0, 1, 0.6862745, 1,
-0.1237917, -0.783666, -3.181961, 0, 1, 0.6941177, 1,
-0.1186814, 0.2024549, -0.7945384, 0, 1, 0.7019608, 1,
-0.1178693, -0.9348732, -1.862835, 0, 1, 0.7058824, 1,
-0.1159336, -0.1309379, -3.138973, 0, 1, 0.7137255, 1,
-0.1129244, -1.05201, -2.393911, 0, 1, 0.7176471, 1,
-0.1101981, 1.360661, 1.24055, 0, 1, 0.7254902, 1,
-0.1088938, -0.7978694, -0.3036097, 0, 1, 0.7294118, 1,
-0.1075216, 0.4485988, -0.2919573, 0, 1, 0.7372549, 1,
-0.105217, 0.9474133, -0.6236572, 0, 1, 0.7411765, 1,
-0.1049966, 0.984842, 0.3056746, 0, 1, 0.7490196, 1,
-0.1034928, 1.672194, 0.3460456, 0, 1, 0.7529412, 1,
-0.09855568, 1.9125, 0.1491381, 0, 1, 0.7607843, 1,
-0.09790166, 0.5290668, 0.1214243, 0, 1, 0.7647059, 1,
-0.09606099, 0.5121653, 0.4945863, 0, 1, 0.772549, 1,
-0.09586871, -0.2186541, -3.289417, 0, 1, 0.7764706, 1,
-0.09402955, 0.983799, -0.5459433, 0, 1, 0.7843137, 1,
-0.09268907, 0.2958571, -0.9133873, 0, 1, 0.7882353, 1,
-0.08818603, -1.111348, -2.079346, 0, 1, 0.7960784, 1,
-0.08771731, -0.4793563, -2.619488, 0, 1, 0.8039216, 1,
-0.08635803, 0.2168825, 2.059212, 0, 1, 0.8078431, 1,
-0.08506805, -0.8506472, -2.155082, 0, 1, 0.8156863, 1,
-0.08384921, 0.5413874, 0.1398499, 0, 1, 0.8196079, 1,
-0.08263937, 0.7904262, 0.8912927, 0, 1, 0.827451, 1,
-0.08239969, 1.266355, 0.842566, 0, 1, 0.8313726, 1,
-0.08017507, -1.788117, -2.02368, 0, 1, 0.8392157, 1,
-0.07028267, 0.9965837, 0.5974276, 0, 1, 0.8431373, 1,
-0.06813212, -0.8780097, -4.525917, 0, 1, 0.8509804, 1,
-0.0658002, 0.07608358, -0.4085381, 0, 1, 0.854902, 1,
-0.05948959, -1.238577, -2.712312, 0, 1, 0.8627451, 1,
-0.05932401, 0.373513, 0.6137787, 0, 1, 0.8666667, 1,
-0.05557483, -0.7405315, -2.402378, 0, 1, 0.8745098, 1,
-0.05518605, -0.1769321, -2.036624, 0, 1, 0.8784314, 1,
-0.05088373, -0.6049145, -3.939276, 0, 1, 0.8862745, 1,
-0.04488831, 0.6083873, -1.341639, 0, 1, 0.8901961, 1,
-0.04289433, -1.172561, -4.761218, 0, 1, 0.8980392, 1,
-0.03700811, -1.280373, -3.057397, 0, 1, 0.9058824, 1,
-0.03638508, -1.245079, -2.884349, 0, 1, 0.9098039, 1,
-0.0342119, -1.507032, -4.07242, 0, 1, 0.9176471, 1,
-0.03049585, 0.5502782, -1.033149, 0, 1, 0.9215686, 1,
-0.03032348, -0.4075286, -4.142741, 0, 1, 0.9294118, 1,
-0.02961194, -0.6634412, -3.197814, 0, 1, 0.9333333, 1,
-0.028336, -0.04441375, -3.164299, 0, 1, 0.9411765, 1,
-0.01275764, 1.707182, 1.110732, 0, 1, 0.945098, 1,
-0.01129475, 2.369943, -0.5085564, 0, 1, 0.9529412, 1,
-0.004888664, -0.05261083, -2.513116, 0, 1, 0.9568627, 1,
-0.004076519, 1.349834, 0.1402007, 0, 1, 0.9647059, 1,
0.0008092594, -1.145332, 3.204502, 0, 1, 0.9686275, 1,
0.001845738, -0.6590706, 3.253684, 0, 1, 0.9764706, 1,
0.00287457, -0.6588841, 2.16452, 0, 1, 0.9803922, 1,
0.003290362, -0.969293, 3.518734, 0, 1, 0.9882353, 1,
0.01210654, -2.511571, 3.813962, 0, 1, 0.9921569, 1,
0.01269022, 0.02885387, 0.04549245, 0, 1, 1, 1,
0.01923404, -0.138412, 2.349043, 0, 0.9921569, 1, 1,
0.02155088, -0.020141, 0.5440832, 0, 0.9882353, 1, 1,
0.0232547, -0.693214, 2.909525, 0, 0.9803922, 1, 1,
0.02469949, -1.771334, 4.218124, 0, 0.9764706, 1, 1,
0.02512583, -1.053626, 1.688713, 0, 0.9686275, 1, 1,
0.02564198, -0.3345405, 3.658201, 0, 0.9647059, 1, 1,
0.02840025, -1.218322, 3.872266, 0, 0.9568627, 1, 1,
0.03234152, -1.06432, 2.593554, 0, 0.9529412, 1, 1,
0.03505875, -0.8481985, 2.878025, 0, 0.945098, 1, 1,
0.0352831, 0.3007373, -2.68635, 0, 0.9411765, 1, 1,
0.03745809, 0.2107868, -0.7080786, 0, 0.9333333, 1, 1,
0.0380663, -2.1824, 3.500237, 0, 0.9294118, 1, 1,
0.0408657, 1.478325, 1.71144, 0, 0.9215686, 1, 1,
0.04841983, 1.257305, 1.485207, 0, 0.9176471, 1, 1,
0.05077456, -0.85339, 2.445411, 0, 0.9098039, 1, 1,
0.05110872, 0.8089051, -2.14215, 0, 0.9058824, 1, 1,
0.05158119, 0.847551, 1.012304, 0, 0.8980392, 1, 1,
0.05162488, 0.8031183, 0.90104, 0, 0.8901961, 1, 1,
0.05310924, -0.06719274, 1.952729, 0, 0.8862745, 1, 1,
0.05412194, 0.7061754, 0.4832056, 0, 0.8784314, 1, 1,
0.05649662, -0.8658653, 3.172793, 0, 0.8745098, 1, 1,
0.06123482, -0.5139177, 3.515078, 0, 0.8666667, 1, 1,
0.0616839, -2.330346, 3.656913, 0, 0.8627451, 1, 1,
0.06225898, -0.3464508, 2.005892, 0, 0.854902, 1, 1,
0.06265532, 0.006583363, 2.05841, 0, 0.8509804, 1, 1,
0.06512425, 1.054444, 0.9129201, 0, 0.8431373, 1, 1,
0.06744926, 1.407872, 0.3301041, 0, 0.8392157, 1, 1,
0.06872382, -0.273432, 4.020772, 0, 0.8313726, 1, 1,
0.07072056, -0.1235866, 2.461432, 0, 0.827451, 1, 1,
0.07072802, 0.8809487, 0.7325225, 0, 0.8196079, 1, 1,
0.07264706, 2.060368, -0.1316791, 0, 0.8156863, 1, 1,
0.07342395, 1.319325, -1.470506, 0, 0.8078431, 1, 1,
0.07509928, -0.01170296, 1.275525, 0, 0.8039216, 1, 1,
0.07644806, -0.08743577, 3.153652, 0, 0.7960784, 1, 1,
0.08049802, 0.5269977, 1.681422, 0, 0.7882353, 1, 1,
0.08725139, -1.056098, 3.194838, 0, 0.7843137, 1, 1,
0.08986772, -1.53987, 3.00809, 0, 0.7764706, 1, 1,
0.08991551, -1.019166, 0.3238147, 0, 0.772549, 1, 1,
0.09264652, 0.1739556, 0.91289, 0, 0.7647059, 1, 1,
0.0928378, 0.7278062, 0.5745469, 0, 0.7607843, 1, 1,
0.09311432, 0.9528812, 0.9733385, 0, 0.7529412, 1, 1,
0.0965219, 0.08177838, 1.678766, 0, 0.7490196, 1, 1,
0.1005782, 0.4045013, 1.221496, 0, 0.7411765, 1, 1,
0.1008681, -0.3715329, 1.489424, 0, 0.7372549, 1, 1,
0.1035786, -0.369309, 1.813544, 0, 0.7294118, 1, 1,
0.1042896, 0.5842414, -0.7921561, 0, 0.7254902, 1, 1,
0.1061262, 0.4107228, 2.776594, 0, 0.7176471, 1, 1,
0.1062645, -1.385783, 3.349192, 0, 0.7137255, 1, 1,
0.1074726, 0.02252312, 0.04736482, 0, 0.7058824, 1, 1,
0.1162513, 1.712574, -0.3203438, 0, 0.6980392, 1, 1,
0.1186428, 0.3504761, 0.1575367, 0, 0.6941177, 1, 1,
0.1197634, -0.9248413, 5.18265, 0, 0.6862745, 1, 1,
0.1199469, 0.02430869, 1.630834, 0, 0.682353, 1, 1,
0.1234016, 0.975055, 1.208842, 0, 0.6745098, 1, 1,
0.1238854, 2.084563, -1.116246, 0, 0.6705883, 1, 1,
0.1247809, 0.6605986, -0.3796686, 0, 0.6627451, 1, 1,
0.1252304, -0.6270443, 2.988631, 0, 0.6588235, 1, 1,
0.1267401, 0.03342665, 1.922658, 0, 0.6509804, 1, 1,
0.1288803, 0.1253218, 1.762029, 0, 0.6470588, 1, 1,
0.1306556, -0.6387085, 2.757506, 0, 0.6392157, 1, 1,
0.137688, 1.882972, -0.738901, 0, 0.6352941, 1, 1,
0.1381777, 1.408538, 0.2615548, 0, 0.627451, 1, 1,
0.1423143, 0.3727221, 1.560671, 0, 0.6235294, 1, 1,
0.1500812, -2.018827, 3.836817, 0, 0.6156863, 1, 1,
0.1513514, 0.3302897, 0.2557201, 0, 0.6117647, 1, 1,
0.1530597, 0.8743627, -1.100266, 0, 0.6039216, 1, 1,
0.1531059, -1.342356, 2.735174, 0, 0.5960785, 1, 1,
0.1548258, 1.864505, -1.500623, 0, 0.5921569, 1, 1,
0.155304, -0.5314735, 3.486537, 0, 0.5843138, 1, 1,
0.1563432, -1.818674, 3.292867, 0, 0.5803922, 1, 1,
0.1593777, 2.155699, -1.234129, 0, 0.572549, 1, 1,
0.1684988, -0.7099499, 1.40988, 0, 0.5686275, 1, 1,
0.1712978, 1.095293, -0.4324919, 0, 0.5607843, 1, 1,
0.1733864, 1.027754, 0.1951095, 0, 0.5568628, 1, 1,
0.1742451, -1.013118, 1.834974, 0, 0.5490196, 1, 1,
0.1756719, 0.6059572, 1.03484, 0, 0.5450981, 1, 1,
0.1764491, 0.2687263, 1.950721, 0, 0.5372549, 1, 1,
0.1781315, 0.9961108, 0.06515396, 0, 0.5333334, 1, 1,
0.1789512, -1.04412, 3.742175, 0, 0.5254902, 1, 1,
0.18023, 0.356265, -0.250864, 0, 0.5215687, 1, 1,
0.1832762, -0.1977981, -0.2589553, 0, 0.5137255, 1, 1,
0.1853049, 0.3668858, 2.100608, 0, 0.509804, 1, 1,
0.1866641, 0.4220292, 0.503826, 0, 0.5019608, 1, 1,
0.1875747, 0.6881419, -0.7802281, 0, 0.4941176, 1, 1,
0.1884711, -0.5848131, 2.28266, 0, 0.4901961, 1, 1,
0.1935625, 1.248811, -0.7960181, 0, 0.4823529, 1, 1,
0.1945244, 0.4059057, -1.872297, 0, 0.4784314, 1, 1,
0.1957753, -2.143865, 2.38764, 0, 0.4705882, 1, 1,
0.2015953, -0.8024064, 3.357477, 0, 0.4666667, 1, 1,
0.2016283, -0.1010191, 0.5196543, 0, 0.4588235, 1, 1,
0.2112038, 0.2749541, 1.413979, 0, 0.454902, 1, 1,
0.2190834, -0.9969071, 3.834093, 0, 0.4470588, 1, 1,
0.2286129, -0.2884263, 2.814183, 0, 0.4431373, 1, 1,
0.2334144, -1.2072, 4.687751, 0, 0.4352941, 1, 1,
0.2369293, -2.145418, 4.188306, 0, 0.4313726, 1, 1,
0.2403179, 0.2008723, 1.61524, 0, 0.4235294, 1, 1,
0.2411708, 0.07755259, 2.543894, 0, 0.4196078, 1, 1,
0.2459475, 0.9121937, 1.567406, 0, 0.4117647, 1, 1,
0.2515858, -0.7182131, 3.004427, 0, 0.4078431, 1, 1,
0.255252, -0.6548463, 3.13473, 0, 0.4, 1, 1,
0.2614153, -0.03423373, 3.016992, 0, 0.3921569, 1, 1,
0.2654693, -0.2185861, 2.589822, 0, 0.3882353, 1, 1,
0.2754746, -0.3944424, 1.154839, 0, 0.3803922, 1, 1,
0.2757083, 2.142584, 1.702434, 0, 0.3764706, 1, 1,
0.277744, 0.744845, 1.312224, 0, 0.3686275, 1, 1,
0.277797, -0.8248696, 3.528348, 0, 0.3647059, 1, 1,
0.2784809, 0.4917133, -0.1091856, 0, 0.3568628, 1, 1,
0.2818962, -1.037606, 2.122709, 0, 0.3529412, 1, 1,
0.2835992, -0.2488879, 1.473459, 0, 0.345098, 1, 1,
0.2846781, -1.203256, 2.359582, 0, 0.3411765, 1, 1,
0.285658, 1.038981, -0.05581069, 0, 0.3333333, 1, 1,
0.2918513, -0.9025252, 2.49844, 0, 0.3294118, 1, 1,
0.2947845, -0.05844139, 0.6051991, 0, 0.3215686, 1, 1,
0.2950032, 0.2232573, -0.0006313735, 0, 0.3176471, 1, 1,
0.2989856, -0.60128, 3.327394, 0, 0.3098039, 1, 1,
0.3027681, 1.982736, 1.095523, 0, 0.3058824, 1, 1,
0.3056543, 0.77208, 1.707134, 0, 0.2980392, 1, 1,
0.3096701, -1.127925, 4.399648, 0, 0.2901961, 1, 1,
0.3101829, 0.2163637, 1.323356, 0, 0.2862745, 1, 1,
0.3123967, -0.211575, 3.897269, 0, 0.2784314, 1, 1,
0.313451, -0.5779729, 4.183303, 0, 0.2745098, 1, 1,
0.3142942, -1.828719, 2.056636, 0, 0.2666667, 1, 1,
0.316592, 2.279143, -1.035994, 0, 0.2627451, 1, 1,
0.3204052, 0.2461374, 0.7450376, 0, 0.254902, 1, 1,
0.3205363, -0.2754927, 1.184915, 0, 0.2509804, 1, 1,
0.3296784, 0.4689977, -0.5358506, 0, 0.2431373, 1, 1,
0.3331903, -0.4102532, 3.00341, 0, 0.2392157, 1, 1,
0.3388383, 0.2097447, -0.2035447, 0, 0.2313726, 1, 1,
0.3417577, -0.05659583, 2.44054, 0, 0.227451, 1, 1,
0.344169, -0.5355256, 4.781524, 0, 0.2196078, 1, 1,
0.3459243, -1.294843, 1.461468, 0, 0.2156863, 1, 1,
0.3532973, -1.068561, 1.918832, 0, 0.2078431, 1, 1,
0.3533722, -0.2669701, 2.44079, 0, 0.2039216, 1, 1,
0.3545024, -0.6132848, 2.999954, 0, 0.1960784, 1, 1,
0.3561665, -0.2111111, 2.655535, 0, 0.1882353, 1, 1,
0.3585317, 0.02014885, 2.151649, 0, 0.1843137, 1, 1,
0.3598623, 0.5263593, -0.4052318, 0, 0.1764706, 1, 1,
0.3634863, -0.8697319, 1.890741, 0, 0.172549, 1, 1,
0.368239, -1.550904, 3.268871, 0, 0.1647059, 1, 1,
0.3686346, 0.3379019, 1.758385, 0, 0.1607843, 1, 1,
0.3686967, -1.394109, -0.1685667, 0, 0.1529412, 1, 1,
0.3688282, -0.2261355, 2.049648, 0, 0.1490196, 1, 1,
0.36923, -0.9202254, 2.703651, 0, 0.1411765, 1, 1,
0.3713692, 1.757768, -0.4322065, 0, 0.1372549, 1, 1,
0.3737679, 1.636343, 0.6783203, 0, 0.1294118, 1, 1,
0.3740727, 0.3988379, -0.9396725, 0, 0.1254902, 1, 1,
0.3764535, 2.391548, 0.6383301, 0, 0.1176471, 1, 1,
0.3773357, 0.7441841, 0.05914411, 0, 0.1137255, 1, 1,
0.3776336, -0.8470643, 3.674567, 0, 0.1058824, 1, 1,
0.3811168, -0.4186932, 1.715003, 0, 0.09803922, 1, 1,
0.3819647, 0.09967109, 1.725499, 0, 0.09411765, 1, 1,
0.3848689, -0.8514857, 3.877021, 0, 0.08627451, 1, 1,
0.3937325, -0.2432334, 1.814965, 0, 0.08235294, 1, 1,
0.3983683, -0.6703584, 2.723476, 0, 0.07450981, 1, 1,
0.4033625, 0.2406881, 0.9939201, 0, 0.07058824, 1, 1,
0.4038837, 1.048992, 3.042902, 0, 0.0627451, 1, 1,
0.4049341, -0.5468596, 1.852781, 0, 0.05882353, 1, 1,
0.4061362, 0.2642216, 1.143696, 0, 0.05098039, 1, 1,
0.4066338, -0.847395, 3.131445, 0, 0.04705882, 1, 1,
0.4070867, -0.3894134, 1.780527, 0, 0.03921569, 1, 1,
0.4149405, -1.138279, 4.764845, 0, 0.03529412, 1, 1,
0.4172465, 1.111817, -0.4586903, 0, 0.02745098, 1, 1,
0.4186658, 0.2348291, -0.5691607, 0, 0.02352941, 1, 1,
0.4204963, -0.457446, 2.049305, 0, 0.01568628, 1, 1,
0.4213036, -1.06603, 5.080263, 0, 0.01176471, 1, 1,
0.4240553, -1.332445, 3.221749, 0, 0.003921569, 1, 1,
0.4248123, -0.7569463, 3.17444, 0.003921569, 0, 1, 1,
0.4258231, 0.9079853, 0.1811296, 0.007843138, 0, 1, 1,
0.4273539, 0.04654265, -0.5597399, 0.01568628, 0, 1, 1,
0.4371602, -1.202283, 2.678058, 0.01960784, 0, 1, 1,
0.4411966, -1.585726, 2.134604, 0.02745098, 0, 1, 1,
0.4413992, -0.453725, 3.416485, 0.03137255, 0, 1, 1,
0.4428816, -0.02536594, 2.1239, 0.03921569, 0, 1, 1,
0.4446867, -0.3523221, 3.587579, 0.04313726, 0, 1, 1,
0.4452775, -0.4193596, 2.773867, 0.05098039, 0, 1, 1,
0.4488782, -1.04418, 3.648934, 0.05490196, 0, 1, 1,
0.4501978, -0.9876468, 2.84439, 0.0627451, 0, 1, 1,
0.4542952, -0.5509491, 1.970026, 0.06666667, 0, 1, 1,
0.4559832, 1.065313, -0.6766382, 0.07450981, 0, 1, 1,
0.4569988, 0.1847372, 0.457267, 0.07843138, 0, 1, 1,
0.4590562, 1.302289, 0.427896, 0.08627451, 0, 1, 1,
0.4619082, -0.8140965, 2.686802, 0.09019608, 0, 1, 1,
0.4633352, 0.7434388, 0.6603095, 0.09803922, 0, 1, 1,
0.4708964, 1.416506, -0.3630548, 0.1058824, 0, 1, 1,
0.4722064, 0.7339605, -1.28651, 0.1098039, 0, 1, 1,
0.4736645, 0.04335617, 2.019513, 0.1176471, 0, 1, 1,
0.476946, -0.2680435, 1.948594, 0.1215686, 0, 1, 1,
0.4784978, 0.4249535, 2.384388, 0.1294118, 0, 1, 1,
0.480591, 0.2094362, 1.975581, 0.1333333, 0, 1, 1,
0.4897575, -1.505861, 1.444903, 0.1411765, 0, 1, 1,
0.4904973, -1.585156, 2.610579, 0.145098, 0, 1, 1,
0.5000074, 0.9924097, 0.1802288, 0.1529412, 0, 1, 1,
0.5007492, 0.2181358, 0.9487314, 0.1568628, 0, 1, 1,
0.5047106, -1.765753, 2.826246, 0.1647059, 0, 1, 1,
0.5083923, 0.9779661, 0.6849151, 0.1686275, 0, 1, 1,
0.5142391, -0.01472032, 1.589029, 0.1764706, 0, 1, 1,
0.5168085, -1.825848, 1.938349, 0.1803922, 0, 1, 1,
0.5169292, -1.288687, 1.612894, 0.1882353, 0, 1, 1,
0.5197305, -0.8030342, 2.263941, 0.1921569, 0, 1, 1,
0.520337, -2.049281, 3.001413, 0.2, 0, 1, 1,
0.5257905, -1.242249, 2.38494, 0.2078431, 0, 1, 1,
0.5297887, -1.431324, 4.130954, 0.2117647, 0, 1, 1,
0.5337802, -1.971015, 2.687911, 0.2196078, 0, 1, 1,
0.5337967, 2.732894, 0.9530722, 0.2235294, 0, 1, 1,
0.5338306, 0.9629019, -0.5980542, 0.2313726, 0, 1, 1,
0.5375006, 0.5489433, 0.06020213, 0.2352941, 0, 1, 1,
0.5384659, -0.3931223, 2.315311, 0.2431373, 0, 1, 1,
0.5392354, -1.611278, 1.845861, 0.2470588, 0, 1, 1,
0.5398818, -0.9558132, 1.146449, 0.254902, 0, 1, 1,
0.5450612, 1.259553, 2.50739, 0.2588235, 0, 1, 1,
0.547365, 0.3574503, 0.6014803, 0.2666667, 0, 1, 1,
0.5524766, -2.133016, 1.699921, 0.2705882, 0, 1, 1,
0.5548869, -0.5766341, 2.377954, 0.2784314, 0, 1, 1,
0.5584537, -0.4804565, 3.372034, 0.282353, 0, 1, 1,
0.559177, 0.4507748, 2.361659, 0.2901961, 0, 1, 1,
0.5592349, 2.287945, 0.9273171, 0.2941177, 0, 1, 1,
0.5624407, -0.3220182, 1.802106, 0.3019608, 0, 1, 1,
0.5672813, -0.4452268, 2.226739, 0.3098039, 0, 1, 1,
0.5714989, 1.217678, -0.9357148, 0.3137255, 0, 1, 1,
0.5741119, -1.264924, 2.702347, 0.3215686, 0, 1, 1,
0.5900307, 1.371967, 0.01704814, 0.3254902, 0, 1, 1,
0.5900724, -2.056504, 2.209058, 0.3333333, 0, 1, 1,
0.591221, -0.08031959, 2.354522, 0.3372549, 0, 1, 1,
0.591305, -1.196708, 4.516123, 0.345098, 0, 1, 1,
0.5941744, 0.2610118, 0.9462229, 0.3490196, 0, 1, 1,
0.5970272, -0.1244131, 2.423019, 0.3568628, 0, 1, 1,
0.6027665, -2.724572, 3.998342, 0.3607843, 0, 1, 1,
0.6037812, 0.4830187, 1.334865, 0.3686275, 0, 1, 1,
0.6118538, 0.7890568, 1.77638, 0.372549, 0, 1, 1,
0.612621, 0.2342875, 0.8702785, 0.3803922, 0, 1, 1,
0.6144525, 0.6514544, 0.5980313, 0.3843137, 0, 1, 1,
0.6193626, -0.06142285, 0.7796438, 0.3921569, 0, 1, 1,
0.6250032, 1.053746, 0.3094352, 0.3960784, 0, 1, 1,
0.633722, 0.6125625, 0.4983355, 0.4039216, 0, 1, 1,
0.6341895, 1.286146, 2.305808, 0.4117647, 0, 1, 1,
0.6350819, 1.110047, 0.09663243, 0.4156863, 0, 1, 1,
0.6440203, 0.2528799, -0.4986315, 0.4235294, 0, 1, 1,
0.6469068, -0.7330987, 1.688447, 0.427451, 0, 1, 1,
0.6489665, 0.4657497, 1.066382, 0.4352941, 0, 1, 1,
0.6490707, -1.96773, 4.580947, 0.4392157, 0, 1, 1,
0.6512263, -0.4626868, 4.127583, 0.4470588, 0, 1, 1,
0.6527365, 0.1001728, 2.791291, 0.4509804, 0, 1, 1,
0.6529087, 0.3133903, 1.001354, 0.4588235, 0, 1, 1,
0.6572385, 0.2164138, 0.8376629, 0.4627451, 0, 1, 1,
0.6580395, 0.06466624, 0.08812189, 0.4705882, 0, 1, 1,
0.6607765, -0.6664655, 1.710881, 0.4745098, 0, 1, 1,
0.6617672, -0.4615311, 3.057654, 0.4823529, 0, 1, 1,
0.6639224, -0.9181679, 2.187171, 0.4862745, 0, 1, 1,
0.6640113, -2.610365, 2.033866, 0.4941176, 0, 1, 1,
0.6649918, 0.6733832, 1.640621, 0.5019608, 0, 1, 1,
0.6664158, -0.3545156, 3.016808, 0.5058824, 0, 1, 1,
0.6671014, 2.895904, 0.8970993, 0.5137255, 0, 1, 1,
0.6723576, 1.141254, 1.01015, 0.5176471, 0, 1, 1,
0.6735497, -0.6321267, 1.395804, 0.5254902, 0, 1, 1,
0.6743551, 0.7305327, 0.09937994, 0.5294118, 0, 1, 1,
0.6750329, -0.5804332, 3.472467, 0.5372549, 0, 1, 1,
0.6846849, 0.5505181, 0.694489, 0.5411765, 0, 1, 1,
0.6848109, -0.5861872, 1.062516, 0.5490196, 0, 1, 1,
0.6877635, 0.6304305, -0.2976186, 0.5529412, 0, 1, 1,
0.6920663, -0.9148875, 3.723417, 0.5607843, 0, 1, 1,
0.6955087, 0.4058801, 1.22127, 0.5647059, 0, 1, 1,
0.7001874, 0.3954349, -0.2694726, 0.572549, 0, 1, 1,
0.7016932, 1.044864, 3.889142, 0.5764706, 0, 1, 1,
0.7019188, 0.4697715, 1.43937, 0.5843138, 0, 1, 1,
0.7034265, 0.1594118, 1.365644, 0.5882353, 0, 1, 1,
0.7044342, -2.189801, 3.188722, 0.5960785, 0, 1, 1,
0.7059962, 0.888753, 1.68842, 0.6039216, 0, 1, 1,
0.7070088, 0.4915616, 1.438264, 0.6078432, 0, 1, 1,
0.7128019, -1.5586, 1.91403, 0.6156863, 0, 1, 1,
0.7141526, 1.091959, 1.326383, 0.6196079, 0, 1, 1,
0.7142511, 0.2854987, -1.118372, 0.627451, 0, 1, 1,
0.7190577, 0.1894329, 1.646037, 0.6313726, 0, 1, 1,
0.7223792, -0.07885001, 1.828323, 0.6392157, 0, 1, 1,
0.7270426, 0.4675371, -0.1115166, 0.6431373, 0, 1, 1,
0.7313718, -2.112556, 4.388096, 0.6509804, 0, 1, 1,
0.7330186, -0.2496849, 0.7523534, 0.654902, 0, 1, 1,
0.7380767, 0.574054, 0.4099435, 0.6627451, 0, 1, 1,
0.7443672, -0.3735787, 2.429278, 0.6666667, 0, 1, 1,
0.7473274, 1.168405, -0.15432, 0.6745098, 0, 1, 1,
0.7483061, -0.4743174, 0.3341805, 0.6784314, 0, 1, 1,
0.748367, -0.2329836, 2.066171, 0.6862745, 0, 1, 1,
0.7598316, 0.2812488, 3.179025, 0.6901961, 0, 1, 1,
0.7605807, -1.020085, 2.071403, 0.6980392, 0, 1, 1,
0.7608758, -0.188603, 3.002153, 0.7058824, 0, 1, 1,
0.7644017, 0.5045244, 1.246436, 0.7098039, 0, 1, 1,
0.7677306, -1.396038, 4.137521, 0.7176471, 0, 1, 1,
0.7702104, -0.9526337, 2.757946, 0.7215686, 0, 1, 1,
0.7728383, -1.314308, 3.131962, 0.7294118, 0, 1, 1,
0.7771664, -0.5731187, 0.2207837, 0.7333333, 0, 1, 1,
0.7806357, -0.7520601, 1.582346, 0.7411765, 0, 1, 1,
0.7874025, 0.2443963, 1.129111, 0.7450981, 0, 1, 1,
0.7938163, -0.3486165, 2.80877, 0.7529412, 0, 1, 1,
0.7942278, -0.2567481, 1.030365, 0.7568628, 0, 1, 1,
0.7961812, 0.7398681, 0.6929008, 0.7647059, 0, 1, 1,
0.7968283, -0.3916209, 2.653278, 0.7686275, 0, 1, 1,
0.7969086, 0.5230862, 1.326756, 0.7764706, 0, 1, 1,
0.7992107, 1.066123, 0.07568052, 0.7803922, 0, 1, 1,
0.8001338, -0.5350679, 0.9256276, 0.7882353, 0, 1, 1,
0.8004616, -0.4406371, 2.493066, 0.7921569, 0, 1, 1,
0.8025461, 0.9874792, 2.212251, 0.8, 0, 1, 1,
0.8053867, 0.2195635, 1.600148, 0.8078431, 0, 1, 1,
0.8062392, -0.572933, 2.467747, 0.8117647, 0, 1, 1,
0.8144984, 0.650405, 1.271997, 0.8196079, 0, 1, 1,
0.8163902, 0.07126129, 2.560555, 0.8235294, 0, 1, 1,
0.8206332, 0.2235761, 1.712754, 0.8313726, 0, 1, 1,
0.8262642, -1.417439, 3.017174, 0.8352941, 0, 1, 1,
0.8318746, 2.241219, 0.5665856, 0.8431373, 0, 1, 1,
0.8364862, -1.491394, 3.906852, 0.8470588, 0, 1, 1,
0.8369067, 0.7681134, 0.7678808, 0.854902, 0, 1, 1,
0.8407766, 0.6403165, -0.8086869, 0.8588235, 0, 1, 1,
0.8442344, -0.7452418, 1.729472, 0.8666667, 0, 1, 1,
0.8462504, -1.560219, 3.33298, 0.8705882, 0, 1, 1,
0.8477441, 0.1903476, 1.650303, 0.8784314, 0, 1, 1,
0.8502141, -0.8715994, 2.529402, 0.8823529, 0, 1, 1,
0.8557535, -0.5050752, 2.498201, 0.8901961, 0, 1, 1,
0.8582941, -0.4704836, 2.387881, 0.8941177, 0, 1, 1,
0.8588841, -0.1899233, -0.5935538, 0.9019608, 0, 1, 1,
0.8621366, 1.097007, 0.8196622, 0.9098039, 0, 1, 1,
0.8621487, -0.08566266, 2.557441, 0.9137255, 0, 1, 1,
0.8651221, -0.2820758, 2.521895, 0.9215686, 0, 1, 1,
0.8659058, -0.3681799, 0.8877175, 0.9254902, 0, 1, 1,
0.8662189, -0.3482906, 1.251429, 0.9333333, 0, 1, 1,
0.8677562, 0.820454, -1.113123, 0.9372549, 0, 1, 1,
0.8719006, 0.5256608, 1.952694, 0.945098, 0, 1, 1,
0.8786235, -1.11891, 3.289508, 0.9490196, 0, 1, 1,
0.8819903, -2.002097, 2.598726, 0.9568627, 0, 1, 1,
0.8861388, -0.6027598, 3.949898, 0.9607843, 0, 1, 1,
0.8950037, 0.5007459, 1.313076, 0.9686275, 0, 1, 1,
0.8963231, -0.1717678, 1.008847, 0.972549, 0, 1, 1,
0.9019732, 0.4220293, 1.57398, 0.9803922, 0, 1, 1,
0.9062017, 1.4945, 0.6919554, 0.9843137, 0, 1, 1,
0.9075978, 0.06458371, 0.4668214, 0.9921569, 0, 1, 1,
0.9146932, 1.16562, 0.6334561, 0.9960784, 0, 1, 1,
0.9244094, 1.234136, -0.8428413, 1, 0, 0.9960784, 1,
0.9257029, 0.4726273, 0.7770829, 1, 0, 0.9882353, 1,
0.9299183, -0.6482517, 1.835353, 1, 0, 0.9843137, 1,
0.9443592, -0.7981722, 2.028327, 1, 0, 0.9764706, 1,
0.9508761, -0.4198283, 0.9463822, 1, 0, 0.972549, 1,
0.9517782, -0.6878238, 3.040793, 1, 0, 0.9647059, 1,
0.9599472, -0.709059, 0.7705613, 1, 0, 0.9607843, 1,
0.9621438, 0.5158314, 1.668597, 1, 0, 0.9529412, 1,
0.9688839, -0.03480921, 2.06678, 1, 0, 0.9490196, 1,
0.9722766, -1.022432, 2.245845, 1, 0, 0.9411765, 1,
0.979032, 2.952758, 0.194984, 1, 0, 0.9372549, 1,
0.990496, -1.039863, 1.963746, 1, 0, 0.9294118, 1,
0.9906142, -1.379192, 2.801456, 1, 0, 0.9254902, 1,
0.9912292, -0.236055, 1.51003, 1, 0, 0.9176471, 1,
0.9932355, 0.8427355, 1.579525, 1, 0, 0.9137255, 1,
0.9945338, 1.449515, 1.286729, 1, 0, 0.9058824, 1,
0.9954767, 0.6014881, 2.050742, 1, 0, 0.9019608, 1,
0.9984791, 0.6296517, 1.355868, 1, 0, 0.8941177, 1,
1.003082, 0.5279078, 1.317833, 1, 0, 0.8862745, 1,
1.003199, -0.3722847, 2.303251, 1, 0, 0.8823529, 1,
1.00843, -1.020859, 0.5487458, 1, 0, 0.8745098, 1,
1.008837, -0.6630892, 1.089007, 1, 0, 0.8705882, 1,
1.017121, 0.8827879, 0.05423501, 1, 0, 0.8627451, 1,
1.022008, -0.9790965, 3.844658, 1, 0, 0.8588235, 1,
1.023338, -0.2110193, 2.473526, 1, 0, 0.8509804, 1,
1.02502, -0.5235001, 0.9093225, 1, 0, 0.8470588, 1,
1.02983, -1.156482, 1.793491, 1, 0, 0.8392157, 1,
1.037253, 2.972234, 0.7524266, 1, 0, 0.8352941, 1,
1.041752, 0.03449289, 0.8832566, 1, 0, 0.827451, 1,
1.047668, -0.1655493, 1.113305, 1, 0, 0.8235294, 1,
1.050986, 0.6173747, -0.2902115, 1, 0, 0.8156863, 1,
1.052004, -1.397215, 0.2090851, 1, 0, 0.8117647, 1,
1.053501, -0.3843874, 0.8675181, 1, 0, 0.8039216, 1,
1.05455, 0.4782334, 2.911606, 1, 0, 0.7960784, 1,
1.054569, 0.2658179, 2.518215, 1, 0, 0.7921569, 1,
1.060874, 0.2555462, 0.2624547, 1, 0, 0.7843137, 1,
1.063605, 0.9723606, -0.7394114, 1, 0, 0.7803922, 1,
1.064376, 1.487239, 1.269029, 1, 0, 0.772549, 1,
1.065244, 1.750115, 0.8899104, 1, 0, 0.7686275, 1,
1.06616, 0.2620122, 0.8408764, 1, 0, 0.7607843, 1,
1.071004, 0.6101469, -0.1003118, 1, 0, 0.7568628, 1,
1.07332, 1.062149, 1.693903, 1, 0, 0.7490196, 1,
1.075794, 0.007874222, 1.019241, 1, 0, 0.7450981, 1,
1.08567, -1.247166, 1.5192, 1, 0, 0.7372549, 1,
1.102699, 0.7458113, -0.4956034, 1, 0, 0.7333333, 1,
1.107148, -0.4213533, 3.888245, 1, 0, 0.7254902, 1,
1.110081, -1.680787, 1.717813, 1, 0, 0.7215686, 1,
1.110317, 0.6090562, 0.9624889, 1, 0, 0.7137255, 1,
1.111834, 1.051345, 2.22515, 1, 0, 0.7098039, 1,
1.113812, -0.8314965, 0.9688787, 1, 0, 0.7019608, 1,
1.122396, 0.8798051, 2.107274, 1, 0, 0.6941177, 1,
1.122406, 0.7741752, 0.3693752, 1, 0, 0.6901961, 1,
1.138022, -0.1556799, 1.484575, 1, 0, 0.682353, 1,
1.140455, -0.3914244, 1.624641, 1, 0, 0.6784314, 1,
1.146006, 0.8924334, 1.234239, 1, 0, 0.6705883, 1,
1.15021, -0.5862823, 1.631765, 1, 0, 0.6666667, 1,
1.154405, 0.4325305, 1.756015, 1, 0, 0.6588235, 1,
1.175244, -1.491144, 2.348704, 1, 0, 0.654902, 1,
1.179538, 1.143106, 0.6107677, 1, 0, 0.6470588, 1,
1.185625, -0.6256115, 1.08951, 1, 0, 0.6431373, 1,
1.186979, 0.02475693, 2.111485, 1, 0, 0.6352941, 1,
1.187671, -0.6560001, 2.155667, 1, 0, 0.6313726, 1,
1.187757, 1.034138, 0.2794178, 1, 0, 0.6235294, 1,
1.188562, 0.8133221, 1.893223, 1, 0, 0.6196079, 1,
1.193677, -1.590756, 3.527498, 1, 0, 0.6117647, 1,
1.195578, -0.5797389, 2.081079, 1, 0, 0.6078432, 1,
1.201917, -0.05862089, 3.261891, 1, 0, 0.6, 1,
1.20457, -0.3509713, 3.390225, 1, 0, 0.5921569, 1,
1.204816, 0.04172969, 1.158355, 1, 0, 0.5882353, 1,
1.207806, -0.1356207, 0.8425913, 1, 0, 0.5803922, 1,
1.214157, -0.4675394, 1.627248, 1, 0, 0.5764706, 1,
1.216182, -1.903874, 1.482727, 1, 0, 0.5686275, 1,
1.21778, 0.7551484, 1.402595, 1, 0, 0.5647059, 1,
1.218146, 0.9615833, 1.65713, 1, 0, 0.5568628, 1,
1.222249, -0.6475812, 2.104394, 1, 0, 0.5529412, 1,
1.223461, 1.26155, 1.901055, 1, 0, 0.5450981, 1,
1.229542, -0.2782144, 2.313234, 1, 0, 0.5411765, 1,
1.232588, -1.380365, 2.96023, 1, 0, 0.5333334, 1,
1.234144, -0.06846325, 1.197702, 1, 0, 0.5294118, 1,
1.239881, -0.8186406, 1.710549, 1, 0, 0.5215687, 1,
1.249681, 0.7992801, 1.319871, 1, 0, 0.5176471, 1,
1.250252, -0.9672132, 2.461501, 1, 0, 0.509804, 1,
1.256027, -0.2541683, 3.563705, 1, 0, 0.5058824, 1,
1.276965, -0.3490267, 1.436363, 1, 0, 0.4980392, 1,
1.279516, -0.1874927, -0.6800358, 1, 0, 0.4901961, 1,
1.281647, 1.099908, 1.013312, 1, 0, 0.4862745, 1,
1.285301, 0.2340098, 0.8318453, 1, 0, 0.4784314, 1,
1.299111, -0.8673173, 3.534436, 1, 0, 0.4745098, 1,
1.302308, -0.4579975, 0.8021547, 1, 0, 0.4666667, 1,
1.307042, 0.06684702, 1.941529, 1, 0, 0.4627451, 1,
1.308965, 0.1593789, 1.163164, 1, 0, 0.454902, 1,
1.309614, 0.2751248, 2.818088, 1, 0, 0.4509804, 1,
1.31093, 0.5566818, 1.336544, 1, 0, 0.4431373, 1,
1.323241, 1.022896, 1.090518, 1, 0, 0.4392157, 1,
1.332316, -0.3900412, 1.166476, 1, 0, 0.4313726, 1,
1.332759, -1.346517, 2.792541, 1, 0, 0.427451, 1,
1.335114, 1.123017, 0.7318882, 1, 0, 0.4196078, 1,
1.338359, 0.719287, 1.925447, 1, 0, 0.4156863, 1,
1.357378, 0.8041757, 1.787213, 1, 0, 0.4078431, 1,
1.357808, 0.8298118, 1.473251, 1, 0, 0.4039216, 1,
1.358519, 1.448362, -0.4910155, 1, 0, 0.3960784, 1,
1.35925, 1.393967, 2.05647, 1, 0, 0.3882353, 1,
1.363817, 1.04018, 0.1893533, 1, 0, 0.3843137, 1,
1.364315, 0.7759823, -1.167009, 1, 0, 0.3764706, 1,
1.37558, -0.1974929, 1.207941, 1, 0, 0.372549, 1,
1.391316, 0.3327537, 1.327921, 1, 0, 0.3647059, 1,
1.405417, -0.1146625, 1.028078, 1, 0, 0.3607843, 1,
1.406226, -1.387306, 1.7062, 1, 0, 0.3529412, 1,
1.431153, 0.3902223, 1.616704, 1, 0, 0.3490196, 1,
1.44044, -0.4397143, 3.310236, 1, 0, 0.3411765, 1,
1.458724, -0.2937914, 2.257292, 1, 0, 0.3372549, 1,
1.460676, 0.656148, 1.342263, 1, 0, 0.3294118, 1,
1.463436, -1.450445, 3.655422, 1, 0, 0.3254902, 1,
1.472341, -0.4418264, 1.07154, 1, 0, 0.3176471, 1,
1.480645, -0.8667285, 2.986745, 1, 0, 0.3137255, 1,
1.483591, 0.5611315, 0.3589984, 1, 0, 0.3058824, 1,
1.494265, -0.05498507, 0.6810988, 1, 0, 0.2980392, 1,
1.495755, -0.9703767, 1.853332, 1, 0, 0.2941177, 1,
1.496208, -1.350352, 2.828105, 1, 0, 0.2862745, 1,
1.501776, 0.876994, 0.8523843, 1, 0, 0.282353, 1,
1.522521, 0.6534584, 1.731213, 1, 0, 0.2745098, 1,
1.54519, -1.142204, 3.399414, 1, 0, 0.2705882, 1,
1.550606, 1.040134, 0.7119613, 1, 0, 0.2627451, 1,
1.57448, 0.4668848, 1.037268, 1, 0, 0.2588235, 1,
1.583547, -1.697459, 2.927046, 1, 0, 0.2509804, 1,
1.58443, 0.6592994, 1.93649, 1, 0, 0.2470588, 1,
1.610279, -1.021189, 0.5858045, 1, 0, 0.2392157, 1,
1.614963, -0.3480549, 1.331466, 1, 0, 0.2352941, 1,
1.64817, 1.504715, 1.200567, 1, 0, 0.227451, 1,
1.648554, 1.122847, -0.3086547, 1, 0, 0.2235294, 1,
1.652575, 1.510191, 0.8853359, 1, 0, 0.2156863, 1,
1.659484, -0.215168, 1.958862, 1, 0, 0.2117647, 1,
1.66334, -0.72997, 2.716273, 1, 0, 0.2039216, 1,
1.667755, 0.5874121, 0.8914549, 1, 0, 0.1960784, 1,
1.673068, 0.2243597, 0.1234962, 1, 0, 0.1921569, 1,
1.673924, 0.8217921, 0.2245942, 1, 0, 0.1843137, 1,
1.688058, 0.8614087, 1.801084, 1, 0, 0.1803922, 1,
1.691748, -1.296625, 3.608546, 1, 0, 0.172549, 1,
1.713463, -0.8842004, 3.272706, 1, 0, 0.1686275, 1,
1.73027, 0.03946603, 0.03492323, 1, 0, 0.1607843, 1,
1.731427, -0.1812784, 1.587569, 1, 0, 0.1568628, 1,
1.735361, 0.004316165, 4.248444, 1, 0, 0.1490196, 1,
1.746222, 1.127533, 1.408739, 1, 0, 0.145098, 1,
1.754439, 0.4642825, -0.5645523, 1, 0, 0.1372549, 1,
1.774225, -1.40473, 4.00875, 1, 0, 0.1333333, 1,
1.784979, -0.3555416, 1.138866, 1, 0, 0.1254902, 1,
1.801665, -0.8576744, 0.1584996, 1, 0, 0.1215686, 1,
1.809749, -0.07735416, 1.264567, 1, 0, 0.1137255, 1,
1.814387, -1.447855, 2.694345, 1, 0, 0.1098039, 1,
1.912566, -0.6148083, 3.026977, 1, 0, 0.1019608, 1,
1.947841, -0.7944337, 2.815711, 1, 0, 0.09411765, 1,
1.957236, -1.489241, 2.246512, 1, 0, 0.09019608, 1,
1.999535, -0.2501428, 2.058016, 1, 0, 0.08235294, 1,
2.012571, 0.212812, 2.417165, 1, 0, 0.07843138, 1,
2.047967, -0.2926947, 2.852309, 1, 0, 0.07058824, 1,
2.097271, 1.986526, 0.8064696, 1, 0, 0.06666667, 1,
2.122687, 1.073177, 0.1289961, 1, 0, 0.05882353, 1,
2.199005, -1.888021, 1.295735, 1, 0, 0.05490196, 1,
2.206826, -0.5694468, 0.8102377, 1, 0, 0.04705882, 1,
2.356394, 0.4965693, 0.6729516, 1, 0, 0.04313726, 1,
2.415868, -0.01835176, 1.758086, 1, 0, 0.03529412, 1,
2.498382, 1.096716, 1.77806, 1, 0, 0.03137255, 1,
2.54944, 0.9290512, 1.746167, 1, 0, 0.02352941, 1,
2.704818, 2.7988, -0.8198645, 1, 0, 0.01960784, 1,
2.941835, 1.551909, 1.318246, 1, 0, 0.01176471, 1,
3.032346, -2.465843, 2.683084, 1, 0, 0.007843138, 1
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
0.07117617, -3.69018, -7.108221, 0, -0.5, 0.5, 0.5,
0.07117617, -3.69018, -7.108221, 1, -0.5, 0.5, 0.5,
0.07117617, -3.69018, -7.108221, 1, 1.5, 0.5, 0.5,
0.07117617, -3.69018, -7.108221, 0, 1.5, 0.5, 0.5
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
-3.893831, 0.1238309, -7.108221, 0, -0.5, 0.5, 0.5,
-3.893831, 0.1238309, -7.108221, 1, -0.5, 0.5, 0.5,
-3.893831, 0.1238309, -7.108221, 1, 1.5, 0.5, 0.5,
-3.893831, 0.1238309, -7.108221, 0, 1.5, 0.5, 0.5
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
-3.893831, -3.69018, -0.07210469, 0, -0.5, 0.5, 0.5,
-3.893831, -3.69018, -0.07210469, 1, -0.5, 0.5, 0.5,
-3.893831, -3.69018, -0.07210469, 1, 1.5, 0.5, 0.5,
-3.893831, -3.69018, -0.07210469, 0, 1.5, 0.5, 0.5
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
-2, -2.810024, -5.484502,
3, -2.810024, -5.484502,
-2, -2.810024, -5.484502,
-2, -2.956717, -5.755122,
-1, -2.810024, -5.484502,
-1, -2.956717, -5.755122,
0, -2.810024, -5.484502,
0, -2.956717, -5.755122,
1, -2.810024, -5.484502,
1, -2.956717, -5.755122,
2, -2.810024, -5.484502,
2, -2.956717, -5.755122,
3, -2.810024, -5.484502,
3, -2.956717, -5.755122
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
-2, -3.250102, -6.296361, 0, -0.5, 0.5, 0.5,
-2, -3.250102, -6.296361, 1, -0.5, 0.5, 0.5,
-2, -3.250102, -6.296361, 1, 1.5, 0.5, 0.5,
-2, -3.250102, -6.296361, 0, 1.5, 0.5, 0.5,
-1, -3.250102, -6.296361, 0, -0.5, 0.5, 0.5,
-1, -3.250102, -6.296361, 1, -0.5, 0.5, 0.5,
-1, -3.250102, -6.296361, 1, 1.5, 0.5, 0.5,
-1, -3.250102, -6.296361, 0, 1.5, 0.5, 0.5,
0, -3.250102, -6.296361, 0, -0.5, 0.5, 0.5,
0, -3.250102, -6.296361, 1, -0.5, 0.5, 0.5,
0, -3.250102, -6.296361, 1, 1.5, 0.5, 0.5,
0, -3.250102, -6.296361, 0, 1.5, 0.5, 0.5,
1, -3.250102, -6.296361, 0, -0.5, 0.5, 0.5,
1, -3.250102, -6.296361, 1, -0.5, 0.5, 0.5,
1, -3.250102, -6.296361, 1, 1.5, 0.5, 0.5,
1, -3.250102, -6.296361, 0, 1.5, 0.5, 0.5,
2, -3.250102, -6.296361, 0, -0.5, 0.5, 0.5,
2, -3.250102, -6.296361, 1, -0.5, 0.5, 0.5,
2, -3.250102, -6.296361, 1, 1.5, 0.5, 0.5,
2, -3.250102, -6.296361, 0, 1.5, 0.5, 0.5,
3, -3.250102, -6.296361, 0, -0.5, 0.5, 0.5,
3, -3.250102, -6.296361, 1, -0.5, 0.5, 0.5,
3, -3.250102, -6.296361, 1, 1.5, 0.5, 0.5,
3, -3.250102, -6.296361, 0, 1.5, 0.5, 0.5
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
-2.978829, -2, -5.484502,
-2.978829, 2, -5.484502,
-2.978829, -2, -5.484502,
-3.13133, -2, -5.755122,
-2.978829, -1, -5.484502,
-3.13133, -1, -5.755122,
-2.978829, 0, -5.484502,
-3.13133, 0, -5.755122,
-2.978829, 1, -5.484502,
-3.13133, 1, -5.755122,
-2.978829, 2, -5.484502,
-3.13133, 2, -5.755122
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
-3.43633, -2, -6.296361, 0, -0.5, 0.5, 0.5,
-3.43633, -2, -6.296361, 1, -0.5, 0.5, 0.5,
-3.43633, -2, -6.296361, 1, 1.5, 0.5, 0.5,
-3.43633, -2, -6.296361, 0, 1.5, 0.5, 0.5,
-3.43633, -1, -6.296361, 0, -0.5, 0.5, 0.5,
-3.43633, -1, -6.296361, 1, -0.5, 0.5, 0.5,
-3.43633, -1, -6.296361, 1, 1.5, 0.5, 0.5,
-3.43633, -1, -6.296361, 0, 1.5, 0.5, 0.5,
-3.43633, 0, -6.296361, 0, -0.5, 0.5, 0.5,
-3.43633, 0, -6.296361, 1, -0.5, 0.5, 0.5,
-3.43633, 0, -6.296361, 1, 1.5, 0.5, 0.5,
-3.43633, 0, -6.296361, 0, 1.5, 0.5, 0.5,
-3.43633, 1, -6.296361, 0, -0.5, 0.5, 0.5,
-3.43633, 1, -6.296361, 1, -0.5, 0.5, 0.5,
-3.43633, 1, -6.296361, 1, 1.5, 0.5, 0.5,
-3.43633, 1, -6.296361, 0, 1.5, 0.5, 0.5,
-3.43633, 2, -6.296361, 0, -0.5, 0.5, 0.5,
-3.43633, 2, -6.296361, 1, -0.5, 0.5, 0.5,
-3.43633, 2, -6.296361, 1, 1.5, 0.5, 0.5,
-3.43633, 2, -6.296361, 0, 1.5, 0.5, 0.5
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
-2.978829, -2.810024, -4,
-2.978829, -2.810024, 4,
-2.978829, -2.810024, -4,
-3.13133, -2.956717, -4,
-2.978829, -2.810024, -2,
-3.13133, -2.956717, -2,
-2.978829, -2.810024, 0,
-3.13133, -2.956717, 0,
-2.978829, -2.810024, 2,
-3.13133, -2.956717, 2,
-2.978829, -2.810024, 4,
-3.13133, -2.956717, 4
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
-3.43633, -3.250102, -4, 0, -0.5, 0.5, 0.5,
-3.43633, -3.250102, -4, 1, -0.5, 0.5, 0.5,
-3.43633, -3.250102, -4, 1, 1.5, 0.5, 0.5,
-3.43633, -3.250102, -4, 0, 1.5, 0.5, 0.5,
-3.43633, -3.250102, -2, 0, -0.5, 0.5, 0.5,
-3.43633, -3.250102, -2, 1, -0.5, 0.5, 0.5,
-3.43633, -3.250102, -2, 1, 1.5, 0.5, 0.5,
-3.43633, -3.250102, -2, 0, 1.5, 0.5, 0.5,
-3.43633, -3.250102, 0, 0, -0.5, 0.5, 0.5,
-3.43633, -3.250102, 0, 1, -0.5, 0.5, 0.5,
-3.43633, -3.250102, 0, 1, 1.5, 0.5, 0.5,
-3.43633, -3.250102, 0, 0, 1.5, 0.5, 0.5,
-3.43633, -3.250102, 2, 0, -0.5, 0.5, 0.5,
-3.43633, -3.250102, 2, 1, -0.5, 0.5, 0.5,
-3.43633, -3.250102, 2, 1, 1.5, 0.5, 0.5,
-3.43633, -3.250102, 2, 0, 1.5, 0.5, 0.5,
-3.43633, -3.250102, 4, 0, -0.5, 0.5, 0.5,
-3.43633, -3.250102, 4, 1, -0.5, 0.5, 0.5,
-3.43633, -3.250102, 4, 1, 1.5, 0.5, 0.5,
-3.43633, -3.250102, 4, 0, 1.5, 0.5, 0.5
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
-2.978829, -2.810024, -5.484502,
-2.978829, 3.057686, -5.484502,
-2.978829, -2.810024, 5.340292,
-2.978829, 3.057686, 5.340292,
-2.978829, -2.810024, -5.484502,
-2.978829, -2.810024, 5.340292,
-2.978829, 3.057686, -5.484502,
-2.978829, 3.057686, 5.340292,
-2.978829, -2.810024, -5.484502,
3.121181, -2.810024, -5.484502,
-2.978829, -2.810024, 5.340292,
3.121181, -2.810024, 5.340292,
-2.978829, 3.057686, -5.484502,
3.121181, 3.057686, -5.484502,
-2.978829, 3.057686, 5.340292,
3.121181, 3.057686, 5.340292,
3.121181, -2.810024, -5.484502,
3.121181, 3.057686, -5.484502,
3.121181, -2.810024, 5.340292,
3.121181, 3.057686, 5.340292,
3.121181, -2.810024, -5.484502,
3.121181, -2.810024, 5.340292,
3.121181, 3.057686, -5.484502,
3.121181, 3.057686, 5.340292
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
var radius = 7.337451;
var distance = 32.64515;
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
mvMatrix.translate( -0.07117617, -0.1238309, 0.07210469 );
mvMatrix.scale( 1.300554, 1.352043, 0.7328911 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.64515);
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
thiazole-5-carboxani<-read.table("thiazole-5-carboxani.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiazole-5-carboxani$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiazole' not found
```

```r
y<-thiazole-5-carboxani$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiazole' not found
```

```r
z<-thiazole-5-carboxani$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiazole' not found
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
-2.889994, 0.7542146, -2.547181, 0, 0, 1, 1, 1,
-2.879854, -0.7799516, -3.652766, 1, 0, 0, 1, 1,
-2.844058, -0.8168249, -2.710382, 1, 0, 0, 1, 1,
-2.54686, -0.4504378, -0.8701591, 1, 0, 0, 1, 1,
-2.537566, -0.09227546, -0.8925112, 1, 0, 0, 1, 1,
-2.535604, 0.1610528, -1.113755, 1, 0, 0, 1, 1,
-2.494404, 0.7124453, -0.5204134, 0, 0, 0, 1, 1,
-2.463902, -1.460776, -1.447327, 0, 0, 0, 1, 1,
-2.405181, -0.4790968, -1.993093, 0, 0, 0, 1, 1,
-2.376966, 0.7955217, -1.814166, 0, 0, 0, 1, 1,
-2.366371, 0.4127678, -1.530576, 0, 0, 0, 1, 1,
-2.315619, 0.1368386, -1.922505, 0, 0, 0, 1, 1,
-2.297595, 0.8812441, -0.3489719, 0, 0, 0, 1, 1,
-2.200089, 0.1984641, 0.09751367, 1, 1, 1, 1, 1,
-2.166459, -0.3285675, -0.8752401, 1, 1, 1, 1, 1,
-2.153733, 0.9444783, 0.02218712, 1, 1, 1, 1, 1,
-2.097897, 1.155564, -0.5115437, 1, 1, 1, 1, 1,
-2.076056, -0.5873109, -0.9825071, 1, 1, 1, 1, 1,
-2.058477, -1.276133, -0.5351533, 1, 1, 1, 1, 1,
-2.049438, 0.7526892, -1.731453, 1, 1, 1, 1, 1,
-2.020088, -0.3114373, -2.252523, 1, 1, 1, 1, 1,
-2.00747, 1.566801, -0.5736505, 1, 1, 1, 1, 1,
-1.98301, -1.579814, -2.570357, 1, 1, 1, 1, 1,
-1.893403, -0.07316949, -1.290031, 1, 1, 1, 1, 1,
-1.875564, 0.88875, -0.6814113, 1, 1, 1, 1, 1,
-1.84818, -1.982897, -1.974932, 1, 1, 1, 1, 1,
-1.812545, 0.4707972, -2.379036, 1, 1, 1, 1, 1,
-1.805542, -0.6301408, 0.1703231, 1, 1, 1, 1, 1,
-1.788096, -0.3503905, -4.326003, 0, 0, 1, 1, 1,
-1.77015, -0.3115943, -2.197661, 1, 0, 0, 1, 1,
-1.762567, -1.406859, -2.367643, 1, 0, 0, 1, 1,
-1.761923, -0.5165213, -0.7049702, 1, 0, 0, 1, 1,
-1.760091, 1.407235, 0.6057051, 1, 0, 0, 1, 1,
-1.756875, -0.002874897, 0.1391229, 1, 0, 0, 1, 1,
-1.754403, 1.645151, -0.9926964, 0, 0, 0, 1, 1,
-1.748585, 1.203195, -1.374928, 0, 0, 0, 1, 1,
-1.739844, -0.07747565, -1.283134, 0, 0, 0, 1, 1,
-1.738775, 1.088353, -0.05336715, 0, 0, 0, 1, 1,
-1.730014, 1.94232, -1.082986, 0, 0, 0, 1, 1,
-1.726646, -0.5033438, -1.650907, 0, 0, 0, 1, 1,
-1.714401, 0.8851206, -0.4745241, 0, 0, 0, 1, 1,
-1.688781, -0.0554243, 1.229351, 1, 1, 1, 1, 1,
-1.686069, -0.08076957, -3.137979, 1, 1, 1, 1, 1,
-1.675704, 0.28501, -1.246389, 1, 1, 1, 1, 1,
-1.664341, -1.549233, -1.533372, 1, 1, 1, 1, 1,
-1.646606, -1.531746, -2.526362, 1, 1, 1, 1, 1,
-1.640834, 0.4326739, -0.349064, 1, 1, 1, 1, 1,
-1.637727, -1.295962, -4.22761, 1, 1, 1, 1, 1,
-1.635004, 1.681947, -0.4686043, 1, 1, 1, 1, 1,
-1.628839, 1.20637, -0.7405676, 1, 1, 1, 1, 1,
-1.61559, 1.612473, -1.378615, 1, 1, 1, 1, 1,
-1.571249, -1.806213, -2.277648, 1, 1, 1, 1, 1,
-1.560125, 1.456814, -2.854457, 1, 1, 1, 1, 1,
-1.548559, -1.925639, -3.330819, 1, 1, 1, 1, 1,
-1.547346, -1.034479, -3.369053, 1, 1, 1, 1, 1,
-1.544367, 0.5200676, -2.365917, 1, 1, 1, 1, 1,
-1.543765, 2.418563, 0.362177, 0, 0, 1, 1, 1,
-1.53651, -0.9194683, -1.998482, 1, 0, 0, 1, 1,
-1.531302, 0.2098042, -0.7999325, 1, 0, 0, 1, 1,
-1.500877, -0.8240054, -1.396436, 1, 0, 0, 1, 1,
-1.498724, -0.166821, -2.006489, 1, 0, 0, 1, 1,
-1.496258, 0.02574098, -1.443791, 1, 0, 0, 1, 1,
-1.494835, -0.6561846, -2.226344, 0, 0, 0, 1, 1,
-1.478529, 0.03653758, -2.715212, 0, 0, 0, 1, 1,
-1.466937, -0.8281372, -2.51979, 0, 0, 0, 1, 1,
-1.455269, -1.363729, -3.536564, 0, 0, 0, 1, 1,
-1.446246, 0.7188551, -2.412728, 0, 0, 0, 1, 1,
-1.444465, 0.05446292, -1.700721, 0, 0, 0, 1, 1,
-1.441908, 2.083244, -0.624109, 0, 0, 0, 1, 1,
-1.432284, -0.08534361, -3.888044, 1, 1, 1, 1, 1,
-1.418558, -0.5964192, -0.6233542, 1, 1, 1, 1, 1,
-1.400482, -1.366503, -3.961335, 1, 1, 1, 1, 1,
-1.388531, 1.707172, -1.40811, 1, 1, 1, 1, 1,
-1.387553, -0.4862747, -0.8596286, 1, 1, 1, 1, 1,
-1.383693, 0.3444054, -0.2919883, 1, 1, 1, 1, 1,
-1.383137, -0.331871, -1.27376, 1, 1, 1, 1, 1,
-1.366848, -0.1276698, -2.385517, 1, 1, 1, 1, 1,
-1.366699, 0.2112709, -1.085349, 1, 1, 1, 1, 1,
-1.364168, -0.1998737, -2.137957, 1, 1, 1, 1, 1,
-1.361977, 1.248593, -0.7415092, 1, 1, 1, 1, 1,
-1.359072, -0.249192, -1.489004, 1, 1, 1, 1, 1,
-1.341881, -0.4477648, -2.296695, 1, 1, 1, 1, 1,
-1.341165, -0.354647, -2.99338, 1, 1, 1, 1, 1,
-1.339395, -0.301955, -1.589524, 1, 1, 1, 1, 1,
-1.330598, 1.513636, -0.4690087, 0, 0, 1, 1, 1,
-1.32751, 0.881492, -2.16276, 1, 0, 0, 1, 1,
-1.310256, 0.01786961, -2.60026, 1, 0, 0, 1, 1,
-1.307969, 0.2059383, -0.3896577, 1, 0, 0, 1, 1,
-1.304379, -1.82662, -2.245093, 1, 0, 0, 1, 1,
-1.301106, 0.814945, -0.2853733, 1, 0, 0, 1, 1,
-1.290679, 2.146822, -0.1095552, 0, 0, 0, 1, 1,
-1.290225, -0.9956128, -4.119297, 0, 0, 0, 1, 1,
-1.288401, -0.1416218, -2.382611, 0, 0, 0, 1, 1,
-1.274372, 0.6304697, -2.243932, 0, 0, 0, 1, 1,
-1.252082, -0.1432769, -1.42042, 0, 0, 0, 1, 1,
-1.251759, -0.9017516, -2.75782, 0, 0, 0, 1, 1,
-1.248986, -1.365743, -2.566974, 0, 0, 0, 1, 1,
-1.248709, -0.09811724, -2.248603, 1, 1, 1, 1, 1,
-1.247836, -1.654636, -3.005719, 1, 1, 1, 1, 1,
-1.247735, 0.428641, 1.292948, 1, 1, 1, 1, 1,
-1.245773, 0.7193632, -1.321934, 1, 1, 1, 1, 1,
-1.239439, 0.926116, -1.096357, 1, 1, 1, 1, 1,
-1.239078, -0.02607034, -3.047935, 1, 1, 1, 1, 1,
-1.235735, 1.176467, 0.4143147, 1, 1, 1, 1, 1,
-1.223468, 1.121497, -0.4911861, 1, 1, 1, 1, 1,
-1.217123, -0.6256979, -2.192419, 1, 1, 1, 1, 1,
-1.216599, 0.01085128, -0.3087455, 1, 1, 1, 1, 1,
-1.215518, 1.818022, 0.6766153, 1, 1, 1, 1, 1,
-1.214449, 0.5006808, -2.130299, 1, 1, 1, 1, 1,
-1.194569, -0.6136746, -1.787064, 1, 1, 1, 1, 1,
-1.193665, 0.03836367, -1.411868, 1, 1, 1, 1, 1,
-1.191698, -0.8905723, -3.625529, 1, 1, 1, 1, 1,
-1.184566, 0.5683749, -2.90128, 0, 0, 1, 1, 1,
-1.181525, -0.3183912, -0.8893946, 1, 0, 0, 1, 1,
-1.175666, 0.9296769, -0.2564672, 1, 0, 0, 1, 1,
-1.174718, 1.677334, -0.4944502, 1, 0, 0, 1, 1,
-1.154809, -2.240959, -2.217737, 1, 0, 0, 1, 1,
-1.153029, 0.6040324, 0.8113188, 1, 0, 0, 1, 1,
-1.152502, 0.9452304, -1.330955, 0, 0, 0, 1, 1,
-1.151712, -0.1889389, -0.6414592, 0, 0, 0, 1, 1,
-1.141835, 1.219234, -1.577681, 0, 0, 0, 1, 1,
-1.136537, 0.9036765, -2.089482, 0, 0, 0, 1, 1,
-1.13386, 1.281244, -1.181111, 0, 0, 0, 1, 1,
-1.130414, -0.1418345, -1.493243, 0, 0, 0, 1, 1,
-1.128167, -1.133105, -2.486575, 0, 0, 0, 1, 1,
-1.126201, 0.2507904, -0.9284689, 1, 1, 1, 1, 1,
-1.12485, -1.75146, -3.582473, 1, 1, 1, 1, 1,
-1.123066, -0.2683685, -1.271081, 1, 1, 1, 1, 1,
-1.122154, 1.240648, -1.630202, 1, 1, 1, 1, 1,
-1.120986, 0.3429281, -2.267803, 1, 1, 1, 1, 1,
-1.120685, 1.113993, -0.06123719, 1, 1, 1, 1, 1,
-1.120309, -0.6496108, -2.749977, 1, 1, 1, 1, 1,
-1.1117, 1.182007, -1.150218, 1, 1, 1, 1, 1,
-1.110592, -0.3580164, -1.357515, 1, 1, 1, 1, 1,
-1.110452, 0.2043929, -2.18368, 1, 1, 1, 1, 1,
-1.10704, 0.08652411, -1.227422, 1, 1, 1, 1, 1,
-1.09674, 2.335295, -0.8136918, 1, 1, 1, 1, 1,
-1.096291, 0.3658475, -1.938998, 1, 1, 1, 1, 1,
-1.092065, 1.585168, -1.626194, 1, 1, 1, 1, 1,
-1.088945, 1.30302, 0.3271448, 1, 1, 1, 1, 1,
-1.083148, -0.6747609, -0.8827269, 0, 0, 1, 1, 1,
-1.077095, -0.08203671, -1.59883, 1, 0, 0, 1, 1,
-1.074606, -1.29065, -2.845795, 1, 0, 0, 1, 1,
-1.071062, -1.453277, -3.303227, 1, 0, 0, 1, 1,
-1.065215, -0.1707224, -1.897647, 1, 0, 0, 1, 1,
-1.063673, -1.344223, -3.079786, 1, 0, 0, 1, 1,
-1.063252, -1.377491, -2.616837, 0, 0, 0, 1, 1,
-1.061566, -0.362623, -1.956553, 0, 0, 0, 1, 1,
-1.058485, -2.07728, -3.154951, 0, 0, 0, 1, 1,
-1.058105, 0.5076175, -2.398989, 0, 0, 0, 1, 1,
-1.057662, -0.1928656, -2.637625, 0, 0, 0, 1, 1,
-1.056422, -0.1699346, 0.02241409, 0, 0, 0, 1, 1,
-1.052737, -0.8133439, -1.747813, 0, 0, 0, 1, 1,
-1.052216, -1.433645, -3.129585, 1, 1, 1, 1, 1,
-1.043794, 1.020885, -0.9532623, 1, 1, 1, 1, 1,
-1.040459, -0.2578849, -1.537935, 1, 1, 1, 1, 1,
-1.034004, -0.155668, -1.151547, 1, 1, 1, 1, 1,
-1.031449, 0.1861006, -3.484041, 1, 1, 1, 1, 1,
-1.020047, -0.4100182, -1.349156, 1, 1, 1, 1, 1,
-1.018978, -0.3100157, 0.1713615, 1, 1, 1, 1, 1,
-1.014192, 0.1693167, -2.272178, 1, 1, 1, 1, 1,
-1.008725, -1.567083, -1.969925, 1, 1, 1, 1, 1,
-1.004987, 1.133317, -0.09220801, 1, 1, 1, 1, 1,
-1.002448, -0.506459, -2.473951, 1, 1, 1, 1, 1,
-1.00154, -1.014252, -1.354799, 1, 1, 1, 1, 1,
-0.9881026, 2.256502, -0.1096383, 1, 1, 1, 1, 1,
-0.9758332, -1.621715, -2.97636, 1, 1, 1, 1, 1,
-0.9730377, -0.2281711, -2.108403, 1, 1, 1, 1, 1,
-0.9617684, 1.602559, 0.6366329, 0, 0, 1, 1, 1,
-0.9569418, -1.685372, -2.222095, 1, 0, 0, 1, 1,
-0.9565157, -0.7638978, -2.76307, 1, 0, 0, 1, 1,
-0.9496145, -0.5585632, -1.76309, 1, 0, 0, 1, 1,
-0.9480065, 0.01500361, -2.356393, 1, 0, 0, 1, 1,
-0.9477736, -0.5055444, -0.4019037, 1, 0, 0, 1, 1,
-0.9432104, -1.488763, -2.018416, 0, 0, 0, 1, 1,
-0.9430287, -0.9532697, -1.231299, 0, 0, 0, 1, 1,
-0.922201, 1.328581, -1.843108, 0, 0, 0, 1, 1,
-0.9148635, -0.4947133, -2.682322, 0, 0, 0, 1, 1,
-0.9134701, 0.3599818, -1.471022, 0, 0, 0, 1, 1,
-0.9116504, -0.9007465, -2.867615, 0, 0, 0, 1, 1,
-0.9114252, -0.4159345, -1.592049, 0, 0, 0, 1, 1,
-0.9094466, 0.08837378, -0.05497221, 1, 1, 1, 1, 1,
-0.9086962, -0.35988, -3.106081, 1, 1, 1, 1, 1,
-0.9041126, -0.2946493, -1.114085, 1, 1, 1, 1, 1,
-0.8958684, -1.1129, -2.13077, 1, 1, 1, 1, 1,
-0.8933613, -0.7002418, -2.63203, 1, 1, 1, 1, 1,
-0.8918267, -0.1708786, -3.685755, 1, 1, 1, 1, 1,
-0.8832053, 1.14083, -0.8803657, 1, 1, 1, 1, 1,
-0.8792447, -0.5961068, -1.828175, 1, 1, 1, 1, 1,
-0.8707966, 0.1984312, -3.068006, 1, 1, 1, 1, 1,
-0.8636184, -0.8703858, -3.136508, 1, 1, 1, 1, 1,
-0.8585328, 1.193541, -0.3682314, 1, 1, 1, 1, 1,
-0.8558509, 0.9790353, -3.128747, 1, 1, 1, 1, 1,
-0.8466251, -1.321175, -0.5381464, 1, 1, 1, 1, 1,
-0.8349992, -0.2858127, -1.199806, 1, 1, 1, 1, 1,
-0.8303933, 1.144835, 0.4690183, 1, 1, 1, 1, 1,
-0.8268872, -0.2682705, -2.181081, 0, 0, 1, 1, 1,
-0.8229026, -1.274941, -1.90172, 1, 0, 0, 1, 1,
-0.821165, -1.159698, -3.710909, 1, 0, 0, 1, 1,
-0.8122239, -2.137732, -2.654713, 1, 0, 0, 1, 1,
-0.81221, -0.8241354, -2.260605, 1, 0, 0, 1, 1,
-0.8111237, 0.02740958, -0.3971669, 1, 0, 0, 1, 1,
-0.8062045, 0.4325079, -1.120329, 0, 0, 0, 1, 1,
-0.8050383, -0.6719823, -1.896527, 0, 0, 0, 1, 1,
-0.7999826, 0.7826409, -0.3437466, 0, 0, 0, 1, 1,
-0.7959867, -0.3522694, -0.1577642, 0, 0, 0, 1, 1,
-0.7822778, -1.063754, -2.390623, 0, 0, 0, 1, 1,
-0.7806576, 1.007429, -0.746156, 0, 0, 0, 1, 1,
-0.7804053, -0.04088851, -1.193415, 0, 0, 0, 1, 1,
-0.778885, 0.9028619, -0.8622318, 1, 1, 1, 1, 1,
-0.7780806, 0.01723574, -1.203542, 1, 1, 1, 1, 1,
-0.7693556, -0.7191373, -1.168592, 1, 1, 1, 1, 1,
-0.7687317, 0.06504253, -1.434766, 1, 1, 1, 1, 1,
-0.7667752, -0.09450058, -1.81855, 1, 1, 1, 1, 1,
-0.7577671, -1.607103, -4.009367, 1, 1, 1, 1, 1,
-0.7550591, 0.2961779, -1.043238, 1, 1, 1, 1, 1,
-0.751646, -0.09851898, -4.025787, 1, 1, 1, 1, 1,
-0.7434962, 0.6231111, -2.434708, 1, 1, 1, 1, 1,
-0.7418239, -1.046794, -1.80215, 1, 1, 1, 1, 1,
-0.7374486, -0.08311445, -4.047842, 1, 1, 1, 1, 1,
-0.7373297, -0.3198198, -2.550465, 1, 1, 1, 1, 1,
-0.7365306, 0.810838, -1.941526, 1, 1, 1, 1, 1,
-0.7307161, -0.4874151, -4.036819, 1, 1, 1, 1, 1,
-0.728949, -0.05697468, -2.149835, 1, 1, 1, 1, 1,
-0.7249864, -0.9459554, -2.4131, 0, 0, 1, 1, 1,
-0.7177135, -0.1844503, -1.740162, 1, 0, 0, 1, 1,
-0.7158854, -0.5894097, -2.204967, 1, 0, 0, 1, 1,
-0.7147267, 1.398333, 0.01013558, 1, 0, 0, 1, 1,
-0.7051376, -1.682541, -3.545721, 1, 0, 0, 1, 1,
-0.6988564, -0.2960691, -2.049531, 1, 0, 0, 1, 1,
-0.6972245, -0.4371576, -1.450623, 0, 0, 0, 1, 1,
-0.6902843, -1.634775, -0.5906671, 0, 0, 0, 1, 1,
-0.6868534, -0.5193956, -2.254368, 0, 0, 0, 1, 1,
-0.6868125, 0.1531476, -2.071552, 0, 0, 0, 1, 1,
-0.6853226, 2.076351, 0.2067484, 0, 0, 0, 1, 1,
-0.679774, -0.1530878, -1.896393, 0, 0, 0, 1, 1,
-0.6796853, 0.3351744, -0.6023787, 0, 0, 0, 1, 1,
-0.6747683, 0.6204021, -0.5827115, 1, 1, 1, 1, 1,
-0.6723416, -0.06966283, -4.143038, 1, 1, 1, 1, 1,
-0.667028, -0.4565018, -4.090294, 1, 1, 1, 1, 1,
-0.6661504, -0.04541356, -2.672169, 1, 1, 1, 1, 1,
-0.6508273, 0.2893468, -1.073507, 1, 1, 1, 1, 1,
-0.645426, -0.766115, -3.092537, 1, 1, 1, 1, 1,
-0.6442894, 0.01532513, -1.546439, 1, 1, 1, 1, 1,
-0.6419154, 0.2869449, -2.49571, 1, 1, 1, 1, 1,
-0.636808, -2.322066, -4.269825, 1, 1, 1, 1, 1,
-0.6340916, -1.162136, -3.619059, 1, 1, 1, 1, 1,
-0.6327214, 1.999078, 0.307763, 1, 1, 1, 1, 1,
-0.6274742, 0.6851107, 0.3812735, 1, 1, 1, 1, 1,
-0.623402, -0.4636109, -4.394622, 1, 1, 1, 1, 1,
-0.6227068, 0.08232332, -3.330863, 1, 1, 1, 1, 1,
-0.6196737, 1.73184, -1.162417, 1, 1, 1, 1, 1,
-0.6183126, -1.987757, -1.540671, 0, 0, 1, 1, 1,
-0.61672, 1.105833, -1.857666, 1, 0, 0, 1, 1,
-0.6138723, -2.26173, -1.437082, 1, 0, 0, 1, 1,
-0.6109235, -0.2431194, -4.598299, 1, 0, 0, 1, 1,
-0.6058131, 0.7494642, -0.7647817, 1, 0, 0, 1, 1,
-0.604993, -0.1746028, -2.298651, 1, 0, 0, 1, 1,
-0.6022331, 0.07731338, -0.1436207, 0, 0, 0, 1, 1,
-0.5987763, -1.696608, -4.300456, 0, 0, 0, 1, 1,
-0.5968114, -0.56999, -1.884709, 0, 0, 0, 1, 1,
-0.5869751, 0.2688971, 1.01369, 0, 0, 0, 1, 1,
-0.5859591, -0.5608586, -2.307439, 0, 0, 0, 1, 1,
-0.584524, -1.229113, -0.8515872, 0, 0, 0, 1, 1,
-0.5820023, -0.1908625, 0.7374987, 0, 0, 0, 1, 1,
-0.5773184, 1.614528, 0.3699757, 1, 1, 1, 1, 1,
-0.577163, -0.1938314, -1.344555, 1, 1, 1, 1, 1,
-0.5766417, -1.817242, -4.426389, 1, 1, 1, 1, 1,
-0.5763378, 1.153171, -0.7334765, 1, 1, 1, 1, 1,
-0.5732054, 0.2246579, -1.890755, 1, 1, 1, 1, 1,
-0.5672439, -0.671402, -2.812957, 1, 1, 1, 1, 1,
-0.5670773, 0.8523902, -0.4628966, 1, 1, 1, 1, 1,
-0.5649244, 0.295456, -1.144695, 1, 1, 1, 1, 1,
-0.5636537, -0.5975459, -3.771351, 1, 1, 1, 1, 1,
-0.5605351, 0.7435371, -3.251813, 1, 1, 1, 1, 1,
-0.5577855, -0.1159917, -2.051023, 1, 1, 1, 1, 1,
-0.5575849, 1.033675, -2.059064, 1, 1, 1, 1, 1,
-0.5551066, -0.469203, -2.242519, 1, 1, 1, 1, 1,
-0.5448114, 2.124945, -0.880696, 1, 1, 1, 1, 1,
-0.5444682, 0.03559427, -1.815718, 1, 1, 1, 1, 1,
-0.5432228, -0.6223245, -2.688777, 0, 0, 1, 1, 1,
-0.5430425, 1.597548, -2.500091, 1, 0, 0, 1, 1,
-0.5398233, 0.7935098, -0.7387915, 1, 0, 0, 1, 1,
-0.5393788, 0.5106829, -1.234941, 1, 0, 0, 1, 1,
-0.5379341, 1.639692, 1.357962, 1, 0, 0, 1, 1,
-0.531048, 0.9493194, -0.5191379, 1, 0, 0, 1, 1,
-0.5297769, -1.502861, -2.757024, 0, 0, 0, 1, 1,
-0.5292573, -2.490431, -3.335951, 0, 0, 0, 1, 1,
-0.5290297, 0.852983, -0.1353435, 0, 0, 0, 1, 1,
-0.528634, -0.5431794, -1.392965, 0, 0, 0, 1, 1,
-0.5246352, -0.2704324, -1.351777, 0, 0, 0, 1, 1,
-0.5238858, 1.529702, -1.410998, 0, 0, 0, 1, 1,
-0.5202786, 0.6964173, -2.036154, 0, 0, 0, 1, 1,
-0.5194654, -1.234405, -2.874686, 1, 1, 1, 1, 1,
-0.5150152, -2.040035, -3.212404, 1, 1, 1, 1, 1,
-0.5141553, -1.896039, -3.160551, 1, 1, 1, 1, 1,
-0.513688, -1.136922, -3.259549, 1, 1, 1, 1, 1,
-0.5116447, -0.0816249, -1.184389, 1, 1, 1, 1, 1,
-0.5076945, 0.4840301, -0.02100878, 1, 1, 1, 1, 1,
-0.5053496, -1.181347, -2.464558, 1, 1, 1, 1, 1,
-0.5022028, 0.5911071, -1.150528, 1, 1, 1, 1, 1,
-0.4885352, -0.2950507, -3.212182, 1, 1, 1, 1, 1,
-0.4836031, -0.2670181, -1.79284, 1, 1, 1, 1, 1,
-0.4754846, 0.9627366, -1.425821, 1, 1, 1, 1, 1,
-0.475053, -0.1817157, -2.372207, 1, 1, 1, 1, 1,
-0.4629102, -0.5523761, -2.783102, 1, 1, 1, 1, 1,
-0.4574056, -0.281477, -1.949478, 1, 1, 1, 1, 1,
-0.457272, 0.08916733, -2.428183, 1, 1, 1, 1, 1,
-0.4559058, 2.329317, -1.971236, 0, 0, 1, 1, 1,
-0.4517554, -1.844929, -2.60412, 1, 0, 0, 1, 1,
-0.4492505, -0.948193, -3.997517, 1, 0, 0, 1, 1,
-0.4488476, 0.8255036, -1.284641, 1, 0, 0, 1, 1,
-0.4488165, 0.9623401, 0.8965246, 1, 0, 0, 1, 1,
-0.4479547, 1.319198, -1.150956, 1, 0, 0, 1, 1,
-0.4428244, 0.4772567, -0.1001986, 0, 0, 0, 1, 1,
-0.442166, -1.10548, -4.013377, 0, 0, 0, 1, 1,
-0.4414657, 0.1792041, -0.1976855, 0, 0, 0, 1, 1,
-0.4396516, 0.4932545, -1.376752, 0, 0, 0, 1, 1,
-0.4395527, -2.398015, -1.920424, 0, 0, 0, 1, 1,
-0.4390385, 0.2739584, -1.510604, 0, 0, 0, 1, 1,
-0.4347251, 0.9382129, -1.448334, 0, 0, 0, 1, 1,
-0.4315232, 0.5023958, -0.8081667, 1, 1, 1, 1, 1,
-0.4303726, -0.881044, -2.034577, 1, 1, 1, 1, 1,
-0.427961, 0.8182997, -0.4041656, 1, 1, 1, 1, 1,
-0.4227985, 0.1460965, -0.7447398, 1, 1, 1, 1, 1,
-0.4210801, -1.741227, -3.321712, 1, 1, 1, 1, 1,
-0.4166764, 1.336468, 0.3137978, 1, 1, 1, 1, 1,
-0.4162052, -0.9707251, -2.797202, 1, 1, 1, 1, 1,
-0.4139658, -1.283736, -3.083191, 1, 1, 1, 1, 1,
-0.4128757, 0.2249961, -4.00087, 1, 1, 1, 1, 1,
-0.4098202, -0.6081637, -1.50111, 1, 1, 1, 1, 1,
-0.4087466, 0.8849913, -0.1063759, 1, 1, 1, 1, 1,
-0.4057178, 0.150651, -2.013083, 1, 1, 1, 1, 1,
-0.4033763, 0.8273051, 0.1262016, 1, 1, 1, 1, 1,
-0.4027748, -1.159943, -5.326859, 1, 1, 1, 1, 1,
-0.4023971, -2.691935, -4.538291, 1, 1, 1, 1, 1,
-0.4016362, 0.4273704, -1.665858, 0, 0, 1, 1, 1,
-0.3959455, -0.8852625, -0.1955812, 1, 0, 0, 1, 1,
-0.3887882, -0.8413602, -3.141971, 1, 0, 0, 1, 1,
-0.3879977, -1.332615, -3.540807, 1, 0, 0, 1, 1,
-0.386415, 0.5326956, 0.343916, 1, 0, 0, 1, 1,
-0.3840359, 1.421406, -1.74765, 1, 0, 0, 1, 1,
-0.3821909, -0.6657382, -4.026586, 0, 0, 0, 1, 1,
-0.373242, -0.8363826, -2.658297, 0, 0, 0, 1, 1,
-0.3707843, 0.723823, 0.5605627, 0, 0, 0, 1, 1,
-0.3683324, 1.506746, -0.04775437, 0, 0, 0, 1, 1,
-0.3681442, -2.32466, -2.512075, 0, 0, 0, 1, 1,
-0.3675435, 0.2210083, -0.9889575, 0, 0, 0, 1, 1,
-0.355453, -0.9900556, -2.521698, 0, 0, 0, 1, 1,
-0.3545192, -1.333774, -3.421761, 1, 1, 1, 1, 1,
-0.3538725, -2.595076, -5.133675, 1, 1, 1, 1, 1,
-0.3536315, -0.1700925, -2.255378, 1, 1, 1, 1, 1,
-0.3523436, 0.2139299, -1.580403, 1, 1, 1, 1, 1,
-0.3518311, -0.2121577, -2.976587, 1, 1, 1, 1, 1,
-0.3485247, 0.764713, -1.604689, 1, 1, 1, 1, 1,
-0.3427962, -0.5414337, -2.361595, 1, 1, 1, 1, 1,
-0.3388451, 1.477172, 0.4617909, 1, 1, 1, 1, 1,
-0.3363199, 1.411301, 0.00252082, 1, 1, 1, 1, 1,
-0.3356348, -1.012363, -4.214833, 1, 1, 1, 1, 1,
-0.3328721, 2.203136, 1.005015, 1, 1, 1, 1, 1,
-0.332392, 0.5607091, -1.224003, 1, 1, 1, 1, 1,
-0.3320298, -1.335688, -3.154789, 1, 1, 1, 1, 1,
-0.3281721, 1.212793, 0.8478659, 1, 1, 1, 1, 1,
-0.326561, 0.3395231, -1.399359, 1, 1, 1, 1, 1,
-0.3259314, 1.368779, -1.456524, 0, 0, 1, 1, 1,
-0.325095, 0.2669342, -1.847008, 1, 0, 0, 1, 1,
-0.3236676, -0.05073083, 0.290194, 1, 0, 0, 1, 1,
-0.3233829, 1.220982, -0.9183392, 1, 0, 0, 1, 1,
-0.3223017, 0.5265679, -2.011451, 1, 0, 0, 1, 1,
-0.3128275, -0.9114847, -3.289986, 1, 0, 0, 1, 1,
-0.310711, 0.6423221, 0.07152306, 0, 0, 0, 1, 1,
-0.3098162, 0.8330006, -0.4638792, 0, 0, 0, 1, 1,
-0.3088156, 0.1624011, -0.9331019, 0, 0, 0, 1, 1,
-0.3081674, -0.2649584, -1.974113, 0, 0, 0, 1, 1,
-0.3080168, 0.2807131, -2.395068, 0, 0, 0, 1, 1,
-0.3064192, 0.6593686, -1.364444, 0, 0, 0, 1, 1,
-0.3058161, -0.4479119, -2.922852, 0, 0, 0, 1, 1,
-0.3043234, 0.3070035, -1.146435, 1, 1, 1, 1, 1,
-0.3011501, -0.4670484, -1.435105, 1, 1, 1, 1, 1,
-0.299984, 0.2893812, 0.1259159, 1, 1, 1, 1, 1,
-0.296884, -0.3613349, -1.974079, 1, 1, 1, 1, 1,
-0.2964592, -0.9324423, -2.032988, 1, 1, 1, 1, 1,
-0.2936255, -1.597331, -2.700545, 1, 1, 1, 1, 1,
-0.2878095, -0.8094397, -3.711785, 1, 1, 1, 1, 1,
-0.2857718, -0.1555478, -0.1469862, 1, 1, 1, 1, 1,
-0.2791623, 0.9015626, -0.8615972, 1, 1, 1, 1, 1,
-0.2661233, 0.9017196, 0.5546352, 1, 1, 1, 1, 1,
-0.2581752, 0.1128855, -1.51734, 1, 1, 1, 1, 1,
-0.2579417, 0.3737999, -2.619888, 1, 1, 1, 1, 1,
-0.2564823, 0.5060906, -0.2653409, 1, 1, 1, 1, 1,
-0.2563406, -1.226004, -3.93191, 1, 1, 1, 1, 1,
-0.2545007, 0.9820282, 0.6632678, 1, 1, 1, 1, 1,
-0.2496478, 1.254838, -0.1753982, 0, 0, 1, 1, 1,
-0.2488302, 0.04516067, -0.9694468, 1, 0, 0, 1, 1,
-0.2480263, 0.3670406, -1.939736, 1, 0, 0, 1, 1,
-0.246792, -0.2097538, -3.291229, 1, 0, 0, 1, 1,
-0.2413699, 0.1112517, -0.4151296, 1, 0, 0, 1, 1,
-0.2405861, 0.9098434, -0.9922754, 1, 0, 0, 1, 1,
-0.2377751, -0.7186003, -3.325131, 0, 0, 0, 1, 1,
-0.2377273, 1.437886, -0.8325679, 0, 0, 0, 1, 1,
-0.2265622, 0.2798911, 0.1865817, 0, 0, 0, 1, 1,
-0.2247028, 1.30714, 0.4149549, 0, 0, 0, 1, 1,
-0.222594, -0.4433216, -2.716792, 0, 0, 0, 1, 1,
-0.2185214, 0.4842184, -0.05279083, 0, 0, 0, 1, 1,
-0.2171006, 0.9851498, 1.15207, 0, 0, 0, 1, 1,
-0.2156192, 0.2147371, -0.5729162, 1, 1, 1, 1, 1,
-0.2142477, 1.35435, 0.2835843, 1, 1, 1, 1, 1,
-0.2138502, -0.6337928, -2.79864, 1, 1, 1, 1, 1,
-0.213402, -0.3567911, -3.127717, 1, 1, 1, 1, 1,
-0.2129679, 1.008112, -1.202239, 1, 1, 1, 1, 1,
-0.2025339, -0.1059319, -2.3776, 1, 1, 1, 1, 1,
-0.2012295, -1.01898, -1.933233, 1, 1, 1, 1, 1,
-0.2010499, -0.8624055, -2.5262, 1, 1, 1, 1, 1,
-0.1992298, -0.1993144, 0.06637844, 1, 1, 1, 1, 1,
-0.1974588, 1.868816, 0.3826886, 1, 1, 1, 1, 1,
-0.1948179, -0.2898225, -1.468909, 1, 1, 1, 1, 1,
-0.1939574, -0.5002258, -3.363752, 1, 1, 1, 1, 1,
-0.1914915, -0.12404, -3.641965, 1, 1, 1, 1, 1,
-0.190793, 0.1067277, -1.281255, 1, 1, 1, 1, 1,
-0.1888329, -0.5065712, -3.486636, 1, 1, 1, 1, 1,
-0.1844324, 1.121794, -1.185056, 0, 0, 1, 1, 1,
-0.1841169, -0.1812451, 0.2485181, 1, 0, 0, 1, 1,
-0.1811448, -0.6580463, -3.831349, 1, 0, 0, 1, 1,
-0.1781878, -0.1514656, -2.343163, 1, 0, 0, 1, 1,
-0.17375, -0.1094877, -2.898447, 1, 0, 0, 1, 1,
-0.1726661, -0.3409659, -2.565453, 1, 0, 0, 1, 1,
-0.1698934, -0.5012884, -3.97383, 0, 0, 0, 1, 1,
-0.1680188, -0.4228179, -1.860865, 0, 0, 0, 1, 1,
-0.1674892, -0.2227812, -3.474925, 0, 0, 0, 1, 1,
-0.167233, 1.206615, 1.401798, 0, 0, 0, 1, 1,
-0.1633701, -1.34256, -2.380326, 0, 0, 0, 1, 1,
-0.1579782, -1.349332, -1.83293, 0, 0, 0, 1, 1,
-0.1567782, -0.2478441, -3.794747, 0, 0, 0, 1, 1,
-0.15323, -0.9610093, -3.619447, 1, 1, 1, 1, 1,
-0.1526018, -0.4480636, -2.223356, 1, 1, 1, 1, 1,
-0.1525388, 0.1746761, 0.5857751, 1, 1, 1, 1, 1,
-0.1480766, 0.4071357, -0.04639383, 1, 1, 1, 1, 1,
-0.1446694, -0.1973293, -1.891621, 1, 1, 1, 1, 1,
-0.1400713, 0.5898874, 1.641207, 1, 1, 1, 1, 1,
-0.137972, -0.1321918, -2.329562, 1, 1, 1, 1, 1,
-0.1379046, -0.8851966, -2.416814, 1, 1, 1, 1, 1,
-0.1369455, -0.8869722, -2.865276, 1, 1, 1, 1, 1,
-0.1330952, -1.014778, -5.187517, 1, 1, 1, 1, 1,
-0.1319121, -1.528479, -2.976137, 1, 1, 1, 1, 1,
-0.1306932, 0.6866864, -0.8191321, 1, 1, 1, 1, 1,
-0.1304442, -1.192512, -3.252477, 1, 1, 1, 1, 1,
-0.1303795, 1.233522, 0.3205656, 1, 1, 1, 1, 1,
-0.1246623, 0.6934025, -0.3160299, 1, 1, 1, 1, 1,
-0.1244756, -0.2413704, -3.512696, 0, 0, 1, 1, 1,
-0.1237917, -0.783666, -3.181961, 1, 0, 0, 1, 1,
-0.1186814, 0.2024549, -0.7945384, 1, 0, 0, 1, 1,
-0.1178693, -0.9348732, -1.862835, 1, 0, 0, 1, 1,
-0.1159336, -0.1309379, -3.138973, 1, 0, 0, 1, 1,
-0.1129244, -1.05201, -2.393911, 1, 0, 0, 1, 1,
-0.1101981, 1.360661, 1.24055, 0, 0, 0, 1, 1,
-0.1088938, -0.7978694, -0.3036097, 0, 0, 0, 1, 1,
-0.1075216, 0.4485988, -0.2919573, 0, 0, 0, 1, 1,
-0.105217, 0.9474133, -0.6236572, 0, 0, 0, 1, 1,
-0.1049966, 0.984842, 0.3056746, 0, 0, 0, 1, 1,
-0.1034928, 1.672194, 0.3460456, 0, 0, 0, 1, 1,
-0.09855568, 1.9125, 0.1491381, 0, 0, 0, 1, 1,
-0.09790166, 0.5290668, 0.1214243, 1, 1, 1, 1, 1,
-0.09606099, 0.5121653, 0.4945863, 1, 1, 1, 1, 1,
-0.09586871, -0.2186541, -3.289417, 1, 1, 1, 1, 1,
-0.09402955, 0.983799, -0.5459433, 1, 1, 1, 1, 1,
-0.09268907, 0.2958571, -0.9133873, 1, 1, 1, 1, 1,
-0.08818603, -1.111348, -2.079346, 1, 1, 1, 1, 1,
-0.08771731, -0.4793563, -2.619488, 1, 1, 1, 1, 1,
-0.08635803, 0.2168825, 2.059212, 1, 1, 1, 1, 1,
-0.08506805, -0.8506472, -2.155082, 1, 1, 1, 1, 1,
-0.08384921, 0.5413874, 0.1398499, 1, 1, 1, 1, 1,
-0.08263937, 0.7904262, 0.8912927, 1, 1, 1, 1, 1,
-0.08239969, 1.266355, 0.842566, 1, 1, 1, 1, 1,
-0.08017507, -1.788117, -2.02368, 1, 1, 1, 1, 1,
-0.07028267, 0.9965837, 0.5974276, 1, 1, 1, 1, 1,
-0.06813212, -0.8780097, -4.525917, 1, 1, 1, 1, 1,
-0.0658002, 0.07608358, -0.4085381, 0, 0, 1, 1, 1,
-0.05948959, -1.238577, -2.712312, 1, 0, 0, 1, 1,
-0.05932401, 0.373513, 0.6137787, 1, 0, 0, 1, 1,
-0.05557483, -0.7405315, -2.402378, 1, 0, 0, 1, 1,
-0.05518605, -0.1769321, -2.036624, 1, 0, 0, 1, 1,
-0.05088373, -0.6049145, -3.939276, 1, 0, 0, 1, 1,
-0.04488831, 0.6083873, -1.341639, 0, 0, 0, 1, 1,
-0.04289433, -1.172561, -4.761218, 0, 0, 0, 1, 1,
-0.03700811, -1.280373, -3.057397, 0, 0, 0, 1, 1,
-0.03638508, -1.245079, -2.884349, 0, 0, 0, 1, 1,
-0.0342119, -1.507032, -4.07242, 0, 0, 0, 1, 1,
-0.03049585, 0.5502782, -1.033149, 0, 0, 0, 1, 1,
-0.03032348, -0.4075286, -4.142741, 0, 0, 0, 1, 1,
-0.02961194, -0.6634412, -3.197814, 1, 1, 1, 1, 1,
-0.028336, -0.04441375, -3.164299, 1, 1, 1, 1, 1,
-0.01275764, 1.707182, 1.110732, 1, 1, 1, 1, 1,
-0.01129475, 2.369943, -0.5085564, 1, 1, 1, 1, 1,
-0.004888664, -0.05261083, -2.513116, 1, 1, 1, 1, 1,
-0.004076519, 1.349834, 0.1402007, 1, 1, 1, 1, 1,
0.0008092594, -1.145332, 3.204502, 1, 1, 1, 1, 1,
0.001845738, -0.6590706, 3.253684, 1, 1, 1, 1, 1,
0.00287457, -0.6588841, 2.16452, 1, 1, 1, 1, 1,
0.003290362, -0.969293, 3.518734, 1, 1, 1, 1, 1,
0.01210654, -2.511571, 3.813962, 1, 1, 1, 1, 1,
0.01269022, 0.02885387, 0.04549245, 1, 1, 1, 1, 1,
0.01923404, -0.138412, 2.349043, 1, 1, 1, 1, 1,
0.02155088, -0.020141, 0.5440832, 1, 1, 1, 1, 1,
0.0232547, -0.693214, 2.909525, 1, 1, 1, 1, 1,
0.02469949, -1.771334, 4.218124, 0, 0, 1, 1, 1,
0.02512583, -1.053626, 1.688713, 1, 0, 0, 1, 1,
0.02564198, -0.3345405, 3.658201, 1, 0, 0, 1, 1,
0.02840025, -1.218322, 3.872266, 1, 0, 0, 1, 1,
0.03234152, -1.06432, 2.593554, 1, 0, 0, 1, 1,
0.03505875, -0.8481985, 2.878025, 1, 0, 0, 1, 1,
0.0352831, 0.3007373, -2.68635, 0, 0, 0, 1, 1,
0.03745809, 0.2107868, -0.7080786, 0, 0, 0, 1, 1,
0.0380663, -2.1824, 3.500237, 0, 0, 0, 1, 1,
0.0408657, 1.478325, 1.71144, 0, 0, 0, 1, 1,
0.04841983, 1.257305, 1.485207, 0, 0, 0, 1, 1,
0.05077456, -0.85339, 2.445411, 0, 0, 0, 1, 1,
0.05110872, 0.8089051, -2.14215, 0, 0, 0, 1, 1,
0.05158119, 0.847551, 1.012304, 1, 1, 1, 1, 1,
0.05162488, 0.8031183, 0.90104, 1, 1, 1, 1, 1,
0.05310924, -0.06719274, 1.952729, 1, 1, 1, 1, 1,
0.05412194, 0.7061754, 0.4832056, 1, 1, 1, 1, 1,
0.05649662, -0.8658653, 3.172793, 1, 1, 1, 1, 1,
0.06123482, -0.5139177, 3.515078, 1, 1, 1, 1, 1,
0.0616839, -2.330346, 3.656913, 1, 1, 1, 1, 1,
0.06225898, -0.3464508, 2.005892, 1, 1, 1, 1, 1,
0.06265532, 0.006583363, 2.05841, 1, 1, 1, 1, 1,
0.06512425, 1.054444, 0.9129201, 1, 1, 1, 1, 1,
0.06744926, 1.407872, 0.3301041, 1, 1, 1, 1, 1,
0.06872382, -0.273432, 4.020772, 1, 1, 1, 1, 1,
0.07072056, -0.1235866, 2.461432, 1, 1, 1, 1, 1,
0.07072802, 0.8809487, 0.7325225, 1, 1, 1, 1, 1,
0.07264706, 2.060368, -0.1316791, 1, 1, 1, 1, 1,
0.07342395, 1.319325, -1.470506, 0, 0, 1, 1, 1,
0.07509928, -0.01170296, 1.275525, 1, 0, 0, 1, 1,
0.07644806, -0.08743577, 3.153652, 1, 0, 0, 1, 1,
0.08049802, 0.5269977, 1.681422, 1, 0, 0, 1, 1,
0.08725139, -1.056098, 3.194838, 1, 0, 0, 1, 1,
0.08986772, -1.53987, 3.00809, 1, 0, 0, 1, 1,
0.08991551, -1.019166, 0.3238147, 0, 0, 0, 1, 1,
0.09264652, 0.1739556, 0.91289, 0, 0, 0, 1, 1,
0.0928378, 0.7278062, 0.5745469, 0, 0, 0, 1, 1,
0.09311432, 0.9528812, 0.9733385, 0, 0, 0, 1, 1,
0.0965219, 0.08177838, 1.678766, 0, 0, 0, 1, 1,
0.1005782, 0.4045013, 1.221496, 0, 0, 0, 1, 1,
0.1008681, -0.3715329, 1.489424, 0, 0, 0, 1, 1,
0.1035786, -0.369309, 1.813544, 1, 1, 1, 1, 1,
0.1042896, 0.5842414, -0.7921561, 1, 1, 1, 1, 1,
0.1061262, 0.4107228, 2.776594, 1, 1, 1, 1, 1,
0.1062645, -1.385783, 3.349192, 1, 1, 1, 1, 1,
0.1074726, 0.02252312, 0.04736482, 1, 1, 1, 1, 1,
0.1162513, 1.712574, -0.3203438, 1, 1, 1, 1, 1,
0.1186428, 0.3504761, 0.1575367, 1, 1, 1, 1, 1,
0.1197634, -0.9248413, 5.18265, 1, 1, 1, 1, 1,
0.1199469, 0.02430869, 1.630834, 1, 1, 1, 1, 1,
0.1234016, 0.975055, 1.208842, 1, 1, 1, 1, 1,
0.1238854, 2.084563, -1.116246, 1, 1, 1, 1, 1,
0.1247809, 0.6605986, -0.3796686, 1, 1, 1, 1, 1,
0.1252304, -0.6270443, 2.988631, 1, 1, 1, 1, 1,
0.1267401, 0.03342665, 1.922658, 1, 1, 1, 1, 1,
0.1288803, 0.1253218, 1.762029, 1, 1, 1, 1, 1,
0.1306556, -0.6387085, 2.757506, 0, 0, 1, 1, 1,
0.137688, 1.882972, -0.738901, 1, 0, 0, 1, 1,
0.1381777, 1.408538, 0.2615548, 1, 0, 0, 1, 1,
0.1423143, 0.3727221, 1.560671, 1, 0, 0, 1, 1,
0.1500812, -2.018827, 3.836817, 1, 0, 0, 1, 1,
0.1513514, 0.3302897, 0.2557201, 1, 0, 0, 1, 1,
0.1530597, 0.8743627, -1.100266, 0, 0, 0, 1, 1,
0.1531059, -1.342356, 2.735174, 0, 0, 0, 1, 1,
0.1548258, 1.864505, -1.500623, 0, 0, 0, 1, 1,
0.155304, -0.5314735, 3.486537, 0, 0, 0, 1, 1,
0.1563432, -1.818674, 3.292867, 0, 0, 0, 1, 1,
0.1593777, 2.155699, -1.234129, 0, 0, 0, 1, 1,
0.1684988, -0.7099499, 1.40988, 0, 0, 0, 1, 1,
0.1712978, 1.095293, -0.4324919, 1, 1, 1, 1, 1,
0.1733864, 1.027754, 0.1951095, 1, 1, 1, 1, 1,
0.1742451, -1.013118, 1.834974, 1, 1, 1, 1, 1,
0.1756719, 0.6059572, 1.03484, 1, 1, 1, 1, 1,
0.1764491, 0.2687263, 1.950721, 1, 1, 1, 1, 1,
0.1781315, 0.9961108, 0.06515396, 1, 1, 1, 1, 1,
0.1789512, -1.04412, 3.742175, 1, 1, 1, 1, 1,
0.18023, 0.356265, -0.250864, 1, 1, 1, 1, 1,
0.1832762, -0.1977981, -0.2589553, 1, 1, 1, 1, 1,
0.1853049, 0.3668858, 2.100608, 1, 1, 1, 1, 1,
0.1866641, 0.4220292, 0.503826, 1, 1, 1, 1, 1,
0.1875747, 0.6881419, -0.7802281, 1, 1, 1, 1, 1,
0.1884711, -0.5848131, 2.28266, 1, 1, 1, 1, 1,
0.1935625, 1.248811, -0.7960181, 1, 1, 1, 1, 1,
0.1945244, 0.4059057, -1.872297, 1, 1, 1, 1, 1,
0.1957753, -2.143865, 2.38764, 0, 0, 1, 1, 1,
0.2015953, -0.8024064, 3.357477, 1, 0, 0, 1, 1,
0.2016283, -0.1010191, 0.5196543, 1, 0, 0, 1, 1,
0.2112038, 0.2749541, 1.413979, 1, 0, 0, 1, 1,
0.2190834, -0.9969071, 3.834093, 1, 0, 0, 1, 1,
0.2286129, -0.2884263, 2.814183, 1, 0, 0, 1, 1,
0.2334144, -1.2072, 4.687751, 0, 0, 0, 1, 1,
0.2369293, -2.145418, 4.188306, 0, 0, 0, 1, 1,
0.2403179, 0.2008723, 1.61524, 0, 0, 0, 1, 1,
0.2411708, 0.07755259, 2.543894, 0, 0, 0, 1, 1,
0.2459475, 0.9121937, 1.567406, 0, 0, 0, 1, 1,
0.2515858, -0.7182131, 3.004427, 0, 0, 0, 1, 1,
0.255252, -0.6548463, 3.13473, 0, 0, 0, 1, 1,
0.2614153, -0.03423373, 3.016992, 1, 1, 1, 1, 1,
0.2654693, -0.2185861, 2.589822, 1, 1, 1, 1, 1,
0.2754746, -0.3944424, 1.154839, 1, 1, 1, 1, 1,
0.2757083, 2.142584, 1.702434, 1, 1, 1, 1, 1,
0.277744, 0.744845, 1.312224, 1, 1, 1, 1, 1,
0.277797, -0.8248696, 3.528348, 1, 1, 1, 1, 1,
0.2784809, 0.4917133, -0.1091856, 1, 1, 1, 1, 1,
0.2818962, -1.037606, 2.122709, 1, 1, 1, 1, 1,
0.2835992, -0.2488879, 1.473459, 1, 1, 1, 1, 1,
0.2846781, -1.203256, 2.359582, 1, 1, 1, 1, 1,
0.285658, 1.038981, -0.05581069, 1, 1, 1, 1, 1,
0.2918513, -0.9025252, 2.49844, 1, 1, 1, 1, 1,
0.2947845, -0.05844139, 0.6051991, 1, 1, 1, 1, 1,
0.2950032, 0.2232573, -0.0006313735, 1, 1, 1, 1, 1,
0.2989856, -0.60128, 3.327394, 1, 1, 1, 1, 1,
0.3027681, 1.982736, 1.095523, 0, 0, 1, 1, 1,
0.3056543, 0.77208, 1.707134, 1, 0, 0, 1, 1,
0.3096701, -1.127925, 4.399648, 1, 0, 0, 1, 1,
0.3101829, 0.2163637, 1.323356, 1, 0, 0, 1, 1,
0.3123967, -0.211575, 3.897269, 1, 0, 0, 1, 1,
0.313451, -0.5779729, 4.183303, 1, 0, 0, 1, 1,
0.3142942, -1.828719, 2.056636, 0, 0, 0, 1, 1,
0.316592, 2.279143, -1.035994, 0, 0, 0, 1, 1,
0.3204052, 0.2461374, 0.7450376, 0, 0, 0, 1, 1,
0.3205363, -0.2754927, 1.184915, 0, 0, 0, 1, 1,
0.3296784, 0.4689977, -0.5358506, 0, 0, 0, 1, 1,
0.3331903, -0.4102532, 3.00341, 0, 0, 0, 1, 1,
0.3388383, 0.2097447, -0.2035447, 0, 0, 0, 1, 1,
0.3417577, -0.05659583, 2.44054, 1, 1, 1, 1, 1,
0.344169, -0.5355256, 4.781524, 1, 1, 1, 1, 1,
0.3459243, -1.294843, 1.461468, 1, 1, 1, 1, 1,
0.3532973, -1.068561, 1.918832, 1, 1, 1, 1, 1,
0.3533722, -0.2669701, 2.44079, 1, 1, 1, 1, 1,
0.3545024, -0.6132848, 2.999954, 1, 1, 1, 1, 1,
0.3561665, -0.2111111, 2.655535, 1, 1, 1, 1, 1,
0.3585317, 0.02014885, 2.151649, 1, 1, 1, 1, 1,
0.3598623, 0.5263593, -0.4052318, 1, 1, 1, 1, 1,
0.3634863, -0.8697319, 1.890741, 1, 1, 1, 1, 1,
0.368239, -1.550904, 3.268871, 1, 1, 1, 1, 1,
0.3686346, 0.3379019, 1.758385, 1, 1, 1, 1, 1,
0.3686967, -1.394109, -0.1685667, 1, 1, 1, 1, 1,
0.3688282, -0.2261355, 2.049648, 1, 1, 1, 1, 1,
0.36923, -0.9202254, 2.703651, 1, 1, 1, 1, 1,
0.3713692, 1.757768, -0.4322065, 0, 0, 1, 1, 1,
0.3737679, 1.636343, 0.6783203, 1, 0, 0, 1, 1,
0.3740727, 0.3988379, -0.9396725, 1, 0, 0, 1, 1,
0.3764535, 2.391548, 0.6383301, 1, 0, 0, 1, 1,
0.3773357, 0.7441841, 0.05914411, 1, 0, 0, 1, 1,
0.3776336, -0.8470643, 3.674567, 1, 0, 0, 1, 1,
0.3811168, -0.4186932, 1.715003, 0, 0, 0, 1, 1,
0.3819647, 0.09967109, 1.725499, 0, 0, 0, 1, 1,
0.3848689, -0.8514857, 3.877021, 0, 0, 0, 1, 1,
0.3937325, -0.2432334, 1.814965, 0, 0, 0, 1, 1,
0.3983683, -0.6703584, 2.723476, 0, 0, 0, 1, 1,
0.4033625, 0.2406881, 0.9939201, 0, 0, 0, 1, 1,
0.4038837, 1.048992, 3.042902, 0, 0, 0, 1, 1,
0.4049341, -0.5468596, 1.852781, 1, 1, 1, 1, 1,
0.4061362, 0.2642216, 1.143696, 1, 1, 1, 1, 1,
0.4066338, -0.847395, 3.131445, 1, 1, 1, 1, 1,
0.4070867, -0.3894134, 1.780527, 1, 1, 1, 1, 1,
0.4149405, -1.138279, 4.764845, 1, 1, 1, 1, 1,
0.4172465, 1.111817, -0.4586903, 1, 1, 1, 1, 1,
0.4186658, 0.2348291, -0.5691607, 1, 1, 1, 1, 1,
0.4204963, -0.457446, 2.049305, 1, 1, 1, 1, 1,
0.4213036, -1.06603, 5.080263, 1, 1, 1, 1, 1,
0.4240553, -1.332445, 3.221749, 1, 1, 1, 1, 1,
0.4248123, -0.7569463, 3.17444, 1, 1, 1, 1, 1,
0.4258231, 0.9079853, 0.1811296, 1, 1, 1, 1, 1,
0.4273539, 0.04654265, -0.5597399, 1, 1, 1, 1, 1,
0.4371602, -1.202283, 2.678058, 1, 1, 1, 1, 1,
0.4411966, -1.585726, 2.134604, 1, 1, 1, 1, 1,
0.4413992, -0.453725, 3.416485, 0, 0, 1, 1, 1,
0.4428816, -0.02536594, 2.1239, 1, 0, 0, 1, 1,
0.4446867, -0.3523221, 3.587579, 1, 0, 0, 1, 1,
0.4452775, -0.4193596, 2.773867, 1, 0, 0, 1, 1,
0.4488782, -1.04418, 3.648934, 1, 0, 0, 1, 1,
0.4501978, -0.9876468, 2.84439, 1, 0, 0, 1, 1,
0.4542952, -0.5509491, 1.970026, 0, 0, 0, 1, 1,
0.4559832, 1.065313, -0.6766382, 0, 0, 0, 1, 1,
0.4569988, 0.1847372, 0.457267, 0, 0, 0, 1, 1,
0.4590562, 1.302289, 0.427896, 0, 0, 0, 1, 1,
0.4619082, -0.8140965, 2.686802, 0, 0, 0, 1, 1,
0.4633352, 0.7434388, 0.6603095, 0, 0, 0, 1, 1,
0.4708964, 1.416506, -0.3630548, 0, 0, 0, 1, 1,
0.4722064, 0.7339605, -1.28651, 1, 1, 1, 1, 1,
0.4736645, 0.04335617, 2.019513, 1, 1, 1, 1, 1,
0.476946, -0.2680435, 1.948594, 1, 1, 1, 1, 1,
0.4784978, 0.4249535, 2.384388, 1, 1, 1, 1, 1,
0.480591, 0.2094362, 1.975581, 1, 1, 1, 1, 1,
0.4897575, -1.505861, 1.444903, 1, 1, 1, 1, 1,
0.4904973, -1.585156, 2.610579, 1, 1, 1, 1, 1,
0.5000074, 0.9924097, 0.1802288, 1, 1, 1, 1, 1,
0.5007492, 0.2181358, 0.9487314, 1, 1, 1, 1, 1,
0.5047106, -1.765753, 2.826246, 1, 1, 1, 1, 1,
0.5083923, 0.9779661, 0.6849151, 1, 1, 1, 1, 1,
0.5142391, -0.01472032, 1.589029, 1, 1, 1, 1, 1,
0.5168085, -1.825848, 1.938349, 1, 1, 1, 1, 1,
0.5169292, -1.288687, 1.612894, 1, 1, 1, 1, 1,
0.5197305, -0.8030342, 2.263941, 1, 1, 1, 1, 1,
0.520337, -2.049281, 3.001413, 0, 0, 1, 1, 1,
0.5257905, -1.242249, 2.38494, 1, 0, 0, 1, 1,
0.5297887, -1.431324, 4.130954, 1, 0, 0, 1, 1,
0.5337802, -1.971015, 2.687911, 1, 0, 0, 1, 1,
0.5337967, 2.732894, 0.9530722, 1, 0, 0, 1, 1,
0.5338306, 0.9629019, -0.5980542, 1, 0, 0, 1, 1,
0.5375006, 0.5489433, 0.06020213, 0, 0, 0, 1, 1,
0.5384659, -0.3931223, 2.315311, 0, 0, 0, 1, 1,
0.5392354, -1.611278, 1.845861, 0, 0, 0, 1, 1,
0.5398818, -0.9558132, 1.146449, 0, 0, 0, 1, 1,
0.5450612, 1.259553, 2.50739, 0, 0, 0, 1, 1,
0.547365, 0.3574503, 0.6014803, 0, 0, 0, 1, 1,
0.5524766, -2.133016, 1.699921, 0, 0, 0, 1, 1,
0.5548869, -0.5766341, 2.377954, 1, 1, 1, 1, 1,
0.5584537, -0.4804565, 3.372034, 1, 1, 1, 1, 1,
0.559177, 0.4507748, 2.361659, 1, 1, 1, 1, 1,
0.5592349, 2.287945, 0.9273171, 1, 1, 1, 1, 1,
0.5624407, -0.3220182, 1.802106, 1, 1, 1, 1, 1,
0.5672813, -0.4452268, 2.226739, 1, 1, 1, 1, 1,
0.5714989, 1.217678, -0.9357148, 1, 1, 1, 1, 1,
0.5741119, -1.264924, 2.702347, 1, 1, 1, 1, 1,
0.5900307, 1.371967, 0.01704814, 1, 1, 1, 1, 1,
0.5900724, -2.056504, 2.209058, 1, 1, 1, 1, 1,
0.591221, -0.08031959, 2.354522, 1, 1, 1, 1, 1,
0.591305, -1.196708, 4.516123, 1, 1, 1, 1, 1,
0.5941744, 0.2610118, 0.9462229, 1, 1, 1, 1, 1,
0.5970272, -0.1244131, 2.423019, 1, 1, 1, 1, 1,
0.6027665, -2.724572, 3.998342, 1, 1, 1, 1, 1,
0.6037812, 0.4830187, 1.334865, 0, 0, 1, 1, 1,
0.6118538, 0.7890568, 1.77638, 1, 0, 0, 1, 1,
0.612621, 0.2342875, 0.8702785, 1, 0, 0, 1, 1,
0.6144525, 0.6514544, 0.5980313, 1, 0, 0, 1, 1,
0.6193626, -0.06142285, 0.7796438, 1, 0, 0, 1, 1,
0.6250032, 1.053746, 0.3094352, 1, 0, 0, 1, 1,
0.633722, 0.6125625, 0.4983355, 0, 0, 0, 1, 1,
0.6341895, 1.286146, 2.305808, 0, 0, 0, 1, 1,
0.6350819, 1.110047, 0.09663243, 0, 0, 0, 1, 1,
0.6440203, 0.2528799, -0.4986315, 0, 0, 0, 1, 1,
0.6469068, -0.7330987, 1.688447, 0, 0, 0, 1, 1,
0.6489665, 0.4657497, 1.066382, 0, 0, 0, 1, 1,
0.6490707, -1.96773, 4.580947, 0, 0, 0, 1, 1,
0.6512263, -0.4626868, 4.127583, 1, 1, 1, 1, 1,
0.6527365, 0.1001728, 2.791291, 1, 1, 1, 1, 1,
0.6529087, 0.3133903, 1.001354, 1, 1, 1, 1, 1,
0.6572385, 0.2164138, 0.8376629, 1, 1, 1, 1, 1,
0.6580395, 0.06466624, 0.08812189, 1, 1, 1, 1, 1,
0.6607765, -0.6664655, 1.710881, 1, 1, 1, 1, 1,
0.6617672, -0.4615311, 3.057654, 1, 1, 1, 1, 1,
0.6639224, -0.9181679, 2.187171, 1, 1, 1, 1, 1,
0.6640113, -2.610365, 2.033866, 1, 1, 1, 1, 1,
0.6649918, 0.6733832, 1.640621, 1, 1, 1, 1, 1,
0.6664158, -0.3545156, 3.016808, 1, 1, 1, 1, 1,
0.6671014, 2.895904, 0.8970993, 1, 1, 1, 1, 1,
0.6723576, 1.141254, 1.01015, 1, 1, 1, 1, 1,
0.6735497, -0.6321267, 1.395804, 1, 1, 1, 1, 1,
0.6743551, 0.7305327, 0.09937994, 1, 1, 1, 1, 1,
0.6750329, -0.5804332, 3.472467, 0, 0, 1, 1, 1,
0.6846849, 0.5505181, 0.694489, 1, 0, 0, 1, 1,
0.6848109, -0.5861872, 1.062516, 1, 0, 0, 1, 1,
0.6877635, 0.6304305, -0.2976186, 1, 0, 0, 1, 1,
0.6920663, -0.9148875, 3.723417, 1, 0, 0, 1, 1,
0.6955087, 0.4058801, 1.22127, 1, 0, 0, 1, 1,
0.7001874, 0.3954349, -0.2694726, 0, 0, 0, 1, 1,
0.7016932, 1.044864, 3.889142, 0, 0, 0, 1, 1,
0.7019188, 0.4697715, 1.43937, 0, 0, 0, 1, 1,
0.7034265, 0.1594118, 1.365644, 0, 0, 0, 1, 1,
0.7044342, -2.189801, 3.188722, 0, 0, 0, 1, 1,
0.7059962, 0.888753, 1.68842, 0, 0, 0, 1, 1,
0.7070088, 0.4915616, 1.438264, 0, 0, 0, 1, 1,
0.7128019, -1.5586, 1.91403, 1, 1, 1, 1, 1,
0.7141526, 1.091959, 1.326383, 1, 1, 1, 1, 1,
0.7142511, 0.2854987, -1.118372, 1, 1, 1, 1, 1,
0.7190577, 0.1894329, 1.646037, 1, 1, 1, 1, 1,
0.7223792, -0.07885001, 1.828323, 1, 1, 1, 1, 1,
0.7270426, 0.4675371, -0.1115166, 1, 1, 1, 1, 1,
0.7313718, -2.112556, 4.388096, 1, 1, 1, 1, 1,
0.7330186, -0.2496849, 0.7523534, 1, 1, 1, 1, 1,
0.7380767, 0.574054, 0.4099435, 1, 1, 1, 1, 1,
0.7443672, -0.3735787, 2.429278, 1, 1, 1, 1, 1,
0.7473274, 1.168405, -0.15432, 1, 1, 1, 1, 1,
0.7483061, -0.4743174, 0.3341805, 1, 1, 1, 1, 1,
0.748367, -0.2329836, 2.066171, 1, 1, 1, 1, 1,
0.7598316, 0.2812488, 3.179025, 1, 1, 1, 1, 1,
0.7605807, -1.020085, 2.071403, 1, 1, 1, 1, 1,
0.7608758, -0.188603, 3.002153, 0, 0, 1, 1, 1,
0.7644017, 0.5045244, 1.246436, 1, 0, 0, 1, 1,
0.7677306, -1.396038, 4.137521, 1, 0, 0, 1, 1,
0.7702104, -0.9526337, 2.757946, 1, 0, 0, 1, 1,
0.7728383, -1.314308, 3.131962, 1, 0, 0, 1, 1,
0.7771664, -0.5731187, 0.2207837, 1, 0, 0, 1, 1,
0.7806357, -0.7520601, 1.582346, 0, 0, 0, 1, 1,
0.7874025, 0.2443963, 1.129111, 0, 0, 0, 1, 1,
0.7938163, -0.3486165, 2.80877, 0, 0, 0, 1, 1,
0.7942278, -0.2567481, 1.030365, 0, 0, 0, 1, 1,
0.7961812, 0.7398681, 0.6929008, 0, 0, 0, 1, 1,
0.7968283, -0.3916209, 2.653278, 0, 0, 0, 1, 1,
0.7969086, 0.5230862, 1.326756, 0, 0, 0, 1, 1,
0.7992107, 1.066123, 0.07568052, 1, 1, 1, 1, 1,
0.8001338, -0.5350679, 0.9256276, 1, 1, 1, 1, 1,
0.8004616, -0.4406371, 2.493066, 1, 1, 1, 1, 1,
0.8025461, 0.9874792, 2.212251, 1, 1, 1, 1, 1,
0.8053867, 0.2195635, 1.600148, 1, 1, 1, 1, 1,
0.8062392, -0.572933, 2.467747, 1, 1, 1, 1, 1,
0.8144984, 0.650405, 1.271997, 1, 1, 1, 1, 1,
0.8163902, 0.07126129, 2.560555, 1, 1, 1, 1, 1,
0.8206332, 0.2235761, 1.712754, 1, 1, 1, 1, 1,
0.8262642, -1.417439, 3.017174, 1, 1, 1, 1, 1,
0.8318746, 2.241219, 0.5665856, 1, 1, 1, 1, 1,
0.8364862, -1.491394, 3.906852, 1, 1, 1, 1, 1,
0.8369067, 0.7681134, 0.7678808, 1, 1, 1, 1, 1,
0.8407766, 0.6403165, -0.8086869, 1, 1, 1, 1, 1,
0.8442344, -0.7452418, 1.729472, 1, 1, 1, 1, 1,
0.8462504, -1.560219, 3.33298, 0, 0, 1, 1, 1,
0.8477441, 0.1903476, 1.650303, 1, 0, 0, 1, 1,
0.8502141, -0.8715994, 2.529402, 1, 0, 0, 1, 1,
0.8557535, -0.5050752, 2.498201, 1, 0, 0, 1, 1,
0.8582941, -0.4704836, 2.387881, 1, 0, 0, 1, 1,
0.8588841, -0.1899233, -0.5935538, 1, 0, 0, 1, 1,
0.8621366, 1.097007, 0.8196622, 0, 0, 0, 1, 1,
0.8621487, -0.08566266, 2.557441, 0, 0, 0, 1, 1,
0.8651221, -0.2820758, 2.521895, 0, 0, 0, 1, 1,
0.8659058, -0.3681799, 0.8877175, 0, 0, 0, 1, 1,
0.8662189, -0.3482906, 1.251429, 0, 0, 0, 1, 1,
0.8677562, 0.820454, -1.113123, 0, 0, 0, 1, 1,
0.8719006, 0.5256608, 1.952694, 0, 0, 0, 1, 1,
0.8786235, -1.11891, 3.289508, 1, 1, 1, 1, 1,
0.8819903, -2.002097, 2.598726, 1, 1, 1, 1, 1,
0.8861388, -0.6027598, 3.949898, 1, 1, 1, 1, 1,
0.8950037, 0.5007459, 1.313076, 1, 1, 1, 1, 1,
0.8963231, -0.1717678, 1.008847, 1, 1, 1, 1, 1,
0.9019732, 0.4220293, 1.57398, 1, 1, 1, 1, 1,
0.9062017, 1.4945, 0.6919554, 1, 1, 1, 1, 1,
0.9075978, 0.06458371, 0.4668214, 1, 1, 1, 1, 1,
0.9146932, 1.16562, 0.6334561, 1, 1, 1, 1, 1,
0.9244094, 1.234136, -0.8428413, 1, 1, 1, 1, 1,
0.9257029, 0.4726273, 0.7770829, 1, 1, 1, 1, 1,
0.9299183, -0.6482517, 1.835353, 1, 1, 1, 1, 1,
0.9443592, -0.7981722, 2.028327, 1, 1, 1, 1, 1,
0.9508761, -0.4198283, 0.9463822, 1, 1, 1, 1, 1,
0.9517782, -0.6878238, 3.040793, 1, 1, 1, 1, 1,
0.9599472, -0.709059, 0.7705613, 0, 0, 1, 1, 1,
0.9621438, 0.5158314, 1.668597, 1, 0, 0, 1, 1,
0.9688839, -0.03480921, 2.06678, 1, 0, 0, 1, 1,
0.9722766, -1.022432, 2.245845, 1, 0, 0, 1, 1,
0.979032, 2.952758, 0.194984, 1, 0, 0, 1, 1,
0.990496, -1.039863, 1.963746, 1, 0, 0, 1, 1,
0.9906142, -1.379192, 2.801456, 0, 0, 0, 1, 1,
0.9912292, -0.236055, 1.51003, 0, 0, 0, 1, 1,
0.9932355, 0.8427355, 1.579525, 0, 0, 0, 1, 1,
0.9945338, 1.449515, 1.286729, 0, 0, 0, 1, 1,
0.9954767, 0.6014881, 2.050742, 0, 0, 0, 1, 1,
0.9984791, 0.6296517, 1.355868, 0, 0, 0, 1, 1,
1.003082, 0.5279078, 1.317833, 0, 0, 0, 1, 1,
1.003199, -0.3722847, 2.303251, 1, 1, 1, 1, 1,
1.00843, -1.020859, 0.5487458, 1, 1, 1, 1, 1,
1.008837, -0.6630892, 1.089007, 1, 1, 1, 1, 1,
1.017121, 0.8827879, 0.05423501, 1, 1, 1, 1, 1,
1.022008, -0.9790965, 3.844658, 1, 1, 1, 1, 1,
1.023338, -0.2110193, 2.473526, 1, 1, 1, 1, 1,
1.02502, -0.5235001, 0.9093225, 1, 1, 1, 1, 1,
1.02983, -1.156482, 1.793491, 1, 1, 1, 1, 1,
1.037253, 2.972234, 0.7524266, 1, 1, 1, 1, 1,
1.041752, 0.03449289, 0.8832566, 1, 1, 1, 1, 1,
1.047668, -0.1655493, 1.113305, 1, 1, 1, 1, 1,
1.050986, 0.6173747, -0.2902115, 1, 1, 1, 1, 1,
1.052004, -1.397215, 0.2090851, 1, 1, 1, 1, 1,
1.053501, -0.3843874, 0.8675181, 1, 1, 1, 1, 1,
1.05455, 0.4782334, 2.911606, 1, 1, 1, 1, 1,
1.054569, 0.2658179, 2.518215, 0, 0, 1, 1, 1,
1.060874, 0.2555462, 0.2624547, 1, 0, 0, 1, 1,
1.063605, 0.9723606, -0.7394114, 1, 0, 0, 1, 1,
1.064376, 1.487239, 1.269029, 1, 0, 0, 1, 1,
1.065244, 1.750115, 0.8899104, 1, 0, 0, 1, 1,
1.06616, 0.2620122, 0.8408764, 1, 0, 0, 1, 1,
1.071004, 0.6101469, -0.1003118, 0, 0, 0, 1, 1,
1.07332, 1.062149, 1.693903, 0, 0, 0, 1, 1,
1.075794, 0.007874222, 1.019241, 0, 0, 0, 1, 1,
1.08567, -1.247166, 1.5192, 0, 0, 0, 1, 1,
1.102699, 0.7458113, -0.4956034, 0, 0, 0, 1, 1,
1.107148, -0.4213533, 3.888245, 0, 0, 0, 1, 1,
1.110081, -1.680787, 1.717813, 0, 0, 0, 1, 1,
1.110317, 0.6090562, 0.9624889, 1, 1, 1, 1, 1,
1.111834, 1.051345, 2.22515, 1, 1, 1, 1, 1,
1.113812, -0.8314965, 0.9688787, 1, 1, 1, 1, 1,
1.122396, 0.8798051, 2.107274, 1, 1, 1, 1, 1,
1.122406, 0.7741752, 0.3693752, 1, 1, 1, 1, 1,
1.138022, -0.1556799, 1.484575, 1, 1, 1, 1, 1,
1.140455, -0.3914244, 1.624641, 1, 1, 1, 1, 1,
1.146006, 0.8924334, 1.234239, 1, 1, 1, 1, 1,
1.15021, -0.5862823, 1.631765, 1, 1, 1, 1, 1,
1.154405, 0.4325305, 1.756015, 1, 1, 1, 1, 1,
1.175244, -1.491144, 2.348704, 1, 1, 1, 1, 1,
1.179538, 1.143106, 0.6107677, 1, 1, 1, 1, 1,
1.185625, -0.6256115, 1.08951, 1, 1, 1, 1, 1,
1.186979, 0.02475693, 2.111485, 1, 1, 1, 1, 1,
1.187671, -0.6560001, 2.155667, 1, 1, 1, 1, 1,
1.187757, 1.034138, 0.2794178, 0, 0, 1, 1, 1,
1.188562, 0.8133221, 1.893223, 1, 0, 0, 1, 1,
1.193677, -1.590756, 3.527498, 1, 0, 0, 1, 1,
1.195578, -0.5797389, 2.081079, 1, 0, 0, 1, 1,
1.201917, -0.05862089, 3.261891, 1, 0, 0, 1, 1,
1.20457, -0.3509713, 3.390225, 1, 0, 0, 1, 1,
1.204816, 0.04172969, 1.158355, 0, 0, 0, 1, 1,
1.207806, -0.1356207, 0.8425913, 0, 0, 0, 1, 1,
1.214157, -0.4675394, 1.627248, 0, 0, 0, 1, 1,
1.216182, -1.903874, 1.482727, 0, 0, 0, 1, 1,
1.21778, 0.7551484, 1.402595, 0, 0, 0, 1, 1,
1.218146, 0.9615833, 1.65713, 0, 0, 0, 1, 1,
1.222249, -0.6475812, 2.104394, 0, 0, 0, 1, 1,
1.223461, 1.26155, 1.901055, 1, 1, 1, 1, 1,
1.229542, -0.2782144, 2.313234, 1, 1, 1, 1, 1,
1.232588, -1.380365, 2.96023, 1, 1, 1, 1, 1,
1.234144, -0.06846325, 1.197702, 1, 1, 1, 1, 1,
1.239881, -0.8186406, 1.710549, 1, 1, 1, 1, 1,
1.249681, 0.7992801, 1.319871, 1, 1, 1, 1, 1,
1.250252, -0.9672132, 2.461501, 1, 1, 1, 1, 1,
1.256027, -0.2541683, 3.563705, 1, 1, 1, 1, 1,
1.276965, -0.3490267, 1.436363, 1, 1, 1, 1, 1,
1.279516, -0.1874927, -0.6800358, 1, 1, 1, 1, 1,
1.281647, 1.099908, 1.013312, 1, 1, 1, 1, 1,
1.285301, 0.2340098, 0.8318453, 1, 1, 1, 1, 1,
1.299111, -0.8673173, 3.534436, 1, 1, 1, 1, 1,
1.302308, -0.4579975, 0.8021547, 1, 1, 1, 1, 1,
1.307042, 0.06684702, 1.941529, 1, 1, 1, 1, 1,
1.308965, 0.1593789, 1.163164, 0, 0, 1, 1, 1,
1.309614, 0.2751248, 2.818088, 1, 0, 0, 1, 1,
1.31093, 0.5566818, 1.336544, 1, 0, 0, 1, 1,
1.323241, 1.022896, 1.090518, 1, 0, 0, 1, 1,
1.332316, -0.3900412, 1.166476, 1, 0, 0, 1, 1,
1.332759, -1.346517, 2.792541, 1, 0, 0, 1, 1,
1.335114, 1.123017, 0.7318882, 0, 0, 0, 1, 1,
1.338359, 0.719287, 1.925447, 0, 0, 0, 1, 1,
1.357378, 0.8041757, 1.787213, 0, 0, 0, 1, 1,
1.357808, 0.8298118, 1.473251, 0, 0, 0, 1, 1,
1.358519, 1.448362, -0.4910155, 0, 0, 0, 1, 1,
1.35925, 1.393967, 2.05647, 0, 0, 0, 1, 1,
1.363817, 1.04018, 0.1893533, 0, 0, 0, 1, 1,
1.364315, 0.7759823, -1.167009, 1, 1, 1, 1, 1,
1.37558, -0.1974929, 1.207941, 1, 1, 1, 1, 1,
1.391316, 0.3327537, 1.327921, 1, 1, 1, 1, 1,
1.405417, -0.1146625, 1.028078, 1, 1, 1, 1, 1,
1.406226, -1.387306, 1.7062, 1, 1, 1, 1, 1,
1.431153, 0.3902223, 1.616704, 1, 1, 1, 1, 1,
1.44044, -0.4397143, 3.310236, 1, 1, 1, 1, 1,
1.458724, -0.2937914, 2.257292, 1, 1, 1, 1, 1,
1.460676, 0.656148, 1.342263, 1, 1, 1, 1, 1,
1.463436, -1.450445, 3.655422, 1, 1, 1, 1, 1,
1.472341, -0.4418264, 1.07154, 1, 1, 1, 1, 1,
1.480645, -0.8667285, 2.986745, 1, 1, 1, 1, 1,
1.483591, 0.5611315, 0.3589984, 1, 1, 1, 1, 1,
1.494265, -0.05498507, 0.6810988, 1, 1, 1, 1, 1,
1.495755, -0.9703767, 1.853332, 1, 1, 1, 1, 1,
1.496208, -1.350352, 2.828105, 0, 0, 1, 1, 1,
1.501776, 0.876994, 0.8523843, 1, 0, 0, 1, 1,
1.522521, 0.6534584, 1.731213, 1, 0, 0, 1, 1,
1.54519, -1.142204, 3.399414, 1, 0, 0, 1, 1,
1.550606, 1.040134, 0.7119613, 1, 0, 0, 1, 1,
1.57448, 0.4668848, 1.037268, 1, 0, 0, 1, 1,
1.583547, -1.697459, 2.927046, 0, 0, 0, 1, 1,
1.58443, 0.6592994, 1.93649, 0, 0, 0, 1, 1,
1.610279, -1.021189, 0.5858045, 0, 0, 0, 1, 1,
1.614963, -0.3480549, 1.331466, 0, 0, 0, 1, 1,
1.64817, 1.504715, 1.200567, 0, 0, 0, 1, 1,
1.648554, 1.122847, -0.3086547, 0, 0, 0, 1, 1,
1.652575, 1.510191, 0.8853359, 0, 0, 0, 1, 1,
1.659484, -0.215168, 1.958862, 1, 1, 1, 1, 1,
1.66334, -0.72997, 2.716273, 1, 1, 1, 1, 1,
1.667755, 0.5874121, 0.8914549, 1, 1, 1, 1, 1,
1.673068, 0.2243597, 0.1234962, 1, 1, 1, 1, 1,
1.673924, 0.8217921, 0.2245942, 1, 1, 1, 1, 1,
1.688058, 0.8614087, 1.801084, 1, 1, 1, 1, 1,
1.691748, -1.296625, 3.608546, 1, 1, 1, 1, 1,
1.713463, -0.8842004, 3.272706, 1, 1, 1, 1, 1,
1.73027, 0.03946603, 0.03492323, 1, 1, 1, 1, 1,
1.731427, -0.1812784, 1.587569, 1, 1, 1, 1, 1,
1.735361, 0.004316165, 4.248444, 1, 1, 1, 1, 1,
1.746222, 1.127533, 1.408739, 1, 1, 1, 1, 1,
1.754439, 0.4642825, -0.5645523, 1, 1, 1, 1, 1,
1.774225, -1.40473, 4.00875, 1, 1, 1, 1, 1,
1.784979, -0.3555416, 1.138866, 1, 1, 1, 1, 1,
1.801665, -0.8576744, 0.1584996, 0, 0, 1, 1, 1,
1.809749, -0.07735416, 1.264567, 1, 0, 0, 1, 1,
1.814387, -1.447855, 2.694345, 1, 0, 0, 1, 1,
1.912566, -0.6148083, 3.026977, 1, 0, 0, 1, 1,
1.947841, -0.7944337, 2.815711, 1, 0, 0, 1, 1,
1.957236, -1.489241, 2.246512, 1, 0, 0, 1, 1,
1.999535, -0.2501428, 2.058016, 0, 0, 0, 1, 1,
2.012571, 0.212812, 2.417165, 0, 0, 0, 1, 1,
2.047967, -0.2926947, 2.852309, 0, 0, 0, 1, 1,
2.097271, 1.986526, 0.8064696, 0, 0, 0, 1, 1,
2.122687, 1.073177, 0.1289961, 0, 0, 0, 1, 1,
2.199005, -1.888021, 1.295735, 0, 0, 0, 1, 1,
2.206826, -0.5694468, 0.8102377, 0, 0, 0, 1, 1,
2.356394, 0.4965693, 0.6729516, 1, 1, 1, 1, 1,
2.415868, -0.01835176, 1.758086, 1, 1, 1, 1, 1,
2.498382, 1.096716, 1.77806, 1, 1, 1, 1, 1,
2.54944, 0.9290512, 1.746167, 1, 1, 1, 1, 1,
2.704818, 2.7988, -0.8198645, 1, 1, 1, 1, 1,
2.941835, 1.551909, 1.318246, 1, 1, 1, 1, 1,
3.032346, -2.465843, 2.683084, 1, 1, 1, 1, 1
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
var radius = 9.178445;
var distance = 32.2389;
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
mvMatrix.translate( -0.07117629, -0.1238309, 0.07210469 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.2389);
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
