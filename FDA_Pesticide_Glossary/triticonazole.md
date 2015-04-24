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
-3.460581, -0.07711617, -0.5828796, 1, 0, 0, 1,
-3.175588, -0.7758513, -2.328214, 1, 0.007843138, 0, 1,
-3.171735, -0.3658352, -1.05741, 1, 0.01176471, 0, 1,
-3.107865, -0.03022119, 0.3113352, 1, 0.01960784, 0, 1,
-2.921163, 1.178988, -1.62604, 1, 0.02352941, 0, 1,
-2.815537, 0.1247288, -0.5162864, 1, 0.03137255, 0, 1,
-2.710053, -0.2993859, -2.448424, 1, 0.03529412, 0, 1,
-2.66209, -0.009107522, 0.4528507, 1, 0.04313726, 0, 1,
-2.615041, 1.165034, -1.589599, 1, 0.04705882, 0, 1,
-2.59455, -0.5546693, -1.585281, 1, 0.05490196, 0, 1,
-2.522953, -0.4610996, -2.563061, 1, 0.05882353, 0, 1,
-2.515433, -0.09152697, -1.106692, 1, 0.06666667, 0, 1,
-2.450304, 0.9520367, 0.3258336, 1, 0.07058824, 0, 1,
-2.404755, -0.9134561, -1.520729, 1, 0.07843138, 0, 1,
-2.360792, 0.2896584, -1.782195, 1, 0.08235294, 0, 1,
-2.333051, -0.5465118, -0.6301491, 1, 0.09019608, 0, 1,
-2.178125, 0.546846, -0.06863972, 1, 0.09411765, 0, 1,
-2.173031, 0.2784707, -1.214281, 1, 0.1019608, 0, 1,
-2.169354, -0.4004633, -2.288033, 1, 0.1098039, 0, 1,
-2.163824, -1.126543, -2.241114, 1, 0.1137255, 0, 1,
-2.161792, -0.3875746, -2.188881, 1, 0.1215686, 0, 1,
-2.139202, 0.1989998, -0.7594396, 1, 0.1254902, 0, 1,
-2.134356, -0.1293713, -1.940099, 1, 0.1333333, 0, 1,
-2.115957, 0.303663, -2.021932, 1, 0.1372549, 0, 1,
-2.110285, 0.2670303, -0.5426338, 1, 0.145098, 0, 1,
-2.109634, 1.008675, 0.4434274, 1, 0.1490196, 0, 1,
-2.100756, 0.4320371, -0.5319319, 1, 0.1568628, 0, 1,
-2.084308, 0.4877984, -1.561252, 1, 0.1607843, 0, 1,
-2.035665, -0.6498463, -1.390214, 1, 0.1686275, 0, 1,
-2.024391, -1.423164, -2.392636, 1, 0.172549, 0, 1,
-1.988529, 2.576712, -1.680885, 1, 0.1803922, 0, 1,
-1.927201, -0.6223681, -0.8795254, 1, 0.1843137, 0, 1,
-1.900981, -0.8878978, -1.545889, 1, 0.1921569, 0, 1,
-1.897845, -0.9411652, -2.473449, 1, 0.1960784, 0, 1,
-1.892971, 2.431072, -0.8212465, 1, 0.2039216, 0, 1,
-1.875862, -0.4099643, -1.080377, 1, 0.2117647, 0, 1,
-1.852766, -0.02325187, -3.187151, 1, 0.2156863, 0, 1,
-1.844151, -0.352488, -3.209673, 1, 0.2235294, 0, 1,
-1.826515, 1.92783, -1.259027, 1, 0.227451, 0, 1,
-1.823705, -0.9787709, -2.143489, 1, 0.2352941, 0, 1,
-1.810192, 0.9543762, -1.214149, 1, 0.2392157, 0, 1,
-1.799378, 1.389793, -1.323746, 1, 0.2470588, 0, 1,
-1.79388, -0.2933624, -3.038088, 1, 0.2509804, 0, 1,
-1.776811, 0.4421124, 0.9449885, 1, 0.2588235, 0, 1,
-1.769355, -0.6684733, -0.7325049, 1, 0.2627451, 0, 1,
-1.768248, 0.7772346, -2.410185, 1, 0.2705882, 0, 1,
-1.733414, 0.2317626, -1.238124, 1, 0.2745098, 0, 1,
-1.721176, -0.1788092, -1.907405, 1, 0.282353, 0, 1,
-1.715243, 1.266397, 0.6507787, 1, 0.2862745, 0, 1,
-1.703712, 0.7029608, -0.3032409, 1, 0.2941177, 0, 1,
-1.689465, 0.09865477, -0.833567, 1, 0.3019608, 0, 1,
-1.689317, -0.5917677, -2.473667, 1, 0.3058824, 0, 1,
-1.688562, -0.9234399, -2.453064, 1, 0.3137255, 0, 1,
-1.683605, -0.8166999, -2.799578, 1, 0.3176471, 0, 1,
-1.671231, 0.5000815, -1.71171, 1, 0.3254902, 0, 1,
-1.655579, -0.2878437, -1.046789, 1, 0.3294118, 0, 1,
-1.627029, -0.3575611, -1.234763, 1, 0.3372549, 0, 1,
-1.624736, 0.5469802, -0.362883, 1, 0.3411765, 0, 1,
-1.618598, -0.05583137, -2.402148, 1, 0.3490196, 0, 1,
-1.599966, 0.7205798, -2.679642, 1, 0.3529412, 0, 1,
-1.586533, 2.554116, 1.052358, 1, 0.3607843, 0, 1,
-1.575788, 0.7538226, -1.044418, 1, 0.3647059, 0, 1,
-1.559688, -0.7700675, -1.578717, 1, 0.372549, 0, 1,
-1.550124, -0.1478845, -1.719381, 1, 0.3764706, 0, 1,
-1.53881, -0.2854054, -2.199011, 1, 0.3843137, 0, 1,
-1.535603, -0.5698666, -2.005819, 1, 0.3882353, 0, 1,
-1.531171, -0.6947542, -2.17207, 1, 0.3960784, 0, 1,
-1.519921, 0.3864926, -1.217374, 1, 0.4039216, 0, 1,
-1.519225, -0.5047672, -2.656419, 1, 0.4078431, 0, 1,
-1.502651, 0.4092017, -2.887616, 1, 0.4156863, 0, 1,
-1.49403, -0.01977785, -1.689445, 1, 0.4196078, 0, 1,
-1.484961, -0.3732035, -3.001999, 1, 0.427451, 0, 1,
-1.483459, -0.4043589, -4.200339, 1, 0.4313726, 0, 1,
-1.474092, 1.094938, -1.135417, 1, 0.4392157, 0, 1,
-1.471069, -0.4737964, -3.802054, 1, 0.4431373, 0, 1,
-1.469482, 2.377603, 0.7750418, 1, 0.4509804, 0, 1,
-1.46034, 0.2244912, -2.066189, 1, 0.454902, 0, 1,
-1.460125, -2.221205, -3.840429, 1, 0.4627451, 0, 1,
-1.451177, -0.4777705, -1.44787, 1, 0.4666667, 0, 1,
-1.44718, -0.3287719, -3.190449, 1, 0.4745098, 0, 1,
-1.441887, -0.0695141, -2.352597, 1, 0.4784314, 0, 1,
-1.439593, -0.2686939, -1.03641, 1, 0.4862745, 0, 1,
-1.437481, 0.4605136, -1.174649, 1, 0.4901961, 0, 1,
-1.430911, 1.353337, 0.09162709, 1, 0.4980392, 0, 1,
-1.430438, 1.45359, 0.02401103, 1, 0.5058824, 0, 1,
-1.420509, -0.09024555, -1.234386, 1, 0.509804, 0, 1,
-1.408136, -1.424943, -3.494673, 1, 0.5176471, 0, 1,
-1.407871, -0.2178937, -0.6377189, 1, 0.5215687, 0, 1,
-1.400764, -0.8152325, -3.918955, 1, 0.5294118, 0, 1,
-1.397696, -0.539582, -1.230147, 1, 0.5333334, 0, 1,
-1.384885, 0.04666721, -0.1509905, 1, 0.5411765, 0, 1,
-1.384678, 1.140658, -0.5626622, 1, 0.5450981, 0, 1,
-1.376893, 0.2899722, -1.896176, 1, 0.5529412, 0, 1,
-1.368247, -0.1900202, -0.8022062, 1, 0.5568628, 0, 1,
-1.36341, 2.119557, 1.250134, 1, 0.5647059, 0, 1,
-1.362655, 0.02472812, -1.787393, 1, 0.5686275, 0, 1,
-1.355909, 1.68556, -1.450096, 1, 0.5764706, 0, 1,
-1.350703, 0.5067192, -0.6745763, 1, 0.5803922, 0, 1,
-1.345595, 0.4325893, 0.4752389, 1, 0.5882353, 0, 1,
-1.341843, -1.717736, -4.129059, 1, 0.5921569, 0, 1,
-1.332024, -0.2988882, -1.532274, 1, 0.6, 0, 1,
-1.331312, -1.039147, -2.668794, 1, 0.6078432, 0, 1,
-1.326221, 0.4129056, -0.9319391, 1, 0.6117647, 0, 1,
-1.324772, -0.9392562, -2.831618, 1, 0.6196079, 0, 1,
-1.313775, 1.519645, -0.7121224, 1, 0.6235294, 0, 1,
-1.30638, -2.138012, -4.194496, 1, 0.6313726, 0, 1,
-1.279314, -0.9957501, -1.352909, 1, 0.6352941, 0, 1,
-1.278931, -0.2378144, -3.213492, 1, 0.6431373, 0, 1,
-1.277489, 0.4876802, -0.5566547, 1, 0.6470588, 0, 1,
-1.273476, 1.048456, -2.2752, 1, 0.654902, 0, 1,
-1.256446, 0.2919226, -1.309045, 1, 0.6588235, 0, 1,
-1.253052, -1.139716, -3.525578, 1, 0.6666667, 0, 1,
-1.251627, 0.08362383, -0.02599729, 1, 0.6705883, 0, 1,
-1.250558, 0.1894741, -2.028291, 1, 0.6784314, 0, 1,
-1.243793, 0.7657304, -2.308571, 1, 0.682353, 0, 1,
-1.240672, -0.8666751, -0.9071314, 1, 0.6901961, 0, 1,
-1.23877, -0.3138523, -2.289471, 1, 0.6941177, 0, 1,
-1.234131, 0.3718662, -1.649365, 1, 0.7019608, 0, 1,
-1.220012, 0.5187773, -0.652229, 1, 0.7098039, 0, 1,
-1.216322, -0.4338015, -3.516802, 1, 0.7137255, 0, 1,
-1.201889, -0.4004689, -1.311773, 1, 0.7215686, 0, 1,
-1.197154, -0.5793372, -1.566463, 1, 0.7254902, 0, 1,
-1.194706, 0.8870162, -0.7911498, 1, 0.7333333, 0, 1,
-1.190745, 0.8558762, -0.7149787, 1, 0.7372549, 0, 1,
-1.189107, 0.5981306, -1.256332, 1, 0.7450981, 0, 1,
-1.181476, -1.018463, -1.457384, 1, 0.7490196, 0, 1,
-1.170732, -0.8387271, -3.171759, 1, 0.7568628, 0, 1,
-1.162989, 1.810461, -0.8149241, 1, 0.7607843, 0, 1,
-1.161568, 0.4192136, -1.749699, 1, 0.7686275, 0, 1,
-1.147871, -0.8082692, -1.067076, 1, 0.772549, 0, 1,
-1.145851, 0.5489105, -0.5440772, 1, 0.7803922, 0, 1,
-1.138126, -2.193508, -4.829824, 1, 0.7843137, 0, 1,
-1.133109, 0.6331405, -0.2343408, 1, 0.7921569, 0, 1,
-1.127347, -0.5535843, -1.395657, 1, 0.7960784, 0, 1,
-1.126388, 1.511967, -0.3262455, 1, 0.8039216, 0, 1,
-1.124507, 0.3872217, -0.7754087, 1, 0.8117647, 0, 1,
-1.123662, 0.9377724, -0.3788573, 1, 0.8156863, 0, 1,
-1.102674, 1.997161, 0.5732614, 1, 0.8235294, 0, 1,
-1.09559, 0.6738893, -1.561692, 1, 0.827451, 0, 1,
-1.094594, 0.9604838, -1.311394, 1, 0.8352941, 0, 1,
-1.089595, 0.9052081, 0.2621258, 1, 0.8392157, 0, 1,
-1.087475, 0.05765006, -1.465568, 1, 0.8470588, 0, 1,
-1.082625, 0.05778149, -1.535439, 1, 0.8509804, 0, 1,
-1.080827, 0.4549427, -2.713157, 1, 0.8588235, 0, 1,
-1.075061, -0.1634471, -2.538803, 1, 0.8627451, 0, 1,
-1.066507, -0.5432888, 0.1420953, 1, 0.8705882, 0, 1,
-1.065202, 0.5148197, -0.1053518, 1, 0.8745098, 0, 1,
-1.059598, 0.7462105, -1.776658, 1, 0.8823529, 0, 1,
-1.056047, 2.13799, -2.666592, 1, 0.8862745, 0, 1,
-1.052748, -2.779523, -2.59914, 1, 0.8941177, 0, 1,
-1.050495, -2.759078, -3.122321, 1, 0.8980392, 0, 1,
-1.048665, -0.4494066, -0.9631104, 1, 0.9058824, 0, 1,
-1.04402, 1.612951, -1.17739, 1, 0.9137255, 0, 1,
-1.040786, -2.303985, -1.745803, 1, 0.9176471, 0, 1,
-1.03716, -1.751084, -4.388339, 1, 0.9254902, 0, 1,
-1.036986, -1.453363, -2.373824, 1, 0.9294118, 0, 1,
-1.033175, 0.1592256, -0.4948756, 1, 0.9372549, 0, 1,
-1.030542, 0.6983722, -0.2539693, 1, 0.9411765, 0, 1,
-1.029675, -0.512054, -1.952124, 1, 0.9490196, 0, 1,
-1.028206, 0.3992452, -3.124297, 1, 0.9529412, 0, 1,
-1.018665, -0.9933202, -3.144848, 1, 0.9607843, 0, 1,
-1.01558, -0.1137767, -1.090975, 1, 0.9647059, 0, 1,
-1.013144, -0.8955224, -1.991443, 1, 0.972549, 0, 1,
-1.007002, 1.237725, -1.600327, 1, 0.9764706, 0, 1,
-0.992792, -0.0628168, -2.301461, 1, 0.9843137, 0, 1,
-0.990752, -0.1992114, -1.29198, 1, 0.9882353, 0, 1,
-0.9860773, -0.3913823, -1.519043, 1, 0.9960784, 0, 1,
-0.983411, -1.445652, -4.813867, 0.9960784, 1, 0, 1,
-0.9825855, -0.4936379, -1.637072, 0.9921569, 1, 0, 1,
-0.9732599, -1.016877, -2.827553, 0.9843137, 1, 0, 1,
-0.9701042, 1.134423, -0.4009573, 0.9803922, 1, 0, 1,
-0.9614746, -1.016872, -3.147797, 0.972549, 1, 0, 1,
-0.9593902, 0.7165011, -1.613267, 0.9686275, 1, 0, 1,
-0.9569451, 0.2359039, -1.560958, 0.9607843, 1, 0, 1,
-0.9457909, -0.02902938, -1.645958, 0.9568627, 1, 0, 1,
-0.9451293, -0.6045359, -2.463845, 0.9490196, 1, 0, 1,
-0.9350818, 0.4519276, -2.189483, 0.945098, 1, 0, 1,
-0.9339349, 0.4264141, -2.109061, 0.9372549, 1, 0, 1,
-0.9336947, -0.4950217, -2.888237, 0.9333333, 1, 0, 1,
-0.9313334, -0.158523, -0.1946038, 0.9254902, 1, 0, 1,
-0.9267351, -0.3390103, -1.142514, 0.9215686, 1, 0, 1,
-0.9224725, -0.01847719, -0.4147409, 0.9137255, 1, 0, 1,
-0.9197022, -0.6557016, -2.696828, 0.9098039, 1, 0, 1,
-0.919642, -0.6554915, -1.419197, 0.9019608, 1, 0, 1,
-0.9191031, -0.5837301, -0.877094, 0.8941177, 1, 0, 1,
-0.9190189, -0.9842954, -2.130654, 0.8901961, 1, 0, 1,
-0.9161223, 0.1584942, -1.056211, 0.8823529, 1, 0, 1,
-0.9145419, -0.07005242, -1.067758, 0.8784314, 1, 0, 1,
-0.9073825, -0.1603697, -3.750342, 0.8705882, 1, 0, 1,
-0.9015952, 0.02891023, 0.6816394, 0.8666667, 1, 0, 1,
-0.8972777, -0.2950295, -1.439816, 0.8588235, 1, 0, 1,
-0.8912649, -1.88912, -1.495788, 0.854902, 1, 0, 1,
-0.8896767, 0.9290522, -1.526746, 0.8470588, 1, 0, 1,
-0.8888713, -0.8635074, -0.800953, 0.8431373, 1, 0, 1,
-0.8883384, -0.3401402, -2.494037, 0.8352941, 1, 0, 1,
-0.8799561, -1.518449, -3.327419, 0.8313726, 1, 0, 1,
-0.8794548, 0.709039, -1.488704, 0.8235294, 1, 0, 1,
-0.8752484, 0.4311082, -2.320828, 0.8196079, 1, 0, 1,
-0.8746263, 0.6504865, -0.5666081, 0.8117647, 1, 0, 1,
-0.871648, -1.049636, -1.617152, 0.8078431, 1, 0, 1,
-0.8709416, -0.07019676, -1.453494, 0.8, 1, 0, 1,
-0.8697356, 1.048316, -0.6879015, 0.7921569, 1, 0, 1,
-0.8695091, -0.05333538, -2.248138, 0.7882353, 1, 0, 1,
-0.8683781, 1.220495, -1.674075, 0.7803922, 1, 0, 1,
-0.8660784, 3.500193, -1.058096, 0.7764706, 1, 0, 1,
-0.8600478, -1.236691, -4.138686, 0.7686275, 1, 0, 1,
-0.8600301, -0.2578905, -1.053885, 0.7647059, 1, 0, 1,
-0.8590798, -1.127254, -2.547617, 0.7568628, 1, 0, 1,
-0.8578959, 0.8649298, -0.995318, 0.7529412, 1, 0, 1,
-0.8532314, -0.6612455, -1.593846, 0.7450981, 1, 0, 1,
-0.8520822, 0.1254644, -1.491888, 0.7411765, 1, 0, 1,
-0.8514267, -0.6976773, -2.202035, 0.7333333, 1, 0, 1,
-0.8494327, 0.2887587, -0.5521092, 0.7294118, 1, 0, 1,
-0.8419577, 1.101892, -1.243728, 0.7215686, 1, 0, 1,
-0.8383009, 1.303891, -1.809117, 0.7176471, 1, 0, 1,
-0.8372943, -0.7431332, -2.693563, 0.7098039, 1, 0, 1,
-0.8339189, -1.795347, -1.851776, 0.7058824, 1, 0, 1,
-0.8301929, 0.2140518, -1.694278, 0.6980392, 1, 0, 1,
-0.8136034, -1.403122, -1.486074, 0.6901961, 1, 0, 1,
-0.7994672, 0.7442794, 0.7625464, 0.6862745, 1, 0, 1,
-0.799153, -1.281545, -2.935254, 0.6784314, 1, 0, 1,
-0.7950689, -1.295569, -2.904679, 0.6745098, 1, 0, 1,
-0.794569, -0.4339483, -4.602526, 0.6666667, 1, 0, 1,
-0.7938066, 0.965992, -0.4462852, 0.6627451, 1, 0, 1,
-0.7899911, -1.192501, -2.438715, 0.654902, 1, 0, 1,
-0.7889687, 0.1217365, -2.691248, 0.6509804, 1, 0, 1,
-0.7884039, -0.4223374, -1.670473, 0.6431373, 1, 0, 1,
-0.7857462, 0.01852875, -2.987712, 0.6392157, 1, 0, 1,
-0.7853061, -1.372732, -3.39243, 0.6313726, 1, 0, 1,
-0.7830511, 0.3287357, -1.122615, 0.627451, 1, 0, 1,
-0.7827936, 0.1637432, -1.293083, 0.6196079, 1, 0, 1,
-0.7816913, 0.6956937, -0.9355917, 0.6156863, 1, 0, 1,
-0.7805278, -1.013665, -2.733069, 0.6078432, 1, 0, 1,
-0.7770278, -0.4494345, -1.960701, 0.6039216, 1, 0, 1,
-0.7769995, -1.273094, -3.104712, 0.5960785, 1, 0, 1,
-0.76828, -0.3958555, -1.337394, 0.5882353, 1, 0, 1,
-0.7671922, -0.7570725, -2.567886, 0.5843138, 1, 0, 1,
-0.7632601, 1.055888, 0.2028956, 0.5764706, 1, 0, 1,
-0.7608135, -0.7259662, -2.596196, 0.572549, 1, 0, 1,
-0.7566936, 0.6269395, -0.5142201, 0.5647059, 1, 0, 1,
-0.7529106, 0.3635575, -0.2317643, 0.5607843, 1, 0, 1,
-0.7525142, -1.827229, -2.224926, 0.5529412, 1, 0, 1,
-0.7450306, -2.18441, -3.751516, 0.5490196, 1, 0, 1,
-0.742309, -0.07397883, -3.320563, 0.5411765, 1, 0, 1,
-0.7273692, 1.479456, 0.5309962, 0.5372549, 1, 0, 1,
-0.7251132, 0.2226291, -0.6279178, 0.5294118, 1, 0, 1,
-0.7148114, -2.300311, -2.216414, 0.5254902, 1, 0, 1,
-0.7092546, 1.380517, -2.440445, 0.5176471, 1, 0, 1,
-0.6998835, 0.1599927, -2.192699, 0.5137255, 1, 0, 1,
-0.6986628, 0.3996382, -0.3072177, 0.5058824, 1, 0, 1,
-0.6912684, -0.032412, -3.562469, 0.5019608, 1, 0, 1,
-0.686817, 0.7139776, 0.08921647, 0.4941176, 1, 0, 1,
-0.6854647, 0.8042794, 0.05621131, 0.4862745, 1, 0, 1,
-0.6792217, -0.5116493, -2.308634, 0.4823529, 1, 0, 1,
-0.6754379, -0.24311, -1.046051, 0.4745098, 1, 0, 1,
-0.6726597, -0.3888997, -3.073311, 0.4705882, 1, 0, 1,
-0.6684867, -0.100115, -2.144923, 0.4627451, 1, 0, 1,
-0.6682256, 2.079781, -0.5422785, 0.4588235, 1, 0, 1,
-0.6671095, -0.54314, 0.155168, 0.4509804, 1, 0, 1,
-0.6647449, 1.374814, -0.6502624, 0.4470588, 1, 0, 1,
-0.6585198, -2.199507, -3.851307, 0.4392157, 1, 0, 1,
-0.6554375, -0.6040736, -1.503225, 0.4352941, 1, 0, 1,
-0.653339, 0.3675722, 0.1313259, 0.427451, 1, 0, 1,
-0.6509318, 0.4086892, 0.697794, 0.4235294, 1, 0, 1,
-0.6509132, -1.144573, -1.853951, 0.4156863, 1, 0, 1,
-0.6434804, 1.476101, -1.081558, 0.4117647, 1, 0, 1,
-0.6433051, 0.4828511, -1.941743, 0.4039216, 1, 0, 1,
-0.6403748, -0.03788068, -0.6469484, 0.3960784, 1, 0, 1,
-0.6393878, 2.198033, 1.216026, 0.3921569, 1, 0, 1,
-0.6371101, -0.7840865, -2.309421, 0.3843137, 1, 0, 1,
-0.635904, 0.4180288, 0.8400376, 0.3803922, 1, 0, 1,
-0.6354071, -1.063902, -2.301116, 0.372549, 1, 0, 1,
-0.6351907, -1.364027, -2.421034, 0.3686275, 1, 0, 1,
-0.6351586, 0.106754, 0.05479183, 0.3607843, 1, 0, 1,
-0.6279634, -0.4578145, -0.4712495, 0.3568628, 1, 0, 1,
-0.6237187, 0.2461134, -1.109702, 0.3490196, 1, 0, 1,
-0.6180064, 0.503801, -1.086766, 0.345098, 1, 0, 1,
-0.6157809, -0.8234184, -3.765132, 0.3372549, 1, 0, 1,
-0.6123993, 1.226926, -2.395554, 0.3333333, 1, 0, 1,
-0.6033749, -0.5234404, -2.008525, 0.3254902, 1, 0, 1,
-0.5984236, 2.787506, -0.5406076, 0.3215686, 1, 0, 1,
-0.5936719, -2.097751, -3.875158, 0.3137255, 1, 0, 1,
-0.5914809, 0.4016429, -1.202723, 0.3098039, 1, 0, 1,
-0.5911099, 0.02588463, -0.3273516, 0.3019608, 1, 0, 1,
-0.591032, 2.043078, 0.09662376, 0.2941177, 1, 0, 1,
-0.5884826, -0.4595212, -2.961256, 0.2901961, 1, 0, 1,
-0.5870425, -1.180544, -2.629049, 0.282353, 1, 0, 1,
-0.5830664, -0.8164669, -0.6223584, 0.2784314, 1, 0, 1,
-0.5799065, 0.6263676, -1.539039, 0.2705882, 1, 0, 1,
-0.5779482, -1.090544, -2.265767, 0.2666667, 1, 0, 1,
-0.5751433, 0.6926005, -0.8323635, 0.2588235, 1, 0, 1,
-0.5698733, -0.563706, -1.509216, 0.254902, 1, 0, 1,
-0.5695574, -2.749888, -3.122888, 0.2470588, 1, 0, 1,
-0.5655962, 0.133511, -0.1419982, 0.2431373, 1, 0, 1,
-0.5651594, 1.756205, 0.9561904, 0.2352941, 1, 0, 1,
-0.5594723, -0.6762319, -4.185648, 0.2313726, 1, 0, 1,
-0.5512109, 0.1946995, -0.3913396, 0.2235294, 1, 0, 1,
-0.5492732, 0.01360813, -2.3909, 0.2196078, 1, 0, 1,
-0.5472303, 0.8462729, -2.223062, 0.2117647, 1, 0, 1,
-0.5448583, 0.2202503, -0.117937, 0.2078431, 1, 0, 1,
-0.5443128, 2.154906, 0.5906568, 0.2, 1, 0, 1,
-0.5436342, 0.2405462, -2.611136, 0.1921569, 1, 0, 1,
-0.5357071, 0.4606616, -0.9428129, 0.1882353, 1, 0, 1,
-0.532944, -0.01986683, -0.8385308, 0.1803922, 1, 0, 1,
-0.5319619, -2.106967, -3.646174, 0.1764706, 1, 0, 1,
-0.5250039, 1.470941, -0.8972281, 0.1686275, 1, 0, 1,
-0.5162894, 0.3859583, -2.498867, 0.1647059, 1, 0, 1,
-0.514961, 1.003271, -2.220848, 0.1568628, 1, 0, 1,
-0.5110321, -1.871768, -2.744574, 0.1529412, 1, 0, 1,
-0.5053229, -0.2922877, -2.611327, 0.145098, 1, 0, 1,
-0.5040087, 1.482788, -0.9019452, 0.1411765, 1, 0, 1,
-0.5039174, -0.1191548, -0.2654613, 0.1333333, 1, 0, 1,
-0.4979281, 0.2632411, -0.8037076, 0.1294118, 1, 0, 1,
-0.4972895, 1.241665, -0.2130477, 0.1215686, 1, 0, 1,
-0.4950168, 0.4736732, -0.3508179, 0.1176471, 1, 0, 1,
-0.4814237, -0.3965381, -4.497714, 0.1098039, 1, 0, 1,
-0.4768713, -0.2060883, -3.104149, 0.1058824, 1, 0, 1,
-0.4745967, 2.220054, -0.2712028, 0.09803922, 1, 0, 1,
-0.4741618, 0.04715445, -1.015719, 0.09019608, 1, 0, 1,
-0.4672261, 0.8188837, 0.007062979, 0.08627451, 1, 0, 1,
-0.4666131, -0.7984237, -3.178805, 0.07843138, 1, 0, 1,
-0.4643685, -2.675738, -5.545646, 0.07450981, 1, 0, 1,
-0.460722, 0.518332, -0.008842923, 0.06666667, 1, 0, 1,
-0.4595493, -0.2884856, -2.170532, 0.0627451, 1, 0, 1,
-0.4580937, 1.129313, -0.8497499, 0.05490196, 1, 0, 1,
-0.4546663, -0.6361418, -2.527844, 0.05098039, 1, 0, 1,
-0.4505673, 2.323406, -1.985471, 0.04313726, 1, 0, 1,
-0.439844, 0.02830455, 0.7972801, 0.03921569, 1, 0, 1,
-0.4398067, -0.08467243, -2.191051, 0.03137255, 1, 0, 1,
-0.4390651, -0.7897255, -2.64057, 0.02745098, 1, 0, 1,
-0.4364558, -2.1712, -2.325239, 0.01960784, 1, 0, 1,
-0.4357886, -0.08343238, -2.219293, 0.01568628, 1, 0, 1,
-0.4351994, 1.177268, 1.421017, 0.007843138, 1, 0, 1,
-0.4337406, 0.7371097, 0.1582151, 0.003921569, 1, 0, 1,
-0.4331837, -1.628504, -2.406319, 0, 1, 0.003921569, 1,
-0.4311941, -2.623495, -2.947562, 0, 1, 0.01176471, 1,
-0.4305216, 0.1582033, -0.6164311, 0, 1, 0.01568628, 1,
-0.4253354, -0.9325115, -2.916711, 0, 1, 0.02352941, 1,
-0.4236928, -0.1734085, -2.616614, 0, 1, 0.02745098, 1,
-0.4209715, -0.03811034, -3.559317, 0, 1, 0.03529412, 1,
-0.4184469, 0.385609, -2.180511, 0, 1, 0.03921569, 1,
-0.4170933, -1.553393, -3.069301, 0, 1, 0.04705882, 1,
-0.4146295, -1.313706, -3.190983, 0, 1, 0.05098039, 1,
-0.4025063, -1.819402, -3.421341, 0, 1, 0.05882353, 1,
-0.4021481, -0.879594, -1.933911, 0, 1, 0.0627451, 1,
-0.4020316, -1.336997, -2.956062, 0, 1, 0.07058824, 1,
-0.4016926, -0.5986158, -1.896755, 0, 1, 0.07450981, 1,
-0.3997143, -0.02129361, -3.101743, 0, 1, 0.08235294, 1,
-0.3994469, 0.6904627, -1.399983, 0, 1, 0.08627451, 1,
-0.3960177, -0.4147385, -2.21815, 0, 1, 0.09411765, 1,
-0.3943874, -0.3329754, -2.014224, 0, 1, 0.1019608, 1,
-0.3932344, 0.7772794, -0.1605229, 0, 1, 0.1058824, 1,
-0.3900196, -1.502262, -3.449205, 0, 1, 0.1137255, 1,
-0.388492, 1.000719, 0.9605407, 0, 1, 0.1176471, 1,
-0.3857231, -0.2356114, -0.4121838, 0, 1, 0.1254902, 1,
-0.3856976, 0.1655045, -0.09551163, 0, 1, 0.1294118, 1,
-0.3792865, 1.470945, -0.2033016, 0, 1, 0.1372549, 1,
-0.3790349, -0.5247484, -2.049434, 0, 1, 0.1411765, 1,
-0.3779598, 0.08440869, -2.365613, 0, 1, 0.1490196, 1,
-0.3776593, -0.6915082, -3.226981, 0, 1, 0.1529412, 1,
-0.372155, 1.169685, 0.8706855, 0, 1, 0.1607843, 1,
-0.370857, -1.553113, -3.129718, 0, 1, 0.1647059, 1,
-0.365139, -0.2159522, -1.985483, 0, 1, 0.172549, 1,
-0.3649881, -0.2152214, -1.483186, 0, 1, 0.1764706, 1,
-0.3647987, -0.7308468, -2.78909, 0, 1, 0.1843137, 1,
-0.3621881, 0.4180482, -0.6135423, 0, 1, 0.1882353, 1,
-0.3568125, 0.8715504, -0.4693095, 0, 1, 0.1960784, 1,
-0.3557236, 0.8620763, -1.692519, 0, 1, 0.2039216, 1,
-0.3542367, -0.8243445, -2.306914, 0, 1, 0.2078431, 1,
-0.3528145, -0.4519332, -2.288815, 0, 1, 0.2156863, 1,
-0.3517515, 0.521961, -2.580508, 0, 1, 0.2196078, 1,
-0.3436259, 0.5179324, 1.283743, 0, 1, 0.227451, 1,
-0.3397726, -2.441245, -1.894784, 0, 1, 0.2313726, 1,
-0.3372898, 0.09378877, -0.6410864, 0, 1, 0.2392157, 1,
-0.3365586, -1.525202, -2.969646, 0, 1, 0.2431373, 1,
-0.3348157, 0.1648254, -1.854693, 0, 1, 0.2509804, 1,
-0.3324954, -0.4920708, -4.289472, 0, 1, 0.254902, 1,
-0.3312745, -1.598523, -1.248746, 0, 1, 0.2627451, 1,
-0.330387, -0.3824333, -1.763647, 0, 1, 0.2666667, 1,
-0.3295099, -0.4743687, -2.047725, 0, 1, 0.2745098, 1,
-0.3229595, 0.7938887, 1.115329, 0, 1, 0.2784314, 1,
-0.3166758, -0.2406439, -2.296419, 0, 1, 0.2862745, 1,
-0.3059007, -1.037008, -1.671465, 0, 1, 0.2901961, 1,
-0.3052301, -0.7976813, -3.078558, 0, 1, 0.2980392, 1,
-0.3052205, 0.1010514, -1.300975, 0, 1, 0.3058824, 1,
-0.3036306, 1.359513, 1.413229, 0, 1, 0.3098039, 1,
-0.3014975, -0.3538958, -1.859289, 0, 1, 0.3176471, 1,
-0.3012958, 1.030721, -1.3436, 0, 1, 0.3215686, 1,
-0.2971058, -0.05382933, -2.135186, 0, 1, 0.3294118, 1,
-0.2938926, 0.02473729, -1.694277, 0, 1, 0.3333333, 1,
-0.2899618, -0.1971939, -1.729705, 0, 1, 0.3411765, 1,
-0.2762958, 1.765632, 0.02330534, 0, 1, 0.345098, 1,
-0.2761248, 0.2405296, -0.2707129, 0, 1, 0.3529412, 1,
-0.2730379, 0.5189258, -0.369597, 0, 1, 0.3568628, 1,
-0.265, 0.4578644, -1.138755, 0, 1, 0.3647059, 1,
-0.2618131, -0.4111513, -2.981717, 0, 1, 0.3686275, 1,
-0.2600964, -0.9498205, -3.047055, 0, 1, 0.3764706, 1,
-0.2575648, 0.1313014, -0.025048, 0, 1, 0.3803922, 1,
-0.2520099, 1.378835, -0.9377113, 0, 1, 0.3882353, 1,
-0.2515857, -0.8407176, -2.94063, 0, 1, 0.3921569, 1,
-0.2511811, 1.390324, 0.6101917, 0, 1, 0.4, 1,
-0.2511659, 0.6085931, -0.2186204, 0, 1, 0.4078431, 1,
-0.2505214, 0.1740045, -2.428755, 0, 1, 0.4117647, 1,
-0.2468216, -0.1240539, -2.943008, 0, 1, 0.4196078, 1,
-0.2467528, 0.7147965, 0.4365202, 0, 1, 0.4235294, 1,
-0.2317601, 0.5385741, -2.055675, 0, 1, 0.4313726, 1,
-0.2284908, 1.578884, -0.4020339, 0, 1, 0.4352941, 1,
-0.2144473, -0.7743091, -3.578165, 0, 1, 0.4431373, 1,
-0.2139503, 0.06469886, -0.1902532, 0, 1, 0.4470588, 1,
-0.2085943, 0.3847908, 2.121052, 0, 1, 0.454902, 1,
-0.1987278, 0.7272974, 2.206612, 0, 1, 0.4588235, 1,
-0.1979913, -0.4411353, -0.7539871, 0, 1, 0.4666667, 1,
-0.1955363, 0.3180976, 0.4605605, 0, 1, 0.4705882, 1,
-0.1940127, 0.05177528, -2.042963, 0, 1, 0.4784314, 1,
-0.1925951, -0.6776603, -2.871462, 0, 1, 0.4823529, 1,
-0.1909011, -0.1051753, -2.122187, 0, 1, 0.4901961, 1,
-0.1831857, 0.05038432, 0.804886, 0, 1, 0.4941176, 1,
-0.1828967, 0.4579147, -0.4575852, 0, 1, 0.5019608, 1,
-0.1795739, 0.4124064, -1.179432, 0, 1, 0.509804, 1,
-0.1775576, 0.004246072, -1.79125, 0, 1, 0.5137255, 1,
-0.1775385, 1.868332, -1.389919, 0, 1, 0.5215687, 1,
-0.1738372, -0.07472294, -3.094053, 0, 1, 0.5254902, 1,
-0.1705556, -0.6348075, -3.529983, 0, 1, 0.5333334, 1,
-0.1676218, -0.7876675, -3.052747, 0, 1, 0.5372549, 1,
-0.1662817, -0.2131413, -4.045936, 0, 1, 0.5450981, 1,
-0.1635325, -0.6448041, -4.345469, 0, 1, 0.5490196, 1,
-0.1628479, -0.5607456, -4.724966, 0, 1, 0.5568628, 1,
-0.1606049, -0.2365738, -1.88356, 0, 1, 0.5607843, 1,
-0.1569962, 1.114109, -0.6507198, 0, 1, 0.5686275, 1,
-0.1549437, 1.245362, 0.2080152, 0, 1, 0.572549, 1,
-0.1543334, 0.05370131, -0.8081928, 0, 1, 0.5803922, 1,
-0.1535099, -0.4609157, -5.74786, 0, 1, 0.5843138, 1,
-0.1521628, -2.131019, -3.77932, 0, 1, 0.5921569, 1,
-0.1498609, -0.01825822, -0.677599, 0, 1, 0.5960785, 1,
-0.1493224, 1.885763, 0.05720561, 0, 1, 0.6039216, 1,
-0.1484555, -1.045777, -0.9951001, 0, 1, 0.6117647, 1,
-0.1467605, -0.03718769, -1.736316, 0, 1, 0.6156863, 1,
-0.1463117, -0.04308207, -2.165903, 0, 1, 0.6235294, 1,
-0.1423716, 1.807936, 0.442213, 0, 1, 0.627451, 1,
-0.1402253, 0.1810122, -2.262435, 0, 1, 0.6352941, 1,
-0.13564, 0.4829862, 1.04793, 0, 1, 0.6392157, 1,
-0.1351196, 0.3351987, -0.5660031, 0, 1, 0.6470588, 1,
-0.1341432, 0.3680188, -0.6889495, 0, 1, 0.6509804, 1,
-0.1321926, -1.219856, -2.710191, 0, 1, 0.6588235, 1,
-0.1256765, 0.2533821, -2.00934, 0, 1, 0.6627451, 1,
-0.1249675, -2.218513, -3.104955, 0, 1, 0.6705883, 1,
-0.1121772, 0.06302565, -0.7501527, 0, 1, 0.6745098, 1,
-0.1109846, -0.3370128, -1.743251, 0, 1, 0.682353, 1,
-0.107679, 0.1759219, -2.898703, 0, 1, 0.6862745, 1,
-0.09833254, 0.09014057, 1.62826, 0, 1, 0.6941177, 1,
-0.09786626, 0.8406492, -0.6614433, 0, 1, 0.7019608, 1,
-0.09481057, -0.938219, -4.207737, 0, 1, 0.7058824, 1,
-0.09170336, -0.121662, -2.050083, 0, 1, 0.7137255, 1,
-0.0905625, 1.384788, 0.6013922, 0, 1, 0.7176471, 1,
-0.08456568, 1.58336, 2.842354, 0, 1, 0.7254902, 1,
-0.08220139, 2.32983, -0.599596, 0, 1, 0.7294118, 1,
-0.08147433, -0.7730492, -4.140454, 0, 1, 0.7372549, 1,
-0.07843307, 0.6877472, -1.140169, 0, 1, 0.7411765, 1,
-0.07755941, -0.06121175, -2.702019, 0, 1, 0.7490196, 1,
-0.07032035, -0.1610405, -1.503238, 0, 1, 0.7529412, 1,
-0.0675715, 0.857909, -0.1610375, 0, 1, 0.7607843, 1,
-0.06706063, -1.208498, -2.29082, 0, 1, 0.7647059, 1,
-0.06676735, 0.1141177, -1.012747, 0, 1, 0.772549, 1,
-0.06194964, 1.338468, -0.1659811, 0, 1, 0.7764706, 1,
-0.06033314, 0.3010394, -0.6729025, 0, 1, 0.7843137, 1,
-0.04292389, 0.8609599, 0.9548276, 0, 1, 0.7882353, 1,
-0.02869973, -0.6092707, -4.337382, 0, 1, 0.7960784, 1,
-0.02863755, -0.3344279, -5.151748, 0, 1, 0.8039216, 1,
-0.02196396, -0.7072436, -4.021736, 0, 1, 0.8078431, 1,
-0.02136573, 0.01595881, 0.0098339, 0, 1, 0.8156863, 1,
-0.01963451, -0.02040548, -1.310187, 0, 1, 0.8196079, 1,
-0.01885128, 0.01842624, -1.434357, 0, 1, 0.827451, 1,
-0.01680787, -1.278605, -4.032472, 0, 1, 0.8313726, 1,
-0.01090523, -1.780316, -3.07486, 0, 1, 0.8392157, 1,
-0.008140615, -1.156952, -3.579685, 0, 1, 0.8431373, 1,
-0.00676362, -0.1072012, -2.403436, 0, 1, 0.8509804, 1,
-0.002781263, -0.9978082, -2.699342, 0, 1, 0.854902, 1,
-0.001870911, -1.670613, -1.768272, 0, 1, 0.8627451, 1,
0.0005956713, 0.9895888, 0.405647, 0, 1, 0.8666667, 1,
0.008398945, 1.260698, 0.7074611, 0, 1, 0.8745098, 1,
0.0102513, -1.320284, 2.577786, 0, 1, 0.8784314, 1,
0.01103815, -1.085115, 2.974789, 0, 1, 0.8862745, 1,
0.0174732, -0.09214419, 3.692292, 0, 1, 0.8901961, 1,
0.02097871, -0.5625317, 2.347078, 0, 1, 0.8980392, 1,
0.02469459, 1.054733, -0.9505082, 0, 1, 0.9058824, 1,
0.02814778, -0.8691663, 2.842147, 0, 1, 0.9098039, 1,
0.04140041, 0.3848589, 0.176184, 0, 1, 0.9176471, 1,
0.04390919, -1.470136, 0.4164934, 0, 1, 0.9215686, 1,
0.04483587, -0.02423726, 2.780928, 0, 1, 0.9294118, 1,
0.04643238, -1.637829, 3.131624, 0, 1, 0.9333333, 1,
0.04846341, -0.7017647, 2.457925, 0, 1, 0.9411765, 1,
0.05259081, -2.056755, 3.700065, 0, 1, 0.945098, 1,
0.06193577, 1.354521, 0.3903251, 0, 1, 0.9529412, 1,
0.06703107, 1.485663, -1.532948, 0, 1, 0.9568627, 1,
0.07087509, -1.114832, 3.607466, 0, 1, 0.9647059, 1,
0.0729747, 1.298057, -0.7691592, 0, 1, 0.9686275, 1,
0.07400277, -0.4929032, 2.729301, 0, 1, 0.9764706, 1,
0.07431028, -0.1417926, 2.900483, 0, 1, 0.9803922, 1,
0.07745117, 0.07892108, -0.02043219, 0, 1, 0.9882353, 1,
0.07763493, -0.8324904, 1.79158, 0, 1, 0.9921569, 1,
0.07848704, 0.6918949, 0.7411942, 0, 1, 1, 1,
0.07943349, -0.5271785, 3.587654, 0, 0.9921569, 1, 1,
0.08927912, -0.9330675, 2.225393, 0, 0.9882353, 1, 1,
0.09047177, -1.641183, 4.223309, 0, 0.9803922, 1, 1,
0.09365077, -1.206195, 4.538035, 0, 0.9764706, 1, 1,
0.09371305, -0.9729732, 2.905028, 0, 0.9686275, 1, 1,
0.09784786, -0.3411654, 2.785022, 0, 0.9647059, 1, 1,
0.09963168, 0.8946813, 0.1974509, 0, 0.9568627, 1, 1,
0.1053419, 0.2030931, 1.596641, 0, 0.9529412, 1, 1,
0.1085337, -0.9441615, 2.374199, 0, 0.945098, 1, 1,
0.1115551, 1.177925, 2.344942, 0, 0.9411765, 1, 1,
0.1138612, 0.6432285, 0.3139778, 0, 0.9333333, 1, 1,
0.1152877, -0.4369275, 1.381667, 0, 0.9294118, 1, 1,
0.1170063, -0.159079, 3.019806, 0, 0.9215686, 1, 1,
0.1175857, 0.8460838, -1.057843, 0, 0.9176471, 1, 1,
0.1178182, -1.271081, 4.398301, 0, 0.9098039, 1, 1,
0.1179034, 0.5792856, 1.077336, 0, 0.9058824, 1, 1,
0.121405, 0.8301196, -0.1397802, 0, 0.8980392, 1, 1,
0.1226793, -1.364197, 1.206631, 0, 0.8901961, 1, 1,
0.130475, -0.5819295, 3.387632, 0, 0.8862745, 1, 1,
0.1307456, 1.729468, -2.472305, 0, 0.8784314, 1, 1,
0.1309761, 0.4167164, -0.3227087, 0, 0.8745098, 1, 1,
0.1334817, 0.578002, -0.4580457, 0, 0.8666667, 1, 1,
0.1335746, -0.5195209, 2.251854, 0, 0.8627451, 1, 1,
0.1354111, -0.06274598, 1.992947, 0, 0.854902, 1, 1,
0.1392754, -0.2763525, 2.341764, 0, 0.8509804, 1, 1,
0.1396904, -0.1549089, 0.4654776, 0, 0.8431373, 1, 1,
0.1403629, -1.142762, 1.968788, 0, 0.8392157, 1, 1,
0.1409907, 0.8612961, 1.531658, 0, 0.8313726, 1, 1,
0.1433202, 0.3308591, -1.21002, 0, 0.827451, 1, 1,
0.1459302, -1.277127, 4.514709, 0, 0.8196079, 1, 1,
0.1504323, -0.4905529, 4.012813, 0, 0.8156863, 1, 1,
0.1564306, 0.1713477, 0.7277886, 0, 0.8078431, 1, 1,
0.1567241, 0.2986531, 0.1736099, 0, 0.8039216, 1, 1,
0.15815, 0.4521614, 0.4485944, 0, 0.7960784, 1, 1,
0.1600475, 1.559222, -0.2982154, 0, 0.7882353, 1, 1,
0.1645246, 0.2231851, 1.896523, 0, 0.7843137, 1, 1,
0.1646718, -1.03332, 4.026968, 0, 0.7764706, 1, 1,
0.1651073, -0.06741848, 1.193095, 0, 0.772549, 1, 1,
0.1720151, -1.204579, 1.759104, 0, 0.7647059, 1, 1,
0.1837751, 0.001697543, 1.418332, 0, 0.7607843, 1, 1,
0.1897071, -1.011558, 2.268381, 0, 0.7529412, 1, 1,
0.1917293, 0.1213813, 1.040649, 0, 0.7490196, 1, 1,
0.1917951, -0.1955052, 1.685215, 0, 0.7411765, 1, 1,
0.1932737, -0.7426147, 1.959327, 0, 0.7372549, 1, 1,
0.1941552, -1.152681, 2.627249, 0, 0.7294118, 1, 1,
0.1950234, 0.1091882, 0.4927398, 0, 0.7254902, 1, 1,
0.1959109, 0.9893147, 0.3571219, 0, 0.7176471, 1, 1,
0.1966255, 0.8283503, 0.2390392, 0, 0.7137255, 1, 1,
0.199918, 0.2321408, 0.3851349, 0, 0.7058824, 1, 1,
0.2013007, 0.2812428, 1.564201, 0, 0.6980392, 1, 1,
0.2039579, -2.937304, 2.291306, 0, 0.6941177, 1, 1,
0.2074754, -0.7171878, 3.562612, 0, 0.6862745, 1, 1,
0.2105231, 0.9236041, -0.777252, 0, 0.682353, 1, 1,
0.2145883, -1.496194, 3.473538, 0, 0.6745098, 1, 1,
0.2152037, 0.4913391, -0.761823, 0, 0.6705883, 1, 1,
0.2158098, -0.6550577, 1.747682, 0, 0.6627451, 1, 1,
0.2158921, -0.4404698, 3.181839, 0, 0.6588235, 1, 1,
0.2166717, 1.269113, 0.5890815, 0, 0.6509804, 1, 1,
0.2169162, -0.03276926, 1.019259, 0, 0.6470588, 1, 1,
0.21763, 2.325712, 1.278793, 0, 0.6392157, 1, 1,
0.2221067, -2.770284, 3.729234, 0, 0.6352941, 1, 1,
0.2224838, 0.225946, 1.749423, 0, 0.627451, 1, 1,
0.2330835, -0.3576979, 1.523909, 0, 0.6235294, 1, 1,
0.2354435, -0.3730526, 3.245466, 0, 0.6156863, 1, 1,
0.2355225, -0.5200948, 2.124239, 0, 0.6117647, 1, 1,
0.2365051, -0.330866, 1.726955, 0, 0.6039216, 1, 1,
0.2388758, -0.5071104, 4.649246, 0, 0.5960785, 1, 1,
0.240376, 0.2801398, 1.218595, 0, 0.5921569, 1, 1,
0.2423086, 0.5990355, 1.893131, 0, 0.5843138, 1, 1,
0.2427846, 0.05432976, 1.394601, 0, 0.5803922, 1, 1,
0.2441817, 0.2406961, 1.926365, 0, 0.572549, 1, 1,
0.2461267, 1.395033, -0.5280158, 0, 0.5686275, 1, 1,
0.2491457, 0.1485776, 0.3298925, 0, 0.5607843, 1, 1,
0.2492883, 0.1358882, 0.6010998, 0, 0.5568628, 1, 1,
0.2504828, 1.623349, 0.2554303, 0, 0.5490196, 1, 1,
0.2509739, -0.2918988, 0.4698405, 0, 0.5450981, 1, 1,
0.2545287, 1.816228, 0.8267899, 0, 0.5372549, 1, 1,
0.2597077, -0.6126236, 3.063469, 0, 0.5333334, 1, 1,
0.2617902, -0.3946689, 1.741057, 0, 0.5254902, 1, 1,
0.2632087, 2.182418, 0.4408297, 0, 0.5215687, 1, 1,
0.2636145, -0.08087298, 2.932332, 0, 0.5137255, 1, 1,
0.2648791, -0.457502, 1.819488, 0, 0.509804, 1, 1,
0.2651801, 0.2128856, 1.513644, 0, 0.5019608, 1, 1,
0.2719384, 2.494086, 0.7889867, 0, 0.4941176, 1, 1,
0.2736806, -0.2207734, 2.151552, 0, 0.4901961, 1, 1,
0.2801293, 0.7810929, 2.043138, 0, 0.4823529, 1, 1,
0.2829792, 0.7651178, -0.9635291, 0, 0.4784314, 1, 1,
0.2920145, 0.8289592, -0.6046045, 0, 0.4705882, 1, 1,
0.2964478, -0.3022389, 2.410936, 0, 0.4666667, 1, 1,
0.298122, 0.082107, 1.130034, 0, 0.4588235, 1, 1,
0.2996391, -0.9363162, 1.85212, 0, 0.454902, 1, 1,
0.3030002, -1.396205, 3.034258, 0, 0.4470588, 1, 1,
0.3124531, -0.008523294, 3.277089, 0, 0.4431373, 1, 1,
0.3161893, 0.9030164, 0.9307588, 0, 0.4352941, 1, 1,
0.3170297, 1.407853, 0.3720434, 0, 0.4313726, 1, 1,
0.3191526, -0.5430268, 2.543186, 0, 0.4235294, 1, 1,
0.3197057, -1.252464, 2.418284, 0, 0.4196078, 1, 1,
0.3201385, 2.558921, 1.558786, 0, 0.4117647, 1, 1,
0.3209022, -0.2311531, 1.852013, 0, 0.4078431, 1, 1,
0.3254175, 0.0379895, 2.067674, 0, 0.4, 1, 1,
0.3284755, 0.6991221, 2.938469, 0, 0.3921569, 1, 1,
0.3299922, 0.574023, 0.9909905, 0, 0.3882353, 1, 1,
0.3307512, 1.686836, 1.013072, 0, 0.3803922, 1, 1,
0.3325215, -1.05561, 2.889205, 0, 0.3764706, 1, 1,
0.3332722, -1.059229, 4.288082, 0, 0.3686275, 1, 1,
0.3338822, -1.128809, 2.299179, 0, 0.3647059, 1, 1,
0.335801, 1.796238, -1.016488, 0, 0.3568628, 1, 1,
0.3387398, 1.13206, 1.14946, 0, 0.3529412, 1, 1,
0.3396864, -0.6466531, 3.499981, 0, 0.345098, 1, 1,
0.3397135, -0.9265558, 3.415334, 0, 0.3411765, 1, 1,
0.341497, -1.058187, 2.031507, 0, 0.3333333, 1, 1,
0.3432359, -1.937122, 3.764407, 0, 0.3294118, 1, 1,
0.3478505, -0.1023145, 1.704517, 0, 0.3215686, 1, 1,
0.3524567, 0.5285429, 1.066913, 0, 0.3176471, 1, 1,
0.3577278, -0.4238194, 2.501923, 0, 0.3098039, 1, 1,
0.3597181, 0.676769, -0.5210178, 0, 0.3058824, 1, 1,
0.3611243, 0.5185722, -0.05820311, 0, 0.2980392, 1, 1,
0.3623256, 1.123343, 2.37551, 0, 0.2901961, 1, 1,
0.3643227, -0.6935077, 1.869949, 0, 0.2862745, 1, 1,
0.3711175, 1.04591, 1.23053, 0, 0.2784314, 1, 1,
0.3713922, 0.4438252, 1.010164, 0, 0.2745098, 1, 1,
0.3720534, -0.0403843, 2.12474, 0, 0.2666667, 1, 1,
0.3736103, 0.5933419, 1.739177, 0, 0.2627451, 1, 1,
0.3752404, -1.814853, 1.174987, 0, 0.254902, 1, 1,
0.3767991, -1.078276, 2.200772, 0, 0.2509804, 1, 1,
0.3797646, -0.2007295, 3.036922, 0, 0.2431373, 1, 1,
0.3833238, -0.7478811, 3.14108, 0, 0.2392157, 1, 1,
0.3876185, -0.7998653, 0.1472996, 0, 0.2313726, 1, 1,
0.3954045, 0.9732028, 0.8368961, 0, 0.227451, 1, 1,
0.3954489, 0.8864198, -0.4134933, 0, 0.2196078, 1, 1,
0.3955463, 0.6392974, 0.8135591, 0, 0.2156863, 1, 1,
0.3972146, -0.6806307, 4.076252, 0, 0.2078431, 1, 1,
0.4057603, 0.1264335, 1.569913, 0, 0.2039216, 1, 1,
0.4058666, -1.225337, 3.488061, 0, 0.1960784, 1, 1,
0.4071231, -0.9382839, 3.184947, 0, 0.1882353, 1, 1,
0.4073211, -0.1346213, 2.128705, 0, 0.1843137, 1, 1,
0.407333, 0.7365054, 0.7182992, 0, 0.1764706, 1, 1,
0.4100637, 1.104646, 0.8262938, 0, 0.172549, 1, 1,
0.4150803, 0.08266035, 1.569963, 0, 0.1647059, 1, 1,
0.4167674, -0.7394871, 2.572685, 0, 0.1607843, 1, 1,
0.4216392, -0.773824, 2.74971, 0, 0.1529412, 1, 1,
0.4219911, 0.6975591, 1.570906, 0, 0.1490196, 1, 1,
0.422662, -0.4972655, 2.31406, 0, 0.1411765, 1, 1,
0.424547, -0.9121919, 3.151782, 0, 0.1372549, 1, 1,
0.4254107, 2.299646, -0.1051531, 0, 0.1294118, 1, 1,
0.4266762, -0.2234258, 1.14569, 0, 0.1254902, 1, 1,
0.4351568, 0.4649152, 1.952667, 0, 0.1176471, 1, 1,
0.4362203, 1.369691, -0.404448, 0, 0.1137255, 1, 1,
0.4401537, -0.738825, 3.379273, 0, 0.1058824, 1, 1,
0.4407448, -0.5712925, 2.48693, 0, 0.09803922, 1, 1,
0.4417344, -0.3023432, 1.930768, 0, 0.09411765, 1, 1,
0.4426584, 0.7594363, 0.1082981, 0, 0.08627451, 1, 1,
0.44579, 0.2688507, 1.732683, 0, 0.08235294, 1, 1,
0.4460331, 0.5474544, -0.2923604, 0, 0.07450981, 1, 1,
0.4483446, 0.9530509, -1.20831, 0, 0.07058824, 1, 1,
0.4523571, 0.7718782, 1.237617, 0, 0.0627451, 1, 1,
0.4524946, -0.1575118, 3.07893, 0, 0.05882353, 1, 1,
0.4528731, 0.6874035, 1.223046, 0, 0.05098039, 1, 1,
0.4536115, 0.5973332, 1.529107, 0, 0.04705882, 1, 1,
0.4541271, 0.1183245, 1.818347, 0, 0.03921569, 1, 1,
0.4547594, 0.5960418, -0.1920998, 0, 0.03529412, 1, 1,
0.4574946, 1.038842, -2.161016, 0, 0.02745098, 1, 1,
0.4576661, 0.08165666, 2.349186, 0, 0.02352941, 1, 1,
0.4577379, -1.337205, 4.007792, 0, 0.01568628, 1, 1,
0.4641837, 1.040606, 2.20663, 0, 0.01176471, 1, 1,
0.467021, 0.1490871, 0.4020047, 0, 0.003921569, 1, 1,
0.4679614, 0.209879, 1.6756, 0.003921569, 0, 1, 1,
0.4704677, -0.9325585, 2.492239, 0.007843138, 0, 1, 1,
0.4728799, 1.04915, 1.226422, 0.01568628, 0, 1, 1,
0.4747201, 0.3924533, 0.2575241, 0.01960784, 0, 1, 1,
0.4751288, -0.9294802, 2.299545, 0.02745098, 0, 1, 1,
0.4779187, 1.619148, 0.6632174, 0.03137255, 0, 1, 1,
0.4820849, 1.116728, 0.9280936, 0.03921569, 0, 1, 1,
0.4829388, 2.489039, 0.03368244, 0.04313726, 0, 1, 1,
0.483986, -2.094054, 2.396013, 0.05098039, 0, 1, 1,
0.4856914, -1.003785, 3.719744, 0.05490196, 0, 1, 1,
0.4858508, -0.07713927, 1.718773, 0.0627451, 0, 1, 1,
0.4948423, 0.4457744, 1.260318, 0.06666667, 0, 1, 1,
0.4959455, -0.9391416, 1.504836, 0.07450981, 0, 1, 1,
0.4966174, -0.7177986, 1.951873, 0.07843138, 0, 1, 1,
0.4971363, -0.2492788, 2.072405, 0.08627451, 0, 1, 1,
0.4971633, -0.7311318, 1.730425, 0.09019608, 0, 1, 1,
0.4981129, -0.5944989, 3.116129, 0.09803922, 0, 1, 1,
0.4990934, -0.185855, 3.066412, 0.1058824, 0, 1, 1,
0.5013894, 0.6559824, 1.243039, 0.1098039, 0, 1, 1,
0.5024887, -0.3556441, 3.909384, 0.1176471, 0, 1, 1,
0.5046671, -0.5012107, 3.297323, 0.1215686, 0, 1, 1,
0.5061606, 1.907951, 0.07201076, 0.1294118, 0, 1, 1,
0.5070808, -1.019339, 1.054981, 0.1333333, 0, 1, 1,
0.5137072, -0.340024, 1.55484, 0.1411765, 0, 1, 1,
0.5141066, 0.01328984, 1.876904, 0.145098, 0, 1, 1,
0.5201029, 0.2060471, 1.047851, 0.1529412, 0, 1, 1,
0.5229413, -0.8433148, 3.766298, 0.1568628, 0, 1, 1,
0.5237176, 0.6067799, 0.8004845, 0.1647059, 0, 1, 1,
0.5276783, 1.486972, 0.811578, 0.1686275, 0, 1, 1,
0.5326465, 0.3408343, 0.2477193, 0.1764706, 0, 1, 1,
0.5427547, -1.372535, 3.430871, 0.1803922, 0, 1, 1,
0.5430169, 0.6176196, 0.3248183, 0.1882353, 0, 1, 1,
0.5466532, 1.39801, 0.1028075, 0.1921569, 0, 1, 1,
0.5480149, 0.195072, -1.018063, 0.2, 0, 1, 1,
0.5480163, 0.7760315, 1.687761, 0.2078431, 0, 1, 1,
0.5487172, -0.2655474, 2.53704, 0.2117647, 0, 1, 1,
0.5493758, 1.225066, -0.6263301, 0.2196078, 0, 1, 1,
0.5494331, 0.8130084, 0.1452976, 0.2235294, 0, 1, 1,
0.5495257, 0.2209288, -0.2579456, 0.2313726, 0, 1, 1,
0.5605049, -1.378536, 1.950254, 0.2352941, 0, 1, 1,
0.5647746, 1.730851, 0.2950965, 0.2431373, 0, 1, 1,
0.5664693, -1.036088, 1.717215, 0.2470588, 0, 1, 1,
0.5699571, 0.3086756, 0.5186186, 0.254902, 0, 1, 1,
0.5705117, 0.1746458, 0.39386, 0.2588235, 0, 1, 1,
0.5708362, -0.7075725, 1.450287, 0.2666667, 0, 1, 1,
0.5725352, -1.561794, 1.894892, 0.2705882, 0, 1, 1,
0.5749027, 0.9953577, 0.7595763, 0.2784314, 0, 1, 1,
0.5773504, -0.2435665, 0.6762967, 0.282353, 0, 1, 1,
0.5793981, -0.1069943, 2.977927, 0.2901961, 0, 1, 1,
0.5801293, -0.09486661, 2.421547, 0.2941177, 0, 1, 1,
0.5809855, -0.1481608, 2.091707, 0.3019608, 0, 1, 1,
0.5811838, -2.441802, 3.661694, 0.3098039, 0, 1, 1,
0.5846144, -1.254338, 2.517275, 0.3137255, 0, 1, 1,
0.5846821, 0.2837374, 1.43798, 0.3215686, 0, 1, 1,
0.5848304, 1.750104, 1.353722, 0.3254902, 0, 1, 1,
0.5875037, 1.758665, 0.1477058, 0.3333333, 0, 1, 1,
0.588318, 0.7860484, -1.005311, 0.3372549, 0, 1, 1,
0.590463, 0.09049915, 2.242158, 0.345098, 0, 1, 1,
0.5954878, -0.02452384, 2.124122, 0.3490196, 0, 1, 1,
0.5984331, -0.3386407, 3.038649, 0.3568628, 0, 1, 1,
0.6001426, -0.2882937, 2.322483, 0.3607843, 0, 1, 1,
0.6019021, 2.468754, 0.01754965, 0.3686275, 0, 1, 1,
0.6033261, 0.5676564, 0.1119949, 0.372549, 0, 1, 1,
0.6062036, 0.9208789, -0.6237599, 0.3803922, 0, 1, 1,
0.608234, -0.1873852, 1.853551, 0.3843137, 0, 1, 1,
0.6091177, 1.023714, 0.695972, 0.3921569, 0, 1, 1,
0.6158494, -1.538502, 1.752262, 0.3960784, 0, 1, 1,
0.6241847, -0.548862, 2.417147, 0.4039216, 0, 1, 1,
0.6257331, 0.2317858, 0.2787028, 0.4117647, 0, 1, 1,
0.6306713, 2.144873, 0.08718683, 0.4156863, 0, 1, 1,
0.6377938, 0.5241033, 0.1724523, 0.4235294, 0, 1, 1,
0.6416197, -0.6979753, 1.69403, 0.427451, 0, 1, 1,
0.6424604, -0.7274598, 1.51453, 0.4352941, 0, 1, 1,
0.6434069, 0.163214, 2.190889, 0.4392157, 0, 1, 1,
0.6444705, 0.7550094, 2.123522, 0.4470588, 0, 1, 1,
0.645491, 0.05514038, 1.9472, 0.4509804, 0, 1, 1,
0.6459834, -0.4836453, 0.1647867, 0.4588235, 0, 1, 1,
0.6555975, -0.08273998, 0.6139656, 0.4627451, 0, 1, 1,
0.6689679, -0.2795258, 1.74422, 0.4705882, 0, 1, 1,
0.6719285, -0.9209596, 1.956245, 0.4745098, 0, 1, 1,
0.672102, -0.4363089, 1.75659, 0.4823529, 0, 1, 1,
0.6723141, -0.033011, 1.44346, 0.4862745, 0, 1, 1,
0.6723679, -0.2516991, 0.5044886, 0.4941176, 0, 1, 1,
0.6780233, -0.5150743, 2.30233, 0.5019608, 0, 1, 1,
0.6812738, 0.4148487, 1.545747, 0.5058824, 0, 1, 1,
0.683048, 0.2179, 1.953704, 0.5137255, 0, 1, 1,
0.6839288, 0.7044793, 0.5253323, 0.5176471, 0, 1, 1,
0.685178, -1.433435, 3.046839, 0.5254902, 0, 1, 1,
0.6865844, -1.399434, 2.201535, 0.5294118, 0, 1, 1,
0.6882701, -0.3066662, 2.149754, 0.5372549, 0, 1, 1,
0.6915715, -0.8421369, 3.00896, 0.5411765, 0, 1, 1,
0.6961637, 0.4403208, -0.6354376, 0.5490196, 0, 1, 1,
0.7092283, 1.279039, 0.08321115, 0.5529412, 0, 1, 1,
0.7129546, 1.413837, 0.6573617, 0.5607843, 0, 1, 1,
0.7130865, -0.6170899, 2.633592, 0.5647059, 0, 1, 1,
0.7132376, 0.4088795, 1.495419, 0.572549, 0, 1, 1,
0.7202912, 0.4147544, 1.55789, 0.5764706, 0, 1, 1,
0.7205521, -0.468368, 2.735697, 0.5843138, 0, 1, 1,
0.7212906, -0.09392153, -0.6250284, 0.5882353, 0, 1, 1,
0.7222459, 1.120231, -1.317711, 0.5960785, 0, 1, 1,
0.7223756, -0.5715322, 2.630285, 0.6039216, 0, 1, 1,
0.7230501, 0.4394605, 1.531779, 0.6078432, 0, 1, 1,
0.7251897, 1.0581, 0.6592765, 0.6156863, 0, 1, 1,
0.7304771, 2.718567, -0.01982088, 0.6196079, 0, 1, 1,
0.7324923, -0.009686573, 2.096128, 0.627451, 0, 1, 1,
0.7421736, -0.01655229, 3.246168, 0.6313726, 0, 1, 1,
0.7448016, -0.08021127, 1.38036, 0.6392157, 0, 1, 1,
0.7465785, 0.3061438, 2.514298, 0.6431373, 0, 1, 1,
0.7516103, 1.1158, 0.08355181, 0.6509804, 0, 1, 1,
0.7587116, -1.078011, 2.153999, 0.654902, 0, 1, 1,
0.7595465, 0.5256103, 0.6558591, 0.6627451, 0, 1, 1,
0.761064, -1.404521, 3.257746, 0.6666667, 0, 1, 1,
0.7649988, 0.1637921, 2.003846, 0.6745098, 0, 1, 1,
0.7786765, 0.150089, 2.104557, 0.6784314, 0, 1, 1,
0.787599, -1.327234, 4.140201, 0.6862745, 0, 1, 1,
0.790544, -0.1039981, 3.069977, 0.6901961, 0, 1, 1,
0.790633, 1.958522, -0.2483384, 0.6980392, 0, 1, 1,
0.7929648, -0.7385945, 2.795816, 0.7058824, 0, 1, 1,
0.7935283, 0.854333, 1.331205, 0.7098039, 0, 1, 1,
0.7950374, 0.3706387, 2.414776, 0.7176471, 0, 1, 1,
0.7970185, 0.9284948, -0.3950978, 0.7215686, 0, 1, 1,
0.798271, 0.4804758, -0.9975482, 0.7294118, 0, 1, 1,
0.8060638, -0.4512544, 1.02159, 0.7333333, 0, 1, 1,
0.8116775, -0.4181136, 2.944997, 0.7411765, 0, 1, 1,
0.8163472, 0.8766071, 0.905727, 0.7450981, 0, 1, 1,
0.8177048, 0.7486948, 0.8227265, 0.7529412, 0, 1, 1,
0.8284608, 1.534108, 1.058829, 0.7568628, 0, 1, 1,
0.8288013, -0.6129569, 1.569886, 0.7647059, 0, 1, 1,
0.8310435, 0.177376, 0.6085653, 0.7686275, 0, 1, 1,
0.8373501, -0.2899497, 1.908255, 0.7764706, 0, 1, 1,
0.8379607, 0.511984, 1.584589, 0.7803922, 0, 1, 1,
0.8422179, 0.2049706, 1.365431, 0.7882353, 0, 1, 1,
0.8483753, -0.4791331, 1.815845, 0.7921569, 0, 1, 1,
0.8513974, 0.395424, 1.150217, 0.8, 0, 1, 1,
0.8520801, -1.306734, 2.818813, 0.8078431, 0, 1, 1,
0.863461, 0.02344764, -0.3381695, 0.8117647, 0, 1, 1,
0.8685731, 1.861319, 0.6125659, 0.8196079, 0, 1, 1,
0.8697181, 1.685037, 1.362642, 0.8235294, 0, 1, 1,
0.8710739, 0.02503719, 0.717522, 0.8313726, 0, 1, 1,
0.8726164, -0.9726927, 2.681386, 0.8352941, 0, 1, 1,
0.8739206, -0.9793721, 3.139856, 0.8431373, 0, 1, 1,
0.8749377, -0.05526952, 1.711531, 0.8470588, 0, 1, 1,
0.880105, 1.376278, 0.8102813, 0.854902, 0, 1, 1,
0.8801638, -0.3015239, 2.533973, 0.8588235, 0, 1, 1,
0.8851643, 0.5379201, 0.2618066, 0.8666667, 0, 1, 1,
0.8960188, 0.3125672, 2.766804, 0.8705882, 0, 1, 1,
0.8967972, -1.003566, 2.468178, 0.8784314, 0, 1, 1,
0.8985562, -2.042571, 2.724343, 0.8823529, 0, 1, 1,
0.9009557, 1.069105, 1.44217, 0.8901961, 0, 1, 1,
0.9047289, -1.325915, 1.651501, 0.8941177, 0, 1, 1,
0.9099746, 1.001869, 2.57845, 0.9019608, 0, 1, 1,
0.9169459, -0.1982591, 2.278117, 0.9098039, 0, 1, 1,
0.9221429, 1.585828, 0.3819295, 0.9137255, 0, 1, 1,
0.9224666, -0.6006117, 0.6617998, 0.9215686, 0, 1, 1,
0.9252583, -1.230649, 4.326473, 0.9254902, 0, 1, 1,
0.9301044, -0.6829377, 1.416707, 0.9333333, 0, 1, 1,
0.9347132, 0.5904344, 1.784228, 0.9372549, 0, 1, 1,
0.9352489, 1.294632, 2.11306, 0.945098, 0, 1, 1,
0.9370376, -0.6884435, 0.4692546, 0.9490196, 0, 1, 1,
0.9429532, 0.4236939, 2.955089, 0.9568627, 0, 1, 1,
0.9486452, 0.1881286, 3.387388, 0.9607843, 0, 1, 1,
0.9581708, 0.0167568, 0.4884315, 0.9686275, 0, 1, 1,
0.9659771, -1.141676, 3.105578, 0.972549, 0, 1, 1,
0.9692433, -0.4359077, 2.191275, 0.9803922, 0, 1, 1,
0.970578, -1.068431, 2.534781, 0.9843137, 0, 1, 1,
0.9726585, 0.6226394, 1.402982, 0.9921569, 0, 1, 1,
0.9736696, 0.8987789, 1.146216, 0.9960784, 0, 1, 1,
0.9962361, -0.8267121, 2.176232, 1, 0, 0.9960784, 1,
0.9990336, 0.06075509, 0.9866518, 1, 0, 0.9882353, 1,
1.002183, -1.567472, 2.399149, 1, 0, 0.9843137, 1,
1.013504, 1.660842, 1.490125, 1, 0, 0.9764706, 1,
1.017715, -0.2086498, 2.256116, 1, 0, 0.972549, 1,
1.018998, 2.180913, -0.1656509, 1, 0, 0.9647059, 1,
1.020126, -0.8358677, 1.969447, 1, 0, 0.9607843, 1,
1.021062, -0.4052212, 2.43938, 1, 0, 0.9529412, 1,
1.02237, -0.436251, 3.285797, 1, 0, 0.9490196, 1,
1.025416, 0.3896656, 2.169018, 1, 0, 0.9411765, 1,
1.0272, 1.707987, 0.6196158, 1, 0, 0.9372549, 1,
1.030033, 0.4318669, 0.94243, 1, 0, 0.9294118, 1,
1.034195, 0.01528032, 0.4054018, 1, 0, 0.9254902, 1,
1.038538, -1.216459, 2.380606, 1, 0, 0.9176471, 1,
1.039565, -0.4697096, 1.579645, 1, 0, 0.9137255, 1,
1.05247, -0.5654914, 1.932348, 1, 0, 0.9058824, 1,
1.058339, 0.6948607, 0.08760049, 1, 0, 0.9019608, 1,
1.063226, -0.7922118, 2.030356, 1, 0, 0.8941177, 1,
1.06503, 0.3719529, 1.41184, 1, 0, 0.8862745, 1,
1.070671, -1.159448, 1.245578, 1, 0, 0.8823529, 1,
1.071144, -1.277786, 0.2986094, 1, 0, 0.8745098, 1,
1.072879, 0.223505, 2.625957, 1, 0, 0.8705882, 1,
1.076907, -0.8393167, 1.841205, 1, 0, 0.8627451, 1,
1.081469, 0.3069803, 0.6938658, 1, 0, 0.8588235, 1,
1.099893, -0.2747172, 2.665203, 1, 0, 0.8509804, 1,
1.109576, -0.5291945, 2.033474, 1, 0, 0.8470588, 1,
1.110604, 0.624617, 0.006462257, 1, 0, 0.8392157, 1,
1.111651, 1.590182, 0.3625654, 1, 0, 0.8352941, 1,
1.113005, -1.273646, 4.422886, 1, 0, 0.827451, 1,
1.113163, -1.247771, 5.000819, 1, 0, 0.8235294, 1,
1.115767, 0.191538, 1.57681, 1, 0, 0.8156863, 1,
1.115873, 0.2566377, 0.01060035, 1, 0, 0.8117647, 1,
1.120704, -1.169802, 1.47037, 1, 0, 0.8039216, 1,
1.121836, 0.6132888, 1.430796, 1, 0, 0.7960784, 1,
1.126979, -0.2530814, 1.172106, 1, 0, 0.7921569, 1,
1.130167, 0.445549, 1.816554, 1, 0, 0.7843137, 1,
1.132797, 0.7254592, 0.8329863, 1, 0, 0.7803922, 1,
1.1407, -0.290635, 2.743637, 1, 0, 0.772549, 1,
1.152852, 0.845494, 1.058475, 1, 0, 0.7686275, 1,
1.157626, 0.03162768, 2.095752, 1, 0, 0.7607843, 1,
1.158908, 0.005321909, 0.7328533, 1, 0, 0.7568628, 1,
1.167285, 0.333955, 2.523389, 1, 0, 0.7490196, 1,
1.170419, -3.15607, 2.804826, 1, 0, 0.7450981, 1,
1.173886, -0.1261881, 0.1435771, 1, 0, 0.7372549, 1,
1.175827, 1.316923, 1.969933, 1, 0, 0.7333333, 1,
1.180359, -0.7425411, 1.42832, 1, 0, 0.7254902, 1,
1.182128, 2.092476, 0.2247792, 1, 0, 0.7215686, 1,
1.186376, -0.1132324, 1.048401, 1, 0, 0.7137255, 1,
1.187922, 0.200317, 0.6778683, 1, 0, 0.7098039, 1,
1.189024, 0.4336477, -0.7090769, 1, 0, 0.7019608, 1,
1.189486, -2.259729, 3.342664, 1, 0, 0.6941177, 1,
1.212109, -0.427628, 1.963566, 1, 0, 0.6901961, 1,
1.213117, 0.1289599, 1.410151, 1, 0, 0.682353, 1,
1.217586, 0.7897072, -0.05849294, 1, 0, 0.6784314, 1,
1.223415, -0.4185625, 1.41129, 1, 0, 0.6705883, 1,
1.234987, 1.190428, 1.02317, 1, 0, 0.6666667, 1,
1.256438, 1.508708, 2.152073, 1, 0, 0.6588235, 1,
1.263863, 0.04192754, 0.9942828, 1, 0, 0.654902, 1,
1.268638, -1.275232, 2.048415, 1, 0, 0.6470588, 1,
1.269998, -0.609516, 2.911831, 1, 0, 0.6431373, 1,
1.276594, -0.1734107, 1.033354, 1, 0, 0.6352941, 1,
1.28047, -0.01290167, 0.2662026, 1, 0, 0.6313726, 1,
1.285791, 2.246508, 0.1979321, 1, 0, 0.6235294, 1,
1.299436, 1.012933, 2.623667, 1, 0, 0.6196079, 1,
1.302075, -0.4361466, 3.45028, 1, 0, 0.6117647, 1,
1.303063, 1.226701, 0.6002246, 1, 0, 0.6078432, 1,
1.307897, 0.9503356, 0.07114497, 1, 0, 0.6, 1,
1.316247, -1.955812, 2.888012, 1, 0, 0.5921569, 1,
1.323151, 1.1332, 0.5255559, 1, 0, 0.5882353, 1,
1.333631, 0.9903704, 1.407098, 1, 0, 0.5803922, 1,
1.333707, -0.1208363, 1.483472, 1, 0, 0.5764706, 1,
1.335134, -0.407919, 1.659936, 1, 0, 0.5686275, 1,
1.36287, 1.072031, 0.1171683, 1, 0, 0.5647059, 1,
1.374656, 1.902619, 0.8999977, 1, 0, 0.5568628, 1,
1.376565, -0.713924, 2.738803, 1, 0, 0.5529412, 1,
1.382284, 0.169924, 3.23177, 1, 0, 0.5450981, 1,
1.39197, -1.455669, 4.552766, 1, 0, 0.5411765, 1,
1.404947, -1.070246, 2.337725, 1, 0, 0.5333334, 1,
1.418707, 0.7592218, 0.7975332, 1, 0, 0.5294118, 1,
1.420935, 1.029195, 1.377428, 1, 0, 0.5215687, 1,
1.427608, 0.8994111, 1.635221, 1, 0, 0.5176471, 1,
1.435469, 0.5559889, 0.5689593, 1, 0, 0.509804, 1,
1.443586, -0.02340396, 0.8123791, 1, 0, 0.5058824, 1,
1.444415, -0.7076671, 1.889878, 1, 0, 0.4980392, 1,
1.448439, -0.5269313, 1.371752, 1, 0, 0.4901961, 1,
1.459264, 0.2647108, 1.992144, 1, 0, 0.4862745, 1,
1.462596, 0.1466104, 2.426751, 1, 0, 0.4784314, 1,
1.465048, 1.941531, 1.955499, 1, 0, 0.4745098, 1,
1.466149, 0.3199614, 4.63756, 1, 0, 0.4666667, 1,
1.469059, 0.04970086, 1.875389, 1, 0, 0.4627451, 1,
1.493971, 1.15712, 1.559585, 1, 0, 0.454902, 1,
1.497401, -0.3182304, 0.8344061, 1, 0, 0.4509804, 1,
1.501105, 0.004400477, -0.4089127, 1, 0, 0.4431373, 1,
1.503383, -0.6779835, 3.804134, 1, 0, 0.4392157, 1,
1.512142, 0.4961617, 1.811479, 1, 0, 0.4313726, 1,
1.525583, -0.04954806, 4.243906, 1, 0, 0.427451, 1,
1.52652, 0.5993357, 1.571898, 1, 0, 0.4196078, 1,
1.530984, -1.067838, 2.72608, 1, 0, 0.4156863, 1,
1.538202, 0.09948967, 0.1750915, 1, 0, 0.4078431, 1,
1.545615, 0.5882748, 2.397583, 1, 0, 0.4039216, 1,
1.555967, 0.8636997, 0.2531351, 1, 0, 0.3960784, 1,
1.566367, -0.7201892, 0.9374095, 1, 0, 0.3882353, 1,
1.586675, -1.406592, 3.409485, 1, 0, 0.3843137, 1,
1.587661, -0.2809425, 1.61411, 1, 0, 0.3764706, 1,
1.642317, 0.5647969, 2.353299, 1, 0, 0.372549, 1,
1.651, 1.756683, 1.551377, 1, 0, 0.3647059, 1,
1.664655, -1.697284, 2.317592, 1, 0, 0.3607843, 1,
1.671788, -0.4027677, 2.423906, 1, 0, 0.3529412, 1,
1.684694, 0.07574429, 1.609897, 1, 0, 0.3490196, 1,
1.686669, 0.2111704, 1.951886, 1, 0, 0.3411765, 1,
1.697542, -0.4232011, 1.542967, 1, 0, 0.3372549, 1,
1.698722, -0.8964056, 0.8041686, 1, 0, 0.3294118, 1,
1.700689, -0.2359042, 2.169551, 1, 0, 0.3254902, 1,
1.702283, 0.6122022, 1.980816, 1, 0, 0.3176471, 1,
1.72398, 2.181193, -1.149452, 1, 0, 0.3137255, 1,
1.732816, -0.4089496, 4.677847, 1, 0, 0.3058824, 1,
1.757066, 0.3877709, 0.9494485, 1, 0, 0.2980392, 1,
1.760101, 1.52345, 1.11934, 1, 0, 0.2941177, 1,
1.761975, -1.078207, 3.152167, 1, 0, 0.2862745, 1,
1.771331, -1.361951, 1.211649, 1, 0, 0.282353, 1,
1.771388, -0.6840084, -0.3471092, 1, 0, 0.2745098, 1,
1.792686, -1.491029, 3.566528, 1, 0, 0.2705882, 1,
1.794342, 0.3225417, 0.695454, 1, 0, 0.2627451, 1,
1.802048, -1.310003, 1.911531, 1, 0, 0.2588235, 1,
1.804582, -0.5016252, 1.043966, 1, 0, 0.2509804, 1,
1.829963, -1.804697, 0.6249695, 1, 0, 0.2470588, 1,
1.843295, 2.470689, -0.3149207, 1, 0, 0.2392157, 1,
1.846867, -1.060149, 1.331572, 1, 0, 0.2352941, 1,
1.851714, -0.1888814, 2.073974, 1, 0, 0.227451, 1,
1.852773, 0.5593712, 2.049667, 1, 0, 0.2235294, 1,
1.85353, -1.55519, 3.554173, 1, 0, 0.2156863, 1,
1.855744, 1.126308, -0.6129647, 1, 0, 0.2117647, 1,
1.902381, 0.06106233, -0.06860145, 1, 0, 0.2039216, 1,
1.913625, -0.3618835, 1.456222, 1, 0, 0.1960784, 1,
1.919784, -0.4412239, 1.083566, 1, 0, 0.1921569, 1,
1.920977, -0.6018556, 0.8526607, 1, 0, 0.1843137, 1,
1.945871, 0.3395881, 0.1214491, 1, 0, 0.1803922, 1,
1.970293, 2.219047, 0.3646497, 1, 0, 0.172549, 1,
1.971631, -1.236654, 3.682466, 1, 0, 0.1686275, 1,
1.99441, 2.232537, 1.155153, 1, 0, 0.1607843, 1,
1.996727, -1.060715, 1.484718, 1, 0, 0.1568628, 1,
2.038213, 0.1131965, 1.594626, 1, 0, 0.1490196, 1,
2.045094, -0.2923287, 1.479681, 1, 0, 0.145098, 1,
2.070057, 0.6395286, 1.248433, 1, 0, 0.1372549, 1,
2.126767, 0.783708, 0.3390626, 1, 0, 0.1333333, 1,
2.127567, 0.6439887, 0.8808609, 1, 0, 0.1254902, 1,
2.128205, -1.013184, 2.206186, 1, 0, 0.1215686, 1,
2.12839, 0.1322514, 2.711864, 1, 0, 0.1137255, 1,
2.135313, -0.2177082, 0.7372494, 1, 0, 0.1098039, 1,
2.176632, 0.1455051, 1.260448, 1, 0, 0.1019608, 1,
2.19526, -0.9110893, 0.05531747, 1, 0, 0.09411765, 1,
2.208759, -2.166341, 1.772552, 1, 0, 0.09019608, 1,
2.284226, 2.095565, 0.9850779, 1, 0, 0.08235294, 1,
2.309705, -0.3795337, 2.355093, 1, 0, 0.07843138, 1,
2.325081, -0.1056364, 0.8758771, 1, 0, 0.07058824, 1,
2.354155, 0.3191265, 3.802089, 1, 0, 0.06666667, 1,
2.383811, 0.9273207, 2.86919, 1, 0, 0.05882353, 1,
2.4597, 0.2976001, 2.227651, 1, 0, 0.05490196, 1,
2.467419, 0.719784, 2.27274, 1, 0, 0.04705882, 1,
2.578149, 0.4474822, 1.398883, 1, 0, 0.04313726, 1,
2.582837, -1.240623, 1.734662, 1, 0, 0.03529412, 1,
2.748552, 1.018097, -0.7346168, 1, 0, 0.03137255, 1,
2.820942, 1.113753, -0.1859178, 1, 0, 0.02352941, 1,
3.105846, 1.122943, 1.168114, 1, 0, 0.01960784, 1,
3.180343, 1.069342, -0.1340554, 1, 0, 0.01176471, 1,
3.243772, -1.419266, 2.195399, 1, 0, 0.007843138, 1
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
-0.1084045, -4.284306, -7.569762, 0, -0.5, 0.5, 0.5,
-0.1084045, -4.284306, -7.569762, 1, -0.5, 0.5, 0.5,
-0.1084045, -4.284306, -7.569762, 1, 1.5, 0.5, 0.5,
-0.1084045, -4.284306, -7.569762, 0, 1.5, 0.5, 0.5
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
-4.596969, 0.1720614, -7.569762, 0, -0.5, 0.5, 0.5,
-4.596969, 0.1720614, -7.569762, 1, -0.5, 0.5, 0.5,
-4.596969, 0.1720614, -7.569762, 1, 1.5, 0.5, 0.5,
-4.596969, 0.1720614, -7.569762, 0, 1.5, 0.5, 0.5
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
-4.596969, -4.284306, -0.3735209, 0, -0.5, 0.5, 0.5,
-4.596969, -4.284306, -0.3735209, 1, -0.5, 0.5, 0.5,
-4.596969, -4.284306, -0.3735209, 1, 1.5, 0.5, 0.5,
-4.596969, -4.284306, -0.3735209, 0, 1.5, 0.5, 0.5
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
-3, -3.255914, -5.909091,
3, -3.255914, -5.909091,
-3, -3.255914, -5.909091,
-3, -3.427312, -6.185869,
-2, -3.255914, -5.909091,
-2, -3.427312, -6.185869,
-1, -3.255914, -5.909091,
-1, -3.427312, -6.185869,
0, -3.255914, -5.909091,
0, -3.427312, -6.185869,
1, -3.255914, -5.909091,
1, -3.427312, -6.185869,
2, -3.255914, -5.909091,
2, -3.427312, -6.185869,
3, -3.255914, -5.909091,
3, -3.427312, -6.185869
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
-3, -3.77011, -6.739426, 0, -0.5, 0.5, 0.5,
-3, -3.77011, -6.739426, 1, -0.5, 0.5, 0.5,
-3, -3.77011, -6.739426, 1, 1.5, 0.5, 0.5,
-3, -3.77011, -6.739426, 0, 1.5, 0.5, 0.5,
-2, -3.77011, -6.739426, 0, -0.5, 0.5, 0.5,
-2, -3.77011, -6.739426, 1, -0.5, 0.5, 0.5,
-2, -3.77011, -6.739426, 1, 1.5, 0.5, 0.5,
-2, -3.77011, -6.739426, 0, 1.5, 0.5, 0.5,
-1, -3.77011, -6.739426, 0, -0.5, 0.5, 0.5,
-1, -3.77011, -6.739426, 1, -0.5, 0.5, 0.5,
-1, -3.77011, -6.739426, 1, 1.5, 0.5, 0.5,
-1, -3.77011, -6.739426, 0, 1.5, 0.5, 0.5,
0, -3.77011, -6.739426, 0, -0.5, 0.5, 0.5,
0, -3.77011, -6.739426, 1, -0.5, 0.5, 0.5,
0, -3.77011, -6.739426, 1, 1.5, 0.5, 0.5,
0, -3.77011, -6.739426, 0, 1.5, 0.5, 0.5,
1, -3.77011, -6.739426, 0, -0.5, 0.5, 0.5,
1, -3.77011, -6.739426, 1, -0.5, 0.5, 0.5,
1, -3.77011, -6.739426, 1, 1.5, 0.5, 0.5,
1, -3.77011, -6.739426, 0, 1.5, 0.5, 0.5,
2, -3.77011, -6.739426, 0, -0.5, 0.5, 0.5,
2, -3.77011, -6.739426, 1, -0.5, 0.5, 0.5,
2, -3.77011, -6.739426, 1, 1.5, 0.5, 0.5,
2, -3.77011, -6.739426, 0, 1.5, 0.5, 0.5,
3, -3.77011, -6.739426, 0, -0.5, 0.5, 0.5,
3, -3.77011, -6.739426, 1, -0.5, 0.5, 0.5,
3, -3.77011, -6.739426, 1, 1.5, 0.5, 0.5,
3, -3.77011, -6.739426, 0, 1.5, 0.5, 0.5
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
-3.561146, -3, -5.909091,
-3.561146, 3, -5.909091,
-3.561146, -3, -5.909091,
-3.733784, -3, -6.185869,
-3.561146, -2, -5.909091,
-3.733784, -2, -6.185869,
-3.561146, -1, -5.909091,
-3.733784, -1, -6.185869,
-3.561146, 0, -5.909091,
-3.733784, 0, -6.185869,
-3.561146, 1, -5.909091,
-3.733784, 1, -6.185869,
-3.561146, 2, -5.909091,
-3.733784, 2, -6.185869,
-3.561146, 3, -5.909091,
-3.733784, 3, -6.185869
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
-4.079058, -3, -6.739426, 0, -0.5, 0.5, 0.5,
-4.079058, -3, -6.739426, 1, -0.5, 0.5, 0.5,
-4.079058, -3, -6.739426, 1, 1.5, 0.5, 0.5,
-4.079058, -3, -6.739426, 0, 1.5, 0.5, 0.5,
-4.079058, -2, -6.739426, 0, -0.5, 0.5, 0.5,
-4.079058, -2, -6.739426, 1, -0.5, 0.5, 0.5,
-4.079058, -2, -6.739426, 1, 1.5, 0.5, 0.5,
-4.079058, -2, -6.739426, 0, 1.5, 0.5, 0.5,
-4.079058, -1, -6.739426, 0, -0.5, 0.5, 0.5,
-4.079058, -1, -6.739426, 1, -0.5, 0.5, 0.5,
-4.079058, -1, -6.739426, 1, 1.5, 0.5, 0.5,
-4.079058, -1, -6.739426, 0, 1.5, 0.5, 0.5,
-4.079058, 0, -6.739426, 0, -0.5, 0.5, 0.5,
-4.079058, 0, -6.739426, 1, -0.5, 0.5, 0.5,
-4.079058, 0, -6.739426, 1, 1.5, 0.5, 0.5,
-4.079058, 0, -6.739426, 0, 1.5, 0.5, 0.5,
-4.079058, 1, -6.739426, 0, -0.5, 0.5, 0.5,
-4.079058, 1, -6.739426, 1, -0.5, 0.5, 0.5,
-4.079058, 1, -6.739426, 1, 1.5, 0.5, 0.5,
-4.079058, 1, -6.739426, 0, 1.5, 0.5, 0.5,
-4.079058, 2, -6.739426, 0, -0.5, 0.5, 0.5,
-4.079058, 2, -6.739426, 1, -0.5, 0.5, 0.5,
-4.079058, 2, -6.739426, 1, 1.5, 0.5, 0.5,
-4.079058, 2, -6.739426, 0, 1.5, 0.5, 0.5,
-4.079058, 3, -6.739426, 0, -0.5, 0.5, 0.5,
-4.079058, 3, -6.739426, 1, -0.5, 0.5, 0.5,
-4.079058, 3, -6.739426, 1, 1.5, 0.5, 0.5,
-4.079058, 3, -6.739426, 0, 1.5, 0.5, 0.5
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
-3.561146, -3.255914, -4,
-3.561146, -3.255914, 4,
-3.561146, -3.255914, -4,
-3.733784, -3.427312, -4,
-3.561146, -3.255914, -2,
-3.733784, -3.427312, -2,
-3.561146, -3.255914, 0,
-3.733784, -3.427312, 0,
-3.561146, -3.255914, 2,
-3.733784, -3.427312, 2,
-3.561146, -3.255914, 4,
-3.733784, -3.427312, 4
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
-4.079058, -3.77011, -4, 0, -0.5, 0.5, 0.5,
-4.079058, -3.77011, -4, 1, -0.5, 0.5, 0.5,
-4.079058, -3.77011, -4, 1, 1.5, 0.5, 0.5,
-4.079058, -3.77011, -4, 0, 1.5, 0.5, 0.5,
-4.079058, -3.77011, -2, 0, -0.5, 0.5, 0.5,
-4.079058, -3.77011, -2, 1, -0.5, 0.5, 0.5,
-4.079058, -3.77011, -2, 1, 1.5, 0.5, 0.5,
-4.079058, -3.77011, -2, 0, 1.5, 0.5, 0.5,
-4.079058, -3.77011, 0, 0, -0.5, 0.5, 0.5,
-4.079058, -3.77011, 0, 1, -0.5, 0.5, 0.5,
-4.079058, -3.77011, 0, 1, 1.5, 0.5, 0.5,
-4.079058, -3.77011, 0, 0, 1.5, 0.5, 0.5,
-4.079058, -3.77011, 2, 0, -0.5, 0.5, 0.5,
-4.079058, -3.77011, 2, 1, -0.5, 0.5, 0.5,
-4.079058, -3.77011, 2, 1, 1.5, 0.5, 0.5,
-4.079058, -3.77011, 2, 0, 1.5, 0.5, 0.5,
-4.079058, -3.77011, 4, 0, -0.5, 0.5, 0.5,
-4.079058, -3.77011, 4, 1, -0.5, 0.5, 0.5,
-4.079058, -3.77011, 4, 1, 1.5, 0.5, 0.5,
-4.079058, -3.77011, 4, 0, 1.5, 0.5, 0.5
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
-3.561146, -3.255914, -5.909091,
-3.561146, 3.600037, -5.909091,
-3.561146, -3.255914, 5.162049,
-3.561146, 3.600037, 5.162049,
-3.561146, -3.255914, -5.909091,
-3.561146, -3.255914, 5.162049,
-3.561146, 3.600037, -5.909091,
-3.561146, 3.600037, 5.162049,
-3.561146, -3.255914, -5.909091,
3.344337, -3.255914, -5.909091,
-3.561146, -3.255914, 5.162049,
3.344337, -3.255914, 5.162049,
-3.561146, 3.600037, -5.909091,
3.344337, 3.600037, -5.909091,
-3.561146, 3.600037, 5.162049,
3.344337, 3.600037, 5.162049,
3.344337, -3.255914, -5.909091,
3.344337, 3.600037, -5.909091,
3.344337, -3.255914, 5.162049,
3.344337, 3.600037, 5.162049,
3.344337, -3.255914, -5.909091,
3.344337, -3.255914, 5.162049,
3.344337, 3.600037, -5.909091,
3.344337, 3.600037, 5.162049
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
var radius = 7.870734;
var distance = 35.01779;
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
mvMatrix.translate( 0.1084045, -0.1720614, 0.3735209 );
mvMatrix.scale( 1.232353, 1.241256, 0.7686645 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.01779);
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
triticonazole<-read.table("triticonazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triticonazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'triticonazole' not found
```

```r
y<-triticonazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'triticonazole' not found
```

```r
z<-triticonazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'triticonazole' not found
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
-3.460581, -0.07711617, -0.5828796, 0, 0, 1, 1, 1,
-3.175588, -0.7758513, -2.328214, 1, 0, 0, 1, 1,
-3.171735, -0.3658352, -1.05741, 1, 0, 0, 1, 1,
-3.107865, -0.03022119, 0.3113352, 1, 0, 0, 1, 1,
-2.921163, 1.178988, -1.62604, 1, 0, 0, 1, 1,
-2.815537, 0.1247288, -0.5162864, 1, 0, 0, 1, 1,
-2.710053, -0.2993859, -2.448424, 0, 0, 0, 1, 1,
-2.66209, -0.009107522, 0.4528507, 0, 0, 0, 1, 1,
-2.615041, 1.165034, -1.589599, 0, 0, 0, 1, 1,
-2.59455, -0.5546693, -1.585281, 0, 0, 0, 1, 1,
-2.522953, -0.4610996, -2.563061, 0, 0, 0, 1, 1,
-2.515433, -0.09152697, -1.106692, 0, 0, 0, 1, 1,
-2.450304, 0.9520367, 0.3258336, 0, 0, 0, 1, 1,
-2.404755, -0.9134561, -1.520729, 1, 1, 1, 1, 1,
-2.360792, 0.2896584, -1.782195, 1, 1, 1, 1, 1,
-2.333051, -0.5465118, -0.6301491, 1, 1, 1, 1, 1,
-2.178125, 0.546846, -0.06863972, 1, 1, 1, 1, 1,
-2.173031, 0.2784707, -1.214281, 1, 1, 1, 1, 1,
-2.169354, -0.4004633, -2.288033, 1, 1, 1, 1, 1,
-2.163824, -1.126543, -2.241114, 1, 1, 1, 1, 1,
-2.161792, -0.3875746, -2.188881, 1, 1, 1, 1, 1,
-2.139202, 0.1989998, -0.7594396, 1, 1, 1, 1, 1,
-2.134356, -0.1293713, -1.940099, 1, 1, 1, 1, 1,
-2.115957, 0.303663, -2.021932, 1, 1, 1, 1, 1,
-2.110285, 0.2670303, -0.5426338, 1, 1, 1, 1, 1,
-2.109634, 1.008675, 0.4434274, 1, 1, 1, 1, 1,
-2.100756, 0.4320371, -0.5319319, 1, 1, 1, 1, 1,
-2.084308, 0.4877984, -1.561252, 1, 1, 1, 1, 1,
-2.035665, -0.6498463, -1.390214, 0, 0, 1, 1, 1,
-2.024391, -1.423164, -2.392636, 1, 0, 0, 1, 1,
-1.988529, 2.576712, -1.680885, 1, 0, 0, 1, 1,
-1.927201, -0.6223681, -0.8795254, 1, 0, 0, 1, 1,
-1.900981, -0.8878978, -1.545889, 1, 0, 0, 1, 1,
-1.897845, -0.9411652, -2.473449, 1, 0, 0, 1, 1,
-1.892971, 2.431072, -0.8212465, 0, 0, 0, 1, 1,
-1.875862, -0.4099643, -1.080377, 0, 0, 0, 1, 1,
-1.852766, -0.02325187, -3.187151, 0, 0, 0, 1, 1,
-1.844151, -0.352488, -3.209673, 0, 0, 0, 1, 1,
-1.826515, 1.92783, -1.259027, 0, 0, 0, 1, 1,
-1.823705, -0.9787709, -2.143489, 0, 0, 0, 1, 1,
-1.810192, 0.9543762, -1.214149, 0, 0, 0, 1, 1,
-1.799378, 1.389793, -1.323746, 1, 1, 1, 1, 1,
-1.79388, -0.2933624, -3.038088, 1, 1, 1, 1, 1,
-1.776811, 0.4421124, 0.9449885, 1, 1, 1, 1, 1,
-1.769355, -0.6684733, -0.7325049, 1, 1, 1, 1, 1,
-1.768248, 0.7772346, -2.410185, 1, 1, 1, 1, 1,
-1.733414, 0.2317626, -1.238124, 1, 1, 1, 1, 1,
-1.721176, -0.1788092, -1.907405, 1, 1, 1, 1, 1,
-1.715243, 1.266397, 0.6507787, 1, 1, 1, 1, 1,
-1.703712, 0.7029608, -0.3032409, 1, 1, 1, 1, 1,
-1.689465, 0.09865477, -0.833567, 1, 1, 1, 1, 1,
-1.689317, -0.5917677, -2.473667, 1, 1, 1, 1, 1,
-1.688562, -0.9234399, -2.453064, 1, 1, 1, 1, 1,
-1.683605, -0.8166999, -2.799578, 1, 1, 1, 1, 1,
-1.671231, 0.5000815, -1.71171, 1, 1, 1, 1, 1,
-1.655579, -0.2878437, -1.046789, 1, 1, 1, 1, 1,
-1.627029, -0.3575611, -1.234763, 0, 0, 1, 1, 1,
-1.624736, 0.5469802, -0.362883, 1, 0, 0, 1, 1,
-1.618598, -0.05583137, -2.402148, 1, 0, 0, 1, 1,
-1.599966, 0.7205798, -2.679642, 1, 0, 0, 1, 1,
-1.586533, 2.554116, 1.052358, 1, 0, 0, 1, 1,
-1.575788, 0.7538226, -1.044418, 1, 0, 0, 1, 1,
-1.559688, -0.7700675, -1.578717, 0, 0, 0, 1, 1,
-1.550124, -0.1478845, -1.719381, 0, 0, 0, 1, 1,
-1.53881, -0.2854054, -2.199011, 0, 0, 0, 1, 1,
-1.535603, -0.5698666, -2.005819, 0, 0, 0, 1, 1,
-1.531171, -0.6947542, -2.17207, 0, 0, 0, 1, 1,
-1.519921, 0.3864926, -1.217374, 0, 0, 0, 1, 1,
-1.519225, -0.5047672, -2.656419, 0, 0, 0, 1, 1,
-1.502651, 0.4092017, -2.887616, 1, 1, 1, 1, 1,
-1.49403, -0.01977785, -1.689445, 1, 1, 1, 1, 1,
-1.484961, -0.3732035, -3.001999, 1, 1, 1, 1, 1,
-1.483459, -0.4043589, -4.200339, 1, 1, 1, 1, 1,
-1.474092, 1.094938, -1.135417, 1, 1, 1, 1, 1,
-1.471069, -0.4737964, -3.802054, 1, 1, 1, 1, 1,
-1.469482, 2.377603, 0.7750418, 1, 1, 1, 1, 1,
-1.46034, 0.2244912, -2.066189, 1, 1, 1, 1, 1,
-1.460125, -2.221205, -3.840429, 1, 1, 1, 1, 1,
-1.451177, -0.4777705, -1.44787, 1, 1, 1, 1, 1,
-1.44718, -0.3287719, -3.190449, 1, 1, 1, 1, 1,
-1.441887, -0.0695141, -2.352597, 1, 1, 1, 1, 1,
-1.439593, -0.2686939, -1.03641, 1, 1, 1, 1, 1,
-1.437481, 0.4605136, -1.174649, 1, 1, 1, 1, 1,
-1.430911, 1.353337, 0.09162709, 1, 1, 1, 1, 1,
-1.430438, 1.45359, 0.02401103, 0, 0, 1, 1, 1,
-1.420509, -0.09024555, -1.234386, 1, 0, 0, 1, 1,
-1.408136, -1.424943, -3.494673, 1, 0, 0, 1, 1,
-1.407871, -0.2178937, -0.6377189, 1, 0, 0, 1, 1,
-1.400764, -0.8152325, -3.918955, 1, 0, 0, 1, 1,
-1.397696, -0.539582, -1.230147, 1, 0, 0, 1, 1,
-1.384885, 0.04666721, -0.1509905, 0, 0, 0, 1, 1,
-1.384678, 1.140658, -0.5626622, 0, 0, 0, 1, 1,
-1.376893, 0.2899722, -1.896176, 0, 0, 0, 1, 1,
-1.368247, -0.1900202, -0.8022062, 0, 0, 0, 1, 1,
-1.36341, 2.119557, 1.250134, 0, 0, 0, 1, 1,
-1.362655, 0.02472812, -1.787393, 0, 0, 0, 1, 1,
-1.355909, 1.68556, -1.450096, 0, 0, 0, 1, 1,
-1.350703, 0.5067192, -0.6745763, 1, 1, 1, 1, 1,
-1.345595, 0.4325893, 0.4752389, 1, 1, 1, 1, 1,
-1.341843, -1.717736, -4.129059, 1, 1, 1, 1, 1,
-1.332024, -0.2988882, -1.532274, 1, 1, 1, 1, 1,
-1.331312, -1.039147, -2.668794, 1, 1, 1, 1, 1,
-1.326221, 0.4129056, -0.9319391, 1, 1, 1, 1, 1,
-1.324772, -0.9392562, -2.831618, 1, 1, 1, 1, 1,
-1.313775, 1.519645, -0.7121224, 1, 1, 1, 1, 1,
-1.30638, -2.138012, -4.194496, 1, 1, 1, 1, 1,
-1.279314, -0.9957501, -1.352909, 1, 1, 1, 1, 1,
-1.278931, -0.2378144, -3.213492, 1, 1, 1, 1, 1,
-1.277489, 0.4876802, -0.5566547, 1, 1, 1, 1, 1,
-1.273476, 1.048456, -2.2752, 1, 1, 1, 1, 1,
-1.256446, 0.2919226, -1.309045, 1, 1, 1, 1, 1,
-1.253052, -1.139716, -3.525578, 1, 1, 1, 1, 1,
-1.251627, 0.08362383, -0.02599729, 0, 0, 1, 1, 1,
-1.250558, 0.1894741, -2.028291, 1, 0, 0, 1, 1,
-1.243793, 0.7657304, -2.308571, 1, 0, 0, 1, 1,
-1.240672, -0.8666751, -0.9071314, 1, 0, 0, 1, 1,
-1.23877, -0.3138523, -2.289471, 1, 0, 0, 1, 1,
-1.234131, 0.3718662, -1.649365, 1, 0, 0, 1, 1,
-1.220012, 0.5187773, -0.652229, 0, 0, 0, 1, 1,
-1.216322, -0.4338015, -3.516802, 0, 0, 0, 1, 1,
-1.201889, -0.4004689, -1.311773, 0, 0, 0, 1, 1,
-1.197154, -0.5793372, -1.566463, 0, 0, 0, 1, 1,
-1.194706, 0.8870162, -0.7911498, 0, 0, 0, 1, 1,
-1.190745, 0.8558762, -0.7149787, 0, 0, 0, 1, 1,
-1.189107, 0.5981306, -1.256332, 0, 0, 0, 1, 1,
-1.181476, -1.018463, -1.457384, 1, 1, 1, 1, 1,
-1.170732, -0.8387271, -3.171759, 1, 1, 1, 1, 1,
-1.162989, 1.810461, -0.8149241, 1, 1, 1, 1, 1,
-1.161568, 0.4192136, -1.749699, 1, 1, 1, 1, 1,
-1.147871, -0.8082692, -1.067076, 1, 1, 1, 1, 1,
-1.145851, 0.5489105, -0.5440772, 1, 1, 1, 1, 1,
-1.138126, -2.193508, -4.829824, 1, 1, 1, 1, 1,
-1.133109, 0.6331405, -0.2343408, 1, 1, 1, 1, 1,
-1.127347, -0.5535843, -1.395657, 1, 1, 1, 1, 1,
-1.126388, 1.511967, -0.3262455, 1, 1, 1, 1, 1,
-1.124507, 0.3872217, -0.7754087, 1, 1, 1, 1, 1,
-1.123662, 0.9377724, -0.3788573, 1, 1, 1, 1, 1,
-1.102674, 1.997161, 0.5732614, 1, 1, 1, 1, 1,
-1.09559, 0.6738893, -1.561692, 1, 1, 1, 1, 1,
-1.094594, 0.9604838, -1.311394, 1, 1, 1, 1, 1,
-1.089595, 0.9052081, 0.2621258, 0, 0, 1, 1, 1,
-1.087475, 0.05765006, -1.465568, 1, 0, 0, 1, 1,
-1.082625, 0.05778149, -1.535439, 1, 0, 0, 1, 1,
-1.080827, 0.4549427, -2.713157, 1, 0, 0, 1, 1,
-1.075061, -0.1634471, -2.538803, 1, 0, 0, 1, 1,
-1.066507, -0.5432888, 0.1420953, 1, 0, 0, 1, 1,
-1.065202, 0.5148197, -0.1053518, 0, 0, 0, 1, 1,
-1.059598, 0.7462105, -1.776658, 0, 0, 0, 1, 1,
-1.056047, 2.13799, -2.666592, 0, 0, 0, 1, 1,
-1.052748, -2.779523, -2.59914, 0, 0, 0, 1, 1,
-1.050495, -2.759078, -3.122321, 0, 0, 0, 1, 1,
-1.048665, -0.4494066, -0.9631104, 0, 0, 0, 1, 1,
-1.04402, 1.612951, -1.17739, 0, 0, 0, 1, 1,
-1.040786, -2.303985, -1.745803, 1, 1, 1, 1, 1,
-1.03716, -1.751084, -4.388339, 1, 1, 1, 1, 1,
-1.036986, -1.453363, -2.373824, 1, 1, 1, 1, 1,
-1.033175, 0.1592256, -0.4948756, 1, 1, 1, 1, 1,
-1.030542, 0.6983722, -0.2539693, 1, 1, 1, 1, 1,
-1.029675, -0.512054, -1.952124, 1, 1, 1, 1, 1,
-1.028206, 0.3992452, -3.124297, 1, 1, 1, 1, 1,
-1.018665, -0.9933202, -3.144848, 1, 1, 1, 1, 1,
-1.01558, -0.1137767, -1.090975, 1, 1, 1, 1, 1,
-1.013144, -0.8955224, -1.991443, 1, 1, 1, 1, 1,
-1.007002, 1.237725, -1.600327, 1, 1, 1, 1, 1,
-0.992792, -0.0628168, -2.301461, 1, 1, 1, 1, 1,
-0.990752, -0.1992114, -1.29198, 1, 1, 1, 1, 1,
-0.9860773, -0.3913823, -1.519043, 1, 1, 1, 1, 1,
-0.983411, -1.445652, -4.813867, 1, 1, 1, 1, 1,
-0.9825855, -0.4936379, -1.637072, 0, 0, 1, 1, 1,
-0.9732599, -1.016877, -2.827553, 1, 0, 0, 1, 1,
-0.9701042, 1.134423, -0.4009573, 1, 0, 0, 1, 1,
-0.9614746, -1.016872, -3.147797, 1, 0, 0, 1, 1,
-0.9593902, 0.7165011, -1.613267, 1, 0, 0, 1, 1,
-0.9569451, 0.2359039, -1.560958, 1, 0, 0, 1, 1,
-0.9457909, -0.02902938, -1.645958, 0, 0, 0, 1, 1,
-0.9451293, -0.6045359, -2.463845, 0, 0, 0, 1, 1,
-0.9350818, 0.4519276, -2.189483, 0, 0, 0, 1, 1,
-0.9339349, 0.4264141, -2.109061, 0, 0, 0, 1, 1,
-0.9336947, -0.4950217, -2.888237, 0, 0, 0, 1, 1,
-0.9313334, -0.158523, -0.1946038, 0, 0, 0, 1, 1,
-0.9267351, -0.3390103, -1.142514, 0, 0, 0, 1, 1,
-0.9224725, -0.01847719, -0.4147409, 1, 1, 1, 1, 1,
-0.9197022, -0.6557016, -2.696828, 1, 1, 1, 1, 1,
-0.919642, -0.6554915, -1.419197, 1, 1, 1, 1, 1,
-0.9191031, -0.5837301, -0.877094, 1, 1, 1, 1, 1,
-0.9190189, -0.9842954, -2.130654, 1, 1, 1, 1, 1,
-0.9161223, 0.1584942, -1.056211, 1, 1, 1, 1, 1,
-0.9145419, -0.07005242, -1.067758, 1, 1, 1, 1, 1,
-0.9073825, -0.1603697, -3.750342, 1, 1, 1, 1, 1,
-0.9015952, 0.02891023, 0.6816394, 1, 1, 1, 1, 1,
-0.8972777, -0.2950295, -1.439816, 1, 1, 1, 1, 1,
-0.8912649, -1.88912, -1.495788, 1, 1, 1, 1, 1,
-0.8896767, 0.9290522, -1.526746, 1, 1, 1, 1, 1,
-0.8888713, -0.8635074, -0.800953, 1, 1, 1, 1, 1,
-0.8883384, -0.3401402, -2.494037, 1, 1, 1, 1, 1,
-0.8799561, -1.518449, -3.327419, 1, 1, 1, 1, 1,
-0.8794548, 0.709039, -1.488704, 0, 0, 1, 1, 1,
-0.8752484, 0.4311082, -2.320828, 1, 0, 0, 1, 1,
-0.8746263, 0.6504865, -0.5666081, 1, 0, 0, 1, 1,
-0.871648, -1.049636, -1.617152, 1, 0, 0, 1, 1,
-0.8709416, -0.07019676, -1.453494, 1, 0, 0, 1, 1,
-0.8697356, 1.048316, -0.6879015, 1, 0, 0, 1, 1,
-0.8695091, -0.05333538, -2.248138, 0, 0, 0, 1, 1,
-0.8683781, 1.220495, -1.674075, 0, 0, 0, 1, 1,
-0.8660784, 3.500193, -1.058096, 0, 0, 0, 1, 1,
-0.8600478, -1.236691, -4.138686, 0, 0, 0, 1, 1,
-0.8600301, -0.2578905, -1.053885, 0, 0, 0, 1, 1,
-0.8590798, -1.127254, -2.547617, 0, 0, 0, 1, 1,
-0.8578959, 0.8649298, -0.995318, 0, 0, 0, 1, 1,
-0.8532314, -0.6612455, -1.593846, 1, 1, 1, 1, 1,
-0.8520822, 0.1254644, -1.491888, 1, 1, 1, 1, 1,
-0.8514267, -0.6976773, -2.202035, 1, 1, 1, 1, 1,
-0.8494327, 0.2887587, -0.5521092, 1, 1, 1, 1, 1,
-0.8419577, 1.101892, -1.243728, 1, 1, 1, 1, 1,
-0.8383009, 1.303891, -1.809117, 1, 1, 1, 1, 1,
-0.8372943, -0.7431332, -2.693563, 1, 1, 1, 1, 1,
-0.8339189, -1.795347, -1.851776, 1, 1, 1, 1, 1,
-0.8301929, 0.2140518, -1.694278, 1, 1, 1, 1, 1,
-0.8136034, -1.403122, -1.486074, 1, 1, 1, 1, 1,
-0.7994672, 0.7442794, 0.7625464, 1, 1, 1, 1, 1,
-0.799153, -1.281545, -2.935254, 1, 1, 1, 1, 1,
-0.7950689, -1.295569, -2.904679, 1, 1, 1, 1, 1,
-0.794569, -0.4339483, -4.602526, 1, 1, 1, 1, 1,
-0.7938066, 0.965992, -0.4462852, 1, 1, 1, 1, 1,
-0.7899911, -1.192501, -2.438715, 0, 0, 1, 1, 1,
-0.7889687, 0.1217365, -2.691248, 1, 0, 0, 1, 1,
-0.7884039, -0.4223374, -1.670473, 1, 0, 0, 1, 1,
-0.7857462, 0.01852875, -2.987712, 1, 0, 0, 1, 1,
-0.7853061, -1.372732, -3.39243, 1, 0, 0, 1, 1,
-0.7830511, 0.3287357, -1.122615, 1, 0, 0, 1, 1,
-0.7827936, 0.1637432, -1.293083, 0, 0, 0, 1, 1,
-0.7816913, 0.6956937, -0.9355917, 0, 0, 0, 1, 1,
-0.7805278, -1.013665, -2.733069, 0, 0, 0, 1, 1,
-0.7770278, -0.4494345, -1.960701, 0, 0, 0, 1, 1,
-0.7769995, -1.273094, -3.104712, 0, 0, 0, 1, 1,
-0.76828, -0.3958555, -1.337394, 0, 0, 0, 1, 1,
-0.7671922, -0.7570725, -2.567886, 0, 0, 0, 1, 1,
-0.7632601, 1.055888, 0.2028956, 1, 1, 1, 1, 1,
-0.7608135, -0.7259662, -2.596196, 1, 1, 1, 1, 1,
-0.7566936, 0.6269395, -0.5142201, 1, 1, 1, 1, 1,
-0.7529106, 0.3635575, -0.2317643, 1, 1, 1, 1, 1,
-0.7525142, -1.827229, -2.224926, 1, 1, 1, 1, 1,
-0.7450306, -2.18441, -3.751516, 1, 1, 1, 1, 1,
-0.742309, -0.07397883, -3.320563, 1, 1, 1, 1, 1,
-0.7273692, 1.479456, 0.5309962, 1, 1, 1, 1, 1,
-0.7251132, 0.2226291, -0.6279178, 1, 1, 1, 1, 1,
-0.7148114, -2.300311, -2.216414, 1, 1, 1, 1, 1,
-0.7092546, 1.380517, -2.440445, 1, 1, 1, 1, 1,
-0.6998835, 0.1599927, -2.192699, 1, 1, 1, 1, 1,
-0.6986628, 0.3996382, -0.3072177, 1, 1, 1, 1, 1,
-0.6912684, -0.032412, -3.562469, 1, 1, 1, 1, 1,
-0.686817, 0.7139776, 0.08921647, 1, 1, 1, 1, 1,
-0.6854647, 0.8042794, 0.05621131, 0, 0, 1, 1, 1,
-0.6792217, -0.5116493, -2.308634, 1, 0, 0, 1, 1,
-0.6754379, -0.24311, -1.046051, 1, 0, 0, 1, 1,
-0.6726597, -0.3888997, -3.073311, 1, 0, 0, 1, 1,
-0.6684867, -0.100115, -2.144923, 1, 0, 0, 1, 1,
-0.6682256, 2.079781, -0.5422785, 1, 0, 0, 1, 1,
-0.6671095, -0.54314, 0.155168, 0, 0, 0, 1, 1,
-0.6647449, 1.374814, -0.6502624, 0, 0, 0, 1, 1,
-0.6585198, -2.199507, -3.851307, 0, 0, 0, 1, 1,
-0.6554375, -0.6040736, -1.503225, 0, 0, 0, 1, 1,
-0.653339, 0.3675722, 0.1313259, 0, 0, 0, 1, 1,
-0.6509318, 0.4086892, 0.697794, 0, 0, 0, 1, 1,
-0.6509132, -1.144573, -1.853951, 0, 0, 0, 1, 1,
-0.6434804, 1.476101, -1.081558, 1, 1, 1, 1, 1,
-0.6433051, 0.4828511, -1.941743, 1, 1, 1, 1, 1,
-0.6403748, -0.03788068, -0.6469484, 1, 1, 1, 1, 1,
-0.6393878, 2.198033, 1.216026, 1, 1, 1, 1, 1,
-0.6371101, -0.7840865, -2.309421, 1, 1, 1, 1, 1,
-0.635904, 0.4180288, 0.8400376, 1, 1, 1, 1, 1,
-0.6354071, -1.063902, -2.301116, 1, 1, 1, 1, 1,
-0.6351907, -1.364027, -2.421034, 1, 1, 1, 1, 1,
-0.6351586, 0.106754, 0.05479183, 1, 1, 1, 1, 1,
-0.6279634, -0.4578145, -0.4712495, 1, 1, 1, 1, 1,
-0.6237187, 0.2461134, -1.109702, 1, 1, 1, 1, 1,
-0.6180064, 0.503801, -1.086766, 1, 1, 1, 1, 1,
-0.6157809, -0.8234184, -3.765132, 1, 1, 1, 1, 1,
-0.6123993, 1.226926, -2.395554, 1, 1, 1, 1, 1,
-0.6033749, -0.5234404, -2.008525, 1, 1, 1, 1, 1,
-0.5984236, 2.787506, -0.5406076, 0, 0, 1, 1, 1,
-0.5936719, -2.097751, -3.875158, 1, 0, 0, 1, 1,
-0.5914809, 0.4016429, -1.202723, 1, 0, 0, 1, 1,
-0.5911099, 0.02588463, -0.3273516, 1, 0, 0, 1, 1,
-0.591032, 2.043078, 0.09662376, 1, 0, 0, 1, 1,
-0.5884826, -0.4595212, -2.961256, 1, 0, 0, 1, 1,
-0.5870425, -1.180544, -2.629049, 0, 0, 0, 1, 1,
-0.5830664, -0.8164669, -0.6223584, 0, 0, 0, 1, 1,
-0.5799065, 0.6263676, -1.539039, 0, 0, 0, 1, 1,
-0.5779482, -1.090544, -2.265767, 0, 0, 0, 1, 1,
-0.5751433, 0.6926005, -0.8323635, 0, 0, 0, 1, 1,
-0.5698733, -0.563706, -1.509216, 0, 0, 0, 1, 1,
-0.5695574, -2.749888, -3.122888, 0, 0, 0, 1, 1,
-0.5655962, 0.133511, -0.1419982, 1, 1, 1, 1, 1,
-0.5651594, 1.756205, 0.9561904, 1, 1, 1, 1, 1,
-0.5594723, -0.6762319, -4.185648, 1, 1, 1, 1, 1,
-0.5512109, 0.1946995, -0.3913396, 1, 1, 1, 1, 1,
-0.5492732, 0.01360813, -2.3909, 1, 1, 1, 1, 1,
-0.5472303, 0.8462729, -2.223062, 1, 1, 1, 1, 1,
-0.5448583, 0.2202503, -0.117937, 1, 1, 1, 1, 1,
-0.5443128, 2.154906, 0.5906568, 1, 1, 1, 1, 1,
-0.5436342, 0.2405462, -2.611136, 1, 1, 1, 1, 1,
-0.5357071, 0.4606616, -0.9428129, 1, 1, 1, 1, 1,
-0.532944, -0.01986683, -0.8385308, 1, 1, 1, 1, 1,
-0.5319619, -2.106967, -3.646174, 1, 1, 1, 1, 1,
-0.5250039, 1.470941, -0.8972281, 1, 1, 1, 1, 1,
-0.5162894, 0.3859583, -2.498867, 1, 1, 1, 1, 1,
-0.514961, 1.003271, -2.220848, 1, 1, 1, 1, 1,
-0.5110321, -1.871768, -2.744574, 0, 0, 1, 1, 1,
-0.5053229, -0.2922877, -2.611327, 1, 0, 0, 1, 1,
-0.5040087, 1.482788, -0.9019452, 1, 0, 0, 1, 1,
-0.5039174, -0.1191548, -0.2654613, 1, 0, 0, 1, 1,
-0.4979281, 0.2632411, -0.8037076, 1, 0, 0, 1, 1,
-0.4972895, 1.241665, -0.2130477, 1, 0, 0, 1, 1,
-0.4950168, 0.4736732, -0.3508179, 0, 0, 0, 1, 1,
-0.4814237, -0.3965381, -4.497714, 0, 0, 0, 1, 1,
-0.4768713, -0.2060883, -3.104149, 0, 0, 0, 1, 1,
-0.4745967, 2.220054, -0.2712028, 0, 0, 0, 1, 1,
-0.4741618, 0.04715445, -1.015719, 0, 0, 0, 1, 1,
-0.4672261, 0.8188837, 0.007062979, 0, 0, 0, 1, 1,
-0.4666131, -0.7984237, -3.178805, 0, 0, 0, 1, 1,
-0.4643685, -2.675738, -5.545646, 1, 1, 1, 1, 1,
-0.460722, 0.518332, -0.008842923, 1, 1, 1, 1, 1,
-0.4595493, -0.2884856, -2.170532, 1, 1, 1, 1, 1,
-0.4580937, 1.129313, -0.8497499, 1, 1, 1, 1, 1,
-0.4546663, -0.6361418, -2.527844, 1, 1, 1, 1, 1,
-0.4505673, 2.323406, -1.985471, 1, 1, 1, 1, 1,
-0.439844, 0.02830455, 0.7972801, 1, 1, 1, 1, 1,
-0.4398067, -0.08467243, -2.191051, 1, 1, 1, 1, 1,
-0.4390651, -0.7897255, -2.64057, 1, 1, 1, 1, 1,
-0.4364558, -2.1712, -2.325239, 1, 1, 1, 1, 1,
-0.4357886, -0.08343238, -2.219293, 1, 1, 1, 1, 1,
-0.4351994, 1.177268, 1.421017, 1, 1, 1, 1, 1,
-0.4337406, 0.7371097, 0.1582151, 1, 1, 1, 1, 1,
-0.4331837, -1.628504, -2.406319, 1, 1, 1, 1, 1,
-0.4311941, -2.623495, -2.947562, 1, 1, 1, 1, 1,
-0.4305216, 0.1582033, -0.6164311, 0, 0, 1, 1, 1,
-0.4253354, -0.9325115, -2.916711, 1, 0, 0, 1, 1,
-0.4236928, -0.1734085, -2.616614, 1, 0, 0, 1, 1,
-0.4209715, -0.03811034, -3.559317, 1, 0, 0, 1, 1,
-0.4184469, 0.385609, -2.180511, 1, 0, 0, 1, 1,
-0.4170933, -1.553393, -3.069301, 1, 0, 0, 1, 1,
-0.4146295, -1.313706, -3.190983, 0, 0, 0, 1, 1,
-0.4025063, -1.819402, -3.421341, 0, 0, 0, 1, 1,
-0.4021481, -0.879594, -1.933911, 0, 0, 0, 1, 1,
-0.4020316, -1.336997, -2.956062, 0, 0, 0, 1, 1,
-0.4016926, -0.5986158, -1.896755, 0, 0, 0, 1, 1,
-0.3997143, -0.02129361, -3.101743, 0, 0, 0, 1, 1,
-0.3994469, 0.6904627, -1.399983, 0, 0, 0, 1, 1,
-0.3960177, -0.4147385, -2.21815, 1, 1, 1, 1, 1,
-0.3943874, -0.3329754, -2.014224, 1, 1, 1, 1, 1,
-0.3932344, 0.7772794, -0.1605229, 1, 1, 1, 1, 1,
-0.3900196, -1.502262, -3.449205, 1, 1, 1, 1, 1,
-0.388492, 1.000719, 0.9605407, 1, 1, 1, 1, 1,
-0.3857231, -0.2356114, -0.4121838, 1, 1, 1, 1, 1,
-0.3856976, 0.1655045, -0.09551163, 1, 1, 1, 1, 1,
-0.3792865, 1.470945, -0.2033016, 1, 1, 1, 1, 1,
-0.3790349, -0.5247484, -2.049434, 1, 1, 1, 1, 1,
-0.3779598, 0.08440869, -2.365613, 1, 1, 1, 1, 1,
-0.3776593, -0.6915082, -3.226981, 1, 1, 1, 1, 1,
-0.372155, 1.169685, 0.8706855, 1, 1, 1, 1, 1,
-0.370857, -1.553113, -3.129718, 1, 1, 1, 1, 1,
-0.365139, -0.2159522, -1.985483, 1, 1, 1, 1, 1,
-0.3649881, -0.2152214, -1.483186, 1, 1, 1, 1, 1,
-0.3647987, -0.7308468, -2.78909, 0, 0, 1, 1, 1,
-0.3621881, 0.4180482, -0.6135423, 1, 0, 0, 1, 1,
-0.3568125, 0.8715504, -0.4693095, 1, 0, 0, 1, 1,
-0.3557236, 0.8620763, -1.692519, 1, 0, 0, 1, 1,
-0.3542367, -0.8243445, -2.306914, 1, 0, 0, 1, 1,
-0.3528145, -0.4519332, -2.288815, 1, 0, 0, 1, 1,
-0.3517515, 0.521961, -2.580508, 0, 0, 0, 1, 1,
-0.3436259, 0.5179324, 1.283743, 0, 0, 0, 1, 1,
-0.3397726, -2.441245, -1.894784, 0, 0, 0, 1, 1,
-0.3372898, 0.09378877, -0.6410864, 0, 0, 0, 1, 1,
-0.3365586, -1.525202, -2.969646, 0, 0, 0, 1, 1,
-0.3348157, 0.1648254, -1.854693, 0, 0, 0, 1, 1,
-0.3324954, -0.4920708, -4.289472, 0, 0, 0, 1, 1,
-0.3312745, -1.598523, -1.248746, 1, 1, 1, 1, 1,
-0.330387, -0.3824333, -1.763647, 1, 1, 1, 1, 1,
-0.3295099, -0.4743687, -2.047725, 1, 1, 1, 1, 1,
-0.3229595, 0.7938887, 1.115329, 1, 1, 1, 1, 1,
-0.3166758, -0.2406439, -2.296419, 1, 1, 1, 1, 1,
-0.3059007, -1.037008, -1.671465, 1, 1, 1, 1, 1,
-0.3052301, -0.7976813, -3.078558, 1, 1, 1, 1, 1,
-0.3052205, 0.1010514, -1.300975, 1, 1, 1, 1, 1,
-0.3036306, 1.359513, 1.413229, 1, 1, 1, 1, 1,
-0.3014975, -0.3538958, -1.859289, 1, 1, 1, 1, 1,
-0.3012958, 1.030721, -1.3436, 1, 1, 1, 1, 1,
-0.2971058, -0.05382933, -2.135186, 1, 1, 1, 1, 1,
-0.2938926, 0.02473729, -1.694277, 1, 1, 1, 1, 1,
-0.2899618, -0.1971939, -1.729705, 1, 1, 1, 1, 1,
-0.2762958, 1.765632, 0.02330534, 1, 1, 1, 1, 1,
-0.2761248, 0.2405296, -0.2707129, 0, 0, 1, 1, 1,
-0.2730379, 0.5189258, -0.369597, 1, 0, 0, 1, 1,
-0.265, 0.4578644, -1.138755, 1, 0, 0, 1, 1,
-0.2618131, -0.4111513, -2.981717, 1, 0, 0, 1, 1,
-0.2600964, -0.9498205, -3.047055, 1, 0, 0, 1, 1,
-0.2575648, 0.1313014, -0.025048, 1, 0, 0, 1, 1,
-0.2520099, 1.378835, -0.9377113, 0, 0, 0, 1, 1,
-0.2515857, -0.8407176, -2.94063, 0, 0, 0, 1, 1,
-0.2511811, 1.390324, 0.6101917, 0, 0, 0, 1, 1,
-0.2511659, 0.6085931, -0.2186204, 0, 0, 0, 1, 1,
-0.2505214, 0.1740045, -2.428755, 0, 0, 0, 1, 1,
-0.2468216, -0.1240539, -2.943008, 0, 0, 0, 1, 1,
-0.2467528, 0.7147965, 0.4365202, 0, 0, 0, 1, 1,
-0.2317601, 0.5385741, -2.055675, 1, 1, 1, 1, 1,
-0.2284908, 1.578884, -0.4020339, 1, 1, 1, 1, 1,
-0.2144473, -0.7743091, -3.578165, 1, 1, 1, 1, 1,
-0.2139503, 0.06469886, -0.1902532, 1, 1, 1, 1, 1,
-0.2085943, 0.3847908, 2.121052, 1, 1, 1, 1, 1,
-0.1987278, 0.7272974, 2.206612, 1, 1, 1, 1, 1,
-0.1979913, -0.4411353, -0.7539871, 1, 1, 1, 1, 1,
-0.1955363, 0.3180976, 0.4605605, 1, 1, 1, 1, 1,
-0.1940127, 0.05177528, -2.042963, 1, 1, 1, 1, 1,
-0.1925951, -0.6776603, -2.871462, 1, 1, 1, 1, 1,
-0.1909011, -0.1051753, -2.122187, 1, 1, 1, 1, 1,
-0.1831857, 0.05038432, 0.804886, 1, 1, 1, 1, 1,
-0.1828967, 0.4579147, -0.4575852, 1, 1, 1, 1, 1,
-0.1795739, 0.4124064, -1.179432, 1, 1, 1, 1, 1,
-0.1775576, 0.004246072, -1.79125, 1, 1, 1, 1, 1,
-0.1775385, 1.868332, -1.389919, 0, 0, 1, 1, 1,
-0.1738372, -0.07472294, -3.094053, 1, 0, 0, 1, 1,
-0.1705556, -0.6348075, -3.529983, 1, 0, 0, 1, 1,
-0.1676218, -0.7876675, -3.052747, 1, 0, 0, 1, 1,
-0.1662817, -0.2131413, -4.045936, 1, 0, 0, 1, 1,
-0.1635325, -0.6448041, -4.345469, 1, 0, 0, 1, 1,
-0.1628479, -0.5607456, -4.724966, 0, 0, 0, 1, 1,
-0.1606049, -0.2365738, -1.88356, 0, 0, 0, 1, 1,
-0.1569962, 1.114109, -0.6507198, 0, 0, 0, 1, 1,
-0.1549437, 1.245362, 0.2080152, 0, 0, 0, 1, 1,
-0.1543334, 0.05370131, -0.8081928, 0, 0, 0, 1, 1,
-0.1535099, -0.4609157, -5.74786, 0, 0, 0, 1, 1,
-0.1521628, -2.131019, -3.77932, 0, 0, 0, 1, 1,
-0.1498609, -0.01825822, -0.677599, 1, 1, 1, 1, 1,
-0.1493224, 1.885763, 0.05720561, 1, 1, 1, 1, 1,
-0.1484555, -1.045777, -0.9951001, 1, 1, 1, 1, 1,
-0.1467605, -0.03718769, -1.736316, 1, 1, 1, 1, 1,
-0.1463117, -0.04308207, -2.165903, 1, 1, 1, 1, 1,
-0.1423716, 1.807936, 0.442213, 1, 1, 1, 1, 1,
-0.1402253, 0.1810122, -2.262435, 1, 1, 1, 1, 1,
-0.13564, 0.4829862, 1.04793, 1, 1, 1, 1, 1,
-0.1351196, 0.3351987, -0.5660031, 1, 1, 1, 1, 1,
-0.1341432, 0.3680188, -0.6889495, 1, 1, 1, 1, 1,
-0.1321926, -1.219856, -2.710191, 1, 1, 1, 1, 1,
-0.1256765, 0.2533821, -2.00934, 1, 1, 1, 1, 1,
-0.1249675, -2.218513, -3.104955, 1, 1, 1, 1, 1,
-0.1121772, 0.06302565, -0.7501527, 1, 1, 1, 1, 1,
-0.1109846, -0.3370128, -1.743251, 1, 1, 1, 1, 1,
-0.107679, 0.1759219, -2.898703, 0, 0, 1, 1, 1,
-0.09833254, 0.09014057, 1.62826, 1, 0, 0, 1, 1,
-0.09786626, 0.8406492, -0.6614433, 1, 0, 0, 1, 1,
-0.09481057, -0.938219, -4.207737, 1, 0, 0, 1, 1,
-0.09170336, -0.121662, -2.050083, 1, 0, 0, 1, 1,
-0.0905625, 1.384788, 0.6013922, 1, 0, 0, 1, 1,
-0.08456568, 1.58336, 2.842354, 0, 0, 0, 1, 1,
-0.08220139, 2.32983, -0.599596, 0, 0, 0, 1, 1,
-0.08147433, -0.7730492, -4.140454, 0, 0, 0, 1, 1,
-0.07843307, 0.6877472, -1.140169, 0, 0, 0, 1, 1,
-0.07755941, -0.06121175, -2.702019, 0, 0, 0, 1, 1,
-0.07032035, -0.1610405, -1.503238, 0, 0, 0, 1, 1,
-0.0675715, 0.857909, -0.1610375, 0, 0, 0, 1, 1,
-0.06706063, -1.208498, -2.29082, 1, 1, 1, 1, 1,
-0.06676735, 0.1141177, -1.012747, 1, 1, 1, 1, 1,
-0.06194964, 1.338468, -0.1659811, 1, 1, 1, 1, 1,
-0.06033314, 0.3010394, -0.6729025, 1, 1, 1, 1, 1,
-0.04292389, 0.8609599, 0.9548276, 1, 1, 1, 1, 1,
-0.02869973, -0.6092707, -4.337382, 1, 1, 1, 1, 1,
-0.02863755, -0.3344279, -5.151748, 1, 1, 1, 1, 1,
-0.02196396, -0.7072436, -4.021736, 1, 1, 1, 1, 1,
-0.02136573, 0.01595881, 0.0098339, 1, 1, 1, 1, 1,
-0.01963451, -0.02040548, -1.310187, 1, 1, 1, 1, 1,
-0.01885128, 0.01842624, -1.434357, 1, 1, 1, 1, 1,
-0.01680787, -1.278605, -4.032472, 1, 1, 1, 1, 1,
-0.01090523, -1.780316, -3.07486, 1, 1, 1, 1, 1,
-0.008140615, -1.156952, -3.579685, 1, 1, 1, 1, 1,
-0.00676362, -0.1072012, -2.403436, 1, 1, 1, 1, 1,
-0.002781263, -0.9978082, -2.699342, 0, 0, 1, 1, 1,
-0.001870911, -1.670613, -1.768272, 1, 0, 0, 1, 1,
0.0005956713, 0.9895888, 0.405647, 1, 0, 0, 1, 1,
0.008398945, 1.260698, 0.7074611, 1, 0, 0, 1, 1,
0.0102513, -1.320284, 2.577786, 1, 0, 0, 1, 1,
0.01103815, -1.085115, 2.974789, 1, 0, 0, 1, 1,
0.0174732, -0.09214419, 3.692292, 0, 0, 0, 1, 1,
0.02097871, -0.5625317, 2.347078, 0, 0, 0, 1, 1,
0.02469459, 1.054733, -0.9505082, 0, 0, 0, 1, 1,
0.02814778, -0.8691663, 2.842147, 0, 0, 0, 1, 1,
0.04140041, 0.3848589, 0.176184, 0, 0, 0, 1, 1,
0.04390919, -1.470136, 0.4164934, 0, 0, 0, 1, 1,
0.04483587, -0.02423726, 2.780928, 0, 0, 0, 1, 1,
0.04643238, -1.637829, 3.131624, 1, 1, 1, 1, 1,
0.04846341, -0.7017647, 2.457925, 1, 1, 1, 1, 1,
0.05259081, -2.056755, 3.700065, 1, 1, 1, 1, 1,
0.06193577, 1.354521, 0.3903251, 1, 1, 1, 1, 1,
0.06703107, 1.485663, -1.532948, 1, 1, 1, 1, 1,
0.07087509, -1.114832, 3.607466, 1, 1, 1, 1, 1,
0.0729747, 1.298057, -0.7691592, 1, 1, 1, 1, 1,
0.07400277, -0.4929032, 2.729301, 1, 1, 1, 1, 1,
0.07431028, -0.1417926, 2.900483, 1, 1, 1, 1, 1,
0.07745117, 0.07892108, -0.02043219, 1, 1, 1, 1, 1,
0.07763493, -0.8324904, 1.79158, 1, 1, 1, 1, 1,
0.07848704, 0.6918949, 0.7411942, 1, 1, 1, 1, 1,
0.07943349, -0.5271785, 3.587654, 1, 1, 1, 1, 1,
0.08927912, -0.9330675, 2.225393, 1, 1, 1, 1, 1,
0.09047177, -1.641183, 4.223309, 1, 1, 1, 1, 1,
0.09365077, -1.206195, 4.538035, 0, 0, 1, 1, 1,
0.09371305, -0.9729732, 2.905028, 1, 0, 0, 1, 1,
0.09784786, -0.3411654, 2.785022, 1, 0, 0, 1, 1,
0.09963168, 0.8946813, 0.1974509, 1, 0, 0, 1, 1,
0.1053419, 0.2030931, 1.596641, 1, 0, 0, 1, 1,
0.1085337, -0.9441615, 2.374199, 1, 0, 0, 1, 1,
0.1115551, 1.177925, 2.344942, 0, 0, 0, 1, 1,
0.1138612, 0.6432285, 0.3139778, 0, 0, 0, 1, 1,
0.1152877, -0.4369275, 1.381667, 0, 0, 0, 1, 1,
0.1170063, -0.159079, 3.019806, 0, 0, 0, 1, 1,
0.1175857, 0.8460838, -1.057843, 0, 0, 0, 1, 1,
0.1178182, -1.271081, 4.398301, 0, 0, 0, 1, 1,
0.1179034, 0.5792856, 1.077336, 0, 0, 0, 1, 1,
0.121405, 0.8301196, -0.1397802, 1, 1, 1, 1, 1,
0.1226793, -1.364197, 1.206631, 1, 1, 1, 1, 1,
0.130475, -0.5819295, 3.387632, 1, 1, 1, 1, 1,
0.1307456, 1.729468, -2.472305, 1, 1, 1, 1, 1,
0.1309761, 0.4167164, -0.3227087, 1, 1, 1, 1, 1,
0.1334817, 0.578002, -0.4580457, 1, 1, 1, 1, 1,
0.1335746, -0.5195209, 2.251854, 1, 1, 1, 1, 1,
0.1354111, -0.06274598, 1.992947, 1, 1, 1, 1, 1,
0.1392754, -0.2763525, 2.341764, 1, 1, 1, 1, 1,
0.1396904, -0.1549089, 0.4654776, 1, 1, 1, 1, 1,
0.1403629, -1.142762, 1.968788, 1, 1, 1, 1, 1,
0.1409907, 0.8612961, 1.531658, 1, 1, 1, 1, 1,
0.1433202, 0.3308591, -1.21002, 1, 1, 1, 1, 1,
0.1459302, -1.277127, 4.514709, 1, 1, 1, 1, 1,
0.1504323, -0.4905529, 4.012813, 1, 1, 1, 1, 1,
0.1564306, 0.1713477, 0.7277886, 0, 0, 1, 1, 1,
0.1567241, 0.2986531, 0.1736099, 1, 0, 0, 1, 1,
0.15815, 0.4521614, 0.4485944, 1, 0, 0, 1, 1,
0.1600475, 1.559222, -0.2982154, 1, 0, 0, 1, 1,
0.1645246, 0.2231851, 1.896523, 1, 0, 0, 1, 1,
0.1646718, -1.03332, 4.026968, 1, 0, 0, 1, 1,
0.1651073, -0.06741848, 1.193095, 0, 0, 0, 1, 1,
0.1720151, -1.204579, 1.759104, 0, 0, 0, 1, 1,
0.1837751, 0.001697543, 1.418332, 0, 0, 0, 1, 1,
0.1897071, -1.011558, 2.268381, 0, 0, 0, 1, 1,
0.1917293, 0.1213813, 1.040649, 0, 0, 0, 1, 1,
0.1917951, -0.1955052, 1.685215, 0, 0, 0, 1, 1,
0.1932737, -0.7426147, 1.959327, 0, 0, 0, 1, 1,
0.1941552, -1.152681, 2.627249, 1, 1, 1, 1, 1,
0.1950234, 0.1091882, 0.4927398, 1, 1, 1, 1, 1,
0.1959109, 0.9893147, 0.3571219, 1, 1, 1, 1, 1,
0.1966255, 0.8283503, 0.2390392, 1, 1, 1, 1, 1,
0.199918, 0.2321408, 0.3851349, 1, 1, 1, 1, 1,
0.2013007, 0.2812428, 1.564201, 1, 1, 1, 1, 1,
0.2039579, -2.937304, 2.291306, 1, 1, 1, 1, 1,
0.2074754, -0.7171878, 3.562612, 1, 1, 1, 1, 1,
0.2105231, 0.9236041, -0.777252, 1, 1, 1, 1, 1,
0.2145883, -1.496194, 3.473538, 1, 1, 1, 1, 1,
0.2152037, 0.4913391, -0.761823, 1, 1, 1, 1, 1,
0.2158098, -0.6550577, 1.747682, 1, 1, 1, 1, 1,
0.2158921, -0.4404698, 3.181839, 1, 1, 1, 1, 1,
0.2166717, 1.269113, 0.5890815, 1, 1, 1, 1, 1,
0.2169162, -0.03276926, 1.019259, 1, 1, 1, 1, 1,
0.21763, 2.325712, 1.278793, 0, 0, 1, 1, 1,
0.2221067, -2.770284, 3.729234, 1, 0, 0, 1, 1,
0.2224838, 0.225946, 1.749423, 1, 0, 0, 1, 1,
0.2330835, -0.3576979, 1.523909, 1, 0, 0, 1, 1,
0.2354435, -0.3730526, 3.245466, 1, 0, 0, 1, 1,
0.2355225, -0.5200948, 2.124239, 1, 0, 0, 1, 1,
0.2365051, -0.330866, 1.726955, 0, 0, 0, 1, 1,
0.2388758, -0.5071104, 4.649246, 0, 0, 0, 1, 1,
0.240376, 0.2801398, 1.218595, 0, 0, 0, 1, 1,
0.2423086, 0.5990355, 1.893131, 0, 0, 0, 1, 1,
0.2427846, 0.05432976, 1.394601, 0, 0, 0, 1, 1,
0.2441817, 0.2406961, 1.926365, 0, 0, 0, 1, 1,
0.2461267, 1.395033, -0.5280158, 0, 0, 0, 1, 1,
0.2491457, 0.1485776, 0.3298925, 1, 1, 1, 1, 1,
0.2492883, 0.1358882, 0.6010998, 1, 1, 1, 1, 1,
0.2504828, 1.623349, 0.2554303, 1, 1, 1, 1, 1,
0.2509739, -0.2918988, 0.4698405, 1, 1, 1, 1, 1,
0.2545287, 1.816228, 0.8267899, 1, 1, 1, 1, 1,
0.2597077, -0.6126236, 3.063469, 1, 1, 1, 1, 1,
0.2617902, -0.3946689, 1.741057, 1, 1, 1, 1, 1,
0.2632087, 2.182418, 0.4408297, 1, 1, 1, 1, 1,
0.2636145, -0.08087298, 2.932332, 1, 1, 1, 1, 1,
0.2648791, -0.457502, 1.819488, 1, 1, 1, 1, 1,
0.2651801, 0.2128856, 1.513644, 1, 1, 1, 1, 1,
0.2719384, 2.494086, 0.7889867, 1, 1, 1, 1, 1,
0.2736806, -0.2207734, 2.151552, 1, 1, 1, 1, 1,
0.2801293, 0.7810929, 2.043138, 1, 1, 1, 1, 1,
0.2829792, 0.7651178, -0.9635291, 1, 1, 1, 1, 1,
0.2920145, 0.8289592, -0.6046045, 0, 0, 1, 1, 1,
0.2964478, -0.3022389, 2.410936, 1, 0, 0, 1, 1,
0.298122, 0.082107, 1.130034, 1, 0, 0, 1, 1,
0.2996391, -0.9363162, 1.85212, 1, 0, 0, 1, 1,
0.3030002, -1.396205, 3.034258, 1, 0, 0, 1, 1,
0.3124531, -0.008523294, 3.277089, 1, 0, 0, 1, 1,
0.3161893, 0.9030164, 0.9307588, 0, 0, 0, 1, 1,
0.3170297, 1.407853, 0.3720434, 0, 0, 0, 1, 1,
0.3191526, -0.5430268, 2.543186, 0, 0, 0, 1, 1,
0.3197057, -1.252464, 2.418284, 0, 0, 0, 1, 1,
0.3201385, 2.558921, 1.558786, 0, 0, 0, 1, 1,
0.3209022, -0.2311531, 1.852013, 0, 0, 0, 1, 1,
0.3254175, 0.0379895, 2.067674, 0, 0, 0, 1, 1,
0.3284755, 0.6991221, 2.938469, 1, 1, 1, 1, 1,
0.3299922, 0.574023, 0.9909905, 1, 1, 1, 1, 1,
0.3307512, 1.686836, 1.013072, 1, 1, 1, 1, 1,
0.3325215, -1.05561, 2.889205, 1, 1, 1, 1, 1,
0.3332722, -1.059229, 4.288082, 1, 1, 1, 1, 1,
0.3338822, -1.128809, 2.299179, 1, 1, 1, 1, 1,
0.335801, 1.796238, -1.016488, 1, 1, 1, 1, 1,
0.3387398, 1.13206, 1.14946, 1, 1, 1, 1, 1,
0.3396864, -0.6466531, 3.499981, 1, 1, 1, 1, 1,
0.3397135, -0.9265558, 3.415334, 1, 1, 1, 1, 1,
0.341497, -1.058187, 2.031507, 1, 1, 1, 1, 1,
0.3432359, -1.937122, 3.764407, 1, 1, 1, 1, 1,
0.3478505, -0.1023145, 1.704517, 1, 1, 1, 1, 1,
0.3524567, 0.5285429, 1.066913, 1, 1, 1, 1, 1,
0.3577278, -0.4238194, 2.501923, 1, 1, 1, 1, 1,
0.3597181, 0.676769, -0.5210178, 0, 0, 1, 1, 1,
0.3611243, 0.5185722, -0.05820311, 1, 0, 0, 1, 1,
0.3623256, 1.123343, 2.37551, 1, 0, 0, 1, 1,
0.3643227, -0.6935077, 1.869949, 1, 0, 0, 1, 1,
0.3711175, 1.04591, 1.23053, 1, 0, 0, 1, 1,
0.3713922, 0.4438252, 1.010164, 1, 0, 0, 1, 1,
0.3720534, -0.0403843, 2.12474, 0, 0, 0, 1, 1,
0.3736103, 0.5933419, 1.739177, 0, 0, 0, 1, 1,
0.3752404, -1.814853, 1.174987, 0, 0, 0, 1, 1,
0.3767991, -1.078276, 2.200772, 0, 0, 0, 1, 1,
0.3797646, -0.2007295, 3.036922, 0, 0, 0, 1, 1,
0.3833238, -0.7478811, 3.14108, 0, 0, 0, 1, 1,
0.3876185, -0.7998653, 0.1472996, 0, 0, 0, 1, 1,
0.3954045, 0.9732028, 0.8368961, 1, 1, 1, 1, 1,
0.3954489, 0.8864198, -0.4134933, 1, 1, 1, 1, 1,
0.3955463, 0.6392974, 0.8135591, 1, 1, 1, 1, 1,
0.3972146, -0.6806307, 4.076252, 1, 1, 1, 1, 1,
0.4057603, 0.1264335, 1.569913, 1, 1, 1, 1, 1,
0.4058666, -1.225337, 3.488061, 1, 1, 1, 1, 1,
0.4071231, -0.9382839, 3.184947, 1, 1, 1, 1, 1,
0.4073211, -0.1346213, 2.128705, 1, 1, 1, 1, 1,
0.407333, 0.7365054, 0.7182992, 1, 1, 1, 1, 1,
0.4100637, 1.104646, 0.8262938, 1, 1, 1, 1, 1,
0.4150803, 0.08266035, 1.569963, 1, 1, 1, 1, 1,
0.4167674, -0.7394871, 2.572685, 1, 1, 1, 1, 1,
0.4216392, -0.773824, 2.74971, 1, 1, 1, 1, 1,
0.4219911, 0.6975591, 1.570906, 1, 1, 1, 1, 1,
0.422662, -0.4972655, 2.31406, 1, 1, 1, 1, 1,
0.424547, -0.9121919, 3.151782, 0, 0, 1, 1, 1,
0.4254107, 2.299646, -0.1051531, 1, 0, 0, 1, 1,
0.4266762, -0.2234258, 1.14569, 1, 0, 0, 1, 1,
0.4351568, 0.4649152, 1.952667, 1, 0, 0, 1, 1,
0.4362203, 1.369691, -0.404448, 1, 0, 0, 1, 1,
0.4401537, -0.738825, 3.379273, 1, 0, 0, 1, 1,
0.4407448, -0.5712925, 2.48693, 0, 0, 0, 1, 1,
0.4417344, -0.3023432, 1.930768, 0, 0, 0, 1, 1,
0.4426584, 0.7594363, 0.1082981, 0, 0, 0, 1, 1,
0.44579, 0.2688507, 1.732683, 0, 0, 0, 1, 1,
0.4460331, 0.5474544, -0.2923604, 0, 0, 0, 1, 1,
0.4483446, 0.9530509, -1.20831, 0, 0, 0, 1, 1,
0.4523571, 0.7718782, 1.237617, 0, 0, 0, 1, 1,
0.4524946, -0.1575118, 3.07893, 1, 1, 1, 1, 1,
0.4528731, 0.6874035, 1.223046, 1, 1, 1, 1, 1,
0.4536115, 0.5973332, 1.529107, 1, 1, 1, 1, 1,
0.4541271, 0.1183245, 1.818347, 1, 1, 1, 1, 1,
0.4547594, 0.5960418, -0.1920998, 1, 1, 1, 1, 1,
0.4574946, 1.038842, -2.161016, 1, 1, 1, 1, 1,
0.4576661, 0.08165666, 2.349186, 1, 1, 1, 1, 1,
0.4577379, -1.337205, 4.007792, 1, 1, 1, 1, 1,
0.4641837, 1.040606, 2.20663, 1, 1, 1, 1, 1,
0.467021, 0.1490871, 0.4020047, 1, 1, 1, 1, 1,
0.4679614, 0.209879, 1.6756, 1, 1, 1, 1, 1,
0.4704677, -0.9325585, 2.492239, 1, 1, 1, 1, 1,
0.4728799, 1.04915, 1.226422, 1, 1, 1, 1, 1,
0.4747201, 0.3924533, 0.2575241, 1, 1, 1, 1, 1,
0.4751288, -0.9294802, 2.299545, 1, 1, 1, 1, 1,
0.4779187, 1.619148, 0.6632174, 0, 0, 1, 1, 1,
0.4820849, 1.116728, 0.9280936, 1, 0, 0, 1, 1,
0.4829388, 2.489039, 0.03368244, 1, 0, 0, 1, 1,
0.483986, -2.094054, 2.396013, 1, 0, 0, 1, 1,
0.4856914, -1.003785, 3.719744, 1, 0, 0, 1, 1,
0.4858508, -0.07713927, 1.718773, 1, 0, 0, 1, 1,
0.4948423, 0.4457744, 1.260318, 0, 0, 0, 1, 1,
0.4959455, -0.9391416, 1.504836, 0, 0, 0, 1, 1,
0.4966174, -0.7177986, 1.951873, 0, 0, 0, 1, 1,
0.4971363, -0.2492788, 2.072405, 0, 0, 0, 1, 1,
0.4971633, -0.7311318, 1.730425, 0, 0, 0, 1, 1,
0.4981129, -0.5944989, 3.116129, 0, 0, 0, 1, 1,
0.4990934, -0.185855, 3.066412, 0, 0, 0, 1, 1,
0.5013894, 0.6559824, 1.243039, 1, 1, 1, 1, 1,
0.5024887, -0.3556441, 3.909384, 1, 1, 1, 1, 1,
0.5046671, -0.5012107, 3.297323, 1, 1, 1, 1, 1,
0.5061606, 1.907951, 0.07201076, 1, 1, 1, 1, 1,
0.5070808, -1.019339, 1.054981, 1, 1, 1, 1, 1,
0.5137072, -0.340024, 1.55484, 1, 1, 1, 1, 1,
0.5141066, 0.01328984, 1.876904, 1, 1, 1, 1, 1,
0.5201029, 0.2060471, 1.047851, 1, 1, 1, 1, 1,
0.5229413, -0.8433148, 3.766298, 1, 1, 1, 1, 1,
0.5237176, 0.6067799, 0.8004845, 1, 1, 1, 1, 1,
0.5276783, 1.486972, 0.811578, 1, 1, 1, 1, 1,
0.5326465, 0.3408343, 0.2477193, 1, 1, 1, 1, 1,
0.5427547, -1.372535, 3.430871, 1, 1, 1, 1, 1,
0.5430169, 0.6176196, 0.3248183, 1, 1, 1, 1, 1,
0.5466532, 1.39801, 0.1028075, 1, 1, 1, 1, 1,
0.5480149, 0.195072, -1.018063, 0, 0, 1, 1, 1,
0.5480163, 0.7760315, 1.687761, 1, 0, 0, 1, 1,
0.5487172, -0.2655474, 2.53704, 1, 0, 0, 1, 1,
0.5493758, 1.225066, -0.6263301, 1, 0, 0, 1, 1,
0.5494331, 0.8130084, 0.1452976, 1, 0, 0, 1, 1,
0.5495257, 0.2209288, -0.2579456, 1, 0, 0, 1, 1,
0.5605049, -1.378536, 1.950254, 0, 0, 0, 1, 1,
0.5647746, 1.730851, 0.2950965, 0, 0, 0, 1, 1,
0.5664693, -1.036088, 1.717215, 0, 0, 0, 1, 1,
0.5699571, 0.3086756, 0.5186186, 0, 0, 0, 1, 1,
0.5705117, 0.1746458, 0.39386, 0, 0, 0, 1, 1,
0.5708362, -0.7075725, 1.450287, 0, 0, 0, 1, 1,
0.5725352, -1.561794, 1.894892, 0, 0, 0, 1, 1,
0.5749027, 0.9953577, 0.7595763, 1, 1, 1, 1, 1,
0.5773504, -0.2435665, 0.6762967, 1, 1, 1, 1, 1,
0.5793981, -0.1069943, 2.977927, 1, 1, 1, 1, 1,
0.5801293, -0.09486661, 2.421547, 1, 1, 1, 1, 1,
0.5809855, -0.1481608, 2.091707, 1, 1, 1, 1, 1,
0.5811838, -2.441802, 3.661694, 1, 1, 1, 1, 1,
0.5846144, -1.254338, 2.517275, 1, 1, 1, 1, 1,
0.5846821, 0.2837374, 1.43798, 1, 1, 1, 1, 1,
0.5848304, 1.750104, 1.353722, 1, 1, 1, 1, 1,
0.5875037, 1.758665, 0.1477058, 1, 1, 1, 1, 1,
0.588318, 0.7860484, -1.005311, 1, 1, 1, 1, 1,
0.590463, 0.09049915, 2.242158, 1, 1, 1, 1, 1,
0.5954878, -0.02452384, 2.124122, 1, 1, 1, 1, 1,
0.5984331, -0.3386407, 3.038649, 1, 1, 1, 1, 1,
0.6001426, -0.2882937, 2.322483, 1, 1, 1, 1, 1,
0.6019021, 2.468754, 0.01754965, 0, 0, 1, 1, 1,
0.6033261, 0.5676564, 0.1119949, 1, 0, 0, 1, 1,
0.6062036, 0.9208789, -0.6237599, 1, 0, 0, 1, 1,
0.608234, -0.1873852, 1.853551, 1, 0, 0, 1, 1,
0.6091177, 1.023714, 0.695972, 1, 0, 0, 1, 1,
0.6158494, -1.538502, 1.752262, 1, 0, 0, 1, 1,
0.6241847, -0.548862, 2.417147, 0, 0, 0, 1, 1,
0.6257331, 0.2317858, 0.2787028, 0, 0, 0, 1, 1,
0.6306713, 2.144873, 0.08718683, 0, 0, 0, 1, 1,
0.6377938, 0.5241033, 0.1724523, 0, 0, 0, 1, 1,
0.6416197, -0.6979753, 1.69403, 0, 0, 0, 1, 1,
0.6424604, -0.7274598, 1.51453, 0, 0, 0, 1, 1,
0.6434069, 0.163214, 2.190889, 0, 0, 0, 1, 1,
0.6444705, 0.7550094, 2.123522, 1, 1, 1, 1, 1,
0.645491, 0.05514038, 1.9472, 1, 1, 1, 1, 1,
0.6459834, -0.4836453, 0.1647867, 1, 1, 1, 1, 1,
0.6555975, -0.08273998, 0.6139656, 1, 1, 1, 1, 1,
0.6689679, -0.2795258, 1.74422, 1, 1, 1, 1, 1,
0.6719285, -0.9209596, 1.956245, 1, 1, 1, 1, 1,
0.672102, -0.4363089, 1.75659, 1, 1, 1, 1, 1,
0.6723141, -0.033011, 1.44346, 1, 1, 1, 1, 1,
0.6723679, -0.2516991, 0.5044886, 1, 1, 1, 1, 1,
0.6780233, -0.5150743, 2.30233, 1, 1, 1, 1, 1,
0.6812738, 0.4148487, 1.545747, 1, 1, 1, 1, 1,
0.683048, 0.2179, 1.953704, 1, 1, 1, 1, 1,
0.6839288, 0.7044793, 0.5253323, 1, 1, 1, 1, 1,
0.685178, -1.433435, 3.046839, 1, 1, 1, 1, 1,
0.6865844, -1.399434, 2.201535, 1, 1, 1, 1, 1,
0.6882701, -0.3066662, 2.149754, 0, 0, 1, 1, 1,
0.6915715, -0.8421369, 3.00896, 1, 0, 0, 1, 1,
0.6961637, 0.4403208, -0.6354376, 1, 0, 0, 1, 1,
0.7092283, 1.279039, 0.08321115, 1, 0, 0, 1, 1,
0.7129546, 1.413837, 0.6573617, 1, 0, 0, 1, 1,
0.7130865, -0.6170899, 2.633592, 1, 0, 0, 1, 1,
0.7132376, 0.4088795, 1.495419, 0, 0, 0, 1, 1,
0.7202912, 0.4147544, 1.55789, 0, 0, 0, 1, 1,
0.7205521, -0.468368, 2.735697, 0, 0, 0, 1, 1,
0.7212906, -0.09392153, -0.6250284, 0, 0, 0, 1, 1,
0.7222459, 1.120231, -1.317711, 0, 0, 0, 1, 1,
0.7223756, -0.5715322, 2.630285, 0, 0, 0, 1, 1,
0.7230501, 0.4394605, 1.531779, 0, 0, 0, 1, 1,
0.7251897, 1.0581, 0.6592765, 1, 1, 1, 1, 1,
0.7304771, 2.718567, -0.01982088, 1, 1, 1, 1, 1,
0.7324923, -0.009686573, 2.096128, 1, 1, 1, 1, 1,
0.7421736, -0.01655229, 3.246168, 1, 1, 1, 1, 1,
0.7448016, -0.08021127, 1.38036, 1, 1, 1, 1, 1,
0.7465785, 0.3061438, 2.514298, 1, 1, 1, 1, 1,
0.7516103, 1.1158, 0.08355181, 1, 1, 1, 1, 1,
0.7587116, -1.078011, 2.153999, 1, 1, 1, 1, 1,
0.7595465, 0.5256103, 0.6558591, 1, 1, 1, 1, 1,
0.761064, -1.404521, 3.257746, 1, 1, 1, 1, 1,
0.7649988, 0.1637921, 2.003846, 1, 1, 1, 1, 1,
0.7786765, 0.150089, 2.104557, 1, 1, 1, 1, 1,
0.787599, -1.327234, 4.140201, 1, 1, 1, 1, 1,
0.790544, -0.1039981, 3.069977, 1, 1, 1, 1, 1,
0.790633, 1.958522, -0.2483384, 1, 1, 1, 1, 1,
0.7929648, -0.7385945, 2.795816, 0, 0, 1, 1, 1,
0.7935283, 0.854333, 1.331205, 1, 0, 0, 1, 1,
0.7950374, 0.3706387, 2.414776, 1, 0, 0, 1, 1,
0.7970185, 0.9284948, -0.3950978, 1, 0, 0, 1, 1,
0.798271, 0.4804758, -0.9975482, 1, 0, 0, 1, 1,
0.8060638, -0.4512544, 1.02159, 1, 0, 0, 1, 1,
0.8116775, -0.4181136, 2.944997, 0, 0, 0, 1, 1,
0.8163472, 0.8766071, 0.905727, 0, 0, 0, 1, 1,
0.8177048, 0.7486948, 0.8227265, 0, 0, 0, 1, 1,
0.8284608, 1.534108, 1.058829, 0, 0, 0, 1, 1,
0.8288013, -0.6129569, 1.569886, 0, 0, 0, 1, 1,
0.8310435, 0.177376, 0.6085653, 0, 0, 0, 1, 1,
0.8373501, -0.2899497, 1.908255, 0, 0, 0, 1, 1,
0.8379607, 0.511984, 1.584589, 1, 1, 1, 1, 1,
0.8422179, 0.2049706, 1.365431, 1, 1, 1, 1, 1,
0.8483753, -0.4791331, 1.815845, 1, 1, 1, 1, 1,
0.8513974, 0.395424, 1.150217, 1, 1, 1, 1, 1,
0.8520801, -1.306734, 2.818813, 1, 1, 1, 1, 1,
0.863461, 0.02344764, -0.3381695, 1, 1, 1, 1, 1,
0.8685731, 1.861319, 0.6125659, 1, 1, 1, 1, 1,
0.8697181, 1.685037, 1.362642, 1, 1, 1, 1, 1,
0.8710739, 0.02503719, 0.717522, 1, 1, 1, 1, 1,
0.8726164, -0.9726927, 2.681386, 1, 1, 1, 1, 1,
0.8739206, -0.9793721, 3.139856, 1, 1, 1, 1, 1,
0.8749377, -0.05526952, 1.711531, 1, 1, 1, 1, 1,
0.880105, 1.376278, 0.8102813, 1, 1, 1, 1, 1,
0.8801638, -0.3015239, 2.533973, 1, 1, 1, 1, 1,
0.8851643, 0.5379201, 0.2618066, 1, 1, 1, 1, 1,
0.8960188, 0.3125672, 2.766804, 0, 0, 1, 1, 1,
0.8967972, -1.003566, 2.468178, 1, 0, 0, 1, 1,
0.8985562, -2.042571, 2.724343, 1, 0, 0, 1, 1,
0.9009557, 1.069105, 1.44217, 1, 0, 0, 1, 1,
0.9047289, -1.325915, 1.651501, 1, 0, 0, 1, 1,
0.9099746, 1.001869, 2.57845, 1, 0, 0, 1, 1,
0.9169459, -0.1982591, 2.278117, 0, 0, 0, 1, 1,
0.9221429, 1.585828, 0.3819295, 0, 0, 0, 1, 1,
0.9224666, -0.6006117, 0.6617998, 0, 0, 0, 1, 1,
0.9252583, -1.230649, 4.326473, 0, 0, 0, 1, 1,
0.9301044, -0.6829377, 1.416707, 0, 0, 0, 1, 1,
0.9347132, 0.5904344, 1.784228, 0, 0, 0, 1, 1,
0.9352489, 1.294632, 2.11306, 0, 0, 0, 1, 1,
0.9370376, -0.6884435, 0.4692546, 1, 1, 1, 1, 1,
0.9429532, 0.4236939, 2.955089, 1, 1, 1, 1, 1,
0.9486452, 0.1881286, 3.387388, 1, 1, 1, 1, 1,
0.9581708, 0.0167568, 0.4884315, 1, 1, 1, 1, 1,
0.9659771, -1.141676, 3.105578, 1, 1, 1, 1, 1,
0.9692433, -0.4359077, 2.191275, 1, 1, 1, 1, 1,
0.970578, -1.068431, 2.534781, 1, 1, 1, 1, 1,
0.9726585, 0.6226394, 1.402982, 1, 1, 1, 1, 1,
0.9736696, 0.8987789, 1.146216, 1, 1, 1, 1, 1,
0.9962361, -0.8267121, 2.176232, 1, 1, 1, 1, 1,
0.9990336, 0.06075509, 0.9866518, 1, 1, 1, 1, 1,
1.002183, -1.567472, 2.399149, 1, 1, 1, 1, 1,
1.013504, 1.660842, 1.490125, 1, 1, 1, 1, 1,
1.017715, -0.2086498, 2.256116, 1, 1, 1, 1, 1,
1.018998, 2.180913, -0.1656509, 1, 1, 1, 1, 1,
1.020126, -0.8358677, 1.969447, 0, 0, 1, 1, 1,
1.021062, -0.4052212, 2.43938, 1, 0, 0, 1, 1,
1.02237, -0.436251, 3.285797, 1, 0, 0, 1, 1,
1.025416, 0.3896656, 2.169018, 1, 0, 0, 1, 1,
1.0272, 1.707987, 0.6196158, 1, 0, 0, 1, 1,
1.030033, 0.4318669, 0.94243, 1, 0, 0, 1, 1,
1.034195, 0.01528032, 0.4054018, 0, 0, 0, 1, 1,
1.038538, -1.216459, 2.380606, 0, 0, 0, 1, 1,
1.039565, -0.4697096, 1.579645, 0, 0, 0, 1, 1,
1.05247, -0.5654914, 1.932348, 0, 0, 0, 1, 1,
1.058339, 0.6948607, 0.08760049, 0, 0, 0, 1, 1,
1.063226, -0.7922118, 2.030356, 0, 0, 0, 1, 1,
1.06503, 0.3719529, 1.41184, 0, 0, 0, 1, 1,
1.070671, -1.159448, 1.245578, 1, 1, 1, 1, 1,
1.071144, -1.277786, 0.2986094, 1, 1, 1, 1, 1,
1.072879, 0.223505, 2.625957, 1, 1, 1, 1, 1,
1.076907, -0.8393167, 1.841205, 1, 1, 1, 1, 1,
1.081469, 0.3069803, 0.6938658, 1, 1, 1, 1, 1,
1.099893, -0.2747172, 2.665203, 1, 1, 1, 1, 1,
1.109576, -0.5291945, 2.033474, 1, 1, 1, 1, 1,
1.110604, 0.624617, 0.006462257, 1, 1, 1, 1, 1,
1.111651, 1.590182, 0.3625654, 1, 1, 1, 1, 1,
1.113005, -1.273646, 4.422886, 1, 1, 1, 1, 1,
1.113163, -1.247771, 5.000819, 1, 1, 1, 1, 1,
1.115767, 0.191538, 1.57681, 1, 1, 1, 1, 1,
1.115873, 0.2566377, 0.01060035, 1, 1, 1, 1, 1,
1.120704, -1.169802, 1.47037, 1, 1, 1, 1, 1,
1.121836, 0.6132888, 1.430796, 1, 1, 1, 1, 1,
1.126979, -0.2530814, 1.172106, 0, 0, 1, 1, 1,
1.130167, 0.445549, 1.816554, 1, 0, 0, 1, 1,
1.132797, 0.7254592, 0.8329863, 1, 0, 0, 1, 1,
1.1407, -0.290635, 2.743637, 1, 0, 0, 1, 1,
1.152852, 0.845494, 1.058475, 1, 0, 0, 1, 1,
1.157626, 0.03162768, 2.095752, 1, 0, 0, 1, 1,
1.158908, 0.005321909, 0.7328533, 0, 0, 0, 1, 1,
1.167285, 0.333955, 2.523389, 0, 0, 0, 1, 1,
1.170419, -3.15607, 2.804826, 0, 0, 0, 1, 1,
1.173886, -0.1261881, 0.1435771, 0, 0, 0, 1, 1,
1.175827, 1.316923, 1.969933, 0, 0, 0, 1, 1,
1.180359, -0.7425411, 1.42832, 0, 0, 0, 1, 1,
1.182128, 2.092476, 0.2247792, 0, 0, 0, 1, 1,
1.186376, -0.1132324, 1.048401, 1, 1, 1, 1, 1,
1.187922, 0.200317, 0.6778683, 1, 1, 1, 1, 1,
1.189024, 0.4336477, -0.7090769, 1, 1, 1, 1, 1,
1.189486, -2.259729, 3.342664, 1, 1, 1, 1, 1,
1.212109, -0.427628, 1.963566, 1, 1, 1, 1, 1,
1.213117, 0.1289599, 1.410151, 1, 1, 1, 1, 1,
1.217586, 0.7897072, -0.05849294, 1, 1, 1, 1, 1,
1.223415, -0.4185625, 1.41129, 1, 1, 1, 1, 1,
1.234987, 1.190428, 1.02317, 1, 1, 1, 1, 1,
1.256438, 1.508708, 2.152073, 1, 1, 1, 1, 1,
1.263863, 0.04192754, 0.9942828, 1, 1, 1, 1, 1,
1.268638, -1.275232, 2.048415, 1, 1, 1, 1, 1,
1.269998, -0.609516, 2.911831, 1, 1, 1, 1, 1,
1.276594, -0.1734107, 1.033354, 1, 1, 1, 1, 1,
1.28047, -0.01290167, 0.2662026, 1, 1, 1, 1, 1,
1.285791, 2.246508, 0.1979321, 0, 0, 1, 1, 1,
1.299436, 1.012933, 2.623667, 1, 0, 0, 1, 1,
1.302075, -0.4361466, 3.45028, 1, 0, 0, 1, 1,
1.303063, 1.226701, 0.6002246, 1, 0, 0, 1, 1,
1.307897, 0.9503356, 0.07114497, 1, 0, 0, 1, 1,
1.316247, -1.955812, 2.888012, 1, 0, 0, 1, 1,
1.323151, 1.1332, 0.5255559, 0, 0, 0, 1, 1,
1.333631, 0.9903704, 1.407098, 0, 0, 0, 1, 1,
1.333707, -0.1208363, 1.483472, 0, 0, 0, 1, 1,
1.335134, -0.407919, 1.659936, 0, 0, 0, 1, 1,
1.36287, 1.072031, 0.1171683, 0, 0, 0, 1, 1,
1.374656, 1.902619, 0.8999977, 0, 0, 0, 1, 1,
1.376565, -0.713924, 2.738803, 0, 0, 0, 1, 1,
1.382284, 0.169924, 3.23177, 1, 1, 1, 1, 1,
1.39197, -1.455669, 4.552766, 1, 1, 1, 1, 1,
1.404947, -1.070246, 2.337725, 1, 1, 1, 1, 1,
1.418707, 0.7592218, 0.7975332, 1, 1, 1, 1, 1,
1.420935, 1.029195, 1.377428, 1, 1, 1, 1, 1,
1.427608, 0.8994111, 1.635221, 1, 1, 1, 1, 1,
1.435469, 0.5559889, 0.5689593, 1, 1, 1, 1, 1,
1.443586, -0.02340396, 0.8123791, 1, 1, 1, 1, 1,
1.444415, -0.7076671, 1.889878, 1, 1, 1, 1, 1,
1.448439, -0.5269313, 1.371752, 1, 1, 1, 1, 1,
1.459264, 0.2647108, 1.992144, 1, 1, 1, 1, 1,
1.462596, 0.1466104, 2.426751, 1, 1, 1, 1, 1,
1.465048, 1.941531, 1.955499, 1, 1, 1, 1, 1,
1.466149, 0.3199614, 4.63756, 1, 1, 1, 1, 1,
1.469059, 0.04970086, 1.875389, 1, 1, 1, 1, 1,
1.493971, 1.15712, 1.559585, 0, 0, 1, 1, 1,
1.497401, -0.3182304, 0.8344061, 1, 0, 0, 1, 1,
1.501105, 0.004400477, -0.4089127, 1, 0, 0, 1, 1,
1.503383, -0.6779835, 3.804134, 1, 0, 0, 1, 1,
1.512142, 0.4961617, 1.811479, 1, 0, 0, 1, 1,
1.525583, -0.04954806, 4.243906, 1, 0, 0, 1, 1,
1.52652, 0.5993357, 1.571898, 0, 0, 0, 1, 1,
1.530984, -1.067838, 2.72608, 0, 0, 0, 1, 1,
1.538202, 0.09948967, 0.1750915, 0, 0, 0, 1, 1,
1.545615, 0.5882748, 2.397583, 0, 0, 0, 1, 1,
1.555967, 0.8636997, 0.2531351, 0, 0, 0, 1, 1,
1.566367, -0.7201892, 0.9374095, 0, 0, 0, 1, 1,
1.586675, -1.406592, 3.409485, 0, 0, 0, 1, 1,
1.587661, -0.2809425, 1.61411, 1, 1, 1, 1, 1,
1.642317, 0.5647969, 2.353299, 1, 1, 1, 1, 1,
1.651, 1.756683, 1.551377, 1, 1, 1, 1, 1,
1.664655, -1.697284, 2.317592, 1, 1, 1, 1, 1,
1.671788, -0.4027677, 2.423906, 1, 1, 1, 1, 1,
1.684694, 0.07574429, 1.609897, 1, 1, 1, 1, 1,
1.686669, 0.2111704, 1.951886, 1, 1, 1, 1, 1,
1.697542, -0.4232011, 1.542967, 1, 1, 1, 1, 1,
1.698722, -0.8964056, 0.8041686, 1, 1, 1, 1, 1,
1.700689, -0.2359042, 2.169551, 1, 1, 1, 1, 1,
1.702283, 0.6122022, 1.980816, 1, 1, 1, 1, 1,
1.72398, 2.181193, -1.149452, 1, 1, 1, 1, 1,
1.732816, -0.4089496, 4.677847, 1, 1, 1, 1, 1,
1.757066, 0.3877709, 0.9494485, 1, 1, 1, 1, 1,
1.760101, 1.52345, 1.11934, 1, 1, 1, 1, 1,
1.761975, -1.078207, 3.152167, 0, 0, 1, 1, 1,
1.771331, -1.361951, 1.211649, 1, 0, 0, 1, 1,
1.771388, -0.6840084, -0.3471092, 1, 0, 0, 1, 1,
1.792686, -1.491029, 3.566528, 1, 0, 0, 1, 1,
1.794342, 0.3225417, 0.695454, 1, 0, 0, 1, 1,
1.802048, -1.310003, 1.911531, 1, 0, 0, 1, 1,
1.804582, -0.5016252, 1.043966, 0, 0, 0, 1, 1,
1.829963, -1.804697, 0.6249695, 0, 0, 0, 1, 1,
1.843295, 2.470689, -0.3149207, 0, 0, 0, 1, 1,
1.846867, -1.060149, 1.331572, 0, 0, 0, 1, 1,
1.851714, -0.1888814, 2.073974, 0, 0, 0, 1, 1,
1.852773, 0.5593712, 2.049667, 0, 0, 0, 1, 1,
1.85353, -1.55519, 3.554173, 0, 0, 0, 1, 1,
1.855744, 1.126308, -0.6129647, 1, 1, 1, 1, 1,
1.902381, 0.06106233, -0.06860145, 1, 1, 1, 1, 1,
1.913625, -0.3618835, 1.456222, 1, 1, 1, 1, 1,
1.919784, -0.4412239, 1.083566, 1, 1, 1, 1, 1,
1.920977, -0.6018556, 0.8526607, 1, 1, 1, 1, 1,
1.945871, 0.3395881, 0.1214491, 1, 1, 1, 1, 1,
1.970293, 2.219047, 0.3646497, 1, 1, 1, 1, 1,
1.971631, -1.236654, 3.682466, 1, 1, 1, 1, 1,
1.99441, 2.232537, 1.155153, 1, 1, 1, 1, 1,
1.996727, -1.060715, 1.484718, 1, 1, 1, 1, 1,
2.038213, 0.1131965, 1.594626, 1, 1, 1, 1, 1,
2.045094, -0.2923287, 1.479681, 1, 1, 1, 1, 1,
2.070057, 0.6395286, 1.248433, 1, 1, 1, 1, 1,
2.126767, 0.783708, 0.3390626, 1, 1, 1, 1, 1,
2.127567, 0.6439887, 0.8808609, 1, 1, 1, 1, 1,
2.128205, -1.013184, 2.206186, 0, 0, 1, 1, 1,
2.12839, 0.1322514, 2.711864, 1, 0, 0, 1, 1,
2.135313, -0.2177082, 0.7372494, 1, 0, 0, 1, 1,
2.176632, 0.1455051, 1.260448, 1, 0, 0, 1, 1,
2.19526, -0.9110893, 0.05531747, 1, 0, 0, 1, 1,
2.208759, -2.166341, 1.772552, 1, 0, 0, 1, 1,
2.284226, 2.095565, 0.9850779, 0, 0, 0, 1, 1,
2.309705, -0.3795337, 2.355093, 0, 0, 0, 1, 1,
2.325081, -0.1056364, 0.8758771, 0, 0, 0, 1, 1,
2.354155, 0.3191265, 3.802089, 0, 0, 0, 1, 1,
2.383811, 0.9273207, 2.86919, 0, 0, 0, 1, 1,
2.4597, 0.2976001, 2.227651, 0, 0, 0, 1, 1,
2.467419, 0.719784, 2.27274, 0, 0, 0, 1, 1,
2.578149, 0.4474822, 1.398883, 1, 1, 1, 1, 1,
2.582837, -1.240623, 1.734662, 1, 1, 1, 1, 1,
2.748552, 1.018097, -0.7346168, 1, 1, 1, 1, 1,
2.820942, 1.113753, -0.1859178, 1, 1, 1, 1, 1,
3.105846, 1.122943, 1.168114, 1, 1, 1, 1, 1,
3.180343, 1.069342, -0.1340554, 1, 1, 1, 1, 1,
3.243772, -1.419266, 2.195399, 1, 1, 1, 1, 1
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
var radius = 9.733997;
var distance = 34.19025;
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
mvMatrix.translate( 0.1084044, -0.1720614, 0.3735209 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.19025);
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