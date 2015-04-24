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
-2.906307, 1.966974, -0.9598312, 1, 0, 0, 1,
-2.804155, 0.8100461, -3.241231, 1, 0.007843138, 0, 1,
-2.610196, -0.2055295, -2.628043, 1, 0.01176471, 0, 1,
-2.551564, 0.53741, -2.026049, 1, 0.01960784, 0, 1,
-2.483885, -0.6499491, -1.054503, 1, 0.02352941, 0, 1,
-2.350023, 0.9381554, -2.099139, 1, 0.03137255, 0, 1,
-2.346995, -0.3753992, -1.721218, 1, 0.03529412, 0, 1,
-2.307619, 0.8781855, -0.09477255, 1, 0.04313726, 0, 1,
-2.264309, 1.492197, 0.6273032, 1, 0.04705882, 0, 1,
-2.226607, 0.1896975, 0.73107, 1, 0.05490196, 0, 1,
-2.211038, -1.982914, -3.710084, 1, 0.05882353, 0, 1,
-2.198497, 0.1291133, -1.784354, 1, 0.06666667, 0, 1,
-2.162391, 1.226728, -2.610839, 1, 0.07058824, 0, 1,
-2.150233, 0.05961003, -1.958015, 1, 0.07843138, 0, 1,
-2.118117, -0.9215757, -2.315203, 1, 0.08235294, 0, 1,
-2.096716, 0.7035031, -1.271212, 1, 0.09019608, 0, 1,
-2.089285, -0.4730662, 0.1278601, 1, 0.09411765, 0, 1,
-2.059294, -0.09710933, -3.008878, 1, 0.1019608, 0, 1,
-2.056228, -1.969404, -1.424553, 1, 0.1098039, 0, 1,
-2.054092, 0.5341004, 1.208528, 1, 0.1137255, 0, 1,
-2.032621, -0.5861521, -1.835048, 1, 0.1215686, 0, 1,
-2.014727, 0.12191, -1.017168, 1, 0.1254902, 0, 1,
-1.994683, -0.3792542, -2.060926, 1, 0.1333333, 0, 1,
-1.987303, -0.03084997, -2.524483, 1, 0.1372549, 0, 1,
-1.954969, -0.3482037, -0.6044039, 1, 0.145098, 0, 1,
-1.939169, 1.214323, 0.6120967, 1, 0.1490196, 0, 1,
-1.927519, 1.163348, 1.711322, 1, 0.1568628, 0, 1,
-1.91942, 0.3411298, -0.3509832, 1, 0.1607843, 0, 1,
-1.909245, -1.06849, -3.982576, 1, 0.1686275, 0, 1,
-1.901188, -0.8516093, -1.604606, 1, 0.172549, 0, 1,
-1.890623, 0.355611, -3.67837, 1, 0.1803922, 0, 1,
-1.883288, -2.465942, -3.064833, 1, 0.1843137, 0, 1,
-1.867903, 1.985102, -0.6722709, 1, 0.1921569, 0, 1,
-1.846037, 0.9485829, -1.765483, 1, 0.1960784, 0, 1,
-1.81314, 0.2951131, -0.8451774, 1, 0.2039216, 0, 1,
-1.795481, -0.7284504, -3.529642, 1, 0.2117647, 0, 1,
-1.794721, 0.7899982, -2.775596, 1, 0.2156863, 0, 1,
-1.76938, -1.83788, -2.689626, 1, 0.2235294, 0, 1,
-1.767934, -0.5173791, -0.7095463, 1, 0.227451, 0, 1,
-1.76754, -0.03757915, -1.887923, 1, 0.2352941, 0, 1,
-1.762019, 0.2728655, -0.3940385, 1, 0.2392157, 0, 1,
-1.761358, 1.499152, -1.264326, 1, 0.2470588, 0, 1,
-1.76123, -1.005946, -1.833931, 1, 0.2509804, 0, 1,
-1.761182, 0.1724131, -0.5020465, 1, 0.2588235, 0, 1,
-1.744531, -0.8735138, -2.808447, 1, 0.2627451, 0, 1,
-1.737222, -0.9937285, -1.917557, 1, 0.2705882, 0, 1,
-1.735929, 0.1541209, 1.435172, 1, 0.2745098, 0, 1,
-1.714112, -0.05629174, -0.3881376, 1, 0.282353, 0, 1,
-1.712923, 0.920745, 1.031217, 1, 0.2862745, 0, 1,
-1.707404, 0.07627989, 2.88227, 1, 0.2941177, 0, 1,
-1.696636, -0.2828159, -2.194692, 1, 0.3019608, 0, 1,
-1.669301, -0.5626834, -0.003479045, 1, 0.3058824, 0, 1,
-1.652692, -0.1183415, -1.987698, 1, 0.3137255, 0, 1,
-1.634881, 1.413201, -0.7800071, 1, 0.3176471, 0, 1,
-1.608243, -0.8396751, -2.253309, 1, 0.3254902, 0, 1,
-1.596318, 0.638414, -1.661944, 1, 0.3294118, 0, 1,
-1.585405, 1.348029, -0.8228698, 1, 0.3372549, 0, 1,
-1.584675, -0.3031295, -1.264422, 1, 0.3411765, 0, 1,
-1.579273, -1.250729, -3.65163, 1, 0.3490196, 0, 1,
-1.560593, -0.2906026, -1.057639, 1, 0.3529412, 0, 1,
-1.54668, 0.2412452, -1.112838, 1, 0.3607843, 0, 1,
-1.53917, -0.3882631, -2.278449, 1, 0.3647059, 0, 1,
-1.532954, 1.3802, -1.459003, 1, 0.372549, 0, 1,
-1.531981, 0.6544383, -0.8455542, 1, 0.3764706, 0, 1,
-1.528987, -0.2580431, -2.532726, 1, 0.3843137, 0, 1,
-1.520373, -0.8842019, -1.852665, 1, 0.3882353, 0, 1,
-1.516777, -0.9887048, -1.904213, 1, 0.3960784, 0, 1,
-1.513779, 0.7503445, -0.1056313, 1, 0.4039216, 0, 1,
-1.504099, -0.4936312, -1.938313, 1, 0.4078431, 0, 1,
-1.502981, 0.640269, -0.693561, 1, 0.4156863, 0, 1,
-1.496655, 1.24237, -2.018338, 1, 0.4196078, 0, 1,
-1.492893, -0.418882, -2.564092, 1, 0.427451, 0, 1,
-1.489023, 0.1954278, 0.1312512, 1, 0.4313726, 0, 1,
-1.488612, -0.3436113, -3.353924, 1, 0.4392157, 0, 1,
-1.487176, -0.06704534, -1.885589, 1, 0.4431373, 0, 1,
-1.485421, -0.7134754, -1.481228, 1, 0.4509804, 0, 1,
-1.484281, -0.6910158, -1.19802, 1, 0.454902, 0, 1,
-1.482333, 2.251582, 2.32909, 1, 0.4627451, 0, 1,
-1.480941, 0.3332849, -3.112194, 1, 0.4666667, 0, 1,
-1.479269, -0.7895617, -2.828886, 1, 0.4745098, 0, 1,
-1.469051, -0.02706331, -3.442362, 1, 0.4784314, 0, 1,
-1.468016, -0.7949143, -0.01322594, 1, 0.4862745, 0, 1,
-1.466058, -1.450937, -2.32555, 1, 0.4901961, 0, 1,
-1.450934, -0.150248, -2.352472, 1, 0.4980392, 0, 1,
-1.449738, -0.3064499, -1.65266, 1, 0.5058824, 0, 1,
-1.440018, -0.04028413, -0.4592967, 1, 0.509804, 0, 1,
-1.436837, -0.0744848, 0.2144261, 1, 0.5176471, 0, 1,
-1.422623, 2.069905, 0.7036659, 1, 0.5215687, 0, 1,
-1.415416, 1.850425, -2.669357, 1, 0.5294118, 0, 1,
-1.396179, -0.05174185, -0.9088743, 1, 0.5333334, 0, 1,
-1.383052, -1.289335, -3.216642, 1, 0.5411765, 0, 1,
-1.371329, 0.9422858, -0.767755, 1, 0.5450981, 0, 1,
-1.361303, -0.913865, -3.370958, 1, 0.5529412, 0, 1,
-1.359499, -1.291085, -3.206369, 1, 0.5568628, 0, 1,
-1.350011, -0.9870355, -2.716423, 1, 0.5647059, 0, 1,
-1.345926, -2.236151, -2.162725, 1, 0.5686275, 0, 1,
-1.337248, -0.04192725, -0.6575314, 1, 0.5764706, 0, 1,
-1.335834, 0.6936022, -1.775122, 1, 0.5803922, 0, 1,
-1.332791, -1.244067, -3.418134, 1, 0.5882353, 0, 1,
-1.326129, 0.3578406, -1.588429, 1, 0.5921569, 0, 1,
-1.32361, -0.9214314, -1.585322, 1, 0.6, 0, 1,
-1.316946, 1.504875, -1.28227, 1, 0.6078432, 0, 1,
-1.316335, -0.04051763, -0.4971368, 1, 0.6117647, 0, 1,
-1.29948, 0.9863812, -1.005873, 1, 0.6196079, 0, 1,
-1.299278, -0.4504185, -3.088961, 1, 0.6235294, 0, 1,
-1.29221, 1.139065, -2.484689, 1, 0.6313726, 0, 1,
-1.291875, 1.336165, -0.956721, 1, 0.6352941, 0, 1,
-1.287762, -0.1443586, -0.1245265, 1, 0.6431373, 0, 1,
-1.287111, -1.013192, -2.576064, 1, 0.6470588, 0, 1,
-1.275745, 0.1640861, -0.7402384, 1, 0.654902, 0, 1,
-1.271515, 0.7825529, -0.4320061, 1, 0.6588235, 0, 1,
-1.2714, -0.9629207, 0.7181944, 1, 0.6666667, 0, 1,
-1.267647, -0.09233392, -2.584369, 1, 0.6705883, 0, 1,
-1.263576, 0.7759065, -0.5758025, 1, 0.6784314, 0, 1,
-1.25837, 1.263969, 0.4977306, 1, 0.682353, 0, 1,
-1.249075, -1.092356, -3.091418, 1, 0.6901961, 0, 1,
-1.247018, 0.8035924, 0.6120376, 1, 0.6941177, 0, 1,
-1.234226, -0.7158223, -0.5899246, 1, 0.7019608, 0, 1,
-1.23421, 0.2826602, -2.696502, 1, 0.7098039, 0, 1,
-1.22068, -0.2039188, -2.200748, 1, 0.7137255, 0, 1,
-1.210677, -1.117129, -2.988521, 1, 0.7215686, 0, 1,
-1.189384, -0.4907466, -2.112016, 1, 0.7254902, 0, 1,
-1.184554, -0.9458792, -2.468814, 1, 0.7333333, 0, 1,
-1.1821, 0.2218176, -1.19191, 1, 0.7372549, 0, 1,
-1.181893, 0.6322492, -1.175326, 1, 0.7450981, 0, 1,
-1.181411, -0.624197, -1.50705, 1, 0.7490196, 0, 1,
-1.177185, -1.767365, -2.612854, 1, 0.7568628, 0, 1,
-1.171042, -0.2835068, -1.771759, 1, 0.7607843, 0, 1,
-1.167149, 1.537673, -0.2408644, 1, 0.7686275, 0, 1,
-1.164778, -0.3798841, -1.674543, 1, 0.772549, 0, 1,
-1.156324, 0.9077989, -1.984046, 1, 0.7803922, 0, 1,
-1.146243, -0.5630254, -1.243549, 1, 0.7843137, 0, 1,
-1.139018, 0.5257977, -1.149228, 1, 0.7921569, 0, 1,
-1.138711, 0.335855, -0.6885213, 1, 0.7960784, 0, 1,
-1.135698, 0.2920108, -2.179974, 1, 0.8039216, 0, 1,
-1.123931, -0.3085863, -1.14362, 1, 0.8117647, 0, 1,
-1.123618, 0.9248899, -0.5109637, 1, 0.8156863, 0, 1,
-1.11862, 1.159281, -1.021062, 1, 0.8235294, 0, 1,
-1.101662, -0.1473242, -2.262432, 1, 0.827451, 0, 1,
-1.101155, -1.418341, -3.516399, 1, 0.8352941, 0, 1,
-1.098735, 0.5066299, 0.698603, 1, 0.8392157, 0, 1,
-1.096868, -0.671698, -3.446636, 1, 0.8470588, 0, 1,
-1.09037, 0.663476, -2.303086, 1, 0.8509804, 0, 1,
-1.087341, 1.010584, -1.247428, 1, 0.8588235, 0, 1,
-1.076356, 0.3488699, -0.09179876, 1, 0.8627451, 0, 1,
-1.063674, -0.7795331, -1.611962, 1, 0.8705882, 0, 1,
-1.060356, 0.2944901, -0.4063996, 1, 0.8745098, 0, 1,
-1.053312, 0.4113441, 0.0862317, 1, 0.8823529, 0, 1,
-1.053225, 0.7095106, -0.4094906, 1, 0.8862745, 0, 1,
-1.047518, -0.4031477, -1.250455, 1, 0.8941177, 0, 1,
-1.042876, -1.581189, -3.620267, 1, 0.8980392, 0, 1,
-1.036288, -0.5058956, -2.592807, 1, 0.9058824, 0, 1,
-1.034153, -0.3736217, -3.202768, 1, 0.9137255, 0, 1,
-1.023205, -0.4206238, -3.404315, 1, 0.9176471, 0, 1,
-0.9940322, 1.90953, -0.4913191, 1, 0.9254902, 0, 1,
-0.9869169, -1.557241, -1.266788, 1, 0.9294118, 0, 1,
-0.985691, 1.19221, 0.4625951, 1, 0.9372549, 0, 1,
-0.9836832, 0.1919465, -2.04461, 1, 0.9411765, 0, 1,
-0.9771917, 2.343771, -0.5127849, 1, 0.9490196, 0, 1,
-0.9702051, -0.3703647, -3.285271, 1, 0.9529412, 0, 1,
-0.9630828, -1.736757, -2.002513, 1, 0.9607843, 0, 1,
-0.960576, 0.4693439, 0.4959532, 1, 0.9647059, 0, 1,
-0.9560579, -1.072148, -0.5172141, 1, 0.972549, 0, 1,
-0.9541863, 0.5136943, -0.3359024, 1, 0.9764706, 0, 1,
-0.952836, -0.3295552, -2.076398, 1, 0.9843137, 0, 1,
-0.9436164, 0.5359616, -0.9746181, 1, 0.9882353, 0, 1,
-0.9428145, 0.7192466, -0.2764047, 1, 0.9960784, 0, 1,
-0.9346144, -0.8691112, -1.424049, 0.9960784, 1, 0, 1,
-0.933583, -0.898702, -1.991443, 0.9921569, 1, 0, 1,
-0.9228134, -1.06914, -2.216534, 0.9843137, 1, 0, 1,
-0.9190799, -2.505714, -2.96622, 0.9803922, 1, 0, 1,
-0.9188745, 1.804849, 1.478018, 0.972549, 1, 0, 1,
-0.9121779, 0.5898991, -0.08477861, 0.9686275, 1, 0, 1,
-0.9093707, 1.256651, -0.02780922, 0.9607843, 1, 0, 1,
-0.9070086, 0.03448317, -2.015728, 0.9568627, 1, 0, 1,
-0.9053864, -1.393081, -0.6184948, 0.9490196, 1, 0, 1,
-0.8829064, 0.1540033, -1.681387, 0.945098, 1, 0, 1,
-0.8771002, 0.3476625, -1.921653, 0.9372549, 1, 0, 1,
-0.8757536, 0.1922961, -2.070389, 0.9333333, 1, 0, 1,
-0.8756152, -0.03661571, -0.8668817, 0.9254902, 1, 0, 1,
-0.8676136, 1.41259, 0.3857927, 0.9215686, 1, 0, 1,
-0.8663722, 0.1229219, -1.792011, 0.9137255, 1, 0, 1,
-0.8648652, 0.07098226, -2.911309, 0.9098039, 1, 0, 1,
-0.8638473, -0.7193285, -2.276482, 0.9019608, 1, 0, 1,
-0.8615832, 0.03527207, -2.111554, 0.8941177, 1, 0, 1,
-0.8610342, -0.7068103, -1.034897, 0.8901961, 1, 0, 1,
-0.857479, 0.485574, -2.774359, 0.8823529, 1, 0, 1,
-0.8569601, 0.5547939, -0.07836712, 0.8784314, 1, 0, 1,
-0.8569229, 0.2068242, -1.168717, 0.8705882, 1, 0, 1,
-0.8517231, -0.4999834, -3.074912, 0.8666667, 1, 0, 1,
-0.8453743, 0.09864937, -1.262409, 0.8588235, 1, 0, 1,
-0.8435946, -1.072196, -3.687719, 0.854902, 1, 0, 1,
-0.8433332, 0.3678293, -1.080651, 0.8470588, 1, 0, 1,
-0.8419333, -0.03730863, -1.75964, 0.8431373, 1, 0, 1,
-0.8299051, -0.8865393, -3.685139, 0.8352941, 1, 0, 1,
-0.8296229, 0.7048684, 0.08869069, 0.8313726, 1, 0, 1,
-0.8249882, 0.6484854, -0.9758833, 0.8235294, 1, 0, 1,
-0.8229861, 0.2686662, 0.115112, 0.8196079, 1, 0, 1,
-0.8170782, -0.6007504, -2.734089, 0.8117647, 1, 0, 1,
-0.8111175, 0.569612, -1.714855, 0.8078431, 1, 0, 1,
-0.8031393, -0.3224939, -3.219706, 0.8, 1, 0, 1,
-0.800741, -0.5548606, -3.450799, 0.7921569, 1, 0, 1,
-0.7960372, 0.1601877, -1.149548, 0.7882353, 1, 0, 1,
-0.7939385, -1.546567, -0.8609568, 0.7803922, 1, 0, 1,
-0.7825842, -1.419339, -4.209975, 0.7764706, 1, 0, 1,
-0.7734867, -1.26341, -0.3153214, 0.7686275, 1, 0, 1,
-0.7732553, -1.039515, -2.58426, 0.7647059, 1, 0, 1,
-0.7709929, -0.8209621, -3.115231, 0.7568628, 1, 0, 1,
-0.7668198, -0.5627595, -3.38918, 0.7529412, 1, 0, 1,
-0.7663187, 0.1088238, -0.2581743, 0.7450981, 1, 0, 1,
-0.763111, -1.197872, -3.438017, 0.7411765, 1, 0, 1,
-0.7619629, -1.304837, -3.975294, 0.7333333, 1, 0, 1,
-0.7611575, 0.2765656, -0.378737, 0.7294118, 1, 0, 1,
-0.7602072, -0.4764659, -1.934178, 0.7215686, 1, 0, 1,
-0.760092, 1.79199, 1.403908, 0.7176471, 1, 0, 1,
-0.7592082, 0.656181, 0.01213198, 0.7098039, 1, 0, 1,
-0.7494087, 0.02513216, -1.691037, 0.7058824, 1, 0, 1,
-0.7431348, 0.5997385, -1.889617, 0.6980392, 1, 0, 1,
-0.7392752, 1.169175, 1.091351, 0.6901961, 1, 0, 1,
-0.7385141, -0.001177288, -0.995315, 0.6862745, 1, 0, 1,
-0.7368106, 0.6498326, -0.254673, 0.6784314, 1, 0, 1,
-0.7348284, 0.1612581, -1.34011, 0.6745098, 1, 0, 1,
-0.7335327, -0.2499621, -2.668744, 0.6666667, 1, 0, 1,
-0.7269191, -0.6802327, -2.428833, 0.6627451, 1, 0, 1,
-0.7243873, 0.8342325, -1.11631, 0.654902, 1, 0, 1,
-0.7231432, -0.04613066, -2.406399, 0.6509804, 1, 0, 1,
-0.7221375, -2.338048, -0.9942933, 0.6431373, 1, 0, 1,
-0.7220762, 0.4887128, -0.3908935, 0.6392157, 1, 0, 1,
-0.7217448, -0.8762923, -1.775438, 0.6313726, 1, 0, 1,
-0.7101666, -2.397851, -2.991885, 0.627451, 1, 0, 1,
-0.7084376, -0.5147446, -2.210053, 0.6196079, 1, 0, 1,
-0.7055508, -1.214658, -2.540408, 0.6156863, 1, 0, 1,
-0.7015399, 0.4506592, -0.9309375, 0.6078432, 1, 0, 1,
-0.6978375, -1.291223, -2.14408, 0.6039216, 1, 0, 1,
-0.6970754, -0.6993214, -2.753045, 0.5960785, 1, 0, 1,
-0.6956327, 0.7760639, -0.7620101, 0.5882353, 1, 0, 1,
-0.6936554, -0.5172541, -2.304616, 0.5843138, 1, 0, 1,
-0.6928502, -3.167219, -5.683886, 0.5764706, 1, 0, 1,
-0.6854434, -0.03481801, -1.605722, 0.572549, 1, 0, 1,
-0.6804892, -0.6942838, -1.683652, 0.5647059, 1, 0, 1,
-0.6804813, 0.2387478, -1.816102, 0.5607843, 1, 0, 1,
-0.6798514, 1.145889, 1.686908, 0.5529412, 1, 0, 1,
-0.6776652, 0.3458388, -0.784586, 0.5490196, 1, 0, 1,
-0.6753951, 2.284783, -1.329764, 0.5411765, 1, 0, 1,
-0.6726183, -0.08079547, -1.918721, 0.5372549, 1, 0, 1,
-0.6715772, 2.543124, -0.7777752, 0.5294118, 1, 0, 1,
-0.6679276, -1.397897, -3.972396, 0.5254902, 1, 0, 1,
-0.6675088, 0.6047251, -1.696475, 0.5176471, 1, 0, 1,
-0.6628801, -0.8431129, -1.584278, 0.5137255, 1, 0, 1,
-0.6616561, 0.3237903, -1.043287, 0.5058824, 1, 0, 1,
-0.6606482, -0.7569744, -3.118356, 0.5019608, 1, 0, 1,
-0.6526266, 0.355773, -0.211566, 0.4941176, 1, 0, 1,
-0.6390198, 1.008625, -0.303607, 0.4862745, 1, 0, 1,
-0.6299767, -0.8212788, -2.311726, 0.4823529, 1, 0, 1,
-0.6285979, -0.7640489, -4.033962, 0.4745098, 1, 0, 1,
-0.6284716, 0.4723502, -1.16324, 0.4705882, 1, 0, 1,
-0.628062, -0.09466474, -0.7948986, 0.4627451, 1, 0, 1,
-0.6273738, -0.8967415, -3.914825, 0.4588235, 1, 0, 1,
-0.6271952, -1.527692, -1.354012, 0.4509804, 1, 0, 1,
-0.6240237, 1.096363, -1.398117, 0.4470588, 1, 0, 1,
-0.623686, 0.9312846, 0.6123655, 0.4392157, 1, 0, 1,
-0.6230046, -0.6945153, -3.33014, 0.4352941, 1, 0, 1,
-0.6211185, 0.9935355, -0.3757294, 0.427451, 1, 0, 1,
-0.6172699, 1.517065, 0.6483659, 0.4235294, 1, 0, 1,
-0.6163782, -0.1417893, -2.703008, 0.4156863, 1, 0, 1,
-0.6162083, 0.01247632, -2.411778, 0.4117647, 1, 0, 1,
-0.6140463, 0.2839584, -1.427218, 0.4039216, 1, 0, 1,
-0.6124339, 1.578459, 0.3876274, 0.3960784, 1, 0, 1,
-0.6105453, 1.252467, -1.280755, 0.3921569, 1, 0, 1,
-0.6081835, -1.904802, -3.224749, 0.3843137, 1, 0, 1,
-0.606704, 0.03291875, -1.287297, 0.3803922, 1, 0, 1,
-0.6055982, 0.4934268, -1.150721, 0.372549, 1, 0, 1,
-0.6053042, 1.313848, -0.7662779, 0.3686275, 1, 0, 1,
-0.6000602, -0.2053741, -2.651441, 0.3607843, 1, 0, 1,
-0.5989304, 0.9071, -0.7750259, 0.3568628, 1, 0, 1,
-0.5984964, -0.7180964, -3.479706, 0.3490196, 1, 0, 1,
-0.5969213, 0.5323262, -1.454365, 0.345098, 1, 0, 1,
-0.5958421, 0.03461841, -3.000566, 0.3372549, 1, 0, 1,
-0.5943193, -0.2176663, -0.333694, 0.3333333, 1, 0, 1,
-0.5880595, 0.04286976, -1.680497, 0.3254902, 1, 0, 1,
-0.5878328, 1.443114, -0.4483053, 0.3215686, 1, 0, 1,
-0.5841938, -0.1079622, -0.4383711, 0.3137255, 1, 0, 1,
-0.5829355, -0.3286217, -2.384263, 0.3098039, 1, 0, 1,
-0.5815055, -0.8292853, -2.52437, 0.3019608, 1, 0, 1,
-0.5802441, -1.617449, -2.196631, 0.2941177, 1, 0, 1,
-0.5799994, -0.9890812, -2.928706, 0.2901961, 1, 0, 1,
-0.5795326, 0.7486529, 1.089086, 0.282353, 1, 0, 1,
-0.5748619, 0.06341022, 0.6169006, 0.2784314, 1, 0, 1,
-0.5505137, -0.3574009, -3.631926, 0.2705882, 1, 0, 1,
-0.5477951, -0.6042517, -2.472391, 0.2666667, 1, 0, 1,
-0.5465728, -1.101495, -0.9077435, 0.2588235, 1, 0, 1,
-0.5438715, -0.6203768, -2.299, 0.254902, 1, 0, 1,
-0.5428863, -0.6014424, -0.9817824, 0.2470588, 1, 0, 1,
-0.5411345, 0.7413843, 0.5259008, 0.2431373, 1, 0, 1,
-0.5362477, -0.5390283, -2.2953, 0.2352941, 1, 0, 1,
-0.5360885, 0.339029, -2.144531, 0.2313726, 1, 0, 1,
-0.5294426, 1.391666, 0.2747338, 0.2235294, 1, 0, 1,
-0.5259012, 2.292927, 0.07882231, 0.2196078, 1, 0, 1,
-0.5207546, 0.09682817, -0.6978769, 0.2117647, 1, 0, 1,
-0.5187163, 0.01007204, -1.174972, 0.2078431, 1, 0, 1,
-0.5182864, -0.2807403, -3.098911, 0.2, 1, 0, 1,
-0.5174116, 0.2028551, -1.846822, 0.1921569, 1, 0, 1,
-0.5157856, 0.06795858, -2.867412, 0.1882353, 1, 0, 1,
-0.5146332, -0.6963058, -2.907231, 0.1803922, 1, 0, 1,
-0.5142632, 0.9398799, 1.304919, 0.1764706, 1, 0, 1,
-0.5131108, -1.66998, -1.411452, 0.1686275, 1, 0, 1,
-0.5079596, 0.5632669, 0.0874934, 0.1647059, 1, 0, 1,
-0.5052788, 0.7866291, 0.838842, 0.1568628, 1, 0, 1,
-0.5000637, -2.245358, -1.820969, 0.1529412, 1, 0, 1,
-0.4977252, -1.364225, -1.285465, 0.145098, 1, 0, 1,
-0.4908488, 0.4367053, -1.599305, 0.1411765, 1, 0, 1,
-0.4877278, -1.408747, -5.536597, 0.1333333, 1, 0, 1,
-0.4874674, 0.1963589, -2.682452, 0.1294118, 1, 0, 1,
-0.4859826, -0.5636784, -1.660545, 0.1215686, 1, 0, 1,
-0.4845054, -1.145944, -3.153029, 0.1176471, 1, 0, 1,
-0.4814969, 0.1036747, -3.026517, 0.1098039, 1, 0, 1,
-0.481473, 0.5207721, -1.368945, 0.1058824, 1, 0, 1,
-0.4776645, -0.1530945, -1.376998, 0.09803922, 1, 0, 1,
-0.4741842, -0.5841745, -1.425569, 0.09019608, 1, 0, 1,
-0.4739923, -0.8564639, -1.987127, 0.08627451, 1, 0, 1,
-0.4699113, 0.2740121, 0.1497141, 0.07843138, 1, 0, 1,
-0.4687592, 1.00184, -1.229997, 0.07450981, 1, 0, 1,
-0.4666783, 0.6620138, 0.1382618, 0.06666667, 1, 0, 1,
-0.4641386, -0.2284691, -3.218427, 0.0627451, 1, 0, 1,
-0.4601342, 0.408306, -1.45719, 0.05490196, 1, 0, 1,
-0.4593205, -0.5090672, -2.350923, 0.05098039, 1, 0, 1,
-0.4571773, 0.7171991, -0.8999031, 0.04313726, 1, 0, 1,
-0.4542568, -0.2570612, -1.845076, 0.03921569, 1, 0, 1,
-0.4518712, 0.4278312, 0.5155458, 0.03137255, 1, 0, 1,
-0.4492092, -0.8860108, -3.061261, 0.02745098, 1, 0, 1,
-0.4479191, 0.01835331, -3.083958, 0.01960784, 1, 0, 1,
-0.4458257, 0.08849461, -1.073836, 0.01568628, 1, 0, 1,
-0.4412301, 0.5583776, 0.1468465, 0.007843138, 1, 0, 1,
-0.4407816, 1.488891, 1.197672, 0.003921569, 1, 0, 1,
-0.4393268, -1.50164, -2.566333, 0, 1, 0.003921569, 1,
-0.4379369, -0.1179639, -0.9560343, 0, 1, 0.01176471, 1,
-0.4323966, 0.4461739, -0.337497, 0, 1, 0.01568628, 1,
-0.4273626, 0.6358418, -1.871029, 0, 1, 0.02352941, 1,
-0.4261866, -1.27483, -3.717266, 0, 1, 0.02745098, 1,
-0.4258756, -2.466997, -4.097575, 0, 1, 0.03529412, 1,
-0.4254069, -1.098826, -3.348304, 0, 1, 0.03921569, 1,
-0.424673, 0.9032393, -1.429171, 0, 1, 0.04705882, 1,
-0.4207588, 0.7465296, 0.4654587, 0, 1, 0.05098039, 1,
-0.4164623, -2.67979, -2.756276, 0, 1, 0.05882353, 1,
-0.4126047, -0.5819701, -1.434493, 0, 1, 0.0627451, 1,
-0.4122728, 1.648031, -1.013135, 0, 1, 0.07058824, 1,
-0.410186, -1.663073, -2.761337, 0, 1, 0.07450981, 1,
-0.4061162, 0.07205041, -2.191054, 0, 1, 0.08235294, 1,
-0.4054743, 0.9658474, 0.3641978, 0, 1, 0.08627451, 1,
-0.3979094, -1.860754, -3.249859, 0, 1, 0.09411765, 1,
-0.3978342, 1.175811, 0.6720961, 0, 1, 0.1019608, 1,
-0.397767, -2.013079, -2.713653, 0, 1, 0.1058824, 1,
-0.3959472, 0.2414906, -2.223101, 0, 1, 0.1137255, 1,
-0.3940647, -0.07026, -1.28633, 0, 1, 0.1176471, 1,
-0.3910643, -0.1665297, -3.298617, 0, 1, 0.1254902, 1,
-0.3909634, -0.2668351, -4.49123, 0, 1, 0.1294118, 1,
-0.3900163, 1.323654, 2.411821, 0, 1, 0.1372549, 1,
-0.3858652, -0.05603666, -1.105935, 0, 1, 0.1411765, 1,
-0.3833449, -0.3378893, -2.992279, 0, 1, 0.1490196, 1,
-0.3832819, 0.7253602, -0.7608227, 0, 1, 0.1529412, 1,
-0.3786065, 1.571016, 1.137682, 0, 1, 0.1607843, 1,
-0.3785051, 0.4160509, -0.3980405, 0, 1, 0.1647059, 1,
-0.3767259, -0.4946578, -3.028585, 0, 1, 0.172549, 1,
-0.3757322, 0.0791972, -0.4242751, 0, 1, 0.1764706, 1,
-0.3716668, -0.7113675, -2.932422, 0, 1, 0.1843137, 1,
-0.367266, 0.1587051, -0.6119198, 0, 1, 0.1882353, 1,
-0.3650825, 0.7564124, -1.044675, 0, 1, 0.1960784, 1,
-0.3528786, 0.8097513, 2.106317, 0, 1, 0.2039216, 1,
-0.3523979, -0.3180719, -3.487159, 0, 1, 0.2078431, 1,
-0.3512221, 0.4422879, -0.6730687, 0, 1, 0.2156863, 1,
-0.3473154, -0.01731156, -3.523026, 0, 1, 0.2196078, 1,
-0.3451061, -0.3372108, -2.390322, 0, 1, 0.227451, 1,
-0.344809, 1.507097, -0.6750839, 0, 1, 0.2313726, 1,
-0.3426002, -0.5764193, -1.796911, 0, 1, 0.2392157, 1,
-0.3420849, -0.7535534, -3.177169, 0, 1, 0.2431373, 1,
-0.341755, 0.7097694, 0.04114377, 0, 1, 0.2509804, 1,
-0.3410978, 0.9151521, -0.7694435, 0, 1, 0.254902, 1,
-0.3376686, -1.651629, -2.532682, 0, 1, 0.2627451, 1,
-0.3373915, 0.5808846, -1.163684, 0, 1, 0.2666667, 1,
-0.3356271, -1.835049, -3.920985, 0, 1, 0.2745098, 1,
-0.3338724, 1.267117, -0.2292753, 0, 1, 0.2784314, 1,
-0.3310362, -0.8139733, -3.621526, 0, 1, 0.2862745, 1,
-0.3282582, -0.6315311, -2.387087, 0, 1, 0.2901961, 1,
-0.3264451, -3.240666, -2.451893, 0, 1, 0.2980392, 1,
-0.3253982, 0.139627, -2.712276, 0, 1, 0.3058824, 1,
-0.3238755, 1.111612, 0.9186997, 0, 1, 0.3098039, 1,
-0.3213093, -1.199287, -4.016096, 0, 1, 0.3176471, 1,
-0.3198564, -0.1732102, -2.010556, 0, 1, 0.3215686, 1,
-0.3170999, 1.240906, -0.01063447, 0, 1, 0.3294118, 1,
-0.3118519, 0.2437124, -1.452056, 0, 1, 0.3333333, 1,
-0.301831, -1.463427, -1.703626, 0, 1, 0.3411765, 1,
-0.2982245, 0.4921235, -1.320523, 0, 1, 0.345098, 1,
-0.295085, -1.864039, -2.490427, 0, 1, 0.3529412, 1,
-0.293298, 0.8332154, -0.1646097, 0, 1, 0.3568628, 1,
-0.290769, -0.7932841, -0.9205421, 0, 1, 0.3647059, 1,
-0.2882096, 1.519137, -0.1959548, 0, 1, 0.3686275, 1,
-0.2872968, 1.857217, -1.255973, 0, 1, 0.3764706, 1,
-0.2847793, -0.02658744, -1.976904, 0, 1, 0.3803922, 1,
-0.2839932, 0.2597907, -1.372409, 0, 1, 0.3882353, 1,
-0.2809735, -0.8843138, -2.987025, 0, 1, 0.3921569, 1,
-0.2805496, -0.02302585, -2.541453, 0, 1, 0.4, 1,
-0.27978, 0.4408999, -2.760794, 0, 1, 0.4078431, 1,
-0.2758768, 0.727961, -1.032473, 0, 1, 0.4117647, 1,
-0.2721756, 0.7941651, 0.9102134, 0, 1, 0.4196078, 1,
-0.2720592, -1.006487, -2.215152, 0, 1, 0.4235294, 1,
-0.2699675, -0.136016, -1.718355, 0, 1, 0.4313726, 1,
-0.2694256, 0.4402985, -0.1579179, 0, 1, 0.4352941, 1,
-0.265047, -1.29432, -2.672838, 0, 1, 0.4431373, 1,
-0.2646805, 0.5960601, -0.1724464, 0, 1, 0.4470588, 1,
-0.2641721, -0.2361139, -1.787251, 0, 1, 0.454902, 1,
-0.2570457, 0.6862697, 0.4563144, 0, 1, 0.4588235, 1,
-0.2569617, 0.1026294, -1.458889, 0, 1, 0.4666667, 1,
-0.2517378, 0.2883736, -1.479864, 0, 1, 0.4705882, 1,
-0.2495704, 0.4939761, -0.07524745, 0, 1, 0.4784314, 1,
-0.2437003, -0.6405675, -3.303535, 0, 1, 0.4823529, 1,
-0.241096, -1.53219, -1.551497, 0, 1, 0.4901961, 1,
-0.2384185, -0.1255534, -1.681168, 0, 1, 0.4941176, 1,
-0.2369827, -0.2666054, -2.029969, 0, 1, 0.5019608, 1,
-0.2348887, 0.8528699, 0.2210612, 0, 1, 0.509804, 1,
-0.2323717, -0.3918832, -1.125648, 0, 1, 0.5137255, 1,
-0.2251898, 0.3155546, -2.354203, 0, 1, 0.5215687, 1,
-0.2243755, 0.5691085, -0.7667487, 0, 1, 0.5254902, 1,
-0.2215688, 1.209019, -0.09180322, 0, 1, 0.5333334, 1,
-0.2190719, -0.3197869, -3.540728, 0, 1, 0.5372549, 1,
-0.2143946, 0.9100451, -0.7942617, 0, 1, 0.5450981, 1,
-0.2101149, -1.630461, -2.531696, 0, 1, 0.5490196, 1,
-0.2094686, 1.077781, 0.1004093, 0, 1, 0.5568628, 1,
-0.2090745, 0.1421712, -1.237236, 0, 1, 0.5607843, 1,
-0.2032879, 1.069608, -0.3975368, 0, 1, 0.5686275, 1,
-0.2002464, 0.5961521, 0.007677231, 0, 1, 0.572549, 1,
-0.1954476, -2.471013, -2.638767, 0, 1, 0.5803922, 1,
-0.195299, 0.2221273, -0.003116361, 0, 1, 0.5843138, 1,
-0.1941922, 1.52614, -2.343375, 0, 1, 0.5921569, 1,
-0.1937805, -0.5882115, -3.294153, 0, 1, 0.5960785, 1,
-0.193225, 0.3804333, -1.111553, 0, 1, 0.6039216, 1,
-0.1828639, 1.160215, 0.3652641, 0, 1, 0.6117647, 1,
-0.1778676, -1.001544, -3.035892, 0, 1, 0.6156863, 1,
-0.1741562, -1.2443, -4.164218, 0, 1, 0.6235294, 1,
-0.1717937, -0.2194799, -4.178961, 0, 1, 0.627451, 1,
-0.1715208, 1.325688, -1.449996, 0, 1, 0.6352941, 1,
-0.1705481, 0.4919964, -0.4884869, 0, 1, 0.6392157, 1,
-0.1671858, -0.3188591, -3.910286, 0, 1, 0.6470588, 1,
-0.1640408, 0.4699534, -0.9429996, 0, 1, 0.6509804, 1,
-0.1640053, -0.3391538, -3.486475, 0, 1, 0.6588235, 1,
-0.1530675, 0.1416298, -1.580948, 0, 1, 0.6627451, 1,
-0.147935, 0.2244975, -1.079764, 0, 1, 0.6705883, 1,
-0.1431855, -0.5724946, -0.5367901, 0, 1, 0.6745098, 1,
-0.1431587, -0.6934226, -1.063835, 0, 1, 0.682353, 1,
-0.1422681, 0.4849818, 0.07006508, 0, 1, 0.6862745, 1,
-0.1410187, 1.372113, 1.947261, 0, 1, 0.6941177, 1,
-0.1370068, 2.148331, -2.383549, 0, 1, 0.7019608, 1,
-0.133795, -0.6264637, -3.551581, 0, 1, 0.7058824, 1,
-0.1324915, -0.7938887, -2.912812, 0, 1, 0.7137255, 1,
-0.1299889, -0.06072732, -2.04304, 0, 1, 0.7176471, 1,
-0.1289847, -0.9754891, -2.462551, 0, 1, 0.7254902, 1,
-0.1288083, 0.1215281, 0.2772696, 0, 1, 0.7294118, 1,
-0.1269767, -0.3660011, -1.174981, 0, 1, 0.7372549, 1,
-0.1264467, 0.3201243, 0.8993446, 0, 1, 0.7411765, 1,
-0.1242519, 0.3144498, 1.319842, 0, 1, 0.7490196, 1,
-0.1204856, 0.2261049, 0.5632424, 0, 1, 0.7529412, 1,
-0.1169785, -0.08210106, -2.099574, 0, 1, 0.7607843, 1,
-0.1098825, 0.9587935, 1.073712, 0, 1, 0.7647059, 1,
-0.1014815, 0.6931199, 0.0524781, 0, 1, 0.772549, 1,
-0.1012881, 0.04373873, -1.008812, 0, 1, 0.7764706, 1,
-0.0987356, -0.6615753, -2.637168, 0, 1, 0.7843137, 1,
-0.08909717, 0.560724, 0.255718, 0, 1, 0.7882353, 1,
-0.08853244, -0.1128591, -3.046734, 0, 1, 0.7960784, 1,
-0.08643115, -1.115353, -1.136173, 0, 1, 0.8039216, 1,
-0.08103544, 1.10516, -0.9465747, 0, 1, 0.8078431, 1,
-0.07830311, -1.434648, -1.820953, 0, 1, 0.8156863, 1,
-0.07409122, -1.904484, -2.833224, 0, 1, 0.8196079, 1,
-0.0721326, -0.7107105, -3.646301, 0, 1, 0.827451, 1,
-0.06702105, -2.329964, -2.622641, 0, 1, 0.8313726, 1,
-0.06657033, -0.6031138, -3.725729, 0, 1, 0.8392157, 1,
-0.06320334, 1.524794, 0.5074407, 0, 1, 0.8431373, 1,
-0.06314319, 0.1099048, 0.04331295, 0, 1, 0.8509804, 1,
-0.06119358, 0.5743052, -1.766608, 0, 1, 0.854902, 1,
-0.06115239, 0.7996579, -0.04734386, 0, 1, 0.8627451, 1,
-0.0596632, -0.70966, -2.674333, 0, 1, 0.8666667, 1,
-0.05771715, 0.9395264, -0.2700933, 0, 1, 0.8745098, 1,
-0.05609498, -0.2444665, -4.566053, 0, 1, 0.8784314, 1,
-0.05577217, 0.6644918, 1.6462, 0, 1, 0.8862745, 1,
-0.05568583, -0.7869343, -2.445251, 0, 1, 0.8901961, 1,
-0.05362023, -1.866936, -2.698869, 0, 1, 0.8980392, 1,
-0.05124828, 0.08674669, -1.821409, 0, 1, 0.9058824, 1,
-0.04805411, -1.186924, -1.916961, 0, 1, 0.9098039, 1,
-0.04801786, -0.3598492, -2.217179, 0, 1, 0.9176471, 1,
-0.04714175, -1.063061, -3.022024, 0, 1, 0.9215686, 1,
-0.0466059, 0.8920453, -0.3815714, 0, 1, 0.9294118, 1,
-0.04581269, 0.1238825, -0.3299471, 0, 1, 0.9333333, 1,
-0.04129736, 1.079102, 0.5942453, 0, 1, 0.9411765, 1,
-0.03726113, 0.6141796, 0.7878256, 0, 1, 0.945098, 1,
-0.03666493, -0.03731542, -2.706264, 0, 1, 0.9529412, 1,
-0.03497291, -0.9688094, -2.533965, 0, 1, 0.9568627, 1,
-0.02950889, 0.3092262, 0.8370683, 0, 1, 0.9647059, 1,
-0.02910732, -0.07250507, -3.971795, 0, 1, 0.9686275, 1,
-0.02892198, 0.3402559, -1.179165, 0, 1, 0.9764706, 1,
-0.02447062, 0.214137, 1.541177, 0, 1, 0.9803922, 1,
-0.01965114, 1.502474, -0.4073012, 0, 1, 0.9882353, 1,
-0.01848811, -0.1401754, -2.684375, 0, 1, 0.9921569, 1,
-0.0182043, 0.1959857, 0.5271561, 0, 1, 1, 1,
-0.01744446, -0.2814002, -2.39655, 0, 0.9921569, 1, 1,
-0.01701175, 0.5282191, -0.4523486, 0, 0.9882353, 1, 1,
-0.01492991, 0.765038, 0.4957907, 0, 0.9803922, 1, 1,
-0.01483019, -1.436936, -3.948554, 0, 0.9764706, 1, 1,
-0.01156602, -0.2269703, -3.000598, 0, 0.9686275, 1, 1,
-0.01135534, 0.4963884, -0.5542247, 0, 0.9647059, 1, 1,
-0.01121079, -1.503063, -2.803424, 0, 0.9568627, 1, 1,
-0.00615014, 0.3425761, -0.6375164, 0, 0.9529412, 1, 1,
-0.005635392, -0.8575421, -3.838371, 0, 0.945098, 1, 1,
-0.004631415, -1.591966, -3.655463, 0, 0.9411765, 1, 1,
-0.003874758, -0.1338671, -4.190753, 0, 0.9333333, 1, 1,
0.005691794, 0.7729912, 2.337106, 0, 0.9294118, 1, 1,
0.00592547, -1.211994, 3.494788, 0, 0.9215686, 1, 1,
0.008836304, 0.170948, -1.388027, 0, 0.9176471, 1, 1,
0.01296873, -1.029909, 4.646629, 0, 0.9098039, 1, 1,
0.0131485, 0.9527146, -0.9353443, 0, 0.9058824, 1, 1,
0.0134363, -0.6516826, 3.670536, 0, 0.8980392, 1, 1,
0.0187916, 0.1185606, -0.8925486, 0, 0.8901961, 1, 1,
0.02288535, -0.1608027, 0.5534856, 0, 0.8862745, 1, 1,
0.02392224, 1.095296, -1.81008, 0, 0.8784314, 1, 1,
0.02801464, -0.7368019, 3.182986, 0, 0.8745098, 1, 1,
0.02971024, -1.709218, 2.848296, 0, 0.8666667, 1, 1,
0.03234464, -1.308532, 4.615616, 0, 0.8627451, 1, 1,
0.03673181, 1.62557, -0.5557978, 0, 0.854902, 1, 1,
0.03793103, 0.3312547, 0.2525043, 0, 0.8509804, 1, 1,
0.04310017, -1.697185, 1.717405, 0, 0.8431373, 1, 1,
0.04870041, -0.8476833, 2.285365, 0, 0.8392157, 1, 1,
0.05028189, -0.16764, 2.238022, 0, 0.8313726, 1, 1,
0.05052404, -0.3488784, 1.413199, 0, 0.827451, 1, 1,
0.05202385, -1.33658, 1.253723, 0, 0.8196079, 1, 1,
0.05400654, -0.6581367, 1.901691, 0, 0.8156863, 1, 1,
0.05704563, -0.1600285, 2.972309, 0, 0.8078431, 1, 1,
0.06863535, 0.8995444, -0.2593295, 0, 0.8039216, 1, 1,
0.06965169, -1.390124, 3.146977, 0, 0.7960784, 1, 1,
0.07496836, -0.02192454, 2.395954, 0, 0.7882353, 1, 1,
0.07496845, 1.543199, 1.047017, 0, 0.7843137, 1, 1,
0.07658856, 1.599157, -0.7033301, 0, 0.7764706, 1, 1,
0.07907495, 0.1717581, 1.670846, 0, 0.772549, 1, 1,
0.08346645, 0.01552863, 1.93981, 0, 0.7647059, 1, 1,
0.08955675, 0.0254163, 1.612575, 0, 0.7607843, 1, 1,
0.09074675, -0.4095703, 3.314905, 0, 0.7529412, 1, 1,
0.09409867, 0.320994, -0.932412, 0, 0.7490196, 1, 1,
0.09450044, -0.01249672, 2.595643, 0, 0.7411765, 1, 1,
0.09594303, 1.263997, -0.7546999, 0, 0.7372549, 1, 1,
0.09620345, 1.06783, 1.512012, 0, 0.7294118, 1, 1,
0.09664642, -1.563284, 3.802904, 0, 0.7254902, 1, 1,
0.09836534, 0.0324946, 0.5202846, 0, 0.7176471, 1, 1,
0.100084, -0.5295216, 0.9812246, 0, 0.7137255, 1, 1,
0.10288, -0.4296268, 5.224885, 0, 0.7058824, 1, 1,
0.1056581, 0.5829477, 0.7566672, 0, 0.6980392, 1, 1,
0.1083152, 0.5580223, -0.6012406, 0, 0.6941177, 1, 1,
0.1127339, -0.6782621, 4.039526, 0, 0.6862745, 1, 1,
0.1211571, 0.02000337, 0.4655474, 0, 0.682353, 1, 1,
0.1234616, -0.8340459, 4.564398, 0, 0.6745098, 1, 1,
0.1320498, 2.083692, 0.1839556, 0, 0.6705883, 1, 1,
0.1346224, 0.2674748, 1.200816, 0, 0.6627451, 1, 1,
0.1364769, 0.8250872, 0.1955818, 0, 0.6588235, 1, 1,
0.1448602, -0.3152535, 2.425097, 0, 0.6509804, 1, 1,
0.1451033, -0.510474, 2.504058, 0, 0.6470588, 1, 1,
0.1454741, -0.4732941, 2.628765, 0, 0.6392157, 1, 1,
0.1460027, 1.739251, 1.641322, 0, 0.6352941, 1, 1,
0.1476887, 0.07041897, 1.050593, 0, 0.627451, 1, 1,
0.1538285, -0.4663933, 3.010679, 0, 0.6235294, 1, 1,
0.1590752, -0.9214072, 2.236998, 0, 0.6156863, 1, 1,
0.1626534, 0.4590579, 1.31978, 0, 0.6117647, 1, 1,
0.1659681, 1.191464, -0.06456649, 0, 0.6039216, 1, 1,
0.1690687, 0.7355713, -0.4528421, 0, 0.5960785, 1, 1,
0.1724439, 0.6846658, 1.646315, 0, 0.5921569, 1, 1,
0.1730843, -0.2771206, 1.79868, 0, 0.5843138, 1, 1,
0.1786994, 1.317962, -0.7969211, 0, 0.5803922, 1, 1,
0.1789811, -0.03518497, 1.31483, 0, 0.572549, 1, 1,
0.1831055, -1.235674, 2.780099, 0, 0.5686275, 1, 1,
0.1832207, -0.1757879, 3.181508, 0, 0.5607843, 1, 1,
0.1852879, 0.1374024, -0.1542996, 0, 0.5568628, 1, 1,
0.1868385, 0.3766324, 0.693827, 0, 0.5490196, 1, 1,
0.1871496, -0.4148213, 2.723932, 0, 0.5450981, 1, 1,
0.1875863, -1.020266, 2.927904, 0, 0.5372549, 1, 1,
0.1964538, -0.3874289, 1.204924, 0, 0.5333334, 1, 1,
0.2018612, 0.5105315, 0.2423526, 0, 0.5254902, 1, 1,
0.2022114, -0.2245124, 2.31594, 0, 0.5215687, 1, 1,
0.207559, -0.1874983, 2.334929, 0, 0.5137255, 1, 1,
0.2154651, -1.430223, 3.632771, 0, 0.509804, 1, 1,
0.215536, 1.237551, 0.5771694, 0, 0.5019608, 1, 1,
0.2163925, 1.054786, -0.5176665, 0, 0.4941176, 1, 1,
0.2196808, -0.4369777, 4.331945, 0, 0.4901961, 1, 1,
0.23149, -0.569737, 2.254129, 0, 0.4823529, 1, 1,
0.2327556, -1.847865, 3.771569, 0, 0.4784314, 1, 1,
0.2334583, -1.63677, 4.211302, 0, 0.4705882, 1, 1,
0.2353575, 0.7808583, 1.170696, 0, 0.4666667, 1, 1,
0.2367363, -0.9134785, 3.409651, 0, 0.4588235, 1, 1,
0.2375358, -0.3158399, 2.592986, 0, 0.454902, 1, 1,
0.2395962, -0.3183837, 0.5842067, 0, 0.4470588, 1, 1,
0.2427399, 0.2084221, 1.628192, 0, 0.4431373, 1, 1,
0.2449412, 1.29192, -0.09690777, 0, 0.4352941, 1, 1,
0.2460457, 0.4967539, 0.8263614, 0, 0.4313726, 1, 1,
0.2490051, -2.307273, 3.049931, 0, 0.4235294, 1, 1,
0.2495497, -1.48167, 4.110602, 0, 0.4196078, 1, 1,
0.2525833, 1.368983, -0.2382498, 0, 0.4117647, 1, 1,
0.2547647, -0.1154663, -0.176442, 0, 0.4078431, 1, 1,
0.2597948, 1.034647, -1.634643, 0, 0.4, 1, 1,
0.2605401, -1.543506, 4.011469, 0, 0.3921569, 1, 1,
0.2634421, -1.082824, 1.998538, 0, 0.3882353, 1, 1,
0.2657619, -0.8838766, 3.396742, 0, 0.3803922, 1, 1,
0.2667624, -2.057186, 3.753006, 0, 0.3764706, 1, 1,
0.2670559, -0.2163333, 3.33788, 0, 0.3686275, 1, 1,
0.2681793, -2.132318, 1.297588, 0, 0.3647059, 1, 1,
0.2683352, -1.444154, 1.56213, 0, 0.3568628, 1, 1,
0.2687178, -0.6130051, 3.568819, 0, 0.3529412, 1, 1,
0.2713678, 0.1955955, -0.6875443, 0, 0.345098, 1, 1,
0.2740042, 0.9253652, -0.1481765, 0, 0.3411765, 1, 1,
0.2755235, -0.6770954, 2.661852, 0, 0.3333333, 1, 1,
0.2861098, 1.070405, -2.244258, 0, 0.3294118, 1, 1,
0.2866444, -0.5250477, 4.139595, 0, 0.3215686, 1, 1,
0.2869002, -0.5399495, 3.261271, 0, 0.3176471, 1, 1,
0.2879052, -1.118334, 3.328292, 0, 0.3098039, 1, 1,
0.2882056, 1.062065, -0.2954529, 0, 0.3058824, 1, 1,
0.2954163, -0.7751503, 1.177457, 0, 0.2980392, 1, 1,
0.2973671, 0.1701489, 1.589881, 0, 0.2901961, 1, 1,
0.3023478, -0.06265371, 0.5688477, 0, 0.2862745, 1, 1,
0.3053781, -2.649686, 3.992574, 0, 0.2784314, 1, 1,
0.3083332, 0.5190316, 1.476423, 0, 0.2745098, 1, 1,
0.3114823, 0.4286589, 2.771748, 0, 0.2666667, 1, 1,
0.3160603, 0.6352532, 1.368707, 0, 0.2627451, 1, 1,
0.3162793, 0.7162167, -0.1581701, 0, 0.254902, 1, 1,
0.3165632, 0.2144161, 0.3125992, 0, 0.2509804, 1, 1,
0.3169213, 0.6226302, -0.5763107, 0, 0.2431373, 1, 1,
0.320093, -1.012348, 1.997299, 0, 0.2392157, 1, 1,
0.3230872, -0.3996952, 2.121928, 0, 0.2313726, 1, 1,
0.3256822, -0.05783667, 0.4277018, 0, 0.227451, 1, 1,
0.3275352, -0.04088315, 2.569046, 0, 0.2196078, 1, 1,
0.3283269, -0.7595683, 2.240171, 0, 0.2156863, 1, 1,
0.3330705, -1.454909, 3.67649, 0, 0.2078431, 1, 1,
0.3350832, 1.054665, 0.8195594, 0, 0.2039216, 1, 1,
0.3353932, -1.3801, 2.253468, 0, 0.1960784, 1, 1,
0.3362378, 0.1585371, 0.9687404, 0, 0.1882353, 1, 1,
0.3362674, -0.7538632, 3.208923, 0, 0.1843137, 1, 1,
0.3385345, 1.078998, -1.339551, 0, 0.1764706, 1, 1,
0.3457375, 0.1675538, 0.6817517, 0, 0.172549, 1, 1,
0.3475981, 0.7597988, 1.177428, 0, 0.1647059, 1, 1,
0.3477668, -0.825145, 3.10648, 0, 0.1607843, 1, 1,
0.3487144, 0.1573944, 2.065993, 0, 0.1529412, 1, 1,
0.3501523, -0.1515943, 3.018852, 0, 0.1490196, 1, 1,
0.3506706, -0.6458249, 4.882219, 0, 0.1411765, 1, 1,
0.351936, -1.962207, 1.428791, 0, 0.1372549, 1, 1,
0.3542407, -0.6902124, 3.146261, 0, 0.1294118, 1, 1,
0.3588589, -0.3315093, 5.331627, 0, 0.1254902, 1, 1,
0.3604523, -0.6362578, 3.165872, 0, 0.1176471, 1, 1,
0.3623759, -0.3573218, 2.353021, 0, 0.1137255, 1, 1,
0.3629169, 1.312718, -1.736195, 0, 0.1058824, 1, 1,
0.3645905, 1.177218, -0.02308365, 0, 0.09803922, 1, 1,
0.36986, 0.1451523, 1.22213, 0, 0.09411765, 1, 1,
0.3702459, -3.070088, 3.28168, 0, 0.08627451, 1, 1,
0.3734286, -0.2008815, 1.428265, 0, 0.08235294, 1, 1,
0.3736842, 0.6284736, 0.5043893, 0, 0.07450981, 1, 1,
0.3737494, 1.723552, -0.6254169, 0, 0.07058824, 1, 1,
0.3781392, -0.04826523, 1.791642, 0, 0.0627451, 1, 1,
0.3789506, -0.1244085, 0.02177181, 0, 0.05882353, 1, 1,
0.3790353, 0.1515437, 2.197771, 0, 0.05098039, 1, 1,
0.3819389, -0.1038592, 1.777319, 0, 0.04705882, 1, 1,
0.3849778, -0.871044, 4.598214, 0, 0.03921569, 1, 1,
0.3856916, 1.359064, 0.7615948, 0, 0.03529412, 1, 1,
0.390817, 1.457268, 0.04238966, 0, 0.02745098, 1, 1,
0.391882, -0.4292924, 1.769722, 0, 0.02352941, 1, 1,
0.3937893, -0.4614072, 2.006027, 0, 0.01568628, 1, 1,
0.4001182, 0.05656883, 1.616331, 0, 0.01176471, 1, 1,
0.4008701, 0.3865913, 1.997218, 0, 0.003921569, 1, 1,
0.4025487, -0.9716867, 2.508952, 0.003921569, 0, 1, 1,
0.4033281, -0.6784629, 4.257055, 0.007843138, 0, 1, 1,
0.412072, -0.5257843, 3.515358, 0.01568628, 0, 1, 1,
0.4130471, 2.609386, -0.86685, 0.01960784, 0, 1, 1,
0.4185082, -1.280083, 1.866261, 0.02745098, 0, 1, 1,
0.4199551, -1.892605, 4.64904, 0.03137255, 0, 1, 1,
0.4200569, 0.4674945, 1.06458, 0.03921569, 0, 1, 1,
0.4234245, 0.1734425, 0.3509478, 0.04313726, 0, 1, 1,
0.4265252, -0.2187219, 0.8767817, 0.05098039, 0, 1, 1,
0.426929, -1.743572, 1.918871, 0.05490196, 0, 1, 1,
0.432056, -0.5970951, 1.778757, 0.0627451, 0, 1, 1,
0.4408573, 0.6838803, -0.1985616, 0.06666667, 0, 1, 1,
0.4450247, -0.06282522, 1.425235, 0.07450981, 0, 1, 1,
0.4487815, -0.5169557, 2.549, 0.07843138, 0, 1, 1,
0.4503333, 0.3546935, 1.489693, 0.08627451, 0, 1, 1,
0.4516981, -0.9919453, 2.127452, 0.09019608, 0, 1, 1,
0.4554972, 1.512951, -0.7932869, 0.09803922, 0, 1, 1,
0.4637293, 0.6139265, 0.2627124, 0.1058824, 0, 1, 1,
0.4649308, 1.216521, 1.698657, 0.1098039, 0, 1, 1,
0.4669243, -0.117823, 1.355101, 0.1176471, 0, 1, 1,
0.4670506, -0.8317165, 1.115334, 0.1215686, 0, 1, 1,
0.4674644, 1.125048, 0.5012898, 0.1294118, 0, 1, 1,
0.4729104, -0.9034736, 2.70314, 0.1333333, 0, 1, 1,
0.4751007, 0.6385978, 0.1569479, 0.1411765, 0, 1, 1,
0.4786251, -0.8024596, 2.381781, 0.145098, 0, 1, 1,
0.4836864, 1.41475, 0.6080682, 0.1529412, 0, 1, 1,
0.4901906, 0.517006, -0.3160308, 0.1568628, 0, 1, 1,
0.4926998, -1.822656, 3.526677, 0.1647059, 0, 1, 1,
0.4932702, -0.3662039, 2.111757, 0.1686275, 0, 1, 1,
0.4945872, -0.3982907, 2.380535, 0.1764706, 0, 1, 1,
0.4948478, -0.5970115, 0.7295781, 0.1803922, 0, 1, 1,
0.4959184, 0.1240776, 0.4182829, 0.1882353, 0, 1, 1,
0.4962018, -0.7865629, 4.69164, 0.1921569, 0, 1, 1,
0.4963683, 1.810916, 0.08885913, 0.2, 0, 1, 1,
0.4976668, -0.9250371, 2.255356, 0.2078431, 0, 1, 1,
0.4997765, -0.5388837, 1.610057, 0.2117647, 0, 1, 1,
0.5000045, -0.2350589, 1.819534, 0.2196078, 0, 1, 1,
0.5019165, 0.03411116, 0.2157983, 0.2235294, 0, 1, 1,
0.5058741, 0.3211952, 1.040573, 0.2313726, 0, 1, 1,
0.5061293, 1.149108, 0.4368484, 0.2352941, 0, 1, 1,
0.5079718, 1.72621, 1.95511, 0.2431373, 0, 1, 1,
0.5122824, -0.1273089, 2.486799, 0.2470588, 0, 1, 1,
0.514012, -1.560279, 3.890381, 0.254902, 0, 1, 1,
0.5151931, 0.1219197, 2.830423, 0.2588235, 0, 1, 1,
0.5152404, 0.02025597, 1.025444, 0.2666667, 0, 1, 1,
0.519608, 0.2389513, -0.2178266, 0.2705882, 0, 1, 1,
0.522986, 1.771948, 0.04274906, 0.2784314, 0, 1, 1,
0.5295086, -0.2367099, 2.752813, 0.282353, 0, 1, 1,
0.5310009, 0.1775867, 1.234554, 0.2901961, 0, 1, 1,
0.5310287, -0.1685169, 1.634753, 0.2941177, 0, 1, 1,
0.5314752, -0.6670551, 3.566314, 0.3019608, 0, 1, 1,
0.5341656, 1.061336, 2.550549, 0.3098039, 0, 1, 1,
0.5409429, -0.1301127, 2.918701, 0.3137255, 0, 1, 1,
0.545309, 0.8969165, -0.7982971, 0.3215686, 0, 1, 1,
0.547981, -0.5085981, 1.211858, 0.3254902, 0, 1, 1,
0.5507481, 1.003725, -1.606926, 0.3333333, 0, 1, 1,
0.5514994, 0.3515435, 4.166729, 0.3372549, 0, 1, 1,
0.5528167, 0.9476402, 1.535938, 0.345098, 0, 1, 1,
0.558928, -0.952085, 3.648152, 0.3490196, 0, 1, 1,
0.5639298, -0.1178021, 1.515592, 0.3568628, 0, 1, 1,
0.5651723, -1.80367, 3.481274, 0.3607843, 0, 1, 1,
0.5692413, 0.1577939, 2.309511, 0.3686275, 0, 1, 1,
0.5763106, 0.4333093, 1.815071, 0.372549, 0, 1, 1,
0.5788625, -1.500052, 2.48019, 0.3803922, 0, 1, 1,
0.5791451, 0.7037744, 1.766251, 0.3843137, 0, 1, 1,
0.5863696, 0.3662251, 1.362915, 0.3921569, 0, 1, 1,
0.5979326, 0.6281949, 2.658916, 0.3960784, 0, 1, 1,
0.5981537, -1.203723, 3.737086, 0.4039216, 0, 1, 1,
0.6004161, 1.117649, 1.921576, 0.4117647, 0, 1, 1,
0.6027556, -0.2752744, 3.339734, 0.4156863, 0, 1, 1,
0.6036207, -0.04221366, -1.206061, 0.4235294, 0, 1, 1,
0.6039515, -0.4611067, 3.027682, 0.427451, 0, 1, 1,
0.6039734, -0.6246751, 3.432113, 0.4352941, 0, 1, 1,
0.6045262, -0.9465578, 3.91571, 0.4392157, 0, 1, 1,
0.6125341, 0.9231789, -0.3438293, 0.4470588, 0, 1, 1,
0.6157573, -0.1179258, 2.975079, 0.4509804, 0, 1, 1,
0.6210558, -1.138654, 2.613876, 0.4588235, 0, 1, 1,
0.621056, -1.363551, 1.966134, 0.4627451, 0, 1, 1,
0.6222175, -0.3699845, 2.103308, 0.4705882, 0, 1, 1,
0.6255832, 1.541718, 0.01938967, 0.4745098, 0, 1, 1,
0.6284984, 2.310048, -0.8716149, 0.4823529, 0, 1, 1,
0.6311978, -1.916011, 3.912539, 0.4862745, 0, 1, 1,
0.6333297, 1.235181, 1.296337, 0.4941176, 0, 1, 1,
0.6350698, 1.155587, 1.27736, 0.5019608, 0, 1, 1,
0.6354959, -0.1931878, 2.270941, 0.5058824, 0, 1, 1,
0.6364371, 0.2271319, -0.06795945, 0.5137255, 0, 1, 1,
0.6493282, 0.5453805, 0.935924, 0.5176471, 0, 1, 1,
0.6495914, -1.326197, 2.628992, 0.5254902, 0, 1, 1,
0.6529792, -0.5262191, 2.257676, 0.5294118, 0, 1, 1,
0.6535078, -0.8681936, 1.517118, 0.5372549, 0, 1, 1,
0.6560793, 0.9140452, 0.8410918, 0.5411765, 0, 1, 1,
0.6618462, 1.182463, -0.1078054, 0.5490196, 0, 1, 1,
0.6670719, 0.4244059, 1.849982, 0.5529412, 0, 1, 1,
0.6749141, -0.7476489, 4.967478, 0.5607843, 0, 1, 1,
0.6763411, -0.4750473, 2.936985, 0.5647059, 0, 1, 1,
0.6778411, 0.2563098, 1.099636, 0.572549, 0, 1, 1,
0.6840519, -0.7758904, 3.876171, 0.5764706, 0, 1, 1,
0.6844859, -0.3110567, 1.287461, 0.5843138, 0, 1, 1,
0.6864052, -0.09287752, 3.364899, 0.5882353, 0, 1, 1,
0.6868011, -0.7832487, 3.444587, 0.5960785, 0, 1, 1,
0.6892028, -1.143234, 2.245872, 0.6039216, 0, 1, 1,
0.6917838, -0.767647, 2.695574, 0.6078432, 0, 1, 1,
0.6928273, 1.236616, 1.751614, 0.6156863, 0, 1, 1,
0.696289, -0.03295167, 2.660148, 0.6196079, 0, 1, 1,
0.7028019, 0.2627484, -0.05595261, 0.627451, 0, 1, 1,
0.7056271, 0.898576, 0.6550564, 0.6313726, 0, 1, 1,
0.7061507, 0.04822416, 0.8690356, 0.6392157, 0, 1, 1,
0.7101574, -1.623369, 3.956623, 0.6431373, 0, 1, 1,
0.7137285, -0.1505138, 0.8341187, 0.6509804, 0, 1, 1,
0.7144317, 2.293143, 2.338107, 0.654902, 0, 1, 1,
0.7144434, 0.9157221, -0.6251403, 0.6627451, 0, 1, 1,
0.7215921, 0.3829993, 2.166954, 0.6666667, 0, 1, 1,
0.7239737, -0.5501271, 3.175204, 0.6745098, 0, 1, 1,
0.7270728, 1.602461, 1.691776, 0.6784314, 0, 1, 1,
0.7299119, -0.1961052, 2.700424, 0.6862745, 0, 1, 1,
0.7313192, 0.2302379, 0.8785997, 0.6901961, 0, 1, 1,
0.7319741, -0.704456, 3.042424, 0.6980392, 0, 1, 1,
0.7356566, -0.4330207, 3.262844, 0.7058824, 0, 1, 1,
0.7397742, 0.3999246, 1.420041, 0.7098039, 0, 1, 1,
0.742498, -0.2518636, 2.664986, 0.7176471, 0, 1, 1,
0.7437676, 0.9284066, 1.131397, 0.7215686, 0, 1, 1,
0.7455145, -0.8622059, 3.403901, 0.7294118, 0, 1, 1,
0.7461469, 0.797758, 1.58451, 0.7333333, 0, 1, 1,
0.7496399, -0.8567876, 0.5659739, 0.7411765, 0, 1, 1,
0.7620811, 0.5843288, 1.282289, 0.7450981, 0, 1, 1,
0.7713063, 0.02494401, 1.097057, 0.7529412, 0, 1, 1,
0.7725486, 0.2896107, 1.959342, 0.7568628, 0, 1, 1,
0.7774145, -0.2542385, 2.444967, 0.7647059, 0, 1, 1,
0.7774734, -0.207317, 1.540777, 0.7686275, 0, 1, 1,
0.778806, 0.4116994, 0.5372614, 0.7764706, 0, 1, 1,
0.7806883, 0.1941157, 1.316995, 0.7803922, 0, 1, 1,
0.7816545, -0.1583397, 2.279974, 0.7882353, 0, 1, 1,
0.7861931, 0.2964204, 0.7989469, 0.7921569, 0, 1, 1,
0.7874843, -1.13509, 3.568016, 0.8, 0, 1, 1,
0.7893916, 0.9174824, 0.3838041, 0.8078431, 0, 1, 1,
0.7910898, -0.3630639, 2.87569, 0.8117647, 0, 1, 1,
0.7941608, 1.845493, 0.8471769, 0.8196079, 0, 1, 1,
0.8041435, 1.684898, 1.546529, 0.8235294, 0, 1, 1,
0.8055915, 0.307456, 0.5676101, 0.8313726, 0, 1, 1,
0.8106402, 1.130421, 0.08579624, 0.8352941, 0, 1, 1,
0.8228074, -0.7921419, 1.897392, 0.8431373, 0, 1, 1,
0.8248398, 2.036944, 1.111812, 0.8470588, 0, 1, 1,
0.8249139, -0.4004253, -0.2386677, 0.854902, 0, 1, 1,
0.8354064, 1.472583, 0.3761607, 0.8588235, 0, 1, 1,
0.8464016, -0.651823, 3.090485, 0.8666667, 0, 1, 1,
0.8554614, -1.08598, 1.589586, 0.8705882, 0, 1, 1,
0.8599129, -0.2008985, 3.411294, 0.8784314, 0, 1, 1,
0.864669, 1.926811, 0.3773535, 0.8823529, 0, 1, 1,
0.8665661, 0.04052196, 1.795435, 0.8901961, 0, 1, 1,
0.8729896, 1.859784, -1.985634, 0.8941177, 0, 1, 1,
0.8745433, -0.2817951, 0.8349468, 0.9019608, 0, 1, 1,
0.8766338, -1.332312, 4.325563, 0.9098039, 0, 1, 1,
0.8881045, -0.269174, 1.402307, 0.9137255, 0, 1, 1,
0.8883209, 0.1599498, 2.531364, 0.9215686, 0, 1, 1,
0.9004056, -1.325305, 2.932517, 0.9254902, 0, 1, 1,
0.9092659, -0.09627877, 1.591792, 0.9333333, 0, 1, 1,
0.9127228, 0.8522419, -0.5234115, 0.9372549, 0, 1, 1,
0.9163595, 0.08855239, 1.474134, 0.945098, 0, 1, 1,
0.9192085, -0.9963333, 1.08123, 0.9490196, 0, 1, 1,
0.9195914, -0.8257728, 1.281165, 0.9568627, 0, 1, 1,
0.9218863, -1.805587, 4.671663, 0.9607843, 0, 1, 1,
0.9241365, 1.588285, -0.9822409, 0.9686275, 0, 1, 1,
0.9275485, 1.182211, -0.1688449, 0.972549, 0, 1, 1,
0.9281129, 0.8063334, 0.5922353, 0.9803922, 0, 1, 1,
0.9360456, 0.2145139, 1.79103, 0.9843137, 0, 1, 1,
0.9376203, 0.8791735, -0.2242252, 0.9921569, 0, 1, 1,
0.944734, 1.020834, 2.104476, 0.9960784, 0, 1, 1,
0.9511789, 1.344444, 1.429609, 1, 0, 0.9960784, 1,
0.951368, 1.349002, 1.006322, 1, 0, 0.9882353, 1,
0.9638331, -1.761217, 3.438624, 1, 0, 0.9843137, 1,
0.9682965, 0.4109974, 1.638333, 1, 0, 0.9764706, 1,
0.9725055, -0.8177905, 2.779318, 1, 0, 0.972549, 1,
0.9747018, 1.416389, 0.8802022, 1, 0, 0.9647059, 1,
0.9752007, -0.5557711, 3.928344, 1, 0, 0.9607843, 1,
0.9789214, 0.6602608, 0.751866, 1, 0, 0.9529412, 1,
0.9816791, -1.177904, 2.482621, 1, 0, 0.9490196, 1,
0.9859127, 1.654721, 1.227039, 1, 0, 0.9411765, 1,
0.9882796, -0.2492315, 1.071246, 1, 0, 0.9372549, 1,
0.9954017, 0.8800238, 0.7575797, 1, 0, 0.9294118, 1,
1.001104, 0.4132196, 3.455028, 1, 0, 0.9254902, 1,
1.019825, -2.140197, 2.638333, 1, 0, 0.9176471, 1,
1.021718, 0.9359077, 0.2317147, 1, 0, 0.9137255, 1,
1.032644, 0.0775604, 1.535141, 1, 0, 0.9058824, 1,
1.034187, 1.420133, -0.4479991, 1, 0, 0.9019608, 1,
1.034293, 0.4598176, 0.901467, 1, 0, 0.8941177, 1,
1.038473, -1.541892, 1.635598, 1, 0, 0.8862745, 1,
1.043913, 2.233354, 0.421405, 1, 0, 0.8823529, 1,
1.047544, -0.5134293, 2.691042, 1, 0, 0.8745098, 1,
1.051195, 0.4968196, 0.9701585, 1, 0, 0.8705882, 1,
1.058905, 0.1714917, 0.5168042, 1, 0, 0.8627451, 1,
1.059223, -0.6614066, 2.936442, 1, 0, 0.8588235, 1,
1.07696, -1.66919, 2.595279, 1, 0, 0.8509804, 1,
1.080435, 1.79228, -0.5950667, 1, 0, 0.8470588, 1,
1.082096, -1.100737, 1.931314, 1, 0, 0.8392157, 1,
1.08578, 0.8968188, 2.378553, 1, 0, 0.8352941, 1,
1.085829, -0.7438884, 1.052058, 1, 0, 0.827451, 1,
1.088449, -0.446162, 1.91193, 1, 0, 0.8235294, 1,
1.089666, 0.07157011, 2.018298, 1, 0, 0.8156863, 1,
1.099471, -0.05597412, 1.422856, 1, 0, 0.8117647, 1,
1.099967, -0.4859336, 2.913588, 1, 0, 0.8039216, 1,
1.107021, -1.227115, 2.944327, 1, 0, 0.7960784, 1,
1.11327, 0.4561182, 0.9286553, 1, 0, 0.7921569, 1,
1.119691, -0.2625275, 0.6938709, 1, 0, 0.7843137, 1,
1.120555, 0.0805983, 0.01639254, 1, 0, 0.7803922, 1,
1.120604, 0.672612, -0.04219994, 1, 0, 0.772549, 1,
1.120925, 3.404268, 0.3615056, 1, 0, 0.7686275, 1,
1.121587, -0.5197687, 1.281463, 1, 0, 0.7607843, 1,
1.131911, -0.437009, 2.632569, 1, 0, 0.7568628, 1,
1.138397, -0.8358451, 4.21626, 1, 0, 0.7490196, 1,
1.153074, -0.8052214, 1.817657, 1, 0, 0.7450981, 1,
1.156085, -1.738229, 2.952373, 1, 0, 0.7372549, 1,
1.160928, 0.3594109, 2.083293, 1, 0, 0.7333333, 1,
1.164267, 0.8498818, 0.8012021, 1, 0, 0.7254902, 1,
1.16464, -0.9218636, 1.974505, 1, 0, 0.7215686, 1,
1.169559, -0.1751657, 0.8448461, 1, 0, 0.7137255, 1,
1.173424, -0.2773151, 2.368555, 1, 0, 0.7098039, 1,
1.178803, -0.9284618, 3.077467, 1, 0, 0.7019608, 1,
1.17935, -0.4871361, 2.876997, 1, 0, 0.6941177, 1,
1.179861, -0.5571519, 2.876315, 1, 0, 0.6901961, 1,
1.183924, 0.4864689, 0.4902682, 1, 0, 0.682353, 1,
1.193733, -0.3054372, 1.485248, 1, 0, 0.6784314, 1,
1.195468, -1.028344, 1.502238, 1, 0, 0.6705883, 1,
1.202544, 2.254435, 2.090872, 1, 0, 0.6666667, 1,
1.206868, 0.3568244, 3.721746, 1, 0, 0.6588235, 1,
1.210093, 0.3015989, 1.868533, 1, 0, 0.654902, 1,
1.218646, -0.7913294, 2.019391, 1, 0, 0.6470588, 1,
1.221627, 0.4918093, 0.3520561, 1, 0, 0.6431373, 1,
1.225661, 0.6004516, 0.6542795, 1, 0, 0.6352941, 1,
1.230699, 0.9358755, 2.696683, 1, 0, 0.6313726, 1,
1.235288, 0.821104, 0.3424885, 1, 0, 0.6235294, 1,
1.238501, 0.4087567, 0.940915, 1, 0, 0.6196079, 1,
1.248324, -1.033926, 1.429376, 1, 0, 0.6117647, 1,
1.255147, 1.089907, 1.823278, 1, 0, 0.6078432, 1,
1.259217, -0.01792268, 3.808399, 1, 0, 0.6, 1,
1.263696, 0.02059596, 2.358931, 1, 0, 0.5921569, 1,
1.278423, 1.145301, 0.3312029, 1, 0, 0.5882353, 1,
1.293688, -1.079401, 4.400868, 1, 0, 0.5803922, 1,
1.295898, 1.52557, 1.15222, 1, 0, 0.5764706, 1,
1.308456, 0.1789835, 1.338052, 1, 0, 0.5686275, 1,
1.309762, -0.3509764, 0.8897755, 1, 0, 0.5647059, 1,
1.322184, 1.140415, 2.362375, 1, 0, 0.5568628, 1,
1.32719, 0.6885228, 0.3344743, 1, 0, 0.5529412, 1,
1.330367, -1.491622, 2.996707, 1, 0, 0.5450981, 1,
1.332803, 1.081298, 2.018602, 1, 0, 0.5411765, 1,
1.339679, -0.4651866, 1.586645, 1, 0, 0.5333334, 1,
1.340876, 0.05864402, 0.7632639, 1, 0, 0.5294118, 1,
1.34655, 0.8064116, 0.9270888, 1, 0, 0.5215687, 1,
1.348044, -0.1432706, 3.136803, 1, 0, 0.5176471, 1,
1.354557, -0.4822478, 1.835685, 1, 0, 0.509804, 1,
1.355374, 1.73707, 1.88523, 1, 0, 0.5058824, 1,
1.367343, 1.617579, -0.3817429, 1, 0, 0.4980392, 1,
1.370667, -0.3125542, 2.930295, 1, 0, 0.4901961, 1,
1.373049, 1.08759, 0.8124102, 1, 0, 0.4862745, 1,
1.382506, -0.4331978, 2.35477, 1, 0, 0.4784314, 1,
1.394074, -0.1040013, 1.160241, 1, 0, 0.4745098, 1,
1.40528, -0.6770096, 1.650725, 1, 0, 0.4666667, 1,
1.411994, -0.1450846, 0.4602174, 1, 0, 0.4627451, 1,
1.415547, -2.007821, 1.620467, 1, 0, 0.454902, 1,
1.431319, 0.4619227, 0.1640971, 1, 0, 0.4509804, 1,
1.431988, 0.4310673, 2.201018, 1, 0, 0.4431373, 1,
1.43215, -0.8074528, 1.08234, 1, 0, 0.4392157, 1,
1.443777, -0.5190257, 2.872587, 1, 0, 0.4313726, 1,
1.449534, 1.158605, 1.674646, 1, 0, 0.427451, 1,
1.452403, 0.5696355, 1.602638, 1, 0, 0.4196078, 1,
1.455781, 0.435722, -0.3299726, 1, 0, 0.4156863, 1,
1.461059, 0.0427544, 3.41627, 1, 0, 0.4078431, 1,
1.476347, 1.494402, 0.6152105, 1, 0, 0.4039216, 1,
1.481165, -0.5414674, 1.102779, 1, 0, 0.3960784, 1,
1.495197, 0.14738, 1.421035, 1, 0, 0.3882353, 1,
1.500455, 1.429801, 1.588295, 1, 0, 0.3843137, 1,
1.504122, -0.8895341, 0.210287, 1, 0, 0.3764706, 1,
1.504423, -0.4925402, 3.135962, 1, 0, 0.372549, 1,
1.518389, 0.8265017, 0.4603541, 1, 0, 0.3647059, 1,
1.521189, 0.6423429, 1.7457, 1, 0, 0.3607843, 1,
1.552188, -0.9971148, 1.725434, 1, 0, 0.3529412, 1,
1.553265, -0.007057345, 1.817658, 1, 0, 0.3490196, 1,
1.554457, -0.006589388, 1.282708, 1, 0, 0.3411765, 1,
1.566772, -1.777219, 1.499763, 1, 0, 0.3372549, 1,
1.576752, -0.4148685, 0.1558498, 1, 0, 0.3294118, 1,
1.57754, -1.822958, 2.683284, 1, 0, 0.3254902, 1,
1.582862, 0.0439287, 3.431937, 1, 0, 0.3176471, 1,
1.584761, -1.568717, 2.653684, 1, 0, 0.3137255, 1,
1.588946, 0.04720532, 2.244781, 1, 0, 0.3058824, 1,
1.595068, -1.231902, 3.618354, 1, 0, 0.2980392, 1,
1.603015, 2.064959, 0.3432352, 1, 0, 0.2941177, 1,
1.605886, -0.821541, 2.823536, 1, 0, 0.2862745, 1,
1.631843, -1.901152, 1.57949, 1, 0, 0.282353, 1,
1.637587, -1.671327, 3.990255, 1, 0, 0.2745098, 1,
1.645822, -0.5133193, 2.632706, 1, 0, 0.2705882, 1,
1.690366, -0.07227637, -1.215977, 1, 0, 0.2627451, 1,
1.692872, 1.274218, 1.074696, 1, 0, 0.2588235, 1,
1.707599, 2.191716, 0.452879, 1, 0, 0.2509804, 1,
1.708076, -0.2135289, 2.652058, 1, 0, 0.2470588, 1,
1.70925, 1.098769, 0.0467686, 1, 0, 0.2392157, 1,
1.724729, -1.299551, 1.486955, 1, 0, 0.2352941, 1,
1.725763, -0.4074841, 0.7100754, 1, 0, 0.227451, 1,
1.735572, 0.2444409, 0.1410634, 1, 0, 0.2235294, 1,
1.74276, -0.5336693, 3.614434, 1, 0, 0.2156863, 1,
1.744918, 0.05278595, 1.159258, 1, 0, 0.2117647, 1,
1.752565, 0.2891631, 0.9929677, 1, 0, 0.2039216, 1,
1.770482, 0.08501683, 0.9626371, 1, 0, 0.1960784, 1,
1.777733, 0.5948679, 3.465141, 1, 0, 0.1921569, 1,
1.778403, 0.1620855, 2.073156, 1, 0, 0.1843137, 1,
1.795101, -1.255223, 1.426182, 1, 0, 0.1803922, 1,
1.797691, -0.7561118, 1.542338, 1, 0, 0.172549, 1,
1.804193, -0.730123, 1.218884, 1, 0, 0.1686275, 1,
1.817779, 0.2208949, 2.161106, 1, 0, 0.1607843, 1,
1.820158, 0.2430997, 1.923105, 1, 0, 0.1568628, 1,
1.845698, 0.8807436, 2.544309, 1, 0, 0.1490196, 1,
1.885408, -1.037736, 3.632516, 1, 0, 0.145098, 1,
1.894005, 1.224559, 0.03199365, 1, 0, 0.1372549, 1,
1.901047, 1.019957, 1.45506, 1, 0, 0.1333333, 1,
1.92199, 0.4959787, 1.06463, 1, 0, 0.1254902, 1,
1.96349, 0.5572386, 1.499528, 1, 0, 0.1215686, 1,
1.979474, 1.420291, 0.450778, 1, 0, 0.1137255, 1,
1.990605, -0.3950447, 0.8482217, 1, 0, 0.1098039, 1,
2.010244, 0.1460161, 1.530381, 1, 0, 0.1019608, 1,
2.02744, 1.349821, 1.37234, 1, 0, 0.09411765, 1,
2.043981, 1.601453, 1.707409, 1, 0, 0.09019608, 1,
2.053547, 0.4962485, 0.8405688, 1, 0, 0.08235294, 1,
2.069828, 0.8622175, 0.1188564, 1, 0, 0.07843138, 1,
2.079789, -0.9957554, 3.469576, 1, 0, 0.07058824, 1,
2.228065, 1.999465, 0.5459929, 1, 0, 0.06666667, 1,
2.232503, -0.93132, 1.509208, 1, 0, 0.05882353, 1,
2.263451, 1.038656, 1.483451, 1, 0, 0.05490196, 1,
2.311792, -0.04282641, 3.165328, 1, 0, 0.04705882, 1,
2.509945, 2.369563, -0.3741042, 1, 0, 0.04313726, 1,
2.531143, -0.4431323, 2.387751, 1, 0, 0.03529412, 1,
2.596447, 0.9263105, 1.938824, 1, 0, 0.03137255, 1,
2.715707, -1.50441, 2.693209, 1, 0, 0.02352941, 1,
2.796996, -0.1559486, 1.140049, 1, 0, 0.01960784, 1,
2.899899, -0.3480608, 2.616896, 1, 0, 0.01176471, 1,
2.95497, 0.2125921, 1.938712, 1, 0, 0.007843138, 1
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
0.02433157, -4.366982, -7.551015, 0, -0.5, 0.5, 0.5,
0.02433157, -4.366982, -7.551015, 1, -0.5, 0.5, 0.5,
0.02433157, -4.366982, -7.551015, 1, 1.5, 0.5, 0.5,
0.02433157, -4.366982, -7.551015, 0, 1.5, 0.5, 0.5
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
-3.899793, 0.08180082, -7.551015, 0, -0.5, 0.5, 0.5,
-3.899793, 0.08180082, -7.551015, 1, -0.5, 0.5, 0.5,
-3.899793, 0.08180082, -7.551015, 1, 1.5, 0.5, 0.5,
-3.899793, 0.08180082, -7.551015, 0, 1.5, 0.5, 0.5
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
-3.899793, -4.366982, -0.1761293, 0, -0.5, 0.5, 0.5,
-3.899793, -4.366982, -0.1761293, 1, -0.5, 0.5, 0.5,
-3.899793, -4.366982, -0.1761293, 1, 1.5, 0.5, 0.5,
-3.899793, -4.366982, -0.1761293, 0, 1.5, 0.5, 0.5
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
-2, -3.34034, -5.849119,
2, -3.34034, -5.849119,
-2, -3.34034, -5.849119,
-2, -3.511447, -6.132768,
-1, -3.34034, -5.849119,
-1, -3.511447, -6.132768,
0, -3.34034, -5.849119,
0, -3.511447, -6.132768,
1, -3.34034, -5.849119,
1, -3.511447, -6.132768,
2, -3.34034, -5.849119,
2, -3.511447, -6.132768
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
-2, -3.853661, -6.700067, 0, -0.5, 0.5, 0.5,
-2, -3.853661, -6.700067, 1, -0.5, 0.5, 0.5,
-2, -3.853661, -6.700067, 1, 1.5, 0.5, 0.5,
-2, -3.853661, -6.700067, 0, 1.5, 0.5, 0.5,
-1, -3.853661, -6.700067, 0, -0.5, 0.5, 0.5,
-1, -3.853661, -6.700067, 1, -0.5, 0.5, 0.5,
-1, -3.853661, -6.700067, 1, 1.5, 0.5, 0.5,
-1, -3.853661, -6.700067, 0, 1.5, 0.5, 0.5,
0, -3.853661, -6.700067, 0, -0.5, 0.5, 0.5,
0, -3.853661, -6.700067, 1, -0.5, 0.5, 0.5,
0, -3.853661, -6.700067, 1, 1.5, 0.5, 0.5,
0, -3.853661, -6.700067, 0, 1.5, 0.5, 0.5,
1, -3.853661, -6.700067, 0, -0.5, 0.5, 0.5,
1, -3.853661, -6.700067, 1, -0.5, 0.5, 0.5,
1, -3.853661, -6.700067, 1, 1.5, 0.5, 0.5,
1, -3.853661, -6.700067, 0, 1.5, 0.5, 0.5,
2, -3.853661, -6.700067, 0, -0.5, 0.5, 0.5,
2, -3.853661, -6.700067, 1, -0.5, 0.5, 0.5,
2, -3.853661, -6.700067, 1, 1.5, 0.5, 0.5,
2, -3.853661, -6.700067, 0, 1.5, 0.5, 0.5
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
-2.994226, -3, -5.849119,
-2.994226, 3, -5.849119,
-2.994226, -3, -5.849119,
-3.145154, -3, -6.132768,
-2.994226, -2, -5.849119,
-3.145154, -2, -6.132768,
-2.994226, -1, -5.849119,
-3.145154, -1, -6.132768,
-2.994226, 0, -5.849119,
-3.145154, 0, -6.132768,
-2.994226, 1, -5.849119,
-3.145154, 1, -6.132768,
-2.994226, 2, -5.849119,
-3.145154, 2, -6.132768,
-2.994226, 3, -5.849119,
-3.145154, 3, -6.132768
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
-3.447009, -3, -6.700067, 0, -0.5, 0.5, 0.5,
-3.447009, -3, -6.700067, 1, -0.5, 0.5, 0.5,
-3.447009, -3, -6.700067, 1, 1.5, 0.5, 0.5,
-3.447009, -3, -6.700067, 0, 1.5, 0.5, 0.5,
-3.447009, -2, -6.700067, 0, -0.5, 0.5, 0.5,
-3.447009, -2, -6.700067, 1, -0.5, 0.5, 0.5,
-3.447009, -2, -6.700067, 1, 1.5, 0.5, 0.5,
-3.447009, -2, -6.700067, 0, 1.5, 0.5, 0.5,
-3.447009, -1, -6.700067, 0, -0.5, 0.5, 0.5,
-3.447009, -1, -6.700067, 1, -0.5, 0.5, 0.5,
-3.447009, -1, -6.700067, 1, 1.5, 0.5, 0.5,
-3.447009, -1, -6.700067, 0, 1.5, 0.5, 0.5,
-3.447009, 0, -6.700067, 0, -0.5, 0.5, 0.5,
-3.447009, 0, -6.700067, 1, -0.5, 0.5, 0.5,
-3.447009, 0, -6.700067, 1, 1.5, 0.5, 0.5,
-3.447009, 0, -6.700067, 0, 1.5, 0.5, 0.5,
-3.447009, 1, -6.700067, 0, -0.5, 0.5, 0.5,
-3.447009, 1, -6.700067, 1, -0.5, 0.5, 0.5,
-3.447009, 1, -6.700067, 1, 1.5, 0.5, 0.5,
-3.447009, 1, -6.700067, 0, 1.5, 0.5, 0.5,
-3.447009, 2, -6.700067, 0, -0.5, 0.5, 0.5,
-3.447009, 2, -6.700067, 1, -0.5, 0.5, 0.5,
-3.447009, 2, -6.700067, 1, 1.5, 0.5, 0.5,
-3.447009, 2, -6.700067, 0, 1.5, 0.5, 0.5,
-3.447009, 3, -6.700067, 0, -0.5, 0.5, 0.5,
-3.447009, 3, -6.700067, 1, -0.5, 0.5, 0.5,
-3.447009, 3, -6.700067, 1, 1.5, 0.5, 0.5,
-3.447009, 3, -6.700067, 0, 1.5, 0.5, 0.5
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
-2.994226, -3.34034, -4,
-2.994226, -3.34034, 4,
-2.994226, -3.34034, -4,
-3.145154, -3.511447, -4,
-2.994226, -3.34034, -2,
-3.145154, -3.511447, -2,
-2.994226, -3.34034, 0,
-3.145154, -3.511447, 0,
-2.994226, -3.34034, 2,
-3.145154, -3.511447, 2,
-2.994226, -3.34034, 4,
-3.145154, -3.511447, 4
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
-3.447009, -3.853661, -4, 0, -0.5, 0.5, 0.5,
-3.447009, -3.853661, -4, 1, -0.5, 0.5, 0.5,
-3.447009, -3.853661, -4, 1, 1.5, 0.5, 0.5,
-3.447009, -3.853661, -4, 0, 1.5, 0.5, 0.5,
-3.447009, -3.853661, -2, 0, -0.5, 0.5, 0.5,
-3.447009, -3.853661, -2, 1, -0.5, 0.5, 0.5,
-3.447009, -3.853661, -2, 1, 1.5, 0.5, 0.5,
-3.447009, -3.853661, -2, 0, 1.5, 0.5, 0.5,
-3.447009, -3.853661, 0, 0, -0.5, 0.5, 0.5,
-3.447009, -3.853661, 0, 1, -0.5, 0.5, 0.5,
-3.447009, -3.853661, 0, 1, 1.5, 0.5, 0.5,
-3.447009, -3.853661, 0, 0, 1.5, 0.5, 0.5,
-3.447009, -3.853661, 2, 0, -0.5, 0.5, 0.5,
-3.447009, -3.853661, 2, 1, -0.5, 0.5, 0.5,
-3.447009, -3.853661, 2, 1, 1.5, 0.5, 0.5,
-3.447009, -3.853661, 2, 0, 1.5, 0.5, 0.5,
-3.447009, -3.853661, 4, 0, -0.5, 0.5, 0.5,
-3.447009, -3.853661, 4, 1, -0.5, 0.5, 0.5,
-3.447009, -3.853661, 4, 1, 1.5, 0.5, 0.5,
-3.447009, -3.853661, 4, 0, 1.5, 0.5, 0.5
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
-2.994226, -3.34034, -5.849119,
-2.994226, 3.503942, -5.849119,
-2.994226, -3.34034, 5.49686,
-2.994226, 3.503942, 5.49686,
-2.994226, -3.34034, -5.849119,
-2.994226, -3.34034, 5.49686,
-2.994226, 3.503942, -5.849119,
-2.994226, 3.503942, 5.49686,
-2.994226, -3.34034, -5.849119,
3.042889, -3.34034, -5.849119,
-2.994226, -3.34034, 5.49686,
3.042889, -3.34034, 5.49686,
-2.994226, 3.503942, -5.849119,
3.042889, 3.503942, -5.849119,
-2.994226, 3.503942, 5.49686,
3.042889, 3.503942, 5.49686,
3.042889, -3.34034, -5.849119,
3.042889, 3.503942, -5.849119,
3.042889, -3.34034, 5.49686,
3.042889, 3.503942, 5.49686,
3.042889, -3.34034, -5.849119,
3.042889, -3.34034, 5.49686,
3.042889, 3.503942, -5.849119,
3.042889, 3.503942, 5.49686
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
var radius = 7.775281;
var distance = 34.5931;
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
mvMatrix.translate( -0.02433157, -0.08180082, 0.1761293 );
mvMatrix.scale( 1.392517, 1.228294, 0.7409486 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.5931);
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
tricalcium_arsenate<-read.table("tricalcium_arsenate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tricalcium_arsenate$V2
```

```
## Error in eval(expr, envir, enclos): object 'tricalcium_arsenate' not found
```

```r
y<-tricalcium_arsenate$V3
```

```
## Error in eval(expr, envir, enclos): object 'tricalcium_arsenate' not found
```

```r
z<-tricalcium_arsenate$V4
```

```
## Error in eval(expr, envir, enclos): object 'tricalcium_arsenate' not found
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
-2.906307, 1.966974, -0.9598312, 0, 0, 1, 1, 1,
-2.804155, 0.8100461, -3.241231, 1, 0, 0, 1, 1,
-2.610196, -0.2055295, -2.628043, 1, 0, 0, 1, 1,
-2.551564, 0.53741, -2.026049, 1, 0, 0, 1, 1,
-2.483885, -0.6499491, -1.054503, 1, 0, 0, 1, 1,
-2.350023, 0.9381554, -2.099139, 1, 0, 0, 1, 1,
-2.346995, -0.3753992, -1.721218, 0, 0, 0, 1, 1,
-2.307619, 0.8781855, -0.09477255, 0, 0, 0, 1, 1,
-2.264309, 1.492197, 0.6273032, 0, 0, 0, 1, 1,
-2.226607, 0.1896975, 0.73107, 0, 0, 0, 1, 1,
-2.211038, -1.982914, -3.710084, 0, 0, 0, 1, 1,
-2.198497, 0.1291133, -1.784354, 0, 0, 0, 1, 1,
-2.162391, 1.226728, -2.610839, 0, 0, 0, 1, 1,
-2.150233, 0.05961003, -1.958015, 1, 1, 1, 1, 1,
-2.118117, -0.9215757, -2.315203, 1, 1, 1, 1, 1,
-2.096716, 0.7035031, -1.271212, 1, 1, 1, 1, 1,
-2.089285, -0.4730662, 0.1278601, 1, 1, 1, 1, 1,
-2.059294, -0.09710933, -3.008878, 1, 1, 1, 1, 1,
-2.056228, -1.969404, -1.424553, 1, 1, 1, 1, 1,
-2.054092, 0.5341004, 1.208528, 1, 1, 1, 1, 1,
-2.032621, -0.5861521, -1.835048, 1, 1, 1, 1, 1,
-2.014727, 0.12191, -1.017168, 1, 1, 1, 1, 1,
-1.994683, -0.3792542, -2.060926, 1, 1, 1, 1, 1,
-1.987303, -0.03084997, -2.524483, 1, 1, 1, 1, 1,
-1.954969, -0.3482037, -0.6044039, 1, 1, 1, 1, 1,
-1.939169, 1.214323, 0.6120967, 1, 1, 1, 1, 1,
-1.927519, 1.163348, 1.711322, 1, 1, 1, 1, 1,
-1.91942, 0.3411298, -0.3509832, 1, 1, 1, 1, 1,
-1.909245, -1.06849, -3.982576, 0, 0, 1, 1, 1,
-1.901188, -0.8516093, -1.604606, 1, 0, 0, 1, 1,
-1.890623, 0.355611, -3.67837, 1, 0, 0, 1, 1,
-1.883288, -2.465942, -3.064833, 1, 0, 0, 1, 1,
-1.867903, 1.985102, -0.6722709, 1, 0, 0, 1, 1,
-1.846037, 0.9485829, -1.765483, 1, 0, 0, 1, 1,
-1.81314, 0.2951131, -0.8451774, 0, 0, 0, 1, 1,
-1.795481, -0.7284504, -3.529642, 0, 0, 0, 1, 1,
-1.794721, 0.7899982, -2.775596, 0, 0, 0, 1, 1,
-1.76938, -1.83788, -2.689626, 0, 0, 0, 1, 1,
-1.767934, -0.5173791, -0.7095463, 0, 0, 0, 1, 1,
-1.76754, -0.03757915, -1.887923, 0, 0, 0, 1, 1,
-1.762019, 0.2728655, -0.3940385, 0, 0, 0, 1, 1,
-1.761358, 1.499152, -1.264326, 1, 1, 1, 1, 1,
-1.76123, -1.005946, -1.833931, 1, 1, 1, 1, 1,
-1.761182, 0.1724131, -0.5020465, 1, 1, 1, 1, 1,
-1.744531, -0.8735138, -2.808447, 1, 1, 1, 1, 1,
-1.737222, -0.9937285, -1.917557, 1, 1, 1, 1, 1,
-1.735929, 0.1541209, 1.435172, 1, 1, 1, 1, 1,
-1.714112, -0.05629174, -0.3881376, 1, 1, 1, 1, 1,
-1.712923, 0.920745, 1.031217, 1, 1, 1, 1, 1,
-1.707404, 0.07627989, 2.88227, 1, 1, 1, 1, 1,
-1.696636, -0.2828159, -2.194692, 1, 1, 1, 1, 1,
-1.669301, -0.5626834, -0.003479045, 1, 1, 1, 1, 1,
-1.652692, -0.1183415, -1.987698, 1, 1, 1, 1, 1,
-1.634881, 1.413201, -0.7800071, 1, 1, 1, 1, 1,
-1.608243, -0.8396751, -2.253309, 1, 1, 1, 1, 1,
-1.596318, 0.638414, -1.661944, 1, 1, 1, 1, 1,
-1.585405, 1.348029, -0.8228698, 0, 0, 1, 1, 1,
-1.584675, -0.3031295, -1.264422, 1, 0, 0, 1, 1,
-1.579273, -1.250729, -3.65163, 1, 0, 0, 1, 1,
-1.560593, -0.2906026, -1.057639, 1, 0, 0, 1, 1,
-1.54668, 0.2412452, -1.112838, 1, 0, 0, 1, 1,
-1.53917, -0.3882631, -2.278449, 1, 0, 0, 1, 1,
-1.532954, 1.3802, -1.459003, 0, 0, 0, 1, 1,
-1.531981, 0.6544383, -0.8455542, 0, 0, 0, 1, 1,
-1.528987, -0.2580431, -2.532726, 0, 0, 0, 1, 1,
-1.520373, -0.8842019, -1.852665, 0, 0, 0, 1, 1,
-1.516777, -0.9887048, -1.904213, 0, 0, 0, 1, 1,
-1.513779, 0.7503445, -0.1056313, 0, 0, 0, 1, 1,
-1.504099, -0.4936312, -1.938313, 0, 0, 0, 1, 1,
-1.502981, 0.640269, -0.693561, 1, 1, 1, 1, 1,
-1.496655, 1.24237, -2.018338, 1, 1, 1, 1, 1,
-1.492893, -0.418882, -2.564092, 1, 1, 1, 1, 1,
-1.489023, 0.1954278, 0.1312512, 1, 1, 1, 1, 1,
-1.488612, -0.3436113, -3.353924, 1, 1, 1, 1, 1,
-1.487176, -0.06704534, -1.885589, 1, 1, 1, 1, 1,
-1.485421, -0.7134754, -1.481228, 1, 1, 1, 1, 1,
-1.484281, -0.6910158, -1.19802, 1, 1, 1, 1, 1,
-1.482333, 2.251582, 2.32909, 1, 1, 1, 1, 1,
-1.480941, 0.3332849, -3.112194, 1, 1, 1, 1, 1,
-1.479269, -0.7895617, -2.828886, 1, 1, 1, 1, 1,
-1.469051, -0.02706331, -3.442362, 1, 1, 1, 1, 1,
-1.468016, -0.7949143, -0.01322594, 1, 1, 1, 1, 1,
-1.466058, -1.450937, -2.32555, 1, 1, 1, 1, 1,
-1.450934, -0.150248, -2.352472, 1, 1, 1, 1, 1,
-1.449738, -0.3064499, -1.65266, 0, 0, 1, 1, 1,
-1.440018, -0.04028413, -0.4592967, 1, 0, 0, 1, 1,
-1.436837, -0.0744848, 0.2144261, 1, 0, 0, 1, 1,
-1.422623, 2.069905, 0.7036659, 1, 0, 0, 1, 1,
-1.415416, 1.850425, -2.669357, 1, 0, 0, 1, 1,
-1.396179, -0.05174185, -0.9088743, 1, 0, 0, 1, 1,
-1.383052, -1.289335, -3.216642, 0, 0, 0, 1, 1,
-1.371329, 0.9422858, -0.767755, 0, 0, 0, 1, 1,
-1.361303, -0.913865, -3.370958, 0, 0, 0, 1, 1,
-1.359499, -1.291085, -3.206369, 0, 0, 0, 1, 1,
-1.350011, -0.9870355, -2.716423, 0, 0, 0, 1, 1,
-1.345926, -2.236151, -2.162725, 0, 0, 0, 1, 1,
-1.337248, -0.04192725, -0.6575314, 0, 0, 0, 1, 1,
-1.335834, 0.6936022, -1.775122, 1, 1, 1, 1, 1,
-1.332791, -1.244067, -3.418134, 1, 1, 1, 1, 1,
-1.326129, 0.3578406, -1.588429, 1, 1, 1, 1, 1,
-1.32361, -0.9214314, -1.585322, 1, 1, 1, 1, 1,
-1.316946, 1.504875, -1.28227, 1, 1, 1, 1, 1,
-1.316335, -0.04051763, -0.4971368, 1, 1, 1, 1, 1,
-1.29948, 0.9863812, -1.005873, 1, 1, 1, 1, 1,
-1.299278, -0.4504185, -3.088961, 1, 1, 1, 1, 1,
-1.29221, 1.139065, -2.484689, 1, 1, 1, 1, 1,
-1.291875, 1.336165, -0.956721, 1, 1, 1, 1, 1,
-1.287762, -0.1443586, -0.1245265, 1, 1, 1, 1, 1,
-1.287111, -1.013192, -2.576064, 1, 1, 1, 1, 1,
-1.275745, 0.1640861, -0.7402384, 1, 1, 1, 1, 1,
-1.271515, 0.7825529, -0.4320061, 1, 1, 1, 1, 1,
-1.2714, -0.9629207, 0.7181944, 1, 1, 1, 1, 1,
-1.267647, -0.09233392, -2.584369, 0, 0, 1, 1, 1,
-1.263576, 0.7759065, -0.5758025, 1, 0, 0, 1, 1,
-1.25837, 1.263969, 0.4977306, 1, 0, 0, 1, 1,
-1.249075, -1.092356, -3.091418, 1, 0, 0, 1, 1,
-1.247018, 0.8035924, 0.6120376, 1, 0, 0, 1, 1,
-1.234226, -0.7158223, -0.5899246, 1, 0, 0, 1, 1,
-1.23421, 0.2826602, -2.696502, 0, 0, 0, 1, 1,
-1.22068, -0.2039188, -2.200748, 0, 0, 0, 1, 1,
-1.210677, -1.117129, -2.988521, 0, 0, 0, 1, 1,
-1.189384, -0.4907466, -2.112016, 0, 0, 0, 1, 1,
-1.184554, -0.9458792, -2.468814, 0, 0, 0, 1, 1,
-1.1821, 0.2218176, -1.19191, 0, 0, 0, 1, 1,
-1.181893, 0.6322492, -1.175326, 0, 0, 0, 1, 1,
-1.181411, -0.624197, -1.50705, 1, 1, 1, 1, 1,
-1.177185, -1.767365, -2.612854, 1, 1, 1, 1, 1,
-1.171042, -0.2835068, -1.771759, 1, 1, 1, 1, 1,
-1.167149, 1.537673, -0.2408644, 1, 1, 1, 1, 1,
-1.164778, -0.3798841, -1.674543, 1, 1, 1, 1, 1,
-1.156324, 0.9077989, -1.984046, 1, 1, 1, 1, 1,
-1.146243, -0.5630254, -1.243549, 1, 1, 1, 1, 1,
-1.139018, 0.5257977, -1.149228, 1, 1, 1, 1, 1,
-1.138711, 0.335855, -0.6885213, 1, 1, 1, 1, 1,
-1.135698, 0.2920108, -2.179974, 1, 1, 1, 1, 1,
-1.123931, -0.3085863, -1.14362, 1, 1, 1, 1, 1,
-1.123618, 0.9248899, -0.5109637, 1, 1, 1, 1, 1,
-1.11862, 1.159281, -1.021062, 1, 1, 1, 1, 1,
-1.101662, -0.1473242, -2.262432, 1, 1, 1, 1, 1,
-1.101155, -1.418341, -3.516399, 1, 1, 1, 1, 1,
-1.098735, 0.5066299, 0.698603, 0, 0, 1, 1, 1,
-1.096868, -0.671698, -3.446636, 1, 0, 0, 1, 1,
-1.09037, 0.663476, -2.303086, 1, 0, 0, 1, 1,
-1.087341, 1.010584, -1.247428, 1, 0, 0, 1, 1,
-1.076356, 0.3488699, -0.09179876, 1, 0, 0, 1, 1,
-1.063674, -0.7795331, -1.611962, 1, 0, 0, 1, 1,
-1.060356, 0.2944901, -0.4063996, 0, 0, 0, 1, 1,
-1.053312, 0.4113441, 0.0862317, 0, 0, 0, 1, 1,
-1.053225, 0.7095106, -0.4094906, 0, 0, 0, 1, 1,
-1.047518, -0.4031477, -1.250455, 0, 0, 0, 1, 1,
-1.042876, -1.581189, -3.620267, 0, 0, 0, 1, 1,
-1.036288, -0.5058956, -2.592807, 0, 0, 0, 1, 1,
-1.034153, -0.3736217, -3.202768, 0, 0, 0, 1, 1,
-1.023205, -0.4206238, -3.404315, 1, 1, 1, 1, 1,
-0.9940322, 1.90953, -0.4913191, 1, 1, 1, 1, 1,
-0.9869169, -1.557241, -1.266788, 1, 1, 1, 1, 1,
-0.985691, 1.19221, 0.4625951, 1, 1, 1, 1, 1,
-0.9836832, 0.1919465, -2.04461, 1, 1, 1, 1, 1,
-0.9771917, 2.343771, -0.5127849, 1, 1, 1, 1, 1,
-0.9702051, -0.3703647, -3.285271, 1, 1, 1, 1, 1,
-0.9630828, -1.736757, -2.002513, 1, 1, 1, 1, 1,
-0.960576, 0.4693439, 0.4959532, 1, 1, 1, 1, 1,
-0.9560579, -1.072148, -0.5172141, 1, 1, 1, 1, 1,
-0.9541863, 0.5136943, -0.3359024, 1, 1, 1, 1, 1,
-0.952836, -0.3295552, -2.076398, 1, 1, 1, 1, 1,
-0.9436164, 0.5359616, -0.9746181, 1, 1, 1, 1, 1,
-0.9428145, 0.7192466, -0.2764047, 1, 1, 1, 1, 1,
-0.9346144, -0.8691112, -1.424049, 1, 1, 1, 1, 1,
-0.933583, -0.898702, -1.991443, 0, 0, 1, 1, 1,
-0.9228134, -1.06914, -2.216534, 1, 0, 0, 1, 1,
-0.9190799, -2.505714, -2.96622, 1, 0, 0, 1, 1,
-0.9188745, 1.804849, 1.478018, 1, 0, 0, 1, 1,
-0.9121779, 0.5898991, -0.08477861, 1, 0, 0, 1, 1,
-0.9093707, 1.256651, -0.02780922, 1, 0, 0, 1, 1,
-0.9070086, 0.03448317, -2.015728, 0, 0, 0, 1, 1,
-0.9053864, -1.393081, -0.6184948, 0, 0, 0, 1, 1,
-0.8829064, 0.1540033, -1.681387, 0, 0, 0, 1, 1,
-0.8771002, 0.3476625, -1.921653, 0, 0, 0, 1, 1,
-0.8757536, 0.1922961, -2.070389, 0, 0, 0, 1, 1,
-0.8756152, -0.03661571, -0.8668817, 0, 0, 0, 1, 1,
-0.8676136, 1.41259, 0.3857927, 0, 0, 0, 1, 1,
-0.8663722, 0.1229219, -1.792011, 1, 1, 1, 1, 1,
-0.8648652, 0.07098226, -2.911309, 1, 1, 1, 1, 1,
-0.8638473, -0.7193285, -2.276482, 1, 1, 1, 1, 1,
-0.8615832, 0.03527207, -2.111554, 1, 1, 1, 1, 1,
-0.8610342, -0.7068103, -1.034897, 1, 1, 1, 1, 1,
-0.857479, 0.485574, -2.774359, 1, 1, 1, 1, 1,
-0.8569601, 0.5547939, -0.07836712, 1, 1, 1, 1, 1,
-0.8569229, 0.2068242, -1.168717, 1, 1, 1, 1, 1,
-0.8517231, -0.4999834, -3.074912, 1, 1, 1, 1, 1,
-0.8453743, 0.09864937, -1.262409, 1, 1, 1, 1, 1,
-0.8435946, -1.072196, -3.687719, 1, 1, 1, 1, 1,
-0.8433332, 0.3678293, -1.080651, 1, 1, 1, 1, 1,
-0.8419333, -0.03730863, -1.75964, 1, 1, 1, 1, 1,
-0.8299051, -0.8865393, -3.685139, 1, 1, 1, 1, 1,
-0.8296229, 0.7048684, 0.08869069, 1, 1, 1, 1, 1,
-0.8249882, 0.6484854, -0.9758833, 0, 0, 1, 1, 1,
-0.8229861, 0.2686662, 0.115112, 1, 0, 0, 1, 1,
-0.8170782, -0.6007504, -2.734089, 1, 0, 0, 1, 1,
-0.8111175, 0.569612, -1.714855, 1, 0, 0, 1, 1,
-0.8031393, -0.3224939, -3.219706, 1, 0, 0, 1, 1,
-0.800741, -0.5548606, -3.450799, 1, 0, 0, 1, 1,
-0.7960372, 0.1601877, -1.149548, 0, 0, 0, 1, 1,
-0.7939385, -1.546567, -0.8609568, 0, 0, 0, 1, 1,
-0.7825842, -1.419339, -4.209975, 0, 0, 0, 1, 1,
-0.7734867, -1.26341, -0.3153214, 0, 0, 0, 1, 1,
-0.7732553, -1.039515, -2.58426, 0, 0, 0, 1, 1,
-0.7709929, -0.8209621, -3.115231, 0, 0, 0, 1, 1,
-0.7668198, -0.5627595, -3.38918, 0, 0, 0, 1, 1,
-0.7663187, 0.1088238, -0.2581743, 1, 1, 1, 1, 1,
-0.763111, -1.197872, -3.438017, 1, 1, 1, 1, 1,
-0.7619629, -1.304837, -3.975294, 1, 1, 1, 1, 1,
-0.7611575, 0.2765656, -0.378737, 1, 1, 1, 1, 1,
-0.7602072, -0.4764659, -1.934178, 1, 1, 1, 1, 1,
-0.760092, 1.79199, 1.403908, 1, 1, 1, 1, 1,
-0.7592082, 0.656181, 0.01213198, 1, 1, 1, 1, 1,
-0.7494087, 0.02513216, -1.691037, 1, 1, 1, 1, 1,
-0.7431348, 0.5997385, -1.889617, 1, 1, 1, 1, 1,
-0.7392752, 1.169175, 1.091351, 1, 1, 1, 1, 1,
-0.7385141, -0.001177288, -0.995315, 1, 1, 1, 1, 1,
-0.7368106, 0.6498326, -0.254673, 1, 1, 1, 1, 1,
-0.7348284, 0.1612581, -1.34011, 1, 1, 1, 1, 1,
-0.7335327, -0.2499621, -2.668744, 1, 1, 1, 1, 1,
-0.7269191, -0.6802327, -2.428833, 1, 1, 1, 1, 1,
-0.7243873, 0.8342325, -1.11631, 0, 0, 1, 1, 1,
-0.7231432, -0.04613066, -2.406399, 1, 0, 0, 1, 1,
-0.7221375, -2.338048, -0.9942933, 1, 0, 0, 1, 1,
-0.7220762, 0.4887128, -0.3908935, 1, 0, 0, 1, 1,
-0.7217448, -0.8762923, -1.775438, 1, 0, 0, 1, 1,
-0.7101666, -2.397851, -2.991885, 1, 0, 0, 1, 1,
-0.7084376, -0.5147446, -2.210053, 0, 0, 0, 1, 1,
-0.7055508, -1.214658, -2.540408, 0, 0, 0, 1, 1,
-0.7015399, 0.4506592, -0.9309375, 0, 0, 0, 1, 1,
-0.6978375, -1.291223, -2.14408, 0, 0, 0, 1, 1,
-0.6970754, -0.6993214, -2.753045, 0, 0, 0, 1, 1,
-0.6956327, 0.7760639, -0.7620101, 0, 0, 0, 1, 1,
-0.6936554, -0.5172541, -2.304616, 0, 0, 0, 1, 1,
-0.6928502, -3.167219, -5.683886, 1, 1, 1, 1, 1,
-0.6854434, -0.03481801, -1.605722, 1, 1, 1, 1, 1,
-0.6804892, -0.6942838, -1.683652, 1, 1, 1, 1, 1,
-0.6804813, 0.2387478, -1.816102, 1, 1, 1, 1, 1,
-0.6798514, 1.145889, 1.686908, 1, 1, 1, 1, 1,
-0.6776652, 0.3458388, -0.784586, 1, 1, 1, 1, 1,
-0.6753951, 2.284783, -1.329764, 1, 1, 1, 1, 1,
-0.6726183, -0.08079547, -1.918721, 1, 1, 1, 1, 1,
-0.6715772, 2.543124, -0.7777752, 1, 1, 1, 1, 1,
-0.6679276, -1.397897, -3.972396, 1, 1, 1, 1, 1,
-0.6675088, 0.6047251, -1.696475, 1, 1, 1, 1, 1,
-0.6628801, -0.8431129, -1.584278, 1, 1, 1, 1, 1,
-0.6616561, 0.3237903, -1.043287, 1, 1, 1, 1, 1,
-0.6606482, -0.7569744, -3.118356, 1, 1, 1, 1, 1,
-0.6526266, 0.355773, -0.211566, 1, 1, 1, 1, 1,
-0.6390198, 1.008625, -0.303607, 0, 0, 1, 1, 1,
-0.6299767, -0.8212788, -2.311726, 1, 0, 0, 1, 1,
-0.6285979, -0.7640489, -4.033962, 1, 0, 0, 1, 1,
-0.6284716, 0.4723502, -1.16324, 1, 0, 0, 1, 1,
-0.628062, -0.09466474, -0.7948986, 1, 0, 0, 1, 1,
-0.6273738, -0.8967415, -3.914825, 1, 0, 0, 1, 1,
-0.6271952, -1.527692, -1.354012, 0, 0, 0, 1, 1,
-0.6240237, 1.096363, -1.398117, 0, 0, 0, 1, 1,
-0.623686, 0.9312846, 0.6123655, 0, 0, 0, 1, 1,
-0.6230046, -0.6945153, -3.33014, 0, 0, 0, 1, 1,
-0.6211185, 0.9935355, -0.3757294, 0, 0, 0, 1, 1,
-0.6172699, 1.517065, 0.6483659, 0, 0, 0, 1, 1,
-0.6163782, -0.1417893, -2.703008, 0, 0, 0, 1, 1,
-0.6162083, 0.01247632, -2.411778, 1, 1, 1, 1, 1,
-0.6140463, 0.2839584, -1.427218, 1, 1, 1, 1, 1,
-0.6124339, 1.578459, 0.3876274, 1, 1, 1, 1, 1,
-0.6105453, 1.252467, -1.280755, 1, 1, 1, 1, 1,
-0.6081835, -1.904802, -3.224749, 1, 1, 1, 1, 1,
-0.606704, 0.03291875, -1.287297, 1, 1, 1, 1, 1,
-0.6055982, 0.4934268, -1.150721, 1, 1, 1, 1, 1,
-0.6053042, 1.313848, -0.7662779, 1, 1, 1, 1, 1,
-0.6000602, -0.2053741, -2.651441, 1, 1, 1, 1, 1,
-0.5989304, 0.9071, -0.7750259, 1, 1, 1, 1, 1,
-0.5984964, -0.7180964, -3.479706, 1, 1, 1, 1, 1,
-0.5969213, 0.5323262, -1.454365, 1, 1, 1, 1, 1,
-0.5958421, 0.03461841, -3.000566, 1, 1, 1, 1, 1,
-0.5943193, -0.2176663, -0.333694, 1, 1, 1, 1, 1,
-0.5880595, 0.04286976, -1.680497, 1, 1, 1, 1, 1,
-0.5878328, 1.443114, -0.4483053, 0, 0, 1, 1, 1,
-0.5841938, -0.1079622, -0.4383711, 1, 0, 0, 1, 1,
-0.5829355, -0.3286217, -2.384263, 1, 0, 0, 1, 1,
-0.5815055, -0.8292853, -2.52437, 1, 0, 0, 1, 1,
-0.5802441, -1.617449, -2.196631, 1, 0, 0, 1, 1,
-0.5799994, -0.9890812, -2.928706, 1, 0, 0, 1, 1,
-0.5795326, 0.7486529, 1.089086, 0, 0, 0, 1, 1,
-0.5748619, 0.06341022, 0.6169006, 0, 0, 0, 1, 1,
-0.5505137, -0.3574009, -3.631926, 0, 0, 0, 1, 1,
-0.5477951, -0.6042517, -2.472391, 0, 0, 0, 1, 1,
-0.5465728, -1.101495, -0.9077435, 0, 0, 0, 1, 1,
-0.5438715, -0.6203768, -2.299, 0, 0, 0, 1, 1,
-0.5428863, -0.6014424, -0.9817824, 0, 0, 0, 1, 1,
-0.5411345, 0.7413843, 0.5259008, 1, 1, 1, 1, 1,
-0.5362477, -0.5390283, -2.2953, 1, 1, 1, 1, 1,
-0.5360885, 0.339029, -2.144531, 1, 1, 1, 1, 1,
-0.5294426, 1.391666, 0.2747338, 1, 1, 1, 1, 1,
-0.5259012, 2.292927, 0.07882231, 1, 1, 1, 1, 1,
-0.5207546, 0.09682817, -0.6978769, 1, 1, 1, 1, 1,
-0.5187163, 0.01007204, -1.174972, 1, 1, 1, 1, 1,
-0.5182864, -0.2807403, -3.098911, 1, 1, 1, 1, 1,
-0.5174116, 0.2028551, -1.846822, 1, 1, 1, 1, 1,
-0.5157856, 0.06795858, -2.867412, 1, 1, 1, 1, 1,
-0.5146332, -0.6963058, -2.907231, 1, 1, 1, 1, 1,
-0.5142632, 0.9398799, 1.304919, 1, 1, 1, 1, 1,
-0.5131108, -1.66998, -1.411452, 1, 1, 1, 1, 1,
-0.5079596, 0.5632669, 0.0874934, 1, 1, 1, 1, 1,
-0.5052788, 0.7866291, 0.838842, 1, 1, 1, 1, 1,
-0.5000637, -2.245358, -1.820969, 0, 0, 1, 1, 1,
-0.4977252, -1.364225, -1.285465, 1, 0, 0, 1, 1,
-0.4908488, 0.4367053, -1.599305, 1, 0, 0, 1, 1,
-0.4877278, -1.408747, -5.536597, 1, 0, 0, 1, 1,
-0.4874674, 0.1963589, -2.682452, 1, 0, 0, 1, 1,
-0.4859826, -0.5636784, -1.660545, 1, 0, 0, 1, 1,
-0.4845054, -1.145944, -3.153029, 0, 0, 0, 1, 1,
-0.4814969, 0.1036747, -3.026517, 0, 0, 0, 1, 1,
-0.481473, 0.5207721, -1.368945, 0, 0, 0, 1, 1,
-0.4776645, -0.1530945, -1.376998, 0, 0, 0, 1, 1,
-0.4741842, -0.5841745, -1.425569, 0, 0, 0, 1, 1,
-0.4739923, -0.8564639, -1.987127, 0, 0, 0, 1, 1,
-0.4699113, 0.2740121, 0.1497141, 0, 0, 0, 1, 1,
-0.4687592, 1.00184, -1.229997, 1, 1, 1, 1, 1,
-0.4666783, 0.6620138, 0.1382618, 1, 1, 1, 1, 1,
-0.4641386, -0.2284691, -3.218427, 1, 1, 1, 1, 1,
-0.4601342, 0.408306, -1.45719, 1, 1, 1, 1, 1,
-0.4593205, -0.5090672, -2.350923, 1, 1, 1, 1, 1,
-0.4571773, 0.7171991, -0.8999031, 1, 1, 1, 1, 1,
-0.4542568, -0.2570612, -1.845076, 1, 1, 1, 1, 1,
-0.4518712, 0.4278312, 0.5155458, 1, 1, 1, 1, 1,
-0.4492092, -0.8860108, -3.061261, 1, 1, 1, 1, 1,
-0.4479191, 0.01835331, -3.083958, 1, 1, 1, 1, 1,
-0.4458257, 0.08849461, -1.073836, 1, 1, 1, 1, 1,
-0.4412301, 0.5583776, 0.1468465, 1, 1, 1, 1, 1,
-0.4407816, 1.488891, 1.197672, 1, 1, 1, 1, 1,
-0.4393268, -1.50164, -2.566333, 1, 1, 1, 1, 1,
-0.4379369, -0.1179639, -0.9560343, 1, 1, 1, 1, 1,
-0.4323966, 0.4461739, -0.337497, 0, 0, 1, 1, 1,
-0.4273626, 0.6358418, -1.871029, 1, 0, 0, 1, 1,
-0.4261866, -1.27483, -3.717266, 1, 0, 0, 1, 1,
-0.4258756, -2.466997, -4.097575, 1, 0, 0, 1, 1,
-0.4254069, -1.098826, -3.348304, 1, 0, 0, 1, 1,
-0.424673, 0.9032393, -1.429171, 1, 0, 0, 1, 1,
-0.4207588, 0.7465296, 0.4654587, 0, 0, 0, 1, 1,
-0.4164623, -2.67979, -2.756276, 0, 0, 0, 1, 1,
-0.4126047, -0.5819701, -1.434493, 0, 0, 0, 1, 1,
-0.4122728, 1.648031, -1.013135, 0, 0, 0, 1, 1,
-0.410186, -1.663073, -2.761337, 0, 0, 0, 1, 1,
-0.4061162, 0.07205041, -2.191054, 0, 0, 0, 1, 1,
-0.4054743, 0.9658474, 0.3641978, 0, 0, 0, 1, 1,
-0.3979094, -1.860754, -3.249859, 1, 1, 1, 1, 1,
-0.3978342, 1.175811, 0.6720961, 1, 1, 1, 1, 1,
-0.397767, -2.013079, -2.713653, 1, 1, 1, 1, 1,
-0.3959472, 0.2414906, -2.223101, 1, 1, 1, 1, 1,
-0.3940647, -0.07026, -1.28633, 1, 1, 1, 1, 1,
-0.3910643, -0.1665297, -3.298617, 1, 1, 1, 1, 1,
-0.3909634, -0.2668351, -4.49123, 1, 1, 1, 1, 1,
-0.3900163, 1.323654, 2.411821, 1, 1, 1, 1, 1,
-0.3858652, -0.05603666, -1.105935, 1, 1, 1, 1, 1,
-0.3833449, -0.3378893, -2.992279, 1, 1, 1, 1, 1,
-0.3832819, 0.7253602, -0.7608227, 1, 1, 1, 1, 1,
-0.3786065, 1.571016, 1.137682, 1, 1, 1, 1, 1,
-0.3785051, 0.4160509, -0.3980405, 1, 1, 1, 1, 1,
-0.3767259, -0.4946578, -3.028585, 1, 1, 1, 1, 1,
-0.3757322, 0.0791972, -0.4242751, 1, 1, 1, 1, 1,
-0.3716668, -0.7113675, -2.932422, 0, 0, 1, 1, 1,
-0.367266, 0.1587051, -0.6119198, 1, 0, 0, 1, 1,
-0.3650825, 0.7564124, -1.044675, 1, 0, 0, 1, 1,
-0.3528786, 0.8097513, 2.106317, 1, 0, 0, 1, 1,
-0.3523979, -0.3180719, -3.487159, 1, 0, 0, 1, 1,
-0.3512221, 0.4422879, -0.6730687, 1, 0, 0, 1, 1,
-0.3473154, -0.01731156, -3.523026, 0, 0, 0, 1, 1,
-0.3451061, -0.3372108, -2.390322, 0, 0, 0, 1, 1,
-0.344809, 1.507097, -0.6750839, 0, 0, 0, 1, 1,
-0.3426002, -0.5764193, -1.796911, 0, 0, 0, 1, 1,
-0.3420849, -0.7535534, -3.177169, 0, 0, 0, 1, 1,
-0.341755, 0.7097694, 0.04114377, 0, 0, 0, 1, 1,
-0.3410978, 0.9151521, -0.7694435, 0, 0, 0, 1, 1,
-0.3376686, -1.651629, -2.532682, 1, 1, 1, 1, 1,
-0.3373915, 0.5808846, -1.163684, 1, 1, 1, 1, 1,
-0.3356271, -1.835049, -3.920985, 1, 1, 1, 1, 1,
-0.3338724, 1.267117, -0.2292753, 1, 1, 1, 1, 1,
-0.3310362, -0.8139733, -3.621526, 1, 1, 1, 1, 1,
-0.3282582, -0.6315311, -2.387087, 1, 1, 1, 1, 1,
-0.3264451, -3.240666, -2.451893, 1, 1, 1, 1, 1,
-0.3253982, 0.139627, -2.712276, 1, 1, 1, 1, 1,
-0.3238755, 1.111612, 0.9186997, 1, 1, 1, 1, 1,
-0.3213093, -1.199287, -4.016096, 1, 1, 1, 1, 1,
-0.3198564, -0.1732102, -2.010556, 1, 1, 1, 1, 1,
-0.3170999, 1.240906, -0.01063447, 1, 1, 1, 1, 1,
-0.3118519, 0.2437124, -1.452056, 1, 1, 1, 1, 1,
-0.301831, -1.463427, -1.703626, 1, 1, 1, 1, 1,
-0.2982245, 0.4921235, -1.320523, 1, 1, 1, 1, 1,
-0.295085, -1.864039, -2.490427, 0, 0, 1, 1, 1,
-0.293298, 0.8332154, -0.1646097, 1, 0, 0, 1, 1,
-0.290769, -0.7932841, -0.9205421, 1, 0, 0, 1, 1,
-0.2882096, 1.519137, -0.1959548, 1, 0, 0, 1, 1,
-0.2872968, 1.857217, -1.255973, 1, 0, 0, 1, 1,
-0.2847793, -0.02658744, -1.976904, 1, 0, 0, 1, 1,
-0.2839932, 0.2597907, -1.372409, 0, 0, 0, 1, 1,
-0.2809735, -0.8843138, -2.987025, 0, 0, 0, 1, 1,
-0.2805496, -0.02302585, -2.541453, 0, 0, 0, 1, 1,
-0.27978, 0.4408999, -2.760794, 0, 0, 0, 1, 1,
-0.2758768, 0.727961, -1.032473, 0, 0, 0, 1, 1,
-0.2721756, 0.7941651, 0.9102134, 0, 0, 0, 1, 1,
-0.2720592, -1.006487, -2.215152, 0, 0, 0, 1, 1,
-0.2699675, -0.136016, -1.718355, 1, 1, 1, 1, 1,
-0.2694256, 0.4402985, -0.1579179, 1, 1, 1, 1, 1,
-0.265047, -1.29432, -2.672838, 1, 1, 1, 1, 1,
-0.2646805, 0.5960601, -0.1724464, 1, 1, 1, 1, 1,
-0.2641721, -0.2361139, -1.787251, 1, 1, 1, 1, 1,
-0.2570457, 0.6862697, 0.4563144, 1, 1, 1, 1, 1,
-0.2569617, 0.1026294, -1.458889, 1, 1, 1, 1, 1,
-0.2517378, 0.2883736, -1.479864, 1, 1, 1, 1, 1,
-0.2495704, 0.4939761, -0.07524745, 1, 1, 1, 1, 1,
-0.2437003, -0.6405675, -3.303535, 1, 1, 1, 1, 1,
-0.241096, -1.53219, -1.551497, 1, 1, 1, 1, 1,
-0.2384185, -0.1255534, -1.681168, 1, 1, 1, 1, 1,
-0.2369827, -0.2666054, -2.029969, 1, 1, 1, 1, 1,
-0.2348887, 0.8528699, 0.2210612, 1, 1, 1, 1, 1,
-0.2323717, -0.3918832, -1.125648, 1, 1, 1, 1, 1,
-0.2251898, 0.3155546, -2.354203, 0, 0, 1, 1, 1,
-0.2243755, 0.5691085, -0.7667487, 1, 0, 0, 1, 1,
-0.2215688, 1.209019, -0.09180322, 1, 0, 0, 1, 1,
-0.2190719, -0.3197869, -3.540728, 1, 0, 0, 1, 1,
-0.2143946, 0.9100451, -0.7942617, 1, 0, 0, 1, 1,
-0.2101149, -1.630461, -2.531696, 1, 0, 0, 1, 1,
-0.2094686, 1.077781, 0.1004093, 0, 0, 0, 1, 1,
-0.2090745, 0.1421712, -1.237236, 0, 0, 0, 1, 1,
-0.2032879, 1.069608, -0.3975368, 0, 0, 0, 1, 1,
-0.2002464, 0.5961521, 0.007677231, 0, 0, 0, 1, 1,
-0.1954476, -2.471013, -2.638767, 0, 0, 0, 1, 1,
-0.195299, 0.2221273, -0.003116361, 0, 0, 0, 1, 1,
-0.1941922, 1.52614, -2.343375, 0, 0, 0, 1, 1,
-0.1937805, -0.5882115, -3.294153, 1, 1, 1, 1, 1,
-0.193225, 0.3804333, -1.111553, 1, 1, 1, 1, 1,
-0.1828639, 1.160215, 0.3652641, 1, 1, 1, 1, 1,
-0.1778676, -1.001544, -3.035892, 1, 1, 1, 1, 1,
-0.1741562, -1.2443, -4.164218, 1, 1, 1, 1, 1,
-0.1717937, -0.2194799, -4.178961, 1, 1, 1, 1, 1,
-0.1715208, 1.325688, -1.449996, 1, 1, 1, 1, 1,
-0.1705481, 0.4919964, -0.4884869, 1, 1, 1, 1, 1,
-0.1671858, -0.3188591, -3.910286, 1, 1, 1, 1, 1,
-0.1640408, 0.4699534, -0.9429996, 1, 1, 1, 1, 1,
-0.1640053, -0.3391538, -3.486475, 1, 1, 1, 1, 1,
-0.1530675, 0.1416298, -1.580948, 1, 1, 1, 1, 1,
-0.147935, 0.2244975, -1.079764, 1, 1, 1, 1, 1,
-0.1431855, -0.5724946, -0.5367901, 1, 1, 1, 1, 1,
-0.1431587, -0.6934226, -1.063835, 1, 1, 1, 1, 1,
-0.1422681, 0.4849818, 0.07006508, 0, 0, 1, 1, 1,
-0.1410187, 1.372113, 1.947261, 1, 0, 0, 1, 1,
-0.1370068, 2.148331, -2.383549, 1, 0, 0, 1, 1,
-0.133795, -0.6264637, -3.551581, 1, 0, 0, 1, 1,
-0.1324915, -0.7938887, -2.912812, 1, 0, 0, 1, 1,
-0.1299889, -0.06072732, -2.04304, 1, 0, 0, 1, 1,
-0.1289847, -0.9754891, -2.462551, 0, 0, 0, 1, 1,
-0.1288083, 0.1215281, 0.2772696, 0, 0, 0, 1, 1,
-0.1269767, -0.3660011, -1.174981, 0, 0, 0, 1, 1,
-0.1264467, 0.3201243, 0.8993446, 0, 0, 0, 1, 1,
-0.1242519, 0.3144498, 1.319842, 0, 0, 0, 1, 1,
-0.1204856, 0.2261049, 0.5632424, 0, 0, 0, 1, 1,
-0.1169785, -0.08210106, -2.099574, 0, 0, 0, 1, 1,
-0.1098825, 0.9587935, 1.073712, 1, 1, 1, 1, 1,
-0.1014815, 0.6931199, 0.0524781, 1, 1, 1, 1, 1,
-0.1012881, 0.04373873, -1.008812, 1, 1, 1, 1, 1,
-0.0987356, -0.6615753, -2.637168, 1, 1, 1, 1, 1,
-0.08909717, 0.560724, 0.255718, 1, 1, 1, 1, 1,
-0.08853244, -0.1128591, -3.046734, 1, 1, 1, 1, 1,
-0.08643115, -1.115353, -1.136173, 1, 1, 1, 1, 1,
-0.08103544, 1.10516, -0.9465747, 1, 1, 1, 1, 1,
-0.07830311, -1.434648, -1.820953, 1, 1, 1, 1, 1,
-0.07409122, -1.904484, -2.833224, 1, 1, 1, 1, 1,
-0.0721326, -0.7107105, -3.646301, 1, 1, 1, 1, 1,
-0.06702105, -2.329964, -2.622641, 1, 1, 1, 1, 1,
-0.06657033, -0.6031138, -3.725729, 1, 1, 1, 1, 1,
-0.06320334, 1.524794, 0.5074407, 1, 1, 1, 1, 1,
-0.06314319, 0.1099048, 0.04331295, 1, 1, 1, 1, 1,
-0.06119358, 0.5743052, -1.766608, 0, 0, 1, 1, 1,
-0.06115239, 0.7996579, -0.04734386, 1, 0, 0, 1, 1,
-0.0596632, -0.70966, -2.674333, 1, 0, 0, 1, 1,
-0.05771715, 0.9395264, -0.2700933, 1, 0, 0, 1, 1,
-0.05609498, -0.2444665, -4.566053, 1, 0, 0, 1, 1,
-0.05577217, 0.6644918, 1.6462, 1, 0, 0, 1, 1,
-0.05568583, -0.7869343, -2.445251, 0, 0, 0, 1, 1,
-0.05362023, -1.866936, -2.698869, 0, 0, 0, 1, 1,
-0.05124828, 0.08674669, -1.821409, 0, 0, 0, 1, 1,
-0.04805411, -1.186924, -1.916961, 0, 0, 0, 1, 1,
-0.04801786, -0.3598492, -2.217179, 0, 0, 0, 1, 1,
-0.04714175, -1.063061, -3.022024, 0, 0, 0, 1, 1,
-0.0466059, 0.8920453, -0.3815714, 0, 0, 0, 1, 1,
-0.04581269, 0.1238825, -0.3299471, 1, 1, 1, 1, 1,
-0.04129736, 1.079102, 0.5942453, 1, 1, 1, 1, 1,
-0.03726113, 0.6141796, 0.7878256, 1, 1, 1, 1, 1,
-0.03666493, -0.03731542, -2.706264, 1, 1, 1, 1, 1,
-0.03497291, -0.9688094, -2.533965, 1, 1, 1, 1, 1,
-0.02950889, 0.3092262, 0.8370683, 1, 1, 1, 1, 1,
-0.02910732, -0.07250507, -3.971795, 1, 1, 1, 1, 1,
-0.02892198, 0.3402559, -1.179165, 1, 1, 1, 1, 1,
-0.02447062, 0.214137, 1.541177, 1, 1, 1, 1, 1,
-0.01965114, 1.502474, -0.4073012, 1, 1, 1, 1, 1,
-0.01848811, -0.1401754, -2.684375, 1, 1, 1, 1, 1,
-0.0182043, 0.1959857, 0.5271561, 1, 1, 1, 1, 1,
-0.01744446, -0.2814002, -2.39655, 1, 1, 1, 1, 1,
-0.01701175, 0.5282191, -0.4523486, 1, 1, 1, 1, 1,
-0.01492991, 0.765038, 0.4957907, 1, 1, 1, 1, 1,
-0.01483019, -1.436936, -3.948554, 0, 0, 1, 1, 1,
-0.01156602, -0.2269703, -3.000598, 1, 0, 0, 1, 1,
-0.01135534, 0.4963884, -0.5542247, 1, 0, 0, 1, 1,
-0.01121079, -1.503063, -2.803424, 1, 0, 0, 1, 1,
-0.00615014, 0.3425761, -0.6375164, 1, 0, 0, 1, 1,
-0.005635392, -0.8575421, -3.838371, 1, 0, 0, 1, 1,
-0.004631415, -1.591966, -3.655463, 0, 0, 0, 1, 1,
-0.003874758, -0.1338671, -4.190753, 0, 0, 0, 1, 1,
0.005691794, 0.7729912, 2.337106, 0, 0, 0, 1, 1,
0.00592547, -1.211994, 3.494788, 0, 0, 0, 1, 1,
0.008836304, 0.170948, -1.388027, 0, 0, 0, 1, 1,
0.01296873, -1.029909, 4.646629, 0, 0, 0, 1, 1,
0.0131485, 0.9527146, -0.9353443, 0, 0, 0, 1, 1,
0.0134363, -0.6516826, 3.670536, 1, 1, 1, 1, 1,
0.0187916, 0.1185606, -0.8925486, 1, 1, 1, 1, 1,
0.02288535, -0.1608027, 0.5534856, 1, 1, 1, 1, 1,
0.02392224, 1.095296, -1.81008, 1, 1, 1, 1, 1,
0.02801464, -0.7368019, 3.182986, 1, 1, 1, 1, 1,
0.02971024, -1.709218, 2.848296, 1, 1, 1, 1, 1,
0.03234464, -1.308532, 4.615616, 1, 1, 1, 1, 1,
0.03673181, 1.62557, -0.5557978, 1, 1, 1, 1, 1,
0.03793103, 0.3312547, 0.2525043, 1, 1, 1, 1, 1,
0.04310017, -1.697185, 1.717405, 1, 1, 1, 1, 1,
0.04870041, -0.8476833, 2.285365, 1, 1, 1, 1, 1,
0.05028189, -0.16764, 2.238022, 1, 1, 1, 1, 1,
0.05052404, -0.3488784, 1.413199, 1, 1, 1, 1, 1,
0.05202385, -1.33658, 1.253723, 1, 1, 1, 1, 1,
0.05400654, -0.6581367, 1.901691, 1, 1, 1, 1, 1,
0.05704563, -0.1600285, 2.972309, 0, 0, 1, 1, 1,
0.06863535, 0.8995444, -0.2593295, 1, 0, 0, 1, 1,
0.06965169, -1.390124, 3.146977, 1, 0, 0, 1, 1,
0.07496836, -0.02192454, 2.395954, 1, 0, 0, 1, 1,
0.07496845, 1.543199, 1.047017, 1, 0, 0, 1, 1,
0.07658856, 1.599157, -0.7033301, 1, 0, 0, 1, 1,
0.07907495, 0.1717581, 1.670846, 0, 0, 0, 1, 1,
0.08346645, 0.01552863, 1.93981, 0, 0, 0, 1, 1,
0.08955675, 0.0254163, 1.612575, 0, 0, 0, 1, 1,
0.09074675, -0.4095703, 3.314905, 0, 0, 0, 1, 1,
0.09409867, 0.320994, -0.932412, 0, 0, 0, 1, 1,
0.09450044, -0.01249672, 2.595643, 0, 0, 0, 1, 1,
0.09594303, 1.263997, -0.7546999, 0, 0, 0, 1, 1,
0.09620345, 1.06783, 1.512012, 1, 1, 1, 1, 1,
0.09664642, -1.563284, 3.802904, 1, 1, 1, 1, 1,
0.09836534, 0.0324946, 0.5202846, 1, 1, 1, 1, 1,
0.100084, -0.5295216, 0.9812246, 1, 1, 1, 1, 1,
0.10288, -0.4296268, 5.224885, 1, 1, 1, 1, 1,
0.1056581, 0.5829477, 0.7566672, 1, 1, 1, 1, 1,
0.1083152, 0.5580223, -0.6012406, 1, 1, 1, 1, 1,
0.1127339, -0.6782621, 4.039526, 1, 1, 1, 1, 1,
0.1211571, 0.02000337, 0.4655474, 1, 1, 1, 1, 1,
0.1234616, -0.8340459, 4.564398, 1, 1, 1, 1, 1,
0.1320498, 2.083692, 0.1839556, 1, 1, 1, 1, 1,
0.1346224, 0.2674748, 1.200816, 1, 1, 1, 1, 1,
0.1364769, 0.8250872, 0.1955818, 1, 1, 1, 1, 1,
0.1448602, -0.3152535, 2.425097, 1, 1, 1, 1, 1,
0.1451033, -0.510474, 2.504058, 1, 1, 1, 1, 1,
0.1454741, -0.4732941, 2.628765, 0, 0, 1, 1, 1,
0.1460027, 1.739251, 1.641322, 1, 0, 0, 1, 1,
0.1476887, 0.07041897, 1.050593, 1, 0, 0, 1, 1,
0.1538285, -0.4663933, 3.010679, 1, 0, 0, 1, 1,
0.1590752, -0.9214072, 2.236998, 1, 0, 0, 1, 1,
0.1626534, 0.4590579, 1.31978, 1, 0, 0, 1, 1,
0.1659681, 1.191464, -0.06456649, 0, 0, 0, 1, 1,
0.1690687, 0.7355713, -0.4528421, 0, 0, 0, 1, 1,
0.1724439, 0.6846658, 1.646315, 0, 0, 0, 1, 1,
0.1730843, -0.2771206, 1.79868, 0, 0, 0, 1, 1,
0.1786994, 1.317962, -0.7969211, 0, 0, 0, 1, 1,
0.1789811, -0.03518497, 1.31483, 0, 0, 0, 1, 1,
0.1831055, -1.235674, 2.780099, 0, 0, 0, 1, 1,
0.1832207, -0.1757879, 3.181508, 1, 1, 1, 1, 1,
0.1852879, 0.1374024, -0.1542996, 1, 1, 1, 1, 1,
0.1868385, 0.3766324, 0.693827, 1, 1, 1, 1, 1,
0.1871496, -0.4148213, 2.723932, 1, 1, 1, 1, 1,
0.1875863, -1.020266, 2.927904, 1, 1, 1, 1, 1,
0.1964538, -0.3874289, 1.204924, 1, 1, 1, 1, 1,
0.2018612, 0.5105315, 0.2423526, 1, 1, 1, 1, 1,
0.2022114, -0.2245124, 2.31594, 1, 1, 1, 1, 1,
0.207559, -0.1874983, 2.334929, 1, 1, 1, 1, 1,
0.2154651, -1.430223, 3.632771, 1, 1, 1, 1, 1,
0.215536, 1.237551, 0.5771694, 1, 1, 1, 1, 1,
0.2163925, 1.054786, -0.5176665, 1, 1, 1, 1, 1,
0.2196808, -0.4369777, 4.331945, 1, 1, 1, 1, 1,
0.23149, -0.569737, 2.254129, 1, 1, 1, 1, 1,
0.2327556, -1.847865, 3.771569, 1, 1, 1, 1, 1,
0.2334583, -1.63677, 4.211302, 0, 0, 1, 1, 1,
0.2353575, 0.7808583, 1.170696, 1, 0, 0, 1, 1,
0.2367363, -0.9134785, 3.409651, 1, 0, 0, 1, 1,
0.2375358, -0.3158399, 2.592986, 1, 0, 0, 1, 1,
0.2395962, -0.3183837, 0.5842067, 1, 0, 0, 1, 1,
0.2427399, 0.2084221, 1.628192, 1, 0, 0, 1, 1,
0.2449412, 1.29192, -0.09690777, 0, 0, 0, 1, 1,
0.2460457, 0.4967539, 0.8263614, 0, 0, 0, 1, 1,
0.2490051, -2.307273, 3.049931, 0, 0, 0, 1, 1,
0.2495497, -1.48167, 4.110602, 0, 0, 0, 1, 1,
0.2525833, 1.368983, -0.2382498, 0, 0, 0, 1, 1,
0.2547647, -0.1154663, -0.176442, 0, 0, 0, 1, 1,
0.2597948, 1.034647, -1.634643, 0, 0, 0, 1, 1,
0.2605401, -1.543506, 4.011469, 1, 1, 1, 1, 1,
0.2634421, -1.082824, 1.998538, 1, 1, 1, 1, 1,
0.2657619, -0.8838766, 3.396742, 1, 1, 1, 1, 1,
0.2667624, -2.057186, 3.753006, 1, 1, 1, 1, 1,
0.2670559, -0.2163333, 3.33788, 1, 1, 1, 1, 1,
0.2681793, -2.132318, 1.297588, 1, 1, 1, 1, 1,
0.2683352, -1.444154, 1.56213, 1, 1, 1, 1, 1,
0.2687178, -0.6130051, 3.568819, 1, 1, 1, 1, 1,
0.2713678, 0.1955955, -0.6875443, 1, 1, 1, 1, 1,
0.2740042, 0.9253652, -0.1481765, 1, 1, 1, 1, 1,
0.2755235, -0.6770954, 2.661852, 1, 1, 1, 1, 1,
0.2861098, 1.070405, -2.244258, 1, 1, 1, 1, 1,
0.2866444, -0.5250477, 4.139595, 1, 1, 1, 1, 1,
0.2869002, -0.5399495, 3.261271, 1, 1, 1, 1, 1,
0.2879052, -1.118334, 3.328292, 1, 1, 1, 1, 1,
0.2882056, 1.062065, -0.2954529, 0, 0, 1, 1, 1,
0.2954163, -0.7751503, 1.177457, 1, 0, 0, 1, 1,
0.2973671, 0.1701489, 1.589881, 1, 0, 0, 1, 1,
0.3023478, -0.06265371, 0.5688477, 1, 0, 0, 1, 1,
0.3053781, -2.649686, 3.992574, 1, 0, 0, 1, 1,
0.3083332, 0.5190316, 1.476423, 1, 0, 0, 1, 1,
0.3114823, 0.4286589, 2.771748, 0, 0, 0, 1, 1,
0.3160603, 0.6352532, 1.368707, 0, 0, 0, 1, 1,
0.3162793, 0.7162167, -0.1581701, 0, 0, 0, 1, 1,
0.3165632, 0.2144161, 0.3125992, 0, 0, 0, 1, 1,
0.3169213, 0.6226302, -0.5763107, 0, 0, 0, 1, 1,
0.320093, -1.012348, 1.997299, 0, 0, 0, 1, 1,
0.3230872, -0.3996952, 2.121928, 0, 0, 0, 1, 1,
0.3256822, -0.05783667, 0.4277018, 1, 1, 1, 1, 1,
0.3275352, -0.04088315, 2.569046, 1, 1, 1, 1, 1,
0.3283269, -0.7595683, 2.240171, 1, 1, 1, 1, 1,
0.3330705, -1.454909, 3.67649, 1, 1, 1, 1, 1,
0.3350832, 1.054665, 0.8195594, 1, 1, 1, 1, 1,
0.3353932, -1.3801, 2.253468, 1, 1, 1, 1, 1,
0.3362378, 0.1585371, 0.9687404, 1, 1, 1, 1, 1,
0.3362674, -0.7538632, 3.208923, 1, 1, 1, 1, 1,
0.3385345, 1.078998, -1.339551, 1, 1, 1, 1, 1,
0.3457375, 0.1675538, 0.6817517, 1, 1, 1, 1, 1,
0.3475981, 0.7597988, 1.177428, 1, 1, 1, 1, 1,
0.3477668, -0.825145, 3.10648, 1, 1, 1, 1, 1,
0.3487144, 0.1573944, 2.065993, 1, 1, 1, 1, 1,
0.3501523, -0.1515943, 3.018852, 1, 1, 1, 1, 1,
0.3506706, -0.6458249, 4.882219, 1, 1, 1, 1, 1,
0.351936, -1.962207, 1.428791, 0, 0, 1, 1, 1,
0.3542407, -0.6902124, 3.146261, 1, 0, 0, 1, 1,
0.3588589, -0.3315093, 5.331627, 1, 0, 0, 1, 1,
0.3604523, -0.6362578, 3.165872, 1, 0, 0, 1, 1,
0.3623759, -0.3573218, 2.353021, 1, 0, 0, 1, 1,
0.3629169, 1.312718, -1.736195, 1, 0, 0, 1, 1,
0.3645905, 1.177218, -0.02308365, 0, 0, 0, 1, 1,
0.36986, 0.1451523, 1.22213, 0, 0, 0, 1, 1,
0.3702459, -3.070088, 3.28168, 0, 0, 0, 1, 1,
0.3734286, -0.2008815, 1.428265, 0, 0, 0, 1, 1,
0.3736842, 0.6284736, 0.5043893, 0, 0, 0, 1, 1,
0.3737494, 1.723552, -0.6254169, 0, 0, 0, 1, 1,
0.3781392, -0.04826523, 1.791642, 0, 0, 0, 1, 1,
0.3789506, -0.1244085, 0.02177181, 1, 1, 1, 1, 1,
0.3790353, 0.1515437, 2.197771, 1, 1, 1, 1, 1,
0.3819389, -0.1038592, 1.777319, 1, 1, 1, 1, 1,
0.3849778, -0.871044, 4.598214, 1, 1, 1, 1, 1,
0.3856916, 1.359064, 0.7615948, 1, 1, 1, 1, 1,
0.390817, 1.457268, 0.04238966, 1, 1, 1, 1, 1,
0.391882, -0.4292924, 1.769722, 1, 1, 1, 1, 1,
0.3937893, -0.4614072, 2.006027, 1, 1, 1, 1, 1,
0.4001182, 0.05656883, 1.616331, 1, 1, 1, 1, 1,
0.4008701, 0.3865913, 1.997218, 1, 1, 1, 1, 1,
0.4025487, -0.9716867, 2.508952, 1, 1, 1, 1, 1,
0.4033281, -0.6784629, 4.257055, 1, 1, 1, 1, 1,
0.412072, -0.5257843, 3.515358, 1, 1, 1, 1, 1,
0.4130471, 2.609386, -0.86685, 1, 1, 1, 1, 1,
0.4185082, -1.280083, 1.866261, 1, 1, 1, 1, 1,
0.4199551, -1.892605, 4.64904, 0, 0, 1, 1, 1,
0.4200569, 0.4674945, 1.06458, 1, 0, 0, 1, 1,
0.4234245, 0.1734425, 0.3509478, 1, 0, 0, 1, 1,
0.4265252, -0.2187219, 0.8767817, 1, 0, 0, 1, 1,
0.426929, -1.743572, 1.918871, 1, 0, 0, 1, 1,
0.432056, -0.5970951, 1.778757, 1, 0, 0, 1, 1,
0.4408573, 0.6838803, -0.1985616, 0, 0, 0, 1, 1,
0.4450247, -0.06282522, 1.425235, 0, 0, 0, 1, 1,
0.4487815, -0.5169557, 2.549, 0, 0, 0, 1, 1,
0.4503333, 0.3546935, 1.489693, 0, 0, 0, 1, 1,
0.4516981, -0.9919453, 2.127452, 0, 0, 0, 1, 1,
0.4554972, 1.512951, -0.7932869, 0, 0, 0, 1, 1,
0.4637293, 0.6139265, 0.2627124, 0, 0, 0, 1, 1,
0.4649308, 1.216521, 1.698657, 1, 1, 1, 1, 1,
0.4669243, -0.117823, 1.355101, 1, 1, 1, 1, 1,
0.4670506, -0.8317165, 1.115334, 1, 1, 1, 1, 1,
0.4674644, 1.125048, 0.5012898, 1, 1, 1, 1, 1,
0.4729104, -0.9034736, 2.70314, 1, 1, 1, 1, 1,
0.4751007, 0.6385978, 0.1569479, 1, 1, 1, 1, 1,
0.4786251, -0.8024596, 2.381781, 1, 1, 1, 1, 1,
0.4836864, 1.41475, 0.6080682, 1, 1, 1, 1, 1,
0.4901906, 0.517006, -0.3160308, 1, 1, 1, 1, 1,
0.4926998, -1.822656, 3.526677, 1, 1, 1, 1, 1,
0.4932702, -0.3662039, 2.111757, 1, 1, 1, 1, 1,
0.4945872, -0.3982907, 2.380535, 1, 1, 1, 1, 1,
0.4948478, -0.5970115, 0.7295781, 1, 1, 1, 1, 1,
0.4959184, 0.1240776, 0.4182829, 1, 1, 1, 1, 1,
0.4962018, -0.7865629, 4.69164, 1, 1, 1, 1, 1,
0.4963683, 1.810916, 0.08885913, 0, 0, 1, 1, 1,
0.4976668, -0.9250371, 2.255356, 1, 0, 0, 1, 1,
0.4997765, -0.5388837, 1.610057, 1, 0, 0, 1, 1,
0.5000045, -0.2350589, 1.819534, 1, 0, 0, 1, 1,
0.5019165, 0.03411116, 0.2157983, 1, 0, 0, 1, 1,
0.5058741, 0.3211952, 1.040573, 1, 0, 0, 1, 1,
0.5061293, 1.149108, 0.4368484, 0, 0, 0, 1, 1,
0.5079718, 1.72621, 1.95511, 0, 0, 0, 1, 1,
0.5122824, -0.1273089, 2.486799, 0, 0, 0, 1, 1,
0.514012, -1.560279, 3.890381, 0, 0, 0, 1, 1,
0.5151931, 0.1219197, 2.830423, 0, 0, 0, 1, 1,
0.5152404, 0.02025597, 1.025444, 0, 0, 0, 1, 1,
0.519608, 0.2389513, -0.2178266, 0, 0, 0, 1, 1,
0.522986, 1.771948, 0.04274906, 1, 1, 1, 1, 1,
0.5295086, -0.2367099, 2.752813, 1, 1, 1, 1, 1,
0.5310009, 0.1775867, 1.234554, 1, 1, 1, 1, 1,
0.5310287, -0.1685169, 1.634753, 1, 1, 1, 1, 1,
0.5314752, -0.6670551, 3.566314, 1, 1, 1, 1, 1,
0.5341656, 1.061336, 2.550549, 1, 1, 1, 1, 1,
0.5409429, -0.1301127, 2.918701, 1, 1, 1, 1, 1,
0.545309, 0.8969165, -0.7982971, 1, 1, 1, 1, 1,
0.547981, -0.5085981, 1.211858, 1, 1, 1, 1, 1,
0.5507481, 1.003725, -1.606926, 1, 1, 1, 1, 1,
0.5514994, 0.3515435, 4.166729, 1, 1, 1, 1, 1,
0.5528167, 0.9476402, 1.535938, 1, 1, 1, 1, 1,
0.558928, -0.952085, 3.648152, 1, 1, 1, 1, 1,
0.5639298, -0.1178021, 1.515592, 1, 1, 1, 1, 1,
0.5651723, -1.80367, 3.481274, 1, 1, 1, 1, 1,
0.5692413, 0.1577939, 2.309511, 0, 0, 1, 1, 1,
0.5763106, 0.4333093, 1.815071, 1, 0, 0, 1, 1,
0.5788625, -1.500052, 2.48019, 1, 0, 0, 1, 1,
0.5791451, 0.7037744, 1.766251, 1, 0, 0, 1, 1,
0.5863696, 0.3662251, 1.362915, 1, 0, 0, 1, 1,
0.5979326, 0.6281949, 2.658916, 1, 0, 0, 1, 1,
0.5981537, -1.203723, 3.737086, 0, 0, 0, 1, 1,
0.6004161, 1.117649, 1.921576, 0, 0, 0, 1, 1,
0.6027556, -0.2752744, 3.339734, 0, 0, 0, 1, 1,
0.6036207, -0.04221366, -1.206061, 0, 0, 0, 1, 1,
0.6039515, -0.4611067, 3.027682, 0, 0, 0, 1, 1,
0.6039734, -0.6246751, 3.432113, 0, 0, 0, 1, 1,
0.6045262, -0.9465578, 3.91571, 0, 0, 0, 1, 1,
0.6125341, 0.9231789, -0.3438293, 1, 1, 1, 1, 1,
0.6157573, -0.1179258, 2.975079, 1, 1, 1, 1, 1,
0.6210558, -1.138654, 2.613876, 1, 1, 1, 1, 1,
0.621056, -1.363551, 1.966134, 1, 1, 1, 1, 1,
0.6222175, -0.3699845, 2.103308, 1, 1, 1, 1, 1,
0.6255832, 1.541718, 0.01938967, 1, 1, 1, 1, 1,
0.6284984, 2.310048, -0.8716149, 1, 1, 1, 1, 1,
0.6311978, -1.916011, 3.912539, 1, 1, 1, 1, 1,
0.6333297, 1.235181, 1.296337, 1, 1, 1, 1, 1,
0.6350698, 1.155587, 1.27736, 1, 1, 1, 1, 1,
0.6354959, -0.1931878, 2.270941, 1, 1, 1, 1, 1,
0.6364371, 0.2271319, -0.06795945, 1, 1, 1, 1, 1,
0.6493282, 0.5453805, 0.935924, 1, 1, 1, 1, 1,
0.6495914, -1.326197, 2.628992, 1, 1, 1, 1, 1,
0.6529792, -0.5262191, 2.257676, 1, 1, 1, 1, 1,
0.6535078, -0.8681936, 1.517118, 0, 0, 1, 1, 1,
0.6560793, 0.9140452, 0.8410918, 1, 0, 0, 1, 1,
0.6618462, 1.182463, -0.1078054, 1, 0, 0, 1, 1,
0.6670719, 0.4244059, 1.849982, 1, 0, 0, 1, 1,
0.6749141, -0.7476489, 4.967478, 1, 0, 0, 1, 1,
0.6763411, -0.4750473, 2.936985, 1, 0, 0, 1, 1,
0.6778411, 0.2563098, 1.099636, 0, 0, 0, 1, 1,
0.6840519, -0.7758904, 3.876171, 0, 0, 0, 1, 1,
0.6844859, -0.3110567, 1.287461, 0, 0, 0, 1, 1,
0.6864052, -0.09287752, 3.364899, 0, 0, 0, 1, 1,
0.6868011, -0.7832487, 3.444587, 0, 0, 0, 1, 1,
0.6892028, -1.143234, 2.245872, 0, 0, 0, 1, 1,
0.6917838, -0.767647, 2.695574, 0, 0, 0, 1, 1,
0.6928273, 1.236616, 1.751614, 1, 1, 1, 1, 1,
0.696289, -0.03295167, 2.660148, 1, 1, 1, 1, 1,
0.7028019, 0.2627484, -0.05595261, 1, 1, 1, 1, 1,
0.7056271, 0.898576, 0.6550564, 1, 1, 1, 1, 1,
0.7061507, 0.04822416, 0.8690356, 1, 1, 1, 1, 1,
0.7101574, -1.623369, 3.956623, 1, 1, 1, 1, 1,
0.7137285, -0.1505138, 0.8341187, 1, 1, 1, 1, 1,
0.7144317, 2.293143, 2.338107, 1, 1, 1, 1, 1,
0.7144434, 0.9157221, -0.6251403, 1, 1, 1, 1, 1,
0.7215921, 0.3829993, 2.166954, 1, 1, 1, 1, 1,
0.7239737, -0.5501271, 3.175204, 1, 1, 1, 1, 1,
0.7270728, 1.602461, 1.691776, 1, 1, 1, 1, 1,
0.7299119, -0.1961052, 2.700424, 1, 1, 1, 1, 1,
0.7313192, 0.2302379, 0.8785997, 1, 1, 1, 1, 1,
0.7319741, -0.704456, 3.042424, 1, 1, 1, 1, 1,
0.7356566, -0.4330207, 3.262844, 0, 0, 1, 1, 1,
0.7397742, 0.3999246, 1.420041, 1, 0, 0, 1, 1,
0.742498, -0.2518636, 2.664986, 1, 0, 0, 1, 1,
0.7437676, 0.9284066, 1.131397, 1, 0, 0, 1, 1,
0.7455145, -0.8622059, 3.403901, 1, 0, 0, 1, 1,
0.7461469, 0.797758, 1.58451, 1, 0, 0, 1, 1,
0.7496399, -0.8567876, 0.5659739, 0, 0, 0, 1, 1,
0.7620811, 0.5843288, 1.282289, 0, 0, 0, 1, 1,
0.7713063, 0.02494401, 1.097057, 0, 0, 0, 1, 1,
0.7725486, 0.2896107, 1.959342, 0, 0, 0, 1, 1,
0.7774145, -0.2542385, 2.444967, 0, 0, 0, 1, 1,
0.7774734, -0.207317, 1.540777, 0, 0, 0, 1, 1,
0.778806, 0.4116994, 0.5372614, 0, 0, 0, 1, 1,
0.7806883, 0.1941157, 1.316995, 1, 1, 1, 1, 1,
0.7816545, -0.1583397, 2.279974, 1, 1, 1, 1, 1,
0.7861931, 0.2964204, 0.7989469, 1, 1, 1, 1, 1,
0.7874843, -1.13509, 3.568016, 1, 1, 1, 1, 1,
0.7893916, 0.9174824, 0.3838041, 1, 1, 1, 1, 1,
0.7910898, -0.3630639, 2.87569, 1, 1, 1, 1, 1,
0.7941608, 1.845493, 0.8471769, 1, 1, 1, 1, 1,
0.8041435, 1.684898, 1.546529, 1, 1, 1, 1, 1,
0.8055915, 0.307456, 0.5676101, 1, 1, 1, 1, 1,
0.8106402, 1.130421, 0.08579624, 1, 1, 1, 1, 1,
0.8228074, -0.7921419, 1.897392, 1, 1, 1, 1, 1,
0.8248398, 2.036944, 1.111812, 1, 1, 1, 1, 1,
0.8249139, -0.4004253, -0.2386677, 1, 1, 1, 1, 1,
0.8354064, 1.472583, 0.3761607, 1, 1, 1, 1, 1,
0.8464016, -0.651823, 3.090485, 1, 1, 1, 1, 1,
0.8554614, -1.08598, 1.589586, 0, 0, 1, 1, 1,
0.8599129, -0.2008985, 3.411294, 1, 0, 0, 1, 1,
0.864669, 1.926811, 0.3773535, 1, 0, 0, 1, 1,
0.8665661, 0.04052196, 1.795435, 1, 0, 0, 1, 1,
0.8729896, 1.859784, -1.985634, 1, 0, 0, 1, 1,
0.8745433, -0.2817951, 0.8349468, 1, 0, 0, 1, 1,
0.8766338, -1.332312, 4.325563, 0, 0, 0, 1, 1,
0.8881045, -0.269174, 1.402307, 0, 0, 0, 1, 1,
0.8883209, 0.1599498, 2.531364, 0, 0, 0, 1, 1,
0.9004056, -1.325305, 2.932517, 0, 0, 0, 1, 1,
0.9092659, -0.09627877, 1.591792, 0, 0, 0, 1, 1,
0.9127228, 0.8522419, -0.5234115, 0, 0, 0, 1, 1,
0.9163595, 0.08855239, 1.474134, 0, 0, 0, 1, 1,
0.9192085, -0.9963333, 1.08123, 1, 1, 1, 1, 1,
0.9195914, -0.8257728, 1.281165, 1, 1, 1, 1, 1,
0.9218863, -1.805587, 4.671663, 1, 1, 1, 1, 1,
0.9241365, 1.588285, -0.9822409, 1, 1, 1, 1, 1,
0.9275485, 1.182211, -0.1688449, 1, 1, 1, 1, 1,
0.9281129, 0.8063334, 0.5922353, 1, 1, 1, 1, 1,
0.9360456, 0.2145139, 1.79103, 1, 1, 1, 1, 1,
0.9376203, 0.8791735, -0.2242252, 1, 1, 1, 1, 1,
0.944734, 1.020834, 2.104476, 1, 1, 1, 1, 1,
0.9511789, 1.344444, 1.429609, 1, 1, 1, 1, 1,
0.951368, 1.349002, 1.006322, 1, 1, 1, 1, 1,
0.9638331, -1.761217, 3.438624, 1, 1, 1, 1, 1,
0.9682965, 0.4109974, 1.638333, 1, 1, 1, 1, 1,
0.9725055, -0.8177905, 2.779318, 1, 1, 1, 1, 1,
0.9747018, 1.416389, 0.8802022, 1, 1, 1, 1, 1,
0.9752007, -0.5557711, 3.928344, 0, 0, 1, 1, 1,
0.9789214, 0.6602608, 0.751866, 1, 0, 0, 1, 1,
0.9816791, -1.177904, 2.482621, 1, 0, 0, 1, 1,
0.9859127, 1.654721, 1.227039, 1, 0, 0, 1, 1,
0.9882796, -0.2492315, 1.071246, 1, 0, 0, 1, 1,
0.9954017, 0.8800238, 0.7575797, 1, 0, 0, 1, 1,
1.001104, 0.4132196, 3.455028, 0, 0, 0, 1, 1,
1.019825, -2.140197, 2.638333, 0, 0, 0, 1, 1,
1.021718, 0.9359077, 0.2317147, 0, 0, 0, 1, 1,
1.032644, 0.0775604, 1.535141, 0, 0, 0, 1, 1,
1.034187, 1.420133, -0.4479991, 0, 0, 0, 1, 1,
1.034293, 0.4598176, 0.901467, 0, 0, 0, 1, 1,
1.038473, -1.541892, 1.635598, 0, 0, 0, 1, 1,
1.043913, 2.233354, 0.421405, 1, 1, 1, 1, 1,
1.047544, -0.5134293, 2.691042, 1, 1, 1, 1, 1,
1.051195, 0.4968196, 0.9701585, 1, 1, 1, 1, 1,
1.058905, 0.1714917, 0.5168042, 1, 1, 1, 1, 1,
1.059223, -0.6614066, 2.936442, 1, 1, 1, 1, 1,
1.07696, -1.66919, 2.595279, 1, 1, 1, 1, 1,
1.080435, 1.79228, -0.5950667, 1, 1, 1, 1, 1,
1.082096, -1.100737, 1.931314, 1, 1, 1, 1, 1,
1.08578, 0.8968188, 2.378553, 1, 1, 1, 1, 1,
1.085829, -0.7438884, 1.052058, 1, 1, 1, 1, 1,
1.088449, -0.446162, 1.91193, 1, 1, 1, 1, 1,
1.089666, 0.07157011, 2.018298, 1, 1, 1, 1, 1,
1.099471, -0.05597412, 1.422856, 1, 1, 1, 1, 1,
1.099967, -0.4859336, 2.913588, 1, 1, 1, 1, 1,
1.107021, -1.227115, 2.944327, 1, 1, 1, 1, 1,
1.11327, 0.4561182, 0.9286553, 0, 0, 1, 1, 1,
1.119691, -0.2625275, 0.6938709, 1, 0, 0, 1, 1,
1.120555, 0.0805983, 0.01639254, 1, 0, 0, 1, 1,
1.120604, 0.672612, -0.04219994, 1, 0, 0, 1, 1,
1.120925, 3.404268, 0.3615056, 1, 0, 0, 1, 1,
1.121587, -0.5197687, 1.281463, 1, 0, 0, 1, 1,
1.131911, -0.437009, 2.632569, 0, 0, 0, 1, 1,
1.138397, -0.8358451, 4.21626, 0, 0, 0, 1, 1,
1.153074, -0.8052214, 1.817657, 0, 0, 0, 1, 1,
1.156085, -1.738229, 2.952373, 0, 0, 0, 1, 1,
1.160928, 0.3594109, 2.083293, 0, 0, 0, 1, 1,
1.164267, 0.8498818, 0.8012021, 0, 0, 0, 1, 1,
1.16464, -0.9218636, 1.974505, 0, 0, 0, 1, 1,
1.169559, -0.1751657, 0.8448461, 1, 1, 1, 1, 1,
1.173424, -0.2773151, 2.368555, 1, 1, 1, 1, 1,
1.178803, -0.9284618, 3.077467, 1, 1, 1, 1, 1,
1.17935, -0.4871361, 2.876997, 1, 1, 1, 1, 1,
1.179861, -0.5571519, 2.876315, 1, 1, 1, 1, 1,
1.183924, 0.4864689, 0.4902682, 1, 1, 1, 1, 1,
1.193733, -0.3054372, 1.485248, 1, 1, 1, 1, 1,
1.195468, -1.028344, 1.502238, 1, 1, 1, 1, 1,
1.202544, 2.254435, 2.090872, 1, 1, 1, 1, 1,
1.206868, 0.3568244, 3.721746, 1, 1, 1, 1, 1,
1.210093, 0.3015989, 1.868533, 1, 1, 1, 1, 1,
1.218646, -0.7913294, 2.019391, 1, 1, 1, 1, 1,
1.221627, 0.4918093, 0.3520561, 1, 1, 1, 1, 1,
1.225661, 0.6004516, 0.6542795, 1, 1, 1, 1, 1,
1.230699, 0.9358755, 2.696683, 1, 1, 1, 1, 1,
1.235288, 0.821104, 0.3424885, 0, 0, 1, 1, 1,
1.238501, 0.4087567, 0.940915, 1, 0, 0, 1, 1,
1.248324, -1.033926, 1.429376, 1, 0, 0, 1, 1,
1.255147, 1.089907, 1.823278, 1, 0, 0, 1, 1,
1.259217, -0.01792268, 3.808399, 1, 0, 0, 1, 1,
1.263696, 0.02059596, 2.358931, 1, 0, 0, 1, 1,
1.278423, 1.145301, 0.3312029, 0, 0, 0, 1, 1,
1.293688, -1.079401, 4.400868, 0, 0, 0, 1, 1,
1.295898, 1.52557, 1.15222, 0, 0, 0, 1, 1,
1.308456, 0.1789835, 1.338052, 0, 0, 0, 1, 1,
1.309762, -0.3509764, 0.8897755, 0, 0, 0, 1, 1,
1.322184, 1.140415, 2.362375, 0, 0, 0, 1, 1,
1.32719, 0.6885228, 0.3344743, 0, 0, 0, 1, 1,
1.330367, -1.491622, 2.996707, 1, 1, 1, 1, 1,
1.332803, 1.081298, 2.018602, 1, 1, 1, 1, 1,
1.339679, -0.4651866, 1.586645, 1, 1, 1, 1, 1,
1.340876, 0.05864402, 0.7632639, 1, 1, 1, 1, 1,
1.34655, 0.8064116, 0.9270888, 1, 1, 1, 1, 1,
1.348044, -0.1432706, 3.136803, 1, 1, 1, 1, 1,
1.354557, -0.4822478, 1.835685, 1, 1, 1, 1, 1,
1.355374, 1.73707, 1.88523, 1, 1, 1, 1, 1,
1.367343, 1.617579, -0.3817429, 1, 1, 1, 1, 1,
1.370667, -0.3125542, 2.930295, 1, 1, 1, 1, 1,
1.373049, 1.08759, 0.8124102, 1, 1, 1, 1, 1,
1.382506, -0.4331978, 2.35477, 1, 1, 1, 1, 1,
1.394074, -0.1040013, 1.160241, 1, 1, 1, 1, 1,
1.40528, -0.6770096, 1.650725, 1, 1, 1, 1, 1,
1.411994, -0.1450846, 0.4602174, 1, 1, 1, 1, 1,
1.415547, -2.007821, 1.620467, 0, 0, 1, 1, 1,
1.431319, 0.4619227, 0.1640971, 1, 0, 0, 1, 1,
1.431988, 0.4310673, 2.201018, 1, 0, 0, 1, 1,
1.43215, -0.8074528, 1.08234, 1, 0, 0, 1, 1,
1.443777, -0.5190257, 2.872587, 1, 0, 0, 1, 1,
1.449534, 1.158605, 1.674646, 1, 0, 0, 1, 1,
1.452403, 0.5696355, 1.602638, 0, 0, 0, 1, 1,
1.455781, 0.435722, -0.3299726, 0, 0, 0, 1, 1,
1.461059, 0.0427544, 3.41627, 0, 0, 0, 1, 1,
1.476347, 1.494402, 0.6152105, 0, 0, 0, 1, 1,
1.481165, -0.5414674, 1.102779, 0, 0, 0, 1, 1,
1.495197, 0.14738, 1.421035, 0, 0, 0, 1, 1,
1.500455, 1.429801, 1.588295, 0, 0, 0, 1, 1,
1.504122, -0.8895341, 0.210287, 1, 1, 1, 1, 1,
1.504423, -0.4925402, 3.135962, 1, 1, 1, 1, 1,
1.518389, 0.8265017, 0.4603541, 1, 1, 1, 1, 1,
1.521189, 0.6423429, 1.7457, 1, 1, 1, 1, 1,
1.552188, -0.9971148, 1.725434, 1, 1, 1, 1, 1,
1.553265, -0.007057345, 1.817658, 1, 1, 1, 1, 1,
1.554457, -0.006589388, 1.282708, 1, 1, 1, 1, 1,
1.566772, -1.777219, 1.499763, 1, 1, 1, 1, 1,
1.576752, -0.4148685, 0.1558498, 1, 1, 1, 1, 1,
1.57754, -1.822958, 2.683284, 1, 1, 1, 1, 1,
1.582862, 0.0439287, 3.431937, 1, 1, 1, 1, 1,
1.584761, -1.568717, 2.653684, 1, 1, 1, 1, 1,
1.588946, 0.04720532, 2.244781, 1, 1, 1, 1, 1,
1.595068, -1.231902, 3.618354, 1, 1, 1, 1, 1,
1.603015, 2.064959, 0.3432352, 1, 1, 1, 1, 1,
1.605886, -0.821541, 2.823536, 0, 0, 1, 1, 1,
1.631843, -1.901152, 1.57949, 1, 0, 0, 1, 1,
1.637587, -1.671327, 3.990255, 1, 0, 0, 1, 1,
1.645822, -0.5133193, 2.632706, 1, 0, 0, 1, 1,
1.690366, -0.07227637, -1.215977, 1, 0, 0, 1, 1,
1.692872, 1.274218, 1.074696, 1, 0, 0, 1, 1,
1.707599, 2.191716, 0.452879, 0, 0, 0, 1, 1,
1.708076, -0.2135289, 2.652058, 0, 0, 0, 1, 1,
1.70925, 1.098769, 0.0467686, 0, 0, 0, 1, 1,
1.724729, -1.299551, 1.486955, 0, 0, 0, 1, 1,
1.725763, -0.4074841, 0.7100754, 0, 0, 0, 1, 1,
1.735572, 0.2444409, 0.1410634, 0, 0, 0, 1, 1,
1.74276, -0.5336693, 3.614434, 0, 0, 0, 1, 1,
1.744918, 0.05278595, 1.159258, 1, 1, 1, 1, 1,
1.752565, 0.2891631, 0.9929677, 1, 1, 1, 1, 1,
1.770482, 0.08501683, 0.9626371, 1, 1, 1, 1, 1,
1.777733, 0.5948679, 3.465141, 1, 1, 1, 1, 1,
1.778403, 0.1620855, 2.073156, 1, 1, 1, 1, 1,
1.795101, -1.255223, 1.426182, 1, 1, 1, 1, 1,
1.797691, -0.7561118, 1.542338, 1, 1, 1, 1, 1,
1.804193, -0.730123, 1.218884, 1, 1, 1, 1, 1,
1.817779, 0.2208949, 2.161106, 1, 1, 1, 1, 1,
1.820158, 0.2430997, 1.923105, 1, 1, 1, 1, 1,
1.845698, 0.8807436, 2.544309, 1, 1, 1, 1, 1,
1.885408, -1.037736, 3.632516, 1, 1, 1, 1, 1,
1.894005, 1.224559, 0.03199365, 1, 1, 1, 1, 1,
1.901047, 1.019957, 1.45506, 1, 1, 1, 1, 1,
1.92199, 0.4959787, 1.06463, 1, 1, 1, 1, 1,
1.96349, 0.5572386, 1.499528, 0, 0, 1, 1, 1,
1.979474, 1.420291, 0.450778, 1, 0, 0, 1, 1,
1.990605, -0.3950447, 0.8482217, 1, 0, 0, 1, 1,
2.010244, 0.1460161, 1.530381, 1, 0, 0, 1, 1,
2.02744, 1.349821, 1.37234, 1, 0, 0, 1, 1,
2.043981, 1.601453, 1.707409, 1, 0, 0, 1, 1,
2.053547, 0.4962485, 0.8405688, 0, 0, 0, 1, 1,
2.069828, 0.8622175, 0.1188564, 0, 0, 0, 1, 1,
2.079789, -0.9957554, 3.469576, 0, 0, 0, 1, 1,
2.228065, 1.999465, 0.5459929, 0, 0, 0, 1, 1,
2.232503, -0.93132, 1.509208, 0, 0, 0, 1, 1,
2.263451, 1.038656, 1.483451, 0, 0, 0, 1, 1,
2.311792, -0.04282641, 3.165328, 0, 0, 0, 1, 1,
2.509945, 2.369563, -0.3741042, 1, 1, 1, 1, 1,
2.531143, -0.4431323, 2.387751, 1, 1, 1, 1, 1,
2.596447, 0.9263105, 1.938824, 1, 1, 1, 1, 1,
2.715707, -1.50441, 2.693209, 1, 1, 1, 1, 1,
2.796996, -0.1559486, 1.140049, 1, 1, 1, 1, 1,
2.899899, -0.3480608, 2.616896, 1, 1, 1, 1, 1,
2.95497, 0.2125921, 1.938712, 1, 1, 1, 1, 1
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
var radius = 9.620098;
var distance = 33.79018;
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
mvMatrix.translate( -0.02433157, -0.0818007, 0.1761293 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.79018);
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