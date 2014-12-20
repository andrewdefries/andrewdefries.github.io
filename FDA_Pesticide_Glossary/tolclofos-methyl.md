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
-2.651813, 0.9538907, -2.427172, 1, 0, 0, 1,
-2.633063, 2.348069, -1.884043, 1, 0.007843138, 0, 1,
-2.628562, 0.1520574, -2.308843, 1, 0.01176471, 0, 1,
-2.524007, -0.9284098, -3.531051, 1, 0.01960784, 0, 1,
-2.483046, 1.585097, -2.403954, 1, 0.02352941, 0, 1,
-2.400442, 0.6974246, -1.830892, 1, 0.03137255, 0, 1,
-2.36404, -0.79242, -1.666009, 1, 0.03529412, 0, 1,
-2.217135, -0.2011239, -1.219439, 1, 0.04313726, 0, 1,
-2.206724, 2.063125, -2.280577, 1, 0.04705882, 0, 1,
-2.190973, 0.2523764, -2.103142, 1, 0.05490196, 0, 1,
-2.16915, -0.526766, -2.951771, 1, 0.05882353, 0, 1,
-2.127404, 1.310265, 0.9531443, 1, 0.06666667, 0, 1,
-2.09211, -0.2523542, -0.5123494, 1, 0.07058824, 0, 1,
-2.077441, 0.4673748, 1.752366, 1, 0.07843138, 0, 1,
-2.076634, 1.060199, -1.41599, 1, 0.08235294, 0, 1,
-2.070363, -0.2047256, -1.85595, 1, 0.09019608, 0, 1,
-2.068341, -1.508518, -3.050742, 1, 0.09411765, 0, 1,
-2.031196, 0.3166131, 0.2908964, 1, 0.1019608, 0, 1,
-2.030163, 1.65251, 0.0590915, 1, 0.1098039, 0, 1,
-2.019887, -0.4966373, -2.90296, 1, 0.1137255, 0, 1,
-1.980601, -0.04083195, -2.384768, 1, 0.1215686, 0, 1,
-1.974761, 1.054351, -0.7340723, 1, 0.1254902, 0, 1,
-1.97192, 0.5970783, -3.51261, 1, 0.1333333, 0, 1,
-1.962017, 0.4103292, -3.177725, 1, 0.1372549, 0, 1,
-1.955418, -0.7942848, -2.214529, 1, 0.145098, 0, 1,
-1.934734, 1.407434, -0.5798902, 1, 0.1490196, 0, 1,
-1.930144, 1.009046, -1.424979, 1, 0.1568628, 0, 1,
-1.921995, 0.68423, -1.923578, 1, 0.1607843, 0, 1,
-1.917433, 0.5329822, -1.745866, 1, 0.1686275, 0, 1,
-1.915515, 1.431762, 0.3197577, 1, 0.172549, 0, 1,
-1.878881, 0.1119853, -2.226506, 1, 0.1803922, 0, 1,
-1.875956, -1.427024, -1.757646, 1, 0.1843137, 0, 1,
-1.871145, 1.102749, -2.531921, 1, 0.1921569, 0, 1,
-1.862363, -0.5073197, -3.929152, 1, 0.1960784, 0, 1,
-1.859202, -1.097311, -1.465634, 1, 0.2039216, 0, 1,
-1.857748, 0.1877705, -1.679658, 1, 0.2117647, 0, 1,
-1.857532, 0.8412643, -0.1948005, 1, 0.2156863, 0, 1,
-1.822898, 0.9240385, -0.8068383, 1, 0.2235294, 0, 1,
-1.795321, 2.220531, -0.7931129, 1, 0.227451, 0, 1,
-1.779755, -1.253144, -2.693688, 1, 0.2352941, 0, 1,
-1.77036, -1.014428, -0.4198941, 1, 0.2392157, 0, 1,
-1.743078, -0.7251632, 0.3971736, 1, 0.2470588, 0, 1,
-1.73314, 0.565075, -2.448967, 1, 0.2509804, 0, 1,
-1.691759, 1.529306, 0.06245353, 1, 0.2588235, 0, 1,
-1.682124, -0.9334294, -1.883605, 1, 0.2627451, 0, 1,
-1.681893, -1.150758, -1.73665, 1, 0.2705882, 0, 1,
-1.63912, -0.6367198, -1.358072, 1, 0.2745098, 0, 1,
-1.626438, -2.296443, -4.003887, 1, 0.282353, 0, 1,
-1.601829, 0.7208194, 0.1935685, 1, 0.2862745, 0, 1,
-1.599042, -0.3370419, -1.985192, 1, 0.2941177, 0, 1,
-1.567874, 0.0565989, -2.517575, 1, 0.3019608, 0, 1,
-1.557654, 0.664363, -1.248995, 1, 0.3058824, 0, 1,
-1.541712, -0.5387923, -3.115791, 1, 0.3137255, 0, 1,
-1.532881, 0.8847647, -1.6121, 1, 0.3176471, 0, 1,
-1.516884, 0.2093709, -2.573779, 1, 0.3254902, 0, 1,
-1.51458, -1.919645, 0.06391411, 1, 0.3294118, 0, 1,
-1.500876, -0.765201, -1.563205, 1, 0.3372549, 0, 1,
-1.468654, 0.3892343, -2.621311, 1, 0.3411765, 0, 1,
-1.467119, 1.087188, -1.979362, 1, 0.3490196, 0, 1,
-1.466726, -0.6191894, 0.05092073, 1, 0.3529412, 0, 1,
-1.438256, -0.6219261, -1.480886, 1, 0.3607843, 0, 1,
-1.437939, -0.431727, -1.987147, 1, 0.3647059, 0, 1,
-1.437307, 1.123719, -0.3726059, 1, 0.372549, 0, 1,
-1.429644, -0.7478704, -2.707721, 1, 0.3764706, 0, 1,
-1.428224, -1.042715, -2.140785, 1, 0.3843137, 0, 1,
-1.399107, -0.5906514, -1.172368, 1, 0.3882353, 0, 1,
-1.399076, -0.7647703, -1.482772, 1, 0.3960784, 0, 1,
-1.396164, -0.1279912, -2.044085, 1, 0.4039216, 0, 1,
-1.391037, -0.1159168, -0.09269728, 1, 0.4078431, 0, 1,
-1.387183, 0.785527, -0.4863802, 1, 0.4156863, 0, 1,
-1.377295, 0.6173908, -1.155404, 1, 0.4196078, 0, 1,
-1.376271, -0.3497054, -3.910021, 1, 0.427451, 0, 1,
-1.373859, 1.037344, -1.557535, 1, 0.4313726, 0, 1,
-1.372002, -0.8505515, -3.110592, 1, 0.4392157, 0, 1,
-1.367444, 1.559958, 0.2964016, 1, 0.4431373, 0, 1,
-1.363835, -0.538638, -1.930148, 1, 0.4509804, 0, 1,
-1.357472, 1.585585, -1.26283, 1, 0.454902, 0, 1,
-1.350844, 0.2586268, -3.153021, 1, 0.4627451, 0, 1,
-1.343033, -0.3121919, -1.562355, 1, 0.4666667, 0, 1,
-1.33756, 0.570987, -0.7429611, 1, 0.4745098, 0, 1,
-1.327529, -1.21285, -1.827776, 1, 0.4784314, 0, 1,
-1.327479, 1.244658, -2.12037, 1, 0.4862745, 0, 1,
-1.313966, 0.8339124, -1.511759, 1, 0.4901961, 0, 1,
-1.310643, -2.566317, -2.484749, 1, 0.4980392, 0, 1,
-1.302827, -0.7327902, -2.696504, 1, 0.5058824, 0, 1,
-1.292518, -0.3690678, -3.209347, 1, 0.509804, 0, 1,
-1.286076, -0.5641364, -1.218317, 1, 0.5176471, 0, 1,
-1.283241, -0.9722424, -1.998812, 1, 0.5215687, 0, 1,
-1.271936, -0.3650199, -2.32064, 1, 0.5294118, 0, 1,
-1.270592, 0.05023211, -1.200764, 1, 0.5333334, 0, 1,
-1.270036, -0.2821895, -0.4925045, 1, 0.5411765, 0, 1,
-1.268518, -1.385808, -3.207546, 1, 0.5450981, 0, 1,
-1.265821, 0.4406528, 0.4575236, 1, 0.5529412, 0, 1,
-1.263857, 0.1356881, -2.006476, 1, 0.5568628, 0, 1,
-1.259475, 0.8046024, -3.263975, 1, 0.5647059, 0, 1,
-1.248179, 0.3380998, -1.723511, 1, 0.5686275, 0, 1,
-1.242316, -0.3179477, -1.835683, 1, 0.5764706, 0, 1,
-1.240213, 0.165317, -1.481336, 1, 0.5803922, 0, 1,
-1.240156, 0.3362278, 0.7677721, 1, 0.5882353, 0, 1,
-1.237032, -0.4714575, -4.028432, 1, 0.5921569, 0, 1,
-1.235983, -2.839569, -3.198019, 1, 0.6, 0, 1,
-1.231644, -1.140558, -1.60346, 1, 0.6078432, 0, 1,
-1.230487, 3.58197, -1.510984, 1, 0.6117647, 0, 1,
-1.229232, 0.2724241, -2.628041, 1, 0.6196079, 0, 1,
-1.221145, 2.412246, -0.2486397, 1, 0.6235294, 0, 1,
-1.214692, 1.016425, -0.6192259, 1, 0.6313726, 0, 1,
-1.202283, -2.247405, -0.8281936, 1, 0.6352941, 0, 1,
-1.189477, -0.402707, -2.877746, 1, 0.6431373, 0, 1,
-1.17923, -1.477196, -1.460384, 1, 0.6470588, 0, 1,
-1.164957, 1.247231, -1.519916, 1, 0.654902, 0, 1,
-1.156918, -1.174325, -1.089437, 1, 0.6588235, 0, 1,
-1.152403, 0.3092217, -0.4769083, 1, 0.6666667, 0, 1,
-1.141617, 0.7957327, -1.636373, 1, 0.6705883, 0, 1,
-1.140228, 0.7629851, 1.364627, 1, 0.6784314, 0, 1,
-1.137732, -2.106955, -2.319716, 1, 0.682353, 0, 1,
-1.127337, 0.2448289, -0.4740073, 1, 0.6901961, 0, 1,
-1.124799, 1.619583, -0.5536497, 1, 0.6941177, 0, 1,
-1.124399, -0.2043904, 0.6850262, 1, 0.7019608, 0, 1,
-1.123721, -0.7102398, -2.041925, 1, 0.7098039, 0, 1,
-1.111367, 0.07833516, -3.745383, 1, 0.7137255, 0, 1,
-1.108026, 1.333994, 0.7023556, 1, 0.7215686, 0, 1,
-1.09486, 0.4041868, 0.353068, 1, 0.7254902, 0, 1,
-1.091994, -1.43197, -3.249221, 1, 0.7333333, 0, 1,
-1.091679, -0.1179948, -1.119428, 1, 0.7372549, 0, 1,
-1.090506, -0.7053167, -2.552983, 1, 0.7450981, 0, 1,
-1.085637, 1.293902, -0.3155649, 1, 0.7490196, 0, 1,
-1.079562, -0.2569217, -2.265297, 1, 0.7568628, 0, 1,
-1.076638, 0.3852074, 1.566727, 1, 0.7607843, 0, 1,
-1.059542, -0.6075547, -1.915042, 1, 0.7686275, 0, 1,
-1.057557, -1.556437, -2.758945, 1, 0.772549, 0, 1,
-1.05035, 0.03125343, 0.01706763, 1, 0.7803922, 0, 1,
-1.048247, -0.06826624, -0.7530086, 1, 0.7843137, 0, 1,
-1.044444, 1.117032, -0.4918147, 1, 0.7921569, 0, 1,
-1.035354, -0.004841623, -3.129063, 1, 0.7960784, 0, 1,
-1.033708, -0.6307291, -1.611397, 1, 0.8039216, 0, 1,
-1.031912, -1.495818, -2.948653, 1, 0.8117647, 0, 1,
-1.031016, 0.7091698, -1.966053, 1, 0.8156863, 0, 1,
-1.024087, -0.5262544, -3.395944, 1, 0.8235294, 0, 1,
-1.007151, -0.3729694, -4.026259, 1, 0.827451, 0, 1,
-1.004248, 0.3220463, 0.2360657, 1, 0.8352941, 0, 1,
-1.001185, 0.2388975, 0.9196361, 1, 0.8392157, 0, 1,
-0.9958115, -0.3426327, -2.206478, 1, 0.8470588, 0, 1,
-0.9957635, -1.322135, -2.124252, 1, 0.8509804, 0, 1,
-0.9923953, -0.07613528, -1.975455, 1, 0.8588235, 0, 1,
-0.9886935, 0.5771561, -1.210007, 1, 0.8627451, 0, 1,
-0.988059, -0.9999567, -2.042156, 1, 0.8705882, 0, 1,
-0.9877526, 0.1861417, -2.193611, 1, 0.8745098, 0, 1,
-0.9874042, 0.4759644, -0.9196698, 1, 0.8823529, 0, 1,
-0.9862021, -0.7861833, -2.466726, 1, 0.8862745, 0, 1,
-0.9826466, -0.3171127, -1.194971, 1, 0.8941177, 0, 1,
-0.9780208, 0.4706961, -2.214121, 1, 0.8980392, 0, 1,
-0.9736412, -1.180433, -2.075203, 1, 0.9058824, 0, 1,
-0.9726388, -2.641999, -2.430486, 1, 0.9137255, 0, 1,
-0.9662421, -0.1950061, -2.691756, 1, 0.9176471, 0, 1,
-0.960443, -0.9176973, -3.163424, 1, 0.9254902, 0, 1,
-0.9570183, 0.4933073, -0.3753807, 1, 0.9294118, 0, 1,
-0.9546718, 0.454679, -1.721017, 1, 0.9372549, 0, 1,
-0.9522552, 0.822266, -1.370654, 1, 0.9411765, 0, 1,
-0.9521558, -0.4386067, -2.049453, 1, 0.9490196, 0, 1,
-0.9470803, -0.6268559, -2.379562, 1, 0.9529412, 0, 1,
-0.94402, 0.7254117, -0.766681, 1, 0.9607843, 0, 1,
-0.9418489, 1.71428, -0.5411454, 1, 0.9647059, 0, 1,
-0.9410818, 0.2089357, -1.548542, 1, 0.972549, 0, 1,
-0.9182972, -0.9979524, -3.260946, 1, 0.9764706, 0, 1,
-0.9134829, -1.196199, -4.227765, 1, 0.9843137, 0, 1,
-0.9104832, 1.532476, -0.09634422, 1, 0.9882353, 0, 1,
-0.9075907, 0.07419362, -0.9007517, 1, 0.9960784, 0, 1,
-0.9056704, -0.8383019, -3.014314, 0.9960784, 1, 0, 1,
-0.902532, 0.3881529, 0.3599243, 0.9921569, 1, 0, 1,
-0.8964097, -1.21635, -1.95465, 0.9843137, 1, 0, 1,
-0.8929962, -0.01830506, -0.6741463, 0.9803922, 1, 0, 1,
-0.8921073, -0.3622739, -1.897505, 0.972549, 1, 0, 1,
-0.8897285, 0.347237, -1.717519, 0.9686275, 1, 0, 1,
-0.8863832, 0.5163256, -2.724072, 0.9607843, 1, 0, 1,
-0.8853688, 0.1753697, -0.5082575, 0.9568627, 1, 0, 1,
-0.8779112, -0.8229451, -1.719322, 0.9490196, 1, 0, 1,
-0.8734854, -1.367436, -2.921837, 0.945098, 1, 0, 1,
-0.8719491, 1.810294, 0.2253902, 0.9372549, 1, 0, 1,
-0.8691275, -0.3485931, -2.652144, 0.9333333, 1, 0, 1,
-0.8686004, 0.7853346, -1.562375, 0.9254902, 1, 0, 1,
-0.8678302, -0.4038876, -2.130608, 0.9215686, 1, 0, 1,
-0.8640407, -0.6649987, -3.763532, 0.9137255, 1, 0, 1,
-0.8600829, -1.511338, -4.458787, 0.9098039, 1, 0, 1,
-0.8577662, 0.3943046, -1.910232, 0.9019608, 1, 0, 1,
-0.8556037, 0.3577137, -1.550481, 0.8941177, 1, 0, 1,
-0.8500965, 0.02359226, -1.348315, 0.8901961, 1, 0, 1,
-0.8489287, 0.2318009, -0.8849112, 0.8823529, 1, 0, 1,
-0.8474316, -0.1664157, -2.799315, 0.8784314, 1, 0, 1,
-0.8460615, -1.062862, -3.16993, 0.8705882, 1, 0, 1,
-0.8425125, -0.3389116, -1.454118, 0.8666667, 1, 0, 1,
-0.8388588, 0.4905543, -1.43518, 0.8588235, 1, 0, 1,
-0.8381299, 2.3065, -1.222148, 0.854902, 1, 0, 1,
-0.8357754, 0.7235513, -1.527581, 0.8470588, 1, 0, 1,
-0.8312753, 2.387669, -1.579023, 0.8431373, 1, 0, 1,
-0.8292384, -0.6562311, -2.169212, 0.8352941, 1, 0, 1,
-0.8287606, 1.440784, -2.001534, 0.8313726, 1, 0, 1,
-0.8217034, -1.194168, -1.415461, 0.8235294, 1, 0, 1,
-0.8209925, -1.993997, -2.302314, 0.8196079, 1, 0, 1,
-0.8175922, -1.056399, -2.811575, 0.8117647, 1, 0, 1,
-0.8153703, -0.2147017, -0.5396195, 0.8078431, 1, 0, 1,
-0.8121038, 2.233318, -0.1614792, 0.8, 1, 0, 1,
-0.8112652, 1.538329, 0.3955955, 0.7921569, 1, 0, 1,
-0.8108881, -0.885879, -3.191597, 0.7882353, 1, 0, 1,
-0.8044403, -0.8190323, -1.795024, 0.7803922, 1, 0, 1,
-0.7900056, 0.6578042, -1.986583, 0.7764706, 1, 0, 1,
-0.7889099, 0.959453, -0.5230233, 0.7686275, 1, 0, 1,
-0.7885615, 2.324319, -0.7400089, 0.7647059, 1, 0, 1,
-0.7854342, 0.4594222, 0.1380149, 0.7568628, 1, 0, 1,
-0.7849464, -0.6449854, -1.444409, 0.7529412, 1, 0, 1,
-0.7805485, 2.981008, 0.8818656, 0.7450981, 1, 0, 1,
-0.7749901, -0.69553, -4.755844, 0.7411765, 1, 0, 1,
-0.7692796, 0.7920207, -1.815466, 0.7333333, 1, 0, 1,
-0.7645226, -1.024249, -3.109095, 0.7294118, 1, 0, 1,
-0.7506705, -0.8259692, -1.92859, 0.7215686, 1, 0, 1,
-0.7478319, 1.744039, 0.7012943, 0.7176471, 1, 0, 1,
-0.7436578, -0.6389437, -2.94225, 0.7098039, 1, 0, 1,
-0.7346714, -3.245678, -1.645164, 0.7058824, 1, 0, 1,
-0.7342967, 0.9705819, -1.313441, 0.6980392, 1, 0, 1,
-0.7336819, -0.07565077, -0.7392201, 0.6901961, 1, 0, 1,
-0.7275015, 0.08459944, -0.8900257, 0.6862745, 1, 0, 1,
-0.7253861, -1.412706, -2.806201, 0.6784314, 1, 0, 1,
-0.7248747, 1.880878, 1.456947, 0.6745098, 1, 0, 1,
-0.7212291, -0.3657587, -2.030075, 0.6666667, 1, 0, 1,
-0.7189883, -2.351989, -1.257175, 0.6627451, 1, 0, 1,
-0.7164524, 1.878433, -1.426411, 0.654902, 1, 0, 1,
-0.7116134, -0.8551539, -2.093165, 0.6509804, 1, 0, 1,
-0.7104834, 1.091713, 0.06910591, 0.6431373, 1, 0, 1,
-0.7087204, -1.697452, -3.590235, 0.6392157, 1, 0, 1,
-0.7047256, -0.5413173, -1.277584, 0.6313726, 1, 0, 1,
-0.7033862, -0.05240444, -0.6323125, 0.627451, 1, 0, 1,
-0.7005621, 0.831907, -1.419965, 0.6196079, 1, 0, 1,
-0.6924539, 1.328908, -1.089629, 0.6156863, 1, 0, 1,
-0.6892452, -1.107058, -1.57923, 0.6078432, 1, 0, 1,
-0.6834828, 0.3389165, -0.6694888, 0.6039216, 1, 0, 1,
-0.676595, 1.570339, -0.4034421, 0.5960785, 1, 0, 1,
-0.673411, -1.481744, -2.598253, 0.5882353, 1, 0, 1,
-0.6715665, 1.323778, -0.3412144, 0.5843138, 1, 0, 1,
-0.671012, -0.9573219, -4.479765, 0.5764706, 1, 0, 1,
-0.6700035, 0.2728376, 0.6812602, 0.572549, 1, 0, 1,
-0.6665625, -0.5280278, -1.531032, 0.5647059, 1, 0, 1,
-0.66575, 0.2173887, -2.563177, 0.5607843, 1, 0, 1,
-0.660736, -0.5695735, -2.082727, 0.5529412, 1, 0, 1,
-0.6560308, 0.09891295, -2.200186, 0.5490196, 1, 0, 1,
-0.6517571, -2.03222, -4.64886, 0.5411765, 1, 0, 1,
-0.6515467, 1.297765, 0.7644158, 0.5372549, 1, 0, 1,
-0.6499515, 0.236033, -2.276219, 0.5294118, 1, 0, 1,
-0.6490945, -2.379772, -2.585331, 0.5254902, 1, 0, 1,
-0.6477239, 1.11211, 1.317866, 0.5176471, 1, 0, 1,
-0.6435828, 1.674506, -0.2556736, 0.5137255, 1, 0, 1,
-0.637449, -1.387816, -3.010124, 0.5058824, 1, 0, 1,
-0.6339501, 1.504707, -1.294486, 0.5019608, 1, 0, 1,
-0.6224083, 0.6819456, -2.142756, 0.4941176, 1, 0, 1,
-0.6179692, 1.504161, 0.5126958, 0.4862745, 1, 0, 1,
-0.6137787, 0.8284802, -0.3697882, 0.4823529, 1, 0, 1,
-0.6114335, -1.454166, -0.2921607, 0.4745098, 1, 0, 1,
-0.6105543, 0.09833664, -1.245825, 0.4705882, 1, 0, 1,
-0.6090446, 0.1328328, -1.492302, 0.4627451, 1, 0, 1,
-0.6074631, -0.400057, -2.184129, 0.4588235, 1, 0, 1,
-0.6063555, -0.1996392, -1.886798, 0.4509804, 1, 0, 1,
-0.6016267, 0.5502319, -0.8442737, 0.4470588, 1, 0, 1,
-0.6013978, 0.8037553, -1.972149, 0.4392157, 1, 0, 1,
-0.5967245, -0.4923564, -0.6471261, 0.4352941, 1, 0, 1,
-0.5956134, -1.683788, -1.936266, 0.427451, 1, 0, 1,
-0.5952559, -0.186674, -3.294875, 0.4235294, 1, 0, 1,
-0.595201, 0.7811957, 0.4115226, 0.4156863, 1, 0, 1,
-0.5951477, -1.319465, -4.854255, 0.4117647, 1, 0, 1,
-0.593931, -1.164475, -3.28627, 0.4039216, 1, 0, 1,
-0.5903262, 1.183431, -2.44032, 0.3960784, 1, 0, 1,
-0.5856655, -0.2717246, -3.240044, 0.3921569, 1, 0, 1,
-0.5773813, -0.7262503, -2.85267, 0.3843137, 1, 0, 1,
-0.5733441, -0.2035629, -1.142074, 0.3803922, 1, 0, 1,
-0.5732449, -0.2332857, -1.487222, 0.372549, 1, 0, 1,
-0.5654382, -0.214952, -1.212557, 0.3686275, 1, 0, 1,
-0.5644517, -0.8338509, -1.32625, 0.3607843, 1, 0, 1,
-0.5621579, 0.627317, -2.345567, 0.3568628, 1, 0, 1,
-0.5600561, -0.2318703, -1.185547, 0.3490196, 1, 0, 1,
-0.5524044, 0.6811461, -0.9590166, 0.345098, 1, 0, 1,
-0.5511331, 0.2860658, -2.329586, 0.3372549, 1, 0, 1,
-0.5503386, -1.721308, -2.305931, 0.3333333, 1, 0, 1,
-0.5482726, -0.09725226, -2.568821, 0.3254902, 1, 0, 1,
-0.5476747, -0.01061719, -1.618369, 0.3215686, 1, 0, 1,
-0.5475951, -0.4656533, -2.144489, 0.3137255, 1, 0, 1,
-0.540386, -1.626308, -2.849826, 0.3098039, 1, 0, 1,
-0.5350131, -0.1798041, -2.63862, 0.3019608, 1, 0, 1,
-0.5296003, 1.283823, -0.552821, 0.2941177, 1, 0, 1,
-0.518239, 0.9011406, 0.8156731, 0.2901961, 1, 0, 1,
-0.5104266, -0.7067993, -3.655894, 0.282353, 1, 0, 1,
-0.5021356, 0.7068614, -0.6895199, 0.2784314, 1, 0, 1,
-0.5017405, -0.9551032, -3.222398, 0.2705882, 1, 0, 1,
-0.4975763, -0.9565067, -3.804234, 0.2666667, 1, 0, 1,
-0.4968745, 1.001227, 0.08973198, 0.2588235, 1, 0, 1,
-0.4873905, -0.506098, -1.183975, 0.254902, 1, 0, 1,
-0.4870079, -0.2352847, -0.1554293, 0.2470588, 1, 0, 1,
-0.4805587, -0.5400234, -2.679655, 0.2431373, 1, 0, 1,
-0.4776129, 2.422082, -0.6885357, 0.2352941, 1, 0, 1,
-0.477425, 0.6011904, -2.783, 0.2313726, 1, 0, 1,
-0.4755185, -0.8110421, -2.709334, 0.2235294, 1, 0, 1,
-0.4751595, 0.1307709, -1.789789, 0.2196078, 1, 0, 1,
-0.4734696, -0.4279245, -2.12218, 0.2117647, 1, 0, 1,
-0.4718391, -0.2636623, -2.345341, 0.2078431, 1, 0, 1,
-0.4711606, -1.54615, -3.566153, 0.2, 1, 0, 1,
-0.4630929, -1.409778, -3.025568, 0.1921569, 1, 0, 1,
-0.4620973, -1.02272, -0.9515742, 0.1882353, 1, 0, 1,
-0.4610012, 0.4135437, 2.085752, 0.1803922, 1, 0, 1,
-0.4609259, -0.2655764, -1.020968, 0.1764706, 1, 0, 1,
-0.4608413, -1.935149, -1.783244, 0.1686275, 1, 0, 1,
-0.4607884, 0.1375264, -0.1667074, 0.1647059, 1, 0, 1,
-0.4569323, 2.047242, 0.1184169, 0.1568628, 1, 0, 1,
-0.4556371, 1.005535, 0.3680248, 0.1529412, 1, 0, 1,
-0.452795, 0.2685376, -0.6500817, 0.145098, 1, 0, 1,
-0.4482893, -0.8164834, -4.993029, 0.1411765, 1, 0, 1,
-0.4450585, 0.8271781, -1.141378, 0.1333333, 1, 0, 1,
-0.4420412, -0.6618682, -3.196039, 0.1294118, 1, 0, 1,
-0.4352165, -0.4993437, -4.430736, 0.1215686, 1, 0, 1,
-0.4348354, 2.713765, -0.9664047, 0.1176471, 1, 0, 1,
-0.4336208, 1.313071, 0.4692385, 0.1098039, 1, 0, 1,
-0.4320321, -0.2992243, -2.345506, 0.1058824, 1, 0, 1,
-0.4272167, -0.5599987, -1.725116, 0.09803922, 1, 0, 1,
-0.4229169, 0.4147893, 0.03163027, 0.09019608, 1, 0, 1,
-0.4169455, 1.321522, -1.916248, 0.08627451, 1, 0, 1,
-0.4062244, 1.006064, -2.048481, 0.07843138, 1, 0, 1,
-0.4059287, -0.04902322, -1.953866, 0.07450981, 1, 0, 1,
-0.4017583, 0.8203639, -0.1036969, 0.06666667, 1, 0, 1,
-0.3975853, 1.652794, -1.201663, 0.0627451, 1, 0, 1,
-0.3960717, 0.2628374, -1.029592, 0.05490196, 1, 0, 1,
-0.3934625, -0.1703593, -2.233874, 0.05098039, 1, 0, 1,
-0.3847453, 0.1787191, 0.1048237, 0.04313726, 1, 0, 1,
-0.383907, -0.7570328, -3.147257, 0.03921569, 1, 0, 1,
-0.3815513, 1.368026, 2.330389, 0.03137255, 1, 0, 1,
-0.3811018, 2.023319, -0.0756994, 0.02745098, 1, 0, 1,
-0.3801309, -1.984603, -4.254302, 0.01960784, 1, 0, 1,
-0.3794559, 0.5453503, 1.30811, 0.01568628, 1, 0, 1,
-0.3790309, -0.3376155, -2.525112, 0.007843138, 1, 0, 1,
-0.3721288, -0.6365176, -4.084383, 0.003921569, 1, 0, 1,
-0.3688848, -1.030216, -5.02856, 0, 1, 0.003921569, 1,
-0.3657454, 0.4291441, 0.473646, 0, 1, 0.01176471, 1,
-0.3630082, 0.5531725, 0.7017968, 0, 1, 0.01568628, 1,
-0.3574947, -1.525153, -3.40161, 0, 1, 0.02352941, 1,
-0.3521487, 1.194375, -1.274259, 0, 1, 0.02745098, 1,
-0.3508471, -2.888029, -3.117376, 0, 1, 0.03529412, 1,
-0.3508449, -0.5852706, -2.281981, 0, 1, 0.03921569, 1,
-0.350124, 0.4355411, -0.05729586, 0, 1, 0.04705882, 1,
-0.3463691, 1.928859, 0.07718509, 0, 1, 0.05098039, 1,
-0.3446431, -0.6183584, -2.18304, 0, 1, 0.05882353, 1,
-0.3440847, 0.3781157, -0.8083616, 0, 1, 0.0627451, 1,
-0.3423771, 0.8714457, -0.6797049, 0, 1, 0.07058824, 1,
-0.3400741, -0.7893159, -4.050252, 0, 1, 0.07450981, 1,
-0.3369648, 1.128728, 1.139834, 0, 1, 0.08235294, 1,
-0.3314909, 1.746116, 0.2902569, 0, 1, 0.08627451, 1,
-0.3294215, -0.974301, -3.888916, 0, 1, 0.09411765, 1,
-0.328103, 0.383963, -1.242962, 0, 1, 0.1019608, 1,
-0.3221731, 1.345568, -1.664405, 0, 1, 0.1058824, 1,
-0.3145927, -1.318436, -3.977629, 0, 1, 0.1137255, 1,
-0.3142138, -0.1490702, -1.529466, 0, 1, 0.1176471, 1,
-0.3126559, -0.0377175, -0.9896879, 0, 1, 0.1254902, 1,
-0.3114181, -0.5384272, -3.0741, 0, 1, 0.1294118, 1,
-0.3112911, -0.4034169, -2.51732, 0, 1, 0.1372549, 1,
-0.3015796, 0.0004745998, -1.205114, 0, 1, 0.1411765, 1,
-0.3008662, -0.5941969, -4.4182, 0, 1, 0.1490196, 1,
-0.2923119, -0.3363687, -2.81256, 0, 1, 0.1529412, 1,
-0.2922834, 1.411446, -0.09646788, 0, 1, 0.1607843, 1,
-0.2907012, -0.9604561, -1.961163, 0, 1, 0.1647059, 1,
-0.2810414, 0.6939958, -0.08503239, 0, 1, 0.172549, 1,
-0.2765745, -0.785324, -1.859274, 0, 1, 0.1764706, 1,
-0.2759234, -0.9442936, -3.597355, 0, 1, 0.1843137, 1,
-0.2743734, -0.7543899, -2.430939, 0, 1, 0.1882353, 1,
-0.273884, 0.4914613, -1.377065, 0, 1, 0.1960784, 1,
-0.2722719, 0.5166134, -0.5223675, 0, 1, 0.2039216, 1,
-0.2718882, 0.4869958, 1.209404, 0, 1, 0.2078431, 1,
-0.2697931, 0.02974643, 0.01693114, 0, 1, 0.2156863, 1,
-0.2682328, 0.7201484, 0.210136, 0, 1, 0.2196078, 1,
-0.2681095, 0.6341307, -2.029217, 0, 1, 0.227451, 1,
-0.2664615, 1.390477, -0.511012, 0, 1, 0.2313726, 1,
-0.2640089, -0.4842251, -3.057337, 0, 1, 0.2392157, 1,
-0.2635672, 0.5403117, -2.110577, 0, 1, 0.2431373, 1,
-0.262901, 1.298587, -0.1303176, 0, 1, 0.2509804, 1,
-0.2616865, -1.360129, -2.718345, 0, 1, 0.254902, 1,
-0.2616826, 0.5596904, -1.547077, 0, 1, 0.2627451, 1,
-0.2581003, 0.248551, -0.3198054, 0, 1, 0.2666667, 1,
-0.2566595, 0.4535833, -0.9943551, 0, 1, 0.2745098, 1,
-0.2555061, 0.6430616, 1.580799, 0, 1, 0.2784314, 1,
-0.2544437, -0.7723486, -2.298007, 0, 1, 0.2862745, 1,
-0.2534339, 2.357247, 0.4006622, 0, 1, 0.2901961, 1,
-0.2482956, 0.356387, 0.4011239, 0, 1, 0.2980392, 1,
-0.2457531, -1.133894, -3.407041, 0, 1, 0.3058824, 1,
-0.2455179, -0.03984723, -2.98912, 0, 1, 0.3098039, 1,
-0.2378234, 1.052086, -0.493488, 0, 1, 0.3176471, 1,
-0.2373943, 0.07667778, -3.006278, 0, 1, 0.3215686, 1,
-0.2365479, -0.1796225, -1.969966, 0, 1, 0.3294118, 1,
-0.2354834, 1.512506, 1.314351, 0, 1, 0.3333333, 1,
-0.229304, 1.010466, -0.7422221, 0, 1, 0.3411765, 1,
-0.2270888, -0.2344061, -0.4197403, 0, 1, 0.345098, 1,
-0.2248977, -1.440258, -2.673266, 0, 1, 0.3529412, 1,
-0.2209322, -0.4231807, -3.871655, 0, 1, 0.3568628, 1,
-0.2204271, 3.015867, -0.4962243, 0, 1, 0.3647059, 1,
-0.2187539, -0.9777301, -2.210066, 0, 1, 0.3686275, 1,
-0.2185714, 0.9970007, -0.05308152, 0, 1, 0.3764706, 1,
-0.2144685, 0.9632328, -1.970198, 0, 1, 0.3803922, 1,
-0.2137806, 0.3954778, 0.9177753, 0, 1, 0.3882353, 1,
-0.2117633, 0.4016905, 1.111885, 0, 1, 0.3921569, 1,
-0.1987973, 1.012097, -0.05689176, 0, 1, 0.4, 1,
-0.1939015, -1.573132, -3.788235, 0, 1, 0.4078431, 1,
-0.1892813, 0.2829837, -1.462028, 0, 1, 0.4117647, 1,
-0.1882924, -1.482796, -4.219121, 0, 1, 0.4196078, 1,
-0.1878562, 1.126596, 0.3510294, 0, 1, 0.4235294, 1,
-0.1852999, 0.481719, 2.021054, 0, 1, 0.4313726, 1,
-0.1847642, -0.2263029, -2.586734, 0, 1, 0.4352941, 1,
-0.1832446, -0.2376183, -2.808487, 0, 1, 0.4431373, 1,
-0.1825216, -1.32948, -4.710684, 0, 1, 0.4470588, 1,
-0.1813987, -0.9423564, -2.32713, 0, 1, 0.454902, 1,
-0.1799321, 0.02689285, -0.6166183, 0, 1, 0.4588235, 1,
-0.1776754, -1.645114, -3.577328, 0, 1, 0.4666667, 1,
-0.1738445, -0.3563995, -1.752497, 0, 1, 0.4705882, 1,
-0.172538, -1.499138, -2.595003, 0, 1, 0.4784314, 1,
-0.1680619, -0.09937728, -1.18988, 0, 1, 0.4823529, 1,
-0.1595946, 0.0401325, -1.316428, 0, 1, 0.4901961, 1,
-0.1580288, 1.026655, -0.3649126, 0, 1, 0.4941176, 1,
-0.1505287, 0.573742, -1.893442, 0, 1, 0.5019608, 1,
-0.1393088, 0.2984318, -0.1174939, 0, 1, 0.509804, 1,
-0.1349872, -0.4204903, -1.758887, 0, 1, 0.5137255, 1,
-0.134155, 0.4601933, -0.9932871, 0, 1, 0.5215687, 1,
-0.1318593, 0.6994487, -1.228001, 0, 1, 0.5254902, 1,
-0.1303844, -1.135095, -2.193084, 0, 1, 0.5333334, 1,
-0.1267634, -1.628467, -2.850163, 0, 1, 0.5372549, 1,
-0.1225464, 0.1349923, -2.421442, 0, 1, 0.5450981, 1,
-0.1222538, 0.2677981, -0.2867771, 0, 1, 0.5490196, 1,
-0.1214206, 0.1223696, -1.029234, 0, 1, 0.5568628, 1,
-0.1142413, 2.395883, 0.7562904, 0, 1, 0.5607843, 1,
-0.1129652, -1.857266, -3.947878, 0, 1, 0.5686275, 1,
-0.1111652, -1.071557, -1.803478, 0, 1, 0.572549, 1,
-0.1080862, -1.304272, -4.045331, 0, 1, 0.5803922, 1,
-0.100433, -1.085822, -2.418331, 0, 1, 0.5843138, 1,
-0.09993371, 0.778239, -0.5914814, 0, 1, 0.5921569, 1,
-0.09831916, 0.7555181, 0.5902346, 0, 1, 0.5960785, 1,
-0.09820621, -0.7882625, -2.884877, 0, 1, 0.6039216, 1,
-0.08760506, -3.111771, -1.994088, 0, 1, 0.6117647, 1,
-0.08537666, 0.7406954, -0.237968, 0, 1, 0.6156863, 1,
-0.08317602, -0.06357519, -3.29597, 0, 1, 0.6235294, 1,
-0.08272809, -0.2640341, -3.227819, 0, 1, 0.627451, 1,
-0.0805117, 0.8676466, 0.2871794, 0, 1, 0.6352941, 1,
-0.08017202, -0.6188377, -1.770769, 0, 1, 0.6392157, 1,
-0.0783524, 0.1231705, 0.6860234, 0, 1, 0.6470588, 1,
-0.07622111, -1.226298, -3.430663, 0, 1, 0.6509804, 1,
-0.07571531, -0.2167258, -3.346072, 0, 1, 0.6588235, 1,
-0.07567363, 1.05346, 0.3431576, 0, 1, 0.6627451, 1,
-0.07540467, -1.02854, -2.38206, 0, 1, 0.6705883, 1,
-0.07403672, -1.020192, -1.112395, 0, 1, 0.6745098, 1,
-0.07311853, -0.1969467, -2.392471, 0, 1, 0.682353, 1,
-0.07302646, -0.04865286, -2.986269, 0, 1, 0.6862745, 1,
-0.06938525, 0.5104989, 0.09630993, 0, 1, 0.6941177, 1,
-0.06739986, -0.4961123, -2.187708, 0, 1, 0.7019608, 1,
-0.06329993, -1.125668, -2.566735, 0, 1, 0.7058824, 1,
-0.06311294, 0.2862603, -0.9233376, 0, 1, 0.7137255, 1,
-0.06138249, 0.6512191, -1.06959, 0, 1, 0.7176471, 1,
-0.05952401, 0.7603408, -0.3394899, 0, 1, 0.7254902, 1,
-0.05911643, -0.8550033, -3.001385, 0, 1, 0.7294118, 1,
-0.05626825, -1.695769, -1.612069, 0, 1, 0.7372549, 1,
-0.05491993, -0.09168635, -3.726521, 0, 1, 0.7411765, 1,
-0.04870993, 0.9786246, -0.4045511, 0, 1, 0.7490196, 1,
-0.04816027, -0.08333623, -2.377074, 0, 1, 0.7529412, 1,
-0.0473926, -0.8192075, -2.876644, 0, 1, 0.7607843, 1,
-0.04233548, 2.421939, 0.7992699, 0, 1, 0.7647059, 1,
-0.03876733, 1.122448, -0.934308, 0, 1, 0.772549, 1,
-0.03725265, 1.054551, -2.518938, 0, 1, 0.7764706, 1,
-0.03578274, 0.6950967, -1.291067, 0, 1, 0.7843137, 1,
-0.0341285, -0.4106044, -2.950823, 0, 1, 0.7882353, 1,
-0.03071057, -0.2705303, -2.130213, 0, 1, 0.7960784, 1,
-0.02913764, 0.3227594, 0.9024823, 0, 1, 0.8039216, 1,
-0.02823149, -1.731701, -2.550921, 0, 1, 0.8078431, 1,
-0.02805887, 0.7555049, -0.06043696, 0, 1, 0.8156863, 1,
-0.02575623, 0.5182994, -0.9853345, 0, 1, 0.8196079, 1,
-0.02382018, 1.956106, 0.3430686, 0, 1, 0.827451, 1,
-0.02325262, 0.3428631, -0.2308532, 0, 1, 0.8313726, 1,
-0.02068532, -1.381631, -2.835886, 0, 1, 0.8392157, 1,
-0.01976508, -0.3999909, -5.587274, 0, 1, 0.8431373, 1,
-0.01409013, -0.6942603, -2.294938, 0, 1, 0.8509804, 1,
-0.01188215, 0.201609, 1.739247, 0, 1, 0.854902, 1,
-0.0117574, -0.1218078, -3.519308, 0, 1, 0.8627451, 1,
-0.01006882, 1.507256, 0.008406412, 0, 1, 0.8666667, 1,
-0.008618489, -2.263751, -3.541082, 0, 1, 0.8745098, 1,
-0.003605561, 1.207547, -0.7856602, 0, 1, 0.8784314, 1,
-0.0003393796, -1.45531, -3.53632, 0, 1, 0.8862745, 1,
0.003587567, 1.314424, -0.2051447, 0, 1, 0.8901961, 1,
0.004519256, -0.2209766, 5.774104, 0, 1, 0.8980392, 1,
0.006621267, 1.012681, 0.0915027, 0, 1, 0.9058824, 1,
0.009669752, -0.1735056, 3.432942, 0, 1, 0.9098039, 1,
0.01052557, 1.681922, -1.214729, 0, 1, 0.9176471, 1,
0.0113632, 0.2860984, -1.150109, 0, 1, 0.9215686, 1,
0.01267047, -0.0793291, 3.263498, 0, 1, 0.9294118, 1,
0.01363392, 0.7673954, -0.1898421, 0, 1, 0.9333333, 1,
0.01467962, -1.257282, 3.947747, 0, 1, 0.9411765, 1,
0.01992025, 0.04402352, -0.7471188, 0, 1, 0.945098, 1,
0.02063051, -1.395513, 3.144125, 0, 1, 0.9529412, 1,
0.02644954, -1.830367, 2.390004, 0, 1, 0.9568627, 1,
0.02700177, 0.1284354, -1.877098, 0, 1, 0.9647059, 1,
0.02823468, 0.7808986, 0.06711472, 0, 1, 0.9686275, 1,
0.03240432, -0.7782928, 3.91937, 0, 1, 0.9764706, 1,
0.03318124, 0.06125054, 0.3765028, 0, 1, 0.9803922, 1,
0.03571931, -0.3954408, 2.957942, 0, 1, 0.9882353, 1,
0.03683023, 0.04497926, 1.22832, 0, 1, 0.9921569, 1,
0.03807244, 1.074023, -0.9119471, 0, 1, 1, 1,
0.03950972, -0.09363861, 3.944271, 0, 0.9921569, 1, 1,
0.03976582, -0.686433, 1.644643, 0, 0.9882353, 1, 1,
0.04004958, -0.9480345, 3.011446, 0, 0.9803922, 1, 1,
0.04065073, 0.7538455, 1.521622, 0, 0.9764706, 1, 1,
0.04181026, 0.2953701, -0.03738936, 0, 0.9686275, 1, 1,
0.04186457, -0.004783959, 3.720388, 0, 0.9647059, 1, 1,
0.04215634, -0.03833028, 4.128163, 0, 0.9568627, 1, 1,
0.04811116, -0.4555168, 2.193506, 0, 0.9529412, 1, 1,
0.04817809, -1.160524, 3.413502, 0, 0.945098, 1, 1,
0.04917246, 0.5049564, -1.870996, 0, 0.9411765, 1, 1,
0.05236519, -1.343108, 4.819613, 0, 0.9333333, 1, 1,
0.054234, -0.484427, 1.106482, 0, 0.9294118, 1, 1,
0.05446501, -0.9427518, 2.6157, 0, 0.9215686, 1, 1,
0.05878938, 0.586123, -0.2373963, 0, 0.9176471, 1, 1,
0.06134057, 1.111382, -0.1480283, 0, 0.9098039, 1, 1,
0.06271388, 0.134894, -0.367218, 0, 0.9058824, 1, 1,
0.07126981, -0.9116139, 2.430569, 0, 0.8980392, 1, 1,
0.0821426, -0.4225289, 2.287936, 0, 0.8901961, 1, 1,
0.08345045, -0.9100462, 2.167446, 0, 0.8862745, 1, 1,
0.08489449, 0.1979787, 0.6918857, 0, 0.8784314, 1, 1,
0.08750053, 0.5874253, 0.9493735, 0, 0.8745098, 1, 1,
0.09016491, -0.5633906, 1.049549, 0, 0.8666667, 1, 1,
0.09190567, 0.4375226, 0.295893, 0, 0.8627451, 1, 1,
0.09272051, 0.5262062, 0.3848992, 0, 0.854902, 1, 1,
0.09443764, 0.4236057, -0.9011799, 0, 0.8509804, 1, 1,
0.09455714, -0.9173661, 2.350061, 0, 0.8431373, 1, 1,
0.09561098, 2.354665, 0.9813841, 0, 0.8392157, 1, 1,
0.1034278, -0.4101077, 2.441532, 0, 0.8313726, 1, 1,
0.104344, -0.7469979, 3.98993, 0, 0.827451, 1, 1,
0.1060259, -0.5701463, 2.452823, 0, 0.8196079, 1, 1,
0.1085017, 0.5103551, -0.5887316, 0, 0.8156863, 1, 1,
0.1118375, -1.242262, 1.982411, 0, 0.8078431, 1, 1,
0.1120193, 0.6936588, 1.540774, 0, 0.8039216, 1, 1,
0.1125252, 0.3352172, 0.06837973, 0, 0.7960784, 1, 1,
0.1131571, 0.2986544, -0.5489553, 0, 0.7882353, 1, 1,
0.114553, -1.561239, 2.512946, 0, 0.7843137, 1, 1,
0.1188776, -1.2199, 2.791995, 0, 0.7764706, 1, 1,
0.1200956, -0.4694217, 2.124631, 0, 0.772549, 1, 1,
0.1205685, -0.5285497, 0.1945068, 0, 0.7647059, 1, 1,
0.1217768, 0.455426, 1.014906, 0, 0.7607843, 1, 1,
0.1236219, 2.08862, 0.09519307, 0, 0.7529412, 1, 1,
0.1247068, 0.3864255, 1.443033, 0, 0.7490196, 1, 1,
0.126286, -0.3865172, 2.685593, 0, 0.7411765, 1, 1,
0.1277571, -0.7084047, 3.903484, 0, 0.7372549, 1, 1,
0.1295334, -1.014831, 1.254718, 0, 0.7294118, 1, 1,
0.1367029, 0.5989721, 1.457814, 0, 0.7254902, 1, 1,
0.1388897, -0.1867943, 3.01861, 0, 0.7176471, 1, 1,
0.1397922, -0.03649322, 3.485561, 0, 0.7137255, 1, 1,
0.140224, 0.3310437, 0.2018874, 0, 0.7058824, 1, 1,
0.1408827, 1.037248, 0.7242863, 0, 0.6980392, 1, 1,
0.1417488, 0.1181435, 0.1341108, 0, 0.6941177, 1, 1,
0.1455422, 1.614316, -1.260396, 0, 0.6862745, 1, 1,
0.1462809, 0.09498879, 0.06556135, 0, 0.682353, 1, 1,
0.148317, -1.183005, 3.220079, 0, 0.6745098, 1, 1,
0.1508628, 0.0297836, -0.4345339, 0, 0.6705883, 1, 1,
0.1560117, 0.6037584, 1.990956, 0, 0.6627451, 1, 1,
0.1571482, 0.8272879, -0.06063235, 0, 0.6588235, 1, 1,
0.1579533, 0.8951157, 0.01101356, 0, 0.6509804, 1, 1,
0.1582289, -0.6420681, 2.656578, 0, 0.6470588, 1, 1,
0.1591442, 0.5929101, -0.2895356, 0, 0.6392157, 1, 1,
0.1599009, -0.134476, 3.122364, 0, 0.6352941, 1, 1,
0.1634159, -0.8645149, 2.931, 0, 0.627451, 1, 1,
0.1640517, -0.4010821, 1.844848, 0, 0.6235294, 1, 1,
0.1642804, 0.5772216, -0.1632401, 0, 0.6156863, 1, 1,
0.1650336, 0.2318992, -0.5141142, 0, 0.6117647, 1, 1,
0.1680572, -2.798969, 2.15645, 0, 0.6039216, 1, 1,
0.1682749, -1.963912, 3.435568, 0, 0.5960785, 1, 1,
0.1684584, -0.8291677, 3.371693, 0, 0.5921569, 1, 1,
0.1698999, 2.246036, 0.07815083, 0, 0.5843138, 1, 1,
0.170698, 1.55264, 2.527152, 0, 0.5803922, 1, 1,
0.1747038, -0.392655, 1.161552, 0, 0.572549, 1, 1,
0.1748562, -0.02704185, 2.491656, 0, 0.5686275, 1, 1,
0.1758003, -0.1920494, 2.414871, 0, 0.5607843, 1, 1,
0.1787497, 1.170926, 0.7146162, 0, 0.5568628, 1, 1,
0.1810632, -1.063254, 1.826207, 0, 0.5490196, 1, 1,
0.186156, 0.5826573, 1.36702, 0, 0.5450981, 1, 1,
0.1893951, -1.331264, 4.086692, 0, 0.5372549, 1, 1,
0.1919931, -0.9024532, 2.338529, 0, 0.5333334, 1, 1,
0.2004103, -0.197974, 2.47967, 0, 0.5254902, 1, 1,
0.202566, 1.199463, 1.390118, 0, 0.5215687, 1, 1,
0.2033235, -0.9759986, 1.813946, 0, 0.5137255, 1, 1,
0.2079379, -0.8650931, 2.022997, 0, 0.509804, 1, 1,
0.2079936, -1.173906, 3.146272, 0, 0.5019608, 1, 1,
0.2116489, 0.1161923, 0.9938409, 0, 0.4941176, 1, 1,
0.2152686, 0.06922668, -0.0588205, 0, 0.4901961, 1, 1,
0.2172994, -1.491268, 3.639224, 0, 0.4823529, 1, 1,
0.2230259, -2.049464, 4.778304, 0, 0.4784314, 1, 1,
0.2249153, -1.247163, 1.46372, 0, 0.4705882, 1, 1,
0.2280917, 0.07916527, 1.444957, 0, 0.4666667, 1, 1,
0.2286912, 1.249088, 0.9596398, 0, 0.4588235, 1, 1,
0.2288009, 0.4731304, 0.7406715, 0, 0.454902, 1, 1,
0.236009, 0.6872851, 0.3010424, 0, 0.4470588, 1, 1,
0.2455854, -0.9712644, 2.621573, 0, 0.4431373, 1, 1,
0.2482203, -0.1319255, 0.1952258, 0, 0.4352941, 1, 1,
0.2553964, 1.978546, -1.369002, 0, 0.4313726, 1, 1,
0.2563546, -1.789932, 2.680474, 0, 0.4235294, 1, 1,
0.2586646, 2.696591, 0.6077923, 0, 0.4196078, 1, 1,
0.2635834, 0.03981121, 1.618435, 0, 0.4117647, 1, 1,
0.2641428, -0.6989563, 1.882589, 0, 0.4078431, 1, 1,
0.2643038, 0.3827548, 1.806127, 0, 0.4, 1, 1,
0.266256, -0.6478705, 2.374081, 0, 0.3921569, 1, 1,
0.2690979, 0.07185006, 2.016595, 0, 0.3882353, 1, 1,
0.2698289, 2.276236, 1.669371, 0, 0.3803922, 1, 1,
0.2762938, 0.9127871, -0.2574981, 0, 0.3764706, 1, 1,
0.2797166, 0.9161538, 1.211831, 0, 0.3686275, 1, 1,
0.2824247, 0.4593033, 0.8712052, 0, 0.3647059, 1, 1,
0.2826305, 0.6365686, 0.1681698, 0, 0.3568628, 1, 1,
0.2842824, -0.1823701, 3.35971, 0, 0.3529412, 1, 1,
0.2881172, -0.571936, 5.000736, 0, 0.345098, 1, 1,
0.2882605, 1.155686, -0.5481656, 0, 0.3411765, 1, 1,
0.2914847, 0.4961801, 0.08687153, 0, 0.3333333, 1, 1,
0.2957181, -0.1875395, 1.210584, 0, 0.3294118, 1, 1,
0.3005892, 0.9657753, 0.3126951, 0, 0.3215686, 1, 1,
0.3031247, 0.1781453, 0.8260924, 0, 0.3176471, 1, 1,
0.303211, 1.136768, -0.1779919, 0, 0.3098039, 1, 1,
0.3061291, 0.1837411, 0.7254593, 0, 0.3058824, 1, 1,
0.315266, -0.5844568, 2.174219, 0, 0.2980392, 1, 1,
0.3199766, -1.093446, 2.052948, 0, 0.2901961, 1, 1,
0.3205645, 0.368877, 0.03360688, 0, 0.2862745, 1, 1,
0.3205837, 2.450804, 2.280504, 0, 0.2784314, 1, 1,
0.3265706, -0.7236516, 2.137015, 0, 0.2745098, 1, 1,
0.3276224, 0.08823881, -1.373751, 0, 0.2666667, 1, 1,
0.3285375, -1.054094, 2.601557, 0, 0.2627451, 1, 1,
0.3302302, -0.2420193, 4.150664, 0, 0.254902, 1, 1,
0.3378581, -0.332306, 0.6102753, 0, 0.2509804, 1, 1,
0.3382391, -0.1848594, 1.333154, 0, 0.2431373, 1, 1,
0.3390378, -1.16292, 3.378688, 0, 0.2392157, 1, 1,
0.3420491, -0.692782, 2.819669, 0, 0.2313726, 1, 1,
0.3479947, 0.856268, 0.7742795, 0, 0.227451, 1, 1,
0.3514251, -0.7449796, 0.7239974, 0, 0.2196078, 1, 1,
0.352966, 0.4158939, 0.03344221, 0, 0.2156863, 1, 1,
0.3537503, -0.4649027, 3.261176, 0, 0.2078431, 1, 1,
0.3562391, -1.160394, 3.838979, 0, 0.2039216, 1, 1,
0.3566067, -1.576638, 1.536534, 0, 0.1960784, 1, 1,
0.359049, 2.258188, 0.6756324, 0, 0.1882353, 1, 1,
0.3620844, 0.730897, -0.5546979, 0, 0.1843137, 1, 1,
0.3656214, 1.82826, 1.474975, 0, 0.1764706, 1, 1,
0.3663173, 1.072103, -0.7147727, 0, 0.172549, 1, 1,
0.367607, -0.4651636, 3.18628, 0, 0.1647059, 1, 1,
0.3783922, 0.9229521, -1.058271, 0, 0.1607843, 1, 1,
0.3785417, 0.6904987, 0.5714708, 0, 0.1529412, 1, 1,
0.3823985, 0.4922717, 1.225456, 0, 0.1490196, 1, 1,
0.3840409, -0.5963063, 3.18667, 0, 0.1411765, 1, 1,
0.3849309, -0.4704969, 2.637315, 0, 0.1372549, 1, 1,
0.3854318, 0.1236106, 0.7901764, 0, 0.1294118, 1, 1,
0.3861179, 1.852477, 1.48753, 0, 0.1254902, 1, 1,
0.386779, 0.9727666, -0.4868248, 0, 0.1176471, 1, 1,
0.3878565, -0.8309266, 2.621742, 0, 0.1137255, 1, 1,
0.3880363, 0.05051401, 2.391954, 0, 0.1058824, 1, 1,
0.3922741, -2.09224, 2.478426, 0, 0.09803922, 1, 1,
0.3923846, -0.9106492, 3.303404, 0, 0.09411765, 1, 1,
0.3929931, -0.5915837, 2.001735, 0, 0.08627451, 1, 1,
0.3937547, -0.7058236, 1.410128, 0, 0.08235294, 1, 1,
0.3995047, 0.7080641, 0.6250443, 0, 0.07450981, 1, 1,
0.3996479, -0.5906774, 1.62217, 0, 0.07058824, 1, 1,
0.4034764, 0.7371109, -0.4038738, 0, 0.0627451, 1, 1,
0.4042777, 1.129996, 0.2377681, 0, 0.05882353, 1, 1,
0.4069218, 0.03349455, 0.1782647, 0, 0.05098039, 1, 1,
0.4079651, -0.0911111, 2.230207, 0, 0.04705882, 1, 1,
0.4087082, -0.2827602, 2.140752, 0, 0.03921569, 1, 1,
0.4101579, -0.5196232, 2.939932, 0, 0.03529412, 1, 1,
0.4138786, -0.7665004, 2.889976, 0, 0.02745098, 1, 1,
0.4141086, 0.004289042, 3.05599, 0, 0.02352941, 1, 1,
0.4159074, 0.9625567, 1.092783, 0, 0.01568628, 1, 1,
0.4182278, -0.784122, 1.329705, 0, 0.01176471, 1, 1,
0.4191011, 0.3949309, 0.3477983, 0, 0.003921569, 1, 1,
0.4191583, -0.3686129, 2.118765, 0.003921569, 0, 1, 1,
0.4236997, -0.3494733, 1.19032, 0.007843138, 0, 1, 1,
0.4291918, -0.03294801, 1.672561, 0.01568628, 0, 1, 1,
0.4315552, -1.163534, 3.628338, 0.01960784, 0, 1, 1,
0.4321641, -0.5650018, 2.171808, 0.02745098, 0, 1, 1,
0.4367974, 1.139659, 0.8854337, 0.03137255, 0, 1, 1,
0.4404811, -2.059656, 4.37583, 0.03921569, 0, 1, 1,
0.442555, 0.094059, 1.506698, 0.04313726, 0, 1, 1,
0.4463997, 0.1266455, 0.1480543, 0.05098039, 0, 1, 1,
0.4495152, 0.7179742, 1.708663, 0.05490196, 0, 1, 1,
0.4501311, 1.84333, 0.7717553, 0.0627451, 0, 1, 1,
0.4628798, -1.137275, 2.094635, 0.06666667, 0, 1, 1,
0.4679635, -2.109715, 1.706306, 0.07450981, 0, 1, 1,
0.4720289, -0.143967, 1.183757, 0.07843138, 0, 1, 1,
0.4767327, 0.6652105, 1.206541, 0.08627451, 0, 1, 1,
0.4773014, 2.006559, -1.181223, 0.09019608, 0, 1, 1,
0.4782274, -1.093338, 2.919157, 0.09803922, 0, 1, 1,
0.4824298, -2.073498, 0.4680932, 0.1058824, 0, 1, 1,
0.4851374, 0.09632482, -0.1046461, 0.1098039, 0, 1, 1,
0.4852037, -0.7844406, 1.989798, 0.1176471, 0, 1, 1,
0.4882313, -2.049592, 3.319207, 0.1215686, 0, 1, 1,
0.4882534, -1.777592, 4.484018, 0.1294118, 0, 1, 1,
0.4901719, -1.228484, 2.970455, 0.1333333, 0, 1, 1,
0.4929053, 0.6904768, 1.355844, 0.1411765, 0, 1, 1,
0.4939964, -0.7697945, 3.294375, 0.145098, 0, 1, 1,
0.4988855, -0.1706691, 1.09979, 0.1529412, 0, 1, 1,
0.500401, 0.1532053, 1.98711, 0.1568628, 0, 1, 1,
0.5116201, 0.06055292, 3.264628, 0.1647059, 0, 1, 1,
0.5142903, 1.665314, 0.8411469, 0.1686275, 0, 1, 1,
0.5177183, -1.34843, 3.150808, 0.1764706, 0, 1, 1,
0.5255324, 0.983243, -0.00934943, 0.1803922, 0, 1, 1,
0.5258676, -0.2196019, 2.414004, 0.1882353, 0, 1, 1,
0.5269855, 1.147203, 2.056713, 0.1921569, 0, 1, 1,
0.52905, -1.299075, 3.280962, 0.2, 0, 1, 1,
0.5292416, -1.62613, 1.687339, 0.2078431, 0, 1, 1,
0.5347695, -0.5666144, 3.233315, 0.2117647, 0, 1, 1,
0.541028, 0.7397268, 1.575674, 0.2196078, 0, 1, 1,
0.5423962, -1.040485, 2.054938, 0.2235294, 0, 1, 1,
0.5440497, 1.699135, 0.2668828, 0.2313726, 0, 1, 1,
0.5486231, -0.2433784, 1.38907, 0.2352941, 0, 1, 1,
0.5588333, -1.127406, 1.9598, 0.2431373, 0, 1, 1,
0.5753794, -0.8576854, -1.019848, 0.2470588, 0, 1, 1,
0.5774075, -0.07807364, 2.599324, 0.254902, 0, 1, 1,
0.5790414, 0.4482108, 0.1027731, 0.2588235, 0, 1, 1,
0.5812868, -2.893687, 4.504949, 0.2666667, 0, 1, 1,
0.5814729, -0.6962519, 2.674722, 0.2705882, 0, 1, 1,
0.5929061, -0.1965656, 1.443492, 0.2784314, 0, 1, 1,
0.5976566, -0.08696157, 4.376151, 0.282353, 0, 1, 1,
0.6018894, -0.1242435, 1.543432, 0.2901961, 0, 1, 1,
0.6102423, 0.7404776, 0.5730696, 0.2941177, 0, 1, 1,
0.6107246, 1.238727, -0.3139263, 0.3019608, 0, 1, 1,
0.6185385, -2.113263, 3.06041, 0.3098039, 0, 1, 1,
0.6241929, -0.5876271, 2.590249, 0.3137255, 0, 1, 1,
0.6283391, -0.1298859, 1.142896, 0.3215686, 0, 1, 1,
0.6286474, 0.3045073, 0.7374232, 0.3254902, 0, 1, 1,
0.6291472, -0.76218, 1.667501, 0.3333333, 0, 1, 1,
0.6323231, 0.1450248, 2.361291, 0.3372549, 0, 1, 1,
0.6346829, -0.8979045, 3.138654, 0.345098, 0, 1, 1,
0.6370761, -0.6242946, 3.017648, 0.3490196, 0, 1, 1,
0.6410621, 1.997676, 0.810427, 0.3568628, 0, 1, 1,
0.6452176, 1.365282, 0.1233625, 0.3607843, 0, 1, 1,
0.6579347, -1.453673, 2.744802, 0.3686275, 0, 1, 1,
0.6590227, -0.5053635, 2.702356, 0.372549, 0, 1, 1,
0.6592911, 0.7242208, 2.093519, 0.3803922, 0, 1, 1,
0.6606985, 0.8523418, -0.2831624, 0.3843137, 0, 1, 1,
0.6628214, -0.4089674, 2.587547, 0.3921569, 0, 1, 1,
0.6709648, 1.143884, -1.012774, 0.3960784, 0, 1, 1,
0.6745129, 0.3828872, 1.015818, 0.4039216, 0, 1, 1,
0.6786666, 0.1921106, 1.042427, 0.4117647, 0, 1, 1,
0.6838363, 0.62402, 1.327795, 0.4156863, 0, 1, 1,
0.6931929, 2.120873, 0.4448314, 0.4235294, 0, 1, 1,
0.6968884, -0.3740706, 2.113467, 0.427451, 0, 1, 1,
0.6971524, 0.4076371, 1.476305, 0.4352941, 0, 1, 1,
0.6985071, 0.472018, 1.593997, 0.4392157, 0, 1, 1,
0.6996514, 1.216867, 0.3331648, 0.4470588, 0, 1, 1,
0.7012032, 0.5371175, 1.712703, 0.4509804, 0, 1, 1,
0.7028388, -1.073232, 3.590788, 0.4588235, 0, 1, 1,
0.7033814, -0.7018499, 1.531058, 0.4627451, 0, 1, 1,
0.7065163, -1.518983, 3.935308, 0.4705882, 0, 1, 1,
0.707553, 0.1424869, 0.4669293, 0.4745098, 0, 1, 1,
0.7076914, 0.9437273, 1.243665, 0.4823529, 0, 1, 1,
0.7078842, -0.6731932, 2.720532, 0.4862745, 0, 1, 1,
0.7115251, -0.5617821, 1.690079, 0.4941176, 0, 1, 1,
0.7116207, 0.5752461, 1.690571, 0.5019608, 0, 1, 1,
0.7138197, 2.266946, 0.9749922, 0.5058824, 0, 1, 1,
0.7142032, -0.4937032, 3.216119, 0.5137255, 0, 1, 1,
0.7163634, -0.5383456, 1.766996, 0.5176471, 0, 1, 1,
0.7279508, -0.7016174, 3.910891, 0.5254902, 0, 1, 1,
0.7343904, 1.630003, 0.1788732, 0.5294118, 0, 1, 1,
0.7370324, -1.614189, 2.023775, 0.5372549, 0, 1, 1,
0.7380578, -0.03988227, 1.239149, 0.5411765, 0, 1, 1,
0.7404366, 0.03051949, 1.224904, 0.5490196, 0, 1, 1,
0.7430682, -1.188771, 0.06706687, 0.5529412, 0, 1, 1,
0.7444372, -0.30273, 1.411759, 0.5607843, 0, 1, 1,
0.7451361, -0.7276267, 0.7312543, 0.5647059, 0, 1, 1,
0.7470791, 0.2592987, 0.1476444, 0.572549, 0, 1, 1,
0.7481298, -0.7931591, 1.701669, 0.5764706, 0, 1, 1,
0.7490433, -0.5340967, 0.9780917, 0.5843138, 0, 1, 1,
0.750008, -1.629512, 1.383945, 0.5882353, 0, 1, 1,
0.7515911, -1.605572, 3.097813, 0.5960785, 0, 1, 1,
0.753558, 1.833525, 0.8796452, 0.6039216, 0, 1, 1,
0.75516, 0.4668048, 1.38203, 0.6078432, 0, 1, 1,
0.7562339, -0.2176385, 2.236011, 0.6156863, 0, 1, 1,
0.7620329, 1.138962, 0.4225535, 0.6196079, 0, 1, 1,
0.7647048, -0.5001029, 2.357371, 0.627451, 0, 1, 1,
0.7670351, -0.04554618, 1.433555, 0.6313726, 0, 1, 1,
0.7676728, -0.2999581, 1.291001, 0.6392157, 0, 1, 1,
0.7719035, -1.891776, 1.730287, 0.6431373, 0, 1, 1,
0.7724398, -2.499018, 2.046134, 0.6509804, 0, 1, 1,
0.7725704, -0.2681971, 0.3343911, 0.654902, 0, 1, 1,
0.7755704, 1.657155, 0.6829582, 0.6627451, 0, 1, 1,
0.7768573, 0.5101566, 0.5928885, 0.6666667, 0, 1, 1,
0.7847165, -0.9828349, 3.724795, 0.6745098, 0, 1, 1,
0.7869024, 1.979894, 1.313643, 0.6784314, 0, 1, 1,
0.7945623, 1.44629, 0.1616672, 0.6862745, 0, 1, 1,
0.7971728, 1.126238, 0.9019002, 0.6901961, 0, 1, 1,
0.7990566, -1.167778, 3.159031, 0.6980392, 0, 1, 1,
0.8060349, 0.4825895, 0.7484655, 0.7058824, 0, 1, 1,
0.8076159, -0.5916787, 1.606131, 0.7098039, 0, 1, 1,
0.8102857, -1.118873, 2.017881, 0.7176471, 0, 1, 1,
0.8104743, 1.127832, 1.177518, 0.7215686, 0, 1, 1,
0.8118242, 0.6015627, 0.1571982, 0.7294118, 0, 1, 1,
0.8149219, -0.8887077, 2.894736, 0.7333333, 0, 1, 1,
0.8152171, -0.8122907, 1.64656, 0.7411765, 0, 1, 1,
0.8169959, -0.5180717, 1.024169, 0.7450981, 0, 1, 1,
0.828127, -1.20376, 1.392137, 0.7529412, 0, 1, 1,
0.8297822, 0.09963935, 0.2769659, 0.7568628, 0, 1, 1,
0.8332998, 0.589869, 0.9014511, 0.7647059, 0, 1, 1,
0.8333265, -0.6748284, 2.961294, 0.7686275, 0, 1, 1,
0.8341089, -0.03537708, 2.601254, 0.7764706, 0, 1, 1,
0.8351259, 1.690413, -0.9049827, 0.7803922, 0, 1, 1,
0.8373873, -1.262691, 2.246532, 0.7882353, 0, 1, 1,
0.8494452, 0.5492474, 0.5352967, 0.7921569, 0, 1, 1,
0.8529736, 1.18255, 0.7795751, 0.8, 0, 1, 1,
0.8604229, -0.7053688, 2.661806, 0.8078431, 0, 1, 1,
0.8616033, 0.1171184, 1.641581, 0.8117647, 0, 1, 1,
0.8621161, 0.2181533, 0.9577891, 0.8196079, 0, 1, 1,
0.863175, 0.3628679, 0.5760539, 0.8235294, 0, 1, 1,
0.8706545, -1.275739, 2.132844, 0.8313726, 0, 1, 1,
0.8751184, -0.02727212, -0.2619113, 0.8352941, 0, 1, 1,
0.8751372, -0.2576945, 1.975793, 0.8431373, 0, 1, 1,
0.8805044, -0.2384452, 2.716661, 0.8470588, 0, 1, 1,
0.882098, -1.942318, 4.100843, 0.854902, 0, 1, 1,
0.8851527, -0.6151153, 1.586993, 0.8588235, 0, 1, 1,
0.8891236, -0.9876153, 2.419161, 0.8666667, 0, 1, 1,
0.890721, 1.073923, 2.383714, 0.8705882, 0, 1, 1,
0.8942858, -0.8427427, 2.387112, 0.8784314, 0, 1, 1,
0.8983482, 0.2241966, 0.3954344, 0.8823529, 0, 1, 1,
0.9015438, -0.9012347, 0.5283583, 0.8901961, 0, 1, 1,
0.9078647, -3.101167, 2.626317, 0.8941177, 0, 1, 1,
0.916267, -0.3523606, 1.312585, 0.9019608, 0, 1, 1,
0.9176873, 0.5821996, 1.058544, 0.9098039, 0, 1, 1,
0.9178698, 0.06759649, 1.786422, 0.9137255, 0, 1, 1,
0.9182696, -0.3220796, 2.578349, 0.9215686, 0, 1, 1,
0.9238114, -1.26508, 3.311298, 0.9254902, 0, 1, 1,
0.9261822, 0.5342453, 1.029958, 0.9333333, 0, 1, 1,
0.9271267, 1.76188, 1.733501, 0.9372549, 0, 1, 1,
0.9397978, 0.3845876, 0.7425214, 0.945098, 0, 1, 1,
0.9405754, 0.6603478, 1.311861, 0.9490196, 0, 1, 1,
0.9471994, 0.268735, -0.1223029, 0.9568627, 0, 1, 1,
0.9490972, -1.47738, 2.248639, 0.9607843, 0, 1, 1,
0.9503396, -0.7504413, 1.376225, 0.9686275, 0, 1, 1,
0.9595346, -0.3305935, 1.623349, 0.972549, 0, 1, 1,
0.9623813, -0.4307435, 1.070218, 0.9803922, 0, 1, 1,
0.9640402, 1.777106, 0.9778702, 0.9843137, 0, 1, 1,
0.9656768, 0.6448683, 2.813963, 0.9921569, 0, 1, 1,
0.9669917, 0.7522792, 2.311921, 0.9960784, 0, 1, 1,
0.9678079, -0.3596894, 2.080309, 1, 0, 0.9960784, 1,
0.9785962, -0.2795467, 1.79795, 1, 0, 0.9882353, 1,
0.9883052, -0.2935199, 0.2475976, 1, 0, 0.9843137, 1,
0.9894667, 0.7192506, 0.7197185, 1, 0, 0.9764706, 1,
0.9896001, -0.7997307, 2.150756, 1, 0, 0.972549, 1,
0.995044, 1.040669, -1.072961, 1, 0, 0.9647059, 1,
0.9965869, 0.2343426, 1.088736, 1, 0, 0.9607843, 1,
1.005574, -0.05547682, 1.832109, 1, 0, 0.9529412, 1,
1.012939, -0.285395, 1.233116, 1, 0, 0.9490196, 1,
1.013692, -0.08821797, 2.489165, 1, 0, 0.9411765, 1,
1.017837, 0.4398781, 1.160277, 1, 0, 0.9372549, 1,
1.01883, -0.4003988, 2.562629, 1, 0, 0.9294118, 1,
1.019601, -2.046712, 2.861895, 1, 0, 0.9254902, 1,
1.024838, -1.20172, 2.336972, 1, 0, 0.9176471, 1,
1.025694, -0.9107051, 3.674173, 1, 0, 0.9137255, 1,
1.026923, -2.130382, 2.16271, 1, 0, 0.9058824, 1,
1.040467, 1.544244, 2.042078, 1, 0, 0.9019608, 1,
1.050856, 1.279018, 0.9293651, 1, 0, 0.8941177, 1,
1.062544, -0.4664122, 3.190257, 1, 0, 0.8862745, 1,
1.063471, -0.5439884, 2.623052, 1, 0, 0.8823529, 1,
1.065763, -0.3885978, 2.255934, 1, 0, 0.8745098, 1,
1.066589, 0.2199072, 0.7761794, 1, 0, 0.8705882, 1,
1.071818, 0.1633587, 2.137149, 1, 0, 0.8627451, 1,
1.073277, -0.0839876, 1.803535, 1, 0, 0.8588235, 1,
1.075629, -0.8681223, 0.8178328, 1, 0, 0.8509804, 1,
1.0767, 0.3508167, 0.1026588, 1, 0, 0.8470588, 1,
1.078486, 0.919725, 0.3974304, 1, 0, 0.8392157, 1,
1.080997, -0.08299974, 1.872545, 1, 0, 0.8352941, 1,
1.082684, -0.4118968, 3.680769, 1, 0, 0.827451, 1,
1.08314, -0.3346467, 2.432152, 1, 0, 0.8235294, 1,
1.085022, 1.16874, 1.84849, 1, 0, 0.8156863, 1,
1.089796, 0.7072666, 0.2620225, 1, 0, 0.8117647, 1,
1.090778, -2.200897, 3.598218, 1, 0, 0.8039216, 1,
1.097384, -0.3899696, 2.904021, 1, 0, 0.7960784, 1,
1.09857, 0.469055, 0.7972716, 1, 0, 0.7921569, 1,
1.102015, -0.6444765, 2.952783, 1, 0, 0.7843137, 1,
1.102913, 0.6902627, -0.9495894, 1, 0, 0.7803922, 1,
1.125002, 0.7714368, 1.031014, 1, 0, 0.772549, 1,
1.125253, -0.1213259, 1.167558, 1, 0, 0.7686275, 1,
1.129646, -0.6683325, 2.50418, 1, 0, 0.7607843, 1,
1.12979, -0.3971968, 0.7009326, 1, 0, 0.7568628, 1,
1.132341, -0.4329607, 1.866152, 1, 0, 0.7490196, 1,
1.139539, 0.1762859, 2.216161, 1, 0, 0.7450981, 1,
1.156649, -0.5848875, 2.667907, 1, 0, 0.7372549, 1,
1.158076, 0.1315507, 0.9782848, 1, 0, 0.7333333, 1,
1.160287, 1.184791, 2.438862, 1, 0, 0.7254902, 1,
1.170142, -1.236394, 0.9943702, 1, 0, 0.7215686, 1,
1.17537, 0.9115664, 3.423987, 1, 0, 0.7137255, 1,
1.177213, -1.519556, 2.721067, 1, 0, 0.7098039, 1,
1.179938, -2.780069, 0.9964699, 1, 0, 0.7019608, 1,
1.184977, -0.9334049, 4.143404, 1, 0, 0.6941177, 1,
1.192732, -1.065792, 3.75803, 1, 0, 0.6901961, 1,
1.193034, -0.1054134, 0.6903515, 1, 0, 0.682353, 1,
1.197429, -0.7520117, 2.602918, 1, 0, 0.6784314, 1,
1.215394, 1.44757, 0.2185739, 1, 0, 0.6705883, 1,
1.219925, -1.006998, 3.812652, 1, 0, 0.6666667, 1,
1.227585, 0.1811677, 3.300502, 1, 0, 0.6588235, 1,
1.22957, 1.354909, 2.027946, 1, 0, 0.654902, 1,
1.229724, -2.396887, 2.89541, 1, 0, 0.6470588, 1,
1.233771, -2.441389, 3.188569, 1, 0, 0.6431373, 1,
1.236089, -0.7339824, 1.455213, 1, 0, 0.6352941, 1,
1.249599, 1.167604, 0.9637109, 1, 0, 0.6313726, 1,
1.254153, -0.07740786, 2.934505, 1, 0, 0.6235294, 1,
1.254975, 0.2801181, 1.060808, 1, 0, 0.6196079, 1,
1.254983, -2.143842, 3.41631, 1, 0, 0.6117647, 1,
1.260115, -0.2502807, 3.014455, 1, 0, 0.6078432, 1,
1.273596, 0.4312023, 0.5307546, 1, 0, 0.6, 1,
1.278816, 1.094553, 1.615267, 1, 0, 0.5921569, 1,
1.283891, 0.5139337, 1.345916, 1, 0, 0.5882353, 1,
1.28581, -1.53554, 1.543566, 1, 0, 0.5803922, 1,
1.287416, -0.7750873, 0.6215722, 1, 0, 0.5764706, 1,
1.292364, 0.700215, 2.701263, 1, 0, 0.5686275, 1,
1.300516, -1.736156, 3.157077, 1, 0, 0.5647059, 1,
1.311908, 0.9205813, -0.02711604, 1, 0, 0.5568628, 1,
1.325481, -1.090657, 3.375154, 1, 0, 0.5529412, 1,
1.326076, -0.1236129, 1.947777, 1, 0, 0.5450981, 1,
1.32875, 2.153954, 0.08312658, 1, 0, 0.5411765, 1,
1.329316, 0.06091025, 3.457957, 1, 0, 0.5333334, 1,
1.332285, 0.414421, 2.332526, 1, 0, 0.5294118, 1,
1.333725, 0.1988222, 1.610901, 1, 0, 0.5215687, 1,
1.334941, -0.7574426, 2.190017, 1, 0, 0.5176471, 1,
1.336349, -1.179954, 1.125511, 1, 0, 0.509804, 1,
1.349965, 0.7440878, 0.8654436, 1, 0, 0.5058824, 1,
1.351547, 0.3417801, 1.703297, 1, 0, 0.4980392, 1,
1.357514, 0.1699511, 2.170936, 1, 0, 0.4901961, 1,
1.35982, 0.3616434, 2.259726, 1, 0, 0.4862745, 1,
1.359932, -0.1722155, 1.254064, 1, 0, 0.4784314, 1,
1.376624, -0.3577724, 0.2522558, 1, 0, 0.4745098, 1,
1.3917, 1.287345, 0.3684198, 1, 0, 0.4666667, 1,
1.393265, 0.7914454, -0.4216597, 1, 0, 0.4627451, 1,
1.39519, -0.460103, 2.903917, 1, 0, 0.454902, 1,
1.404732, 0.07959156, 0.7107525, 1, 0, 0.4509804, 1,
1.434322, -1.094017, 0.8624471, 1, 0, 0.4431373, 1,
1.468137, -0.9083174, 0.3028871, 1, 0, 0.4392157, 1,
1.472042, 2.056448, 0.04053425, 1, 0, 0.4313726, 1,
1.48039, 0.2259396, 0.8437334, 1, 0, 0.427451, 1,
1.483453, -1.081501, -0.1642896, 1, 0, 0.4196078, 1,
1.487157, -0.1223575, 0.9932166, 1, 0, 0.4156863, 1,
1.487791, 0.05875776, 0.9063719, 1, 0, 0.4078431, 1,
1.489581, -0.3193031, 2.159273, 1, 0, 0.4039216, 1,
1.511832, -0.6351343, 2.962952, 1, 0, 0.3960784, 1,
1.518675, 1.633464, -1.357454, 1, 0, 0.3882353, 1,
1.545507, -0.838229, 1.231824, 1, 0, 0.3843137, 1,
1.552102, 1.371737, 1.23405, 1, 0, 0.3764706, 1,
1.559836, 0.1883827, 0.8373829, 1, 0, 0.372549, 1,
1.563577, 1.084356, -0.1881094, 1, 0, 0.3647059, 1,
1.568563, 0.7692835, 0.4396977, 1, 0, 0.3607843, 1,
1.571932, 0.02532808, 1.976179, 1, 0, 0.3529412, 1,
1.572184, 0.1099365, 1.355374, 1, 0, 0.3490196, 1,
1.573181, 1.421959, 1.273915, 1, 0, 0.3411765, 1,
1.583327, 0.2859322, 0.8784769, 1, 0, 0.3372549, 1,
1.584879, 0.660094, 2.181674, 1, 0, 0.3294118, 1,
1.58612, -1.716125, 1.926655, 1, 0, 0.3254902, 1,
1.586857, -0.7621096, 2.208003, 1, 0, 0.3176471, 1,
1.604666, -0.6760563, 2.254259, 1, 0, 0.3137255, 1,
1.620313, -0.8513165, 2.640193, 1, 0, 0.3058824, 1,
1.626051, -0.1246769, 1.324248, 1, 0, 0.2980392, 1,
1.636282, -0.6813591, 2.080029, 1, 0, 0.2941177, 1,
1.656374, 0.1379414, 1.218349, 1, 0, 0.2862745, 1,
1.66648, -0.1944593, 0.7756569, 1, 0, 0.282353, 1,
1.671754, -0.3663888, 2.699225, 1, 0, 0.2745098, 1,
1.691986, -0.1907671, 2.886328, 1, 0, 0.2705882, 1,
1.694479, -0.5808612, 3.59934, 1, 0, 0.2627451, 1,
1.697274, 0.04041714, 0.6327003, 1, 0, 0.2588235, 1,
1.70075, -1.181192, 0.2505018, 1, 0, 0.2509804, 1,
1.710434, 0.9278018, -0.4309216, 1, 0, 0.2470588, 1,
1.714522, -0.1732889, -0.9451942, 1, 0, 0.2392157, 1,
1.721631, -1.839582, 2.08393, 1, 0, 0.2352941, 1,
1.733416, -0.3104519, 1.929396, 1, 0, 0.227451, 1,
1.767154, -0.4340974, 2.533205, 1, 0, 0.2235294, 1,
1.786341, 0.176385, 0.5117689, 1, 0, 0.2156863, 1,
1.790305, 1.746551, 0.6098125, 1, 0, 0.2117647, 1,
1.79837, 0.1254085, 1.178082, 1, 0, 0.2039216, 1,
1.800696, 0.3702737, 1.345906, 1, 0, 0.1960784, 1,
1.839399, 1.342613, 2.795921, 1, 0, 0.1921569, 1,
1.845459, -0.4338046, 2.34457, 1, 0, 0.1843137, 1,
1.851248, 0.7317729, 0.6536189, 1, 0, 0.1803922, 1,
1.914216, 0.5015476, -0.5436832, 1, 0, 0.172549, 1,
1.957342, -0.2988944, 1.325361, 1, 0, 0.1686275, 1,
1.984887, -0.7311875, 1.909123, 1, 0, 0.1607843, 1,
1.991672, -0.2781, 1.394308, 1, 0, 0.1568628, 1,
1.997854, 0.05951044, 1.87487, 1, 0, 0.1490196, 1,
2.000844, -0.1457228, 3.414898, 1, 0, 0.145098, 1,
2.059637, -1.44235, 3.115676, 1, 0, 0.1372549, 1,
2.073238, 0.2511898, 1.616197, 1, 0, 0.1333333, 1,
2.087388, 0.01697758, 2.014656, 1, 0, 0.1254902, 1,
2.126499, 0.5832559, 1.88731, 1, 0, 0.1215686, 1,
2.127834, -0.5002586, 2.0935, 1, 0, 0.1137255, 1,
2.169847, -1.554528, 2.262756, 1, 0, 0.1098039, 1,
2.170638, 0.8027284, -0.07157291, 1, 0, 0.1019608, 1,
2.252897, -1.476672, 1.678812, 1, 0, 0.09411765, 1,
2.254575, 0.3296116, 0.694878, 1, 0, 0.09019608, 1,
2.266964, -0.3318541, 2.869385, 1, 0, 0.08235294, 1,
2.274255, -1.107108, 2.116352, 1, 0, 0.07843138, 1,
2.28263, -0.8403777, 2.390168, 1, 0, 0.07058824, 1,
2.306483, -1.111857, 1.994166, 1, 0, 0.06666667, 1,
2.406918, 0.6037832, 1.479257, 1, 0, 0.05882353, 1,
2.413286, 0.4852639, 3.251406, 1, 0, 0.05490196, 1,
2.432789, -1.844477, 2.808996, 1, 0, 0.04705882, 1,
2.498143, -0.05407044, 1.362403, 1, 0, 0.04313726, 1,
2.799377, 0.2365444, 2.402534, 1, 0, 0.03529412, 1,
2.809816, 1.504504, 1.837139, 1, 0, 0.03137255, 1,
2.950161, -0.2322041, 2.134142, 1, 0, 0.02352941, 1,
3.048455, -0.160356, 2.052389, 1, 0, 0.01960784, 1,
3.062238, -0.1708062, 1.122321, 1, 0, 0.01176471, 1,
3.12317, 0.3128606, 3.722857, 1, 0, 0.007843138, 1
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
0.2356784, -4.402965, -7.513028, 0, -0.5, 0.5, 0.5,
0.2356784, -4.402965, -7.513028, 1, -0.5, 0.5, 0.5,
0.2356784, -4.402965, -7.513028, 1, 1.5, 0.5, 0.5,
0.2356784, -4.402965, -7.513028, 0, 1.5, 0.5, 0.5
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
-3.630672, 0.1681459, -7.513028, 0, -0.5, 0.5, 0.5,
-3.630672, 0.1681459, -7.513028, 1, -0.5, 0.5, 0.5,
-3.630672, 0.1681459, -7.513028, 1, 1.5, 0.5, 0.5,
-3.630672, 0.1681459, -7.513028, 0, 1.5, 0.5, 0.5
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
-3.630672, -4.402965, 0.09341502, 0, -0.5, 0.5, 0.5,
-3.630672, -4.402965, 0.09341502, 1, -0.5, 0.5, 0.5,
-3.630672, -4.402965, 0.09341502, 1, 1.5, 0.5, 0.5,
-3.630672, -4.402965, 0.09341502, 0, 1.5, 0.5, 0.5
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
-2, -3.348093, -5.757695,
3, -3.348093, -5.757695,
-2, -3.348093, -5.757695,
-2, -3.523905, -6.05025,
-1, -3.348093, -5.757695,
-1, -3.523905, -6.05025,
0, -3.348093, -5.757695,
0, -3.523905, -6.05025,
1, -3.348093, -5.757695,
1, -3.523905, -6.05025,
2, -3.348093, -5.757695,
2, -3.523905, -6.05025,
3, -3.348093, -5.757695,
3, -3.523905, -6.05025
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
-2, -3.875529, -6.635361, 0, -0.5, 0.5, 0.5,
-2, -3.875529, -6.635361, 1, -0.5, 0.5, 0.5,
-2, -3.875529, -6.635361, 1, 1.5, 0.5, 0.5,
-2, -3.875529, -6.635361, 0, 1.5, 0.5, 0.5,
-1, -3.875529, -6.635361, 0, -0.5, 0.5, 0.5,
-1, -3.875529, -6.635361, 1, -0.5, 0.5, 0.5,
-1, -3.875529, -6.635361, 1, 1.5, 0.5, 0.5,
-1, -3.875529, -6.635361, 0, 1.5, 0.5, 0.5,
0, -3.875529, -6.635361, 0, -0.5, 0.5, 0.5,
0, -3.875529, -6.635361, 1, -0.5, 0.5, 0.5,
0, -3.875529, -6.635361, 1, 1.5, 0.5, 0.5,
0, -3.875529, -6.635361, 0, 1.5, 0.5, 0.5,
1, -3.875529, -6.635361, 0, -0.5, 0.5, 0.5,
1, -3.875529, -6.635361, 1, -0.5, 0.5, 0.5,
1, -3.875529, -6.635361, 1, 1.5, 0.5, 0.5,
1, -3.875529, -6.635361, 0, 1.5, 0.5, 0.5,
2, -3.875529, -6.635361, 0, -0.5, 0.5, 0.5,
2, -3.875529, -6.635361, 1, -0.5, 0.5, 0.5,
2, -3.875529, -6.635361, 1, 1.5, 0.5, 0.5,
2, -3.875529, -6.635361, 0, 1.5, 0.5, 0.5,
3, -3.875529, -6.635361, 0, -0.5, 0.5, 0.5,
3, -3.875529, -6.635361, 1, -0.5, 0.5, 0.5,
3, -3.875529, -6.635361, 1, 1.5, 0.5, 0.5,
3, -3.875529, -6.635361, 0, 1.5, 0.5, 0.5
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
-2.738437, -3, -5.757695,
-2.738437, 3, -5.757695,
-2.738437, -3, -5.757695,
-2.887143, -3, -6.05025,
-2.738437, -2, -5.757695,
-2.887143, -2, -6.05025,
-2.738437, -1, -5.757695,
-2.887143, -1, -6.05025,
-2.738437, 0, -5.757695,
-2.887143, 0, -6.05025,
-2.738437, 1, -5.757695,
-2.887143, 1, -6.05025,
-2.738437, 2, -5.757695,
-2.887143, 2, -6.05025,
-2.738437, 3, -5.757695,
-2.887143, 3, -6.05025
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
-3.184555, -3, -6.635361, 0, -0.5, 0.5, 0.5,
-3.184555, -3, -6.635361, 1, -0.5, 0.5, 0.5,
-3.184555, -3, -6.635361, 1, 1.5, 0.5, 0.5,
-3.184555, -3, -6.635361, 0, 1.5, 0.5, 0.5,
-3.184555, -2, -6.635361, 0, -0.5, 0.5, 0.5,
-3.184555, -2, -6.635361, 1, -0.5, 0.5, 0.5,
-3.184555, -2, -6.635361, 1, 1.5, 0.5, 0.5,
-3.184555, -2, -6.635361, 0, 1.5, 0.5, 0.5,
-3.184555, -1, -6.635361, 0, -0.5, 0.5, 0.5,
-3.184555, -1, -6.635361, 1, -0.5, 0.5, 0.5,
-3.184555, -1, -6.635361, 1, 1.5, 0.5, 0.5,
-3.184555, -1, -6.635361, 0, 1.5, 0.5, 0.5,
-3.184555, 0, -6.635361, 0, -0.5, 0.5, 0.5,
-3.184555, 0, -6.635361, 1, -0.5, 0.5, 0.5,
-3.184555, 0, -6.635361, 1, 1.5, 0.5, 0.5,
-3.184555, 0, -6.635361, 0, 1.5, 0.5, 0.5,
-3.184555, 1, -6.635361, 0, -0.5, 0.5, 0.5,
-3.184555, 1, -6.635361, 1, -0.5, 0.5, 0.5,
-3.184555, 1, -6.635361, 1, 1.5, 0.5, 0.5,
-3.184555, 1, -6.635361, 0, 1.5, 0.5, 0.5,
-3.184555, 2, -6.635361, 0, -0.5, 0.5, 0.5,
-3.184555, 2, -6.635361, 1, -0.5, 0.5, 0.5,
-3.184555, 2, -6.635361, 1, 1.5, 0.5, 0.5,
-3.184555, 2, -6.635361, 0, 1.5, 0.5, 0.5,
-3.184555, 3, -6.635361, 0, -0.5, 0.5, 0.5,
-3.184555, 3, -6.635361, 1, -0.5, 0.5, 0.5,
-3.184555, 3, -6.635361, 1, 1.5, 0.5, 0.5,
-3.184555, 3, -6.635361, 0, 1.5, 0.5, 0.5
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
-2.738437, -3.348093, -4,
-2.738437, -3.348093, 4,
-2.738437, -3.348093, -4,
-2.887143, -3.523905, -4,
-2.738437, -3.348093, -2,
-2.887143, -3.523905, -2,
-2.738437, -3.348093, 0,
-2.887143, -3.523905, 0,
-2.738437, -3.348093, 2,
-2.887143, -3.523905, 2,
-2.738437, -3.348093, 4,
-2.887143, -3.523905, 4
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
-3.184555, -3.875529, -4, 0, -0.5, 0.5, 0.5,
-3.184555, -3.875529, -4, 1, -0.5, 0.5, 0.5,
-3.184555, -3.875529, -4, 1, 1.5, 0.5, 0.5,
-3.184555, -3.875529, -4, 0, 1.5, 0.5, 0.5,
-3.184555, -3.875529, -2, 0, -0.5, 0.5, 0.5,
-3.184555, -3.875529, -2, 1, -0.5, 0.5, 0.5,
-3.184555, -3.875529, -2, 1, 1.5, 0.5, 0.5,
-3.184555, -3.875529, -2, 0, 1.5, 0.5, 0.5,
-3.184555, -3.875529, 0, 0, -0.5, 0.5, 0.5,
-3.184555, -3.875529, 0, 1, -0.5, 0.5, 0.5,
-3.184555, -3.875529, 0, 1, 1.5, 0.5, 0.5,
-3.184555, -3.875529, 0, 0, 1.5, 0.5, 0.5,
-3.184555, -3.875529, 2, 0, -0.5, 0.5, 0.5,
-3.184555, -3.875529, 2, 1, -0.5, 0.5, 0.5,
-3.184555, -3.875529, 2, 1, 1.5, 0.5, 0.5,
-3.184555, -3.875529, 2, 0, 1.5, 0.5, 0.5,
-3.184555, -3.875529, 4, 0, -0.5, 0.5, 0.5,
-3.184555, -3.875529, 4, 1, -0.5, 0.5, 0.5,
-3.184555, -3.875529, 4, 1, 1.5, 0.5, 0.5,
-3.184555, -3.875529, 4, 0, 1.5, 0.5, 0.5
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
-2.738437, -3.348093, -5.757695,
-2.738437, 3.684385, -5.757695,
-2.738437, -3.348093, 5.944525,
-2.738437, 3.684385, 5.944525,
-2.738437, -3.348093, -5.757695,
-2.738437, -3.348093, 5.944525,
-2.738437, 3.684385, -5.757695,
-2.738437, 3.684385, 5.944525,
-2.738437, -3.348093, -5.757695,
3.209794, -3.348093, -5.757695,
-2.738437, -3.348093, 5.944525,
3.209794, -3.348093, 5.944525,
-2.738437, 3.684385, -5.757695,
3.209794, 3.684385, -5.757695,
-2.738437, 3.684385, 5.944525,
3.209794, 3.684385, 5.944525,
3.209794, -3.348093, -5.757695,
3.209794, 3.684385, -5.757695,
3.209794, -3.348093, 5.944525,
3.209794, 3.684385, 5.944525,
3.209794, -3.348093, -5.757695,
3.209794, -3.348093, 5.944525,
3.209794, 3.684385, -5.757695,
3.209794, 3.684385, 5.944525
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
var radius = 7.952173;
var distance = 35.38012;
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
mvMatrix.translate( -0.2356784, -0.1681459, -0.09341502 );
mvMatrix.scale( 1.445479, 1.22262, 0.7347363 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.38012);
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
tolclofos-methyl<-read.table("tolclofos-methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tolclofos-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'tolclofos' not found
```

```r
y<-tolclofos-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'tolclofos' not found
```

```r
z<-tolclofos-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'tolclofos' not found
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
-2.651813, 0.9538907, -2.427172, 0, 0, 1, 1, 1,
-2.633063, 2.348069, -1.884043, 1, 0, 0, 1, 1,
-2.628562, 0.1520574, -2.308843, 1, 0, 0, 1, 1,
-2.524007, -0.9284098, -3.531051, 1, 0, 0, 1, 1,
-2.483046, 1.585097, -2.403954, 1, 0, 0, 1, 1,
-2.400442, 0.6974246, -1.830892, 1, 0, 0, 1, 1,
-2.36404, -0.79242, -1.666009, 0, 0, 0, 1, 1,
-2.217135, -0.2011239, -1.219439, 0, 0, 0, 1, 1,
-2.206724, 2.063125, -2.280577, 0, 0, 0, 1, 1,
-2.190973, 0.2523764, -2.103142, 0, 0, 0, 1, 1,
-2.16915, -0.526766, -2.951771, 0, 0, 0, 1, 1,
-2.127404, 1.310265, 0.9531443, 0, 0, 0, 1, 1,
-2.09211, -0.2523542, -0.5123494, 0, 0, 0, 1, 1,
-2.077441, 0.4673748, 1.752366, 1, 1, 1, 1, 1,
-2.076634, 1.060199, -1.41599, 1, 1, 1, 1, 1,
-2.070363, -0.2047256, -1.85595, 1, 1, 1, 1, 1,
-2.068341, -1.508518, -3.050742, 1, 1, 1, 1, 1,
-2.031196, 0.3166131, 0.2908964, 1, 1, 1, 1, 1,
-2.030163, 1.65251, 0.0590915, 1, 1, 1, 1, 1,
-2.019887, -0.4966373, -2.90296, 1, 1, 1, 1, 1,
-1.980601, -0.04083195, -2.384768, 1, 1, 1, 1, 1,
-1.974761, 1.054351, -0.7340723, 1, 1, 1, 1, 1,
-1.97192, 0.5970783, -3.51261, 1, 1, 1, 1, 1,
-1.962017, 0.4103292, -3.177725, 1, 1, 1, 1, 1,
-1.955418, -0.7942848, -2.214529, 1, 1, 1, 1, 1,
-1.934734, 1.407434, -0.5798902, 1, 1, 1, 1, 1,
-1.930144, 1.009046, -1.424979, 1, 1, 1, 1, 1,
-1.921995, 0.68423, -1.923578, 1, 1, 1, 1, 1,
-1.917433, 0.5329822, -1.745866, 0, 0, 1, 1, 1,
-1.915515, 1.431762, 0.3197577, 1, 0, 0, 1, 1,
-1.878881, 0.1119853, -2.226506, 1, 0, 0, 1, 1,
-1.875956, -1.427024, -1.757646, 1, 0, 0, 1, 1,
-1.871145, 1.102749, -2.531921, 1, 0, 0, 1, 1,
-1.862363, -0.5073197, -3.929152, 1, 0, 0, 1, 1,
-1.859202, -1.097311, -1.465634, 0, 0, 0, 1, 1,
-1.857748, 0.1877705, -1.679658, 0, 0, 0, 1, 1,
-1.857532, 0.8412643, -0.1948005, 0, 0, 0, 1, 1,
-1.822898, 0.9240385, -0.8068383, 0, 0, 0, 1, 1,
-1.795321, 2.220531, -0.7931129, 0, 0, 0, 1, 1,
-1.779755, -1.253144, -2.693688, 0, 0, 0, 1, 1,
-1.77036, -1.014428, -0.4198941, 0, 0, 0, 1, 1,
-1.743078, -0.7251632, 0.3971736, 1, 1, 1, 1, 1,
-1.73314, 0.565075, -2.448967, 1, 1, 1, 1, 1,
-1.691759, 1.529306, 0.06245353, 1, 1, 1, 1, 1,
-1.682124, -0.9334294, -1.883605, 1, 1, 1, 1, 1,
-1.681893, -1.150758, -1.73665, 1, 1, 1, 1, 1,
-1.63912, -0.6367198, -1.358072, 1, 1, 1, 1, 1,
-1.626438, -2.296443, -4.003887, 1, 1, 1, 1, 1,
-1.601829, 0.7208194, 0.1935685, 1, 1, 1, 1, 1,
-1.599042, -0.3370419, -1.985192, 1, 1, 1, 1, 1,
-1.567874, 0.0565989, -2.517575, 1, 1, 1, 1, 1,
-1.557654, 0.664363, -1.248995, 1, 1, 1, 1, 1,
-1.541712, -0.5387923, -3.115791, 1, 1, 1, 1, 1,
-1.532881, 0.8847647, -1.6121, 1, 1, 1, 1, 1,
-1.516884, 0.2093709, -2.573779, 1, 1, 1, 1, 1,
-1.51458, -1.919645, 0.06391411, 1, 1, 1, 1, 1,
-1.500876, -0.765201, -1.563205, 0, 0, 1, 1, 1,
-1.468654, 0.3892343, -2.621311, 1, 0, 0, 1, 1,
-1.467119, 1.087188, -1.979362, 1, 0, 0, 1, 1,
-1.466726, -0.6191894, 0.05092073, 1, 0, 0, 1, 1,
-1.438256, -0.6219261, -1.480886, 1, 0, 0, 1, 1,
-1.437939, -0.431727, -1.987147, 1, 0, 0, 1, 1,
-1.437307, 1.123719, -0.3726059, 0, 0, 0, 1, 1,
-1.429644, -0.7478704, -2.707721, 0, 0, 0, 1, 1,
-1.428224, -1.042715, -2.140785, 0, 0, 0, 1, 1,
-1.399107, -0.5906514, -1.172368, 0, 0, 0, 1, 1,
-1.399076, -0.7647703, -1.482772, 0, 0, 0, 1, 1,
-1.396164, -0.1279912, -2.044085, 0, 0, 0, 1, 1,
-1.391037, -0.1159168, -0.09269728, 0, 0, 0, 1, 1,
-1.387183, 0.785527, -0.4863802, 1, 1, 1, 1, 1,
-1.377295, 0.6173908, -1.155404, 1, 1, 1, 1, 1,
-1.376271, -0.3497054, -3.910021, 1, 1, 1, 1, 1,
-1.373859, 1.037344, -1.557535, 1, 1, 1, 1, 1,
-1.372002, -0.8505515, -3.110592, 1, 1, 1, 1, 1,
-1.367444, 1.559958, 0.2964016, 1, 1, 1, 1, 1,
-1.363835, -0.538638, -1.930148, 1, 1, 1, 1, 1,
-1.357472, 1.585585, -1.26283, 1, 1, 1, 1, 1,
-1.350844, 0.2586268, -3.153021, 1, 1, 1, 1, 1,
-1.343033, -0.3121919, -1.562355, 1, 1, 1, 1, 1,
-1.33756, 0.570987, -0.7429611, 1, 1, 1, 1, 1,
-1.327529, -1.21285, -1.827776, 1, 1, 1, 1, 1,
-1.327479, 1.244658, -2.12037, 1, 1, 1, 1, 1,
-1.313966, 0.8339124, -1.511759, 1, 1, 1, 1, 1,
-1.310643, -2.566317, -2.484749, 1, 1, 1, 1, 1,
-1.302827, -0.7327902, -2.696504, 0, 0, 1, 1, 1,
-1.292518, -0.3690678, -3.209347, 1, 0, 0, 1, 1,
-1.286076, -0.5641364, -1.218317, 1, 0, 0, 1, 1,
-1.283241, -0.9722424, -1.998812, 1, 0, 0, 1, 1,
-1.271936, -0.3650199, -2.32064, 1, 0, 0, 1, 1,
-1.270592, 0.05023211, -1.200764, 1, 0, 0, 1, 1,
-1.270036, -0.2821895, -0.4925045, 0, 0, 0, 1, 1,
-1.268518, -1.385808, -3.207546, 0, 0, 0, 1, 1,
-1.265821, 0.4406528, 0.4575236, 0, 0, 0, 1, 1,
-1.263857, 0.1356881, -2.006476, 0, 0, 0, 1, 1,
-1.259475, 0.8046024, -3.263975, 0, 0, 0, 1, 1,
-1.248179, 0.3380998, -1.723511, 0, 0, 0, 1, 1,
-1.242316, -0.3179477, -1.835683, 0, 0, 0, 1, 1,
-1.240213, 0.165317, -1.481336, 1, 1, 1, 1, 1,
-1.240156, 0.3362278, 0.7677721, 1, 1, 1, 1, 1,
-1.237032, -0.4714575, -4.028432, 1, 1, 1, 1, 1,
-1.235983, -2.839569, -3.198019, 1, 1, 1, 1, 1,
-1.231644, -1.140558, -1.60346, 1, 1, 1, 1, 1,
-1.230487, 3.58197, -1.510984, 1, 1, 1, 1, 1,
-1.229232, 0.2724241, -2.628041, 1, 1, 1, 1, 1,
-1.221145, 2.412246, -0.2486397, 1, 1, 1, 1, 1,
-1.214692, 1.016425, -0.6192259, 1, 1, 1, 1, 1,
-1.202283, -2.247405, -0.8281936, 1, 1, 1, 1, 1,
-1.189477, -0.402707, -2.877746, 1, 1, 1, 1, 1,
-1.17923, -1.477196, -1.460384, 1, 1, 1, 1, 1,
-1.164957, 1.247231, -1.519916, 1, 1, 1, 1, 1,
-1.156918, -1.174325, -1.089437, 1, 1, 1, 1, 1,
-1.152403, 0.3092217, -0.4769083, 1, 1, 1, 1, 1,
-1.141617, 0.7957327, -1.636373, 0, 0, 1, 1, 1,
-1.140228, 0.7629851, 1.364627, 1, 0, 0, 1, 1,
-1.137732, -2.106955, -2.319716, 1, 0, 0, 1, 1,
-1.127337, 0.2448289, -0.4740073, 1, 0, 0, 1, 1,
-1.124799, 1.619583, -0.5536497, 1, 0, 0, 1, 1,
-1.124399, -0.2043904, 0.6850262, 1, 0, 0, 1, 1,
-1.123721, -0.7102398, -2.041925, 0, 0, 0, 1, 1,
-1.111367, 0.07833516, -3.745383, 0, 0, 0, 1, 1,
-1.108026, 1.333994, 0.7023556, 0, 0, 0, 1, 1,
-1.09486, 0.4041868, 0.353068, 0, 0, 0, 1, 1,
-1.091994, -1.43197, -3.249221, 0, 0, 0, 1, 1,
-1.091679, -0.1179948, -1.119428, 0, 0, 0, 1, 1,
-1.090506, -0.7053167, -2.552983, 0, 0, 0, 1, 1,
-1.085637, 1.293902, -0.3155649, 1, 1, 1, 1, 1,
-1.079562, -0.2569217, -2.265297, 1, 1, 1, 1, 1,
-1.076638, 0.3852074, 1.566727, 1, 1, 1, 1, 1,
-1.059542, -0.6075547, -1.915042, 1, 1, 1, 1, 1,
-1.057557, -1.556437, -2.758945, 1, 1, 1, 1, 1,
-1.05035, 0.03125343, 0.01706763, 1, 1, 1, 1, 1,
-1.048247, -0.06826624, -0.7530086, 1, 1, 1, 1, 1,
-1.044444, 1.117032, -0.4918147, 1, 1, 1, 1, 1,
-1.035354, -0.004841623, -3.129063, 1, 1, 1, 1, 1,
-1.033708, -0.6307291, -1.611397, 1, 1, 1, 1, 1,
-1.031912, -1.495818, -2.948653, 1, 1, 1, 1, 1,
-1.031016, 0.7091698, -1.966053, 1, 1, 1, 1, 1,
-1.024087, -0.5262544, -3.395944, 1, 1, 1, 1, 1,
-1.007151, -0.3729694, -4.026259, 1, 1, 1, 1, 1,
-1.004248, 0.3220463, 0.2360657, 1, 1, 1, 1, 1,
-1.001185, 0.2388975, 0.9196361, 0, 0, 1, 1, 1,
-0.9958115, -0.3426327, -2.206478, 1, 0, 0, 1, 1,
-0.9957635, -1.322135, -2.124252, 1, 0, 0, 1, 1,
-0.9923953, -0.07613528, -1.975455, 1, 0, 0, 1, 1,
-0.9886935, 0.5771561, -1.210007, 1, 0, 0, 1, 1,
-0.988059, -0.9999567, -2.042156, 1, 0, 0, 1, 1,
-0.9877526, 0.1861417, -2.193611, 0, 0, 0, 1, 1,
-0.9874042, 0.4759644, -0.9196698, 0, 0, 0, 1, 1,
-0.9862021, -0.7861833, -2.466726, 0, 0, 0, 1, 1,
-0.9826466, -0.3171127, -1.194971, 0, 0, 0, 1, 1,
-0.9780208, 0.4706961, -2.214121, 0, 0, 0, 1, 1,
-0.9736412, -1.180433, -2.075203, 0, 0, 0, 1, 1,
-0.9726388, -2.641999, -2.430486, 0, 0, 0, 1, 1,
-0.9662421, -0.1950061, -2.691756, 1, 1, 1, 1, 1,
-0.960443, -0.9176973, -3.163424, 1, 1, 1, 1, 1,
-0.9570183, 0.4933073, -0.3753807, 1, 1, 1, 1, 1,
-0.9546718, 0.454679, -1.721017, 1, 1, 1, 1, 1,
-0.9522552, 0.822266, -1.370654, 1, 1, 1, 1, 1,
-0.9521558, -0.4386067, -2.049453, 1, 1, 1, 1, 1,
-0.9470803, -0.6268559, -2.379562, 1, 1, 1, 1, 1,
-0.94402, 0.7254117, -0.766681, 1, 1, 1, 1, 1,
-0.9418489, 1.71428, -0.5411454, 1, 1, 1, 1, 1,
-0.9410818, 0.2089357, -1.548542, 1, 1, 1, 1, 1,
-0.9182972, -0.9979524, -3.260946, 1, 1, 1, 1, 1,
-0.9134829, -1.196199, -4.227765, 1, 1, 1, 1, 1,
-0.9104832, 1.532476, -0.09634422, 1, 1, 1, 1, 1,
-0.9075907, 0.07419362, -0.9007517, 1, 1, 1, 1, 1,
-0.9056704, -0.8383019, -3.014314, 1, 1, 1, 1, 1,
-0.902532, 0.3881529, 0.3599243, 0, 0, 1, 1, 1,
-0.8964097, -1.21635, -1.95465, 1, 0, 0, 1, 1,
-0.8929962, -0.01830506, -0.6741463, 1, 0, 0, 1, 1,
-0.8921073, -0.3622739, -1.897505, 1, 0, 0, 1, 1,
-0.8897285, 0.347237, -1.717519, 1, 0, 0, 1, 1,
-0.8863832, 0.5163256, -2.724072, 1, 0, 0, 1, 1,
-0.8853688, 0.1753697, -0.5082575, 0, 0, 0, 1, 1,
-0.8779112, -0.8229451, -1.719322, 0, 0, 0, 1, 1,
-0.8734854, -1.367436, -2.921837, 0, 0, 0, 1, 1,
-0.8719491, 1.810294, 0.2253902, 0, 0, 0, 1, 1,
-0.8691275, -0.3485931, -2.652144, 0, 0, 0, 1, 1,
-0.8686004, 0.7853346, -1.562375, 0, 0, 0, 1, 1,
-0.8678302, -0.4038876, -2.130608, 0, 0, 0, 1, 1,
-0.8640407, -0.6649987, -3.763532, 1, 1, 1, 1, 1,
-0.8600829, -1.511338, -4.458787, 1, 1, 1, 1, 1,
-0.8577662, 0.3943046, -1.910232, 1, 1, 1, 1, 1,
-0.8556037, 0.3577137, -1.550481, 1, 1, 1, 1, 1,
-0.8500965, 0.02359226, -1.348315, 1, 1, 1, 1, 1,
-0.8489287, 0.2318009, -0.8849112, 1, 1, 1, 1, 1,
-0.8474316, -0.1664157, -2.799315, 1, 1, 1, 1, 1,
-0.8460615, -1.062862, -3.16993, 1, 1, 1, 1, 1,
-0.8425125, -0.3389116, -1.454118, 1, 1, 1, 1, 1,
-0.8388588, 0.4905543, -1.43518, 1, 1, 1, 1, 1,
-0.8381299, 2.3065, -1.222148, 1, 1, 1, 1, 1,
-0.8357754, 0.7235513, -1.527581, 1, 1, 1, 1, 1,
-0.8312753, 2.387669, -1.579023, 1, 1, 1, 1, 1,
-0.8292384, -0.6562311, -2.169212, 1, 1, 1, 1, 1,
-0.8287606, 1.440784, -2.001534, 1, 1, 1, 1, 1,
-0.8217034, -1.194168, -1.415461, 0, 0, 1, 1, 1,
-0.8209925, -1.993997, -2.302314, 1, 0, 0, 1, 1,
-0.8175922, -1.056399, -2.811575, 1, 0, 0, 1, 1,
-0.8153703, -0.2147017, -0.5396195, 1, 0, 0, 1, 1,
-0.8121038, 2.233318, -0.1614792, 1, 0, 0, 1, 1,
-0.8112652, 1.538329, 0.3955955, 1, 0, 0, 1, 1,
-0.8108881, -0.885879, -3.191597, 0, 0, 0, 1, 1,
-0.8044403, -0.8190323, -1.795024, 0, 0, 0, 1, 1,
-0.7900056, 0.6578042, -1.986583, 0, 0, 0, 1, 1,
-0.7889099, 0.959453, -0.5230233, 0, 0, 0, 1, 1,
-0.7885615, 2.324319, -0.7400089, 0, 0, 0, 1, 1,
-0.7854342, 0.4594222, 0.1380149, 0, 0, 0, 1, 1,
-0.7849464, -0.6449854, -1.444409, 0, 0, 0, 1, 1,
-0.7805485, 2.981008, 0.8818656, 1, 1, 1, 1, 1,
-0.7749901, -0.69553, -4.755844, 1, 1, 1, 1, 1,
-0.7692796, 0.7920207, -1.815466, 1, 1, 1, 1, 1,
-0.7645226, -1.024249, -3.109095, 1, 1, 1, 1, 1,
-0.7506705, -0.8259692, -1.92859, 1, 1, 1, 1, 1,
-0.7478319, 1.744039, 0.7012943, 1, 1, 1, 1, 1,
-0.7436578, -0.6389437, -2.94225, 1, 1, 1, 1, 1,
-0.7346714, -3.245678, -1.645164, 1, 1, 1, 1, 1,
-0.7342967, 0.9705819, -1.313441, 1, 1, 1, 1, 1,
-0.7336819, -0.07565077, -0.7392201, 1, 1, 1, 1, 1,
-0.7275015, 0.08459944, -0.8900257, 1, 1, 1, 1, 1,
-0.7253861, -1.412706, -2.806201, 1, 1, 1, 1, 1,
-0.7248747, 1.880878, 1.456947, 1, 1, 1, 1, 1,
-0.7212291, -0.3657587, -2.030075, 1, 1, 1, 1, 1,
-0.7189883, -2.351989, -1.257175, 1, 1, 1, 1, 1,
-0.7164524, 1.878433, -1.426411, 0, 0, 1, 1, 1,
-0.7116134, -0.8551539, -2.093165, 1, 0, 0, 1, 1,
-0.7104834, 1.091713, 0.06910591, 1, 0, 0, 1, 1,
-0.7087204, -1.697452, -3.590235, 1, 0, 0, 1, 1,
-0.7047256, -0.5413173, -1.277584, 1, 0, 0, 1, 1,
-0.7033862, -0.05240444, -0.6323125, 1, 0, 0, 1, 1,
-0.7005621, 0.831907, -1.419965, 0, 0, 0, 1, 1,
-0.6924539, 1.328908, -1.089629, 0, 0, 0, 1, 1,
-0.6892452, -1.107058, -1.57923, 0, 0, 0, 1, 1,
-0.6834828, 0.3389165, -0.6694888, 0, 0, 0, 1, 1,
-0.676595, 1.570339, -0.4034421, 0, 0, 0, 1, 1,
-0.673411, -1.481744, -2.598253, 0, 0, 0, 1, 1,
-0.6715665, 1.323778, -0.3412144, 0, 0, 0, 1, 1,
-0.671012, -0.9573219, -4.479765, 1, 1, 1, 1, 1,
-0.6700035, 0.2728376, 0.6812602, 1, 1, 1, 1, 1,
-0.6665625, -0.5280278, -1.531032, 1, 1, 1, 1, 1,
-0.66575, 0.2173887, -2.563177, 1, 1, 1, 1, 1,
-0.660736, -0.5695735, -2.082727, 1, 1, 1, 1, 1,
-0.6560308, 0.09891295, -2.200186, 1, 1, 1, 1, 1,
-0.6517571, -2.03222, -4.64886, 1, 1, 1, 1, 1,
-0.6515467, 1.297765, 0.7644158, 1, 1, 1, 1, 1,
-0.6499515, 0.236033, -2.276219, 1, 1, 1, 1, 1,
-0.6490945, -2.379772, -2.585331, 1, 1, 1, 1, 1,
-0.6477239, 1.11211, 1.317866, 1, 1, 1, 1, 1,
-0.6435828, 1.674506, -0.2556736, 1, 1, 1, 1, 1,
-0.637449, -1.387816, -3.010124, 1, 1, 1, 1, 1,
-0.6339501, 1.504707, -1.294486, 1, 1, 1, 1, 1,
-0.6224083, 0.6819456, -2.142756, 1, 1, 1, 1, 1,
-0.6179692, 1.504161, 0.5126958, 0, 0, 1, 1, 1,
-0.6137787, 0.8284802, -0.3697882, 1, 0, 0, 1, 1,
-0.6114335, -1.454166, -0.2921607, 1, 0, 0, 1, 1,
-0.6105543, 0.09833664, -1.245825, 1, 0, 0, 1, 1,
-0.6090446, 0.1328328, -1.492302, 1, 0, 0, 1, 1,
-0.6074631, -0.400057, -2.184129, 1, 0, 0, 1, 1,
-0.6063555, -0.1996392, -1.886798, 0, 0, 0, 1, 1,
-0.6016267, 0.5502319, -0.8442737, 0, 0, 0, 1, 1,
-0.6013978, 0.8037553, -1.972149, 0, 0, 0, 1, 1,
-0.5967245, -0.4923564, -0.6471261, 0, 0, 0, 1, 1,
-0.5956134, -1.683788, -1.936266, 0, 0, 0, 1, 1,
-0.5952559, -0.186674, -3.294875, 0, 0, 0, 1, 1,
-0.595201, 0.7811957, 0.4115226, 0, 0, 0, 1, 1,
-0.5951477, -1.319465, -4.854255, 1, 1, 1, 1, 1,
-0.593931, -1.164475, -3.28627, 1, 1, 1, 1, 1,
-0.5903262, 1.183431, -2.44032, 1, 1, 1, 1, 1,
-0.5856655, -0.2717246, -3.240044, 1, 1, 1, 1, 1,
-0.5773813, -0.7262503, -2.85267, 1, 1, 1, 1, 1,
-0.5733441, -0.2035629, -1.142074, 1, 1, 1, 1, 1,
-0.5732449, -0.2332857, -1.487222, 1, 1, 1, 1, 1,
-0.5654382, -0.214952, -1.212557, 1, 1, 1, 1, 1,
-0.5644517, -0.8338509, -1.32625, 1, 1, 1, 1, 1,
-0.5621579, 0.627317, -2.345567, 1, 1, 1, 1, 1,
-0.5600561, -0.2318703, -1.185547, 1, 1, 1, 1, 1,
-0.5524044, 0.6811461, -0.9590166, 1, 1, 1, 1, 1,
-0.5511331, 0.2860658, -2.329586, 1, 1, 1, 1, 1,
-0.5503386, -1.721308, -2.305931, 1, 1, 1, 1, 1,
-0.5482726, -0.09725226, -2.568821, 1, 1, 1, 1, 1,
-0.5476747, -0.01061719, -1.618369, 0, 0, 1, 1, 1,
-0.5475951, -0.4656533, -2.144489, 1, 0, 0, 1, 1,
-0.540386, -1.626308, -2.849826, 1, 0, 0, 1, 1,
-0.5350131, -0.1798041, -2.63862, 1, 0, 0, 1, 1,
-0.5296003, 1.283823, -0.552821, 1, 0, 0, 1, 1,
-0.518239, 0.9011406, 0.8156731, 1, 0, 0, 1, 1,
-0.5104266, -0.7067993, -3.655894, 0, 0, 0, 1, 1,
-0.5021356, 0.7068614, -0.6895199, 0, 0, 0, 1, 1,
-0.5017405, -0.9551032, -3.222398, 0, 0, 0, 1, 1,
-0.4975763, -0.9565067, -3.804234, 0, 0, 0, 1, 1,
-0.4968745, 1.001227, 0.08973198, 0, 0, 0, 1, 1,
-0.4873905, -0.506098, -1.183975, 0, 0, 0, 1, 1,
-0.4870079, -0.2352847, -0.1554293, 0, 0, 0, 1, 1,
-0.4805587, -0.5400234, -2.679655, 1, 1, 1, 1, 1,
-0.4776129, 2.422082, -0.6885357, 1, 1, 1, 1, 1,
-0.477425, 0.6011904, -2.783, 1, 1, 1, 1, 1,
-0.4755185, -0.8110421, -2.709334, 1, 1, 1, 1, 1,
-0.4751595, 0.1307709, -1.789789, 1, 1, 1, 1, 1,
-0.4734696, -0.4279245, -2.12218, 1, 1, 1, 1, 1,
-0.4718391, -0.2636623, -2.345341, 1, 1, 1, 1, 1,
-0.4711606, -1.54615, -3.566153, 1, 1, 1, 1, 1,
-0.4630929, -1.409778, -3.025568, 1, 1, 1, 1, 1,
-0.4620973, -1.02272, -0.9515742, 1, 1, 1, 1, 1,
-0.4610012, 0.4135437, 2.085752, 1, 1, 1, 1, 1,
-0.4609259, -0.2655764, -1.020968, 1, 1, 1, 1, 1,
-0.4608413, -1.935149, -1.783244, 1, 1, 1, 1, 1,
-0.4607884, 0.1375264, -0.1667074, 1, 1, 1, 1, 1,
-0.4569323, 2.047242, 0.1184169, 1, 1, 1, 1, 1,
-0.4556371, 1.005535, 0.3680248, 0, 0, 1, 1, 1,
-0.452795, 0.2685376, -0.6500817, 1, 0, 0, 1, 1,
-0.4482893, -0.8164834, -4.993029, 1, 0, 0, 1, 1,
-0.4450585, 0.8271781, -1.141378, 1, 0, 0, 1, 1,
-0.4420412, -0.6618682, -3.196039, 1, 0, 0, 1, 1,
-0.4352165, -0.4993437, -4.430736, 1, 0, 0, 1, 1,
-0.4348354, 2.713765, -0.9664047, 0, 0, 0, 1, 1,
-0.4336208, 1.313071, 0.4692385, 0, 0, 0, 1, 1,
-0.4320321, -0.2992243, -2.345506, 0, 0, 0, 1, 1,
-0.4272167, -0.5599987, -1.725116, 0, 0, 0, 1, 1,
-0.4229169, 0.4147893, 0.03163027, 0, 0, 0, 1, 1,
-0.4169455, 1.321522, -1.916248, 0, 0, 0, 1, 1,
-0.4062244, 1.006064, -2.048481, 0, 0, 0, 1, 1,
-0.4059287, -0.04902322, -1.953866, 1, 1, 1, 1, 1,
-0.4017583, 0.8203639, -0.1036969, 1, 1, 1, 1, 1,
-0.3975853, 1.652794, -1.201663, 1, 1, 1, 1, 1,
-0.3960717, 0.2628374, -1.029592, 1, 1, 1, 1, 1,
-0.3934625, -0.1703593, -2.233874, 1, 1, 1, 1, 1,
-0.3847453, 0.1787191, 0.1048237, 1, 1, 1, 1, 1,
-0.383907, -0.7570328, -3.147257, 1, 1, 1, 1, 1,
-0.3815513, 1.368026, 2.330389, 1, 1, 1, 1, 1,
-0.3811018, 2.023319, -0.0756994, 1, 1, 1, 1, 1,
-0.3801309, -1.984603, -4.254302, 1, 1, 1, 1, 1,
-0.3794559, 0.5453503, 1.30811, 1, 1, 1, 1, 1,
-0.3790309, -0.3376155, -2.525112, 1, 1, 1, 1, 1,
-0.3721288, -0.6365176, -4.084383, 1, 1, 1, 1, 1,
-0.3688848, -1.030216, -5.02856, 1, 1, 1, 1, 1,
-0.3657454, 0.4291441, 0.473646, 1, 1, 1, 1, 1,
-0.3630082, 0.5531725, 0.7017968, 0, 0, 1, 1, 1,
-0.3574947, -1.525153, -3.40161, 1, 0, 0, 1, 1,
-0.3521487, 1.194375, -1.274259, 1, 0, 0, 1, 1,
-0.3508471, -2.888029, -3.117376, 1, 0, 0, 1, 1,
-0.3508449, -0.5852706, -2.281981, 1, 0, 0, 1, 1,
-0.350124, 0.4355411, -0.05729586, 1, 0, 0, 1, 1,
-0.3463691, 1.928859, 0.07718509, 0, 0, 0, 1, 1,
-0.3446431, -0.6183584, -2.18304, 0, 0, 0, 1, 1,
-0.3440847, 0.3781157, -0.8083616, 0, 0, 0, 1, 1,
-0.3423771, 0.8714457, -0.6797049, 0, 0, 0, 1, 1,
-0.3400741, -0.7893159, -4.050252, 0, 0, 0, 1, 1,
-0.3369648, 1.128728, 1.139834, 0, 0, 0, 1, 1,
-0.3314909, 1.746116, 0.2902569, 0, 0, 0, 1, 1,
-0.3294215, -0.974301, -3.888916, 1, 1, 1, 1, 1,
-0.328103, 0.383963, -1.242962, 1, 1, 1, 1, 1,
-0.3221731, 1.345568, -1.664405, 1, 1, 1, 1, 1,
-0.3145927, -1.318436, -3.977629, 1, 1, 1, 1, 1,
-0.3142138, -0.1490702, -1.529466, 1, 1, 1, 1, 1,
-0.3126559, -0.0377175, -0.9896879, 1, 1, 1, 1, 1,
-0.3114181, -0.5384272, -3.0741, 1, 1, 1, 1, 1,
-0.3112911, -0.4034169, -2.51732, 1, 1, 1, 1, 1,
-0.3015796, 0.0004745998, -1.205114, 1, 1, 1, 1, 1,
-0.3008662, -0.5941969, -4.4182, 1, 1, 1, 1, 1,
-0.2923119, -0.3363687, -2.81256, 1, 1, 1, 1, 1,
-0.2922834, 1.411446, -0.09646788, 1, 1, 1, 1, 1,
-0.2907012, -0.9604561, -1.961163, 1, 1, 1, 1, 1,
-0.2810414, 0.6939958, -0.08503239, 1, 1, 1, 1, 1,
-0.2765745, -0.785324, -1.859274, 1, 1, 1, 1, 1,
-0.2759234, -0.9442936, -3.597355, 0, 0, 1, 1, 1,
-0.2743734, -0.7543899, -2.430939, 1, 0, 0, 1, 1,
-0.273884, 0.4914613, -1.377065, 1, 0, 0, 1, 1,
-0.2722719, 0.5166134, -0.5223675, 1, 0, 0, 1, 1,
-0.2718882, 0.4869958, 1.209404, 1, 0, 0, 1, 1,
-0.2697931, 0.02974643, 0.01693114, 1, 0, 0, 1, 1,
-0.2682328, 0.7201484, 0.210136, 0, 0, 0, 1, 1,
-0.2681095, 0.6341307, -2.029217, 0, 0, 0, 1, 1,
-0.2664615, 1.390477, -0.511012, 0, 0, 0, 1, 1,
-0.2640089, -0.4842251, -3.057337, 0, 0, 0, 1, 1,
-0.2635672, 0.5403117, -2.110577, 0, 0, 0, 1, 1,
-0.262901, 1.298587, -0.1303176, 0, 0, 0, 1, 1,
-0.2616865, -1.360129, -2.718345, 0, 0, 0, 1, 1,
-0.2616826, 0.5596904, -1.547077, 1, 1, 1, 1, 1,
-0.2581003, 0.248551, -0.3198054, 1, 1, 1, 1, 1,
-0.2566595, 0.4535833, -0.9943551, 1, 1, 1, 1, 1,
-0.2555061, 0.6430616, 1.580799, 1, 1, 1, 1, 1,
-0.2544437, -0.7723486, -2.298007, 1, 1, 1, 1, 1,
-0.2534339, 2.357247, 0.4006622, 1, 1, 1, 1, 1,
-0.2482956, 0.356387, 0.4011239, 1, 1, 1, 1, 1,
-0.2457531, -1.133894, -3.407041, 1, 1, 1, 1, 1,
-0.2455179, -0.03984723, -2.98912, 1, 1, 1, 1, 1,
-0.2378234, 1.052086, -0.493488, 1, 1, 1, 1, 1,
-0.2373943, 0.07667778, -3.006278, 1, 1, 1, 1, 1,
-0.2365479, -0.1796225, -1.969966, 1, 1, 1, 1, 1,
-0.2354834, 1.512506, 1.314351, 1, 1, 1, 1, 1,
-0.229304, 1.010466, -0.7422221, 1, 1, 1, 1, 1,
-0.2270888, -0.2344061, -0.4197403, 1, 1, 1, 1, 1,
-0.2248977, -1.440258, -2.673266, 0, 0, 1, 1, 1,
-0.2209322, -0.4231807, -3.871655, 1, 0, 0, 1, 1,
-0.2204271, 3.015867, -0.4962243, 1, 0, 0, 1, 1,
-0.2187539, -0.9777301, -2.210066, 1, 0, 0, 1, 1,
-0.2185714, 0.9970007, -0.05308152, 1, 0, 0, 1, 1,
-0.2144685, 0.9632328, -1.970198, 1, 0, 0, 1, 1,
-0.2137806, 0.3954778, 0.9177753, 0, 0, 0, 1, 1,
-0.2117633, 0.4016905, 1.111885, 0, 0, 0, 1, 1,
-0.1987973, 1.012097, -0.05689176, 0, 0, 0, 1, 1,
-0.1939015, -1.573132, -3.788235, 0, 0, 0, 1, 1,
-0.1892813, 0.2829837, -1.462028, 0, 0, 0, 1, 1,
-0.1882924, -1.482796, -4.219121, 0, 0, 0, 1, 1,
-0.1878562, 1.126596, 0.3510294, 0, 0, 0, 1, 1,
-0.1852999, 0.481719, 2.021054, 1, 1, 1, 1, 1,
-0.1847642, -0.2263029, -2.586734, 1, 1, 1, 1, 1,
-0.1832446, -0.2376183, -2.808487, 1, 1, 1, 1, 1,
-0.1825216, -1.32948, -4.710684, 1, 1, 1, 1, 1,
-0.1813987, -0.9423564, -2.32713, 1, 1, 1, 1, 1,
-0.1799321, 0.02689285, -0.6166183, 1, 1, 1, 1, 1,
-0.1776754, -1.645114, -3.577328, 1, 1, 1, 1, 1,
-0.1738445, -0.3563995, -1.752497, 1, 1, 1, 1, 1,
-0.172538, -1.499138, -2.595003, 1, 1, 1, 1, 1,
-0.1680619, -0.09937728, -1.18988, 1, 1, 1, 1, 1,
-0.1595946, 0.0401325, -1.316428, 1, 1, 1, 1, 1,
-0.1580288, 1.026655, -0.3649126, 1, 1, 1, 1, 1,
-0.1505287, 0.573742, -1.893442, 1, 1, 1, 1, 1,
-0.1393088, 0.2984318, -0.1174939, 1, 1, 1, 1, 1,
-0.1349872, -0.4204903, -1.758887, 1, 1, 1, 1, 1,
-0.134155, 0.4601933, -0.9932871, 0, 0, 1, 1, 1,
-0.1318593, 0.6994487, -1.228001, 1, 0, 0, 1, 1,
-0.1303844, -1.135095, -2.193084, 1, 0, 0, 1, 1,
-0.1267634, -1.628467, -2.850163, 1, 0, 0, 1, 1,
-0.1225464, 0.1349923, -2.421442, 1, 0, 0, 1, 1,
-0.1222538, 0.2677981, -0.2867771, 1, 0, 0, 1, 1,
-0.1214206, 0.1223696, -1.029234, 0, 0, 0, 1, 1,
-0.1142413, 2.395883, 0.7562904, 0, 0, 0, 1, 1,
-0.1129652, -1.857266, -3.947878, 0, 0, 0, 1, 1,
-0.1111652, -1.071557, -1.803478, 0, 0, 0, 1, 1,
-0.1080862, -1.304272, -4.045331, 0, 0, 0, 1, 1,
-0.100433, -1.085822, -2.418331, 0, 0, 0, 1, 1,
-0.09993371, 0.778239, -0.5914814, 0, 0, 0, 1, 1,
-0.09831916, 0.7555181, 0.5902346, 1, 1, 1, 1, 1,
-0.09820621, -0.7882625, -2.884877, 1, 1, 1, 1, 1,
-0.08760506, -3.111771, -1.994088, 1, 1, 1, 1, 1,
-0.08537666, 0.7406954, -0.237968, 1, 1, 1, 1, 1,
-0.08317602, -0.06357519, -3.29597, 1, 1, 1, 1, 1,
-0.08272809, -0.2640341, -3.227819, 1, 1, 1, 1, 1,
-0.0805117, 0.8676466, 0.2871794, 1, 1, 1, 1, 1,
-0.08017202, -0.6188377, -1.770769, 1, 1, 1, 1, 1,
-0.0783524, 0.1231705, 0.6860234, 1, 1, 1, 1, 1,
-0.07622111, -1.226298, -3.430663, 1, 1, 1, 1, 1,
-0.07571531, -0.2167258, -3.346072, 1, 1, 1, 1, 1,
-0.07567363, 1.05346, 0.3431576, 1, 1, 1, 1, 1,
-0.07540467, -1.02854, -2.38206, 1, 1, 1, 1, 1,
-0.07403672, -1.020192, -1.112395, 1, 1, 1, 1, 1,
-0.07311853, -0.1969467, -2.392471, 1, 1, 1, 1, 1,
-0.07302646, -0.04865286, -2.986269, 0, 0, 1, 1, 1,
-0.06938525, 0.5104989, 0.09630993, 1, 0, 0, 1, 1,
-0.06739986, -0.4961123, -2.187708, 1, 0, 0, 1, 1,
-0.06329993, -1.125668, -2.566735, 1, 0, 0, 1, 1,
-0.06311294, 0.2862603, -0.9233376, 1, 0, 0, 1, 1,
-0.06138249, 0.6512191, -1.06959, 1, 0, 0, 1, 1,
-0.05952401, 0.7603408, -0.3394899, 0, 0, 0, 1, 1,
-0.05911643, -0.8550033, -3.001385, 0, 0, 0, 1, 1,
-0.05626825, -1.695769, -1.612069, 0, 0, 0, 1, 1,
-0.05491993, -0.09168635, -3.726521, 0, 0, 0, 1, 1,
-0.04870993, 0.9786246, -0.4045511, 0, 0, 0, 1, 1,
-0.04816027, -0.08333623, -2.377074, 0, 0, 0, 1, 1,
-0.0473926, -0.8192075, -2.876644, 0, 0, 0, 1, 1,
-0.04233548, 2.421939, 0.7992699, 1, 1, 1, 1, 1,
-0.03876733, 1.122448, -0.934308, 1, 1, 1, 1, 1,
-0.03725265, 1.054551, -2.518938, 1, 1, 1, 1, 1,
-0.03578274, 0.6950967, -1.291067, 1, 1, 1, 1, 1,
-0.0341285, -0.4106044, -2.950823, 1, 1, 1, 1, 1,
-0.03071057, -0.2705303, -2.130213, 1, 1, 1, 1, 1,
-0.02913764, 0.3227594, 0.9024823, 1, 1, 1, 1, 1,
-0.02823149, -1.731701, -2.550921, 1, 1, 1, 1, 1,
-0.02805887, 0.7555049, -0.06043696, 1, 1, 1, 1, 1,
-0.02575623, 0.5182994, -0.9853345, 1, 1, 1, 1, 1,
-0.02382018, 1.956106, 0.3430686, 1, 1, 1, 1, 1,
-0.02325262, 0.3428631, -0.2308532, 1, 1, 1, 1, 1,
-0.02068532, -1.381631, -2.835886, 1, 1, 1, 1, 1,
-0.01976508, -0.3999909, -5.587274, 1, 1, 1, 1, 1,
-0.01409013, -0.6942603, -2.294938, 1, 1, 1, 1, 1,
-0.01188215, 0.201609, 1.739247, 0, 0, 1, 1, 1,
-0.0117574, -0.1218078, -3.519308, 1, 0, 0, 1, 1,
-0.01006882, 1.507256, 0.008406412, 1, 0, 0, 1, 1,
-0.008618489, -2.263751, -3.541082, 1, 0, 0, 1, 1,
-0.003605561, 1.207547, -0.7856602, 1, 0, 0, 1, 1,
-0.0003393796, -1.45531, -3.53632, 1, 0, 0, 1, 1,
0.003587567, 1.314424, -0.2051447, 0, 0, 0, 1, 1,
0.004519256, -0.2209766, 5.774104, 0, 0, 0, 1, 1,
0.006621267, 1.012681, 0.0915027, 0, 0, 0, 1, 1,
0.009669752, -0.1735056, 3.432942, 0, 0, 0, 1, 1,
0.01052557, 1.681922, -1.214729, 0, 0, 0, 1, 1,
0.0113632, 0.2860984, -1.150109, 0, 0, 0, 1, 1,
0.01267047, -0.0793291, 3.263498, 0, 0, 0, 1, 1,
0.01363392, 0.7673954, -0.1898421, 1, 1, 1, 1, 1,
0.01467962, -1.257282, 3.947747, 1, 1, 1, 1, 1,
0.01992025, 0.04402352, -0.7471188, 1, 1, 1, 1, 1,
0.02063051, -1.395513, 3.144125, 1, 1, 1, 1, 1,
0.02644954, -1.830367, 2.390004, 1, 1, 1, 1, 1,
0.02700177, 0.1284354, -1.877098, 1, 1, 1, 1, 1,
0.02823468, 0.7808986, 0.06711472, 1, 1, 1, 1, 1,
0.03240432, -0.7782928, 3.91937, 1, 1, 1, 1, 1,
0.03318124, 0.06125054, 0.3765028, 1, 1, 1, 1, 1,
0.03571931, -0.3954408, 2.957942, 1, 1, 1, 1, 1,
0.03683023, 0.04497926, 1.22832, 1, 1, 1, 1, 1,
0.03807244, 1.074023, -0.9119471, 1, 1, 1, 1, 1,
0.03950972, -0.09363861, 3.944271, 1, 1, 1, 1, 1,
0.03976582, -0.686433, 1.644643, 1, 1, 1, 1, 1,
0.04004958, -0.9480345, 3.011446, 1, 1, 1, 1, 1,
0.04065073, 0.7538455, 1.521622, 0, 0, 1, 1, 1,
0.04181026, 0.2953701, -0.03738936, 1, 0, 0, 1, 1,
0.04186457, -0.004783959, 3.720388, 1, 0, 0, 1, 1,
0.04215634, -0.03833028, 4.128163, 1, 0, 0, 1, 1,
0.04811116, -0.4555168, 2.193506, 1, 0, 0, 1, 1,
0.04817809, -1.160524, 3.413502, 1, 0, 0, 1, 1,
0.04917246, 0.5049564, -1.870996, 0, 0, 0, 1, 1,
0.05236519, -1.343108, 4.819613, 0, 0, 0, 1, 1,
0.054234, -0.484427, 1.106482, 0, 0, 0, 1, 1,
0.05446501, -0.9427518, 2.6157, 0, 0, 0, 1, 1,
0.05878938, 0.586123, -0.2373963, 0, 0, 0, 1, 1,
0.06134057, 1.111382, -0.1480283, 0, 0, 0, 1, 1,
0.06271388, 0.134894, -0.367218, 0, 0, 0, 1, 1,
0.07126981, -0.9116139, 2.430569, 1, 1, 1, 1, 1,
0.0821426, -0.4225289, 2.287936, 1, 1, 1, 1, 1,
0.08345045, -0.9100462, 2.167446, 1, 1, 1, 1, 1,
0.08489449, 0.1979787, 0.6918857, 1, 1, 1, 1, 1,
0.08750053, 0.5874253, 0.9493735, 1, 1, 1, 1, 1,
0.09016491, -0.5633906, 1.049549, 1, 1, 1, 1, 1,
0.09190567, 0.4375226, 0.295893, 1, 1, 1, 1, 1,
0.09272051, 0.5262062, 0.3848992, 1, 1, 1, 1, 1,
0.09443764, 0.4236057, -0.9011799, 1, 1, 1, 1, 1,
0.09455714, -0.9173661, 2.350061, 1, 1, 1, 1, 1,
0.09561098, 2.354665, 0.9813841, 1, 1, 1, 1, 1,
0.1034278, -0.4101077, 2.441532, 1, 1, 1, 1, 1,
0.104344, -0.7469979, 3.98993, 1, 1, 1, 1, 1,
0.1060259, -0.5701463, 2.452823, 1, 1, 1, 1, 1,
0.1085017, 0.5103551, -0.5887316, 1, 1, 1, 1, 1,
0.1118375, -1.242262, 1.982411, 0, 0, 1, 1, 1,
0.1120193, 0.6936588, 1.540774, 1, 0, 0, 1, 1,
0.1125252, 0.3352172, 0.06837973, 1, 0, 0, 1, 1,
0.1131571, 0.2986544, -0.5489553, 1, 0, 0, 1, 1,
0.114553, -1.561239, 2.512946, 1, 0, 0, 1, 1,
0.1188776, -1.2199, 2.791995, 1, 0, 0, 1, 1,
0.1200956, -0.4694217, 2.124631, 0, 0, 0, 1, 1,
0.1205685, -0.5285497, 0.1945068, 0, 0, 0, 1, 1,
0.1217768, 0.455426, 1.014906, 0, 0, 0, 1, 1,
0.1236219, 2.08862, 0.09519307, 0, 0, 0, 1, 1,
0.1247068, 0.3864255, 1.443033, 0, 0, 0, 1, 1,
0.126286, -0.3865172, 2.685593, 0, 0, 0, 1, 1,
0.1277571, -0.7084047, 3.903484, 0, 0, 0, 1, 1,
0.1295334, -1.014831, 1.254718, 1, 1, 1, 1, 1,
0.1367029, 0.5989721, 1.457814, 1, 1, 1, 1, 1,
0.1388897, -0.1867943, 3.01861, 1, 1, 1, 1, 1,
0.1397922, -0.03649322, 3.485561, 1, 1, 1, 1, 1,
0.140224, 0.3310437, 0.2018874, 1, 1, 1, 1, 1,
0.1408827, 1.037248, 0.7242863, 1, 1, 1, 1, 1,
0.1417488, 0.1181435, 0.1341108, 1, 1, 1, 1, 1,
0.1455422, 1.614316, -1.260396, 1, 1, 1, 1, 1,
0.1462809, 0.09498879, 0.06556135, 1, 1, 1, 1, 1,
0.148317, -1.183005, 3.220079, 1, 1, 1, 1, 1,
0.1508628, 0.0297836, -0.4345339, 1, 1, 1, 1, 1,
0.1560117, 0.6037584, 1.990956, 1, 1, 1, 1, 1,
0.1571482, 0.8272879, -0.06063235, 1, 1, 1, 1, 1,
0.1579533, 0.8951157, 0.01101356, 1, 1, 1, 1, 1,
0.1582289, -0.6420681, 2.656578, 1, 1, 1, 1, 1,
0.1591442, 0.5929101, -0.2895356, 0, 0, 1, 1, 1,
0.1599009, -0.134476, 3.122364, 1, 0, 0, 1, 1,
0.1634159, -0.8645149, 2.931, 1, 0, 0, 1, 1,
0.1640517, -0.4010821, 1.844848, 1, 0, 0, 1, 1,
0.1642804, 0.5772216, -0.1632401, 1, 0, 0, 1, 1,
0.1650336, 0.2318992, -0.5141142, 1, 0, 0, 1, 1,
0.1680572, -2.798969, 2.15645, 0, 0, 0, 1, 1,
0.1682749, -1.963912, 3.435568, 0, 0, 0, 1, 1,
0.1684584, -0.8291677, 3.371693, 0, 0, 0, 1, 1,
0.1698999, 2.246036, 0.07815083, 0, 0, 0, 1, 1,
0.170698, 1.55264, 2.527152, 0, 0, 0, 1, 1,
0.1747038, -0.392655, 1.161552, 0, 0, 0, 1, 1,
0.1748562, -0.02704185, 2.491656, 0, 0, 0, 1, 1,
0.1758003, -0.1920494, 2.414871, 1, 1, 1, 1, 1,
0.1787497, 1.170926, 0.7146162, 1, 1, 1, 1, 1,
0.1810632, -1.063254, 1.826207, 1, 1, 1, 1, 1,
0.186156, 0.5826573, 1.36702, 1, 1, 1, 1, 1,
0.1893951, -1.331264, 4.086692, 1, 1, 1, 1, 1,
0.1919931, -0.9024532, 2.338529, 1, 1, 1, 1, 1,
0.2004103, -0.197974, 2.47967, 1, 1, 1, 1, 1,
0.202566, 1.199463, 1.390118, 1, 1, 1, 1, 1,
0.2033235, -0.9759986, 1.813946, 1, 1, 1, 1, 1,
0.2079379, -0.8650931, 2.022997, 1, 1, 1, 1, 1,
0.2079936, -1.173906, 3.146272, 1, 1, 1, 1, 1,
0.2116489, 0.1161923, 0.9938409, 1, 1, 1, 1, 1,
0.2152686, 0.06922668, -0.0588205, 1, 1, 1, 1, 1,
0.2172994, -1.491268, 3.639224, 1, 1, 1, 1, 1,
0.2230259, -2.049464, 4.778304, 1, 1, 1, 1, 1,
0.2249153, -1.247163, 1.46372, 0, 0, 1, 1, 1,
0.2280917, 0.07916527, 1.444957, 1, 0, 0, 1, 1,
0.2286912, 1.249088, 0.9596398, 1, 0, 0, 1, 1,
0.2288009, 0.4731304, 0.7406715, 1, 0, 0, 1, 1,
0.236009, 0.6872851, 0.3010424, 1, 0, 0, 1, 1,
0.2455854, -0.9712644, 2.621573, 1, 0, 0, 1, 1,
0.2482203, -0.1319255, 0.1952258, 0, 0, 0, 1, 1,
0.2553964, 1.978546, -1.369002, 0, 0, 0, 1, 1,
0.2563546, -1.789932, 2.680474, 0, 0, 0, 1, 1,
0.2586646, 2.696591, 0.6077923, 0, 0, 0, 1, 1,
0.2635834, 0.03981121, 1.618435, 0, 0, 0, 1, 1,
0.2641428, -0.6989563, 1.882589, 0, 0, 0, 1, 1,
0.2643038, 0.3827548, 1.806127, 0, 0, 0, 1, 1,
0.266256, -0.6478705, 2.374081, 1, 1, 1, 1, 1,
0.2690979, 0.07185006, 2.016595, 1, 1, 1, 1, 1,
0.2698289, 2.276236, 1.669371, 1, 1, 1, 1, 1,
0.2762938, 0.9127871, -0.2574981, 1, 1, 1, 1, 1,
0.2797166, 0.9161538, 1.211831, 1, 1, 1, 1, 1,
0.2824247, 0.4593033, 0.8712052, 1, 1, 1, 1, 1,
0.2826305, 0.6365686, 0.1681698, 1, 1, 1, 1, 1,
0.2842824, -0.1823701, 3.35971, 1, 1, 1, 1, 1,
0.2881172, -0.571936, 5.000736, 1, 1, 1, 1, 1,
0.2882605, 1.155686, -0.5481656, 1, 1, 1, 1, 1,
0.2914847, 0.4961801, 0.08687153, 1, 1, 1, 1, 1,
0.2957181, -0.1875395, 1.210584, 1, 1, 1, 1, 1,
0.3005892, 0.9657753, 0.3126951, 1, 1, 1, 1, 1,
0.3031247, 0.1781453, 0.8260924, 1, 1, 1, 1, 1,
0.303211, 1.136768, -0.1779919, 1, 1, 1, 1, 1,
0.3061291, 0.1837411, 0.7254593, 0, 0, 1, 1, 1,
0.315266, -0.5844568, 2.174219, 1, 0, 0, 1, 1,
0.3199766, -1.093446, 2.052948, 1, 0, 0, 1, 1,
0.3205645, 0.368877, 0.03360688, 1, 0, 0, 1, 1,
0.3205837, 2.450804, 2.280504, 1, 0, 0, 1, 1,
0.3265706, -0.7236516, 2.137015, 1, 0, 0, 1, 1,
0.3276224, 0.08823881, -1.373751, 0, 0, 0, 1, 1,
0.3285375, -1.054094, 2.601557, 0, 0, 0, 1, 1,
0.3302302, -0.2420193, 4.150664, 0, 0, 0, 1, 1,
0.3378581, -0.332306, 0.6102753, 0, 0, 0, 1, 1,
0.3382391, -0.1848594, 1.333154, 0, 0, 0, 1, 1,
0.3390378, -1.16292, 3.378688, 0, 0, 0, 1, 1,
0.3420491, -0.692782, 2.819669, 0, 0, 0, 1, 1,
0.3479947, 0.856268, 0.7742795, 1, 1, 1, 1, 1,
0.3514251, -0.7449796, 0.7239974, 1, 1, 1, 1, 1,
0.352966, 0.4158939, 0.03344221, 1, 1, 1, 1, 1,
0.3537503, -0.4649027, 3.261176, 1, 1, 1, 1, 1,
0.3562391, -1.160394, 3.838979, 1, 1, 1, 1, 1,
0.3566067, -1.576638, 1.536534, 1, 1, 1, 1, 1,
0.359049, 2.258188, 0.6756324, 1, 1, 1, 1, 1,
0.3620844, 0.730897, -0.5546979, 1, 1, 1, 1, 1,
0.3656214, 1.82826, 1.474975, 1, 1, 1, 1, 1,
0.3663173, 1.072103, -0.7147727, 1, 1, 1, 1, 1,
0.367607, -0.4651636, 3.18628, 1, 1, 1, 1, 1,
0.3783922, 0.9229521, -1.058271, 1, 1, 1, 1, 1,
0.3785417, 0.6904987, 0.5714708, 1, 1, 1, 1, 1,
0.3823985, 0.4922717, 1.225456, 1, 1, 1, 1, 1,
0.3840409, -0.5963063, 3.18667, 1, 1, 1, 1, 1,
0.3849309, -0.4704969, 2.637315, 0, 0, 1, 1, 1,
0.3854318, 0.1236106, 0.7901764, 1, 0, 0, 1, 1,
0.3861179, 1.852477, 1.48753, 1, 0, 0, 1, 1,
0.386779, 0.9727666, -0.4868248, 1, 0, 0, 1, 1,
0.3878565, -0.8309266, 2.621742, 1, 0, 0, 1, 1,
0.3880363, 0.05051401, 2.391954, 1, 0, 0, 1, 1,
0.3922741, -2.09224, 2.478426, 0, 0, 0, 1, 1,
0.3923846, -0.9106492, 3.303404, 0, 0, 0, 1, 1,
0.3929931, -0.5915837, 2.001735, 0, 0, 0, 1, 1,
0.3937547, -0.7058236, 1.410128, 0, 0, 0, 1, 1,
0.3995047, 0.7080641, 0.6250443, 0, 0, 0, 1, 1,
0.3996479, -0.5906774, 1.62217, 0, 0, 0, 1, 1,
0.4034764, 0.7371109, -0.4038738, 0, 0, 0, 1, 1,
0.4042777, 1.129996, 0.2377681, 1, 1, 1, 1, 1,
0.4069218, 0.03349455, 0.1782647, 1, 1, 1, 1, 1,
0.4079651, -0.0911111, 2.230207, 1, 1, 1, 1, 1,
0.4087082, -0.2827602, 2.140752, 1, 1, 1, 1, 1,
0.4101579, -0.5196232, 2.939932, 1, 1, 1, 1, 1,
0.4138786, -0.7665004, 2.889976, 1, 1, 1, 1, 1,
0.4141086, 0.004289042, 3.05599, 1, 1, 1, 1, 1,
0.4159074, 0.9625567, 1.092783, 1, 1, 1, 1, 1,
0.4182278, -0.784122, 1.329705, 1, 1, 1, 1, 1,
0.4191011, 0.3949309, 0.3477983, 1, 1, 1, 1, 1,
0.4191583, -0.3686129, 2.118765, 1, 1, 1, 1, 1,
0.4236997, -0.3494733, 1.19032, 1, 1, 1, 1, 1,
0.4291918, -0.03294801, 1.672561, 1, 1, 1, 1, 1,
0.4315552, -1.163534, 3.628338, 1, 1, 1, 1, 1,
0.4321641, -0.5650018, 2.171808, 1, 1, 1, 1, 1,
0.4367974, 1.139659, 0.8854337, 0, 0, 1, 1, 1,
0.4404811, -2.059656, 4.37583, 1, 0, 0, 1, 1,
0.442555, 0.094059, 1.506698, 1, 0, 0, 1, 1,
0.4463997, 0.1266455, 0.1480543, 1, 0, 0, 1, 1,
0.4495152, 0.7179742, 1.708663, 1, 0, 0, 1, 1,
0.4501311, 1.84333, 0.7717553, 1, 0, 0, 1, 1,
0.4628798, -1.137275, 2.094635, 0, 0, 0, 1, 1,
0.4679635, -2.109715, 1.706306, 0, 0, 0, 1, 1,
0.4720289, -0.143967, 1.183757, 0, 0, 0, 1, 1,
0.4767327, 0.6652105, 1.206541, 0, 0, 0, 1, 1,
0.4773014, 2.006559, -1.181223, 0, 0, 0, 1, 1,
0.4782274, -1.093338, 2.919157, 0, 0, 0, 1, 1,
0.4824298, -2.073498, 0.4680932, 0, 0, 0, 1, 1,
0.4851374, 0.09632482, -0.1046461, 1, 1, 1, 1, 1,
0.4852037, -0.7844406, 1.989798, 1, 1, 1, 1, 1,
0.4882313, -2.049592, 3.319207, 1, 1, 1, 1, 1,
0.4882534, -1.777592, 4.484018, 1, 1, 1, 1, 1,
0.4901719, -1.228484, 2.970455, 1, 1, 1, 1, 1,
0.4929053, 0.6904768, 1.355844, 1, 1, 1, 1, 1,
0.4939964, -0.7697945, 3.294375, 1, 1, 1, 1, 1,
0.4988855, -0.1706691, 1.09979, 1, 1, 1, 1, 1,
0.500401, 0.1532053, 1.98711, 1, 1, 1, 1, 1,
0.5116201, 0.06055292, 3.264628, 1, 1, 1, 1, 1,
0.5142903, 1.665314, 0.8411469, 1, 1, 1, 1, 1,
0.5177183, -1.34843, 3.150808, 1, 1, 1, 1, 1,
0.5255324, 0.983243, -0.00934943, 1, 1, 1, 1, 1,
0.5258676, -0.2196019, 2.414004, 1, 1, 1, 1, 1,
0.5269855, 1.147203, 2.056713, 1, 1, 1, 1, 1,
0.52905, -1.299075, 3.280962, 0, 0, 1, 1, 1,
0.5292416, -1.62613, 1.687339, 1, 0, 0, 1, 1,
0.5347695, -0.5666144, 3.233315, 1, 0, 0, 1, 1,
0.541028, 0.7397268, 1.575674, 1, 0, 0, 1, 1,
0.5423962, -1.040485, 2.054938, 1, 0, 0, 1, 1,
0.5440497, 1.699135, 0.2668828, 1, 0, 0, 1, 1,
0.5486231, -0.2433784, 1.38907, 0, 0, 0, 1, 1,
0.5588333, -1.127406, 1.9598, 0, 0, 0, 1, 1,
0.5753794, -0.8576854, -1.019848, 0, 0, 0, 1, 1,
0.5774075, -0.07807364, 2.599324, 0, 0, 0, 1, 1,
0.5790414, 0.4482108, 0.1027731, 0, 0, 0, 1, 1,
0.5812868, -2.893687, 4.504949, 0, 0, 0, 1, 1,
0.5814729, -0.6962519, 2.674722, 0, 0, 0, 1, 1,
0.5929061, -0.1965656, 1.443492, 1, 1, 1, 1, 1,
0.5976566, -0.08696157, 4.376151, 1, 1, 1, 1, 1,
0.6018894, -0.1242435, 1.543432, 1, 1, 1, 1, 1,
0.6102423, 0.7404776, 0.5730696, 1, 1, 1, 1, 1,
0.6107246, 1.238727, -0.3139263, 1, 1, 1, 1, 1,
0.6185385, -2.113263, 3.06041, 1, 1, 1, 1, 1,
0.6241929, -0.5876271, 2.590249, 1, 1, 1, 1, 1,
0.6283391, -0.1298859, 1.142896, 1, 1, 1, 1, 1,
0.6286474, 0.3045073, 0.7374232, 1, 1, 1, 1, 1,
0.6291472, -0.76218, 1.667501, 1, 1, 1, 1, 1,
0.6323231, 0.1450248, 2.361291, 1, 1, 1, 1, 1,
0.6346829, -0.8979045, 3.138654, 1, 1, 1, 1, 1,
0.6370761, -0.6242946, 3.017648, 1, 1, 1, 1, 1,
0.6410621, 1.997676, 0.810427, 1, 1, 1, 1, 1,
0.6452176, 1.365282, 0.1233625, 1, 1, 1, 1, 1,
0.6579347, -1.453673, 2.744802, 0, 0, 1, 1, 1,
0.6590227, -0.5053635, 2.702356, 1, 0, 0, 1, 1,
0.6592911, 0.7242208, 2.093519, 1, 0, 0, 1, 1,
0.6606985, 0.8523418, -0.2831624, 1, 0, 0, 1, 1,
0.6628214, -0.4089674, 2.587547, 1, 0, 0, 1, 1,
0.6709648, 1.143884, -1.012774, 1, 0, 0, 1, 1,
0.6745129, 0.3828872, 1.015818, 0, 0, 0, 1, 1,
0.6786666, 0.1921106, 1.042427, 0, 0, 0, 1, 1,
0.6838363, 0.62402, 1.327795, 0, 0, 0, 1, 1,
0.6931929, 2.120873, 0.4448314, 0, 0, 0, 1, 1,
0.6968884, -0.3740706, 2.113467, 0, 0, 0, 1, 1,
0.6971524, 0.4076371, 1.476305, 0, 0, 0, 1, 1,
0.6985071, 0.472018, 1.593997, 0, 0, 0, 1, 1,
0.6996514, 1.216867, 0.3331648, 1, 1, 1, 1, 1,
0.7012032, 0.5371175, 1.712703, 1, 1, 1, 1, 1,
0.7028388, -1.073232, 3.590788, 1, 1, 1, 1, 1,
0.7033814, -0.7018499, 1.531058, 1, 1, 1, 1, 1,
0.7065163, -1.518983, 3.935308, 1, 1, 1, 1, 1,
0.707553, 0.1424869, 0.4669293, 1, 1, 1, 1, 1,
0.7076914, 0.9437273, 1.243665, 1, 1, 1, 1, 1,
0.7078842, -0.6731932, 2.720532, 1, 1, 1, 1, 1,
0.7115251, -0.5617821, 1.690079, 1, 1, 1, 1, 1,
0.7116207, 0.5752461, 1.690571, 1, 1, 1, 1, 1,
0.7138197, 2.266946, 0.9749922, 1, 1, 1, 1, 1,
0.7142032, -0.4937032, 3.216119, 1, 1, 1, 1, 1,
0.7163634, -0.5383456, 1.766996, 1, 1, 1, 1, 1,
0.7279508, -0.7016174, 3.910891, 1, 1, 1, 1, 1,
0.7343904, 1.630003, 0.1788732, 1, 1, 1, 1, 1,
0.7370324, -1.614189, 2.023775, 0, 0, 1, 1, 1,
0.7380578, -0.03988227, 1.239149, 1, 0, 0, 1, 1,
0.7404366, 0.03051949, 1.224904, 1, 0, 0, 1, 1,
0.7430682, -1.188771, 0.06706687, 1, 0, 0, 1, 1,
0.7444372, -0.30273, 1.411759, 1, 0, 0, 1, 1,
0.7451361, -0.7276267, 0.7312543, 1, 0, 0, 1, 1,
0.7470791, 0.2592987, 0.1476444, 0, 0, 0, 1, 1,
0.7481298, -0.7931591, 1.701669, 0, 0, 0, 1, 1,
0.7490433, -0.5340967, 0.9780917, 0, 0, 0, 1, 1,
0.750008, -1.629512, 1.383945, 0, 0, 0, 1, 1,
0.7515911, -1.605572, 3.097813, 0, 0, 0, 1, 1,
0.753558, 1.833525, 0.8796452, 0, 0, 0, 1, 1,
0.75516, 0.4668048, 1.38203, 0, 0, 0, 1, 1,
0.7562339, -0.2176385, 2.236011, 1, 1, 1, 1, 1,
0.7620329, 1.138962, 0.4225535, 1, 1, 1, 1, 1,
0.7647048, -0.5001029, 2.357371, 1, 1, 1, 1, 1,
0.7670351, -0.04554618, 1.433555, 1, 1, 1, 1, 1,
0.7676728, -0.2999581, 1.291001, 1, 1, 1, 1, 1,
0.7719035, -1.891776, 1.730287, 1, 1, 1, 1, 1,
0.7724398, -2.499018, 2.046134, 1, 1, 1, 1, 1,
0.7725704, -0.2681971, 0.3343911, 1, 1, 1, 1, 1,
0.7755704, 1.657155, 0.6829582, 1, 1, 1, 1, 1,
0.7768573, 0.5101566, 0.5928885, 1, 1, 1, 1, 1,
0.7847165, -0.9828349, 3.724795, 1, 1, 1, 1, 1,
0.7869024, 1.979894, 1.313643, 1, 1, 1, 1, 1,
0.7945623, 1.44629, 0.1616672, 1, 1, 1, 1, 1,
0.7971728, 1.126238, 0.9019002, 1, 1, 1, 1, 1,
0.7990566, -1.167778, 3.159031, 1, 1, 1, 1, 1,
0.8060349, 0.4825895, 0.7484655, 0, 0, 1, 1, 1,
0.8076159, -0.5916787, 1.606131, 1, 0, 0, 1, 1,
0.8102857, -1.118873, 2.017881, 1, 0, 0, 1, 1,
0.8104743, 1.127832, 1.177518, 1, 0, 0, 1, 1,
0.8118242, 0.6015627, 0.1571982, 1, 0, 0, 1, 1,
0.8149219, -0.8887077, 2.894736, 1, 0, 0, 1, 1,
0.8152171, -0.8122907, 1.64656, 0, 0, 0, 1, 1,
0.8169959, -0.5180717, 1.024169, 0, 0, 0, 1, 1,
0.828127, -1.20376, 1.392137, 0, 0, 0, 1, 1,
0.8297822, 0.09963935, 0.2769659, 0, 0, 0, 1, 1,
0.8332998, 0.589869, 0.9014511, 0, 0, 0, 1, 1,
0.8333265, -0.6748284, 2.961294, 0, 0, 0, 1, 1,
0.8341089, -0.03537708, 2.601254, 0, 0, 0, 1, 1,
0.8351259, 1.690413, -0.9049827, 1, 1, 1, 1, 1,
0.8373873, -1.262691, 2.246532, 1, 1, 1, 1, 1,
0.8494452, 0.5492474, 0.5352967, 1, 1, 1, 1, 1,
0.8529736, 1.18255, 0.7795751, 1, 1, 1, 1, 1,
0.8604229, -0.7053688, 2.661806, 1, 1, 1, 1, 1,
0.8616033, 0.1171184, 1.641581, 1, 1, 1, 1, 1,
0.8621161, 0.2181533, 0.9577891, 1, 1, 1, 1, 1,
0.863175, 0.3628679, 0.5760539, 1, 1, 1, 1, 1,
0.8706545, -1.275739, 2.132844, 1, 1, 1, 1, 1,
0.8751184, -0.02727212, -0.2619113, 1, 1, 1, 1, 1,
0.8751372, -0.2576945, 1.975793, 1, 1, 1, 1, 1,
0.8805044, -0.2384452, 2.716661, 1, 1, 1, 1, 1,
0.882098, -1.942318, 4.100843, 1, 1, 1, 1, 1,
0.8851527, -0.6151153, 1.586993, 1, 1, 1, 1, 1,
0.8891236, -0.9876153, 2.419161, 1, 1, 1, 1, 1,
0.890721, 1.073923, 2.383714, 0, 0, 1, 1, 1,
0.8942858, -0.8427427, 2.387112, 1, 0, 0, 1, 1,
0.8983482, 0.2241966, 0.3954344, 1, 0, 0, 1, 1,
0.9015438, -0.9012347, 0.5283583, 1, 0, 0, 1, 1,
0.9078647, -3.101167, 2.626317, 1, 0, 0, 1, 1,
0.916267, -0.3523606, 1.312585, 1, 0, 0, 1, 1,
0.9176873, 0.5821996, 1.058544, 0, 0, 0, 1, 1,
0.9178698, 0.06759649, 1.786422, 0, 0, 0, 1, 1,
0.9182696, -0.3220796, 2.578349, 0, 0, 0, 1, 1,
0.9238114, -1.26508, 3.311298, 0, 0, 0, 1, 1,
0.9261822, 0.5342453, 1.029958, 0, 0, 0, 1, 1,
0.9271267, 1.76188, 1.733501, 0, 0, 0, 1, 1,
0.9397978, 0.3845876, 0.7425214, 0, 0, 0, 1, 1,
0.9405754, 0.6603478, 1.311861, 1, 1, 1, 1, 1,
0.9471994, 0.268735, -0.1223029, 1, 1, 1, 1, 1,
0.9490972, -1.47738, 2.248639, 1, 1, 1, 1, 1,
0.9503396, -0.7504413, 1.376225, 1, 1, 1, 1, 1,
0.9595346, -0.3305935, 1.623349, 1, 1, 1, 1, 1,
0.9623813, -0.4307435, 1.070218, 1, 1, 1, 1, 1,
0.9640402, 1.777106, 0.9778702, 1, 1, 1, 1, 1,
0.9656768, 0.6448683, 2.813963, 1, 1, 1, 1, 1,
0.9669917, 0.7522792, 2.311921, 1, 1, 1, 1, 1,
0.9678079, -0.3596894, 2.080309, 1, 1, 1, 1, 1,
0.9785962, -0.2795467, 1.79795, 1, 1, 1, 1, 1,
0.9883052, -0.2935199, 0.2475976, 1, 1, 1, 1, 1,
0.9894667, 0.7192506, 0.7197185, 1, 1, 1, 1, 1,
0.9896001, -0.7997307, 2.150756, 1, 1, 1, 1, 1,
0.995044, 1.040669, -1.072961, 1, 1, 1, 1, 1,
0.9965869, 0.2343426, 1.088736, 0, 0, 1, 1, 1,
1.005574, -0.05547682, 1.832109, 1, 0, 0, 1, 1,
1.012939, -0.285395, 1.233116, 1, 0, 0, 1, 1,
1.013692, -0.08821797, 2.489165, 1, 0, 0, 1, 1,
1.017837, 0.4398781, 1.160277, 1, 0, 0, 1, 1,
1.01883, -0.4003988, 2.562629, 1, 0, 0, 1, 1,
1.019601, -2.046712, 2.861895, 0, 0, 0, 1, 1,
1.024838, -1.20172, 2.336972, 0, 0, 0, 1, 1,
1.025694, -0.9107051, 3.674173, 0, 0, 0, 1, 1,
1.026923, -2.130382, 2.16271, 0, 0, 0, 1, 1,
1.040467, 1.544244, 2.042078, 0, 0, 0, 1, 1,
1.050856, 1.279018, 0.9293651, 0, 0, 0, 1, 1,
1.062544, -0.4664122, 3.190257, 0, 0, 0, 1, 1,
1.063471, -0.5439884, 2.623052, 1, 1, 1, 1, 1,
1.065763, -0.3885978, 2.255934, 1, 1, 1, 1, 1,
1.066589, 0.2199072, 0.7761794, 1, 1, 1, 1, 1,
1.071818, 0.1633587, 2.137149, 1, 1, 1, 1, 1,
1.073277, -0.0839876, 1.803535, 1, 1, 1, 1, 1,
1.075629, -0.8681223, 0.8178328, 1, 1, 1, 1, 1,
1.0767, 0.3508167, 0.1026588, 1, 1, 1, 1, 1,
1.078486, 0.919725, 0.3974304, 1, 1, 1, 1, 1,
1.080997, -0.08299974, 1.872545, 1, 1, 1, 1, 1,
1.082684, -0.4118968, 3.680769, 1, 1, 1, 1, 1,
1.08314, -0.3346467, 2.432152, 1, 1, 1, 1, 1,
1.085022, 1.16874, 1.84849, 1, 1, 1, 1, 1,
1.089796, 0.7072666, 0.2620225, 1, 1, 1, 1, 1,
1.090778, -2.200897, 3.598218, 1, 1, 1, 1, 1,
1.097384, -0.3899696, 2.904021, 1, 1, 1, 1, 1,
1.09857, 0.469055, 0.7972716, 0, 0, 1, 1, 1,
1.102015, -0.6444765, 2.952783, 1, 0, 0, 1, 1,
1.102913, 0.6902627, -0.9495894, 1, 0, 0, 1, 1,
1.125002, 0.7714368, 1.031014, 1, 0, 0, 1, 1,
1.125253, -0.1213259, 1.167558, 1, 0, 0, 1, 1,
1.129646, -0.6683325, 2.50418, 1, 0, 0, 1, 1,
1.12979, -0.3971968, 0.7009326, 0, 0, 0, 1, 1,
1.132341, -0.4329607, 1.866152, 0, 0, 0, 1, 1,
1.139539, 0.1762859, 2.216161, 0, 0, 0, 1, 1,
1.156649, -0.5848875, 2.667907, 0, 0, 0, 1, 1,
1.158076, 0.1315507, 0.9782848, 0, 0, 0, 1, 1,
1.160287, 1.184791, 2.438862, 0, 0, 0, 1, 1,
1.170142, -1.236394, 0.9943702, 0, 0, 0, 1, 1,
1.17537, 0.9115664, 3.423987, 1, 1, 1, 1, 1,
1.177213, -1.519556, 2.721067, 1, 1, 1, 1, 1,
1.179938, -2.780069, 0.9964699, 1, 1, 1, 1, 1,
1.184977, -0.9334049, 4.143404, 1, 1, 1, 1, 1,
1.192732, -1.065792, 3.75803, 1, 1, 1, 1, 1,
1.193034, -0.1054134, 0.6903515, 1, 1, 1, 1, 1,
1.197429, -0.7520117, 2.602918, 1, 1, 1, 1, 1,
1.215394, 1.44757, 0.2185739, 1, 1, 1, 1, 1,
1.219925, -1.006998, 3.812652, 1, 1, 1, 1, 1,
1.227585, 0.1811677, 3.300502, 1, 1, 1, 1, 1,
1.22957, 1.354909, 2.027946, 1, 1, 1, 1, 1,
1.229724, -2.396887, 2.89541, 1, 1, 1, 1, 1,
1.233771, -2.441389, 3.188569, 1, 1, 1, 1, 1,
1.236089, -0.7339824, 1.455213, 1, 1, 1, 1, 1,
1.249599, 1.167604, 0.9637109, 1, 1, 1, 1, 1,
1.254153, -0.07740786, 2.934505, 0, 0, 1, 1, 1,
1.254975, 0.2801181, 1.060808, 1, 0, 0, 1, 1,
1.254983, -2.143842, 3.41631, 1, 0, 0, 1, 1,
1.260115, -0.2502807, 3.014455, 1, 0, 0, 1, 1,
1.273596, 0.4312023, 0.5307546, 1, 0, 0, 1, 1,
1.278816, 1.094553, 1.615267, 1, 0, 0, 1, 1,
1.283891, 0.5139337, 1.345916, 0, 0, 0, 1, 1,
1.28581, -1.53554, 1.543566, 0, 0, 0, 1, 1,
1.287416, -0.7750873, 0.6215722, 0, 0, 0, 1, 1,
1.292364, 0.700215, 2.701263, 0, 0, 0, 1, 1,
1.300516, -1.736156, 3.157077, 0, 0, 0, 1, 1,
1.311908, 0.9205813, -0.02711604, 0, 0, 0, 1, 1,
1.325481, -1.090657, 3.375154, 0, 0, 0, 1, 1,
1.326076, -0.1236129, 1.947777, 1, 1, 1, 1, 1,
1.32875, 2.153954, 0.08312658, 1, 1, 1, 1, 1,
1.329316, 0.06091025, 3.457957, 1, 1, 1, 1, 1,
1.332285, 0.414421, 2.332526, 1, 1, 1, 1, 1,
1.333725, 0.1988222, 1.610901, 1, 1, 1, 1, 1,
1.334941, -0.7574426, 2.190017, 1, 1, 1, 1, 1,
1.336349, -1.179954, 1.125511, 1, 1, 1, 1, 1,
1.349965, 0.7440878, 0.8654436, 1, 1, 1, 1, 1,
1.351547, 0.3417801, 1.703297, 1, 1, 1, 1, 1,
1.357514, 0.1699511, 2.170936, 1, 1, 1, 1, 1,
1.35982, 0.3616434, 2.259726, 1, 1, 1, 1, 1,
1.359932, -0.1722155, 1.254064, 1, 1, 1, 1, 1,
1.376624, -0.3577724, 0.2522558, 1, 1, 1, 1, 1,
1.3917, 1.287345, 0.3684198, 1, 1, 1, 1, 1,
1.393265, 0.7914454, -0.4216597, 1, 1, 1, 1, 1,
1.39519, -0.460103, 2.903917, 0, 0, 1, 1, 1,
1.404732, 0.07959156, 0.7107525, 1, 0, 0, 1, 1,
1.434322, -1.094017, 0.8624471, 1, 0, 0, 1, 1,
1.468137, -0.9083174, 0.3028871, 1, 0, 0, 1, 1,
1.472042, 2.056448, 0.04053425, 1, 0, 0, 1, 1,
1.48039, 0.2259396, 0.8437334, 1, 0, 0, 1, 1,
1.483453, -1.081501, -0.1642896, 0, 0, 0, 1, 1,
1.487157, -0.1223575, 0.9932166, 0, 0, 0, 1, 1,
1.487791, 0.05875776, 0.9063719, 0, 0, 0, 1, 1,
1.489581, -0.3193031, 2.159273, 0, 0, 0, 1, 1,
1.511832, -0.6351343, 2.962952, 0, 0, 0, 1, 1,
1.518675, 1.633464, -1.357454, 0, 0, 0, 1, 1,
1.545507, -0.838229, 1.231824, 0, 0, 0, 1, 1,
1.552102, 1.371737, 1.23405, 1, 1, 1, 1, 1,
1.559836, 0.1883827, 0.8373829, 1, 1, 1, 1, 1,
1.563577, 1.084356, -0.1881094, 1, 1, 1, 1, 1,
1.568563, 0.7692835, 0.4396977, 1, 1, 1, 1, 1,
1.571932, 0.02532808, 1.976179, 1, 1, 1, 1, 1,
1.572184, 0.1099365, 1.355374, 1, 1, 1, 1, 1,
1.573181, 1.421959, 1.273915, 1, 1, 1, 1, 1,
1.583327, 0.2859322, 0.8784769, 1, 1, 1, 1, 1,
1.584879, 0.660094, 2.181674, 1, 1, 1, 1, 1,
1.58612, -1.716125, 1.926655, 1, 1, 1, 1, 1,
1.586857, -0.7621096, 2.208003, 1, 1, 1, 1, 1,
1.604666, -0.6760563, 2.254259, 1, 1, 1, 1, 1,
1.620313, -0.8513165, 2.640193, 1, 1, 1, 1, 1,
1.626051, -0.1246769, 1.324248, 1, 1, 1, 1, 1,
1.636282, -0.6813591, 2.080029, 1, 1, 1, 1, 1,
1.656374, 0.1379414, 1.218349, 0, 0, 1, 1, 1,
1.66648, -0.1944593, 0.7756569, 1, 0, 0, 1, 1,
1.671754, -0.3663888, 2.699225, 1, 0, 0, 1, 1,
1.691986, -0.1907671, 2.886328, 1, 0, 0, 1, 1,
1.694479, -0.5808612, 3.59934, 1, 0, 0, 1, 1,
1.697274, 0.04041714, 0.6327003, 1, 0, 0, 1, 1,
1.70075, -1.181192, 0.2505018, 0, 0, 0, 1, 1,
1.710434, 0.9278018, -0.4309216, 0, 0, 0, 1, 1,
1.714522, -0.1732889, -0.9451942, 0, 0, 0, 1, 1,
1.721631, -1.839582, 2.08393, 0, 0, 0, 1, 1,
1.733416, -0.3104519, 1.929396, 0, 0, 0, 1, 1,
1.767154, -0.4340974, 2.533205, 0, 0, 0, 1, 1,
1.786341, 0.176385, 0.5117689, 0, 0, 0, 1, 1,
1.790305, 1.746551, 0.6098125, 1, 1, 1, 1, 1,
1.79837, 0.1254085, 1.178082, 1, 1, 1, 1, 1,
1.800696, 0.3702737, 1.345906, 1, 1, 1, 1, 1,
1.839399, 1.342613, 2.795921, 1, 1, 1, 1, 1,
1.845459, -0.4338046, 2.34457, 1, 1, 1, 1, 1,
1.851248, 0.7317729, 0.6536189, 1, 1, 1, 1, 1,
1.914216, 0.5015476, -0.5436832, 1, 1, 1, 1, 1,
1.957342, -0.2988944, 1.325361, 1, 1, 1, 1, 1,
1.984887, -0.7311875, 1.909123, 1, 1, 1, 1, 1,
1.991672, -0.2781, 1.394308, 1, 1, 1, 1, 1,
1.997854, 0.05951044, 1.87487, 1, 1, 1, 1, 1,
2.000844, -0.1457228, 3.414898, 1, 1, 1, 1, 1,
2.059637, -1.44235, 3.115676, 1, 1, 1, 1, 1,
2.073238, 0.2511898, 1.616197, 1, 1, 1, 1, 1,
2.087388, 0.01697758, 2.014656, 1, 1, 1, 1, 1,
2.126499, 0.5832559, 1.88731, 0, 0, 1, 1, 1,
2.127834, -0.5002586, 2.0935, 1, 0, 0, 1, 1,
2.169847, -1.554528, 2.262756, 1, 0, 0, 1, 1,
2.170638, 0.8027284, -0.07157291, 1, 0, 0, 1, 1,
2.252897, -1.476672, 1.678812, 1, 0, 0, 1, 1,
2.254575, 0.3296116, 0.694878, 1, 0, 0, 1, 1,
2.266964, -0.3318541, 2.869385, 0, 0, 0, 1, 1,
2.274255, -1.107108, 2.116352, 0, 0, 0, 1, 1,
2.28263, -0.8403777, 2.390168, 0, 0, 0, 1, 1,
2.306483, -1.111857, 1.994166, 0, 0, 0, 1, 1,
2.406918, 0.6037832, 1.479257, 0, 0, 0, 1, 1,
2.413286, 0.4852639, 3.251406, 0, 0, 0, 1, 1,
2.432789, -1.844477, 2.808996, 0, 0, 0, 1, 1,
2.498143, -0.05407044, 1.362403, 1, 1, 1, 1, 1,
2.799377, 0.2365444, 2.402534, 1, 1, 1, 1, 1,
2.809816, 1.504504, 1.837139, 1, 1, 1, 1, 1,
2.950161, -0.2322041, 2.134142, 1, 1, 1, 1, 1,
3.048455, -0.160356, 2.052389, 1, 1, 1, 1, 1,
3.062238, -0.1708062, 1.122321, 1, 1, 1, 1, 1,
3.12317, 0.3128606, 3.722857, 1, 1, 1, 1, 1
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
var radius = 9.790991;
var distance = 34.39044;
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
mvMatrix.translate( -0.2356786, -0.1681459, -0.09341502 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.39044);
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
